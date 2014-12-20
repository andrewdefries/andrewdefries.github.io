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
-3.509629, -0.7263292, -3.058489, 1, 0, 0, 1,
-2.974358, 0.7072452, -3.211779, 1, 0.007843138, 0, 1,
-2.79278, 0.6867177, -0.1470292, 1, 0.01176471, 0, 1,
-2.568214, 1.098211, -1.671737, 1, 0.01960784, 0, 1,
-2.563423, -0.5092422, -3.456703, 1, 0.02352941, 0, 1,
-2.553852, 0.3684748, -2.031471, 1, 0.03137255, 0, 1,
-2.492883, -0.1625362, -0.4087083, 1, 0.03529412, 0, 1,
-2.394021, 0.8232938, -0.7556312, 1, 0.04313726, 0, 1,
-2.27723, -1.54407, -2.211814, 1, 0.04705882, 0, 1,
-2.234889, -1.190654, -3.905739, 1, 0.05490196, 0, 1,
-2.207802, 2.282056, -0.1481884, 1, 0.05882353, 0, 1,
-2.207772, 0.702793, -2.14468, 1, 0.06666667, 0, 1,
-2.182734, -0.7731746, -0.1754927, 1, 0.07058824, 0, 1,
-2.176478, 0.6273073, -1.497251, 1, 0.07843138, 0, 1,
-2.158269, -0.4433131, -3.380111, 1, 0.08235294, 0, 1,
-2.128816, 2.420672, -1.830993, 1, 0.09019608, 0, 1,
-2.082764, 0.3444573, -0.7475783, 1, 0.09411765, 0, 1,
-2.057173, 0.01044438, -0.9109156, 1, 0.1019608, 0, 1,
-2.010072, -0.4928589, -2.464005, 1, 0.1098039, 0, 1,
-1.941341, 1.093133, -1.740833, 1, 0.1137255, 0, 1,
-1.933423, 0.4757378, -1.323504, 1, 0.1215686, 0, 1,
-1.928869, -0.0583637, -2.371572, 1, 0.1254902, 0, 1,
-1.928066, -0.2987409, -2.922065, 1, 0.1333333, 0, 1,
-1.924443, -0.9915025, -0.9699118, 1, 0.1372549, 0, 1,
-1.90457, -0.8706166, -2.457129, 1, 0.145098, 0, 1,
-1.900838, -1.279953, -0.68971, 1, 0.1490196, 0, 1,
-1.872882, -1.284771, -1.305303, 1, 0.1568628, 0, 1,
-1.866851, 0.03420233, -1.512421, 1, 0.1607843, 0, 1,
-1.859895, -0.3672511, -0.9465215, 1, 0.1686275, 0, 1,
-1.845901, -0.9853877, -1.234295, 1, 0.172549, 0, 1,
-1.834708, 1.791625, -0.9279577, 1, 0.1803922, 0, 1,
-1.78931, 1.019933, -2.101639, 1, 0.1843137, 0, 1,
-1.779487, 0.138496, -1.906124, 1, 0.1921569, 0, 1,
-1.763192, -0.2165118, -3.921775, 1, 0.1960784, 0, 1,
-1.754634, 0.170771, -1.542229, 1, 0.2039216, 0, 1,
-1.753178, -0.244772, 0.1136281, 1, 0.2117647, 0, 1,
-1.748445, -2.041398, -3.452059, 1, 0.2156863, 0, 1,
-1.721352, -0.7141137, -0.4194838, 1, 0.2235294, 0, 1,
-1.713301, 0.9705462, -2.969817, 1, 0.227451, 0, 1,
-1.704659, -1.100307, -4.085693, 1, 0.2352941, 0, 1,
-1.682892, -2.035917, -1.759663, 1, 0.2392157, 0, 1,
-1.667809, -0.07247833, -0.8048988, 1, 0.2470588, 0, 1,
-1.664675, -0.03856172, -0.8369264, 1, 0.2509804, 0, 1,
-1.653272, -0.3607944, -3.710607, 1, 0.2588235, 0, 1,
-1.635139, 0.2896179, -0.8536838, 1, 0.2627451, 0, 1,
-1.629239, 2.121028, -0.6375372, 1, 0.2705882, 0, 1,
-1.620643, 0.1133735, -1.52896, 1, 0.2745098, 0, 1,
-1.618724, 0.6018572, -3.415266, 1, 0.282353, 0, 1,
-1.611493, -0.2656008, -5.310453, 1, 0.2862745, 0, 1,
-1.585019, -0.1038371, -1.688961, 1, 0.2941177, 0, 1,
-1.582628, 1.481285, -0.3407147, 1, 0.3019608, 0, 1,
-1.579575, -0.02708821, -2.802597, 1, 0.3058824, 0, 1,
-1.548545, 0.3036338, -3.271908, 1, 0.3137255, 0, 1,
-1.547772, 0.4249294, -1.33619, 1, 0.3176471, 0, 1,
-1.547081, -1.159235, -1.046877, 1, 0.3254902, 0, 1,
-1.546636, 0.01768518, -1.024009, 1, 0.3294118, 0, 1,
-1.544099, -1.472679, -3.322111, 1, 0.3372549, 0, 1,
-1.530449, 0.4911368, -1.543992, 1, 0.3411765, 0, 1,
-1.528805, 1.883923, -1.128966, 1, 0.3490196, 0, 1,
-1.522452, 0.8000816, 0.3555323, 1, 0.3529412, 0, 1,
-1.516157, -0.2071896, 0.6051555, 1, 0.3607843, 0, 1,
-1.516135, -0.2993513, -0.3671027, 1, 0.3647059, 0, 1,
-1.512601, 1.970362, -1.199266, 1, 0.372549, 0, 1,
-1.511852, -1.234568, -1.779138, 1, 0.3764706, 0, 1,
-1.510888, 0.7216862, -0.03954534, 1, 0.3843137, 0, 1,
-1.50488, 1.6711, -1.373321, 1, 0.3882353, 0, 1,
-1.497084, 0.1063897, -3.687524, 1, 0.3960784, 0, 1,
-1.496076, 1.549421, -2.130662, 1, 0.4039216, 0, 1,
-1.487693, -1.372356, -2.50807, 1, 0.4078431, 0, 1,
-1.479977, -1.232692, -0.7106892, 1, 0.4156863, 0, 1,
-1.478835, -2.538999, -2.489096, 1, 0.4196078, 0, 1,
-1.472076, 0.7867556, -0.05983114, 1, 0.427451, 0, 1,
-1.468349, 1.523221, 0.4338684, 1, 0.4313726, 0, 1,
-1.467434, 1.54719, -0.4856957, 1, 0.4392157, 0, 1,
-1.46628, 0.145069, -3.251595, 1, 0.4431373, 0, 1,
-1.463005, 1.398407, -0.2967935, 1, 0.4509804, 0, 1,
-1.46218, -1.599763, -3.579292, 1, 0.454902, 0, 1,
-1.459403, 0.3889868, -0.4671443, 1, 0.4627451, 0, 1,
-1.458576, 0.3682204, -0.8275905, 1, 0.4666667, 0, 1,
-1.451895, -2.226331, -1.829396, 1, 0.4745098, 0, 1,
-1.450958, -0.219996, -0.5749303, 1, 0.4784314, 0, 1,
-1.445475, -0.9794015, -3.259537, 1, 0.4862745, 0, 1,
-1.442789, 0.1205427, -0.5977498, 1, 0.4901961, 0, 1,
-1.424779, -0.3664275, -2.046473, 1, 0.4980392, 0, 1,
-1.41377, 1.417201, 0.6974717, 1, 0.5058824, 0, 1,
-1.409523, -0.6644631, -0.8498562, 1, 0.509804, 0, 1,
-1.402343, 0.2284228, -3.456616, 1, 0.5176471, 0, 1,
-1.390021, -0.5248485, -1.469633, 1, 0.5215687, 0, 1,
-1.382918, -1.286007, -1.201802, 1, 0.5294118, 0, 1,
-1.382203, 0.1125806, -0.8826655, 1, 0.5333334, 0, 1,
-1.380839, 1.040289, -0.9173925, 1, 0.5411765, 0, 1,
-1.380773, -1.353718, -1.692673, 1, 0.5450981, 0, 1,
-1.365982, -1.418618, -1.43608, 1, 0.5529412, 0, 1,
-1.365637, 0.5410755, -1.033868, 1, 0.5568628, 0, 1,
-1.365165, -0.2391512, -3.171383, 1, 0.5647059, 0, 1,
-1.35499, 2.96106, -1.979137, 1, 0.5686275, 0, 1,
-1.344412, -0.162496, -5.20009, 1, 0.5764706, 0, 1,
-1.342821, -0.859955, -1.251231, 1, 0.5803922, 0, 1,
-1.342698, 0.5881301, -0.690079, 1, 0.5882353, 0, 1,
-1.335664, 0.9234937, -0.06120081, 1, 0.5921569, 0, 1,
-1.329783, -0.29087, -2.687362, 1, 0.6, 0, 1,
-1.32628, -1.207278, -2.568321, 1, 0.6078432, 0, 1,
-1.304795, 1.730558, 1.083049, 1, 0.6117647, 0, 1,
-1.303457, 0.2115358, -2.569928, 1, 0.6196079, 0, 1,
-1.29719, 0.07491044, -0.5381349, 1, 0.6235294, 0, 1,
-1.277161, -0.839491, -1.673706, 1, 0.6313726, 0, 1,
-1.275567, -0.1928838, -0.5548112, 1, 0.6352941, 0, 1,
-1.2658, 0.0767603, -0.446642, 1, 0.6431373, 0, 1,
-1.264172, -0.6611237, -3.539459, 1, 0.6470588, 0, 1,
-1.260695, -0.7877567, -4.284575, 1, 0.654902, 0, 1,
-1.2537, -0.8090666, -1.555331, 1, 0.6588235, 0, 1,
-1.240304, -0.9166102, -1.396076, 1, 0.6666667, 0, 1,
-1.239325, 1.382605, -1.377745, 1, 0.6705883, 0, 1,
-1.233182, 1.313407, -1.198163, 1, 0.6784314, 0, 1,
-1.232176, 2.005297, -1.369343, 1, 0.682353, 0, 1,
-1.2271, 0.6697006, -2.771327, 1, 0.6901961, 0, 1,
-1.225982, -3.133041, -2.121092, 1, 0.6941177, 0, 1,
-1.225203, -0.229984, -1.329994, 1, 0.7019608, 0, 1,
-1.220054, 0.4314752, -0.5528728, 1, 0.7098039, 0, 1,
-1.216418, 0.02673282, -0.3716442, 1, 0.7137255, 0, 1,
-1.214991, -2.747836, -1.415738, 1, 0.7215686, 0, 1,
-1.213752, -0.5568919, -2.317079, 1, 0.7254902, 0, 1,
-1.199408, -1.001083, -2.650481, 1, 0.7333333, 0, 1,
-1.191218, -0.308651, -1.080163, 1, 0.7372549, 0, 1,
-1.18269, -0.01092767, -0.7343069, 1, 0.7450981, 0, 1,
-1.181529, -1.002594, -3.359265, 1, 0.7490196, 0, 1,
-1.18075, -0.5506722, -1.814183, 1, 0.7568628, 0, 1,
-1.180546, 0.7487971, 0.5704265, 1, 0.7607843, 0, 1,
-1.179857, -1.979914, -2.610178, 1, 0.7686275, 0, 1,
-1.177474, -0.5264227, -2.31368, 1, 0.772549, 0, 1,
-1.172382, -1.388958, -3.275088, 1, 0.7803922, 0, 1,
-1.171827, -0.9210075, -0.4424777, 1, 0.7843137, 0, 1,
-1.160686, -1.200009, -0.6310306, 1, 0.7921569, 0, 1,
-1.160353, 0.8651717, -0.9040036, 1, 0.7960784, 0, 1,
-1.158578, -2.752577, -3.178, 1, 0.8039216, 0, 1,
-1.154159, -1.214451, -4.017266, 1, 0.8117647, 0, 1,
-1.153636, 0.7081787, 0.4761736, 1, 0.8156863, 0, 1,
-1.145008, -0.9695151, -2.156708, 1, 0.8235294, 0, 1,
-1.14251, -0.1668493, -1.659818, 1, 0.827451, 0, 1,
-1.123451, 1.798492, -1.62166, 1, 0.8352941, 0, 1,
-1.120546, -1.861299, -3.157775, 1, 0.8392157, 0, 1,
-1.103677, -2.180353, -2.61098, 1, 0.8470588, 0, 1,
-1.101099, -0.4720564, -2.207942, 1, 0.8509804, 0, 1,
-1.097261, 0.5335593, -1.495635, 1, 0.8588235, 0, 1,
-1.096545, -0.5949426, -2.666179, 1, 0.8627451, 0, 1,
-1.094348, 1.301865, -0.5380604, 1, 0.8705882, 0, 1,
-1.089797, -0.7774618, -1.446092, 1, 0.8745098, 0, 1,
-1.080225, -1.184358, -1.552315, 1, 0.8823529, 0, 1,
-1.073915, -0.08895317, -1.447438, 1, 0.8862745, 0, 1,
-1.067641, -1.497575, -1.641939, 1, 0.8941177, 0, 1,
-1.065237, -0.2186286, -2.386333, 1, 0.8980392, 0, 1,
-1.058299, -1.13401, -1.592289, 1, 0.9058824, 0, 1,
-1.052799, -0.8378165, -1.455234, 1, 0.9137255, 0, 1,
-1.05083, 0.1881947, -0.9928718, 1, 0.9176471, 0, 1,
-1.047738, 1.137025, -1.499023, 1, 0.9254902, 0, 1,
-1.04543, -0.6137284, -2.475784, 1, 0.9294118, 0, 1,
-1.04437, -0.9750911, -3.420687, 1, 0.9372549, 0, 1,
-1.033699, -0.8451174, -2.717268, 1, 0.9411765, 0, 1,
-1.030244, 0.1277629, 0.1670426, 1, 0.9490196, 0, 1,
-1.02207, 0.4878569, -0.958021, 1, 0.9529412, 0, 1,
-1.013582, 1.739249, 0.3634911, 1, 0.9607843, 0, 1,
-1.011744, 1.880805, -0.9440846, 1, 0.9647059, 0, 1,
-1.006168, -0.9400127, -0.9391416, 1, 0.972549, 0, 1,
-1.004158, 1.198214, -0.1780956, 1, 0.9764706, 0, 1,
-1.002111, -0.5231885, -0.4590793, 1, 0.9843137, 0, 1,
-1.001928, -1.067059, -2.268753, 1, 0.9882353, 0, 1,
-0.9971093, 0.8429213, -0.899793, 1, 0.9960784, 0, 1,
-0.9963867, 0.08614519, -1.55364, 0.9960784, 1, 0, 1,
-0.9916412, -0.4895717, -1.400832, 0.9921569, 1, 0, 1,
-0.9870478, -2.345539, -3.270346, 0.9843137, 1, 0, 1,
-0.9868379, 0.4927735, -0.168203, 0.9803922, 1, 0, 1,
-0.986454, 0.2884444, -2.062182, 0.972549, 1, 0, 1,
-0.9707307, 1.555557, 0.7132993, 0.9686275, 1, 0, 1,
-0.9696734, 0.17961, -0.899851, 0.9607843, 1, 0, 1,
-0.9696268, 0.3137418, -1.77098, 0.9568627, 1, 0, 1,
-0.9640287, -0.5264037, -3.196421, 0.9490196, 1, 0, 1,
-0.9636321, 1.064376, -1.063586, 0.945098, 1, 0, 1,
-0.9530548, -2.367041, -2.854764, 0.9372549, 1, 0, 1,
-0.9521342, 0.2511262, -1.840401, 0.9333333, 1, 0, 1,
-0.9501873, -0.3684285, -1.166437, 0.9254902, 1, 0, 1,
-0.9421492, -1.70081, -2.61481, 0.9215686, 1, 0, 1,
-0.9302123, -1.316576, -1.299756, 0.9137255, 1, 0, 1,
-0.9206797, -0.2460229, -2.911279, 0.9098039, 1, 0, 1,
-0.9101433, -1.641224, -3.920633, 0.9019608, 1, 0, 1,
-0.9098699, -0.7300128, -2.116141, 0.8941177, 1, 0, 1,
-0.9037733, -0.9634284, -2.698217, 0.8901961, 1, 0, 1,
-0.9007124, 1.188144, 0.2016945, 0.8823529, 1, 0, 1,
-0.8996543, 2.027184, -1.42372, 0.8784314, 1, 0, 1,
-0.8961143, -0.8113078, -2.26145, 0.8705882, 1, 0, 1,
-0.8861216, -1.903382, -2.905286, 0.8666667, 1, 0, 1,
-0.8808421, 0.03019699, -2.777505, 0.8588235, 1, 0, 1,
-0.8798388, 1.246661, -1.411266, 0.854902, 1, 0, 1,
-0.8795237, 0.04865273, -0.3360368, 0.8470588, 1, 0, 1,
-0.8751066, 2.598435, 1.304402, 0.8431373, 1, 0, 1,
-0.8724837, -0.4626439, -2.223835, 0.8352941, 1, 0, 1,
-0.8718569, -1.821387, -3.578659, 0.8313726, 1, 0, 1,
-0.8709745, 2.130796, -0.6541327, 0.8235294, 1, 0, 1,
-0.8679118, 0.7288305, -2.325554, 0.8196079, 1, 0, 1,
-0.8678308, -0.8188227, -2.048672, 0.8117647, 1, 0, 1,
-0.8618428, 0.1723275, -2.820947, 0.8078431, 1, 0, 1,
-0.858124, 1.431308, -0.05866723, 0.8, 1, 0, 1,
-0.8520242, -0.475003, -1.746258, 0.7921569, 1, 0, 1,
-0.849539, 1.119658, 0.1016308, 0.7882353, 1, 0, 1,
-0.8396475, -0.2199648, -1.125091, 0.7803922, 1, 0, 1,
-0.8395126, 0.2590069, -0.210159, 0.7764706, 1, 0, 1,
-0.8374012, 0.144848, -2.278545, 0.7686275, 1, 0, 1,
-0.8348955, 0.07623416, -2.073128, 0.7647059, 1, 0, 1,
-0.8339618, -1.626096, -0.7080355, 0.7568628, 1, 0, 1,
-0.826393, 1.339349, -0.488623, 0.7529412, 1, 0, 1,
-0.8224794, -0.1071582, -2.173002, 0.7450981, 1, 0, 1,
-0.8174698, -1.011096, -2.095995, 0.7411765, 1, 0, 1,
-0.8149307, 0.1336326, -2.248301, 0.7333333, 1, 0, 1,
-0.8147426, -0.236687, -2.344087, 0.7294118, 1, 0, 1,
-0.8101282, -0.9497839, -0.5659602, 0.7215686, 1, 0, 1,
-0.8060284, 0.3627078, -0.4399543, 0.7176471, 1, 0, 1,
-0.8027865, -1.658136, -1.069808, 0.7098039, 1, 0, 1,
-0.7973462, -0.9178728, -3.545764, 0.7058824, 1, 0, 1,
-0.7971873, 0.4271733, -1.575605, 0.6980392, 1, 0, 1,
-0.7960214, 2.038792, -0.6540822, 0.6901961, 1, 0, 1,
-0.7795538, -1.702161, -0.6547718, 0.6862745, 1, 0, 1,
-0.7780007, 1.814242, 0.1606676, 0.6784314, 1, 0, 1,
-0.7765679, 0.9234734, -2.264229, 0.6745098, 1, 0, 1,
-0.7748742, 1.349591, 0.3896495, 0.6666667, 1, 0, 1,
-0.7725348, -1.869979, -2.409119, 0.6627451, 1, 0, 1,
-0.771327, -0.7351445, -1.939774, 0.654902, 1, 0, 1,
-0.7664855, 0.682297, 0.4577251, 0.6509804, 1, 0, 1,
-0.7605987, 1.137062, -1.05221, 0.6431373, 1, 0, 1,
-0.7538444, -1.762781, -3.527417, 0.6392157, 1, 0, 1,
-0.7483004, -0.1799023, -2.255223, 0.6313726, 1, 0, 1,
-0.7466539, 0.08346223, -3.115257, 0.627451, 1, 0, 1,
-0.7455066, 0.531046, -1.538042, 0.6196079, 1, 0, 1,
-0.7378827, 2.057857, -0.8783835, 0.6156863, 1, 0, 1,
-0.7357226, 1.706797, -0.4146239, 0.6078432, 1, 0, 1,
-0.7340956, -0.04018654, -2.409291, 0.6039216, 1, 0, 1,
-0.7272354, 1.461972, 0.2944744, 0.5960785, 1, 0, 1,
-0.7265123, -0.1924075, -2.508003, 0.5882353, 1, 0, 1,
-0.7262037, -0.1922214, -1.415588, 0.5843138, 1, 0, 1,
-0.7197545, 0.1844018, -1.570434, 0.5764706, 1, 0, 1,
-0.7138079, -1.996874, -3.740221, 0.572549, 1, 0, 1,
-0.7108314, 0.5408576, -0.4082484, 0.5647059, 1, 0, 1,
-0.7047976, -0.0041886, -1.261766, 0.5607843, 1, 0, 1,
-0.7032979, -0.1112715, -1.097836, 0.5529412, 1, 0, 1,
-0.7016432, -0.01381546, -1.182669, 0.5490196, 1, 0, 1,
-0.6926909, -0.5383977, -2.255338, 0.5411765, 1, 0, 1,
-0.68932, 0.5071114, -1.263448, 0.5372549, 1, 0, 1,
-0.6837835, -0.1137321, -1.527056, 0.5294118, 1, 0, 1,
-0.6823931, 0.7641151, -0.3664628, 0.5254902, 1, 0, 1,
-0.6795754, -1.459321, -2.532134, 0.5176471, 1, 0, 1,
-0.6765868, -0.5775315, -0.8072233, 0.5137255, 1, 0, 1,
-0.6719331, 0.9715851, 0.1955223, 0.5058824, 1, 0, 1,
-0.6612066, 1.049358, 0.3492498, 0.5019608, 1, 0, 1,
-0.6558743, -1.089897, -1.554076, 0.4941176, 1, 0, 1,
-0.6512329, -0.1559376, -0.4893309, 0.4862745, 1, 0, 1,
-0.6493179, -1.362652, -2.466493, 0.4823529, 1, 0, 1,
-0.6480598, -0.1022544, -3.151037, 0.4745098, 1, 0, 1,
-0.64241, -0.04000402, -1.158823, 0.4705882, 1, 0, 1,
-0.6417263, -0.7118925, -1.628499, 0.4627451, 1, 0, 1,
-0.6338691, -0.3516349, -1.196435, 0.4588235, 1, 0, 1,
-0.632556, 1.04251, 1.772818, 0.4509804, 1, 0, 1,
-0.6267083, -1.64533, -2.421157, 0.4470588, 1, 0, 1,
-0.6221928, -0.01277202, -0.8731766, 0.4392157, 1, 0, 1,
-0.6215848, 1.078284, -2.216965, 0.4352941, 1, 0, 1,
-0.6189308, 1.434801, -0.8689621, 0.427451, 1, 0, 1,
-0.6061799, -0.4707981, -1.255367, 0.4235294, 1, 0, 1,
-0.5901313, -0.05040973, -3.333641, 0.4156863, 1, 0, 1,
-0.5866194, 0.03672536, -3.165395, 0.4117647, 1, 0, 1,
-0.5842904, 0.1843596, -2.216314, 0.4039216, 1, 0, 1,
-0.5835122, -0.3771209, -1.71575, 0.3960784, 1, 0, 1,
-0.5820836, 0.01681723, -2.819827, 0.3921569, 1, 0, 1,
-0.5818388, 1.294167, -2.218366, 0.3843137, 1, 0, 1,
-0.5794446, -0.2330471, -1.208127, 0.3803922, 1, 0, 1,
-0.5774924, -0.1320502, -2.691477, 0.372549, 1, 0, 1,
-0.5755421, 0.262935, -0.9754714, 0.3686275, 1, 0, 1,
-0.5740636, 1.389835, 0.911447, 0.3607843, 1, 0, 1,
-0.5737253, 1.05403, -1.276456, 0.3568628, 1, 0, 1,
-0.5733668, 0.4397268, -0.8519183, 0.3490196, 1, 0, 1,
-0.5714359, -0.2567609, -1.755956, 0.345098, 1, 0, 1,
-0.5675403, 0.5978004, -1.439223, 0.3372549, 1, 0, 1,
-0.5667382, -0.5424142, -3.570064, 0.3333333, 1, 0, 1,
-0.5606143, -0.7018045, -1.247029, 0.3254902, 1, 0, 1,
-0.5592083, -1.570889, -2.108682, 0.3215686, 1, 0, 1,
-0.5588655, 0.1402713, -1.106631, 0.3137255, 1, 0, 1,
-0.5573701, 0.526788, 0.5075426, 0.3098039, 1, 0, 1,
-0.5566214, 2.96183, 0.3488672, 0.3019608, 1, 0, 1,
-0.5512646, -1.19944, -3.36248, 0.2941177, 1, 0, 1,
-0.5434676, -0.4105791, -1.772463, 0.2901961, 1, 0, 1,
-0.5415375, -0.2370349, -0.8822204, 0.282353, 1, 0, 1,
-0.5343671, 0.8788044, -0.01466447, 0.2784314, 1, 0, 1,
-0.5331531, 0.7146792, -1.571163, 0.2705882, 1, 0, 1,
-0.5308719, -0.5200632, -4.054354, 0.2666667, 1, 0, 1,
-0.52347, -1.275901, -1.368845, 0.2588235, 1, 0, 1,
-0.5204357, -0.2799741, -4.057889, 0.254902, 1, 0, 1,
-0.5077714, -1.674325, -1.751438, 0.2470588, 1, 0, 1,
-0.5074289, -0.476583, -2.873281, 0.2431373, 1, 0, 1,
-0.5045196, 0.790894, -2.272589, 0.2352941, 1, 0, 1,
-0.5021556, 0.4522963, -2.095859, 0.2313726, 1, 0, 1,
-0.5010247, 0.8091609, 1.650991, 0.2235294, 1, 0, 1,
-0.4985654, -1.042216, -2.425436, 0.2196078, 1, 0, 1,
-0.4937522, 1.623497, 0.6792242, 0.2117647, 1, 0, 1,
-0.4921089, -0.6654891, -2.893778, 0.2078431, 1, 0, 1,
-0.4919771, -0.1348282, -1.578951, 0.2, 1, 0, 1,
-0.4872362, -1.918018, -1.966392, 0.1921569, 1, 0, 1,
-0.4821965, -0.918352, -1.563875, 0.1882353, 1, 0, 1,
-0.4752057, 1.122864, -1.546162, 0.1803922, 1, 0, 1,
-0.474082, 0.267808, -2.772575, 0.1764706, 1, 0, 1,
-0.4727379, -0.1131412, -2.317211, 0.1686275, 1, 0, 1,
-0.4714656, 0.7077282, -1.077494, 0.1647059, 1, 0, 1,
-0.4681585, -1.026328, -1.27461, 0.1568628, 1, 0, 1,
-0.4674371, 0.5443775, -0.1108964, 0.1529412, 1, 0, 1,
-0.4650634, 1.828449, 0.3451906, 0.145098, 1, 0, 1,
-0.4646268, 1.293413, 0.9520883, 0.1411765, 1, 0, 1,
-0.4628124, -0.3422646, -2.911532, 0.1333333, 1, 0, 1,
-0.4595129, 1.276936, 0.5417442, 0.1294118, 1, 0, 1,
-0.450153, -1.561112, -4.612067, 0.1215686, 1, 0, 1,
-0.4488521, 1.262621, 0.7929949, 0.1176471, 1, 0, 1,
-0.4466074, -1.574603, -3.599906, 0.1098039, 1, 0, 1,
-0.4458725, 0.09981927, -1.542549, 0.1058824, 1, 0, 1,
-0.4429999, 0.3568137, -0.01731697, 0.09803922, 1, 0, 1,
-0.4423034, -1.148228, -1.928975, 0.09019608, 1, 0, 1,
-0.4414641, -1.786265, -3.070055, 0.08627451, 1, 0, 1,
-0.440483, 0.9216264, 0.3647228, 0.07843138, 1, 0, 1,
-0.4389926, -1.387632, -3.532286, 0.07450981, 1, 0, 1,
-0.43766, 0.7846234, 0.967699, 0.06666667, 1, 0, 1,
-0.4330793, 0.09842622, -3.088542, 0.0627451, 1, 0, 1,
-0.4329079, -0.4111625, -0.9191254, 0.05490196, 1, 0, 1,
-0.4259166, 0.8828275, -1.31577, 0.05098039, 1, 0, 1,
-0.4255303, 1.268693, -1.482444, 0.04313726, 1, 0, 1,
-0.4152271, -2.832109, -2.609326, 0.03921569, 1, 0, 1,
-0.4148595, -0.05329098, -1.332767, 0.03137255, 1, 0, 1,
-0.413089, -0.3074812, -0.8521892, 0.02745098, 1, 0, 1,
-0.4090126, 0.4550458, -0.825486, 0.01960784, 1, 0, 1,
-0.407643, -1.64193, -3.8737, 0.01568628, 1, 0, 1,
-0.4063485, 0.5537301, -0.9597508, 0.007843138, 1, 0, 1,
-0.4062584, 1.331003, 0.5402468, 0.003921569, 1, 0, 1,
-0.4058367, 0.2820189, -0.4240294, 0, 1, 0.003921569, 1,
-0.4026163, 0.173098, 0.5649985, 0, 1, 0.01176471, 1,
-0.4005373, -1.568157, -4.163838, 0, 1, 0.01568628, 1,
-0.3999292, -1.67459, -2.015429, 0, 1, 0.02352941, 1,
-0.3962335, 0.519729, -1.54789, 0, 1, 0.02745098, 1,
-0.3933641, 0.4272841, -0.3074575, 0, 1, 0.03529412, 1,
-0.38648, 2.007454, -0.08730149, 0, 1, 0.03921569, 1,
-0.3826992, 0.229645, -2.200225, 0, 1, 0.04705882, 1,
-0.3788136, -0.09199791, 0.3920459, 0, 1, 0.05098039, 1,
-0.3726023, -0.3625636, -2.244921, 0, 1, 0.05882353, 1,
-0.3694406, 0.5612471, -1.532951, 0, 1, 0.0627451, 1,
-0.3673063, 0.1985079, -1.494749, 0, 1, 0.07058824, 1,
-0.3672788, -0.7640134, -4.666815, 0, 1, 0.07450981, 1,
-0.3664306, 2.004937, -1.564071, 0, 1, 0.08235294, 1,
-0.3662449, -0.7571967, -1.495886, 0, 1, 0.08627451, 1,
-0.3658185, -0.2889992, -2.37207, 0, 1, 0.09411765, 1,
-0.3634081, 1.197561, -0.357282, 0, 1, 0.1019608, 1,
-0.3622535, -0.5512647, -1.900546, 0, 1, 0.1058824, 1,
-0.3611331, 0.7602358, 0.735706, 0, 1, 0.1137255, 1,
-0.3586358, -0.4601021, -3.01655, 0, 1, 0.1176471, 1,
-0.3558799, 0.7299606, 0.4667057, 0, 1, 0.1254902, 1,
-0.3497032, -1.351525, -4.393905, 0, 1, 0.1294118, 1,
-0.3479461, -0.1617887, -2.944198, 0, 1, 0.1372549, 1,
-0.3451557, -1.060561, -3.06743, 0, 1, 0.1411765, 1,
-0.343366, -0.7892979, -3.281315, 0, 1, 0.1490196, 1,
-0.3408983, 0.5592266, 0.2429335, 0, 1, 0.1529412, 1,
-0.336069, -0.3295677, -3.156892, 0, 1, 0.1607843, 1,
-0.3337825, 1.30825, 0.3122834, 0, 1, 0.1647059, 1,
-0.3334356, -0.1368197, -0.8486215, 0, 1, 0.172549, 1,
-0.3315399, 0.5344764, -1.799064, 0, 1, 0.1764706, 1,
-0.3307133, -0.6991765, -3.565043, 0, 1, 0.1843137, 1,
-0.3304167, 0.6136461, -2.196778, 0, 1, 0.1882353, 1,
-0.3302835, -0.4431105, -2.275383, 0, 1, 0.1960784, 1,
-0.3296604, 0.4504593, -1.431026, 0, 1, 0.2039216, 1,
-0.3243714, 0.5163956, 0.6896191, 0, 1, 0.2078431, 1,
-0.324206, 0.2766768, -0.6826851, 0, 1, 0.2156863, 1,
-0.3236286, -0.2910746, -3.449791, 0, 1, 0.2196078, 1,
-0.3214397, -1.395128, -3.787991, 0, 1, 0.227451, 1,
-0.3133465, -1.453508, -2.747995, 0, 1, 0.2313726, 1,
-0.3127883, 1.339931, 0.8750628, 0, 1, 0.2392157, 1,
-0.3096568, 0.5876668, -0.6217421, 0, 1, 0.2431373, 1,
-0.3078125, -0.1784519, -4.171872, 0, 1, 0.2509804, 1,
-0.307158, -0.04216547, -1.792596, 0, 1, 0.254902, 1,
-0.305034, -0.8066711, -3.625786, 0, 1, 0.2627451, 1,
-0.3041651, 0.07082718, -2.821717, 0, 1, 0.2666667, 1,
-0.3029311, -0.7276349, -3.072253, 0, 1, 0.2745098, 1,
-0.302918, 1.921806, 1.274231, 0, 1, 0.2784314, 1,
-0.2991588, -0.793813, -2.330152, 0, 1, 0.2862745, 1,
-0.2950777, 0.703629, 0.1424392, 0, 1, 0.2901961, 1,
-0.294632, -2.23667, -3.173154, 0, 1, 0.2980392, 1,
-0.2934731, -0.5020763, -3.22908, 0, 1, 0.3058824, 1,
-0.2925703, 1.139399, -0.6723359, 0, 1, 0.3098039, 1,
-0.2881242, 1.365369, 0.8682439, 0, 1, 0.3176471, 1,
-0.2854609, -1.100377, -3.352724, 0, 1, 0.3215686, 1,
-0.2804782, 1.484066, 0.05080905, 0, 1, 0.3294118, 1,
-0.2790312, -0.4118991, -3.417621, 0, 1, 0.3333333, 1,
-0.2770271, 1.020487, -0.07190094, 0, 1, 0.3411765, 1,
-0.2756974, -0.953543, -2.862167, 0, 1, 0.345098, 1,
-0.2748658, -0.07589307, -2.633395, 0, 1, 0.3529412, 1,
-0.2745436, -0.6055207, -3.066206, 0, 1, 0.3568628, 1,
-0.2734561, 0.3803587, -1.034585, 0, 1, 0.3647059, 1,
-0.2700203, 1.484544, 0.3953442, 0, 1, 0.3686275, 1,
-0.2673682, -0.2991389, -3.239484, 0, 1, 0.3764706, 1,
-0.2648293, 0.2256993, -0.5980436, 0, 1, 0.3803922, 1,
-0.264366, -1.090888, -2.26493, 0, 1, 0.3882353, 1,
-0.2617863, -0.2649406, -2.038131, 0, 1, 0.3921569, 1,
-0.2559414, 0.3475348, -1.250953, 0, 1, 0.4, 1,
-0.2547913, -0.2522312, -2.022677, 0, 1, 0.4078431, 1,
-0.2539031, -0.04455513, -2.252341, 0, 1, 0.4117647, 1,
-0.2536125, -1.507393, -0.7733285, 0, 1, 0.4196078, 1,
-0.2491425, 0.6240593, -0.8402253, 0, 1, 0.4235294, 1,
-0.2470427, -0.03954631, -4.122331, 0, 1, 0.4313726, 1,
-0.2464437, -2.432155, -3.286103, 0, 1, 0.4352941, 1,
-0.2369419, -1.816533, -3.345044, 0, 1, 0.4431373, 1,
-0.2339188, -0.8704066, -1.885184, 0, 1, 0.4470588, 1,
-0.2246093, -1.091312, -2.980488, 0, 1, 0.454902, 1,
-0.2238417, -0.6869584, -2.457457, 0, 1, 0.4588235, 1,
-0.2232779, -0.154385, -0.7399684, 0, 1, 0.4666667, 1,
-0.2216559, 0.8844042, -1.284434, 0, 1, 0.4705882, 1,
-0.2204508, -0.5211911, -1.48697, 0, 1, 0.4784314, 1,
-0.217939, 0.6966355, 0.5774839, 0, 1, 0.4823529, 1,
-0.2174469, 0.8882118, 0.6743191, 0, 1, 0.4901961, 1,
-0.2156451, -1.007468, -1.195326, 0, 1, 0.4941176, 1,
-0.2141727, -1.676436, -2.594093, 0, 1, 0.5019608, 1,
-0.2133238, 1.007114, -0.4553538, 0, 1, 0.509804, 1,
-0.2117834, -0.8097559, -4.06532, 0, 1, 0.5137255, 1,
-0.1905603, -0.05097387, -3.494229, 0, 1, 0.5215687, 1,
-0.1897481, -0.6624295, -3.275799, 0, 1, 0.5254902, 1,
-0.1893911, 0.03994041, -1.726188, 0, 1, 0.5333334, 1,
-0.1861537, 0.1812739, -1.728982, 0, 1, 0.5372549, 1,
-0.1845982, 1.055858, -0.07190116, 0, 1, 0.5450981, 1,
-0.1820639, 0.4077997, -1.208562, 0, 1, 0.5490196, 1,
-0.174777, -0.008182365, -3.574237, 0, 1, 0.5568628, 1,
-0.1746826, 1.574681, 1.203226, 0, 1, 0.5607843, 1,
-0.1719227, -1.444653, -3.415652, 0, 1, 0.5686275, 1,
-0.1716965, -0.7477545, -1.882401, 0, 1, 0.572549, 1,
-0.167752, -0.8216901, -3.609359, 0, 1, 0.5803922, 1,
-0.1654207, -0.6828611, -5.397588, 0, 1, 0.5843138, 1,
-0.1619303, -0.6972073, -3.021082, 0, 1, 0.5921569, 1,
-0.1578703, 0.7311482, 0.01895309, 0, 1, 0.5960785, 1,
-0.1576674, -0.13568, -3.005732, 0, 1, 0.6039216, 1,
-0.1568785, -0.1980542, -6.076288, 0, 1, 0.6117647, 1,
-0.1558623, -0.2479575, -2.261468, 0, 1, 0.6156863, 1,
-0.1554008, 2.343133, 0.7983284, 0, 1, 0.6235294, 1,
-0.1541813, 0.1621025, 0.2504821, 0, 1, 0.627451, 1,
-0.153867, -0.4226804, -1.745674, 0, 1, 0.6352941, 1,
-0.1529059, -1.398624, -2.436077, 0, 1, 0.6392157, 1,
-0.1445228, -1.237438, -2.897485, 0, 1, 0.6470588, 1,
-0.1422106, -1.175524, -3.429402, 0, 1, 0.6509804, 1,
-0.1414656, -0.7236322, -3.780388, 0, 1, 0.6588235, 1,
-0.1402397, -0.1442255, -2.07678, 0, 1, 0.6627451, 1,
-0.1388032, 0.3336321, -0.2312875, 0, 1, 0.6705883, 1,
-0.1338475, -0.3567806, -4.233991, 0, 1, 0.6745098, 1,
-0.1323708, 0.1911594, -1.38898, 0, 1, 0.682353, 1,
-0.1302509, 2.600836, 0.6799201, 0, 1, 0.6862745, 1,
-0.1270583, 0.4197689, -0.8915664, 0, 1, 0.6941177, 1,
-0.1201585, 0.6760309, -1.350722, 0, 1, 0.7019608, 1,
-0.1201015, 2.037215, 1.425061, 0, 1, 0.7058824, 1,
-0.1182796, -1.538218, -0.9545768, 0, 1, 0.7137255, 1,
-0.1175737, -1.281887, -2.923856, 0, 1, 0.7176471, 1,
-0.1174248, -1.388686, -2.606085, 0, 1, 0.7254902, 1,
-0.1170844, 0.9580044, -0.05164805, 0, 1, 0.7294118, 1,
-0.1100723, 1.344538, 0.8518176, 0, 1, 0.7372549, 1,
-0.1072197, -1.787053, -3.237825, 0, 1, 0.7411765, 1,
-0.1064544, 0.7557802, 0.1535034, 0, 1, 0.7490196, 1,
-0.105365, -1.85388, -2.982856, 0, 1, 0.7529412, 1,
-0.1011969, -1.203745, -4.86053, 0, 1, 0.7607843, 1,
-0.1006726, 1.635144, -1.049159, 0, 1, 0.7647059, 1,
-0.09760876, 0.2632334, -2.333836, 0, 1, 0.772549, 1,
-0.09736105, -2.388175, -4.644525, 0, 1, 0.7764706, 1,
-0.09550487, -0.02766341, 0.08486039, 0, 1, 0.7843137, 1,
-0.09136655, 1.531256, -0.5497159, 0, 1, 0.7882353, 1,
-0.09083442, 0.357199, 0.04929001, 0, 1, 0.7960784, 1,
-0.08880004, 0.4039737, 0.09651807, 0, 1, 0.8039216, 1,
-0.08166515, 1.135909, -0.06915702, 0, 1, 0.8078431, 1,
-0.07859676, 1.342039, -1.129327, 0, 1, 0.8156863, 1,
-0.07713412, 1.592374, -0.003454013, 0, 1, 0.8196079, 1,
-0.07406325, 1.427609, -0.4542355, 0, 1, 0.827451, 1,
-0.07121284, 0.05017301, -0.5107611, 0, 1, 0.8313726, 1,
-0.06835777, 1.832192, -0.103478, 0, 1, 0.8392157, 1,
-0.06773061, -0.6350475, -1.727917, 0, 1, 0.8431373, 1,
-0.06644313, -1.135945, -5.487064, 0, 1, 0.8509804, 1,
-0.05564457, 1.505541, -0.7487996, 0, 1, 0.854902, 1,
-0.05526765, 0.7044148, -0.6052194, 0, 1, 0.8627451, 1,
-0.05493302, -1.287654, -5.003605, 0, 1, 0.8666667, 1,
-0.05373391, 0.8439801, -0.2878935, 0, 1, 0.8745098, 1,
-0.05360027, -0.2641461, -3.676316, 0, 1, 0.8784314, 1,
-0.04523977, -1.774947, -3.936662, 0, 1, 0.8862745, 1,
-0.04502277, -0.1385029, -2.127943, 0, 1, 0.8901961, 1,
-0.04213925, 0.1029277, 0.6122112, 0, 1, 0.8980392, 1,
-0.03836845, 0.9621009, -0.08924945, 0, 1, 0.9058824, 1,
-0.03617469, -1.10605, -3.874216, 0, 1, 0.9098039, 1,
-0.03415201, -0.241765, -0.8478743, 0, 1, 0.9176471, 1,
-0.03294615, 0.3666201, -0.9294043, 0, 1, 0.9215686, 1,
-0.02842934, -0.5626618, -4.024011, 0, 1, 0.9294118, 1,
-0.02585196, 0.04392036, -0.4147999, 0, 1, 0.9333333, 1,
-0.02460316, -0.4398172, -2.425942, 0, 1, 0.9411765, 1,
-0.02215517, 0.1740378, -0.2423827, 0, 1, 0.945098, 1,
-0.01973403, 0.414003, 2.298383, 0, 1, 0.9529412, 1,
-0.01417506, 0.3463204, 1.361131, 0, 1, 0.9568627, 1,
-0.01367503, -0.2996811, -0.9627099, 0, 1, 0.9647059, 1,
-0.009968069, 0.7938683, -0.1449537, 0, 1, 0.9686275, 1,
-0.002361505, -1.058887, -2.373359, 0, 1, 0.9764706, 1,
0.0006302026, 1.075956, -0.7418122, 0, 1, 0.9803922, 1,
0.001883653, -0.6830977, 4.991338, 0, 1, 0.9882353, 1,
0.00270466, -1.80971, 2.640642, 0, 1, 0.9921569, 1,
0.01415014, -1.040328, 2.69104, 0, 1, 1, 1,
0.01767051, 0.6024123, -0.369161, 0, 0.9921569, 1, 1,
0.02373466, 0.860269, -0.8780872, 0, 0.9882353, 1, 1,
0.02409542, -1.242982, 2.487958, 0, 0.9803922, 1, 1,
0.02542592, 0.7529818, 0.8822879, 0, 0.9764706, 1, 1,
0.02847613, -1.736903, 3.713423, 0, 0.9686275, 1, 1,
0.03651816, -0.9555104, 3.468524, 0, 0.9647059, 1, 1,
0.04005671, -0.8133659, 3.107659, 0, 0.9568627, 1, 1,
0.04113746, 0.660419, 0.01946287, 0, 0.9529412, 1, 1,
0.04393172, 0.6379203, 1.734232, 0, 0.945098, 1, 1,
0.04473538, -0.1667642, 4.633882, 0, 0.9411765, 1, 1,
0.04622702, 0.2132592, -0.4419619, 0, 0.9333333, 1, 1,
0.05084995, -1.102089, 4.018313, 0, 0.9294118, 1, 1,
0.0599318, 1.42128, 1.140983, 0, 0.9215686, 1, 1,
0.06171092, -0.6282661, 3.611296, 0, 0.9176471, 1, 1,
0.06204261, -1.319594, 3.376224, 0, 0.9098039, 1, 1,
0.06237399, 0.04393221, 1.438515, 0, 0.9058824, 1, 1,
0.06478212, -1.121105, 3.849344, 0, 0.8980392, 1, 1,
0.06777047, 0.4053571, 0.3258567, 0, 0.8901961, 1, 1,
0.06814378, 0.565925, 1.431151, 0, 0.8862745, 1, 1,
0.07158063, 0.1223136, 0.3064536, 0, 0.8784314, 1, 1,
0.07635966, 1.071637, 1.156002, 0, 0.8745098, 1, 1,
0.08061905, -0.07805284, 1.342902, 0, 0.8666667, 1, 1,
0.0862895, 0.5366965, 0.3687307, 0, 0.8627451, 1, 1,
0.08821747, -0.04652251, 1.727666, 0, 0.854902, 1, 1,
0.08926003, -0.6387359, 3.9536, 0, 0.8509804, 1, 1,
0.09033737, -0.3775284, 2.901022, 0, 0.8431373, 1, 1,
0.09334405, -0.4250161, 3.681366, 0, 0.8392157, 1, 1,
0.09367097, -0.08803876, 3.103106, 0, 0.8313726, 1, 1,
0.09383689, 0.884689, 0.204856, 0, 0.827451, 1, 1,
0.09531343, 1.098907, 0.7197829, 0, 0.8196079, 1, 1,
0.09671363, 1.074515, 0.9442568, 0, 0.8156863, 1, 1,
0.0967496, 1.428355, 0.5064783, 0, 0.8078431, 1, 1,
0.0980106, -0.6667879, 3.65268, 0, 0.8039216, 1, 1,
0.1045457, -1.256114, 0.6529373, 0, 0.7960784, 1, 1,
0.1062124, 0.8975092, 0.839109, 0, 0.7882353, 1, 1,
0.1080274, -0.877179, 4.607761, 0, 0.7843137, 1, 1,
0.1086333, -0.2506061, 1.67624, 0, 0.7764706, 1, 1,
0.1143054, -0.1347744, 2.315251, 0, 0.772549, 1, 1,
0.1162395, -1.815054, 2.167316, 0, 0.7647059, 1, 1,
0.1190311, 1.018185, 0.2774622, 0, 0.7607843, 1, 1,
0.119199, -0.6905879, 2.441667, 0, 0.7529412, 1, 1,
0.1212406, 1.230289, 0.7891467, 0, 0.7490196, 1, 1,
0.1285411, -0.5539508, 1.540186, 0, 0.7411765, 1, 1,
0.1296154, 2.163468, -0.9913671, 0, 0.7372549, 1, 1,
0.1385763, -0.3713121, 2.872931, 0, 0.7294118, 1, 1,
0.1399165, -0.4066191, 2.099939, 0, 0.7254902, 1, 1,
0.1420201, -1.549865, 3.006687, 0, 0.7176471, 1, 1,
0.1473601, -0.1308675, 3.087823, 0, 0.7137255, 1, 1,
0.1520502, -0.7620041, 1.999967, 0, 0.7058824, 1, 1,
0.1522055, -1.423984, 2.442832, 0, 0.6980392, 1, 1,
0.1570531, 1.041957, -0.8930073, 0, 0.6941177, 1, 1,
0.1594942, 0.8874703, -0.6587594, 0, 0.6862745, 1, 1,
0.1627614, -0.3266255, 2.23139, 0, 0.682353, 1, 1,
0.1652427, 0.3273677, -0.4984656, 0, 0.6745098, 1, 1,
0.1722598, -1.017602, 3.762817, 0, 0.6705883, 1, 1,
0.1724054, -0.533194, 1.581396, 0, 0.6627451, 1, 1,
0.1741305, -0.5866994, 3.397073, 0, 0.6588235, 1, 1,
0.1751531, 0.5966778, 0.4122788, 0, 0.6509804, 1, 1,
0.1760975, -0.3410566, 1.944916, 0, 0.6470588, 1, 1,
0.1782629, 0.02803102, 2.154026, 0, 0.6392157, 1, 1,
0.1788886, -0.7355094, 2.831323, 0, 0.6352941, 1, 1,
0.1801393, -0.4713953, 2.653768, 0, 0.627451, 1, 1,
0.1823599, 0.5016672, 1.836035, 0, 0.6235294, 1, 1,
0.1847921, 1.106876, -1.32023, 0, 0.6156863, 1, 1,
0.1873401, -0.3862954, 3.716858, 0, 0.6117647, 1, 1,
0.1884792, -0.7000521, 1.302175, 0, 0.6039216, 1, 1,
0.1904893, -0.4416575, 1.339086, 0, 0.5960785, 1, 1,
0.1912126, 1.533374, 0.1596394, 0, 0.5921569, 1, 1,
0.1916547, -0.2190165, 3.268367, 0, 0.5843138, 1, 1,
0.1919838, -0.07233343, 1.977614, 0, 0.5803922, 1, 1,
0.1969391, 0.2211493, -1.641873, 0, 0.572549, 1, 1,
0.1982243, 0.01350957, 1.324391, 0, 0.5686275, 1, 1,
0.203333, 1.312919, 1.181301, 0, 0.5607843, 1, 1,
0.205536, 0.5068432, 1.860571, 0, 0.5568628, 1, 1,
0.2070161, -0.6420217, 4.437295, 0, 0.5490196, 1, 1,
0.2079125, 1.415251, 1.264561, 0, 0.5450981, 1, 1,
0.2085966, -0.8449667, 0.2943131, 0, 0.5372549, 1, 1,
0.2090665, 2.167907, 0.3622869, 0, 0.5333334, 1, 1,
0.209255, 0.698562, -0.543111, 0, 0.5254902, 1, 1,
0.2168891, 0.009776805, 1.071416, 0, 0.5215687, 1, 1,
0.2186436, -0.5881634, 1.297273, 0, 0.5137255, 1, 1,
0.2207358, -0.9168156, 4.821167, 0, 0.509804, 1, 1,
0.2207945, -2.079529, 3.41461, 0, 0.5019608, 1, 1,
0.2207985, 1.506405, 0.343451, 0, 0.4941176, 1, 1,
0.2235428, -0.8364663, 2.221651, 0, 0.4901961, 1, 1,
0.2244127, -2.197812, 2.207009, 0, 0.4823529, 1, 1,
0.2246578, 0.164688, 1.409021, 0, 0.4784314, 1, 1,
0.2336151, 0.2740839, 0.9666712, 0, 0.4705882, 1, 1,
0.2430732, 0.4908528, -1.299528, 0, 0.4666667, 1, 1,
0.2442037, -1.709845, 2.163563, 0, 0.4588235, 1, 1,
0.244826, 1.57533, 0.006451569, 0, 0.454902, 1, 1,
0.2470578, -1.03014, 2.947504, 0, 0.4470588, 1, 1,
0.2470614, -0.4138454, 0.4905939, 0, 0.4431373, 1, 1,
0.248392, -0.008853665, 1.54862, 0, 0.4352941, 1, 1,
0.248759, 0.9498243, -2.39693, 0, 0.4313726, 1, 1,
0.2491045, 2.090587, 0.8003168, 0, 0.4235294, 1, 1,
0.2531406, 0.6984493, 1.638743, 0, 0.4196078, 1, 1,
0.2549175, 0.712583, 1.162097, 0, 0.4117647, 1, 1,
0.2569962, 0.7203795, 0.4616196, 0, 0.4078431, 1, 1,
0.2572959, -0.4545159, 2.115934, 0, 0.4, 1, 1,
0.2582024, -0.592404, 2.344406, 0, 0.3921569, 1, 1,
0.2604249, -0.5304435, 4.060876, 0, 0.3882353, 1, 1,
0.2614789, 0.01425176, 2.754016, 0, 0.3803922, 1, 1,
0.267735, 0.7438601, 0.7986195, 0, 0.3764706, 1, 1,
0.268006, -0.5546461, 0.09504293, 0, 0.3686275, 1, 1,
0.2717498, -0.7458804, 3.353419, 0, 0.3647059, 1, 1,
0.2736134, -0.2612263, 3.990361, 0, 0.3568628, 1, 1,
0.277295, -1.081511, 2.065657, 0, 0.3529412, 1, 1,
0.2784265, -0.8420867, 2.589185, 0, 0.345098, 1, 1,
0.2793249, -1.258584, 2.489187, 0, 0.3411765, 1, 1,
0.2828584, -1.418598, 3.266347, 0, 0.3333333, 1, 1,
0.2830986, -0.2990103, 3.00431, 0, 0.3294118, 1, 1,
0.2864899, 0.8078192, -1.069075, 0, 0.3215686, 1, 1,
0.2870906, 2.138562, -1.425283, 0, 0.3176471, 1, 1,
0.2879928, -0.2442581, 2.401081, 0, 0.3098039, 1, 1,
0.2935745, 0.4223187, 0.09942767, 0, 0.3058824, 1, 1,
0.3030252, 0.2117311, 1.704691, 0, 0.2980392, 1, 1,
0.3030381, -2.89472, 2.960826, 0, 0.2901961, 1, 1,
0.3059779, 0.8335738, 1.128842, 0, 0.2862745, 1, 1,
0.3085835, 1.28229, 1.861118, 0, 0.2784314, 1, 1,
0.3119542, 0.6127003, 0.6682839, 0, 0.2745098, 1, 1,
0.3134041, 0.09948601, 0.8905614, 0, 0.2666667, 1, 1,
0.3141923, 0.6426381, 0.9595539, 0, 0.2627451, 1, 1,
0.3165078, -0.03662394, 1.346548, 0, 0.254902, 1, 1,
0.3194984, 2.235534, 1.141403, 0, 0.2509804, 1, 1,
0.3205932, -0.7944747, 2.075795, 0, 0.2431373, 1, 1,
0.3206927, -1.81287, 2.61165, 0, 0.2392157, 1, 1,
0.3211593, -1.321719, 2.556646, 0, 0.2313726, 1, 1,
0.3261208, 1.282453, -0.05914235, 0, 0.227451, 1, 1,
0.33001, 2.170342, -1.380998, 0, 0.2196078, 1, 1,
0.3310391, 0.342216, 0.5563084, 0, 0.2156863, 1, 1,
0.3319793, -2.656943, 2.783771, 0, 0.2078431, 1, 1,
0.3350403, -1.275451, 3.738039, 0, 0.2039216, 1, 1,
0.3358213, -0.7137029, 1.92928, 0, 0.1960784, 1, 1,
0.3404854, -0.0861733, 2.818439, 0, 0.1882353, 1, 1,
0.3417251, 0.3318114, 2.164491, 0, 0.1843137, 1, 1,
0.346753, -0.8058733, 3.535515, 0, 0.1764706, 1, 1,
0.3471777, -0.3727041, 2.200523, 0, 0.172549, 1, 1,
0.3482154, -0.1788574, 1.748204, 0, 0.1647059, 1, 1,
0.3496006, 0.9702049, 1.133921, 0, 0.1607843, 1, 1,
0.3514845, 0.3987556, 0.5204354, 0, 0.1529412, 1, 1,
0.3537678, 1.269436, 1.647214, 0, 0.1490196, 1, 1,
0.3542872, -0.513044, 4.017029, 0, 0.1411765, 1, 1,
0.3564678, -0.7115883, 1.278968, 0, 0.1372549, 1, 1,
0.3609723, -0.2950798, 1.416666, 0, 0.1294118, 1, 1,
0.3657413, 1.527194, -0.3628994, 0, 0.1254902, 1, 1,
0.367327, 0.2607178, 1.887514, 0, 0.1176471, 1, 1,
0.3688072, 0.1893055, 1.974177, 0, 0.1137255, 1, 1,
0.368887, 1.402502, -0.1875576, 0, 0.1058824, 1, 1,
0.3711462, 0.9023623, 1.01294, 0, 0.09803922, 1, 1,
0.37362, 0.9208745, 1.621539, 0, 0.09411765, 1, 1,
0.374447, 0.6343434, -0.1687941, 0, 0.08627451, 1, 1,
0.3748305, 1.421101, 1.730239, 0, 0.08235294, 1, 1,
0.3760655, -1.209031, 1.988638, 0, 0.07450981, 1, 1,
0.3797871, -0.4973817, 2.994334, 0, 0.07058824, 1, 1,
0.3833747, -1.014443, 2.360491, 0, 0.0627451, 1, 1,
0.3834995, 1.55221, 1.43576, 0, 0.05882353, 1, 1,
0.3867955, 0.791476, 0.5136687, 0, 0.05098039, 1, 1,
0.3886715, 0.5744078, -1.343873, 0, 0.04705882, 1, 1,
0.3901005, 0.06342638, -0.6919357, 0, 0.03921569, 1, 1,
0.3902221, -0.2209767, 0.3068183, 0, 0.03529412, 1, 1,
0.3954277, -0.9112009, 2.686636, 0, 0.02745098, 1, 1,
0.3997785, -0.9188054, 3.34808, 0, 0.02352941, 1, 1,
0.4036386, -0.849086, 2.375924, 0, 0.01568628, 1, 1,
0.4074887, -0.2034555, 1.716502, 0, 0.01176471, 1, 1,
0.409828, -0.03128929, 0.1592267, 0, 0.003921569, 1, 1,
0.4125894, 0.9484561, 0.4670207, 0.003921569, 0, 1, 1,
0.4141142, 0.7200165, 0.17898, 0.007843138, 0, 1, 1,
0.4146717, 0.1648765, 1.55134, 0.01568628, 0, 1, 1,
0.4173127, -1.029191, 5.947285, 0.01960784, 0, 1, 1,
0.4205141, -0.870177, 1.370098, 0.02745098, 0, 1, 1,
0.4208448, -0.6968917, 3.312103, 0.03137255, 0, 1, 1,
0.4221382, 0.2462057, 2.500043, 0.03921569, 0, 1, 1,
0.4224091, 0.7207893, 0.3293776, 0.04313726, 0, 1, 1,
0.4251908, 0.1584958, 2.260789, 0.05098039, 0, 1, 1,
0.42548, 0.1124268, 1.383255, 0.05490196, 0, 1, 1,
0.4270071, -0.6200928, 2.832091, 0.0627451, 0, 1, 1,
0.4315298, -0.5134369, 2.220756, 0.06666667, 0, 1, 1,
0.4351067, 1.041023, 0.1233694, 0.07450981, 0, 1, 1,
0.4361237, 1.052093, 0.8559468, 0.07843138, 0, 1, 1,
0.4416575, 0.007563827, 0.857591, 0.08627451, 0, 1, 1,
0.4431139, 0.8550587, 1.528064, 0.09019608, 0, 1, 1,
0.4446463, -0.7728985, 3.737427, 0.09803922, 0, 1, 1,
0.4450809, -2.026554, 1.671039, 0.1058824, 0, 1, 1,
0.4454103, -1.317768, 2.690315, 0.1098039, 0, 1, 1,
0.4475016, 2.45228, 0.4297361, 0.1176471, 0, 1, 1,
0.4488152, 0.5190157, 0.6436298, 0.1215686, 0, 1, 1,
0.448868, -0.4720964, 3.863551, 0.1294118, 0, 1, 1,
0.4509949, -0.1998696, -0.6782513, 0.1333333, 0, 1, 1,
0.4519053, 0.3439994, 0.5932455, 0.1411765, 0, 1, 1,
0.4543183, 1.312175, 2.523741, 0.145098, 0, 1, 1,
0.4555631, 2.759103, 0.01995404, 0.1529412, 0, 1, 1,
0.4590733, -1.402464, 2.568707, 0.1568628, 0, 1, 1,
0.4610417, -1.813519, 2.596138, 0.1647059, 0, 1, 1,
0.4709945, 0.9594691, 1.006486, 0.1686275, 0, 1, 1,
0.4779432, 0.08201759, 0.1930458, 0.1764706, 0, 1, 1,
0.4781359, -0.3894803, 0.4818878, 0.1803922, 0, 1, 1,
0.4837162, -0.8414062, 3.189446, 0.1882353, 0, 1, 1,
0.4875594, -1.115612, 1.637659, 0.1921569, 0, 1, 1,
0.488863, 0.8380732, 0.09797567, 0.2, 0, 1, 1,
0.4900029, -0.9930574, 3.271657, 0.2078431, 0, 1, 1,
0.4900528, -0.006528432, 3.098852, 0.2117647, 0, 1, 1,
0.4901356, 0.2204702, 0.2101008, 0.2196078, 0, 1, 1,
0.4960142, 2.530744, 0.6983985, 0.2235294, 0, 1, 1,
0.5069734, 0.4747909, 0.09767172, 0.2313726, 0, 1, 1,
0.5082254, 0.288638, 1.543296, 0.2352941, 0, 1, 1,
0.5293976, -0.3077782, 2.861425, 0.2431373, 0, 1, 1,
0.5334035, -1.822633, 1.301007, 0.2470588, 0, 1, 1,
0.5341535, -1.910417, 2.211697, 0.254902, 0, 1, 1,
0.5353432, -0.3943207, 3.140718, 0.2588235, 0, 1, 1,
0.5401061, -0.5852389, 1.051813, 0.2666667, 0, 1, 1,
0.5426353, 0.2311484, 2.372139, 0.2705882, 0, 1, 1,
0.5428725, -1.535193, 2.169883, 0.2784314, 0, 1, 1,
0.5440372, -1.198159, 4.545208, 0.282353, 0, 1, 1,
0.5479547, -1.449514, 2.639605, 0.2901961, 0, 1, 1,
0.5511689, 0.2724546, 0.7615947, 0.2941177, 0, 1, 1,
0.5521364, 2.411562, 0.1717208, 0.3019608, 0, 1, 1,
0.55254, 0.8052427, 1.482084, 0.3098039, 0, 1, 1,
0.5539377, -0.1243851, 1.026016, 0.3137255, 0, 1, 1,
0.555648, -0.140075, 1.029534, 0.3215686, 0, 1, 1,
0.5609803, -0.2378392, 2.307247, 0.3254902, 0, 1, 1,
0.5627525, 1.031143, -0.2250704, 0.3333333, 0, 1, 1,
0.5649347, 1.454092, 0.2082674, 0.3372549, 0, 1, 1,
0.5667816, -0.8752967, 2.949332, 0.345098, 0, 1, 1,
0.5721861, -0.8078456, 2.24062, 0.3490196, 0, 1, 1,
0.5725394, 0.5796279, 0.4654788, 0.3568628, 0, 1, 1,
0.5747099, 0.2492291, 0.985348, 0.3607843, 0, 1, 1,
0.5776569, -0.938934, 3.677319, 0.3686275, 0, 1, 1,
0.587814, 0.09790991, 2.305211, 0.372549, 0, 1, 1,
0.587873, 0.282064, 1.454815, 0.3803922, 0, 1, 1,
0.5894278, 0.02289206, 2.509231, 0.3843137, 0, 1, 1,
0.5942687, 0.4127612, 1.134182, 0.3921569, 0, 1, 1,
0.5979035, 0.4298637, 0.9625465, 0.3960784, 0, 1, 1,
0.6116544, 0.4245683, 0.7503307, 0.4039216, 0, 1, 1,
0.6132339, -0.6538727, 2.022925, 0.4117647, 0, 1, 1,
0.6179199, -1.191577, 3.359165, 0.4156863, 0, 1, 1,
0.6185158, 2.040319, 0.4071651, 0.4235294, 0, 1, 1,
0.6190029, -0.9319265, 3.202362, 0.427451, 0, 1, 1,
0.620653, -0.6476255, 2.63759, 0.4352941, 0, 1, 1,
0.6210057, -0.9304339, 3.441772, 0.4392157, 0, 1, 1,
0.6232374, 1.420757, 1.532829, 0.4470588, 0, 1, 1,
0.6280184, 0.446424, 0.5270457, 0.4509804, 0, 1, 1,
0.6302527, -1.314941, 2.619998, 0.4588235, 0, 1, 1,
0.6319758, 0.1183531, 1.201481, 0.4627451, 0, 1, 1,
0.6354844, 0.9947582, 0.63106, 0.4705882, 0, 1, 1,
0.6371579, 0.1308585, 2.432816, 0.4745098, 0, 1, 1,
0.6419618, -0.2906225, 0.822003, 0.4823529, 0, 1, 1,
0.6460061, -0.3356997, 3.369563, 0.4862745, 0, 1, 1,
0.6475233, -0.145537, -0.2960722, 0.4941176, 0, 1, 1,
0.6535569, -0.3077433, 1.293524, 0.5019608, 0, 1, 1,
0.6549084, -1.492415, 2.672955, 0.5058824, 0, 1, 1,
0.6562762, 0.4320202, 0.2164221, 0.5137255, 0, 1, 1,
0.6571603, -0.1886051, 1.177559, 0.5176471, 0, 1, 1,
0.6658828, 1.281156, 0.6188605, 0.5254902, 0, 1, 1,
0.6660386, 1.79162, -0.3809603, 0.5294118, 0, 1, 1,
0.6664498, -0.3575355, 2.998558, 0.5372549, 0, 1, 1,
0.6699007, 1.543587, 1.117349, 0.5411765, 0, 1, 1,
0.6702335, 0.1826881, 1.859565, 0.5490196, 0, 1, 1,
0.6746337, 0.3702954, 1.514798, 0.5529412, 0, 1, 1,
0.6748449, -0.4262928, 1.466593, 0.5607843, 0, 1, 1,
0.6808385, 0.4083815, 0.758886, 0.5647059, 0, 1, 1,
0.682765, -0.7536352, 1.379584, 0.572549, 0, 1, 1,
0.6830626, 0.6611059, 0.1775144, 0.5764706, 0, 1, 1,
0.6840277, 0.9097259, 1.370786, 0.5843138, 0, 1, 1,
0.6969709, -0.4904371, 2.753274, 0.5882353, 0, 1, 1,
0.6979445, -0.6003432, 2.211824, 0.5960785, 0, 1, 1,
0.7103882, -0.1269456, 0.8096736, 0.6039216, 0, 1, 1,
0.713953, -0.1354942, 0.6756158, 0.6078432, 0, 1, 1,
0.7155304, -0.211625, 0.968104, 0.6156863, 0, 1, 1,
0.7188648, -2.175685, 2.662013, 0.6196079, 0, 1, 1,
0.7234454, -0.3625648, 0.4026175, 0.627451, 0, 1, 1,
0.7284571, 0.748178, 0.1015919, 0.6313726, 0, 1, 1,
0.7313731, -1.334519, 1.621383, 0.6392157, 0, 1, 1,
0.7330915, -1.22809, 1.99192, 0.6431373, 0, 1, 1,
0.735211, -0.9085981, 3.136115, 0.6509804, 0, 1, 1,
0.737204, 0.8159703, 1.420152, 0.654902, 0, 1, 1,
0.7411636, -1.928362, 2.74103, 0.6627451, 0, 1, 1,
0.7418602, 0.1730409, 0.7849755, 0.6666667, 0, 1, 1,
0.7421764, 1.691057, 0.3867814, 0.6745098, 0, 1, 1,
0.7496984, 0.05826429, 2.704783, 0.6784314, 0, 1, 1,
0.7518472, -1.158865, 0.8990143, 0.6862745, 0, 1, 1,
0.754384, -0.2328474, 2.320039, 0.6901961, 0, 1, 1,
0.7577162, -0.7029935, 0.5915446, 0.6980392, 0, 1, 1,
0.7605752, 0.07718739, 2.162838, 0.7058824, 0, 1, 1,
0.7609236, -0.7573248, 1.910423, 0.7098039, 0, 1, 1,
0.7634935, -0.5884235, 0.6573302, 0.7176471, 0, 1, 1,
0.7700966, -1.586004, 3.211252, 0.7215686, 0, 1, 1,
0.7713434, -0.2670563, 2.887892, 0.7294118, 0, 1, 1,
0.7722673, 2.38458, 0.940327, 0.7333333, 0, 1, 1,
0.7745923, 0.4190159, 0.3944311, 0.7411765, 0, 1, 1,
0.7763366, 0.5512095, 1.805927, 0.7450981, 0, 1, 1,
0.7763649, -0.4863284, 3.413517, 0.7529412, 0, 1, 1,
0.7792035, -0.8329766, 1.588766, 0.7568628, 0, 1, 1,
0.7798779, 0.8587778, -0.145842, 0.7647059, 0, 1, 1,
0.784683, -2.584392, 1.604898, 0.7686275, 0, 1, 1,
0.7975333, -0.6133489, 1.128087, 0.7764706, 0, 1, 1,
0.8016002, 0.8576331, 0.9668913, 0.7803922, 0, 1, 1,
0.8048532, 0.04902156, 1.472098, 0.7882353, 0, 1, 1,
0.8088149, 1.006201, 2.933828, 0.7921569, 0, 1, 1,
0.8094909, -0.4774855, 1.368077, 0.8, 0, 1, 1,
0.8116038, 0.6633829, 3.033792, 0.8078431, 0, 1, 1,
0.8117424, -0.1115467, 0.2567503, 0.8117647, 0, 1, 1,
0.8160712, 0.5852337, 0.6944486, 0.8196079, 0, 1, 1,
0.8185644, 1.523868, -0.02349249, 0.8235294, 0, 1, 1,
0.8328438, 0.3266394, 1.017821, 0.8313726, 0, 1, 1,
0.8343515, 2.303128, -0.02403909, 0.8352941, 0, 1, 1,
0.8356843, -1.047036, 3.730309, 0.8431373, 0, 1, 1,
0.8423047, -0.05647301, 1.390906, 0.8470588, 0, 1, 1,
0.8470838, -0.5165313, 3.550706, 0.854902, 0, 1, 1,
0.8481216, -1.106793, 1.010039, 0.8588235, 0, 1, 1,
0.850863, 1.269632, 0.322845, 0.8666667, 0, 1, 1,
0.8521384, 0.9388387, 1.341163, 0.8705882, 0, 1, 1,
0.8538926, -0.215413, 1.588532, 0.8784314, 0, 1, 1,
0.8556589, -0.9133126, 4.530577, 0.8823529, 0, 1, 1,
0.858313, 0.1525435, 2.255991, 0.8901961, 0, 1, 1,
0.8595574, -1.196889, 3.640565, 0.8941177, 0, 1, 1,
0.8618277, 0.5230872, 0.6556574, 0.9019608, 0, 1, 1,
0.8624908, 0.2609371, 1.506747, 0.9098039, 0, 1, 1,
0.8667134, 1.29647, 3.39582, 0.9137255, 0, 1, 1,
0.8697137, 1.147214, 0.03066618, 0.9215686, 0, 1, 1,
0.8742693, -1.15469, 1.463689, 0.9254902, 0, 1, 1,
0.8753169, 0.8906794, -0.5272727, 0.9333333, 0, 1, 1,
0.875961, -0.7591808, 0.6507678, 0.9372549, 0, 1, 1,
0.8778846, -1.295162, 3.179424, 0.945098, 0, 1, 1,
0.8805671, -0.6859125, 3.118673, 0.9490196, 0, 1, 1,
0.8811182, 2.671352, -0.9801949, 0.9568627, 0, 1, 1,
0.882288, -1.792157, 2.872271, 0.9607843, 0, 1, 1,
0.8878029, -0.6754221, 1.589502, 0.9686275, 0, 1, 1,
0.892163, -0.8433896, 1.769665, 0.972549, 0, 1, 1,
0.895617, -0.5952275, 1.417866, 0.9803922, 0, 1, 1,
0.8987718, 0.01285851, 2.443065, 0.9843137, 0, 1, 1,
0.900064, 0.6776707, 0.4008375, 0.9921569, 0, 1, 1,
0.9024798, 0.3836869, 2.307267, 0.9960784, 0, 1, 1,
0.9034778, -0.908955, 2.43513, 1, 0, 0.9960784, 1,
0.9086754, -0.7598822, 2.905119, 1, 0, 0.9882353, 1,
0.9088235, 0.4952267, 1.58769, 1, 0, 0.9843137, 1,
0.9120563, 0.7230023, 1.606574, 1, 0, 0.9764706, 1,
0.9181334, 0.7018609, 0.3567632, 1, 0, 0.972549, 1,
0.9254764, -1.139701, 2.504877, 1, 0, 0.9647059, 1,
0.9353934, -1.354475, 2.393562, 1, 0, 0.9607843, 1,
0.9362633, -0.3152499, 2.580435, 1, 0, 0.9529412, 1,
0.948582, -0.07477446, 1.686277, 1, 0, 0.9490196, 1,
0.9540931, 0.226297, 1.978391, 1, 0, 0.9411765, 1,
0.9578106, 0.3938961, 0.04981053, 1, 0, 0.9372549, 1,
0.9594145, 0.1577076, 1.159426, 1, 0, 0.9294118, 1,
0.9636466, 0.41661, 1.66997, 1, 0, 0.9254902, 1,
0.966935, -0.7952761, 1.078432, 1, 0, 0.9176471, 1,
0.9717858, -0.2927724, 1.50353, 1, 0, 0.9137255, 1,
0.981245, -0.5204276, 1.681479, 1, 0, 0.9058824, 1,
0.9868119, 0.3429057, 0.3797725, 1, 0, 0.9019608, 1,
0.9869192, -1.391359, 1.898618, 1, 0, 0.8941177, 1,
0.9895785, 0.094901, 0.2002387, 1, 0, 0.8862745, 1,
0.9905598, -0.1055581, -0.09202536, 1, 0, 0.8823529, 1,
0.9994221, -1.385626, 1.362424, 1, 0, 0.8745098, 1,
1.006019, 0.3892655, 1.420178, 1, 0, 0.8705882, 1,
1.010254, 1.209593, 2.162257, 1, 0, 0.8627451, 1,
1.014292, -0.4541184, 1.380447, 1, 0, 0.8588235, 1,
1.015312, 3.365579, -1.680652, 1, 0, 0.8509804, 1,
1.01655, 0.353284, 2.522057, 1, 0, 0.8470588, 1,
1.019631, -0.3648868, 2.214846, 1, 0, 0.8392157, 1,
1.025689, 0.1899251, 2.242274, 1, 0, 0.8352941, 1,
1.03208, -1.021755, 1.762316, 1, 0, 0.827451, 1,
1.041986, -1.152537, 3.43358, 1, 0, 0.8235294, 1,
1.052958, -1.297254, 0.9771111, 1, 0, 0.8156863, 1,
1.057659, 0.01875555, 3.32996, 1, 0, 0.8117647, 1,
1.06333, 1.881464, 0.1169556, 1, 0, 0.8039216, 1,
1.064867, 0.6802907, -0.3895706, 1, 0, 0.7960784, 1,
1.065485, 1.981295, 0.9334807, 1, 0, 0.7921569, 1,
1.08061, 0.7435234, 0.2153472, 1, 0, 0.7843137, 1,
1.088995, 1.38081, 0.09976578, 1, 0, 0.7803922, 1,
1.089821, 0.402573, 2.401348, 1, 0, 0.772549, 1,
1.092673, -0.0297808, 2.374511, 1, 0, 0.7686275, 1,
1.095741, -1.720596, 1.870228, 1, 0, 0.7607843, 1,
1.098278, 1.520012, 0.2730182, 1, 0, 0.7568628, 1,
1.100085, -0.5946624, 2.672319, 1, 0, 0.7490196, 1,
1.107044, 0.1474808, 1.537418, 1, 0, 0.7450981, 1,
1.110641, 1.54858, 2.202449, 1, 0, 0.7372549, 1,
1.110811, -0.4846459, 2.470074, 1, 0, 0.7333333, 1,
1.112156, -0.9308114, 2.726821, 1, 0, 0.7254902, 1,
1.126204, 0.2814314, 1.726112, 1, 0, 0.7215686, 1,
1.137477, -0.154892, 1.787495, 1, 0, 0.7137255, 1,
1.138803, 1.197782, 1.43489, 1, 0, 0.7098039, 1,
1.141534, -0.03240762, 1.448699, 1, 0, 0.7019608, 1,
1.155273, 0.4594076, 0.7699149, 1, 0, 0.6941177, 1,
1.177009, 0.01143013, 2.651352, 1, 0, 0.6901961, 1,
1.18609, -0.3376121, -0.261126, 1, 0, 0.682353, 1,
1.186744, -1.506813, 2.585883, 1, 0, 0.6784314, 1,
1.196887, 0.496137, 1.600183, 1, 0, 0.6705883, 1,
1.207363, -1.04874, 1.814845, 1, 0, 0.6666667, 1,
1.211731, -1.454193, 1.578878, 1, 0, 0.6588235, 1,
1.21245, 2.335217, -0.2295607, 1, 0, 0.654902, 1,
1.220833, 0.5343332, 1.796309, 1, 0, 0.6470588, 1,
1.224028, 1.08977, 0.123503, 1, 0, 0.6431373, 1,
1.227907, 0.5519699, 0.5897816, 1, 0, 0.6352941, 1,
1.230874, 0.2174189, 1.656261, 1, 0, 0.6313726, 1,
1.231602, -0.4632782, 1.948808, 1, 0, 0.6235294, 1,
1.237688, 0.971595, 0.6592343, 1, 0, 0.6196079, 1,
1.250864, 0.1821358, 0.3829097, 1, 0, 0.6117647, 1,
1.252194, -0.5390267, 2.165698, 1, 0, 0.6078432, 1,
1.260008, 1.53605, -0.1191092, 1, 0, 0.6, 1,
1.266728, -0.1007707, 2.287371, 1, 0, 0.5921569, 1,
1.273912, 0.7123997, -0.3881723, 1, 0, 0.5882353, 1,
1.274798, -0.6405226, 1.840975, 1, 0, 0.5803922, 1,
1.279198, -0.8950054, 1.55363, 1, 0, 0.5764706, 1,
1.279856, 0.01480426, 1.198452, 1, 0, 0.5686275, 1,
1.283762, 0.2464369, 1.218208, 1, 0, 0.5647059, 1,
1.283814, 0.6278176, -0.3998207, 1, 0, 0.5568628, 1,
1.286688, -0.8508283, 3.184992, 1, 0, 0.5529412, 1,
1.289533, 1.638557, 1.089486, 1, 0, 0.5450981, 1,
1.293398, 2.253504, 1.170698, 1, 0, 0.5411765, 1,
1.297077, -1.809333, 1.146797, 1, 0, 0.5333334, 1,
1.297431, 0.03501946, 2.328875, 1, 0, 0.5294118, 1,
1.29861, 0.4022781, 2.476576, 1, 0, 0.5215687, 1,
1.299223, -0.5609869, 2.334014, 1, 0, 0.5176471, 1,
1.317978, -1.686547, 1.645334, 1, 0, 0.509804, 1,
1.318363, 1.883663, -0.4738804, 1, 0, 0.5058824, 1,
1.322672, -1.324611, 2.550895, 1, 0, 0.4980392, 1,
1.33223, 0.6968632, -0.9233186, 1, 0, 0.4901961, 1,
1.338408, -0.2808345, 3.932926, 1, 0, 0.4862745, 1,
1.345902, -0.6616151, 2.881316, 1, 0, 0.4784314, 1,
1.35667, -0.4297801, 2.73769, 1, 0, 0.4745098, 1,
1.356895, -1.22704, 1.664305, 1, 0, 0.4666667, 1,
1.359588, 0.6799626, 1.581591, 1, 0, 0.4627451, 1,
1.363994, 0.3130699, 0.8006173, 1, 0, 0.454902, 1,
1.381246, 1.634197, 2.471333, 1, 0, 0.4509804, 1,
1.389888, -0.2575282, 2.763717, 1, 0, 0.4431373, 1,
1.39121, -0.2217819, 2.001137, 1, 0, 0.4392157, 1,
1.401277, 1.920489, 1.253528, 1, 0, 0.4313726, 1,
1.415587, 1.606218, 1.191128, 1, 0, 0.427451, 1,
1.433319, 1.101798, 0.7617713, 1, 0, 0.4196078, 1,
1.434558, 1.292391, 0.7835057, 1, 0, 0.4156863, 1,
1.43553, 0.05997415, 3.865531, 1, 0, 0.4078431, 1,
1.436109, -1.071645, 2.586142, 1, 0, 0.4039216, 1,
1.457242, 1.542761, 0.4061199, 1, 0, 0.3960784, 1,
1.466387, 0.2054055, 1.468608, 1, 0, 0.3882353, 1,
1.467097, 0.3054098, -0.6477557, 1, 0, 0.3843137, 1,
1.483098, 1.171147, 1.268604, 1, 0, 0.3764706, 1,
1.486001, -0.02308454, 2.199141, 1, 0, 0.372549, 1,
1.486385, 0.5001377, 1.788761, 1, 0, 0.3647059, 1,
1.489397, -0.779828, 2.770409, 1, 0, 0.3607843, 1,
1.507669, -1.831095, 2.567724, 1, 0, 0.3529412, 1,
1.51209, -0.001953689, 2.864647, 1, 0, 0.3490196, 1,
1.520454, -0.5101599, 2.060729, 1, 0, 0.3411765, 1,
1.520641, -0.7910398, 3.232589, 1, 0, 0.3372549, 1,
1.521102, 0.1220614, 1.630231, 1, 0, 0.3294118, 1,
1.522284, -1.31787, 2.898175, 1, 0, 0.3254902, 1,
1.523192, 0.5612246, 0.983888, 1, 0, 0.3176471, 1,
1.532939, -0.6466998, 1.765603, 1, 0, 0.3137255, 1,
1.538992, -0.8891074, 3.514481, 1, 0, 0.3058824, 1,
1.541088, 1.222926, 2.139415, 1, 0, 0.2980392, 1,
1.573678, 2.062277, 0.03049771, 1, 0, 0.2941177, 1,
1.573686, -0.4981827, 1.261166, 1, 0, 0.2862745, 1,
1.65209, 0.117546, 0.8091403, 1, 0, 0.282353, 1,
1.685334, -1.180149, 2.238999, 1, 0, 0.2745098, 1,
1.693958, -0.2611464, 1.556784, 1, 0, 0.2705882, 1,
1.696282, 0.2053765, 2.592162, 1, 0, 0.2627451, 1,
1.727548, -0.8569304, 2.149027, 1, 0, 0.2588235, 1,
1.747504, -0.7401634, 2.566118, 1, 0, 0.2509804, 1,
1.765993, 0.573568, 1.629331, 1, 0, 0.2470588, 1,
1.766248, -1.88906, 2.661938, 1, 0, 0.2392157, 1,
1.775134, -0.2341742, 0.315413, 1, 0, 0.2352941, 1,
1.782022, -0.8356011, 4.161012, 1, 0, 0.227451, 1,
1.821412, 1.092262, 1.364212, 1, 0, 0.2235294, 1,
1.824959, -0.8146036, 2.783479, 1, 0, 0.2156863, 1,
1.83496, 0.1968544, 0.1037425, 1, 0, 0.2117647, 1,
1.851607, 0.05375365, 0.8537187, 1, 0, 0.2039216, 1,
1.856052, -0.05869222, 0.9510207, 1, 0, 0.1960784, 1,
1.863048, 1.416661, 1.762526, 1, 0, 0.1921569, 1,
1.873173, 0.6174757, 0.4226384, 1, 0, 0.1843137, 1,
1.908651, 1.539075, 3.289039, 1, 0, 0.1803922, 1,
1.913796, -1.581014, 1.875546, 1, 0, 0.172549, 1,
1.918774, -1.05686, 1.837375, 1, 0, 0.1686275, 1,
1.926407, 1.107402, 1.785136, 1, 0, 0.1607843, 1,
1.971947, 0.769327, 0.703925, 1, 0, 0.1568628, 1,
1.973835, 0.2289066, 1.781345, 1, 0, 0.1490196, 1,
1.990138, -0.564386, 1.45695, 1, 0, 0.145098, 1,
2.004532, -0.556184, 0.9388422, 1, 0, 0.1372549, 1,
2.036441, -0.4700109, 1.324394, 1, 0, 0.1333333, 1,
2.037708, -0.4498799, 2.26736, 1, 0, 0.1254902, 1,
2.043701, 1.214309, 0.5280257, 1, 0, 0.1215686, 1,
2.04704, -0.3767746, 2.167936, 1, 0, 0.1137255, 1,
2.068553, 1.586846, 2.222452, 1, 0, 0.1098039, 1,
2.089804, -0.06374814, 1.169505, 1, 0, 0.1019608, 1,
2.103447, 0.7766929, 0.9466263, 1, 0, 0.09411765, 1,
2.126471, 0.4491691, 1.659228, 1, 0, 0.09019608, 1,
2.129936, -0.1772332, 1.61086, 1, 0, 0.08235294, 1,
2.144529, -0.3316109, -0.3544464, 1, 0, 0.07843138, 1,
2.149388, -0.9757805, 0.3508803, 1, 0, 0.07058824, 1,
2.159363, -0.6485296, 1.453881, 1, 0, 0.06666667, 1,
2.278405, -1.033942, 1.167291, 1, 0, 0.05882353, 1,
2.307128, -1.456228, 2.499345, 1, 0, 0.05490196, 1,
2.308202, -0.5126696, 2.086871, 1, 0, 0.04705882, 1,
2.367042, 0.3036101, 1.539729, 1, 0, 0.04313726, 1,
2.372411, -0.1091761, 0.9784787, 1, 0, 0.03529412, 1,
2.430609, -0.282814, -0.1276274, 1, 0, 0.03137255, 1,
2.532931, 0.9247291, -0.5759738, 1, 0, 0.02352941, 1,
2.614084, -2.025299, 2.90521, 1, 0, 0.01960784, 1,
2.66995, -0.5169318, 1.852387, 1, 0, 0.01176471, 1,
2.749551, -0.8262509, 1.539909, 1, 0, 0.007843138, 1
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
-0.3800386, -4.234558, -8.114284, 0, -0.5, 0.5, 0.5,
-0.3800386, -4.234558, -8.114284, 1, -0.5, 0.5, 0.5,
-0.3800386, -4.234558, -8.114284, 1, 1.5, 0.5, 0.5,
-0.3800386, -4.234558, -8.114284, 0, 1.5, 0.5, 0.5
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
-4.57056, 0.116269, -8.114284, 0, -0.5, 0.5, 0.5,
-4.57056, 0.116269, -8.114284, 1, -0.5, 0.5, 0.5,
-4.57056, 0.116269, -8.114284, 1, 1.5, 0.5, 0.5,
-4.57056, 0.116269, -8.114284, 0, 1.5, 0.5, 0.5
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
-4.57056, -4.234558, -0.06450152, 0, -0.5, 0.5, 0.5,
-4.57056, -4.234558, -0.06450152, 1, -0.5, 0.5, 0.5,
-4.57056, -4.234558, -0.06450152, 1, 1.5, 0.5, 0.5,
-4.57056, -4.234558, -0.06450152, 0, 1.5, 0.5, 0.5
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
-3, -3.230521, -6.256642,
2, -3.230521, -6.256642,
-3, -3.230521, -6.256642,
-3, -3.39786, -6.566249,
-2, -3.230521, -6.256642,
-2, -3.39786, -6.566249,
-1, -3.230521, -6.256642,
-1, -3.39786, -6.566249,
0, -3.230521, -6.256642,
0, -3.39786, -6.566249,
1, -3.230521, -6.256642,
1, -3.39786, -6.566249,
2, -3.230521, -6.256642,
2, -3.39786, -6.566249
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
-3, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
-3, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
-3, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
-3, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5,
-2, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
-2, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
-2, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
-2, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5,
-1, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
-1, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
-1, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
-1, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5,
0, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
0, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
0, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
0, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5,
1, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
1, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
1, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
1, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5,
2, -3.732539, -7.185463, 0, -0.5, 0.5, 0.5,
2, -3.732539, -7.185463, 1, -0.5, 0.5, 0.5,
2, -3.732539, -7.185463, 1, 1.5, 0.5, 0.5,
2, -3.732539, -7.185463, 0, 1.5, 0.5, 0.5
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
-3.603516, -3, -6.256642,
-3.603516, 3, -6.256642,
-3.603516, -3, -6.256642,
-3.76469, -3, -6.566249,
-3.603516, -2, -6.256642,
-3.76469, -2, -6.566249,
-3.603516, -1, -6.256642,
-3.76469, -1, -6.566249,
-3.603516, 0, -6.256642,
-3.76469, 0, -6.566249,
-3.603516, 1, -6.256642,
-3.76469, 1, -6.566249,
-3.603516, 2, -6.256642,
-3.76469, 2, -6.566249,
-3.603516, 3, -6.256642,
-3.76469, 3, -6.566249
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
-4.087038, -3, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, -3, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, -3, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, -3, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, -2, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, -2, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, -2, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, -2, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, -1, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, -1, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, -1, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, -1, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, 0, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, 0, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, 0, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, 0, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, 1, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, 1, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, 1, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, 1, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, 2, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, 2, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, 2, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, 2, -7.185463, 0, 1.5, 0.5, 0.5,
-4.087038, 3, -7.185463, 0, -0.5, 0.5, 0.5,
-4.087038, 3, -7.185463, 1, -0.5, 0.5, 0.5,
-4.087038, 3, -7.185463, 1, 1.5, 0.5, 0.5,
-4.087038, 3, -7.185463, 0, 1.5, 0.5, 0.5
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
-3.603516, -3.230521, -6,
-3.603516, -3.230521, 4,
-3.603516, -3.230521, -6,
-3.76469, -3.39786, -6,
-3.603516, -3.230521, -4,
-3.76469, -3.39786, -4,
-3.603516, -3.230521, -2,
-3.76469, -3.39786, -2,
-3.603516, -3.230521, 0,
-3.76469, -3.39786, 0,
-3.603516, -3.230521, 2,
-3.76469, -3.39786, 2,
-3.603516, -3.230521, 4,
-3.76469, -3.39786, 4
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
"-6",
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
-4.087038, -3.732539, -6, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -6, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -6, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, -6, 0, 1.5, 0.5, 0.5,
-4.087038, -3.732539, -4, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -4, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -4, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, -4, 0, 1.5, 0.5, 0.5,
-4.087038, -3.732539, -2, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -2, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, -2, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, -2, 0, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 0, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 0, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 0, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 0, 0, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 2, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 2, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 2, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 2, 0, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 4, 0, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 4, 1, -0.5, 0.5, 0.5,
-4.087038, -3.732539, 4, 1, 1.5, 0.5, 0.5,
-4.087038, -3.732539, 4, 0, 1.5, 0.5, 0.5
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
-3.603516, -3.230521, -6.256642,
-3.603516, 3.463059, -6.256642,
-3.603516, -3.230521, 6.127639,
-3.603516, 3.463059, 6.127639,
-3.603516, -3.230521, -6.256642,
-3.603516, -3.230521, 6.127639,
-3.603516, 3.463059, -6.256642,
-3.603516, 3.463059, 6.127639,
-3.603516, -3.230521, -6.256642,
2.843439, -3.230521, -6.256642,
-3.603516, -3.230521, 6.127639,
2.843439, -3.230521, 6.127639,
-3.603516, 3.463059, -6.256642,
2.843439, 3.463059, -6.256642,
-3.603516, 3.463059, 6.127639,
2.843439, 3.463059, 6.127639,
2.843439, -3.230521, -6.256642,
2.843439, 3.463059, -6.256642,
2.843439, -3.230521, 6.127639,
2.843439, 3.463059, 6.127639,
2.843439, -3.230521, -6.256642,
2.843439, -3.230521, 6.127639,
2.843439, 3.463059, -6.256642,
2.843439, 3.463059, 6.127639
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
var radius = 8.267869;
var distance = 36.78468;
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
mvMatrix.translate( 0.3800386, -0.116269, 0.06450152 );
mvMatrix.scale( 1.386605, 1.335516, 0.7218329 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.78468);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-AT<-read.table("3-AT.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-AT$V2
```

```
## Error in eval(expr, envir, enclos): object 'AT' not found
```

```r
y<-3-AT$V3
```

```
## Error in eval(expr, envir, enclos): object 'AT' not found
```

```r
z<-3-AT$V4
```

```
## Error in eval(expr, envir, enclos): object 'AT' not found
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
-3.509629, -0.7263292, -3.058489, 0, 0, 1, 1, 1,
-2.974358, 0.7072452, -3.211779, 1, 0, 0, 1, 1,
-2.79278, 0.6867177, -0.1470292, 1, 0, 0, 1, 1,
-2.568214, 1.098211, -1.671737, 1, 0, 0, 1, 1,
-2.563423, -0.5092422, -3.456703, 1, 0, 0, 1, 1,
-2.553852, 0.3684748, -2.031471, 1, 0, 0, 1, 1,
-2.492883, -0.1625362, -0.4087083, 0, 0, 0, 1, 1,
-2.394021, 0.8232938, -0.7556312, 0, 0, 0, 1, 1,
-2.27723, -1.54407, -2.211814, 0, 0, 0, 1, 1,
-2.234889, -1.190654, -3.905739, 0, 0, 0, 1, 1,
-2.207802, 2.282056, -0.1481884, 0, 0, 0, 1, 1,
-2.207772, 0.702793, -2.14468, 0, 0, 0, 1, 1,
-2.182734, -0.7731746, -0.1754927, 0, 0, 0, 1, 1,
-2.176478, 0.6273073, -1.497251, 1, 1, 1, 1, 1,
-2.158269, -0.4433131, -3.380111, 1, 1, 1, 1, 1,
-2.128816, 2.420672, -1.830993, 1, 1, 1, 1, 1,
-2.082764, 0.3444573, -0.7475783, 1, 1, 1, 1, 1,
-2.057173, 0.01044438, -0.9109156, 1, 1, 1, 1, 1,
-2.010072, -0.4928589, -2.464005, 1, 1, 1, 1, 1,
-1.941341, 1.093133, -1.740833, 1, 1, 1, 1, 1,
-1.933423, 0.4757378, -1.323504, 1, 1, 1, 1, 1,
-1.928869, -0.0583637, -2.371572, 1, 1, 1, 1, 1,
-1.928066, -0.2987409, -2.922065, 1, 1, 1, 1, 1,
-1.924443, -0.9915025, -0.9699118, 1, 1, 1, 1, 1,
-1.90457, -0.8706166, -2.457129, 1, 1, 1, 1, 1,
-1.900838, -1.279953, -0.68971, 1, 1, 1, 1, 1,
-1.872882, -1.284771, -1.305303, 1, 1, 1, 1, 1,
-1.866851, 0.03420233, -1.512421, 1, 1, 1, 1, 1,
-1.859895, -0.3672511, -0.9465215, 0, 0, 1, 1, 1,
-1.845901, -0.9853877, -1.234295, 1, 0, 0, 1, 1,
-1.834708, 1.791625, -0.9279577, 1, 0, 0, 1, 1,
-1.78931, 1.019933, -2.101639, 1, 0, 0, 1, 1,
-1.779487, 0.138496, -1.906124, 1, 0, 0, 1, 1,
-1.763192, -0.2165118, -3.921775, 1, 0, 0, 1, 1,
-1.754634, 0.170771, -1.542229, 0, 0, 0, 1, 1,
-1.753178, -0.244772, 0.1136281, 0, 0, 0, 1, 1,
-1.748445, -2.041398, -3.452059, 0, 0, 0, 1, 1,
-1.721352, -0.7141137, -0.4194838, 0, 0, 0, 1, 1,
-1.713301, 0.9705462, -2.969817, 0, 0, 0, 1, 1,
-1.704659, -1.100307, -4.085693, 0, 0, 0, 1, 1,
-1.682892, -2.035917, -1.759663, 0, 0, 0, 1, 1,
-1.667809, -0.07247833, -0.8048988, 1, 1, 1, 1, 1,
-1.664675, -0.03856172, -0.8369264, 1, 1, 1, 1, 1,
-1.653272, -0.3607944, -3.710607, 1, 1, 1, 1, 1,
-1.635139, 0.2896179, -0.8536838, 1, 1, 1, 1, 1,
-1.629239, 2.121028, -0.6375372, 1, 1, 1, 1, 1,
-1.620643, 0.1133735, -1.52896, 1, 1, 1, 1, 1,
-1.618724, 0.6018572, -3.415266, 1, 1, 1, 1, 1,
-1.611493, -0.2656008, -5.310453, 1, 1, 1, 1, 1,
-1.585019, -0.1038371, -1.688961, 1, 1, 1, 1, 1,
-1.582628, 1.481285, -0.3407147, 1, 1, 1, 1, 1,
-1.579575, -0.02708821, -2.802597, 1, 1, 1, 1, 1,
-1.548545, 0.3036338, -3.271908, 1, 1, 1, 1, 1,
-1.547772, 0.4249294, -1.33619, 1, 1, 1, 1, 1,
-1.547081, -1.159235, -1.046877, 1, 1, 1, 1, 1,
-1.546636, 0.01768518, -1.024009, 1, 1, 1, 1, 1,
-1.544099, -1.472679, -3.322111, 0, 0, 1, 1, 1,
-1.530449, 0.4911368, -1.543992, 1, 0, 0, 1, 1,
-1.528805, 1.883923, -1.128966, 1, 0, 0, 1, 1,
-1.522452, 0.8000816, 0.3555323, 1, 0, 0, 1, 1,
-1.516157, -0.2071896, 0.6051555, 1, 0, 0, 1, 1,
-1.516135, -0.2993513, -0.3671027, 1, 0, 0, 1, 1,
-1.512601, 1.970362, -1.199266, 0, 0, 0, 1, 1,
-1.511852, -1.234568, -1.779138, 0, 0, 0, 1, 1,
-1.510888, 0.7216862, -0.03954534, 0, 0, 0, 1, 1,
-1.50488, 1.6711, -1.373321, 0, 0, 0, 1, 1,
-1.497084, 0.1063897, -3.687524, 0, 0, 0, 1, 1,
-1.496076, 1.549421, -2.130662, 0, 0, 0, 1, 1,
-1.487693, -1.372356, -2.50807, 0, 0, 0, 1, 1,
-1.479977, -1.232692, -0.7106892, 1, 1, 1, 1, 1,
-1.478835, -2.538999, -2.489096, 1, 1, 1, 1, 1,
-1.472076, 0.7867556, -0.05983114, 1, 1, 1, 1, 1,
-1.468349, 1.523221, 0.4338684, 1, 1, 1, 1, 1,
-1.467434, 1.54719, -0.4856957, 1, 1, 1, 1, 1,
-1.46628, 0.145069, -3.251595, 1, 1, 1, 1, 1,
-1.463005, 1.398407, -0.2967935, 1, 1, 1, 1, 1,
-1.46218, -1.599763, -3.579292, 1, 1, 1, 1, 1,
-1.459403, 0.3889868, -0.4671443, 1, 1, 1, 1, 1,
-1.458576, 0.3682204, -0.8275905, 1, 1, 1, 1, 1,
-1.451895, -2.226331, -1.829396, 1, 1, 1, 1, 1,
-1.450958, -0.219996, -0.5749303, 1, 1, 1, 1, 1,
-1.445475, -0.9794015, -3.259537, 1, 1, 1, 1, 1,
-1.442789, 0.1205427, -0.5977498, 1, 1, 1, 1, 1,
-1.424779, -0.3664275, -2.046473, 1, 1, 1, 1, 1,
-1.41377, 1.417201, 0.6974717, 0, 0, 1, 1, 1,
-1.409523, -0.6644631, -0.8498562, 1, 0, 0, 1, 1,
-1.402343, 0.2284228, -3.456616, 1, 0, 0, 1, 1,
-1.390021, -0.5248485, -1.469633, 1, 0, 0, 1, 1,
-1.382918, -1.286007, -1.201802, 1, 0, 0, 1, 1,
-1.382203, 0.1125806, -0.8826655, 1, 0, 0, 1, 1,
-1.380839, 1.040289, -0.9173925, 0, 0, 0, 1, 1,
-1.380773, -1.353718, -1.692673, 0, 0, 0, 1, 1,
-1.365982, -1.418618, -1.43608, 0, 0, 0, 1, 1,
-1.365637, 0.5410755, -1.033868, 0, 0, 0, 1, 1,
-1.365165, -0.2391512, -3.171383, 0, 0, 0, 1, 1,
-1.35499, 2.96106, -1.979137, 0, 0, 0, 1, 1,
-1.344412, -0.162496, -5.20009, 0, 0, 0, 1, 1,
-1.342821, -0.859955, -1.251231, 1, 1, 1, 1, 1,
-1.342698, 0.5881301, -0.690079, 1, 1, 1, 1, 1,
-1.335664, 0.9234937, -0.06120081, 1, 1, 1, 1, 1,
-1.329783, -0.29087, -2.687362, 1, 1, 1, 1, 1,
-1.32628, -1.207278, -2.568321, 1, 1, 1, 1, 1,
-1.304795, 1.730558, 1.083049, 1, 1, 1, 1, 1,
-1.303457, 0.2115358, -2.569928, 1, 1, 1, 1, 1,
-1.29719, 0.07491044, -0.5381349, 1, 1, 1, 1, 1,
-1.277161, -0.839491, -1.673706, 1, 1, 1, 1, 1,
-1.275567, -0.1928838, -0.5548112, 1, 1, 1, 1, 1,
-1.2658, 0.0767603, -0.446642, 1, 1, 1, 1, 1,
-1.264172, -0.6611237, -3.539459, 1, 1, 1, 1, 1,
-1.260695, -0.7877567, -4.284575, 1, 1, 1, 1, 1,
-1.2537, -0.8090666, -1.555331, 1, 1, 1, 1, 1,
-1.240304, -0.9166102, -1.396076, 1, 1, 1, 1, 1,
-1.239325, 1.382605, -1.377745, 0, 0, 1, 1, 1,
-1.233182, 1.313407, -1.198163, 1, 0, 0, 1, 1,
-1.232176, 2.005297, -1.369343, 1, 0, 0, 1, 1,
-1.2271, 0.6697006, -2.771327, 1, 0, 0, 1, 1,
-1.225982, -3.133041, -2.121092, 1, 0, 0, 1, 1,
-1.225203, -0.229984, -1.329994, 1, 0, 0, 1, 1,
-1.220054, 0.4314752, -0.5528728, 0, 0, 0, 1, 1,
-1.216418, 0.02673282, -0.3716442, 0, 0, 0, 1, 1,
-1.214991, -2.747836, -1.415738, 0, 0, 0, 1, 1,
-1.213752, -0.5568919, -2.317079, 0, 0, 0, 1, 1,
-1.199408, -1.001083, -2.650481, 0, 0, 0, 1, 1,
-1.191218, -0.308651, -1.080163, 0, 0, 0, 1, 1,
-1.18269, -0.01092767, -0.7343069, 0, 0, 0, 1, 1,
-1.181529, -1.002594, -3.359265, 1, 1, 1, 1, 1,
-1.18075, -0.5506722, -1.814183, 1, 1, 1, 1, 1,
-1.180546, 0.7487971, 0.5704265, 1, 1, 1, 1, 1,
-1.179857, -1.979914, -2.610178, 1, 1, 1, 1, 1,
-1.177474, -0.5264227, -2.31368, 1, 1, 1, 1, 1,
-1.172382, -1.388958, -3.275088, 1, 1, 1, 1, 1,
-1.171827, -0.9210075, -0.4424777, 1, 1, 1, 1, 1,
-1.160686, -1.200009, -0.6310306, 1, 1, 1, 1, 1,
-1.160353, 0.8651717, -0.9040036, 1, 1, 1, 1, 1,
-1.158578, -2.752577, -3.178, 1, 1, 1, 1, 1,
-1.154159, -1.214451, -4.017266, 1, 1, 1, 1, 1,
-1.153636, 0.7081787, 0.4761736, 1, 1, 1, 1, 1,
-1.145008, -0.9695151, -2.156708, 1, 1, 1, 1, 1,
-1.14251, -0.1668493, -1.659818, 1, 1, 1, 1, 1,
-1.123451, 1.798492, -1.62166, 1, 1, 1, 1, 1,
-1.120546, -1.861299, -3.157775, 0, 0, 1, 1, 1,
-1.103677, -2.180353, -2.61098, 1, 0, 0, 1, 1,
-1.101099, -0.4720564, -2.207942, 1, 0, 0, 1, 1,
-1.097261, 0.5335593, -1.495635, 1, 0, 0, 1, 1,
-1.096545, -0.5949426, -2.666179, 1, 0, 0, 1, 1,
-1.094348, 1.301865, -0.5380604, 1, 0, 0, 1, 1,
-1.089797, -0.7774618, -1.446092, 0, 0, 0, 1, 1,
-1.080225, -1.184358, -1.552315, 0, 0, 0, 1, 1,
-1.073915, -0.08895317, -1.447438, 0, 0, 0, 1, 1,
-1.067641, -1.497575, -1.641939, 0, 0, 0, 1, 1,
-1.065237, -0.2186286, -2.386333, 0, 0, 0, 1, 1,
-1.058299, -1.13401, -1.592289, 0, 0, 0, 1, 1,
-1.052799, -0.8378165, -1.455234, 0, 0, 0, 1, 1,
-1.05083, 0.1881947, -0.9928718, 1, 1, 1, 1, 1,
-1.047738, 1.137025, -1.499023, 1, 1, 1, 1, 1,
-1.04543, -0.6137284, -2.475784, 1, 1, 1, 1, 1,
-1.04437, -0.9750911, -3.420687, 1, 1, 1, 1, 1,
-1.033699, -0.8451174, -2.717268, 1, 1, 1, 1, 1,
-1.030244, 0.1277629, 0.1670426, 1, 1, 1, 1, 1,
-1.02207, 0.4878569, -0.958021, 1, 1, 1, 1, 1,
-1.013582, 1.739249, 0.3634911, 1, 1, 1, 1, 1,
-1.011744, 1.880805, -0.9440846, 1, 1, 1, 1, 1,
-1.006168, -0.9400127, -0.9391416, 1, 1, 1, 1, 1,
-1.004158, 1.198214, -0.1780956, 1, 1, 1, 1, 1,
-1.002111, -0.5231885, -0.4590793, 1, 1, 1, 1, 1,
-1.001928, -1.067059, -2.268753, 1, 1, 1, 1, 1,
-0.9971093, 0.8429213, -0.899793, 1, 1, 1, 1, 1,
-0.9963867, 0.08614519, -1.55364, 1, 1, 1, 1, 1,
-0.9916412, -0.4895717, -1.400832, 0, 0, 1, 1, 1,
-0.9870478, -2.345539, -3.270346, 1, 0, 0, 1, 1,
-0.9868379, 0.4927735, -0.168203, 1, 0, 0, 1, 1,
-0.986454, 0.2884444, -2.062182, 1, 0, 0, 1, 1,
-0.9707307, 1.555557, 0.7132993, 1, 0, 0, 1, 1,
-0.9696734, 0.17961, -0.899851, 1, 0, 0, 1, 1,
-0.9696268, 0.3137418, -1.77098, 0, 0, 0, 1, 1,
-0.9640287, -0.5264037, -3.196421, 0, 0, 0, 1, 1,
-0.9636321, 1.064376, -1.063586, 0, 0, 0, 1, 1,
-0.9530548, -2.367041, -2.854764, 0, 0, 0, 1, 1,
-0.9521342, 0.2511262, -1.840401, 0, 0, 0, 1, 1,
-0.9501873, -0.3684285, -1.166437, 0, 0, 0, 1, 1,
-0.9421492, -1.70081, -2.61481, 0, 0, 0, 1, 1,
-0.9302123, -1.316576, -1.299756, 1, 1, 1, 1, 1,
-0.9206797, -0.2460229, -2.911279, 1, 1, 1, 1, 1,
-0.9101433, -1.641224, -3.920633, 1, 1, 1, 1, 1,
-0.9098699, -0.7300128, -2.116141, 1, 1, 1, 1, 1,
-0.9037733, -0.9634284, -2.698217, 1, 1, 1, 1, 1,
-0.9007124, 1.188144, 0.2016945, 1, 1, 1, 1, 1,
-0.8996543, 2.027184, -1.42372, 1, 1, 1, 1, 1,
-0.8961143, -0.8113078, -2.26145, 1, 1, 1, 1, 1,
-0.8861216, -1.903382, -2.905286, 1, 1, 1, 1, 1,
-0.8808421, 0.03019699, -2.777505, 1, 1, 1, 1, 1,
-0.8798388, 1.246661, -1.411266, 1, 1, 1, 1, 1,
-0.8795237, 0.04865273, -0.3360368, 1, 1, 1, 1, 1,
-0.8751066, 2.598435, 1.304402, 1, 1, 1, 1, 1,
-0.8724837, -0.4626439, -2.223835, 1, 1, 1, 1, 1,
-0.8718569, -1.821387, -3.578659, 1, 1, 1, 1, 1,
-0.8709745, 2.130796, -0.6541327, 0, 0, 1, 1, 1,
-0.8679118, 0.7288305, -2.325554, 1, 0, 0, 1, 1,
-0.8678308, -0.8188227, -2.048672, 1, 0, 0, 1, 1,
-0.8618428, 0.1723275, -2.820947, 1, 0, 0, 1, 1,
-0.858124, 1.431308, -0.05866723, 1, 0, 0, 1, 1,
-0.8520242, -0.475003, -1.746258, 1, 0, 0, 1, 1,
-0.849539, 1.119658, 0.1016308, 0, 0, 0, 1, 1,
-0.8396475, -0.2199648, -1.125091, 0, 0, 0, 1, 1,
-0.8395126, 0.2590069, -0.210159, 0, 0, 0, 1, 1,
-0.8374012, 0.144848, -2.278545, 0, 0, 0, 1, 1,
-0.8348955, 0.07623416, -2.073128, 0, 0, 0, 1, 1,
-0.8339618, -1.626096, -0.7080355, 0, 0, 0, 1, 1,
-0.826393, 1.339349, -0.488623, 0, 0, 0, 1, 1,
-0.8224794, -0.1071582, -2.173002, 1, 1, 1, 1, 1,
-0.8174698, -1.011096, -2.095995, 1, 1, 1, 1, 1,
-0.8149307, 0.1336326, -2.248301, 1, 1, 1, 1, 1,
-0.8147426, -0.236687, -2.344087, 1, 1, 1, 1, 1,
-0.8101282, -0.9497839, -0.5659602, 1, 1, 1, 1, 1,
-0.8060284, 0.3627078, -0.4399543, 1, 1, 1, 1, 1,
-0.8027865, -1.658136, -1.069808, 1, 1, 1, 1, 1,
-0.7973462, -0.9178728, -3.545764, 1, 1, 1, 1, 1,
-0.7971873, 0.4271733, -1.575605, 1, 1, 1, 1, 1,
-0.7960214, 2.038792, -0.6540822, 1, 1, 1, 1, 1,
-0.7795538, -1.702161, -0.6547718, 1, 1, 1, 1, 1,
-0.7780007, 1.814242, 0.1606676, 1, 1, 1, 1, 1,
-0.7765679, 0.9234734, -2.264229, 1, 1, 1, 1, 1,
-0.7748742, 1.349591, 0.3896495, 1, 1, 1, 1, 1,
-0.7725348, -1.869979, -2.409119, 1, 1, 1, 1, 1,
-0.771327, -0.7351445, -1.939774, 0, 0, 1, 1, 1,
-0.7664855, 0.682297, 0.4577251, 1, 0, 0, 1, 1,
-0.7605987, 1.137062, -1.05221, 1, 0, 0, 1, 1,
-0.7538444, -1.762781, -3.527417, 1, 0, 0, 1, 1,
-0.7483004, -0.1799023, -2.255223, 1, 0, 0, 1, 1,
-0.7466539, 0.08346223, -3.115257, 1, 0, 0, 1, 1,
-0.7455066, 0.531046, -1.538042, 0, 0, 0, 1, 1,
-0.7378827, 2.057857, -0.8783835, 0, 0, 0, 1, 1,
-0.7357226, 1.706797, -0.4146239, 0, 0, 0, 1, 1,
-0.7340956, -0.04018654, -2.409291, 0, 0, 0, 1, 1,
-0.7272354, 1.461972, 0.2944744, 0, 0, 0, 1, 1,
-0.7265123, -0.1924075, -2.508003, 0, 0, 0, 1, 1,
-0.7262037, -0.1922214, -1.415588, 0, 0, 0, 1, 1,
-0.7197545, 0.1844018, -1.570434, 1, 1, 1, 1, 1,
-0.7138079, -1.996874, -3.740221, 1, 1, 1, 1, 1,
-0.7108314, 0.5408576, -0.4082484, 1, 1, 1, 1, 1,
-0.7047976, -0.0041886, -1.261766, 1, 1, 1, 1, 1,
-0.7032979, -0.1112715, -1.097836, 1, 1, 1, 1, 1,
-0.7016432, -0.01381546, -1.182669, 1, 1, 1, 1, 1,
-0.6926909, -0.5383977, -2.255338, 1, 1, 1, 1, 1,
-0.68932, 0.5071114, -1.263448, 1, 1, 1, 1, 1,
-0.6837835, -0.1137321, -1.527056, 1, 1, 1, 1, 1,
-0.6823931, 0.7641151, -0.3664628, 1, 1, 1, 1, 1,
-0.6795754, -1.459321, -2.532134, 1, 1, 1, 1, 1,
-0.6765868, -0.5775315, -0.8072233, 1, 1, 1, 1, 1,
-0.6719331, 0.9715851, 0.1955223, 1, 1, 1, 1, 1,
-0.6612066, 1.049358, 0.3492498, 1, 1, 1, 1, 1,
-0.6558743, -1.089897, -1.554076, 1, 1, 1, 1, 1,
-0.6512329, -0.1559376, -0.4893309, 0, 0, 1, 1, 1,
-0.6493179, -1.362652, -2.466493, 1, 0, 0, 1, 1,
-0.6480598, -0.1022544, -3.151037, 1, 0, 0, 1, 1,
-0.64241, -0.04000402, -1.158823, 1, 0, 0, 1, 1,
-0.6417263, -0.7118925, -1.628499, 1, 0, 0, 1, 1,
-0.6338691, -0.3516349, -1.196435, 1, 0, 0, 1, 1,
-0.632556, 1.04251, 1.772818, 0, 0, 0, 1, 1,
-0.6267083, -1.64533, -2.421157, 0, 0, 0, 1, 1,
-0.6221928, -0.01277202, -0.8731766, 0, 0, 0, 1, 1,
-0.6215848, 1.078284, -2.216965, 0, 0, 0, 1, 1,
-0.6189308, 1.434801, -0.8689621, 0, 0, 0, 1, 1,
-0.6061799, -0.4707981, -1.255367, 0, 0, 0, 1, 1,
-0.5901313, -0.05040973, -3.333641, 0, 0, 0, 1, 1,
-0.5866194, 0.03672536, -3.165395, 1, 1, 1, 1, 1,
-0.5842904, 0.1843596, -2.216314, 1, 1, 1, 1, 1,
-0.5835122, -0.3771209, -1.71575, 1, 1, 1, 1, 1,
-0.5820836, 0.01681723, -2.819827, 1, 1, 1, 1, 1,
-0.5818388, 1.294167, -2.218366, 1, 1, 1, 1, 1,
-0.5794446, -0.2330471, -1.208127, 1, 1, 1, 1, 1,
-0.5774924, -0.1320502, -2.691477, 1, 1, 1, 1, 1,
-0.5755421, 0.262935, -0.9754714, 1, 1, 1, 1, 1,
-0.5740636, 1.389835, 0.911447, 1, 1, 1, 1, 1,
-0.5737253, 1.05403, -1.276456, 1, 1, 1, 1, 1,
-0.5733668, 0.4397268, -0.8519183, 1, 1, 1, 1, 1,
-0.5714359, -0.2567609, -1.755956, 1, 1, 1, 1, 1,
-0.5675403, 0.5978004, -1.439223, 1, 1, 1, 1, 1,
-0.5667382, -0.5424142, -3.570064, 1, 1, 1, 1, 1,
-0.5606143, -0.7018045, -1.247029, 1, 1, 1, 1, 1,
-0.5592083, -1.570889, -2.108682, 0, 0, 1, 1, 1,
-0.5588655, 0.1402713, -1.106631, 1, 0, 0, 1, 1,
-0.5573701, 0.526788, 0.5075426, 1, 0, 0, 1, 1,
-0.5566214, 2.96183, 0.3488672, 1, 0, 0, 1, 1,
-0.5512646, -1.19944, -3.36248, 1, 0, 0, 1, 1,
-0.5434676, -0.4105791, -1.772463, 1, 0, 0, 1, 1,
-0.5415375, -0.2370349, -0.8822204, 0, 0, 0, 1, 1,
-0.5343671, 0.8788044, -0.01466447, 0, 0, 0, 1, 1,
-0.5331531, 0.7146792, -1.571163, 0, 0, 0, 1, 1,
-0.5308719, -0.5200632, -4.054354, 0, 0, 0, 1, 1,
-0.52347, -1.275901, -1.368845, 0, 0, 0, 1, 1,
-0.5204357, -0.2799741, -4.057889, 0, 0, 0, 1, 1,
-0.5077714, -1.674325, -1.751438, 0, 0, 0, 1, 1,
-0.5074289, -0.476583, -2.873281, 1, 1, 1, 1, 1,
-0.5045196, 0.790894, -2.272589, 1, 1, 1, 1, 1,
-0.5021556, 0.4522963, -2.095859, 1, 1, 1, 1, 1,
-0.5010247, 0.8091609, 1.650991, 1, 1, 1, 1, 1,
-0.4985654, -1.042216, -2.425436, 1, 1, 1, 1, 1,
-0.4937522, 1.623497, 0.6792242, 1, 1, 1, 1, 1,
-0.4921089, -0.6654891, -2.893778, 1, 1, 1, 1, 1,
-0.4919771, -0.1348282, -1.578951, 1, 1, 1, 1, 1,
-0.4872362, -1.918018, -1.966392, 1, 1, 1, 1, 1,
-0.4821965, -0.918352, -1.563875, 1, 1, 1, 1, 1,
-0.4752057, 1.122864, -1.546162, 1, 1, 1, 1, 1,
-0.474082, 0.267808, -2.772575, 1, 1, 1, 1, 1,
-0.4727379, -0.1131412, -2.317211, 1, 1, 1, 1, 1,
-0.4714656, 0.7077282, -1.077494, 1, 1, 1, 1, 1,
-0.4681585, -1.026328, -1.27461, 1, 1, 1, 1, 1,
-0.4674371, 0.5443775, -0.1108964, 0, 0, 1, 1, 1,
-0.4650634, 1.828449, 0.3451906, 1, 0, 0, 1, 1,
-0.4646268, 1.293413, 0.9520883, 1, 0, 0, 1, 1,
-0.4628124, -0.3422646, -2.911532, 1, 0, 0, 1, 1,
-0.4595129, 1.276936, 0.5417442, 1, 0, 0, 1, 1,
-0.450153, -1.561112, -4.612067, 1, 0, 0, 1, 1,
-0.4488521, 1.262621, 0.7929949, 0, 0, 0, 1, 1,
-0.4466074, -1.574603, -3.599906, 0, 0, 0, 1, 1,
-0.4458725, 0.09981927, -1.542549, 0, 0, 0, 1, 1,
-0.4429999, 0.3568137, -0.01731697, 0, 0, 0, 1, 1,
-0.4423034, -1.148228, -1.928975, 0, 0, 0, 1, 1,
-0.4414641, -1.786265, -3.070055, 0, 0, 0, 1, 1,
-0.440483, 0.9216264, 0.3647228, 0, 0, 0, 1, 1,
-0.4389926, -1.387632, -3.532286, 1, 1, 1, 1, 1,
-0.43766, 0.7846234, 0.967699, 1, 1, 1, 1, 1,
-0.4330793, 0.09842622, -3.088542, 1, 1, 1, 1, 1,
-0.4329079, -0.4111625, -0.9191254, 1, 1, 1, 1, 1,
-0.4259166, 0.8828275, -1.31577, 1, 1, 1, 1, 1,
-0.4255303, 1.268693, -1.482444, 1, 1, 1, 1, 1,
-0.4152271, -2.832109, -2.609326, 1, 1, 1, 1, 1,
-0.4148595, -0.05329098, -1.332767, 1, 1, 1, 1, 1,
-0.413089, -0.3074812, -0.8521892, 1, 1, 1, 1, 1,
-0.4090126, 0.4550458, -0.825486, 1, 1, 1, 1, 1,
-0.407643, -1.64193, -3.8737, 1, 1, 1, 1, 1,
-0.4063485, 0.5537301, -0.9597508, 1, 1, 1, 1, 1,
-0.4062584, 1.331003, 0.5402468, 1, 1, 1, 1, 1,
-0.4058367, 0.2820189, -0.4240294, 1, 1, 1, 1, 1,
-0.4026163, 0.173098, 0.5649985, 1, 1, 1, 1, 1,
-0.4005373, -1.568157, -4.163838, 0, 0, 1, 1, 1,
-0.3999292, -1.67459, -2.015429, 1, 0, 0, 1, 1,
-0.3962335, 0.519729, -1.54789, 1, 0, 0, 1, 1,
-0.3933641, 0.4272841, -0.3074575, 1, 0, 0, 1, 1,
-0.38648, 2.007454, -0.08730149, 1, 0, 0, 1, 1,
-0.3826992, 0.229645, -2.200225, 1, 0, 0, 1, 1,
-0.3788136, -0.09199791, 0.3920459, 0, 0, 0, 1, 1,
-0.3726023, -0.3625636, -2.244921, 0, 0, 0, 1, 1,
-0.3694406, 0.5612471, -1.532951, 0, 0, 0, 1, 1,
-0.3673063, 0.1985079, -1.494749, 0, 0, 0, 1, 1,
-0.3672788, -0.7640134, -4.666815, 0, 0, 0, 1, 1,
-0.3664306, 2.004937, -1.564071, 0, 0, 0, 1, 1,
-0.3662449, -0.7571967, -1.495886, 0, 0, 0, 1, 1,
-0.3658185, -0.2889992, -2.37207, 1, 1, 1, 1, 1,
-0.3634081, 1.197561, -0.357282, 1, 1, 1, 1, 1,
-0.3622535, -0.5512647, -1.900546, 1, 1, 1, 1, 1,
-0.3611331, 0.7602358, 0.735706, 1, 1, 1, 1, 1,
-0.3586358, -0.4601021, -3.01655, 1, 1, 1, 1, 1,
-0.3558799, 0.7299606, 0.4667057, 1, 1, 1, 1, 1,
-0.3497032, -1.351525, -4.393905, 1, 1, 1, 1, 1,
-0.3479461, -0.1617887, -2.944198, 1, 1, 1, 1, 1,
-0.3451557, -1.060561, -3.06743, 1, 1, 1, 1, 1,
-0.343366, -0.7892979, -3.281315, 1, 1, 1, 1, 1,
-0.3408983, 0.5592266, 0.2429335, 1, 1, 1, 1, 1,
-0.336069, -0.3295677, -3.156892, 1, 1, 1, 1, 1,
-0.3337825, 1.30825, 0.3122834, 1, 1, 1, 1, 1,
-0.3334356, -0.1368197, -0.8486215, 1, 1, 1, 1, 1,
-0.3315399, 0.5344764, -1.799064, 1, 1, 1, 1, 1,
-0.3307133, -0.6991765, -3.565043, 0, 0, 1, 1, 1,
-0.3304167, 0.6136461, -2.196778, 1, 0, 0, 1, 1,
-0.3302835, -0.4431105, -2.275383, 1, 0, 0, 1, 1,
-0.3296604, 0.4504593, -1.431026, 1, 0, 0, 1, 1,
-0.3243714, 0.5163956, 0.6896191, 1, 0, 0, 1, 1,
-0.324206, 0.2766768, -0.6826851, 1, 0, 0, 1, 1,
-0.3236286, -0.2910746, -3.449791, 0, 0, 0, 1, 1,
-0.3214397, -1.395128, -3.787991, 0, 0, 0, 1, 1,
-0.3133465, -1.453508, -2.747995, 0, 0, 0, 1, 1,
-0.3127883, 1.339931, 0.8750628, 0, 0, 0, 1, 1,
-0.3096568, 0.5876668, -0.6217421, 0, 0, 0, 1, 1,
-0.3078125, -0.1784519, -4.171872, 0, 0, 0, 1, 1,
-0.307158, -0.04216547, -1.792596, 0, 0, 0, 1, 1,
-0.305034, -0.8066711, -3.625786, 1, 1, 1, 1, 1,
-0.3041651, 0.07082718, -2.821717, 1, 1, 1, 1, 1,
-0.3029311, -0.7276349, -3.072253, 1, 1, 1, 1, 1,
-0.302918, 1.921806, 1.274231, 1, 1, 1, 1, 1,
-0.2991588, -0.793813, -2.330152, 1, 1, 1, 1, 1,
-0.2950777, 0.703629, 0.1424392, 1, 1, 1, 1, 1,
-0.294632, -2.23667, -3.173154, 1, 1, 1, 1, 1,
-0.2934731, -0.5020763, -3.22908, 1, 1, 1, 1, 1,
-0.2925703, 1.139399, -0.6723359, 1, 1, 1, 1, 1,
-0.2881242, 1.365369, 0.8682439, 1, 1, 1, 1, 1,
-0.2854609, -1.100377, -3.352724, 1, 1, 1, 1, 1,
-0.2804782, 1.484066, 0.05080905, 1, 1, 1, 1, 1,
-0.2790312, -0.4118991, -3.417621, 1, 1, 1, 1, 1,
-0.2770271, 1.020487, -0.07190094, 1, 1, 1, 1, 1,
-0.2756974, -0.953543, -2.862167, 1, 1, 1, 1, 1,
-0.2748658, -0.07589307, -2.633395, 0, 0, 1, 1, 1,
-0.2745436, -0.6055207, -3.066206, 1, 0, 0, 1, 1,
-0.2734561, 0.3803587, -1.034585, 1, 0, 0, 1, 1,
-0.2700203, 1.484544, 0.3953442, 1, 0, 0, 1, 1,
-0.2673682, -0.2991389, -3.239484, 1, 0, 0, 1, 1,
-0.2648293, 0.2256993, -0.5980436, 1, 0, 0, 1, 1,
-0.264366, -1.090888, -2.26493, 0, 0, 0, 1, 1,
-0.2617863, -0.2649406, -2.038131, 0, 0, 0, 1, 1,
-0.2559414, 0.3475348, -1.250953, 0, 0, 0, 1, 1,
-0.2547913, -0.2522312, -2.022677, 0, 0, 0, 1, 1,
-0.2539031, -0.04455513, -2.252341, 0, 0, 0, 1, 1,
-0.2536125, -1.507393, -0.7733285, 0, 0, 0, 1, 1,
-0.2491425, 0.6240593, -0.8402253, 0, 0, 0, 1, 1,
-0.2470427, -0.03954631, -4.122331, 1, 1, 1, 1, 1,
-0.2464437, -2.432155, -3.286103, 1, 1, 1, 1, 1,
-0.2369419, -1.816533, -3.345044, 1, 1, 1, 1, 1,
-0.2339188, -0.8704066, -1.885184, 1, 1, 1, 1, 1,
-0.2246093, -1.091312, -2.980488, 1, 1, 1, 1, 1,
-0.2238417, -0.6869584, -2.457457, 1, 1, 1, 1, 1,
-0.2232779, -0.154385, -0.7399684, 1, 1, 1, 1, 1,
-0.2216559, 0.8844042, -1.284434, 1, 1, 1, 1, 1,
-0.2204508, -0.5211911, -1.48697, 1, 1, 1, 1, 1,
-0.217939, 0.6966355, 0.5774839, 1, 1, 1, 1, 1,
-0.2174469, 0.8882118, 0.6743191, 1, 1, 1, 1, 1,
-0.2156451, -1.007468, -1.195326, 1, 1, 1, 1, 1,
-0.2141727, -1.676436, -2.594093, 1, 1, 1, 1, 1,
-0.2133238, 1.007114, -0.4553538, 1, 1, 1, 1, 1,
-0.2117834, -0.8097559, -4.06532, 1, 1, 1, 1, 1,
-0.1905603, -0.05097387, -3.494229, 0, 0, 1, 1, 1,
-0.1897481, -0.6624295, -3.275799, 1, 0, 0, 1, 1,
-0.1893911, 0.03994041, -1.726188, 1, 0, 0, 1, 1,
-0.1861537, 0.1812739, -1.728982, 1, 0, 0, 1, 1,
-0.1845982, 1.055858, -0.07190116, 1, 0, 0, 1, 1,
-0.1820639, 0.4077997, -1.208562, 1, 0, 0, 1, 1,
-0.174777, -0.008182365, -3.574237, 0, 0, 0, 1, 1,
-0.1746826, 1.574681, 1.203226, 0, 0, 0, 1, 1,
-0.1719227, -1.444653, -3.415652, 0, 0, 0, 1, 1,
-0.1716965, -0.7477545, -1.882401, 0, 0, 0, 1, 1,
-0.167752, -0.8216901, -3.609359, 0, 0, 0, 1, 1,
-0.1654207, -0.6828611, -5.397588, 0, 0, 0, 1, 1,
-0.1619303, -0.6972073, -3.021082, 0, 0, 0, 1, 1,
-0.1578703, 0.7311482, 0.01895309, 1, 1, 1, 1, 1,
-0.1576674, -0.13568, -3.005732, 1, 1, 1, 1, 1,
-0.1568785, -0.1980542, -6.076288, 1, 1, 1, 1, 1,
-0.1558623, -0.2479575, -2.261468, 1, 1, 1, 1, 1,
-0.1554008, 2.343133, 0.7983284, 1, 1, 1, 1, 1,
-0.1541813, 0.1621025, 0.2504821, 1, 1, 1, 1, 1,
-0.153867, -0.4226804, -1.745674, 1, 1, 1, 1, 1,
-0.1529059, -1.398624, -2.436077, 1, 1, 1, 1, 1,
-0.1445228, -1.237438, -2.897485, 1, 1, 1, 1, 1,
-0.1422106, -1.175524, -3.429402, 1, 1, 1, 1, 1,
-0.1414656, -0.7236322, -3.780388, 1, 1, 1, 1, 1,
-0.1402397, -0.1442255, -2.07678, 1, 1, 1, 1, 1,
-0.1388032, 0.3336321, -0.2312875, 1, 1, 1, 1, 1,
-0.1338475, -0.3567806, -4.233991, 1, 1, 1, 1, 1,
-0.1323708, 0.1911594, -1.38898, 1, 1, 1, 1, 1,
-0.1302509, 2.600836, 0.6799201, 0, 0, 1, 1, 1,
-0.1270583, 0.4197689, -0.8915664, 1, 0, 0, 1, 1,
-0.1201585, 0.6760309, -1.350722, 1, 0, 0, 1, 1,
-0.1201015, 2.037215, 1.425061, 1, 0, 0, 1, 1,
-0.1182796, -1.538218, -0.9545768, 1, 0, 0, 1, 1,
-0.1175737, -1.281887, -2.923856, 1, 0, 0, 1, 1,
-0.1174248, -1.388686, -2.606085, 0, 0, 0, 1, 1,
-0.1170844, 0.9580044, -0.05164805, 0, 0, 0, 1, 1,
-0.1100723, 1.344538, 0.8518176, 0, 0, 0, 1, 1,
-0.1072197, -1.787053, -3.237825, 0, 0, 0, 1, 1,
-0.1064544, 0.7557802, 0.1535034, 0, 0, 0, 1, 1,
-0.105365, -1.85388, -2.982856, 0, 0, 0, 1, 1,
-0.1011969, -1.203745, -4.86053, 0, 0, 0, 1, 1,
-0.1006726, 1.635144, -1.049159, 1, 1, 1, 1, 1,
-0.09760876, 0.2632334, -2.333836, 1, 1, 1, 1, 1,
-0.09736105, -2.388175, -4.644525, 1, 1, 1, 1, 1,
-0.09550487, -0.02766341, 0.08486039, 1, 1, 1, 1, 1,
-0.09136655, 1.531256, -0.5497159, 1, 1, 1, 1, 1,
-0.09083442, 0.357199, 0.04929001, 1, 1, 1, 1, 1,
-0.08880004, 0.4039737, 0.09651807, 1, 1, 1, 1, 1,
-0.08166515, 1.135909, -0.06915702, 1, 1, 1, 1, 1,
-0.07859676, 1.342039, -1.129327, 1, 1, 1, 1, 1,
-0.07713412, 1.592374, -0.003454013, 1, 1, 1, 1, 1,
-0.07406325, 1.427609, -0.4542355, 1, 1, 1, 1, 1,
-0.07121284, 0.05017301, -0.5107611, 1, 1, 1, 1, 1,
-0.06835777, 1.832192, -0.103478, 1, 1, 1, 1, 1,
-0.06773061, -0.6350475, -1.727917, 1, 1, 1, 1, 1,
-0.06644313, -1.135945, -5.487064, 1, 1, 1, 1, 1,
-0.05564457, 1.505541, -0.7487996, 0, 0, 1, 1, 1,
-0.05526765, 0.7044148, -0.6052194, 1, 0, 0, 1, 1,
-0.05493302, -1.287654, -5.003605, 1, 0, 0, 1, 1,
-0.05373391, 0.8439801, -0.2878935, 1, 0, 0, 1, 1,
-0.05360027, -0.2641461, -3.676316, 1, 0, 0, 1, 1,
-0.04523977, -1.774947, -3.936662, 1, 0, 0, 1, 1,
-0.04502277, -0.1385029, -2.127943, 0, 0, 0, 1, 1,
-0.04213925, 0.1029277, 0.6122112, 0, 0, 0, 1, 1,
-0.03836845, 0.9621009, -0.08924945, 0, 0, 0, 1, 1,
-0.03617469, -1.10605, -3.874216, 0, 0, 0, 1, 1,
-0.03415201, -0.241765, -0.8478743, 0, 0, 0, 1, 1,
-0.03294615, 0.3666201, -0.9294043, 0, 0, 0, 1, 1,
-0.02842934, -0.5626618, -4.024011, 0, 0, 0, 1, 1,
-0.02585196, 0.04392036, -0.4147999, 1, 1, 1, 1, 1,
-0.02460316, -0.4398172, -2.425942, 1, 1, 1, 1, 1,
-0.02215517, 0.1740378, -0.2423827, 1, 1, 1, 1, 1,
-0.01973403, 0.414003, 2.298383, 1, 1, 1, 1, 1,
-0.01417506, 0.3463204, 1.361131, 1, 1, 1, 1, 1,
-0.01367503, -0.2996811, -0.9627099, 1, 1, 1, 1, 1,
-0.009968069, 0.7938683, -0.1449537, 1, 1, 1, 1, 1,
-0.002361505, -1.058887, -2.373359, 1, 1, 1, 1, 1,
0.0006302026, 1.075956, -0.7418122, 1, 1, 1, 1, 1,
0.001883653, -0.6830977, 4.991338, 1, 1, 1, 1, 1,
0.00270466, -1.80971, 2.640642, 1, 1, 1, 1, 1,
0.01415014, -1.040328, 2.69104, 1, 1, 1, 1, 1,
0.01767051, 0.6024123, -0.369161, 1, 1, 1, 1, 1,
0.02373466, 0.860269, -0.8780872, 1, 1, 1, 1, 1,
0.02409542, -1.242982, 2.487958, 1, 1, 1, 1, 1,
0.02542592, 0.7529818, 0.8822879, 0, 0, 1, 1, 1,
0.02847613, -1.736903, 3.713423, 1, 0, 0, 1, 1,
0.03651816, -0.9555104, 3.468524, 1, 0, 0, 1, 1,
0.04005671, -0.8133659, 3.107659, 1, 0, 0, 1, 1,
0.04113746, 0.660419, 0.01946287, 1, 0, 0, 1, 1,
0.04393172, 0.6379203, 1.734232, 1, 0, 0, 1, 1,
0.04473538, -0.1667642, 4.633882, 0, 0, 0, 1, 1,
0.04622702, 0.2132592, -0.4419619, 0, 0, 0, 1, 1,
0.05084995, -1.102089, 4.018313, 0, 0, 0, 1, 1,
0.0599318, 1.42128, 1.140983, 0, 0, 0, 1, 1,
0.06171092, -0.6282661, 3.611296, 0, 0, 0, 1, 1,
0.06204261, -1.319594, 3.376224, 0, 0, 0, 1, 1,
0.06237399, 0.04393221, 1.438515, 0, 0, 0, 1, 1,
0.06478212, -1.121105, 3.849344, 1, 1, 1, 1, 1,
0.06777047, 0.4053571, 0.3258567, 1, 1, 1, 1, 1,
0.06814378, 0.565925, 1.431151, 1, 1, 1, 1, 1,
0.07158063, 0.1223136, 0.3064536, 1, 1, 1, 1, 1,
0.07635966, 1.071637, 1.156002, 1, 1, 1, 1, 1,
0.08061905, -0.07805284, 1.342902, 1, 1, 1, 1, 1,
0.0862895, 0.5366965, 0.3687307, 1, 1, 1, 1, 1,
0.08821747, -0.04652251, 1.727666, 1, 1, 1, 1, 1,
0.08926003, -0.6387359, 3.9536, 1, 1, 1, 1, 1,
0.09033737, -0.3775284, 2.901022, 1, 1, 1, 1, 1,
0.09334405, -0.4250161, 3.681366, 1, 1, 1, 1, 1,
0.09367097, -0.08803876, 3.103106, 1, 1, 1, 1, 1,
0.09383689, 0.884689, 0.204856, 1, 1, 1, 1, 1,
0.09531343, 1.098907, 0.7197829, 1, 1, 1, 1, 1,
0.09671363, 1.074515, 0.9442568, 1, 1, 1, 1, 1,
0.0967496, 1.428355, 0.5064783, 0, 0, 1, 1, 1,
0.0980106, -0.6667879, 3.65268, 1, 0, 0, 1, 1,
0.1045457, -1.256114, 0.6529373, 1, 0, 0, 1, 1,
0.1062124, 0.8975092, 0.839109, 1, 0, 0, 1, 1,
0.1080274, -0.877179, 4.607761, 1, 0, 0, 1, 1,
0.1086333, -0.2506061, 1.67624, 1, 0, 0, 1, 1,
0.1143054, -0.1347744, 2.315251, 0, 0, 0, 1, 1,
0.1162395, -1.815054, 2.167316, 0, 0, 0, 1, 1,
0.1190311, 1.018185, 0.2774622, 0, 0, 0, 1, 1,
0.119199, -0.6905879, 2.441667, 0, 0, 0, 1, 1,
0.1212406, 1.230289, 0.7891467, 0, 0, 0, 1, 1,
0.1285411, -0.5539508, 1.540186, 0, 0, 0, 1, 1,
0.1296154, 2.163468, -0.9913671, 0, 0, 0, 1, 1,
0.1385763, -0.3713121, 2.872931, 1, 1, 1, 1, 1,
0.1399165, -0.4066191, 2.099939, 1, 1, 1, 1, 1,
0.1420201, -1.549865, 3.006687, 1, 1, 1, 1, 1,
0.1473601, -0.1308675, 3.087823, 1, 1, 1, 1, 1,
0.1520502, -0.7620041, 1.999967, 1, 1, 1, 1, 1,
0.1522055, -1.423984, 2.442832, 1, 1, 1, 1, 1,
0.1570531, 1.041957, -0.8930073, 1, 1, 1, 1, 1,
0.1594942, 0.8874703, -0.6587594, 1, 1, 1, 1, 1,
0.1627614, -0.3266255, 2.23139, 1, 1, 1, 1, 1,
0.1652427, 0.3273677, -0.4984656, 1, 1, 1, 1, 1,
0.1722598, -1.017602, 3.762817, 1, 1, 1, 1, 1,
0.1724054, -0.533194, 1.581396, 1, 1, 1, 1, 1,
0.1741305, -0.5866994, 3.397073, 1, 1, 1, 1, 1,
0.1751531, 0.5966778, 0.4122788, 1, 1, 1, 1, 1,
0.1760975, -0.3410566, 1.944916, 1, 1, 1, 1, 1,
0.1782629, 0.02803102, 2.154026, 0, 0, 1, 1, 1,
0.1788886, -0.7355094, 2.831323, 1, 0, 0, 1, 1,
0.1801393, -0.4713953, 2.653768, 1, 0, 0, 1, 1,
0.1823599, 0.5016672, 1.836035, 1, 0, 0, 1, 1,
0.1847921, 1.106876, -1.32023, 1, 0, 0, 1, 1,
0.1873401, -0.3862954, 3.716858, 1, 0, 0, 1, 1,
0.1884792, -0.7000521, 1.302175, 0, 0, 0, 1, 1,
0.1904893, -0.4416575, 1.339086, 0, 0, 0, 1, 1,
0.1912126, 1.533374, 0.1596394, 0, 0, 0, 1, 1,
0.1916547, -0.2190165, 3.268367, 0, 0, 0, 1, 1,
0.1919838, -0.07233343, 1.977614, 0, 0, 0, 1, 1,
0.1969391, 0.2211493, -1.641873, 0, 0, 0, 1, 1,
0.1982243, 0.01350957, 1.324391, 0, 0, 0, 1, 1,
0.203333, 1.312919, 1.181301, 1, 1, 1, 1, 1,
0.205536, 0.5068432, 1.860571, 1, 1, 1, 1, 1,
0.2070161, -0.6420217, 4.437295, 1, 1, 1, 1, 1,
0.2079125, 1.415251, 1.264561, 1, 1, 1, 1, 1,
0.2085966, -0.8449667, 0.2943131, 1, 1, 1, 1, 1,
0.2090665, 2.167907, 0.3622869, 1, 1, 1, 1, 1,
0.209255, 0.698562, -0.543111, 1, 1, 1, 1, 1,
0.2168891, 0.009776805, 1.071416, 1, 1, 1, 1, 1,
0.2186436, -0.5881634, 1.297273, 1, 1, 1, 1, 1,
0.2207358, -0.9168156, 4.821167, 1, 1, 1, 1, 1,
0.2207945, -2.079529, 3.41461, 1, 1, 1, 1, 1,
0.2207985, 1.506405, 0.343451, 1, 1, 1, 1, 1,
0.2235428, -0.8364663, 2.221651, 1, 1, 1, 1, 1,
0.2244127, -2.197812, 2.207009, 1, 1, 1, 1, 1,
0.2246578, 0.164688, 1.409021, 1, 1, 1, 1, 1,
0.2336151, 0.2740839, 0.9666712, 0, 0, 1, 1, 1,
0.2430732, 0.4908528, -1.299528, 1, 0, 0, 1, 1,
0.2442037, -1.709845, 2.163563, 1, 0, 0, 1, 1,
0.244826, 1.57533, 0.006451569, 1, 0, 0, 1, 1,
0.2470578, -1.03014, 2.947504, 1, 0, 0, 1, 1,
0.2470614, -0.4138454, 0.4905939, 1, 0, 0, 1, 1,
0.248392, -0.008853665, 1.54862, 0, 0, 0, 1, 1,
0.248759, 0.9498243, -2.39693, 0, 0, 0, 1, 1,
0.2491045, 2.090587, 0.8003168, 0, 0, 0, 1, 1,
0.2531406, 0.6984493, 1.638743, 0, 0, 0, 1, 1,
0.2549175, 0.712583, 1.162097, 0, 0, 0, 1, 1,
0.2569962, 0.7203795, 0.4616196, 0, 0, 0, 1, 1,
0.2572959, -0.4545159, 2.115934, 0, 0, 0, 1, 1,
0.2582024, -0.592404, 2.344406, 1, 1, 1, 1, 1,
0.2604249, -0.5304435, 4.060876, 1, 1, 1, 1, 1,
0.2614789, 0.01425176, 2.754016, 1, 1, 1, 1, 1,
0.267735, 0.7438601, 0.7986195, 1, 1, 1, 1, 1,
0.268006, -0.5546461, 0.09504293, 1, 1, 1, 1, 1,
0.2717498, -0.7458804, 3.353419, 1, 1, 1, 1, 1,
0.2736134, -0.2612263, 3.990361, 1, 1, 1, 1, 1,
0.277295, -1.081511, 2.065657, 1, 1, 1, 1, 1,
0.2784265, -0.8420867, 2.589185, 1, 1, 1, 1, 1,
0.2793249, -1.258584, 2.489187, 1, 1, 1, 1, 1,
0.2828584, -1.418598, 3.266347, 1, 1, 1, 1, 1,
0.2830986, -0.2990103, 3.00431, 1, 1, 1, 1, 1,
0.2864899, 0.8078192, -1.069075, 1, 1, 1, 1, 1,
0.2870906, 2.138562, -1.425283, 1, 1, 1, 1, 1,
0.2879928, -0.2442581, 2.401081, 1, 1, 1, 1, 1,
0.2935745, 0.4223187, 0.09942767, 0, 0, 1, 1, 1,
0.3030252, 0.2117311, 1.704691, 1, 0, 0, 1, 1,
0.3030381, -2.89472, 2.960826, 1, 0, 0, 1, 1,
0.3059779, 0.8335738, 1.128842, 1, 0, 0, 1, 1,
0.3085835, 1.28229, 1.861118, 1, 0, 0, 1, 1,
0.3119542, 0.6127003, 0.6682839, 1, 0, 0, 1, 1,
0.3134041, 0.09948601, 0.8905614, 0, 0, 0, 1, 1,
0.3141923, 0.6426381, 0.9595539, 0, 0, 0, 1, 1,
0.3165078, -0.03662394, 1.346548, 0, 0, 0, 1, 1,
0.3194984, 2.235534, 1.141403, 0, 0, 0, 1, 1,
0.3205932, -0.7944747, 2.075795, 0, 0, 0, 1, 1,
0.3206927, -1.81287, 2.61165, 0, 0, 0, 1, 1,
0.3211593, -1.321719, 2.556646, 0, 0, 0, 1, 1,
0.3261208, 1.282453, -0.05914235, 1, 1, 1, 1, 1,
0.33001, 2.170342, -1.380998, 1, 1, 1, 1, 1,
0.3310391, 0.342216, 0.5563084, 1, 1, 1, 1, 1,
0.3319793, -2.656943, 2.783771, 1, 1, 1, 1, 1,
0.3350403, -1.275451, 3.738039, 1, 1, 1, 1, 1,
0.3358213, -0.7137029, 1.92928, 1, 1, 1, 1, 1,
0.3404854, -0.0861733, 2.818439, 1, 1, 1, 1, 1,
0.3417251, 0.3318114, 2.164491, 1, 1, 1, 1, 1,
0.346753, -0.8058733, 3.535515, 1, 1, 1, 1, 1,
0.3471777, -0.3727041, 2.200523, 1, 1, 1, 1, 1,
0.3482154, -0.1788574, 1.748204, 1, 1, 1, 1, 1,
0.3496006, 0.9702049, 1.133921, 1, 1, 1, 1, 1,
0.3514845, 0.3987556, 0.5204354, 1, 1, 1, 1, 1,
0.3537678, 1.269436, 1.647214, 1, 1, 1, 1, 1,
0.3542872, -0.513044, 4.017029, 1, 1, 1, 1, 1,
0.3564678, -0.7115883, 1.278968, 0, 0, 1, 1, 1,
0.3609723, -0.2950798, 1.416666, 1, 0, 0, 1, 1,
0.3657413, 1.527194, -0.3628994, 1, 0, 0, 1, 1,
0.367327, 0.2607178, 1.887514, 1, 0, 0, 1, 1,
0.3688072, 0.1893055, 1.974177, 1, 0, 0, 1, 1,
0.368887, 1.402502, -0.1875576, 1, 0, 0, 1, 1,
0.3711462, 0.9023623, 1.01294, 0, 0, 0, 1, 1,
0.37362, 0.9208745, 1.621539, 0, 0, 0, 1, 1,
0.374447, 0.6343434, -0.1687941, 0, 0, 0, 1, 1,
0.3748305, 1.421101, 1.730239, 0, 0, 0, 1, 1,
0.3760655, -1.209031, 1.988638, 0, 0, 0, 1, 1,
0.3797871, -0.4973817, 2.994334, 0, 0, 0, 1, 1,
0.3833747, -1.014443, 2.360491, 0, 0, 0, 1, 1,
0.3834995, 1.55221, 1.43576, 1, 1, 1, 1, 1,
0.3867955, 0.791476, 0.5136687, 1, 1, 1, 1, 1,
0.3886715, 0.5744078, -1.343873, 1, 1, 1, 1, 1,
0.3901005, 0.06342638, -0.6919357, 1, 1, 1, 1, 1,
0.3902221, -0.2209767, 0.3068183, 1, 1, 1, 1, 1,
0.3954277, -0.9112009, 2.686636, 1, 1, 1, 1, 1,
0.3997785, -0.9188054, 3.34808, 1, 1, 1, 1, 1,
0.4036386, -0.849086, 2.375924, 1, 1, 1, 1, 1,
0.4074887, -0.2034555, 1.716502, 1, 1, 1, 1, 1,
0.409828, -0.03128929, 0.1592267, 1, 1, 1, 1, 1,
0.4125894, 0.9484561, 0.4670207, 1, 1, 1, 1, 1,
0.4141142, 0.7200165, 0.17898, 1, 1, 1, 1, 1,
0.4146717, 0.1648765, 1.55134, 1, 1, 1, 1, 1,
0.4173127, -1.029191, 5.947285, 1, 1, 1, 1, 1,
0.4205141, -0.870177, 1.370098, 1, 1, 1, 1, 1,
0.4208448, -0.6968917, 3.312103, 0, 0, 1, 1, 1,
0.4221382, 0.2462057, 2.500043, 1, 0, 0, 1, 1,
0.4224091, 0.7207893, 0.3293776, 1, 0, 0, 1, 1,
0.4251908, 0.1584958, 2.260789, 1, 0, 0, 1, 1,
0.42548, 0.1124268, 1.383255, 1, 0, 0, 1, 1,
0.4270071, -0.6200928, 2.832091, 1, 0, 0, 1, 1,
0.4315298, -0.5134369, 2.220756, 0, 0, 0, 1, 1,
0.4351067, 1.041023, 0.1233694, 0, 0, 0, 1, 1,
0.4361237, 1.052093, 0.8559468, 0, 0, 0, 1, 1,
0.4416575, 0.007563827, 0.857591, 0, 0, 0, 1, 1,
0.4431139, 0.8550587, 1.528064, 0, 0, 0, 1, 1,
0.4446463, -0.7728985, 3.737427, 0, 0, 0, 1, 1,
0.4450809, -2.026554, 1.671039, 0, 0, 0, 1, 1,
0.4454103, -1.317768, 2.690315, 1, 1, 1, 1, 1,
0.4475016, 2.45228, 0.4297361, 1, 1, 1, 1, 1,
0.4488152, 0.5190157, 0.6436298, 1, 1, 1, 1, 1,
0.448868, -0.4720964, 3.863551, 1, 1, 1, 1, 1,
0.4509949, -0.1998696, -0.6782513, 1, 1, 1, 1, 1,
0.4519053, 0.3439994, 0.5932455, 1, 1, 1, 1, 1,
0.4543183, 1.312175, 2.523741, 1, 1, 1, 1, 1,
0.4555631, 2.759103, 0.01995404, 1, 1, 1, 1, 1,
0.4590733, -1.402464, 2.568707, 1, 1, 1, 1, 1,
0.4610417, -1.813519, 2.596138, 1, 1, 1, 1, 1,
0.4709945, 0.9594691, 1.006486, 1, 1, 1, 1, 1,
0.4779432, 0.08201759, 0.1930458, 1, 1, 1, 1, 1,
0.4781359, -0.3894803, 0.4818878, 1, 1, 1, 1, 1,
0.4837162, -0.8414062, 3.189446, 1, 1, 1, 1, 1,
0.4875594, -1.115612, 1.637659, 1, 1, 1, 1, 1,
0.488863, 0.8380732, 0.09797567, 0, 0, 1, 1, 1,
0.4900029, -0.9930574, 3.271657, 1, 0, 0, 1, 1,
0.4900528, -0.006528432, 3.098852, 1, 0, 0, 1, 1,
0.4901356, 0.2204702, 0.2101008, 1, 0, 0, 1, 1,
0.4960142, 2.530744, 0.6983985, 1, 0, 0, 1, 1,
0.5069734, 0.4747909, 0.09767172, 1, 0, 0, 1, 1,
0.5082254, 0.288638, 1.543296, 0, 0, 0, 1, 1,
0.5293976, -0.3077782, 2.861425, 0, 0, 0, 1, 1,
0.5334035, -1.822633, 1.301007, 0, 0, 0, 1, 1,
0.5341535, -1.910417, 2.211697, 0, 0, 0, 1, 1,
0.5353432, -0.3943207, 3.140718, 0, 0, 0, 1, 1,
0.5401061, -0.5852389, 1.051813, 0, 0, 0, 1, 1,
0.5426353, 0.2311484, 2.372139, 0, 0, 0, 1, 1,
0.5428725, -1.535193, 2.169883, 1, 1, 1, 1, 1,
0.5440372, -1.198159, 4.545208, 1, 1, 1, 1, 1,
0.5479547, -1.449514, 2.639605, 1, 1, 1, 1, 1,
0.5511689, 0.2724546, 0.7615947, 1, 1, 1, 1, 1,
0.5521364, 2.411562, 0.1717208, 1, 1, 1, 1, 1,
0.55254, 0.8052427, 1.482084, 1, 1, 1, 1, 1,
0.5539377, -0.1243851, 1.026016, 1, 1, 1, 1, 1,
0.555648, -0.140075, 1.029534, 1, 1, 1, 1, 1,
0.5609803, -0.2378392, 2.307247, 1, 1, 1, 1, 1,
0.5627525, 1.031143, -0.2250704, 1, 1, 1, 1, 1,
0.5649347, 1.454092, 0.2082674, 1, 1, 1, 1, 1,
0.5667816, -0.8752967, 2.949332, 1, 1, 1, 1, 1,
0.5721861, -0.8078456, 2.24062, 1, 1, 1, 1, 1,
0.5725394, 0.5796279, 0.4654788, 1, 1, 1, 1, 1,
0.5747099, 0.2492291, 0.985348, 1, 1, 1, 1, 1,
0.5776569, -0.938934, 3.677319, 0, 0, 1, 1, 1,
0.587814, 0.09790991, 2.305211, 1, 0, 0, 1, 1,
0.587873, 0.282064, 1.454815, 1, 0, 0, 1, 1,
0.5894278, 0.02289206, 2.509231, 1, 0, 0, 1, 1,
0.5942687, 0.4127612, 1.134182, 1, 0, 0, 1, 1,
0.5979035, 0.4298637, 0.9625465, 1, 0, 0, 1, 1,
0.6116544, 0.4245683, 0.7503307, 0, 0, 0, 1, 1,
0.6132339, -0.6538727, 2.022925, 0, 0, 0, 1, 1,
0.6179199, -1.191577, 3.359165, 0, 0, 0, 1, 1,
0.6185158, 2.040319, 0.4071651, 0, 0, 0, 1, 1,
0.6190029, -0.9319265, 3.202362, 0, 0, 0, 1, 1,
0.620653, -0.6476255, 2.63759, 0, 0, 0, 1, 1,
0.6210057, -0.9304339, 3.441772, 0, 0, 0, 1, 1,
0.6232374, 1.420757, 1.532829, 1, 1, 1, 1, 1,
0.6280184, 0.446424, 0.5270457, 1, 1, 1, 1, 1,
0.6302527, -1.314941, 2.619998, 1, 1, 1, 1, 1,
0.6319758, 0.1183531, 1.201481, 1, 1, 1, 1, 1,
0.6354844, 0.9947582, 0.63106, 1, 1, 1, 1, 1,
0.6371579, 0.1308585, 2.432816, 1, 1, 1, 1, 1,
0.6419618, -0.2906225, 0.822003, 1, 1, 1, 1, 1,
0.6460061, -0.3356997, 3.369563, 1, 1, 1, 1, 1,
0.6475233, -0.145537, -0.2960722, 1, 1, 1, 1, 1,
0.6535569, -0.3077433, 1.293524, 1, 1, 1, 1, 1,
0.6549084, -1.492415, 2.672955, 1, 1, 1, 1, 1,
0.6562762, 0.4320202, 0.2164221, 1, 1, 1, 1, 1,
0.6571603, -0.1886051, 1.177559, 1, 1, 1, 1, 1,
0.6658828, 1.281156, 0.6188605, 1, 1, 1, 1, 1,
0.6660386, 1.79162, -0.3809603, 1, 1, 1, 1, 1,
0.6664498, -0.3575355, 2.998558, 0, 0, 1, 1, 1,
0.6699007, 1.543587, 1.117349, 1, 0, 0, 1, 1,
0.6702335, 0.1826881, 1.859565, 1, 0, 0, 1, 1,
0.6746337, 0.3702954, 1.514798, 1, 0, 0, 1, 1,
0.6748449, -0.4262928, 1.466593, 1, 0, 0, 1, 1,
0.6808385, 0.4083815, 0.758886, 1, 0, 0, 1, 1,
0.682765, -0.7536352, 1.379584, 0, 0, 0, 1, 1,
0.6830626, 0.6611059, 0.1775144, 0, 0, 0, 1, 1,
0.6840277, 0.9097259, 1.370786, 0, 0, 0, 1, 1,
0.6969709, -0.4904371, 2.753274, 0, 0, 0, 1, 1,
0.6979445, -0.6003432, 2.211824, 0, 0, 0, 1, 1,
0.7103882, -0.1269456, 0.8096736, 0, 0, 0, 1, 1,
0.713953, -0.1354942, 0.6756158, 0, 0, 0, 1, 1,
0.7155304, -0.211625, 0.968104, 1, 1, 1, 1, 1,
0.7188648, -2.175685, 2.662013, 1, 1, 1, 1, 1,
0.7234454, -0.3625648, 0.4026175, 1, 1, 1, 1, 1,
0.7284571, 0.748178, 0.1015919, 1, 1, 1, 1, 1,
0.7313731, -1.334519, 1.621383, 1, 1, 1, 1, 1,
0.7330915, -1.22809, 1.99192, 1, 1, 1, 1, 1,
0.735211, -0.9085981, 3.136115, 1, 1, 1, 1, 1,
0.737204, 0.8159703, 1.420152, 1, 1, 1, 1, 1,
0.7411636, -1.928362, 2.74103, 1, 1, 1, 1, 1,
0.7418602, 0.1730409, 0.7849755, 1, 1, 1, 1, 1,
0.7421764, 1.691057, 0.3867814, 1, 1, 1, 1, 1,
0.7496984, 0.05826429, 2.704783, 1, 1, 1, 1, 1,
0.7518472, -1.158865, 0.8990143, 1, 1, 1, 1, 1,
0.754384, -0.2328474, 2.320039, 1, 1, 1, 1, 1,
0.7577162, -0.7029935, 0.5915446, 1, 1, 1, 1, 1,
0.7605752, 0.07718739, 2.162838, 0, 0, 1, 1, 1,
0.7609236, -0.7573248, 1.910423, 1, 0, 0, 1, 1,
0.7634935, -0.5884235, 0.6573302, 1, 0, 0, 1, 1,
0.7700966, -1.586004, 3.211252, 1, 0, 0, 1, 1,
0.7713434, -0.2670563, 2.887892, 1, 0, 0, 1, 1,
0.7722673, 2.38458, 0.940327, 1, 0, 0, 1, 1,
0.7745923, 0.4190159, 0.3944311, 0, 0, 0, 1, 1,
0.7763366, 0.5512095, 1.805927, 0, 0, 0, 1, 1,
0.7763649, -0.4863284, 3.413517, 0, 0, 0, 1, 1,
0.7792035, -0.8329766, 1.588766, 0, 0, 0, 1, 1,
0.7798779, 0.8587778, -0.145842, 0, 0, 0, 1, 1,
0.784683, -2.584392, 1.604898, 0, 0, 0, 1, 1,
0.7975333, -0.6133489, 1.128087, 0, 0, 0, 1, 1,
0.8016002, 0.8576331, 0.9668913, 1, 1, 1, 1, 1,
0.8048532, 0.04902156, 1.472098, 1, 1, 1, 1, 1,
0.8088149, 1.006201, 2.933828, 1, 1, 1, 1, 1,
0.8094909, -0.4774855, 1.368077, 1, 1, 1, 1, 1,
0.8116038, 0.6633829, 3.033792, 1, 1, 1, 1, 1,
0.8117424, -0.1115467, 0.2567503, 1, 1, 1, 1, 1,
0.8160712, 0.5852337, 0.6944486, 1, 1, 1, 1, 1,
0.8185644, 1.523868, -0.02349249, 1, 1, 1, 1, 1,
0.8328438, 0.3266394, 1.017821, 1, 1, 1, 1, 1,
0.8343515, 2.303128, -0.02403909, 1, 1, 1, 1, 1,
0.8356843, -1.047036, 3.730309, 1, 1, 1, 1, 1,
0.8423047, -0.05647301, 1.390906, 1, 1, 1, 1, 1,
0.8470838, -0.5165313, 3.550706, 1, 1, 1, 1, 1,
0.8481216, -1.106793, 1.010039, 1, 1, 1, 1, 1,
0.850863, 1.269632, 0.322845, 1, 1, 1, 1, 1,
0.8521384, 0.9388387, 1.341163, 0, 0, 1, 1, 1,
0.8538926, -0.215413, 1.588532, 1, 0, 0, 1, 1,
0.8556589, -0.9133126, 4.530577, 1, 0, 0, 1, 1,
0.858313, 0.1525435, 2.255991, 1, 0, 0, 1, 1,
0.8595574, -1.196889, 3.640565, 1, 0, 0, 1, 1,
0.8618277, 0.5230872, 0.6556574, 1, 0, 0, 1, 1,
0.8624908, 0.2609371, 1.506747, 0, 0, 0, 1, 1,
0.8667134, 1.29647, 3.39582, 0, 0, 0, 1, 1,
0.8697137, 1.147214, 0.03066618, 0, 0, 0, 1, 1,
0.8742693, -1.15469, 1.463689, 0, 0, 0, 1, 1,
0.8753169, 0.8906794, -0.5272727, 0, 0, 0, 1, 1,
0.875961, -0.7591808, 0.6507678, 0, 0, 0, 1, 1,
0.8778846, -1.295162, 3.179424, 0, 0, 0, 1, 1,
0.8805671, -0.6859125, 3.118673, 1, 1, 1, 1, 1,
0.8811182, 2.671352, -0.9801949, 1, 1, 1, 1, 1,
0.882288, -1.792157, 2.872271, 1, 1, 1, 1, 1,
0.8878029, -0.6754221, 1.589502, 1, 1, 1, 1, 1,
0.892163, -0.8433896, 1.769665, 1, 1, 1, 1, 1,
0.895617, -0.5952275, 1.417866, 1, 1, 1, 1, 1,
0.8987718, 0.01285851, 2.443065, 1, 1, 1, 1, 1,
0.900064, 0.6776707, 0.4008375, 1, 1, 1, 1, 1,
0.9024798, 0.3836869, 2.307267, 1, 1, 1, 1, 1,
0.9034778, -0.908955, 2.43513, 1, 1, 1, 1, 1,
0.9086754, -0.7598822, 2.905119, 1, 1, 1, 1, 1,
0.9088235, 0.4952267, 1.58769, 1, 1, 1, 1, 1,
0.9120563, 0.7230023, 1.606574, 1, 1, 1, 1, 1,
0.9181334, 0.7018609, 0.3567632, 1, 1, 1, 1, 1,
0.9254764, -1.139701, 2.504877, 1, 1, 1, 1, 1,
0.9353934, -1.354475, 2.393562, 0, 0, 1, 1, 1,
0.9362633, -0.3152499, 2.580435, 1, 0, 0, 1, 1,
0.948582, -0.07477446, 1.686277, 1, 0, 0, 1, 1,
0.9540931, 0.226297, 1.978391, 1, 0, 0, 1, 1,
0.9578106, 0.3938961, 0.04981053, 1, 0, 0, 1, 1,
0.9594145, 0.1577076, 1.159426, 1, 0, 0, 1, 1,
0.9636466, 0.41661, 1.66997, 0, 0, 0, 1, 1,
0.966935, -0.7952761, 1.078432, 0, 0, 0, 1, 1,
0.9717858, -0.2927724, 1.50353, 0, 0, 0, 1, 1,
0.981245, -0.5204276, 1.681479, 0, 0, 0, 1, 1,
0.9868119, 0.3429057, 0.3797725, 0, 0, 0, 1, 1,
0.9869192, -1.391359, 1.898618, 0, 0, 0, 1, 1,
0.9895785, 0.094901, 0.2002387, 0, 0, 0, 1, 1,
0.9905598, -0.1055581, -0.09202536, 1, 1, 1, 1, 1,
0.9994221, -1.385626, 1.362424, 1, 1, 1, 1, 1,
1.006019, 0.3892655, 1.420178, 1, 1, 1, 1, 1,
1.010254, 1.209593, 2.162257, 1, 1, 1, 1, 1,
1.014292, -0.4541184, 1.380447, 1, 1, 1, 1, 1,
1.015312, 3.365579, -1.680652, 1, 1, 1, 1, 1,
1.01655, 0.353284, 2.522057, 1, 1, 1, 1, 1,
1.019631, -0.3648868, 2.214846, 1, 1, 1, 1, 1,
1.025689, 0.1899251, 2.242274, 1, 1, 1, 1, 1,
1.03208, -1.021755, 1.762316, 1, 1, 1, 1, 1,
1.041986, -1.152537, 3.43358, 1, 1, 1, 1, 1,
1.052958, -1.297254, 0.9771111, 1, 1, 1, 1, 1,
1.057659, 0.01875555, 3.32996, 1, 1, 1, 1, 1,
1.06333, 1.881464, 0.1169556, 1, 1, 1, 1, 1,
1.064867, 0.6802907, -0.3895706, 1, 1, 1, 1, 1,
1.065485, 1.981295, 0.9334807, 0, 0, 1, 1, 1,
1.08061, 0.7435234, 0.2153472, 1, 0, 0, 1, 1,
1.088995, 1.38081, 0.09976578, 1, 0, 0, 1, 1,
1.089821, 0.402573, 2.401348, 1, 0, 0, 1, 1,
1.092673, -0.0297808, 2.374511, 1, 0, 0, 1, 1,
1.095741, -1.720596, 1.870228, 1, 0, 0, 1, 1,
1.098278, 1.520012, 0.2730182, 0, 0, 0, 1, 1,
1.100085, -0.5946624, 2.672319, 0, 0, 0, 1, 1,
1.107044, 0.1474808, 1.537418, 0, 0, 0, 1, 1,
1.110641, 1.54858, 2.202449, 0, 0, 0, 1, 1,
1.110811, -0.4846459, 2.470074, 0, 0, 0, 1, 1,
1.112156, -0.9308114, 2.726821, 0, 0, 0, 1, 1,
1.126204, 0.2814314, 1.726112, 0, 0, 0, 1, 1,
1.137477, -0.154892, 1.787495, 1, 1, 1, 1, 1,
1.138803, 1.197782, 1.43489, 1, 1, 1, 1, 1,
1.141534, -0.03240762, 1.448699, 1, 1, 1, 1, 1,
1.155273, 0.4594076, 0.7699149, 1, 1, 1, 1, 1,
1.177009, 0.01143013, 2.651352, 1, 1, 1, 1, 1,
1.18609, -0.3376121, -0.261126, 1, 1, 1, 1, 1,
1.186744, -1.506813, 2.585883, 1, 1, 1, 1, 1,
1.196887, 0.496137, 1.600183, 1, 1, 1, 1, 1,
1.207363, -1.04874, 1.814845, 1, 1, 1, 1, 1,
1.211731, -1.454193, 1.578878, 1, 1, 1, 1, 1,
1.21245, 2.335217, -0.2295607, 1, 1, 1, 1, 1,
1.220833, 0.5343332, 1.796309, 1, 1, 1, 1, 1,
1.224028, 1.08977, 0.123503, 1, 1, 1, 1, 1,
1.227907, 0.5519699, 0.5897816, 1, 1, 1, 1, 1,
1.230874, 0.2174189, 1.656261, 1, 1, 1, 1, 1,
1.231602, -0.4632782, 1.948808, 0, 0, 1, 1, 1,
1.237688, 0.971595, 0.6592343, 1, 0, 0, 1, 1,
1.250864, 0.1821358, 0.3829097, 1, 0, 0, 1, 1,
1.252194, -0.5390267, 2.165698, 1, 0, 0, 1, 1,
1.260008, 1.53605, -0.1191092, 1, 0, 0, 1, 1,
1.266728, -0.1007707, 2.287371, 1, 0, 0, 1, 1,
1.273912, 0.7123997, -0.3881723, 0, 0, 0, 1, 1,
1.274798, -0.6405226, 1.840975, 0, 0, 0, 1, 1,
1.279198, -0.8950054, 1.55363, 0, 0, 0, 1, 1,
1.279856, 0.01480426, 1.198452, 0, 0, 0, 1, 1,
1.283762, 0.2464369, 1.218208, 0, 0, 0, 1, 1,
1.283814, 0.6278176, -0.3998207, 0, 0, 0, 1, 1,
1.286688, -0.8508283, 3.184992, 0, 0, 0, 1, 1,
1.289533, 1.638557, 1.089486, 1, 1, 1, 1, 1,
1.293398, 2.253504, 1.170698, 1, 1, 1, 1, 1,
1.297077, -1.809333, 1.146797, 1, 1, 1, 1, 1,
1.297431, 0.03501946, 2.328875, 1, 1, 1, 1, 1,
1.29861, 0.4022781, 2.476576, 1, 1, 1, 1, 1,
1.299223, -0.5609869, 2.334014, 1, 1, 1, 1, 1,
1.317978, -1.686547, 1.645334, 1, 1, 1, 1, 1,
1.318363, 1.883663, -0.4738804, 1, 1, 1, 1, 1,
1.322672, -1.324611, 2.550895, 1, 1, 1, 1, 1,
1.33223, 0.6968632, -0.9233186, 1, 1, 1, 1, 1,
1.338408, -0.2808345, 3.932926, 1, 1, 1, 1, 1,
1.345902, -0.6616151, 2.881316, 1, 1, 1, 1, 1,
1.35667, -0.4297801, 2.73769, 1, 1, 1, 1, 1,
1.356895, -1.22704, 1.664305, 1, 1, 1, 1, 1,
1.359588, 0.6799626, 1.581591, 1, 1, 1, 1, 1,
1.363994, 0.3130699, 0.8006173, 0, 0, 1, 1, 1,
1.381246, 1.634197, 2.471333, 1, 0, 0, 1, 1,
1.389888, -0.2575282, 2.763717, 1, 0, 0, 1, 1,
1.39121, -0.2217819, 2.001137, 1, 0, 0, 1, 1,
1.401277, 1.920489, 1.253528, 1, 0, 0, 1, 1,
1.415587, 1.606218, 1.191128, 1, 0, 0, 1, 1,
1.433319, 1.101798, 0.7617713, 0, 0, 0, 1, 1,
1.434558, 1.292391, 0.7835057, 0, 0, 0, 1, 1,
1.43553, 0.05997415, 3.865531, 0, 0, 0, 1, 1,
1.436109, -1.071645, 2.586142, 0, 0, 0, 1, 1,
1.457242, 1.542761, 0.4061199, 0, 0, 0, 1, 1,
1.466387, 0.2054055, 1.468608, 0, 0, 0, 1, 1,
1.467097, 0.3054098, -0.6477557, 0, 0, 0, 1, 1,
1.483098, 1.171147, 1.268604, 1, 1, 1, 1, 1,
1.486001, -0.02308454, 2.199141, 1, 1, 1, 1, 1,
1.486385, 0.5001377, 1.788761, 1, 1, 1, 1, 1,
1.489397, -0.779828, 2.770409, 1, 1, 1, 1, 1,
1.507669, -1.831095, 2.567724, 1, 1, 1, 1, 1,
1.51209, -0.001953689, 2.864647, 1, 1, 1, 1, 1,
1.520454, -0.5101599, 2.060729, 1, 1, 1, 1, 1,
1.520641, -0.7910398, 3.232589, 1, 1, 1, 1, 1,
1.521102, 0.1220614, 1.630231, 1, 1, 1, 1, 1,
1.522284, -1.31787, 2.898175, 1, 1, 1, 1, 1,
1.523192, 0.5612246, 0.983888, 1, 1, 1, 1, 1,
1.532939, -0.6466998, 1.765603, 1, 1, 1, 1, 1,
1.538992, -0.8891074, 3.514481, 1, 1, 1, 1, 1,
1.541088, 1.222926, 2.139415, 1, 1, 1, 1, 1,
1.573678, 2.062277, 0.03049771, 1, 1, 1, 1, 1,
1.573686, -0.4981827, 1.261166, 0, 0, 1, 1, 1,
1.65209, 0.117546, 0.8091403, 1, 0, 0, 1, 1,
1.685334, -1.180149, 2.238999, 1, 0, 0, 1, 1,
1.693958, -0.2611464, 1.556784, 1, 0, 0, 1, 1,
1.696282, 0.2053765, 2.592162, 1, 0, 0, 1, 1,
1.727548, -0.8569304, 2.149027, 1, 0, 0, 1, 1,
1.747504, -0.7401634, 2.566118, 0, 0, 0, 1, 1,
1.765993, 0.573568, 1.629331, 0, 0, 0, 1, 1,
1.766248, -1.88906, 2.661938, 0, 0, 0, 1, 1,
1.775134, -0.2341742, 0.315413, 0, 0, 0, 1, 1,
1.782022, -0.8356011, 4.161012, 0, 0, 0, 1, 1,
1.821412, 1.092262, 1.364212, 0, 0, 0, 1, 1,
1.824959, -0.8146036, 2.783479, 0, 0, 0, 1, 1,
1.83496, 0.1968544, 0.1037425, 1, 1, 1, 1, 1,
1.851607, 0.05375365, 0.8537187, 1, 1, 1, 1, 1,
1.856052, -0.05869222, 0.9510207, 1, 1, 1, 1, 1,
1.863048, 1.416661, 1.762526, 1, 1, 1, 1, 1,
1.873173, 0.6174757, 0.4226384, 1, 1, 1, 1, 1,
1.908651, 1.539075, 3.289039, 1, 1, 1, 1, 1,
1.913796, -1.581014, 1.875546, 1, 1, 1, 1, 1,
1.918774, -1.05686, 1.837375, 1, 1, 1, 1, 1,
1.926407, 1.107402, 1.785136, 1, 1, 1, 1, 1,
1.971947, 0.769327, 0.703925, 1, 1, 1, 1, 1,
1.973835, 0.2289066, 1.781345, 1, 1, 1, 1, 1,
1.990138, -0.564386, 1.45695, 1, 1, 1, 1, 1,
2.004532, -0.556184, 0.9388422, 1, 1, 1, 1, 1,
2.036441, -0.4700109, 1.324394, 1, 1, 1, 1, 1,
2.037708, -0.4498799, 2.26736, 1, 1, 1, 1, 1,
2.043701, 1.214309, 0.5280257, 0, 0, 1, 1, 1,
2.04704, -0.3767746, 2.167936, 1, 0, 0, 1, 1,
2.068553, 1.586846, 2.222452, 1, 0, 0, 1, 1,
2.089804, -0.06374814, 1.169505, 1, 0, 0, 1, 1,
2.103447, 0.7766929, 0.9466263, 1, 0, 0, 1, 1,
2.126471, 0.4491691, 1.659228, 1, 0, 0, 1, 1,
2.129936, -0.1772332, 1.61086, 0, 0, 0, 1, 1,
2.144529, -0.3316109, -0.3544464, 0, 0, 0, 1, 1,
2.149388, -0.9757805, 0.3508803, 0, 0, 0, 1, 1,
2.159363, -0.6485296, 1.453881, 0, 0, 0, 1, 1,
2.278405, -1.033942, 1.167291, 0, 0, 0, 1, 1,
2.307128, -1.456228, 2.499345, 0, 0, 0, 1, 1,
2.308202, -0.5126696, 2.086871, 0, 0, 0, 1, 1,
2.367042, 0.3036101, 1.539729, 1, 1, 1, 1, 1,
2.372411, -0.1091761, 0.9784787, 1, 1, 1, 1, 1,
2.430609, -0.282814, -0.1276274, 1, 1, 1, 1, 1,
2.532931, 0.9247291, -0.5759738, 1, 1, 1, 1, 1,
2.614084, -2.025299, 2.90521, 1, 1, 1, 1, 1,
2.66995, -0.5169318, 1.852387, 1, 1, 1, 1, 1,
2.749551, -0.8262509, 1.539909, 1, 1, 1, 1, 1
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
var radius = 10.09817;
var distance = 35.46941;
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
mvMatrix.translate( 0.3800385, -0.1162691, 0.06450152 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.46941);
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
