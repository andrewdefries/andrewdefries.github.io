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
-2.954459, -2.215659, -3.320256, 1, 0, 0, 1,
-2.695783, 1.689265, -1.487709, 1, 0.007843138, 0, 1,
-2.595664, 1.017502, -0.2778676, 1, 0.01176471, 0, 1,
-2.488215, 0.01506973, -0.813363, 1, 0.01960784, 0, 1,
-2.43945, -0.1945117, -2.132069, 1, 0.02352941, 0, 1,
-2.3911, 0.2303287, -0.9121394, 1, 0.03137255, 0, 1,
-2.378091, -0.4476022, -2.147081, 1, 0.03529412, 0, 1,
-2.286261, 1.515038, -0.1456822, 1, 0.04313726, 0, 1,
-2.265854, -0.4674698, -1.555282, 1, 0.04705882, 0, 1,
-2.195395, -0.01184618, -1.665813, 1, 0.05490196, 0, 1,
-2.194465, 0.6515762, -3.112439, 1, 0.05882353, 0, 1,
-2.186683, 1.248266, 0.1835417, 1, 0.06666667, 0, 1,
-2.152452, -0.008860918, -1.671754, 1, 0.07058824, 0, 1,
-2.143106, 1.940141, 0.5866241, 1, 0.07843138, 0, 1,
-2.083199, -0.5116938, -2.965752, 1, 0.08235294, 0, 1,
-2.077776, 0.08185299, -0.330761, 1, 0.09019608, 0, 1,
-2.072318, 0.7277993, -2.11851, 1, 0.09411765, 0, 1,
-2.057045, -0.2094432, -2.669531, 1, 0.1019608, 0, 1,
-2.051303, -0.60603, -3.174379, 1, 0.1098039, 0, 1,
-2.038437, 0.9398624, -0.6963731, 1, 0.1137255, 0, 1,
-2.023633, 0.4442383, 0.05143153, 1, 0.1215686, 0, 1,
-2.018396, -0.4881553, -3.285757, 1, 0.1254902, 0, 1,
-1.995892, -0.7046152, -1.161, 1, 0.1333333, 0, 1,
-1.980565, -2.514979, -0.3796662, 1, 0.1372549, 0, 1,
-1.908875, -0.9009209, -2.637267, 1, 0.145098, 0, 1,
-1.888304, -1.071049, -0.8078377, 1, 0.1490196, 0, 1,
-1.887205, 0.319391, 0.0901024, 1, 0.1568628, 0, 1,
-1.885387, -0.2745881, -1.676785, 1, 0.1607843, 0, 1,
-1.879548, 0.6648588, 1.275931, 1, 0.1686275, 0, 1,
-1.877013, -1.152059, -0.4397869, 1, 0.172549, 0, 1,
-1.853225, 1.272834, -0.7309493, 1, 0.1803922, 0, 1,
-1.845377, 2.457187, -1.878361, 1, 0.1843137, 0, 1,
-1.834006, 0.8681415, -1.681003, 1, 0.1921569, 0, 1,
-1.818614, 0.9567773, -0.7072374, 1, 0.1960784, 0, 1,
-1.806071, 1.145253, -2.198997, 1, 0.2039216, 0, 1,
-1.7921, 0.2243581, -1.245731, 1, 0.2117647, 0, 1,
-1.7826, -0.7437022, -0.8915294, 1, 0.2156863, 0, 1,
-1.782287, -0.5845312, -1.268891, 1, 0.2235294, 0, 1,
-1.77093, -0.4943042, -1.426731, 1, 0.227451, 0, 1,
-1.770546, -0.8530269, -4.112381, 1, 0.2352941, 0, 1,
-1.764536, 1.257264, -1.824831, 1, 0.2392157, 0, 1,
-1.763293, 1.27914, -1.326055, 1, 0.2470588, 0, 1,
-1.736403, 1.625466, -1.832482, 1, 0.2509804, 0, 1,
-1.733539, -1.434586, -0.6838005, 1, 0.2588235, 0, 1,
-1.733005, 0.5771412, -1.014163, 1, 0.2627451, 0, 1,
-1.731729, -1.058106, -1.546367, 1, 0.2705882, 0, 1,
-1.685218, 0.4680746, -0.6741205, 1, 0.2745098, 0, 1,
-1.678051, -0.4878745, -1.708603, 1, 0.282353, 0, 1,
-1.670328, -1.650687, -2.444854, 1, 0.2862745, 0, 1,
-1.669529, 0.007859915, -1.324672, 1, 0.2941177, 0, 1,
-1.666598, -1.271298, -1.510765, 1, 0.3019608, 0, 1,
-1.643518, -0.4123147, -1.215867, 1, 0.3058824, 0, 1,
-1.637938, -0.6724347, -1.582592, 1, 0.3137255, 0, 1,
-1.637829, -1.136529, -3.994014, 1, 0.3176471, 0, 1,
-1.634975, -0.9505015, -0.8755959, 1, 0.3254902, 0, 1,
-1.603536, 1.01789, 0.7605068, 1, 0.3294118, 0, 1,
-1.595064, 1.394821, -1.125491, 1, 0.3372549, 0, 1,
-1.593786, 0.06299184, -0.576207, 1, 0.3411765, 0, 1,
-1.577241, -0.08967626, 0.416155, 1, 0.3490196, 0, 1,
-1.576896, 0.7922067, -1.072187, 1, 0.3529412, 0, 1,
-1.556123, -0.4655304, -4.14484, 1, 0.3607843, 0, 1,
-1.552748, -0.6726285, -2.090496, 1, 0.3647059, 0, 1,
-1.522562, 0.8293579, -1.717519, 1, 0.372549, 0, 1,
-1.517073, 1.979979, -1.028826, 1, 0.3764706, 0, 1,
-1.515406, -0.8633633, -2.980023, 1, 0.3843137, 0, 1,
-1.511157, -1.773077, -1.492699, 1, 0.3882353, 0, 1,
-1.496119, 0.5051972, -0.729026, 1, 0.3960784, 0, 1,
-1.48281, 0.87743, -1.724174, 1, 0.4039216, 0, 1,
-1.481296, -0.8153834, -2.359292, 1, 0.4078431, 0, 1,
-1.471681, -0.2270941, -1.942476, 1, 0.4156863, 0, 1,
-1.4592, 1.899317, 0.3733602, 1, 0.4196078, 0, 1,
-1.453467, 0.8691302, 0.438971, 1, 0.427451, 0, 1,
-1.450417, 0.7401013, -0.903956, 1, 0.4313726, 0, 1,
-1.447529, -1.762581, -2.480287, 1, 0.4392157, 0, 1,
-1.440925, 0.9372229, -0.1774157, 1, 0.4431373, 0, 1,
-1.433745, -0.2618309, -1.528003, 1, 0.4509804, 0, 1,
-1.421701, 1.440352, -0.438709, 1, 0.454902, 0, 1,
-1.417164, 0.4902749, -0.524569, 1, 0.4627451, 0, 1,
-1.416856, -0.7300056, -1.268552, 1, 0.4666667, 0, 1,
-1.411355, -0.7625559, -3.595658, 1, 0.4745098, 0, 1,
-1.374003, 1.30272, -0.624815, 1, 0.4784314, 0, 1,
-1.3722, 0.4700525, -2.479706, 1, 0.4862745, 0, 1,
-1.370982, -0.5519633, -1.005001, 1, 0.4901961, 0, 1,
-1.358434, 1.255467, -0.2633936, 1, 0.4980392, 0, 1,
-1.352058, 1.433929, -0.9454291, 1, 0.5058824, 0, 1,
-1.35144, -1.115823, -1.361974, 1, 0.509804, 0, 1,
-1.347194, 1.407457, -0.9549914, 1, 0.5176471, 0, 1,
-1.345047, 2.328147, -1.309046, 1, 0.5215687, 0, 1,
-1.344298, 0.6003498, -0.5352086, 1, 0.5294118, 0, 1,
-1.341611, 0.04932116, -1.998927, 1, 0.5333334, 0, 1,
-1.336091, 0.06420172, 0.3315141, 1, 0.5411765, 0, 1,
-1.332619, -0.3800084, -0.8959861, 1, 0.5450981, 0, 1,
-1.327399, -1.434185, -1.369059, 1, 0.5529412, 0, 1,
-1.309931, -0.9318237, -2.108873, 1, 0.5568628, 0, 1,
-1.30648, -0.8181233, -1.617739, 1, 0.5647059, 0, 1,
-1.294988, -1.452199, -3.205009, 1, 0.5686275, 0, 1,
-1.291155, 0.7803415, -0.501172, 1, 0.5764706, 0, 1,
-1.282327, 2.239809, -0.5354033, 1, 0.5803922, 0, 1,
-1.280255, 1.007819, -0.3858422, 1, 0.5882353, 0, 1,
-1.255117, -0.782181, -2.218403, 1, 0.5921569, 0, 1,
-1.254332, 0.2307587, -0.6562548, 1, 0.6, 0, 1,
-1.248115, -1.170823, -3.631218, 1, 0.6078432, 0, 1,
-1.242393, 1.198983, -0.9345553, 1, 0.6117647, 0, 1,
-1.239662, 0.0480704, -0.1827166, 1, 0.6196079, 0, 1,
-1.231354, -0.8641359, -2.642663, 1, 0.6235294, 0, 1,
-1.227485, -0.2697742, -1.421411, 1, 0.6313726, 0, 1,
-1.225176, -2.781673, -2.959995, 1, 0.6352941, 0, 1,
-1.218043, 0.2995692, -1.560499, 1, 0.6431373, 0, 1,
-1.20648, 0.2221007, -1.34643, 1, 0.6470588, 0, 1,
-1.205075, -0.03252571, -0.9212075, 1, 0.654902, 0, 1,
-1.203303, 0.6684113, -0.3069457, 1, 0.6588235, 0, 1,
-1.187939, 1.385202, 1.776715, 1, 0.6666667, 0, 1,
-1.185981, 2.370401, -0.1191508, 1, 0.6705883, 0, 1,
-1.177049, 0.2552229, -0.1151528, 1, 0.6784314, 0, 1,
-1.150501, -1.55811, -3.852604, 1, 0.682353, 0, 1,
-1.148548, -0.8789365, -2.568847, 1, 0.6901961, 0, 1,
-1.140784, 0.04889312, -1.688979, 1, 0.6941177, 0, 1,
-1.135825, -0.2178749, -2.186424, 1, 0.7019608, 0, 1,
-1.134386, 0.3356661, -2.256398, 1, 0.7098039, 0, 1,
-1.134184, 0.7461057, 0.7338761, 1, 0.7137255, 0, 1,
-1.124112, 0.7022132, -2.064645, 1, 0.7215686, 0, 1,
-1.121492, 0.3900673, 0.3418289, 1, 0.7254902, 0, 1,
-1.119913, -1.718377, -1.372259, 1, 0.7333333, 0, 1,
-1.11387, -1.067395, -3.044567, 1, 0.7372549, 0, 1,
-1.111444, 1.153004, -0.5935797, 1, 0.7450981, 0, 1,
-1.1095, 1.425729, -1.120166, 1, 0.7490196, 0, 1,
-1.106692, 0.02303783, -1.914015, 1, 0.7568628, 0, 1,
-1.105847, -0.6480685, -2.371341, 1, 0.7607843, 0, 1,
-1.103726, 1.108881, -0.3984629, 1, 0.7686275, 0, 1,
-1.10338, -0.3693921, -3.648618, 1, 0.772549, 0, 1,
-1.103185, 2.65249, 0.2606578, 1, 0.7803922, 0, 1,
-1.099121, -0.1400553, -1.727486, 1, 0.7843137, 0, 1,
-1.089873, 2.118078, -1.148309, 1, 0.7921569, 0, 1,
-1.086068, -2.500366, -3.291342, 1, 0.7960784, 0, 1,
-1.085771, -0.3757115, -2.661841, 1, 0.8039216, 0, 1,
-1.083965, 1.649607, 0.1992497, 1, 0.8117647, 0, 1,
-1.075295, 0.1334946, -2.278804, 1, 0.8156863, 0, 1,
-1.07367, -0.3864166, -2.977798, 1, 0.8235294, 0, 1,
-1.071964, -0.5711736, 0.08619658, 1, 0.827451, 0, 1,
-1.060957, 0.8083085, -1.239497, 1, 0.8352941, 0, 1,
-1.052228, -1.254172, -1.881873, 1, 0.8392157, 0, 1,
-1.047948, -0.004605201, -1.36151, 1, 0.8470588, 0, 1,
-1.042845, -0.8746433, -2.047118, 1, 0.8509804, 0, 1,
-1.039895, -1.400762, -3.392619, 1, 0.8588235, 0, 1,
-1.038675, -0.04041636, 0.1355287, 1, 0.8627451, 0, 1,
-1.033752, 0.4871815, -0.9530298, 1, 0.8705882, 0, 1,
-1.024571, 1.515583, 0.2878365, 1, 0.8745098, 0, 1,
-1.016672, 1.775095, -0.5953885, 1, 0.8823529, 0, 1,
-1.01169, -0.6503373, -0.7799777, 1, 0.8862745, 0, 1,
-1.00917, 0.6659665, 0.5974216, 1, 0.8941177, 0, 1,
-1.007854, 0.9329179, -0.7674403, 1, 0.8980392, 0, 1,
-1.007055, 0.006706618, -1.096535, 1, 0.9058824, 0, 1,
-1.006928, -0.2396399, -1.721298, 1, 0.9137255, 0, 1,
-0.9982945, -1.866845, -1.454518, 1, 0.9176471, 0, 1,
-0.9928114, 0.3732418, -1.24443, 1, 0.9254902, 0, 1,
-0.9924325, 0.8581162, -1.802001, 1, 0.9294118, 0, 1,
-0.9850373, 0.5580567, -2.988196, 1, 0.9372549, 0, 1,
-0.9808957, 1.421595, -0.6701914, 1, 0.9411765, 0, 1,
-0.9687462, -0.5214416, -1.931419, 1, 0.9490196, 0, 1,
-0.9639528, -0.3922283, -0.5880241, 1, 0.9529412, 0, 1,
-0.963423, -0.315524, -0.459432, 1, 0.9607843, 0, 1,
-0.9628248, 0.1217964, -2.268736, 1, 0.9647059, 0, 1,
-0.9533656, 0.2642142, -1.794038, 1, 0.972549, 0, 1,
-0.9501831, -1.848498, -3.176963, 1, 0.9764706, 0, 1,
-0.948061, 0.08782797, -1.348687, 1, 0.9843137, 0, 1,
-0.9452046, 0.07542016, -1.928926, 1, 0.9882353, 0, 1,
-0.9420021, -0.2231134, -2.219799, 1, 0.9960784, 0, 1,
-0.9407633, 0.9452243, -0.1661999, 0.9960784, 1, 0, 1,
-0.9400837, -0.4653082, -1.73603, 0.9921569, 1, 0, 1,
-0.939914, 0.8639483, 1.199692, 0.9843137, 1, 0, 1,
-0.9395976, 0.4158011, -2.56603, 0.9803922, 1, 0, 1,
-0.9381582, 0.5900181, -1.321056, 0.972549, 1, 0, 1,
-0.9334512, 1.525376, -2.93065, 0.9686275, 1, 0, 1,
-0.9332628, -1.240847, -3.464222, 0.9607843, 1, 0, 1,
-0.9302245, 1.689673, -0.7516451, 0.9568627, 1, 0, 1,
-0.9292339, -0.9840743, -3.919732, 0.9490196, 1, 0, 1,
-0.9149119, -1.089906, -0.3011968, 0.945098, 1, 0, 1,
-0.910832, -0.2241983, -4.089056, 0.9372549, 1, 0, 1,
-0.9106731, -1.78702, -1.939678, 0.9333333, 1, 0, 1,
-0.9095305, 0.7413555, -2.858293, 0.9254902, 1, 0, 1,
-0.9091966, 0.5365566, -0.4720806, 0.9215686, 1, 0, 1,
-0.9045125, -0.6962966, -2.187507, 0.9137255, 1, 0, 1,
-0.9042037, 0.105072, -2.451078, 0.9098039, 1, 0, 1,
-0.8948447, -0.1951056, -2.508058, 0.9019608, 1, 0, 1,
-0.8858898, -0.6678954, -2.957176, 0.8941177, 1, 0, 1,
-0.8810688, -0.2731699, -2.272632, 0.8901961, 1, 0, 1,
-0.8785857, -1.327902, -1.832555, 0.8823529, 1, 0, 1,
-0.8774828, -1.835341, -3.550403, 0.8784314, 1, 0, 1,
-0.8750278, 0.7026104, 0.008375622, 0.8705882, 1, 0, 1,
-0.8732988, -1.543769, -3.881263, 0.8666667, 1, 0, 1,
-0.8716094, -0.2017877, 0.1442248, 0.8588235, 1, 0, 1,
-0.8710746, 0.7149832, -1.803513, 0.854902, 1, 0, 1,
-0.8698495, -0.3821037, -2.695497, 0.8470588, 1, 0, 1,
-0.8681755, 1.799485, -1.291866, 0.8431373, 1, 0, 1,
-0.8675994, -1.079691, -2.086167, 0.8352941, 1, 0, 1,
-0.86453, -0.3462559, -0.5077489, 0.8313726, 1, 0, 1,
-0.8604712, -1.031966, -2.643626, 0.8235294, 1, 0, 1,
-0.8591926, -1.52351, -4.662479, 0.8196079, 1, 0, 1,
-0.8581915, -0.7053358, -1.983189, 0.8117647, 1, 0, 1,
-0.8497718, 0.7128646, -0.9148175, 0.8078431, 1, 0, 1,
-0.8455542, 1.560865, -1.059265, 0.8, 1, 0, 1,
-0.8454338, 0.5554484, -1.300108, 0.7921569, 1, 0, 1,
-0.8445404, 0.4639681, -1.101079, 0.7882353, 1, 0, 1,
-0.8441298, -0.3629038, -0.08086073, 0.7803922, 1, 0, 1,
-0.8429297, -0.7481955, -2.639874, 0.7764706, 1, 0, 1,
-0.8302009, 2.20475, -0.006973772, 0.7686275, 1, 0, 1,
-0.8293378, 0.3061412, -1.215093, 0.7647059, 1, 0, 1,
-0.8285957, 1.824339, -0.03440179, 0.7568628, 1, 0, 1,
-0.8243862, -0.3616082, -2.095887, 0.7529412, 1, 0, 1,
-0.8241866, -1.075518, -2.757931, 0.7450981, 1, 0, 1,
-0.8226376, -0.8749605, -2.501474, 0.7411765, 1, 0, 1,
-0.8202236, -0.009111454, -3.045111, 0.7333333, 1, 0, 1,
-0.820183, -1.282907, -1.563613, 0.7294118, 1, 0, 1,
-0.8111171, 0.5424438, -0.9710848, 0.7215686, 1, 0, 1,
-0.8111039, 0.6884972, 0.2405653, 0.7176471, 1, 0, 1,
-0.8090696, -0.9485779, -3.571173, 0.7098039, 1, 0, 1,
-0.8080038, 1.358264, -0.6629125, 0.7058824, 1, 0, 1,
-0.8069885, -0.4550423, -2.577395, 0.6980392, 1, 0, 1,
-0.804703, -0.4998606, -2.027026, 0.6901961, 1, 0, 1,
-0.7998638, 0.3718628, -1.587428, 0.6862745, 1, 0, 1,
-0.7990025, 0.4932537, -1.506874, 0.6784314, 1, 0, 1,
-0.797128, -0.01875759, -2.057522, 0.6745098, 1, 0, 1,
-0.7956008, -0.2075615, -0.05689406, 0.6666667, 1, 0, 1,
-0.7905994, -0.5280534, -0.89616, 0.6627451, 1, 0, 1,
-0.7863567, 0.1192601, -2.484217, 0.654902, 1, 0, 1,
-0.7836054, -1.092895, -1.815104, 0.6509804, 1, 0, 1,
-0.7833456, -0.4392746, -4.053416, 0.6431373, 1, 0, 1,
-0.7774157, 0.8539562, 0.005756279, 0.6392157, 1, 0, 1,
-0.7773459, -0.400095, -1.452156, 0.6313726, 1, 0, 1,
-0.7739409, -0.1713498, -1.982752, 0.627451, 1, 0, 1,
-0.7732448, -1.16156, -3.324812, 0.6196079, 1, 0, 1,
-0.7715042, 1.468875, 1.422717, 0.6156863, 1, 0, 1,
-0.7706942, 1.22288, -0.6004232, 0.6078432, 1, 0, 1,
-0.7636223, -0.07229409, -0.2077421, 0.6039216, 1, 0, 1,
-0.7621811, 2.308104, 1.242248, 0.5960785, 1, 0, 1,
-0.7620448, -0.3464166, -0.7967614, 0.5882353, 1, 0, 1,
-0.7594047, 0.9098656, -0.7789605, 0.5843138, 1, 0, 1,
-0.7567119, -0.1891238, -1.170828, 0.5764706, 1, 0, 1,
-0.7545745, -0.03943053, -0.1288768, 0.572549, 1, 0, 1,
-0.7522948, 0.4841702, -2.39303, 0.5647059, 1, 0, 1,
-0.7519934, 0.1819659, -1.152449, 0.5607843, 1, 0, 1,
-0.7498277, -0.3076856, -1.908432, 0.5529412, 1, 0, 1,
-0.7493492, 0.232225, -1.607459, 0.5490196, 1, 0, 1,
-0.7492166, -1.439597, -2.859189, 0.5411765, 1, 0, 1,
-0.7403858, 0.3815634, -0.8990197, 0.5372549, 1, 0, 1,
-0.7401262, -0.03907583, -0.6523346, 0.5294118, 1, 0, 1,
-0.7343193, -0.1372167, -2.66776, 0.5254902, 1, 0, 1,
-0.7276957, -1.452703, -2.054448, 0.5176471, 1, 0, 1,
-0.7244846, 0.02607513, -1.072541, 0.5137255, 1, 0, 1,
-0.7238995, 0.6360714, -1.748096, 0.5058824, 1, 0, 1,
-0.7183433, -0.1144163, -2.06598, 0.5019608, 1, 0, 1,
-0.7170988, -0.38079, -1.503994, 0.4941176, 1, 0, 1,
-0.7108116, -1.412673, -2.748957, 0.4862745, 1, 0, 1,
-0.7103547, -0.0586445, -2.099491, 0.4823529, 1, 0, 1,
-0.7091174, 0.7239439, -2.814031, 0.4745098, 1, 0, 1,
-0.7076605, -1.940063, -1.381463, 0.4705882, 1, 0, 1,
-0.7062562, 0.9445111, -1.200752, 0.4627451, 1, 0, 1,
-0.70617, 2.028273, -0.3512337, 0.4588235, 1, 0, 1,
-0.7046666, -0.03227906, -0.7625294, 0.4509804, 1, 0, 1,
-0.6895755, 0.1900707, -0.7359928, 0.4470588, 1, 0, 1,
-0.689001, -0.1658925, -1.386954, 0.4392157, 1, 0, 1,
-0.6799814, 1.11882, 0.03626405, 0.4352941, 1, 0, 1,
-0.6794576, 1.574763, -1.642215, 0.427451, 1, 0, 1,
-0.6788131, 1.495156, -0.5624073, 0.4235294, 1, 0, 1,
-0.6692091, 1.612392, -1.664143, 0.4156863, 1, 0, 1,
-0.6664785, -1.049779, -3.85418, 0.4117647, 1, 0, 1,
-0.6662033, -0.4885264, -0.6430263, 0.4039216, 1, 0, 1,
-0.6641328, 0.9403715, -0.1846223, 0.3960784, 1, 0, 1,
-0.6617312, 0.2944363, -2.219502, 0.3921569, 1, 0, 1,
-0.6550511, -1.024024, -1.253434, 0.3843137, 1, 0, 1,
-0.6504665, 0.8834709, -0.3004178, 0.3803922, 1, 0, 1,
-0.6501266, 1.634844, -1.720398, 0.372549, 1, 0, 1,
-0.6464533, -0.48873, -2.249436, 0.3686275, 1, 0, 1,
-0.6438046, 0.205798, -1.206007, 0.3607843, 1, 0, 1,
-0.6412521, -0.341894, -1.642739, 0.3568628, 1, 0, 1,
-0.6371047, 0.09970187, -1.756732, 0.3490196, 1, 0, 1,
-0.6355224, -0.01584414, 0.2885262, 0.345098, 1, 0, 1,
-0.6350117, -0.6312835, -1.973398, 0.3372549, 1, 0, 1,
-0.6343605, 0.7841649, -0.7755299, 0.3333333, 1, 0, 1,
-0.6335885, 0.5538263, -0.06101218, 0.3254902, 1, 0, 1,
-0.6328431, 0.5552681, -1.492812, 0.3215686, 1, 0, 1,
-0.6311647, 0.8593675, -1.108443, 0.3137255, 1, 0, 1,
-0.6302052, 0.3835243, -1.129864, 0.3098039, 1, 0, 1,
-0.6258408, 1.224165, -1.503884, 0.3019608, 1, 0, 1,
-0.6200106, 0.4159032, -0.4122715, 0.2941177, 1, 0, 1,
-0.6171928, -0.3226754, -3.085324, 0.2901961, 1, 0, 1,
-0.6159577, -0.04199278, -1.558469, 0.282353, 1, 0, 1,
-0.6030888, -0.7261266, -2.0225, 0.2784314, 1, 0, 1,
-0.6019457, -0.7579007, -0.8895081, 0.2705882, 1, 0, 1,
-0.6017641, 0.2584241, -2.176054, 0.2666667, 1, 0, 1,
-0.5917159, -0.2015376, -2.609787, 0.2588235, 1, 0, 1,
-0.5898435, 1.138013, -1.042045, 0.254902, 1, 0, 1,
-0.5890996, -0.7212903, -1.814725, 0.2470588, 1, 0, 1,
-0.5840519, 0.2385187, -1.049468, 0.2431373, 1, 0, 1,
-0.5826661, 0.7893184, -0.1910706, 0.2352941, 1, 0, 1,
-0.5817935, -0.555483, -0.9572016, 0.2313726, 1, 0, 1,
-0.5793413, 0.5207017, 0.3828656, 0.2235294, 1, 0, 1,
-0.5782747, -1.682326, -2.267124, 0.2196078, 1, 0, 1,
-0.5758271, -0.5521839, -1.379157, 0.2117647, 1, 0, 1,
-0.5755551, 0.3217956, -0.1775201, 0.2078431, 1, 0, 1,
-0.5669361, -0.763749, -2.762608, 0.2, 1, 0, 1,
-0.5655672, 0.5966429, -1.213502, 0.1921569, 1, 0, 1,
-0.563663, 0.5363982, -1.589089, 0.1882353, 1, 0, 1,
-0.5605808, 0.3942168, 0.2360381, 0.1803922, 1, 0, 1,
-0.5513991, -1.391111, -3.249724, 0.1764706, 1, 0, 1,
-0.5502869, -0.2733189, -1.19267, 0.1686275, 1, 0, 1,
-0.5426464, 1.292598, 0.2997267, 0.1647059, 1, 0, 1,
-0.5405949, 1.004585, 0.8270034, 0.1568628, 1, 0, 1,
-0.5398309, -0.3139395, -2.760172, 0.1529412, 1, 0, 1,
-0.5353987, 0.6138481, -2.120493, 0.145098, 1, 0, 1,
-0.5206934, 0.647635, -1.219118, 0.1411765, 1, 0, 1,
-0.5191979, -1.237952, -3.656369, 0.1333333, 1, 0, 1,
-0.5157955, -0.6614949, -1.555848, 0.1294118, 1, 0, 1,
-0.5119818, -1.081565, -2.12406, 0.1215686, 1, 0, 1,
-0.5106332, 0.4633225, -1.189384, 0.1176471, 1, 0, 1,
-0.5035076, 0.8675799, -1.473454, 0.1098039, 1, 0, 1,
-0.5024257, -0.6444744, -1.436898, 0.1058824, 1, 0, 1,
-0.4935974, -1.022202, -3.536899, 0.09803922, 1, 0, 1,
-0.4929147, -0.7502838, -2.857944, 0.09019608, 1, 0, 1,
-0.4926041, 0.542834, -1.278774, 0.08627451, 1, 0, 1,
-0.4925888, -0.33773, -0.2159171, 0.07843138, 1, 0, 1,
-0.4887723, -2.033151, -2.912605, 0.07450981, 1, 0, 1,
-0.4856687, -0.3536306, -1.50079, 0.06666667, 1, 0, 1,
-0.4855686, -0.1965165, -1.276345, 0.0627451, 1, 0, 1,
-0.4852715, 0.9911714, 1.179605, 0.05490196, 1, 0, 1,
-0.4797008, 0.9814543, -0.8653256, 0.05098039, 1, 0, 1,
-0.4793494, -0.8410678, -2.162973, 0.04313726, 1, 0, 1,
-0.4787698, -1.315257, -4.269242, 0.03921569, 1, 0, 1,
-0.4785546, 0.3042521, -1.156625, 0.03137255, 1, 0, 1,
-0.477804, -0.2042821, -3.645444, 0.02745098, 1, 0, 1,
-0.4766539, -0.4057141, -1.958279, 0.01960784, 1, 0, 1,
-0.4705368, 0.03436146, -2.562995, 0.01568628, 1, 0, 1,
-0.4684702, 0.6667175, -0.978442, 0.007843138, 1, 0, 1,
-0.4674156, 0.8723593, -0.08236449, 0.003921569, 1, 0, 1,
-0.4661365, -0.5795214, -2.698818, 0, 1, 0.003921569, 1,
-0.4660856, 0.1451703, -1.195581, 0, 1, 0.01176471, 1,
-0.464647, 0.005376763, -1.702789, 0, 1, 0.01568628, 1,
-0.46199, 0.492397, -1.348634, 0, 1, 0.02352941, 1,
-0.4585508, 1.178755, -0.9939451, 0, 1, 0.02745098, 1,
-0.4571184, -1.081143, -2.836207, 0, 1, 0.03529412, 1,
-0.448656, -1.26176, -1.88394, 0, 1, 0.03921569, 1,
-0.4463475, 1.2492, -0.4192117, 0, 1, 0.04705882, 1,
-0.4440131, 0.05278131, 0.6209408, 0, 1, 0.05098039, 1,
-0.4378741, -0.07280451, -1.972187, 0, 1, 0.05882353, 1,
-0.4343775, 0.4947401, -1.557311, 0, 1, 0.0627451, 1,
-0.4310517, 0.6401609, -1.10514, 0, 1, 0.07058824, 1,
-0.4262983, -0.4453882, -2.256784, 0, 1, 0.07450981, 1,
-0.4245897, 0.4162731, -1.781523, 0, 1, 0.08235294, 1,
-0.4219953, 1.646806, 0.6958918, 0, 1, 0.08627451, 1,
-0.4198673, -1.299341, -1.27474, 0, 1, 0.09411765, 1,
-0.4153245, -0.7009091, -3.11873, 0, 1, 0.1019608, 1,
-0.4141904, -0.7942676, -2.824342, 0, 1, 0.1058824, 1,
-0.4140059, -0.3034578, -2.712223, 0, 1, 0.1137255, 1,
-0.4125902, -0.03111786, -1.376042, 0, 1, 0.1176471, 1,
-0.4092577, 0.4549828, -2.148526, 0, 1, 0.1254902, 1,
-0.4089803, -0.05887016, -2.125116, 0, 1, 0.1294118, 1,
-0.4079003, 1.717921, -0.7377727, 0, 1, 0.1372549, 1,
-0.4021949, -0.655396, -1.305655, 0, 1, 0.1411765, 1,
-0.3960143, -0.270154, -0.9334968, 0, 1, 0.1490196, 1,
-0.394471, -2.772598, -2.711006, 0, 1, 0.1529412, 1,
-0.390617, -0.04858131, -0.1725556, 0, 1, 0.1607843, 1,
-0.3857425, -0.05215697, -3.207687, 0, 1, 0.1647059, 1,
-0.3850816, -0.2499973, -1.340256, 0, 1, 0.172549, 1,
-0.3840689, 0.6013694, 0.08429048, 0, 1, 0.1764706, 1,
-0.3826413, -0.7999083, -3.061532, 0, 1, 0.1843137, 1,
-0.382616, -0.7326179, -2.601845, 0, 1, 0.1882353, 1,
-0.3705544, 1.085605, -0.8024079, 0, 1, 0.1960784, 1,
-0.3648971, 0.8355862, 2.016212, 0, 1, 0.2039216, 1,
-0.3646956, 2.196524, -0.5779022, 0, 1, 0.2078431, 1,
-0.3630994, 0.4925419, 1.793141, 0, 1, 0.2156863, 1,
-0.3613853, -0.5593379, -1.984035, 0, 1, 0.2196078, 1,
-0.3545818, 0.07573278, -1.006434, 0, 1, 0.227451, 1,
-0.3544346, -0.01112977, -1.505803, 0, 1, 0.2313726, 1,
-0.3522352, -2.143197, -2.000299, 0, 1, 0.2392157, 1,
-0.3512748, -0.07524547, -1.627998, 0, 1, 0.2431373, 1,
-0.3512405, -1.125171, -4.62349, 0, 1, 0.2509804, 1,
-0.3469524, -1.661859, -4.692079, 0, 1, 0.254902, 1,
-0.3458962, 0.3739316, -1.327381, 0, 1, 0.2627451, 1,
-0.3456894, 0.5433051, -2.290247, 0, 1, 0.2666667, 1,
-0.3450366, 0.1919892, -1.447769, 0, 1, 0.2745098, 1,
-0.3367819, 0.3867675, -0.1722577, 0, 1, 0.2784314, 1,
-0.3334854, -0.1987752, -0.7215264, 0, 1, 0.2862745, 1,
-0.3326151, 1.044171, -1.35327, 0, 1, 0.2901961, 1,
-0.3318884, 0.6507506, -1.444174, 0, 1, 0.2980392, 1,
-0.3305936, 0.3821348, -1.196202, 0, 1, 0.3058824, 1,
-0.3304668, -0.4640754, -2.373733, 0, 1, 0.3098039, 1,
-0.3295948, -2.073745, -1.970654, 0, 1, 0.3176471, 1,
-0.3292053, -0.2360025, -1.889807, 0, 1, 0.3215686, 1,
-0.3232195, 1.057365, -1.324299, 0, 1, 0.3294118, 1,
-0.3213197, -1.194741, -3.194894, 0, 1, 0.3333333, 1,
-0.3204266, 1.158021, -0.9591873, 0, 1, 0.3411765, 1,
-0.3203058, 0.8263745, 0.1753023, 0, 1, 0.345098, 1,
-0.3185574, -0.1896316, -3.987412, 0, 1, 0.3529412, 1,
-0.3183715, 0.09315556, -1.845488, 0, 1, 0.3568628, 1,
-0.3172812, -1.566678, -3.303678, 0, 1, 0.3647059, 1,
-0.3126863, -0.5856366, -4.748701, 0, 1, 0.3686275, 1,
-0.3125617, 0.430208, -1.62937, 0, 1, 0.3764706, 1,
-0.3094008, 2.2185, 0.904811, 0, 1, 0.3803922, 1,
-0.3072805, 1.921086, 0.9902972, 0, 1, 0.3882353, 1,
-0.3042743, -0.5009597, -2.682881, 0, 1, 0.3921569, 1,
-0.2994739, 0.8309558, 0.4853313, 0, 1, 0.4, 1,
-0.2987277, 0.08743908, -1.688459, 0, 1, 0.4078431, 1,
-0.2959421, -1.611259, -2.735783, 0, 1, 0.4117647, 1,
-0.2937083, -0.9691858, -0.5784419, 0, 1, 0.4196078, 1,
-0.2837643, 0.08963962, -0.7902516, 0, 1, 0.4235294, 1,
-0.2804509, -1.649893, -3.53878, 0, 1, 0.4313726, 1,
-0.2799396, 0.3010632, -1.903077, 0, 1, 0.4352941, 1,
-0.2798874, 0.01629396, -0.8957688, 0, 1, 0.4431373, 1,
-0.274214, 0.01812118, -0.6369929, 0, 1, 0.4470588, 1,
-0.2731138, -1.357591, -4.441869, 0, 1, 0.454902, 1,
-0.2725786, 0.02539097, -1.932289, 0, 1, 0.4588235, 1,
-0.2704203, -0.2453512, -3.048537, 0, 1, 0.4666667, 1,
-0.2682499, -0.7329537, -2.303316, 0, 1, 0.4705882, 1,
-0.2647707, 0.3684267, -0.7193415, 0, 1, 0.4784314, 1,
-0.2643781, -0.5226424, -1.849794, 0, 1, 0.4823529, 1,
-0.2605724, -0.4189678, -4.015596, 0, 1, 0.4901961, 1,
-0.2604697, -1.618856, -3.567846, 0, 1, 0.4941176, 1,
-0.2572812, -0.9997056, -3.771825, 0, 1, 0.5019608, 1,
-0.2564167, -0.4358135, -3.351567, 0, 1, 0.509804, 1,
-0.2556675, 0.1326158, -0.1216533, 0, 1, 0.5137255, 1,
-0.2513895, -1.083702, -2.878314, 0, 1, 0.5215687, 1,
-0.2491793, -0.316257, -1.466163, 0, 1, 0.5254902, 1,
-0.2481117, 2.496326, 0.9961224, 0, 1, 0.5333334, 1,
-0.2377947, 0.4340064, 0.1530619, 0, 1, 0.5372549, 1,
-0.2370785, -1.537542, -2.691462, 0, 1, 0.5450981, 1,
-0.2362794, -0.38919, -3.61076, 0, 1, 0.5490196, 1,
-0.2343487, 2.534258, -0.2539657, 0, 1, 0.5568628, 1,
-0.2334401, 1.716977, -1.005146, 0, 1, 0.5607843, 1,
-0.2327018, 0.05423415, -2.483162, 0, 1, 0.5686275, 1,
-0.2284339, 0.6595218, -2.314161, 0, 1, 0.572549, 1,
-0.2278044, -0.314838, -3.854133, 0, 1, 0.5803922, 1,
-0.226691, 1.433116, -2.111038, 0, 1, 0.5843138, 1,
-0.221841, -2.03824, -2.093865, 0, 1, 0.5921569, 1,
-0.2215205, -0.6694848, -2.225816, 0, 1, 0.5960785, 1,
-0.2214866, -0.636002, -2.126018, 0, 1, 0.6039216, 1,
-0.2198391, 0.5554255, 0.6598293, 0, 1, 0.6117647, 1,
-0.2184077, -0.1042674, -1.945393, 0, 1, 0.6156863, 1,
-0.2182194, -1.810383, -5.075272, 0, 1, 0.6235294, 1,
-0.217855, -8.844127e-05, -0.6700323, 0, 1, 0.627451, 1,
-0.2127926, -0.8906925, -5.094449, 0, 1, 0.6352941, 1,
-0.2109105, 1.347994, -0.1789188, 0, 1, 0.6392157, 1,
-0.2038488, 0.908353, -1.506528, 0, 1, 0.6470588, 1,
-0.2027335, -1.105713, -3.9938, 0, 1, 0.6509804, 1,
-0.1971696, 0.4024412, -1.77773, 0, 1, 0.6588235, 1,
-0.1970544, 0.160996, -2.813549, 0, 1, 0.6627451, 1,
-0.1960246, 0.7327603, -0.2273979, 0, 1, 0.6705883, 1,
-0.1935321, 1.482828, 0.2261588, 0, 1, 0.6745098, 1,
-0.1931502, 0.2664492, -1.676071, 0, 1, 0.682353, 1,
-0.1927579, 1.751786, 0.8420853, 0, 1, 0.6862745, 1,
-0.1916339, -0.7940068, -2.808762, 0, 1, 0.6941177, 1,
-0.1887594, -1.470429, -3.855517, 0, 1, 0.7019608, 1,
-0.185292, 1.9918, 1.378814, 0, 1, 0.7058824, 1,
-0.1850712, 0.9382268, 1.207225, 0, 1, 0.7137255, 1,
-0.184203, 0.1652337, 0.1219011, 0, 1, 0.7176471, 1,
-0.1794728, -0.1959151, -2.846165, 0, 1, 0.7254902, 1,
-0.1747737, 0.6310855, 1.986262, 0, 1, 0.7294118, 1,
-0.1744417, 0.4947969, -0.2548828, 0, 1, 0.7372549, 1,
-0.1735807, -0.09947844, -1.784425, 0, 1, 0.7411765, 1,
-0.1688493, -0.2260876, -2.847567, 0, 1, 0.7490196, 1,
-0.161198, 2.272105, -1.304229, 0, 1, 0.7529412, 1,
-0.1570489, 0.7437899, -2.076776, 0, 1, 0.7607843, 1,
-0.152158, 0.2077874, -1.492167, 0, 1, 0.7647059, 1,
-0.1488699, -1.618954, -4.310803, 0, 1, 0.772549, 1,
-0.1433717, 0.9168093, -0.4389408, 0, 1, 0.7764706, 1,
-0.1420486, 0.8144283, 0.8949729, 0, 1, 0.7843137, 1,
-0.1374324, 0.1880536, -0.4146976, 0, 1, 0.7882353, 1,
-0.1356055, 1.271442, -1.501478, 0, 1, 0.7960784, 1,
-0.1355066, 0.3597442, 1.40122, 0, 1, 0.8039216, 1,
-0.1319075, -1.572119, -3.233499, 0, 1, 0.8078431, 1,
-0.1301023, -0.7150511, -4.169557, 0, 1, 0.8156863, 1,
-0.1289252, 1.597691, -0.3599288, 0, 1, 0.8196079, 1,
-0.1230233, 0.06330394, -2.17096, 0, 1, 0.827451, 1,
-0.1212563, -0.3882335, -2.839763, 0, 1, 0.8313726, 1,
-0.1211676, -0.4096058, -2.14446, 0, 1, 0.8392157, 1,
-0.1177795, 0.5767369, -0.4514065, 0, 1, 0.8431373, 1,
-0.1175157, -1.054553, -2.432024, 0, 1, 0.8509804, 1,
-0.1170627, 0.5006008, 0.3496605, 0, 1, 0.854902, 1,
-0.1161883, -1.802026, -4.219933, 0, 1, 0.8627451, 1,
-0.1158975, -0.7204812, -2.995561, 0, 1, 0.8666667, 1,
-0.1103436, 1.512271, -2.067948, 0, 1, 0.8745098, 1,
-0.1091172, -0.9522507, -3.362834, 0, 1, 0.8784314, 1,
-0.1087251, 0.4344908, -2.106967, 0, 1, 0.8862745, 1,
-0.1044793, -0.343397, -5.209885, 0, 1, 0.8901961, 1,
-0.1014042, -0.9567773, -2.584801, 0, 1, 0.8980392, 1,
-0.1006952, 0.1481013, 0.9925274, 0, 1, 0.9058824, 1,
-0.1002806, 0.1126108, -1.949343, 0, 1, 0.9098039, 1,
-0.09312353, 1.065304, -1.5701, 0, 1, 0.9176471, 1,
-0.09253602, -1.28436, -3.194011, 0, 1, 0.9215686, 1,
-0.08964837, -0.01151946, -2.578876, 0, 1, 0.9294118, 1,
-0.08246105, -0.7096114, -2.925384, 0, 1, 0.9333333, 1,
-0.08230684, 0.04352309, -1.021657, 0, 1, 0.9411765, 1,
-0.0801276, -0.2071326, -1.961978, 0, 1, 0.945098, 1,
-0.08006964, -0.1087046, -2.814334, 0, 1, 0.9529412, 1,
-0.07107855, 2.302879, 0.6607728, 0, 1, 0.9568627, 1,
-0.06938145, -0.4589284, -4.379364, 0, 1, 0.9647059, 1,
-0.06077872, -0.3812774, -5.423744, 0, 1, 0.9686275, 1,
-0.05994857, -0.5549673, -4.555237, 0, 1, 0.9764706, 1,
-0.05960999, -1.313398, -3.842307, 0, 1, 0.9803922, 1,
-0.0500481, -0.4451185, -4.39442, 0, 1, 0.9882353, 1,
-0.04865643, 0.243582, -0.1622878, 0, 1, 0.9921569, 1,
-0.04445462, 1.11417, -1.276673, 0, 1, 1, 1,
-0.04054168, 0.443496, 0.3223321, 0, 0.9921569, 1, 1,
-0.04048058, -0.5087647, -3.625615, 0, 0.9882353, 1, 1,
-0.03353154, 0.1614888, 0.7631784, 0, 0.9803922, 1, 1,
-0.0316157, 1.467038, 0.6042552, 0, 0.9764706, 1, 1,
-0.0312707, 1.021369, -0.779307, 0, 0.9686275, 1, 1,
-0.02740778, -0.3515791, -4.332143, 0, 0.9647059, 1, 1,
-0.0254158, -0.7278023, -4.408286, 0, 0.9568627, 1, 1,
-0.02417448, 0.7695836, -0.7623829, 0, 0.9529412, 1, 1,
-0.0226331, -1.03491, -3.335387, 0, 0.945098, 1, 1,
-0.02011762, -0.8025315, -3.28224, 0, 0.9411765, 1, 1,
-0.01800761, -1.681165, -2.73762, 0, 0.9333333, 1, 1,
-0.01772491, -0.1194295, -4.091821, 0, 0.9294118, 1, 1,
-0.01521909, 0.3128518, 1.647384, 0, 0.9215686, 1, 1,
-0.0122331, 0.4874403, 1.373416, 0, 0.9176471, 1, 1,
-0.01097988, 0.5599429, 0.3359101, 0, 0.9098039, 1, 1,
-0.008999355, 0.4014372, 0.6957691, 0, 0.9058824, 1, 1,
-0.002731741, -1.723328, -3.745432, 0, 0.8980392, 1, 1,
-0.001063117, 1.184896, 0.3618893, 0, 0.8901961, 1, 1,
-0.0003270363, -0.145116, -2.902509, 0, 0.8862745, 1, 1,
0.001717878, -0.312812, 3.572691, 0, 0.8784314, 1, 1,
0.001767161, 0.7614539, 0.5011709, 0, 0.8745098, 1, 1,
0.002605681, -0.1637169, 0.8184175, 0, 0.8666667, 1, 1,
0.004321248, -0.3638745, 1.687843, 0, 0.8627451, 1, 1,
0.004336662, -1.323878, 2.717031, 0, 0.854902, 1, 1,
0.005705039, -0.3118515, 2.843428, 0, 0.8509804, 1, 1,
0.006071466, -0.8141341, 5.009314, 0, 0.8431373, 1, 1,
0.006702117, -0.1778906, 3.630646, 0, 0.8392157, 1, 1,
0.008925747, -0.2874303, 3.549852, 0, 0.8313726, 1, 1,
0.009936467, -0.9190913, 4.222513, 0, 0.827451, 1, 1,
0.0144121, -0.07679714, 3.660716, 0, 0.8196079, 1, 1,
0.01530599, 1.229953, 0.5048508, 0, 0.8156863, 1, 1,
0.01549948, -1.069796, 1.910665, 0, 0.8078431, 1, 1,
0.017837, 0.2439616, 0.5606625, 0, 0.8039216, 1, 1,
0.01844909, -1.159651, 2.23114, 0, 0.7960784, 1, 1,
0.02546962, 0.942889, -0.7299677, 0, 0.7882353, 1, 1,
0.02979137, -0.1365994, 3.651061, 0, 0.7843137, 1, 1,
0.03082773, 0.5551533, 0.5987248, 0, 0.7764706, 1, 1,
0.03191777, -0.166739, 2.705417, 0, 0.772549, 1, 1,
0.03200267, 0.6862608, 0.1735216, 0, 0.7647059, 1, 1,
0.03415284, 0.08495326, 1.002947, 0, 0.7607843, 1, 1,
0.03670095, 0.155035, -0.1184362, 0, 0.7529412, 1, 1,
0.03798911, 0.349081, 1.099903, 0, 0.7490196, 1, 1,
0.03947097, 0.8968706, 0.1187297, 0, 0.7411765, 1, 1,
0.04705168, 0.7402104, -0.2569325, 0, 0.7372549, 1, 1,
0.04708394, 0.7530445, -0.4878827, 0, 0.7294118, 1, 1,
0.04798324, -0.5922167, 5.089512, 0, 0.7254902, 1, 1,
0.05097161, -0.1246312, 3.122337, 0, 0.7176471, 1, 1,
0.05252462, -0.437639, 3.866762, 0, 0.7137255, 1, 1,
0.05255896, 0.5537314, -1.204488, 0, 0.7058824, 1, 1,
0.05356972, 0.01516035, 1.580636, 0, 0.6980392, 1, 1,
0.05689342, -0.4145197, 0.6313046, 0, 0.6941177, 1, 1,
0.0612189, -0.7158557, 2.453432, 0, 0.6862745, 1, 1,
0.06349128, -0.02516518, 0.06931769, 0, 0.682353, 1, 1,
0.06916594, 0.2725553, -0.332283, 0, 0.6745098, 1, 1,
0.07286739, 2.236565, 0.5210458, 0, 0.6705883, 1, 1,
0.07591555, 0.7246253, 0.5852588, 0, 0.6627451, 1, 1,
0.07630929, 0.2938069, 2.15385, 0, 0.6588235, 1, 1,
0.08442644, 1.033987, 0.7436663, 0, 0.6509804, 1, 1,
0.09363703, -0.660489, 4.593179, 0, 0.6470588, 1, 1,
0.09429428, 0.5469609, 0.1939786, 0, 0.6392157, 1, 1,
0.09603039, -0.03674129, 2.588111, 0, 0.6352941, 1, 1,
0.09859042, -0.08315432, 2.964394, 0, 0.627451, 1, 1,
0.1016124, -0.8360329, 2.72663, 0, 0.6235294, 1, 1,
0.1024974, 0.8366872, -0.2970749, 0, 0.6156863, 1, 1,
0.1027328, 1.000514, -1.586961, 0, 0.6117647, 1, 1,
0.1101533, -0.1183271, 2.623084, 0, 0.6039216, 1, 1,
0.1116899, -0.2067192, 1.757662, 0, 0.5960785, 1, 1,
0.1170822, 0.06355993, 0.5630612, 0, 0.5921569, 1, 1,
0.1249898, 0.5548257, -0.1672186, 0, 0.5843138, 1, 1,
0.1265859, -2.450766, 3.951838, 0, 0.5803922, 1, 1,
0.1354309, -1.296679, 2.85352, 0, 0.572549, 1, 1,
0.1372673, 0.4956633, 0.2985112, 0, 0.5686275, 1, 1,
0.1485963, -0.3422793, 2.798886, 0, 0.5607843, 1, 1,
0.1523531, -1.688009, 5.48597, 0, 0.5568628, 1, 1,
0.1551195, 1.353024, 1.824486, 0, 0.5490196, 1, 1,
0.1583396, -0.6534476, 4.303412, 0, 0.5450981, 1, 1,
0.1650804, -1.252012, 5.44007, 0, 0.5372549, 1, 1,
0.1665111, -0.1493697, 2.536087, 0, 0.5333334, 1, 1,
0.1666628, -1.994337, 2.197524, 0, 0.5254902, 1, 1,
0.1692692, 0.5936089, 1.091697, 0, 0.5215687, 1, 1,
0.1718945, -0.842676, 4.063202, 0, 0.5137255, 1, 1,
0.1767594, -0.6866198, 3.200365, 0, 0.509804, 1, 1,
0.1779987, 0.1046149, 1.673676, 0, 0.5019608, 1, 1,
0.1804148, 0.8634354, -0.7978129, 0, 0.4941176, 1, 1,
0.1815626, -0.5550414, 1.635967, 0, 0.4901961, 1, 1,
0.186152, -1.731615, 2.823838, 0, 0.4823529, 1, 1,
0.1865809, -1.960452, 1.492115, 0, 0.4784314, 1, 1,
0.1887585, 0.3793256, 0.9558147, 0, 0.4705882, 1, 1,
0.1907756, -0.2867721, 2.574338, 0, 0.4666667, 1, 1,
0.1932758, 0.1648852, 1.015604, 0, 0.4588235, 1, 1,
0.1951475, 1.06815, -0.0214852, 0, 0.454902, 1, 1,
0.2006756, 0.07492354, 1.819922, 0, 0.4470588, 1, 1,
0.2017598, 0.5388475, -0.3060887, 0, 0.4431373, 1, 1,
0.2032787, 0.5479345, 1.622302, 0, 0.4352941, 1, 1,
0.2034422, -0.8423582, 1.911803, 0, 0.4313726, 1, 1,
0.2096882, -0.2846627, 1.605486, 0, 0.4235294, 1, 1,
0.2097759, -1.120963, 4.480126, 0, 0.4196078, 1, 1,
0.2126038, 0.3539212, 0.2368749, 0, 0.4117647, 1, 1,
0.2156661, 1.294197, -1.271538, 0, 0.4078431, 1, 1,
0.2168824, 1.654805, -1.072566, 0, 0.4, 1, 1,
0.2191336, -0.5324442, 2.53762, 0, 0.3921569, 1, 1,
0.2193452, -0.4850978, 3.095413, 0, 0.3882353, 1, 1,
0.2203056, -0.1646245, 0.5157524, 0, 0.3803922, 1, 1,
0.2249708, -0.403537, 2.912997, 0, 0.3764706, 1, 1,
0.2262731, 0.7297703, 0.5193716, 0, 0.3686275, 1, 1,
0.2266827, -0.7924486, 2.267013, 0, 0.3647059, 1, 1,
0.2285411, -0.3008918, 3.62607, 0, 0.3568628, 1, 1,
0.232353, -0.0582363, 1.787328, 0, 0.3529412, 1, 1,
0.2342116, -0.801035, 1.264291, 0, 0.345098, 1, 1,
0.2342923, -0.1948452, 0.5458506, 0, 0.3411765, 1, 1,
0.2353899, 0.1688297, 0.11797, 0, 0.3333333, 1, 1,
0.2372794, 0.3584779, 0.1319385, 0, 0.3294118, 1, 1,
0.2397542, -1.618624, 2.628222, 0, 0.3215686, 1, 1,
0.2403611, 1.086039, -1.651884, 0, 0.3176471, 1, 1,
0.2452478, 0.2382893, 0.2890188, 0, 0.3098039, 1, 1,
0.2501139, 0.6815519, 0.3426325, 0, 0.3058824, 1, 1,
0.2561105, -0.9656533, 2.841932, 0, 0.2980392, 1, 1,
0.2568227, 1.657939, 0.1933609, 0, 0.2901961, 1, 1,
0.25724, 0.6439979, -0.06626482, 0, 0.2862745, 1, 1,
0.2619644, 0.3741239, -0.2453988, 0, 0.2784314, 1, 1,
0.2653057, -0.7116885, 1.031388, 0, 0.2745098, 1, 1,
0.2661663, -1.071904, 2.882115, 0, 0.2666667, 1, 1,
0.2700582, -1.750811, 2.149724, 0, 0.2627451, 1, 1,
0.2781147, 3.024962, 0.7090066, 0, 0.254902, 1, 1,
0.2803846, -0.6776242, 2.812867, 0, 0.2509804, 1, 1,
0.2817737, 0.8656465, -0.7967601, 0, 0.2431373, 1, 1,
0.2875356, -0.3424791, 2.435889, 0, 0.2392157, 1, 1,
0.2879398, -1.59921, 2.131676, 0, 0.2313726, 1, 1,
0.2903331, -2.608935, 3.8212, 0, 0.227451, 1, 1,
0.2910652, -0.8543207, 2.49005, 0, 0.2196078, 1, 1,
0.2911304, -1.058253, 3.149056, 0, 0.2156863, 1, 1,
0.3013982, -1.686045, 3.623192, 0, 0.2078431, 1, 1,
0.3038342, 1.555061, -0.4023438, 0, 0.2039216, 1, 1,
0.3073419, -0.539038, 2.007047, 0, 0.1960784, 1, 1,
0.3089109, 0.8133024, 1.686751, 0, 0.1882353, 1, 1,
0.3119286, 0.4245259, 1.361025, 0, 0.1843137, 1, 1,
0.3119543, 0.7746159, 0.4272099, 0, 0.1764706, 1, 1,
0.3130922, -0.6706323, 1.94397, 0, 0.172549, 1, 1,
0.3272879, -0.4315726, 1.850613, 0, 0.1647059, 1, 1,
0.327583, 0.9163979, 1.746515, 0, 0.1607843, 1, 1,
0.3288569, 1.377682, 1.990342, 0, 0.1529412, 1, 1,
0.3306058, 0.07752889, 1.544519, 0, 0.1490196, 1, 1,
0.3365198, 0.5980111, 3.414651, 0, 0.1411765, 1, 1,
0.343356, -0.6566584, 2.964819, 0, 0.1372549, 1, 1,
0.3479185, -1.123667, 4.393886, 0, 0.1294118, 1, 1,
0.3496113, -1.467695, 2.555853, 0, 0.1254902, 1, 1,
0.3515471, -0.2054644, 2.372816, 0, 0.1176471, 1, 1,
0.35259, 1.845323, -1.726848, 0, 0.1137255, 1, 1,
0.3547031, 0.2421195, 1.597737, 0, 0.1058824, 1, 1,
0.3633652, -0.4480435, 0.04991937, 0, 0.09803922, 1, 1,
0.3659661, -0.7157149, 2.087307, 0, 0.09411765, 1, 1,
0.369627, 1.651921, -0.1454261, 0, 0.08627451, 1, 1,
0.3704405, -1.26506, 3.385267, 0, 0.08235294, 1, 1,
0.3767607, 1.719006, 1.317936, 0, 0.07450981, 1, 1,
0.3835453, 0.7855884, -1.042715, 0, 0.07058824, 1, 1,
0.3866104, 0.362616, -0.06379005, 0, 0.0627451, 1, 1,
0.3892278, 0.2498269, -0.3334632, 0, 0.05882353, 1, 1,
0.3894182, -0.06015744, 2.80829, 0, 0.05098039, 1, 1,
0.3902492, -0.5226231, 1.373496, 0, 0.04705882, 1, 1,
0.3919264, 0.9986814, 1.61132, 0, 0.03921569, 1, 1,
0.3921744, 0.8132104, 3.49095, 0, 0.03529412, 1, 1,
0.3948891, -2.003004, 3.903741, 0, 0.02745098, 1, 1,
0.3961199, 0.3129944, 1.92756, 0, 0.02352941, 1, 1,
0.3962796, -0.1380953, 0.3026909, 0, 0.01568628, 1, 1,
0.4020829, -0.7648289, 4.749307, 0, 0.01176471, 1, 1,
0.4099725, 1.834524, -0.04515966, 0, 0.003921569, 1, 1,
0.4104223, -0.6271269, 3.111586, 0.003921569, 0, 1, 1,
0.4109617, -0.6136652, 2.567982, 0.007843138, 0, 1, 1,
0.4114373, 0.164548, 0.2811413, 0.01568628, 0, 1, 1,
0.4154664, -0.1715841, 0.06275724, 0.01960784, 0, 1, 1,
0.4217028, -0.2680453, 1.991726, 0.02745098, 0, 1, 1,
0.4225029, -0.8198723, 2.379016, 0.03137255, 0, 1, 1,
0.4246264, -0.2335483, 2.219823, 0.03921569, 0, 1, 1,
0.4249141, 0.6892648, 0.6630414, 0.04313726, 0, 1, 1,
0.4278483, -1.616307, 1.871225, 0.05098039, 0, 1, 1,
0.4296778, 0.2069717, 1.775154, 0.05490196, 0, 1, 1,
0.4300919, -0.4693517, 2.095903, 0.0627451, 0, 1, 1,
0.4324384, -0.15127, 1.436984, 0.06666667, 0, 1, 1,
0.4377638, -1.517879, 2.11326, 0.07450981, 0, 1, 1,
0.4403929, -0.5960231, 3.761045, 0.07843138, 0, 1, 1,
0.4415442, -0.00704179, 0.6709421, 0.08627451, 0, 1, 1,
0.4418665, -0.661386, 3.746728, 0.09019608, 0, 1, 1,
0.4448781, 0.5265397, 0.6148831, 0.09803922, 0, 1, 1,
0.4498152, 1.052129, 1.430726, 0.1058824, 0, 1, 1,
0.451624, -0.8063313, 4.591828, 0.1098039, 0, 1, 1,
0.4547147, -0.08067971, 4.117977, 0.1176471, 0, 1, 1,
0.4548253, 0.6460473, 0.8240524, 0.1215686, 0, 1, 1,
0.4582399, 1.164611, 0.2576212, 0.1294118, 0, 1, 1,
0.4646562, -0.3270763, 2.79966, 0.1333333, 0, 1, 1,
0.4670613, -0.5666804, 2.444159, 0.1411765, 0, 1, 1,
0.4700196, 0.3441914, 0.9644986, 0.145098, 0, 1, 1,
0.4715832, 1.03475, -0.2426221, 0.1529412, 0, 1, 1,
0.4716983, -1.244211, 4.104362, 0.1568628, 0, 1, 1,
0.4720053, 0.1243953, 1.989735, 0.1647059, 0, 1, 1,
0.4729096, 0.03728157, 2.481432, 0.1686275, 0, 1, 1,
0.4799557, 0.4288169, 1.807206, 0.1764706, 0, 1, 1,
0.4808161, 0.690258, -0.07181593, 0.1803922, 0, 1, 1,
0.4819947, -0.8690405, 3.891351, 0.1882353, 0, 1, 1,
0.4862104, 0.6489948, -0.6113444, 0.1921569, 0, 1, 1,
0.4868841, -0.336648, 3.44538, 0.2, 0, 1, 1,
0.4875319, 1.308249, 0.1871485, 0.2078431, 0, 1, 1,
0.488492, 1.943978, 2.216622, 0.2117647, 0, 1, 1,
0.4897556, -0.8508103, 2.398603, 0.2196078, 0, 1, 1,
0.4992455, -0.4704565, 3.663797, 0.2235294, 0, 1, 1,
0.5077544, 1.059545, 1.399425, 0.2313726, 0, 1, 1,
0.5142221, 0.02865091, 0.7552376, 0.2352941, 0, 1, 1,
0.5151796, 1.926085, -0.3886493, 0.2431373, 0, 1, 1,
0.5154309, -0.1099851, 1.055613, 0.2470588, 0, 1, 1,
0.5248746, 0.2105049, 2.084661, 0.254902, 0, 1, 1,
0.5278998, 0.987559, -0.4327573, 0.2588235, 0, 1, 1,
0.5281177, 0.9049807, 0.4904248, 0.2666667, 0, 1, 1,
0.5299692, -1.426384, 2.853859, 0.2705882, 0, 1, 1,
0.5304891, -1.452662, 2.444782, 0.2784314, 0, 1, 1,
0.535641, -1.365098, 1.400841, 0.282353, 0, 1, 1,
0.5423647, 1.087918, -1.078032, 0.2901961, 0, 1, 1,
0.5436769, 1.238091, 1.149644, 0.2941177, 0, 1, 1,
0.5444747, 0.70746, 2.351245, 0.3019608, 0, 1, 1,
0.5457458, 0.2657204, -0.4943937, 0.3098039, 0, 1, 1,
0.5476666, -0.5707792, 1.317518, 0.3137255, 0, 1, 1,
0.5479243, 0.7810994, 0.8123678, 0.3215686, 0, 1, 1,
0.5485792, -1.258871, 3.266619, 0.3254902, 0, 1, 1,
0.5486355, 1.361224, 1.042762, 0.3333333, 0, 1, 1,
0.5503318, -0.3367318, -1.084357, 0.3372549, 0, 1, 1,
0.5525247, -0.09396037, 2.18773, 0.345098, 0, 1, 1,
0.5533284, 0.2338358, 1.486023, 0.3490196, 0, 1, 1,
0.5541297, 0.203266, -0.7626155, 0.3568628, 0, 1, 1,
0.5593406, -1.444688, 2.427809, 0.3607843, 0, 1, 1,
0.5650002, -1.075576, 3.068106, 0.3686275, 0, 1, 1,
0.5696379, -1.451647, 1.062412, 0.372549, 0, 1, 1,
0.570287, -0.1347142, 1.712153, 0.3803922, 0, 1, 1,
0.5711095, -0.5399679, 2.009218, 0.3843137, 0, 1, 1,
0.5746776, 1.974285, 0.3947117, 0.3921569, 0, 1, 1,
0.5752316, -0.1256857, 0.8503878, 0.3960784, 0, 1, 1,
0.5762532, -0.5716496, 3.041769, 0.4039216, 0, 1, 1,
0.5780193, 0.1555119, -0.1350569, 0.4117647, 0, 1, 1,
0.5799563, 0.1870811, 2.475823, 0.4156863, 0, 1, 1,
0.5803189, 0.1236205, 0.01258956, 0.4235294, 0, 1, 1,
0.5816527, -1.05392, 1.61309, 0.427451, 0, 1, 1,
0.5821862, 0.9257184, 0.2128317, 0.4352941, 0, 1, 1,
0.5858243, -2.038255, 1.550635, 0.4392157, 0, 1, 1,
0.5869198, -0.1568673, 1.798607, 0.4470588, 0, 1, 1,
0.5890706, 0.1782237, 1.730648, 0.4509804, 0, 1, 1,
0.5915473, -0.7362313, 4.088069, 0.4588235, 0, 1, 1,
0.600819, 1.065033, 0.2091992, 0.4627451, 0, 1, 1,
0.606578, -0.6979824, 1.390775, 0.4705882, 0, 1, 1,
0.6082016, -1.281638, 3.021303, 0.4745098, 0, 1, 1,
0.6089045, -0.8798236, 1.996664, 0.4823529, 0, 1, 1,
0.610835, 0.2285406, 0.3474191, 0.4862745, 0, 1, 1,
0.6140876, 0.9154406, 1.576557, 0.4941176, 0, 1, 1,
0.6149397, 2.381134, -0.02091749, 0.5019608, 0, 1, 1,
0.6182641, 0.4506061, 1.804054, 0.5058824, 0, 1, 1,
0.6193614, -0.8704723, 1.640176, 0.5137255, 0, 1, 1,
0.6251097, -2.032731, 3.382223, 0.5176471, 0, 1, 1,
0.6251782, 0.6724059, 0.9680083, 0.5254902, 0, 1, 1,
0.6282547, -1.854435, 2.026915, 0.5294118, 0, 1, 1,
0.6342236, 0.6139713, -0.2020198, 0.5372549, 0, 1, 1,
0.6422684, 0.2104989, 1.491659, 0.5411765, 0, 1, 1,
0.643779, -0.5530341, 0.8129596, 0.5490196, 0, 1, 1,
0.6459524, -0.3019802, 2.826071, 0.5529412, 0, 1, 1,
0.6472449, -0.272737, 1.69348, 0.5607843, 0, 1, 1,
0.6518054, 0.8858189, 2.187955, 0.5647059, 0, 1, 1,
0.6549389, 0.8021195, 1.573704, 0.572549, 0, 1, 1,
0.6551276, -1.715282, 2.104398, 0.5764706, 0, 1, 1,
0.6556582, -0.3288192, 2.470482, 0.5843138, 0, 1, 1,
0.6561939, 1.638271, -0.8037106, 0.5882353, 0, 1, 1,
0.665047, 1.058362, 1.584909, 0.5960785, 0, 1, 1,
0.669329, 0.3789717, 0.8359318, 0.6039216, 0, 1, 1,
0.6705212, 0.77511, -0.927255, 0.6078432, 0, 1, 1,
0.6743804, -0.8962668, 3.318614, 0.6156863, 0, 1, 1,
0.6813853, -0.6626691, 2.395737, 0.6196079, 0, 1, 1,
0.7015446, 0.03403885, 1.91124, 0.627451, 0, 1, 1,
0.704473, 0.08532599, 2.093949, 0.6313726, 0, 1, 1,
0.7067201, -2.271417, 2.382478, 0.6392157, 0, 1, 1,
0.7073465, -0.6375285, 1.068586, 0.6431373, 0, 1, 1,
0.70748, -0.3064935, 2.483413, 0.6509804, 0, 1, 1,
0.7100169, 0.9166071, 1.464215, 0.654902, 0, 1, 1,
0.7117488, 0.2356281, -0.03399875, 0.6627451, 0, 1, 1,
0.7273297, 1.689789, -0.4737071, 0.6666667, 0, 1, 1,
0.7276417, 0.3239384, 0.1208259, 0.6745098, 0, 1, 1,
0.7307646, 0.7603087, 1.063266, 0.6784314, 0, 1, 1,
0.7328209, -2.126449, 3.460431, 0.6862745, 0, 1, 1,
0.7386147, -0.5733134, 2.072394, 0.6901961, 0, 1, 1,
0.7468366, 0.8504934, 0.9478922, 0.6980392, 0, 1, 1,
0.7514684, -0.6994513, -0.7554837, 0.7058824, 0, 1, 1,
0.7518601, 0.4598372, -0.2114735, 0.7098039, 0, 1, 1,
0.7531297, 0.283477, 0.0284226, 0.7176471, 0, 1, 1,
0.7531614, -0.9409572, 2.243903, 0.7215686, 0, 1, 1,
0.7613804, -0.3183221, 3.75176, 0.7294118, 0, 1, 1,
0.7621521, -0.2044911, 2.222818, 0.7333333, 0, 1, 1,
0.7621529, -0.7064804, 1.278637, 0.7411765, 0, 1, 1,
0.7631301, -1.867837, 3.127098, 0.7450981, 0, 1, 1,
0.7635458, -0.5624061, 1.866241, 0.7529412, 0, 1, 1,
0.7638502, -1.172367, 4.276333, 0.7568628, 0, 1, 1,
0.7652031, 0.3394842, 1.437123, 0.7647059, 0, 1, 1,
0.7720124, 0.1458772, 1.763458, 0.7686275, 0, 1, 1,
0.7726122, -0.5098581, 3.114564, 0.7764706, 0, 1, 1,
0.7732391, 0.4771467, 0.1113172, 0.7803922, 0, 1, 1,
0.7742687, -0.6093169, 2.112685, 0.7882353, 0, 1, 1,
0.7756065, 0.486716, 1.743822, 0.7921569, 0, 1, 1,
0.775676, 1.484627, -0.3826652, 0.8, 0, 1, 1,
0.7805369, -2.264908, 0.7481433, 0.8078431, 0, 1, 1,
0.784201, 0.7313798, 1.189444, 0.8117647, 0, 1, 1,
0.7936765, 0.4933466, 1.092206, 0.8196079, 0, 1, 1,
0.8004781, 0.2946141, 0.7706751, 0.8235294, 0, 1, 1,
0.8025982, -0.2530979, 2.759747, 0.8313726, 0, 1, 1,
0.8039012, -2.445452, 2.451757, 0.8352941, 0, 1, 1,
0.8046125, 1.220731, 1.077645, 0.8431373, 0, 1, 1,
0.810769, 0.05810658, 1.531933, 0.8470588, 0, 1, 1,
0.8108786, -0.1107757, 0.776121, 0.854902, 0, 1, 1,
0.8140319, -1.136423, 2.7756, 0.8588235, 0, 1, 1,
0.8159736, -0.00292063, 2.463168, 0.8666667, 0, 1, 1,
0.816459, -0.08149421, 0.3947316, 0.8705882, 0, 1, 1,
0.8200506, -0.6363447, 1.93443, 0.8784314, 0, 1, 1,
0.8343208, 0.1611464, 1.242379, 0.8823529, 0, 1, 1,
0.8462594, 0.9695159, 2.013731, 0.8901961, 0, 1, 1,
0.8484579, 1.958258, -2.179976, 0.8941177, 0, 1, 1,
0.8508579, 0.9029122, 1.120866, 0.9019608, 0, 1, 1,
0.8509262, 1.400965, 1.600138, 0.9098039, 0, 1, 1,
0.8528252, 1.382477, 0.8321769, 0.9137255, 0, 1, 1,
0.8543168, 0.5617338, 1.489873, 0.9215686, 0, 1, 1,
0.8546779, -2.239076, 2.702285, 0.9254902, 0, 1, 1,
0.8621466, -1.175333, 3.283206, 0.9333333, 0, 1, 1,
0.8631569, -0.8336869, 0.9936771, 0.9372549, 0, 1, 1,
0.8773627, -1.59829, 2.105596, 0.945098, 0, 1, 1,
0.8785234, 1.143546, -0.2551817, 0.9490196, 0, 1, 1,
0.8786672, 1.691082, 0.2050914, 0.9568627, 0, 1, 1,
0.8821729, 0.1996959, 2.148965, 0.9607843, 0, 1, 1,
0.8840164, 1.350919, -1.555254, 0.9686275, 0, 1, 1,
0.8955343, -1.029025, 2.949248, 0.972549, 0, 1, 1,
0.8994467, -1.417719, 1.92541, 0.9803922, 0, 1, 1,
0.9025962, 0.9743797, 1.814721, 0.9843137, 0, 1, 1,
0.9027284, -1.651475, 1.492254, 0.9921569, 0, 1, 1,
0.9044756, 0.6189616, 1.475731, 0.9960784, 0, 1, 1,
0.9076365, -1.204296, 2.603027, 1, 0, 0.9960784, 1,
0.909122, -0.8589795, 3.799104, 1, 0, 0.9882353, 1,
0.912492, 0.8277832, 0.437052, 1, 0, 0.9843137, 1,
0.9149536, -2.611847, 2.568651, 1, 0, 0.9764706, 1,
0.916849, -0.2580055, 3.328384, 1, 0, 0.972549, 1,
0.922471, -1.535044, 2.566633, 1, 0, 0.9647059, 1,
0.9243963, -0.9158443, 1.942128, 1, 0, 0.9607843, 1,
0.9273032, -0.09906351, 2.847666, 1, 0, 0.9529412, 1,
0.9284648, -0.4642941, 2.639961, 1, 0, 0.9490196, 1,
0.9351704, 1.406603, -0.149211, 1, 0, 0.9411765, 1,
0.937076, -0.7294336, 1.004584, 1, 0, 0.9372549, 1,
0.9420819, -0.1945018, 0.8207979, 1, 0, 0.9294118, 1,
0.9500933, 0.8581362, -0.07075692, 1, 0, 0.9254902, 1,
0.9501818, 2.267967, -0.3071055, 1, 0, 0.9176471, 1,
0.9517362, -0.9261203, 3.047694, 1, 0, 0.9137255, 1,
0.9559331, 0.9257015, -1.140636, 1, 0, 0.9058824, 1,
0.956354, -1.240768, 3.279416, 1, 0, 0.9019608, 1,
0.9564121, -0.1229219, 2.30084, 1, 0, 0.8941177, 1,
0.9572002, 0.4505209, 0.5602162, 1, 0, 0.8862745, 1,
0.9572824, 1.732483, 0.367629, 1, 0, 0.8823529, 1,
0.9623287, -1.893291, 4.41747, 1, 0, 0.8745098, 1,
0.9677553, 1.448155, 0.9345169, 1, 0, 0.8705882, 1,
0.9895404, -0.4810896, 2.57384, 1, 0, 0.8627451, 1,
0.9947641, -0.2752775, 1.761707, 1, 0, 0.8588235, 1,
1.002032, -0.7642404, 1.741175, 1, 0, 0.8509804, 1,
1.008997, 1.977666, 0.9878826, 1, 0, 0.8470588, 1,
1.00938, -1.012698, 1.487067, 1, 0, 0.8392157, 1,
1.009655, -0.6498153, 1.856503, 1, 0, 0.8352941, 1,
1.010596, 0.7697751, -0.457478, 1, 0, 0.827451, 1,
1.024318, -0.9644836, 3.615452, 1, 0, 0.8235294, 1,
1.027742, 0.7846885, 2.139434, 1, 0, 0.8156863, 1,
1.035967, 0.3061635, 1.332184, 1, 0, 0.8117647, 1,
1.037071, -0.2861975, 2.642299, 1, 0, 0.8039216, 1,
1.038913, 0.6841903, 0.1252393, 1, 0, 0.7960784, 1,
1.047153, 0.4941811, 1.764403, 1, 0, 0.7921569, 1,
1.04918, -0.1438683, 2.862909, 1, 0, 0.7843137, 1,
1.049943, 0.4417773, 0.2894606, 1, 0, 0.7803922, 1,
1.050424, 1.166851, 1.252943, 1, 0, 0.772549, 1,
1.056173, -0.7144615, 3.128227, 1, 0, 0.7686275, 1,
1.059094, 1.259218, 0.6395528, 1, 0, 0.7607843, 1,
1.062589, 0.06967574, 1.249358, 1, 0, 0.7568628, 1,
1.064408, 2.019724, 2.525594, 1, 0, 0.7490196, 1,
1.06895, -0.105853, 2.151153, 1, 0, 0.7450981, 1,
1.070434, -0.1220768, 0.9596989, 1, 0, 0.7372549, 1,
1.077716, -0.09293242, 3.776708, 1, 0, 0.7333333, 1,
1.0809, 0.7475532, -0.0304991, 1, 0, 0.7254902, 1,
1.081012, -1.906717, 3.565879, 1, 0, 0.7215686, 1,
1.092799, -0.3587936, 1.861446, 1, 0, 0.7137255, 1,
1.095787, -0.4045159, 2.138098, 1, 0, 0.7098039, 1,
1.098601, -0.2290122, 2.922076, 1, 0, 0.7019608, 1,
1.106265, 0.2354365, -0.1370678, 1, 0, 0.6941177, 1,
1.10815, -0.6458155, 2.922496, 1, 0, 0.6901961, 1,
1.116351, -1.523866, 3.808654, 1, 0, 0.682353, 1,
1.121954, 0.9120128, 0.1117596, 1, 0, 0.6784314, 1,
1.124595, 1.026542, 0.03818457, 1, 0, 0.6705883, 1,
1.129103, 0.1665466, 1.618703, 1, 0, 0.6666667, 1,
1.140995, 1.180052, -0.4612827, 1, 0, 0.6588235, 1,
1.141864, -0.1566859, 2.20333, 1, 0, 0.654902, 1,
1.154124, -0.6108657, 3.297244, 1, 0, 0.6470588, 1,
1.155254, 0.3583637, 2.37774, 1, 0, 0.6431373, 1,
1.156237, -0.05709493, 1.33244, 1, 0, 0.6352941, 1,
1.156861, 0.04557563, -0.239609, 1, 0, 0.6313726, 1,
1.162457, -0.086094, 2.139465, 1, 0, 0.6235294, 1,
1.173873, -0.5163741, 1.332715, 1, 0, 0.6196079, 1,
1.183621, 0.7206069, 1.505937, 1, 0, 0.6117647, 1,
1.196773, 1.136575, 1.023784, 1, 0, 0.6078432, 1,
1.199903, -0.4406409, 1.020221, 1, 0, 0.6, 1,
1.205472, 0.5987483, 1.173845, 1, 0, 0.5921569, 1,
1.215308, 1.293866, 1.203952, 1, 0, 0.5882353, 1,
1.216345, 0.02836786, 0.5577534, 1, 0, 0.5803922, 1,
1.221205, -0.614152, 2.369972, 1, 0, 0.5764706, 1,
1.228111, 1.251891, 0.1312364, 1, 0, 0.5686275, 1,
1.246295, -0.1417249, 2.337609, 1, 0, 0.5647059, 1,
1.267303, 0.4081676, 2.554954, 1, 0, 0.5568628, 1,
1.274091, 0.4942439, 1.245191, 1, 0, 0.5529412, 1,
1.276238, 1.416324, -0.6024197, 1, 0, 0.5450981, 1,
1.279165, -0.5385896, 1.776202, 1, 0, 0.5411765, 1,
1.288042, -1.158584, 2.287062, 1, 0, 0.5333334, 1,
1.288128, 1.88227, 2.265916, 1, 0, 0.5294118, 1,
1.296126, -0.7096781, 2.695393, 1, 0, 0.5215687, 1,
1.301259, -0.145057, 1.359674, 1, 0, 0.5176471, 1,
1.301672, 1.000317, 0.6056469, 1, 0, 0.509804, 1,
1.312756, -0.3849924, 1.788194, 1, 0, 0.5058824, 1,
1.314493, 1.992593, 0.8976072, 1, 0, 0.4980392, 1,
1.336338, 0.329706, 1.470701, 1, 0, 0.4901961, 1,
1.346937, -0.1191637, 2.011768, 1, 0, 0.4862745, 1,
1.349158, -0.6666403, 1.424503, 1, 0, 0.4784314, 1,
1.355845, -0.1970282, 2.58011, 1, 0, 0.4745098, 1,
1.370519, -0.1779378, 3.789864, 1, 0, 0.4666667, 1,
1.391775, 0.7226852, 1.560024, 1, 0, 0.4627451, 1,
1.393495, 0.8209495, 2.953844, 1, 0, 0.454902, 1,
1.399793, 0.8750594, 0.04754539, 1, 0, 0.4509804, 1,
1.40493, 0.86476, 1.733857, 1, 0, 0.4431373, 1,
1.411394, -2.779645, 2.465257, 1, 0, 0.4392157, 1,
1.414631, 0.745662, 2.10877, 1, 0, 0.4313726, 1,
1.416471, 1.035315, 0.5086803, 1, 0, 0.427451, 1,
1.422521, -2.807794, 2.612617, 1, 0, 0.4196078, 1,
1.42733, -0.9050874, 2.03683, 1, 0, 0.4156863, 1,
1.437716, 0.2246002, 0.6625655, 1, 0, 0.4078431, 1,
1.441155, 1.13878, 1.543224, 1, 0, 0.4039216, 1,
1.444342, 0.03107996, 2.126367, 1, 0, 0.3960784, 1,
1.447051, 0.6053869, 1.881438, 1, 0, 0.3882353, 1,
1.45478, -0.5507734, -0.3543296, 1, 0, 0.3843137, 1,
1.456392, 0.3501761, 1.347049, 1, 0, 0.3764706, 1,
1.474124, 0.13181, 2.456508, 1, 0, 0.372549, 1,
1.482818, -1.246109, 2.133068, 1, 0, 0.3647059, 1,
1.487481, -0.3879297, 2.398314, 1, 0, 0.3607843, 1,
1.490925, -0.606935, 2.413062, 1, 0, 0.3529412, 1,
1.497734, 0.3837011, 2.579021, 1, 0, 0.3490196, 1,
1.502741, 0.4759952, 0.1678676, 1, 0, 0.3411765, 1,
1.508049, -1.241283, 1.396433, 1, 0, 0.3372549, 1,
1.509644, 0.6346435, 2.225585, 1, 0, 0.3294118, 1,
1.514381, 3.02797, -0.1116055, 1, 0, 0.3254902, 1,
1.524274, -0.1837956, 2.885297, 1, 0, 0.3176471, 1,
1.530138, -1.250689, 2.558237, 1, 0, 0.3137255, 1,
1.540332, -0.3372061, 2.173222, 1, 0, 0.3058824, 1,
1.548212, 0.6511803, 1.144153, 1, 0, 0.2980392, 1,
1.575596, -1.661937, 3.62735, 1, 0, 0.2941177, 1,
1.598677, 0.1903403, 1.840803, 1, 0, 0.2862745, 1,
1.599128, -0.2574601, 1.91096, 1, 0, 0.282353, 1,
1.603038, -0.03093396, 1.325598, 1, 0, 0.2745098, 1,
1.604978, -1.165205, 2.553675, 1, 0, 0.2705882, 1,
1.609548, 0.2036797, 1.735047, 1, 0, 0.2627451, 1,
1.643192, -0.9037305, 2.40114, 1, 0, 0.2588235, 1,
1.655075, -0.634258, 2.881755, 1, 0, 0.2509804, 1,
1.661135, 0.843464, 1.459766, 1, 0, 0.2470588, 1,
1.678225, 0.6481701, 3.214879, 1, 0, 0.2392157, 1,
1.704103, -0.5087781, 1.257796, 1, 0, 0.2352941, 1,
1.718192, 0.3098222, 0.9164213, 1, 0, 0.227451, 1,
1.722125, -0.4183033, 2.603109, 1, 0, 0.2235294, 1,
1.732864, 0.2675442, 1.051788, 1, 0, 0.2156863, 1,
1.733316, 0.4403065, 1.274584, 1, 0, 0.2117647, 1,
1.739833, -0.5363442, 1.530949, 1, 0, 0.2039216, 1,
1.748618, -1.165406, 1.985927, 1, 0, 0.1960784, 1,
1.757474, -1.073219, 0.3889573, 1, 0, 0.1921569, 1,
1.757861, -0.2093319, 0.9651831, 1, 0, 0.1843137, 1,
1.777552, 0.4995283, 2.899081, 1, 0, 0.1803922, 1,
1.779392, -0.4047905, 0.7833669, 1, 0, 0.172549, 1,
1.783385, 1.233114, 1.955883, 1, 0, 0.1686275, 1,
1.802758, -1.37371, 3.894245, 1, 0, 0.1607843, 1,
1.808193, -0.4978857, 0.2906773, 1, 0, 0.1568628, 1,
1.809207, 0.9673268, 0.5415049, 1, 0, 0.1490196, 1,
1.831445, -0.3260924, 2.141283, 1, 0, 0.145098, 1,
1.831597, -2.479448, 0.8802106, 1, 0, 0.1372549, 1,
1.854796, 1.634942, 0.4183978, 1, 0, 0.1333333, 1,
1.856541, -0.1769256, 1.565357, 1, 0, 0.1254902, 1,
1.881248, -0.5354826, 0.4251531, 1, 0, 0.1215686, 1,
1.9018, -0.7001741, 2.021138, 1, 0, 0.1137255, 1,
1.927353, -0.3457659, 3.185962, 1, 0, 0.1098039, 1,
1.930858, 1.332749, 0.2259023, 1, 0, 0.1019608, 1,
1.936914, 0.2396934, 1.14675, 1, 0, 0.09411765, 1,
1.969988, -1.027562, 1.27272, 1, 0, 0.09019608, 1,
1.989654, 1.055807, 0.9990188, 1, 0, 0.08235294, 1,
2.059286, -1.433483, 4.396948, 1, 0, 0.07843138, 1,
2.073572, 1.934205, 0.927326, 1, 0, 0.07058824, 1,
2.130541, -0.7679942, 0.4692684, 1, 0, 0.06666667, 1,
2.254098, 0.6056269, 2.121769, 1, 0, 0.05882353, 1,
2.267261, -1.836374, 3.08458, 1, 0, 0.05490196, 1,
2.269054, -0.7518069, 4.088395, 1, 0, 0.04705882, 1,
2.309805, -0.3299613, 2.568316, 1, 0, 0.04313726, 1,
2.471755, 1.407324, 3.062157, 1, 0, 0.03529412, 1,
2.541258, -1.26148, 2.456774, 1, 0, 0.03137255, 1,
2.576643, 0.4302318, 0.9864601, 1, 0, 0.02352941, 1,
2.596932, 0.3057636, 0.694239, 1, 0, 0.01960784, 1,
2.671032, 1.494919, -0.7786419, 1, 0, 0.01176471, 1,
3.012096, 1.568419, 1.930947, 1, 0, 0.007843138, 1
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
0.02881885, -3.796956, -7.27294, 0, -0.5, 0.5, 0.5,
0.02881885, -3.796956, -7.27294, 1, -0.5, 0.5, 0.5,
0.02881885, -3.796956, -7.27294, 1, 1.5, 0.5, 0.5,
0.02881885, -3.796956, -7.27294, 0, 1.5, 0.5, 0.5
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
-3.96579, 0.1100878, -7.27294, 0, -0.5, 0.5, 0.5,
-3.96579, 0.1100878, -7.27294, 1, -0.5, 0.5, 0.5,
-3.96579, 0.1100878, -7.27294, 1, 1.5, 0.5, 0.5,
-3.96579, 0.1100878, -7.27294, 0, 1.5, 0.5, 0.5
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
-3.96579, -3.796956, 0.03111315, 0, -0.5, 0.5, 0.5,
-3.96579, -3.796956, 0.03111315, 1, -0.5, 0.5, 0.5,
-3.96579, -3.796956, 0.03111315, 1, 1.5, 0.5, 0.5,
-3.96579, -3.796956, 0.03111315, 0, 1.5, 0.5, 0.5
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
-2, -2.895331, -5.587389,
3, -2.895331, -5.587389,
-2, -2.895331, -5.587389,
-2, -3.045602, -5.868315,
-1, -2.895331, -5.587389,
-1, -3.045602, -5.868315,
0, -2.895331, -5.587389,
0, -3.045602, -5.868315,
1, -2.895331, -5.587389,
1, -3.045602, -5.868315,
2, -2.895331, -5.587389,
2, -3.045602, -5.868315,
3, -2.895331, -5.587389,
3, -3.045602, -5.868315
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
-2, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
-2, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
-2, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
-2, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5,
-1, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
-1, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
-1, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
-1, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5,
0, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
0, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
0, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
0, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5,
1, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
1, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
1, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
1, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5,
2, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
2, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
2, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
2, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5,
3, -3.346143, -6.430165, 0, -0.5, 0.5, 0.5,
3, -3.346143, -6.430165, 1, -0.5, 0.5, 0.5,
3, -3.346143, -6.430165, 1, 1.5, 0.5, 0.5,
3, -3.346143, -6.430165, 0, 1.5, 0.5, 0.5
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
-3.043957, -2, -5.587389,
-3.043957, 3, -5.587389,
-3.043957, -2, -5.587389,
-3.197596, -2, -5.868315,
-3.043957, -1, -5.587389,
-3.197596, -1, -5.868315,
-3.043957, 0, -5.587389,
-3.197596, 0, -5.868315,
-3.043957, 1, -5.587389,
-3.197596, 1, -5.868315,
-3.043957, 2, -5.587389,
-3.197596, 2, -5.868315,
-3.043957, 3, -5.587389,
-3.197596, 3, -5.868315
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
-3.504874, -2, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, -2, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, -2, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, -2, -6.430165, 0, 1.5, 0.5, 0.5,
-3.504874, -1, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, -1, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, -1, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, -1, -6.430165, 0, 1.5, 0.5, 0.5,
-3.504874, 0, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, 0, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, 0, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, 0, -6.430165, 0, 1.5, 0.5, 0.5,
-3.504874, 1, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, 1, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, 1, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, 1, -6.430165, 0, 1.5, 0.5, 0.5,
-3.504874, 2, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, 2, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, 2, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, 2, -6.430165, 0, 1.5, 0.5, 0.5,
-3.504874, 3, -6.430165, 0, -0.5, 0.5, 0.5,
-3.504874, 3, -6.430165, 1, -0.5, 0.5, 0.5,
-3.504874, 3, -6.430165, 1, 1.5, 0.5, 0.5,
-3.504874, 3, -6.430165, 0, 1.5, 0.5, 0.5
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
-3.043957, -2.895331, -4,
-3.043957, -2.895331, 4,
-3.043957, -2.895331, -4,
-3.197596, -3.045602, -4,
-3.043957, -2.895331, -2,
-3.197596, -3.045602, -2,
-3.043957, -2.895331, 0,
-3.197596, -3.045602, 0,
-3.043957, -2.895331, 2,
-3.197596, -3.045602, 2,
-3.043957, -2.895331, 4,
-3.197596, -3.045602, 4
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
-3.504874, -3.346143, -4, 0, -0.5, 0.5, 0.5,
-3.504874, -3.346143, -4, 1, -0.5, 0.5, 0.5,
-3.504874, -3.346143, -4, 1, 1.5, 0.5, 0.5,
-3.504874, -3.346143, -4, 0, 1.5, 0.5, 0.5,
-3.504874, -3.346143, -2, 0, -0.5, 0.5, 0.5,
-3.504874, -3.346143, -2, 1, -0.5, 0.5, 0.5,
-3.504874, -3.346143, -2, 1, 1.5, 0.5, 0.5,
-3.504874, -3.346143, -2, 0, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 0, 0, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 0, 1, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 0, 1, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 0, 0, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 2, 0, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 2, 1, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 2, 1, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 2, 0, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 4, 0, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 4, 1, -0.5, 0.5, 0.5,
-3.504874, -3.346143, 4, 1, 1.5, 0.5, 0.5,
-3.504874, -3.346143, 4, 0, 1.5, 0.5, 0.5
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
-3.043957, -2.895331, -5.587389,
-3.043957, 3.115506, -5.587389,
-3.043957, -2.895331, 5.649616,
-3.043957, 3.115506, 5.649616,
-3.043957, -2.895331, -5.587389,
-3.043957, -2.895331, 5.649616,
-3.043957, 3.115506, -5.587389,
-3.043957, 3.115506, 5.649616,
-3.043957, -2.895331, -5.587389,
3.101595, -2.895331, -5.587389,
-3.043957, -2.895331, 5.649616,
3.101595, -2.895331, 5.649616,
-3.043957, 3.115506, -5.587389,
3.101595, 3.115506, -5.587389,
-3.043957, 3.115506, 5.649616,
3.101595, 3.115506, 5.649616,
3.101595, -2.895331, -5.587389,
3.101595, 3.115506, -5.587389,
3.101595, -2.895331, 5.649616,
3.101595, 3.115506, 5.649616,
3.101595, -2.895331, -5.587389,
3.101595, -2.895331, 5.649616,
3.101595, 3.115506, -5.587389,
3.101595, 3.115506, 5.649616
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
var radius = 7.554802;
var distance = 33.61217;
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
mvMatrix.translate( -0.02881885, -0.1100878, -0.03111315 );
mvMatrix.scale( 1.329156, 1.358945, 0.7269197 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.61217);
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
3-acetyl-6-methylpyr<-read.table("3-acetyl-6-methylpyr.xyz", skip=1)
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
-2.954459, -2.215659, -3.320256, 0, 0, 1, 1, 1,
-2.695783, 1.689265, -1.487709, 1, 0, 0, 1, 1,
-2.595664, 1.017502, -0.2778676, 1, 0, 0, 1, 1,
-2.488215, 0.01506973, -0.813363, 1, 0, 0, 1, 1,
-2.43945, -0.1945117, -2.132069, 1, 0, 0, 1, 1,
-2.3911, 0.2303287, -0.9121394, 1, 0, 0, 1, 1,
-2.378091, -0.4476022, -2.147081, 0, 0, 0, 1, 1,
-2.286261, 1.515038, -0.1456822, 0, 0, 0, 1, 1,
-2.265854, -0.4674698, -1.555282, 0, 0, 0, 1, 1,
-2.195395, -0.01184618, -1.665813, 0, 0, 0, 1, 1,
-2.194465, 0.6515762, -3.112439, 0, 0, 0, 1, 1,
-2.186683, 1.248266, 0.1835417, 0, 0, 0, 1, 1,
-2.152452, -0.008860918, -1.671754, 0, 0, 0, 1, 1,
-2.143106, 1.940141, 0.5866241, 1, 1, 1, 1, 1,
-2.083199, -0.5116938, -2.965752, 1, 1, 1, 1, 1,
-2.077776, 0.08185299, -0.330761, 1, 1, 1, 1, 1,
-2.072318, 0.7277993, -2.11851, 1, 1, 1, 1, 1,
-2.057045, -0.2094432, -2.669531, 1, 1, 1, 1, 1,
-2.051303, -0.60603, -3.174379, 1, 1, 1, 1, 1,
-2.038437, 0.9398624, -0.6963731, 1, 1, 1, 1, 1,
-2.023633, 0.4442383, 0.05143153, 1, 1, 1, 1, 1,
-2.018396, -0.4881553, -3.285757, 1, 1, 1, 1, 1,
-1.995892, -0.7046152, -1.161, 1, 1, 1, 1, 1,
-1.980565, -2.514979, -0.3796662, 1, 1, 1, 1, 1,
-1.908875, -0.9009209, -2.637267, 1, 1, 1, 1, 1,
-1.888304, -1.071049, -0.8078377, 1, 1, 1, 1, 1,
-1.887205, 0.319391, 0.0901024, 1, 1, 1, 1, 1,
-1.885387, -0.2745881, -1.676785, 1, 1, 1, 1, 1,
-1.879548, 0.6648588, 1.275931, 0, 0, 1, 1, 1,
-1.877013, -1.152059, -0.4397869, 1, 0, 0, 1, 1,
-1.853225, 1.272834, -0.7309493, 1, 0, 0, 1, 1,
-1.845377, 2.457187, -1.878361, 1, 0, 0, 1, 1,
-1.834006, 0.8681415, -1.681003, 1, 0, 0, 1, 1,
-1.818614, 0.9567773, -0.7072374, 1, 0, 0, 1, 1,
-1.806071, 1.145253, -2.198997, 0, 0, 0, 1, 1,
-1.7921, 0.2243581, -1.245731, 0, 0, 0, 1, 1,
-1.7826, -0.7437022, -0.8915294, 0, 0, 0, 1, 1,
-1.782287, -0.5845312, -1.268891, 0, 0, 0, 1, 1,
-1.77093, -0.4943042, -1.426731, 0, 0, 0, 1, 1,
-1.770546, -0.8530269, -4.112381, 0, 0, 0, 1, 1,
-1.764536, 1.257264, -1.824831, 0, 0, 0, 1, 1,
-1.763293, 1.27914, -1.326055, 1, 1, 1, 1, 1,
-1.736403, 1.625466, -1.832482, 1, 1, 1, 1, 1,
-1.733539, -1.434586, -0.6838005, 1, 1, 1, 1, 1,
-1.733005, 0.5771412, -1.014163, 1, 1, 1, 1, 1,
-1.731729, -1.058106, -1.546367, 1, 1, 1, 1, 1,
-1.685218, 0.4680746, -0.6741205, 1, 1, 1, 1, 1,
-1.678051, -0.4878745, -1.708603, 1, 1, 1, 1, 1,
-1.670328, -1.650687, -2.444854, 1, 1, 1, 1, 1,
-1.669529, 0.007859915, -1.324672, 1, 1, 1, 1, 1,
-1.666598, -1.271298, -1.510765, 1, 1, 1, 1, 1,
-1.643518, -0.4123147, -1.215867, 1, 1, 1, 1, 1,
-1.637938, -0.6724347, -1.582592, 1, 1, 1, 1, 1,
-1.637829, -1.136529, -3.994014, 1, 1, 1, 1, 1,
-1.634975, -0.9505015, -0.8755959, 1, 1, 1, 1, 1,
-1.603536, 1.01789, 0.7605068, 1, 1, 1, 1, 1,
-1.595064, 1.394821, -1.125491, 0, 0, 1, 1, 1,
-1.593786, 0.06299184, -0.576207, 1, 0, 0, 1, 1,
-1.577241, -0.08967626, 0.416155, 1, 0, 0, 1, 1,
-1.576896, 0.7922067, -1.072187, 1, 0, 0, 1, 1,
-1.556123, -0.4655304, -4.14484, 1, 0, 0, 1, 1,
-1.552748, -0.6726285, -2.090496, 1, 0, 0, 1, 1,
-1.522562, 0.8293579, -1.717519, 0, 0, 0, 1, 1,
-1.517073, 1.979979, -1.028826, 0, 0, 0, 1, 1,
-1.515406, -0.8633633, -2.980023, 0, 0, 0, 1, 1,
-1.511157, -1.773077, -1.492699, 0, 0, 0, 1, 1,
-1.496119, 0.5051972, -0.729026, 0, 0, 0, 1, 1,
-1.48281, 0.87743, -1.724174, 0, 0, 0, 1, 1,
-1.481296, -0.8153834, -2.359292, 0, 0, 0, 1, 1,
-1.471681, -0.2270941, -1.942476, 1, 1, 1, 1, 1,
-1.4592, 1.899317, 0.3733602, 1, 1, 1, 1, 1,
-1.453467, 0.8691302, 0.438971, 1, 1, 1, 1, 1,
-1.450417, 0.7401013, -0.903956, 1, 1, 1, 1, 1,
-1.447529, -1.762581, -2.480287, 1, 1, 1, 1, 1,
-1.440925, 0.9372229, -0.1774157, 1, 1, 1, 1, 1,
-1.433745, -0.2618309, -1.528003, 1, 1, 1, 1, 1,
-1.421701, 1.440352, -0.438709, 1, 1, 1, 1, 1,
-1.417164, 0.4902749, -0.524569, 1, 1, 1, 1, 1,
-1.416856, -0.7300056, -1.268552, 1, 1, 1, 1, 1,
-1.411355, -0.7625559, -3.595658, 1, 1, 1, 1, 1,
-1.374003, 1.30272, -0.624815, 1, 1, 1, 1, 1,
-1.3722, 0.4700525, -2.479706, 1, 1, 1, 1, 1,
-1.370982, -0.5519633, -1.005001, 1, 1, 1, 1, 1,
-1.358434, 1.255467, -0.2633936, 1, 1, 1, 1, 1,
-1.352058, 1.433929, -0.9454291, 0, 0, 1, 1, 1,
-1.35144, -1.115823, -1.361974, 1, 0, 0, 1, 1,
-1.347194, 1.407457, -0.9549914, 1, 0, 0, 1, 1,
-1.345047, 2.328147, -1.309046, 1, 0, 0, 1, 1,
-1.344298, 0.6003498, -0.5352086, 1, 0, 0, 1, 1,
-1.341611, 0.04932116, -1.998927, 1, 0, 0, 1, 1,
-1.336091, 0.06420172, 0.3315141, 0, 0, 0, 1, 1,
-1.332619, -0.3800084, -0.8959861, 0, 0, 0, 1, 1,
-1.327399, -1.434185, -1.369059, 0, 0, 0, 1, 1,
-1.309931, -0.9318237, -2.108873, 0, 0, 0, 1, 1,
-1.30648, -0.8181233, -1.617739, 0, 0, 0, 1, 1,
-1.294988, -1.452199, -3.205009, 0, 0, 0, 1, 1,
-1.291155, 0.7803415, -0.501172, 0, 0, 0, 1, 1,
-1.282327, 2.239809, -0.5354033, 1, 1, 1, 1, 1,
-1.280255, 1.007819, -0.3858422, 1, 1, 1, 1, 1,
-1.255117, -0.782181, -2.218403, 1, 1, 1, 1, 1,
-1.254332, 0.2307587, -0.6562548, 1, 1, 1, 1, 1,
-1.248115, -1.170823, -3.631218, 1, 1, 1, 1, 1,
-1.242393, 1.198983, -0.9345553, 1, 1, 1, 1, 1,
-1.239662, 0.0480704, -0.1827166, 1, 1, 1, 1, 1,
-1.231354, -0.8641359, -2.642663, 1, 1, 1, 1, 1,
-1.227485, -0.2697742, -1.421411, 1, 1, 1, 1, 1,
-1.225176, -2.781673, -2.959995, 1, 1, 1, 1, 1,
-1.218043, 0.2995692, -1.560499, 1, 1, 1, 1, 1,
-1.20648, 0.2221007, -1.34643, 1, 1, 1, 1, 1,
-1.205075, -0.03252571, -0.9212075, 1, 1, 1, 1, 1,
-1.203303, 0.6684113, -0.3069457, 1, 1, 1, 1, 1,
-1.187939, 1.385202, 1.776715, 1, 1, 1, 1, 1,
-1.185981, 2.370401, -0.1191508, 0, 0, 1, 1, 1,
-1.177049, 0.2552229, -0.1151528, 1, 0, 0, 1, 1,
-1.150501, -1.55811, -3.852604, 1, 0, 0, 1, 1,
-1.148548, -0.8789365, -2.568847, 1, 0, 0, 1, 1,
-1.140784, 0.04889312, -1.688979, 1, 0, 0, 1, 1,
-1.135825, -0.2178749, -2.186424, 1, 0, 0, 1, 1,
-1.134386, 0.3356661, -2.256398, 0, 0, 0, 1, 1,
-1.134184, 0.7461057, 0.7338761, 0, 0, 0, 1, 1,
-1.124112, 0.7022132, -2.064645, 0, 0, 0, 1, 1,
-1.121492, 0.3900673, 0.3418289, 0, 0, 0, 1, 1,
-1.119913, -1.718377, -1.372259, 0, 0, 0, 1, 1,
-1.11387, -1.067395, -3.044567, 0, 0, 0, 1, 1,
-1.111444, 1.153004, -0.5935797, 0, 0, 0, 1, 1,
-1.1095, 1.425729, -1.120166, 1, 1, 1, 1, 1,
-1.106692, 0.02303783, -1.914015, 1, 1, 1, 1, 1,
-1.105847, -0.6480685, -2.371341, 1, 1, 1, 1, 1,
-1.103726, 1.108881, -0.3984629, 1, 1, 1, 1, 1,
-1.10338, -0.3693921, -3.648618, 1, 1, 1, 1, 1,
-1.103185, 2.65249, 0.2606578, 1, 1, 1, 1, 1,
-1.099121, -0.1400553, -1.727486, 1, 1, 1, 1, 1,
-1.089873, 2.118078, -1.148309, 1, 1, 1, 1, 1,
-1.086068, -2.500366, -3.291342, 1, 1, 1, 1, 1,
-1.085771, -0.3757115, -2.661841, 1, 1, 1, 1, 1,
-1.083965, 1.649607, 0.1992497, 1, 1, 1, 1, 1,
-1.075295, 0.1334946, -2.278804, 1, 1, 1, 1, 1,
-1.07367, -0.3864166, -2.977798, 1, 1, 1, 1, 1,
-1.071964, -0.5711736, 0.08619658, 1, 1, 1, 1, 1,
-1.060957, 0.8083085, -1.239497, 1, 1, 1, 1, 1,
-1.052228, -1.254172, -1.881873, 0, 0, 1, 1, 1,
-1.047948, -0.004605201, -1.36151, 1, 0, 0, 1, 1,
-1.042845, -0.8746433, -2.047118, 1, 0, 0, 1, 1,
-1.039895, -1.400762, -3.392619, 1, 0, 0, 1, 1,
-1.038675, -0.04041636, 0.1355287, 1, 0, 0, 1, 1,
-1.033752, 0.4871815, -0.9530298, 1, 0, 0, 1, 1,
-1.024571, 1.515583, 0.2878365, 0, 0, 0, 1, 1,
-1.016672, 1.775095, -0.5953885, 0, 0, 0, 1, 1,
-1.01169, -0.6503373, -0.7799777, 0, 0, 0, 1, 1,
-1.00917, 0.6659665, 0.5974216, 0, 0, 0, 1, 1,
-1.007854, 0.9329179, -0.7674403, 0, 0, 0, 1, 1,
-1.007055, 0.006706618, -1.096535, 0, 0, 0, 1, 1,
-1.006928, -0.2396399, -1.721298, 0, 0, 0, 1, 1,
-0.9982945, -1.866845, -1.454518, 1, 1, 1, 1, 1,
-0.9928114, 0.3732418, -1.24443, 1, 1, 1, 1, 1,
-0.9924325, 0.8581162, -1.802001, 1, 1, 1, 1, 1,
-0.9850373, 0.5580567, -2.988196, 1, 1, 1, 1, 1,
-0.9808957, 1.421595, -0.6701914, 1, 1, 1, 1, 1,
-0.9687462, -0.5214416, -1.931419, 1, 1, 1, 1, 1,
-0.9639528, -0.3922283, -0.5880241, 1, 1, 1, 1, 1,
-0.963423, -0.315524, -0.459432, 1, 1, 1, 1, 1,
-0.9628248, 0.1217964, -2.268736, 1, 1, 1, 1, 1,
-0.9533656, 0.2642142, -1.794038, 1, 1, 1, 1, 1,
-0.9501831, -1.848498, -3.176963, 1, 1, 1, 1, 1,
-0.948061, 0.08782797, -1.348687, 1, 1, 1, 1, 1,
-0.9452046, 0.07542016, -1.928926, 1, 1, 1, 1, 1,
-0.9420021, -0.2231134, -2.219799, 1, 1, 1, 1, 1,
-0.9407633, 0.9452243, -0.1661999, 1, 1, 1, 1, 1,
-0.9400837, -0.4653082, -1.73603, 0, 0, 1, 1, 1,
-0.939914, 0.8639483, 1.199692, 1, 0, 0, 1, 1,
-0.9395976, 0.4158011, -2.56603, 1, 0, 0, 1, 1,
-0.9381582, 0.5900181, -1.321056, 1, 0, 0, 1, 1,
-0.9334512, 1.525376, -2.93065, 1, 0, 0, 1, 1,
-0.9332628, -1.240847, -3.464222, 1, 0, 0, 1, 1,
-0.9302245, 1.689673, -0.7516451, 0, 0, 0, 1, 1,
-0.9292339, -0.9840743, -3.919732, 0, 0, 0, 1, 1,
-0.9149119, -1.089906, -0.3011968, 0, 0, 0, 1, 1,
-0.910832, -0.2241983, -4.089056, 0, 0, 0, 1, 1,
-0.9106731, -1.78702, -1.939678, 0, 0, 0, 1, 1,
-0.9095305, 0.7413555, -2.858293, 0, 0, 0, 1, 1,
-0.9091966, 0.5365566, -0.4720806, 0, 0, 0, 1, 1,
-0.9045125, -0.6962966, -2.187507, 1, 1, 1, 1, 1,
-0.9042037, 0.105072, -2.451078, 1, 1, 1, 1, 1,
-0.8948447, -0.1951056, -2.508058, 1, 1, 1, 1, 1,
-0.8858898, -0.6678954, -2.957176, 1, 1, 1, 1, 1,
-0.8810688, -0.2731699, -2.272632, 1, 1, 1, 1, 1,
-0.8785857, -1.327902, -1.832555, 1, 1, 1, 1, 1,
-0.8774828, -1.835341, -3.550403, 1, 1, 1, 1, 1,
-0.8750278, 0.7026104, 0.008375622, 1, 1, 1, 1, 1,
-0.8732988, -1.543769, -3.881263, 1, 1, 1, 1, 1,
-0.8716094, -0.2017877, 0.1442248, 1, 1, 1, 1, 1,
-0.8710746, 0.7149832, -1.803513, 1, 1, 1, 1, 1,
-0.8698495, -0.3821037, -2.695497, 1, 1, 1, 1, 1,
-0.8681755, 1.799485, -1.291866, 1, 1, 1, 1, 1,
-0.8675994, -1.079691, -2.086167, 1, 1, 1, 1, 1,
-0.86453, -0.3462559, -0.5077489, 1, 1, 1, 1, 1,
-0.8604712, -1.031966, -2.643626, 0, 0, 1, 1, 1,
-0.8591926, -1.52351, -4.662479, 1, 0, 0, 1, 1,
-0.8581915, -0.7053358, -1.983189, 1, 0, 0, 1, 1,
-0.8497718, 0.7128646, -0.9148175, 1, 0, 0, 1, 1,
-0.8455542, 1.560865, -1.059265, 1, 0, 0, 1, 1,
-0.8454338, 0.5554484, -1.300108, 1, 0, 0, 1, 1,
-0.8445404, 0.4639681, -1.101079, 0, 0, 0, 1, 1,
-0.8441298, -0.3629038, -0.08086073, 0, 0, 0, 1, 1,
-0.8429297, -0.7481955, -2.639874, 0, 0, 0, 1, 1,
-0.8302009, 2.20475, -0.006973772, 0, 0, 0, 1, 1,
-0.8293378, 0.3061412, -1.215093, 0, 0, 0, 1, 1,
-0.8285957, 1.824339, -0.03440179, 0, 0, 0, 1, 1,
-0.8243862, -0.3616082, -2.095887, 0, 0, 0, 1, 1,
-0.8241866, -1.075518, -2.757931, 1, 1, 1, 1, 1,
-0.8226376, -0.8749605, -2.501474, 1, 1, 1, 1, 1,
-0.8202236, -0.009111454, -3.045111, 1, 1, 1, 1, 1,
-0.820183, -1.282907, -1.563613, 1, 1, 1, 1, 1,
-0.8111171, 0.5424438, -0.9710848, 1, 1, 1, 1, 1,
-0.8111039, 0.6884972, 0.2405653, 1, 1, 1, 1, 1,
-0.8090696, -0.9485779, -3.571173, 1, 1, 1, 1, 1,
-0.8080038, 1.358264, -0.6629125, 1, 1, 1, 1, 1,
-0.8069885, -0.4550423, -2.577395, 1, 1, 1, 1, 1,
-0.804703, -0.4998606, -2.027026, 1, 1, 1, 1, 1,
-0.7998638, 0.3718628, -1.587428, 1, 1, 1, 1, 1,
-0.7990025, 0.4932537, -1.506874, 1, 1, 1, 1, 1,
-0.797128, -0.01875759, -2.057522, 1, 1, 1, 1, 1,
-0.7956008, -0.2075615, -0.05689406, 1, 1, 1, 1, 1,
-0.7905994, -0.5280534, -0.89616, 1, 1, 1, 1, 1,
-0.7863567, 0.1192601, -2.484217, 0, 0, 1, 1, 1,
-0.7836054, -1.092895, -1.815104, 1, 0, 0, 1, 1,
-0.7833456, -0.4392746, -4.053416, 1, 0, 0, 1, 1,
-0.7774157, 0.8539562, 0.005756279, 1, 0, 0, 1, 1,
-0.7773459, -0.400095, -1.452156, 1, 0, 0, 1, 1,
-0.7739409, -0.1713498, -1.982752, 1, 0, 0, 1, 1,
-0.7732448, -1.16156, -3.324812, 0, 0, 0, 1, 1,
-0.7715042, 1.468875, 1.422717, 0, 0, 0, 1, 1,
-0.7706942, 1.22288, -0.6004232, 0, 0, 0, 1, 1,
-0.7636223, -0.07229409, -0.2077421, 0, 0, 0, 1, 1,
-0.7621811, 2.308104, 1.242248, 0, 0, 0, 1, 1,
-0.7620448, -0.3464166, -0.7967614, 0, 0, 0, 1, 1,
-0.7594047, 0.9098656, -0.7789605, 0, 0, 0, 1, 1,
-0.7567119, -0.1891238, -1.170828, 1, 1, 1, 1, 1,
-0.7545745, -0.03943053, -0.1288768, 1, 1, 1, 1, 1,
-0.7522948, 0.4841702, -2.39303, 1, 1, 1, 1, 1,
-0.7519934, 0.1819659, -1.152449, 1, 1, 1, 1, 1,
-0.7498277, -0.3076856, -1.908432, 1, 1, 1, 1, 1,
-0.7493492, 0.232225, -1.607459, 1, 1, 1, 1, 1,
-0.7492166, -1.439597, -2.859189, 1, 1, 1, 1, 1,
-0.7403858, 0.3815634, -0.8990197, 1, 1, 1, 1, 1,
-0.7401262, -0.03907583, -0.6523346, 1, 1, 1, 1, 1,
-0.7343193, -0.1372167, -2.66776, 1, 1, 1, 1, 1,
-0.7276957, -1.452703, -2.054448, 1, 1, 1, 1, 1,
-0.7244846, 0.02607513, -1.072541, 1, 1, 1, 1, 1,
-0.7238995, 0.6360714, -1.748096, 1, 1, 1, 1, 1,
-0.7183433, -0.1144163, -2.06598, 1, 1, 1, 1, 1,
-0.7170988, -0.38079, -1.503994, 1, 1, 1, 1, 1,
-0.7108116, -1.412673, -2.748957, 0, 0, 1, 1, 1,
-0.7103547, -0.0586445, -2.099491, 1, 0, 0, 1, 1,
-0.7091174, 0.7239439, -2.814031, 1, 0, 0, 1, 1,
-0.7076605, -1.940063, -1.381463, 1, 0, 0, 1, 1,
-0.7062562, 0.9445111, -1.200752, 1, 0, 0, 1, 1,
-0.70617, 2.028273, -0.3512337, 1, 0, 0, 1, 1,
-0.7046666, -0.03227906, -0.7625294, 0, 0, 0, 1, 1,
-0.6895755, 0.1900707, -0.7359928, 0, 0, 0, 1, 1,
-0.689001, -0.1658925, -1.386954, 0, 0, 0, 1, 1,
-0.6799814, 1.11882, 0.03626405, 0, 0, 0, 1, 1,
-0.6794576, 1.574763, -1.642215, 0, 0, 0, 1, 1,
-0.6788131, 1.495156, -0.5624073, 0, 0, 0, 1, 1,
-0.6692091, 1.612392, -1.664143, 0, 0, 0, 1, 1,
-0.6664785, -1.049779, -3.85418, 1, 1, 1, 1, 1,
-0.6662033, -0.4885264, -0.6430263, 1, 1, 1, 1, 1,
-0.6641328, 0.9403715, -0.1846223, 1, 1, 1, 1, 1,
-0.6617312, 0.2944363, -2.219502, 1, 1, 1, 1, 1,
-0.6550511, -1.024024, -1.253434, 1, 1, 1, 1, 1,
-0.6504665, 0.8834709, -0.3004178, 1, 1, 1, 1, 1,
-0.6501266, 1.634844, -1.720398, 1, 1, 1, 1, 1,
-0.6464533, -0.48873, -2.249436, 1, 1, 1, 1, 1,
-0.6438046, 0.205798, -1.206007, 1, 1, 1, 1, 1,
-0.6412521, -0.341894, -1.642739, 1, 1, 1, 1, 1,
-0.6371047, 0.09970187, -1.756732, 1, 1, 1, 1, 1,
-0.6355224, -0.01584414, 0.2885262, 1, 1, 1, 1, 1,
-0.6350117, -0.6312835, -1.973398, 1, 1, 1, 1, 1,
-0.6343605, 0.7841649, -0.7755299, 1, 1, 1, 1, 1,
-0.6335885, 0.5538263, -0.06101218, 1, 1, 1, 1, 1,
-0.6328431, 0.5552681, -1.492812, 0, 0, 1, 1, 1,
-0.6311647, 0.8593675, -1.108443, 1, 0, 0, 1, 1,
-0.6302052, 0.3835243, -1.129864, 1, 0, 0, 1, 1,
-0.6258408, 1.224165, -1.503884, 1, 0, 0, 1, 1,
-0.6200106, 0.4159032, -0.4122715, 1, 0, 0, 1, 1,
-0.6171928, -0.3226754, -3.085324, 1, 0, 0, 1, 1,
-0.6159577, -0.04199278, -1.558469, 0, 0, 0, 1, 1,
-0.6030888, -0.7261266, -2.0225, 0, 0, 0, 1, 1,
-0.6019457, -0.7579007, -0.8895081, 0, 0, 0, 1, 1,
-0.6017641, 0.2584241, -2.176054, 0, 0, 0, 1, 1,
-0.5917159, -0.2015376, -2.609787, 0, 0, 0, 1, 1,
-0.5898435, 1.138013, -1.042045, 0, 0, 0, 1, 1,
-0.5890996, -0.7212903, -1.814725, 0, 0, 0, 1, 1,
-0.5840519, 0.2385187, -1.049468, 1, 1, 1, 1, 1,
-0.5826661, 0.7893184, -0.1910706, 1, 1, 1, 1, 1,
-0.5817935, -0.555483, -0.9572016, 1, 1, 1, 1, 1,
-0.5793413, 0.5207017, 0.3828656, 1, 1, 1, 1, 1,
-0.5782747, -1.682326, -2.267124, 1, 1, 1, 1, 1,
-0.5758271, -0.5521839, -1.379157, 1, 1, 1, 1, 1,
-0.5755551, 0.3217956, -0.1775201, 1, 1, 1, 1, 1,
-0.5669361, -0.763749, -2.762608, 1, 1, 1, 1, 1,
-0.5655672, 0.5966429, -1.213502, 1, 1, 1, 1, 1,
-0.563663, 0.5363982, -1.589089, 1, 1, 1, 1, 1,
-0.5605808, 0.3942168, 0.2360381, 1, 1, 1, 1, 1,
-0.5513991, -1.391111, -3.249724, 1, 1, 1, 1, 1,
-0.5502869, -0.2733189, -1.19267, 1, 1, 1, 1, 1,
-0.5426464, 1.292598, 0.2997267, 1, 1, 1, 1, 1,
-0.5405949, 1.004585, 0.8270034, 1, 1, 1, 1, 1,
-0.5398309, -0.3139395, -2.760172, 0, 0, 1, 1, 1,
-0.5353987, 0.6138481, -2.120493, 1, 0, 0, 1, 1,
-0.5206934, 0.647635, -1.219118, 1, 0, 0, 1, 1,
-0.5191979, -1.237952, -3.656369, 1, 0, 0, 1, 1,
-0.5157955, -0.6614949, -1.555848, 1, 0, 0, 1, 1,
-0.5119818, -1.081565, -2.12406, 1, 0, 0, 1, 1,
-0.5106332, 0.4633225, -1.189384, 0, 0, 0, 1, 1,
-0.5035076, 0.8675799, -1.473454, 0, 0, 0, 1, 1,
-0.5024257, -0.6444744, -1.436898, 0, 0, 0, 1, 1,
-0.4935974, -1.022202, -3.536899, 0, 0, 0, 1, 1,
-0.4929147, -0.7502838, -2.857944, 0, 0, 0, 1, 1,
-0.4926041, 0.542834, -1.278774, 0, 0, 0, 1, 1,
-0.4925888, -0.33773, -0.2159171, 0, 0, 0, 1, 1,
-0.4887723, -2.033151, -2.912605, 1, 1, 1, 1, 1,
-0.4856687, -0.3536306, -1.50079, 1, 1, 1, 1, 1,
-0.4855686, -0.1965165, -1.276345, 1, 1, 1, 1, 1,
-0.4852715, 0.9911714, 1.179605, 1, 1, 1, 1, 1,
-0.4797008, 0.9814543, -0.8653256, 1, 1, 1, 1, 1,
-0.4793494, -0.8410678, -2.162973, 1, 1, 1, 1, 1,
-0.4787698, -1.315257, -4.269242, 1, 1, 1, 1, 1,
-0.4785546, 0.3042521, -1.156625, 1, 1, 1, 1, 1,
-0.477804, -0.2042821, -3.645444, 1, 1, 1, 1, 1,
-0.4766539, -0.4057141, -1.958279, 1, 1, 1, 1, 1,
-0.4705368, 0.03436146, -2.562995, 1, 1, 1, 1, 1,
-0.4684702, 0.6667175, -0.978442, 1, 1, 1, 1, 1,
-0.4674156, 0.8723593, -0.08236449, 1, 1, 1, 1, 1,
-0.4661365, -0.5795214, -2.698818, 1, 1, 1, 1, 1,
-0.4660856, 0.1451703, -1.195581, 1, 1, 1, 1, 1,
-0.464647, 0.005376763, -1.702789, 0, 0, 1, 1, 1,
-0.46199, 0.492397, -1.348634, 1, 0, 0, 1, 1,
-0.4585508, 1.178755, -0.9939451, 1, 0, 0, 1, 1,
-0.4571184, -1.081143, -2.836207, 1, 0, 0, 1, 1,
-0.448656, -1.26176, -1.88394, 1, 0, 0, 1, 1,
-0.4463475, 1.2492, -0.4192117, 1, 0, 0, 1, 1,
-0.4440131, 0.05278131, 0.6209408, 0, 0, 0, 1, 1,
-0.4378741, -0.07280451, -1.972187, 0, 0, 0, 1, 1,
-0.4343775, 0.4947401, -1.557311, 0, 0, 0, 1, 1,
-0.4310517, 0.6401609, -1.10514, 0, 0, 0, 1, 1,
-0.4262983, -0.4453882, -2.256784, 0, 0, 0, 1, 1,
-0.4245897, 0.4162731, -1.781523, 0, 0, 0, 1, 1,
-0.4219953, 1.646806, 0.6958918, 0, 0, 0, 1, 1,
-0.4198673, -1.299341, -1.27474, 1, 1, 1, 1, 1,
-0.4153245, -0.7009091, -3.11873, 1, 1, 1, 1, 1,
-0.4141904, -0.7942676, -2.824342, 1, 1, 1, 1, 1,
-0.4140059, -0.3034578, -2.712223, 1, 1, 1, 1, 1,
-0.4125902, -0.03111786, -1.376042, 1, 1, 1, 1, 1,
-0.4092577, 0.4549828, -2.148526, 1, 1, 1, 1, 1,
-0.4089803, -0.05887016, -2.125116, 1, 1, 1, 1, 1,
-0.4079003, 1.717921, -0.7377727, 1, 1, 1, 1, 1,
-0.4021949, -0.655396, -1.305655, 1, 1, 1, 1, 1,
-0.3960143, -0.270154, -0.9334968, 1, 1, 1, 1, 1,
-0.394471, -2.772598, -2.711006, 1, 1, 1, 1, 1,
-0.390617, -0.04858131, -0.1725556, 1, 1, 1, 1, 1,
-0.3857425, -0.05215697, -3.207687, 1, 1, 1, 1, 1,
-0.3850816, -0.2499973, -1.340256, 1, 1, 1, 1, 1,
-0.3840689, 0.6013694, 0.08429048, 1, 1, 1, 1, 1,
-0.3826413, -0.7999083, -3.061532, 0, 0, 1, 1, 1,
-0.382616, -0.7326179, -2.601845, 1, 0, 0, 1, 1,
-0.3705544, 1.085605, -0.8024079, 1, 0, 0, 1, 1,
-0.3648971, 0.8355862, 2.016212, 1, 0, 0, 1, 1,
-0.3646956, 2.196524, -0.5779022, 1, 0, 0, 1, 1,
-0.3630994, 0.4925419, 1.793141, 1, 0, 0, 1, 1,
-0.3613853, -0.5593379, -1.984035, 0, 0, 0, 1, 1,
-0.3545818, 0.07573278, -1.006434, 0, 0, 0, 1, 1,
-0.3544346, -0.01112977, -1.505803, 0, 0, 0, 1, 1,
-0.3522352, -2.143197, -2.000299, 0, 0, 0, 1, 1,
-0.3512748, -0.07524547, -1.627998, 0, 0, 0, 1, 1,
-0.3512405, -1.125171, -4.62349, 0, 0, 0, 1, 1,
-0.3469524, -1.661859, -4.692079, 0, 0, 0, 1, 1,
-0.3458962, 0.3739316, -1.327381, 1, 1, 1, 1, 1,
-0.3456894, 0.5433051, -2.290247, 1, 1, 1, 1, 1,
-0.3450366, 0.1919892, -1.447769, 1, 1, 1, 1, 1,
-0.3367819, 0.3867675, -0.1722577, 1, 1, 1, 1, 1,
-0.3334854, -0.1987752, -0.7215264, 1, 1, 1, 1, 1,
-0.3326151, 1.044171, -1.35327, 1, 1, 1, 1, 1,
-0.3318884, 0.6507506, -1.444174, 1, 1, 1, 1, 1,
-0.3305936, 0.3821348, -1.196202, 1, 1, 1, 1, 1,
-0.3304668, -0.4640754, -2.373733, 1, 1, 1, 1, 1,
-0.3295948, -2.073745, -1.970654, 1, 1, 1, 1, 1,
-0.3292053, -0.2360025, -1.889807, 1, 1, 1, 1, 1,
-0.3232195, 1.057365, -1.324299, 1, 1, 1, 1, 1,
-0.3213197, -1.194741, -3.194894, 1, 1, 1, 1, 1,
-0.3204266, 1.158021, -0.9591873, 1, 1, 1, 1, 1,
-0.3203058, 0.8263745, 0.1753023, 1, 1, 1, 1, 1,
-0.3185574, -0.1896316, -3.987412, 0, 0, 1, 1, 1,
-0.3183715, 0.09315556, -1.845488, 1, 0, 0, 1, 1,
-0.3172812, -1.566678, -3.303678, 1, 0, 0, 1, 1,
-0.3126863, -0.5856366, -4.748701, 1, 0, 0, 1, 1,
-0.3125617, 0.430208, -1.62937, 1, 0, 0, 1, 1,
-0.3094008, 2.2185, 0.904811, 1, 0, 0, 1, 1,
-0.3072805, 1.921086, 0.9902972, 0, 0, 0, 1, 1,
-0.3042743, -0.5009597, -2.682881, 0, 0, 0, 1, 1,
-0.2994739, 0.8309558, 0.4853313, 0, 0, 0, 1, 1,
-0.2987277, 0.08743908, -1.688459, 0, 0, 0, 1, 1,
-0.2959421, -1.611259, -2.735783, 0, 0, 0, 1, 1,
-0.2937083, -0.9691858, -0.5784419, 0, 0, 0, 1, 1,
-0.2837643, 0.08963962, -0.7902516, 0, 0, 0, 1, 1,
-0.2804509, -1.649893, -3.53878, 1, 1, 1, 1, 1,
-0.2799396, 0.3010632, -1.903077, 1, 1, 1, 1, 1,
-0.2798874, 0.01629396, -0.8957688, 1, 1, 1, 1, 1,
-0.274214, 0.01812118, -0.6369929, 1, 1, 1, 1, 1,
-0.2731138, -1.357591, -4.441869, 1, 1, 1, 1, 1,
-0.2725786, 0.02539097, -1.932289, 1, 1, 1, 1, 1,
-0.2704203, -0.2453512, -3.048537, 1, 1, 1, 1, 1,
-0.2682499, -0.7329537, -2.303316, 1, 1, 1, 1, 1,
-0.2647707, 0.3684267, -0.7193415, 1, 1, 1, 1, 1,
-0.2643781, -0.5226424, -1.849794, 1, 1, 1, 1, 1,
-0.2605724, -0.4189678, -4.015596, 1, 1, 1, 1, 1,
-0.2604697, -1.618856, -3.567846, 1, 1, 1, 1, 1,
-0.2572812, -0.9997056, -3.771825, 1, 1, 1, 1, 1,
-0.2564167, -0.4358135, -3.351567, 1, 1, 1, 1, 1,
-0.2556675, 0.1326158, -0.1216533, 1, 1, 1, 1, 1,
-0.2513895, -1.083702, -2.878314, 0, 0, 1, 1, 1,
-0.2491793, -0.316257, -1.466163, 1, 0, 0, 1, 1,
-0.2481117, 2.496326, 0.9961224, 1, 0, 0, 1, 1,
-0.2377947, 0.4340064, 0.1530619, 1, 0, 0, 1, 1,
-0.2370785, -1.537542, -2.691462, 1, 0, 0, 1, 1,
-0.2362794, -0.38919, -3.61076, 1, 0, 0, 1, 1,
-0.2343487, 2.534258, -0.2539657, 0, 0, 0, 1, 1,
-0.2334401, 1.716977, -1.005146, 0, 0, 0, 1, 1,
-0.2327018, 0.05423415, -2.483162, 0, 0, 0, 1, 1,
-0.2284339, 0.6595218, -2.314161, 0, 0, 0, 1, 1,
-0.2278044, -0.314838, -3.854133, 0, 0, 0, 1, 1,
-0.226691, 1.433116, -2.111038, 0, 0, 0, 1, 1,
-0.221841, -2.03824, -2.093865, 0, 0, 0, 1, 1,
-0.2215205, -0.6694848, -2.225816, 1, 1, 1, 1, 1,
-0.2214866, -0.636002, -2.126018, 1, 1, 1, 1, 1,
-0.2198391, 0.5554255, 0.6598293, 1, 1, 1, 1, 1,
-0.2184077, -0.1042674, -1.945393, 1, 1, 1, 1, 1,
-0.2182194, -1.810383, -5.075272, 1, 1, 1, 1, 1,
-0.217855, -8.844127e-05, -0.6700323, 1, 1, 1, 1, 1,
-0.2127926, -0.8906925, -5.094449, 1, 1, 1, 1, 1,
-0.2109105, 1.347994, -0.1789188, 1, 1, 1, 1, 1,
-0.2038488, 0.908353, -1.506528, 1, 1, 1, 1, 1,
-0.2027335, -1.105713, -3.9938, 1, 1, 1, 1, 1,
-0.1971696, 0.4024412, -1.77773, 1, 1, 1, 1, 1,
-0.1970544, 0.160996, -2.813549, 1, 1, 1, 1, 1,
-0.1960246, 0.7327603, -0.2273979, 1, 1, 1, 1, 1,
-0.1935321, 1.482828, 0.2261588, 1, 1, 1, 1, 1,
-0.1931502, 0.2664492, -1.676071, 1, 1, 1, 1, 1,
-0.1927579, 1.751786, 0.8420853, 0, 0, 1, 1, 1,
-0.1916339, -0.7940068, -2.808762, 1, 0, 0, 1, 1,
-0.1887594, -1.470429, -3.855517, 1, 0, 0, 1, 1,
-0.185292, 1.9918, 1.378814, 1, 0, 0, 1, 1,
-0.1850712, 0.9382268, 1.207225, 1, 0, 0, 1, 1,
-0.184203, 0.1652337, 0.1219011, 1, 0, 0, 1, 1,
-0.1794728, -0.1959151, -2.846165, 0, 0, 0, 1, 1,
-0.1747737, 0.6310855, 1.986262, 0, 0, 0, 1, 1,
-0.1744417, 0.4947969, -0.2548828, 0, 0, 0, 1, 1,
-0.1735807, -0.09947844, -1.784425, 0, 0, 0, 1, 1,
-0.1688493, -0.2260876, -2.847567, 0, 0, 0, 1, 1,
-0.161198, 2.272105, -1.304229, 0, 0, 0, 1, 1,
-0.1570489, 0.7437899, -2.076776, 0, 0, 0, 1, 1,
-0.152158, 0.2077874, -1.492167, 1, 1, 1, 1, 1,
-0.1488699, -1.618954, -4.310803, 1, 1, 1, 1, 1,
-0.1433717, 0.9168093, -0.4389408, 1, 1, 1, 1, 1,
-0.1420486, 0.8144283, 0.8949729, 1, 1, 1, 1, 1,
-0.1374324, 0.1880536, -0.4146976, 1, 1, 1, 1, 1,
-0.1356055, 1.271442, -1.501478, 1, 1, 1, 1, 1,
-0.1355066, 0.3597442, 1.40122, 1, 1, 1, 1, 1,
-0.1319075, -1.572119, -3.233499, 1, 1, 1, 1, 1,
-0.1301023, -0.7150511, -4.169557, 1, 1, 1, 1, 1,
-0.1289252, 1.597691, -0.3599288, 1, 1, 1, 1, 1,
-0.1230233, 0.06330394, -2.17096, 1, 1, 1, 1, 1,
-0.1212563, -0.3882335, -2.839763, 1, 1, 1, 1, 1,
-0.1211676, -0.4096058, -2.14446, 1, 1, 1, 1, 1,
-0.1177795, 0.5767369, -0.4514065, 1, 1, 1, 1, 1,
-0.1175157, -1.054553, -2.432024, 1, 1, 1, 1, 1,
-0.1170627, 0.5006008, 0.3496605, 0, 0, 1, 1, 1,
-0.1161883, -1.802026, -4.219933, 1, 0, 0, 1, 1,
-0.1158975, -0.7204812, -2.995561, 1, 0, 0, 1, 1,
-0.1103436, 1.512271, -2.067948, 1, 0, 0, 1, 1,
-0.1091172, -0.9522507, -3.362834, 1, 0, 0, 1, 1,
-0.1087251, 0.4344908, -2.106967, 1, 0, 0, 1, 1,
-0.1044793, -0.343397, -5.209885, 0, 0, 0, 1, 1,
-0.1014042, -0.9567773, -2.584801, 0, 0, 0, 1, 1,
-0.1006952, 0.1481013, 0.9925274, 0, 0, 0, 1, 1,
-0.1002806, 0.1126108, -1.949343, 0, 0, 0, 1, 1,
-0.09312353, 1.065304, -1.5701, 0, 0, 0, 1, 1,
-0.09253602, -1.28436, -3.194011, 0, 0, 0, 1, 1,
-0.08964837, -0.01151946, -2.578876, 0, 0, 0, 1, 1,
-0.08246105, -0.7096114, -2.925384, 1, 1, 1, 1, 1,
-0.08230684, 0.04352309, -1.021657, 1, 1, 1, 1, 1,
-0.0801276, -0.2071326, -1.961978, 1, 1, 1, 1, 1,
-0.08006964, -0.1087046, -2.814334, 1, 1, 1, 1, 1,
-0.07107855, 2.302879, 0.6607728, 1, 1, 1, 1, 1,
-0.06938145, -0.4589284, -4.379364, 1, 1, 1, 1, 1,
-0.06077872, -0.3812774, -5.423744, 1, 1, 1, 1, 1,
-0.05994857, -0.5549673, -4.555237, 1, 1, 1, 1, 1,
-0.05960999, -1.313398, -3.842307, 1, 1, 1, 1, 1,
-0.0500481, -0.4451185, -4.39442, 1, 1, 1, 1, 1,
-0.04865643, 0.243582, -0.1622878, 1, 1, 1, 1, 1,
-0.04445462, 1.11417, -1.276673, 1, 1, 1, 1, 1,
-0.04054168, 0.443496, 0.3223321, 1, 1, 1, 1, 1,
-0.04048058, -0.5087647, -3.625615, 1, 1, 1, 1, 1,
-0.03353154, 0.1614888, 0.7631784, 1, 1, 1, 1, 1,
-0.0316157, 1.467038, 0.6042552, 0, 0, 1, 1, 1,
-0.0312707, 1.021369, -0.779307, 1, 0, 0, 1, 1,
-0.02740778, -0.3515791, -4.332143, 1, 0, 0, 1, 1,
-0.0254158, -0.7278023, -4.408286, 1, 0, 0, 1, 1,
-0.02417448, 0.7695836, -0.7623829, 1, 0, 0, 1, 1,
-0.0226331, -1.03491, -3.335387, 1, 0, 0, 1, 1,
-0.02011762, -0.8025315, -3.28224, 0, 0, 0, 1, 1,
-0.01800761, -1.681165, -2.73762, 0, 0, 0, 1, 1,
-0.01772491, -0.1194295, -4.091821, 0, 0, 0, 1, 1,
-0.01521909, 0.3128518, 1.647384, 0, 0, 0, 1, 1,
-0.0122331, 0.4874403, 1.373416, 0, 0, 0, 1, 1,
-0.01097988, 0.5599429, 0.3359101, 0, 0, 0, 1, 1,
-0.008999355, 0.4014372, 0.6957691, 0, 0, 0, 1, 1,
-0.002731741, -1.723328, -3.745432, 1, 1, 1, 1, 1,
-0.001063117, 1.184896, 0.3618893, 1, 1, 1, 1, 1,
-0.0003270363, -0.145116, -2.902509, 1, 1, 1, 1, 1,
0.001717878, -0.312812, 3.572691, 1, 1, 1, 1, 1,
0.001767161, 0.7614539, 0.5011709, 1, 1, 1, 1, 1,
0.002605681, -0.1637169, 0.8184175, 1, 1, 1, 1, 1,
0.004321248, -0.3638745, 1.687843, 1, 1, 1, 1, 1,
0.004336662, -1.323878, 2.717031, 1, 1, 1, 1, 1,
0.005705039, -0.3118515, 2.843428, 1, 1, 1, 1, 1,
0.006071466, -0.8141341, 5.009314, 1, 1, 1, 1, 1,
0.006702117, -0.1778906, 3.630646, 1, 1, 1, 1, 1,
0.008925747, -0.2874303, 3.549852, 1, 1, 1, 1, 1,
0.009936467, -0.9190913, 4.222513, 1, 1, 1, 1, 1,
0.0144121, -0.07679714, 3.660716, 1, 1, 1, 1, 1,
0.01530599, 1.229953, 0.5048508, 1, 1, 1, 1, 1,
0.01549948, -1.069796, 1.910665, 0, 0, 1, 1, 1,
0.017837, 0.2439616, 0.5606625, 1, 0, 0, 1, 1,
0.01844909, -1.159651, 2.23114, 1, 0, 0, 1, 1,
0.02546962, 0.942889, -0.7299677, 1, 0, 0, 1, 1,
0.02979137, -0.1365994, 3.651061, 1, 0, 0, 1, 1,
0.03082773, 0.5551533, 0.5987248, 1, 0, 0, 1, 1,
0.03191777, -0.166739, 2.705417, 0, 0, 0, 1, 1,
0.03200267, 0.6862608, 0.1735216, 0, 0, 0, 1, 1,
0.03415284, 0.08495326, 1.002947, 0, 0, 0, 1, 1,
0.03670095, 0.155035, -0.1184362, 0, 0, 0, 1, 1,
0.03798911, 0.349081, 1.099903, 0, 0, 0, 1, 1,
0.03947097, 0.8968706, 0.1187297, 0, 0, 0, 1, 1,
0.04705168, 0.7402104, -0.2569325, 0, 0, 0, 1, 1,
0.04708394, 0.7530445, -0.4878827, 1, 1, 1, 1, 1,
0.04798324, -0.5922167, 5.089512, 1, 1, 1, 1, 1,
0.05097161, -0.1246312, 3.122337, 1, 1, 1, 1, 1,
0.05252462, -0.437639, 3.866762, 1, 1, 1, 1, 1,
0.05255896, 0.5537314, -1.204488, 1, 1, 1, 1, 1,
0.05356972, 0.01516035, 1.580636, 1, 1, 1, 1, 1,
0.05689342, -0.4145197, 0.6313046, 1, 1, 1, 1, 1,
0.0612189, -0.7158557, 2.453432, 1, 1, 1, 1, 1,
0.06349128, -0.02516518, 0.06931769, 1, 1, 1, 1, 1,
0.06916594, 0.2725553, -0.332283, 1, 1, 1, 1, 1,
0.07286739, 2.236565, 0.5210458, 1, 1, 1, 1, 1,
0.07591555, 0.7246253, 0.5852588, 1, 1, 1, 1, 1,
0.07630929, 0.2938069, 2.15385, 1, 1, 1, 1, 1,
0.08442644, 1.033987, 0.7436663, 1, 1, 1, 1, 1,
0.09363703, -0.660489, 4.593179, 1, 1, 1, 1, 1,
0.09429428, 0.5469609, 0.1939786, 0, 0, 1, 1, 1,
0.09603039, -0.03674129, 2.588111, 1, 0, 0, 1, 1,
0.09859042, -0.08315432, 2.964394, 1, 0, 0, 1, 1,
0.1016124, -0.8360329, 2.72663, 1, 0, 0, 1, 1,
0.1024974, 0.8366872, -0.2970749, 1, 0, 0, 1, 1,
0.1027328, 1.000514, -1.586961, 1, 0, 0, 1, 1,
0.1101533, -0.1183271, 2.623084, 0, 0, 0, 1, 1,
0.1116899, -0.2067192, 1.757662, 0, 0, 0, 1, 1,
0.1170822, 0.06355993, 0.5630612, 0, 0, 0, 1, 1,
0.1249898, 0.5548257, -0.1672186, 0, 0, 0, 1, 1,
0.1265859, -2.450766, 3.951838, 0, 0, 0, 1, 1,
0.1354309, -1.296679, 2.85352, 0, 0, 0, 1, 1,
0.1372673, 0.4956633, 0.2985112, 0, 0, 0, 1, 1,
0.1485963, -0.3422793, 2.798886, 1, 1, 1, 1, 1,
0.1523531, -1.688009, 5.48597, 1, 1, 1, 1, 1,
0.1551195, 1.353024, 1.824486, 1, 1, 1, 1, 1,
0.1583396, -0.6534476, 4.303412, 1, 1, 1, 1, 1,
0.1650804, -1.252012, 5.44007, 1, 1, 1, 1, 1,
0.1665111, -0.1493697, 2.536087, 1, 1, 1, 1, 1,
0.1666628, -1.994337, 2.197524, 1, 1, 1, 1, 1,
0.1692692, 0.5936089, 1.091697, 1, 1, 1, 1, 1,
0.1718945, -0.842676, 4.063202, 1, 1, 1, 1, 1,
0.1767594, -0.6866198, 3.200365, 1, 1, 1, 1, 1,
0.1779987, 0.1046149, 1.673676, 1, 1, 1, 1, 1,
0.1804148, 0.8634354, -0.7978129, 1, 1, 1, 1, 1,
0.1815626, -0.5550414, 1.635967, 1, 1, 1, 1, 1,
0.186152, -1.731615, 2.823838, 1, 1, 1, 1, 1,
0.1865809, -1.960452, 1.492115, 1, 1, 1, 1, 1,
0.1887585, 0.3793256, 0.9558147, 0, 0, 1, 1, 1,
0.1907756, -0.2867721, 2.574338, 1, 0, 0, 1, 1,
0.1932758, 0.1648852, 1.015604, 1, 0, 0, 1, 1,
0.1951475, 1.06815, -0.0214852, 1, 0, 0, 1, 1,
0.2006756, 0.07492354, 1.819922, 1, 0, 0, 1, 1,
0.2017598, 0.5388475, -0.3060887, 1, 0, 0, 1, 1,
0.2032787, 0.5479345, 1.622302, 0, 0, 0, 1, 1,
0.2034422, -0.8423582, 1.911803, 0, 0, 0, 1, 1,
0.2096882, -0.2846627, 1.605486, 0, 0, 0, 1, 1,
0.2097759, -1.120963, 4.480126, 0, 0, 0, 1, 1,
0.2126038, 0.3539212, 0.2368749, 0, 0, 0, 1, 1,
0.2156661, 1.294197, -1.271538, 0, 0, 0, 1, 1,
0.2168824, 1.654805, -1.072566, 0, 0, 0, 1, 1,
0.2191336, -0.5324442, 2.53762, 1, 1, 1, 1, 1,
0.2193452, -0.4850978, 3.095413, 1, 1, 1, 1, 1,
0.2203056, -0.1646245, 0.5157524, 1, 1, 1, 1, 1,
0.2249708, -0.403537, 2.912997, 1, 1, 1, 1, 1,
0.2262731, 0.7297703, 0.5193716, 1, 1, 1, 1, 1,
0.2266827, -0.7924486, 2.267013, 1, 1, 1, 1, 1,
0.2285411, -0.3008918, 3.62607, 1, 1, 1, 1, 1,
0.232353, -0.0582363, 1.787328, 1, 1, 1, 1, 1,
0.2342116, -0.801035, 1.264291, 1, 1, 1, 1, 1,
0.2342923, -0.1948452, 0.5458506, 1, 1, 1, 1, 1,
0.2353899, 0.1688297, 0.11797, 1, 1, 1, 1, 1,
0.2372794, 0.3584779, 0.1319385, 1, 1, 1, 1, 1,
0.2397542, -1.618624, 2.628222, 1, 1, 1, 1, 1,
0.2403611, 1.086039, -1.651884, 1, 1, 1, 1, 1,
0.2452478, 0.2382893, 0.2890188, 1, 1, 1, 1, 1,
0.2501139, 0.6815519, 0.3426325, 0, 0, 1, 1, 1,
0.2561105, -0.9656533, 2.841932, 1, 0, 0, 1, 1,
0.2568227, 1.657939, 0.1933609, 1, 0, 0, 1, 1,
0.25724, 0.6439979, -0.06626482, 1, 0, 0, 1, 1,
0.2619644, 0.3741239, -0.2453988, 1, 0, 0, 1, 1,
0.2653057, -0.7116885, 1.031388, 1, 0, 0, 1, 1,
0.2661663, -1.071904, 2.882115, 0, 0, 0, 1, 1,
0.2700582, -1.750811, 2.149724, 0, 0, 0, 1, 1,
0.2781147, 3.024962, 0.7090066, 0, 0, 0, 1, 1,
0.2803846, -0.6776242, 2.812867, 0, 0, 0, 1, 1,
0.2817737, 0.8656465, -0.7967601, 0, 0, 0, 1, 1,
0.2875356, -0.3424791, 2.435889, 0, 0, 0, 1, 1,
0.2879398, -1.59921, 2.131676, 0, 0, 0, 1, 1,
0.2903331, -2.608935, 3.8212, 1, 1, 1, 1, 1,
0.2910652, -0.8543207, 2.49005, 1, 1, 1, 1, 1,
0.2911304, -1.058253, 3.149056, 1, 1, 1, 1, 1,
0.3013982, -1.686045, 3.623192, 1, 1, 1, 1, 1,
0.3038342, 1.555061, -0.4023438, 1, 1, 1, 1, 1,
0.3073419, -0.539038, 2.007047, 1, 1, 1, 1, 1,
0.3089109, 0.8133024, 1.686751, 1, 1, 1, 1, 1,
0.3119286, 0.4245259, 1.361025, 1, 1, 1, 1, 1,
0.3119543, 0.7746159, 0.4272099, 1, 1, 1, 1, 1,
0.3130922, -0.6706323, 1.94397, 1, 1, 1, 1, 1,
0.3272879, -0.4315726, 1.850613, 1, 1, 1, 1, 1,
0.327583, 0.9163979, 1.746515, 1, 1, 1, 1, 1,
0.3288569, 1.377682, 1.990342, 1, 1, 1, 1, 1,
0.3306058, 0.07752889, 1.544519, 1, 1, 1, 1, 1,
0.3365198, 0.5980111, 3.414651, 1, 1, 1, 1, 1,
0.343356, -0.6566584, 2.964819, 0, 0, 1, 1, 1,
0.3479185, -1.123667, 4.393886, 1, 0, 0, 1, 1,
0.3496113, -1.467695, 2.555853, 1, 0, 0, 1, 1,
0.3515471, -0.2054644, 2.372816, 1, 0, 0, 1, 1,
0.35259, 1.845323, -1.726848, 1, 0, 0, 1, 1,
0.3547031, 0.2421195, 1.597737, 1, 0, 0, 1, 1,
0.3633652, -0.4480435, 0.04991937, 0, 0, 0, 1, 1,
0.3659661, -0.7157149, 2.087307, 0, 0, 0, 1, 1,
0.369627, 1.651921, -0.1454261, 0, 0, 0, 1, 1,
0.3704405, -1.26506, 3.385267, 0, 0, 0, 1, 1,
0.3767607, 1.719006, 1.317936, 0, 0, 0, 1, 1,
0.3835453, 0.7855884, -1.042715, 0, 0, 0, 1, 1,
0.3866104, 0.362616, -0.06379005, 0, 0, 0, 1, 1,
0.3892278, 0.2498269, -0.3334632, 1, 1, 1, 1, 1,
0.3894182, -0.06015744, 2.80829, 1, 1, 1, 1, 1,
0.3902492, -0.5226231, 1.373496, 1, 1, 1, 1, 1,
0.3919264, 0.9986814, 1.61132, 1, 1, 1, 1, 1,
0.3921744, 0.8132104, 3.49095, 1, 1, 1, 1, 1,
0.3948891, -2.003004, 3.903741, 1, 1, 1, 1, 1,
0.3961199, 0.3129944, 1.92756, 1, 1, 1, 1, 1,
0.3962796, -0.1380953, 0.3026909, 1, 1, 1, 1, 1,
0.4020829, -0.7648289, 4.749307, 1, 1, 1, 1, 1,
0.4099725, 1.834524, -0.04515966, 1, 1, 1, 1, 1,
0.4104223, -0.6271269, 3.111586, 1, 1, 1, 1, 1,
0.4109617, -0.6136652, 2.567982, 1, 1, 1, 1, 1,
0.4114373, 0.164548, 0.2811413, 1, 1, 1, 1, 1,
0.4154664, -0.1715841, 0.06275724, 1, 1, 1, 1, 1,
0.4217028, -0.2680453, 1.991726, 1, 1, 1, 1, 1,
0.4225029, -0.8198723, 2.379016, 0, 0, 1, 1, 1,
0.4246264, -0.2335483, 2.219823, 1, 0, 0, 1, 1,
0.4249141, 0.6892648, 0.6630414, 1, 0, 0, 1, 1,
0.4278483, -1.616307, 1.871225, 1, 0, 0, 1, 1,
0.4296778, 0.2069717, 1.775154, 1, 0, 0, 1, 1,
0.4300919, -0.4693517, 2.095903, 1, 0, 0, 1, 1,
0.4324384, -0.15127, 1.436984, 0, 0, 0, 1, 1,
0.4377638, -1.517879, 2.11326, 0, 0, 0, 1, 1,
0.4403929, -0.5960231, 3.761045, 0, 0, 0, 1, 1,
0.4415442, -0.00704179, 0.6709421, 0, 0, 0, 1, 1,
0.4418665, -0.661386, 3.746728, 0, 0, 0, 1, 1,
0.4448781, 0.5265397, 0.6148831, 0, 0, 0, 1, 1,
0.4498152, 1.052129, 1.430726, 0, 0, 0, 1, 1,
0.451624, -0.8063313, 4.591828, 1, 1, 1, 1, 1,
0.4547147, -0.08067971, 4.117977, 1, 1, 1, 1, 1,
0.4548253, 0.6460473, 0.8240524, 1, 1, 1, 1, 1,
0.4582399, 1.164611, 0.2576212, 1, 1, 1, 1, 1,
0.4646562, -0.3270763, 2.79966, 1, 1, 1, 1, 1,
0.4670613, -0.5666804, 2.444159, 1, 1, 1, 1, 1,
0.4700196, 0.3441914, 0.9644986, 1, 1, 1, 1, 1,
0.4715832, 1.03475, -0.2426221, 1, 1, 1, 1, 1,
0.4716983, -1.244211, 4.104362, 1, 1, 1, 1, 1,
0.4720053, 0.1243953, 1.989735, 1, 1, 1, 1, 1,
0.4729096, 0.03728157, 2.481432, 1, 1, 1, 1, 1,
0.4799557, 0.4288169, 1.807206, 1, 1, 1, 1, 1,
0.4808161, 0.690258, -0.07181593, 1, 1, 1, 1, 1,
0.4819947, -0.8690405, 3.891351, 1, 1, 1, 1, 1,
0.4862104, 0.6489948, -0.6113444, 1, 1, 1, 1, 1,
0.4868841, -0.336648, 3.44538, 0, 0, 1, 1, 1,
0.4875319, 1.308249, 0.1871485, 1, 0, 0, 1, 1,
0.488492, 1.943978, 2.216622, 1, 0, 0, 1, 1,
0.4897556, -0.8508103, 2.398603, 1, 0, 0, 1, 1,
0.4992455, -0.4704565, 3.663797, 1, 0, 0, 1, 1,
0.5077544, 1.059545, 1.399425, 1, 0, 0, 1, 1,
0.5142221, 0.02865091, 0.7552376, 0, 0, 0, 1, 1,
0.5151796, 1.926085, -0.3886493, 0, 0, 0, 1, 1,
0.5154309, -0.1099851, 1.055613, 0, 0, 0, 1, 1,
0.5248746, 0.2105049, 2.084661, 0, 0, 0, 1, 1,
0.5278998, 0.987559, -0.4327573, 0, 0, 0, 1, 1,
0.5281177, 0.9049807, 0.4904248, 0, 0, 0, 1, 1,
0.5299692, -1.426384, 2.853859, 0, 0, 0, 1, 1,
0.5304891, -1.452662, 2.444782, 1, 1, 1, 1, 1,
0.535641, -1.365098, 1.400841, 1, 1, 1, 1, 1,
0.5423647, 1.087918, -1.078032, 1, 1, 1, 1, 1,
0.5436769, 1.238091, 1.149644, 1, 1, 1, 1, 1,
0.5444747, 0.70746, 2.351245, 1, 1, 1, 1, 1,
0.5457458, 0.2657204, -0.4943937, 1, 1, 1, 1, 1,
0.5476666, -0.5707792, 1.317518, 1, 1, 1, 1, 1,
0.5479243, 0.7810994, 0.8123678, 1, 1, 1, 1, 1,
0.5485792, -1.258871, 3.266619, 1, 1, 1, 1, 1,
0.5486355, 1.361224, 1.042762, 1, 1, 1, 1, 1,
0.5503318, -0.3367318, -1.084357, 1, 1, 1, 1, 1,
0.5525247, -0.09396037, 2.18773, 1, 1, 1, 1, 1,
0.5533284, 0.2338358, 1.486023, 1, 1, 1, 1, 1,
0.5541297, 0.203266, -0.7626155, 1, 1, 1, 1, 1,
0.5593406, -1.444688, 2.427809, 1, 1, 1, 1, 1,
0.5650002, -1.075576, 3.068106, 0, 0, 1, 1, 1,
0.5696379, -1.451647, 1.062412, 1, 0, 0, 1, 1,
0.570287, -0.1347142, 1.712153, 1, 0, 0, 1, 1,
0.5711095, -0.5399679, 2.009218, 1, 0, 0, 1, 1,
0.5746776, 1.974285, 0.3947117, 1, 0, 0, 1, 1,
0.5752316, -0.1256857, 0.8503878, 1, 0, 0, 1, 1,
0.5762532, -0.5716496, 3.041769, 0, 0, 0, 1, 1,
0.5780193, 0.1555119, -0.1350569, 0, 0, 0, 1, 1,
0.5799563, 0.1870811, 2.475823, 0, 0, 0, 1, 1,
0.5803189, 0.1236205, 0.01258956, 0, 0, 0, 1, 1,
0.5816527, -1.05392, 1.61309, 0, 0, 0, 1, 1,
0.5821862, 0.9257184, 0.2128317, 0, 0, 0, 1, 1,
0.5858243, -2.038255, 1.550635, 0, 0, 0, 1, 1,
0.5869198, -0.1568673, 1.798607, 1, 1, 1, 1, 1,
0.5890706, 0.1782237, 1.730648, 1, 1, 1, 1, 1,
0.5915473, -0.7362313, 4.088069, 1, 1, 1, 1, 1,
0.600819, 1.065033, 0.2091992, 1, 1, 1, 1, 1,
0.606578, -0.6979824, 1.390775, 1, 1, 1, 1, 1,
0.6082016, -1.281638, 3.021303, 1, 1, 1, 1, 1,
0.6089045, -0.8798236, 1.996664, 1, 1, 1, 1, 1,
0.610835, 0.2285406, 0.3474191, 1, 1, 1, 1, 1,
0.6140876, 0.9154406, 1.576557, 1, 1, 1, 1, 1,
0.6149397, 2.381134, -0.02091749, 1, 1, 1, 1, 1,
0.6182641, 0.4506061, 1.804054, 1, 1, 1, 1, 1,
0.6193614, -0.8704723, 1.640176, 1, 1, 1, 1, 1,
0.6251097, -2.032731, 3.382223, 1, 1, 1, 1, 1,
0.6251782, 0.6724059, 0.9680083, 1, 1, 1, 1, 1,
0.6282547, -1.854435, 2.026915, 1, 1, 1, 1, 1,
0.6342236, 0.6139713, -0.2020198, 0, 0, 1, 1, 1,
0.6422684, 0.2104989, 1.491659, 1, 0, 0, 1, 1,
0.643779, -0.5530341, 0.8129596, 1, 0, 0, 1, 1,
0.6459524, -0.3019802, 2.826071, 1, 0, 0, 1, 1,
0.6472449, -0.272737, 1.69348, 1, 0, 0, 1, 1,
0.6518054, 0.8858189, 2.187955, 1, 0, 0, 1, 1,
0.6549389, 0.8021195, 1.573704, 0, 0, 0, 1, 1,
0.6551276, -1.715282, 2.104398, 0, 0, 0, 1, 1,
0.6556582, -0.3288192, 2.470482, 0, 0, 0, 1, 1,
0.6561939, 1.638271, -0.8037106, 0, 0, 0, 1, 1,
0.665047, 1.058362, 1.584909, 0, 0, 0, 1, 1,
0.669329, 0.3789717, 0.8359318, 0, 0, 0, 1, 1,
0.6705212, 0.77511, -0.927255, 0, 0, 0, 1, 1,
0.6743804, -0.8962668, 3.318614, 1, 1, 1, 1, 1,
0.6813853, -0.6626691, 2.395737, 1, 1, 1, 1, 1,
0.7015446, 0.03403885, 1.91124, 1, 1, 1, 1, 1,
0.704473, 0.08532599, 2.093949, 1, 1, 1, 1, 1,
0.7067201, -2.271417, 2.382478, 1, 1, 1, 1, 1,
0.7073465, -0.6375285, 1.068586, 1, 1, 1, 1, 1,
0.70748, -0.3064935, 2.483413, 1, 1, 1, 1, 1,
0.7100169, 0.9166071, 1.464215, 1, 1, 1, 1, 1,
0.7117488, 0.2356281, -0.03399875, 1, 1, 1, 1, 1,
0.7273297, 1.689789, -0.4737071, 1, 1, 1, 1, 1,
0.7276417, 0.3239384, 0.1208259, 1, 1, 1, 1, 1,
0.7307646, 0.7603087, 1.063266, 1, 1, 1, 1, 1,
0.7328209, -2.126449, 3.460431, 1, 1, 1, 1, 1,
0.7386147, -0.5733134, 2.072394, 1, 1, 1, 1, 1,
0.7468366, 0.8504934, 0.9478922, 1, 1, 1, 1, 1,
0.7514684, -0.6994513, -0.7554837, 0, 0, 1, 1, 1,
0.7518601, 0.4598372, -0.2114735, 1, 0, 0, 1, 1,
0.7531297, 0.283477, 0.0284226, 1, 0, 0, 1, 1,
0.7531614, -0.9409572, 2.243903, 1, 0, 0, 1, 1,
0.7613804, -0.3183221, 3.75176, 1, 0, 0, 1, 1,
0.7621521, -0.2044911, 2.222818, 1, 0, 0, 1, 1,
0.7621529, -0.7064804, 1.278637, 0, 0, 0, 1, 1,
0.7631301, -1.867837, 3.127098, 0, 0, 0, 1, 1,
0.7635458, -0.5624061, 1.866241, 0, 0, 0, 1, 1,
0.7638502, -1.172367, 4.276333, 0, 0, 0, 1, 1,
0.7652031, 0.3394842, 1.437123, 0, 0, 0, 1, 1,
0.7720124, 0.1458772, 1.763458, 0, 0, 0, 1, 1,
0.7726122, -0.5098581, 3.114564, 0, 0, 0, 1, 1,
0.7732391, 0.4771467, 0.1113172, 1, 1, 1, 1, 1,
0.7742687, -0.6093169, 2.112685, 1, 1, 1, 1, 1,
0.7756065, 0.486716, 1.743822, 1, 1, 1, 1, 1,
0.775676, 1.484627, -0.3826652, 1, 1, 1, 1, 1,
0.7805369, -2.264908, 0.7481433, 1, 1, 1, 1, 1,
0.784201, 0.7313798, 1.189444, 1, 1, 1, 1, 1,
0.7936765, 0.4933466, 1.092206, 1, 1, 1, 1, 1,
0.8004781, 0.2946141, 0.7706751, 1, 1, 1, 1, 1,
0.8025982, -0.2530979, 2.759747, 1, 1, 1, 1, 1,
0.8039012, -2.445452, 2.451757, 1, 1, 1, 1, 1,
0.8046125, 1.220731, 1.077645, 1, 1, 1, 1, 1,
0.810769, 0.05810658, 1.531933, 1, 1, 1, 1, 1,
0.8108786, -0.1107757, 0.776121, 1, 1, 1, 1, 1,
0.8140319, -1.136423, 2.7756, 1, 1, 1, 1, 1,
0.8159736, -0.00292063, 2.463168, 1, 1, 1, 1, 1,
0.816459, -0.08149421, 0.3947316, 0, 0, 1, 1, 1,
0.8200506, -0.6363447, 1.93443, 1, 0, 0, 1, 1,
0.8343208, 0.1611464, 1.242379, 1, 0, 0, 1, 1,
0.8462594, 0.9695159, 2.013731, 1, 0, 0, 1, 1,
0.8484579, 1.958258, -2.179976, 1, 0, 0, 1, 1,
0.8508579, 0.9029122, 1.120866, 1, 0, 0, 1, 1,
0.8509262, 1.400965, 1.600138, 0, 0, 0, 1, 1,
0.8528252, 1.382477, 0.8321769, 0, 0, 0, 1, 1,
0.8543168, 0.5617338, 1.489873, 0, 0, 0, 1, 1,
0.8546779, -2.239076, 2.702285, 0, 0, 0, 1, 1,
0.8621466, -1.175333, 3.283206, 0, 0, 0, 1, 1,
0.8631569, -0.8336869, 0.9936771, 0, 0, 0, 1, 1,
0.8773627, -1.59829, 2.105596, 0, 0, 0, 1, 1,
0.8785234, 1.143546, -0.2551817, 1, 1, 1, 1, 1,
0.8786672, 1.691082, 0.2050914, 1, 1, 1, 1, 1,
0.8821729, 0.1996959, 2.148965, 1, 1, 1, 1, 1,
0.8840164, 1.350919, -1.555254, 1, 1, 1, 1, 1,
0.8955343, -1.029025, 2.949248, 1, 1, 1, 1, 1,
0.8994467, -1.417719, 1.92541, 1, 1, 1, 1, 1,
0.9025962, 0.9743797, 1.814721, 1, 1, 1, 1, 1,
0.9027284, -1.651475, 1.492254, 1, 1, 1, 1, 1,
0.9044756, 0.6189616, 1.475731, 1, 1, 1, 1, 1,
0.9076365, -1.204296, 2.603027, 1, 1, 1, 1, 1,
0.909122, -0.8589795, 3.799104, 1, 1, 1, 1, 1,
0.912492, 0.8277832, 0.437052, 1, 1, 1, 1, 1,
0.9149536, -2.611847, 2.568651, 1, 1, 1, 1, 1,
0.916849, -0.2580055, 3.328384, 1, 1, 1, 1, 1,
0.922471, -1.535044, 2.566633, 1, 1, 1, 1, 1,
0.9243963, -0.9158443, 1.942128, 0, 0, 1, 1, 1,
0.9273032, -0.09906351, 2.847666, 1, 0, 0, 1, 1,
0.9284648, -0.4642941, 2.639961, 1, 0, 0, 1, 1,
0.9351704, 1.406603, -0.149211, 1, 0, 0, 1, 1,
0.937076, -0.7294336, 1.004584, 1, 0, 0, 1, 1,
0.9420819, -0.1945018, 0.8207979, 1, 0, 0, 1, 1,
0.9500933, 0.8581362, -0.07075692, 0, 0, 0, 1, 1,
0.9501818, 2.267967, -0.3071055, 0, 0, 0, 1, 1,
0.9517362, -0.9261203, 3.047694, 0, 0, 0, 1, 1,
0.9559331, 0.9257015, -1.140636, 0, 0, 0, 1, 1,
0.956354, -1.240768, 3.279416, 0, 0, 0, 1, 1,
0.9564121, -0.1229219, 2.30084, 0, 0, 0, 1, 1,
0.9572002, 0.4505209, 0.5602162, 0, 0, 0, 1, 1,
0.9572824, 1.732483, 0.367629, 1, 1, 1, 1, 1,
0.9623287, -1.893291, 4.41747, 1, 1, 1, 1, 1,
0.9677553, 1.448155, 0.9345169, 1, 1, 1, 1, 1,
0.9895404, -0.4810896, 2.57384, 1, 1, 1, 1, 1,
0.9947641, -0.2752775, 1.761707, 1, 1, 1, 1, 1,
1.002032, -0.7642404, 1.741175, 1, 1, 1, 1, 1,
1.008997, 1.977666, 0.9878826, 1, 1, 1, 1, 1,
1.00938, -1.012698, 1.487067, 1, 1, 1, 1, 1,
1.009655, -0.6498153, 1.856503, 1, 1, 1, 1, 1,
1.010596, 0.7697751, -0.457478, 1, 1, 1, 1, 1,
1.024318, -0.9644836, 3.615452, 1, 1, 1, 1, 1,
1.027742, 0.7846885, 2.139434, 1, 1, 1, 1, 1,
1.035967, 0.3061635, 1.332184, 1, 1, 1, 1, 1,
1.037071, -0.2861975, 2.642299, 1, 1, 1, 1, 1,
1.038913, 0.6841903, 0.1252393, 1, 1, 1, 1, 1,
1.047153, 0.4941811, 1.764403, 0, 0, 1, 1, 1,
1.04918, -0.1438683, 2.862909, 1, 0, 0, 1, 1,
1.049943, 0.4417773, 0.2894606, 1, 0, 0, 1, 1,
1.050424, 1.166851, 1.252943, 1, 0, 0, 1, 1,
1.056173, -0.7144615, 3.128227, 1, 0, 0, 1, 1,
1.059094, 1.259218, 0.6395528, 1, 0, 0, 1, 1,
1.062589, 0.06967574, 1.249358, 0, 0, 0, 1, 1,
1.064408, 2.019724, 2.525594, 0, 0, 0, 1, 1,
1.06895, -0.105853, 2.151153, 0, 0, 0, 1, 1,
1.070434, -0.1220768, 0.9596989, 0, 0, 0, 1, 1,
1.077716, -0.09293242, 3.776708, 0, 0, 0, 1, 1,
1.0809, 0.7475532, -0.0304991, 0, 0, 0, 1, 1,
1.081012, -1.906717, 3.565879, 0, 0, 0, 1, 1,
1.092799, -0.3587936, 1.861446, 1, 1, 1, 1, 1,
1.095787, -0.4045159, 2.138098, 1, 1, 1, 1, 1,
1.098601, -0.2290122, 2.922076, 1, 1, 1, 1, 1,
1.106265, 0.2354365, -0.1370678, 1, 1, 1, 1, 1,
1.10815, -0.6458155, 2.922496, 1, 1, 1, 1, 1,
1.116351, -1.523866, 3.808654, 1, 1, 1, 1, 1,
1.121954, 0.9120128, 0.1117596, 1, 1, 1, 1, 1,
1.124595, 1.026542, 0.03818457, 1, 1, 1, 1, 1,
1.129103, 0.1665466, 1.618703, 1, 1, 1, 1, 1,
1.140995, 1.180052, -0.4612827, 1, 1, 1, 1, 1,
1.141864, -0.1566859, 2.20333, 1, 1, 1, 1, 1,
1.154124, -0.6108657, 3.297244, 1, 1, 1, 1, 1,
1.155254, 0.3583637, 2.37774, 1, 1, 1, 1, 1,
1.156237, -0.05709493, 1.33244, 1, 1, 1, 1, 1,
1.156861, 0.04557563, -0.239609, 1, 1, 1, 1, 1,
1.162457, -0.086094, 2.139465, 0, 0, 1, 1, 1,
1.173873, -0.5163741, 1.332715, 1, 0, 0, 1, 1,
1.183621, 0.7206069, 1.505937, 1, 0, 0, 1, 1,
1.196773, 1.136575, 1.023784, 1, 0, 0, 1, 1,
1.199903, -0.4406409, 1.020221, 1, 0, 0, 1, 1,
1.205472, 0.5987483, 1.173845, 1, 0, 0, 1, 1,
1.215308, 1.293866, 1.203952, 0, 0, 0, 1, 1,
1.216345, 0.02836786, 0.5577534, 0, 0, 0, 1, 1,
1.221205, -0.614152, 2.369972, 0, 0, 0, 1, 1,
1.228111, 1.251891, 0.1312364, 0, 0, 0, 1, 1,
1.246295, -0.1417249, 2.337609, 0, 0, 0, 1, 1,
1.267303, 0.4081676, 2.554954, 0, 0, 0, 1, 1,
1.274091, 0.4942439, 1.245191, 0, 0, 0, 1, 1,
1.276238, 1.416324, -0.6024197, 1, 1, 1, 1, 1,
1.279165, -0.5385896, 1.776202, 1, 1, 1, 1, 1,
1.288042, -1.158584, 2.287062, 1, 1, 1, 1, 1,
1.288128, 1.88227, 2.265916, 1, 1, 1, 1, 1,
1.296126, -0.7096781, 2.695393, 1, 1, 1, 1, 1,
1.301259, -0.145057, 1.359674, 1, 1, 1, 1, 1,
1.301672, 1.000317, 0.6056469, 1, 1, 1, 1, 1,
1.312756, -0.3849924, 1.788194, 1, 1, 1, 1, 1,
1.314493, 1.992593, 0.8976072, 1, 1, 1, 1, 1,
1.336338, 0.329706, 1.470701, 1, 1, 1, 1, 1,
1.346937, -0.1191637, 2.011768, 1, 1, 1, 1, 1,
1.349158, -0.6666403, 1.424503, 1, 1, 1, 1, 1,
1.355845, -0.1970282, 2.58011, 1, 1, 1, 1, 1,
1.370519, -0.1779378, 3.789864, 1, 1, 1, 1, 1,
1.391775, 0.7226852, 1.560024, 1, 1, 1, 1, 1,
1.393495, 0.8209495, 2.953844, 0, 0, 1, 1, 1,
1.399793, 0.8750594, 0.04754539, 1, 0, 0, 1, 1,
1.40493, 0.86476, 1.733857, 1, 0, 0, 1, 1,
1.411394, -2.779645, 2.465257, 1, 0, 0, 1, 1,
1.414631, 0.745662, 2.10877, 1, 0, 0, 1, 1,
1.416471, 1.035315, 0.5086803, 1, 0, 0, 1, 1,
1.422521, -2.807794, 2.612617, 0, 0, 0, 1, 1,
1.42733, -0.9050874, 2.03683, 0, 0, 0, 1, 1,
1.437716, 0.2246002, 0.6625655, 0, 0, 0, 1, 1,
1.441155, 1.13878, 1.543224, 0, 0, 0, 1, 1,
1.444342, 0.03107996, 2.126367, 0, 0, 0, 1, 1,
1.447051, 0.6053869, 1.881438, 0, 0, 0, 1, 1,
1.45478, -0.5507734, -0.3543296, 0, 0, 0, 1, 1,
1.456392, 0.3501761, 1.347049, 1, 1, 1, 1, 1,
1.474124, 0.13181, 2.456508, 1, 1, 1, 1, 1,
1.482818, -1.246109, 2.133068, 1, 1, 1, 1, 1,
1.487481, -0.3879297, 2.398314, 1, 1, 1, 1, 1,
1.490925, -0.606935, 2.413062, 1, 1, 1, 1, 1,
1.497734, 0.3837011, 2.579021, 1, 1, 1, 1, 1,
1.502741, 0.4759952, 0.1678676, 1, 1, 1, 1, 1,
1.508049, -1.241283, 1.396433, 1, 1, 1, 1, 1,
1.509644, 0.6346435, 2.225585, 1, 1, 1, 1, 1,
1.514381, 3.02797, -0.1116055, 1, 1, 1, 1, 1,
1.524274, -0.1837956, 2.885297, 1, 1, 1, 1, 1,
1.530138, -1.250689, 2.558237, 1, 1, 1, 1, 1,
1.540332, -0.3372061, 2.173222, 1, 1, 1, 1, 1,
1.548212, 0.6511803, 1.144153, 1, 1, 1, 1, 1,
1.575596, -1.661937, 3.62735, 1, 1, 1, 1, 1,
1.598677, 0.1903403, 1.840803, 0, 0, 1, 1, 1,
1.599128, -0.2574601, 1.91096, 1, 0, 0, 1, 1,
1.603038, -0.03093396, 1.325598, 1, 0, 0, 1, 1,
1.604978, -1.165205, 2.553675, 1, 0, 0, 1, 1,
1.609548, 0.2036797, 1.735047, 1, 0, 0, 1, 1,
1.643192, -0.9037305, 2.40114, 1, 0, 0, 1, 1,
1.655075, -0.634258, 2.881755, 0, 0, 0, 1, 1,
1.661135, 0.843464, 1.459766, 0, 0, 0, 1, 1,
1.678225, 0.6481701, 3.214879, 0, 0, 0, 1, 1,
1.704103, -0.5087781, 1.257796, 0, 0, 0, 1, 1,
1.718192, 0.3098222, 0.9164213, 0, 0, 0, 1, 1,
1.722125, -0.4183033, 2.603109, 0, 0, 0, 1, 1,
1.732864, 0.2675442, 1.051788, 0, 0, 0, 1, 1,
1.733316, 0.4403065, 1.274584, 1, 1, 1, 1, 1,
1.739833, -0.5363442, 1.530949, 1, 1, 1, 1, 1,
1.748618, -1.165406, 1.985927, 1, 1, 1, 1, 1,
1.757474, -1.073219, 0.3889573, 1, 1, 1, 1, 1,
1.757861, -0.2093319, 0.9651831, 1, 1, 1, 1, 1,
1.777552, 0.4995283, 2.899081, 1, 1, 1, 1, 1,
1.779392, -0.4047905, 0.7833669, 1, 1, 1, 1, 1,
1.783385, 1.233114, 1.955883, 1, 1, 1, 1, 1,
1.802758, -1.37371, 3.894245, 1, 1, 1, 1, 1,
1.808193, -0.4978857, 0.2906773, 1, 1, 1, 1, 1,
1.809207, 0.9673268, 0.5415049, 1, 1, 1, 1, 1,
1.831445, -0.3260924, 2.141283, 1, 1, 1, 1, 1,
1.831597, -2.479448, 0.8802106, 1, 1, 1, 1, 1,
1.854796, 1.634942, 0.4183978, 1, 1, 1, 1, 1,
1.856541, -0.1769256, 1.565357, 1, 1, 1, 1, 1,
1.881248, -0.5354826, 0.4251531, 0, 0, 1, 1, 1,
1.9018, -0.7001741, 2.021138, 1, 0, 0, 1, 1,
1.927353, -0.3457659, 3.185962, 1, 0, 0, 1, 1,
1.930858, 1.332749, 0.2259023, 1, 0, 0, 1, 1,
1.936914, 0.2396934, 1.14675, 1, 0, 0, 1, 1,
1.969988, -1.027562, 1.27272, 1, 0, 0, 1, 1,
1.989654, 1.055807, 0.9990188, 0, 0, 0, 1, 1,
2.059286, -1.433483, 4.396948, 0, 0, 0, 1, 1,
2.073572, 1.934205, 0.927326, 0, 0, 0, 1, 1,
2.130541, -0.7679942, 0.4692684, 0, 0, 0, 1, 1,
2.254098, 0.6056269, 2.121769, 0, 0, 0, 1, 1,
2.267261, -1.836374, 3.08458, 0, 0, 0, 1, 1,
2.269054, -0.7518069, 4.088395, 0, 0, 0, 1, 1,
2.309805, -0.3299613, 2.568316, 1, 1, 1, 1, 1,
2.471755, 1.407324, 3.062157, 1, 1, 1, 1, 1,
2.541258, -1.26148, 2.456774, 1, 1, 1, 1, 1,
2.576643, 0.4302318, 0.9864601, 1, 1, 1, 1, 1,
2.596932, 0.3057636, 0.694239, 1, 1, 1, 1, 1,
2.671032, 1.494919, -0.7786419, 1, 1, 1, 1, 1,
3.012096, 1.568419, 1.930947, 1, 1, 1, 1, 1
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
var radius = 9.390771;
var distance = 32.98468;
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
mvMatrix.translate( -0.02881885, -0.1100878, -0.03111315 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.98468);
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
