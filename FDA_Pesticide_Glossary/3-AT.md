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
-2.916095, -0.7848002, -2.603088, 1, 0, 0, 1,
-2.709646, 0.06370009, -2.606994, 1, 0.007843138, 0, 1,
-2.659058, -0.1240573, -0.5844898, 1, 0.01176471, 0, 1,
-2.581502, 1.4396, 1.463191, 1, 0.01960784, 0, 1,
-2.55789, 0.3216423, -1.052479, 1, 0.02352941, 0, 1,
-2.485542, 0.6928025, 0.520539, 1, 0.03137255, 0, 1,
-2.432724, -0.6466991, -2.929699, 1, 0.03529412, 0, 1,
-2.390885, 0.7776096, 0.3301069, 1, 0.04313726, 0, 1,
-2.38898, 0.7968288, -1.280356, 1, 0.04705882, 0, 1,
-2.364859, -0.8540073, -2.073854, 1, 0.05490196, 0, 1,
-2.362542, -1.52126, -3.428674, 1, 0.05882353, 0, 1,
-2.308199, 0.9444306, -1.241952, 1, 0.06666667, 0, 1,
-2.269719, 0.2822216, -0.8033988, 1, 0.07058824, 0, 1,
-2.219355, -0.06814907, -1.096983, 1, 0.07843138, 0, 1,
-2.156609, 0.09383342, -1.759037, 1, 0.08235294, 0, 1,
-2.15508, -1.251909, -1.598746, 1, 0.09019608, 0, 1,
-2.136412, 0.04887718, -2.353299, 1, 0.09411765, 0, 1,
-2.084889, -0.01803559, -2.716346, 1, 0.1019608, 0, 1,
-2.072163, -0.5782865, -1.733469, 1, 0.1098039, 0, 1,
-2.057089, 0.8554867, -2.257683, 1, 0.1137255, 0, 1,
-2.047012, 0.01821402, -2.402757, 1, 0.1215686, 0, 1,
-2.044563, -0.4525011, -0.003344164, 1, 0.1254902, 0, 1,
-1.981083, 1.076479, -2.175472, 1, 0.1333333, 0, 1,
-1.954793, -0.507672, -1.15967, 1, 0.1372549, 0, 1,
-1.952942, 0.5770597, -1.938614, 1, 0.145098, 0, 1,
-1.944856, -0.2531734, -2.558064, 1, 0.1490196, 0, 1,
-1.936179, 0.8586802, -1.973805, 1, 0.1568628, 0, 1,
-1.935195, -1.878887, -2.121551, 1, 0.1607843, 0, 1,
-1.934087, 1.312893, 0.44177, 1, 0.1686275, 0, 1,
-1.933429, -1.918153, -1.787284, 1, 0.172549, 0, 1,
-1.923308, 0.6837615, -1.052911, 1, 0.1803922, 0, 1,
-1.900295, -0.9632589, -1.435369, 1, 0.1843137, 0, 1,
-1.895045, 1.417377, 0.2428084, 1, 0.1921569, 0, 1,
-1.884221, -0.7078082, -1.19375, 1, 0.1960784, 0, 1,
-1.880145, 0.07678396, -1.11528, 1, 0.2039216, 0, 1,
-1.87399, 1.935893, -0.4741979, 1, 0.2117647, 0, 1,
-1.864284, 1.704648, -0.875957, 1, 0.2156863, 0, 1,
-1.861853, 0.05806429, -1.0873, 1, 0.2235294, 0, 1,
-1.858482, 0.6835517, -0.5709342, 1, 0.227451, 0, 1,
-1.857094, -0.2712906, -2.825746, 1, 0.2352941, 0, 1,
-1.850934, -0.1162908, -2.176006, 1, 0.2392157, 0, 1,
-1.830126, -0.9721674, -1.658547, 1, 0.2470588, 0, 1,
-1.82696, 0.5664871, -1.112884, 1, 0.2509804, 0, 1,
-1.798501, 0.1956792, -2.112073, 1, 0.2588235, 0, 1,
-1.786242, -0.2830039, -3.293328, 1, 0.2627451, 0, 1,
-1.772489, -0.5851955, -2.724254, 1, 0.2705882, 0, 1,
-1.76816, -1.037649, -1.37941, 1, 0.2745098, 0, 1,
-1.755164, -0.6390398, -2.830049, 1, 0.282353, 0, 1,
-1.752989, -1.195997, -1.903414, 1, 0.2862745, 0, 1,
-1.750331, 0.4397543, -0.6499757, 1, 0.2941177, 0, 1,
-1.739907, 1.063052, -1.758269, 1, 0.3019608, 0, 1,
-1.722351, -1.119127, -3.82282, 1, 0.3058824, 0, 1,
-1.706358, -0.1937744, -1.631438, 1, 0.3137255, 0, 1,
-1.705906, -0.2138042, -1.47063, 1, 0.3176471, 0, 1,
-1.696843, 0.08546624, -1.406231, 1, 0.3254902, 0, 1,
-1.680769, -0.9768311, -2.484983, 1, 0.3294118, 0, 1,
-1.680076, -0.5252117, -4.143138, 1, 0.3372549, 0, 1,
-1.67424, 0.1149125, -1.033179, 1, 0.3411765, 0, 1,
-1.660574, -0.6467894, -2.209476, 1, 0.3490196, 0, 1,
-1.657524, 0.3978035, -0.5514833, 1, 0.3529412, 0, 1,
-1.64089, 0.9969113, -0.5265777, 1, 0.3607843, 0, 1,
-1.635807, 1.591739, -1.955544, 1, 0.3647059, 0, 1,
-1.631827, -0.5764163, -2.948523, 1, 0.372549, 0, 1,
-1.624746, 0.1035301, -1.776145, 1, 0.3764706, 0, 1,
-1.624159, -0.2884431, -2.758283, 1, 0.3843137, 0, 1,
-1.623663, -0.06971525, -2.513927, 1, 0.3882353, 0, 1,
-1.613629, -1.170268, -1.63552, 1, 0.3960784, 0, 1,
-1.610443, 1.997943, -1.043381, 1, 0.4039216, 0, 1,
-1.601967, -0.5749785, -1.583573, 1, 0.4078431, 0, 1,
-1.583746, -0.6303355, -0.8603937, 1, 0.4156863, 0, 1,
-1.555409, 1.092166, 0.8641239, 1, 0.4196078, 0, 1,
-1.553356, -0.3121102, -2.172298, 1, 0.427451, 0, 1,
-1.546731, -0.2697825, -2.654694, 1, 0.4313726, 0, 1,
-1.544333, 0.4999397, -2.594685, 1, 0.4392157, 0, 1,
-1.538346, 0.5658238, -2.102964, 1, 0.4431373, 0, 1,
-1.523033, 0.2342862, -1.448544, 1, 0.4509804, 0, 1,
-1.514646, 0.3495905, -0.2158015, 1, 0.454902, 0, 1,
-1.512085, -0.2416395, -0.4169496, 1, 0.4627451, 0, 1,
-1.506358, 1.002817, -1.949055, 1, 0.4666667, 0, 1,
-1.495056, -0.8680936, -2.493846, 1, 0.4745098, 0, 1,
-1.493106, -0.3911811, -2.607097, 1, 0.4784314, 0, 1,
-1.476078, 1.226135, -0.9262367, 1, 0.4862745, 0, 1,
-1.450774, -1.312627, -1.474899, 1, 0.4901961, 0, 1,
-1.450658, 0.4144268, -1.407974, 1, 0.4980392, 0, 1,
-1.446715, 1.824605, -2.759856, 1, 0.5058824, 0, 1,
-1.446072, -0.3967668, -2.008198, 1, 0.509804, 0, 1,
-1.444772, 1.451139, -0.943143, 1, 0.5176471, 0, 1,
-1.429975, 0.3499866, -1.85743, 1, 0.5215687, 0, 1,
-1.426085, -0.259347, -2.870228, 1, 0.5294118, 0, 1,
-1.422565, 1.391286, -0.09172504, 1, 0.5333334, 0, 1,
-1.421317, -0.1351723, -1.09742, 1, 0.5411765, 0, 1,
-1.416772, -2.802426, -1.277431, 1, 0.5450981, 0, 1,
-1.415749, 1.825733, -1.529126, 1, 0.5529412, 0, 1,
-1.41327, -0.3029198, -2.284367, 1, 0.5568628, 0, 1,
-1.40581, -0.5082452, -0.7428954, 1, 0.5647059, 0, 1,
-1.398885, 0.1923653, -0.897418, 1, 0.5686275, 0, 1,
-1.385889, 0.7650654, -0.08820501, 1, 0.5764706, 0, 1,
-1.382745, 0.03509261, -3.186823, 1, 0.5803922, 0, 1,
-1.370343, -0.3659637, -2.228822, 1, 0.5882353, 0, 1,
-1.367229, 2.727214, -2.022902, 1, 0.5921569, 0, 1,
-1.36443, 1.210296, 1.384121, 1, 0.6, 0, 1,
-1.344876, -0.7645456, -0.5026484, 1, 0.6078432, 0, 1,
-1.344622, 1.186332, 0.2265207, 1, 0.6117647, 0, 1,
-1.3356, -0.8107452, -3.215302, 1, 0.6196079, 0, 1,
-1.331452, 1.258959, -2.297749, 1, 0.6235294, 0, 1,
-1.330681, -0.5304801, -0.9111793, 1, 0.6313726, 0, 1,
-1.325878, -2.284664, -2.638984, 1, 0.6352941, 0, 1,
-1.31952, 0.1041269, -1.29623, 1, 0.6431373, 0, 1,
-1.303019, 0.4048869, -1.686878, 1, 0.6470588, 0, 1,
-1.301301, -0.2054314, -1.510684, 1, 0.654902, 0, 1,
-1.291517, -0.3044801, -0.6576118, 1, 0.6588235, 0, 1,
-1.283583, -0.6380202, -3.623764, 1, 0.6666667, 0, 1,
-1.276647, -0.865231, -0.3689522, 1, 0.6705883, 0, 1,
-1.269014, -0.8322912, -1.709565, 1, 0.6784314, 0, 1,
-1.267197, -0.4094093, -0.4793091, 1, 0.682353, 0, 1,
-1.263996, -0.8307272, -3.483922, 1, 0.6901961, 0, 1,
-1.253414, 0.2283, -1.894219, 1, 0.6941177, 0, 1,
-1.250467, 0.1139292, -1.31972, 1, 0.7019608, 0, 1,
-1.225676, -0.859454, -3.064237, 1, 0.7098039, 0, 1,
-1.222798, -1.183916, -1.67622, 1, 0.7137255, 0, 1,
-1.220052, -0.9298699, -3.021658, 1, 0.7215686, 0, 1,
-1.21584, 0.06620792, -1.02464, 1, 0.7254902, 0, 1,
-1.215659, 0.9162283, -0.03962213, 1, 0.7333333, 0, 1,
-1.210784, -0.637718, -1.874831, 1, 0.7372549, 0, 1,
-1.20727, 2.169697, -2.754302, 1, 0.7450981, 0, 1,
-1.197711, -0.595976, -1.610892, 1, 0.7490196, 0, 1,
-1.192473, 0.5403268, -1.307679, 1, 0.7568628, 0, 1,
-1.190279, 1.715991, 0.6728867, 1, 0.7607843, 0, 1,
-1.188779, -1.863551, -3.277147, 1, 0.7686275, 0, 1,
-1.183891, -0.2332318, -2.18159, 1, 0.772549, 0, 1,
-1.177208, 0.603694, -1.13174, 1, 0.7803922, 0, 1,
-1.164194, 1.397297, 0.3944398, 1, 0.7843137, 0, 1,
-1.157353, 1.372578, -0.7857411, 1, 0.7921569, 0, 1,
-1.131071, -0.4440867, -1.521306, 1, 0.7960784, 0, 1,
-1.122554, 1.798337, -1.044727, 1, 0.8039216, 0, 1,
-1.114885, -0.2704693, -0.2331231, 1, 0.8117647, 0, 1,
-1.111246, -0.6340225, -1.618567, 1, 0.8156863, 0, 1,
-1.109895, 0.08001588, -3.293088, 1, 0.8235294, 0, 1,
-1.09938, -0.1650962, -2.770472, 1, 0.827451, 0, 1,
-1.095373, -0.9952568, -2.386354, 1, 0.8352941, 0, 1,
-1.081941, 0.5230098, -1.875112, 1, 0.8392157, 0, 1,
-1.081505, 1.657191, -1.552863, 1, 0.8470588, 0, 1,
-1.076091, -1.621313, -1.053589, 1, 0.8509804, 0, 1,
-1.073241, 1.278149, -0.5909666, 1, 0.8588235, 0, 1,
-1.071996, -0.1858557, -0.5028338, 1, 0.8627451, 0, 1,
-1.066271, 0.2320789, -2.267359, 1, 0.8705882, 0, 1,
-1.063912, -0.9470879, -1.305924, 1, 0.8745098, 0, 1,
-1.0611, -0.3389478, -1.646976, 1, 0.8823529, 0, 1,
-1.059845, 1.260849, 0.5598451, 1, 0.8862745, 0, 1,
-1.058889, 0.7664421, -1.065322, 1, 0.8941177, 0, 1,
-1.050719, 0.2434001, -1.024244, 1, 0.8980392, 0, 1,
-1.045536, -1.444475, -3.194007, 1, 0.9058824, 0, 1,
-1.036512, 1.389152, 0.02318909, 1, 0.9137255, 0, 1,
-1.031526, 0.4864722, -1.120942, 1, 0.9176471, 0, 1,
-1.028882, -1.007273, -1.901857, 1, 0.9254902, 0, 1,
-1.027165, -0.0285878, -3.462447, 1, 0.9294118, 0, 1,
-1.012608, 0.8929846, -0.4662401, 1, 0.9372549, 0, 1,
-1.012157, -1.836158, -3.283806, 1, 0.9411765, 0, 1,
-1.007212, 0.767355, -1.255022, 1, 0.9490196, 0, 1,
-1.00488, -0.004341355, -1.385751, 1, 0.9529412, 0, 1,
-1.003435, 0.5936397, -1.142676, 1, 0.9607843, 0, 1,
-1.000704, -0.04177041, -0.3115706, 1, 0.9647059, 0, 1,
-0.99975, 1.305541, -0.3434893, 1, 0.972549, 0, 1,
-0.9959132, -1.398311, -1.877572, 1, 0.9764706, 0, 1,
-0.988098, -0.4951607, -3.096515, 1, 0.9843137, 0, 1,
-0.9855174, -0.4635987, -0.8045313, 1, 0.9882353, 0, 1,
-0.975088, 0.0267071, -1.671357, 1, 0.9960784, 0, 1,
-0.9674861, -0.4919115, -2.577975, 0.9960784, 1, 0, 1,
-0.9661244, 0.7910298, -0.2812999, 0.9921569, 1, 0, 1,
-0.9575543, 1.221592, 0.1287248, 0.9843137, 1, 0, 1,
-0.9419366, -0.6393855, -2.629035, 0.9803922, 1, 0, 1,
-0.9373059, 0.3262229, 0.2797703, 0.972549, 1, 0, 1,
-0.9342849, -1.550416, -1.683333, 0.9686275, 1, 0, 1,
-0.9327193, 0.3194104, -2.303011, 0.9607843, 1, 0, 1,
-0.926223, 0.7410831, -1.629642, 0.9568627, 1, 0, 1,
-0.9162934, 0.3041494, -1.009792, 0.9490196, 1, 0, 1,
-0.9108419, -0.2052623, -0.2675308, 0.945098, 1, 0, 1,
-0.9056691, 0.2471068, -3.023397, 0.9372549, 1, 0, 1,
-0.8982025, 0.498069, -1.81207, 0.9333333, 1, 0, 1,
-0.8968165, 1.395727, -0.8769997, 0.9254902, 1, 0, 1,
-0.8930252, -0.5261999, -1.710909, 0.9215686, 1, 0, 1,
-0.8895359, 1.633446, 0.6090351, 0.9137255, 1, 0, 1,
-0.8832639, 1.179453, -0.6304832, 0.9098039, 1, 0, 1,
-0.8786362, -1.958087, -3.4894, 0.9019608, 1, 0, 1,
-0.8777498, -0.1511247, -0.6032731, 0.8941177, 1, 0, 1,
-0.8754519, -0.7175182, -2.370215, 0.8901961, 1, 0, 1,
-0.8740754, -2.20295, -3.614067, 0.8823529, 1, 0, 1,
-0.8710337, 0.1536334, -2.034828, 0.8784314, 1, 0, 1,
-0.8674785, 0.5455633, 0.3405035, 0.8705882, 1, 0, 1,
-0.8665326, -0.6402724, -1.513178, 0.8666667, 1, 0, 1,
-0.8609879, 0.6478062, -1.549577, 0.8588235, 1, 0, 1,
-0.8583856, 1.106066, 0.06374492, 0.854902, 1, 0, 1,
-0.8581903, 2.365681, 0.3266304, 0.8470588, 1, 0, 1,
-0.8542321, -0.352768, -3.145211, 0.8431373, 1, 0, 1,
-0.8513702, -0.7586197, -2.735988, 0.8352941, 1, 0, 1,
-0.8385906, 0.2034691, -0.04605995, 0.8313726, 1, 0, 1,
-0.8335617, 0.8095483, -0.0248794, 0.8235294, 1, 0, 1,
-0.8273661, -1.074057, -4.335666, 0.8196079, 1, 0, 1,
-0.8218055, -0.4934421, -1.670457, 0.8117647, 1, 0, 1,
-0.8168312, -0.8236619, -2.207695, 0.8078431, 1, 0, 1,
-0.8120284, -0.2473004, -2.434168, 0.8, 1, 0, 1,
-0.8118361, 0.7185109, -0.9555163, 0.7921569, 1, 0, 1,
-0.8079498, -1.860527, -2.022214, 0.7882353, 1, 0, 1,
-0.8060234, -0.5171339, -3.085196, 0.7803922, 1, 0, 1,
-0.8030424, 0.2669753, -0.7562379, 0.7764706, 1, 0, 1,
-0.7939421, -0.1694728, -2.138459, 0.7686275, 1, 0, 1,
-0.7923564, -1.731061, -2.774955, 0.7647059, 1, 0, 1,
-0.7847276, -0.7213897, -1.559954, 0.7568628, 1, 0, 1,
-0.784312, -0.4062356, -0.5041534, 0.7529412, 1, 0, 1,
-0.7682161, -0.09340144, -1.49561, 0.7450981, 1, 0, 1,
-0.7603096, 2.177911, -0.6257343, 0.7411765, 1, 0, 1,
-0.7594966, 0.5290223, -1.285875, 0.7333333, 1, 0, 1,
-0.7580187, -0.2176533, -0.2266812, 0.7294118, 1, 0, 1,
-0.7566677, -0.9738029, -3.491528, 0.7215686, 1, 0, 1,
-0.747023, -0.7607898, -2.93696, 0.7176471, 1, 0, 1,
-0.7452934, 0.3535025, 0.5040178, 0.7098039, 1, 0, 1,
-0.7429553, -1.063623, -1.245259, 0.7058824, 1, 0, 1,
-0.7389485, -1.830332, -2.336695, 0.6980392, 1, 0, 1,
-0.7341165, -0.02437611, -0.5862114, 0.6901961, 1, 0, 1,
-0.731628, -0.4370524, -3.679028, 0.6862745, 1, 0, 1,
-0.73136, 0.9105935, -1.193824, 0.6784314, 1, 0, 1,
-0.7312709, 0.104774, -1.953478, 0.6745098, 1, 0, 1,
-0.7250729, -0.4902143, -1.855824, 0.6666667, 1, 0, 1,
-0.7229058, 1.813066, 0.497645, 0.6627451, 1, 0, 1,
-0.7221002, 0.3632758, -1.059116, 0.654902, 1, 0, 1,
-0.7209052, 0.518851, -2.066248, 0.6509804, 1, 0, 1,
-0.7158957, -0.08811977, -0.11824, 0.6431373, 1, 0, 1,
-0.7148513, -2.604607, -3.758142, 0.6392157, 1, 0, 1,
-0.7135147, 0.01494336, -3.811953, 0.6313726, 1, 0, 1,
-0.7106203, 0.985991, -1.461154, 0.627451, 1, 0, 1,
-0.7090955, -0.8557492, -1.663931, 0.6196079, 1, 0, 1,
-0.7035155, 1.907205, -0.7410895, 0.6156863, 1, 0, 1,
-0.7027554, -1.151381, -4.188968, 0.6078432, 1, 0, 1,
-0.6964766, -0.600482, -1.35682, 0.6039216, 1, 0, 1,
-0.6919356, 1.001102, 0.3131427, 0.5960785, 1, 0, 1,
-0.6892717, 2.143015, -1.692958, 0.5882353, 1, 0, 1,
-0.684591, -2.34163, -3.542878, 0.5843138, 1, 0, 1,
-0.6828181, -0.8535434, -1.770073, 0.5764706, 1, 0, 1,
-0.6730245, -0.6215707, -1.674416, 0.572549, 1, 0, 1,
-0.6667604, -1.217385, -2.351893, 0.5647059, 1, 0, 1,
-0.6634482, -0.8312398, -2.68664, 0.5607843, 1, 0, 1,
-0.6624869, -0.5031928, -1.496374, 0.5529412, 1, 0, 1,
-0.6617562, 0.8315473, 0.3776995, 0.5490196, 1, 0, 1,
-0.6594574, -0.5569465, -4.391107, 0.5411765, 1, 0, 1,
-0.6569337, 0.4326208, -1.109923, 0.5372549, 1, 0, 1,
-0.6567913, 0.4892981, -0.7489281, 0.5294118, 1, 0, 1,
-0.6451914, 0.7308206, 0.3853491, 0.5254902, 1, 0, 1,
-0.6430222, -0.9970295, -2.572229, 0.5176471, 1, 0, 1,
-0.6357974, 0.1151763, -2.551776, 0.5137255, 1, 0, 1,
-0.6318973, -2.687667, -4.680872, 0.5058824, 1, 0, 1,
-0.6252576, -1.355843, -2.13723, 0.5019608, 1, 0, 1,
-0.6246912, 1.495605, -0.6071529, 0.4941176, 1, 0, 1,
-0.6242759, -0.1484647, -0.5309435, 0.4862745, 1, 0, 1,
-0.6206471, 0.8582454, 0.1226984, 0.4823529, 1, 0, 1,
-0.6167862, 0.1932572, -1.974721, 0.4745098, 1, 0, 1,
-0.614856, -0.9270788, -2.485372, 0.4705882, 1, 0, 1,
-0.6102884, -0.04710134, -1.147154, 0.4627451, 1, 0, 1,
-0.6052378, 0.08390364, -3.950451, 0.4588235, 1, 0, 1,
-0.604287, -0.4215592, -1.543514, 0.4509804, 1, 0, 1,
-0.6036667, 1.112542, 1.340082, 0.4470588, 1, 0, 1,
-0.6002128, -0.8215631, -1.593071, 0.4392157, 1, 0, 1,
-0.593832, -2.096982, -3.850841, 0.4352941, 1, 0, 1,
-0.5889183, 0.06504643, -3.363096, 0.427451, 1, 0, 1,
-0.5843834, 2.268, -0.6028194, 0.4235294, 1, 0, 1,
-0.5815098, -0.7239638, -4.395924, 0.4156863, 1, 0, 1,
-0.5778882, 0.6703058, -2.587388, 0.4117647, 1, 0, 1,
-0.5768891, 0.239288, -1.543088, 0.4039216, 1, 0, 1,
-0.5753148, -1.463111, -2.209445, 0.3960784, 1, 0, 1,
-0.5723606, -0.8444769, -2.45263, 0.3921569, 1, 0, 1,
-0.5709416, -0.5619869, -1.174556, 0.3843137, 1, 0, 1,
-0.5659525, -0.9112873, -3.429425, 0.3803922, 1, 0, 1,
-0.562485, 0.344398, 0.9255428, 0.372549, 1, 0, 1,
-0.5622849, 1.758554, 1.119691, 0.3686275, 1, 0, 1,
-0.556744, -1.068754, -3.161475, 0.3607843, 1, 0, 1,
-0.553718, -0.6713001, -0.9064835, 0.3568628, 1, 0, 1,
-0.5509089, -1.045539, -3.551718, 0.3490196, 1, 0, 1,
-0.550022, -0.6670846, -1.979486, 0.345098, 1, 0, 1,
-0.5473066, -0.8790386, -2.568693, 0.3372549, 1, 0, 1,
-0.5397472, 0.004348515, -0.3652072, 0.3333333, 1, 0, 1,
-0.5387506, 0.2222089, -1.946132, 0.3254902, 1, 0, 1,
-0.5368978, 0.3193019, -2.877944, 0.3215686, 1, 0, 1,
-0.5366153, 0.8146708, -1.368883, 0.3137255, 1, 0, 1,
-0.5363359, 0.04533794, -1.658721, 0.3098039, 1, 0, 1,
-0.5281696, -1.68755, -2.55103, 0.3019608, 1, 0, 1,
-0.5281377, 0.4006836, 0.6923575, 0.2941177, 1, 0, 1,
-0.5191985, 0.02520436, -3.503592, 0.2901961, 1, 0, 1,
-0.5180868, 0.4232106, -1.053634, 0.282353, 1, 0, 1,
-0.5155826, 0.06308267, -1.19603, 0.2784314, 1, 0, 1,
-0.5119225, 0.8967135, -0.2887573, 0.2705882, 1, 0, 1,
-0.5035724, -1.310803, -3.450076, 0.2666667, 1, 0, 1,
-0.5029262, -0.5604261, -2.030233, 0.2588235, 1, 0, 1,
-0.5005379, 1.219109, 1.06556, 0.254902, 1, 0, 1,
-0.4980396, -0.2720005, -2.212639, 0.2470588, 1, 0, 1,
-0.4952366, 1.551619, -0.5283107, 0.2431373, 1, 0, 1,
-0.4905539, -0.3353568, -2.384788, 0.2352941, 1, 0, 1,
-0.4878337, 0.07433821, -3.660269, 0.2313726, 1, 0, 1,
-0.4854166, -1.231707, -2.764222, 0.2235294, 1, 0, 1,
-0.4840599, -0.6083245, -0.5912653, 0.2196078, 1, 0, 1,
-0.4752808, -2.021593, -2.568275, 0.2117647, 1, 0, 1,
-0.4736493, 0.3249995, -1.240553, 0.2078431, 1, 0, 1,
-0.4699145, -1.304557, -1.212656, 0.2, 1, 0, 1,
-0.4591057, -1.134956, -3.852388, 0.1921569, 1, 0, 1,
-0.4547047, 0.01149112, -0.9788726, 0.1882353, 1, 0, 1,
-0.4527075, 0.4887307, -0.1117523, 0.1803922, 1, 0, 1,
-0.4521551, -0.9271601, -4.054851, 0.1764706, 1, 0, 1,
-0.447474, -0.7613806, -2.412693, 0.1686275, 1, 0, 1,
-0.4463545, -1.162442, -2.479178, 0.1647059, 1, 0, 1,
-0.4370008, -0.2853567, -3.373119, 0.1568628, 1, 0, 1,
-0.4365758, -0.1494249, -2.323625, 0.1529412, 1, 0, 1,
-0.4361583, 0.689358, 0.6537806, 0.145098, 1, 0, 1,
-0.4343027, -0.383237, -2.010807, 0.1411765, 1, 0, 1,
-0.4342873, 0.4191493, 0.9699579, 0.1333333, 1, 0, 1,
-0.4324572, 0.2377549, -1.589704, 0.1294118, 1, 0, 1,
-0.4304507, 0.6682501, 0.7945912, 0.1215686, 1, 0, 1,
-0.4245281, 0.5121948, -1.916862, 0.1176471, 1, 0, 1,
-0.4215675, 2.123967, -0.3168565, 0.1098039, 1, 0, 1,
-0.4210021, 0.2162681, -1.872668, 0.1058824, 1, 0, 1,
-0.4181499, 1.301995, 0.5208588, 0.09803922, 1, 0, 1,
-0.4169253, -0.9762584, -2.826684, 0.09019608, 1, 0, 1,
-0.4159731, -0.6667385, -2.0568, 0.08627451, 1, 0, 1,
-0.4111568, 1.096386, 1.859819, 0.07843138, 1, 0, 1,
-0.4103543, 1.020238, 0.09166077, 0.07450981, 1, 0, 1,
-0.4101363, 0.1043562, -0.6426721, 0.06666667, 1, 0, 1,
-0.4043553, -0.4026918, -3.224499, 0.0627451, 1, 0, 1,
-0.4038143, 1.0363, 1.877193, 0.05490196, 1, 0, 1,
-0.4037806, -1.579081, -3.56685, 0.05098039, 1, 0, 1,
-0.4021102, -0.7520831, -2.355068, 0.04313726, 1, 0, 1,
-0.402087, -2.055689, -1.567755, 0.03921569, 1, 0, 1,
-0.3996445, 0.6308211, -1.134096, 0.03137255, 1, 0, 1,
-0.3986818, 0.9466819, -0.9902312, 0.02745098, 1, 0, 1,
-0.3978018, -2.060925, -3.850929, 0.01960784, 1, 0, 1,
-0.3929608, -0.5393052, -2.313042, 0.01568628, 1, 0, 1,
-0.3902142, 1.561386, -2.872814, 0.007843138, 1, 0, 1,
-0.384167, 0.03714567, -2.453019, 0.003921569, 1, 0, 1,
-0.3831027, 0.5701534, -1.468478, 0, 1, 0.003921569, 1,
-0.3802373, 1.570781, -1.694394, 0, 1, 0.01176471, 1,
-0.3782804, 0.9760576, -1.068152, 0, 1, 0.01568628, 1,
-0.3779683, -2.048911, -1.879893, 0, 1, 0.02352941, 1,
-0.3716583, -0.1646526, -2.258514, 0, 1, 0.02745098, 1,
-0.3713567, -0.7820886, -3.295682, 0, 1, 0.03529412, 1,
-0.3690265, 1.576694, 0.6520653, 0, 1, 0.03921569, 1,
-0.3666707, -0.943514, -2.709444, 0, 1, 0.04705882, 1,
-0.366526, 1.07566, -0.7756841, 0, 1, 0.05098039, 1,
-0.364765, 0.8047511, 0.04396323, 0, 1, 0.05882353, 1,
-0.3629896, -0.2824975, -1.401992, 0, 1, 0.0627451, 1,
-0.362964, 1.04988, -1.323696, 0, 1, 0.07058824, 1,
-0.3612434, -0.242494, -1.410331, 0, 1, 0.07450981, 1,
-0.3590046, 0.8534321, 1.390294, 0, 1, 0.08235294, 1,
-0.3577619, -0.8253846, -3.177416, 0, 1, 0.08627451, 1,
-0.3561251, 1.927218, -1.399586, 0, 1, 0.09411765, 1,
-0.3490422, -0.1370077, -1.527371, 0, 1, 0.1019608, 1,
-0.348592, -0.4321973, -1.195281, 0, 1, 0.1058824, 1,
-0.3478214, -0.4516424, -1.866535, 0, 1, 0.1137255, 1,
-0.347342, 0.281092, -0.1381337, 0, 1, 0.1176471, 1,
-0.3459535, -1.476224, -2.532034, 0, 1, 0.1254902, 1,
-0.3444621, -0.9909114, -0.8510767, 0, 1, 0.1294118, 1,
-0.3429009, -1.550091, -3.257391, 0, 1, 0.1372549, 1,
-0.3423998, 0.3555338, -0.8256763, 0, 1, 0.1411765, 1,
-0.3400771, 0.9925854, -1.778208, 0, 1, 0.1490196, 1,
-0.3375527, -1.552269, -3.738615, 0, 1, 0.1529412, 1,
-0.3359738, 0.2476645, -2.296747, 0, 1, 0.1607843, 1,
-0.3352266, 0.5301733, -0.7713504, 0, 1, 0.1647059, 1,
-0.3246462, -1.342234, -4.580842, 0, 1, 0.172549, 1,
-0.3239143, 0.8933342, 0.6278123, 0, 1, 0.1764706, 1,
-0.3212138, -0.8097219, -3.846721, 0, 1, 0.1843137, 1,
-0.3202362, 0.2442406, 0.06532992, 0, 1, 0.1882353, 1,
-0.3194204, 0.7159103, -0.02553457, 0, 1, 0.1960784, 1,
-0.3193279, 0.07461473, -1.395141, 0, 1, 0.2039216, 1,
-0.3163546, 1.373972, -0.5079453, 0, 1, 0.2078431, 1,
-0.3144954, -0.5568908, -3.356489, 0, 1, 0.2156863, 1,
-0.3140641, 0.2905173, -1.75125, 0, 1, 0.2196078, 1,
-0.3134928, 1.373816, 0.5074338, 0, 1, 0.227451, 1,
-0.3110332, 0.9824925, 1.156615, 0, 1, 0.2313726, 1,
-0.3099169, -1.177347, -3.273634, 0, 1, 0.2392157, 1,
-0.3096677, -0.4866266, -2.38594, 0, 1, 0.2431373, 1,
-0.3019016, -0.1297512, -3.063658, 0, 1, 0.2509804, 1,
-0.2994335, 0.3017427, -0.8342779, 0, 1, 0.254902, 1,
-0.2985163, 0.7195427, -0.05026236, 0, 1, 0.2627451, 1,
-0.296946, 1.861011, 0.2834322, 0, 1, 0.2666667, 1,
-0.2952497, -1.714063, -2.052756, 0, 1, 0.2745098, 1,
-0.2950218, 1.138087, -0.2288029, 0, 1, 0.2784314, 1,
-0.2933815, -1.271035, -3.10839, 0, 1, 0.2862745, 1,
-0.2901766, -1.169209, -1.111912, 0, 1, 0.2901961, 1,
-0.2897534, 0.2792137, 0.2425336, 0, 1, 0.2980392, 1,
-0.2892729, 0.3106464, 1.038682, 0, 1, 0.3058824, 1,
-0.2878754, 0.6189924, -0.7689951, 0, 1, 0.3098039, 1,
-0.2869159, 0.8399935, -0.4624665, 0, 1, 0.3176471, 1,
-0.2864084, 2.770231, -0.7395581, 0, 1, 0.3215686, 1,
-0.2831642, -0.1142548, -2.192346, 0, 1, 0.3294118, 1,
-0.2820688, 0.4237752, -0.3939049, 0, 1, 0.3333333, 1,
-0.2775058, -0.7489746, -3.88216, 0, 1, 0.3411765, 1,
-0.2757849, 1.375064, -1.710499, 0, 1, 0.345098, 1,
-0.271534, 0.8814694, -1.403438, 0, 1, 0.3529412, 1,
-0.2697054, 1.548056, 0.1753324, 0, 1, 0.3568628, 1,
-0.267448, 0.2536111, -2.537213, 0, 1, 0.3647059, 1,
-0.2660923, -1.71611, -3.273915, 0, 1, 0.3686275, 1,
-0.2626307, -0.01771347, -1.270773, 0, 1, 0.3764706, 1,
-0.2601727, -0.841374, -1.874192, 0, 1, 0.3803922, 1,
-0.2593212, 0.09687778, 0.01561914, 0, 1, 0.3882353, 1,
-0.2579083, -2.690585, -3.439929, 0, 1, 0.3921569, 1,
-0.256892, -1.549661, -2.639434, 0, 1, 0.4, 1,
-0.25573, -0.6860439, -4.368554, 0, 1, 0.4078431, 1,
-0.2498927, -1.267609, -1.41718, 0, 1, 0.4117647, 1,
-0.2452358, 0.6464235, -0.3082807, 0, 1, 0.4196078, 1,
-0.2445074, -1.036241, -2.256271, 0, 1, 0.4235294, 1,
-0.2416935, -0.353384, -1.301923, 0, 1, 0.4313726, 1,
-0.2414592, 0.05193676, -0.7509659, 0, 1, 0.4352941, 1,
-0.239445, -0.389272, -0.701043, 0, 1, 0.4431373, 1,
-0.2357789, -0.02786013, -2.129974, 0, 1, 0.4470588, 1,
-0.2352238, 0.8328918, 1.392759, 0, 1, 0.454902, 1,
-0.2333169, 0.4566201, -0.6159731, 0, 1, 0.4588235, 1,
-0.2323207, 1.61824, -0.7278516, 0, 1, 0.4666667, 1,
-0.2257756, 0.8257608, -1.09404, 0, 1, 0.4705882, 1,
-0.224528, 1.634844, 0.7093825, 0, 1, 0.4784314, 1,
-0.2235074, -0.5577276, -2.872827, 0, 1, 0.4823529, 1,
-0.2225543, 0.6282681, 0.1892871, 0, 1, 0.4901961, 1,
-0.2191584, 0.8798624, 0.1737129, 0, 1, 0.4941176, 1,
-0.2178581, -1.155235, -3.204639, 0, 1, 0.5019608, 1,
-0.2171788, -1.276095, -3.022047, 0, 1, 0.509804, 1,
-0.2168821, -0.5447341, -1.242723, 0, 1, 0.5137255, 1,
-0.2156305, 1.436483, 0.5645208, 0, 1, 0.5215687, 1,
-0.2150643, 1.58355, -0.2532014, 0, 1, 0.5254902, 1,
-0.2147134, 0.004994332, -0.4881892, 0, 1, 0.5333334, 1,
-0.2126192, -0.09364468, -2.100726, 0, 1, 0.5372549, 1,
-0.210475, -0.07336106, -1.127408, 0, 1, 0.5450981, 1,
-0.2045635, -0.2435515, -1.931893, 0, 1, 0.5490196, 1,
-0.2027971, 0.2355049, -0.8519958, 0, 1, 0.5568628, 1,
-0.1879003, -2.875147, -1.905099, 0, 1, 0.5607843, 1,
-0.180864, -0.267092, -2.556476, 0, 1, 0.5686275, 1,
-0.1800147, 0.05618684, -1.566804, 0, 1, 0.572549, 1,
-0.175503, 0.4918591, 2.016589, 0, 1, 0.5803922, 1,
-0.1743626, 1.145228, -0.9519559, 0, 1, 0.5843138, 1,
-0.1727304, -2.041241, -3.255711, 0, 1, 0.5921569, 1,
-0.1717709, -1.607097, -3.107017, 0, 1, 0.5960785, 1,
-0.16622, 1.819944, 0.5856232, 0, 1, 0.6039216, 1,
-0.1661168, -0.1760828, -1.583254, 0, 1, 0.6117647, 1,
-0.1638489, 0.8075948, 0.3689504, 0, 1, 0.6156863, 1,
-0.1619542, -0.7110192, -3.719508, 0, 1, 0.6235294, 1,
-0.1615487, -1.935107, -1.959259, 0, 1, 0.627451, 1,
-0.1615065, 1.352025, -1.262369, 0, 1, 0.6352941, 1,
-0.1590901, 0.168296, -0.7956176, 0, 1, 0.6392157, 1,
-0.1587612, -1.07683, -3.242673, 0, 1, 0.6470588, 1,
-0.1542421, -1.114466, -3.860914, 0, 1, 0.6509804, 1,
-0.1501113, -0.7826737, -1.918643, 0, 1, 0.6588235, 1,
-0.1500739, -0.8997883, -2.946986, 0, 1, 0.6627451, 1,
-0.1493775, -0.5688543, -3.572121, 0, 1, 0.6705883, 1,
-0.1460679, -2.606011, -1.480831, 0, 1, 0.6745098, 1,
-0.1452016, -0.6389063, -3.21005, 0, 1, 0.682353, 1,
-0.1444673, 1.123971, 0.6963621, 0, 1, 0.6862745, 1,
-0.1436888, -0.5528917, -3.711958, 0, 1, 0.6941177, 1,
-0.1425744, 0.2305811, -2.102247, 0, 1, 0.7019608, 1,
-0.1391267, 1.640388, -1.073229, 0, 1, 0.7058824, 1,
-0.135453, 1.375496, -1.166778, 0, 1, 0.7137255, 1,
-0.1343101, 0.3795872, -1.374931, 0, 1, 0.7176471, 1,
-0.1327876, -1.121248, -2.948509, 0, 1, 0.7254902, 1,
-0.128207, -1.931448, -4.737867, 0, 1, 0.7294118, 1,
-0.1259522, 0.7367597, -0.5119832, 0, 1, 0.7372549, 1,
-0.123352, -0.008141539, -2.298892, 0, 1, 0.7411765, 1,
-0.1213538, 0.6829196, 0.5207082, 0, 1, 0.7490196, 1,
-0.1164533, 2.337758, 0.375237, 0, 1, 0.7529412, 1,
-0.1141317, 1.37878, 0.01952025, 0, 1, 0.7607843, 1,
-0.1100467, 0.6431436, 0.132523, 0, 1, 0.7647059, 1,
-0.1067437, -1.300152, -2.3556, 0, 1, 0.772549, 1,
-0.1057799, -1.34137, -3.945125, 0, 1, 0.7764706, 1,
-0.1054997, 1.826929, -1.005814, 0, 1, 0.7843137, 1,
-0.1035413, 0.1361165, -1.916727, 0, 1, 0.7882353, 1,
-0.1031303, 0.7325921, 0.8693901, 0, 1, 0.7960784, 1,
-0.1029387, 0.6350883, 0.4358828, 0, 1, 0.8039216, 1,
-0.1019062, -0.2594705, -2.395955, 0, 1, 0.8078431, 1,
-0.1007811, 0.8675365, 0.6444699, 0, 1, 0.8156863, 1,
-0.0976205, -1.754871, -2.246686, 0, 1, 0.8196079, 1,
-0.08880815, -0.4680215, -1.980835, 0, 1, 0.827451, 1,
-0.08834828, 1.312081, -1.23122, 0, 1, 0.8313726, 1,
-0.08749974, 0.3695163, -2.363185, 0, 1, 0.8392157, 1,
-0.0870503, -0.4939691, -3.58092, 0, 1, 0.8431373, 1,
-0.08318456, -1.178522, -4.387644, 0, 1, 0.8509804, 1,
-0.08219849, -0.9436663, -2.618202, 0, 1, 0.854902, 1,
-0.07737418, 0.03705396, 0.04063189, 0, 1, 0.8627451, 1,
-0.07415099, 0.2306647, -2.138706, 0, 1, 0.8666667, 1,
-0.06901429, -0.3074605, -1.99745, 0, 1, 0.8745098, 1,
-0.06742989, -1.854527, -2.385867, 0, 1, 0.8784314, 1,
-0.06417123, 0.3796912, -0.5463665, 0, 1, 0.8862745, 1,
-0.06183762, -1.544119, -3.012143, 0, 1, 0.8901961, 1,
-0.06079685, -1.012339, -3.043909, 0, 1, 0.8980392, 1,
-0.05414981, 0.2527984, 0.08693456, 0, 1, 0.9058824, 1,
-0.05399749, 0.2583224, -0.9484453, 0, 1, 0.9098039, 1,
-0.0523164, 0.790903, 0.7753535, 0, 1, 0.9176471, 1,
-0.05155686, 0.4981927, 1.005395, 0, 1, 0.9215686, 1,
-0.05084219, -0.6980662, -1.229316, 0, 1, 0.9294118, 1,
-0.04037746, 1.355884, -1.078234, 0, 1, 0.9333333, 1,
-0.0363836, 0.3737253, 0.8358786, 0, 1, 0.9411765, 1,
-0.03321141, -0.7883293, -1.69421, 0, 1, 0.945098, 1,
-0.0331067, -0.5647345, -2.804901, 0, 1, 0.9529412, 1,
-0.02518829, 0.9715957, 1.110131, 0, 1, 0.9568627, 1,
-0.01559422, -0.2743729, -3.659304, 0, 1, 0.9647059, 1,
-0.01467909, 0.3242764, -0.3985615, 0, 1, 0.9686275, 1,
-0.01365676, 0.6843899, 1.510626, 0, 1, 0.9764706, 1,
-0.01107238, -0.5661457, -2.122164, 0, 1, 0.9803922, 1,
-0.01024806, -0.01738038, -3.011598, 0, 1, 0.9882353, 1,
-0.004880527, -0.2136281, -3.958616, 0, 1, 0.9921569, 1,
-0.002105188, -1.087653, -4.317213, 0, 1, 1, 1,
0.005977334, 0.789845, 0.3627853, 0, 0.9921569, 1, 1,
0.007215623, -0.6353517, 2.936993, 0, 0.9882353, 1, 1,
0.009120453, 0.7403283, -0.3236246, 0, 0.9803922, 1, 1,
0.009455094, 1.84361, -1.206029, 0, 0.9764706, 1, 1,
0.01003978, 0.6820446, 0.06751648, 0, 0.9686275, 1, 1,
0.01245515, -0.0423286, 2.262166, 0, 0.9647059, 1, 1,
0.01266635, 1.272195, 1.314507, 0, 0.9568627, 1, 1,
0.01333017, -0.6699985, 2.941262, 0, 0.9529412, 1, 1,
0.01663259, 0.7154323, 0.2392506, 0, 0.945098, 1, 1,
0.0203475, 0.509778, -0.150836, 0, 0.9411765, 1, 1,
0.02228689, 1.890217, -0.9049879, 0, 0.9333333, 1, 1,
0.02238756, 0.2333814, 0.7042944, 0, 0.9294118, 1, 1,
0.02460302, 0.487772, 2.295048, 0, 0.9215686, 1, 1,
0.02618365, 1.189184, 0.1454628, 0, 0.9176471, 1, 1,
0.02740163, 0.04608732, 2.261405, 0, 0.9098039, 1, 1,
0.02770243, 1.493525, 1.583883, 0, 0.9058824, 1, 1,
0.02844714, 0.246473, 0.4054998, 0, 0.8980392, 1, 1,
0.02917017, -0.753239, 4.691164, 0, 0.8901961, 1, 1,
0.03250817, -0.205734, 3.502498, 0, 0.8862745, 1, 1,
0.03325793, 0.09797965, 3.024263, 0, 0.8784314, 1, 1,
0.03363841, -0.4901569, 3.509078, 0, 0.8745098, 1, 1,
0.04095921, 0.1874643, 0.6281528, 0, 0.8666667, 1, 1,
0.04288456, -1.339876, 3.019875, 0, 0.8627451, 1, 1,
0.04573369, 1.400471, 1.291449, 0, 0.854902, 1, 1,
0.0477167, -0.1369269, 2.070621, 0, 0.8509804, 1, 1,
0.04803145, 0.1984146, 0.7213498, 0, 0.8431373, 1, 1,
0.04872853, 1.146966, -0.3582823, 0, 0.8392157, 1, 1,
0.05020455, -1.798233, 2.337515, 0, 0.8313726, 1, 1,
0.05729775, 0.6530445, 0.3872622, 0, 0.827451, 1, 1,
0.05812107, 0.050591, -0.2344131, 0, 0.8196079, 1, 1,
0.05935916, -3.223093, 2.622535, 0, 0.8156863, 1, 1,
0.06190173, 0.4630054, 1.753668, 0, 0.8078431, 1, 1,
0.06593044, 1.884364, -0.09267049, 0, 0.8039216, 1, 1,
0.06844311, -0.3267595, 2.673083, 0, 0.7960784, 1, 1,
0.07182156, 0.4834299, 0.2256615, 0, 0.7882353, 1, 1,
0.07221936, 0.8032134, 0.5106519, 0, 0.7843137, 1, 1,
0.07307405, 0.8981816, -0.3896633, 0, 0.7764706, 1, 1,
0.07486099, -0.1541178, 2.475017, 0, 0.772549, 1, 1,
0.07678031, 1.003397, 0.9329287, 0, 0.7647059, 1, 1,
0.07810505, 1.071608, -1.295566, 0, 0.7607843, 1, 1,
0.07860748, 0.1618978, -0.5159475, 0, 0.7529412, 1, 1,
0.07875343, -2.201164, 4.320524, 0, 0.7490196, 1, 1,
0.08332241, 0.9283403, 0.2927538, 0, 0.7411765, 1, 1,
0.08744455, -0.3719183, 0.4844683, 0, 0.7372549, 1, 1,
0.09196226, -0.4030252, 2.848262, 0, 0.7294118, 1, 1,
0.0966813, -0.41996, 2.311887, 0, 0.7254902, 1, 1,
0.1010574, 1.024711, 0.001157366, 0, 0.7176471, 1, 1,
0.1016515, 1.454872, 0.3011456, 0, 0.7137255, 1, 1,
0.107874, 0.02966587, 2.173552, 0, 0.7058824, 1, 1,
0.1081646, -1.234164, 2.304004, 0, 0.6980392, 1, 1,
0.1085739, -0.5805612, 3.815587, 0, 0.6941177, 1, 1,
0.1118136, -0.9392604, 4.405715, 0, 0.6862745, 1, 1,
0.1129672, -0.5560743, 3.462808, 0, 0.682353, 1, 1,
0.1149782, -0.2246937, 2.026489, 0, 0.6745098, 1, 1,
0.1163305, -0.1975088, 1.029498, 0, 0.6705883, 1, 1,
0.1172419, 0.7854255, -0.4111097, 0, 0.6627451, 1, 1,
0.1180684, 0.9390247, -1.053598, 0, 0.6588235, 1, 1,
0.118154, -0.1099015, 1.244588, 0, 0.6509804, 1, 1,
0.1197934, -0.4740867, 2.520361, 0, 0.6470588, 1, 1,
0.1229486, 0.1660528, -1.619595, 0, 0.6392157, 1, 1,
0.1246846, 0.1376706, -0.3479667, 0, 0.6352941, 1, 1,
0.1290884, -1.119681, 2.930879, 0, 0.627451, 1, 1,
0.129599, -0.1908125, 2.857098, 0, 0.6235294, 1, 1,
0.1357736, -0.1042454, 1.242458, 0, 0.6156863, 1, 1,
0.1390142, 1.140767, -1.294506, 0, 0.6117647, 1, 1,
0.1395799, -0.3756011, 2.734304, 0, 0.6039216, 1, 1,
0.1424701, 1.16565, 1.706621, 0, 0.5960785, 1, 1,
0.1576754, 1.033581, 0.2337124, 0, 0.5921569, 1, 1,
0.160421, 1.383381, -0.07514884, 0, 0.5843138, 1, 1,
0.1608974, -1.083811, 1.773116, 0, 0.5803922, 1, 1,
0.1615362, 2.951662, 2.305822, 0, 0.572549, 1, 1,
0.1651656, 1.640403, -0.8308346, 0, 0.5686275, 1, 1,
0.1664344, -0.6031753, 3.853511, 0, 0.5607843, 1, 1,
0.1670246, -0.6276088, 2.966567, 0, 0.5568628, 1, 1,
0.1674203, -0.1045916, 0.7961329, 0, 0.5490196, 1, 1,
0.1687768, 1.686394, 0.6407698, 0, 0.5450981, 1, 1,
0.1699713, -0.5866137, 2.581414, 0, 0.5372549, 1, 1,
0.1734353, 1.11529, 1.393004, 0, 0.5333334, 1, 1,
0.1773286, 1.848191, -1.258573, 0, 0.5254902, 1, 1,
0.1803846, -0.6207736, 4.753287, 0, 0.5215687, 1, 1,
0.1824174, 0.9466509, 0.675683, 0, 0.5137255, 1, 1,
0.1891439, 0.7646991, 0.693514, 0, 0.509804, 1, 1,
0.1917996, -0.7176477, 0.5965222, 0, 0.5019608, 1, 1,
0.1924389, -1.590602, 2.474166, 0, 0.4941176, 1, 1,
0.1949697, -0.4450894, 1.057393, 0, 0.4901961, 1, 1,
0.1949798, -0.9536931, 3.107892, 0, 0.4823529, 1, 1,
0.2043024, -1.544442, 3.268369, 0, 0.4784314, 1, 1,
0.2062788, 1.971439, -0.5034134, 0, 0.4705882, 1, 1,
0.2080954, 1.536521, -0.6657541, 0, 0.4666667, 1, 1,
0.210658, 0.2402771, -0.5525885, 0, 0.4588235, 1, 1,
0.2240859, 2.340667, 1.298226, 0, 0.454902, 1, 1,
0.2260947, 0.8663779, -1.141074, 0, 0.4470588, 1, 1,
0.2262476, 0.2345335, 1.425581, 0, 0.4431373, 1, 1,
0.2278481, -0.02284791, 1.329647, 0, 0.4352941, 1, 1,
0.2278651, -0.4266299, 2.3338, 0, 0.4313726, 1, 1,
0.2290822, 0.1691896, -0.7665103, 0, 0.4235294, 1, 1,
0.2306867, 0.9362792, -0.4160266, 0, 0.4196078, 1, 1,
0.231076, 0.649326, 0.8972664, 0, 0.4117647, 1, 1,
0.2314828, 0.4276133, -0.3863736, 0, 0.4078431, 1, 1,
0.2330099, 0.69733, 0.7616524, 0, 0.4, 1, 1,
0.2337553, 0.7211468, -0.5130138, 0, 0.3921569, 1, 1,
0.2338554, -1.263839, 1.767483, 0, 0.3882353, 1, 1,
0.2405646, -0.9004775, 3.663203, 0, 0.3803922, 1, 1,
0.2462379, 0.296962, 0.9102452, 0, 0.3764706, 1, 1,
0.248022, 0.09300001, 1.88019, 0, 0.3686275, 1, 1,
0.2482289, -0.1679838, 3.780261, 0, 0.3647059, 1, 1,
0.2489972, -0.06912857, 2.644816, 0, 0.3568628, 1, 1,
0.2492657, -0.4248455, 3.140356, 0, 0.3529412, 1, 1,
0.2510461, 0.7606132, -0.1130329, 0, 0.345098, 1, 1,
0.2523925, -0.9960228, 2.758053, 0, 0.3411765, 1, 1,
0.253237, -0.611224, 2.569375, 0, 0.3333333, 1, 1,
0.2550363, -0.7115517, 2.090246, 0, 0.3294118, 1, 1,
0.2564421, -0.1172139, 0.8431456, 0, 0.3215686, 1, 1,
0.2578387, -0.9289322, 3.520728, 0, 0.3176471, 1, 1,
0.2581003, -0.2590361, 2.06669, 0, 0.3098039, 1, 1,
0.2588832, -0.4989615, 2.278189, 0, 0.3058824, 1, 1,
0.2589383, 0.07384741, 0.4106573, 0, 0.2980392, 1, 1,
0.2610475, 0.696597, 0.4701151, 0, 0.2901961, 1, 1,
0.2634583, 0.7188514, 1.0251, 0, 0.2862745, 1, 1,
0.2640192, 1.046876, -0.3027838, 0, 0.2784314, 1, 1,
0.2720306, -0.3758039, 3.20223, 0, 0.2745098, 1, 1,
0.2762374, -0.4084702, 2.804179, 0, 0.2666667, 1, 1,
0.2788564, -0.3899035, 1.979669, 0, 0.2627451, 1, 1,
0.2802538, -0.7113271, 3.945874, 0, 0.254902, 1, 1,
0.2808138, 1.926288, 1.543604, 0, 0.2509804, 1, 1,
0.2833118, -0.125392, 2.037852, 0, 0.2431373, 1, 1,
0.2837483, -1.517266, 2.653965, 0, 0.2392157, 1, 1,
0.2842494, -1.816764, 1.053473, 0, 0.2313726, 1, 1,
0.2846836, -1.176889, 4.724497, 0, 0.227451, 1, 1,
0.2847213, 1.72921, 1.08305, 0, 0.2196078, 1, 1,
0.2885049, -1.554989, 4.445575, 0, 0.2156863, 1, 1,
0.2891713, -0.8633618, 4.105039, 0, 0.2078431, 1, 1,
0.2904218, -0.2568395, 0.2557679, 0, 0.2039216, 1, 1,
0.2909516, 0.7057952, 0.8554431, 0, 0.1960784, 1, 1,
0.2915693, 1.485921, 0.2170464, 0, 0.1882353, 1, 1,
0.2930577, 0.4612295, 1.522038, 0, 0.1843137, 1, 1,
0.2931557, -0.1610987, 2.470098, 0, 0.1764706, 1, 1,
0.29337, -0.4642391, 1.599432, 0, 0.172549, 1, 1,
0.301882, -0.02193782, 2.212635, 0, 0.1647059, 1, 1,
0.3023187, 0.4129069, 1.851281, 0, 0.1607843, 1, 1,
0.3030219, 0.1126749, 2.108263, 0, 0.1529412, 1, 1,
0.305875, -1.009305, 1.807587, 0, 0.1490196, 1, 1,
0.3061337, 0.8828937, 1.265296, 0, 0.1411765, 1, 1,
0.3074967, -1.019935, 4.200177, 0, 0.1372549, 1, 1,
0.3139112, -2.187182, 3.57346, 0, 0.1294118, 1, 1,
0.3161018, -0.7656677, 3.214158, 0, 0.1254902, 1, 1,
0.3200465, 0.2574595, 0.338026, 0, 0.1176471, 1, 1,
0.3204227, -1.707843, 2.621409, 0, 0.1137255, 1, 1,
0.3212642, 1.128131, 0.9730293, 0, 0.1058824, 1, 1,
0.3215404, -0.5839547, 1.709571, 0, 0.09803922, 1, 1,
0.3262382, 0.7250351, 0.7053677, 0, 0.09411765, 1, 1,
0.3282694, -0.6675714, 3.315362, 0, 0.08627451, 1, 1,
0.3301398, -1.053867, 4.148652, 0, 0.08235294, 1, 1,
0.3346992, -2.169827, 3.208663, 0, 0.07450981, 1, 1,
0.3359076, -0.3162783, 2.328547, 0, 0.07058824, 1, 1,
0.3385122, 0.142141, 1.346543, 0, 0.0627451, 1, 1,
0.3408369, -0.5236805, 2.729549, 0, 0.05882353, 1, 1,
0.343942, -0.605961, 1.892344, 0, 0.05098039, 1, 1,
0.3453848, 1.08282, 0.1244842, 0, 0.04705882, 1, 1,
0.3461248, -0.6047195, 2.002049, 0, 0.03921569, 1, 1,
0.3484237, 2.210363, -0.797241, 0, 0.03529412, 1, 1,
0.3521613, 1.957209, 1.201398, 0, 0.02745098, 1, 1,
0.3526137, 1.188389, -1.387693, 0, 0.02352941, 1, 1,
0.3540666, -0.7080334, 1.594529, 0, 0.01568628, 1, 1,
0.3555147, -0.2971369, 1.535823, 0, 0.01176471, 1, 1,
0.3605765, -0.1416828, 1.570971, 0, 0.003921569, 1, 1,
0.3611648, -1.128947, 3.917776, 0.003921569, 0, 1, 1,
0.3652426, 0.2187791, 2.327135, 0.007843138, 0, 1, 1,
0.3653554, -0.3299907, 1.298356, 0.01568628, 0, 1, 1,
0.3733373, 0.1665396, 2.066402, 0.01960784, 0, 1, 1,
0.3756562, 0.9613404, -0.5930665, 0.02745098, 0, 1, 1,
0.375749, -0.9685079, 3.199842, 0.03137255, 0, 1, 1,
0.3780411, 0.1734886, 1.688524, 0.03921569, 0, 1, 1,
0.3793488, -0.8141401, 2.463221, 0.04313726, 0, 1, 1,
0.3815913, -2.397068, 2.530402, 0.05098039, 0, 1, 1,
0.3837913, -0.6652377, 2.982995, 0.05490196, 0, 1, 1,
0.3856837, 0.8243917, 1.428595, 0.0627451, 0, 1, 1,
0.3877237, -0.03096635, 1.85058, 0.06666667, 0, 1, 1,
0.3916225, 1.89036, 0.876482, 0.07450981, 0, 1, 1,
0.3928346, -0.1816744, 2.397368, 0.07843138, 0, 1, 1,
0.3932345, 0.3864094, 1.105559, 0.08627451, 0, 1, 1,
0.4021568, -0.7031685, 2.451821, 0.09019608, 0, 1, 1,
0.4056703, -0.8711705, 3.967719, 0.09803922, 0, 1, 1,
0.4073188, -1.381124, 1.862455, 0.1058824, 0, 1, 1,
0.4088269, 0.6647082, -1.371706, 0.1098039, 0, 1, 1,
0.409221, -0.811968, 1.803959, 0.1176471, 0, 1, 1,
0.4125469, 1.004373, 0.2033738, 0.1215686, 0, 1, 1,
0.419382, -1.361766, 3.107409, 0.1294118, 0, 1, 1,
0.4200306, -0.6641809, 2.077041, 0.1333333, 0, 1, 1,
0.4206105, 1.864237, -0.5216997, 0.1411765, 0, 1, 1,
0.4255343, -0.4171186, 2.425538, 0.145098, 0, 1, 1,
0.4307359, -0.4044096, 1.563828, 0.1529412, 0, 1, 1,
0.4312892, -0.4960348, 3.369737, 0.1568628, 0, 1, 1,
0.4315979, 0.1112815, 0.1357445, 0.1647059, 0, 1, 1,
0.4328863, 0.1646642, 0.03009799, 0.1686275, 0, 1, 1,
0.435816, -0.1036481, -0.0267193, 0.1764706, 0, 1, 1,
0.4370143, 0.6346327, 1.812875, 0.1803922, 0, 1, 1,
0.4396128, -0.9548775, 0.9866261, 0.1882353, 0, 1, 1,
0.4403827, 1.162738, 0.4973143, 0.1921569, 0, 1, 1,
0.4437737, -2.159095, 0.2465154, 0.2, 0, 1, 1,
0.4486138, 0.4641891, 1.260837, 0.2078431, 0, 1, 1,
0.4490829, -0.7996023, 3.198976, 0.2117647, 0, 1, 1,
0.4510535, 0.5813585, 0.9857193, 0.2196078, 0, 1, 1,
0.4538541, 1.144149, 0.4054689, 0.2235294, 0, 1, 1,
0.4568142, 0.7985809, 1.908196, 0.2313726, 0, 1, 1,
0.4578984, -0.4747421, 2.518809, 0.2352941, 0, 1, 1,
0.4584977, -0.3203049, 3.995272, 0.2431373, 0, 1, 1,
0.4587741, -0.4237801, 4.180538, 0.2470588, 0, 1, 1,
0.4598507, 0.1168494, 2.546281, 0.254902, 0, 1, 1,
0.4614469, -0.9114603, 2.034325, 0.2588235, 0, 1, 1,
0.4618419, 0.9098403, -0.3614774, 0.2666667, 0, 1, 1,
0.4660897, 1.043296, 2.826869, 0.2705882, 0, 1, 1,
0.4668862, 1.716715, -0.9214922, 0.2784314, 0, 1, 1,
0.4670839, 0.7888333, -0.156761, 0.282353, 0, 1, 1,
0.4708841, 0.7464465, 1.00904, 0.2901961, 0, 1, 1,
0.472919, 0.7948202, 0.3142484, 0.2941177, 0, 1, 1,
0.4764351, -1.365892, 3.107885, 0.3019608, 0, 1, 1,
0.4868908, 0.8807073, 0.5420412, 0.3098039, 0, 1, 1,
0.4897231, 0.9881771, -0.3590771, 0.3137255, 0, 1, 1,
0.4921713, -1.001688, 2.464783, 0.3215686, 0, 1, 1,
0.4944372, -1.65924, 2.677533, 0.3254902, 0, 1, 1,
0.4948913, 0.7260819, 0.08486086, 0.3333333, 0, 1, 1,
0.4952715, 0.2068057, -0.2869607, 0.3372549, 0, 1, 1,
0.4960446, 1.59843, -0.2577607, 0.345098, 0, 1, 1,
0.498162, 0.1667937, 0.3995636, 0.3490196, 0, 1, 1,
0.4984366, 0.5543144, 1.209729, 0.3568628, 0, 1, 1,
0.5029076, 0.6753604, -0.2564723, 0.3607843, 0, 1, 1,
0.5046518, 0.2305802, 1.460704, 0.3686275, 0, 1, 1,
0.507338, -0.14027, 2.933004, 0.372549, 0, 1, 1,
0.5167078, -2.180038, 3.521255, 0.3803922, 0, 1, 1,
0.5177668, -0.9161831, 1.606461, 0.3843137, 0, 1, 1,
0.5182852, 0.1638416, 2.820343, 0.3921569, 0, 1, 1,
0.5194742, 0.5041552, 0.05444588, 0.3960784, 0, 1, 1,
0.5204583, -1.283157, 2.400014, 0.4039216, 0, 1, 1,
0.5284745, -0.1234825, -0.3634106, 0.4117647, 0, 1, 1,
0.5411984, -0.3491064, 2.031782, 0.4156863, 0, 1, 1,
0.5437785, -1.273827, 1.528018, 0.4235294, 0, 1, 1,
0.5521845, -0.2590733, 0.5829474, 0.427451, 0, 1, 1,
0.5538467, -1.978977, 2.011482, 0.4352941, 0, 1, 1,
0.5561428, 0.4402323, 0.001054119, 0.4392157, 0, 1, 1,
0.5647288, 1.158825, 1.229448, 0.4470588, 0, 1, 1,
0.5670913, 0.04731726, 1.31702, 0.4509804, 0, 1, 1,
0.5699577, 0.2584945, -0.5616854, 0.4588235, 0, 1, 1,
0.5737872, -1.078355, 2.293341, 0.4627451, 0, 1, 1,
0.5747252, -0.8048943, 2.011574, 0.4705882, 0, 1, 1,
0.5764829, 0.6342943, 1.889523, 0.4745098, 0, 1, 1,
0.5773565, 1.503753, 0.5654373, 0.4823529, 0, 1, 1,
0.5792502, -0.5448772, 1.405231, 0.4862745, 0, 1, 1,
0.5824814, -0.5881009, 1.762049, 0.4941176, 0, 1, 1,
0.5942249, 1.044762, 1.226337, 0.5019608, 0, 1, 1,
0.5945863, 2.174225, -1.173632, 0.5058824, 0, 1, 1,
0.5950388, -1.201449, 4.969334, 0.5137255, 0, 1, 1,
0.5955134, -0.5942037, 4.036605, 0.5176471, 0, 1, 1,
0.5957103, -1.082583, 2.265636, 0.5254902, 0, 1, 1,
0.5999612, -0.5305135, 4.569342, 0.5294118, 0, 1, 1,
0.6050646, 0.2622319, 1.252238, 0.5372549, 0, 1, 1,
0.6058117, 0.6427432, -0.01695967, 0.5411765, 0, 1, 1,
0.6069899, -1.392852, 1.724693, 0.5490196, 0, 1, 1,
0.6250045, 1.174351, 0.6682773, 0.5529412, 0, 1, 1,
0.625838, -1.098145, 1.90589, 0.5607843, 0, 1, 1,
0.6284382, -1.402857, 2.817534, 0.5647059, 0, 1, 1,
0.6289597, 0.8113463, 1.565094, 0.572549, 0, 1, 1,
0.6318064, 1.397182, -0.4174601, 0.5764706, 0, 1, 1,
0.6319274, 0.7112268, 0.6814535, 0.5843138, 0, 1, 1,
0.6384233, -2.424593, 1.621358, 0.5882353, 0, 1, 1,
0.6385757, -1.055511, 1.941914, 0.5960785, 0, 1, 1,
0.6398944, 0.3643847, 1.959958, 0.6039216, 0, 1, 1,
0.6413179, 0.07577749, 1.627192, 0.6078432, 0, 1, 1,
0.64181, 0.01538453, 2.879117, 0.6156863, 0, 1, 1,
0.6439316, 0.07764276, 1.539625, 0.6196079, 0, 1, 1,
0.6480194, 0.7595928, 1.437307, 0.627451, 0, 1, 1,
0.652954, -1.473037, 2.911152, 0.6313726, 0, 1, 1,
0.654904, 0.9381977, 0.7375519, 0.6392157, 0, 1, 1,
0.6597639, -1.738025, 3.886997, 0.6431373, 0, 1, 1,
0.6600474, 0.001065924, 1.125362, 0.6509804, 0, 1, 1,
0.6623024, 0.7515303, -0.0541782, 0.654902, 0, 1, 1,
0.6728399, 0.4047745, 0.3298319, 0.6627451, 0, 1, 1,
0.6768738, -0.2466511, 0.5531715, 0.6666667, 0, 1, 1,
0.6784316, -0.4141855, 3.640409, 0.6745098, 0, 1, 1,
0.6893185, -0.4387029, 2.352009, 0.6784314, 0, 1, 1,
0.6976346, -0.2738083, 0.8875057, 0.6862745, 0, 1, 1,
0.7114658, 1.755853, -0.5759497, 0.6901961, 0, 1, 1,
0.7183948, 1.52956, 1.05654, 0.6980392, 0, 1, 1,
0.7196606, -0.1312412, 2.429157, 0.7058824, 0, 1, 1,
0.7209408, -0.1691841, 0.2598194, 0.7098039, 0, 1, 1,
0.7222661, 1.019028, 0.6761475, 0.7176471, 0, 1, 1,
0.7249019, 0.5368462, 0.02705753, 0.7215686, 0, 1, 1,
0.727716, 1.732707, -0.9243687, 0.7294118, 0, 1, 1,
0.7424053, 0.8080892, 1.962901, 0.7333333, 0, 1, 1,
0.7457851, -0.6790528, 2.111852, 0.7411765, 0, 1, 1,
0.7468066, 1.206359, -0.804881, 0.7450981, 0, 1, 1,
0.7498491, 0.7680789, 0.2641042, 0.7529412, 0, 1, 1,
0.7575357, -0.3086432, 3.416777, 0.7568628, 0, 1, 1,
0.76037, 0.6216868, -0.1606028, 0.7647059, 0, 1, 1,
0.7634789, 0.327081, -0.1703115, 0.7686275, 0, 1, 1,
0.7675568, 0.6651598, 0.4570147, 0.7764706, 0, 1, 1,
0.7683107, 1.140333, 1.081233, 0.7803922, 0, 1, 1,
0.7775628, 0.06793855, 2.834747, 0.7882353, 0, 1, 1,
0.778926, -2.071944, 2.804214, 0.7921569, 0, 1, 1,
0.7796453, 0.2625903, 0.590772, 0.8, 0, 1, 1,
0.7867098, -0.1288685, 1.407992, 0.8078431, 0, 1, 1,
0.7870448, 0.511022, 1.5821, 0.8117647, 0, 1, 1,
0.7992276, -0.09917337, 3.427208, 0.8196079, 0, 1, 1,
0.8059968, 0.6709921, 1.994851, 0.8235294, 0, 1, 1,
0.8070319, -0.0241358, 2.620637, 0.8313726, 0, 1, 1,
0.8098295, 0.9656863, 0.4866509, 0.8352941, 0, 1, 1,
0.8118975, 1.117625, -1.110032, 0.8431373, 0, 1, 1,
0.8138258, -1.227813, 0.9630767, 0.8470588, 0, 1, 1,
0.8144444, -0.1642359, 0.4829524, 0.854902, 0, 1, 1,
0.8219957, -0.2438085, 1.652608, 0.8588235, 0, 1, 1,
0.8242915, -1.427517, 2.97993, 0.8666667, 0, 1, 1,
0.8332249, -1.282342, 4.228223, 0.8705882, 0, 1, 1,
0.8411928, 0.2175693, -0.07761366, 0.8784314, 0, 1, 1,
0.8521771, 1.596184, -0.1924112, 0.8823529, 0, 1, 1,
0.8589765, -0.1362008, 3.03805, 0.8901961, 0, 1, 1,
0.8636928, 1.164334, 1.024516, 0.8941177, 0, 1, 1,
0.8737075, 0.4194801, 1.551271, 0.9019608, 0, 1, 1,
0.8771781, 0.8693992, -0.3537722, 0.9098039, 0, 1, 1,
0.8789076, 0.9580245, 2.749477, 0.9137255, 0, 1, 1,
0.879043, 1.703856, 0.5005012, 0.9215686, 0, 1, 1,
0.8896375, 0.08719151, 1.924185, 0.9254902, 0, 1, 1,
0.8909886, -0.3620179, 2.473379, 0.9333333, 0, 1, 1,
0.8924009, -2.329909, 3.367075, 0.9372549, 0, 1, 1,
0.8926297, -0.8443168, 2.010498, 0.945098, 0, 1, 1,
0.8952997, -0.8591954, 4.066134, 0.9490196, 0, 1, 1,
0.8993011, 0.8048824, 2.990118, 0.9568627, 0, 1, 1,
0.9175311, -0.3678944, 2.267184, 0.9607843, 0, 1, 1,
0.9323329, -1.487389, 2.412764, 0.9686275, 0, 1, 1,
0.9328998, 0.02558197, -0.3991973, 0.972549, 0, 1, 1,
0.9359948, -1.877223, 0.98545, 0.9803922, 0, 1, 1,
0.9369732, 0.3832161, 1.546956, 0.9843137, 0, 1, 1,
0.9469912, -0.372576, 2.983851, 0.9921569, 0, 1, 1,
0.9474364, -0.1016627, 2.524149, 0.9960784, 0, 1, 1,
0.9536725, -0.6173012, 1.960666, 1, 0, 0.9960784, 1,
0.9592007, 0.2819078, 0.1693413, 1, 0, 0.9882353, 1,
0.9614121, -2.156698, 2.312338, 1, 0, 0.9843137, 1,
0.9688326, 1.065407, 0.4069703, 1, 0, 0.9764706, 1,
0.9705306, -0.5747406, 1.621329, 1, 0, 0.972549, 1,
0.9800938, -0.4757665, 3.353089, 1, 0, 0.9647059, 1,
0.9809788, 0.4368697, -0.286188, 1, 0, 0.9607843, 1,
0.9962595, 1.419767, -0.8709961, 1, 0, 0.9529412, 1,
0.9997234, -0.7681184, 0.9720745, 1, 0, 0.9490196, 1,
1.013389, 0.6240065, 1.754526, 1, 0, 0.9411765, 1,
1.018051, -0.5849261, 1.952265, 1, 0, 0.9372549, 1,
1.019641, -0.5737516, 1.248162, 1, 0, 0.9294118, 1,
1.024696, 0.4006395, -0.1702514, 1, 0, 0.9254902, 1,
1.026902, 0.07340954, 2.381498, 1, 0, 0.9176471, 1,
1.032048, 0.804203, -0.759792, 1, 0, 0.9137255, 1,
1.032524, -0.5242829, 1.821382, 1, 0, 0.9058824, 1,
1.033784, -0.0668317, 2.303934, 1, 0, 0.9019608, 1,
1.038465, -0.7082959, 2.611564, 1, 0, 0.8941177, 1,
1.043429, -0.6693725, 3.419636, 1, 0, 0.8862745, 1,
1.053897, 0.8989859, 1.484652, 1, 0, 0.8823529, 1,
1.05504, -1.808871, 3.010552, 1, 0, 0.8745098, 1,
1.063144, -0.6051288, 2.361212, 1, 0, 0.8705882, 1,
1.063962, 1.647185, 1.572693, 1, 0, 0.8627451, 1,
1.068506, -0.1989556, 2.951527, 1, 0, 0.8588235, 1,
1.070491, 0.7985976, 0.5236642, 1, 0, 0.8509804, 1,
1.072659, -0.7249413, 0.7691716, 1, 0, 0.8470588, 1,
1.073156, -0.3405704, 1.482091, 1, 0, 0.8392157, 1,
1.077471, 0.05274353, 2.388427, 1, 0, 0.8352941, 1,
1.079789, 0.8159067, 1.052441, 1, 0, 0.827451, 1,
1.083781, 0.6674965, 2.317553, 1, 0, 0.8235294, 1,
1.090993, 1.347282, 0.5564588, 1, 0, 0.8156863, 1,
1.091644, 1.018328, 1.995607, 1, 0, 0.8117647, 1,
1.094777, -0.775808, 1.868521, 1, 0, 0.8039216, 1,
1.098711, 0.7912441, -0.05403417, 1, 0, 0.7960784, 1,
1.099305, -0.3570969, 2.792725, 1, 0, 0.7921569, 1,
1.104244, -0.7255007, 2.328834, 1, 0, 0.7843137, 1,
1.113027, -0.4509932, 0.9833047, 1, 0, 0.7803922, 1,
1.113508, 0.9826207, 0.7567559, 1, 0, 0.772549, 1,
1.12392, 1.096762, 0.07485174, 1, 0, 0.7686275, 1,
1.1307, -1.572417, 2.292422, 1, 0, 0.7607843, 1,
1.130839, -0.6317368, 0.8189215, 1, 0, 0.7568628, 1,
1.135841, -1.474836, 1.592831, 1, 0, 0.7490196, 1,
1.137348, -1.257438, 2.822039, 1, 0, 0.7450981, 1,
1.141249, -0.4674305, 2.436377, 1, 0, 0.7372549, 1,
1.142706, -0.2155486, 0.8479769, 1, 0, 0.7333333, 1,
1.150266, -0.9171782, 1.000627, 1, 0, 0.7254902, 1,
1.150407, -0.01096169, -0.2773027, 1, 0, 0.7215686, 1,
1.154173, 0.3325346, 0.8447396, 1, 0, 0.7137255, 1,
1.164001, -1.482123, 2.111418, 1, 0, 0.7098039, 1,
1.172951, -0.8019345, 0.7478323, 1, 0, 0.7019608, 1,
1.174669, 0.09508783, 1.535305, 1, 0, 0.6941177, 1,
1.175887, -0.515991, 3.372188, 1, 0, 0.6901961, 1,
1.176304, -1.567127, 1.658096, 1, 0, 0.682353, 1,
1.186549, 0.9390821, 0.2141029, 1, 0, 0.6784314, 1,
1.191786, -0.2026794, 0.7354446, 1, 0, 0.6705883, 1,
1.192692, 1.026894, 2.023216, 1, 0, 0.6666667, 1,
1.193937, 0.3062829, 1.451434, 1, 0, 0.6588235, 1,
1.198966, -0.4611675, 2.044338, 1, 0, 0.654902, 1,
1.200583, 1.112056, 0.1183016, 1, 0, 0.6470588, 1,
1.205547, -0.6288285, 2.282815, 1, 0, 0.6431373, 1,
1.209208, 1.839233, 0.1926225, 1, 0, 0.6352941, 1,
1.209418, -0.4966516, 1.145037, 1, 0, 0.6313726, 1,
1.218914, 0.6569539, 0.4881319, 1, 0, 0.6235294, 1,
1.219352, 1.390901, -0.4994326, 1, 0, 0.6196079, 1,
1.23616, 0.9259874, 1.484211, 1, 0, 0.6117647, 1,
1.250592, -0.3488674, 2.615883, 1, 0, 0.6078432, 1,
1.253213, 0.2129678, 0.259881, 1, 0, 0.6, 1,
1.253378, -1.266891, 1.534613, 1, 0, 0.5921569, 1,
1.254439, 1.558034, 0.3619255, 1, 0, 0.5882353, 1,
1.255403, -0.03419882, 1.242633, 1, 0, 0.5803922, 1,
1.257509, 1.060943, 1.706857, 1, 0, 0.5764706, 1,
1.272007, -0.5978959, 0.7015095, 1, 0, 0.5686275, 1,
1.274166, -0.2467097, 2.36974, 1, 0, 0.5647059, 1,
1.278964, 0.7996992, 1.523831, 1, 0, 0.5568628, 1,
1.285441, 0.1810169, 0.1833625, 1, 0, 0.5529412, 1,
1.288283, -1.288537, 1.472427, 1, 0, 0.5450981, 1,
1.293859, -1.425404, 0.7016909, 1, 0, 0.5411765, 1,
1.295335, -0.8794269, 2.119413, 1, 0, 0.5333334, 1,
1.30038, 0.533708, 0.7826548, 1, 0, 0.5294118, 1,
1.300767, -0.8065866, 2.826232, 1, 0, 0.5215687, 1,
1.305049, -0.3010065, 1.352217, 1, 0, 0.5176471, 1,
1.309036, -0.4522014, 2.032284, 1, 0, 0.509804, 1,
1.314148, 0.624088, 0.4560983, 1, 0, 0.5058824, 1,
1.331639, -0.9713672, 2.554778, 1, 0, 0.4980392, 1,
1.340094, -0.2279391, 2.423498, 1, 0, 0.4901961, 1,
1.353292, 0.9113603, 0.7785293, 1, 0, 0.4862745, 1,
1.355788, -1.75077, 1.011627, 1, 0, 0.4784314, 1,
1.361035, -0.822986, 1.550079, 1, 0, 0.4745098, 1,
1.370731, 0.4190297, 0.9561599, 1, 0, 0.4666667, 1,
1.384512, 0.7536388, 0.350022, 1, 0, 0.4627451, 1,
1.384724, 2.58728, 1.496815, 1, 0, 0.454902, 1,
1.393831, 1.563856, 1.085176, 1, 0, 0.4509804, 1,
1.412429, -1.585876, 1.955829, 1, 0, 0.4431373, 1,
1.417638, 0.3867103, 1.722307, 1, 0, 0.4392157, 1,
1.418058, -0.3146101, 3.389463, 1, 0, 0.4313726, 1,
1.420823, -0.4907148, 0.7927553, 1, 0, 0.427451, 1,
1.426912, 1.496327, 0.9945261, 1, 0, 0.4196078, 1,
1.428202, -2.975015, 1.869995, 1, 0, 0.4156863, 1,
1.429177, 0.775992, 1.129068, 1, 0, 0.4078431, 1,
1.437932, -0.6362901, 3.257921, 1, 0, 0.4039216, 1,
1.44709, 1.955703, 0.5147408, 1, 0, 0.3960784, 1,
1.451081, -0.307215, 3.569273, 1, 0, 0.3882353, 1,
1.470462, 1.307543, 0.79369, 1, 0, 0.3843137, 1,
1.470808, 0.3231803, 1.008894, 1, 0, 0.3764706, 1,
1.478361, 1.473519, 0.4398923, 1, 0, 0.372549, 1,
1.478516, -0.6187937, 1.886115, 1, 0, 0.3647059, 1,
1.480815, -0.4445546, 3.230898, 1, 0, 0.3607843, 1,
1.485735, 0.487229, 0.1293534, 1, 0, 0.3529412, 1,
1.505616, -0.6566713, 1.812388, 1, 0, 0.3490196, 1,
1.509959, 0.3035368, 0.6545613, 1, 0, 0.3411765, 1,
1.515328, -0.2495269, 1.786278, 1, 0, 0.3372549, 1,
1.521827, -0.6753824, 0.07568309, 1, 0, 0.3294118, 1,
1.530086, 0.3498552, 0.9711955, 1, 0, 0.3254902, 1,
1.541221, -1.11634, 0.6519706, 1, 0, 0.3176471, 1,
1.545051, -0.8728343, 2.193969, 1, 0, 0.3137255, 1,
1.550331, 0.9667182, 1.188728, 1, 0, 0.3058824, 1,
1.551476, -1.229253, 2.706917, 1, 0, 0.2980392, 1,
1.577615, -0.366409, 1.44595, 1, 0, 0.2941177, 1,
1.588438, -1.146556, 0.8418067, 1, 0, 0.2862745, 1,
1.596614, -0.2536271, 1.942772, 1, 0, 0.282353, 1,
1.599046, -1.481362, 1.802581, 1, 0, 0.2745098, 1,
1.601488, -1.447195, 1.375796, 1, 0, 0.2705882, 1,
1.631451, 0.1405261, 4.850357, 1, 0, 0.2627451, 1,
1.641672, -0.008840024, 3.189277, 1, 0, 0.2588235, 1,
1.653298, 0.08554173, 2.074936, 1, 0, 0.2509804, 1,
1.662119, -1.179342, 3.08883, 1, 0, 0.2470588, 1,
1.665593, -0.6544046, 1.983258, 1, 0, 0.2392157, 1,
1.681955, 0.3471606, -0.02509697, 1, 0, 0.2352941, 1,
1.706749, -1.33578, 2.891896, 1, 0, 0.227451, 1,
1.728161, 0.6571961, 0.9368206, 1, 0, 0.2235294, 1,
1.741869, -1.093175, 1.995332, 1, 0, 0.2156863, 1,
1.75873, -0.4923276, -1.120382, 1, 0, 0.2117647, 1,
1.772868, 0.4498298, 2.083063, 1, 0, 0.2039216, 1,
1.777744, 0.2582007, 1.334804, 1, 0, 0.1960784, 1,
1.814486, -0.9504637, 4.148059, 1, 0, 0.1921569, 1,
1.827559, 0.4338929, 2.823717, 1, 0, 0.1843137, 1,
1.829126, -1.676533, 2.072857, 1, 0, 0.1803922, 1,
1.859399, -1.723028, 1.829504, 1, 0, 0.172549, 1,
1.86766, -0.9545223, 2.63398, 1, 0, 0.1686275, 1,
1.86887, -0.6081541, 2.51731, 1, 0, 0.1607843, 1,
1.878728, 2.087137, 2.840009, 1, 0, 0.1568628, 1,
1.89133, -0.1506853, 0.7526357, 1, 0, 0.1490196, 1,
1.910125, 0.01077498, -0.6986331, 1, 0, 0.145098, 1,
1.954951, -0.4286833, 0.2861664, 1, 0, 0.1372549, 1,
1.956274, 0.06826641, 2.226963, 1, 0, 0.1333333, 1,
2.005638, -0.5556368, 2.82092, 1, 0, 0.1254902, 1,
2.029479, 0.1997407, 3.147309, 1, 0, 0.1215686, 1,
2.06835, -2.065047, 1.576672, 1, 0, 0.1137255, 1,
2.090239, -0.1252217, 3.087563, 1, 0, 0.1098039, 1,
2.105817, 1.525818, 0.7859383, 1, 0, 0.1019608, 1,
2.126295, 0.3721322, 2.931484, 1, 0, 0.09411765, 1,
2.13866, 0.2795446, 0.9759437, 1, 0, 0.09019608, 1,
2.145042, 0.3884759, 2.657567, 1, 0, 0.08235294, 1,
2.217208, -0.2697174, 2.03025, 1, 0, 0.07843138, 1,
2.230108, 0.8244236, 1.538911, 1, 0, 0.07058824, 1,
2.230297, 0.3347296, 0.4719261, 1, 0, 0.06666667, 1,
2.29601, -0.9165689, 1.0584, 1, 0, 0.05882353, 1,
2.327349, 0.1457168, 1.795951, 1, 0, 0.05490196, 1,
2.382086, -1.834674, 2.585768, 1, 0, 0.04705882, 1,
2.394593, -0.1578524, 1.613809, 1, 0, 0.04313726, 1,
2.4656, 0.8764292, 2.19883, 1, 0, 0.03529412, 1,
2.579639, 0.5703908, 1.582615, 1, 0, 0.03137255, 1,
2.787219, 2.21116, 0.2386005, 1, 0, 0.02352941, 1,
2.816869, -0.4840847, 3.937754, 1, 0, 0.01960784, 1,
3.175798, -0.4125024, 2.05079, 1, 0, 0.01176471, 1,
3.359893, 0.961162, 1.980974, 1, 0, 0.007843138, 1
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
0.2218989, -4.269714, -6.383238, 0, -0.5, 0.5, 0.5,
0.2218989, -4.269714, -6.383238, 1, -0.5, 0.5, 0.5,
0.2218989, -4.269714, -6.383238, 1, 1.5, 0.5, 0.5,
0.2218989, -4.269714, -6.383238, 0, 1.5, 0.5, 0.5
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
-3.979875, -0.1357156, -6.383238, 0, -0.5, 0.5, 0.5,
-3.979875, -0.1357156, -6.383238, 1, -0.5, 0.5, 0.5,
-3.979875, -0.1357156, -6.383238, 1, 1.5, 0.5, 0.5,
-3.979875, -0.1357156, -6.383238, 0, 1.5, 0.5, 0.5
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
-3.979875, -4.269714, 0.1157331, 0, -0.5, 0.5, 0.5,
-3.979875, -4.269714, 0.1157331, 1, -0.5, 0.5, 0.5,
-3.979875, -4.269714, 0.1157331, 1, 1.5, 0.5, 0.5,
-3.979875, -4.269714, 0.1157331, 0, 1.5, 0.5, 0.5
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
-2, -3.315714, -4.883475,
3, -3.315714, -4.883475,
-2, -3.315714, -4.883475,
-2, -3.474714, -5.133436,
-1, -3.315714, -4.883475,
-1, -3.474714, -5.133436,
0, -3.315714, -4.883475,
0, -3.474714, -5.133436,
1, -3.315714, -4.883475,
1, -3.474714, -5.133436,
2, -3.315714, -4.883475,
2, -3.474714, -5.133436,
3, -3.315714, -4.883475,
3, -3.474714, -5.133436
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
-2, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
-2, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
-2, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
-2, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5,
-1, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
-1, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
-1, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
-1, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5,
0, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
0, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
0, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
0, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5,
1, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
1, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
1, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
1, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5,
2, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
2, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
2, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
2, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5,
3, -3.792714, -5.633357, 0, -0.5, 0.5, 0.5,
3, -3.792714, -5.633357, 1, -0.5, 0.5, 0.5,
3, -3.792714, -5.633357, 1, 1.5, 0.5, 0.5,
3, -3.792714, -5.633357, 0, 1.5, 0.5, 0.5
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
-3.010235, -3, -4.883475,
-3.010235, 2, -4.883475,
-3.010235, -3, -4.883475,
-3.171841, -3, -5.133436,
-3.010235, -2, -4.883475,
-3.171841, -2, -5.133436,
-3.010235, -1, -4.883475,
-3.171841, -1, -5.133436,
-3.010235, 0, -4.883475,
-3.171841, 0, -5.133436,
-3.010235, 1, -4.883475,
-3.171841, 1, -5.133436,
-3.010235, 2, -4.883475,
-3.171841, 2, -5.133436
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
-3.495055, -3, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, -3, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, -3, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, -3, -5.633357, 0, 1.5, 0.5, 0.5,
-3.495055, -2, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, -2, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, -2, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, -2, -5.633357, 0, 1.5, 0.5, 0.5,
-3.495055, -1, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, -1, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, -1, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, -1, -5.633357, 0, 1.5, 0.5, 0.5,
-3.495055, 0, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, 0, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, 0, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, 0, -5.633357, 0, 1.5, 0.5, 0.5,
-3.495055, 1, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, 1, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, 1, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, 1, -5.633357, 0, 1.5, 0.5, 0.5,
-3.495055, 2, -5.633357, 0, -0.5, 0.5, 0.5,
-3.495055, 2, -5.633357, 1, -0.5, 0.5, 0.5,
-3.495055, 2, -5.633357, 1, 1.5, 0.5, 0.5,
-3.495055, 2, -5.633357, 0, 1.5, 0.5, 0.5
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
-3.010235, -3.315714, -4,
-3.010235, -3.315714, 4,
-3.010235, -3.315714, -4,
-3.171841, -3.474714, -4,
-3.010235, -3.315714, -2,
-3.171841, -3.474714, -2,
-3.010235, -3.315714, 0,
-3.171841, -3.474714, 0,
-3.010235, -3.315714, 2,
-3.171841, -3.474714, 2,
-3.010235, -3.315714, 4,
-3.171841, -3.474714, 4
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
-3.495055, -3.792714, -4, 0, -0.5, 0.5, 0.5,
-3.495055, -3.792714, -4, 1, -0.5, 0.5, 0.5,
-3.495055, -3.792714, -4, 1, 1.5, 0.5, 0.5,
-3.495055, -3.792714, -4, 0, 1.5, 0.5, 0.5,
-3.495055, -3.792714, -2, 0, -0.5, 0.5, 0.5,
-3.495055, -3.792714, -2, 1, -0.5, 0.5, 0.5,
-3.495055, -3.792714, -2, 1, 1.5, 0.5, 0.5,
-3.495055, -3.792714, -2, 0, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 0, 0, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 0, 1, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 0, 1, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 0, 0, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 2, 0, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 2, 1, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 2, 1, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 2, 0, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 4, 0, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 4, 1, -0.5, 0.5, 0.5,
-3.495055, -3.792714, 4, 1, 1.5, 0.5, 0.5,
-3.495055, -3.792714, 4, 0, 1.5, 0.5, 0.5
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
-3.010235, -3.315714, -4.883475,
-3.010235, 3.044283, -4.883475,
-3.010235, -3.315714, 5.114942,
-3.010235, 3.044283, 5.114942,
-3.010235, -3.315714, -4.883475,
-3.010235, -3.315714, 5.114942,
-3.010235, 3.044283, -4.883475,
-3.010235, 3.044283, 5.114942,
-3.010235, -3.315714, -4.883475,
3.454032, -3.315714, -4.883475,
-3.010235, -3.315714, 5.114942,
3.454032, -3.315714, 5.114942,
-3.010235, 3.044283, -4.883475,
3.454032, 3.044283, -4.883475,
-3.010235, 3.044283, 5.114942,
3.454032, 3.044283, 5.114942,
3.454032, -3.315714, -4.883475,
3.454032, 3.044283, -4.883475,
3.454032, -3.315714, 5.114942,
3.454032, 3.044283, 5.114942,
3.454032, -3.315714, -4.883475,
3.454032, -3.315714, 5.114942,
3.454032, 3.044283, -4.883475,
3.454032, 3.044283, 5.114942
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
var radius = 7.207841;
var distance = 32.0685;
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
mvMatrix.translate( -0.2218989, 0.1357156, -0.1157331 );
mvMatrix.scale( 1.20559, 1.225356, 0.7794493 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.0685);
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
3-AT<-read.table("3-AT.xyz")
```

```
## Error in read.table("3-AT.xyz"): no lines available in input
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
-2.916095, -0.7848002, -2.603088, 0, 0, 1, 1, 1,
-2.709646, 0.06370009, -2.606994, 1, 0, 0, 1, 1,
-2.659058, -0.1240573, -0.5844898, 1, 0, 0, 1, 1,
-2.581502, 1.4396, 1.463191, 1, 0, 0, 1, 1,
-2.55789, 0.3216423, -1.052479, 1, 0, 0, 1, 1,
-2.485542, 0.6928025, 0.520539, 1, 0, 0, 1, 1,
-2.432724, -0.6466991, -2.929699, 0, 0, 0, 1, 1,
-2.390885, 0.7776096, 0.3301069, 0, 0, 0, 1, 1,
-2.38898, 0.7968288, -1.280356, 0, 0, 0, 1, 1,
-2.364859, -0.8540073, -2.073854, 0, 0, 0, 1, 1,
-2.362542, -1.52126, -3.428674, 0, 0, 0, 1, 1,
-2.308199, 0.9444306, -1.241952, 0, 0, 0, 1, 1,
-2.269719, 0.2822216, -0.8033988, 0, 0, 0, 1, 1,
-2.219355, -0.06814907, -1.096983, 1, 1, 1, 1, 1,
-2.156609, 0.09383342, -1.759037, 1, 1, 1, 1, 1,
-2.15508, -1.251909, -1.598746, 1, 1, 1, 1, 1,
-2.136412, 0.04887718, -2.353299, 1, 1, 1, 1, 1,
-2.084889, -0.01803559, -2.716346, 1, 1, 1, 1, 1,
-2.072163, -0.5782865, -1.733469, 1, 1, 1, 1, 1,
-2.057089, 0.8554867, -2.257683, 1, 1, 1, 1, 1,
-2.047012, 0.01821402, -2.402757, 1, 1, 1, 1, 1,
-2.044563, -0.4525011, -0.003344164, 1, 1, 1, 1, 1,
-1.981083, 1.076479, -2.175472, 1, 1, 1, 1, 1,
-1.954793, -0.507672, -1.15967, 1, 1, 1, 1, 1,
-1.952942, 0.5770597, -1.938614, 1, 1, 1, 1, 1,
-1.944856, -0.2531734, -2.558064, 1, 1, 1, 1, 1,
-1.936179, 0.8586802, -1.973805, 1, 1, 1, 1, 1,
-1.935195, -1.878887, -2.121551, 1, 1, 1, 1, 1,
-1.934087, 1.312893, 0.44177, 0, 0, 1, 1, 1,
-1.933429, -1.918153, -1.787284, 1, 0, 0, 1, 1,
-1.923308, 0.6837615, -1.052911, 1, 0, 0, 1, 1,
-1.900295, -0.9632589, -1.435369, 1, 0, 0, 1, 1,
-1.895045, 1.417377, 0.2428084, 1, 0, 0, 1, 1,
-1.884221, -0.7078082, -1.19375, 1, 0, 0, 1, 1,
-1.880145, 0.07678396, -1.11528, 0, 0, 0, 1, 1,
-1.87399, 1.935893, -0.4741979, 0, 0, 0, 1, 1,
-1.864284, 1.704648, -0.875957, 0, 0, 0, 1, 1,
-1.861853, 0.05806429, -1.0873, 0, 0, 0, 1, 1,
-1.858482, 0.6835517, -0.5709342, 0, 0, 0, 1, 1,
-1.857094, -0.2712906, -2.825746, 0, 0, 0, 1, 1,
-1.850934, -0.1162908, -2.176006, 0, 0, 0, 1, 1,
-1.830126, -0.9721674, -1.658547, 1, 1, 1, 1, 1,
-1.82696, 0.5664871, -1.112884, 1, 1, 1, 1, 1,
-1.798501, 0.1956792, -2.112073, 1, 1, 1, 1, 1,
-1.786242, -0.2830039, -3.293328, 1, 1, 1, 1, 1,
-1.772489, -0.5851955, -2.724254, 1, 1, 1, 1, 1,
-1.76816, -1.037649, -1.37941, 1, 1, 1, 1, 1,
-1.755164, -0.6390398, -2.830049, 1, 1, 1, 1, 1,
-1.752989, -1.195997, -1.903414, 1, 1, 1, 1, 1,
-1.750331, 0.4397543, -0.6499757, 1, 1, 1, 1, 1,
-1.739907, 1.063052, -1.758269, 1, 1, 1, 1, 1,
-1.722351, -1.119127, -3.82282, 1, 1, 1, 1, 1,
-1.706358, -0.1937744, -1.631438, 1, 1, 1, 1, 1,
-1.705906, -0.2138042, -1.47063, 1, 1, 1, 1, 1,
-1.696843, 0.08546624, -1.406231, 1, 1, 1, 1, 1,
-1.680769, -0.9768311, -2.484983, 1, 1, 1, 1, 1,
-1.680076, -0.5252117, -4.143138, 0, 0, 1, 1, 1,
-1.67424, 0.1149125, -1.033179, 1, 0, 0, 1, 1,
-1.660574, -0.6467894, -2.209476, 1, 0, 0, 1, 1,
-1.657524, 0.3978035, -0.5514833, 1, 0, 0, 1, 1,
-1.64089, 0.9969113, -0.5265777, 1, 0, 0, 1, 1,
-1.635807, 1.591739, -1.955544, 1, 0, 0, 1, 1,
-1.631827, -0.5764163, -2.948523, 0, 0, 0, 1, 1,
-1.624746, 0.1035301, -1.776145, 0, 0, 0, 1, 1,
-1.624159, -0.2884431, -2.758283, 0, 0, 0, 1, 1,
-1.623663, -0.06971525, -2.513927, 0, 0, 0, 1, 1,
-1.613629, -1.170268, -1.63552, 0, 0, 0, 1, 1,
-1.610443, 1.997943, -1.043381, 0, 0, 0, 1, 1,
-1.601967, -0.5749785, -1.583573, 0, 0, 0, 1, 1,
-1.583746, -0.6303355, -0.8603937, 1, 1, 1, 1, 1,
-1.555409, 1.092166, 0.8641239, 1, 1, 1, 1, 1,
-1.553356, -0.3121102, -2.172298, 1, 1, 1, 1, 1,
-1.546731, -0.2697825, -2.654694, 1, 1, 1, 1, 1,
-1.544333, 0.4999397, -2.594685, 1, 1, 1, 1, 1,
-1.538346, 0.5658238, -2.102964, 1, 1, 1, 1, 1,
-1.523033, 0.2342862, -1.448544, 1, 1, 1, 1, 1,
-1.514646, 0.3495905, -0.2158015, 1, 1, 1, 1, 1,
-1.512085, -0.2416395, -0.4169496, 1, 1, 1, 1, 1,
-1.506358, 1.002817, -1.949055, 1, 1, 1, 1, 1,
-1.495056, -0.8680936, -2.493846, 1, 1, 1, 1, 1,
-1.493106, -0.3911811, -2.607097, 1, 1, 1, 1, 1,
-1.476078, 1.226135, -0.9262367, 1, 1, 1, 1, 1,
-1.450774, -1.312627, -1.474899, 1, 1, 1, 1, 1,
-1.450658, 0.4144268, -1.407974, 1, 1, 1, 1, 1,
-1.446715, 1.824605, -2.759856, 0, 0, 1, 1, 1,
-1.446072, -0.3967668, -2.008198, 1, 0, 0, 1, 1,
-1.444772, 1.451139, -0.943143, 1, 0, 0, 1, 1,
-1.429975, 0.3499866, -1.85743, 1, 0, 0, 1, 1,
-1.426085, -0.259347, -2.870228, 1, 0, 0, 1, 1,
-1.422565, 1.391286, -0.09172504, 1, 0, 0, 1, 1,
-1.421317, -0.1351723, -1.09742, 0, 0, 0, 1, 1,
-1.416772, -2.802426, -1.277431, 0, 0, 0, 1, 1,
-1.415749, 1.825733, -1.529126, 0, 0, 0, 1, 1,
-1.41327, -0.3029198, -2.284367, 0, 0, 0, 1, 1,
-1.40581, -0.5082452, -0.7428954, 0, 0, 0, 1, 1,
-1.398885, 0.1923653, -0.897418, 0, 0, 0, 1, 1,
-1.385889, 0.7650654, -0.08820501, 0, 0, 0, 1, 1,
-1.382745, 0.03509261, -3.186823, 1, 1, 1, 1, 1,
-1.370343, -0.3659637, -2.228822, 1, 1, 1, 1, 1,
-1.367229, 2.727214, -2.022902, 1, 1, 1, 1, 1,
-1.36443, 1.210296, 1.384121, 1, 1, 1, 1, 1,
-1.344876, -0.7645456, -0.5026484, 1, 1, 1, 1, 1,
-1.344622, 1.186332, 0.2265207, 1, 1, 1, 1, 1,
-1.3356, -0.8107452, -3.215302, 1, 1, 1, 1, 1,
-1.331452, 1.258959, -2.297749, 1, 1, 1, 1, 1,
-1.330681, -0.5304801, -0.9111793, 1, 1, 1, 1, 1,
-1.325878, -2.284664, -2.638984, 1, 1, 1, 1, 1,
-1.31952, 0.1041269, -1.29623, 1, 1, 1, 1, 1,
-1.303019, 0.4048869, -1.686878, 1, 1, 1, 1, 1,
-1.301301, -0.2054314, -1.510684, 1, 1, 1, 1, 1,
-1.291517, -0.3044801, -0.6576118, 1, 1, 1, 1, 1,
-1.283583, -0.6380202, -3.623764, 1, 1, 1, 1, 1,
-1.276647, -0.865231, -0.3689522, 0, 0, 1, 1, 1,
-1.269014, -0.8322912, -1.709565, 1, 0, 0, 1, 1,
-1.267197, -0.4094093, -0.4793091, 1, 0, 0, 1, 1,
-1.263996, -0.8307272, -3.483922, 1, 0, 0, 1, 1,
-1.253414, 0.2283, -1.894219, 1, 0, 0, 1, 1,
-1.250467, 0.1139292, -1.31972, 1, 0, 0, 1, 1,
-1.225676, -0.859454, -3.064237, 0, 0, 0, 1, 1,
-1.222798, -1.183916, -1.67622, 0, 0, 0, 1, 1,
-1.220052, -0.9298699, -3.021658, 0, 0, 0, 1, 1,
-1.21584, 0.06620792, -1.02464, 0, 0, 0, 1, 1,
-1.215659, 0.9162283, -0.03962213, 0, 0, 0, 1, 1,
-1.210784, -0.637718, -1.874831, 0, 0, 0, 1, 1,
-1.20727, 2.169697, -2.754302, 0, 0, 0, 1, 1,
-1.197711, -0.595976, -1.610892, 1, 1, 1, 1, 1,
-1.192473, 0.5403268, -1.307679, 1, 1, 1, 1, 1,
-1.190279, 1.715991, 0.6728867, 1, 1, 1, 1, 1,
-1.188779, -1.863551, -3.277147, 1, 1, 1, 1, 1,
-1.183891, -0.2332318, -2.18159, 1, 1, 1, 1, 1,
-1.177208, 0.603694, -1.13174, 1, 1, 1, 1, 1,
-1.164194, 1.397297, 0.3944398, 1, 1, 1, 1, 1,
-1.157353, 1.372578, -0.7857411, 1, 1, 1, 1, 1,
-1.131071, -0.4440867, -1.521306, 1, 1, 1, 1, 1,
-1.122554, 1.798337, -1.044727, 1, 1, 1, 1, 1,
-1.114885, -0.2704693, -0.2331231, 1, 1, 1, 1, 1,
-1.111246, -0.6340225, -1.618567, 1, 1, 1, 1, 1,
-1.109895, 0.08001588, -3.293088, 1, 1, 1, 1, 1,
-1.09938, -0.1650962, -2.770472, 1, 1, 1, 1, 1,
-1.095373, -0.9952568, -2.386354, 1, 1, 1, 1, 1,
-1.081941, 0.5230098, -1.875112, 0, 0, 1, 1, 1,
-1.081505, 1.657191, -1.552863, 1, 0, 0, 1, 1,
-1.076091, -1.621313, -1.053589, 1, 0, 0, 1, 1,
-1.073241, 1.278149, -0.5909666, 1, 0, 0, 1, 1,
-1.071996, -0.1858557, -0.5028338, 1, 0, 0, 1, 1,
-1.066271, 0.2320789, -2.267359, 1, 0, 0, 1, 1,
-1.063912, -0.9470879, -1.305924, 0, 0, 0, 1, 1,
-1.0611, -0.3389478, -1.646976, 0, 0, 0, 1, 1,
-1.059845, 1.260849, 0.5598451, 0, 0, 0, 1, 1,
-1.058889, 0.7664421, -1.065322, 0, 0, 0, 1, 1,
-1.050719, 0.2434001, -1.024244, 0, 0, 0, 1, 1,
-1.045536, -1.444475, -3.194007, 0, 0, 0, 1, 1,
-1.036512, 1.389152, 0.02318909, 0, 0, 0, 1, 1,
-1.031526, 0.4864722, -1.120942, 1, 1, 1, 1, 1,
-1.028882, -1.007273, -1.901857, 1, 1, 1, 1, 1,
-1.027165, -0.0285878, -3.462447, 1, 1, 1, 1, 1,
-1.012608, 0.8929846, -0.4662401, 1, 1, 1, 1, 1,
-1.012157, -1.836158, -3.283806, 1, 1, 1, 1, 1,
-1.007212, 0.767355, -1.255022, 1, 1, 1, 1, 1,
-1.00488, -0.004341355, -1.385751, 1, 1, 1, 1, 1,
-1.003435, 0.5936397, -1.142676, 1, 1, 1, 1, 1,
-1.000704, -0.04177041, -0.3115706, 1, 1, 1, 1, 1,
-0.99975, 1.305541, -0.3434893, 1, 1, 1, 1, 1,
-0.9959132, -1.398311, -1.877572, 1, 1, 1, 1, 1,
-0.988098, -0.4951607, -3.096515, 1, 1, 1, 1, 1,
-0.9855174, -0.4635987, -0.8045313, 1, 1, 1, 1, 1,
-0.975088, 0.0267071, -1.671357, 1, 1, 1, 1, 1,
-0.9674861, -0.4919115, -2.577975, 1, 1, 1, 1, 1,
-0.9661244, 0.7910298, -0.2812999, 0, 0, 1, 1, 1,
-0.9575543, 1.221592, 0.1287248, 1, 0, 0, 1, 1,
-0.9419366, -0.6393855, -2.629035, 1, 0, 0, 1, 1,
-0.9373059, 0.3262229, 0.2797703, 1, 0, 0, 1, 1,
-0.9342849, -1.550416, -1.683333, 1, 0, 0, 1, 1,
-0.9327193, 0.3194104, -2.303011, 1, 0, 0, 1, 1,
-0.926223, 0.7410831, -1.629642, 0, 0, 0, 1, 1,
-0.9162934, 0.3041494, -1.009792, 0, 0, 0, 1, 1,
-0.9108419, -0.2052623, -0.2675308, 0, 0, 0, 1, 1,
-0.9056691, 0.2471068, -3.023397, 0, 0, 0, 1, 1,
-0.8982025, 0.498069, -1.81207, 0, 0, 0, 1, 1,
-0.8968165, 1.395727, -0.8769997, 0, 0, 0, 1, 1,
-0.8930252, -0.5261999, -1.710909, 0, 0, 0, 1, 1,
-0.8895359, 1.633446, 0.6090351, 1, 1, 1, 1, 1,
-0.8832639, 1.179453, -0.6304832, 1, 1, 1, 1, 1,
-0.8786362, -1.958087, -3.4894, 1, 1, 1, 1, 1,
-0.8777498, -0.1511247, -0.6032731, 1, 1, 1, 1, 1,
-0.8754519, -0.7175182, -2.370215, 1, 1, 1, 1, 1,
-0.8740754, -2.20295, -3.614067, 1, 1, 1, 1, 1,
-0.8710337, 0.1536334, -2.034828, 1, 1, 1, 1, 1,
-0.8674785, 0.5455633, 0.3405035, 1, 1, 1, 1, 1,
-0.8665326, -0.6402724, -1.513178, 1, 1, 1, 1, 1,
-0.8609879, 0.6478062, -1.549577, 1, 1, 1, 1, 1,
-0.8583856, 1.106066, 0.06374492, 1, 1, 1, 1, 1,
-0.8581903, 2.365681, 0.3266304, 1, 1, 1, 1, 1,
-0.8542321, -0.352768, -3.145211, 1, 1, 1, 1, 1,
-0.8513702, -0.7586197, -2.735988, 1, 1, 1, 1, 1,
-0.8385906, 0.2034691, -0.04605995, 1, 1, 1, 1, 1,
-0.8335617, 0.8095483, -0.0248794, 0, 0, 1, 1, 1,
-0.8273661, -1.074057, -4.335666, 1, 0, 0, 1, 1,
-0.8218055, -0.4934421, -1.670457, 1, 0, 0, 1, 1,
-0.8168312, -0.8236619, -2.207695, 1, 0, 0, 1, 1,
-0.8120284, -0.2473004, -2.434168, 1, 0, 0, 1, 1,
-0.8118361, 0.7185109, -0.9555163, 1, 0, 0, 1, 1,
-0.8079498, -1.860527, -2.022214, 0, 0, 0, 1, 1,
-0.8060234, -0.5171339, -3.085196, 0, 0, 0, 1, 1,
-0.8030424, 0.2669753, -0.7562379, 0, 0, 0, 1, 1,
-0.7939421, -0.1694728, -2.138459, 0, 0, 0, 1, 1,
-0.7923564, -1.731061, -2.774955, 0, 0, 0, 1, 1,
-0.7847276, -0.7213897, -1.559954, 0, 0, 0, 1, 1,
-0.784312, -0.4062356, -0.5041534, 0, 0, 0, 1, 1,
-0.7682161, -0.09340144, -1.49561, 1, 1, 1, 1, 1,
-0.7603096, 2.177911, -0.6257343, 1, 1, 1, 1, 1,
-0.7594966, 0.5290223, -1.285875, 1, 1, 1, 1, 1,
-0.7580187, -0.2176533, -0.2266812, 1, 1, 1, 1, 1,
-0.7566677, -0.9738029, -3.491528, 1, 1, 1, 1, 1,
-0.747023, -0.7607898, -2.93696, 1, 1, 1, 1, 1,
-0.7452934, 0.3535025, 0.5040178, 1, 1, 1, 1, 1,
-0.7429553, -1.063623, -1.245259, 1, 1, 1, 1, 1,
-0.7389485, -1.830332, -2.336695, 1, 1, 1, 1, 1,
-0.7341165, -0.02437611, -0.5862114, 1, 1, 1, 1, 1,
-0.731628, -0.4370524, -3.679028, 1, 1, 1, 1, 1,
-0.73136, 0.9105935, -1.193824, 1, 1, 1, 1, 1,
-0.7312709, 0.104774, -1.953478, 1, 1, 1, 1, 1,
-0.7250729, -0.4902143, -1.855824, 1, 1, 1, 1, 1,
-0.7229058, 1.813066, 0.497645, 1, 1, 1, 1, 1,
-0.7221002, 0.3632758, -1.059116, 0, 0, 1, 1, 1,
-0.7209052, 0.518851, -2.066248, 1, 0, 0, 1, 1,
-0.7158957, -0.08811977, -0.11824, 1, 0, 0, 1, 1,
-0.7148513, -2.604607, -3.758142, 1, 0, 0, 1, 1,
-0.7135147, 0.01494336, -3.811953, 1, 0, 0, 1, 1,
-0.7106203, 0.985991, -1.461154, 1, 0, 0, 1, 1,
-0.7090955, -0.8557492, -1.663931, 0, 0, 0, 1, 1,
-0.7035155, 1.907205, -0.7410895, 0, 0, 0, 1, 1,
-0.7027554, -1.151381, -4.188968, 0, 0, 0, 1, 1,
-0.6964766, -0.600482, -1.35682, 0, 0, 0, 1, 1,
-0.6919356, 1.001102, 0.3131427, 0, 0, 0, 1, 1,
-0.6892717, 2.143015, -1.692958, 0, 0, 0, 1, 1,
-0.684591, -2.34163, -3.542878, 0, 0, 0, 1, 1,
-0.6828181, -0.8535434, -1.770073, 1, 1, 1, 1, 1,
-0.6730245, -0.6215707, -1.674416, 1, 1, 1, 1, 1,
-0.6667604, -1.217385, -2.351893, 1, 1, 1, 1, 1,
-0.6634482, -0.8312398, -2.68664, 1, 1, 1, 1, 1,
-0.6624869, -0.5031928, -1.496374, 1, 1, 1, 1, 1,
-0.6617562, 0.8315473, 0.3776995, 1, 1, 1, 1, 1,
-0.6594574, -0.5569465, -4.391107, 1, 1, 1, 1, 1,
-0.6569337, 0.4326208, -1.109923, 1, 1, 1, 1, 1,
-0.6567913, 0.4892981, -0.7489281, 1, 1, 1, 1, 1,
-0.6451914, 0.7308206, 0.3853491, 1, 1, 1, 1, 1,
-0.6430222, -0.9970295, -2.572229, 1, 1, 1, 1, 1,
-0.6357974, 0.1151763, -2.551776, 1, 1, 1, 1, 1,
-0.6318973, -2.687667, -4.680872, 1, 1, 1, 1, 1,
-0.6252576, -1.355843, -2.13723, 1, 1, 1, 1, 1,
-0.6246912, 1.495605, -0.6071529, 1, 1, 1, 1, 1,
-0.6242759, -0.1484647, -0.5309435, 0, 0, 1, 1, 1,
-0.6206471, 0.8582454, 0.1226984, 1, 0, 0, 1, 1,
-0.6167862, 0.1932572, -1.974721, 1, 0, 0, 1, 1,
-0.614856, -0.9270788, -2.485372, 1, 0, 0, 1, 1,
-0.6102884, -0.04710134, -1.147154, 1, 0, 0, 1, 1,
-0.6052378, 0.08390364, -3.950451, 1, 0, 0, 1, 1,
-0.604287, -0.4215592, -1.543514, 0, 0, 0, 1, 1,
-0.6036667, 1.112542, 1.340082, 0, 0, 0, 1, 1,
-0.6002128, -0.8215631, -1.593071, 0, 0, 0, 1, 1,
-0.593832, -2.096982, -3.850841, 0, 0, 0, 1, 1,
-0.5889183, 0.06504643, -3.363096, 0, 0, 0, 1, 1,
-0.5843834, 2.268, -0.6028194, 0, 0, 0, 1, 1,
-0.5815098, -0.7239638, -4.395924, 0, 0, 0, 1, 1,
-0.5778882, 0.6703058, -2.587388, 1, 1, 1, 1, 1,
-0.5768891, 0.239288, -1.543088, 1, 1, 1, 1, 1,
-0.5753148, -1.463111, -2.209445, 1, 1, 1, 1, 1,
-0.5723606, -0.8444769, -2.45263, 1, 1, 1, 1, 1,
-0.5709416, -0.5619869, -1.174556, 1, 1, 1, 1, 1,
-0.5659525, -0.9112873, -3.429425, 1, 1, 1, 1, 1,
-0.562485, 0.344398, 0.9255428, 1, 1, 1, 1, 1,
-0.5622849, 1.758554, 1.119691, 1, 1, 1, 1, 1,
-0.556744, -1.068754, -3.161475, 1, 1, 1, 1, 1,
-0.553718, -0.6713001, -0.9064835, 1, 1, 1, 1, 1,
-0.5509089, -1.045539, -3.551718, 1, 1, 1, 1, 1,
-0.550022, -0.6670846, -1.979486, 1, 1, 1, 1, 1,
-0.5473066, -0.8790386, -2.568693, 1, 1, 1, 1, 1,
-0.5397472, 0.004348515, -0.3652072, 1, 1, 1, 1, 1,
-0.5387506, 0.2222089, -1.946132, 1, 1, 1, 1, 1,
-0.5368978, 0.3193019, -2.877944, 0, 0, 1, 1, 1,
-0.5366153, 0.8146708, -1.368883, 1, 0, 0, 1, 1,
-0.5363359, 0.04533794, -1.658721, 1, 0, 0, 1, 1,
-0.5281696, -1.68755, -2.55103, 1, 0, 0, 1, 1,
-0.5281377, 0.4006836, 0.6923575, 1, 0, 0, 1, 1,
-0.5191985, 0.02520436, -3.503592, 1, 0, 0, 1, 1,
-0.5180868, 0.4232106, -1.053634, 0, 0, 0, 1, 1,
-0.5155826, 0.06308267, -1.19603, 0, 0, 0, 1, 1,
-0.5119225, 0.8967135, -0.2887573, 0, 0, 0, 1, 1,
-0.5035724, -1.310803, -3.450076, 0, 0, 0, 1, 1,
-0.5029262, -0.5604261, -2.030233, 0, 0, 0, 1, 1,
-0.5005379, 1.219109, 1.06556, 0, 0, 0, 1, 1,
-0.4980396, -0.2720005, -2.212639, 0, 0, 0, 1, 1,
-0.4952366, 1.551619, -0.5283107, 1, 1, 1, 1, 1,
-0.4905539, -0.3353568, -2.384788, 1, 1, 1, 1, 1,
-0.4878337, 0.07433821, -3.660269, 1, 1, 1, 1, 1,
-0.4854166, -1.231707, -2.764222, 1, 1, 1, 1, 1,
-0.4840599, -0.6083245, -0.5912653, 1, 1, 1, 1, 1,
-0.4752808, -2.021593, -2.568275, 1, 1, 1, 1, 1,
-0.4736493, 0.3249995, -1.240553, 1, 1, 1, 1, 1,
-0.4699145, -1.304557, -1.212656, 1, 1, 1, 1, 1,
-0.4591057, -1.134956, -3.852388, 1, 1, 1, 1, 1,
-0.4547047, 0.01149112, -0.9788726, 1, 1, 1, 1, 1,
-0.4527075, 0.4887307, -0.1117523, 1, 1, 1, 1, 1,
-0.4521551, -0.9271601, -4.054851, 1, 1, 1, 1, 1,
-0.447474, -0.7613806, -2.412693, 1, 1, 1, 1, 1,
-0.4463545, -1.162442, -2.479178, 1, 1, 1, 1, 1,
-0.4370008, -0.2853567, -3.373119, 1, 1, 1, 1, 1,
-0.4365758, -0.1494249, -2.323625, 0, 0, 1, 1, 1,
-0.4361583, 0.689358, 0.6537806, 1, 0, 0, 1, 1,
-0.4343027, -0.383237, -2.010807, 1, 0, 0, 1, 1,
-0.4342873, 0.4191493, 0.9699579, 1, 0, 0, 1, 1,
-0.4324572, 0.2377549, -1.589704, 1, 0, 0, 1, 1,
-0.4304507, 0.6682501, 0.7945912, 1, 0, 0, 1, 1,
-0.4245281, 0.5121948, -1.916862, 0, 0, 0, 1, 1,
-0.4215675, 2.123967, -0.3168565, 0, 0, 0, 1, 1,
-0.4210021, 0.2162681, -1.872668, 0, 0, 0, 1, 1,
-0.4181499, 1.301995, 0.5208588, 0, 0, 0, 1, 1,
-0.4169253, -0.9762584, -2.826684, 0, 0, 0, 1, 1,
-0.4159731, -0.6667385, -2.0568, 0, 0, 0, 1, 1,
-0.4111568, 1.096386, 1.859819, 0, 0, 0, 1, 1,
-0.4103543, 1.020238, 0.09166077, 1, 1, 1, 1, 1,
-0.4101363, 0.1043562, -0.6426721, 1, 1, 1, 1, 1,
-0.4043553, -0.4026918, -3.224499, 1, 1, 1, 1, 1,
-0.4038143, 1.0363, 1.877193, 1, 1, 1, 1, 1,
-0.4037806, -1.579081, -3.56685, 1, 1, 1, 1, 1,
-0.4021102, -0.7520831, -2.355068, 1, 1, 1, 1, 1,
-0.402087, -2.055689, -1.567755, 1, 1, 1, 1, 1,
-0.3996445, 0.6308211, -1.134096, 1, 1, 1, 1, 1,
-0.3986818, 0.9466819, -0.9902312, 1, 1, 1, 1, 1,
-0.3978018, -2.060925, -3.850929, 1, 1, 1, 1, 1,
-0.3929608, -0.5393052, -2.313042, 1, 1, 1, 1, 1,
-0.3902142, 1.561386, -2.872814, 1, 1, 1, 1, 1,
-0.384167, 0.03714567, -2.453019, 1, 1, 1, 1, 1,
-0.3831027, 0.5701534, -1.468478, 1, 1, 1, 1, 1,
-0.3802373, 1.570781, -1.694394, 1, 1, 1, 1, 1,
-0.3782804, 0.9760576, -1.068152, 0, 0, 1, 1, 1,
-0.3779683, -2.048911, -1.879893, 1, 0, 0, 1, 1,
-0.3716583, -0.1646526, -2.258514, 1, 0, 0, 1, 1,
-0.3713567, -0.7820886, -3.295682, 1, 0, 0, 1, 1,
-0.3690265, 1.576694, 0.6520653, 1, 0, 0, 1, 1,
-0.3666707, -0.943514, -2.709444, 1, 0, 0, 1, 1,
-0.366526, 1.07566, -0.7756841, 0, 0, 0, 1, 1,
-0.364765, 0.8047511, 0.04396323, 0, 0, 0, 1, 1,
-0.3629896, -0.2824975, -1.401992, 0, 0, 0, 1, 1,
-0.362964, 1.04988, -1.323696, 0, 0, 0, 1, 1,
-0.3612434, -0.242494, -1.410331, 0, 0, 0, 1, 1,
-0.3590046, 0.8534321, 1.390294, 0, 0, 0, 1, 1,
-0.3577619, -0.8253846, -3.177416, 0, 0, 0, 1, 1,
-0.3561251, 1.927218, -1.399586, 1, 1, 1, 1, 1,
-0.3490422, -0.1370077, -1.527371, 1, 1, 1, 1, 1,
-0.348592, -0.4321973, -1.195281, 1, 1, 1, 1, 1,
-0.3478214, -0.4516424, -1.866535, 1, 1, 1, 1, 1,
-0.347342, 0.281092, -0.1381337, 1, 1, 1, 1, 1,
-0.3459535, -1.476224, -2.532034, 1, 1, 1, 1, 1,
-0.3444621, -0.9909114, -0.8510767, 1, 1, 1, 1, 1,
-0.3429009, -1.550091, -3.257391, 1, 1, 1, 1, 1,
-0.3423998, 0.3555338, -0.8256763, 1, 1, 1, 1, 1,
-0.3400771, 0.9925854, -1.778208, 1, 1, 1, 1, 1,
-0.3375527, -1.552269, -3.738615, 1, 1, 1, 1, 1,
-0.3359738, 0.2476645, -2.296747, 1, 1, 1, 1, 1,
-0.3352266, 0.5301733, -0.7713504, 1, 1, 1, 1, 1,
-0.3246462, -1.342234, -4.580842, 1, 1, 1, 1, 1,
-0.3239143, 0.8933342, 0.6278123, 1, 1, 1, 1, 1,
-0.3212138, -0.8097219, -3.846721, 0, 0, 1, 1, 1,
-0.3202362, 0.2442406, 0.06532992, 1, 0, 0, 1, 1,
-0.3194204, 0.7159103, -0.02553457, 1, 0, 0, 1, 1,
-0.3193279, 0.07461473, -1.395141, 1, 0, 0, 1, 1,
-0.3163546, 1.373972, -0.5079453, 1, 0, 0, 1, 1,
-0.3144954, -0.5568908, -3.356489, 1, 0, 0, 1, 1,
-0.3140641, 0.2905173, -1.75125, 0, 0, 0, 1, 1,
-0.3134928, 1.373816, 0.5074338, 0, 0, 0, 1, 1,
-0.3110332, 0.9824925, 1.156615, 0, 0, 0, 1, 1,
-0.3099169, -1.177347, -3.273634, 0, 0, 0, 1, 1,
-0.3096677, -0.4866266, -2.38594, 0, 0, 0, 1, 1,
-0.3019016, -0.1297512, -3.063658, 0, 0, 0, 1, 1,
-0.2994335, 0.3017427, -0.8342779, 0, 0, 0, 1, 1,
-0.2985163, 0.7195427, -0.05026236, 1, 1, 1, 1, 1,
-0.296946, 1.861011, 0.2834322, 1, 1, 1, 1, 1,
-0.2952497, -1.714063, -2.052756, 1, 1, 1, 1, 1,
-0.2950218, 1.138087, -0.2288029, 1, 1, 1, 1, 1,
-0.2933815, -1.271035, -3.10839, 1, 1, 1, 1, 1,
-0.2901766, -1.169209, -1.111912, 1, 1, 1, 1, 1,
-0.2897534, 0.2792137, 0.2425336, 1, 1, 1, 1, 1,
-0.2892729, 0.3106464, 1.038682, 1, 1, 1, 1, 1,
-0.2878754, 0.6189924, -0.7689951, 1, 1, 1, 1, 1,
-0.2869159, 0.8399935, -0.4624665, 1, 1, 1, 1, 1,
-0.2864084, 2.770231, -0.7395581, 1, 1, 1, 1, 1,
-0.2831642, -0.1142548, -2.192346, 1, 1, 1, 1, 1,
-0.2820688, 0.4237752, -0.3939049, 1, 1, 1, 1, 1,
-0.2775058, -0.7489746, -3.88216, 1, 1, 1, 1, 1,
-0.2757849, 1.375064, -1.710499, 1, 1, 1, 1, 1,
-0.271534, 0.8814694, -1.403438, 0, 0, 1, 1, 1,
-0.2697054, 1.548056, 0.1753324, 1, 0, 0, 1, 1,
-0.267448, 0.2536111, -2.537213, 1, 0, 0, 1, 1,
-0.2660923, -1.71611, -3.273915, 1, 0, 0, 1, 1,
-0.2626307, -0.01771347, -1.270773, 1, 0, 0, 1, 1,
-0.2601727, -0.841374, -1.874192, 1, 0, 0, 1, 1,
-0.2593212, 0.09687778, 0.01561914, 0, 0, 0, 1, 1,
-0.2579083, -2.690585, -3.439929, 0, 0, 0, 1, 1,
-0.256892, -1.549661, -2.639434, 0, 0, 0, 1, 1,
-0.25573, -0.6860439, -4.368554, 0, 0, 0, 1, 1,
-0.2498927, -1.267609, -1.41718, 0, 0, 0, 1, 1,
-0.2452358, 0.6464235, -0.3082807, 0, 0, 0, 1, 1,
-0.2445074, -1.036241, -2.256271, 0, 0, 0, 1, 1,
-0.2416935, -0.353384, -1.301923, 1, 1, 1, 1, 1,
-0.2414592, 0.05193676, -0.7509659, 1, 1, 1, 1, 1,
-0.239445, -0.389272, -0.701043, 1, 1, 1, 1, 1,
-0.2357789, -0.02786013, -2.129974, 1, 1, 1, 1, 1,
-0.2352238, 0.8328918, 1.392759, 1, 1, 1, 1, 1,
-0.2333169, 0.4566201, -0.6159731, 1, 1, 1, 1, 1,
-0.2323207, 1.61824, -0.7278516, 1, 1, 1, 1, 1,
-0.2257756, 0.8257608, -1.09404, 1, 1, 1, 1, 1,
-0.224528, 1.634844, 0.7093825, 1, 1, 1, 1, 1,
-0.2235074, -0.5577276, -2.872827, 1, 1, 1, 1, 1,
-0.2225543, 0.6282681, 0.1892871, 1, 1, 1, 1, 1,
-0.2191584, 0.8798624, 0.1737129, 1, 1, 1, 1, 1,
-0.2178581, -1.155235, -3.204639, 1, 1, 1, 1, 1,
-0.2171788, -1.276095, -3.022047, 1, 1, 1, 1, 1,
-0.2168821, -0.5447341, -1.242723, 1, 1, 1, 1, 1,
-0.2156305, 1.436483, 0.5645208, 0, 0, 1, 1, 1,
-0.2150643, 1.58355, -0.2532014, 1, 0, 0, 1, 1,
-0.2147134, 0.004994332, -0.4881892, 1, 0, 0, 1, 1,
-0.2126192, -0.09364468, -2.100726, 1, 0, 0, 1, 1,
-0.210475, -0.07336106, -1.127408, 1, 0, 0, 1, 1,
-0.2045635, -0.2435515, -1.931893, 1, 0, 0, 1, 1,
-0.2027971, 0.2355049, -0.8519958, 0, 0, 0, 1, 1,
-0.1879003, -2.875147, -1.905099, 0, 0, 0, 1, 1,
-0.180864, -0.267092, -2.556476, 0, 0, 0, 1, 1,
-0.1800147, 0.05618684, -1.566804, 0, 0, 0, 1, 1,
-0.175503, 0.4918591, 2.016589, 0, 0, 0, 1, 1,
-0.1743626, 1.145228, -0.9519559, 0, 0, 0, 1, 1,
-0.1727304, -2.041241, -3.255711, 0, 0, 0, 1, 1,
-0.1717709, -1.607097, -3.107017, 1, 1, 1, 1, 1,
-0.16622, 1.819944, 0.5856232, 1, 1, 1, 1, 1,
-0.1661168, -0.1760828, -1.583254, 1, 1, 1, 1, 1,
-0.1638489, 0.8075948, 0.3689504, 1, 1, 1, 1, 1,
-0.1619542, -0.7110192, -3.719508, 1, 1, 1, 1, 1,
-0.1615487, -1.935107, -1.959259, 1, 1, 1, 1, 1,
-0.1615065, 1.352025, -1.262369, 1, 1, 1, 1, 1,
-0.1590901, 0.168296, -0.7956176, 1, 1, 1, 1, 1,
-0.1587612, -1.07683, -3.242673, 1, 1, 1, 1, 1,
-0.1542421, -1.114466, -3.860914, 1, 1, 1, 1, 1,
-0.1501113, -0.7826737, -1.918643, 1, 1, 1, 1, 1,
-0.1500739, -0.8997883, -2.946986, 1, 1, 1, 1, 1,
-0.1493775, -0.5688543, -3.572121, 1, 1, 1, 1, 1,
-0.1460679, -2.606011, -1.480831, 1, 1, 1, 1, 1,
-0.1452016, -0.6389063, -3.21005, 1, 1, 1, 1, 1,
-0.1444673, 1.123971, 0.6963621, 0, 0, 1, 1, 1,
-0.1436888, -0.5528917, -3.711958, 1, 0, 0, 1, 1,
-0.1425744, 0.2305811, -2.102247, 1, 0, 0, 1, 1,
-0.1391267, 1.640388, -1.073229, 1, 0, 0, 1, 1,
-0.135453, 1.375496, -1.166778, 1, 0, 0, 1, 1,
-0.1343101, 0.3795872, -1.374931, 1, 0, 0, 1, 1,
-0.1327876, -1.121248, -2.948509, 0, 0, 0, 1, 1,
-0.128207, -1.931448, -4.737867, 0, 0, 0, 1, 1,
-0.1259522, 0.7367597, -0.5119832, 0, 0, 0, 1, 1,
-0.123352, -0.008141539, -2.298892, 0, 0, 0, 1, 1,
-0.1213538, 0.6829196, 0.5207082, 0, 0, 0, 1, 1,
-0.1164533, 2.337758, 0.375237, 0, 0, 0, 1, 1,
-0.1141317, 1.37878, 0.01952025, 0, 0, 0, 1, 1,
-0.1100467, 0.6431436, 0.132523, 1, 1, 1, 1, 1,
-0.1067437, -1.300152, -2.3556, 1, 1, 1, 1, 1,
-0.1057799, -1.34137, -3.945125, 1, 1, 1, 1, 1,
-0.1054997, 1.826929, -1.005814, 1, 1, 1, 1, 1,
-0.1035413, 0.1361165, -1.916727, 1, 1, 1, 1, 1,
-0.1031303, 0.7325921, 0.8693901, 1, 1, 1, 1, 1,
-0.1029387, 0.6350883, 0.4358828, 1, 1, 1, 1, 1,
-0.1019062, -0.2594705, -2.395955, 1, 1, 1, 1, 1,
-0.1007811, 0.8675365, 0.6444699, 1, 1, 1, 1, 1,
-0.0976205, -1.754871, -2.246686, 1, 1, 1, 1, 1,
-0.08880815, -0.4680215, -1.980835, 1, 1, 1, 1, 1,
-0.08834828, 1.312081, -1.23122, 1, 1, 1, 1, 1,
-0.08749974, 0.3695163, -2.363185, 1, 1, 1, 1, 1,
-0.0870503, -0.4939691, -3.58092, 1, 1, 1, 1, 1,
-0.08318456, -1.178522, -4.387644, 1, 1, 1, 1, 1,
-0.08219849, -0.9436663, -2.618202, 0, 0, 1, 1, 1,
-0.07737418, 0.03705396, 0.04063189, 1, 0, 0, 1, 1,
-0.07415099, 0.2306647, -2.138706, 1, 0, 0, 1, 1,
-0.06901429, -0.3074605, -1.99745, 1, 0, 0, 1, 1,
-0.06742989, -1.854527, -2.385867, 1, 0, 0, 1, 1,
-0.06417123, 0.3796912, -0.5463665, 1, 0, 0, 1, 1,
-0.06183762, -1.544119, -3.012143, 0, 0, 0, 1, 1,
-0.06079685, -1.012339, -3.043909, 0, 0, 0, 1, 1,
-0.05414981, 0.2527984, 0.08693456, 0, 0, 0, 1, 1,
-0.05399749, 0.2583224, -0.9484453, 0, 0, 0, 1, 1,
-0.0523164, 0.790903, 0.7753535, 0, 0, 0, 1, 1,
-0.05155686, 0.4981927, 1.005395, 0, 0, 0, 1, 1,
-0.05084219, -0.6980662, -1.229316, 0, 0, 0, 1, 1,
-0.04037746, 1.355884, -1.078234, 1, 1, 1, 1, 1,
-0.0363836, 0.3737253, 0.8358786, 1, 1, 1, 1, 1,
-0.03321141, -0.7883293, -1.69421, 1, 1, 1, 1, 1,
-0.0331067, -0.5647345, -2.804901, 1, 1, 1, 1, 1,
-0.02518829, 0.9715957, 1.110131, 1, 1, 1, 1, 1,
-0.01559422, -0.2743729, -3.659304, 1, 1, 1, 1, 1,
-0.01467909, 0.3242764, -0.3985615, 1, 1, 1, 1, 1,
-0.01365676, 0.6843899, 1.510626, 1, 1, 1, 1, 1,
-0.01107238, -0.5661457, -2.122164, 1, 1, 1, 1, 1,
-0.01024806, -0.01738038, -3.011598, 1, 1, 1, 1, 1,
-0.004880527, -0.2136281, -3.958616, 1, 1, 1, 1, 1,
-0.002105188, -1.087653, -4.317213, 1, 1, 1, 1, 1,
0.005977334, 0.789845, 0.3627853, 1, 1, 1, 1, 1,
0.007215623, -0.6353517, 2.936993, 1, 1, 1, 1, 1,
0.009120453, 0.7403283, -0.3236246, 1, 1, 1, 1, 1,
0.009455094, 1.84361, -1.206029, 0, 0, 1, 1, 1,
0.01003978, 0.6820446, 0.06751648, 1, 0, 0, 1, 1,
0.01245515, -0.0423286, 2.262166, 1, 0, 0, 1, 1,
0.01266635, 1.272195, 1.314507, 1, 0, 0, 1, 1,
0.01333017, -0.6699985, 2.941262, 1, 0, 0, 1, 1,
0.01663259, 0.7154323, 0.2392506, 1, 0, 0, 1, 1,
0.0203475, 0.509778, -0.150836, 0, 0, 0, 1, 1,
0.02228689, 1.890217, -0.9049879, 0, 0, 0, 1, 1,
0.02238756, 0.2333814, 0.7042944, 0, 0, 0, 1, 1,
0.02460302, 0.487772, 2.295048, 0, 0, 0, 1, 1,
0.02618365, 1.189184, 0.1454628, 0, 0, 0, 1, 1,
0.02740163, 0.04608732, 2.261405, 0, 0, 0, 1, 1,
0.02770243, 1.493525, 1.583883, 0, 0, 0, 1, 1,
0.02844714, 0.246473, 0.4054998, 1, 1, 1, 1, 1,
0.02917017, -0.753239, 4.691164, 1, 1, 1, 1, 1,
0.03250817, -0.205734, 3.502498, 1, 1, 1, 1, 1,
0.03325793, 0.09797965, 3.024263, 1, 1, 1, 1, 1,
0.03363841, -0.4901569, 3.509078, 1, 1, 1, 1, 1,
0.04095921, 0.1874643, 0.6281528, 1, 1, 1, 1, 1,
0.04288456, -1.339876, 3.019875, 1, 1, 1, 1, 1,
0.04573369, 1.400471, 1.291449, 1, 1, 1, 1, 1,
0.0477167, -0.1369269, 2.070621, 1, 1, 1, 1, 1,
0.04803145, 0.1984146, 0.7213498, 1, 1, 1, 1, 1,
0.04872853, 1.146966, -0.3582823, 1, 1, 1, 1, 1,
0.05020455, -1.798233, 2.337515, 1, 1, 1, 1, 1,
0.05729775, 0.6530445, 0.3872622, 1, 1, 1, 1, 1,
0.05812107, 0.050591, -0.2344131, 1, 1, 1, 1, 1,
0.05935916, -3.223093, 2.622535, 1, 1, 1, 1, 1,
0.06190173, 0.4630054, 1.753668, 0, 0, 1, 1, 1,
0.06593044, 1.884364, -0.09267049, 1, 0, 0, 1, 1,
0.06844311, -0.3267595, 2.673083, 1, 0, 0, 1, 1,
0.07182156, 0.4834299, 0.2256615, 1, 0, 0, 1, 1,
0.07221936, 0.8032134, 0.5106519, 1, 0, 0, 1, 1,
0.07307405, 0.8981816, -0.3896633, 1, 0, 0, 1, 1,
0.07486099, -0.1541178, 2.475017, 0, 0, 0, 1, 1,
0.07678031, 1.003397, 0.9329287, 0, 0, 0, 1, 1,
0.07810505, 1.071608, -1.295566, 0, 0, 0, 1, 1,
0.07860748, 0.1618978, -0.5159475, 0, 0, 0, 1, 1,
0.07875343, -2.201164, 4.320524, 0, 0, 0, 1, 1,
0.08332241, 0.9283403, 0.2927538, 0, 0, 0, 1, 1,
0.08744455, -0.3719183, 0.4844683, 0, 0, 0, 1, 1,
0.09196226, -0.4030252, 2.848262, 1, 1, 1, 1, 1,
0.0966813, -0.41996, 2.311887, 1, 1, 1, 1, 1,
0.1010574, 1.024711, 0.001157366, 1, 1, 1, 1, 1,
0.1016515, 1.454872, 0.3011456, 1, 1, 1, 1, 1,
0.107874, 0.02966587, 2.173552, 1, 1, 1, 1, 1,
0.1081646, -1.234164, 2.304004, 1, 1, 1, 1, 1,
0.1085739, -0.5805612, 3.815587, 1, 1, 1, 1, 1,
0.1118136, -0.9392604, 4.405715, 1, 1, 1, 1, 1,
0.1129672, -0.5560743, 3.462808, 1, 1, 1, 1, 1,
0.1149782, -0.2246937, 2.026489, 1, 1, 1, 1, 1,
0.1163305, -0.1975088, 1.029498, 1, 1, 1, 1, 1,
0.1172419, 0.7854255, -0.4111097, 1, 1, 1, 1, 1,
0.1180684, 0.9390247, -1.053598, 1, 1, 1, 1, 1,
0.118154, -0.1099015, 1.244588, 1, 1, 1, 1, 1,
0.1197934, -0.4740867, 2.520361, 1, 1, 1, 1, 1,
0.1229486, 0.1660528, -1.619595, 0, 0, 1, 1, 1,
0.1246846, 0.1376706, -0.3479667, 1, 0, 0, 1, 1,
0.1290884, -1.119681, 2.930879, 1, 0, 0, 1, 1,
0.129599, -0.1908125, 2.857098, 1, 0, 0, 1, 1,
0.1357736, -0.1042454, 1.242458, 1, 0, 0, 1, 1,
0.1390142, 1.140767, -1.294506, 1, 0, 0, 1, 1,
0.1395799, -0.3756011, 2.734304, 0, 0, 0, 1, 1,
0.1424701, 1.16565, 1.706621, 0, 0, 0, 1, 1,
0.1576754, 1.033581, 0.2337124, 0, 0, 0, 1, 1,
0.160421, 1.383381, -0.07514884, 0, 0, 0, 1, 1,
0.1608974, -1.083811, 1.773116, 0, 0, 0, 1, 1,
0.1615362, 2.951662, 2.305822, 0, 0, 0, 1, 1,
0.1651656, 1.640403, -0.8308346, 0, 0, 0, 1, 1,
0.1664344, -0.6031753, 3.853511, 1, 1, 1, 1, 1,
0.1670246, -0.6276088, 2.966567, 1, 1, 1, 1, 1,
0.1674203, -0.1045916, 0.7961329, 1, 1, 1, 1, 1,
0.1687768, 1.686394, 0.6407698, 1, 1, 1, 1, 1,
0.1699713, -0.5866137, 2.581414, 1, 1, 1, 1, 1,
0.1734353, 1.11529, 1.393004, 1, 1, 1, 1, 1,
0.1773286, 1.848191, -1.258573, 1, 1, 1, 1, 1,
0.1803846, -0.6207736, 4.753287, 1, 1, 1, 1, 1,
0.1824174, 0.9466509, 0.675683, 1, 1, 1, 1, 1,
0.1891439, 0.7646991, 0.693514, 1, 1, 1, 1, 1,
0.1917996, -0.7176477, 0.5965222, 1, 1, 1, 1, 1,
0.1924389, -1.590602, 2.474166, 1, 1, 1, 1, 1,
0.1949697, -0.4450894, 1.057393, 1, 1, 1, 1, 1,
0.1949798, -0.9536931, 3.107892, 1, 1, 1, 1, 1,
0.2043024, -1.544442, 3.268369, 1, 1, 1, 1, 1,
0.2062788, 1.971439, -0.5034134, 0, 0, 1, 1, 1,
0.2080954, 1.536521, -0.6657541, 1, 0, 0, 1, 1,
0.210658, 0.2402771, -0.5525885, 1, 0, 0, 1, 1,
0.2240859, 2.340667, 1.298226, 1, 0, 0, 1, 1,
0.2260947, 0.8663779, -1.141074, 1, 0, 0, 1, 1,
0.2262476, 0.2345335, 1.425581, 1, 0, 0, 1, 1,
0.2278481, -0.02284791, 1.329647, 0, 0, 0, 1, 1,
0.2278651, -0.4266299, 2.3338, 0, 0, 0, 1, 1,
0.2290822, 0.1691896, -0.7665103, 0, 0, 0, 1, 1,
0.2306867, 0.9362792, -0.4160266, 0, 0, 0, 1, 1,
0.231076, 0.649326, 0.8972664, 0, 0, 0, 1, 1,
0.2314828, 0.4276133, -0.3863736, 0, 0, 0, 1, 1,
0.2330099, 0.69733, 0.7616524, 0, 0, 0, 1, 1,
0.2337553, 0.7211468, -0.5130138, 1, 1, 1, 1, 1,
0.2338554, -1.263839, 1.767483, 1, 1, 1, 1, 1,
0.2405646, -0.9004775, 3.663203, 1, 1, 1, 1, 1,
0.2462379, 0.296962, 0.9102452, 1, 1, 1, 1, 1,
0.248022, 0.09300001, 1.88019, 1, 1, 1, 1, 1,
0.2482289, -0.1679838, 3.780261, 1, 1, 1, 1, 1,
0.2489972, -0.06912857, 2.644816, 1, 1, 1, 1, 1,
0.2492657, -0.4248455, 3.140356, 1, 1, 1, 1, 1,
0.2510461, 0.7606132, -0.1130329, 1, 1, 1, 1, 1,
0.2523925, -0.9960228, 2.758053, 1, 1, 1, 1, 1,
0.253237, -0.611224, 2.569375, 1, 1, 1, 1, 1,
0.2550363, -0.7115517, 2.090246, 1, 1, 1, 1, 1,
0.2564421, -0.1172139, 0.8431456, 1, 1, 1, 1, 1,
0.2578387, -0.9289322, 3.520728, 1, 1, 1, 1, 1,
0.2581003, -0.2590361, 2.06669, 1, 1, 1, 1, 1,
0.2588832, -0.4989615, 2.278189, 0, 0, 1, 1, 1,
0.2589383, 0.07384741, 0.4106573, 1, 0, 0, 1, 1,
0.2610475, 0.696597, 0.4701151, 1, 0, 0, 1, 1,
0.2634583, 0.7188514, 1.0251, 1, 0, 0, 1, 1,
0.2640192, 1.046876, -0.3027838, 1, 0, 0, 1, 1,
0.2720306, -0.3758039, 3.20223, 1, 0, 0, 1, 1,
0.2762374, -0.4084702, 2.804179, 0, 0, 0, 1, 1,
0.2788564, -0.3899035, 1.979669, 0, 0, 0, 1, 1,
0.2802538, -0.7113271, 3.945874, 0, 0, 0, 1, 1,
0.2808138, 1.926288, 1.543604, 0, 0, 0, 1, 1,
0.2833118, -0.125392, 2.037852, 0, 0, 0, 1, 1,
0.2837483, -1.517266, 2.653965, 0, 0, 0, 1, 1,
0.2842494, -1.816764, 1.053473, 0, 0, 0, 1, 1,
0.2846836, -1.176889, 4.724497, 1, 1, 1, 1, 1,
0.2847213, 1.72921, 1.08305, 1, 1, 1, 1, 1,
0.2885049, -1.554989, 4.445575, 1, 1, 1, 1, 1,
0.2891713, -0.8633618, 4.105039, 1, 1, 1, 1, 1,
0.2904218, -0.2568395, 0.2557679, 1, 1, 1, 1, 1,
0.2909516, 0.7057952, 0.8554431, 1, 1, 1, 1, 1,
0.2915693, 1.485921, 0.2170464, 1, 1, 1, 1, 1,
0.2930577, 0.4612295, 1.522038, 1, 1, 1, 1, 1,
0.2931557, -0.1610987, 2.470098, 1, 1, 1, 1, 1,
0.29337, -0.4642391, 1.599432, 1, 1, 1, 1, 1,
0.301882, -0.02193782, 2.212635, 1, 1, 1, 1, 1,
0.3023187, 0.4129069, 1.851281, 1, 1, 1, 1, 1,
0.3030219, 0.1126749, 2.108263, 1, 1, 1, 1, 1,
0.305875, -1.009305, 1.807587, 1, 1, 1, 1, 1,
0.3061337, 0.8828937, 1.265296, 1, 1, 1, 1, 1,
0.3074967, -1.019935, 4.200177, 0, 0, 1, 1, 1,
0.3139112, -2.187182, 3.57346, 1, 0, 0, 1, 1,
0.3161018, -0.7656677, 3.214158, 1, 0, 0, 1, 1,
0.3200465, 0.2574595, 0.338026, 1, 0, 0, 1, 1,
0.3204227, -1.707843, 2.621409, 1, 0, 0, 1, 1,
0.3212642, 1.128131, 0.9730293, 1, 0, 0, 1, 1,
0.3215404, -0.5839547, 1.709571, 0, 0, 0, 1, 1,
0.3262382, 0.7250351, 0.7053677, 0, 0, 0, 1, 1,
0.3282694, -0.6675714, 3.315362, 0, 0, 0, 1, 1,
0.3301398, -1.053867, 4.148652, 0, 0, 0, 1, 1,
0.3346992, -2.169827, 3.208663, 0, 0, 0, 1, 1,
0.3359076, -0.3162783, 2.328547, 0, 0, 0, 1, 1,
0.3385122, 0.142141, 1.346543, 0, 0, 0, 1, 1,
0.3408369, -0.5236805, 2.729549, 1, 1, 1, 1, 1,
0.343942, -0.605961, 1.892344, 1, 1, 1, 1, 1,
0.3453848, 1.08282, 0.1244842, 1, 1, 1, 1, 1,
0.3461248, -0.6047195, 2.002049, 1, 1, 1, 1, 1,
0.3484237, 2.210363, -0.797241, 1, 1, 1, 1, 1,
0.3521613, 1.957209, 1.201398, 1, 1, 1, 1, 1,
0.3526137, 1.188389, -1.387693, 1, 1, 1, 1, 1,
0.3540666, -0.7080334, 1.594529, 1, 1, 1, 1, 1,
0.3555147, -0.2971369, 1.535823, 1, 1, 1, 1, 1,
0.3605765, -0.1416828, 1.570971, 1, 1, 1, 1, 1,
0.3611648, -1.128947, 3.917776, 1, 1, 1, 1, 1,
0.3652426, 0.2187791, 2.327135, 1, 1, 1, 1, 1,
0.3653554, -0.3299907, 1.298356, 1, 1, 1, 1, 1,
0.3733373, 0.1665396, 2.066402, 1, 1, 1, 1, 1,
0.3756562, 0.9613404, -0.5930665, 1, 1, 1, 1, 1,
0.375749, -0.9685079, 3.199842, 0, 0, 1, 1, 1,
0.3780411, 0.1734886, 1.688524, 1, 0, 0, 1, 1,
0.3793488, -0.8141401, 2.463221, 1, 0, 0, 1, 1,
0.3815913, -2.397068, 2.530402, 1, 0, 0, 1, 1,
0.3837913, -0.6652377, 2.982995, 1, 0, 0, 1, 1,
0.3856837, 0.8243917, 1.428595, 1, 0, 0, 1, 1,
0.3877237, -0.03096635, 1.85058, 0, 0, 0, 1, 1,
0.3916225, 1.89036, 0.876482, 0, 0, 0, 1, 1,
0.3928346, -0.1816744, 2.397368, 0, 0, 0, 1, 1,
0.3932345, 0.3864094, 1.105559, 0, 0, 0, 1, 1,
0.4021568, -0.7031685, 2.451821, 0, 0, 0, 1, 1,
0.4056703, -0.8711705, 3.967719, 0, 0, 0, 1, 1,
0.4073188, -1.381124, 1.862455, 0, 0, 0, 1, 1,
0.4088269, 0.6647082, -1.371706, 1, 1, 1, 1, 1,
0.409221, -0.811968, 1.803959, 1, 1, 1, 1, 1,
0.4125469, 1.004373, 0.2033738, 1, 1, 1, 1, 1,
0.419382, -1.361766, 3.107409, 1, 1, 1, 1, 1,
0.4200306, -0.6641809, 2.077041, 1, 1, 1, 1, 1,
0.4206105, 1.864237, -0.5216997, 1, 1, 1, 1, 1,
0.4255343, -0.4171186, 2.425538, 1, 1, 1, 1, 1,
0.4307359, -0.4044096, 1.563828, 1, 1, 1, 1, 1,
0.4312892, -0.4960348, 3.369737, 1, 1, 1, 1, 1,
0.4315979, 0.1112815, 0.1357445, 1, 1, 1, 1, 1,
0.4328863, 0.1646642, 0.03009799, 1, 1, 1, 1, 1,
0.435816, -0.1036481, -0.0267193, 1, 1, 1, 1, 1,
0.4370143, 0.6346327, 1.812875, 1, 1, 1, 1, 1,
0.4396128, -0.9548775, 0.9866261, 1, 1, 1, 1, 1,
0.4403827, 1.162738, 0.4973143, 1, 1, 1, 1, 1,
0.4437737, -2.159095, 0.2465154, 0, 0, 1, 1, 1,
0.4486138, 0.4641891, 1.260837, 1, 0, 0, 1, 1,
0.4490829, -0.7996023, 3.198976, 1, 0, 0, 1, 1,
0.4510535, 0.5813585, 0.9857193, 1, 0, 0, 1, 1,
0.4538541, 1.144149, 0.4054689, 1, 0, 0, 1, 1,
0.4568142, 0.7985809, 1.908196, 1, 0, 0, 1, 1,
0.4578984, -0.4747421, 2.518809, 0, 0, 0, 1, 1,
0.4584977, -0.3203049, 3.995272, 0, 0, 0, 1, 1,
0.4587741, -0.4237801, 4.180538, 0, 0, 0, 1, 1,
0.4598507, 0.1168494, 2.546281, 0, 0, 0, 1, 1,
0.4614469, -0.9114603, 2.034325, 0, 0, 0, 1, 1,
0.4618419, 0.9098403, -0.3614774, 0, 0, 0, 1, 1,
0.4660897, 1.043296, 2.826869, 0, 0, 0, 1, 1,
0.4668862, 1.716715, -0.9214922, 1, 1, 1, 1, 1,
0.4670839, 0.7888333, -0.156761, 1, 1, 1, 1, 1,
0.4708841, 0.7464465, 1.00904, 1, 1, 1, 1, 1,
0.472919, 0.7948202, 0.3142484, 1, 1, 1, 1, 1,
0.4764351, -1.365892, 3.107885, 1, 1, 1, 1, 1,
0.4868908, 0.8807073, 0.5420412, 1, 1, 1, 1, 1,
0.4897231, 0.9881771, -0.3590771, 1, 1, 1, 1, 1,
0.4921713, -1.001688, 2.464783, 1, 1, 1, 1, 1,
0.4944372, -1.65924, 2.677533, 1, 1, 1, 1, 1,
0.4948913, 0.7260819, 0.08486086, 1, 1, 1, 1, 1,
0.4952715, 0.2068057, -0.2869607, 1, 1, 1, 1, 1,
0.4960446, 1.59843, -0.2577607, 1, 1, 1, 1, 1,
0.498162, 0.1667937, 0.3995636, 1, 1, 1, 1, 1,
0.4984366, 0.5543144, 1.209729, 1, 1, 1, 1, 1,
0.5029076, 0.6753604, -0.2564723, 1, 1, 1, 1, 1,
0.5046518, 0.2305802, 1.460704, 0, 0, 1, 1, 1,
0.507338, -0.14027, 2.933004, 1, 0, 0, 1, 1,
0.5167078, -2.180038, 3.521255, 1, 0, 0, 1, 1,
0.5177668, -0.9161831, 1.606461, 1, 0, 0, 1, 1,
0.5182852, 0.1638416, 2.820343, 1, 0, 0, 1, 1,
0.5194742, 0.5041552, 0.05444588, 1, 0, 0, 1, 1,
0.5204583, -1.283157, 2.400014, 0, 0, 0, 1, 1,
0.5284745, -0.1234825, -0.3634106, 0, 0, 0, 1, 1,
0.5411984, -0.3491064, 2.031782, 0, 0, 0, 1, 1,
0.5437785, -1.273827, 1.528018, 0, 0, 0, 1, 1,
0.5521845, -0.2590733, 0.5829474, 0, 0, 0, 1, 1,
0.5538467, -1.978977, 2.011482, 0, 0, 0, 1, 1,
0.5561428, 0.4402323, 0.001054119, 0, 0, 0, 1, 1,
0.5647288, 1.158825, 1.229448, 1, 1, 1, 1, 1,
0.5670913, 0.04731726, 1.31702, 1, 1, 1, 1, 1,
0.5699577, 0.2584945, -0.5616854, 1, 1, 1, 1, 1,
0.5737872, -1.078355, 2.293341, 1, 1, 1, 1, 1,
0.5747252, -0.8048943, 2.011574, 1, 1, 1, 1, 1,
0.5764829, 0.6342943, 1.889523, 1, 1, 1, 1, 1,
0.5773565, 1.503753, 0.5654373, 1, 1, 1, 1, 1,
0.5792502, -0.5448772, 1.405231, 1, 1, 1, 1, 1,
0.5824814, -0.5881009, 1.762049, 1, 1, 1, 1, 1,
0.5942249, 1.044762, 1.226337, 1, 1, 1, 1, 1,
0.5945863, 2.174225, -1.173632, 1, 1, 1, 1, 1,
0.5950388, -1.201449, 4.969334, 1, 1, 1, 1, 1,
0.5955134, -0.5942037, 4.036605, 1, 1, 1, 1, 1,
0.5957103, -1.082583, 2.265636, 1, 1, 1, 1, 1,
0.5999612, -0.5305135, 4.569342, 1, 1, 1, 1, 1,
0.6050646, 0.2622319, 1.252238, 0, 0, 1, 1, 1,
0.6058117, 0.6427432, -0.01695967, 1, 0, 0, 1, 1,
0.6069899, -1.392852, 1.724693, 1, 0, 0, 1, 1,
0.6250045, 1.174351, 0.6682773, 1, 0, 0, 1, 1,
0.625838, -1.098145, 1.90589, 1, 0, 0, 1, 1,
0.6284382, -1.402857, 2.817534, 1, 0, 0, 1, 1,
0.6289597, 0.8113463, 1.565094, 0, 0, 0, 1, 1,
0.6318064, 1.397182, -0.4174601, 0, 0, 0, 1, 1,
0.6319274, 0.7112268, 0.6814535, 0, 0, 0, 1, 1,
0.6384233, -2.424593, 1.621358, 0, 0, 0, 1, 1,
0.6385757, -1.055511, 1.941914, 0, 0, 0, 1, 1,
0.6398944, 0.3643847, 1.959958, 0, 0, 0, 1, 1,
0.6413179, 0.07577749, 1.627192, 0, 0, 0, 1, 1,
0.64181, 0.01538453, 2.879117, 1, 1, 1, 1, 1,
0.6439316, 0.07764276, 1.539625, 1, 1, 1, 1, 1,
0.6480194, 0.7595928, 1.437307, 1, 1, 1, 1, 1,
0.652954, -1.473037, 2.911152, 1, 1, 1, 1, 1,
0.654904, 0.9381977, 0.7375519, 1, 1, 1, 1, 1,
0.6597639, -1.738025, 3.886997, 1, 1, 1, 1, 1,
0.6600474, 0.001065924, 1.125362, 1, 1, 1, 1, 1,
0.6623024, 0.7515303, -0.0541782, 1, 1, 1, 1, 1,
0.6728399, 0.4047745, 0.3298319, 1, 1, 1, 1, 1,
0.6768738, -0.2466511, 0.5531715, 1, 1, 1, 1, 1,
0.6784316, -0.4141855, 3.640409, 1, 1, 1, 1, 1,
0.6893185, -0.4387029, 2.352009, 1, 1, 1, 1, 1,
0.6976346, -0.2738083, 0.8875057, 1, 1, 1, 1, 1,
0.7114658, 1.755853, -0.5759497, 1, 1, 1, 1, 1,
0.7183948, 1.52956, 1.05654, 1, 1, 1, 1, 1,
0.7196606, -0.1312412, 2.429157, 0, 0, 1, 1, 1,
0.7209408, -0.1691841, 0.2598194, 1, 0, 0, 1, 1,
0.7222661, 1.019028, 0.6761475, 1, 0, 0, 1, 1,
0.7249019, 0.5368462, 0.02705753, 1, 0, 0, 1, 1,
0.727716, 1.732707, -0.9243687, 1, 0, 0, 1, 1,
0.7424053, 0.8080892, 1.962901, 1, 0, 0, 1, 1,
0.7457851, -0.6790528, 2.111852, 0, 0, 0, 1, 1,
0.7468066, 1.206359, -0.804881, 0, 0, 0, 1, 1,
0.7498491, 0.7680789, 0.2641042, 0, 0, 0, 1, 1,
0.7575357, -0.3086432, 3.416777, 0, 0, 0, 1, 1,
0.76037, 0.6216868, -0.1606028, 0, 0, 0, 1, 1,
0.7634789, 0.327081, -0.1703115, 0, 0, 0, 1, 1,
0.7675568, 0.6651598, 0.4570147, 0, 0, 0, 1, 1,
0.7683107, 1.140333, 1.081233, 1, 1, 1, 1, 1,
0.7775628, 0.06793855, 2.834747, 1, 1, 1, 1, 1,
0.778926, -2.071944, 2.804214, 1, 1, 1, 1, 1,
0.7796453, 0.2625903, 0.590772, 1, 1, 1, 1, 1,
0.7867098, -0.1288685, 1.407992, 1, 1, 1, 1, 1,
0.7870448, 0.511022, 1.5821, 1, 1, 1, 1, 1,
0.7992276, -0.09917337, 3.427208, 1, 1, 1, 1, 1,
0.8059968, 0.6709921, 1.994851, 1, 1, 1, 1, 1,
0.8070319, -0.0241358, 2.620637, 1, 1, 1, 1, 1,
0.8098295, 0.9656863, 0.4866509, 1, 1, 1, 1, 1,
0.8118975, 1.117625, -1.110032, 1, 1, 1, 1, 1,
0.8138258, -1.227813, 0.9630767, 1, 1, 1, 1, 1,
0.8144444, -0.1642359, 0.4829524, 1, 1, 1, 1, 1,
0.8219957, -0.2438085, 1.652608, 1, 1, 1, 1, 1,
0.8242915, -1.427517, 2.97993, 1, 1, 1, 1, 1,
0.8332249, -1.282342, 4.228223, 0, 0, 1, 1, 1,
0.8411928, 0.2175693, -0.07761366, 1, 0, 0, 1, 1,
0.8521771, 1.596184, -0.1924112, 1, 0, 0, 1, 1,
0.8589765, -0.1362008, 3.03805, 1, 0, 0, 1, 1,
0.8636928, 1.164334, 1.024516, 1, 0, 0, 1, 1,
0.8737075, 0.4194801, 1.551271, 1, 0, 0, 1, 1,
0.8771781, 0.8693992, -0.3537722, 0, 0, 0, 1, 1,
0.8789076, 0.9580245, 2.749477, 0, 0, 0, 1, 1,
0.879043, 1.703856, 0.5005012, 0, 0, 0, 1, 1,
0.8896375, 0.08719151, 1.924185, 0, 0, 0, 1, 1,
0.8909886, -0.3620179, 2.473379, 0, 0, 0, 1, 1,
0.8924009, -2.329909, 3.367075, 0, 0, 0, 1, 1,
0.8926297, -0.8443168, 2.010498, 0, 0, 0, 1, 1,
0.8952997, -0.8591954, 4.066134, 1, 1, 1, 1, 1,
0.8993011, 0.8048824, 2.990118, 1, 1, 1, 1, 1,
0.9175311, -0.3678944, 2.267184, 1, 1, 1, 1, 1,
0.9323329, -1.487389, 2.412764, 1, 1, 1, 1, 1,
0.9328998, 0.02558197, -0.3991973, 1, 1, 1, 1, 1,
0.9359948, -1.877223, 0.98545, 1, 1, 1, 1, 1,
0.9369732, 0.3832161, 1.546956, 1, 1, 1, 1, 1,
0.9469912, -0.372576, 2.983851, 1, 1, 1, 1, 1,
0.9474364, -0.1016627, 2.524149, 1, 1, 1, 1, 1,
0.9536725, -0.6173012, 1.960666, 1, 1, 1, 1, 1,
0.9592007, 0.2819078, 0.1693413, 1, 1, 1, 1, 1,
0.9614121, -2.156698, 2.312338, 1, 1, 1, 1, 1,
0.9688326, 1.065407, 0.4069703, 1, 1, 1, 1, 1,
0.9705306, -0.5747406, 1.621329, 1, 1, 1, 1, 1,
0.9800938, -0.4757665, 3.353089, 1, 1, 1, 1, 1,
0.9809788, 0.4368697, -0.286188, 0, 0, 1, 1, 1,
0.9962595, 1.419767, -0.8709961, 1, 0, 0, 1, 1,
0.9997234, -0.7681184, 0.9720745, 1, 0, 0, 1, 1,
1.013389, 0.6240065, 1.754526, 1, 0, 0, 1, 1,
1.018051, -0.5849261, 1.952265, 1, 0, 0, 1, 1,
1.019641, -0.5737516, 1.248162, 1, 0, 0, 1, 1,
1.024696, 0.4006395, -0.1702514, 0, 0, 0, 1, 1,
1.026902, 0.07340954, 2.381498, 0, 0, 0, 1, 1,
1.032048, 0.804203, -0.759792, 0, 0, 0, 1, 1,
1.032524, -0.5242829, 1.821382, 0, 0, 0, 1, 1,
1.033784, -0.0668317, 2.303934, 0, 0, 0, 1, 1,
1.038465, -0.7082959, 2.611564, 0, 0, 0, 1, 1,
1.043429, -0.6693725, 3.419636, 0, 0, 0, 1, 1,
1.053897, 0.8989859, 1.484652, 1, 1, 1, 1, 1,
1.05504, -1.808871, 3.010552, 1, 1, 1, 1, 1,
1.063144, -0.6051288, 2.361212, 1, 1, 1, 1, 1,
1.063962, 1.647185, 1.572693, 1, 1, 1, 1, 1,
1.068506, -0.1989556, 2.951527, 1, 1, 1, 1, 1,
1.070491, 0.7985976, 0.5236642, 1, 1, 1, 1, 1,
1.072659, -0.7249413, 0.7691716, 1, 1, 1, 1, 1,
1.073156, -0.3405704, 1.482091, 1, 1, 1, 1, 1,
1.077471, 0.05274353, 2.388427, 1, 1, 1, 1, 1,
1.079789, 0.8159067, 1.052441, 1, 1, 1, 1, 1,
1.083781, 0.6674965, 2.317553, 1, 1, 1, 1, 1,
1.090993, 1.347282, 0.5564588, 1, 1, 1, 1, 1,
1.091644, 1.018328, 1.995607, 1, 1, 1, 1, 1,
1.094777, -0.775808, 1.868521, 1, 1, 1, 1, 1,
1.098711, 0.7912441, -0.05403417, 1, 1, 1, 1, 1,
1.099305, -0.3570969, 2.792725, 0, 0, 1, 1, 1,
1.104244, -0.7255007, 2.328834, 1, 0, 0, 1, 1,
1.113027, -0.4509932, 0.9833047, 1, 0, 0, 1, 1,
1.113508, 0.9826207, 0.7567559, 1, 0, 0, 1, 1,
1.12392, 1.096762, 0.07485174, 1, 0, 0, 1, 1,
1.1307, -1.572417, 2.292422, 1, 0, 0, 1, 1,
1.130839, -0.6317368, 0.8189215, 0, 0, 0, 1, 1,
1.135841, -1.474836, 1.592831, 0, 0, 0, 1, 1,
1.137348, -1.257438, 2.822039, 0, 0, 0, 1, 1,
1.141249, -0.4674305, 2.436377, 0, 0, 0, 1, 1,
1.142706, -0.2155486, 0.8479769, 0, 0, 0, 1, 1,
1.150266, -0.9171782, 1.000627, 0, 0, 0, 1, 1,
1.150407, -0.01096169, -0.2773027, 0, 0, 0, 1, 1,
1.154173, 0.3325346, 0.8447396, 1, 1, 1, 1, 1,
1.164001, -1.482123, 2.111418, 1, 1, 1, 1, 1,
1.172951, -0.8019345, 0.7478323, 1, 1, 1, 1, 1,
1.174669, 0.09508783, 1.535305, 1, 1, 1, 1, 1,
1.175887, -0.515991, 3.372188, 1, 1, 1, 1, 1,
1.176304, -1.567127, 1.658096, 1, 1, 1, 1, 1,
1.186549, 0.9390821, 0.2141029, 1, 1, 1, 1, 1,
1.191786, -0.2026794, 0.7354446, 1, 1, 1, 1, 1,
1.192692, 1.026894, 2.023216, 1, 1, 1, 1, 1,
1.193937, 0.3062829, 1.451434, 1, 1, 1, 1, 1,
1.198966, -0.4611675, 2.044338, 1, 1, 1, 1, 1,
1.200583, 1.112056, 0.1183016, 1, 1, 1, 1, 1,
1.205547, -0.6288285, 2.282815, 1, 1, 1, 1, 1,
1.209208, 1.839233, 0.1926225, 1, 1, 1, 1, 1,
1.209418, -0.4966516, 1.145037, 1, 1, 1, 1, 1,
1.218914, 0.6569539, 0.4881319, 0, 0, 1, 1, 1,
1.219352, 1.390901, -0.4994326, 1, 0, 0, 1, 1,
1.23616, 0.9259874, 1.484211, 1, 0, 0, 1, 1,
1.250592, -0.3488674, 2.615883, 1, 0, 0, 1, 1,
1.253213, 0.2129678, 0.259881, 1, 0, 0, 1, 1,
1.253378, -1.266891, 1.534613, 1, 0, 0, 1, 1,
1.254439, 1.558034, 0.3619255, 0, 0, 0, 1, 1,
1.255403, -0.03419882, 1.242633, 0, 0, 0, 1, 1,
1.257509, 1.060943, 1.706857, 0, 0, 0, 1, 1,
1.272007, -0.5978959, 0.7015095, 0, 0, 0, 1, 1,
1.274166, -0.2467097, 2.36974, 0, 0, 0, 1, 1,
1.278964, 0.7996992, 1.523831, 0, 0, 0, 1, 1,
1.285441, 0.1810169, 0.1833625, 0, 0, 0, 1, 1,
1.288283, -1.288537, 1.472427, 1, 1, 1, 1, 1,
1.293859, -1.425404, 0.7016909, 1, 1, 1, 1, 1,
1.295335, -0.8794269, 2.119413, 1, 1, 1, 1, 1,
1.30038, 0.533708, 0.7826548, 1, 1, 1, 1, 1,
1.300767, -0.8065866, 2.826232, 1, 1, 1, 1, 1,
1.305049, -0.3010065, 1.352217, 1, 1, 1, 1, 1,
1.309036, -0.4522014, 2.032284, 1, 1, 1, 1, 1,
1.314148, 0.624088, 0.4560983, 1, 1, 1, 1, 1,
1.331639, -0.9713672, 2.554778, 1, 1, 1, 1, 1,
1.340094, -0.2279391, 2.423498, 1, 1, 1, 1, 1,
1.353292, 0.9113603, 0.7785293, 1, 1, 1, 1, 1,
1.355788, -1.75077, 1.011627, 1, 1, 1, 1, 1,
1.361035, -0.822986, 1.550079, 1, 1, 1, 1, 1,
1.370731, 0.4190297, 0.9561599, 1, 1, 1, 1, 1,
1.384512, 0.7536388, 0.350022, 1, 1, 1, 1, 1,
1.384724, 2.58728, 1.496815, 0, 0, 1, 1, 1,
1.393831, 1.563856, 1.085176, 1, 0, 0, 1, 1,
1.412429, -1.585876, 1.955829, 1, 0, 0, 1, 1,
1.417638, 0.3867103, 1.722307, 1, 0, 0, 1, 1,
1.418058, -0.3146101, 3.389463, 1, 0, 0, 1, 1,
1.420823, -0.4907148, 0.7927553, 1, 0, 0, 1, 1,
1.426912, 1.496327, 0.9945261, 0, 0, 0, 1, 1,
1.428202, -2.975015, 1.869995, 0, 0, 0, 1, 1,
1.429177, 0.775992, 1.129068, 0, 0, 0, 1, 1,
1.437932, -0.6362901, 3.257921, 0, 0, 0, 1, 1,
1.44709, 1.955703, 0.5147408, 0, 0, 0, 1, 1,
1.451081, -0.307215, 3.569273, 0, 0, 0, 1, 1,
1.470462, 1.307543, 0.79369, 0, 0, 0, 1, 1,
1.470808, 0.3231803, 1.008894, 1, 1, 1, 1, 1,
1.478361, 1.473519, 0.4398923, 1, 1, 1, 1, 1,
1.478516, -0.6187937, 1.886115, 1, 1, 1, 1, 1,
1.480815, -0.4445546, 3.230898, 1, 1, 1, 1, 1,
1.485735, 0.487229, 0.1293534, 1, 1, 1, 1, 1,
1.505616, -0.6566713, 1.812388, 1, 1, 1, 1, 1,
1.509959, 0.3035368, 0.6545613, 1, 1, 1, 1, 1,
1.515328, -0.2495269, 1.786278, 1, 1, 1, 1, 1,
1.521827, -0.6753824, 0.07568309, 1, 1, 1, 1, 1,
1.530086, 0.3498552, 0.9711955, 1, 1, 1, 1, 1,
1.541221, -1.11634, 0.6519706, 1, 1, 1, 1, 1,
1.545051, -0.8728343, 2.193969, 1, 1, 1, 1, 1,
1.550331, 0.9667182, 1.188728, 1, 1, 1, 1, 1,
1.551476, -1.229253, 2.706917, 1, 1, 1, 1, 1,
1.577615, -0.366409, 1.44595, 1, 1, 1, 1, 1,
1.588438, -1.146556, 0.8418067, 0, 0, 1, 1, 1,
1.596614, -0.2536271, 1.942772, 1, 0, 0, 1, 1,
1.599046, -1.481362, 1.802581, 1, 0, 0, 1, 1,
1.601488, -1.447195, 1.375796, 1, 0, 0, 1, 1,
1.631451, 0.1405261, 4.850357, 1, 0, 0, 1, 1,
1.641672, -0.008840024, 3.189277, 1, 0, 0, 1, 1,
1.653298, 0.08554173, 2.074936, 0, 0, 0, 1, 1,
1.662119, -1.179342, 3.08883, 0, 0, 0, 1, 1,
1.665593, -0.6544046, 1.983258, 0, 0, 0, 1, 1,
1.681955, 0.3471606, -0.02509697, 0, 0, 0, 1, 1,
1.706749, -1.33578, 2.891896, 0, 0, 0, 1, 1,
1.728161, 0.6571961, 0.9368206, 0, 0, 0, 1, 1,
1.741869, -1.093175, 1.995332, 0, 0, 0, 1, 1,
1.75873, -0.4923276, -1.120382, 1, 1, 1, 1, 1,
1.772868, 0.4498298, 2.083063, 1, 1, 1, 1, 1,
1.777744, 0.2582007, 1.334804, 1, 1, 1, 1, 1,
1.814486, -0.9504637, 4.148059, 1, 1, 1, 1, 1,
1.827559, 0.4338929, 2.823717, 1, 1, 1, 1, 1,
1.829126, -1.676533, 2.072857, 1, 1, 1, 1, 1,
1.859399, -1.723028, 1.829504, 1, 1, 1, 1, 1,
1.86766, -0.9545223, 2.63398, 1, 1, 1, 1, 1,
1.86887, -0.6081541, 2.51731, 1, 1, 1, 1, 1,
1.878728, 2.087137, 2.840009, 1, 1, 1, 1, 1,
1.89133, -0.1506853, 0.7526357, 1, 1, 1, 1, 1,
1.910125, 0.01077498, -0.6986331, 1, 1, 1, 1, 1,
1.954951, -0.4286833, 0.2861664, 1, 1, 1, 1, 1,
1.956274, 0.06826641, 2.226963, 1, 1, 1, 1, 1,
2.005638, -0.5556368, 2.82092, 1, 1, 1, 1, 1,
2.029479, 0.1997407, 3.147309, 0, 0, 1, 1, 1,
2.06835, -2.065047, 1.576672, 1, 0, 0, 1, 1,
2.090239, -0.1252217, 3.087563, 1, 0, 0, 1, 1,
2.105817, 1.525818, 0.7859383, 1, 0, 0, 1, 1,
2.126295, 0.3721322, 2.931484, 1, 0, 0, 1, 1,
2.13866, 0.2795446, 0.9759437, 1, 0, 0, 1, 1,
2.145042, 0.3884759, 2.657567, 0, 0, 0, 1, 1,
2.217208, -0.2697174, 2.03025, 0, 0, 0, 1, 1,
2.230108, 0.8244236, 1.538911, 0, 0, 0, 1, 1,
2.230297, 0.3347296, 0.4719261, 0, 0, 0, 1, 1,
2.29601, -0.9165689, 1.0584, 0, 0, 0, 1, 1,
2.327349, 0.1457168, 1.795951, 0, 0, 0, 1, 1,
2.382086, -1.834674, 2.585768, 0, 0, 0, 1, 1,
2.394593, -0.1578524, 1.613809, 1, 1, 1, 1, 1,
2.4656, 0.8764292, 2.19883, 1, 1, 1, 1, 1,
2.579639, 0.5703908, 1.582615, 1, 1, 1, 1, 1,
2.787219, 2.21116, 0.2386005, 1, 1, 1, 1, 1,
2.816869, -0.4840847, 3.937754, 1, 1, 1, 1, 1,
3.175798, -0.4125024, 2.05079, 1, 1, 1, 1, 1,
3.359893, 0.961162, 1.980974, 1, 1, 1, 1, 1
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
var radius = 9.077119;
var distance = 31.883;
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
mvMatrix.translate( -0.221899, 0.1357157, -0.1157331 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.883);
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
