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
-2.800512, 0.1151877, -2.163437, 1, 0, 0, 1,
-2.729831, 1.358406, -1.639585, 1, 0.007843138, 0, 1,
-2.634357, -1.030796, -3.946052, 1, 0.01176471, 0, 1,
-2.417122, -0.08583964, -1.476466, 1, 0.01960784, 0, 1,
-2.392223, 1.334492, -2.667938, 1, 0.02352941, 0, 1,
-2.370451, -0.1194941, -1.997578, 1, 0.03137255, 0, 1,
-2.352842, 0.5733093, -0.4522102, 1, 0.03529412, 0, 1,
-2.327012, 0.7014157, -1.215653, 1, 0.04313726, 0, 1,
-2.263211, -0.8809343, -2.898249, 1, 0.04705882, 0, 1,
-2.24462, -0.3840307, -3.262752, 1, 0.05490196, 0, 1,
-2.206707, -1.133062, -3.601233, 1, 0.05882353, 0, 1,
-2.183284, -0.7571148, -2.605784, 1, 0.06666667, 0, 1,
-2.166817, 2.061625, 0.714584, 1, 0.07058824, 0, 1,
-2.085698, -0.04135312, -3.17879, 1, 0.07843138, 0, 1,
-1.999193, 0.6309655, -1.428314, 1, 0.08235294, 0, 1,
-1.976412, -0.4677742, -0.7943693, 1, 0.09019608, 0, 1,
-1.948609, 0.6109537, -2.628041, 1, 0.09411765, 0, 1,
-1.929267, -0.116974, -0.7570215, 1, 0.1019608, 0, 1,
-1.92609, -0.1560224, -2.542831, 1, 0.1098039, 0, 1,
-1.887398, -1.022778, -1.54499, 1, 0.1137255, 0, 1,
-1.851808, 1.590603, 0.3221399, 1, 0.1215686, 0, 1,
-1.845184, -0.4101364, -2.885975, 1, 0.1254902, 0, 1,
-1.825402, 0.8362148, -0.8011781, 1, 0.1333333, 0, 1,
-1.820306, 0.9715006, -0.7836075, 1, 0.1372549, 0, 1,
-1.814828, -0.06561334, -1.775424, 1, 0.145098, 0, 1,
-1.765989, 0.1803477, -1.547397, 1, 0.1490196, 0, 1,
-1.763893, -0.3377258, -0.1752074, 1, 0.1568628, 0, 1,
-1.755095, 0.367838, -1.795039, 1, 0.1607843, 0, 1,
-1.753527, -1.92766, -1.299459, 1, 0.1686275, 0, 1,
-1.746064, -0.04070686, -0.920189, 1, 0.172549, 0, 1,
-1.745259, -0.2807355, -2.529998, 1, 0.1803922, 0, 1,
-1.736542, -1.407076, -2.633703, 1, 0.1843137, 0, 1,
-1.735362, 1.950699, -2.29486, 1, 0.1921569, 0, 1,
-1.695277, -0.891759, 0.2009764, 1, 0.1960784, 0, 1,
-1.68851, -0.4167611, -1.069055, 1, 0.2039216, 0, 1,
-1.678847, 1.412528, -1.848873, 1, 0.2117647, 0, 1,
-1.654518, -1.063508, -1.173515, 1, 0.2156863, 0, 1,
-1.638665, 1.931351, -1.050747, 1, 0.2235294, 0, 1,
-1.634758, 0.8150306, -1.089548, 1, 0.227451, 0, 1,
-1.633989, -0.3130911, -1.731089, 1, 0.2352941, 0, 1,
-1.622015, 1.742151, -1.912593, 1, 0.2392157, 0, 1,
-1.618493, 0.5868157, -1.595299, 1, 0.2470588, 0, 1,
-1.599683, -1.195093, -3.434346, 1, 0.2509804, 0, 1,
-1.591388, 1.083117, -1.173386, 1, 0.2588235, 0, 1,
-1.584061, 0.2180138, -1.618299, 1, 0.2627451, 0, 1,
-1.565987, 1.365786, -1.239458, 1, 0.2705882, 0, 1,
-1.561217, 1.285269, -0.5541005, 1, 0.2745098, 0, 1,
-1.545269, -1.754554, -2.941797, 1, 0.282353, 0, 1,
-1.5426, -0.2296881, -1.887926, 1, 0.2862745, 0, 1,
-1.539968, 1.349656, -1.167526, 1, 0.2941177, 0, 1,
-1.538483, -1.357979, -1.738491, 1, 0.3019608, 0, 1,
-1.532235, -1.902835, -0.3127957, 1, 0.3058824, 0, 1,
-1.521403, -0.09505518, -1.417918, 1, 0.3137255, 0, 1,
-1.515525, 0.7918986, -2.005832, 1, 0.3176471, 0, 1,
-1.502462, -0.3302892, -1.882621, 1, 0.3254902, 0, 1,
-1.499736, -0.2362423, -3.359986, 1, 0.3294118, 0, 1,
-1.487399, 0.5916642, -1.627043, 1, 0.3372549, 0, 1,
-1.481566, -0.8109588, -3.226985, 1, 0.3411765, 0, 1,
-1.465995, -0.1293102, -2.126005, 1, 0.3490196, 0, 1,
-1.464461, -1.907942, -4.202903, 1, 0.3529412, 0, 1,
-1.455561, 0.03142396, -2.412122, 1, 0.3607843, 0, 1,
-1.453861, -0.3809538, -0.6901522, 1, 0.3647059, 0, 1,
-1.451806, 1.040133, -0.8685649, 1, 0.372549, 0, 1,
-1.449331, -0.7864001, -3.410699, 1, 0.3764706, 0, 1,
-1.433658, 0.3310921, -1.460661, 1, 0.3843137, 0, 1,
-1.430379, 0.9290714, -1.661549, 1, 0.3882353, 0, 1,
-1.42317, 0.6506248, -4.098789, 1, 0.3960784, 0, 1,
-1.413553, -1.467055, -3.27723, 1, 0.4039216, 0, 1,
-1.41112, 0.6361684, -2.128273, 1, 0.4078431, 0, 1,
-1.410917, -0.06007974, -0.8179576, 1, 0.4156863, 0, 1,
-1.407468, 0.3320346, -1.438886, 1, 0.4196078, 0, 1,
-1.405816, -0.2319106, -1.438088, 1, 0.427451, 0, 1,
-1.403479, -0.1588353, -3.000065, 1, 0.4313726, 0, 1,
-1.394753, 0.2520867, -0.8048141, 1, 0.4392157, 0, 1,
-1.391393, 1.422342, 0.3036856, 1, 0.4431373, 0, 1,
-1.381521, -0.2229304, -0.245266, 1, 0.4509804, 0, 1,
-1.379287, -0.05652613, -2.557884, 1, 0.454902, 0, 1,
-1.363291, 0.3490031, -0.4748536, 1, 0.4627451, 0, 1,
-1.359145, 0.09936886, -0.520107, 1, 0.4666667, 0, 1,
-1.347498, 0.381633, 0.400759, 1, 0.4745098, 0, 1,
-1.343897, 1.36531, 0.3650469, 1, 0.4784314, 0, 1,
-1.334586, 0.1538014, -0.3809527, 1, 0.4862745, 0, 1,
-1.316356, 1.049526, 0.3340419, 1, 0.4901961, 0, 1,
-1.304497, -0.08727362, -2.74987, 1, 0.4980392, 0, 1,
-1.288518, -1.191557, -3.319827, 1, 0.5058824, 0, 1,
-1.282573, 0.5769559, 0.5837787, 1, 0.509804, 0, 1,
-1.281147, 1.312087, -0.01664479, 1, 0.5176471, 0, 1,
-1.280551, 0.966553, -0.9258786, 1, 0.5215687, 0, 1,
-1.265567, -0.02748188, -1.541665, 1, 0.5294118, 0, 1,
-1.25908, -1.823418, -1.323281, 1, 0.5333334, 0, 1,
-1.254102, -1.408175, -3.067258, 1, 0.5411765, 0, 1,
-1.250777, -1.094443, -3.033776, 1, 0.5450981, 0, 1,
-1.235236, -0.3860077, -2.384538, 1, 0.5529412, 0, 1,
-1.234933, 1.184057, -1.035765, 1, 0.5568628, 0, 1,
-1.224307, -1.619556, -2.27018, 1, 0.5647059, 0, 1,
-1.224168, 0.08130366, -2.242479, 1, 0.5686275, 0, 1,
-1.208329, 0.6430699, -1.391792, 1, 0.5764706, 0, 1,
-1.206509, -0.06850179, -2.462696, 1, 0.5803922, 0, 1,
-1.202243, -0.07179067, -2.160658, 1, 0.5882353, 0, 1,
-1.201383, 0.5542914, 0.2046603, 1, 0.5921569, 0, 1,
-1.198859, -0.3811851, -2.117876, 1, 0.6, 0, 1,
-1.196517, -1.170219, -1.476737, 1, 0.6078432, 0, 1,
-1.191148, -0.984241, -1.915951, 1, 0.6117647, 0, 1,
-1.187398, 1.183931, -0.6937708, 1, 0.6196079, 0, 1,
-1.181114, 0.2268251, -2.076132, 1, 0.6235294, 0, 1,
-1.174713, 1.48181, -1.371309, 1, 0.6313726, 0, 1,
-1.163241, -1.041815, -1.871519, 1, 0.6352941, 0, 1,
-1.161728, 0.2642196, -2.24947, 1, 0.6431373, 0, 1,
-1.159332, -0.1755015, -1.15842, 1, 0.6470588, 0, 1,
-1.156857, 0.309182, -0.3011543, 1, 0.654902, 0, 1,
-1.148953, -0.2118727, -1.982891, 1, 0.6588235, 0, 1,
-1.145637, 0.7229556, 0.3132643, 1, 0.6666667, 0, 1,
-1.144046, -1.645966, -1.132784, 1, 0.6705883, 0, 1,
-1.139059, 0.1052427, -1.521292, 1, 0.6784314, 0, 1,
-1.132465, -0.4636289, -1.884992, 1, 0.682353, 0, 1,
-1.131781, -0.3753988, -1.506139, 1, 0.6901961, 0, 1,
-1.131321, -1.532098, -2.33673, 1, 0.6941177, 0, 1,
-1.130276, 1.138636, 0.370841, 1, 0.7019608, 0, 1,
-1.118928, 1.974603, -1.626142, 1, 0.7098039, 0, 1,
-1.118798, 0.3858214, -1.003544, 1, 0.7137255, 0, 1,
-1.117674, 0.4828857, -0.8245062, 1, 0.7215686, 0, 1,
-1.116932, 1.52522, -0.6106767, 1, 0.7254902, 0, 1,
-1.115711, -0.3933026, -3.104508, 1, 0.7333333, 0, 1,
-1.115618, -1.554705, -2.712512, 1, 0.7372549, 0, 1,
-1.109549, -1.346602, -3.100008, 1, 0.7450981, 0, 1,
-1.100491, 0.02803647, -0.4573422, 1, 0.7490196, 0, 1,
-1.087532, -1.276265, -2.453851, 1, 0.7568628, 0, 1,
-1.083722, -1.58172, -2.179061, 1, 0.7607843, 0, 1,
-1.080174, -1.539724, -2.387541, 1, 0.7686275, 0, 1,
-1.077126, -0.9347937, 0.3217286, 1, 0.772549, 0, 1,
-1.073042, -0.6081911, -0.5301757, 1, 0.7803922, 0, 1,
-1.072469, -0.2976378, -2.723724, 1, 0.7843137, 0, 1,
-1.065169, 0.7118443, -1.609226, 1, 0.7921569, 0, 1,
-1.064817, 0.8463956, -1.027801, 1, 0.7960784, 0, 1,
-1.062761, -0.4915812, -2.971202, 1, 0.8039216, 0, 1,
-1.051881, 1.094192, -0.7674463, 1, 0.8117647, 0, 1,
-1.046746, -1.15742, -2.62034, 1, 0.8156863, 0, 1,
-1.042634, -0.2239445, -1.874438, 1, 0.8235294, 0, 1,
-1.034236, -0.4412444, -5.102955, 1, 0.827451, 0, 1,
-1.032775, -1.749858, -2.602583, 1, 0.8352941, 0, 1,
-1.031419, 0.2897157, -1.47019, 1, 0.8392157, 0, 1,
-1.0308, 0.8667132, -0.3751278, 1, 0.8470588, 0, 1,
-1.019107, -2.079303, -3.559538, 1, 0.8509804, 0, 1,
-1.015429, -0.5315081, -2.260887, 1, 0.8588235, 0, 1,
-1.01226, -0.3185231, -1.344864, 1, 0.8627451, 0, 1,
-1.007821, 0.1999249, -1.094473, 1, 0.8705882, 0, 1,
-1.007026, 1.10235, -1.76289, 1, 0.8745098, 0, 1,
-1.002388, -0.3726991, -0.6798209, 1, 0.8823529, 0, 1,
-0.9975969, 0.520372, 0.0617526, 1, 0.8862745, 0, 1,
-0.9942655, -0.8231669, -1.081978, 1, 0.8941177, 0, 1,
-0.9905316, 0.5014884, -0.2502914, 1, 0.8980392, 0, 1,
-0.9887943, -0.3216119, -2.143627, 1, 0.9058824, 0, 1,
-0.9881514, 1.566108, -0.4504012, 1, 0.9137255, 0, 1,
-0.9850895, -0.651524, -3.573409, 1, 0.9176471, 0, 1,
-0.9844595, 0.672861, -2.192432, 1, 0.9254902, 0, 1,
-0.9839404, 0.04715598, -0.5037956, 1, 0.9294118, 0, 1,
-0.9813892, -0.6421084, 0.3274087, 1, 0.9372549, 0, 1,
-0.97725, 0.07875517, -1.475002, 1, 0.9411765, 0, 1,
-0.9762219, -0.1052619, 0.5017303, 1, 0.9490196, 0, 1,
-0.9720222, -1.664968, -3.42998, 1, 0.9529412, 0, 1,
-0.9669602, -0.212974, -1.536487, 1, 0.9607843, 0, 1,
-0.9650792, 0.8013628, -0.6451579, 1, 0.9647059, 0, 1,
-0.9620672, -2.518262, -2.088893, 1, 0.972549, 0, 1,
-0.9611399, -0.08732864, -0.8678784, 1, 0.9764706, 0, 1,
-0.95994, -0.060668, -1.641451, 1, 0.9843137, 0, 1,
-0.957679, -0.7492002, -1.386499, 1, 0.9882353, 0, 1,
-0.9556883, 0.2828997, -0.5212843, 1, 0.9960784, 0, 1,
-0.9532802, 0.8315423, 0.8133639, 0.9960784, 1, 0, 1,
-0.9529815, 0.6923425, -1.131983, 0.9921569, 1, 0, 1,
-0.9516701, 0.4139383, -2.944973, 0.9843137, 1, 0, 1,
-0.9468967, -1.437787, -3.770975, 0.9803922, 1, 0, 1,
-0.9328138, -2.737392, -1.883912, 0.972549, 1, 0, 1,
-0.9326366, -3.023557, -2.057558, 0.9686275, 1, 0, 1,
-0.9284919, -0.711274, -2.358939, 0.9607843, 1, 0, 1,
-0.9257416, -0.6635787, -1.163536, 0.9568627, 1, 0, 1,
-0.9224777, -3.139778, -5.498101, 0.9490196, 1, 0, 1,
-0.9201298, -0.3441856, -2.54499, 0.945098, 1, 0, 1,
-0.9144438, -1.111166, -2.089529, 0.9372549, 1, 0, 1,
-0.9137525, -0.6646221, -0.769341, 0.9333333, 1, 0, 1,
-0.9129976, 0.4026136, -2.892403, 0.9254902, 1, 0, 1,
-0.909487, -0.555898, -0.5626833, 0.9215686, 1, 0, 1,
-0.9072829, -0.3549602, -4.464801, 0.9137255, 1, 0, 1,
-0.9045745, 0.7232767, -1.57829, 0.9098039, 1, 0, 1,
-0.8942961, 0.1413136, -1.332752, 0.9019608, 1, 0, 1,
-0.894141, -0.233992, -3.650282, 0.8941177, 1, 0, 1,
-0.8939366, -0.05358356, -1.514443, 0.8901961, 1, 0, 1,
-0.8883195, 0.5934446, -1.765648, 0.8823529, 1, 0, 1,
-0.8865647, -0.1315778, -1.440037, 0.8784314, 1, 0, 1,
-0.8823017, -2.176785, -4.114886, 0.8705882, 1, 0, 1,
-0.8797108, -0.9838942, -2.134648, 0.8666667, 1, 0, 1,
-0.8772961, 1.110239, -0.4085239, 0.8588235, 1, 0, 1,
-0.8772207, 1.356768, -0.2309145, 0.854902, 1, 0, 1,
-0.8745256, -1.16742, -1.444372, 0.8470588, 1, 0, 1,
-0.8728451, -1.295055, -3.27462, 0.8431373, 1, 0, 1,
-0.8718799, -0.06811687, -2.444064, 0.8352941, 1, 0, 1,
-0.8690889, -0.5184349, -1.185953, 0.8313726, 1, 0, 1,
-0.8689169, 2.19473, -1.131975, 0.8235294, 1, 0, 1,
-0.8645522, -0.2147754, -1.361035, 0.8196079, 1, 0, 1,
-0.8579685, -0.7906294, -0.7930758, 0.8117647, 1, 0, 1,
-0.8520969, 1.102345, -0.8416649, 0.8078431, 1, 0, 1,
-0.8514852, 2.572278, 0.5349461, 0.8, 1, 0, 1,
-0.8488525, 0.4584174, -2.055394, 0.7921569, 1, 0, 1,
-0.844793, -0.6720486, -3.271229, 0.7882353, 1, 0, 1,
-0.8418377, -0.5836438, -2.473661, 0.7803922, 1, 0, 1,
-0.8417575, -0.8292852, -2.273894, 0.7764706, 1, 0, 1,
-0.8370752, -1.669656, -4.668451, 0.7686275, 1, 0, 1,
-0.836291, -1.379312, -1.958052, 0.7647059, 1, 0, 1,
-0.8297039, -0.2191644, -1.663422, 0.7568628, 1, 0, 1,
-0.8254665, -0.1081501, -1.87283, 0.7529412, 1, 0, 1,
-0.8249836, -0.1508432, -1.684949, 0.7450981, 1, 0, 1,
-0.8200214, -0.03990268, -1.958341, 0.7411765, 1, 0, 1,
-0.8181069, -0.675547, -2.123298, 0.7333333, 1, 0, 1,
-0.8110873, -1.081096, -1.373303, 0.7294118, 1, 0, 1,
-0.8108546, 0.941394, -1.355854, 0.7215686, 1, 0, 1,
-0.8080019, 0.6759049, -0.4805889, 0.7176471, 1, 0, 1,
-0.8027722, -0.1485817, -0.5637833, 0.7098039, 1, 0, 1,
-0.8003162, 1.467554, -0.6119229, 0.7058824, 1, 0, 1,
-0.7975602, -2.822844, -3.330321, 0.6980392, 1, 0, 1,
-0.786694, -0.7924768, -1.942309, 0.6901961, 1, 0, 1,
-0.7814755, 0.678161, -0.1119803, 0.6862745, 1, 0, 1,
-0.777953, 1.55206, -0.783465, 0.6784314, 1, 0, 1,
-0.777445, -0.5288305, -1.061035, 0.6745098, 1, 0, 1,
-0.7770281, -0.01321761, -2.331593, 0.6666667, 1, 0, 1,
-0.7670807, -0.5665924, -0.656845, 0.6627451, 1, 0, 1,
-0.7645668, -0.007945406, -2.003766, 0.654902, 1, 0, 1,
-0.7634577, 0.415927, -0.2971197, 0.6509804, 1, 0, 1,
-0.7549083, 0.3138187, 0.3398121, 0.6431373, 1, 0, 1,
-0.7384939, 1.049621, 0.2936371, 0.6392157, 1, 0, 1,
-0.7368056, 1.188854, -0.7857339, 0.6313726, 1, 0, 1,
-0.731315, 1.413613, 0.3735003, 0.627451, 1, 0, 1,
-0.7283545, -1.862241, -3.012645, 0.6196079, 1, 0, 1,
-0.7262027, 0.3233672, -1.397816, 0.6156863, 1, 0, 1,
-0.7248787, -0.9435831, -3.689613, 0.6078432, 1, 0, 1,
-0.7217188, 1.931857, -0.2612118, 0.6039216, 1, 0, 1,
-0.7142236, 0.3681323, -0.8838229, 0.5960785, 1, 0, 1,
-0.7118755, -1.439236, -3.470427, 0.5882353, 1, 0, 1,
-0.7086402, -0.4909042, -1.033028, 0.5843138, 1, 0, 1,
-0.7056181, 0.5504629, -1.649778, 0.5764706, 1, 0, 1,
-0.7028799, -0.2580549, -1.694078, 0.572549, 1, 0, 1,
-0.6926928, -1.201876, -2.287756, 0.5647059, 1, 0, 1,
-0.6917952, -0.03823423, -0.7618929, 0.5607843, 1, 0, 1,
-0.685219, 0.3017727, -0.1277656, 0.5529412, 1, 0, 1,
-0.6740277, -0.3196193, -3.870082, 0.5490196, 1, 0, 1,
-0.6735895, 1.648007, -0.71482, 0.5411765, 1, 0, 1,
-0.673309, 1.196762, -1.210749, 0.5372549, 1, 0, 1,
-0.6648834, -1.288476, -4.243018, 0.5294118, 1, 0, 1,
-0.6636045, 1.184801, 0.8053923, 0.5254902, 1, 0, 1,
-0.6621457, -0.8614835, -1.365067, 0.5176471, 1, 0, 1,
-0.6579823, 0.365519, -2.223313, 0.5137255, 1, 0, 1,
-0.6574083, -0.7149264, -5.726084, 0.5058824, 1, 0, 1,
-0.6564941, -0.05699999, -2.744772, 0.5019608, 1, 0, 1,
-0.6480818, 0.3036796, -0.8633448, 0.4941176, 1, 0, 1,
-0.6480253, 0.06846718, -1.736727, 0.4862745, 1, 0, 1,
-0.6479633, 0.2671314, -1.699596, 0.4823529, 1, 0, 1,
-0.6436179, 1.891001, -0.7076868, 0.4745098, 1, 0, 1,
-0.6402529, 1.547726, -1.259395, 0.4705882, 1, 0, 1,
-0.6390578, -0.6163033, -1.219799, 0.4627451, 1, 0, 1,
-0.6373942, -0.8623972, -2.128381, 0.4588235, 1, 0, 1,
-0.6347906, -1.382214, -3.066948, 0.4509804, 1, 0, 1,
-0.6345255, 1.635862, 0.6023492, 0.4470588, 1, 0, 1,
-0.6285318, -0.7082438, -2.715994, 0.4392157, 1, 0, 1,
-0.6257998, -0.05671967, -0.5493255, 0.4352941, 1, 0, 1,
-0.6242255, 0.2804241, -2.12838, 0.427451, 1, 0, 1,
-0.6226794, 1.483574, 1.709508, 0.4235294, 1, 0, 1,
-0.6224869, -0.0661364, 0.5468996, 0.4156863, 1, 0, 1,
-0.6224603, 0.1677397, -0.5396808, 0.4117647, 1, 0, 1,
-0.6173837, 1.037395, -0.4874654, 0.4039216, 1, 0, 1,
-0.6131244, -1.134888, -1.70718, 0.3960784, 1, 0, 1,
-0.6120293, 1.121748, -1.041418, 0.3921569, 1, 0, 1,
-0.6102301, -0.03639532, -1.119081, 0.3843137, 1, 0, 1,
-0.602546, -0.166028, -1.327844, 0.3803922, 1, 0, 1,
-0.602263, 1.223153, -0.4625767, 0.372549, 1, 0, 1,
-0.6021234, -0.1976499, -0.343516, 0.3686275, 1, 0, 1,
-0.6000762, -1.011345, -2.500796, 0.3607843, 1, 0, 1,
-0.5999324, 0.0543747, -1.664532, 0.3568628, 1, 0, 1,
-0.5987837, -0.6445234, -1.614552, 0.3490196, 1, 0, 1,
-0.5959577, 2.131772, 0.3406761, 0.345098, 1, 0, 1,
-0.5942808, 0.1600168, -2.567348, 0.3372549, 1, 0, 1,
-0.5918299, -0.8826923, -1.172002, 0.3333333, 1, 0, 1,
-0.5911568, 0.2132093, -0.009041904, 0.3254902, 1, 0, 1,
-0.5906706, 0.4976447, 0.7277421, 0.3215686, 1, 0, 1,
-0.5843406, 1.976572, -0.5812019, 0.3137255, 1, 0, 1,
-0.5684548, 0.1298211, -0.9719062, 0.3098039, 1, 0, 1,
-0.5608618, 0.8865803, -0.8200513, 0.3019608, 1, 0, 1,
-0.5579237, 0.08653861, -0.9059304, 0.2941177, 1, 0, 1,
-0.5538147, -0.05768507, -2.502547, 0.2901961, 1, 0, 1,
-0.5535489, -1.3259, -3.282312, 0.282353, 1, 0, 1,
-0.5519519, -0.3162739, -2.641875, 0.2784314, 1, 0, 1,
-0.5500645, 1.333713, -0.226747, 0.2705882, 1, 0, 1,
-0.5479113, 0.420339, -0.04056248, 0.2666667, 1, 0, 1,
-0.5460158, -0.3835568, -2.023773, 0.2588235, 1, 0, 1,
-0.5391495, 0.0540817, -0.9575647, 0.254902, 1, 0, 1,
-0.537757, 0.2918804, 0.9882046, 0.2470588, 1, 0, 1,
-0.5339591, -0.3830211, 0.4498864, 0.2431373, 1, 0, 1,
-0.5290923, -0.6124866, -2.155764, 0.2352941, 1, 0, 1,
-0.528451, 0.8701301, -0.4665143, 0.2313726, 1, 0, 1,
-0.5194131, 1.41826, -2.549028, 0.2235294, 1, 0, 1,
-0.5182456, 0.4061129, -0.2087393, 0.2196078, 1, 0, 1,
-0.5096766, -2.072468, -1.136365, 0.2117647, 1, 0, 1,
-0.5075366, 0.2639751, -1.223052, 0.2078431, 1, 0, 1,
-0.5009924, 1.112986, 0.3976734, 0.2, 1, 0, 1,
-0.5008444, -0.5935454, -3.102217, 0.1921569, 1, 0, 1,
-0.5008089, -1.413837, -3.676805, 0.1882353, 1, 0, 1,
-0.4985718, -0.2712061, -2.900556, 0.1803922, 1, 0, 1,
-0.4968378, -0.7092558, -1.560429, 0.1764706, 1, 0, 1,
-0.4956915, 0.1940547, 0.03604355, 0.1686275, 1, 0, 1,
-0.4854509, 1.793359, 0.6405432, 0.1647059, 1, 0, 1,
-0.4830786, -1.865044, -3.669513, 0.1568628, 1, 0, 1,
-0.47281, -0.2646714, -0.6769392, 0.1529412, 1, 0, 1,
-0.4709576, 0.2107308, -2.349476, 0.145098, 1, 0, 1,
-0.4663374, -1.059217, -3.511693, 0.1411765, 1, 0, 1,
-0.4636108, -0.1134724, -2.498938, 0.1333333, 1, 0, 1,
-0.4634959, -0.7299314, -1.126839, 0.1294118, 1, 0, 1,
-0.459132, 0.5866472, -1.612846, 0.1215686, 1, 0, 1,
-0.4589903, -0.5853557, -2.688803, 0.1176471, 1, 0, 1,
-0.4589397, -0.03236889, 0.04167541, 0.1098039, 1, 0, 1,
-0.458656, -0.2868161, -1.535475, 0.1058824, 1, 0, 1,
-0.454449, 0.7025113, -1.367539, 0.09803922, 1, 0, 1,
-0.4526424, -1.194144, -3.279494, 0.09019608, 1, 0, 1,
-0.4521503, 2.007436, -1.562675, 0.08627451, 1, 0, 1,
-0.4468697, 1.009539, -1.617302, 0.07843138, 1, 0, 1,
-0.444502, -1.913782, -3.208548, 0.07450981, 1, 0, 1,
-0.439221, -0.5625303, -2.804108, 0.06666667, 1, 0, 1,
-0.4371017, 0.03920465, -2.596571, 0.0627451, 1, 0, 1,
-0.4349564, 0.522938, -1.08289, 0.05490196, 1, 0, 1,
-0.4341093, -1.540793, -4.29854, 0.05098039, 1, 0, 1,
-0.4329165, 1.541255, -0.7022335, 0.04313726, 1, 0, 1,
-0.4310228, 1.387531, -0.4956464, 0.03921569, 1, 0, 1,
-0.4303345, 0.3042621, -0.7203003, 0.03137255, 1, 0, 1,
-0.4299694, 0.3510956, -1.146931, 0.02745098, 1, 0, 1,
-0.4295188, 0.2603775, -1.267552, 0.01960784, 1, 0, 1,
-0.4278402, -0.06201197, -3.137155, 0.01568628, 1, 0, 1,
-0.427748, -0.4908538, -2.117316, 0.007843138, 1, 0, 1,
-0.4271347, 0.3125367, 0.357245, 0.003921569, 1, 0, 1,
-0.4205402, -1.326197, -0.8349389, 0, 1, 0.003921569, 1,
-0.4192525, -1.57039, -1.717886, 0, 1, 0.01176471, 1,
-0.41821, -0.07920049, -2.344355, 0, 1, 0.01568628, 1,
-0.4171336, -1.221212, -2.79722, 0, 1, 0.02352941, 1,
-0.4145024, 0.4167408, -0.7467771, 0, 1, 0.02745098, 1,
-0.4128483, 0.3687232, -0.09209075, 0, 1, 0.03529412, 1,
-0.4102986, -1.245603, -3.631178, 0, 1, 0.03921569, 1,
-0.404213, -1.329142, -2.204851, 0, 1, 0.04705882, 1,
-0.4014934, -0.5263464, -1.846806, 0, 1, 0.05098039, 1,
-0.3948387, 1.033002, -1.203596, 0, 1, 0.05882353, 1,
-0.3917472, -1.470508, -2.394863, 0, 1, 0.0627451, 1,
-0.3883684, 1.155216, -1.99876, 0, 1, 0.07058824, 1,
-0.3858181, -0.480312, -1.145529, 0, 1, 0.07450981, 1,
-0.3828892, 0.4045353, -1.210742, 0, 1, 0.08235294, 1,
-0.3827654, -0.7236123, -2.635435, 0, 1, 0.08627451, 1,
-0.3786553, -1.598677, -3.187581, 0, 1, 0.09411765, 1,
-0.3737246, 1.285407, -1.309017, 0, 1, 0.1019608, 1,
-0.3727465, -1.308003, -2.508956, 0, 1, 0.1058824, 1,
-0.3714805, -0.9687164, -2.385948, 0, 1, 0.1137255, 1,
-0.3660069, -0.4051495, -3.204726, 0, 1, 0.1176471, 1,
-0.3642641, -0.1050555, -1.864436, 0, 1, 0.1254902, 1,
-0.3628424, 0.5957485, -1.171699, 0, 1, 0.1294118, 1,
-0.3624451, -1.69129, -4.324955, 0, 1, 0.1372549, 1,
-0.3582819, -0.838808, -2.697294, 0, 1, 0.1411765, 1,
-0.3563755, -1.342829, -2.006447, 0, 1, 0.1490196, 1,
-0.355808, 0.5298897, -0.2256779, 0, 1, 0.1529412, 1,
-0.3553179, -1.317514, -3.161647, 0, 1, 0.1607843, 1,
-0.3548097, 0.7746624, 1.670046, 0, 1, 0.1647059, 1,
-0.3544962, -0.7092531, -4.2096, 0, 1, 0.172549, 1,
-0.3488677, 0.6116297, -0.5397867, 0, 1, 0.1764706, 1,
-0.3459027, -0.3197459, -2.167615, 0, 1, 0.1843137, 1,
-0.345305, 1.070466, -0.1224525, 0, 1, 0.1882353, 1,
-0.342959, -0.5069114, -2.803523, 0, 1, 0.1960784, 1,
-0.342344, 0.3280819, -0.05562691, 0, 1, 0.2039216, 1,
-0.3415053, -0.3755926, -0.6841241, 0, 1, 0.2078431, 1,
-0.3408642, -0.1990762, -1.35507, 0, 1, 0.2156863, 1,
-0.3356475, 1.690419, 0.3757278, 0, 1, 0.2196078, 1,
-0.3349569, 0.2542856, -0.4636527, 0, 1, 0.227451, 1,
-0.3315302, 0.7857974, -1.238744, 0, 1, 0.2313726, 1,
-0.3168066, 2.827276, -0.1835331, 0, 1, 0.2392157, 1,
-0.3152123, -0.06787442, -1.879029, 0, 1, 0.2431373, 1,
-0.313509, 0.5720137, -1.440138, 0, 1, 0.2509804, 1,
-0.3134414, -1.04561, -2.157597, 0, 1, 0.254902, 1,
-0.3128825, -0.8857813, -2.125045, 0, 1, 0.2627451, 1,
-0.310068, 1.078692, -0.8627416, 0, 1, 0.2666667, 1,
-0.3023995, -0.7770076, -3.621021, 0, 1, 0.2745098, 1,
-0.3007294, -1.048111, -3.036123, 0, 1, 0.2784314, 1,
-0.2954482, 0.9945592, 1.17251, 0, 1, 0.2862745, 1,
-0.2839528, 1.190424, 0.5435417, 0, 1, 0.2901961, 1,
-0.2833717, -0.8170618, -3.773318, 0, 1, 0.2980392, 1,
-0.2794629, -0.2752023, -1.271552, 0, 1, 0.3058824, 1,
-0.2794265, 0.03844919, -4.741697, 0, 1, 0.3098039, 1,
-0.2753523, 0.5728723, -1.968704, 0, 1, 0.3176471, 1,
-0.2739726, 0.6456024, -0.5357549, 0, 1, 0.3215686, 1,
-0.2670565, 0.6368277, -1.272048, 0, 1, 0.3294118, 1,
-0.263924, -0.8541275, -4.494446, 0, 1, 0.3333333, 1,
-0.2631738, -0.716311, -2.371242, 0, 1, 0.3411765, 1,
-0.2599355, 0.2532145, -0.1788325, 0, 1, 0.345098, 1,
-0.2591378, 0.8546912, -1.044064, 0, 1, 0.3529412, 1,
-0.2576195, 0.02273017, -2.676653, 0, 1, 0.3568628, 1,
-0.2531633, -0.2602473, -1.675216, 0, 1, 0.3647059, 1,
-0.25227, -0.0167395, -0.8852798, 0, 1, 0.3686275, 1,
-0.2459298, 1.093653, 0.1634976, 0, 1, 0.3764706, 1,
-0.2401499, 0.7054179, -0.5098433, 0, 1, 0.3803922, 1,
-0.2369612, -1.192692, -3.438983, 0, 1, 0.3882353, 1,
-0.2356003, 0.97453, 0.2973667, 0, 1, 0.3921569, 1,
-0.2348696, -0.1504205, -1.428541, 0, 1, 0.4, 1,
-0.2272017, -0.1490189, -0.7266668, 0, 1, 0.4078431, 1,
-0.2269237, 1.405618, 0.9643306, 0, 1, 0.4117647, 1,
-0.2242436, 1.131665, 1.113906, 0, 1, 0.4196078, 1,
-0.2227324, -0.1700072, -4.420756, 0, 1, 0.4235294, 1,
-0.2215972, 0.6839303, -1.987725, 0, 1, 0.4313726, 1,
-0.2202941, -0.793988, -2.599198, 0, 1, 0.4352941, 1,
-0.2163283, 0.7920809, -1.075532, 0, 1, 0.4431373, 1,
-0.2103771, -1.213463, -1.295436, 0, 1, 0.4470588, 1,
-0.2025607, 1.496053, 1.739885, 0, 1, 0.454902, 1,
-0.2000588, 1.004964, -0.9369889, 0, 1, 0.4588235, 1,
-0.1988821, -1.266441, -1.942225, 0, 1, 0.4666667, 1,
-0.1981563, 0.6396885, -0.4564086, 0, 1, 0.4705882, 1,
-0.197825, 0.6202157, -1.799473, 0, 1, 0.4784314, 1,
-0.196882, -2.040228, -3.595211, 0, 1, 0.4823529, 1,
-0.1876086, 1.989371, -0.5359078, 0, 1, 0.4901961, 1,
-0.1860224, 0.3283361, -1.202474, 0, 1, 0.4941176, 1,
-0.185433, -0.7589765, -4.554436, 0, 1, 0.5019608, 1,
-0.1769433, -1.518302, -1.61696, 0, 1, 0.509804, 1,
-0.1768056, 1.106335, 0.7787082, 0, 1, 0.5137255, 1,
-0.1666512, 0.9600289, 0.3761067, 0, 1, 0.5215687, 1,
-0.1612295, -0.5755741, -4.347386, 0, 1, 0.5254902, 1,
-0.160574, -0.008473302, -0.1931101, 0, 1, 0.5333334, 1,
-0.1566799, 0.01666641, -0.469979, 0, 1, 0.5372549, 1,
-0.1561969, -0.7011358, -2.393705, 0, 1, 0.5450981, 1,
-0.1460203, 1.226896, -2.117244, 0, 1, 0.5490196, 1,
-0.1456821, 0.3910182, -0.5045234, 0, 1, 0.5568628, 1,
-0.1439256, 0.8782386, -0.6172632, 0, 1, 0.5607843, 1,
-0.1431617, -1.517207, -3.081547, 0, 1, 0.5686275, 1,
-0.1408281, 0.8017144, -0.04622017, 0, 1, 0.572549, 1,
-0.139968, 0.1074003, -1.841656, 0, 1, 0.5803922, 1,
-0.1362234, -1.593285, -1.859195, 0, 1, 0.5843138, 1,
-0.1338812, 1.164289, 0.7293549, 0, 1, 0.5921569, 1,
-0.1333997, -0.7172079, -0.8751624, 0, 1, 0.5960785, 1,
-0.1319225, 0.6624131, -0.2593483, 0, 1, 0.6039216, 1,
-0.1279844, -0.9495953, -4.158706, 0, 1, 0.6117647, 1,
-0.1260628, 0.1739193, -0.123796, 0, 1, 0.6156863, 1,
-0.1139887, 0.1994128, -0.7519438, 0, 1, 0.6235294, 1,
-0.1105051, 0.235933, -0.6843398, 0, 1, 0.627451, 1,
-0.09937405, -1.49483, -4.481598, 0, 1, 0.6352941, 1,
-0.09715156, 0.3277042, 0.05069609, 0, 1, 0.6392157, 1,
-0.09707862, -0.4080794, -1.973221, 0, 1, 0.6470588, 1,
-0.09675396, 0.01991759, -0.3001897, 0, 1, 0.6509804, 1,
-0.09603097, -0.1318433, -2.084778, 0, 1, 0.6588235, 1,
-0.09590454, -0.4751271, -4.236811, 0, 1, 0.6627451, 1,
-0.09402178, 0.06767296, 0.4507847, 0, 1, 0.6705883, 1,
-0.09209126, 0.9575359, 0.3126205, 0, 1, 0.6745098, 1,
-0.08763422, -0.8666002, -5.8237, 0, 1, 0.682353, 1,
-0.08428236, 1.263746, -0.317953, 0, 1, 0.6862745, 1,
-0.08304117, 0.4490313, -0.4289389, 0, 1, 0.6941177, 1,
-0.0827018, -1.130125, -4.230831, 0, 1, 0.7019608, 1,
-0.08043182, -0.7887727, -3.388206, 0, 1, 0.7058824, 1,
-0.07995591, -0.438139, -2.495505, 0, 1, 0.7137255, 1,
-0.0763167, -0.8753422, -3.909109, 0, 1, 0.7176471, 1,
-0.07573025, -0.2723806, -3.434875, 0, 1, 0.7254902, 1,
-0.07215127, -0.3949099, -2.31944, 0, 1, 0.7294118, 1,
-0.07194031, -0.7944206, -2.812353, 0, 1, 0.7372549, 1,
-0.07152326, 1.23157, -1.136411, 0, 1, 0.7411765, 1,
-0.0709289, 0.3324261, -0.04766824, 0, 1, 0.7490196, 1,
-0.06864831, 0.2312464, 0.6913763, 0, 1, 0.7529412, 1,
-0.0662659, 0.6506284, -0.1798916, 0, 1, 0.7607843, 1,
-0.05764268, 0.2435236, 0.8871675, 0, 1, 0.7647059, 1,
-0.05545247, 0.789607, -1.431535, 0, 1, 0.772549, 1,
-0.05325776, 0.9674969, -0.2908556, 0, 1, 0.7764706, 1,
-0.0531178, -0.3526005, -3.952131, 0, 1, 0.7843137, 1,
-0.04906848, 0.7337804, 0.6461477, 0, 1, 0.7882353, 1,
-0.04849755, -0.289766, -2.582566, 0, 1, 0.7960784, 1,
-0.04734788, 1.03358, 1.380832, 0, 1, 0.8039216, 1,
-0.0469931, 0.9020703, -1.510936, 0, 1, 0.8078431, 1,
-0.04645481, -0.4859801, -3.48138, 0, 1, 0.8156863, 1,
-0.04305677, -1.174138, -3.584144, 0, 1, 0.8196079, 1,
-0.04243636, -1.617607, -3.590016, 0, 1, 0.827451, 1,
-0.04217763, 2.213549, 1.210277, 0, 1, 0.8313726, 1,
-0.03810915, -2.679199, -5.087892, 0, 1, 0.8392157, 1,
-0.03745834, -0.779098, -1.542226, 0, 1, 0.8431373, 1,
-0.0372408, -1.552267, -2.50967, 0, 1, 0.8509804, 1,
-0.03571006, -1.457288, -2.980902, 0, 1, 0.854902, 1,
-0.03568532, -0.8006278, -3.208401, 0, 1, 0.8627451, 1,
-0.03547733, -0.6714811, -3.938854, 0, 1, 0.8666667, 1,
-0.03123523, 0.2365787, 0.2792771, 0, 1, 0.8745098, 1,
-0.02441183, 1.350507, 1.665486, 0, 1, 0.8784314, 1,
-0.02264772, 1.493734, 0.6370702, 0, 1, 0.8862745, 1,
-0.0221755, -0.7341535, -2.890985, 0, 1, 0.8901961, 1,
-0.01910762, 0.2598253, -1.458045, 0, 1, 0.8980392, 1,
-0.01665228, -0.3013256, -3.940248, 0, 1, 0.9058824, 1,
-0.01604149, 0.09811316, 0.2118272, 0, 1, 0.9098039, 1,
-0.010669, -1.196197, -1.405032, 0, 1, 0.9176471, 1,
-0.01062114, -1.010775, -4.252436, 0, 1, 0.9215686, 1,
-0.004950074, 0.01038492, 0.2351007, 0, 1, 0.9294118, 1,
0.004050703, -0.5292259, 4.572994, 0, 1, 0.9333333, 1,
0.008395552, 0.09535618, 0.9880757, 0, 1, 0.9411765, 1,
0.01047428, 0.3566758, -0.5722408, 0, 1, 0.945098, 1,
0.01152987, 0.7616029, 0.2918642, 0, 1, 0.9529412, 1,
0.01237347, 1.208026, 0.4809507, 0, 1, 0.9568627, 1,
0.01287021, -0.2241426, 2.221314, 0, 1, 0.9647059, 1,
0.0172703, -1.449309, 3.066924, 0, 1, 0.9686275, 1,
0.01731778, 0.7667779, -0.8849609, 0, 1, 0.9764706, 1,
0.02618783, 0.6227058, 0.2252028, 0, 1, 0.9803922, 1,
0.03358446, 1.411409, -0.7771323, 0, 1, 0.9882353, 1,
0.03364541, 2.122416, -0.3940467, 0, 1, 0.9921569, 1,
0.03505308, -0.7825097, 2.082194, 0, 1, 1, 1,
0.03593534, -0.4170705, 2.604588, 0, 0.9921569, 1, 1,
0.03897047, -2.045152, 1.924377, 0, 0.9882353, 1, 1,
0.04054118, 0.5715565, -2.065681, 0, 0.9803922, 1, 1,
0.04138055, 0.4621928, 0.4967292, 0, 0.9764706, 1, 1,
0.04603217, 0.3449672, 0.6812364, 0, 0.9686275, 1, 1,
0.04767695, -1.354132, 2.788998, 0, 0.9647059, 1, 1,
0.0485711, -0.08274332, 2.291733, 0, 0.9568627, 1, 1,
0.05391782, 0.3298774, -0.6418163, 0, 0.9529412, 1, 1,
0.0592966, -0.321652, 4.385893, 0, 0.945098, 1, 1,
0.06074416, -0.7762901, 2.83593, 0, 0.9411765, 1, 1,
0.06176792, 1.409228, -0.5308464, 0, 0.9333333, 1, 1,
0.06311163, 0.7947021, 1.355542, 0, 0.9294118, 1, 1,
0.06355024, -0.09296043, 4.339374, 0, 0.9215686, 1, 1,
0.0638979, 0.0862009, 0.9652858, 0, 0.9176471, 1, 1,
0.06421641, -1.11701, 4.096244, 0, 0.9098039, 1, 1,
0.06423648, -0.1672793, 2.308049, 0, 0.9058824, 1, 1,
0.07433219, 0.2708188, -0.8594978, 0, 0.8980392, 1, 1,
0.0773369, -0.05707778, 2.392213, 0, 0.8901961, 1, 1,
0.07768483, -0.140664, 2.792422, 0, 0.8862745, 1, 1,
0.07975951, -0.5343796, 1.878322, 0, 0.8784314, 1, 1,
0.08021966, -0.7027315, 3.694345, 0, 0.8745098, 1, 1,
0.08061601, -1.521502, 1.712623, 0, 0.8666667, 1, 1,
0.08271245, 0.2455331, -0.1730163, 0, 0.8627451, 1, 1,
0.08486952, 1.683026, -1.387252, 0, 0.854902, 1, 1,
0.08754583, 1.732762, 1.750854, 0, 0.8509804, 1, 1,
0.09764039, -0.9014733, 2.154163, 0, 0.8431373, 1, 1,
0.1003732, 1.406486, 0.7408094, 0, 0.8392157, 1, 1,
0.1003922, -0.6312816, 5.081679, 0, 0.8313726, 1, 1,
0.1038521, 0.1987003, 0.930051, 0, 0.827451, 1, 1,
0.1040939, -0.6643007, 4.210923, 0, 0.8196079, 1, 1,
0.1075872, -0.4373096, 2.699977, 0, 0.8156863, 1, 1,
0.108039, 0.5829206, 1.935671, 0, 0.8078431, 1, 1,
0.1110214, 0.005109916, -0.1890099, 0, 0.8039216, 1, 1,
0.1141984, -0.00775529, 1.739509, 0, 0.7960784, 1, 1,
0.1164423, 0.6150401, 0.4953395, 0, 0.7882353, 1, 1,
0.1183249, -2.249155, 3.130106, 0, 0.7843137, 1, 1,
0.1203704, 0.03337127, 1.838069, 0, 0.7764706, 1, 1,
0.1242772, -1.126864, 2.470478, 0, 0.772549, 1, 1,
0.1294456, -0.7664594, 2.442139, 0, 0.7647059, 1, 1,
0.1306894, 1.422742, -0.4794026, 0, 0.7607843, 1, 1,
0.1322499, 0.2184146, -1.365592, 0, 0.7529412, 1, 1,
0.1362372, 1.40852, 0.5098796, 0, 0.7490196, 1, 1,
0.139355, -1.286126, 3.21158, 0, 0.7411765, 1, 1,
0.1410764, -0.7050682, 2.033489, 0, 0.7372549, 1, 1,
0.1440843, -0.06047209, 2.248918, 0, 0.7294118, 1, 1,
0.1504644, -2.197743, 3.723663, 0, 0.7254902, 1, 1,
0.1583808, -0.5388988, 2.969095, 0, 0.7176471, 1, 1,
0.1584401, -0.1359132, 4.177034, 0, 0.7137255, 1, 1,
0.1584624, 2.018521, 0.3931521, 0, 0.7058824, 1, 1,
0.1593883, -0.4439184, 2.192121, 0, 0.6980392, 1, 1,
0.1601629, 0.2371271, 0.3612162, 0, 0.6941177, 1, 1,
0.1616076, 0.7531138, 0.6266254, 0, 0.6862745, 1, 1,
0.1619211, -0.4379882, 4.25347, 0, 0.682353, 1, 1,
0.1655847, -0.4326577, 3.70909, 0, 0.6745098, 1, 1,
0.1682065, 0.9474466, 0.06627426, 0, 0.6705883, 1, 1,
0.1691005, 0.1599153, 2.267272, 0, 0.6627451, 1, 1,
0.1699859, 0.3769034, 2.499348, 0, 0.6588235, 1, 1,
0.1705623, -0.466941, 3.00335, 0, 0.6509804, 1, 1,
0.1715663, 0.463827, -2.11372, 0, 0.6470588, 1, 1,
0.174016, 1.728752, -0.5051444, 0, 0.6392157, 1, 1,
0.1747584, 1.198606, 1.160314, 0, 0.6352941, 1, 1,
0.1758634, -0.2933731, 3.003395, 0, 0.627451, 1, 1,
0.1825107, 0.9560624, -0.2582166, 0, 0.6235294, 1, 1,
0.1829837, 1.266747, -0.4587542, 0, 0.6156863, 1, 1,
0.1858205, -2.225974, 3.535863, 0, 0.6117647, 1, 1,
0.1858746, 0.9772968, 0.01277133, 0, 0.6039216, 1, 1,
0.1901198, -0.7863619, 2.912796, 0, 0.5960785, 1, 1,
0.1945466, 0.8713039, -0.5107003, 0, 0.5921569, 1, 1,
0.1961, 0.1618029, -1.151217, 0, 0.5843138, 1, 1,
0.196639, -0.01929497, 0.2826042, 0, 0.5803922, 1, 1,
0.1975423, -0.8523719, 4.223566, 0, 0.572549, 1, 1,
0.1983294, -0.1226503, 2.210127, 0, 0.5686275, 1, 1,
0.2009389, 0.307188, 1.22633, 0, 0.5607843, 1, 1,
0.2054917, 1.696367, -0.4041197, 0, 0.5568628, 1, 1,
0.2074466, 0.1003513, 0.867583, 0, 0.5490196, 1, 1,
0.2141758, 1.65377, -0.6626951, 0, 0.5450981, 1, 1,
0.2144948, -0.7899588, 2.649737, 0, 0.5372549, 1, 1,
0.2191233, 0.9829235, 1.037286, 0, 0.5333334, 1, 1,
0.2223833, 0.3287924, 0.1444411, 0, 0.5254902, 1, 1,
0.2243603, -0.6155187, 2.977354, 0, 0.5215687, 1, 1,
0.2249247, -1.125697, 2.088826, 0, 0.5137255, 1, 1,
0.229027, 0.2074227, 0.2750357, 0, 0.509804, 1, 1,
0.2307695, 0.3326789, -0.1695141, 0, 0.5019608, 1, 1,
0.232039, 0.4019099, -0.2902401, 0, 0.4941176, 1, 1,
0.2338754, -0.3900056, 3.51482, 0, 0.4901961, 1, 1,
0.2340078, -0.4633645, 3.325453, 0, 0.4823529, 1, 1,
0.2406796, 1.626014, 0.09680615, 0, 0.4784314, 1, 1,
0.2407984, -0.5105075, 0.9526271, 0, 0.4705882, 1, 1,
0.2429256, 1.129024, 0.6782396, 0, 0.4666667, 1, 1,
0.2433026, -1.909868, 5.191622, 0, 0.4588235, 1, 1,
0.2459791, 0.6540213, 0.07428513, 0, 0.454902, 1, 1,
0.2577026, -2.025682, 1.787296, 0, 0.4470588, 1, 1,
0.2618961, 0.1078686, 1.901034, 0, 0.4431373, 1, 1,
0.2635352, -0.1217514, 1.533127, 0, 0.4352941, 1, 1,
0.2653467, 1.59865, 0.9169304, 0, 0.4313726, 1, 1,
0.2656333, 0.3191964, 0.009487243, 0, 0.4235294, 1, 1,
0.2656807, 0.7815011, 1.678518, 0, 0.4196078, 1, 1,
0.2657423, -1.050472, 2.943536, 0, 0.4117647, 1, 1,
0.2663195, -2.076169, 3.844464, 0, 0.4078431, 1, 1,
0.2692914, 2.141776, 0.0690982, 0, 0.4, 1, 1,
0.2723739, 0.6294368, 1.121604, 0, 0.3921569, 1, 1,
0.2747429, 0.6185132, 0.4761771, 0, 0.3882353, 1, 1,
0.2793633, -1.362118, 3.448629, 0, 0.3803922, 1, 1,
0.2806463, -0.4915155, 4.082644, 0, 0.3764706, 1, 1,
0.2849557, -0.4474288, 2.01379, 0, 0.3686275, 1, 1,
0.2901921, 0.9786682, -0.07277505, 0, 0.3647059, 1, 1,
0.2914873, -1.011363, 4.408765, 0, 0.3568628, 1, 1,
0.2920635, -0.4615866, 1.710408, 0, 0.3529412, 1, 1,
0.2937312, -1.026049, 4.778731, 0, 0.345098, 1, 1,
0.2986965, 0.0009067722, 0.899048, 0, 0.3411765, 1, 1,
0.2996662, -0.299854, 3.110187, 0, 0.3333333, 1, 1,
0.2997068, 0.02214308, 0.1811664, 0, 0.3294118, 1, 1,
0.2998283, 0.2929017, 1.200304, 0, 0.3215686, 1, 1,
0.2999624, 2.250004, -0.3769641, 0, 0.3176471, 1, 1,
0.30158, -1.456733, 4.083724, 0, 0.3098039, 1, 1,
0.3039703, 0.6475883, 2.035944, 0, 0.3058824, 1, 1,
0.3039839, -1.095569, 1.189031, 0, 0.2980392, 1, 1,
0.3053298, -0.6790825, 2.977611, 0, 0.2901961, 1, 1,
0.3078792, -1.489465, 2.430813, 0, 0.2862745, 1, 1,
0.30938, -1.071494, 2.268457, 0, 0.2784314, 1, 1,
0.3145324, -0.5017423, 1.510186, 0, 0.2745098, 1, 1,
0.315925, -0.8305004, 2.154389, 0, 0.2666667, 1, 1,
0.3174996, 0.7953677, 1.46932, 0, 0.2627451, 1, 1,
0.3231162, 0.3329111, 1.667917, 0, 0.254902, 1, 1,
0.3248703, 0.4865582, -1.415303, 0, 0.2509804, 1, 1,
0.3299179, 0.8520613, 1.205745, 0, 0.2431373, 1, 1,
0.3310193, -2.309315, 2.677942, 0, 0.2392157, 1, 1,
0.3408141, -0.1325229, 2.27911, 0, 0.2313726, 1, 1,
0.3429769, -0.9585217, 3.69842, 0, 0.227451, 1, 1,
0.3452739, -0.5274345, 3.23608, 0, 0.2196078, 1, 1,
0.3452911, -1.239669, 3.824914, 0, 0.2156863, 1, 1,
0.3463444, -1.882129, 2.219153, 0, 0.2078431, 1, 1,
0.3612, -0.8663626, 3.177382, 0, 0.2039216, 1, 1,
0.3617225, 0.5722144, 0.8297364, 0, 0.1960784, 1, 1,
0.3618635, 0.8758738, -0.5982029, 0, 0.1882353, 1, 1,
0.3621889, -1.469528, 2.901694, 0, 0.1843137, 1, 1,
0.3631159, -1.05793, 2.41898, 0, 0.1764706, 1, 1,
0.3639523, -0.4588875, 1.846213, 0, 0.172549, 1, 1,
0.3684482, 0.7457583, 0.4171283, 0, 0.1647059, 1, 1,
0.3739734, 1.667953, -1.552859, 0, 0.1607843, 1, 1,
0.3745407, -0.05340421, 0.2680664, 0, 0.1529412, 1, 1,
0.3781741, -0.8422818, 3.984004, 0, 0.1490196, 1, 1,
0.381474, -0.08329304, 3.534831, 0, 0.1411765, 1, 1,
0.3830428, 1.184314, -0.8903285, 0, 0.1372549, 1, 1,
0.3868583, 0.1518527, -0.03621539, 0, 0.1294118, 1, 1,
0.3882202, -0.04437179, 1.659238, 0, 0.1254902, 1, 1,
0.3886338, 0.4929603, -0.1579228, 0, 0.1176471, 1, 1,
0.3887091, 1.335943, 1.658596, 0, 0.1137255, 1, 1,
0.3903905, -0.3236473, 4.531712, 0, 0.1058824, 1, 1,
0.3936693, 0.04546415, 1.882136, 0, 0.09803922, 1, 1,
0.396742, 0.5992376, 1.143407, 0, 0.09411765, 1, 1,
0.3989334, -1.904145, 2.784161, 0, 0.08627451, 1, 1,
0.4003791, -2.509987, 3.323322, 0, 0.08235294, 1, 1,
0.4027207, -0.2118307, 2.090387, 0, 0.07450981, 1, 1,
0.4043325, -0.8154334, 2.910759, 0, 0.07058824, 1, 1,
0.4048226, -0.2534473, 2.273766, 0, 0.0627451, 1, 1,
0.4055009, -0.2087058, 1.961057, 0, 0.05882353, 1, 1,
0.4065924, -0.4263919, 4.593281, 0, 0.05098039, 1, 1,
0.4128486, -0.9743146, 3.19879, 0, 0.04705882, 1, 1,
0.4129497, -0.104301, 1.948062, 0, 0.03921569, 1, 1,
0.4139905, 0.05616467, 2.761956, 0, 0.03529412, 1, 1,
0.4193478, 1.223581, 0.2610241, 0, 0.02745098, 1, 1,
0.4215403, -0.5317741, 2.277992, 0, 0.02352941, 1, 1,
0.4258664, -0.1600908, 1.866141, 0, 0.01568628, 1, 1,
0.4268024, 0.1216514, 2.031432, 0, 0.01176471, 1, 1,
0.4288521, -1.25996, 2.440812, 0, 0.003921569, 1, 1,
0.4307277, -1.93644, 2.080314, 0.003921569, 0, 1, 1,
0.4331468, -0.4625585, 2.799749, 0.007843138, 0, 1, 1,
0.4348687, 0.2398546, 0.6720817, 0.01568628, 0, 1, 1,
0.4349383, 0.1220262, 1.389014, 0.01960784, 0, 1, 1,
0.4384029, 0.1136613, 2.555764, 0.02745098, 0, 1, 1,
0.4418071, 0.6176571, 0.390245, 0.03137255, 0, 1, 1,
0.4476631, -0.57123, 3.097083, 0.03921569, 0, 1, 1,
0.4479308, 0.02938529, 0.2424459, 0.04313726, 0, 1, 1,
0.4490615, 0.8356888, 0.4478743, 0.05098039, 0, 1, 1,
0.4531997, -1.529114, 0.8610725, 0.05490196, 0, 1, 1,
0.4533191, -0.1047694, 0.7344255, 0.0627451, 0, 1, 1,
0.4542699, 2.162402, -1.284984, 0.06666667, 0, 1, 1,
0.4611105, 1.924686, 0.0597246, 0.07450981, 0, 1, 1,
0.4613377, -0.2975092, 0.8971443, 0.07843138, 0, 1, 1,
0.4623047, -0.5291013, 2.966423, 0.08627451, 0, 1, 1,
0.462475, -0.2035366, 1.995116, 0.09019608, 0, 1, 1,
0.4634967, 1.042509, 0.3742225, 0.09803922, 0, 1, 1,
0.4676563, 0.08359678, 1.656789, 0.1058824, 0, 1, 1,
0.4734607, -0.4212555, 1.315839, 0.1098039, 0, 1, 1,
0.4779795, 2.146504, -0.1583819, 0.1176471, 0, 1, 1,
0.4788555, 0.5083632, -0.9692351, 0.1215686, 0, 1, 1,
0.4927532, 1.623156, 0.974376, 0.1294118, 0, 1, 1,
0.4951226, -1.357833, 3.510894, 0.1333333, 0, 1, 1,
0.5009847, -0.6029037, 4.045915, 0.1411765, 0, 1, 1,
0.5010383, -2.158627, 2.959213, 0.145098, 0, 1, 1,
0.5127009, 1.223034, 0.6470304, 0.1529412, 0, 1, 1,
0.5129351, -0.6379166, 2.263844, 0.1568628, 0, 1, 1,
0.5130105, 1.123638, 0.03344773, 0.1647059, 0, 1, 1,
0.5211676, 1.108988, 0.980112, 0.1686275, 0, 1, 1,
0.521306, -0.01283962, 2.658066, 0.1764706, 0, 1, 1,
0.5378777, 0.8560143, 3.267577, 0.1803922, 0, 1, 1,
0.5400292, -1.001878, 4.140617, 0.1882353, 0, 1, 1,
0.542169, -2.314503, 4.111375, 0.1921569, 0, 1, 1,
0.5429079, -0.9319763, 2.035837, 0.2, 0, 1, 1,
0.5444081, 0.7248023, 0.2288558, 0.2078431, 0, 1, 1,
0.545027, 0.01841032, -0.07168009, 0.2117647, 0, 1, 1,
0.553428, 0.4542091, 1.060963, 0.2196078, 0, 1, 1,
0.5560669, 0.4371529, -0.8776505, 0.2235294, 0, 1, 1,
0.5575318, 0.197734, -0.1515848, 0.2313726, 0, 1, 1,
0.5625639, 1.580006, -0.4556254, 0.2352941, 0, 1, 1,
0.5627247, 0.7293384, 0.4885168, 0.2431373, 0, 1, 1,
0.5658848, -0.07691522, 1.398136, 0.2470588, 0, 1, 1,
0.5673558, 2.155044, -1.750423, 0.254902, 0, 1, 1,
0.56853, 0.02724379, 0.7281163, 0.2588235, 0, 1, 1,
0.5700809, -0.1831824, 1.487946, 0.2666667, 0, 1, 1,
0.5738284, 1.518799, 1.107151, 0.2705882, 0, 1, 1,
0.5764643, -0.2677346, 1.242893, 0.2784314, 0, 1, 1,
0.5772342, -0.4907998, 1.851326, 0.282353, 0, 1, 1,
0.5802656, -0.159033, 1.326391, 0.2901961, 0, 1, 1,
0.5849961, 0.1319145, 2.684654, 0.2941177, 0, 1, 1,
0.5884448, -1.013456, 2.575126, 0.3019608, 0, 1, 1,
0.5906817, -1.480224, 2.296864, 0.3098039, 0, 1, 1,
0.5952165, 0.2264182, 2.213443, 0.3137255, 0, 1, 1,
0.5958061, 0.07491712, 0.5941861, 0.3215686, 0, 1, 1,
0.5960698, 0.7215086, 2.03796, 0.3254902, 0, 1, 1,
0.5997506, -0.9549388, 3.385704, 0.3333333, 0, 1, 1,
0.6036846, 0.6453078, 1.101502, 0.3372549, 0, 1, 1,
0.6074074, -0.3420907, 3.129733, 0.345098, 0, 1, 1,
0.6082617, -0.505742, 2.236339, 0.3490196, 0, 1, 1,
0.6133962, -1.375145, 4.042083, 0.3568628, 0, 1, 1,
0.6135988, 1.306999, -0.9944507, 0.3607843, 0, 1, 1,
0.6243377, -0.1449114, 3.127341, 0.3686275, 0, 1, 1,
0.6267024, -1.606204, 2.228745, 0.372549, 0, 1, 1,
0.6292484, -0.03397476, 3.986476, 0.3803922, 0, 1, 1,
0.6298766, -0.7416731, 0.5663857, 0.3843137, 0, 1, 1,
0.6411458, -0.9299452, 1.393572, 0.3921569, 0, 1, 1,
0.6458161, 0.7929689, 0.9187034, 0.3960784, 0, 1, 1,
0.6459272, -0.4244712, 1.176672, 0.4039216, 0, 1, 1,
0.6475736, 1.325047, 1.295406, 0.4117647, 0, 1, 1,
0.6475977, 0.1483108, 1.995937, 0.4156863, 0, 1, 1,
0.6487096, -0.6262895, 2.548536, 0.4235294, 0, 1, 1,
0.6541132, -0.3508932, 0.6888587, 0.427451, 0, 1, 1,
0.6584074, 0.6635754, -0.9702685, 0.4352941, 0, 1, 1,
0.6608589, -1.192573, 2.85187, 0.4392157, 0, 1, 1,
0.6611097, 0.4088426, 2.154902, 0.4470588, 0, 1, 1,
0.6651275, 0.6785607, -0.8884184, 0.4509804, 0, 1, 1,
0.6698086, 0.06209701, 3.136927, 0.4588235, 0, 1, 1,
0.6720134, 0.1227035, 2.871992, 0.4627451, 0, 1, 1,
0.6751711, 2.305257, 1.629826, 0.4705882, 0, 1, 1,
0.676676, 0.7204501, 0.3959851, 0.4745098, 0, 1, 1,
0.6799105, 0.1966505, 2.198447, 0.4823529, 0, 1, 1,
0.6865879, 0.5085433, 1.807054, 0.4862745, 0, 1, 1,
0.6905685, -0.5859848, 3.430273, 0.4941176, 0, 1, 1,
0.6933797, -0.4446753, 1.419076, 0.5019608, 0, 1, 1,
0.6946284, 1.394303, 2.231518, 0.5058824, 0, 1, 1,
0.6982697, 1.07018, 1.108905, 0.5137255, 0, 1, 1,
0.7133896, 0.3899845, -0.404492, 0.5176471, 0, 1, 1,
0.7154983, 0.7365904, 1.075652, 0.5254902, 0, 1, 1,
0.7207841, -1.630949, 3.848778, 0.5294118, 0, 1, 1,
0.7208334, 0.7316089, 0.1371421, 0.5372549, 0, 1, 1,
0.7209468, 1.339407, 1.427089, 0.5411765, 0, 1, 1,
0.7294629, 0.5498159, 0.4736732, 0.5490196, 0, 1, 1,
0.7307713, -0.1939485, 2.013598, 0.5529412, 0, 1, 1,
0.7310317, 0.1230246, 1.023172, 0.5607843, 0, 1, 1,
0.7310867, -1.117201, 3.182471, 0.5647059, 0, 1, 1,
0.734087, 0.1224326, 1.087259, 0.572549, 0, 1, 1,
0.7365962, -1.091923, 1.697394, 0.5764706, 0, 1, 1,
0.7402649, -0.6019918, 3.65195, 0.5843138, 0, 1, 1,
0.7422496, -0.1863613, 1.332582, 0.5882353, 0, 1, 1,
0.7429211, -0.9621785, 1.974759, 0.5960785, 0, 1, 1,
0.7473465, -2.235312, 3.600345, 0.6039216, 0, 1, 1,
0.7517465, -0.3528429, 1.672622, 0.6078432, 0, 1, 1,
0.7530032, -1.922509, 3.808746, 0.6156863, 0, 1, 1,
0.754367, 2.034495, 0.617448, 0.6196079, 0, 1, 1,
0.7552229, -1.677655, 2.897305, 0.627451, 0, 1, 1,
0.7575985, 0.2118946, 0.03811341, 0.6313726, 0, 1, 1,
0.7579498, -1.177994, 2.657005, 0.6392157, 0, 1, 1,
0.7605401, 0.8018173, 0.4868974, 0.6431373, 0, 1, 1,
0.7607415, 1.953902, 0.4376418, 0.6509804, 0, 1, 1,
0.7643499, 0.03535303, 1.73533, 0.654902, 0, 1, 1,
0.7678768, -0.6741446, 2.392845, 0.6627451, 0, 1, 1,
0.7700092, -0.4837312, 2.601397, 0.6666667, 0, 1, 1,
0.775773, -0.3298094, 0.3688455, 0.6745098, 0, 1, 1,
0.776392, -0.9419619, 2.297591, 0.6784314, 0, 1, 1,
0.7781281, 1.120799, 0.08733644, 0.6862745, 0, 1, 1,
0.7820513, 0.4818279, 0.2052832, 0.6901961, 0, 1, 1,
0.7825771, 0.04515119, 1.143633, 0.6980392, 0, 1, 1,
0.7861421, 0.7723331, 1.050605, 0.7058824, 0, 1, 1,
0.7906938, -1.864614, 1.776737, 0.7098039, 0, 1, 1,
0.7949052, -0.1716861, 0.5650094, 0.7176471, 0, 1, 1,
0.8024902, 0.7304567, -0.006504436, 0.7215686, 0, 1, 1,
0.8054497, 0.6390554, 1.270886, 0.7294118, 0, 1, 1,
0.8101357, -0.6595474, 1.475639, 0.7333333, 0, 1, 1,
0.816238, 0.6174241, 1.280883, 0.7411765, 0, 1, 1,
0.8181906, -0.5518171, 2.675907, 0.7450981, 0, 1, 1,
0.8311418, -0.9094365, 1.606622, 0.7529412, 0, 1, 1,
0.83223, 0.08513049, 3.730907, 0.7568628, 0, 1, 1,
0.8333978, -0.8099465, 2.442968, 0.7647059, 0, 1, 1,
0.8347564, 0.02272687, 0.8147731, 0.7686275, 0, 1, 1,
0.8361528, -0.4085866, 1.949972, 0.7764706, 0, 1, 1,
0.8389096, 0.3351481, 1.776288, 0.7803922, 0, 1, 1,
0.8408197, -1.15047, 4.333347, 0.7882353, 0, 1, 1,
0.8478892, 0.8110801, -0.09089996, 0.7921569, 0, 1, 1,
0.8497442, -1.315264, 2.827075, 0.8, 0, 1, 1,
0.8543302, -1.845014, 1.918625, 0.8078431, 0, 1, 1,
0.8546273, 1.443113, 0.6888674, 0.8117647, 0, 1, 1,
0.855562, 0.5977583, 1.999123, 0.8196079, 0, 1, 1,
0.8588201, -0.7576117, 3.967362, 0.8235294, 0, 1, 1,
0.8646705, -1.288836, -0.07827862, 0.8313726, 0, 1, 1,
0.8664384, 2.195033, 1.466078, 0.8352941, 0, 1, 1,
0.868363, -0.204181, 1.607582, 0.8431373, 0, 1, 1,
0.8684244, -1.283781, 4.818634, 0.8470588, 0, 1, 1,
0.8701303, 1.189104, -0.2457583, 0.854902, 0, 1, 1,
0.8784688, -0.1760907, 1.563053, 0.8588235, 0, 1, 1,
0.886016, -0.6849073, 2.444186, 0.8666667, 0, 1, 1,
0.8869774, -0.9844287, 1.193765, 0.8705882, 0, 1, 1,
0.8882049, -1.141415, 1.819857, 0.8784314, 0, 1, 1,
0.8910038, 0.6141758, -0.6487665, 0.8823529, 0, 1, 1,
0.894944, -0.3258954, 1.543064, 0.8901961, 0, 1, 1,
0.8967551, 1.07053, 1.270036, 0.8941177, 0, 1, 1,
0.9079664, -0.433083, 1.636538, 0.9019608, 0, 1, 1,
0.9102237, 0.6494841, 0.6550818, 0.9098039, 0, 1, 1,
0.9127524, -0.09171203, 2.163689, 0.9137255, 0, 1, 1,
0.9162256, 0.09596553, 0.7307174, 0.9215686, 0, 1, 1,
0.9168237, 0.3230652, -0.276308, 0.9254902, 0, 1, 1,
0.9187442, 1.349437, -1.466211, 0.9333333, 0, 1, 1,
0.9309214, -1.231998, 2.746873, 0.9372549, 0, 1, 1,
0.934833, 1.969901, 3.237997, 0.945098, 0, 1, 1,
0.9444892, 0.7865683, 1.706262, 0.9490196, 0, 1, 1,
0.9501359, 0.5714828, 1.350248, 0.9568627, 0, 1, 1,
0.961113, 0.9305484, 3.246612, 0.9607843, 0, 1, 1,
0.9695921, 0.7241068, -0.7032757, 0.9686275, 0, 1, 1,
0.9696531, 1.241058, -0.9506764, 0.972549, 0, 1, 1,
0.9702173, -1.186051, 2.407502, 0.9803922, 0, 1, 1,
0.9714879, 0.3105665, 0.487714, 0.9843137, 0, 1, 1,
0.9822334, -0.4655434, 1.693238, 0.9921569, 0, 1, 1,
0.9837028, 1.700542, -1.607245, 0.9960784, 0, 1, 1,
0.9874486, -1.323907, 2.774504, 1, 0, 0.9960784, 1,
0.9933368, -0.5098954, 0.7957101, 1, 0, 0.9882353, 1,
0.9953068, -1.140049, 1.13017, 1, 0, 0.9843137, 1,
1.001351, -0.762531, 2.483977, 1, 0, 0.9764706, 1,
1.004893, -0.3499047, 1.354265, 1, 0, 0.972549, 1,
1.006405, -0.4604599, 2.791735, 1, 0, 0.9647059, 1,
1.008221, 1.095143, 0.1991574, 1, 0, 0.9607843, 1,
1.01542, -1.61306, 1.853278, 1, 0, 0.9529412, 1,
1.025708, -0.06721048, 2.463404, 1, 0, 0.9490196, 1,
1.031584, 0.6216184, -0.05694778, 1, 0, 0.9411765, 1,
1.042452, -0.2340943, 2.339811, 1, 0, 0.9372549, 1,
1.051735, 0.766941, 2.362161, 1, 0, 0.9294118, 1,
1.052673, 0.8427548, 0.1505892, 1, 0, 0.9254902, 1,
1.052787, 1.349532, -0.9569861, 1, 0, 0.9176471, 1,
1.065804, -0.5219777, 3.007467, 1, 0, 0.9137255, 1,
1.076283, -0.6465893, 2.768838, 1, 0, 0.9058824, 1,
1.077221, 0.313747, 1.51566, 1, 0, 0.9019608, 1,
1.078536, -0.5957415, 1.391314, 1, 0, 0.8941177, 1,
1.082725, -0.04042747, 2.145771, 1, 0, 0.8862745, 1,
1.091333, 0.4954834, 2.764654, 1, 0, 0.8823529, 1,
1.098743, -0.8626019, 1.183978, 1, 0, 0.8745098, 1,
1.103917, 0.05500941, 1.389561, 1, 0, 0.8705882, 1,
1.104266, -0.249882, 1.402811, 1, 0, 0.8627451, 1,
1.107577, -0.8384848, 0.3451003, 1, 0, 0.8588235, 1,
1.112757, 0.6941519, -0.2265023, 1, 0, 0.8509804, 1,
1.113273, -0.7940658, 3.131106, 1, 0, 0.8470588, 1,
1.119854, -0.7956429, 2.512373, 1, 0, 0.8392157, 1,
1.122853, 1.130203, 0.1634694, 1, 0, 0.8352941, 1,
1.128298, 0.9863155, -0.2722748, 1, 0, 0.827451, 1,
1.140631, 1.237611, 0.3817298, 1, 0, 0.8235294, 1,
1.141119, 0.1150096, 1.887026, 1, 0, 0.8156863, 1,
1.143385, -0.3543156, 1.994071, 1, 0, 0.8117647, 1,
1.148576, 0.2678835, 1.062886, 1, 0, 0.8039216, 1,
1.15402, -0.1465842, 0.9388026, 1, 0, 0.7960784, 1,
1.15974, 0.7498655, 1.474282, 1, 0, 0.7921569, 1,
1.164521, -0.3531522, 2.61386, 1, 0, 0.7843137, 1,
1.165066, 0.8396088, -0.04100678, 1, 0, 0.7803922, 1,
1.168674, 2.288075, 0.1880716, 1, 0, 0.772549, 1,
1.177607, -1.237243, 2.543442, 1, 0, 0.7686275, 1,
1.185748, -0.3691984, 1.697346, 1, 0, 0.7607843, 1,
1.197711, -0.4504506, 2.540655, 1, 0, 0.7568628, 1,
1.20052, 0.1356526, 1.922615, 1, 0, 0.7490196, 1,
1.204, -0.7663908, 4.030309, 1, 0, 0.7450981, 1,
1.207068, 0.381921, 0.5465598, 1, 0, 0.7372549, 1,
1.211594, 0.7276412, -0.271429, 1, 0, 0.7333333, 1,
1.220801, 0.9905996, 1.729661, 1, 0, 0.7254902, 1,
1.224257, 0.5808879, 0.9444075, 1, 0, 0.7215686, 1,
1.2274, -0.5588585, 3.214435, 1, 0, 0.7137255, 1,
1.233079, -1.51321, 4.152171, 1, 0, 0.7098039, 1,
1.235476, 0.4375879, 2.025687, 1, 0, 0.7019608, 1,
1.246176, -0.6371487, 2.225253, 1, 0, 0.6941177, 1,
1.255866, 1.161419, 0.1657555, 1, 0, 0.6901961, 1,
1.260327, -0.9502679, 2.052437, 1, 0, 0.682353, 1,
1.2642, -1.227482, 2.439716, 1, 0, 0.6784314, 1,
1.266935, -0.08609446, 1.571108, 1, 0, 0.6705883, 1,
1.269801, -2.037619, 1.956734, 1, 0, 0.6666667, 1,
1.274075, -0.4301084, 2.002132, 1, 0, 0.6588235, 1,
1.281245, -0.7751935, 2.814305, 1, 0, 0.654902, 1,
1.285183, -1.454226, 1.325082, 1, 0, 0.6470588, 1,
1.291185, -0.1630258, 2.125245, 1, 0, 0.6431373, 1,
1.291877, 0.8310233, 1.672551, 1, 0, 0.6352941, 1,
1.306432, 0.07222552, 1.782788, 1, 0, 0.6313726, 1,
1.313084, -0.08934218, 2.653925, 1, 0, 0.6235294, 1,
1.324813, 0.03275605, 1.175785, 1, 0, 0.6196079, 1,
1.331756, 0.3029967, 3.483156, 1, 0, 0.6117647, 1,
1.345364, 1.413054, 3.076234, 1, 0, 0.6078432, 1,
1.347806, -0.5672209, 1.626219, 1, 0, 0.6, 1,
1.349052, -0.9774524, 2.117851, 1, 0, 0.5921569, 1,
1.350283, 1.430837, -0.6402419, 1, 0, 0.5882353, 1,
1.355209, -0.2192175, 1.699628, 1, 0, 0.5803922, 1,
1.360132, -1.057131, 2.996125, 1, 0, 0.5764706, 1,
1.362199, -0.8618239, 2.207206, 1, 0, 0.5686275, 1,
1.376933, 0.5587019, 1.317646, 1, 0, 0.5647059, 1,
1.379087, -1.273655, 1.184205, 1, 0, 0.5568628, 1,
1.381158, -0.907631, 3.406563, 1, 0, 0.5529412, 1,
1.407974, 0.7621661, -0.7973153, 1, 0, 0.5450981, 1,
1.414075, -0.1954158, 1.708679, 1, 0, 0.5411765, 1,
1.418733, 1.509206, 0.9023387, 1, 0, 0.5333334, 1,
1.420163, 0.9627396, 2.559683, 1, 0, 0.5294118, 1,
1.430901, 0.5586941, 0.9109274, 1, 0, 0.5215687, 1,
1.432678, 0.5463925, 0.4264744, 1, 0, 0.5176471, 1,
1.433431, 0.6971795, 2.666818, 1, 0, 0.509804, 1,
1.436079, 1.161493, 0.7424249, 1, 0, 0.5058824, 1,
1.437006, -0.3714007, 2.845222, 1, 0, 0.4980392, 1,
1.44326, 0.9445607, 1.130887, 1, 0, 0.4901961, 1,
1.445623, 0.3274394, -0.4485062, 1, 0, 0.4862745, 1,
1.447176, -1.759699, 1.381643, 1, 0, 0.4784314, 1,
1.448477, -0.5550453, 0.2820588, 1, 0, 0.4745098, 1,
1.461945, -0.3007999, 0.7404261, 1, 0, 0.4666667, 1,
1.463119, 1.83166, 0.9382835, 1, 0, 0.4627451, 1,
1.467945, -0.4061928, 0.2621795, 1, 0, 0.454902, 1,
1.476659, 0.9588795, 1.567181, 1, 0, 0.4509804, 1,
1.489826, 0.5234895, 1.302331, 1, 0, 0.4431373, 1,
1.516081, 0.8605011, 1.691054, 1, 0, 0.4392157, 1,
1.530762, -0.9924506, 1.140727, 1, 0, 0.4313726, 1,
1.531139, 0.5389839, -0.3207349, 1, 0, 0.427451, 1,
1.539716, -0.4367318, 2.4457, 1, 0, 0.4196078, 1,
1.552951, 0.2009825, 2.010906, 1, 0, 0.4156863, 1,
1.555809, -1.069083, 1.138241, 1, 0, 0.4078431, 1,
1.560628, 0.7916082, 0.1647286, 1, 0, 0.4039216, 1,
1.568272, 0.4410869, -0.3119158, 1, 0, 0.3960784, 1,
1.568846, -1.677417, 1.040515, 1, 0, 0.3882353, 1,
1.583158, -1.319873, 3.116925, 1, 0, 0.3843137, 1,
1.585298, -0.98782, 1.879591, 1, 0, 0.3764706, 1,
1.585873, -0.3141661, -0.138557, 1, 0, 0.372549, 1,
1.599909, 0.5661874, 1.615219, 1, 0, 0.3647059, 1,
1.601008, -1.777174, 2.838196, 1, 0, 0.3607843, 1,
1.604616, 0.02946926, 0.4697159, 1, 0, 0.3529412, 1,
1.605582, 0.1691906, 1.771611, 1, 0, 0.3490196, 1,
1.617723, 0.4093523, 1.150194, 1, 0, 0.3411765, 1,
1.621123, 0.4960651, 0.975186, 1, 0, 0.3372549, 1,
1.623776, -1.246632, 2.200463, 1, 0, 0.3294118, 1,
1.628673, -0.7076463, 1.918508, 1, 0, 0.3254902, 1,
1.628934, -1.018676, 2.954044, 1, 0, 0.3176471, 1,
1.648081, 0.6666437, 1.77418, 1, 0, 0.3137255, 1,
1.66305, -0.7193851, 0.6738563, 1, 0, 0.3058824, 1,
1.663384, 0.4201063, 0.9878066, 1, 0, 0.2980392, 1,
1.669977, 0.4920435, 1.957429, 1, 0, 0.2941177, 1,
1.671694, 1.6262, 1.48609, 1, 0, 0.2862745, 1,
1.675697, -0.8565564, 0.9064339, 1, 0, 0.282353, 1,
1.679422, -0.9655954, 1.037136, 1, 0, 0.2745098, 1,
1.68571, 0.7670784, 1.861961, 1, 0, 0.2705882, 1,
1.704736, 0.6795072, 0.2221892, 1, 0, 0.2627451, 1,
1.70749, 1.871293, 1.717841, 1, 0, 0.2588235, 1,
1.713971, 0.9193992, 2.603213, 1, 0, 0.2509804, 1,
1.726192, 0.2358866, 1.300599, 1, 0, 0.2470588, 1,
1.737017, 0.3935392, 2.591838, 1, 0, 0.2392157, 1,
1.747087, 1.422409, 4.207786, 1, 0, 0.2352941, 1,
1.759503, 1.051405, 0.9594477, 1, 0, 0.227451, 1,
1.782195, -0.4854839, 1.634175, 1, 0, 0.2235294, 1,
1.783703, 2.143286, 3.359899, 1, 0, 0.2156863, 1,
1.787572, 0.1257576, 0.7905922, 1, 0, 0.2117647, 1,
1.805582, -0.856337, 0.4349393, 1, 0, 0.2039216, 1,
1.819216, 0.4773977, 1.389826, 1, 0, 0.1960784, 1,
1.821197, -0.1525339, 1.643307, 1, 0, 0.1921569, 1,
1.824464, 0.6459051, 3.08039, 1, 0, 0.1843137, 1,
1.84655, 0.8893143, 0.5680918, 1, 0, 0.1803922, 1,
1.86433, 2.080072, 0.7414466, 1, 0, 0.172549, 1,
1.886087, 0.7663032, 1.50045, 1, 0, 0.1686275, 1,
1.918497, 0.5511486, 0.6943792, 1, 0, 0.1607843, 1,
1.924683, 0.04472318, 0.5119483, 1, 0, 0.1568628, 1,
1.936, 0.3124377, 0.6831102, 1, 0, 0.1490196, 1,
1.944187, -0.2467714, 2.086947, 1, 0, 0.145098, 1,
1.953026, -0.5090611, 0.2263329, 1, 0, 0.1372549, 1,
1.957289, -1.834292, 3.533391, 1, 0, 0.1333333, 1,
1.959561, -0.2365649, 3.275491, 1, 0, 0.1254902, 1,
1.975793, 0.09168989, 2.832756, 1, 0, 0.1215686, 1,
1.987977, -1.937221, 3.163823, 1, 0, 0.1137255, 1,
1.999693, 0.1507565, 0.4079519, 1, 0, 0.1098039, 1,
2.019609, -0.9589223, -0.3215164, 1, 0, 0.1019608, 1,
2.021334, -0.5966401, 1.726602, 1, 0, 0.09411765, 1,
2.028788, 0.09870966, 1.118816, 1, 0, 0.09019608, 1,
2.038722, 1.431607, 0.7962105, 1, 0, 0.08235294, 1,
2.052735, 0.2281487, 1.82102, 1, 0, 0.07843138, 1,
2.085437, 1.030444, 2.041275, 1, 0, 0.07058824, 1,
2.135433, -0.2210778, 2.880022, 1, 0, 0.06666667, 1,
2.148075, -1.9168, 3.276148, 1, 0, 0.05882353, 1,
2.154689, -1.393608, 2.058007, 1, 0, 0.05490196, 1,
2.282403, 0.3032374, 0.7055771, 1, 0, 0.04705882, 1,
2.289717, -0.6286699, 2.19418, 1, 0, 0.04313726, 1,
2.328701, 1.37852, -0.9673389, 1, 0, 0.03529412, 1,
2.337424, -0.3868107, 3.380485, 1, 0, 0.03137255, 1,
2.398046, 0.3240095, 2.166836, 1, 0, 0.02352941, 1,
2.429872, 1.966854, -0.6757706, 1, 0, 0.01960784, 1,
2.430355, 0.512076, 2.012181, 1, 0, 0.01176471, 1,
2.507545, 0.3159844, 1.186917, 1, 0, 0.007843138, 1
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
-0.1464833, -4.151194, -7.690797, 0, -0.5, 0.5, 0.5,
-0.1464833, -4.151194, -7.690797, 1, -0.5, 0.5, 0.5,
-0.1464833, -4.151194, -7.690797, 1, 1.5, 0.5, 0.5,
-0.1464833, -4.151194, -7.690797, 0, 1.5, 0.5, 0.5
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
-3.700228, -0.1562512, -7.690797, 0, -0.5, 0.5, 0.5,
-3.700228, -0.1562512, -7.690797, 1, -0.5, 0.5, 0.5,
-3.700228, -0.1562512, -7.690797, 1, 1.5, 0.5, 0.5,
-3.700228, -0.1562512, -7.690797, 0, 1.5, 0.5, 0.5
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
-3.700228, -4.151194, -0.3160393, 0, -0.5, 0.5, 0.5,
-3.700228, -4.151194, -0.3160393, 1, -0.5, 0.5, 0.5,
-3.700228, -4.151194, -0.3160393, 1, 1.5, 0.5, 0.5,
-3.700228, -4.151194, -0.3160393, 0, 1.5, 0.5, 0.5
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
-2, -3.229284, -5.98893,
2, -3.229284, -5.98893,
-2, -3.229284, -5.98893,
-2, -3.382935, -6.272575,
-1, -3.229284, -5.98893,
-1, -3.382935, -6.272575,
0, -3.229284, -5.98893,
0, -3.382935, -6.272575,
1, -3.229284, -5.98893,
1, -3.382935, -6.272575,
2, -3.229284, -5.98893,
2, -3.382935, -6.272575
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
-2, -3.690238, -6.839864, 0, -0.5, 0.5, 0.5,
-2, -3.690238, -6.839864, 1, -0.5, 0.5, 0.5,
-2, -3.690238, -6.839864, 1, 1.5, 0.5, 0.5,
-2, -3.690238, -6.839864, 0, 1.5, 0.5, 0.5,
-1, -3.690238, -6.839864, 0, -0.5, 0.5, 0.5,
-1, -3.690238, -6.839864, 1, -0.5, 0.5, 0.5,
-1, -3.690238, -6.839864, 1, 1.5, 0.5, 0.5,
-1, -3.690238, -6.839864, 0, 1.5, 0.5, 0.5,
0, -3.690238, -6.839864, 0, -0.5, 0.5, 0.5,
0, -3.690238, -6.839864, 1, -0.5, 0.5, 0.5,
0, -3.690238, -6.839864, 1, 1.5, 0.5, 0.5,
0, -3.690238, -6.839864, 0, 1.5, 0.5, 0.5,
1, -3.690238, -6.839864, 0, -0.5, 0.5, 0.5,
1, -3.690238, -6.839864, 1, -0.5, 0.5, 0.5,
1, -3.690238, -6.839864, 1, 1.5, 0.5, 0.5,
1, -3.690238, -6.839864, 0, 1.5, 0.5, 0.5,
2, -3.690238, -6.839864, 0, -0.5, 0.5, 0.5,
2, -3.690238, -6.839864, 1, -0.5, 0.5, 0.5,
2, -3.690238, -6.839864, 1, 1.5, 0.5, 0.5,
2, -3.690238, -6.839864, 0, 1.5, 0.5, 0.5
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
-2.880133, -3, -5.98893,
-2.880133, 2, -5.98893,
-2.880133, -3, -5.98893,
-3.016815, -3, -6.272575,
-2.880133, -2, -5.98893,
-3.016815, -2, -6.272575,
-2.880133, -1, -5.98893,
-3.016815, -1, -6.272575,
-2.880133, 0, -5.98893,
-3.016815, 0, -6.272575,
-2.880133, 1, -5.98893,
-3.016815, 1, -6.272575,
-2.880133, 2, -5.98893,
-3.016815, 2, -6.272575
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
-3.29018, -3, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, -3, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, -3, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, -3, -6.839864, 0, 1.5, 0.5, 0.5,
-3.29018, -2, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, -2, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, -2, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, -2, -6.839864, 0, 1.5, 0.5, 0.5,
-3.29018, -1, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, -1, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, -1, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, -1, -6.839864, 0, 1.5, 0.5, 0.5,
-3.29018, 0, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, 0, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, 0, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, 0, -6.839864, 0, 1.5, 0.5, 0.5,
-3.29018, 1, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, 1, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, 1, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, 1, -6.839864, 0, 1.5, 0.5, 0.5,
-3.29018, 2, -6.839864, 0, -0.5, 0.5, 0.5,
-3.29018, 2, -6.839864, 1, -0.5, 0.5, 0.5,
-3.29018, 2, -6.839864, 1, 1.5, 0.5, 0.5,
-3.29018, 2, -6.839864, 0, 1.5, 0.5, 0.5
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
-2.880133, -3.229284, -4,
-2.880133, -3.229284, 4,
-2.880133, -3.229284, -4,
-3.016815, -3.382935, -4,
-2.880133, -3.229284, -2,
-3.016815, -3.382935, -2,
-2.880133, -3.229284, 0,
-3.016815, -3.382935, 0,
-2.880133, -3.229284, 2,
-3.016815, -3.382935, 2,
-2.880133, -3.229284, 4,
-3.016815, -3.382935, 4
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
-3.29018, -3.690238, -4, 0, -0.5, 0.5, 0.5,
-3.29018, -3.690238, -4, 1, -0.5, 0.5, 0.5,
-3.29018, -3.690238, -4, 1, 1.5, 0.5, 0.5,
-3.29018, -3.690238, -4, 0, 1.5, 0.5, 0.5,
-3.29018, -3.690238, -2, 0, -0.5, 0.5, 0.5,
-3.29018, -3.690238, -2, 1, -0.5, 0.5, 0.5,
-3.29018, -3.690238, -2, 1, 1.5, 0.5, 0.5,
-3.29018, -3.690238, -2, 0, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 0, 0, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 0, 1, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 0, 1, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 0, 0, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 2, 0, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 2, 1, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 2, 1, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 2, 0, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 4, 0, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 4, 1, -0.5, 0.5, 0.5,
-3.29018, -3.690238, 4, 1, 1.5, 0.5, 0.5,
-3.29018, -3.690238, 4, 0, 1.5, 0.5, 0.5
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
-2.880133, -3.229284, -5.98893,
-2.880133, 2.916781, -5.98893,
-2.880133, -3.229284, 5.356852,
-2.880133, 2.916781, 5.356852,
-2.880133, -3.229284, -5.98893,
-2.880133, -3.229284, 5.356852,
-2.880133, 2.916781, -5.98893,
-2.880133, 2.916781, 5.356852,
-2.880133, -3.229284, -5.98893,
2.587166, -3.229284, -5.98893,
-2.880133, -3.229284, 5.356852,
2.587166, -3.229284, 5.356852,
-2.880133, 2.916781, -5.98893,
2.587166, 2.916781, -5.98893,
-2.880133, 2.916781, 5.356852,
2.587166, 2.916781, 5.356852,
2.587166, -3.229284, -5.98893,
2.587166, 2.916781, -5.98893,
2.587166, -3.229284, 5.356852,
2.587166, 2.916781, 5.356852,
2.587166, -3.229284, -5.98893,
2.587166, -3.229284, 5.356852,
2.587166, 2.916781, -5.98893,
2.587166, 2.916781, 5.356852
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
var radius = 7.483205;
var distance = 33.29362;
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
mvMatrix.translate( 0.1464833, 0.1562512, 0.3160393 );
mvMatrix.scale( 1.479887, 1.31645, 0.7131274 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29362);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


