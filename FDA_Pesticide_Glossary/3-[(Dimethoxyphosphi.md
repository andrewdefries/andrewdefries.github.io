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
-4.167795, -0.3701977, -2.062534, 1, 0, 0, 1,
-3.799272, 0.6678337, -1.342442, 1, 0.007843138, 0, 1,
-3.260782, 1.232152, -0.9365724, 1, 0.01176471, 0, 1,
-2.866719, 0.005508078, -0.0247058, 1, 0.01960784, 0, 1,
-2.852708, -1.008276, -1.456782, 1, 0.02352941, 0, 1,
-2.799301, 0.8340659, -2.971326, 1, 0.03137255, 0, 1,
-2.731817, 0.3303211, -0.7106091, 1, 0.03529412, 0, 1,
-2.722332, 0.4851252, -1.235579, 1, 0.04313726, 0, 1,
-2.681911, 0.07412555, -2.268521, 1, 0.04705882, 0, 1,
-2.642356, -0.7792301, -1.327835, 1, 0.05490196, 0, 1,
-2.614126, -0.8318884, -3.733945, 1, 0.05882353, 0, 1,
-2.419684, 0.4043932, -2.078207, 1, 0.06666667, 0, 1,
-2.378295, 0.1583334, -3.003462, 1, 0.07058824, 0, 1,
-2.351328, 0.4897929, -2.945859, 1, 0.07843138, 0, 1,
-2.305548, 0.1503517, -2.528556, 1, 0.08235294, 0, 1,
-2.295234, 0.8246477, -1.017631, 1, 0.09019608, 0, 1,
-2.284793, -1.528494, -0.6319808, 1, 0.09411765, 0, 1,
-2.283865, -0.2269969, -0.6257433, 1, 0.1019608, 0, 1,
-2.248216, -0.2748533, -0.994589, 1, 0.1098039, 0, 1,
-2.244779, -0.5170498, -2.681928, 1, 0.1137255, 0, 1,
-2.185312, -1.570503, -0.1089287, 1, 0.1215686, 0, 1,
-2.169823, -0.550391, -1.377889, 1, 0.1254902, 0, 1,
-2.125457, 0.5893226, -2.189369, 1, 0.1333333, 0, 1,
-2.120954, -1.666246, -3.944743, 1, 0.1372549, 0, 1,
-2.107641, 1.132546, -0.3875448, 1, 0.145098, 0, 1,
-2.102316, -1.132706, -1.552354, 1, 0.1490196, 0, 1,
-2.099897, -0.3150943, -2.098342, 1, 0.1568628, 0, 1,
-2.094599, -1.114065, -2.565293, 1, 0.1607843, 0, 1,
-2.071439, -0.2035094, -2.319842, 1, 0.1686275, 0, 1,
-2.057912, -0.164263, -1.693519, 1, 0.172549, 0, 1,
-2.044679, -1.161649, -2.330457, 1, 0.1803922, 0, 1,
-2.026417, 0.3130924, -2.592162, 1, 0.1843137, 0, 1,
-2.017442, -0.3772983, -0.9265884, 1, 0.1921569, 0, 1,
-2.005271, 2.01692, -1.593262, 1, 0.1960784, 0, 1,
-1.9593, -0.1719434, -2.559349, 1, 0.2039216, 0, 1,
-1.920311, 0.4405544, -1.466142, 1, 0.2117647, 0, 1,
-1.914517, 0.2881116, -1.801681, 1, 0.2156863, 0, 1,
-1.90274, 0.03316067, -1.848781, 1, 0.2235294, 0, 1,
-1.890387, -0.7148224, -0.499938, 1, 0.227451, 0, 1,
-1.88756, -0.3198874, -1.314642, 1, 0.2352941, 0, 1,
-1.86139, 0.5198174, -2.630613, 1, 0.2392157, 0, 1,
-1.839658, 0.4237781, -0.3824531, 1, 0.2470588, 0, 1,
-1.837039, 0.7027369, -2.194193, 1, 0.2509804, 0, 1,
-1.804666, -1.054073, -2.384906, 1, 0.2588235, 0, 1,
-1.803265, 0.002375393, -1.190153, 1, 0.2627451, 0, 1,
-1.79572, 0.02739767, -2.924449, 1, 0.2705882, 0, 1,
-1.77474, 1.249815, -1.039268, 1, 0.2745098, 0, 1,
-1.760676, -2.136178, -2.085724, 1, 0.282353, 0, 1,
-1.759913, 0.6403741, -0.4497816, 1, 0.2862745, 0, 1,
-1.747259, 1.14989, -1.059868, 1, 0.2941177, 0, 1,
-1.742205, 1.791001, -1.113744, 1, 0.3019608, 0, 1,
-1.723651, -0.3303344, -2.389592, 1, 0.3058824, 0, 1,
-1.722519, -1.241169, -1.931611, 1, 0.3137255, 0, 1,
-1.699557, 0.4021861, -2.64923, 1, 0.3176471, 0, 1,
-1.692345, -1.57366, -0.7761168, 1, 0.3254902, 0, 1,
-1.664166, -0.9618666, -2.247865, 1, 0.3294118, 0, 1,
-1.656272, -0.3806509, -0.2031074, 1, 0.3372549, 0, 1,
-1.649459, -0.6197847, -0.9636036, 1, 0.3411765, 0, 1,
-1.649395, -0.2532885, -3.194247, 1, 0.3490196, 0, 1,
-1.646043, -0.8274341, -2.947161, 1, 0.3529412, 0, 1,
-1.642309, -0.7277148, -1.306049, 1, 0.3607843, 0, 1,
-1.628438, -0.9124582, -2.16029, 1, 0.3647059, 0, 1,
-1.626447, -1.068124, -2.974605, 1, 0.372549, 0, 1,
-1.609699, 0.7104192, -0.7293993, 1, 0.3764706, 0, 1,
-1.593301, -0.04293751, -1.860897, 1, 0.3843137, 0, 1,
-1.591026, -0.2319275, -2.622726, 1, 0.3882353, 0, 1,
-1.590891, -1.338551, -2.641182, 1, 0.3960784, 0, 1,
-1.587392, 0.4661877, -0.5010815, 1, 0.4039216, 0, 1,
-1.583327, 0.2147374, -0.4421664, 1, 0.4078431, 0, 1,
-1.553954, 0.9404318, -1.242709, 1, 0.4156863, 0, 1,
-1.531126, -1.228049, -1.235601, 1, 0.4196078, 0, 1,
-1.522307, 1.135477, -1.791332, 1, 0.427451, 0, 1,
-1.514034, -1.714073, -2.68372, 1, 0.4313726, 0, 1,
-1.500041, 0.4469875, -2.146012, 1, 0.4392157, 0, 1,
-1.498034, -0.3447345, -2.226876, 1, 0.4431373, 0, 1,
-1.476772, -0.6490561, -2.53105, 1, 0.4509804, 0, 1,
-1.468037, -0.8195832, -2.240857, 1, 0.454902, 0, 1,
-1.455522, -0.5253172, -0.361138, 1, 0.4627451, 0, 1,
-1.450812, -1.080305, -2.493484, 1, 0.4666667, 0, 1,
-1.449347, 1.79685, -1.550784, 1, 0.4745098, 0, 1,
-1.431319, -2.655754, -2.693288, 1, 0.4784314, 0, 1,
-1.416635, 0.2890699, -2.141816, 1, 0.4862745, 0, 1,
-1.414192, 0.9801525, 0.3556107, 1, 0.4901961, 0, 1,
-1.40941, 2.381377, 1.17125, 1, 0.4980392, 0, 1,
-1.401239, 0.5505595, -2.250259, 1, 0.5058824, 0, 1,
-1.398203, 0.8010048, -1.411423, 1, 0.509804, 0, 1,
-1.391701, -1.244141, -1.84894, 1, 0.5176471, 0, 1,
-1.391678, -0.3686838, -0.8519586, 1, 0.5215687, 0, 1,
-1.38432, 1.193275, 1.666173, 1, 0.5294118, 0, 1,
-1.376846, 0.5975076, -2.093269, 1, 0.5333334, 0, 1,
-1.374646, -0.2569143, -0.1806175, 1, 0.5411765, 0, 1,
-1.354318, -0.1971574, -1.467851, 1, 0.5450981, 0, 1,
-1.353222, -1.023023, -0.08905367, 1, 0.5529412, 0, 1,
-1.351043, -0.5023288, -2.919929, 1, 0.5568628, 0, 1,
-1.348101, -0.6227985, -1.321449, 1, 0.5647059, 0, 1,
-1.345189, 1.348127, -2.274698, 1, 0.5686275, 0, 1,
-1.336722, -0.4547801, -2.507659, 1, 0.5764706, 0, 1,
-1.335538, -0.05784697, -1.654405, 1, 0.5803922, 0, 1,
-1.332643, -1.004339, -3.893179, 1, 0.5882353, 0, 1,
-1.330019, 0.3027591, 0.6527638, 1, 0.5921569, 0, 1,
-1.326418, 0.1020934, 0.2355896, 1, 0.6, 0, 1,
-1.307239, 0.008975388, -1.740608, 1, 0.6078432, 0, 1,
-1.299506, -1.729097, -4.951238, 1, 0.6117647, 0, 1,
-1.285689, 0.1011877, -0.7864694, 1, 0.6196079, 0, 1,
-1.252254, 1.965262, -0.7441403, 1, 0.6235294, 0, 1,
-1.245043, 2.252333, -0.4196982, 1, 0.6313726, 0, 1,
-1.237673, -0.5657525, -2.36377, 1, 0.6352941, 0, 1,
-1.228639, -0.2425162, -1.007066, 1, 0.6431373, 0, 1,
-1.228397, 1.055216, -0.4566085, 1, 0.6470588, 0, 1,
-1.222456, 0.1385325, -2.167444, 1, 0.654902, 0, 1,
-1.219486, 1.396843, -0.100069, 1, 0.6588235, 0, 1,
-1.217016, 1.579169, -0.244858, 1, 0.6666667, 0, 1,
-1.212535, -0.02689586, -0.753432, 1, 0.6705883, 0, 1,
-1.211774, 0.8330191, -0.8574874, 1, 0.6784314, 0, 1,
-1.209113, 0.5416003, 0.1487342, 1, 0.682353, 0, 1,
-1.197945, 0.04371569, -1.431153, 1, 0.6901961, 0, 1,
-1.196248, 1.600481, 0.2987211, 1, 0.6941177, 0, 1,
-1.195805, -0.3704211, -0.591638, 1, 0.7019608, 0, 1,
-1.194952, -0.5514579, -4.539737, 1, 0.7098039, 0, 1,
-1.192274, -0.3674892, -3.12292, 1, 0.7137255, 0, 1,
-1.189502, -1.207317, -1.890702, 1, 0.7215686, 0, 1,
-1.188285, -0.6914169, -0.404894, 1, 0.7254902, 0, 1,
-1.187802, -0.602974, -1.406759, 1, 0.7333333, 0, 1,
-1.187549, 0.5889934, -2.32333, 1, 0.7372549, 0, 1,
-1.18588, -0.5775011, -2.41956, 1, 0.7450981, 0, 1,
-1.181106, 2.03485, 1.034611, 1, 0.7490196, 0, 1,
-1.170545, -0.1216681, -3.166773, 1, 0.7568628, 0, 1,
-1.165228, -2.653571, -4.540947, 1, 0.7607843, 0, 1,
-1.158126, 0.2755903, -1.85641, 1, 0.7686275, 0, 1,
-1.148145, -0.06231699, -1.386651, 1, 0.772549, 0, 1,
-1.13971, 0.3875835, -2.796021, 1, 0.7803922, 0, 1,
-1.135399, 0.244064, -0.9663073, 1, 0.7843137, 0, 1,
-1.124951, 0.6403357, -2.874332, 1, 0.7921569, 0, 1,
-1.124258, -0.8133162, -1.81043, 1, 0.7960784, 0, 1,
-1.124053, -1.435604, -2.6174, 1, 0.8039216, 0, 1,
-1.108825, 1.395163, 0.0005171222, 1, 0.8117647, 0, 1,
-1.106014, -0.7608312, -1.715026, 1, 0.8156863, 0, 1,
-1.101651, -0.06832895, -2.033796, 1, 0.8235294, 0, 1,
-1.100721, 1.062253, -2.135212, 1, 0.827451, 0, 1,
-1.098755, -0.7557455, -2.580479, 1, 0.8352941, 0, 1,
-1.098147, 1.133291, -0.7580019, 1, 0.8392157, 0, 1,
-1.097016, -1.301089, -1.769612, 1, 0.8470588, 0, 1,
-1.092945, -0.1323653, -0.5321937, 1, 0.8509804, 0, 1,
-1.090406, 0.09381537, -1.890621, 1, 0.8588235, 0, 1,
-1.083588, -0.8735268, -3.615885, 1, 0.8627451, 0, 1,
-1.072132, 0.7818518, 0.8261743, 1, 0.8705882, 0, 1,
-1.069556, 0.2209351, -0.4707638, 1, 0.8745098, 0, 1,
-1.062732, -1.140153, -3.049272, 1, 0.8823529, 0, 1,
-1.054087, -0.8270208, 0.1900159, 1, 0.8862745, 0, 1,
-1.053609, 0.03910476, -0.7801054, 1, 0.8941177, 0, 1,
-1.048908, -0.06720459, -0.1263378, 1, 0.8980392, 0, 1,
-1.048378, 1.231349, -0.5392426, 1, 0.9058824, 0, 1,
-1.033851, -0.07669776, -2.949266, 1, 0.9137255, 0, 1,
-1.033598, -0.2955931, -1.112071, 1, 0.9176471, 0, 1,
-1.032763, 0.3199719, -2.207225, 1, 0.9254902, 0, 1,
-1.030763, -1.568184, -2.747159, 1, 0.9294118, 0, 1,
-1.029267, 0.8139978, 0.4487588, 1, 0.9372549, 0, 1,
-1.022231, 0.5279248, -0.2403776, 1, 0.9411765, 0, 1,
-1.014291, 0.002456144, -4.305533, 1, 0.9490196, 0, 1,
-1.005637, 1.241929, 0.7859849, 1, 0.9529412, 0, 1,
-1.003302, 1.631897, 1.252785, 1, 0.9607843, 0, 1,
-1.002193, 0.5120612, 0.7998058, 1, 0.9647059, 0, 1,
-0.997798, -2.094079, -0.05024243, 1, 0.972549, 0, 1,
-0.9944898, -0.07373448, -1.302819, 1, 0.9764706, 0, 1,
-0.9913611, 1.313145, -0.01154314, 1, 0.9843137, 0, 1,
-0.9814172, 0.2303915, 0.3143418, 1, 0.9882353, 0, 1,
-0.9810641, 1.346273, -1.213702, 1, 0.9960784, 0, 1,
-0.9806364, 0.3342139, 0.2657761, 0.9960784, 1, 0, 1,
-0.9770656, -0.2928363, -2.018956, 0.9921569, 1, 0, 1,
-0.9761539, -0.1223076, -0.8120157, 0.9843137, 1, 0, 1,
-0.9736271, -1.097893, -1.293946, 0.9803922, 1, 0, 1,
-0.9735354, -1.015941, -2.420154, 0.972549, 1, 0, 1,
-0.9688039, 0.1866708, -1.802917, 0.9686275, 1, 0, 1,
-0.9676945, 2.097187, 0.04052831, 0.9607843, 1, 0, 1,
-0.9642652, 0.5773461, -0.03174599, 0.9568627, 1, 0, 1,
-0.964067, 1.114138, -0.4046696, 0.9490196, 1, 0, 1,
-0.9617255, 0.4479304, -0.3328022, 0.945098, 1, 0, 1,
-0.9551102, 0.03810728, -0.5809323, 0.9372549, 1, 0, 1,
-0.9546224, -0.3229471, -2.129952, 0.9333333, 1, 0, 1,
-0.9499146, -0.4313154, -3.649097, 0.9254902, 1, 0, 1,
-0.9482316, 0.5797026, -0.9791443, 0.9215686, 1, 0, 1,
-0.9451892, -1.259784, -2.042356, 0.9137255, 1, 0, 1,
-0.9436221, -1.326917, -0.1980332, 0.9098039, 1, 0, 1,
-0.9433171, 0.2396945, -1.189043, 0.9019608, 1, 0, 1,
-0.9429153, 1.567515, -1.243295, 0.8941177, 1, 0, 1,
-0.9362471, 0.04669306, -4.009371, 0.8901961, 1, 0, 1,
-0.9318024, -1.380128, -2.972859, 0.8823529, 1, 0, 1,
-0.9317597, 0.2771159, -0.187212, 0.8784314, 1, 0, 1,
-0.931414, 1.268161, -0.8466784, 0.8705882, 1, 0, 1,
-0.928414, 0.6994249, 0.2744741, 0.8666667, 1, 0, 1,
-0.9282681, 0.4139248, -0.7899359, 0.8588235, 1, 0, 1,
-0.9217209, -1.016136, -3.003062, 0.854902, 1, 0, 1,
-0.9201119, 0.1575583, -1.303828, 0.8470588, 1, 0, 1,
-0.910742, -1.031705, -2.063838, 0.8431373, 1, 0, 1,
-0.9075322, 0.04114194, -1.774849, 0.8352941, 1, 0, 1,
-0.9003507, -0.3338262, -2.487321, 0.8313726, 1, 0, 1,
-0.8993047, 0.4170766, -1.699619, 0.8235294, 1, 0, 1,
-0.8882009, 3.039624, -0.5008939, 0.8196079, 1, 0, 1,
-0.8869882, 1.233291, -0.2496594, 0.8117647, 1, 0, 1,
-0.8781325, 0.1204278, -0.3223629, 0.8078431, 1, 0, 1,
-0.8773502, -1.032549, -1.097545, 0.8, 1, 0, 1,
-0.8759155, -0.7631531, -2.740682, 0.7921569, 1, 0, 1,
-0.8754525, -1.352655, -3.326948, 0.7882353, 1, 0, 1,
-0.8715553, -0.4979661, -2.078776, 0.7803922, 1, 0, 1,
-0.8713565, -0.2499216, -2.171969, 0.7764706, 1, 0, 1,
-0.8671923, -0.2561606, -1.457213, 0.7686275, 1, 0, 1,
-0.8663619, 1.382553, -1.638064, 0.7647059, 1, 0, 1,
-0.8560228, -0.8589773, -1.694125, 0.7568628, 1, 0, 1,
-0.8494797, 0.5760556, 0.1601502, 0.7529412, 1, 0, 1,
-0.8400854, -2.209573, -3.297456, 0.7450981, 1, 0, 1,
-0.8388353, -0.9044404, -4.343146, 0.7411765, 1, 0, 1,
-0.8334115, -0.05961554, -0.8012548, 0.7333333, 1, 0, 1,
-0.8209019, -1.011607, -3.398313, 0.7294118, 1, 0, 1,
-0.820564, 0.008830433, -3.730462, 0.7215686, 1, 0, 1,
-0.8199283, 0.5556303, -1.843014, 0.7176471, 1, 0, 1,
-0.8179821, 0.3475572, -2.149541, 0.7098039, 1, 0, 1,
-0.8147515, -0.02307015, -1.973031, 0.7058824, 1, 0, 1,
-0.8115652, -1.081136, -1.383871, 0.6980392, 1, 0, 1,
-0.8084068, 1.438212, 1.409028, 0.6901961, 1, 0, 1,
-0.8059813, 0.3499309, 0.8736413, 0.6862745, 1, 0, 1,
-0.8011948, 2.25897, 0.2213188, 0.6784314, 1, 0, 1,
-0.799975, 0.5029346, 2.498444, 0.6745098, 1, 0, 1,
-0.7999186, 1.11989, -1.701391, 0.6666667, 1, 0, 1,
-0.7976809, -1.245605, -2.535197, 0.6627451, 1, 0, 1,
-0.7972986, 0.350431, -0.4936897, 0.654902, 1, 0, 1,
-0.797128, -1.163235, -2.153731, 0.6509804, 1, 0, 1,
-0.7924206, 1.919532, -0.3003618, 0.6431373, 1, 0, 1,
-0.7912875, 0.0626963, -2.214524, 0.6392157, 1, 0, 1,
-0.7885541, -0.8231292, -3.751309, 0.6313726, 1, 0, 1,
-0.7882054, -1.032952, -2.344429, 0.627451, 1, 0, 1,
-0.7880037, -0.3083026, -3.184858, 0.6196079, 1, 0, 1,
-0.7868782, 1.142051, -0.3059201, 0.6156863, 1, 0, 1,
-0.7859063, 0.5991135, -0.5902655, 0.6078432, 1, 0, 1,
-0.785472, -0.05686382, -1.628171, 0.6039216, 1, 0, 1,
-0.7843319, 0.1433856, -1.138518, 0.5960785, 1, 0, 1,
-0.7842687, 0.09205915, -2.773998, 0.5882353, 1, 0, 1,
-0.7772953, -0.029877, -2.306501, 0.5843138, 1, 0, 1,
-0.7753901, -1.98814, -2.368351, 0.5764706, 1, 0, 1,
-0.7738237, -1.384721, -4.275548, 0.572549, 1, 0, 1,
-0.7701037, 0.2672002, -1.513951, 0.5647059, 1, 0, 1,
-0.7660509, 2.243773, 0.1679371, 0.5607843, 1, 0, 1,
-0.7658672, -0.2966412, -1.176532, 0.5529412, 1, 0, 1,
-0.7619029, 1.545889, 0.5507305, 0.5490196, 1, 0, 1,
-0.7605354, -0.2964195, -1.995231, 0.5411765, 1, 0, 1,
-0.7603784, -0.4014077, -0.2220252, 0.5372549, 1, 0, 1,
-0.7597108, 0.2974438, -0.09577026, 0.5294118, 1, 0, 1,
-0.758929, -1.392965, -3.208602, 0.5254902, 1, 0, 1,
-0.7552668, -1.14581, -4.339281, 0.5176471, 1, 0, 1,
-0.7509475, -0.9793956, -2.69603, 0.5137255, 1, 0, 1,
-0.7415659, 1.610053, 0.2183513, 0.5058824, 1, 0, 1,
-0.7396807, -0.01595956, -2.527856, 0.5019608, 1, 0, 1,
-0.7380835, 0.5115932, -0.776337, 0.4941176, 1, 0, 1,
-0.736711, -1.052853, -3.895379, 0.4862745, 1, 0, 1,
-0.7343874, -0.2104735, -1.875394, 0.4823529, 1, 0, 1,
-0.7343583, -0.1896622, -0.9515501, 0.4745098, 1, 0, 1,
-0.732143, 0.8614335, -0.3948792, 0.4705882, 1, 0, 1,
-0.7297298, 0.02910769, -1.914652, 0.4627451, 1, 0, 1,
-0.7265565, 0.5276253, 0.5557383, 0.4588235, 1, 0, 1,
-0.7226747, -1.032088, -2.390659, 0.4509804, 1, 0, 1,
-0.7162132, 0.6681887, 1.133898, 0.4470588, 1, 0, 1,
-0.7157212, -0.2395812, -3.164108, 0.4392157, 1, 0, 1,
-0.7150559, 0.1806359, -0.04066368, 0.4352941, 1, 0, 1,
-0.7130247, 0.3934747, -3.092924, 0.427451, 1, 0, 1,
-0.7077588, -1.043712, -2.737262, 0.4235294, 1, 0, 1,
-0.7052675, -0.01308876, -1.110597, 0.4156863, 1, 0, 1,
-0.7028838, 1.217954, -0.4403352, 0.4117647, 1, 0, 1,
-0.7024097, -0.4577722, -0.5937508, 0.4039216, 1, 0, 1,
-0.69963, -0.1955525, -2.431142, 0.3960784, 1, 0, 1,
-0.692477, -0.3769976, -1.69131, 0.3921569, 1, 0, 1,
-0.6849698, 0.311461, -0.9970759, 0.3843137, 1, 0, 1,
-0.6846001, 0.2654316, -2.253557, 0.3803922, 1, 0, 1,
-0.6834773, -0.1026173, -1.257246, 0.372549, 1, 0, 1,
-0.6815584, -1.115978, -1.724776, 0.3686275, 1, 0, 1,
-0.6806929, -2.365392, -2.70409, 0.3607843, 1, 0, 1,
-0.6740847, -0.857773, -3.65333, 0.3568628, 1, 0, 1,
-0.6626394, 0.4078305, -0.6539923, 0.3490196, 1, 0, 1,
-0.6572057, 1.351336, 1.001841, 0.345098, 1, 0, 1,
-0.6470446, -0.5434151, -4.040058, 0.3372549, 1, 0, 1,
-0.6361727, 1.33927, 0.1948306, 0.3333333, 1, 0, 1,
-0.63604, -0.2212206, -0.6361409, 0.3254902, 1, 0, 1,
-0.6353475, -1.513328, -2.008985, 0.3215686, 1, 0, 1,
-0.6350887, -0.2388803, -3.056941, 0.3137255, 1, 0, 1,
-0.6229381, -1.451779, -5.302549, 0.3098039, 1, 0, 1,
-0.6138349, 0.4110015, -2.098605, 0.3019608, 1, 0, 1,
-0.6135007, -0.5750808, -1.149731, 0.2941177, 1, 0, 1,
-0.6123507, -1.986252, -2.689088, 0.2901961, 1, 0, 1,
-0.6109682, 0.6923674, -0.8121505, 0.282353, 1, 0, 1,
-0.6088683, 1.387165, -0.9590484, 0.2784314, 1, 0, 1,
-0.6076795, 0.4411159, -1.257082, 0.2705882, 1, 0, 1,
-0.6039454, 0.09575572, -2.130682, 0.2666667, 1, 0, 1,
-0.6037003, 1.454465, 0.4373341, 0.2588235, 1, 0, 1,
-0.603474, 0.2788998, -0.3194724, 0.254902, 1, 0, 1,
-0.5878693, 0.1632882, -0.4797863, 0.2470588, 1, 0, 1,
-0.5826444, 0.3423918, -1.523414, 0.2431373, 1, 0, 1,
-0.5799869, -1.261858, -2.701665, 0.2352941, 1, 0, 1,
-0.5790147, -0.3677921, -2.708876, 0.2313726, 1, 0, 1,
-0.5779924, -1.708476, -2.273026, 0.2235294, 1, 0, 1,
-0.5759366, -0.09438229, -2.132896, 0.2196078, 1, 0, 1,
-0.5745862, 0.4024764, -0.2979412, 0.2117647, 1, 0, 1,
-0.5671743, -0.5872902, -2.19756, 0.2078431, 1, 0, 1,
-0.5649658, 0.1102021, -3.145909, 0.2, 1, 0, 1,
-0.561258, -1.671696, -4.930107, 0.1921569, 1, 0, 1,
-0.5594143, 0.1168365, -2.310738, 0.1882353, 1, 0, 1,
-0.5574191, 0.2744833, -1.97843, 0.1803922, 1, 0, 1,
-0.55514, 0.1439545, -2.479287, 0.1764706, 1, 0, 1,
-0.553069, 0.5449497, 0.9074222, 0.1686275, 1, 0, 1,
-0.5488233, 0.2624483, 0.6948057, 0.1647059, 1, 0, 1,
-0.546948, -1.761222, -5.220584, 0.1568628, 1, 0, 1,
-0.5424888, -0.3219254, -2.620733, 0.1529412, 1, 0, 1,
-0.542078, -0.3806637, -2.586995, 0.145098, 1, 0, 1,
-0.5405394, -1.875858, -2.241999, 0.1411765, 1, 0, 1,
-0.540473, 0.1954488, -1.90986, 0.1333333, 1, 0, 1,
-0.5396491, -0.1848217, -1.060039, 0.1294118, 1, 0, 1,
-0.5347769, -1.286114, -2.925462, 0.1215686, 1, 0, 1,
-0.5344319, -0.2800533, -0.4072132, 0.1176471, 1, 0, 1,
-0.5336971, -0.7876835, -2.416387, 0.1098039, 1, 0, 1,
-0.5334907, -1.293262, -1.94678, 0.1058824, 1, 0, 1,
-0.5331941, -0.3275431, -3.41749, 0.09803922, 1, 0, 1,
-0.5320929, 0.9081329, -0.6913698, 0.09019608, 1, 0, 1,
-0.5310748, -0.4723109, -2.115062, 0.08627451, 1, 0, 1,
-0.5293347, -0.2725505, -2.50773, 0.07843138, 1, 0, 1,
-0.5286813, 0.9304509, 0.2130591, 0.07450981, 1, 0, 1,
-0.527176, 0.02251133, -3.133007, 0.06666667, 1, 0, 1,
-0.5165785, -0.1016388, -2.835773, 0.0627451, 1, 0, 1,
-0.5164583, -1.117052, 0.04139676, 0.05490196, 1, 0, 1,
-0.5137168, -0.5511089, -1.405334, 0.05098039, 1, 0, 1,
-0.5116929, 0.04931376, -2.835718, 0.04313726, 1, 0, 1,
-0.505977, 1.702721, -0.5467097, 0.03921569, 1, 0, 1,
-0.5007946, 0.2703811, -0.8810931, 0.03137255, 1, 0, 1,
-0.4997227, 0.549216, 0.2498422, 0.02745098, 1, 0, 1,
-0.4921044, 1.167742, -0.8077486, 0.01960784, 1, 0, 1,
-0.4919795, -1.663153, -3.601379, 0.01568628, 1, 0, 1,
-0.4838237, 0.8301717, 0.05808636, 0.007843138, 1, 0, 1,
-0.4750883, -0.09427845, -1.123442, 0.003921569, 1, 0, 1,
-0.4712256, -0.01985846, -2.094806, 0, 1, 0.003921569, 1,
-0.4664287, -0.753759, -1.457083, 0, 1, 0.01176471, 1,
-0.4642802, 0.3453912, -0.5653723, 0, 1, 0.01568628, 1,
-0.4637684, -0.3029003, -2.529115, 0, 1, 0.02352941, 1,
-0.4611312, 0.4508247, -0.4344955, 0, 1, 0.02745098, 1,
-0.4567534, -0.6122947, -2.161084, 0, 1, 0.03529412, 1,
-0.4561815, -0.4435052, -1.609635, 0, 1, 0.03921569, 1,
-0.4551037, 0.2571989, 1.31903, 0, 1, 0.04705882, 1,
-0.4546101, -1.632276, -2.552779, 0, 1, 0.05098039, 1,
-0.454301, 0.1495066, -2.069163, 0, 1, 0.05882353, 1,
-0.4538502, 0.4845249, 0.8708873, 0, 1, 0.0627451, 1,
-0.4432553, 0.3248245, -1.709844, 0, 1, 0.07058824, 1,
-0.4347643, -0.1223089, -2.240919, 0, 1, 0.07450981, 1,
-0.4314558, 0.8310218, 1.458494, 0, 1, 0.08235294, 1,
-0.4306862, -2.157891, -3.032277, 0, 1, 0.08627451, 1,
-0.4293066, 0.895128, -1.720291, 0, 1, 0.09411765, 1,
-0.4292286, 0.5894648, -0.5870741, 0, 1, 0.1019608, 1,
-0.4234017, 0.5613199, 0.8681945, 0, 1, 0.1058824, 1,
-0.4191398, -0.1949097, -1.561244, 0, 1, 0.1137255, 1,
-0.4182926, 0.2946581, 0.545203, 0, 1, 0.1176471, 1,
-0.4156023, -0.423242, -2.823162, 0, 1, 0.1254902, 1,
-0.4147311, -0.391375, -4.577191, 0, 1, 0.1294118, 1,
-0.4118243, 0.5759203, -0.1235655, 0, 1, 0.1372549, 1,
-0.4107456, 0.1940778, -2.5226, 0, 1, 0.1411765, 1,
-0.4064439, -1.210233, -2.012777, 0, 1, 0.1490196, 1,
-0.4048741, -0.5857307, -3.89345, 0, 1, 0.1529412, 1,
-0.4002263, 0.1256858, -0.7416527, 0, 1, 0.1607843, 1,
-0.3965037, 1.23846, -1.100274, 0, 1, 0.1647059, 1,
-0.3885575, -0.03260555, 0.5519863, 0, 1, 0.172549, 1,
-0.3786935, -0.09247427, -1.341149, 0, 1, 0.1764706, 1,
-0.3750206, -0.6403992, -2.648041, 0, 1, 0.1843137, 1,
-0.3737989, -1.062981, -1.84855, 0, 1, 0.1882353, 1,
-0.3734509, -1.767813, -0.985926, 0, 1, 0.1960784, 1,
-0.3728084, 0.4823746, 0.7659788, 0, 1, 0.2039216, 1,
-0.3651387, -2.13074, -2.609412, 0, 1, 0.2078431, 1,
-0.3647074, -0.1277332, -1.162038, 0, 1, 0.2156863, 1,
-0.3630169, -0.03478364, -2.635929, 0, 1, 0.2196078, 1,
-0.3610787, -0.5322284, -3.181671, 0, 1, 0.227451, 1,
-0.3599457, 0.2461532, -2.919992, 0, 1, 0.2313726, 1,
-0.3577685, 0.2577214, -0.2105801, 0, 1, 0.2392157, 1,
-0.3560935, -0.4313843, -2.865033, 0, 1, 0.2431373, 1,
-0.3551017, 1.00955, 0.4350923, 0, 1, 0.2509804, 1,
-0.3533854, -2.179537, -3.28314, 0, 1, 0.254902, 1,
-0.3510621, -1.488202, -3.693109, 0, 1, 0.2627451, 1,
-0.3415631, 0.8288337, -0.6099887, 0, 1, 0.2666667, 1,
-0.3329761, -1.23242, -3.333249, 0, 1, 0.2745098, 1,
-0.330171, -0.2459123, -1.531999, 0, 1, 0.2784314, 1,
-0.3255811, -1.284802, -4.946238, 0, 1, 0.2862745, 1,
-0.3231374, 0.6925164, -0.4138447, 0, 1, 0.2901961, 1,
-0.3223596, -0.9127612, -4.392932, 0, 1, 0.2980392, 1,
-0.3180574, 1.614505, -0.09160598, 0, 1, 0.3058824, 1,
-0.315234, 1.407009, 1.912574, 0, 1, 0.3098039, 1,
-0.3118577, 1.093354, -0.05441216, 0, 1, 0.3176471, 1,
-0.3061016, 0.06844702, -1.120939, 0, 1, 0.3215686, 1,
-0.3031635, -1.04178, -3.406589, 0, 1, 0.3294118, 1,
-0.3023698, 1.399107, -0.9155982, 0, 1, 0.3333333, 1,
-0.3021443, -0.1292359, -0.4798313, 0, 1, 0.3411765, 1,
-0.3019258, 0.1882311, -2.768378, 0, 1, 0.345098, 1,
-0.2910111, -1.706019, -2.51123, 0, 1, 0.3529412, 1,
-0.2892823, 1.143398, 0.6285659, 0, 1, 0.3568628, 1,
-0.2892339, -1.258402, -2.52175, 0, 1, 0.3647059, 1,
-0.2889297, -2.075211, -3.223253, 0, 1, 0.3686275, 1,
-0.2880513, 1.348333, 0.09295212, 0, 1, 0.3764706, 1,
-0.2872934, -1.273158, -3.398028, 0, 1, 0.3803922, 1,
-0.286397, -0.2374063, -2.773119, 0, 1, 0.3882353, 1,
-0.2809799, 0.01385367, -0.05907787, 0, 1, 0.3921569, 1,
-0.2762176, 0.6732543, -0.3779532, 0, 1, 0.4, 1,
-0.2740027, -0.5603642, -2.17277, 0, 1, 0.4078431, 1,
-0.2724813, -0.5593439, -2.416717, 0, 1, 0.4117647, 1,
-0.2723718, 1.046715, 0.940428, 0, 1, 0.4196078, 1,
-0.2719294, -0.4811551, -2.866288, 0, 1, 0.4235294, 1,
-0.2717922, 0.7164909, -0.1930241, 0, 1, 0.4313726, 1,
-0.2702146, 0.4386675, 0.6799002, 0, 1, 0.4352941, 1,
-0.2690831, -0.693646, -3.217458, 0, 1, 0.4431373, 1,
-0.26794, -0.9179625, -1.66378, 0, 1, 0.4470588, 1,
-0.2671719, -0.9600235, -3.887768, 0, 1, 0.454902, 1,
-0.2651073, 0.6794115, -2.184143, 0, 1, 0.4588235, 1,
-0.2639736, -0.2628908, -1.262078, 0, 1, 0.4666667, 1,
-0.260727, -2.421605, -3.363957, 0, 1, 0.4705882, 1,
-0.2599908, 0.4351563, -0.4899468, 0, 1, 0.4784314, 1,
-0.2546853, -0.0278649, -1.511655, 0, 1, 0.4823529, 1,
-0.2544344, -0.6246617, -1.453902, 0, 1, 0.4901961, 1,
-0.2519092, -1.749508, -4.379584, 0, 1, 0.4941176, 1,
-0.2500326, -0.09478847, -0.8440408, 0, 1, 0.5019608, 1,
-0.2391671, -0.1381833, -4.208918, 0, 1, 0.509804, 1,
-0.2390277, -0.4868733, -3.953968, 0, 1, 0.5137255, 1,
-0.2371508, -1.159595, -3.19405, 0, 1, 0.5215687, 1,
-0.2366488, -0.4235855, -2.484128, 0, 1, 0.5254902, 1,
-0.2336595, -0.5421168, -2.972239, 0, 1, 0.5333334, 1,
-0.2312661, 0.1717925, -1.734491, 0, 1, 0.5372549, 1,
-0.2300854, 2.226113, 0.5558996, 0, 1, 0.5450981, 1,
-0.2284854, 0.313105, -0.4140486, 0, 1, 0.5490196, 1,
-0.2214963, 0.3785219, -0.3774077, 0, 1, 0.5568628, 1,
-0.2209183, -1.214003, -2.845698, 0, 1, 0.5607843, 1,
-0.220912, -1.00027, -2.198883, 0, 1, 0.5686275, 1,
-0.2199576, 0.6830584, -0.9436164, 0, 1, 0.572549, 1,
-0.2179083, -0.09282766, -1.57727, 0, 1, 0.5803922, 1,
-0.2178502, 1.229301, 0.4038461, 0, 1, 0.5843138, 1,
-0.2176054, 1.475147, -0.4647323, 0, 1, 0.5921569, 1,
-0.2168252, -0.5705872, -4.147038, 0, 1, 0.5960785, 1,
-0.2162593, -1.270669, -2.431599, 0, 1, 0.6039216, 1,
-0.2153236, 2.288932, 0.5086592, 0, 1, 0.6117647, 1,
-0.2103742, 0.8321611, -0.7114566, 0, 1, 0.6156863, 1,
-0.2060425, 0.5962403, 0.2053925, 0, 1, 0.6235294, 1,
-0.2048803, -1.122879, -2.983454, 0, 1, 0.627451, 1,
-0.2020992, -2.81193, -2.897155, 0, 1, 0.6352941, 1,
-0.2007125, 0.6749493, -0.4697719, 0, 1, 0.6392157, 1,
-0.1984988, 2.113441, 0.2793073, 0, 1, 0.6470588, 1,
-0.1975503, -1.070617, -2.330662, 0, 1, 0.6509804, 1,
-0.1970745, 0.2042357, -0.4779803, 0, 1, 0.6588235, 1,
-0.1903818, -0.4185299, -0.9520917, 0, 1, 0.6627451, 1,
-0.1902853, -1.580086, -1.826694, 0, 1, 0.6705883, 1,
-0.1867289, -0.6195785, -2.335889, 0, 1, 0.6745098, 1,
-0.1842398, -0.8399982, -1.604972, 0, 1, 0.682353, 1,
-0.1828988, 0.8142229, 2.244171, 0, 1, 0.6862745, 1,
-0.182656, -0.59231, -3.547784, 0, 1, 0.6941177, 1,
-0.1783722, 1.002004, 0.5743313, 0, 1, 0.7019608, 1,
-0.1783219, 0.9733413, -0.09408104, 0, 1, 0.7058824, 1,
-0.1777113, 0.9244779, 0.3921057, 0, 1, 0.7137255, 1,
-0.1768745, -0.8423194, -2.009953, 0, 1, 0.7176471, 1,
-0.1763657, -0.8132376, -2.254474, 0, 1, 0.7254902, 1,
-0.1760637, -2.375139, -4.179291, 0, 1, 0.7294118, 1,
-0.1758468, 0.6538118, -0.6219723, 0, 1, 0.7372549, 1,
-0.1701934, 1.130065, 0.8037296, 0, 1, 0.7411765, 1,
-0.1587998, 1.331651, -1.471927, 0, 1, 0.7490196, 1,
-0.1545678, -0.4282228, -3.187895, 0, 1, 0.7529412, 1,
-0.1523991, 1.189214, -1.906694, 0, 1, 0.7607843, 1,
-0.1432918, -0.6425197, -1.417671, 0, 1, 0.7647059, 1,
-0.142892, -1.348138, -0.6210331, 0, 1, 0.772549, 1,
-0.1414119, 0.4831517, 0.2764034, 0, 1, 0.7764706, 1,
-0.1407021, -0.1269495, -1.695425, 0, 1, 0.7843137, 1,
-0.1402951, 0.1714817, -2.081159, 0, 1, 0.7882353, 1,
-0.1401805, 0.6108891, -2.046489, 0, 1, 0.7960784, 1,
-0.1396696, 0.3183184, 0.4410894, 0, 1, 0.8039216, 1,
-0.138141, -1.505978, -2.144847, 0, 1, 0.8078431, 1,
-0.1377788, 0.9793723, 0.2079316, 0, 1, 0.8156863, 1,
-0.1369197, 1.468504, 0.5157643, 0, 1, 0.8196079, 1,
-0.1354264, -0.4896525, -3.281058, 0, 1, 0.827451, 1,
-0.1346438, -2.149822, -4.146921, 0, 1, 0.8313726, 1,
-0.1291743, -1.856507, -3.125357, 0, 1, 0.8392157, 1,
-0.1249955, 0.6619988, 0.2695774, 0, 1, 0.8431373, 1,
-0.1249031, 1.042818, 1.614745, 0, 1, 0.8509804, 1,
-0.1237976, 1.587187, -0.06130034, 0, 1, 0.854902, 1,
-0.1233981, 0.3209, 0.096949, 0, 1, 0.8627451, 1,
-0.1193549, 1.284162, -0.6591151, 0, 1, 0.8666667, 1,
-0.1170699, -0.8586533, -2.302444, 0, 1, 0.8745098, 1,
-0.1106612, 0.2815657, 0.5328007, 0, 1, 0.8784314, 1,
-0.1091923, -0.5833958, 0.8981796, 0, 1, 0.8862745, 1,
-0.1072895, 0.009622277, -1.49397, 0, 1, 0.8901961, 1,
-0.09897766, 0.3712471, -0.8432791, 0, 1, 0.8980392, 1,
-0.09552682, -1.074418, -2.904056, 0, 1, 0.9058824, 1,
-0.09203834, -1.651239, -2.995097, 0, 1, 0.9098039, 1,
-0.09002028, -0.6366214, -3.57744, 0, 1, 0.9176471, 1,
-0.08598494, -0.6214134, -4.017818, 0, 1, 0.9215686, 1,
-0.08258618, 0.1459799, 0.8681781, 0, 1, 0.9294118, 1,
-0.08197989, -0.4004299, -1.986659, 0, 1, 0.9333333, 1,
-0.08070148, 0.004477556, -1.031432, 0, 1, 0.9411765, 1,
-0.08038359, 1.20357, 0.1325148, 0, 1, 0.945098, 1,
-0.07516551, 1.4087, 1.825923, 0, 1, 0.9529412, 1,
-0.07467654, -1.561855, -3.992961, 0, 1, 0.9568627, 1,
-0.07005521, -0.5187373, -3.375212, 0, 1, 0.9647059, 1,
-0.06349327, 2.007368, -0.9009567, 0, 1, 0.9686275, 1,
-0.06163195, 0.7627694, 0.3282444, 0, 1, 0.9764706, 1,
-0.05780923, -1.218933, -2.287101, 0, 1, 0.9803922, 1,
-0.05313988, -0.3050563, -3.622816, 0, 1, 0.9882353, 1,
-0.05307771, 0.9330044, -0.200673, 0, 1, 0.9921569, 1,
-0.05166034, 2.540165, -0.7129905, 0, 1, 1, 1,
-0.04827862, -0.1047748, -3.079016, 0, 0.9921569, 1, 1,
-0.04516311, 0.979759, 1.231725, 0, 0.9882353, 1, 1,
-0.04092851, 1.056626, -0.1535529, 0, 0.9803922, 1, 1,
-0.040263, 0.8836888, 1.118231, 0, 0.9764706, 1, 1,
-0.03927103, -0.8471132, -2.98113, 0, 0.9686275, 1, 1,
-0.03529725, 1.236484, -1.118411, 0, 0.9647059, 1, 1,
-0.03346124, 1.243588, -0.4965396, 0, 0.9568627, 1, 1,
-0.03233106, -0.4321029, -2.132281, 0, 0.9529412, 1, 1,
-0.03119646, 1.202086, 1.177484, 0, 0.945098, 1, 1,
-0.02743927, -0.7336745, -2.583247, 0, 0.9411765, 1, 1,
-0.02689246, -1.017325, -3.698048, 0, 0.9333333, 1, 1,
-0.02677176, -1.183309, -4.011617, 0, 0.9294118, 1, 1,
-0.02346948, -1.629164, -1.334864, 0, 0.9215686, 1, 1,
-0.01922182, -0.1981626, -4.067842, 0, 0.9176471, 1, 1,
-0.01911911, 1.706721, 1.046439, 0, 0.9098039, 1, 1,
-0.01519914, -0.8272542, -4.034827, 0, 0.9058824, 1, 1,
-0.01343501, -0.2555677, -3.448921, 0, 0.8980392, 1, 1,
-0.01200657, 0.814127, 0.1477137, 0, 0.8901961, 1, 1,
-0.01059846, -0.328835, -2.319496, 0, 0.8862745, 1, 1,
-0.006436782, -0.4633997, -2.707262, 0, 0.8784314, 1, 1,
-0.005716961, 0.05790503, 0.3711698, 0, 0.8745098, 1, 1,
-0.005539807, 0.1301012, 0.3292348, 0, 0.8666667, 1, 1,
-0.004890504, 1.056259, -0.508508, 0, 0.8627451, 1, 1,
-0.004189396, -0.4694513, -3.987905, 0, 0.854902, 1, 1,
-0.003378757, 0.6766366, 1.202312, 0, 0.8509804, 1, 1,
-0.002930368, 1.000234, -0.3880354, 0, 0.8431373, 1, 1,
-0.001241543, 1.61463, 0.7929823, 0, 0.8392157, 1, 1,
0.001718151, 1.022076, -1.184081, 0, 0.8313726, 1, 1,
0.004046251, 0.4083113, -1.452835, 0, 0.827451, 1, 1,
0.005414159, 0.8996225, -1.108221, 0, 0.8196079, 1, 1,
0.00678414, 2.756728, 0.01440344, 0, 0.8156863, 1, 1,
0.01560149, -0.06042695, 3.980065, 0, 0.8078431, 1, 1,
0.01902308, 2.943195, 0.567242, 0, 0.8039216, 1, 1,
0.02067792, 0.1912161, -0.2831646, 0, 0.7960784, 1, 1,
0.02590727, -0.04722881, 0.937014, 0, 0.7882353, 1, 1,
0.02761263, -0.04183952, 2.089652, 0, 0.7843137, 1, 1,
0.02797494, -0.5461878, 4.456039, 0, 0.7764706, 1, 1,
0.03787747, 0.08453567, 0.6791297, 0, 0.772549, 1, 1,
0.03887283, 0.5724506, -0.124502, 0, 0.7647059, 1, 1,
0.04253204, 0.4806367, -0.1639534, 0, 0.7607843, 1, 1,
0.04506559, 1.116052, -0.3922155, 0, 0.7529412, 1, 1,
0.04749426, 0.4086801, -0.1192164, 0, 0.7490196, 1, 1,
0.0526781, -0.7274784, 2.654529, 0, 0.7411765, 1, 1,
0.05570923, -0.2892895, 5.227976, 0, 0.7372549, 1, 1,
0.05832177, -0.2433783, 4.022578, 0, 0.7294118, 1, 1,
0.06217224, -0.6971484, 3.527837, 0, 0.7254902, 1, 1,
0.07345452, -0.3314708, 4.470416, 0, 0.7176471, 1, 1,
0.07505211, 0.2811898, 1.10141, 0, 0.7137255, 1, 1,
0.07707477, -0.1594547, 2.316411, 0, 0.7058824, 1, 1,
0.07803527, 1.192517, 2.085314, 0, 0.6980392, 1, 1,
0.07872332, -1.198474, 2.753088, 0, 0.6941177, 1, 1,
0.07908485, 0.4124429, -0.398187, 0, 0.6862745, 1, 1,
0.07998721, 0.1189094, 2.339714, 0, 0.682353, 1, 1,
0.08058622, 0.5184484, -0.6834913, 0, 0.6745098, 1, 1,
0.08207898, -0.5440858, 4.726978, 0, 0.6705883, 1, 1,
0.08532742, -1.953036, 3.428127, 0, 0.6627451, 1, 1,
0.08598907, 0.6897743, -1.526767, 0, 0.6588235, 1, 1,
0.08817863, 0.3442943, 1.116243, 0, 0.6509804, 1, 1,
0.08960786, -0.09408031, 2.238807, 0, 0.6470588, 1, 1,
0.0897344, -0.7541377, 4.412707, 0, 0.6392157, 1, 1,
0.09073371, 0.8258177, -1.306955, 0, 0.6352941, 1, 1,
0.09278351, -0.4278767, 2.000719, 0, 0.627451, 1, 1,
0.09323522, 1.096953, -0.1879556, 0, 0.6235294, 1, 1,
0.09479317, 0.4082159, 3.17753, 0, 0.6156863, 1, 1,
0.09989134, 0.4045703, -0.5597785, 0, 0.6117647, 1, 1,
0.1026329, 0.2738316, 0.609696, 0, 0.6039216, 1, 1,
0.1040469, -0.3048499, 2.313848, 0, 0.5960785, 1, 1,
0.1063184, -0.1510961, 1.799348, 0, 0.5921569, 1, 1,
0.1089022, -0.2711003, 2.981398, 0, 0.5843138, 1, 1,
0.1120563, -0.08233751, 3.398307, 0, 0.5803922, 1, 1,
0.1130819, -1.000495, 1.620635, 0, 0.572549, 1, 1,
0.1143753, 2.339243, -2.047165, 0, 0.5686275, 1, 1,
0.1163986, 0.8851581, 0.7996112, 0, 0.5607843, 1, 1,
0.1166902, -1.653353, 2.061024, 0, 0.5568628, 1, 1,
0.1167405, 0.6072327, -0.05614372, 0, 0.5490196, 1, 1,
0.1178921, 0.53487, -0.1934124, 0, 0.5450981, 1, 1,
0.1201868, -1.330013, 3.132426, 0, 0.5372549, 1, 1,
0.1211531, 0.7843869, 0.3377884, 0, 0.5333334, 1, 1,
0.1263942, 1.807777, 1.025587, 0, 0.5254902, 1, 1,
0.1275428, -0.9139333, 2.462112, 0, 0.5215687, 1, 1,
0.1332753, -0.6979679, 2.578461, 0, 0.5137255, 1, 1,
0.1347332, -0.9770162, 1.690228, 0, 0.509804, 1, 1,
0.1355239, 0.5315984, -0.1313092, 0, 0.5019608, 1, 1,
0.1359535, 0.8707915, 0.1404088, 0, 0.4941176, 1, 1,
0.1397906, 1.449283, -2.282613, 0, 0.4901961, 1, 1,
0.14035, 0.8235753, 1.815708, 0, 0.4823529, 1, 1,
0.1459393, 2.037418, 1.94858, 0, 0.4784314, 1, 1,
0.1499517, -1.112223, 3.044366, 0, 0.4705882, 1, 1,
0.1499881, 0.2443254, 0.1179092, 0, 0.4666667, 1, 1,
0.1522335, 0.6687509, 1.440807, 0, 0.4588235, 1, 1,
0.1604774, -1.380539, 2.71649, 0, 0.454902, 1, 1,
0.163465, -1.099668, 0.3885476, 0, 0.4470588, 1, 1,
0.163987, 1.586798, 0.007008409, 0, 0.4431373, 1, 1,
0.1644075, 0.7053078, -1.707544, 0, 0.4352941, 1, 1,
0.1655685, -0.5712803, 1.585341, 0, 0.4313726, 1, 1,
0.1690942, -0.2140847, 3.270586, 0, 0.4235294, 1, 1,
0.1703988, 1.226098, 0.5651069, 0, 0.4196078, 1, 1,
0.1705347, 0.3004192, -0.2605749, 0, 0.4117647, 1, 1,
0.1770777, 1.217556, 1.001017, 0, 0.4078431, 1, 1,
0.1780845, -0.6284211, 2.348197, 0, 0.4, 1, 1,
0.182365, -0.7297958, 4.036077, 0, 0.3921569, 1, 1,
0.1825387, -0.9578581, 4.566289, 0, 0.3882353, 1, 1,
0.1842461, -0.956364, 4.477858, 0, 0.3803922, 1, 1,
0.1882361, 1.321108, 0.5828481, 0, 0.3764706, 1, 1,
0.1913793, 1.80078, -0.8793743, 0, 0.3686275, 1, 1,
0.1922098, -0.6703293, 2.354312, 0, 0.3647059, 1, 1,
0.1936825, -0.9307213, 2.196358, 0, 0.3568628, 1, 1,
0.1937196, -1.24041, 4.301892, 0, 0.3529412, 1, 1,
0.1945818, 0.4097125, 0.5020992, 0, 0.345098, 1, 1,
0.2038317, 0.3972625, 0.8826933, 0, 0.3411765, 1, 1,
0.20471, -0.1579659, 2.239796, 0, 0.3333333, 1, 1,
0.20478, -1.073564, 3.690603, 0, 0.3294118, 1, 1,
0.2050768, -0.8090244, 1.877522, 0, 0.3215686, 1, 1,
0.2152621, -0.1655681, 3.795134, 0, 0.3176471, 1, 1,
0.2156577, -0.1693797, 2.339242, 0, 0.3098039, 1, 1,
0.2165596, -1.320215, 2.01831, 0, 0.3058824, 1, 1,
0.2211933, 0.3979402, 1.386762, 0, 0.2980392, 1, 1,
0.2213533, -0.2284919, 2.994115, 0, 0.2901961, 1, 1,
0.2232528, -0.1469311, 2.29105, 0, 0.2862745, 1, 1,
0.2276221, 0.01552286, 1.149675, 0, 0.2784314, 1, 1,
0.2304761, -0.597913, 1.991502, 0, 0.2745098, 1, 1,
0.2324938, -1.738248, 2.894501, 0, 0.2666667, 1, 1,
0.2338367, -0.778531, 4.519228, 0, 0.2627451, 1, 1,
0.2378868, -0.7901464, 2.073401, 0, 0.254902, 1, 1,
0.2409715, 0.4046638, 1.586474, 0, 0.2509804, 1, 1,
0.2445817, -1.822815, 3.700912, 0, 0.2431373, 1, 1,
0.2470398, 0.8950221, 0.621585, 0, 0.2392157, 1, 1,
0.249891, 2.107433, 0.1295446, 0, 0.2313726, 1, 1,
0.2525168, 0.3374035, 2.949147, 0, 0.227451, 1, 1,
0.2540511, 1.228585, 0.7789825, 0, 0.2196078, 1, 1,
0.2567633, -0.5150035, 1.603472, 0, 0.2156863, 1, 1,
0.2568471, -0.3406711, 2.958026, 0, 0.2078431, 1, 1,
0.2573282, 1.781554, 0.02903579, 0, 0.2039216, 1, 1,
0.2598603, -0.6238417, 2.091033, 0, 0.1960784, 1, 1,
0.2627649, 1.211103, -0.3964602, 0, 0.1882353, 1, 1,
0.2722925, 0.898195, 1.073938, 0, 0.1843137, 1, 1,
0.280263, -1.126333, 1.847217, 0, 0.1764706, 1, 1,
0.2850619, 0.1252033, 0.5919509, 0, 0.172549, 1, 1,
0.2918461, 1.195831, -0.1392846, 0, 0.1647059, 1, 1,
0.2939922, -1.020458, 3.515994, 0, 0.1607843, 1, 1,
0.2950414, -0.4366508, 3.054872, 0, 0.1529412, 1, 1,
0.2958378, -0.2438063, 2.007549, 0, 0.1490196, 1, 1,
0.2967409, 1.319179, 0.4408388, 0, 0.1411765, 1, 1,
0.297406, -0.5398213, 1.980991, 0, 0.1372549, 1, 1,
0.297512, 0.003296273, 1.213166, 0, 0.1294118, 1, 1,
0.2978628, 1.026173, -0.6946828, 0, 0.1254902, 1, 1,
0.2993877, 0.1265103, 0.6278759, 0, 0.1176471, 1, 1,
0.3030124, 0.5596102, 0.5333593, 0, 0.1137255, 1, 1,
0.3046682, -0.3875895, 1.74023, 0, 0.1058824, 1, 1,
0.3114118, 0.966356, 0.7795828, 0, 0.09803922, 1, 1,
0.3128164, 0.622427, 1.430805, 0, 0.09411765, 1, 1,
0.3163067, 0.5760025, 0.2763983, 0, 0.08627451, 1, 1,
0.3181074, -0.3538535, 2.19117, 0, 0.08235294, 1, 1,
0.3219655, 1.661132, 1.805698, 0, 0.07450981, 1, 1,
0.3254515, 0.8456339, -0.9069898, 0, 0.07058824, 1, 1,
0.3307836, 0.455407, 1.379027, 0, 0.0627451, 1, 1,
0.3320892, -0.4743202, 3.349912, 0, 0.05882353, 1, 1,
0.3395759, 0.09060662, 0.6197793, 0, 0.05098039, 1, 1,
0.3400669, 0.4373989, 1.122134, 0, 0.04705882, 1, 1,
0.3401847, 1.199661, 1.199681, 0, 0.03921569, 1, 1,
0.341522, 0.5108544, 0.257518, 0, 0.03529412, 1, 1,
0.3427018, -0.2802514, 1.539011, 0, 0.02745098, 1, 1,
0.3513211, -0.01056374, 1.574972, 0, 0.02352941, 1, 1,
0.3521416, 0.5658129, -0.108538, 0, 0.01568628, 1, 1,
0.3594266, 0.3561499, 0.5754824, 0, 0.01176471, 1, 1,
0.3605548, -0.1413653, 1.681647, 0, 0.003921569, 1, 1,
0.3609069, 0.4945747, 0.8267843, 0.003921569, 0, 1, 1,
0.3613789, -1.3257, 3.713234, 0.007843138, 0, 1, 1,
0.3700715, 0.4133516, 0.2886381, 0.01568628, 0, 1, 1,
0.3707488, -0.8271873, 3.650722, 0.01960784, 0, 1, 1,
0.373234, 0.242114, 0.6520743, 0.02745098, 0, 1, 1,
0.3821923, 0.7171443, 1.587127, 0.03137255, 0, 1, 1,
0.3844252, 0.120469, 0.7990816, 0.03921569, 0, 1, 1,
0.389049, 0.1227353, 3.530989, 0.04313726, 0, 1, 1,
0.4005143, 0.0816838, 2.559585, 0.05098039, 0, 1, 1,
0.4065144, 0.2645229, 1.633855, 0.05490196, 0, 1, 1,
0.4068435, 0.3030328, 2.239073, 0.0627451, 0, 1, 1,
0.407281, 0.1445836, 1.069414, 0.06666667, 0, 1, 1,
0.4115901, 0.3855726, 1.887227, 0.07450981, 0, 1, 1,
0.414366, 0.602056, 0.3341313, 0.07843138, 0, 1, 1,
0.4184775, -0.09331585, 2.736623, 0.08627451, 0, 1, 1,
0.4187989, 0.4179818, -0.9010996, 0.09019608, 0, 1, 1,
0.4258192, 0.5409474, 0.3235874, 0.09803922, 0, 1, 1,
0.4304162, -0.5817591, 1.933291, 0.1058824, 0, 1, 1,
0.4310217, -0.7579426, 3.282923, 0.1098039, 0, 1, 1,
0.4321301, -0.07851367, 1.150228, 0.1176471, 0, 1, 1,
0.4336555, -0.5459017, 1.814687, 0.1215686, 0, 1, 1,
0.4361199, 1.489426, 1.489255, 0.1294118, 0, 1, 1,
0.4411951, -0.1154801, 2.560907, 0.1333333, 0, 1, 1,
0.4432489, 2.044867, 1.187129, 0.1411765, 0, 1, 1,
0.4459542, -0.3209018, 2.069989, 0.145098, 0, 1, 1,
0.4485511, -0.8478051, 2.015859, 0.1529412, 0, 1, 1,
0.4496623, 1.240936, 0.9163212, 0.1568628, 0, 1, 1,
0.4500754, 1.837372, 1.987956, 0.1647059, 0, 1, 1,
0.4514117, -0.7235849, 3.568577, 0.1686275, 0, 1, 1,
0.4575222, -2.692743, 4.181919, 0.1764706, 0, 1, 1,
0.4631167, 1.094241, 0.2453322, 0.1803922, 0, 1, 1,
0.4633104, 0.4603419, 0.5130859, 0.1882353, 0, 1, 1,
0.4669695, -0.1919089, 0.5486367, 0.1921569, 0, 1, 1,
0.4689423, -0.6899838, 1.804657, 0.2, 0, 1, 1,
0.4696045, -0.9201597, 4.341374, 0.2078431, 0, 1, 1,
0.4699523, 0.160454, 1.74978, 0.2117647, 0, 1, 1,
0.4708509, 0.1595709, 1.675614, 0.2196078, 0, 1, 1,
0.4758698, 0.3339816, 0.4941919, 0.2235294, 0, 1, 1,
0.4774749, 2.461965, 0.8090112, 0.2313726, 0, 1, 1,
0.4814725, -2.489584, 2.367258, 0.2352941, 0, 1, 1,
0.4830109, 1.434202, 1.73594, 0.2431373, 0, 1, 1,
0.4945377, -1.087897, 4.853231, 0.2470588, 0, 1, 1,
0.498167, 0.2412604, 1.336748, 0.254902, 0, 1, 1,
0.5006846, 2.570405, -0.8475734, 0.2588235, 0, 1, 1,
0.5055475, 0.4185885, 0.1120056, 0.2666667, 0, 1, 1,
0.5080046, 1.353564, -0.6583371, 0.2705882, 0, 1, 1,
0.5141672, -0.1259947, 2.319163, 0.2784314, 0, 1, 1,
0.5160441, -0.6055252, 3.049555, 0.282353, 0, 1, 1,
0.5172327, 0.03155137, 0.1249924, 0.2901961, 0, 1, 1,
0.5189043, 0.3831085, 1.704539, 0.2941177, 0, 1, 1,
0.5259238, -0.8679097, 0.6345934, 0.3019608, 0, 1, 1,
0.5336747, -0.08451623, 3.205146, 0.3098039, 0, 1, 1,
0.5352582, 1.328144, -1.120761, 0.3137255, 0, 1, 1,
0.5377058, 0.6335394, -0.6069552, 0.3215686, 0, 1, 1,
0.5400285, -2.248547, 0.9002717, 0.3254902, 0, 1, 1,
0.5442438, 0.4263789, -0.2539337, 0.3333333, 0, 1, 1,
0.5471592, -0.1706128, 1.87109, 0.3372549, 0, 1, 1,
0.5525358, -1.226231, 2.751713, 0.345098, 0, 1, 1,
0.5543241, -0.4714479, 0.8084605, 0.3490196, 0, 1, 1,
0.5544071, -0.7085809, 3.795726, 0.3568628, 0, 1, 1,
0.5568485, 1.211218, 0.7070423, 0.3607843, 0, 1, 1,
0.5618178, 1.244139, -0.01473415, 0.3686275, 0, 1, 1,
0.5619329, -1.001366, 3.554044, 0.372549, 0, 1, 1,
0.5665823, 0.6470322, 0.6843241, 0.3803922, 0, 1, 1,
0.571178, -1.581576, 2.806075, 0.3843137, 0, 1, 1,
0.5724332, -0.1472925, 0.92554, 0.3921569, 0, 1, 1,
0.572575, 0.1826695, 2.303792, 0.3960784, 0, 1, 1,
0.5737822, -0.834737, 3.471258, 0.4039216, 0, 1, 1,
0.5764211, -0.2594429, 1.62614, 0.4117647, 0, 1, 1,
0.5780048, -1.003899, 4.57385, 0.4156863, 0, 1, 1,
0.5806951, -0.0208775, 1.518474, 0.4235294, 0, 1, 1,
0.5826646, 1.004053, 0.9838395, 0.427451, 0, 1, 1,
0.5827897, 1.54238, 0.00113704, 0.4352941, 0, 1, 1,
0.584164, -1.298681, 2.083376, 0.4392157, 0, 1, 1,
0.5922377, -0.8066571, 2.326447, 0.4470588, 0, 1, 1,
0.5939524, 1.096937, 0.8412569, 0.4509804, 0, 1, 1,
0.5952964, -0.8606416, 2.919564, 0.4588235, 0, 1, 1,
0.6004131, 0.5092191, 1.771662, 0.4627451, 0, 1, 1,
0.6018029, 0.689208, -0.2838585, 0.4705882, 0, 1, 1,
0.6030054, 0.5085797, 2.002666, 0.4745098, 0, 1, 1,
0.6062629, 2.221907, 1.132983, 0.4823529, 0, 1, 1,
0.6068341, -0.1740949, 2.472887, 0.4862745, 0, 1, 1,
0.6103725, -1.478076, 3.248062, 0.4941176, 0, 1, 1,
0.610503, 1.047951, 1.311379, 0.5019608, 0, 1, 1,
0.620435, -0.575416, 2.803718, 0.5058824, 0, 1, 1,
0.6213339, 1.499624, -1.129086, 0.5137255, 0, 1, 1,
0.624882, -0.09622005, 1.552394, 0.5176471, 0, 1, 1,
0.6312214, -1.620076, 5.061481, 0.5254902, 0, 1, 1,
0.6336595, 0.6608294, 0.7172398, 0.5294118, 0, 1, 1,
0.6343794, -1.948982, 1.24566, 0.5372549, 0, 1, 1,
0.6364062, 0.09591856, 0.04029123, 0.5411765, 0, 1, 1,
0.6386277, -0.28358, 0.700783, 0.5490196, 0, 1, 1,
0.6388896, -0.3388634, 1.934904, 0.5529412, 0, 1, 1,
0.6414074, -0.1047014, 2.629214, 0.5607843, 0, 1, 1,
0.6423485, -0.2035558, 2.377886, 0.5647059, 0, 1, 1,
0.6478494, 0.5462212, 1.829201, 0.572549, 0, 1, 1,
0.6485861, 0.6661797, 0.8157806, 0.5764706, 0, 1, 1,
0.6493787, 0.07653893, 2.540203, 0.5843138, 0, 1, 1,
0.6500478, 0.2587914, 1.069484, 0.5882353, 0, 1, 1,
0.6653447, 1.149773, 1.044518, 0.5960785, 0, 1, 1,
0.6664287, 0.1788664, 1.196007, 0.6039216, 0, 1, 1,
0.6676977, -0.3792158, 0.9302986, 0.6078432, 0, 1, 1,
0.6697389, -2.233269, 3.905973, 0.6156863, 0, 1, 1,
0.6706441, 0.8436817, 0.02281853, 0.6196079, 0, 1, 1,
0.6724216, -0.6122103, 3.184098, 0.627451, 0, 1, 1,
0.6725069, 0.2916261, -0.2111349, 0.6313726, 0, 1, 1,
0.6742232, -0.1258643, 1.87423, 0.6392157, 0, 1, 1,
0.6750924, -0.2836164, 1.114167, 0.6431373, 0, 1, 1,
0.6819621, 0.476855, 0.3093095, 0.6509804, 0, 1, 1,
0.6821578, -0.2916497, 1.847326, 0.654902, 0, 1, 1,
0.6849945, -0.2233337, 1.028448, 0.6627451, 0, 1, 1,
0.6952988, -0.06819072, 0.2824653, 0.6666667, 0, 1, 1,
0.6963042, -1.219501, 2.689836, 0.6745098, 0, 1, 1,
0.6978057, 1.864926, 1.128713, 0.6784314, 0, 1, 1,
0.7009112, -0.1024547, -0.009650253, 0.6862745, 0, 1, 1,
0.7086812, 0.7028517, 1.687096, 0.6901961, 0, 1, 1,
0.7117632, -0.1007864, 1.081179, 0.6980392, 0, 1, 1,
0.7150054, 0.02584456, 0.8336284, 0.7058824, 0, 1, 1,
0.7302929, 0.34679, 2.152484, 0.7098039, 0, 1, 1,
0.7307953, -0.8071067, 2.394336, 0.7176471, 0, 1, 1,
0.7310663, -1.058071, 2.523244, 0.7215686, 0, 1, 1,
0.7392981, -0.2358949, 2.074082, 0.7294118, 0, 1, 1,
0.7406599, 0.35146, -0.1203426, 0.7333333, 0, 1, 1,
0.7525396, -1.557262, 3.910943, 0.7411765, 0, 1, 1,
0.754481, -0.9419345, 4.702869, 0.7450981, 0, 1, 1,
0.7550187, -0.01092506, 1.267729, 0.7529412, 0, 1, 1,
0.7596263, -1.915808, 0.1036101, 0.7568628, 0, 1, 1,
0.7601622, 0.1162085, 3.069351, 0.7647059, 0, 1, 1,
0.7602412, 0.3329148, 1.780222, 0.7686275, 0, 1, 1,
0.7670781, 0.7852286, 0.2412151, 0.7764706, 0, 1, 1,
0.7674776, -0.3317553, 1.770596, 0.7803922, 0, 1, 1,
0.777894, -0.7600672, 3.889138, 0.7882353, 0, 1, 1,
0.7849025, -0.4653768, 1.876359, 0.7921569, 0, 1, 1,
0.7862648, -0.07233959, 3.632978, 0.8, 0, 1, 1,
0.7895039, 0.5679057, 1.413674, 0.8078431, 0, 1, 1,
0.7904061, 0.6774576, 0.5866172, 0.8117647, 0, 1, 1,
0.7922918, -1.617228, 2.42699, 0.8196079, 0, 1, 1,
0.796329, 0.9146668, 0.4263443, 0.8235294, 0, 1, 1,
0.8055509, 0.6168272, 0.6563755, 0.8313726, 0, 1, 1,
0.8069997, -1.631604, 3.723861, 0.8352941, 0, 1, 1,
0.8115472, 0.2148747, 1.599085, 0.8431373, 0, 1, 1,
0.8125796, -0.9509862, 2.605243, 0.8470588, 0, 1, 1,
0.812986, 0.3388858, 2.42082, 0.854902, 0, 1, 1,
0.8179761, 2.289416, -1.711838, 0.8588235, 0, 1, 1,
0.8253335, 0.1377534, 1.226583, 0.8666667, 0, 1, 1,
0.8309858, -0.3977182, -0.160339, 0.8705882, 0, 1, 1,
0.8354788, 1.982506, 1.759357, 0.8784314, 0, 1, 1,
0.8424881, -1.473178, 3.393458, 0.8823529, 0, 1, 1,
0.8478239, 1.368228, -0.2481085, 0.8901961, 0, 1, 1,
0.8574843, -1.060755, 2.263902, 0.8941177, 0, 1, 1,
0.8582132, 0.02060243, 1.427482, 0.9019608, 0, 1, 1,
0.8653123, 0.223449, 0.4442452, 0.9098039, 0, 1, 1,
0.8656308, 1.13078, 0.626152, 0.9137255, 0, 1, 1,
0.8659583, -2.366741, 0.628261, 0.9215686, 0, 1, 1,
0.8677815, 0.5578911, 1.6196, 0.9254902, 0, 1, 1,
0.8711477, -1.471464, 1.922485, 0.9333333, 0, 1, 1,
0.8907, 0.6358956, 3.21961, 0.9372549, 0, 1, 1,
0.8908141, -0.6558356, 1.888089, 0.945098, 0, 1, 1,
0.8939986, -0.3656696, 0.1482954, 0.9490196, 0, 1, 1,
0.8952708, 1.1802, -0.2681018, 0.9568627, 0, 1, 1,
0.8998949, 0.7368186, 1.982597, 0.9607843, 0, 1, 1,
0.9013071, -0.6295274, 1.181758, 0.9686275, 0, 1, 1,
0.9050695, 0.4679147, 1.621846, 0.972549, 0, 1, 1,
0.9070409, 2.264735, 0.01124693, 0.9803922, 0, 1, 1,
0.9119793, 0.04558885, 1.229985, 0.9843137, 0, 1, 1,
0.9128576, -0.3246357, 2.273602, 0.9921569, 0, 1, 1,
0.921464, -0.7542593, 3.613985, 0.9960784, 0, 1, 1,
0.9314213, 0.04059957, 1.005463, 1, 0, 0.9960784, 1,
0.932341, 0.3820226, 0.8196619, 1, 0, 0.9882353, 1,
0.9364911, -0.1774322, 0.5187046, 1, 0, 0.9843137, 1,
0.9403544, 0.6628504, 2.342099, 1, 0, 0.9764706, 1,
0.942584, 0.9604587, 2.016902, 1, 0, 0.972549, 1,
0.9433923, 0.1776943, 2.438041, 1, 0, 0.9647059, 1,
0.9435176, -0.6435313, 2.848552, 1, 0, 0.9607843, 1,
0.9563498, -1.325776, 2.21833, 1, 0, 0.9529412, 1,
0.9570557, 2.968686, 0.4972739, 1, 0, 0.9490196, 1,
0.9571878, -0.7421166, 2.218541, 1, 0, 0.9411765, 1,
0.9594187, -1.101332, 2.753382, 1, 0, 0.9372549, 1,
0.961319, -0.7669386, 3.139014, 1, 0, 0.9294118, 1,
0.9614546, -1.448205, 0.03695945, 1, 0, 0.9254902, 1,
0.9662179, -0.3026412, 2.190189, 1, 0, 0.9176471, 1,
0.9664133, 0.7045022, 3.395876, 1, 0, 0.9137255, 1,
0.970494, 0.2784774, 2.655501, 1, 0, 0.9058824, 1,
0.9725792, 0.3967138, 1.084761, 1, 0, 0.9019608, 1,
0.9761972, 0.6633943, 0.08199848, 1, 0, 0.8941177, 1,
0.9774839, -0.3858414, 0.1526468, 1, 0, 0.8862745, 1,
0.9792922, -1.003133, 2.047113, 1, 0, 0.8823529, 1,
0.9924006, -0.6271001, 2.629759, 1, 0, 0.8745098, 1,
1.003186, 1.517719, -0.2503244, 1, 0, 0.8705882, 1,
1.011087, -0.6137231, 1.421952, 1, 0, 0.8627451, 1,
1.026905, 0.2144976, 0.5189732, 1, 0, 0.8588235, 1,
1.030643, -1.256349, 2.844839, 1, 0, 0.8509804, 1,
1.032894, -0.5388812, 3.08882, 1, 0, 0.8470588, 1,
1.033477, -0.4486523, 2.566088, 1, 0, 0.8392157, 1,
1.035422, -0.8993646, 2.244166, 1, 0, 0.8352941, 1,
1.042197, 0.7319821, 1.992751, 1, 0, 0.827451, 1,
1.044267, -0.8788737, 1.884515, 1, 0, 0.8235294, 1,
1.044698, -1.478121, 2.34445, 1, 0, 0.8156863, 1,
1.046663, -0.4459925, 0.7297066, 1, 0, 0.8117647, 1,
1.047657, -0.3158169, 2.282447, 1, 0, 0.8039216, 1,
1.068608, -0.5189531, 2.285241, 1, 0, 0.7960784, 1,
1.071746, 1.184623, 2.188925, 1, 0, 0.7921569, 1,
1.075167, -0.02280973, 3.091599, 1, 0, 0.7843137, 1,
1.076985, 0.6319529, -0.7610939, 1, 0, 0.7803922, 1,
1.10766, 2.101499, -0.5126052, 1, 0, 0.772549, 1,
1.109109, 0.1137038, 1.555039, 1, 0, 0.7686275, 1,
1.112881, -1.630729, 0.9442021, 1, 0, 0.7607843, 1,
1.113148, -0.3346, 1.456105, 1, 0, 0.7568628, 1,
1.118198, -1.020288, 1.876585, 1, 0, 0.7490196, 1,
1.121505, 1.768272, 0.8773324, 1, 0, 0.7450981, 1,
1.121532, -0.75179, 3.694585, 1, 0, 0.7372549, 1,
1.124207, 1.19178, 0.4609205, 1, 0, 0.7333333, 1,
1.124822, 0.1116698, 2.530007, 1, 0, 0.7254902, 1,
1.127115, -1.19588, 1.835027, 1, 0, 0.7215686, 1,
1.131476, -1.960042, 2.103248, 1, 0, 0.7137255, 1,
1.134138, 1.075592, 2.42837, 1, 0, 0.7098039, 1,
1.135488, 1.42827, 0.3596239, 1, 0, 0.7019608, 1,
1.138257, -0.6204201, 3.276667, 1, 0, 0.6941177, 1,
1.14112, -0.1376099, 2.655457, 1, 0, 0.6901961, 1,
1.142918, 0.1312907, 1.460789, 1, 0, 0.682353, 1,
1.14293, 0.3844099, 1.864563, 1, 0, 0.6784314, 1,
1.143289, 0.4128309, 0.9003062, 1, 0, 0.6705883, 1,
1.147716, 0.7971414, 0.003759593, 1, 0, 0.6666667, 1,
1.148814, 0.06136296, 1.442197, 1, 0, 0.6588235, 1,
1.149614, 0.5972083, 1.728346, 1, 0, 0.654902, 1,
1.153936, 0.174215, 1.992436, 1, 0, 0.6470588, 1,
1.154697, 0.2461997, 1.281118, 1, 0, 0.6431373, 1,
1.162083, 0.2727446, 2.009319, 1, 0, 0.6352941, 1,
1.164553, 0.7287979, -0.5584244, 1, 0, 0.6313726, 1,
1.170206, -0.07207718, 2.02517, 1, 0, 0.6235294, 1,
1.177891, -0.106392, -0.3523378, 1, 0, 0.6196079, 1,
1.178028, 1.429288, 1.427915, 1, 0, 0.6117647, 1,
1.179599, 1.523392, 0.6375669, 1, 0, 0.6078432, 1,
1.183265, -0.2332399, 1.649426, 1, 0, 0.6, 1,
1.201711, -0.1736656, 3.510473, 1, 0, 0.5921569, 1,
1.211295, -1.261011, 2.218056, 1, 0, 0.5882353, 1,
1.242051, 0.8653446, 1.054722, 1, 0, 0.5803922, 1,
1.243487, 1.690432, 0.5293126, 1, 0, 0.5764706, 1,
1.246111, 1.5099, 1.083473, 1, 0, 0.5686275, 1,
1.247381, -1.569228, 3.600826, 1, 0, 0.5647059, 1,
1.247668, 0.3854607, 2.244607, 1, 0, 0.5568628, 1,
1.249488, -0.4538527, 2.417113, 1, 0, 0.5529412, 1,
1.256533, 0.149551, 1.013651, 1, 0, 0.5450981, 1,
1.257632, -0.225858, 2.148596, 1, 0, 0.5411765, 1,
1.257972, -0.2193743, 1.201253, 1, 0, 0.5333334, 1,
1.288493, -0.5148333, 2.799856, 1, 0, 0.5294118, 1,
1.302477, 0.8061883, 3.078449, 1, 0, 0.5215687, 1,
1.303567, 1.380075, 2.119766, 1, 0, 0.5176471, 1,
1.319489, 2.098641, -0.1231389, 1, 0, 0.509804, 1,
1.336934, 0.6901634, 0.752107, 1, 0, 0.5058824, 1,
1.344334, -0.2777865, 0.7327794, 1, 0, 0.4980392, 1,
1.346354, -0.02522846, -1.024076, 1, 0, 0.4901961, 1,
1.354376, 0.05322881, 2.684221, 1, 0, 0.4862745, 1,
1.355796, -2.521671, 1.521319, 1, 0, 0.4784314, 1,
1.377143, 0.9505701, 0.8404778, 1, 0, 0.4745098, 1,
1.382934, 0.543649, -2.49151, 1, 0, 0.4666667, 1,
1.389189, -0.1652965, 2.989519, 1, 0, 0.4627451, 1,
1.391148, -0.1827002, 1.07486, 1, 0, 0.454902, 1,
1.399668, 0.8466808, 0.7647708, 1, 0, 0.4509804, 1,
1.415736, -0.2742867, -0.1042481, 1, 0, 0.4431373, 1,
1.41669, 0.7489293, 1.709251, 1, 0, 0.4392157, 1,
1.419587, 0.8614575, 1.781839, 1, 0, 0.4313726, 1,
1.419594, -0.5727687, 3.089513, 1, 0, 0.427451, 1,
1.428856, -2.273407, 1.906742, 1, 0, 0.4196078, 1,
1.432015, 0.2375396, 0.9544264, 1, 0, 0.4156863, 1,
1.432531, -1.691576, 0.5002062, 1, 0, 0.4078431, 1,
1.43531, -0.2324045, 0.9531871, 1, 0, 0.4039216, 1,
1.439791, -2.030089, 2.685704, 1, 0, 0.3960784, 1,
1.445033, -0.5984533, 2.558411, 1, 0, 0.3882353, 1,
1.454071, 1.330955, 0.9818519, 1, 0, 0.3843137, 1,
1.463711, -0.6552081, 2.281524, 1, 0, 0.3764706, 1,
1.478883, 1.444632, 1.140618, 1, 0, 0.372549, 1,
1.479403, 0.08314312, 2.542401, 1, 0, 0.3647059, 1,
1.479759, -0.07928441, 0.6491206, 1, 0, 0.3607843, 1,
1.4811, -0.03259163, 1.649926, 1, 0, 0.3529412, 1,
1.493108, -0.4281389, 0.9917492, 1, 0, 0.3490196, 1,
1.49392, 0.5651762, 3.003999, 1, 0, 0.3411765, 1,
1.494053, 1.307969, 1.016139, 1, 0, 0.3372549, 1,
1.495557, -1.538119, 1.849699, 1, 0, 0.3294118, 1,
1.50359, -0.06786491, 1.225156, 1, 0, 0.3254902, 1,
1.509685, -0.3088046, 1.921471, 1, 0, 0.3176471, 1,
1.510913, 1.542297, -0.1033219, 1, 0, 0.3137255, 1,
1.512537, -1.519436, 2.074528, 1, 0, 0.3058824, 1,
1.520728, 0.6230143, 1.802032, 1, 0, 0.2980392, 1,
1.538876, 0.2834141, 0.1428874, 1, 0, 0.2941177, 1,
1.578782, 0.620131, 0.0641489, 1, 0, 0.2862745, 1,
1.581875, 1.313095, -0.4434234, 1, 0, 0.282353, 1,
1.584727, 1.016701, 1.69475, 1, 0, 0.2745098, 1,
1.585039, -0.8389982, 0.3271427, 1, 0, 0.2705882, 1,
1.586489, 1.912342, 2.530866, 1, 0, 0.2627451, 1,
1.588576, -1.421213, 1.87983, 1, 0, 0.2588235, 1,
1.592428, -1.29322, 1.709189, 1, 0, 0.2509804, 1,
1.614643, 0.5039902, -0.08285476, 1, 0, 0.2470588, 1,
1.657797, -0.8377516, 1.185494, 1, 0, 0.2392157, 1,
1.664093, -0.1184706, 3.742578, 1, 0, 0.2352941, 1,
1.66716, 1.554302, 1.935037, 1, 0, 0.227451, 1,
1.668154, 1.13756, 1.062031, 1, 0, 0.2235294, 1,
1.670258, 0.8761891, 1.592284, 1, 0, 0.2156863, 1,
1.69635, 0.5166822, 0.2388587, 1, 0, 0.2117647, 1,
1.704372, -1.212226, -0.2798836, 1, 0, 0.2039216, 1,
1.706676, 0.04127596, 1.480129, 1, 0, 0.1960784, 1,
1.708081, 1.19773, 0.005917876, 1, 0, 0.1921569, 1,
1.747549, 0.009454488, 2.183348, 1, 0, 0.1843137, 1,
1.753358, 0.8037375, 1.89626, 1, 0, 0.1803922, 1,
1.778793, 0.9198093, 2.51151, 1, 0, 0.172549, 1,
1.818321, 0.6754805, 2.127867, 1, 0, 0.1686275, 1,
1.829606, 0.2751581, 1.186091, 1, 0, 0.1607843, 1,
1.894371, -0.2961951, 1.009882, 1, 0, 0.1568628, 1,
1.907161, -0.1078223, 0.5227531, 1, 0, 0.1490196, 1,
1.909189, 0.5772179, 2.085026, 1, 0, 0.145098, 1,
1.910027, 1.196155, 0.1451381, 1, 0, 0.1372549, 1,
1.914805, 0.00627018, 0.6609985, 1, 0, 0.1333333, 1,
1.942987, -0.2378488, 0.3873692, 1, 0, 0.1254902, 1,
1.966194, -1.668582, 3.135659, 1, 0, 0.1215686, 1,
1.968844, 0.8352549, 1.01049, 1, 0, 0.1137255, 1,
1.974146, -0.5313888, 1.73387, 1, 0, 0.1098039, 1,
1.983208, 0.6581693, 0.4054022, 1, 0, 0.1019608, 1,
2.023861, 0.1324909, 1.972798, 1, 0, 0.09411765, 1,
2.06516, 0.703845, 0.3883904, 1, 0, 0.09019608, 1,
2.10379, 1.076975, 1.142671, 1, 0, 0.08235294, 1,
2.117611, -1.09622, 2.721756, 1, 0, 0.07843138, 1,
2.146593, -0.8503509, 1.79843, 1, 0, 0.07058824, 1,
2.175827, 1.512682, 1.087371, 1, 0, 0.06666667, 1,
2.241658, 0.1755635, 1.861173, 1, 0, 0.05882353, 1,
2.242195, 0.7602152, 2.07078, 1, 0, 0.05490196, 1,
2.251362, 0.07282469, 1.448181, 1, 0, 0.04705882, 1,
2.268547, 0.04250014, 3.074395, 1, 0, 0.04313726, 1,
2.29814, 0.8665596, 0.4158083, 1, 0, 0.03529412, 1,
2.384006, 0.01909102, -1.436172, 1, 0, 0.03137255, 1,
2.417668, 1.153181, 0.1457103, 1, 0, 0.02352941, 1,
2.590721, 0.1509583, 2.966156, 1, 0, 0.01960784, 1,
2.614636, 0.02236361, 1.601364, 1, 0, 0.01176471, 1,
2.846883, 2.247917, 1.608538, 1, 0, 0.007843138, 1
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
-0.6604558, -3.803769, -7.087473, 0, -0.5, 0.5, 0.5,
-0.6604558, -3.803769, -7.087473, 1, -0.5, 0.5, 0.5,
-0.6604558, -3.803769, -7.087473, 1, 1.5, 0.5, 0.5,
-0.6604558, -3.803769, -7.087473, 0, 1.5, 0.5, 0.5
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
-5.356782, 0.1138471, -7.087473, 0, -0.5, 0.5, 0.5,
-5.356782, 0.1138471, -7.087473, 1, -0.5, 0.5, 0.5,
-5.356782, 0.1138471, -7.087473, 1, 1.5, 0.5, 0.5,
-5.356782, 0.1138471, -7.087473, 0, 1.5, 0.5, 0.5
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
-5.356782, -3.803769, -0.03728652, 0, -0.5, 0.5, 0.5,
-5.356782, -3.803769, -0.03728652, 1, -0.5, 0.5, 0.5,
-5.356782, -3.803769, -0.03728652, 1, 1.5, 0.5, 0.5,
-5.356782, -3.803769, -0.03728652, 0, 1.5, 0.5, 0.5
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
-4, -2.899704, -5.460507,
2, -2.899704, -5.460507,
-4, -2.899704, -5.460507,
-4, -3.050381, -5.731668,
-2, -2.899704, -5.460507,
-2, -3.050381, -5.731668,
0, -2.899704, -5.460507,
0, -3.050381, -5.731668,
2, -2.899704, -5.460507,
2, -3.050381, -5.731668
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
"-4",
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
-4, -3.351736, -6.27399, 0, -0.5, 0.5, 0.5,
-4, -3.351736, -6.27399, 1, -0.5, 0.5, 0.5,
-4, -3.351736, -6.27399, 1, 1.5, 0.5, 0.5,
-4, -3.351736, -6.27399, 0, 1.5, 0.5, 0.5,
-2, -3.351736, -6.27399, 0, -0.5, 0.5, 0.5,
-2, -3.351736, -6.27399, 1, -0.5, 0.5, 0.5,
-2, -3.351736, -6.27399, 1, 1.5, 0.5, 0.5,
-2, -3.351736, -6.27399, 0, 1.5, 0.5, 0.5,
0, -3.351736, -6.27399, 0, -0.5, 0.5, 0.5,
0, -3.351736, -6.27399, 1, -0.5, 0.5, 0.5,
0, -3.351736, -6.27399, 1, 1.5, 0.5, 0.5,
0, -3.351736, -6.27399, 0, 1.5, 0.5, 0.5,
2, -3.351736, -6.27399, 0, -0.5, 0.5, 0.5,
2, -3.351736, -6.27399, 1, -0.5, 0.5, 0.5,
2, -3.351736, -6.27399, 1, 1.5, 0.5, 0.5,
2, -3.351736, -6.27399, 0, 1.5, 0.5, 0.5
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
-4.273015, -2, -5.460507,
-4.273015, 3, -5.460507,
-4.273015, -2, -5.460507,
-4.453643, -2, -5.731668,
-4.273015, -1, -5.460507,
-4.453643, -1, -5.731668,
-4.273015, 0, -5.460507,
-4.453643, 0, -5.731668,
-4.273015, 1, -5.460507,
-4.453643, 1, -5.731668,
-4.273015, 2, -5.460507,
-4.453643, 2, -5.731668,
-4.273015, 3, -5.460507,
-4.453643, 3, -5.731668
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
-4.814898, -2, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, -2, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, -2, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, -2, -6.27399, 0, 1.5, 0.5, 0.5,
-4.814898, -1, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, -1, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, -1, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, -1, -6.27399, 0, 1.5, 0.5, 0.5,
-4.814898, 0, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, 0, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, 0, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, 0, -6.27399, 0, 1.5, 0.5, 0.5,
-4.814898, 1, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, 1, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, 1, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, 1, -6.27399, 0, 1.5, 0.5, 0.5,
-4.814898, 2, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, 2, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, 2, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, 2, -6.27399, 0, 1.5, 0.5, 0.5,
-4.814898, 3, -6.27399, 0, -0.5, 0.5, 0.5,
-4.814898, 3, -6.27399, 1, -0.5, 0.5, 0.5,
-4.814898, 3, -6.27399, 1, 1.5, 0.5, 0.5,
-4.814898, 3, -6.27399, 0, 1.5, 0.5, 0.5
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
-4.273015, -2.899704, -4,
-4.273015, -2.899704, 4,
-4.273015, -2.899704, -4,
-4.453643, -3.050381, -4,
-4.273015, -2.899704, -2,
-4.453643, -3.050381, -2,
-4.273015, -2.899704, 0,
-4.453643, -3.050381, 0,
-4.273015, -2.899704, 2,
-4.453643, -3.050381, 2,
-4.273015, -2.899704, 4,
-4.453643, -3.050381, 4
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
-4.814898, -3.351736, -4, 0, -0.5, 0.5, 0.5,
-4.814898, -3.351736, -4, 1, -0.5, 0.5, 0.5,
-4.814898, -3.351736, -4, 1, 1.5, 0.5, 0.5,
-4.814898, -3.351736, -4, 0, 1.5, 0.5, 0.5,
-4.814898, -3.351736, -2, 0, -0.5, 0.5, 0.5,
-4.814898, -3.351736, -2, 1, -0.5, 0.5, 0.5,
-4.814898, -3.351736, -2, 1, 1.5, 0.5, 0.5,
-4.814898, -3.351736, -2, 0, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 0, 0, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 0, 1, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 0, 1, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 0, 0, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 2, 0, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 2, 1, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 2, 1, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 2, 0, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 4, 0, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 4, 1, -0.5, 0.5, 0.5,
-4.814898, -3.351736, 4, 1, 1.5, 0.5, 0.5,
-4.814898, -3.351736, 4, 0, 1.5, 0.5, 0.5
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
-4.273015, -2.899704, -5.460507,
-4.273015, 3.127398, -5.460507,
-4.273015, -2.899704, 5.385934,
-4.273015, 3.127398, 5.385934,
-4.273015, -2.899704, -5.460507,
-4.273015, -2.899704, 5.385934,
-4.273015, 3.127398, -5.460507,
-4.273015, 3.127398, 5.385934,
-4.273015, -2.899704, -5.460507,
2.952103, -2.899704, -5.460507,
-4.273015, -2.899704, 5.385934,
2.952103, -2.899704, 5.385934,
-4.273015, 3.127398, -5.460507,
2.952103, 3.127398, -5.460507,
-4.273015, 3.127398, 5.385934,
2.952103, 3.127398, 5.385934,
2.952103, -2.899704, -5.460507,
2.952103, 3.127398, -5.460507,
2.952103, -2.899704, 5.385934,
2.952103, 3.127398, 5.385934,
2.952103, -2.899704, -5.460507,
2.952103, -2.899704, 5.385934,
2.952103, 3.127398, -5.460507,
2.952103, 3.127398, 5.385934
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
var radius = 7.667291;
var distance = 34.11264;
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
mvMatrix.translate( 0.6604558, -0.1138471, 0.03728652 );
mvMatrix.scale( 1.14739, 1.375458, 0.7643084 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.11264);
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


