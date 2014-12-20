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
-3.464919, 0.6174117, -1.965828, 1, 0, 0, 1,
-3.412016, -0.2646594, -3.414241, 1, 0.007843138, 0, 1,
-3.320051, -1.005968, -0.84369, 1, 0.01176471, 0, 1,
-3.154264, 1.37706, -0.7047724, 1, 0.01960784, 0, 1,
-2.773916, -0.6178939, -2.092947, 1, 0.02352941, 0, 1,
-2.512971, 1.147102, -2.166149, 1, 0.03137255, 0, 1,
-2.462361, 1.630597, 0.5688733, 1, 0.03529412, 0, 1,
-2.412471, 1.992871, -1.651141, 1, 0.04313726, 0, 1,
-2.397259, -0.3879291, -0.1677534, 1, 0.04705882, 0, 1,
-2.349681, -1.48853, -3.566775, 1, 0.05490196, 0, 1,
-2.342155, 0.7722413, -2.345341, 1, 0.05882353, 0, 1,
-2.321772, 0.8747411, -0.5830808, 1, 0.06666667, 0, 1,
-2.252304, -1.436163, -2.258682, 1, 0.07058824, 0, 1,
-2.235072, -0.04814988, 0.6802356, 1, 0.07843138, 0, 1,
-2.19615, -0.06684456, -2.103713, 1, 0.08235294, 0, 1,
-2.132857, 0.3855026, -1.41094, 1, 0.09019608, 0, 1,
-2.117601, 1.474429, -1.734256, 1, 0.09411765, 0, 1,
-2.098874, -1.28854, -2.56361, 1, 0.1019608, 0, 1,
-2.066725, 0.4838096, -1.037558, 1, 0.1098039, 0, 1,
-2.053956, 0.1069, -3.827724, 1, 0.1137255, 0, 1,
-2.041496, -0.3596015, -0.714245, 1, 0.1215686, 0, 1,
-2.030213, -2.17227, -2.18739, 1, 0.1254902, 0, 1,
-2.004061, 0.8952106, -0.7583868, 1, 0.1333333, 0, 1,
-1.992981, -0.4312036, -1.751747, 1, 0.1372549, 0, 1,
-1.992198, 2.124243, -0.06269803, 1, 0.145098, 0, 1,
-1.957783, -0.1255122, -0.6129599, 1, 0.1490196, 0, 1,
-1.92908, 0.5728236, -1.608324, 1, 0.1568628, 0, 1,
-1.923212, 0.3031131, -1.904065, 1, 0.1607843, 0, 1,
-1.917609, -0.3817808, -1.30296, 1, 0.1686275, 0, 1,
-1.915112, 0.9230549, -0.9761524, 1, 0.172549, 0, 1,
-1.900932, -0.6844817, -1.911734, 1, 0.1803922, 0, 1,
-1.883624, -0.7198808, -2.613496, 1, 0.1843137, 0, 1,
-1.881353, -1.225659, -2.391822, 1, 0.1921569, 0, 1,
-1.876047, -1.996817, -2.063144, 1, 0.1960784, 0, 1,
-1.863473, -1.102717, -1.287094, 1, 0.2039216, 0, 1,
-1.856871, -1.048967, -3.04358, 1, 0.2117647, 0, 1,
-1.853767, 1.518697, 0.03614198, 1, 0.2156863, 0, 1,
-1.782963, -0.3186814, -2.637235, 1, 0.2235294, 0, 1,
-1.77977, 0.4679215, -1.064187, 1, 0.227451, 0, 1,
-1.767634, 0.2938109, -0.1309818, 1, 0.2352941, 0, 1,
-1.746165, 0.06344903, -1.762658, 1, 0.2392157, 0, 1,
-1.73904, -1.090345, -1.869137, 1, 0.2470588, 0, 1,
-1.730054, -0.4071611, -3.00127, 1, 0.2509804, 0, 1,
-1.723372, -1.03432, -2.914901, 1, 0.2588235, 0, 1,
-1.722519, 0.4169315, -1.662507, 1, 0.2627451, 0, 1,
-1.695579, 0.3935175, -0.9953236, 1, 0.2705882, 0, 1,
-1.653039, 0.293138, -2.111079, 1, 0.2745098, 0, 1,
-1.650963, 0.4907848, -2.070594, 1, 0.282353, 0, 1,
-1.639637, -0.3230395, -3.106877, 1, 0.2862745, 0, 1,
-1.63868, -1.153995, -2.078656, 1, 0.2941177, 0, 1,
-1.624485, -0.9042904, -2.362419, 1, 0.3019608, 0, 1,
-1.612909, 1.201279, -0.5972012, 1, 0.3058824, 0, 1,
-1.608959, 0.4490663, -1.741189, 1, 0.3137255, 0, 1,
-1.572957, 0.1819286, -2.138778, 1, 0.3176471, 0, 1,
-1.568336, -1.153316, -1.306674, 1, 0.3254902, 0, 1,
-1.559635, -0.3882317, -2.368562, 1, 0.3294118, 0, 1,
-1.554205, -0.342839, -1.930496, 1, 0.3372549, 0, 1,
-1.54781, 0.4358773, -0.09604015, 1, 0.3411765, 0, 1,
-1.546171, -0.3709428, -0.7903255, 1, 0.3490196, 0, 1,
-1.516832, 0.5816351, -4.311281, 1, 0.3529412, 0, 1,
-1.510866, 1.278477, 0.2025799, 1, 0.3607843, 0, 1,
-1.509663, 1.074429, -0.794696, 1, 0.3647059, 0, 1,
-1.506774, -0.608005, -2.397274, 1, 0.372549, 0, 1,
-1.502476, -0.03596172, -2.969905, 1, 0.3764706, 0, 1,
-1.491675, -1.317585, -1.747184, 1, 0.3843137, 0, 1,
-1.488315, -0.6297375, -2.139028, 1, 0.3882353, 0, 1,
-1.48699, -0.6278132, -1.139786, 1, 0.3960784, 0, 1,
-1.486959, 1.325367, 0.5661602, 1, 0.4039216, 0, 1,
-1.483803, -0.3989948, -2.487141, 1, 0.4078431, 0, 1,
-1.480927, -0.3488669, -1.897287, 1, 0.4156863, 0, 1,
-1.466991, -0.1019144, -0.9000328, 1, 0.4196078, 0, 1,
-1.463342, -3.339718, -3.620352, 1, 0.427451, 0, 1,
-1.461035, 0.4252097, -1.79551, 1, 0.4313726, 0, 1,
-1.458352, -0.6553301, -1.785932, 1, 0.4392157, 0, 1,
-1.45519, 1.069822, -0.111411, 1, 0.4431373, 0, 1,
-1.454374, -1.282876, -2.158414, 1, 0.4509804, 0, 1,
-1.437716, -0.8737317, -3.854491, 1, 0.454902, 0, 1,
-1.418231, -0.9658034, -2.160205, 1, 0.4627451, 0, 1,
-1.398496, 0.08795531, -2.023008, 1, 0.4666667, 0, 1,
-1.370676, -2.600412, -3.251024, 1, 0.4745098, 0, 1,
-1.361029, -1.023937, -2.113197, 1, 0.4784314, 0, 1,
-1.359739, -2.094526, -4.332353, 1, 0.4862745, 0, 1,
-1.358177, 0.4444724, -1.91636, 1, 0.4901961, 0, 1,
-1.355272, 0.9569189, -0.8839129, 1, 0.4980392, 0, 1,
-1.351611, -0.3985087, -2.476765, 1, 0.5058824, 0, 1,
-1.338667, -0.6613685, -2.708096, 1, 0.509804, 0, 1,
-1.336799, 1.204223, 0.26226, 1, 0.5176471, 0, 1,
-1.335128, -1.872288, -2.820086, 1, 0.5215687, 0, 1,
-1.320226, -0.7473238, -2.223411, 1, 0.5294118, 0, 1,
-1.314078, 0.6028036, -1.422788, 1, 0.5333334, 0, 1,
-1.313793, 0.6725301, -0.2573695, 1, 0.5411765, 0, 1,
-1.3101, -0.7841684, -0.4751918, 1, 0.5450981, 0, 1,
-1.298871, 0.6903278, -2.465009, 1, 0.5529412, 0, 1,
-1.298863, -1.275551, -3.707474, 1, 0.5568628, 0, 1,
-1.297804, 0.6570534, -1.908584, 1, 0.5647059, 0, 1,
-1.291629, -0.7882911, -0.330638, 1, 0.5686275, 0, 1,
-1.280835, 1.572133, -1.856014, 1, 0.5764706, 0, 1,
-1.278806, -0.8642618, -3.311234, 1, 0.5803922, 0, 1,
-1.259248, 1.004736, -1.865736, 1, 0.5882353, 0, 1,
-1.256632, -0.8886831, -1.940615, 1, 0.5921569, 0, 1,
-1.253692, 0.8110853, -1.721034, 1, 0.6, 0, 1,
-1.243059, 0.281137, -1.120297, 1, 0.6078432, 0, 1,
-1.23582, 1.370341, -0.5863191, 1, 0.6117647, 0, 1,
-1.228861, -0.1305609, -0.2405681, 1, 0.6196079, 0, 1,
-1.227764, 0.8017045, -2.595023, 1, 0.6235294, 0, 1,
-1.224361, 0.7180264, -0.3993875, 1, 0.6313726, 0, 1,
-1.223775, 1.736357, 0.1708269, 1, 0.6352941, 0, 1,
-1.222837, -0.1009348, -1.615326, 1, 0.6431373, 0, 1,
-1.212638, -1.828177, -2.94726, 1, 0.6470588, 0, 1,
-1.211563, 0.6649607, -0.5310605, 1, 0.654902, 0, 1,
-1.210719, -0.05076132, -1.56359, 1, 0.6588235, 0, 1,
-1.204393, 0.01060824, -3.094505, 1, 0.6666667, 0, 1,
-1.202518, -0.1245996, -2.657956, 1, 0.6705883, 0, 1,
-1.199579, 0.4027033, -1.416646, 1, 0.6784314, 0, 1,
-1.186119, -0.4647108, -1.358667, 1, 0.682353, 0, 1,
-1.181117, 1.881827, 1.045108, 1, 0.6901961, 0, 1,
-1.179211, -2.845808, -3.015478, 1, 0.6941177, 0, 1,
-1.177967, -0.1689074, -3.758093, 1, 0.7019608, 0, 1,
-1.166339, 0.2306801, 0.1082051, 1, 0.7098039, 0, 1,
-1.165648, -0.4718176, -2.788524, 1, 0.7137255, 0, 1,
-1.162638, -1.260478, -4.427963, 1, 0.7215686, 0, 1,
-1.160519, -1.036824, -1.69475, 1, 0.7254902, 0, 1,
-1.159592, -0.07245989, -0.7579691, 1, 0.7333333, 0, 1,
-1.158846, 1.345085, 0.9417869, 1, 0.7372549, 0, 1,
-1.158389, -0.4528698, -0.7543632, 1, 0.7450981, 0, 1,
-1.155868, -0.8813381, -2.802015, 1, 0.7490196, 0, 1,
-1.151452, -0.2347913, -1.732021, 1, 0.7568628, 0, 1,
-1.147458, -0.7428362, -1.990921, 1, 0.7607843, 0, 1,
-1.139921, 0.01182389, 0.3679014, 1, 0.7686275, 0, 1,
-1.139717, -0.3357228, -1.706106, 1, 0.772549, 0, 1,
-1.138008, 0.3119252, -0.5563634, 1, 0.7803922, 0, 1,
-1.136016, -0.28064, -0.6476552, 1, 0.7843137, 0, 1,
-1.132883, 0.5677069, -2.3183, 1, 0.7921569, 0, 1,
-1.131807, 0.5164289, -1.735399, 1, 0.7960784, 0, 1,
-1.127227, -0.8066415, -3.841501, 1, 0.8039216, 0, 1,
-1.123253, -0.3283529, -1.310338, 1, 0.8117647, 0, 1,
-1.1124, -0.5345291, -2.575095, 1, 0.8156863, 0, 1,
-1.110835, 0.7632996, -0.2365984, 1, 0.8235294, 0, 1,
-1.103213, 1.252198, -0.6811449, 1, 0.827451, 0, 1,
-1.096664, 0.4833117, -1.096051, 1, 0.8352941, 0, 1,
-1.093585, 1.384811, 0.9586811, 1, 0.8392157, 0, 1,
-1.076193, -0.1316924, -1.020022, 1, 0.8470588, 0, 1,
-1.070798, -1.601102, -2.950479, 1, 0.8509804, 0, 1,
-1.068312, -0.2133524, -1.877489, 1, 0.8588235, 0, 1,
-1.061401, 0.8418001, -2.103583, 1, 0.8627451, 0, 1,
-1.060011, -0.6685194, -2.250539, 1, 0.8705882, 0, 1,
-1.052041, 1.037851, -1.978834, 1, 0.8745098, 0, 1,
-1.050621, 0.5237364, -1.172261, 1, 0.8823529, 0, 1,
-1.046297, -1.530315, -3.036314, 1, 0.8862745, 0, 1,
-1.031169, -1.722721, -2.128002, 1, 0.8941177, 0, 1,
-1.022359, 1.463799, 0.2584438, 1, 0.8980392, 0, 1,
-1.020321, -0.9341514, -2.176019, 1, 0.9058824, 0, 1,
-1.020225, -1.286113, -3.565763, 1, 0.9137255, 0, 1,
-1.019755, -0.7818824, -1.741447, 1, 0.9176471, 0, 1,
-1.014791, 0.04287072, -1.859349, 1, 0.9254902, 0, 1,
-1.013096, 1.184093, -1.211042, 1, 0.9294118, 0, 1,
-1.010159, -0.2566972, -2.114484, 1, 0.9372549, 0, 1,
-1.007454, 1.004308, -0.9979781, 1, 0.9411765, 0, 1,
-1.005928, -0.6183011, -3.587692, 1, 0.9490196, 0, 1,
-1.000664, 0.1818097, -2.741045, 1, 0.9529412, 0, 1,
-0.9901818, 0.2286756, -1.069368, 1, 0.9607843, 0, 1,
-0.9805505, -1.081166, -1.949035, 1, 0.9647059, 0, 1,
-0.9762755, 0.1918241, 0.4357075, 1, 0.972549, 0, 1,
-0.9761034, 0.6979094, -0.2204828, 1, 0.9764706, 0, 1,
-0.9727241, 0.1689833, -1.665892, 1, 0.9843137, 0, 1,
-0.9704553, 1.227139, 0.2072711, 1, 0.9882353, 0, 1,
-0.966182, 2.188542, -1.061714, 1, 0.9960784, 0, 1,
-0.9646543, -0.103605, -3.12263, 0.9960784, 1, 0, 1,
-0.9597269, -0.6488555, -2.259244, 0.9921569, 1, 0, 1,
-0.9595896, 0.5955194, -0.3446622, 0.9843137, 1, 0, 1,
-0.9539219, 0.6012906, -2.195652, 0.9803922, 1, 0, 1,
-0.9511374, -1.988976, -2.999049, 0.972549, 1, 0, 1,
-0.9476022, 0.1640299, -0.0172486, 0.9686275, 1, 0, 1,
-0.9367363, 1.103307, -0.8917769, 0.9607843, 1, 0, 1,
-0.9361638, -0.8309728, -2.502331, 0.9568627, 1, 0, 1,
-0.9361185, -1.2585, -1.922174, 0.9490196, 1, 0, 1,
-0.9290421, 0.7969376, -2.095721, 0.945098, 1, 0, 1,
-0.9248605, 0.4985247, -2.011899, 0.9372549, 1, 0, 1,
-0.9176897, -0.1225624, -1.691762, 0.9333333, 1, 0, 1,
-0.9111868, 1.08328, 0.2682189, 0.9254902, 1, 0, 1,
-0.9028129, 0.4794235, -2.227983, 0.9215686, 1, 0, 1,
-0.8961868, -0.8247738, -1.253947, 0.9137255, 1, 0, 1,
-0.8949807, -0.06544108, -1.717679, 0.9098039, 1, 0, 1,
-0.8938087, 0.3263353, -2.94004, 0.9019608, 1, 0, 1,
-0.8912233, 1.311785, -1.138672, 0.8941177, 1, 0, 1,
-0.8869458, -0.05518116, -1.866803, 0.8901961, 1, 0, 1,
-0.8832553, -0.4422898, -0.8611794, 0.8823529, 1, 0, 1,
-0.878584, 1.586122, -1.538839, 0.8784314, 1, 0, 1,
-0.8772395, -0.2628155, -2.374176, 0.8705882, 1, 0, 1,
-0.8749716, 0.4372403, -1.842882, 0.8666667, 1, 0, 1,
-0.8748418, -0.1380312, -3.489322, 0.8588235, 1, 0, 1,
-0.8717234, -0.3684171, -1.640253, 0.854902, 1, 0, 1,
-0.8648371, -0.3462084, -0.857007, 0.8470588, 1, 0, 1,
-0.8641332, -0.3502178, -1.31681, 0.8431373, 1, 0, 1,
-0.8567163, -1.435285, -2.715953, 0.8352941, 1, 0, 1,
-0.8399336, -0.02670525, -0.6967895, 0.8313726, 1, 0, 1,
-0.837287, 0.1061681, -1.90913, 0.8235294, 1, 0, 1,
-0.8363186, -0.1336585, 0.07940145, 0.8196079, 1, 0, 1,
-0.8358778, 0.2100782, -2.231119, 0.8117647, 1, 0, 1,
-0.832321, -1.122133, -4.01597, 0.8078431, 1, 0, 1,
-0.8255944, -0.2025843, -2.832547, 0.8, 1, 0, 1,
-0.8251411, 1.034671, -0.0616759, 0.7921569, 1, 0, 1,
-0.817983, 1.34541, -0.3855423, 0.7882353, 1, 0, 1,
-0.8054947, 0.9871662, -1.789533, 0.7803922, 1, 0, 1,
-0.7984136, 0.6559001, -1.095528, 0.7764706, 1, 0, 1,
-0.7973031, -0.09484187, -2.327537, 0.7686275, 1, 0, 1,
-0.7904038, 0.4325733, -0.6192334, 0.7647059, 1, 0, 1,
-0.7888293, -0.8218716, -2.572279, 0.7568628, 1, 0, 1,
-0.7888026, 0.7496115, 0.2304553, 0.7529412, 1, 0, 1,
-0.7782229, -0.6226252, -1.673572, 0.7450981, 1, 0, 1,
-0.7740301, -0.7137868, -2.780786, 0.7411765, 1, 0, 1,
-0.7643578, -2.582938, -1.687983, 0.7333333, 1, 0, 1,
-0.7639426, -0.08078527, -2.586905, 0.7294118, 1, 0, 1,
-0.7630636, -0.7161568, -2.053455, 0.7215686, 1, 0, 1,
-0.7628475, 0.01187768, -2.773695, 0.7176471, 1, 0, 1,
-0.7577608, -0.9733801, -0.962002, 0.7098039, 1, 0, 1,
-0.7452421, 0.589233, -0.9537721, 0.7058824, 1, 0, 1,
-0.7405737, -0.2443959, -1.917989, 0.6980392, 1, 0, 1,
-0.7393878, -0.1953967, -1.528368, 0.6901961, 1, 0, 1,
-0.7380344, -0.2862199, 0.04699489, 0.6862745, 1, 0, 1,
-0.7300733, 0.4233604, -0.3150807, 0.6784314, 1, 0, 1,
-0.7297768, -0.2120479, -2.600924, 0.6745098, 1, 0, 1,
-0.729424, -0.8191276, -3.176876, 0.6666667, 1, 0, 1,
-0.7247088, 1.757734, 1.309355, 0.6627451, 1, 0, 1,
-0.7214671, 0.07506142, 0.3514931, 0.654902, 1, 0, 1,
-0.7198826, 1.034268, -2.098687, 0.6509804, 1, 0, 1,
-0.7168208, 2.454281, -0.8067355, 0.6431373, 1, 0, 1,
-0.7135853, 1.874919, -1.262379, 0.6392157, 1, 0, 1,
-0.7067107, -0.4595475, -2.451303, 0.6313726, 1, 0, 1,
-0.6848689, 0.9444947, -0.9439378, 0.627451, 1, 0, 1,
-0.6812206, 0.1284308, -2.894677, 0.6196079, 1, 0, 1,
-0.6781836, 0.1347207, -1.162912, 0.6156863, 1, 0, 1,
-0.6770801, 1.107623, 2.053715, 0.6078432, 1, 0, 1,
-0.6749481, -0.861067, -1.717663, 0.6039216, 1, 0, 1,
-0.6629368, -0.2354882, -0.2827729, 0.5960785, 1, 0, 1,
-0.6623283, 0.4877027, -2.162695, 0.5882353, 1, 0, 1,
-0.6603506, -0.5713469, -3.306433, 0.5843138, 1, 0, 1,
-0.6590701, -0.365898, -3.025059, 0.5764706, 1, 0, 1,
-0.6589096, 0.6058404, -0.8445323, 0.572549, 1, 0, 1,
-0.6497821, 0.8447692, -0.2078279, 0.5647059, 1, 0, 1,
-0.6459114, 0.4536468, -2.588292, 0.5607843, 1, 0, 1,
-0.6395623, -0.930496, -3.044613, 0.5529412, 1, 0, 1,
-0.6388374, -0.313957, -2.998095, 0.5490196, 1, 0, 1,
-0.6364019, -0.4724379, -2.769002, 0.5411765, 1, 0, 1,
-0.6334572, -1.027746, -1.738555, 0.5372549, 1, 0, 1,
-0.6327908, 0.4089578, -0.5983574, 0.5294118, 1, 0, 1,
-0.6312099, -1.550759, -1.264217, 0.5254902, 1, 0, 1,
-0.6282493, 1.045843, -0.2603115, 0.5176471, 1, 0, 1,
-0.6257905, -0.2372445, -1.288206, 0.5137255, 1, 0, 1,
-0.6248682, -0.8445635, -2.78862, 0.5058824, 1, 0, 1,
-0.622807, -0.8395281, -1.241256, 0.5019608, 1, 0, 1,
-0.6224527, 0.2377909, -1.17315, 0.4941176, 1, 0, 1,
-0.6220208, 0.1284388, -0.02858766, 0.4862745, 1, 0, 1,
-0.621, 0.6210238, -1.23418, 0.4823529, 1, 0, 1,
-0.6197531, 0.116227, -2.097983, 0.4745098, 1, 0, 1,
-0.6188421, -1.306322, -3.909929, 0.4705882, 1, 0, 1,
-0.6183783, -1.259652, -1.05128, 0.4627451, 1, 0, 1,
-0.6160462, 0.3106741, -0.8738228, 0.4588235, 1, 0, 1,
-0.6117975, 0.1899768, -1.128109, 0.4509804, 1, 0, 1,
-0.6111211, -0.3026139, -1.501846, 0.4470588, 1, 0, 1,
-0.6078279, -0.8398397, -1.250665, 0.4392157, 1, 0, 1,
-0.604399, -0.2304875, -1.975896, 0.4352941, 1, 0, 1,
-0.6029277, -0.8797216, -3.219098, 0.427451, 1, 0, 1,
-0.6000808, 0.8649396, 0.7143375, 0.4235294, 1, 0, 1,
-0.5974637, 1.590151, 0.2267887, 0.4156863, 1, 0, 1,
-0.5945477, -0.1076199, -1.846948, 0.4117647, 1, 0, 1,
-0.5929264, 0.2827345, -0.9320354, 0.4039216, 1, 0, 1,
-0.5903857, -0.9579648, -2.420964, 0.3960784, 1, 0, 1,
-0.5903456, 0.8010495, -1.39852, 0.3921569, 1, 0, 1,
-0.5861744, -0.8850533, -1.564065, 0.3843137, 1, 0, 1,
-0.5819069, -1.511236, -4.770882, 0.3803922, 1, 0, 1,
-0.5807657, -0.3327532, -3.099738, 0.372549, 1, 0, 1,
-0.5778139, 0.8262154, -1.952891, 0.3686275, 1, 0, 1,
-0.5773823, -1.493502, -2.86521, 0.3607843, 1, 0, 1,
-0.5773662, -1.040781, -2.172488, 0.3568628, 1, 0, 1,
-0.5716463, -1.142599, -3.235215, 0.3490196, 1, 0, 1,
-0.5714282, 0.2431331, -2.816423, 0.345098, 1, 0, 1,
-0.5708318, 0.538476, -0.8595564, 0.3372549, 1, 0, 1,
-0.5640773, 0.8421311, -0.4211909, 0.3333333, 1, 0, 1,
-0.5631256, -1.138792, -2.480874, 0.3254902, 1, 0, 1,
-0.5607658, 0.4793668, 0.7141748, 0.3215686, 1, 0, 1,
-0.559194, 0.4555637, 0.08604773, 0.3137255, 1, 0, 1,
-0.5574263, 0.8632925, 0.5778127, 0.3098039, 1, 0, 1,
-0.5495379, -0.738981, -3.605839, 0.3019608, 1, 0, 1,
-0.5489166, 1.142312, -2.08001, 0.2941177, 1, 0, 1,
-0.5467336, -0.5568401, -2.878146, 0.2901961, 1, 0, 1,
-0.5455843, -0.6623561, -2.860891, 0.282353, 1, 0, 1,
-0.5414431, 0.6846979, -0.7574102, 0.2784314, 1, 0, 1,
-0.5370498, 0.02977262, -2.442611, 0.2705882, 1, 0, 1,
-0.5289764, -0.8338502, -3.120728, 0.2666667, 1, 0, 1,
-0.5255432, 0.06187641, -3.082426, 0.2588235, 1, 0, 1,
-0.5237208, 2.626458, -0.8980389, 0.254902, 1, 0, 1,
-0.5210388, -0.4506335, -2.047228, 0.2470588, 1, 0, 1,
-0.5189703, 0.09754185, -0.8587697, 0.2431373, 1, 0, 1,
-0.5185179, -0.1288159, -0.9749467, 0.2352941, 1, 0, 1,
-0.5184218, -1.236945, -2.59736, 0.2313726, 1, 0, 1,
-0.5136184, -0.2932887, -1.415642, 0.2235294, 1, 0, 1,
-0.5115767, -0.6459917, -2.951325, 0.2196078, 1, 0, 1,
-0.5100338, 1.647122, 1.246923, 0.2117647, 1, 0, 1,
-0.5091187, 0.9473636, 0.6513694, 0.2078431, 1, 0, 1,
-0.5084784, -0.6225687, -2.653247, 0.2, 1, 0, 1,
-0.505597, -0.2278838, -3.054428, 0.1921569, 1, 0, 1,
-0.4991015, -0.5770061, -2.254275, 0.1882353, 1, 0, 1,
-0.4977787, -0.259827, -0.8300232, 0.1803922, 1, 0, 1,
-0.4923497, -0.4574711, -1.519456, 0.1764706, 1, 0, 1,
-0.4863066, 0.9840477, -0.6283715, 0.1686275, 1, 0, 1,
-0.484236, -0.4485288, -2.516077, 0.1647059, 1, 0, 1,
-0.4832743, -1.043249, -3.80562, 0.1568628, 1, 0, 1,
-0.4826056, -0.9864676, -0.4986661, 0.1529412, 1, 0, 1,
-0.4814728, 0.8262858, 0.7401007, 0.145098, 1, 0, 1,
-0.478866, -0.1855814, -3.093225, 0.1411765, 1, 0, 1,
-0.4704267, 1.395167, -1.509048, 0.1333333, 1, 0, 1,
-0.4642881, 1.04375, -2.133975, 0.1294118, 1, 0, 1,
-0.4637707, -1.372419, -3.397768, 0.1215686, 1, 0, 1,
-0.4636757, 0.4075391, -3.570004, 0.1176471, 1, 0, 1,
-0.4622444, 0.9876387, 0.6696844, 0.1098039, 1, 0, 1,
-0.4599432, 0.351595, -2.564365, 0.1058824, 1, 0, 1,
-0.4569246, -1.359178, -1.62867, 0.09803922, 1, 0, 1,
-0.4485389, -0.8908181, -1.970813, 0.09019608, 1, 0, 1,
-0.446948, -0.2584444, -2.902827, 0.08627451, 1, 0, 1,
-0.4412487, 0.2723497, -0.9631964, 0.07843138, 1, 0, 1,
-0.4391373, -1.120217, -3.424034, 0.07450981, 1, 0, 1,
-0.4344591, 0.8244652, 0.6034101, 0.06666667, 1, 0, 1,
-0.4332496, -0.686173, -2.501981, 0.0627451, 1, 0, 1,
-0.4331746, 0.05771856, 0.4999589, 0.05490196, 1, 0, 1,
-0.430209, -0.06368447, -0.946968, 0.05098039, 1, 0, 1,
-0.4300785, -0.2010126, -1.86983, 0.04313726, 1, 0, 1,
-0.4280359, 0.2056771, -1.643751, 0.03921569, 1, 0, 1,
-0.4269046, 0.2932517, -0.8666369, 0.03137255, 1, 0, 1,
-0.4256576, 0.0234142, -1.044927, 0.02745098, 1, 0, 1,
-0.4242921, 0.7912832, -1.87738, 0.01960784, 1, 0, 1,
-0.4213699, 1.828473, -2.706539, 0.01568628, 1, 0, 1,
-0.4201487, -0.7281444, -2.681004, 0.007843138, 1, 0, 1,
-0.4143129, -1.543908, -2.4835, 0.003921569, 1, 0, 1,
-0.4056012, -0.3708833, -2.326647, 0, 1, 0.003921569, 1,
-0.404689, -1.201737, -3.52324, 0, 1, 0.01176471, 1,
-0.4012787, -0.432098, -2.298845, 0, 1, 0.01568628, 1,
-0.3992402, 0.5988475, 0.414528, 0, 1, 0.02352941, 1,
-0.3956893, 0.2817843, -2.236446, 0, 1, 0.02745098, 1,
-0.3919429, -0.1512307, -1.021236, 0, 1, 0.03529412, 1,
-0.3913212, -0.262765, -3.172348, 0, 1, 0.03921569, 1,
-0.3908585, 1.504454, -0.1241687, 0, 1, 0.04705882, 1,
-0.3908455, 0.3238352, 0.7366468, 0, 1, 0.05098039, 1,
-0.3892961, -0.3830409, -2.462255, 0, 1, 0.05882353, 1,
-0.3852017, 1.849578, 1.340927, 0, 1, 0.0627451, 1,
-0.3710395, -0.1128698, -3.949763, 0, 1, 0.07058824, 1,
-0.3696764, -0.1374269, -3.951172, 0, 1, 0.07450981, 1,
-0.3696486, -2.377714, -2.898723, 0, 1, 0.08235294, 1,
-0.366776, -0.7788039, -1.986864, 0, 1, 0.08627451, 1,
-0.3667698, -0.2211584, -1.361579, 0, 1, 0.09411765, 1,
-0.3627869, 0.393501, 0.1109221, 0, 1, 0.1019608, 1,
-0.3625044, 0.359541, -0.2460393, 0, 1, 0.1058824, 1,
-0.3619646, -0.8302693, -2.718078, 0, 1, 0.1137255, 1,
-0.3588091, 2.007304, -1.34145, 0, 1, 0.1176471, 1,
-0.3583365, 0.1746258, -0.451425, 0, 1, 0.1254902, 1,
-0.3575711, -1.25279, -1.06732, 0, 1, 0.1294118, 1,
-0.3528736, -0.001685475, 0.2886595, 0, 1, 0.1372549, 1,
-0.3430636, 2.634995, -1.680271, 0, 1, 0.1411765, 1,
-0.3387095, 0.4252541, -1.10137, 0, 1, 0.1490196, 1,
-0.3381838, 0.2216755, -2.738214, 0, 1, 0.1529412, 1,
-0.3360961, -0.3103892, -2.805911, 0, 1, 0.1607843, 1,
-0.3326308, 0.2238615, -0.4445083, 0, 1, 0.1647059, 1,
-0.3320754, 1.366766, -1.003576, 0, 1, 0.172549, 1,
-0.3311884, 1.00423, 0.2702016, 0, 1, 0.1764706, 1,
-0.3289511, -0.2519866, -3.889404, 0, 1, 0.1843137, 1,
-0.3266061, 0.486819, 0.3436071, 0, 1, 0.1882353, 1,
-0.3249926, -0.04958989, -2.885716, 0, 1, 0.1960784, 1,
-0.3234946, -0.6829088, -4.404196, 0, 1, 0.2039216, 1,
-0.3218091, 0.4649139, -0.7371092, 0, 1, 0.2078431, 1,
-0.3195447, 0.7557371, 0.1291697, 0, 1, 0.2156863, 1,
-0.3187809, 0.2865036, -0.7808897, 0, 1, 0.2196078, 1,
-0.3165685, 0.9296024, 0.6823446, 0, 1, 0.227451, 1,
-0.3145471, -0.8465108, -2.81434, 0, 1, 0.2313726, 1,
-0.3025966, -0.7987905, -3.14955, 0, 1, 0.2392157, 1,
-0.3006031, 2.255968, -0.3088851, 0, 1, 0.2431373, 1,
-0.3005623, 0.7873952, -0.1066913, 0, 1, 0.2509804, 1,
-0.2999093, -0.214754, -1.846842, 0, 1, 0.254902, 1,
-0.2960699, -1.310135, -2.956682, 0, 1, 0.2627451, 1,
-0.2914702, -2.32058, -4.165, 0, 1, 0.2666667, 1,
-0.2910736, -1.955217, -4.036186, 0, 1, 0.2745098, 1,
-0.2889368, -0.5005122, -2.251973, 0, 1, 0.2784314, 1,
-0.2876914, 0.2634379, -1.272649, 0, 1, 0.2862745, 1,
-0.286056, 1.505978, -0.6789696, 0, 1, 0.2901961, 1,
-0.2784602, -1.196168, -2.449905, 0, 1, 0.2980392, 1,
-0.2776568, -1.156781, -2.432409, 0, 1, 0.3058824, 1,
-0.2744522, 0.07543804, -3.619938, 0, 1, 0.3098039, 1,
-0.267018, -0.5205876, -1.704628, 0, 1, 0.3176471, 1,
-0.2664611, 1.303395, -0.6559343, 0, 1, 0.3215686, 1,
-0.2663944, 0.7335514, -0.767911, 0, 1, 0.3294118, 1,
-0.2655038, -2.201089, -1.781738, 0, 1, 0.3333333, 1,
-0.2651002, 0.8371691, 1.491717, 0, 1, 0.3411765, 1,
-0.2608048, -0.4220207, -2.071784, 0, 1, 0.345098, 1,
-0.259281, 1.147344, -0.5653021, 0, 1, 0.3529412, 1,
-0.258045, -0.8322026, -2.158499, 0, 1, 0.3568628, 1,
-0.2570076, 1.868219, -0.6331042, 0, 1, 0.3647059, 1,
-0.2551519, 1.626008, -0.1439574, 0, 1, 0.3686275, 1,
-0.2536251, -0.395569, -4.270642, 0, 1, 0.3764706, 1,
-0.2505926, 0.2878733, -1.287451, 0, 1, 0.3803922, 1,
-0.2480588, 0.2068504, -1.200709, 0, 1, 0.3882353, 1,
-0.2474566, 0.1517068, 0.5270364, 0, 1, 0.3921569, 1,
-0.2466079, -0.2731331, -1.321365, 0, 1, 0.4, 1,
-0.2452967, -0.6797631, -1.872991, 0, 1, 0.4078431, 1,
-0.2424669, -0.065923, -2.401579, 0, 1, 0.4117647, 1,
-0.2416361, -0.8447197, -1.490233, 0, 1, 0.4196078, 1,
-0.2407375, -0.2293936, -2.611177, 0, 1, 0.4235294, 1,
-0.2401584, 0.4989591, -0.03172654, 0, 1, 0.4313726, 1,
-0.2381741, 1.28045, -0.5527434, 0, 1, 0.4352941, 1,
-0.2342894, 0.9127522, -0.6196471, 0, 1, 0.4431373, 1,
-0.2308216, 0.8814238, -1.864415, 0, 1, 0.4470588, 1,
-0.2286734, 1.813805, 1.072092, 0, 1, 0.454902, 1,
-0.2277454, -0.5548769, -2.145479, 0, 1, 0.4588235, 1,
-0.2272589, 0.8523874, 0.09445353, 0, 1, 0.4666667, 1,
-0.225498, -0.9138077, -4.971964, 0, 1, 0.4705882, 1,
-0.2185267, 2.593031, -1.183565, 0, 1, 0.4784314, 1,
-0.217805, 0.2161485, -0.9782512, 0, 1, 0.4823529, 1,
-0.2151241, 0.2519724, 0.4065243, 0, 1, 0.4901961, 1,
-0.2146469, -1.214124, -3.032318, 0, 1, 0.4941176, 1,
-0.2130599, 0.4236626, -0.7050647, 0, 1, 0.5019608, 1,
-0.2038967, 0.5513653, 0.1698006, 0, 1, 0.509804, 1,
-0.203116, 0.04449791, -2.101941, 0, 1, 0.5137255, 1,
-0.2029677, -0.6203824, -3.70017, 0, 1, 0.5215687, 1,
-0.2025932, -0.4224401, -5.450471, 0, 1, 0.5254902, 1,
-0.2003282, -0.1775743, -3.099382, 0, 1, 0.5333334, 1,
-0.2000232, 1.460952, -0.3833014, 0, 1, 0.5372549, 1,
-0.1980513, -1.149757, -2.913444, 0, 1, 0.5450981, 1,
-0.1928197, 1.690027, -0.1605375, 0, 1, 0.5490196, 1,
-0.1913461, 3.506745, 1.605046, 0, 1, 0.5568628, 1,
-0.189956, 2.093432, -1.902891, 0, 1, 0.5607843, 1,
-0.1890868, 0.3532139, -1.977798, 0, 1, 0.5686275, 1,
-0.1882869, -1.544443, -2.030977, 0, 1, 0.572549, 1,
-0.1841755, -1.50253, -4.447605, 0, 1, 0.5803922, 1,
-0.1831868, -1.491711, -1.137564, 0, 1, 0.5843138, 1,
-0.1789458, -1.323174, -1.673962, 0, 1, 0.5921569, 1,
-0.1786917, 2.052651, 1.064294, 0, 1, 0.5960785, 1,
-0.1777472, -0.6682656, -3.771753, 0, 1, 0.6039216, 1,
-0.1742842, 0.2999471, 0.2101913, 0, 1, 0.6117647, 1,
-0.1685388, 0.1719367, -1.703732, 0, 1, 0.6156863, 1,
-0.1659783, -0.4588245, -1.203419, 0, 1, 0.6235294, 1,
-0.1644167, -1.275249, -2.721361, 0, 1, 0.627451, 1,
-0.1635331, -0.8618414, -2.436458, 0, 1, 0.6352941, 1,
-0.1590046, -0.396005, -2.886424, 0, 1, 0.6392157, 1,
-0.1561986, 0.3440253, -0.2675295, 0, 1, 0.6470588, 1,
-0.1521516, -2.01891, -4.33085, 0, 1, 0.6509804, 1,
-0.1512861, -0.2178632, -2.744667, 0, 1, 0.6588235, 1,
-0.1506676, -0.2760598, -3.570998, 0, 1, 0.6627451, 1,
-0.1473958, -0.9647844, -2.769169, 0, 1, 0.6705883, 1,
-0.1468909, -1.004558, -2.456423, 0, 1, 0.6745098, 1,
-0.1396573, 1.789427, -1.281337, 0, 1, 0.682353, 1,
-0.1323637, -0.02222042, -2.722324, 0, 1, 0.6862745, 1,
-0.1322343, 0.3303954, 1.298228, 0, 1, 0.6941177, 1,
-0.1303927, 0.6007932, -0.1301949, 0, 1, 0.7019608, 1,
-0.1297276, -1.24296, -2.998827, 0, 1, 0.7058824, 1,
-0.1284172, 0.8531631, 0.03974845, 0, 1, 0.7137255, 1,
-0.128234, -2.083365, -2.822086, 0, 1, 0.7176471, 1,
-0.1261674, -0.4448115, -3.567917, 0, 1, 0.7254902, 1,
-0.1225935, 0.317129, 1.042156, 0, 1, 0.7294118, 1,
-0.1179652, -0.3396706, -0.9802784, 0, 1, 0.7372549, 1,
-0.1178247, 0.06144004, -0.8189254, 0, 1, 0.7411765, 1,
-0.1160047, -1.79326, -3.05599, 0, 1, 0.7490196, 1,
-0.1142432, -1.352837, -3.337454, 0, 1, 0.7529412, 1,
-0.1107967, -1.47588, -3.380044, 0, 1, 0.7607843, 1,
-0.109138, -1.374416, -1.877535, 0, 1, 0.7647059, 1,
-0.1079277, 0.4563265, 0.01319885, 0, 1, 0.772549, 1,
-0.1018893, -0.08789466, -3.412409, 0, 1, 0.7764706, 1,
-0.09988029, -0.7025065, -2.276906, 0, 1, 0.7843137, 1,
-0.09957694, 1.979277, 0.3814411, 0, 1, 0.7882353, 1,
-0.09777023, 1.317358, -0.07607672, 0, 1, 0.7960784, 1,
-0.09109038, 1.462513, -0.4328204, 0, 1, 0.8039216, 1,
-0.0895662, -0.3707378, -3.307544, 0, 1, 0.8078431, 1,
-0.08948995, -1.093516, -3.59797, 0, 1, 0.8156863, 1,
-0.08917001, 1.156295, 0.2232129, 0, 1, 0.8196079, 1,
-0.08443035, 0.2066565, 0.279638, 0, 1, 0.827451, 1,
-0.08408641, -1.807013, -2.621848, 0, 1, 0.8313726, 1,
-0.08396816, 0.9036117, 1.516471, 0, 1, 0.8392157, 1,
-0.07197475, -0.5030177, -1.262444, 0, 1, 0.8431373, 1,
-0.06172234, -1.452176, -1.52833, 0, 1, 0.8509804, 1,
-0.05903073, 1.034921, 0.9021764, 0, 1, 0.854902, 1,
-0.05825493, 0.188361, -2.120924, 0, 1, 0.8627451, 1,
-0.0553663, 2.942955, 0.2110198, 0, 1, 0.8666667, 1,
-0.05451846, -0.1124152, -2.289057, 0, 1, 0.8745098, 1,
-0.05379768, 0.318702, -1.365397, 0, 1, 0.8784314, 1,
-0.05087831, 0.9583179, -1.333121, 0, 1, 0.8862745, 1,
-0.04570144, -0.6597914, -3.1579, 0, 1, 0.8901961, 1,
-0.04451295, -0.5031204, -2.549341, 0, 1, 0.8980392, 1,
-0.04000348, -0.5890964, -5.155545, 0, 1, 0.9058824, 1,
-0.03936575, -1.965901, -2.225365, 0, 1, 0.9098039, 1,
-0.03930042, -1.487304, -3.43812, 0, 1, 0.9176471, 1,
-0.03807241, -1.650425, -3.939215, 0, 1, 0.9215686, 1,
-0.03506591, -1.651621, -3.670568, 0, 1, 0.9294118, 1,
-0.02843766, 0.8363646, -0.8958142, 0, 1, 0.9333333, 1,
-0.02598586, 1.757237, 0.05214244, 0, 1, 0.9411765, 1,
-0.02460599, 0.05260924, -2.391886, 0, 1, 0.945098, 1,
-0.02210837, 0.02902684, 0.06593549, 0, 1, 0.9529412, 1,
-0.02167242, -0.5116963, -0.9287327, 0, 1, 0.9568627, 1,
-0.01949913, -0.2003558, -2.9914, 0, 1, 0.9647059, 1,
-0.01947564, -1.335891, -3.239105, 0, 1, 0.9686275, 1,
-0.01663454, -1.263908, -2.41877, 0, 1, 0.9764706, 1,
-0.01661059, 1.626256, -0.6469518, 0, 1, 0.9803922, 1,
-0.01481686, -0.2305589, -2.658994, 0, 1, 0.9882353, 1,
-0.01432435, 0.469067, 0.7769062, 0, 1, 0.9921569, 1,
-0.008857337, 0.3511216, 1.379075, 0, 1, 1, 1,
-0.006648635, -1.490235, -3.848976, 0, 0.9921569, 1, 1,
-0.002557541, -1.40663, -2.186511, 0, 0.9882353, 1, 1,
0.001605234, 0.3923721, -1.326614, 0, 0.9803922, 1, 1,
0.00390964, -1.938517, 5.749891, 0, 0.9764706, 1, 1,
0.007072562, -1.334974, 3.229995, 0, 0.9686275, 1, 1,
0.007759202, 1.681808, -0.8246978, 0, 0.9647059, 1, 1,
0.01096187, -0.4411518, 2.5615, 0, 0.9568627, 1, 1,
0.01112858, 0.4017235, 1.133687, 0, 0.9529412, 1, 1,
0.0182993, 0.3579471, -0.7956065, 0, 0.945098, 1, 1,
0.02528471, -1.465967, 2.902524, 0, 0.9411765, 1, 1,
0.02668578, -0.3360476, 3.050689, 0, 0.9333333, 1, 1,
0.02766379, 1.009543, -0.6067839, 0, 0.9294118, 1, 1,
0.02960971, 1.366838, 0.1708601, 0, 0.9215686, 1, 1,
0.03148691, 1.014064, 1.190927, 0, 0.9176471, 1, 1,
0.03190699, 1.298668, 0.1541613, 0, 0.9098039, 1, 1,
0.03681897, -0.6067473, 2.815772, 0, 0.9058824, 1, 1,
0.03767035, 0.07278516, 1.726314, 0, 0.8980392, 1, 1,
0.03939255, -1.123218, 3.443942, 0, 0.8901961, 1, 1,
0.04627057, 0.2656451, 0.8072653, 0, 0.8862745, 1, 1,
0.04765806, 0.2534463, 0.1230247, 0, 0.8784314, 1, 1,
0.04891638, 1.154534, -0.7228256, 0, 0.8745098, 1, 1,
0.05185717, -0.1502822, 1.9061, 0, 0.8666667, 1, 1,
0.05905404, -0.3161649, 1.681653, 0, 0.8627451, 1, 1,
0.06122995, -1.559207, 4.805338, 0, 0.854902, 1, 1,
0.06235634, 1.580679, 0.3242129, 0, 0.8509804, 1, 1,
0.06361031, 0.7961033, -0.3958741, 0, 0.8431373, 1, 1,
0.06361552, 0.2388079, -0.5153953, 0, 0.8392157, 1, 1,
0.06929889, -0.2943771, 3.054008, 0, 0.8313726, 1, 1,
0.06940241, -0.2836275, 2.434862, 0, 0.827451, 1, 1,
0.07088916, 0.3086417, 1.876139, 0, 0.8196079, 1, 1,
0.07106717, -1.145444, 4.576241, 0, 0.8156863, 1, 1,
0.07142965, -0.7611185, 3.684757, 0, 0.8078431, 1, 1,
0.07170352, 0.1040519, 0.6210932, 0, 0.8039216, 1, 1,
0.07549232, 0.4027325, 0.3254171, 0, 0.7960784, 1, 1,
0.07562941, 0.7733918, 1.381638, 0, 0.7882353, 1, 1,
0.07741377, 0.5783247, 0.486338, 0, 0.7843137, 1, 1,
0.08309396, -0.4367895, 1.21741, 0, 0.7764706, 1, 1,
0.08584458, 1.520893, 1.381058, 0, 0.772549, 1, 1,
0.08609361, 0.4853815, -1.280475, 0, 0.7647059, 1, 1,
0.09620778, -1.608987, 3.259384, 0, 0.7607843, 1, 1,
0.09666751, 1.674777, -0.1570323, 0, 0.7529412, 1, 1,
0.09799043, 0.08989699, 0.1235029, 0, 0.7490196, 1, 1,
0.09872194, 1.437839, -1.136847, 0, 0.7411765, 1, 1,
0.1020777, -0.1071964, 2.568439, 0, 0.7372549, 1, 1,
0.1031388, -0.7752819, 4.904452, 0, 0.7294118, 1, 1,
0.1032023, 0.6665753, 0.2613404, 0, 0.7254902, 1, 1,
0.1095241, 1.284315, -1.828709, 0, 0.7176471, 1, 1,
0.1105646, 2.095111, -0.1966717, 0, 0.7137255, 1, 1,
0.1115562, 0.541852, 0.1193913, 0, 0.7058824, 1, 1,
0.1245847, -1.782001, 2.763135, 0, 0.6980392, 1, 1,
0.1252283, 2.113557, -0.6772323, 0, 0.6941177, 1, 1,
0.126191, -1.266157, 1.153376, 0, 0.6862745, 1, 1,
0.1266375, -0.3218799, 3.020683, 0, 0.682353, 1, 1,
0.1293064, 0.3516221, 0.2298598, 0, 0.6745098, 1, 1,
0.1349059, -0.5859252, 4.444123, 0, 0.6705883, 1, 1,
0.1422609, 0.4596815, 1.721444, 0, 0.6627451, 1, 1,
0.1429558, 2.317978, -0.2688862, 0, 0.6588235, 1, 1,
0.1497388, -1.157238, 1.827342, 0, 0.6509804, 1, 1,
0.1509107, -0.1968922, 2.450088, 0, 0.6470588, 1, 1,
0.1560232, 1.456083, -0.3360266, 0, 0.6392157, 1, 1,
0.1567156, 0.2816675, -1.085824, 0, 0.6352941, 1, 1,
0.1567668, 1.521232, 0.7803116, 0, 0.627451, 1, 1,
0.1579131, -0.6647104, 3.555915, 0, 0.6235294, 1, 1,
0.1587297, 0.4098675, 0.6983019, 0, 0.6156863, 1, 1,
0.1596874, 0.09488805, 0.2572855, 0, 0.6117647, 1, 1,
0.1618447, 0.8406103, -1.0661, 0, 0.6039216, 1, 1,
0.1655658, 0.2758412, 1.040493, 0, 0.5960785, 1, 1,
0.1657302, -0.3064987, 2.69055, 0, 0.5921569, 1, 1,
0.1709623, 0.6959645, -0.5004975, 0, 0.5843138, 1, 1,
0.1752709, -0.1098411, 1.14526, 0, 0.5803922, 1, 1,
0.1780889, -1.001772, 0.1108594, 0, 0.572549, 1, 1,
0.1807353, -0.2406347, 1.685313, 0, 0.5686275, 1, 1,
0.1823572, -1.175979, 3.755597, 0, 0.5607843, 1, 1,
0.1842655, -0.9144314, 3.719315, 0, 0.5568628, 1, 1,
0.1844414, 1.611942, -0.7850593, 0, 0.5490196, 1, 1,
0.1853685, -0.4234969, 2.519118, 0, 0.5450981, 1, 1,
0.1865635, 1.709711, -0.293159, 0, 0.5372549, 1, 1,
0.1922638, 0.8462175, 0.002810294, 0, 0.5333334, 1, 1,
0.1922888, -0.3783411, 3.014882, 0, 0.5254902, 1, 1,
0.1965985, 0.7064943, -0.6181468, 0, 0.5215687, 1, 1,
0.196905, -1.881765, 4.337176, 0, 0.5137255, 1, 1,
0.1981896, -0.2425434, 2.821034, 0, 0.509804, 1, 1,
0.198848, 1.100157, -0.6373678, 0, 0.5019608, 1, 1,
0.1997018, 0.05090518, 0.5613509, 0, 0.4941176, 1, 1,
0.2016569, -1.241382, 3.708663, 0, 0.4901961, 1, 1,
0.2039084, 1.101969, -1.171697, 0, 0.4823529, 1, 1,
0.2063049, -0.4530144, 2.50488, 0, 0.4784314, 1, 1,
0.2127777, 0.2313809, 0.967328, 0, 0.4705882, 1, 1,
0.214449, 0.1243823, 1.042684, 0, 0.4666667, 1, 1,
0.21819, -0.8965619, 3.444504, 0, 0.4588235, 1, 1,
0.2199334, -1.734433, 2.960873, 0, 0.454902, 1, 1,
0.2301915, 1.568671, -0.518461, 0, 0.4470588, 1, 1,
0.2316536, 0.07593972, 1.731731, 0, 0.4431373, 1, 1,
0.2317519, 0.01912227, 1.786898, 0, 0.4352941, 1, 1,
0.2324408, 0.6306616, 0.8803198, 0, 0.4313726, 1, 1,
0.2326874, 0.3947588, 0.6867368, 0, 0.4235294, 1, 1,
0.2334515, -1.231994, 2.706617, 0, 0.4196078, 1, 1,
0.2353504, -0.8301944, 0.604866, 0, 0.4117647, 1, 1,
0.2356017, 1.289225, -0.3721011, 0, 0.4078431, 1, 1,
0.236139, -0.02539934, 1.257734, 0, 0.4, 1, 1,
0.239794, -2.074152, 3.370614, 0, 0.3921569, 1, 1,
0.2526039, -0.05012465, 2.633094, 0, 0.3882353, 1, 1,
0.2640831, -0.6784253, 1.957718, 0, 0.3803922, 1, 1,
0.2645091, -0.2936867, 2.925171, 0, 0.3764706, 1, 1,
0.2648491, 0.6172876, 0.8273507, 0, 0.3686275, 1, 1,
0.2653187, 0.636384, -0.02050985, 0, 0.3647059, 1, 1,
0.2689024, -0.4073158, 3.527198, 0, 0.3568628, 1, 1,
0.269254, -0.1942477, 2.080585, 0, 0.3529412, 1, 1,
0.2717007, 0.2892341, 0.5654407, 0, 0.345098, 1, 1,
0.2720526, -0.6334664, 2.3382, 0, 0.3411765, 1, 1,
0.2733241, -0.7024775, 2.024253, 0, 0.3333333, 1, 1,
0.2751374, 0.4381762, -1.184859, 0, 0.3294118, 1, 1,
0.2751942, 1.205663, -0.8803965, 0, 0.3215686, 1, 1,
0.2752093, -0.1080103, 2.246939, 0, 0.3176471, 1, 1,
0.2775004, 0.2771982, 1.297354, 0, 0.3098039, 1, 1,
0.2805531, 0.07216606, 1.791124, 0, 0.3058824, 1, 1,
0.2821255, 2.761652, -0.717333, 0, 0.2980392, 1, 1,
0.2830951, 1.056896, 2.12209, 0, 0.2901961, 1, 1,
0.2832096, 1.062096, -0.5630357, 0, 0.2862745, 1, 1,
0.2836204, 0.1202414, 0.3522142, 0, 0.2784314, 1, 1,
0.2841096, -0.4464557, 3.325346, 0, 0.2745098, 1, 1,
0.2869859, 1.779935, -0.841718, 0, 0.2666667, 1, 1,
0.287139, -0.3539683, 1.003544, 0, 0.2627451, 1, 1,
0.2878293, -1.627841, 5.77545, 0, 0.254902, 1, 1,
0.2891826, -0.3971666, 1.847968, 0, 0.2509804, 1, 1,
0.2894994, 0.003710776, 2.082443, 0, 0.2431373, 1, 1,
0.2906825, 0.8499678, 1.126529, 0, 0.2392157, 1, 1,
0.2972112, 0.53831, 0.4301262, 0, 0.2313726, 1, 1,
0.2976965, -0.4141178, 2.849239, 0, 0.227451, 1, 1,
0.2996934, 1.326805, -0.8927659, 0, 0.2196078, 1, 1,
0.2996992, 0.3249864, -0.3568448, 0, 0.2156863, 1, 1,
0.3059163, 0.8092172, 0.8506421, 0, 0.2078431, 1, 1,
0.3097725, -0.2119081, 0.5988659, 0, 0.2039216, 1, 1,
0.3106666, 0.4913625, 1.203509, 0, 0.1960784, 1, 1,
0.3113735, -0.06883934, 1.720697, 0, 0.1882353, 1, 1,
0.3170344, 0.2595059, -1.716097, 0, 0.1843137, 1, 1,
0.3174504, -1.009905, 2.404653, 0, 0.1764706, 1, 1,
0.320911, 0.3100617, -0.0740204, 0, 0.172549, 1, 1,
0.3211428, 1.458319, 2.555189, 0, 0.1647059, 1, 1,
0.3219688, 0.2231686, -1.551879, 0, 0.1607843, 1, 1,
0.324724, 0.02308408, 1.085337, 0, 0.1529412, 1, 1,
0.3274197, 0.6741504, -0.1636604, 0, 0.1490196, 1, 1,
0.3303149, 0.5924352, 0.8349008, 0, 0.1411765, 1, 1,
0.3365366, -0.6639507, 2.365742, 0, 0.1372549, 1, 1,
0.3378919, 0.3361945, 0.4615909, 0, 0.1294118, 1, 1,
0.3385302, -2.24525, 0.70615, 0, 0.1254902, 1, 1,
0.3390813, 0.9373776, -1.054402, 0, 0.1176471, 1, 1,
0.3428478, -0.50456, 2.868487, 0, 0.1137255, 1, 1,
0.348376, -0.2043154, 0.9938071, 0, 0.1058824, 1, 1,
0.349041, -2.573797, 5.124471, 0, 0.09803922, 1, 1,
0.3520758, 0.4032731, -0.3053882, 0, 0.09411765, 1, 1,
0.3539329, -0.0835176, 2.274744, 0, 0.08627451, 1, 1,
0.3574864, -0.9797353, 3.496993, 0, 0.08235294, 1, 1,
0.3606075, -0.9656737, 2.424076, 0, 0.07450981, 1, 1,
0.3630189, 0.8260224, 0.653115, 0, 0.07058824, 1, 1,
0.370244, -0.6505668, 4.024879, 0, 0.0627451, 1, 1,
0.373138, 0.1744701, 0.3897201, 0, 0.05882353, 1, 1,
0.3806867, 0.470035, 0.3298523, 0, 0.05098039, 1, 1,
0.3891754, 0.9031853, 1.217578, 0, 0.04705882, 1, 1,
0.3949342, -0.2311874, 2.667915, 0, 0.03921569, 1, 1,
0.3988496, 1.367387, 0.6110687, 0, 0.03529412, 1, 1,
0.4007182, -1.17371, 2.620232, 0, 0.02745098, 1, 1,
0.4021455, -1.071459, 2.353029, 0, 0.02352941, 1, 1,
0.4061824, -0.4680616, 1.265372, 0, 0.01568628, 1, 1,
0.40733, 1.744503, 1.284158, 0, 0.01176471, 1, 1,
0.4096979, 1.09787, 0.8613698, 0, 0.003921569, 1, 1,
0.4178633, 0.2058067, 2.446835, 0.003921569, 0, 1, 1,
0.4190564, -0.9147876, 3.310373, 0.007843138, 0, 1, 1,
0.4196903, 0.7115147, 0.6294719, 0.01568628, 0, 1, 1,
0.4212528, -1.013819, 2.809836, 0.01960784, 0, 1, 1,
0.4241595, -2.755242, 2.43874, 0.02745098, 0, 1, 1,
0.4317743, 0.5799343, 2.081754, 0.03137255, 0, 1, 1,
0.4320898, 0.8680805, -0.1882242, 0.03921569, 0, 1, 1,
0.4322675, -0.5420324, 2.898482, 0.04313726, 0, 1, 1,
0.4405109, 0.524956, 1.267981, 0.05098039, 0, 1, 1,
0.441203, 1.928931, 0.7373363, 0.05490196, 0, 1, 1,
0.4422702, 0.5751246, 0.2357862, 0.0627451, 0, 1, 1,
0.4455727, 1.445186, 0.08596792, 0.06666667, 0, 1, 1,
0.4463046, 1.036124, 0.2453851, 0.07450981, 0, 1, 1,
0.4507065, -2.007885, 3.00189, 0.07843138, 0, 1, 1,
0.4540279, -0.4031654, 2.813718, 0.08627451, 0, 1, 1,
0.4550464, -0.4385482, 3.349045, 0.09019608, 0, 1, 1,
0.4589234, -0.2523838, 1.870869, 0.09803922, 0, 1, 1,
0.4589262, -0.7262154, 2.90461, 0.1058824, 0, 1, 1,
0.4621971, 1.34061, -0.5700777, 0.1098039, 0, 1, 1,
0.4638388, -1.839065, 3.526037, 0.1176471, 0, 1, 1,
0.464292, -1.837506, 2.611231, 0.1215686, 0, 1, 1,
0.4644156, 0.8777802, 2.023963, 0.1294118, 0, 1, 1,
0.4644287, 0.9277286, -0.715233, 0.1333333, 0, 1, 1,
0.4693507, -1.418272, 3.443456, 0.1411765, 0, 1, 1,
0.474051, -0.8178204, 3.363858, 0.145098, 0, 1, 1,
0.4753963, 0.2854418, 1.228528, 0.1529412, 0, 1, 1,
0.4791093, 0.3094119, -0.8820217, 0.1568628, 0, 1, 1,
0.4835851, -0.01961987, 1.172432, 0.1647059, 0, 1, 1,
0.484902, -2.361077, 3.471407, 0.1686275, 0, 1, 1,
0.4995858, 0.5821962, 1.546348, 0.1764706, 0, 1, 1,
0.5035474, 0.9786254, -0.5336041, 0.1803922, 0, 1, 1,
0.5037134, -0.4768649, 2.385911, 0.1882353, 0, 1, 1,
0.5083418, 0.7182667, 0.8143623, 0.1921569, 0, 1, 1,
0.5122829, -1.171381, 1.259048, 0.2, 0, 1, 1,
0.5173719, 0.7827274, 0.9089273, 0.2078431, 0, 1, 1,
0.5239401, 0.4564546, 1.881017, 0.2117647, 0, 1, 1,
0.5319958, -1.45499, 2.897277, 0.2196078, 0, 1, 1,
0.5330258, 1.95393, -2.835661, 0.2235294, 0, 1, 1,
0.5332154, 1.136847, -0.196318, 0.2313726, 0, 1, 1,
0.5342422, -1.115148, 0.5817283, 0.2352941, 0, 1, 1,
0.5352294, -1.287236, 3.869929, 0.2431373, 0, 1, 1,
0.5385928, 0.8522854, 1.609915, 0.2470588, 0, 1, 1,
0.5399585, 0.1028268, 2.260352, 0.254902, 0, 1, 1,
0.5408021, -0.1054447, 0.9077509, 0.2588235, 0, 1, 1,
0.5409083, -0.9069169, 1.845733, 0.2666667, 0, 1, 1,
0.5415252, 1.139527, 1.734176, 0.2705882, 0, 1, 1,
0.5432225, -1.429463, 3.146411, 0.2784314, 0, 1, 1,
0.5460508, -1.718795, 2.211293, 0.282353, 0, 1, 1,
0.555225, 0.8897948, 2.14531, 0.2901961, 0, 1, 1,
0.5605521, -0.6819425, 2.902164, 0.2941177, 0, 1, 1,
0.5621746, -0.7080507, 3.324899, 0.3019608, 0, 1, 1,
0.5645573, 1.572325, 1.858199, 0.3098039, 0, 1, 1,
0.5682322, 0.152026, 0.9035875, 0.3137255, 0, 1, 1,
0.569176, -1.403154, 3.604129, 0.3215686, 0, 1, 1,
0.5728273, 1.188658, 1.090625, 0.3254902, 0, 1, 1,
0.5741415, -0.4650317, 2.435688, 0.3333333, 0, 1, 1,
0.5759363, 0.5431456, 1.192071, 0.3372549, 0, 1, 1,
0.5811501, 1.326896, 0.6058177, 0.345098, 0, 1, 1,
0.5852953, -0.06644274, 2.933662, 0.3490196, 0, 1, 1,
0.5897582, -0.636781, 1.900855, 0.3568628, 0, 1, 1,
0.5925233, 2.001036, 0.6416608, 0.3607843, 0, 1, 1,
0.5945398, 0.4035009, 0.8909985, 0.3686275, 0, 1, 1,
0.5990009, -0.6803209, 2.027698, 0.372549, 0, 1, 1,
0.6001866, 0.2658219, 1.344323, 0.3803922, 0, 1, 1,
0.6050528, 1.486071, -0.2257853, 0.3843137, 0, 1, 1,
0.606953, -0.9775586, 2.518406, 0.3921569, 0, 1, 1,
0.608725, -0.515107, 2.663285, 0.3960784, 0, 1, 1,
0.6126783, -0.7730564, 1.63258, 0.4039216, 0, 1, 1,
0.6132618, 0.8630766, 1.070133, 0.4117647, 0, 1, 1,
0.6158191, 0.5329081, -0.004146846, 0.4156863, 0, 1, 1,
0.6166688, 0.4367841, 2.292442, 0.4235294, 0, 1, 1,
0.6175376, 1.870272, 2.422429, 0.427451, 0, 1, 1,
0.6178015, -0.4524521, 1.360426, 0.4352941, 0, 1, 1,
0.6232886, -0.6035717, 3.398207, 0.4392157, 0, 1, 1,
0.6253399, -0.563722, 2.752113, 0.4470588, 0, 1, 1,
0.6310309, -1.457917, 2.470525, 0.4509804, 0, 1, 1,
0.6362185, -2.105532, 4.484576, 0.4588235, 0, 1, 1,
0.6365038, 0.1478125, 2.375923, 0.4627451, 0, 1, 1,
0.6389908, -0.2010474, 2.889881, 0.4705882, 0, 1, 1,
0.6495821, 0.9576785, 1.972118, 0.4745098, 0, 1, 1,
0.6557662, 0.3410976, -0.5846757, 0.4823529, 0, 1, 1,
0.6609147, -2.011028, 1.849602, 0.4862745, 0, 1, 1,
0.6622056, 0.6710456, 0.1113482, 0.4941176, 0, 1, 1,
0.6727374, 0.09911598, 1.501584, 0.5019608, 0, 1, 1,
0.6748717, 1.089701, 1.776145, 0.5058824, 0, 1, 1,
0.6755526, 0.6543567, 2.296195, 0.5137255, 0, 1, 1,
0.684481, -0.4750207, 2.81706, 0.5176471, 0, 1, 1,
0.684926, 0.02841183, -0.137144, 0.5254902, 0, 1, 1,
0.6855378, 0.5028493, -0.9384039, 0.5294118, 0, 1, 1,
0.6891344, 0.1165921, 1.040383, 0.5372549, 0, 1, 1,
0.690544, -1.959651, 2.873708, 0.5411765, 0, 1, 1,
0.6928439, 0.8400822, 0.4932609, 0.5490196, 0, 1, 1,
0.6937276, -0.6045925, 2.406978, 0.5529412, 0, 1, 1,
0.696576, 0.7735134, 1.14966, 0.5607843, 0, 1, 1,
0.6972749, -0.548129, 1.508232, 0.5647059, 0, 1, 1,
0.7071375, 0.4117559, -1.219761, 0.572549, 0, 1, 1,
0.7110316, -1.369329, 3.130746, 0.5764706, 0, 1, 1,
0.7122958, 1.169291, 0.38286, 0.5843138, 0, 1, 1,
0.7127512, 0.5046392, 1.504505, 0.5882353, 0, 1, 1,
0.7212304, -0.7083898, 2.792018, 0.5960785, 0, 1, 1,
0.7359601, 0.2399217, 3.11392, 0.6039216, 0, 1, 1,
0.7389147, -0.03870246, 1.807536, 0.6078432, 0, 1, 1,
0.7417328, -0.4782515, 1.892315, 0.6156863, 0, 1, 1,
0.7422625, 0.5688171, 0.9878451, 0.6196079, 0, 1, 1,
0.7458598, -1.08732, 3.73601, 0.627451, 0, 1, 1,
0.7498871, 1.509405, -0.4677997, 0.6313726, 0, 1, 1,
0.7525206, 1.938897, -2.382947, 0.6392157, 0, 1, 1,
0.7684816, -0.5503298, 2.09742, 0.6431373, 0, 1, 1,
0.7848789, 1.145362, 1.522421, 0.6509804, 0, 1, 1,
0.7851045, 0.3317427, 1.154608, 0.654902, 0, 1, 1,
0.787939, 2.330976, -0.7497771, 0.6627451, 0, 1, 1,
0.7896618, -1.071545, 1.165458, 0.6666667, 0, 1, 1,
0.7975696, -0.6554586, 1.396476, 0.6745098, 0, 1, 1,
0.8018909, 0.8431246, 1.194578, 0.6784314, 0, 1, 1,
0.806957, -0.8332705, 1.547666, 0.6862745, 0, 1, 1,
0.8107623, 0.5623155, 0.8840038, 0.6901961, 0, 1, 1,
0.8181849, 0.9022955, 1.065231, 0.6980392, 0, 1, 1,
0.820084, 1.086107, -0.01463091, 0.7058824, 0, 1, 1,
0.8234028, 0.2402787, 1.356951, 0.7098039, 0, 1, 1,
0.8251779, -1.25862, 2.49187, 0.7176471, 0, 1, 1,
0.8259054, 0.245324, 1.400661, 0.7215686, 0, 1, 1,
0.8267201, 0.3186127, 1.750522, 0.7294118, 0, 1, 1,
0.8335969, 0.1944641, 1.802339, 0.7333333, 0, 1, 1,
0.8372374, 0.3703259, 1.221578, 0.7411765, 0, 1, 1,
0.8378769, -1.377227, 3.344115, 0.7450981, 0, 1, 1,
0.8406799, -0.4301133, 2.774576, 0.7529412, 0, 1, 1,
0.8417549, -1.302723, 4.316848, 0.7568628, 0, 1, 1,
0.8425674, -1.285126, 0.7595142, 0.7647059, 0, 1, 1,
0.8506994, -1.662613, 3.258085, 0.7686275, 0, 1, 1,
0.8529619, 1.326871, -1.971611, 0.7764706, 0, 1, 1,
0.8537983, -0.03744804, 1.08767, 0.7803922, 0, 1, 1,
0.8543226, 1.544611, -0.1166104, 0.7882353, 0, 1, 1,
0.8545624, -0.09068827, 1.657433, 0.7921569, 0, 1, 1,
0.8549931, -1.038032, 3.223099, 0.8, 0, 1, 1,
0.8674678, 1.19204, 1.016595, 0.8078431, 0, 1, 1,
0.8683199, -0.7542314, 3.080563, 0.8117647, 0, 1, 1,
0.869476, -1.783553, 2.118215, 0.8196079, 0, 1, 1,
0.871165, -0.8934841, 2.385631, 0.8235294, 0, 1, 1,
0.8733231, -0.7738715, 2.19918, 0.8313726, 0, 1, 1,
0.8743132, 1.149209, 0.01897527, 0.8352941, 0, 1, 1,
0.8806703, 0.04190391, 1.343375, 0.8431373, 0, 1, 1,
0.8820021, -0.3224718, -0.5121215, 0.8470588, 0, 1, 1,
0.8852844, 0.8657833, 0.2789754, 0.854902, 0, 1, 1,
0.8858545, -0.2051704, 0.5131205, 0.8588235, 0, 1, 1,
0.8894793, -1.284756, 1.544518, 0.8666667, 0, 1, 1,
0.8937718, -1.294763, 3.392362, 0.8705882, 0, 1, 1,
0.8939173, -1.253706, 1.155564, 0.8784314, 0, 1, 1,
0.8954348, -0.7247944, 2.553103, 0.8823529, 0, 1, 1,
0.8957037, 0.5334679, 2.845991, 0.8901961, 0, 1, 1,
0.8982739, -0.6583882, 2.788329, 0.8941177, 0, 1, 1,
0.9015158, -0.9472018, 3.301548, 0.9019608, 0, 1, 1,
0.9055766, -0.1917407, 1.485931, 0.9098039, 0, 1, 1,
0.9083602, -0.01384813, 0.3463748, 0.9137255, 0, 1, 1,
0.9087987, -0.3657962, 2.755785, 0.9215686, 0, 1, 1,
0.9088492, -0.1562361, 1.887868, 0.9254902, 0, 1, 1,
0.9136255, 0.6873958, -1.070857, 0.9333333, 0, 1, 1,
0.9164457, 0.08880644, 1.065876, 0.9372549, 0, 1, 1,
0.9180487, 1.069136, 0.5156273, 0.945098, 0, 1, 1,
0.9267637, -0.9428949, 2.481234, 0.9490196, 0, 1, 1,
0.9267713, 0.1134405, 2.596578, 0.9568627, 0, 1, 1,
0.9273221, -0.3215657, 2.905009, 0.9607843, 0, 1, 1,
0.9311903, -0.2011245, 2.305206, 0.9686275, 0, 1, 1,
0.9453514, -0.02876099, 1.594811, 0.972549, 0, 1, 1,
0.9578457, 0.05642653, 0.7461008, 0.9803922, 0, 1, 1,
0.9604997, -1.57129, 3.733615, 0.9843137, 0, 1, 1,
0.9662512, -0.5587792, 2.153735, 0.9921569, 0, 1, 1,
0.9675835, -0.3705933, 2.677286, 0.9960784, 0, 1, 1,
0.9695072, -1.510543, 2.845928, 1, 0, 0.9960784, 1,
0.9739054, 0.4958146, 2.206867, 1, 0, 0.9882353, 1,
0.9810881, 1.004116, -0.03065864, 1, 0, 0.9843137, 1,
0.9817577, -1.235257, 0.5547151, 1, 0, 0.9764706, 1,
0.9837795, -0.5356953, 1.074643, 1, 0, 0.972549, 1,
0.9840544, 0.4913993, 2.35518, 1, 0, 0.9647059, 1,
0.9882872, -0.6215125, 1.835954, 1, 0, 0.9607843, 1,
0.9912522, -0.6407915, 0.3774627, 1, 0, 0.9529412, 1,
0.995917, 0.6505288, 2.548829, 1, 0, 0.9490196, 1,
0.9982933, 1.065601, 1.840615, 1, 0, 0.9411765, 1,
1.002384, 0.1434936, 2.22288, 1, 0, 0.9372549, 1,
1.004487, 2.082498, 1.362834, 1, 0, 0.9294118, 1,
1.006632, -0.4169139, 0.8556326, 1, 0, 0.9254902, 1,
1.006758, 0.2996165, 2.624952, 1, 0, 0.9176471, 1,
1.007439, 0.579276, 0.9511578, 1, 0, 0.9137255, 1,
1.012164, -0.3728123, 3.398133, 1, 0, 0.9058824, 1,
1.014717, -0.8861237, 3.295054, 1, 0, 0.9019608, 1,
1.015954, 1.125083, 0.5943522, 1, 0, 0.8941177, 1,
1.021454, -0.01963827, 1.524754, 1, 0, 0.8862745, 1,
1.030499, 0.7459236, 1.170072, 1, 0, 0.8823529, 1,
1.030732, -0.1007458, -0.1842467, 1, 0, 0.8745098, 1,
1.031794, 0.3385919, 1.392008, 1, 0, 0.8705882, 1,
1.035155, -0.3902195, 1.792248, 1, 0, 0.8627451, 1,
1.035788, 0.3791755, -0.4293556, 1, 0, 0.8588235, 1,
1.036306, -0.7689613, 1.805823, 1, 0, 0.8509804, 1,
1.043807, 0.6495526, 0.4653219, 1, 0, 0.8470588, 1,
1.061484, -1.232083, 1.518281, 1, 0, 0.8392157, 1,
1.085118, -0.439217, 2.37615, 1, 0, 0.8352941, 1,
1.093911, 0.7975461, 1.200105, 1, 0, 0.827451, 1,
1.097771, -0.2693578, 2.55003, 1, 0, 0.8235294, 1,
1.102133, -2.160318, 3.508174, 1, 0, 0.8156863, 1,
1.110856, 0.4502587, 1.482252, 1, 0, 0.8117647, 1,
1.111524, -0.8461401, 1.472882, 1, 0, 0.8039216, 1,
1.113783, -0.8113911, 2.087997, 1, 0, 0.7960784, 1,
1.114017, 0.6092064, -1.011216, 1, 0, 0.7921569, 1,
1.11486, 0.5338229, 1.58931, 1, 0, 0.7843137, 1,
1.131659, -0.9501713, 1.905211, 1, 0, 0.7803922, 1,
1.132302, -0.9606963, 2.62382, 1, 0, 0.772549, 1,
1.136837, -0.04827891, 0.7503194, 1, 0, 0.7686275, 1,
1.13692, 0.5328255, -1.604897, 1, 0, 0.7607843, 1,
1.140708, -0.505574, 1.77495, 1, 0, 0.7568628, 1,
1.147908, -0.7283611, 1.07255, 1, 0, 0.7490196, 1,
1.150547, 1.905337, 0.1871137, 1, 0, 0.7450981, 1,
1.159089, 0.3959782, 1.603758, 1, 0, 0.7372549, 1,
1.171936, 0.2827421, -0.00808506, 1, 0, 0.7333333, 1,
1.173793, -0.1054678, 2.729526, 1, 0, 0.7254902, 1,
1.174459, 1.612865, -0.09024418, 1, 0, 0.7215686, 1,
1.177626, 1.405895, 1.479253, 1, 0, 0.7137255, 1,
1.180261, -1.112266, 1.826348, 1, 0, 0.7098039, 1,
1.181113, -1.702946, 3.105651, 1, 0, 0.7019608, 1,
1.183959, 1.651605, 0.2243517, 1, 0, 0.6941177, 1,
1.193081, -0.06016866, 2.344255, 1, 0, 0.6901961, 1,
1.195586, 1.163562, 1.400728, 1, 0, 0.682353, 1,
1.197467, 1.159859, 0.4666584, 1, 0, 0.6784314, 1,
1.200537, 0.301546, 2.340223, 1, 0, 0.6705883, 1,
1.203182, 2.362608, 0.8220399, 1, 0, 0.6666667, 1,
1.206466, -0.7421459, 0.4009916, 1, 0, 0.6588235, 1,
1.218202, 0.2962953, 1.392719, 1, 0, 0.654902, 1,
1.219354, -0.9114336, 1.995629, 1, 0, 0.6470588, 1,
1.224731, -1.269389, 2.538864, 1, 0, 0.6431373, 1,
1.232621, -0.3572459, 2.236684, 1, 0, 0.6352941, 1,
1.256103, -0.6794105, 1.02741, 1, 0, 0.6313726, 1,
1.261554, -0.1630417, 2.035779, 1, 0, 0.6235294, 1,
1.273677, 0.4547015, 1.100654, 1, 0, 0.6196079, 1,
1.279653, -0.00555003, 0.6273265, 1, 0, 0.6117647, 1,
1.284613, 0.392113, 2.291617, 1, 0, 0.6078432, 1,
1.29203, -0.3032008, -0.8243845, 1, 0, 0.6, 1,
1.294929, -0.03566505, 2.498618, 1, 0, 0.5921569, 1,
1.303483, -2.173398, 1.789238, 1, 0, 0.5882353, 1,
1.319154, 1.431739, 2.019417, 1, 0, 0.5803922, 1,
1.323631, 1.048216, 1.471016, 1, 0, 0.5764706, 1,
1.331526, -0.3263226, 0.9928011, 1, 0, 0.5686275, 1,
1.332802, -0.8712907, 2.112338, 1, 0, 0.5647059, 1,
1.345349, 1.056345, 1.510805, 1, 0, 0.5568628, 1,
1.347, 0.1648723, 0.9718892, 1, 0, 0.5529412, 1,
1.361593, -0.6162918, 2.577739, 1, 0, 0.5450981, 1,
1.36372, -0.2946858, 0.140937, 1, 0, 0.5411765, 1,
1.364469, -0.6109664, 2.130677, 1, 0, 0.5333334, 1,
1.398884, -0.6308627, 2.274626, 1, 0, 0.5294118, 1,
1.399329, -0.05705388, 0.9618937, 1, 0, 0.5215687, 1,
1.401482, 0.4102664, 1.619043, 1, 0, 0.5176471, 1,
1.404758, -0.4960649, 0.3799239, 1, 0, 0.509804, 1,
1.412924, 0.1264177, 0.3876737, 1, 0, 0.5058824, 1,
1.417872, 0.4932983, 1.515725, 1, 0, 0.4980392, 1,
1.42513, -0.01136114, 1.477566, 1, 0, 0.4901961, 1,
1.439193, -0.4312783, 1.041091, 1, 0, 0.4862745, 1,
1.441235, 1.390056, 1.20707, 1, 0, 0.4784314, 1,
1.449129, 0.2590064, -0.3523228, 1, 0, 0.4745098, 1,
1.461992, 0.6861814, 2.253633, 1, 0, 0.4666667, 1,
1.46284, 0.08875093, 1.920814, 1, 0, 0.4627451, 1,
1.474688, -0.3506575, 2.729997, 1, 0, 0.454902, 1,
1.476904, 0.7146685, 0.9542761, 1, 0, 0.4509804, 1,
1.479361, 0.5105196, 1.205807, 1, 0, 0.4431373, 1,
1.489013, -1.003717, 0.7031128, 1, 0, 0.4392157, 1,
1.499688, 1.429914, 0.5852444, 1, 0, 0.4313726, 1,
1.517685, 2.000103, 0.1363002, 1, 0, 0.427451, 1,
1.526168, 1.784823, 0.7134549, 1, 0, 0.4196078, 1,
1.532637, 0.2403666, 1.040582, 1, 0, 0.4156863, 1,
1.550196, 1.512014, -0.2917355, 1, 0, 0.4078431, 1,
1.56446, -0.1644229, 1.52838, 1, 0, 0.4039216, 1,
1.577272, -0.7353826, 1.580342, 1, 0, 0.3960784, 1,
1.586235, 2.591846, 0.4195873, 1, 0, 0.3882353, 1,
1.6153, 1.70793, 0.334577, 1, 0, 0.3843137, 1,
1.616327, 1.530886, -0.9831813, 1, 0, 0.3764706, 1,
1.629579, 0.099838, 1.441349, 1, 0, 0.372549, 1,
1.644201, -0.1685204, 3.301351, 1, 0, 0.3647059, 1,
1.645084, 0.6562736, 1.567917, 1, 0, 0.3607843, 1,
1.645795, 0.6733066, 0.9167896, 1, 0, 0.3529412, 1,
1.647448, 0.8569741, 0.5658444, 1, 0, 0.3490196, 1,
1.664037, -1.198615, 1.977839, 1, 0, 0.3411765, 1,
1.665588, 0.4843994, 2.608402, 1, 0, 0.3372549, 1,
1.666169, -2.372242, 3.367972, 1, 0, 0.3294118, 1,
1.67344, 0.4159947, 1.322023, 1, 0, 0.3254902, 1,
1.706515, -0.628925, 1.544284, 1, 0, 0.3176471, 1,
1.715812, 0.7525057, -1.287602, 1, 0, 0.3137255, 1,
1.721776, -1.050156, 4.613842, 1, 0, 0.3058824, 1,
1.725398, -0.6685601, 1.838877, 1, 0, 0.2980392, 1,
1.749494, 0.004609842, 1.081463, 1, 0, 0.2941177, 1,
1.755883, 1.225168, 1.548995, 1, 0, 0.2862745, 1,
1.756255, 0.558847, 0.4196665, 1, 0, 0.282353, 1,
1.777543, 0.7951115, -0.5328485, 1, 0, 0.2745098, 1,
1.808472, -0.1819203, 0.75733, 1, 0, 0.2705882, 1,
1.816691, 0.8261513, 0.6122796, 1, 0, 0.2627451, 1,
1.860373, -0.3103161, 2.564209, 1, 0, 0.2588235, 1,
1.864883, 0.7463106, 1.663025, 1, 0, 0.2509804, 1,
1.879727, 0.6397424, 3.25356, 1, 0, 0.2470588, 1,
1.896513, 0.3477502, 2.603142, 1, 0, 0.2392157, 1,
1.898512, -0.8839014, 2.36689, 1, 0, 0.2352941, 1,
1.898864, 0.1549575, 0.4051763, 1, 0, 0.227451, 1,
1.907849, -2.092354, 2.891889, 1, 0, 0.2235294, 1,
1.913094, -0.1679535, 1.077003, 1, 0, 0.2156863, 1,
1.921471, 1.089681, 1.279255, 1, 0, 0.2117647, 1,
1.938865, -1.242428, 3.728107, 1, 0, 0.2039216, 1,
1.950697, -0.09568071, 0.7122493, 1, 0, 0.1960784, 1,
2.002824, 1.043216, 0.8583792, 1, 0, 0.1921569, 1,
2.009939, -2.063615, 1.417366, 1, 0, 0.1843137, 1,
2.011231, 1.160898, 0.2538366, 1, 0, 0.1803922, 1,
2.02573, -1.38357, 2.266158, 1, 0, 0.172549, 1,
2.026086, -1.621438, 2.642529, 1, 0, 0.1686275, 1,
2.02841, -0.7374156, 0.4260849, 1, 0, 0.1607843, 1,
2.028597, -0.9540342, 1.287124, 1, 0, 0.1568628, 1,
2.059182, -0.9895122, 1.319379, 1, 0, 0.1490196, 1,
2.076811, 1.61302, 1.223941, 1, 0, 0.145098, 1,
2.098082, -0.4208694, 1.178705, 1, 0, 0.1372549, 1,
2.104945, -0.8228247, 2.139697, 1, 0, 0.1333333, 1,
2.11467, -0.3809104, 1.896769, 1, 0, 0.1254902, 1,
2.132988, -0.2985047, -0.04031586, 1, 0, 0.1215686, 1,
2.142573, -0.2765642, 2.4549, 1, 0, 0.1137255, 1,
2.158871, -0.00178223, 2.635854, 1, 0, 0.1098039, 1,
2.234654, 0.02832624, 0.6151264, 1, 0, 0.1019608, 1,
2.256729, 0.08432025, 2.334099, 1, 0, 0.09411765, 1,
2.260018, -0.4003281, 1.809772, 1, 0, 0.09019608, 1,
2.265014, -0.9421346, 2.744223, 1, 0, 0.08235294, 1,
2.288644, -1.2058, 0.9674605, 1, 0, 0.07843138, 1,
2.414708, 0.5570204, 4.654885, 1, 0, 0.07058824, 1,
2.436096, -0.8212273, 1.895381, 1, 0, 0.06666667, 1,
2.47769, -0.7810768, 3.525019, 1, 0, 0.05882353, 1,
2.504838, -0.8079891, 3.975152, 1, 0, 0.05490196, 1,
2.527923, -0.1321533, 0.1581766, 1, 0, 0.04705882, 1,
2.750742, -0.2958452, 2.704315, 1, 0, 0.04313726, 1,
2.813235, 0.5217258, 0.6547647, 1, 0, 0.03529412, 1,
2.825735, 0.2201545, 1.349839, 1, 0, 0.03137255, 1,
2.826211, -0.3277027, 2.547064, 1, 0, 0.02352941, 1,
3.090422, 0.3448498, 1.798274, 1, 0, 0.01960784, 1,
3.393707, -0.9535816, 1.956622, 1, 0, 0.01176471, 1,
3.669293, 0.9069732, 2.070825, 1, 0, 0.007843138, 1
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
0.1021869, -4.500193, -7.353265, 0, -0.5, 0.5, 0.5,
0.1021869, -4.500193, -7.353265, 1, -0.5, 0.5, 0.5,
0.1021869, -4.500193, -7.353265, 1, 1.5, 0.5, 0.5,
0.1021869, -4.500193, -7.353265, 0, 1.5, 0.5, 0.5
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
-4.674168, 0.08351338, -7.353265, 0, -0.5, 0.5, 0.5,
-4.674168, 0.08351338, -7.353265, 1, -0.5, 0.5, 0.5,
-4.674168, 0.08351338, -7.353265, 1, 1.5, 0.5, 0.5,
-4.674168, 0.08351338, -7.353265, 0, 1.5, 0.5, 0.5
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
-4.674168, -4.500193, 0.1624894, 0, -0.5, 0.5, 0.5,
-4.674168, -4.500193, 0.1624894, 1, -0.5, 0.5, 0.5,
-4.674168, -4.500193, 0.1624894, 1, 1.5, 0.5, 0.5,
-4.674168, -4.500193, 0.1624894, 0, 1.5, 0.5, 0.5
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
-2, -3.442415, -5.61886,
2, -3.442415, -5.61886,
-2, -3.442415, -5.61886,
-2, -3.618711, -5.907928,
0, -3.442415, -5.61886,
0, -3.618711, -5.907928,
2, -3.442415, -5.61886,
2, -3.618711, -5.907928
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
-2, -3.971304, -6.486063, 0, -0.5, 0.5, 0.5,
-2, -3.971304, -6.486063, 1, -0.5, 0.5, 0.5,
-2, -3.971304, -6.486063, 1, 1.5, 0.5, 0.5,
-2, -3.971304, -6.486063, 0, 1.5, 0.5, 0.5,
0, -3.971304, -6.486063, 0, -0.5, 0.5, 0.5,
0, -3.971304, -6.486063, 1, -0.5, 0.5, 0.5,
0, -3.971304, -6.486063, 1, 1.5, 0.5, 0.5,
0, -3.971304, -6.486063, 0, 1.5, 0.5, 0.5,
2, -3.971304, -6.486063, 0, -0.5, 0.5, 0.5,
2, -3.971304, -6.486063, 1, -0.5, 0.5, 0.5,
2, -3.971304, -6.486063, 1, 1.5, 0.5, 0.5,
2, -3.971304, -6.486063, 0, 1.5, 0.5, 0.5
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
-3.571932, -3, -5.61886,
-3.571932, 3, -5.61886,
-3.571932, -3, -5.61886,
-3.755638, -3, -5.907928,
-3.571932, -2, -5.61886,
-3.755638, -2, -5.907928,
-3.571932, -1, -5.61886,
-3.755638, -1, -5.907928,
-3.571932, 0, -5.61886,
-3.755638, 0, -5.907928,
-3.571932, 1, -5.61886,
-3.755638, 1, -5.907928,
-3.571932, 2, -5.61886,
-3.755638, 2, -5.907928,
-3.571932, 3, -5.61886,
-3.755638, 3, -5.907928
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
-4.12305, -3, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, -3, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, -3, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, -3, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, -2, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, -2, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, -2, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, -2, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, -1, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, -1, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, -1, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, -1, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, 0, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, 0, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, 0, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, 0, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, 1, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, 1, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, 1, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, 1, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, 2, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, 2, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, 2, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, 2, -6.486063, 0, 1.5, 0.5, 0.5,
-4.12305, 3, -6.486063, 0, -0.5, 0.5, 0.5,
-4.12305, 3, -6.486063, 1, -0.5, 0.5, 0.5,
-4.12305, 3, -6.486063, 1, 1.5, 0.5, 0.5,
-4.12305, 3, -6.486063, 0, 1.5, 0.5, 0.5
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
-3.571932, -3.442415, -4,
-3.571932, -3.442415, 4,
-3.571932, -3.442415, -4,
-3.755638, -3.618711, -4,
-3.571932, -3.442415, -2,
-3.755638, -3.618711, -2,
-3.571932, -3.442415, 0,
-3.755638, -3.618711, 0,
-3.571932, -3.442415, 2,
-3.755638, -3.618711, 2,
-3.571932, -3.442415, 4,
-3.755638, -3.618711, 4
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
-4.12305, -3.971304, -4, 0, -0.5, 0.5, 0.5,
-4.12305, -3.971304, -4, 1, -0.5, 0.5, 0.5,
-4.12305, -3.971304, -4, 1, 1.5, 0.5, 0.5,
-4.12305, -3.971304, -4, 0, 1.5, 0.5, 0.5,
-4.12305, -3.971304, -2, 0, -0.5, 0.5, 0.5,
-4.12305, -3.971304, -2, 1, -0.5, 0.5, 0.5,
-4.12305, -3.971304, -2, 1, 1.5, 0.5, 0.5,
-4.12305, -3.971304, -2, 0, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 0, 0, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 0, 1, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 0, 1, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 0, 0, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 2, 0, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 2, 1, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 2, 1, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 2, 0, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 4, 0, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 4, 1, -0.5, 0.5, 0.5,
-4.12305, -3.971304, 4, 1, 1.5, 0.5, 0.5,
-4.12305, -3.971304, 4, 0, 1.5, 0.5, 0.5
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
-3.571932, -3.442415, -5.61886,
-3.571932, 3.609442, -5.61886,
-3.571932, -3.442415, 5.943839,
-3.571932, 3.609442, 5.943839,
-3.571932, -3.442415, -5.61886,
-3.571932, -3.442415, 5.943839,
-3.571932, 3.609442, -5.61886,
-3.571932, 3.609442, 5.943839,
-3.571932, -3.442415, -5.61886,
3.776306, -3.442415, -5.61886,
-3.571932, -3.442415, 5.943839,
3.776306, -3.442415, 5.943839,
-3.571932, 3.609442, -5.61886,
3.776306, 3.609442, -5.61886,
-3.571932, 3.609442, 5.943839,
3.776306, 3.609442, 5.943839,
3.776306, -3.442415, -5.61886,
3.776306, 3.609442, -5.61886,
3.776306, -3.442415, 5.943839,
3.776306, 3.609442, 5.943839,
3.776306, -3.442415, -5.61886,
3.776306, -3.442415, 5.943839,
3.776306, 3.609442, -5.61886,
3.776306, 3.609442, 5.943839
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
var radius = 8.22783;
var distance = 36.60654;
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
mvMatrix.translate( -0.1021869, -0.08351338, -0.1624894 );
mvMatrix.scale( 1.210643, 1.261525, 0.7693784 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.60654);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-(methylthio)-2-but<-read.table("3-(methylthio)-2-but.xyz")
```

```
## Error in read.table("3-(methylthio)-2-but.xyz"): no lines available in input
```

```r
x<-3-(methylthio)-2-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylthio' not found
```

```r
y<-3-(methylthio)-2-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylthio' not found
```

```r
z<-3-(methylthio)-2-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylthio' not found
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
-3.464919, 0.6174117, -1.965828, 0, 0, 1, 1, 1,
-3.412016, -0.2646594, -3.414241, 1, 0, 0, 1, 1,
-3.320051, -1.005968, -0.84369, 1, 0, 0, 1, 1,
-3.154264, 1.37706, -0.7047724, 1, 0, 0, 1, 1,
-2.773916, -0.6178939, -2.092947, 1, 0, 0, 1, 1,
-2.512971, 1.147102, -2.166149, 1, 0, 0, 1, 1,
-2.462361, 1.630597, 0.5688733, 0, 0, 0, 1, 1,
-2.412471, 1.992871, -1.651141, 0, 0, 0, 1, 1,
-2.397259, -0.3879291, -0.1677534, 0, 0, 0, 1, 1,
-2.349681, -1.48853, -3.566775, 0, 0, 0, 1, 1,
-2.342155, 0.7722413, -2.345341, 0, 0, 0, 1, 1,
-2.321772, 0.8747411, -0.5830808, 0, 0, 0, 1, 1,
-2.252304, -1.436163, -2.258682, 0, 0, 0, 1, 1,
-2.235072, -0.04814988, 0.6802356, 1, 1, 1, 1, 1,
-2.19615, -0.06684456, -2.103713, 1, 1, 1, 1, 1,
-2.132857, 0.3855026, -1.41094, 1, 1, 1, 1, 1,
-2.117601, 1.474429, -1.734256, 1, 1, 1, 1, 1,
-2.098874, -1.28854, -2.56361, 1, 1, 1, 1, 1,
-2.066725, 0.4838096, -1.037558, 1, 1, 1, 1, 1,
-2.053956, 0.1069, -3.827724, 1, 1, 1, 1, 1,
-2.041496, -0.3596015, -0.714245, 1, 1, 1, 1, 1,
-2.030213, -2.17227, -2.18739, 1, 1, 1, 1, 1,
-2.004061, 0.8952106, -0.7583868, 1, 1, 1, 1, 1,
-1.992981, -0.4312036, -1.751747, 1, 1, 1, 1, 1,
-1.992198, 2.124243, -0.06269803, 1, 1, 1, 1, 1,
-1.957783, -0.1255122, -0.6129599, 1, 1, 1, 1, 1,
-1.92908, 0.5728236, -1.608324, 1, 1, 1, 1, 1,
-1.923212, 0.3031131, -1.904065, 1, 1, 1, 1, 1,
-1.917609, -0.3817808, -1.30296, 0, 0, 1, 1, 1,
-1.915112, 0.9230549, -0.9761524, 1, 0, 0, 1, 1,
-1.900932, -0.6844817, -1.911734, 1, 0, 0, 1, 1,
-1.883624, -0.7198808, -2.613496, 1, 0, 0, 1, 1,
-1.881353, -1.225659, -2.391822, 1, 0, 0, 1, 1,
-1.876047, -1.996817, -2.063144, 1, 0, 0, 1, 1,
-1.863473, -1.102717, -1.287094, 0, 0, 0, 1, 1,
-1.856871, -1.048967, -3.04358, 0, 0, 0, 1, 1,
-1.853767, 1.518697, 0.03614198, 0, 0, 0, 1, 1,
-1.782963, -0.3186814, -2.637235, 0, 0, 0, 1, 1,
-1.77977, 0.4679215, -1.064187, 0, 0, 0, 1, 1,
-1.767634, 0.2938109, -0.1309818, 0, 0, 0, 1, 1,
-1.746165, 0.06344903, -1.762658, 0, 0, 0, 1, 1,
-1.73904, -1.090345, -1.869137, 1, 1, 1, 1, 1,
-1.730054, -0.4071611, -3.00127, 1, 1, 1, 1, 1,
-1.723372, -1.03432, -2.914901, 1, 1, 1, 1, 1,
-1.722519, 0.4169315, -1.662507, 1, 1, 1, 1, 1,
-1.695579, 0.3935175, -0.9953236, 1, 1, 1, 1, 1,
-1.653039, 0.293138, -2.111079, 1, 1, 1, 1, 1,
-1.650963, 0.4907848, -2.070594, 1, 1, 1, 1, 1,
-1.639637, -0.3230395, -3.106877, 1, 1, 1, 1, 1,
-1.63868, -1.153995, -2.078656, 1, 1, 1, 1, 1,
-1.624485, -0.9042904, -2.362419, 1, 1, 1, 1, 1,
-1.612909, 1.201279, -0.5972012, 1, 1, 1, 1, 1,
-1.608959, 0.4490663, -1.741189, 1, 1, 1, 1, 1,
-1.572957, 0.1819286, -2.138778, 1, 1, 1, 1, 1,
-1.568336, -1.153316, -1.306674, 1, 1, 1, 1, 1,
-1.559635, -0.3882317, -2.368562, 1, 1, 1, 1, 1,
-1.554205, -0.342839, -1.930496, 0, 0, 1, 1, 1,
-1.54781, 0.4358773, -0.09604015, 1, 0, 0, 1, 1,
-1.546171, -0.3709428, -0.7903255, 1, 0, 0, 1, 1,
-1.516832, 0.5816351, -4.311281, 1, 0, 0, 1, 1,
-1.510866, 1.278477, 0.2025799, 1, 0, 0, 1, 1,
-1.509663, 1.074429, -0.794696, 1, 0, 0, 1, 1,
-1.506774, -0.608005, -2.397274, 0, 0, 0, 1, 1,
-1.502476, -0.03596172, -2.969905, 0, 0, 0, 1, 1,
-1.491675, -1.317585, -1.747184, 0, 0, 0, 1, 1,
-1.488315, -0.6297375, -2.139028, 0, 0, 0, 1, 1,
-1.48699, -0.6278132, -1.139786, 0, 0, 0, 1, 1,
-1.486959, 1.325367, 0.5661602, 0, 0, 0, 1, 1,
-1.483803, -0.3989948, -2.487141, 0, 0, 0, 1, 1,
-1.480927, -0.3488669, -1.897287, 1, 1, 1, 1, 1,
-1.466991, -0.1019144, -0.9000328, 1, 1, 1, 1, 1,
-1.463342, -3.339718, -3.620352, 1, 1, 1, 1, 1,
-1.461035, 0.4252097, -1.79551, 1, 1, 1, 1, 1,
-1.458352, -0.6553301, -1.785932, 1, 1, 1, 1, 1,
-1.45519, 1.069822, -0.111411, 1, 1, 1, 1, 1,
-1.454374, -1.282876, -2.158414, 1, 1, 1, 1, 1,
-1.437716, -0.8737317, -3.854491, 1, 1, 1, 1, 1,
-1.418231, -0.9658034, -2.160205, 1, 1, 1, 1, 1,
-1.398496, 0.08795531, -2.023008, 1, 1, 1, 1, 1,
-1.370676, -2.600412, -3.251024, 1, 1, 1, 1, 1,
-1.361029, -1.023937, -2.113197, 1, 1, 1, 1, 1,
-1.359739, -2.094526, -4.332353, 1, 1, 1, 1, 1,
-1.358177, 0.4444724, -1.91636, 1, 1, 1, 1, 1,
-1.355272, 0.9569189, -0.8839129, 1, 1, 1, 1, 1,
-1.351611, -0.3985087, -2.476765, 0, 0, 1, 1, 1,
-1.338667, -0.6613685, -2.708096, 1, 0, 0, 1, 1,
-1.336799, 1.204223, 0.26226, 1, 0, 0, 1, 1,
-1.335128, -1.872288, -2.820086, 1, 0, 0, 1, 1,
-1.320226, -0.7473238, -2.223411, 1, 0, 0, 1, 1,
-1.314078, 0.6028036, -1.422788, 1, 0, 0, 1, 1,
-1.313793, 0.6725301, -0.2573695, 0, 0, 0, 1, 1,
-1.3101, -0.7841684, -0.4751918, 0, 0, 0, 1, 1,
-1.298871, 0.6903278, -2.465009, 0, 0, 0, 1, 1,
-1.298863, -1.275551, -3.707474, 0, 0, 0, 1, 1,
-1.297804, 0.6570534, -1.908584, 0, 0, 0, 1, 1,
-1.291629, -0.7882911, -0.330638, 0, 0, 0, 1, 1,
-1.280835, 1.572133, -1.856014, 0, 0, 0, 1, 1,
-1.278806, -0.8642618, -3.311234, 1, 1, 1, 1, 1,
-1.259248, 1.004736, -1.865736, 1, 1, 1, 1, 1,
-1.256632, -0.8886831, -1.940615, 1, 1, 1, 1, 1,
-1.253692, 0.8110853, -1.721034, 1, 1, 1, 1, 1,
-1.243059, 0.281137, -1.120297, 1, 1, 1, 1, 1,
-1.23582, 1.370341, -0.5863191, 1, 1, 1, 1, 1,
-1.228861, -0.1305609, -0.2405681, 1, 1, 1, 1, 1,
-1.227764, 0.8017045, -2.595023, 1, 1, 1, 1, 1,
-1.224361, 0.7180264, -0.3993875, 1, 1, 1, 1, 1,
-1.223775, 1.736357, 0.1708269, 1, 1, 1, 1, 1,
-1.222837, -0.1009348, -1.615326, 1, 1, 1, 1, 1,
-1.212638, -1.828177, -2.94726, 1, 1, 1, 1, 1,
-1.211563, 0.6649607, -0.5310605, 1, 1, 1, 1, 1,
-1.210719, -0.05076132, -1.56359, 1, 1, 1, 1, 1,
-1.204393, 0.01060824, -3.094505, 1, 1, 1, 1, 1,
-1.202518, -0.1245996, -2.657956, 0, 0, 1, 1, 1,
-1.199579, 0.4027033, -1.416646, 1, 0, 0, 1, 1,
-1.186119, -0.4647108, -1.358667, 1, 0, 0, 1, 1,
-1.181117, 1.881827, 1.045108, 1, 0, 0, 1, 1,
-1.179211, -2.845808, -3.015478, 1, 0, 0, 1, 1,
-1.177967, -0.1689074, -3.758093, 1, 0, 0, 1, 1,
-1.166339, 0.2306801, 0.1082051, 0, 0, 0, 1, 1,
-1.165648, -0.4718176, -2.788524, 0, 0, 0, 1, 1,
-1.162638, -1.260478, -4.427963, 0, 0, 0, 1, 1,
-1.160519, -1.036824, -1.69475, 0, 0, 0, 1, 1,
-1.159592, -0.07245989, -0.7579691, 0, 0, 0, 1, 1,
-1.158846, 1.345085, 0.9417869, 0, 0, 0, 1, 1,
-1.158389, -0.4528698, -0.7543632, 0, 0, 0, 1, 1,
-1.155868, -0.8813381, -2.802015, 1, 1, 1, 1, 1,
-1.151452, -0.2347913, -1.732021, 1, 1, 1, 1, 1,
-1.147458, -0.7428362, -1.990921, 1, 1, 1, 1, 1,
-1.139921, 0.01182389, 0.3679014, 1, 1, 1, 1, 1,
-1.139717, -0.3357228, -1.706106, 1, 1, 1, 1, 1,
-1.138008, 0.3119252, -0.5563634, 1, 1, 1, 1, 1,
-1.136016, -0.28064, -0.6476552, 1, 1, 1, 1, 1,
-1.132883, 0.5677069, -2.3183, 1, 1, 1, 1, 1,
-1.131807, 0.5164289, -1.735399, 1, 1, 1, 1, 1,
-1.127227, -0.8066415, -3.841501, 1, 1, 1, 1, 1,
-1.123253, -0.3283529, -1.310338, 1, 1, 1, 1, 1,
-1.1124, -0.5345291, -2.575095, 1, 1, 1, 1, 1,
-1.110835, 0.7632996, -0.2365984, 1, 1, 1, 1, 1,
-1.103213, 1.252198, -0.6811449, 1, 1, 1, 1, 1,
-1.096664, 0.4833117, -1.096051, 1, 1, 1, 1, 1,
-1.093585, 1.384811, 0.9586811, 0, 0, 1, 1, 1,
-1.076193, -0.1316924, -1.020022, 1, 0, 0, 1, 1,
-1.070798, -1.601102, -2.950479, 1, 0, 0, 1, 1,
-1.068312, -0.2133524, -1.877489, 1, 0, 0, 1, 1,
-1.061401, 0.8418001, -2.103583, 1, 0, 0, 1, 1,
-1.060011, -0.6685194, -2.250539, 1, 0, 0, 1, 1,
-1.052041, 1.037851, -1.978834, 0, 0, 0, 1, 1,
-1.050621, 0.5237364, -1.172261, 0, 0, 0, 1, 1,
-1.046297, -1.530315, -3.036314, 0, 0, 0, 1, 1,
-1.031169, -1.722721, -2.128002, 0, 0, 0, 1, 1,
-1.022359, 1.463799, 0.2584438, 0, 0, 0, 1, 1,
-1.020321, -0.9341514, -2.176019, 0, 0, 0, 1, 1,
-1.020225, -1.286113, -3.565763, 0, 0, 0, 1, 1,
-1.019755, -0.7818824, -1.741447, 1, 1, 1, 1, 1,
-1.014791, 0.04287072, -1.859349, 1, 1, 1, 1, 1,
-1.013096, 1.184093, -1.211042, 1, 1, 1, 1, 1,
-1.010159, -0.2566972, -2.114484, 1, 1, 1, 1, 1,
-1.007454, 1.004308, -0.9979781, 1, 1, 1, 1, 1,
-1.005928, -0.6183011, -3.587692, 1, 1, 1, 1, 1,
-1.000664, 0.1818097, -2.741045, 1, 1, 1, 1, 1,
-0.9901818, 0.2286756, -1.069368, 1, 1, 1, 1, 1,
-0.9805505, -1.081166, -1.949035, 1, 1, 1, 1, 1,
-0.9762755, 0.1918241, 0.4357075, 1, 1, 1, 1, 1,
-0.9761034, 0.6979094, -0.2204828, 1, 1, 1, 1, 1,
-0.9727241, 0.1689833, -1.665892, 1, 1, 1, 1, 1,
-0.9704553, 1.227139, 0.2072711, 1, 1, 1, 1, 1,
-0.966182, 2.188542, -1.061714, 1, 1, 1, 1, 1,
-0.9646543, -0.103605, -3.12263, 1, 1, 1, 1, 1,
-0.9597269, -0.6488555, -2.259244, 0, 0, 1, 1, 1,
-0.9595896, 0.5955194, -0.3446622, 1, 0, 0, 1, 1,
-0.9539219, 0.6012906, -2.195652, 1, 0, 0, 1, 1,
-0.9511374, -1.988976, -2.999049, 1, 0, 0, 1, 1,
-0.9476022, 0.1640299, -0.0172486, 1, 0, 0, 1, 1,
-0.9367363, 1.103307, -0.8917769, 1, 0, 0, 1, 1,
-0.9361638, -0.8309728, -2.502331, 0, 0, 0, 1, 1,
-0.9361185, -1.2585, -1.922174, 0, 0, 0, 1, 1,
-0.9290421, 0.7969376, -2.095721, 0, 0, 0, 1, 1,
-0.9248605, 0.4985247, -2.011899, 0, 0, 0, 1, 1,
-0.9176897, -0.1225624, -1.691762, 0, 0, 0, 1, 1,
-0.9111868, 1.08328, 0.2682189, 0, 0, 0, 1, 1,
-0.9028129, 0.4794235, -2.227983, 0, 0, 0, 1, 1,
-0.8961868, -0.8247738, -1.253947, 1, 1, 1, 1, 1,
-0.8949807, -0.06544108, -1.717679, 1, 1, 1, 1, 1,
-0.8938087, 0.3263353, -2.94004, 1, 1, 1, 1, 1,
-0.8912233, 1.311785, -1.138672, 1, 1, 1, 1, 1,
-0.8869458, -0.05518116, -1.866803, 1, 1, 1, 1, 1,
-0.8832553, -0.4422898, -0.8611794, 1, 1, 1, 1, 1,
-0.878584, 1.586122, -1.538839, 1, 1, 1, 1, 1,
-0.8772395, -0.2628155, -2.374176, 1, 1, 1, 1, 1,
-0.8749716, 0.4372403, -1.842882, 1, 1, 1, 1, 1,
-0.8748418, -0.1380312, -3.489322, 1, 1, 1, 1, 1,
-0.8717234, -0.3684171, -1.640253, 1, 1, 1, 1, 1,
-0.8648371, -0.3462084, -0.857007, 1, 1, 1, 1, 1,
-0.8641332, -0.3502178, -1.31681, 1, 1, 1, 1, 1,
-0.8567163, -1.435285, -2.715953, 1, 1, 1, 1, 1,
-0.8399336, -0.02670525, -0.6967895, 1, 1, 1, 1, 1,
-0.837287, 0.1061681, -1.90913, 0, 0, 1, 1, 1,
-0.8363186, -0.1336585, 0.07940145, 1, 0, 0, 1, 1,
-0.8358778, 0.2100782, -2.231119, 1, 0, 0, 1, 1,
-0.832321, -1.122133, -4.01597, 1, 0, 0, 1, 1,
-0.8255944, -0.2025843, -2.832547, 1, 0, 0, 1, 1,
-0.8251411, 1.034671, -0.0616759, 1, 0, 0, 1, 1,
-0.817983, 1.34541, -0.3855423, 0, 0, 0, 1, 1,
-0.8054947, 0.9871662, -1.789533, 0, 0, 0, 1, 1,
-0.7984136, 0.6559001, -1.095528, 0, 0, 0, 1, 1,
-0.7973031, -0.09484187, -2.327537, 0, 0, 0, 1, 1,
-0.7904038, 0.4325733, -0.6192334, 0, 0, 0, 1, 1,
-0.7888293, -0.8218716, -2.572279, 0, 0, 0, 1, 1,
-0.7888026, 0.7496115, 0.2304553, 0, 0, 0, 1, 1,
-0.7782229, -0.6226252, -1.673572, 1, 1, 1, 1, 1,
-0.7740301, -0.7137868, -2.780786, 1, 1, 1, 1, 1,
-0.7643578, -2.582938, -1.687983, 1, 1, 1, 1, 1,
-0.7639426, -0.08078527, -2.586905, 1, 1, 1, 1, 1,
-0.7630636, -0.7161568, -2.053455, 1, 1, 1, 1, 1,
-0.7628475, 0.01187768, -2.773695, 1, 1, 1, 1, 1,
-0.7577608, -0.9733801, -0.962002, 1, 1, 1, 1, 1,
-0.7452421, 0.589233, -0.9537721, 1, 1, 1, 1, 1,
-0.7405737, -0.2443959, -1.917989, 1, 1, 1, 1, 1,
-0.7393878, -0.1953967, -1.528368, 1, 1, 1, 1, 1,
-0.7380344, -0.2862199, 0.04699489, 1, 1, 1, 1, 1,
-0.7300733, 0.4233604, -0.3150807, 1, 1, 1, 1, 1,
-0.7297768, -0.2120479, -2.600924, 1, 1, 1, 1, 1,
-0.729424, -0.8191276, -3.176876, 1, 1, 1, 1, 1,
-0.7247088, 1.757734, 1.309355, 1, 1, 1, 1, 1,
-0.7214671, 0.07506142, 0.3514931, 0, 0, 1, 1, 1,
-0.7198826, 1.034268, -2.098687, 1, 0, 0, 1, 1,
-0.7168208, 2.454281, -0.8067355, 1, 0, 0, 1, 1,
-0.7135853, 1.874919, -1.262379, 1, 0, 0, 1, 1,
-0.7067107, -0.4595475, -2.451303, 1, 0, 0, 1, 1,
-0.6848689, 0.9444947, -0.9439378, 1, 0, 0, 1, 1,
-0.6812206, 0.1284308, -2.894677, 0, 0, 0, 1, 1,
-0.6781836, 0.1347207, -1.162912, 0, 0, 0, 1, 1,
-0.6770801, 1.107623, 2.053715, 0, 0, 0, 1, 1,
-0.6749481, -0.861067, -1.717663, 0, 0, 0, 1, 1,
-0.6629368, -0.2354882, -0.2827729, 0, 0, 0, 1, 1,
-0.6623283, 0.4877027, -2.162695, 0, 0, 0, 1, 1,
-0.6603506, -0.5713469, -3.306433, 0, 0, 0, 1, 1,
-0.6590701, -0.365898, -3.025059, 1, 1, 1, 1, 1,
-0.6589096, 0.6058404, -0.8445323, 1, 1, 1, 1, 1,
-0.6497821, 0.8447692, -0.2078279, 1, 1, 1, 1, 1,
-0.6459114, 0.4536468, -2.588292, 1, 1, 1, 1, 1,
-0.6395623, -0.930496, -3.044613, 1, 1, 1, 1, 1,
-0.6388374, -0.313957, -2.998095, 1, 1, 1, 1, 1,
-0.6364019, -0.4724379, -2.769002, 1, 1, 1, 1, 1,
-0.6334572, -1.027746, -1.738555, 1, 1, 1, 1, 1,
-0.6327908, 0.4089578, -0.5983574, 1, 1, 1, 1, 1,
-0.6312099, -1.550759, -1.264217, 1, 1, 1, 1, 1,
-0.6282493, 1.045843, -0.2603115, 1, 1, 1, 1, 1,
-0.6257905, -0.2372445, -1.288206, 1, 1, 1, 1, 1,
-0.6248682, -0.8445635, -2.78862, 1, 1, 1, 1, 1,
-0.622807, -0.8395281, -1.241256, 1, 1, 1, 1, 1,
-0.6224527, 0.2377909, -1.17315, 1, 1, 1, 1, 1,
-0.6220208, 0.1284388, -0.02858766, 0, 0, 1, 1, 1,
-0.621, 0.6210238, -1.23418, 1, 0, 0, 1, 1,
-0.6197531, 0.116227, -2.097983, 1, 0, 0, 1, 1,
-0.6188421, -1.306322, -3.909929, 1, 0, 0, 1, 1,
-0.6183783, -1.259652, -1.05128, 1, 0, 0, 1, 1,
-0.6160462, 0.3106741, -0.8738228, 1, 0, 0, 1, 1,
-0.6117975, 0.1899768, -1.128109, 0, 0, 0, 1, 1,
-0.6111211, -0.3026139, -1.501846, 0, 0, 0, 1, 1,
-0.6078279, -0.8398397, -1.250665, 0, 0, 0, 1, 1,
-0.604399, -0.2304875, -1.975896, 0, 0, 0, 1, 1,
-0.6029277, -0.8797216, -3.219098, 0, 0, 0, 1, 1,
-0.6000808, 0.8649396, 0.7143375, 0, 0, 0, 1, 1,
-0.5974637, 1.590151, 0.2267887, 0, 0, 0, 1, 1,
-0.5945477, -0.1076199, -1.846948, 1, 1, 1, 1, 1,
-0.5929264, 0.2827345, -0.9320354, 1, 1, 1, 1, 1,
-0.5903857, -0.9579648, -2.420964, 1, 1, 1, 1, 1,
-0.5903456, 0.8010495, -1.39852, 1, 1, 1, 1, 1,
-0.5861744, -0.8850533, -1.564065, 1, 1, 1, 1, 1,
-0.5819069, -1.511236, -4.770882, 1, 1, 1, 1, 1,
-0.5807657, -0.3327532, -3.099738, 1, 1, 1, 1, 1,
-0.5778139, 0.8262154, -1.952891, 1, 1, 1, 1, 1,
-0.5773823, -1.493502, -2.86521, 1, 1, 1, 1, 1,
-0.5773662, -1.040781, -2.172488, 1, 1, 1, 1, 1,
-0.5716463, -1.142599, -3.235215, 1, 1, 1, 1, 1,
-0.5714282, 0.2431331, -2.816423, 1, 1, 1, 1, 1,
-0.5708318, 0.538476, -0.8595564, 1, 1, 1, 1, 1,
-0.5640773, 0.8421311, -0.4211909, 1, 1, 1, 1, 1,
-0.5631256, -1.138792, -2.480874, 1, 1, 1, 1, 1,
-0.5607658, 0.4793668, 0.7141748, 0, 0, 1, 1, 1,
-0.559194, 0.4555637, 0.08604773, 1, 0, 0, 1, 1,
-0.5574263, 0.8632925, 0.5778127, 1, 0, 0, 1, 1,
-0.5495379, -0.738981, -3.605839, 1, 0, 0, 1, 1,
-0.5489166, 1.142312, -2.08001, 1, 0, 0, 1, 1,
-0.5467336, -0.5568401, -2.878146, 1, 0, 0, 1, 1,
-0.5455843, -0.6623561, -2.860891, 0, 0, 0, 1, 1,
-0.5414431, 0.6846979, -0.7574102, 0, 0, 0, 1, 1,
-0.5370498, 0.02977262, -2.442611, 0, 0, 0, 1, 1,
-0.5289764, -0.8338502, -3.120728, 0, 0, 0, 1, 1,
-0.5255432, 0.06187641, -3.082426, 0, 0, 0, 1, 1,
-0.5237208, 2.626458, -0.8980389, 0, 0, 0, 1, 1,
-0.5210388, -0.4506335, -2.047228, 0, 0, 0, 1, 1,
-0.5189703, 0.09754185, -0.8587697, 1, 1, 1, 1, 1,
-0.5185179, -0.1288159, -0.9749467, 1, 1, 1, 1, 1,
-0.5184218, -1.236945, -2.59736, 1, 1, 1, 1, 1,
-0.5136184, -0.2932887, -1.415642, 1, 1, 1, 1, 1,
-0.5115767, -0.6459917, -2.951325, 1, 1, 1, 1, 1,
-0.5100338, 1.647122, 1.246923, 1, 1, 1, 1, 1,
-0.5091187, 0.9473636, 0.6513694, 1, 1, 1, 1, 1,
-0.5084784, -0.6225687, -2.653247, 1, 1, 1, 1, 1,
-0.505597, -0.2278838, -3.054428, 1, 1, 1, 1, 1,
-0.4991015, -0.5770061, -2.254275, 1, 1, 1, 1, 1,
-0.4977787, -0.259827, -0.8300232, 1, 1, 1, 1, 1,
-0.4923497, -0.4574711, -1.519456, 1, 1, 1, 1, 1,
-0.4863066, 0.9840477, -0.6283715, 1, 1, 1, 1, 1,
-0.484236, -0.4485288, -2.516077, 1, 1, 1, 1, 1,
-0.4832743, -1.043249, -3.80562, 1, 1, 1, 1, 1,
-0.4826056, -0.9864676, -0.4986661, 0, 0, 1, 1, 1,
-0.4814728, 0.8262858, 0.7401007, 1, 0, 0, 1, 1,
-0.478866, -0.1855814, -3.093225, 1, 0, 0, 1, 1,
-0.4704267, 1.395167, -1.509048, 1, 0, 0, 1, 1,
-0.4642881, 1.04375, -2.133975, 1, 0, 0, 1, 1,
-0.4637707, -1.372419, -3.397768, 1, 0, 0, 1, 1,
-0.4636757, 0.4075391, -3.570004, 0, 0, 0, 1, 1,
-0.4622444, 0.9876387, 0.6696844, 0, 0, 0, 1, 1,
-0.4599432, 0.351595, -2.564365, 0, 0, 0, 1, 1,
-0.4569246, -1.359178, -1.62867, 0, 0, 0, 1, 1,
-0.4485389, -0.8908181, -1.970813, 0, 0, 0, 1, 1,
-0.446948, -0.2584444, -2.902827, 0, 0, 0, 1, 1,
-0.4412487, 0.2723497, -0.9631964, 0, 0, 0, 1, 1,
-0.4391373, -1.120217, -3.424034, 1, 1, 1, 1, 1,
-0.4344591, 0.8244652, 0.6034101, 1, 1, 1, 1, 1,
-0.4332496, -0.686173, -2.501981, 1, 1, 1, 1, 1,
-0.4331746, 0.05771856, 0.4999589, 1, 1, 1, 1, 1,
-0.430209, -0.06368447, -0.946968, 1, 1, 1, 1, 1,
-0.4300785, -0.2010126, -1.86983, 1, 1, 1, 1, 1,
-0.4280359, 0.2056771, -1.643751, 1, 1, 1, 1, 1,
-0.4269046, 0.2932517, -0.8666369, 1, 1, 1, 1, 1,
-0.4256576, 0.0234142, -1.044927, 1, 1, 1, 1, 1,
-0.4242921, 0.7912832, -1.87738, 1, 1, 1, 1, 1,
-0.4213699, 1.828473, -2.706539, 1, 1, 1, 1, 1,
-0.4201487, -0.7281444, -2.681004, 1, 1, 1, 1, 1,
-0.4143129, -1.543908, -2.4835, 1, 1, 1, 1, 1,
-0.4056012, -0.3708833, -2.326647, 1, 1, 1, 1, 1,
-0.404689, -1.201737, -3.52324, 1, 1, 1, 1, 1,
-0.4012787, -0.432098, -2.298845, 0, 0, 1, 1, 1,
-0.3992402, 0.5988475, 0.414528, 1, 0, 0, 1, 1,
-0.3956893, 0.2817843, -2.236446, 1, 0, 0, 1, 1,
-0.3919429, -0.1512307, -1.021236, 1, 0, 0, 1, 1,
-0.3913212, -0.262765, -3.172348, 1, 0, 0, 1, 1,
-0.3908585, 1.504454, -0.1241687, 1, 0, 0, 1, 1,
-0.3908455, 0.3238352, 0.7366468, 0, 0, 0, 1, 1,
-0.3892961, -0.3830409, -2.462255, 0, 0, 0, 1, 1,
-0.3852017, 1.849578, 1.340927, 0, 0, 0, 1, 1,
-0.3710395, -0.1128698, -3.949763, 0, 0, 0, 1, 1,
-0.3696764, -0.1374269, -3.951172, 0, 0, 0, 1, 1,
-0.3696486, -2.377714, -2.898723, 0, 0, 0, 1, 1,
-0.366776, -0.7788039, -1.986864, 0, 0, 0, 1, 1,
-0.3667698, -0.2211584, -1.361579, 1, 1, 1, 1, 1,
-0.3627869, 0.393501, 0.1109221, 1, 1, 1, 1, 1,
-0.3625044, 0.359541, -0.2460393, 1, 1, 1, 1, 1,
-0.3619646, -0.8302693, -2.718078, 1, 1, 1, 1, 1,
-0.3588091, 2.007304, -1.34145, 1, 1, 1, 1, 1,
-0.3583365, 0.1746258, -0.451425, 1, 1, 1, 1, 1,
-0.3575711, -1.25279, -1.06732, 1, 1, 1, 1, 1,
-0.3528736, -0.001685475, 0.2886595, 1, 1, 1, 1, 1,
-0.3430636, 2.634995, -1.680271, 1, 1, 1, 1, 1,
-0.3387095, 0.4252541, -1.10137, 1, 1, 1, 1, 1,
-0.3381838, 0.2216755, -2.738214, 1, 1, 1, 1, 1,
-0.3360961, -0.3103892, -2.805911, 1, 1, 1, 1, 1,
-0.3326308, 0.2238615, -0.4445083, 1, 1, 1, 1, 1,
-0.3320754, 1.366766, -1.003576, 1, 1, 1, 1, 1,
-0.3311884, 1.00423, 0.2702016, 1, 1, 1, 1, 1,
-0.3289511, -0.2519866, -3.889404, 0, 0, 1, 1, 1,
-0.3266061, 0.486819, 0.3436071, 1, 0, 0, 1, 1,
-0.3249926, -0.04958989, -2.885716, 1, 0, 0, 1, 1,
-0.3234946, -0.6829088, -4.404196, 1, 0, 0, 1, 1,
-0.3218091, 0.4649139, -0.7371092, 1, 0, 0, 1, 1,
-0.3195447, 0.7557371, 0.1291697, 1, 0, 0, 1, 1,
-0.3187809, 0.2865036, -0.7808897, 0, 0, 0, 1, 1,
-0.3165685, 0.9296024, 0.6823446, 0, 0, 0, 1, 1,
-0.3145471, -0.8465108, -2.81434, 0, 0, 0, 1, 1,
-0.3025966, -0.7987905, -3.14955, 0, 0, 0, 1, 1,
-0.3006031, 2.255968, -0.3088851, 0, 0, 0, 1, 1,
-0.3005623, 0.7873952, -0.1066913, 0, 0, 0, 1, 1,
-0.2999093, -0.214754, -1.846842, 0, 0, 0, 1, 1,
-0.2960699, -1.310135, -2.956682, 1, 1, 1, 1, 1,
-0.2914702, -2.32058, -4.165, 1, 1, 1, 1, 1,
-0.2910736, -1.955217, -4.036186, 1, 1, 1, 1, 1,
-0.2889368, -0.5005122, -2.251973, 1, 1, 1, 1, 1,
-0.2876914, 0.2634379, -1.272649, 1, 1, 1, 1, 1,
-0.286056, 1.505978, -0.6789696, 1, 1, 1, 1, 1,
-0.2784602, -1.196168, -2.449905, 1, 1, 1, 1, 1,
-0.2776568, -1.156781, -2.432409, 1, 1, 1, 1, 1,
-0.2744522, 0.07543804, -3.619938, 1, 1, 1, 1, 1,
-0.267018, -0.5205876, -1.704628, 1, 1, 1, 1, 1,
-0.2664611, 1.303395, -0.6559343, 1, 1, 1, 1, 1,
-0.2663944, 0.7335514, -0.767911, 1, 1, 1, 1, 1,
-0.2655038, -2.201089, -1.781738, 1, 1, 1, 1, 1,
-0.2651002, 0.8371691, 1.491717, 1, 1, 1, 1, 1,
-0.2608048, -0.4220207, -2.071784, 1, 1, 1, 1, 1,
-0.259281, 1.147344, -0.5653021, 0, 0, 1, 1, 1,
-0.258045, -0.8322026, -2.158499, 1, 0, 0, 1, 1,
-0.2570076, 1.868219, -0.6331042, 1, 0, 0, 1, 1,
-0.2551519, 1.626008, -0.1439574, 1, 0, 0, 1, 1,
-0.2536251, -0.395569, -4.270642, 1, 0, 0, 1, 1,
-0.2505926, 0.2878733, -1.287451, 1, 0, 0, 1, 1,
-0.2480588, 0.2068504, -1.200709, 0, 0, 0, 1, 1,
-0.2474566, 0.1517068, 0.5270364, 0, 0, 0, 1, 1,
-0.2466079, -0.2731331, -1.321365, 0, 0, 0, 1, 1,
-0.2452967, -0.6797631, -1.872991, 0, 0, 0, 1, 1,
-0.2424669, -0.065923, -2.401579, 0, 0, 0, 1, 1,
-0.2416361, -0.8447197, -1.490233, 0, 0, 0, 1, 1,
-0.2407375, -0.2293936, -2.611177, 0, 0, 0, 1, 1,
-0.2401584, 0.4989591, -0.03172654, 1, 1, 1, 1, 1,
-0.2381741, 1.28045, -0.5527434, 1, 1, 1, 1, 1,
-0.2342894, 0.9127522, -0.6196471, 1, 1, 1, 1, 1,
-0.2308216, 0.8814238, -1.864415, 1, 1, 1, 1, 1,
-0.2286734, 1.813805, 1.072092, 1, 1, 1, 1, 1,
-0.2277454, -0.5548769, -2.145479, 1, 1, 1, 1, 1,
-0.2272589, 0.8523874, 0.09445353, 1, 1, 1, 1, 1,
-0.225498, -0.9138077, -4.971964, 1, 1, 1, 1, 1,
-0.2185267, 2.593031, -1.183565, 1, 1, 1, 1, 1,
-0.217805, 0.2161485, -0.9782512, 1, 1, 1, 1, 1,
-0.2151241, 0.2519724, 0.4065243, 1, 1, 1, 1, 1,
-0.2146469, -1.214124, -3.032318, 1, 1, 1, 1, 1,
-0.2130599, 0.4236626, -0.7050647, 1, 1, 1, 1, 1,
-0.2038967, 0.5513653, 0.1698006, 1, 1, 1, 1, 1,
-0.203116, 0.04449791, -2.101941, 1, 1, 1, 1, 1,
-0.2029677, -0.6203824, -3.70017, 0, 0, 1, 1, 1,
-0.2025932, -0.4224401, -5.450471, 1, 0, 0, 1, 1,
-0.2003282, -0.1775743, -3.099382, 1, 0, 0, 1, 1,
-0.2000232, 1.460952, -0.3833014, 1, 0, 0, 1, 1,
-0.1980513, -1.149757, -2.913444, 1, 0, 0, 1, 1,
-0.1928197, 1.690027, -0.1605375, 1, 0, 0, 1, 1,
-0.1913461, 3.506745, 1.605046, 0, 0, 0, 1, 1,
-0.189956, 2.093432, -1.902891, 0, 0, 0, 1, 1,
-0.1890868, 0.3532139, -1.977798, 0, 0, 0, 1, 1,
-0.1882869, -1.544443, -2.030977, 0, 0, 0, 1, 1,
-0.1841755, -1.50253, -4.447605, 0, 0, 0, 1, 1,
-0.1831868, -1.491711, -1.137564, 0, 0, 0, 1, 1,
-0.1789458, -1.323174, -1.673962, 0, 0, 0, 1, 1,
-0.1786917, 2.052651, 1.064294, 1, 1, 1, 1, 1,
-0.1777472, -0.6682656, -3.771753, 1, 1, 1, 1, 1,
-0.1742842, 0.2999471, 0.2101913, 1, 1, 1, 1, 1,
-0.1685388, 0.1719367, -1.703732, 1, 1, 1, 1, 1,
-0.1659783, -0.4588245, -1.203419, 1, 1, 1, 1, 1,
-0.1644167, -1.275249, -2.721361, 1, 1, 1, 1, 1,
-0.1635331, -0.8618414, -2.436458, 1, 1, 1, 1, 1,
-0.1590046, -0.396005, -2.886424, 1, 1, 1, 1, 1,
-0.1561986, 0.3440253, -0.2675295, 1, 1, 1, 1, 1,
-0.1521516, -2.01891, -4.33085, 1, 1, 1, 1, 1,
-0.1512861, -0.2178632, -2.744667, 1, 1, 1, 1, 1,
-0.1506676, -0.2760598, -3.570998, 1, 1, 1, 1, 1,
-0.1473958, -0.9647844, -2.769169, 1, 1, 1, 1, 1,
-0.1468909, -1.004558, -2.456423, 1, 1, 1, 1, 1,
-0.1396573, 1.789427, -1.281337, 1, 1, 1, 1, 1,
-0.1323637, -0.02222042, -2.722324, 0, 0, 1, 1, 1,
-0.1322343, 0.3303954, 1.298228, 1, 0, 0, 1, 1,
-0.1303927, 0.6007932, -0.1301949, 1, 0, 0, 1, 1,
-0.1297276, -1.24296, -2.998827, 1, 0, 0, 1, 1,
-0.1284172, 0.8531631, 0.03974845, 1, 0, 0, 1, 1,
-0.128234, -2.083365, -2.822086, 1, 0, 0, 1, 1,
-0.1261674, -0.4448115, -3.567917, 0, 0, 0, 1, 1,
-0.1225935, 0.317129, 1.042156, 0, 0, 0, 1, 1,
-0.1179652, -0.3396706, -0.9802784, 0, 0, 0, 1, 1,
-0.1178247, 0.06144004, -0.8189254, 0, 0, 0, 1, 1,
-0.1160047, -1.79326, -3.05599, 0, 0, 0, 1, 1,
-0.1142432, -1.352837, -3.337454, 0, 0, 0, 1, 1,
-0.1107967, -1.47588, -3.380044, 0, 0, 0, 1, 1,
-0.109138, -1.374416, -1.877535, 1, 1, 1, 1, 1,
-0.1079277, 0.4563265, 0.01319885, 1, 1, 1, 1, 1,
-0.1018893, -0.08789466, -3.412409, 1, 1, 1, 1, 1,
-0.09988029, -0.7025065, -2.276906, 1, 1, 1, 1, 1,
-0.09957694, 1.979277, 0.3814411, 1, 1, 1, 1, 1,
-0.09777023, 1.317358, -0.07607672, 1, 1, 1, 1, 1,
-0.09109038, 1.462513, -0.4328204, 1, 1, 1, 1, 1,
-0.0895662, -0.3707378, -3.307544, 1, 1, 1, 1, 1,
-0.08948995, -1.093516, -3.59797, 1, 1, 1, 1, 1,
-0.08917001, 1.156295, 0.2232129, 1, 1, 1, 1, 1,
-0.08443035, 0.2066565, 0.279638, 1, 1, 1, 1, 1,
-0.08408641, -1.807013, -2.621848, 1, 1, 1, 1, 1,
-0.08396816, 0.9036117, 1.516471, 1, 1, 1, 1, 1,
-0.07197475, -0.5030177, -1.262444, 1, 1, 1, 1, 1,
-0.06172234, -1.452176, -1.52833, 1, 1, 1, 1, 1,
-0.05903073, 1.034921, 0.9021764, 0, 0, 1, 1, 1,
-0.05825493, 0.188361, -2.120924, 1, 0, 0, 1, 1,
-0.0553663, 2.942955, 0.2110198, 1, 0, 0, 1, 1,
-0.05451846, -0.1124152, -2.289057, 1, 0, 0, 1, 1,
-0.05379768, 0.318702, -1.365397, 1, 0, 0, 1, 1,
-0.05087831, 0.9583179, -1.333121, 1, 0, 0, 1, 1,
-0.04570144, -0.6597914, -3.1579, 0, 0, 0, 1, 1,
-0.04451295, -0.5031204, -2.549341, 0, 0, 0, 1, 1,
-0.04000348, -0.5890964, -5.155545, 0, 0, 0, 1, 1,
-0.03936575, -1.965901, -2.225365, 0, 0, 0, 1, 1,
-0.03930042, -1.487304, -3.43812, 0, 0, 0, 1, 1,
-0.03807241, -1.650425, -3.939215, 0, 0, 0, 1, 1,
-0.03506591, -1.651621, -3.670568, 0, 0, 0, 1, 1,
-0.02843766, 0.8363646, -0.8958142, 1, 1, 1, 1, 1,
-0.02598586, 1.757237, 0.05214244, 1, 1, 1, 1, 1,
-0.02460599, 0.05260924, -2.391886, 1, 1, 1, 1, 1,
-0.02210837, 0.02902684, 0.06593549, 1, 1, 1, 1, 1,
-0.02167242, -0.5116963, -0.9287327, 1, 1, 1, 1, 1,
-0.01949913, -0.2003558, -2.9914, 1, 1, 1, 1, 1,
-0.01947564, -1.335891, -3.239105, 1, 1, 1, 1, 1,
-0.01663454, -1.263908, -2.41877, 1, 1, 1, 1, 1,
-0.01661059, 1.626256, -0.6469518, 1, 1, 1, 1, 1,
-0.01481686, -0.2305589, -2.658994, 1, 1, 1, 1, 1,
-0.01432435, 0.469067, 0.7769062, 1, 1, 1, 1, 1,
-0.008857337, 0.3511216, 1.379075, 1, 1, 1, 1, 1,
-0.006648635, -1.490235, -3.848976, 1, 1, 1, 1, 1,
-0.002557541, -1.40663, -2.186511, 1, 1, 1, 1, 1,
0.001605234, 0.3923721, -1.326614, 1, 1, 1, 1, 1,
0.00390964, -1.938517, 5.749891, 0, 0, 1, 1, 1,
0.007072562, -1.334974, 3.229995, 1, 0, 0, 1, 1,
0.007759202, 1.681808, -0.8246978, 1, 0, 0, 1, 1,
0.01096187, -0.4411518, 2.5615, 1, 0, 0, 1, 1,
0.01112858, 0.4017235, 1.133687, 1, 0, 0, 1, 1,
0.0182993, 0.3579471, -0.7956065, 1, 0, 0, 1, 1,
0.02528471, -1.465967, 2.902524, 0, 0, 0, 1, 1,
0.02668578, -0.3360476, 3.050689, 0, 0, 0, 1, 1,
0.02766379, 1.009543, -0.6067839, 0, 0, 0, 1, 1,
0.02960971, 1.366838, 0.1708601, 0, 0, 0, 1, 1,
0.03148691, 1.014064, 1.190927, 0, 0, 0, 1, 1,
0.03190699, 1.298668, 0.1541613, 0, 0, 0, 1, 1,
0.03681897, -0.6067473, 2.815772, 0, 0, 0, 1, 1,
0.03767035, 0.07278516, 1.726314, 1, 1, 1, 1, 1,
0.03939255, -1.123218, 3.443942, 1, 1, 1, 1, 1,
0.04627057, 0.2656451, 0.8072653, 1, 1, 1, 1, 1,
0.04765806, 0.2534463, 0.1230247, 1, 1, 1, 1, 1,
0.04891638, 1.154534, -0.7228256, 1, 1, 1, 1, 1,
0.05185717, -0.1502822, 1.9061, 1, 1, 1, 1, 1,
0.05905404, -0.3161649, 1.681653, 1, 1, 1, 1, 1,
0.06122995, -1.559207, 4.805338, 1, 1, 1, 1, 1,
0.06235634, 1.580679, 0.3242129, 1, 1, 1, 1, 1,
0.06361031, 0.7961033, -0.3958741, 1, 1, 1, 1, 1,
0.06361552, 0.2388079, -0.5153953, 1, 1, 1, 1, 1,
0.06929889, -0.2943771, 3.054008, 1, 1, 1, 1, 1,
0.06940241, -0.2836275, 2.434862, 1, 1, 1, 1, 1,
0.07088916, 0.3086417, 1.876139, 1, 1, 1, 1, 1,
0.07106717, -1.145444, 4.576241, 1, 1, 1, 1, 1,
0.07142965, -0.7611185, 3.684757, 0, 0, 1, 1, 1,
0.07170352, 0.1040519, 0.6210932, 1, 0, 0, 1, 1,
0.07549232, 0.4027325, 0.3254171, 1, 0, 0, 1, 1,
0.07562941, 0.7733918, 1.381638, 1, 0, 0, 1, 1,
0.07741377, 0.5783247, 0.486338, 1, 0, 0, 1, 1,
0.08309396, -0.4367895, 1.21741, 1, 0, 0, 1, 1,
0.08584458, 1.520893, 1.381058, 0, 0, 0, 1, 1,
0.08609361, 0.4853815, -1.280475, 0, 0, 0, 1, 1,
0.09620778, -1.608987, 3.259384, 0, 0, 0, 1, 1,
0.09666751, 1.674777, -0.1570323, 0, 0, 0, 1, 1,
0.09799043, 0.08989699, 0.1235029, 0, 0, 0, 1, 1,
0.09872194, 1.437839, -1.136847, 0, 0, 0, 1, 1,
0.1020777, -0.1071964, 2.568439, 0, 0, 0, 1, 1,
0.1031388, -0.7752819, 4.904452, 1, 1, 1, 1, 1,
0.1032023, 0.6665753, 0.2613404, 1, 1, 1, 1, 1,
0.1095241, 1.284315, -1.828709, 1, 1, 1, 1, 1,
0.1105646, 2.095111, -0.1966717, 1, 1, 1, 1, 1,
0.1115562, 0.541852, 0.1193913, 1, 1, 1, 1, 1,
0.1245847, -1.782001, 2.763135, 1, 1, 1, 1, 1,
0.1252283, 2.113557, -0.6772323, 1, 1, 1, 1, 1,
0.126191, -1.266157, 1.153376, 1, 1, 1, 1, 1,
0.1266375, -0.3218799, 3.020683, 1, 1, 1, 1, 1,
0.1293064, 0.3516221, 0.2298598, 1, 1, 1, 1, 1,
0.1349059, -0.5859252, 4.444123, 1, 1, 1, 1, 1,
0.1422609, 0.4596815, 1.721444, 1, 1, 1, 1, 1,
0.1429558, 2.317978, -0.2688862, 1, 1, 1, 1, 1,
0.1497388, -1.157238, 1.827342, 1, 1, 1, 1, 1,
0.1509107, -0.1968922, 2.450088, 1, 1, 1, 1, 1,
0.1560232, 1.456083, -0.3360266, 0, 0, 1, 1, 1,
0.1567156, 0.2816675, -1.085824, 1, 0, 0, 1, 1,
0.1567668, 1.521232, 0.7803116, 1, 0, 0, 1, 1,
0.1579131, -0.6647104, 3.555915, 1, 0, 0, 1, 1,
0.1587297, 0.4098675, 0.6983019, 1, 0, 0, 1, 1,
0.1596874, 0.09488805, 0.2572855, 1, 0, 0, 1, 1,
0.1618447, 0.8406103, -1.0661, 0, 0, 0, 1, 1,
0.1655658, 0.2758412, 1.040493, 0, 0, 0, 1, 1,
0.1657302, -0.3064987, 2.69055, 0, 0, 0, 1, 1,
0.1709623, 0.6959645, -0.5004975, 0, 0, 0, 1, 1,
0.1752709, -0.1098411, 1.14526, 0, 0, 0, 1, 1,
0.1780889, -1.001772, 0.1108594, 0, 0, 0, 1, 1,
0.1807353, -0.2406347, 1.685313, 0, 0, 0, 1, 1,
0.1823572, -1.175979, 3.755597, 1, 1, 1, 1, 1,
0.1842655, -0.9144314, 3.719315, 1, 1, 1, 1, 1,
0.1844414, 1.611942, -0.7850593, 1, 1, 1, 1, 1,
0.1853685, -0.4234969, 2.519118, 1, 1, 1, 1, 1,
0.1865635, 1.709711, -0.293159, 1, 1, 1, 1, 1,
0.1922638, 0.8462175, 0.002810294, 1, 1, 1, 1, 1,
0.1922888, -0.3783411, 3.014882, 1, 1, 1, 1, 1,
0.1965985, 0.7064943, -0.6181468, 1, 1, 1, 1, 1,
0.196905, -1.881765, 4.337176, 1, 1, 1, 1, 1,
0.1981896, -0.2425434, 2.821034, 1, 1, 1, 1, 1,
0.198848, 1.100157, -0.6373678, 1, 1, 1, 1, 1,
0.1997018, 0.05090518, 0.5613509, 1, 1, 1, 1, 1,
0.2016569, -1.241382, 3.708663, 1, 1, 1, 1, 1,
0.2039084, 1.101969, -1.171697, 1, 1, 1, 1, 1,
0.2063049, -0.4530144, 2.50488, 1, 1, 1, 1, 1,
0.2127777, 0.2313809, 0.967328, 0, 0, 1, 1, 1,
0.214449, 0.1243823, 1.042684, 1, 0, 0, 1, 1,
0.21819, -0.8965619, 3.444504, 1, 0, 0, 1, 1,
0.2199334, -1.734433, 2.960873, 1, 0, 0, 1, 1,
0.2301915, 1.568671, -0.518461, 1, 0, 0, 1, 1,
0.2316536, 0.07593972, 1.731731, 1, 0, 0, 1, 1,
0.2317519, 0.01912227, 1.786898, 0, 0, 0, 1, 1,
0.2324408, 0.6306616, 0.8803198, 0, 0, 0, 1, 1,
0.2326874, 0.3947588, 0.6867368, 0, 0, 0, 1, 1,
0.2334515, -1.231994, 2.706617, 0, 0, 0, 1, 1,
0.2353504, -0.8301944, 0.604866, 0, 0, 0, 1, 1,
0.2356017, 1.289225, -0.3721011, 0, 0, 0, 1, 1,
0.236139, -0.02539934, 1.257734, 0, 0, 0, 1, 1,
0.239794, -2.074152, 3.370614, 1, 1, 1, 1, 1,
0.2526039, -0.05012465, 2.633094, 1, 1, 1, 1, 1,
0.2640831, -0.6784253, 1.957718, 1, 1, 1, 1, 1,
0.2645091, -0.2936867, 2.925171, 1, 1, 1, 1, 1,
0.2648491, 0.6172876, 0.8273507, 1, 1, 1, 1, 1,
0.2653187, 0.636384, -0.02050985, 1, 1, 1, 1, 1,
0.2689024, -0.4073158, 3.527198, 1, 1, 1, 1, 1,
0.269254, -0.1942477, 2.080585, 1, 1, 1, 1, 1,
0.2717007, 0.2892341, 0.5654407, 1, 1, 1, 1, 1,
0.2720526, -0.6334664, 2.3382, 1, 1, 1, 1, 1,
0.2733241, -0.7024775, 2.024253, 1, 1, 1, 1, 1,
0.2751374, 0.4381762, -1.184859, 1, 1, 1, 1, 1,
0.2751942, 1.205663, -0.8803965, 1, 1, 1, 1, 1,
0.2752093, -0.1080103, 2.246939, 1, 1, 1, 1, 1,
0.2775004, 0.2771982, 1.297354, 1, 1, 1, 1, 1,
0.2805531, 0.07216606, 1.791124, 0, 0, 1, 1, 1,
0.2821255, 2.761652, -0.717333, 1, 0, 0, 1, 1,
0.2830951, 1.056896, 2.12209, 1, 0, 0, 1, 1,
0.2832096, 1.062096, -0.5630357, 1, 0, 0, 1, 1,
0.2836204, 0.1202414, 0.3522142, 1, 0, 0, 1, 1,
0.2841096, -0.4464557, 3.325346, 1, 0, 0, 1, 1,
0.2869859, 1.779935, -0.841718, 0, 0, 0, 1, 1,
0.287139, -0.3539683, 1.003544, 0, 0, 0, 1, 1,
0.2878293, -1.627841, 5.77545, 0, 0, 0, 1, 1,
0.2891826, -0.3971666, 1.847968, 0, 0, 0, 1, 1,
0.2894994, 0.003710776, 2.082443, 0, 0, 0, 1, 1,
0.2906825, 0.8499678, 1.126529, 0, 0, 0, 1, 1,
0.2972112, 0.53831, 0.4301262, 0, 0, 0, 1, 1,
0.2976965, -0.4141178, 2.849239, 1, 1, 1, 1, 1,
0.2996934, 1.326805, -0.8927659, 1, 1, 1, 1, 1,
0.2996992, 0.3249864, -0.3568448, 1, 1, 1, 1, 1,
0.3059163, 0.8092172, 0.8506421, 1, 1, 1, 1, 1,
0.3097725, -0.2119081, 0.5988659, 1, 1, 1, 1, 1,
0.3106666, 0.4913625, 1.203509, 1, 1, 1, 1, 1,
0.3113735, -0.06883934, 1.720697, 1, 1, 1, 1, 1,
0.3170344, 0.2595059, -1.716097, 1, 1, 1, 1, 1,
0.3174504, -1.009905, 2.404653, 1, 1, 1, 1, 1,
0.320911, 0.3100617, -0.0740204, 1, 1, 1, 1, 1,
0.3211428, 1.458319, 2.555189, 1, 1, 1, 1, 1,
0.3219688, 0.2231686, -1.551879, 1, 1, 1, 1, 1,
0.324724, 0.02308408, 1.085337, 1, 1, 1, 1, 1,
0.3274197, 0.6741504, -0.1636604, 1, 1, 1, 1, 1,
0.3303149, 0.5924352, 0.8349008, 1, 1, 1, 1, 1,
0.3365366, -0.6639507, 2.365742, 0, 0, 1, 1, 1,
0.3378919, 0.3361945, 0.4615909, 1, 0, 0, 1, 1,
0.3385302, -2.24525, 0.70615, 1, 0, 0, 1, 1,
0.3390813, 0.9373776, -1.054402, 1, 0, 0, 1, 1,
0.3428478, -0.50456, 2.868487, 1, 0, 0, 1, 1,
0.348376, -0.2043154, 0.9938071, 1, 0, 0, 1, 1,
0.349041, -2.573797, 5.124471, 0, 0, 0, 1, 1,
0.3520758, 0.4032731, -0.3053882, 0, 0, 0, 1, 1,
0.3539329, -0.0835176, 2.274744, 0, 0, 0, 1, 1,
0.3574864, -0.9797353, 3.496993, 0, 0, 0, 1, 1,
0.3606075, -0.9656737, 2.424076, 0, 0, 0, 1, 1,
0.3630189, 0.8260224, 0.653115, 0, 0, 0, 1, 1,
0.370244, -0.6505668, 4.024879, 0, 0, 0, 1, 1,
0.373138, 0.1744701, 0.3897201, 1, 1, 1, 1, 1,
0.3806867, 0.470035, 0.3298523, 1, 1, 1, 1, 1,
0.3891754, 0.9031853, 1.217578, 1, 1, 1, 1, 1,
0.3949342, -0.2311874, 2.667915, 1, 1, 1, 1, 1,
0.3988496, 1.367387, 0.6110687, 1, 1, 1, 1, 1,
0.4007182, -1.17371, 2.620232, 1, 1, 1, 1, 1,
0.4021455, -1.071459, 2.353029, 1, 1, 1, 1, 1,
0.4061824, -0.4680616, 1.265372, 1, 1, 1, 1, 1,
0.40733, 1.744503, 1.284158, 1, 1, 1, 1, 1,
0.4096979, 1.09787, 0.8613698, 1, 1, 1, 1, 1,
0.4178633, 0.2058067, 2.446835, 1, 1, 1, 1, 1,
0.4190564, -0.9147876, 3.310373, 1, 1, 1, 1, 1,
0.4196903, 0.7115147, 0.6294719, 1, 1, 1, 1, 1,
0.4212528, -1.013819, 2.809836, 1, 1, 1, 1, 1,
0.4241595, -2.755242, 2.43874, 1, 1, 1, 1, 1,
0.4317743, 0.5799343, 2.081754, 0, 0, 1, 1, 1,
0.4320898, 0.8680805, -0.1882242, 1, 0, 0, 1, 1,
0.4322675, -0.5420324, 2.898482, 1, 0, 0, 1, 1,
0.4405109, 0.524956, 1.267981, 1, 0, 0, 1, 1,
0.441203, 1.928931, 0.7373363, 1, 0, 0, 1, 1,
0.4422702, 0.5751246, 0.2357862, 1, 0, 0, 1, 1,
0.4455727, 1.445186, 0.08596792, 0, 0, 0, 1, 1,
0.4463046, 1.036124, 0.2453851, 0, 0, 0, 1, 1,
0.4507065, -2.007885, 3.00189, 0, 0, 0, 1, 1,
0.4540279, -0.4031654, 2.813718, 0, 0, 0, 1, 1,
0.4550464, -0.4385482, 3.349045, 0, 0, 0, 1, 1,
0.4589234, -0.2523838, 1.870869, 0, 0, 0, 1, 1,
0.4589262, -0.7262154, 2.90461, 0, 0, 0, 1, 1,
0.4621971, 1.34061, -0.5700777, 1, 1, 1, 1, 1,
0.4638388, -1.839065, 3.526037, 1, 1, 1, 1, 1,
0.464292, -1.837506, 2.611231, 1, 1, 1, 1, 1,
0.4644156, 0.8777802, 2.023963, 1, 1, 1, 1, 1,
0.4644287, 0.9277286, -0.715233, 1, 1, 1, 1, 1,
0.4693507, -1.418272, 3.443456, 1, 1, 1, 1, 1,
0.474051, -0.8178204, 3.363858, 1, 1, 1, 1, 1,
0.4753963, 0.2854418, 1.228528, 1, 1, 1, 1, 1,
0.4791093, 0.3094119, -0.8820217, 1, 1, 1, 1, 1,
0.4835851, -0.01961987, 1.172432, 1, 1, 1, 1, 1,
0.484902, -2.361077, 3.471407, 1, 1, 1, 1, 1,
0.4995858, 0.5821962, 1.546348, 1, 1, 1, 1, 1,
0.5035474, 0.9786254, -0.5336041, 1, 1, 1, 1, 1,
0.5037134, -0.4768649, 2.385911, 1, 1, 1, 1, 1,
0.5083418, 0.7182667, 0.8143623, 1, 1, 1, 1, 1,
0.5122829, -1.171381, 1.259048, 0, 0, 1, 1, 1,
0.5173719, 0.7827274, 0.9089273, 1, 0, 0, 1, 1,
0.5239401, 0.4564546, 1.881017, 1, 0, 0, 1, 1,
0.5319958, -1.45499, 2.897277, 1, 0, 0, 1, 1,
0.5330258, 1.95393, -2.835661, 1, 0, 0, 1, 1,
0.5332154, 1.136847, -0.196318, 1, 0, 0, 1, 1,
0.5342422, -1.115148, 0.5817283, 0, 0, 0, 1, 1,
0.5352294, -1.287236, 3.869929, 0, 0, 0, 1, 1,
0.5385928, 0.8522854, 1.609915, 0, 0, 0, 1, 1,
0.5399585, 0.1028268, 2.260352, 0, 0, 0, 1, 1,
0.5408021, -0.1054447, 0.9077509, 0, 0, 0, 1, 1,
0.5409083, -0.9069169, 1.845733, 0, 0, 0, 1, 1,
0.5415252, 1.139527, 1.734176, 0, 0, 0, 1, 1,
0.5432225, -1.429463, 3.146411, 1, 1, 1, 1, 1,
0.5460508, -1.718795, 2.211293, 1, 1, 1, 1, 1,
0.555225, 0.8897948, 2.14531, 1, 1, 1, 1, 1,
0.5605521, -0.6819425, 2.902164, 1, 1, 1, 1, 1,
0.5621746, -0.7080507, 3.324899, 1, 1, 1, 1, 1,
0.5645573, 1.572325, 1.858199, 1, 1, 1, 1, 1,
0.5682322, 0.152026, 0.9035875, 1, 1, 1, 1, 1,
0.569176, -1.403154, 3.604129, 1, 1, 1, 1, 1,
0.5728273, 1.188658, 1.090625, 1, 1, 1, 1, 1,
0.5741415, -0.4650317, 2.435688, 1, 1, 1, 1, 1,
0.5759363, 0.5431456, 1.192071, 1, 1, 1, 1, 1,
0.5811501, 1.326896, 0.6058177, 1, 1, 1, 1, 1,
0.5852953, -0.06644274, 2.933662, 1, 1, 1, 1, 1,
0.5897582, -0.636781, 1.900855, 1, 1, 1, 1, 1,
0.5925233, 2.001036, 0.6416608, 1, 1, 1, 1, 1,
0.5945398, 0.4035009, 0.8909985, 0, 0, 1, 1, 1,
0.5990009, -0.6803209, 2.027698, 1, 0, 0, 1, 1,
0.6001866, 0.2658219, 1.344323, 1, 0, 0, 1, 1,
0.6050528, 1.486071, -0.2257853, 1, 0, 0, 1, 1,
0.606953, -0.9775586, 2.518406, 1, 0, 0, 1, 1,
0.608725, -0.515107, 2.663285, 1, 0, 0, 1, 1,
0.6126783, -0.7730564, 1.63258, 0, 0, 0, 1, 1,
0.6132618, 0.8630766, 1.070133, 0, 0, 0, 1, 1,
0.6158191, 0.5329081, -0.004146846, 0, 0, 0, 1, 1,
0.6166688, 0.4367841, 2.292442, 0, 0, 0, 1, 1,
0.6175376, 1.870272, 2.422429, 0, 0, 0, 1, 1,
0.6178015, -0.4524521, 1.360426, 0, 0, 0, 1, 1,
0.6232886, -0.6035717, 3.398207, 0, 0, 0, 1, 1,
0.6253399, -0.563722, 2.752113, 1, 1, 1, 1, 1,
0.6310309, -1.457917, 2.470525, 1, 1, 1, 1, 1,
0.6362185, -2.105532, 4.484576, 1, 1, 1, 1, 1,
0.6365038, 0.1478125, 2.375923, 1, 1, 1, 1, 1,
0.6389908, -0.2010474, 2.889881, 1, 1, 1, 1, 1,
0.6495821, 0.9576785, 1.972118, 1, 1, 1, 1, 1,
0.6557662, 0.3410976, -0.5846757, 1, 1, 1, 1, 1,
0.6609147, -2.011028, 1.849602, 1, 1, 1, 1, 1,
0.6622056, 0.6710456, 0.1113482, 1, 1, 1, 1, 1,
0.6727374, 0.09911598, 1.501584, 1, 1, 1, 1, 1,
0.6748717, 1.089701, 1.776145, 1, 1, 1, 1, 1,
0.6755526, 0.6543567, 2.296195, 1, 1, 1, 1, 1,
0.684481, -0.4750207, 2.81706, 1, 1, 1, 1, 1,
0.684926, 0.02841183, -0.137144, 1, 1, 1, 1, 1,
0.6855378, 0.5028493, -0.9384039, 1, 1, 1, 1, 1,
0.6891344, 0.1165921, 1.040383, 0, 0, 1, 1, 1,
0.690544, -1.959651, 2.873708, 1, 0, 0, 1, 1,
0.6928439, 0.8400822, 0.4932609, 1, 0, 0, 1, 1,
0.6937276, -0.6045925, 2.406978, 1, 0, 0, 1, 1,
0.696576, 0.7735134, 1.14966, 1, 0, 0, 1, 1,
0.6972749, -0.548129, 1.508232, 1, 0, 0, 1, 1,
0.7071375, 0.4117559, -1.219761, 0, 0, 0, 1, 1,
0.7110316, -1.369329, 3.130746, 0, 0, 0, 1, 1,
0.7122958, 1.169291, 0.38286, 0, 0, 0, 1, 1,
0.7127512, 0.5046392, 1.504505, 0, 0, 0, 1, 1,
0.7212304, -0.7083898, 2.792018, 0, 0, 0, 1, 1,
0.7359601, 0.2399217, 3.11392, 0, 0, 0, 1, 1,
0.7389147, -0.03870246, 1.807536, 0, 0, 0, 1, 1,
0.7417328, -0.4782515, 1.892315, 1, 1, 1, 1, 1,
0.7422625, 0.5688171, 0.9878451, 1, 1, 1, 1, 1,
0.7458598, -1.08732, 3.73601, 1, 1, 1, 1, 1,
0.7498871, 1.509405, -0.4677997, 1, 1, 1, 1, 1,
0.7525206, 1.938897, -2.382947, 1, 1, 1, 1, 1,
0.7684816, -0.5503298, 2.09742, 1, 1, 1, 1, 1,
0.7848789, 1.145362, 1.522421, 1, 1, 1, 1, 1,
0.7851045, 0.3317427, 1.154608, 1, 1, 1, 1, 1,
0.787939, 2.330976, -0.7497771, 1, 1, 1, 1, 1,
0.7896618, -1.071545, 1.165458, 1, 1, 1, 1, 1,
0.7975696, -0.6554586, 1.396476, 1, 1, 1, 1, 1,
0.8018909, 0.8431246, 1.194578, 1, 1, 1, 1, 1,
0.806957, -0.8332705, 1.547666, 1, 1, 1, 1, 1,
0.8107623, 0.5623155, 0.8840038, 1, 1, 1, 1, 1,
0.8181849, 0.9022955, 1.065231, 1, 1, 1, 1, 1,
0.820084, 1.086107, -0.01463091, 0, 0, 1, 1, 1,
0.8234028, 0.2402787, 1.356951, 1, 0, 0, 1, 1,
0.8251779, -1.25862, 2.49187, 1, 0, 0, 1, 1,
0.8259054, 0.245324, 1.400661, 1, 0, 0, 1, 1,
0.8267201, 0.3186127, 1.750522, 1, 0, 0, 1, 1,
0.8335969, 0.1944641, 1.802339, 1, 0, 0, 1, 1,
0.8372374, 0.3703259, 1.221578, 0, 0, 0, 1, 1,
0.8378769, -1.377227, 3.344115, 0, 0, 0, 1, 1,
0.8406799, -0.4301133, 2.774576, 0, 0, 0, 1, 1,
0.8417549, -1.302723, 4.316848, 0, 0, 0, 1, 1,
0.8425674, -1.285126, 0.7595142, 0, 0, 0, 1, 1,
0.8506994, -1.662613, 3.258085, 0, 0, 0, 1, 1,
0.8529619, 1.326871, -1.971611, 0, 0, 0, 1, 1,
0.8537983, -0.03744804, 1.08767, 1, 1, 1, 1, 1,
0.8543226, 1.544611, -0.1166104, 1, 1, 1, 1, 1,
0.8545624, -0.09068827, 1.657433, 1, 1, 1, 1, 1,
0.8549931, -1.038032, 3.223099, 1, 1, 1, 1, 1,
0.8674678, 1.19204, 1.016595, 1, 1, 1, 1, 1,
0.8683199, -0.7542314, 3.080563, 1, 1, 1, 1, 1,
0.869476, -1.783553, 2.118215, 1, 1, 1, 1, 1,
0.871165, -0.8934841, 2.385631, 1, 1, 1, 1, 1,
0.8733231, -0.7738715, 2.19918, 1, 1, 1, 1, 1,
0.8743132, 1.149209, 0.01897527, 1, 1, 1, 1, 1,
0.8806703, 0.04190391, 1.343375, 1, 1, 1, 1, 1,
0.8820021, -0.3224718, -0.5121215, 1, 1, 1, 1, 1,
0.8852844, 0.8657833, 0.2789754, 1, 1, 1, 1, 1,
0.8858545, -0.2051704, 0.5131205, 1, 1, 1, 1, 1,
0.8894793, -1.284756, 1.544518, 1, 1, 1, 1, 1,
0.8937718, -1.294763, 3.392362, 0, 0, 1, 1, 1,
0.8939173, -1.253706, 1.155564, 1, 0, 0, 1, 1,
0.8954348, -0.7247944, 2.553103, 1, 0, 0, 1, 1,
0.8957037, 0.5334679, 2.845991, 1, 0, 0, 1, 1,
0.8982739, -0.6583882, 2.788329, 1, 0, 0, 1, 1,
0.9015158, -0.9472018, 3.301548, 1, 0, 0, 1, 1,
0.9055766, -0.1917407, 1.485931, 0, 0, 0, 1, 1,
0.9083602, -0.01384813, 0.3463748, 0, 0, 0, 1, 1,
0.9087987, -0.3657962, 2.755785, 0, 0, 0, 1, 1,
0.9088492, -0.1562361, 1.887868, 0, 0, 0, 1, 1,
0.9136255, 0.6873958, -1.070857, 0, 0, 0, 1, 1,
0.9164457, 0.08880644, 1.065876, 0, 0, 0, 1, 1,
0.9180487, 1.069136, 0.5156273, 0, 0, 0, 1, 1,
0.9267637, -0.9428949, 2.481234, 1, 1, 1, 1, 1,
0.9267713, 0.1134405, 2.596578, 1, 1, 1, 1, 1,
0.9273221, -0.3215657, 2.905009, 1, 1, 1, 1, 1,
0.9311903, -0.2011245, 2.305206, 1, 1, 1, 1, 1,
0.9453514, -0.02876099, 1.594811, 1, 1, 1, 1, 1,
0.9578457, 0.05642653, 0.7461008, 1, 1, 1, 1, 1,
0.9604997, -1.57129, 3.733615, 1, 1, 1, 1, 1,
0.9662512, -0.5587792, 2.153735, 1, 1, 1, 1, 1,
0.9675835, -0.3705933, 2.677286, 1, 1, 1, 1, 1,
0.9695072, -1.510543, 2.845928, 1, 1, 1, 1, 1,
0.9739054, 0.4958146, 2.206867, 1, 1, 1, 1, 1,
0.9810881, 1.004116, -0.03065864, 1, 1, 1, 1, 1,
0.9817577, -1.235257, 0.5547151, 1, 1, 1, 1, 1,
0.9837795, -0.5356953, 1.074643, 1, 1, 1, 1, 1,
0.9840544, 0.4913993, 2.35518, 1, 1, 1, 1, 1,
0.9882872, -0.6215125, 1.835954, 0, 0, 1, 1, 1,
0.9912522, -0.6407915, 0.3774627, 1, 0, 0, 1, 1,
0.995917, 0.6505288, 2.548829, 1, 0, 0, 1, 1,
0.9982933, 1.065601, 1.840615, 1, 0, 0, 1, 1,
1.002384, 0.1434936, 2.22288, 1, 0, 0, 1, 1,
1.004487, 2.082498, 1.362834, 1, 0, 0, 1, 1,
1.006632, -0.4169139, 0.8556326, 0, 0, 0, 1, 1,
1.006758, 0.2996165, 2.624952, 0, 0, 0, 1, 1,
1.007439, 0.579276, 0.9511578, 0, 0, 0, 1, 1,
1.012164, -0.3728123, 3.398133, 0, 0, 0, 1, 1,
1.014717, -0.8861237, 3.295054, 0, 0, 0, 1, 1,
1.015954, 1.125083, 0.5943522, 0, 0, 0, 1, 1,
1.021454, -0.01963827, 1.524754, 0, 0, 0, 1, 1,
1.030499, 0.7459236, 1.170072, 1, 1, 1, 1, 1,
1.030732, -0.1007458, -0.1842467, 1, 1, 1, 1, 1,
1.031794, 0.3385919, 1.392008, 1, 1, 1, 1, 1,
1.035155, -0.3902195, 1.792248, 1, 1, 1, 1, 1,
1.035788, 0.3791755, -0.4293556, 1, 1, 1, 1, 1,
1.036306, -0.7689613, 1.805823, 1, 1, 1, 1, 1,
1.043807, 0.6495526, 0.4653219, 1, 1, 1, 1, 1,
1.061484, -1.232083, 1.518281, 1, 1, 1, 1, 1,
1.085118, -0.439217, 2.37615, 1, 1, 1, 1, 1,
1.093911, 0.7975461, 1.200105, 1, 1, 1, 1, 1,
1.097771, -0.2693578, 2.55003, 1, 1, 1, 1, 1,
1.102133, -2.160318, 3.508174, 1, 1, 1, 1, 1,
1.110856, 0.4502587, 1.482252, 1, 1, 1, 1, 1,
1.111524, -0.8461401, 1.472882, 1, 1, 1, 1, 1,
1.113783, -0.8113911, 2.087997, 1, 1, 1, 1, 1,
1.114017, 0.6092064, -1.011216, 0, 0, 1, 1, 1,
1.11486, 0.5338229, 1.58931, 1, 0, 0, 1, 1,
1.131659, -0.9501713, 1.905211, 1, 0, 0, 1, 1,
1.132302, -0.9606963, 2.62382, 1, 0, 0, 1, 1,
1.136837, -0.04827891, 0.7503194, 1, 0, 0, 1, 1,
1.13692, 0.5328255, -1.604897, 1, 0, 0, 1, 1,
1.140708, -0.505574, 1.77495, 0, 0, 0, 1, 1,
1.147908, -0.7283611, 1.07255, 0, 0, 0, 1, 1,
1.150547, 1.905337, 0.1871137, 0, 0, 0, 1, 1,
1.159089, 0.3959782, 1.603758, 0, 0, 0, 1, 1,
1.171936, 0.2827421, -0.00808506, 0, 0, 0, 1, 1,
1.173793, -0.1054678, 2.729526, 0, 0, 0, 1, 1,
1.174459, 1.612865, -0.09024418, 0, 0, 0, 1, 1,
1.177626, 1.405895, 1.479253, 1, 1, 1, 1, 1,
1.180261, -1.112266, 1.826348, 1, 1, 1, 1, 1,
1.181113, -1.702946, 3.105651, 1, 1, 1, 1, 1,
1.183959, 1.651605, 0.2243517, 1, 1, 1, 1, 1,
1.193081, -0.06016866, 2.344255, 1, 1, 1, 1, 1,
1.195586, 1.163562, 1.400728, 1, 1, 1, 1, 1,
1.197467, 1.159859, 0.4666584, 1, 1, 1, 1, 1,
1.200537, 0.301546, 2.340223, 1, 1, 1, 1, 1,
1.203182, 2.362608, 0.8220399, 1, 1, 1, 1, 1,
1.206466, -0.7421459, 0.4009916, 1, 1, 1, 1, 1,
1.218202, 0.2962953, 1.392719, 1, 1, 1, 1, 1,
1.219354, -0.9114336, 1.995629, 1, 1, 1, 1, 1,
1.224731, -1.269389, 2.538864, 1, 1, 1, 1, 1,
1.232621, -0.3572459, 2.236684, 1, 1, 1, 1, 1,
1.256103, -0.6794105, 1.02741, 1, 1, 1, 1, 1,
1.261554, -0.1630417, 2.035779, 0, 0, 1, 1, 1,
1.273677, 0.4547015, 1.100654, 1, 0, 0, 1, 1,
1.279653, -0.00555003, 0.6273265, 1, 0, 0, 1, 1,
1.284613, 0.392113, 2.291617, 1, 0, 0, 1, 1,
1.29203, -0.3032008, -0.8243845, 1, 0, 0, 1, 1,
1.294929, -0.03566505, 2.498618, 1, 0, 0, 1, 1,
1.303483, -2.173398, 1.789238, 0, 0, 0, 1, 1,
1.319154, 1.431739, 2.019417, 0, 0, 0, 1, 1,
1.323631, 1.048216, 1.471016, 0, 0, 0, 1, 1,
1.331526, -0.3263226, 0.9928011, 0, 0, 0, 1, 1,
1.332802, -0.8712907, 2.112338, 0, 0, 0, 1, 1,
1.345349, 1.056345, 1.510805, 0, 0, 0, 1, 1,
1.347, 0.1648723, 0.9718892, 0, 0, 0, 1, 1,
1.361593, -0.6162918, 2.577739, 1, 1, 1, 1, 1,
1.36372, -0.2946858, 0.140937, 1, 1, 1, 1, 1,
1.364469, -0.6109664, 2.130677, 1, 1, 1, 1, 1,
1.398884, -0.6308627, 2.274626, 1, 1, 1, 1, 1,
1.399329, -0.05705388, 0.9618937, 1, 1, 1, 1, 1,
1.401482, 0.4102664, 1.619043, 1, 1, 1, 1, 1,
1.404758, -0.4960649, 0.3799239, 1, 1, 1, 1, 1,
1.412924, 0.1264177, 0.3876737, 1, 1, 1, 1, 1,
1.417872, 0.4932983, 1.515725, 1, 1, 1, 1, 1,
1.42513, -0.01136114, 1.477566, 1, 1, 1, 1, 1,
1.439193, -0.4312783, 1.041091, 1, 1, 1, 1, 1,
1.441235, 1.390056, 1.20707, 1, 1, 1, 1, 1,
1.449129, 0.2590064, -0.3523228, 1, 1, 1, 1, 1,
1.461992, 0.6861814, 2.253633, 1, 1, 1, 1, 1,
1.46284, 0.08875093, 1.920814, 1, 1, 1, 1, 1,
1.474688, -0.3506575, 2.729997, 0, 0, 1, 1, 1,
1.476904, 0.7146685, 0.9542761, 1, 0, 0, 1, 1,
1.479361, 0.5105196, 1.205807, 1, 0, 0, 1, 1,
1.489013, -1.003717, 0.7031128, 1, 0, 0, 1, 1,
1.499688, 1.429914, 0.5852444, 1, 0, 0, 1, 1,
1.517685, 2.000103, 0.1363002, 1, 0, 0, 1, 1,
1.526168, 1.784823, 0.7134549, 0, 0, 0, 1, 1,
1.532637, 0.2403666, 1.040582, 0, 0, 0, 1, 1,
1.550196, 1.512014, -0.2917355, 0, 0, 0, 1, 1,
1.56446, -0.1644229, 1.52838, 0, 0, 0, 1, 1,
1.577272, -0.7353826, 1.580342, 0, 0, 0, 1, 1,
1.586235, 2.591846, 0.4195873, 0, 0, 0, 1, 1,
1.6153, 1.70793, 0.334577, 0, 0, 0, 1, 1,
1.616327, 1.530886, -0.9831813, 1, 1, 1, 1, 1,
1.629579, 0.099838, 1.441349, 1, 1, 1, 1, 1,
1.644201, -0.1685204, 3.301351, 1, 1, 1, 1, 1,
1.645084, 0.6562736, 1.567917, 1, 1, 1, 1, 1,
1.645795, 0.6733066, 0.9167896, 1, 1, 1, 1, 1,
1.647448, 0.8569741, 0.5658444, 1, 1, 1, 1, 1,
1.664037, -1.198615, 1.977839, 1, 1, 1, 1, 1,
1.665588, 0.4843994, 2.608402, 1, 1, 1, 1, 1,
1.666169, -2.372242, 3.367972, 1, 1, 1, 1, 1,
1.67344, 0.4159947, 1.322023, 1, 1, 1, 1, 1,
1.706515, -0.628925, 1.544284, 1, 1, 1, 1, 1,
1.715812, 0.7525057, -1.287602, 1, 1, 1, 1, 1,
1.721776, -1.050156, 4.613842, 1, 1, 1, 1, 1,
1.725398, -0.6685601, 1.838877, 1, 1, 1, 1, 1,
1.749494, 0.004609842, 1.081463, 1, 1, 1, 1, 1,
1.755883, 1.225168, 1.548995, 0, 0, 1, 1, 1,
1.756255, 0.558847, 0.4196665, 1, 0, 0, 1, 1,
1.777543, 0.7951115, -0.5328485, 1, 0, 0, 1, 1,
1.808472, -0.1819203, 0.75733, 1, 0, 0, 1, 1,
1.816691, 0.8261513, 0.6122796, 1, 0, 0, 1, 1,
1.860373, -0.3103161, 2.564209, 1, 0, 0, 1, 1,
1.864883, 0.7463106, 1.663025, 0, 0, 0, 1, 1,
1.879727, 0.6397424, 3.25356, 0, 0, 0, 1, 1,
1.896513, 0.3477502, 2.603142, 0, 0, 0, 1, 1,
1.898512, -0.8839014, 2.36689, 0, 0, 0, 1, 1,
1.898864, 0.1549575, 0.4051763, 0, 0, 0, 1, 1,
1.907849, -2.092354, 2.891889, 0, 0, 0, 1, 1,
1.913094, -0.1679535, 1.077003, 0, 0, 0, 1, 1,
1.921471, 1.089681, 1.279255, 1, 1, 1, 1, 1,
1.938865, -1.242428, 3.728107, 1, 1, 1, 1, 1,
1.950697, -0.09568071, 0.7122493, 1, 1, 1, 1, 1,
2.002824, 1.043216, 0.8583792, 1, 1, 1, 1, 1,
2.009939, -2.063615, 1.417366, 1, 1, 1, 1, 1,
2.011231, 1.160898, 0.2538366, 1, 1, 1, 1, 1,
2.02573, -1.38357, 2.266158, 1, 1, 1, 1, 1,
2.026086, -1.621438, 2.642529, 1, 1, 1, 1, 1,
2.02841, -0.7374156, 0.4260849, 1, 1, 1, 1, 1,
2.028597, -0.9540342, 1.287124, 1, 1, 1, 1, 1,
2.059182, -0.9895122, 1.319379, 1, 1, 1, 1, 1,
2.076811, 1.61302, 1.223941, 1, 1, 1, 1, 1,
2.098082, -0.4208694, 1.178705, 1, 1, 1, 1, 1,
2.104945, -0.8228247, 2.139697, 1, 1, 1, 1, 1,
2.11467, -0.3809104, 1.896769, 1, 1, 1, 1, 1,
2.132988, -0.2985047, -0.04031586, 0, 0, 1, 1, 1,
2.142573, -0.2765642, 2.4549, 1, 0, 0, 1, 1,
2.158871, -0.00178223, 2.635854, 1, 0, 0, 1, 1,
2.234654, 0.02832624, 0.6151264, 1, 0, 0, 1, 1,
2.256729, 0.08432025, 2.334099, 1, 0, 0, 1, 1,
2.260018, -0.4003281, 1.809772, 1, 0, 0, 1, 1,
2.265014, -0.9421346, 2.744223, 0, 0, 0, 1, 1,
2.288644, -1.2058, 0.9674605, 0, 0, 0, 1, 1,
2.414708, 0.5570204, 4.654885, 0, 0, 0, 1, 1,
2.436096, -0.8212273, 1.895381, 0, 0, 0, 1, 1,
2.47769, -0.7810768, 3.525019, 0, 0, 0, 1, 1,
2.504838, -0.8079891, 3.975152, 0, 0, 0, 1, 1,
2.527923, -0.1321533, 0.1581766, 0, 0, 0, 1, 1,
2.750742, -0.2958452, 2.704315, 1, 1, 1, 1, 1,
2.813235, 0.5217258, 0.6547647, 1, 1, 1, 1, 1,
2.825735, 0.2201545, 1.349839, 1, 1, 1, 1, 1,
2.826211, -0.3277027, 2.547064, 1, 1, 1, 1, 1,
3.090422, 0.3448498, 1.798274, 1, 1, 1, 1, 1,
3.393707, -0.9535816, 1.956622, 1, 1, 1, 1, 1,
3.669293, 0.9069732, 2.070825, 1, 1, 1, 1, 1
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
var radius = 10.09094;
var distance = 35.44402;
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
mvMatrix.translate( -0.1021867, -0.08351326, -0.1624894 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.44402);
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
