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
-3.439063, 1.850819, 0.6669224, 1, 0, 0, 1,
-3.15807, -0.6569513, -0.721749, 1, 0.007843138, 0, 1,
-3.028351, -0.185009, -3.049242, 1, 0.01176471, 0, 1,
-2.674093, -0.1836414, -0.5198037, 1, 0.01960784, 0, 1,
-2.624253, 0.3831412, -1.110056, 1, 0.02352941, 0, 1,
-2.376398, -0.09173287, -0.6224082, 1, 0.03137255, 0, 1,
-2.343635, 0.07207654, -0.7393805, 1, 0.03529412, 0, 1,
-2.315909, 0.3169711, -1.242374, 1, 0.04313726, 0, 1,
-2.298262, -0.8717619, -3.473483, 1, 0.04705882, 0, 1,
-2.292965, 0.3651105, 0.3592339, 1, 0.05490196, 0, 1,
-2.286923, 0.3323672, -2.156165, 1, 0.05882353, 0, 1,
-2.279909, -1.288883, -3.358961, 1, 0.06666667, 0, 1,
-2.238933, 2.226257, -1.805194, 1, 0.07058824, 0, 1,
-2.187708, -2.419702, -3.033994, 1, 0.07843138, 0, 1,
-2.140541, -0.249956, -3.077824, 1, 0.08235294, 0, 1,
-2.13535, 0.9623305, -1.41958, 1, 0.09019608, 0, 1,
-2.100268, 1.401501, -1.805022, 1, 0.09411765, 0, 1,
-2.089328, -0.4243397, -1.575081, 1, 0.1019608, 0, 1,
-2.088126, 0.6306719, -1.777834, 1, 0.1098039, 0, 1,
-2.07254, -0.0431118, -2.356548, 1, 0.1137255, 0, 1,
-2.070335, -0.04657129, -1.166702, 1, 0.1215686, 0, 1,
-2.069237, 0.1783633, -1.513634, 1, 0.1254902, 0, 1,
-2.028263, 0.5540129, -1.936307, 1, 0.1333333, 0, 1,
-1.990293, -0.3346875, -0.8538284, 1, 0.1372549, 0, 1,
-1.975303, 1.07839, -1.805831, 1, 0.145098, 0, 1,
-1.972081, -1.172679, -1.835685, 1, 0.1490196, 0, 1,
-1.96613, 2.539511, -0.7840435, 1, 0.1568628, 0, 1,
-1.911078, 0.6815821, -1.964286, 1, 0.1607843, 0, 1,
-1.907545, -1.62833, -2.210594, 1, 0.1686275, 0, 1,
-1.8358, -0.03860552, -1.305072, 1, 0.172549, 0, 1,
-1.833896, 1.116518, -0.9228998, 1, 0.1803922, 0, 1,
-1.819288, 1.320166, -1.046177, 1, 0.1843137, 0, 1,
-1.801204, 0.08630627, -1.735695, 1, 0.1921569, 0, 1,
-1.79443, -0.7141612, -1.561395, 1, 0.1960784, 0, 1,
-1.79173, -0.2868321, -2.034098, 1, 0.2039216, 0, 1,
-1.789307, 1.097923, -0.9266776, 1, 0.2117647, 0, 1,
-1.758761, 0.3343229, -2.089925, 1, 0.2156863, 0, 1,
-1.752097, 0.07852565, -2.998301, 1, 0.2235294, 0, 1,
-1.74611, 1.220992, -0.8810216, 1, 0.227451, 0, 1,
-1.734691, -0.4502372, -1.958845, 1, 0.2352941, 0, 1,
-1.729838, -0.2355953, -0.7441888, 1, 0.2392157, 0, 1,
-1.723434, 1.725107, -0.927629, 1, 0.2470588, 0, 1,
-1.70677, -0.4445575, -1.508111, 1, 0.2509804, 0, 1,
-1.696508, -1.093939, -0.5286884, 1, 0.2588235, 0, 1,
-1.679364, -1.05189, -2.036762, 1, 0.2627451, 0, 1,
-1.669497, 0.4219979, -1.284954, 1, 0.2705882, 0, 1,
-1.655016, -0.1628183, -1.827586, 1, 0.2745098, 0, 1,
-1.654601, -2.710004, -2.627783, 1, 0.282353, 0, 1,
-1.654058, 0.5233856, -1.387633, 1, 0.2862745, 0, 1,
-1.650699, -0.9882076, -3.708869, 1, 0.2941177, 0, 1,
-1.649461, 0.3128451, 1.011336, 1, 0.3019608, 0, 1,
-1.647742, -0.1597523, -3.319448, 1, 0.3058824, 0, 1,
-1.64627, -0.9674898, -1.94208, 1, 0.3137255, 0, 1,
-1.645696, -0.908812, -3.4303, 1, 0.3176471, 0, 1,
-1.63267, 0.777533, -0.5858567, 1, 0.3254902, 0, 1,
-1.629207, 2.091275, -1.894406, 1, 0.3294118, 0, 1,
-1.62344, 0.2743005, -1.663825, 1, 0.3372549, 0, 1,
-1.619158, -0.4205996, -0.8706902, 1, 0.3411765, 0, 1,
-1.613478, 1.079615, -1.936245, 1, 0.3490196, 0, 1,
-1.609034, -0.3022467, -1.959107, 1, 0.3529412, 0, 1,
-1.608862, -0.1687978, -1.878189, 1, 0.3607843, 0, 1,
-1.595988, -0.05309631, -1.217603, 1, 0.3647059, 0, 1,
-1.593176, 1.88206, -1.065119, 1, 0.372549, 0, 1,
-1.590762, -0.1599447, -1.314923, 1, 0.3764706, 0, 1,
-1.582716, -0.6433009, -2.121406, 1, 0.3843137, 0, 1,
-1.553267, 0.1212955, -1.246559, 1, 0.3882353, 0, 1,
-1.54316, -1.232023, -2.04745, 1, 0.3960784, 0, 1,
-1.537089, 1.117298, -1.152499, 1, 0.4039216, 0, 1,
-1.53353, -0.2647017, -0.4656631, 1, 0.4078431, 0, 1,
-1.531647, -0.2060091, -3.229254, 1, 0.4156863, 0, 1,
-1.524754, -0.8364489, -0.6670343, 1, 0.4196078, 0, 1,
-1.524473, 1.02586, 0.6498229, 1, 0.427451, 0, 1,
-1.507075, -1.512541, -3.135699, 1, 0.4313726, 0, 1,
-1.503358, -0.3927047, -0.5523633, 1, 0.4392157, 0, 1,
-1.502238, 1.263698, 0.4811677, 1, 0.4431373, 0, 1,
-1.500379, -0.6044554, -3.209405, 1, 0.4509804, 0, 1,
-1.48851, -0.06180057, -0.7630023, 1, 0.454902, 0, 1,
-1.477723, 0.30926, -2.623093, 1, 0.4627451, 0, 1,
-1.4639, -2.684999, -3.166436, 1, 0.4666667, 0, 1,
-1.457034, 0.7548141, -0.6392883, 1, 0.4745098, 0, 1,
-1.455899, 0.7885238, -2.000943, 1, 0.4784314, 0, 1,
-1.447934, -0.08198813, -0.6327212, 1, 0.4862745, 0, 1,
-1.417759, -0.2422745, -2.3749, 1, 0.4901961, 0, 1,
-1.405441, 0.7924563, -1.109362, 1, 0.4980392, 0, 1,
-1.39631, -1.453507, -2.484255, 1, 0.5058824, 0, 1,
-1.394642, 0.9696537, -2.157035, 1, 0.509804, 0, 1,
-1.393987, -0.1267835, -2.342639, 1, 0.5176471, 0, 1,
-1.385628, -1.000148, -4.280645, 1, 0.5215687, 0, 1,
-1.382774, 1.108785, 0.3300911, 1, 0.5294118, 0, 1,
-1.373261, -0.8487368, -0.9639988, 1, 0.5333334, 0, 1,
-1.373042, -0.6927609, -1.355031, 1, 0.5411765, 0, 1,
-1.370848, 1.839575, -1.027687, 1, 0.5450981, 0, 1,
-1.366519, 1.527906, -0.8007264, 1, 0.5529412, 0, 1,
-1.35655, -0.4866921, -4.932297, 1, 0.5568628, 0, 1,
-1.352715, -0.4353681, -1.16628, 1, 0.5647059, 0, 1,
-1.351233, 0.5340015, -2.05497, 1, 0.5686275, 0, 1,
-1.344871, -0.05174384, -0.8491736, 1, 0.5764706, 0, 1,
-1.335467, -0.591615, -3.323883, 1, 0.5803922, 0, 1,
-1.308825, 1.619975, 1.603147, 1, 0.5882353, 0, 1,
-1.298209, 0.8583393, -0.8456482, 1, 0.5921569, 0, 1,
-1.289773, 0.5424476, -1.930946, 1, 0.6, 0, 1,
-1.280799, -0.2665133, -3.297022, 1, 0.6078432, 0, 1,
-1.273764, 1.913288, -0.7598061, 1, 0.6117647, 0, 1,
-1.270491, 0.3880194, -1.655583, 1, 0.6196079, 0, 1,
-1.268166, -1.327859, -1.867372, 1, 0.6235294, 0, 1,
-1.259628, -0.5569618, -0.8468242, 1, 0.6313726, 0, 1,
-1.258911, -0.8692923, -2.499223, 1, 0.6352941, 0, 1,
-1.250274, 1.113029, -1.223698, 1, 0.6431373, 0, 1,
-1.250229, -1.114869, -1.896313, 1, 0.6470588, 0, 1,
-1.248196, 0.5194265, 0.1251298, 1, 0.654902, 0, 1,
-1.244921, 0.8524788, -1.356986, 1, 0.6588235, 0, 1,
-1.2371, -0.05719927, -2.812292, 1, 0.6666667, 0, 1,
-1.234257, 0.8489589, -0.167969, 1, 0.6705883, 0, 1,
-1.233375, 0.6570021, 0.9271802, 1, 0.6784314, 0, 1,
-1.226544, -0.6905947, -2.387812, 1, 0.682353, 0, 1,
-1.224744, 0.09836781, -1.855001, 1, 0.6901961, 0, 1,
-1.223857, -0.244744, -2.793814, 1, 0.6941177, 0, 1,
-1.208982, -0.4590711, 0.03310426, 1, 0.7019608, 0, 1,
-1.205966, 0.4149455, -1.873603, 1, 0.7098039, 0, 1,
-1.197242, -2.768066, -3.380563, 1, 0.7137255, 0, 1,
-1.196518, -0.9141985, -1.143942, 1, 0.7215686, 0, 1,
-1.196244, 1.341132, -0.2237452, 1, 0.7254902, 0, 1,
-1.19287, -0.8221722, -3.116189, 1, 0.7333333, 0, 1,
-1.188395, 1.000713, -1.732532, 1, 0.7372549, 0, 1,
-1.184424, -0.3478455, -0.7990656, 1, 0.7450981, 0, 1,
-1.183336, -0.3420354, -2.157825, 1, 0.7490196, 0, 1,
-1.180095, 0.4757022, -0.4438147, 1, 0.7568628, 0, 1,
-1.163522, 0.8573989, -1.192929, 1, 0.7607843, 0, 1,
-1.160139, 0.4530917, -0.54825, 1, 0.7686275, 0, 1,
-1.159916, -0.2321089, -1.420282, 1, 0.772549, 0, 1,
-1.155983, 0.03146338, -3.490071, 1, 0.7803922, 0, 1,
-1.153259, 0.8878846, -4.559584, 1, 0.7843137, 0, 1,
-1.143531, -0.9828715, -2.035861, 1, 0.7921569, 0, 1,
-1.13704, -1.453124, -2.451715, 1, 0.7960784, 0, 1,
-1.136915, -0.7058977, -1.283642, 1, 0.8039216, 0, 1,
-1.132917, -0.5797473, -1.299551, 1, 0.8117647, 0, 1,
-1.116396, 0.8315203, -2.205043, 1, 0.8156863, 0, 1,
-1.116228, 0.6628984, 1.59479, 1, 0.8235294, 0, 1,
-1.114735, -0.2611706, -1.741607, 1, 0.827451, 0, 1,
-1.109989, 1.369092, 0.1960007, 1, 0.8352941, 0, 1,
-1.104624, -0.6002797, -1.313087, 1, 0.8392157, 0, 1,
-1.102073, 0.4265388, -0.802772, 1, 0.8470588, 0, 1,
-1.093676, -0.5781372, 0.008689737, 1, 0.8509804, 0, 1,
-1.093429, 1.140359, -1.308294, 1, 0.8588235, 0, 1,
-1.086044, -0.5102098, -2.381319, 1, 0.8627451, 0, 1,
-1.072278, -1.168944, -2.238767, 1, 0.8705882, 0, 1,
-1.07198, 0.5811151, -1.218611, 1, 0.8745098, 0, 1,
-1.07173, -0.8065585, -3.40292, 1, 0.8823529, 0, 1,
-1.071221, 0.3607502, -1.18632, 1, 0.8862745, 0, 1,
-1.062826, 1.183031, -0.8725052, 1, 0.8941177, 0, 1,
-1.059745, 0.1330443, -1.09625, 1, 0.8980392, 0, 1,
-1.053873, -1.032916, 0.2223118, 1, 0.9058824, 0, 1,
-1.051195, 0.2299887, -3.029835, 1, 0.9137255, 0, 1,
-1.035305, 0.08667186, -1.307648, 1, 0.9176471, 0, 1,
-1.03151, -0.1076709, -2.557517, 1, 0.9254902, 0, 1,
-1.028103, 1.943419, -1.742569, 1, 0.9294118, 0, 1,
-1.025013, -0.04548642, 0.3747493, 1, 0.9372549, 0, 1,
-1.024614, 0.617593, -0.2531809, 1, 0.9411765, 0, 1,
-1.022653, -0.9858158, -2.284777, 1, 0.9490196, 0, 1,
-1.021993, 0.7949144, -1.911384, 1, 0.9529412, 0, 1,
-1.021267, -1.738085, -3.57147, 1, 0.9607843, 0, 1,
-1.020417, 3.163021, 0.4799029, 1, 0.9647059, 0, 1,
-1.013774, 0.5092186, -1.975019, 1, 0.972549, 0, 1,
-1.012255, 0.5044924, -1.313577, 1, 0.9764706, 0, 1,
-1.005286, -1.020894, 0.1679702, 1, 0.9843137, 0, 1,
-1.005054, 0.5806556, -0.3623775, 1, 0.9882353, 0, 1,
-1.003155, -0.3207219, -1.919998, 1, 0.9960784, 0, 1,
-0.9968308, 0.627409, -2.119046, 0.9960784, 1, 0, 1,
-0.9898286, -0.4417497, -2.841012, 0.9921569, 1, 0, 1,
-0.9876343, 0.3169332, -1.334847, 0.9843137, 1, 0, 1,
-0.98335, -0.8081433, -2.237402, 0.9803922, 1, 0, 1,
-0.9795579, 0.7981365, -0.03459795, 0.972549, 1, 0, 1,
-0.9795132, -1.401003, -1.835041, 0.9686275, 1, 0, 1,
-0.9788803, 1.8512, -1.879078, 0.9607843, 1, 0, 1,
-0.9759655, -1.278395, -3.898597, 0.9568627, 1, 0, 1,
-0.975414, -0.3189849, -1.952265, 0.9490196, 1, 0, 1,
-0.9680021, -1.10455, -1.426981, 0.945098, 1, 0, 1,
-0.960328, 2.18031, -1.572964, 0.9372549, 1, 0, 1,
-0.9602044, -0.3341404, -2.209607, 0.9333333, 1, 0, 1,
-0.9426267, -0.03692019, -1.529089, 0.9254902, 1, 0, 1,
-0.9398394, -1.652873, -1.409385, 0.9215686, 1, 0, 1,
-0.9280891, 0.5252875, -2.466033, 0.9137255, 1, 0, 1,
-0.9244444, 0.749419, -0.122713, 0.9098039, 1, 0, 1,
-0.9160601, 1.236685, -1.584437, 0.9019608, 1, 0, 1,
-0.9104907, 0.5880007, -2.395892, 0.8941177, 1, 0, 1,
-0.9104198, -1.26789, -2.424974, 0.8901961, 1, 0, 1,
-0.9088662, -1.882965, -3.449861, 0.8823529, 1, 0, 1,
-0.9059741, -0.5095796, -3.628995, 0.8784314, 1, 0, 1,
-0.9016402, 3.455967, 0.004039424, 0.8705882, 1, 0, 1,
-0.8955122, 0.4637372, -3.377522, 0.8666667, 1, 0, 1,
-0.8952724, -0.2751707, -1.987645, 0.8588235, 1, 0, 1,
-0.8948073, -1.21251, -1.360334, 0.854902, 1, 0, 1,
-0.8831173, -0.6835188, -3.410174, 0.8470588, 1, 0, 1,
-0.8828442, 0.0692037, -1.93876, 0.8431373, 1, 0, 1,
-0.8793986, 0.795112, -0.696685, 0.8352941, 1, 0, 1,
-0.8749843, 0.881041, -0.8645275, 0.8313726, 1, 0, 1,
-0.8729684, -1.122358, -2.289576, 0.8235294, 1, 0, 1,
-0.8705719, 0.7693324, 0.3220518, 0.8196079, 1, 0, 1,
-0.8674908, 0.6540297, -3.272438, 0.8117647, 1, 0, 1,
-0.8652885, 0.2150553, -0.9065413, 0.8078431, 1, 0, 1,
-0.8560365, 0.4278337, -0.678664, 0.8, 1, 0, 1,
-0.8478073, -1.202753, -1.862724, 0.7921569, 1, 0, 1,
-0.8456002, 0.3768121, -1.772296, 0.7882353, 1, 0, 1,
-0.8334797, -1.003708, -1.587278, 0.7803922, 1, 0, 1,
-0.8309145, 1.365651, 0.3653595, 0.7764706, 1, 0, 1,
-0.8304706, 2.836277, -1.465733, 0.7686275, 1, 0, 1,
-0.8278674, 1.181836, -1.75498, 0.7647059, 1, 0, 1,
-0.8261182, -1.437422, -2.897737, 0.7568628, 1, 0, 1,
-0.8223091, 1.999592, -0.538508, 0.7529412, 1, 0, 1,
-0.821626, 0.02127441, -1.2529, 0.7450981, 1, 0, 1,
-0.8166066, -0.4061081, -1.255752, 0.7411765, 1, 0, 1,
-0.8158022, -0.2490058, -1.94441, 0.7333333, 1, 0, 1,
-0.8127325, -0.3581434, -0.8697099, 0.7294118, 1, 0, 1,
-0.8099727, 0.7222141, -0.8532808, 0.7215686, 1, 0, 1,
-0.8087414, 1.713292, 0.06143177, 0.7176471, 1, 0, 1,
-0.8073418, -0.1332644, -2.873597, 0.7098039, 1, 0, 1,
-0.8050508, 1.94512, 0.8254706, 0.7058824, 1, 0, 1,
-0.8012109, 0.0748984, -1.804047, 0.6980392, 1, 0, 1,
-0.79296, 0.4253783, -1.402509, 0.6901961, 1, 0, 1,
-0.7879894, -0.04109705, -1.267052, 0.6862745, 1, 0, 1,
-0.7822353, 1.026209, -1.247488, 0.6784314, 1, 0, 1,
-0.7777389, 0.3668305, -2.848789, 0.6745098, 1, 0, 1,
-0.7761753, -1.058007, -1.014253, 0.6666667, 1, 0, 1,
-0.7735938, -0.2252636, -0.5819044, 0.6627451, 1, 0, 1,
-0.7693431, -1.586008, -2.655629, 0.654902, 1, 0, 1,
-0.7688115, -1.388937, -3.099257, 0.6509804, 1, 0, 1,
-0.7655382, 2.544726, -0.6668234, 0.6431373, 1, 0, 1,
-0.7604392, 0.1323248, -0.6140646, 0.6392157, 1, 0, 1,
-0.7603313, -0.243958, -0.4420557, 0.6313726, 1, 0, 1,
-0.7567224, -1.396329, -1.566815, 0.627451, 1, 0, 1,
-0.750445, 0.6781418, -0.6542199, 0.6196079, 1, 0, 1,
-0.7499833, 1.020088, -0.2960764, 0.6156863, 1, 0, 1,
-0.7420116, 0.1722671, -1.222167, 0.6078432, 1, 0, 1,
-0.7393175, -1.189488, -4.95704, 0.6039216, 1, 0, 1,
-0.7377456, 0.6252092, 0.4890635, 0.5960785, 1, 0, 1,
-0.7335939, -0.2374611, -2.862836, 0.5882353, 1, 0, 1,
-0.7255114, -1.964395, -3.355767, 0.5843138, 1, 0, 1,
-0.7196994, -0.5613922, -1.20582, 0.5764706, 1, 0, 1,
-0.7162723, -1.050585, -1.783404, 0.572549, 1, 0, 1,
-0.7145295, -0.7290861, -3.006382, 0.5647059, 1, 0, 1,
-0.7127513, 0.8254002, 1.098915, 0.5607843, 1, 0, 1,
-0.7108856, 0.8450924, -0.3311688, 0.5529412, 1, 0, 1,
-0.7074437, 1.100904, -0.9212931, 0.5490196, 1, 0, 1,
-0.7058152, 1.846684, 0.08763936, 0.5411765, 1, 0, 1,
-0.7024735, -0.3350678, -1.490444, 0.5372549, 1, 0, 1,
-0.7010757, 1.031489, -0.7427252, 0.5294118, 1, 0, 1,
-0.6964464, 2.749954, -0.9576333, 0.5254902, 1, 0, 1,
-0.6938013, -0.03039647, -1.659856, 0.5176471, 1, 0, 1,
-0.6899191, -0.4786828, -2.697121, 0.5137255, 1, 0, 1,
-0.6886648, -0.2843467, -2.198471, 0.5058824, 1, 0, 1,
-0.6875245, -1.931002, -3.077745, 0.5019608, 1, 0, 1,
-0.68625, 1.099748, -0.3812395, 0.4941176, 1, 0, 1,
-0.6808704, -0.9942173, -1.650708, 0.4862745, 1, 0, 1,
-0.6799195, 0.9141281, -0.07112909, 0.4823529, 1, 0, 1,
-0.6793507, 0.4847695, -0.09740011, 0.4745098, 1, 0, 1,
-0.6771679, 0.9168062, 0.3317399, 0.4705882, 1, 0, 1,
-0.6726341, 1.845615, -0.4812067, 0.4627451, 1, 0, 1,
-0.666849, -1.089944, -3.057327, 0.4588235, 1, 0, 1,
-0.6646041, -0.5963096, -1.819814, 0.4509804, 1, 0, 1,
-0.6642869, -1.44994, -2.89538, 0.4470588, 1, 0, 1,
-0.6598631, 0.1773809, -1.4226, 0.4392157, 1, 0, 1,
-0.6551644, 0.2858633, -1.134796, 0.4352941, 1, 0, 1,
-0.6538554, 0.2800509, -1.730918, 0.427451, 1, 0, 1,
-0.6527637, 2.435961, 0.4088103, 0.4235294, 1, 0, 1,
-0.6477014, 0.3326465, -1.093886, 0.4156863, 1, 0, 1,
-0.64417, -0.1634469, -2.555282, 0.4117647, 1, 0, 1,
-0.6440015, -1.184914, -4.603831, 0.4039216, 1, 0, 1,
-0.6382066, 1.107603, -1.255564, 0.3960784, 1, 0, 1,
-0.6322152, -1.153464, -2.060866, 0.3921569, 1, 0, 1,
-0.6297734, 0.8567193, -0.4255973, 0.3843137, 1, 0, 1,
-0.6297204, -0.4182177, -2.673068, 0.3803922, 1, 0, 1,
-0.6289743, 1.349226, 0.067084, 0.372549, 1, 0, 1,
-0.6270251, 0.5244451, -1.264833, 0.3686275, 1, 0, 1,
-0.6266122, -0.865523, -3.269544, 0.3607843, 1, 0, 1,
-0.625069, -0.8282291, -2.774669, 0.3568628, 1, 0, 1,
-0.6230202, 0.0936577, -1.467249, 0.3490196, 1, 0, 1,
-0.614915, -0.304029, -2.768365, 0.345098, 1, 0, 1,
-0.6125, 0.304292, -1.389616, 0.3372549, 1, 0, 1,
-0.6092898, -0.06989611, -1.825389, 0.3333333, 1, 0, 1,
-0.6074083, -0.8389139, -3.480067, 0.3254902, 1, 0, 1,
-0.6032419, -1.040342, -3.296612, 0.3215686, 1, 0, 1,
-0.6015055, -0.132384, -0.4169875, 0.3137255, 1, 0, 1,
-0.5992782, -0.6347982, -0.9593998, 0.3098039, 1, 0, 1,
-0.5948688, -0.5958977, -1.83972, 0.3019608, 1, 0, 1,
-0.5905527, 0.1348453, -0.956067, 0.2941177, 1, 0, 1,
-0.5857714, -1.100554, -1.688043, 0.2901961, 1, 0, 1,
-0.5827299, 1.309078, -1.428867, 0.282353, 1, 0, 1,
-0.576921, 1.1975, -0.2014949, 0.2784314, 1, 0, 1,
-0.5766395, -1.212523, -3.155563, 0.2705882, 1, 0, 1,
-0.5762841, -1.242768, -2.372411, 0.2666667, 1, 0, 1,
-0.5757955, -0.4110945, -1.726543, 0.2588235, 1, 0, 1,
-0.574938, 0.08621281, -1.936429, 0.254902, 1, 0, 1,
-0.5734827, -1.857607, -3.002614, 0.2470588, 1, 0, 1,
-0.5708796, -1.10823, -3.407599, 0.2431373, 1, 0, 1,
-0.5670707, 0.4939134, -0.7471336, 0.2352941, 1, 0, 1,
-0.5665464, 2.197089, 0.575634, 0.2313726, 1, 0, 1,
-0.5658949, 1.640324, -0.194572, 0.2235294, 1, 0, 1,
-0.5596589, -1.228557, -3.084808, 0.2196078, 1, 0, 1,
-0.5578827, 1.075789, 1.122626, 0.2117647, 1, 0, 1,
-0.5535443, -0.6306177, -3.768934, 0.2078431, 1, 0, 1,
-0.5455298, -1.222158, -2.700276, 0.2, 1, 0, 1,
-0.5445836, 0.1361863, -2.813392, 0.1921569, 1, 0, 1,
-0.5275672, 0.5181518, -0.2402221, 0.1882353, 1, 0, 1,
-0.5254586, -0.3882604, -3.027053, 0.1803922, 1, 0, 1,
-0.5226105, 0.6312376, -1.542902, 0.1764706, 1, 0, 1,
-0.5203798, -0.3076769, -3.69963, 0.1686275, 1, 0, 1,
-0.5201321, -0.726596, -2.350489, 0.1647059, 1, 0, 1,
-0.518366, -1.095925, -3.572049, 0.1568628, 1, 0, 1,
-0.516975, -1.060175, -2.123081, 0.1529412, 1, 0, 1,
-0.5113367, 2.141377, -2.104911, 0.145098, 1, 0, 1,
-0.5108486, 1.064256, -0.4867391, 0.1411765, 1, 0, 1,
-0.5100743, -0.3322355, -3.117206, 0.1333333, 1, 0, 1,
-0.5065533, 1.949104, 0.01492942, 0.1294118, 1, 0, 1,
-0.5031649, -1.254503, -3.381944, 0.1215686, 1, 0, 1,
-0.5001461, -0.1725894, -3.424387, 0.1176471, 1, 0, 1,
-0.4896126, 0.6764187, 0.2518769, 0.1098039, 1, 0, 1,
-0.4883887, -0.8545704, -3.489863, 0.1058824, 1, 0, 1,
-0.479858, 0.1679582, -0.7071221, 0.09803922, 1, 0, 1,
-0.4789966, -0.3748186, -0.7586557, 0.09019608, 1, 0, 1,
-0.4764608, 1.09239, 0.1280449, 0.08627451, 1, 0, 1,
-0.476256, 0.4478361, 1.105263, 0.07843138, 1, 0, 1,
-0.4756296, -0.6777853, -2.992437, 0.07450981, 1, 0, 1,
-0.4714684, -1.428066, -3.692651, 0.06666667, 1, 0, 1,
-0.4655935, 1.984079, -1.413133, 0.0627451, 1, 0, 1,
-0.4602602, -2.391946, -3.805531, 0.05490196, 1, 0, 1,
-0.4585461, 1.141326, 0.7364187, 0.05098039, 1, 0, 1,
-0.4525375, 0.792397, -1.777871, 0.04313726, 1, 0, 1,
-0.4498022, 0.7346452, 0.8879831, 0.03921569, 1, 0, 1,
-0.4446278, 1.066054, -0.2965692, 0.03137255, 1, 0, 1,
-0.4421262, 0.04552251, -2.053107, 0.02745098, 1, 0, 1,
-0.4410987, 0.09293192, -0.501382, 0.01960784, 1, 0, 1,
-0.439745, -0.1420974, -0.8081531, 0.01568628, 1, 0, 1,
-0.4396159, 0.004485139, -0.7641448, 0.007843138, 1, 0, 1,
-0.4389831, 1.005761, 1.068188, 0.003921569, 1, 0, 1,
-0.4388045, 3.784103, 1.112147, 0, 1, 0.003921569, 1,
-0.4322523, -0.7285764, -2.649349, 0, 1, 0.01176471, 1,
-0.4318666, -0.8022041, -4.864538, 0, 1, 0.01568628, 1,
-0.4206419, 0.2517613, -0.8446607, 0, 1, 0.02352941, 1,
-0.4202235, 0.08842638, -0.5060947, 0, 1, 0.02745098, 1,
-0.4133808, -1.479037, -3.616495, 0, 1, 0.03529412, 1,
-0.4129745, -0.3710715, -1.808026, 0, 1, 0.03921569, 1,
-0.4062764, 0.5367745, -0.8700705, 0, 1, 0.04705882, 1,
-0.4003574, 0.4249119, -1.181623, 0, 1, 0.05098039, 1,
-0.3986374, 1.084542, -0.1334007, 0, 1, 0.05882353, 1,
-0.3972457, 0.1444729, -1.197322, 0, 1, 0.0627451, 1,
-0.3949624, 0.9182177, -0.9841496, 0, 1, 0.07058824, 1,
-0.3948941, 0.2559705, 0.3990757, 0, 1, 0.07450981, 1,
-0.3940729, -0.4737479, -4.145798, 0, 1, 0.08235294, 1,
-0.3937834, 2.244719, 0.3506971, 0, 1, 0.08627451, 1,
-0.3889598, -0.4997679, -3.815989, 0, 1, 0.09411765, 1,
-0.3857527, -1.23092, -0.7513684, 0, 1, 0.1019608, 1,
-0.3841972, -0.3671041, -2.617551, 0, 1, 0.1058824, 1,
-0.3818691, 0.8822553, -1.11081, 0, 1, 0.1137255, 1,
-0.3772937, 1.001576, 0.3108305, 0, 1, 0.1176471, 1,
-0.3760173, 0.5343542, -0.9076666, 0, 1, 0.1254902, 1,
-0.3713074, 0.240176, -0.7666395, 0, 1, 0.1294118, 1,
-0.3684558, -0.04029278, -1.460983, 0, 1, 0.1372549, 1,
-0.3669079, -1.381399, -0.9849412, 0, 1, 0.1411765, 1,
-0.3624813, 1.013476, 0.5696817, 0, 1, 0.1490196, 1,
-0.3608782, -1.086716, -3.099954, 0, 1, 0.1529412, 1,
-0.3603989, -0.2828704, -0.9549121, 0, 1, 0.1607843, 1,
-0.3602026, -0.245388, -3.112807, 0, 1, 0.1647059, 1,
-0.3594377, -1.19611, -3.676974, 0, 1, 0.172549, 1,
-0.3582716, -0.2578258, -2.468769, 0, 1, 0.1764706, 1,
-0.3540009, -0.2864537, -1.440643, 0, 1, 0.1843137, 1,
-0.3537902, -0.7005376, -2.461538, 0, 1, 0.1882353, 1,
-0.3462633, 2.623608, 0.482929, 0, 1, 0.1960784, 1,
-0.3456488, -0.1563267, -3.412122, 0, 1, 0.2039216, 1,
-0.3442897, 2.045549, 0.01315388, 0, 1, 0.2078431, 1,
-0.3434674, -0.8462285, -3.106581, 0, 1, 0.2156863, 1,
-0.3425295, 0.7192353, 1.063319, 0, 1, 0.2196078, 1,
-0.3404791, 1.720636, 0.1836771, 0, 1, 0.227451, 1,
-0.3399446, 1.275717, -1.91601, 0, 1, 0.2313726, 1,
-0.3391502, 0.3648742, -3.024616, 0, 1, 0.2392157, 1,
-0.3360979, -1.02951, -2.158265, 0, 1, 0.2431373, 1,
-0.3349989, 1.305076, 1.332634, 0, 1, 0.2509804, 1,
-0.3348998, -0.4949143, -1.785454, 0, 1, 0.254902, 1,
-0.3344386, 0.02594203, -2.376261, 0, 1, 0.2627451, 1,
-0.3313208, 1.416187, 0.1733263, 0, 1, 0.2666667, 1,
-0.3308859, -0.2217406, -0.2473774, 0, 1, 0.2745098, 1,
-0.3293425, 0.3742172, 1.461963, 0, 1, 0.2784314, 1,
-0.3261998, 0.1207136, -2.978029, 0, 1, 0.2862745, 1,
-0.3261642, 0.740516, -0.4170683, 0, 1, 0.2901961, 1,
-0.320992, -0.4422446, -3.934898, 0, 1, 0.2980392, 1,
-0.3186137, -0.08590543, -2.522095, 0, 1, 0.3058824, 1,
-0.3151123, 2.002853, -0.4511227, 0, 1, 0.3098039, 1,
-0.311529, -0.6091205, -1.914621, 0, 1, 0.3176471, 1,
-0.3058191, 0.1600845, -2.346442, 0, 1, 0.3215686, 1,
-0.3020571, 0.218578, -0.6757336, 0, 1, 0.3294118, 1,
-0.3008805, -0.1770382, -2.698887, 0, 1, 0.3333333, 1,
-0.2994284, 0.2137212, 0.5563691, 0, 1, 0.3411765, 1,
-0.2982022, 0.9836034, -0.01918278, 0, 1, 0.345098, 1,
-0.2944016, -0.9655941, -4.645607, 0, 1, 0.3529412, 1,
-0.2904575, -1.162859, -4.154531, 0, 1, 0.3568628, 1,
-0.2823313, 0.2464714, -1.966444, 0, 1, 0.3647059, 1,
-0.2802756, -0.2834465, -2.466582, 0, 1, 0.3686275, 1,
-0.2786687, -0.8975889, -2.450662, 0, 1, 0.3764706, 1,
-0.2749985, 1.539326, 0.8514538, 0, 1, 0.3803922, 1,
-0.2710018, -0.2118353, -1.56866, 0, 1, 0.3882353, 1,
-0.2673499, 0.7150917, -0.4788017, 0, 1, 0.3921569, 1,
-0.2672257, 1.941783, -0.8333639, 0, 1, 0.4, 1,
-0.2658883, 0.5352728, 1.069078, 0, 1, 0.4078431, 1,
-0.2658011, -0.8463247, -4.899629, 0, 1, 0.4117647, 1,
-0.2636251, 1.187525, -1.041573, 0, 1, 0.4196078, 1,
-0.2610278, -0.1311608, -2.277199, 0, 1, 0.4235294, 1,
-0.2589939, -1.156275, -3.709585, 0, 1, 0.4313726, 1,
-0.2580075, 0.5829923, -0.2817117, 0, 1, 0.4352941, 1,
-0.2577763, 1.010315, 1.002757, 0, 1, 0.4431373, 1,
-0.2566153, 0.8989682, 1.019665, 0, 1, 0.4470588, 1,
-0.2555475, 1.497814, -0.1570451, 0, 1, 0.454902, 1,
-0.2553811, 0.3227147, -0.6973513, 0, 1, 0.4588235, 1,
-0.2487246, -1.04763, -2.725366, 0, 1, 0.4666667, 1,
-0.2379342, -0.6129062, -2.494229, 0, 1, 0.4705882, 1,
-0.2371202, -1.369935, -2.917173, 0, 1, 0.4784314, 1,
-0.2319834, 0.1322813, -0.06505014, 0, 1, 0.4823529, 1,
-0.2305956, 1.327531, 1.138608, 0, 1, 0.4901961, 1,
-0.2260509, 0.4235914, 0.7402775, 0, 1, 0.4941176, 1,
-0.2247024, 0.03657347, 0.4250216, 0, 1, 0.5019608, 1,
-0.2239982, -0.5305337, -3.217263, 0, 1, 0.509804, 1,
-0.2233863, 2.215042, 2.732217, 0, 1, 0.5137255, 1,
-0.2225252, -1.008347, -1.549327, 0, 1, 0.5215687, 1,
-0.222286, -0.7880633, -2.784862, 0, 1, 0.5254902, 1,
-0.221776, -0.1495818, -1.148163, 0, 1, 0.5333334, 1,
-0.2194366, 1.278111, -2.240944, 0, 1, 0.5372549, 1,
-0.2175715, -0.7707949, -2.755597, 0, 1, 0.5450981, 1,
-0.2162136, -0.212335, -4.112942, 0, 1, 0.5490196, 1,
-0.2077261, 0.01354359, -1.411761, 0, 1, 0.5568628, 1,
-0.2077255, -0.4190791, -1.107039, 0, 1, 0.5607843, 1,
-0.2044157, -0.63261, -2.738852, 0, 1, 0.5686275, 1,
-0.2039501, -1.58446, -1.872522, 0, 1, 0.572549, 1,
-0.1945683, -0.09008715, -1.819434, 0, 1, 0.5803922, 1,
-0.1917245, -0.4319552, -2.069142, 0, 1, 0.5843138, 1,
-0.1863294, 0.5327482, -0.2908141, 0, 1, 0.5921569, 1,
-0.1850571, 1.638748, 0.2595258, 0, 1, 0.5960785, 1,
-0.1809949, 1.397663, -0.2907614, 0, 1, 0.6039216, 1,
-0.1777691, -0.9100465, -2.901304, 0, 1, 0.6117647, 1,
-0.1768703, -0.09222878, -2.700879, 0, 1, 0.6156863, 1,
-0.1754289, 0.4390548, 0.6211653, 0, 1, 0.6235294, 1,
-0.1737417, -1.061319, -2.677549, 0, 1, 0.627451, 1,
-0.1716326, 2.223544, -1.439687, 0, 1, 0.6352941, 1,
-0.1715236, -0.6591146, -2.281008, 0, 1, 0.6392157, 1,
-0.1690374, -1.018697, -2.356972, 0, 1, 0.6470588, 1,
-0.166935, 0.7632887, 0.9516636, 0, 1, 0.6509804, 1,
-0.1650939, -0.7029192, -0.5412462, 0, 1, 0.6588235, 1,
-0.1635737, -0.299085, -4.0033, 0, 1, 0.6627451, 1,
-0.1617373, 0.06539264, -0.9566534, 0, 1, 0.6705883, 1,
-0.1513761, -0.2113228, -2.439198, 0, 1, 0.6745098, 1,
-0.1512972, 1.591426, -0.5278787, 0, 1, 0.682353, 1,
-0.1481638, -0.2810415, -3.441543, 0, 1, 0.6862745, 1,
-0.1438414, -0.5752253, -3.736468, 0, 1, 0.6941177, 1,
-0.1419658, -1.872077, -1.711263, 0, 1, 0.7019608, 1,
-0.1416112, -0.3138714, -2.813586, 0, 1, 0.7058824, 1,
-0.1403776, 0.002106436, -0.9753351, 0, 1, 0.7137255, 1,
-0.1393633, 0.4474805, -1.731505, 0, 1, 0.7176471, 1,
-0.137467, -0.03439367, -1.064883, 0, 1, 0.7254902, 1,
-0.1358261, 0.3447753, -1.702959, 0, 1, 0.7294118, 1,
-0.13318, 1.388363, 0.2979985, 0, 1, 0.7372549, 1,
-0.133017, -0.7291492, -3.597996, 0, 1, 0.7411765, 1,
-0.1295414, 0.499012, 0.397747, 0, 1, 0.7490196, 1,
-0.1285517, 1.45764, 1.033323, 0, 1, 0.7529412, 1,
-0.1229418, -0.2444678, -2.522635, 0, 1, 0.7607843, 1,
-0.1215069, 0.9632913, 1.060538, 0, 1, 0.7647059, 1,
-0.1200164, 1.828377, -1.406472, 0, 1, 0.772549, 1,
-0.1179365, 0.4400164, -0.4018447, 0, 1, 0.7764706, 1,
-0.117445, -0.4665109, -2.83402, 0, 1, 0.7843137, 1,
-0.1168912, -1.157735, -3.884002, 0, 1, 0.7882353, 1,
-0.1140298, -1.153102, -4.401879, 0, 1, 0.7960784, 1,
-0.1138219, -0.3087862, -1.100901, 0, 1, 0.8039216, 1,
-0.1133323, 0.9312564, 0.2553767, 0, 1, 0.8078431, 1,
-0.1130594, -1.991728, -2.695669, 0, 1, 0.8156863, 1,
-0.106579, -1.598859, -4.934529, 0, 1, 0.8196079, 1,
-0.1059277, 0.2969168, -0.2209283, 0, 1, 0.827451, 1,
-0.1039628, 0.9761013, -1.217686, 0, 1, 0.8313726, 1,
-0.103433, -0.02741591, -2.308157, 0, 1, 0.8392157, 1,
-0.1034009, 0.7436128, -1.451805, 0, 1, 0.8431373, 1,
-0.09702568, 0.8965867, -2.056428, 0, 1, 0.8509804, 1,
-0.08494321, -0.9161804, -3.188876, 0, 1, 0.854902, 1,
-0.08265163, -0.03547791, -2.494513, 0, 1, 0.8627451, 1,
-0.07667964, -1.297316, -3.653344, 0, 1, 0.8666667, 1,
-0.07470412, -0.5105545, -2.785671, 0, 1, 0.8745098, 1,
-0.07406364, -0.3144434, -3.014568, 0, 1, 0.8784314, 1,
-0.07324586, -0.8393701, -2.102669, 0, 1, 0.8862745, 1,
-0.07301354, -0.6855316, -5.38418, 0, 1, 0.8901961, 1,
-0.06242308, 1.036292, -0.301586, 0, 1, 0.8980392, 1,
-0.06034104, 0.3833876, 2.78871, 0, 1, 0.9058824, 1,
-0.05465018, -1.508714, -2.231741, 0, 1, 0.9098039, 1,
-0.05244498, -0.7665089, -2.587322, 0, 1, 0.9176471, 1,
-0.05235577, 1.392846, -0.2500918, 0, 1, 0.9215686, 1,
-0.04773807, -0.770321, -3.039882, 0, 1, 0.9294118, 1,
-0.04538343, 0.1120214, 1.362188, 0, 1, 0.9333333, 1,
-0.03857445, 0.8460351, -0.5946306, 0, 1, 0.9411765, 1,
-0.03850423, -0.1069252, -2.60487, 0, 1, 0.945098, 1,
-0.0261343, 0.1614217, 1.862947, 0, 1, 0.9529412, 1,
-0.02518323, -1.450858, -3.381651, 0, 1, 0.9568627, 1,
-0.02307092, 0.1382623, -0.7826824, 0, 1, 0.9647059, 1,
-0.02283216, 0.2438286, -0.8815433, 0, 1, 0.9686275, 1,
-0.01963798, 0.6229019, -0.8482908, 0, 1, 0.9764706, 1,
-0.0192747, 0.9063362, -1.437393, 0, 1, 0.9803922, 1,
-0.01857142, -1.444563, -1.343969, 0, 1, 0.9882353, 1,
-0.01586821, 1.97726, -0.7853369, 0, 1, 0.9921569, 1,
-0.01556593, -0.5751787, -2.196756, 0, 1, 1, 1,
-0.01551572, 1.749668, 0.04404571, 0, 0.9921569, 1, 1,
-0.01528717, 2.382684, -0.3453045, 0, 0.9882353, 1, 1,
-0.01293554, -0.4861884, -3.996977, 0, 0.9803922, 1, 1,
-0.01230828, 0.2563871, -0.05012489, 0, 0.9764706, 1, 1,
-0.005810816, 0.7243271, -2.011533, 0, 0.9686275, 1, 1,
-0.004212305, -0.1164364, -2.886529, 0, 0.9647059, 1, 1,
-0.002248879, -0.742317, -4.583188, 0, 0.9568627, 1, 1,
0.002739386, -0.4127003, 3.332142, 0, 0.9529412, 1, 1,
0.003358788, -0.04775405, 3.541645, 0, 0.945098, 1, 1,
0.007313033, -0.9333272, 2.532824, 0, 0.9411765, 1, 1,
0.01093232, 0.4502128, -0.5994079, 0, 0.9333333, 1, 1,
0.01302957, -1.036455, 3.06054, 0, 0.9294118, 1, 1,
0.01601624, 1.479372, 0.3425911, 0, 0.9215686, 1, 1,
0.01719237, 0.2686473, 0.4378812, 0, 0.9176471, 1, 1,
0.01887774, 0.01720728, 2.142059, 0, 0.9098039, 1, 1,
0.02006098, -0.7542468, 1.740997, 0, 0.9058824, 1, 1,
0.02018263, 1.825201, -0.3058761, 0, 0.8980392, 1, 1,
0.02870034, 0.2967739, -1.207133, 0, 0.8901961, 1, 1,
0.02897508, -2.019294, 4.186176, 0, 0.8862745, 1, 1,
0.03153899, -1.473958, 1.759977, 0, 0.8784314, 1, 1,
0.03546006, -0.901601, 2.712977, 0, 0.8745098, 1, 1,
0.03721206, 2.672209, -1.749492, 0, 0.8666667, 1, 1,
0.03764357, 0.7027814, -0.09310309, 0, 0.8627451, 1, 1,
0.04111575, 0.5467417, -0.08300991, 0, 0.854902, 1, 1,
0.04153885, -0.6054445, 3.120914, 0, 0.8509804, 1, 1,
0.04239371, 0.1634487, 0.1837175, 0, 0.8431373, 1, 1,
0.04507432, 0.9891332, 1.185246, 0, 0.8392157, 1, 1,
0.04526522, -1.622448, 4.135745, 0, 0.8313726, 1, 1,
0.05128789, 0.3200055, 0.8792367, 0, 0.827451, 1, 1,
0.05241398, 0.3120444, 0.2336071, 0, 0.8196079, 1, 1,
0.05331658, 0.5098727, 0.5132435, 0, 0.8156863, 1, 1,
0.06081069, 2.661864, 0.5857415, 0, 0.8078431, 1, 1,
0.06390808, 0.2776701, 1.111156, 0, 0.8039216, 1, 1,
0.07507949, -0.4418097, 3.106475, 0, 0.7960784, 1, 1,
0.07532688, -0.2441514, 3.723697, 0, 0.7882353, 1, 1,
0.08202415, 0.9429327, 2.624555, 0, 0.7843137, 1, 1,
0.08321904, 1.542838, -0.4499504, 0, 0.7764706, 1, 1,
0.08326492, -0.2856075, 4.321941, 0, 0.772549, 1, 1,
0.08442516, 0.6109056, 0.2589615, 0, 0.7647059, 1, 1,
0.08453114, 1.254316, 1.441627, 0, 0.7607843, 1, 1,
0.08554575, -0.2292325, 1.226617, 0, 0.7529412, 1, 1,
0.08579634, -0.6581586, 2.189493, 0, 0.7490196, 1, 1,
0.09049135, -0.931284, 3.690085, 0, 0.7411765, 1, 1,
0.09331712, 1.140922, -1.263305, 0, 0.7372549, 1, 1,
0.093789, -1.136109, 3.655866, 0, 0.7294118, 1, 1,
0.09776361, 0.9120127, -0.443553, 0, 0.7254902, 1, 1,
0.09872059, -1.732845, 4.652392, 0, 0.7176471, 1, 1,
0.0989224, 1.540769, -0.2977214, 0, 0.7137255, 1, 1,
0.09946437, 0.7630197, 1.140749, 0, 0.7058824, 1, 1,
0.1017243, -0.752857, 2.415058, 0, 0.6980392, 1, 1,
0.1026923, -0.05319469, 2.394589, 0, 0.6941177, 1, 1,
0.1081275, -1.018639, 2.471292, 0, 0.6862745, 1, 1,
0.1102769, -3.249726, 3.840451, 0, 0.682353, 1, 1,
0.1120353, 0.4591243, 1.275487, 0, 0.6745098, 1, 1,
0.1166851, -0.8993457, 4.993785, 0, 0.6705883, 1, 1,
0.1175048, -1.089663, 2.317827, 0, 0.6627451, 1, 1,
0.1234481, 0.4552252, -1.100631, 0, 0.6588235, 1, 1,
0.1253092, 0.5727229, -0.5380061, 0, 0.6509804, 1, 1,
0.13048, 1.783219, -0.03619323, 0, 0.6470588, 1, 1,
0.1309248, 1.145643, -0.05396211, 0, 0.6392157, 1, 1,
0.1356962, 0.6141062, -0.4682702, 0, 0.6352941, 1, 1,
0.1362683, 1.741873, 1.013332, 0, 0.627451, 1, 1,
0.1374323, 0.8157845, 0.06951997, 0, 0.6235294, 1, 1,
0.1397419, 0.6400512, -0.2904111, 0, 0.6156863, 1, 1,
0.1407323, 0.1880265, 0.8433452, 0, 0.6117647, 1, 1,
0.1449908, 0.3730227, 0.7686704, 0, 0.6039216, 1, 1,
0.1504674, -0.1172532, 1.88444, 0, 0.5960785, 1, 1,
0.1506117, -0.0599637, 1.626024, 0, 0.5921569, 1, 1,
0.1529142, -1.841616, 1.631126, 0, 0.5843138, 1, 1,
0.1531795, 1.347801, -0.2133574, 0, 0.5803922, 1, 1,
0.1532046, -0.243412, 2.13456, 0, 0.572549, 1, 1,
0.1555643, -1.536924, 0.9955713, 0, 0.5686275, 1, 1,
0.1603781, -1.374823, 3.027973, 0, 0.5607843, 1, 1,
0.1620098, 0.3011687, -0.6593974, 0, 0.5568628, 1, 1,
0.1625682, 0.1069668, 1.330834, 0, 0.5490196, 1, 1,
0.1653141, 1.338983, -0.274649, 0, 0.5450981, 1, 1,
0.165408, -0.583193, 1.258687, 0, 0.5372549, 1, 1,
0.1668979, 0.3787709, -0.9939653, 0, 0.5333334, 1, 1,
0.1672634, 0.1601896, 0.998858, 0, 0.5254902, 1, 1,
0.1740169, -0.5985724, 3.296605, 0, 0.5215687, 1, 1,
0.1833098, 0.2843279, 0.1934767, 0, 0.5137255, 1, 1,
0.1844967, 0.9542563, 1.746651, 0, 0.509804, 1, 1,
0.1851697, 0.7407718, 0.4325416, 0, 0.5019608, 1, 1,
0.190824, 0.05316591, 1.428124, 0, 0.4941176, 1, 1,
0.1916905, 1.496433, -1.403644, 0, 0.4901961, 1, 1,
0.1927958, -0.3773265, 1.877035, 0, 0.4823529, 1, 1,
0.1983, -0.6070849, 2.444211, 0, 0.4784314, 1, 1,
0.1998948, 0.9107081, -0.4100078, 0, 0.4705882, 1, 1,
0.20281, 0.4781322, 0.9635643, 0, 0.4666667, 1, 1,
0.2071413, -0.7008914, 1.992704, 0, 0.4588235, 1, 1,
0.2087703, 1.193459, -0.1138453, 0, 0.454902, 1, 1,
0.2156176, 1.346607, 0.5428697, 0, 0.4470588, 1, 1,
0.2161194, 0.7451367, 0.727451, 0, 0.4431373, 1, 1,
0.2189956, -0.4370104, 1.744412, 0, 0.4352941, 1, 1,
0.2212931, 0.9455809, -1.511566, 0, 0.4313726, 1, 1,
0.2229147, 1.165993, -1.138024, 0, 0.4235294, 1, 1,
0.225158, -2.547441, 4.611931, 0, 0.4196078, 1, 1,
0.2333059, -0.7207833, 2.312344, 0, 0.4117647, 1, 1,
0.2336065, 0.08470944, 0.3364919, 0, 0.4078431, 1, 1,
0.2353728, -1.612339, 1.807923, 0, 0.4, 1, 1,
0.2358565, 1.513062, -0.4711586, 0, 0.3921569, 1, 1,
0.2361204, -1.872682, 2.627506, 0, 0.3882353, 1, 1,
0.2383638, -0.8286394, 2.758519, 0, 0.3803922, 1, 1,
0.238423, 1.165574, 0.2216175, 0, 0.3764706, 1, 1,
0.239941, 0.1171084, 1.451914, 0, 0.3686275, 1, 1,
0.2408682, -0.9212219, 3.210694, 0, 0.3647059, 1, 1,
0.2415276, 0.4831208, -1.908572, 0, 0.3568628, 1, 1,
0.2451619, 0.4857344, 0.4385407, 0, 0.3529412, 1, 1,
0.2477404, 0.7175514, -0.513397, 0, 0.345098, 1, 1,
0.2556797, -0.3914414, 2.823529, 0, 0.3411765, 1, 1,
0.2666786, 1.137553, 0.8462688, 0, 0.3333333, 1, 1,
0.2702961, -1.553287, 3.047733, 0, 0.3294118, 1, 1,
0.2730693, -0.1863605, 1.379687, 0, 0.3215686, 1, 1,
0.281547, 0.6342959, 0.05843829, 0, 0.3176471, 1, 1,
0.2818635, 0.4270536, 1.010416, 0, 0.3098039, 1, 1,
0.2848796, 0.09758934, 0.6270412, 0, 0.3058824, 1, 1,
0.2902091, -2.114521, 2.184686, 0, 0.2980392, 1, 1,
0.2911883, 1.062398, -2.770595, 0, 0.2901961, 1, 1,
0.291881, 0.7565557, 0.3251481, 0, 0.2862745, 1, 1,
0.2947585, 1.369897, 1.404027, 0, 0.2784314, 1, 1,
0.2994426, -1.291395, 4.260504, 0, 0.2745098, 1, 1,
0.301319, -0.6007481, 1.323542, 0, 0.2666667, 1, 1,
0.3051358, 1.362089, -0.4280209, 0, 0.2627451, 1, 1,
0.3141137, 0.04063307, 1.612399, 0, 0.254902, 1, 1,
0.3152754, -0.109051, 2.027952, 0, 0.2509804, 1, 1,
0.3166031, -0.08845649, -0.09102203, 0, 0.2431373, 1, 1,
0.3195705, -0.4424049, 3.486344, 0, 0.2392157, 1, 1,
0.3208826, 1.203521, -1.42707, 0, 0.2313726, 1, 1,
0.3211949, 0.2996138, -0.2874496, 0, 0.227451, 1, 1,
0.3260495, 0.08192016, 0.8592342, 0, 0.2196078, 1, 1,
0.3300524, 0.4293029, 0.6902245, 0, 0.2156863, 1, 1,
0.3368632, 0.8107397, 1.216991, 0, 0.2078431, 1, 1,
0.3387084, 1.047647, -1.633198, 0, 0.2039216, 1, 1,
0.339578, 1.288766, 1.210172, 0, 0.1960784, 1, 1,
0.3396729, -0.4644041, 3.733252, 0, 0.1882353, 1, 1,
0.3434074, -0.7265472, 2.179385, 0, 0.1843137, 1, 1,
0.3465377, -0.9443249, 4.491018, 0, 0.1764706, 1, 1,
0.351245, -0.1991789, 2.444315, 0, 0.172549, 1, 1,
0.3538466, -0.001645145, 1.878018, 0, 0.1647059, 1, 1,
0.3539386, -0.4439352, 3.163681, 0, 0.1607843, 1, 1,
0.3546003, 0.1118096, 0.1218056, 0, 0.1529412, 1, 1,
0.3556083, -1.794099, 3.708691, 0, 0.1490196, 1, 1,
0.3604126, -0.1384078, 1.09758, 0, 0.1411765, 1, 1,
0.3635117, 1.569223, 0.3097251, 0, 0.1372549, 1, 1,
0.3641771, 1.046747, 0.5899743, 0, 0.1294118, 1, 1,
0.3654441, -0.4932821, 1.842913, 0, 0.1254902, 1, 1,
0.374772, -0.03184846, 1.560963, 0, 0.1176471, 1, 1,
0.3751108, 0.4022641, 0.870715, 0, 0.1137255, 1, 1,
0.3765735, -1.174085, 4.167256, 0, 0.1058824, 1, 1,
0.3768957, 1.689712, 1.268978, 0, 0.09803922, 1, 1,
0.3794359, 0.3507177, 2.226977, 0, 0.09411765, 1, 1,
0.380449, 1.649911, 0.465261, 0, 0.08627451, 1, 1,
0.3827718, -0.1384169, 3.784609, 0, 0.08235294, 1, 1,
0.3834071, -0.4106354, 2.276796, 0, 0.07450981, 1, 1,
0.3837383, 0.4862713, 0.6391495, 0, 0.07058824, 1, 1,
0.3845153, 0.5776388, 1.891259, 0, 0.0627451, 1, 1,
0.3898343, 0.8225963, 1.5316, 0, 0.05882353, 1, 1,
0.3926972, 0.4509838, 1.154886, 0, 0.05098039, 1, 1,
0.3938109, -0.1627559, 4.098234, 0, 0.04705882, 1, 1,
0.3965356, 0.7754311, 0.4159186, 0, 0.03921569, 1, 1,
0.3968974, 0.8557051, -1.866038, 0, 0.03529412, 1, 1,
0.3974432, -1.436446, 2.327751, 0, 0.02745098, 1, 1,
0.4029966, 0.4013531, 0.3152826, 0, 0.02352941, 1, 1,
0.403073, -0.4425563, 4.088904, 0, 0.01568628, 1, 1,
0.4056215, -0.236102, 3.801276, 0, 0.01176471, 1, 1,
0.4117196, -1.461663, 4.662914, 0, 0.003921569, 1, 1,
0.4123864, 0.08592967, 0.1740099, 0.003921569, 0, 1, 1,
0.4151671, -0.4286382, 3.045866, 0.007843138, 0, 1, 1,
0.4178274, 0.04111358, 2.266712, 0.01568628, 0, 1, 1,
0.4188738, 0.2097711, -0.07275479, 0.01960784, 0, 1, 1,
0.4212855, -0.4644715, 2.21198, 0.02745098, 0, 1, 1,
0.4265958, 0.8783951, 0.3381149, 0.03137255, 0, 1, 1,
0.4359041, 1.400392, 0.1576511, 0.03921569, 0, 1, 1,
0.4373673, 0.6696646, 1.387329, 0.04313726, 0, 1, 1,
0.4418788, -0.6085446, 2.485441, 0.05098039, 0, 1, 1,
0.4461093, 1.073179, -0.3510884, 0.05490196, 0, 1, 1,
0.45055, 0.4254449, 1.407637, 0.0627451, 0, 1, 1,
0.455007, 0.3039557, 1.107548, 0.06666667, 0, 1, 1,
0.4550622, -2.255596, 1.718651, 0.07450981, 0, 1, 1,
0.4617723, 0.1800511, 1.885841, 0.07843138, 0, 1, 1,
0.4633441, 0.3395923, 1.056813, 0.08627451, 0, 1, 1,
0.4671355, -0.8639151, -0.3090727, 0.09019608, 0, 1, 1,
0.4697938, 1.571147, -0.9077972, 0.09803922, 0, 1, 1,
0.4730724, -0.398562, 2.601789, 0.1058824, 0, 1, 1,
0.4733447, -0.5597367, 0.6430884, 0.1098039, 0, 1, 1,
0.4746397, 0.617543, 0.9053696, 0.1176471, 0, 1, 1,
0.4782402, -0.4082302, 2.161748, 0.1215686, 0, 1, 1,
0.4802245, -0.6538473, 4.506077, 0.1294118, 0, 1, 1,
0.4816014, -0.5698138, 3.219059, 0.1333333, 0, 1, 1,
0.4861896, -0.7432463, 3.823378, 0.1411765, 0, 1, 1,
0.4873796, 0.5025779, 2.30452, 0.145098, 0, 1, 1,
0.4899719, 0.5936732, -0.3199411, 0.1529412, 0, 1, 1,
0.4950775, 0.4200565, -0.7457793, 0.1568628, 0, 1, 1,
0.4963352, -0.7711992, 3.575268, 0.1647059, 0, 1, 1,
0.4990313, -0.6845311, 0.8886501, 0.1686275, 0, 1, 1,
0.5061895, 1.40544, 2.116541, 0.1764706, 0, 1, 1,
0.5067702, 0.04701022, -0.2519652, 0.1803922, 0, 1, 1,
0.5126951, -0.4603329, 1.181547, 0.1882353, 0, 1, 1,
0.5137815, -1.322153, 2.537531, 0.1921569, 0, 1, 1,
0.5141073, 0.1899219, -0.7714971, 0.2, 0, 1, 1,
0.5146745, -1.997969, 3.344034, 0.2078431, 0, 1, 1,
0.5181065, -1.875443, 2.476324, 0.2117647, 0, 1, 1,
0.5189555, 0.4525094, 1.220226, 0.2196078, 0, 1, 1,
0.5247681, -0.06247275, 1.315524, 0.2235294, 0, 1, 1,
0.5254642, 0.5833176, 0.5774748, 0.2313726, 0, 1, 1,
0.5271705, 0.2499891, -0.07625169, 0.2352941, 0, 1, 1,
0.5291714, -2.161963, 2.740356, 0.2431373, 0, 1, 1,
0.5372128, 1.52321, -0.2055368, 0.2470588, 0, 1, 1,
0.542129, 0.5217623, 2.213445, 0.254902, 0, 1, 1,
0.5462518, 1.020267, 1.324484, 0.2588235, 0, 1, 1,
0.5521539, 0.997528, 0.8206266, 0.2666667, 0, 1, 1,
0.5522639, 1.184926, 2.190292, 0.2705882, 0, 1, 1,
0.5613554, 0.7825735, -0.3913206, 0.2784314, 0, 1, 1,
0.5613619, 1.23256, 0.2485192, 0.282353, 0, 1, 1,
0.5627326, 1.449089, 1.846828, 0.2901961, 0, 1, 1,
0.5644919, 2.305133, 0.2638704, 0.2941177, 0, 1, 1,
0.5789756, 2.005189, -0.6661085, 0.3019608, 0, 1, 1,
0.5805303, 0.07400533, 1.86557, 0.3098039, 0, 1, 1,
0.5815966, -1.892606, 4.58985, 0.3137255, 0, 1, 1,
0.5849676, 1.091999, 0.160592, 0.3215686, 0, 1, 1,
0.5905545, 0.1023317, 2.97976, 0.3254902, 0, 1, 1,
0.5909086, -0.2948395, 1.779899, 0.3333333, 0, 1, 1,
0.5946473, 1.923454, 2.092969, 0.3372549, 0, 1, 1,
0.5955624, -1.886099, 2.799706, 0.345098, 0, 1, 1,
0.5991235, 2.1236, 1.281052, 0.3490196, 0, 1, 1,
0.5992208, 0.4295901, 0.4724582, 0.3568628, 0, 1, 1,
0.6002545, -0.8667729, 2.066945, 0.3607843, 0, 1, 1,
0.6026363, -0.6990782, 3.731276, 0.3686275, 0, 1, 1,
0.6058629, -0.2671957, 2.309325, 0.372549, 0, 1, 1,
0.6073326, -0.5500914, 1.948512, 0.3803922, 0, 1, 1,
0.609897, 0.4585137, 0.7673082, 0.3843137, 0, 1, 1,
0.6129498, 1.19951, 0.1572044, 0.3921569, 0, 1, 1,
0.6153975, -0.1713209, 1.681986, 0.3960784, 0, 1, 1,
0.6160629, -0.1463485, 2.838628, 0.4039216, 0, 1, 1,
0.6168129, 0.2097593, 0.944922, 0.4117647, 0, 1, 1,
0.6173049, 0.2377587, 1.987941, 0.4156863, 0, 1, 1,
0.6186681, 0.1211613, 0.912787, 0.4235294, 0, 1, 1,
0.6195072, 0.7591005, -1.162488, 0.427451, 0, 1, 1,
0.6209452, 0.4656839, 1.025195, 0.4352941, 0, 1, 1,
0.6292979, 0.1924379, 2.362568, 0.4392157, 0, 1, 1,
0.6304281, -0.6629847, 3.2977, 0.4470588, 0, 1, 1,
0.6345592, 0.1189532, -0.005236243, 0.4509804, 0, 1, 1,
0.6350636, -0.437203, 1.465804, 0.4588235, 0, 1, 1,
0.6355616, -0.6341382, 1.618181, 0.4627451, 0, 1, 1,
0.6404203, -0.531708, 2.588877, 0.4705882, 0, 1, 1,
0.6458979, 1.147252, -0.4982524, 0.4745098, 0, 1, 1,
0.6472892, 2.452112, 0.46005, 0.4823529, 0, 1, 1,
0.6475686, 0.3283591, 0.7866821, 0.4862745, 0, 1, 1,
0.6492024, 0.1275556, 1.750485, 0.4941176, 0, 1, 1,
0.6564758, 0.945496, 0.4031699, 0.5019608, 0, 1, 1,
0.6576849, 0.8240345, 0.120205, 0.5058824, 0, 1, 1,
0.6587653, 0.5935495, 0.666605, 0.5137255, 0, 1, 1,
0.6634989, -1.156318, 0.269749, 0.5176471, 0, 1, 1,
0.6657085, 0.3755631, 1.514684, 0.5254902, 0, 1, 1,
0.6741223, -1.177137, 2.61997, 0.5294118, 0, 1, 1,
0.6742027, 0.07399008, 0.6739743, 0.5372549, 0, 1, 1,
0.6811258, -1.205892, 1.79837, 0.5411765, 0, 1, 1,
0.6842553, -0.08895353, 0.08316839, 0.5490196, 0, 1, 1,
0.684388, 0.6848561, 0.9204502, 0.5529412, 0, 1, 1,
0.6849884, -0.4398372, 1.236579, 0.5607843, 0, 1, 1,
0.6854485, 0.518976, 0.374601, 0.5647059, 0, 1, 1,
0.6919976, 0.3088722, 0.06751071, 0.572549, 0, 1, 1,
0.6920069, -0.2524749, 0.00803527, 0.5764706, 0, 1, 1,
0.6957323, 0.3219573, 0.98672, 0.5843138, 0, 1, 1,
0.6960508, -1.049533, 2.886422, 0.5882353, 0, 1, 1,
0.6990617, -0.123642, 2.130434, 0.5960785, 0, 1, 1,
0.7003918, 0.494849, -1.4603, 0.6039216, 0, 1, 1,
0.707542, -0.4322444, 2.807157, 0.6078432, 0, 1, 1,
0.7090321, -1.140633, 2.342043, 0.6156863, 0, 1, 1,
0.7126871, 0.1036536, 2.891658, 0.6196079, 0, 1, 1,
0.712798, 0.4883832, 1.150557, 0.627451, 0, 1, 1,
0.712956, -2.02534, 0.9287748, 0.6313726, 0, 1, 1,
0.7169665, -0.5643524, 2.375054, 0.6392157, 0, 1, 1,
0.7215638, 0.03801403, 0.7923896, 0.6431373, 0, 1, 1,
0.7221335, 1.689692, 0.1210997, 0.6509804, 0, 1, 1,
0.7264436, -1.560505, 2.869732, 0.654902, 0, 1, 1,
0.7265887, -0.1934575, 2.510283, 0.6627451, 0, 1, 1,
0.7325405, -0.005900966, 1.344025, 0.6666667, 0, 1, 1,
0.7349933, -0.4011275, 2.573006, 0.6745098, 0, 1, 1,
0.7400563, 0.550114, 2.285201, 0.6784314, 0, 1, 1,
0.7411582, -1.733968, 3.542444, 0.6862745, 0, 1, 1,
0.7521299, 1.96193, 0.6170204, 0.6901961, 0, 1, 1,
0.7532243, 0.9150484, 1.069996, 0.6980392, 0, 1, 1,
0.7561791, -0.04832549, 1.602536, 0.7058824, 0, 1, 1,
0.759196, 1.479495, 0.8931113, 0.7098039, 0, 1, 1,
0.7614584, -0.2202194, 0.7015773, 0.7176471, 0, 1, 1,
0.7662913, 1.299005, -0.7383699, 0.7215686, 0, 1, 1,
0.7697803, -1.470971, 3.842116, 0.7294118, 0, 1, 1,
0.7731105, 0.3023199, 0.803264, 0.7333333, 0, 1, 1,
0.7731311, -1.066396, 3.234647, 0.7411765, 0, 1, 1,
0.7767033, 0.2676076, 0.7741429, 0.7450981, 0, 1, 1,
0.7797475, -0.8818339, 1.909012, 0.7529412, 0, 1, 1,
0.7841312, 1.472589, 3.077494, 0.7568628, 0, 1, 1,
0.786768, 0.3659417, -0.4684987, 0.7647059, 0, 1, 1,
0.7891225, -1.018651, 2.254477, 0.7686275, 0, 1, 1,
0.7924974, 1.122064, -0.2551307, 0.7764706, 0, 1, 1,
0.7937837, 0.1658299, 0.5186875, 0.7803922, 0, 1, 1,
0.8051118, -0.08285001, 0.5280738, 0.7882353, 0, 1, 1,
0.8057393, -0.1559661, 1.260833, 0.7921569, 0, 1, 1,
0.8073962, -0.3863255, 1.957741, 0.8, 0, 1, 1,
0.8074865, -0.5313962, 2.538958, 0.8078431, 0, 1, 1,
0.8084599, 0.5735608, 0.7752559, 0.8117647, 0, 1, 1,
0.8113601, -0.5851067, 2.14073, 0.8196079, 0, 1, 1,
0.8118117, -1.00946, 2.894498, 0.8235294, 0, 1, 1,
0.8128934, 0.2392756, 0.06054654, 0.8313726, 0, 1, 1,
0.8152816, -0.6143242, 4.17436, 0.8352941, 0, 1, 1,
0.8215164, 0.9263008, -0.8806896, 0.8431373, 0, 1, 1,
0.8225896, 0.9652373, -0.6806161, 0.8470588, 0, 1, 1,
0.8248787, -0.8204008, 1.957872, 0.854902, 0, 1, 1,
0.8266677, -0.08910324, 3.306436, 0.8588235, 0, 1, 1,
0.8270442, 0.2616492, 0.2615041, 0.8666667, 0, 1, 1,
0.8304527, 1.657897, 0.8150775, 0.8705882, 0, 1, 1,
0.8323017, -0.7594219, 2.958695, 0.8784314, 0, 1, 1,
0.835907, 0.06312239, 1.116362, 0.8823529, 0, 1, 1,
0.8365425, -0.6317971, 2.418514, 0.8901961, 0, 1, 1,
0.8474945, -0.1439754, 2.039725, 0.8941177, 0, 1, 1,
0.8503788, 0.3031692, 2.340786, 0.9019608, 0, 1, 1,
0.850479, -0.3212051, 1.927924, 0.9098039, 0, 1, 1,
0.8580764, 0.6756898, 1.548959, 0.9137255, 0, 1, 1,
0.86494, 1.095382, 0.2224333, 0.9215686, 0, 1, 1,
0.8652137, 0.1446257, 1.200747, 0.9254902, 0, 1, 1,
0.8685245, 0.02739233, 2.112082, 0.9333333, 0, 1, 1,
0.8746294, 0.3356272, 0.7311372, 0.9372549, 0, 1, 1,
0.8800502, 1.648335, -1.442501, 0.945098, 0, 1, 1,
0.8899589, 0.5605934, 1.4936, 0.9490196, 0, 1, 1,
0.8918354, -0.8477182, 6.100502, 0.9568627, 0, 1, 1,
0.8965445, 0.06015906, 0.8874811, 0.9607843, 0, 1, 1,
0.9012167, -1.089558, 4.01509, 0.9686275, 0, 1, 1,
0.9040682, -0.8419315, 3.378503, 0.972549, 0, 1, 1,
0.9108887, -0.03567159, 1.521675, 0.9803922, 0, 1, 1,
0.9121135, -0.1477044, 2.009117, 0.9843137, 0, 1, 1,
0.9124956, -2.056852, 3.763282, 0.9921569, 0, 1, 1,
0.9126552, -0.7460773, 2.570228, 0.9960784, 0, 1, 1,
0.9150607, 1.04326, 0.4142187, 1, 0, 0.9960784, 1,
0.9221298, 0.1748185, 0.3704472, 1, 0, 0.9882353, 1,
0.9250184, -0.8732297, 1.551198, 1, 0, 0.9843137, 1,
0.9267799, 0.1810308, 1.595598, 1, 0, 0.9764706, 1,
0.9343808, 1.159273, 1.242334, 1, 0, 0.972549, 1,
0.934661, -0.7428409, 3.146728, 1, 0, 0.9647059, 1,
0.9380305, -1.543276, 2.395875, 1, 0, 0.9607843, 1,
0.9415963, -1.381387, 1.951218, 1, 0, 0.9529412, 1,
0.9454119, -0.36373, 1.889307, 1, 0, 0.9490196, 1,
0.950771, -0.3014738, 0.9367954, 1, 0, 0.9411765, 1,
0.9551058, 0.9386318, 0.6095068, 1, 0, 0.9372549, 1,
0.9635274, 0.2898858, 0.1264677, 1, 0, 0.9294118, 1,
0.9725326, 0.1647983, 1.261531, 1, 0, 0.9254902, 1,
0.9727403, 0.5122825, 2.412249, 1, 0, 0.9176471, 1,
0.9738644, -0.9757417, 1.364719, 1, 0, 0.9137255, 1,
0.9745005, 1.861127, 1.296605, 1, 0, 0.9058824, 1,
0.9774405, 0.1311123, 0.6550969, 1, 0, 0.9019608, 1,
0.9809318, -0.1095356, 1.4755, 1, 0, 0.8941177, 1,
0.9811751, 1.628112, -0.8411295, 1, 0, 0.8862745, 1,
0.992474, -1.839048, 1.970496, 1, 0, 0.8823529, 1,
0.9973852, -0.2106734, 2.292344, 1, 0, 0.8745098, 1,
0.9984624, -0.86945, 1.952849, 1, 0, 0.8705882, 1,
1.003513, -1.504249, 1.531519, 1, 0, 0.8627451, 1,
1.010981, 0.1793085, 0.2036592, 1, 0, 0.8588235, 1,
1.011049, 0.1136088, 0.2250861, 1, 0, 0.8509804, 1,
1.011599, 0.6045619, 2.201675, 1, 0, 0.8470588, 1,
1.012277, -1.313847, 5.153502, 1, 0, 0.8392157, 1,
1.013499, 0.2347465, 0.5740345, 1, 0, 0.8352941, 1,
1.013943, 1.479611, 0.5575352, 1, 0, 0.827451, 1,
1.018382, 0.9804646, 0.6071187, 1, 0, 0.8235294, 1,
1.022997, -0.03399925, 0.1463308, 1, 0, 0.8156863, 1,
1.02433, -0.7759435, 2.811019, 1, 0, 0.8117647, 1,
1.028022, -1.997379, 1.799478, 1, 0, 0.8039216, 1,
1.029842, -0.2057351, 0.8271453, 1, 0, 0.7960784, 1,
1.037006, 1.022717, 0.1785736, 1, 0, 0.7921569, 1,
1.042987, -1.578829, 2.787567, 1, 0, 0.7843137, 1,
1.044032, -0.222775, 1.664615, 1, 0, 0.7803922, 1,
1.04414, 0.324524, 1.78088, 1, 0, 0.772549, 1,
1.044268, -0.4183577, 3.011474, 1, 0, 0.7686275, 1,
1.048539, 1.074299, 2.425042, 1, 0, 0.7607843, 1,
1.052076, -0.7008523, 2.372752, 1, 0, 0.7568628, 1,
1.055378, 1.230216, 1.88837, 1, 0, 0.7490196, 1,
1.063915, -1.366919, 0.8376379, 1, 0, 0.7450981, 1,
1.073738, -2.073108, 1.450526, 1, 0, 0.7372549, 1,
1.075397, -0.1018252, 2.558786, 1, 0, 0.7333333, 1,
1.079108, -0.722991, 1.335992, 1, 0, 0.7254902, 1,
1.094144, 0.00854517, -0.3657133, 1, 0, 0.7215686, 1,
1.096105, -0.946624, 3.836759, 1, 0, 0.7137255, 1,
1.103441, -1.132475, 2.130921, 1, 0, 0.7098039, 1,
1.1043, -0.2371009, 1.682462, 1, 0, 0.7019608, 1,
1.112185, 1.361347, -0.1684855, 1, 0, 0.6941177, 1,
1.11581, 0.3479314, 1.551572, 1, 0, 0.6901961, 1,
1.125896, -0.9653646, 2.075803, 1, 0, 0.682353, 1,
1.128201, -0.765896, 1.626488, 1, 0, 0.6784314, 1,
1.133151, -0.4179377, 2.681671, 1, 0, 0.6705883, 1,
1.13793, -0.2813049, 2.839569, 1, 0, 0.6666667, 1,
1.140785, 1.498017, 0.3906613, 1, 0, 0.6588235, 1,
1.145639, -1.991822, 4.440851, 1, 0, 0.654902, 1,
1.156904, 1.182353, 0.2205455, 1, 0, 0.6470588, 1,
1.160233, 0.6997477, 2.1747, 1, 0, 0.6431373, 1,
1.165387, 0.3733311, 0.3437636, 1, 0, 0.6352941, 1,
1.167238, -1.210643, 2.658585, 1, 0, 0.6313726, 1,
1.169472, -1.447637, 1.043598, 1, 0, 0.6235294, 1,
1.170275, -1.477818, 3.296788, 1, 0, 0.6196079, 1,
1.184024, -0.1317822, 3.005199, 1, 0, 0.6117647, 1,
1.184512, 0.1493073, 1.638759, 1, 0, 0.6078432, 1,
1.187331, 1.008426, 0.457855, 1, 0, 0.6, 1,
1.191434, -0.04120646, 2.021597, 1, 0, 0.5921569, 1,
1.192124, 1.040695, 0.6684644, 1, 0, 0.5882353, 1,
1.19372, -1.468852, 0.8246372, 1, 0, 0.5803922, 1,
1.200022, -1.163083, 1.814264, 1, 0, 0.5764706, 1,
1.222371, -0.4447586, 3.018835, 1, 0, 0.5686275, 1,
1.225538, 1.181014, 0.6627504, 1, 0, 0.5647059, 1,
1.22684, -0.2026026, 0.7205507, 1, 0, 0.5568628, 1,
1.228108, -0.7765974, 2.623068, 1, 0, 0.5529412, 1,
1.231548, -0.4048202, 1.861717, 1, 0, 0.5450981, 1,
1.247479, -1.748945, 2.601975, 1, 0, 0.5411765, 1,
1.251166, -1.232779, 0.6662284, 1, 0, 0.5333334, 1,
1.2549, 0.02323608, 2.660167, 1, 0, 0.5294118, 1,
1.262348, 0.3479232, 2.691933, 1, 0, 0.5215687, 1,
1.265516, -0.9172121, 2.176033, 1, 0, 0.5176471, 1,
1.275177, 0.2411383, 2.293115, 1, 0, 0.509804, 1,
1.287445, 0.08563594, -0.4441629, 1, 0, 0.5058824, 1,
1.287826, 0.4891073, 0.06153781, 1, 0, 0.4980392, 1,
1.288452, -0.01361208, 0.7903348, 1, 0, 0.4901961, 1,
1.290426, 0.2416216, 0.9202248, 1, 0, 0.4862745, 1,
1.304356, 0.4294288, 1.980173, 1, 0, 0.4784314, 1,
1.309293, -0.2385495, 0.5948473, 1, 0, 0.4745098, 1,
1.31335, -0.2281298, 1.135537, 1, 0, 0.4666667, 1,
1.335783, -1.024968, 1.680721, 1, 0, 0.4627451, 1,
1.337698, 1.315422, 1.529564, 1, 0, 0.454902, 1,
1.345232, -0.04820926, 1.048571, 1, 0, 0.4509804, 1,
1.355357, 0.5024968, 0.7407293, 1, 0, 0.4431373, 1,
1.364072, 0.328817, -0.688606, 1, 0, 0.4392157, 1,
1.364279, 0.5437226, 0.3806597, 1, 0, 0.4313726, 1,
1.385102, 1.085151, 1.489037, 1, 0, 0.427451, 1,
1.386021, 1.381756, 0.642266, 1, 0, 0.4196078, 1,
1.391275, 0.8593442, 0.3108904, 1, 0, 0.4156863, 1,
1.395482, -1.205986, 2.42563, 1, 0, 0.4078431, 1,
1.395723, -0.1819597, 1.337975, 1, 0, 0.4039216, 1,
1.403133, 0.1571166, 0.4854404, 1, 0, 0.3960784, 1,
1.403842, 2.263478, 1.586763, 1, 0, 0.3882353, 1,
1.409094, 0.07177728, 1.392238, 1, 0, 0.3843137, 1,
1.417555, -2.807817, 3.184349, 1, 0, 0.3764706, 1,
1.421258, -1.239188, 2.428006, 1, 0, 0.372549, 1,
1.426404, 0.5658782, 1.611061, 1, 0, 0.3647059, 1,
1.432834, 0.409647, 1.421358, 1, 0, 0.3607843, 1,
1.433831, -1.387173, 3.553046, 1, 0, 0.3529412, 1,
1.447908, 0.8957381, 1.545599, 1, 0, 0.3490196, 1,
1.453905, -0.1399796, 2.751651, 1, 0, 0.3411765, 1,
1.454193, 1.308639, -0.5793138, 1, 0, 0.3372549, 1,
1.475736, 0.378856, 1.129421, 1, 0, 0.3294118, 1,
1.478151, -0.3946992, 0.4839958, 1, 0, 0.3254902, 1,
1.47843, 0.7261485, 0.6623819, 1, 0, 0.3176471, 1,
1.511617, 0.404994, 2.622444, 1, 0, 0.3137255, 1,
1.514351, 0.5854437, 0.6328757, 1, 0, 0.3058824, 1,
1.518923, -1.684935, 3.722564, 1, 0, 0.2980392, 1,
1.523476, 0.2856656, -0.3237197, 1, 0, 0.2941177, 1,
1.529411, -0.6958179, 1.882508, 1, 0, 0.2862745, 1,
1.536953, 0.6001745, 1.630084, 1, 0, 0.282353, 1,
1.545121, 0.4631836, -0.6492149, 1, 0, 0.2745098, 1,
1.547191, 0.1780958, 0.9139423, 1, 0, 0.2705882, 1,
1.55073, 0.2110218, 2.475651, 1, 0, 0.2627451, 1,
1.551022, -1.164962, 3.364835, 1, 0, 0.2588235, 1,
1.565551, -1.379117, 1.305424, 1, 0, 0.2509804, 1,
1.568211, -0.3481995, 1.797702, 1, 0, 0.2470588, 1,
1.570309, 0.03096451, 3.38737, 1, 0, 0.2392157, 1,
1.605747, 0.6043113, 0.8280492, 1, 0, 0.2352941, 1,
1.606404, -0.1199142, 1.273535, 1, 0, 0.227451, 1,
1.612553, -0.5314225, 1.904227, 1, 0, 0.2235294, 1,
1.625147, -1.373543, 3.146171, 1, 0, 0.2156863, 1,
1.648907, 2.336433, 0.3837199, 1, 0, 0.2117647, 1,
1.664228, -0.7032326, 0.08747568, 1, 0, 0.2039216, 1,
1.6693, -0.276394, 1.426482, 1, 0, 0.1960784, 1,
1.727796, 0.07349669, 1.59675, 1, 0, 0.1921569, 1,
1.746097, 0.9000842, 1.254067, 1, 0, 0.1843137, 1,
1.774839, -0.7513924, 2.430439, 1, 0, 0.1803922, 1,
1.775518, -0.2466925, 1.404754, 1, 0, 0.172549, 1,
1.788546, 0.1840611, -0.02279673, 1, 0, 0.1686275, 1,
1.802687, -0.4985633, 1.448989, 1, 0, 0.1607843, 1,
1.839306, 1.234835, 1.963906, 1, 0, 0.1568628, 1,
1.846592, 1.710091, 0.04475011, 1, 0, 0.1490196, 1,
1.848073, 2.20646, 0.01376517, 1, 0, 0.145098, 1,
1.901548, 1.453246, 0.8029344, 1, 0, 0.1372549, 1,
1.931089, 0.7982997, 1.323714, 1, 0, 0.1333333, 1,
1.95117, -0.00957376, 0.8861819, 1, 0, 0.1254902, 1,
1.969632, -0.8789636, 1.190546, 1, 0, 0.1215686, 1,
1.986225, 0.9602276, 0.9639219, 1, 0, 0.1137255, 1,
2.013217, -0.2833798, 3.246973, 1, 0, 0.1098039, 1,
2.043161, 0.9558069, 1.686318, 1, 0, 0.1019608, 1,
2.057636, -0.3006245, 3.019527, 1, 0, 0.09411765, 1,
2.132197, 0.69316, 0.7054798, 1, 0, 0.09019608, 1,
2.17363, -0.06795821, 1.402453, 1, 0, 0.08235294, 1,
2.176713, -0.5691643, 0.8551604, 1, 0, 0.07843138, 1,
2.27228, 0.964696, 0.7108363, 1, 0, 0.07058824, 1,
2.298627, -0.2174424, 0.5377132, 1, 0, 0.06666667, 1,
2.369966, -0.08560169, 1.489201, 1, 0, 0.05882353, 1,
2.378099, -0.2966311, 3.332564, 1, 0, 0.05490196, 1,
2.424745, 0.2750119, 0.8542807, 1, 0, 0.04705882, 1,
2.47039, 1.053368, -1.530356, 1, 0, 0.04313726, 1,
2.573203, 0.01905532, 1.617105, 1, 0, 0.03529412, 1,
2.660828, 0.5392886, 2.634793, 1, 0, 0.03137255, 1,
2.682806, 1.122623, 1.428952, 1, 0, 0.02352941, 1,
2.753369, -0.5528947, 2.195836, 1, 0, 0.01960784, 1,
2.861218, -0.8020517, 3.19421, 1, 0, 0.01176471, 1,
3.213299, -0.7658961, 2.050493, 1, 0, 0.007843138, 1
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
-0.1128823, -4.44196, -7.330834, 0, -0.5, 0.5, 0.5,
-0.1128823, -4.44196, -7.330834, 1, -0.5, 0.5, 0.5,
-0.1128823, -4.44196, -7.330834, 1, 1.5, 0.5, 0.5,
-0.1128823, -4.44196, -7.330834, 0, 1.5, 0.5, 0.5
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
-4.566638, 0.2671883, -7.330834, 0, -0.5, 0.5, 0.5,
-4.566638, 0.2671883, -7.330834, 1, -0.5, 0.5, 0.5,
-4.566638, 0.2671883, -7.330834, 1, 1.5, 0.5, 0.5,
-4.566638, 0.2671883, -7.330834, 0, 1.5, 0.5, 0.5
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
-4.566638, -4.44196, 0.3581612, 0, -0.5, 0.5, 0.5,
-4.566638, -4.44196, 0.3581612, 1, -0.5, 0.5, 0.5,
-4.566638, -4.44196, 0.3581612, 1, 1.5, 0.5, 0.5,
-4.566638, -4.44196, 0.3581612, 0, 1.5, 0.5, 0.5
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
-3, -3.355234, -5.55645,
3, -3.355234, -5.55645,
-3, -3.355234, -5.55645,
-3, -3.536355, -5.852181,
-2, -3.355234, -5.55645,
-2, -3.536355, -5.852181,
-1, -3.355234, -5.55645,
-1, -3.536355, -5.852181,
0, -3.355234, -5.55645,
0, -3.536355, -5.852181,
1, -3.355234, -5.55645,
1, -3.536355, -5.852181,
2, -3.355234, -5.55645,
2, -3.536355, -5.852181,
3, -3.355234, -5.55645,
3, -3.536355, -5.852181
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
-3, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
-3, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
-3, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
-3, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
-2, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
-2, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
-2, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
-2, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
-1, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
-1, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
-1, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
-1, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
0, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
0, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
0, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
0, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
1, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
1, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
1, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
1, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
2, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
2, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
2, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
2, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5,
3, -3.898597, -6.443642, 0, -0.5, 0.5, 0.5,
3, -3.898597, -6.443642, 1, -0.5, 0.5, 0.5,
3, -3.898597, -6.443642, 1, 1.5, 0.5, 0.5,
3, -3.898597, -6.443642, 0, 1.5, 0.5, 0.5
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
-3.538848, -2, -5.55645,
-3.538848, 2, -5.55645,
-3.538848, -2, -5.55645,
-3.710147, -2, -5.852181,
-3.538848, 0, -5.55645,
-3.710147, 0, -5.852181,
-3.538848, 2, -5.55645,
-3.710147, 2, -5.852181
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
-4.052743, -2, -6.443642, 0, -0.5, 0.5, 0.5,
-4.052743, -2, -6.443642, 1, -0.5, 0.5, 0.5,
-4.052743, -2, -6.443642, 1, 1.5, 0.5, 0.5,
-4.052743, -2, -6.443642, 0, 1.5, 0.5, 0.5,
-4.052743, 0, -6.443642, 0, -0.5, 0.5, 0.5,
-4.052743, 0, -6.443642, 1, -0.5, 0.5, 0.5,
-4.052743, 0, -6.443642, 1, 1.5, 0.5, 0.5,
-4.052743, 0, -6.443642, 0, 1.5, 0.5, 0.5,
-4.052743, 2, -6.443642, 0, -0.5, 0.5, 0.5,
-4.052743, 2, -6.443642, 1, -0.5, 0.5, 0.5,
-4.052743, 2, -6.443642, 1, 1.5, 0.5, 0.5,
-4.052743, 2, -6.443642, 0, 1.5, 0.5, 0.5
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
-3.538848, -3.355234, -4,
-3.538848, -3.355234, 6,
-3.538848, -3.355234, -4,
-3.710147, -3.536355, -4,
-3.538848, -3.355234, -2,
-3.710147, -3.536355, -2,
-3.538848, -3.355234, 0,
-3.710147, -3.536355, 0,
-3.538848, -3.355234, 2,
-3.710147, -3.536355, 2,
-3.538848, -3.355234, 4,
-3.710147, -3.536355, 4,
-3.538848, -3.355234, 6,
-3.710147, -3.536355, 6
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
"4",
"6"
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
-4.052743, -3.898597, -4, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, -4, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, -4, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, -4, 0, 1.5, 0.5, 0.5,
-4.052743, -3.898597, -2, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, -2, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, -2, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, -2, 0, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 0, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 0, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 0, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 0, 0, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 2, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 2, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 2, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 2, 0, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 4, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 4, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 4, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 4, 0, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 6, 0, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 6, 1, -0.5, 0.5, 0.5,
-4.052743, -3.898597, 6, 1, 1.5, 0.5, 0.5,
-4.052743, -3.898597, 6, 0, 1.5, 0.5, 0.5
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
-3.538848, -3.355234, -5.55645,
-3.538848, 3.88961, -5.55645,
-3.538848, -3.355234, 6.272773,
-3.538848, 3.88961, 6.272773,
-3.538848, -3.355234, -5.55645,
-3.538848, -3.355234, 6.272773,
-3.538848, 3.88961, -5.55645,
-3.538848, 3.88961, 6.272773,
-3.538848, -3.355234, -5.55645,
3.313084, -3.355234, -5.55645,
-3.538848, -3.355234, 6.272773,
3.313084, -3.355234, 6.272773,
-3.538848, 3.88961, -5.55645,
3.313084, 3.88961, -5.55645,
-3.538848, 3.88961, 6.272773,
3.313084, 3.88961, 6.272773,
3.313084, -3.355234, -5.55645,
3.313084, 3.88961, -5.55645,
3.313084, -3.355234, 6.272773,
3.313084, 3.88961, 6.272773,
3.313084, -3.355234, -5.55645,
3.313084, -3.355234, 6.272773,
3.313084, 3.88961, -5.55645,
3.313084, 3.88961, 6.272773
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
var radius = 8.26148;
var distance = 36.75626;
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
mvMatrix.translate( 0.1128823, -0.2671883, -0.3581612 );
mvMatrix.scale( 1.303643, 1.232942, 0.7551192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.75626);
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


