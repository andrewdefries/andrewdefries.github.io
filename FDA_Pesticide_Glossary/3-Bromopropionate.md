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
-3.689828, 0.1637913, -1.601533, 1, 0, 0, 1,
-3.270652, 1.350565, -0.6581295, 1, 0.007843138, 0, 1,
-3.074493, -0.6250924, -2.111094, 1, 0.01176471, 0, 1,
-2.915521, 0.7739604, -2.284907, 1, 0.01960784, 0, 1,
-2.912963, 1.542496, -2.051148, 1, 0.02352941, 0, 1,
-2.883863, -1.664325, -3.871233, 1, 0.03137255, 0, 1,
-2.69719, 0.2670743, -0.3786108, 1, 0.03529412, 0, 1,
-2.679081, 0.4054076, -1.219639, 1, 0.04313726, 0, 1,
-2.54198, -1.492544, -1.22572, 1, 0.04705882, 0, 1,
-2.51603, 1.088394, -2.134708, 1, 0.05490196, 0, 1,
-2.404981, 1.09011, -2.052006, 1, 0.05882353, 0, 1,
-2.390564, -1.333761, -1.12687, 1, 0.06666667, 0, 1,
-2.324039, -1.086779, -2.508166, 1, 0.07058824, 0, 1,
-2.298003, 1.422012, 0.8620962, 1, 0.07843138, 0, 1,
-2.109945, 2.085397, -0.05073721, 1, 0.08235294, 0, 1,
-2.086139, 1.76099, -2.324812, 1, 0.09019608, 0, 1,
-2.080845, 0.805814, -1.401068, 1, 0.09411765, 0, 1,
-2.050716, 0.4250409, -1.362907, 1, 0.1019608, 0, 1,
-2.025567, 0.9835345, -2.436814, 1, 0.1098039, 0, 1,
-2.01014, 0.01485633, -2.396066, 1, 0.1137255, 0, 1,
-2.008272, 1.212537, 0.1098305, 1, 0.1215686, 0, 1,
-1.952761, -1.602705, -2.885887, 1, 0.1254902, 0, 1,
-1.945311, 0.4767889, -1.050267, 1, 0.1333333, 0, 1,
-1.943064, 1.563236, -1.024914, 1, 0.1372549, 0, 1,
-1.933931, -1.405723, -3.649721, 1, 0.145098, 0, 1,
-1.921575, 0.0283656, -1.653788, 1, 0.1490196, 0, 1,
-1.912749, -1.422186, -2.350114, 1, 0.1568628, 0, 1,
-1.906158, -0.9152448, -2.350569, 1, 0.1607843, 0, 1,
-1.898018, 1.047039, -0.3120696, 1, 0.1686275, 0, 1,
-1.887601, -0.215544, -1.487661, 1, 0.172549, 0, 1,
-1.867335, -1.267872, -2.829834, 1, 0.1803922, 0, 1,
-1.833691, -0.801762, -2.090918, 1, 0.1843137, 0, 1,
-1.828175, 1.586512, -1.258681, 1, 0.1921569, 0, 1,
-1.804087, 0.2428612, -2.46539, 1, 0.1960784, 0, 1,
-1.778666, 0.116512, -1.96709, 1, 0.2039216, 0, 1,
-1.771463, 0.8375486, -2.850742, 1, 0.2117647, 0, 1,
-1.746686, 1.769274, -1.29627, 1, 0.2156863, 0, 1,
-1.729053, -1.647183, -2.30461, 1, 0.2235294, 0, 1,
-1.723172, -1.172669, -1.524386, 1, 0.227451, 0, 1,
-1.710772, -1.042471, -1.975812, 1, 0.2352941, 0, 1,
-1.706555, -0.4704264, -3.888148, 1, 0.2392157, 0, 1,
-1.70274, 0.8309246, -1.544107, 1, 0.2470588, 0, 1,
-1.698003, -0.5528826, -2.423346, 1, 0.2509804, 0, 1,
-1.689575, 1.103322, -1.355837, 1, 0.2588235, 0, 1,
-1.677397, -1.135668, -1.63024, 1, 0.2627451, 0, 1,
-1.66227, -0.2185557, -3.123335, 1, 0.2705882, 0, 1,
-1.655715, 0.3650783, -1.403378, 1, 0.2745098, 0, 1,
-1.640135, 2.154227, -0.1736431, 1, 0.282353, 0, 1,
-1.632944, 0.5882502, 0.1250684, 1, 0.2862745, 0, 1,
-1.62684, 0.415638, -2.017095, 1, 0.2941177, 0, 1,
-1.620785, -0.746047, -2.52304, 1, 0.3019608, 0, 1,
-1.619332, 1.989033, 1.252939, 1, 0.3058824, 0, 1,
-1.615076, -1.395157, -0.4501479, 1, 0.3137255, 0, 1,
-1.598961, 0.8770082, -0.2582892, 1, 0.3176471, 0, 1,
-1.594926, 0.2526698, -2.154878, 1, 0.3254902, 0, 1,
-1.587422, 0.1459315, -1.64876, 1, 0.3294118, 0, 1,
-1.562597, 0.6923938, -1.228184, 1, 0.3372549, 0, 1,
-1.543458, -0.9679779, -2.263472, 1, 0.3411765, 0, 1,
-1.543269, 1.329465, 1.080096, 1, 0.3490196, 0, 1,
-1.5366, -0.5864431, -1.718657, 1, 0.3529412, 0, 1,
-1.534323, 0.08377325, -0.08758487, 1, 0.3607843, 0, 1,
-1.509486, -2.622286, -4.624739, 1, 0.3647059, 0, 1,
-1.503214, -1.841702, -2.747185, 1, 0.372549, 0, 1,
-1.50317, 0.5201071, 0.1891884, 1, 0.3764706, 0, 1,
-1.50209, -0.2647059, 0.4944629, 1, 0.3843137, 0, 1,
-1.493126, 0.7410919, -1.066022, 1, 0.3882353, 0, 1,
-1.487271, 0.8478168, 0.2759886, 1, 0.3960784, 0, 1,
-1.474069, -0.688827, -2.826417, 1, 0.4039216, 0, 1,
-1.47053, -0.7224218, -0.9010972, 1, 0.4078431, 0, 1,
-1.447141, -1.033905, -2.345144, 1, 0.4156863, 0, 1,
-1.427243, 0.1239176, -2.048721, 1, 0.4196078, 0, 1,
-1.427041, -0.7921075, -0.1540762, 1, 0.427451, 0, 1,
-1.425529, -0.205194, -1.981342, 1, 0.4313726, 0, 1,
-1.416521, -0.5171036, -3.060081, 1, 0.4392157, 0, 1,
-1.406746, -1.821291, -2.227906, 1, 0.4431373, 0, 1,
-1.405606, 0.1641226, -1.326225, 1, 0.4509804, 0, 1,
-1.405003, -0.1544083, -1.162863, 1, 0.454902, 0, 1,
-1.397638, 1.67423, -2.6399, 1, 0.4627451, 0, 1,
-1.395005, 0.6233615, -2.445917, 1, 0.4666667, 0, 1,
-1.394352, -1.36395, -1.202217, 1, 0.4745098, 0, 1,
-1.392502, -0.4391929, -1.125664, 1, 0.4784314, 0, 1,
-1.382107, -0.5176241, -1.612709, 1, 0.4862745, 0, 1,
-1.373024, 0.7884954, -3.068431, 1, 0.4901961, 0, 1,
-1.369159, -0.1357352, -2.766145, 1, 0.4980392, 0, 1,
-1.362414, 0.8811672, -0.642385, 1, 0.5058824, 0, 1,
-1.359961, 0.711356, -1.544639, 1, 0.509804, 0, 1,
-1.348149, 1.432366, -1.378712, 1, 0.5176471, 0, 1,
-1.343943, 2.403762, 0.2519875, 1, 0.5215687, 0, 1,
-1.341544, -1.087104, -2.614719, 1, 0.5294118, 0, 1,
-1.338677, -1.130662, -2.841847, 1, 0.5333334, 0, 1,
-1.335625, -1.304872, -1.786454, 1, 0.5411765, 0, 1,
-1.319595, 0.2330173, -0.6945389, 1, 0.5450981, 0, 1,
-1.317047, 0.7614105, 0.2738731, 1, 0.5529412, 0, 1,
-1.316763, -1.260702, -2.902321, 1, 0.5568628, 0, 1,
-1.307196, -0.2198528, -2.348812, 1, 0.5647059, 0, 1,
-1.303438, -1.047223, -1.525256, 1, 0.5686275, 0, 1,
-1.303038, -0.3751832, -2.601397, 1, 0.5764706, 0, 1,
-1.302296, -0.5381716, -3.180646, 1, 0.5803922, 0, 1,
-1.282264, -0.2796704, -2.128947, 1, 0.5882353, 0, 1,
-1.27189, -0.919295, -2.533021, 1, 0.5921569, 0, 1,
-1.266769, -0.8413412, -3.162141, 1, 0.6, 0, 1,
-1.264399, -0.104725, -1.146041, 1, 0.6078432, 0, 1,
-1.260108, 0.09538911, -0.2295741, 1, 0.6117647, 0, 1,
-1.253703, 0.8252096, -1.658775, 1, 0.6196079, 0, 1,
-1.252611, -1.878326, -2.034329, 1, 0.6235294, 0, 1,
-1.246058, 0.4075849, -0.3594609, 1, 0.6313726, 0, 1,
-1.244178, 0.1927262, -1.474804, 1, 0.6352941, 0, 1,
-1.241654, -0.6181058, -0.5524972, 1, 0.6431373, 0, 1,
-1.240533, 2.073163, -0.7361261, 1, 0.6470588, 0, 1,
-1.225947, -0.1752659, -1.62016, 1, 0.654902, 0, 1,
-1.224018, 0.3126561, -1.44449, 1, 0.6588235, 0, 1,
-1.2189, 1.001592, -1.031355, 1, 0.6666667, 0, 1,
-1.208027, -0.5667536, -3.255754, 1, 0.6705883, 0, 1,
-1.195163, -0.8869188, -1.795605, 1, 0.6784314, 0, 1,
-1.185806, -0.3093113, -2.375267, 1, 0.682353, 0, 1,
-1.158117, -0.5449337, -2.001674, 1, 0.6901961, 0, 1,
-1.145268, 0.0459106, -1.69558, 1, 0.6941177, 0, 1,
-1.140389, -0.7337404, -0.997376, 1, 0.7019608, 0, 1,
-1.138506, -0.6378214, -0.4755543, 1, 0.7098039, 0, 1,
-1.13633, -0.7297676, -1.749102, 1, 0.7137255, 0, 1,
-1.135636, 0.04720708, -1.063991, 1, 0.7215686, 0, 1,
-1.129574, 0.9322524, -1.570296, 1, 0.7254902, 0, 1,
-1.115693, -1.038796, -4.17548, 1, 0.7333333, 0, 1,
-1.10747, 0.8235184, -1.13184, 1, 0.7372549, 0, 1,
-1.10423, 0.03421441, -2.18568, 1, 0.7450981, 0, 1,
-1.104096, 0.2721794, -1.705602, 1, 0.7490196, 0, 1,
-1.101337, -0.9517443, -0.4834659, 1, 0.7568628, 0, 1,
-1.101164, 0.2295282, 0.09414472, 1, 0.7607843, 0, 1,
-1.096138, -0.2383302, 0.06790973, 1, 0.7686275, 0, 1,
-1.092495, 0.5573469, -0.9488273, 1, 0.772549, 0, 1,
-1.077537, 0.2998055, -0.03715685, 1, 0.7803922, 0, 1,
-1.075847, -0.4166373, -1.860757, 1, 0.7843137, 0, 1,
-1.075121, -1.171942, -2.842068, 1, 0.7921569, 0, 1,
-1.07347, 0.3303123, -1.571132, 1, 0.7960784, 0, 1,
-1.070255, 0.880734, -0.7893484, 1, 0.8039216, 0, 1,
-1.067676, 0.07063333, -1.364556, 1, 0.8117647, 0, 1,
-1.066347, -0.5077448, -0.9040318, 1, 0.8156863, 0, 1,
-1.055509, -0.3896739, -1.001546, 1, 0.8235294, 0, 1,
-1.053245, 1.453037, 0.9038532, 1, 0.827451, 0, 1,
-1.052423, -1.550304, -3.165594, 1, 0.8352941, 0, 1,
-1.052317, 0.04609309, -2.41361, 1, 0.8392157, 0, 1,
-1.042161, -0.3938237, -2.033833, 1, 0.8470588, 0, 1,
-1.042087, 1.38514, -1.91443, 1, 0.8509804, 0, 1,
-1.039897, -0.6908248, -1.646124, 1, 0.8588235, 0, 1,
-1.036356, -0.1278989, -0.670573, 1, 0.8627451, 0, 1,
-1.032896, 1.282121, -0.782793, 1, 0.8705882, 0, 1,
-1.02551, 0.9865339, 0.3171392, 1, 0.8745098, 0, 1,
-1.010776, 0.7278928, -0.1861877, 1, 0.8823529, 0, 1,
-1.004793, 0.1043275, -1.219335, 1, 0.8862745, 0, 1,
-0.9903817, -1.90591, -2.036987, 1, 0.8941177, 0, 1,
-0.9877295, 0.1720477, -0.7424018, 1, 0.8980392, 0, 1,
-0.9865957, -1.886276, -3.417134, 1, 0.9058824, 0, 1,
-0.9803767, 0.5112785, -0.8598496, 1, 0.9137255, 0, 1,
-0.9774742, -0.124792, -0.5030809, 1, 0.9176471, 0, 1,
-0.977212, -0.483148, -0.7848533, 1, 0.9254902, 0, 1,
-0.9741061, 0.4897169, -0.4440475, 1, 0.9294118, 0, 1,
-0.9737217, 0.09913185, -1.383246, 1, 0.9372549, 0, 1,
-0.9697427, 1.176738, 0.8918563, 1, 0.9411765, 0, 1,
-0.969449, 0.7475774, -0.6338478, 1, 0.9490196, 0, 1,
-0.9677373, -1.602324, -2.367768, 1, 0.9529412, 0, 1,
-0.9540846, -0.7645003, -2.026553, 1, 0.9607843, 0, 1,
-0.9518468, 1.798568, 0.1807985, 1, 0.9647059, 0, 1,
-0.9516698, -0.5199712, -3.337348, 1, 0.972549, 0, 1,
-0.9417545, 0.3463128, -0.3321514, 1, 0.9764706, 0, 1,
-0.9381724, -0.4177683, -4.496678, 1, 0.9843137, 0, 1,
-0.935105, -0.2114503, -2.477962, 1, 0.9882353, 0, 1,
-0.9325532, -1.311861, -2.970859, 1, 0.9960784, 0, 1,
-0.9296078, -0.5979971, -2.695604, 0.9960784, 1, 0, 1,
-0.9280825, -0.2337987, -2.050894, 0.9921569, 1, 0, 1,
-0.920839, 0.4688391, -1.79364, 0.9843137, 1, 0, 1,
-0.910684, 0.1275771, -3.33688, 0.9803922, 1, 0, 1,
-0.9105685, -1.593073, -4.553312, 0.972549, 1, 0, 1,
-0.9043244, -0.5113273, -1.522037, 0.9686275, 1, 0, 1,
-0.9013815, 0.7532342, -2.162678, 0.9607843, 1, 0, 1,
-0.8991516, 0.07101016, -1.946377, 0.9568627, 1, 0, 1,
-0.8920891, -0.7515121, -2.048881, 0.9490196, 1, 0, 1,
-0.8917133, -0.4675887, -2.999657, 0.945098, 1, 0, 1,
-0.8868129, -0.1561961, -2.423216, 0.9372549, 1, 0, 1,
-0.8826177, 0.1338637, -2.550563, 0.9333333, 1, 0, 1,
-0.8819184, -0.5063351, -3.818474, 0.9254902, 1, 0, 1,
-0.8815171, -0.7164686, -4.98603, 0.9215686, 1, 0, 1,
-0.8796766, -0.3814367, -2.106522, 0.9137255, 1, 0, 1,
-0.8783021, -1.001069, -2.202156, 0.9098039, 1, 0, 1,
-0.8767972, -0.1954557, -2.233303, 0.9019608, 1, 0, 1,
-0.8646006, 0.1258867, -1.167618, 0.8941177, 1, 0, 1,
-0.8638281, 0.1097055, -1.11408, 0.8901961, 1, 0, 1,
-0.8623741, 0.3912192, -1.424145, 0.8823529, 1, 0, 1,
-0.860434, -0.872884, -2.569844, 0.8784314, 1, 0, 1,
-0.8562256, -0.7067652, -2.511158, 0.8705882, 1, 0, 1,
-0.8507603, -1.307752, -1.793603, 0.8666667, 1, 0, 1,
-0.8497822, 2.331952, 0.05875186, 0.8588235, 1, 0, 1,
-0.8479433, -0.07105613, -2.796912, 0.854902, 1, 0, 1,
-0.8435443, 0.4460671, -2.084471, 0.8470588, 1, 0, 1,
-0.8426812, -0.3209075, -0.9348028, 0.8431373, 1, 0, 1,
-0.8405319, -0.04357545, -0.9191005, 0.8352941, 1, 0, 1,
-0.8360387, 2.10759, -1.363252, 0.8313726, 1, 0, 1,
-0.8357409, 1.762787, 0.2805698, 0.8235294, 1, 0, 1,
-0.8183696, 1.743645, -0.7126805, 0.8196079, 1, 0, 1,
-0.8120264, -0.551575, -1.961449, 0.8117647, 1, 0, 1,
-0.8119595, 1.599687, -0.7938046, 0.8078431, 1, 0, 1,
-0.806775, 1.276339, 0.1084607, 0.8, 1, 0, 1,
-0.7968366, 2.019838, -0.5163057, 0.7921569, 1, 0, 1,
-0.7939825, -0.500871, -2.566339, 0.7882353, 1, 0, 1,
-0.7923283, -0.9241664, -1.783582, 0.7803922, 1, 0, 1,
-0.7907602, 0.7437569, 0.02903988, 0.7764706, 1, 0, 1,
-0.79009, 0.4437386, 0.9529786, 0.7686275, 1, 0, 1,
-0.7841957, -0.8096939, -2.751322, 0.7647059, 1, 0, 1,
-0.7837248, -0.1549951, -2.498517, 0.7568628, 1, 0, 1,
-0.7803487, 0.2631649, -1.087934, 0.7529412, 1, 0, 1,
-0.7794556, -0.1956203, -0.6429198, 0.7450981, 1, 0, 1,
-0.7758362, -0.3314461, -1.401346, 0.7411765, 1, 0, 1,
-0.7744209, 2.318343, -0.3320985, 0.7333333, 1, 0, 1,
-0.7742245, 0.6985108, -0.0356531, 0.7294118, 1, 0, 1,
-0.7719517, -0.3896744, -2.43583, 0.7215686, 1, 0, 1,
-0.7648749, -0.6305921, -2.048273, 0.7176471, 1, 0, 1,
-0.7582754, 1.01796, -0.9327809, 0.7098039, 1, 0, 1,
-0.7511771, -2.536767, -4.935301, 0.7058824, 1, 0, 1,
-0.74744, -1.86303, -4.126547, 0.6980392, 1, 0, 1,
-0.7459964, -0.8544097, -3.675286, 0.6901961, 1, 0, 1,
-0.7383658, 0.3141418, -0.3809935, 0.6862745, 1, 0, 1,
-0.7383072, -0.7997065, -2.227733, 0.6784314, 1, 0, 1,
-0.7368404, -0.5090746, -2.286714, 0.6745098, 1, 0, 1,
-0.7317663, -1.627314, -2.475596, 0.6666667, 1, 0, 1,
-0.7304921, -0.4532318, -1.258736, 0.6627451, 1, 0, 1,
-0.7293434, 1.893497, -0.0173526, 0.654902, 1, 0, 1,
-0.7201064, 1.299365, -0.3050595, 0.6509804, 1, 0, 1,
-0.708178, -1.827558, -3.856173, 0.6431373, 1, 0, 1,
-0.7042814, 0.1399756, -1.067565, 0.6392157, 1, 0, 1,
-0.7017607, -0.320504, -2.595147, 0.6313726, 1, 0, 1,
-0.7016594, 1.030586, 1.479393, 0.627451, 1, 0, 1,
-0.6940511, 1.221807, -1.201141, 0.6196079, 1, 0, 1,
-0.6918573, 0.03426477, -2.222172, 0.6156863, 1, 0, 1,
-0.6883057, -0.05754428, -1.757303, 0.6078432, 1, 0, 1,
-0.6824862, -1.184495, -3.787011, 0.6039216, 1, 0, 1,
-0.6776552, -1.433623, -3.455696, 0.5960785, 1, 0, 1,
-0.6774166, 0.5464364, -1.0963, 0.5882353, 1, 0, 1,
-0.6736384, -1.01513, -2.608505, 0.5843138, 1, 0, 1,
-0.6734255, -1.007842, -4.656512, 0.5764706, 1, 0, 1,
-0.6703501, -0.3195964, -2.364167, 0.572549, 1, 0, 1,
-0.6681464, -0.0983147, -1.556446, 0.5647059, 1, 0, 1,
-0.666688, 0.2622416, -1.866569, 0.5607843, 1, 0, 1,
-0.6642985, -0.4414413, -1.92457, 0.5529412, 1, 0, 1,
-0.6637496, -0.2282183, -3.331204, 0.5490196, 1, 0, 1,
-0.6624935, 0.6913838, -0.6467662, 0.5411765, 1, 0, 1,
-0.6609285, 1.370696, -0.2880591, 0.5372549, 1, 0, 1,
-0.660621, 0.5956181, -1.211854, 0.5294118, 1, 0, 1,
-0.6600058, -1.237646, -4.258497, 0.5254902, 1, 0, 1,
-0.6578789, 0.9447847, -0.3554272, 0.5176471, 1, 0, 1,
-0.652379, 1.198812, -1.218443, 0.5137255, 1, 0, 1,
-0.6517488, -0.9588927, -2.113383, 0.5058824, 1, 0, 1,
-0.6510912, -0.910071, -2.388582, 0.5019608, 1, 0, 1,
-0.6507441, -0.2059511, -0.9337764, 0.4941176, 1, 0, 1,
-0.6478686, 0.8048286, -2.604427, 0.4862745, 1, 0, 1,
-0.6430911, -0.5871848, -2.948042, 0.4823529, 1, 0, 1,
-0.6411282, 1.241277, -1.364092, 0.4745098, 1, 0, 1,
-0.639897, 2.224313, 0.4497474, 0.4705882, 1, 0, 1,
-0.6375843, -0.7525991, -2.067101, 0.4627451, 1, 0, 1,
-0.6357298, 0.9159907, -1.878586, 0.4588235, 1, 0, 1,
-0.617363, 0.3589595, -1.799785, 0.4509804, 1, 0, 1,
-0.6081303, 0.1576943, -3.18599, 0.4470588, 1, 0, 1,
-0.6073218, -0.4129775, -1.046854, 0.4392157, 1, 0, 1,
-0.6070864, 0.3538431, -0.1075468, 0.4352941, 1, 0, 1,
-0.6048125, -0.1529388, -1.762068, 0.427451, 1, 0, 1,
-0.6025788, 1.16533, -1.608541, 0.4235294, 1, 0, 1,
-0.600585, -0.1483768, -0.6842107, 0.4156863, 1, 0, 1,
-0.5997503, -1.246145, -2.210859, 0.4117647, 1, 0, 1,
-0.5946611, -0.2249819, -1.97003, 0.4039216, 1, 0, 1,
-0.5889947, -1.085838, -2.037005, 0.3960784, 1, 0, 1,
-0.5855765, 0.4292039, -0.007447286, 0.3921569, 1, 0, 1,
-0.5822119, 0.492615, -0.6938517, 0.3843137, 1, 0, 1,
-0.5762144, -1.133377, -1.903458, 0.3803922, 1, 0, 1,
-0.5725214, -0.9251218, -3.933113, 0.372549, 1, 0, 1,
-0.5724174, -1.761364, -3.322636, 0.3686275, 1, 0, 1,
-0.5649333, 0.9901607, -0.02860912, 0.3607843, 1, 0, 1,
-0.5649229, 0.4133828, -0.2209818, 0.3568628, 1, 0, 1,
-0.5610678, -0.4732073, -2.280891, 0.3490196, 1, 0, 1,
-0.5597029, -0.1693268, -2.32353, 0.345098, 1, 0, 1,
-0.5574558, 2.331113, -0.379842, 0.3372549, 1, 0, 1,
-0.5568307, -0.05747196, -2.650288, 0.3333333, 1, 0, 1,
-0.5550275, 1.389289, -0.7940325, 0.3254902, 1, 0, 1,
-0.547192, -0.1616341, -1.29817, 0.3215686, 1, 0, 1,
-0.5402868, -0.9854342, -3.337676, 0.3137255, 1, 0, 1,
-0.5386928, 0.7526525, -0.1172571, 0.3098039, 1, 0, 1,
-0.5384348, -1.425231, -3.783682, 0.3019608, 1, 0, 1,
-0.5353916, 0.2512668, -0.3048501, 0.2941177, 1, 0, 1,
-0.534977, 1.193563, -0.1201345, 0.2901961, 1, 0, 1,
-0.5336806, -0.2207581, -1.919555, 0.282353, 1, 0, 1,
-0.5333685, 0.07805754, -2.089673, 0.2784314, 1, 0, 1,
-0.5271338, -0.2459657, -3.05729, 0.2705882, 1, 0, 1,
-0.526898, 0.2103736, -0.6613625, 0.2666667, 1, 0, 1,
-0.5251157, 0.6337308, -1.066274, 0.2588235, 1, 0, 1,
-0.5231905, -0.1662938, -2.768338, 0.254902, 1, 0, 1,
-0.5194609, -1.779217, -2.084363, 0.2470588, 1, 0, 1,
-0.5188867, -0.603689, -1.371101, 0.2431373, 1, 0, 1,
-0.5183461, 0.6202772, -0.8186419, 0.2352941, 1, 0, 1,
-0.5160444, 0.8476477, -1.140369, 0.2313726, 1, 0, 1,
-0.515693, 0.6692501, -0.360627, 0.2235294, 1, 0, 1,
-0.5135901, -1.378929, -1.18162, 0.2196078, 1, 0, 1,
-0.5122131, 0.3808528, -0.4996983, 0.2117647, 1, 0, 1,
-0.5102835, 1.044383, 0.2251841, 0.2078431, 1, 0, 1,
-0.5079882, 0.8914934, -1.612761, 0.2, 1, 0, 1,
-0.5026725, -2.043571, -1.963892, 0.1921569, 1, 0, 1,
-0.5000932, 1.174549, -1.924604, 0.1882353, 1, 0, 1,
-0.49701, -0.08506426, -2.056356, 0.1803922, 1, 0, 1,
-0.4931951, -2.059495, -3.245635, 0.1764706, 1, 0, 1,
-0.4884249, -2.604101, -3.36815, 0.1686275, 1, 0, 1,
-0.4869974, 0.5138087, -1.02347, 0.1647059, 1, 0, 1,
-0.4859611, -1.067642, -1.749859, 0.1568628, 1, 0, 1,
-0.4840996, 1.022095, -1.49552, 0.1529412, 1, 0, 1,
-0.4791296, 1.31684, 0.0743474, 0.145098, 1, 0, 1,
-0.4718529, -1.06645, -2.383219, 0.1411765, 1, 0, 1,
-0.4716581, -0.2855347, -3.293175, 0.1333333, 1, 0, 1,
-0.4690632, -1.343644, -1.797439, 0.1294118, 1, 0, 1,
-0.4686747, -0.1843103, -2.220349, 0.1215686, 1, 0, 1,
-0.4627609, 0.5150757, -0.2746873, 0.1176471, 1, 0, 1,
-0.4624302, 0.5285845, 0.2470321, 0.1098039, 1, 0, 1,
-0.4530061, -2.983906, -1.805321, 0.1058824, 1, 0, 1,
-0.4527285, -0.764381, -0.4866784, 0.09803922, 1, 0, 1,
-0.4427064, 0.1886292, -2.636298, 0.09019608, 1, 0, 1,
-0.4419032, 0.1664705, -2.044771, 0.08627451, 1, 0, 1,
-0.43974, -0.6212027, -3.589104, 0.07843138, 1, 0, 1,
-0.4392902, 1.022274, -1.816729, 0.07450981, 1, 0, 1,
-0.4374799, -0.0408015, -3.155101, 0.06666667, 1, 0, 1,
-0.431608, 0.1443329, -0.5662016, 0.0627451, 1, 0, 1,
-0.4282462, 0.8060255, -0.01088865, 0.05490196, 1, 0, 1,
-0.4272935, -0.8194342, -3.121284, 0.05098039, 1, 0, 1,
-0.425736, 0.3209372, -1.838521, 0.04313726, 1, 0, 1,
-0.4247916, -0.9048017, -2.005559, 0.03921569, 1, 0, 1,
-0.4235083, -0.8570991, -3.320828, 0.03137255, 1, 0, 1,
-0.4192623, 0.1911479, -0.4229262, 0.02745098, 1, 0, 1,
-0.4174905, -1.550186, -3.010079, 0.01960784, 1, 0, 1,
-0.4145701, 1.104089, 0.2210576, 0.01568628, 1, 0, 1,
-0.4144401, 1.054866, -0.8562664, 0.007843138, 1, 0, 1,
-0.4121364, 1.397997, 1.257323, 0.003921569, 1, 0, 1,
-0.4105875, 0.5036088, 0.3826588, 0, 1, 0.003921569, 1,
-0.4104418, -0.6192254, -3.550572, 0, 1, 0.01176471, 1,
-0.4091614, -0.6600062, -1.354416, 0, 1, 0.01568628, 1,
-0.4081285, -1.959686, -4.204183, 0, 1, 0.02352941, 1,
-0.4061598, -1.588233, -2.217911, 0, 1, 0.02745098, 1,
-0.4031272, -0.6969406, -1.05768, 0, 1, 0.03529412, 1,
-0.3984388, -1.742544, -1.636811, 0, 1, 0.03921569, 1,
-0.3961935, -1.001909, -2.953458, 0, 1, 0.04705882, 1,
-0.396174, -2.268333, -1.280822, 0, 1, 0.05098039, 1,
-0.3961718, 0.7948714, 0.2754385, 0, 1, 0.05882353, 1,
-0.3950432, 1.196061, 2.341067, 0, 1, 0.0627451, 1,
-0.3876356, -0.04889007, -1.458961, 0, 1, 0.07058824, 1,
-0.3853295, -0.2180837, -2.460376, 0, 1, 0.07450981, 1,
-0.3841479, -1.211328, -3.293738, 0, 1, 0.08235294, 1,
-0.3801467, -1.994381, -4.294688, 0, 1, 0.08627451, 1,
-0.3762913, 0.1966034, 0.8595449, 0, 1, 0.09411765, 1,
-0.3750696, -2.367192, -3.480235, 0, 1, 0.1019608, 1,
-0.3749269, 0.8775933, -0.1500486, 0, 1, 0.1058824, 1,
-0.373341, -0.7919115, -3.051735, 0, 1, 0.1137255, 1,
-0.3710691, 2.6335, -0.3113126, 0, 1, 0.1176471, 1,
-0.3662136, -1.450051, -1.613219, 0, 1, 0.1254902, 1,
-0.365074, 1.222911, -0.5814384, 0, 1, 0.1294118, 1,
-0.3631914, 1.130292, 0.9700918, 0, 1, 0.1372549, 1,
-0.3622125, -0.5731207, -3.496477, 0, 1, 0.1411765, 1,
-0.3601933, 1.313712, -1.165621, 0, 1, 0.1490196, 1,
-0.3555142, -1.250139, -3.849698, 0, 1, 0.1529412, 1,
-0.3542428, 0.1013398, -1.85686, 0, 1, 0.1607843, 1,
-0.3540508, 0.9814457, -0.9707676, 0, 1, 0.1647059, 1,
-0.3537026, -1.731618, -2.7997, 0, 1, 0.172549, 1,
-0.3536569, 0.9587753, -0.1481272, 0, 1, 0.1764706, 1,
-0.3491683, -0.01469992, -2.709897, 0, 1, 0.1843137, 1,
-0.3487928, 0.9988561, 0.3677942, 0, 1, 0.1882353, 1,
-0.3442475, 0.4941192, -0.8558868, 0, 1, 0.1960784, 1,
-0.343956, -0.1857843, -2.935855, 0, 1, 0.2039216, 1,
-0.339106, -1.133192, -3.832298, 0, 1, 0.2078431, 1,
-0.3348354, 0.6066031, -0.03034436, 0, 1, 0.2156863, 1,
-0.3338713, 0.8188352, -0.6247345, 0, 1, 0.2196078, 1,
-0.3318262, -0.09554294, -2.72973, 0, 1, 0.227451, 1,
-0.331224, -0.03854494, -0.9430896, 0, 1, 0.2313726, 1,
-0.3307876, -0.535746, -2.827741, 0, 1, 0.2392157, 1,
-0.3302985, -0.7499231, -2.844436, 0, 1, 0.2431373, 1,
-0.3285078, -0.2469016, -2.660169, 0, 1, 0.2509804, 1,
-0.3280931, 0.7829257, 0.3682572, 0, 1, 0.254902, 1,
-0.324582, 1.345897, 0.823214, 0, 1, 0.2627451, 1,
-0.3235542, 0.4924951, -2.036726, 0, 1, 0.2666667, 1,
-0.3218094, -0.9983873, -0.4104422, 0, 1, 0.2745098, 1,
-0.3175219, 1.919047, 0.05304233, 0, 1, 0.2784314, 1,
-0.316846, -0.03792148, 0.08531554, 0, 1, 0.2862745, 1,
-0.3166529, -0.3523094, -3.029863, 0, 1, 0.2901961, 1,
-0.3163621, 0.01535291, -2.177409, 0, 1, 0.2980392, 1,
-0.3157476, -0.635049, -4.178074, 0, 1, 0.3058824, 1,
-0.3153964, 0.2100777, -0.0920633, 0, 1, 0.3098039, 1,
-0.3132791, -0.5838093, -2.579689, 0, 1, 0.3176471, 1,
-0.3124705, 0.5057404, 0.8195962, 0, 1, 0.3215686, 1,
-0.30868, -0.3576953, -2.314516, 0, 1, 0.3294118, 1,
-0.3070887, 0.6193959, 0.8102184, 0, 1, 0.3333333, 1,
-0.3065372, -0.3411783, -1.710119, 0, 1, 0.3411765, 1,
-0.3054884, -1.221483, -2.353835, 0, 1, 0.345098, 1,
-0.2975274, -1.481207, -2.294538, 0, 1, 0.3529412, 1,
-0.2938263, 0.3693983, 0.653019, 0, 1, 0.3568628, 1,
-0.293027, -0.9981505, -3.108451, 0, 1, 0.3647059, 1,
-0.2929609, 0.5703807, -0.6573533, 0, 1, 0.3686275, 1,
-0.2867664, -0.08889728, -0.7498787, 0, 1, 0.3764706, 1,
-0.276868, 0.5583902, 0.05237353, 0, 1, 0.3803922, 1,
-0.270959, -0.7762662, -1.609564, 0, 1, 0.3882353, 1,
-0.2692075, 0.1255106, -3.071708, 0, 1, 0.3921569, 1,
-0.2657139, 1.063127, -0.7040308, 0, 1, 0.4, 1,
-0.2637322, 0.4116512, -1.744535, 0, 1, 0.4078431, 1,
-0.2621162, -1.833102, -3.726447, 0, 1, 0.4117647, 1,
-0.2609177, 0.8773103, -0.8425264, 0, 1, 0.4196078, 1,
-0.2589381, 1.444831, -1.202047, 0, 1, 0.4235294, 1,
-0.2586896, 0.2572162, -1.505757, 0, 1, 0.4313726, 1,
-0.2573469, -1.326935, -2.081344, 0, 1, 0.4352941, 1,
-0.2567335, 2.083765, 0.9952834, 0, 1, 0.4431373, 1,
-0.2546794, 0.2134518, -0.7772501, 0, 1, 0.4470588, 1,
-0.2517213, -0.1060873, -1.922691, 0, 1, 0.454902, 1,
-0.251439, -0.1995663, -3.318849, 0, 1, 0.4588235, 1,
-0.251131, -0.8245302, -3.831839, 0, 1, 0.4666667, 1,
-0.2479426, -0.08968359, -1.553596, 0, 1, 0.4705882, 1,
-0.2476237, 1.462866, 1.246789, 0, 1, 0.4784314, 1,
-0.2472012, 0.2124807, -1.593802, 0, 1, 0.4823529, 1,
-0.2442585, -0.6968032, -3.268764, 0, 1, 0.4901961, 1,
-0.2392052, -0.5215533, -3.63873, 0, 1, 0.4941176, 1,
-0.233592, -1.139013, -2.74847, 0, 1, 0.5019608, 1,
-0.2322119, 1.215831, -0.1565818, 0, 1, 0.509804, 1,
-0.2310429, 1.210685, -0.01120043, 0, 1, 0.5137255, 1,
-0.2302188, -0.7712553, -2.920602, 0, 1, 0.5215687, 1,
-0.2280901, -0.003796258, -2.680684, 0, 1, 0.5254902, 1,
-0.2230474, -0.7083855, -0.8944515, 0, 1, 0.5333334, 1,
-0.2230447, 3.296653, -1.342035, 0, 1, 0.5372549, 1,
-0.2216238, 0.313578, -1.933335, 0, 1, 0.5450981, 1,
-0.2193626, 1.141273, 0.7350764, 0, 1, 0.5490196, 1,
-0.2139168, -1.528194, -3.244513, 0, 1, 0.5568628, 1,
-0.2116583, 1.269195, 0.9123569, 0, 1, 0.5607843, 1,
-0.2097121, 0.2901445, -1.143062, 0, 1, 0.5686275, 1,
-0.2022042, 0.8623606, -0.767687, 0, 1, 0.572549, 1,
-0.1972892, -1.080784, -2.076894, 0, 1, 0.5803922, 1,
-0.1964368, -1.236981, -1.002452, 0, 1, 0.5843138, 1,
-0.1963804, 0.03327141, -1.987749, 0, 1, 0.5921569, 1,
-0.1958979, 0.5195002, -0.05275324, 0, 1, 0.5960785, 1,
-0.1952236, 0.7450753, -1.388841, 0, 1, 0.6039216, 1,
-0.1929468, -0.1429069, -1.50085, 0, 1, 0.6117647, 1,
-0.1897894, -0.6979556, -4.44276, 0, 1, 0.6156863, 1,
-0.189409, 0.7430608, 0.2628752, 0, 1, 0.6235294, 1,
-0.1888511, -0.1497946, -2.839114, 0, 1, 0.627451, 1,
-0.1868147, -0.8410813, -3.657111, 0, 1, 0.6352941, 1,
-0.1853935, 1.548325, -0.1617226, 0, 1, 0.6392157, 1,
-0.185044, 2.22027, 1.732161, 0, 1, 0.6470588, 1,
-0.1825383, 1.390414, 0.8231102, 0, 1, 0.6509804, 1,
-0.1818047, 0.05630989, -1.805382, 0, 1, 0.6588235, 1,
-0.1813238, 1.034197, 0.6535082, 0, 1, 0.6627451, 1,
-0.1784389, -0.3660071, -4.117379, 0, 1, 0.6705883, 1,
-0.1776484, -1.374834, -3.774273, 0, 1, 0.6745098, 1,
-0.175171, -0.1726983, -3.849756, 0, 1, 0.682353, 1,
-0.1745089, 0.0601294, -0.7841218, 0, 1, 0.6862745, 1,
-0.174288, 1.612208, -0.2663961, 0, 1, 0.6941177, 1,
-0.1718215, -0.8029186, -0.742174, 0, 1, 0.7019608, 1,
-0.1688249, 0.4957303, 0.8685462, 0, 1, 0.7058824, 1,
-0.163534, 0.294901, -1.317845, 0, 1, 0.7137255, 1,
-0.1631425, -1.767183, -0.3740155, 0, 1, 0.7176471, 1,
-0.1625705, 0.7207843, -0.5973678, 0, 1, 0.7254902, 1,
-0.1612314, 0.01476748, -2.647166, 0, 1, 0.7294118, 1,
-0.1589526, -1.034194, -2.237628, 0, 1, 0.7372549, 1,
-0.1540757, 0.2896289, -2.158714, 0, 1, 0.7411765, 1,
-0.146332, 0.3600509, -1.504917, 0, 1, 0.7490196, 1,
-0.1439997, -1.015652, -3.343594, 0, 1, 0.7529412, 1,
-0.1436949, -0.8444602, -4.089884, 0, 1, 0.7607843, 1,
-0.1372267, -0.606594, -4.909064, 0, 1, 0.7647059, 1,
-0.1308282, 2.068972, 0.3024981, 0, 1, 0.772549, 1,
-0.1303035, 1.102144, -0.2631215, 0, 1, 0.7764706, 1,
-0.1299238, 0.3156704, 0.0370217, 0, 1, 0.7843137, 1,
-0.1297918, 0.01459982, -2.82726, 0, 1, 0.7882353, 1,
-0.1275906, -1.540671, -1.194295, 0, 1, 0.7960784, 1,
-0.1244965, 0.4999827, -0.895442, 0, 1, 0.8039216, 1,
-0.123769, -1.219501, -2.979203, 0, 1, 0.8078431, 1,
-0.1216947, -0.4649662, -1.894551, 0, 1, 0.8156863, 1,
-0.1212299, -0.9234035, -3.519499, 0, 1, 0.8196079, 1,
-0.1185516, 0.7397206, -0.9494194, 0, 1, 0.827451, 1,
-0.11751, -1.398335, -1.84755, 0, 1, 0.8313726, 1,
-0.1148854, 0.2538535, 0.4322439, 0, 1, 0.8392157, 1,
-0.1083182, -0.480738, -3.720354, 0, 1, 0.8431373, 1,
-0.1081529, -1.433004, -1.892388, 0, 1, 0.8509804, 1,
-0.1038551, 0.08587366, 1.230871, 0, 1, 0.854902, 1,
-0.103011, 0.1893042, -1.116597, 0, 1, 0.8627451, 1,
-0.09963578, 0.8462352, -1.225735, 0, 1, 0.8666667, 1,
-0.08630204, -0.5972524, -1.603354, 0, 1, 0.8745098, 1,
-0.0848433, 1.018685, 0.9580781, 0, 1, 0.8784314, 1,
-0.08377863, -0.7677491, -2.559632, 0, 1, 0.8862745, 1,
-0.08341359, 0.2215643, -0.1855865, 0, 1, 0.8901961, 1,
-0.08315387, -0.6883849, -4.85589, 0, 1, 0.8980392, 1,
-0.08212584, -1.389692, -3.067718, 0, 1, 0.9058824, 1,
-0.08019265, 0.8832273, 0.2826082, 0, 1, 0.9098039, 1,
-0.07664216, -0.7347665, -4.095644, 0, 1, 0.9176471, 1,
-0.07355922, -0.2301387, -4.130196, 0, 1, 0.9215686, 1,
-0.0675368, 0.9294536, -1.052035, 0, 1, 0.9294118, 1,
-0.05832666, 0.7004153, -1.646493, 0, 1, 0.9333333, 1,
-0.05483859, 0.0888527, -0.5415518, 0, 1, 0.9411765, 1,
-0.05097073, 0.4930131, 2.824263, 0, 1, 0.945098, 1,
-0.04931574, -0.8267418, -3.665402, 0, 1, 0.9529412, 1,
-0.04446495, 1.942266, -0.3968402, 0, 1, 0.9568627, 1,
-0.04258787, 0.6608068, -0.8473253, 0, 1, 0.9647059, 1,
-0.04246882, -1.540404, -2.93227, 0, 1, 0.9686275, 1,
-0.04215766, -1.432246, -1.23313, 0, 1, 0.9764706, 1,
-0.04152088, -1.845756, -2.032739, 0, 1, 0.9803922, 1,
-0.03868658, 0.8604513, 1.556251, 0, 1, 0.9882353, 1,
-0.03862682, -1.309039, -2.590802, 0, 1, 0.9921569, 1,
-0.03731615, 0.3181784, 2.58363, 0, 1, 1, 1,
-0.03371828, 1.083951, 1.43965, 0, 0.9921569, 1, 1,
-0.0328634, -0.440608, -3.751259, 0, 0.9882353, 1, 1,
-0.03184016, -0.381391, -1.89573, 0, 0.9803922, 1, 1,
-0.03033463, 1.312715, -0.3656906, 0, 0.9764706, 1, 1,
-0.02764528, -0.01656498, -2.457615, 0, 0.9686275, 1, 1,
-0.02550896, -0.4696531, -2.851738, 0, 0.9647059, 1, 1,
-0.02378, 0.1632714, 1.284809, 0, 0.9568627, 1, 1,
-0.02197843, -0.2200092, -1.924185, 0, 0.9529412, 1, 1,
-0.02098581, 1.647831, 1.180248, 0, 0.945098, 1, 1,
-0.01946697, -0.1101668, -4.171129, 0, 0.9411765, 1, 1,
-0.01464274, 1.1007, -1.203357, 0, 0.9333333, 1, 1,
-0.008792522, -0.5498071, -4.57794, 0, 0.9294118, 1, 1,
-0.004134081, -0.5901392, -3.33105, 0, 0.9215686, 1, 1,
-0.000708387, 0.0420131, 0.4367349, 0, 0.9176471, 1, 1,
0.001036982, 1.698164, -0.6346126, 0, 0.9098039, 1, 1,
0.002198437, -1.46681, 2.782606, 0, 0.9058824, 1, 1,
0.00684024, -1.447502, 3.827297, 0, 0.8980392, 1, 1,
0.007278511, 0.4278834, -0.4142742, 0, 0.8901961, 1, 1,
0.00764402, 1.901137, 1.295436, 0, 0.8862745, 1, 1,
0.007749985, 1.139679, 0.6311706, 0, 0.8784314, 1, 1,
0.01100768, -1.23314, 4.27854, 0, 0.8745098, 1, 1,
0.01150185, 0.9423352, 1.039014, 0, 0.8666667, 1, 1,
0.01511709, -0.6968564, 2.602981, 0, 0.8627451, 1, 1,
0.01525163, -0.1264841, 2.498812, 0, 0.854902, 1, 1,
0.01778023, 1.01269, -1.542581, 0, 0.8509804, 1, 1,
0.01983234, -0.08828925, 0.8341799, 0, 0.8431373, 1, 1,
0.02115012, 0.006971094, 1.231671, 0, 0.8392157, 1, 1,
0.03427225, -0.01134334, 3.055735, 0, 0.8313726, 1, 1,
0.03564687, -2.221948, 1.065408, 0, 0.827451, 1, 1,
0.04833197, 2.199544, 1.010221, 0, 0.8196079, 1, 1,
0.05519348, -0.1408138, 2.507679, 0, 0.8156863, 1, 1,
0.05707911, -0.1993504, 2.58941, 0, 0.8078431, 1, 1,
0.06189633, 1.24835, -0.6827686, 0, 0.8039216, 1, 1,
0.06373458, 0.7515064, 1.56114, 0, 0.7960784, 1, 1,
0.06392332, -1.131939, 3.008717, 0, 0.7882353, 1, 1,
0.06813655, -1.1091, 4.087637, 0, 0.7843137, 1, 1,
0.06909036, -0.2969398, 2.778635, 0, 0.7764706, 1, 1,
0.06938564, -0.007167086, 1.536106, 0, 0.772549, 1, 1,
0.07016667, -0.3411715, 3.055319, 0, 0.7647059, 1, 1,
0.07324712, -0.8303953, 1.269681, 0, 0.7607843, 1, 1,
0.07517179, -0.4908471, 2.499552, 0, 0.7529412, 1, 1,
0.07743705, 1.056465, -0.6593276, 0, 0.7490196, 1, 1,
0.07852709, 0.4286558, 1.22998, 0, 0.7411765, 1, 1,
0.07856267, -0.5036376, 2.158865, 0, 0.7372549, 1, 1,
0.07989139, -0.8066227, 2.273774, 0, 0.7294118, 1, 1,
0.08119886, 1.392048, 0.1082762, 0, 0.7254902, 1, 1,
0.08228478, 1.222025, 0.2601652, 0, 0.7176471, 1, 1,
0.08339936, 1.019589, 0.2423899, 0, 0.7137255, 1, 1,
0.08685172, -2.299477, 2.990431, 0, 0.7058824, 1, 1,
0.0871407, 1.677734, 0.1252814, 0, 0.6980392, 1, 1,
0.08787818, -1.933135, 2.323327, 0, 0.6941177, 1, 1,
0.08946376, -0.5910031, 3.712263, 0, 0.6862745, 1, 1,
0.09263548, -0.5574282, 2.161051, 0, 0.682353, 1, 1,
0.09326801, -0.01727407, 2.495415, 0, 0.6745098, 1, 1,
0.09404422, -0.6421534, 4.169888, 0, 0.6705883, 1, 1,
0.09873826, 0.1230972, 0.6536201, 0, 0.6627451, 1, 1,
0.1001426, -0.9714136, 3.424401, 0, 0.6588235, 1, 1,
0.1001865, -0.1756027, 2.115197, 0, 0.6509804, 1, 1,
0.1136572, 0.7310734, 0.830663, 0, 0.6470588, 1, 1,
0.1172852, -0.1047423, 1.820186, 0, 0.6392157, 1, 1,
0.1208362, 0.3560286, -0.104051, 0, 0.6352941, 1, 1,
0.1237892, 1.173199, -0.8191791, 0, 0.627451, 1, 1,
0.1239388, -0.6964682, 2.888271, 0, 0.6235294, 1, 1,
0.1256582, -0.1412995, 1.427839, 0, 0.6156863, 1, 1,
0.1256689, 0.08458978, 1.548096, 0, 0.6117647, 1, 1,
0.1263259, 0.6801987, 0.5079145, 0, 0.6039216, 1, 1,
0.135259, -0.3472876, 2.761039, 0, 0.5960785, 1, 1,
0.1354075, 0.681246, -0.183002, 0, 0.5921569, 1, 1,
0.1408218, -0.09443431, 1.8159, 0, 0.5843138, 1, 1,
0.1433175, -0.1392849, 3.521595, 0, 0.5803922, 1, 1,
0.1435736, 1.179273, 0.3945598, 0, 0.572549, 1, 1,
0.1437859, -2.278072, 2.392148, 0, 0.5686275, 1, 1,
0.1450001, -0.3281615, 2.688641, 0, 0.5607843, 1, 1,
0.1450261, 0.5329267, 1.098465, 0, 0.5568628, 1, 1,
0.1454615, -1.242092, 3.24649, 0, 0.5490196, 1, 1,
0.1454895, -0.3966257, 3.162839, 0, 0.5450981, 1, 1,
0.1475416, 0.6954305, 0.09477263, 0, 0.5372549, 1, 1,
0.1477861, 0.7865664, 0.3288963, 0, 0.5333334, 1, 1,
0.1562789, 1.54234, 1.380288, 0, 0.5254902, 1, 1,
0.1565019, 0.7792417, 1.241859, 0, 0.5215687, 1, 1,
0.1573087, -0.7181725, 1.666098, 0, 0.5137255, 1, 1,
0.1654903, 1.937184, 0.7127665, 0, 0.509804, 1, 1,
0.1706532, 0.9217865, 0.2860328, 0, 0.5019608, 1, 1,
0.1723767, 1.074956, -1.03946, 0, 0.4941176, 1, 1,
0.1727534, 0.08817039, 2.571609, 0, 0.4901961, 1, 1,
0.1758581, -0.09012986, 2.709826, 0, 0.4823529, 1, 1,
0.1777011, -0.005142515, 2.357265, 0, 0.4784314, 1, 1,
0.1801421, 0.7828216, -0.1439861, 0, 0.4705882, 1, 1,
0.1822673, -1.571837, 2.744312, 0, 0.4666667, 1, 1,
0.1847363, 0.6203456, -0.1283288, 0, 0.4588235, 1, 1,
0.18534, -0.4846812, 3.38732, 0, 0.454902, 1, 1,
0.1867149, 0.1021875, -1.247509, 0, 0.4470588, 1, 1,
0.186787, -1.391653, 3.370348, 0, 0.4431373, 1, 1,
0.1906692, -0.9745489, 2.734032, 0, 0.4352941, 1, 1,
0.1918328, -0.4767031, 3.560836, 0, 0.4313726, 1, 1,
0.1926117, -0.8671931, 1.752799, 0, 0.4235294, 1, 1,
0.1940536, -0.5132489, 3.418357, 0, 0.4196078, 1, 1,
0.19464, 0.8311929, -0.8599352, 0, 0.4117647, 1, 1,
0.1972509, -0.911535, 2.183425, 0, 0.4078431, 1, 1,
0.1972862, 0.1849779, 0.3323447, 0, 0.4, 1, 1,
0.1975213, 0.5859507, 0.6751071, 0, 0.3921569, 1, 1,
0.1983593, -0.4028589, 2.585399, 0, 0.3882353, 1, 1,
0.2032616, 1.139328, -1.014829, 0, 0.3803922, 1, 1,
0.2066234, -1.444008, 2.329322, 0, 0.3764706, 1, 1,
0.2082902, -0.4879856, 3.666418, 0, 0.3686275, 1, 1,
0.2089387, -0.1915929, 2.31758, 0, 0.3647059, 1, 1,
0.2116929, -1.283298, 1.335017, 0, 0.3568628, 1, 1,
0.2139558, 1.526506, 0.7026445, 0, 0.3529412, 1, 1,
0.2172754, -0.6233726, 3.892895, 0, 0.345098, 1, 1,
0.2211205, -0.06305398, 2.873042, 0, 0.3411765, 1, 1,
0.2260813, -1.668187, 1.504673, 0, 0.3333333, 1, 1,
0.2261294, 0.5421001, 0.5098504, 0, 0.3294118, 1, 1,
0.2269209, -2.379962, 1.786611, 0, 0.3215686, 1, 1,
0.2292934, -0.7854741, 1.073705, 0, 0.3176471, 1, 1,
0.2306362, -0.3718648, 3.967369, 0, 0.3098039, 1, 1,
0.2317641, 1.646368, -0.4434937, 0, 0.3058824, 1, 1,
0.233206, -1.191122, 2.407566, 0, 0.2980392, 1, 1,
0.2470662, 1.579524, -1.046894, 0, 0.2901961, 1, 1,
0.2472132, -0.7750155, 2.768384, 0, 0.2862745, 1, 1,
0.2613695, 0.1839386, 1.114323, 0, 0.2784314, 1, 1,
0.2619087, 1.324027, -0.7032352, 0, 0.2745098, 1, 1,
0.2639947, 2.169788, -1.413764, 0, 0.2666667, 1, 1,
0.2693097, -0.2381545, 1.299309, 0, 0.2627451, 1, 1,
0.2719269, -0.9905895, 3.521383, 0, 0.254902, 1, 1,
0.2770908, 1.354394, -0.0212855, 0, 0.2509804, 1, 1,
0.2789519, 0.2020899, 0.05740864, 0, 0.2431373, 1, 1,
0.2856742, 0.6259732, 0.8240186, 0, 0.2392157, 1, 1,
0.2869662, 0.7835392, 1.934769, 0, 0.2313726, 1, 1,
0.287579, 0.1270171, 0.9464956, 0, 0.227451, 1, 1,
0.2921209, -0.2415776, 1.162207, 0, 0.2196078, 1, 1,
0.2930211, 0.02574017, 0.7638785, 0, 0.2156863, 1, 1,
0.294564, 0.5859885, 1.876493, 0, 0.2078431, 1, 1,
0.2959263, 0.6940669, -0.8056034, 0, 0.2039216, 1, 1,
0.3001179, 0.2556137, -0.5501003, 0, 0.1960784, 1, 1,
0.300435, 1.42614, -0.5929273, 0, 0.1882353, 1, 1,
0.3006765, 1.311084, -0.008859788, 0, 0.1843137, 1, 1,
0.302904, 1.560385, 1.238908, 0, 0.1764706, 1, 1,
0.306495, -0.1010122, 3.66938, 0, 0.172549, 1, 1,
0.3121062, 1.36745, 1.1366, 0, 0.1647059, 1, 1,
0.3121633, -0.2009316, 3.724482, 0, 0.1607843, 1, 1,
0.3138382, -0.3552824, 1.880284, 0, 0.1529412, 1, 1,
0.3187343, 0.5298145, -0.9751382, 0, 0.1490196, 1, 1,
0.3258449, 0.6137837, 0.792564, 0, 0.1411765, 1, 1,
0.3277718, -0.06078306, 2.426234, 0, 0.1372549, 1, 1,
0.3354831, 0.5561282, 1.89569, 0, 0.1294118, 1, 1,
0.3391286, -1.427102, 3.630869, 0, 0.1254902, 1, 1,
0.33999, -1.318461, 2.484962, 0, 0.1176471, 1, 1,
0.3434713, -0.536903, 1.599946, 0, 0.1137255, 1, 1,
0.3444471, 0.1121043, -0.2938818, 0, 0.1058824, 1, 1,
0.3496719, -0.4605482, 2.869181, 0, 0.09803922, 1, 1,
0.3518426, -0.1933442, 1.987158, 0, 0.09411765, 1, 1,
0.3522243, 0.4180317, -0.1097236, 0, 0.08627451, 1, 1,
0.3544089, 1.256453, -0.987734, 0, 0.08235294, 1, 1,
0.3554059, -0.06168713, 1.140628, 0, 0.07450981, 1, 1,
0.3557976, -0.4321708, 2.353877, 0, 0.07058824, 1, 1,
0.3559098, 0.6336244, 1.056998, 0, 0.0627451, 1, 1,
0.3601086, 1.806937, 1.232291, 0, 0.05882353, 1, 1,
0.3627656, 1.617435, -0.4159582, 0, 0.05098039, 1, 1,
0.362848, 0.7501276, -0.5493364, 0, 0.04705882, 1, 1,
0.3643349, -1.36605, 1.124632, 0, 0.03921569, 1, 1,
0.3722058, 0.6397951, 0.08512273, 0, 0.03529412, 1, 1,
0.3740311, 0.8111404, 0.9225801, 0, 0.02745098, 1, 1,
0.3786649, 0.6422648, 0.1898025, 0, 0.02352941, 1, 1,
0.382977, -0.3412611, 2.048901, 0, 0.01568628, 1, 1,
0.3852043, 0.6997185, 1.446997, 0, 0.01176471, 1, 1,
0.3888506, -0.4753595, 3.812922, 0, 0.003921569, 1, 1,
0.3890738, 0.4858938, -0.9926094, 0.003921569, 0, 1, 1,
0.3890789, -0.1566117, 0.9557899, 0.007843138, 0, 1, 1,
0.3897728, 0.4081161, -0.1494791, 0.01568628, 0, 1, 1,
0.3974877, -0.6995526, 3.165067, 0.01960784, 0, 1, 1,
0.4017404, -1.054594, 2.267634, 0.02745098, 0, 1, 1,
0.4018126, -1.188732, 2.8859, 0.03137255, 0, 1, 1,
0.409863, 0.1905084, 0.2700146, 0.03921569, 0, 1, 1,
0.4119449, -0.4645934, 3.366976, 0.04313726, 0, 1, 1,
0.4199124, -1.579361, 3.723908, 0.05098039, 0, 1, 1,
0.4201648, -0.0871864, 1.774096, 0.05490196, 0, 1, 1,
0.4203315, 1.72954, -1.128778, 0.0627451, 0, 1, 1,
0.424643, 0.4190682, 1.484508, 0.06666667, 0, 1, 1,
0.4279456, -2.047715, 1.741882, 0.07450981, 0, 1, 1,
0.4290025, -0.696579, 2.754474, 0.07843138, 0, 1, 1,
0.4338358, 1.249219, 0.6739697, 0.08627451, 0, 1, 1,
0.4371302, -0.7137888, 3.033865, 0.09019608, 0, 1, 1,
0.4377374, -1.56421, 1.718075, 0.09803922, 0, 1, 1,
0.4448554, -1.226388, 2.762257, 0.1058824, 0, 1, 1,
0.4452974, -0.1010849, 0.9999831, 0.1098039, 0, 1, 1,
0.445914, -0.7117385, 3.245346, 0.1176471, 0, 1, 1,
0.4461795, -0.6854061, 2.170581, 0.1215686, 0, 1, 1,
0.4463565, 1.563119, 0.3254077, 0.1294118, 0, 1, 1,
0.450942, -1.513645, 3.46989, 0.1333333, 0, 1, 1,
0.4537611, -0.8969793, 3.287082, 0.1411765, 0, 1, 1,
0.4539357, -0.4116483, 2.291242, 0.145098, 0, 1, 1,
0.4556903, -0.01491618, 1.825511, 0.1529412, 0, 1, 1,
0.4564027, -0.04359482, 2.701422, 0.1568628, 0, 1, 1,
0.4580521, -1.120337, 1.707922, 0.1647059, 0, 1, 1,
0.4603986, -1.67975, 2.130792, 0.1686275, 0, 1, 1,
0.4631249, 1.534582, 0.370453, 0.1764706, 0, 1, 1,
0.4647266, -0.4386664, 3.957506, 0.1803922, 0, 1, 1,
0.4660387, 1.274311, 0.05879012, 0.1882353, 0, 1, 1,
0.4692214, 0.5325074, -0.4711241, 0.1921569, 0, 1, 1,
0.4709806, 1.758377, 1.126277, 0.2, 0, 1, 1,
0.4751427, -0.5208506, 2.483328, 0.2078431, 0, 1, 1,
0.4752651, 1.357092, 1.125501, 0.2117647, 0, 1, 1,
0.476306, 1.357482, 1.704492, 0.2196078, 0, 1, 1,
0.4768729, -0.6127962, 2.595554, 0.2235294, 0, 1, 1,
0.4817336, -0.203082, 1.662, 0.2313726, 0, 1, 1,
0.4840876, -1.212424, 4.420537, 0.2352941, 0, 1, 1,
0.4946707, 0.8800784, 0.7116871, 0.2431373, 0, 1, 1,
0.4948944, -1.111537, 2.520598, 0.2470588, 0, 1, 1,
0.4965544, -0.2137652, 1.303841, 0.254902, 0, 1, 1,
0.4973317, 0.7566572, 0.921597, 0.2588235, 0, 1, 1,
0.4988033, -0.7811061, 1.840287, 0.2666667, 0, 1, 1,
0.5015854, -0.7275015, 2.05545, 0.2705882, 0, 1, 1,
0.5029476, -0.7373877, 2.826221, 0.2784314, 0, 1, 1,
0.5051824, -1.331732, 2.620093, 0.282353, 0, 1, 1,
0.5092608, -0.3047808, 1.880031, 0.2901961, 0, 1, 1,
0.509788, -0.4224615, 3.822404, 0.2941177, 0, 1, 1,
0.5129389, 1.219167, 0.8041769, 0.3019608, 0, 1, 1,
0.5140592, -0.6715618, 1.645034, 0.3098039, 0, 1, 1,
0.5177119, -1.625614, 3.244013, 0.3137255, 0, 1, 1,
0.5207298, 0.3120019, -0.1129862, 0.3215686, 0, 1, 1,
0.5241719, -0.8442065, 4.165702, 0.3254902, 0, 1, 1,
0.5246429, -1.0491, 3.281894, 0.3333333, 0, 1, 1,
0.5253703, 2.249986, 0.9070893, 0.3372549, 0, 1, 1,
0.5337108, -1.103457, 3.63615, 0.345098, 0, 1, 1,
0.5396698, 0.6381896, 1.573343, 0.3490196, 0, 1, 1,
0.5410813, -1.165981, 2.549799, 0.3568628, 0, 1, 1,
0.5426616, 0.5408601, 0.9762375, 0.3607843, 0, 1, 1,
0.5437739, 0.9952053, -0.3957737, 0.3686275, 0, 1, 1,
0.5453396, -0.5832172, 2.143259, 0.372549, 0, 1, 1,
0.5463375, -1.910061, 2.874815, 0.3803922, 0, 1, 1,
0.5523375, -1.432533, 4.354306, 0.3843137, 0, 1, 1,
0.5574501, -0.8029361, 2.080844, 0.3921569, 0, 1, 1,
0.5658474, 1.321196, 0.6322422, 0.3960784, 0, 1, 1,
0.5689687, -1.599621, 2.840439, 0.4039216, 0, 1, 1,
0.5821465, 1.824685, -0.4827996, 0.4117647, 0, 1, 1,
0.5867018, -0.335376, 2.134479, 0.4156863, 0, 1, 1,
0.5875171, 0.3753278, 1.203395, 0.4235294, 0, 1, 1,
0.5896429, 0.2202993, 0.2307058, 0.427451, 0, 1, 1,
0.5896483, 1.127887, 0.8333603, 0.4352941, 0, 1, 1,
0.5947006, -0.619137, 1.989676, 0.4392157, 0, 1, 1,
0.5954772, -0.3380349, 0.9417732, 0.4470588, 0, 1, 1,
0.5976389, -0.6562081, 1.792157, 0.4509804, 0, 1, 1,
0.5992132, -0.5660911, 3.05599, 0.4588235, 0, 1, 1,
0.6000115, -0.06249549, 2.471492, 0.4627451, 0, 1, 1,
0.6025387, 1.290328, 0.764857, 0.4705882, 0, 1, 1,
0.6043091, -0.5398011, 2.896139, 0.4745098, 0, 1, 1,
0.6058786, -0.09376589, 1.701006, 0.4823529, 0, 1, 1,
0.6094954, -0.645087, 2.299426, 0.4862745, 0, 1, 1,
0.609551, -0.4626726, 1.942436, 0.4941176, 0, 1, 1,
0.6113198, 0.6777539, 2.617984, 0.5019608, 0, 1, 1,
0.6173942, 0.9005029, -0.261737, 0.5058824, 0, 1, 1,
0.619793, 0.0322786, 2.271383, 0.5137255, 0, 1, 1,
0.6217319, 0.1528078, 1.407091, 0.5176471, 0, 1, 1,
0.6305526, 0.7435318, 3.700072, 0.5254902, 0, 1, 1,
0.6305993, -1.320047, 2.894724, 0.5294118, 0, 1, 1,
0.6319996, 0.5410354, 1.119151, 0.5372549, 0, 1, 1,
0.6372571, -0.1253303, 0.8534771, 0.5411765, 0, 1, 1,
0.6398011, -0.82684, 4.54693, 0.5490196, 0, 1, 1,
0.6427555, 0.04490205, 1.357599, 0.5529412, 0, 1, 1,
0.6581342, 0.03672882, 1.420274, 0.5607843, 0, 1, 1,
0.6583026, -0.5562057, 4.361879, 0.5647059, 0, 1, 1,
0.6590746, 0.03858106, 1.67634, 0.572549, 0, 1, 1,
0.6619955, 0.1094981, 0.4319819, 0.5764706, 0, 1, 1,
0.663756, -0.8569561, 4.364881, 0.5843138, 0, 1, 1,
0.6649355, 0.4527726, 1.508887, 0.5882353, 0, 1, 1,
0.6676567, -0.07808864, 1.061637, 0.5960785, 0, 1, 1,
0.669478, -0.4951674, 1.69013, 0.6039216, 0, 1, 1,
0.6704394, 1.199948, 0.2820741, 0.6078432, 0, 1, 1,
0.6719642, 0.04005026, 0.8783376, 0.6156863, 0, 1, 1,
0.6726539, 0.3406354, 1.348805, 0.6196079, 0, 1, 1,
0.67572, -2.585794, 0.5898982, 0.627451, 0, 1, 1,
0.6842191, -1.98012, 3.038939, 0.6313726, 0, 1, 1,
0.6859852, -0.348332, 1.217151, 0.6392157, 0, 1, 1,
0.6910644, -1.261666, 2.678752, 0.6431373, 0, 1, 1,
0.6920205, 0.06735543, 1.198274, 0.6509804, 0, 1, 1,
0.6937557, 1.681387, -0.3758247, 0.654902, 0, 1, 1,
0.6994138, 0.3108915, 0.4337718, 0.6627451, 0, 1, 1,
0.7083583, 0.9065294, 0.8496835, 0.6666667, 0, 1, 1,
0.7122533, -0.7494795, 3.020287, 0.6745098, 0, 1, 1,
0.7145416, -0.9905365, 2.644068, 0.6784314, 0, 1, 1,
0.7148, -0.7520514, 3.711613, 0.6862745, 0, 1, 1,
0.7173891, 0.3091617, 0.759925, 0.6901961, 0, 1, 1,
0.7181336, 1.513357, 0.3241163, 0.6980392, 0, 1, 1,
0.7213637, 0.6183662, 0.8838918, 0.7058824, 0, 1, 1,
0.7248271, -0.3366711, 3.646127, 0.7098039, 0, 1, 1,
0.7278339, 1.213103, 0.9100271, 0.7176471, 0, 1, 1,
0.7294484, 0.8714588, 1.680065, 0.7215686, 0, 1, 1,
0.7333338, -1.189443, 2.744019, 0.7294118, 0, 1, 1,
0.7410794, -0.6088136, 0.9817643, 0.7333333, 0, 1, 1,
0.7453022, -1.268246, 2.774412, 0.7411765, 0, 1, 1,
0.748291, -1.983831, 2.799589, 0.7450981, 0, 1, 1,
0.7529204, -0.4568234, 2.81722, 0.7529412, 0, 1, 1,
0.7593732, 0.780196, 0.4870017, 0.7568628, 0, 1, 1,
0.7631761, 0.8513681, 0.01836639, 0.7647059, 0, 1, 1,
0.76431, -2.456769, 3.715638, 0.7686275, 0, 1, 1,
0.7650225, 0.7881055, 1.450507, 0.7764706, 0, 1, 1,
0.7659227, -0.4630952, 1.719699, 0.7803922, 0, 1, 1,
0.7766331, -1.975281, 2.27985, 0.7882353, 0, 1, 1,
0.7882873, 1.441025, 0.9318236, 0.7921569, 0, 1, 1,
0.7899491, 0.6327996, 0.5314266, 0.8, 0, 1, 1,
0.7963598, 0.4081877, 0.7892603, 0.8078431, 0, 1, 1,
0.8016003, 0.8325148, 1.700231, 0.8117647, 0, 1, 1,
0.8022166, 0.05758303, 2.340384, 0.8196079, 0, 1, 1,
0.8084374, -1.293645, 2.584641, 0.8235294, 0, 1, 1,
0.8106973, -0.8934149, 1.852402, 0.8313726, 0, 1, 1,
0.8123295, 1.96468, -0.2711248, 0.8352941, 0, 1, 1,
0.8144304, 0.7284288, 1.824815, 0.8431373, 0, 1, 1,
0.8144715, -0.5844437, 1.273062, 0.8470588, 0, 1, 1,
0.8182516, 0.3115831, 0.5609338, 0.854902, 0, 1, 1,
0.8205391, 0.9959867, 2.502802, 0.8588235, 0, 1, 1,
0.8220679, 0.2399185, 2.300037, 0.8666667, 0, 1, 1,
0.8374409, 1.087679, 2.430841, 0.8705882, 0, 1, 1,
0.8552481, -2.194202, 1.892464, 0.8784314, 0, 1, 1,
0.8554205, -0.1281029, 2.841128, 0.8823529, 0, 1, 1,
0.8569085, 0.6159116, 0.742889, 0.8901961, 0, 1, 1,
0.8570193, 0.4987217, 0.992955, 0.8941177, 0, 1, 1,
0.8589514, -0.2610491, -0.3688848, 0.9019608, 0, 1, 1,
0.8605754, -0.336823, 1.224564, 0.9098039, 0, 1, 1,
0.8619513, 1.447589, 0.2385656, 0.9137255, 0, 1, 1,
0.8625008, 0.9827904, 1.587425, 0.9215686, 0, 1, 1,
0.8644748, -1.502002, 3.209321, 0.9254902, 0, 1, 1,
0.8659004, -1.107763, 2.243534, 0.9333333, 0, 1, 1,
0.8664597, 0.4508439, 3.028461, 0.9372549, 0, 1, 1,
0.8667554, -1.328773, -0.2964305, 0.945098, 0, 1, 1,
0.868542, -0.215668, 1.370514, 0.9490196, 0, 1, 1,
0.8879559, -0.5344307, 1.313249, 0.9568627, 0, 1, 1,
0.8912083, -0.8149824, 2.80796, 0.9607843, 0, 1, 1,
0.8926494, -1.690898, 3.473212, 0.9686275, 0, 1, 1,
0.9014943, 0.2023217, 4.265204, 0.972549, 0, 1, 1,
0.9116806, 0.7519593, 2.874012, 0.9803922, 0, 1, 1,
0.9156008, -0.3094423, 0.1540909, 0.9843137, 0, 1, 1,
0.917363, 0.6797491, 0.6125146, 0.9921569, 0, 1, 1,
0.9197776, -1.870404, 3.722932, 0.9960784, 0, 1, 1,
0.9227877, 1.04521, 0.3252798, 1, 0, 0.9960784, 1,
0.9229183, -0.2789843, 2.538316, 1, 0, 0.9882353, 1,
0.9235682, -0.4673412, 1.666531, 1, 0, 0.9843137, 1,
0.9237906, -0.6348758, 2.410513, 1, 0, 0.9764706, 1,
0.9252531, 0.3970096, 0.1067621, 1, 0, 0.972549, 1,
0.9260812, 0.3918808, 1.003504, 1, 0, 0.9647059, 1,
0.9281846, -0.1478624, 3.497094, 1, 0, 0.9607843, 1,
0.936395, 0.1812042, 2.254994, 1, 0, 0.9529412, 1,
0.9470006, 0.04875483, 1.509304, 1, 0, 0.9490196, 1,
0.9515564, -0.6049673, 2.956836, 1, 0, 0.9411765, 1,
0.9549133, 0.6686622, 1.250387, 1, 0, 0.9372549, 1,
0.9631928, -0.5719271, 1.231074, 1, 0, 0.9294118, 1,
0.9700195, -1.525033, 1.32461, 1, 0, 0.9254902, 1,
0.9730125, -1.266511, 2.935785, 1, 0, 0.9176471, 1,
0.9741438, 2.316699, 1.056541, 1, 0, 0.9137255, 1,
0.9760038, -0.4963785, 2.177784, 1, 0, 0.9058824, 1,
0.976887, 0.4082949, 0.5286072, 1, 0, 0.9019608, 1,
0.9783213, -1.985784, 4.017925, 1, 0, 0.8941177, 1,
0.9787363, 0.6072441, 2.392735, 1, 0, 0.8862745, 1,
0.9819979, 2.079489, -0.6279523, 1, 0, 0.8823529, 1,
0.9858493, -0.4075319, 0.2941159, 1, 0, 0.8745098, 1,
0.986605, -0.6254997, 2.811566, 1, 0, 0.8705882, 1,
0.9931155, -1.565667, 2.311792, 1, 0, 0.8627451, 1,
1.011147, -0.4862953, 1.827155, 1, 0, 0.8588235, 1,
1.012506, -0.4375564, 2.056182, 1, 0, 0.8509804, 1,
1.013067, 0.4214106, 0.4743087, 1, 0, 0.8470588, 1,
1.013828, -0.5819128, 0.7672727, 1, 0, 0.8392157, 1,
1.017009, -0.2084876, 2.831191, 1, 0, 0.8352941, 1,
1.021288, 0.4812367, 1.858095, 1, 0, 0.827451, 1,
1.025969, 1.003756, 0.6109904, 1, 0, 0.8235294, 1,
1.028457, 1.472321, -0.5999172, 1, 0, 0.8156863, 1,
1.040843, -0.04455921, 2.568117, 1, 0, 0.8117647, 1,
1.043515, 1.082706, 2.44053, 1, 0, 0.8039216, 1,
1.049426, -3.368027, 3.125081, 1, 0, 0.7960784, 1,
1.052125, -0.03623803, 0.07046281, 1, 0, 0.7921569, 1,
1.060032, 0.6124696, 1.292823, 1, 0, 0.7843137, 1,
1.06946, -1.529908, 1.179394, 1, 0, 0.7803922, 1,
1.070605, 1.526024, 0.5238945, 1, 0, 0.772549, 1,
1.074496, -0.4147091, 2.327642, 1, 0, 0.7686275, 1,
1.077214, -0.2728286, 0.9284481, 1, 0, 0.7607843, 1,
1.104648, -1.805226, 3.543655, 1, 0, 0.7568628, 1,
1.11293, -0.07041536, 2.693188, 1, 0, 0.7490196, 1,
1.118126, -0.1096883, 1.324188, 1, 0, 0.7450981, 1,
1.119484, -0.9549578, 2.102363, 1, 0, 0.7372549, 1,
1.12008, 1.063913, -0.3066602, 1, 0, 0.7333333, 1,
1.131114, 2.814739, -0.627757, 1, 0, 0.7254902, 1,
1.135285, 1.525378, -0.350208, 1, 0, 0.7215686, 1,
1.137702, 0.1957972, 2.562154, 1, 0, 0.7137255, 1,
1.140733, -0.74619, 2.21023, 1, 0, 0.7098039, 1,
1.145528, 0.3392076, 2.934902, 1, 0, 0.7019608, 1,
1.14773, -0.3406098, 1.280189, 1, 0, 0.6941177, 1,
1.152154, 0.8027798, 1.836873, 1, 0, 0.6901961, 1,
1.156244, 0.8473569, 1.551398, 1, 0, 0.682353, 1,
1.166742, -0.9178591, 1.476896, 1, 0, 0.6784314, 1,
1.169608, -0.1356051, 3.387179, 1, 0, 0.6705883, 1,
1.174698, -0.5526794, 1.643969, 1, 0, 0.6666667, 1,
1.187411, 0.1535945, 0.2818152, 1, 0, 0.6588235, 1,
1.189477, -1.686085, 2.272619, 1, 0, 0.654902, 1,
1.194589, -1.541893, 1.383481, 1, 0, 0.6470588, 1,
1.200402, 1.788215, -1.301095, 1, 0, 0.6431373, 1,
1.200744, -0.1744143, -0.76527, 1, 0, 0.6352941, 1,
1.206071, -1.644947, 2.181432, 1, 0, 0.6313726, 1,
1.21969, 1.421831, 0.1474358, 1, 0, 0.6235294, 1,
1.222734, -1.009686, 0.4662352, 1, 0, 0.6196079, 1,
1.222754, 1.364459, 2.338948, 1, 0, 0.6117647, 1,
1.224607, -0.2359615, 0.6666217, 1, 0, 0.6078432, 1,
1.235067, -0.1687269, 1.901744, 1, 0, 0.6, 1,
1.238132, -1.033986, 0.5008734, 1, 0, 0.5921569, 1,
1.250563, -0.1782814, 0.7479102, 1, 0, 0.5882353, 1,
1.257856, -0.25214, 1.366646, 1, 0, 0.5803922, 1,
1.2597, -0.6956111, 2.197541, 1, 0, 0.5764706, 1,
1.267726, -0.313149, 0.8960346, 1, 0, 0.5686275, 1,
1.27068, 1.058071, -0.5178143, 1, 0, 0.5647059, 1,
1.297058, 0.2520761, 1.413225, 1, 0, 0.5568628, 1,
1.297459, -0.6399972, 1.184963, 1, 0, 0.5529412, 1,
1.314263, 0.547453, 0.7685471, 1, 0, 0.5450981, 1,
1.324621, 2.244936, 4.450267, 1, 0, 0.5411765, 1,
1.330862, 0.1801377, 0.903636, 1, 0, 0.5333334, 1,
1.335103, 0.8377988, 1.464085, 1, 0, 0.5294118, 1,
1.336164, -0.7122156, 2.79001, 1, 0, 0.5215687, 1,
1.337285, -0.4600663, 2.695019, 1, 0, 0.5176471, 1,
1.368348, 0.619972, 3.522164, 1, 0, 0.509804, 1,
1.377193, -0.7860742, 1.337756, 1, 0, 0.5058824, 1,
1.379721, 0.620642, 3.34568, 1, 0, 0.4980392, 1,
1.384673, 1.277628, 0.1416368, 1, 0, 0.4901961, 1,
1.384978, 1.367213, 0.7576523, 1, 0, 0.4862745, 1,
1.386933, 1.291509, -1.638464, 1, 0, 0.4784314, 1,
1.391037, 0.3411105, 1.023282, 1, 0, 0.4745098, 1,
1.391094, 0.4385864, 2.017091, 1, 0, 0.4666667, 1,
1.408213, 0.0878941, 2.146926, 1, 0, 0.4627451, 1,
1.411177, -0.9481947, 1.203848, 1, 0, 0.454902, 1,
1.415714, 0.5452464, 1.964763, 1, 0, 0.4509804, 1,
1.434973, -0.2719482, -1.118563, 1, 0, 0.4431373, 1,
1.436059, -1.568531, 0.4260692, 1, 0, 0.4392157, 1,
1.443297, -0.02001571, 1.113708, 1, 0, 0.4313726, 1,
1.449499, 0.8091883, 0.6143559, 1, 0, 0.427451, 1,
1.452301, -0.7977741, 3.196136, 1, 0, 0.4196078, 1,
1.452641, -0.4770652, 1.009419, 1, 0, 0.4156863, 1,
1.458932, 0.02335687, -0.8918068, 1, 0, 0.4078431, 1,
1.465534, -0.5699228, 3.26243, 1, 0, 0.4039216, 1,
1.469889, 1.24053, 1.385384, 1, 0, 0.3960784, 1,
1.47204, 0.5257322, 1.395244, 1, 0, 0.3882353, 1,
1.481173, -0.9443676, 0.3341946, 1, 0, 0.3843137, 1,
1.495793, -0.9840753, 4.213992, 1, 0, 0.3764706, 1,
1.504364, 1.354286, 2.720969, 1, 0, 0.372549, 1,
1.505812, 0.6816292, 0.356093, 1, 0, 0.3647059, 1,
1.526215, 1.586673, 0.2376898, 1, 0, 0.3607843, 1,
1.532379, -0.7620001, 2.830269, 1, 0, 0.3529412, 1,
1.533637, -0.3276066, 1.731501, 1, 0, 0.3490196, 1,
1.547359, 0.688192, 2.355964, 1, 0, 0.3411765, 1,
1.548964, 1.761179, -0.04362372, 1, 0, 0.3372549, 1,
1.560301, -0.745364, 2.843653, 1, 0, 0.3294118, 1,
1.576007, -0.3115914, 1.274514, 1, 0, 0.3254902, 1,
1.576989, 1.142461, 0.1206324, 1, 0, 0.3176471, 1,
1.591143, 0.5047708, 1.292118, 1, 0, 0.3137255, 1,
1.599795, 0.7226092, 0.8921313, 1, 0, 0.3058824, 1,
1.599919, -1.196124, 1.378873, 1, 0, 0.2980392, 1,
1.624012, -0.4549086, 1.513253, 1, 0, 0.2941177, 1,
1.624483, -0.6173686, 3.291741, 1, 0, 0.2862745, 1,
1.627155, -0.6113915, 3.829767, 1, 0, 0.282353, 1,
1.638208, 0.5903345, 2.785367, 1, 0, 0.2745098, 1,
1.64317, -0.2340773, 2.060614, 1, 0, 0.2705882, 1,
1.667968, 1.70656, 1.530943, 1, 0, 0.2627451, 1,
1.66904, 1.485754, 0.2315895, 1, 0, 0.2588235, 1,
1.686369, -0.1890149, 2.27651, 1, 0, 0.2509804, 1,
1.687365, 0.09542444, 2.670529, 1, 0, 0.2470588, 1,
1.697666, -0.5216877, 3.961237, 1, 0, 0.2392157, 1,
1.697958, 1.324147, -0.1354039, 1, 0, 0.2352941, 1,
1.699533, 1.462809, -0.9526454, 1, 0, 0.227451, 1,
1.700532, -0.3248107, 1.116362, 1, 0, 0.2235294, 1,
1.716616, -1.186725, 2.697561, 1, 0, 0.2156863, 1,
1.734236, 1.338744, 0.2297139, 1, 0, 0.2117647, 1,
1.736893, 0.1230581, -0.01036827, 1, 0, 0.2039216, 1,
1.783946, 0.6022975, 1.081988, 1, 0, 0.1960784, 1,
1.78621, -1.783755, 2.528008, 1, 0, 0.1921569, 1,
1.802809, 0.8349539, 2.6323, 1, 0, 0.1843137, 1,
1.821739, 0.7158205, 1.508572, 1, 0, 0.1803922, 1,
1.834099, 1.094365, 3.005616, 1, 0, 0.172549, 1,
1.866701, -1.431042, 2.631478, 1, 0, 0.1686275, 1,
1.947346, -0.898084, 1.718885, 1, 0, 0.1607843, 1,
1.950588, 0.0193174, 2.864732, 1, 0, 0.1568628, 1,
2.041195, 2.007664, 1.183941, 1, 0, 0.1490196, 1,
2.043704, 0.8752645, 2.382087, 1, 0, 0.145098, 1,
2.049518, -0.7166497, 2.716315, 1, 0, 0.1372549, 1,
2.062845, 0.272673, 1.392616, 1, 0, 0.1333333, 1,
2.11445, 0.5255048, 0.6218858, 1, 0, 0.1254902, 1,
2.125591, 0.667478, 1.390965, 1, 0, 0.1215686, 1,
2.138473, 1.196889, -0.7642267, 1, 0, 0.1137255, 1,
2.156169, 0.1974702, 1.056927, 1, 0, 0.1098039, 1,
2.178752, 1.034326, 1.637951, 1, 0, 0.1019608, 1,
2.183084, 1.841145, 2.339841, 1, 0, 0.09411765, 1,
2.201441, -1.702644, 0.9078627, 1, 0, 0.09019608, 1,
2.201976, 0.7529586, 0.367129, 1, 0, 0.08235294, 1,
2.217427, -0.5174431, 2.972892, 1, 0, 0.07843138, 1,
2.248036, -1.53899, 1.815255, 1, 0, 0.07058824, 1,
2.32627, -0.8233697, 2.774997, 1, 0, 0.06666667, 1,
2.332261, 0.6092107, 1.465348, 1, 0, 0.05882353, 1,
2.428389, 1.142813, 1.992078, 1, 0, 0.05490196, 1,
2.560054, 0.6910354, 2.691911, 1, 0, 0.04705882, 1,
2.642504, 0.9499704, 1.465494, 1, 0, 0.04313726, 1,
2.651809, 0.2381328, 3.134255, 1, 0, 0.03529412, 1,
2.751935, -0.2739834, 2.522825, 1, 0, 0.03137255, 1,
2.785699, -1.694382, 3.053554, 1, 0, 0.02352941, 1,
2.824388, -0.8817464, 1.287887, 1, 0, 0.01960784, 1,
3.011578, 1.228443, 0.07528735, 1, 0, 0.01176471, 1,
3.018468, -1.064941, 2.341207, 1, 0, 0.007843138, 1
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
-0.3356801, -4.497691, -6.601866, 0, -0.5, 0.5, 0.5,
-0.3356801, -4.497691, -6.601866, 1, -0.5, 0.5, 0.5,
-0.3356801, -4.497691, -6.601866, 1, 1.5, 0.5, 0.5,
-0.3356801, -4.497691, -6.601866, 0, 1.5, 0.5, 0.5
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
-4.826884, -0.03568733, -6.601866, 0, -0.5, 0.5, 0.5,
-4.826884, -0.03568733, -6.601866, 1, -0.5, 0.5, 0.5,
-4.826884, -0.03568733, -6.601866, 1, 1.5, 0.5, 0.5,
-4.826884, -0.03568733, -6.601866, 0, 1.5, 0.5, 0.5
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
-4.826884, -4.497691, -0.2195499, 0, -0.5, 0.5, 0.5,
-4.826884, -4.497691, -0.2195499, 1, -0.5, 0.5, 0.5,
-4.826884, -4.497691, -0.2195499, 1, 1.5, 0.5, 0.5,
-4.826884, -4.497691, -0.2195499, 0, 1.5, 0.5, 0.5
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
-3, -3.467998, -5.129024,
3, -3.467998, -5.129024,
-3, -3.467998, -5.129024,
-3, -3.639613, -5.374498,
-2, -3.467998, -5.129024,
-2, -3.639613, -5.374498,
-1, -3.467998, -5.129024,
-1, -3.639613, -5.374498,
0, -3.467998, -5.129024,
0, -3.639613, -5.374498,
1, -3.467998, -5.129024,
1, -3.639613, -5.374498,
2, -3.467998, -5.129024,
2, -3.639613, -5.374498,
3, -3.467998, -5.129024,
3, -3.639613, -5.374498
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
-3, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
-3, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
-3, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
-3, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
-2, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
-2, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
-2, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
-2, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
-1, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
-1, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
-1, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
-1, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
0, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
0, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
0, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
0, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
1, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
1, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
1, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
1, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
2, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
2, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
2, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
2, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5,
3, -3.982844, -5.865445, 0, -0.5, 0.5, 0.5,
3, -3.982844, -5.865445, 1, -0.5, 0.5, 0.5,
3, -3.982844, -5.865445, 1, 1.5, 0.5, 0.5,
3, -3.982844, -5.865445, 0, 1.5, 0.5, 0.5
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
-3.790452, -3, -5.129024,
-3.790452, 3, -5.129024,
-3.790452, -3, -5.129024,
-3.963191, -3, -5.374498,
-3.790452, -2, -5.129024,
-3.963191, -2, -5.374498,
-3.790452, -1, -5.129024,
-3.963191, -1, -5.374498,
-3.790452, 0, -5.129024,
-3.963191, 0, -5.374498,
-3.790452, 1, -5.129024,
-3.963191, 1, -5.374498,
-3.790452, 2, -5.129024,
-3.963191, 2, -5.374498,
-3.790452, 3, -5.129024,
-3.963191, 3, -5.374498
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
-4.308669, -3, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, -3, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, -3, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, -3, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, -2, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, -2, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, -2, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, -2, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, -1, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, -1, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, -1, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, -1, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, 0, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, 0, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, 0, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, 0, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, 1, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, 1, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, 1, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, 1, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, 2, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, 2, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, 2, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, 2, -5.865445, 0, 1.5, 0.5, 0.5,
-4.308669, 3, -5.865445, 0, -0.5, 0.5, 0.5,
-4.308669, 3, -5.865445, 1, -0.5, 0.5, 0.5,
-4.308669, 3, -5.865445, 1, 1.5, 0.5, 0.5,
-4.308669, 3, -5.865445, 0, 1.5, 0.5, 0.5
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
-3.790452, -3.467998, -4,
-3.790452, -3.467998, 4,
-3.790452, -3.467998, -4,
-3.963191, -3.639613, -4,
-3.790452, -3.467998, -2,
-3.963191, -3.639613, -2,
-3.790452, -3.467998, 0,
-3.963191, -3.639613, 0,
-3.790452, -3.467998, 2,
-3.963191, -3.639613, 2,
-3.790452, -3.467998, 4,
-3.963191, -3.639613, 4
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
-4.308669, -3.982844, -4, 0, -0.5, 0.5, 0.5,
-4.308669, -3.982844, -4, 1, -0.5, 0.5, 0.5,
-4.308669, -3.982844, -4, 1, 1.5, 0.5, 0.5,
-4.308669, -3.982844, -4, 0, 1.5, 0.5, 0.5,
-4.308669, -3.982844, -2, 0, -0.5, 0.5, 0.5,
-4.308669, -3.982844, -2, 1, -0.5, 0.5, 0.5,
-4.308669, -3.982844, -2, 1, 1.5, 0.5, 0.5,
-4.308669, -3.982844, -2, 0, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 0, 0, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 0, 1, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 0, 1, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 0, 0, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 2, 0, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 2, 1, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 2, 1, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 2, 0, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 4, 0, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 4, 1, -0.5, 0.5, 0.5,
-4.308669, -3.982844, 4, 1, 1.5, 0.5, 0.5,
-4.308669, -3.982844, 4, 0, 1.5, 0.5, 0.5
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
-3.790452, -3.467998, -5.129024,
-3.790452, 3.396623, -5.129024,
-3.790452, -3.467998, 4.689924,
-3.790452, 3.396623, 4.689924,
-3.790452, -3.467998, -5.129024,
-3.790452, -3.467998, 4.689924,
-3.790452, 3.396623, -5.129024,
-3.790452, 3.396623, 4.689924,
-3.790452, -3.467998, -5.129024,
3.119092, -3.467998, -5.129024,
-3.790452, -3.467998, 4.689924,
3.119092, -3.467998, 4.689924,
-3.790452, 3.396623, -5.129024,
3.119092, 3.396623, -5.129024,
-3.790452, 3.396623, 4.689924,
3.119092, 3.396623, 4.689924,
3.119092, -3.467998, -5.129024,
3.119092, 3.396623, -5.129024,
3.119092, -3.467998, 4.689924,
3.119092, 3.396623, 4.689924,
3.119092, -3.467998, -5.129024,
3.119092, -3.467998, 4.689924,
3.119092, 3.396623, -5.129024,
3.119092, 3.396623, 4.689924
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
var radius = 7.3851;
var distance = 32.85714;
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
mvMatrix.translate( 0.3356801, 0.03568733, 0.2195499 );
mvMatrix.scale( 1.155635, 1.163198, 0.8132148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.85714);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-Bromopropionate<-read.table("3-Bromopropionate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-Bromopropionate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Bromopropionate' not found
```

```r
y<-3-Bromopropionate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Bromopropionate' not found
```

```r
z<-3-Bromopropionate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Bromopropionate' not found
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
-3.689828, 0.1637913, -1.601533, 0, 0, 1, 1, 1,
-3.270652, 1.350565, -0.6581295, 1, 0, 0, 1, 1,
-3.074493, -0.6250924, -2.111094, 1, 0, 0, 1, 1,
-2.915521, 0.7739604, -2.284907, 1, 0, 0, 1, 1,
-2.912963, 1.542496, -2.051148, 1, 0, 0, 1, 1,
-2.883863, -1.664325, -3.871233, 1, 0, 0, 1, 1,
-2.69719, 0.2670743, -0.3786108, 0, 0, 0, 1, 1,
-2.679081, 0.4054076, -1.219639, 0, 0, 0, 1, 1,
-2.54198, -1.492544, -1.22572, 0, 0, 0, 1, 1,
-2.51603, 1.088394, -2.134708, 0, 0, 0, 1, 1,
-2.404981, 1.09011, -2.052006, 0, 0, 0, 1, 1,
-2.390564, -1.333761, -1.12687, 0, 0, 0, 1, 1,
-2.324039, -1.086779, -2.508166, 0, 0, 0, 1, 1,
-2.298003, 1.422012, 0.8620962, 1, 1, 1, 1, 1,
-2.109945, 2.085397, -0.05073721, 1, 1, 1, 1, 1,
-2.086139, 1.76099, -2.324812, 1, 1, 1, 1, 1,
-2.080845, 0.805814, -1.401068, 1, 1, 1, 1, 1,
-2.050716, 0.4250409, -1.362907, 1, 1, 1, 1, 1,
-2.025567, 0.9835345, -2.436814, 1, 1, 1, 1, 1,
-2.01014, 0.01485633, -2.396066, 1, 1, 1, 1, 1,
-2.008272, 1.212537, 0.1098305, 1, 1, 1, 1, 1,
-1.952761, -1.602705, -2.885887, 1, 1, 1, 1, 1,
-1.945311, 0.4767889, -1.050267, 1, 1, 1, 1, 1,
-1.943064, 1.563236, -1.024914, 1, 1, 1, 1, 1,
-1.933931, -1.405723, -3.649721, 1, 1, 1, 1, 1,
-1.921575, 0.0283656, -1.653788, 1, 1, 1, 1, 1,
-1.912749, -1.422186, -2.350114, 1, 1, 1, 1, 1,
-1.906158, -0.9152448, -2.350569, 1, 1, 1, 1, 1,
-1.898018, 1.047039, -0.3120696, 0, 0, 1, 1, 1,
-1.887601, -0.215544, -1.487661, 1, 0, 0, 1, 1,
-1.867335, -1.267872, -2.829834, 1, 0, 0, 1, 1,
-1.833691, -0.801762, -2.090918, 1, 0, 0, 1, 1,
-1.828175, 1.586512, -1.258681, 1, 0, 0, 1, 1,
-1.804087, 0.2428612, -2.46539, 1, 0, 0, 1, 1,
-1.778666, 0.116512, -1.96709, 0, 0, 0, 1, 1,
-1.771463, 0.8375486, -2.850742, 0, 0, 0, 1, 1,
-1.746686, 1.769274, -1.29627, 0, 0, 0, 1, 1,
-1.729053, -1.647183, -2.30461, 0, 0, 0, 1, 1,
-1.723172, -1.172669, -1.524386, 0, 0, 0, 1, 1,
-1.710772, -1.042471, -1.975812, 0, 0, 0, 1, 1,
-1.706555, -0.4704264, -3.888148, 0, 0, 0, 1, 1,
-1.70274, 0.8309246, -1.544107, 1, 1, 1, 1, 1,
-1.698003, -0.5528826, -2.423346, 1, 1, 1, 1, 1,
-1.689575, 1.103322, -1.355837, 1, 1, 1, 1, 1,
-1.677397, -1.135668, -1.63024, 1, 1, 1, 1, 1,
-1.66227, -0.2185557, -3.123335, 1, 1, 1, 1, 1,
-1.655715, 0.3650783, -1.403378, 1, 1, 1, 1, 1,
-1.640135, 2.154227, -0.1736431, 1, 1, 1, 1, 1,
-1.632944, 0.5882502, 0.1250684, 1, 1, 1, 1, 1,
-1.62684, 0.415638, -2.017095, 1, 1, 1, 1, 1,
-1.620785, -0.746047, -2.52304, 1, 1, 1, 1, 1,
-1.619332, 1.989033, 1.252939, 1, 1, 1, 1, 1,
-1.615076, -1.395157, -0.4501479, 1, 1, 1, 1, 1,
-1.598961, 0.8770082, -0.2582892, 1, 1, 1, 1, 1,
-1.594926, 0.2526698, -2.154878, 1, 1, 1, 1, 1,
-1.587422, 0.1459315, -1.64876, 1, 1, 1, 1, 1,
-1.562597, 0.6923938, -1.228184, 0, 0, 1, 1, 1,
-1.543458, -0.9679779, -2.263472, 1, 0, 0, 1, 1,
-1.543269, 1.329465, 1.080096, 1, 0, 0, 1, 1,
-1.5366, -0.5864431, -1.718657, 1, 0, 0, 1, 1,
-1.534323, 0.08377325, -0.08758487, 1, 0, 0, 1, 1,
-1.509486, -2.622286, -4.624739, 1, 0, 0, 1, 1,
-1.503214, -1.841702, -2.747185, 0, 0, 0, 1, 1,
-1.50317, 0.5201071, 0.1891884, 0, 0, 0, 1, 1,
-1.50209, -0.2647059, 0.4944629, 0, 0, 0, 1, 1,
-1.493126, 0.7410919, -1.066022, 0, 0, 0, 1, 1,
-1.487271, 0.8478168, 0.2759886, 0, 0, 0, 1, 1,
-1.474069, -0.688827, -2.826417, 0, 0, 0, 1, 1,
-1.47053, -0.7224218, -0.9010972, 0, 0, 0, 1, 1,
-1.447141, -1.033905, -2.345144, 1, 1, 1, 1, 1,
-1.427243, 0.1239176, -2.048721, 1, 1, 1, 1, 1,
-1.427041, -0.7921075, -0.1540762, 1, 1, 1, 1, 1,
-1.425529, -0.205194, -1.981342, 1, 1, 1, 1, 1,
-1.416521, -0.5171036, -3.060081, 1, 1, 1, 1, 1,
-1.406746, -1.821291, -2.227906, 1, 1, 1, 1, 1,
-1.405606, 0.1641226, -1.326225, 1, 1, 1, 1, 1,
-1.405003, -0.1544083, -1.162863, 1, 1, 1, 1, 1,
-1.397638, 1.67423, -2.6399, 1, 1, 1, 1, 1,
-1.395005, 0.6233615, -2.445917, 1, 1, 1, 1, 1,
-1.394352, -1.36395, -1.202217, 1, 1, 1, 1, 1,
-1.392502, -0.4391929, -1.125664, 1, 1, 1, 1, 1,
-1.382107, -0.5176241, -1.612709, 1, 1, 1, 1, 1,
-1.373024, 0.7884954, -3.068431, 1, 1, 1, 1, 1,
-1.369159, -0.1357352, -2.766145, 1, 1, 1, 1, 1,
-1.362414, 0.8811672, -0.642385, 0, 0, 1, 1, 1,
-1.359961, 0.711356, -1.544639, 1, 0, 0, 1, 1,
-1.348149, 1.432366, -1.378712, 1, 0, 0, 1, 1,
-1.343943, 2.403762, 0.2519875, 1, 0, 0, 1, 1,
-1.341544, -1.087104, -2.614719, 1, 0, 0, 1, 1,
-1.338677, -1.130662, -2.841847, 1, 0, 0, 1, 1,
-1.335625, -1.304872, -1.786454, 0, 0, 0, 1, 1,
-1.319595, 0.2330173, -0.6945389, 0, 0, 0, 1, 1,
-1.317047, 0.7614105, 0.2738731, 0, 0, 0, 1, 1,
-1.316763, -1.260702, -2.902321, 0, 0, 0, 1, 1,
-1.307196, -0.2198528, -2.348812, 0, 0, 0, 1, 1,
-1.303438, -1.047223, -1.525256, 0, 0, 0, 1, 1,
-1.303038, -0.3751832, -2.601397, 0, 0, 0, 1, 1,
-1.302296, -0.5381716, -3.180646, 1, 1, 1, 1, 1,
-1.282264, -0.2796704, -2.128947, 1, 1, 1, 1, 1,
-1.27189, -0.919295, -2.533021, 1, 1, 1, 1, 1,
-1.266769, -0.8413412, -3.162141, 1, 1, 1, 1, 1,
-1.264399, -0.104725, -1.146041, 1, 1, 1, 1, 1,
-1.260108, 0.09538911, -0.2295741, 1, 1, 1, 1, 1,
-1.253703, 0.8252096, -1.658775, 1, 1, 1, 1, 1,
-1.252611, -1.878326, -2.034329, 1, 1, 1, 1, 1,
-1.246058, 0.4075849, -0.3594609, 1, 1, 1, 1, 1,
-1.244178, 0.1927262, -1.474804, 1, 1, 1, 1, 1,
-1.241654, -0.6181058, -0.5524972, 1, 1, 1, 1, 1,
-1.240533, 2.073163, -0.7361261, 1, 1, 1, 1, 1,
-1.225947, -0.1752659, -1.62016, 1, 1, 1, 1, 1,
-1.224018, 0.3126561, -1.44449, 1, 1, 1, 1, 1,
-1.2189, 1.001592, -1.031355, 1, 1, 1, 1, 1,
-1.208027, -0.5667536, -3.255754, 0, 0, 1, 1, 1,
-1.195163, -0.8869188, -1.795605, 1, 0, 0, 1, 1,
-1.185806, -0.3093113, -2.375267, 1, 0, 0, 1, 1,
-1.158117, -0.5449337, -2.001674, 1, 0, 0, 1, 1,
-1.145268, 0.0459106, -1.69558, 1, 0, 0, 1, 1,
-1.140389, -0.7337404, -0.997376, 1, 0, 0, 1, 1,
-1.138506, -0.6378214, -0.4755543, 0, 0, 0, 1, 1,
-1.13633, -0.7297676, -1.749102, 0, 0, 0, 1, 1,
-1.135636, 0.04720708, -1.063991, 0, 0, 0, 1, 1,
-1.129574, 0.9322524, -1.570296, 0, 0, 0, 1, 1,
-1.115693, -1.038796, -4.17548, 0, 0, 0, 1, 1,
-1.10747, 0.8235184, -1.13184, 0, 0, 0, 1, 1,
-1.10423, 0.03421441, -2.18568, 0, 0, 0, 1, 1,
-1.104096, 0.2721794, -1.705602, 1, 1, 1, 1, 1,
-1.101337, -0.9517443, -0.4834659, 1, 1, 1, 1, 1,
-1.101164, 0.2295282, 0.09414472, 1, 1, 1, 1, 1,
-1.096138, -0.2383302, 0.06790973, 1, 1, 1, 1, 1,
-1.092495, 0.5573469, -0.9488273, 1, 1, 1, 1, 1,
-1.077537, 0.2998055, -0.03715685, 1, 1, 1, 1, 1,
-1.075847, -0.4166373, -1.860757, 1, 1, 1, 1, 1,
-1.075121, -1.171942, -2.842068, 1, 1, 1, 1, 1,
-1.07347, 0.3303123, -1.571132, 1, 1, 1, 1, 1,
-1.070255, 0.880734, -0.7893484, 1, 1, 1, 1, 1,
-1.067676, 0.07063333, -1.364556, 1, 1, 1, 1, 1,
-1.066347, -0.5077448, -0.9040318, 1, 1, 1, 1, 1,
-1.055509, -0.3896739, -1.001546, 1, 1, 1, 1, 1,
-1.053245, 1.453037, 0.9038532, 1, 1, 1, 1, 1,
-1.052423, -1.550304, -3.165594, 1, 1, 1, 1, 1,
-1.052317, 0.04609309, -2.41361, 0, 0, 1, 1, 1,
-1.042161, -0.3938237, -2.033833, 1, 0, 0, 1, 1,
-1.042087, 1.38514, -1.91443, 1, 0, 0, 1, 1,
-1.039897, -0.6908248, -1.646124, 1, 0, 0, 1, 1,
-1.036356, -0.1278989, -0.670573, 1, 0, 0, 1, 1,
-1.032896, 1.282121, -0.782793, 1, 0, 0, 1, 1,
-1.02551, 0.9865339, 0.3171392, 0, 0, 0, 1, 1,
-1.010776, 0.7278928, -0.1861877, 0, 0, 0, 1, 1,
-1.004793, 0.1043275, -1.219335, 0, 0, 0, 1, 1,
-0.9903817, -1.90591, -2.036987, 0, 0, 0, 1, 1,
-0.9877295, 0.1720477, -0.7424018, 0, 0, 0, 1, 1,
-0.9865957, -1.886276, -3.417134, 0, 0, 0, 1, 1,
-0.9803767, 0.5112785, -0.8598496, 0, 0, 0, 1, 1,
-0.9774742, -0.124792, -0.5030809, 1, 1, 1, 1, 1,
-0.977212, -0.483148, -0.7848533, 1, 1, 1, 1, 1,
-0.9741061, 0.4897169, -0.4440475, 1, 1, 1, 1, 1,
-0.9737217, 0.09913185, -1.383246, 1, 1, 1, 1, 1,
-0.9697427, 1.176738, 0.8918563, 1, 1, 1, 1, 1,
-0.969449, 0.7475774, -0.6338478, 1, 1, 1, 1, 1,
-0.9677373, -1.602324, -2.367768, 1, 1, 1, 1, 1,
-0.9540846, -0.7645003, -2.026553, 1, 1, 1, 1, 1,
-0.9518468, 1.798568, 0.1807985, 1, 1, 1, 1, 1,
-0.9516698, -0.5199712, -3.337348, 1, 1, 1, 1, 1,
-0.9417545, 0.3463128, -0.3321514, 1, 1, 1, 1, 1,
-0.9381724, -0.4177683, -4.496678, 1, 1, 1, 1, 1,
-0.935105, -0.2114503, -2.477962, 1, 1, 1, 1, 1,
-0.9325532, -1.311861, -2.970859, 1, 1, 1, 1, 1,
-0.9296078, -0.5979971, -2.695604, 1, 1, 1, 1, 1,
-0.9280825, -0.2337987, -2.050894, 0, 0, 1, 1, 1,
-0.920839, 0.4688391, -1.79364, 1, 0, 0, 1, 1,
-0.910684, 0.1275771, -3.33688, 1, 0, 0, 1, 1,
-0.9105685, -1.593073, -4.553312, 1, 0, 0, 1, 1,
-0.9043244, -0.5113273, -1.522037, 1, 0, 0, 1, 1,
-0.9013815, 0.7532342, -2.162678, 1, 0, 0, 1, 1,
-0.8991516, 0.07101016, -1.946377, 0, 0, 0, 1, 1,
-0.8920891, -0.7515121, -2.048881, 0, 0, 0, 1, 1,
-0.8917133, -0.4675887, -2.999657, 0, 0, 0, 1, 1,
-0.8868129, -0.1561961, -2.423216, 0, 0, 0, 1, 1,
-0.8826177, 0.1338637, -2.550563, 0, 0, 0, 1, 1,
-0.8819184, -0.5063351, -3.818474, 0, 0, 0, 1, 1,
-0.8815171, -0.7164686, -4.98603, 0, 0, 0, 1, 1,
-0.8796766, -0.3814367, -2.106522, 1, 1, 1, 1, 1,
-0.8783021, -1.001069, -2.202156, 1, 1, 1, 1, 1,
-0.8767972, -0.1954557, -2.233303, 1, 1, 1, 1, 1,
-0.8646006, 0.1258867, -1.167618, 1, 1, 1, 1, 1,
-0.8638281, 0.1097055, -1.11408, 1, 1, 1, 1, 1,
-0.8623741, 0.3912192, -1.424145, 1, 1, 1, 1, 1,
-0.860434, -0.872884, -2.569844, 1, 1, 1, 1, 1,
-0.8562256, -0.7067652, -2.511158, 1, 1, 1, 1, 1,
-0.8507603, -1.307752, -1.793603, 1, 1, 1, 1, 1,
-0.8497822, 2.331952, 0.05875186, 1, 1, 1, 1, 1,
-0.8479433, -0.07105613, -2.796912, 1, 1, 1, 1, 1,
-0.8435443, 0.4460671, -2.084471, 1, 1, 1, 1, 1,
-0.8426812, -0.3209075, -0.9348028, 1, 1, 1, 1, 1,
-0.8405319, -0.04357545, -0.9191005, 1, 1, 1, 1, 1,
-0.8360387, 2.10759, -1.363252, 1, 1, 1, 1, 1,
-0.8357409, 1.762787, 0.2805698, 0, 0, 1, 1, 1,
-0.8183696, 1.743645, -0.7126805, 1, 0, 0, 1, 1,
-0.8120264, -0.551575, -1.961449, 1, 0, 0, 1, 1,
-0.8119595, 1.599687, -0.7938046, 1, 0, 0, 1, 1,
-0.806775, 1.276339, 0.1084607, 1, 0, 0, 1, 1,
-0.7968366, 2.019838, -0.5163057, 1, 0, 0, 1, 1,
-0.7939825, -0.500871, -2.566339, 0, 0, 0, 1, 1,
-0.7923283, -0.9241664, -1.783582, 0, 0, 0, 1, 1,
-0.7907602, 0.7437569, 0.02903988, 0, 0, 0, 1, 1,
-0.79009, 0.4437386, 0.9529786, 0, 0, 0, 1, 1,
-0.7841957, -0.8096939, -2.751322, 0, 0, 0, 1, 1,
-0.7837248, -0.1549951, -2.498517, 0, 0, 0, 1, 1,
-0.7803487, 0.2631649, -1.087934, 0, 0, 0, 1, 1,
-0.7794556, -0.1956203, -0.6429198, 1, 1, 1, 1, 1,
-0.7758362, -0.3314461, -1.401346, 1, 1, 1, 1, 1,
-0.7744209, 2.318343, -0.3320985, 1, 1, 1, 1, 1,
-0.7742245, 0.6985108, -0.0356531, 1, 1, 1, 1, 1,
-0.7719517, -0.3896744, -2.43583, 1, 1, 1, 1, 1,
-0.7648749, -0.6305921, -2.048273, 1, 1, 1, 1, 1,
-0.7582754, 1.01796, -0.9327809, 1, 1, 1, 1, 1,
-0.7511771, -2.536767, -4.935301, 1, 1, 1, 1, 1,
-0.74744, -1.86303, -4.126547, 1, 1, 1, 1, 1,
-0.7459964, -0.8544097, -3.675286, 1, 1, 1, 1, 1,
-0.7383658, 0.3141418, -0.3809935, 1, 1, 1, 1, 1,
-0.7383072, -0.7997065, -2.227733, 1, 1, 1, 1, 1,
-0.7368404, -0.5090746, -2.286714, 1, 1, 1, 1, 1,
-0.7317663, -1.627314, -2.475596, 1, 1, 1, 1, 1,
-0.7304921, -0.4532318, -1.258736, 1, 1, 1, 1, 1,
-0.7293434, 1.893497, -0.0173526, 0, 0, 1, 1, 1,
-0.7201064, 1.299365, -0.3050595, 1, 0, 0, 1, 1,
-0.708178, -1.827558, -3.856173, 1, 0, 0, 1, 1,
-0.7042814, 0.1399756, -1.067565, 1, 0, 0, 1, 1,
-0.7017607, -0.320504, -2.595147, 1, 0, 0, 1, 1,
-0.7016594, 1.030586, 1.479393, 1, 0, 0, 1, 1,
-0.6940511, 1.221807, -1.201141, 0, 0, 0, 1, 1,
-0.6918573, 0.03426477, -2.222172, 0, 0, 0, 1, 1,
-0.6883057, -0.05754428, -1.757303, 0, 0, 0, 1, 1,
-0.6824862, -1.184495, -3.787011, 0, 0, 0, 1, 1,
-0.6776552, -1.433623, -3.455696, 0, 0, 0, 1, 1,
-0.6774166, 0.5464364, -1.0963, 0, 0, 0, 1, 1,
-0.6736384, -1.01513, -2.608505, 0, 0, 0, 1, 1,
-0.6734255, -1.007842, -4.656512, 1, 1, 1, 1, 1,
-0.6703501, -0.3195964, -2.364167, 1, 1, 1, 1, 1,
-0.6681464, -0.0983147, -1.556446, 1, 1, 1, 1, 1,
-0.666688, 0.2622416, -1.866569, 1, 1, 1, 1, 1,
-0.6642985, -0.4414413, -1.92457, 1, 1, 1, 1, 1,
-0.6637496, -0.2282183, -3.331204, 1, 1, 1, 1, 1,
-0.6624935, 0.6913838, -0.6467662, 1, 1, 1, 1, 1,
-0.6609285, 1.370696, -0.2880591, 1, 1, 1, 1, 1,
-0.660621, 0.5956181, -1.211854, 1, 1, 1, 1, 1,
-0.6600058, -1.237646, -4.258497, 1, 1, 1, 1, 1,
-0.6578789, 0.9447847, -0.3554272, 1, 1, 1, 1, 1,
-0.652379, 1.198812, -1.218443, 1, 1, 1, 1, 1,
-0.6517488, -0.9588927, -2.113383, 1, 1, 1, 1, 1,
-0.6510912, -0.910071, -2.388582, 1, 1, 1, 1, 1,
-0.6507441, -0.2059511, -0.9337764, 1, 1, 1, 1, 1,
-0.6478686, 0.8048286, -2.604427, 0, 0, 1, 1, 1,
-0.6430911, -0.5871848, -2.948042, 1, 0, 0, 1, 1,
-0.6411282, 1.241277, -1.364092, 1, 0, 0, 1, 1,
-0.639897, 2.224313, 0.4497474, 1, 0, 0, 1, 1,
-0.6375843, -0.7525991, -2.067101, 1, 0, 0, 1, 1,
-0.6357298, 0.9159907, -1.878586, 1, 0, 0, 1, 1,
-0.617363, 0.3589595, -1.799785, 0, 0, 0, 1, 1,
-0.6081303, 0.1576943, -3.18599, 0, 0, 0, 1, 1,
-0.6073218, -0.4129775, -1.046854, 0, 0, 0, 1, 1,
-0.6070864, 0.3538431, -0.1075468, 0, 0, 0, 1, 1,
-0.6048125, -0.1529388, -1.762068, 0, 0, 0, 1, 1,
-0.6025788, 1.16533, -1.608541, 0, 0, 0, 1, 1,
-0.600585, -0.1483768, -0.6842107, 0, 0, 0, 1, 1,
-0.5997503, -1.246145, -2.210859, 1, 1, 1, 1, 1,
-0.5946611, -0.2249819, -1.97003, 1, 1, 1, 1, 1,
-0.5889947, -1.085838, -2.037005, 1, 1, 1, 1, 1,
-0.5855765, 0.4292039, -0.007447286, 1, 1, 1, 1, 1,
-0.5822119, 0.492615, -0.6938517, 1, 1, 1, 1, 1,
-0.5762144, -1.133377, -1.903458, 1, 1, 1, 1, 1,
-0.5725214, -0.9251218, -3.933113, 1, 1, 1, 1, 1,
-0.5724174, -1.761364, -3.322636, 1, 1, 1, 1, 1,
-0.5649333, 0.9901607, -0.02860912, 1, 1, 1, 1, 1,
-0.5649229, 0.4133828, -0.2209818, 1, 1, 1, 1, 1,
-0.5610678, -0.4732073, -2.280891, 1, 1, 1, 1, 1,
-0.5597029, -0.1693268, -2.32353, 1, 1, 1, 1, 1,
-0.5574558, 2.331113, -0.379842, 1, 1, 1, 1, 1,
-0.5568307, -0.05747196, -2.650288, 1, 1, 1, 1, 1,
-0.5550275, 1.389289, -0.7940325, 1, 1, 1, 1, 1,
-0.547192, -0.1616341, -1.29817, 0, 0, 1, 1, 1,
-0.5402868, -0.9854342, -3.337676, 1, 0, 0, 1, 1,
-0.5386928, 0.7526525, -0.1172571, 1, 0, 0, 1, 1,
-0.5384348, -1.425231, -3.783682, 1, 0, 0, 1, 1,
-0.5353916, 0.2512668, -0.3048501, 1, 0, 0, 1, 1,
-0.534977, 1.193563, -0.1201345, 1, 0, 0, 1, 1,
-0.5336806, -0.2207581, -1.919555, 0, 0, 0, 1, 1,
-0.5333685, 0.07805754, -2.089673, 0, 0, 0, 1, 1,
-0.5271338, -0.2459657, -3.05729, 0, 0, 0, 1, 1,
-0.526898, 0.2103736, -0.6613625, 0, 0, 0, 1, 1,
-0.5251157, 0.6337308, -1.066274, 0, 0, 0, 1, 1,
-0.5231905, -0.1662938, -2.768338, 0, 0, 0, 1, 1,
-0.5194609, -1.779217, -2.084363, 0, 0, 0, 1, 1,
-0.5188867, -0.603689, -1.371101, 1, 1, 1, 1, 1,
-0.5183461, 0.6202772, -0.8186419, 1, 1, 1, 1, 1,
-0.5160444, 0.8476477, -1.140369, 1, 1, 1, 1, 1,
-0.515693, 0.6692501, -0.360627, 1, 1, 1, 1, 1,
-0.5135901, -1.378929, -1.18162, 1, 1, 1, 1, 1,
-0.5122131, 0.3808528, -0.4996983, 1, 1, 1, 1, 1,
-0.5102835, 1.044383, 0.2251841, 1, 1, 1, 1, 1,
-0.5079882, 0.8914934, -1.612761, 1, 1, 1, 1, 1,
-0.5026725, -2.043571, -1.963892, 1, 1, 1, 1, 1,
-0.5000932, 1.174549, -1.924604, 1, 1, 1, 1, 1,
-0.49701, -0.08506426, -2.056356, 1, 1, 1, 1, 1,
-0.4931951, -2.059495, -3.245635, 1, 1, 1, 1, 1,
-0.4884249, -2.604101, -3.36815, 1, 1, 1, 1, 1,
-0.4869974, 0.5138087, -1.02347, 1, 1, 1, 1, 1,
-0.4859611, -1.067642, -1.749859, 1, 1, 1, 1, 1,
-0.4840996, 1.022095, -1.49552, 0, 0, 1, 1, 1,
-0.4791296, 1.31684, 0.0743474, 1, 0, 0, 1, 1,
-0.4718529, -1.06645, -2.383219, 1, 0, 0, 1, 1,
-0.4716581, -0.2855347, -3.293175, 1, 0, 0, 1, 1,
-0.4690632, -1.343644, -1.797439, 1, 0, 0, 1, 1,
-0.4686747, -0.1843103, -2.220349, 1, 0, 0, 1, 1,
-0.4627609, 0.5150757, -0.2746873, 0, 0, 0, 1, 1,
-0.4624302, 0.5285845, 0.2470321, 0, 0, 0, 1, 1,
-0.4530061, -2.983906, -1.805321, 0, 0, 0, 1, 1,
-0.4527285, -0.764381, -0.4866784, 0, 0, 0, 1, 1,
-0.4427064, 0.1886292, -2.636298, 0, 0, 0, 1, 1,
-0.4419032, 0.1664705, -2.044771, 0, 0, 0, 1, 1,
-0.43974, -0.6212027, -3.589104, 0, 0, 0, 1, 1,
-0.4392902, 1.022274, -1.816729, 1, 1, 1, 1, 1,
-0.4374799, -0.0408015, -3.155101, 1, 1, 1, 1, 1,
-0.431608, 0.1443329, -0.5662016, 1, 1, 1, 1, 1,
-0.4282462, 0.8060255, -0.01088865, 1, 1, 1, 1, 1,
-0.4272935, -0.8194342, -3.121284, 1, 1, 1, 1, 1,
-0.425736, 0.3209372, -1.838521, 1, 1, 1, 1, 1,
-0.4247916, -0.9048017, -2.005559, 1, 1, 1, 1, 1,
-0.4235083, -0.8570991, -3.320828, 1, 1, 1, 1, 1,
-0.4192623, 0.1911479, -0.4229262, 1, 1, 1, 1, 1,
-0.4174905, -1.550186, -3.010079, 1, 1, 1, 1, 1,
-0.4145701, 1.104089, 0.2210576, 1, 1, 1, 1, 1,
-0.4144401, 1.054866, -0.8562664, 1, 1, 1, 1, 1,
-0.4121364, 1.397997, 1.257323, 1, 1, 1, 1, 1,
-0.4105875, 0.5036088, 0.3826588, 1, 1, 1, 1, 1,
-0.4104418, -0.6192254, -3.550572, 1, 1, 1, 1, 1,
-0.4091614, -0.6600062, -1.354416, 0, 0, 1, 1, 1,
-0.4081285, -1.959686, -4.204183, 1, 0, 0, 1, 1,
-0.4061598, -1.588233, -2.217911, 1, 0, 0, 1, 1,
-0.4031272, -0.6969406, -1.05768, 1, 0, 0, 1, 1,
-0.3984388, -1.742544, -1.636811, 1, 0, 0, 1, 1,
-0.3961935, -1.001909, -2.953458, 1, 0, 0, 1, 1,
-0.396174, -2.268333, -1.280822, 0, 0, 0, 1, 1,
-0.3961718, 0.7948714, 0.2754385, 0, 0, 0, 1, 1,
-0.3950432, 1.196061, 2.341067, 0, 0, 0, 1, 1,
-0.3876356, -0.04889007, -1.458961, 0, 0, 0, 1, 1,
-0.3853295, -0.2180837, -2.460376, 0, 0, 0, 1, 1,
-0.3841479, -1.211328, -3.293738, 0, 0, 0, 1, 1,
-0.3801467, -1.994381, -4.294688, 0, 0, 0, 1, 1,
-0.3762913, 0.1966034, 0.8595449, 1, 1, 1, 1, 1,
-0.3750696, -2.367192, -3.480235, 1, 1, 1, 1, 1,
-0.3749269, 0.8775933, -0.1500486, 1, 1, 1, 1, 1,
-0.373341, -0.7919115, -3.051735, 1, 1, 1, 1, 1,
-0.3710691, 2.6335, -0.3113126, 1, 1, 1, 1, 1,
-0.3662136, -1.450051, -1.613219, 1, 1, 1, 1, 1,
-0.365074, 1.222911, -0.5814384, 1, 1, 1, 1, 1,
-0.3631914, 1.130292, 0.9700918, 1, 1, 1, 1, 1,
-0.3622125, -0.5731207, -3.496477, 1, 1, 1, 1, 1,
-0.3601933, 1.313712, -1.165621, 1, 1, 1, 1, 1,
-0.3555142, -1.250139, -3.849698, 1, 1, 1, 1, 1,
-0.3542428, 0.1013398, -1.85686, 1, 1, 1, 1, 1,
-0.3540508, 0.9814457, -0.9707676, 1, 1, 1, 1, 1,
-0.3537026, -1.731618, -2.7997, 1, 1, 1, 1, 1,
-0.3536569, 0.9587753, -0.1481272, 1, 1, 1, 1, 1,
-0.3491683, -0.01469992, -2.709897, 0, 0, 1, 1, 1,
-0.3487928, 0.9988561, 0.3677942, 1, 0, 0, 1, 1,
-0.3442475, 0.4941192, -0.8558868, 1, 0, 0, 1, 1,
-0.343956, -0.1857843, -2.935855, 1, 0, 0, 1, 1,
-0.339106, -1.133192, -3.832298, 1, 0, 0, 1, 1,
-0.3348354, 0.6066031, -0.03034436, 1, 0, 0, 1, 1,
-0.3338713, 0.8188352, -0.6247345, 0, 0, 0, 1, 1,
-0.3318262, -0.09554294, -2.72973, 0, 0, 0, 1, 1,
-0.331224, -0.03854494, -0.9430896, 0, 0, 0, 1, 1,
-0.3307876, -0.535746, -2.827741, 0, 0, 0, 1, 1,
-0.3302985, -0.7499231, -2.844436, 0, 0, 0, 1, 1,
-0.3285078, -0.2469016, -2.660169, 0, 0, 0, 1, 1,
-0.3280931, 0.7829257, 0.3682572, 0, 0, 0, 1, 1,
-0.324582, 1.345897, 0.823214, 1, 1, 1, 1, 1,
-0.3235542, 0.4924951, -2.036726, 1, 1, 1, 1, 1,
-0.3218094, -0.9983873, -0.4104422, 1, 1, 1, 1, 1,
-0.3175219, 1.919047, 0.05304233, 1, 1, 1, 1, 1,
-0.316846, -0.03792148, 0.08531554, 1, 1, 1, 1, 1,
-0.3166529, -0.3523094, -3.029863, 1, 1, 1, 1, 1,
-0.3163621, 0.01535291, -2.177409, 1, 1, 1, 1, 1,
-0.3157476, -0.635049, -4.178074, 1, 1, 1, 1, 1,
-0.3153964, 0.2100777, -0.0920633, 1, 1, 1, 1, 1,
-0.3132791, -0.5838093, -2.579689, 1, 1, 1, 1, 1,
-0.3124705, 0.5057404, 0.8195962, 1, 1, 1, 1, 1,
-0.30868, -0.3576953, -2.314516, 1, 1, 1, 1, 1,
-0.3070887, 0.6193959, 0.8102184, 1, 1, 1, 1, 1,
-0.3065372, -0.3411783, -1.710119, 1, 1, 1, 1, 1,
-0.3054884, -1.221483, -2.353835, 1, 1, 1, 1, 1,
-0.2975274, -1.481207, -2.294538, 0, 0, 1, 1, 1,
-0.2938263, 0.3693983, 0.653019, 1, 0, 0, 1, 1,
-0.293027, -0.9981505, -3.108451, 1, 0, 0, 1, 1,
-0.2929609, 0.5703807, -0.6573533, 1, 0, 0, 1, 1,
-0.2867664, -0.08889728, -0.7498787, 1, 0, 0, 1, 1,
-0.276868, 0.5583902, 0.05237353, 1, 0, 0, 1, 1,
-0.270959, -0.7762662, -1.609564, 0, 0, 0, 1, 1,
-0.2692075, 0.1255106, -3.071708, 0, 0, 0, 1, 1,
-0.2657139, 1.063127, -0.7040308, 0, 0, 0, 1, 1,
-0.2637322, 0.4116512, -1.744535, 0, 0, 0, 1, 1,
-0.2621162, -1.833102, -3.726447, 0, 0, 0, 1, 1,
-0.2609177, 0.8773103, -0.8425264, 0, 0, 0, 1, 1,
-0.2589381, 1.444831, -1.202047, 0, 0, 0, 1, 1,
-0.2586896, 0.2572162, -1.505757, 1, 1, 1, 1, 1,
-0.2573469, -1.326935, -2.081344, 1, 1, 1, 1, 1,
-0.2567335, 2.083765, 0.9952834, 1, 1, 1, 1, 1,
-0.2546794, 0.2134518, -0.7772501, 1, 1, 1, 1, 1,
-0.2517213, -0.1060873, -1.922691, 1, 1, 1, 1, 1,
-0.251439, -0.1995663, -3.318849, 1, 1, 1, 1, 1,
-0.251131, -0.8245302, -3.831839, 1, 1, 1, 1, 1,
-0.2479426, -0.08968359, -1.553596, 1, 1, 1, 1, 1,
-0.2476237, 1.462866, 1.246789, 1, 1, 1, 1, 1,
-0.2472012, 0.2124807, -1.593802, 1, 1, 1, 1, 1,
-0.2442585, -0.6968032, -3.268764, 1, 1, 1, 1, 1,
-0.2392052, -0.5215533, -3.63873, 1, 1, 1, 1, 1,
-0.233592, -1.139013, -2.74847, 1, 1, 1, 1, 1,
-0.2322119, 1.215831, -0.1565818, 1, 1, 1, 1, 1,
-0.2310429, 1.210685, -0.01120043, 1, 1, 1, 1, 1,
-0.2302188, -0.7712553, -2.920602, 0, 0, 1, 1, 1,
-0.2280901, -0.003796258, -2.680684, 1, 0, 0, 1, 1,
-0.2230474, -0.7083855, -0.8944515, 1, 0, 0, 1, 1,
-0.2230447, 3.296653, -1.342035, 1, 0, 0, 1, 1,
-0.2216238, 0.313578, -1.933335, 1, 0, 0, 1, 1,
-0.2193626, 1.141273, 0.7350764, 1, 0, 0, 1, 1,
-0.2139168, -1.528194, -3.244513, 0, 0, 0, 1, 1,
-0.2116583, 1.269195, 0.9123569, 0, 0, 0, 1, 1,
-0.2097121, 0.2901445, -1.143062, 0, 0, 0, 1, 1,
-0.2022042, 0.8623606, -0.767687, 0, 0, 0, 1, 1,
-0.1972892, -1.080784, -2.076894, 0, 0, 0, 1, 1,
-0.1964368, -1.236981, -1.002452, 0, 0, 0, 1, 1,
-0.1963804, 0.03327141, -1.987749, 0, 0, 0, 1, 1,
-0.1958979, 0.5195002, -0.05275324, 1, 1, 1, 1, 1,
-0.1952236, 0.7450753, -1.388841, 1, 1, 1, 1, 1,
-0.1929468, -0.1429069, -1.50085, 1, 1, 1, 1, 1,
-0.1897894, -0.6979556, -4.44276, 1, 1, 1, 1, 1,
-0.189409, 0.7430608, 0.2628752, 1, 1, 1, 1, 1,
-0.1888511, -0.1497946, -2.839114, 1, 1, 1, 1, 1,
-0.1868147, -0.8410813, -3.657111, 1, 1, 1, 1, 1,
-0.1853935, 1.548325, -0.1617226, 1, 1, 1, 1, 1,
-0.185044, 2.22027, 1.732161, 1, 1, 1, 1, 1,
-0.1825383, 1.390414, 0.8231102, 1, 1, 1, 1, 1,
-0.1818047, 0.05630989, -1.805382, 1, 1, 1, 1, 1,
-0.1813238, 1.034197, 0.6535082, 1, 1, 1, 1, 1,
-0.1784389, -0.3660071, -4.117379, 1, 1, 1, 1, 1,
-0.1776484, -1.374834, -3.774273, 1, 1, 1, 1, 1,
-0.175171, -0.1726983, -3.849756, 1, 1, 1, 1, 1,
-0.1745089, 0.0601294, -0.7841218, 0, 0, 1, 1, 1,
-0.174288, 1.612208, -0.2663961, 1, 0, 0, 1, 1,
-0.1718215, -0.8029186, -0.742174, 1, 0, 0, 1, 1,
-0.1688249, 0.4957303, 0.8685462, 1, 0, 0, 1, 1,
-0.163534, 0.294901, -1.317845, 1, 0, 0, 1, 1,
-0.1631425, -1.767183, -0.3740155, 1, 0, 0, 1, 1,
-0.1625705, 0.7207843, -0.5973678, 0, 0, 0, 1, 1,
-0.1612314, 0.01476748, -2.647166, 0, 0, 0, 1, 1,
-0.1589526, -1.034194, -2.237628, 0, 0, 0, 1, 1,
-0.1540757, 0.2896289, -2.158714, 0, 0, 0, 1, 1,
-0.146332, 0.3600509, -1.504917, 0, 0, 0, 1, 1,
-0.1439997, -1.015652, -3.343594, 0, 0, 0, 1, 1,
-0.1436949, -0.8444602, -4.089884, 0, 0, 0, 1, 1,
-0.1372267, -0.606594, -4.909064, 1, 1, 1, 1, 1,
-0.1308282, 2.068972, 0.3024981, 1, 1, 1, 1, 1,
-0.1303035, 1.102144, -0.2631215, 1, 1, 1, 1, 1,
-0.1299238, 0.3156704, 0.0370217, 1, 1, 1, 1, 1,
-0.1297918, 0.01459982, -2.82726, 1, 1, 1, 1, 1,
-0.1275906, -1.540671, -1.194295, 1, 1, 1, 1, 1,
-0.1244965, 0.4999827, -0.895442, 1, 1, 1, 1, 1,
-0.123769, -1.219501, -2.979203, 1, 1, 1, 1, 1,
-0.1216947, -0.4649662, -1.894551, 1, 1, 1, 1, 1,
-0.1212299, -0.9234035, -3.519499, 1, 1, 1, 1, 1,
-0.1185516, 0.7397206, -0.9494194, 1, 1, 1, 1, 1,
-0.11751, -1.398335, -1.84755, 1, 1, 1, 1, 1,
-0.1148854, 0.2538535, 0.4322439, 1, 1, 1, 1, 1,
-0.1083182, -0.480738, -3.720354, 1, 1, 1, 1, 1,
-0.1081529, -1.433004, -1.892388, 1, 1, 1, 1, 1,
-0.1038551, 0.08587366, 1.230871, 0, 0, 1, 1, 1,
-0.103011, 0.1893042, -1.116597, 1, 0, 0, 1, 1,
-0.09963578, 0.8462352, -1.225735, 1, 0, 0, 1, 1,
-0.08630204, -0.5972524, -1.603354, 1, 0, 0, 1, 1,
-0.0848433, 1.018685, 0.9580781, 1, 0, 0, 1, 1,
-0.08377863, -0.7677491, -2.559632, 1, 0, 0, 1, 1,
-0.08341359, 0.2215643, -0.1855865, 0, 0, 0, 1, 1,
-0.08315387, -0.6883849, -4.85589, 0, 0, 0, 1, 1,
-0.08212584, -1.389692, -3.067718, 0, 0, 0, 1, 1,
-0.08019265, 0.8832273, 0.2826082, 0, 0, 0, 1, 1,
-0.07664216, -0.7347665, -4.095644, 0, 0, 0, 1, 1,
-0.07355922, -0.2301387, -4.130196, 0, 0, 0, 1, 1,
-0.0675368, 0.9294536, -1.052035, 0, 0, 0, 1, 1,
-0.05832666, 0.7004153, -1.646493, 1, 1, 1, 1, 1,
-0.05483859, 0.0888527, -0.5415518, 1, 1, 1, 1, 1,
-0.05097073, 0.4930131, 2.824263, 1, 1, 1, 1, 1,
-0.04931574, -0.8267418, -3.665402, 1, 1, 1, 1, 1,
-0.04446495, 1.942266, -0.3968402, 1, 1, 1, 1, 1,
-0.04258787, 0.6608068, -0.8473253, 1, 1, 1, 1, 1,
-0.04246882, -1.540404, -2.93227, 1, 1, 1, 1, 1,
-0.04215766, -1.432246, -1.23313, 1, 1, 1, 1, 1,
-0.04152088, -1.845756, -2.032739, 1, 1, 1, 1, 1,
-0.03868658, 0.8604513, 1.556251, 1, 1, 1, 1, 1,
-0.03862682, -1.309039, -2.590802, 1, 1, 1, 1, 1,
-0.03731615, 0.3181784, 2.58363, 1, 1, 1, 1, 1,
-0.03371828, 1.083951, 1.43965, 1, 1, 1, 1, 1,
-0.0328634, -0.440608, -3.751259, 1, 1, 1, 1, 1,
-0.03184016, -0.381391, -1.89573, 1, 1, 1, 1, 1,
-0.03033463, 1.312715, -0.3656906, 0, 0, 1, 1, 1,
-0.02764528, -0.01656498, -2.457615, 1, 0, 0, 1, 1,
-0.02550896, -0.4696531, -2.851738, 1, 0, 0, 1, 1,
-0.02378, 0.1632714, 1.284809, 1, 0, 0, 1, 1,
-0.02197843, -0.2200092, -1.924185, 1, 0, 0, 1, 1,
-0.02098581, 1.647831, 1.180248, 1, 0, 0, 1, 1,
-0.01946697, -0.1101668, -4.171129, 0, 0, 0, 1, 1,
-0.01464274, 1.1007, -1.203357, 0, 0, 0, 1, 1,
-0.008792522, -0.5498071, -4.57794, 0, 0, 0, 1, 1,
-0.004134081, -0.5901392, -3.33105, 0, 0, 0, 1, 1,
-0.000708387, 0.0420131, 0.4367349, 0, 0, 0, 1, 1,
0.001036982, 1.698164, -0.6346126, 0, 0, 0, 1, 1,
0.002198437, -1.46681, 2.782606, 0, 0, 0, 1, 1,
0.00684024, -1.447502, 3.827297, 1, 1, 1, 1, 1,
0.007278511, 0.4278834, -0.4142742, 1, 1, 1, 1, 1,
0.00764402, 1.901137, 1.295436, 1, 1, 1, 1, 1,
0.007749985, 1.139679, 0.6311706, 1, 1, 1, 1, 1,
0.01100768, -1.23314, 4.27854, 1, 1, 1, 1, 1,
0.01150185, 0.9423352, 1.039014, 1, 1, 1, 1, 1,
0.01511709, -0.6968564, 2.602981, 1, 1, 1, 1, 1,
0.01525163, -0.1264841, 2.498812, 1, 1, 1, 1, 1,
0.01778023, 1.01269, -1.542581, 1, 1, 1, 1, 1,
0.01983234, -0.08828925, 0.8341799, 1, 1, 1, 1, 1,
0.02115012, 0.006971094, 1.231671, 1, 1, 1, 1, 1,
0.03427225, -0.01134334, 3.055735, 1, 1, 1, 1, 1,
0.03564687, -2.221948, 1.065408, 1, 1, 1, 1, 1,
0.04833197, 2.199544, 1.010221, 1, 1, 1, 1, 1,
0.05519348, -0.1408138, 2.507679, 1, 1, 1, 1, 1,
0.05707911, -0.1993504, 2.58941, 0, 0, 1, 1, 1,
0.06189633, 1.24835, -0.6827686, 1, 0, 0, 1, 1,
0.06373458, 0.7515064, 1.56114, 1, 0, 0, 1, 1,
0.06392332, -1.131939, 3.008717, 1, 0, 0, 1, 1,
0.06813655, -1.1091, 4.087637, 1, 0, 0, 1, 1,
0.06909036, -0.2969398, 2.778635, 1, 0, 0, 1, 1,
0.06938564, -0.007167086, 1.536106, 0, 0, 0, 1, 1,
0.07016667, -0.3411715, 3.055319, 0, 0, 0, 1, 1,
0.07324712, -0.8303953, 1.269681, 0, 0, 0, 1, 1,
0.07517179, -0.4908471, 2.499552, 0, 0, 0, 1, 1,
0.07743705, 1.056465, -0.6593276, 0, 0, 0, 1, 1,
0.07852709, 0.4286558, 1.22998, 0, 0, 0, 1, 1,
0.07856267, -0.5036376, 2.158865, 0, 0, 0, 1, 1,
0.07989139, -0.8066227, 2.273774, 1, 1, 1, 1, 1,
0.08119886, 1.392048, 0.1082762, 1, 1, 1, 1, 1,
0.08228478, 1.222025, 0.2601652, 1, 1, 1, 1, 1,
0.08339936, 1.019589, 0.2423899, 1, 1, 1, 1, 1,
0.08685172, -2.299477, 2.990431, 1, 1, 1, 1, 1,
0.0871407, 1.677734, 0.1252814, 1, 1, 1, 1, 1,
0.08787818, -1.933135, 2.323327, 1, 1, 1, 1, 1,
0.08946376, -0.5910031, 3.712263, 1, 1, 1, 1, 1,
0.09263548, -0.5574282, 2.161051, 1, 1, 1, 1, 1,
0.09326801, -0.01727407, 2.495415, 1, 1, 1, 1, 1,
0.09404422, -0.6421534, 4.169888, 1, 1, 1, 1, 1,
0.09873826, 0.1230972, 0.6536201, 1, 1, 1, 1, 1,
0.1001426, -0.9714136, 3.424401, 1, 1, 1, 1, 1,
0.1001865, -0.1756027, 2.115197, 1, 1, 1, 1, 1,
0.1136572, 0.7310734, 0.830663, 1, 1, 1, 1, 1,
0.1172852, -0.1047423, 1.820186, 0, 0, 1, 1, 1,
0.1208362, 0.3560286, -0.104051, 1, 0, 0, 1, 1,
0.1237892, 1.173199, -0.8191791, 1, 0, 0, 1, 1,
0.1239388, -0.6964682, 2.888271, 1, 0, 0, 1, 1,
0.1256582, -0.1412995, 1.427839, 1, 0, 0, 1, 1,
0.1256689, 0.08458978, 1.548096, 1, 0, 0, 1, 1,
0.1263259, 0.6801987, 0.5079145, 0, 0, 0, 1, 1,
0.135259, -0.3472876, 2.761039, 0, 0, 0, 1, 1,
0.1354075, 0.681246, -0.183002, 0, 0, 0, 1, 1,
0.1408218, -0.09443431, 1.8159, 0, 0, 0, 1, 1,
0.1433175, -0.1392849, 3.521595, 0, 0, 0, 1, 1,
0.1435736, 1.179273, 0.3945598, 0, 0, 0, 1, 1,
0.1437859, -2.278072, 2.392148, 0, 0, 0, 1, 1,
0.1450001, -0.3281615, 2.688641, 1, 1, 1, 1, 1,
0.1450261, 0.5329267, 1.098465, 1, 1, 1, 1, 1,
0.1454615, -1.242092, 3.24649, 1, 1, 1, 1, 1,
0.1454895, -0.3966257, 3.162839, 1, 1, 1, 1, 1,
0.1475416, 0.6954305, 0.09477263, 1, 1, 1, 1, 1,
0.1477861, 0.7865664, 0.3288963, 1, 1, 1, 1, 1,
0.1562789, 1.54234, 1.380288, 1, 1, 1, 1, 1,
0.1565019, 0.7792417, 1.241859, 1, 1, 1, 1, 1,
0.1573087, -0.7181725, 1.666098, 1, 1, 1, 1, 1,
0.1654903, 1.937184, 0.7127665, 1, 1, 1, 1, 1,
0.1706532, 0.9217865, 0.2860328, 1, 1, 1, 1, 1,
0.1723767, 1.074956, -1.03946, 1, 1, 1, 1, 1,
0.1727534, 0.08817039, 2.571609, 1, 1, 1, 1, 1,
0.1758581, -0.09012986, 2.709826, 1, 1, 1, 1, 1,
0.1777011, -0.005142515, 2.357265, 1, 1, 1, 1, 1,
0.1801421, 0.7828216, -0.1439861, 0, 0, 1, 1, 1,
0.1822673, -1.571837, 2.744312, 1, 0, 0, 1, 1,
0.1847363, 0.6203456, -0.1283288, 1, 0, 0, 1, 1,
0.18534, -0.4846812, 3.38732, 1, 0, 0, 1, 1,
0.1867149, 0.1021875, -1.247509, 1, 0, 0, 1, 1,
0.186787, -1.391653, 3.370348, 1, 0, 0, 1, 1,
0.1906692, -0.9745489, 2.734032, 0, 0, 0, 1, 1,
0.1918328, -0.4767031, 3.560836, 0, 0, 0, 1, 1,
0.1926117, -0.8671931, 1.752799, 0, 0, 0, 1, 1,
0.1940536, -0.5132489, 3.418357, 0, 0, 0, 1, 1,
0.19464, 0.8311929, -0.8599352, 0, 0, 0, 1, 1,
0.1972509, -0.911535, 2.183425, 0, 0, 0, 1, 1,
0.1972862, 0.1849779, 0.3323447, 0, 0, 0, 1, 1,
0.1975213, 0.5859507, 0.6751071, 1, 1, 1, 1, 1,
0.1983593, -0.4028589, 2.585399, 1, 1, 1, 1, 1,
0.2032616, 1.139328, -1.014829, 1, 1, 1, 1, 1,
0.2066234, -1.444008, 2.329322, 1, 1, 1, 1, 1,
0.2082902, -0.4879856, 3.666418, 1, 1, 1, 1, 1,
0.2089387, -0.1915929, 2.31758, 1, 1, 1, 1, 1,
0.2116929, -1.283298, 1.335017, 1, 1, 1, 1, 1,
0.2139558, 1.526506, 0.7026445, 1, 1, 1, 1, 1,
0.2172754, -0.6233726, 3.892895, 1, 1, 1, 1, 1,
0.2211205, -0.06305398, 2.873042, 1, 1, 1, 1, 1,
0.2260813, -1.668187, 1.504673, 1, 1, 1, 1, 1,
0.2261294, 0.5421001, 0.5098504, 1, 1, 1, 1, 1,
0.2269209, -2.379962, 1.786611, 1, 1, 1, 1, 1,
0.2292934, -0.7854741, 1.073705, 1, 1, 1, 1, 1,
0.2306362, -0.3718648, 3.967369, 1, 1, 1, 1, 1,
0.2317641, 1.646368, -0.4434937, 0, 0, 1, 1, 1,
0.233206, -1.191122, 2.407566, 1, 0, 0, 1, 1,
0.2470662, 1.579524, -1.046894, 1, 0, 0, 1, 1,
0.2472132, -0.7750155, 2.768384, 1, 0, 0, 1, 1,
0.2613695, 0.1839386, 1.114323, 1, 0, 0, 1, 1,
0.2619087, 1.324027, -0.7032352, 1, 0, 0, 1, 1,
0.2639947, 2.169788, -1.413764, 0, 0, 0, 1, 1,
0.2693097, -0.2381545, 1.299309, 0, 0, 0, 1, 1,
0.2719269, -0.9905895, 3.521383, 0, 0, 0, 1, 1,
0.2770908, 1.354394, -0.0212855, 0, 0, 0, 1, 1,
0.2789519, 0.2020899, 0.05740864, 0, 0, 0, 1, 1,
0.2856742, 0.6259732, 0.8240186, 0, 0, 0, 1, 1,
0.2869662, 0.7835392, 1.934769, 0, 0, 0, 1, 1,
0.287579, 0.1270171, 0.9464956, 1, 1, 1, 1, 1,
0.2921209, -0.2415776, 1.162207, 1, 1, 1, 1, 1,
0.2930211, 0.02574017, 0.7638785, 1, 1, 1, 1, 1,
0.294564, 0.5859885, 1.876493, 1, 1, 1, 1, 1,
0.2959263, 0.6940669, -0.8056034, 1, 1, 1, 1, 1,
0.3001179, 0.2556137, -0.5501003, 1, 1, 1, 1, 1,
0.300435, 1.42614, -0.5929273, 1, 1, 1, 1, 1,
0.3006765, 1.311084, -0.008859788, 1, 1, 1, 1, 1,
0.302904, 1.560385, 1.238908, 1, 1, 1, 1, 1,
0.306495, -0.1010122, 3.66938, 1, 1, 1, 1, 1,
0.3121062, 1.36745, 1.1366, 1, 1, 1, 1, 1,
0.3121633, -0.2009316, 3.724482, 1, 1, 1, 1, 1,
0.3138382, -0.3552824, 1.880284, 1, 1, 1, 1, 1,
0.3187343, 0.5298145, -0.9751382, 1, 1, 1, 1, 1,
0.3258449, 0.6137837, 0.792564, 1, 1, 1, 1, 1,
0.3277718, -0.06078306, 2.426234, 0, 0, 1, 1, 1,
0.3354831, 0.5561282, 1.89569, 1, 0, 0, 1, 1,
0.3391286, -1.427102, 3.630869, 1, 0, 0, 1, 1,
0.33999, -1.318461, 2.484962, 1, 0, 0, 1, 1,
0.3434713, -0.536903, 1.599946, 1, 0, 0, 1, 1,
0.3444471, 0.1121043, -0.2938818, 1, 0, 0, 1, 1,
0.3496719, -0.4605482, 2.869181, 0, 0, 0, 1, 1,
0.3518426, -0.1933442, 1.987158, 0, 0, 0, 1, 1,
0.3522243, 0.4180317, -0.1097236, 0, 0, 0, 1, 1,
0.3544089, 1.256453, -0.987734, 0, 0, 0, 1, 1,
0.3554059, -0.06168713, 1.140628, 0, 0, 0, 1, 1,
0.3557976, -0.4321708, 2.353877, 0, 0, 0, 1, 1,
0.3559098, 0.6336244, 1.056998, 0, 0, 0, 1, 1,
0.3601086, 1.806937, 1.232291, 1, 1, 1, 1, 1,
0.3627656, 1.617435, -0.4159582, 1, 1, 1, 1, 1,
0.362848, 0.7501276, -0.5493364, 1, 1, 1, 1, 1,
0.3643349, -1.36605, 1.124632, 1, 1, 1, 1, 1,
0.3722058, 0.6397951, 0.08512273, 1, 1, 1, 1, 1,
0.3740311, 0.8111404, 0.9225801, 1, 1, 1, 1, 1,
0.3786649, 0.6422648, 0.1898025, 1, 1, 1, 1, 1,
0.382977, -0.3412611, 2.048901, 1, 1, 1, 1, 1,
0.3852043, 0.6997185, 1.446997, 1, 1, 1, 1, 1,
0.3888506, -0.4753595, 3.812922, 1, 1, 1, 1, 1,
0.3890738, 0.4858938, -0.9926094, 1, 1, 1, 1, 1,
0.3890789, -0.1566117, 0.9557899, 1, 1, 1, 1, 1,
0.3897728, 0.4081161, -0.1494791, 1, 1, 1, 1, 1,
0.3974877, -0.6995526, 3.165067, 1, 1, 1, 1, 1,
0.4017404, -1.054594, 2.267634, 1, 1, 1, 1, 1,
0.4018126, -1.188732, 2.8859, 0, 0, 1, 1, 1,
0.409863, 0.1905084, 0.2700146, 1, 0, 0, 1, 1,
0.4119449, -0.4645934, 3.366976, 1, 0, 0, 1, 1,
0.4199124, -1.579361, 3.723908, 1, 0, 0, 1, 1,
0.4201648, -0.0871864, 1.774096, 1, 0, 0, 1, 1,
0.4203315, 1.72954, -1.128778, 1, 0, 0, 1, 1,
0.424643, 0.4190682, 1.484508, 0, 0, 0, 1, 1,
0.4279456, -2.047715, 1.741882, 0, 0, 0, 1, 1,
0.4290025, -0.696579, 2.754474, 0, 0, 0, 1, 1,
0.4338358, 1.249219, 0.6739697, 0, 0, 0, 1, 1,
0.4371302, -0.7137888, 3.033865, 0, 0, 0, 1, 1,
0.4377374, -1.56421, 1.718075, 0, 0, 0, 1, 1,
0.4448554, -1.226388, 2.762257, 0, 0, 0, 1, 1,
0.4452974, -0.1010849, 0.9999831, 1, 1, 1, 1, 1,
0.445914, -0.7117385, 3.245346, 1, 1, 1, 1, 1,
0.4461795, -0.6854061, 2.170581, 1, 1, 1, 1, 1,
0.4463565, 1.563119, 0.3254077, 1, 1, 1, 1, 1,
0.450942, -1.513645, 3.46989, 1, 1, 1, 1, 1,
0.4537611, -0.8969793, 3.287082, 1, 1, 1, 1, 1,
0.4539357, -0.4116483, 2.291242, 1, 1, 1, 1, 1,
0.4556903, -0.01491618, 1.825511, 1, 1, 1, 1, 1,
0.4564027, -0.04359482, 2.701422, 1, 1, 1, 1, 1,
0.4580521, -1.120337, 1.707922, 1, 1, 1, 1, 1,
0.4603986, -1.67975, 2.130792, 1, 1, 1, 1, 1,
0.4631249, 1.534582, 0.370453, 1, 1, 1, 1, 1,
0.4647266, -0.4386664, 3.957506, 1, 1, 1, 1, 1,
0.4660387, 1.274311, 0.05879012, 1, 1, 1, 1, 1,
0.4692214, 0.5325074, -0.4711241, 1, 1, 1, 1, 1,
0.4709806, 1.758377, 1.126277, 0, 0, 1, 1, 1,
0.4751427, -0.5208506, 2.483328, 1, 0, 0, 1, 1,
0.4752651, 1.357092, 1.125501, 1, 0, 0, 1, 1,
0.476306, 1.357482, 1.704492, 1, 0, 0, 1, 1,
0.4768729, -0.6127962, 2.595554, 1, 0, 0, 1, 1,
0.4817336, -0.203082, 1.662, 1, 0, 0, 1, 1,
0.4840876, -1.212424, 4.420537, 0, 0, 0, 1, 1,
0.4946707, 0.8800784, 0.7116871, 0, 0, 0, 1, 1,
0.4948944, -1.111537, 2.520598, 0, 0, 0, 1, 1,
0.4965544, -0.2137652, 1.303841, 0, 0, 0, 1, 1,
0.4973317, 0.7566572, 0.921597, 0, 0, 0, 1, 1,
0.4988033, -0.7811061, 1.840287, 0, 0, 0, 1, 1,
0.5015854, -0.7275015, 2.05545, 0, 0, 0, 1, 1,
0.5029476, -0.7373877, 2.826221, 1, 1, 1, 1, 1,
0.5051824, -1.331732, 2.620093, 1, 1, 1, 1, 1,
0.5092608, -0.3047808, 1.880031, 1, 1, 1, 1, 1,
0.509788, -0.4224615, 3.822404, 1, 1, 1, 1, 1,
0.5129389, 1.219167, 0.8041769, 1, 1, 1, 1, 1,
0.5140592, -0.6715618, 1.645034, 1, 1, 1, 1, 1,
0.5177119, -1.625614, 3.244013, 1, 1, 1, 1, 1,
0.5207298, 0.3120019, -0.1129862, 1, 1, 1, 1, 1,
0.5241719, -0.8442065, 4.165702, 1, 1, 1, 1, 1,
0.5246429, -1.0491, 3.281894, 1, 1, 1, 1, 1,
0.5253703, 2.249986, 0.9070893, 1, 1, 1, 1, 1,
0.5337108, -1.103457, 3.63615, 1, 1, 1, 1, 1,
0.5396698, 0.6381896, 1.573343, 1, 1, 1, 1, 1,
0.5410813, -1.165981, 2.549799, 1, 1, 1, 1, 1,
0.5426616, 0.5408601, 0.9762375, 1, 1, 1, 1, 1,
0.5437739, 0.9952053, -0.3957737, 0, 0, 1, 1, 1,
0.5453396, -0.5832172, 2.143259, 1, 0, 0, 1, 1,
0.5463375, -1.910061, 2.874815, 1, 0, 0, 1, 1,
0.5523375, -1.432533, 4.354306, 1, 0, 0, 1, 1,
0.5574501, -0.8029361, 2.080844, 1, 0, 0, 1, 1,
0.5658474, 1.321196, 0.6322422, 1, 0, 0, 1, 1,
0.5689687, -1.599621, 2.840439, 0, 0, 0, 1, 1,
0.5821465, 1.824685, -0.4827996, 0, 0, 0, 1, 1,
0.5867018, -0.335376, 2.134479, 0, 0, 0, 1, 1,
0.5875171, 0.3753278, 1.203395, 0, 0, 0, 1, 1,
0.5896429, 0.2202993, 0.2307058, 0, 0, 0, 1, 1,
0.5896483, 1.127887, 0.8333603, 0, 0, 0, 1, 1,
0.5947006, -0.619137, 1.989676, 0, 0, 0, 1, 1,
0.5954772, -0.3380349, 0.9417732, 1, 1, 1, 1, 1,
0.5976389, -0.6562081, 1.792157, 1, 1, 1, 1, 1,
0.5992132, -0.5660911, 3.05599, 1, 1, 1, 1, 1,
0.6000115, -0.06249549, 2.471492, 1, 1, 1, 1, 1,
0.6025387, 1.290328, 0.764857, 1, 1, 1, 1, 1,
0.6043091, -0.5398011, 2.896139, 1, 1, 1, 1, 1,
0.6058786, -0.09376589, 1.701006, 1, 1, 1, 1, 1,
0.6094954, -0.645087, 2.299426, 1, 1, 1, 1, 1,
0.609551, -0.4626726, 1.942436, 1, 1, 1, 1, 1,
0.6113198, 0.6777539, 2.617984, 1, 1, 1, 1, 1,
0.6173942, 0.9005029, -0.261737, 1, 1, 1, 1, 1,
0.619793, 0.0322786, 2.271383, 1, 1, 1, 1, 1,
0.6217319, 0.1528078, 1.407091, 1, 1, 1, 1, 1,
0.6305526, 0.7435318, 3.700072, 1, 1, 1, 1, 1,
0.6305993, -1.320047, 2.894724, 1, 1, 1, 1, 1,
0.6319996, 0.5410354, 1.119151, 0, 0, 1, 1, 1,
0.6372571, -0.1253303, 0.8534771, 1, 0, 0, 1, 1,
0.6398011, -0.82684, 4.54693, 1, 0, 0, 1, 1,
0.6427555, 0.04490205, 1.357599, 1, 0, 0, 1, 1,
0.6581342, 0.03672882, 1.420274, 1, 0, 0, 1, 1,
0.6583026, -0.5562057, 4.361879, 1, 0, 0, 1, 1,
0.6590746, 0.03858106, 1.67634, 0, 0, 0, 1, 1,
0.6619955, 0.1094981, 0.4319819, 0, 0, 0, 1, 1,
0.663756, -0.8569561, 4.364881, 0, 0, 0, 1, 1,
0.6649355, 0.4527726, 1.508887, 0, 0, 0, 1, 1,
0.6676567, -0.07808864, 1.061637, 0, 0, 0, 1, 1,
0.669478, -0.4951674, 1.69013, 0, 0, 0, 1, 1,
0.6704394, 1.199948, 0.2820741, 0, 0, 0, 1, 1,
0.6719642, 0.04005026, 0.8783376, 1, 1, 1, 1, 1,
0.6726539, 0.3406354, 1.348805, 1, 1, 1, 1, 1,
0.67572, -2.585794, 0.5898982, 1, 1, 1, 1, 1,
0.6842191, -1.98012, 3.038939, 1, 1, 1, 1, 1,
0.6859852, -0.348332, 1.217151, 1, 1, 1, 1, 1,
0.6910644, -1.261666, 2.678752, 1, 1, 1, 1, 1,
0.6920205, 0.06735543, 1.198274, 1, 1, 1, 1, 1,
0.6937557, 1.681387, -0.3758247, 1, 1, 1, 1, 1,
0.6994138, 0.3108915, 0.4337718, 1, 1, 1, 1, 1,
0.7083583, 0.9065294, 0.8496835, 1, 1, 1, 1, 1,
0.7122533, -0.7494795, 3.020287, 1, 1, 1, 1, 1,
0.7145416, -0.9905365, 2.644068, 1, 1, 1, 1, 1,
0.7148, -0.7520514, 3.711613, 1, 1, 1, 1, 1,
0.7173891, 0.3091617, 0.759925, 1, 1, 1, 1, 1,
0.7181336, 1.513357, 0.3241163, 1, 1, 1, 1, 1,
0.7213637, 0.6183662, 0.8838918, 0, 0, 1, 1, 1,
0.7248271, -0.3366711, 3.646127, 1, 0, 0, 1, 1,
0.7278339, 1.213103, 0.9100271, 1, 0, 0, 1, 1,
0.7294484, 0.8714588, 1.680065, 1, 0, 0, 1, 1,
0.7333338, -1.189443, 2.744019, 1, 0, 0, 1, 1,
0.7410794, -0.6088136, 0.9817643, 1, 0, 0, 1, 1,
0.7453022, -1.268246, 2.774412, 0, 0, 0, 1, 1,
0.748291, -1.983831, 2.799589, 0, 0, 0, 1, 1,
0.7529204, -0.4568234, 2.81722, 0, 0, 0, 1, 1,
0.7593732, 0.780196, 0.4870017, 0, 0, 0, 1, 1,
0.7631761, 0.8513681, 0.01836639, 0, 0, 0, 1, 1,
0.76431, -2.456769, 3.715638, 0, 0, 0, 1, 1,
0.7650225, 0.7881055, 1.450507, 0, 0, 0, 1, 1,
0.7659227, -0.4630952, 1.719699, 1, 1, 1, 1, 1,
0.7766331, -1.975281, 2.27985, 1, 1, 1, 1, 1,
0.7882873, 1.441025, 0.9318236, 1, 1, 1, 1, 1,
0.7899491, 0.6327996, 0.5314266, 1, 1, 1, 1, 1,
0.7963598, 0.4081877, 0.7892603, 1, 1, 1, 1, 1,
0.8016003, 0.8325148, 1.700231, 1, 1, 1, 1, 1,
0.8022166, 0.05758303, 2.340384, 1, 1, 1, 1, 1,
0.8084374, -1.293645, 2.584641, 1, 1, 1, 1, 1,
0.8106973, -0.8934149, 1.852402, 1, 1, 1, 1, 1,
0.8123295, 1.96468, -0.2711248, 1, 1, 1, 1, 1,
0.8144304, 0.7284288, 1.824815, 1, 1, 1, 1, 1,
0.8144715, -0.5844437, 1.273062, 1, 1, 1, 1, 1,
0.8182516, 0.3115831, 0.5609338, 1, 1, 1, 1, 1,
0.8205391, 0.9959867, 2.502802, 1, 1, 1, 1, 1,
0.8220679, 0.2399185, 2.300037, 1, 1, 1, 1, 1,
0.8374409, 1.087679, 2.430841, 0, 0, 1, 1, 1,
0.8552481, -2.194202, 1.892464, 1, 0, 0, 1, 1,
0.8554205, -0.1281029, 2.841128, 1, 0, 0, 1, 1,
0.8569085, 0.6159116, 0.742889, 1, 0, 0, 1, 1,
0.8570193, 0.4987217, 0.992955, 1, 0, 0, 1, 1,
0.8589514, -0.2610491, -0.3688848, 1, 0, 0, 1, 1,
0.8605754, -0.336823, 1.224564, 0, 0, 0, 1, 1,
0.8619513, 1.447589, 0.2385656, 0, 0, 0, 1, 1,
0.8625008, 0.9827904, 1.587425, 0, 0, 0, 1, 1,
0.8644748, -1.502002, 3.209321, 0, 0, 0, 1, 1,
0.8659004, -1.107763, 2.243534, 0, 0, 0, 1, 1,
0.8664597, 0.4508439, 3.028461, 0, 0, 0, 1, 1,
0.8667554, -1.328773, -0.2964305, 0, 0, 0, 1, 1,
0.868542, -0.215668, 1.370514, 1, 1, 1, 1, 1,
0.8879559, -0.5344307, 1.313249, 1, 1, 1, 1, 1,
0.8912083, -0.8149824, 2.80796, 1, 1, 1, 1, 1,
0.8926494, -1.690898, 3.473212, 1, 1, 1, 1, 1,
0.9014943, 0.2023217, 4.265204, 1, 1, 1, 1, 1,
0.9116806, 0.7519593, 2.874012, 1, 1, 1, 1, 1,
0.9156008, -0.3094423, 0.1540909, 1, 1, 1, 1, 1,
0.917363, 0.6797491, 0.6125146, 1, 1, 1, 1, 1,
0.9197776, -1.870404, 3.722932, 1, 1, 1, 1, 1,
0.9227877, 1.04521, 0.3252798, 1, 1, 1, 1, 1,
0.9229183, -0.2789843, 2.538316, 1, 1, 1, 1, 1,
0.9235682, -0.4673412, 1.666531, 1, 1, 1, 1, 1,
0.9237906, -0.6348758, 2.410513, 1, 1, 1, 1, 1,
0.9252531, 0.3970096, 0.1067621, 1, 1, 1, 1, 1,
0.9260812, 0.3918808, 1.003504, 1, 1, 1, 1, 1,
0.9281846, -0.1478624, 3.497094, 0, 0, 1, 1, 1,
0.936395, 0.1812042, 2.254994, 1, 0, 0, 1, 1,
0.9470006, 0.04875483, 1.509304, 1, 0, 0, 1, 1,
0.9515564, -0.6049673, 2.956836, 1, 0, 0, 1, 1,
0.9549133, 0.6686622, 1.250387, 1, 0, 0, 1, 1,
0.9631928, -0.5719271, 1.231074, 1, 0, 0, 1, 1,
0.9700195, -1.525033, 1.32461, 0, 0, 0, 1, 1,
0.9730125, -1.266511, 2.935785, 0, 0, 0, 1, 1,
0.9741438, 2.316699, 1.056541, 0, 0, 0, 1, 1,
0.9760038, -0.4963785, 2.177784, 0, 0, 0, 1, 1,
0.976887, 0.4082949, 0.5286072, 0, 0, 0, 1, 1,
0.9783213, -1.985784, 4.017925, 0, 0, 0, 1, 1,
0.9787363, 0.6072441, 2.392735, 0, 0, 0, 1, 1,
0.9819979, 2.079489, -0.6279523, 1, 1, 1, 1, 1,
0.9858493, -0.4075319, 0.2941159, 1, 1, 1, 1, 1,
0.986605, -0.6254997, 2.811566, 1, 1, 1, 1, 1,
0.9931155, -1.565667, 2.311792, 1, 1, 1, 1, 1,
1.011147, -0.4862953, 1.827155, 1, 1, 1, 1, 1,
1.012506, -0.4375564, 2.056182, 1, 1, 1, 1, 1,
1.013067, 0.4214106, 0.4743087, 1, 1, 1, 1, 1,
1.013828, -0.5819128, 0.7672727, 1, 1, 1, 1, 1,
1.017009, -0.2084876, 2.831191, 1, 1, 1, 1, 1,
1.021288, 0.4812367, 1.858095, 1, 1, 1, 1, 1,
1.025969, 1.003756, 0.6109904, 1, 1, 1, 1, 1,
1.028457, 1.472321, -0.5999172, 1, 1, 1, 1, 1,
1.040843, -0.04455921, 2.568117, 1, 1, 1, 1, 1,
1.043515, 1.082706, 2.44053, 1, 1, 1, 1, 1,
1.049426, -3.368027, 3.125081, 1, 1, 1, 1, 1,
1.052125, -0.03623803, 0.07046281, 0, 0, 1, 1, 1,
1.060032, 0.6124696, 1.292823, 1, 0, 0, 1, 1,
1.06946, -1.529908, 1.179394, 1, 0, 0, 1, 1,
1.070605, 1.526024, 0.5238945, 1, 0, 0, 1, 1,
1.074496, -0.4147091, 2.327642, 1, 0, 0, 1, 1,
1.077214, -0.2728286, 0.9284481, 1, 0, 0, 1, 1,
1.104648, -1.805226, 3.543655, 0, 0, 0, 1, 1,
1.11293, -0.07041536, 2.693188, 0, 0, 0, 1, 1,
1.118126, -0.1096883, 1.324188, 0, 0, 0, 1, 1,
1.119484, -0.9549578, 2.102363, 0, 0, 0, 1, 1,
1.12008, 1.063913, -0.3066602, 0, 0, 0, 1, 1,
1.131114, 2.814739, -0.627757, 0, 0, 0, 1, 1,
1.135285, 1.525378, -0.350208, 0, 0, 0, 1, 1,
1.137702, 0.1957972, 2.562154, 1, 1, 1, 1, 1,
1.140733, -0.74619, 2.21023, 1, 1, 1, 1, 1,
1.145528, 0.3392076, 2.934902, 1, 1, 1, 1, 1,
1.14773, -0.3406098, 1.280189, 1, 1, 1, 1, 1,
1.152154, 0.8027798, 1.836873, 1, 1, 1, 1, 1,
1.156244, 0.8473569, 1.551398, 1, 1, 1, 1, 1,
1.166742, -0.9178591, 1.476896, 1, 1, 1, 1, 1,
1.169608, -0.1356051, 3.387179, 1, 1, 1, 1, 1,
1.174698, -0.5526794, 1.643969, 1, 1, 1, 1, 1,
1.187411, 0.1535945, 0.2818152, 1, 1, 1, 1, 1,
1.189477, -1.686085, 2.272619, 1, 1, 1, 1, 1,
1.194589, -1.541893, 1.383481, 1, 1, 1, 1, 1,
1.200402, 1.788215, -1.301095, 1, 1, 1, 1, 1,
1.200744, -0.1744143, -0.76527, 1, 1, 1, 1, 1,
1.206071, -1.644947, 2.181432, 1, 1, 1, 1, 1,
1.21969, 1.421831, 0.1474358, 0, 0, 1, 1, 1,
1.222734, -1.009686, 0.4662352, 1, 0, 0, 1, 1,
1.222754, 1.364459, 2.338948, 1, 0, 0, 1, 1,
1.224607, -0.2359615, 0.6666217, 1, 0, 0, 1, 1,
1.235067, -0.1687269, 1.901744, 1, 0, 0, 1, 1,
1.238132, -1.033986, 0.5008734, 1, 0, 0, 1, 1,
1.250563, -0.1782814, 0.7479102, 0, 0, 0, 1, 1,
1.257856, -0.25214, 1.366646, 0, 0, 0, 1, 1,
1.2597, -0.6956111, 2.197541, 0, 0, 0, 1, 1,
1.267726, -0.313149, 0.8960346, 0, 0, 0, 1, 1,
1.27068, 1.058071, -0.5178143, 0, 0, 0, 1, 1,
1.297058, 0.2520761, 1.413225, 0, 0, 0, 1, 1,
1.297459, -0.6399972, 1.184963, 0, 0, 0, 1, 1,
1.314263, 0.547453, 0.7685471, 1, 1, 1, 1, 1,
1.324621, 2.244936, 4.450267, 1, 1, 1, 1, 1,
1.330862, 0.1801377, 0.903636, 1, 1, 1, 1, 1,
1.335103, 0.8377988, 1.464085, 1, 1, 1, 1, 1,
1.336164, -0.7122156, 2.79001, 1, 1, 1, 1, 1,
1.337285, -0.4600663, 2.695019, 1, 1, 1, 1, 1,
1.368348, 0.619972, 3.522164, 1, 1, 1, 1, 1,
1.377193, -0.7860742, 1.337756, 1, 1, 1, 1, 1,
1.379721, 0.620642, 3.34568, 1, 1, 1, 1, 1,
1.384673, 1.277628, 0.1416368, 1, 1, 1, 1, 1,
1.384978, 1.367213, 0.7576523, 1, 1, 1, 1, 1,
1.386933, 1.291509, -1.638464, 1, 1, 1, 1, 1,
1.391037, 0.3411105, 1.023282, 1, 1, 1, 1, 1,
1.391094, 0.4385864, 2.017091, 1, 1, 1, 1, 1,
1.408213, 0.0878941, 2.146926, 1, 1, 1, 1, 1,
1.411177, -0.9481947, 1.203848, 0, 0, 1, 1, 1,
1.415714, 0.5452464, 1.964763, 1, 0, 0, 1, 1,
1.434973, -0.2719482, -1.118563, 1, 0, 0, 1, 1,
1.436059, -1.568531, 0.4260692, 1, 0, 0, 1, 1,
1.443297, -0.02001571, 1.113708, 1, 0, 0, 1, 1,
1.449499, 0.8091883, 0.6143559, 1, 0, 0, 1, 1,
1.452301, -0.7977741, 3.196136, 0, 0, 0, 1, 1,
1.452641, -0.4770652, 1.009419, 0, 0, 0, 1, 1,
1.458932, 0.02335687, -0.8918068, 0, 0, 0, 1, 1,
1.465534, -0.5699228, 3.26243, 0, 0, 0, 1, 1,
1.469889, 1.24053, 1.385384, 0, 0, 0, 1, 1,
1.47204, 0.5257322, 1.395244, 0, 0, 0, 1, 1,
1.481173, -0.9443676, 0.3341946, 0, 0, 0, 1, 1,
1.495793, -0.9840753, 4.213992, 1, 1, 1, 1, 1,
1.504364, 1.354286, 2.720969, 1, 1, 1, 1, 1,
1.505812, 0.6816292, 0.356093, 1, 1, 1, 1, 1,
1.526215, 1.586673, 0.2376898, 1, 1, 1, 1, 1,
1.532379, -0.7620001, 2.830269, 1, 1, 1, 1, 1,
1.533637, -0.3276066, 1.731501, 1, 1, 1, 1, 1,
1.547359, 0.688192, 2.355964, 1, 1, 1, 1, 1,
1.548964, 1.761179, -0.04362372, 1, 1, 1, 1, 1,
1.560301, -0.745364, 2.843653, 1, 1, 1, 1, 1,
1.576007, -0.3115914, 1.274514, 1, 1, 1, 1, 1,
1.576989, 1.142461, 0.1206324, 1, 1, 1, 1, 1,
1.591143, 0.5047708, 1.292118, 1, 1, 1, 1, 1,
1.599795, 0.7226092, 0.8921313, 1, 1, 1, 1, 1,
1.599919, -1.196124, 1.378873, 1, 1, 1, 1, 1,
1.624012, -0.4549086, 1.513253, 1, 1, 1, 1, 1,
1.624483, -0.6173686, 3.291741, 0, 0, 1, 1, 1,
1.627155, -0.6113915, 3.829767, 1, 0, 0, 1, 1,
1.638208, 0.5903345, 2.785367, 1, 0, 0, 1, 1,
1.64317, -0.2340773, 2.060614, 1, 0, 0, 1, 1,
1.667968, 1.70656, 1.530943, 1, 0, 0, 1, 1,
1.66904, 1.485754, 0.2315895, 1, 0, 0, 1, 1,
1.686369, -0.1890149, 2.27651, 0, 0, 0, 1, 1,
1.687365, 0.09542444, 2.670529, 0, 0, 0, 1, 1,
1.697666, -0.5216877, 3.961237, 0, 0, 0, 1, 1,
1.697958, 1.324147, -0.1354039, 0, 0, 0, 1, 1,
1.699533, 1.462809, -0.9526454, 0, 0, 0, 1, 1,
1.700532, -0.3248107, 1.116362, 0, 0, 0, 1, 1,
1.716616, -1.186725, 2.697561, 0, 0, 0, 1, 1,
1.734236, 1.338744, 0.2297139, 1, 1, 1, 1, 1,
1.736893, 0.1230581, -0.01036827, 1, 1, 1, 1, 1,
1.783946, 0.6022975, 1.081988, 1, 1, 1, 1, 1,
1.78621, -1.783755, 2.528008, 1, 1, 1, 1, 1,
1.802809, 0.8349539, 2.6323, 1, 1, 1, 1, 1,
1.821739, 0.7158205, 1.508572, 1, 1, 1, 1, 1,
1.834099, 1.094365, 3.005616, 1, 1, 1, 1, 1,
1.866701, -1.431042, 2.631478, 1, 1, 1, 1, 1,
1.947346, -0.898084, 1.718885, 1, 1, 1, 1, 1,
1.950588, 0.0193174, 2.864732, 1, 1, 1, 1, 1,
2.041195, 2.007664, 1.183941, 1, 1, 1, 1, 1,
2.043704, 0.8752645, 2.382087, 1, 1, 1, 1, 1,
2.049518, -0.7166497, 2.716315, 1, 1, 1, 1, 1,
2.062845, 0.272673, 1.392616, 1, 1, 1, 1, 1,
2.11445, 0.5255048, 0.6218858, 1, 1, 1, 1, 1,
2.125591, 0.667478, 1.390965, 0, 0, 1, 1, 1,
2.138473, 1.196889, -0.7642267, 1, 0, 0, 1, 1,
2.156169, 0.1974702, 1.056927, 1, 0, 0, 1, 1,
2.178752, 1.034326, 1.637951, 1, 0, 0, 1, 1,
2.183084, 1.841145, 2.339841, 1, 0, 0, 1, 1,
2.201441, -1.702644, 0.9078627, 1, 0, 0, 1, 1,
2.201976, 0.7529586, 0.367129, 0, 0, 0, 1, 1,
2.217427, -0.5174431, 2.972892, 0, 0, 0, 1, 1,
2.248036, -1.53899, 1.815255, 0, 0, 0, 1, 1,
2.32627, -0.8233697, 2.774997, 0, 0, 0, 1, 1,
2.332261, 0.6092107, 1.465348, 0, 0, 0, 1, 1,
2.428389, 1.142813, 1.992078, 0, 0, 0, 1, 1,
2.560054, 0.6910354, 2.691911, 0, 0, 0, 1, 1,
2.642504, 0.9499704, 1.465494, 1, 1, 1, 1, 1,
2.651809, 0.2381328, 3.134255, 1, 1, 1, 1, 1,
2.751935, -0.2739834, 2.522825, 1, 1, 1, 1, 1,
2.785699, -1.694382, 3.053554, 1, 1, 1, 1, 1,
2.824388, -0.8817464, 1.287887, 1, 1, 1, 1, 1,
3.011578, 1.228443, 0.07528735, 1, 1, 1, 1, 1,
3.018468, -1.064941, 2.341207, 1, 1, 1, 1, 1
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
var radius = 9.267463;
var distance = 32.55157;
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
mvMatrix.translate( 0.33568, 0.03568745, 0.2195499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.55157);
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
