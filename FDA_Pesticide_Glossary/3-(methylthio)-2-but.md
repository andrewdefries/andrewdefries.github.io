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
-3.128871, -0.7842771, -3.62069, 1, 0, 0, 1,
-2.816245, -1.227548, -2.120545, 1, 0.007843138, 0, 1,
-2.708229, 0.6513913, -3.65508, 1, 0.01176471, 0, 1,
-2.703738, -1.029248, -3.354748, 1, 0.01960784, 0, 1,
-2.636225, 0.372664, -1.451538, 1, 0.02352941, 0, 1,
-2.595923, 0.03256837, -2.281077, 1, 0.03137255, 0, 1,
-2.565668, 0.2647282, -0.1389438, 1, 0.03529412, 0, 1,
-2.562601, 1.123873, -3.011392, 1, 0.04313726, 0, 1,
-2.553073, 0.9061264, -3.19967, 1, 0.04705882, 0, 1,
-2.487907, 0.8048925, -2.257204, 1, 0.05490196, 0, 1,
-2.396785, 0.6491125, -0.9598151, 1, 0.05882353, 0, 1,
-2.348667, -0.2922688, -1.000656, 1, 0.06666667, 0, 1,
-2.287317, 0.08650284, -1.665686, 1, 0.07058824, 0, 1,
-2.280334, -0.5795339, -1.011784, 1, 0.07843138, 0, 1,
-2.214436, 0.1297528, -1.242551, 1, 0.08235294, 0, 1,
-2.15244, -0.6118156, -2.709473, 1, 0.09019608, 0, 1,
-2.114781, -0.9694631, -2.948502, 1, 0.09411765, 0, 1,
-2.113477, 0.1713988, -2.221112, 1, 0.1019608, 0, 1,
-2.065403, 0.4041262, 0.9919776, 1, 0.1098039, 0, 1,
-2.029682, -0.6042845, -0.6846042, 1, 0.1137255, 0, 1,
-2.028556, 0.1298937, 0.3877654, 1, 0.1215686, 0, 1,
-2.014502, -0.9329464, -0.9990959, 1, 0.1254902, 0, 1,
-2.000288, -0.6617294, -1.681543, 1, 0.1333333, 0, 1,
-1.956563, 1.013825, -2.998904, 1, 0.1372549, 0, 1,
-1.934062, -0.6005079, -2.59078, 1, 0.145098, 0, 1,
-1.934048, -0.6177571, -2.469569, 1, 0.1490196, 0, 1,
-1.931145, -0.2596898, -1.539563, 1, 0.1568628, 0, 1,
-1.92565, 0.1585267, -2.097945, 1, 0.1607843, 0, 1,
-1.912471, 0.4004552, -1.896412, 1, 0.1686275, 0, 1,
-1.91224, 0.5833961, -1.645395, 1, 0.172549, 0, 1,
-1.884087, 1.329903, -2.571216, 1, 0.1803922, 0, 1,
-1.874286, 1.565509, -0.3836831, 1, 0.1843137, 0, 1,
-1.870305, 0.2104628, -1.661995, 1, 0.1921569, 0, 1,
-1.857653, 1.369474, -3.351466, 1, 0.1960784, 0, 1,
-1.841183, 1.124643, -2.457309, 1, 0.2039216, 0, 1,
-1.839155, 0.4622517, -1.433189, 1, 0.2117647, 0, 1,
-1.837711, -0.1860062, -1.07401, 1, 0.2156863, 0, 1,
-1.82338, 0.4092945, -1.930423, 1, 0.2235294, 0, 1,
-1.799949, -0.09406709, -2.53441, 1, 0.227451, 0, 1,
-1.795528, 0.7760179, -1.044472, 1, 0.2352941, 0, 1,
-1.782377, -1.796201, -4.233602, 1, 0.2392157, 0, 1,
-1.761592, 0.1858493, -1.743281, 1, 0.2470588, 0, 1,
-1.745521, -1.421553, -1.810591, 1, 0.2509804, 0, 1,
-1.715119, 0.8364144, -1.475974, 1, 0.2588235, 0, 1,
-1.703916, 1.743335, 0.1727131, 1, 0.2627451, 0, 1,
-1.69989, 0.3129495, -0.8279509, 1, 0.2705882, 0, 1,
-1.693331, 0.5786693, -0.4593548, 1, 0.2745098, 0, 1,
-1.618878, 0.05839723, -2.305087, 1, 0.282353, 0, 1,
-1.613904, -0.2538469, -0.922545, 1, 0.2862745, 0, 1,
-1.607174, 0.6181513, -2.433013, 1, 0.2941177, 0, 1,
-1.60691, -1.310266, -2.312287, 1, 0.3019608, 0, 1,
-1.602565, -0.6403297, -2.367602, 1, 0.3058824, 0, 1,
-1.6006, 0.3073798, -1.158587, 1, 0.3137255, 0, 1,
-1.599562, -0.9890755, -3.576444, 1, 0.3176471, 0, 1,
-1.582995, -0.5429846, -2.326531, 1, 0.3254902, 0, 1,
-1.581752, 0.968782, 0.8715272, 1, 0.3294118, 0, 1,
-1.576694, 0.4982843, -0.7989487, 1, 0.3372549, 0, 1,
-1.574508, -0.1275943, 0.3654197, 1, 0.3411765, 0, 1,
-1.574142, 1.475034, -1.113342, 1, 0.3490196, 0, 1,
-1.566664, -0.1239496, -0.2922374, 1, 0.3529412, 0, 1,
-1.555904, -0.03356967, -2.174603, 1, 0.3607843, 0, 1,
-1.541938, -0.1934742, -2.010344, 1, 0.3647059, 0, 1,
-1.52456, -0.1097359, -0.1886723, 1, 0.372549, 0, 1,
-1.517427, -0.00046835, -3.187815, 1, 0.3764706, 0, 1,
-1.506652, 1.084267, -0.5720793, 1, 0.3843137, 0, 1,
-1.505777, 1.315039, -0.4520819, 1, 0.3882353, 0, 1,
-1.505484, 0.1310454, -1.304487, 1, 0.3960784, 0, 1,
-1.499055, 1.197376, 0.4404681, 1, 0.4039216, 0, 1,
-1.471569, 0.3404614, -2.505397, 1, 0.4078431, 0, 1,
-1.470456, 1.224437, -0.5485075, 1, 0.4156863, 0, 1,
-1.467616, -0.6853758, -1.240312, 1, 0.4196078, 0, 1,
-1.458192, 1.407227, -2.888887, 1, 0.427451, 0, 1,
-1.447872, 0.8625611, -2.982335, 1, 0.4313726, 0, 1,
-1.442316, -0.8279536, -2.643182, 1, 0.4392157, 0, 1,
-1.419226, 0.4334425, -4.135506, 1, 0.4431373, 0, 1,
-1.410782, -0.4807709, -2.628613, 1, 0.4509804, 0, 1,
-1.40964, -1.661716, -2.378898, 1, 0.454902, 0, 1,
-1.406668, 0.5791025, -1.895143, 1, 0.4627451, 0, 1,
-1.399227, 0.1792751, -2.130973, 1, 0.4666667, 0, 1,
-1.392454, -0.6931959, -2.251446, 1, 0.4745098, 0, 1,
-1.389549, 1.132549, 0.0845772, 1, 0.4784314, 0, 1,
-1.387474, -0.276704, -3.055178, 1, 0.4862745, 0, 1,
-1.386355, -2.400195, -3.234403, 1, 0.4901961, 0, 1,
-1.386188, -0.1926409, -1.823948, 1, 0.4980392, 0, 1,
-1.38398, -0.09955563, -2.020651, 1, 0.5058824, 0, 1,
-1.380792, -1.192776, -3.328701, 1, 0.509804, 0, 1,
-1.380213, -2.036184, -2.491003, 1, 0.5176471, 0, 1,
-1.378326, 0.7370551, -0.4136463, 1, 0.5215687, 0, 1,
-1.377596, -0.2694952, -0.9263658, 1, 0.5294118, 0, 1,
-1.37742, 0.3188567, -0.2110121, 1, 0.5333334, 0, 1,
-1.37298, -0.7921932, -4.371805, 1, 0.5411765, 0, 1,
-1.367705, 1.363157, -1.217642, 1, 0.5450981, 0, 1,
-1.360846, 0.4334309, -1.963146, 1, 0.5529412, 0, 1,
-1.35418, -0.5422869, -1.473139, 1, 0.5568628, 0, 1,
-1.349593, 0.5064298, -1.059616, 1, 0.5647059, 0, 1,
-1.34438, -0.6375241, -1.824836, 1, 0.5686275, 0, 1,
-1.34065, -0.7298497, -2.892509, 1, 0.5764706, 0, 1,
-1.330557, 0.3917246, -1.907135, 1, 0.5803922, 0, 1,
-1.330285, -2.684698, -2.055681, 1, 0.5882353, 0, 1,
-1.320988, -0.4749054, -2.324801, 1, 0.5921569, 0, 1,
-1.319709, 1.778303, -0.8973967, 1, 0.6, 0, 1,
-1.317583, 0.7191181, 0.1701687, 1, 0.6078432, 0, 1,
-1.313551, 0.8504218, -0.6970372, 1, 0.6117647, 0, 1,
-1.308492, -0.1303686, -1.737195, 1, 0.6196079, 0, 1,
-1.307299, 1.152852, -2.304986, 1, 0.6235294, 0, 1,
-1.30094, 0.2228067, 0.2595802, 1, 0.6313726, 0, 1,
-1.296633, 0.3805024, -0.2522607, 1, 0.6352941, 0, 1,
-1.295255, 0.3874262, -2.824481, 1, 0.6431373, 0, 1,
-1.293209, -1.17267, -3.550378, 1, 0.6470588, 0, 1,
-1.292656, -1.315186, -1.26278, 1, 0.654902, 0, 1,
-1.275114, 0.03340653, 0.001055074, 1, 0.6588235, 0, 1,
-1.265015, 1.275612, -1.067813, 1, 0.6666667, 0, 1,
-1.261703, 0.1867273, -0.7789388, 1, 0.6705883, 0, 1,
-1.261039, 0.8078026, 0.6646704, 1, 0.6784314, 0, 1,
-1.260629, 0.291842, -2.045141, 1, 0.682353, 0, 1,
-1.245135, -1.979731, -3.325028, 1, 0.6901961, 0, 1,
-1.244295, -1.442068, -2.081585, 1, 0.6941177, 0, 1,
-1.219986, -0.2796692, -1.7676, 1, 0.7019608, 0, 1,
-1.217553, -0.4545683, -3.752422, 1, 0.7098039, 0, 1,
-1.217438, -0.4889357, -2.104676, 1, 0.7137255, 0, 1,
-1.21552, -2.160321, -2.980826, 1, 0.7215686, 0, 1,
-1.205578, 0.9584926, -0.7044452, 1, 0.7254902, 0, 1,
-1.203681, 1.343327, 1.502209, 1, 0.7333333, 0, 1,
-1.190236, -0.4391744, -3.192851, 1, 0.7372549, 0, 1,
-1.172461, 1.025172, -0.6787082, 1, 0.7450981, 0, 1,
-1.16351, -0.5521698, -0.861986, 1, 0.7490196, 0, 1,
-1.151083, -0.1150406, -3.29174, 1, 0.7568628, 0, 1,
-1.149267, -0.9947925, -3.594137, 1, 0.7607843, 0, 1,
-1.149004, 0.4683877, -2.036754, 1, 0.7686275, 0, 1,
-1.148874, -0.6024078, -2.716984, 1, 0.772549, 0, 1,
-1.141714, 0.6395123, -1.990379, 1, 0.7803922, 0, 1,
-1.140539, -0.3526711, -1.182733, 1, 0.7843137, 0, 1,
-1.132427, 0.4843849, -1.37717, 1, 0.7921569, 0, 1,
-1.127766, 0.434606, -0.374189, 1, 0.7960784, 0, 1,
-1.123598, 0.0004322724, -0.34534, 1, 0.8039216, 0, 1,
-1.123502, -0.9859354, -3.922293, 1, 0.8117647, 0, 1,
-1.122701, 0.5025699, -1.386569, 1, 0.8156863, 0, 1,
-1.115319, 0.6214983, -2.367523, 1, 0.8235294, 0, 1,
-1.115163, -1.124524, -1.867948, 1, 0.827451, 0, 1,
-1.113221, 0.3097116, -3.791825, 1, 0.8352941, 0, 1,
-1.104682, -0.1618669, -2.904602, 1, 0.8392157, 0, 1,
-1.104023, 0.5040938, -0.8722408, 1, 0.8470588, 0, 1,
-1.10253, -0.1651732, -2.420989, 1, 0.8509804, 0, 1,
-1.102512, -0.5225247, -2.828444, 1, 0.8588235, 0, 1,
-1.101537, 0.2196051, -1.741243, 1, 0.8627451, 0, 1,
-1.096974, 0.4000781, -2.595915, 1, 0.8705882, 0, 1,
-1.094853, 0.5497597, -1.85073, 1, 0.8745098, 0, 1,
-1.093662, -0.06154899, -0.7556957, 1, 0.8823529, 0, 1,
-1.091327, 0.5946142, -0.02314624, 1, 0.8862745, 0, 1,
-1.083419, 0.02809652, -1.362157, 1, 0.8941177, 0, 1,
-1.079043, 0.4328093, -1.107618, 1, 0.8980392, 0, 1,
-1.064951, -0.6604299, -1.452909, 1, 0.9058824, 0, 1,
-1.063596, -1.030289, -2.200836, 1, 0.9137255, 0, 1,
-1.061765, 0.3081907, -1.218738, 1, 0.9176471, 0, 1,
-1.053979, -0.5470585, -2.698652, 1, 0.9254902, 0, 1,
-1.052581, -0.09319831, -1.435675, 1, 0.9294118, 0, 1,
-1.050502, 1.748674, -1.97487, 1, 0.9372549, 0, 1,
-1.049598, -0.2326785, -1.572864, 1, 0.9411765, 0, 1,
-1.048547, -0.5629326, -1.599384, 1, 0.9490196, 0, 1,
-1.047392, 0.1805248, -0.3015529, 1, 0.9529412, 0, 1,
-1.044313, -0.3106593, -1.075655, 1, 0.9607843, 0, 1,
-1.043815, 0.5946812, -1.751421, 1, 0.9647059, 0, 1,
-1.043118, 0.6385065, -0.8907667, 1, 0.972549, 0, 1,
-1.037965, -1.363777, -0.7899317, 1, 0.9764706, 0, 1,
-1.036348, -0.2352967, -2.343066, 1, 0.9843137, 0, 1,
-1.029816, -1.293829, -0.973102, 1, 0.9882353, 0, 1,
-1.0225, 0.4066217, -1.402188, 1, 0.9960784, 0, 1,
-1.021091, 0.9728922, -1.527424, 0.9960784, 1, 0, 1,
-1.020302, 2.28432, -1.151766, 0.9921569, 1, 0, 1,
-1.017153, 1.018671, -0.5822862, 0.9843137, 1, 0, 1,
-1.013514, -0.7669267, -2.761143, 0.9803922, 1, 0, 1,
-0.9996349, -0.7105806, -1.269034, 0.972549, 1, 0, 1,
-0.9950274, -0.3231597, -1.344072, 0.9686275, 1, 0, 1,
-0.9871974, -0.2070236, -0.9284192, 0.9607843, 1, 0, 1,
-0.9819561, -1.65686, -1.850878, 0.9568627, 1, 0, 1,
-0.9782808, -0.2767762, -2.203734, 0.9490196, 1, 0, 1,
-0.977555, 1.289415, -0.00315225, 0.945098, 1, 0, 1,
-0.973819, -1.064366, -3.016088, 0.9372549, 1, 0, 1,
-0.9727331, 0.6565151, -1.558938, 0.9333333, 1, 0, 1,
-0.9723244, -0.2708142, -2.203468, 0.9254902, 1, 0, 1,
-0.9712607, 0.4267226, -1.559922, 0.9215686, 1, 0, 1,
-0.9707233, 0.6511702, -0.4299539, 0.9137255, 1, 0, 1,
-0.9660997, 1.458258, 0.02448495, 0.9098039, 1, 0, 1,
-0.9646856, -0.8583426, -1.46734, 0.9019608, 1, 0, 1,
-0.9642549, -0.9602457, -2.484184, 0.8941177, 1, 0, 1,
-0.9638259, 0.243214, -0.3045405, 0.8901961, 1, 0, 1,
-0.9632547, 1.300919, -1.321638, 0.8823529, 1, 0, 1,
-0.9626332, -0.2656813, -1.892747, 0.8784314, 1, 0, 1,
-0.9605457, 0.4732109, -0.9203893, 0.8705882, 1, 0, 1,
-0.9572895, -0.6150193, -1.936016, 0.8666667, 1, 0, 1,
-0.9528517, 1.555742, -0.6882132, 0.8588235, 1, 0, 1,
-0.948674, 1.935022, 1.057281, 0.854902, 1, 0, 1,
-0.9478253, -0.04307913, -0.5321316, 0.8470588, 1, 0, 1,
-0.9403641, -0.1172558, -1.481589, 0.8431373, 1, 0, 1,
-0.9377412, -0.4975902, -1.892313, 0.8352941, 1, 0, 1,
-0.9353783, 0.4152837, -2.991409, 0.8313726, 1, 0, 1,
-0.9322416, -0.5597859, -0.005213866, 0.8235294, 1, 0, 1,
-0.9269531, 1.359306, 0.7235522, 0.8196079, 1, 0, 1,
-0.9220005, 0.1657979, -2.175982, 0.8117647, 1, 0, 1,
-0.913156, -0.9643602, -3.145473, 0.8078431, 1, 0, 1,
-0.9123583, 0.1554851, 0.2483538, 0.8, 1, 0, 1,
-0.9111337, 1.72974, -0.7703215, 0.7921569, 1, 0, 1,
-0.9002755, 0.09421401, -0.6651494, 0.7882353, 1, 0, 1,
-0.8975648, 1.453776, -0.2625261, 0.7803922, 1, 0, 1,
-0.8862171, -0.9803347, -2.486067, 0.7764706, 1, 0, 1,
-0.8842816, -0.2257564, -3.04047, 0.7686275, 1, 0, 1,
-0.8828596, -0.2052043, -0.8753052, 0.7647059, 1, 0, 1,
-0.8802187, 0.4083216, -1.958201, 0.7568628, 1, 0, 1,
-0.8767, 0.5655825, -1.016655, 0.7529412, 1, 0, 1,
-0.8713191, -0.02875356, -2.951236, 0.7450981, 1, 0, 1,
-0.8641109, -0.4171115, -3.796338, 0.7411765, 1, 0, 1,
-0.8567592, -1.301149, -3.426873, 0.7333333, 1, 0, 1,
-0.8560774, 0.1566713, -3.277582, 0.7294118, 1, 0, 1,
-0.8538161, -0.6440632, -2.640545, 0.7215686, 1, 0, 1,
-0.8536038, -1.343873, -4.320364, 0.7176471, 1, 0, 1,
-0.8424998, 0.03371441, -1.311866, 0.7098039, 1, 0, 1,
-0.8420026, -0.07891755, -1.267823, 0.7058824, 1, 0, 1,
-0.8383012, -0.3061668, -0.2934123, 0.6980392, 1, 0, 1,
-0.8362738, 0.01976871, -3.124353, 0.6901961, 1, 0, 1,
-0.8284873, 1.243245, 1.136791, 0.6862745, 1, 0, 1,
-0.8243982, 0.2679208, -0.7032121, 0.6784314, 1, 0, 1,
-0.8206374, -0.9229801, -3.758286, 0.6745098, 1, 0, 1,
-0.8050864, -0.7641154, -3.081847, 0.6666667, 1, 0, 1,
-0.8011526, 0.1345296, -1.576436, 0.6627451, 1, 0, 1,
-0.7989641, 2.577749, -2.063585, 0.654902, 1, 0, 1,
-0.7971218, 0.3925858, 1.227739, 0.6509804, 1, 0, 1,
-0.7945997, 2.038961, -0.5587777, 0.6431373, 1, 0, 1,
-0.7942643, 1.481317, -1.96171, 0.6392157, 1, 0, 1,
-0.7914068, 0.384451, -1.739192, 0.6313726, 1, 0, 1,
-0.7868287, -0.5339012, -1.787063, 0.627451, 1, 0, 1,
-0.7814001, 0.4735405, -0.2455983, 0.6196079, 1, 0, 1,
-0.7809671, -1.2117, -2.685741, 0.6156863, 1, 0, 1,
-0.7806407, 0.7389406, -0.8991348, 0.6078432, 1, 0, 1,
-0.7804641, -1.581754, -3.733038, 0.6039216, 1, 0, 1,
-0.7775255, 0.6314004, -1.495676, 0.5960785, 1, 0, 1,
-0.7773581, 0.3156085, -1.442524, 0.5882353, 1, 0, 1,
-0.7755822, 0.5383819, -0.1459516, 0.5843138, 1, 0, 1,
-0.7737054, 0.3262819, -1.280782, 0.5764706, 1, 0, 1,
-0.7732335, 1.049589, -0.08519988, 0.572549, 1, 0, 1,
-0.7729169, 0.8573731, 0.7602939, 0.5647059, 1, 0, 1,
-0.7619122, -0.5033755, -2.670178, 0.5607843, 1, 0, 1,
-0.7587878, 0.3771715, 0.4306191, 0.5529412, 1, 0, 1,
-0.7426611, -0.4837632, -1.363036, 0.5490196, 1, 0, 1,
-0.7393639, 0.5155367, -0.5465811, 0.5411765, 1, 0, 1,
-0.7374563, -0.8211121, -2.259736, 0.5372549, 1, 0, 1,
-0.7368652, -0.5813617, -2.014012, 0.5294118, 1, 0, 1,
-0.7366574, -0.2504022, -1.614741, 0.5254902, 1, 0, 1,
-0.7293084, 1.309661, -1.433078, 0.5176471, 1, 0, 1,
-0.72706, -0.9341218, -0.5787888, 0.5137255, 1, 0, 1,
-0.7241613, 0.8926493, 0.5946723, 0.5058824, 1, 0, 1,
-0.7190653, -0.5674149, -2.229121, 0.5019608, 1, 0, 1,
-0.7098873, 1.138847, -0.1580679, 0.4941176, 1, 0, 1,
-0.7097117, 0.7785055, -0.9077684, 0.4862745, 1, 0, 1,
-0.6991413, 1.025724, -0.7292657, 0.4823529, 1, 0, 1,
-0.6986286, -0.6819608, -3.399848, 0.4745098, 1, 0, 1,
-0.6872023, -1.117396, -3.30079, 0.4705882, 1, 0, 1,
-0.6790382, 1.373267, -0.1734896, 0.4627451, 1, 0, 1,
-0.6736476, 0.1718538, -1.420614, 0.4588235, 1, 0, 1,
-0.6716831, 0.05342964, -0.6833472, 0.4509804, 1, 0, 1,
-0.6704158, 1.120331, 0.5993926, 0.4470588, 1, 0, 1,
-0.6689829, -1.477909, -3.477359, 0.4392157, 1, 0, 1,
-0.6681983, -0.3549218, -1.188337, 0.4352941, 1, 0, 1,
-0.6655355, -0.5355776, -2.127379, 0.427451, 1, 0, 1,
-0.6653368, 0.2145152, -2.687256, 0.4235294, 1, 0, 1,
-0.6554018, 0.2017551, -0.4957456, 0.4156863, 1, 0, 1,
-0.647423, 0.1171822, -2.191759, 0.4117647, 1, 0, 1,
-0.642296, 0.7026074, -0.2722139, 0.4039216, 1, 0, 1,
-0.6419407, 0.99932, -1.020955, 0.3960784, 1, 0, 1,
-0.6374591, 0.5557445, -0.8843867, 0.3921569, 1, 0, 1,
-0.6354641, -0.05820547, 0.9505286, 0.3843137, 1, 0, 1,
-0.6351492, 0.3771712, -2.130065, 0.3803922, 1, 0, 1,
-0.6343224, 0.6648375, -0.4823779, 0.372549, 1, 0, 1,
-0.6267112, 0.68705, -0.617832, 0.3686275, 1, 0, 1,
-0.6262165, 1.726087, 0.6291158, 0.3607843, 1, 0, 1,
-0.6239578, -0.1181903, -2.379218, 0.3568628, 1, 0, 1,
-0.6227496, 0.101138, -2.124956, 0.3490196, 1, 0, 1,
-0.6220184, 0.7527033, -0.5617001, 0.345098, 1, 0, 1,
-0.6209852, 0.08872247, -0.9781907, 0.3372549, 1, 0, 1,
-0.6202469, 1.029246, -0.7301394, 0.3333333, 1, 0, 1,
-0.6190633, -0.2488445, -0.250829, 0.3254902, 1, 0, 1,
-0.6166003, -1.177168, -2.839237, 0.3215686, 1, 0, 1,
-0.6145724, 0.08955497, -1.092921, 0.3137255, 1, 0, 1,
-0.6100296, 0.5609933, -0.3718479, 0.3098039, 1, 0, 1,
-0.6082113, -0.4377161, -2.333485, 0.3019608, 1, 0, 1,
-0.5998623, -0.522677, -3.674017, 0.2941177, 1, 0, 1,
-0.5989103, 0.4202999, -1.137365, 0.2901961, 1, 0, 1,
-0.5972676, -1.316698, -2.681923, 0.282353, 1, 0, 1,
-0.5955379, -0.4190196, -2.941561, 0.2784314, 1, 0, 1,
-0.5928839, -0.2614154, -2.614923, 0.2705882, 1, 0, 1,
-0.5889071, -0.2524866, -2.670492, 0.2666667, 1, 0, 1,
-0.5886458, 0.0801426, -1.063026, 0.2588235, 1, 0, 1,
-0.5883188, 1.139815, -0.3794367, 0.254902, 1, 0, 1,
-0.5842097, -1.007684, -2.463472, 0.2470588, 1, 0, 1,
-0.5820055, -0.6782042, -2.119349, 0.2431373, 1, 0, 1,
-0.5812235, 0.8180798, -1.470297, 0.2352941, 1, 0, 1,
-0.5806472, 0.6989804, -0.8983519, 0.2313726, 1, 0, 1,
-0.5757911, -1.462513, -1.624469, 0.2235294, 1, 0, 1,
-0.5628645, 0.3101848, -0.7876288, 0.2196078, 1, 0, 1,
-0.5611039, 0.1824256, -1.343004, 0.2117647, 1, 0, 1,
-0.5607064, 1.32212, -0.1068119, 0.2078431, 1, 0, 1,
-0.5605465, -0.4781858, -2.516933, 0.2, 1, 0, 1,
-0.5582398, 0.08534182, 0.2193933, 0.1921569, 1, 0, 1,
-0.5564795, -0.1229252, -2.620596, 0.1882353, 1, 0, 1,
-0.5543993, -0.2458382, -1.685656, 0.1803922, 1, 0, 1,
-0.5526375, -0.4108196, -1.433254, 0.1764706, 1, 0, 1,
-0.5501379, 0.5897093, -3.373557, 0.1686275, 1, 0, 1,
-0.5459808, -0.01351502, -2.591673, 0.1647059, 1, 0, 1,
-0.5459292, -0.8427308, -3.728879, 0.1568628, 1, 0, 1,
-0.5359745, -1.327155, -2.48524, 0.1529412, 1, 0, 1,
-0.5355326, 1.007189, 0.3373844, 0.145098, 1, 0, 1,
-0.5348935, 0.4420773, -2.722104, 0.1411765, 1, 0, 1,
-0.5316024, -0.2567923, -2.655344, 0.1333333, 1, 0, 1,
-0.5250822, -0.9077399, -2.994288, 0.1294118, 1, 0, 1,
-0.5244017, -0.01880539, -1.968283, 0.1215686, 1, 0, 1,
-0.5226937, -1.350968, -3.356673, 0.1176471, 1, 0, 1,
-0.5184309, 0.5904318, -1.396299, 0.1098039, 1, 0, 1,
-0.5153776, 0.3717544, -1.580197, 0.1058824, 1, 0, 1,
-0.5149007, 0.4375229, 0.7493191, 0.09803922, 1, 0, 1,
-0.5114561, -0.9881964, -1.897984, 0.09019608, 1, 0, 1,
-0.5072582, 0.1025095, 0.8168053, 0.08627451, 1, 0, 1,
-0.5068151, 0.7307042, -1.132469, 0.07843138, 1, 0, 1,
-0.4993604, 0.7917571, -2.079836, 0.07450981, 1, 0, 1,
-0.4959658, -0.2103012, -2.766205, 0.06666667, 1, 0, 1,
-0.4957316, 1.805296, -1.13601, 0.0627451, 1, 0, 1,
-0.4922553, -1.0418, -4.610513, 0.05490196, 1, 0, 1,
-0.4897448, -1.831809, -2.823771, 0.05098039, 1, 0, 1,
-0.4811752, 0.3652761, -1.956352, 0.04313726, 1, 0, 1,
-0.4811607, -0.2518443, -0.211349, 0.03921569, 1, 0, 1,
-0.480088, -1.045331, -2.423089, 0.03137255, 1, 0, 1,
-0.477332, 1.489439, -2.427108, 0.02745098, 1, 0, 1,
-0.4759404, -0.223881, -1.429743, 0.01960784, 1, 0, 1,
-0.4754274, -0.4842259, -1.34547, 0.01568628, 1, 0, 1,
-0.4648286, 0.1110371, 0.2884413, 0.007843138, 1, 0, 1,
-0.4600423, 1.487173, 0.1602824, 0.003921569, 1, 0, 1,
-0.4529573, -1.140838, -2.159302, 0, 1, 0.003921569, 1,
-0.4477875, -0.1601786, -2.198893, 0, 1, 0.01176471, 1,
-0.4453415, -0.2585204, -1.443928, 0, 1, 0.01568628, 1,
-0.4453346, -0.09122004, -2.151822, 0, 1, 0.02352941, 1,
-0.4451026, 0.1055269, -0.8732355, 0, 1, 0.02745098, 1,
-0.4438984, 0.2958464, -0.2994464, 0, 1, 0.03529412, 1,
-0.4419694, -1.639978, -2.779746, 0, 1, 0.03921569, 1,
-0.437354, -0.9555606, -4.204819, 0, 1, 0.04705882, 1,
-0.4359151, -0.731902, -3.120349, 0, 1, 0.05098039, 1,
-0.4346895, 1.265161, -2.205964, 0, 1, 0.05882353, 1,
-0.4320066, 0.4170109, 0.3877879, 0, 1, 0.0627451, 1,
-0.4191296, 0.6064551, 0.3758808, 0, 1, 0.07058824, 1,
-0.4171641, -0.2838806, -3.127759, 0, 1, 0.07450981, 1,
-0.4145713, -0.3539669, -1.404022, 0, 1, 0.08235294, 1,
-0.4113774, -0.5916413, -3.459324, 0, 1, 0.08627451, 1,
-0.40993, -0.5047817, -3.669359, 0, 1, 0.09411765, 1,
-0.4064263, -0.6198049, -2.550094, 0, 1, 0.1019608, 1,
-0.4040687, 1.802211, 1.790926, 0, 1, 0.1058824, 1,
-0.401901, -0.5764599, -3.191256, 0, 1, 0.1137255, 1,
-0.398039, -0.830631, -3.924072, 0, 1, 0.1176471, 1,
-0.3901502, 0.3825783, 0.4062316, 0, 1, 0.1254902, 1,
-0.3896792, -1.430553, -3.159556, 0, 1, 0.1294118, 1,
-0.3893863, -0.3931471, -2.808577, 0, 1, 0.1372549, 1,
-0.3885462, -0.9668936, -3.081074, 0, 1, 0.1411765, 1,
-0.3830134, 0.3804811, -2.218253, 0, 1, 0.1490196, 1,
-0.3774879, -1.041323, -5.34926, 0, 1, 0.1529412, 1,
-0.3743446, -0.531937, -2.478838, 0, 1, 0.1607843, 1,
-0.3730262, -0.2471523, -1.816944, 0, 1, 0.1647059, 1,
-0.3702156, -0.05162765, -1.991822, 0, 1, 0.172549, 1,
-0.3615562, 0.7268953, -1.746539, 0, 1, 0.1764706, 1,
-0.3610612, -1.321871, -3.362113, 0, 1, 0.1843137, 1,
-0.3568221, -0.04192373, -1.062364, 0, 1, 0.1882353, 1,
-0.3542703, 0.3140061, -1.004101, 0, 1, 0.1960784, 1,
-0.3494554, 0.1048752, -1.62043, 0, 1, 0.2039216, 1,
-0.3422847, 0.2176242, -0.7025955, 0, 1, 0.2078431, 1,
-0.3356798, 0.2659463, -1.057575, 0, 1, 0.2156863, 1,
-0.3338832, -0.2994421, -1.082461, 0, 1, 0.2196078, 1,
-0.3248904, -0.2530853, -2.962727, 0, 1, 0.227451, 1,
-0.3237965, 0.009785119, -0.2915539, 0, 1, 0.2313726, 1,
-0.3233561, -0.06726847, -1.347699, 0, 1, 0.2392157, 1,
-0.3210487, 2.246603, -1.076657, 0, 1, 0.2431373, 1,
-0.3198971, 1.768305, 1.023532, 0, 1, 0.2509804, 1,
-0.3192284, 1.008998, -1.130803, 0, 1, 0.254902, 1,
-0.3135671, -2.104475, -2.693639, 0, 1, 0.2627451, 1,
-0.3121766, 0.3491821, -0.7173675, 0, 1, 0.2666667, 1,
-0.3115456, -0.1572779, -1.738658, 0, 1, 0.2745098, 1,
-0.3089091, 0.2494843, 0.118899, 0, 1, 0.2784314, 1,
-0.30738, 0.040551, -2.00342, 0, 1, 0.2862745, 1,
-0.2982915, 0.2814798, -0.528324, 0, 1, 0.2901961, 1,
-0.2923347, -0.4394922, -2.917184, 0, 1, 0.2980392, 1,
-0.2918839, 0.7607951, -1.690108, 0, 1, 0.3058824, 1,
-0.2915202, 1.817481, -1.945317, 0, 1, 0.3098039, 1,
-0.290841, 2.408145, 0.4736154, 0, 1, 0.3176471, 1,
-0.2873402, 1.542995, -1.607603, 0, 1, 0.3215686, 1,
-0.2867952, 0.7560576, -0.1079348, 0, 1, 0.3294118, 1,
-0.2852158, 0.9795293, -2.269159, 0, 1, 0.3333333, 1,
-0.2849602, -0.8170165, -3.363359, 0, 1, 0.3411765, 1,
-0.2847276, -1.319702, -3.103381, 0, 1, 0.345098, 1,
-0.2817749, 1.753406, -0.6079125, 0, 1, 0.3529412, 1,
-0.2803609, -0.9182657, -1.906556, 0, 1, 0.3568628, 1,
-0.279204, 0.1433046, -1.373361, 0, 1, 0.3647059, 1,
-0.2783054, -0.4685427, -1.8335, 0, 1, 0.3686275, 1,
-0.2722406, 0.3809547, -0.7915171, 0, 1, 0.3764706, 1,
-0.2719647, -0.5010817, -0.6854922, 0, 1, 0.3803922, 1,
-0.2656135, 1.026921, -0.7073383, 0, 1, 0.3882353, 1,
-0.2615952, -0.6264362, -2.952343, 0, 1, 0.3921569, 1,
-0.2608801, -0.1984647, -1.52069, 0, 1, 0.4, 1,
-0.256428, 1.891056, -0.4449727, 0, 1, 0.4078431, 1,
-0.2546881, -3.222647, -3.972789, 0, 1, 0.4117647, 1,
-0.2442556, 2.389526, -1.35045, 0, 1, 0.4196078, 1,
-0.2384468, -0.57506, -3.17328, 0, 1, 0.4235294, 1,
-0.2376115, 0.8524661, 1.76594, 0, 1, 0.4313726, 1,
-0.2341804, 0.3612101, -1.342244, 0, 1, 0.4352941, 1,
-0.2289815, 1.004707, -0.5499534, 0, 1, 0.4431373, 1,
-0.2205045, -0.3923984, -2.027659, 0, 1, 0.4470588, 1,
-0.2198875, 0.5350429, -0.8281971, 0, 1, 0.454902, 1,
-0.2185966, 0.7083915, -0.1873517, 0, 1, 0.4588235, 1,
-0.2181407, -0.5243436, -3.701864, 0, 1, 0.4666667, 1,
-0.2167677, 0.3933561, -2.249933, 0, 1, 0.4705882, 1,
-0.2142913, 0.1695332, -0.908219, 0, 1, 0.4784314, 1,
-0.2141475, -2.331035, -4.034364, 0, 1, 0.4823529, 1,
-0.2136274, 0.4619644, 0.04866109, 0, 1, 0.4901961, 1,
-0.2132263, -0.4505078, -2.770594, 0, 1, 0.4941176, 1,
-0.2100836, -3.477937, -5.192283, 0, 1, 0.5019608, 1,
-0.2078208, -0.4398948, -3.709419, 0, 1, 0.509804, 1,
-0.2067318, -0.6995171, -3.580948, 0, 1, 0.5137255, 1,
-0.2053894, -0.7115613, -3.597826, 0, 1, 0.5215687, 1,
-0.2044865, 1.202506, 1.013441, 0, 1, 0.5254902, 1,
-0.1996135, 0.8569363, 1.549921, 0, 1, 0.5333334, 1,
-0.1953666, -1.616431, -1.657498, 0, 1, 0.5372549, 1,
-0.1916945, 1.350251, -0.5367401, 0, 1, 0.5450981, 1,
-0.1914967, 0.8499711, 0.5224627, 0, 1, 0.5490196, 1,
-0.191307, -1.020183, -3.182838, 0, 1, 0.5568628, 1,
-0.1899572, 0.1251323, -1.063729, 0, 1, 0.5607843, 1,
-0.1899506, -0.2512919, -1.85865, 0, 1, 0.5686275, 1,
-0.1822778, -0.1160016, 0.198955, 0, 1, 0.572549, 1,
-0.1820994, -0.1846731, -4.168087, 0, 1, 0.5803922, 1,
-0.1803036, 0.1494902, 0.9481699, 0, 1, 0.5843138, 1,
-0.1778294, 0.1428735, -1.000918, 0, 1, 0.5921569, 1,
-0.1776531, 0.4800174, -0.4768192, 0, 1, 0.5960785, 1,
-0.1769419, 2.073391, 0.6029381, 0, 1, 0.6039216, 1,
-0.1720854, -1.550955, -2.093581, 0, 1, 0.6117647, 1,
-0.1668014, -0.7148153, -2.515157, 0, 1, 0.6156863, 1,
-0.1620027, 0.8845004, -0.2110907, 0, 1, 0.6235294, 1,
-0.1589603, -2.263667, -2.029261, 0, 1, 0.627451, 1,
-0.1542295, 0.6336608, -1.922354, 0, 1, 0.6352941, 1,
-0.1541032, -0.5747644, -3.482381, 0, 1, 0.6392157, 1,
-0.1538477, 0.1681932, -1.5363, 0, 1, 0.6470588, 1,
-0.1508732, -0.4569057, -3.342264, 0, 1, 0.6509804, 1,
-0.1500386, 0.358326, -2.127058, 0, 1, 0.6588235, 1,
-0.1486416, 0.4725843, 0.8589439, 0, 1, 0.6627451, 1,
-0.1481347, 0.03549869, -1.324977, 0, 1, 0.6705883, 1,
-0.1434586, -0.756855, -1.861132, 0, 1, 0.6745098, 1,
-0.1433639, 0.3428837, -0.4670959, 0, 1, 0.682353, 1,
-0.1427787, 0.07649431, 0.1577218, 0, 1, 0.6862745, 1,
-0.1402547, -0.498459, -5.178186, 0, 1, 0.6941177, 1,
-0.1379393, 2.090428, -0.706516, 0, 1, 0.7019608, 1,
-0.1377831, -1.612233, -3.854778, 0, 1, 0.7058824, 1,
-0.1355243, -0.527014, -2.276241, 0, 1, 0.7137255, 1,
-0.1352523, 2.38133, 0.3091636, 0, 1, 0.7176471, 1,
-0.134472, 0.924607, -0.04075135, 0, 1, 0.7254902, 1,
-0.1344319, -0.4707931, -3.298262, 0, 1, 0.7294118, 1,
-0.1334733, -0.6349819, -2.448262, 0, 1, 0.7372549, 1,
-0.1286359, -1.474284, -1.500303, 0, 1, 0.7411765, 1,
-0.1251167, -0.9678485, -4.247271, 0, 1, 0.7490196, 1,
-0.1205787, -0.3836302, -2.7467, 0, 1, 0.7529412, 1,
-0.1199697, 0.1530719, -0.8865547, 0, 1, 0.7607843, 1,
-0.119042, 0.08383046, -0.04842091, 0, 1, 0.7647059, 1,
-0.1187847, -0.3065639, -2.087404, 0, 1, 0.772549, 1,
-0.1097765, 0.2523359, -1.019384, 0, 1, 0.7764706, 1,
-0.1053773, -0.9236836, -1.678496, 0, 1, 0.7843137, 1,
-0.1044868, -1.318126, -3.156281, 0, 1, 0.7882353, 1,
-0.1001789, 0.1338781, -0.2702628, 0, 1, 0.7960784, 1,
-0.09873758, -1.268845, -2.20434, 0, 1, 0.8039216, 1,
-0.09657081, -0.2840617, -4.018413, 0, 1, 0.8078431, 1,
-0.0956693, 0.7350932, 0.996914, 0, 1, 0.8156863, 1,
-0.08974209, -0.6617602, -4.10967, 0, 1, 0.8196079, 1,
-0.08570431, -1.184933, -1.786323, 0, 1, 0.827451, 1,
-0.081726, -0.02653303, -2.723246, 0, 1, 0.8313726, 1,
-0.07649712, 0.6809977, -0.5570716, 0, 1, 0.8392157, 1,
-0.07547712, -0.01522022, -3.526181, 0, 1, 0.8431373, 1,
-0.07154391, 1.567654, 1.777745, 0, 1, 0.8509804, 1,
-0.0712913, -0.2979501, -2.751439, 0, 1, 0.854902, 1,
-0.0665646, -0.03337624, -3.047594, 0, 1, 0.8627451, 1,
-0.06349935, -0.1042114, -2.843535, 0, 1, 0.8666667, 1,
-0.0608516, -1.20745, -4.44246, 0, 1, 0.8745098, 1,
-0.05296444, -0.2919072, -3.246137, 0, 1, 0.8784314, 1,
-0.05278464, 0.0144134, -2.673601, 0, 1, 0.8862745, 1,
-0.05158674, 1.225324, -2.382979, 0, 1, 0.8901961, 1,
-0.04899568, -1.237844, -1.676871, 0, 1, 0.8980392, 1,
-0.04269334, -1.569985, -3.409891, 0, 1, 0.9058824, 1,
-0.04097186, -1.142607, -2.8941, 0, 1, 0.9098039, 1,
-0.04077524, -0.4990157, -3.857268, 0, 1, 0.9176471, 1,
-0.03948982, 0.7471085, -0.1540377, 0, 1, 0.9215686, 1,
-0.03732406, -0.4505853, -2.351273, 0, 1, 0.9294118, 1,
-0.03552514, -0.7932329, -1.228175, 0, 1, 0.9333333, 1,
-0.03151976, 0.5084823, -1.6407, 0, 1, 0.9411765, 1,
-0.02887235, 0.029398, -1.776754, 0, 1, 0.945098, 1,
-0.02853415, 0.9477518, -0.7331944, 0, 1, 0.9529412, 1,
-0.02422841, 1.200813, -0.1773476, 0, 1, 0.9568627, 1,
-0.02049881, -0.1216174, -3.787617, 0, 1, 0.9647059, 1,
-0.01282817, -0.8814138, -2.614252, 0, 1, 0.9686275, 1,
-0.01119596, -1.019988, -1.698815, 0, 1, 0.9764706, 1,
-0.009156547, 0.5377985, 0.8084962, 0, 1, 0.9803922, 1,
-0.006423641, 1.640625, 1.354406, 0, 1, 0.9882353, 1,
-0.003829604, -0.7503316, -1.934466, 0, 1, 0.9921569, 1,
0.004010276, -0.5814421, 2.620748, 0, 1, 1, 1,
0.005451856, 0.1543028, 0.9076277, 0, 0.9921569, 1, 1,
0.005803441, 1.419591, 0.4664779, 0, 0.9882353, 1, 1,
0.01048533, -0.8566654, 2.406303, 0, 0.9803922, 1, 1,
0.0111187, -0.6572677, 2.531193, 0, 0.9764706, 1, 1,
0.01123253, 3.5342, 1.347145, 0, 0.9686275, 1, 1,
0.01560425, -1.065996, 0.6029891, 0, 0.9647059, 1, 1,
0.02217589, 2.311133, 0.2635324, 0, 0.9568627, 1, 1,
0.023453, 1.77471, 0.8794853, 0, 0.9529412, 1, 1,
0.02673189, -0.02174318, 0.9152122, 0, 0.945098, 1, 1,
0.02923824, 1.281931, -0.8590724, 0, 0.9411765, 1, 1,
0.0323974, -1.620949, 3.472121, 0, 0.9333333, 1, 1,
0.03644266, -0.7660488, 4.072602, 0, 0.9294118, 1, 1,
0.03791989, 0.2910006, -0.63153, 0, 0.9215686, 1, 1,
0.04398808, -1.379858, 1.630892, 0, 0.9176471, 1, 1,
0.04402792, -0.5795763, 2.830268, 0, 0.9098039, 1, 1,
0.04746553, 0.9254665, 0.6020347, 0, 0.9058824, 1, 1,
0.0503637, -1.120617, 1.907925, 0, 0.8980392, 1, 1,
0.05441788, 1.188413, -1.838748, 0, 0.8901961, 1, 1,
0.0557793, 1.451584, 0.4533619, 0, 0.8862745, 1, 1,
0.05854527, 1.023901, 0.3068273, 0, 0.8784314, 1, 1,
0.06468803, 0.3789491, -1.25464, 0, 0.8745098, 1, 1,
0.06754002, 0.6890117, 0.4986832, 0, 0.8666667, 1, 1,
0.06888704, -0.8061878, 5.305921, 0, 0.8627451, 1, 1,
0.07181017, 0.5371482, -1.345574, 0, 0.854902, 1, 1,
0.07544179, -2.552657, 1.971715, 0, 0.8509804, 1, 1,
0.07714299, -1.554939, 2.902872, 0, 0.8431373, 1, 1,
0.08028635, -1.653879, 3.989717, 0, 0.8392157, 1, 1,
0.08180986, 0.9533733, -0.1790293, 0, 0.8313726, 1, 1,
0.08323231, 0.5577721, -1.467944, 0, 0.827451, 1, 1,
0.08476908, -0.9262913, 2.199317, 0, 0.8196079, 1, 1,
0.08507715, -1.293046, 3.839411, 0, 0.8156863, 1, 1,
0.08580101, -0.9997689, 5.114622, 0, 0.8078431, 1, 1,
0.08804411, -2.440646, 0.7630876, 0, 0.8039216, 1, 1,
0.08832021, 1.747543, 1.235645, 0, 0.7960784, 1, 1,
0.09233206, 0.04553898, 1.207558, 0, 0.7882353, 1, 1,
0.09743814, -1.245302, 3.154172, 0, 0.7843137, 1, 1,
0.09818071, 0.06590499, 1.651829, 0, 0.7764706, 1, 1,
0.1005981, 2.335659, -0.2654867, 0, 0.772549, 1, 1,
0.1016734, -1.342508, 3.672074, 0, 0.7647059, 1, 1,
0.1025738, -2.124122, 1.138095, 0, 0.7607843, 1, 1,
0.1031654, 1.135814, 0.06776288, 0, 0.7529412, 1, 1,
0.1094689, 0.2634529, 0.2666078, 0, 0.7490196, 1, 1,
0.1118607, -2.075753, 5.084491, 0, 0.7411765, 1, 1,
0.1156049, -0.9794329, 2.25667, 0, 0.7372549, 1, 1,
0.1167447, -0.06432931, 2.494279, 0, 0.7294118, 1, 1,
0.1219953, -1.53628, 3.513678, 0, 0.7254902, 1, 1,
0.1220254, 1.938948, -0.6546141, 0, 0.7176471, 1, 1,
0.1231434, -1.651155, 2.650384, 0, 0.7137255, 1, 1,
0.1255932, 0.427179, 1.514691, 0, 0.7058824, 1, 1,
0.1297555, -0.1556679, 1.885435, 0, 0.6980392, 1, 1,
0.1307183, -0.03936421, 0.8735359, 0, 0.6941177, 1, 1,
0.1317042, 0.01321384, 2.305948, 0, 0.6862745, 1, 1,
0.1432277, 1.575164, -0.2013274, 0, 0.682353, 1, 1,
0.1472651, -0.4723835, 3.028719, 0, 0.6745098, 1, 1,
0.1477824, 0.5751778, -0.0618818, 0, 0.6705883, 1, 1,
0.1515963, -0.1389655, 1.352208, 0, 0.6627451, 1, 1,
0.1529492, -1.443488, 3.687431, 0, 0.6588235, 1, 1,
0.1589429, 0.2394896, 2.329199, 0, 0.6509804, 1, 1,
0.1597529, 0.6817334, -1.331196, 0, 0.6470588, 1, 1,
0.1606625, -0.2245334, 3.958635, 0, 0.6392157, 1, 1,
0.1610091, -1.329813, 2.828298, 0, 0.6352941, 1, 1,
0.1621455, 0.2744553, 0.514331, 0, 0.627451, 1, 1,
0.1625769, -0.7231888, 2.286802, 0, 0.6235294, 1, 1,
0.166114, -0.1109151, 1.305417, 0, 0.6156863, 1, 1,
0.1663569, -0.3023265, 0.4731685, 0, 0.6117647, 1, 1,
0.1673409, 1.506052, 2.192721, 0, 0.6039216, 1, 1,
0.1683632, 1.516604, 1.31359, 0, 0.5960785, 1, 1,
0.1704172, -0.2296864, 1.429654, 0, 0.5921569, 1, 1,
0.1728576, -0.3135221, 3.60394, 0, 0.5843138, 1, 1,
0.1765134, 0.3454742, 0.03749396, 0, 0.5803922, 1, 1,
0.1772966, 1.696445, 0.5802057, 0, 0.572549, 1, 1,
0.1781733, 1.11252, -0.9539226, 0, 0.5686275, 1, 1,
0.1792727, 0.2369648, 0.4040807, 0, 0.5607843, 1, 1,
0.1816174, 0.7495385, 1.202052, 0, 0.5568628, 1, 1,
0.1843271, 0.05027306, 0.6324612, 0, 0.5490196, 1, 1,
0.186719, -0.463066, 1.934219, 0, 0.5450981, 1, 1,
0.1872344, 0.3541304, 0.5898979, 0, 0.5372549, 1, 1,
0.1954803, 0.7986712, -1.096089, 0, 0.5333334, 1, 1,
0.1981149, 0.20832, 1.880806, 0, 0.5254902, 1, 1,
0.2016214, -0.6748244, 3.451002, 0, 0.5215687, 1, 1,
0.206215, -1.263524, 2.386163, 0, 0.5137255, 1, 1,
0.2062787, -0.3583134, 2.708555, 0, 0.509804, 1, 1,
0.2073525, -1.972947, 3.883967, 0, 0.5019608, 1, 1,
0.2102924, 0.6872118, -0.7985135, 0, 0.4941176, 1, 1,
0.2145762, -0.2795131, 1.84464, 0, 0.4901961, 1, 1,
0.2181151, 0.2512175, 0.090396, 0, 0.4823529, 1, 1,
0.2261735, 0.4169985, 1.457916, 0, 0.4784314, 1, 1,
0.228073, -0.639172, 2.452289, 0, 0.4705882, 1, 1,
0.2343763, 0.1585823, 0.8051445, 0, 0.4666667, 1, 1,
0.2349488, 0.8028248, 1.151381, 0, 0.4588235, 1, 1,
0.2385266, -0.720831, 0.8363184, 0, 0.454902, 1, 1,
0.2399482, -1.033358, 2.06378, 0, 0.4470588, 1, 1,
0.2413788, -0.9361692, 1.015873, 0, 0.4431373, 1, 1,
0.2449652, -0.8506328, 2.922063, 0, 0.4352941, 1, 1,
0.2473799, -1.553483, 2.637318, 0, 0.4313726, 1, 1,
0.2499331, -1.22397, 2.130187, 0, 0.4235294, 1, 1,
0.2508402, 0.140828, -0.4033543, 0, 0.4196078, 1, 1,
0.2634219, 0.5899225, 1.664028, 0, 0.4117647, 1, 1,
0.2734841, -1.201837, 3.435007, 0, 0.4078431, 1, 1,
0.2762125, -0.83862, 2.309812, 0, 0.4, 1, 1,
0.2777283, 1.532658, 1.182995, 0, 0.3921569, 1, 1,
0.280404, 0.8106192, 1.698388, 0, 0.3882353, 1, 1,
0.2874414, 0.3587381, 1.102509, 0, 0.3803922, 1, 1,
0.289921, -0.6656326, 2.836733, 0, 0.3764706, 1, 1,
0.2954492, -0.1595944, 2.663237, 0, 0.3686275, 1, 1,
0.2964662, -0.969892, 3.704151, 0, 0.3647059, 1, 1,
0.2980334, -0.8023531, 1.244243, 0, 0.3568628, 1, 1,
0.299415, 1.302776, 1.084583, 0, 0.3529412, 1, 1,
0.3051519, 0.7713904, 1.986506, 0, 0.345098, 1, 1,
0.3069997, 0.6018702, 0.6518633, 0, 0.3411765, 1, 1,
0.3074458, -1.908383, 2.769232, 0, 0.3333333, 1, 1,
0.30793, -0.2094692, 2.794057, 0, 0.3294118, 1, 1,
0.310226, 1.215158, 1.106578, 0, 0.3215686, 1, 1,
0.3131437, 1.748822, -0.888151, 0, 0.3176471, 1, 1,
0.3139956, 0.2658926, 1.189763, 0, 0.3098039, 1, 1,
0.3171362, -0.8349551, 0.4062845, 0, 0.3058824, 1, 1,
0.3194172, 1.047071, 2.341007, 0, 0.2980392, 1, 1,
0.321861, -0.6778194, 2.659019, 0, 0.2901961, 1, 1,
0.3230507, 1.338381, -1.015507, 0, 0.2862745, 1, 1,
0.3240864, 0.5811406, 0.3113314, 0, 0.2784314, 1, 1,
0.3278251, 1.229775, -0.8753795, 0, 0.2745098, 1, 1,
0.3296074, 1.015906, 2.110217, 0, 0.2666667, 1, 1,
0.3320475, 0.2061931, 1.628802, 0, 0.2627451, 1, 1,
0.3327952, -0.4008677, 1.493013, 0, 0.254902, 1, 1,
0.3328027, 0.8074451, -1.467161, 0, 0.2509804, 1, 1,
0.3336285, -0.4274225, 2.409857, 0, 0.2431373, 1, 1,
0.3386063, 0.8835547, 0.007857687, 0, 0.2392157, 1, 1,
0.3406498, -0.7474293, 2.327122, 0, 0.2313726, 1, 1,
0.341007, -0.8560398, 1.0845, 0, 0.227451, 1, 1,
0.3437482, 0.1233534, 1.125106, 0, 0.2196078, 1, 1,
0.348654, 0.7651861, 1.280417, 0, 0.2156863, 1, 1,
0.3493763, 0.7669151, 1.294734, 0, 0.2078431, 1, 1,
0.3499899, -0.2722842, 2.972187, 0, 0.2039216, 1, 1,
0.3535162, 1.913659, -0.3374894, 0, 0.1960784, 1, 1,
0.3645006, 1.53643, -0.2915885, 0, 0.1882353, 1, 1,
0.365154, 0.9077914, 1.090104, 0, 0.1843137, 1, 1,
0.3654669, 1.616863, 0.8993756, 0, 0.1764706, 1, 1,
0.3669396, 0.3844353, 0.5377349, 0, 0.172549, 1, 1,
0.3684017, 0.1868322, 0.940752, 0, 0.1647059, 1, 1,
0.3706661, -1.120136, 3.966891, 0, 0.1607843, 1, 1,
0.371686, -1.020288, 0.7671582, 0, 0.1529412, 1, 1,
0.3720602, -0.8857567, 2.872809, 0, 0.1490196, 1, 1,
0.374434, -0.4883355, 2.260406, 0, 0.1411765, 1, 1,
0.3752366, 0.750406, -0.2442611, 0, 0.1372549, 1, 1,
0.3771634, 0.9033111, 1.186952, 0, 0.1294118, 1, 1,
0.3783352, -2.005339, 3.749628, 0, 0.1254902, 1, 1,
0.3872238, -1.300132, 1.978465, 0, 0.1176471, 1, 1,
0.3884668, 0.0999948, 0.4907114, 0, 0.1137255, 1, 1,
0.3902162, -0.8988196, 3.009864, 0, 0.1058824, 1, 1,
0.3951008, -0.5027813, 2.038353, 0, 0.09803922, 1, 1,
0.4009373, -0.4589705, 3.211034, 0, 0.09411765, 1, 1,
0.4067094, -0.3484893, 0.6177792, 0, 0.08627451, 1, 1,
0.4086936, -0.6386508, 3.948208, 0, 0.08235294, 1, 1,
0.4089562, -0.5741588, 3.419387, 0, 0.07450981, 1, 1,
0.4130583, 0.4754492, 1.11678, 0, 0.07058824, 1, 1,
0.4148141, 0.1492216, 0.6416711, 0, 0.0627451, 1, 1,
0.4176027, 0.08904399, 1.368099, 0, 0.05882353, 1, 1,
0.4206612, 1.771196, 0.05541831, 0, 0.05098039, 1, 1,
0.4242334, 1.628759, 0.1420715, 0, 0.04705882, 1, 1,
0.4291668, 0.1734113, 1.012974, 0, 0.03921569, 1, 1,
0.4311149, 1.035596, -2.062542, 0, 0.03529412, 1, 1,
0.4312683, -0.6095843, 3.720853, 0, 0.02745098, 1, 1,
0.432717, 1.113878, -0.1577662, 0, 0.02352941, 1, 1,
0.4355965, 0.679107, 0.3772052, 0, 0.01568628, 1, 1,
0.4450341, 0.2852725, 0.4010847, 0, 0.01176471, 1, 1,
0.4481155, -2.595417, 2.320307, 0, 0.003921569, 1, 1,
0.4488671, -0.3130089, 3.190574, 0.003921569, 0, 1, 1,
0.4502513, -0.1010146, 1.312479, 0.007843138, 0, 1, 1,
0.4503647, 0.2341686, 3.502655, 0.01568628, 0, 1, 1,
0.4514099, 1.478268, -0.4214998, 0.01960784, 0, 1, 1,
0.4522307, -1.301818, 2.814407, 0.02745098, 0, 1, 1,
0.4529081, -0.7246683, 2.681267, 0.03137255, 0, 1, 1,
0.4547904, -0.7394251, 3.910803, 0.03921569, 0, 1, 1,
0.4574265, 0.02419216, 2.252702, 0.04313726, 0, 1, 1,
0.4603171, 0.6570414, -0.326068, 0.05098039, 0, 1, 1,
0.4736911, 0.8695525, 0.3322678, 0.05490196, 0, 1, 1,
0.4737895, -1.344222, 1.183222, 0.0627451, 0, 1, 1,
0.4812021, -0.4668895, 0.5098237, 0.06666667, 0, 1, 1,
0.4860693, 0.5122797, 0.8749586, 0.07450981, 0, 1, 1,
0.4879837, -0.05180934, 1.860874, 0.07843138, 0, 1, 1,
0.4946556, 1.024717, 0.05740521, 0.08627451, 0, 1, 1,
0.4954145, -0.114346, 0.7166136, 0.09019608, 0, 1, 1,
0.503184, -2.196947, 2.438499, 0.09803922, 0, 1, 1,
0.5070565, -0.4446536, 2.985361, 0.1058824, 0, 1, 1,
0.5088862, 0.1737107, 2.399788, 0.1098039, 0, 1, 1,
0.5128689, 0.3633628, 1.020693, 0.1176471, 0, 1, 1,
0.5189065, -1.086087, 2.28321, 0.1215686, 0, 1, 1,
0.5208538, 2.744993, -1.032881, 0.1294118, 0, 1, 1,
0.528055, 0.221302, 0.7799538, 0.1333333, 0, 1, 1,
0.5288659, 0.5428685, 1.94263, 0.1411765, 0, 1, 1,
0.5291505, -1.356119, 3.561899, 0.145098, 0, 1, 1,
0.5447809, 0.8779861, 1.520933, 0.1529412, 0, 1, 1,
0.5493872, -2.550272, 2.197816, 0.1568628, 0, 1, 1,
0.5506809, -0.3879221, 3.415594, 0.1647059, 0, 1, 1,
0.5522105, 0.9776974, 0.9615651, 0.1686275, 0, 1, 1,
0.5544135, 1.902417, 0.5994113, 0.1764706, 0, 1, 1,
0.5547228, -1.069065, 4.331899, 0.1803922, 0, 1, 1,
0.555299, 1.048946, -0.6629917, 0.1882353, 0, 1, 1,
0.5602585, 0.7663995, 1.234592, 0.1921569, 0, 1, 1,
0.5606429, -0.1758185, 0.4744925, 0.2, 0, 1, 1,
0.5620389, 1.096847, 0.5605915, 0.2078431, 0, 1, 1,
0.5732601, -0.3258044, 2.789557, 0.2117647, 0, 1, 1,
0.5796872, -0.01602487, 0.6460869, 0.2196078, 0, 1, 1,
0.5813479, 0.7275563, 1.014972, 0.2235294, 0, 1, 1,
0.5824575, 0.3842068, 0.2958108, 0.2313726, 0, 1, 1,
0.5847386, 0.2654662, 0.5598727, 0.2352941, 0, 1, 1,
0.5929347, -2.042421, 4.748211, 0.2431373, 0, 1, 1,
0.59657, -0.2208371, 0.8936805, 0.2470588, 0, 1, 1,
0.5985432, -1.030582, 2.052348, 0.254902, 0, 1, 1,
0.5993971, -1.46222, 2.601493, 0.2588235, 0, 1, 1,
0.6002051, 0.2021181, 0.5745649, 0.2666667, 0, 1, 1,
0.6032659, -0.3110255, 1.638643, 0.2705882, 0, 1, 1,
0.60416, -0.744692, 1.03462, 0.2784314, 0, 1, 1,
0.6113335, -0.01200018, 1.91561, 0.282353, 0, 1, 1,
0.6114671, -0.1407996, 1.751164, 0.2901961, 0, 1, 1,
0.6117687, 1.87209, 2.316467, 0.2941177, 0, 1, 1,
0.6147543, 1.00551, -0.2598165, 0.3019608, 0, 1, 1,
0.6165745, 0.8420302, 1.70705, 0.3098039, 0, 1, 1,
0.6177649, 1.109883, 0.126816, 0.3137255, 0, 1, 1,
0.6184335, 1.19675, 1.418622, 0.3215686, 0, 1, 1,
0.6189768, 1.50717, -0.4741776, 0.3254902, 0, 1, 1,
0.6192002, -1.568123, 4.47332, 0.3333333, 0, 1, 1,
0.6219795, 0.3862935, 0.3641238, 0.3372549, 0, 1, 1,
0.6237611, 0.1319719, -0.3790173, 0.345098, 0, 1, 1,
0.6251931, -0.9621865, 1.581793, 0.3490196, 0, 1, 1,
0.6257672, -2.017539, 4.720484, 0.3568628, 0, 1, 1,
0.6280581, -1.948355, 3.250411, 0.3607843, 0, 1, 1,
0.6291514, 0.2444121, 1.289943, 0.3686275, 0, 1, 1,
0.633655, 0.4402748, 0.05541237, 0.372549, 0, 1, 1,
0.6395481, -0.3836512, 1.095815, 0.3803922, 0, 1, 1,
0.639632, -0.1900742, 0.981702, 0.3843137, 0, 1, 1,
0.642322, 0.09996601, 2.700367, 0.3921569, 0, 1, 1,
0.6441194, -0.549326, 3.336044, 0.3960784, 0, 1, 1,
0.6471294, -1.453533, 1.560173, 0.4039216, 0, 1, 1,
0.6472933, 0.04441432, 1.93598, 0.4117647, 0, 1, 1,
0.6547314, -1.257719, 3.645262, 0.4156863, 0, 1, 1,
0.6597308, 1.142988, 0.3533849, 0.4235294, 0, 1, 1,
0.6602482, 0.4378301, 2.286185, 0.427451, 0, 1, 1,
0.6653603, 0.4536625, 1.735263, 0.4352941, 0, 1, 1,
0.6654008, 1.495303, 0.5182958, 0.4392157, 0, 1, 1,
0.6716758, -0.7271696, 3.476376, 0.4470588, 0, 1, 1,
0.6718463, -0.8857476, 2.676447, 0.4509804, 0, 1, 1,
0.6718816, -0.4738047, 1.07495, 0.4588235, 0, 1, 1,
0.6723644, -0.2266076, 1.967816, 0.4627451, 0, 1, 1,
0.6786693, 1.2073, 1.629577, 0.4705882, 0, 1, 1,
0.6847394, 0.1506409, 0.7210004, 0.4745098, 0, 1, 1,
0.6894263, -1.179401, 2.637294, 0.4823529, 0, 1, 1,
0.6899759, -0.04821994, 1.73039, 0.4862745, 0, 1, 1,
0.691521, 0.1832477, 0.4282865, 0.4941176, 0, 1, 1,
0.693671, -1.450072, 3.420017, 0.5019608, 0, 1, 1,
0.7049495, 0.1697251, 2.953815, 0.5058824, 0, 1, 1,
0.7065408, 0.8603846, -0.393298, 0.5137255, 0, 1, 1,
0.7081982, 2.838425, -0.3004534, 0.5176471, 0, 1, 1,
0.7155721, -0.3594584, 1.788077, 0.5254902, 0, 1, 1,
0.7179906, 0.8100696, -1.896112, 0.5294118, 0, 1, 1,
0.7219916, -0.05717609, 2.39744, 0.5372549, 0, 1, 1,
0.7257599, -1.197638, 2.09707, 0.5411765, 0, 1, 1,
0.7260745, -0.09122892, 2.339308, 0.5490196, 0, 1, 1,
0.7340998, 0.724529, -1.308582, 0.5529412, 0, 1, 1,
0.7352951, -0.8920036, 1.624728, 0.5607843, 0, 1, 1,
0.7356427, -0.6667634, 2.720267, 0.5647059, 0, 1, 1,
0.7363851, -1.137605, 3.141441, 0.572549, 0, 1, 1,
0.7459787, -0.985916, 2.096392, 0.5764706, 0, 1, 1,
0.7463394, -0.4179285, 3.793829, 0.5843138, 0, 1, 1,
0.746662, -1.52589, 3.542741, 0.5882353, 0, 1, 1,
0.753722, -0.3624606, 3.136659, 0.5960785, 0, 1, 1,
0.7562372, -1.199306, 3.054127, 0.6039216, 0, 1, 1,
0.7565861, -0.1430159, 0.8490132, 0.6078432, 0, 1, 1,
0.7572155, 1.339945, 1.739016, 0.6156863, 0, 1, 1,
0.7577238, -0.01271611, 0.782483, 0.6196079, 0, 1, 1,
0.7619538, 1.085752, -0.378953, 0.627451, 0, 1, 1,
0.7630869, 1.185584, -0.4821784, 0.6313726, 0, 1, 1,
0.7655345, -1.480132, 2.307488, 0.6392157, 0, 1, 1,
0.7664878, 1.076244, 0.9585155, 0.6431373, 0, 1, 1,
0.769072, 0.3485416, 0.3271894, 0.6509804, 0, 1, 1,
0.7742363, 0.06673363, 1.545535, 0.654902, 0, 1, 1,
0.7758022, 0.5690361, 0.2932159, 0.6627451, 0, 1, 1,
0.7814852, 0.3676409, 1.917705, 0.6666667, 0, 1, 1,
0.7815447, 0.2418554, 1.581299, 0.6745098, 0, 1, 1,
0.7832106, -0.4456356, 0.2914687, 0.6784314, 0, 1, 1,
0.7855133, -2.227044, 2.470346, 0.6862745, 0, 1, 1,
0.789826, -0.2697259, 0.01023432, 0.6901961, 0, 1, 1,
0.7933676, -0.2725027, 2.3709, 0.6980392, 0, 1, 1,
0.7956854, 1.388686, 2.354937, 0.7058824, 0, 1, 1,
0.7960051, -0.9364457, 3.726112, 0.7098039, 0, 1, 1,
0.7975538, 0.2232329, 0.2950946, 0.7176471, 0, 1, 1,
0.7976892, 0.9513245, -0.6007656, 0.7215686, 0, 1, 1,
0.8036303, -1.176385, 1.764565, 0.7294118, 0, 1, 1,
0.8044555, 1.304869, 0.5277513, 0.7333333, 0, 1, 1,
0.8165792, 0.5510959, 0.348203, 0.7411765, 0, 1, 1,
0.8175911, 0.8436778, -0.1651305, 0.7450981, 0, 1, 1,
0.8255081, 0.3122847, 1.430316, 0.7529412, 0, 1, 1,
0.8318039, -0.2730834, 1.732126, 0.7568628, 0, 1, 1,
0.8349616, 0.498263, 0.8838065, 0.7647059, 0, 1, 1,
0.8362169, -0.1345312, 2.463326, 0.7686275, 0, 1, 1,
0.8392504, 0.8848025, 0.9012346, 0.7764706, 0, 1, 1,
0.840426, 0.7478218, 2.582099, 0.7803922, 0, 1, 1,
0.8426589, -3.477992, 3.042457, 0.7882353, 0, 1, 1,
0.8454762, 1.395334, 0.3419938, 0.7921569, 0, 1, 1,
0.8462144, -0.9511953, 0.191409, 0.8, 0, 1, 1,
0.8482376, -0.08158303, 2.240703, 0.8078431, 0, 1, 1,
0.8523198, 0.4133805, 0.7396243, 0.8117647, 0, 1, 1,
0.8602812, -1.062233, 1.021505, 0.8196079, 0, 1, 1,
0.8618686, 0.9774772, 0.3279947, 0.8235294, 0, 1, 1,
0.8682287, -0.4747455, 3.846953, 0.8313726, 0, 1, 1,
0.8764223, -0.1349199, 0.6732675, 0.8352941, 0, 1, 1,
0.8802389, 0.6277905, 1.629387, 0.8431373, 0, 1, 1,
0.8818439, 0.6101166, 0.08583829, 0.8470588, 0, 1, 1,
0.8918323, -0.8074535, 2.492451, 0.854902, 0, 1, 1,
0.8947158, -0.7616964, 3.101841, 0.8588235, 0, 1, 1,
0.8987235, -0.8944, 0.3662932, 0.8666667, 0, 1, 1,
0.9006413, 1.001396, 1.693408, 0.8705882, 0, 1, 1,
0.9096847, 0.2878713, 1.257148, 0.8784314, 0, 1, 1,
0.9138387, -0.3798679, 2.294542, 0.8823529, 0, 1, 1,
0.9164772, -1.035219, 0.8671584, 0.8901961, 0, 1, 1,
0.9221628, 1.553869, 0.2741624, 0.8941177, 0, 1, 1,
0.9324256, -0.1249593, 1.119628, 0.9019608, 0, 1, 1,
0.9360141, -0.7958714, 0.4381458, 0.9098039, 0, 1, 1,
0.9386091, 0.2355438, 1.935034, 0.9137255, 0, 1, 1,
0.9405219, -1.071174, 0.8162192, 0.9215686, 0, 1, 1,
0.9422997, -0.398522, 2.095636, 0.9254902, 0, 1, 1,
0.9424198, -0.767288, 1.115474, 0.9333333, 0, 1, 1,
0.9428736, -0.2133118, 0.0862531, 0.9372549, 0, 1, 1,
0.9442312, -0.5556367, 1.623254, 0.945098, 0, 1, 1,
0.948487, 0.5823567, 1.749897, 0.9490196, 0, 1, 1,
0.9539772, -0.8627379, 1.448138, 0.9568627, 0, 1, 1,
0.955532, 1.296448, 0.9136195, 0.9607843, 0, 1, 1,
0.9588416, -0.9593946, 1.881316, 0.9686275, 0, 1, 1,
0.9588416, 0.5549659, -0.2520288, 0.972549, 0, 1, 1,
0.9604891, -0.5934003, 2.16564, 0.9803922, 0, 1, 1,
0.9614863, 0.05886557, 0.5015728, 0.9843137, 0, 1, 1,
0.9652192, -0.5494282, 4.585385, 0.9921569, 0, 1, 1,
0.9701068, 0.3756747, 3.123033, 0.9960784, 0, 1, 1,
0.9725623, -1.394489, 0.5398499, 1, 0, 0.9960784, 1,
0.9761021, -0.4575039, 1.93218, 1, 0, 0.9882353, 1,
0.9769608, -1.069533, 2.225913, 1, 0, 0.9843137, 1,
0.9800419, -0.4407315, 1.966128, 1, 0, 0.9764706, 1,
0.9840968, 0.7921723, 1.390472, 1, 0, 0.972549, 1,
0.9926471, -0.5351294, 2.565818, 1, 0, 0.9647059, 1,
0.996817, 1.453306, -0.3640642, 1, 0, 0.9607843, 1,
0.9984761, 0.8550027, 0.2506467, 1, 0, 0.9529412, 1,
1.002639, 0.6698929, -0.003883198, 1, 0, 0.9490196, 1,
1.005234, -1.290314, 3.317439, 1, 0, 0.9411765, 1,
1.005452, 0.6819249, 0.0135153, 1, 0, 0.9372549, 1,
1.006021, 1.809857, 1.488908, 1, 0, 0.9294118, 1,
1.01317, -0.1471171, 2.050552, 1, 0, 0.9254902, 1,
1.017002, 0.6713214, 0.1875689, 1, 0, 0.9176471, 1,
1.020551, 0.9707361, -0.4759159, 1, 0, 0.9137255, 1,
1.022535, 0.01456292, 1.193159, 1, 0, 0.9058824, 1,
1.033226, 1.42165, 0.4245359, 1, 0, 0.9019608, 1,
1.03473, -0.7539957, 3.961612, 1, 0, 0.8941177, 1,
1.035639, 1.583909, 0.128427, 1, 0, 0.8862745, 1,
1.035979, -0.2242028, 0.4614533, 1, 0, 0.8823529, 1,
1.036553, 2.338211, 0.8189179, 1, 0, 0.8745098, 1,
1.041306, 1.465139, 1.110186, 1, 0, 0.8705882, 1,
1.049469, 1.172352, 1.941034, 1, 0, 0.8627451, 1,
1.056202, 0.2726197, 1.457955, 1, 0, 0.8588235, 1,
1.056605, 0.5128409, 1.749621, 1, 0, 0.8509804, 1,
1.064324, -0.07826115, 1.318995, 1, 0, 0.8470588, 1,
1.073759, 0.7528049, 1.243198, 1, 0, 0.8392157, 1,
1.076749, 1.193354, 1.019265, 1, 0, 0.8352941, 1,
1.079326, 0.3403842, 1.107913, 1, 0, 0.827451, 1,
1.087824, 0.9399949, 0.7219184, 1, 0, 0.8235294, 1,
1.091221, -0.246777, 1.003514, 1, 0, 0.8156863, 1,
1.094958, -0.6013555, 2.506133, 1, 0, 0.8117647, 1,
1.095677, -1.59281, 3.547481, 1, 0, 0.8039216, 1,
1.097224, -2.002808, 2.672275, 1, 0, 0.7960784, 1,
1.110076, -0.8497205, 3.443179, 1, 0, 0.7921569, 1,
1.111214, 0.491874, 2.145642, 1, 0, 0.7843137, 1,
1.111893, -0.009626151, 1.287925, 1, 0, 0.7803922, 1,
1.116672, -1.253316, 2.494272, 1, 0, 0.772549, 1,
1.134199, -0.6294281, 1.878946, 1, 0, 0.7686275, 1,
1.13752, 1.681691, 1.222129, 1, 0, 0.7607843, 1,
1.141497, -0.09238356, 2.259977, 1, 0, 0.7568628, 1,
1.145983, -1.770085, 1.915333, 1, 0, 0.7490196, 1,
1.15054, -0.06273955, 1.237525, 1, 0, 0.7450981, 1,
1.153006, 1.548348, -0.6221363, 1, 0, 0.7372549, 1,
1.156781, 0.2878258, 1.125453, 1, 0, 0.7333333, 1,
1.157165, 0.1920121, 0.5689904, 1, 0, 0.7254902, 1,
1.159738, -0.7260535, 1.138071, 1, 0, 0.7215686, 1,
1.169233, 0.5785391, 2.289235, 1, 0, 0.7137255, 1,
1.174109, 0.6366425, 2.315442, 1, 0, 0.7098039, 1,
1.18719, 0.622323, -0.08681532, 1, 0, 0.7019608, 1,
1.190962, 0.4887685, -0.7706291, 1, 0, 0.6941177, 1,
1.201523, 0.4440252, 2.432247, 1, 0, 0.6901961, 1,
1.205739, 0.00279375, 3.495093, 1, 0, 0.682353, 1,
1.207951, 0.1828644, 2.056894, 1, 0, 0.6784314, 1,
1.21056, 0.6925565, 0.7003434, 1, 0, 0.6705883, 1,
1.210921, 1.00074, 0.3402619, 1, 0, 0.6666667, 1,
1.215021, 0.7212681, 2.839921, 1, 0, 0.6588235, 1,
1.217582, -0.4387857, 2.326473, 1, 0, 0.654902, 1,
1.223638, 0.4751701, 0.9381254, 1, 0, 0.6470588, 1,
1.236937, -0.6271664, 1.955997, 1, 0, 0.6431373, 1,
1.242847, -0.2703225, 3.235241, 1, 0, 0.6352941, 1,
1.24609, -0.4415031, 1.627581, 1, 0, 0.6313726, 1,
1.268175, -0.1498188, 2.511182, 1, 0, 0.6235294, 1,
1.270446, -0.4284101, 2.180523, 1, 0, 0.6196079, 1,
1.271647, -0.6373681, 1.20161, 1, 0, 0.6117647, 1,
1.273031, 0.2365059, 1.373743, 1, 0, 0.6078432, 1,
1.275409, 0.4734466, 2.579773, 1, 0, 0.6, 1,
1.279605, -1.333949, 1.665729, 1, 0, 0.5921569, 1,
1.288066, 0.2922666, 0.5858405, 1, 0, 0.5882353, 1,
1.292066, -0.4848159, 0.7441741, 1, 0, 0.5803922, 1,
1.292875, -1.000341, 1.072642, 1, 0, 0.5764706, 1,
1.296184, 0.2560198, 0.2577113, 1, 0, 0.5686275, 1,
1.29766, -1.005663, 2.132428, 1, 0, 0.5647059, 1,
1.304439, 0.4462331, 0.9114061, 1, 0, 0.5568628, 1,
1.312053, 0.5250977, 1.598625, 1, 0, 0.5529412, 1,
1.312569, -1.050173, -0.08360208, 1, 0, 0.5450981, 1,
1.33015, 3.141505, -0.2478321, 1, 0, 0.5411765, 1,
1.33983, -0.1367415, 1.549861, 1, 0, 0.5333334, 1,
1.369726, 0.4561943, 1.168084, 1, 0, 0.5294118, 1,
1.373805, -0.07728664, 0.8482402, 1, 0, 0.5215687, 1,
1.380204, -0.167613, 2.784118, 1, 0, 0.5176471, 1,
1.384676, -1.14427, 3.148913, 1, 0, 0.509804, 1,
1.385997, -0.3793648, 1.188718, 1, 0, 0.5058824, 1,
1.390448, -0.2027709, 1.128505, 1, 0, 0.4980392, 1,
1.391114, 0.5226675, -0.1716613, 1, 0, 0.4901961, 1,
1.39233, -0.1532843, 1.456439, 1, 0, 0.4862745, 1,
1.401522, 0.09386177, 0.29906, 1, 0, 0.4784314, 1,
1.405251, -0.9487033, 1.691948, 1, 0, 0.4745098, 1,
1.409912, -1.194257, 0.9204338, 1, 0, 0.4666667, 1,
1.415412, 1.042774, 1.083497, 1, 0, 0.4627451, 1,
1.435451, 0.6940491, 1.657058, 1, 0, 0.454902, 1,
1.43682, 0.7209039, 1.505259, 1, 0, 0.4509804, 1,
1.437366, -0.06395777, 2.513864, 1, 0, 0.4431373, 1,
1.43769, 0.1807856, 1.663201, 1, 0, 0.4392157, 1,
1.437759, 0.5047302, 2.481254, 1, 0, 0.4313726, 1,
1.464189, 0.1333896, 1.429521, 1, 0, 0.427451, 1,
1.475535, -1.32728, 3.1326, 1, 0, 0.4196078, 1,
1.479265, 0.07312269, 3.072117, 1, 0, 0.4156863, 1,
1.488755, -0.8131115, 0.9976974, 1, 0, 0.4078431, 1,
1.489781, -1.850294, 2.706858, 1, 0, 0.4039216, 1,
1.499552, 0.4429745, 2.026213, 1, 0, 0.3960784, 1,
1.533315, 1.270676, -0.8134975, 1, 0, 0.3882353, 1,
1.533551, -1.107024, 4.150285, 1, 0, 0.3843137, 1,
1.558365, 1.919424, 0.2016081, 1, 0, 0.3764706, 1,
1.560081, 0.9386569, 3.527283, 1, 0, 0.372549, 1,
1.564983, -0.4378262, 1.466569, 1, 0, 0.3647059, 1,
1.573071, -0.8671604, 2.214377, 1, 0, 0.3607843, 1,
1.592558, 0.1984186, 0.6493517, 1, 0, 0.3529412, 1,
1.601445, 2.331309, -0.9662368, 1, 0, 0.3490196, 1,
1.606906, 0.5630412, 0.7612215, 1, 0, 0.3411765, 1,
1.616297, 0.1592922, 1.962588, 1, 0, 0.3372549, 1,
1.621814, -0.4672195, 0.3427093, 1, 0, 0.3294118, 1,
1.653475, -1.116587, 0.40214, 1, 0, 0.3254902, 1,
1.658147, 0.5644112, 1.163272, 1, 0, 0.3176471, 1,
1.672361, 0.4876122, 0.8792121, 1, 0, 0.3137255, 1,
1.691384, 0.2387587, 2.324521, 1, 0, 0.3058824, 1,
1.698886, 0.3105138, 0.2205728, 1, 0, 0.2980392, 1,
1.700144, -0.002302496, 1.426323, 1, 0, 0.2941177, 1,
1.712717, 0.693774, -0.05885457, 1, 0, 0.2862745, 1,
1.719391, 1.179471, -0.7660161, 1, 0, 0.282353, 1,
1.719937, 1.60854, -0.4768939, 1, 0, 0.2745098, 1,
1.744958, -0.2126106, 1.152433, 1, 0, 0.2705882, 1,
1.751789, -0.04178366, 1.958468, 1, 0, 0.2627451, 1,
1.756021, -0.4220526, 3.443678, 1, 0, 0.2588235, 1,
1.764395, 1.263264, 0.7149568, 1, 0, 0.2509804, 1,
1.799757, -0.5540382, 1.482234, 1, 0, 0.2470588, 1,
1.84751, -1.826706, 2.115544, 1, 0, 0.2392157, 1,
1.84781, -0.1966815, 0.9186224, 1, 0, 0.2352941, 1,
1.849008, 0.3550826, 0.5850584, 1, 0, 0.227451, 1,
1.852299, 1.305867, 1.342858, 1, 0, 0.2235294, 1,
1.875977, -0.4068851, 2.551728, 1, 0, 0.2156863, 1,
1.882577, -1.789906, 2.39751, 1, 0, 0.2117647, 1,
1.893631, -0.07908753, 0.825453, 1, 0, 0.2039216, 1,
1.895466, -1.574931, 3.388296, 1, 0, 0.1960784, 1,
1.903193, 0.1626131, 1.744369, 1, 0, 0.1921569, 1,
1.931078, -1.56702, 1.917169, 1, 0, 0.1843137, 1,
1.93982, -1.069844, 1.592207, 1, 0, 0.1803922, 1,
1.956058, -0.03902414, 2.447067, 1, 0, 0.172549, 1,
1.96426, 0.1723756, -1.32101, 1, 0, 0.1686275, 1,
1.976617, 0.6170564, 0.9311895, 1, 0, 0.1607843, 1,
1.981314, -0.02195693, 2.061203, 1, 0, 0.1568628, 1,
1.991484, -0.9765553, 1.937046, 1, 0, 0.1490196, 1,
1.998288, 0.949113, 0.9187494, 1, 0, 0.145098, 1,
2.012406, -3.231615, 1.92776, 1, 0, 0.1372549, 1,
2.021559, -1.562959, 0.3898014, 1, 0, 0.1333333, 1,
2.041581, 0.2628199, 2.911125, 1, 0, 0.1254902, 1,
2.06376, 1.52899, 1.988356, 1, 0, 0.1215686, 1,
2.142192, 0.3650984, 1.435407, 1, 0, 0.1137255, 1,
2.144297, -1.995015, 1.928712, 1, 0, 0.1098039, 1,
2.178176, -0.5744131, 1.487587, 1, 0, 0.1019608, 1,
2.188523, -1.711029, 2.620858, 1, 0, 0.09411765, 1,
2.233574, -1.078616, 2.625181, 1, 0, 0.09019608, 1,
2.269464, 0.6328222, 0.6378376, 1, 0, 0.08235294, 1,
2.288731, -0.1218952, 2.341833, 1, 0, 0.07843138, 1,
2.29887, 0.232155, 2.448312, 1, 0, 0.07058824, 1,
2.355617, -0.6729491, 0.4350605, 1, 0, 0.06666667, 1,
2.399318, 0.6334681, 1.182835, 1, 0, 0.05882353, 1,
2.467534, -0.2648285, 1.352551, 1, 0, 0.05490196, 1,
2.469783, -0.6313867, 0.8614884, 1, 0, 0.04705882, 1,
2.492373, -0.6665142, 1.937672, 1, 0, 0.04313726, 1,
2.527199, -2.123366, 1.978016, 1, 0, 0.03529412, 1,
2.635643, -0.04403114, 0.8015688, 1, 0, 0.03137255, 1,
2.84738, -0.2607685, 1.356941, 1, 0, 0.02352941, 1,
2.892108, -0.961678, 3.061404, 1, 0, 0.01960784, 1,
2.896798, 0.5091621, 2.479927, 1, 0, 0.01176471, 1,
4.03233, 0.5286422, 4.486379, 1, 0, 0.007843138, 1
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
0.4517293, -4.666558, -7.155313, 0, -0.5, 0.5, 0.5,
0.4517293, -4.666558, -7.155313, 1, -0.5, 0.5, 0.5,
0.4517293, -4.666558, -7.155313, 1, 1.5, 0.5, 0.5,
0.4517293, -4.666558, -7.155313, 0, 1.5, 0.5, 0.5
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
-4.342694, 0.02810442, -7.155313, 0, -0.5, 0.5, 0.5,
-4.342694, 0.02810442, -7.155313, 1, -0.5, 0.5, 0.5,
-4.342694, 0.02810442, -7.155313, 1, 1.5, 0.5, 0.5,
-4.342694, 0.02810442, -7.155313, 0, 1.5, 0.5, 0.5
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
-4.342694, -4.666558, -0.02166939, 0, -0.5, 0.5, 0.5,
-4.342694, -4.666558, -0.02166939, 1, -0.5, 0.5, 0.5,
-4.342694, -4.666558, -0.02166939, 1, 1.5, 0.5, 0.5,
-4.342694, -4.666558, -0.02166939, 0, 1.5, 0.5, 0.5
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
-2, -3.583174, -5.509088,
4, -3.583174, -5.509088,
-2, -3.583174, -5.509088,
-2, -3.763738, -5.783459,
0, -3.583174, -5.509088,
0, -3.763738, -5.783459,
2, -3.583174, -5.509088,
2, -3.763738, -5.783459,
4, -3.583174, -5.509088,
4, -3.763738, -5.783459
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
"2",
"4"
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
-2, -4.124866, -6.332201, 0, -0.5, 0.5, 0.5,
-2, -4.124866, -6.332201, 1, -0.5, 0.5, 0.5,
-2, -4.124866, -6.332201, 1, 1.5, 0.5, 0.5,
-2, -4.124866, -6.332201, 0, 1.5, 0.5, 0.5,
0, -4.124866, -6.332201, 0, -0.5, 0.5, 0.5,
0, -4.124866, -6.332201, 1, -0.5, 0.5, 0.5,
0, -4.124866, -6.332201, 1, 1.5, 0.5, 0.5,
0, -4.124866, -6.332201, 0, 1.5, 0.5, 0.5,
2, -4.124866, -6.332201, 0, -0.5, 0.5, 0.5,
2, -4.124866, -6.332201, 1, -0.5, 0.5, 0.5,
2, -4.124866, -6.332201, 1, 1.5, 0.5, 0.5,
2, -4.124866, -6.332201, 0, 1.5, 0.5, 0.5,
4, -4.124866, -6.332201, 0, -0.5, 0.5, 0.5,
4, -4.124866, -6.332201, 1, -0.5, 0.5, 0.5,
4, -4.124866, -6.332201, 1, 1.5, 0.5, 0.5,
4, -4.124866, -6.332201, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.236289, -2, -5.509088,
-3.236289, 2, -5.509088,
-3.236289, -2, -5.509088,
-3.42069, -2, -5.783459,
-3.236289, 0, -5.509088,
-3.42069, 0, -5.783459,
-3.236289, 2, -5.509088,
-3.42069, 2, -5.783459
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
"0",
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
-3.789492, -2, -6.332201, 0, -0.5, 0.5, 0.5,
-3.789492, -2, -6.332201, 1, -0.5, 0.5, 0.5,
-3.789492, -2, -6.332201, 1, 1.5, 0.5, 0.5,
-3.789492, -2, -6.332201, 0, 1.5, 0.5, 0.5,
-3.789492, 0, -6.332201, 0, -0.5, 0.5, 0.5,
-3.789492, 0, -6.332201, 1, -0.5, 0.5, 0.5,
-3.789492, 0, -6.332201, 1, 1.5, 0.5, 0.5,
-3.789492, 0, -6.332201, 0, 1.5, 0.5, 0.5,
-3.789492, 2, -6.332201, 0, -0.5, 0.5, 0.5,
-3.789492, 2, -6.332201, 1, -0.5, 0.5, 0.5,
-3.789492, 2, -6.332201, 1, 1.5, 0.5, 0.5,
-3.789492, 2, -6.332201, 0, 1.5, 0.5, 0.5
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
-3.236289, -3.583174, -4,
-3.236289, -3.583174, 4,
-3.236289, -3.583174, -4,
-3.42069, -3.763738, -4,
-3.236289, -3.583174, -2,
-3.42069, -3.763738, -2,
-3.236289, -3.583174, 0,
-3.42069, -3.763738, 0,
-3.236289, -3.583174, 2,
-3.42069, -3.763738, 2,
-3.236289, -3.583174, 4,
-3.42069, -3.763738, 4
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
-3.789492, -4.124866, -4, 0, -0.5, 0.5, 0.5,
-3.789492, -4.124866, -4, 1, -0.5, 0.5, 0.5,
-3.789492, -4.124866, -4, 1, 1.5, 0.5, 0.5,
-3.789492, -4.124866, -4, 0, 1.5, 0.5, 0.5,
-3.789492, -4.124866, -2, 0, -0.5, 0.5, 0.5,
-3.789492, -4.124866, -2, 1, -0.5, 0.5, 0.5,
-3.789492, -4.124866, -2, 1, 1.5, 0.5, 0.5,
-3.789492, -4.124866, -2, 0, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 0, 0, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 0, 1, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 0, 1, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 0, 0, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 2, 0, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 2, 1, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 2, 1, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 2, 0, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 4, 0, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 4, 1, -0.5, 0.5, 0.5,
-3.789492, -4.124866, 4, 1, 1.5, 0.5, 0.5,
-3.789492, -4.124866, 4, 0, 1.5, 0.5, 0.5
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
-3.236289, -3.583174, -5.509088,
-3.236289, 3.639383, -5.509088,
-3.236289, -3.583174, 5.465749,
-3.236289, 3.639383, 5.465749,
-3.236289, -3.583174, -5.509088,
-3.236289, -3.583174, 5.465749,
-3.236289, 3.639383, -5.509088,
-3.236289, 3.639383, 5.465749,
-3.236289, -3.583174, -5.509088,
4.139748, -3.583174, -5.509088,
-3.236289, -3.583174, 5.465749,
4.139748, -3.583174, 5.465749,
-3.236289, 3.639383, -5.509088,
4.139748, 3.639383, -5.509088,
-3.236289, 3.639383, 5.465749,
4.139748, 3.639383, 5.465749,
4.139748, -3.583174, -5.509088,
4.139748, 3.639383, -5.509088,
4.139748, -3.583174, 5.465749,
4.139748, 3.639383, 5.465749,
4.139748, -3.583174, -5.509088,
4.139748, -3.583174, 5.465749,
4.139748, 3.639383, -5.509088,
4.139748, 3.639383, 5.465749
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
var radius = 8.045553;
var distance = 35.79557;
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
mvMatrix.translate( -0.4517293, -0.02810442, 0.02166939 );
mvMatrix.scale( 1.179361, 1.204422, 0.7926323 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.79557);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
3-(methylthio)-2-but<-read.table("3-(methylthio)-2-but.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.128871, -0.7842771, -3.62069, 0, 0, 1, 1, 1,
-2.816245, -1.227548, -2.120545, 1, 0, 0, 1, 1,
-2.708229, 0.6513913, -3.65508, 1, 0, 0, 1, 1,
-2.703738, -1.029248, -3.354748, 1, 0, 0, 1, 1,
-2.636225, 0.372664, -1.451538, 1, 0, 0, 1, 1,
-2.595923, 0.03256837, -2.281077, 1, 0, 0, 1, 1,
-2.565668, 0.2647282, -0.1389438, 0, 0, 0, 1, 1,
-2.562601, 1.123873, -3.011392, 0, 0, 0, 1, 1,
-2.553073, 0.9061264, -3.19967, 0, 0, 0, 1, 1,
-2.487907, 0.8048925, -2.257204, 0, 0, 0, 1, 1,
-2.396785, 0.6491125, -0.9598151, 0, 0, 0, 1, 1,
-2.348667, -0.2922688, -1.000656, 0, 0, 0, 1, 1,
-2.287317, 0.08650284, -1.665686, 0, 0, 0, 1, 1,
-2.280334, -0.5795339, -1.011784, 1, 1, 1, 1, 1,
-2.214436, 0.1297528, -1.242551, 1, 1, 1, 1, 1,
-2.15244, -0.6118156, -2.709473, 1, 1, 1, 1, 1,
-2.114781, -0.9694631, -2.948502, 1, 1, 1, 1, 1,
-2.113477, 0.1713988, -2.221112, 1, 1, 1, 1, 1,
-2.065403, 0.4041262, 0.9919776, 1, 1, 1, 1, 1,
-2.029682, -0.6042845, -0.6846042, 1, 1, 1, 1, 1,
-2.028556, 0.1298937, 0.3877654, 1, 1, 1, 1, 1,
-2.014502, -0.9329464, -0.9990959, 1, 1, 1, 1, 1,
-2.000288, -0.6617294, -1.681543, 1, 1, 1, 1, 1,
-1.956563, 1.013825, -2.998904, 1, 1, 1, 1, 1,
-1.934062, -0.6005079, -2.59078, 1, 1, 1, 1, 1,
-1.934048, -0.6177571, -2.469569, 1, 1, 1, 1, 1,
-1.931145, -0.2596898, -1.539563, 1, 1, 1, 1, 1,
-1.92565, 0.1585267, -2.097945, 1, 1, 1, 1, 1,
-1.912471, 0.4004552, -1.896412, 0, 0, 1, 1, 1,
-1.91224, 0.5833961, -1.645395, 1, 0, 0, 1, 1,
-1.884087, 1.329903, -2.571216, 1, 0, 0, 1, 1,
-1.874286, 1.565509, -0.3836831, 1, 0, 0, 1, 1,
-1.870305, 0.2104628, -1.661995, 1, 0, 0, 1, 1,
-1.857653, 1.369474, -3.351466, 1, 0, 0, 1, 1,
-1.841183, 1.124643, -2.457309, 0, 0, 0, 1, 1,
-1.839155, 0.4622517, -1.433189, 0, 0, 0, 1, 1,
-1.837711, -0.1860062, -1.07401, 0, 0, 0, 1, 1,
-1.82338, 0.4092945, -1.930423, 0, 0, 0, 1, 1,
-1.799949, -0.09406709, -2.53441, 0, 0, 0, 1, 1,
-1.795528, 0.7760179, -1.044472, 0, 0, 0, 1, 1,
-1.782377, -1.796201, -4.233602, 0, 0, 0, 1, 1,
-1.761592, 0.1858493, -1.743281, 1, 1, 1, 1, 1,
-1.745521, -1.421553, -1.810591, 1, 1, 1, 1, 1,
-1.715119, 0.8364144, -1.475974, 1, 1, 1, 1, 1,
-1.703916, 1.743335, 0.1727131, 1, 1, 1, 1, 1,
-1.69989, 0.3129495, -0.8279509, 1, 1, 1, 1, 1,
-1.693331, 0.5786693, -0.4593548, 1, 1, 1, 1, 1,
-1.618878, 0.05839723, -2.305087, 1, 1, 1, 1, 1,
-1.613904, -0.2538469, -0.922545, 1, 1, 1, 1, 1,
-1.607174, 0.6181513, -2.433013, 1, 1, 1, 1, 1,
-1.60691, -1.310266, -2.312287, 1, 1, 1, 1, 1,
-1.602565, -0.6403297, -2.367602, 1, 1, 1, 1, 1,
-1.6006, 0.3073798, -1.158587, 1, 1, 1, 1, 1,
-1.599562, -0.9890755, -3.576444, 1, 1, 1, 1, 1,
-1.582995, -0.5429846, -2.326531, 1, 1, 1, 1, 1,
-1.581752, 0.968782, 0.8715272, 1, 1, 1, 1, 1,
-1.576694, 0.4982843, -0.7989487, 0, 0, 1, 1, 1,
-1.574508, -0.1275943, 0.3654197, 1, 0, 0, 1, 1,
-1.574142, 1.475034, -1.113342, 1, 0, 0, 1, 1,
-1.566664, -0.1239496, -0.2922374, 1, 0, 0, 1, 1,
-1.555904, -0.03356967, -2.174603, 1, 0, 0, 1, 1,
-1.541938, -0.1934742, -2.010344, 1, 0, 0, 1, 1,
-1.52456, -0.1097359, -0.1886723, 0, 0, 0, 1, 1,
-1.517427, -0.00046835, -3.187815, 0, 0, 0, 1, 1,
-1.506652, 1.084267, -0.5720793, 0, 0, 0, 1, 1,
-1.505777, 1.315039, -0.4520819, 0, 0, 0, 1, 1,
-1.505484, 0.1310454, -1.304487, 0, 0, 0, 1, 1,
-1.499055, 1.197376, 0.4404681, 0, 0, 0, 1, 1,
-1.471569, 0.3404614, -2.505397, 0, 0, 0, 1, 1,
-1.470456, 1.224437, -0.5485075, 1, 1, 1, 1, 1,
-1.467616, -0.6853758, -1.240312, 1, 1, 1, 1, 1,
-1.458192, 1.407227, -2.888887, 1, 1, 1, 1, 1,
-1.447872, 0.8625611, -2.982335, 1, 1, 1, 1, 1,
-1.442316, -0.8279536, -2.643182, 1, 1, 1, 1, 1,
-1.419226, 0.4334425, -4.135506, 1, 1, 1, 1, 1,
-1.410782, -0.4807709, -2.628613, 1, 1, 1, 1, 1,
-1.40964, -1.661716, -2.378898, 1, 1, 1, 1, 1,
-1.406668, 0.5791025, -1.895143, 1, 1, 1, 1, 1,
-1.399227, 0.1792751, -2.130973, 1, 1, 1, 1, 1,
-1.392454, -0.6931959, -2.251446, 1, 1, 1, 1, 1,
-1.389549, 1.132549, 0.0845772, 1, 1, 1, 1, 1,
-1.387474, -0.276704, -3.055178, 1, 1, 1, 1, 1,
-1.386355, -2.400195, -3.234403, 1, 1, 1, 1, 1,
-1.386188, -0.1926409, -1.823948, 1, 1, 1, 1, 1,
-1.38398, -0.09955563, -2.020651, 0, 0, 1, 1, 1,
-1.380792, -1.192776, -3.328701, 1, 0, 0, 1, 1,
-1.380213, -2.036184, -2.491003, 1, 0, 0, 1, 1,
-1.378326, 0.7370551, -0.4136463, 1, 0, 0, 1, 1,
-1.377596, -0.2694952, -0.9263658, 1, 0, 0, 1, 1,
-1.37742, 0.3188567, -0.2110121, 1, 0, 0, 1, 1,
-1.37298, -0.7921932, -4.371805, 0, 0, 0, 1, 1,
-1.367705, 1.363157, -1.217642, 0, 0, 0, 1, 1,
-1.360846, 0.4334309, -1.963146, 0, 0, 0, 1, 1,
-1.35418, -0.5422869, -1.473139, 0, 0, 0, 1, 1,
-1.349593, 0.5064298, -1.059616, 0, 0, 0, 1, 1,
-1.34438, -0.6375241, -1.824836, 0, 0, 0, 1, 1,
-1.34065, -0.7298497, -2.892509, 0, 0, 0, 1, 1,
-1.330557, 0.3917246, -1.907135, 1, 1, 1, 1, 1,
-1.330285, -2.684698, -2.055681, 1, 1, 1, 1, 1,
-1.320988, -0.4749054, -2.324801, 1, 1, 1, 1, 1,
-1.319709, 1.778303, -0.8973967, 1, 1, 1, 1, 1,
-1.317583, 0.7191181, 0.1701687, 1, 1, 1, 1, 1,
-1.313551, 0.8504218, -0.6970372, 1, 1, 1, 1, 1,
-1.308492, -0.1303686, -1.737195, 1, 1, 1, 1, 1,
-1.307299, 1.152852, -2.304986, 1, 1, 1, 1, 1,
-1.30094, 0.2228067, 0.2595802, 1, 1, 1, 1, 1,
-1.296633, 0.3805024, -0.2522607, 1, 1, 1, 1, 1,
-1.295255, 0.3874262, -2.824481, 1, 1, 1, 1, 1,
-1.293209, -1.17267, -3.550378, 1, 1, 1, 1, 1,
-1.292656, -1.315186, -1.26278, 1, 1, 1, 1, 1,
-1.275114, 0.03340653, 0.001055074, 1, 1, 1, 1, 1,
-1.265015, 1.275612, -1.067813, 1, 1, 1, 1, 1,
-1.261703, 0.1867273, -0.7789388, 0, 0, 1, 1, 1,
-1.261039, 0.8078026, 0.6646704, 1, 0, 0, 1, 1,
-1.260629, 0.291842, -2.045141, 1, 0, 0, 1, 1,
-1.245135, -1.979731, -3.325028, 1, 0, 0, 1, 1,
-1.244295, -1.442068, -2.081585, 1, 0, 0, 1, 1,
-1.219986, -0.2796692, -1.7676, 1, 0, 0, 1, 1,
-1.217553, -0.4545683, -3.752422, 0, 0, 0, 1, 1,
-1.217438, -0.4889357, -2.104676, 0, 0, 0, 1, 1,
-1.21552, -2.160321, -2.980826, 0, 0, 0, 1, 1,
-1.205578, 0.9584926, -0.7044452, 0, 0, 0, 1, 1,
-1.203681, 1.343327, 1.502209, 0, 0, 0, 1, 1,
-1.190236, -0.4391744, -3.192851, 0, 0, 0, 1, 1,
-1.172461, 1.025172, -0.6787082, 0, 0, 0, 1, 1,
-1.16351, -0.5521698, -0.861986, 1, 1, 1, 1, 1,
-1.151083, -0.1150406, -3.29174, 1, 1, 1, 1, 1,
-1.149267, -0.9947925, -3.594137, 1, 1, 1, 1, 1,
-1.149004, 0.4683877, -2.036754, 1, 1, 1, 1, 1,
-1.148874, -0.6024078, -2.716984, 1, 1, 1, 1, 1,
-1.141714, 0.6395123, -1.990379, 1, 1, 1, 1, 1,
-1.140539, -0.3526711, -1.182733, 1, 1, 1, 1, 1,
-1.132427, 0.4843849, -1.37717, 1, 1, 1, 1, 1,
-1.127766, 0.434606, -0.374189, 1, 1, 1, 1, 1,
-1.123598, 0.0004322724, -0.34534, 1, 1, 1, 1, 1,
-1.123502, -0.9859354, -3.922293, 1, 1, 1, 1, 1,
-1.122701, 0.5025699, -1.386569, 1, 1, 1, 1, 1,
-1.115319, 0.6214983, -2.367523, 1, 1, 1, 1, 1,
-1.115163, -1.124524, -1.867948, 1, 1, 1, 1, 1,
-1.113221, 0.3097116, -3.791825, 1, 1, 1, 1, 1,
-1.104682, -0.1618669, -2.904602, 0, 0, 1, 1, 1,
-1.104023, 0.5040938, -0.8722408, 1, 0, 0, 1, 1,
-1.10253, -0.1651732, -2.420989, 1, 0, 0, 1, 1,
-1.102512, -0.5225247, -2.828444, 1, 0, 0, 1, 1,
-1.101537, 0.2196051, -1.741243, 1, 0, 0, 1, 1,
-1.096974, 0.4000781, -2.595915, 1, 0, 0, 1, 1,
-1.094853, 0.5497597, -1.85073, 0, 0, 0, 1, 1,
-1.093662, -0.06154899, -0.7556957, 0, 0, 0, 1, 1,
-1.091327, 0.5946142, -0.02314624, 0, 0, 0, 1, 1,
-1.083419, 0.02809652, -1.362157, 0, 0, 0, 1, 1,
-1.079043, 0.4328093, -1.107618, 0, 0, 0, 1, 1,
-1.064951, -0.6604299, -1.452909, 0, 0, 0, 1, 1,
-1.063596, -1.030289, -2.200836, 0, 0, 0, 1, 1,
-1.061765, 0.3081907, -1.218738, 1, 1, 1, 1, 1,
-1.053979, -0.5470585, -2.698652, 1, 1, 1, 1, 1,
-1.052581, -0.09319831, -1.435675, 1, 1, 1, 1, 1,
-1.050502, 1.748674, -1.97487, 1, 1, 1, 1, 1,
-1.049598, -0.2326785, -1.572864, 1, 1, 1, 1, 1,
-1.048547, -0.5629326, -1.599384, 1, 1, 1, 1, 1,
-1.047392, 0.1805248, -0.3015529, 1, 1, 1, 1, 1,
-1.044313, -0.3106593, -1.075655, 1, 1, 1, 1, 1,
-1.043815, 0.5946812, -1.751421, 1, 1, 1, 1, 1,
-1.043118, 0.6385065, -0.8907667, 1, 1, 1, 1, 1,
-1.037965, -1.363777, -0.7899317, 1, 1, 1, 1, 1,
-1.036348, -0.2352967, -2.343066, 1, 1, 1, 1, 1,
-1.029816, -1.293829, -0.973102, 1, 1, 1, 1, 1,
-1.0225, 0.4066217, -1.402188, 1, 1, 1, 1, 1,
-1.021091, 0.9728922, -1.527424, 1, 1, 1, 1, 1,
-1.020302, 2.28432, -1.151766, 0, 0, 1, 1, 1,
-1.017153, 1.018671, -0.5822862, 1, 0, 0, 1, 1,
-1.013514, -0.7669267, -2.761143, 1, 0, 0, 1, 1,
-0.9996349, -0.7105806, -1.269034, 1, 0, 0, 1, 1,
-0.9950274, -0.3231597, -1.344072, 1, 0, 0, 1, 1,
-0.9871974, -0.2070236, -0.9284192, 1, 0, 0, 1, 1,
-0.9819561, -1.65686, -1.850878, 0, 0, 0, 1, 1,
-0.9782808, -0.2767762, -2.203734, 0, 0, 0, 1, 1,
-0.977555, 1.289415, -0.00315225, 0, 0, 0, 1, 1,
-0.973819, -1.064366, -3.016088, 0, 0, 0, 1, 1,
-0.9727331, 0.6565151, -1.558938, 0, 0, 0, 1, 1,
-0.9723244, -0.2708142, -2.203468, 0, 0, 0, 1, 1,
-0.9712607, 0.4267226, -1.559922, 0, 0, 0, 1, 1,
-0.9707233, 0.6511702, -0.4299539, 1, 1, 1, 1, 1,
-0.9660997, 1.458258, 0.02448495, 1, 1, 1, 1, 1,
-0.9646856, -0.8583426, -1.46734, 1, 1, 1, 1, 1,
-0.9642549, -0.9602457, -2.484184, 1, 1, 1, 1, 1,
-0.9638259, 0.243214, -0.3045405, 1, 1, 1, 1, 1,
-0.9632547, 1.300919, -1.321638, 1, 1, 1, 1, 1,
-0.9626332, -0.2656813, -1.892747, 1, 1, 1, 1, 1,
-0.9605457, 0.4732109, -0.9203893, 1, 1, 1, 1, 1,
-0.9572895, -0.6150193, -1.936016, 1, 1, 1, 1, 1,
-0.9528517, 1.555742, -0.6882132, 1, 1, 1, 1, 1,
-0.948674, 1.935022, 1.057281, 1, 1, 1, 1, 1,
-0.9478253, -0.04307913, -0.5321316, 1, 1, 1, 1, 1,
-0.9403641, -0.1172558, -1.481589, 1, 1, 1, 1, 1,
-0.9377412, -0.4975902, -1.892313, 1, 1, 1, 1, 1,
-0.9353783, 0.4152837, -2.991409, 1, 1, 1, 1, 1,
-0.9322416, -0.5597859, -0.005213866, 0, 0, 1, 1, 1,
-0.9269531, 1.359306, 0.7235522, 1, 0, 0, 1, 1,
-0.9220005, 0.1657979, -2.175982, 1, 0, 0, 1, 1,
-0.913156, -0.9643602, -3.145473, 1, 0, 0, 1, 1,
-0.9123583, 0.1554851, 0.2483538, 1, 0, 0, 1, 1,
-0.9111337, 1.72974, -0.7703215, 1, 0, 0, 1, 1,
-0.9002755, 0.09421401, -0.6651494, 0, 0, 0, 1, 1,
-0.8975648, 1.453776, -0.2625261, 0, 0, 0, 1, 1,
-0.8862171, -0.9803347, -2.486067, 0, 0, 0, 1, 1,
-0.8842816, -0.2257564, -3.04047, 0, 0, 0, 1, 1,
-0.8828596, -0.2052043, -0.8753052, 0, 0, 0, 1, 1,
-0.8802187, 0.4083216, -1.958201, 0, 0, 0, 1, 1,
-0.8767, 0.5655825, -1.016655, 0, 0, 0, 1, 1,
-0.8713191, -0.02875356, -2.951236, 1, 1, 1, 1, 1,
-0.8641109, -0.4171115, -3.796338, 1, 1, 1, 1, 1,
-0.8567592, -1.301149, -3.426873, 1, 1, 1, 1, 1,
-0.8560774, 0.1566713, -3.277582, 1, 1, 1, 1, 1,
-0.8538161, -0.6440632, -2.640545, 1, 1, 1, 1, 1,
-0.8536038, -1.343873, -4.320364, 1, 1, 1, 1, 1,
-0.8424998, 0.03371441, -1.311866, 1, 1, 1, 1, 1,
-0.8420026, -0.07891755, -1.267823, 1, 1, 1, 1, 1,
-0.8383012, -0.3061668, -0.2934123, 1, 1, 1, 1, 1,
-0.8362738, 0.01976871, -3.124353, 1, 1, 1, 1, 1,
-0.8284873, 1.243245, 1.136791, 1, 1, 1, 1, 1,
-0.8243982, 0.2679208, -0.7032121, 1, 1, 1, 1, 1,
-0.8206374, -0.9229801, -3.758286, 1, 1, 1, 1, 1,
-0.8050864, -0.7641154, -3.081847, 1, 1, 1, 1, 1,
-0.8011526, 0.1345296, -1.576436, 1, 1, 1, 1, 1,
-0.7989641, 2.577749, -2.063585, 0, 0, 1, 1, 1,
-0.7971218, 0.3925858, 1.227739, 1, 0, 0, 1, 1,
-0.7945997, 2.038961, -0.5587777, 1, 0, 0, 1, 1,
-0.7942643, 1.481317, -1.96171, 1, 0, 0, 1, 1,
-0.7914068, 0.384451, -1.739192, 1, 0, 0, 1, 1,
-0.7868287, -0.5339012, -1.787063, 1, 0, 0, 1, 1,
-0.7814001, 0.4735405, -0.2455983, 0, 0, 0, 1, 1,
-0.7809671, -1.2117, -2.685741, 0, 0, 0, 1, 1,
-0.7806407, 0.7389406, -0.8991348, 0, 0, 0, 1, 1,
-0.7804641, -1.581754, -3.733038, 0, 0, 0, 1, 1,
-0.7775255, 0.6314004, -1.495676, 0, 0, 0, 1, 1,
-0.7773581, 0.3156085, -1.442524, 0, 0, 0, 1, 1,
-0.7755822, 0.5383819, -0.1459516, 0, 0, 0, 1, 1,
-0.7737054, 0.3262819, -1.280782, 1, 1, 1, 1, 1,
-0.7732335, 1.049589, -0.08519988, 1, 1, 1, 1, 1,
-0.7729169, 0.8573731, 0.7602939, 1, 1, 1, 1, 1,
-0.7619122, -0.5033755, -2.670178, 1, 1, 1, 1, 1,
-0.7587878, 0.3771715, 0.4306191, 1, 1, 1, 1, 1,
-0.7426611, -0.4837632, -1.363036, 1, 1, 1, 1, 1,
-0.7393639, 0.5155367, -0.5465811, 1, 1, 1, 1, 1,
-0.7374563, -0.8211121, -2.259736, 1, 1, 1, 1, 1,
-0.7368652, -0.5813617, -2.014012, 1, 1, 1, 1, 1,
-0.7366574, -0.2504022, -1.614741, 1, 1, 1, 1, 1,
-0.7293084, 1.309661, -1.433078, 1, 1, 1, 1, 1,
-0.72706, -0.9341218, -0.5787888, 1, 1, 1, 1, 1,
-0.7241613, 0.8926493, 0.5946723, 1, 1, 1, 1, 1,
-0.7190653, -0.5674149, -2.229121, 1, 1, 1, 1, 1,
-0.7098873, 1.138847, -0.1580679, 1, 1, 1, 1, 1,
-0.7097117, 0.7785055, -0.9077684, 0, 0, 1, 1, 1,
-0.6991413, 1.025724, -0.7292657, 1, 0, 0, 1, 1,
-0.6986286, -0.6819608, -3.399848, 1, 0, 0, 1, 1,
-0.6872023, -1.117396, -3.30079, 1, 0, 0, 1, 1,
-0.6790382, 1.373267, -0.1734896, 1, 0, 0, 1, 1,
-0.6736476, 0.1718538, -1.420614, 1, 0, 0, 1, 1,
-0.6716831, 0.05342964, -0.6833472, 0, 0, 0, 1, 1,
-0.6704158, 1.120331, 0.5993926, 0, 0, 0, 1, 1,
-0.6689829, -1.477909, -3.477359, 0, 0, 0, 1, 1,
-0.6681983, -0.3549218, -1.188337, 0, 0, 0, 1, 1,
-0.6655355, -0.5355776, -2.127379, 0, 0, 0, 1, 1,
-0.6653368, 0.2145152, -2.687256, 0, 0, 0, 1, 1,
-0.6554018, 0.2017551, -0.4957456, 0, 0, 0, 1, 1,
-0.647423, 0.1171822, -2.191759, 1, 1, 1, 1, 1,
-0.642296, 0.7026074, -0.2722139, 1, 1, 1, 1, 1,
-0.6419407, 0.99932, -1.020955, 1, 1, 1, 1, 1,
-0.6374591, 0.5557445, -0.8843867, 1, 1, 1, 1, 1,
-0.6354641, -0.05820547, 0.9505286, 1, 1, 1, 1, 1,
-0.6351492, 0.3771712, -2.130065, 1, 1, 1, 1, 1,
-0.6343224, 0.6648375, -0.4823779, 1, 1, 1, 1, 1,
-0.6267112, 0.68705, -0.617832, 1, 1, 1, 1, 1,
-0.6262165, 1.726087, 0.6291158, 1, 1, 1, 1, 1,
-0.6239578, -0.1181903, -2.379218, 1, 1, 1, 1, 1,
-0.6227496, 0.101138, -2.124956, 1, 1, 1, 1, 1,
-0.6220184, 0.7527033, -0.5617001, 1, 1, 1, 1, 1,
-0.6209852, 0.08872247, -0.9781907, 1, 1, 1, 1, 1,
-0.6202469, 1.029246, -0.7301394, 1, 1, 1, 1, 1,
-0.6190633, -0.2488445, -0.250829, 1, 1, 1, 1, 1,
-0.6166003, -1.177168, -2.839237, 0, 0, 1, 1, 1,
-0.6145724, 0.08955497, -1.092921, 1, 0, 0, 1, 1,
-0.6100296, 0.5609933, -0.3718479, 1, 0, 0, 1, 1,
-0.6082113, -0.4377161, -2.333485, 1, 0, 0, 1, 1,
-0.5998623, -0.522677, -3.674017, 1, 0, 0, 1, 1,
-0.5989103, 0.4202999, -1.137365, 1, 0, 0, 1, 1,
-0.5972676, -1.316698, -2.681923, 0, 0, 0, 1, 1,
-0.5955379, -0.4190196, -2.941561, 0, 0, 0, 1, 1,
-0.5928839, -0.2614154, -2.614923, 0, 0, 0, 1, 1,
-0.5889071, -0.2524866, -2.670492, 0, 0, 0, 1, 1,
-0.5886458, 0.0801426, -1.063026, 0, 0, 0, 1, 1,
-0.5883188, 1.139815, -0.3794367, 0, 0, 0, 1, 1,
-0.5842097, -1.007684, -2.463472, 0, 0, 0, 1, 1,
-0.5820055, -0.6782042, -2.119349, 1, 1, 1, 1, 1,
-0.5812235, 0.8180798, -1.470297, 1, 1, 1, 1, 1,
-0.5806472, 0.6989804, -0.8983519, 1, 1, 1, 1, 1,
-0.5757911, -1.462513, -1.624469, 1, 1, 1, 1, 1,
-0.5628645, 0.3101848, -0.7876288, 1, 1, 1, 1, 1,
-0.5611039, 0.1824256, -1.343004, 1, 1, 1, 1, 1,
-0.5607064, 1.32212, -0.1068119, 1, 1, 1, 1, 1,
-0.5605465, -0.4781858, -2.516933, 1, 1, 1, 1, 1,
-0.5582398, 0.08534182, 0.2193933, 1, 1, 1, 1, 1,
-0.5564795, -0.1229252, -2.620596, 1, 1, 1, 1, 1,
-0.5543993, -0.2458382, -1.685656, 1, 1, 1, 1, 1,
-0.5526375, -0.4108196, -1.433254, 1, 1, 1, 1, 1,
-0.5501379, 0.5897093, -3.373557, 1, 1, 1, 1, 1,
-0.5459808, -0.01351502, -2.591673, 1, 1, 1, 1, 1,
-0.5459292, -0.8427308, -3.728879, 1, 1, 1, 1, 1,
-0.5359745, -1.327155, -2.48524, 0, 0, 1, 1, 1,
-0.5355326, 1.007189, 0.3373844, 1, 0, 0, 1, 1,
-0.5348935, 0.4420773, -2.722104, 1, 0, 0, 1, 1,
-0.5316024, -0.2567923, -2.655344, 1, 0, 0, 1, 1,
-0.5250822, -0.9077399, -2.994288, 1, 0, 0, 1, 1,
-0.5244017, -0.01880539, -1.968283, 1, 0, 0, 1, 1,
-0.5226937, -1.350968, -3.356673, 0, 0, 0, 1, 1,
-0.5184309, 0.5904318, -1.396299, 0, 0, 0, 1, 1,
-0.5153776, 0.3717544, -1.580197, 0, 0, 0, 1, 1,
-0.5149007, 0.4375229, 0.7493191, 0, 0, 0, 1, 1,
-0.5114561, -0.9881964, -1.897984, 0, 0, 0, 1, 1,
-0.5072582, 0.1025095, 0.8168053, 0, 0, 0, 1, 1,
-0.5068151, 0.7307042, -1.132469, 0, 0, 0, 1, 1,
-0.4993604, 0.7917571, -2.079836, 1, 1, 1, 1, 1,
-0.4959658, -0.2103012, -2.766205, 1, 1, 1, 1, 1,
-0.4957316, 1.805296, -1.13601, 1, 1, 1, 1, 1,
-0.4922553, -1.0418, -4.610513, 1, 1, 1, 1, 1,
-0.4897448, -1.831809, -2.823771, 1, 1, 1, 1, 1,
-0.4811752, 0.3652761, -1.956352, 1, 1, 1, 1, 1,
-0.4811607, -0.2518443, -0.211349, 1, 1, 1, 1, 1,
-0.480088, -1.045331, -2.423089, 1, 1, 1, 1, 1,
-0.477332, 1.489439, -2.427108, 1, 1, 1, 1, 1,
-0.4759404, -0.223881, -1.429743, 1, 1, 1, 1, 1,
-0.4754274, -0.4842259, -1.34547, 1, 1, 1, 1, 1,
-0.4648286, 0.1110371, 0.2884413, 1, 1, 1, 1, 1,
-0.4600423, 1.487173, 0.1602824, 1, 1, 1, 1, 1,
-0.4529573, -1.140838, -2.159302, 1, 1, 1, 1, 1,
-0.4477875, -0.1601786, -2.198893, 1, 1, 1, 1, 1,
-0.4453415, -0.2585204, -1.443928, 0, 0, 1, 1, 1,
-0.4453346, -0.09122004, -2.151822, 1, 0, 0, 1, 1,
-0.4451026, 0.1055269, -0.8732355, 1, 0, 0, 1, 1,
-0.4438984, 0.2958464, -0.2994464, 1, 0, 0, 1, 1,
-0.4419694, -1.639978, -2.779746, 1, 0, 0, 1, 1,
-0.437354, -0.9555606, -4.204819, 1, 0, 0, 1, 1,
-0.4359151, -0.731902, -3.120349, 0, 0, 0, 1, 1,
-0.4346895, 1.265161, -2.205964, 0, 0, 0, 1, 1,
-0.4320066, 0.4170109, 0.3877879, 0, 0, 0, 1, 1,
-0.4191296, 0.6064551, 0.3758808, 0, 0, 0, 1, 1,
-0.4171641, -0.2838806, -3.127759, 0, 0, 0, 1, 1,
-0.4145713, -0.3539669, -1.404022, 0, 0, 0, 1, 1,
-0.4113774, -0.5916413, -3.459324, 0, 0, 0, 1, 1,
-0.40993, -0.5047817, -3.669359, 1, 1, 1, 1, 1,
-0.4064263, -0.6198049, -2.550094, 1, 1, 1, 1, 1,
-0.4040687, 1.802211, 1.790926, 1, 1, 1, 1, 1,
-0.401901, -0.5764599, -3.191256, 1, 1, 1, 1, 1,
-0.398039, -0.830631, -3.924072, 1, 1, 1, 1, 1,
-0.3901502, 0.3825783, 0.4062316, 1, 1, 1, 1, 1,
-0.3896792, -1.430553, -3.159556, 1, 1, 1, 1, 1,
-0.3893863, -0.3931471, -2.808577, 1, 1, 1, 1, 1,
-0.3885462, -0.9668936, -3.081074, 1, 1, 1, 1, 1,
-0.3830134, 0.3804811, -2.218253, 1, 1, 1, 1, 1,
-0.3774879, -1.041323, -5.34926, 1, 1, 1, 1, 1,
-0.3743446, -0.531937, -2.478838, 1, 1, 1, 1, 1,
-0.3730262, -0.2471523, -1.816944, 1, 1, 1, 1, 1,
-0.3702156, -0.05162765, -1.991822, 1, 1, 1, 1, 1,
-0.3615562, 0.7268953, -1.746539, 1, 1, 1, 1, 1,
-0.3610612, -1.321871, -3.362113, 0, 0, 1, 1, 1,
-0.3568221, -0.04192373, -1.062364, 1, 0, 0, 1, 1,
-0.3542703, 0.3140061, -1.004101, 1, 0, 0, 1, 1,
-0.3494554, 0.1048752, -1.62043, 1, 0, 0, 1, 1,
-0.3422847, 0.2176242, -0.7025955, 1, 0, 0, 1, 1,
-0.3356798, 0.2659463, -1.057575, 1, 0, 0, 1, 1,
-0.3338832, -0.2994421, -1.082461, 0, 0, 0, 1, 1,
-0.3248904, -0.2530853, -2.962727, 0, 0, 0, 1, 1,
-0.3237965, 0.009785119, -0.2915539, 0, 0, 0, 1, 1,
-0.3233561, -0.06726847, -1.347699, 0, 0, 0, 1, 1,
-0.3210487, 2.246603, -1.076657, 0, 0, 0, 1, 1,
-0.3198971, 1.768305, 1.023532, 0, 0, 0, 1, 1,
-0.3192284, 1.008998, -1.130803, 0, 0, 0, 1, 1,
-0.3135671, -2.104475, -2.693639, 1, 1, 1, 1, 1,
-0.3121766, 0.3491821, -0.7173675, 1, 1, 1, 1, 1,
-0.3115456, -0.1572779, -1.738658, 1, 1, 1, 1, 1,
-0.3089091, 0.2494843, 0.118899, 1, 1, 1, 1, 1,
-0.30738, 0.040551, -2.00342, 1, 1, 1, 1, 1,
-0.2982915, 0.2814798, -0.528324, 1, 1, 1, 1, 1,
-0.2923347, -0.4394922, -2.917184, 1, 1, 1, 1, 1,
-0.2918839, 0.7607951, -1.690108, 1, 1, 1, 1, 1,
-0.2915202, 1.817481, -1.945317, 1, 1, 1, 1, 1,
-0.290841, 2.408145, 0.4736154, 1, 1, 1, 1, 1,
-0.2873402, 1.542995, -1.607603, 1, 1, 1, 1, 1,
-0.2867952, 0.7560576, -0.1079348, 1, 1, 1, 1, 1,
-0.2852158, 0.9795293, -2.269159, 1, 1, 1, 1, 1,
-0.2849602, -0.8170165, -3.363359, 1, 1, 1, 1, 1,
-0.2847276, -1.319702, -3.103381, 1, 1, 1, 1, 1,
-0.2817749, 1.753406, -0.6079125, 0, 0, 1, 1, 1,
-0.2803609, -0.9182657, -1.906556, 1, 0, 0, 1, 1,
-0.279204, 0.1433046, -1.373361, 1, 0, 0, 1, 1,
-0.2783054, -0.4685427, -1.8335, 1, 0, 0, 1, 1,
-0.2722406, 0.3809547, -0.7915171, 1, 0, 0, 1, 1,
-0.2719647, -0.5010817, -0.6854922, 1, 0, 0, 1, 1,
-0.2656135, 1.026921, -0.7073383, 0, 0, 0, 1, 1,
-0.2615952, -0.6264362, -2.952343, 0, 0, 0, 1, 1,
-0.2608801, -0.1984647, -1.52069, 0, 0, 0, 1, 1,
-0.256428, 1.891056, -0.4449727, 0, 0, 0, 1, 1,
-0.2546881, -3.222647, -3.972789, 0, 0, 0, 1, 1,
-0.2442556, 2.389526, -1.35045, 0, 0, 0, 1, 1,
-0.2384468, -0.57506, -3.17328, 0, 0, 0, 1, 1,
-0.2376115, 0.8524661, 1.76594, 1, 1, 1, 1, 1,
-0.2341804, 0.3612101, -1.342244, 1, 1, 1, 1, 1,
-0.2289815, 1.004707, -0.5499534, 1, 1, 1, 1, 1,
-0.2205045, -0.3923984, -2.027659, 1, 1, 1, 1, 1,
-0.2198875, 0.5350429, -0.8281971, 1, 1, 1, 1, 1,
-0.2185966, 0.7083915, -0.1873517, 1, 1, 1, 1, 1,
-0.2181407, -0.5243436, -3.701864, 1, 1, 1, 1, 1,
-0.2167677, 0.3933561, -2.249933, 1, 1, 1, 1, 1,
-0.2142913, 0.1695332, -0.908219, 1, 1, 1, 1, 1,
-0.2141475, -2.331035, -4.034364, 1, 1, 1, 1, 1,
-0.2136274, 0.4619644, 0.04866109, 1, 1, 1, 1, 1,
-0.2132263, -0.4505078, -2.770594, 1, 1, 1, 1, 1,
-0.2100836, -3.477937, -5.192283, 1, 1, 1, 1, 1,
-0.2078208, -0.4398948, -3.709419, 1, 1, 1, 1, 1,
-0.2067318, -0.6995171, -3.580948, 1, 1, 1, 1, 1,
-0.2053894, -0.7115613, -3.597826, 0, 0, 1, 1, 1,
-0.2044865, 1.202506, 1.013441, 1, 0, 0, 1, 1,
-0.1996135, 0.8569363, 1.549921, 1, 0, 0, 1, 1,
-0.1953666, -1.616431, -1.657498, 1, 0, 0, 1, 1,
-0.1916945, 1.350251, -0.5367401, 1, 0, 0, 1, 1,
-0.1914967, 0.8499711, 0.5224627, 1, 0, 0, 1, 1,
-0.191307, -1.020183, -3.182838, 0, 0, 0, 1, 1,
-0.1899572, 0.1251323, -1.063729, 0, 0, 0, 1, 1,
-0.1899506, -0.2512919, -1.85865, 0, 0, 0, 1, 1,
-0.1822778, -0.1160016, 0.198955, 0, 0, 0, 1, 1,
-0.1820994, -0.1846731, -4.168087, 0, 0, 0, 1, 1,
-0.1803036, 0.1494902, 0.9481699, 0, 0, 0, 1, 1,
-0.1778294, 0.1428735, -1.000918, 0, 0, 0, 1, 1,
-0.1776531, 0.4800174, -0.4768192, 1, 1, 1, 1, 1,
-0.1769419, 2.073391, 0.6029381, 1, 1, 1, 1, 1,
-0.1720854, -1.550955, -2.093581, 1, 1, 1, 1, 1,
-0.1668014, -0.7148153, -2.515157, 1, 1, 1, 1, 1,
-0.1620027, 0.8845004, -0.2110907, 1, 1, 1, 1, 1,
-0.1589603, -2.263667, -2.029261, 1, 1, 1, 1, 1,
-0.1542295, 0.6336608, -1.922354, 1, 1, 1, 1, 1,
-0.1541032, -0.5747644, -3.482381, 1, 1, 1, 1, 1,
-0.1538477, 0.1681932, -1.5363, 1, 1, 1, 1, 1,
-0.1508732, -0.4569057, -3.342264, 1, 1, 1, 1, 1,
-0.1500386, 0.358326, -2.127058, 1, 1, 1, 1, 1,
-0.1486416, 0.4725843, 0.8589439, 1, 1, 1, 1, 1,
-0.1481347, 0.03549869, -1.324977, 1, 1, 1, 1, 1,
-0.1434586, -0.756855, -1.861132, 1, 1, 1, 1, 1,
-0.1433639, 0.3428837, -0.4670959, 1, 1, 1, 1, 1,
-0.1427787, 0.07649431, 0.1577218, 0, 0, 1, 1, 1,
-0.1402547, -0.498459, -5.178186, 1, 0, 0, 1, 1,
-0.1379393, 2.090428, -0.706516, 1, 0, 0, 1, 1,
-0.1377831, -1.612233, -3.854778, 1, 0, 0, 1, 1,
-0.1355243, -0.527014, -2.276241, 1, 0, 0, 1, 1,
-0.1352523, 2.38133, 0.3091636, 1, 0, 0, 1, 1,
-0.134472, 0.924607, -0.04075135, 0, 0, 0, 1, 1,
-0.1344319, -0.4707931, -3.298262, 0, 0, 0, 1, 1,
-0.1334733, -0.6349819, -2.448262, 0, 0, 0, 1, 1,
-0.1286359, -1.474284, -1.500303, 0, 0, 0, 1, 1,
-0.1251167, -0.9678485, -4.247271, 0, 0, 0, 1, 1,
-0.1205787, -0.3836302, -2.7467, 0, 0, 0, 1, 1,
-0.1199697, 0.1530719, -0.8865547, 0, 0, 0, 1, 1,
-0.119042, 0.08383046, -0.04842091, 1, 1, 1, 1, 1,
-0.1187847, -0.3065639, -2.087404, 1, 1, 1, 1, 1,
-0.1097765, 0.2523359, -1.019384, 1, 1, 1, 1, 1,
-0.1053773, -0.9236836, -1.678496, 1, 1, 1, 1, 1,
-0.1044868, -1.318126, -3.156281, 1, 1, 1, 1, 1,
-0.1001789, 0.1338781, -0.2702628, 1, 1, 1, 1, 1,
-0.09873758, -1.268845, -2.20434, 1, 1, 1, 1, 1,
-0.09657081, -0.2840617, -4.018413, 1, 1, 1, 1, 1,
-0.0956693, 0.7350932, 0.996914, 1, 1, 1, 1, 1,
-0.08974209, -0.6617602, -4.10967, 1, 1, 1, 1, 1,
-0.08570431, -1.184933, -1.786323, 1, 1, 1, 1, 1,
-0.081726, -0.02653303, -2.723246, 1, 1, 1, 1, 1,
-0.07649712, 0.6809977, -0.5570716, 1, 1, 1, 1, 1,
-0.07547712, -0.01522022, -3.526181, 1, 1, 1, 1, 1,
-0.07154391, 1.567654, 1.777745, 1, 1, 1, 1, 1,
-0.0712913, -0.2979501, -2.751439, 0, 0, 1, 1, 1,
-0.0665646, -0.03337624, -3.047594, 1, 0, 0, 1, 1,
-0.06349935, -0.1042114, -2.843535, 1, 0, 0, 1, 1,
-0.0608516, -1.20745, -4.44246, 1, 0, 0, 1, 1,
-0.05296444, -0.2919072, -3.246137, 1, 0, 0, 1, 1,
-0.05278464, 0.0144134, -2.673601, 1, 0, 0, 1, 1,
-0.05158674, 1.225324, -2.382979, 0, 0, 0, 1, 1,
-0.04899568, -1.237844, -1.676871, 0, 0, 0, 1, 1,
-0.04269334, -1.569985, -3.409891, 0, 0, 0, 1, 1,
-0.04097186, -1.142607, -2.8941, 0, 0, 0, 1, 1,
-0.04077524, -0.4990157, -3.857268, 0, 0, 0, 1, 1,
-0.03948982, 0.7471085, -0.1540377, 0, 0, 0, 1, 1,
-0.03732406, -0.4505853, -2.351273, 0, 0, 0, 1, 1,
-0.03552514, -0.7932329, -1.228175, 1, 1, 1, 1, 1,
-0.03151976, 0.5084823, -1.6407, 1, 1, 1, 1, 1,
-0.02887235, 0.029398, -1.776754, 1, 1, 1, 1, 1,
-0.02853415, 0.9477518, -0.7331944, 1, 1, 1, 1, 1,
-0.02422841, 1.200813, -0.1773476, 1, 1, 1, 1, 1,
-0.02049881, -0.1216174, -3.787617, 1, 1, 1, 1, 1,
-0.01282817, -0.8814138, -2.614252, 1, 1, 1, 1, 1,
-0.01119596, -1.019988, -1.698815, 1, 1, 1, 1, 1,
-0.009156547, 0.5377985, 0.8084962, 1, 1, 1, 1, 1,
-0.006423641, 1.640625, 1.354406, 1, 1, 1, 1, 1,
-0.003829604, -0.7503316, -1.934466, 1, 1, 1, 1, 1,
0.004010276, -0.5814421, 2.620748, 1, 1, 1, 1, 1,
0.005451856, 0.1543028, 0.9076277, 1, 1, 1, 1, 1,
0.005803441, 1.419591, 0.4664779, 1, 1, 1, 1, 1,
0.01048533, -0.8566654, 2.406303, 1, 1, 1, 1, 1,
0.0111187, -0.6572677, 2.531193, 0, 0, 1, 1, 1,
0.01123253, 3.5342, 1.347145, 1, 0, 0, 1, 1,
0.01560425, -1.065996, 0.6029891, 1, 0, 0, 1, 1,
0.02217589, 2.311133, 0.2635324, 1, 0, 0, 1, 1,
0.023453, 1.77471, 0.8794853, 1, 0, 0, 1, 1,
0.02673189, -0.02174318, 0.9152122, 1, 0, 0, 1, 1,
0.02923824, 1.281931, -0.8590724, 0, 0, 0, 1, 1,
0.0323974, -1.620949, 3.472121, 0, 0, 0, 1, 1,
0.03644266, -0.7660488, 4.072602, 0, 0, 0, 1, 1,
0.03791989, 0.2910006, -0.63153, 0, 0, 0, 1, 1,
0.04398808, -1.379858, 1.630892, 0, 0, 0, 1, 1,
0.04402792, -0.5795763, 2.830268, 0, 0, 0, 1, 1,
0.04746553, 0.9254665, 0.6020347, 0, 0, 0, 1, 1,
0.0503637, -1.120617, 1.907925, 1, 1, 1, 1, 1,
0.05441788, 1.188413, -1.838748, 1, 1, 1, 1, 1,
0.0557793, 1.451584, 0.4533619, 1, 1, 1, 1, 1,
0.05854527, 1.023901, 0.3068273, 1, 1, 1, 1, 1,
0.06468803, 0.3789491, -1.25464, 1, 1, 1, 1, 1,
0.06754002, 0.6890117, 0.4986832, 1, 1, 1, 1, 1,
0.06888704, -0.8061878, 5.305921, 1, 1, 1, 1, 1,
0.07181017, 0.5371482, -1.345574, 1, 1, 1, 1, 1,
0.07544179, -2.552657, 1.971715, 1, 1, 1, 1, 1,
0.07714299, -1.554939, 2.902872, 1, 1, 1, 1, 1,
0.08028635, -1.653879, 3.989717, 1, 1, 1, 1, 1,
0.08180986, 0.9533733, -0.1790293, 1, 1, 1, 1, 1,
0.08323231, 0.5577721, -1.467944, 1, 1, 1, 1, 1,
0.08476908, -0.9262913, 2.199317, 1, 1, 1, 1, 1,
0.08507715, -1.293046, 3.839411, 1, 1, 1, 1, 1,
0.08580101, -0.9997689, 5.114622, 0, 0, 1, 1, 1,
0.08804411, -2.440646, 0.7630876, 1, 0, 0, 1, 1,
0.08832021, 1.747543, 1.235645, 1, 0, 0, 1, 1,
0.09233206, 0.04553898, 1.207558, 1, 0, 0, 1, 1,
0.09743814, -1.245302, 3.154172, 1, 0, 0, 1, 1,
0.09818071, 0.06590499, 1.651829, 1, 0, 0, 1, 1,
0.1005981, 2.335659, -0.2654867, 0, 0, 0, 1, 1,
0.1016734, -1.342508, 3.672074, 0, 0, 0, 1, 1,
0.1025738, -2.124122, 1.138095, 0, 0, 0, 1, 1,
0.1031654, 1.135814, 0.06776288, 0, 0, 0, 1, 1,
0.1094689, 0.2634529, 0.2666078, 0, 0, 0, 1, 1,
0.1118607, -2.075753, 5.084491, 0, 0, 0, 1, 1,
0.1156049, -0.9794329, 2.25667, 0, 0, 0, 1, 1,
0.1167447, -0.06432931, 2.494279, 1, 1, 1, 1, 1,
0.1219953, -1.53628, 3.513678, 1, 1, 1, 1, 1,
0.1220254, 1.938948, -0.6546141, 1, 1, 1, 1, 1,
0.1231434, -1.651155, 2.650384, 1, 1, 1, 1, 1,
0.1255932, 0.427179, 1.514691, 1, 1, 1, 1, 1,
0.1297555, -0.1556679, 1.885435, 1, 1, 1, 1, 1,
0.1307183, -0.03936421, 0.8735359, 1, 1, 1, 1, 1,
0.1317042, 0.01321384, 2.305948, 1, 1, 1, 1, 1,
0.1432277, 1.575164, -0.2013274, 1, 1, 1, 1, 1,
0.1472651, -0.4723835, 3.028719, 1, 1, 1, 1, 1,
0.1477824, 0.5751778, -0.0618818, 1, 1, 1, 1, 1,
0.1515963, -0.1389655, 1.352208, 1, 1, 1, 1, 1,
0.1529492, -1.443488, 3.687431, 1, 1, 1, 1, 1,
0.1589429, 0.2394896, 2.329199, 1, 1, 1, 1, 1,
0.1597529, 0.6817334, -1.331196, 1, 1, 1, 1, 1,
0.1606625, -0.2245334, 3.958635, 0, 0, 1, 1, 1,
0.1610091, -1.329813, 2.828298, 1, 0, 0, 1, 1,
0.1621455, 0.2744553, 0.514331, 1, 0, 0, 1, 1,
0.1625769, -0.7231888, 2.286802, 1, 0, 0, 1, 1,
0.166114, -0.1109151, 1.305417, 1, 0, 0, 1, 1,
0.1663569, -0.3023265, 0.4731685, 1, 0, 0, 1, 1,
0.1673409, 1.506052, 2.192721, 0, 0, 0, 1, 1,
0.1683632, 1.516604, 1.31359, 0, 0, 0, 1, 1,
0.1704172, -0.2296864, 1.429654, 0, 0, 0, 1, 1,
0.1728576, -0.3135221, 3.60394, 0, 0, 0, 1, 1,
0.1765134, 0.3454742, 0.03749396, 0, 0, 0, 1, 1,
0.1772966, 1.696445, 0.5802057, 0, 0, 0, 1, 1,
0.1781733, 1.11252, -0.9539226, 0, 0, 0, 1, 1,
0.1792727, 0.2369648, 0.4040807, 1, 1, 1, 1, 1,
0.1816174, 0.7495385, 1.202052, 1, 1, 1, 1, 1,
0.1843271, 0.05027306, 0.6324612, 1, 1, 1, 1, 1,
0.186719, -0.463066, 1.934219, 1, 1, 1, 1, 1,
0.1872344, 0.3541304, 0.5898979, 1, 1, 1, 1, 1,
0.1954803, 0.7986712, -1.096089, 1, 1, 1, 1, 1,
0.1981149, 0.20832, 1.880806, 1, 1, 1, 1, 1,
0.2016214, -0.6748244, 3.451002, 1, 1, 1, 1, 1,
0.206215, -1.263524, 2.386163, 1, 1, 1, 1, 1,
0.2062787, -0.3583134, 2.708555, 1, 1, 1, 1, 1,
0.2073525, -1.972947, 3.883967, 1, 1, 1, 1, 1,
0.2102924, 0.6872118, -0.7985135, 1, 1, 1, 1, 1,
0.2145762, -0.2795131, 1.84464, 1, 1, 1, 1, 1,
0.2181151, 0.2512175, 0.090396, 1, 1, 1, 1, 1,
0.2261735, 0.4169985, 1.457916, 1, 1, 1, 1, 1,
0.228073, -0.639172, 2.452289, 0, 0, 1, 1, 1,
0.2343763, 0.1585823, 0.8051445, 1, 0, 0, 1, 1,
0.2349488, 0.8028248, 1.151381, 1, 0, 0, 1, 1,
0.2385266, -0.720831, 0.8363184, 1, 0, 0, 1, 1,
0.2399482, -1.033358, 2.06378, 1, 0, 0, 1, 1,
0.2413788, -0.9361692, 1.015873, 1, 0, 0, 1, 1,
0.2449652, -0.8506328, 2.922063, 0, 0, 0, 1, 1,
0.2473799, -1.553483, 2.637318, 0, 0, 0, 1, 1,
0.2499331, -1.22397, 2.130187, 0, 0, 0, 1, 1,
0.2508402, 0.140828, -0.4033543, 0, 0, 0, 1, 1,
0.2634219, 0.5899225, 1.664028, 0, 0, 0, 1, 1,
0.2734841, -1.201837, 3.435007, 0, 0, 0, 1, 1,
0.2762125, -0.83862, 2.309812, 0, 0, 0, 1, 1,
0.2777283, 1.532658, 1.182995, 1, 1, 1, 1, 1,
0.280404, 0.8106192, 1.698388, 1, 1, 1, 1, 1,
0.2874414, 0.3587381, 1.102509, 1, 1, 1, 1, 1,
0.289921, -0.6656326, 2.836733, 1, 1, 1, 1, 1,
0.2954492, -0.1595944, 2.663237, 1, 1, 1, 1, 1,
0.2964662, -0.969892, 3.704151, 1, 1, 1, 1, 1,
0.2980334, -0.8023531, 1.244243, 1, 1, 1, 1, 1,
0.299415, 1.302776, 1.084583, 1, 1, 1, 1, 1,
0.3051519, 0.7713904, 1.986506, 1, 1, 1, 1, 1,
0.3069997, 0.6018702, 0.6518633, 1, 1, 1, 1, 1,
0.3074458, -1.908383, 2.769232, 1, 1, 1, 1, 1,
0.30793, -0.2094692, 2.794057, 1, 1, 1, 1, 1,
0.310226, 1.215158, 1.106578, 1, 1, 1, 1, 1,
0.3131437, 1.748822, -0.888151, 1, 1, 1, 1, 1,
0.3139956, 0.2658926, 1.189763, 1, 1, 1, 1, 1,
0.3171362, -0.8349551, 0.4062845, 0, 0, 1, 1, 1,
0.3194172, 1.047071, 2.341007, 1, 0, 0, 1, 1,
0.321861, -0.6778194, 2.659019, 1, 0, 0, 1, 1,
0.3230507, 1.338381, -1.015507, 1, 0, 0, 1, 1,
0.3240864, 0.5811406, 0.3113314, 1, 0, 0, 1, 1,
0.3278251, 1.229775, -0.8753795, 1, 0, 0, 1, 1,
0.3296074, 1.015906, 2.110217, 0, 0, 0, 1, 1,
0.3320475, 0.2061931, 1.628802, 0, 0, 0, 1, 1,
0.3327952, -0.4008677, 1.493013, 0, 0, 0, 1, 1,
0.3328027, 0.8074451, -1.467161, 0, 0, 0, 1, 1,
0.3336285, -0.4274225, 2.409857, 0, 0, 0, 1, 1,
0.3386063, 0.8835547, 0.007857687, 0, 0, 0, 1, 1,
0.3406498, -0.7474293, 2.327122, 0, 0, 0, 1, 1,
0.341007, -0.8560398, 1.0845, 1, 1, 1, 1, 1,
0.3437482, 0.1233534, 1.125106, 1, 1, 1, 1, 1,
0.348654, 0.7651861, 1.280417, 1, 1, 1, 1, 1,
0.3493763, 0.7669151, 1.294734, 1, 1, 1, 1, 1,
0.3499899, -0.2722842, 2.972187, 1, 1, 1, 1, 1,
0.3535162, 1.913659, -0.3374894, 1, 1, 1, 1, 1,
0.3645006, 1.53643, -0.2915885, 1, 1, 1, 1, 1,
0.365154, 0.9077914, 1.090104, 1, 1, 1, 1, 1,
0.3654669, 1.616863, 0.8993756, 1, 1, 1, 1, 1,
0.3669396, 0.3844353, 0.5377349, 1, 1, 1, 1, 1,
0.3684017, 0.1868322, 0.940752, 1, 1, 1, 1, 1,
0.3706661, -1.120136, 3.966891, 1, 1, 1, 1, 1,
0.371686, -1.020288, 0.7671582, 1, 1, 1, 1, 1,
0.3720602, -0.8857567, 2.872809, 1, 1, 1, 1, 1,
0.374434, -0.4883355, 2.260406, 1, 1, 1, 1, 1,
0.3752366, 0.750406, -0.2442611, 0, 0, 1, 1, 1,
0.3771634, 0.9033111, 1.186952, 1, 0, 0, 1, 1,
0.3783352, -2.005339, 3.749628, 1, 0, 0, 1, 1,
0.3872238, -1.300132, 1.978465, 1, 0, 0, 1, 1,
0.3884668, 0.0999948, 0.4907114, 1, 0, 0, 1, 1,
0.3902162, -0.8988196, 3.009864, 1, 0, 0, 1, 1,
0.3951008, -0.5027813, 2.038353, 0, 0, 0, 1, 1,
0.4009373, -0.4589705, 3.211034, 0, 0, 0, 1, 1,
0.4067094, -0.3484893, 0.6177792, 0, 0, 0, 1, 1,
0.4086936, -0.6386508, 3.948208, 0, 0, 0, 1, 1,
0.4089562, -0.5741588, 3.419387, 0, 0, 0, 1, 1,
0.4130583, 0.4754492, 1.11678, 0, 0, 0, 1, 1,
0.4148141, 0.1492216, 0.6416711, 0, 0, 0, 1, 1,
0.4176027, 0.08904399, 1.368099, 1, 1, 1, 1, 1,
0.4206612, 1.771196, 0.05541831, 1, 1, 1, 1, 1,
0.4242334, 1.628759, 0.1420715, 1, 1, 1, 1, 1,
0.4291668, 0.1734113, 1.012974, 1, 1, 1, 1, 1,
0.4311149, 1.035596, -2.062542, 1, 1, 1, 1, 1,
0.4312683, -0.6095843, 3.720853, 1, 1, 1, 1, 1,
0.432717, 1.113878, -0.1577662, 1, 1, 1, 1, 1,
0.4355965, 0.679107, 0.3772052, 1, 1, 1, 1, 1,
0.4450341, 0.2852725, 0.4010847, 1, 1, 1, 1, 1,
0.4481155, -2.595417, 2.320307, 1, 1, 1, 1, 1,
0.4488671, -0.3130089, 3.190574, 1, 1, 1, 1, 1,
0.4502513, -0.1010146, 1.312479, 1, 1, 1, 1, 1,
0.4503647, 0.2341686, 3.502655, 1, 1, 1, 1, 1,
0.4514099, 1.478268, -0.4214998, 1, 1, 1, 1, 1,
0.4522307, -1.301818, 2.814407, 1, 1, 1, 1, 1,
0.4529081, -0.7246683, 2.681267, 0, 0, 1, 1, 1,
0.4547904, -0.7394251, 3.910803, 1, 0, 0, 1, 1,
0.4574265, 0.02419216, 2.252702, 1, 0, 0, 1, 1,
0.4603171, 0.6570414, -0.326068, 1, 0, 0, 1, 1,
0.4736911, 0.8695525, 0.3322678, 1, 0, 0, 1, 1,
0.4737895, -1.344222, 1.183222, 1, 0, 0, 1, 1,
0.4812021, -0.4668895, 0.5098237, 0, 0, 0, 1, 1,
0.4860693, 0.5122797, 0.8749586, 0, 0, 0, 1, 1,
0.4879837, -0.05180934, 1.860874, 0, 0, 0, 1, 1,
0.4946556, 1.024717, 0.05740521, 0, 0, 0, 1, 1,
0.4954145, -0.114346, 0.7166136, 0, 0, 0, 1, 1,
0.503184, -2.196947, 2.438499, 0, 0, 0, 1, 1,
0.5070565, -0.4446536, 2.985361, 0, 0, 0, 1, 1,
0.5088862, 0.1737107, 2.399788, 1, 1, 1, 1, 1,
0.5128689, 0.3633628, 1.020693, 1, 1, 1, 1, 1,
0.5189065, -1.086087, 2.28321, 1, 1, 1, 1, 1,
0.5208538, 2.744993, -1.032881, 1, 1, 1, 1, 1,
0.528055, 0.221302, 0.7799538, 1, 1, 1, 1, 1,
0.5288659, 0.5428685, 1.94263, 1, 1, 1, 1, 1,
0.5291505, -1.356119, 3.561899, 1, 1, 1, 1, 1,
0.5447809, 0.8779861, 1.520933, 1, 1, 1, 1, 1,
0.5493872, -2.550272, 2.197816, 1, 1, 1, 1, 1,
0.5506809, -0.3879221, 3.415594, 1, 1, 1, 1, 1,
0.5522105, 0.9776974, 0.9615651, 1, 1, 1, 1, 1,
0.5544135, 1.902417, 0.5994113, 1, 1, 1, 1, 1,
0.5547228, -1.069065, 4.331899, 1, 1, 1, 1, 1,
0.555299, 1.048946, -0.6629917, 1, 1, 1, 1, 1,
0.5602585, 0.7663995, 1.234592, 1, 1, 1, 1, 1,
0.5606429, -0.1758185, 0.4744925, 0, 0, 1, 1, 1,
0.5620389, 1.096847, 0.5605915, 1, 0, 0, 1, 1,
0.5732601, -0.3258044, 2.789557, 1, 0, 0, 1, 1,
0.5796872, -0.01602487, 0.6460869, 1, 0, 0, 1, 1,
0.5813479, 0.7275563, 1.014972, 1, 0, 0, 1, 1,
0.5824575, 0.3842068, 0.2958108, 1, 0, 0, 1, 1,
0.5847386, 0.2654662, 0.5598727, 0, 0, 0, 1, 1,
0.5929347, -2.042421, 4.748211, 0, 0, 0, 1, 1,
0.59657, -0.2208371, 0.8936805, 0, 0, 0, 1, 1,
0.5985432, -1.030582, 2.052348, 0, 0, 0, 1, 1,
0.5993971, -1.46222, 2.601493, 0, 0, 0, 1, 1,
0.6002051, 0.2021181, 0.5745649, 0, 0, 0, 1, 1,
0.6032659, -0.3110255, 1.638643, 0, 0, 0, 1, 1,
0.60416, -0.744692, 1.03462, 1, 1, 1, 1, 1,
0.6113335, -0.01200018, 1.91561, 1, 1, 1, 1, 1,
0.6114671, -0.1407996, 1.751164, 1, 1, 1, 1, 1,
0.6117687, 1.87209, 2.316467, 1, 1, 1, 1, 1,
0.6147543, 1.00551, -0.2598165, 1, 1, 1, 1, 1,
0.6165745, 0.8420302, 1.70705, 1, 1, 1, 1, 1,
0.6177649, 1.109883, 0.126816, 1, 1, 1, 1, 1,
0.6184335, 1.19675, 1.418622, 1, 1, 1, 1, 1,
0.6189768, 1.50717, -0.4741776, 1, 1, 1, 1, 1,
0.6192002, -1.568123, 4.47332, 1, 1, 1, 1, 1,
0.6219795, 0.3862935, 0.3641238, 1, 1, 1, 1, 1,
0.6237611, 0.1319719, -0.3790173, 1, 1, 1, 1, 1,
0.6251931, -0.9621865, 1.581793, 1, 1, 1, 1, 1,
0.6257672, -2.017539, 4.720484, 1, 1, 1, 1, 1,
0.6280581, -1.948355, 3.250411, 1, 1, 1, 1, 1,
0.6291514, 0.2444121, 1.289943, 0, 0, 1, 1, 1,
0.633655, 0.4402748, 0.05541237, 1, 0, 0, 1, 1,
0.6395481, -0.3836512, 1.095815, 1, 0, 0, 1, 1,
0.639632, -0.1900742, 0.981702, 1, 0, 0, 1, 1,
0.642322, 0.09996601, 2.700367, 1, 0, 0, 1, 1,
0.6441194, -0.549326, 3.336044, 1, 0, 0, 1, 1,
0.6471294, -1.453533, 1.560173, 0, 0, 0, 1, 1,
0.6472933, 0.04441432, 1.93598, 0, 0, 0, 1, 1,
0.6547314, -1.257719, 3.645262, 0, 0, 0, 1, 1,
0.6597308, 1.142988, 0.3533849, 0, 0, 0, 1, 1,
0.6602482, 0.4378301, 2.286185, 0, 0, 0, 1, 1,
0.6653603, 0.4536625, 1.735263, 0, 0, 0, 1, 1,
0.6654008, 1.495303, 0.5182958, 0, 0, 0, 1, 1,
0.6716758, -0.7271696, 3.476376, 1, 1, 1, 1, 1,
0.6718463, -0.8857476, 2.676447, 1, 1, 1, 1, 1,
0.6718816, -0.4738047, 1.07495, 1, 1, 1, 1, 1,
0.6723644, -0.2266076, 1.967816, 1, 1, 1, 1, 1,
0.6786693, 1.2073, 1.629577, 1, 1, 1, 1, 1,
0.6847394, 0.1506409, 0.7210004, 1, 1, 1, 1, 1,
0.6894263, -1.179401, 2.637294, 1, 1, 1, 1, 1,
0.6899759, -0.04821994, 1.73039, 1, 1, 1, 1, 1,
0.691521, 0.1832477, 0.4282865, 1, 1, 1, 1, 1,
0.693671, -1.450072, 3.420017, 1, 1, 1, 1, 1,
0.7049495, 0.1697251, 2.953815, 1, 1, 1, 1, 1,
0.7065408, 0.8603846, -0.393298, 1, 1, 1, 1, 1,
0.7081982, 2.838425, -0.3004534, 1, 1, 1, 1, 1,
0.7155721, -0.3594584, 1.788077, 1, 1, 1, 1, 1,
0.7179906, 0.8100696, -1.896112, 1, 1, 1, 1, 1,
0.7219916, -0.05717609, 2.39744, 0, 0, 1, 1, 1,
0.7257599, -1.197638, 2.09707, 1, 0, 0, 1, 1,
0.7260745, -0.09122892, 2.339308, 1, 0, 0, 1, 1,
0.7340998, 0.724529, -1.308582, 1, 0, 0, 1, 1,
0.7352951, -0.8920036, 1.624728, 1, 0, 0, 1, 1,
0.7356427, -0.6667634, 2.720267, 1, 0, 0, 1, 1,
0.7363851, -1.137605, 3.141441, 0, 0, 0, 1, 1,
0.7459787, -0.985916, 2.096392, 0, 0, 0, 1, 1,
0.7463394, -0.4179285, 3.793829, 0, 0, 0, 1, 1,
0.746662, -1.52589, 3.542741, 0, 0, 0, 1, 1,
0.753722, -0.3624606, 3.136659, 0, 0, 0, 1, 1,
0.7562372, -1.199306, 3.054127, 0, 0, 0, 1, 1,
0.7565861, -0.1430159, 0.8490132, 0, 0, 0, 1, 1,
0.7572155, 1.339945, 1.739016, 1, 1, 1, 1, 1,
0.7577238, -0.01271611, 0.782483, 1, 1, 1, 1, 1,
0.7619538, 1.085752, -0.378953, 1, 1, 1, 1, 1,
0.7630869, 1.185584, -0.4821784, 1, 1, 1, 1, 1,
0.7655345, -1.480132, 2.307488, 1, 1, 1, 1, 1,
0.7664878, 1.076244, 0.9585155, 1, 1, 1, 1, 1,
0.769072, 0.3485416, 0.3271894, 1, 1, 1, 1, 1,
0.7742363, 0.06673363, 1.545535, 1, 1, 1, 1, 1,
0.7758022, 0.5690361, 0.2932159, 1, 1, 1, 1, 1,
0.7814852, 0.3676409, 1.917705, 1, 1, 1, 1, 1,
0.7815447, 0.2418554, 1.581299, 1, 1, 1, 1, 1,
0.7832106, -0.4456356, 0.2914687, 1, 1, 1, 1, 1,
0.7855133, -2.227044, 2.470346, 1, 1, 1, 1, 1,
0.789826, -0.2697259, 0.01023432, 1, 1, 1, 1, 1,
0.7933676, -0.2725027, 2.3709, 1, 1, 1, 1, 1,
0.7956854, 1.388686, 2.354937, 0, 0, 1, 1, 1,
0.7960051, -0.9364457, 3.726112, 1, 0, 0, 1, 1,
0.7975538, 0.2232329, 0.2950946, 1, 0, 0, 1, 1,
0.7976892, 0.9513245, -0.6007656, 1, 0, 0, 1, 1,
0.8036303, -1.176385, 1.764565, 1, 0, 0, 1, 1,
0.8044555, 1.304869, 0.5277513, 1, 0, 0, 1, 1,
0.8165792, 0.5510959, 0.348203, 0, 0, 0, 1, 1,
0.8175911, 0.8436778, -0.1651305, 0, 0, 0, 1, 1,
0.8255081, 0.3122847, 1.430316, 0, 0, 0, 1, 1,
0.8318039, -0.2730834, 1.732126, 0, 0, 0, 1, 1,
0.8349616, 0.498263, 0.8838065, 0, 0, 0, 1, 1,
0.8362169, -0.1345312, 2.463326, 0, 0, 0, 1, 1,
0.8392504, 0.8848025, 0.9012346, 0, 0, 0, 1, 1,
0.840426, 0.7478218, 2.582099, 1, 1, 1, 1, 1,
0.8426589, -3.477992, 3.042457, 1, 1, 1, 1, 1,
0.8454762, 1.395334, 0.3419938, 1, 1, 1, 1, 1,
0.8462144, -0.9511953, 0.191409, 1, 1, 1, 1, 1,
0.8482376, -0.08158303, 2.240703, 1, 1, 1, 1, 1,
0.8523198, 0.4133805, 0.7396243, 1, 1, 1, 1, 1,
0.8602812, -1.062233, 1.021505, 1, 1, 1, 1, 1,
0.8618686, 0.9774772, 0.3279947, 1, 1, 1, 1, 1,
0.8682287, -0.4747455, 3.846953, 1, 1, 1, 1, 1,
0.8764223, -0.1349199, 0.6732675, 1, 1, 1, 1, 1,
0.8802389, 0.6277905, 1.629387, 1, 1, 1, 1, 1,
0.8818439, 0.6101166, 0.08583829, 1, 1, 1, 1, 1,
0.8918323, -0.8074535, 2.492451, 1, 1, 1, 1, 1,
0.8947158, -0.7616964, 3.101841, 1, 1, 1, 1, 1,
0.8987235, -0.8944, 0.3662932, 1, 1, 1, 1, 1,
0.9006413, 1.001396, 1.693408, 0, 0, 1, 1, 1,
0.9096847, 0.2878713, 1.257148, 1, 0, 0, 1, 1,
0.9138387, -0.3798679, 2.294542, 1, 0, 0, 1, 1,
0.9164772, -1.035219, 0.8671584, 1, 0, 0, 1, 1,
0.9221628, 1.553869, 0.2741624, 1, 0, 0, 1, 1,
0.9324256, -0.1249593, 1.119628, 1, 0, 0, 1, 1,
0.9360141, -0.7958714, 0.4381458, 0, 0, 0, 1, 1,
0.9386091, 0.2355438, 1.935034, 0, 0, 0, 1, 1,
0.9405219, -1.071174, 0.8162192, 0, 0, 0, 1, 1,
0.9422997, -0.398522, 2.095636, 0, 0, 0, 1, 1,
0.9424198, -0.767288, 1.115474, 0, 0, 0, 1, 1,
0.9428736, -0.2133118, 0.0862531, 0, 0, 0, 1, 1,
0.9442312, -0.5556367, 1.623254, 0, 0, 0, 1, 1,
0.948487, 0.5823567, 1.749897, 1, 1, 1, 1, 1,
0.9539772, -0.8627379, 1.448138, 1, 1, 1, 1, 1,
0.955532, 1.296448, 0.9136195, 1, 1, 1, 1, 1,
0.9588416, -0.9593946, 1.881316, 1, 1, 1, 1, 1,
0.9588416, 0.5549659, -0.2520288, 1, 1, 1, 1, 1,
0.9604891, -0.5934003, 2.16564, 1, 1, 1, 1, 1,
0.9614863, 0.05886557, 0.5015728, 1, 1, 1, 1, 1,
0.9652192, -0.5494282, 4.585385, 1, 1, 1, 1, 1,
0.9701068, 0.3756747, 3.123033, 1, 1, 1, 1, 1,
0.9725623, -1.394489, 0.5398499, 1, 1, 1, 1, 1,
0.9761021, -0.4575039, 1.93218, 1, 1, 1, 1, 1,
0.9769608, -1.069533, 2.225913, 1, 1, 1, 1, 1,
0.9800419, -0.4407315, 1.966128, 1, 1, 1, 1, 1,
0.9840968, 0.7921723, 1.390472, 1, 1, 1, 1, 1,
0.9926471, -0.5351294, 2.565818, 1, 1, 1, 1, 1,
0.996817, 1.453306, -0.3640642, 0, 0, 1, 1, 1,
0.9984761, 0.8550027, 0.2506467, 1, 0, 0, 1, 1,
1.002639, 0.6698929, -0.003883198, 1, 0, 0, 1, 1,
1.005234, -1.290314, 3.317439, 1, 0, 0, 1, 1,
1.005452, 0.6819249, 0.0135153, 1, 0, 0, 1, 1,
1.006021, 1.809857, 1.488908, 1, 0, 0, 1, 1,
1.01317, -0.1471171, 2.050552, 0, 0, 0, 1, 1,
1.017002, 0.6713214, 0.1875689, 0, 0, 0, 1, 1,
1.020551, 0.9707361, -0.4759159, 0, 0, 0, 1, 1,
1.022535, 0.01456292, 1.193159, 0, 0, 0, 1, 1,
1.033226, 1.42165, 0.4245359, 0, 0, 0, 1, 1,
1.03473, -0.7539957, 3.961612, 0, 0, 0, 1, 1,
1.035639, 1.583909, 0.128427, 0, 0, 0, 1, 1,
1.035979, -0.2242028, 0.4614533, 1, 1, 1, 1, 1,
1.036553, 2.338211, 0.8189179, 1, 1, 1, 1, 1,
1.041306, 1.465139, 1.110186, 1, 1, 1, 1, 1,
1.049469, 1.172352, 1.941034, 1, 1, 1, 1, 1,
1.056202, 0.2726197, 1.457955, 1, 1, 1, 1, 1,
1.056605, 0.5128409, 1.749621, 1, 1, 1, 1, 1,
1.064324, -0.07826115, 1.318995, 1, 1, 1, 1, 1,
1.073759, 0.7528049, 1.243198, 1, 1, 1, 1, 1,
1.076749, 1.193354, 1.019265, 1, 1, 1, 1, 1,
1.079326, 0.3403842, 1.107913, 1, 1, 1, 1, 1,
1.087824, 0.9399949, 0.7219184, 1, 1, 1, 1, 1,
1.091221, -0.246777, 1.003514, 1, 1, 1, 1, 1,
1.094958, -0.6013555, 2.506133, 1, 1, 1, 1, 1,
1.095677, -1.59281, 3.547481, 1, 1, 1, 1, 1,
1.097224, -2.002808, 2.672275, 1, 1, 1, 1, 1,
1.110076, -0.8497205, 3.443179, 0, 0, 1, 1, 1,
1.111214, 0.491874, 2.145642, 1, 0, 0, 1, 1,
1.111893, -0.009626151, 1.287925, 1, 0, 0, 1, 1,
1.116672, -1.253316, 2.494272, 1, 0, 0, 1, 1,
1.134199, -0.6294281, 1.878946, 1, 0, 0, 1, 1,
1.13752, 1.681691, 1.222129, 1, 0, 0, 1, 1,
1.141497, -0.09238356, 2.259977, 0, 0, 0, 1, 1,
1.145983, -1.770085, 1.915333, 0, 0, 0, 1, 1,
1.15054, -0.06273955, 1.237525, 0, 0, 0, 1, 1,
1.153006, 1.548348, -0.6221363, 0, 0, 0, 1, 1,
1.156781, 0.2878258, 1.125453, 0, 0, 0, 1, 1,
1.157165, 0.1920121, 0.5689904, 0, 0, 0, 1, 1,
1.159738, -0.7260535, 1.138071, 0, 0, 0, 1, 1,
1.169233, 0.5785391, 2.289235, 1, 1, 1, 1, 1,
1.174109, 0.6366425, 2.315442, 1, 1, 1, 1, 1,
1.18719, 0.622323, -0.08681532, 1, 1, 1, 1, 1,
1.190962, 0.4887685, -0.7706291, 1, 1, 1, 1, 1,
1.201523, 0.4440252, 2.432247, 1, 1, 1, 1, 1,
1.205739, 0.00279375, 3.495093, 1, 1, 1, 1, 1,
1.207951, 0.1828644, 2.056894, 1, 1, 1, 1, 1,
1.21056, 0.6925565, 0.7003434, 1, 1, 1, 1, 1,
1.210921, 1.00074, 0.3402619, 1, 1, 1, 1, 1,
1.215021, 0.7212681, 2.839921, 1, 1, 1, 1, 1,
1.217582, -0.4387857, 2.326473, 1, 1, 1, 1, 1,
1.223638, 0.4751701, 0.9381254, 1, 1, 1, 1, 1,
1.236937, -0.6271664, 1.955997, 1, 1, 1, 1, 1,
1.242847, -0.2703225, 3.235241, 1, 1, 1, 1, 1,
1.24609, -0.4415031, 1.627581, 1, 1, 1, 1, 1,
1.268175, -0.1498188, 2.511182, 0, 0, 1, 1, 1,
1.270446, -0.4284101, 2.180523, 1, 0, 0, 1, 1,
1.271647, -0.6373681, 1.20161, 1, 0, 0, 1, 1,
1.273031, 0.2365059, 1.373743, 1, 0, 0, 1, 1,
1.275409, 0.4734466, 2.579773, 1, 0, 0, 1, 1,
1.279605, -1.333949, 1.665729, 1, 0, 0, 1, 1,
1.288066, 0.2922666, 0.5858405, 0, 0, 0, 1, 1,
1.292066, -0.4848159, 0.7441741, 0, 0, 0, 1, 1,
1.292875, -1.000341, 1.072642, 0, 0, 0, 1, 1,
1.296184, 0.2560198, 0.2577113, 0, 0, 0, 1, 1,
1.29766, -1.005663, 2.132428, 0, 0, 0, 1, 1,
1.304439, 0.4462331, 0.9114061, 0, 0, 0, 1, 1,
1.312053, 0.5250977, 1.598625, 0, 0, 0, 1, 1,
1.312569, -1.050173, -0.08360208, 1, 1, 1, 1, 1,
1.33015, 3.141505, -0.2478321, 1, 1, 1, 1, 1,
1.33983, -0.1367415, 1.549861, 1, 1, 1, 1, 1,
1.369726, 0.4561943, 1.168084, 1, 1, 1, 1, 1,
1.373805, -0.07728664, 0.8482402, 1, 1, 1, 1, 1,
1.380204, -0.167613, 2.784118, 1, 1, 1, 1, 1,
1.384676, -1.14427, 3.148913, 1, 1, 1, 1, 1,
1.385997, -0.3793648, 1.188718, 1, 1, 1, 1, 1,
1.390448, -0.2027709, 1.128505, 1, 1, 1, 1, 1,
1.391114, 0.5226675, -0.1716613, 1, 1, 1, 1, 1,
1.39233, -0.1532843, 1.456439, 1, 1, 1, 1, 1,
1.401522, 0.09386177, 0.29906, 1, 1, 1, 1, 1,
1.405251, -0.9487033, 1.691948, 1, 1, 1, 1, 1,
1.409912, -1.194257, 0.9204338, 1, 1, 1, 1, 1,
1.415412, 1.042774, 1.083497, 1, 1, 1, 1, 1,
1.435451, 0.6940491, 1.657058, 0, 0, 1, 1, 1,
1.43682, 0.7209039, 1.505259, 1, 0, 0, 1, 1,
1.437366, -0.06395777, 2.513864, 1, 0, 0, 1, 1,
1.43769, 0.1807856, 1.663201, 1, 0, 0, 1, 1,
1.437759, 0.5047302, 2.481254, 1, 0, 0, 1, 1,
1.464189, 0.1333896, 1.429521, 1, 0, 0, 1, 1,
1.475535, -1.32728, 3.1326, 0, 0, 0, 1, 1,
1.479265, 0.07312269, 3.072117, 0, 0, 0, 1, 1,
1.488755, -0.8131115, 0.9976974, 0, 0, 0, 1, 1,
1.489781, -1.850294, 2.706858, 0, 0, 0, 1, 1,
1.499552, 0.4429745, 2.026213, 0, 0, 0, 1, 1,
1.533315, 1.270676, -0.8134975, 0, 0, 0, 1, 1,
1.533551, -1.107024, 4.150285, 0, 0, 0, 1, 1,
1.558365, 1.919424, 0.2016081, 1, 1, 1, 1, 1,
1.560081, 0.9386569, 3.527283, 1, 1, 1, 1, 1,
1.564983, -0.4378262, 1.466569, 1, 1, 1, 1, 1,
1.573071, -0.8671604, 2.214377, 1, 1, 1, 1, 1,
1.592558, 0.1984186, 0.6493517, 1, 1, 1, 1, 1,
1.601445, 2.331309, -0.9662368, 1, 1, 1, 1, 1,
1.606906, 0.5630412, 0.7612215, 1, 1, 1, 1, 1,
1.616297, 0.1592922, 1.962588, 1, 1, 1, 1, 1,
1.621814, -0.4672195, 0.3427093, 1, 1, 1, 1, 1,
1.653475, -1.116587, 0.40214, 1, 1, 1, 1, 1,
1.658147, 0.5644112, 1.163272, 1, 1, 1, 1, 1,
1.672361, 0.4876122, 0.8792121, 1, 1, 1, 1, 1,
1.691384, 0.2387587, 2.324521, 1, 1, 1, 1, 1,
1.698886, 0.3105138, 0.2205728, 1, 1, 1, 1, 1,
1.700144, -0.002302496, 1.426323, 1, 1, 1, 1, 1,
1.712717, 0.693774, -0.05885457, 0, 0, 1, 1, 1,
1.719391, 1.179471, -0.7660161, 1, 0, 0, 1, 1,
1.719937, 1.60854, -0.4768939, 1, 0, 0, 1, 1,
1.744958, -0.2126106, 1.152433, 1, 0, 0, 1, 1,
1.751789, -0.04178366, 1.958468, 1, 0, 0, 1, 1,
1.756021, -0.4220526, 3.443678, 1, 0, 0, 1, 1,
1.764395, 1.263264, 0.7149568, 0, 0, 0, 1, 1,
1.799757, -0.5540382, 1.482234, 0, 0, 0, 1, 1,
1.84751, -1.826706, 2.115544, 0, 0, 0, 1, 1,
1.84781, -0.1966815, 0.9186224, 0, 0, 0, 1, 1,
1.849008, 0.3550826, 0.5850584, 0, 0, 0, 1, 1,
1.852299, 1.305867, 1.342858, 0, 0, 0, 1, 1,
1.875977, -0.4068851, 2.551728, 0, 0, 0, 1, 1,
1.882577, -1.789906, 2.39751, 1, 1, 1, 1, 1,
1.893631, -0.07908753, 0.825453, 1, 1, 1, 1, 1,
1.895466, -1.574931, 3.388296, 1, 1, 1, 1, 1,
1.903193, 0.1626131, 1.744369, 1, 1, 1, 1, 1,
1.931078, -1.56702, 1.917169, 1, 1, 1, 1, 1,
1.93982, -1.069844, 1.592207, 1, 1, 1, 1, 1,
1.956058, -0.03902414, 2.447067, 1, 1, 1, 1, 1,
1.96426, 0.1723756, -1.32101, 1, 1, 1, 1, 1,
1.976617, 0.6170564, 0.9311895, 1, 1, 1, 1, 1,
1.981314, -0.02195693, 2.061203, 1, 1, 1, 1, 1,
1.991484, -0.9765553, 1.937046, 1, 1, 1, 1, 1,
1.998288, 0.949113, 0.9187494, 1, 1, 1, 1, 1,
2.012406, -3.231615, 1.92776, 1, 1, 1, 1, 1,
2.021559, -1.562959, 0.3898014, 1, 1, 1, 1, 1,
2.041581, 0.2628199, 2.911125, 1, 1, 1, 1, 1,
2.06376, 1.52899, 1.988356, 0, 0, 1, 1, 1,
2.142192, 0.3650984, 1.435407, 1, 0, 0, 1, 1,
2.144297, -1.995015, 1.928712, 1, 0, 0, 1, 1,
2.178176, -0.5744131, 1.487587, 1, 0, 0, 1, 1,
2.188523, -1.711029, 2.620858, 1, 0, 0, 1, 1,
2.233574, -1.078616, 2.625181, 1, 0, 0, 1, 1,
2.269464, 0.6328222, 0.6378376, 0, 0, 0, 1, 1,
2.288731, -0.1218952, 2.341833, 0, 0, 0, 1, 1,
2.29887, 0.232155, 2.448312, 0, 0, 0, 1, 1,
2.355617, -0.6729491, 0.4350605, 0, 0, 0, 1, 1,
2.399318, 0.6334681, 1.182835, 0, 0, 0, 1, 1,
2.467534, -0.2648285, 1.352551, 0, 0, 0, 1, 1,
2.469783, -0.6313867, 0.8614884, 0, 0, 0, 1, 1,
2.492373, -0.6665142, 1.937672, 1, 1, 1, 1, 1,
2.527199, -2.123366, 1.978016, 1, 1, 1, 1, 1,
2.635643, -0.04403114, 0.8015688, 1, 1, 1, 1, 1,
2.84738, -0.2607685, 1.356941, 1, 1, 1, 1, 1,
2.892108, -0.961678, 3.061404, 1, 1, 1, 1, 1,
2.896798, 0.5091621, 2.479927, 1, 1, 1, 1, 1,
4.03233, 0.5286422, 4.486379, 1, 1, 1, 1, 1
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
var radius = 9.919854;
var distance = 34.84306;
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
mvMatrix.translate( -0.4517293, -0.02810454, 0.02166939 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.84306);
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