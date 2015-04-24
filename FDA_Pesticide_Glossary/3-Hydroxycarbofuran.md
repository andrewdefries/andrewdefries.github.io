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
-2.909096, -0.1598727, -3.436665, 1, 0, 0, 1,
-2.81085, -0.2664808, -1.837651, 1, 0.007843138, 0, 1,
-2.759063, -1.19904, -1.86958, 1, 0.01176471, 0, 1,
-2.649198, -1.961524, -2.120009, 1, 0.01960784, 0, 1,
-2.555581, 0.6028737, -1.398167, 1, 0.02352941, 0, 1,
-2.533929, 0.5370964, -1.193045, 1, 0.03137255, 0, 1,
-2.520411, -0.9883435, -2.194448, 1, 0.03529412, 0, 1,
-2.480442, 0.1087616, -2.005599, 1, 0.04313726, 0, 1,
-2.461086, -1.546534, -2.157261, 1, 0.04705882, 0, 1,
-2.455034, 0.7610726, -0.4431811, 1, 0.05490196, 0, 1,
-2.444069, -0.233356, -2.543722, 1, 0.05882353, 0, 1,
-2.443693, -1.608968, -0.4246735, 1, 0.06666667, 0, 1,
-2.411455, -0.09564868, -3.090112, 1, 0.07058824, 0, 1,
-2.351268, 0.1016911, -0.8334374, 1, 0.07843138, 0, 1,
-2.256521, 1.526255, 1.04109, 1, 0.08235294, 0, 1,
-2.180952, -0.5740145, -4.200737, 1, 0.09019608, 0, 1,
-2.178199, 0.3892242, -0.3206874, 1, 0.09411765, 0, 1,
-2.11826, 0.3856512, 0.07360142, 1, 0.1019608, 0, 1,
-2.074493, 0.1658577, -1.473717, 1, 0.1098039, 0, 1,
-2.041346, 1.058554, -1.879877, 1, 0.1137255, 0, 1,
-2.026097, 0.4404011, -1.202962, 1, 0.1215686, 0, 1,
-2.018, 0.04861739, -0.2744481, 1, 0.1254902, 0, 1,
-2.017801, 0.1198344, -1.097291, 1, 0.1333333, 0, 1,
-2.011543, -1.582469, -3.174647, 1, 0.1372549, 0, 1,
-1.991558, 0.187158, -1.46379, 1, 0.145098, 0, 1,
-1.947085, 0.8265206, -0.5328066, 1, 0.1490196, 0, 1,
-1.92267, 1.877177, -1.266302, 1, 0.1568628, 0, 1,
-1.885621, -0.8317828, -3.469266, 1, 0.1607843, 0, 1,
-1.885462, 0.07702078, -0.8417433, 1, 0.1686275, 0, 1,
-1.883173, 0.5686798, -1.358362, 1, 0.172549, 0, 1,
-1.878155, -0.08948165, -0.07064568, 1, 0.1803922, 0, 1,
-1.871642, 0.8346786, -1.500488, 1, 0.1843137, 0, 1,
-1.857888, -1.866582, -2.796109, 1, 0.1921569, 0, 1,
-1.852144, -0.3010127, -2.924564, 1, 0.1960784, 0, 1,
-1.848735, 0.2925749, -2.733906, 1, 0.2039216, 0, 1,
-1.844878, -0.8784355, -1.581824, 1, 0.2117647, 0, 1,
-1.813818, -0.4198656, -0.604375, 1, 0.2156863, 0, 1,
-1.798867, -1.434695, -2.316283, 1, 0.2235294, 0, 1,
-1.776978, -0.5340412, -2.288402, 1, 0.227451, 0, 1,
-1.771823, 0.9247352, -1.423391, 1, 0.2352941, 0, 1,
-1.769668, -0.01356687, -2.537584, 1, 0.2392157, 0, 1,
-1.76663, -0.3736305, -2.417411, 1, 0.2470588, 0, 1,
-1.765671, -1.211731, -3.564832, 1, 0.2509804, 0, 1,
-1.754733, -0.6369838, -1.235798, 1, 0.2588235, 0, 1,
-1.75045, 0.8097849, -0.5787324, 1, 0.2627451, 0, 1,
-1.748273, -0.7981731, -2.490646, 1, 0.2705882, 0, 1,
-1.736794, 0.6275842, -1.22479, 1, 0.2745098, 0, 1,
-1.736686, 0.7045592, -1.245014, 1, 0.282353, 0, 1,
-1.730472, -0.7786063, -1.858721, 1, 0.2862745, 0, 1,
-1.727251, 0.396451, -1.598349, 1, 0.2941177, 0, 1,
-1.656049, 0.0698389, -1.081337, 1, 0.3019608, 0, 1,
-1.640268, 0.1521927, -2.10371, 1, 0.3058824, 0, 1,
-1.631319, -1.146161, -1.926659, 1, 0.3137255, 0, 1,
-1.614864, -1.548503, -2.684156, 1, 0.3176471, 0, 1,
-1.61405, -0.2073621, -2.220599, 1, 0.3254902, 0, 1,
-1.604481, -0.1102765, -0.3242991, 1, 0.3294118, 0, 1,
-1.59215, 1.454951, -0.5922121, 1, 0.3372549, 0, 1,
-1.58928, 0.8093325, -1.921299, 1, 0.3411765, 0, 1,
-1.587781, 1.610821, -1.781753, 1, 0.3490196, 0, 1,
-1.572307, -0.7284269, -1.870218, 1, 0.3529412, 0, 1,
-1.556967, -0.06560465, -1.11763, 1, 0.3607843, 0, 1,
-1.555601, -0.4962494, -1.807009, 1, 0.3647059, 0, 1,
-1.529843, -1.035526, -4.375966, 1, 0.372549, 0, 1,
-1.526443, 1.272462, -1.156229, 1, 0.3764706, 0, 1,
-1.525793, -0.1546325, -2.174113, 1, 0.3843137, 0, 1,
-1.521236, 0.2934739, -1.219799, 1, 0.3882353, 0, 1,
-1.512641, -1.691026, -3.818918, 1, 0.3960784, 0, 1,
-1.508214, 0.01293743, -0.5518695, 1, 0.4039216, 0, 1,
-1.495482, 0.9785731, -0.9964445, 1, 0.4078431, 0, 1,
-1.491254, -0.3938166, -2.498552, 1, 0.4156863, 0, 1,
-1.479243, 1.422656, -2.389154, 1, 0.4196078, 0, 1,
-1.475769, 1.204787, -1.067129, 1, 0.427451, 0, 1,
-1.473016, 0.1077809, -1.502361, 1, 0.4313726, 0, 1,
-1.465924, -0.1074219, -1.497925, 1, 0.4392157, 0, 1,
-1.45136, -0.8851764, -2.030972, 1, 0.4431373, 0, 1,
-1.448424, 1.071476, -0.3005864, 1, 0.4509804, 0, 1,
-1.442427, -1.903957, -3.986948, 1, 0.454902, 0, 1,
-1.441499, 0.2200404, -1.48175, 1, 0.4627451, 0, 1,
-1.421158, 0.4171008, 0.8855295, 1, 0.4666667, 0, 1,
-1.419924, 0.7960936, -0.6178241, 1, 0.4745098, 0, 1,
-1.417836, -0.06871345, -1.888401, 1, 0.4784314, 0, 1,
-1.402672, -1.688313, -5.202065, 1, 0.4862745, 0, 1,
-1.398404, 0.1378441, -0.5290425, 1, 0.4901961, 0, 1,
-1.396806, 1.380905, -1.479118, 1, 0.4980392, 0, 1,
-1.391458, 0.7903354, -1.510765, 1, 0.5058824, 0, 1,
-1.367815, -0.4474605, -3.184738, 1, 0.509804, 0, 1,
-1.365604, 1.441492, -0.2663307, 1, 0.5176471, 0, 1,
-1.352095, 0.6009396, -1.184563, 1, 0.5215687, 0, 1,
-1.348756, 0.2369293, -2.285101, 1, 0.5294118, 0, 1,
-1.343575, -0.8744695, -2.658515, 1, 0.5333334, 0, 1,
-1.342231, -0.1756756, -2.098724, 1, 0.5411765, 0, 1,
-1.34051, -1.161066, -2.120379, 1, 0.5450981, 0, 1,
-1.337388, 0.7940043, -0.9243334, 1, 0.5529412, 0, 1,
-1.333884, -0.1235054, -1.056255, 1, 0.5568628, 0, 1,
-1.332677, -0.781683, -0.823489, 1, 0.5647059, 0, 1,
-1.332436, -0.5213863, -2.32249, 1, 0.5686275, 0, 1,
-1.320143, -1.750653, -2.225336, 1, 0.5764706, 0, 1,
-1.315687, 0.236251, -0.09528629, 1, 0.5803922, 0, 1,
-1.298361, -0.5438443, -1.285891, 1, 0.5882353, 0, 1,
-1.296844, 0.1491112, 0.4552487, 1, 0.5921569, 0, 1,
-1.280696, -0.4513394, -0.8675115, 1, 0.6, 0, 1,
-1.271324, 0.3144742, -0.964967, 1, 0.6078432, 0, 1,
-1.268217, 1.873838, 0.8473167, 1, 0.6117647, 0, 1,
-1.267875, -1.040966, -1.839102, 1, 0.6196079, 0, 1,
-1.25542, 0.6408076, 0.4526827, 1, 0.6235294, 0, 1,
-1.252435, -0.1348174, -3.375045, 1, 0.6313726, 0, 1,
-1.234053, 3.091849, -0.9565242, 1, 0.6352941, 0, 1,
-1.233524, 0.6265014, -1.054381, 1, 0.6431373, 0, 1,
-1.229767, 1.324388, -1.617787, 1, 0.6470588, 0, 1,
-1.226187, -0.1449834, -1.77891, 1, 0.654902, 0, 1,
-1.219674, -2.115571, -2.972468, 1, 0.6588235, 0, 1,
-1.215937, -1.262206, -3.293162, 1, 0.6666667, 0, 1,
-1.207778, -1.302567, -1.490126, 1, 0.6705883, 0, 1,
-1.20448, 0.8516077, -1.556069, 1, 0.6784314, 0, 1,
-1.200303, -0.2684605, -3.290068, 1, 0.682353, 0, 1,
-1.195662, -0.2525086, 0.1694319, 1, 0.6901961, 0, 1,
-1.195354, 0.8069769, -0.4429529, 1, 0.6941177, 0, 1,
-1.192933, -0.5350314, -2.022237, 1, 0.7019608, 0, 1,
-1.181032, -0.8916638, -2.52591, 1, 0.7098039, 0, 1,
-1.179831, 0.06455627, -1.673975, 1, 0.7137255, 0, 1,
-1.176774, 1.237175, -0.3018074, 1, 0.7215686, 0, 1,
-1.174419, 0.3691766, -3.398417, 1, 0.7254902, 0, 1,
-1.169859, -0.1211133, -2.454227, 1, 0.7333333, 0, 1,
-1.167446, -1.667862, -2.178713, 1, 0.7372549, 0, 1,
-1.161397, 0.1067744, -0.647305, 1, 0.7450981, 0, 1,
-1.16108, -0.6226242, -2.601103, 1, 0.7490196, 0, 1,
-1.160369, 0.1712954, -1.555763, 1, 0.7568628, 0, 1,
-1.15625, -1.046776, -2.812116, 1, 0.7607843, 0, 1,
-1.154013, 1.030281, -3.308301, 1, 0.7686275, 0, 1,
-1.138467, -0.01386297, -1.395059, 1, 0.772549, 0, 1,
-1.134846, -0.9195471, -1.220665, 1, 0.7803922, 0, 1,
-1.134807, 0.7806636, -0.4341002, 1, 0.7843137, 0, 1,
-1.129529, 1.566672, -3.34076, 1, 0.7921569, 0, 1,
-1.126281, 1.411959, -1.297563, 1, 0.7960784, 0, 1,
-1.118235, 0.7468657, -1.750538, 1, 0.8039216, 0, 1,
-1.115495, 1.460219, -1.807374, 1, 0.8117647, 0, 1,
-1.112727, 0.1038351, -2.267853, 1, 0.8156863, 0, 1,
-1.110985, 0.01677817, -1.933547, 1, 0.8235294, 0, 1,
-1.110131, 0.1639723, -1.083618, 1, 0.827451, 0, 1,
-1.103557, 2.522733, 0.17781, 1, 0.8352941, 0, 1,
-1.096564, -0.4829588, -3.765395, 1, 0.8392157, 0, 1,
-1.095708, 0.07089476, -3.103722, 1, 0.8470588, 0, 1,
-1.093998, -0.6408764, -2.494395, 1, 0.8509804, 0, 1,
-1.093245, -0.2600265, -1.785504, 1, 0.8588235, 0, 1,
-1.092758, -0.221476, -2.723639, 1, 0.8627451, 0, 1,
-1.090124, 1.110041, -2.843146, 1, 0.8705882, 0, 1,
-1.0859, -0.7119544, -1.747358, 1, 0.8745098, 0, 1,
-1.075221, 0.2770477, -1.307235, 1, 0.8823529, 0, 1,
-1.074101, 2.025989, -0.2721637, 1, 0.8862745, 0, 1,
-1.072834, 1.705071, -0.8193229, 1, 0.8941177, 0, 1,
-1.071522, -0.5973774, -2.124774, 1, 0.8980392, 0, 1,
-1.071082, 1.257166, 0.5608258, 1, 0.9058824, 0, 1,
-1.061472, 0.8821645, -1.806623, 1, 0.9137255, 0, 1,
-1.045605, -1.010046, -0.7505862, 1, 0.9176471, 0, 1,
-1.040267, 0.7493021, -1.449863, 1, 0.9254902, 0, 1,
-1.030872, -0.05939024, -0.6277002, 1, 0.9294118, 0, 1,
-1.027433, 1.695747, -0.4763638, 1, 0.9372549, 0, 1,
-1.022146, -1.270771, -2.113662, 1, 0.9411765, 0, 1,
-1.019597, 0.07217067, -0.7668515, 1, 0.9490196, 0, 1,
-1.016158, -0.287665, -3.361968, 1, 0.9529412, 0, 1,
-1.007835, -0.1562913, -1.155611, 1, 0.9607843, 0, 1,
-0.994203, -1.121265, -2.331802, 1, 0.9647059, 0, 1,
-0.9910936, -0.5590069, -0.2297029, 1, 0.972549, 0, 1,
-0.9890427, -0.448774, -1.363166, 1, 0.9764706, 0, 1,
-0.9847466, 1.522864, 0.3379399, 1, 0.9843137, 0, 1,
-0.9836869, 0.4021448, -0.0874931, 1, 0.9882353, 0, 1,
-0.9815072, -0.1512654, -0.7753265, 1, 0.9960784, 0, 1,
-0.979287, -0.7289885, -2.63728, 0.9960784, 1, 0, 1,
-0.9761316, -0.2385999, -1.139004, 0.9921569, 1, 0, 1,
-0.9628913, 0.2905147, 0.2523493, 0.9843137, 1, 0, 1,
-0.9583495, 1.002813, -0.1072329, 0.9803922, 1, 0, 1,
-0.9538261, -0.8239403, -3.352856, 0.972549, 1, 0, 1,
-0.953431, -0.2541481, -0.1932146, 0.9686275, 1, 0, 1,
-0.952952, 1.290217, -0.9870404, 0.9607843, 1, 0, 1,
-0.9522597, -0.523725, -2.883431, 0.9568627, 1, 0, 1,
-0.9499344, -2.162113, -2.425124, 0.9490196, 1, 0, 1,
-0.9427213, 0.9472466, -0.9168052, 0.945098, 1, 0, 1,
-0.9423187, -0.4390301, -2.444128, 0.9372549, 1, 0, 1,
-0.9369031, 0.3657762, -2.271693, 0.9333333, 1, 0, 1,
-0.9326959, -2.438249, -1.659351, 0.9254902, 1, 0, 1,
-0.931012, -1.257079, -2.911884, 0.9215686, 1, 0, 1,
-0.9292805, -0.5229626, -2.139557, 0.9137255, 1, 0, 1,
-0.9292073, 1.537906, 0.08245115, 0.9098039, 1, 0, 1,
-0.9274133, -0.8689997, -2.702564, 0.9019608, 1, 0, 1,
-0.9184911, -0.7179089, -0.1265283, 0.8941177, 1, 0, 1,
-0.9147404, 0.3811456, -0.8954782, 0.8901961, 1, 0, 1,
-0.9056762, -0.4117183, -1.148594, 0.8823529, 1, 0, 1,
-0.9021119, -0.4197261, -2.521476, 0.8784314, 1, 0, 1,
-0.8946468, -2.0224, -1.549117, 0.8705882, 1, 0, 1,
-0.893011, 0.1880817, -0.6677358, 0.8666667, 1, 0, 1,
-0.8863012, -1.069872, -4.352775, 0.8588235, 1, 0, 1,
-0.8851423, -1.538909, -2.407689, 0.854902, 1, 0, 1,
-0.8784035, 0.3920401, -0.3945886, 0.8470588, 1, 0, 1,
-0.878285, 0.5764059, 0.0789336, 0.8431373, 1, 0, 1,
-0.8771545, -1.012266, -2.044178, 0.8352941, 1, 0, 1,
-0.8745728, -0.03034948, -1.886235, 0.8313726, 1, 0, 1,
-0.8703325, 1.164337, -0.6095166, 0.8235294, 1, 0, 1,
-0.8607993, 0.2626012, -1.940068, 0.8196079, 1, 0, 1,
-0.8586941, 0.4445668, -0.722865, 0.8117647, 1, 0, 1,
-0.8536582, 0.2975256, -1.846926, 0.8078431, 1, 0, 1,
-0.8473316, 0.6032268, 0.6661598, 0.8, 1, 0, 1,
-0.836558, 0.4842458, -1.422582, 0.7921569, 1, 0, 1,
-0.8364829, 0.4576536, -0.2758081, 0.7882353, 1, 0, 1,
-0.8325397, 0.4758637, -0.7573619, 0.7803922, 1, 0, 1,
-0.8274254, -0.1306856, -1.987591, 0.7764706, 1, 0, 1,
-0.8247703, 0.4861968, -2.507923, 0.7686275, 1, 0, 1,
-0.824357, 0.7841358, -1.359696, 0.7647059, 1, 0, 1,
-0.8143693, 1.229811, -1.99619, 0.7568628, 1, 0, 1,
-0.8045995, 0.4079866, -0.8071531, 0.7529412, 1, 0, 1,
-0.8041683, -0.07737847, -0.8728383, 0.7450981, 1, 0, 1,
-0.8024225, 0.6086143, 0.8640766, 0.7411765, 1, 0, 1,
-0.8007352, -0.02788526, -2.043682, 0.7333333, 1, 0, 1,
-0.7908517, -1.436614, -3.150898, 0.7294118, 1, 0, 1,
-0.790054, 2.227664, -1.990988, 0.7215686, 1, 0, 1,
-0.7884356, 0.2954642, -0.5323185, 0.7176471, 1, 0, 1,
-0.7831188, -0.6212274, -0.4331005, 0.7098039, 1, 0, 1,
-0.7820128, -1.864821, -4.62904, 0.7058824, 1, 0, 1,
-0.7819785, -1.207047, -3.814629, 0.6980392, 1, 0, 1,
-0.7792818, -1.16406, -3.121721, 0.6901961, 1, 0, 1,
-0.778002, 0.9820976, 1.499241, 0.6862745, 1, 0, 1,
-0.7775465, 0.2080888, -0.6980835, 0.6784314, 1, 0, 1,
-0.7697206, 0.8992119, -0.2562323, 0.6745098, 1, 0, 1,
-0.7658607, 1.464621, -0.6220049, 0.6666667, 1, 0, 1,
-0.7609069, 0.8427096, -0.9206227, 0.6627451, 1, 0, 1,
-0.7601681, -0.2934171, -2.357394, 0.654902, 1, 0, 1,
-0.7588995, 0.003239516, -2.100715, 0.6509804, 1, 0, 1,
-0.7564971, -0.03908655, -1.701194, 0.6431373, 1, 0, 1,
-0.7530936, 0.2741074, -0.7165073, 0.6392157, 1, 0, 1,
-0.7498242, 0.3382985, -0.9774389, 0.6313726, 1, 0, 1,
-0.7479826, 1.188514, -0.3817022, 0.627451, 1, 0, 1,
-0.7441632, -0.2514921, 0.4155038, 0.6196079, 1, 0, 1,
-0.7438608, -0.395355, 0.2963915, 0.6156863, 1, 0, 1,
-0.7384909, 0.8070343, -1.72211, 0.6078432, 1, 0, 1,
-0.7348144, 0.5832124, -0.04366065, 0.6039216, 1, 0, 1,
-0.7321175, -2.419473, -2.44759, 0.5960785, 1, 0, 1,
-0.7311425, 0.3257028, -0.9159882, 0.5882353, 1, 0, 1,
-0.7301136, -0.7639589, -1.694223, 0.5843138, 1, 0, 1,
-0.7289284, -0.5880513, -3.212732, 0.5764706, 1, 0, 1,
-0.7271326, 0.8605641, -0.8268886, 0.572549, 1, 0, 1,
-0.7268643, -0.7874558, -3.607203, 0.5647059, 1, 0, 1,
-0.7195079, -1.755983, -2.132903, 0.5607843, 1, 0, 1,
-0.7193192, 0.5796186, -2.715095, 0.5529412, 1, 0, 1,
-0.7156788, 1.437186, -0.469696, 0.5490196, 1, 0, 1,
-0.7092371, -0.03393175, -2.68057, 0.5411765, 1, 0, 1,
-0.7062681, 1.050982, -0.4473438, 0.5372549, 1, 0, 1,
-0.7035961, 2.054891, 0.9122109, 0.5294118, 1, 0, 1,
-0.6918201, -0.1499622, -1.257297, 0.5254902, 1, 0, 1,
-0.6880823, -0.2473326, -1.793901, 0.5176471, 1, 0, 1,
-0.687003, 1.356389, 0.2577384, 0.5137255, 1, 0, 1,
-0.6838565, -1.447875, -2.663567, 0.5058824, 1, 0, 1,
-0.6809198, 1.091483, -0.6219624, 0.5019608, 1, 0, 1,
-0.6773164, -0.4873707, -0.6227382, 0.4941176, 1, 0, 1,
-0.6761058, 0.05060938, -2.883173, 0.4862745, 1, 0, 1,
-0.6735553, -0.3246303, -2.310059, 0.4823529, 1, 0, 1,
-0.6675587, -0.2394853, -1.490928, 0.4745098, 1, 0, 1,
-0.6664059, -1.04223, -3.005181, 0.4705882, 1, 0, 1,
-0.6663283, 0.05846233, -2.584281, 0.4627451, 1, 0, 1,
-0.6646314, -1.405778, -1.971565, 0.4588235, 1, 0, 1,
-0.6605766, -0.3154199, -2.200175, 0.4509804, 1, 0, 1,
-0.656576, 0.1818795, -0.8463453, 0.4470588, 1, 0, 1,
-0.6563171, 0.7556681, -1.422762, 0.4392157, 1, 0, 1,
-0.6517473, -0.5423806, -2.971092, 0.4352941, 1, 0, 1,
-0.6513869, -1.972233, -1.587247, 0.427451, 1, 0, 1,
-0.6475614, -1.1583, -2.229338, 0.4235294, 1, 0, 1,
-0.6465228, 0.8937966, -0.7153201, 0.4156863, 1, 0, 1,
-0.6401429, -1.024086, -0.7856617, 0.4117647, 1, 0, 1,
-0.6400558, -0.4503235, -0.5431897, 0.4039216, 1, 0, 1,
-0.6390408, -0.5094723, -0.9512528, 0.3960784, 1, 0, 1,
-0.6387577, 0.4501983, -1.826287, 0.3921569, 1, 0, 1,
-0.6364115, 0.3346712, 0.4351115, 0.3843137, 1, 0, 1,
-0.6357637, 0.4691015, -3.606941, 0.3803922, 1, 0, 1,
-0.6351674, 0.9060285, -0.9141945, 0.372549, 1, 0, 1,
-0.632461, -1.191754, -1.52851, 0.3686275, 1, 0, 1,
-0.6323981, -1.623143, -2.564442, 0.3607843, 1, 0, 1,
-0.6310017, -0.6588467, -1.918975, 0.3568628, 1, 0, 1,
-0.6287503, 0.09046375, -2.183336, 0.3490196, 1, 0, 1,
-0.6243615, -0.6530067, -3.837158, 0.345098, 1, 0, 1,
-0.6161659, 1.257693, 1.002001, 0.3372549, 1, 0, 1,
-0.6119049, -1.417108, -2.023847, 0.3333333, 1, 0, 1,
-0.6100029, -0.7924524, -2.826124, 0.3254902, 1, 0, 1,
-0.6098616, 2.342256, -0.1595443, 0.3215686, 1, 0, 1,
-0.6072083, 0.6906504, -0.3410698, 0.3137255, 1, 0, 1,
-0.6028346, 1.996597, -1.155714, 0.3098039, 1, 0, 1,
-0.6028227, -1.344688, -3.459766, 0.3019608, 1, 0, 1,
-0.6012009, -0.2532386, -0.9502628, 0.2941177, 1, 0, 1,
-0.5983149, 0.6039163, -1.006808, 0.2901961, 1, 0, 1,
-0.5957307, -0.4449955, -1.972515, 0.282353, 1, 0, 1,
-0.592309, -0.334384, -4.058149, 0.2784314, 1, 0, 1,
-0.5914089, 0.002242058, -2.099933, 0.2705882, 1, 0, 1,
-0.5880116, -0.8155487, -2.694133, 0.2666667, 1, 0, 1,
-0.5846289, 0.05394585, 0.6774676, 0.2588235, 1, 0, 1,
-0.5830867, 0.3279628, -1.285673, 0.254902, 1, 0, 1,
-0.581997, 0.6034716, -2.33734, 0.2470588, 1, 0, 1,
-0.5798073, 0.862703, -0.05874312, 0.2431373, 1, 0, 1,
-0.5783811, -0.1175723, -2.975082, 0.2352941, 1, 0, 1,
-0.5746158, 0.4456397, -2.193814, 0.2313726, 1, 0, 1,
-0.5744242, 1.098573, -0.2917035, 0.2235294, 1, 0, 1,
-0.5721981, -0.3356339, -1.365295, 0.2196078, 1, 0, 1,
-0.5661894, 0.3783622, 0.1546165, 0.2117647, 1, 0, 1,
-0.5581316, 0.1431758, -1.518252, 0.2078431, 1, 0, 1,
-0.5510709, 0.643904, -0.2857643, 0.2, 1, 0, 1,
-0.5462121, 0.3235914, -1.511734, 0.1921569, 1, 0, 1,
-0.5457527, 0.1374227, -2.6586, 0.1882353, 1, 0, 1,
-0.5440103, -0.4643342, -1.707135, 0.1803922, 1, 0, 1,
-0.5434451, 0.4142182, 0.05602936, 0.1764706, 1, 0, 1,
-0.5397837, 0.02796562, -0.1854925, 0.1686275, 1, 0, 1,
-0.5389023, -0.8314112, -0.1222732, 0.1647059, 1, 0, 1,
-0.5358331, -1.173595, -2.969292, 0.1568628, 1, 0, 1,
-0.5356854, 0.03469401, -1.166591, 0.1529412, 1, 0, 1,
-0.5352135, -1.301158, -3.414783, 0.145098, 1, 0, 1,
-0.5332362, 1.232453, -0.6110039, 0.1411765, 1, 0, 1,
-0.5314603, 1.33359, -1.088159, 0.1333333, 1, 0, 1,
-0.531197, -0.6574396, -2.073923, 0.1294118, 1, 0, 1,
-0.5134628, -0.4611198, -2.418025, 0.1215686, 1, 0, 1,
-0.5132001, -1.242617, -4.27437, 0.1176471, 1, 0, 1,
-0.5125402, -0.5060049, -1.548819, 0.1098039, 1, 0, 1,
-0.5111645, -1.692137, -3.214152, 0.1058824, 1, 0, 1,
-0.5073307, -0.0440689, -2.731386, 0.09803922, 1, 0, 1,
-0.5001802, 0.4196371, -2.491428, 0.09019608, 1, 0, 1,
-0.4972744, 0.3273222, -1.581695, 0.08627451, 1, 0, 1,
-0.4930506, 0.4377362, -0.925809, 0.07843138, 1, 0, 1,
-0.4885233, -0.8941191, -3.201044, 0.07450981, 1, 0, 1,
-0.4881513, 1.136715, 1.196777, 0.06666667, 1, 0, 1,
-0.4834616, 0.5570643, -0.7361571, 0.0627451, 1, 0, 1,
-0.4828826, 0.5540178, 0.6443868, 0.05490196, 1, 0, 1,
-0.4814939, -0.3595413, -0.2417884, 0.05098039, 1, 0, 1,
-0.4765232, -0.1589752, -1.748745, 0.04313726, 1, 0, 1,
-0.4725059, -1.385214, -2.799897, 0.03921569, 1, 0, 1,
-0.4716479, 1.517275, -1.780707, 0.03137255, 1, 0, 1,
-0.4704702, -0.05985844, -0.6715971, 0.02745098, 1, 0, 1,
-0.4646324, 0.2098881, -1.176482, 0.01960784, 1, 0, 1,
-0.459365, -0.5519094, -1.525318, 0.01568628, 1, 0, 1,
-0.4589284, -0.1261945, -2.212374, 0.007843138, 1, 0, 1,
-0.4542215, -1.058349, -2.879719, 0.003921569, 1, 0, 1,
-0.4541187, -0.4449792, -1.644933, 0, 1, 0.003921569, 1,
-0.4535956, -0.7994068, -2.353052, 0, 1, 0.01176471, 1,
-0.4534212, -1.447496, -4.008319, 0, 1, 0.01568628, 1,
-0.4533686, 1.123466, -1.723302, 0, 1, 0.02352941, 1,
-0.4438771, 1.711764, 0.2813455, 0, 1, 0.02745098, 1,
-0.4394168, 0.3861296, -1.32674, 0, 1, 0.03529412, 1,
-0.4391901, 0.0680856, -1.028253, 0, 1, 0.03921569, 1,
-0.4371744, -0.292688, -2.264032, 0, 1, 0.04705882, 1,
-0.425846, -0.8914467, -4.461167, 0, 1, 0.05098039, 1,
-0.421118, -0.4293266, -4.537213, 0, 1, 0.05882353, 1,
-0.4166463, 0.7524247, -3.21958, 0, 1, 0.0627451, 1,
-0.415298, 0.9664617, 0.398719, 0, 1, 0.07058824, 1,
-0.4092513, 0.7871259, -1.749889, 0, 1, 0.07450981, 1,
-0.4081319, -1.125281, -2.539785, 0, 1, 0.08235294, 1,
-0.4077923, 0.7439975, 0.3217137, 0, 1, 0.08627451, 1,
-0.4017366, -0.2753551, -1.84829, 0, 1, 0.09411765, 1,
-0.3913783, -0.1984887, -0.001224016, 0, 1, 0.1019608, 1,
-0.3833211, 0.5542959, 1.000719, 0, 1, 0.1058824, 1,
-0.3819678, 0.2422416, 0.738353, 0, 1, 0.1137255, 1,
-0.377154, 0.834823, -2.42409, 0, 1, 0.1176471, 1,
-0.3756644, 1.516305, 1.130355, 0, 1, 0.1254902, 1,
-0.3743147, 0.1695564, -2.220514, 0, 1, 0.1294118, 1,
-0.3696436, -0.7655883, -2.629164, 0, 1, 0.1372549, 1,
-0.3660227, -0.6162678, -4.246697, 0, 1, 0.1411765, 1,
-0.3654552, -0.7728316, -3.758945, 0, 1, 0.1490196, 1,
-0.3605452, 1.166125, -2.669536, 0, 1, 0.1529412, 1,
-0.3556377, -0.1050458, -2.524698, 0, 1, 0.1607843, 1,
-0.3520341, 0.6870639, -1.100812, 0, 1, 0.1647059, 1,
-0.3513568, 1.238933, -1.01412, 0, 1, 0.172549, 1,
-0.3421827, -0.101383, -1.870362, 0, 1, 0.1764706, 1,
-0.3412811, 1.364327, 0.5686417, 0, 1, 0.1843137, 1,
-0.3398435, 0.8273731, -0.6787497, 0, 1, 0.1882353, 1,
-0.3367718, 0.636946, -1.377567, 0, 1, 0.1960784, 1,
-0.3363296, -0.6639218, -2.406567, 0, 1, 0.2039216, 1,
-0.3352116, 0.8230081, 0.4521664, 0, 1, 0.2078431, 1,
-0.3323852, 0.5895823, 0.1594442, 0, 1, 0.2156863, 1,
-0.3319679, -0.4976896, -2.884865, 0, 1, 0.2196078, 1,
-0.3297895, -0.8268071, -2.838402, 0, 1, 0.227451, 1,
-0.3295581, 0.1068042, -0.7678196, 0, 1, 0.2313726, 1,
-0.3293109, 0.6612664, -0.8907281, 0, 1, 0.2392157, 1,
-0.3290889, -0.2768483, -3.292197, 0, 1, 0.2431373, 1,
-0.3274027, -1.220779, -1.679494, 0, 1, 0.2509804, 1,
-0.3268929, -0.04373704, -1.167934, 0, 1, 0.254902, 1,
-0.3256007, 0.7482402, -0.227944, 0, 1, 0.2627451, 1,
-0.3237232, -0.5212393, -2.851437, 0, 1, 0.2666667, 1,
-0.3235689, -0.2580532, -2.097229, 0, 1, 0.2745098, 1,
-0.3204343, -0.3576014, -1.798421, 0, 1, 0.2784314, 1,
-0.3200552, 1.739154, -1.242187, 0, 1, 0.2862745, 1,
-0.3149982, -0.05427973, -4.532603, 0, 1, 0.2901961, 1,
-0.3089729, 0.1684793, 0.210471, 0, 1, 0.2980392, 1,
-0.3088488, -1.389682, -2.457568, 0, 1, 0.3058824, 1,
-0.3024418, 0.2564833, 0.5720216, 0, 1, 0.3098039, 1,
-0.2996672, -2.05596, -2.236108, 0, 1, 0.3176471, 1,
-0.2884004, -1.853134, -1.895754, 0, 1, 0.3215686, 1,
-0.284908, -0.5803229, -2.540021, 0, 1, 0.3294118, 1,
-0.2842168, -0.09064901, -2.658054, 0, 1, 0.3333333, 1,
-0.2822959, -0.4229075, -1.972044, 0, 1, 0.3411765, 1,
-0.2821311, 1.190378, 0.5008877, 0, 1, 0.345098, 1,
-0.2790025, -1.019616, -2.731128, 0, 1, 0.3529412, 1,
-0.2778378, 0.6489036, -0.7283907, 0, 1, 0.3568628, 1,
-0.2752259, -0.2667595, -2.997715, 0, 1, 0.3647059, 1,
-0.2719931, -1.300674, -0.9914895, 0, 1, 0.3686275, 1,
-0.2708337, 0.3413482, 0.04258691, 0, 1, 0.3764706, 1,
-0.2672463, -1.61509, -2.854023, 0, 1, 0.3803922, 1,
-0.2644575, 0.04440762, -0.8965265, 0, 1, 0.3882353, 1,
-0.2630303, -0.7833118, -2.983451, 0, 1, 0.3921569, 1,
-0.2608919, 1.503807, -0.8631733, 0, 1, 0.4, 1,
-0.2544068, -0.2707977, -1.932904, 0, 1, 0.4078431, 1,
-0.2528876, -0.3149043, -0.6394144, 0, 1, 0.4117647, 1,
-0.2492335, 0.8487878, -0.4221719, 0, 1, 0.4196078, 1,
-0.2460097, 1.495458, 0.3581891, 0, 1, 0.4235294, 1,
-0.2455577, 0.02698431, -1.01666, 0, 1, 0.4313726, 1,
-0.2443081, 0.7047433, -0.7153204, 0, 1, 0.4352941, 1,
-0.2383429, 1.022864, -0.8616305, 0, 1, 0.4431373, 1,
-0.2382661, -0.2338369, -3.167676, 0, 1, 0.4470588, 1,
-0.2364984, 0.679, 0.4675219, 0, 1, 0.454902, 1,
-0.2353685, 1.242717, -0.5221688, 0, 1, 0.4588235, 1,
-0.233582, -0.02669992, -0.6384565, 0, 1, 0.4666667, 1,
-0.2329195, -0.9596514, -2.793988, 0, 1, 0.4705882, 1,
-0.2293068, 0.7983862, -1.101346, 0, 1, 0.4784314, 1,
-0.2292166, -2.232978, -3.065312, 0, 1, 0.4823529, 1,
-0.226005, 0.4366951, -0.4278934, 0, 1, 0.4901961, 1,
-0.2250904, 0.960331, 0.09520153, 0, 1, 0.4941176, 1,
-0.2237086, -0.3044189, -2.132936, 0, 1, 0.5019608, 1,
-0.2212891, -1.136719, -3.198915, 0, 1, 0.509804, 1,
-0.2189965, 0.9408334, -0.9835895, 0, 1, 0.5137255, 1,
-0.2171435, 0.2273882, -0.4752502, 0, 1, 0.5215687, 1,
-0.2163158, -0.2166422, -2.852164, 0, 1, 0.5254902, 1,
-0.2136712, -0.2193628, -1.201376, 0, 1, 0.5333334, 1,
-0.2117793, 0.8273341, -2.318006, 0, 1, 0.5372549, 1,
-0.2113328, -0.4458426, -1.957049, 0, 1, 0.5450981, 1,
-0.2111, -1.318073, -2.636486, 0, 1, 0.5490196, 1,
-0.2003854, 0.6417485, -0.456096, 0, 1, 0.5568628, 1,
-0.1991472, 0.005531929, -1.969873, 0, 1, 0.5607843, 1,
-0.1989437, 0.8762119, -0.6103461, 0, 1, 0.5686275, 1,
-0.1958049, 0.1482766, -0.7301763, 0, 1, 0.572549, 1,
-0.1906738, 1.564664, 0.8408948, 0, 1, 0.5803922, 1,
-0.1894495, -0.4137276, -2.060446, 0, 1, 0.5843138, 1,
-0.1878583, -0.8754267, -3.398288, 0, 1, 0.5921569, 1,
-0.1704415, -0.8981293, -1.762007, 0, 1, 0.5960785, 1,
-0.1694159, 0.8196529, 0.3121361, 0, 1, 0.6039216, 1,
-0.1668855, -0.4385845, -3.099319, 0, 1, 0.6117647, 1,
-0.1657812, -0.8840048, -3.864553, 0, 1, 0.6156863, 1,
-0.1649515, 1.504185, 2.195447, 0, 1, 0.6235294, 1,
-0.1617068, -1.446583, -2.573111, 0, 1, 0.627451, 1,
-0.1615819, 0.7609574, -0.5603503, 0, 1, 0.6352941, 1,
-0.1604672, 0.3379775, -0.0009744242, 0, 1, 0.6392157, 1,
-0.1577064, -1.374841, -3.715743, 0, 1, 0.6470588, 1,
-0.15728, 1.204365, -0.09390721, 0, 1, 0.6509804, 1,
-0.154067, 0.7142223, -1.179536, 0, 1, 0.6588235, 1,
-0.1532509, 0.8009855, -1.679597, 0, 1, 0.6627451, 1,
-0.1527567, 0.1854612, 0.4893402, 0, 1, 0.6705883, 1,
-0.1455346, 0.6040546, 1.71627, 0, 1, 0.6745098, 1,
-0.1446423, 0.2241931, -1.810855, 0, 1, 0.682353, 1,
-0.1406862, -0.5835812, -3.407434, 0, 1, 0.6862745, 1,
-0.1362351, -1.201013, -3.983651, 0, 1, 0.6941177, 1,
-0.1318694, 0.1820714, -0.7884155, 0, 1, 0.7019608, 1,
-0.1271483, -2.092714, -2.705999, 0, 1, 0.7058824, 1,
-0.1229975, -0.2595617, -0.9995059, 0, 1, 0.7137255, 1,
-0.1212985, -2.318603, -4.481207, 0, 1, 0.7176471, 1,
-0.1210476, 1.407523, -0.1382583, 0, 1, 0.7254902, 1,
-0.1194645, 0.3454726, -0.8669565, 0, 1, 0.7294118, 1,
-0.1193467, 0.659137, 0.4678245, 0, 1, 0.7372549, 1,
-0.1174686, 1.340787, -0.3008647, 0, 1, 0.7411765, 1,
-0.1153162, 0.02640338, -2.093854, 0, 1, 0.7490196, 1,
-0.110297, -0.7278765, -3.532704, 0, 1, 0.7529412, 1,
-0.1079948, -2.061972, -3.302296, 0, 1, 0.7607843, 1,
-0.1068235, -1.775681, -1.870244, 0, 1, 0.7647059, 1,
-0.1039077, -1.32233, -1.64834, 0, 1, 0.772549, 1,
-0.1035618, -0.2328581, -0.9973132, 0, 1, 0.7764706, 1,
-0.1027436, -1.025445, -2.986101, 0, 1, 0.7843137, 1,
-0.09910869, -0.4997117, -3.578737, 0, 1, 0.7882353, 1,
-0.09763931, -0.1456749, -3.322118, 0, 1, 0.7960784, 1,
-0.09690818, 0.07455553, -1.927863, 0, 1, 0.8039216, 1,
-0.09520326, 0.7797404, -0.6096476, 0, 1, 0.8078431, 1,
-0.0905585, -1.090263, -4.459402, 0, 1, 0.8156863, 1,
-0.0895448, 0.9426606, -0.1776371, 0, 1, 0.8196079, 1,
-0.08788282, -0.002025363, -1.057887, 0, 1, 0.827451, 1,
-0.08718039, -0.09327536, -3.031858, 0, 1, 0.8313726, 1,
-0.08686434, -0.4758771, -1.775625, 0, 1, 0.8392157, 1,
-0.08634113, 1.325469, 0.5103247, 0, 1, 0.8431373, 1,
-0.08465847, -1.337941, -1.987063, 0, 1, 0.8509804, 1,
-0.07936142, -0.2895616, -2.127262, 0, 1, 0.854902, 1,
-0.07567854, -0.9790387, -2.485284, 0, 1, 0.8627451, 1,
-0.07419753, 0.9084368, 0.5822254, 0, 1, 0.8666667, 1,
-0.06955496, -0.5604568, -3.340201, 0, 1, 0.8745098, 1,
-0.06509526, -2.437373, -2.78349, 0, 1, 0.8784314, 1,
-0.06495304, 0.6035059, -0.07898004, 0, 1, 0.8862745, 1,
-0.06408801, 2.079194, 0.8825062, 0, 1, 0.8901961, 1,
-0.06145492, 0.1838901, 0.2724121, 0, 1, 0.8980392, 1,
-0.05756623, -0.9245459, -3.184163, 0, 1, 0.9058824, 1,
-0.05744698, 0.6664694, 0.4522378, 0, 1, 0.9098039, 1,
-0.05590939, -0.432351, -2.480347, 0, 1, 0.9176471, 1,
-0.05498904, 2.945657, 0.05940492, 0, 1, 0.9215686, 1,
-0.05242945, 1.013688, -0.1453732, 0, 1, 0.9294118, 1,
-0.04804294, 0.5139664, 0.1719909, 0, 1, 0.9333333, 1,
-0.04758928, 0.3133933, 0.3785168, 0, 1, 0.9411765, 1,
-0.04517812, -1.332884, -4.352779, 0, 1, 0.945098, 1,
-0.043764, 1.070586, 1.012669, 0, 1, 0.9529412, 1,
-0.04189765, -1.034904, -2.378457, 0, 1, 0.9568627, 1,
-0.04083074, -2.053684, -3.789951, 0, 1, 0.9647059, 1,
-0.03933077, 0.4618194, 0.5746481, 0, 1, 0.9686275, 1,
-0.03733452, 1.0885, 1.052013, 0, 1, 0.9764706, 1,
-0.03375098, 0.1249429, -0.1505562, 0, 1, 0.9803922, 1,
-0.03358173, 1.062335, 0.1267577, 0, 1, 0.9882353, 1,
-0.032791, 0.1228613, -1.906401, 0, 1, 0.9921569, 1,
-0.03158005, -2.000534, -3.663266, 0, 1, 1, 1,
-0.02908525, 1.273118, -0.4011741, 0, 0.9921569, 1, 1,
-0.02825616, -0.12158, -3.028601, 0, 0.9882353, 1, 1,
-0.01858182, 1.614751, -1.752396, 0, 0.9803922, 1, 1,
-0.01388151, 0.1620117, 0.4614567, 0, 0.9764706, 1, 1,
-0.0138117, 0.7083301, 0.3879832, 0, 0.9686275, 1, 1,
-0.01332294, -1.933192, -2.41185, 0, 0.9647059, 1, 1,
-0.01259462, 1.305552, -1.642226, 0, 0.9568627, 1, 1,
-0.009980381, -0.829229, -2.556955, 0, 0.9529412, 1, 1,
-0.004086857, 1.442611, -0.3172178, 0, 0.945098, 1, 1,
-0.003423246, -0.05506427, -4.005119, 0, 0.9411765, 1, 1,
-0.001243868, -1.304511, -4.573719, 0, 0.9333333, 1, 1,
0.0005414836, -0.1779564, 3.039947, 0, 0.9294118, 1, 1,
0.00851771, 0.3717204, 0.4358383, 0, 0.9215686, 1, 1,
0.008607931, 1.041132, -0.8041797, 0, 0.9176471, 1, 1,
0.01052772, -0.2181706, 4.201422, 0, 0.9098039, 1, 1,
0.01227514, 1.533768, -1.095903, 0, 0.9058824, 1, 1,
0.01398803, 0.5429706, 0.03623118, 0, 0.8980392, 1, 1,
0.01621362, -2.209083, 1.615296, 0, 0.8901961, 1, 1,
0.01790913, -1.391125, 4.486933, 0, 0.8862745, 1, 1,
0.02128037, 1.374795, 0.4521883, 0, 0.8784314, 1, 1,
0.02636748, -1.515076, 2.320955, 0, 0.8745098, 1, 1,
0.02668914, -2.564782, 2.946148, 0, 0.8666667, 1, 1,
0.03183794, 0.7611232, -1.305196, 0, 0.8627451, 1, 1,
0.03438373, -0.9344622, 4.199365, 0, 0.854902, 1, 1,
0.03658503, -1.493257, 2.746571, 0, 0.8509804, 1, 1,
0.03922116, -1.39766, 1.887706, 0, 0.8431373, 1, 1,
0.04010195, -0.5603303, 2.485592, 0, 0.8392157, 1, 1,
0.04089976, 0.1746406, 1.086794, 0, 0.8313726, 1, 1,
0.04097648, -0.5428724, 3.54633, 0, 0.827451, 1, 1,
0.0412892, -0.313071, 1.585646, 0, 0.8196079, 1, 1,
0.0416045, -0.864769, 2.947298, 0, 0.8156863, 1, 1,
0.04269578, 0.6099226, -0.9411687, 0, 0.8078431, 1, 1,
0.04619975, 0.1257113, 0.05134692, 0, 0.8039216, 1, 1,
0.04676572, 0.5621828, -0.6106879, 0, 0.7960784, 1, 1,
0.05212884, -0.9184856, 2.286628, 0, 0.7882353, 1, 1,
0.05416071, 0.1562156, -0.4231198, 0, 0.7843137, 1, 1,
0.05458174, -1.983456, 4.433063, 0, 0.7764706, 1, 1,
0.06196866, -0.7752256, 1.807685, 0, 0.772549, 1, 1,
0.06325327, -0.1953148, 3.49738, 0, 0.7647059, 1, 1,
0.06523218, -0.01441074, 2.880451, 0, 0.7607843, 1, 1,
0.06602566, 0.2467006, 0.8012512, 0, 0.7529412, 1, 1,
0.06655059, 0.4246805, -0.04124055, 0, 0.7490196, 1, 1,
0.06887721, 0.2965844, -0.8949482, 0, 0.7411765, 1, 1,
0.07390096, 1.6415, 1.463125, 0, 0.7372549, 1, 1,
0.07833463, 0.9777687, 2.070771, 0, 0.7294118, 1, 1,
0.08214726, 0.5167983, 0.1156973, 0, 0.7254902, 1, 1,
0.08335496, 0.03860132, -0.03068428, 0, 0.7176471, 1, 1,
0.08371727, -0.00243235, 0.8151929, 0, 0.7137255, 1, 1,
0.08417529, -0.0460405, 1.709158, 0, 0.7058824, 1, 1,
0.08476805, 0.9485752, -0.6154116, 0, 0.6980392, 1, 1,
0.08613426, -2.202771, 2.708613, 0, 0.6941177, 1, 1,
0.08760138, 0.2582186, 1.215357, 0, 0.6862745, 1, 1,
0.08801036, -0.4762333, 2.495641, 0, 0.682353, 1, 1,
0.08869429, -0.7803991, 2.164518, 0, 0.6745098, 1, 1,
0.09339446, 0.3728746, -0.546612, 0, 0.6705883, 1, 1,
0.0936681, -0.1525747, 3.613898, 0, 0.6627451, 1, 1,
0.09524134, 0.5221099, -0.6706471, 0, 0.6588235, 1, 1,
0.09756495, -0.7019826, 2.513431, 0, 0.6509804, 1, 1,
0.09956606, -0.3613596, 2.836979, 0, 0.6470588, 1, 1,
0.1083022, 1.318526, 0.8424951, 0, 0.6392157, 1, 1,
0.1087599, -1.156005, 3.691233, 0, 0.6352941, 1, 1,
0.1096066, -0.5912761, 3.37472, 0, 0.627451, 1, 1,
0.112834, 0.008158533, 1.877842, 0, 0.6235294, 1, 1,
0.1150903, 1.087351, 0.1206611, 0, 0.6156863, 1, 1,
0.1181329, -0.7244462, 2.187756, 0, 0.6117647, 1, 1,
0.1228249, -0.2491495, 4.091792, 0, 0.6039216, 1, 1,
0.1247216, -1.103986, 3.44688, 0, 0.5960785, 1, 1,
0.1260534, 0.2202407, 0.5036637, 0, 0.5921569, 1, 1,
0.1291212, 1.236042, 0.09444308, 0, 0.5843138, 1, 1,
0.130894, -0.6005398, 3.525249, 0, 0.5803922, 1, 1,
0.1329214, 0.04641312, 0.7920318, 0, 0.572549, 1, 1,
0.1335352, -0.05648509, 3.879215, 0, 0.5686275, 1, 1,
0.1338893, 1.219214, 0.1731051, 0, 0.5607843, 1, 1,
0.1357594, -0.6964892, 1.709497, 0, 0.5568628, 1, 1,
0.1373633, -0.8811051, 4.441673, 0, 0.5490196, 1, 1,
0.1376154, 0.2038429, 2.740782, 0, 0.5450981, 1, 1,
0.1415335, 0.1825729, 0.6030939, 0, 0.5372549, 1, 1,
0.14226, 0.3119682, 0.9932721, 0, 0.5333334, 1, 1,
0.1428388, -0.1749425, 1.082158, 0, 0.5254902, 1, 1,
0.1440988, -0.7119793, 1.405919, 0, 0.5215687, 1, 1,
0.1468315, -1.749698, 3.463934, 0, 0.5137255, 1, 1,
0.1488179, -1.065194, 2.031842, 0, 0.509804, 1, 1,
0.1560608, 0.3701194, 0.4768134, 0, 0.5019608, 1, 1,
0.1612284, 0.06194928, 0.8260031, 0, 0.4941176, 1, 1,
0.1613228, 0.6444144, -0.5354806, 0, 0.4901961, 1, 1,
0.1617408, -2.073129, 4.953752, 0, 0.4823529, 1, 1,
0.1636503, -0.2249671, 2.441419, 0, 0.4784314, 1, 1,
0.1668788, -0.6238702, 3.6271, 0, 0.4705882, 1, 1,
0.1693111, 0.9839835, -0.3573865, 0, 0.4666667, 1, 1,
0.1737695, -1.109229, 4.612678, 0, 0.4588235, 1, 1,
0.1766384, -1.140176, 2.648844, 0, 0.454902, 1, 1,
0.1771375, 1.662352, -0.06839941, 0, 0.4470588, 1, 1,
0.1772091, -0.1401576, 1.163339, 0, 0.4431373, 1, 1,
0.1826994, -0.6626392, 4.020166, 0, 0.4352941, 1, 1,
0.190294, 1.435591, 0.1805926, 0, 0.4313726, 1, 1,
0.1937973, 0.7661476, 0.64696, 0, 0.4235294, 1, 1,
0.1945972, 0.8191576, 1.079891, 0, 0.4196078, 1, 1,
0.1967451, -0.08404608, 1.915636, 0, 0.4117647, 1, 1,
0.1997056, -0.0004875547, 2.473564, 0, 0.4078431, 1, 1,
0.1999245, -0.6123703, 3.577337, 0, 0.4, 1, 1,
0.2058369, 0.4153935, -0.3595848, 0, 0.3921569, 1, 1,
0.2074664, 1.738422, -0.116658, 0, 0.3882353, 1, 1,
0.2078875, -1.48489, 3.724952, 0, 0.3803922, 1, 1,
0.2112848, 1.427731, 0.3468611, 0, 0.3764706, 1, 1,
0.2137613, -0.1941097, 2.140739, 0, 0.3686275, 1, 1,
0.2148089, -1.345091, 3.911505, 0, 0.3647059, 1, 1,
0.2149493, 0.7852759, 0.5904827, 0, 0.3568628, 1, 1,
0.2205871, -0.1478592, 1.51549, 0, 0.3529412, 1, 1,
0.2215546, 0.5498331, -0.2466547, 0, 0.345098, 1, 1,
0.2231417, -0.04518669, 0.5210925, 0, 0.3411765, 1, 1,
0.2237715, 0.7056543, 0.3332074, 0, 0.3333333, 1, 1,
0.2251758, 0.1921506, -0.1469262, 0, 0.3294118, 1, 1,
0.2284771, -0.79835, 1.889797, 0, 0.3215686, 1, 1,
0.23005, -1.227841, 3.550571, 0, 0.3176471, 1, 1,
0.2366962, 2.21222, -0.3069225, 0, 0.3098039, 1, 1,
0.2368218, 1.510139, -0.3101481, 0, 0.3058824, 1, 1,
0.238777, 0.3747196, 1.368575, 0, 0.2980392, 1, 1,
0.242433, 0.2672384, -0.588681, 0, 0.2901961, 1, 1,
0.2427309, 0.8426552, 1.48543, 0, 0.2862745, 1, 1,
0.2445978, -0.7492554, 2.941013, 0, 0.2784314, 1, 1,
0.2467125, 0.387263, 1.292989, 0, 0.2745098, 1, 1,
0.247576, 0.3359405, 0.9713787, 0, 0.2666667, 1, 1,
0.2510296, -0.6418306, 3.604517, 0, 0.2627451, 1, 1,
0.2547899, -1.725819, 1.535638, 0, 0.254902, 1, 1,
0.2571563, 0.5665872, 1.868059, 0, 0.2509804, 1, 1,
0.2584043, 0.09725464, 1.468342, 0, 0.2431373, 1, 1,
0.2660337, 0.8890125, -0.6812953, 0, 0.2392157, 1, 1,
0.2685349, -0.7757247, 1.830262, 0, 0.2313726, 1, 1,
0.2700793, 0.1399489, 1.124462, 0, 0.227451, 1, 1,
0.2788192, 0.7934058, -0.7516813, 0, 0.2196078, 1, 1,
0.2799714, 0.04203339, 0.723229, 0, 0.2156863, 1, 1,
0.2801853, 2.161605, 1.09374, 0, 0.2078431, 1, 1,
0.2937022, -0.3726741, 1.183242, 0, 0.2039216, 1, 1,
0.2980212, 0.7967674, 0.03115563, 0, 0.1960784, 1, 1,
0.2985184, 1.87169, 0.2896639, 0, 0.1882353, 1, 1,
0.3005024, 1.683626, -0.06126921, 0, 0.1843137, 1, 1,
0.3021093, -0.4366901, 2.717448, 0, 0.1764706, 1, 1,
0.305163, -2.267841, 3.570455, 0, 0.172549, 1, 1,
0.3059961, -0.9571509, 2.095584, 0, 0.1647059, 1, 1,
0.308522, 0.1333911, -0.1010648, 0, 0.1607843, 1, 1,
0.3099307, -0.2299783, 2.351617, 0, 0.1529412, 1, 1,
0.3100188, 1.189266, -0.7768665, 0, 0.1490196, 1, 1,
0.3145079, 1.047633, 0.045717, 0, 0.1411765, 1, 1,
0.3156854, 0.9826255, -1.194098, 0, 0.1372549, 1, 1,
0.3162848, -0.4660186, 3.352407, 0, 0.1294118, 1, 1,
0.3264268, 1.303116, -0.7273081, 0, 0.1254902, 1, 1,
0.3285188, -0.5567225, 2.106493, 0, 0.1176471, 1, 1,
0.3296989, 2.223297, -0.9077138, 0, 0.1137255, 1, 1,
0.3327756, 0.6244475, 1.263366, 0, 0.1058824, 1, 1,
0.33286, 1.112715, 0.5701807, 0, 0.09803922, 1, 1,
0.3336753, -0.5799292, 2.405085, 0, 0.09411765, 1, 1,
0.3344625, -0.4972058, 2.288927, 0, 0.08627451, 1, 1,
0.3350293, -0.6666524, 3.296285, 0, 0.08235294, 1, 1,
0.3375276, 0.9755979, -0.7365314, 0, 0.07450981, 1, 1,
0.3421194, -0.9151828, 1.826164, 0, 0.07058824, 1, 1,
0.3424935, -1.564905, 4.202631, 0, 0.0627451, 1, 1,
0.3442361, -2.180294, 3.929188, 0, 0.05882353, 1, 1,
0.3447767, -0.2605518, 1.850771, 0, 0.05098039, 1, 1,
0.3467796, -0.6762687, 2.460695, 0, 0.04705882, 1, 1,
0.3497306, -0.3485976, 2.067628, 0, 0.03921569, 1, 1,
0.3511848, -0.1263045, 1.566447, 0, 0.03529412, 1, 1,
0.3525144, -0.2692007, 2.979852, 0, 0.02745098, 1, 1,
0.3538949, 0.2458207, 0.75872, 0, 0.02352941, 1, 1,
0.3563547, 0.19779, 0.5354157, 0, 0.01568628, 1, 1,
0.3574235, 2.473507, -0.4275757, 0, 0.01176471, 1, 1,
0.359177, -0.2718118, 1.013803, 0, 0.003921569, 1, 1,
0.3603533, -1.348781, 3.941201, 0.003921569, 0, 1, 1,
0.3641224, -0.8763632, 1.220146, 0.007843138, 0, 1, 1,
0.3664535, -3.002694, 1.942532, 0.01568628, 0, 1, 1,
0.3670839, 0.3366677, 1.890935, 0.01960784, 0, 1, 1,
0.3823693, 0.2640783, 0.818048, 0.02745098, 0, 1, 1,
0.3831092, -1.059158, 3.019565, 0.03137255, 0, 1, 1,
0.3859049, 0.2655759, 0.1112132, 0.03921569, 0, 1, 1,
0.392955, -0.5658134, 1.344914, 0.04313726, 0, 1, 1,
0.3980166, 0.5733566, 0.4590307, 0.05098039, 0, 1, 1,
0.3982859, -0.04399492, 0.3703584, 0.05490196, 0, 1, 1,
0.4001684, -0.5536287, 0.8430862, 0.0627451, 0, 1, 1,
0.4004903, 1.58775, 1.025806, 0.06666667, 0, 1, 1,
0.4017514, -0.403642, 0.5852268, 0.07450981, 0, 1, 1,
0.4029522, -1.166735, 2.256631, 0.07843138, 0, 1, 1,
0.4034518, -1.695792, 2.750548, 0.08627451, 0, 1, 1,
0.4043554, 1.045232, 0.3269379, 0.09019608, 0, 1, 1,
0.4067554, -0.008395263, 0.6451284, 0.09803922, 0, 1, 1,
0.4099724, 0.5595774, 0.9032958, 0.1058824, 0, 1, 1,
0.4113567, -1.182345, 2.474324, 0.1098039, 0, 1, 1,
0.413644, -1.348974, 3.925175, 0.1176471, 0, 1, 1,
0.4163322, 1.957191, -0.04794263, 0.1215686, 0, 1, 1,
0.4180103, 1.69867, -0.1395398, 0.1294118, 0, 1, 1,
0.4208702, -0.2767815, 1.280903, 0.1333333, 0, 1, 1,
0.4229787, 2.068409, 0.7345107, 0.1411765, 0, 1, 1,
0.4257599, -1.23546, 3.124581, 0.145098, 0, 1, 1,
0.4287946, 0.6675417, 0.3225102, 0.1529412, 0, 1, 1,
0.4450718, -0.1539461, 1.928922, 0.1568628, 0, 1, 1,
0.4452476, -0.5680679, 1.925706, 0.1647059, 0, 1, 1,
0.4452711, 0.704953, 2.373089, 0.1686275, 0, 1, 1,
0.44767, -0.6989458, 2.726539, 0.1764706, 0, 1, 1,
0.4477098, 0.1140431, 1.055356, 0.1803922, 0, 1, 1,
0.4477503, -0.2844043, 2.422938, 0.1882353, 0, 1, 1,
0.4593388, -1.38315, 3.738283, 0.1921569, 0, 1, 1,
0.462002, 1.27287, -0.7981671, 0.2, 0, 1, 1,
0.4655952, 0.09958946, 1.992324, 0.2078431, 0, 1, 1,
0.4681727, -0.5607257, 3.68907, 0.2117647, 0, 1, 1,
0.473611, -1.140767, 1.664284, 0.2196078, 0, 1, 1,
0.4759034, -0.01676877, 1.095231, 0.2235294, 0, 1, 1,
0.4765868, -0.4041713, 1.518806, 0.2313726, 0, 1, 1,
0.4769193, -0.06823238, 2.711237, 0.2352941, 0, 1, 1,
0.4774679, -0.5523243, 1.796217, 0.2431373, 0, 1, 1,
0.4815844, -0.1435493, 1.284226, 0.2470588, 0, 1, 1,
0.4865952, 0.9511986, 1.192571, 0.254902, 0, 1, 1,
0.499472, 0.04506278, 0.4196193, 0.2588235, 0, 1, 1,
0.5016814, 0.3827699, 0.02276134, 0.2666667, 0, 1, 1,
0.5023708, 0.3583332, 1.035531, 0.2705882, 0, 1, 1,
0.5024915, -0.3691373, 3.617211, 0.2784314, 0, 1, 1,
0.5055038, -0.09674512, 1.665465, 0.282353, 0, 1, 1,
0.5075011, -0.932394, 1.398797, 0.2901961, 0, 1, 1,
0.507538, -0.8979559, 4.355567, 0.2941177, 0, 1, 1,
0.5125413, -0.8610213, 2.868506, 0.3019608, 0, 1, 1,
0.5139682, -0.7468873, 2.856757, 0.3098039, 0, 1, 1,
0.5147802, 1.031847, 0.4197715, 0.3137255, 0, 1, 1,
0.5156419, 0.540404, 0.468285, 0.3215686, 0, 1, 1,
0.5164448, -0.1527939, 1.795935, 0.3254902, 0, 1, 1,
0.5177202, -0.9272292, 2.798558, 0.3333333, 0, 1, 1,
0.517859, -2.351776, 4.693825, 0.3372549, 0, 1, 1,
0.5275688, -0.3077189, 1.264996, 0.345098, 0, 1, 1,
0.5289424, -0.7491478, 1.773195, 0.3490196, 0, 1, 1,
0.5327099, 0.02744372, 1.46893, 0.3568628, 0, 1, 1,
0.5340961, -0.208803, 2.328644, 0.3607843, 0, 1, 1,
0.5356734, 0.1018022, 3.494853, 0.3686275, 0, 1, 1,
0.5378484, -0.8113374, 2.841539, 0.372549, 0, 1, 1,
0.539273, -0.671556, 2.75778, 0.3803922, 0, 1, 1,
0.5401614, 0.4987518, -1.437274, 0.3843137, 0, 1, 1,
0.5414617, -0.9317567, 4.613667, 0.3921569, 0, 1, 1,
0.5422754, -0.8368318, 3.448755, 0.3960784, 0, 1, 1,
0.5437101, -0.3927345, 3.848423, 0.4039216, 0, 1, 1,
0.5463672, -1.938937, 3.543337, 0.4117647, 0, 1, 1,
0.5534146, -0.6911383, 1.459487, 0.4156863, 0, 1, 1,
0.563521, 0.887908, 1.156917, 0.4235294, 0, 1, 1,
0.5639572, -1.196368, 2.772046, 0.427451, 0, 1, 1,
0.5697052, 0.3491579, 1.426952, 0.4352941, 0, 1, 1,
0.5741111, 1.405007, -0.2741169, 0.4392157, 0, 1, 1,
0.5769856, 1.106009, 1.949986, 0.4470588, 0, 1, 1,
0.5812554, 1.44927, 1.177953, 0.4509804, 0, 1, 1,
0.5813654, 0.04525135, 1.394911, 0.4588235, 0, 1, 1,
0.5818298, -0.5018617, 1.748296, 0.4627451, 0, 1, 1,
0.5880414, -0.4176803, 1.16043, 0.4705882, 0, 1, 1,
0.5901235, 1.419806, -0.7397162, 0.4745098, 0, 1, 1,
0.5960778, 0.4842802, 0.8452474, 0.4823529, 0, 1, 1,
0.5969696, -0.6251349, 2.468077, 0.4862745, 0, 1, 1,
0.6016797, -0.3753147, 2.267724, 0.4941176, 0, 1, 1,
0.6052263, -1.090389, 3.4717, 0.5019608, 0, 1, 1,
0.60555, -2.213305, 1.721292, 0.5058824, 0, 1, 1,
0.6068035, -0.8632966, 2.786949, 0.5137255, 0, 1, 1,
0.6076533, 0.2688952, 0.822129, 0.5176471, 0, 1, 1,
0.6111872, -0.3647843, 2.701165, 0.5254902, 0, 1, 1,
0.6210672, 1.092713, 1.976687, 0.5294118, 0, 1, 1,
0.6275727, 1.264953, -0.0802265, 0.5372549, 0, 1, 1,
0.6276116, -0.3843417, 1.452661, 0.5411765, 0, 1, 1,
0.6284171, -0.6805021, 1.302805, 0.5490196, 0, 1, 1,
0.629079, 0.177829, 2.249494, 0.5529412, 0, 1, 1,
0.6335272, 0.3783917, 1.973013, 0.5607843, 0, 1, 1,
0.6338972, -0.2796514, 1.619913, 0.5647059, 0, 1, 1,
0.6387177, 0.5047871, -0.3911542, 0.572549, 0, 1, 1,
0.6387798, -0.7144387, 4.181092, 0.5764706, 0, 1, 1,
0.6418294, -0.2902108, 2.522593, 0.5843138, 0, 1, 1,
0.6420299, -0.2481784, 2.081748, 0.5882353, 0, 1, 1,
0.6468523, 0.7654278, 1.016933, 0.5960785, 0, 1, 1,
0.6497498, 0.2351186, 0.891378, 0.6039216, 0, 1, 1,
0.65212, -1.16068, 2.441077, 0.6078432, 0, 1, 1,
0.6531639, 1.478129, 0.3911785, 0.6156863, 0, 1, 1,
0.6575812, -0.1321768, 1.0717, 0.6196079, 0, 1, 1,
0.6625552, -0.8968548, 0.8092384, 0.627451, 0, 1, 1,
0.6642695, 2.276181, -1.378101, 0.6313726, 0, 1, 1,
0.6691086, -0.181087, 2.115628, 0.6392157, 0, 1, 1,
0.6726053, 0.6748282, 0.9193, 0.6431373, 0, 1, 1,
0.6750968, -0.4688091, 2.073359, 0.6509804, 0, 1, 1,
0.6762813, 0.3423338, -0.0178245, 0.654902, 0, 1, 1,
0.6773119, 0.9175779, -1.15746, 0.6627451, 0, 1, 1,
0.690024, -1.216775, 2.677106, 0.6666667, 0, 1, 1,
0.691301, 1.673548, 1.80074, 0.6745098, 0, 1, 1,
0.6956611, 0.3477014, 1.237283, 0.6784314, 0, 1, 1,
0.6959991, 1.496219, 0.540073, 0.6862745, 0, 1, 1,
0.697728, -0.5710002, 0.7608886, 0.6901961, 0, 1, 1,
0.6989141, 1.140857, -0.1134615, 0.6980392, 0, 1, 1,
0.7009465, -1.941373, 3.848667, 0.7058824, 0, 1, 1,
0.702168, 1.111, 0.7611298, 0.7098039, 0, 1, 1,
0.7123787, 0.008170529, 2.977269, 0.7176471, 0, 1, 1,
0.7128829, 1.490723, 2.134167, 0.7215686, 0, 1, 1,
0.7170551, 0.8295594, 3.361471, 0.7294118, 0, 1, 1,
0.7174016, 1.022159, 0.7854679, 0.7333333, 0, 1, 1,
0.7216454, 0.8302706, 1.172975, 0.7411765, 0, 1, 1,
0.7248771, -1.775353, 2.529646, 0.7450981, 0, 1, 1,
0.7351505, -0.4941031, 2.213118, 0.7529412, 0, 1, 1,
0.7430075, 1.715498, 1.2248, 0.7568628, 0, 1, 1,
0.7561991, -0.3966376, 1.533375, 0.7647059, 0, 1, 1,
0.7583749, -0.1339594, 3.529118, 0.7686275, 0, 1, 1,
0.7622572, 0.2637538, 1.193882, 0.7764706, 0, 1, 1,
0.7630238, 1.038378, 1.965262, 0.7803922, 0, 1, 1,
0.7640321, -1.316558, 1.458325, 0.7882353, 0, 1, 1,
0.7646474, 0.6289108, -0.8458547, 0.7921569, 0, 1, 1,
0.7665145, 0.5313056, 1.205294, 0.8, 0, 1, 1,
0.768918, 0.1228515, -0.4234655, 0.8078431, 0, 1, 1,
0.7689877, 0.6317447, 0.82167, 0.8117647, 0, 1, 1,
0.7709916, -0.1909189, 2.571561, 0.8196079, 0, 1, 1,
0.7714398, -0.3708478, 1.039763, 0.8235294, 0, 1, 1,
0.7732038, -0.4414902, 2.050603, 0.8313726, 0, 1, 1,
0.7792271, -0.4951901, 1.249012, 0.8352941, 0, 1, 1,
0.7824334, -0.774024, 2.396991, 0.8431373, 0, 1, 1,
0.7834656, 0.1246807, 2.750956, 0.8470588, 0, 1, 1,
0.7898166, 0.717871, 1.592043, 0.854902, 0, 1, 1,
0.7902769, -0.5794393, 1.607083, 0.8588235, 0, 1, 1,
0.7910704, -0.5274945, 1.489313, 0.8666667, 0, 1, 1,
0.7946324, -0.0388291, -0.54158, 0.8705882, 0, 1, 1,
0.7948397, -0.6641194, 2.625686, 0.8784314, 0, 1, 1,
0.8108332, -0.8488991, 3.912132, 0.8823529, 0, 1, 1,
0.8239388, 0.99548, 0.283702, 0.8901961, 0, 1, 1,
0.827651, 0.9750744, 1.889063, 0.8941177, 0, 1, 1,
0.8411064, -0.9704929, 2.06182, 0.9019608, 0, 1, 1,
0.8421152, 0.01076805, 0.872202, 0.9098039, 0, 1, 1,
0.8436941, 0.617366, 0.5595533, 0.9137255, 0, 1, 1,
0.8453965, -0.289551, 2.802613, 0.9215686, 0, 1, 1,
0.8542774, -0.1090946, 2.724923, 0.9254902, 0, 1, 1,
0.8590232, -1.522627, 1.470936, 0.9333333, 0, 1, 1,
0.8595169, -0.9281064, 3.141988, 0.9372549, 0, 1, 1,
0.8606586, -2.104964, 1.334566, 0.945098, 0, 1, 1,
0.8683719, -0.6866994, 1.209631, 0.9490196, 0, 1, 1,
0.8729925, -0.8326719, 0.1277177, 0.9568627, 0, 1, 1,
0.8735132, -0.333881, 2.104752, 0.9607843, 0, 1, 1,
0.8816144, 0.8272271, -1.931069, 0.9686275, 0, 1, 1,
0.8827038, -0.5275931, 2.617256, 0.972549, 0, 1, 1,
0.8827981, -1.157837, 2.498227, 0.9803922, 0, 1, 1,
0.8879259, -0.3206788, 0.8383656, 0.9843137, 0, 1, 1,
0.890149, 0.5465586, 0.006234912, 0.9921569, 0, 1, 1,
0.8951576, 1.052697, 0.9728388, 0.9960784, 0, 1, 1,
0.901029, 0.03856344, -0.9448004, 1, 0, 0.9960784, 1,
0.9191898, 0.05340255, 2.193121, 1, 0, 0.9882353, 1,
0.9201295, -0.5072671, 1.135787, 1, 0, 0.9843137, 1,
0.9294503, 1.309099, 1.630751, 1, 0, 0.9764706, 1,
0.9297165, 0.3422529, 0.9528981, 1, 0, 0.972549, 1,
0.9349461, 0.8304866, 0.8101511, 1, 0, 0.9647059, 1,
0.9462669, -1.877969, 0.6169339, 1, 0, 0.9607843, 1,
0.9537188, -0.5676233, 2.26722, 1, 0, 0.9529412, 1,
0.9644244, 1.395323, 0.725762, 1, 0, 0.9490196, 1,
0.9665251, -0.4232285, 2.218397, 1, 0, 0.9411765, 1,
0.9678987, 0.3372513, 1.445832, 1, 0, 0.9372549, 1,
0.9716472, 0.429007, 1.323454, 1, 0, 0.9294118, 1,
0.9738669, 0.9469572, 1.379238, 1, 0, 0.9254902, 1,
0.9794878, 0.1553987, 1.224862, 1, 0, 0.9176471, 1,
0.9823844, 0.3439999, 0.3516282, 1, 0, 0.9137255, 1,
0.9867492, -0.03046599, 1.033852, 1, 0, 0.9058824, 1,
0.9904953, -1.367968, 1.725267, 1, 0, 0.9019608, 1,
0.9939616, 1.787098, 0.6576002, 1, 0, 0.8941177, 1,
0.9955259, 2.100103, 0.8463271, 1, 0, 0.8862745, 1,
1.005961, -0.826722, 0.4414352, 1, 0, 0.8823529, 1,
1.00667, -0.1460118, 0.4982889, 1, 0, 0.8745098, 1,
1.007671, 0.9517046, 0.7264895, 1, 0, 0.8705882, 1,
1.008764, 1.659651, -0.1009765, 1, 0, 0.8627451, 1,
1.020005, -0.2270654, 1.970029, 1, 0, 0.8588235, 1,
1.022838, 0.09706269, 1.731449, 1, 0, 0.8509804, 1,
1.022977, 0.1895474, 1.511254, 1, 0, 0.8470588, 1,
1.023771, -1.54934, 2.557747, 1, 0, 0.8392157, 1,
1.030123, -0.09694285, 2.482111, 1, 0, 0.8352941, 1,
1.03881, 0.8040498, 1.418561, 1, 0, 0.827451, 1,
1.039757, 0.6879056, 0.24495, 1, 0, 0.8235294, 1,
1.042466, 0.3872272, 0.5942054, 1, 0, 0.8156863, 1,
1.043092, -0.07027726, 2.395483, 1, 0, 0.8117647, 1,
1.043926, -0.09565348, 1.674425, 1, 0, 0.8039216, 1,
1.053062, -0.6763954, 2.161162, 1, 0, 0.7960784, 1,
1.059322, 0.5618186, 1.993987, 1, 0, 0.7921569, 1,
1.062062, -0.224523, 2.022843, 1, 0, 0.7843137, 1,
1.062347, -1.967127, 2.916193, 1, 0, 0.7803922, 1,
1.070231, 0.6865162, 0.3001101, 1, 0, 0.772549, 1,
1.072608, 0.7381094, 0.3162658, 1, 0, 0.7686275, 1,
1.075319, 0.03790087, 2.960463, 1, 0, 0.7607843, 1,
1.079813, -1.343762, 1.828185, 1, 0, 0.7568628, 1,
1.087679, -0.9911074, 1.7074, 1, 0, 0.7490196, 1,
1.094506, 0.08799386, 1.837492, 1, 0, 0.7450981, 1,
1.096314, -0.4591698, 0.6049395, 1, 0, 0.7372549, 1,
1.098924, -0.5671224, 3.368316, 1, 0, 0.7333333, 1,
1.099258, -0.1788543, 0.628829, 1, 0, 0.7254902, 1,
1.107475, 0.9429724, 0.2629451, 1, 0, 0.7215686, 1,
1.109513, -0.8596948, 1.877624, 1, 0, 0.7137255, 1,
1.113283, 2.050489, -1.295627, 1, 0, 0.7098039, 1,
1.134656, -0.4115688, 2.579728, 1, 0, 0.7019608, 1,
1.136791, 1.925191, -0.5309209, 1, 0, 0.6941177, 1,
1.156844, 0.1181438, 2.711327, 1, 0, 0.6901961, 1,
1.159105, -0.9799981, 3.502795, 1, 0, 0.682353, 1,
1.162641, 1.209773, 0.8135089, 1, 0, 0.6784314, 1,
1.167271, -1.062528, 3.068113, 1, 0, 0.6705883, 1,
1.174892, -0.2956617, 1.067762, 1, 0, 0.6666667, 1,
1.177945, -0.5764234, 2.56863, 1, 0, 0.6588235, 1,
1.178871, -0.448809, 3.121436, 1, 0, 0.654902, 1,
1.179339, -0.2263528, 1.329698, 1, 0, 0.6470588, 1,
1.179682, 0.8196377, 0.1051656, 1, 0, 0.6431373, 1,
1.180603, -1.965311, 2.819078, 1, 0, 0.6352941, 1,
1.1894, -0.8657961, 2.018332, 1, 0, 0.6313726, 1,
1.192806, 0.1903286, 2.440033, 1, 0, 0.6235294, 1,
1.199225, 0.4646496, 0.7254323, 1, 0, 0.6196079, 1,
1.203779, -0.5655268, 2.029191, 1, 0, 0.6117647, 1,
1.205132, 2.429284, 0.4566717, 1, 0, 0.6078432, 1,
1.220411, -1.241151, 3.06079, 1, 0, 0.6, 1,
1.230035, 0.1130844, 1.77811, 1, 0, 0.5921569, 1,
1.235435, -1.157171, 3.401048, 1, 0, 0.5882353, 1,
1.237059, 0.2570799, 0.8709262, 1, 0, 0.5803922, 1,
1.249505, -2.648637, 4.356925, 1, 0, 0.5764706, 1,
1.254414, 0.3957618, 2.324311, 1, 0, 0.5686275, 1,
1.25835, -0.477027, 3.163077, 1, 0, 0.5647059, 1,
1.262623, -0.4391689, 2.696542, 1, 0, 0.5568628, 1,
1.267078, 0.8440312, 0.2593042, 1, 0, 0.5529412, 1,
1.276084, -0.3031218, 0.7448631, 1, 0, 0.5450981, 1,
1.288953, -1.442611, 2.340622, 1, 0, 0.5411765, 1,
1.297427, 0.2661731, 0.1782874, 1, 0, 0.5333334, 1,
1.301541, 2.221685, 1.626434, 1, 0, 0.5294118, 1,
1.305426, 0.7709876, 0.8994895, 1, 0, 0.5215687, 1,
1.306734, 1.214734, 0.9011178, 1, 0, 0.5176471, 1,
1.319921, 0.2523817, 1.133302, 1, 0, 0.509804, 1,
1.326953, -0.0874081, 2.535299, 1, 0, 0.5058824, 1,
1.33572, -0.2547882, 2.978171, 1, 0, 0.4980392, 1,
1.336423, -0.4754029, 1.870274, 1, 0, 0.4901961, 1,
1.339987, -1.050023, 2.459283, 1, 0, 0.4862745, 1,
1.354061, -0.9810742, 2.403527, 1, 0, 0.4784314, 1,
1.366395, -0.3871806, 1.949896, 1, 0, 0.4745098, 1,
1.366667, 0.7292707, -0.1979623, 1, 0, 0.4666667, 1,
1.369326, -0.4677068, 1.819799, 1, 0, 0.4627451, 1,
1.388082, 0.5290279, 1.313223, 1, 0, 0.454902, 1,
1.402634, 0.9425421, -0.4896451, 1, 0, 0.4509804, 1,
1.402943, 0.3752364, 0.6106576, 1, 0, 0.4431373, 1,
1.411362, -0.5869341, 2.308757, 1, 0, 0.4392157, 1,
1.417205, -0.528879, 0.747622, 1, 0, 0.4313726, 1,
1.422158, 1.043252, 1.279309, 1, 0, 0.427451, 1,
1.430054, 0.8890297, 1.450724, 1, 0, 0.4196078, 1,
1.437808, -0.3831641, 0.4344496, 1, 0, 0.4156863, 1,
1.451189, -0.6907943, 3.067986, 1, 0, 0.4078431, 1,
1.466856, -1.006252, 2.520314, 1, 0, 0.4039216, 1,
1.467087, -0.4266848, 2.105556, 1, 0, 0.3960784, 1,
1.494005, 0.2559847, 2.355303, 1, 0, 0.3882353, 1,
1.495622, 0.208938, 1.488466, 1, 0, 0.3843137, 1,
1.499263, -1.809726, 2.377561, 1, 0, 0.3764706, 1,
1.504069, 0.291325, -0.03023855, 1, 0, 0.372549, 1,
1.522135, -1.435549, 2.194761, 1, 0, 0.3647059, 1,
1.523649, -1.094352, 2.330211, 1, 0, 0.3607843, 1,
1.548061, -0.04624307, 0.7400733, 1, 0, 0.3529412, 1,
1.553042, 2.34044, 1.807793, 1, 0, 0.3490196, 1,
1.586105, 0.04935294, 1.842267, 1, 0, 0.3411765, 1,
1.616271, 0.5844833, 0.6752861, 1, 0, 0.3372549, 1,
1.638974, -0.223122, 2.207824, 1, 0, 0.3294118, 1,
1.644711, -0.662444, 1.669562, 1, 0, 0.3254902, 1,
1.658573, -1.532624, 3.295946, 1, 0, 0.3176471, 1,
1.660775, -0.6253235, 0.1362307, 1, 0, 0.3137255, 1,
1.67064, 2.031625, 0.605453, 1, 0, 0.3058824, 1,
1.673, -1.168028, 3.017354, 1, 0, 0.2980392, 1,
1.679917, 1.141347, -0.211039, 1, 0, 0.2941177, 1,
1.681706, 0.7788821, 0.3718332, 1, 0, 0.2862745, 1,
1.683264, 0.7823817, 0.6794152, 1, 0, 0.282353, 1,
1.709844, 0.253568, 3.586123, 1, 0, 0.2745098, 1,
1.742108, 0.8724339, 1.298068, 1, 0, 0.2705882, 1,
1.744211, 0.3873567, 1.369575, 1, 0, 0.2627451, 1,
1.744273, 0.6669804, 1.308405, 1, 0, 0.2588235, 1,
1.747045, 1.89178, 0.7972488, 1, 0, 0.2509804, 1,
1.761679, 0.1409658, 1.972042, 1, 0, 0.2470588, 1,
1.779904, 0.6871302, 2.216845, 1, 0, 0.2392157, 1,
1.781615, 0.8772553, 0.6627437, 1, 0, 0.2352941, 1,
1.783577, 1.985008, 1.630545, 1, 0, 0.227451, 1,
1.791108, 0.7501087, 0.8402673, 1, 0, 0.2235294, 1,
1.791213, 0.3036071, 0.4973311, 1, 0, 0.2156863, 1,
1.791305, -0.779668, 0.8332928, 1, 0, 0.2117647, 1,
1.791409, -0.6402675, 2.786708, 1, 0, 0.2039216, 1,
1.796045, -0.2602907, 0.2570062, 1, 0, 0.1960784, 1,
1.8029, -1.296404, 2.444832, 1, 0, 0.1921569, 1,
1.834836, 1.158753, 1.72969, 1, 0, 0.1843137, 1,
1.843313, 0.3171484, 0.6240097, 1, 0, 0.1803922, 1,
1.855, 1.08529, 2.213369, 1, 0, 0.172549, 1,
1.85632, -0.0179892, 0.9762233, 1, 0, 0.1686275, 1,
1.8681, -0.8278382, 1.049106, 1, 0, 0.1607843, 1,
1.881247, 0.8781797, -0.7518467, 1, 0, 0.1568628, 1,
1.893957, 0.7884481, 2.300686, 1, 0, 0.1490196, 1,
1.96102, -0.001843195, 2.535435, 1, 0, 0.145098, 1,
1.986162, -0.2831406, 1.252261, 1, 0, 0.1372549, 1,
2.007847, -1.208168, 1.843153, 1, 0, 0.1333333, 1,
2.016902, 0.5797775, 1.205801, 1, 0, 0.1254902, 1,
2.030297, -0.4482712, 2.253244, 1, 0, 0.1215686, 1,
2.056946, 0.7235826, 1.128505, 1, 0, 0.1137255, 1,
2.121997, -0.7725993, 2.352214, 1, 0, 0.1098039, 1,
2.136917, 0.03531416, 1.411864, 1, 0, 0.1019608, 1,
2.172082, 0.533487, 2.04993, 1, 0, 0.09411765, 1,
2.234277, -1.910053, 4.281597, 1, 0, 0.09019608, 1,
2.249536, -0.2890826, 0.9557711, 1, 0, 0.08235294, 1,
2.261767, 0.001285917, -0.01705631, 1, 0, 0.07843138, 1,
2.342299, 1.099642, 0.6547107, 1, 0, 0.07058824, 1,
2.395859, -1.076869, 2.33726, 1, 0, 0.06666667, 1,
2.397781, 1.880046, 0.4852479, 1, 0, 0.05882353, 1,
2.446276, 0.2646161, 2.353418, 1, 0, 0.05490196, 1,
2.450911, 0.1803162, 2.016038, 1, 0, 0.04705882, 1,
2.482319, 0.06783967, 0.5523953, 1, 0, 0.04313726, 1,
2.524012, -0.1753611, 1.688376, 1, 0, 0.03529412, 1,
2.672058, 0.328164, 0.6685939, 1, 0, 0.03137255, 1,
2.743958, 1.13764, 0.8644172, 1, 0, 0.02352941, 1,
2.76719, -0.6322861, 0.2274757, 1, 0, 0.01960784, 1,
2.844644, 0.4626947, -0.02135334, 1, 0, 0.01176471, 1,
3.185614, 1.255587, 1.656901, 1, 0, 0.007843138, 1
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
0.1382591, -4.035719, -6.923476, 0, -0.5, 0.5, 0.5,
0.1382591, -4.035719, -6.923476, 1, -0.5, 0.5, 0.5,
0.1382591, -4.035719, -6.923476, 1, 1.5, 0.5, 0.5,
0.1382591, -4.035719, -6.923476, 0, 1.5, 0.5, 0.5
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
-3.94215, 0.04457724, -6.923476, 0, -0.5, 0.5, 0.5,
-3.94215, 0.04457724, -6.923476, 1, -0.5, 0.5, 0.5,
-3.94215, 0.04457724, -6.923476, 1, 1.5, 0.5, 0.5,
-3.94215, 0.04457724, -6.923476, 0, 1.5, 0.5, 0.5
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
-3.94215, -4.035719, -0.124157, 0, -0.5, 0.5, 0.5,
-3.94215, -4.035719, -0.124157, 1, -0.5, 0.5, 0.5,
-3.94215, -4.035719, -0.124157, 1, 1.5, 0.5, 0.5,
-3.94215, -4.035719, -0.124157, 0, 1.5, 0.5, 0.5
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
-2, -3.094112, -5.354403,
3, -3.094112, -5.354403,
-2, -3.094112, -5.354403,
-2, -3.251047, -5.615915,
-1, -3.094112, -5.354403,
-1, -3.251047, -5.615915,
0, -3.094112, -5.354403,
0, -3.251047, -5.615915,
1, -3.094112, -5.354403,
1, -3.251047, -5.615915,
2, -3.094112, -5.354403,
2, -3.251047, -5.615915,
3, -3.094112, -5.354403,
3, -3.251047, -5.615915
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
-2, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
-2, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
-2, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
-2, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5,
-1, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
-1, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
-1, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
-1, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5,
0, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
0, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
0, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
0, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5,
1, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
1, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
1, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
1, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5,
2, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
2, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
2, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
2, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5,
3, -3.564916, -6.138939, 0, -0.5, 0.5, 0.5,
3, -3.564916, -6.138939, 1, -0.5, 0.5, 0.5,
3, -3.564916, -6.138939, 1, 1.5, 0.5, 0.5,
3, -3.564916, -6.138939, 0, 1.5, 0.5, 0.5
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
-3.000517, -3, -5.354403,
-3.000517, 3, -5.354403,
-3.000517, -3, -5.354403,
-3.157456, -3, -5.615915,
-3.000517, -2, -5.354403,
-3.157456, -2, -5.615915,
-3.000517, -1, -5.354403,
-3.157456, -1, -5.615915,
-3.000517, 0, -5.354403,
-3.157456, 0, -5.615915,
-3.000517, 1, -5.354403,
-3.157456, 1, -5.615915,
-3.000517, 2, -5.354403,
-3.157456, 2, -5.615915,
-3.000517, 3, -5.354403,
-3.157456, 3, -5.615915
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
-3.471333, -3, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, -3, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, -3, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, -3, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, -2, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, -2, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, -2, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, -2, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, -1, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, -1, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, -1, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, -1, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, 0, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, 0, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, 0, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, 0, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, 1, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, 1, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, 1, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, 1, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, 2, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, 2, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, 2, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, 2, -6.138939, 0, 1.5, 0.5, 0.5,
-3.471333, 3, -6.138939, 0, -0.5, 0.5, 0.5,
-3.471333, 3, -6.138939, 1, -0.5, 0.5, 0.5,
-3.471333, 3, -6.138939, 1, 1.5, 0.5, 0.5,
-3.471333, 3, -6.138939, 0, 1.5, 0.5, 0.5
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
-3.000517, -3.094112, -4,
-3.000517, -3.094112, 4,
-3.000517, -3.094112, -4,
-3.157456, -3.251047, -4,
-3.000517, -3.094112, -2,
-3.157456, -3.251047, -2,
-3.000517, -3.094112, 0,
-3.157456, -3.251047, 0,
-3.000517, -3.094112, 2,
-3.157456, -3.251047, 2,
-3.000517, -3.094112, 4,
-3.157456, -3.251047, 4
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
-3.471333, -3.564916, -4, 0, -0.5, 0.5, 0.5,
-3.471333, -3.564916, -4, 1, -0.5, 0.5, 0.5,
-3.471333, -3.564916, -4, 1, 1.5, 0.5, 0.5,
-3.471333, -3.564916, -4, 0, 1.5, 0.5, 0.5,
-3.471333, -3.564916, -2, 0, -0.5, 0.5, 0.5,
-3.471333, -3.564916, -2, 1, -0.5, 0.5, 0.5,
-3.471333, -3.564916, -2, 1, 1.5, 0.5, 0.5,
-3.471333, -3.564916, -2, 0, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 0, 0, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 0, 1, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 0, 1, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 0, 0, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 2, 0, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 2, 1, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 2, 1, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 2, 0, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 4, 0, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 4, 1, -0.5, 0.5, 0.5,
-3.471333, -3.564916, 4, 1, 1.5, 0.5, 0.5,
-3.471333, -3.564916, 4, 0, 1.5, 0.5, 0.5
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
-3.000517, -3.094112, -5.354403,
-3.000517, 3.183267, -5.354403,
-3.000517, -3.094112, 5.106089,
-3.000517, 3.183267, 5.106089,
-3.000517, -3.094112, -5.354403,
-3.000517, -3.094112, 5.106089,
-3.000517, 3.183267, -5.354403,
-3.000517, 3.183267, 5.106089,
-3.000517, -3.094112, -5.354403,
3.277035, -3.094112, -5.354403,
-3.000517, -3.094112, 5.106089,
3.277035, -3.094112, 5.106089,
-3.000517, 3.183267, -5.354403,
3.277035, 3.183267, -5.354403,
-3.000517, 3.183267, 5.106089,
3.277035, 3.183267, 5.106089,
3.277035, -3.094112, -5.354403,
3.277035, 3.183267, -5.354403,
3.277035, -3.094112, 5.106089,
3.277035, 3.183267, 5.106089,
3.277035, -3.094112, -5.354403,
3.277035, -3.094112, 5.106089,
3.277035, 3.183267, -5.354403,
3.277035, 3.183267, 5.106089
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
var radius = 7.326148;
var distance = 32.59486;
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
mvMatrix.translate( -0.1382591, -0.04457724, 0.124157 );
mvMatrix.scale( 1.261825, 1.26186, 0.7572469 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.59486);
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
3-Hydroxycarbofuran<-read.table("3-Hydroxycarbofuran.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-Hydroxycarbofuran$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hydroxycarbofuran' not found
```

```r
y<-3-Hydroxycarbofuran$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hydroxycarbofuran' not found
```

```r
z<-3-Hydroxycarbofuran$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hydroxycarbofuran' not found
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
-2.909096, -0.1598727, -3.436665, 0, 0, 1, 1, 1,
-2.81085, -0.2664808, -1.837651, 1, 0, 0, 1, 1,
-2.759063, -1.19904, -1.86958, 1, 0, 0, 1, 1,
-2.649198, -1.961524, -2.120009, 1, 0, 0, 1, 1,
-2.555581, 0.6028737, -1.398167, 1, 0, 0, 1, 1,
-2.533929, 0.5370964, -1.193045, 1, 0, 0, 1, 1,
-2.520411, -0.9883435, -2.194448, 0, 0, 0, 1, 1,
-2.480442, 0.1087616, -2.005599, 0, 0, 0, 1, 1,
-2.461086, -1.546534, -2.157261, 0, 0, 0, 1, 1,
-2.455034, 0.7610726, -0.4431811, 0, 0, 0, 1, 1,
-2.444069, -0.233356, -2.543722, 0, 0, 0, 1, 1,
-2.443693, -1.608968, -0.4246735, 0, 0, 0, 1, 1,
-2.411455, -0.09564868, -3.090112, 0, 0, 0, 1, 1,
-2.351268, 0.1016911, -0.8334374, 1, 1, 1, 1, 1,
-2.256521, 1.526255, 1.04109, 1, 1, 1, 1, 1,
-2.180952, -0.5740145, -4.200737, 1, 1, 1, 1, 1,
-2.178199, 0.3892242, -0.3206874, 1, 1, 1, 1, 1,
-2.11826, 0.3856512, 0.07360142, 1, 1, 1, 1, 1,
-2.074493, 0.1658577, -1.473717, 1, 1, 1, 1, 1,
-2.041346, 1.058554, -1.879877, 1, 1, 1, 1, 1,
-2.026097, 0.4404011, -1.202962, 1, 1, 1, 1, 1,
-2.018, 0.04861739, -0.2744481, 1, 1, 1, 1, 1,
-2.017801, 0.1198344, -1.097291, 1, 1, 1, 1, 1,
-2.011543, -1.582469, -3.174647, 1, 1, 1, 1, 1,
-1.991558, 0.187158, -1.46379, 1, 1, 1, 1, 1,
-1.947085, 0.8265206, -0.5328066, 1, 1, 1, 1, 1,
-1.92267, 1.877177, -1.266302, 1, 1, 1, 1, 1,
-1.885621, -0.8317828, -3.469266, 1, 1, 1, 1, 1,
-1.885462, 0.07702078, -0.8417433, 0, 0, 1, 1, 1,
-1.883173, 0.5686798, -1.358362, 1, 0, 0, 1, 1,
-1.878155, -0.08948165, -0.07064568, 1, 0, 0, 1, 1,
-1.871642, 0.8346786, -1.500488, 1, 0, 0, 1, 1,
-1.857888, -1.866582, -2.796109, 1, 0, 0, 1, 1,
-1.852144, -0.3010127, -2.924564, 1, 0, 0, 1, 1,
-1.848735, 0.2925749, -2.733906, 0, 0, 0, 1, 1,
-1.844878, -0.8784355, -1.581824, 0, 0, 0, 1, 1,
-1.813818, -0.4198656, -0.604375, 0, 0, 0, 1, 1,
-1.798867, -1.434695, -2.316283, 0, 0, 0, 1, 1,
-1.776978, -0.5340412, -2.288402, 0, 0, 0, 1, 1,
-1.771823, 0.9247352, -1.423391, 0, 0, 0, 1, 1,
-1.769668, -0.01356687, -2.537584, 0, 0, 0, 1, 1,
-1.76663, -0.3736305, -2.417411, 1, 1, 1, 1, 1,
-1.765671, -1.211731, -3.564832, 1, 1, 1, 1, 1,
-1.754733, -0.6369838, -1.235798, 1, 1, 1, 1, 1,
-1.75045, 0.8097849, -0.5787324, 1, 1, 1, 1, 1,
-1.748273, -0.7981731, -2.490646, 1, 1, 1, 1, 1,
-1.736794, 0.6275842, -1.22479, 1, 1, 1, 1, 1,
-1.736686, 0.7045592, -1.245014, 1, 1, 1, 1, 1,
-1.730472, -0.7786063, -1.858721, 1, 1, 1, 1, 1,
-1.727251, 0.396451, -1.598349, 1, 1, 1, 1, 1,
-1.656049, 0.0698389, -1.081337, 1, 1, 1, 1, 1,
-1.640268, 0.1521927, -2.10371, 1, 1, 1, 1, 1,
-1.631319, -1.146161, -1.926659, 1, 1, 1, 1, 1,
-1.614864, -1.548503, -2.684156, 1, 1, 1, 1, 1,
-1.61405, -0.2073621, -2.220599, 1, 1, 1, 1, 1,
-1.604481, -0.1102765, -0.3242991, 1, 1, 1, 1, 1,
-1.59215, 1.454951, -0.5922121, 0, 0, 1, 1, 1,
-1.58928, 0.8093325, -1.921299, 1, 0, 0, 1, 1,
-1.587781, 1.610821, -1.781753, 1, 0, 0, 1, 1,
-1.572307, -0.7284269, -1.870218, 1, 0, 0, 1, 1,
-1.556967, -0.06560465, -1.11763, 1, 0, 0, 1, 1,
-1.555601, -0.4962494, -1.807009, 1, 0, 0, 1, 1,
-1.529843, -1.035526, -4.375966, 0, 0, 0, 1, 1,
-1.526443, 1.272462, -1.156229, 0, 0, 0, 1, 1,
-1.525793, -0.1546325, -2.174113, 0, 0, 0, 1, 1,
-1.521236, 0.2934739, -1.219799, 0, 0, 0, 1, 1,
-1.512641, -1.691026, -3.818918, 0, 0, 0, 1, 1,
-1.508214, 0.01293743, -0.5518695, 0, 0, 0, 1, 1,
-1.495482, 0.9785731, -0.9964445, 0, 0, 0, 1, 1,
-1.491254, -0.3938166, -2.498552, 1, 1, 1, 1, 1,
-1.479243, 1.422656, -2.389154, 1, 1, 1, 1, 1,
-1.475769, 1.204787, -1.067129, 1, 1, 1, 1, 1,
-1.473016, 0.1077809, -1.502361, 1, 1, 1, 1, 1,
-1.465924, -0.1074219, -1.497925, 1, 1, 1, 1, 1,
-1.45136, -0.8851764, -2.030972, 1, 1, 1, 1, 1,
-1.448424, 1.071476, -0.3005864, 1, 1, 1, 1, 1,
-1.442427, -1.903957, -3.986948, 1, 1, 1, 1, 1,
-1.441499, 0.2200404, -1.48175, 1, 1, 1, 1, 1,
-1.421158, 0.4171008, 0.8855295, 1, 1, 1, 1, 1,
-1.419924, 0.7960936, -0.6178241, 1, 1, 1, 1, 1,
-1.417836, -0.06871345, -1.888401, 1, 1, 1, 1, 1,
-1.402672, -1.688313, -5.202065, 1, 1, 1, 1, 1,
-1.398404, 0.1378441, -0.5290425, 1, 1, 1, 1, 1,
-1.396806, 1.380905, -1.479118, 1, 1, 1, 1, 1,
-1.391458, 0.7903354, -1.510765, 0, 0, 1, 1, 1,
-1.367815, -0.4474605, -3.184738, 1, 0, 0, 1, 1,
-1.365604, 1.441492, -0.2663307, 1, 0, 0, 1, 1,
-1.352095, 0.6009396, -1.184563, 1, 0, 0, 1, 1,
-1.348756, 0.2369293, -2.285101, 1, 0, 0, 1, 1,
-1.343575, -0.8744695, -2.658515, 1, 0, 0, 1, 1,
-1.342231, -0.1756756, -2.098724, 0, 0, 0, 1, 1,
-1.34051, -1.161066, -2.120379, 0, 0, 0, 1, 1,
-1.337388, 0.7940043, -0.9243334, 0, 0, 0, 1, 1,
-1.333884, -0.1235054, -1.056255, 0, 0, 0, 1, 1,
-1.332677, -0.781683, -0.823489, 0, 0, 0, 1, 1,
-1.332436, -0.5213863, -2.32249, 0, 0, 0, 1, 1,
-1.320143, -1.750653, -2.225336, 0, 0, 0, 1, 1,
-1.315687, 0.236251, -0.09528629, 1, 1, 1, 1, 1,
-1.298361, -0.5438443, -1.285891, 1, 1, 1, 1, 1,
-1.296844, 0.1491112, 0.4552487, 1, 1, 1, 1, 1,
-1.280696, -0.4513394, -0.8675115, 1, 1, 1, 1, 1,
-1.271324, 0.3144742, -0.964967, 1, 1, 1, 1, 1,
-1.268217, 1.873838, 0.8473167, 1, 1, 1, 1, 1,
-1.267875, -1.040966, -1.839102, 1, 1, 1, 1, 1,
-1.25542, 0.6408076, 0.4526827, 1, 1, 1, 1, 1,
-1.252435, -0.1348174, -3.375045, 1, 1, 1, 1, 1,
-1.234053, 3.091849, -0.9565242, 1, 1, 1, 1, 1,
-1.233524, 0.6265014, -1.054381, 1, 1, 1, 1, 1,
-1.229767, 1.324388, -1.617787, 1, 1, 1, 1, 1,
-1.226187, -0.1449834, -1.77891, 1, 1, 1, 1, 1,
-1.219674, -2.115571, -2.972468, 1, 1, 1, 1, 1,
-1.215937, -1.262206, -3.293162, 1, 1, 1, 1, 1,
-1.207778, -1.302567, -1.490126, 0, 0, 1, 1, 1,
-1.20448, 0.8516077, -1.556069, 1, 0, 0, 1, 1,
-1.200303, -0.2684605, -3.290068, 1, 0, 0, 1, 1,
-1.195662, -0.2525086, 0.1694319, 1, 0, 0, 1, 1,
-1.195354, 0.8069769, -0.4429529, 1, 0, 0, 1, 1,
-1.192933, -0.5350314, -2.022237, 1, 0, 0, 1, 1,
-1.181032, -0.8916638, -2.52591, 0, 0, 0, 1, 1,
-1.179831, 0.06455627, -1.673975, 0, 0, 0, 1, 1,
-1.176774, 1.237175, -0.3018074, 0, 0, 0, 1, 1,
-1.174419, 0.3691766, -3.398417, 0, 0, 0, 1, 1,
-1.169859, -0.1211133, -2.454227, 0, 0, 0, 1, 1,
-1.167446, -1.667862, -2.178713, 0, 0, 0, 1, 1,
-1.161397, 0.1067744, -0.647305, 0, 0, 0, 1, 1,
-1.16108, -0.6226242, -2.601103, 1, 1, 1, 1, 1,
-1.160369, 0.1712954, -1.555763, 1, 1, 1, 1, 1,
-1.15625, -1.046776, -2.812116, 1, 1, 1, 1, 1,
-1.154013, 1.030281, -3.308301, 1, 1, 1, 1, 1,
-1.138467, -0.01386297, -1.395059, 1, 1, 1, 1, 1,
-1.134846, -0.9195471, -1.220665, 1, 1, 1, 1, 1,
-1.134807, 0.7806636, -0.4341002, 1, 1, 1, 1, 1,
-1.129529, 1.566672, -3.34076, 1, 1, 1, 1, 1,
-1.126281, 1.411959, -1.297563, 1, 1, 1, 1, 1,
-1.118235, 0.7468657, -1.750538, 1, 1, 1, 1, 1,
-1.115495, 1.460219, -1.807374, 1, 1, 1, 1, 1,
-1.112727, 0.1038351, -2.267853, 1, 1, 1, 1, 1,
-1.110985, 0.01677817, -1.933547, 1, 1, 1, 1, 1,
-1.110131, 0.1639723, -1.083618, 1, 1, 1, 1, 1,
-1.103557, 2.522733, 0.17781, 1, 1, 1, 1, 1,
-1.096564, -0.4829588, -3.765395, 0, 0, 1, 1, 1,
-1.095708, 0.07089476, -3.103722, 1, 0, 0, 1, 1,
-1.093998, -0.6408764, -2.494395, 1, 0, 0, 1, 1,
-1.093245, -0.2600265, -1.785504, 1, 0, 0, 1, 1,
-1.092758, -0.221476, -2.723639, 1, 0, 0, 1, 1,
-1.090124, 1.110041, -2.843146, 1, 0, 0, 1, 1,
-1.0859, -0.7119544, -1.747358, 0, 0, 0, 1, 1,
-1.075221, 0.2770477, -1.307235, 0, 0, 0, 1, 1,
-1.074101, 2.025989, -0.2721637, 0, 0, 0, 1, 1,
-1.072834, 1.705071, -0.8193229, 0, 0, 0, 1, 1,
-1.071522, -0.5973774, -2.124774, 0, 0, 0, 1, 1,
-1.071082, 1.257166, 0.5608258, 0, 0, 0, 1, 1,
-1.061472, 0.8821645, -1.806623, 0, 0, 0, 1, 1,
-1.045605, -1.010046, -0.7505862, 1, 1, 1, 1, 1,
-1.040267, 0.7493021, -1.449863, 1, 1, 1, 1, 1,
-1.030872, -0.05939024, -0.6277002, 1, 1, 1, 1, 1,
-1.027433, 1.695747, -0.4763638, 1, 1, 1, 1, 1,
-1.022146, -1.270771, -2.113662, 1, 1, 1, 1, 1,
-1.019597, 0.07217067, -0.7668515, 1, 1, 1, 1, 1,
-1.016158, -0.287665, -3.361968, 1, 1, 1, 1, 1,
-1.007835, -0.1562913, -1.155611, 1, 1, 1, 1, 1,
-0.994203, -1.121265, -2.331802, 1, 1, 1, 1, 1,
-0.9910936, -0.5590069, -0.2297029, 1, 1, 1, 1, 1,
-0.9890427, -0.448774, -1.363166, 1, 1, 1, 1, 1,
-0.9847466, 1.522864, 0.3379399, 1, 1, 1, 1, 1,
-0.9836869, 0.4021448, -0.0874931, 1, 1, 1, 1, 1,
-0.9815072, -0.1512654, -0.7753265, 1, 1, 1, 1, 1,
-0.979287, -0.7289885, -2.63728, 1, 1, 1, 1, 1,
-0.9761316, -0.2385999, -1.139004, 0, 0, 1, 1, 1,
-0.9628913, 0.2905147, 0.2523493, 1, 0, 0, 1, 1,
-0.9583495, 1.002813, -0.1072329, 1, 0, 0, 1, 1,
-0.9538261, -0.8239403, -3.352856, 1, 0, 0, 1, 1,
-0.953431, -0.2541481, -0.1932146, 1, 0, 0, 1, 1,
-0.952952, 1.290217, -0.9870404, 1, 0, 0, 1, 1,
-0.9522597, -0.523725, -2.883431, 0, 0, 0, 1, 1,
-0.9499344, -2.162113, -2.425124, 0, 0, 0, 1, 1,
-0.9427213, 0.9472466, -0.9168052, 0, 0, 0, 1, 1,
-0.9423187, -0.4390301, -2.444128, 0, 0, 0, 1, 1,
-0.9369031, 0.3657762, -2.271693, 0, 0, 0, 1, 1,
-0.9326959, -2.438249, -1.659351, 0, 0, 0, 1, 1,
-0.931012, -1.257079, -2.911884, 0, 0, 0, 1, 1,
-0.9292805, -0.5229626, -2.139557, 1, 1, 1, 1, 1,
-0.9292073, 1.537906, 0.08245115, 1, 1, 1, 1, 1,
-0.9274133, -0.8689997, -2.702564, 1, 1, 1, 1, 1,
-0.9184911, -0.7179089, -0.1265283, 1, 1, 1, 1, 1,
-0.9147404, 0.3811456, -0.8954782, 1, 1, 1, 1, 1,
-0.9056762, -0.4117183, -1.148594, 1, 1, 1, 1, 1,
-0.9021119, -0.4197261, -2.521476, 1, 1, 1, 1, 1,
-0.8946468, -2.0224, -1.549117, 1, 1, 1, 1, 1,
-0.893011, 0.1880817, -0.6677358, 1, 1, 1, 1, 1,
-0.8863012, -1.069872, -4.352775, 1, 1, 1, 1, 1,
-0.8851423, -1.538909, -2.407689, 1, 1, 1, 1, 1,
-0.8784035, 0.3920401, -0.3945886, 1, 1, 1, 1, 1,
-0.878285, 0.5764059, 0.0789336, 1, 1, 1, 1, 1,
-0.8771545, -1.012266, -2.044178, 1, 1, 1, 1, 1,
-0.8745728, -0.03034948, -1.886235, 1, 1, 1, 1, 1,
-0.8703325, 1.164337, -0.6095166, 0, 0, 1, 1, 1,
-0.8607993, 0.2626012, -1.940068, 1, 0, 0, 1, 1,
-0.8586941, 0.4445668, -0.722865, 1, 0, 0, 1, 1,
-0.8536582, 0.2975256, -1.846926, 1, 0, 0, 1, 1,
-0.8473316, 0.6032268, 0.6661598, 1, 0, 0, 1, 1,
-0.836558, 0.4842458, -1.422582, 1, 0, 0, 1, 1,
-0.8364829, 0.4576536, -0.2758081, 0, 0, 0, 1, 1,
-0.8325397, 0.4758637, -0.7573619, 0, 0, 0, 1, 1,
-0.8274254, -0.1306856, -1.987591, 0, 0, 0, 1, 1,
-0.8247703, 0.4861968, -2.507923, 0, 0, 0, 1, 1,
-0.824357, 0.7841358, -1.359696, 0, 0, 0, 1, 1,
-0.8143693, 1.229811, -1.99619, 0, 0, 0, 1, 1,
-0.8045995, 0.4079866, -0.8071531, 0, 0, 0, 1, 1,
-0.8041683, -0.07737847, -0.8728383, 1, 1, 1, 1, 1,
-0.8024225, 0.6086143, 0.8640766, 1, 1, 1, 1, 1,
-0.8007352, -0.02788526, -2.043682, 1, 1, 1, 1, 1,
-0.7908517, -1.436614, -3.150898, 1, 1, 1, 1, 1,
-0.790054, 2.227664, -1.990988, 1, 1, 1, 1, 1,
-0.7884356, 0.2954642, -0.5323185, 1, 1, 1, 1, 1,
-0.7831188, -0.6212274, -0.4331005, 1, 1, 1, 1, 1,
-0.7820128, -1.864821, -4.62904, 1, 1, 1, 1, 1,
-0.7819785, -1.207047, -3.814629, 1, 1, 1, 1, 1,
-0.7792818, -1.16406, -3.121721, 1, 1, 1, 1, 1,
-0.778002, 0.9820976, 1.499241, 1, 1, 1, 1, 1,
-0.7775465, 0.2080888, -0.6980835, 1, 1, 1, 1, 1,
-0.7697206, 0.8992119, -0.2562323, 1, 1, 1, 1, 1,
-0.7658607, 1.464621, -0.6220049, 1, 1, 1, 1, 1,
-0.7609069, 0.8427096, -0.9206227, 1, 1, 1, 1, 1,
-0.7601681, -0.2934171, -2.357394, 0, 0, 1, 1, 1,
-0.7588995, 0.003239516, -2.100715, 1, 0, 0, 1, 1,
-0.7564971, -0.03908655, -1.701194, 1, 0, 0, 1, 1,
-0.7530936, 0.2741074, -0.7165073, 1, 0, 0, 1, 1,
-0.7498242, 0.3382985, -0.9774389, 1, 0, 0, 1, 1,
-0.7479826, 1.188514, -0.3817022, 1, 0, 0, 1, 1,
-0.7441632, -0.2514921, 0.4155038, 0, 0, 0, 1, 1,
-0.7438608, -0.395355, 0.2963915, 0, 0, 0, 1, 1,
-0.7384909, 0.8070343, -1.72211, 0, 0, 0, 1, 1,
-0.7348144, 0.5832124, -0.04366065, 0, 0, 0, 1, 1,
-0.7321175, -2.419473, -2.44759, 0, 0, 0, 1, 1,
-0.7311425, 0.3257028, -0.9159882, 0, 0, 0, 1, 1,
-0.7301136, -0.7639589, -1.694223, 0, 0, 0, 1, 1,
-0.7289284, -0.5880513, -3.212732, 1, 1, 1, 1, 1,
-0.7271326, 0.8605641, -0.8268886, 1, 1, 1, 1, 1,
-0.7268643, -0.7874558, -3.607203, 1, 1, 1, 1, 1,
-0.7195079, -1.755983, -2.132903, 1, 1, 1, 1, 1,
-0.7193192, 0.5796186, -2.715095, 1, 1, 1, 1, 1,
-0.7156788, 1.437186, -0.469696, 1, 1, 1, 1, 1,
-0.7092371, -0.03393175, -2.68057, 1, 1, 1, 1, 1,
-0.7062681, 1.050982, -0.4473438, 1, 1, 1, 1, 1,
-0.7035961, 2.054891, 0.9122109, 1, 1, 1, 1, 1,
-0.6918201, -0.1499622, -1.257297, 1, 1, 1, 1, 1,
-0.6880823, -0.2473326, -1.793901, 1, 1, 1, 1, 1,
-0.687003, 1.356389, 0.2577384, 1, 1, 1, 1, 1,
-0.6838565, -1.447875, -2.663567, 1, 1, 1, 1, 1,
-0.6809198, 1.091483, -0.6219624, 1, 1, 1, 1, 1,
-0.6773164, -0.4873707, -0.6227382, 1, 1, 1, 1, 1,
-0.6761058, 0.05060938, -2.883173, 0, 0, 1, 1, 1,
-0.6735553, -0.3246303, -2.310059, 1, 0, 0, 1, 1,
-0.6675587, -0.2394853, -1.490928, 1, 0, 0, 1, 1,
-0.6664059, -1.04223, -3.005181, 1, 0, 0, 1, 1,
-0.6663283, 0.05846233, -2.584281, 1, 0, 0, 1, 1,
-0.6646314, -1.405778, -1.971565, 1, 0, 0, 1, 1,
-0.6605766, -0.3154199, -2.200175, 0, 0, 0, 1, 1,
-0.656576, 0.1818795, -0.8463453, 0, 0, 0, 1, 1,
-0.6563171, 0.7556681, -1.422762, 0, 0, 0, 1, 1,
-0.6517473, -0.5423806, -2.971092, 0, 0, 0, 1, 1,
-0.6513869, -1.972233, -1.587247, 0, 0, 0, 1, 1,
-0.6475614, -1.1583, -2.229338, 0, 0, 0, 1, 1,
-0.6465228, 0.8937966, -0.7153201, 0, 0, 0, 1, 1,
-0.6401429, -1.024086, -0.7856617, 1, 1, 1, 1, 1,
-0.6400558, -0.4503235, -0.5431897, 1, 1, 1, 1, 1,
-0.6390408, -0.5094723, -0.9512528, 1, 1, 1, 1, 1,
-0.6387577, 0.4501983, -1.826287, 1, 1, 1, 1, 1,
-0.6364115, 0.3346712, 0.4351115, 1, 1, 1, 1, 1,
-0.6357637, 0.4691015, -3.606941, 1, 1, 1, 1, 1,
-0.6351674, 0.9060285, -0.9141945, 1, 1, 1, 1, 1,
-0.632461, -1.191754, -1.52851, 1, 1, 1, 1, 1,
-0.6323981, -1.623143, -2.564442, 1, 1, 1, 1, 1,
-0.6310017, -0.6588467, -1.918975, 1, 1, 1, 1, 1,
-0.6287503, 0.09046375, -2.183336, 1, 1, 1, 1, 1,
-0.6243615, -0.6530067, -3.837158, 1, 1, 1, 1, 1,
-0.6161659, 1.257693, 1.002001, 1, 1, 1, 1, 1,
-0.6119049, -1.417108, -2.023847, 1, 1, 1, 1, 1,
-0.6100029, -0.7924524, -2.826124, 1, 1, 1, 1, 1,
-0.6098616, 2.342256, -0.1595443, 0, 0, 1, 1, 1,
-0.6072083, 0.6906504, -0.3410698, 1, 0, 0, 1, 1,
-0.6028346, 1.996597, -1.155714, 1, 0, 0, 1, 1,
-0.6028227, -1.344688, -3.459766, 1, 0, 0, 1, 1,
-0.6012009, -0.2532386, -0.9502628, 1, 0, 0, 1, 1,
-0.5983149, 0.6039163, -1.006808, 1, 0, 0, 1, 1,
-0.5957307, -0.4449955, -1.972515, 0, 0, 0, 1, 1,
-0.592309, -0.334384, -4.058149, 0, 0, 0, 1, 1,
-0.5914089, 0.002242058, -2.099933, 0, 0, 0, 1, 1,
-0.5880116, -0.8155487, -2.694133, 0, 0, 0, 1, 1,
-0.5846289, 0.05394585, 0.6774676, 0, 0, 0, 1, 1,
-0.5830867, 0.3279628, -1.285673, 0, 0, 0, 1, 1,
-0.581997, 0.6034716, -2.33734, 0, 0, 0, 1, 1,
-0.5798073, 0.862703, -0.05874312, 1, 1, 1, 1, 1,
-0.5783811, -0.1175723, -2.975082, 1, 1, 1, 1, 1,
-0.5746158, 0.4456397, -2.193814, 1, 1, 1, 1, 1,
-0.5744242, 1.098573, -0.2917035, 1, 1, 1, 1, 1,
-0.5721981, -0.3356339, -1.365295, 1, 1, 1, 1, 1,
-0.5661894, 0.3783622, 0.1546165, 1, 1, 1, 1, 1,
-0.5581316, 0.1431758, -1.518252, 1, 1, 1, 1, 1,
-0.5510709, 0.643904, -0.2857643, 1, 1, 1, 1, 1,
-0.5462121, 0.3235914, -1.511734, 1, 1, 1, 1, 1,
-0.5457527, 0.1374227, -2.6586, 1, 1, 1, 1, 1,
-0.5440103, -0.4643342, -1.707135, 1, 1, 1, 1, 1,
-0.5434451, 0.4142182, 0.05602936, 1, 1, 1, 1, 1,
-0.5397837, 0.02796562, -0.1854925, 1, 1, 1, 1, 1,
-0.5389023, -0.8314112, -0.1222732, 1, 1, 1, 1, 1,
-0.5358331, -1.173595, -2.969292, 1, 1, 1, 1, 1,
-0.5356854, 0.03469401, -1.166591, 0, 0, 1, 1, 1,
-0.5352135, -1.301158, -3.414783, 1, 0, 0, 1, 1,
-0.5332362, 1.232453, -0.6110039, 1, 0, 0, 1, 1,
-0.5314603, 1.33359, -1.088159, 1, 0, 0, 1, 1,
-0.531197, -0.6574396, -2.073923, 1, 0, 0, 1, 1,
-0.5134628, -0.4611198, -2.418025, 1, 0, 0, 1, 1,
-0.5132001, -1.242617, -4.27437, 0, 0, 0, 1, 1,
-0.5125402, -0.5060049, -1.548819, 0, 0, 0, 1, 1,
-0.5111645, -1.692137, -3.214152, 0, 0, 0, 1, 1,
-0.5073307, -0.0440689, -2.731386, 0, 0, 0, 1, 1,
-0.5001802, 0.4196371, -2.491428, 0, 0, 0, 1, 1,
-0.4972744, 0.3273222, -1.581695, 0, 0, 0, 1, 1,
-0.4930506, 0.4377362, -0.925809, 0, 0, 0, 1, 1,
-0.4885233, -0.8941191, -3.201044, 1, 1, 1, 1, 1,
-0.4881513, 1.136715, 1.196777, 1, 1, 1, 1, 1,
-0.4834616, 0.5570643, -0.7361571, 1, 1, 1, 1, 1,
-0.4828826, 0.5540178, 0.6443868, 1, 1, 1, 1, 1,
-0.4814939, -0.3595413, -0.2417884, 1, 1, 1, 1, 1,
-0.4765232, -0.1589752, -1.748745, 1, 1, 1, 1, 1,
-0.4725059, -1.385214, -2.799897, 1, 1, 1, 1, 1,
-0.4716479, 1.517275, -1.780707, 1, 1, 1, 1, 1,
-0.4704702, -0.05985844, -0.6715971, 1, 1, 1, 1, 1,
-0.4646324, 0.2098881, -1.176482, 1, 1, 1, 1, 1,
-0.459365, -0.5519094, -1.525318, 1, 1, 1, 1, 1,
-0.4589284, -0.1261945, -2.212374, 1, 1, 1, 1, 1,
-0.4542215, -1.058349, -2.879719, 1, 1, 1, 1, 1,
-0.4541187, -0.4449792, -1.644933, 1, 1, 1, 1, 1,
-0.4535956, -0.7994068, -2.353052, 1, 1, 1, 1, 1,
-0.4534212, -1.447496, -4.008319, 0, 0, 1, 1, 1,
-0.4533686, 1.123466, -1.723302, 1, 0, 0, 1, 1,
-0.4438771, 1.711764, 0.2813455, 1, 0, 0, 1, 1,
-0.4394168, 0.3861296, -1.32674, 1, 0, 0, 1, 1,
-0.4391901, 0.0680856, -1.028253, 1, 0, 0, 1, 1,
-0.4371744, -0.292688, -2.264032, 1, 0, 0, 1, 1,
-0.425846, -0.8914467, -4.461167, 0, 0, 0, 1, 1,
-0.421118, -0.4293266, -4.537213, 0, 0, 0, 1, 1,
-0.4166463, 0.7524247, -3.21958, 0, 0, 0, 1, 1,
-0.415298, 0.9664617, 0.398719, 0, 0, 0, 1, 1,
-0.4092513, 0.7871259, -1.749889, 0, 0, 0, 1, 1,
-0.4081319, -1.125281, -2.539785, 0, 0, 0, 1, 1,
-0.4077923, 0.7439975, 0.3217137, 0, 0, 0, 1, 1,
-0.4017366, -0.2753551, -1.84829, 1, 1, 1, 1, 1,
-0.3913783, -0.1984887, -0.001224016, 1, 1, 1, 1, 1,
-0.3833211, 0.5542959, 1.000719, 1, 1, 1, 1, 1,
-0.3819678, 0.2422416, 0.738353, 1, 1, 1, 1, 1,
-0.377154, 0.834823, -2.42409, 1, 1, 1, 1, 1,
-0.3756644, 1.516305, 1.130355, 1, 1, 1, 1, 1,
-0.3743147, 0.1695564, -2.220514, 1, 1, 1, 1, 1,
-0.3696436, -0.7655883, -2.629164, 1, 1, 1, 1, 1,
-0.3660227, -0.6162678, -4.246697, 1, 1, 1, 1, 1,
-0.3654552, -0.7728316, -3.758945, 1, 1, 1, 1, 1,
-0.3605452, 1.166125, -2.669536, 1, 1, 1, 1, 1,
-0.3556377, -0.1050458, -2.524698, 1, 1, 1, 1, 1,
-0.3520341, 0.6870639, -1.100812, 1, 1, 1, 1, 1,
-0.3513568, 1.238933, -1.01412, 1, 1, 1, 1, 1,
-0.3421827, -0.101383, -1.870362, 1, 1, 1, 1, 1,
-0.3412811, 1.364327, 0.5686417, 0, 0, 1, 1, 1,
-0.3398435, 0.8273731, -0.6787497, 1, 0, 0, 1, 1,
-0.3367718, 0.636946, -1.377567, 1, 0, 0, 1, 1,
-0.3363296, -0.6639218, -2.406567, 1, 0, 0, 1, 1,
-0.3352116, 0.8230081, 0.4521664, 1, 0, 0, 1, 1,
-0.3323852, 0.5895823, 0.1594442, 1, 0, 0, 1, 1,
-0.3319679, -0.4976896, -2.884865, 0, 0, 0, 1, 1,
-0.3297895, -0.8268071, -2.838402, 0, 0, 0, 1, 1,
-0.3295581, 0.1068042, -0.7678196, 0, 0, 0, 1, 1,
-0.3293109, 0.6612664, -0.8907281, 0, 0, 0, 1, 1,
-0.3290889, -0.2768483, -3.292197, 0, 0, 0, 1, 1,
-0.3274027, -1.220779, -1.679494, 0, 0, 0, 1, 1,
-0.3268929, -0.04373704, -1.167934, 0, 0, 0, 1, 1,
-0.3256007, 0.7482402, -0.227944, 1, 1, 1, 1, 1,
-0.3237232, -0.5212393, -2.851437, 1, 1, 1, 1, 1,
-0.3235689, -0.2580532, -2.097229, 1, 1, 1, 1, 1,
-0.3204343, -0.3576014, -1.798421, 1, 1, 1, 1, 1,
-0.3200552, 1.739154, -1.242187, 1, 1, 1, 1, 1,
-0.3149982, -0.05427973, -4.532603, 1, 1, 1, 1, 1,
-0.3089729, 0.1684793, 0.210471, 1, 1, 1, 1, 1,
-0.3088488, -1.389682, -2.457568, 1, 1, 1, 1, 1,
-0.3024418, 0.2564833, 0.5720216, 1, 1, 1, 1, 1,
-0.2996672, -2.05596, -2.236108, 1, 1, 1, 1, 1,
-0.2884004, -1.853134, -1.895754, 1, 1, 1, 1, 1,
-0.284908, -0.5803229, -2.540021, 1, 1, 1, 1, 1,
-0.2842168, -0.09064901, -2.658054, 1, 1, 1, 1, 1,
-0.2822959, -0.4229075, -1.972044, 1, 1, 1, 1, 1,
-0.2821311, 1.190378, 0.5008877, 1, 1, 1, 1, 1,
-0.2790025, -1.019616, -2.731128, 0, 0, 1, 1, 1,
-0.2778378, 0.6489036, -0.7283907, 1, 0, 0, 1, 1,
-0.2752259, -0.2667595, -2.997715, 1, 0, 0, 1, 1,
-0.2719931, -1.300674, -0.9914895, 1, 0, 0, 1, 1,
-0.2708337, 0.3413482, 0.04258691, 1, 0, 0, 1, 1,
-0.2672463, -1.61509, -2.854023, 1, 0, 0, 1, 1,
-0.2644575, 0.04440762, -0.8965265, 0, 0, 0, 1, 1,
-0.2630303, -0.7833118, -2.983451, 0, 0, 0, 1, 1,
-0.2608919, 1.503807, -0.8631733, 0, 0, 0, 1, 1,
-0.2544068, -0.2707977, -1.932904, 0, 0, 0, 1, 1,
-0.2528876, -0.3149043, -0.6394144, 0, 0, 0, 1, 1,
-0.2492335, 0.8487878, -0.4221719, 0, 0, 0, 1, 1,
-0.2460097, 1.495458, 0.3581891, 0, 0, 0, 1, 1,
-0.2455577, 0.02698431, -1.01666, 1, 1, 1, 1, 1,
-0.2443081, 0.7047433, -0.7153204, 1, 1, 1, 1, 1,
-0.2383429, 1.022864, -0.8616305, 1, 1, 1, 1, 1,
-0.2382661, -0.2338369, -3.167676, 1, 1, 1, 1, 1,
-0.2364984, 0.679, 0.4675219, 1, 1, 1, 1, 1,
-0.2353685, 1.242717, -0.5221688, 1, 1, 1, 1, 1,
-0.233582, -0.02669992, -0.6384565, 1, 1, 1, 1, 1,
-0.2329195, -0.9596514, -2.793988, 1, 1, 1, 1, 1,
-0.2293068, 0.7983862, -1.101346, 1, 1, 1, 1, 1,
-0.2292166, -2.232978, -3.065312, 1, 1, 1, 1, 1,
-0.226005, 0.4366951, -0.4278934, 1, 1, 1, 1, 1,
-0.2250904, 0.960331, 0.09520153, 1, 1, 1, 1, 1,
-0.2237086, -0.3044189, -2.132936, 1, 1, 1, 1, 1,
-0.2212891, -1.136719, -3.198915, 1, 1, 1, 1, 1,
-0.2189965, 0.9408334, -0.9835895, 1, 1, 1, 1, 1,
-0.2171435, 0.2273882, -0.4752502, 0, 0, 1, 1, 1,
-0.2163158, -0.2166422, -2.852164, 1, 0, 0, 1, 1,
-0.2136712, -0.2193628, -1.201376, 1, 0, 0, 1, 1,
-0.2117793, 0.8273341, -2.318006, 1, 0, 0, 1, 1,
-0.2113328, -0.4458426, -1.957049, 1, 0, 0, 1, 1,
-0.2111, -1.318073, -2.636486, 1, 0, 0, 1, 1,
-0.2003854, 0.6417485, -0.456096, 0, 0, 0, 1, 1,
-0.1991472, 0.005531929, -1.969873, 0, 0, 0, 1, 1,
-0.1989437, 0.8762119, -0.6103461, 0, 0, 0, 1, 1,
-0.1958049, 0.1482766, -0.7301763, 0, 0, 0, 1, 1,
-0.1906738, 1.564664, 0.8408948, 0, 0, 0, 1, 1,
-0.1894495, -0.4137276, -2.060446, 0, 0, 0, 1, 1,
-0.1878583, -0.8754267, -3.398288, 0, 0, 0, 1, 1,
-0.1704415, -0.8981293, -1.762007, 1, 1, 1, 1, 1,
-0.1694159, 0.8196529, 0.3121361, 1, 1, 1, 1, 1,
-0.1668855, -0.4385845, -3.099319, 1, 1, 1, 1, 1,
-0.1657812, -0.8840048, -3.864553, 1, 1, 1, 1, 1,
-0.1649515, 1.504185, 2.195447, 1, 1, 1, 1, 1,
-0.1617068, -1.446583, -2.573111, 1, 1, 1, 1, 1,
-0.1615819, 0.7609574, -0.5603503, 1, 1, 1, 1, 1,
-0.1604672, 0.3379775, -0.0009744242, 1, 1, 1, 1, 1,
-0.1577064, -1.374841, -3.715743, 1, 1, 1, 1, 1,
-0.15728, 1.204365, -0.09390721, 1, 1, 1, 1, 1,
-0.154067, 0.7142223, -1.179536, 1, 1, 1, 1, 1,
-0.1532509, 0.8009855, -1.679597, 1, 1, 1, 1, 1,
-0.1527567, 0.1854612, 0.4893402, 1, 1, 1, 1, 1,
-0.1455346, 0.6040546, 1.71627, 1, 1, 1, 1, 1,
-0.1446423, 0.2241931, -1.810855, 1, 1, 1, 1, 1,
-0.1406862, -0.5835812, -3.407434, 0, 0, 1, 1, 1,
-0.1362351, -1.201013, -3.983651, 1, 0, 0, 1, 1,
-0.1318694, 0.1820714, -0.7884155, 1, 0, 0, 1, 1,
-0.1271483, -2.092714, -2.705999, 1, 0, 0, 1, 1,
-0.1229975, -0.2595617, -0.9995059, 1, 0, 0, 1, 1,
-0.1212985, -2.318603, -4.481207, 1, 0, 0, 1, 1,
-0.1210476, 1.407523, -0.1382583, 0, 0, 0, 1, 1,
-0.1194645, 0.3454726, -0.8669565, 0, 0, 0, 1, 1,
-0.1193467, 0.659137, 0.4678245, 0, 0, 0, 1, 1,
-0.1174686, 1.340787, -0.3008647, 0, 0, 0, 1, 1,
-0.1153162, 0.02640338, -2.093854, 0, 0, 0, 1, 1,
-0.110297, -0.7278765, -3.532704, 0, 0, 0, 1, 1,
-0.1079948, -2.061972, -3.302296, 0, 0, 0, 1, 1,
-0.1068235, -1.775681, -1.870244, 1, 1, 1, 1, 1,
-0.1039077, -1.32233, -1.64834, 1, 1, 1, 1, 1,
-0.1035618, -0.2328581, -0.9973132, 1, 1, 1, 1, 1,
-0.1027436, -1.025445, -2.986101, 1, 1, 1, 1, 1,
-0.09910869, -0.4997117, -3.578737, 1, 1, 1, 1, 1,
-0.09763931, -0.1456749, -3.322118, 1, 1, 1, 1, 1,
-0.09690818, 0.07455553, -1.927863, 1, 1, 1, 1, 1,
-0.09520326, 0.7797404, -0.6096476, 1, 1, 1, 1, 1,
-0.0905585, -1.090263, -4.459402, 1, 1, 1, 1, 1,
-0.0895448, 0.9426606, -0.1776371, 1, 1, 1, 1, 1,
-0.08788282, -0.002025363, -1.057887, 1, 1, 1, 1, 1,
-0.08718039, -0.09327536, -3.031858, 1, 1, 1, 1, 1,
-0.08686434, -0.4758771, -1.775625, 1, 1, 1, 1, 1,
-0.08634113, 1.325469, 0.5103247, 1, 1, 1, 1, 1,
-0.08465847, -1.337941, -1.987063, 1, 1, 1, 1, 1,
-0.07936142, -0.2895616, -2.127262, 0, 0, 1, 1, 1,
-0.07567854, -0.9790387, -2.485284, 1, 0, 0, 1, 1,
-0.07419753, 0.9084368, 0.5822254, 1, 0, 0, 1, 1,
-0.06955496, -0.5604568, -3.340201, 1, 0, 0, 1, 1,
-0.06509526, -2.437373, -2.78349, 1, 0, 0, 1, 1,
-0.06495304, 0.6035059, -0.07898004, 1, 0, 0, 1, 1,
-0.06408801, 2.079194, 0.8825062, 0, 0, 0, 1, 1,
-0.06145492, 0.1838901, 0.2724121, 0, 0, 0, 1, 1,
-0.05756623, -0.9245459, -3.184163, 0, 0, 0, 1, 1,
-0.05744698, 0.6664694, 0.4522378, 0, 0, 0, 1, 1,
-0.05590939, -0.432351, -2.480347, 0, 0, 0, 1, 1,
-0.05498904, 2.945657, 0.05940492, 0, 0, 0, 1, 1,
-0.05242945, 1.013688, -0.1453732, 0, 0, 0, 1, 1,
-0.04804294, 0.5139664, 0.1719909, 1, 1, 1, 1, 1,
-0.04758928, 0.3133933, 0.3785168, 1, 1, 1, 1, 1,
-0.04517812, -1.332884, -4.352779, 1, 1, 1, 1, 1,
-0.043764, 1.070586, 1.012669, 1, 1, 1, 1, 1,
-0.04189765, -1.034904, -2.378457, 1, 1, 1, 1, 1,
-0.04083074, -2.053684, -3.789951, 1, 1, 1, 1, 1,
-0.03933077, 0.4618194, 0.5746481, 1, 1, 1, 1, 1,
-0.03733452, 1.0885, 1.052013, 1, 1, 1, 1, 1,
-0.03375098, 0.1249429, -0.1505562, 1, 1, 1, 1, 1,
-0.03358173, 1.062335, 0.1267577, 1, 1, 1, 1, 1,
-0.032791, 0.1228613, -1.906401, 1, 1, 1, 1, 1,
-0.03158005, -2.000534, -3.663266, 1, 1, 1, 1, 1,
-0.02908525, 1.273118, -0.4011741, 1, 1, 1, 1, 1,
-0.02825616, -0.12158, -3.028601, 1, 1, 1, 1, 1,
-0.01858182, 1.614751, -1.752396, 1, 1, 1, 1, 1,
-0.01388151, 0.1620117, 0.4614567, 0, 0, 1, 1, 1,
-0.0138117, 0.7083301, 0.3879832, 1, 0, 0, 1, 1,
-0.01332294, -1.933192, -2.41185, 1, 0, 0, 1, 1,
-0.01259462, 1.305552, -1.642226, 1, 0, 0, 1, 1,
-0.009980381, -0.829229, -2.556955, 1, 0, 0, 1, 1,
-0.004086857, 1.442611, -0.3172178, 1, 0, 0, 1, 1,
-0.003423246, -0.05506427, -4.005119, 0, 0, 0, 1, 1,
-0.001243868, -1.304511, -4.573719, 0, 0, 0, 1, 1,
0.0005414836, -0.1779564, 3.039947, 0, 0, 0, 1, 1,
0.00851771, 0.3717204, 0.4358383, 0, 0, 0, 1, 1,
0.008607931, 1.041132, -0.8041797, 0, 0, 0, 1, 1,
0.01052772, -0.2181706, 4.201422, 0, 0, 0, 1, 1,
0.01227514, 1.533768, -1.095903, 0, 0, 0, 1, 1,
0.01398803, 0.5429706, 0.03623118, 1, 1, 1, 1, 1,
0.01621362, -2.209083, 1.615296, 1, 1, 1, 1, 1,
0.01790913, -1.391125, 4.486933, 1, 1, 1, 1, 1,
0.02128037, 1.374795, 0.4521883, 1, 1, 1, 1, 1,
0.02636748, -1.515076, 2.320955, 1, 1, 1, 1, 1,
0.02668914, -2.564782, 2.946148, 1, 1, 1, 1, 1,
0.03183794, 0.7611232, -1.305196, 1, 1, 1, 1, 1,
0.03438373, -0.9344622, 4.199365, 1, 1, 1, 1, 1,
0.03658503, -1.493257, 2.746571, 1, 1, 1, 1, 1,
0.03922116, -1.39766, 1.887706, 1, 1, 1, 1, 1,
0.04010195, -0.5603303, 2.485592, 1, 1, 1, 1, 1,
0.04089976, 0.1746406, 1.086794, 1, 1, 1, 1, 1,
0.04097648, -0.5428724, 3.54633, 1, 1, 1, 1, 1,
0.0412892, -0.313071, 1.585646, 1, 1, 1, 1, 1,
0.0416045, -0.864769, 2.947298, 1, 1, 1, 1, 1,
0.04269578, 0.6099226, -0.9411687, 0, 0, 1, 1, 1,
0.04619975, 0.1257113, 0.05134692, 1, 0, 0, 1, 1,
0.04676572, 0.5621828, -0.6106879, 1, 0, 0, 1, 1,
0.05212884, -0.9184856, 2.286628, 1, 0, 0, 1, 1,
0.05416071, 0.1562156, -0.4231198, 1, 0, 0, 1, 1,
0.05458174, -1.983456, 4.433063, 1, 0, 0, 1, 1,
0.06196866, -0.7752256, 1.807685, 0, 0, 0, 1, 1,
0.06325327, -0.1953148, 3.49738, 0, 0, 0, 1, 1,
0.06523218, -0.01441074, 2.880451, 0, 0, 0, 1, 1,
0.06602566, 0.2467006, 0.8012512, 0, 0, 0, 1, 1,
0.06655059, 0.4246805, -0.04124055, 0, 0, 0, 1, 1,
0.06887721, 0.2965844, -0.8949482, 0, 0, 0, 1, 1,
0.07390096, 1.6415, 1.463125, 0, 0, 0, 1, 1,
0.07833463, 0.9777687, 2.070771, 1, 1, 1, 1, 1,
0.08214726, 0.5167983, 0.1156973, 1, 1, 1, 1, 1,
0.08335496, 0.03860132, -0.03068428, 1, 1, 1, 1, 1,
0.08371727, -0.00243235, 0.8151929, 1, 1, 1, 1, 1,
0.08417529, -0.0460405, 1.709158, 1, 1, 1, 1, 1,
0.08476805, 0.9485752, -0.6154116, 1, 1, 1, 1, 1,
0.08613426, -2.202771, 2.708613, 1, 1, 1, 1, 1,
0.08760138, 0.2582186, 1.215357, 1, 1, 1, 1, 1,
0.08801036, -0.4762333, 2.495641, 1, 1, 1, 1, 1,
0.08869429, -0.7803991, 2.164518, 1, 1, 1, 1, 1,
0.09339446, 0.3728746, -0.546612, 1, 1, 1, 1, 1,
0.0936681, -0.1525747, 3.613898, 1, 1, 1, 1, 1,
0.09524134, 0.5221099, -0.6706471, 1, 1, 1, 1, 1,
0.09756495, -0.7019826, 2.513431, 1, 1, 1, 1, 1,
0.09956606, -0.3613596, 2.836979, 1, 1, 1, 1, 1,
0.1083022, 1.318526, 0.8424951, 0, 0, 1, 1, 1,
0.1087599, -1.156005, 3.691233, 1, 0, 0, 1, 1,
0.1096066, -0.5912761, 3.37472, 1, 0, 0, 1, 1,
0.112834, 0.008158533, 1.877842, 1, 0, 0, 1, 1,
0.1150903, 1.087351, 0.1206611, 1, 0, 0, 1, 1,
0.1181329, -0.7244462, 2.187756, 1, 0, 0, 1, 1,
0.1228249, -0.2491495, 4.091792, 0, 0, 0, 1, 1,
0.1247216, -1.103986, 3.44688, 0, 0, 0, 1, 1,
0.1260534, 0.2202407, 0.5036637, 0, 0, 0, 1, 1,
0.1291212, 1.236042, 0.09444308, 0, 0, 0, 1, 1,
0.130894, -0.6005398, 3.525249, 0, 0, 0, 1, 1,
0.1329214, 0.04641312, 0.7920318, 0, 0, 0, 1, 1,
0.1335352, -0.05648509, 3.879215, 0, 0, 0, 1, 1,
0.1338893, 1.219214, 0.1731051, 1, 1, 1, 1, 1,
0.1357594, -0.6964892, 1.709497, 1, 1, 1, 1, 1,
0.1373633, -0.8811051, 4.441673, 1, 1, 1, 1, 1,
0.1376154, 0.2038429, 2.740782, 1, 1, 1, 1, 1,
0.1415335, 0.1825729, 0.6030939, 1, 1, 1, 1, 1,
0.14226, 0.3119682, 0.9932721, 1, 1, 1, 1, 1,
0.1428388, -0.1749425, 1.082158, 1, 1, 1, 1, 1,
0.1440988, -0.7119793, 1.405919, 1, 1, 1, 1, 1,
0.1468315, -1.749698, 3.463934, 1, 1, 1, 1, 1,
0.1488179, -1.065194, 2.031842, 1, 1, 1, 1, 1,
0.1560608, 0.3701194, 0.4768134, 1, 1, 1, 1, 1,
0.1612284, 0.06194928, 0.8260031, 1, 1, 1, 1, 1,
0.1613228, 0.6444144, -0.5354806, 1, 1, 1, 1, 1,
0.1617408, -2.073129, 4.953752, 1, 1, 1, 1, 1,
0.1636503, -0.2249671, 2.441419, 1, 1, 1, 1, 1,
0.1668788, -0.6238702, 3.6271, 0, 0, 1, 1, 1,
0.1693111, 0.9839835, -0.3573865, 1, 0, 0, 1, 1,
0.1737695, -1.109229, 4.612678, 1, 0, 0, 1, 1,
0.1766384, -1.140176, 2.648844, 1, 0, 0, 1, 1,
0.1771375, 1.662352, -0.06839941, 1, 0, 0, 1, 1,
0.1772091, -0.1401576, 1.163339, 1, 0, 0, 1, 1,
0.1826994, -0.6626392, 4.020166, 0, 0, 0, 1, 1,
0.190294, 1.435591, 0.1805926, 0, 0, 0, 1, 1,
0.1937973, 0.7661476, 0.64696, 0, 0, 0, 1, 1,
0.1945972, 0.8191576, 1.079891, 0, 0, 0, 1, 1,
0.1967451, -0.08404608, 1.915636, 0, 0, 0, 1, 1,
0.1997056, -0.0004875547, 2.473564, 0, 0, 0, 1, 1,
0.1999245, -0.6123703, 3.577337, 0, 0, 0, 1, 1,
0.2058369, 0.4153935, -0.3595848, 1, 1, 1, 1, 1,
0.2074664, 1.738422, -0.116658, 1, 1, 1, 1, 1,
0.2078875, -1.48489, 3.724952, 1, 1, 1, 1, 1,
0.2112848, 1.427731, 0.3468611, 1, 1, 1, 1, 1,
0.2137613, -0.1941097, 2.140739, 1, 1, 1, 1, 1,
0.2148089, -1.345091, 3.911505, 1, 1, 1, 1, 1,
0.2149493, 0.7852759, 0.5904827, 1, 1, 1, 1, 1,
0.2205871, -0.1478592, 1.51549, 1, 1, 1, 1, 1,
0.2215546, 0.5498331, -0.2466547, 1, 1, 1, 1, 1,
0.2231417, -0.04518669, 0.5210925, 1, 1, 1, 1, 1,
0.2237715, 0.7056543, 0.3332074, 1, 1, 1, 1, 1,
0.2251758, 0.1921506, -0.1469262, 1, 1, 1, 1, 1,
0.2284771, -0.79835, 1.889797, 1, 1, 1, 1, 1,
0.23005, -1.227841, 3.550571, 1, 1, 1, 1, 1,
0.2366962, 2.21222, -0.3069225, 1, 1, 1, 1, 1,
0.2368218, 1.510139, -0.3101481, 0, 0, 1, 1, 1,
0.238777, 0.3747196, 1.368575, 1, 0, 0, 1, 1,
0.242433, 0.2672384, -0.588681, 1, 0, 0, 1, 1,
0.2427309, 0.8426552, 1.48543, 1, 0, 0, 1, 1,
0.2445978, -0.7492554, 2.941013, 1, 0, 0, 1, 1,
0.2467125, 0.387263, 1.292989, 1, 0, 0, 1, 1,
0.247576, 0.3359405, 0.9713787, 0, 0, 0, 1, 1,
0.2510296, -0.6418306, 3.604517, 0, 0, 0, 1, 1,
0.2547899, -1.725819, 1.535638, 0, 0, 0, 1, 1,
0.2571563, 0.5665872, 1.868059, 0, 0, 0, 1, 1,
0.2584043, 0.09725464, 1.468342, 0, 0, 0, 1, 1,
0.2660337, 0.8890125, -0.6812953, 0, 0, 0, 1, 1,
0.2685349, -0.7757247, 1.830262, 0, 0, 0, 1, 1,
0.2700793, 0.1399489, 1.124462, 1, 1, 1, 1, 1,
0.2788192, 0.7934058, -0.7516813, 1, 1, 1, 1, 1,
0.2799714, 0.04203339, 0.723229, 1, 1, 1, 1, 1,
0.2801853, 2.161605, 1.09374, 1, 1, 1, 1, 1,
0.2937022, -0.3726741, 1.183242, 1, 1, 1, 1, 1,
0.2980212, 0.7967674, 0.03115563, 1, 1, 1, 1, 1,
0.2985184, 1.87169, 0.2896639, 1, 1, 1, 1, 1,
0.3005024, 1.683626, -0.06126921, 1, 1, 1, 1, 1,
0.3021093, -0.4366901, 2.717448, 1, 1, 1, 1, 1,
0.305163, -2.267841, 3.570455, 1, 1, 1, 1, 1,
0.3059961, -0.9571509, 2.095584, 1, 1, 1, 1, 1,
0.308522, 0.1333911, -0.1010648, 1, 1, 1, 1, 1,
0.3099307, -0.2299783, 2.351617, 1, 1, 1, 1, 1,
0.3100188, 1.189266, -0.7768665, 1, 1, 1, 1, 1,
0.3145079, 1.047633, 0.045717, 1, 1, 1, 1, 1,
0.3156854, 0.9826255, -1.194098, 0, 0, 1, 1, 1,
0.3162848, -0.4660186, 3.352407, 1, 0, 0, 1, 1,
0.3264268, 1.303116, -0.7273081, 1, 0, 0, 1, 1,
0.3285188, -0.5567225, 2.106493, 1, 0, 0, 1, 1,
0.3296989, 2.223297, -0.9077138, 1, 0, 0, 1, 1,
0.3327756, 0.6244475, 1.263366, 1, 0, 0, 1, 1,
0.33286, 1.112715, 0.5701807, 0, 0, 0, 1, 1,
0.3336753, -0.5799292, 2.405085, 0, 0, 0, 1, 1,
0.3344625, -0.4972058, 2.288927, 0, 0, 0, 1, 1,
0.3350293, -0.6666524, 3.296285, 0, 0, 0, 1, 1,
0.3375276, 0.9755979, -0.7365314, 0, 0, 0, 1, 1,
0.3421194, -0.9151828, 1.826164, 0, 0, 0, 1, 1,
0.3424935, -1.564905, 4.202631, 0, 0, 0, 1, 1,
0.3442361, -2.180294, 3.929188, 1, 1, 1, 1, 1,
0.3447767, -0.2605518, 1.850771, 1, 1, 1, 1, 1,
0.3467796, -0.6762687, 2.460695, 1, 1, 1, 1, 1,
0.3497306, -0.3485976, 2.067628, 1, 1, 1, 1, 1,
0.3511848, -0.1263045, 1.566447, 1, 1, 1, 1, 1,
0.3525144, -0.2692007, 2.979852, 1, 1, 1, 1, 1,
0.3538949, 0.2458207, 0.75872, 1, 1, 1, 1, 1,
0.3563547, 0.19779, 0.5354157, 1, 1, 1, 1, 1,
0.3574235, 2.473507, -0.4275757, 1, 1, 1, 1, 1,
0.359177, -0.2718118, 1.013803, 1, 1, 1, 1, 1,
0.3603533, -1.348781, 3.941201, 1, 1, 1, 1, 1,
0.3641224, -0.8763632, 1.220146, 1, 1, 1, 1, 1,
0.3664535, -3.002694, 1.942532, 1, 1, 1, 1, 1,
0.3670839, 0.3366677, 1.890935, 1, 1, 1, 1, 1,
0.3823693, 0.2640783, 0.818048, 1, 1, 1, 1, 1,
0.3831092, -1.059158, 3.019565, 0, 0, 1, 1, 1,
0.3859049, 0.2655759, 0.1112132, 1, 0, 0, 1, 1,
0.392955, -0.5658134, 1.344914, 1, 0, 0, 1, 1,
0.3980166, 0.5733566, 0.4590307, 1, 0, 0, 1, 1,
0.3982859, -0.04399492, 0.3703584, 1, 0, 0, 1, 1,
0.4001684, -0.5536287, 0.8430862, 1, 0, 0, 1, 1,
0.4004903, 1.58775, 1.025806, 0, 0, 0, 1, 1,
0.4017514, -0.403642, 0.5852268, 0, 0, 0, 1, 1,
0.4029522, -1.166735, 2.256631, 0, 0, 0, 1, 1,
0.4034518, -1.695792, 2.750548, 0, 0, 0, 1, 1,
0.4043554, 1.045232, 0.3269379, 0, 0, 0, 1, 1,
0.4067554, -0.008395263, 0.6451284, 0, 0, 0, 1, 1,
0.4099724, 0.5595774, 0.9032958, 0, 0, 0, 1, 1,
0.4113567, -1.182345, 2.474324, 1, 1, 1, 1, 1,
0.413644, -1.348974, 3.925175, 1, 1, 1, 1, 1,
0.4163322, 1.957191, -0.04794263, 1, 1, 1, 1, 1,
0.4180103, 1.69867, -0.1395398, 1, 1, 1, 1, 1,
0.4208702, -0.2767815, 1.280903, 1, 1, 1, 1, 1,
0.4229787, 2.068409, 0.7345107, 1, 1, 1, 1, 1,
0.4257599, -1.23546, 3.124581, 1, 1, 1, 1, 1,
0.4287946, 0.6675417, 0.3225102, 1, 1, 1, 1, 1,
0.4450718, -0.1539461, 1.928922, 1, 1, 1, 1, 1,
0.4452476, -0.5680679, 1.925706, 1, 1, 1, 1, 1,
0.4452711, 0.704953, 2.373089, 1, 1, 1, 1, 1,
0.44767, -0.6989458, 2.726539, 1, 1, 1, 1, 1,
0.4477098, 0.1140431, 1.055356, 1, 1, 1, 1, 1,
0.4477503, -0.2844043, 2.422938, 1, 1, 1, 1, 1,
0.4593388, -1.38315, 3.738283, 1, 1, 1, 1, 1,
0.462002, 1.27287, -0.7981671, 0, 0, 1, 1, 1,
0.4655952, 0.09958946, 1.992324, 1, 0, 0, 1, 1,
0.4681727, -0.5607257, 3.68907, 1, 0, 0, 1, 1,
0.473611, -1.140767, 1.664284, 1, 0, 0, 1, 1,
0.4759034, -0.01676877, 1.095231, 1, 0, 0, 1, 1,
0.4765868, -0.4041713, 1.518806, 1, 0, 0, 1, 1,
0.4769193, -0.06823238, 2.711237, 0, 0, 0, 1, 1,
0.4774679, -0.5523243, 1.796217, 0, 0, 0, 1, 1,
0.4815844, -0.1435493, 1.284226, 0, 0, 0, 1, 1,
0.4865952, 0.9511986, 1.192571, 0, 0, 0, 1, 1,
0.499472, 0.04506278, 0.4196193, 0, 0, 0, 1, 1,
0.5016814, 0.3827699, 0.02276134, 0, 0, 0, 1, 1,
0.5023708, 0.3583332, 1.035531, 0, 0, 0, 1, 1,
0.5024915, -0.3691373, 3.617211, 1, 1, 1, 1, 1,
0.5055038, -0.09674512, 1.665465, 1, 1, 1, 1, 1,
0.5075011, -0.932394, 1.398797, 1, 1, 1, 1, 1,
0.507538, -0.8979559, 4.355567, 1, 1, 1, 1, 1,
0.5125413, -0.8610213, 2.868506, 1, 1, 1, 1, 1,
0.5139682, -0.7468873, 2.856757, 1, 1, 1, 1, 1,
0.5147802, 1.031847, 0.4197715, 1, 1, 1, 1, 1,
0.5156419, 0.540404, 0.468285, 1, 1, 1, 1, 1,
0.5164448, -0.1527939, 1.795935, 1, 1, 1, 1, 1,
0.5177202, -0.9272292, 2.798558, 1, 1, 1, 1, 1,
0.517859, -2.351776, 4.693825, 1, 1, 1, 1, 1,
0.5275688, -0.3077189, 1.264996, 1, 1, 1, 1, 1,
0.5289424, -0.7491478, 1.773195, 1, 1, 1, 1, 1,
0.5327099, 0.02744372, 1.46893, 1, 1, 1, 1, 1,
0.5340961, -0.208803, 2.328644, 1, 1, 1, 1, 1,
0.5356734, 0.1018022, 3.494853, 0, 0, 1, 1, 1,
0.5378484, -0.8113374, 2.841539, 1, 0, 0, 1, 1,
0.539273, -0.671556, 2.75778, 1, 0, 0, 1, 1,
0.5401614, 0.4987518, -1.437274, 1, 0, 0, 1, 1,
0.5414617, -0.9317567, 4.613667, 1, 0, 0, 1, 1,
0.5422754, -0.8368318, 3.448755, 1, 0, 0, 1, 1,
0.5437101, -0.3927345, 3.848423, 0, 0, 0, 1, 1,
0.5463672, -1.938937, 3.543337, 0, 0, 0, 1, 1,
0.5534146, -0.6911383, 1.459487, 0, 0, 0, 1, 1,
0.563521, 0.887908, 1.156917, 0, 0, 0, 1, 1,
0.5639572, -1.196368, 2.772046, 0, 0, 0, 1, 1,
0.5697052, 0.3491579, 1.426952, 0, 0, 0, 1, 1,
0.5741111, 1.405007, -0.2741169, 0, 0, 0, 1, 1,
0.5769856, 1.106009, 1.949986, 1, 1, 1, 1, 1,
0.5812554, 1.44927, 1.177953, 1, 1, 1, 1, 1,
0.5813654, 0.04525135, 1.394911, 1, 1, 1, 1, 1,
0.5818298, -0.5018617, 1.748296, 1, 1, 1, 1, 1,
0.5880414, -0.4176803, 1.16043, 1, 1, 1, 1, 1,
0.5901235, 1.419806, -0.7397162, 1, 1, 1, 1, 1,
0.5960778, 0.4842802, 0.8452474, 1, 1, 1, 1, 1,
0.5969696, -0.6251349, 2.468077, 1, 1, 1, 1, 1,
0.6016797, -0.3753147, 2.267724, 1, 1, 1, 1, 1,
0.6052263, -1.090389, 3.4717, 1, 1, 1, 1, 1,
0.60555, -2.213305, 1.721292, 1, 1, 1, 1, 1,
0.6068035, -0.8632966, 2.786949, 1, 1, 1, 1, 1,
0.6076533, 0.2688952, 0.822129, 1, 1, 1, 1, 1,
0.6111872, -0.3647843, 2.701165, 1, 1, 1, 1, 1,
0.6210672, 1.092713, 1.976687, 1, 1, 1, 1, 1,
0.6275727, 1.264953, -0.0802265, 0, 0, 1, 1, 1,
0.6276116, -0.3843417, 1.452661, 1, 0, 0, 1, 1,
0.6284171, -0.6805021, 1.302805, 1, 0, 0, 1, 1,
0.629079, 0.177829, 2.249494, 1, 0, 0, 1, 1,
0.6335272, 0.3783917, 1.973013, 1, 0, 0, 1, 1,
0.6338972, -0.2796514, 1.619913, 1, 0, 0, 1, 1,
0.6387177, 0.5047871, -0.3911542, 0, 0, 0, 1, 1,
0.6387798, -0.7144387, 4.181092, 0, 0, 0, 1, 1,
0.6418294, -0.2902108, 2.522593, 0, 0, 0, 1, 1,
0.6420299, -0.2481784, 2.081748, 0, 0, 0, 1, 1,
0.6468523, 0.7654278, 1.016933, 0, 0, 0, 1, 1,
0.6497498, 0.2351186, 0.891378, 0, 0, 0, 1, 1,
0.65212, -1.16068, 2.441077, 0, 0, 0, 1, 1,
0.6531639, 1.478129, 0.3911785, 1, 1, 1, 1, 1,
0.6575812, -0.1321768, 1.0717, 1, 1, 1, 1, 1,
0.6625552, -0.8968548, 0.8092384, 1, 1, 1, 1, 1,
0.6642695, 2.276181, -1.378101, 1, 1, 1, 1, 1,
0.6691086, -0.181087, 2.115628, 1, 1, 1, 1, 1,
0.6726053, 0.6748282, 0.9193, 1, 1, 1, 1, 1,
0.6750968, -0.4688091, 2.073359, 1, 1, 1, 1, 1,
0.6762813, 0.3423338, -0.0178245, 1, 1, 1, 1, 1,
0.6773119, 0.9175779, -1.15746, 1, 1, 1, 1, 1,
0.690024, -1.216775, 2.677106, 1, 1, 1, 1, 1,
0.691301, 1.673548, 1.80074, 1, 1, 1, 1, 1,
0.6956611, 0.3477014, 1.237283, 1, 1, 1, 1, 1,
0.6959991, 1.496219, 0.540073, 1, 1, 1, 1, 1,
0.697728, -0.5710002, 0.7608886, 1, 1, 1, 1, 1,
0.6989141, 1.140857, -0.1134615, 1, 1, 1, 1, 1,
0.7009465, -1.941373, 3.848667, 0, 0, 1, 1, 1,
0.702168, 1.111, 0.7611298, 1, 0, 0, 1, 1,
0.7123787, 0.008170529, 2.977269, 1, 0, 0, 1, 1,
0.7128829, 1.490723, 2.134167, 1, 0, 0, 1, 1,
0.7170551, 0.8295594, 3.361471, 1, 0, 0, 1, 1,
0.7174016, 1.022159, 0.7854679, 1, 0, 0, 1, 1,
0.7216454, 0.8302706, 1.172975, 0, 0, 0, 1, 1,
0.7248771, -1.775353, 2.529646, 0, 0, 0, 1, 1,
0.7351505, -0.4941031, 2.213118, 0, 0, 0, 1, 1,
0.7430075, 1.715498, 1.2248, 0, 0, 0, 1, 1,
0.7561991, -0.3966376, 1.533375, 0, 0, 0, 1, 1,
0.7583749, -0.1339594, 3.529118, 0, 0, 0, 1, 1,
0.7622572, 0.2637538, 1.193882, 0, 0, 0, 1, 1,
0.7630238, 1.038378, 1.965262, 1, 1, 1, 1, 1,
0.7640321, -1.316558, 1.458325, 1, 1, 1, 1, 1,
0.7646474, 0.6289108, -0.8458547, 1, 1, 1, 1, 1,
0.7665145, 0.5313056, 1.205294, 1, 1, 1, 1, 1,
0.768918, 0.1228515, -0.4234655, 1, 1, 1, 1, 1,
0.7689877, 0.6317447, 0.82167, 1, 1, 1, 1, 1,
0.7709916, -0.1909189, 2.571561, 1, 1, 1, 1, 1,
0.7714398, -0.3708478, 1.039763, 1, 1, 1, 1, 1,
0.7732038, -0.4414902, 2.050603, 1, 1, 1, 1, 1,
0.7792271, -0.4951901, 1.249012, 1, 1, 1, 1, 1,
0.7824334, -0.774024, 2.396991, 1, 1, 1, 1, 1,
0.7834656, 0.1246807, 2.750956, 1, 1, 1, 1, 1,
0.7898166, 0.717871, 1.592043, 1, 1, 1, 1, 1,
0.7902769, -0.5794393, 1.607083, 1, 1, 1, 1, 1,
0.7910704, -0.5274945, 1.489313, 1, 1, 1, 1, 1,
0.7946324, -0.0388291, -0.54158, 0, 0, 1, 1, 1,
0.7948397, -0.6641194, 2.625686, 1, 0, 0, 1, 1,
0.8108332, -0.8488991, 3.912132, 1, 0, 0, 1, 1,
0.8239388, 0.99548, 0.283702, 1, 0, 0, 1, 1,
0.827651, 0.9750744, 1.889063, 1, 0, 0, 1, 1,
0.8411064, -0.9704929, 2.06182, 1, 0, 0, 1, 1,
0.8421152, 0.01076805, 0.872202, 0, 0, 0, 1, 1,
0.8436941, 0.617366, 0.5595533, 0, 0, 0, 1, 1,
0.8453965, -0.289551, 2.802613, 0, 0, 0, 1, 1,
0.8542774, -0.1090946, 2.724923, 0, 0, 0, 1, 1,
0.8590232, -1.522627, 1.470936, 0, 0, 0, 1, 1,
0.8595169, -0.9281064, 3.141988, 0, 0, 0, 1, 1,
0.8606586, -2.104964, 1.334566, 0, 0, 0, 1, 1,
0.8683719, -0.6866994, 1.209631, 1, 1, 1, 1, 1,
0.8729925, -0.8326719, 0.1277177, 1, 1, 1, 1, 1,
0.8735132, -0.333881, 2.104752, 1, 1, 1, 1, 1,
0.8816144, 0.8272271, -1.931069, 1, 1, 1, 1, 1,
0.8827038, -0.5275931, 2.617256, 1, 1, 1, 1, 1,
0.8827981, -1.157837, 2.498227, 1, 1, 1, 1, 1,
0.8879259, -0.3206788, 0.8383656, 1, 1, 1, 1, 1,
0.890149, 0.5465586, 0.006234912, 1, 1, 1, 1, 1,
0.8951576, 1.052697, 0.9728388, 1, 1, 1, 1, 1,
0.901029, 0.03856344, -0.9448004, 1, 1, 1, 1, 1,
0.9191898, 0.05340255, 2.193121, 1, 1, 1, 1, 1,
0.9201295, -0.5072671, 1.135787, 1, 1, 1, 1, 1,
0.9294503, 1.309099, 1.630751, 1, 1, 1, 1, 1,
0.9297165, 0.3422529, 0.9528981, 1, 1, 1, 1, 1,
0.9349461, 0.8304866, 0.8101511, 1, 1, 1, 1, 1,
0.9462669, -1.877969, 0.6169339, 0, 0, 1, 1, 1,
0.9537188, -0.5676233, 2.26722, 1, 0, 0, 1, 1,
0.9644244, 1.395323, 0.725762, 1, 0, 0, 1, 1,
0.9665251, -0.4232285, 2.218397, 1, 0, 0, 1, 1,
0.9678987, 0.3372513, 1.445832, 1, 0, 0, 1, 1,
0.9716472, 0.429007, 1.323454, 1, 0, 0, 1, 1,
0.9738669, 0.9469572, 1.379238, 0, 0, 0, 1, 1,
0.9794878, 0.1553987, 1.224862, 0, 0, 0, 1, 1,
0.9823844, 0.3439999, 0.3516282, 0, 0, 0, 1, 1,
0.9867492, -0.03046599, 1.033852, 0, 0, 0, 1, 1,
0.9904953, -1.367968, 1.725267, 0, 0, 0, 1, 1,
0.9939616, 1.787098, 0.6576002, 0, 0, 0, 1, 1,
0.9955259, 2.100103, 0.8463271, 0, 0, 0, 1, 1,
1.005961, -0.826722, 0.4414352, 1, 1, 1, 1, 1,
1.00667, -0.1460118, 0.4982889, 1, 1, 1, 1, 1,
1.007671, 0.9517046, 0.7264895, 1, 1, 1, 1, 1,
1.008764, 1.659651, -0.1009765, 1, 1, 1, 1, 1,
1.020005, -0.2270654, 1.970029, 1, 1, 1, 1, 1,
1.022838, 0.09706269, 1.731449, 1, 1, 1, 1, 1,
1.022977, 0.1895474, 1.511254, 1, 1, 1, 1, 1,
1.023771, -1.54934, 2.557747, 1, 1, 1, 1, 1,
1.030123, -0.09694285, 2.482111, 1, 1, 1, 1, 1,
1.03881, 0.8040498, 1.418561, 1, 1, 1, 1, 1,
1.039757, 0.6879056, 0.24495, 1, 1, 1, 1, 1,
1.042466, 0.3872272, 0.5942054, 1, 1, 1, 1, 1,
1.043092, -0.07027726, 2.395483, 1, 1, 1, 1, 1,
1.043926, -0.09565348, 1.674425, 1, 1, 1, 1, 1,
1.053062, -0.6763954, 2.161162, 1, 1, 1, 1, 1,
1.059322, 0.5618186, 1.993987, 0, 0, 1, 1, 1,
1.062062, -0.224523, 2.022843, 1, 0, 0, 1, 1,
1.062347, -1.967127, 2.916193, 1, 0, 0, 1, 1,
1.070231, 0.6865162, 0.3001101, 1, 0, 0, 1, 1,
1.072608, 0.7381094, 0.3162658, 1, 0, 0, 1, 1,
1.075319, 0.03790087, 2.960463, 1, 0, 0, 1, 1,
1.079813, -1.343762, 1.828185, 0, 0, 0, 1, 1,
1.087679, -0.9911074, 1.7074, 0, 0, 0, 1, 1,
1.094506, 0.08799386, 1.837492, 0, 0, 0, 1, 1,
1.096314, -0.4591698, 0.6049395, 0, 0, 0, 1, 1,
1.098924, -0.5671224, 3.368316, 0, 0, 0, 1, 1,
1.099258, -0.1788543, 0.628829, 0, 0, 0, 1, 1,
1.107475, 0.9429724, 0.2629451, 0, 0, 0, 1, 1,
1.109513, -0.8596948, 1.877624, 1, 1, 1, 1, 1,
1.113283, 2.050489, -1.295627, 1, 1, 1, 1, 1,
1.134656, -0.4115688, 2.579728, 1, 1, 1, 1, 1,
1.136791, 1.925191, -0.5309209, 1, 1, 1, 1, 1,
1.156844, 0.1181438, 2.711327, 1, 1, 1, 1, 1,
1.159105, -0.9799981, 3.502795, 1, 1, 1, 1, 1,
1.162641, 1.209773, 0.8135089, 1, 1, 1, 1, 1,
1.167271, -1.062528, 3.068113, 1, 1, 1, 1, 1,
1.174892, -0.2956617, 1.067762, 1, 1, 1, 1, 1,
1.177945, -0.5764234, 2.56863, 1, 1, 1, 1, 1,
1.178871, -0.448809, 3.121436, 1, 1, 1, 1, 1,
1.179339, -0.2263528, 1.329698, 1, 1, 1, 1, 1,
1.179682, 0.8196377, 0.1051656, 1, 1, 1, 1, 1,
1.180603, -1.965311, 2.819078, 1, 1, 1, 1, 1,
1.1894, -0.8657961, 2.018332, 1, 1, 1, 1, 1,
1.192806, 0.1903286, 2.440033, 0, 0, 1, 1, 1,
1.199225, 0.4646496, 0.7254323, 1, 0, 0, 1, 1,
1.203779, -0.5655268, 2.029191, 1, 0, 0, 1, 1,
1.205132, 2.429284, 0.4566717, 1, 0, 0, 1, 1,
1.220411, -1.241151, 3.06079, 1, 0, 0, 1, 1,
1.230035, 0.1130844, 1.77811, 1, 0, 0, 1, 1,
1.235435, -1.157171, 3.401048, 0, 0, 0, 1, 1,
1.237059, 0.2570799, 0.8709262, 0, 0, 0, 1, 1,
1.249505, -2.648637, 4.356925, 0, 0, 0, 1, 1,
1.254414, 0.3957618, 2.324311, 0, 0, 0, 1, 1,
1.25835, -0.477027, 3.163077, 0, 0, 0, 1, 1,
1.262623, -0.4391689, 2.696542, 0, 0, 0, 1, 1,
1.267078, 0.8440312, 0.2593042, 0, 0, 0, 1, 1,
1.276084, -0.3031218, 0.7448631, 1, 1, 1, 1, 1,
1.288953, -1.442611, 2.340622, 1, 1, 1, 1, 1,
1.297427, 0.2661731, 0.1782874, 1, 1, 1, 1, 1,
1.301541, 2.221685, 1.626434, 1, 1, 1, 1, 1,
1.305426, 0.7709876, 0.8994895, 1, 1, 1, 1, 1,
1.306734, 1.214734, 0.9011178, 1, 1, 1, 1, 1,
1.319921, 0.2523817, 1.133302, 1, 1, 1, 1, 1,
1.326953, -0.0874081, 2.535299, 1, 1, 1, 1, 1,
1.33572, -0.2547882, 2.978171, 1, 1, 1, 1, 1,
1.336423, -0.4754029, 1.870274, 1, 1, 1, 1, 1,
1.339987, -1.050023, 2.459283, 1, 1, 1, 1, 1,
1.354061, -0.9810742, 2.403527, 1, 1, 1, 1, 1,
1.366395, -0.3871806, 1.949896, 1, 1, 1, 1, 1,
1.366667, 0.7292707, -0.1979623, 1, 1, 1, 1, 1,
1.369326, -0.4677068, 1.819799, 1, 1, 1, 1, 1,
1.388082, 0.5290279, 1.313223, 0, 0, 1, 1, 1,
1.402634, 0.9425421, -0.4896451, 1, 0, 0, 1, 1,
1.402943, 0.3752364, 0.6106576, 1, 0, 0, 1, 1,
1.411362, -0.5869341, 2.308757, 1, 0, 0, 1, 1,
1.417205, -0.528879, 0.747622, 1, 0, 0, 1, 1,
1.422158, 1.043252, 1.279309, 1, 0, 0, 1, 1,
1.430054, 0.8890297, 1.450724, 0, 0, 0, 1, 1,
1.437808, -0.3831641, 0.4344496, 0, 0, 0, 1, 1,
1.451189, -0.6907943, 3.067986, 0, 0, 0, 1, 1,
1.466856, -1.006252, 2.520314, 0, 0, 0, 1, 1,
1.467087, -0.4266848, 2.105556, 0, 0, 0, 1, 1,
1.494005, 0.2559847, 2.355303, 0, 0, 0, 1, 1,
1.495622, 0.208938, 1.488466, 0, 0, 0, 1, 1,
1.499263, -1.809726, 2.377561, 1, 1, 1, 1, 1,
1.504069, 0.291325, -0.03023855, 1, 1, 1, 1, 1,
1.522135, -1.435549, 2.194761, 1, 1, 1, 1, 1,
1.523649, -1.094352, 2.330211, 1, 1, 1, 1, 1,
1.548061, -0.04624307, 0.7400733, 1, 1, 1, 1, 1,
1.553042, 2.34044, 1.807793, 1, 1, 1, 1, 1,
1.586105, 0.04935294, 1.842267, 1, 1, 1, 1, 1,
1.616271, 0.5844833, 0.6752861, 1, 1, 1, 1, 1,
1.638974, -0.223122, 2.207824, 1, 1, 1, 1, 1,
1.644711, -0.662444, 1.669562, 1, 1, 1, 1, 1,
1.658573, -1.532624, 3.295946, 1, 1, 1, 1, 1,
1.660775, -0.6253235, 0.1362307, 1, 1, 1, 1, 1,
1.67064, 2.031625, 0.605453, 1, 1, 1, 1, 1,
1.673, -1.168028, 3.017354, 1, 1, 1, 1, 1,
1.679917, 1.141347, -0.211039, 1, 1, 1, 1, 1,
1.681706, 0.7788821, 0.3718332, 0, 0, 1, 1, 1,
1.683264, 0.7823817, 0.6794152, 1, 0, 0, 1, 1,
1.709844, 0.253568, 3.586123, 1, 0, 0, 1, 1,
1.742108, 0.8724339, 1.298068, 1, 0, 0, 1, 1,
1.744211, 0.3873567, 1.369575, 1, 0, 0, 1, 1,
1.744273, 0.6669804, 1.308405, 1, 0, 0, 1, 1,
1.747045, 1.89178, 0.7972488, 0, 0, 0, 1, 1,
1.761679, 0.1409658, 1.972042, 0, 0, 0, 1, 1,
1.779904, 0.6871302, 2.216845, 0, 0, 0, 1, 1,
1.781615, 0.8772553, 0.6627437, 0, 0, 0, 1, 1,
1.783577, 1.985008, 1.630545, 0, 0, 0, 1, 1,
1.791108, 0.7501087, 0.8402673, 0, 0, 0, 1, 1,
1.791213, 0.3036071, 0.4973311, 0, 0, 0, 1, 1,
1.791305, -0.779668, 0.8332928, 1, 1, 1, 1, 1,
1.791409, -0.6402675, 2.786708, 1, 1, 1, 1, 1,
1.796045, -0.2602907, 0.2570062, 1, 1, 1, 1, 1,
1.8029, -1.296404, 2.444832, 1, 1, 1, 1, 1,
1.834836, 1.158753, 1.72969, 1, 1, 1, 1, 1,
1.843313, 0.3171484, 0.6240097, 1, 1, 1, 1, 1,
1.855, 1.08529, 2.213369, 1, 1, 1, 1, 1,
1.85632, -0.0179892, 0.9762233, 1, 1, 1, 1, 1,
1.8681, -0.8278382, 1.049106, 1, 1, 1, 1, 1,
1.881247, 0.8781797, -0.7518467, 1, 1, 1, 1, 1,
1.893957, 0.7884481, 2.300686, 1, 1, 1, 1, 1,
1.96102, -0.001843195, 2.535435, 1, 1, 1, 1, 1,
1.986162, -0.2831406, 1.252261, 1, 1, 1, 1, 1,
2.007847, -1.208168, 1.843153, 1, 1, 1, 1, 1,
2.016902, 0.5797775, 1.205801, 1, 1, 1, 1, 1,
2.030297, -0.4482712, 2.253244, 0, 0, 1, 1, 1,
2.056946, 0.7235826, 1.128505, 1, 0, 0, 1, 1,
2.121997, -0.7725993, 2.352214, 1, 0, 0, 1, 1,
2.136917, 0.03531416, 1.411864, 1, 0, 0, 1, 1,
2.172082, 0.533487, 2.04993, 1, 0, 0, 1, 1,
2.234277, -1.910053, 4.281597, 1, 0, 0, 1, 1,
2.249536, -0.2890826, 0.9557711, 0, 0, 0, 1, 1,
2.261767, 0.001285917, -0.01705631, 0, 0, 0, 1, 1,
2.342299, 1.099642, 0.6547107, 0, 0, 0, 1, 1,
2.395859, -1.076869, 2.33726, 0, 0, 0, 1, 1,
2.397781, 1.880046, 0.4852479, 0, 0, 0, 1, 1,
2.446276, 0.2646161, 2.353418, 0, 0, 0, 1, 1,
2.450911, 0.1803162, 2.016038, 0, 0, 0, 1, 1,
2.482319, 0.06783967, 0.5523953, 1, 1, 1, 1, 1,
2.524012, -0.1753611, 1.688376, 1, 1, 1, 1, 1,
2.672058, 0.328164, 0.6685939, 1, 1, 1, 1, 1,
2.743958, 1.13764, 0.8644172, 1, 1, 1, 1, 1,
2.76719, -0.6322861, 0.2274757, 1, 1, 1, 1, 1,
2.844644, 0.4626947, -0.02135334, 1, 1, 1, 1, 1,
3.185614, 1.255587, 1.656901, 1, 1, 1, 1, 1
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
var radius = 9.18368;
var distance = 32.25729;
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
mvMatrix.translate( -0.1382592, -0.04457712, 0.124157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.25729);
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