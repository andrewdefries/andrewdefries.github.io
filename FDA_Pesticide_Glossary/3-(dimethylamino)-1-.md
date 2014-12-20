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
-3.185018, -0.3462634, -4.138939, 1, 0, 0, 1,
-3.051741, 1.133912, -1.600706, 1, 0.007843138, 0, 1,
-2.562433, -0.7403423, -2.702514, 1, 0.01176471, 0, 1,
-2.552509, 1.08816, -0.9671218, 1, 0.01960784, 0, 1,
-2.533108, -0.2085161, -2.395561, 1, 0.02352941, 0, 1,
-2.506116, -0.9797371, -1.426005, 1, 0.03137255, 0, 1,
-2.437875, 0.8758187, -3.231274, 1, 0.03529412, 0, 1,
-2.388643, -0.918364, 0.546177, 1, 0.04313726, 0, 1,
-2.387625, -0.3325345, -0.7717483, 1, 0.04705882, 0, 1,
-2.336446, 0.40121, -2.229149, 1, 0.05490196, 0, 1,
-2.222127, 1.037934, -0.8604929, 1, 0.05882353, 0, 1,
-2.126511, 0.01921399, -3.106657, 1, 0.06666667, 0, 1,
-2.112344, -1.395497, -2.595991, 1, 0.07058824, 0, 1,
-2.014964, 1.72106, -2.058042, 1, 0.07843138, 0, 1,
-1.979195, -0.009276134, -0.5593361, 1, 0.08235294, 0, 1,
-1.972497, -1.599083, -2.897824, 1, 0.09019608, 0, 1,
-1.967834, -2.013326, -1.337702, 1, 0.09411765, 0, 1,
-1.926682, 0.4231035, -0.7761918, 1, 0.1019608, 0, 1,
-1.923837, -0.01579327, -0.2754454, 1, 0.1098039, 0, 1,
-1.891296, 0.1629241, -1.86625, 1, 0.1137255, 0, 1,
-1.8568, -0.5453294, 0.7567126, 1, 0.1215686, 0, 1,
-1.847503, -0.08003538, -1.868809, 1, 0.1254902, 0, 1,
-1.836508, 0.8104063, -0.2790971, 1, 0.1333333, 0, 1,
-1.810486, 1.806904, -1.587924, 1, 0.1372549, 0, 1,
-1.809106, 0.664258, -1.827537, 1, 0.145098, 0, 1,
-1.797566, 0.1393415, -2.435938, 1, 0.1490196, 0, 1,
-1.741995, 0.7442842, -2.154792, 1, 0.1568628, 0, 1,
-1.740953, 0.8538083, -0.7015531, 1, 0.1607843, 0, 1,
-1.73705, -0.3355578, -1.953588, 1, 0.1686275, 0, 1,
-1.73098, -1.011076, -2.155336, 1, 0.172549, 0, 1,
-1.730517, -0.9532342, -2.855944, 1, 0.1803922, 0, 1,
-1.726021, 0.6907303, -2.615524, 1, 0.1843137, 0, 1,
-1.725538, -0.4877372, -0.5460542, 1, 0.1921569, 0, 1,
-1.725411, 1.391301, -2.207842, 1, 0.1960784, 0, 1,
-1.701958, -1.063224, -2.475335, 1, 0.2039216, 0, 1,
-1.681258, -0.1835501, -1.797551, 1, 0.2117647, 0, 1,
-1.660863, -0.8930701, -2.821463, 1, 0.2156863, 0, 1,
-1.656844, -1.098714, -3.591218, 1, 0.2235294, 0, 1,
-1.651399, -2.445037, -2.841317, 1, 0.227451, 0, 1,
-1.636135, 0.5240852, 0.1066845, 1, 0.2352941, 0, 1,
-1.627503, -0.44994, -1.03505, 1, 0.2392157, 0, 1,
-1.626987, 0.5657646, -0.1573384, 1, 0.2470588, 0, 1,
-1.626927, -0.080261, -2.852379, 1, 0.2509804, 0, 1,
-1.622828, 0.7451255, 0.3376166, 1, 0.2588235, 0, 1,
-1.583691, -1.610959, -0.7560573, 1, 0.2627451, 0, 1,
-1.571446, 1.45328, 0.323335, 1, 0.2705882, 0, 1,
-1.566889, -0.340669, -2.112328, 1, 0.2745098, 0, 1,
-1.566855, 0.8355408, -1.983409, 1, 0.282353, 0, 1,
-1.565198, -0.07507394, -1.43673, 1, 0.2862745, 0, 1,
-1.554563, -1.214327, -1.707999, 1, 0.2941177, 0, 1,
-1.549746, -1.184683, -1.736682, 1, 0.3019608, 0, 1,
-1.541087, 0.300466, -2.165689, 1, 0.3058824, 0, 1,
-1.54029, 0.5834866, -3.126518, 1, 0.3137255, 0, 1,
-1.536285, -0.2043889, -1.836806, 1, 0.3176471, 0, 1,
-1.53321, -0.3186922, -1.364913, 1, 0.3254902, 0, 1,
-1.517938, -0.5710619, -1.72437, 1, 0.3294118, 0, 1,
-1.517472, 0.4268132, -1.527307, 1, 0.3372549, 0, 1,
-1.51701, -1.494607, -2.273542, 1, 0.3411765, 0, 1,
-1.504303, 0.5218182, -3.547519, 1, 0.3490196, 0, 1,
-1.493653, 0.7124047, -1.013845, 1, 0.3529412, 0, 1,
-1.48808, 0.4615456, 0.1083, 1, 0.3607843, 0, 1,
-1.477331, -0.3674489, -2.077869, 1, 0.3647059, 0, 1,
-1.473708, 0.3304535, -1.317623, 1, 0.372549, 0, 1,
-1.449196, 0.1673168, -1.422149, 1, 0.3764706, 0, 1,
-1.445057, 0.90584, 0.5566419, 1, 0.3843137, 0, 1,
-1.441391, -1.350569, -2.383817, 1, 0.3882353, 0, 1,
-1.431503, 0.8815422, 0.6479148, 1, 0.3960784, 0, 1,
-1.430005, -2.112969, -2.832237, 1, 0.4039216, 0, 1,
-1.428731, -1.095225, -2.70145, 1, 0.4078431, 0, 1,
-1.422694, -0.09132724, -1.62831, 1, 0.4156863, 0, 1,
-1.414709, -1.434732, -2.898016, 1, 0.4196078, 0, 1,
-1.413408, -1.817806, -3.356457, 1, 0.427451, 0, 1,
-1.387556, -0.962188, -3.75468, 1, 0.4313726, 0, 1,
-1.374557, 0.277797, -0.7002401, 1, 0.4392157, 0, 1,
-1.356879, 0.8861513, -0.8288584, 1, 0.4431373, 0, 1,
-1.355844, -0.9312347, -1.226719, 1, 0.4509804, 0, 1,
-1.355294, 1.64364, -0.1118458, 1, 0.454902, 0, 1,
-1.354946, -0.9732674, -3.304925, 1, 0.4627451, 0, 1,
-1.353322, 0.2296949, -0.6674264, 1, 0.4666667, 0, 1,
-1.345772, -0.9889417, -3.340914, 1, 0.4745098, 0, 1,
-1.338724, -0.4077273, -0.7953206, 1, 0.4784314, 0, 1,
-1.335811, 1.912542, 1.162333, 1, 0.4862745, 0, 1,
-1.332796, -1.717227, -3.260638, 1, 0.4901961, 0, 1,
-1.326607, -0.5634957, -2.026052, 1, 0.4980392, 0, 1,
-1.289244, -0.5268144, -1.169309, 1, 0.5058824, 0, 1,
-1.276371, 0.06629841, 0.3694507, 1, 0.509804, 0, 1,
-1.269405, 1.002259, -0.4715185, 1, 0.5176471, 0, 1,
-1.263839, 0.4251474, 0.6713701, 1, 0.5215687, 0, 1,
-1.263348, -1.309154, -4.215281, 1, 0.5294118, 0, 1,
-1.259697, -1.73054, -1.739153, 1, 0.5333334, 0, 1,
-1.241092, 0.8935729, -0.1151269, 1, 0.5411765, 0, 1,
-1.238848, 0.8699527, -1.47024, 1, 0.5450981, 0, 1,
-1.219944, 0.7924652, -1.071682, 1, 0.5529412, 0, 1,
-1.219819, 0.5513098, -2.510297, 1, 0.5568628, 0, 1,
-1.217053, -1.729071, -3.78889, 1, 0.5647059, 0, 1,
-1.213412, 0.926403, -2.082269, 1, 0.5686275, 0, 1,
-1.209235, -0.02847459, -2.097309, 1, 0.5764706, 0, 1,
-1.206774, -0.4378029, -1.697165, 1, 0.5803922, 0, 1,
-1.193181, -0.1896348, -1.784593, 1, 0.5882353, 0, 1,
-1.19173, -0.6665909, -2.978357, 1, 0.5921569, 0, 1,
-1.191239, -0.2248909, -2.062147, 1, 0.6, 0, 1,
-1.187251, -0.995622, -1.917628, 1, 0.6078432, 0, 1,
-1.18711, -0.470731, -2.692886, 1, 0.6117647, 0, 1,
-1.174942, -0.1353852, -2.506863, 1, 0.6196079, 0, 1,
-1.173039, 0.9126821, -0.8136334, 1, 0.6235294, 0, 1,
-1.160237, 1.190584, -1.801406, 1, 0.6313726, 0, 1,
-1.156605, 1.189419, 0.3376394, 1, 0.6352941, 0, 1,
-1.156483, -0.6191935, -3.959253, 1, 0.6431373, 0, 1,
-1.144113, 0.6610937, -0.6129571, 1, 0.6470588, 0, 1,
-1.133924, 1.833316, 0.001742071, 1, 0.654902, 0, 1,
-1.127736, -0.003833413, -1.738158, 1, 0.6588235, 0, 1,
-1.122941, -1.13563, -1.767738, 1, 0.6666667, 0, 1,
-1.121197, 0.4178722, -2.300526, 1, 0.6705883, 0, 1,
-1.120155, -0.4493269, -1.534037, 1, 0.6784314, 0, 1,
-1.108659, -0.9494457, -2.53226, 1, 0.682353, 0, 1,
-1.107137, 2.515385, -1.010145, 1, 0.6901961, 0, 1,
-1.103293, -0.7948269, -1.861709, 1, 0.6941177, 0, 1,
-1.101269, -0.2982097, -0.08530198, 1, 0.7019608, 0, 1,
-1.100017, 0.4093128, -1.965587, 1, 0.7098039, 0, 1,
-1.099714, 0.7236283, -0.5635282, 1, 0.7137255, 0, 1,
-1.099287, -0.2512426, -2.241165, 1, 0.7215686, 0, 1,
-1.096647, -0.9997953, -2.275687, 1, 0.7254902, 0, 1,
-1.096197, -0.4780458, -0.29617, 1, 0.7333333, 0, 1,
-1.089187, -1.160499, -4.259622, 1, 0.7372549, 0, 1,
-1.085336, 0.7794075, -0.6881751, 1, 0.7450981, 0, 1,
-1.081687, -1.253701, -4.62386, 1, 0.7490196, 0, 1,
-1.079341, 0.2984273, -0.7638286, 1, 0.7568628, 0, 1,
-1.078587, 0.2766512, -3.230253, 1, 0.7607843, 0, 1,
-1.074327, 0.5477914, -2.33713, 1, 0.7686275, 0, 1,
-1.060348, -1.367644, -1.345762, 1, 0.772549, 0, 1,
-1.057173, -0.8631442, -3.399952, 1, 0.7803922, 0, 1,
-1.057032, 1.202538, 0.1127028, 1, 0.7843137, 0, 1,
-1.05221, -0.3840942, -2.068885, 1, 0.7921569, 0, 1,
-1.04933, 0.01562066, -2.441127, 1, 0.7960784, 0, 1,
-1.044021, -0.07743956, -2.178518, 1, 0.8039216, 0, 1,
-1.038035, 1.390354, 0.3684334, 1, 0.8117647, 0, 1,
-1.037778, 2.115639, 0.03609978, 1, 0.8156863, 0, 1,
-1.034831, 0.05060633, -2.940482, 1, 0.8235294, 0, 1,
-1.028633, 1.90852, -0.4220358, 1, 0.827451, 0, 1,
-1.027477, -1.768726, -1.410961, 1, 0.8352941, 0, 1,
-1.026569, 0.158532, -0.798582, 1, 0.8392157, 0, 1,
-1.02148, 1.172702, -0.4801037, 1, 0.8470588, 0, 1,
-1.016406, 1.61146, -1.980719, 1, 0.8509804, 0, 1,
-1.015714, 0.4109396, -0.8754721, 1, 0.8588235, 0, 1,
-1.014713, 0.3453667, -0.5411585, 1, 0.8627451, 0, 1,
-1.00703, -0.5658715, -2.607223, 1, 0.8705882, 0, 1,
-0.9975438, -0.4454657, -2.298556, 1, 0.8745098, 0, 1,
-0.9967463, 0.1848948, -1.120206, 1, 0.8823529, 0, 1,
-0.9884712, -1.736144, -3.530305, 1, 0.8862745, 0, 1,
-0.9843845, -0.5533974, -2.241191, 1, 0.8941177, 0, 1,
-0.974374, 0.2763277, -0.6560638, 1, 0.8980392, 0, 1,
-0.9742845, -0.212441, -4.278857, 1, 0.9058824, 0, 1,
-0.9729927, 0.1597681, -1.049618, 1, 0.9137255, 0, 1,
-0.9681631, -0.04445919, -1.933081, 1, 0.9176471, 0, 1,
-0.9680611, 1.316109, 0.06234915, 1, 0.9254902, 0, 1,
-0.9665167, -0.4259615, -2.664145, 1, 0.9294118, 0, 1,
-0.9655491, -1.182828, -3.610987, 1, 0.9372549, 0, 1,
-0.9645466, -1.486082, -3.04344, 1, 0.9411765, 0, 1,
-0.9579068, 0.5318548, -0.7790334, 1, 0.9490196, 0, 1,
-0.9575918, -0.4841772, -1.706107, 1, 0.9529412, 0, 1,
-0.9542292, 1.240625, -2.548362, 1, 0.9607843, 0, 1,
-0.953403, 1.143419, -1.939338, 1, 0.9647059, 0, 1,
-0.9505031, 0.5201502, -1.413614, 1, 0.972549, 0, 1,
-0.95016, 1.16803, -0.9835811, 1, 0.9764706, 0, 1,
-0.9483016, 0.4202211, -3.436249, 1, 0.9843137, 0, 1,
-0.9419947, -1.028807, -1.914695, 1, 0.9882353, 0, 1,
-0.9414149, -0.2476383, -1.153532, 1, 0.9960784, 0, 1,
-0.9412474, -0.1809551, -0.01981321, 0.9960784, 1, 0, 1,
-0.9411806, 1.253073, -1.287509, 0.9921569, 1, 0, 1,
-0.9383496, 1.287091, -1.106208, 0.9843137, 1, 0, 1,
-0.928672, -2.254489, -3.72874, 0.9803922, 1, 0, 1,
-0.9208262, 1.308459, -2.73941, 0.972549, 1, 0, 1,
-0.9206498, -2.032002, -2.531767, 0.9686275, 1, 0, 1,
-0.9195608, 0.4695176, -0.4624318, 0.9607843, 1, 0, 1,
-0.9177613, -0.7147517, -1.798365, 0.9568627, 1, 0, 1,
-0.9163842, -0.1439428, -1.541505, 0.9490196, 1, 0, 1,
-0.9155418, 2.441583, -1.754102, 0.945098, 1, 0, 1,
-0.9058788, -0.6329988, -4.417789, 0.9372549, 1, 0, 1,
-0.9037076, -1.834235, -2.554353, 0.9333333, 1, 0, 1,
-0.8985471, 0.1863943, -0.4218194, 0.9254902, 1, 0, 1,
-0.8980966, -0.7083092, -2.387947, 0.9215686, 1, 0, 1,
-0.896081, 0.06175799, 1.399614, 0.9137255, 1, 0, 1,
-0.8936472, 0.4607383, -1.338927, 0.9098039, 1, 0, 1,
-0.8888731, -1.06768, -2.990201, 0.9019608, 1, 0, 1,
-0.8876821, 1.539894, -2.389599, 0.8941177, 1, 0, 1,
-0.8846229, 0.08841021, -0.8675943, 0.8901961, 1, 0, 1,
-0.8815329, -0.06058301, -1.542158, 0.8823529, 1, 0, 1,
-0.8808362, 0.971112, -3.90335, 0.8784314, 1, 0, 1,
-0.8796215, -0.6217953, -2.290595, 0.8705882, 1, 0, 1,
-0.8781302, 0.3614217, -1.793755, 0.8666667, 1, 0, 1,
-0.8757697, 0.6810979, 1.057737, 0.8588235, 1, 0, 1,
-0.8750468, 1.365195, -0.8014694, 0.854902, 1, 0, 1,
-0.8738374, 0.149613, -3.143606, 0.8470588, 1, 0, 1,
-0.8735214, 0.7176024, 0.1078347, 0.8431373, 1, 0, 1,
-0.8726311, 1.344313, -0.8800082, 0.8352941, 1, 0, 1,
-0.8681926, -0.2353331, -3.041454, 0.8313726, 1, 0, 1,
-0.8653596, -1.164867, -3.184335, 0.8235294, 1, 0, 1,
-0.8620822, 0.8719492, -0.8326231, 0.8196079, 1, 0, 1,
-0.8590188, -0.1298766, -3.253981, 0.8117647, 1, 0, 1,
-0.8584846, -1.571344, -5.254594, 0.8078431, 1, 0, 1,
-0.858452, 0.2020105, -2.492486, 0.8, 1, 0, 1,
-0.8555066, -0.5719306, -4.365674, 0.7921569, 1, 0, 1,
-0.8526474, 0.1207264, -0.7376473, 0.7882353, 1, 0, 1,
-0.8490494, -1.96219, -3.761972, 0.7803922, 1, 0, 1,
-0.8447102, -0.6854343, -3.58953, 0.7764706, 1, 0, 1,
-0.8433908, -0.7295458, -1.47593, 0.7686275, 1, 0, 1,
-0.8379164, 0.2231856, -1.475039, 0.7647059, 1, 0, 1,
-0.8373216, -0.2104249, -3.12048, 0.7568628, 1, 0, 1,
-0.8373027, 0.4769363, -2.207491, 0.7529412, 1, 0, 1,
-0.8372097, 0.2940929, -3.21779, 0.7450981, 1, 0, 1,
-0.8250704, -0.5602709, -3.558123, 0.7411765, 1, 0, 1,
-0.8204616, 0.352039, 0.1648366, 0.7333333, 1, 0, 1,
-0.8140088, -1.276369, -2.741011, 0.7294118, 1, 0, 1,
-0.8104496, 0.1451254, -1.146954, 0.7215686, 1, 0, 1,
-0.8086091, -0.7988853, -2.487854, 0.7176471, 1, 0, 1,
-0.8033519, 0.1805869, -2.393239, 0.7098039, 1, 0, 1,
-0.7987011, 0.2293204, 1.11711, 0.7058824, 1, 0, 1,
-0.7932633, -0.01586586, -2.363998, 0.6980392, 1, 0, 1,
-0.7930661, 0.5903248, -1.419505, 0.6901961, 1, 0, 1,
-0.7824432, 0.6583436, -0.205438, 0.6862745, 1, 0, 1,
-0.7816734, -0.5974721, -3.627689, 0.6784314, 1, 0, 1,
-0.78077, -1.431856, -4.101653, 0.6745098, 1, 0, 1,
-0.7741928, 0.2282006, -0.327074, 0.6666667, 1, 0, 1,
-0.7695217, -1.238186, -2.481947, 0.6627451, 1, 0, 1,
-0.7655207, 0.455684, -0.2967855, 0.654902, 1, 0, 1,
-0.7645648, 0.1933115, -1.259715, 0.6509804, 1, 0, 1,
-0.7630752, -0.9501867, -2.896651, 0.6431373, 1, 0, 1,
-0.7597358, -0.582684, -1.293559, 0.6392157, 1, 0, 1,
-0.758338, -2.995721, -3.08977, 0.6313726, 1, 0, 1,
-0.755949, 0.6262451, 0.02801275, 0.627451, 1, 0, 1,
-0.7540577, -1.432089, -5.015868, 0.6196079, 1, 0, 1,
-0.7460461, 0.7420865, -0.7906204, 0.6156863, 1, 0, 1,
-0.7445186, 1.001304, 1.243627, 0.6078432, 1, 0, 1,
-0.7418927, 1.185467, 1.759323, 0.6039216, 1, 0, 1,
-0.7376924, 0.3872448, -0.281847, 0.5960785, 1, 0, 1,
-0.7337228, 0.5923368, -0.672055, 0.5882353, 1, 0, 1,
-0.7309285, -0.4215791, -1.827327, 0.5843138, 1, 0, 1,
-0.727293, 0.1560085, -0.2342868, 0.5764706, 1, 0, 1,
-0.7264717, 0.9428835, -0.22943, 0.572549, 1, 0, 1,
-0.7254879, -0.4399415, -1.25604, 0.5647059, 1, 0, 1,
-0.7152379, 0.6037748, -2.323253, 0.5607843, 1, 0, 1,
-0.7145098, 0.3030837, -0.7619641, 0.5529412, 1, 0, 1,
-0.7096047, 1.763327, -1.302656, 0.5490196, 1, 0, 1,
-0.7073905, -0.7001262, -2.284791, 0.5411765, 1, 0, 1,
-0.7053156, -0.5228195, -2.575789, 0.5372549, 1, 0, 1,
-0.6976325, -0.7002117, -1.953655, 0.5294118, 1, 0, 1,
-0.6952927, -0.7307141, -3.588694, 0.5254902, 1, 0, 1,
-0.6811111, 0.5274979, 1.138823, 0.5176471, 1, 0, 1,
-0.6775928, -0.8997414, -4.146881, 0.5137255, 1, 0, 1,
-0.6754341, -0.4139604, -3.975238, 0.5058824, 1, 0, 1,
-0.6727628, -0.6982633, -3.219587, 0.5019608, 1, 0, 1,
-0.6720117, -0.7818455, -2.155564, 0.4941176, 1, 0, 1,
-0.666647, 0.7915046, -0.1660198, 0.4862745, 1, 0, 1,
-0.663013, 0.3366418, -2.546974, 0.4823529, 1, 0, 1,
-0.6623259, 1.711408, -2.549516, 0.4745098, 1, 0, 1,
-0.661698, 0.05695407, -1.691524, 0.4705882, 1, 0, 1,
-0.657343, -1.789347, -2.318297, 0.4627451, 1, 0, 1,
-0.6528853, 1.291789, -1.371486, 0.4588235, 1, 0, 1,
-0.6487845, -0.2179431, 0.2189513, 0.4509804, 1, 0, 1,
-0.6452723, -0.1899035, -1.976259, 0.4470588, 1, 0, 1,
-0.6449496, -0.2964458, -1.196496, 0.4392157, 1, 0, 1,
-0.6444672, -0.7593908, -2.199546, 0.4352941, 1, 0, 1,
-0.6436242, 0.09812836, -1.537836, 0.427451, 1, 0, 1,
-0.6404083, -0.4072427, -3.117939, 0.4235294, 1, 0, 1,
-0.6398419, -0.7037864, -3.592692, 0.4156863, 1, 0, 1,
-0.633235, -0.7309311, -3.43864, 0.4117647, 1, 0, 1,
-0.6328535, 0.3951758, -1.165497, 0.4039216, 1, 0, 1,
-0.6242929, 0.3853458, -0.08674645, 0.3960784, 1, 0, 1,
-0.6224244, 0.7841412, 0.07679918, 0.3921569, 1, 0, 1,
-0.6189033, 0.2290805, -1.504221, 0.3843137, 1, 0, 1,
-0.6174836, -0.8273359, -3.672274, 0.3803922, 1, 0, 1,
-0.6140207, -0.7170901, -2.731829, 0.372549, 1, 0, 1,
-0.6083491, 0.3901193, -2.591655, 0.3686275, 1, 0, 1,
-0.6052042, 0.5186835, -1.959512, 0.3607843, 1, 0, 1,
-0.6047134, 0.9382402, -1.866045, 0.3568628, 1, 0, 1,
-0.6035537, -0.1920347, -1.241375, 0.3490196, 1, 0, 1,
-0.6023017, -0.9658963, -3.324548, 0.345098, 1, 0, 1,
-0.5985488, -0.01708517, -2.420362, 0.3372549, 1, 0, 1,
-0.5932086, -0.3233387, -3.652483, 0.3333333, 1, 0, 1,
-0.5816938, -0.6652592, -3.873299, 0.3254902, 1, 0, 1,
-0.5798613, -1.091749, -1.387701, 0.3215686, 1, 0, 1,
-0.5763927, 0.3202129, -2.671648, 0.3137255, 1, 0, 1,
-0.5740587, 2.460403, -0.2960074, 0.3098039, 1, 0, 1,
-0.5639498, 0.3633499, -1.339467, 0.3019608, 1, 0, 1,
-0.5577199, 1.585517, 0.6802666, 0.2941177, 1, 0, 1,
-0.5518166, 1.654373, -2.54716, 0.2901961, 1, 0, 1,
-0.5516977, 0.2097187, -1.373597, 0.282353, 1, 0, 1,
-0.5502307, 0.63613, 0.515588, 0.2784314, 1, 0, 1,
-0.5497992, 0.3703426, -1.796009, 0.2705882, 1, 0, 1,
-0.5471961, -0.6645993, -2.931341, 0.2666667, 1, 0, 1,
-0.5457609, -1.658763, -2.324018, 0.2588235, 1, 0, 1,
-0.5443013, -0.8349758, -1.918682, 0.254902, 1, 0, 1,
-0.5398072, -0.1403603, -1.265114, 0.2470588, 1, 0, 1,
-0.5392045, -1.796043, -2.974686, 0.2431373, 1, 0, 1,
-0.538412, 0.3658153, -1.285652, 0.2352941, 1, 0, 1,
-0.5360172, 0.4883712, -1.211077, 0.2313726, 1, 0, 1,
-0.5328041, -0.1003457, -2.49942, 0.2235294, 1, 0, 1,
-0.5301187, -1.618322, -3.275291, 0.2196078, 1, 0, 1,
-0.5279629, 0.8656576, 0.2418075, 0.2117647, 1, 0, 1,
-0.5262308, 0.2521915, -1.432729, 0.2078431, 1, 0, 1,
-0.5247045, -2.188147, -3.521641, 0.2, 1, 0, 1,
-0.522458, 1.487813, -0.3061532, 0.1921569, 1, 0, 1,
-0.5196018, -0.1512051, -2.127985, 0.1882353, 1, 0, 1,
-0.5167869, -0.5240273, -1.420207, 0.1803922, 1, 0, 1,
-0.5070712, 1.136165, -1.807982, 0.1764706, 1, 0, 1,
-0.50675, 3.048853, -0.1632487, 0.1686275, 1, 0, 1,
-0.5063169, 1.266063, -1.562019, 0.1647059, 1, 0, 1,
-0.5058417, -0.3536373, -1.462169, 0.1568628, 1, 0, 1,
-0.5044064, 0.02651783, -1.320656, 0.1529412, 1, 0, 1,
-0.5005795, -0.1872916, -3.020268, 0.145098, 1, 0, 1,
-0.4998752, -0.2087473, -2.898373, 0.1411765, 1, 0, 1,
-0.4962197, -0.1534146, -0.7031189, 0.1333333, 1, 0, 1,
-0.4888981, -0.4836595, -2.492523, 0.1294118, 1, 0, 1,
-0.4888043, -0.2098763, -3.275358, 0.1215686, 1, 0, 1,
-0.4817121, -0.3372298, -2.708316, 0.1176471, 1, 0, 1,
-0.480526, -0.1197674, -1.699083, 0.1098039, 1, 0, 1,
-0.4767675, 0.3266332, -0.1802741, 0.1058824, 1, 0, 1,
-0.4628795, -0.6446387, -1.99315, 0.09803922, 1, 0, 1,
-0.4617988, -0.2564439, -1.62399, 0.09019608, 1, 0, 1,
-0.4615673, 1.490605, 0.4972558, 0.08627451, 1, 0, 1,
-0.4615303, 0.09267272, -0.9538516, 0.07843138, 1, 0, 1,
-0.460178, -0.2703825, -4.568205, 0.07450981, 1, 0, 1,
-0.4592139, -1.065572, -3.646123, 0.06666667, 1, 0, 1,
-0.4570293, -0.6352295, -2.157642, 0.0627451, 1, 0, 1,
-0.4562128, 0.8863859, -0.1604475, 0.05490196, 1, 0, 1,
-0.4550398, 0.3453405, -0.8225439, 0.05098039, 1, 0, 1,
-0.4509449, 0.3744051, -1.113922, 0.04313726, 1, 0, 1,
-0.4480058, -0.1521836, -1.029929, 0.03921569, 1, 0, 1,
-0.4474451, 1.733864, -1.103133, 0.03137255, 1, 0, 1,
-0.4441611, -0.7032176, -2.088329, 0.02745098, 1, 0, 1,
-0.4378823, -0.968093, -2.387867, 0.01960784, 1, 0, 1,
-0.4373744, 1.213501, 0.7892071, 0.01568628, 1, 0, 1,
-0.4359277, 1.262848, -0.4264851, 0.007843138, 1, 0, 1,
-0.434308, -0.02812369, -1.73222, 0.003921569, 1, 0, 1,
-0.4323363, 2.397215, 0.2339196, 0, 1, 0.003921569, 1,
-0.4316216, 0.4905655, -0.0187515, 0, 1, 0.01176471, 1,
-0.4305002, -0.4157831, -4.379741, 0, 1, 0.01568628, 1,
-0.4288267, 0.4791295, -0.9025357, 0, 1, 0.02352941, 1,
-0.428329, 1.382815, 0.1907777, 0, 1, 0.02745098, 1,
-0.4217143, -0.8590081, -2.620446, 0, 1, 0.03529412, 1,
-0.421074, -0.9513975, -2.296182, 0, 1, 0.03921569, 1,
-0.4192602, 0.5828236, -0.4422779, 0, 1, 0.04705882, 1,
-0.411587, -1.448811, -2.146843, 0, 1, 0.05098039, 1,
-0.4073709, 0.454659, -0.02082276, 0, 1, 0.05882353, 1,
-0.406029, 0.3053608, -0.6040563, 0, 1, 0.0627451, 1,
-0.4059826, -1.019865, -4.263489, 0, 1, 0.07058824, 1,
-0.405513, 0.8259501, -1.484686, 0, 1, 0.07450981, 1,
-0.4048209, 0.6088099, 0.4792628, 0, 1, 0.08235294, 1,
-0.4036105, 1.134489, -0.5391769, 0, 1, 0.08627451, 1,
-0.400716, -0.5021827, -1.793821, 0, 1, 0.09411765, 1,
-0.3965949, -0.7178505, -3.401741, 0, 1, 0.1019608, 1,
-0.3906579, -1.768758, -3.105588, 0, 1, 0.1058824, 1,
-0.3884105, -0.4692664, 0.9528691, 0, 1, 0.1137255, 1,
-0.3831232, 2.317637, 0.9886712, 0, 1, 0.1176471, 1,
-0.3780558, 0.6083913, 0.44869, 0, 1, 0.1254902, 1,
-0.3771308, -0.7862415, -3.017166, 0, 1, 0.1294118, 1,
-0.3768456, 0.30392, 0.2336023, 0, 1, 0.1372549, 1,
-0.3735949, -0.3072627, -2.249529, 0, 1, 0.1411765, 1,
-0.3677301, -0.1876244, -1.54652, 0, 1, 0.1490196, 1,
-0.3671952, -0.5992997, -3.326473, 0, 1, 0.1529412, 1,
-0.365627, 0.5554317, -0.3283931, 0, 1, 0.1607843, 1,
-0.3631291, 2.366218, 0.3953359, 0, 1, 0.1647059, 1,
-0.3621569, 0.562024, 1.648843, 0, 1, 0.172549, 1,
-0.3609582, 1.150748, -0.6384642, 0, 1, 0.1764706, 1,
-0.3577189, 0.1917927, -0.7600927, 0, 1, 0.1843137, 1,
-0.3572742, -1.082039, -2.759666, 0, 1, 0.1882353, 1,
-0.3545013, -0.086686, -2.908661, 0, 1, 0.1960784, 1,
-0.3525591, 0.1854386, -0.9272468, 0, 1, 0.2039216, 1,
-0.3481162, -0.929452, -1.718364, 0, 1, 0.2078431, 1,
-0.3464134, -1.8757, -2.415746, 0, 1, 0.2156863, 1,
-0.3357976, -0.08891539, -2.378235, 0, 1, 0.2196078, 1,
-0.3347498, 2.292308, -1.047188, 0, 1, 0.227451, 1,
-0.334346, -0.4588777, -2.017656, 0, 1, 0.2313726, 1,
-0.3335344, 0.9098366, -1.547023, 0, 1, 0.2392157, 1,
-0.3306282, 0.1516547, -1.343129, 0, 1, 0.2431373, 1,
-0.3267906, 1.913335, 0.6553429, 0, 1, 0.2509804, 1,
-0.3201558, 1.468254, -0.9703277, 0, 1, 0.254902, 1,
-0.316291, 1.462197, 0.1004429, 0, 1, 0.2627451, 1,
-0.3144302, -0.9445103, -1.625039, 0, 1, 0.2666667, 1,
-0.3110757, -1.986864, -1.933691, 0, 1, 0.2745098, 1,
-0.3051561, 0.3143756, 0.8202959, 0, 1, 0.2784314, 1,
-0.3046763, 1.501132, -1.463381, 0, 1, 0.2862745, 1,
-0.3033535, 1.374122, -1.691571, 0, 1, 0.2901961, 1,
-0.3032804, -0.4716612, -1.245625, 0, 1, 0.2980392, 1,
-0.2997171, 0.4937672, 0.4613549, 0, 1, 0.3058824, 1,
-0.2975529, -0.5492455, -1.915321, 0, 1, 0.3098039, 1,
-0.2974437, 1.43123, -0.1482923, 0, 1, 0.3176471, 1,
-0.2971346, 0.7405645, 0.7213104, 0, 1, 0.3215686, 1,
-0.2956982, 0.7844172, 1.720341, 0, 1, 0.3294118, 1,
-0.2953235, -0.5434758, -2.195784, 0, 1, 0.3333333, 1,
-0.2919203, -2.513408, -5.448831, 0, 1, 0.3411765, 1,
-0.2914729, -1.378185, -1.447754, 0, 1, 0.345098, 1,
-0.2898507, -0.7524185, -2.791178, 0, 1, 0.3529412, 1,
-0.288891, 0.4319353, -0.627594, 0, 1, 0.3568628, 1,
-0.2883938, -0.585384, -1.462005, 0, 1, 0.3647059, 1,
-0.2837047, -1.388378, -4.877427, 0, 1, 0.3686275, 1,
-0.2834773, 1.918828, -2.775478, 0, 1, 0.3764706, 1,
-0.2760466, -0.4829806, -2.71181, 0, 1, 0.3803922, 1,
-0.2697626, 1.187683, 1.971551, 0, 1, 0.3882353, 1,
-0.2634273, -0.5600256, -3.655457, 0, 1, 0.3921569, 1,
-0.2629077, 0.1023377, -1.103445, 0, 1, 0.4, 1,
-0.262733, 0.367387, -1.354283, 0, 1, 0.4078431, 1,
-0.2583865, -0.02376899, -1.228402, 0, 1, 0.4117647, 1,
-0.2581276, -0.5119714, -3.407778, 0, 1, 0.4196078, 1,
-0.2489862, -0.1556562, -1.57124, 0, 1, 0.4235294, 1,
-0.2481162, -1.85423, -5.061119, 0, 1, 0.4313726, 1,
-0.2454281, 1.76754, 0.5417257, 0, 1, 0.4352941, 1,
-0.2439547, 0.1368982, -1.514383, 0, 1, 0.4431373, 1,
-0.243648, 0.6038774, 0.1497504, 0, 1, 0.4470588, 1,
-0.2419782, 1.988205, -0.09579214, 0, 1, 0.454902, 1,
-0.2416233, -1.592651, -4.968183, 0, 1, 0.4588235, 1,
-0.2393218, 0.6196856, -0.3566186, 0, 1, 0.4666667, 1,
-0.2378822, 0.5631897, -0.12738, 0, 1, 0.4705882, 1,
-0.2365564, 0.5758414, -0.183741, 0, 1, 0.4784314, 1,
-0.2351617, -1.592168, -1.935607, 0, 1, 0.4823529, 1,
-0.232193, 0.3983018, -1.855601, 0, 1, 0.4901961, 1,
-0.2313152, 1.514538, -0.6930486, 0, 1, 0.4941176, 1,
-0.2259671, -0.7211929, -0.07518932, 0, 1, 0.5019608, 1,
-0.218006, -2.086133, -1.809792, 0, 1, 0.509804, 1,
-0.2157484, -0.26236, -1.943367, 0, 1, 0.5137255, 1,
-0.2110535, 0.4393578, 0.3121765, 0, 1, 0.5215687, 1,
-0.2088285, -0.6902387, -2.554654, 0, 1, 0.5254902, 1,
-0.2031279, 0.1146992, -1.388631, 0, 1, 0.5333334, 1,
-0.2010243, 1.059417, 0.006313151, 0, 1, 0.5372549, 1,
-0.1983734, -0.01378529, 0.02386773, 0, 1, 0.5450981, 1,
-0.1966714, 0.4522297, 1.064169, 0, 1, 0.5490196, 1,
-0.1939266, 0.1931589, 0.3457859, 0, 1, 0.5568628, 1,
-0.1935398, 1.335313, -2.01662, 0, 1, 0.5607843, 1,
-0.1931604, 0.8144764, -1.737306, 0, 1, 0.5686275, 1,
-0.1907523, -0.0652689, -1.598919, 0, 1, 0.572549, 1,
-0.1877334, 0.9086889, -1.332142, 0, 1, 0.5803922, 1,
-0.1874199, 0.07832326, 0.03460659, 0, 1, 0.5843138, 1,
-0.1850137, -0.6206344, -2.565009, 0, 1, 0.5921569, 1,
-0.1814536, -0.3296207, -3.109198, 0, 1, 0.5960785, 1,
-0.1798851, 0.2100096, -1.525354, 0, 1, 0.6039216, 1,
-0.177046, -1.028573, -4.974145, 0, 1, 0.6117647, 1,
-0.1740598, -0.1427253, -3.14895, 0, 1, 0.6156863, 1,
-0.1730268, -0.2738129, -1.364138, 0, 1, 0.6235294, 1,
-0.1691929, -1.278203, -3.024739, 0, 1, 0.627451, 1,
-0.1689045, -0.9320326, -3.344824, 0, 1, 0.6352941, 1,
-0.1661078, 0.2788082, -0.07678351, 0, 1, 0.6392157, 1,
-0.1618641, 1.182836, 0.03394574, 0, 1, 0.6470588, 1,
-0.1546943, -0.3279718, -2.618751, 0, 1, 0.6509804, 1,
-0.1534989, -0.7907572, -3.718652, 0, 1, 0.6588235, 1,
-0.1526248, 2.629367, -0.2514178, 0, 1, 0.6627451, 1,
-0.1476708, -0.5494463, -2.132682, 0, 1, 0.6705883, 1,
-0.1464805, 0.4355161, -0.5676916, 0, 1, 0.6745098, 1,
-0.1417243, 0.4547352, -0.04196322, 0, 1, 0.682353, 1,
-0.1408872, -1.680103, -2.245899, 0, 1, 0.6862745, 1,
-0.1408679, -0.05203918, -0.2119896, 0, 1, 0.6941177, 1,
-0.1400524, -0.258807, -2.40874, 0, 1, 0.7019608, 1,
-0.1396688, -1.63725, -2.534233, 0, 1, 0.7058824, 1,
-0.1384462, -1.071023, -2.250807, 0, 1, 0.7137255, 1,
-0.1376749, -0.8092352, -4.70528, 0, 1, 0.7176471, 1,
-0.1362721, 1.855955, -1.006118, 0, 1, 0.7254902, 1,
-0.1361076, 1.84762, -0.976486, 0, 1, 0.7294118, 1,
-0.1324517, 1.451107, 0.2720548, 0, 1, 0.7372549, 1,
-0.1318142, 0.9884608, 0.9934563, 0, 1, 0.7411765, 1,
-0.1293145, 1.346357, -0.9783866, 0, 1, 0.7490196, 1,
-0.1255563, 0.1835193, -0.2833863, 0, 1, 0.7529412, 1,
-0.1244865, 0.04800524, -3.333702, 0, 1, 0.7607843, 1,
-0.1239769, 0.5016996, 2.144061, 0, 1, 0.7647059, 1,
-0.1216544, 0.5449195, 1.932911, 0, 1, 0.772549, 1,
-0.119618, -0.2347421, -3.071034, 0, 1, 0.7764706, 1,
-0.1162584, 0.8281456, 0.8871508, 0, 1, 0.7843137, 1,
-0.1161786, -0.7811548, -4.438544, 0, 1, 0.7882353, 1,
-0.1144764, 0.1134192, -0.8920814, 0, 1, 0.7960784, 1,
-0.1115737, -0.2374557, -3.070586, 0, 1, 0.8039216, 1,
-0.1084484, -0.2558805, -1.29448, 0, 1, 0.8078431, 1,
-0.09473336, -1.175854, -2.578447, 0, 1, 0.8156863, 1,
-0.08905078, 0.5551361, 0.03318645, 0, 1, 0.8196079, 1,
-0.0803799, 0.379626, -1.826761, 0, 1, 0.827451, 1,
-0.07688887, -2.01712, -1.085864, 0, 1, 0.8313726, 1,
-0.07380421, 0.5615391, -0.3657697, 0, 1, 0.8392157, 1,
-0.07294592, -1.75357, -3.402981, 0, 1, 0.8431373, 1,
-0.07009282, -0.6052428, -3.656533, 0, 1, 0.8509804, 1,
-0.06725324, -0.3465255, -0.7458634, 0, 1, 0.854902, 1,
-0.06641211, 0.5041117, 0.8760926, 0, 1, 0.8627451, 1,
-0.06587379, 0.5478994, 0.05233324, 0, 1, 0.8666667, 1,
-0.06567335, 0.6362811, 0.1878856, 0, 1, 0.8745098, 1,
-0.06532222, -0.7684082, -2.598481, 0, 1, 0.8784314, 1,
-0.06447806, 0.08300564, -0.1537599, 0, 1, 0.8862745, 1,
-0.06205975, 0.4192443, -1.389602, 0, 1, 0.8901961, 1,
-0.06060912, 0.3213429, 0.6101924, 0, 1, 0.8980392, 1,
-0.05844984, 1.542502, 2.027743, 0, 1, 0.9058824, 1,
-0.05678807, -0.2096412, -2.191039, 0, 1, 0.9098039, 1,
-0.05512931, 0.07241075, -0.9460884, 0, 1, 0.9176471, 1,
-0.05056139, -0.3430473, -2.70014, 0, 1, 0.9215686, 1,
-0.04951125, -0.3886922, -3.839588, 0, 1, 0.9294118, 1,
-0.04747603, 1.472833, -0.652648, 0, 1, 0.9333333, 1,
-0.04647098, -0.0413812, -0.6983719, 0, 1, 0.9411765, 1,
-0.04591535, 1.790661, -0.5276926, 0, 1, 0.945098, 1,
-0.04395968, 1.099391, -0.3830349, 0, 1, 0.9529412, 1,
-0.03522928, -0.3028297, -2.299554, 0, 1, 0.9568627, 1,
-0.03206583, -1.061472, -1.491085, 0, 1, 0.9647059, 1,
-0.02692216, -0.2843227, -3.668606, 0, 1, 0.9686275, 1,
-0.02464406, 0.42857, 0.4205283, 0, 1, 0.9764706, 1,
-0.02338339, 0.6793516, -0.9957126, 0, 1, 0.9803922, 1,
-0.02064575, 0.3207922, -0.1602239, 0, 1, 0.9882353, 1,
-0.02037079, -0.0805488, -3.629969, 0, 1, 0.9921569, 1,
-0.01367768, 0.130257, -0.3832303, 0, 1, 1, 1,
-0.01338036, 1.087837, -0.8732107, 0, 0.9921569, 1, 1,
-0.007739339, 0.1577808, 0.1144012, 0, 0.9882353, 1, 1,
-0.006999741, -0.6219023, -2.039267, 0, 0.9803922, 1, 1,
-0.003351441, -1.116065, -3.050946, 0, 0.9764706, 1, 1,
0.0004985154, 2.129612, -0.006668529, 0, 0.9686275, 1, 1,
0.001245891, 1.215173, -0.01895859, 0, 0.9647059, 1, 1,
0.006240373, 0.2299051, 0.7903414, 0, 0.9568627, 1, 1,
0.007351122, 0.7232704, -0.2796258, 0, 0.9529412, 1, 1,
0.009978282, 0.8167368, 0.04872506, 0, 0.945098, 1, 1,
0.01500148, -1.105356, 3.226633, 0, 0.9411765, 1, 1,
0.01628504, 1.291818, -0.1550832, 0, 0.9333333, 1, 1,
0.02142454, -0.03113593, 2.772227, 0, 0.9294118, 1, 1,
0.02162974, -0.01699484, 3.384665, 0, 0.9215686, 1, 1,
0.02479003, 0.6707588, 2.424134, 0, 0.9176471, 1, 1,
0.02720987, 0.4756058, 0.566539, 0, 0.9098039, 1, 1,
0.02840577, -0.1999196, 3.940921, 0, 0.9058824, 1, 1,
0.03719145, 0.4095398, -0.5035656, 0, 0.8980392, 1, 1,
0.03849111, 0.5625938, 1.632489, 0, 0.8901961, 1, 1,
0.05500723, 0.8870439, 2.048033, 0, 0.8862745, 1, 1,
0.05624956, 0.2781805, 0.8398499, 0, 0.8784314, 1, 1,
0.06068905, -0.6939809, 3.919773, 0, 0.8745098, 1, 1,
0.06195232, -0.7502794, 1.72177, 0, 0.8666667, 1, 1,
0.06766294, -1.56232, 3.86413, 0, 0.8627451, 1, 1,
0.06876595, 1.369538, 1.056348, 0, 0.854902, 1, 1,
0.07098862, 0.4180873, 0.9841366, 0, 0.8509804, 1, 1,
0.07332508, -1.675446, 3.386025, 0, 0.8431373, 1, 1,
0.07425689, -1.336552, 3.876524, 0, 0.8392157, 1, 1,
0.07504126, -0.4907399, 4.756482, 0, 0.8313726, 1, 1,
0.08085305, -0.3706223, 2.111149, 0, 0.827451, 1, 1,
0.08088406, -0.9628729, 3.603374, 0, 0.8196079, 1, 1,
0.0811895, -0.3590718, 3.143925, 0, 0.8156863, 1, 1,
0.08225289, 0.04842991, -0.1945828, 0, 0.8078431, 1, 1,
0.08429415, 0.4974155, 1.107891, 0, 0.8039216, 1, 1,
0.086707, 1.241831, -0.157812, 0, 0.7960784, 1, 1,
0.1019271, 0.4081857, -1.407258, 0, 0.7882353, 1, 1,
0.1053709, -1.596176, 2.642229, 0, 0.7843137, 1, 1,
0.1187231, 0.793067, 0.4777325, 0, 0.7764706, 1, 1,
0.1195263, -0.1819071, 4.342156, 0, 0.772549, 1, 1,
0.1235654, 0.8426467, -1.471259, 0, 0.7647059, 1, 1,
0.1252714, -1.367621, 1.979611, 0, 0.7607843, 1, 1,
0.125561, -0.4852988, 2.857256, 0, 0.7529412, 1, 1,
0.1266993, 0.4269444, -0.3802888, 0, 0.7490196, 1, 1,
0.1305247, 2.21198, 1.809523, 0, 0.7411765, 1, 1,
0.1347363, 0.0005466713, 0.0448573, 0, 0.7372549, 1, 1,
0.1349116, -0.1428824, 3.647138, 0, 0.7294118, 1, 1,
0.1384011, -0.5472656, 2.976767, 0, 0.7254902, 1, 1,
0.1416046, 0.8196566, 0.2985973, 0, 0.7176471, 1, 1,
0.1430151, -1.887484, 3.486698, 0, 0.7137255, 1, 1,
0.1483449, -0.6798602, 3.496037, 0, 0.7058824, 1, 1,
0.1516579, -0.2695861, 1.67537, 0, 0.6980392, 1, 1,
0.1531575, 0.8597839, 0.07398013, 0, 0.6941177, 1, 1,
0.1587417, -1.174967, 3.641469, 0, 0.6862745, 1, 1,
0.1592476, 1.552566, 0.3134336, 0, 0.682353, 1, 1,
0.1618241, 1.755879, -1.197707, 0, 0.6745098, 1, 1,
0.1629126, 0.4505898, 0.1241272, 0, 0.6705883, 1, 1,
0.1648228, 0.4415444, 0.6743581, 0, 0.6627451, 1, 1,
0.165786, -1.674342, 4.346772, 0, 0.6588235, 1, 1,
0.1708447, -0.3080461, 1.824525, 0, 0.6509804, 1, 1,
0.1769853, 0.6798063, 1.184027, 0, 0.6470588, 1, 1,
0.1798721, -0.04923677, 1.841974, 0, 0.6392157, 1, 1,
0.1802162, 0.8052803, 0.2737999, 0, 0.6352941, 1, 1,
0.1944398, 0.6652102, 0.389551, 0, 0.627451, 1, 1,
0.1968929, 0.9963035, 0.7152566, 0, 0.6235294, 1, 1,
0.1973061, -0.7278276, 3.327586, 0, 0.6156863, 1, 1,
0.2011011, -0.8965557, 1.989292, 0, 0.6117647, 1, 1,
0.2024644, 0.3291335, 2.716425, 0, 0.6039216, 1, 1,
0.2028489, 0.5060633, -0.4556951, 0, 0.5960785, 1, 1,
0.2047272, -0.6318773, 2.328581, 0, 0.5921569, 1, 1,
0.2075734, -0.7858558, 1.27809, 0, 0.5843138, 1, 1,
0.2078048, -0.9891683, 1.255536, 0, 0.5803922, 1, 1,
0.2085567, 0.9085216, -0.6148981, 0, 0.572549, 1, 1,
0.2091246, 1.601198, 0.4125826, 0, 0.5686275, 1, 1,
0.211334, 0.2470094, -0.01957263, 0, 0.5607843, 1, 1,
0.2149976, 0.8889349, 1.313264, 0, 0.5568628, 1, 1,
0.2167444, -1.434337, 3.794146, 0, 0.5490196, 1, 1,
0.2168562, -0.3130235, 3.770466, 0, 0.5450981, 1, 1,
0.2183427, -0.1015682, 2.752746, 0, 0.5372549, 1, 1,
0.2196701, -0.7566854, 4.277775, 0, 0.5333334, 1, 1,
0.2255254, 1.136339, -2.033405, 0, 0.5254902, 1, 1,
0.2292832, 0.03731794, 1.265381, 0, 0.5215687, 1, 1,
0.2297767, -0.9899308, 3.982156, 0, 0.5137255, 1, 1,
0.2358093, -0.7027829, 2.664975, 0, 0.509804, 1, 1,
0.2373794, -0.8727539, 4.448059, 0, 0.5019608, 1, 1,
0.2380224, -1.376236, 2.584692, 0, 0.4941176, 1, 1,
0.240715, 0.7417905, -0.1923818, 0, 0.4901961, 1, 1,
0.2433441, 0.9987193, -2.00471, 0, 0.4823529, 1, 1,
0.2488721, -0.08093397, 2.829135, 0, 0.4784314, 1, 1,
0.2508084, -0.1675658, 1.105735, 0, 0.4705882, 1, 1,
0.2514412, -0.7734489, 3.480817, 0, 0.4666667, 1, 1,
0.2515954, -2.108698, 3.164093, 0, 0.4588235, 1, 1,
0.2552495, 0.6442784, 0.9083856, 0, 0.454902, 1, 1,
0.2572567, 0.05347914, 2.446388, 0, 0.4470588, 1, 1,
0.2578323, 0.2218709, 1.17752, 0, 0.4431373, 1, 1,
0.2590756, 2.622331, 1.933735, 0, 0.4352941, 1, 1,
0.2635418, -0.4686271, 2.348508, 0, 0.4313726, 1, 1,
0.2664526, 0.4978364, 1.237423, 0, 0.4235294, 1, 1,
0.2697861, -2.61165, 4.236999, 0, 0.4196078, 1, 1,
0.2745157, 0.01167507, 0.3170607, 0, 0.4117647, 1, 1,
0.2751885, -0.8131064, 1.446529, 0, 0.4078431, 1, 1,
0.2757941, -0.8756638, 4.69933, 0, 0.4, 1, 1,
0.2772855, 0.7740161, -1.104637, 0, 0.3921569, 1, 1,
0.2800587, 0.1930849, 1.238506, 0, 0.3882353, 1, 1,
0.2836492, -0.8641821, 0.8422509, 0, 0.3803922, 1, 1,
0.284918, 0.4476569, 1.606512, 0, 0.3764706, 1, 1,
0.2910139, 0.9925887, 0.1253312, 0, 0.3686275, 1, 1,
0.2917507, -0.3206211, 3.022717, 0, 0.3647059, 1, 1,
0.2917572, -0.5851994, 3.078012, 0, 0.3568628, 1, 1,
0.2943794, 0.005026241, 2.406847, 0, 0.3529412, 1, 1,
0.2955312, -0.08221682, 2.418525, 0, 0.345098, 1, 1,
0.3010104, 0.5281613, 0.5582799, 0, 0.3411765, 1, 1,
0.3012238, -0.7138324, 1.433299, 0, 0.3333333, 1, 1,
0.3025784, 2.322723, -1.694413, 0, 0.3294118, 1, 1,
0.305014, -0.1767998, 2.148094, 0, 0.3215686, 1, 1,
0.3133203, -0.2593147, 1.594715, 0, 0.3176471, 1, 1,
0.3141511, 1.254621, 0.6311454, 0, 0.3098039, 1, 1,
0.3168833, -0.8545502, 1.755722, 0, 0.3058824, 1, 1,
0.3179253, 0.09906884, 2.127658, 0, 0.2980392, 1, 1,
0.3180578, -0.5142844, 2.954777, 0, 0.2901961, 1, 1,
0.3191122, -0.3431488, 1.277642, 0, 0.2862745, 1, 1,
0.3193354, 0.006246604, -0.0995012, 0, 0.2784314, 1, 1,
0.32119, -0.9883053, 2.328415, 0, 0.2745098, 1, 1,
0.3239194, -0.1208836, 1.769833, 0, 0.2666667, 1, 1,
0.3255969, 0.1559066, 1.212516, 0, 0.2627451, 1, 1,
0.3280282, -2.094165, 2.023297, 0, 0.254902, 1, 1,
0.3290285, 0.6115344, 0.234248, 0, 0.2509804, 1, 1,
0.3378279, -0.9467353, 4.426816, 0, 0.2431373, 1, 1,
0.3397563, 0.09634703, 1.409722, 0, 0.2392157, 1, 1,
0.3418932, -0.9887414, 1.980024, 0, 0.2313726, 1, 1,
0.3424065, 2.607873, 1.227495, 0, 0.227451, 1, 1,
0.343517, -0.5228223, 1.85485, 0, 0.2196078, 1, 1,
0.3463669, -0.5664178, 3.05987, 0, 0.2156863, 1, 1,
0.3483773, 0.9042412, 0.8672, 0, 0.2078431, 1, 1,
0.3484677, 0.9336307, 0.7126649, 0, 0.2039216, 1, 1,
0.3502726, 0.7805667, 0.0841394, 0, 0.1960784, 1, 1,
0.3504439, 0.614203, 0.9008801, 0, 0.1882353, 1, 1,
0.3561043, 0.100368, 2.329589, 0, 0.1843137, 1, 1,
0.3611041, -0.9177067, 2.092448, 0, 0.1764706, 1, 1,
0.3649525, 0.02082873, 3.041185, 0, 0.172549, 1, 1,
0.3678842, -2.098258, 2.397379, 0, 0.1647059, 1, 1,
0.3702983, 0.8913846, -0.1566879, 0, 0.1607843, 1, 1,
0.3737293, -0.3891361, 2.492141, 0, 0.1529412, 1, 1,
0.3766519, -0.7927231, 4.922001, 0, 0.1490196, 1, 1,
0.3798326, 1.047063, -0.696497, 0, 0.1411765, 1, 1,
0.3805382, -1.204236, 2.497342, 0, 0.1372549, 1, 1,
0.3848796, -0.6688749, -0.9934847, 0, 0.1294118, 1, 1,
0.3856188, 0.2221106, 0.4199571, 0, 0.1254902, 1, 1,
0.3857949, -0.5540683, 1.129473, 0, 0.1176471, 1, 1,
0.3876905, -1.555977, 1.829515, 0, 0.1137255, 1, 1,
0.3911602, -1.090641, 3.687452, 0, 0.1058824, 1, 1,
0.3916889, 1.205338, 0.05641168, 0, 0.09803922, 1, 1,
0.392497, -0.4635765, 1.953375, 0, 0.09411765, 1, 1,
0.3954059, 2.127227, -1.220101, 0, 0.08627451, 1, 1,
0.3983118, 1.199885, 0.1546245, 0, 0.08235294, 1, 1,
0.4009016, 0.3333815, 2.198444, 0, 0.07450981, 1, 1,
0.4011896, -1.059932, 2.265796, 0, 0.07058824, 1, 1,
0.4013034, 1.411561, -0.8238868, 0, 0.0627451, 1, 1,
0.4017455, -1.668003, 4.025147, 0, 0.05882353, 1, 1,
0.4056658, -1.246158, 4.552868, 0, 0.05098039, 1, 1,
0.4111326, 0.6604697, -0.4693725, 0, 0.04705882, 1, 1,
0.41176, -0.6767564, 3.12758, 0, 0.03921569, 1, 1,
0.4146904, -0.268695, 4.165504, 0, 0.03529412, 1, 1,
0.4147356, 1.35853, 0.558978, 0, 0.02745098, 1, 1,
0.4160483, -0.9872876, 2.727551, 0, 0.02352941, 1, 1,
0.4175109, -0.6788626, 2.752098, 0, 0.01568628, 1, 1,
0.4179991, 0.1665196, 1.271145, 0, 0.01176471, 1, 1,
0.4186359, -0.2472811, 2.998544, 0, 0.003921569, 1, 1,
0.4338192, 0.9548876, 0.367142, 0.003921569, 0, 1, 1,
0.4354547, 0.8238081, 1.563631, 0.007843138, 0, 1, 1,
0.4419767, -1.150107, 3.467175, 0.01568628, 0, 1, 1,
0.4427727, 0.2010225, 2.073781, 0.01960784, 0, 1, 1,
0.4439874, -1.137869, 4.016168, 0.02745098, 0, 1, 1,
0.4466926, -1.262034, 4.675748, 0.03137255, 0, 1, 1,
0.4488744, -1.692371, 4.342603, 0.03921569, 0, 1, 1,
0.462885, 1.878571, 0.4726743, 0.04313726, 0, 1, 1,
0.4660679, -1.782114, 5.907393, 0.05098039, 0, 1, 1,
0.4779989, -0.4806122, 3.06222, 0.05490196, 0, 1, 1,
0.4800965, -1.221998, 1.360196, 0.0627451, 0, 1, 1,
0.4825988, -2.154697, 2.847299, 0.06666667, 0, 1, 1,
0.4841308, 0.9172969, -0.7129388, 0.07450981, 0, 1, 1,
0.4869617, -0.9742489, -0.6574188, 0.07843138, 0, 1, 1,
0.4905007, 0.5996486, -0.2477514, 0.08627451, 0, 1, 1,
0.4936858, 1.640366, 0.9280033, 0.09019608, 0, 1, 1,
0.5009048, 0.1582922, 1.877957, 0.09803922, 0, 1, 1,
0.5025259, 0.5312449, 0.5945801, 0.1058824, 0, 1, 1,
0.5056925, -1.116375, 2.926275, 0.1098039, 0, 1, 1,
0.5162664, -0.2023589, 1.867721, 0.1176471, 0, 1, 1,
0.5164969, 0.3267387, 0.3828231, 0.1215686, 0, 1, 1,
0.5178924, 1.075174, 0.2131829, 0.1294118, 0, 1, 1,
0.5199823, 1.666337, -0.5351834, 0.1333333, 0, 1, 1,
0.5215198, 0.5279525, 0.4393204, 0.1411765, 0, 1, 1,
0.522141, 0.9974183, 1.445509, 0.145098, 0, 1, 1,
0.5225115, 0.3758282, 1.52124, 0.1529412, 0, 1, 1,
0.5226803, 0.6207305, 0.861791, 0.1568628, 0, 1, 1,
0.5312011, -0.05878071, 2.431174, 0.1647059, 0, 1, 1,
0.5349927, 1.485908, 0.7160574, 0.1686275, 0, 1, 1,
0.5358319, -0.2498485, 2.955543, 0.1764706, 0, 1, 1,
0.5366417, -2.148659, 3.431674, 0.1803922, 0, 1, 1,
0.5410402, -0.6722571, 2.252145, 0.1882353, 0, 1, 1,
0.5411384, 0.3816582, 1.976609, 0.1921569, 0, 1, 1,
0.5426343, -1.420846, 1.299438, 0.2, 0, 1, 1,
0.5428786, 0.2719058, 1.128726, 0.2078431, 0, 1, 1,
0.5500106, -0.9084936, 4.417965, 0.2117647, 0, 1, 1,
0.5500611, 1.424943, 0.5785196, 0.2196078, 0, 1, 1,
0.5536313, -0.1891357, 1.059665, 0.2235294, 0, 1, 1,
0.5578085, -0.9203046, 2.39423, 0.2313726, 0, 1, 1,
0.5589606, -0.4419079, 2.11632, 0.2352941, 0, 1, 1,
0.5612371, 1.494713, -0.2861215, 0.2431373, 0, 1, 1,
0.5618042, -0.1494252, 2.718637, 0.2470588, 0, 1, 1,
0.5619401, -0.6995693, 4.132534, 0.254902, 0, 1, 1,
0.5645016, 0.3914946, -0.2473803, 0.2588235, 0, 1, 1,
0.5678106, -0.6138598, 4.667584, 0.2666667, 0, 1, 1,
0.5678487, 0.8548544, 0.1144411, 0.2705882, 0, 1, 1,
0.5697954, 1.677828, 1.353592, 0.2784314, 0, 1, 1,
0.5698522, -0.5051422, 2.95027, 0.282353, 0, 1, 1,
0.5700247, 0.05263022, 1.703186, 0.2901961, 0, 1, 1,
0.5753027, -0.5119156, 2.618669, 0.2941177, 0, 1, 1,
0.5804245, -0.2830174, 3.198681, 0.3019608, 0, 1, 1,
0.5805399, -1.188313, 1.447572, 0.3098039, 0, 1, 1,
0.5862249, 0.8712536, 0.5583206, 0.3137255, 0, 1, 1,
0.5877436, 1.584369, 1.472585, 0.3215686, 0, 1, 1,
0.5899703, -1.760427, 4.555573, 0.3254902, 0, 1, 1,
0.5935636, -0.8377475, 2.150658, 0.3333333, 0, 1, 1,
0.594043, -0.09978824, 0.8828962, 0.3372549, 0, 1, 1,
0.59644, 1.22091, 1.564355, 0.345098, 0, 1, 1,
0.6015339, 1.048233, 0.2860585, 0.3490196, 0, 1, 1,
0.6026213, -1.13426, 3.615294, 0.3568628, 0, 1, 1,
0.6042687, 0.05090015, 0.03261034, 0.3607843, 0, 1, 1,
0.6048303, 0.1178059, -0.1731672, 0.3686275, 0, 1, 1,
0.6048967, 0.1475083, 1.830946, 0.372549, 0, 1, 1,
0.6087986, 0.2317009, 0.07316443, 0.3803922, 0, 1, 1,
0.6113662, 0.8492946, 1.371899, 0.3843137, 0, 1, 1,
0.6247941, -0.6115481, 4.506324, 0.3921569, 0, 1, 1,
0.6261905, -1.282766, 1.791984, 0.3960784, 0, 1, 1,
0.6273122, 1.185643, -0.05583225, 0.4039216, 0, 1, 1,
0.6297185, 0.01197409, 1.646793, 0.4117647, 0, 1, 1,
0.6300769, 0.951032, 1.891565, 0.4156863, 0, 1, 1,
0.6306946, 1.226853, 0.8311146, 0.4235294, 0, 1, 1,
0.6309928, -0.367218, 1.849888, 0.427451, 0, 1, 1,
0.635281, 0.9733012, 0.2582449, 0.4352941, 0, 1, 1,
0.6354191, 0.8009744, 0.3912308, 0.4392157, 0, 1, 1,
0.640806, -0.2410294, 1.518506, 0.4470588, 0, 1, 1,
0.6428248, -0.6216798, 0.2352326, 0.4509804, 0, 1, 1,
0.6530133, 0.3805891, -0.5801533, 0.4588235, 0, 1, 1,
0.6560652, 0.2839032, -0.7770973, 0.4627451, 0, 1, 1,
0.6646224, -0.02928005, 3.171277, 0.4705882, 0, 1, 1,
0.6709887, 0.8437209, 0.6003696, 0.4745098, 0, 1, 1,
0.6769278, 0.342695, 0.6503195, 0.4823529, 0, 1, 1,
0.6780375, 0.09957559, 0.8334925, 0.4862745, 0, 1, 1,
0.6803374, -1.301265, 1.596942, 0.4941176, 0, 1, 1,
0.6851931, 1.464146, -0.0998241, 0.5019608, 0, 1, 1,
0.6864029, 0.08646495, 1.581738, 0.5058824, 0, 1, 1,
0.6897051, 0.1725575, 0.4050464, 0.5137255, 0, 1, 1,
0.6920426, 0.3290789, 1.779907, 0.5176471, 0, 1, 1,
0.6927391, 0.4137628, 2.315434, 0.5254902, 0, 1, 1,
0.6930984, 0.4572846, 0.7219071, 0.5294118, 0, 1, 1,
0.6988617, 0.2670251, 0.8126876, 0.5372549, 0, 1, 1,
0.708324, 0.8086849, 0.5277926, 0.5411765, 0, 1, 1,
0.7085304, -1.028963, 2.351383, 0.5490196, 0, 1, 1,
0.7093095, 0.5580069, 1.167048, 0.5529412, 0, 1, 1,
0.7159374, 0.02842988, -0.09849966, 0.5607843, 0, 1, 1,
0.7173772, 0.6900634, 0.6383272, 0.5647059, 0, 1, 1,
0.7181001, 0.8379989, -0.09200617, 0.572549, 0, 1, 1,
0.7191162, -0.8226491, 1.857074, 0.5764706, 0, 1, 1,
0.7205107, -0.4371667, 1.630201, 0.5843138, 0, 1, 1,
0.7205894, 0.02235463, 1.65621, 0.5882353, 0, 1, 1,
0.7223106, -0.03007966, 1.711802, 0.5960785, 0, 1, 1,
0.7260181, -0.5590099, 2.698621, 0.6039216, 0, 1, 1,
0.7286124, -0.4478187, 2.901168, 0.6078432, 0, 1, 1,
0.7343501, -1.788172, 3.645196, 0.6156863, 0, 1, 1,
0.7362003, 0.7349787, -0.05111245, 0.6196079, 0, 1, 1,
0.738273, 1.461031, 0.32371, 0.627451, 0, 1, 1,
0.7420883, 0.9202648, 1.03598, 0.6313726, 0, 1, 1,
0.7475307, -0.1528265, 1.377081, 0.6392157, 0, 1, 1,
0.7502258, -0.2081589, 1.941725, 0.6431373, 0, 1, 1,
0.7566404, 1.435042, -0.2773447, 0.6509804, 0, 1, 1,
0.7572137, 0.1352169, 2.172181, 0.654902, 0, 1, 1,
0.7662978, -0.05227611, 1.805619, 0.6627451, 0, 1, 1,
0.7668809, 2.366432, 1.901893, 0.6666667, 0, 1, 1,
0.7684926, -0.414957, 1.957884, 0.6745098, 0, 1, 1,
0.7702756, -0.7482359, 0.900347, 0.6784314, 0, 1, 1,
0.7706471, -0.4818376, 1.953119, 0.6862745, 0, 1, 1,
0.7726228, -0.7213157, 2.878059, 0.6901961, 0, 1, 1,
0.7825416, 0.4990981, 1.115396, 0.6980392, 0, 1, 1,
0.7832434, -1.056629, 0.6279325, 0.7058824, 0, 1, 1,
0.7939836, -1.835027, 3.174727, 0.7098039, 0, 1, 1,
0.7945369, -0.07870279, 4.061267, 0.7176471, 0, 1, 1,
0.798264, -0.102335, 2.109397, 0.7215686, 0, 1, 1,
0.8000019, 1.986455, 2.069816, 0.7294118, 0, 1, 1,
0.8031094, -1.175964, 5.097654, 0.7333333, 0, 1, 1,
0.8063778, -0.2116604, 2.378391, 0.7411765, 0, 1, 1,
0.8076934, -0.7614869, 2.563856, 0.7450981, 0, 1, 1,
0.8076944, 0.8673769, 0.6076554, 0.7529412, 0, 1, 1,
0.807771, -0.3646826, 0.8505939, 0.7568628, 0, 1, 1,
0.811603, 1.842081, -0.1814583, 0.7647059, 0, 1, 1,
0.8134274, 0.1518687, 0.5860692, 0.7686275, 0, 1, 1,
0.8160588, 0.4440094, 0.9166622, 0.7764706, 0, 1, 1,
0.8184041, 1.598216, -2.067039, 0.7803922, 0, 1, 1,
0.8219671, -0.7056721, 1.575488, 0.7882353, 0, 1, 1,
0.824568, 1.481791, 0.6349142, 0.7921569, 0, 1, 1,
0.8273384, 1.634124, 0.2421272, 0.8, 0, 1, 1,
0.8279812, -0.1765645, 0.7855614, 0.8078431, 0, 1, 1,
0.8321912, -0.2126921, 2.023131, 0.8117647, 0, 1, 1,
0.8325862, 0.2283787, 1.364576, 0.8196079, 0, 1, 1,
0.8326321, 0.5377633, -0.6498194, 0.8235294, 0, 1, 1,
0.8328509, -0.8350742, 1.129877, 0.8313726, 0, 1, 1,
0.8329973, -0.7930251, 3.204297, 0.8352941, 0, 1, 1,
0.8337672, -1.096207, 1.339145, 0.8431373, 0, 1, 1,
0.8380727, 1.385093, 1.423133, 0.8470588, 0, 1, 1,
0.8382586, 0.4574976, -0.1771005, 0.854902, 0, 1, 1,
0.8403302, -0.03054081, 1.08451, 0.8588235, 0, 1, 1,
0.8421147, -1.705901, 4.187092, 0.8666667, 0, 1, 1,
0.8446774, 0.5208409, 1.685316, 0.8705882, 0, 1, 1,
0.8467616, 0.1554659, 1.649191, 0.8784314, 0, 1, 1,
0.8505518, 0.3733334, 2.444776, 0.8823529, 0, 1, 1,
0.8555235, -0.9487159, 3.109777, 0.8901961, 0, 1, 1,
0.8589905, 0.4843879, 0.9316145, 0.8941177, 0, 1, 1,
0.8633033, 0.7457089, 1.561318, 0.9019608, 0, 1, 1,
0.8637255, -0.24938, 2.535747, 0.9098039, 0, 1, 1,
0.8645815, -1.173348, 2.916589, 0.9137255, 0, 1, 1,
0.8764577, -1.376913, 1.599213, 0.9215686, 0, 1, 1,
0.8764853, -0.4154419, 2.205044, 0.9254902, 0, 1, 1,
0.878307, 0.5215943, 0.5007411, 0.9333333, 0, 1, 1,
0.8802399, -1.007087, 3.398104, 0.9372549, 0, 1, 1,
0.883144, -0.8577248, 3.385211, 0.945098, 0, 1, 1,
0.8874032, -1.909793, 1.884272, 0.9490196, 0, 1, 1,
0.8875994, 0.9242175, 0.2774659, 0.9568627, 0, 1, 1,
0.8888856, -1.71653, 1.526505, 0.9607843, 0, 1, 1,
0.8906085, -1.08832, 0.633905, 0.9686275, 0, 1, 1,
0.8919738, 1.674247, -0.005848133, 0.972549, 0, 1, 1,
0.8952142, 1.002454, -0.9253529, 0.9803922, 0, 1, 1,
0.8997651, -0.6236291, 3.541516, 0.9843137, 0, 1, 1,
0.9009767, -0.8211522, 2.627007, 0.9921569, 0, 1, 1,
0.9074343, 1.157282, 0.5322595, 0.9960784, 0, 1, 1,
0.9089888, -0.8249848, 1.4542, 1, 0, 0.9960784, 1,
0.9099877, -1.793743, 1.4881, 1, 0, 0.9882353, 1,
0.9169385, 1.569948, 1.134904, 1, 0, 0.9843137, 1,
0.9186544, -0.4954273, 2.485731, 1, 0, 0.9764706, 1,
0.9234065, -0.08517518, 1.145859, 1, 0, 0.972549, 1,
0.9256663, -0.1728601, 2.295664, 1, 0, 0.9647059, 1,
0.9263604, -1.160199, 3.063131, 1, 0, 0.9607843, 1,
0.9344217, -0.3941651, 0.8870825, 1, 0, 0.9529412, 1,
0.9365596, 0.03875026, 2.109512, 1, 0, 0.9490196, 1,
0.9477326, -0.1164929, 2.999142, 1, 0, 0.9411765, 1,
0.9485065, -0.969013, 2.844896, 1, 0, 0.9372549, 1,
0.9515961, 1.004811, 1.296343, 1, 0, 0.9294118, 1,
0.9590564, 1.947022, 0.3611709, 1, 0, 0.9254902, 1,
0.9626385, 0.6892716, 0.8327762, 1, 0, 0.9176471, 1,
0.9662268, -1.122212, 0.8007534, 1, 0, 0.9137255, 1,
0.9670723, 1.511271, 2.011932, 1, 0, 0.9058824, 1,
0.9681498, 0.7472324, 0.7622834, 1, 0, 0.9019608, 1,
0.9689454, 0.07259668, -0.5511196, 1, 0, 0.8941177, 1,
0.9716888, -0.9592115, 1.877639, 1, 0, 0.8862745, 1,
0.9795155, 2.077328, -0.06554499, 1, 0, 0.8823529, 1,
0.9796585, 0.9514669, 1.20057, 1, 0, 0.8745098, 1,
0.9800397, -0.07031438, 2.209523, 1, 0, 0.8705882, 1,
0.9824163, -0.2463145, 1.769269, 1, 0, 0.8627451, 1,
0.9828537, -0.1706425, 1.05806, 1, 0, 0.8588235, 1,
0.9872186, -0.5700741, 3.320583, 1, 0, 0.8509804, 1,
0.9932023, 0.1221478, 2.7605, 1, 0, 0.8470588, 1,
0.9984678, 1.121307, 2.579695, 1, 0, 0.8392157, 1,
0.9989449, -2.548925, 1.697154, 1, 0, 0.8352941, 1,
1.003224, 0.7665779, 0.529616, 1, 0, 0.827451, 1,
1.030384, 0.6324077, 1.881087, 1, 0, 0.8235294, 1,
1.034823, -1.132496, 2.189404, 1, 0, 0.8156863, 1,
1.037038, -2.155284, 4.443437, 1, 0, 0.8117647, 1,
1.041832, 1.098638, 0.002083475, 1, 0, 0.8039216, 1,
1.050947, 1.762559, 0.5727432, 1, 0, 0.7960784, 1,
1.051278, -1.456921, 2.795088, 1, 0, 0.7921569, 1,
1.055777, -3.391597, 2.540005, 1, 0, 0.7843137, 1,
1.056959, 1.604097, 2.024959, 1, 0, 0.7803922, 1,
1.057542, -0.04601252, 1.03914, 1, 0, 0.772549, 1,
1.058726, 0.825837, -0.1278269, 1, 0, 0.7686275, 1,
1.061316, 0.9434265, -0.4437162, 1, 0, 0.7607843, 1,
1.072928, 0.811246, 0.06504876, 1, 0, 0.7568628, 1,
1.077077, -0.4691568, 1.832771, 1, 0, 0.7490196, 1,
1.089678, -0.7581648, 0.3301399, 1, 0, 0.7450981, 1,
1.091186, -0.6041996, 3.465501, 1, 0, 0.7372549, 1,
1.093375, -1.070113, 3.600795, 1, 0, 0.7333333, 1,
1.102944, 2.188085, 0.2424685, 1, 0, 0.7254902, 1,
1.10778, -0.139263, 2.385942, 1, 0, 0.7215686, 1,
1.109752, -0.2207237, 2.972304, 1, 0, 0.7137255, 1,
1.111585, -1.367242, 2.811985, 1, 0, 0.7098039, 1,
1.117446, 0.514067, 2.533028, 1, 0, 0.7019608, 1,
1.117956, -0.188216, 1.767568, 1, 0, 0.6941177, 1,
1.125892, -0.4786651, 1.266976, 1, 0, 0.6901961, 1,
1.12946, 0.976393, 1.624058, 1, 0, 0.682353, 1,
1.136414, 0.4116011, 2.14622, 1, 0, 0.6784314, 1,
1.144647, -0.06802446, 2.178985, 1, 0, 0.6705883, 1,
1.146085, 0.7270999, 2.963867, 1, 0, 0.6666667, 1,
1.151468, 0.9299393, 1.5882, 1, 0, 0.6588235, 1,
1.155139, 0.3198673, -0.1187017, 1, 0, 0.654902, 1,
1.164834, -0.1176145, 1.924106, 1, 0, 0.6470588, 1,
1.168647, -0.908442, 3.493222, 1, 0, 0.6431373, 1,
1.175593, -1.302234, 3.414476, 1, 0, 0.6352941, 1,
1.176614, -1.410413, 2.547792, 1, 0, 0.6313726, 1,
1.184588, 0.5840391, 1.26984, 1, 0, 0.6235294, 1,
1.186084, 0.240891, 2.409536, 1, 0, 0.6196079, 1,
1.189173, 0.2997229, 1.390872, 1, 0, 0.6117647, 1,
1.195988, -1.102258, 2.238667, 1, 0, 0.6078432, 1,
1.212334, 1.181737, 2.603507, 1, 0, 0.6, 1,
1.223456, 1.076166, 0.7050181, 1, 0, 0.5921569, 1,
1.229297, -0.4804114, 0.1549493, 1, 0, 0.5882353, 1,
1.238152, -0.4394628, 1.345293, 1, 0, 0.5803922, 1,
1.240657, -0.1574488, 0.5497901, 1, 0, 0.5764706, 1,
1.257812, 0.7700283, 1.461366, 1, 0, 0.5686275, 1,
1.258758, 0.2626459, 1.66608, 1, 0, 0.5647059, 1,
1.25912, 0.8534684, 1.004077, 1, 0, 0.5568628, 1,
1.260522, 0.9726889, 0.7698659, 1, 0, 0.5529412, 1,
1.267858, 0.02431962, -0.726358, 1, 0, 0.5450981, 1,
1.268771, -0.8813894, 2.322697, 1, 0, 0.5411765, 1,
1.276296, 0.04238388, 0.8272963, 1, 0, 0.5333334, 1,
1.277009, -0.5218523, 3.992023, 1, 0, 0.5294118, 1,
1.277998, -1.279215, 1.169374, 1, 0, 0.5215687, 1,
1.284842, 0.1304722, 0.6590543, 1, 0, 0.5176471, 1,
1.296117, 1.088579, 0.4500144, 1, 0, 0.509804, 1,
1.310943, -0.3564802, 0.9974847, 1, 0, 0.5058824, 1,
1.316364, 0.8679242, 0.7402294, 1, 0, 0.4980392, 1,
1.316751, -1.249343, 2.557725, 1, 0, 0.4901961, 1,
1.318604, 0.4364211, 1.985145, 1, 0, 0.4862745, 1,
1.33753, 0.4107854, 0.714088, 1, 0, 0.4784314, 1,
1.351962, -0.2718101, 1.642355, 1, 0, 0.4745098, 1,
1.352192, 0.63574, 0.9473523, 1, 0, 0.4666667, 1,
1.352993, -2.671, 2.805794, 1, 0, 0.4627451, 1,
1.356694, 2.048111, 3.224706, 1, 0, 0.454902, 1,
1.358383, 0.6519772, 1.604811, 1, 0, 0.4509804, 1,
1.364458, -2.013782, 1.869713, 1, 0, 0.4431373, 1,
1.368011, 0.3451019, 1.539506, 1, 0, 0.4392157, 1,
1.373909, 0.0383198, 3.123399, 1, 0, 0.4313726, 1,
1.375311, 0.4193823, 3.407746, 1, 0, 0.427451, 1,
1.385313, 0.2157895, 0.6133983, 1, 0, 0.4196078, 1,
1.393795, 0.6755649, 2.654029, 1, 0, 0.4156863, 1,
1.397717, -0.2944036, 2.31725, 1, 0, 0.4078431, 1,
1.408586, -0.8557388, 2.282302, 1, 0, 0.4039216, 1,
1.41411, -0.9594489, 2.210987, 1, 0, 0.3960784, 1,
1.419318, -0.2594055, 3.457555, 1, 0, 0.3882353, 1,
1.435337, -1.010276, 3.604503, 1, 0, 0.3843137, 1,
1.435353, 1.104941, 0.9579181, 1, 0, 0.3764706, 1,
1.435873, 1.622941, 1.222393, 1, 0, 0.372549, 1,
1.447036, -0.4332591, 3.679116, 1, 0, 0.3647059, 1,
1.485052, 1.875382, 0.1905998, 1, 0, 0.3607843, 1,
1.48991, -0.295433, 0.4142955, 1, 0, 0.3529412, 1,
1.496473, 1.155195, 1.373709, 1, 0, 0.3490196, 1,
1.503243, -0.1195617, 1.73348, 1, 0, 0.3411765, 1,
1.524637, -1.301904, -0.06040479, 1, 0, 0.3372549, 1,
1.52518, -0.9531733, 2.014078, 1, 0, 0.3294118, 1,
1.527873, -1.439012, 1.787966, 1, 0, 0.3254902, 1,
1.528726, 0.8510979, -1.216131, 1, 0, 0.3176471, 1,
1.538633, 1.378755, 1.707869, 1, 0, 0.3137255, 1,
1.539081, -0.2086923, 2.880476, 1, 0, 0.3058824, 1,
1.543158, -0.7156138, 2.714314, 1, 0, 0.2980392, 1,
1.553335, 2.201056, 0.6192653, 1, 0, 0.2941177, 1,
1.595904, -0.4730041, 3.619773, 1, 0, 0.2862745, 1,
1.613656, -0.8246667, 2.12266, 1, 0, 0.282353, 1,
1.621257, -1.896497, 3.362856, 1, 0, 0.2745098, 1,
1.624426, -0.1335668, 0.9888068, 1, 0, 0.2705882, 1,
1.624528, -0.03462551, 1.105335, 1, 0, 0.2627451, 1,
1.631316, 0.2048238, 2.64269, 1, 0, 0.2588235, 1,
1.632672, -1.93198, 4.742942, 1, 0, 0.2509804, 1,
1.63675, -0.1401067, 2.359061, 1, 0, 0.2470588, 1,
1.638761, 1.468152, 2.023052, 1, 0, 0.2392157, 1,
1.639091, 1.585213, -0.1594882, 1, 0, 0.2352941, 1,
1.644111, 1.21552, 0.9367369, 1, 0, 0.227451, 1,
1.663166, 0.1367842, 3.610708, 1, 0, 0.2235294, 1,
1.668797, -0.6180991, 2.636465, 1, 0, 0.2156863, 1,
1.678371, 1.546469, 2.682729, 1, 0, 0.2117647, 1,
1.698663, -1.427259, 2.306645, 1, 0, 0.2039216, 1,
1.726917, -0.2124227, 1.851871, 1, 0, 0.1960784, 1,
1.73922, -0.411, 1.549159, 1, 0, 0.1921569, 1,
1.759262, 2.146018, -0.2295729, 1, 0, 0.1843137, 1,
1.782186, 0.4220273, -0.04435747, 1, 0, 0.1803922, 1,
1.784472, -0.5567594, 0.1278061, 1, 0, 0.172549, 1,
1.801783, 0.1005349, 0.4338026, 1, 0, 0.1686275, 1,
1.812048, 1.549248, 0.8403637, 1, 0, 0.1607843, 1,
1.833207, -1.2343, 2.628106, 1, 0, 0.1568628, 1,
1.860698, 1.971882, 1.525478, 1, 0, 0.1490196, 1,
1.871734, -0.1255732, 1.684847, 1, 0, 0.145098, 1,
1.910092, 1.124142, 2.642821, 1, 0, 0.1372549, 1,
1.969092, 0.3727148, 0.9129061, 1, 0, 0.1333333, 1,
1.9712, 0.2302134, 1.083465, 1, 0, 0.1254902, 1,
1.991526, 1.788892, -0.7667507, 1, 0, 0.1215686, 1,
2.012854, -0.2104792, 1.831969, 1, 0, 0.1137255, 1,
2.029089, 0.2735341, -1.395979, 1, 0, 0.1098039, 1,
2.056705, -0.3555765, 1.925709, 1, 0, 0.1019608, 1,
2.072514, -0.2886575, 1.862182, 1, 0, 0.09411765, 1,
2.081169, -0.05643217, 2.061162, 1, 0, 0.09019608, 1,
2.091752, -0.7081414, 3.100902, 1, 0, 0.08235294, 1,
2.159413, -0.5946403, 3.047255, 1, 0, 0.07843138, 1,
2.195096, -1.102888, 2.216491, 1, 0, 0.07058824, 1,
2.231837, 0.9168135, 0.4829666, 1, 0, 0.06666667, 1,
2.301409, 0.8752106, 1.434955, 1, 0, 0.05882353, 1,
2.351979, -0.3961923, 1.011053, 1, 0, 0.05490196, 1,
2.392435, 0.6466957, 1.732055, 1, 0, 0.04705882, 1,
2.424055, 1.097297, 0.8196427, 1, 0, 0.04313726, 1,
2.51631, -1.260895, 3.347496, 1, 0, 0.03529412, 1,
2.52615, 0.4792331, 1.140481, 1, 0, 0.03137255, 1,
2.694658, -1.30703, 3.480382, 1, 0, 0.02352941, 1,
2.868206, -0.102246, 2.825274, 1, 0, 0.01960784, 1,
2.889106, 1.426052, 0.753776, 1, 0, 0.01176471, 1,
3.392539, 0.118614, 1.084287, 1, 0, 0.007843138, 1
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
0.1037606, -4.483253, -7.373711, 0, -0.5, 0.5, 0.5,
0.1037606, -4.483253, -7.373711, 1, -0.5, 0.5, 0.5,
0.1037606, -4.483253, -7.373711, 1, 1.5, 0.5, 0.5,
0.1037606, -4.483253, -7.373711, 0, 1.5, 0.5, 0.5
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
-4.299913, -0.1713718, -7.373711, 0, -0.5, 0.5, 0.5,
-4.299913, -0.1713718, -7.373711, 1, -0.5, 0.5, 0.5,
-4.299913, -0.1713718, -7.373711, 1, 1.5, 0.5, 0.5,
-4.299913, -0.1713718, -7.373711, 0, 1.5, 0.5, 0.5
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
-4.299913, -4.483253, 0.2292814, 0, -0.5, 0.5, 0.5,
-4.299913, -4.483253, 0.2292814, 1, -0.5, 0.5, 0.5,
-4.299913, -4.483253, 0.2292814, 1, 1.5, 0.5, 0.5,
-4.299913, -4.483253, 0.2292814, 0, 1.5, 0.5, 0.5
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
-3, -3.488203, -5.619174,
3, -3.488203, -5.619174,
-3, -3.488203, -5.619174,
-3, -3.654045, -5.911597,
-2, -3.488203, -5.619174,
-2, -3.654045, -5.911597,
-1, -3.488203, -5.619174,
-1, -3.654045, -5.911597,
0, -3.488203, -5.619174,
0, -3.654045, -5.911597,
1, -3.488203, -5.619174,
1, -3.654045, -5.911597,
2, -3.488203, -5.619174,
2, -3.654045, -5.911597,
3, -3.488203, -5.619174,
3, -3.654045, -5.911597
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
-3, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
-3, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
-3, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
-3, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
-2, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
-2, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
-2, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
-2, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
-1, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
-1, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
-1, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
-1, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
0, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
0, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
0, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
0, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
1, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
1, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
1, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
1, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
2, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
2, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
2, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
2, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5,
3, -3.985728, -6.496442, 0, -0.5, 0.5, 0.5,
3, -3.985728, -6.496442, 1, -0.5, 0.5, 0.5,
3, -3.985728, -6.496442, 1, 1.5, 0.5, 0.5,
3, -3.985728, -6.496442, 0, 1.5, 0.5, 0.5
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
-3.283681, -3, -5.619174,
-3.283681, 3, -5.619174,
-3.283681, -3, -5.619174,
-3.453053, -3, -5.911597,
-3.283681, -2, -5.619174,
-3.453053, -2, -5.911597,
-3.283681, -1, -5.619174,
-3.453053, -1, -5.911597,
-3.283681, 0, -5.619174,
-3.453053, 0, -5.911597,
-3.283681, 1, -5.619174,
-3.453053, 1, -5.911597,
-3.283681, 2, -5.619174,
-3.453053, 2, -5.911597,
-3.283681, 3, -5.619174,
-3.453053, 3, -5.911597
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
-3.791797, -3, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, -3, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, -3, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, -3, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, -2, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, -2, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, -2, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, -2, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, -1, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, -1, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, -1, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, -1, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, 0, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, 0, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, 0, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, 0, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, 1, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, 1, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, 1, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, 1, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, 2, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, 2, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, 2, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, 2, -6.496442, 0, 1.5, 0.5, 0.5,
-3.791797, 3, -6.496442, 0, -0.5, 0.5, 0.5,
-3.791797, 3, -6.496442, 1, -0.5, 0.5, 0.5,
-3.791797, 3, -6.496442, 1, 1.5, 0.5, 0.5,
-3.791797, 3, -6.496442, 0, 1.5, 0.5, 0.5
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
-3.283681, -3.488203, -4,
-3.283681, -3.488203, 4,
-3.283681, -3.488203, -4,
-3.453053, -3.654045, -4,
-3.283681, -3.488203, -2,
-3.453053, -3.654045, -2,
-3.283681, -3.488203, 0,
-3.453053, -3.654045, 0,
-3.283681, -3.488203, 2,
-3.453053, -3.654045, 2,
-3.283681, -3.488203, 4,
-3.453053, -3.654045, 4
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
-3.791797, -3.985728, -4, 0, -0.5, 0.5, 0.5,
-3.791797, -3.985728, -4, 1, -0.5, 0.5, 0.5,
-3.791797, -3.985728, -4, 1, 1.5, 0.5, 0.5,
-3.791797, -3.985728, -4, 0, 1.5, 0.5, 0.5,
-3.791797, -3.985728, -2, 0, -0.5, 0.5, 0.5,
-3.791797, -3.985728, -2, 1, -0.5, 0.5, 0.5,
-3.791797, -3.985728, -2, 1, 1.5, 0.5, 0.5,
-3.791797, -3.985728, -2, 0, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 0, 0, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 0, 1, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 0, 1, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 0, 0, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 2, 0, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 2, 1, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 2, 1, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 2, 0, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 4, 0, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 4, 1, -0.5, 0.5, 0.5,
-3.791797, -3.985728, 4, 1, 1.5, 0.5, 0.5,
-3.791797, -3.985728, 4, 0, 1.5, 0.5, 0.5
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
-3.283681, -3.488203, -5.619174,
-3.283681, 3.14546, -5.619174,
-3.283681, -3.488203, 6.077737,
-3.283681, 3.14546, 6.077737,
-3.283681, -3.488203, -5.619174,
-3.283681, -3.488203, 6.077737,
-3.283681, 3.14546, -5.619174,
-3.283681, 3.14546, 6.077737,
-3.283681, -3.488203, -5.619174,
3.491202, -3.488203, -5.619174,
-3.283681, -3.488203, 6.077737,
3.491202, -3.488203, 6.077737,
-3.283681, 3.14546, -5.619174,
3.491202, 3.14546, -5.619174,
-3.283681, 3.14546, 6.077737,
3.491202, 3.14546, 6.077737,
3.491202, -3.488203, -5.619174,
3.491202, 3.14546, -5.619174,
3.491202, -3.488203, 6.077737,
3.491202, 3.14546, 6.077737,
3.491202, -3.488203, -5.619174,
3.491202, -3.488203, 6.077737,
3.491202, 3.14546, -5.619174,
3.491202, 3.14546, 6.077737
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
var radius = 8.040305;
var distance = 35.77222;
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
mvMatrix.translate( -0.1037606, 0.1713718, -0.2292814 );
mvMatrix.scale( 1.283171, 1.310488, 0.7432163 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.77222);
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


