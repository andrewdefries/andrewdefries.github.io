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
-2.849973, -1.613663, -2.618854, 1, 0, 0, 1,
-2.837438, -0.5970691, 0.07127495, 1, 0.007843138, 0, 1,
-2.732475, 0.2628906, -0.1379797, 1, 0.01176471, 0, 1,
-2.543122, -0.3620255, -4.109098, 1, 0.01960784, 0, 1,
-2.534019, 0.0223956, -3.067902, 1, 0.02352941, 0, 1,
-2.455325, 0.01652221, -1.021947, 1, 0.03137255, 0, 1,
-2.311195, -0.4992125, -0.7099202, 1, 0.03529412, 0, 1,
-2.267923, -1.248629, -3.183837, 1, 0.04313726, 0, 1,
-2.25803, 1.228868, -1.418765, 1, 0.04705882, 0, 1,
-2.221406, 0.3363486, -2.427197, 1, 0.05490196, 0, 1,
-2.202294, 0.3659875, -0.8884796, 1, 0.05882353, 0, 1,
-2.160856, 0.6973599, -1.262827, 1, 0.06666667, 0, 1,
-2.127366, -0.5302561, -1.406027, 1, 0.07058824, 0, 1,
-2.110875, 0.4162269, -0.6602089, 1, 0.07843138, 0, 1,
-2.081827, -0.4554542, -1.48084, 1, 0.08235294, 0, 1,
-2.053215, -0.7815106, -1.788123, 1, 0.09019608, 0, 1,
-2.042578, 0.4408178, -1.43048, 1, 0.09411765, 0, 1,
-1.950066, -0.389201, -3.964134, 1, 0.1019608, 0, 1,
-1.937683, 1.710534, -1.051195, 1, 0.1098039, 0, 1,
-1.93543, -0.8180599, -2.749319, 1, 0.1137255, 0, 1,
-1.933878, 1.462742, -1.109423, 1, 0.1215686, 0, 1,
-1.900735, -0.4807276, 0.09922196, 1, 0.1254902, 0, 1,
-1.892368, -0.7391784, -2.599397, 1, 0.1333333, 0, 1,
-1.84448, -1.813938, -1.752727, 1, 0.1372549, 0, 1,
-1.836922, 0.7789564, -1.55851, 1, 0.145098, 0, 1,
-1.817953, -0.8979601, -1.904459, 1, 0.1490196, 0, 1,
-1.799903, -0.5417876, -1.337134, 1, 0.1568628, 0, 1,
-1.775527, 0.3411451, -0.7543174, 1, 0.1607843, 0, 1,
-1.775159, 1.350357, -1.553059, 1, 0.1686275, 0, 1,
-1.756942, 1.080395, -1.58118, 1, 0.172549, 0, 1,
-1.72537, 0.9051859, -2.437218, 1, 0.1803922, 0, 1,
-1.721347, -0.9038794, -0.1798706, 1, 0.1843137, 0, 1,
-1.712725, -1.266871, -3.990111, 1, 0.1921569, 0, 1,
-1.706849, 0.02565561, -2.767205, 1, 0.1960784, 0, 1,
-1.670859, 1.111114, -0.9192719, 1, 0.2039216, 0, 1,
-1.661887, 2.054299, 0.6912913, 1, 0.2117647, 0, 1,
-1.644551, -0.9795715, -1.992766, 1, 0.2156863, 0, 1,
-1.643294, -0.5927443, -3.250005, 1, 0.2235294, 0, 1,
-1.628544, -0.334895, -3.18039, 1, 0.227451, 0, 1,
-1.620435, 0.7793447, -2.131583, 1, 0.2352941, 0, 1,
-1.615328, 1.3682, -1.416381, 1, 0.2392157, 0, 1,
-1.602962, 0.1169568, -1.702897, 1, 0.2470588, 0, 1,
-1.584571, 0.8616838, -0.005087551, 1, 0.2509804, 0, 1,
-1.581988, -1.552551, -1.641721, 1, 0.2588235, 0, 1,
-1.556843, -0.3935995, -0.4826381, 1, 0.2627451, 0, 1,
-1.541996, 0.1926793, -1.402715, 1, 0.2705882, 0, 1,
-1.520265, 1.475271, -1.628469, 1, 0.2745098, 0, 1,
-1.519668, 0.738507, -1.914462, 1, 0.282353, 0, 1,
-1.510989, 0.5386472, -1.335709, 1, 0.2862745, 0, 1,
-1.507977, 1.076593, -1.782351, 1, 0.2941177, 0, 1,
-1.507885, 1.055716, -1.441839, 1, 0.3019608, 0, 1,
-1.47833, -1.155482, -1.638037, 1, 0.3058824, 0, 1,
-1.47313, -0.1868446, -1.846687, 1, 0.3137255, 0, 1,
-1.468806, -0.8546233, -1.840516, 1, 0.3176471, 0, 1,
-1.457338, -0.6880836, -3.475307, 1, 0.3254902, 0, 1,
-1.446406, -0.460602, -2.250096, 1, 0.3294118, 0, 1,
-1.434641, 0.4450877, -1.966435, 1, 0.3372549, 0, 1,
-1.434333, 0.2382524, -1.224342, 1, 0.3411765, 0, 1,
-1.428249, 0.6403803, -1.041128, 1, 0.3490196, 0, 1,
-1.426857, -1.603994, -1.321874, 1, 0.3529412, 0, 1,
-1.414265, -0.471198, -2.837254, 1, 0.3607843, 0, 1,
-1.409786, -0.7540578, -3.020582, 1, 0.3647059, 0, 1,
-1.408422, 1.207984, -2.023707, 1, 0.372549, 0, 1,
-1.407595, -0.6764634, -0.7826439, 1, 0.3764706, 0, 1,
-1.400866, -0.2211123, -1.2233, 1, 0.3843137, 0, 1,
-1.38877, 0.0924807, -1.137581, 1, 0.3882353, 0, 1,
-1.388161, 0.856035, -2.72211, 1, 0.3960784, 0, 1,
-1.38055, -1.357136, -2.174307, 1, 0.4039216, 0, 1,
-1.376489, -1.13321, -3.880662, 1, 0.4078431, 0, 1,
-1.374473, 0.623564, -0.2349023, 1, 0.4156863, 0, 1,
-1.364022, -0.4644457, -1.36211, 1, 0.4196078, 0, 1,
-1.357039, 0.04752298, 0.1567419, 1, 0.427451, 0, 1,
-1.355362, -0.4811208, -2.399387, 1, 0.4313726, 0, 1,
-1.352527, -0.7841753, -2.87541, 1, 0.4392157, 0, 1,
-1.348772, 1.76461, -0.6451722, 1, 0.4431373, 0, 1,
-1.337312, 0.2591051, -1.748352, 1, 0.4509804, 0, 1,
-1.330562, 0.09148403, -2.422027, 1, 0.454902, 0, 1,
-1.328952, -0.07308894, -1.258757, 1, 0.4627451, 0, 1,
-1.328015, 1.116404, -0.3547747, 1, 0.4666667, 0, 1,
-1.326743, 1.94508, -0.6533039, 1, 0.4745098, 0, 1,
-1.326194, 0.6169062, -0.7182841, 1, 0.4784314, 0, 1,
-1.316876, 0.8653113, -0.7690226, 1, 0.4862745, 0, 1,
-1.298644, 0.1009759, -1.775609, 1, 0.4901961, 0, 1,
-1.291202, -0.004822727, -2.561054, 1, 0.4980392, 0, 1,
-1.291186, 2.357519, 0.2504699, 1, 0.5058824, 0, 1,
-1.271776, 0.9238702, -2.054173, 1, 0.509804, 0, 1,
-1.265297, -0.6091186, -3.095742, 1, 0.5176471, 0, 1,
-1.258622, -1.152121, -5.283084, 1, 0.5215687, 0, 1,
-1.252942, -0.09097015, -2.886369, 1, 0.5294118, 0, 1,
-1.252088, -0.5550196, -3.366135, 1, 0.5333334, 0, 1,
-1.24438, 2.857454, -1.45507, 1, 0.5411765, 0, 1,
-1.234515, -1.842655, -3.497509, 1, 0.5450981, 0, 1,
-1.233671, -1.315132, -1.631428, 1, 0.5529412, 0, 1,
-1.225485, -1.685584, -1.897086, 1, 0.5568628, 0, 1,
-1.222057, 0.5324535, -2.567172, 1, 0.5647059, 0, 1,
-1.216825, 1.171016, -2.18975, 1, 0.5686275, 0, 1,
-1.211238, 0.9227788, -1.166153, 1, 0.5764706, 0, 1,
-1.210337, 1.654538, -0.1718951, 1, 0.5803922, 0, 1,
-1.204023, 0.9145693, 1.033553, 1, 0.5882353, 0, 1,
-1.197014, 1.589907, -1.292943, 1, 0.5921569, 0, 1,
-1.195892, 1.221875, -0.1580328, 1, 0.6, 0, 1,
-1.186651, -0.7656164, -1.30937, 1, 0.6078432, 0, 1,
-1.181691, -1.354432, -3.115224, 1, 0.6117647, 0, 1,
-1.181422, 1.166993, -1.074235, 1, 0.6196079, 0, 1,
-1.172212, -1.772271, -3.067095, 1, 0.6235294, 0, 1,
-1.167205, 0.111954, -1.47626, 1, 0.6313726, 0, 1,
-1.154652, 0.1439057, -2.669547, 1, 0.6352941, 0, 1,
-1.153628, -1.226442, -2.411286, 1, 0.6431373, 0, 1,
-1.150285, 1.573615, -0.2136235, 1, 0.6470588, 0, 1,
-1.144372, 0.4761701, -1.350763, 1, 0.654902, 0, 1,
-1.14258, -1.595092, -0.2144987, 1, 0.6588235, 0, 1,
-1.128712, 1.596673, -0.7315712, 1, 0.6666667, 0, 1,
-1.126178, -0.6529641, -1.384135, 1, 0.6705883, 0, 1,
-1.118711, -0.3237859, -2.762363, 1, 0.6784314, 0, 1,
-1.116984, 1.056344, -0.5523492, 1, 0.682353, 0, 1,
-1.11133, 1.289574, -0.6460485, 1, 0.6901961, 0, 1,
-1.07853, -0.02507354, -2.540934, 1, 0.6941177, 0, 1,
-1.077761, -2.065117, -1.665395, 1, 0.7019608, 0, 1,
-1.065318, -1.082834, -2.454309, 1, 0.7098039, 0, 1,
-1.058795, -0.9075233, -0.261034, 1, 0.7137255, 0, 1,
-1.057079, -0.9993758, -0.1679464, 1, 0.7215686, 0, 1,
-1.056554, -0.5778183, -3.731095, 1, 0.7254902, 0, 1,
-1.051863, 0.999328, -0.7304549, 1, 0.7333333, 0, 1,
-1.05086, 0.261288, -0.3600054, 1, 0.7372549, 0, 1,
-1.048741, -1.008804, -2.820824, 1, 0.7450981, 0, 1,
-1.040746, 1.036541, -1.54611, 1, 0.7490196, 0, 1,
-1.029845, 0.6557463, -1.830092, 1, 0.7568628, 0, 1,
-1.022667, 0.5021944, -2.013344, 1, 0.7607843, 0, 1,
-1.021382, 0.8511242, -0.02828314, 1, 0.7686275, 0, 1,
-1.019322, 1.545816, -1.367617, 1, 0.772549, 0, 1,
-1.014793, 0.5902352, -1.629409, 1, 0.7803922, 0, 1,
-1.013941, -1.564094, -2.335102, 1, 0.7843137, 0, 1,
-1.001557, -0.6930057, -3.046564, 1, 0.7921569, 0, 1,
-1.001452, 1.784384, -2.498651, 1, 0.7960784, 0, 1,
-0.9998648, -0.3178368, -1.704613, 1, 0.8039216, 0, 1,
-0.9976479, -0.6885417, -2.798921, 1, 0.8117647, 0, 1,
-0.9921117, 0.08178481, -2.08758, 1, 0.8156863, 0, 1,
-0.9918596, 0.9944113, -1.386248, 1, 0.8235294, 0, 1,
-0.9911988, -0.3272263, -2.052184, 1, 0.827451, 0, 1,
-0.9907237, 0.9971744, -0.06185376, 1, 0.8352941, 0, 1,
-0.9902134, -0.1750698, -1.37736, 1, 0.8392157, 0, 1,
-0.988295, -1.298253, -2.966346, 1, 0.8470588, 0, 1,
-0.9800836, -0.7370418, -3.810426, 1, 0.8509804, 0, 1,
-0.9795444, -0.03942261, -1.351413, 1, 0.8588235, 0, 1,
-0.9793987, 0.999034, -0.9909673, 1, 0.8627451, 0, 1,
-0.9733452, -0.2623417, -2.653315, 1, 0.8705882, 0, 1,
-0.9618002, 1.227453, -0.5226858, 1, 0.8745098, 0, 1,
-0.955419, 0.4235514, -1.203025, 1, 0.8823529, 0, 1,
-0.9518969, -0.8532231, -3.068354, 1, 0.8862745, 0, 1,
-0.9507612, 0.8864014, -1.83695, 1, 0.8941177, 0, 1,
-0.9490964, -0.8556097, -2.165237, 1, 0.8980392, 0, 1,
-0.9430138, -0.1444816, -3.458392, 1, 0.9058824, 0, 1,
-0.938659, 0.2297828, -1.087278, 1, 0.9137255, 0, 1,
-0.9380293, -0.4915916, -1.880776, 1, 0.9176471, 0, 1,
-0.9326204, 0.7350077, -2.03764, 1, 0.9254902, 0, 1,
-0.9190555, 0.6477996, -2.020666, 1, 0.9294118, 0, 1,
-0.9173333, -0.6239244, -3.04954, 1, 0.9372549, 0, 1,
-0.9162763, 1.084142, 0.04806702, 1, 0.9411765, 0, 1,
-0.9137207, -1.228059, -3.189469, 1, 0.9490196, 0, 1,
-0.9018427, 0.01466763, -1.166391, 1, 0.9529412, 0, 1,
-0.8938606, 0.7631097, -2.252227, 1, 0.9607843, 0, 1,
-0.8864734, 0.1905535, -0.03715325, 1, 0.9647059, 0, 1,
-0.8862612, 0.5327497, -0.5672624, 1, 0.972549, 0, 1,
-0.8850155, -1.839541, -2.623497, 1, 0.9764706, 0, 1,
-0.8808945, 0.3158196, 0.3984753, 1, 0.9843137, 0, 1,
-0.8782223, -1.13857, -1.863875, 1, 0.9882353, 0, 1,
-0.872259, -1.013775, -1.216313, 1, 0.9960784, 0, 1,
-0.871097, 1.650788, -2.478074, 0.9960784, 1, 0, 1,
-0.8683682, -2.161836, -1.870662, 0.9921569, 1, 0, 1,
-0.8656378, -0.06737779, -1.272489, 0.9843137, 1, 0, 1,
-0.8613902, 0.05179837, -1.941806, 0.9803922, 1, 0, 1,
-0.860944, 1.497869, -3.424615, 0.972549, 1, 0, 1,
-0.8557425, 0.426372, -1.105909, 0.9686275, 1, 0, 1,
-0.8503398, 1.129862, 1.05445, 0.9607843, 1, 0, 1,
-0.8458594, 0.794436, -0.6779784, 0.9568627, 1, 0, 1,
-0.8387132, 0.01696727, -2.579572, 0.9490196, 1, 0, 1,
-0.8383275, -1.253403, -2.782024, 0.945098, 1, 0, 1,
-0.8365539, -0.5216205, -1.798823, 0.9372549, 1, 0, 1,
-0.8266915, 0.04266371, -3.087749, 0.9333333, 1, 0, 1,
-0.8239671, 0.5350795, -0.5066527, 0.9254902, 1, 0, 1,
-0.8191447, 0.06126956, 0.07147194, 0.9215686, 1, 0, 1,
-0.8190113, 0.2660557, -0.8291124, 0.9137255, 1, 0, 1,
-0.8155906, 1.184428, -0.6084788, 0.9098039, 1, 0, 1,
-0.8153831, 0.7041852, -1.160339, 0.9019608, 1, 0, 1,
-0.8147722, -0.4868405, -2.175364, 0.8941177, 1, 0, 1,
-0.80885, -0.2603773, -2.397932, 0.8901961, 1, 0, 1,
-0.8065236, 0.6173, -1.787072, 0.8823529, 1, 0, 1,
-0.805009, -0.2246011, -2.653381, 0.8784314, 1, 0, 1,
-0.8040423, -0.5727234, -1.019521, 0.8705882, 1, 0, 1,
-0.7881356, -1.397538, -3.05224, 0.8666667, 1, 0, 1,
-0.7859362, -1.146365, -0.9591594, 0.8588235, 1, 0, 1,
-0.7810009, 0.3924602, -1.324338, 0.854902, 1, 0, 1,
-0.7778147, 0.1416885, -0.9253001, 0.8470588, 1, 0, 1,
-0.7751169, 0.9620271, -1.24395, 0.8431373, 1, 0, 1,
-0.7655886, -0.775287, -2.233195, 0.8352941, 1, 0, 1,
-0.7586449, 0.3032312, -1.980207, 0.8313726, 1, 0, 1,
-0.7562696, 0.2916587, -2.039179, 0.8235294, 1, 0, 1,
-0.7522461, 0.6371733, -1.771827, 0.8196079, 1, 0, 1,
-0.7508788, 0.5659178, 1.017893, 0.8117647, 1, 0, 1,
-0.7461372, -0.675341, -1.705204, 0.8078431, 1, 0, 1,
-0.745144, -1.498088, -1.074771, 0.8, 1, 0, 1,
-0.7413312, 0.5317691, -1.763147, 0.7921569, 1, 0, 1,
-0.7396644, -0.350331, -1.967437, 0.7882353, 1, 0, 1,
-0.7396238, 0.7833138, 0.4393111, 0.7803922, 1, 0, 1,
-0.7382175, -0.1568971, -1.433715, 0.7764706, 1, 0, 1,
-0.7378584, 1.897688, -0.6621288, 0.7686275, 1, 0, 1,
-0.7369527, -0.353242, -2.370006, 0.7647059, 1, 0, 1,
-0.7352406, -0.01259833, -1.046964, 0.7568628, 1, 0, 1,
-0.7341471, -1.741012, -3.103481, 0.7529412, 1, 0, 1,
-0.7284505, -0.8101099, -1.855746, 0.7450981, 1, 0, 1,
-0.7277661, -0.1152636, -1.314901, 0.7411765, 1, 0, 1,
-0.7272931, -0.3574756, -2.566736, 0.7333333, 1, 0, 1,
-0.7205406, 1.831637, -1.27935, 0.7294118, 1, 0, 1,
-0.712197, -1.192367, -2.044949, 0.7215686, 1, 0, 1,
-0.7103804, 0.5791168, -1.128697, 0.7176471, 1, 0, 1,
-0.7097312, -2.087989, -3.69763, 0.7098039, 1, 0, 1,
-0.7072112, 0.327652, -0.290365, 0.7058824, 1, 0, 1,
-0.706143, -1.192099, -3.942434, 0.6980392, 1, 0, 1,
-0.7027758, -0.2014069, -0.8142158, 0.6901961, 1, 0, 1,
-0.6988803, -0.159041, -0.7939244, 0.6862745, 1, 0, 1,
-0.6959795, -0.4475253, -3.025054, 0.6784314, 1, 0, 1,
-0.6937564, 0.3677167, -1.796455, 0.6745098, 1, 0, 1,
-0.6892969, 1.14918, 0.5290753, 0.6666667, 1, 0, 1,
-0.6887041, 0.2895076, -0.1233871, 0.6627451, 1, 0, 1,
-0.6811418, 1.813727, -0.3460541, 0.654902, 1, 0, 1,
-0.6787164, -0.3696728, -1.176208, 0.6509804, 1, 0, 1,
-0.6743761, 0.5347006, -0.4796041, 0.6431373, 1, 0, 1,
-0.6728066, -0.4295767, -1.113321, 0.6392157, 1, 0, 1,
-0.6690719, 0.550829, -0.4830862, 0.6313726, 1, 0, 1,
-0.6581713, 0.3686418, -0.04794206, 0.627451, 1, 0, 1,
-0.6521071, -0.8091838, -1.05718, 0.6196079, 1, 0, 1,
-0.6449184, 0.2772865, -1.665761, 0.6156863, 1, 0, 1,
-0.6444432, 0.6071426, -1.412025, 0.6078432, 1, 0, 1,
-0.6443642, -0.5143758, -0.7274501, 0.6039216, 1, 0, 1,
-0.643192, 0.01594448, -0.6152576, 0.5960785, 1, 0, 1,
-0.6425768, -0.6215426, -2.406685, 0.5882353, 1, 0, 1,
-0.6420326, -2.139958, -4.371993, 0.5843138, 1, 0, 1,
-0.6352621, -0.2112312, -3.038884, 0.5764706, 1, 0, 1,
-0.6329315, -0.5087923, -2.319333, 0.572549, 1, 0, 1,
-0.6322013, 0.6049134, 0.3019453, 0.5647059, 1, 0, 1,
-0.6315447, -0.04901779, -1.754038, 0.5607843, 1, 0, 1,
-0.6246328, -0.04342924, -3.794829, 0.5529412, 1, 0, 1,
-0.6240106, -0.1952943, -1.763968, 0.5490196, 1, 0, 1,
-0.6187705, -0.166701, -2.179491, 0.5411765, 1, 0, 1,
-0.618607, 1.578694, 1.050191, 0.5372549, 1, 0, 1,
-0.6160231, 0.6705402, -3.019828, 0.5294118, 1, 0, 1,
-0.6152613, -0.0854717, -0.706093, 0.5254902, 1, 0, 1,
-0.6124906, 0.7739319, -1.09652, 0.5176471, 1, 0, 1,
-0.6088196, 1.286927, -1.001769, 0.5137255, 1, 0, 1,
-0.6087754, 0.7806053, -0.76474, 0.5058824, 1, 0, 1,
-0.5962598, 1.184423, 1.464442, 0.5019608, 1, 0, 1,
-0.5962039, -0.3600847, -2.158501, 0.4941176, 1, 0, 1,
-0.5955827, -0.5217581, -4.400424, 0.4862745, 1, 0, 1,
-0.5941958, -0.1579261, -3.908982, 0.4823529, 1, 0, 1,
-0.5933603, -0.7535915, -2.609241, 0.4745098, 1, 0, 1,
-0.5896173, 0.3899707, -1.179903, 0.4705882, 1, 0, 1,
-0.5807388, -0.4404925, -1.181466, 0.4627451, 1, 0, 1,
-0.5799477, 1.451338, 0.5918399, 0.4588235, 1, 0, 1,
-0.576498, -1.950059, -0.2384467, 0.4509804, 1, 0, 1,
-0.5737656, 2.125613, -0.4032956, 0.4470588, 1, 0, 1,
-0.5707955, 1.764635, 0.5337095, 0.4392157, 1, 0, 1,
-0.5689523, 1.287394, 0.405806, 0.4352941, 1, 0, 1,
-0.568134, -0.1054631, 0.3865111, 0.427451, 1, 0, 1,
-0.5679454, 0.9184389, -0.5710692, 0.4235294, 1, 0, 1,
-0.5604213, -0.5552, -3.546693, 0.4156863, 1, 0, 1,
-0.5581357, 1.115551, 0.9592478, 0.4117647, 1, 0, 1,
-0.5509334, 0.768376, 0.1025829, 0.4039216, 1, 0, 1,
-0.5487058, -1.773779, -1.648691, 0.3960784, 1, 0, 1,
-0.5428768, 0.8983245, -2.141789, 0.3921569, 1, 0, 1,
-0.5378992, 0.4174586, 0.5573285, 0.3843137, 1, 0, 1,
-0.5308405, -0.5660072, -2.548803, 0.3803922, 1, 0, 1,
-0.5305315, 2.316947, -1.212135, 0.372549, 1, 0, 1,
-0.5168461, 1.503784, -0.252136, 0.3686275, 1, 0, 1,
-0.5163483, -0.1560197, -3.673444, 0.3607843, 1, 0, 1,
-0.5162653, 1.946193, 1.118233, 0.3568628, 1, 0, 1,
-0.5148923, 0.5950052, 1.014065, 0.3490196, 1, 0, 1,
-0.5114306, 0.4184073, 0.1493532, 0.345098, 1, 0, 1,
-0.5088982, -0.5291986, -2.408635, 0.3372549, 1, 0, 1,
-0.5080055, -1.66962, -2.897893, 0.3333333, 1, 0, 1,
-0.5031609, -1.530839, -3.130384, 0.3254902, 1, 0, 1,
-0.4948115, 0.3055822, -1.33119, 0.3215686, 1, 0, 1,
-0.493571, -0.06375297, -2.949214, 0.3137255, 1, 0, 1,
-0.4935401, -0.1441451, -1.864941, 0.3098039, 1, 0, 1,
-0.4905866, 1.065221, -0.3067988, 0.3019608, 1, 0, 1,
-0.4895149, 1.267093, -1.808332, 0.2941177, 1, 0, 1,
-0.489212, 0.4876837, -2.092886, 0.2901961, 1, 0, 1,
-0.4877051, -0.07935956, -1.046559, 0.282353, 1, 0, 1,
-0.4841388, 0.3408372, -0.4626225, 0.2784314, 1, 0, 1,
-0.4830855, 1.64244, -0.3417501, 0.2705882, 1, 0, 1,
-0.4785668, -0.08641048, -1.674493, 0.2666667, 1, 0, 1,
-0.4749991, 0.9130973, -1.45349, 0.2588235, 1, 0, 1,
-0.4726508, -1.801887, -2.802654, 0.254902, 1, 0, 1,
-0.468913, -0.1396016, -3.098532, 0.2470588, 1, 0, 1,
-0.4639044, -0.5856586, -2.625528, 0.2431373, 1, 0, 1,
-0.4631841, -1.385237, -2.985863, 0.2352941, 1, 0, 1,
-0.4620456, -0.7929836, -3.962071, 0.2313726, 1, 0, 1,
-0.4601112, -0.2143681, -4.47514, 0.2235294, 1, 0, 1,
-0.4597504, 0.564877, -0.5132519, 0.2196078, 1, 0, 1,
-0.4577118, 0.6978557, 0.6184662, 0.2117647, 1, 0, 1,
-0.4574613, -0.189807, -1.47009, 0.2078431, 1, 0, 1,
-0.4563921, 0.6753475, -0.5839716, 0.2, 1, 0, 1,
-0.4559516, -0.7942172, -2.116641, 0.1921569, 1, 0, 1,
-0.4556105, 2.872064, -1.286444, 0.1882353, 1, 0, 1,
-0.4554878, -2.271269, -2.585118, 0.1803922, 1, 0, 1,
-0.4531291, -1.693969, -1.459932, 0.1764706, 1, 0, 1,
-0.4505295, -1.781338, -2.823675, 0.1686275, 1, 0, 1,
-0.4479213, -0.6057421, -2.397283, 0.1647059, 1, 0, 1,
-0.4358539, -0.8031954, -1.109844, 0.1568628, 1, 0, 1,
-0.4336174, -2.806408, -1.955564, 0.1529412, 1, 0, 1,
-0.4325215, -1.547145, -2.889929, 0.145098, 1, 0, 1,
-0.4289607, 0.6445328, 0.4784959, 0.1411765, 1, 0, 1,
-0.427105, -1.478225, -2.919351, 0.1333333, 1, 0, 1,
-0.4270948, 2.474406, -2.075679, 0.1294118, 1, 0, 1,
-0.4264687, 2.363071, 0.2679698, 0.1215686, 1, 0, 1,
-0.4238758, 1.646669, -1.638435, 0.1176471, 1, 0, 1,
-0.422005, -2.167376, -3.438433, 0.1098039, 1, 0, 1,
-0.4143322, -0.7199321, -1.823784, 0.1058824, 1, 0, 1,
-0.4139136, 0.9006039, -0.5305375, 0.09803922, 1, 0, 1,
-0.4094698, 1.44455, 0.8401899, 0.09019608, 1, 0, 1,
-0.4090022, 0.7657014, 1.915026, 0.08627451, 1, 0, 1,
-0.4087867, -0.7166021, -1.128946, 0.07843138, 1, 0, 1,
-0.4078235, 1.377141, 0.1698453, 0.07450981, 1, 0, 1,
-0.4042305, -0.4312623, -1.364209, 0.06666667, 1, 0, 1,
-0.3968559, -0.4725404, -3.517837, 0.0627451, 1, 0, 1,
-0.3876592, 0.6612527, 0.707714, 0.05490196, 1, 0, 1,
-0.3842044, 1.241819, -0.1484171, 0.05098039, 1, 0, 1,
-0.3787448, -0.5013134, -2.027901, 0.04313726, 1, 0, 1,
-0.3784958, 0.2435065, -1.058556, 0.03921569, 1, 0, 1,
-0.3776746, -1.359158, -3.807898, 0.03137255, 1, 0, 1,
-0.3686735, 0.2781128, -1.083305, 0.02745098, 1, 0, 1,
-0.3643995, 0.580657, -1.020222, 0.01960784, 1, 0, 1,
-0.3640477, -0.2015163, -1.787321, 0.01568628, 1, 0, 1,
-0.3627599, -0.3099009, -1.682741, 0.007843138, 1, 0, 1,
-0.3615147, 0.7226912, -0.04517509, 0.003921569, 1, 0, 1,
-0.3560944, 0.5809595, 1.401802, 0, 1, 0.003921569, 1,
-0.3524693, 0.2802925, -1.975489, 0, 1, 0.01176471, 1,
-0.3490827, -1.474434, -1.391127, 0, 1, 0.01568628, 1,
-0.3393171, -0.09942793, -2.050466, 0, 1, 0.02352941, 1,
-0.337914, -3.445365, -4.305229, 0, 1, 0.02745098, 1,
-0.3343081, 1.518234, -1.228318, 0, 1, 0.03529412, 1,
-0.3326951, -1.214359, -3.001683, 0, 1, 0.03921569, 1,
-0.3312477, 0.8222891, 2.303484, 0, 1, 0.04705882, 1,
-0.3251209, -1.129644, -1.499682, 0, 1, 0.05098039, 1,
-0.3226997, 1.076594, -0.8861468, 0, 1, 0.05882353, 1,
-0.3217722, 0.4325394, -1.231331, 0, 1, 0.0627451, 1,
-0.3173148, 0.3793567, -1.312307, 0, 1, 0.07058824, 1,
-0.3127699, -1.130356, -4.030612, 0, 1, 0.07450981, 1,
-0.310719, -0.2044359, -1.965862, 0, 1, 0.08235294, 1,
-0.3090318, -1.04118, -3.659714, 0, 1, 0.08627451, 1,
-0.3087035, -0.130262, -2.397588, 0, 1, 0.09411765, 1,
-0.3045942, 0.5229283, -1.02222, 0, 1, 0.1019608, 1,
-0.2990461, -0.2668679, -4.099945, 0, 1, 0.1058824, 1,
-0.2958882, -0.1233292, -2.290058, 0, 1, 0.1137255, 1,
-0.2945661, -0.6819261, -0.6618577, 0, 1, 0.1176471, 1,
-0.2937502, -0.6700822, -1.76521, 0, 1, 0.1254902, 1,
-0.2911558, -0.9210998, -2.689864, 0, 1, 0.1294118, 1,
-0.2814866, 1.314226, -1.225981, 0, 1, 0.1372549, 1,
-0.2729084, 0.8801584, -0.3973234, 0, 1, 0.1411765, 1,
-0.2555543, -0.6227919, -2.704472, 0, 1, 0.1490196, 1,
-0.2550881, -0.04564102, -4.053432, 0, 1, 0.1529412, 1,
-0.254084, 0.4086337, -0.9823244, 0, 1, 0.1607843, 1,
-0.2528473, -0.6789882, -3.134692, 0, 1, 0.1647059, 1,
-0.2444677, -1.350923, -4.008924, 0, 1, 0.172549, 1,
-0.2423475, -0.8381781, -2.972202, 0, 1, 0.1764706, 1,
-0.237791, 2.235797, 0.6998003, 0, 1, 0.1843137, 1,
-0.2334958, 1.324984, 2.20147, 0, 1, 0.1882353, 1,
-0.2312598, -0.1047167, -2.055333, 0, 1, 0.1960784, 1,
-0.2237638, -3.14504, -3.253463, 0, 1, 0.2039216, 1,
-0.2236502, -0.372182, -2.845339, 0, 1, 0.2078431, 1,
-0.2206612, 0.9411083, 0.6231276, 0, 1, 0.2156863, 1,
-0.2183861, 0.5800847, -0.09505461, 0, 1, 0.2196078, 1,
-0.2172708, -0.9560315, -2.702043, 0, 1, 0.227451, 1,
-0.2123716, -0.06454239, -3.341678, 0, 1, 0.2313726, 1,
-0.2093503, -1.4875, -4.109799, 0, 1, 0.2392157, 1,
-0.2090938, -0.5268111, -3.31025, 0, 1, 0.2431373, 1,
-0.2076803, -0.8729321, -2.064605, 0, 1, 0.2509804, 1,
-0.2063194, 2.499311, 0.1923441, 0, 1, 0.254902, 1,
-0.2046195, 0.8940399, 0.8947392, 0, 1, 0.2627451, 1,
-0.2006736, -1.72129, -2.571586, 0, 1, 0.2666667, 1,
-0.1996655, -1.705268, -3.671395, 0, 1, 0.2745098, 1,
-0.1980573, 1.021324, 0.7025053, 0, 1, 0.2784314, 1,
-0.1947463, -0.3523654, -2.455632, 0, 1, 0.2862745, 1,
-0.1895458, -0.1730299, -1.164196, 0, 1, 0.2901961, 1,
-0.1885386, -0.4127001, -1.89831, 0, 1, 0.2980392, 1,
-0.184973, 1.459496, -1.167758, 0, 1, 0.3058824, 1,
-0.1847194, 0.1255289, 0.7003679, 0, 1, 0.3098039, 1,
-0.1818436, 0.1875249, -0.5410637, 0, 1, 0.3176471, 1,
-0.1807138, 0.1832593, -2.004401, 0, 1, 0.3215686, 1,
-0.1775551, -0.4525289, -3.995122, 0, 1, 0.3294118, 1,
-0.1760706, 0.2562544, -0.3169723, 0, 1, 0.3333333, 1,
-0.1756335, 0.7906571, -0.3708991, 0, 1, 0.3411765, 1,
-0.1738747, 0.8372027, -2.828697, 0, 1, 0.345098, 1,
-0.1725088, -1.78121, -2.96753, 0, 1, 0.3529412, 1,
-0.1659466, 0.646323, -0.4718403, 0, 1, 0.3568628, 1,
-0.1624862, 2.407812, -0.2737213, 0, 1, 0.3647059, 1,
-0.1614512, 0.6838256, -1.786046, 0, 1, 0.3686275, 1,
-0.1600378, 1.53982, 0.7814409, 0, 1, 0.3764706, 1,
-0.1589225, 0.5193759, 1.974435, 0, 1, 0.3803922, 1,
-0.154533, -1.049157, -2.197978, 0, 1, 0.3882353, 1,
-0.153874, 2.040327, 0.4285213, 0, 1, 0.3921569, 1,
-0.152424, -1.175989, -3.555259, 0, 1, 0.4, 1,
-0.1469088, 1.702303, -1.430735, 0, 1, 0.4078431, 1,
-0.1460428, 0.135502, 0.1932149, 0, 1, 0.4117647, 1,
-0.1429511, -1.395743, -2.133006, 0, 1, 0.4196078, 1,
-0.1343805, -1.169162, -2.423682, 0, 1, 0.4235294, 1,
-0.1333822, -0.5784171, -2.990805, 0, 1, 0.4313726, 1,
-0.1333613, -0.0117553, -0.3717205, 0, 1, 0.4352941, 1,
-0.1239651, 0.2026804, -2.418419, 0, 1, 0.4431373, 1,
-0.12322, -0.1341451, -1.955024, 0, 1, 0.4470588, 1,
-0.1205145, 0.6577805, -1.182469, 0, 1, 0.454902, 1,
-0.1195869, 0.04062193, 0.4412609, 0, 1, 0.4588235, 1,
-0.1168869, 1.196448, -0.01887484, 0, 1, 0.4666667, 1,
-0.1164897, 1.216083, -2.647765, 0, 1, 0.4705882, 1,
-0.1135563, 0.3079185, -0.966873, 0, 1, 0.4784314, 1,
-0.11228, 0.6083627, 2.123201, 0, 1, 0.4823529, 1,
-0.1119243, 0.8908353, -0.4001394, 0, 1, 0.4901961, 1,
-0.1091272, 0.6816909, -0.5582814, 0, 1, 0.4941176, 1,
-0.1077458, -0.1329942, -0.8559222, 0, 1, 0.5019608, 1,
-0.1053938, 0.526365, -0.8826343, 0, 1, 0.509804, 1,
-0.1051503, -0.3027715, -1.729419, 0, 1, 0.5137255, 1,
-0.1051124, 0.299067, -2.379795, 0, 1, 0.5215687, 1,
-0.1048744, -0.430834, -1.794056, 0, 1, 0.5254902, 1,
-0.104371, -1.689456, -2.885416, 0, 1, 0.5333334, 1,
-0.1038761, 1.14889, -2.794349, 0, 1, 0.5372549, 1,
-0.1024136, 0.7881936, 0.1604608, 0, 1, 0.5450981, 1,
-0.09884329, 1.256493, -1.693143, 0, 1, 0.5490196, 1,
-0.095387, -0.6293707, -2.780057, 0, 1, 0.5568628, 1,
-0.09349618, 0.8462667, -0.291573, 0, 1, 0.5607843, 1,
-0.09161074, -0.9961106, -1.658913, 0, 1, 0.5686275, 1,
-0.08931103, 1.996373, -0.01808754, 0, 1, 0.572549, 1,
-0.08807478, -0.9809778, -1.883261, 0, 1, 0.5803922, 1,
-0.08678681, -1.098853, -2.944221, 0, 1, 0.5843138, 1,
-0.08553073, -0.3486234, -0.8429779, 0, 1, 0.5921569, 1,
-0.08084163, -1.240718, -3.167859, 0, 1, 0.5960785, 1,
-0.07925386, 0.04282051, -0.9223768, 0, 1, 0.6039216, 1,
-0.07916547, -0.5666435, -1.559273, 0, 1, 0.6117647, 1,
-0.07466835, 0.2528449, 1.388796, 0, 1, 0.6156863, 1,
-0.07429606, 0.5901886, -1.105308, 0, 1, 0.6235294, 1,
-0.07106456, 0.03308509, -2.064468, 0, 1, 0.627451, 1,
-0.06810112, 1.144988, -1.132407, 0, 1, 0.6352941, 1,
-0.06577488, 0.8260434, -2.732083, 0, 1, 0.6392157, 1,
-0.06298064, -0.679175, -0.3456206, 0, 1, 0.6470588, 1,
-0.06285824, -0.253999, -4.052629, 0, 1, 0.6509804, 1,
-0.0617355, 0.3003059, 0.2169913, 0, 1, 0.6588235, 1,
-0.06131545, -0.5279469, -3.021323, 0, 1, 0.6627451, 1,
-0.06087082, -1.225723, -4.071569, 0, 1, 0.6705883, 1,
-0.06056208, -0.2127418, -3.03802, 0, 1, 0.6745098, 1,
-0.05347571, -0.4840125, -3.341936, 0, 1, 0.682353, 1,
-0.05234009, -0.09816467, -2.866592, 0, 1, 0.6862745, 1,
-0.05044323, 0.7775298, 0.4772221, 0, 1, 0.6941177, 1,
-0.04989147, 0.6648684, 1.011563, 0, 1, 0.7019608, 1,
-0.04936191, 0.3400404, -0.09353981, 0, 1, 0.7058824, 1,
-0.04841827, -0.6662925, -2.921662, 0, 1, 0.7137255, 1,
-0.04739667, 1.079411, -0.8892024, 0, 1, 0.7176471, 1,
-0.04647725, 1.007244, 1.950854, 0, 1, 0.7254902, 1,
-0.04342596, -0.2421601, -2.428145, 0, 1, 0.7294118, 1,
-0.04098711, -0.5966972, -4.024693, 0, 1, 0.7372549, 1,
-0.03887958, -1.237475, -3.194512, 0, 1, 0.7411765, 1,
-0.03808799, 0.9934164, -0.3967297, 0, 1, 0.7490196, 1,
-0.03705382, -0.7493033, -3.654908, 0, 1, 0.7529412, 1,
-0.03662455, -0.8534791, -3.601731, 0, 1, 0.7607843, 1,
-0.03475507, 0.203629, -0.9657924, 0, 1, 0.7647059, 1,
-0.03307575, 1.421787, 0.3345667, 0, 1, 0.772549, 1,
-0.02823938, 0.577862, 0.05101636, 0, 1, 0.7764706, 1,
-0.02456188, -0.7702525, -4.974872, 0, 1, 0.7843137, 1,
-0.0240514, -0.5408753, -3.965548, 0, 1, 0.7882353, 1,
-0.02099121, -1.275173, -3.82067, 0, 1, 0.7960784, 1,
-0.01930115, 0.5272396, -0.5054748, 0, 1, 0.8039216, 1,
-0.01471701, 0.1143386, 0.3185888, 0, 1, 0.8078431, 1,
-0.01461229, -0.6520023, -3.04754, 0, 1, 0.8156863, 1,
-0.0133311, 0.7207803, 1.902798, 0, 1, 0.8196079, 1,
-0.01236138, 1.267016, -0.06183721, 0, 1, 0.827451, 1,
-0.01184539, 0.8451399, 0.6593037, 0, 1, 0.8313726, 1,
-0.01076618, -1.031516, -3.413146, 0, 1, 0.8392157, 1,
-0.009743509, 1.101175, -1.479795, 0, 1, 0.8431373, 1,
-0.006000009, 1.891775, -0.2863044, 0, 1, 0.8509804, 1,
-0.003471463, 1.207121, -2.085705, 0, 1, 0.854902, 1,
-0.002138106, -0.1298179, -3.604258, 0, 1, 0.8627451, 1,
0.005602032, -0.3100713, 1.494769, 0, 1, 0.8666667, 1,
0.01476718, 2.163285, 0.6365002, 0, 1, 0.8745098, 1,
0.01718687, -1.560145, 3.386117, 0, 1, 0.8784314, 1,
0.01726559, -0.0526541, 0.4673054, 0, 1, 0.8862745, 1,
0.01792024, -0.4694506, 4.316305, 0, 1, 0.8901961, 1,
0.01886834, -0.3658819, 3.65765, 0, 1, 0.8980392, 1,
0.01936536, 0.8189909, -1.061787, 0, 1, 0.9058824, 1,
0.02109575, -0.3509646, 2.504922, 0, 1, 0.9098039, 1,
0.02168955, -0.5087105, 1.638712, 0, 1, 0.9176471, 1,
0.02269643, 0.5788209, 1.021322, 0, 1, 0.9215686, 1,
0.02455907, -0.5195089, 3.173811, 0, 1, 0.9294118, 1,
0.02491296, -1.212167, 3.603705, 0, 1, 0.9333333, 1,
0.02497219, 2.604908, 0.5095015, 0, 1, 0.9411765, 1,
0.02717589, -0.3939934, 1.421978, 0, 1, 0.945098, 1,
0.03205054, 1.22832, 0.536001, 0, 1, 0.9529412, 1,
0.03241225, 0.2323885, 1.53721, 0, 1, 0.9568627, 1,
0.0342296, 0.4222718, -1.784775, 0, 1, 0.9647059, 1,
0.03673624, 0.5378363, -1.334877, 0, 1, 0.9686275, 1,
0.03747879, 0.7675394, 0.2940626, 0, 1, 0.9764706, 1,
0.03988343, 0.2778723, -1.114687, 0, 1, 0.9803922, 1,
0.04129841, 0.341852, -1.076715, 0, 1, 0.9882353, 1,
0.04179317, 0.5407588, -1.051012, 0, 1, 0.9921569, 1,
0.04553616, 2.301042, 0.2221243, 0, 1, 1, 1,
0.04674834, 2.721631, -0.2448693, 0, 0.9921569, 1, 1,
0.05355812, 0.787775, -0.8111755, 0, 0.9882353, 1, 1,
0.05955211, -0.898775, 2.256705, 0, 0.9803922, 1, 1,
0.06008366, 0.6786257, -0.881808, 0, 0.9764706, 1, 1,
0.06151424, 0.2321999, -0.1260552, 0, 0.9686275, 1, 1,
0.06619741, 0.9154636, -0.3967334, 0, 0.9647059, 1, 1,
0.06690217, -1.529763, 3.893248, 0, 0.9568627, 1, 1,
0.06956287, -0.5564603, 1.400299, 0, 0.9529412, 1, 1,
0.07197309, 0.2272024, 0.8318952, 0, 0.945098, 1, 1,
0.07417164, 0.6086202, -0.3021069, 0, 0.9411765, 1, 1,
0.07889586, -0.7644761, 0.9336674, 0, 0.9333333, 1, 1,
0.08174011, 1.416194, -1.488701, 0, 0.9294118, 1, 1,
0.08242718, 1.190819, -0.9170881, 0, 0.9215686, 1, 1,
0.08281242, 0.1726096, 0.43848, 0, 0.9176471, 1, 1,
0.08371635, 1.195501, 0.622426, 0, 0.9098039, 1, 1,
0.08438743, -0.9402149, -0.05786179, 0, 0.9058824, 1, 1,
0.08652818, -0.8779371, 2.317949, 0, 0.8980392, 1, 1,
0.08940283, 0.4159203, -0.9629784, 0, 0.8901961, 1, 1,
0.08994717, -0.5992378, 3.869346, 0, 0.8862745, 1, 1,
0.0900635, 0.4199803, 0.4618372, 0, 0.8784314, 1, 1,
0.09082966, -0.9971049, 2.464963, 0, 0.8745098, 1, 1,
0.09318925, -0.9665171, 4.479284, 0, 0.8666667, 1, 1,
0.09552477, -0.6365508, 3.709815, 0, 0.8627451, 1, 1,
0.09990162, 0.7282599, -1.545141, 0, 0.854902, 1, 1,
0.1022319, 0.491343, 0.7163875, 0, 0.8509804, 1, 1,
0.1026988, -0.03788067, 1.986416, 0, 0.8431373, 1, 1,
0.1041296, -1.061748, 4.33351, 0, 0.8392157, 1, 1,
0.107205, -1.138856, 0.7761379, 0, 0.8313726, 1, 1,
0.108098, -1.767594, 3.922155, 0, 0.827451, 1, 1,
0.1086297, 1.886272, 0.5494888, 0, 0.8196079, 1, 1,
0.1092257, 0.6281527, 0.3914801, 0, 0.8156863, 1, 1,
0.1166391, 0.1089405, 1.187184, 0, 0.8078431, 1, 1,
0.1174164, 0.02204754, 0.8843295, 0, 0.8039216, 1, 1,
0.119234, 1.375989, -0.5422871, 0, 0.7960784, 1, 1,
0.1196105, -0.5917482, 3.121845, 0, 0.7882353, 1, 1,
0.1279826, -0.1776437, 4.163505, 0, 0.7843137, 1, 1,
0.1291959, 0.9522223, -0.1920989, 0, 0.7764706, 1, 1,
0.1297839, -1.396734, 3.381526, 0, 0.772549, 1, 1,
0.1328599, -0.2174723, 1.311188, 0, 0.7647059, 1, 1,
0.1330827, 0.01275547, 1.791161, 0, 0.7607843, 1, 1,
0.1347612, -0.2439896, 1.925115, 0, 0.7529412, 1, 1,
0.1359717, 1.236529, -0.1234473, 0, 0.7490196, 1, 1,
0.1396453, -1.343302, 2.477365, 0, 0.7411765, 1, 1,
0.1405357, 1.17462, 1.122202, 0, 0.7372549, 1, 1,
0.1452893, 0.2142712, 0.8428944, 0, 0.7294118, 1, 1,
0.1507888, 0.1938536, 1.127979, 0, 0.7254902, 1, 1,
0.1519119, 1.93243, -0.5448751, 0, 0.7176471, 1, 1,
0.1536711, -0.7260269, 3.038414, 0, 0.7137255, 1, 1,
0.1539954, 0.04153588, -0.3791344, 0, 0.7058824, 1, 1,
0.1575237, -0.7794693, 3.302807, 0, 0.6980392, 1, 1,
0.1585356, 0.390795, 1.141531, 0, 0.6941177, 1, 1,
0.1589417, 1.157488, -1.187185, 0, 0.6862745, 1, 1,
0.1592358, -0.7857893, 3.331252, 0, 0.682353, 1, 1,
0.1617896, -2.160751, 3.933069, 0, 0.6745098, 1, 1,
0.161807, 0.1736258, -0.4061321, 0, 0.6705883, 1, 1,
0.1675584, 1.456903, -1.174772, 0, 0.6627451, 1, 1,
0.1688937, -0.335604, 2.765185, 0, 0.6588235, 1, 1,
0.1701208, 0.08809949, 1.533248, 0, 0.6509804, 1, 1,
0.1729211, 0.9008865, 1.397964, 0, 0.6470588, 1, 1,
0.1731876, 0.907301, -0.179214, 0, 0.6392157, 1, 1,
0.1774015, -0.6530943, 2.706281, 0, 0.6352941, 1, 1,
0.1797403, 0.6991759, 1.220392, 0, 0.627451, 1, 1,
0.180251, 0.04730425, 0.1709538, 0, 0.6235294, 1, 1,
0.180852, 0.1387199, -1.582876, 0, 0.6156863, 1, 1,
0.1829969, 2.418994, -0.3416356, 0, 0.6117647, 1, 1,
0.1864541, -1.618599, 2.361355, 0, 0.6039216, 1, 1,
0.1881487, -0.5153236, 5.274351, 0, 0.5960785, 1, 1,
0.1942416, -1.434956, 4.062005, 0, 0.5921569, 1, 1,
0.2030838, 0.4735559, -0.8853174, 0, 0.5843138, 1, 1,
0.2041719, 0.9319256, -0.3302266, 0, 0.5803922, 1, 1,
0.2042302, -0.3057345, 2.40131, 0, 0.572549, 1, 1,
0.2079324, 1.107379, 0.5902374, 0, 0.5686275, 1, 1,
0.2106874, -1.732912, 4.710765, 0, 0.5607843, 1, 1,
0.2127172, 0.6402628, 0.02687982, 0, 0.5568628, 1, 1,
0.2157944, -0.1094484, 1.377594, 0, 0.5490196, 1, 1,
0.2163134, 2.002216, -1.83067, 0, 0.5450981, 1, 1,
0.2189785, -0.5512777, 3.479209, 0, 0.5372549, 1, 1,
0.2245493, -0.06614076, 3.12141, 0, 0.5333334, 1, 1,
0.2253084, 0.8243692, 1.345499, 0, 0.5254902, 1, 1,
0.2280459, 0.423415, 2.291392, 0, 0.5215687, 1, 1,
0.2336937, 0.04934612, 1.653795, 0, 0.5137255, 1, 1,
0.23495, 0.6686628, 0.4432267, 0, 0.509804, 1, 1,
0.2350712, 0.9640678, 1.398942, 0, 0.5019608, 1, 1,
0.2390583, -0.6080443, 3.884429, 0, 0.4941176, 1, 1,
0.2393913, -0.03155609, 1.591904, 0, 0.4901961, 1, 1,
0.2413354, -0.7111484, 5.647593, 0, 0.4823529, 1, 1,
0.241596, -0.2606848, 1.688108, 0, 0.4784314, 1, 1,
0.2434467, 0.6561429, -0.4741008, 0, 0.4705882, 1, 1,
0.2456508, -0.7498483, 2.005781, 0, 0.4666667, 1, 1,
0.2526822, 1.423927, 0.3233766, 0, 0.4588235, 1, 1,
0.2532762, 0.5052137, -1.075513, 0, 0.454902, 1, 1,
0.2552817, 2.368228, 1.020386, 0, 0.4470588, 1, 1,
0.2590276, -2.49552, 2.088031, 0, 0.4431373, 1, 1,
0.259165, 1.637799, -0.03444029, 0, 0.4352941, 1, 1,
0.2594621, 0.2165972, 2.559955, 0, 0.4313726, 1, 1,
0.2684785, 3.946659, 1.205821, 0, 0.4235294, 1, 1,
0.2711796, 0.2089624, 1.380544, 0, 0.4196078, 1, 1,
0.2715183, -0.5938351, 5.415858, 0, 0.4117647, 1, 1,
0.2723526, -1.263802, 4.425483, 0, 0.4078431, 1, 1,
0.2734721, -0.5403956, 2.519351, 0, 0.4, 1, 1,
0.2768103, -1.280916, 5.126144, 0, 0.3921569, 1, 1,
0.2793858, 0.222509, -0.8636165, 0, 0.3882353, 1, 1,
0.2843711, 0.147348, 0.4809467, 0, 0.3803922, 1, 1,
0.2870082, 0.4619067, 0.1769847, 0, 0.3764706, 1, 1,
0.2922629, 1.884706, 0.469394, 0, 0.3686275, 1, 1,
0.2941237, 0.3137159, 0.1691254, 0, 0.3647059, 1, 1,
0.295346, 0.0494242, 1.812708, 0, 0.3568628, 1, 1,
0.2983627, 1.87674, 1.1048, 0, 0.3529412, 1, 1,
0.2988541, 1.625243, -0.83206, 0, 0.345098, 1, 1,
0.2999511, 1.45862, -1.074864, 0, 0.3411765, 1, 1,
0.3004289, -0.4210395, 2.978285, 0, 0.3333333, 1, 1,
0.3015741, 1.291772, -0.627177, 0, 0.3294118, 1, 1,
0.3022823, 0.2947268, 0.3334019, 0, 0.3215686, 1, 1,
0.3035465, -0.04227387, 2.332587, 0, 0.3176471, 1, 1,
0.3047694, -0.3711906, 2.211821, 0, 0.3098039, 1, 1,
0.3055192, 0.922767, 1.339378, 0, 0.3058824, 1, 1,
0.3065471, -0.4203073, 0.4713058, 0, 0.2980392, 1, 1,
0.3068962, -0.860612, 2.633909, 0, 0.2901961, 1, 1,
0.308768, 0.5039479, -0.1560904, 0, 0.2862745, 1, 1,
0.3107926, -0.6615985, 3.055568, 0, 0.2784314, 1, 1,
0.3112006, 0.6309013, -0.5636513, 0, 0.2745098, 1, 1,
0.3121536, -0.5705843, 2.432984, 0, 0.2666667, 1, 1,
0.3138707, 0.4047658, 1.15016, 0, 0.2627451, 1, 1,
0.3160964, 1.109995, -0.5120662, 0, 0.254902, 1, 1,
0.3190905, 0.3841337, 0.3622495, 0, 0.2509804, 1, 1,
0.320451, -0.7040151, 2.559155, 0, 0.2431373, 1, 1,
0.326912, 2.596754, -0.178792, 0, 0.2392157, 1, 1,
0.3301353, -0.9080449, 3.99171, 0, 0.2313726, 1, 1,
0.3311753, 0.5137421, 1.950112, 0, 0.227451, 1, 1,
0.3317897, -1.715123, 2.674558, 0, 0.2196078, 1, 1,
0.3323182, 1.356467, 0.6862124, 0, 0.2156863, 1, 1,
0.3386396, 1.200104, 2.208476, 0, 0.2078431, 1, 1,
0.3396339, -0.765277, 2.463445, 0, 0.2039216, 1, 1,
0.3397425, -0.465001, 0.2047973, 0, 0.1960784, 1, 1,
0.3417256, -0.4927679, 2.508799, 0, 0.1882353, 1, 1,
0.3431709, -1.079491, 1.488662, 0, 0.1843137, 1, 1,
0.3449203, -1.21737, 3.066129, 0, 0.1764706, 1, 1,
0.3452955, -0.3280311, 4.417912, 0, 0.172549, 1, 1,
0.3542981, 0.2927128, -1.662719, 0, 0.1647059, 1, 1,
0.3546903, -2.278991, 3.017039, 0, 0.1607843, 1, 1,
0.3599463, 0.4128079, 1.224046, 0, 0.1529412, 1, 1,
0.3603656, 1.11806, 2.062473, 0, 0.1490196, 1, 1,
0.3633751, -0.2748964, 2.33842, 0, 0.1411765, 1, 1,
0.3658081, -0.08514732, 2.066422, 0, 0.1372549, 1, 1,
0.3667597, -1.522043, 4.330475, 0, 0.1294118, 1, 1,
0.3703734, -0.07919263, 0.8185719, 0, 0.1254902, 1, 1,
0.3712318, -1.19472, 3.26999, 0, 0.1176471, 1, 1,
0.3779193, -1.25499, 2.060476, 0, 0.1137255, 1, 1,
0.3779902, -0.4795671, 1.848423, 0, 0.1058824, 1, 1,
0.3794691, -0.02108889, 1.763037, 0, 0.09803922, 1, 1,
0.3798742, 0.09052963, 1.221534, 0, 0.09411765, 1, 1,
0.3842379, -0.1827216, 1.538435, 0, 0.08627451, 1, 1,
0.3912733, -2.891378, 3.582394, 0, 0.08235294, 1, 1,
0.393109, -0.007411106, 3.303615, 0, 0.07450981, 1, 1,
0.4003521, 0.7392763, 0.9615754, 0, 0.07058824, 1, 1,
0.4099672, 0.4509747, 0.6221018, 0, 0.0627451, 1, 1,
0.4109125, 0.3387627, 2.597704, 0, 0.05882353, 1, 1,
0.4114332, -0.4079394, 3.124841, 0, 0.05098039, 1, 1,
0.4133834, 0.06217554, 0.7607601, 0, 0.04705882, 1, 1,
0.4142716, -1.968486, 2.932466, 0, 0.03921569, 1, 1,
0.4155765, -0.6371754, 4.04797, 0, 0.03529412, 1, 1,
0.4206116, -1.275487, 1.333912, 0, 0.02745098, 1, 1,
0.4250773, 0.9885919, 1.676908, 0, 0.02352941, 1, 1,
0.4257952, -0.1073996, 1.431868, 0, 0.01568628, 1, 1,
0.4312562, -0.5027327, 3.794035, 0, 0.01176471, 1, 1,
0.4432465, 1.153005, 1.169897, 0, 0.003921569, 1, 1,
0.4441467, 1.760813, 0.4624265, 0.003921569, 0, 1, 1,
0.4443458, 1.350425, -1.048264, 0.007843138, 0, 1, 1,
0.4473843, 1.013717, -1.304981, 0.01568628, 0, 1, 1,
0.4503613, 0.3293897, -0.4951648, 0.01960784, 0, 1, 1,
0.4692217, 0.9909529, 0.6696633, 0.02745098, 0, 1, 1,
0.4707887, 0.518418, 2.033262, 0.03137255, 0, 1, 1,
0.4733328, 1.255413, 0.5292454, 0.03921569, 0, 1, 1,
0.4739217, 0.8251446, 0.05819508, 0.04313726, 0, 1, 1,
0.4849008, -0.8814631, 2.167376, 0.05098039, 0, 1, 1,
0.4860892, -0.6101393, 2.915274, 0.05490196, 0, 1, 1,
0.495598, 1.136358, 1.527191, 0.0627451, 0, 1, 1,
0.4960779, 1.319444, 0.0976285, 0.06666667, 0, 1, 1,
0.4992126, 0.6056003, -0.557667, 0.07450981, 0, 1, 1,
0.503117, 0.2337536, 1.995784, 0.07843138, 0, 1, 1,
0.5056534, 1.126557, 1.607904, 0.08627451, 0, 1, 1,
0.5066299, -0.3775898, 2.751704, 0.09019608, 0, 1, 1,
0.5143694, -0.1593824, 1.919445, 0.09803922, 0, 1, 1,
0.5160233, 1.882166, 0.5522521, 0.1058824, 0, 1, 1,
0.516273, -0.3190488, 2.423756, 0.1098039, 0, 1, 1,
0.5164575, 0.1669843, 1.429239, 0.1176471, 0, 1, 1,
0.5208623, -1.458168, 1.649924, 0.1215686, 0, 1, 1,
0.5258995, 0.4418824, -1.009544, 0.1294118, 0, 1, 1,
0.5263745, -0.7867886, 5.417085, 0.1333333, 0, 1, 1,
0.530625, -0.5596461, 1.684172, 0.1411765, 0, 1, 1,
0.5308173, 1.802344, -0.6277179, 0.145098, 0, 1, 1,
0.5326603, 0.1879291, -0.7271622, 0.1529412, 0, 1, 1,
0.5392113, -0.2948165, 2.920389, 0.1568628, 0, 1, 1,
0.5398187, -0.06561495, 1.892323, 0.1647059, 0, 1, 1,
0.5411505, 1.132383, 0.81991, 0.1686275, 0, 1, 1,
0.5504278, -1.493812, 2.154962, 0.1764706, 0, 1, 1,
0.5545835, 1.175337, 0.9018635, 0.1803922, 0, 1, 1,
0.5590491, 1.503688, 0.508765, 0.1882353, 0, 1, 1,
0.560081, 0.4344963, 2.662172, 0.1921569, 0, 1, 1,
0.5748519, 0.4827896, -0.5612801, 0.2, 0, 1, 1,
0.5764507, 1.063765, 0.7302766, 0.2078431, 0, 1, 1,
0.5801449, -1.589043, 2.692672, 0.2117647, 0, 1, 1,
0.5822098, -0.07201535, 1.326487, 0.2196078, 0, 1, 1,
0.585066, -0.7959095, 2.202389, 0.2235294, 0, 1, 1,
0.5891743, 0.3495983, 0.5777512, 0.2313726, 0, 1, 1,
0.5949721, 0.5643193, 1.209278, 0.2352941, 0, 1, 1,
0.5968937, -1.549028, 4.04947, 0.2431373, 0, 1, 1,
0.5974314, 0.8671013, 3.894756, 0.2470588, 0, 1, 1,
0.6007559, 0.6388617, 1.928481, 0.254902, 0, 1, 1,
0.6044884, -0.7687688, 3.799338, 0.2588235, 0, 1, 1,
0.6112869, 1.145547, 1.739689, 0.2666667, 0, 1, 1,
0.6113424, 0.8717442, -1.199242, 0.2705882, 0, 1, 1,
0.6138834, 1.283518, -0.5480201, 0.2784314, 0, 1, 1,
0.6151245, 1.242263, 1.360797, 0.282353, 0, 1, 1,
0.6175705, -0.755887, 2.214653, 0.2901961, 0, 1, 1,
0.6209982, 0.819516, 0.8392224, 0.2941177, 0, 1, 1,
0.6219607, 0.8322545, 0.1389095, 0.3019608, 0, 1, 1,
0.6257384, -0.621524, 2.8734, 0.3098039, 0, 1, 1,
0.6267593, -0.6511153, 3.204372, 0.3137255, 0, 1, 1,
0.6318434, 0.1379622, 0.361643, 0.3215686, 0, 1, 1,
0.6328483, 0.4134787, -0.1589149, 0.3254902, 0, 1, 1,
0.6331144, 0.2153727, 3.047646, 0.3333333, 0, 1, 1,
0.6337729, 0.1649985, 0.6483542, 0.3372549, 0, 1, 1,
0.6363706, -1.119789, 1.754148, 0.345098, 0, 1, 1,
0.6369475, 0.7697165, -0.6699427, 0.3490196, 0, 1, 1,
0.6398094, -1.414889, 2.083117, 0.3568628, 0, 1, 1,
0.6418747, -1.64068, 3.941556, 0.3607843, 0, 1, 1,
0.6422842, 0.3532245, 2.0996, 0.3686275, 0, 1, 1,
0.6511291, 0.7943382, 2.106688, 0.372549, 0, 1, 1,
0.6558893, 0.02579299, 0.002202318, 0.3803922, 0, 1, 1,
0.6561946, -1.61487, 2.706983, 0.3843137, 0, 1, 1,
0.6612162, -0.3232401, 2.888852, 0.3921569, 0, 1, 1,
0.6655597, -0.6905738, 1.652316, 0.3960784, 0, 1, 1,
0.6660071, -0.8341631, 1.102482, 0.4039216, 0, 1, 1,
0.6697949, -0.8929189, 1.808101, 0.4117647, 0, 1, 1,
0.6701092, -0.06991082, 2.061955, 0.4156863, 0, 1, 1,
0.6706144, 0.755046, 0.175613, 0.4235294, 0, 1, 1,
0.6749185, -0.2929733, 1.425397, 0.427451, 0, 1, 1,
0.6771103, 0.2271142, 1.196215, 0.4352941, 0, 1, 1,
0.6802004, -1.067716, 2.120052, 0.4392157, 0, 1, 1,
0.6836713, 0.2679763, 1.343707, 0.4470588, 0, 1, 1,
0.6942726, 0.6092783, -1.07211, 0.4509804, 0, 1, 1,
0.6964055, 0.06737842, 0.830737, 0.4588235, 0, 1, 1,
0.7013429, 1.44795, 1.037947, 0.4627451, 0, 1, 1,
0.7125234, 0.8716799, -0.1834579, 0.4705882, 0, 1, 1,
0.7153373, 0.3083031, 2.089119, 0.4745098, 0, 1, 1,
0.716855, 0.3618366, 1.984271, 0.4823529, 0, 1, 1,
0.7184893, 2.199293, -0.6900885, 0.4862745, 0, 1, 1,
0.7190423, -1.134615, 3.106847, 0.4941176, 0, 1, 1,
0.7223698, 0.2005106, 2.194179, 0.5019608, 0, 1, 1,
0.7321185, -0.5454295, 2.263932, 0.5058824, 0, 1, 1,
0.7343397, 1.332094, 1.613232, 0.5137255, 0, 1, 1,
0.7438701, -1.031926, 2.186001, 0.5176471, 0, 1, 1,
0.7514218, -0.7346433, 1.249895, 0.5254902, 0, 1, 1,
0.7566409, 0.7686307, 1.445462, 0.5294118, 0, 1, 1,
0.7570515, -1.242502, 2.906925, 0.5372549, 0, 1, 1,
0.7585766, -0.6915529, 3.300493, 0.5411765, 0, 1, 1,
0.7632959, 1.200248, 1.769998, 0.5490196, 0, 1, 1,
0.7653072, 1.476138, -0.1029351, 0.5529412, 0, 1, 1,
0.7710726, 0.8563404, 0.4639069, 0.5607843, 0, 1, 1,
0.7739258, -1.310893, 2.387535, 0.5647059, 0, 1, 1,
0.7775328, 0.42879, 1.415283, 0.572549, 0, 1, 1,
0.777857, 0.1437575, 1.599174, 0.5764706, 0, 1, 1,
0.7780589, -0.7498249, 3.101523, 0.5843138, 0, 1, 1,
0.7793329, 0.6398028, 1.383158, 0.5882353, 0, 1, 1,
0.7795729, -0.3608009, 2.396001, 0.5960785, 0, 1, 1,
0.7811366, 0.4999242, 2.707512, 0.6039216, 0, 1, 1,
0.7844818, -0.06623927, 0.8527158, 0.6078432, 0, 1, 1,
0.7855186, 1.174709, 0.7811282, 0.6156863, 0, 1, 1,
0.7856436, -0.8593479, 2.752716, 0.6196079, 0, 1, 1,
0.7873003, 0.7848153, 2.467931, 0.627451, 0, 1, 1,
0.7894766, -0.874877, 3.48602, 0.6313726, 0, 1, 1,
0.7906036, -0.6311219, 2.975352, 0.6392157, 0, 1, 1,
0.7921739, 0.3971185, 2.659586, 0.6431373, 0, 1, 1,
0.7924453, -0.6850543, 0.4917065, 0.6509804, 0, 1, 1,
0.794161, -1.123135, 2.533484, 0.654902, 0, 1, 1,
0.795545, 0.6667709, -0.04253026, 0.6627451, 0, 1, 1,
0.7995535, 0.4201994, 0.6394435, 0.6666667, 0, 1, 1,
0.800446, -0.1621922, 0.1427689, 0.6745098, 0, 1, 1,
0.80479, -1.119357, -0.5374774, 0.6784314, 0, 1, 1,
0.8062657, 0.2581679, 1.726044, 0.6862745, 0, 1, 1,
0.8074285, -0.1100557, 1.348395, 0.6901961, 0, 1, 1,
0.81829, 0.1955758, 1.482682, 0.6980392, 0, 1, 1,
0.8200681, -1.344299, 2.896823, 0.7058824, 0, 1, 1,
0.8216523, 0.7050533, 0.2491931, 0.7098039, 0, 1, 1,
0.8223701, 1.308264, 2.134188, 0.7176471, 0, 1, 1,
0.8271965, 1.910554, -0.7991742, 0.7215686, 0, 1, 1,
0.8304532, -2.016462, 3.494053, 0.7294118, 0, 1, 1,
0.8312708, 2.454846, 1.20842, 0.7333333, 0, 1, 1,
0.8376434, -0.881483, 2.280063, 0.7411765, 0, 1, 1,
0.8387965, 0.1386167, 1.673775, 0.7450981, 0, 1, 1,
0.8437055, 0.5396007, 3.330236, 0.7529412, 0, 1, 1,
0.8515254, 0.07996694, 1.291331, 0.7568628, 0, 1, 1,
0.8527038, 1.193096, 1.096814, 0.7647059, 0, 1, 1,
0.8583066, 0.8593991, -0.4828305, 0.7686275, 0, 1, 1,
0.8628028, -0.7219846, 1.818409, 0.7764706, 0, 1, 1,
0.8651988, -0.02386293, -0.1983943, 0.7803922, 0, 1, 1,
0.8753294, 0.2058533, 0.9939318, 0.7882353, 0, 1, 1,
0.8778541, -0.03377943, 1.834571, 0.7921569, 0, 1, 1,
0.8780868, -0.06083629, 1.782042, 0.8, 0, 1, 1,
0.8792433, -0.2752666, -0.1308466, 0.8078431, 0, 1, 1,
0.8795236, -0.3341893, 2.345014, 0.8117647, 0, 1, 1,
0.8815961, -0.8236015, 3.302678, 0.8196079, 0, 1, 1,
0.8831511, 0.2629001, 0.1680929, 0.8235294, 0, 1, 1,
0.8853654, 0.209898, 0.0585595, 0.8313726, 0, 1, 1,
0.8877404, 1.171369, 0.7479507, 0.8352941, 0, 1, 1,
0.8919737, -0.5166329, 1.886869, 0.8431373, 0, 1, 1,
0.8933097, -0.3152428, 2.376796, 0.8470588, 0, 1, 1,
0.8946745, -0.1557687, 2.050867, 0.854902, 0, 1, 1,
0.9123624, -1.051562, 2.011929, 0.8588235, 0, 1, 1,
0.9183395, 1.030245, 0.8659931, 0.8666667, 0, 1, 1,
0.9193832, -0.8396876, 1.159805, 0.8705882, 0, 1, 1,
0.9205982, 0.8913556, 0.322562, 0.8784314, 0, 1, 1,
0.9324175, 1.901789, 0.9787896, 0.8823529, 0, 1, 1,
0.9365333, 0.5465084, 2.58625, 0.8901961, 0, 1, 1,
0.9382852, 0.4041643, 1.576202, 0.8941177, 0, 1, 1,
0.9403482, 0.00199892, 3.294842, 0.9019608, 0, 1, 1,
0.9429325, -1.467466, 3.083458, 0.9098039, 0, 1, 1,
0.9477898, 1.494342, -0.2917352, 0.9137255, 0, 1, 1,
0.9478282, -0.4873599, 3.375215, 0.9215686, 0, 1, 1,
0.9480013, 0.6145366, -0.3075117, 0.9254902, 0, 1, 1,
0.9507348, 0.9941221, -0.4699263, 0.9333333, 0, 1, 1,
0.9514559, -0.6319169, 3.144003, 0.9372549, 0, 1, 1,
0.9527292, 0.892229, 0.6186642, 0.945098, 0, 1, 1,
0.96027, -0.02680751, 1.651884, 0.9490196, 0, 1, 1,
0.9632295, 0.4331599, 0.2254525, 0.9568627, 0, 1, 1,
0.9640757, 0.5818412, -0.06722086, 0.9607843, 0, 1, 1,
0.9695257, -0.01275893, 2.099423, 0.9686275, 0, 1, 1,
0.9982349, -0.4757235, 3.029078, 0.972549, 0, 1, 1,
1.005057, 0.2244154, 1.231238, 0.9803922, 0, 1, 1,
1.009003, -0.7227842, 1.211677, 0.9843137, 0, 1, 1,
1.009436, 0.728207, -1.052442, 0.9921569, 0, 1, 1,
1.012269, 0.9062185, 1.3155, 0.9960784, 0, 1, 1,
1.017202, -0.2338258, 3.102854, 1, 0, 0.9960784, 1,
1.018273, 0.7321084, -0.4296947, 1, 0, 0.9882353, 1,
1.018883, 0.04545909, -0.9446529, 1, 0, 0.9843137, 1,
1.021196, 0.315103, 0.3452831, 1, 0, 0.9764706, 1,
1.034659, -0.4333964, 1.525415, 1, 0, 0.972549, 1,
1.036767, -0.26442, 1.024724, 1, 0, 0.9647059, 1,
1.037048, 1.419377, 1.39863, 1, 0, 0.9607843, 1,
1.039453, -0.1615746, 0.4170376, 1, 0, 0.9529412, 1,
1.041391, -1.599838, 2.361694, 1, 0, 0.9490196, 1,
1.044717, -1.758753, 1.778365, 1, 0, 0.9411765, 1,
1.04751, -0.815827, 1.671268, 1, 0, 0.9372549, 1,
1.049874, 0.02278588, 0.8496985, 1, 0, 0.9294118, 1,
1.054085, 0.9215354, 3.733917, 1, 0, 0.9254902, 1,
1.057241, -0.7321481, 2.278423, 1, 0, 0.9176471, 1,
1.057732, -0.1105949, 1.64432, 1, 0, 0.9137255, 1,
1.059995, -0.1695738, 2.22944, 1, 0, 0.9058824, 1,
1.060303, -0.1948896, 0.141247, 1, 0, 0.9019608, 1,
1.065135, 0.4510573, 0.3887942, 1, 0, 0.8941177, 1,
1.070891, 0.7287269, 2.938494, 1, 0, 0.8862745, 1,
1.075233, 1.032963, 0.9917946, 1, 0, 0.8823529, 1,
1.077815, -0.2231206, 1.558926, 1, 0, 0.8745098, 1,
1.077881, 0.1515411, 0.7717804, 1, 0, 0.8705882, 1,
1.078315, 0.055741, 1.611312, 1, 0, 0.8627451, 1,
1.086755, 1.594746, -0.07840677, 1, 0, 0.8588235, 1,
1.089648, -0.264564, 1.585987, 1, 0, 0.8509804, 1,
1.091464, 0.1171846, 0.5129593, 1, 0, 0.8470588, 1,
1.09857, 1.158719, 1.564754, 1, 0, 0.8392157, 1,
1.099277, 0.9492552, 0.6308969, 1, 0, 0.8352941, 1,
1.102379, -1.838772, 3.600527, 1, 0, 0.827451, 1,
1.114667, -0.01686628, 1.148926, 1, 0, 0.8235294, 1,
1.118235, 0.4005481, 1.940139, 1, 0, 0.8156863, 1,
1.119672, -0.09602011, 1.327431, 1, 0, 0.8117647, 1,
1.120313, -3.144003, 3.346128, 1, 0, 0.8039216, 1,
1.123202, 0.2716017, 0.7732065, 1, 0, 0.7960784, 1,
1.126666, 1.370152, 1.453562, 1, 0, 0.7921569, 1,
1.13138, 0.8110284, 0.8168064, 1, 0, 0.7843137, 1,
1.133493, -0.7720872, 1.809518, 1, 0, 0.7803922, 1,
1.139829, -0.2188195, 0.4816332, 1, 0, 0.772549, 1,
1.143044, 0.9646385, 0.8513402, 1, 0, 0.7686275, 1,
1.15084, 0.5970668, 2.607626, 1, 0, 0.7607843, 1,
1.152705, -0.143518, 1.315489, 1, 0, 0.7568628, 1,
1.162334, -0.3094161, 2.653254, 1, 0, 0.7490196, 1,
1.162592, -0.8301651, 3.015984, 1, 0, 0.7450981, 1,
1.165205, 0.5484351, 0.3593949, 1, 0, 0.7372549, 1,
1.18319, 0.06189383, 2.685955, 1, 0, 0.7333333, 1,
1.185097, -0.8212624, 0.2744091, 1, 0, 0.7254902, 1,
1.186143, 1.889031, 0.4638667, 1, 0, 0.7215686, 1,
1.193554, -0.9865537, 2.043483, 1, 0, 0.7137255, 1,
1.198177, -0.03490872, 2.287605, 1, 0, 0.7098039, 1,
1.20376, 0.5298542, 1.889934, 1, 0, 0.7019608, 1,
1.204668, -1.440381, 2.047126, 1, 0, 0.6941177, 1,
1.214204, -1.225733, 2.131168, 1, 0, 0.6901961, 1,
1.218567, -1.997694, 1.842883, 1, 0, 0.682353, 1,
1.227519, -2.369655, 2.073325, 1, 0, 0.6784314, 1,
1.231789, -1.113546, 2.1522, 1, 0, 0.6705883, 1,
1.235392, -0.2086176, 2.216126, 1, 0, 0.6666667, 1,
1.242046, -0.5959555, 1.388628, 1, 0, 0.6588235, 1,
1.242056, 0.03798986, 0.7971005, 1, 0, 0.654902, 1,
1.243667, -0.6691149, 1.557404, 1, 0, 0.6470588, 1,
1.244283, 1.59665, 1.462049, 1, 0, 0.6431373, 1,
1.256924, 0.8615012, 0.9180835, 1, 0, 0.6352941, 1,
1.265301, -1.145654, 3.827882, 1, 0, 0.6313726, 1,
1.268452, -0.8172694, 2.314741, 1, 0, 0.6235294, 1,
1.268689, -0.2841012, 1.233974, 1, 0, 0.6196079, 1,
1.270468, -0.728043, 4.080032, 1, 0, 0.6117647, 1,
1.278018, 0.5657222, 1.569491, 1, 0, 0.6078432, 1,
1.281801, 1.631149, -0.2067144, 1, 0, 0.6, 1,
1.283177, 0.0185808, 1.318215, 1, 0, 0.5921569, 1,
1.292045, -0.8562626, 1.410009, 1, 0, 0.5882353, 1,
1.295759, -1.188326, 3.518616, 1, 0, 0.5803922, 1,
1.317914, -0.6034764, 1.238732, 1, 0, 0.5764706, 1,
1.31859, -0.4084961, 2.31911, 1, 0, 0.5686275, 1,
1.322972, 2.845236, -0.2559901, 1, 0, 0.5647059, 1,
1.323378, 1.833811, 1.276502, 1, 0, 0.5568628, 1,
1.333692, 0.6641807, 2.243804, 1, 0, 0.5529412, 1,
1.339564, -1.037106, 2.025401, 1, 0, 0.5450981, 1,
1.341637, 1.55043, -0.4276598, 1, 0, 0.5411765, 1,
1.349316, -0.518672, 2.666254, 1, 0, 0.5333334, 1,
1.353614, -1.073262, 2.289708, 1, 0, 0.5294118, 1,
1.356383, 0.5165009, 0.1049076, 1, 0, 0.5215687, 1,
1.360203, 1.059467, 0.466337, 1, 0, 0.5176471, 1,
1.360375, 0.4575788, 2.927714, 1, 0, 0.509804, 1,
1.36704, -0.6548248, 0.9719233, 1, 0, 0.5058824, 1,
1.369268, 0.3815153, 1.162861, 1, 0, 0.4980392, 1,
1.369806, 1.896861, 0.9733344, 1, 0, 0.4901961, 1,
1.374303, 0.5320366, 0.8603802, 1, 0, 0.4862745, 1,
1.37528, -0.960793, 2.86327, 1, 0, 0.4784314, 1,
1.385635, 0.8274363, 0.4918914, 1, 0, 0.4745098, 1,
1.398893, 2.095289, -0.0001036329, 1, 0, 0.4666667, 1,
1.43378, 0.8987623, 1.253459, 1, 0, 0.4627451, 1,
1.434171, -0.01835524, 1.942273, 1, 0, 0.454902, 1,
1.446307, 0.4167845, 2.569356, 1, 0, 0.4509804, 1,
1.448485, -1.364393, 0.6666909, 1, 0, 0.4431373, 1,
1.457036, 0.04066598, 2.85155, 1, 0, 0.4392157, 1,
1.46209, 1.925527, 1.560795, 1, 0, 0.4313726, 1,
1.472451, -0.05164057, 1.727169, 1, 0, 0.427451, 1,
1.472693, 0.3055525, 0.4713114, 1, 0, 0.4196078, 1,
1.480583, 0.1571205, 0.4285055, 1, 0, 0.4156863, 1,
1.488461, 0.6162387, -0.18445, 1, 0, 0.4078431, 1,
1.489678, 0.3460225, 1.260994, 1, 0, 0.4039216, 1,
1.500283, -0.6759914, 1.532654, 1, 0, 0.3960784, 1,
1.517755, 1.260559, 0.6206822, 1, 0, 0.3882353, 1,
1.53946, -0.1857881, 1.110717, 1, 0, 0.3843137, 1,
1.544181, -0.456384, 2.466694, 1, 0, 0.3764706, 1,
1.562283, -0.6150497, 1.733181, 1, 0, 0.372549, 1,
1.575121, 0.1457592, 1.74678, 1, 0, 0.3647059, 1,
1.623427, -0.562815, 1.874216, 1, 0, 0.3607843, 1,
1.638549, -0.27847, 1.391363, 1, 0, 0.3529412, 1,
1.640516, 0.09010464, 0.4619679, 1, 0, 0.3490196, 1,
1.650996, -1.109141, 2.933921, 1, 0, 0.3411765, 1,
1.651902, -1.329493, 2.998043, 1, 0, 0.3372549, 1,
1.658503, -2.546516, 2.916255, 1, 0, 0.3294118, 1,
1.707651, -2.298812, 3.837765, 1, 0, 0.3254902, 1,
1.707944, 0.6283581, 3.019513, 1, 0, 0.3176471, 1,
1.709901, -0.2458081, 0.6940358, 1, 0, 0.3137255, 1,
1.710512, -0.2409897, 1.906509, 1, 0, 0.3058824, 1,
1.711813, 0.1471875, 1.787607, 1, 0, 0.2980392, 1,
1.719143, 1.248408, 2.375401, 1, 0, 0.2941177, 1,
1.734699, -1.277703, 1.979451, 1, 0, 0.2862745, 1,
1.735018, -0.2851707, 0.79308, 1, 0, 0.282353, 1,
1.742396, 0.8367, 1.09833, 1, 0, 0.2745098, 1,
1.751926, 0.03437425, 1.733911, 1, 0, 0.2705882, 1,
1.754783, -1.643902, 2.105724, 1, 0, 0.2627451, 1,
1.758047, 1.164023, -0.708154, 1, 0, 0.2588235, 1,
1.77625, 2.296268, 1.217836, 1, 0, 0.2509804, 1,
1.776964, -2.344615, 2.919519, 1, 0, 0.2470588, 1,
1.78516, 0.007162184, 1.426952, 1, 0, 0.2392157, 1,
1.788086, 0.0279783, 1.259765, 1, 0, 0.2352941, 1,
1.804364, 0.3404814, 0.8673657, 1, 0, 0.227451, 1,
1.812503, 0.3144703, 2.241115, 1, 0, 0.2235294, 1,
1.820496, 0.05330212, 1.410152, 1, 0, 0.2156863, 1,
1.824047, -2.144643, 3.782734, 1, 0, 0.2117647, 1,
1.831476, -0.7256823, 3.847689, 1, 0, 0.2039216, 1,
1.836831, -1.170192, 1.615674, 1, 0, 0.1960784, 1,
1.873928, 1.248329, -1.834749, 1, 0, 0.1921569, 1,
1.896629, -0.05714252, 1.224077, 1, 0, 0.1843137, 1,
1.897633, 1.424816, 0.1107884, 1, 0, 0.1803922, 1,
1.910786, 2.167655, 1.485829, 1, 0, 0.172549, 1,
1.91219, 0.9395837, 1.444853, 1, 0, 0.1686275, 1,
1.923302, -0.8123344, 0.5033969, 1, 0, 0.1607843, 1,
1.931652, 0.5570697, 1.791826, 1, 0, 0.1568628, 1,
1.961565, -0.4854634, -0.8655877, 1, 0, 0.1490196, 1,
1.970838, -1.002248, 2.100439, 1, 0, 0.145098, 1,
1.985941, 0.433013, 3.362159, 1, 0, 0.1372549, 1,
2.014828, 1.471479, 0.2733775, 1, 0, 0.1333333, 1,
2.057199, -0.2652611, 0.3181841, 1, 0, 0.1254902, 1,
2.090361, 0.6512871, 2.070183, 1, 0, 0.1215686, 1,
2.099124, 0.8630825, 0.8741269, 1, 0, 0.1137255, 1,
2.109837, 0.311455, 0.2350627, 1, 0, 0.1098039, 1,
2.124653, 1.212188, 0.327883, 1, 0, 0.1019608, 1,
2.126871, -1.801036, 2.701816, 1, 0, 0.09411765, 1,
2.149217, -0.3669685, 1.292744, 1, 0, 0.09019608, 1,
2.149284, 1.826932, -0.6521264, 1, 0, 0.08235294, 1,
2.210308, 1.366774, 1.216295, 1, 0, 0.07843138, 1,
2.218546, 0.09263641, 0.03143877, 1, 0, 0.07058824, 1,
2.281715, -0.2936151, 3.644541, 1, 0, 0.06666667, 1,
2.294207, -0.1955969, 2.260287, 1, 0, 0.05882353, 1,
2.318387, 0.2982044, -0.06095474, 1, 0, 0.05490196, 1,
2.391865, 0.3780152, 0.591807, 1, 0, 0.04705882, 1,
2.444202, -0.5102208, 0.4666209, 1, 0, 0.04313726, 1,
2.51194, -1.801929, 2.991703, 1, 0, 0.03529412, 1,
2.533291, 0.368699, 1.079737, 1, 0, 0.03137255, 1,
2.649453, 0.7668046, 1.831496, 1, 0, 0.02352941, 1,
2.804143, 0.07998335, 1.726501, 1, 0, 0.01960784, 1,
3.033361, -0.4328758, 2.181551, 1, 0, 0.01176471, 1,
3.458783, -1.155326, 3.292374, 1, 0, 0.007843138, 1
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
0.3044052, -4.698314, -7.135834, 0, -0.5, 0.5, 0.5,
0.3044052, -4.698314, -7.135834, 1, -0.5, 0.5, 0.5,
0.3044052, -4.698314, -7.135834, 1, 1.5, 0.5, 0.5,
0.3044052, -4.698314, -7.135834, 0, 1.5, 0.5, 0.5
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
-3.919307, 0.2506466, -7.135834, 0, -0.5, 0.5, 0.5,
-3.919307, 0.2506466, -7.135834, 1, -0.5, 0.5, 0.5,
-3.919307, 0.2506466, -7.135834, 1, 1.5, 0.5, 0.5,
-3.919307, 0.2506466, -7.135834, 0, 1.5, 0.5, 0.5
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
-3.919307, -4.698314, 0.1822546, 0, -0.5, 0.5, 0.5,
-3.919307, -4.698314, 0.1822546, 1, -0.5, 0.5, 0.5,
-3.919307, -4.698314, 0.1822546, 1, 1.5, 0.5, 0.5,
-3.919307, -4.698314, 0.1822546, 0, 1.5, 0.5, 0.5
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
-2, -3.556246, -5.447044,
3, -3.556246, -5.447044,
-2, -3.556246, -5.447044,
-2, -3.74659, -5.728509,
-1, -3.556246, -5.447044,
-1, -3.74659, -5.728509,
0, -3.556246, -5.447044,
0, -3.74659, -5.728509,
1, -3.556246, -5.447044,
1, -3.74659, -5.728509,
2, -3.556246, -5.447044,
2, -3.74659, -5.728509,
3, -3.556246, -5.447044,
3, -3.74659, -5.728509
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
-2, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
-2, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
-2, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
-2, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5,
-1, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
-1, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
-1, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
-1, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5,
0, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
0, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
0, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
0, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5,
1, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
1, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
1, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
1, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5,
2, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
2, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
2, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
2, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5,
3, -4.12728, -6.291439, 0, -0.5, 0.5, 0.5,
3, -4.12728, -6.291439, 1, -0.5, 0.5, 0.5,
3, -4.12728, -6.291439, 1, 1.5, 0.5, 0.5,
3, -4.12728, -6.291439, 0, 1.5, 0.5, 0.5
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
-2.944604, -2, -5.447044,
-2.944604, 2, -5.447044,
-2.944604, -2, -5.447044,
-3.107054, -2, -5.728509,
-2.944604, 0, -5.447044,
-3.107054, 0, -5.728509,
-2.944604, 2, -5.447044,
-3.107054, 2, -5.728509
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
-3.431955, -2, -6.291439, 0, -0.5, 0.5, 0.5,
-3.431955, -2, -6.291439, 1, -0.5, 0.5, 0.5,
-3.431955, -2, -6.291439, 1, 1.5, 0.5, 0.5,
-3.431955, -2, -6.291439, 0, 1.5, 0.5, 0.5,
-3.431955, 0, -6.291439, 0, -0.5, 0.5, 0.5,
-3.431955, 0, -6.291439, 1, -0.5, 0.5, 0.5,
-3.431955, 0, -6.291439, 1, 1.5, 0.5, 0.5,
-3.431955, 0, -6.291439, 0, 1.5, 0.5, 0.5,
-3.431955, 2, -6.291439, 0, -0.5, 0.5, 0.5,
-3.431955, 2, -6.291439, 1, -0.5, 0.5, 0.5,
-3.431955, 2, -6.291439, 1, 1.5, 0.5, 0.5,
-3.431955, 2, -6.291439, 0, 1.5, 0.5, 0.5
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
-2.944604, -3.556246, -4,
-2.944604, -3.556246, 4,
-2.944604, -3.556246, -4,
-3.107054, -3.74659, -4,
-2.944604, -3.556246, -2,
-3.107054, -3.74659, -2,
-2.944604, -3.556246, 0,
-3.107054, -3.74659, 0,
-2.944604, -3.556246, 2,
-3.107054, -3.74659, 2,
-2.944604, -3.556246, 4,
-3.107054, -3.74659, 4
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
-3.431955, -4.12728, -4, 0, -0.5, 0.5, 0.5,
-3.431955, -4.12728, -4, 1, -0.5, 0.5, 0.5,
-3.431955, -4.12728, -4, 1, 1.5, 0.5, 0.5,
-3.431955, -4.12728, -4, 0, 1.5, 0.5, 0.5,
-3.431955, -4.12728, -2, 0, -0.5, 0.5, 0.5,
-3.431955, -4.12728, -2, 1, -0.5, 0.5, 0.5,
-3.431955, -4.12728, -2, 1, 1.5, 0.5, 0.5,
-3.431955, -4.12728, -2, 0, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 0, 0, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 0, 1, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 0, 1, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 0, 0, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 2, 0, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 2, 1, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 2, 1, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 2, 0, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 4, 0, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 4, 1, -0.5, 0.5, 0.5,
-3.431955, -4.12728, 4, 1, 1.5, 0.5, 0.5,
-3.431955, -4.12728, 4, 0, 1.5, 0.5, 0.5
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
-2.944604, -3.556246, -5.447044,
-2.944604, 4.057539, -5.447044,
-2.944604, -3.556246, 5.811553,
-2.944604, 4.057539, 5.811553,
-2.944604, -3.556246, -5.447044,
-2.944604, -3.556246, 5.811553,
-2.944604, 4.057539, -5.447044,
-2.944604, 4.057539, 5.811553,
-2.944604, -3.556246, -5.447044,
3.553415, -3.556246, -5.447044,
-2.944604, -3.556246, 5.811553,
3.553415, -3.556246, 5.811553,
-2.944604, 4.057539, -5.447044,
3.553415, 4.057539, -5.447044,
-2.944604, 4.057539, 5.811553,
3.553415, 4.057539, 5.811553,
3.553415, -3.556246, -5.447044,
3.553415, 4.057539, -5.447044,
3.553415, -3.556246, 5.811553,
3.553415, 4.057539, 5.811553,
3.553415, -3.556246, -5.447044,
3.553415, -3.556246, 5.811553,
3.553415, 4.057539, -5.447044,
3.553415, 4.057539, 5.811553
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
var radius = 8.044342;
var distance = 35.79018;
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
mvMatrix.translate( -0.3044052, -0.2506466, -0.1822546 );
mvMatrix.scale( 1.338516, 1.142362, 0.7725385 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.79018);
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
3-acetyl-6-methylpyr<-read.table("3-acetyl-6-methylpyr.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-acetyl-6-methylpyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
y<-3-acetyl-6-methylpyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
z<-3-acetyl-6-methylpyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
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
-2.849973, -1.613663, -2.618854, 0, 0, 1, 1, 1,
-2.837438, -0.5970691, 0.07127495, 1, 0, 0, 1, 1,
-2.732475, 0.2628906, -0.1379797, 1, 0, 0, 1, 1,
-2.543122, -0.3620255, -4.109098, 1, 0, 0, 1, 1,
-2.534019, 0.0223956, -3.067902, 1, 0, 0, 1, 1,
-2.455325, 0.01652221, -1.021947, 1, 0, 0, 1, 1,
-2.311195, -0.4992125, -0.7099202, 0, 0, 0, 1, 1,
-2.267923, -1.248629, -3.183837, 0, 0, 0, 1, 1,
-2.25803, 1.228868, -1.418765, 0, 0, 0, 1, 1,
-2.221406, 0.3363486, -2.427197, 0, 0, 0, 1, 1,
-2.202294, 0.3659875, -0.8884796, 0, 0, 0, 1, 1,
-2.160856, 0.6973599, -1.262827, 0, 0, 0, 1, 1,
-2.127366, -0.5302561, -1.406027, 0, 0, 0, 1, 1,
-2.110875, 0.4162269, -0.6602089, 1, 1, 1, 1, 1,
-2.081827, -0.4554542, -1.48084, 1, 1, 1, 1, 1,
-2.053215, -0.7815106, -1.788123, 1, 1, 1, 1, 1,
-2.042578, 0.4408178, -1.43048, 1, 1, 1, 1, 1,
-1.950066, -0.389201, -3.964134, 1, 1, 1, 1, 1,
-1.937683, 1.710534, -1.051195, 1, 1, 1, 1, 1,
-1.93543, -0.8180599, -2.749319, 1, 1, 1, 1, 1,
-1.933878, 1.462742, -1.109423, 1, 1, 1, 1, 1,
-1.900735, -0.4807276, 0.09922196, 1, 1, 1, 1, 1,
-1.892368, -0.7391784, -2.599397, 1, 1, 1, 1, 1,
-1.84448, -1.813938, -1.752727, 1, 1, 1, 1, 1,
-1.836922, 0.7789564, -1.55851, 1, 1, 1, 1, 1,
-1.817953, -0.8979601, -1.904459, 1, 1, 1, 1, 1,
-1.799903, -0.5417876, -1.337134, 1, 1, 1, 1, 1,
-1.775527, 0.3411451, -0.7543174, 1, 1, 1, 1, 1,
-1.775159, 1.350357, -1.553059, 0, 0, 1, 1, 1,
-1.756942, 1.080395, -1.58118, 1, 0, 0, 1, 1,
-1.72537, 0.9051859, -2.437218, 1, 0, 0, 1, 1,
-1.721347, -0.9038794, -0.1798706, 1, 0, 0, 1, 1,
-1.712725, -1.266871, -3.990111, 1, 0, 0, 1, 1,
-1.706849, 0.02565561, -2.767205, 1, 0, 0, 1, 1,
-1.670859, 1.111114, -0.9192719, 0, 0, 0, 1, 1,
-1.661887, 2.054299, 0.6912913, 0, 0, 0, 1, 1,
-1.644551, -0.9795715, -1.992766, 0, 0, 0, 1, 1,
-1.643294, -0.5927443, -3.250005, 0, 0, 0, 1, 1,
-1.628544, -0.334895, -3.18039, 0, 0, 0, 1, 1,
-1.620435, 0.7793447, -2.131583, 0, 0, 0, 1, 1,
-1.615328, 1.3682, -1.416381, 0, 0, 0, 1, 1,
-1.602962, 0.1169568, -1.702897, 1, 1, 1, 1, 1,
-1.584571, 0.8616838, -0.005087551, 1, 1, 1, 1, 1,
-1.581988, -1.552551, -1.641721, 1, 1, 1, 1, 1,
-1.556843, -0.3935995, -0.4826381, 1, 1, 1, 1, 1,
-1.541996, 0.1926793, -1.402715, 1, 1, 1, 1, 1,
-1.520265, 1.475271, -1.628469, 1, 1, 1, 1, 1,
-1.519668, 0.738507, -1.914462, 1, 1, 1, 1, 1,
-1.510989, 0.5386472, -1.335709, 1, 1, 1, 1, 1,
-1.507977, 1.076593, -1.782351, 1, 1, 1, 1, 1,
-1.507885, 1.055716, -1.441839, 1, 1, 1, 1, 1,
-1.47833, -1.155482, -1.638037, 1, 1, 1, 1, 1,
-1.47313, -0.1868446, -1.846687, 1, 1, 1, 1, 1,
-1.468806, -0.8546233, -1.840516, 1, 1, 1, 1, 1,
-1.457338, -0.6880836, -3.475307, 1, 1, 1, 1, 1,
-1.446406, -0.460602, -2.250096, 1, 1, 1, 1, 1,
-1.434641, 0.4450877, -1.966435, 0, 0, 1, 1, 1,
-1.434333, 0.2382524, -1.224342, 1, 0, 0, 1, 1,
-1.428249, 0.6403803, -1.041128, 1, 0, 0, 1, 1,
-1.426857, -1.603994, -1.321874, 1, 0, 0, 1, 1,
-1.414265, -0.471198, -2.837254, 1, 0, 0, 1, 1,
-1.409786, -0.7540578, -3.020582, 1, 0, 0, 1, 1,
-1.408422, 1.207984, -2.023707, 0, 0, 0, 1, 1,
-1.407595, -0.6764634, -0.7826439, 0, 0, 0, 1, 1,
-1.400866, -0.2211123, -1.2233, 0, 0, 0, 1, 1,
-1.38877, 0.0924807, -1.137581, 0, 0, 0, 1, 1,
-1.388161, 0.856035, -2.72211, 0, 0, 0, 1, 1,
-1.38055, -1.357136, -2.174307, 0, 0, 0, 1, 1,
-1.376489, -1.13321, -3.880662, 0, 0, 0, 1, 1,
-1.374473, 0.623564, -0.2349023, 1, 1, 1, 1, 1,
-1.364022, -0.4644457, -1.36211, 1, 1, 1, 1, 1,
-1.357039, 0.04752298, 0.1567419, 1, 1, 1, 1, 1,
-1.355362, -0.4811208, -2.399387, 1, 1, 1, 1, 1,
-1.352527, -0.7841753, -2.87541, 1, 1, 1, 1, 1,
-1.348772, 1.76461, -0.6451722, 1, 1, 1, 1, 1,
-1.337312, 0.2591051, -1.748352, 1, 1, 1, 1, 1,
-1.330562, 0.09148403, -2.422027, 1, 1, 1, 1, 1,
-1.328952, -0.07308894, -1.258757, 1, 1, 1, 1, 1,
-1.328015, 1.116404, -0.3547747, 1, 1, 1, 1, 1,
-1.326743, 1.94508, -0.6533039, 1, 1, 1, 1, 1,
-1.326194, 0.6169062, -0.7182841, 1, 1, 1, 1, 1,
-1.316876, 0.8653113, -0.7690226, 1, 1, 1, 1, 1,
-1.298644, 0.1009759, -1.775609, 1, 1, 1, 1, 1,
-1.291202, -0.004822727, -2.561054, 1, 1, 1, 1, 1,
-1.291186, 2.357519, 0.2504699, 0, 0, 1, 1, 1,
-1.271776, 0.9238702, -2.054173, 1, 0, 0, 1, 1,
-1.265297, -0.6091186, -3.095742, 1, 0, 0, 1, 1,
-1.258622, -1.152121, -5.283084, 1, 0, 0, 1, 1,
-1.252942, -0.09097015, -2.886369, 1, 0, 0, 1, 1,
-1.252088, -0.5550196, -3.366135, 1, 0, 0, 1, 1,
-1.24438, 2.857454, -1.45507, 0, 0, 0, 1, 1,
-1.234515, -1.842655, -3.497509, 0, 0, 0, 1, 1,
-1.233671, -1.315132, -1.631428, 0, 0, 0, 1, 1,
-1.225485, -1.685584, -1.897086, 0, 0, 0, 1, 1,
-1.222057, 0.5324535, -2.567172, 0, 0, 0, 1, 1,
-1.216825, 1.171016, -2.18975, 0, 0, 0, 1, 1,
-1.211238, 0.9227788, -1.166153, 0, 0, 0, 1, 1,
-1.210337, 1.654538, -0.1718951, 1, 1, 1, 1, 1,
-1.204023, 0.9145693, 1.033553, 1, 1, 1, 1, 1,
-1.197014, 1.589907, -1.292943, 1, 1, 1, 1, 1,
-1.195892, 1.221875, -0.1580328, 1, 1, 1, 1, 1,
-1.186651, -0.7656164, -1.30937, 1, 1, 1, 1, 1,
-1.181691, -1.354432, -3.115224, 1, 1, 1, 1, 1,
-1.181422, 1.166993, -1.074235, 1, 1, 1, 1, 1,
-1.172212, -1.772271, -3.067095, 1, 1, 1, 1, 1,
-1.167205, 0.111954, -1.47626, 1, 1, 1, 1, 1,
-1.154652, 0.1439057, -2.669547, 1, 1, 1, 1, 1,
-1.153628, -1.226442, -2.411286, 1, 1, 1, 1, 1,
-1.150285, 1.573615, -0.2136235, 1, 1, 1, 1, 1,
-1.144372, 0.4761701, -1.350763, 1, 1, 1, 1, 1,
-1.14258, -1.595092, -0.2144987, 1, 1, 1, 1, 1,
-1.128712, 1.596673, -0.7315712, 1, 1, 1, 1, 1,
-1.126178, -0.6529641, -1.384135, 0, 0, 1, 1, 1,
-1.118711, -0.3237859, -2.762363, 1, 0, 0, 1, 1,
-1.116984, 1.056344, -0.5523492, 1, 0, 0, 1, 1,
-1.11133, 1.289574, -0.6460485, 1, 0, 0, 1, 1,
-1.07853, -0.02507354, -2.540934, 1, 0, 0, 1, 1,
-1.077761, -2.065117, -1.665395, 1, 0, 0, 1, 1,
-1.065318, -1.082834, -2.454309, 0, 0, 0, 1, 1,
-1.058795, -0.9075233, -0.261034, 0, 0, 0, 1, 1,
-1.057079, -0.9993758, -0.1679464, 0, 0, 0, 1, 1,
-1.056554, -0.5778183, -3.731095, 0, 0, 0, 1, 1,
-1.051863, 0.999328, -0.7304549, 0, 0, 0, 1, 1,
-1.05086, 0.261288, -0.3600054, 0, 0, 0, 1, 1,
-1.048741, -1.008804, -2.820824, 0, 0, 0, 1, 1,
-1.040746, 1.036541, -1.54611, 1, 1, 1, 1, 1,
-1.029845, 0.6557463, -1.830092, 1, 1, 1, 1, 1,
-1.022667, 0.5021944, -2.013344, 1, 1, 1, 1, 1,
-1.021382, 0.8511242, -0.02828314, 1, 1, 1, 1, 1,
-1.019322, 1.545816, -1.367617, 1, 1, 1, 1, 1,
-1.014793, 0.5902352, -1.629409, 1, 1, 1, 1, 1,
-1.013941, -1.564094, -2.335102, 1, 1, 1, 1, 1,
-1.001557, -0.6930057, -3.046564, 1, 1, 1, 1, 1,
-1.001452, 1.784384, -2.498651, 1, 1, 1, 1, 1,
-0.9998648, -0.3178368, -1.704613, 1, 1, 1, 1, 1,
-0.9976479, -0.6885417, -2.798921, 1, 1, 1, 1, 1,
-0.9921117, 0.08178481, -2.08758, 1, 1, 1, 1, 1,
-0.9918596, 0.9944113, -1.386248, 1, 1, 1, 1, 1,
-0.9911988, -0.3272263, -2.052184, 1, 1, 1, 1, 1,
-0.9907237, 0.9971744, -0.06185376, 1, 1, 1, 1, 1,
-0.9902134, -0.1750698, -1.37736, 0, 0, 1, 1, 1,
-0.988295, -1.298253, -2.966346, 1, 0, 0, 1, 1,
-0.9800836, -0.7370418, -3.810426, 1, 0, 0, 1, 1,
-0.9795444, -0.03942261, -1.351413, 1, 0, 0, 1, 1,
-0.9793987, 0.999034, -0.9909673, 1, 0, 0, 1, 1,
-0.9733452, -0.2623417, -2.653315, 1, 0, 0, 1, 1,
-0.9618002, 1.227453, -0.5226858, 0, 0, 0, 1, 1,
-0.955419, 0.4235514, -1.203025, 0, 0, 0, 1, 1,
-0.9518969, -0.8532231, -3.068354, 0, 0, 0, 1, 1,
-0.9507612, 0.8864014, -1.83695, 0, 0, 0, 1, 1,
-0.9490964, -0.8556097, -2.165237, 0, 0, 0, 1, 1,
-0.9430138, -0.1444816, -3.458392, 0, 0, 0, 1, 1,
-0.938659, 0.2297828, -1.087278, 0, 0, 0, 1, 1,
-0.9380293, -0.4915916, -1.880776, 1, 1, 1, 1, 1,
-0.9326204, 0.7350077, -2.03764, 1, 1, 1, 1, 1,
-0.9190555, 0.6477996, -2.020666, 1, 1, 1, 1, 1,
-0.9173333, -0.6239244, -3.04954, 1, 1, 1, 1, 1,
-0.9162763, 1.084142, 0.04806702, 1, 1, 1, 1, 1,
-0.9137207, -1.228059, -3.189469, 1, 1, 1, 1, 1,
-0.9018427, 0.01466763, -1.166391, 1, 1, 1, 1, 1,
-0.8938606, 0.7631097, -2.252227, 1, 1, 1, 1, 1,
-0.8864734, 0.1905535, -0.03715325, 1, 1, 1, 1, 1,
-0.8862612, 0.5327497, -0.5672624, 1, 1, 1, 1, 1,
-0.8850155, -1.839541, -2.623497, 1, 1, 1, 1, 1,
-0.8808945, 0.3158196, 0.3984753, 1, 1, 1, 1, 1,
-0.8782223, -1.13857, -1.863875, 1, 1, 1, 1, 1,
-0.872259, -1.013775, -1.216313, 1, 1, 1, 1, 1,
-0.871097, 1.650788, -2.478074, 1, 1, 1, 1, 1,
-0.8683682, -2.161836, -1.870662, 0, 0, 1, 1, 1,
-0.8656378, -0.06737779, -1.272489, 1, 0, 0, 1, 1,
-0.8613902, 0.05179837, -1.941806, 1, 0, 0, 1, 1,
-0.860944, 1.497869, -3.424615, 1, 0, 0, 1, 1,
-0.8557425, 0.426372, -1.105909, 1, 0, 0, 1, 1,
-0.8503398, 1.129862, 1.05445, 1, 0, 0, 1, 1,
-0.8458594, 0.794436, -0.6779784, 0, 0, 0, 1, 1,
-0.8387132, 0.01696727, -2.579572, 0, 0, 0, 1, 1,
-0.8383275, -1.253403, -2.782024, 0, 0, 0, 1, 1,
-0.8365539, -0.5216205, -1.798823, 0, 0, 0, 1, 1,
-0.8266915, 0.04266371, -3.087749, 0, 0, 0, 1, 1,
-0.8239671, 0.5350795, -0.5066527, 0, 0, 0, 1, 1,
-0.8191447, 0.06126956, 0.07147194, 0, 0, 0, 1, 1,
-0.8190113, 0.2660557, -0.8291124, 1, 1, 1, 1, 1,
-0.8155906, 1.184428, -0.6084788, 1, 1, 1, 1, 1,
-0.8153831, 0.7041852, -1.160339, 1, 1, 1, 1, 1,
-0.8147722, -0.4868405, -2.175364, 1, 1, 1, 1, 1,
-0.80885, -0.2603773, -2.397932, 1, 1, 1, 1, 1,
-0.8065236, 0.6173, -1.787072, 1, 1, 1, 1, 1,
-0.805009, -0.2246011, -2.653381, 1, 1, 1, 1, 1,
-0.8040423, -0.5727234, -1.019521, 1, 1, 1, 1, 1,
-0.7881356, -1.397538, -3.05224, 1, 1, 1, 1, 1,
-0.7859362, -1.146365, -0.9591594, 1, 1, 1, 1, 1,
-0.7810009, 0.3924602, -1.324338, 1, 1, 1, 1, 1,
-0.7778147, 0.1416885, -0.9253001, 1, 1, 1, 1, 1,
-0.7751169, 0.9620271, -1.24395, 1, 1, 1, 1, 1,
-0.7655886, -0.775287, -2.233195, 1, 1, 1, 1, 1,
-0.7586449, 0.3032312, -1.980207, 1, 1, 1, 1, 1,
-0.7562696, 0.2916587, -2.039179, 0, 0, 1, 1, 1,
-0.7522461, 0.6371733, -1.771827, 1, 0, 0, 1, 1,
-0.7508788, 0.5659178, 1.017893, 1, 0, 0, 1, 1,
-0.7461372, -0.675341, -1.705204, 1, 0, 0, 1, 1,
-0.745144, -1.498088, -1.074771, 1, 0, 0, 1, 1,
-0.7413312, 0.5317691, -1.763147, 1, 0, 0, 1, 1,
-0.7396644, -0.350331, -1.967437, 0, 0, 0, 1, 1,
-0.7396238, 0.7833138, 0.4393111, 0, 0, 0, 1, 1,
-0.7382175, -0.1568971, -1.433715, 0, 0, 0, 1, 1,
-0.7378584, 1.897688, -0.6621288, 0, 0, 0, 1, 1,
-0.7369527, -0.353242, -2.370006, 0, 0, 0, 1, 1,
-0.7352406, -0.01259833, -1.046964, 0, 0, 0, 1, 1,
-0.7341471, -1.741012, -3.103481, 0, 0, 0, 1, 1,
-0.7284505, -0.8101099, -1.855746, 1, 1, 1, 1, 1,
-0.7277661, -0.1152636, -1.314901, 1, 1, 1, 1, 1,
-0.7272931, -0.3574756, -2.566736, 1, 1, 1, 1, 1,
-0.7205406, 1.831637, -1.27935, 1, 1, 1, 1, 1,
-0.712197, -1.192367, -2.044949, 1, 1, 1, 1, 1,
-0.7103804, 0.5791168, -1.128697, 1, 1, 1, 1, 1,
-0.7097312, -2.087989, -3.69763, 1, 1, 1, 1, 1,
-0.7072112, 0.327652, -0.290365, 1, 1, 1, 1, 1,
-0.706143, -1.192099, -3.942434, 1, 1, 1, 1, 1,
-0.7027758, -0.2014069, -0.8142158, 1, 1, 1, 1, 1,
-0.6988803, -0.159041, -0.7939244, 1, 1, 1, 1, 1,
-0.6959795, -0.4475253, -3.025054, 1, 1, 1, 1, 1,
-0.6937564, 0.3677167, -1.796455, 1, 1, 1, 1, 1,
-0.6892969, 1.14918, 0.5290753, 1, 1, 1, 1, 1,
-0.6887041, 0.2895076, -0.1233871, 1, 1, 1, 1, 1,
-0.6811418, 1.813727, -0.3460541, 0, 0, 1, 1, 1,
-0.6787164, -0.3696728, -1.176208, 1, 0, 0, 1, 1,
-0.6743761, 0.5347006, -0.4796041, 1, 0, 0, 1, 1,
-0.6728066, -0.4295767, -1.113321, 1, 0, 0, 1, 1,
-0.6690719, 0.550829, -0.4830862, 1, 0, 0, 1, 1,
-0.6581713, 0.3686418, -0.04794206, 1, 0, 0, 1, 1,
-0.6521071, -0.8091838, -1.05718, 0, 0, 0, 1, 1,
-0.6449184, 0.2772865, -1.665761, 0, 0, 0, 1, 1,
-0.6444432, 0.6071426, -1.412025, 0, 0, 0, 1, 1,
-0.6443642, -0.5143758, -0.7274501, 0, 0, 0, 1, 1,
-0.643192, 0.01594448, -0.6152576, 0, 0, 0, 1, 1,
-0.6425768, -0.6215426, -2.406685, 0, 0, 0, 1, 1,
-0.6420326, -2.139958, -4.371993, 0, 0, 0, 1, 1,
-0.6352621, -0.2112312, -3.038884, 1, 1, 1, 1, 1,
-0.6329315, -0.5087923, -2.319333, 1, 1, 1, 1, 1,
-0.6322013, 0.6049134, 0.3019453, 1, 1, 1, 1, 1,
-0.6315447, -0.04901779, -1.754038, 1, 1, 1, 1, 1,
-0.6246328, -0.04342924, -3.794829, 1, 1, 1, 1, 1,
-0.6240106, -0.1952943, -1.763968, 1, 1, 1, 1, 1,
-0.6187705, -0.166701, -2.179491, 1, 1, 1, 1, 1,
-0.618607, 1.578694, 1.050191, 1, 1, 1, 1, 1,
-0.6160231, 0.6705402, -3.019828, 1, 1, 1, 1, 1,
-0.6152613, -0.0854717, -0.706093, 1, 1, 1, 1, 1,
-0.6124906, 0.7739319, -1.09652, 1, 1, 1, 1, 1,
-0.6088196, 1.286927, -1.001769, 1, 1, 1, 1, 1,
-0.6087754, 0.7806053, -0.76474, 1, 1, 1, 1, 1,
-0.5962598, 1.184423, 1.464442, 1, 1, 1, 1, 1,
-0.5962039, -0.3600847, -2.158501, 1, 1, 1, 1, 1,
-0.5955827, -0.5217581, -4.400424, 0, 0, 1, 1, 1,
-0.5941958, -0.1579261, -3.908982, 1, 0, 0, 1, 1,
-0.5933603, -0.7535915, -2.609241, 1, 0, 0, 1, 1,
-0.5896173, 0.3899707, -1.179903, 1, 0, 0, 1, 1,
-0.5807388, -0.4404925, -1.181466, 1, 0, 0, 1, 1,
-0.5799477, 1.451338, 0.5918399, 1, 0, 0, 1, 1,
-0.576498, -1.950059, -0.2384467, 0, 0, 0, 1, 1,
-0.5737656, 2.125613, -0.4032956, 0, 0, 0, 1, 1,
-0.5707955, 1.764635, 0.5337095, 0, 0, 0, 1, 1,
-0.5689523, 1.287394, 0.405806, 0, 0, 0, 1, 1,
-0.568134, -0.1054631, 0.3865111, 0, 0, 0, 1, 1,
-0.5679454, 0.9184389, -0.5710692, 0, 0, 0, 1, 1,
-0.5604213, -0.5552, -3.546693, 0, 0, 0, 1, 1,
-0.5581357, 1.115551, 0.9592478, 1, 1, 1, 1, 1,
-0.5509334, 0.768376, 0.1025829, 1, 1, 1, 1, 1,
-0.5487058, -1.773779, -1.648691, 1, 1, 1, 1, 1,
-0.5428768, 0.8983245, -2.141789, 1, 1, 1, 1, 1,
-0.5378992, 0.4174586, 0.5573285, 1, 1, 1, 1, 1,
-0.5308405, -0.5660072, -2.548803, 1, 1, 1, 1, 1,
-0.5305315, 2.316947, -1.212135, 1, 1, 1, 1, 1,
-0.5168461, 1.503784, -0.252136, 1, 1, 1, 1, 1,
-0.5163483, -0.1560197, -3.673444, 1, 1, 1, 1, 1,
-0.5162653, 1.946193, 1.118233, 1, 1, 1, 1, 1,
-0.5148923, 0.5950052, 1.014065, 1, 1, 1, 1, 1,
-0.5114306, 0.4184073, 0.1493532, 1, 1, 1, 1, 1,
-0.5088982, -0.5291986, -2.408635, 1, 1, 1, 1, 1,
-0.5080055, -1.66962, -2.897893, 1, 1, 1, 1, 1,
-0.5031609, -1.530839, -3.130384, 1, 1, 1, 1, 1,
-0.4948115, 0.3055822, -1.33119, 0, 0, 1, 1, 1,
-0.493571, -0.06375297, -2.949214, 1, 0, 0, 1, 1,
-0.4935401, -0.1441451, -1.864941, 1, 0, 0, 1, 1,
-0.4905866, 1.065221, -0.3067988, 1, 0, 0, 1, 1,
-0.4895149, 1.267093, -1.808332, 1, 0, 0, 1, 1,
-0.489212, 0.4876837, -2.092886, 1, 0, 0, 1, 1,
-0.4877051, -0.07935956, -1.046559, 0, 0, 0, 1, 1,
-0.4841388, 0.3408372, -0.4626225, 0, 0, 0, 1, 1,
-0.4830855, 1.64244, -0.3417501, 0, 0, 0, 1, 1,
-0.4785668, -0.08641048, -1.674493, 0, 0, 0, 1, 1,
-0.4749991, 0.9130973, -1.45349, 0, 0, 0, 1, 1,
-0.4726508, -1.801887, -2.802654, 0, 0, 0, 1, 1,
-0.468913, -0.1396016, -3.098532, 0, 0, 0, 1, 1,
-0.4639044, -0.5856586, -2.625528, 1, 1, 1, 1, 1,
-0.4631841, -1.385237, -2.985863, 1, 1, 1, 1, 1,
-0.4620456, -0.7929836, -3.962071, 1, 1, 1, 1, 1,
-0.4601112, -0.2143681, -4.47514, 1, 1, 1, 1, 1,
-0.4597504, 0.564877, -0.5132519, 1, 1, 1, 1, 1,
-0.4577118, 0.6978557, 0.6184662, 1, 1, 1, 1, 1,
-0.4574613, -0.189807, -1.47009, 1, 1, 1, 1, 1,
-0.4563921, 0.6753475, -0.5839716, 1, 1, 1, 1, 1,
-0.4559516, -0.7942172, -2.116641, 1, 1, 1, 1, 1,
-0.4556105, 2.872064, -1.286444, 1, 1, 1, 1, 1,
-0.4554878, -2.271269, -2.585118, 1, 1, 1, 1, 1,
-0.4531291, -1.693969, -1.459932, 1, 1, 1, 1, 1,
-0.4505295, -1.781338, -2.823675, 1, 1, 1, 1, 1,
-0.4479213, -0.6057421, -2.397283, 1, 1, 1, 1, 1,
-0.4358539, -0.8031954, -1.109844, 1, 1, 1, 1, 1,
-0.4336174, -2.806408, -1.955564, 0, 0, 1, 1, 1,
-0.4325215, -1.547145, -2.889929, 1, 0, 0, 1, 1,
-0.4289607, 0.6445328, 0.4784959, 1, 0, 0, 1, 1,
-0.427105, -1.478225, -2.919351, 1, 0, 0, 1, 1,
-0.4270948, 2.474406, -2.075679, 1, 0, 0, 1, 1,
-0.4264687, 2.363071, 0.2679698, 1, 0, 0, 1, 1,
-0.4238758, 1.646669, -1.638435, 0, 0, 0, 1, 1,
-0.422005, -2.167376, -3.438433, 0, 0, 0, 1, 1,
-0.4143322, -0.7199321, -1.823784, 0, 0, 0, 1, 1,
-0.4139136, 0.9006039, -0.5305375, 0, 0, 0, 1, 1,
-0.4094698, 1.44455, 0.8401899, 0, 0, 0, 1, 1,
-0.4090022, 0.7657014, 1.915026, 0, 0, 0, 1, 1,
-0.4087867, -0.7166021, -1.128946, 0, 0, 0, 1, 1,
-0.4078235, 1.377141, 0.1698453, 1, 1, 1, 1, 1,
-0.4042305, -0.4312623, -1.364209, 1, 1, 1, 1, 1,
-0.3968559, -0.4725404, -3.517837, 1, 1, 1, 1, 1,
-0.3876592, 0.6612527, 0.707714, 1, 1, 1, 1, 1,
-0.3842044, 1.241819, -0.1484171, 1, 1, 1, 1, 1,
-0.3787448, -0.5013134, -2.027901, 1, 1, 1, 1, 1,
-0.3784958, 0.2435065, -1.058556, 1, 1, 1, 1, 1,
-0.3776746, -1.359158, -3.807898, 1, 1, 1, 1, 1,
-0.3686735, 0.2781128, -1.083305, 1, 1, 1, 1, 1,
-0.3643995, 0.580657, -1.020222, 1, 1, 1, 1, 1,
-0.3640477, -0.2015163, -1.787321, 1, 1, 1, 1, 1,
-0.3627599, -0.3099009, -1.682741, 1, 1, 1, 1, 1,
-0.3615147, 0.7226912, -0.04517509, 1, 1, 1, 1, 1,
-0.3560944, 0.5809595, 1.401802, 1, 1, 1, 1, 1,
-0.3524693, 0.2802925, -1.975489, 1, 1, 1, 1, 1,
-0.3490827, -1.474434, -1.391127, 0, 0, 1, 1, 1,
-0.3393171, -0.09942793, -2.050466, 1, 0, 0, 1, 1,
-0.337914, -3.445365, -4.305229, 1, 0, 0, 1, 1,
-0.3343081, 1.518234, -1.228318, 1, 0, 0, 1, 1,
-0.3326951, -1.214359, -3.001683, 1, 0, 0, 1, 1,
-0.3312477, 0.8222891, 2.303484, 1, 0, 0, 1, 1,
-0.3251209, -1.129644, -1.499682, 0, 0, 0, 1, 1,
-0.3226997, 1.076594, -0.8861468, 0, 0, 0, 1, 1,
-0.3217722, 0.4325394, -1.231331, 0, 0, 0, 1, 1,
-0.3173148, 0.3793567, -1.312307, 0, 0, 0, 1, 1,
-0.3127699, -1.130356, -4.030612, 0, 0, 0, 1, 1,
-0.310719, -0.2044359, -1.965862, 0, 0, 0, 1, 1,
-0.3090318, -1.04118, -3.659714, 0, 0, 0, 1, 1,
-0.3087035, -0.130262, -2.397588, 1, 1, 1, 1, 1,
-0.3045942, 0.5229283, -1.02222, 1, 1, 1, 1, 1,
-0.2990461, -0.2668679, -4.099945, 1, 1, 1, 1, 1,
-0.2958882, -0.1233292, -2.290058, 1, 1, 1, 1, 1,
-0.2945661, -0.6819261, -0.6618577, 1, 1, 1, 1, 1,
-0.2937502, -0.6700822, -1.76521, 1, 1, 1, 1, 1,
-0.2911558, -0.9210998, -2.689864, 1, 1, 1, 1, 1,
-0.2814866, 1.314226, -1.225981, 1, 1, 1, 1, 1,
-0.2729084, 0.8801584, -0.3973234, 1, 1, 1, 1, 1,
-0.2555543, -0.6227919, -2.704472, 1, 1, 1, 1, 1,
-0.2550881, -0.04564102, -4.053432, 1, 1, 1, 1, 1,
-0.254084, 0.4086337, -0.9823244, 1, 1, 1, 1, 1,
-0.2528473, -0.6789882, -3.134692, 1, 1, 1, 1, 1,
-0.2444677, -1.350923, -4.008924, 1, 1, 1, 1, 1,
-0.2423475, -0.8381781, -2.972202, 1, 1, 1, 1, 1,
-0.237791, 2.235797, 0.6998003, 0, 0, 1, 1, 1,
-0.2334958, 1.324984, 2.20147, 1, 0, 0, 1, 1,
-0.2312598, -0.1047167, -2.055333, 1, 0, 0, 1, 1,
-0.2237638, -3.14504, -3.253463, 1, 0, 0, 1, 1,
-0.2236502, -0.372182, -2.845339, 1, 0, 0, 1, 1,
-0.2206612, 0.9411083, 0.6231276, 1, 0, 0, 1, 1,
-0.2183861, 0.5800847, -0.09505461, 0, 0, 0, 1, 1,
-0.2172708, -0.9560315, -2.702043, 0, 0, 0, 1, 1,
-0.2123716, -0.06454239, -3.341678, 0, 0, 0, 1, 1,
-0.2093503, -1.4875, -4.109799, 0, 0, 0, 1, 1,
-0.2090938, -0.5268111, -3.31025, 0, 0, 0, 1, 1,
-0.2076803, -0.8729321, -2.064605, 0, 0, 0, 1, 1,
-0.2063194, 2.499311, 0.1923441, 0, 0, 0, 1, 1,
-0.2046195, 0.8940399, 0.8947392, 1, 1, 1, 1, 1,
-0.2006736, -1.72129, -2.571586, 1, 1, 1, 1, 1,
-0.1996655, -1.705268, -3.671395, 1, 1, 1, 1, 1,
-0.1980573, 1.021324, 0.7025053, 1, 1, 1, 1, 1,
-0.1947463, -0.3523654, -2.455632, 1, 1, 1, 1, 1,
-0.1895458, -0.1730299, -1.164196, 1, 1, 1, 1, 1,
-0.1885386, -0.4127001, -1.89831, 1, 1, 1, 1, 1,
-0.184973, 1.459496, -1.167758, 1, 1, 1, 1, 1,
-0.1847194, 0.1255289, 0.7003679, 1, 1, 1, 1, 1,
-0.1818436, 0.1875249, -0.5410637, 1, 1, 1, 1, 1,
-0.1807138, 0.1832593, -2.004401, 1, 1, 1, 1, 1,
-0.1775551, -0.4525289, -3.995122, 1, 1, 1, 1, 1,
-0.1760706, 0.2562544, -0.3169723, 1, 1, 1, 1, 1,
-0.1756335, 0.7906571, -0.3708991, 1, 1, 1, 1, 1,
-0.1738747, 0.8372027, -2.828697, 1, 1, 1, 1, 1,
-0.1725088, -1.78121, -2.96753, 0, 0, 1, 1, 1,
-0.1659466, 0.646323, -0.4718403, 1, 0, 0, 1, 1,
-0.1624862, 2.407812, -0.2737213, 1, 0, 0, 1, 1,
-0.1614512, 0.6838256, -1.786046, 1, 0, 0, 1, 1,
-0.1600378, 1.53982, 0.7814409, 1, 0, 0, 1, 1,
-0.1589225, 0.5193759, 1.974435, 1, 0, 0, 1, 1,
-0.154533, -1.049157, -2.197978, 0, 0, 0, 1, 1,
-0.153874, 2.040327, 0.4285213, 0, 0, 0, 1, 1,
-0.152424, -1.175989, -3.555259, 0, 0, 0, 1, 1,
-0.1469088, 1.702303, -1.430735, 0, 0, 0, 1, 1,
-0.1460428, 0.135502, 0.1932149, 0, 0, 0, 1, 1,
-0.1429511, -1.395743, -2.133006, 0, 0, 0, 1, 1,
-0.1343805, -1.169162, -2.423682, 0, 0, 0, 1, 1,
-0.1333822, -0.5784171, -2.990805, 1, 1, 1, 1, 1,
-0.1333613, -0.0117553, -0.3717205, 1, 1, 1, 1, 1,
-0.1239651, 0.2026804, -2.418419, 1, 1, 1, 1, 1,
-0.12322, -0.1341451, -1.955024, 1, 1, 1, 1, 1,
-0.1205145, 0.6577805, -1.182469, 1, 1, 1, 1, 1,
-0.1195869, 0.04062193, 0.4412609, 1, 1, 1, 1, 1,
-0.1168869, 1.196448, -0.01887484, 1, 1, 1, 1, 1,
-0.1164897, 1.216083, -2.647765, 1, 1, 1, 1, 1,
-0.1135563, 0.3079185, -0.966873, 1, 1, 1, 1, 1,
-0.11228, 0.6083627, 2.123201, 1, 1, 1, 1, 1,
-0.1119243, 0.8908353, -0.4001394, 1, 1, 1, 1, 1,
-0.1091272, 0.6816909, -0.5582814, 1, 1, 1, 1, 1,
-0.1077458, -0.1329942, -0.8559222, 1, 1, 1, 1, 1,
-0.1053938, 0.526365, -0.8826343, 1, 1, 1, 1, 1,
-0.1051503, -0.3027715, -1.729419, 1, 1, 1, 1, 1,
-0.1051124, 0.299067, -2.379795, 0, 0, 1, 1, 1,
-0.1048744, -0.430834, -1.794056, 1, 0, 0, 1, 1,
-0.104371, -1.689456, -2.885416, 1, 0, 0, 1, 1,
-0.1038761, 1.14889, -2.794349, 1, 0, 0, 1, 1,
-0.1024136, 0.7881936, 0.1604608, 1, 0, 0, 1, 1,
-0.09884329, 1.256493, -1.693143, 1, 0, 0, 1, 1,
-0.095387, -0.6293707, -2.780057, 0, 0, 0, 1, 1,
-0.09349618, 0.8462667, -0.291573, 0, 0, 0, 1, 1,
-0.09161074, -0.9961106, -1.658913, 0, 0, 0, 1, 1,
-0.08931103, 1.996373, -0.01808754, 0, 0, 0, 1, 1,
-0.08807478, -0.9809778, -1.883261, 0, 0, 0, 1, 1,
-0.08678681, -1.098853, -2.944221, 0, 0, 0, 1, 1,
-0.08553073, -0.3486234, -0.8429779, 0, 0, 0, 1, 1,
-0.08084163, -1.240718, -3.167859, 1, 1, 1, 1, 1,
-0.07925386, 0.04282051, -0.9223768, 1, 1, 1, 1, 1,
-0.07916547, -0.5666435, -1.559273, 1, 1, 1, 1, 1,
-0.07466835, 0.2528449, 1.388796, 1, 1, 1, 1, 1,
-0.07429606, 0.5901886, -1.105308, 1, 1, 1, 1, 1,
-0.07106456, 0.03308509, -2.064468, 1, 1, 1, 1, 1,
-0.06810112, 1.144988, -1.132407, 1, 1, 1, 1, 1,
-0.06577488, 0.8260434, -2.732083, 1, 1, 1, 1, 1,
-0.06298064, -0.679175, -0.3456206, 1, 1, 1, 1, 1,
-0.06285824, -0.253999, -4.052629, 1, 1, 1, 1, 1,
-0.0617355, 0.3003059, 0.2169913, 1, 1, 1, 1, 1,
-0.06131545, -0.5279469, -3.021323, 1, 1, 1, 1, 1,
-0.06087082, -1.225723, -4.071569, 1, 1, 1, 1, 1,
-0.06056208, -0.2127418, -3.03802, 1, 1, 1, 1, 1,
-0.05347571, -0.4840125, -3.341936, 1, 1, 1, 1, 1,
-0.05234009, -0.09816467, -2.866592, 0, 0, 1, 1, 1,
-0.05044323, 0.7775298, 0.4772221, 1, 0, 0, 1, 1,
-0.04989147, 0.6648684, 1.011563, 1, 0, 0, 1, 1,
-0.04936191, 0.3400404, -0.09353981, 1, 0, 0, 1, 1,
-0.04841827, -0.6662925, -2.921662, 1, 0, 0, 1, 1,
-0.04739667, 1.079411, -0.8892024, 1, 0, 0, 1, 1,
-0.04647725, 1.007244, 1.950854, 0, 0, 0, 1, 1,
-0.04342596, -0.2421601, -2.428145, 0, 0, 0, 1, 1,
-0.04098711, -0.5966972, -4.024693, 0, 0, 0, 1, 1,
-0.03887958, -1.237475, -3.194512, 0, 0, 0, 1, 1,
-0.03808799, 0.9934164, -0.3967297, 0, 0, 0, 1, 1,
-0.03705382, -0.7493033, -3.654908, 0, 0, 0, 1, 1,
-0.03662455, -0.8534791, -3.601731, 0, 0, 0, 1, 1,
-0.03475507, 0.203629, -0.9657924, 1, 1, 1, 1, 1,
-0.03307575, 1.421787, 0.3345667, 1, 1, 1, 1, 1,
-0.02823938, 0.577862, 0.05101636, 1, 1, 1, 1, 1,
-0.02456188, -0.7702525, -4.974872, 1, 1, 1, 1, 1,
-0.0240514, -0.5408753, -3.965548, 1, 1, 1, 1, 1,
-0.02099121, -1.275173, -3.82067, 1, 1, 1, 1, 1,
-0.01930115, 0.5272396, -0.5054748, 1, 1, 1, 1, 1,
-0.01471701, 0.1143386, 0.3185888, 1, 1, 1, 1, 1,
-0.01461229, -0.6520023, -3.04754, 1, 1, 1, 1, 1,
-0.0133311, 0.7207803, 1.902798, 1, 1, 1, 1, 1,
-0.01236138, 1.267016, -0.06183721, 1, 1, 1, 1, 1,
-0.01184539, 0.8451399, 0.6593037, 1, 1, 1, 1, 1,
-0.01076618, -1.031516, -3.413146, 1, 1, 1, 1, 1,
-0.009743509, 1.101175, -1.479795, 1, 1, 1, 1, 1,
-0.006000009, 1.891775, -0.2863044, 1, 1, 1, 1, 1,
-0.003471463, 1.207121, -2.085705, 0, 0, 1, 1, 1,
-0.002138106, -0.1298179, -3.604258, 1, 0, 0, 1, 1,
0.005602032, -0.3100713, 1.494769, 1, 0, 0, 1, 1,
0.01476718, 2.163285, 0.6365002, 1, 0, 0, 1, 1,
0.01718687, -1.560145, 3.386117, 1, 0, 0, 1, 1,
0.01726559, -0.0526541, 0.4673054, 1, 0, 0, 1, 1,
0.01792024, -0.4694506, 4.316305, 0, 0, 0, 1, 1,
0.01886834, -0.3658819, 3.65765, 0, 0, 0, 1, 1,
0.01936536, 0.8189909, -1.061787, 0, 0, 0, 1, 1,
0.02109575, -0.3509646, 2.504922, 0, 0, 0, 1, 1,
0.02168955, -0.5087105, 1.638712, 0, 0, 0, 1, 1,
0.02269643, 0.5788209, 1.021322, 0, 0, 0, 1, 1,
0.02455907, -0.5195089, 3.173811, 0, 0, 0, 1, 1,
0.02491296, -1.212167, 3.603705, 1, 1, 1, 1, 1,
0.02497219, 2.604908, 0.5095015, 1, 1, 1, 1, 1,
0.02717589, -0.3939934, 1.421978, 1, 1, 1, 1, 1,
0.03205054, 1.22832, 0.536001, 1, 1, 1, 1, 1,
0.03241225, 0.2323885, 1.53721, 1, 1, 1, 1, 1,
0.0342296, 0.4222718, -1.784775, 1, 1, 1, 1, 1,
0.03673624, 0.5378363, -1.334877, 1, 1, 1, 1, 1,
0.03747879, 0.7675394, 0.2940626, 1, 1, 1, 1, 1,
0.03988343, 0.2778723, -1.114687, 1, 1, 1, 1, 1,
0.04129841, 0.341852, -1.076715, 1, 1, 1, 1, 1,
0.04179317, 0.5407588, -1.051012, 1, 1, 1, 1, 1,
0.04553616, 2.301042, 0.2221243, 1, 1, 1, 1, 1,
0.04674834, 2.721631, -0.2448693, 1, 1, 1, 1, 1,
0.05355812, 0.787775, -0.8111755, 1, 1, 1, 1, 1,
0.05955211, -0.898775, 2.256705, 1, 1, 1, 1, 1,
0.06008366, 0.6786257, -0.881808, 0, 0, 1, 1, 1,
0.06151424, 0.2321999, -0.1260552, 1, 0, 0, 1, 1,
0.06619741, 0.9154636, -0.3967334, 1, 0, 0, 1, 1,
0.06690217, -1.529763, 3.893248, 1, 0, 0, 1, 1,
0.06956287, -0.5564603, 1.400299, 1, 0, 0, 1, 1,
0.07197309, 0.2272024, 0.8318952, 1, 0, 0, 1, 1,
0.07417164, 0.6086202, -0.3021069, 0, 0, 0, 1, 1,
0.07889586, -0.7644761, 0.9336674, 0, 0, 0, 1, 1,
0.08174011, 1.416194, -1.488701, 0, 0, 0, 1, 1,
0.08242718, 1.190819, -0.9170881, 0, 0, 0, 1, 1,
0.08281242, 0.1726096, 0.43848, 0, 0, 0, 1, 1,
0.08371635, 1.195501, 0.622426, 0, 0, 0, 1, 1,
0.08438743, -0.9402149, -0.05786179, 0, 0, 0, 1, 1,
0.08652818, -0.8779371, 2.317949, 1, 1, 1, 1, 1,
0.08940283, 0.4159203, -0.9629784, 1, 1, 1, 1, 1,
0.08994717, -0.5992378, 3.869346, 1, 1, 1, 1, 1,
0.0900635, 0.4199803, 0.4618372, 1, 1, 1, 1, 1,
0.09082966, -0.9971049, 2.464963, 1, 1, 1, 1, 1,
0.09318925, -0.9665171, 4.479284, 1, 1, 1, 1, 1,
0.09552477, -0.6365508, 3.709815, 1, 1, 1, 1, 1,
0.09990162, 0.7282599, -1.545141, 1, 1, 1, 1, 1,
0.1022319, 0.491343, 0.7163875, 1, 1, 1, 1, 1,
0.1026988, -0.03788067, 1.986416, 1, 1, 1, 1, 1,
0.1041296, -1.061748, 4.33351, 1, 1, 1, 1, 1,
0.107205, -1.138856, 0.7761379, 1, 1, 1, 1, 1,
0.108098, -1.767594, 3.922155, 1, 1, 1, 1, 1,
0.1086297, 1.886272, 0.5494888, 1, 1, 1, 1, 1,
0.1092257, 0.6281527, 0.3914801, 1, 1, 1, 1, 1,
0.1166391, 0.1089405, 1.187184, 0, 0, 1, 1, 1,
0.1174164, 0.02204754, 0.8843295, 1, 0, 0, 1, 1,
0.119234, 1.375989, -0.5422871, 1, 0, 0, 1, 1,
0.1196105, -0.5917482, 3.121845, 1, 0, 0, 1, 1,
0.1279826, -0.1776437, 4.163505, 1, 0, 0, 1, 1,
0.1291959, 0.9522223, -0.1920989, 1, 0, 0, 1, 1,
0.1297839, -1.396734, 3.381526, 0, 0, 0, 1, 1,
0.1328599, -0.2174723, 1.311188, 0, 0, 0, 1, 1,
0.1330827, 0.01275547, 1.791161, 0, 0, 0, 1, 1,
0.1347612, -0.2439896, 1.925115, 0, 0, 0, 1, 1,
0.1359717, 1.236529, -0.1234473, 0, 0, 0, 1, 1,
0.1396453, -1.343302, 2.477365, 0, 0, 0, 1, 1,
0.1405357, 1.17462, 1.122202, 0, 0, 0, 1, 1,
0.1452893, 0.2142712, 0.8428944, 1, 1, 1, 1, 1,
0.1507888, 0.1938536, 1.127979, 1, 1, 1, 1, 1,
0.1519119, 1.93243, -0.5448751, 1, 1, 1, 1, 1,
0.1536711, -0.7260269, 3.038414, 1, 1, 1, 1, 1,
0.1539954, 0.04153588, -0.3791344, 1, 1, 1, 1, 1,
0.1575237, -0.7794693, 3.302807, 1, 1, 1, 1, 1,
0.1585356, 0.390795, 1.141531, 1, 1, 1, 1, 1,
0.1589417, 1.157488, -1.187185, 1, 1, 1, 1, 1,
0.1592358, -0.7857893, 3.331252, 1, 1, 1, 1, 1,
0.1617896, -2.160751, 3.933069, 1, 1, 1, 1, 1,
0.161807, 0.1736258, -0.4061321, 1, 1, 1, 1, 1,
0.1675584, 1.456903, -1.174772, 1, 1, 1, 1, 1,
0.1688937, -0.335604, 2.765185, 1, 1, 1, 1, 1,
0.1701208, 0.08809949, 1.533248, 1, 1, 1, 1, 1,
0.1729211, 0.9008865, 1.397964, 1, 1, 1, 1, 1,
0.1731876, 0.907301, -0.179214, 0, 0, 1, 1, 1,
0.1774015, -0.6530943, 2.706281, 1, 0, 0, 1, 1,
0.1797403, 0.6991759, 1.220392, 1, 0, 0, 1, 1,
0.180251, 0.04730425, 0.1709538, 1, 0, 0, 1, 1,
0.180852, 0.1387199, -1.582876, 1, 0, 0, 1, 1,
0.1829969, 2.418994, -0.3416356, 1, 0, 0, 1, 1,
0.1864541, -1.618599, 2.361355, 0, 0, 0, 1, 1,
0.1881487, -0.5153236, 5.274351, 0, 0, 0, 1, 1,
0.1942416, -1.434956, 4.062005, 0, 0, 0, 1, 1,
0.2030838, 0.4735559, -0.8853174, 0, 0, 0, 1, 1,
0.2041719, 0.9319256, -0.3302266, 0, 0, 0, 1, 1,
0.2042302, -0.3057345, 2.40131, 0, 0, 0, 1, 1,
0.2079324, 1.107379, 0.5902374, 0, 0, 0, 1, 1,
0.2106874, -1.732912, 4.710765, 1, 1, 1, 1, 1,
0.2127172, 0.6402628, 0.02687982, 1, 1, 1, 1, 1,
0.2157944, -0.1094484, 1.377594, 1, 1, 1, 1, 1,
0.2163134, 2.002216, -1.83067, 1, 1, 1, 1, 1,
0.2189785, -0.5512777, 3.479209, 1, 1, 1, 1, 1,
0.2245493, -0.06614076, 3.12141, 1, 1, 1, 1, 1,
0.2253084, 0.8243692, 1.345499, 1, 1, 1, 1, 1,
0.2280459, 0.423415, 2.291392, 1, 1, 1, 1, 1,
0.2336937, 0.04934612, 1.653795, 1, 1, 1, 1, 1,
0.23495, 0.6686628, 0.4432267, 1, 1, 1, 1, 1,
0.2350712, 0.9640678, 1.398942, 1, 1, 1, 1, 1,
0.2390583, -0.6080443, 3.884429, 1, 1, 1, 1, 1,
0.2393913, -0.03155609, 1.591904, 1, 1, 1, 1, 1,
0.2413354, -0.7111484, 5.647593, 1, 1, 1, 1, 1,
0.241596, -0.2606848, 1.688108, 1, 1, 1, 1, 1,
0.2434467, 0.6561429, -0.4741008, 0, 0, 1, 1, 1,
0.2456508, -0.7498483, 2.005781, 1, 0, 0, 1, 1,
0.2526822, 1.423927, 0.3233766, 1, 0, 0, 1, 1,
0.2532762, 0.5052137, -1.075513, 1, 0, 0, 1, 1,
0.2552817, 2.368228, 1.020386, 1, 0, 0, 1, 1,
0.2590276, -2.49552, 2.088031, 1, 0, 0, 1, 1,
0.259165, 1.637799, -0.03444029, 0, 0, 0, 1, 1,
0.2594621, 0.2165972, 2.559955, 0, 0, 0, 1, 1,
0.2684785, 3.946659, 1.205821, 0, 0, 0, 1, 1,
0.2711796, 0.2089624, 1.380544, 0, 0, 0, 1, 1,
0.2715183, -0.5938351, 5.415858, 0, 0, 0, 1, 1,
0.2723526, -1.263802, 4.425483, 0, 0, 0, 1, 1,
0.2734721, -0.5403956, 2.519351, 0, 0, 0, 1, 1,
0.2768103, -1.280916, 5.126144, 1, 1, 1, 1, 1,
0.2793858, 0.222509, -0.8636165, 1, 1, 1, 1, 1,
0.2843711, 0.147348, 0.4809467, 1, 1, 1, 1, 1,
0.2870082, 0.4619067, 0.1769847, 1, 1, 1, 1, 1,
0.2922629, 1.884706, 0.469394, 1, 1, 1, 1, 1,
0.2941237, 0.3137159, 0.1691254, 1, 1, 1, 1, 1,
0.295346, 0.0494242, 1.812708, 1, 1, 1, 1, 1,
0.2983627, 1.87674, 1.1048, 1, 1, 1, 1, 1,
0.2988541, 1.625243, -0.83206, 1, 1, 1, 1, 1,
0.2999511, 1.45862, -1.074864, 1, 1, 1, 1, 1,
0.3004289, -0.4210395, 2.978285, 1, 1, 1, 1, 1,
0.3015741, 1.291772, -0.627177, 1, 1, 1, 1, 1,
0.3022823, 0.2947268, 0.3334019, 1, 1, 1, 1, 1,
0.3035465, -0.04227387, 2.332587, 1, 1, 1, 1, 1,
0.3047694, -0.3711906, 2.211821, 1, 1, 1, 1, 1,
0.3055192, 0.922767, 1.339378, 0, 0, 1, 1, 1,
0.3065471, -0.4203073, 0.4713058, 1, 0, 0, 1, 1,
0.3068962, -0.860612, 2.633909, 1, 0, 0, 1, 1,
0.308768, 0.5039479, -0.1560904, 1, 0, 0, 1, 1,
0.3107926, -0.6615985, 3.055568, 1, 0, 0, 1, 1,
0.3112006, 0.6309013, -0.5636513, 1, 0, 0, 1, 1,
0.3121536, -0.5705843, 2.432984, 0, 0, 0, 1, 1,
0.3138707, 0.4047658, 1.15016, 0, 0, 0, 1, 1,
0.3160964, 1.109995, -0.5120662, 0, 0, 0, 1, 1,
0.3190905, 0.3841337, 0.3622495, 0, 0, 0, 1, 1,
0.320451, -0.7040151, 2.559155, 0, 0, 0, 1, 1,
0.326912, 2.596754, -0.178792, 0, 0, 0, 1, 1,
0.3301353, -0.9080449, 3.99171, 0, 0, 0, 1, 1,
0.3311753, 0.5137421, 1.950112, 1, 1, 1, 1, 1,
0.3317897, -1.715123, 2.674558, 1, 1, 1, 1, 1,
0.3323182, 1.356467, 0.6862124, 1, 1, 1, 1, 1,
0.3386396, 1.200104, 2.208476, 1, 1, 1, 1, 1,
0.3396339, -0.765277, 2.463445, 1, 1, 1, 1, 1,
0.3397425, -0.465001, 0.2047973, 1, 1, 1, 1, 1,
0.3417256, -0.4927679, 2.508799, 1, 1, 1, 1, 1,
0.3431709, -1.079491, 1.488662, 1, 1, 1, 1, 1,
0.3449203, -1.21737, 3.066129, 1, 1, 1, 1, 1,
0.3452955, -0.3280311, 4.417912, 1, 1, 1, 1, 1,
0.3542981, 0.2927128, -1.662719, 1, 1, 1, 1, 1,
0.3546903, -2.278991, 3.017039, 1, 1, 1, 1, 1,
0.3599463, 0.4128079, 1.224046, 1, 1, 1, 1, 1,
0.3603656, 1.11806, 2.062473, 1, 1, 1, 1, 1,
0.3633751, -0.2748964, 2.33842, 1, 1, 1, 1, 1,
0.3658081, -0.08514732, 2.066422, 0, 0, 1, 1, 1,
0.3667597, -1.522043, 4.330475, 1, 0, 0, 1, 1,
0.3703734, -0.07919263, 0.8185719, 1, 0, 0, 1, 1,
0.3712318, -1.19472, 3.26999, 1, 0, 0, 1, 1,
0.3779193, -1.25499, 2.060476, 1, 0, 0, 1, 1,
0.3779902, -0.4795671, 1.848423, 1, 0, 0, 1, 1,
0.3794691, -0.02108889, 1.763037, 0, 0, 0, 1, 1,
0.3798742, 0.09052963, 1.221534, 0, 0, 0, 1, 1,
0.3842379, -0.1827216, 1.538435, 0, 0, 0, 1, 1,
0.3912733, -2.891378, 3.582394, 0, 0, 0, 1, 1,
0.393109, -0.007411106, 3.303615, 0, 0, 0, 1, 1,
0.4003521, 0.7392763, 0.9615754, 0, 0, 0, 1, 1,
0.4099672, 0.4509747, 0.6221018, 0, 0, 0, 1, 1,
0.4109125, 0.3387627, 2.597704, 1, 1, 1, 1, 1,
0.4114332, -0.4079394, 3.124841, 1, 1, 1, 1, 1,
0.4133834, 0.06217554, 0.7607601, 1, 1, 1, 1, 1,
0.4142716, -1.968486, 2.932466, 1, 1, 1, 1, 1,
0.4155765, -0.6371754, 4.04797, 1, 1, 1, 1, 1,
0.4206116, -1.275487, 1.333912, 1, 1, 1, 1, 1,
0.4250773, 0.9885919, 1.676908, 1, 1, 1, 1, 1,
0.4257952, -0.1073996, 1.431868, 1, 1, 1, 1, 1,
0.4312562, -0.5027327, 3.794035, 1, 1, 1, 1, 1,
0.4432465, 1.153005, 1.169897, 1, 1, 1, 1, 1,
0.4441467, 1.760813, 0.4624265, 1, 1, 1, 1, 1,
0.4443458, 1.350425, -1.048264, 1, 1, 1, 1, 1,
0.4473843, 1.013717, -1.304981, 1, 1, 1, 1, 1,
0.4503613, 0.3293897, -0.4951648, 1, 1, 1, 1, 1,
0.4692217, 0.9909529, 0.6696633, 1, 1, 1, 1, 1,
0.4707887, 0.518418, 2.033262, 0, 0, 1, 1, 1,
0.4733328, 1.255413, 0.5292454, 1, 0, 0, 1, 1,
0.4739217, 0.8251446, 0.05819508, 1, 0, 0, 1, 1,
0.4849008, -0.8814631, 2.167376, 1, 0, 0, 1, 1,
0.4860892, -0.6101393, 2.915274, 1, 0, 0, 1, 1,
0.495598, 1.136358, 1.527191, 1, 0, 0, 1, 1,
0.4960779, 1.319444, 0.0976285, 0, 0, 0, 1, 1,
0.4992126, 0.6056003, -0.557667, 0, 0, 0, 1, 1,
0.503117, 0.2337536, 1.995784, 0, 0, 0, 1, 1,
0.5056534, 1.126557, 1.607904, 0, 0, 0, 1, 1,
0.5066299, -0.3775898, 2.751704, 0, 0, 0, 1, 1,
0.5143694, -0.1593824, 1.919445, 0, 0, 0, 1, 1,
0.5160233, 1.882166, 0.5522521, 0, 0, 0, 1, 1,
0.516273, -0.3190488, 2.423756, 1, 1, 1, 1, 1,
0.5164575, 0.1669843, 1.429239, 1, 1, 1, 1, 1,
0.5208623, -1.458168, 1.649924, 1, 1, 1, 1, 1,
0.5258995, 0.4418824, -1.009544, 1, 1, 1, 1, 1,
0.5263745, -0.7867886, 5.417085, 1, 1, 1, 1, 1,
0.530625, -0.5596461, 1.684172, 1, 1, 1, 1, 1,
0.5308173, 1.802344, -0.6277179, 1, 1, 1, 1, 1,
0.5326603, 0.1879291, -0.7271622, 1, 1, 1, 1, 1,
0.5392113, -0.2948165, 2.920389, 1, 1, 1, 1, 1,
0.5398187, -0.06561495, 1.892323, 1, 1, 1, 1, 1,
0.5411505, 1.132383, 0.81991, 1, 1, 1, 1, 1,
0.5504278, -1.493812, 2.154962, 1, 1, 1, 1, 1,
0.5545835, 1.175337, 0.9018635, 1, 1, 1, 1, 1,
0.5590491, 1.503688, 0.508765, 1, 1, 1, 1, 1,
0.560081, 0.4344963, 2.662172, 1, 1, 1, 1, 1,
0.5748519, 0.4827896, -0.5612801, 0, 0, 1, 1, 1,
0.5764507, 1.063765, 0.7302766, 1, 0, 0, 1, 1,
0.5801449, -1.589043, 2.692672, 1, 0, 0, 1, 1,
0.5822098, -0.07201535, 1.326487, 1, 0, 0, 1, 1,
0.585066, -0.7959095, 2.202389, 1, 0, 0, 1, 1,
0.5891743, 0.3495983, 0.5777512, 1, 0, 0, 1, 1,
0.5949721, 0.5643193, 1.209278, 0, 0, 0, 1, 1,
0.5968937, -1.549028, 4.04947, 0, 0, 0, 1, 1,
0.5974314, 0.8671013, 3.894756, 0, 0, 0, 1, 1,
0.6007559, 0.6388617, 1.928481, 0, 0, 0, 1, 1,
0.6044884, -0.7687688, 3.799338, 0, 0, 0, 1, 1,
0.6112869, 1.145547, 1.739689, 0, 0, 0, 1, 1,
0.6113424, 0.8717442, -1.199242, 0, 0, 0, 1, 1,
0.6138834, 1.283518, -0.5480201, 1, 1, 1, 1, 1,
0.6151245, 1.242263, 1.360797, 1, 1, 1, 1, 1,
0.6175705, -0.755887, 2.214653, 1, 1, 1, 1, 1,
0.6209982, 0.819516, 0.8392224, 1, 1, 1, 1, 1,
0.6219607, 0.8322545, 0.1389095, 1, 1, 1, 1, 1,
0.6257384, -0.621524, 2.8734, 1, 1, 1, 1, 1,
0.6267593, -0.6511153, 3.204372, 1, 1, 1, 1, 1,
0.6318434, 0.1379622, 0.361643, 1, 1, 1, 1, 1,
0.6328483, 0.4134787, -0.1589149, 1, 1, 1, 1, 1,
0.6331144, 0.2153727, 3.047646, 1, 1, 1, 1, 1,
0.6337729, 0.1649985, 0.6483542, 1, 1, 1, 1, 1,
0.6363706, -1.119789, 1.754148, 1, 1, 1, 1, 1,
0.6369475, 0.7697165, -0.6699427, 1, 1, 1, 1, 1,
0.6398094, -1.414889, 2.083117, 1, 1, 1, 1, 1,
0.6418747, -1.64068, 3.941556, 1, 1, 1, 1, 1,
0.6422842, 0.3532245, 2.0996, 0, 0, 1, 1, 1,
0.6511291, 0.7943382, 2.106688, 1, 0, 0, 1, 1,
0.6558893, 0.02579299, 0.002202318, 1, 0, 0, 1, 1,
0.6561946, -1.61487, 2.706983, 1, 0, 0, 1, 1,
0.6612162, -0.3232401, 2.888852, 1, 0, 0, 1, 1,
0.6655597, -0.6905738, 1.652316, 1, 0, 0, 1, 1,
0.6660071, -0.8341631, 1.102482, 0, 0, 0, 1, 1,
0.6697949, -0.8929189, 1.808101, 0, 0, 0, 1, 1,
0.6701092, -0.06991082, 2.061955, 0, 0, 0, 1, 1,
0.6706144, 0.755046, 0.175613, 0, 0, 0, 1, 1,
0.6749185, -0.2929733, 1.425397, 0, 0, 0, 1, 1,
0.6771103, 0.2271142, 1.196215, 0, 0, 0, 1, 1,
0.6802004, -1.067716, 2.120052, 0, 0, 0, 1, 1,
0.6836713, 0.2679763, 1.343707, 1, 1, 1, 1, 1,
0.6942726, 0.6092783, -1.07211, 1, 1, 1, 1, 1,
0.6964055, 0.06737842, 0.830737, 1, 1, 1, 1, 1,
0.7013429, 1.44795, 1.037947, 1, 1, 1, 1, 1,
0.7125234, 0.8716799, -0.1834579, 1, 1, 1, 1, 1,
0.7153373, 0.3083031, 2.089119, 1, 1, 1, 1, 1,
0.716855, 0.3618366, 1.984271, 1, 1, 1, 1, 1,
0.7184893, 2.199293, -0.6900885, 1, 1, 1, 1, 1,
0.7190423, -1.134615, 3.106847, 1, 1, 1, 1, 1,
0.7223698, 0.2005106, 2.194179, 1, 1, 1, 1, 1,
0.7321185, -0.5454295, 2.263932, 1, 1, 1, 1, 1,
0.7343397, 1.332094, 1.613232, 1, 1, 1, 1, 1,
0.7438701, -1.031926, 2.186001, 1, 1, 1, 1, 1,
0.7514218, -0.7346433, 1.249895, 1, 1, 1, 1, 1,
0.7566409, 0.7686307, 1.445462, 1, 1, 1, 1, 1,
0.7570515, -1.242502, 2.906925, 0, 0, 1, 1, 1,
0.7585766, -0.6915529, 3.300493, 1, 0, 0, 1, 1,
0.7632959, 1.200248, 1.769998, 1, 0, 0, 1, 1,
0.7653072, 1.476138, -0.1029351, 1, 0, 0, 1, 1,
0.7710726, 0.8563404, 0.4639069, 1, 0, 0, 1, 1,
0.7739258, -1.310893, 2.387535, 1, 0, 0, 1, 1,
0.7775328, 0.42879, 1.415283, 0, 0, 0, 1, 1,
0.777857, 0.1437575, 1.599174, 0, 0, 0, 1, 1,
0.7780589, -0.7498249, 3.101523, 0, 0, 0, 1, 1,
0.7793329, 0.6398028, 1.383158, 0, 0, 0, 1, 1,
0.7795729, -0.3608009, 2.396001, 0, 0, 0, 1, 1,
0.7811366, 0.4999242, 2.707512, 0, 0, 0, 1, 1,
0.7844818, -0.06623927, 0.8527158, 0, 0, 0, 1, 1,
0.7855186, 1.174709, 0.7811282, 1, 1, 1, 1, 1,
0.7856436, -0.8593479, 2.752716, 1, 1, 1, 1, 1,
0.7873003, 0.7848153, 2.467931, 1, 1, 1, 1, 1,
0.7894766, -0.874877, 3.48602, 1, 1, 1, 1, 1,
0.7906036, -0.6311219, 2.975352, 1, 1, 1, 1, 1,
0.7921739, 0.3971185, 2.659586, 1, 1, 1, 1, 1,
0.7924453, -0.6850543, 0.4917065, 1, 1, 1, 1, 1,
0.794161, -1.123135, 2.533484, 1, 1, 1, 1, 1,
0.795545, 0.6667709, -0.04253026, 1, 1, 1, 1, 1,
0.7995535, 0.4201994, 0.6394435, 1, 1, 1, 1, 1,
0.800446, -0.1621922, 0.1427689, 1, 1, 1, 1, 1,
0.80479, -1.119357, -0.5374774, 1, 1, 1, 1, 1,
0.8062657, 0.2581679, 1.726044, 1, 1, 1, 1, 1,
0.8074285, -0.1100557, 1.348395, 1, 1, 1, 1, 1,
0.81829, 0.1955758, 1.482682, 1, 1, 1, 1, 1,
0.8200681, -1.344299, 2.896823, 0, 0, 1, 1, 1,
0.8216523, 0.7050533, 0.2491931, 1, 0, 0, 1, 1,
0.8223701, 1.308264, 2.134188, 1, 0, 0, 1, 1,
0.8271965, 1.910554, -0.7991742, 1, 0, 0, 1, 1,
0.8304532, -2.016462, 3.494053, 1, 0, 0, 1, 1,
0.8312708, 2.454846, 1.20842, 1, 0, 0, 1, 1,
0.8376434, -0.881483, 2.280063, 0, 0, 0, 1, 1,
0.8387965, 0.1386167, 1.673775, 0, 0, 0, 1, 1,
0.8437055, 0.5396007, 3.330236, 0, 0, 0, 1, 1,
0.8515254, 0.07996694, 1.291331, 0, 0, 0, 1, 1,
0.8527038, 1.193096, 1.096814, 0, 0, 0, 1, 1,
0.8583066, 0.8593991, -0.4828305, 0, 0, 0, 1, 1,
0.8628028, -0.7219846, 1.818409, 0, 0, 0, 1, 1,
0.8651988, -0.02386293, -0.1983943, 1, 1, 1, 1, 1,
0.8753294, 0.2058533, 0.9939318, 1, 1, 1, 1, 1,
0.8778541, -0.03377943, 1.834571, 1, 1, 1, 1, 1,
0.8780868, -0.06083629, 1.782042, 1, 1, 1, 1, 1,
0.8792433, -0.2752666, -0.1308466, 1, 1, 1, 1, 1,
0.8795236, -0.3341893, 2.345014, 1, 1, 1, 1, 1,
0.8815961, -0.8236015, 3.302678, 1, 1, 1, 1, 1,
0.8831511, 0.2629001, 0.1680929, 1, 1, 1, 1, 1,
0.8853654, 0.209898, 0.0585595, 1, 1, 1, 1, 1,
0.8877404, 1.171369, 0.7479507, 1, 1, 1, 1, 1,
0.8919737, -0.5166329, 1.886869, 1, 1, 1, 1, 1,
0.8933097, -0.3152428, 2.376796, 1, 1, 1, 1, 1,
0.8946745, -0.1557687, 2.050867, 1, 1, 1, 1, 1,
0.9123624, -1.051562, 2.011929, 1, 1, 1, 1, 1,
0.9183395, 1.030245, 0.8659931, 1, 1, 1, 1, 1,
0.9193832, -0.8396876, 1.159805, 0, 0, 1, 1, 1,
0.9205982, 0.8913556, 0.322562, 1, 0, 0, 1, 1,
0.9324175, 1.901789, 0.9787896, 1, 0, 0, 1, 1,
0.9365333, 0.5465084, 2.58625, 1, 0, 0, 1, 1,
0.9382852, 0.4041643, 1.576202, 1, 0, 0, 1, 1,
0.9403482, 0.00199892, 3.294842, 1, 0, 0, 1, 1,
0.9429325, -1.467466, 3.083458, 0, 0, 0, 1, 1,
0.9477898, 1.494342, -0.2917352, 0, 0, 0, 1, 1,
0.9478282, -0.4873599, 3.375215, 0, 0, 0, 1, 1,
0.9480013, 0.6145366, -0.3075117, 0, 0, 0, 1, 1,
0.9507348, 0.9941221, -0.4699263, 0, 0, 0, 1, 1,
0.9514559, -0.6319169, 3.144003, 0, 0, 0, 1, 1,
0.9527292, 0.892229, 0.6186642, 0, 0, 0, 1, 1,
0.96027, -0.02680751, 1.651884, 1, 1, 1, 1, 1,
0.9632295, 0.4331599, 0.2254525, 1, 1, 1, 1, 1,
0.9640757, 0.5818412, -0.06722086, 1, 1, 1, 1, 1,
0.9695257, -0.01275893, 2.099423, 1, 1, 1, 1, 1,
0.9982349, -0.4757235, 3.029078, 1, 1, 1, 1, 1,
1.005057, 0.2244154, 1.231238, 1, 1, 1, 1, 1,
1.009003, -0.7227842, 1.211677, 1, 1, 1, 1, 1,
1.009436, 0.728207, -1.052442, 1, 1, 1, 1, 1,
1.012269, 0.9062185, 1.3155, 1, 1, 1, 1, 1,
1.017202, -0.2338258, 3.102854, 1, 1, 1, 1, 1,
1.018273, 0.7321084, -0.4296947, 1, 1, 1, 1, 1,
1.018883, 0.04545909, -0.9446529, 1, 1, 1, 1, 1,
1.021196, 0.315103, 0.3452831, 1, 1, 1, 1, 1,
1.034659, -0.4333964, 1.525415, 1, 1, 1, 1, 1,
1.036767, -0.26442, 1.024724, 1, 1, 1, 1, 1,
1.037048, 1.419377, 1.39863, 0, 0, 1, 1, 1,
1.039453, -0.1615746, 0.4170376, 1, 0, 0, 1, 1,
1.041391, -1.599838, 2.361694, 1, 0, 0, 1, 1,
1.044717, -1.758753, 1.778365, 1, 0, 0, 1, 1,
1.04751, -0.815827, 1.671268, 1, 0, 0, 1, 1,
1.049874, 0.02278588, 0.8496985, 1, 0, 0, 1, 1,
1.054085, 0.9215354, 3.733917, 0, 0, 0, 1, 1,
1.057241, -0.7321481, 2.278423, 0, 0, 0, 1, 1,
1.057732, -0.1105949, 1.64432, 0, 0, 0, 1, 1,
1.059995, -0.1695738, 2.22944, 0, 0, 0, 1, 1,
1.060303, -0.1948896, 0.141247, 0, 0, 0, 1, 1,
1.065135, 0.4510573, 0.3887942, 0, 0, 0, 1, 1,
1.070891, 0.7287269, 2.938494, 0, 0, 0, 1, 1,
1.075233, 1.032963, 0.9917946, 1, 1, 1, 1, 1,
1.077815, -0.2231206, 1.558926, 1, 1, 1, 1, 1,
1.077881, 0.1515411, 0.7717804, 1, 1, 1, 1, 1,
1.078315, 0.055741, 1.611312, 1, 1, 1, 1, 1,
1.086755, 1.594746, -0.07840677, 1, 1, 1, 1, 1,
1.089648, -0.264564, 1.585987, 1, 1, 1, 1, 1,
1.091464, 0.1171846, 0.5129593, 1, 1, 1, 1, 1,
1.09857, 1.158719, 1.564754, 1, 1, 1, 1, 1,
1.099277, 0.9492552, 0.6308969, 1, 1, 1, 1, 1,
1.102379, -1.838772, 3.600527, 1, 1, 1, 1, 1,
1.114667, -0.01686628, 1.148926, 1, 1, 1, 1, 1,
1.118235, 0.4005481, 1.940139, 1, 1, 1, 1, 1,
1.119672, -0.09602011, 1.327431, 1, 1, 1, 1, 1,
1.120313, -3.144003, 3.346128, 1, 1, 1, 1, 1,
1.123202, 0.2716017, 0.7732065, 1, 1, 1, 1, 1,
1.126666, 1.370152, 1.453562, 0, 0, 1, 1, 1,
1.13138, 0.8110284, 0.8168064, 1, 0, 0, 1, 1,
1.133493, -0.7720872, 1.809518, 1, 0, 0, 1, 1,
1.139829, -0.2188195, 0.4816332, 1, 0, 0, 1, 1,
1.143044, 0.9646385, 0.8513402, 1, 0, 0, 1, 1,
1.15084, 0.5970668, 2.607626, 1, 0, 0, 1, 1,
1.152705, -0.143518, 1.315489, 0, 0, 0, 1, 1,
1.162334, -0.3094161, 2.653254, 0, 0, 0, 1, 1,
1.162592, -0.8301651, 3.015984, 0, 0, 0, 1, 1,
1.165205, 0.5484351, 0.3593949, 0, 0, 0, 1, 1,
1.18319, 0.06189383, 2.685955, 0, 0, 0, 1, 1,
1.185097, -0.8212624, 0.2744091, 0, 0, 0, 1, 1,
1.186143, 1.889031, 0.4638667, 0, 0, 0, 1, 1,
1.193554, -0.9865537, 2.043483, 1, 1, 1, 1, 1,
1.198177, -0.03490872, 2.287605, 1, 1, 1, 1, 1,
1.20376, 0.5298542, 1.889934, 1, 1, 1, 1, 1,
1.204668, -1.440381, 2.047126, 1, 1, 1, 1, 1,
1.214204, -1.225733, 2.131168, 1, 1, 1, 1, 1,
1.218567, -1.997694, 1.842883, 1, 1, 1, 1, 1,
1.227519, -2.369655, 2.073325, 1, 1, 1, 1, 1,
1.231789, -1.113546, 2.1522, 1, 1, 1, 1, 1,
1.235392, -0.2086176, 2.216126, 1, 1, 1, 1, 1,
1.242046, -0.5959555, 1.388628, 1, 1, 1, 1, 1,
1.242056, 0.03798986, 0.7971005, 1, 1, 1, 1, 1,
1.243667, -0.6691149, 1.557404, 1, 1, 1, 1, 1,
1.244283, 1.59665, 1.462049, 1, 1, 1, 1, 1,
1.256924, 0.8615012, 0.9180835, 1, 1, 1, 1, 1,
1.265301, -1.145654, 3.827882, 1, 1, 1, 1, 1,
1.268452, -0.8172694, 2.314741, 0, 0, 1, 1, 1,
1.268689, -0.2841012, 1.233974, 1, 0, 0, 1, 1,
1.270468, -0.728043, 4.080032, 1, 0, 0, 1, 1,
1.278018, 0.5657222, 1.569491, 1, 0, 0, 1, 1,
1.281801, 1.631149, -0.2067144, 1, 0, 0, 1, 1,
1.283177, 0.0185808, 1.318215, 1, 0, 0, 1, 1,
1.292045, -0.8562626, 1.410009, 0, 0, 0, 1, 1,
1.295759, -1.188326, 3.518616, 0, 0, 0, 1, 1,
1.317914, -0.6034764, 1.238732, 0, 0, 0, 1, 1,
1.31859, -0.4084961, 2.31911, 0, 0, 0, 1, 1,
1.322972, 2.845236, -0.2559901, 0, 0, 0, 1, 1,
1.323378, 1.833811, 1.276502, 0, 0, 0, 1, 1,
1.333692, 0.6641807, 2.243804, 0, 0, 0, 1, 1,
1.339564, -1.037106, 2.025401, 1, 1, 1, 1, 1,
1.341637, 1.55043, -0.4276598, 1, 1, 1, 1, 1,
1.349316, -0.518672, 2.666254, 1, 1, 1, 1, 1,
1.353614, -1.073262, 2.289708, 1, 1, 1, 1, 1,
1.356383, 0.5165009, 0.1049076, 1, 1, 1, 1, 1,
1.360203, 1.059467, 0.466337, 1, 1, 1, 1, 1,
1.360375, 0.4575788, 2.927714, 1, 1, 1, 1, 1,
1.36704, -0.6548248, 0.9719233, 1, 1, 1, 1, 1,
1.369268, 0.3815153, 1.162861, 1, 1, 1, 1, 1,
1.369806, 1.896861, 0.9733344, 1, 1, 1, 1, 1,
1.374303, 0.5320366, 0.8603802, 1, 1, 1, 1, 1,
1.37528, -0.960793, 2.86327, 1, 1, 1, 1, 1,
1.385635, 0.8274363, 0.4918914, 1, 1, 1, 1, 1,
1.398893, 2.095289, -0.0001036329, 1, 1, 1, 1, 1,
1.43378, 0.8987623, 1.253459, 1, 1, 1, 1, 1,
1.434171, -0.01835524, 1.942273, 0, 0, 1, 1, 1,
1.446307, 0.4167845, 2.569356, 1, 0, 0, 1, 1,
1.448485, -1.364393, 0.6666909, 1, 0, 0, 1, 1,
1.457036, 0.04066598, 2.85155, 1, 0, 0, 1, 1,
1.46209, 1.925527, 1.560795, 1, 0, 0, 1, 1,
1.472451, -0.05164057, 1.727169, 1, 0, 0, 1, 1,
1.472693, 0.3055525, 0.4713114, 0, 0, 0, 1, 1,
1.480583, 0.1571205, 0.4285055, 0, 0, 0, 1, 1,
1.488461, 0.6162387, -0.18445, 0, 0, 0, 1, 1,
1.489678, 0.3460225, 1.260994, 0, 0, 0, 1, 1,
1.500283, -0.6759914, 1.532654, 0, 0, 0, 1, 1,
1.517755, 1.260559, 0.6206822, 0, 0, 0, 1, 1,
1.53946, -0.1857881, 1.110717, 0, 0, 0, 1, 1,
1.544181, -0.456384, 2.466694, 1, 1, 1, 1, 1,
1.562283, -0.6150497, 1.733181, 1, 1, 1, 1, 1,
1.575121, 0.1457592, 1.74678, 1, 1, 1, 1, 1,
1.623427, -0.562815, 1.874216, 1, 1, 1, 1, 1,
1.638549, -0.27847, 1.391363, 1, 1, 1, 1, 1,
1.640516, 0.09010464, 0.4619679, 1, 1, 1, 1, 1,
1.650996, -1.109141, 2.933921, 1, 1, 1, 1, 1,
1.651902, -1.329493, 2.998043, 1, 1, 1, 1, 1,
1.658503, -2.546516, 2.916255, 1, 1, 1, 1, 1,
1.707651, -2.298812, 3.837765, 1, 1, 1, 1, 1,
1.707944, 0.6283581, 3.019513, 1, 1, 1, 1, 1,
1.709901, -0.2458081, 0.6940358, 1, 1, 1, 1, 1,
1.710512, -0.2409897, 1.906509, 1, 1, 1, 1, 1,
1.711813, 0.1471875, 1.787607, 1, 1, 1, 1, 1,
1.719143, 1.248408, 2.375401, 1, 1, 1, 1, 1,
1.734699, -1.277703, 1.979451, 0, 0, 1, 1, 1,
1.735018, -0.2851707, 0.79308, 1, 0, 0, 1, 1,
1.742396, 0.8367, 1.09833, 1, 0, 0, 1, 1,
1.751926, 0.03437425, 1.733911, 1, 0, 0, 1, 1,
1.754783, -1.643902, 2.105724, 1, 0, 0, 1, 1,
1.758047, 1.164023, -0.708154, 1, 0, 0, 1, 1,
1.77625, 2.296268, 1.217836, 0, 0, 0, 1, 1,
1.776964, -2.344615, 2.919519, 0, 0, 0, 1, 1,
1.78516, 0.007162184, 1.426952, 0, 0, 0, 1, 1,
1.788086, 0.0279783, 1.259765, 0, 0, 0, 1, 1,
1.804364, 0.3404814, 0.8673657, 0, 0, 0, 1, 1,
1.812503, 0.3144703, 2.241115, 0, 0, 0, 1, 1,
1.820496, 0.05330212, 1.410152, 0, 0, 0, 1, 1,
1.824047, -2.144643, 3.782734, 1, 1, 1, 1, 1,
1.831476, -0.7256823, 3.847689, 1, 1, 1, 1, 1,
1.836831, -1.170192, 1.615674, 1, 1, 1, 1, 1,
1.873928, 1.248329, -1.834749, 1, 1, 1, 1, 1,
1.896629, -0.05714252, 1.224077, 1, 1, 1, 1, 1,
1.897633, 1.424816, 0.1107884, 1, 1, 1, 1, 1,
1.910786, 2.167655, 1.485829, 1, 1, 1, 1, 1,
1.91219, 0.9395837, 1.444853, 1, 1, 1, 1, 1,
1.923302, -0.8123344, 0.5033969, 1, 1, 1, 1, 1,
1.931652, 0.5570697, 1.791826, 1, 1, 1, 1, 1,
1.961565, -0.4854634, -0.8655877, 1, 1, 1, 1, 1,
1.970838, -1.002248, 2.100439, 1, 1, 1, 1, 1,
1.985941, 0.433013, 3.362159, 1, 1, 1, 1, 1,
2.014828, 1.471479, 0.2733775, 1, 1, 1, 1, 1,
2.057199, -0.2652611, 0.3181841, 1, 1, 1, 1, 1,
2.090361, 0.6512871, 2.070183, 0, 0, 1, 1, 1,
2.099124, 0.8630825, 0.8741269, 1, 0, 0, 1, 1,
2.109837, 0.311455, 0.2350627, 1, 0, 0, 1, 1,
2.124653, 1.212188, 0.327883, 1, 0, 0, 1, 1,
2.126871, -1.801036, 2.701816, 1, 0, 0, 1, 1,
2.149217, -0.3669685, 1.292744, 1, 0, 0, 1, 1,
2.149284, 1.826932, -0.6521264, 0, 0, 0, 1, 1,
2.210308, 1.366774, 1.216295, 0, 0, 0, 1, 1,
2.218546, 0.09263641, 0.03143877, 0, 0, 0, 1, 1,
2.281715, -0.2936151, 3.644541, 0, 0, 0, 1, 1,
2.294207, -0.1955969, 2.260287, 0, 0, 0, 1, 1,
2.318387, 0.2982044, -0.06095474, 0, 0, 0, 1, 1,
2.391865, 0.3780152, 0.591807, 0, 0, 0, 1, 1,
2.444202, -0.5102208, 0.4666209, 1, 1, 1, 1, 1,
2.51194, -1.801929, 2.991703, 1, 1, 1, 1, 1,
2.533291, 0.368699, 1.079737, 1, 1, 1, 1, 1,
2.649453, 0.7668046, 1.831496, 1, 1, 1, 1, 1,
2.804143, 0.07998335, 1.726501, 1, 1, 1, 1, 1,
3.033361, -0.4328758, 2.181551, 1, 1, 1, 1, 1,
3.458783, -1.155326, 3.292374, 1, 1, 1, 1, 1
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
var radius = 9.906841;
var distance = 34.79736;
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
mvMatrix.translate( -0.3044052, -0.2506466, -0.1822546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79736);
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
