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
-3.271863, 0.06377261, -1.95366, 1, 0, 0, 1,
-3.052138, 0.5447938, -0.7141805, 1, 0.007843138, 0, 1,
-2.975811, 1.072094, -1.452542, 1, 0.01176471, 0, 1,
-2.685259, -0.5136682, -3.032996, 1, 0.01960784, 0, 1,
-2.583219, 1.290135, -0.6517672, 1, 0.02352941, 0, 1,
-2.570284, -0.4860501, -3.35998, 1, 0.03137255, 0, 1,
-2.559205, 0.6469263, -1.834966, 1, 0.03529412, 0, 1,
-2.519516, 0.242047, -1.237114, 1, 0.04313726, 0, 1,
-2.512141, -0.3876949, -2.60127, 1, 0.04705882, 0, 1,
-2.506842, 0.7605819, -2.520919, 1, 0.05490196, 0, 1,
-2.457878, -0.1609498, 0.09257595, 1, 0.05882353, 0, 1,
-2.359133, -0.3734449, -0.01508207, 1, 0.06666667, 0, 1,
-2.344315, 1.030384, -1.039698, 1, 0.07058824, 0, 1,
-2.331516, 1.160063, -1.631399, 1, 0.07843138, 0, 1,
-2.28184, 1.183897, -1.59492, 1, 0.08235294, 0, 1,
-2.208761, -0.9385892, -1.929526, 1, 0.09019608, 0, 1,
-2.167127, 1.029171, -1.908547, 1, 0.09411765, 0, 1,
-2.159133, -0.2374181, -0.2979936, 1, 0.1019608, 0, 1,
-2.139613, 0.4756619, 0.5196424, 1, 0.1098039, 0, 1,
-2.112121, -2.396674, -3.274959, 1, 0.1137255, 0, 1,
-2.078359, -1.31038, -3.753127, 1, 0.1215686, 0, 1,
-2.061248, 0.01401212, -2.723251, 1, 0.1254902, 0, 1,
-2.025774, 0.6688511, -0.270017, 1, 0.1333333, 0, 1,
-2.006932, -0.5778808, -3.52405, 1, 0.1372549, 0, 1,
-1.985822, -0.2047806, -1.253028, 1, 0.145098, 0, 1,
-1.955803, -2.755595, -4.309645, 1, 0.1490196, 0, 1,
-1.952124, 0.7149575, -0.6722698, 1, 0.1568628, 0, 1,
-1.935618, -0.000538661, -0.474552, 1, 0.1607843, 0, 1,
-1.872615, 0.6568682, -0.8488415, 1, 0.1686275, 0, 1,
-1.861234, -0.1675462, -1.722224, 1, 0.172549, 0, 1,
-1.829334, 1.075006, -0.7001342, 1, 0.1803922, 0, 1,
-1.802706, -0.9764504, -0.3892612, 1, 0.1843137, 0, 1,
-1.794165, 0.6025229, -2.190691, 1, 0.1921569, 0, 1,
-1.773464, 1.088707, -2.621838, 1, 0.1960784, 0, 1,
-1.764545, -0.5465797, -2.258669, 1, 0.2039216, 0, 1,
-1.762152, 3.067883, -0.3173256, 1, 0.2117647, 0, 1,
-1.75991, -0.9012675, -0.6694052, 1, 0.2156863, 0, 1,
-1.734351, -0.6994794, -2.41236, 1, 0.2235294, 0, 1,
-1.722926, 0.9828073, -1.237368, 1, 0.227451, 0, 1,
-1.720102, -1.06225, -1.767268, 1, 0.2352941, 0, 1,
-1.707279, 0.07299173, -2.287731, 1, 0.2392157, 0, 1,
-1.701647, -0.7211766, -3.652165, 1, 0.2470588, 0, 1,
-1.699033, 0.5122853, -1.658028, 1, 0.2509804, 0, 1,
-1.696118, 0.899461, 1.178785, 1, 0.2588235, 0, 1,
-1.694424, -1.865069, -3.252622, 1, 0.2627451, 0, 1,
-1.688054, 1.329988, -0.4128455, 1, 0.2705882, 0, 1,
-1.662902, 0.1110096, -0.8729932, 1, 0.2745098, 0, 1,
-1.662422, 0.9483678, 0.03852017, 1, 0.282353, 0, 1,
-1.662283, -0.3826923, -0.150087, 1, 0.2862745, 0, 1,
-1.662272, -1.07568, -2.114022, 1, 0.2941177, 0, 1,
-1.64841, -1.459204, -2.204174, 1, 0.3019608, 0, 1,
-1.622017, 0.3365942, 0.5080038, 1, 0.3058824, 0, 1,
-1.609164, 1.139103, -1.192244, 1, 0.3137255, 0, 1,
-1.588225, 1.138194, 0.6586248, 1, 0.3176471, 0, 1,
-1.572436, 0.00268006, -0.6100516, 1, 0.3254902, 0, 1,
-1.55624, 0.0302726, -0.6909386, 1, 0.3294118, 0, 1,
-1.531935, 0.07249406, -0.7145345, 1, 0.3372549, 0, 1,
-1.527139, 0.7738907, -1.982535, 1, 0.3411765, 0, 1,
-1.525287, 0.07842778, -0.9671527, 1, 0.3490196, 0, 1,
-1.521467, -0.05331652, 0.06856474, 1, 0.3529412, 0, 1,
-1.516261, -1.324966, -0.4602336, 1, 0.3607843, 0, 1,
-1.515078, 0.3764085, -0.5467039, 1, 0.3647059, 0, 1,
-1.508085, 0.1944239, -0.1469113, 1, 0.372549, 0, 1,
-1.507147, -0.2453512, -2.300814, 1, 0.3764706, 0, 1,
-1.505867, -0.2095204, -1.5473, 1, 0.3843137, 0, 1,
-1.504853, 1.087185, -0.773512, 1, 0.3882353, 0, 1,
-1.495495, -1.416997, -0.259863, 1, 0.3960784, 0, 1,
-1.48276, -0.8715187, -2.839303, 1, 0.4039216, 0, 1,
-1.479261, -0.4897713, -1.259931, 1, 0.4078431, 0, 1,
-1.47767, 0.4082341, -1.308612, 1, 0.4156863, 0, 1,
-1.47654, 0.7096711, -0.01370902, 1, 0.4196078, 0, 1,
-1.472667, -0.4721424, -1.378229, 1, 0.427451, 0, 1,
-1.469943, 2.33989, 1.001539, 1, 0.4313726, 0, 1,
-1.465138, -0.05620301, -3.066487, 1, 0.4392157, 0, 1,
-1.463954, 0.6993746, -0.2100319, 1, 0.4431373, 0, 1,
-1.455946, -1.134003, -1.136489, 1, 0.4509804, 0, 1,
-1.444529, -0.5515948, -0.6310053, 1, 0.454902, 0, 1,
-1.440362, -0.3101659, -2.827194, 1, 0.4627451, 0, 1,
-1.440076, -1.207305, -3.088651, 1, 0.4666667, 0, 1,
-1.433145, 0.09813336, -0.6562257, 1, 0.4745098, 0, 1,
-1.422312, 0.8143083, -0.006874699, 1, 0.4784314, 0, 1,
-1.41875, 0.1911748, -1.752079, 1, 0.4862745, 0, 1,
-1.404974, 0.6522221, -0.6149235, 1, 0.4901961, 0, 1,
-1.39936, 0.3584898, -2.482752, 1, 0.4980392, 0, 1,
-1.396202, 0.2318189, -1.627132, 1, 0.5058824, 0, 1,
-1.393345, -0.5850368, -1.812578, 1, 0.509804, 0, 1,
-1.372047, 1.042267, -0.751741, 1, 0.5176471, 0, 1,
-1.371008, -0.8027131, -2.567214, 1, 0.5215687, 0, 1,
-1.365289, 1.462993, -0.7669054, 1, 0.5294118, 0, 1,
-1.355647, 0.5335445, -0.25944, 1, 0.5333334, 0, 1,
-1.34618, -0.06661607, -3.360711, 1, 0.5411765, 0, 1,
-1.343557, -0.4449159, -3.694929, 1, 0.5450981, 0, 1,
-1.340384, 0.8891459, 0.1840235, 1, 0.5529412, 0, 1,
-1.327202, 0.6296801, -1.568121, 1, 0.5568628, 0, 1,
-1.319419, 1.440671, -2.78107, 1, 0.5647059, 0, 1,
-1.316673, -0.5968636, -1.007321, 1, 0.5686275, 0, 1,
-1.313109, -1.505872, -3.310552, 1, 0.5764706, 0, 1,
-1.3076, -0.3485885, -1.363991, 1, 0.5803922, 0, 1,
-1.296591, 0.2092868, -3.203019, 1, 0.5882353, 0, 1,
-1.28495, -0.7148697, -2.613973, 1, 0.5921569, 0, 1,
-1.283974, -1.300063, -1.342302, 1, 0.6, 0, 1,
-1.283592, 0.5820168, -1.642608, 1, 0.6078432, 0, 1,
-1.276316, 0.2872621, -0.9476202, 1, 0.6117647, 0, 1,
-1.267969, 1.021566, -0.1045238, 1, 0.6196079, 0, 1,
-1.265235, -0.469525, -3.082758, 1, 0.6235294, 0, 1,
-1.259979, 0.5569202, -0.1970833, 1, 0.6313726, 0, 1,
-1.257978, -2.113857, -2.457469, 1, 0.6352941, 0, 1,
-1.249957, 0.407836, -0.02738779, 1, 0.6431373, 0, 1,
-1.245546, -1.090533, -3.182793, 1, 0.6470588, 0, 1,
-1.244824, -0.7962129, -2.868616, 1, 0.654902, 0, 1,
-1.229699, 0.9969127, -0.1187445, 1, 0.6588235, 0, 1,
-1.221116, 0.4826901, -2.340193, 1, 0.6666667, 0, 1,
-1.200791, 1.507592, 1.084205, 1, 0.6705883, 0, 1,
-1.199664, -0.8390785, -3.595892, 1, 0.6784314, 0, 1,
-1.199545, 0.2507136, -1.63827, 1, 0.682353, 0, 1,
-1.168229, 0.5439419, -2.164238, 1, 0.6901961, 0, 1,
-1.166742, -0.6325032, -1.858688, 1, 0.6941177, 0, 1,
-1.152415, -1.277066, -2.448883, 1, 0.7019608, 0, 1,
-1.149184, 1.204967, -1.750065, 1, 0.7098039, 0, 1,
-1.144257, -1.295979, -2.098128, 1, 0.7137255, 0, 1,
-1.139537, 0.1857978, -1.404785, 1, 0.7215686, 0, 1,
-1.132538, -0.1069033, -0.8408032, 1, 0.7254902, 0, 1,
-1.12833, -0.9337229, -3.78005, 1, 0.7333333, 0, 1,
-1.126384, -0.2634875, -2.16864, 1, 0.7372549, 0, 1,
-1.125911, 0.04106552, -0.9361861, 1, 0.7450981, 0, 1,
-1.120519, 0.08023509, -2.523097, 1, 0.7490196, 0, 1,
-1.117508, -0.6017189, -1.323195, 1, 0.7568628, 0, 1,
-1.112581, -0.6060274, -2.462688, 1, 0.7607843, 0, 1,
-1.106131, -0.860396, -2.489778, 1, 0.7686275, 0, 1,
-1.102815, 0.1056969, -0.982558, 1, 0.772549, 0, 1,
-1.102488, -1.905103, -3.119874, 1, 0.7803922, 0, 1,
-1.097438, 0.3976307, -0.1484488, 1, 0.7843137, 0, 1,
-1.084785, 1.530286, 0.2642791, 1, 0.7921569, 0, 1,
-1.084205, -0.8980372, -0.9670443, 1, 0.7960784, 0, 1,
-1.082441, 0.669027, -0.1610402, 1, 0.8039216, 0, 1,
-1.079555, -0.3694634, -1.207528, 1, 0.8117647, 0, 1,
-1.077749, 1.017101, 0.3469729, 1, 0.8156863, 0, 1,
-1.053834, 0.08803439, -2.967616, 1, 0.8235294, 0, 1,
-1.050794, -0.5124738, -2.814767, 1, 0.827451, 0, 1,
-1.04999, -0.4237419, -3.369919, 1, 0.8352941, 0, 1,
-1.042633, 0.5251115, -1.559875, 1, 0.8392157, 0, 1,
-1.041243, -0.2215621, -2.06842, 1, 0.8470588, 0, 1,
-1.02075, -0.1175223, -0.8171137, 1, 0.8509804, 0, 1,
-1.016056, 0.1864775, -0.7820047, 1, 0.8588235, 0, 1,
-1.01119, 0.2652026, 0.1613659, 1, 0.8627451, 0, 1,
-1.009763, 0.5484381, -0.3086314, 1, 0.8705882, 0, 1,
-1.002347, 1.009396, -1.89437, 1, 0.8745098, 0, 1,
-0.9973288, 1.17569, 0.3481008, 1, 0.8823529, 0, 1,
-0.9956589, -0.2421886, 0.04850818, 1, 0.8862745, 0, 1,
-0.9891478, 1.176774, -1.53791, 1, 0.8941177, 0, 1,
-0.9823024, -0.7231247, -0.9336573, 1, 0.8980392, 0, 1,
-0.9787175, 0.728839, -0.3276354, 1, 0.9058824, 0, 1,
-0.9762645, -0.2438414, -1.748609, 1, 0.9137255, 0, 1,
-0.9685722, -0.531391, -0.929258, 1, 0.9176471, 0, 1,
-0.9619683, 1.914952, -1.828046, 1, 0.9254902, 0, 1,
-0.9606923, -0.03910119, -0.560522, 1, 0.9294118, 0, 1,
-0.9548221, -0.06820033, -2.043378, 1, 0.9372549, 0, 1,
-0.9515656, 0.3742853, -0.74839, 1, 0.9411765, 0, 1,
-0.9414307, -0.1008526, -2.22877, 1, 0.9490196, 0, 1,
-0.9398592, 0.8612667, -0.762818, 1, 0.9529412, 0, 1,
-0.9326359, -1.021462, -2.10081, 1, 0.9607843, 0, 1,
-0.9299034, -0.398419, -4.174711, 1, 0.9647059, 0, 1,
-0.9229671, -1.65362, -1.878627, 1, 0.972549, 0, 1,
-0.9176586, -3.1106, -3.766247, 1, 0.9764706, 0, 1,
-0.9166478, 0.7596887, -3.089572, 1, 0.9843137, 0, 1,
-0.9146541, -0.01663145, -0.5401597, 1, 0.9882353, 0, 1,
-0.9129115, -0.3603822, -4.38611, 1, 0.9960784, 0, 1,
-0.9098446, 0.9697891, -0.177775, 0.9960784, 1, 0, 1,
-0.9096157, 0.07677475, 0.0997669, 0.9921569, 1, 0, 1,
-0.8984475, 0.8856632, -1.591305, 0.9843137, 1, 0, 1,
-0.897085, -1.194566, -2.974928, 0.9803922, 1, 0, 1,
-0.8935102, -0.7259927, -1.094074, 0.972549, 1, 0, 1,
-0.8926722, 0.6900572, -1.002329, 0.9686275, 1, 0, 1,
-0.891687, 0.09819078, 0.3762161, 0.9607843, 1, 0, 1,
-0.8914982, -0.3394825, -1.10658, 0.9568627, 1, 0, 1,
-0.8906077, 0.1960074, -1.60666, 0.9490196, 1, 0, 1,
-0.8890628, 0.904048, -1.856469, 0.945098, 1, 0, 1,
-0.8881704, -1.096856, -1.830039, 0.9372549, 1, 0, 1,
-0.8850106, -0.1205088, -1.834217, 0.9333333, 1, 0, 1,
-0.8808588, -0.2390119, -0.6446069, 0.9254902, 1, 0, 1,
-0.8781492, -0.1357976, -2.12194, 0.9215686, 1, 0, 1,
-0.8725615, 0.9694859, -1.677803, 0.9137255, 1, 0, 1,
-0.8511429, -2.735291, -1.669626, 0.9098039, 1, 0, 1,
-0.8497545, -0.4538288, -1.500266, 0.9019608, 1, 0, 1,
-0.8484328, 0.5810511, -1.729958, 0.8941177, 1, 0, 1,
-0.8474207, -1.417715, -2.255698, 0.8901961, 1, 0, 1,
-0.8393927, 1.238129, 0.04558249, 0.8823529, 1, 0, 1,
-0.8329268, -0.7649735, -1.27043, 0.8784314, 1, 0, 1,
-0.8324929, -0.3125105, -2.418718, 0.8705882, 1, 0, 1,
-0.8305097, -1.366751, -3.595433, 0.8666667, 1, 0, 1,
-0.8299111, -0.2497621, -2.490934, 0.8588235, 1, 0, 1,
-0.8285309, 1.418417, 0.46552, 0.854902, 1, 0, 1,
-0.8268137, -0.5486871, -2.863126, 0.8470588, 1, 0, 1,
-0.8172646, -0.1943992, -1.210861, 0.8431373, 1, 0, 1,
-0.8159575, -1.092422, -2.004724, 0.8352941, 1, 0, 1,
-0.8101764, -0.9277486, -1.724952, 0.8313726, 1, 0, 1,
-0.8075287, -0.6315019, -3.180093, 0.8235294, 1, 0, 1,
-0.8006312, 0.6807793, -1.615239, 0.8196079, 1, 0, 1,
-0.7976668, 0.4760814, -1.420378, 0.8117647, 1, 0, 1,
-0.7959269, 0.933982, -2.606705, 0.8078431, 1, 0, 1,
-0.7846045, 0.3365812, 1.231819, 0.8, 1, 0, 1,
-0.7812502, 1.017654, 0.3050818, 0.7921569, 1, 0, 1,
-0.7802827, -0.5912265, -2.046457, 0.7882353, 1, 0, 1,
-0.7760293, 0.1056394, -0.158036, 0.7803922, 1, 0, 1,
-0.7737201, 0.1960396, -1.891493, 0.7764706, 1, 0, 1,
-0.7719343, -0.6375241, -3.598255, 0.7686275, 1, 0, 1,
-0.7688157, -0.7920922, -3.071151, 0.7647059, 1, 0, 1,
-0.7643255, -0.7388389, -1.613658, 0.7568628, 1, 0, 1,
-0.7611874, 0.1759783, -0.8062175, 0.7529412, 1, 0, 1,
-0.7595479, -0.7274501, -3.703135, 0.7450981, 1, 0, 1,
-0.7587355, -0.3711579, -2.975363, 0.7411765, 1, 0, 1,
-0.7495968, -0.9570724, -0.3110443, 0.7333333, 1, 0, 1,
-0.7486626, -0.4589011, -1.857522, 0.7294118, 1, 0, 1,
-0.7460911, -0.3581378, -2.153092, 0.7215686, 1, 0, 1,
-0.7451666, -0.3107327, -2.235631, 0.7176471, 1, 0, 1,
-0.7286747, -0.2393573, -3.90369, 0.7098039, 1, 0, 1,
-0.7280695, -1.26204, -3.455517, 0.7058824, 1, 0, 1,
-0.7279328, -0.00767629, -2.204926, 0.6980392, 1, 0, 1,
-0.7250141, 0.9797912, 0.7793208, 0.6901961, 1, 0, 1,
-0.7116686, 0.9354621, -0.4658455, 0.6862745, 1, 0, 1,
-0.7097694, 0.4011945, -2.866074, 0.6784314, 1, 0, 1,
-0.7095846, 0.07480701, -0.535795, 0.6745098, 1, 0, 1,
-0.7065459, 1.306863, -0.7432602, 0.6666667, 1, 0, 1,
-0.7050804, -1.173275, -3.425085, 0.6627451, 1, 0, 1,
-0.7004365, 1.782057, -0.9685317, 0.654902, 1, 0, 1,
-0.6993448, 1.135027, -0.3209631, 0.6509804, 1, 0, 1,
-0.6992019, -0.04652604, -1.198875, 0.6431373, 1, 0, 1,
-0.6991855, -1.462539, -3.69098, 0.6392157, 1, 0, 1,
-0.6982177, 0.3747111, -1.344667, 0.6313726, 1, 0, 1,
-0.696948, -0.2079592, -1.621569, 0.627451, 1, 0, 1,
-0.6959069, -1.528877, -3.135907, 0.6196079, 1, 0, 1,
-0.6935939, -0.3591418, -1.638278, 0.6156863, 1, 0, 1,
-0.692941, -0.5290467, -1.424284, 0.6078432, 1, 0, 1,
-0.6921315, -1.527098, -3.46529, 0.6039216, 1, 0, 1,
-0.6907688, 1.119635, -0.7509202, 0.5960785, 1, 0, 1,
-0.6900313, -0.8091015, -1.719367, 0.5882353, 1, 0, 1,
-0.6881484, 1.75445, 0.2126498, 0.5843138, 1, 0, 1,
-0.6859507, 0.4736981, -0.5539302, 0.5764706, 1, 0, 1,
-0.6831832, 1.669754, 0.9573458, 0.572549, 1, 0, 1,
-0.6789177, -1.093572, -2.962251, 0.5647059, 1, 0, 1,
-0.6762186, -0.2594937, -3.880483, 0.5607843, 1, 0, 1,
-0.6699609, -1.117524, -1.926068, 0.5529412, 1, 0, 1,
-0.6680583, -0.1876368, -1.139166, 0.5490196, 1, 0, 1,
-0.6667169, -0.6306075, -1.499201, 0.5411765, 1, 0, 1,
-0.6632328, -0.5348069, -2.35097, 0.5372549, 1, 0, 1,
-0.6607761, -0.0863895, -1.596256, 0.5294118, 1, 0, 1,
-0.6455278, -1.728712, -2.802078, 0.5254902, 1, 0, 1,
-0.6446009, -0.4868645, -1.014371, 0.5176471, 1, 0, 1,
-0.6306273, 2.032273, 0.5836589, 0.5137255, 1, 0, 1,
-0.62633, 0.08932276, -1.459247, 0.5058824, 1, 0, 1,
-0.6246724, -1.287868, -2.40281, 0.5019608, 1, 0, 1,
-0.6215649, -0.4383586, -1.60624, 0.4941176, 1, 0, 1,
-0.6193533, -0.02871221, -2.348266, 0.4862745, 1, 0, 1,
-0.6156002, 1.926689, 0.222317, 0.4823529, 1, 0, 1,
-0.6130806, -0.1654884, -0.9225881, 0.4745098, 1, 0, 1,
-0.612765, 1.532761, -0.4375796, 0.4705882, 1, 0, 1,
-0.6081724, -0.1138078, -0.9452613, 0.4627451, 1, 0, 1,
-0.6074544, 0.3494259, -2.516097, 0.4588235, 1, 0, 1,
-0.5997323, 0.9853175, 0.242284, 0.4509804, 1, 0, 1,
-0.5987644, -0.1260497, -2.122554, 0.4470588, 1, 0, 1,
-0.5949596, 0.5377873, -0.8889172, 0.4392157, 1, 0, 1,
-0.5940052, 0.3528239, -2.025103, 0.4352941, 1, 0, 1,
-0.5773215, -0.9028966, -2.934915, 0.427451, 1, 0, 1,
-0.5755026, 0.1286411, -0.1651739, 0.4235294, 1, 0, 1,
-0.5754285, 1.09989, -0.683337, 0.4156863, 1, 0, 1,
-0.575085, -2.274418, -2.503087, 0.4117647, 1, 0, 1,
-0.5697383, 0.0003775693, -0.924577, 0.4039216, 1, 0, 1,
-0.5641053, -0.6447998, -3.222328, 0.3960784, 1, 0, 1,
-0.5629406, -1.114173, -3.509852, 0.3921569, 1, 0, 1,
-0.5623452, 0.7544906, 0.8010389, 0.3843137, 1, 0, 1,
-0.5620549, -1.828296, -2.729646, 0.3803922, 1, 0, 1,
-0.5583996, -0.1285978, -1.618277, 0.372549, 1, 0, 1,
-0.5571496, 0.4927894, 0.1887314, 0.3686275, 1, 0, 1,
-0.550851, 0.6082644, -1.595615, 0.3607843, 1, 0, 1,
-0.5501283, -0.2575062, -2.013379, 0.3568628, 1, 0, 1,
-0.5498638, -1.86, -2.301675, 0.3490196, 1, 0, 1,
-0.5465747, -0.4448839, -0.9159615, 0.345098, 1, 0, 1,
-0.5419517, -1.077729, -4.228849, 0.3372549, 1, 0, 1,
-0.5404346, 1.250869, -1.550153, 0.3333333, 1, 0, 1,
-0.5394333, 1.007211, 0.2555295, 0.3254902, 1, 0, 1,
-0.5377273, -1.194801, -4.501217, 0.3215686, 1, 0, 1,
-0.5362458, -0.3672287, -4.563817, 0.3137255, 1, 0, 1,
-0.5341775, -3.043857, -4.560622, 0.3098039, 1, 0, 1,
-0.528116, 0.2945287, 0.3676723, 0.3019608, 1, 0, 1,
-0.5196334, -0.657683, -2.448315, 0.2941177, 1, 0, 1,
-0.5192313, -0.1002747, -3.27945, 0.2901961, 1, 0, 1,
-0.5167363, -0.5846487, -3.997789, 0.282353, 1, 0, 1,
-0.5090263, -0.03143319, -1.120731, 0.2784314, 1, 0, 1,
-0.5075207, 0.4798447, 0.06899092, 0.2705882, 1, 0, 1,
-0.5032801, 0.3594809, -0.391455, 0.2666667, 1, 0, 1,
-0.5017688, 0.210757, -2.850514, 0.2588235, 1, 0, 1,
-0.500013, 1.782896, 0.16522, 0.254902, 1, 0, 1,
-0.4991986, 0.6618162, 0.4211693, 0.2470588, 1, 0, 1,
-0.4912626, 1.024316, 0.06479445, 0.2431373, 1, 0, 1,
-0.4880034, 0.3522124, -1.814124, 0.2352941, 1, 0, 1,
-0.4862115, -0.1051216, -2.198153, 0.2313726, 1, 0, 1,
-0.4852341, -0.07191253, 0.02042124, 0.2235294, 1, 0, 1,
-0.4851133, -0.06780102, -2.384829, 0.2196078, 1, 0, 1,
-0.4760388, 0.09803969, -1.528687, 0.2117647, 1, 0, 1,
-0.4726075, 1.070579, -1.907813, 0.2078431, 1, 0, 1,
-0.4722519, -0.821565, -1.990556, 0.2, 1, 0, 1,
-0.4718393, -0.1928378, -2.349961, 0.1921569, 1, 0, 1,
-0.4677437, 1.835149, -0.3729204, 0.1882353, 1, 0, 1,
-0.467447, -2.289775, -2.224877, 0.1803922, 1, 0, 1,
-0.4669624, 1.266113, -1.513889, 0.1764706, 1, 0, 1,
-0.4658549, 0.1449147, -1.230432, 0.1686275, 1, 0, 1,
-0.4645645, -0.9500236, -1.063196, 0.1647059, 1, 0, 1,
-0.4557835, -0.5984203, -1.80474, 0.1568628, 1, 0, 1,
-0.4527523, 0.03443668, -0.9461088, 0.1529412, 1, 0, 1,
-0.4524398, 0.5070015, -2.204941, 0.145098, 1, 0, 1,
-0.4491196, -1.007755, -2.69006, 0.1411765, 1, 0, 1,
-0.4467462, 0.8619761, -1.376246, 0.1333333, 1, 0, 1,
-0.4449675, 0.534596, -0.6714915, 0.1294118, 1, 0, 1,
-0.4445522, 2.205222, -1.200218, 0.1215686, 1, 0, 1,
-0.4427895, 1.076565, 0.213218, 0.1176471, 1, 0, 1,
-0.4398598, 1.59574, -0.6414057, 0.1098039, 1, 0, 1,
-0.4357207, -1.45411, -4.30228, 0.1058824, 1, 0, 1,
-0.4330715, 0.3805891, 0.07646763, 0.09803922, 1, 0, 1,
-0.431376, 0.9061164, -0.6578668, 0.09019608, 1, 0, 1,
-0.4179723, 0.256973, -1.053407, 0.08627451, 1, 0, 1,
-0.4172999, 0.3591822, -1.257688, 0.07843138, 1, 0, 1,
-0.4117805, 0.4215852, -1.099562, 0.07450981, 1, 0, 1,
-0.4045142, 0.132557, -2.78853, 0.06666667, 1, 0, 1,
-0.4014505, 1.228097, 0.09577778, 0.0627451, 1, 0, 1,
-0.4004278, -0.9512722, -3.475312, 0.05490196, 1, 0, 1,
-0.3957886, -0.3681803, -2.582642, 0.05098039, 1, 0, 1,
-0.3914894, -0.2806634, -2.743486, 0.04313726, 1, 0, 1,
-0.3908357, -0.2324263, -0.8217152, 0.03921569, 1, 0, 1,
-0.3903643, 0.1690022, -2.315973, 0.03137255, 1, 0, 1,
-0.3896914, -0.2942701, -1.886755, 0.02745098, 1, 0, 1,
-0.3891359, -0.4079909, -1.14087, 0.01960784, 1, 0, 1,
-0.3888892, 0.2624786, -2.205181, 0.01568628, 1, 0, 1,
-0.3799767, -0.03836402, -0.4547721, 0.007843138, 1, 0, 1,
-0.376585, -0.01808284, -1.548853, 0.003921569, 1, 0, 1,
-0.3762786, 0.5641361, 0.07059936, 0, 1, 0.003921569, 1,
-0.3746003, -0.3134106, -1.392789, 0, 1, 0.01176471, 1,
-0.3736042, 1.330021, -0.4584747, 0, 1, 0.01568628, 1,
-0.371521, 0.1384369, -2.403554, 0, 1, 0.02352941, 1,
-0.367406, 0.2586675, -0.8581071, 0, 1, 0.02745098, 1,
-0.3664081, -1.036238, -2.639899, 0, 1, 0.03529412, 1,
-0.3645757, -1.133691, -2.901026, 0, 1, 0.03921569, 1,
-0.3619706, 1.567413, -0.3210366, 0, 1, 0.04705882, 1,
-0.36107, 0.4209143, 0.1782809, 0, 1, 0.05098039, 1,
-0.3603923, 0.5703548, -0.2745242, 0, 1, 0.05882353, 1,
-0.3583211, 1.131842, -0.8496605, 0, 1, 0.0627451, 1,
-0.3574913, -0.5123004, -1.725977, 0, 1, 0.07058824, 1,
-0.3561461, -0.5536225, -3.595429, 0, 1, 0.07450981, 1,
-0.3561105, -0.6618013, -3.113008, 0, 1, 0.08235294, 1,
-0.352003, -0.6047517, -1.282757, 0, 1, 0.08627451, 1,
-0.3484223, -0.9023042, -3.525633, 0, 1, 0.09411765, 1,
-0.348111, -1.365731, -3.377815, 0, 1, 0.1019608, 1,
-0.3468615, 0.2731707, 0.3591411, 0, 1, 0.1058824, 1,
-0.3411884, -0.1623169, -1.407495, 0, 1, 0.1137255, 1,
-0.3378114, 2.017957, -0.3028228, 0, 1, 0.1176471, 1,
-0.3335364, 0.3050162, 0.2227256, 0, 1, 0.1254902, 1,
-0.3299292, 0.8535567, -0.001233546, 0, 1, 0.1294118, 1,
-0.3251291, -1.545215, -4.273354, 0, 1, 0.1372549, 1,
-0.3242479, 0.7256452, 0.5363241, 0, 1, 0.1411765, 1,
-0.3171832, 0.8363567, -1.207855, 0, 1, 0.1490196, 1,
-0.3073079, 0.4774128, 0.4537829, 0, 1, 0.1529412, 1,
-0.3015921, 1.738776, 0.3316053, 0, 1, 0.1607843, 1,
-0.3004526, 2.269087, 0.8708777, 0, 1, 0.1647059, 1,
-0.2975608, 0.3812953, -1.922495, 0, 1, 0.172549, 1,
-0.2967757, 1.528324, 0.5617969, 0, 1, 0.1764706, 1,
-0.2964827, 1.802331, -0.9198828, 0, 1, 0.1843137, 1,
-0.294763, 1.734854, -0.02081151, 0, 1, 0.1882353, 1,
-0.2947602, 0.2591005, -1.254768, 0, 1, 0.1960784, 1,
-0.2919761, -0.6058112, -3.063652, 0, 1, 0.2039216, 1,
-0.2899851, -0.2812164, -1.907718, 0, 1, 0.2078431, 1,
-0.2898973, -0.7594571, -2.085726, 0, 1, 0.2156863, 1,
-0.2872461, -1.704325, -2.230142, 0, 1, 0.2196078, 1,
-0.2870383, 0.8340672, 0.5851329, 0, 1, 0.227451, 1,
-0.2842121, -0.1555636, -0.7795563, 0, 1, 0.2313726, 1,
-0.2716056, 0.6492013, -1.432722, 0, 1, 0.2392157, 1,
-0.2680041, -2.347005, -3.087608, 0, 1, 0.2431373, 1,
-0.2671291, 0.8877686, -1.038627, 0, 1, 0.2509804, 1,
-0.2670063, 1.235369, 0.6090081, 0, 1, 0.254902, 1,
-0.2639836, -1.102571, -3.734547, 0, 1, 0.2627451, 1,
-0.2629683, -0.3611189, -2.187604, 0, 1, 0.2666667, 1,
-0.2620578, 0.8118877, -0.2613773, 0, 1, 0.2745098, 1,
-0.2593504, 0.497292, -0.6587703, 0, 1, 0.2784314, 1,
-0.2569202, 0.6884883, -0.6333795, 0, 1, 0.2862745, 1,
-0.2559399, 1.560387, -0.5466279, 0, 1, 0.2901961, 1,
-0.2545547, -0.8084054, -2.615076, 0, 1, 0.2980392, 1,
-0.2503133, -0.7569076, -1.408494, 0, 1, 0.3058824, 1,
-0.2454791, -0.3119477, -2.164452, 0, 1, 0.3098039, 1,
-0.245332, -0.820775, -2.514977, 0, 1, 0.3176471, 1,
-0.2439056, 1.049377, -1.796953, 0, 1, 0.3215686, 1,
-0.2421694, -0.698974, -0.6248409, 0, 1, 0.3294118, 1,
-0.2396707, 0.2834338, -0.336651, 0, 1, 0.3333333, 1,
-0.2393019, 0.9145738, -0.714293, 0, 1, 0.3411765, 1,
-0.2327106, 0.04900344, -1.469762, 0, 1, 0.345098, 1,
-0.2315003, -0.8037496, -2.42077, 0, 1, 0.3529412, 1,
-0.2276613, 1.177107, 0.8755249, 0, 1, 0.3568628, 1,
-0.2219494, 0.3598616, -0.8262222, 0, 1, 0.3647059, 1,
-0.2139685, 1.724012, 1.525181, 0, 1, 0.3686275, 1,
-0.2136137, -0.5706614, -2.76522, 0, 1, 0.3764706, 1,
-0.2104033, -0.2330722, -2.250907, 0, 1, 0.3803922, 1,
-0.2092718, 0.1780253, 0.3158688, 0, 1, 0.3882353, 1,
-0.2091998, -0.8153601, -1.486626, 0, 1, 0.3921569, 1,
-0.2077148, -0.1683684, -1.285227, 0, 1, 0.4, 1,
-0.2021962, -0.7500825, -2.205798, 0, 1, 0.4078431, 1,
-0.2016001, -1.837814, -3.585696, 0, 1, 0.4117647, 1,
-0.1943496, -0.4025857, -3.218715, 0, 1, 0.4196078, 1,
-0.1929003, -0.4831697, -4.348907, 0, 1, 0.4235294, 1,
-0.192297, 0.03202626, -2.679525, 0, 1, 0.4313726, 1,
-0.1885621, 0.3568006, 0.01933407, 0, 1, 0.4352941, 1,
-0.185212, 2.088567, -0.09135315, 0, 1, 0.4431373, 1,
-0.1834091, -1.273109, -2.696992, 0, 1, 0.4470588, 1,
-0.179672, -0.07662444, -2.160797, 0, 1, 0.454902, 1,
-0.1789271, 0.3279123, -2.477876, 0, 1, 0.4588235, 1,
-0.1773891, -0.4481003, -1.008919, 0, 1, 0.4666667, 1,
-0.1763963, -0.390619, -3.635026, 0, 1, 0.4705882, 1,
-0.1735016, -0.09847569, -2.027041, 0, 1, 0.4784314, 1,
-0.1693532, -1.52776, -2.629742, 0, 1, 0.4823529, 1,
-0.1644691, 0.7739877, -0.2872957, 0, 1, 0.4901961, 1,
-0.1615683, -0.01791828, -0.4934438, 0, 1, 0.4941176, 1,
-0.1615621, -1.081284, -2.873898, 0, 1, 0.5019608, 1,
-0.1597989, 1.052181, 0.3198971, 0, 1, 0.509804, 1,
-0.1568614, -0.4130525, -1.890274, 0, 1, 0.5137255, 1,
-0.1549706, 3.557854, 0.3358771, 0, 1, 0.5215687, 1,
-0.1508588, -1.420005, -2.414749, 0, 1, 0.5254902, 1,
-0.1504582, 1.413146, 0.4794106, 0, 1, 0.5333334, 1,
-0.1481118, -1.843606, -2.876401, 0, 1, 0.5372549, 1,
-0.1464054, 0.5528191, -1.519894, 0, 1, 0.5450981, 1,
-0.1460004, 1.584505, 0.7987651, 0, 1, 0.5490196, 1,
-0.141307, -0.3335513, -2.739329, 0, 1, 0.5568628, 1,
-0.1405, -0.2312409, -1.207971, 0, 1, 0.5607843, 1,
-0.1403107, -0.5600694, -4.777567, 0, 1, 0.5686275, 1,
-0.1369247, 0.1132722, -0.820518, 0, 1, 0.572549, 1,
-0.1362927, 0.2814786, -0.6817439, 0, 1, 0.5803922, 1,
-0.1347206, 0.8321345, -1.848662, 0, 1, 0.5843138, 1,
-0.1341794, 0.3546904, -0.4704324, 0, 1, 0.5921569, 1,
-0.1338614, 1.238337, 0.3785744, 0, 1, 0.5960785, 1,
-0.1294276, -1.71902, -1.737988, 0, 1, 0.6039216, 1,
-0.1272508, -2.167814, -1.628354, 0, 1, 0.6117647, 1,
-0.1268257, -0.7197593, -3.046502, 0, 1, 0.6156863, 1,
-0.1224063, 0.2590148, 0.1813148, 0, 1, 0.6235294, 1,
-0.1184691, -0.5598468, -2.645653, 0, 1, 0.627451, 1,
-0.116949, 0.2696932, -1.205903, 0, 1, 0.6352941, 1,
-0.1149528, 0.2602495, 0.3210166, 0, 1, 0.6392157, 1,
-0.1031462, -0.7051314, -3.291245, 0, 1, 0.6470588, 1,
-0.1003718, 0.8533848, -0.3983963, 0, 1, 0.6509804, 1,
-0.09998241, 0.372004, -0.5301816, 0, 1, 0.6588235, 1,
-0.09778694, 0.2389148, -0.3558037, 0, 1, 0.6627451, 1,
-0.09533903, -0.8420297, -3.223726, 0, 1, 0.6705883, 1,
-0.08674748, -0.5626245, -2.922288, 0, 1, 0.6745098, 1,
-0.08392294, -0.8282613, -3.211771, 0, 1, 0.682353, 1,
-0.08319187, -2.386096, -2.983633, 0, 1, 0.6862745, 1,
-0.07672814, -0.5923384, -3.405735, 0, 1, 0.6941177, 1,
-0.07253297, 0.9325016, -0.929624, 0, 1, 0.7019608, 1,
-0.07158029, 1.723641, -0.7239103, 0, 1, 0.7058824, 1,
-0.07111143, -0.0103914, -2.815996, 0, 1, 0.7137255, 1,
-0.06138131, -0.4504395, -3.90687, 0, 1, 0.7176471, 1,
-0.06115226, 0.1031654, -1.679695, 0, 1, 0.7254902, 1,
-0.06099663, -0.1768575, -4.542162, 0, 1, 0.7294118, 1,
-0.06097157, -1.112904, -1.963022, 0, 1, 0.7372549, 1,
-0.05832504, 0.9704359, -1.460844, 0, 1, 0.7411765, 1,
-0.05827122, 1.285437, 0.6267866, 0, 1, 0.7490196, 1,
-0.0548346, -0.9417568, -1.551712, 0, 1, 0.7529412, 1,
-0.05318621, -0.1129816, -2.541053, 0, 1, 0.7607843, 1,
-0.05229624, -0.8266192, -3.614746, 0, 1, 0.7647059, 1,
-0.05208344, 2.393284, -1.023512, 0, 1, 0.772549, 1,
-0.04426967, 0.1811478, -1.990216, 0, 1, 0.7764706, 1,
-0.0380565, 0.7322502, 0.1542619, 0, 1, 0.7843137, 1,
-0.03661048, 0.2796972, 0.9182419, 0, 1, 0.7882353, 1,
-0.03271881, -0.463334, -2.837671, 0, 1, 0.7960784, 1,
-0.02750668, -0.2396312, -4.017542, 0, 1, 0.8039216, 1,
-0.02509651, 0.2549112, 0.2888475, 0, 1, 0.8078431, 1,
-0.02363968, 0.01970095, -0.4904698, 0, 1, 0.8156863, 1,
-0.02363678, 0.4023824, 1.062682, 0, 1, 0.8196079, 1,
-0.02320714, 0.1621041, 0.5518268, 0, 1, 0.827451, 1,
-0.01826027, -0.4348788, -3.242757, 0, 1, 0.8313726, 1,
-0.01764341, 0.08938723, -0.5389043, 0, 1, 0.8392157, 1,
-0.01648733, -1.294041, -3.202818, 0, 1, 0.8431373, 1,
-0.01534786, -1.134243, -2.371394, 0, 1, 0.8509804, 1,
-0.01399804, 0.2143597, -0.1929302, 0, 1, 0.854902, 1,
-0.01389533, 1.752521, -1.793004, 0, 1, 0.8627451, 1,
-0.012293, 1.382071, 0.659296, 0, 1, 0.8666667, 1,
-0.01102407, 0.7968115, -0.3413264, 0, 1, 0.8745098, 1,
-0.01028412, -0.5558262, -3.679995, 0, 1, 0.8784314, 1,
-0.005309662, -0.9460052, -3.808226, 0, 1, 0.8862745, 1,
-0.001962544, -0.6499191, -4.073143, 0, 1, 0.8901961, 1,
0.001390475, 0.1618938, 1.136544, 0, 1, 0.8980392, 1,
0.002019494, -1.221633, 2.888279, 0, 1, 0.9058824, 1,
0.003726367, -0.6934206, 4.484206, 0, 1, 0.9098039, 1,
0.004401553, 0.1680926, 0.4097588, 0, 1, 0.9176471, 1,
0.005465071, 1.690394, -0.9361468, 0, 1, 0.9215686, 1,
0.008094305, -0.6171198, 1.475734, 0, 1, 0.9294118, 1,
0.01265487, 0.03269223, 1.268398, 0, 1, 0.9333333, 1,
0.01488592, 1.162982, 0.08507402, 0, 1, 0.9411765, 1,
0.0179166, -0.7003998, 3.941816, 0, 1, 0.945098, 1,
0.0187034, 1.50198, -0.4797102, 0, 1, 0.9529412, 1,
0.01923174, -0.5535122, 1.604422, 0, 1, 0.9568627, 1,
0.02243551, -0.007752527, 1.36812, 0, 1, 0.9647059, 1,
0.02959987, 1.237722, -2.382748, 0, 1, 0.9686275, 1,
0.03236047, -0.3835971, 1.16004, 0, 1, 0.9764706, 1,
0.03743205, 0.3904004, 1.177082, 0, 1, 0.9803922, 1,
0.03758632, -0.08833366, 0.02322176, 0, 1, 0.9882353, 1,
0.03998702, -0.845636, 2.835553, 0, 1, 0.9921569, 1,
0.0420572, 0.1865647, 0.8698118, 0, 1, 1, 1,
0.05191129, 1.008439, 0.5891668, 0, 0.9921569, 1, 1,
0.05282949, -0.06305015, 3.043254, 0, 0.9882353, 1, 1,
0.05378677, -1.394174, 3.621868, 0, 0.9803922, 1, 1,
0.05621871, -0.4673922, 2.666767, 0, 0.9764706, 1, 1,
0.0599577, 0.6609194, 0.3329321, 0, 0.9686275, 1, 1,
0.0601912, -0.155818, 2.602644, 0, 0.9647059, 1, 1,
0.06494813, -0.7563854, 2.508888, 0, 0.9568627, 1, 1,
0.07062772, 0.9791348, 0.4917823, 0, 0.9529412, 1, 1,
0.07336245, 0.9323875, 1.329534, 0, 0.945098, 1, 1,
0.07553595, 0.7385173, 0.6147028, 0, 0.9411765, 1, 1,
0.07803558, 0.1008425, -1.405227, 0, 0.9333333, 1, 1,
0.07859, 2.302096, -0.1662947, 0, 0.9294118, 1, 1,
0.0787307, 1.697503, -0.3129503, 0, 0.9215686, 1, 1,
0.07904651, -1.007853, 2.779082, 0, 0.9176471, 1, 1,
0.08265415, 2.336905, 0.0203302, 0, 0.9098039, 1, 1,
0.08483996, 1.245573, -0.1023418, 0, 0.9058824, 1, 1,
0.08658386, 0.633133, 0.5642076, 0, 0.8980392, 1, 1,
0.088485, -1.293741, 4.428617, 0, 0.8901961, 1, 1,
0.08992731, 0.4591421, 2.697331, 0, 0.8862745, 1, 1,
0.09274377, -0.1072965, 1.755139, 0, 0.8784314, 1, 1,
0.09394771, -0.4169791, 1.511066, 0, 0.8745098, 1, 1,
0.09473689, -1.077699, 2.205656, 0, 0.8666667, 1, 1,
0.09525295, 0.6908723, 0.7811058, 0, 0.8627451, 1, 1,
0.09911142, 0.1720172, -0.05368803, 0, 0.854902, 1, 1,
0.09913205, 0.09553932, 0.9235578, 0, 0.8509804, 1, 1,
0.09976705, -0.6416416, 4.55, 0, 0.8431373, 1, 1,
0.10002, -0.8592366, 3.340333, 0, 0.8392157, 1, 1,
0.1006479, -0.00685912, 2.114138, 0, 0.8313726, 1, 1,
0.1040973, -1.391732, 2.252402, 0, 0.827451, 1, 1,
0.1062958, -0.4124116, 2.553802, 0, 0.8196079, 1, 1,
0.1101579, -2.038448, 3.910843, 0, 0.8156863, 1, 1,
0.1112219, 1.210674, 1.655177, 0, 0.8078431, 1, 1,
0.1153089, -1.610024, 2.920247, 0, 0.8039216, 1, 1,
0.118181, 1.461816, 1.259947, 0, 0.7960784, 1, 1,
0.1189504, 0.4917696, -2.597302, 0, 0.7882353, 1, 1,
0.1190365, -0.7059205, 3.55786, 0, 0.7843137, 1, 1,
0.1255453, 0.1489022, 1.611093, 0, 0.7764706, 1, 1,
0.129749, -0.4851449, 1.524304, 0, 0.772549, 1, 1,
0.1358194, -0.484199, 3.459011, 0, 0.7647059, 1, 1,
0.1364556, -0.8699105, 3.052146, 0, 0.7607843, 1, 1,
0.1378406, -0.8455427, 2.061999, 0, 0.7529412, 1, 1,
0.1428515, 0.4746814, -0.9743269, 0, 0.7490196, 1, 1,
0.1468588, -0.07542462, 4.706809, 0, 0.7411765, 1, 1,
0.1468787, -1.95523, 2.97484, 0, 0.7372549, 1, 1,
0.1470151, 0.8281646, 0.1105146, 0, 0.7294118, 1, 1,
0.1499152, 1.329772, 0.400296, 0, 0.7254902, 1, 1,
0.154924, -0.7644402, 2.068441, 0, 0.7176471, 1, 1,
0.1559082, 0.3663223, -1.058745, 0, 0.7137255, 1, 1,
0.1587372, 0.8158644, 0.004185978, 0, 0.7058824, 1, 1,
0.1667296, 1.560575, 0.9143564, 0, 0.6980392, 1, 1,
0.1671083, 0.5506274, 0.6163687, 0, 0.6941177, 1, 1,
0.1706546, -0.2426328, 2.867828, 0, 0.6862745, 1, 1,
0.1711705, 0.8876187, 2.253622, 0, 0.682353, 1, 1,
0.1771581, -0.2039627, 2.304108, 0, 0.6745098, 1, 1,
0.1792483, -1.508828, 1.834891, 0, 0.6705883, 1, 1,
0.1803064, 0.5332856, -0.04890176, 0, 0.6627451, 1, 1,
0.1810368, -0.009439588, 2.205871, 0, 0.6588235, 1, 1,
0.1828078, 1.489204, 1.339847, 0, 0.6509804, 1, 1,
0.1848464, -1.5345, 4.135437, 0, 0.6470588, 1, 1,
0.1853155, -1.028145, 0.9142121, 0, 0.6392157, 1, 1,
0.189522, -1.101698, 4.714654, 0, 0.6352941, 1, 1,
0.1929055, 0.4412711, 0.8954044, 0, 0.627451, 1, 1,
0.1958796, 0.003058925, 1.63595, 0, 0.6235294, 1, 1,
0.1965734, -0.278553, 2.452633, 0, 0.6156863, 1, 1,
0.2016533, -0.5485584, 1.434332, 0, 0.6117647, 1, 1,
0.2019497, -0.9519131, 1.086694, 0, 0.6039216, 1, 1,
0.2030229, -0.1777415, 1.357422, 0, 0.5960785, 1, 1,
0.2073755, 0.7164292, 0.2265662, 0, 0.5921569, 1, 1,
0.2074334, -0.6552165, 1.276184, 0, 0.5843138, 1, 1,
0.2076131, 0.1060426, 1.8211, 0, 0.5803922, 1, 1,
0.2102895, -0.8282103, 3.814397, 0, 0.572549, 1, 1,
0.2142929, -0.2139852, 2.150814, 0, 0.5686275, 1, 1,
0.2160557, -1.037547, 0.9135384, 0, 0.5607843, 1, 1,
0.2162654, -0.1110633, 1.56304, 0, 0.5568628, 1, 1,
0.216543, -0.5157806, 2.635709, 0, 0.5490196, 1, 1,
0.2189178, 0.9380882, -0.04734967, 0, 0.5450981, 1, 1,
0.2204806, 0.5491735, 0.8537264, 0, 0.5372549, 1, 1,
0.2243167, 0.9105721, 0.6056712, 0, 0.5333334, 1, 1,
0.2265662, 0.9719537, -2.492743, 0, 0.5254902, 1, 1,
0.2301086, 0.5377884, 1.151155, 0, 0.5215687, 1, 1,
0.2437638, 0.1204425, 1.412839, 0, 0.5137255, 1, 1,
0.2445206, -0.6998639, 2.46827, 0, 0.509804, 1, 1,
0.2469873, -0.34161, 2.497453, 0, 0.5019608, 1, 1,
0.2484907, 0.1893769, 0.9137585, 0, 0.4941176, 1, 1,
0.2497254, 0.6486174, -0.5315898, 0, 0.4901961, 1, 1,
0.2498705, -1.084462, 3.663072, 0, 0.4823529, 1, 1,
0.2534512, -1.002051, 1.679265, 0, 0.4784314, 1, 1,
0.2543786, 0.7189392, 0.6354145, 0, 0.4705882, 1, 1,
0.2557759, -1.455421, 2.226507, 0, 0.4666667, 1, 1,
0.2569364, -1.18756, 0.6598909, 0, 0.4588235, 1, 1,
0.2582934, -0.06528606, 2.293359, 0, 0.454902, 1, 1,
0.2639638, 1.129563, -0.3591554, 0, 0.4470588, 1, 1,
0.2667215, 0.2008469, 0.5915266, 0, 0.4431373, 1, 1,
0.2690659, -0.5917011, 2.991814, 0, 0.4352941, 1, 1,
0.2704318, 0.6469356, 1.475082, 0, 0.4313726, 1, 1,
0.2739039, 0.8393411, -0.1538537, 0, 0.4235294, 1, 1,
0.2740874, -0.9416449, 0.5005319, 0, 0.4196078, 1, 1,
0.2783133, 1.473986, -0.3304344, 0, 0.4117647, 1, 1,
0.2815524, 1.248491, 0.06777103, 0, 0.4078431, 1, 1,
0.2821484, -0.0893985, 1.7361, 0, 0.4, 1, 1,
0.283407, -0.7520236, 0.9397595, 0, 0.3921569, 1, 1,
0.2844506, -0.3223111, 1.770873, 0, 0.3882353, 1, 1,
0.2851487, 0.5680448, -0.2139733, 0, 0.3803922, 1, 1,
0.2911461, 0.2350461, 2.55169, 0, 0.3764706, 1, 1,
0.2922569, 0.250121, 1.903678, 0, 0.3686275, 1, 1,
0.2940546, -0.3557484, 1.634626, 0, 0.3647059, 1, 1,
0.2970337, -0.1954562, 1.120716, 0, 0.3568628, 1, 1,
0.2985324, 1.781836, -0.1665164, 0, 0.3529412, 1, 1,
0.3008814, 1.679211, 1.404869, 0, 0.345098, 1, 1,
0.3116021, -0.8242471, 3.417456, 0, 0.3411765, 1, 1,
0.3146504, 1.281403, -0.766377, 0, 0.3333333, 1, 1,
0.3193178, -0.6768873, 4.557458, 0, 0.3294118, 1, 1,
0.3204091, -2.265566, 1.009349, 0, 0.3215686, 1, 1,
0.3219146, 0.01006951, 1.586772, 0, 0.3176471, 1, 1,
0.3270699, 1.240742, 0.1390398, 0, 0.3098039, 1, 1,
0.3322285, 0.4468654, 0.7926338, 0, 0.3058824, 1, 1,
0.3347404, -0.519672, 2.754668, 0, 0.2980392, 1, 1,
0.3362325, 1.172413, -2.104888, 0, 0.2901961, 1, 1,
0.3448792, 0.6251677, -0.4876006, 0, 0.2862745, 1, 1,
0.3462718, -0.1626333, 0.5609837, 0, 0.2784314, 1, 1,
0.3470239, -0.9940719, 3.646512, 0, 0.2745098, 1, 1,
0.3472975, 0.1502162, 0.07824232, 0, 0.2666667, 1, 1,
0.3479322, 1.019903, -0.3623487, 0, 0.2627451, 1, 1,
0.3583155, 0.5650537, 0.3370224, 0, 0.254902, 1, 1,
0.3584906, 0.435804, -1.707185, 0, 0.2509804, 1, 1,
0.3625731, -0.7086173, 3.059203, 0, 0.2431373, 1, 1,
0.3633071, -0.7427343, 1.378696, 0, 0.2392157, 1, 1,
0.3637976, -0.2117436, 2.083992, 0, 0.2313726, 1, 1,
0.3694859, -2.356475, 3.122221, 0, 0.227451, 1, 1,
0.3736342, -0.5791491, 3.568772, 0, 0.2196078, 1, 1,
0.3741859, 0.8408436, 1.302075, 0, 0.2156863, 1, 1,
0.3745511, 1.144854, 0.1277206, 0, 0.2078431, 1, 1,
0.376061, -0.1790578, 4.081471, 0, 0.2039216, 1, 1,
0.3802763, -0.9016294, 3.285117, 0, 0.1960784, 1, 1,
0.3805032, 0.8111697, -0.05770718, 0, 0.1882353, 1, 1,
0.3849589, -0.9187106, 1.554298, 0, 0.1843137, 1, 1,
0.3871402, 0.01543988, 1.247463, 0, 0.1764706, 1, 1,
0.3874211, -0.8739444, 1.877613, 0, 0.172549, 1, 1,
0.3893808, -0.6298836, 3.8055, 0, 0.1647059, 1, 1,
0.3902777, -0.01248279, 2.000357, 0, 0.1607843, 1, 1,
0.3915429, 0.8629343, -0.7695004, 0, 0.1529412, 1, 1,
0.3984628, 0.08464392, -0.8247897, 0, 0.1490196, 1, 1,
0.3999713, 0.0754559, -0.117422, 0, 0.1411765, 1, 1,
0.4026495, -0.9136065, 2.183803, 0, 0.1372549, 1, 1,
0.4028893, -1.331741, 3.124027, 0, 0.1294118, 1, 1,
0.4108304, 1.024722, 1.442358, 0, 0.1254902, 1, 1,
0.4111216, 0.8853424, 1.513663, 0, 0.1176471, 1, 1,
0.4118075, 1.158668, 0.4752654, 0, 0.1137255, 1, 1,
0.4155887, -0.2531987, 1.386356, 0, 0.1058824, 1, 1,
0.4190812, 1.32684, 0.05666238, 0, 0.09803922, 1, 1,
0.4203514, -0.494987, 3.135702, 0, 0.09411765, 1, 1,
0.4207125, -0.5511928, 1.856663, 0, 0.08627451, 1, 1,
0.4216756, -0.5330014, 2.053516, 0, 0.08235294, 1, 1,
0.4225632, 1.13463, 0.1883911, 0, 0.07450981, 1, 1,
0.4240708, 0.2797999, -1.633006, 0, 0.07058824, 1, 1,
0.4327697, -0.132785, 3.367125, 0, 0.0627451, 1, 1,
0.4333325, -0.8982361, 2.903938, 0, 0.05882353, 1, 1,
0.4356192, 0.6836795, 1.593474, 0, 0.05098039, 1, 1,
0.4368239, 3.58101, 0.5276821, 0, 0.04705882, 1, 1,
0.437297, 0.486234, -0.5707167, 0, 0.03921569, 1, 1,
0.4424783, -1.053056, 4.498168, 0, 0.03529412, 1, 1,
0.4464941, -1.5679, 3.450704, 0, 0.02745098, 1, 1,
0.4465747, 1.152802, -0.2349372, 0, 0.02352941, 1, 1,
0.4491177, -0.4787863, 2.002621, 0, 0.01568628, 1, 1,
0.4533368, -0.1509148, 0.588017, 0, 0.01176471, 1, 1,
0.4610967, -0.3986284, -0.4009704, 0, 0.003921569, 1, 1,
0.4693131, -0.03180503, 1.799687, 0.003921569, 0, 1, 1,
0.4715564, -0.3279948, 1.811837, 0.007843138, 0, 1, 1,
0.4739787, -0.4696315, 1.585531, 0.01568628, 0, 1, 1,
0.4773108, 0.3907732, 0.2115124, 0.01960784, 0, 1, 1,
0.4848346, 0.4319313, -1.090474, 0.02745098, 0, 1, 1,
0.4882292, 0.7756846, 1.449488, 0.03137255, 0, 1, 1,
0.4907425, 1.383234, 0.4593839, 0.03921569, 0, 1, 1,
0.4952135, 2.226494, 0.4133785, 0.04313726, 0, 1, 1,
0.4973939, 0.4477292, -0.9933442, 0.05098039, 0, 1, 1,
0.4977049, 0.306177, -0.9252701, 0.05490196, 0, 1, 1,
0.5038918, -0.3865144, 1.438654, 0.0627451, 0, 1, 1,
0.5061162, 0.6358495, 1.683308, 0.06666667, 0, 1, 1,
0.5064846, -0.05078954, 1.475317, 0.07450981, 0, 1, 1,
0.5072268, -0.5843846, 3.270121, 0.07843138, 0, 1, 1,
0.5075861, -1.164596, 3.200376, 0.08627451, 0, 1, 1,
0.5104733, -0.7620672, 3.054504, 0.09019608, 0, 1, 1,
0.511568, 0.4407182, 1.107111, 0.09803922, 0, 1, 1,
0.5129439, 2.63023, 2.627275, 0.1058824, 0, 1, 1,
0.5129848, -0.468467, 2.222697, 0.1098039, 0, 1, 1,
0.5171577, 0.2332768, 0.8537961, 0.1176471, 0, 1, 1,
0.5172135, -0.3603152, 3.724936, 0.1215686, 0, 1, 1,
0.5178597, -1.115078, 3.219598, 0.1294118, 0, 1, 1,
0.5239109, -0.2810772, 2.842504, 0.1333333, 0, 1, 1,
0.5245335, -1.492678, 2.348425, 0.1411765, 0, 1, 1,
0.5254655, -0.3817654, 1.742952, 0.145098, 0, 1, 1,
0.5266213, -0.4174917, 3.184714, 0.1529412, 0, 1, 1,
0.5272759, 2.045889, 0.7327548, 0.1568628, 0, 1, 1,
0.5301869, 0.1042002, 1.295342, 0.1647059, 0, 1, 1,
0.5359535, -0.3787435, 2.092482, 0.1686275, 0, 1, 1,
0.5374262, 0.2232518, 0.9560819, 0.1764706, 0, 1, 1,
0.5401921, -1.131801, 2.308519, 0.1803922, 0, 1, 1,
0.5402966, 0.5040061, 0.1500084, 0.1882353, 0, 1, 1,
0.5424995, 0.6247615, 0.1930868, 0.1921569, 0, 1, 1,
0.5433506, -1.759868, 2.015765, 0.2, 0, 1, 1,
0.5450898, 0.2041459, 1.309788, 0.2078431, 0, 1, 1,
0.5464004, -0.2448545, 2.584896, 0.2117647, 0, 1, 1,
0.5472801, 0.8105555, 0.5387899, 0.2196078, 0, 1, 1,
0.5501675, -0.07503441, 1.915046, 0.2235294, 0, 1, 1,
0.5542436, 0.1849094, 1.882604, 0.2313726, 0, 1, 1,
0.5617473, 1.512645, 0.6105167, 0.2352941, 0, 1, 1,
0.5622672, -1.102739, 2.312302, 0.2431373, 0, 1, 1,
0.5656344, 1.250191, -0.9621994, 0.2470588, 0, 1, 1,
0.5664746, 1.094139, -0.2353722, 0.254902, 0, 1, 1,
0.5779451, 0.2172023, 1.188581, 0.2588235, 0, 1, 1,
0.5790604, -0.5834787, 2.599195, 0.2666667, 0, 1, 1,
0.5836219, 0.5385753, -0.02116151, 0.2705882, 0, 1, 1,
0.5836549, -1.572502, 1.584695, 0.2784314, 0, 1, 1,
0.5897162, 0.6471636, 0.7238439, 0.282353, 0, 1, 1,
0.5928239, 1.206761, -1.032213, 0.2901961, 0, 1, 1,
0.5992024, -0.6823725, 2.183692, 0.2941177, 0, 1, 1,
0.6063116, -1.512602, 3.400255, 0.3019608, 0, 1, 1,
0.6140417, 0.7933778, -1.428291, 0.3098039, 0, 1, 1,
0.6157444, 1.406745, -0.8161542, 0.3137255, 0, 1, 1,
0.6209291, -0.3817083, 0.8049176, 0.3215686, 0, 1, 1,
0.6262134, 0.2874915, 0.1601035, 0.3254902, 0, 1, 1,
0.6290291, -0.3211215, 1.536797, 0.3333333, 0, 1, 1,
0.6291821, -0.5939011, 2.444637, 0.3372549, 0, 1, 1,
0.6374617, 0.4281802, -1.014749, 0.345098, 0, 1, 1,
0.6411507, 0.6718987, 0.8382764, 0.3490196, 0, 1, 1,
0.6444512, -1.180481, 0.903957, 0.3568628, 0, 1, 1,
0.645584, -0.6266522, 0.2793438, 0.3607843, 0, 1, 1,
0.6458167, 0.5645749, 0.283305, 0.3686275, 0, 1, 1,
0.6507684, 1.505364, 0.9372674, 0.372549, 0, 1, 1,
0.6528513, 0.4227431, 0.3101743, 0.3803922, 0, 1, 1,
0.6536551, 0.8847512, 1.207616, 0.3843137, 0, 1, 1,
0.6708115, 0.7172406, 1.334864, 0.3921569, 0, 1, 1,
0.6775597, -0.3419634, 0.9322942, 0.3960784, 0, 1, 1,
0.6787328, 1.023638, -0.3969075, 0.4039216, 0, 1, 1,
0.6958132, 0.1320509, 0.5566916, 0.4117647, 0, 1, 1,
0.6968147, 1.058476, 0.8647547, 0.4156863, 0, 1, 1,
0.7024325, -1.037002, 2.803833, 0.4235294, 0, 1, 1,
0.7035636, 1.066449, 1.106768, 0.427451, 0, 1, 1,
0.7043127, 0.32856, 1.65876, 0.4352941, 0, 1, 1,
0.7043538, -1.000307, 3.110345, 0.4392157, 0, 1, 1,
0.7056208, 0.04922621, -0.4511365, 0.4470588, 0, 1, 1,
0.7058788, -1.482139, 3.974276, 0.4509804, 0, 1, 1,
0.7064298, -0.4878795, 3.248746, 0.4588235, 0, 1, 1,
0.7068987, -1.582354, 1.97105, 0.4627451, 0, 1, 1,
0.7073826, 0.1188107, 2.431361, 0.4705882, 0, 1, 1,
0.7088378, -0.7011853, 1.514993, 0.4745098, 0, 1, 1,
0.7103712, -0.07819881, 0.4547797, 0.4823529, 0, 1, 1,
0.7155291, 0.1525274, 0.5023902, 0.4862745, 0, 1, 1,
0.7189423, 0.8660747, 0.8657805, 0.4941176, 0, 1, 1,
0.7199913, 0.7898239, 0.1228328, 0.5019608, 0, 1, 1,
0.7220033, 1.509415, 0.7306607, 0.5058824, 0, 1, 1,
0.7235635, -0.2209108, 1.728303, 0.5137255, 0, 1, 1,
0.7244524, -0.350464, 3.298136, 0.5176471, 0, 1, 1,
0.7252135, 0.3489258, 3.238124, 0.5254902, 0, 1, 1,
0.7298179, -0.3359557, 2.653935, 0.5294118, 0, 1, 1,
0.7386219, -0.4084917, 3.797795, 0.5372549, 0, 1, 1,
0.7386326, 0.142576, -0.502413, 0.5411765, 0, 1, 1,
0.7433522, -1.277364, 2.931894, 0.5490196, 0, 1, 1,
0.7499444, -1.644939, 2.621403, 0.5529412, 0, 1, 1,
0.7546554, 0.3160557, -0.21255, 0.5607843, 0, 1, 1,
0.756269, 0.9884652, 1.403975, 0.5647059, 0, 1, 1,
0.7580277, 0.5207804, -0.1089618, 0.572549, 0, 1, 1,
0.7614335, 0.4642574, 0.8925197, 0.5764706, 0, 1, 1,
0.770647, -0.2954205, 2.129325, 0.5843138, 0, 1, 1,
0.7771342, -1.259227, 1.725045, 0.5882353, 0, 1, 1,
0.7794856, 0.3515524, 0.6754367, 0.5960785, 0, 1, 1,
0.7847164, 0.0837749, 2.001852, 0.6039216, 0, 1, 1,
0.7848363, 0.6058072, -0.5352799, 0.6078432, 0, 1, 1,
0.7850932, 0.8044248, -0.3848425, 0.6156863, 0, 1, 1,
0.7947389, -0.4650973, 1.746708, 0.6196079, 0, 1, 1,
0.8038629, 0.433771, -0.3800553, 0.627451, 0, 1, 1,
0.8057555, 1.195515, 1.320162, 0.6313726, 0, 1, 1,
0.8116933, 0.2456284, 0.7602329, 0.6392157, 0, 1, 1,
0.8134229, 0.5497984, 0.1039663, 0.6431373, 0, 1, 1,
0.815665, 1.157665, 1.59203, 0.6509804, 0, 1, 1,
0.8188001, -0.03762471, 1.391411, 0.654902, 0, 1, 1,
0.8278902, -2.163493, 4.286265, 0.6627451, 0, 1, 1,
0.8286448, 0.2782591, 1.416662, 0.6666667, 0, 1, 1,
0.8318026, -0.1873288, 2.223197, 0.6745098, 0, 1, 1,
0.8432169, 0.1368569, 1.743634, 0.6784314, 0, 1, 1,
0.8433045, -0.6295127, 4.179063, 0.6862745, 0, 1, 1,
0.846675, 0.5364978, 3.002711, 0.6901961, 0, 1, 1,
0.8487605, -0.8685077, -0.02643645, 0.6980392, 0, 1, 1,
0.8564515, 1.462889, -0.8332641, 0.7058824, 0, 1, 1,
0.8569139, -1.612897, 3.161849, 0.7098039, 0, 1, 1,
0.8577357, -0.789315, 2.869968, 0.7176471, 0, 1, 1,
0.8581643, 0.09292238, 1.57687, 0.7215686, 0, 1, 1,
0.8588019, -1.239428, 1.585092, 0.7294118, 0, 1, 1,
0.8606324, -0.1995825, 1.905789, 0.7333333, 0, 1, 1,
0.8659944, 0.07163045, 0.5756179, 0.7411765, 0, 1, 1,
0.8668265, 1.295462, -0.3213046, 0.7450981, 0, 1, 1,
0.8691438, 2.034051, 1.544125, 0.7529412, 0, 1, 1,
0.8755681, 0.01061436, -0.1159736, 0.7568628, 0, 1, 1,
0.8792705, -1.508566, 1.966663, 0.7647059, 0, 1, 1,
0.8797807, 0.08094391, 0.4477364, 0.7686275, 0, 1, 1,
0.8829758, -0.5528503, 3.345984, 0.7764706, 0, 1, 1,
0.8862517, -0.86807, 2.925401, 0.7803922, 0, 1, 1,
0.8890642, -0.09634523, 1.143476, 0.7882353, 0, 1, 1,
0.8900691, -1.247086, 1.218983, 0.7921569, 0, 1, 1,
0.8916543, 0.8648725, -0.7817575, 0.8, 0, 1, 1,
0.8917562, 1.161119, 2.638813, 0.8078431, 0, 1, 1,
0.8942058, 0.2936101, 2.128008, 0.8117647, 0, 1, 1,
0.8953894, -1.001237, 2.146669, 0.8196079, 0, 1, 1,
0.9011769, -0.01617575, 1.281626, 0.8235294, 0, 1, 1,
0.9044284, -0.8342815, 0.6455599, 0.8313726, 0, 1, 1,
0.9057096, 0.810523, 2.893269, 0.8352941, 0, 1, 1,
0.9062786, 0.8502591, 1.382238, 0.8431373, 0, 1, 1,
0.9074596, -0.987788, 0.7369027, 0.8470588, 0, 1, 1,
0.911549, 1.347987, 0.8497851, 0.854902, 0, 1, 1,
0.9149158, -0.08029906, 1.567572, 0.8588235, 0, 1, 1,
0.9180171, 1.538422, 0.3297458, 0.8666667, 0, 1, 1,
0.9216911, 0.3491434, 2.424003, 0.8705882, 0, 1, 1,
0.9255252, -1.231125, 3.808229, 0.8784314, 0, 1, 1,
0.9355804, 0.9618374, 1.330713, 0.8823529, 0, 1, 1,
0.9376715, 0.6903398, 1.937954, 0.8901961, 0, 1, 1,
0.9395555, 1.45226, -0.2446898, 0.8941177, 0, 1, 1,
0.9496675, -0.9894838, 3.282589, 0.9019608, 0, 1, 1,
0.9602057, 1.727138, -0.594209, 0.9098039, 0, 1, 1,
0.9606124, -0.2765854, 1.797599, 0.9137255, 0, 1, 1,
0.9629292, -0.886537, 1.016373, 0.9215686, 0, 1, 1,
0.9671677, -1.469879, 2.65939, 0.9254902, 0, 1, 1,
0.9684712, 0.1900635, 1.076805, 0.9333333, 0, 1, 1,
0.9776915, 1.364685, 0.6838526, 0.9372549, 0, 1, 1,
0.9778816, 1.59238, 0.07005785, 0.945098, 0, 1, 1,
0.9786732, 1.399017, 2.660932, 0.9490196, 0, 1, 1,
0.9847333, -2.203624, 2.771835, 0.9568627, 0, 1, 1,
0.9883154, 1.818319, 0.2812863, 0.9607843, 0, 1, 1,
0.9944304, 1.230217, 0.6117672, 0.9686275, 0, 1, 1,
1.003672, -0.1309471, 1.805892, 0.972549, 0, 1, 1,
1.011252, -0.1561823, 1.67257, 0.9803922, 0, 1, 1,
1.016122, -0.214676, 1.121383, 0.9843137, 0, 1, 1,
1.022482, 0.2074233, 1.814106, 0.9921569, 0, 1, 1,
1.026754, 0.9503114, 1.928857, 0.9960784, 0, 1, 1,
1.033121, 0.6604267, 1.07794, 1, 0, 0.9960784, 1,
1.033519, 0.1547411, 0.8060783, 1, 0, 0.9882353, 1,
1.036648, -0.5613134, 1.566008, 1, 0, 0.9843137, 1,
1.038417, 0.6709424, 0.1141746, 1, 0, 0.9764706, 1,
1.04417, 1.784351, -0.0179409, 1, 0, 0.972549, 1,
1.046437, 0.2451095, 1.315219, 1, 0, 0.9647059, 1,
1.05297, -1.03508, 0.6144718, 1, 0, 0.9607843, 1,
1.05313, 1.086202, -0.4201259, 1, 0, 0.9529412, 1,
1.056251, 0.07904051, 1.134221, 1, 0, 0.9490196, 1,
1.057117, 2.205652, 1.770509, 1, 0, 0.9411765, 1,
1.061014, -1.498953, 1.869148, 1, 0, 0.9372549, 1,
1.065616, 1.516293, 2.375932, 1, 0, 0.9294118, 1,
1.073314, -0.1539819, 0.5473964, 1, 0, 0.9254902, 1,
1.073407, -0.8049064, 2.498802, 1, 0, 0.9176471, 1,
1.079185, -0.3132719, 1.339377, 1, 0, 0.9137255, 1,
1.094208, 2.348089, 0.4668689, 1, 0, 0.9058824, 1,
1.094306, -0.590187, 1.81574, 1, 0, 0.9019608, 1,
1.095793, -0.224474, 1.61125, 1, 0, 0.8941177, 1,
1.098186, 1.329352, -0.00494893, 1, 0, 0.8862745, 1,
1.101774, 1.113685, -0.5040177, 1, 0, 0.8823529, 1,
1.102579, 0.7025099, 0.6508558, 1, 0, 0.8745098, 1,
1.103495, -0.1467353, 0.7061771, 1, 0, 0.8705882, 1,
1.1049, 0.6701649, 1.952827, 1, 0, 0.8627451, 1,
1.106128, 0.9421872, 1.391019, 1, 0, 0.8588235, 1,
1.106643, 0.1389283, 0.8050148, 1, 0, 0.8509804, 1,
1.109998, -0.3376999, 1.780055, 1, 0, 0.8470588, 1,
1.114985, 0.9398412, 1.595501, 1, 0, 0.8392157, 1,
1.115637, 0.08926766, 2.340133, 1, 0, 0.8352941, 1,
1.116526, -0.6835926, 1.659013, 1, 0, 0.827451, 1,
1.119688, 0.292014, 1.534819, 1, 0, 0.8235294, 1,
1.120478, 0.716901, 1.07317, 1, 0, 0.8156863, 1,
1.125759, -0.3364158, 1.95068, 1, 0, 0.8117647, 1,
1.12778, 0.7842627, -0.4216814, 1, 0, 0.8039216, 1,
1.130007, -1.174651, 3.883292, 1, 0, 0.7960784, 1,
1.13178, 1.229297, 0.9369725, 1, 0, 0.7921569, 1,
1.132568, 0.7756594, 1.878867, 1, 0, 0.7843137, 1,
1.139866, -1.876892, 1.463099, 1, 0, 0.7803922, 1,
1.140947, 0.1426505, 0.260886, 1, 0, 0.772549, 1,
1.142576, -0.1151239, 4.139665, 1, 0, 0.7686275, 1,
1.164809, 0.7766215, 2.01428, 1, 0, 0.7607843, 1,
1.170909, 0.1629136, 1.483615, 1, 0, 0.7568628, 1,
1.174173, -0.7226505, 0.32076, 1, 0, 0.7490196, 1,
1.176161, 0.1765651, 0.676492, 1, 0, 0.7450981, 1,
1.180901, -2.004141, 3.283191, 1, 0, 0.7372549, 1,
1.184041, -0.06244069, 2.166149, 1, 0, 0.7333333, 1,
1.184974, -1.873778, 1.71067, 1, 0, 0.7254902, 1,
1.187845, 0.6227588, 1.850587, 1, 0, 0.7215686, 1,
1.190272, 0.538399, 2.581154, 1, 0, 0.7137255, 1,
1.20784, -1.060301, 3.607947, 1, 0, 0.7098039, 1,
1.211616, -2.367884, 1.72841, 1, 0, 0.7019608, 1,
1.214515, 0.08996607, 0.7544068, 1, 0, 0.6941177, 1,
1.2205, -0.9000509, 0.2021693, 1, 0, 0.6901961, 1,
1.229506, 0.9664763, 1.645612, 1, 0, 0.682353, 1,
1.241262, -0.3929333, 1.738954, 1, 0, 0.6784314, 1,
1.24224, -0.7216746, 2.894767, 1, 0, 0.6705883, 1,
1.244553, -0.2014291, 2.589421, 1, 0, 0.6666667, 1,
1.24737, -0.5946083, 3.198328, 1, 0, 0.6588235, 1,
1.248865, -1.236566, 1.655826, 1, 0, 0.654902, 1,
1.257164, -0.7506093, 1.190929, 1, 0, 0.6470588, 1,
1.265145, 1.447917, 1.982755, 1, 0, 0.6431373, 1,
1.26979, 0.7310151, 0.9566802, 1, 0, 0.6352941, 1,
1.271104, 0.3165057, 1.149143, 1, 0, 0.6313726, 1,
1.282037, -1.629192, 1.769021, 1, 0, 0.6235294, 1,
1.298933, 0.2524397, 0.4124819, 1, 0, 0.6196079, 1,
1.299778, -0.07050098, 2.227637, 1, 0, 0.6117647, 1,
1.30915, -0.4992223, 1.447584, 1, 0, 0.6078432, 1,
1.311941, 0.8724436, 0.01532734, 1, 0, 0.6, 1,
1.32104, 0.2522028, 0.9455714, 1, 0, 0.5921569, 1,
1.325567, -0.9341196, 1.56968, 1, 0, 0.5882353, 1,
1.328403, -0.9332781, 1.11052, 1, 0, 0.5803922, 1,
1.332034, -1.013899, 2.408283, 1, 0, 0.5764706, 1,
1.334239, 0.8314341, 0.8580435, 1, 0, 0.5686275, 1,
1.335683, -1.563004, 4.330868, 1, 0, 0.5647059, 1,
1.349235, 1.03261, -0.1624216, 1, 0, 0.5568628, 1,
1.36406, 0.7924362, -0.6356739, 1, 0, 0.5529412, 1,
1.367875, -0.909191, 3.422779, 1, 0, 0.5450981, 1,
1.374233, 0.6940265, 1.050191, 1, 0, 0.5411765, 1,
1.374888, -0.2114569, 1.588454, 1, 0, 0.5333334, 1,
1.377735, -0.6406789, 0.7823748, 1, 0, 0.5294118, 1,
1.38286, -0.4952541, 4.03348, 1, 0, 0.5215687, 1,
1.385515, 1.260783, 0.5605221, 1, 0, 0.5176471, 1,
1.386494, 0.3964207, 1.980752, 1, 0, 0.509804, 1,
1.412256, -0.3308048, 1.646955, 1, 0, 0.5058824, 1,
1.412349, 0.604908, 0.6631998, 1, 0, 0.4980392, 1,
1.424584, -0.9728634, 0.2607164, 1, 0, 0.4901961, 1,
1.425376, 1.252326, 1.399959, 1, 0, 0.4862745, 1,
1.429154, -0.8144359, 3.579026, 1, 0, 0.4784314, 1,
1.448162, -1.678395, 2.553356, 1, 0, 0.4745098, 1,
1.44933, 0.06901072, 2.252426, 1, 0, 0.4666667, 1,
1.467188, 1.076496, 0.7811661, 1, 0, 0.4627451, 1,
1.471364, -0.1722796, 0.6574696, 1, 0, 0.454902, 1,
1.47227, 1.537831, 1.386109, 1, 0, 0.4509804, 1,
1.472517, -0.2065058, 2.641472, 1, 0, 0.4431373, 1,
1.483211, 0.6665543, 0.2499722, 1, 0, 0.4392157, 1,
1.496054, 1.64968, 0.2732764, 1, 0, 0.4313726, 1,
1.49854, -2.79455, 4.239055, 1, 0, 0.427451, 1,
1.501178, 0.8519384, -0.08653267, 1, 0, 0.4196078, 1,
1.501178, 1.170556, 0.5332766, 1, 0, 0.4156863, 1,
1.50192, -0.05237162, 1.525746, 1, 0, 0.4078431, 1,
1.514423, -1.982455, 3.353696, 1, 0, 0.4039216, 1,
1.516394, 1.012624, 1.420644, 1, 0, 0.3960784, 1,
1.537333, -0.6708092, 2.037516, 1, 0, 0.3882353, 1,
1.551005, -0.3441868, 0.5479925, 1, 0, 0.3843137, 1,
1.552221, -0.3214235, 1.979946, 1, 0, 0.3764706, 1,
1.564785, 1.333937, 1.031258, 1, 0, 0.372549, 1,
1.567421, -0.4898063, 1.005979, 1, 0, 0.3647059, 1,
1.56965, 0.4723903, 0.3678851, 1, 0, 0.3607843, 1,
1.580333, 0.359583, 3.269495, 1, 0, 0.3529412, 1,
1.593543, 1.331339, -1.06932, 1, 0, 0.3490196, 1,
1.595093, 0.136472, 1.242867, 1, 0, 0.3411765, 1,
1.597907, 0.5466374, 0.8406866, 1, 0, 0.3372549, 1,
1.605819, 0.1563769, 1.740505, 1, 0, 0.3294118, 1,
1.611922, -0.6670033, 2.617697, 1, 0, 0.3254902, 1,
1.620066, 1.464382, -0.6300921, 1, 0, 0.3176471, 1,
1.640695, -1.179419, 3.496881, 1, 0, 0.3137255, 1,
1.642386, -1.984783, 2.722427, 1, 0, 0.3058824, 1,
1.647749, 0.8878308, 0.000815144, 1, 0, 0.2980392, 1,
1.656762, -0.7175096, 0.6381056, 1, 0, 0.2941177, 1,
1.657868, -1.051489, 2.339284, 1, 0, 0.2862745, 1,
1.672936, 2.116546, 0.3204154, 1, 0, 0.282353, 1,
1.683579, -0.6071007, 0.1481655, 1, 0, 0.2745098, 1,
1.683962, -1.400646, 4.532676, 1, 0, 0.2705882, 1,
1.686636, -0.4836123, 2.24864, 1, 0, 0.2627451, 1,
1.688907, 0.663475, 0.4947776, 1, 0, 0.2588235, 1,
1.69673, 1.313797, 0.1337803, 1, 0, 0.2509804, 1,
1.71505, -0.7195473, 0.6539977, 1, 0, 0.2470588, 1,
1.724148, 0.9725748, 1.310197, 1, 0, 0.2392157, 1,
1.733719, 1.572045, 0.6893626, 1, 0, 0.2352941, 1,
1.739001, 0.5052293, 0.02239459, 1, 0, 0.227451, 1,
1.756926, -0.07747079, 0.8603897, 1, 0, 0.2235294, 1,
1.762743, -0.2544563, 1.813341, 1, 0, 0.2156863, 1,
1.803141, 0.1729394, 0.8525512, 1, 0, 0.2117647, 1,
1.820393, -0.4085385, 2.052767, 1, 0, 0.2039216, 1,
1.820458, 1.353392, 1.501921, 1, 0, 0.1960784, 1,
1.846853, 0.8863294, 0.0148736, 1, 0, 0.1921569, 1,
1.867319, -0.313646, 4.530063, 1, 0, 0.1843137, 1,
1.88303, 0.1451676, -0.5823542, 1, 0, 0.1803922, 1,
1.903426, 1.684286, 1.309214, 1, 0, 0.172549, 1,
1.915365, 1.845779, 3.068303, 1, 0, 0.1686275, 1,
1.922641, -0.8217609, 2.206408, 1, 0, 0.1607843, 1,
1.9229, -0.07328741, 2.226747, 1, 0, 0.1568628, 1,
1.958885, -1.797791, 2.042675, 1, 0, 0.1490196, 1,
2.00248, -0.643402, 2.632198, 1, 0, 0.145098, 1,
2.021454, 0.4602956, 1.488282, 1, 0, 0.1372549, 1,
2.034086, 0.1480807, 0.3054967, 1, 0, 0.1333333, 1,
2.058079, 0.1136234, 3.205475, 1, 0, 0.1254902, 1,
2.069196, -0.3703115, 1.757788, 1, 0, 0.1215686, 1,
2.073625, 0.4973077, 2.552188, 1, 0, 0.1137255, 1,
2.083991, -0.7836516, 2.800266, 1, 0, 0.1098039, 1,
2.090732, -0.9700249, 0.5879482, 1, 0, 0.1019608, 1,
2.104552, 0.407002, 1.846331, 1, 0, 0.09411765, 1,
2.150858, 0.3646521, 2.276984, 1, 0, 0.09019608, 1,
2.200105, 0.9429753, 1.489615, 1, 0, 0.08235294, 1,
2.267663, -0.3062, 2.562493, 1, 0, 0.07843138, 1,
2.270023, 0.5601949, 1.903714, 1, 0, 0.07058824, 1,
2.272201, -0.3472221, 1.477206, 1, 0, 0.06666667, 1,
2.273347, 0.7547552, 2.455294, 1, 0, 0.05882353, 1,
2.282358, 0.3664205, 1.782915, 1, 0, 0.05490196, 1,
2.305062, 0.3509382, 3.730431, 1, 0, 0.04705882, 1,
2.36148, 1.551303, 1.267144, 1, 0, 0.04313726, 1,
2.530482, 0.3662224, 1.323529, 1, 0, 0.03529412, 1,
2.537441, -0.08675775, 2.185169, 1, 0, 0.03137255, 1,
2.620022, 1.470815, 0.9985753, 1, 0, 0.02352941, 1,
2.764293, -0.1333434, 1.374651, 1, 0, 0.01960784, 1,
2.815152, -1.589655, 2.119371, 1, 0, 0.01176471, 1,
2.863806, -0.8946146, 2.677078, 1, 0, 0.007843138, 1
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
-0.2040281, -4.244827, -6.386498, 0, -0.5, 0.5, 0.5,
-0.2040281, -4.244827, -6.386498, 1, -0.5, 0.5, 0.5,
-0.2040281, -4.244827, -6.386498, 1, 1.5, 0.5, 0.5,
-0.2040281, -4.244827, -6.386498, 0, 1.5, 0.5, 0.5
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
-4.311859, 0.2352052, -6.386498, 0, -0.5, 0.5, 0.5,
-4.311859, 0.2352052, -6.386498, 1, -0.5, 0.5, 0.5,
-4.311859, 0.2352052, -6.386498, 1, 1.5, 0.5, 0.5,
-4.311859, 0.2352052, -6.386498, 0, 1.5, 0.5, 0.5
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
-4.311859, -4.244827, -0.03145623, 0, -0.5, 0.5, 0.5,
-4.311859, -4.244827, -0.03145623, 1, -0.5, 0.5, 0.5,
-4.311859, -4.244827, -0.03145623, 1, 1.5, 0.5, 0.5,
-4.311859, -4.244827, -0.03145623, 0, 1.5, 0.5, 0.5
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
-3, -3.210974, -4.91995,
2, -3.210974, -4.91995,
-3, -3.210974, -4.91995,
-3, -3.383283, -5.164375,
-2, -3.210974, -4.91995,
-2, -3.383283, -5.164375,
-1, -3.210974, -4.91995,
-1, -3.383283, -5.164375,
0, -3.210974, -4.91995,
0, -3.383283, -5.164375,
1, -3.210974, -4.91995,
1, -3.383283, -5.164375,
2, -3.210974, -4.91995,
2, -3.383283, -5.164375
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
-3, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
-3, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
-3, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
-3, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5,
-2, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
-2, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
-2, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
-2, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5,
-1, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
-1, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
-1, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
-1, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5,
0, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
0, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
0, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
0, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5,
1, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
1, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
1, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
1, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5,
2, -3.727901, -5.653224, 0, -0.5, 0.5, 0.5,
2, -3.727901, -5.653224, 1, -0.5, 0.5, 0.5,
2, -3.727901, -5.653224, 1, 1.5, 0.5, 0.5,
2, -3.727901, -5.653224, 0, 1.5, 0.5, 0.5
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
-3.363898, -3, -4.91995,
-3.363898, 3, -4.91995,
-3.363898, -3, -4.91995,
-3.521891, -3, -5.164375,
-3.363898, -2, -4.91995,
-3.521891, -2, -5.164375,
-3.363898, -1, -4.91995,
-3.521891, -1, -5.164375,
-3.363898, 0, -4.91995,
-3.521891, 0, -5.164375,
-3.363898, 1, -4.91995,
-3.521891, 1, -5.164375,
-3.363898, 2, -4.91995,
-3.521891, 2, -5.164375,
-3.363898, 3, -4.91995,
-3.521891, 3, -5.164375
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
-3.837878, -3, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, -3, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, -3, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, -3, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, -2, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, -2, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, -2, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, -2, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, -1, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, -1, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, -1, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, -1, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, 0, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, 0, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, 0, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, 0, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, 1, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, 1, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, 1, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, 1, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, 2, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, 2, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, 2, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, 2, -5.653224, 0, 1.5, 0.5, 0.5,
-3.837878, 3, -5.653224, 0, -0.5, 0.5, 0.5,
-3.837878, 3, -5.653224, 1, -0.5, 0.5, 0.5,
-3.837878, 3, -5.653224, 1, 1.5, 0.5, 0.5,
-3.837878, 3, -5.653224, 0, 1.5, 0.5, 0.5
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
-3.363898, -3.210974, -4,
-3.363898, -3.210974, 4,
-3.363898, -3.210974, -4,
-3.521891, -3.383283, -4,
-3.363898, -3.210974, -2,
-3.521891, -3.383283, -2,
-3.363898, -3.210974, 0,
-3.521891, -3.383283, 0,
-3.363898, -3.210974, 2,
-3.521891, -3.383283, 2,
-3.363898, -3.210974, 4,
-3.521891, -3.383283, 4
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
-3.837878, -3.727901, -4, 0, -0.5, 0.5, 0.5,
-3.837878, -3.727901, -4, 1, -0.5, 0.5, 0.5,
-3.837878, -3.727901, -4, 1, 1.5, 0.5, 0.5,
-3.837878, -3.727901, -4, 0, 1.5, 0.5, 0.5,
-3.837878, -3.727901, -2, 0, -0.5, 0.5, 0.5,
-3.837878, -3.727901, -2, 1, -0.5, 0.5, 0.5,
-3.837878, -3.727901, -2, 1, 1.5, 0.5, 0.5,
-3.837878, -3.727901, -2, 0, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 0, 0, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 0, 1, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 0, 1, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 0, 0, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 2, 0, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 2, 1, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 2, 1, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 2, 0, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 4, 0, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 4, 1, -0.5, 0.5, 0.5,
-3.837878, -3.727901, 4, 1, 1.5, 0.5, 0.5,
-3.837878, -3.727901, 4, 0, 1.5, 0.5, 0.5
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
-3.363898, -3.210974, -4.91995,
-3.363898, 3.681384, -4.91995,
-3.363898, -3.210974, 4.857038,
-3.363898, 3.681384, 4.857038,
-3.363898, -3.210974, -4.91995,
-3.363898, -3.210974, 4.857038,
-3.363898, 3.681384, -4.91995,
-3.363898, 3.681384, 4.857038,
-3.363898, -3.210974, -4.91995,
2.955842, -3.210974, -4.91995,
-3.363898, -3.210974, 4.857038,
2.955842, -3.210974, 4.857038,
-3.363898, 3.681384, -4.91995,
2.955842, 3.681384, -4.91995,
-3.363898, 3.681384, 4.857038,
2.955842, 3.681384, 4.857038,
2.955842, -3.210974, -4.91995,
2.955842, 3.681384, -4.91995,
2.955842, -3.210974, 4.857038,
2.955842, 3.681384, 4.857038,
2.955842, -3.210974, -4.91995,
2.955842, -3.210974, 4.857038,
2.955842, 3.681384, -4.91995,
2.955842, 3.681384, 4.857038
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
var radius = 7.224211;
var distance = 32.14133;
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
mvMatrix.translate( 0.2040281, -0.2352052, 0.03145623 );
mvMatrix.scale( 1.235962, 1.133278, 0.7989125 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.14133);
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
3-(2-pentenyl)-2-cyc<-read.table("3-(2-pentenyl)-2-cyc.xyz", skip=1)
```

```
## Error in read.table("3-(2-pentenyl)-2-cyc.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-3-(2-pentenyl)-2-cyc$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentenyl' not found
```

```r
y<-3-(2-pentenyl)-2-cyc$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentenyl' not found
```

```r
z<-3-(2-pentenyl)-2-cyc$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentenyl' not found
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
-3.271863, 0.06377261, -1.95366, 0, 0, 1, 1, 1,
-3.052138, 0.5447938, -0.7141805, 1, 0, 0, 1, 1,
-2.975811, 1.072094, -1.452542, 1, 0, 0, 1, 1,
-2.685259, -0.5136682, -3.032996, 1, 0, 0, 1, 1,
-2.583219, 1.290135, -0.6517672, 1, 0, 0, 1, 1,
-2.570284, -0.4860501, -3.35998, 1, 0, 0, 1, 1,
-2.559205, 0.6469263, -1.834966, 0, 0, 0, 1, 1,
-2.519516, 0.242047, -1.237114, 0, 0, 0, 1, 1,
-2.512141, -0.3876949, -2.60127, 0, 0, 0, 1, 1,
-2.506842, 0.7605819, -2.520919, 0, 0, 0, 1, 1,
-2.457878, -0.1609498, 0.09257595, 0, 0, 0, 1, 1,
-2.359133, -0.3734449, -0.01508207, 0, 0, 0, 1, 1,
-2.344315, 1.030384, -1.039698, 0, 0, 0, 1, 1,
-2.331516, 1.160063, -1.631399, 1, 1, 1, 1, 1,
-2.28184, 1.183897, -1.59492, 1, 1, 1, 1, 1,
-2.208761, -0.9385892, -1.929526, 1, 1, 1, 1, 1,
-2.167127, 1.029171, -1.908547, 1, 1, 1, 1, 1,
-2.159133, -0.2374181, -0.2979936, 1, 1, 1, 1, 1,
-2.139613, 0.4756619, 0.5196424, 1, 1, 1, 1, 1,
-2.112121, -2.396674, -3.274959, 1, 1, 1, 1, 1,
-2.078359, -1.31038, -3.753127, 1, 1, 1, 1, 1,
-2.061248, 0.01401212, -2.723251, 1, 1, 1, 1, 1,
-2.025774, 0.6688511, -0.270017, 1, 1, 1, 1, 1,
-2.006932, -0.5778808, -3.52405, 1, 1, 1, 1, 1,
-1.985822, -0.2047806, -1.253028, 1, 1, 1, 1, 1,
-1.955803, -2.755595, -4.309645, 1, 1, 1, 1, 1,
-1.952124, 0.7149575, -0.6722698, 1, 1, 1, 1, 1,
-1.935618, -0.000538661, -0.474552, 1, 1, 1, 1, 1,
-1.872615, 0.6568682, -0.8488415, 0, 0, 1, 1, 1,
-1.861234, -0.1675462, -1.722224, 1, 0, 0, 1, 1,
-1.829334, 1.075006, -0.7001342, 1, 0, 0, 1, 1,
-1.802706, -0.9764504, -0.3892612, 1, 0, 0, 1, 1,
-1.794165, 0.6025229, -2.190691, 1, 0, 0, 1, 1,
-1.773464, 1.088707, -2.621838, 1, 0, 0, 1, 1,
-1.764545, -0.5465797, -2.258669, 0, 0, 0, 1, 1,
-1.762152, 3.067883, -0.3173256, 0, 0, 0, 1, 1,
-1.75991, -0.9012675, -0.6694052, 0, 0, 0, 1, 1,
-1.734351, -0.6994794, -2.41236, 0, 0, 0, 1, 1,
-1.722926, 0.9828073, -1.237368, 0, 0, 0, 1, 1,
-1.720102, -1.06225, -1.767268, 0, 0, 0, 1, 1,
-1.707279, 0.07299173, -2.287731, 0, 0, 0, 1, 1,
-1.701647, -0.7211766, -3.652165, 1, 1, 1, 1, 1,
-1.699033, 0.5122853, -1.658028, 1, 1, 1, 1, 1,
-1.696118, 0.899461, 1.178785, 1, 1, 1, 1, 1,
-1.694424, -1.865069, -3.252622, 1, 1, 1, 1, 1,
-1.688054, 1.329988, -0.4128455, 1, 1, 1, 1, 1,
-1.662902, 0.1110096, -0.8729932, 1, 1, 1, 1, 1,
-1.662422, 0.9483678, 0.03852017, 1, 1, 1, 1, 1,
-1.662283, -0.3826923, -0.150087, 1, 1, 1, 1, 1,
-1.662272, -1.07568, -2.114022, 1, 1, 1, 1, 1,
-1.64841, -1.459204, -2.204174, 1, 1, 1, 1, 1,
-1.622017, 0.3365942, 0.5080038, 1, 1, 1, 1, 1,
-1.609164, 1.139103, -1.192244, 1, 1, 1, 1, 1,
-1.588225, 1.138194, 0.6586248, 1, 1, 1, 1, 1,
-1.572436, 0.00268006, -0.6100516, 1, 1, 1, 1, 1,
-1.55624, 0.0302726, -0.6909386, 1, 1, 1, 1, 1,
-1.531935, 0.07249406, -0.7145345, 0, 0, 1, 1, 1,
-1.527139, 0.7738907, -1.982535, 1, 0, 0, 1, 1,
-1.525287, 0.07842778, -0.9671527, 1, 0, 0, 1, 1,
-1.521467, -0.05331652, 0.06856474, 1, 0, 0, 1, 1,
-1.516261, -1.324966, -0.4602336, 1, 0, 0, 1, 1,
-1.515078, 0.3764085, -0.5467039, 1, 0, 0, 1, 1,
-1.508085, 0.1944239, -0.1469113, 0, 0, 0, 1, 1,
-1.507147, -0.2453512, -2.300814, 0, 0, 0, 1, 1,
-1.505867, -0.2095204, -1.5473, 0, 0, 0, 1, 1,
-1.504853, 1.087185, -0.773512, 0, 0, 0, 1, 1,
-1.495495, -1.416997, -0.259863, 0, 0, 0, 1, 1,
-1.48276, -0.8715187, -2.839303, 0, 0, 0, 1, 1,
-1.479261, -0.4897713, -1.259931, 0, 0, 0, 1, 1,
-1.47767, 0.4082341, -1.308612, 1, 1, 1, 1, 1,
-1.47654, 0.7096711, -0.01370902, 1, 1, 1, 1, 1,
-1.472667, -0.4721424, -1.378229, 1, 1, 1, 1, 1,
-1.469943, 2.33989, 1.001539, 1, 1, 1, 1, 1,
-1.465138, -0.05620301, -3.066487, 1, 1, 1, 1, 1,
-1.463954, 0.6993746, -0.2100319, 1, 1, 1, 1, 1,
-1.455946, -1.134003, -1.136489, 1, 1, 1, 1, 1,
-1.444529, -0.5515948, -0.6310053, 1, 1, 1, 1, 1,
-1.440362, -0.3101659, -2.827194, 1, 1, 1, 1, 1,
-1.440076, -1.207305, -3.088651, 1, 1, 1, 1, 1,
-1.433145, 0.09813336, -0.6562257, 1, 1, 1, 1, 1,
-1.422312, 0.8143083, -0.006874699, 1, 1, 1, 1, 1,
-1.41875, 0.1911748, -1.752079, 1, 1, 1, 1, 1,
-1.404974, 0.6522221, -0.6149235, 1, 1, 1, 1, 1,
-1.39936, 0.3584898, -2.482752, 1, 1, 1, 1, 1,
-1.396202, 0.2318189, -1.627132, 0, 0, 1, 1, 1,
-1.393345, -0.5850368, -1.812578, 1, 0, 0, 1, 1,
-1.372047, 1.042267, -0.751741, 1, 0, 0, 1, 1,
-1.371008, -0.8027131, -2.567214, 1, 0, 0, 1, 1,
-1.365289, 1.462993, -0.7669054, 1, 0, 0, 1, 1,
-1.355647, 0.5335445, -0.25944, 1, 0, 0, 1, 1,
-1.34618, -0.06661607, -3.360711, 0, 0, 0, 1, 1,
-1.343557, -0.4449159, -3.694929, 0, 0, 0, 1, 1,
-1.340384, 0.8891459, 0.1840235, 0, 0, 0, 1, 1,
-1.327202, 0.6296801, -1.568121, 0, 0, 0, 1, 1,
-1.319419, 1.440671, -2.78107, 0, 0, 0, 1, 1,
-1.316673, -0.5968636, -1.007321, 0, 0, 0, 1, 1,
-1.313109, -1.505872, -3.310552, 0, 0, 0, 1, 1,
-1.3076, -0.3485885, -1.363991, 1, 1, 1, 1, 1,
-1.296591, 0.2092868, -3.203019, 1, 1, 1, 1, 1,
-1.28495, -0.7148697, -2.613973, 1, 1, 1, 1, 1,
-1.283974, -1.300063, -1.342302, 1, 1, 1, 1, 1,
-1.283592, 0.5820168, -1.642608, 1, 1, 1, 1, 1,
-1.276316, 0.2872621, -0.9476202, 1, 1, 1, 1, 1,
-1.267969, 1.021566, -0.1045238, 1, 1, 1, 1, 1,
-1.265235, -0.469525, -3.082758, 1, 1, 1, 1, 1,
-1.259979, 0.5569202, -0.1970833, 1, 1, 1, 1, 1,
-1.257978, -2.113857, -2.457469, 1, 1, 1, 1, 1,
-1.249957, 0.407836, -0.02738779, 1, 1, 1, 1, 1,
-1.245546, -1.090533, -3.182793, 1, 1, 1, 1, 1,
-1.244824, -0.7962129, -2.868616, 1, 1, 1, 1, 1,
-1.229699, 0.9969127, -0.1187445, 1, 1, 1, 1, 1,
-1.221116, 0.4826901, -2.340193, 1, 1, 1, 1, 1,
-1.200791, 1.507592, 1.084205, 0, 0, 1, 1, 1,
-1.199664, -0.8390785, -3.595892, 1, 0, 0, 1, 1,
-1.199545, 0.2507136, -1.63827, 1, 0, 0, 1, 1,
-1.168229, 0.5439419, -2.164238, 1, 0, 0, 1, 1,
-1.166742, -0.6325032, -1.858688, 1, 0, 0, 1, 1,
-1.152415, -1.277066, -2.448883, 1, 0, 0, 1, 1,
-1.149184, 1.204967, -1.750065, 0, 0, 0, 1, 1,
-1.144257, -1.295979, -2.098128, 0, 0, 0, 1, 1,
-1.139537, 0.1857978, -1.404785, 0, 0, 0, 1, 1,
-1.132538, -0.1069033, -0.8408032, 0, 0, 0, 1, 1,
-1.12833, -0.9337229, -3.78005, 0, 0, 0, 1, 1,
-1.126384, -0.2634875, -2.16864, 0, 0, 0, 1, 1,
-1.125911, 0.04106552, -0.9361861, 0, 0, 0, 1, 1,
-1.120519, 0.08023509, -2.523097, 1, 1, 1, 1, 1,
-1.117508, -0.6017189, -1.323195, 1, 1, 1, 1, 1,
-1.112581, -0.6060274, -2.462688, 1, 1, 1, 1, 1,
-1.106131, -0.860396, -2.489778, 1, 1, 1, 1, 1,
-1.102815, 0.1056969, -0.982558, 1, 1, 1, 1, 1,
-1.102488, -1.905103, -3.119874, 1, 1, 1, 1, 1,
-1.097438, 0.3976307, -0.1484488, 1, 1, 1, 1, 1,
-1.084785, 1.530286, 0.2642791, 1, 1, 1, 1, 1,
-1.084205, -0.8980372, -0.9670443, 1, 1, 1, 1, 1,
-1.082441, 0.669027, -0.1610402, 1, 1, 1, 1, 1,
-1.079555, -0.3694634, -1.207528, 1, 1, 1, 1, 1,
-1.077749, 1.017101, 0.3469729, 1, 1, 1, 1, 1,
-1.053834, 0.08803439, -2.967616, 1, 1, 1, 1, 1,
-1.050794, -0.5124738, -2.814767, 1, 1, 1, 1, 1,
-1.04999, -0.4237419, -3.369919, 1, 1, 1, 1, 1,
-1.042633, 0.5251115, -1.559875, 0, 0, 1, 1, 1,
-1.041243, -0.2215621, -2.06842, 1, 0, 0, 1, 1,
-1.02075, -0.1175223, -0.8171137, 1, 0, 0, 1, 1,
-1.016056, 0.1864775, -0.7820047, 1, 0, 0, 1, 1,
-1.01119, 0.2652026, 0.1613659, 1, 0, 0, 1, 1,
-1.009763, 0.5484381, -0.3086314, 1, 0, 0, 1, 1,
-1.002347, 1.009396, -1.89437, 0, 0, 0, 1, 1,
-0.9973288, 1.17569, 0.3481008, 0, 0, 0, 1, 1,
-0.9956589, -0.2421886, 0.04850818, 0, 0, 0, 1, 1,
-0.9891478, 1.176774, -1.53791, 0, 0, 0, 1, 1,
-0.9823024, -0.7231247, -0.9336573, 0, 0, 0, 1, 1,
-0.9787175, 0.728839, -0.3276354, 0, 0, 0, 1, 1,
-0.9762645, -0.2438414, -1.748609, 0, 0, 0, 1, 1,
-0.9685722, -0.531391, -0.929258, 1, 1, 1, 1, 1,
-0.9619683, 1.914952, -1.828046, 1, 1, 1, 1, 1,
-0.9606923, -0.03910119, -0.560522, 1, 1, 1, 1, 1,
-0.9548221, -0.06820033, -2.043378, 1, 1, 1, 1, 1,
-0.9515656, 0.3742853, -0.74839, 1, 1, 1, 1, 1,
-0.9414307, -0.1008526, -2.22877, 1, 1, 1, 1, 1,
-0.9398592, 0.8612667, -0.762818, 1, 1, 1, 1, 1,
-0.9326359, -1.021462, -2.10081, 1, 1, 1, 1, 1,
-0.9299034, -0.398419, -4.174711, 1, 1, 1, 1, 1,
-0.9229671, -1.65362, -1.878627, 1, 1, 1, 1, 1,
-0.9176586, -3.1106, -3.766247, 1, 1, 1, 1, 1,
-0.9166478, 0.7596887, -3.089572, 1, 1, 1, 1, 1,
-0.9146541, -0.01663145, -0.5401597, 1, 1, 1, 1, 1,
-0.9129115, -0.3603822, -4.38611, 1, 1, 1, 1, 1,
-0.9098446, 0.9697891, -0.177775, 1, 1, 1, 1, 1,
-0.9096157, 0.07677475, 0.0997669, 0, 0, 1, 1, 1,
-0.8984475, 0.8856632, -1.591305, 1, 0, 0, 1, 1,
-0.897085, -1.194566, -2.974928, 1, 0, 0, 1, 1,
-0.8935102, -0.7259927, -1.094074, 1, 0, 0, 1, 1,
-0.8926722, 0.6900572, -1.002329, 1, 0, 0, 1, 1,
-0.891687, 0.09819078, 0.3762161, 1, 0, 0, 1, 1,
-0.8914982, -0.3394825, -1.10658, 0, 0, 0, 1, 1,
-0.8906077, 0.1960074, -1.60666, 0, 0, 0, 1, 1,
-0.8890628, 0.904048, -1.856469, 0, 0, 0, 1, 1,
-0.8881704, -1.096856, -1.830039, 0, 0, 0, 1, 1,
-0.8850106, -0.1205088, -1.834217, 0, 0, 0, 1, 1,
-0.8808588, -0.2390119, -0.6446069, 0, 0, 0, 1, 1,
-0.8781492, -0.1357976, -2.12194, 0, 0, 0, 1, 1,
-0.8725615, 0.9694859, -1.677803, 1, 1, 1, 1, 1,
-0.8511429, -2.735291, -1.669626, 1, 1, 1, 1, 1,
-0.8497545, -0.4538288, -1.500266, 1, 1, 1, 1, 1,
-0.8484328, 0.5810511, -1.729958, 1, 1, 1, 1, 1,
-0.8474207, -1.417715, -2.255698, 1, 1, 1, 1, 1,
-0.8393927, 1.238129, 0.04558249, 1, 1, 1, 1, 1,
-0.8329268, -0.7649735, -1.27043, 1, 1, 1, 1, 1,
-0.8324929, -0.3125105, -2.418718, 1, 1, 1, 1, 1,
-0.8305097, -1.366751, -3.595433, 1, 1, 1, 1, 1,
-0.8299111, -0.2497621, -2.490934, 1, 1, 1, 1, 1,
-0.8285309, 1.418417, 0.46552, 1, 1, 1, 1, 1,
-0.8268137, -0.5486871, -2.863126, 1, 1, 1, 1, 1,
-0.8172646, -0.1943992, -1.210861, 1, 1, 1, 1, 1,
-0.8159575, -1.092422, -2.004724, 1, 1, 1, 1, 1,
-0.8101764, -0.9277486, -1.724952, 1, 1, 1, 1, 1,
-0.8075287, -0.6315019, -3.180093, 0, 0, 1, 1, 1,
-0.8006312, 0.6807793, -1.615239, 1, 0, 0, 1, 1,
-0.7976668, 0.4760814, -1.420378, 1, 0, 0, 1, 1,
-0.7959269, 0.933982, -2.606705, 1, 0, 0, 1, 1,
-0.7846045, 0.3365812, 1.231819, 1, 0, 0, 1, 1,
-0.7812502, 1.017654, 0.3050818, 1, 0, 0, 1, 1,
-0.7802827, -0.5912265, -2.046457, 0, 0, 0, 1, 1,
-0.7760293, 0.1056394, -0.158036, 0, 0, 0, 1, 1,
-0.7737201, 0.1960396, -1.891493, 0, 0, 0, 1, 1,
-0.7719343, -0.6375241, -3.598255, 0, 0, 0, 1, 1,
-0.7688157, -0.7920922, -3.071151, 0, 0, 0, 1, 1,
-0.7643255, -0.7388389, -1.613658, 0, 0, 0, 1, 1,
-0.7611874, 0.1759783, -0.8062175, 0, 0, 0, 1, 1,
-0.7595479, -0.7274501, -3.703135, 1, 1, 1, 1, 1,
-0.7587355, -0.3711579, -2.975363, 1, 1, 1, 1, 1,
-0.7495968, -0.9570724, -0.3110443, 1, 1, 1, 1, 1,
-0.7486626, -0.4589011, -1.857522, 1, 1, 1, 1, 1,
-0.7460911, -0.3581378, -2.153092, 1, 1, 1, 1, 1,
-0.7451666, -0.3107327, -2.235631, 1, 1, 1, 1, 1,
-0.7286747, -0.2393573, -3.90369, 1, 1, 1, 1, 1,
-0.7280695, -1.26204, -3.455517, 1, 1, 1, 1, 1,
-0.7279328, -0.00767629, -2.204926, 1, 1, 1, 1, 1,
-0.7250141, 0.9797912, 0.7793208, 1, 1, 1, 1, 1,
-0.7116686, 0.9354621, -0.4658455, 1, 1, 1, 1, 1,
-0.7097694, 0.4011945, -2.866074, 1, 1, 1, 1, 1,
-0.7095846, 0.07480701, -0.535795, 1, 1, 1, 1, 1,
-0.7065459, 1.306863, -0.7432602, 1, 1, 1, 1, 1,
-0.7050804, -1.173275, -3.425085, 1, 1, 1, 1, 1,
-0.7004365, 1.782057, -0.9685317, 0, 0, 1, 1, 1,
-0.6993448, 1.135027, -0.3209631, 1, 0, 0, 1, 1,
-0.6992019, -0.04652604, -1.198875, 1, 0, 0, 1, 1,
-0.6991855, -1.462539, -3.69098, 1, 0, 0, 1, 1,
-0.6982177, 0.3747111, -1.344667, 1, 0, 0, 1, 1,
-0.696948, -0.2079592, -1.621569, 1, 0, 0, 1, 1,
-0.6959069, -1.528877, -3.135907, 0, 0, 0, 1, 1,
-0.6935939, -0.3591418, -1.638278, 0, 0, 0, 1, 1,
-0.692941, -0.5290467, -1.424284, 0, 0, 0, 1, 1,
-0.6921315, -1.527098, -3.46529, 0, 0, 0, 1, 1,
-0.6907688, 1.119635, -0.7509202, 0, 0, 0, 1, 1,
-0.6900313, -0.8091015, -1.719367, 0, 0, 0, 1, 1,
-0.6881484, 1.75445, 0.2126498, 0, 0, 0, 1, 1,
-0.6859507, 0.4736981, -0.5539302, 1, 1, 1, 1, 1,
-0.6831832, 1.669754, 0.9573458, 1, 1, 1, 1, 1,
-0.6789177, -1.093572, -2.962251, 1, 1, 1, 1, 1,
-0.6762186, -0.2594937, -3.880483, 1, 1, 1, 1, 1,
-0.6699609, -1.117524, -1.926068, 1, 1, 1, 1, 1,
-0.6680583, -0.1876368, -1.139166, 1, 1, 1, 1, 1,
-0.6667169, -0.6306075, -1.499201, 1, 1, 1, 1, 1,
-0.6632328, -0.5348069, -2.35097, 1, 1, 1, 1, 1,
-0.6607761, -0.0863895, -1.596256, 1, 1, 1, 1, 1,
-0.6455278, -1.728712, -2.802078, 1, 1, 1, 1, 1,
-0.6446009, -0.4868645, -1.014371, 1, 1, 1, 1, 1,
-0.6306273, 2.032273, 0.5836589, 1, 1, 1, 1, 1,
-0.62633, 0.08932276, -1.459247, 1, 1, 1, 1, 1,
-0.6246724, -1.287868, -2.40281, 1, 1, 1, 1, 1,
-0.6215649, -0.4383586, -1.60624, 1, 1, 1, 1, 1,
-0.6193533, -0.02871221, -2.348266, 0, 0, 1, 1, 1,
-0.6156002, 1.926689, 0.222317, 1, 0, 0, 1, 1,
-0.6130806, -0.1654884, -0.9225881, 1, 0, 0, 1, 1,
-0.612765, 1.532761, -0.4375796, 1, 0, 0, 1, 1,
-0.6081724, -0.1138078, -0.9452613, 1, 0, 0, 1, 1,
-0.6074544, 0.3494259, -2.516097, 1, 0, 0, 1, 1,
-0.5997323, 0.9853175, 0.242284, 0, 0, 0, 1, 1,
-0.5987644, -0.1260497, -2.122554, 0, 0, 0, 1, 1,
-0.5949596, 0.5377873, -0.8889172, 0, 0, 0, 1, 1,
-0.5940052, 0.3528239, -2.025103, 0, 0, 0, 1, 1,
-0.5773215, -0.9028966, -2.934915, 0, 0, 0, 1, 1,
-0.5755026, 0.1286411, -0.1651739, 0, 0, 0, 1, 1,
-0.5754285, 1.09989, -0.683337, 0, 0, 0, 1, 1,
-0.575085, -2.274418, -2.503087, 1, 1, 1, 1, 1,
-0.5697383, 0.0003775693, -0.924577, 1, 1, 1, 1, 1,
-0.5641053, -0.6447998, -3.222328, 1, 1, 1, 1, 1,
-0.5629406, -1.114173, -3.509852, 1, 1, 1, 1, 1,
-0.5623452, 0.7544906, 0.8010389, 1, 1, 1, 1, 1,
-0.5620549, -1.828296, -2.729646, 1, 1, 1, 1, 1,
-0.5583996, -0.1285978, -1.618277, 1, 1, 1, 1, 1,
-0.5571496, 0.4927894, 0.1887314, 1, 1, 1, 1, 1,
-0.550851, 0.6082644, -1.595615, 1, 1, 1, 1, 1,
-0.5501283, -0.2575062, -2.013379, 1, 1, 1, 1, 1,
-0.5498638, -1.86, -2.301675, 1, 1, 1, 1, 1,
-0.5465747, -0.4448839, -0.9159615, 1, 1, 1, 1, 1,
-0.5419517, -1.077729, -4.228849, 1, 1, 1, 1, 1,
-0.5404346, 1.250869, -1.550153, 1, 1, 1, 1, 1,
-0.5394333, 1.007211, 0.2555295, 1, 1, 1, 1, 1,
-0.5377273, -1.194801, -4.501217, 0, 0, 1, 1, 1,
-0.5362458, -0.3672287, -4.563817, 1, 0, 0, 1, 1,
-0.5341775, -3.043857, -4.560622, 1, 0, 0, 1, 1,
-0.528116, 0.2945287, 0.3676723, 1, 0, 0, 1, 1,
-0.5196334, -0.657683, -2.448315, 1, 0, 0, 1, 1,
-0.5192313, -0.1002747, -3.27945, 1, 0, 0, 1, 1,
-0.5167363, -0.5846487, -3.997789, 0, 0, 0, 1, 1,
-0.5090263, -0.03143319, -1.120731, 0, 0, 0, 1, 1,
-0.5075207, 0.4798447, 0.06899092, 0, 0, 0, 1, 1,
-0.5032801, 0.3594809, -0.391455, 0, 0, 0, 1, 1,
-0.5017688, 0.210757, -2.850514, 0, 0, 0, 1, 1,
-0.500013, 1.782896, 0.16522, 0, 0, 0, 1, 1,
-0.4991986, 0.6618162, 0.4211693, 0, 0, 0, 1, 1,
-0.4912626, 1.024316, 0.06479445, 1, 1, 1, 1, 1,
-0.4880034, 0.3522124, -1.814124, 1, 1, 1, 1, 1,
-0.4862115, -0.1051216, -2.198153, 1, 1, 1, 1, 1,
-0.4852341, -0.07191253, 0.02042124, 1, 1, 1, 1, 1,
-0.4851133, -0.06780102, -2.384829, 1, 1, 1, 1, 1,
-0.4760388, 0.09803969, -1.528687, 1, 1, 1, 1, 1,
-0.4726075, 1.070579, -1.907813, 1, 1, 1, 1, 1,
-0.4722519, -0.821565, -1.990556, 1, 1, 1, 1, 1,
-0.4718393, -0.1928378, -2.349961, 1, 1, 1, 1, 1,
-0.4677437, 1.835149, -0.3729204, 1, 1, 1, 1, 1,
-0.467447, -2.289775, -2.224877, 1, 1, 1, 1, 1,
-0.4669624, 1.266113, -1.513889, 1, 1, 1, 1, 1,
-0.4658549, 0.1449147, -1.230432, 1, 1, 1, 1, 1,
-0.4645645, -0.9500236, -1.063196, 1, 1, 1, 1, 1,
-0.4557835, -0.5984203, -1.80474, 1, 1, 1, 1, 1,
-0.4527523, 0.03443668, -0.9461088, 0, 0, 1, 1, 1,
-0.4524398, 0.5070015, -2.204941, 1, 0, 0, 1, 1,
-0.4491196, -1.007755, -2.69006, 1, 0, 0, 1, 1,
-0.4467462, 0.8619761, -1.376246, 1, 0, 0, 1, 1,
-0.4449675, 0.534596, -0.6714915, 1, 0, 0, 1, 1,
-0.4445522, 2.205222, -1.200218, 1, 0, 0, 1, 1,
-0.4427895, 1.076565, 0.213218, 0, 0, 0, 1, 1,
-0.4398598, 1.59574, -0.6414057, 0, 0, 0, 1, 1,
-0.4357207, -1.45411, -4.30228, 0, 0, 0, 1, 1,
-0.4330715, 0.3805891, 0.07646763, 0, 0, 0, 1, 1,
-0.431376, 0.9061164, -0.6578668, 0, 0, 0, 1, 1,
-0.4179723, 0.256973, -1.053407, 0, 0, 0, 1, 1,
-0.4172999, 0.3591822, -1.257688, 0, 0, 0, 1, 1,
-0.4117805, 0.4215852, -1.099562, 1, 1, 1, 1, 1,
-0.4045142, 0.132557, -2.78853, 1, 1, 1, 1, 1,
-0.4014505, 1.228097, 0.09577778, 1, 1, 1, 1, 1,
-0.4004278, -0.9512722, -3.475312, 1, 1, 1, 1, 1,
-0.3957886, -0.3681803, -2.582642, 1, 1, 1, 1, 1,
-0.3914894, -0.2806634, -2.743486, 1, 1, 1, 1, 1,
-0.3908357, -0.2324263, -0.8217152, 1, 1, 1, 1, 1,
-0.3903643, 0.1690022, -2.315973, 1, 1, 1, 1, 1,
-0.3896914, -0.2942701, -1.886755, 1, 1, 1, 1, 1,
-0.3891359, -0.4079909, -1.14087, 1, 1, 1, 1, 1,
-0.3888892, 0.2624786, -2.205181, 1, 1, 1, 1, 1,
-0.3799767, -0.03836402, -0.4547721, 1, 1, 1, 1, 1,
-0.376585, -0.01808284, -1.548853, 1, 1, 1, 1, 1,
-0.3762786, 0.5641361, 0.07059936, 1, 1, 1, 1, 1,
-0.3746003, -0.3134106, -1.392789, 1, 1, 1, 1, 1,
-0.3736042, 1.330021, -0.4584747, 0, 0, 1, 1, 1,
-0.371521, 0.1384369, -2.403554, 1, 0, 0, 1, 1,
-0.367406, 0.2586675, -0.8581071, 1, 0, 0, 1, 1,
-0.3664081, -1.036238, -2.639899, 1, 0, 0, 1, 1,
-0.3645757, -1.133691, -2.901026, 1, 0, 0, 1, 1,
-0.3619706, 1.567413, -0.3210366, 1, 0, 0, 1, 1,
-0.36107, 0.4209143, 0.1782809, 0, 0, 0, 1, 1,
-0.3603923, 0.5703548, -0.2745242, 0, 0, 0, 1, 1,
-0.3583211, 1.131842, -0.8496605, 0, 0, 0, 1, 1,
-0.3574913, -0.5123004, -1.725977, 0, 0, 0, 1, 1,
-0.3561461, -0.5536225, -3.595429, 0, 0, 0, 1, 1,
-0.3561105, -0.6618013, -3.113008, 0, 0, 0, 1, 1,
-0.352003, -0.6047517, -1.282757, 0, 0, 0, 1, 1,
-0.3484223, -0.9023042, -3.525633, 1, 1, 1, 1, 1,
-0.348111, -1.365731, -3.377815, 1, 1, 1, 1, 1,
-0.3468615, 0.2731707, 0.3591411, 1, 1, 1, 1, 1,
-0.3411884, -0.1623169, -1.407495, 1, 1, 1, 1, 1,
-0.3378114, 2.017957, -0.3028228, 1, 1, 1, 1, 1,
-0.3335364, 0.3050162, 0.2227256, 1, 1, 1, 1, 1,
-0.3299292, 0.8535567, -0.001233546, 1, 1, 1, 1, 1,
-0.3251291, -1.545215, -4.273354, 1, 1, 1, 1, 1,
-0.3242479, 0.7256452, 0.5363241, 1, 1, 1, 1, 1,
-0.3171832, 0.8363567, -1.207855, 1, 1, 1, 1, 1,
-0.3073079, 0.4774128, 0.4537829, 1, 1, 1, 1, 1,
-0.3015921, 1.738776, 0.3316053, 1, 1, 1, 1, 1,
-0.3004526, 2.269087, 0.8708777, 1, 1, 1, 1, 1,
-0.2975608, 0.3812953, -1.922495, 1, 1, 1, 1, 1,
-0.2967757, 1.528324, 0.5617969, 1, 1, 1, 1, 1,
-0.2964827, 1.802331, -0.9198828, 0, 0, 1, 1, 1,
-0.294763, 1.734854, -0.02081151, 1, 0, 0, 1, 1,
-0.2947602, 0.2591005, -1.254768, 1, 0, 0, 1, 1,
-0.2919761, -0.6058112, -3.063652, 1, 0, 0, 1, 1,
-0.2899851, -0.2812164, -1.907718, 1, 0, 0, 1, 1,
-0.2898973, -0.7594571, -2.085726, 1, 0, 0, 1, 1,
-0.2872461, -1.704325, -2.230142, 0, 0, 0, 1, 1,
-0.2870383, 0.8340672, 0.5851329, 0, 0, 0, 1, 1,
-0.2842121, -0.1555636, -0.7795563, 0, 0, 0, 1, 1,
-0.2716056, 0.6492013, -1.432722, 0, 0, 0, 1, 1,
-0.2680041, -2.347005, -3.087608, 0, 0, 0, 1, 1,
-0.2671291, 0.8877686, -1.038627, 0, 0, 0, 1, 1,
-0.2670063, 1.235369, 0.6090081, 0, 0, 0, 1, 1,
-0.2639836, -1.102571, -3.734547, 1, 1, 1, 1, 1,
-0.2629683, -0.3611189, -2.187604, 1, 1, 1, 1, 1,
-0.2620578, 0.8118877, -0.2613773, 1, 1, 1, 1, 1,
-0.2593504, 0.497292, -0.6587703, 1, 1, 1, 1, 1,
-0.2569202, 0.6884883, -0.6333795, 1, 1, 1, 1, 1,
-0.2559399, 1.560387, -0.5466279, 1, 1, 1, 1, 1,
-0.2545547, -0.8084054, -2.615076, 1, 1, 1, 1, 1,
-0.2503133, -0.7569076, -1.408494, 1, 1, 1, 1, 1,
-0.2454791, -0.3119477, -2.164452, 1, 1, 1, 1, 1,
-0.245332, -0.820775, -2.514977, 1, 1, 1, 1, 1,
-0.2439056, 1.049377, -1.796953, 1, 1, 1, 1, 1,
-0.2421694, -0.698974, -0.6248409, 1, 1, 1, 1, 1,
-0.2396707, 0.2834338, -0.336651, 1, 1, 1, 1, 1,
-0.2393019, 0.9145738, -0.714293, 1, 1, 1, 1, 1,
-0.2327106, 0.04900344, -1.469762, 1, 1, 1, 1, 1,
-0.2315003, -0.8037496, -2.42077, 0, 0, 1, 1, 1,
-0.2276613, 1.177107, 0.8755249, 1, 0, 0, 1, 1,
-0.2219494, 0.3598616, -0.8262222, 1, 0, 0, 1, 1,
-0.2139685, 1.724012, 1.525181, 1, 0, 0, 1, 1,
-0.2136137, -0.5706614, -2.76522, 1, 0, 0, 1, 1,
-0.2104033, -0.2330722, -2.250907, 1, 0, 0, 1, 1,
-0.2092718, 0.1780253, 0.3158688, 0, 0, 0, 1, 1,
-0.2091998, -0.8153601, -1.486626, 0, 0, 0, 1, 1,
-0.2077148, -0.1683684, -1.285227, 0, 0, 0, 1, 1,
-0.2021962, -0.7500825, -2.205798, 0, 0, 0, 1, 1,
-0.2016001, -1.837814, -3.585696, 0, 0, 0, 1, 1,
-0.1943496, -0.4025857, -3.218715, 0, 0, 0, 1, 1,
-0.1929003, -0.4831697, -4.348907, 0, 0, 0, 1, 1,
-0.192297, 0.03202626, -2.679525, 1, 1, 1, 1, 1,
-0.1885621, 0.3568006, 0.01933407, 1, 1, 1, 1, 1,
-0.185212, 2.088567, -0.09135315, 1, 1, 1, 1, 1,
-0.1834091, -1.273109, -2.696992, 1, 1, 1, 1, 1,
-0.179672, -0.07662444, -2.160797, 1, 1, 1, 1, 1,
-0.1789271, 0.3279123, -2.477876, 1, 1, 1, 1, 1,
-0.1773891, -0.4481003, -1.008919, 1, 1, 1, 1, 1,
-0.1763963, -0.390619, -3.635026, 1, 1, 1, 1, 1,
-0.1735016, -0.09847569, -2.027041, 1, 1, 1, 1, 1,
-0.1693532, -1.52776, -2.629742, 1, 1, 1, 1, 1,
-0.1644691, 0.7739877, -0.2872957, 1, 1, 1, 1, 1,
-0.1615683, -0.01791828, -0.4934438, 1, 1, 1, 1, 1,
-0.1615621, -1.081284, -2.873898, 1, 1, 1, 1, 1,
-0.1597989, 1.052181, 0.3198971, 1, 1, 1, 1, 1,
-0.1568614, -0.4130525, -1.890274, 1, 1, 1, 1, 1,
-0.1549706, 3.557854, 0.3358771, 0, 0, 1, 1, 1,
-0.1508588, -1.420005, -2.414749, 1, 0, 0, 1, 1,
-0.1504582, 1.413146, 0.4794106, 1, 0, 0, 1, 1,
-0.1481118, -1.843606, -2.876401, 1, 0, 0, 1, 1,
-0.1464054, 0.5528191, -1.519894, 1, 0, 0, 1, 1,
-0.1460004, 1.584505, 0.7987651, 1, 0, 0, 1, 1,
-0.141307, -0.3335513, -2.739329, 0, 0, 0, 1, 1,
-0.1405, -0.2312409, -1.207971, 0, 0, 0, 1, 1,
-0.1403107, -0.5600694, -4.777567, 0, 0, 0, 1, 1,
-0.1369247, 0.1132722, -0.820518, 0, 0, 0, 1, 1,
-0.1362927, 0.2814786, -0.6817439, 0, 0, 0, 1, 1,
-0.1347206, 0.8321345, -1.848662, 0, 0, 0, 1, 1,
-0.1341794, 0.3546904, -0.4704324, 0, 0, 0, 1, 1,
-0.1338614, 1.238337, 0.3785744, 1, 1, 1, 1, 1,
-0.1294276, -1.71902, -1.737988, 1, 1, 1, 1, 1,
-0.1272508, -2.167814, -1.628354, 1, 1, 1, 1, 1,
-0.1268257, -0.7197593, -3.046502, 1, 1, 1, 1, 1,
-0.1224063, 0.2590148, 0.1813148, 1, 1, 1, 1, 1,
-0.1184691, -0.5598468, -2.645653, 1, 1, 1, 1, 1,
-0.116949, 0.2696932, -1.205903, 1, 1, 1, 1, 1,
-0.1149528, 0.2602495, 0.3210166, 1, 1, 1, 1, 1,
-0.1031462, -0.7051314, -3.291245, 1, 1, 1, 1, 1,
-0.1003718, 0.8533848, -0.3983963, 1, 1, 1, 1, 1,
-0.09998241, 0.372004, -0.5301816, 1, 1, 1, 1, 1,
-0.09778694, 0.2389148, -0.3558037, 1, 1, 1, 1, 1,
-0.09533903, -0.8420297, -3.223726, 1, 1, 1, 1, 1,
-0.08674748, -0.5626245, -2.922288, 1, 1, 1, 1, 1,
-0.08392294, -0.8282613, -3.211771, 1, 1, 1, 1, 1,
-0.08319187, -2.386096, -2.983633, 0, 0, 1, 1, 1,
-0.07672814, -0.5923384, -3.405735, 1, 0, 0, 1, 1,
-0.07253297, 0.9325016, -0.929624, 1, 0, 0, 1, 1,
-0.07158029, 1.723641, -0.7239103, 1, 0, 0, 1, 1,
-0.07111143, -0.0103914, -2.815996, 1, 0, 0, 1, 1,
-0.06138131, -0.4504395, -3.90687, 1, 0, 0, 1, 1,
-0.06115226, 0.1031654, -1.679695, 0, 0, 0, 1, 1,
-0.06099663, -0.1768575, -4.542162, 0, 0, 0, 1, 1,
-0.06097157, -1.112904, -1.963022, 0, 0, 0, 1, 1,
-0.05832504, 0.9704359, -1.460844, 0, 0, 0, 1, 1,
-0.05827122, 1.285437, 0.6267866, 0, 0, 0, 1, 1,
-0.0548346, -0.9417568, -1.551712, 0, 0, 0, 1, 1,
-0.05318621, -0.1129816, -2.541053, 0, 0, 0, 1, 1,
-0.05229624, -0.8266192, -3.614746, 1, 1, 1, 1, 1,
-0.05208344, 2.393284, -1.023512, 1, 1, 1, 1, 1,
-0.04426967, 0.1811478, -1.990216, 1, 1, 1, 1, 1,
-0.0380565, 0.7322502, 0.1542619, 1, 1, 1, 1, 1,
-0.03661048, 0.2796972, 0.9182419, 1, 1, 1, 1, 1,
-0.03271881, -0.463334, -2.837671, 1, 1, 1, 1, 1,
-0.02750668, -0.2396312, -4.017542, 1, 1, 1, 1, 1,
-0.02509651, 0.2549112, 0.2888475, 1, 1, 1, 1, 1,
-0.02363968, 0.01970095, -0.4904698, 1, 1, 1, 1, 1,
-0.02363678, 0.4023824, 1.062682, 1, 1, 1, 1, 1,
-0.02320714, 0.1621041, 0.5518268, 1, 1, 1, 1, 1,
-0.01826027, -0.4348788, -3.242757, 1, 1, 1, 1, 1,
-0.01764341, 0.08938723, -0.5389043, 1, 1, 1, 1, 1,
-0.01648733, -1.294041, -3.202818, 1, 1, 1, 1, 1,
-0.01534786, -1.134243, -2.371394, 1, 1, 1, 1, 1,
-0.01399804, 0.2143597, -0.1929302, 0, 0, 1, 1, 1,
-0.01389533, 1.752521, -1.793004, 1, 0, 0, 1, 1,
-0.012293, 1.382071, 0.659296, 1, 0, 0, 1, 1,
-0.01102407, 0.7968115, -0.3413264, 1, 0, 0, 1, 1,
-0.01028412, -0.5558262, -3.679995, 1, 0, 0, 1, 1,
-0.005309662, -0.9460052, -3.808226, 1, 0, 0, 1, 1,
-0.001962544, -0.6499191, -4.073143, 0, 0, 0, 1, 1,
0.001390475, 0.1618938, 1.136544, 0, 0, 0, 1, 1,
0.002019494, -1.221633, 2.888279, 0, 0, 0, 1, 1,
0.003726367, -0.6934206, 4.484206, 0, 0, 0, 1, 1,
0.004401553, 0.1680926, 0.4097588, 0, 0, 0, 1, 1,
0.005465071, 1.690394, -0.9361468, 0, 0, 0, 1, 1,
0.008094305, -0.6171198, 1.475734, 0, 0, 0, 1, 1,
0.01265487, 0.03269223, 1.268398, 1, 1, 1, 1, 1,
0.01488592, 1.162982, 0.08507402, 1, 1, 1, 1, 1,
0.0179166, -0.7003998, 3.941816, 1, 1, 1, 1, 1,
0.0187034, 1.50198, -0.4797102, 1, 1, 1, 1, 1,
0.01923174, -0.5535122, 1.604422, 1, 1, 1, 1, 1,
0.02243551, -0.007752527, 1.36812, 1, 1, 1, 1, 1,
0.02959987, 1.237722, -2.382748, 1, 1, 1, 1, 1,
0.03236047, -0.3835971, 1.16004, 1, 1, 1, 1, 1,
0.03743205, 0.3904004, 1.177082, 1, 1, 1, 1, 1,
0.03758632, -0.08833366, 0.02322176, 1, 1, 1, 1, 1,
0.03998702, -0.845636, 2.835553, 1, 1, 1, 1, 1,
0.0420572, 0.1865647, 0.8698118, 1, 1, 1, 1, 1,
0.05191129, 1.008439, 0.5891668, 1, 1, 1, 1, 1,
0.05282949, -0.06305015, 3.043254, 1, 1, 1, 1, 1,
0.05378677, -1.394174, 3.621868, 1, 1, 1, 1, 1,
0.05621871, -0.4673922, 2.666767, 0, 0, 1, 1, 1,
0.0599577, 0.6609194, 0.3329321, 1, 0, 0, 1, 1,
0.0601912, -0.155818, 2.602644, 1, 0, 0, 1, 1,
0.06494813, -0.7563854, 2.508888, 1, 0, 0, 1, 1,
0.07062772, 0.9791348, 0.4917823, 1, 0, 0, 1, 1,
0.07336245, 0.9323875, 1.329534, 1, 0, 0, 1, 1,
0.07553595, 0.7385173, 0.6147028, 0, 0, 0, 1, 1,
0.07803558, 0.1008425, -1.405227, 0, 0, 0, 1, 1,
0.07859, 2.302096, -0.1662947, 0, 0, 0, 1, 1,
0.0787307, 1.697503, -0.3129503, 0, 0, 0, 1, 1,
0.07904651, -1.007853, 2.779082, 0, 0, 0, 1, 1,
0.08265415, 2.336905, 0.0203302, 0, 0, 0, 1, 1,
0.08483996, 1.245573, -0.1023418, 0, 0, 0, 1, 1,
0.08658386, 0.633133, 0.5642076, 1, 1, 1, 1, 1,
0.088485, -1.293741, 4.428617, 1, 1, 1, 1, 1,
0.08992731, 0.4591421, 2.697331, 1, 1, 1, 1, 1,
0.09274377, -0.1072965, 1.755139, 1, 1, 1, 1, 1,
0.09394771, -0.4169791, 1.511066, 1, 1, 1, 1, 1,
0.09473689, -1.077699, 2.205656, 1, 1, 1, 1, 1,
0.09525295, 0.6908723, 0.7811058, 1, 1, 1, 1, 1,
0.09911142, 0.1720172, -0.05368803, 1, 1, 1, 1, 1,
0.09913205, 0.09553932, 0.9235578, 1, 1, 1, 1, 1,
0.09976705, -0.6416416, 4.55, 1, 1, 1, 1, 1,
0.10002, -0.8592366, 3.340333, 1, 1, 1, 1, 1,
0.1006479, -0.00685912, 2.114138, 1, 1, 1, 1, 1,
0.1040973, -1.391732, 2.252402, 1, 1, 1, 1, 1,
0.1062958, -0.4124116, 2.553802, 1, 1, 1, 1, 1,
0.1101579, -2.038448, 3.910843, 1, 1, 1, 1, 1,
0.1112219, 1.210674, 1.655177, 0, 0, 1, 1, 1,
0.1153089, -1.610024, 2.920247, 1, 0, 0, 1, 1,
0.118181, 1.461816, 1.259947, 1, 0, 0, 1, 1,
0.1189504, 0.4917696, -2.597302, 1, 0, 0, 1, 1,
0.1190365, -0.7059205, 3.55786, 1, 0, 0, 1, 1,
0.1255453, 0.1489022, 1.611093, 1, 0, 0, 1, 1,
0.129749, -0.4851449, 1.524304, 0, 0, 0, 1, 1,
0.1358194, -0.484199, 3.459011, 0, 0, 0, 1, 1,
0.1364556, -0.8699105, 3.052146, 0, 0, 0, 1, 1,
0.1378406, -0.8455427, 2.061999, 0, 0, 0, 1, 1,
0.1428515, 0.4746814, -0.9743269, 0, 0, 0, 1, 1,
0.1468588, -0.07542462, 4.706809, 0, 0, 0, 1, 1,
0.1468787, -1.95523, 2.97484, 0, 0, 0, 1, 1,
0.1470151, 0.8281646, 0.1105146, 1, 1, 1, 1, 1,
0.1499152, 1.329772, 0.400296, 1, 1, 1, 1, 1,
0.154924, -0.7644402, 2.068441, 1, 1, 1, 1, 1,
0.1559082, 0.3663223, -1.058745, 1, 1, 1, 1, 1,
0.1587372, 0.8158644, 0.004185978, 1, 1, 1, 1, 1,
0.1667296, 1.560575, 0.9143564, 1, 1, 1, 1, 1,
0.1671083, 0.5506274, 0.6163687, 1, 1, 1, 1, 1,
0.1706546, -0.2426328, 2.867828, 1, 1, 1, 1, 1,
0.1711705, 0.8876187, 2.253622, 1, 1, 1, 1, 1,
0.1771581, -0.2039627, 2.304108, 1, 1, 1, 1, 1,
0.1792483, -1.508828, 1.834891, 1, 1, 1, 1, 1,
0.1803064, 0.5332856, -0.04890176, 1, 1, 1, 1, 1,
0.1810368, -0.009439588, 2.205871, 1, 1, 1, 1, 1,
0.1828078, 1.489204, 1.339847, 1, 1, 1, 1, 1,
0.1848464, -1.5345, 4.135437, 1, 1, 1, 1, 1,
0.1853155, -1.028145, 0.9142121, 0, 0, 1, 1, 1,
0.189522, -1.101698, 4.714654, 1, 0, 0, 1, 1,
0.1929055, 0.4412711, 0.8954044, 1, 0, 0, 1, 1,
0.1958796, 0.003058925, 1.63595, 1, 0, 0, 1, 1,
0.1965734, -0.278553, 2.452633, 1, 0, 0, 1, 1,
0.2016533, -0.5485584, 1.434332, 1, 0, 0, 1, 1,
0.2019497, -0.9519131, 1.086694, 0, 0, 0, 1, 1,
0.2030229, -0.1777415, 1.357422, 0, 0, 0, 1, 1,
0.2073755, 0.7164292, 0.2265662, 0, 0, 0, 1, 1,
0.2074334, -0.6552165, 1.276184, 0, 0, 0, 1, 1,
0.2076131, 0.1060426, 1.8211, 0, 0, 0, 1, 1,
0.2102895, -0.8282103, 3.814397, 0, 0, 0, 1, 1,
0.2142929, -0.2139852, 2.150814, 0, 0, 0, 1, 1,
0.2160557, -1.037547, 0.9135384, 1, 1, 1, 1, 1,
0.2162654, -0.1110633, 1.56304, 1, 1, 1, 1, 1,
0.216543, -0.5157806, 2.635709, 1, 1, 1, 1, 1,
0.2189178, 0.9380882, -0.04734967, 1, 1, 1, 1, 1,
0.2204806, 0.5491735, 0.8537264, 1, 1, 1, 1, 1,
0.2243167, 0.9105721, 0.6056712, 1, 1, 1, 1, 1,
0.2265662, 0.9719537, -2.492743, 1, 1, 1, 1, 1,
0.2301086, 0.5377884, 1.151155, 1, 1, 1, 1, 1,
0.2437638, 0.1204425, 1.412839, 1, 1, 1, 1, 1,
0.2445206, -0.6998639, 2.46827, 1, 1, 1, 1, 1,
0.2469873, -0.34161, 2.497453, 1, 1, 1, 1, 1,
0.2484907, 0.1893769, 0.9137585, 1, 1, 1, 1, 1,
0.2497254, 0.6486174, -0.5315898, 1, 1, 1, 1, 1,
0.2498705, -1.084462, 3.663072, 1, 1, 1, 1, 1,
0.2534512, -1.002051, 1.679265, 1, 1, 1, 1, 1,
0.2543786, 0.7189392, 0.6354145, 0, 0, 1, 1, 1,
0.2557759, -1.455421, 2.226507, 1, 0, 0, 1, 1,
0.2569364, -1.18756, 0.6598909, 1, 0, 0, 1, 1,
0.2582934, -0.06528606, 2.293359, 1, 0, 0, 1, 1,
0.2639638, 1.129563, -0.3591554, 1, 0, 0, 1, 1,
0.2667215, 0.2008469, 0.5915266, 1, 0, 0, 1, 1,
0.2690659, -0.5917011, 2.991814, 0, 0, 0, 1, 1,
0.2704318, 0.6469356, 1.475082, 0, 0, 0, 1, 1,
0.2739039, 0.8393411, -0.1538537, 0, 0, 0, 1, 1,
0.2740874, -0.9416449, 0.5005319, 0, 0, 0, 1, 1,
0.2783133, 1.473986, -0.3304344, 0, 0, 0, 1, 1,
0.2815524, 1.248491, 0.06777103, 0, 0, 0, 1, 1,
0.2821484, -0.0893985, 1.7361, 0, 0, 0, 1, 1,
0.283407, -0.7520236, 0.9397595, 1, 1, 1, 1, 1,
0.2844506, -0.3223111, 1.770873, 1, 1, 1, 1, 1,
0.2851487, 0.5680448, -0.2139733, 1, 1, 1, 1, 1,
0.2911461, 0.2350461, 2.55169, 1, 1, 1, 1, 1,
0.2922569, 0.250121, 1.903678, 1, 1, 1, 1, 1,
0.2940546, -0.3557484, 1.634626, 1, 1, 1, 1, 1,
0.2970337, -0.1954562, 1.120716, 1, 1, 1, 1, 1,
0.2985324, 1.781836, -0.1665164, 1, 1, 1, 1, 1,
0.3008814, 1.679211, 1.404869, 1, 1, 1, 1, 1,
0.3116021, -0.8242471, 3.417456, 1, 1, 1, 1, 1,
0.3146504, 1.281403, -0.766377, 1, 1, 1, 1, 1,
0.3193178, -0.6768873, 4.557458, 1, 1, 1, 1, 1,
0.3204091, -2.265566, 1.009349, 1, 1, 1, 1, 1,
0.3219146, 0.01006951, 1.586772, 1, 1, 1, 1, 1,
0.3270699, 1.240742, 0.1390398, 1, 1, 1, 1, 1,
0.3322285, 0.4468654, 0.7926338, 0, 0, 1, 1, 1,
0.3347404, -0.519672, 2.754668, 1, 0, 0, 1, 1,
0.3362325, 1.172413, -2.104888, 1, 0, 0, 1, 1,
0.3448792, 0.6251677, -0.4876006, 1, 0, 0, 1, 1,
0.3462718, -0.1626333, 0.5609837, 1, 0, 0, 1, 1,
0.3470239, -0.9940719, 3.646512, 1, 0, 0, 1, 1,
0.3472975, 0.1502162, 0.07824232, 0, 0, 0, 1, 1,
0.3479322, 1.019903, -0.3623487, 0, 0, 0, 1, 1,
0.3583155, 0.5650537, 0.3370224, 0, 0, 0, 1, 1,
0.3584906, 0.435804, -1.707185, 0, 0, 0, 1, 1,
0.3625731, -0.7086173, 3.059203, 0, 0, 0, 1, 1,
0.3633071, -0.7427343, 1.378696, 0, 0, 0, 1, 1,
0.3637976, -0.2117436, 2.083992, 0, 0, 0, 1, 1,
0.3694859, -2.356475, 3.122221, 1, 1, 1, 1, 1,
0.3736342, -0.5791491, 3.568772, 1, 1, 1, 1, 1,
0.3741859, 0.8408436, 1.302075, 1, 1, 1, 1, 1,
0.3745511, 1.144854, 0.1277206, 1, 1, 1, 1, 1,
0.376061, -0.1790578, 4.081471, 1, 1, 1, 1, 1,
0.3802763, -0.9016294, 3.285117, 1, 1, 1, 1, 1,
0.3805032, 0.8111697, -0.05770718, 1, 1, 1, 1, 1,
0.3849589, -0.9187106, 1.554298, 1, 1, 1, 1, 1,
0.3871402, 0.01543988, 1.247463, 1, 1, 1, 1, 1,
0.3874211, -0.8739444, 1.877613, 1, 1, 1, 1, 1,
0.3893808, -0.6298836, 3.8055, 1, 1, 1, 1, 1,
0.3902777, -0.01248279, 2.000357, 1, 1, 1, 1, 1,
0.3915429, 0.8629343, -0.7695004, 1, 1, 1, 1, 1,
0.3984628, 0.08464392, -0.8247897, 1, 1, 1, 1, 1,
0.3999713, 0.0754559, -0.117422, 1, 1, 1, 1, 1,
0.4026495, -0.9136065, 2.183803, 0, 0, 1, 1, 1,
0.4028893, -1.331741, 3.124027, 1, 0, 0, 1, 1,
0.4108304, 1.024722, 1.442358, 1, 0, 0, 1, 1,
0.4111216, 0.8853424, 1.513663, 1, 0, 0, 1, 1,
0.4118075, 1.158668, 0.4752654, 1, 0, 0, 1, 1,
0.4155887, -0.2531987, 1.386356, 1, 0, 0, 1, 1,
0.4190812, 1.32684, 0.05666238, 0, 0, 0, 1, 1,
0.4203514, -0.494987, 3.135702, 0, 0, 0, 1, 1,
0.4207125, -0.5511928, 1.856663, 0, 0, 0, 1, 1,
0.4216756, -0.5330014, 2.053516, 0, 0, 0, 1, 1,
0.4225632, 1.13463, 0.1883911, 0, 0, 0, 1, 1,
0.4240708, 0.2797999, -1.633006, 0, 0, 0, 1, 1,
0.4327697, -0.132785, 3.367125, 0, 0, 0, 1, 1,
0.4333325, -0.8982361, 2.903938, 1, 1, 1, 1, 1,
0.4356192, 0.6836795, 1.593474, 1, 1, 1, 1, 1,
0.4368239, 3.58101, 0.5276821, 1, 1, 1, 1, 1,
0.437297, 0.486234, -0.5707167, 1, 1, 1, 1, 1,
0.4424783, -1.053056, 4.498168, 1, 1, 1, 1, 1,
0.4464941, -1.5679, 3.450704, 1, 1, 1, 1, 1,
0.4465747, 1.152802, -0.2349372, 1, 1, 1, 1, 1,
0.4491177, -0.4787863, 2.002621, 1, 1, 1, 1, 1,
0.4533368, -0.1509148, 0.588017, 1, 1, 1, 1, 1,
0.4610967, -0.3986284, -0.4009704, 1, 1, 1, 1, 1,
0.4693131, -0.03180503, 1.799687, 1, 1, 1, 1, 1,
0.4715564, -0.3279948, 1.811837, 1, 1, 1, 1, 1,
0.4739787, -0.4696315, 1.585531, 1, 1, 1, 1, 1,
0.4773108, 0.3907732, 0.2115124, 1, 1, 1, 1, 1,
0.4848346, 0.4319313, -1.090474, 1, 1, 1, 1, 1,
0.4882292, 0.7756846, 1.449488, 0, 0, 1, 1, 1,
0.4907425, 1.383234, 0.4593839, 1, 0, 0, 1, 1,
0.4952135, 2.226494, 0.4133785, 1, 0, 0, 1, 1,
0.4973939, 0.4477292, -0.9933442, 1, 0, 0, 1, 1,
0.4977049, 0.306177, -0.9252701, 1, 0, 0, 1, 1,
0.5038918, -0.3865144, 1.438654, 1, 0, 0, 1, 1,
0.5061162, 0.6358495, 1.683308, 0, 0, 0, 1, 1,
0.5064846, -0.05078954, 1.475317, 0, 0, 0, 1, 1,
0.5072268, -0.5843846, 3.270121, 0, 0, 0, 1, 1,
0.5075861, -1.164596, 3.200376, 0, 0, 0, 1, 1,
0.5104733, -0.7620672, 3.054504, 0, 0, 0, 1, 1,
0.511568, 0.4407182, 1.107111, 0, 0, 0, 1, 1,
0.5129439, 2.63023, 2.627275, 0, 0, 0, 1, 1,
0.5129848, -0.468467, 2.222697, 1, 1, 1, 1, 1,
0.5171577, 0.2332768, 0.8537961, 1, 1, 1, 1, 1,
0.5172135, -0.3603152, 3.724936, 1, 1, 1, 1, 1,
0.5178597, -1.115078, 3.219598, 1, 1, 1, 1, 1,
0.5239109, -0.2810772, 2.842504, 1, 1, 1, 1, 1,
0.5245335, -1.492678, 2.348425, 1, 1, 1, 1, 1,
0.5254655, -0.3817654, 1.742952, 1, 1, 1, 1, 1,
0.5266213, -0.4174917, 3.184714, 1, 1, 1, 1, 1,
0.5272759, 2.045889, 0.7327548, 1, 1, 1, 1, 1,
0.5301869, 0.1042002, 1.295342, 1, 1, 1, 1, 1,
0.5359535, -0.3787435, 2.092482, 1, 1, 1, 1, 1,
0.5374262, 0.2232518, 0.9560819, 1, 1, 1, 1, 1,
0.5401921, -1.131801, 2.308519, 1, 1, 1, 1, 1,
0.5402966, 0.5040061, 0.1500084, 1, 1, 1, 1, 1,
0.5424995, 0.6247615, 0.1930868, 1, 1, 1, 1, 1,
0.5433506, -1.759868, 2.015765, 0, 0, 1, 1, 1,
0.5450898, 0.2041459, 1.309788, 1, 0, 0, 1, 1,
0.5464004, -0.2448545, 2.584896, 1, 0, 0, 1, 1,
0.5472801, 0.8105555, 0.5387899, 1, 0, 0, 1, 1,
0.5501675, -0.07503441, 1.915046, 1, 0, 0, 1, 1,
0.5542436, 0.1849094, 1.882604, 1, 0, 0, 1, 1,
0.5617473, 1.512645, 0.6105167, 0, 0, 0, 1, 1,
0.5622672, -1.102739, 2.312302, 0, 0, 0, 1, 1,
0.5656344, 1.250191, -0.9621994, 0, 0, 0, 1, 1,
0.5664746, 1.094139, -0.2353722, 0, 0, 0, 1, 1,
0.5779451, 0.2172023, 1.188581, 0, 0, 0, 1, 1,
0.5790604, -0.5834787, 2.599195, 0, 0, 0, 1, 1,
0.5836219, 0.5385753, -0.02116151, 0, 0, 0, 1, 1,
0.5836549, -1.572502, 1.584695, 1, 1, 1, 1, 1,
0.5897162, 0.6471636, 0.7238439, 1, 1, 1, 1, 1,
0.5928239, 1.206761, -1.032213, 1, 1, 1, 1, 1,
0.5992024, -0.6823725, 2.183692, 1, 1, 1, 1, 1,
0.6063116, -1.512602, 3.400255, 1, 1, 1, 1, 1,
0.6140417, 0.7933778, -1.428291, 1, 1, 1, 1, 1,
0.6157444, 1.406745, -0.8161542, 1, 1, 1, 1, 1,
0.6209291, -0.3817083, 0.8049176, 1, 1, 1, 1, 1,
0.6262134, 0.2874915, 0.1601035, 1, 1, 1, 1, 1,
0.6290291, -0.3211215, 1.536797, 1, 1, 1, 1, 1,
0.6291821, -0.5939011, 2.444637, 1, 1, 1, 1, 1,
0.6374617, 0.4281802, -1.014749, 1, 1, 1, 1, 1,
0.6411507, 0.6718987, 0.8382764, 1, 1, 1, 1, 1,
0.6444512, -1.180481, 0.903957, 1, 1, 1, 1, 1,
0.645584, -0.6266522, 0.2793438, 1, 1, 1, 1, 1,
0.6458167, 0.5645749, 0.283305, 0, 0, 1, 1, 1,
0.6507684, 1.505364, 0.9372674, 1, 0, 0, 1, 1,
0.6528513, 0.4227431, 0.3101743, 1, 0, 0, 1, 1,
0.6536551, 0.8847512, 1.207616, 1, 0, 0, 1, 1,
0.6708115, 0.7172406, 1.334864, 1, 0, 0, 1, 1,
0.6775597, -0.3419634, 0.9322942, 1, 0, 0, 1, 1,
0.6787328, 1.023638, -0.3969075, 0, 0, 0, 1, 1,
0.6958132, 0.1320509, 0.5566916, 0, 0, 0, 1, 1,
0.6968147, 1.058476, 0.8647547, 0, 0, 0, 1, 1,
0.7024325, -1.037002, 2.803833, 0, 0, 0, 1, 1,
0.7035636, 1.066449, 1.106768, 0, 0, 0, 1, 1,
0.7043127, 0.32856, 1.65876, 0, 0, 0, 1, 1,
0.7043538, -1.000307, 3.110345, 0, 0, 0, 1, 1,
0.7056208, 0.04922621, -0.4511365, 1, 1, 1, 1, 1,
0.7058788, -1.482139, 3.974276, 1, 1, 1, 1, 1,
0.7064298, -0.4878795, 3.248746, 1, 1, 1, 1, 1,
0.7068987, -1.582354, 1.97105, 1, 1, 1, 1, 1,
0.7073826, 0.1188107, 2.431361, 1, 1, 1, 1, 1,
0.7088378, -0.7011853, 1.514993, 1, 1, 1, 1, 1,
0.7103712, -0.07819881, 0.4547797, 1, 1, 1, 1, 1,
0.7155291, 0.1525274, 0.5023902, 1, 1, 1, 1, 1,
0.7189423, 0.8660747, 0.8657805, 1, 1, 1, 1, 1,
0.7199913, 0.7898239, 0.1228328, 1, 1, 1, 1, 1,
0.7220033, 1.509415, 0.7306607, 1, 1, 1, 1, 1,
0.7235635, -0.2209108, 1.728303, 1, 1, 1, 1, 1,
0.7244524, -0.350464, 3.298136, 1, 1, 1, 1, 1,
0.7252135, 0.3489258, 3.238124, 1, 1, 1, 1, 1,
0.7298179, -0.3359557, 2.653935, 1, 1, 1, 1, 1,
0.7386219, -0.4084917, 3.797795, 0, 0, 1, 1, 1,
0.7386326, 0.142576, -0.502413, 1, 0, 0, 1, 1,
0.7433522, -1.277364, 2.931894, 1, 0, 0, 1, 1,
0.7499444, -1.644939, 2.621403, 1, 0, 0, 1, 1,
0.7546554, 0.3160557, -0.21255, 1, 0, 0, 1, 1,
0.756269, 0.9884652, 1.403975, 1, 0, 0, 1, 1,
0.7580277, 0.5207804, -0.1089618, 0, 0, 0, 1, 1,
0.7614335, 0.4642574, 0.8925197, 0, 0, 0, 1, 1,
0.770647, -0.2954205, 2.129325, 0, 0, 0, 1, 1,
0.7771342, -1.259227, 1.725045, 0, 0, 0, 1, 1,
0.7794856, 0.3515524, 0.6754367, 0, 0, 0, 1, 1,
0.7847164, 0.0837749, 2.001852, 0, 0, 0, 1, 1,
0.7848363, 0.6058072, -0.5352799, 0, 0, 0, 1, 1,
0.7850932, 0.8044248, -0.3848425, 1, 1, 1, 1, 1,
0.7947389, -0.4650973, 1.746708, 1, 1, 1, 1, 1,
0.8038629, 0.433771, -0.3800553, 1, 1, 1, 1, 1,
0.8057555, 1.195515, 1.320162, 1, 1, 1, 1, 1,
0.8116933, 0.2456284, 0.7602329, 1, 1, 1, 1, 1,
0.8134229, 0.5497984, 0.1039663, 1, 1, 1, 1, 1,
0.815665, 1.157665, 1.59203, 1, 1, 1, 1, 1,
0.8188001, -0.03762471, 1.391411, 1, 1, 1, 1, 1,
0.8278902, -2.163493, 4.286265, 1, 1, 1, 1, 1,
0.8286448, 0.2782591, 1.416662, 1, 1, 1, 1, 1,
0.8318026, -0.1873288, 2.223197, 1, 1, 1, 1, 1,
0.8432169, 0.1368569, 1.743634, 1, 1, 1, 1, 1,
0.8433045, -0.6295127, 4.179063, 1, 1, 1, 1, 1,
0.846675, 0.5364978, 3.002711, 1, 1, 1, 1, 1,
0.8487605, -0.8685077, -0.02643645, 1, 1, 1, 1, 1,
0.8564515, 1.462889, -0.8332641, 0, 0, 1, 1, 1,
0.8569139, -1.612897, 3.161849, 1, 0, 0, 1, 1,
0.8577357, -0.789315, 2.869968, 1, 0, 0, 1, 1,
0.8581643, 0.09292238, 1.57687, 1, 0, 0, 1, 1,
0.8588019, -1.239428, 1.585092, 1, 0, 0, 1, 1,
0.8606324, -0.1995825, 1.905789, 1, 0, 0, 1, 1,
0.8659944, 0.07163045, 0.5756179, 0, 0, 0, 1, 1,
0.8668265, 1.295462, -0.3213046, 0, 0, 0, 1, 1,
0.8691438, 2.034051, 1.544125, 0, 0, 0, 1, 1,
0.8755681, 0.01061436, -0.1159736, 0, 0, 0, 1, 1,
0.8792705, -1.508566, 1.966663, 0, 0, 0, 1, 1,
0.8797807, 0.08094391, 0.4477364, 0, 0, 0, 1, 1,
0.8829758, -0.5528503, 3.345984, 0, 0, 0, 1, 1,
0.8862517, -0.86807, 2.925401, 1, 1, 1, 1, 1,
0.8890642, -0.09634523, 1.143476, 1, 1, 1, 1, 1,
0.8900691, -1.247086, 1.218983, 1, 1, 1, 1, 1,
0.8916543, 0.8648725, -0.7817575, 1, 1, 1, 1, 1,
0.8917562, 1.161119, 2.638813, 1, 1, 1, 1, 1,
0.8942058, 0.2936101, 2.128008, 1, 1, 1, 1, 1,
0.8953894, -1.001237, 2.146669, 1, 1, 1, 1, 1,
0.9011769, -0.01617575, 1.281626, 1, 1, 1, 1, 1,
0.9044284, -0.8342815, 0.6455599, 1, 1, 1, 1, 1,
0.9057096, 0.810523, 2.893269, 1, 1, 1, 1, 1,
0.9062786, 0.8502591, 1.382238, 1, 1, 1, 1, 1,
0.9074596, -0.987788, 0.7369027, 1, 1, 1, 1, 1,
0.911549, 1.347987, 0.8497851, 1, 1, 1, 1, 1,
0.9149158, -0.08029906, 1.567572, 1, 1, 1, 1, 1,
0.9180171, 1.538422, 0.3297458, 1, 1, 1, 1, 1,
0.9216911, 0.3491434, 2.424003, 0, 0, 1, 1, 1,
0.9255252, -1.231125, 3.808229, 1, 0, 0, 1, 1,
0.9355804, 0.9618374, 1.330713, 1, 0, 0, 1, 1,
0.9376715, 0.6903398, 1.937954, 1, 0, 0, 1, 1,
0.9395555, 1.45226, -0.2446898, 1, 0, 0, 1, 1,
0.9496675, -0.9894838, 3.282589, 1, 0, 0, 1, 1,
0.9602057, 1.727138, -0.594209, 0, 0, 0, 1, 1,
0.9606124, -0.2765854, 1.797599, 0, 0, 0, 1, 1,
0.9629292, -0.886537, 1.016373, 0, 0, 0, 1, 1,
0.9671677, -1.469879, 2.65939, 0, 0, 0, 1, 1,
0.9684712, 0.1900635, 1.076805, 0, 0, 0, 1, 1,
0.9776915, 1.364685, 0.6838526, 0, 0, 0, 1, 1,
0.9778816, 1.59238, 0.07005785, 0, 0, 0, 1, 1,
0.9786732, 1.399017, 2.660932, 1, 1, 1, 1, 1,
0.9847333, -2.203624, 2.771835, 1, 1, 1, 1, 1,
0.9883154, 1.818319, 0.2812863, 1, 1, 1, 1, 1,
0.9944304, 1.230217, 0.6117672, 1, 1, 1, 1, 1,
1.003672, -0.1309471, 1.805892, 1, 1, 1, 1, 1,
1.011252, -0.1561823, 1.67257, 1, 1, 1, 1, 1,
1.016122, -0.214676, 1.121383, 1, 1, 1, 1, 1,
1.022482, 0.2074233, 1.814106, 1, 1, 1, 1, 1,
1.026754, 0.9503114, 1.928857, 1, 1, 1, 1, 1,
1.033121, 0.6604267, 1.07794, 1, 1, 1, 1, 1,
1.033519, 0.1547411, 0.8060783, 1, 1, 1, 1, 1,
1.036648, -0.5613134, 1.566008, 1, 1, 1, 1, 1,
1.038417, 0.6709424, 0.1141746, 1, 1, 1, 1, 1,
1.04417, 1.784351, -0.0179409, 1, 1, 1, 1, 1,
1.046437, 0.2451095, 1.315219, 1, 1, 1, 1, 1,
1.05297, -1.03508, 0.6144718, 0, 0, 1, 1, 1,
1.05313, 1.086202, -0.4201259, 1, 0, 0, 1, 1,
1.056251, 0.07904051, 1.134221, 1, 0, 0, 1, 1,
1.057117, 2.205652, 1.770509, 1, 0, 0, 1, 1,
1.061014, -1.498953, 1.869148, 1, 0, 0, 1, 1,
1.065616, 1.516293, 2.375932, 1, 0, 0, 1, 1,
1.073314, -0.1539819, 0.5473964, 0, 0, 0, 1, 1,
1.073407, -0.8049064, 2.498802, 0, 0, 0, 1, 1,
1.079185, -0.3132719, 1.339377, 0, 0, 0, 1, 1,
1.094208, 2.348089, 0.4668689, 0, 0, 0, 1, 1,
1.094306, -0.590187, 1.81574, 0, 0, 0, 1, 1,
1.095793, -0.224474, 1.61125, 0, 0, 0, 1, 1,
1.098186, 1.329352, -0.00494893, 0, 0, 0, 1, 1,
1.101774, 1.113685, -0.5040177, 1, 1, 1, 1, 1,
1.102579, 0.7025099, 0.6508558, 1, 1, 1, 1, 1,
1.103495, -0.1467353, 0.7061771, 1, 1, 1, 1, 1,
1.1049, 0.6701649, 1.952827, 1, 1, 1, 1, 1,
1.106128, 0.9421872, 1.391019, 1, 1, 1, 1, 1,
1.106643, 0.1389283, 0.8050148, 1, 1, 1, 1, 1,
1.109998, -0.3376999, 1.780055, 1, 1, 1, 1, 1,
1.114985, 0.9398412, 1.595501, 1, 1, 1, 1, 1,
1.115637, 0.08926766, 2.340133, 1, 1, 1, 1, 1,
1.116526, -0.6835926, 1.659013, 1, 1, 1, 1, 1,
1.119688, 0.292014, 1.534819, 1, 1, 1, 1, 1,
1.120478, 0.716901, 1.07317, 1, 1, 1, 1, 1,
1.125759, -0.3364158, 1.95068, 1, 1, 1, 1, 1,
1.12778, 0.7842627, -0.4216814, 1, 1, 1, 1, 1,
1.130007, -1.174651, 3.883292, 1, 1, 1, 1, 1,
1.13178, 1.229297, 0.9369725, 0, 0, 1, 1, 1,
1.132568, 0.7756594, 1.878867, 1, 0, 0, 1, 1,
1.139866, -1.876892, 1.463099, 1, 0, 0, 1, 1,
1.140947, 0.1426505, 0.260886, 1, 0, 0, 1, 1,
1.142576, -0.1151239, 4.139665, 1, 0, 0, 1, 1,
1.164809, 0.7766215, 2.01428, 1, 0, 0, 1, 1,
1.170909, 0.1629136, 1.483615, 0, 0, 0, 1, 1,
1.174173, -0.7226505, 0.32076, 0, 0, 0, 1, 1,
1.176161, 0.1765651, 0.676492, 0, 0, 0, 1, 1,
1.180901, -2.004141, 3.283191, 0, 0, 0, 1, 1,
1.184041, -0.06244069, 2.166149, 0, 0, 0, 1, 1,
1.184974, -1.873778, 1.71067, 0, 0, 0, 1, 1,
1.187845, 0.6227588, 1.850587, 0, 0, 0, 1, 1,
1.190272, 0.538399, 2.581154, 1, 1, 1, 1, 1,
1.20784, -1.060301, 3.607947, 1, 1, 1, 1, 1,
1.211616, -2.367884, 1.72841, 1, 1, 1, 1, 1,
1.214515, 0.08996607, 0.7544068, 1, 1, 1, 1, 1,
1.2205, -0.9000509, 0.2021693, 1, 1, 1, 1, 1,
1.229506, 0.9664763, 1.645612, 1, 1, 1, 1, 1,
1.241262, -0.3929333, 1.738954, 1, 1, 1, 1, 1,
1.24224, -0.7216746, 2.894767, 1, 1, 1, 1, 1,
1.244553, -0.2014291, 2.589421, 1, 1, 1, 1, 1,
1.24737, -0.5946083, 3.198328, 1, 1, 1, 1, 1,
1.248865, -1.236566, 1.655826, 1, 1, 1, 1, 1,
1.257164, -0.7506093, 1.190929, 1, 1, 1, 1, 1,
1.265145, 1.447917, 1.982755, 1, 1, 1, 1, 1,
1.26979, 0.7310151, 0.9566802, 1, 1, 1, 1, 1,
1.271104, 0.3165057, 1.149143, 1, 1, 1, 1, 1,
1.282037, -1.629192, 1.769021, 0, 0, 1, 1, 1,
1.298933, 0.2524397, 0.4124819, 1, 0, 0, 1, 1,
1.299778, -0.07050098, 2.227637, 1, 0, 0, 1, 1,
1.30915, -0.4992223, 1.447584, 1, 0, 0, 1, 1,
1.311941, 0.8724436, 0.01532734, 1, 0, 0, 1, 1,
1.32104, 0.2522028, 0.9455714, 1, 0, 0, 1, 1,
1.325567, -0.9341196, 1.56968, 0, 0, 0, 1, 1,
1.328403, -0.9332781, 1.11052, 0, 0, 0, 1, 1,
1.332034, -1.013899, 2.408283, 0, 0, 0, 1, 1,
1.334239, 0.8314341, 0.8580435, 0, 0, 0, 1, 1,
1.335683, -1.563004, 4.330868, 0, 0, 0, 1, 1,
1.349235, 1.03261, -0.1624216, 0, 0, 0, 1, 1,
1.36406, 0.7924362, -0.6356739, 0, 0, 0, 1, 1,
1.367875, -0.909191, 3.422779, 1, 1, 1, 1, 1,
1.374233, 0.6940265, 1.050191, 1, 1, 1, 1, 1,
1.374888, -0.2114569, 1.588454, 1, 1, 1, 1, 1,
1.377735, -0.6406789, 0.7823748, 1, 1, 1, 1, 1,
1.38286, -0.4952541, 4.03348, 1, 1, 1, 1, 1,
1.385515, 1.260783, 0.5605221, 1, 1, 1, 1, 1,
1.386494, 0.3964207, 1.980752, 1, 1, 1, 1, 1,
1.412256, -0.3308048, 1.646955, 1, 1, 1, 1, 1,
1.412349, 0.604908, 0.6631998, 1, 1, 1, 1, 1,
1.424584, -0.9728634, 0.2607164, 1, 1, 1, 1, 1,
1.425376, 1.252326, 1.399959, 1, 1, 1, 1, 1,
1.429154, -0.8144359, 3.579026, 1, 1, 1, 1, 1,
1.448162, -1.678395, 2.553356, 1, 1, 1, 1, 1,
1.44933, 0.06901072, 2.252426, 1, 1, 1, 1, 1,
1.467188, 1.076496, 0.7811661, 1, 1, 1, 1, 1,
1.471364, -0.1722796, 0.6574696, 0, 0, 1, 1, 1,
1.47227, 1.537831, 1.386109, 1, 0, 0, 1, 1,
1.472517, -0.2065058, 2.641472, 1, 0, 0, 1, 1,
1.483211, 0.6665543, 0.2499722, 1, 0, 0, 1, 1,
1.496054, 1.64968, 0.2732764, 1, 0, 0, 1, 1,
1.49854, -2.79455, 4.239055, 1, 0, 0, 1, 1,
1.501178, 0.8519384, -0.08653267, 0, 0, 0, 1, 1,
1.501178, 1.170556, 0.5332766, 0, 0, 0, 1, 1,
1.50192, -0.05237162, 1.525746, 0, 0, 0, 1, 1,
1.514423, -1.982455, 3.353696, 0, 0, 0, 1, 1,
1.516394, 1.012624, 1.420644, 0, 0, 0, 1, 1,
1.537333, -0.6708092, 2.037516, 0, 0, 0, 1, 1,
1.551005, -0.3441868, 0.5479925, 0, 0, 0, 1, 1,
1.552221, -0.3214235, 1.979946, 1, 1, 1, 1, 1,
1.564785, 1.333937, 1.031258, 1, 1, 1, 1, 1,
1.567421, -0.4898063, 1.005979, 1, 1, 1, 1, 1,
1.56965, 0.4723903, 0.3678851, 1, 1, 1, 1, 1,
1.580333, 0.359583, 3.269495, 1, 1, 1, 1, 1,
1.593543, 1.331339, -1.06932, 1, 1, 1, 1, 1,
1.595093, 0.136472, 1.242867, 1, 1, 1, 1, 1,
1.597907, 0.5466374, 0.8406866, 1, 1, 1, 1, 1,
1.605819, 0.1563769, 1.740505, 1, 1, 1, 1, 1,
1.611922, -0.6670033, 2.617697, 1, 1, 1, 1, 1,
1.620066, 1.464382, -0.6300921, 1, 1, 1, 1, 1,
1.640695, -1.179419, 3.496881, 1, 1, 1, 1, 1,
1.642386, -1.984783, 2.722427, 1, 1, 1, 1, 1,
1.647749, 0.8878308, 0.000815144, 1, 1, 1, 1, 1,
1.656762, -0.7175096, 0.6381056, 1, 1, 1, 1, 1,
1.657868, -1.051489, 2.339284, 0, 0, 1, 1, 1,
1.672936, 2.116546, 0.3204154, 1, 0, 0, 1, 1,
1.683579, -0.6071007, 0.1481655, 1, 0, 0, 1, 1,
1.683962, -1.400646, 4.532676, 1, 0, 0, 1, 1,
1.686636, -0.4836123, 2.24864, 1, 0, 0, 1, 1,
1.688907, 0.663475, 0.4947776, 1, 0, 0, 1, 1,
1.69673, 1.313797, 0.1337803, 0, 0, 0, 1, 1,
1.71505, -0.7195473, 0.6539977, 0, 0, 0, 1, 1,
1.724148, 0.9725748, 1.310197, 0, 0, 0, 1, 1,
1.733719, 1.572045, 0.6893626, 0, 0, 0, 1, 1,
1.739001, 0.5052293, 0.02239459, 0, 0, 0, 1, 1,
1.756926, -0.07747079, 0.8603897, 0, 0, 0, 1, 1,
1.762743, -0.2544563, 1.813341, 0, 0, 0, 1, 1,
1.803141, 0.1729394, 0.8525512, 1, 1, 1, 1, 1,
1.820393, -0.4085385, 2.052767, 1, 1, 1, 1, 1,
1.820458, 1.353392, 1.501921, 1, 1, 1, 1, 1,
1.846853, 0.8863294, 0.0148736, 1, 1, 1, 1, 1,
1.867319, -0.313646, 4.530063, 1, 1, 1, 1, 1,
1.88303, 0.1451676, -0.5823542, 1, 1, 1, 1, 1,
1.903426, 1.684286, 1.309214, 1, 1, 1, 1, 1,
1.915365, 1.845779, 3.068303, 1, 1, 1, 1, 1,
1.922641, -0.8217609, 2.206408, 1, 1, 1, 1, 1,
1.9229, -0.07328741, 2.226747, 1, 1, 1, 1, 1,
1.958885, -1.797791, 2.042675, 1, 1, 1, 1, 1,
2.00248, -0.643402, 2.632198, 1, 1, 1, 1, 1,
2.021454, 0.4602956, 1.488282, 1, 1, 1, 1, 1,
2.034086, 0.1480807, 0.3054967, 1, 1, 1, 1, 1,
2.058079, 0.1136234, 3.205475, 1, 1, 1, 1, 1,
2.069196, -0.3703115, 1.757788, 0, 0, 1, 1, 1,
2.073625, 0.4973077, 2.552188, 1, 0, 0, 1, 1,
2.083991, -0.7836516, 2.800266, 1, 0, 0, 1, 1,
2.090732, -0.9700249, 0.5879482, 1, 0, 0, 1, 1,
2.104552, 0.407002, 1.846331, 1, 0, 0, 1, 1,
2.150858, 0.3646521, 2.276984, 1, 0, 0, 1, 1,
2.200105, 0.9429753, 1.489615, 0, 0, 0, 1, 1,
2.267663, -0.3062, 2.562493, 0, 0, 0, 1, 1,
2.270023, 0.5601949, 1.903714, 0, 0, 0, 1, 1,
2.272201, -0.3472221, 1.477206, 0, 0, 0, 1, 1,
2.273347, 0.7547552, 2.455294, 0, 0, 0, 1, 1,
2.282358, 0.3664205, 1.782915, 0, 0, 0, 1, 1,
2.305062, 0.3509382, 3.730431, 0, 0, 0, 1, 1,
2.36148, 1.551303, 1.267144, 1, 1, 1, 1, 1,
2.530482, 0.3662224, 1.323529, 1, 1, 1, 1, 1,
2.537441, -0.08675775, 2.185169, 1, 1, 1, 1, 1,
2.620022, 1.470815, 0.9985753, 1, 1, 1, 1, 1,
2.764293, -0.1333434, 1.374651, 1, 1, 1, 1, 1,
2.815152, -1.589655, 2.119371, 1, 1, 1, 1, 1,
2.863806, -0.8946146, 2.677078, 1, 1, 1, 1, 1
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
var radius = 9.100869;
var distance = 31.96642;
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
mvMatrix.translate( 0.2040282, -0.2352052, 0.03145623 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.96642);
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