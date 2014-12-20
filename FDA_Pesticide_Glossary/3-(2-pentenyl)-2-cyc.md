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
-3.096679, 1.115742, 0.1328713, 1, 0, 0, 1,
-2.935426, 0.2216513, -1.456645, 1, 0.007843138, 0, 1,
-2.601522, 0.2350153, -1.091176, 1, 0.01176471, 0, 1,
-2.584645, -0.3081627, -1.744213, 1, 0.01960784, 0, 1,
-2.498091, 0.6713299, -1.588308, 1, 0.02352941, 0, 1,
-2.376719, 0.009610832, -1.053237, 1, 0.03137255, 0, 1,
-2.375004, 1.09993, -1.855637, 1, 0.03529412, 0, 1,
-2.240983, -1.2981, 0.421323, 1, 0.04313726, 0, 1,
-2.171512, -0.06430179, -1.459567, 1, 0.04705882, 0, 1,
-2.165488, 1.125049, -1.873411, 1, 0.05490196, 0, 1,
-2.162321, 0.8683008, -1.573303, 1, 0.05882353, 0, 1,
-2.143703, -0.1016272, -0.4842061, 1, 0.06666667, 0, 1,
-2.129366, -1.364201, -1.263657, 1, 0.07058824, 0, 1,
-2.099661, 1.247388, -2.599962, 1, 0.07843138, 0, 1,
-2.083555, -0.5041685, -1.893518, 1, 0.08235294, 0, 1,
-2.07567, -0.1986435, -2.357431, 1, 0.09019608, 0, 1,
-2.07008, -1.288806, -2.23608, 1, 0.09411765, 0, 1,
-2.068833, -0.3480733, -1.904584, 1, 0.1019608, 0, 1,
-2.026927, 0.7061294, -1.565901, 1, 0.1098039, 0, 1,
-2.021283, 0.3544738, -0.9382365, 1, 0.1137255, 0, 1,
-2.016707, 0.615198, -1.13043, 1, 0.1215686, 0, 1,
-2.003147, 0.547489, -2.159822, 1, 0.1254902, 0, 1,
-1.998071, 0.09600148, -0.08849763, 1, 0.1333333, 0, 1,
-1.986155, -0.5198829, -2.196554, 1, 0.1372549, 0, 1,
-1.984372, -1.456483, -3.569356, 1, 0.145098, 0, 1,
-1.978315, 0.591435, -2.298715, 1, 0.1490196, 0, 1,
-1.967262, 0.4503485, -0.7452976, 1, 0.1568628, 0, 1,
-1.944924, -0.8337734, -2.2363, 1, 0.1607843, 0, 1,
-1.936646, -0.7371095, -1.407086, 1, 0.1686275, 0, 1,
-1.912953, -0.02096956, 0.3198678, 1, 0.172549, 0, 1,
-1.898432, -0.3884811, -1.76501, 1, 0.1803922, 0, 1,
-1.888531, 1.342941, -1.831912, 1, 0.1843137, 0, 1,
-1.885867, -1.236548, -1.382108, 1, 0.1921569, 0, 1,
-1.863432, -0.4097792, -0.7574868, 1, 0.1960784, 0, 1,
-1.852687, -0.4411553, -1.982951, 1, 0.2039216, 0, 1,
-1.844479, -0.7414861, -1.416697, 1, 0.2117647, 0, 1,
-1.826673, -0.7878625, -1.908364, 1, 0.2156863, 0, 1,
-1.821882, -0.9981656, -4.416503, 1, 0.2235294, 0, 1,
-1.775927, 0.5526765, -0.1237926, 1, 0.227451, 0, 1,
-1.767583, 0.5249397, -0.4881897, 1, 0.2352941, 0, 1,
-1.762351, 0.5799476, -0.629402, 1, 0.2392157, 0, 1,
-1.762309, 0.1383753, -2.767495, 1, 0.2470588, 0, 1,
-1.750269, -0.08303845, -1.441382, 1, 0.2509804, 0, 1,
-1.721102, -0.6576466, -2.992416, 1, 0.2588235, 0, 1,
-1.720634, 1.002412, -2.051223, 1, 0.2627451, 0, 1,
-1.691799, 1.435489, -1.729631, 1, 0.2705882, 0, 1,
-1.685638, 1.05047, -0.523715, 1, 0.2745098, 0, 1,
-1.678417, -0.5084569, -1.786293, 1, 0.282353, 0, 1,
-1.672762, 0.6731408, -1.761953, 1, 0.2862745, 0, 1,
-1.664745, -0.7999063, -1.2466, 1, 0.2941177, 0, 1,
-1.652392, -0.9323644, -3.330547, 1, 0.3019608, 0, 1,
-1.630792, 0.2056782, -1.783404, 1, 0.3058824, 0, 1,
-1.599083, -1.520393, -1.367862, 1, 0.3137255, 0, 1,
-1.587481, -0.1616627, -0.3520856, 1, 0.3176471, 0, 1,
-1.576191, 0.2116117, -0.5031424, 1, 0.3254902, 0, 1,
-1.56331, 0.1978368, -0.9570961, 1, 0.3294118, 0, 1,
-1.553488, -0.9340056, -4.050967, 1, 0.3372549, 0, 1,
-1.548969, -1.555914, -3.129135, 1, 0.3411765, 0, 1,
-1.542519, -1.98176, -2.997785, 1, 0.3490196, 0, 1,
-1.540559, -1.870034, -2.456878, 1, 0.3529412, 0, 1,
-1.538304, 0.7519841, 0.4881655, 1, 0.3607843, 0, 1,
-1.53466, -1.627968, -1.992395, 1, 0.3647059, 0, 1,
-1.522702, -2.035078, -2.030105, 1, 0.372549, 0, 1,
-1.5145, -0.441796, -1.193752, 1, 0.3764706, 0, 1,
-1.512747, 0.5929619, -1.443185, 1, 0.3843137, 0, 1,
-1.491847, -0.4602061, -1.480522, 1, 0.3882353, 0, 1,
-1.481878, 0.5316778, -1.02436, 1, 0.3960784, 0, 1,
-1.47947, 0.3455592, -2.491128, 1, 0.4039216, 0, 1,
-1.47829, 2.731524, -1.900583, 1, 0.4078431, 0, 1,
-1.475909, -0.623742, -2.523822, 1, 0.4156863, 0, 1,
-1.466246, -0.6472419, -2.034016, 1, 0.4196078, 0, 1,
-1.452811, 0.3833175, -0.0913285, 1, 0.427451, 0, 1,
-1.44976, 0.2433562, -1.772785, 1, 0.4313726, 0, 1,
-1.44902, 0.2045157, -0.8188245, 1, 0.4392157, 0, 1,
-1.434416, -0.1860908, -0.914932, 1, 0.4431373, 0, 1,
-1.429222, 0.2456168, -1.691486, 1, 0.4509804, 0, 1,
-1.424684, 0.8849105, -1.00288, 1, 0.454902, 0, 1,
-1.416512, 0.07629345, -1.531179, 1, 0.4627451, 0, 1,
-1.413192, 0.3184322, -0.5011228, 1, 0.4666667, 0, 1,
-1.407297, -0.3062301, -1.847608, 1, 0.4745098, 0, 1,
-1.404544, 0.1173267, -0.9753867, 1, 0.4784314, 0, 1,
-1.39891, -0.5247143, -1.592339, 1, 0.4862745, 0, 1,
-1.398761, 0.08966845, 0.4175186, 1, 0.4901961, 0, 1,
-1.394274, 0.6292614, -0.8364511, 1, 0.4980392, 0, 1,
-1.380485, -0.7289345, -2.350239, 1, 0.5058824, 0, 1,
-1.37947, 1.261759, 0.2542178, 1, 0.509804, 0, 1,
-1.365242, 1.545528, -0.1545644, 1, 0.5176471, 0, 1,
-1.362726, 1.264254, 0.1595794, 1, 0.5215687, 0, 1,
-1.36085, -0.9459035, -2.826193, 1, 0.5294118, 0, 1,
-1.357204, 1.271135, 0.8196104, 1, 0.5333334, 0, 1,
-1.348189, 1.227018, -1.93882, 1, 0.5411765, 0, 1,
-1.347443, -1.352033, -2.522772, 1, 0.5450981, 0, 1,
-1.345916, -0.5069754, -2.985648, 1, 0.5529412, 0, 1,
-1.342186, -1.127413, -2.109257, 1, 0.5568628, 0, 1,
-1.340541, 0.7267303, -0.1150384, 1, 0.5647059, 0, 1,
-1.336231, -0.1431989, 0.573456, 1, 0.5686275, 0, 1,
-1.322962, -0.069324, -1.63763, 1, 0.5764706, 0, 1,
-1.313924, 0.007203557, -0.1096065, 1, 0.5803922, 0, 1,
-1.312307, 0.7669039, -0.4582354, 1, 0.5882353, 0, 1,
-1.310992, 0.4685473, -0.8943358, 1, 0.5921569, 0, 1,
-1.304623, -0.2363016, -2.949777, 1, 0.6, 0, 1,
-1.303543, -0.3076212, -2.10829, 1, 0.6078432, 0, 1,
-1.302517, 0.683733, -2.151551, 1, 0.6117647, 0, 1,
-1.291641, -2.06509, -2.556035, 1, 0.6196079, 0, 1,
-1.286806, 0.9122041, 0.08044686, 1, 0.6235294, 0, 1,
-1.286138, -1.295839, -2.437972, 1, 0.6313726, 0, 1,
-1.281075, -0.2262957, -0.8186259, 1, 0.6352941, 0, 1,
-1.260845, -0.3459022, -3.998518, 1, 0.6431373, 0, 1,
-1.260317, -1.334749, -1.086568, 1, 0.6470588, 0, 1,
-1.251804, 0.7146557, -1.757379, 1, 0.654902, 0, 1,
-1.250162, -0.5106598, -1.132601, 1, 0.6588235, 0, 1,
-1.249786, 0.1956315, -2.980615, 1, 0.6666667, 0, 1,
-1.248232, -0.4601261, -1.709659, 1, 0.6705883, 0, 1,
-1.247252, 1.492845, -2.265772, 1, 0.6784314, 0, 1,
-1.245023, 0.1362531, -2.456913, 1, 0.682353, 0, 1,
-1.236875, -1.558426, -2.352134, 1, 0.6901961, 0, 1,
-1.232184, -0.2093906, -1.394244, 1, 0.6941177, 0, 1,
-1.226483, 1.619048, -2.456432, 1, 0.7019608, 0, 1,
-1.226225, 2.760913, -2.181292, 1, 0.7098039, 0, 1,
-1.222794, 0.2728252, -1.261818, 1, 0.7137255, 0, 1,
-1.216292, -0.2645754, -1.353009, 1, 0.7215686, 0, 1,
-1.212844, 0.3135784, -0.4562701, 1, 0.7254902, 0, 1,
-1.211085, 0.2922127, -2.427507, 1, 0.7333333, 0, 1,
-1.210281, 0.6745463, -1.356576, 1, 0.7372549, 0, 1,
-1.202635, -2.113597, -3.421561, 1, 0.7450981, 0, 1,
-1.20066, -1.092984, -3.833717, 1, 0.7490196, 0, 1,
-1.191904, 1.123862, -1.145676, 1, 0.7568628, 0, 1,
-1.191569, -0.02349622, -1.622513, 1, 0.7607843, 0, 1,
-1.179505, -0.5679147, -0.4726729, 1, 0.7686275, 0, 1,
-1.177927, -0.3393841, -0.2882981, 1, 0.772549, 0, 1,
-1.173944, -0.2590118, -2.2445, 1, 0.7803922, 0, 1,
-1.170226, -0.3338558, -0.6490734, 1, 0.7843137, 0, 1,
-1.168012, 1.412568, -1.66136, 1, 0.7921569, 0, 1,
-1.167192, -0.3534428, -2.417943, 1, 0.7960784, 0, 1,
-1.162443, -1.718198, -1.835146, 1, 0.8039216, 0, 1,
-1.158064, -0.6137764, -3.033375, 1, 0.8117647, 0, 1,
-1.145428, 0.003198028, -1.921893, 1, 0.8156863, 0, 1,
-1.136398, 0.2704547, 0.4068958, 1, 0.8235294, 0, 1,
-1.135782, -0.6237447, -2.377865, 1, 0.827451, 0, 1,
-1.134636, 0.7622836, -0.5430542, 1, 0.8352941, 0, 1,
-1.131058, 2.05855, 0.4538291, 1, 0.8392157, 0, 1,
-1.123455, -0.6892735, -1.701481, 1, 0.8470588, 0, 1,
-1.112541, -1.406706, -3.055516, 1, 0.8509804, 0, 1,
-1.109938, 0.6262886, -0.5118666, 1, 0.8588235, 0, 1,
-1.09586, -1.072013, -1.965543, 1, 0.8627451, 0, 1,
-1.085481, -0.20535, -2.918381, 1, 0.8705882, 0, 1,
-1.085271, 0.4364879, -2.208966, 1, 0.8745098, 0, 1,
-1.07787, 0.2805574, -2.174463, 1, 0.8823529, 0, 1,
-1.07689, 0.2718253, -2.942978, 1, 0.8862745, 0, 1,
-1.071632, -1.044549, -0.7098649, 1, 0.8941177, 0, 1,
-1.056955, -2.124865, -3.264467, 1, 0.8980392, 0, 1,
-1.056341, 0.08412038, -1.360234, 1, 0.9058824, 0, 1,
-1.055613, -1.651056, -1.547437, 1, 0.9137255, 0, 1,
-1.05508, 1.921921, 0.509931, 1, 0.9176471, 0, 1,
-1.054541, 0.5562091, -2.179033, 1, 0.9254902, 0, 1,
-1.050199, 3.502945, -0.8081794, 1, 0.9294118, 0, 1,
-1.049196, -2.451442, -1.600771, 1, 0.9372549, 0, 1,
-1.047993, 0.104437, -0.3863537, 1, 0.9411765, 0, 1,
-1.043291, -0.4834519, -0.9984137, 1, 0.9490196, 0, 1,
-1.041437, -0.9647343, -3.661466, 1, 0.9529412, 0, 1,
-1.039629, 0.007332361, -3.005837, 1, 0.9607843, 0, 1,
-1.027448, 0.2073951, -1.773093, 1, 0.9647059, 0, 1,
-1.025742, -0.7661355, -2.13007, 1, 0.972549, 0, 1,
-1.022279, -0.04847767, -0.5944979, 1, 0.9764706, 0, 1,
-1.017376, -1.326634, -1.996903, 1, 0.9843137, 0, 1,
-1.011627, 0.5195568, -0.3101464, 1, 0.9882353, 0, 1,
-1.007818, 0.2090594, -2.209182, 1, 0.9960784, 0, 1,
-1.003508, 0.6863644, -0.8612595, 0.9960784, 1, 0, 1,
-0.9991766, -1.480926, -2.292557, 0.9921569, 1, 0, 1,
-0.9991446, 1.033457, -1.268335, 0.9843137, 1, 0, 1,
-0.9910195, -0.7071211, -2.23225, 0.9803922, 1, 0, 1,
-0.9802462, 1.69033, -2.739605, 0.972549, 1, 0, 1,
-0.9744809, -0.1470571, -2.04728, 0.9686275, 1, 0, 1,
-0.9712535, -1.47829, -4.892127, 0.9607843, 1, 0, 1,
-0.968705, -0.1762019, -2.115309, 0.9568627, 1, 0, 1,
-0.9684382, -1.501741, -0.3747585, 0.9490196, 1, 0, 1,
-0.9612057, -0.6695939, -1.275295, 0.945098, 1, 0, 1,
-0.9450101, -1.996802, -2.496915, 0.9372549, 1, 0, 1,
-0.9425116, -0.7796217, -1.74191, 0.9333333, 1, 0, 1,
-0.9414442, -0.1793488, -0.9550002, 0.9254902, 1, 0, 1,
-0.9395311, -0.09880798, -0.6342666, 0.9215686, 1, 0, 1,
-0.9392373, 1.882403, -1.257162, 0.9137255, 1, 0, 1,
-0.9371295, -0.6504441, -0.7668737, 0.9098039, 1, 0, 1,
-0.9320309, -0.9194248, -2.377077, 0.9019608, 1, 0, 1,
-0.9280282, -1.250891, -2.608203, 0.8941177, 1, 0, 1,
-0.9234295, -0.515534, -1.458557, 0.8901961, 1, 0, 1,
-0.9230562, -0.3823749, -0.8311716, 0.8823529, 1, 0, 1,
-0.9211572, -0.8141363, -2.936484, 0.8784314, 1, 0, 1,
-0.915844, 0.09584259, -2.246171, 0.8705882, 1, 0, 1,
-0.9128483, 1.212703, -0.6281111, 0.8666667, 1, 0, 1,
-0.9069572, -0.9931892, -4.638544, 0.8588235, 1, 0, 1,
-0.9060041, -0.1897704, -1.094158, 0.854902, 1, 0, 1,
-0.9029025, 1.650156, 0.5983973, 0.8470588, 1, 0, 1,
-0.9011159, -0.9007144, -1.924465, 0.8431373, 1, 0, 1,
-0.9007558, -1.431782, -5.848031, 0.8352941, 1, 0, 1,
-0.8915052, 0.3805915, -0.9938514, 0.8313726, 1, 0, 1,
-0.8875805, -0.06781745, -2.88184, 0.8235294, 1, 0, 1,
-0.8857245, 1.176476, 0.3517203, 0.8196079, 1, 0, 1,
-0.8726467, -1.139006, -1.285946, 0.8117647, 1, 0, 1,
-0.8708473, -0.3753358, -2.443295, 0.8078431, 1, 0, 1,
-0.8632274, 0.5893343, -3.007453, 0.8, 1, 0, 1,
-0.8626527, -0.6836603, -2.508237, 0.7921569, 1, 0, 1,
-0.8622348, -0.2927971, -0.3406858, 0.7882353, 1, 0, 1,
-0.8539111, 0.2126046, -0.8873081, 0.7803922, 1, 0, 1,
-0.8445985, -1.259962, -3.757246, 0.7764706, 1, 0, 1,
-0.8405332, 1.718832, -0.2225457, 0.7686275, 1, 0, 1,
-0.8400725, -0.8304701, -1.067051, 0.7647059, 1, 0, 1,
-0.8326221, 0.9936038, -0.3027456, 0.7568628, 1, 0, 1,
-0.8315951, 1.039779, -0.9078539, 0.7529412, 1, 0, 1,
-0.8272215, 0.8521155, -0.7664073, 0.7450981, 1, 0, 1,
-0.8232072, 0.4478511, -0.1882641, 0.7411765, 1, 0, 1,
-0.8194162, 0.5942149, -0.9520264, 0.7333333, 1, 0, 1,
-0.8185904, -0.2929247, -0.6009338, 0.7294118, 1, 0, 1,
-0.8105596, -0.00962474, -1.858497, 0.7215686, 1, 0, 1,
-0.8103055, 0.2252356, -0.5348594, 0.7176471, 1, 0, 1,
-0.8030306, 0.4170534, -1.872073, 0.7098039, 1, 0, 1,
-0.8016323, -0.3940443, -3.545318, 0.7058824, 1, 0, 1,
-0.8009035, 0.7433001, -0.7277572, 0.6980392, 1, 0, 1,
-0.7941487, 0.4008535, -1.138747, 0.6901961, 1, 0, 1,
-0.7885036, -0.3446447, -1.605063, 0.6862745, 1, 0, 1,
-0.7831908, 0.2951323, -1.173866, 0.6784314, 1, 0, 1,
-0.7790606, -0.1758547, -0.09894808, 0.6745098, 1, 0, 1,
-0.7770523, -0.1593099, -2.791719, 0.6666667, 1, 0, 1,
-0.7765391, -0.4524923, -1.686777, 0.6627451, 1, 0, 1,
-0.7683923, 0.4342564, -1.585669, 0.654902, 1, 0, 1,
-0.7674874, -1.012955, -1.475389, 0.6509804, 1, 0, 1,
-0.7671633, 0.5725117, -0.6521287, 0.6431373, 1, 0, 1,
-0.7643861, 0.9937938, 0.928175, 0.6392157, 1, 0, 1,
-0.7603608, -1.073887, -2.675199, 0.6313726, 1, 0, 1,
-0.7561002, -1.316879, -0.07502247, 0.627451, 1, 0, 1,
-0.7548847, -0.7923355, -1.301942, 0.6196079, 1, 0, 1,
-0.7544364, -2.408049, -3.229547, 0.6156863, 1, 0, 1,
-0.7463629, -0.6448513, -1.811123, 0.6078432, 1, 0, 1,
-0.7431459, 0.9110172, -1.658562, 0.6039216, 1, 0, 1,
-0.7426243, -0.1295446, -1.537989, 0.5960785, 1, 0, 1,
-0.7404701, 0.8090276, 0.6009033, 0.5882353, 1, 0, 1,
-0.7399346, 0.7101055, -0.8352861, 0.5843138, 1, 0, 1,
-0.7388787, 0.6833518, -1.937095, 0.5764706, 1, 0, 1,
-0.7375897, 1.934355, -1.278679, 0.572549, 1, 0, 1,
-0.7374998, 0.05939922, -2.116433, 0.5647059, 1, 0, 1,
-0.7370702, 0.8954065, 1.374635, 0.5607843, 1, 0, 1,
-0.7266125, 0.8843429, 1.528724, 0.5529412, 1, 0, 1,
-0.7157747, 0.5657798, -1.642483, 0.5490196, 1, 0, 1,
-0.70495, 0.01067675, -1.889524, 0.5411765, 1, 0, 1,
-0.6978692, -0.8449519, -2.149624, 0.5372549, 1, 0, 1,
-0.697714, 0.6973568, -0.2697778, 0.5294118, 1, 0, 1,
-0.6952121, 2.216392, -0.04345813, 0.5254902, 1, 0, 1,
-0.6938754, 0.3395506, 0.2663301, 0.5176471, 1, 0, 1,
-0.6912917, -0.5253145, -1.988016, 0.5137255, 1, 0, 1,
-0.6861836, -0.1790063, -3.289584, 0.5058824, 1, 0, 1,
-0.683989, 0.6619715, -2.2523, 0.5019608, 1, 0, 1,
-0.683385, 1.432828, 1.543968, 0.4941176, 1, 0, 1,
-0.6774765, -0.08156396, -2.40033, 0.4862745, 1, 0, 1,
-0.6671458, 0.2726968, 0.6180771, 0.4823529, 1, 0, 1,
-0.6671159, 1.054592, 0.3646804, 0.4745098, 1, 0, 1,
-0.6576492, -0.05523935, -1.195905, 0.4705882, 1, 0, 1,
-0.6572938, -0.713278, -2.868787, 0.4627451, 1, 0, 1,
-0.6534807, 0.2130775, -0.7475664, 0.4588235, 1, 0, 1,
-0.6522706, 0.2435881, -1.92036, 0.4509804, 1, 0, 1,
-0.6486791, 0.5252968, -0.6176954, 0.4470588, 1, 0, 1,
-0.6412781, 2.766489, 0.7622802, 0.4392157, 1, 0, 1,
-0.6386609, -1.884985, -0.6578232, 0.4352941, 1, 0, 1,
-0.6337414, 0.7648336, -0.7971306, 0.427451, 1, 0, 1,
-0.6332816, -0.2578853, -0.4677117, 0.4235294, 1, 0, 1,
-0.630038, -0.4998534, 0.3613792, 0.4156863, 1, 0, 1,
-0.6201216, 0.2522072, -1.238694, 0.4117647, 1, 0, 1,
-0.6184774, 1.419092, -0.5034732, 0.4039216, 1, 0, 1,
-0.6173884, -1.073315, -1.402063, 0.3960784, 1, 0, 1,
-0.6138496, 1.259542, -0.5484179, 0.3921569, 1, 0, 1,
-0.6004868, 1.934541, 0.624651, 0.3843137, 1, 0, 1,
-0.5997146, 0.2914218, -2.564333, 0.3803922, 1, 0, 1,
-0.5952317, -1.827913, -1.495738, 0.372549, 1, 0, 1,
-0.5931401, -0.4961105, -0.8891494, 0.3686275, 1, 0, 1,
-0.5889704, 0.295436, -0.04794304, 0.3607843, 1, 0, 1,
-0.5874198, 0.8091496, -1.082028, 0.3568628, 1, 0, 1,
-0.5861154, -2.299161, -0.82098, 0.3490196, 1, 0, 1,
-0.5784026, 1.12325, -0.7019859, 0.345098, 1, 0, 1,
-0.5773733, 0.5657964, 0.1790617, 0.3372549, 1, 0, 1,
-0.5769216, -1.172361, -1.906321, 0.3333333, 1, 0, 1,
-0.5761074, 0.4034859, -2.072133, 0.3254902, 1, 0, 1,
-0.5705684, 0.6600082, -0.7330497, 0.3215686, 1, 0, 1,
-0.567399, 0.1193122, 0.7552597, 0.3137255, 1, 0, 1,
-0.5673133, 0.2131779, -1.384859, 0.3098039, 1, 0, 1,
-0.5655078, 3.085518, -0.5226136, 0.3019608, 1, 0, 1,
-0.5598436, -1.337276, -1.723985, 0.2941177, 1, 0, 1,
-0.5565801, 2.137821, 0.4047278, 0.2901961, 1, 0, 1,
-0.5492901, 0.8085964, -0.788053, 0.282353, 1, 0, 1,
-0.5439821, 0.1922975, -2.237783, 0.2784314, 1, 0, 1,
-0.5422782, 0.5605705, -0.7188625, 0.2705882, 1, 0, 1,
-0.5422621, 0.1825608, -0.6687437, 0.2666667, 1, 0, 1,
-0.5401234, -1.074632, -1.946774, 0.2588235, 1, 0, 1,
-0.5340857, 0.6238942, -1.32094, 0.254902, 1, 0, 1,
-0.5330694, 0.594573, -0.6658933, 0.2470588, 1, 0, 1,
-0.5314548, 1.50867, -1.123456, 0.2431373, 1, 0, 1,
-0.5304022, 0.8840881, -0.5239724, 0.2352941, 1, 0, 1,
-0.5303729, -0.4469367, -2.570043, 0.2313726, 1, 0, 1,
-0.5276201, 1.615946, -0.5753857, 0.2235294, 1, 0, 1,
-0.5247734, -0.4637537, -3.463806, 0.2196078, 1, 0, 1,
-0.5213179, -0.1852584, -1.087611, 0.2117647, 1, 0, 1,
-0.521108, 0.6845137, -3.915008, 0.2078431, 1, 0, 1,
-0.5202109, 0.2664608, -1.026768, 0.2, 1, 0, 1,
-0.5191903, 0.4792006, -2.094333, 0.1921569, 1, 0, 1,
-0.5180717, -0.2764125, -1.480039, 0.1882353, 1, 0, 1,
-0.5169333, -0.7724943, -3.102333, 0.1803922, 1, 0, 1,
-0.5166396, -0.1864291, -2.00693, 0.1764706, 1, 0, 1,
-0.5141678, -0.2686781, -2.262629, 0.1686275, 1, 0, 1,
-0.5068879, -1.727497, -3.726424, 0.1647059, 1, 0, 1,
-0.5060803, 0.958877, -1.151211, 0.1568628, 1, 0, 1,
-0.4994512, -0.316311, -0.9716556, 0.1529412, 1, 0, 1,
-0.4949597, -0.1070094, -2.655143, 0.145098, 1, 0, 1,
-0.4917413, 0.2149828, -0.8099354, 0.1411765, 1, 0, 1,
-0.4826886, 0.1248617, -1.686613, 0.1333333, 1, 0, 1,
-0.4802248, 0.6144678, -1.194639, 0.1294118, 1, 0, 1,
-0.4794807, 0.4928865, -0.7465137, 0.1215686, 1, 0, 1,
-0.4780552, 1.647354, 0.01942327, 0.1176471, 1, 0, 1,
-0.4779614, 0.5276148, -1.762743, 0.1098039, 1, 0, 1,
-0.4738272, 1.776163, -0.2556133, 0.1058824, 1, 0, 1,
-0.4706677, 1.409238, -1.925834, 0.09803922, 1, 0, 1,
-0.4678779, -0.3872357, -1.457273, 0.09019608, 1, 0, 1,
-0.4675084, -1.10805, -3.21321, 0.08627451, 1, 0, 1,
-0.4609892, 0.600109, -3.063315, 0.07843138, 1, 0, 1,
-0.4567966, -0.645916, -3.791341, 0.07450981, 1, 0, 1,
-0.4518844, 0.9201666, -0.3766448, 0.06666667, 1, 0, 1,
-0.4515754, -0.6283211, -2.55216, 0.0627451, 1, 0, 1,
-0.449782, 0.4528115, 0.5644236, 0.05490196, 1, 0, 1,
-0.4452654, -0.9884151, -2.766162, 0.05098039, 1, 0, 1,
-0.4400504, -0.293177, -2.026504, 0.04313726, 1, 0, 1,
-0.4392328, -0.8789619, -2.01595, 0.03921569, 1, 0, 1,
-0.4369047, 0.8319302, 0.8518842, 0.03137255, 1, 0, 1,
-0.4362332, 2.749433, -1.986316, 0.02745098, 1, 0, 1,
-0.435619, -0.1823169, -1.991147, 0.01960784, 1, 0, 1,
-0.4352235, -0.1023283, -3.655004, 0.01568628, 1, 0, 1,
-0.433601, 1.167786, 0.04192731, 0.007843138, 1, 0, 1,
-0.4329997, 0.5550426, 0.3922827, 0.003921569, 1, 0, 1,
-0.4293789, -0.03581188, -3.462517, 0, 1, 0.003921569, 1,
-0.428554, 0.808068, 0.2773168, 0, 1, 0.01176471, 1,
-0.4278778, -0.05282455, -2.637396, 0, 1, 0.01568628, 1,
-0.4247918, 0.3794564, -0.6046516, 0, 1, 0.02352941, 1,
-0.4202053, 0.2228847, -0.01673384, 0, 1, 0.02745098, 1,
-0.4186717, -0.3151504, -2.317276, 0, 1, 0.03529412, 1,
-0.4162458, 0.9298758, 0.162164, 0, 1, 0.03921569, 1,
-0.4141542, 0.2198407, -1.213794, 0, 1, 0.04705882, 1,
-0.4040012, -0.3705595, -1.354855, 0, 1, 0.05098039, 1,
-0.4028931, 1.06224, -0.4882512, 0, 1, 0.05882353, 1,
-0.4027846, 0.2785731, -1.010748, 0, 1, 0.0627451, 1,
-0.4025176, 0.3318635, -0.1673457, 0, 1, 0.07058824, 1,
-0.4003212, 0.7959442, 0.3120163, 0, 1, 0.07450981, 1,
-0.3985345, -0.4407669, -2.397777, 0, 1, 0.08235294, 1,
-0.3941677, 1.441487, 1.336156, 0, 1, 0.08627451, 1,
-0.393202, 0.03878463, -0.947038, 0, 1, 0.09411765, 1,
-0.3873614, 1.216978, -0.5018894, 0, 1, 0.1019608, 1,
-0.3811124, 0.2336861, -0.4279673, 0, 1, 0.1058824, 1,
-0.3809776, -0.1272346, -2.194415, 0, 1, 0.1137255, 1,
-0.3771203, 1.431956, -0.6362056, 0, 1, 0.1176471, 1,
-0.3762686, 1.433696, 0.1195436, 0, 1, 0.1254902, 1,
-0.3747021, -0.3863202, -1.790269, 0, 1, 0.1294118, 1,
-0.3741534, 0.5239124, -1.43734, 0, 1, 0.1372549, 1,
-0.3621626, 0.8984467, -1.454434, 0, 1, 0.1411765, 1,
-0.3602322, -0.7453321, -2.97222, 0, 1, 0.1490196, 1,
-0.3547063, -0.8389637, -2.969639, 0, 1, 0.1529412, 1,
-0.3463458, 1.708759, -0.1534898, 0, 1, 0.1607843, 1,
-0.3422824, 0.06392056, -3.474783, 0, 1, 0.1647059, 1,
-0.341986, 0.1336501, -2.173516, 0, 1, 0.172549, 1,
-0.3412388, -0.02334747, -0.2385584, 0, 1, 0.1764706, 1,
-0.3407464, 1.730215, -0.2100649, 0, 1, 0.1843137, 1,
-0.3370183, 0.6075249, -0.7490505, 0, 1, 0.1882353, 1,
-0.3313173, -0.004023605, -1.376587, 0, 1, 0.1960784, 1,
-0.3306612, -0.2074126, -0.943952, 0, 1, 0.2039216, 1,
-0.3263078, -0.5238449, -2.945231, 0, 1, 0.2078431, 1,
-0.3260751, 0.6979937, 0.6230609, 0, 1, 0.2156863, 1,
-0.3233205, 1.416807, 0.4586227, 0, 1, 0.2196078, 1,
-0.3232257, 0.1337178, -2.226841, 0, 1, 0.227451, 1,
-0.3203823, -0.1948228, -1.558031, 0, 1, 0.2313726, 1,
-0.3155128, 1.465416, 1.109498, 0, 1, 0.2392157, 1,
-0.3129362, 0.4548455, -3.608495, 0, 1, 0.2431373, 1,
-0.3123382, 0.07958451, -1.080462, 0, 1, 0.2509804, 1,
-0.3111609, 1.231167, -0.7565496, 0, 1, 0.254902, 1,
-0.3107451, 1.067943, -0.1492693, 0, 1, 0.2627451, 1,
-0.3081743, -2.364853, -3.826614, 0, 1, 0.2666667, 1,
-0.3069074, 0.7727447, -0.9705835, 0, 1, 0.2745098, 1,
-0.3050759, -1.611481, -3.986153, 0, 1, 0.2784314, 1,
-0.303906, 0.1920773, -1.43456, 0, 1, 0.2862745, 1,
-0.29974, 0.338834, 0.5341995, 0, 1, 0.2901961, 1,
-0.2965693, -0.2973637, -2.491359, 0, 1, 0.2980392, 1,
-0.2921627, 0.4537042, -1.236813, 0, 1, 0.3058824, 1,
-0.2900601, 0.631234, -0.8981236, 0, 1, 0.3098039, 1,
-0.2889216, 0.1718475, -0.8077242, 0, 1, 0.3176471, 1,
-0.285712, -0.5967907, -3.113249, 0, 1, 0.3215686, 1,
-0.2782636, 0.5231879, -1.195159, 0, 1, 0.3294118, 1,
-0.2754338, 0.3046486, -0.5465955, 0, 1, 0.3333333, 1,
-0.2596689, 0.0446519, -2.442232, 0, 1, 0.3411765, 1,
-0.2593417, -0.9019554, -3.98521, 0, 1, 0.345098, 1,
-0.251765, 1.261477, 0.7430868, 0, 1, 0.3529412, 1,
-0.2493864, -0.05735269, -1.435664, 0, 1, 0.3568628, 1,
-0.2474057, -1.021055, -3.647372, 0, 1, 0.3647059, 1,
-0.2448467, 0.7605771, 0.4949775, 0, 1, 0.3686275, 1,
-0.2445656, -1.920842, -3.590588, 0, 1, 0.3764706, 1,
-0.2411798, -0.6367311, -3.744365, 0, 1, 0.3803922, 1,
-0.232854, -0.4811364, -0.4915845, 0, 1, 0.3882353, 1,
-0.2322404, -1.602628, -1.221623, 0, 1, 0.3921569, 1,
-0.2272128, 0.4816718, -0.3323714, 0, 1, 0.4, 1,
-0.2252903, -0.002708793, -3.391091, 0, 1, 0.4078431, 1,
-0.2240947, -1.024892, -1.978596, 0, 1, 0.4117647, 1,
-0.2215909, 0.3497276, 0.3263978, 0, 1, 0.4196078, 1,
-0.2198164, -0.08585137, -0.548321, 0, 1, 0.4235294, 1,
-0.2173956, -0.3384481, -2.866188, 0, 1, 0.4313726, 1,
-0.2158049, 2.184963, 1.264048, 0, 1, 0.4352941, 1,
-0.2151654, -0.5045968, -5.063753, 0, 1, 0.4431373, 1,
-0.2117006, -1.494657, -2.916322, 0, 1, 0.4470588, 1,
-0.2073605, -0.9459173, -2.118899, 0, 1, 0.454902, 1,
-0.2023686, 0.1333924, -0.5824089, 0, 1, 0.4588235, 1,
-0.2004445, -1.845953, -4.439367, 0, 1, 0.4666667, 1,
-0.1965655, 0.532415, 1.470397, 0, 1, 0.4705882, 1,
-0.1940513, -0.9367008, -3.947118, 0, 1, 0.4784314, 1,
-0.1938606, 0.4279718, -0.6758987, 0, 1, 0.4823529, 1,
-0.193417, -2.196261, -3.28712, 0, 1, 0.4901961, 1,
-0.1919956, 0.5541491, 0.223186, 0, 1, 0.4941176, 1,
-0.1914048, -1.133917, -2.627989, 0, 1, 0.5019608, 1,
-0.1898104, -0.7790088, -3.686481, 0, 1, 0.509804, 1,
-0.1887688, 0.6902094, -0.9447019, 0, 1, 0.5137255, 1,
-0.1879389, 0.7327798, -0.09681623, 0, 1, 0.5215687, 1,
-0.187768, 0.1848919, -1.603738, 0, 1, 0.5254902, 1,
-0.1873311, 0.3250343, -2.234997, 0, 1, 0.5333334, 1,
-0.186255, 2.107844, 0.4544958, 0, 1, 0.5372549, 1,
-0.1861698, -1.143858, -1.857572, 0, 1, 0.5450981, 1,
-0.1856033, -0.9090912, -1.363631, 0, 1, 0.5490196, 1,
-0.1826323, 1.887995, 0.4580257, 0, 1, 0.5568628, 1,
-0.1819226, -1.387814, -1.510111, 0, 1, 0.5607843, 1,
-0.1722236, 0.5229374, -0.3408745, 0, 1, 0.5686275, 1,
-0.1703314, 0.02343498, 0.3711995, 0, 1, 0.572549, 1,
-0.1663681, -0.6539037, -4.529319, 0, 1, 0.5803922, 1,
-0.1548343, 0.6068195, 0.8524114, 0, 1, 0.5843138, 1,
-0.1526394, -0.9641782, -2.844909, 0, 1, 0.5921569, 1,
-0.1511128, -0.5612618, -4.620662, 0, 1, 0.5960785, 1,
-0.1503403, -0.3153836, -3.424045, 0, 1, 0.6039216, 1,
-0.1501757, 0.4132743, -1.124768, 0, 1, 0.6117647, 1,
-0.1493679, 0.5127012, -0.7302562, 0, 1, 0.6156863, 1,
-0.1492546, -0.5044277, -2.258296, 0, 1, 0.6235294, 1,
-0.1491054, -0.6554172, -1.198919, 0, 1, 0.627451, 1,
-0.1390753, -0.004717234, -2.808387, 0, 1, 0.6352941, 1,
-0.1355285, -0.4253304, -2.718146, 0, 1, 0.6392157, 1,
-0.1340956, -0.06378537, -0.8304888, 0, 1, 0.6470588, 1,
-0.1324982, -0.08695604, -2.865138, 0, 1, 0.6509804, 1,
-0.1324402, -1.190776, -2.747932, 0, 1, 0.6588235, 1,
-0.1306222, -0.9753842, -2.815375, 0, 1, 0.6627451, 1,
-0.1301236, 0.5312011, 0.2209784, 0, 1, 0.6705883, 1,
-0.1300405, -0.7354475, -1.806567, 0, 1, 0.6745098, 1,
-0.1295293, 1.024761, -0.144759, 0, 1, 0.682353, 1,
-0.1292291, 0.3287185, -0.5295531, 0, 1, 0.6862745, 1,
-0.1291669, 0.4437092, -0.5561775, 0, 1, 0.6941177, 1,
-0.1281259, 0.3583286, 1.44845, 0, 1, 0.7019608, 1,
-0.1275972, -1.254834, -4.137844, 0, 1, 0.7058824, 1,
-0.1234086, 0.2869282, -1.24375, 0, 1, 0.7137255, 1,
-0.1180877, -0.5437883, -2.767695, 0, 1, 0.7176471, 1,
-0.1172818, -0.08648825, -3.787891, 0, 1, 0.7254902, 1,
-0.102655, 0.3487426, 0.04855913, 0, 1, 0.7294118, 1,
-0.09569337, 0.527191, 0.09112936, 0, 1, 0.7372549, 1,
-0.0913449, -0.01571546, -2.39067, 0, 1, 0.7411765, 1,
-0.08772328, -0.006546131, -3.537078, 0, 1, 0.7490196, 1,
-0.08113509, 1.755564, -0.3474421, 0, 1, 0.7529412, 1,
-0.08082215, -0.1386833, -4.289273, 0, 1, 0.7607843, 1,
-0.07378854, -0.400995, -3.094353, 0, 1, 0.7647059, 1,
-0.07118311, -0.2749729, -3.108206, 0, 1, 0.772549, 1,
-0.0650769, -1.013442, -1.918401, 0, 1, 0.7764706, 1,
-0.0648452, 0.5864571, -0.2959631, 0, 1, 0.7843137, 1,
-0.06131346, -1.380141, -3.746789, 0, 1, 0.7882353, 1,
-0.05940846, -0.6355526, -2.425727, 0, 1, 0.7960784, 1,
-0.05540849, 0.6407653, -0.4728893, 0, 1, 0.8039216, 1,
-0.05082834, -0.5654871, -1.665966, 0, 1, 0.8078431, 1,
-0.05006166, 0.7545014, 1.051639, 0, 1, 0.8156863, 1,
-0.04986459, 0.8378231, 0.887018, 0, 1, 0.8196079, 1,
-0.04810906, 0.09818586, -1.367875, 0, 1, 0.827451, 1,
-0.04682058, 0.1581422, -0.07622318, 0, 1, 0.8313726, 1,
-0.04019257, 0.03604192, 0.1495368, 0, 1, 0.8392157, 1,
-0.04006125, -2.552175, -2.92532, 0, 1, 0.8431373, 1,
-0.0390243, 0.6049868, -1.294002, 0, 1, 0.8509804, 1,
-0.03536845, 1.165067, -0.1736455, 0, 1, 0.854902, 1,
-0.03176586, -0.8321422, -3.180874, 0, 1, 0.8627451, 1,
-0.02884094, 0.3226548, 0.4329698, 0, 1, 0.8666667, 1,
-0.02878258, -1.274629, -4.496601, 0, 1, 0.8745098, 1,
-0.02872342, -0.1098298, -3.364995, 0, 1, 0.8784314, 1,
-0.02420649, -1.519934, -2.196241, 0, 1, 0.8862745, 1,
-0.02153759, 0.8255414, -1.952193, 0, 1, 0.8901961, 1,
-0.0158686, -1.627911, -2.959855, 0, 1, 0.8980392, 1,
-0.01333163, -0.9614483, -3.798136, 0, 1, 0.9058824, 1,
-0.01272459, 0.5839638, -0.9274545, 0, 1, 0.9098039, 1,
-0.01101971, -0.7984498, -4.552509, 0, 1, 0.9176471, 1,
-0.009757166, -0.3843148, -3.110836, 0, 1, 0.9215686, 1,
-0.009308299, 0.3483477, -0.2127147, 0, 1, 0.9294118, 1,
-0.008801033, 0.03088748, -0.3890424, 0, 1, 0.9333333, 1,
-0.008364125, -0.9295832, -3.693746, 0, 1, 0.9411765, 1,
-0.007268042, 0.4121282, 0.1353001, 0, 1, 0.945098, 1,
-0.005769633, 0.87376, 0.6118259, 0, 1, 0.9529412, 1,
-0.004314063, -0.1335897, -1.29494, 0, 1, 0.9568627, 1,
-0.0001829879, -0.1910641, -1.962525, 0, 1, 0.9647059, 1,
-1.337297e-05, 1.153829, -0.4941775, 0, 1, 0.9686275, 1,
0.000542674, -1.466051, 2.046752, 0, 1, 0.9764706, 1,
0.004124732, -1.72396, 2.630332, 0, 1, 0.9803922, 1,
0.005894503, 0.4725808, -1.518721, 0, 1, 0.9882353, 1,
0.006479472, -1.708649, 4.810391, 0, 1, 0.9921569, 1,
0.01502599, 0.2943076, -0.7395574, 0, 1, 1, 1,
0.01700928, 2.322498, 0.0183168, 0, 0.9921569, 1, 1,
0.01902249, -0.6325786, 5.239367, 0, 0.9882353, 1, 1,
0.02377516, 0.678194, -1.598048, 0, 0.9803922, 1, 1,
0.02780736, 1.538311, -0.5621473, 0, 0.9764706, 1, 1,
0.03138296, 0.319961, -0.2262414, 0, 0.9686275, 1, 1,
0.03204581, -0.4657455, 3.817554, 0, 0.9647059, 1, 1,
0.03241809, -0.1822523, 2.261748, 0, 0.9568627, 1, 1,
0.03270003, -0.8438788, 4.962164, 0, 0.9529412, 1, 1,
0.03343588, 0.04159442, 2.858671, 0, 0.945098, 1, 1,
0.04039043, 0.9182011, -2.257527, 0, 0.9411765, 1, 1,
0.04563024, 1.261157, -1.633494, 0, 0.9333333, 1, 1,
0.0469655, 0.133732, -0.6185157, 0, 0.9294118, 1, 1,
0.04873794, -0.4261908, 4.096899, 0, 0.9215686, 1, 1,
0.05129949, 0.2724748, 0.414949, 0, 0.9176471, 1, 1,
0.05532617, 0.5672198, 0.846296, 0, 0.9098039, 1, 1,
0.06265568, -0.8010602, 2.930694, 0, 0.9058824, 1, 1,
0.066067, 1.375586, -0.4968055, 0, 0.8980392, 1, 1,
0.06844255, -0.7737925, 3.426716, 0, 0.8901961, 1, 1,
0.07267041, 0.5901832, 1.318506, 0, 0.8862745, 1, 1,
0.07427976, -0.4685819, 2.476892, 0, 0.8784314, 1, 1,
0.07657427, 0.1647535, -0.9561788, 0, 0.8745098, 1, 1,
0.07725223, -0.4667069, 3.427413, 0, 0.8666667, 1, 1,
0.07905021, -0.2292751, 2.45672, 0, 0.8627451, 1, 1,
0.08076618, 0.5681565, 0.5045046, 0, 0.854902, 1, 1,
0.08122203, -1.369242, 3.334721, 0, 0.8509804, 1, 1,
0.08199207, -0.9756112, 2.905248, 0, 0.8431373, 1, 1,
0.08406444, 0.3859464, -1.916232, 0, 0.8392157, 1, 1,
0.08706299, -0.2238066, 2.228951, 0, 0.8313726, 1, 1,
0.08811048, 0.5511169, 0.7739192, 0, 0.827451, 1, 1,
0.08981556, -2.129142, 4.304956, 0, 0.8196079, 1, 1,
0.0902594, -0.5354971, 4.38934, 0, 0.8156863, 1, 1,
0.09168763, -1.359578, 4.060993, 0, 0.8078431, 1, 1,
0.09289583, -1.721465, 1.388456, 0, 0.8039216, 1, 1,
0.0940951, 1.356232, -1.66395, 0, 0.7960784, 1, 1,
0.09501559, -0.9282924, 0.849212, 0, 0.7882353, 1, 1,
0.09650308, -1.051678, 3.111221, 0, 0.7843137, 1, 1,
0.09826231, 0.3591022, 1.42352, 0, 0.7764706, 1, 1,
0.1025148, 1.54348, -1.535121, 0, 0.772549, 1, 1,
0.1032706, 0.7178515, 0.007255766, 0, 0.7647059, 1, 1,
0.1148013, -0.1324037, 1.62858, 0, 0.7607843, 1, 1,
0.1161668, 0.4582421, -1.141079, 0, 0.7529412, 1, 1,
0.1167295, 0.5239716, 0.471981, 0, 0.7490196, 1, 1,
0.1194103, -0.6338968, 2.183481, 0, 0.7411765, 1, 1,
0.1204538, -0.6339044, 1.61022, 0, 0.7372549, 1, 1,
0.1226207, -0.1636211, 3.826337, 0, 0.7294118, 1, 1,
0.1230454, 0.3246871, -0.02042471, 0, 0.7254902, 1, 1,
0.1260376, -1.674759, 2.697335, 0, 0.7176471, 1, 1,
0.1265309, 2.2807, -1.313315, 0, 0.7137255, 1, 1,
0.1278255, 0.3042385, -0.5085692, 0, 0.7058824, 1, 1,
0.132057, 2.290722, -0.6688229, 0, 0.6980392, 1, 1,
0.1340585, 1.56947, -0.9112764, 0, 0.6941177, 1, 1,
0.1365354, 0.0244237, 1.404482, 0, 0.6862745, 1, 1,
0.1377548, -0.4389265, 2.930216, 0, 0.682353, 1, 1,
0.1387113, 1.060185, 0.2890155, 0, 0.6745098, 1, 1,
0.1474044, 0.5002939, -0.05438903, 0, 0.6705883, 1, 1,
0.1488307, 0.2623238, -1.469881, 0, 0.6627451, 1, 1,
0.1516736, 0.2185961, 0.3638631, 0, 0.6588235, 1, 1,
0.1520593, -0.5549022, 2.691198, 0, 0.6509804, 1, 1,
0.1532446, 0.1939038, 0.7966383, 0, 0.6470588, 1, 1,
0.1610015, -1.493559, 2.870413, 0, 0.6392157, 1, 1,
0.1647857, -0.2090865, 1.587744, 0, 0.6352941, 1, 1,
0.1653725, -0.609157, 1.754528, 0, 0.627451, 1, 1,
0.166059, 0.1519487, 1.848276, 0, 0.6235294, 1, 1,
0.1756117, 0.1337859, 0.2794191, 0, 0.6156863, 1, 1,
0.1763886, 0.307482, 0.8739945, 0, 0.6117647, 1, 1,
0.1800355, 1.301243, 0.3490168, 0, 0.6039216, 1, 1,
0.1800832, 0.5321278, 0.9678161, 0, 0.5960785, 1, 1,
0.185421, -1.990693, 3.574486, 0, 0.5921569, 1, 1,
0.188533, -0.2460556, 3.805, 0, 0.5843138, 1, 1,
0.1890301, -0.1586608, 1.999267, 0, 0.5803922, 1, 1,
0.1910692, -0.8233141, 1.635924, 0, 0.572549, 1, 1,
0.193519, -0.3414322, 2.875913, 0, 0.5686275, 1, 1,
0.195594, 0.2112592, -0.07500916, 0, 0.5607843, 1, 1,
0.1989759, 0.04452844, 0.6827629, 0, 0.5568628, 1, 1,
0.2011774, 1.782391, 0.4265684, 0, 0.5490196, 1, 1,
0.2035414, 0.4701961, -0.3272843, 0, 0.5450981, 1, 1,
0.2041442, -1.280791, 3.035449, 0, 0.5372549, 1, 1,
0.2044275, -0.8912911, 1.318386, 0, 0.5333334, 1, 1,
0.2076725, 0.6338208, 0.6834023, 0, 0.5254902, 1, 1,
0.2127407, 1.815096, 1.928643, 0, 0.5215687, 1, 1,
0.2145865, -0.4710594, 2.343969, 0, 0.5137255, 1, 1,
0.2188592, -0.5936662, 1.939908, 0, 0.509804, 1, 1,
0.2201833, 0.1060617, 2.489338, 0, 0.5019608, 1, 1,
0.2204023, -0.5653316, 1.679905, 0, 0.4941176, 1, 1,
0.220762, 0.3373618, 2.623895, 0, 0.4901961, 1, 1,
0.2208429, -1.194085, 1.449407, 0, 0.4823529, 1, 1,
0.224173, -1.195801, 2.258642, 0, 0.4784314, 1, 1,
0.2248448, -1.713083, 1.776748, 0, 0.4705882, 1, 1,
0.225703, 0.05184704, 1.98601, 0, 0.4666667, 1, 1,
0.2278635, -0.9440882, 0.9369982, 0, 0.4588235, 1, 1,
0.2282309, -0.8943677, 3.043352, 0, 0.454902, 1, 1,
0.2325451, -0.4104555, 2.546965, 0, 0.4470588, 1, 1,
0.2346496, -0.9029286, 2.832352, 0, 0.4431373, 1, 1,
0.2370305, -1.207438, 3.640968, 0, 0.4352941, 1, 1,
0.2421276, -0.4508581, 0.958245, 0, 0.4313726, 1, 1,
0.2437428, -1.507817, 3.622941, 0, 0.4235294, 1, 1,
0.2454773, -0.4351641, 2.579154, 0, 0.4196078, 1, 1,
0.247761, -0.4063591, 3.311532, 0, 0.4117647, 1, 1,
0.2484331, -0.2584979, 1.979409, 0, 0.4078431, 1, 1,
0.2501626, 0.6327336, -0.05234698, 0, 0.4, 1, 1,
0.2507535, -0.3743419, 2.086416, 0, 0.3921569, 1, 1,
0.2509513, -0.2927537, -0.3949082, 0, 0.3882353, 1, 1,
0.2530404, -0.5830466, 2.908621, 0, 0.3803922, 1, 1,
0.2532031, -0.1532273, 1.828136, 0, 0.3764706, 1, 1,
0.2555763, 1.426688, 0.9567378, 0, 0.3686275, 1, 1,
0.2608476, 1.000101, -0.3124842, 0, 0.3647059, 1, 1,
0.2630668, -2.892357, 2.66996, 0, 0.3568628, 1, 1,
0.2709017, 1.818539, 0.8588914, 0, 0.3529412, 1, 1,
0.2720438, -0.7673419, 3.603482, 0, 0.345098, 1, 1,
0.2764378, -0.3439013, 3.171443, 0, 0.3411765, 1, 1,
0.277307, 0.4904674, 0.4359988, 0, 0.3333333, 1, 1,
0.2804167, 0.3545206, 0.08615335, 0, 0.3294118, 1, 1,
0.2813062, -2.358518, 3.130237, 0, 0.3215686, 1, 1,
0.2820393, -1.25396, 1.695518, 0, 0.3176471, 1, 1,
0.2820484, 0.03690752, 2.088128, 0, 0.3098039, 1, 1,
0.2838897, 1.632476, 0.02258643, 0, 0.3058824, 1, 1,
0.2935255, -1.069645, 1.250574, 0, 0.2980392, 1, 1,
0.2978869, -0.3827558, 2.168267, 0, 0.2901961, 1, 1,
0.2988805, -0.7552179, 2.990175, 0, 0.2862745, 1, 1,
0.2991951, -0.4030808, 4.342841, 0, 0.2784314, 1, 1,
0.2995281, 1.677468, -0.7403324, 0, 0.2745098, 1, 1,
0.3015492, -0.2606893, 1.179717, 0, 0.2666667, 1, 1,
0.301562, 1.112735, -1.320894, 0, 0.2627451, 1, 1,
0.3127781, 0.2271059, -1.204925, 0, 0.254902, 1, 1,
0.313056, 0.5572717, -0.2274362, 0, 0.2509804, 1, 1,
0.3131752, -0.1218575, 2.658318, 0, 0.2431373, 1, 1,
0.3135876, 0.8347828, 0.04228886, 0, 0.2392157, 1, 1,
0.3164726, 1.315224, -0.6773291, 0, 0.2313726, 1, 1,
0.3209544, 0.2883624, 1.793026, 0, 0.227451, 1, 1,
0.3218113, -0.2365299, 2.175377, 0, 0.2196078, 1, 1,
0.3218486, 2.810168, -0.28985, 0, 0.2156863, 1, 1,
0.3222802, -1.810878, 3.244204, 0, 0.2078431, 1, 1,
0.3228467, 0.6205328, 1.074281, 0, 0.2039216, 1, 1,
0.3251941, -0.06960593, 3.053524, 0, 0.1960784, 1, 1,
0.3295959, 1.677269, -0.2337106, 0, 0.1882353, 1, 1,
0.3298414, 1.230895, -1.636981, 0, 0.1843137, 1, 1,
0.3325019, 0.312906, 0.09321853, 0, 0.1764706, 1, 1,
0.3379762, -0.3563639, 1.820808, 0, 0.172549, 1, 1,
0.341133, 0.9093085, 1.707721, 0, 0.1647059, 1, 1,
0.3434785, 0.9127849, 0.2446857, 0, 0.1607843, 1, 1,
0.3468339, 1.228762, -1.488612, 0, 0.1529412, 1, 1,
0.3488362, 0.1635974, 0.3497613, 0, 0.1490196, 1, 1,
0.3491465, -1.044644, 3.581125, 0, 0.1411765, 1, 1,
0.3533974, 0.6046946, -0.2549771, 0, 0.1372549, 1, 1,
0.3653912, 0.9154904, 2.401497, 0, 0.1294118, 1, 1,
0.3700912, -0.3568585, 3.818147, 0, 0.1254902, 1, 1,
0.3795758, 1.013888, -0.4667535, 0, 0.1176471, 1, 1,
0.3797772, -0.6688594, 5.084137, 0, 0.1137255, 1, 1,
0.3799811, 1.615733, 0.3827123, 0, 0.1058824, 1, 1,
0.3807273, 0.5419003, 1.789795, 0, 0.09803922, 1, 1,
0.3863992, 1.555232, 0.4841785, 0, 0.09411765, 1, 1,
0.3893991, -1.403844, 3.868458, 0, 0.08627451, 1, 1,
0.3896363, 0.2992197, 0.6685625, 0, 0.08235294, 1, 1,
0.3930429, 0.1945843, 1.554339, 0, 0.07450981, 1, 1,
0.394298, -0.5981219, 1.908283, 0, 0.07058824, 1, 1,
0.3967756, 0.898748, -0.1140387, 0, 0.0627451, 1, 1,
0.4021035, 1.516506, 0.4269709, 0, 0.05882353, 1, 1,
0.4031353, 2.424094, 0.1861256, 0, 0.05098039, 1, 1,
0.4052112, -0.2563304, -0.05200876, 0, 0.04705882, 1, 1,
0.4070095, 0.2009563, 0.4585162, 0, 0.03921569, 1, 1,
0.411406, -1.482692, 4.025141, 0, 0.03529412, 1, 1,
0.41391, 0.9230482, 0.639375, 0, 0.02745098, 1, 1,
0.4176143, -0.03785649, 0.8681256, 0, 0.02352941, 1, 1,
0.4179429, 1.457698, -0.6276004, 0, 0.01568628, 1, 1,
0.4250674, -0.8903007, 2.559134, 0, 0.01176471, 1, 1,
0.4257135, -0.881999, 2.451165, 0, 0.003921569, 1, 1,
0.4279905, 0.2919036, -1.940205, 0.003921569, 0, 1, 1,
0.4317091, 0.6098723, 3.181536, 0.007843138, 0, 1, 1,
0.436722, 0.8023663, 1.388407, 0.01568628, 0, 1, 1,
0.4465353, -1.859974, 2.472396, 0.01960784, 0, 1, 1,
0.4498315, -1.169584, 2.635648, 0.02745098, 0, 1, 1,
0.450753, -0.6736018, 1.117299, 0.03137255, 0, 1, 1,
0.4509521, -0.2259067, 2.454662, 0.03921569, 0, 1, 1,
0.4550758, -1.316898, 2.094213, 0.04313726, 0, 1, 1,
0.4551686, 2.356609, -0.1742188, 0.05098039, 0, 1, 1,
0.4646183, 0.2143803, 0.743578, 0.05490196, 0, 1, 1,
0.467752, -0.3885988, 1.672208, 0.0627451, 0, 1, 1,
0.4723869, 1.017803, 1.636372, 0.06666667, 0, 1, 1,
0.4736484, 0.7927952, -0.3498565, 0.07450981, 0, 1, 1,
0.4772754, 0.404581, 2.709392, 0.07843138, 0, 1, 1,
0.4778504, -1.284088, 0.4595756, 0.08627451, 0, 1, 1,
0.4787931, 0.08932516, 0.09620737, 0.09019608, 0, 1, 1,
0.4791857, -1.981634, 0.9354282, 0.09803922, 0, 1, 1,
0.4798414, 0.2638405, 2.012385, 0.1058824, 0, 1, 1,
0.4828317, 1.168203, 1.167359, 0.1098039, 0, 1, 1,
0.4874442, -0.630825, 3.803819, 0.1176471, 0, 1, 1,
0.4890428, 0.1180774, 1.475738, 0.1215686, 0, 1, 1,
0.4912347, -0.6301349, 4.515903, 0.1294118, 0, 1, 1,
0.4959793, 0.4926695, 2.054572, 0.1333333, 0, 1, 1,
0.4984041, -1.945482, 3.269869, 0.1411765, 0, 1, 1,
0.503558, -2.386278, 2.08327, 0.145098, 0, 1, 1,
0.5068498, -0.187994, 2.241765, 0.1529412, 0, 1, 1,
0.5132043, 0.9811071, 0.6847227, 0.1568628, 0, 1, 1,
0.5143676, 0.07887352, -0.5552056, 0.1647059, 0, 1, 1,
0.5159823, -1.022599, 1.879423, 0.1686275, 0, 1, 1,
0.5186057, -0.820195, 1.547442, 0.1764706, 0, 1, 1,
0.5194672, 0.2224509, 1.403634, 0.1803922, 0, 1, 1,
0.5204728, -1.448868, 2.802083, 0.1882353, 0, 1, 1,
0.5240494, -1.204016, 3.930078, 0.1921569, 0, 1, 1,
0.5280495, -0.427549, 2.281241, 0.2, 0, 1, 1,
0.5312532, -0.856912, 3.125431, 0.2078431, 0, 1, 1,
0.5340086, 1.389295, -0.2008777, 0.2117647, 0, 1, 1,
0.5340541, 0.8654076, -0.02967411, 0.2196078, 0, 1, 1,
0.5400488, -1.532705, 1.912779, 0.2235294, 0, 1, 1,
0.5429576, -1.911555, 0.8529233, 0.2313726, 0, 1, 1,
0.5459072, 1.307699, -2.088919, 0.2352941, 0, 1, 1,
0.5494098, 0.8357148, 0.2144479, 0.2431373, 0, 1, 1,
0.5497614, 1.601365, 0.4900447, 0.2470588, 0, 1, 1,
0.5505231, -0.2026529, 2.773823, 0.254902, 0, 1, 1,
0.5521826, -0.6314712, 2.432785, 0.2588235, 0, 1, 1,
0.5539868, 0.6808677, -0.5863427, 0.2666667, 0, 1, 1,
0.556434, -1.611747, 2.251985, 0.2705882, 0, 1, 1,
0.5575942, -1.072876, 4.021243, 0.2784314, 0, 1, 1,
0.5637293, -0.4920432, 1.676568, 0.282353, 0, 1, 1,
0.5672638, -0.9026885, 2.413483, 0.2901961, 0, 1, 1,
0.5705845, -0.9656347, 1.646656, 0.2941177, 0, 1, 1,
0.5706856, -0.8054335, 3.12183, 0.3019608, 0, 1, 1,
0.5713919, -1.025448, 3.214831, 0.3098039, 0, 1, 1,
0.5752495, 1.209108, -0.6211902, 0.3137255, 0, 1, 1,
0.5770393, 1.160423, 1.262822, 0.3215686, 0, 1, 1,
0.5795888, -1.49154, 3.165551, 0.3254902, 0, 1, 1,
0.5810027, 0.9892399, 1.394427, 0.3333333, 0, 1, 1,
0.5848523, 0.2367541, 1.565269, 0.3372549, 0, 1, 1,
0.5950787, 0.6546759, 1.689905, 0.345098, 0, 1, 1,
0.5964876, 0.689399, 0.965308, 0.3490196, 0, 1, 1,
0.5996705, 0.5256553, 1.952298, 0.3568628, 0, 1, 1,
0.6046584, -1.379758, 3.264969, 0.3607843, 0, 1, 1,
0.6062466, 1.176122, -0.01756935, 0.3686275, 0, 1, 1,
0.6072089, 1.60589, 1.100515, 0.372549, 0, 1, 1,
0.6082326, 0.6485795, 1.751922, 0.3803922, 0, 1, 1,
0.6086096, 0.8808545, 0.09568805, 0.3843137, 0, 1, 1,
0.6096749, -0.773392, 1.577908, 0.3921569, 0, 1, 1,
0.6111348, -0.1881042, 1.246184, 0.3960784, 0, 1, 1,
0.6114961, 0.1135346, 1.716997, 0.4039216, 0, 1, 1,
0.6125775, -0.07957259, 2.99474, 0.4117647, 0, 1, 1,
0.6133291, 1.588425, 0.600234, 0.4156863, 0, 1, 1,
0.6194016, 0.2413239, 1.856855, 0.4235294, 0, 1, 1,
0.628205, 0.7485183, 0.7197317, 0.427451, 0, 1, 1,
0.6307223, 1.058694, 0.6683291, 0.4352941, 0, 1, 1,
0.6315686, -0.5007919, 2.105603, 0.4392157, 0, 1, 1,
0.6400249, -0.5206723, 3.484392, 0.4470588, 0, 1, 1,
0.6411483, 0.7065922, 1.450481, 0.4509804, 0, 1, 1,
0.6432184, -1.020272, 2.998567, 0.4588235, 0, 1, 1,
0.6450372, -0.1296443, 3.040236, 0.4627451, 0, 1, 1,
0.6450945, -0.1725923, 1.342142, 0.4705882, 0, 1, 1,
0.6475545, -0.582007, 2.132763, 0.4745098, 0, 1, 1,
0.6500581, 0.4770068, 0.4860943, 0.4823529, 0, 1, 1,
0.6541326, 0.7158393, 1.380813, 0.4862745, 0, 1, 1,
0.6566535, -1.484284, 4.838827, 0.4941176, 0, 1, 1,
0.6651303, -0.4612301, 1.912097, 0.5019608, 0, 1, 1,
0.6655325, 1.473099, 1.195497, 0.5058824, 0, 1, 1,
0.6661818, -0.4152334, 2.758041, 0.5137255, 0, 1, 1,
0.6666114, -1.076712, 2.902196, 0.5176471, 0, 1, 1,
0.6679091, 0.6327851, 1.448421, 0.5254902, 0, 1, 1,
0.6691617, -0.4265094, 4.626637, 0.5294118, 0, 1, 1,
0.6782587, 0.09435948, 1.143554, 0.5372549, 0, 1, 1,
0.6801506, 0.6751123, 1.934966, 0.5411765, 0, 1, 1,
0.6895394, 0.5101779, 1.885182, 0.5490196, 0, 1, 1,
0.6934446, 2.856632, 0.8730683, 0.5529412, 0, 1, 1,
0.6965699, -2.595227, 3.434363, 0.5607843, 0, 1, 1,
0.6979155, 1.2657, -0.5042053, 0.5647059, 0, 1, 1,
0.699205, 0.4721362, 0.3519563, 0.572549, 0, 1, 1,
0.702238, 0.1187699, 0.572495, 0.5764706, 0, 1, 1,
0.7079999, -0.2477479, 1.910005, 0.5843138, 0, 1, 1,
0.7124032, -0.682893, 3.557313, 0.5882353, 0, 1, 1,
0.7126378, 0.5363061, 1.618942, 0.5960785, 0, 1, 1,
0.7243817, -1.12745, 3.050697, 0.6039216, 0, 1, 1,
0.7317096, 0.2440294, 2.567724, 0.6078432, 0, 1, 1,
0.7341352, -0.6567451, 2.06239, 0.6156863, 0, 1, 1,
0.7381381, 0.07325236, 2.277385, 0.6196079, 0, 1, 1,
0.7513594, -1.188819, 0.1641637, 0.627451, 0, 1, 1,
0.753135, -0.7657893, 2.885435, 0.6313726, 0, 1, 1,
0.7532749, 0.1610126, 0.5336329, 0.6392157, 0, 1, 1,
0.753861, -1.463575, 1.079238, 0.6431373, 0, 1, 1,
0.755971, -0.7752628, 1.060967, 0.6509804, 0, 1, 1,
0.7579733, 0.68018, -0.2754785, 0.654902, 0, 1, 1,
0.7679576, -0.1446885, 3.142414, 0.6627451, 0, 1, 1,
0.769706, -0.02948198, 1.614408, 0.6666667, 0, 1, 1,
0.7706314, -0.800441, 0.7245064, 0.6745098, 0, 1, 1,
0.7709584, -1.474927, 2.239296, 0.6784314, 0, 1, 1,
0.7726008, 0.4317556, 0.007972553, 0.6862745, 0, 1, 1,
0.7730766, -0.2817617, 2.488523, 0.6901961, 0, 1, 1,
0.7800811, -0.3947015, 3.64962, 0.6980392, 0, 1, 1,
0.7801874, 0.2122228, 0.7765259, 0.7058824, 0, 1, 1,
0.7810255, -1.113637, 2.350907, 0.7098039, 0, 1, 1,
0.7860735, 1.37654, 1.017141, 0.7176471, 0, 1, 1,
0.7904845, 0.4602201, 1.177905, 0.7215686, 0, 1, 1,
0.802294, 1.535946, 0.8404891, 0.7294118, 0, 1, 1,
0.8027606, -0.5407103, 2.002793, 0.7333333, 0, 1, 1,
0.8038889, -0.3851167, 3.095997, 0.7411765, 0, 1, 1,
0.8076618, 0.2900099, 2.626624, 0.7450981, 0, 1, 1,
0.8201362, 0.4743, 0.8745375, 0.7529412, 0, 1, 1,
0.8211783, -1.161783, 3.412579, 0.7568628, 0, 1, 1,
0.8256497, 0.3285507, 1.509478, 0.7647059, 0, 1, 1,
0.8265831, 0.2187413, 1.203806, 0.7686275, 0, 1, 1,
0.8286447, -1.989833, 0.9741903, 0.7764706, 0, 1, 1,
0.8288229, 1.122817, 0.6134906, 0.7803922, 0, 1, 1,
0.8298939, 2.071615, -1.049933, 0.7882353, 0, 1, 1,
0.8365551, -1.808476, 3.448076, 0.7921569, 0, 1, 1,
0.8415856, 1.147909, 1.921429, 0.8, 0, 1, 1,
0.8420579, -0.5413018, 3.075019, 0.8078431, 0, 1, 1,
0.8427671, 1.070455, 0.386919, 0.8117647, 0, 1, 1,
0.853512, 0.06281013, 3.130064, 0.8196079, 0, 1, 1,
0.8565195, -0.533704, 2.090099, 0.8235294, 0, 1, 1,
0.858161, -0.2239467, 2.228721, 0.8313726, 0, 1, 1,
0.860441, 0.5777147, 1.234574, 0.8352941, 0, 1, 1,
0.8678074, -0.01220459, 1.992569, 0.8431373, 0, 1, 1,
0.8734504, 0.8678627, 1.312823, 0.8470588, 0, 1, 1,
0.8783144, 0.1925345, 0.5989003, 0.854902, 0, 1, 1,
0.8788756, 0.09185819, 1.777718, 0.8588235, 0, 1, 1,
0.8810303, -0.9417092, 1.512467, 0.8666667, 0, 1, 1,
0.8854232, -1.26882, 2.780939, 0.8705882, 0, 1, 1,
0.8899951, -0.2696811, 2.053421, 0.8784314, 0, 1, 1,
0.8910652, 0.003001931, 2.166208, 0.8823529, 0, 1, 1,
0.8962215, -0.3273618, 0.1435666, 0.8901961, 0, 1, 1,
0.9011641, -0.8291344, 1.1917, 0.8941177, 0, 1, 1,
0.9013075, -0.3223924, 2.927985, 0.9019608, 0, 1, 1,
0.901549, 0.3524477, 1.627142, 0.9098039, 0, 1, 1,
0.9066831, -0.2276168, 2.004414, 0.9137255, 0, 1, 1,
0.9079885, 1.397449, -0.783816, 0.9215686, 0, 1, 1,
0.9082279, -0.3967344, 3.667469, 0.9254902, 0, 1, 1,
0.912611, 0.4496034, 1.841744, 0.9333333, 0, 1, 1,
0.9128926, 0.01603879, 2.079159, 0.9372549, 0, 1, 1,
0.9148386, 0.7611163, 0.6897139, 0.945098, 0, 1, 1,
0.9179525, -1.534879, 0.7280725, 0.9490196, 0, 1, 1,
0.9265692, 1.036088, 0.8432507, 0.9568627, 0, 1, 1,
0.9279764, -0.8693449, 2.214556, 0.9607843, 0, 1, 1,
0.9380414, 0.6682912, 1.536615, 0.9686275, 0, 1, 1,
0.9390545, 2.088283, 0.1250022, 0.972549, 0, 1, 1,
0.9410841, 0.7656631, -0.1033978, 0.9803922, 0, 1, 1,
0.9460473, 0.3461036, 1.826606, 0.9843137, 0, 1, 1,
0.9469762, 0.3749753, 0.1342087, 0.9921569, 0, 1, 1,
0.9559656, -1.024648, 1.666171, 0.9960784, 0, 1, 1,
0.9626697, 0.5739976, 0.9825542, 1, 0, 0.9960784, 1,
0.9631205, 0.2868731, 2.150885, 1, 0, 0.9882353, 1,
0.9703204, -0.9105527, 3.006134, 1, 0, 0.9843137, 1,
0.9815195, 0.3714015, 1.580759, 1, 0, 0.9764706, 1,
0.9844638, 2.626531, 1.880904, 1, 0, 0.972549, 1,
0.9885603, 1.20153, 0.6196367, 1, 0, 0.9647059, 1,
0.9886807, 0.8819353, -0.9096287, 1, 0, 0.9607843, 1,
0.9970091, 1.203992, 0.6892324, 1, 0, 0.9529412, 1,
1.004262, 0.5932672, 2.384179, 1, 0, 0.9490196, 1,
1.005067, -0.3927417, 1.839636, 1, 0, 0.9411765, 1,
1.014291, 0.09999958, 1.276082, 1, 0, 0.9372549, 1,
1.014948, -1.043375, 2.644374, 1, 0, 0.9294118, 1,
1.018193, 2.072215, 1.540211, 1, 0, 0.9254902, 1,
1.020482, -1.435409, 2.866301, 1, 0, 0.9176471, 1,
1.023532, -0.7801483, 2.348418, 1, 0, 0.9137255, 1,
1.026674, 0.03990475, 1.412967, 1, 0, 0.9058824, 1,
1.027311, 0.07283987, 2.957207, 1, 0, 0.9019608, 1,
1.031775, 0.9342982, 0.5464963, 1, 0, 0.8941177, 1,
1.032102, -0.8609159, 2.599585, 1, 0, 0.8862745, 1,
1.03697, 0.4261961, 0.6437894, 1, 0, 0.8823529, 1,
1.041504, -1.311659, 1.620922, 1, 0, 0.8745098, 1,
1.044453, -1.262521, 2.80363, 1, 0, 0.8705882, 1,
1.049689, -0.233063, 1.702561, 1, 0, 0.8627451, 1,
1.061437, -0.439967, 0.4321704, 1, 0, 0.8588235, 1,
1.065632, 0.5115231, 1.734315, 1, 0, 0.8509804, 1,
1.066857, -0.3134196, 0.04147377, 1, 0, 0.8470588, 1,
1.070809, 0.5315669, 1.041598, 1, 0, 0.8392157, 1,
1.072088, -0.5482276, 3.700236, 1, 0, 0.8352941, 1,
1.076457, -0.1223673, 3.364635, 1, 0, 0.827451, 1,
1.081712, 1.343342, -0.8686002, 1, 0, 0.8235294, 1,
1.087653, 0.8798246, 0.5736403, 1, 0, 0.8156863, 1,
1.08875, -0.7481412, 1.39665, 1, 0, 0.8117647, 1,
1.089364, -1.372387, 1.306068, 1, 0, 0.8039216, 1,
1.112387, -2.685307, 4.132537, 1, 0, 0.7960784, 1,
1.114117, 0.5788119, 1.820859, 1, 0, 0.7921569, 1,
1.115241, 0.1206881, 0.211991, 1, 0, 0.7843137, 1,
1.117693, -1.428507, 0.9741392, 1, 0, 0.7803922, 1,
1.124808, -0.3080256, -0.09143072, 1, 0, 0.772549, 1,
1.126877, 0.3176576, 1.783375, 1, 0, 0.7686275, 1,
1.131758, -0.7290221, 0.3798845, 1, 0, 0.7607843, 1,
1.131838, 1.947961, 0.3059835, 1, 0, 0.7568628, 1,
1.136782, -0.3536755, 1.840981, 1, 0, 0.7490196, 1,
1.140611, -1.265177, 3.480317, 1, 0, 0.7450981, 1,
1.144092, 0.818131, 2.393674, 1, 0, 0.7372549, 1,
1.146434, -1.025231, 1.694457, 1, 0, 0.7333333, 1,
1.148627, -0.5430174, 2.351484, 1, 0, 0.7254902, 1,
1.155934, -0.5695772, 3.201131, 1, 0, 0.7215686, 1,
1.163136, -0.561236, 1.893768, 1, 0, 0.7137255, 1,
1.166348, 0.7309811, 0.1486213, 1, 0, 0.7098039, 1,
1.17583, -0.1143062, 0.6937163, 1, 0, 0.7019608, 1,
1.179432, -1.17509, 3.976019, 1, 0, 0.6941177, 1,
1.181057, 0.8305619, 2.266768, 1, 0, 0.6901961, 1,
1.181919, 1.969356, 1.699957, 1, 0, 0.682353, 1,
1.184168, 0.6936034, 1.649016, 1, 0, 0.6784314, 1,
1.191258, 0.9004536, 2.539983, 1, 0, 0.6705883, 1,
1.196776, 0.135205, 1.682992, 1, 0, 0.6666667, 1,
1.209614, 1.633391, 1.685645, 1, 0, 0.6588235, 1,
1.215614, -2.375073, 2.380944, 1, 0, 0.654902, 1,
1.21998, 1.588821, -0.1087667, 1, 0, 0.6470588, 1,
1.223073, 0.9016824, 0.378721, 1, 0, 0.6431373, 1,
1.227327, -0.6989232, 3.130767, 1, 0, 0.6352941, 1,
1.227619, 0.4361734, 1.135546, 1, 0, 0.6313726, 1,
1.230407, 0.4181173, 1.8221, 1, 0, 0.6235294, 1,
1.234631, 0.830985, 1.346268, 1, 0, 0.6196079, 1,
1.238739, -0.5253481, 1.947025, 1, 0, 0.6117647, 1,
1.239174, -1.955757, 1.89176, 1, 0, 0.6078432, 1,
1.243577, -0.5369469, 2.582272, 1, 0, 0.6, 1,
1.249532, -0.22573, 3.827616, 1, 0, 0.5921569, 1,
1.251707, -0.1886741, 1.908981, 1, 0, 0.5882353, 1,
1.254807, 0.3458289, 2.214554, 1, 0, 0.5803922, 1,
1.255436, -1.208525, 1.654025, 1, 0, 0.5764706, 1,
1.25705, 0.9840555, 1.205047, 1, 0, 0.5686275, 1,
1.263564, -0.9063848, 2.435819, 1, 0, 0.5647059, 1,
1.270169, -0.1749415, -0.2999036, 1, 0, 0.5568628, 1,
1.288823, 0.9363717, 1.441456, 1, 0, 0.5529412, 1,
1.293304, 1.419636, 0.7863331, 1, 0, 0.5450981, 1,
1.299778, -0.993752, 1.776477, 1, 0, 0.5411765, 1,
1.30627, 0.8894871, 0.9093549, 1, 0, 0.5333334, 1,
1.308921, -0.09897912, 0.7428266, 1, 0, 0.5294118, 1,
1.309656, -0.5649725, 1.631684, 1, 0, 0.5215687, 1,
1.315662, 1.651721, 2.509882, 1, 0, 0.5176471, 1,
1.319111, 1.232256, 0.885541, 1, 0, 0.509804, 1,
1.326984, 0.5676487, 2.512347, 1, 0, 0.5058824, 1,
1.327905, -0.3478694, 1.130685, 1, 0, 0.4980392, 1,
1.32946, -0.2916858, 2.904419, 1, 0, 0.4901961, 1,
1.340393, -1.218031, 1.648788, 1, 0, 0.4862745, 1,
1.346918, 0.07587691, 0.4542103, 1, 0, 0.4784314, 1,
1.351619, 0.4315369, 0.6260087, 1, 0, 0.4745098, 1,
1.359568, 0.9794232, 0.3079537, 1, 0, 0.4666667, 1,
1.382984, 0.2845109, 1.141561, 1, 0, 0.4627451, 1,
1.392554, -0.1502761, 0.6620047, 1, 0, 0.454902, 1,
1.395641, -0.4695294, 2.270686, 1, 0, 0.4509804, 1,
1.409674, 0.3616837, -0.1733901, 1, 0, 0.4431373, 1,
1.416421, 1.324152, 0.05808104, 1, 0, 0.4392157, 1,
1.431591, 0.2518011, -0.3450362, 1, 0, 0.4313726, 1,
1.432022, 0.3365775, 0.6681063, 1, 0, 0.427451, 1,
1.442882, -1.30991, 1.85736, 1, 0, 0.4196078, 1,
1.446571, -1.159361, 2.983953, 1, 0, 0.4156863, 1,
1.447966, 0.9914587, 0.6379182, 1, 0, 0.4078431, 1,
1.449382, 2.458626, 0.1112537, 1, 0, 0.4039216, 1,
1.460802, 0.9798378, -0.2796655, 1, 0, 0.3960784, 1,
1.482899, 0.0219108, 0.4671051, 1, 0, 0.3882353, 1,
1.540029, 0.6313084, 1.588342, 1, 0, 0.3843137, 1,
1.543962, 0.3311697, 2.09165, 1, 0, 0.3764706, 1,
1.547125, -0.2577334, 2.614905, 1, 0, 0.372549, 1,
1.55175, 1.012575, 0.8683571, 1, 0, 0.3647059, 1,
1.554695, 0.6295018, 0.8162339, 1, 0, 0.3607843, 1,
1.56177, -0.9978592, 3.320132, 1, 0, 0.3529412, 1,
1.564178, 2.550199, -0.7211445, 1, 0, 0.3490196, 1,
1.580226, -0.8686316, 0.6959908, 1, 0, 0.3411765, 1,
1.591523, 1.631869, -0.3931661, 1, 0, 0.3372549, 1,
1.593512, 0.3200233, 2.189054, 1, 0, 0.3294118, 1,
1.595573, 0.1380084, 2.369387, 1, 0, 0.3254902, 1,
1.597663, -0.7678441, 1.58536, 1, 0, 0.3176471, 1,
1.629706, 0.1477615, 1.611777, 1, 0, 0.3137255, 1,
1.631686, 1.365262, 2.065802, 1, 0, 0.3058824, 1,
1.64149, 1.243289, -0.1086827, 1, 0, 0.2980392, 1,
1.642996, -1.463722, 2.95268, 1, 0, 0.2941177, 1,
1.668181, 0.8701661, 1.619643, 1, 0, 0.2862745, 1,
1.671935, -1.305078, 1.621961, 1, 0, 0.282353, 1,
1.700319, 0.1884818, 2.344991, 1, 0, 0.2745098, 1,
1.701174, 1.45065, -0.2515657, 1, 0, 0.2705882, 1,
1.741895, -0.2536676, 3.192064, 1, 0, 0.2627451, 1,
1.757187, 1.096177, 1.999238, 1, 0, 0.2588235, 1,
1.766592, -0.1569465, 2.005873, 1, 0, 0.2509804, 1,
1.775927, -1.327733, 1.35859, 1, 0, 0.2470588, 1,
1.791496, -1.15375, 2.651944, 1, 0, 0.2392157, 1,
1.797311, -0.2299137, 1.191585, 1, 0, 0.2352941, 1,
1.797402, -1.206688, 1.335634, 1, 0, 0.227451, 1,
1.798294, -0.009059557, 3.259196, 1, 0, 0.2235294, 1,
1.798379, -0.6043326, -0.04462975, 1, 0, 0.2156863, 1,
1.801105, -0.4793935, 0.02283767, 1, 0, 0.2117647, 1,
1.809608, 0.4898646, -0.4669087, 1, 0, 0.2039216, 1,
1.819221, 1.04156, 1.015015, 1, 0, 0.1960784, 1,
1.827653, 0.7057238, 0.3531666, 1, 0, 0.1921569, 1,
1.839398, -0.8697031, 3.150523, 1, 0, 0.1843137, 1,
1.844357, -0.9158849, 1.109009, 1, 0, 0.1803922, 1,
1.844909, 0.2373559, 1.829178, 1, 0, 0.172549, 1,
1.849925, -0.8302029, 1.136783, 1, 0, 0.1686275, 1,
1.850933, 1.198262, 2.549853, 1, 0, 0.1607843, 1,
1.883328, 0.0969226, 3.005408, 1, 0, 0.1568628, 1,
1.889675, 0.01257024, 3.562804, 1, 0, 0.1490196, 1,
1.911648, 1.523962, 1.224281, 1, 0, 0.145098, 1,
1.915661, -1.089498, 2.613353, 1, 0, 0.1372549, 1,
1.918525, 1.735904, 0.1325671, 1, 0, 0.1333333, 1,
1.931997, -0.2781972, 1.225959, 1, 0, 0.1254902, 1,
1.937565, -1.050717, 2.525838, 1, 0, 0.1215686, 1,
2.014116, 0.9487939, 0.4335632, 1, 0, 0.1137255, 1,
2.015518, -1.180276, 1.917473, 1, 0, 0.1098039, 1,
2.016595, 0.4320044, 0.4981737, 1, 0, 0.1019608, 1,
2.03322, -0.08189056, 0.2686495, 1, 0, 0.09411765, 1,
2.035274, 0.8213408, 1.825789, 1, 0, 0.09019608, 1,
2.143329, -1.009784, 1.798073, 1, 0, 0.08235294, 1,
2.188006, -0.3856675, 1.477638, 1, 0, 0.07843138, 1,
2.198939, 1.28562, 0.22309, 1, 0, 0.07058824, 1,
2.235806, -0.2345162, 2.392898, 1, 0, 0.06666667, 1,
2.298975, 0.9346967, 2.851138, 1, 0, 0.05882353, 1,
2.377703, 0.2574678, 1.075127, 1, 0, 0.05490196, 1,
2.545788, -2.811072, 1.982657, 1, 0, 0.04705882, 1,
2.549796, 0.1828078, 2.235357, 1, 0, 0.04313726, 1,
2.661964, -0.4764007, 2.004266, 1, 0, 0.03529412, 1,
2.70593, 0.1247244, 2.750481, 1, 0, 0.03137255, 1,
2.81886, -0.9056594, 3.872487, 1, 0, 0.02352941, 1,
2.86562, 0.790716, 2.353659, 1, 0, 0.01960784, 1,
3.074573, 0.6472425, 1.501603, 1, 0, 0.01176471, 1,
3.600373, 0.1934675, 0.7061519, 1, 0, 0.007843138, 1
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
0.2518468, -3.976361, -7.727345, 0, -0.5, 0.5, 0.5,
0.2518468, -3.976361, -7.727345, 1, -0.5, 0.5, 0.5,
0.2518468, -3.976361, -7.727345, 1, 1.5, 0.5, 0.5,
0.2518468, -3.976361, -7.727345, 0, 1.5, 0.5, 0.5
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
-4.23183, 0.305294, -7.727345, 0, -0.5, 0.5, 0.5,
-4.23183, 0.305294, -7.727345, 1, -0.5, 0.5, 0.5,
-4.23183, 0.305294, -7.727345, 1, 1.5, 0.5, 0.5,
-4.23183, 0.305294, -7.727345, 0, 1.5, 0.5, 0.5
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
-4.23183, -3.976361, -0.304332, 0, -0.5, 0.5, 0.5,
-4.23183, -3.976361, -0.304332, 1, -0.5, 0.5, 0.5,
-4.23183, -3.976361, -0.304332, 1, 1.5, 0.5, 0.5,
-4.23183, -3.976361, -0.304332, 0, 1.5, 0.5, 0.5
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
-3, -2.988287, -6.014341,
3, -2.988287, -6.014341,
-3, -2.988287, -6.014341,
-3, -3.152966, -6.299842,
-2, -2.988287, -6.014341,
-2, -3.152966, -6.299842,
-1, -2.988287, -6.014341,
-1, -3.152966, -6.299842,
0, -2.988287, -6.014341,
0, -3.152966, -6.299842,
1, -2.988287, -6.014341,
1, -3.152966, -6.299842,
2, -2.988287, -6.014341,
2, -3.152966, -6.299842,
3, -2.988287, -6.014341,
3, -3.152966, -6.299842
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
-3, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
-3, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
-3, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
-3, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
-2, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
-2, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
-2, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
-2, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
-1, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
-1, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
-1, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
-1, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
0, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
0, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
0, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
0, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
1, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
1, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
1, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
1, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
2, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
2, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
2, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
2, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5,
3, -3.482324, -6.870843, 0, -0.5, 0.5, 0.5,
3, -3.482324, -6.870843, 1, -0.5, 0.5, 0.5,
3, -3.482324, -6.870843, 1, 1.5, 0.5, 0.5,
3, -3.482324, -6.870843, 0, 1.5, 0.5, 0.5
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
-3.197135, -2, -6.014341,
-3.197135, 3, -6.014341,
-3.197135, -2, -6.014341,
-3.369584, -2, -6.299842,
-3.197135, -1, -6.014341,
-3.369584, -1, -6.299842,
-3.197135, 0, -6.014341,
-3.369584, 0, -6.299842,
-3.197135, 1, -6.014341,
-3.369584, 1, -6.299842,
-3.197135, 2, -6.014341,
-3.369584, 2, -6.299842,
-3.197135, 3, -6.014341,
-3.369584, 3, -6.299842
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
-3.714482, -2, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, -2, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, -2, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, -2, -6.870843, 0, 1.5, 0.5, 0.5,
-3.714482, -1, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, -1, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, -1, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, -1, -6.870843, 0, 1.5, 0.5, 0.5,
-3.714482, 0, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, 0, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, 0, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, 0, -6.870843, 0, 1.5, 0.5, 0.5,
-3.714482, 1, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, 1, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, 1, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, 1, -6.870843, 0, 1.5, 0.5, 0.5,
-3.714482, 2, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, 2, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, 2, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, 2, -6.870843, 0, 1.5, 0.5, 0.5,
-3.714482, 3, -6.870843, 0, -0.5, 0.5, 0.5,
-3.714482, 3, -6.870843, 1, -0.5, 0.5, 0.5,
-3.714482, 3, -6.870843, 1, 1.5, 0.5, 0.5,
-3.714482, 3, -6.870843, 0, 1.5, 0.5, 0.5
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
-3.197135, -2.988287, -4,
-3.197135, -2.988287, 4,
-3.197135, -2.988287, -4,
-3.369584, -3.152966, -4,
-3.197135, -2.988287, -2,
-3.369584, -3.152966, -2,
-3.197135, -2.988287, 0,
-3.369584, -3.152966, 0,
-3.197135, -2.988287, 2,
-3.369584, -3.152966, 2,
-3.197135, -2.988287, 4,
-3.369584, -3.152966, 4
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
-3.714482, -3.482324, -4, 0, -0.5, 0.5, 0.5,
-3.714482, -3.482324, -4, 1, -0.5, 0.5, 0.5,
-3.714482, -3.482324, -4, 1, 1.5, 0.5, 0.5,
-3.714482, -3.482324, -4, 0, 1.5, 0.5, 0.5,
-3.714482, -3.482324, -2, 0, -0.5, 0.5, 0.5,
-3.714482, -3.482324, -2, 1, -0.5, 0.5, 0.5,
-3.714482, -3.482324, -2, 1, 1.5, 0.5, 0.5,
-3.714482, -3.482324, -2, 0, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 0, 0, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 0, 1, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 0, 1, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 0, 0, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 2, 0, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 2, 1, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 2, 1, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 2, 0, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 4, 0, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 4, 1, -0.5, 0.5, 0.5,
-3.714482, -3.482324, 4, 1, 1.5, 0.5, 0.5,
-3.714482, -3.482324, 4, 0, 1.5, 0.5, 0.5
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
-3.197135, -2.988287, -6.014341,
-3.197135, 3.598875, -6.014341,
-3.197135, -2.988287, 5.405677,
-3.197135, 3.598875, 5.405677,
-3.197135, -2.988287, -6.014341,
-3.197135, -2.988287, 5.405677,
-3.197135, 3.598875, -6.014341,
-3.197135, 3.598875, 5.405677,
-3.197135, -2.988287, -6.014341,
3.700829, -2.988287, -6.014341,
-3.197135, -2.988287, 5.405677,
3.700829, -2.988287, 5.405677,
-3.197135, 3.598875, -6.014341,
3.700829, 3.598875, -6.014341,
-3.197135, 3.598875, 5.405677,
3.700829, 3.598875, 5.405677,
3.700829, -2.988287, -6.014341,
3.700829, 3.598875, -6.014341,
3.700829, -2.988287, 5.405677,
3.700829, 3.598875, 5.405677,
3.700829, -2.988287, -6.014341,
3.700829, -2.988287, 5.405677,
3.700829, 3.598875, -6.014341,
3.700829, 3.598875, 5.405677
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
var radius = 7.945183;
var distance = 35.34901;
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
mvMatrix.translate( -0.2518468, -0.305294, 0.304332 );
mvMatrix.scale( 1.245366, 1.304126, 0.7522306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34901);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-(2-pentenyl)-2-cyc<-read.table("3-(2-pentenyl)-2-cyc.xyz")
```

```
## Error in read.table("3-(2-pentenyl)-2-cyc.xyz"): no lines available in input
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
-3.096679, 1.115742, 0.1328713, 0, 0, 1, 1, 1,
-2.935426, 0.2216513, -1.456645, 1, 0, 0, 1, 1,
-2.601522, 0.2350153, -1.091176, 1, 0, 0, 1, 1,
-2.584645, -0.3081627, -1.744213, 1, 0, 0, 1, 1,
-2.498091, 0.6713299, -1.588308, 1, 0, 0, 1, 1,
-2.376719, 0.009610832, -1.053237, 1, 0, 0, 1, 1,
-2.375004, 1.09993, -1.855637, 0, 0, 0, 1, 1,
-2.240983, -1.2981, 0.421323, 0, 0, 0, 1, 1,
-2.171512, -0.06430179, -1.459567, 0, 0, 0, 1, 1,
-2.165488, 1.125049, -1.873411, 0, 0, 0, 1, 1,
-2.162321, 0.8683008, -1.573303, 0, 0, 0, 1, 1,
-2.143703, -0.1016272, -0.4842061, 0, 0, 0, 1, 1,
-2.129366, -1.364201, -1.263657, 0, 0, 0, 1, 1,
-2.099661, 1.247388, -2.599962, 1, 1, 1, 1, 1,
-2.083555, -0.5041685, -1.893518, 1, 1, 1, 1, 1,
-2.07567, -0.1986435, -2.357431, 1, 1, 1, 1, 1,
-2.07008, -1.288806, -2.23608, 1, 1, 1, 1, 1,
-2.068833, -0.3480733, -1.904584, 1, 1, 1, 1, 1,
-2.026927, 0.7061294, -1.565901, 1, 1, 1, 1, 1,
-2.021283, 0.3544738, -0.9382365, 1, 1, 1, 1, 1,
-2.016707, 0.615198, -1.13043, 1, 1, 1, 1, 1,
-2.003147, 0.547489, -2.159822, 1, 1, 1, 1, 1,
-1.998071, 0.09600148, -0.08849763, 1, 1, 1, 1, 1,
-1.986155, -0.5198829, -2.196554, 1, 1, 1, 1, 1,
-1.984372, -1.456483, -3.569356, 1, 1, 1, 1, 1,
-1.978315, 0.591435, -2.298715, 1, 1, 1, 1, 1,
-1.967262, 0.4503485, -0.7452976, 1, 1, 1, 1, 1,
-1.944924, -0.8337734, -2.2363, 1, 1, 1, 1, 1,
-1.936646, -0.7371095, -1.407086, 0, 0, 1, 1, 1,
-1.912953, -0.02096956, 0.3198678, 1, 0, 0, 1, 1,
-1.898432, -0.3884811, -1.76501, 1, 0, 0, 1, 1,
-1.888531, 1.342941, -1.831912, 1, 0, 0, 1, 1,
-1.885867, -1.236548, -1.382108, 1, 0, 0, 1, 1,
-1.863432, -0.4097792, -0.7574868, 1, 0, 0, 1, 1,
-1.852687, -0.4411553, -1.982951, 0, 0, 0, 1, 1,
-1.844479, -0.7414861, -1.416697, 0, 0, 0, 1, 1,
-1.826673, -0.7878625, -1.908364, 0, 0, 0, 1, 1,
-1.821882, -0.9981656, -4.416503, 0, 0, 0, 1, 1,
-1.775927, 0.5526765, -0.1237926, 0, 0, 0, 1, 1,
-1.767583, 0.5249397, -0.4881897, 0, 0, 0, 1, 1,
-1.762351, 0.5799476, -0.629402, 0, 0, 0, 1, 1,
-1.762309, 0.1383753, -2.767495, 1, 1, 1, 1, 1,
-1.750269, -0.08303845, -1.441382, 1, 1, 1, 1, 1,
-1.721102, -0.6576466, -2.992416, 1, 1, 1, 1, 1,
-1.720634, 1.002412, -2.051223, 1, 1, 1, 1, 1,
-1.691799, 1.435489, -1.729631, 1, 1, 1, 1, 1,
-1.685638, 1.05047, -0.523715, 1, 1, 1, 1, 1,
-1.678417, -0.5084569, -1.786293, 1, 1, 1, 1, 1,
-1.672762, 0.6731408, -1.761953, 1, 1, 1, 1, 1,
-1.664745, -0.7999063, -1.2466, 1, 1, 1, 1, 1,
-1.652392, -0.9323644, -3.330547, 1, 1, 1, 1, 1,
-1.630792, 0.2056782, -1.783404, 1, 1, 1, 1, 1,
-1.599083, -1.520393, -1.367862, 1, 1, 1, 1, 1,
-1.587481, -0.1616627, -0.3520856, 1, 1, 1, 1, 1,
-1.576191, 0.2116117, -0.5031424, 1, 1, 1, 1, 1,
-1.56331, 0.1978368, -0.9570961, 1, 1, 1, 1, 1,
-1.553488, -0.9340056, -4.050967, 0, 0, 1, 1, 1,
-1.548969, -1.555914, -3.129135, 1, 0, 0, 1, 1,
-1.542519, -1.98176, -2.997785, 1, 0, 0, 1, 1,
-1.540559, -1.870034, -2.456878, 1, 0, 0, 1, 1,
-1.538304, 0.7519841, 0.4881655, 1, 0, 0, 1, 1,
-1.53466, -1.627968, -1.992395, 1, 0, 0, 1, 1,
-1.522702, -2.035078, -2.030105, 0, 0, 0, 1, 1,
-1.5145, -0.441796, -1.193752, 0, 0, 0, 1, 1,
-1.512747, 0.5929619, -1.443185, 0, 0, 0, 1, 1,
-1.491847, -0.4602061, -1.480522, 0, 0, 0, 1, 1,
-1.481878, 0.5316778, -1.02436, 0, 0, 0, 1, 1,
-1.47947, 0.3455592, -2.491128, 0, 0, 0, 1, 1,
-1.47829, 2.731524, -1.900583, 0, 0, 0, 1, 1,
-1.475909, -0.623742, -2.523822, 1, 1, 1, 1, 1,
-1.466246, -0.6472419, -2.034016, 1, 1, 1, 1, 1,
-1.452811, 0.3833175, -0.0913285, 1, 1, 1, 1, 1,
-1.44976, 0.2433562, -1.772785, 1, 1, 1, 1, 1,
-1.44902, 0.2045157, -0.8188245, 1, 1, 1, 1, 1,
-1.434416, -0.1860908, -0.914932, 1, 1, 1, 1, 1,
-1.429222, 0.2456168, -1.691486, 1, 1, 1, 1, 1,
-1.424684, 0.8849105, -1.00288, 1, 1, 1, 1, 1,
-1.416512, 0.07629345, -1.531179, 1, 1, 1, 1, 1,
-1.413192, 0.3184322, -0.5011228, 1, 1, 1, 1, 1,
-1.407297, -0.3062301, -1.847608, 1, 1, 1, 1, 1,
-1.404544, 0.1173267, -0.9753867, 1, 1, 1, 1, 1,
-1.39891, -0.5247143, -1.592339, 1, 1, 1, 1, 1,
-1.398761, 0.08966845, 0.4175186, 1, 1, 1, 1, 1,
-1.394274, 0.6292614, -0.8364511, 1, 1, 1, 1, 1,
-1.380485, -0.7289345, -2.350239, 0, 0, 1, 1, 1,
-1.37947, 1.261759, 0.2542178, 1, 0, 0, 1, 1,
-1.365242, 1.545528, -0.1545644, 1, 0, 0, 1, 1,
-1.362726, 1.264254, 0.1595794, 1, 0, 0, 1, 1,
-1.36085, -0.9459035, -2.826193, 1, 0, 0, 1, 1,
-1.357204, 1.271135, 0.8196104, 1, 0, 0, 1, 1,
-1.348189, 1.227018, -1.93882, 0, 0, 0, 1, 1,
-1.347443, -1.352033, -2.522772, 0, 0, 0, 1, 1,
-1.345916, -0.5069754, -2.985648, 0, 0, 0, 1, 1,
-1.342186, -1.127413, -2.109257, 0, 0, 0, 1, 1,
-1.340541, 0.7267303, -0.1150384, 0, 0, 0, 1, 1,
-1.336231, -0.1431989, 0.573456, 0, 0, 0, 1, 1,
-1.322962, -0.069324, -1.63763, 0, 0, 0, 1, 1,
-1.313924, 0.007203557, -0.1096065, 1, 1, 1, 1, 1,
-1.312307, 0.7669039, -0.4582354, 1, 1, 1, 1, 1,
-1.310992, 0.4685473, -0.8943358, 1, 1, 1, 1, 1,
-1.304623, -0.2363016, -2.949777, 1, 1, 1, 1, 1,
-1.303543, -0.3076212, -2.10829, 1, 1, 1, 1, 1,
-1.302517, 0.683733, -2.151551, 1, 1, 1, 1, 1,
-1.291641, -2.06509, -2.556035, 1, 1, 1, 1, 1,
-1.286806, 0.9122041, 0.08044686, 1, 1, 1, 1, 1,
-1.286138, -1.295839, -2.437972, 1, 1, 1, 1, 1,
-1.281075, -0.2262957, -0.8186259, 1, 1, 1, 1, 1,
-1.260845, -0.3459022, -3.998518, 1, 1, 1, 1, 1,
-1.260317, -1.334749, -1.086568, 1, 1, 1, 1, 1,
-1.251804, 0.7146557, -1.757379, 1, 1, 1, 1, 1,
-1.250162, -0.5106598, -1.132601, 1, 1, 1, 1, 1,
-1.249786, 0.1956315, -2.980615, 1, 1, 1, 1, 1,
-1.248232, -0.4601261, -1.709659, 0, 0, 1, 1, 1,
-1.247252, 1.492845, -2.265772, 1, 0, 0, 1, 1,
-1.245023, 0.1362531, -2.456913, 1, 0, 0, 1, 1,
-1.236875, -1.558426, -2.352134, 1, 0, 0, 1, 1,
-1.232184, -0.2093906, -1.394244, 1, 0, 0, 1, 1,
-1.226483, 1.619048, -2.456432, 1, 0, 0, 1, 1,
-1.226225, 2.760913, -2.181292, 0, 0, 0, 1, 1,
-1.222794, 0.2728252, -1.261818, 0, 0, 0, 1, 1,
-1.216292, -0.2645754, -1.353009, 0, 0, 0, 1, 1,
-1.212844, 0.3135784, -0.4562701, 0, 0, 0, 1, 1,
-1.211085, 0.2922127, -2.427507, 0, 0, 0, 1, 1,
-1.210281, 0.6745463, -1.356576, 0, 0, 0, 1, 1,
-1.202635, -2.113597, -3.421561, 0, 0, 0, 1, 1,
-1.20066, -1.092984, -3.833717, 1, 1, 1, 1, 1,
-1.191904, 1.123862, -1.145676, 1, 1, 1, 1, 1,
-1.191569, -0.02349622, -1.622513, 1, 1, 1, 1, 1,
-1.179505, -0.5679147, -0.4726729, 1, 1, 1, 1, 1,
-1.177927, -0.3393841, -0.2882981, 1, 1, 1, 1, 1,
-1.173944, -0.2590118, -2.2445, 1, 1, 1, 1, 1,
-1.170226, -0.3338558, -0.6490734, 1, 1, 1, 1, 1,
-1.168012, 1.412568, -1.66136, 1, 1, 1, 1, 1,
-1.167192, -0.3534428, -2.417943, 1, 1, 1, 1, 1,
-1.162443, -1.718198, -1.835146, 1, 1, 1, 1, 1,
-1.158064, -0.6137764, -3.033375, 1, 1, 1, 1, 1,
-1.145428, 0.003198028, -1.921893, 1, 1, 1, 1, 1,
-1.136398, 0.2704547, 0.4068958, 1, 1, 1, 1, 1,
-1.135782, -0.6237447, -2.377865, 1, 1, 1, 1, 1,
-1.134636, 0.7622836, -0.5430542, 1, 1, 1, 1, 1,
-1.131058, 2.05855, 0.4538291, 0, 0, 1, 1, 1,
-1.123455, -0.6892735, -1.701481, 1, 0, 0, 1, 1,
-1.112541, -1.406706, -3.055516, 1, 0, 0, 1, 1,
-1.109938, 0.6262886, -0.5118666, 1, 0, 0, 1, 1,
-1.09586, -1.072013, -1.965543, 1, 0, 0, 1, 1,
-1.085481, -0.20535, -2.918381, 1, 0, 0, 1, 1,
-1.085271, 0.4364879, -2.208966, 0, 0, 0, 1, 1,
-1.07787, 0.2805574, -2.174463, 0, 0, 0, 1, 1,
-1.07689, 0.2718253, -2.942978, 0, 0, 0, 1, 1,
-1.071632, -1.044549, -0.7098649, 0, 0, 0, 1, 1,
-1.056955, -2.124865, -3.264467, 0, 0, 0, 1, 1,
-1.056341, 0.08412038, -1.360234, 0, 0, 0, 1, 1,
-1.055613, -1.651056, -1.547437, 0, 0, 0, 1, 1,
-1.05508, 1.921921, 0.509931, 1, 1, 1, 1, 1,
-1.054541, 0.5562091, -2.179033, 1, 1, 1, 1, 1,
-1.050199, 3.502945, -0.8081794, 1, 1, 1, 1, 1,
-1.049196, -2.451442, -1.600771, 1, 1, 1, 1, 1,
-1.047993, 0.104437, -0.3863537, 1, 1, 1, 1, 1,
-1.043291, -0.4834519, -0.9984137, 1, 1, 1, 1, 1,
-1.041437, -0.9647343, -3.661466, 1, 1, 1, 1, 1,
-1.039629, 0.007332361, -3.005837, 1, 1, 1, 1, 1,
-1.027448, 0.2073951, -1.773093, 1, 1, 1, 1, 1,
-1.025742, -0.7661355, -2.13007, 1, 1, 1, 1, 1,
-1.022279, -0.04847767, -0.5944979, 1, 1, 1, 1, 1,
-1.017376, -1.326634, -1.996903, 1, 1, 1, 1, 1,
-1.011627, 0.5195568, -0.3101464, 1, 1, 1, 1, 1,
-1.007818, 0.2090594, -2.209182, 1, 1, 1, 1, 1,
-1.003508, 0.6863644, -0.8612595, 1, 1, 1, 1, 1,
-0.9991766, -1.480926, -2.292557, 0, 0, 1, 1, 1,
-0.9991446, 1.033457, -1.268335, 1, 0, 0, 1, 1,
-0.9910195, -0.7071211, -2.23225, 1, 0, 0, 1, 1,
-0.9802462, 1.69033, -2.739605, 1, 0, 0, 1, 1,
-0.9744809, -0.1470571, -2.04728, 1, 0, 0, 1, 1,
-0.9712535, -1.47829, -4.892127, 1, 0, 0, 1, 1,
-0.968705, -0.1762019, -2.115309, 0, 0, 0, 1, 1,
-0.9684382, -1.501741, -0.3747585, 0, 0, 0, 1, 1,
-0.9612057, -0.6695939, -1.275295, 0, 0, 0, 1, 1,
-0.9450101, -1.996802, -2.496915, 0, 0, 0, 1, 1,
-0.9425116, -0.7796217, -1.74191, 0, 0, 0, 1, 1,
-0.9414442, -0.1793488, -0.9550002, 0, 0, 0, 1, 1,
-0.9395311, -0.09880798, -0.6342666, 0, 0, 0, 1, 1,
-0.9392373, 1.882403, -1.257162, 1, 1, 1, 1, 1,
-0.9371295, -0.6504441, -0.7668737, 1, 1, 1, 1, 1,
-0.9320309, -0.9194248, -2.377077, 1, 1, 1, 1, 1,
-0.9280282, -1.250891, -2.608203, 1, 1, 1, 1, 1,
-0.9234295, -0.515534, -1.458557, 1, 1, 1, 1, 1,
-0.9230562, -0.3823749, -0.8311716, 1, 1, 1, 1, 1,
-0.9211572, -0.8141363, -2.936484, 1, 1, 1, 1, 1,
-0.915844, 0.09584259, -2.246171, 1, 1, 1, 1, 1,
-0.9128483, 1.212703, -0.6281111, 1, 1, 1, 1, 1,
-0.9069572, -0.9931892, -4.638544, 1, 1, 1, 1, 1,
-0.9060041, -0.1897704, -1.094158, 1, 1, 1, 1, 1,
-0.9029025, 1.650156, 0.5983973, 1, 1, 1, 1, 1,
-0.9011159, -0.9007144, -1.924465, 1, 1, 1, 1, 1,
-0.9007558, -1.431782, -5.848031, 1, 1, 1, 1, 1,
-0.8915052, 0.3805915, -0.9938514, 1, 1, 1, 1, 1,
-0.8875805, -0.06781745, -2.88184, 0, 0, 1, 1, 1,
-0.8857245, 1.176476, 0.3517203, 1, 0, 0, 1, 1,
-0.8726467, -1.139006, -1.285946, 1, 0, 0, 1, 1,
-0.8708473, -0.3753358, -2.443295, 1, 0, 0, 1, 1,
-0.8632274, 0.5893343, -3.007453, 1, 0, 0, 1, 1,
-0.8626527, -0.6836603, -2.508237, 1, 0, 0, 1, 1,
-0.8622348, -0.2927971, -0.3406858, 0, 0, 0, 1, 1,
-0.8539111, 0.2126046, -0.8873081, 0, 0, 0, 1, 1,
-0.8445985, -1.259962, -3.757246, 0, 0, 0, 1, 1,
-0.8405332, 1.718832, -0.2225457, 0, 0, 0, 1, 1,
-0.8400725, -0.8304701, -1.067051, 0, 0, 0, 1, 1,
-0.8326221, 0.9936038, -0.3027456, 0, 0, 0, 1, 1,
-0.8315951, 1.039779, -0.9078539, 0, 0, 0, 1, 1,
-0.8272215, 0.8521155, -0.7664073, 1, 1, 1, 1, 1,
-0.8232072, 0.4478511, -0.1882641, 1, 1, 1, 1, 1,
-0.8194162, 0.5942149, -0.9520264, 1, 1, 1, 1, 1,
-0.8185904, -0.2929247, -0.6009338, 1, 1, 1, 1, 1,
-0.8105596, -0.00962474, -1.858497, 1, 1, 1, 1, 1,
-0.8103055, 0.2252356, -0.5348594, 1, 1, 1, 1, 1,
-0.8030306, 0.4170534, -1.872073, 1, 1, 1, 1, 1,
-0.8016323, -0.3940443, -3.545318, 1, 1, 1, 1, 1,
-0.8009035, 0.7433001, -0.7277572, 1, 1, 1, 1, 1,
-0.7941487, 0.4008535, -1.138747, 1, 1, 1, 1, 1,
-0.7885036, -0.3446447, -1.605063, 1, 1, 1, 1, 1,
-0.7831908, 0.2951323, -1.173866, 1, 1, 1, 1, 1,
-0.7790606, -0.1758547, -0.09894808, 1, 1, 1, 1, 1,
-0.7770523, -0.1593099, -2.791719, 1, 1, 1, 1, 1,
-0.7765391, -0.4524923, -1.686777, 1, 1, 1, 1, 1,
-0.7683923, 0.4342564, -1.585669, 0, 0, 1, 1, 1,
-0.7674874, -1.012955, -1.475389, 1, 0, 0, 1, 1,
-0.7671633, 0.5725117, -0.6521287, 1, 0, 0, 1, 1,
-0.7643861, 0.9937938, 0.928175, 1, 0, 0, 1, 1,
-0.7603608, -1.073887, -2.675199, 1, 0, 0, 1, 1,
-0.7561002, -1.316879, -0.07502247, 1, 0, 0, 1, 1,
-0.7548847, -0.7923355, -1.301942, 0, 0, 0, 1, 1,
-0.7544364, -2.408049, -3.229547, 0, 0, 0, 1, 1,
-0.7463629, -0.6448513, -1.811123, 0, 0, 0, 1, 1,
-0.7431459, 0.9110172, -1.658562, 0, 0, 0, 1, 1,
-0.7426243, -0.1295446, -1.537989, 0, 0, 0, 1, 1,
-0.7404701, 0.8090276, 0.6009033, 0, 0, 0, 1, 1,
-0.7399346, 0.7101055, -0.8352861, 0, 0, 0, 1, 1,
-0.7388787, 0.6833518, -1.937095, 1, 1, 1, 1, 1,
-0.7375897, 1.934355, -1.278679, 1, 1, 1, 1, 1,
-0.7374998, 0.05939922, -2.116433, 1, 1, 1, 1, 1,
-0.7370702, 0.8954065, 1.374635, 1, 1, 1, 1, 1,
-0.7266125, 0.8843429, 1.528724, 1, 1, 1, 1, 1,
-0.7157747, 0.5657798, -1.642483, 1, 1, 1, 1, 1,
-0.70495, 0.01067675, -1.889524, 1, 1, 1, 1, 1,
-0.6978692, -0.8449519, -2.149624, 1, 1, 1, 1, 1,
-0.697714, 0.6973568, -0.2697778, 1, 1, 1, 1, 1,
-0.6952121, 2.216392, -0.04345813, 1, 1, 1, 1, 1,
-0.6938754, 0.3395506, 0.2663301, 1, 1, 1, 1, 1,
-0.6912917, -0.5253145, -1.988016, 1, 1, 1, 1, 1,
-0.6861836, -0.1790063, -3.289584, 1, 1, 1, 1, 1,
-0.683989, 0.6619715, -2.2523, 1, 1, 1, 1, 1,
-0.683385, 1.432828, 1.543968, 1, 1, 1, 1, 1,
-0.6774765, -0.08156396, -2.40033, 0, 0, 1, 1, 1,
-0.6671458, 0.2726968, 0.6180771, 1, 0, 0, 1, 1,
-0.6671159, 1.054592, 0.3646804, 1, 0, 0, 1, 1,
-0.6576492, -0.05523935, -1.195905, 1, 0, 0, 1, 1,
-0.6572938, -0.713278, -2.868787, 1, 0, 0, 1, 1,
-0.6534807, 0.2130775, -0.7475664, 1, 0, 0, 1, 1,
-0.6522706, 0.2435881, -1.92036, 0, 0, 0, 1, 1,
-0.6486791, 0.5252968, -0.6176954, 0, 0, 0, 1, 1,
-0.6412781, 2.766489, 0.7622802, 0, 0, 0, 1, 1,
-0.6386609, -1.884985, -0.6578232, 0, 0, 0, 1, 1,
-0.6337414, 0.7648336, -0.7971306, 0, 0, 0, 1, 1,
-0.6332816, -0.2578853, -0.4677117, 0, 0, 0, 1, 1,
-0.630038, -0.4998534, 0.3613792, 0, 0, 0, 1, 1,
-0.6201216, 0.2522072, -1.238694, 1, 1, 1, 1, 1,
-0.6184774, 1.419092, -0.5034732, 1, 1, 1, 1, 1,
-0.6173884, -1.073315, -1.402063, 1, 1, 1, 1, 1,
-0.6138496, 1.259542, -0.5484179, 1, 1, 1, 1, 1,
-0.6004868, 1.934541, 0.624651, 1, 1, 1, 1, 1,
-0.5997146, 0.2914218, -2.564333, 1, 1, 1, 1, 1,
-0.5952317, -1.827913, -1.495738, 1, 1, 1, 1, 1,
-0.5931401, -0.4961105, -0.8891494, 1, 1, 1, 1, 1,
-0.5889704, 0.295436, -0.04794304, 1, 1, 1, 1, 1,
-0.5874198, 0.8091496, -1.082028, 1, 1, 1, 1, 1,
-0.5861154, -2.299161, -0.82098, 1, 1, 1, 1, 1,
-0.5784026, 1.12325, -0.7019859, 1, 1, 1, 1, 1,
-0.5773733, 0.5657964, 0.1790617, 1, 1, 1, 1, 1,
-0.5769216, -1.172361, -1.906321, 1, 1, 1, 1, 1,
-0.5761074, 0.4034859, -2.072133, 1, 1, 1, 1, 1,
-0.5705684, 0.6600082, -0.7330497, 0, 0, 1, 1, 1,
-0.567399, 0.1193122, 0.7552597, 1, 0, 0, 1, 1,
-0.5673133, 0.2131779, -1.384859, 1, 0, 0, 1, 1,
-0.5655078, 3.085518, -0.5226136, 1, 0, 0, 1, 1,
-0.5598436, -1.337276, -1.723985, 1, 0, 0, 1, 1,
-0.5565801, 2.137821, 0.4047278, 1, 0, 0, 1, 1,
-0.5492901, 0.8085964, -0.788053, 0, 0, 0, 1, 1,
-0.5439821, 0.1922975, -2.237783, 0, 0, 0, 1, 1,
-0.5422782, 0.5605705, -0.7188625, 0, 0, 0, 1, 1,
-0.5422621, 0.1825608, -0.6687437, 0, 0, 0, 1, 1,
-0.5401234, -1.074632, -1.946774, 0, 0, 0, 1, 1,
-0.5340857, 0.6238942, -1.32094, 0, 0, 0, 1, 1,
-0.5330694, 0.594573, -0.6658933, 0, 0, 0, 1, 1,
-0.5314548, 1.50867, -1.123456, 1, 1, 1, 1, 1,
-0.5304022, 0.8840881, -0.5239724, 1, 1, 1, 1, 1,
-0.5303729, -0.4469367, -2.570043, 1, 1, 1, 1, 1,
-0.5276201, 1.615946, -0.5753857, 1, 1, 1, 1, 1,
-0.5247734, -0.4637537, -3.463806, 1, 1, 1, 1, 1,
-0.5213179, -0.1852584, -1.087611, 1, 1, 1, 1, 1,
-0.521108, 0.6845137, -3.915008, 1, 1, 1, 1, 1,
-0.5202109, 0.2664608, -1.026768, 1, 1, 1, 1, 1,
-0.5191903, 0.4792006, -2.094333, 1, 1, 1, 1, 1,
-0.5180717, -0.2764125, -1.480039, 1, 1, 1, 1, 1,
-0.5169333, -0.7724943, -3.102333, 1, 1, 1, 1, 1,
-0.5166396, -0.1864291, -2.00693, 1, 1, 1, 1, 1,
-0.5141678, -0.2686781, -2.262629, 1, 1, 1, 1, 1,
-0.5068879, -1.727497, -3.726424, 1, 1, 1, 1, 1,
-0.5060803, 0.958877, -1.151211, 1, 1, 1, 1, 1,
-0.4994512, -0.316311, -0.9716556, 0, 0, 1, 1, 1,
-0.4949597, -0.1070094, -2.655143, 1, 0, 0, 1, 1,
-0.4917413, 0.2149828, -0.8099354, 1, 0, 0, 1, 1,
-0.4826886, 0.1248617, -1.686613, 1, 0, 0, 1, 1,
-0.4802248, 0.6144678, -1.194639, 1, 0, 0, 1, 1,
-0.4794807, 0.4928865, -0.7465137, 1, 0, 0, 1, 1,
-0.4780552, 1.647354, 0.01942327, 0, 0, 0, 1, 1,
-0.4779614, 0.5276148, -1.762743, 0, 0, 0, 1, 1,
-0.4738272, 1.776163, -0.2556133, 0, 0, 0, 1, 1,
-0.4706677, 1.409238, -1.925834, 0, 0, 0, 1, 1,
-0.4678779, -0.3872357, -1.457273, 0, 0, 0, 1, 1,
-0.4675084, -1.10805, -3.21321, 0, 0, 0, 1, 1,
-0.4609892, 0.600109, -3.063315, 0, 0, 0, 1, 1,
-0.4567966, -0.645916, -3.791341, 1, 1, 1, 1, 1,
-0.4518844, 0.9201666, -0.3766448, 1, 1, 1, 1, 1,
-0.4515754, -0.6283211, -2.55216, 1, 1, 1, 1, 1,
-0.449782, 0.4528115, 0.5644236, 1, 1, 1, 1, 1,
-0.4452654, -0.9884151, -2.766162, 1, 1, 1, 1, 1,
-0.4400504, -0.293177, -2.026504, 1, 1, 1, 1, 1,
-0.4392328, -0.8789619, -2.01595, 1, 1, 1, 1, 1,
-0.4369047, 0.8319302, 0.8518842, 1, 1, 1, 1, 1,
-0.4362332, 2.749433, -1.986316, 1, 1, 1, 1, 1,
-0.435619, -0.1823169, -1.991147, 1, 1, 1, 1, 1,
-0.4352235, -0.1023283, -3.655004, 1, 1, 1, 1, 1,
-0.433601, 1.167786, 0.04192731, 1, 1, 1, 1, 1,
-0.4329997, 0.5550426, 0.3922827, 1, 1, 1, 1, 1,
-0.4293789, -0.03581188, -3.462517, 1, 1, 1, 1, 1,
-0.428554, 0.808068, 0.2773168, 1, 1, 1, 1, 1,
-0.4278778, -0.05282455, -2.637396, 0, 0, 1, 1, 1,
-0.4247918, 0.3794564, -0.6046516, 1, 0, 0, 1, 1,
-0.4202053, 0.2228847, -0.01673384, 1, 0, 0, 1, 1,
-0.4186717, -0.3151504, -2.317276, 1, 0, 0, 1, 1,
-0.4162458, 0.9298758, 0.162164, 1, 0, 0, 1, 1,
-0.4141542, 0.2198407, -1.213794, 1, 0, 0, 1, 1,
-0.4040012, -0.3705595, -1.354855, 0, 0, 0, 1, 1,
-0.4028931, 1.06224, -0.4882512, 0, 0, 0, 1, 1,
-0.4027846, 0.2785731, -1.010748, 0, 0, 0, 1, 1,
-0.4025176, 0.3318635, -0.1673457, 0, 0, 0, 1, 1,
-0.4003212, 0.7959442, 0.3120163, 0, 0, 0, 1, 1,
-0.3985345, -0.4407669, -2.397777, 0, 0, 0, 1, 1,
-0.3941677, 1.441487, 1.336156, 0, 0, 0, 1, 1,
-0.393202, 0.03878463, -0.947038, 1, 1, 1, 1, 1,
-0.3873614, 1.216978, -0.5018894, 1, 1, 1, 1, 1,
-0.3811124, 0.2336861, -0.4279673, 1, 1, 1, 1, 1,
-0.3809776, -0.1272346, -2.194415, 1, 1, 1, 1, 1,
-0.3771203, 1.431956, -0.6362056, 1, 1, 1, 1, 1,
-0.3762686, 1.433696, 0.1195436, 1, 1, 1, 1, 1,
-0.3747021, -0.3863202, -1.790269, 1, 1, 1, 1, 1,
-0.3741534, 0.5239124, -1.43734, 1, 1, 1, 1, 1,
-0.3621626, 0.8984467, -1.454434, 1, 1, 1, 1, 1,
-0.3602322, -0.7453321, -2.97222, 1, 1, 1, 1, 1,
-0.3547063, -0.8389637, -2.969639, 1, 1, 1, 1, 1,
-0.3463458, 1.708759, -0.1534898, 1, 1, 1, 1, 1,
-0.3422824, 0.06392056, -3.474783, 1, 1, 1, 1, 1,
-0.341986, 0.1336501, -2.173516, 1, 1, 1, 1, 1,
-0.3412388, -0.02334747, -0.2385584, 1, 1, 1, 1, 1,
-0.3407464, 1.730215, -0.2100649, 0, 0, 1, 1, 1,
-0.3370183, 0.6075249, -0.7490505, 1, 0, 0, 1, 1,
-0.3313173, -0.004023605, -1.376587, 1, 0, 0, 1, 1,
-0.3306612, -0.2074126, -0.943952, 1, 0, 0, 1, 1,
-0.3263078, -0.5238449, -2.945231, 1, 0, 0, 1, 1,
-0.3260751, 0.6979937, 0.6230609, 1, 0, 0, 1, 1,
-0.3233205, 1.416807, 0.4586227, 0, 0, 0, 1, 1,
-0.3232257, 0.1337178, -2.226841, 0, 0, 0, 1, 1,
-0.3203823, -0.1948228, -1.558031, 0, 0, 0, 1, 1,
-0.3155128, 1.465416, 1.109498, 0, 0, 0, 1, 1,
-0.3129362, 0.4548455, -3.608495, 0, 0, 0, 1, 1,
-0.3123382, 0.07958451, -1.080462, 0, 0, 0, 1, 1,
-0.3111609, 1.231167, -0.7565496, 0, 0, 0, 1, 1,
-0.3107451, 1.067943, -0.1492693, 1, 1, 1, 1, 1,
-0.3081743, -2.364853, -3.826614, 1, 1, 1, 1, 1,
-0.3069074, 0.7727447, -0.9705835, 1, 1, 1, 1, 1,
-0.3050759, -1.611481, -3.986153, 1, 1, 1, 1, 1,
-0.303906, 0.1920773, -1.43456, 1, 1, 1, 1, 1,
-0.29974, 0.338834, 0.5341995, 1, 1, 1, 1, 1,
-0.2965693, -0.2973637, -2.491359, 1, 1, 1, 1, 1,
-0.2921627, 0.4537042, -1.236813, 1, 1, 1, 1, 1,
-0.2900601, 0.631234, -0.8981236, 1, 1, 1, 1, 1,
-0.2889216, 0.1718475, -0.8077242, 1, 1, 1, 1, 1,
-0.285712, -0.5967907, -3.113249, 1, 1, 1, 1, 1,
-0.2782636, 0.5231879, -1.195159, 1, 1, 1, 1, 1,
-0.2754338, 0.3046486, -0.5465955, 1, 1, 1, 1, 1,
-0.2596689, 0.0446519, -2.442232, 1, 1, 1, 1, 1,
-0.2593417, -0.9019554, -3.98521, 1, 1, 1, 1, 1,
-0.251765, 1.261477, 0.7430868, 0, 0, 1, 1, 1,
-0.2493864, -0.05735269, -1.435664, 1, 0, 0, 1, 1,
-0.2474057, -1.021055, -3.647372, 1, 0, 0, 1, 1,
-0.2448467, 0.7605771, 0.4949775, 1, 0, 0, 1, 1,
-0.2445656, -1.920842, -3.590588, 1, 0, 0, 1, 1,
-0.2411798, -0.6367311, -3.744365, 1, 0, 0, 1, 1,
-0.232854, -0.4811364, -0.4915845, 0, 0, 0, 1, 1,
-0.2322404, -1.602628, -1.221623, 0, 0, 0, 1, 1,
-0.2272128, 0.4816718, -0.3323714, 0, 0, 0, 1, 1,
-0.2252903, -0.002708793, -3.391091, 0, 0, 0, 1, 1,
-0.2240947, -1.024892, -1.978596, 0, 0, 0, 1, 1,
-0.2215909, 0.3497276, 0.3263978, 0, 0, 0, 1, 1,
-0.2198164, -0.08585137, -0.548321, 0, 0, 0, 1, 1,
-0.2173956, -0.3384481, -2.866188, 1, 1, 1, 1, 1,
-0.2158049, 2.184963, 1.264048, 1, 1, 1, 1, 1,
-0.2151654, -0.5045968, -5.063753, 1, 1, 1, 1, 1,
-0.2117006, -1.494657, -2.916322, 1, 1, 1, 1, 1,
-0.2073605, -0.9459173, -2.118899, 1, 1, 1, 1, 1,
-0.2023686, 0.1333924, -0.5824089, 1, 1, 1, 1, 1,
-0.2004445, -1.845953, -4.439367, 1, 1, 1, 1, 1,
-0.1965655, 0.532415, 1.470397, 1, 1, 1, 1, 1,
-0.1940513, -0.9367008, -3.947118, 1, 1, 1, 1, 1,
-0.1938606, 0.4279718, -0.6758987, 1, 1, 1, 1, 1,
-0.193417, -2.196261, -3.28712, 1, 1, 1, 1, 1,
-0.1919956, 0.5541491, 0.223186, 1, 1, 1, 1, 1,
-0.1914048, -1.133917, -2.627989, 1, 1, 1, 1, 1,
-0.1898104, -0.7790088, -3.686481, 1, 1, 1, 1, 1,
-0.1887688, 0.6902094, -0.9447019, 1, 1, 1, 1, 1,
-0.1879389, 0.7327798, -0.09681623, 0, 0, 1, 1, 1,
-0.187768, 0.1848919, -1.603738, 1, 0, 0, 1, 1,
-0.1873311, 0.3250343, -2.234997, 1, 0, 0, 1, 1,
-0.186255, 2.107844, 0.4544958, 1, 0, 0, 1, 1,
-0.1861698, -1.143858, -1.857572, 1, 0, 0, 1, 1,
-0.1856033, -0.9090912, -1.363631, 1, 0, 0, 1, 1,
-0.1826323, 1.887995, 0.4580257, 0, 0, 0, 1, 1,
-0.1819226, -1.387814, -1.510111, 0, 0, 0, 1, 1,
-0.1722236, 0.5229374, -0.3408745, 0, 0, 0, 1, 1,
-0.1703314, 0.02343498, 0.3711995, 0, 0, 0, 1, 1,
-0.1663681, -0.6539037, -4.529319, 0, 0, 0, 1, 1,
-0.1548343, 0.6068195, 0.8524114, 0, 0, 0, 1, 1,
-0.1526394, -0.9641782, -2.844909, 0, 0, 0, 1, 1,
-0.1511128, -0.5612618, -4.620662, 1, 1, 1, 1, 1,
-0.1503403, -0.3153836, -3.424045, 1, 1, 1, 1, 1,
-0.1501757, 0.4132743, -1.124768, 1, 1, 1, 1, 1,
-0.1493679, 0.5127012, -0.7302562, 1, 1, 1, 1, 1,
-0.1492546, -0.5044277, -2.258296, 1, 1, 1, 1, 1,
-0.1491054, -0.6554172, -1.198919, 1, 1, 1, 1, 1,
-0.1390753, -0.004717234, -2.808387, 1, 1, 1, 1, 1,
-0.1355285, -0.4253304, -2.718146, 1, 1, 1, 1, 1,
-0.1340956, -0.06378537, -0.8304888, 1, 1, 1, 1, 1,
-0.1324982, -0.08695604, -2.865138, 1, 1, 1, 1, 1,
-0.1324402, -1.190776, -2.747932, 1, 1, 1, 1, 1,
-0.1306222, -0.9753842, -2.815375, 1, 1, 1, 1, 1,
-0.1301236, 0.5312011, 0.2209784, 1, 1, 1, 1, 1,
-0.1300405, -0.7354475, -1.806567, 1, 1, 1, 1, 1,
-0.1295293, 1.024761, -0.144759, 1, 1, 1, 1, 1,
-0.1292291, 0.3287185, -0.5295531, 0, 0, 1, 1, 1,
-0.1291669, 0.4437092, -0.5561775, 1, 0, 0, 1, 1,
-0.1281259, 0.3583286, 1.44845, 1, 0, 0, 1, 1,
-0.1275972, -1.254834, -4.137844, 1, 0, 0, 1, 1,
-0.1234086, 0.2869282, -1.24375, 1, 0, 0, 1, 1,
-0.1180877, -0.5437883, -2.767695, 1, 0, 0, 1, 1,
-0.1172818, -0.08648825, -3.787891, 0, 0, 0, 1, 1,
-0.102655, 0.3487426, 0.04855913, 0, 0, 0, 1, 1,
-0.09569337, 0.527191, 0.09112936, 0, 0, 0, 1, 1,
-0.0913449, -0.01571546, -2.39067, 0, 0, 0, 1, 1,
-0.08772328, -0.006546131, -3.537078, 0, 0, 0, 1, 1,
-0.08113509, 1.755564, -0.3474421, 0, 0, 0, 1, 1,
-0.08082215, -0.1386833, -4.289273, 0, 0, 0, 1, 1,
-0.07378854, -0.400995, -3.094353, 1, 1, 1, 1, 1,
-0.07118311, -0.2749729, -3.108206, 1, 1, 1, 1, 1,
-0.0650769, -1.013442, -1.918401, 1, 1, 1, 1, 1,
-0.0648452, 0.5864571, -0.2959631, 1, 1, 1, 1, 1,
-0.06131346, -1.380141, -3.746789, 1, 1, 1, 1, 1,
-0.05940846, -0.6355526, -2.425727, 1, 1, 1, 1, 1,
-0.05540849, 0.6407653, -0.4728893, 1, 1, 1, 1, 1,
-0.05082834, -0.5654871, -1.665966, 1, 1, 1, 1, 1,
-0.05006166, 0.7545014, 1.051639, 1, 1, 1, 1, 1,
-0.04986459, 0.8378231, 0.887018, 1, 1, 1, 1, 1,
-0.04810906, 0.09818586, -1.367875, 1, 1, 1, 1, 1,
-0.04682058, 0.1581422, -0.07622318, 1, 1, 1, 1, 1,
-0.04019257, 0.03604192, 0.1495368, 1, 1, 1, 1, 1,
-0.04006125, -2.552175, -2.92532, 1, 1, 1, 1, 1,
-0.0390243, 0.6049868, -1.294002, 1, 1, 1, 1, 1,
-0.03536845, 1.165067, -0.1736455, 0, 0, 1, 1, 1,
-0.03176586, -0.8321422, -3.180874, 1, 0, 0, 1, 1,
-0.02884094, 0.3226548, 0.4329698, 1, 0, 0, 1, 1,
-0.02878258, -1.274629, -4.496601, 1, 0, 0, 1, 1,
-0.02872342, -0.1098298, -3.364995, 1, 0, 0, 1, 1,
-0.02420649, -1.519934, -2.196241, 1, 0, 0, 1, 1,
-0.02153759, 0.8255414, -1.952193, 0, 0, 0, 1, 1,
-0.0158686, -1.627911, -2.959855, 0, 0, 0, 1, 1,
-0.01333163, -0.9614483, -3.798136, 0, 0, 0, 1, 1,
-0.01272459, 0.5839638, -0.9274545, 0, 0, 0, 1, 1,
-0.01101971, -0.7984498, -4.552509, 0, 0, 0, 1, 1,
-0.009757166, -0.3843148, -3.110836, 0, 0, 0, 1, 1,
-0.009308299, 0.3483477, -0.2127147, 0, 0, 0, 1, 1,
-0.008801033, 0.03088748, -0.3890424, 1, 1, 1, 1, 1,
-0.008364125, -0.9295832, -3.693746, 1, 1, 1, 1, 1,
-0.007268042, 0.4121282, 0.1353001, 1, 1, 1, 1, 1,
-0.005769633, 0.87376, 0.6118259, 1, 1, 1, 1, 1,
-0.004314063, -0.1335897, -1.29494, 1, 1, 1, 1, 1,
-0.0001829879, -0.1910641, -1.962525, 1, 1, 1, 1, 1,
-1.337297e-05, 1.153829, -0.4941775, 1, 1, 1, 1, 1,
0.000542674, -1.466051, 2.046752, 1, 1, 1, 1, 1,
0.004124732, -1.72396, 2.630332, 1, 1, 1, 1, 1,
0.005894503, 0.4725808, -1.518721, 1, 1, 1, 1, 1,
0.006479472, -1.708649, 4.810391, 1, 1, 1, 1, 1,
0.01502599, 0.2943076, -0.7395574, 1, 1, 1, 1, 1,
0.01700928, 2.322498, 0.0183168, 1, 1, 1, 1, 1,
0.01902249, -0.6325786, 5.239367, 1, 1, 1, 1, 1,
0.02377516, 0.678194, -1.598048, 1, 1, 1, 1, 1,
0.02780736, 1.538311, -0.5621473, 0, 0, 1, 1, 1,
0.03138296, 0.319961, -0.2262414, 1, 0, 0, 1, 1,
0.03204581, -0.4657455, 3.817554, 1, 0, 0, 1, 1,
0.03241809, -0.1822523, 2.261748, 1, 0, 0, 1, 1,
0.03270003, -0.8438788, 4.962164, 1, 0, 0, 1, 1,
0.03343588, 0.04159442, 2.858671, 1, 0, 0, 1, 1,
0.04039043, 0.9182011, -2.257527, 0, 0, 0, 1, 1,
0.04563024, 1.261157, -1.633494, 0, 0, 0, 1, 1,
0.0469655, 0.133732, -0.6185157, 0, 0, 0, 1, 1,
0.04873794, -0.4261908, 4.096899, 0, 0, 0, 1, 1,
0.05129949, 0.2724748, 0.414949, 0, 0, 0, 1, 1,
0.05532617, 0.5672198, 0.846296, 0, 0, 0, 1, 1,
0.06265568, -0.8010602, 2.930694, 0, 0, 0, 1, 1,
0.066067, 1.375586, -0.4968055, 1, 1, 1, 1, 1,
0.06844255, -0.7737925, 3.426716, 1, 1, 1, 1, 1,
0.07267041, 0.5901832, 1.318506, 1, 1, 1, 1, 1,
0.07427976, -0.4685819, 2.476892, 1, 1, 1, 1, 1,
0.07657427, 0.1647535, -0.9561788, 1, 1, 1, 1, 1,
0.07725223, -0.4667069, 3.427413, 1, 1, 1, 1, 1,
0.07905021, -0.2292751, 2.45672, 1, 1, 1, 1, 1,
0.08076618, 0.5681565, 0.5045046, 1, 1, 1, 1, 1,
0.08122203, -1.369242, 3.334721, 1, 1, 1, 1, 1,
0.08199207, -0.9756112, 2.905248, 1, 1, 1, 1, 1,
0.08406444, 0.3859464, -1.916232, 1, 1, 1, 1, 1,
0.08706299, -0.2238066, 2.228951, 1, 1, 1, 1, 1,
0.08811048, 0.5511169, 0.7739192, 1, 1, 1, 1, 1,
0.08981556, -2.129142, 4.304956, 1, 1, 1, 1, 1,
0.0902594, -0.5354971, 4.38934, 1, 1, 1, 1, 1,
0.09168763, -1.359578, 4.060993, 0, 0, 1, 1, 1,
0.09289583, -1.721465, 1.388456, 1, 0, 0, 1, 1,
0.0940951, 1.356232, -1.66395, 1, 0, 0, 1, 1,
0.09501559, -0.9282924, 0.849212, 1, 0, 0, 1, 1,
0.09650308, -1.051678, 3.111221, 1, 0, 0, 1, 1,
0.09826231, 0.3591022, 1.42352, 1, 0, 0, 1, 1,
0.1025148, 1.54348, -1.535121, 0, 0, 0, 1, 1,
0.1032706, 0.7178515, 0.007255766, 0, 0, 0, 1, 1,
0.1148013, -0.1324037, 1.62858, 0, 0, 0, 1, 1,
0.1161668, 0.4582421, -1.141079, 0, 0, 0, 1, 1,
0.1167295, 0.5239716, 0.471981, 0, 0, 0, 1, 1,
0.1194103, -0.6338968, 2.183481, 0, 0, 0, 1, 1,
0.1204538, -0.6339044, 1.61022, 0, 0, 0, 1, 1,
0.1226207, -0.1636211, 3.826337, 1, 1, 1, 1, 1,
0.1230454, 0.3246871, -0.02042471, 1, 1, 1, 1, 1,
0.1260376, -1.674759, 2.697335, 1, 1, 1, 1, 1,
0.1265309, 2.2807, -1.313315, 1, 1, 1, 1, 1,
0.1278255, 0.3042385, -0.5085692, 1, 1, 1, 1, 1,
0.132057, 2.290722, -0.6688229, 1, 1, 1, 1, 1,
0.1340585, 1.56947, -0.9112764, 1, 1, 1, 1, 1,
0.1365354, 0.0244237, 1.404482, 1, 1, 1, 1, 1,
0.1377548, -0.4389265, 2.930216, 1, 1, 1, 1, 1,
0.1387113, 1.060185, 0.2890155, 1, 1, 1, 1, 1,
0.1474044, 0.5002939, -0.05438903, 1, 1, 1, 1, 1,
0.1488307, 0.2623238, -1.469881, 1, 1, 1, 1, 1,
0.1516736, 0.2185961, 0.3638631, 1, 1, 1, 1, 1,
0.1520593, -0.5549022, 2.691198, 1, 1, 1, 1, 1,
0.1532446, 0.1939038, 0.7966383, 1, 1, 1, 1, 1,
0.1610015, -1.493559, 2.870413, 0, 0, 1, 1, 1,
0.1647857, -0.2090865, 1.587744, 1, 0, 0, 1, 1,
0.1653725, -0.609157, 1.754528, 1, 0, 0, 1, 1,
0.166059, 0.1519487, 1.848276, 1, 0, 0, 1, 1,
0.1756117, 0.1337859, 0.2794191, 1, 0, 0, 1, 1,
0.1763886, 0.307482, 0.8739945, 1, 0, 0, 1, 1,
0.1800355, 1.301243, 0.3490168, 0, 0, 0, 1, 1,
0.1800832, 0.5321278, 0.9678161, 0, 0, 0, 1, 1,
0.185421, -1.990693, 3.574486, 0, 0, 0, 1, 1,
0.188533, -0.2460556, 3.805, 0, 0, 0, 1, 1,
0.1890301, -0.1586608, 1.999267, 0, 0, 0, 1, 1,
0.1910692, -0.8233141, 1.635924, 0, 0, 0, 1, 1,
0.193519, -0.3414322, 2.875913, 0, 0, 0, 1, 1,
0.195594, 0.2112592, -0.07500916, 1, 1, 1, 1, 1,
0.1989759, 0.04452844, 0.6827629, 1, 1, 1, 1, 1,
0.2011774, 1.782391, 0.4265684, 1, 1, 1, 1, 1,
0.2035414, 0.4701961, -0.3272843, 1, 1, 1, 1, 1,
0.2041442, -1.280791, 3.035449, 1, 1, 1, 1, 1,
0.2044275, -0.8912911, 1.318386, 1, 1, 1, 1, 1,
0.2076725, 0.6338208, 0.6834023, 1, 1, 1, 1, 1,
0.2127407, 1.815096, 1.928643, 1, 1, 1, 1, 1,
0.2145865, -0.4710594, 2.343969, 1, 1, 1, 1, 1,
0.2188592, -0.5936662, 1.939908, 1, 1, 1, 1, 1,
0.2201833, 0.1060617, 2.489338, 1, 1, 1, 1, 1,
0.2204023, -0.5653316, 1.679905, 1, 1, 1, 1, 1,
0.220762, 0.3373618, 2.623895, 1, 1, 1, 1, 1,
0.2208429, -1.194085, 1.449407, 1, 1, 1, 1, 1,
0.224173, -1.195801, 2.258642, 1, 1, 1, 1, 1,
0.2248448, -1.713083, 1.776748, 0, 0, 1, 1, 1,
0.225703, 0.05184704, 1.98601, 1, 0, 0, 1, 1,
0.2278635, -0.9440882, 0.9369982, 1, 0, 0, 1, 1,
0.2282309, -0.8943677, 3.043352, 1, 0, 0, 1, 1,
0.2325451, -0.4104555, 2.546965, 1, 0, 0, 1, 1,
0.2346496, -0.9029286, 2.832352, 1, 0, 0, 1, 1,
0.2370305, -1.207438, 3.640968, 0, 0, 0, 1, 1,
0.2421276, -0.4508581, 0.958245, 0, 0, 0, 1, 1,
0.2437428, -1.507817, 3.622941, 0, 0, 0, 1, 1,
0.2454773, -0.4351641, 2.579154, 0, 0, 0, 1, 1,
0.247761, -0.4063591, 3.311532, 0, 0, 0, 1, 1,
0.2484331, -0.2584979, 1.979409, 0, 0, 0, 1, 1,
0.2501626, 0.6327336, -0.05234698, 0, 0, 0, 1, 1,
0.2507535, -0.3743419, 2.086416, 1, 1, 1, 1, 1,
0.2509513, -0.2927537, -0.3949082, 1, 1, 1, 1, 1,
0.2530404, -0.5830466, 2.908621, 1, 1, 1, 1, 1,
0.2532031, -0.1532273, 1.828136, 1, 1, 1, 1, 1,
0.2555763, 1.426688, 0.9567378, 1, 1, 1, 1, 1,
0.2608476, 1.000101, -0.3124842, 1, 1, 1, 1, 1,
0.2630668, -2.892357, 2.66996, 1, 1, 1, 1, 1,
0.2709017, 1.818539, 0.8588914, 1, 1, 1, 1, 1,
0.2720438, -0.7673419, 3.603482, 1, 1, 1, 1, 1,
0.2764378, -0.3439013, 3.171443, 1, 1, 1, 1, 1,
0.277307, 0.4904674, 0.4359988, 1, 1, 1, 1, 1,
0.2804167, 0.3545206, 0.08615335, 1, 1, 1, 1, 1,
0.2813062, -2.358518, 3.130237, 1, 1, 1, 1, 1,
0.2820393, -1.25396, 1.695518, 1, 1, 1, 1, 1,
0.2820484, 0.03690752, 2.088128, 1, 1, 1, 1, 1,
0.2838897, 1.632476, 0.02258643, 0, 0, 1, 1, 1,
0.2935255, -1.069645, 1.250574, 1, 0, 0, 1, 1,
0.2978869, -0.3827558, 2.168267, 1, 0, 0, 1, 1,
0.2988805, -0.7552179, 2.990175, 1, 0, 0, 1, 1,
0.2991951, -0.4030808, 4.342841, 1, 0, 0, 1, 1,
0.2995281, 1.677468, -0.7403324, 1, 0, 0, 1, 1,
0.3015492, -0.2606893, 1.179717, 0, 0, 0, 1, 1,
0.301562, 1.112735, -1.320894, 0, 0, 0, 1, 1,
0.3127781, 0.2271059, -1.204925, 0, 0, 0, 1, 1,
0.313056, 0.5572717, -0.2274362, 0, 0, 0, 1, 1,
0.3131752, -0.1218575, 2.658318, 0, 0, 0, 1, 1,
0.3135876, 0.8347828, 0.04228886, 0, 0, 0, 1, 1,
0.3164726, 1.315224, -0.6773291, 0, 0, 0, 1, 1,
0.3209544, 0.2883624, 1.793026, 1, 1, 1, 1, 1,
0.3218113, -0.2365299, 2.175377, 1, 1, 1, 1, 1,
0.3218486, 2.810168, -0.28985, 1, 1, 1, 1, 1,
0.3222802, -1.810878, 3.244204, 1, 1, 1, 1, 1,
0.3228467, 0.6205328, 1.074281, 1, 1, 1, 1, 1,
0.3251941, -0.06960593, 3.053524, 1, 1, 1, 1, 1,
0.3295959, 1.677269, -0.2337106, 1, 1, 1, 1, 1,
0.3298414, 1.230895, -1.636981, 1, 1, 1, 1, 1,
0.3325019, 0.312906, 0.09321853, 1, 1, 1, 1, 1,
0.3379762, -0.3563639, 1.820808, 1, 1, 1, 1, 1,
0.341133, 0.9093085, 1.707721, 1, 1, 1, 1, 1,
0.3434785, 0.9127849, 0.2446857, 1, 1, 1, 1, 1,
0.3468339, 1.228762, -1.488612, 1, 1, 1, 1, 1,
0.3488362, 0.1635974, 0.3497613, 1, 1, 1, 1, 1,
0.3491465, -1.044644, 3.581125, 1, 1, 1, 1, 1,
0.3533974, 0.6046946, -0.2549771, 0, 0, 1, 1, 1,
0.3653912, 0.9154904, 2.401497, 1, 0, 0, 1, 1,
0.3700912, -0.3568585, 3.818147, 1, 0, 0, 1, 1,
0.3795758, 1.013888, -0.4667535, 1, 0, 0, 1, 1,
0.3797772, -0.6688594, 5.084137, 1, 0, 0, 1, 1,
0.3799811, 1.615733, 0.3827123, 1, 0, 0, 1, 1,
0.3807273, 0.5419003, 1.789795, 0, 0, 0, 1, 1,
0.3863992, 1.555232, 0.4841785, 0, 0, 0, 1, 1,
0.3893991, -1.403844, 3.868458, 0, 0, 0, 1, 1,
0.3896363, 0.2992197, 0.6685625, 0, 0, 0, 1, 1,
0.3930429, 0.1945843, 1.554339, 0, 0, 0, 1, 1,
0.394298, -0.5981219, 1.908283, 0, 0, 0, 1, 1,
0.3967756, 0.898748, -0.1140387, 0, 0, 0, 1, 1,
0.4021035, 1.516506, 0.4269709, 1, 1, 1, 1, 1,
0.4031353, 2.424094, 0.1861256, 1, 1, 1, 1, 1,
0.4052112, -0.2563304, -0.05200876, 1, 1, 1, 1, 1,
0.4070095, 0.2009563, 0.4585162, 1, 1, 1, 1, 1,
0.411406, -1.482692, 4.025141, 1, 1, 1, 1, 1,
0.41391, 0.9230482, 0.639375, 1, 1, 1, 1, 1,
0.4176143, -0.03785649, 0.8681256, 1, 1, 1, 1, 1,
0.4179429, 1.457698, -0.6276004, 1, 1, 1, 1, 1,
0.4250674, -0.8903007, 2.559134, 1, 1, 1, 1, 1,
0.4257135, -0.881999, 2.451165, 1, 1, 1, 1, 1,
0.4279905, 0.2919036, -1.940205, 1, 1, 1, 1, 1,
0.4317091, 0.6098723, 3.181536, 1, 1, 1, 1, 1,
0.436722, 0.8023663, 1.388407, 1, 1, 1, 1, 1,
0.4465353, -1.859974, 2.472396, 1, 1, 1, 1, 1,
0.4498315, -1.169584, 2.635648, 1, 1, 1, 1, 1,
0.450753, -0.6736018, 1.117299, 0, 0, 1, 1, 1,
0.4509521, -0.2259067, 2.454662, 1, 0, 0, 1, 1,
0.4550758, -1.316898, 2.094213, 1, 0, 0, 1, 1,
0.4551686, 2.356609, -0.1742188, 1, 0, 0, 1, 1,
0.4646183, 0.2143803, 0.743578, 1, 0, 0, 1, 1,
0.467752, -0.3885988, 1.672208, 1, 0, 0, 1, 1,
0.4723869, 1.017803, 1.636372, 0, 0, 0, 1, 1,
0.4736484, 0.7927952, -0.3498565, 0, 0, 0, 1, 1,
0.4772754, 0.404581, 2.709392, 0, 0, 0, 1, 1,
0.4778504, -1.284088, 0.4595756, 0, 0, 0, 1, 1,
0.4787931, 0.08932516, 0.09620737, 0, 0, 0, 1, 1,
0.4791857, -1.981634, 0.9354282, 0, 0, 0, 1, 1,
0.4798414, 0.2638405, 2.012385, 0, 0, 0, 1, 1,
0.4828317, 1.168203, 1.167359, 1, 1, 1, 1, 1,
0.4874442, -0.630825, 3.803819, 1, 1, 1, 1, 1,
0.4890428, 0.1180774, 1.475738, 1, 1, 1, 1, 1,
0.4912347, -0.6301349, 4.515903, 1, 1, 1, 1, 1,
0.4959793, 0.4926695, 2.054572, 1, 1, 1, 1, 1,
0.4984041, -1.945482, 3.269869, 1, 1, 1, 1, 1,
0.503558, -2.386278, 2.08327, 1, 1, 1, 1, 1,
0.5068498, -0.187994, 2.241765, 1, 1, 1, 1, 1,
0.5132043, 0.9811071, 0.6847227, 1, 1, 1, 1, 1,
0.5143676, 0.07887352, -0.5552056, 1, 1, 1, 1, 1,
0.5159823, -1.022599, 1.879423, 1, 1, 1, 1, 1,
0.5186057, -0.820195, 1.547442, 1, 1, 1, 1, 1,
0.5194672, 0.2224509, 1.403634, 1, 1, 1, 1, 1,
0.5204728, -1.448868, 2.802083, 1, 1, 1, 1, 1,
0.5240494, -1.204016, 3.930078, 1, 1, 1, 1, 1,
0.5280495, -0.427549, 2.281241, 0, 0, 1, 1, 1,
0.5312532, -0.856912, 3.125431, 1, 0, 0, 1, 1,
0.5340086, 1.389295, -0.2008777, 1, 0, 0, 1, 1,
0.5340541, 0.8654076, -0.02967411, 1, 0, 0, 1, 1,
0.5400488, -1.532705, 1.912779, 1, 0, 0, 1, 1,
0.5429576, -1.911555, 0.8529233, 1, 0, 0, 1, 1,
0.5459072, 1.307699, -2.088919, 0, 0, 0, 1, 1,
0.5494098, 0.8357148, 0.2144479, 0, 0, 0, 1, 1,
0.5497614, 1.601365, 0.4900447, 0, 0, 0, 1, 1,
0.5505231, -0.2026529, 2.773823, 0, 0, 0, 1, 1,
0.5521826, -0.6314712, 2.432785, 0, 0, 0, 1, 1,
0.5539868, 0.6808677, -0.5863427, 0, 0, 0, 1, 1,
0.556434, -1.611747, 2.251985, 0, 0, 0, 1, 1,
0.5575942, -1.072876, 4.021243, 1, 1, 1, 1, 1,
0.5637293, -0.4920432, 1.676568, 1, 1, 1, 1, 1,
0.5672638, -0.9026885, 2.413483, 1, 1, 1, 1, 1,
0.5705845, -0.9656347, 1.646656, 1, 1, 1, 1, 1,
0.5706856, -0.8054335, 3.12183, 1, 1, 1, 1, 1,
0.5713919, -1.025448, 3.214831, 1, 1, 1, 1, 1,
0.5752495, 1.209108, -0.6211902, 1, 1, 1, 1, 1,
0.5770393, 1.160423, 1.262822, 1, 1, 1, 1, 1,
0.5795888, -1.49154, 3.165551, 1, 1, 1, 1, 1,
0.5810027, 0.9892399, 1.394427, 1, 1, 1, 1, 1,
0.5848523, 0.2367541, 1.565269, 1, 1, 1, 1, 1,
0.5950787, 0.6546759, 1.689905, 1, 1, 1, 1, 1,
0.5964876, 0.689399, 0.965308, 1, 1, 1, 1, 1,
0.5996705, 0.5256553, 1.952298, 1, 1, 1, 1, 1,
0.6046584, -1.379758, 3.264969, 1, 1, 1, 1, 1,
0.6062466, 1.176122, -0.01756935, 0, 0, 1, 1, 1,
0.6072089, 1.60589, 1.100515, 1, 0, 0, 1, 1,
0.6082326, 0.6485795, 1.751922, 1, 0, 0, 1, 1,
0.6086096, 0.8808545, 0.09568805, 1, 0, 0, 1, 1,
0.6096749, -0.773392, 1.577908, 1, 0, 0, 1, 1,
0.6111348, -0.1881042, 1.246184, 1, 0, 0, 1, 1,
0.6114961, 0.1135346, 1.716997, 0, 0, 0, 1, 1,
0.6125775, -0.07957259, 2.99474, 0, 0, 0, 1, 1,
0.6133291, 1.588425, 0.600234, 0, 0, 0, 1, 1,
0.6194016, 0.2413239, 1.856855, 0, 0, 0, 1, 1,
0.628205, 0.7485183, 0.7197317, 0, 0, 0, 1, 1,
0.6307223, 1.058694, 0.6683291, 0, 0, 0, 1, 1,
0.6315686, -0.5007919, 2.105603, 0, 0, 0, 1, 1,
0.6400249, -0.5206723, 3.484392, 1, 1, 1, 1, 1,
0.6411483, 0.7065922, 1.450481, 1, 1, 1, 1, 1,
0.6432184, -1.020272, 2.998567, 1, 1, 1, 1, 1,
0.6450372, -0.1296443, 3.040236, 1, 1, 1, 1, 1,
0.6450945, -0.1725923, 1.342142, 1, 1, 1, 1, 1,
0.6475545, -0.582007, 2.132763, 1, 1, 1, 1, 1,
0.6500581, 0.4770068, 0.4860943, 1, 1, 1, 1, 1,
0.6541326, 0.7158393, 1.380813, 1, 1, 1, 1, 1,
0.6566535, -1.484284, 4.838827, 1, 1, 1, 1, 1,
0.6651303, -0.4612301, 1.912097, 1, 1, 1, 1, 1,
0.6655325, 1.473099, 1.195497, 1, 1, 1, 1, 1,
0.6661818, -0.4152334, 2.758041, 1, 1, 1, 1, 1,
0.6666114, -1.076712, 2.902196, 1, 1, 1, 1, 1,
0.6679091, 0.6327851, 1.448421, 1, 1, 1, 1, 1,
0.6691617, -0.4265094, 4.626637, 1, 1, 1, 1, 1,
0.6782587, 0.09435948, 1.143554, 0, 0, 1, 1, 1,
0.6801506, 0.6751123, 1.934966, 1, 0, 0, 1, 1,
0.6895394, 0.5101779, 1.885182, 1, 0, 0, 1, 1,
0.6934446, 2.856632, 0.8730683, 1, 0, 0, 1, 1,
0.6965699, -2.595227, 3.434363, 1, 0, 0, 1, 1,
0.6979155, 1.2657, -0.5042053, 1, 0, 0, 1, 1,
0.699205, 0.4721362, 0.3519563, 0, 0, 0, 1, 1,
0.702238, 0.1187699, 0.572495, 0, 0, 0, 1, 1,
0.7079999, -0.2477479, 1.910005, 0, 0, 0, 1, 1,
0.7124032, -0.682893, 3.557313, 0, 0, 0, 1, 1,
0.7126378, 0.5363061, 1.618942, 0, 0, 0, 1, 1,
0.7243817, -1.12745, 3.050697, 0, 0, 0, 1, 1,
0.7317096, 0.2440294, 2.567724, 0, 0, 0, 1, 1,
0.7341352, -0.6567451, 2.06239, 1, 1, 1, 1, 1,
0.7381381, 0.07325236, 2.277385, 1, 1, 1, 1, 1,
0.7513594, -1.188819, 0.1641637, 1, 1, 1, 1, 1,
0.753135, -0.7657893, 2.885435, 1, 1, 1, 1, 1,
0.7532749, 0.1610126, 0.5336329, 1, 1, 1, 1, 1,
0.753861, -1.463575, 1.079238, 1, 1, 1, 1, 1,
0.755971, -0.7752628, 1.060967, 1, 1, 1, 1, 1,
0.7579733, 0.68018, -0.2754785, 1, 1, 1, 1, 1,
0.7679576, -0.1446885, 3.142414, 1, 1, 1, 1, 1,
0.769706, -0.02948198, 1.614408, 1, 1, 1, 1, 1,
0.7706314, -0.800441, 0.7245064, 1, 1, 1, 1, 1,
0.7709584, -1.474927, 2.239296, 1, 1, 1, 1, 1,
0.7726008, 0.4317556, 0.007972553, 1, 1, 1, 1, 1,
0.7730766, -0.2817617, 2.488523, 1, 1, 1, 1, 1,
0.7800811, -0.3947015, 3.64962, 1, 1, 1, 1, 1,
0.7801874, 0.2122228, 0.7765259, 0, 0, 1, 1, 1,
0.7810255, -1.113637, 2.350907, 1, 0, 0, 1, 1,
0.7860735, 1.37654, 1.017141, 1, 0, 0, 1, 1,
0.7904845, 0.4602201, 1.177905, 1, 0, 0, 1, 1,
0.802294, 1.535946, 0.8404891, 1, 0, 0, 1, 1,
0.8027606, -0.5407103, 2.002793, 1, 0, 0, 1, 1,
0.8038889, -0.3851167, 3.095997, 0, 0, 0, 1, 1,
0.8076618, 0.2900099, 2.626624, 0, 0, 0, 1, 1,
0.8201362, 0.4743, 0.8745375, 0, 0, 0, 1, 1,
0.8211783, -1.161783, 3.412579, 0, 0, 0, 1, 1,
0.8256497, 0.3285507, 1.509478, 0, 0, 0, 1, 1,
0.8265831, 0.2187413, 1.203806, 0, 0, 0, 1, 1,
0.8286447, -1.989833, 0.9741903, 0, 0, 0, 1, 1,
0.8288229, 1.122817, 0.6134906, 1, 1, 1, 1, 1,
0.8298939, 2.071615, -1.049933, 1, 1, 1, 1, 1,
0.8365551, -1.808476, 3.448076, 1, 1, 1, 1, 1,
0.8415856, 1.147909, 1.921429, 1, 1, 1, 1, 1,
0.8420579, -0.5413018, 3.075019, 1, 1, 1, 1, 1,
0.8427671, 1.070455, 0.386919, 1, 1, 1, 1, 1,
0.853512, 0.06281013, 3.130064, 1, 1, 1, 1, 1,
0.8565195, -0.533704, 2.090099, 1, 1, 1, 1, 1,
0.858161, -0.2239467, 2.228721, 1, 1, 1, 1, 1,
0.860441, 0.5777147, 1.234574, 1, 1, 1, 1, 1,
0.8678074, -0.01220459, 1.992569, 1, 1, 1, 1, 1,
0.8734504, 0.8678627, 1.312823, 1, 1, 1, 1, 1,
0.8783144, 0.1925345, 0.5989003, 1, 1, 1, 1, 1,
0.8788756, 0.09185819, 1.777718, 1, 1, 1, 1, 1,
0.8810303, -0.9417092, 1.512467, 1, 1, 1, 1, 1,
0.8854232, -1.26882, 2.780939, 0, 0, 1, 1, 1,
0.8899951, -0.2696811, 2.053421, 1, 0, 0, 1, 1,
0.8910652, 0.003001931, 2.166208, 1, 0, 0, 1, 1,
0.8962215, -0.3273618, 0.1435666, 1, 0, 0, 1, 1,
0.9011641, -0.8291344, 1.1917, 1, 0, 0, 1, 1,
0.9013075, -0.3223924, 2.927985, 1, 0, 0, 1, 1,
0.901549, 0.3524477, 1.627142, 0, 0, 0, 1, 1,
0.9066831, -0.2276168, 2.004414, 0, 0, 0, 1, 1,
0.9079885, 1.397449, -0.783816, 0, 0, 0, 1, 1,
0.9082279, -0.3967344, 3.667469, 0, 0, 0, 1, 1,
0.912611, 0.4496034, 1.841744, 0, 0, 0, 1, 1,
0.9128926, 0.01603879, 2.079159, 0, 0, 0, 1, 1,
0.9148386, 0.7611163, 0.6897139, 0, 0, 0, 1, 1,
0.9179525, -1.534879, 0.7280725, 1, 1, 1, 1, 1,
0.9265692, 1.036088, 0.8432507, 1, 1, 1, 1, 1,
0.9279764, -0.8693449, 2.214556, 1, 1, 1, 1, 1,
0.9380414, 0.6682912, 1.536615, 1, 1, 1, 1, 1,
0.9390545, 2.088283, 0.1250022, 1, 1, 1, 1, 1,
0.9410841, 0.7656631, -0.1033978, 1, 1, 1, 1, 1,
0.9460473, 0.3461036, 1.826606, 1, 1, 1, 1, 1,
0.9469762, 0.3749753, 0.1342087, 1, 1, 1, 1, 1,
0.9559656, -1.024648, 1.666171, 1, 1, 1, 1, 1,
0.9626697, 0.5739976, 0.9825542, 1, 1, 1, 1, 1,
0.9631205, 0.2868731, 2.150885, 1, 1, 1, 1, 1,
0.9703204, -0.9105527, 3.006134, 1, 1, 1, 1, 1,
0.9815195, 0.3714015, 1.580759, 1, 1, 1, 1, 1,
0.9844638, 2.626531, 1.880904, 1, 1, 1, 1, 1,
0.9885603, 1.20153, 0.6196367, 1, 1, 1, 1, 1,
0.9886807, 0.8819353, -0.9096287, 0, 0, 1, 1, 1,
0.9970091, 1.203992, 0.6892324, 1, 0, 0, 1, 1,
1.004262, 0.5932672, 2.384179, 1, 0, 0, 1, 1,
1.005067, -0.3927417, 1.839636, 1, 0, 0, 1, 1,
1.014291, 0.09999958, 1.276082, 1, 0, 0, 1, 1,
1.014948, -1.043375, 2.644374, 1, 0, 0, 1, 1,
1.018193, 2.072215, 1.540211, 0, 0, 0, 1, 1,
1.020482, -1.435409, 2.866301, 0, 0, 0, 1, 1,
1.023532, -0.7801483, 2.348418, 0, 0, 0, 1, 1,
1.026674, 0.03990475, 1.412967, 0, 0, 0, 1, 1,
1.027311, 0.07283987, 2.957207, 0, 0, 0, 1, 1,
1.031775, 0.9342982, 0.5464963, 0, 0, 0, 1, 1,
1.032102, -0.8609159, 2.599585, 0, 0, 0, 1, 1,
1.03697, 0.4261961, 0.6437894, 1, 1, 1, 1, 1,
1.041504, -1.311659, 1.620922, 1, 1, 1, 1, 1,
1.044453, -1.262521, 2.80363, 1, 1, 1, 1, 1,
1.049689, -0.233063, 1.702561, 1, 1, 1, 1, 1,
1.061437, -0.439967, 0.4321704, 1, 1, 1, 1, 1,
1.065632, 0.5115231, 1.734315, 1, 1, 1, 1, 1,
1.066857, -0.3134196, 0.04147377, 1, 1, 1, 1, 1,
1.070809, 0.5315669, 1.041598, 1, 1, 1, 1, 1,
1.072088, -0.5482276, 3.700236, 1, 1, 1, 1, 1,
1.076457, -0.1223673, 3.364635, 1, 1, 1, 1, 1,
1.081712, 1.343342, -0.8686002, 1, 1, 1, 1, 1,
1.087653, 0.8798246, 0.5736403, 1, 1, 1, 1, 1,
1.08875, -0.7481412, 1.39665, 1, 1, 1, 1, 1,
1.089364, -1.372387, 1.306068, 1, 1, 1, 1, 1,
1.112387, -2.685307, 4.132537, 1, 1, 1, 1, 1,
1.114117, 0.5788119, 1.820859, 0, 0, 1, 1, 1,
1.115241, 0.1206881, 0.211991, 1, 0, 0, 1, 1,
1.117693, -1.428507, 0.9741392, 1, 0, 0, 1, 1,
1.124808, -0.3080256, -0.09143072, 1, 0, 0, 1, 1,
1.126877, 0.3176576, 1.783375, 1, 0, 0, 1, 1,
1.131758, -0.7290221, 0.3798845, 1, 0, 0, 1, 1,
1.131838, 1.947961, 0.3059835, 0, 0, 0, 1, 1,
1.136782, -0.3536755, 1.840981, 0, 0, 0, 1, 1,
1.140611, -1.265177, 3.480317, 0, 0, 0, 1, 1,
1.144092, 0.818131, 2.393674, 0, 0, 0, 1, 1,
1.146434, -1.025231, 1.694457, 0, 0, 0, 1, 1,
1.148627, -0.5430174, 2.351484, 0, 0, 0, 1, 1,
1.155934, -0.5695772, 3.201131, 0, 0, 0, 1, 1,
1.163136, -0.561236, 1.893768, 1, 1, 1, 1, 1,
1.166348, 0.7309811, 0.1486213, 1, 1, 1, 1, 1,
1.17583, -0.1143062, 0.6937163, 1, 1, 1, 1, 1,
1.179432, -1.17509, 3.976019, 1, 1, 1, 1, 1,
1.181057, 0.8305619, 2.266768, 1, 1, 1, 1, 1,
1.181919, 1.969356, 1.699957, 1, 1, 1, 1, 1,
1.184168, 0.6936034, 1.649016, 1, 1, 1, 1, 1,
1.191258, 0.9004536, 2.539983, 1, 1, 1, 1, 1,
1.196776, 0.135205, 1.682992, 1, 1, 1, 1, 1,
1.209614, 1.633391, 1.685645, 1, 1, 1, 1, 1,
1.215614, -2.375073, 2.380944, 1, 1, 1, 1, 1,
1.21998, 1.588821, -0.1087667, 1, 1, 1, 1, 1,
1.223073, 0.9016824, 0.378721, 1, 1, 1, 1, 1,
1.227327, -0.6989232, 3.130767, 1, 1, 1, 1, 1,
1.227619, 0.4361734, 1.135546, 1, 1, 1, 1, 1,
1.230407, 0.4181173, 1.8221, 0, 0, 1, 1, 1,
1.234631, 0.830985, 1.346268, 1, 0, 0, 1, 1,
1.238739, -0.5253481, 1.947025, 1, 0, 0, 1, 1,
1.239174, -1.955757, 1.89176, 1, 0, 0, 1, 1,
1.243577, -0.5369469, 2.582272, 1, 0, 0, 1, 1,
1.249532, -0.22573, 3.827616, 1, 0, 0, 1, 1,
1.251707, -0.1886741, 1.908981, 0, 0, 0, 1, 1,
1.254807, 0.3458289, 2.214554, 0, 0, 0, 1, 1,
1.255436, -1.208525, 1.654025, 0, 0, 0, 1, 1,
1.25705, 0.9840555, 1.205047, 0, 0, 0, 1, 1,
1.263564, -0.9063848, 2.435819, 0, 0, 0, 1, 1,
1.270169, -0.1749415, -0.2999036, 0, 0, 0, 1, 1,
1.288823, 0.9363717, 1.441456, 0, 0, 0, 1, 1,
1.293304, 1.419636, 0.7863331, 1, 1, 1, 1, 1,
1.299778, -0.993752, 1.776477, 1, 1, 1, 1, 1,
1.30627, 0.8894871, 0.9093549, 1, 1, 1, 1, 1,
1.308921, -0.09897912, 0.7428266, 1, 1, 1, 1, 1,
1.309656, -0.5649725, 1.631684, 1, 1, 1, 1, 1,
1.315662, 1.651721, 2.509882, 1, 1, 1, 1, 1,
1.319111, 1.232256, 0.885541, 1, 1, 1, 1, 1,
1.326984, 0.5676487, 2.512347, 1, 1, 1, 1, 1,
1.327905, -0.3478694, 1.130685, 1, 1, 1, 1, 1,
1.32946, -0.2916858, 2.904419, 1, 1, 1, 1, 1,
1.340393, -1.218031, 1.648788, 1, 1, 1, 1, 1,
1.346918, 0.07587691, 0.4542103, 1, 1, 1, 1, 1,
1.351619, 0.4315369, 0.6260087, 1, 1, 1, 1, 1,
1.359568, 0.9794232, 0.3079537, 1, 1, 1, 1, 1,
1.382984, 0.2845109, 1.141561, 1, 1, 1, 1, 1,
1.392554, -0.1502761, 0.6620047, 0, 0, 1, 1, 1,
1.395641, -0.4695294, 2.270686, 1, 0, 0, 1, 1,
1.409674, 0.3616837, -0.1733901, 1, 0, 0, 1, 1,
1.416421, 1.324152, 0.05808104, 1, 0, 0, 1, 1,
1.431591, 0.2518011, -0.3450362, 1, 0, 0, 1, 1,
1.432022, 0.3365775, 0.6681063, 1, 0, 0, 1, 1,
1.442882, -1.30991, 1.85736, 0, 0, 0, 1, 1,
1.446571, -1.159361, 2.983953, 0, 0, 0, 1, 1,
1.447966, 0.9914587, 0.6379182, 0, 0, 0, 1, 1,
1.449382, 2.458626, 0.1112537, 0, 0, 0, 1, 1,
1.460802, 0.9798378, -0.2796655, 0, 0, 0, 1, 1,
1.482899, 0.0219108, 0.4671051, 0, 0, 0, 1, 1,
1.540029, 0.6313084, 1.588342, 0, 0, 0, 1, 1,
1.543962, 0.3311697, 2.09165, 1, 1, 1, 1, 1,
1.547125, -0.2577334, 2.614905, 1, 1, 1, 1, 1,
1.55175, 1.012575, 0.8683571, 1, 1, 1, 1, 1,
1.554695, 0.6295018, 0.8162339, 1, 1, 1, 1, 1,
1.56177, -0.9978592, 3.320132, 1, 1, 1, 1, 1,
1.564178, 2.550199, -0.7211445, 1, 1, 1, 1, 1,
1.580226, -0.8686316, 0.6959908, 1, 1, 1, 1, 1,
1.591523, 1.631869, -0.3931661, 1, 1, 1, 1, 1,
1.593512, 0.3200233, 2.189054, 1, 1, 1, 1, 1,
1.595573, 0.1380084, 2.369387, 1, 1, 1, 1, 1,
1.597663, -0.7678441, 1.58536, 1, 1, 1, 1, 1,
1.629706, 0.1477615, 1.611777, 1, 1, 1, 1, 1,
1.631686, 1.365262, 2.065802, 1, 1, 1, 1, 1,
1.64149, 1.243289, -0.1086827, 1, 1, 1, 1, 1,
1.642996, -1.463722, 2.95268, 1, 1, 1, 1, 1,
1.668181, 0.8701661, 1.619643, 0, 0, 1, 1, 1,
1.671935, -1.305078, 1.621961, 1, 0, 0, 1, 1,
1.700319, 0.1884818, 2.344991, 1, 0, 0, 1, 1,
1.701174, 1.45065, -0.2515657, 1, 0, 0, 1, 1,
1.741895, -0.2536676, 3.192064, 1, 0, 0, 1, 1,
1.757187, 1.096177, 1.999238, 1, 0, 0, 1, 1,
1.766592, -0.1569465, 2.005873, 0, 0, 0, 1, 1,
1.775927, -1.327733, 1.35859, 0, 0, 0, 1, 1,
1.791496, -1.15375, 2.651944, 0, 0, 0, 1, 1,
1.797311, -0.2299137, 1.191585, 0, 0, 0, 1, 1,
1.797402, -1.206688, 1.335634, 0, 0, 0, 1, 1,
1.798294, -0.009059557, 3.259196, 0, 0, 0, 1, 1,
1.798379, -0.6043326, -0.04462975, 0, 0, 0, 1, 1,
1.801105, -0.4793935, 0.02283767, 1, 1, 1, 1, 1,
1.809608, 0.4898646, -0.4669087, 1, 1, 1, 1, 1,
1.819221, 1.04156, 1.015015, 1, 1, 1, 1, 1,
1.827653, 0.7057238, 0.3531666, 1, 1, 1, 1, 1,
1.839398, -0.8697031, 3.150523, 1, 1, 1, 1, 1,
1.844357, -0.9158849, 1.109009, 1, 1, 1, 1, 1,
1.844909, 0.2373559, 1.829178, 1, 1, 1, 1, 1,
1.849925, -0.8302029, 1.136783, 1, 1, 1, 1, 1,
1.850933, 1.198262, 2.549853, 1, 1, 1, 1, 1,
1.883328, 0.0969226, 3.005408, 1, 1, 1, 1, 1,
1.889675, 0.01257024, 3.562804, 1, 1, 1, 1, 1,
1.911648, 1.523962, 1.224281, 1, 1, 1, 1, 1,
1.915661, -1.089498, 2.613353, 1, 1, 1, 1, 1,
1.918525, 1.735904, 0.1325671, 1, 1, 1, 1, 1,
1.931997, -0.2781972, 1.225959, 1, 1, 1, 1, 1,
1.937565, -1.050717, 2.525838, 0, 0, 1, 1, 1,
2.014116, 0.9487939, 0.4335632, 1, 0, 0, 1, 1,
2.015518, -1.180276, 1.917473, 1, 0, 0, 1, 1,
2.016595, 0.4320044, 0.4981737, 1, 0, 0, 1, 1,
2.03322, -0.08189056, 0.2686495, 1, 0, 0, 1, 1,
2.035274, 0.8213408, 1.825789, 1, 0, 0, 1, 1,
2.143329, -1.009784, 1.798073, 0, 0, 0, 1, 1,
2.188006, -0.3856675, 1.477638, 0, 0, 0, 1, 1,
2.198939, 1.28562, 0.22309, 0, 0, 0, 1, 1,
2.235806, -0.2345162, 2.392898, 0, 0, 0, 1, 1,
2.298975, 0.9346967, 2.851138, 0, 0, 0, 1, 1,
2.377703, 0.2574678, 1.075127, 0, 0, 0, 1, 1,
2.545788, -2.811072, 1.982657, 0, 0, 0, 1, 1,
2.549796, 0.1828078, 2.235357, 1, 1, 1, 1, 1,
2.661964, -0.4764007, 2.004266, 1, 1, 1, 1, 1,
2.70593, 0.1247244, 2.750481, 1, 1, 1, 1, 1,
2.81886, -0.9056594, 3.872487, 1, 1, 1, 1, 1,
2.86562, 0.790716, 2.353659, 1, 1, 1, 1, 1,
3.074573, 0.6472425, 1.501603, 1, 1, 1, 1, 1,
3.600373, 0.1934675, 0.7061519, 1, 1, 1, 1, 1
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
var radius = 9.798645;
var distance = 34.41732;
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
mvMatrix.translate( -0.2518468, -0.305294, 0.304332 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41732);
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
