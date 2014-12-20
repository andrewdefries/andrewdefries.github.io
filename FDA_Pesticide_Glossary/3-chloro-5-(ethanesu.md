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
-2.847635, -1.770139, -2.798464, 1, 0, 0, 1,
-2.802456, -0.1084282, -0.6539681, 1, 0.007843138, 0, 1,
-2.800799, 0.4913415, -0.6503165, 1, 0.01176471, 0, 1,
-2.728606, -0.7424753, -2.972422, 1, 0.01960784, 0, 1,
-2.50556, -0.5125294, -1.350551, 1, 0.02352941, 0, 1,
-2.47333, -0.3852189, -2.385773, 1, 0.03137255, 0, 1,
-2.466395, 0.6146013, -0.2513409, 1, 0.03529412, 0, 1,
-2.422942, 1.214843, -0.5159624, 1, 0.04313726, 0, 1,
-2.329891, -0.3140107, 0.2527453, 1, 0.04705882, 0, 1,
-2.254043, 0.6637304, -1.157562, 1, 0.05490196, 0, 1,
-2.244999, -1.359578, -0.06586352, 1, 0.05882353, 0, 1,
-2.190712, -1.731187, -2.863839, 1, 0.06666667, 0, 1,
-2.105297, 0.03893283, 1.019862, 1, 0.07058824, 0, 1,
-2.094489, -1.260805, -0.8337011, 1, 0.07843138, 0, 1,
-2.074612, 0.7495654, -2.048142, 1, 0.08235294, 0, 1,
-2.0424, 0.5552993, -1.589835, 1, 0.09019608, 0, 1,
-2.037828, 0.2041593, -2.029158, 1, 0.09411765, 0, 1,
-2.03755, 1.629671, 1.252075, 1, 0.1019608, 0, 1,
-2.032894, 0.05450786, -1.686273, 1, 0.1098039, 0, 1,
-2.032227, 0.8761928, -2.986902, 1, 0.1137255, 0, 1,
-2.007723, -1.918936, -1.907585, 1, 0.1215686, 0, 1,
-2.007061, 0.4384578, -1.401598, 1, 0.1254902, 0, 1,
-1.931271, -0.05031099, -1.262002, 1, 0.1333333, 0, 1,
-1.906282, 0.4656178, -0.9927953, 1, 0.1372549, 0, 1,
-1.901992, -0.3373284, -2.282801, 1, 0.145098, 0, 1,
-1.886969, -0.9828139, -2.265058, 1, 0.1490196, 0, 1,
-1.878599, -0.08092099, -2.422476, 1, 0.1568628, 0, 1,
-1.844447, 1.498048, 0.1732929, 1, 0.1607843, 0, 1,
-1.836273, 0.437837, -1.074826, 1, 0.1686275, 0, 1,
-1.814992, -0.1308569, 0.269343, 1, 0.172549, 0, 1,
-1.81194, -0.1889427, -1.29771, 1, 0.1803922, 0, 1,
-1.806998, -0.2608912, -0.3243702, 1, 0.1843137, 0, 1,
-1.799473, -1.879919, -1.460484, 1, 0.1921569, 0, 1,
-1.786113, -0.3307622, -2.404869, 1, 0.1960784, 0, 1,
-1.781183, 1.290873, 0.8061594, 1, 0.2039216, 0, 1,
-1.7686, 0.3332546, -0.8228804, 1, 0.2117647, 0, 1,
-1.739102, 1.2313, -1.014001, 1, 0.2156863, 0, 1,
-1.738025, 0.1662656, -2.249818, 1, 0.2235294, 0, 1,
-1.7304, -0.4613333, -1.301296, 1, 0.227451, 0, 1,
-1.709473, -0.9230449, -3.438613, 1, 0.2352941, 0, 1,
-1.708009, -0.8925967, -2.699959, 1, 0.2392157, 0, 1,
-1.698482, 1.999217, 0.3922479, 1, 0.2470588, 0, 1,
-1.692979, -1.801075, -1.310222, 1, 0.2509804, 0, 1,
-1.666788, 0.01701655, -1.753932, 1, 0.2588235, 0, 1,
-1.663309, 0.6939666, -0.8023248, 1, 0.2627451, 0, 1,
-1.649806, 0.3568363, -1.112497, 1, 0.2705882, 0, 1,
-1.647977, -1.094444, -2.008851, 1, 0.2745098, 0, 1,
-1.629606, -2.130781, -3.656336, 1, 0.282353, 0, 1,
-1.624152, -0.5368657, -2.656722, 1, 0.2862745, 0, 1,
-1.615571, -0.5943335, -2.664774, 1, 0.2941177, 0, 1,
-1.605623, 1.855789, -0.7337169, 1, 0.3019608, 0, 1,
-1.599548, 0.9277954, -0.5760446, 1, 0.3058824, 0, 1,
-1.593992, -0.8700366, -1.981249, 1, 0.3137255, 0, 1,
-1.589647, 0.4469112, -1.47833, 1, 0.3176471, 0, 1,
-1.581545, -1.173667, -2.514765, 1, 0.3254902, 0, 1,
-1.563857, -0.9607841, -1.817944, 1, 0.3294118, 0, 1,
-1.559975, -0.6266865, -3.20922, 1, 0.3372549, 0, 1,
-1.544155, -0.9596527, -2.271811, 1, 0.3411765, 0, 1,
-1.521531, 0.6370978, 0.07263841, 1, 0.3490196, 0, 1,
-1.514015, -0.6890129, -0.214756, 1, 0.3529412, 0, 1,
-1.513683, -1.285483, -1.211152, 1, 0.3607843, 0, 1,
-1.512595, -1.078305, -2.529568, 1, 0.3647059, 0, 1,
-1.498134, 0.06529865, -1.887424, 1, 0.372549, 0, 1,
-1.48715, -0.02521801, -1.500299, 1, 0.3764706, 0, 1,
-1.475374, 1.480629, -1.238474, 1, 0.3843137, 0, 1,
-1.474653, -1.566221, -3.053204, 1, 0.3882353, 0, 1,
-1.473153, 1.369064, -1.667612, 1, 0.3960784, 0, 1,
-1.470908, -0.2971962, -2.545164, 1, 0.4039216, 0, 1,
-1.467692, 0.3840559, -2.798647, 1, 0.4078431, 0, 1,
-1.446938, 0.6361638, -2.370982, 1, 0.4156863, 0, 1,
-1.437938, -1.069211, 0.08636261, 1, 0.4196078, 0, 1,
-1.416387, -0.4719914, -3.043163, 1, 0.427451, 0, 1,
-1.402026, -0.4613334, -1.522919, 1, 0.4313726, 0, 1,
-1.398573, -0.619372, -0.7687543, 1, 0.4392157, 0, 1,
-1.39617, 0.418288, -0.6831073, 1, 0.4431373, 0, 1,
-1.390567, -1.346107, -2.496956, 1, 0.4509804, 0, 1,
-1.388211, 0.9804443, -0.8118063, 1, 0.454902, 0, 1,
-1.387982, 0.2294701, -2.390373, 1, 0.4627451, 0, 1,
-1.381729, 1.100707, -2.308425, 1, 0.4666667, 0, 1,
-1.375896, 1.108836, -0.8183529, 1, 0.4745098, 0, 1,
-1.374414, -0.559808, -1.979878, 1, 0.4784314, 0, 1,
-1.36967, -0.4817401, -1.409831, 1, 0.4862745, 0, 1,
-1.354615, 0.095813, -2.826973, 1, 0.4901961, 0, 1,
-1.35062, 0.8561893, -2.052003, 1, 0.4980392, 0, 1,
-1.332224, 0.7692628, -0.6508253, 1, 0.5058824, 0, 1,
-1.328498, 0.5873988, -0.6597896, 1, 0.509804, 0, 1,
-1.327478, 0.7674925, -1.70482, 1, 0.5176471, 0, 1,
-1.326388, -0.1051029, -2.673892, 1, 0.5215687, 0, 1,
-1.325823, 0.4902131, -2.192588, 1, 0.5294118, 0, 1,
-1.321925, 0.3256246, -0.877603, 1, 0.5333334, 0, 1,
-1.319192, 0.668459, -1.123044, 1, 0.5411765, 0, 1,
-1.309188, -0.5298268, -1.694638, 1, 0.5450981, 0, 1,
-1.30471, -1.45554, -1.142827, 1, 0.5529412, 0, 1,
-1.298121, 1.986459, -0.9939275, 1, 0.5568628, 0, 1,
-1.296672, -1.599052, -2.757715, 1, 0.5647059, 0, 1,
-1.293059, -0.3524522, -2.347834, 1, 0.5686275, 0, 1,
-1.274127, -1.580855, -2.80874, 1, 0.5764706, 0, 1,
-1.273812, -0.6982908, -1.751529, 1, 0.5803922, 0, 1,
-1.263997, -1.815328, -1.856446, 1, 0.5882353, 0, 1,
-1.230442, 0.7482967, 0.4178003, 1, 0.5921569, 0, 1,
-1.220542, -1.024447, -2.768718, 1, 0.6, 0, 1,
-1.218149, -0.3400011, -0.04953701, 1, 0.6078432, 0, 1,
-1.212989, 0.6296903, -2.028563, 1, 0.6117647, 0, 1,
-1.207317, 0.1162984, -2.934173, 1, 0.6196079, 0, 1,
-1.206822, -0.2534447, -4.681128, 1, 0.6235294, 0, 1,
-1.205821, -0.5550324, -2.47659, 1, 0.6313726, 0, 1,
-1.203211, -0.1233261, -1.647356, 1, 0.6352941, 0, 1,
-1.203149, 0.7570888, -1.497987, 1, 0.6431373, 0, 1,
-1.196301, -0.3620497, -2.208818, 1, 0.6470588, 0, 1,
-1.190149, 1.972161, -1.401362, 1, 0.654902, 0, 1,
-1.188187, 0.7016608, -1.062274, 1, 0.6588235, 0, 1,
-1.187507, 1.30943, -1.441404, 1, 0.6666667, 0, 1,
-1.183326, -0.6687854, -0.9704995, 1, 0.6705883, 0, 1,
-1.175764, 1.142741, -1.567539, 1, 0.6784314, 0, 1,
-1.173938, 0.09232291, -0.9964119, 1, 0.682353, 0, 1,
-1.173661, -1.537499, -2.610096, 1, 0.6901961, 0, 1,
-1.173112, 0.2787876, -0.565793, 1, 0.6941177, 0, 1,
-1.163566, -1.124726, -0.5484902, 1, 0.7019608, 0, 1,
-1.162322, 0.08492254, -0.5266275, 1, 0.7098039, 0, 1,
-1.160914, -1.288737, -3.223712, 1, 0.7137255, 0, 1,
-1.15608, 2.283886, 1.348767, 1, 0.7215686, 0, 1,
-1.14032, -0.5701087, -2.257377, 1, 0.7254902, 0, 1,
-1.132811, -0.5909269, -2.733133, 1, 0.7333333, 0, 1,
-1.131477, 0.03250505, -2.444333, 1, 0.7372549, 0, 1,
-1.130186, 0.8728088, 0.3879805, 1, 0.7450981, 0, 1,
-1.122292, -3.046639, -1.439118, 1, 0.7490196, 0, 1,
-1.121091, 0.8044935, -1.175699, 1, 0.7568628, 0, 1,
-1.111539, 1.794956, -0.4471798, 1, 0.7607843, 0, 1,
-1.10562, -0.02051336, -0.8413303, 1, 0.7686275, 0, 1,
-1.100481, 0.7436676, -0.9888074, 1, 0.772549, 0, 1,
-1.096921, 0.6381187, -1.468363, 1, 0.7803922, 0, 1,
-1.095309, 0.186479, -2.769949, 1, 0.7843137, 0, 1,
-1.093458, -0.3651611, -1.859941, 1, 0.7921569, 0, 1,
-1.079338, -0.4623522, -0.7347503, 1, 0.7960784, 0, 1,
-1.077587, 0.6120804, -0.8168584, 1, 0.8039216, 0, 1,
-1.066362, 0.5355603, -1.312125, 1, 0.8117647, 0, 1,
-1.058716, -0.8819274, -3.483951, 1, 0.8156863, 0, 1,
-1.055912, 0.2254291, -3.539186, 1, 0.8235294, 0, 1,
-1.054066, -0.774074, -3.24779, 1, 0.827451, 0, 1,
-1.051763, 0.7910277, -2.568137, 1, 0.8352941, 0, 1,
-1.050191, -0.4094444, -2.098516, 1, 0.8392157, 0, 1,
-1.046743, 0.9060674, -0.09106021, 1, 0.8470588, 0, 1,
-1.029262, -0.06691243, -1.023513, 1, 0.8509804, 0, 1,
-1.029095, 0.09788941, -1.393023, 1, 0.8588235, 0, 1,
-1.027983, -0.4852827, -1.655395, 1, 0.8627451, 0, 1,
-1.022875, -0.2268032, -3.242127, 1, 0.8705882, 0, 1,
-1.021077, 0.5188721, -0.7870316, 1, 0.8745098, 0, 1,
-1.008318, 1.673593, -0.336311, 1, 0.8823529, 0, 1,
-1.005377, 0.05682518, -1.400632, 1, 0.8862745, 0, 1,
-0.9924061, 0.5393468, -1.504368, 1, 0.8941177, 0, 1,
-0.9850249, -0.7900798, -0.4407419, 1, 0.8980392, 0, 1,
-0.9831409, 0.3017374, -1.653825, 1, 0.9058824, 0, 1,
-0.9826214, 1.205865, -1.263571, 1, 0.9137255, 0, 1,
-0.977618, 1.963124, 0.5174008, 1, 0.9176471, 0, 1,
-0.974975, 0.3478193, -1.557231, 1, 0.9254902, 0, 1,
-0.9742729, -0.2689686, -1.917191, 1, 0.9294118, 0, 1,
-0.9660855, -0.550827, -1.6656, 1, 0.9372549, 0, 1,
-0.9648834, -1.645993, -4.347961, 1, 0.9411765, 0, 1,
-0.9638053, 0.6483285, -1.035326, 1, 0.9490196, 0, 1,
-0.9567947, 0.02551066, -2.020761, 1, 0.9529412, 0, 1,
-0.9537349, 0.4129496, -2.363025, 1, 0.9607843, 0, 1,
-0.9527093, -1.952972, -2.273685, 1, 0.9647059, 0, 1,
-0.9520204, 0.8048837, -2.455706, 1, 0.972549, 0, 1,
-0.9491441, -2.165034, -2.659089, 1, 0.9764706, 0, 1,
-0.9471976, -0.4730358, -1.032349, 1, 0.9843137, 0, 1,
-0.9405103, -0.1098405, -1.126757, 1, 0.9882353, 0, 1,
-0.9383922, -0.1243272, 0.1177536, 1, 0.9960784, 0, 1,
-0.9345372, -0.2835183, -2.374506, 0.9960784, 1, 0, 1,
-0.9337401, 0.7834439, 0.8697363, 0.9921569, 1, 0, 1,
-0.9325507, -0.1051818, -1.213863, 0.9843137, 1, 0, 1,
-0.9315834, -0.1051062, 0.01151456, 0.9803922, 1, 0, 1,
-0.9279597, -0.9610704, -2.156248, 0.972549, 1, 0, 1,
-0.9253528, 0.5741958, -1.135127, 0.9686275, 1, 0, 1,
-0.9246684, -0.9315839, -4.29299, 0.9607843, 1, 0, 1,
-0.9245346, 1.298658, -0.3994439, 0.9568627, 1, 0, 1,
-0.923247, 0.573548, -2.189831, 0.9490196, 1, 0, 1,
-0.9224725, 1.302573, 0.3779143, 0.945098, 1, 0, 1,
-0.9193354, 0.3106255, -1.621644, 0.9372549, 1, 0, 1,
-0.9192469, 0.1612632, -1.6039, 0.9333333, 1, 0, 1,
-0.9170291, 0.1350952, -2.969186, 0.9254902, 1, 0, 1,
-0.9093896, 0.3979986, -1.021327, 0.9215686, 1, 0, 1,
-0.9088806, -1.508013, -4.499578, 0.9137255, 1, 0, 1,
-0.9079127, -0.8163972, -1.616324, 0.9098039, 1, 0, 1,
-0.906895, -1.839043, -4.609591, 0.9019608, 1, 0, 1,
-0.9055315, 0.6597683, -2.645448, 0.8941177, 1, 0, 1,
-0.9006779, -0.7558814, -2.200021, 0.8901961, 1, 0, 1,
-0.8899219, -0.7768489, -2.673193, 0.8823529, 1, 0, 1,
-0.8789746, -1.439042, -2.369862, 0.8784314, 1, 0, 1,
-0.8780642, 0.3607362, -1.553749, 0.8705882, 1, 0, 1,
-0.8722337, -0.8334467, -1.20051, 0.8666667, 1, 0, 1,
-0.8712443, 0.5599543, -2.10558, 0.8588235, 1, 0, 1,
-0.8664057, -1.680795, -2.510897, 0.854902, 1, 0, 1,
-0.8598113, -0.3706702, -2.471915, 0.8470588, 1, 0, 1,
-0.8569274, 0.6800436, 0.1195287, 0.8431373, 1, 0, 1,
-0.8482237, 0.2021781, -1.737025, 0.8352941, 1, 0, 1,
-0.8453903, 1.465145, -0.8901657, 0.8313726, 1, 0, 1,
-0.8422591, 0.6483955, 0.0968411, 0.8235294, 1, 0, 1,
-0.8420935, 0.01925998, -0.7635442, 0.8196079, 1, 0, 1,
-0.8389513, 0.9521269, 0.6371222, 0.8117647, 1, 0, 1,
-0.8364112, -0.6536404, -2.133382, 0.8078431, 1, 0, 1,
-0.8351682, -2.70459, -3.177552, 0.8, 1, 0, 1,
-0.8272834, -1.026093, -2.640768, 0.7921569, 1, 0, 1,
-0.8261948, -0.5061479, -1.326659, 0.7882353, 1, 0, 1,
-0.8213669, -0.01543641, -4.028931, 0.7803922, 1, 0, 1,
-0.8169404, -1.736531, -2.521877, 0.7764706, 1, 0, 1,
-0.8151941, 0.6856498, -1.685919, 0.7686275, 1, 0, 1,
-0.8144185, 1.43246, 0.4247734, 0.7647059, 1, 0, 1,
-0.8097985, -1.076136, -2.020566, 0.7568628, 1, 0, 1,
-0.8038986, -0.4205779, -1.701377, 0.7529412, 1, 0, 1,
-0.8016396, 0.2313595, -3.435581, 0.7450981, 1, 0, 1,
-0.7984595, 1.507938, -1.548324, 0.7411765, 1, 0, 1,
-0.7966992, 2.456539, -0.5214573, 0.7333333, 1, 0, 1,
-0.7954652, -1.507837, -2.032584, 0.7294118, 1, 0, 1,
-0.790778, 0.8797525, -0.5784476, 0.7215686, 1, 0, 1,
-0.788069, 0.734892, -0.7608865, 0.7176471, 1, 0, 1,
-0.7834802, 0.5320798, -0.6020035, 0.7098039, 1, 0, 1,
-0.782536, 1.290788, -1.442739, 0.7058824, 1, 0, 1,
-0.7786935, -1.245223, -2.997103, 0.6980392, 1, 0, 1,
-0.776555, 0.392424, -2.075764, 0.6901961, 1, 0, 1,
-0.7714869, 1.048309, -0.05775405, 0.6862745, 1, 0, 1,
-0.7685826, 0.4887645, -0.1138002, 0.6784314, 1, 0, 1,
-0.7666425, -0.257835, -2.008078, 0.6745098, 1, 0, 1,
-0.7564913, 2.929156, -1.244825, 0.6666667, 1, 0, 1,
-0.75638, 1.208471, -0.4095038, 0.6627451, 1, 0, 1,
-0.7522114, 0.4048296, -1.75502, 0.654902, 1, 0, 1,
-0.7366249, -0.4447417, -2.64432, 0.6509804, 1, 0, 1,
-0.7242557, -0.6584746, -1.74875, 0.6431373, 1, 0, 1,
-0.7212672, -0.6448303, -1.620112, 0.6392157, 1, 0, 1,
-0.7172466, -0.6164182, -1.775083, 0.6313726, 1, 0, 1,
-0.7167516, -0.2623333, -0.9916726, 0.627451, 1, 0, 1,
-0.7162716, 2.091808, 0.03848967, 0.6196079, 1, 0, 1,
-0.7111478, 2.313025, 0.3057153, 0.6156863, 1, 0, 1,
-0.7100207, -0.04731894, -0.0121824, 0.6078432, 1, 0, 1,
-0.7090499, -1.704001, -2.005106, 0.6039216, 1, 0, 1,
-0.6963848, 0.06396941, -0.6951691, 0.5960785, 1, 0, 1,
-0.6960469, -2.209657, -3.64029, 0.5882353, 1, 0, 1,
-0.6901782, -2.057545, -1.989403, 0.5843138, 1, 0, 1,
-0.6884094, -1.318746, -1.029121, 0.5764706, 1, 0, 1,
-0.6830164, -0.1747357, -0.6427034, 0.572549, 1, 0, 1,
-0.6721842, -0.3789732, 0.3041516, 0.5647059, 1, 0, 1,
-0.6696526, 0.9750391, -1.083273, 0.5607843, 1, 0, 1,
-0.6690117, 1.080425, -1.094702, 0.5529412, 1, 0, 1,
-0.6680763, 1.047575, 0.8741848, 0.5490196, 1, 0, 1,
-0.6643354, 1.054284, -0.4883952, 0.5411765, 1, 0, 1,
-0.6638702, 0.4808055, 0.08437502, 0.5372549, 1, 0, 1,
-0.6579688, -1.328473, -2.394167, 0.5294118, 1, 0, 1,
-0.6441551, 0.4262521, -0.2151373, 0.5254902, 1, 0, 1,
-0.6402621, -0.01009928, -2.009845, 0.5176471, 1, 0, 1,
-0.6397915, 1.068637, -2.253962, 0.5137255, 1, 0, 1,
-0.6373549, 0.1429027, -1.898126, 0.5058824, 1, 0, 1,
-0.6368304, -2.112858, -3.319288, 0.5019608, 1, 0, 1,
-0.6340137, 0.7992861, -1.151455, 0.4941176, 1, 0, 1,
-0.6276603, -1.10549, -2.045557, 0.4862745, 1, 0, 1,
-0.6243296, 1.348562, -0.3855569, 0.4823529, 1, 0, 1,
-0.6176527, 1.592118, 0.0796655, 0.4745098, 1, 0, 1,
-0.6161621, 0.932885, -1.520124, 0.4705882, 1, 0, 1,
-0.6090419, 0.8178571, -0.7965799, 0.4627451, 1, 0, 1,
-0.6084878, -0.0084757, -2.936307, 0.4588235, 1, 0, 1,
-0.6064391, 0.812438, 0.8161414, 0.4509804, 1, 0, 1,
-0.6051927, 0.2545646, -1.359631, 0.4470588, 1, 0, 1,
-0.6025612, 1.288893, 0.03582031, 0.4392157, 1, 0, 1,
-0.6014831, -1.496851, -3.213781, 0.4352941, 1, 0, 1,
-0.6014361, 0.756076, 1.454108, 0.427451, 1, 0, 1,
-0.599326, 0.7024716, -1.561494, 0.4235294, 1, 0, 1,
-0.5919854, -0.2492685, -2.366815, 0.4156863, 1, 0, 1,
-0.590831, 0.01689965, -0.9821648, 0.4117647, 1, 0, 1,
-0.5881978, 0.6440185, -0.3827652, 0.4039216, 1, 0, 1,
-0.5860386, 1.217377, -0.5493163, 0.3960784, 1, 0, 1,
-0.5852253, 0.6556576, -0.9450041, 0.3921569, 1, 0, 1,
-0.5812096, 2.542791, -1.022055, 0.3843137, 1, 0, 1,
-0.5802485, 1.605107, -0.2712373, 0.3803922, 1, 0, 1,
-0.5784417, 0.4176056, -1.535881, 0.372549, 1, 0, 1,
-0.5758486, -0.4380155, -1.950022, 0.3686275, 1, 0, 1,
-0.5745527, -0.9141377, -3.63057, 0.3607843, 1, 0, 1,
-0.5720552, -0.5807385, -0.4857479, 0.3568628, 1, 0, 1,
-0.5709497, -0.346612, -2.294113, 0.3490196, 1, 0, 1,
-0.5687625, -0.09288689, -1.666648, 0.345098, 1, 0, 1,
-0.5612452, 0.04503237, -2.278453, 0.3372549, 1, 0, 1,
-0.5586393, -0.5199648, -2.090333, 0.3333333, 1, 0, 1,
-0.5562928, 1.231753, 0.9476603, 0.3254902, 1, 0, 1,
-0.5557988, -1.891625, -3.328732, 0.3215686, 1, 0, 1,
-0.5520272, -0.4164217, -1.664894, 0.3137255, 1, 0, 1,
-0.5500715, -1.525959, -3.950634, 0.3098039, 1, 0, 1,
-0.5479501, -1.578992, -2.0983, 0.3019608, 1, 0, 1,
-0.5478072, -0.2037759, -1.820257, 0.2941177, 1, 0, 1,
-0.5476959, 0.04567591, -0.2842936, 0.2901961, 1, 0, 1,
-0.5455623, 1.067297, -1.396933, 0.282353, 1, 0, 1,
-0.5450595, 1.12323, -1.156086, 0.2784314, 1, 0, 1,
-0.5419302, 0.8071279, -2.160247, 0.2705882, 1, 0, 1,
-0.5391902, 1.386929, -0.7817811, 0.2666667, 1, 0, 1,
-0.5385054, 0.06475024, -0.9867391, 0.2588235, 1, 0, 1,
-0.5375632, 1.383029, -0.1344914, 0.254902, 1, 0, 1,
-0.5370664, -0.625551, -0.8973193, 0.2470588, 1, 0, 1,
-0.5361845, -1.855404, -2.823651, 0.2431373, 1, 0, 1,
-0.5265817, 0.05651532, -1.414998, 0.2352941, 1, 0, 1,
-0.5239748, -1.44339, -1.098159, 0.2313726, 1, 0, 1,
-0.5230134, -0.3104948, -1.924491, 0.2235294, 1, 0, 1,
-0.5208711, -1.118056, -3.783424, 0.2196078, 1, 0, 1,
-0.5137937, 1.275978, 0.2221982, 0.2117647, 1, 0, 1,
-0.5109988, -2.323204, -4.862405, 0.2078431, 1, 0, 1,
-0.5084482, 1.134973, 0.3169087, 0.2, 1, 0, 1,
-0.5009907, -0.5192539, -1.246534, 0.1921569, 1, 0, 1,
-0.4982494, 0.04250646, 0.2269569, 0.1882353, 1, 0, 1,
-0.4922165, 0.769288, 0.494424, 0.1803922, 1, 0, 1,
-0.4852163, 0.2045759, -0.3330209, 0.1764706, 1, 0, 1,
-0.4794564, 0.2599155, -0.2974877, 0.1686275, 1, 0, 1,
-0.4778945, 0.3227109, -0.6431632, 0.1647059, 1, 0, 1,
-0.4762567, 0.5105388, -0.728745, 0.1568628, 1, 0, 1,
-0.4752981, -0.9020984, -2.006784, 0.1529412, 1, 0, 1,
-0.4726816, -0.8682899, -2.295323, 0.145098, 1, 0, 1,
-0.4721893, -0.2102663, -0.3267491, 0.1411765, 1, 0, 1,
-0.471696, 0.04813706, -0.9459899, 0.1333333, 1, 0, 1,
-0.4677948, 0.119951, -1.999666, 0.1294118, 1, 0, 1,
-0.466089, 0.2490695, -2.359534, 0.1215686, 1, 0, 1,
-0.4657578, 1.804016, -0.6451898, 0.1176471, 1, 0, 1,
-0.4654912, -1.754541, -2.370851, 0.1098039, 1, 0, 1,
-0.4645723, 1.908038, -1.449839, 0.1058824, 1, 0, 1,
-0.4643454, -1.059622, -3.558376, 0.09803922, 1, 0, 1,
-0.4560271, 0.5822157, -0.5297761, 0.09019608, 1, 0, 1,
-0.4544145, -1.701936, -3.434278, 0.08627451, 1, 0, 1,
-0.4456204, -0.2694966, -0.9332832, 0.07843138, 1, 0, 1,
-0.4395781, 0.3295533, -0.6809455, 0.07450981, 1, 0, 1,
-0.4343716, 1.431177, -1.992395, 0.06666667, 1, 0, 1,
-0.4337049, 0.5256257, 0.5668791, 0.0627451, 1, 0, 1,
-0.4321429, -0.7496085, -1.881778, 0.05490196, 1, 0, 1,
-0.4302592, 0.9308245, -1.356782, 0.05098039, 1, 0, 1,
-0.4267427, -0.1266321, -2.571816, 0.04313726, 1, 0, 1,
-0.4232534, -1.172822, -2.17301, 0.03921569, 1, 0, 1,
-0.4186044, 0.7457743, -0.685666, 0.03137255, 1, 0, 1,
-0.4182122, -0.02625801, -2.112737, 0.02745098, 1, 0, 1,
-0.4065839, -1.136576, -2.599535, 0.01960784, 1, 0, 1,
-0.4064871, 0.2112555, -2.585173, 0.01568628, 1, 0, 1,
-0.4010287, -0.1285551, -1.120304, 0.007843138, 1, 0, 1,
-0.3989607, 1.890131, 0.7239469, 0.003921569, 1, 0, 1,
-0.3980546, -0.0967678, -1.590629, 0, 1, 0.003921569, 1,
-0.3917253, -0.07603377, -2.118536, 0, 1, 0.01176471, 1,
-0.3907148, -0.9433592, -1.784015, 0, 1, 0.01568628, 1,
-0.3846664, 0.08734994, -1.748184, 0, 1, 0.02352941, 1,
-0.3813218, 0.01764524, -0.9503875, 0, 1, 0.02745098, 1,
-0.3806218, 1.022103, -1.615944, 0, 1, 0.03529412, 1,
-0.3783872, -0.2122095, -2.135443, 0, 1, 0.03921569, 1,
-0.3778089, -1.925011, -3.261765, 0, 1, 0.04705882, 1,
-0.3773625, -0.599395, -3.400243, 0, 1, 0.05098039, 1,
-0.3715354, -1.209202, -2.712256, 0, 1, 0.05882353, 1,
-0.3703786, 0.8024037, -1.698709, 0, 1, 0.0627451, 1,
-0.3629134, 1.296915, -0.8174515, 0, 1, 0.07058824, 1,
-0.3618716, -0.3262094, -3.374029, 0, 1, 0.07450981, 1,
-0.3590496, 0.02505983, -1.66123, 0, 1, 0.08235294, 1,
-0.3559485, -0.9838907, -2.07463, 0, 1, 0.08627451, 1,
-0.3518388, -1.710774, -3.789038, 0, 1, 0.09411765, 1,
-0.3496069, 1.27203, -0.7300147, 0, 1, 0.1019608, 1,
-0.3476673, 1.449374, 0.2690569, 0, 1, 0.1058824, 1,
-0.3435795, -0.6471017, -1.356513, 0, 1, 0.1137255, 1,
-0.3383841, 1.677698, 0.1550321, 0, 1, 0.1176471, 1,
-0.3367836, 0.3330207, 0.6325675, 0, 1, 0.1254902, 1,
-0.3347374, -0.8142553, -2.734314, 0, 1, 0.1294118, 1,
-0.3286412, 1.224227, 1.077204, 0, 1, 0.1372549, 1,
-0.3280282, 0.9122956, -1.063101, 0, 1, 0.1411765, 1,
-0.3170267, -1.842561, -2.755806, 0, 1, 0.1490196, 1,
-0.3089729, 0.1143419, -0.2563453, 0, 1, 0.1529412, 1,
-0.3082171, -0.2302514, -2.402597, 0, 1, 0.1607843, 1,
-0.3048211, -0.2165855, -2.327748, 0, 1, 0.1647059, 1,
-0.3042898, 0.1532717, -1.947875, 0, 1, 0.172549, 1,
-0.2961723, 0.9612243, 0.6436375, 0, 1, 0.1764706, 1,
-0.2954675, 0.2745116, -0.4138635, 0, 1, 0.1843137, 1,
-0.2947704, -0.03196997, -0.5515911, 0, 1, 0.1882353, 1,
-0.2924723, 1.01085, -0.3692816, 0, 1, 0.1960784, 1,
-0.2870346, -0.3490187, -0.957744, 0, 1, 0.2039216, 1,
-0.2855913, 0.4143605, 0.2673808, 0, 1, 0.2078431, 1,
-0.2848754, -0.0758337, -1.834924, 0, 1, 0.2156863, 1,
-0.283051, -0.3158365, -2.1839, 0, 1, 0.2196078, 1,
-0.2802304, 0.4221702, -2.250634, 0, 1, 0.227451, 1,
-0.276023, 1.76501, -1.296993, 0, 1, 0.2313726, 1,
-0.273291, 1.518447, 0.4572092, 0, 1, 0.2392157, 1,
-0.2718832, 0.267232, 0.350801, 0, 1, 0.2431373, 1,
-0.2696443, -1.261835, -3.40857, 0, 1, 0.2509804, 1,
-0.2652611, 0.263639, -0.1691457, 0, 1, 0.254902, 1,
-0.2649844, 1.478583, 0.9639925, 0, 1, 0.2627451, 1,
-0.2641751, -2.063489, -3.000661, 0, 1, 0.2666667, 1,
-0.2590944, 2.021065, 0.2732513, 0, 1, 0.2745098, 1,
-0.25589, 0.169659, -0.9985727, 0, 1, 0.2784314, 1,
-0.2549702, 1.81912, -0.1998874, 0, 1, 0.2862745, 1,
-0.2527813, 0.09126955, 0.05163885, 0, 1, 0.2901961, 1,
-0.246299, -0.1344485, -0.3919711, 0, 1, 0.2980392, 1,
-0.2456962, -0.7220999, -1.480802, 0, 1, 0.3058824, 1,
-0.2431964, -0.06525157, -2.672527, 0, 1, 0.3098039, 1,
-0.238174, -1.007368, -3.124888, 0, 1, 0.3176471, 1,
-0.2359152, 2.004919, -1.202231, 0, 1, 0.3215686, 1,
-0.2328881, -0.8518835, -2.365958, 0, 1, 0.3294118, 1,
-0.2323871, -0.4360625, -2.724499, 0, 1, 0.3333333, 1,
-0.2319144, -1.228253, -3.450144, 0, 1, 0.3411765, 1,
-0.2300134, -0.9441201, -4.01451, 0, 1, 0.345098, 1,
-0.2291263, 1.654637, -0.1382523, 0, 1, 0.3529412, 1,
-0.2284863, -0.7031457, -3.582497, 0, 1, 0.3568628, 1,
-0.227465, 1.02218, 0.08650861, 0, 1, 0.3647059, 1,
-0.2264856, 0.01425565, -0.4938304, 0, 1, 0.3686275, 1,
-0.2241579, -1.099974, -3.393219, 0, 1, 0.3764706, 1,
-0.2229322, 0.50238, -1.932865, 0, 1, 0.3803922, 1,
-0.2191079, 0.1733807, -0.9629645, 0, 1, 0.3882353, 1,
-0.216634, -0.1390871, -2.362302, 0, 1, 0.3921569, 1,
-0.2158878, -0.6405924, -3.97506, 0, 1, 0.4, 1,
-0.2141315, 1.33318, 0.8750387, 0, 1, 0.4078431, 1,
-0.2136457, -0.6055452, -3.332418, 0, 1, 0.4117647, 1,
-0.2105986, -3.223058, -3.919672, 0, 1, 0.4196078, 1,
-0.2044872, -0.1250215, -2.65627, 0, 1, 0.4235294, 1,
-0.2023495, 0.806808, 0.2610067, 0, 1, 0.4313726, 1,
-0.2016073, 1.269894, -0.2423304, 0, 1, 0.4352941, 1,
-0.1963401, 0.3128563, -1.551176, 0, 1, 0.4431373, 1,
-0.1957038, -0.1598564, -2.613283, 0, 1, 0.4470588, 1,
-0.1933196, -1.43864, -1.644701, 0, 1, 0.454902, 1,
-0.1914199, 0.5282924, 0.7327592, 0, 1, 0.4588235, 1,
-0.1904405, -1.276499, -3.337601, 0, 1, 0.4666667, 1,
-0.1882349, -0.03022755, -1.772395, 0, 1, 0.4705882, 1,
-0.1861416, 1.785164, -1.383011, 0, 1, 0.4784314, 1,
-0.1844288, -2.658024, -2.845603, 0, 1, 0.4823529, 1,
-0.183732, -0.6177413, -2.774942, 0, 1, 0.4901961, 1,
-0.181018, 0.4588448, -1.514308, 0, 1, 0.4941176, 1,
-0.1778001, 1.143425, 0.06475566, 0, 1, 0.5019608, 1,
-0.1742261, 1.639855, -0.9475883, 0, 1, 0.509804, 1,
-0.1707725, 1.917206, -0.03499099, 0, 1, 0.5137255, 1,
-0.1657591, 0.5770451, 1.538926, 0, 1, 0.5215687, 1,
-0.1640452, -0.4074266, -2.869539, 0, 1, 0.5254902, 1,
-0.1573367, 0.1826666, -0.4550606, 0, 1, 0.5333334, 1,
-0.1566826, -0.5665969, -3.112063, 0, 1, 0.5372549, 1,
-0.1543936, 0.894435, 0.0439012, 0, 1, 0.5450981, 1,
-0.1541758, -0.3546407, -1.773308, 0, 1, 0.5490196, 1,
-0.1511917, 0.5564143, -0.02867926, 0, 1, 0.5568628, 1,
-0.1463834, 0.2957441, 0.03039695, 0, 1, 0.5607843, 1,
-0.1423947, -1.56849, -3.666117, 0, 1, 0.5686275, 1,
-0.1421547, -0.7865874, -1.811295, 0, 1, 0.572549, 1,
-0.1420443, -0.4339511, -2.276466, 0, 1, 0.5803922, 1,
-0.1415006, -1.189796, -2.91302, 0, 1, 0.5843138, 1,
-0.1368347, -0.96451, -2.596465, 0, 1, 0.5921569, 1,
-0.135947, -1.217957, -2.174502, 0, 1, 0.5960785, 1,
-0.134734, -0.5440714, -1.828971, 0, 1, 0.6039216, 1,
-0.1334234, 1.033887, -0.1115249, 0, 1, 0.6117647, 1,
-0.132987, 1.335907, -0.7566856, 0, 1, 0.6156863, 1,
-0.1298024, -1.042721, -1.453144, 0, 1, 0.6235294, 1,
-0.1297071, 2.357449, 1.582321, 0, 1, 0.627451, 1,
-0.1197016, 0.1574038, 1.120948, 0, 1, 0.6352941, 1,
-0.1173215, -0.1749074, -2.147578, 0, 1, 0.6392157, 1,
-0.11706, 1.381679, 0.8706553, 0, 1, 0.6470588, 1,
-0.1125721, 1.097307, 0.9429765, 0, 1, 0.6509804, 1,
-0.1115052, 0.9615218, -1.558871, 0, 1, 0.6588235, 1,
-0.1064546, 0.164961, 0.6471532, 0, 1, 0.6627451, 1,
-0.10489, 1.113979, -0.3823922, 0, 1, 0.6705883, 1,
-0.1026768, 0.2174295, 0.58077, 0, 1, 0.6745098, 1,
-0.1024091, -0.1464409, -4.398295, 0, 1, 0.682353, 1,
-0.1014881, 0.5566191, 1.430993, 0, 1, 0.6862745, 1,
-0.09884855, -1.148823, -2.265354, 0, 1, 0.6941177, 1,
-0.09882703, 0.909805, 0.7394124, 0, 1, 0.7019608, 1,
-0.09881833, 0.1820608, 0.06600327, 0, 1, 0.7058824, 1,
-0.09784542, 0.4384921, -0.9255567, 0, 1, 0.7137255, 1,
-0.09760997, 1.436925, -0.7357002, 0, 1, 0.7176471, 1,
-0.09423228, 0.1372239, 0.1384418, 0, 1, 0.7254902, 1,
-0.0938011, -0.341513, -3.489836, 0, 1, 0.7294118, 1,
-0.09186717, -0.08258422, -2.313527, 0, 1, 0.7372549, 1,
-0.08498842, -0.848841, -2.220083, 0, 1, 0.7411765, 1,
-0.0825819, -1.201957, -3.859312, 0, 1, 0.7490196, 1,
-0.08244222, -0.3657159, -4.491929, 0, 1, 0.7529412, 1,
-0.0812802, 0.5833787, 0.6913402, 0, 1, 0.7607843, 1,
-0.078831, 0.9818019, -3.402673, 0, 1, 0.7647059, 1,
-0.07150162, 0.6670153, 0.4357354, 0, 1, 0.772549, 1,
-0.07148636, -1.119326, -2.270749, 0, 1, 0.7764706, 1,
-0.06731277, -0.9912462, -2.885142, 0, 1, 0.7843137, 1,
-0.06069696, -1.009648, -2.449391, 0, 1, 0.7882353, 1,
-0.05828728, 1.060837, -0.7508825, 0, 1, 0.7960784, 1,
-0.05460533, 1.373457, -0.8184493, 0, 1, 0.8039216, 1,
-0.04966809, -1.279762, -5.07773, 0, 1, 0.8078431, 1,
-0.04864668, -0.2451768, -2.787817, 0, 1, 0.8156863, 1,
-0.04760541, -0.08327785, -1.798808, 0, 1, 0.8196079, 1,
-0.04604942, 1.615957, -0.1273709, 0, 1, 0.827451, 1,
-0.03745938, 0.5382302, 0.7019759, 0, 1, 0.8313726, 1,
-0.03710601, -1.095327, -2.386966, 0, 1, 0.8392157, 1,
-0.03574945, -0.04504115, -1.918268, 0, 1, 0.8431373, 1,
-0.03179578, 0.3397098, 0.5766859, 0, 1, 0.8509804, 1,
-0.03044089, -0.02287514, -2.613685, 0, 1, 0.854902, 1,
-0.02760006, 0.5119165, -0.03069067, 0, 1, 0.8627451, 1,
-0.02430415, -0.1823628, -2.756346, 0, 1, 0.8666667, 1,
-0.02138074, 1.500617, 0.512997, 0, 1, 0.8745098, 1,
-0.02058301, -0.1079379, -4.880681, 0, 1, 0.8784314, 1,
-0.01944967, -0.3074702, -2.901722, 0, 1, 0.8862745, 1,
-0.01766174, 0.4475051, -0.3231043, 0, 1, 0.8901961, 1,
-0.01528043, -1.032532, -2.628189, 0, 1, 0.8980392, 1,
-0.01026073, 0.3021818, -0.7014665, 0, 1, 0.9058824, 1,
-0.007790161, 0.6223682, 0.3256745, 0, 1, 0.9098039, 1,
-0.005300348, -1.284316, -3.588178, 0, 1, 0.9176471, 1,
-0.001775732, -0.4065182, -2.392956, 0, 1, 0.9215686, 1,
-0.00110311, 0.08554409, -0.3488772, 0, 1, 0.9294118, 1,
0.0004025743, -0.9163034, 4.348746, 0, 1, 0.9333333, 1,
0.003321592, -1.349232, 3.085187, 0, 1, 0.9411765, 1,
0.004086282, 1.736404, 0.2369907, 0, 1, 0.945098, 1,
0.006610606, -1.59089, 4.471849, 0, 1, 0.9529412, 1,
0.0103341, 0.1335379, 0.7464338, 0, 1, 0.9568627, 1,
0.01443828, -0.5863075, 2.643899, 0, 1, 0.9647059, 1,
0.01656816, -0.9055683, 1.630444, 0, 1, 0.9686275, 1,
0.01681984, -0.942192, 1.793027, 0, 1, 0.9764706, 1,
0.02228425, 1.477349, 0.09758369, 0, 1, 0.9803922, 1,
0.02967751, -0.411519, 3.138684, 0, 1, 0.9882353, 1,
0.03027513, 1.091776, 1.164503, 0, 1, 0.9921569, 1,
0.03189429, -3.241623, 3.808895, 0, 1, 1, 1,
0.03372295, -1.040527, 3.139009, 0, 0.9921569, 1, 1,
0.03409668, -0.5627334, 2.954527, 0, 0.9882353, 1, 1,
0.04423669, 0.9824671, -0.854838, 0, 0.9803922, 1, 1,
0.04590235, -1.78238, 4.350322, 0, 0.9764706, 1, 1,
0.04817743, -0.5670996, 3.595328, 0, 0.9686275, 1, 1,
0.04839043, 1.12584, 0.8483641, 0, 0.9647059, 1, 1,
0.05223725, 0.004606403, 1.313299, 0, 0.9568627, 1, 1,
0.05313402, -1.235082, 1.95339, 0, 0.9529412, 1, 1,
0.05542107, -1.993544, 4.00846, 0, 0.945098, 1, 1,
0.05718057, -0.236429, 2.795709, 0, 0.9411765, 1, 1,
0.05731235, -0.8106588, 3.07593, 0, 0.9333333, 1, 1,
0.05842773, -1.499116, 2.772793, 0, 0.9294118, 1, 1,
0.06176624, 0.3669664, -0.2558018, 0, 0.9215686, 1, 1,
0.06470057, -0.108017, 4.061465, 0, 0.9176471, 1, 1,
0.07118324, 0.08438135, 1.554038, 0, 0.9098039, 1, 1,
0.0723408, -0.8501139, 3.664344, 0, 0.9058824, 1, 1,
0.07741965, 1.263748, 1.026077, 0, 0.8980392, 1, 1,
0.07919204, 0.5520963, 1.443631, 0, 0.8901961, 1, 1,
0.08027782, 0.4263772, -0.5992697, 0, 0.8862745, 1, 1,
0.09287443, -1.220751, 2.659979, 0, 0.8784314, 1, 1,
0.09759623, -0.06600857, 1.491697, 0, 0.8745098, 1, 1,
0.1018995, -0.763601, 1.00374, 0, 0.8666667, 1, 1,
0.1073291, 0.259897, 1.322278, 0, 0.8627451, 1, 1,
0.1075877, 3.426059, 0.1623978, 0, 0.854902, 1, 1,
0.1083634, 0.6893252, 0.8242692, 0, 0.8509804, 1, 1,
0.1100981, 0.4939088, 1.210804, 0, 0.8431373, 1, 1,
0.1111663, -0.05241859, 0.7403682, 0, 0.8392157, 1, 1,
0.1132946, -0.3776654, 2.254916, 0, 0.8313726, 1, 1,
0.1137761, -0.9047847, 3.639001, 0, 0.827451, 1, 1,
0.1143626, -0.1272553, 2.161433, 0, 0.8196079, 1, 1,
0.1148559, -0.2314441, 2.699243, 0, 0.8156863, 1, 1,
0.122958, 0.006480862, 1.260608, 0, 0.8078431, 1, 1,
0.1257514, 1.238675, -1.818429, 0, 0.8039216, 1, 1,
0.126425, -0.7996896, 2.091217, 0, 0.7960784, 1, 1,
0.1273284, -0.4649936, 2.072007, 0, 0.7882353, 1, 1,
0.1292066, -0.350516, 1.828909, 0, 0.7843137, 1, 1,
0.1316748, -0.6987478, 1.113818, 0, 0.7764706, 1, 1,
0.1332043, 0.4919865, 2.201393, 0, 0.772549, 1, 1,
0.1349863, 0.5242334, 1.244657, 0, 0.7647059, 1, 1,
0.1361954, 0.6209476, 0.125496, 0, 0.7607843, 1, 1,
0.1382211, -0.8177443, 3.53034, 0, 0.7529412, 1, 1,
0.138931, 0.4590658, 1.418334, 0, 0.7490196, 1, 1,
0.1399088, -0.4548057, 2.198138, 0, 0.7411765, 1, 1,
0.1466606, 1.684457, 0.5784538, 0, 0.7372549, 1, 1,
0.1476101, 0.4000889, 1.213332, 0, 0.7294118, 1, 1,
0.148291, 1.134399, -0.8133146, 0, 0.7254902, 1, 1,
0.1486097, 1.052019, 0.5039598, 0, 0.7176471, 1, 1,
0.148891, 1.047917, 1.737966, 0, 0.7137255, 1, 1,
0.1494547, 0.8154044, -0.4992647, 0, 0.7058824, 1, 1,
0.1494859, 0.4832384, 0.7744942, 0, 0.6980392, 1, 1,
0.1500681, 1.531381, 0.440595, 0, 0.6941177, 1, 1,
0.1510875, 0.1745597, 1.323465, 0, 0.6862745, 1, 1,
0.1550625, -0.04651078, -0.1419988, 0, 0.682353, 1, 1,
0.1556536, -0.1064521, 0.9356421, 0, 0.6745098, 1, 1,
0.1569273, 0.7991994, 0.9990584, 0, 0.6705883, 1, 1,
0.1585717, 0.4681615, 1.000687, 0, 0.6627451, 1, 1,
0.1609358, 0.6789634, -0.07168498, 0, 0.6588235, 1, 1,
0.1627283, -0.572566, 3.15142, 0, 0.6509804, 1, 1,
0.167934, 1.335191, 2.722886, 0, 0.6470588, 1, 1,
0.1687024, -0.7476071, 2.828624, 0, 0.6392157, 1, 1,
0.1687072, -0.5289445, 3.499535, 0, 0.6352941, 1, 1,
0.1696417, 0.02125264, 1.058892, 0, 0.627451, 1, 1,
0.1710425, -1.441803, 3.427697, 0, 0.6235294, 1, 1,
0.1767585, 0.9566542, -1.141493, 0, 0.6156863, 1, 1,
0.1790799, -1.126183, 1.627529, 0, 0.6117647, 1, 1,
0.1797188, 1.750426, 0.4998378, 0, 0.6039216, 1, 1,
0.1797642, 0.4253719, 0.501013, 0, 0.5960785, 1, 1,
0.1819358, -1.685901, 1.198041, 0, 0.5921569, 1, 1,
0.1847598, -0.3415667, 2.055798, 0, 0.5843138, 1, 1,
0.1851435, -1.566946, 4.124523, 0, 0.5803922, 1, 1,
0.1855592, -0.1665267, 2.366407, 0, 0.572549, 1, 1,
0.1865085, 0.3077921, 1.017848, 0, 0.5686275, 1, 1,
0.1878401, -0.6057305, 1.087184, 0, 0.5607843, 1, 1,
0.1892619, -1.230774, 3.110014, 0, 0.5568628, 1, 1,
0.191183, -0.5047488, 3.782865, 0, 0.5490196, 1, 1,
0.1941075, -1.055517, 2.221503, 0, 0.5450981, 1, 1,
0.1988157, -2.974718, 3.125031, 0, 0.5372549, 1, 1,
0.1989539, -0.2698779, 0.8554824, 0, 0.5333334, 1, 1,
0.2044032, -0.4264492, 2.573311, 0, 0.5254902, 1, 1,
0.2050368, 1.791599, -0.1753427, 0, 0.5215687, 1, 1,
0.2067041, -0.6505377, 3.233043, 0, 0.5137255, 1, 1,
0.2077539, 0.4365603, 0.8949212, 0, 0.509804, 1, 1,
0.2106216, 0.08846203, 0.1099019, 0, 0.5019608, 1, 1,
0.2125969, 0.0925504, 1.400552, 0, 0.4941176, 1, 1,
0.2147751, -1.009494, 3.762284, 0, 0.4901961, 1, 1,
0.2150102, 0.5722547, 0.1814802, 0, 0.4823529, 1, 1,
0.2185256, -1.324576, 2.022546, 0, 0.4784314, 1, 1,
0.2206188, -1.130114, 3.173527, 0, 0.4705882, 1, 1,
0.2229297, -1.454297, 3.785449, 0, 0.4666667, 1, 1,
0.2238555, 0.08475083, 1.376669, 0, 0.4588235, 1, 1,
0.2246786, -0.2950209, 1.166151, 0, 0.454902, 1, 1,
0.2252032, 0.866223, 0.7567819, 0, 0.4470588, 1, 1,
0.2269798, -0.7909765, 2.455892, 0, 0.4431373, 1, 1,
0.2292489, 0.8986489, -1.231074, 0, 0.4352941, 1, 1,
0.2318477, 1.053647, -0.2168085, 0, 0.4313726, 1, 1,
0.2329728, -0.6457908, 3.43616, 0, 0.4235294, 1, 1,
0.2391571, 0.9758987, 0.7018191, 0, 0.4196078, 1, 1,
0.2465416, 0.2267741, 0.8959605, 0, 0.4117647, 1, 1,
0.2544865, -0.5960075, 0.9694076, 0, 0.4078431, 1, 1,
0.2568187, 0.467687, 0.8623308, 0, 0.4, 1, 1,
0.2579448, -0.5238838, 2.672939, 0, 0.3921569, 1, 1,
0.2581518, 0.869563, 1.726806, 0, 0.3882353, 1, 1,
0.2616855, -0.6244373, 2.354996, 0, 0.3803922, 1, 1,
0.2631719, 0.1175761, 0.8175725, 0, 0.3764706, 1, 1,
0.2726312, -1.002038, 1.469233, 0, 0.3686275, 1, 1,
0.2756259, -0.1638335, 2.745338, 0, 0.3647059, 1, 1,
0.2793947, -2.509413, 4.760861, 0, 0.3568628, 1, 1,
0.2831354, 0.4985719, 0.4478495, 0, 0.3529412, 1, 1,
0.2839877, -0.3799899, 1.220161, 0, 0.345098, 1, 1,
0.2846805, -2.010098, 1.857823, 0, 0.3411765, 1, 1,
0.2870596, -1.212535, 1.002938, 0, 0.3333333, 1, 1,
0.2904215, -0.1220213, 2.630635, 0, 0.3294118, 1, 1,
0.2908375, 2.162265, -0.806071, 0, 0.3215686, 1, 1,
0.291538, -0.1107552, 2.242606, 0, 0.3176471, 1, 1,
0.292691, 1.825639, 1.977183, 0, 0.3098039, 1, 1,
0.2929467, -0.6575592, 2.986057, 0, 0.3058824, 1, 1,
0.2929989, 0.04432473, 2.468764, 0, 0.2980392, 1, 1,
0.2973317, -0.3681785, 5.028727, 0, 0.2901961, 1, 1,
0.3075315, -1.276321, 4.33887, 0, 0.2862745, 1, 1,
0.3083054, 0.1149763, 1.773699, 0, 0.2784314, 1, 1,
0.313924, 0.8920017, 0.6568012, 0, 0.2745098, 1, 1,
0.3194402, 0.07018331, 3.51616, 0, 0.2666667, 1, 1,
0.3227051, -1.046066, 2.231224, 0, 0.2627451, 1, 1,
0.324383, 0.1935794, 2.74858, 0, 0.254902, 1, 1,
0.328849, 0.7538539, 0.4816667, 0, 0.2509804, 1, 1,
0.3304859, 2.281344, 0.1822374, 0, 0.2431373, 1, 1,
0.3412392, -0.5396319, 3.045086, 0, 0.2392157, 1, 1,
0.3424236, 1.931682, 0.6340514, 0, 0.2313726, 1, 1,
0.343898, -1.207367, 2.333778, 0, 0.227451, 1, 1,
0.3441477, -0.9535234, 2.886936, 0, 0.2196078, 1, 1,
0.3461218, 2.006924, 1.060986, 0, 0.2156863, 1, 1,
0.34866, 0.3827889, 0.2798172, 0, 0.2078431, 1, 1,
0.3526085, 1.641298, -0.3651566, 0, 0.2039216, 1, 1,
0.3530367, 1.008589, 1.896884, 0, 0.1960784, 1, 1,
0.3537888, -1.042228, 3.338823, 0, 0.1882353, 1, 1,
0.3546124, 0.04241542, 3.003298, 0, 0.1843137, 1, 1,
0.3707318, -1.744692, 1.021114, 0, 0.1764706, 1, 1,
0.3714027, -0.08509953, 1.409178, 0, 0.172549, 1, 1,
0.3731102, -1.139016, 1.429932, 0, 0.1647059, 1, 1,
0.3775753, -0.7249575, 2.163317, 0, 0.1607843, 1, 1,
0.3792069, -0.02015611, 1.46393, 0, 0.1529412, 1, 1,
0.3804475, -1.990149, 2.422062, 0, 0.1490196, 1, 1,
0.3806663, -0.3993348, -0.445869, 0, 0.1411765, 1, 1,
0.3833805, -1.482738, 3.626613, 0, 0.1372549, 1, 1,
0.3912281, 0.1399498, 0.602973, 0, 0.1294118, 1, 1,
0.3933406, 0.08208185, 2.325514, 0, 0.1254902, 1, 1,
0.4034681, -0.5701083, 3.420445, 0, 0.1176471, 1, 1,
0.4037618, 1.200626, 1.441469, 0, 0.1137255, 1, 1,
0.4075932, 1.311936, 0.2114796, 0, 0.1058824, 1, 1,
0.4106091, -1.086778, 1.789308, 0, 0.09803922, 1, 1,
0.4113912, -1.003188, 2.099507, 0, 0.09411765, 1, 1,
0.4129091, -1.323249, 2.441558, 0, 0.08627451, 1, 1,
0.4160881, 0.03791058, 2.596714, 0, 0.08235294, 1, 1,
0.4214937, 1.934219, 0.8091829, 0, 0.07450981, 1, 1,
0.4216638, -1.774444, 2.438938, 0, 0.07058824, 1, 1,
0.4247203, -1.369503, 3.763937, 0, 0.0627451, 1, 1,
0.4345842, 0.3073938, 0.8576028, 0, 0.05882353, 1, 1,
0.4382989, 0.8805471, 1.450765, 0, 0.05098039, 1, 1,
0.4434607, -0.5135804, 2.404836, 0, 0.04705882, 1, 1,
0.4498423, -0.4208504, -0.02059855, 0, 0.03921569, 1, 1,
0.4510153, -0.7095634, 4.28333, 0, 0.03529412, 1, 1,
0.4527949, 1.352244, 1.387865, 0, 0.02745098, 1, 1,
0.4538305, -0.9007471, 5.327906, 0, 0.02352941, 1, 1,
0.4547481, 0.9598565, -0.3656145, 0, 0.01568628, 1, 1,
0.4549484, -0.2283341, 2.093305, 0, 0.01176471, 1, 1,
0.4593937, 0.3002455, 0.8633752, 0, 0.003921569, 1, 1,
0.4645526, 0.1813148, 1.625441, 0.003921569, 0, 1, 1,
0.4657417, 0.495487, 0.4567046, 0.007843138, 0, 1, 1,
0.4668, 1.891638, 0.4928428, 0.01568628, 0, 1, 1,
0.4675868, 0.4729129, -0.07438492, 0.01960784, 0, 1, 1,
0.4678361, 0.6138788, -1.058146, 0.02745098, 0, 1, 1,
0.4741169, 0.3611532, -0.6475545, 0.03137255, 0, 1, 1,
0.4762413, 1.685654, 0.2375857, 0.03921569, 0, 1, 1,
0.478822, 1.645275, 0.2727965, 0.04313726, 0, 1, 1,
0.4828226, -0.6042651, 2.657397, 0.05098039, 0, 1, 1,
0.4834304, 0.566169, 1.195813, 0.05490196, 0, 1, 1,
0.4836579, -0.2860605, 1.975451, 0.0627451, 0, 1, 1,
0.4845536, 0.8870028, 0.2505418, 0.06666667, 0, 1, 1,
0.4849377, -0.4026093, 0.8369221, 0.07450981, 0, 1, 1,
0.4851205, 1.900887, -0.5635688, 0.07843138, 0, 1, 1,
0.4868739, -0.9996272, 3.940607, 0.08627451, 0, 1, 1,
0.4904337, -0.1078582, 1.628577, 0.09019608, 0, 1, 1,
0.4909145, -1.144415, 2.565635, 0.09803922, 0, 1, 1,
0.4928781, -0.1107371, 2.126029, 0.1058824, 0, 1, 1,
0.4976077, 0.352942, 0.7403249, 0.1098039, 0, 1, 1,
0.5035707, 0.7969201, -0.1089356, 0.1176471, 0, 1, 1,
0.5036526, -0.1842896, 2.461137, 0.1215686, 0, 1, 1,
0.5079576, -0.35693, 2.256341, 0.1294118, 0, 1, 1,
0.5094953, -0.7441586, 1.889246, 0.1333333, 0, 1, 1,
0.5108181, 0.5356981, 0.3734159, 0.1411765, 0, 1, 1,
0.5158118, 0.6681817, 0.5409518, 0.145098, 0, 1, 1,
0.5162632, 0.6980049, 0.8646182, 0.1529412, 0, 1, 1,
0.5170491, 0.3488322, 0.8855132, 0.1568628, 0, 1, 1,
0.517871, -1.962743, 2.340427, 0.1647059, 0, 1, 1,
0.522558, -2.067859, 3.39235, 0.1686275, 0, 1, 1,
0.5243745, 0.9407452, 1.800561, 0.1764706, 0, 1, 1,
0.5306201, -1.058859, 2.943585, 0.1803922, 0, 1, 1,
0.5348533, -0.7298792, 2.97499, 0.1882353, 0, 1, 1,
0.5383387, 1.304273, -0.4220711, 0.1921569, 0, 1, 1,
0.5385339, -1.093427, 3.284477, 0.2, 0, 1, 1,
0.5477479, 0.01298546, 1.055249, 0.2078431, 0, 1, 1,
0.5528725, -1.275558, 5.253247, 0.2117647, 0, 1, 1,
0.5542429, 1.515376, 0.4625724, 0.2196078, 0, 1, 1,
0.5556508, 1.137047, 1.924167, 0.2235294, 0, 1, 1,
0.558565, -0.9321445, 2.607828, 0.2313726, 0, 1, 1,
0.5632989, -1.467536, 4.359987, 0.2352941, 0, 1, 1,
0.566982, 0.3809937, 2.333466, 0.2431373, 0, 1, 1,
0.568452, -1.34072, 4.31684, 0.2470588, 0, 1, 1,
0.5756903, -0.5636059, 1.969582, 0.254902, 0, 1, 1,
0.5781531, 1.97058, 0.7822703, 0.2588235, 0, 1, 1,
0.5809276, 0.935524, 0.4380035, 0.2666667, 0, 1, 1,
0.5820293, -0.6511628, 1.642818, 0.2705882, 0, 1, 1,
0.5845463, -0.3689776, 2.419829, 0.2784314, 0, 1, 1,
0.5851175, -0.7914055, 2.286225, 0.282353, 0, 1, 1,
0.5873844, -0.6122932, 2.677642, 0.2901961, 0, 1, 1,
0.5891895, -0.5781704, 3.475471, 0.2941177, 0, 1, 1,
0.5907173, 0.9792791, 1.849145, 0.3019608, 0, 1, 1,
0.5920304, 1.370467, 1.462416, 0.3098039, 0, 1, 1,
0.5927625, -1.549725, 4.828217, 0.3137255, 0, 1, 1,
0.5937936, -0.5838016, 2.513324, 0.3215686, 0, 1, 1,
0.5955078, -1.525662, 3.577151, 0.3254902, 0, 1, 1,
0.5981516, -0.3409841, 2.559515, 0.3333333, 0, 1, 1,
0.5988439, 0.7875636, 0.3263162, 0.3372549, 0, 1, 1,
0.5989548, 0.7132379, 0.3841856, 0.345098, 0, 1, 1,
0.6017193, 0.3249437, 0.04007338, 0.3490196, 0, 1, 1,
0.6039457, 0.02387522, 1.839674, 0.3568628, 0, 1, 1,
0.6072999, -0.005904649, 2.65611, 0.3607843, 0, 1, 1,
0.6077936, -0.6141636, 3.465249, 0.3686275, 0, 1, 1,
0.6082408, -0.180001, 2.389097, 0.372549, 0, 1, 1,
0.6090036, 1.023343, 0.4696875, 0.3803922, 0, 1, 1,
0.6124941, -0.1219626, 1.815005, 0.3843137, 0, 1, 1,
0.6125848, 0.4259287, -0.750663, 0.3921569, 0, 1, 1,
0.6131896, -1.01191, 0.2057399, 0.3960784, 0, 1, 1,
0.6160522, 1.502912, 0.3375102, 0.4039216, 0, 1, 1,
0.6165477, 1.424963, -0.06616728, 0.4117647, 0, 1, 1,
0.6211886, -0.003965016, 1.245675, 0.4156863, 0, 1, 1,
0.6265656, -0.6600279, 3.246812, 0.4235294, 0, 1, 1,
0.6284732, 0.9750586, 0.9716771, 0.427451, 0, 1, 1,
0.6303123, -0.1449251, 1.797432, 0.4352941, 0, 1, 1,
0.6395358, -1.382155, 2.949001, 0.4392157, 0, 1, 1,
0.6434084, 0.08219521, 1.459519, 0.4470588, 0, 1, 1,
0.6447437, -1.639016, 2.941748, 0.4509804, 0, 1, 1,
0.6517007, 0.1275101, -0.1708253, 0.4588235, 0, 1, 1,
0.6542818, -0.8237167, 2.350867, 0.4627451, 0, 1, 1,
0.6554707, -0.1283681, 2.177259, 0.4705882, 0, 1, 1,
0.6568107, -1.737217, 2.60148, 0.4745098, 0, 1, 1,
0.6581557, -0.02454129, 2.200603, 0.4823529, 0, 1, 1,
0.6639653, 0.453736, 0.8931834, 0.4862745, 0, 1, 1,
0.6644957, 0.6837381, 1.917349, 0.4941176, 0, 1, 1,
0.6656789, -0.4119357, 2.234372, 0.5019608, 0, 1, 1,
0.6688282, -1.394221, 2.201226, 0.5058824, 0, 1, 1,
0.6705554, -0.3713198, 2.348118, 0.5137255, 0, 1, 1,
0.6707625, 0.5919579, 1.852677, 0.5176471, 0, 1, 1,
0.670903, -0.9755925, 3.851584, 0.5254902, 0, 1, 1,
0.6709819, 0.6727006, 0.01638293, 0.5294118, 0, 1, 1,
0.678127, 0.3110135, 1.482111, 0.5372549, 0, 1, 1,
0.6930097, 1.033711, 1.059642, 0.5411765, 0, 1, 1,
0.6996855, -0.2831081, 1.946146, 0.5490196, 0, 1, 1,
0.7028003, 0.5146708, 2.028261, 0.5529412, 0, 1, 1,
0.7031739, -0.2967777, 2.696833, 0.5607843, 0, 1, 1,
0.7060472, 0.6922774, 1.754472, 0.5647059, 0, 1, 1,
0.7109441, 0.369672, 2.938656, 0.572549, 0, 1, 1,
0.7130187, -0.555421, 3.279475, 0.5764706, 0, 1, 1,
0.7149658, -2.355237, 1.36928, 0.5843138, 0, 1, 1,
0.7162248, -2.284706, 3.67207, 0.5882353, 0, 1, 1,
0.7163298, 1.209812, 1.724496, 0.5960785, 0, 1, 1,
0.7177032, -0.4623733, 2.860715, 0.6039216, 0, 1, 1,
0.7202024, 0.1833777, 2.617352, 0.6078432, 0, 1, 1,
0.7222475, -1.555335, 4.756572, 0.6156863, 0, 1, 1,
0.7227631, -0.8458131, 3.696587, 0.6196079, 0, 1, 1,
0.7230764, 0.514615, 2.376131, 0.627451, 0, 1, 1,
0.7315369, -2.428764, 4.144462, 0.6313726, 0, 1, 1,
0.7330769, -1.935912, 2.644165, 0.6392157, 0, 1, 1,
0.7367511, 0.8186325, 2.099147, 0.6431373, 0, 1, 1,
0.7371629, 0.2643992, -0.1938574, 0.6509804, 0, 1, 1,
0.7387288, 0.5537887, 0.7458409, 0.654902, 0, 1, 1,
0.7394868, -0.07579404, 3.197237, 0.6627451, 0, 1, 1,
0.7413285, -0.8425207, 4.346005, 0.6666667, 0, 1, 1,
0.741751, -0.78374, 1.775734, 0.6745098, 0, 1, 1,
0.7441392, 1.29947, 1.169828, 0.6784314, 0, 1, 1,
0.7466757, -0.8770692, 2.350662, 0.6862745, 0, 1, 1,
0.7515989, -2.153035, 1.889979, 0.6901961, 0, 1, 1,
0.7530212, -0.563171, 5.296908, 0.6980392, 0, 1, 1,
0.7589518, -0.5822906, 1.958439, 0.7058824, 0, 1, 1,
0.7601334, -0.8934911, 2.041227, 0.7098039, 0, 1, 1,
0.7694024, 0.462179, 1.911991, 0.7176471, 0, 1, 1,
0.7709449, 1.307336, 1.90304, 0.7215686, 0, 1, 1,
0.772003, -0.5663065, 2.232713, 0.7294118, 0, 1, 1,
0.7829475, -0.8035672, 2.396154, 0.7333333, 0, 1, 1,
0.7847231, -0.7941867, 2.770135, 0.7411765, 0, 1, 1,
0.786187, -0.998598, 2.453271, 0.7450981, 0, 1, 1,
0.7868245, -0.1694219, 2.803475, 0.7529412, 0, 1, 1,
0.7927871, -1.7043, 1.840339, 0.7568628, 0, 1, 1,
0.7933273, 1.564092, 0.6603386, 0.7647059, 0, 1, 1,
0.7992123, -0.08518097, 0.7812966, 0.7686275, 0, 1, 1,
0.8007232, 0.01115973, 3.053249, 0.7764706, 0, 1, 1,
0.8095807, 0.2498146, 0.8567101, 0.7803922, 0, 1, 1,
0.8099807, 1.826075, 0.3647573, 0.7882353, 0, 1, 1,
0.8103645, 0.8120391, 1.555938, 0.7921569, 0, 1, 1,
0.8140358, -0.07978613, 2.041194, 0.8, 0, 1, 1,
0.8175635, -2.230989, 3.509773, 0.8078431, 0, 1, 1,
0.8202491, 2.679816, -0.3959042, 0.8117647, 0, 1, 1,
0.829212, -0.3262486, 1.922573, 0.8196079, 0, 1, 1,
0.8292152, -0.2481747, 1.878592, 0.8235294, 0, 1, 1,
0.8295196, -1.380022, 1.963602, 0.8313726, 0, 1, 1,
0.8301585, 0.4108083, 0.5692394, 0.8352941, 0, 1, 1,
0.8329986, 0.5697871, -0.3006916, 0.8431373, 0, 1, 1,
0.8338363, 0.2235401, 0.09776948, 0.8470588, 0, 1, 1,
0.8344139, 1.854296, 0.1787802, 0.854902, 0, 1, 1,
0.841315, -1.231684, 1.309905, 0.8588235, 0, 1, 1,
0.8437101, -0.09214086, 3.921197, 0.8666667, 0, 1, 1,
0.8446757, -0.1823132, 0.4272752, 0.8705882, 0, 1, 1,
0.85287, -0.08488305, 1.908111, 0.8784314, 0, 1, 1,
0.8537818, -0.542685, 3.285263, 0.8823529, 0, 1, 1,
0.8587933, -0.6072991, 1.864485, 0.8901961, 0, 1, 1,
0.8592405, -2.068896, 2.132387, 0.8941177, 0, 1, 1,
0.8673734, -0.8991411, 2.998331, 0.9019608, 0, 1, 1,
0.8690112, -0.3037304, 0.9095696, 0.9098039, 0, 1, 1,
0.8711493, -0.5380507, 0.2081418, 0.9137255, 0, 1, 1,
0.871217, 1.176888, 0.8404475, 0.9215686, 0, 1, 1,
0.8739337, -0.1332816, 1.3272, 0.9254902, 0, 1, 1,
0.8817195, -0.7332089, 2.327621, 0.9333333, 0, 1, 1,
0.8818452, 0.1941985, 2.233078, 0.9372549, 0, 1, 1,
0.8844521, -0.7073464, 3.403096, 0.945098, 0, 1, 1,
0.8858941, -0.8920438, 2.232478, 0.9490196, 0, 1, 1,
0.8887687, 1.337036, 1.510871, 0.9568627, 0, 1, 1,
0.8898045, -0.626983, 0.7191441, 0.9607843, 0, 1, 1,
0.891, 0.1567012, 1.455451, 0.9686275, 0, 1, 1,
0.8972201, 1.157495, -0.786999, 0.972549, 0, 1, 1,
0.9011534, -0.9141332, 3.956629, 0.9803922, 0, 1, 1,
0.9048303, -0.5419182, 3.399689, 0.9843137, 0, 1, 1,
0.9100335, 0.5393818, 0.4353454, 0.9921569, 0, 1, 1,
0.9146205, -0.1540937, 1.288924, 0.9960784, 0, 1, 1,
0.9159582, -1.442379, 2.502506, 1, 0, 0.9960784, 1,
0.9172451, -1.040062, 2.666521, 1, 0, 0.9882353, 1,
0.9228425, 0.8335014, -0.3011292, 1, 0, 0.9843137, 1,
0.9305259, 0.1077173, 2.229237, 1, 0, 0.9764706, 1,
0.9334962, 1.716266, 0.3280281, 1, 0, 0.972549, 1,
0.9392467, -0.1813799, 0.9340757, 1, 0, 0.9647059, 1,
0.9476455, -0.01158321, -0.05178976, 1, 0, 0.9607843, 1,
0.9491917, -0.6745342, 2.773373, 1, 0, 0.9529412, 1,
0.9532661, 0.1260751, 2.202483, 1, 0, 0.9490196, 1,
0.9550172, 1.333655, 1.147818, 1, 0, 0.9411765, 1,
0.9595157, -0.6769778, 2.688308, 1, 0, 0.9372549, 1,
0.9676815, -1.134273, 0.9951696, 1, 0, 0.9294118, 1,
0.9740178, -0.1060429, 2.039878, 1, 0, 0.9254902, 1,
0.9743421, 0.1501768, 1.645549, 1, 0, 0.9176471, 1,
0.9749956, -1.931484, 4.510414, 1, 0, 0.9137255, 1,
0.9760243, 1.338144, 1.529578, 1, 0, 0.9058824, 1,
0.9803317, -0.485004, 2.290946, 1, 0, 0.9019608, 1,
0.9835705, 0.2122736, 1.554592, 1, 0, 0.8941177, 1,
0.9848649, 0.5589353, 1.281031, 1, 0, 0.8862745, 1,
0.9903821, -0.3833812, 1.519915, 1, 0, 0.8823529, 1,
0.9975426, 1.779039, 2.523476, 1, 0, 0.8745098, 1,
1.012739, 0.8565471, -0.9095857, 1, 0, 0.8705882, 1,
1.019765, -0.3919113, 0.6707156, 1, 0, 0.8627451, 1,
1.021974, -1.196331, 3.414737, 1, 0, 0.8588235, 1,
1.030404, -1.247264, 0.8495703, 1, 0, 0.8509804, 1,
1.031504, -0.2347176, 2.251945, 1, 0, 0.8470588, 1,
1.034456, 1.577633, 0.585157, 1, 0, 0.8392157, 1,
1.040119, 0.08871921, 1.856005, 1, 0, 0.8352941, 1,
1.043021, -0.6692159, 1.765373, 1, 0, 0.827451, 1,
1.060865, -1.195996, 2.638293, 1, 0, 0.8235294, 1,
1.067929, -0.6004111, 2.318187, 1, 0, 0.8156863, 1,
1.073478, -1.748943, 3.411887, 1, 0, 0.8117647, 1,
1.074235, 0.08859866, 2.560128, 1, 0, 0.8039216, 1,
1.074531, -0.8171571, 3.029321, 1, 0, 0.7960784, 1,
1.08422, 0.3593315, 2.175113, 1, 0, 0.7921569, 1,
1.084839, 1.295153, -0.874685, 1, 0, 0.7843137, 1,
1.087297, -0.7298891, 2.704675, 1, 0, 0.7803922, 1,
1.101701, -0.1612639, 0.8473613, 1, 0, 0.772549, 1,
1.10885, 1.377417, 0.09300216, 1, 0, 0.7686275, 1,
1.109842, 0.4311902, 0.990093, 1, 0, 0.7607843, 1,
1.111365, 0.916245, 2.294845, 1, 0, 0.7568628, 1,
1.115296, -1.264571, 2.495755, 1, 0, 0.7490196, 1,
1.115773, 0.514218, 0.4826591, 1, 0, 0.7450981, 1,
1.123151, -1.691931, 2.464179, 1, 0, 0.7372549, 1,
1.128287, 1.171476, 0.6388612, 1, 0, 0.7333333, 1,
1.134869, 0.5354961, 2.804008, 1, 0, 0.7254902, 1,
1.137748, 0.06261043, 1.937505, 1, 0, 0.7215686, 1,
1.14273, 1.287658, 0.2488591, 1, 0, 0.7137255, 1,
1.151186, 1.230244, -0.1528713, 1, 0, 0.7098039, 1,
1.152015, 1.177367, -0.8653386, 1, 0, 0.7019608, 1,
1.157588, -1.664376, 2.428921, 1, 0, 0.6941177, 1,
1.165651, -1.761338, 2.256555, 1, 0, 0.6901961, 1,
1.170389, 0.3995719, 0.7937117, 1, 0, 0.682353, 1,
1.171486, 0.01699823, -0.07963097, 1, 0, 0.6784314, 1,
1.188815, -0.6161774, 0.7768043, 1, 0, 0.6705883, 1,
1.19293, -1.588009, 2.413207, 1, 0, 0.6666667, 1,
1.194196, 0.6535473, 0.9812316, 1, 0, 0.6588235, 1,
1.194345, -0.7806466, 2.010479, 1, 0, 0.654902, 1,
1.2173, -1.746468, 1.521555, 1, 0, 0.6470588, 1,
1.219516, 0.1831365, 0.7672762, 1, 0, 0.6431373, 1,
1.222932, -1.041785, 3.073382, 1, 0, 0.6352941, 1,
1.227575, 0.9160077, -0.0743365, 1, 0, 0.6313726, 1,
1.239684, 2.262742, 0.2658148, 1, 0, 0.6235294, 1,
1.256868, 2.099998, 0.3008142, 1, 0, 0.6196079, 1,
1.274976, -0.06654553, 1.038096, 1, 0, 0.6117647, 1,
1.275437, -0.7654257, 1.714234, 1, 0, 0.6078432, 1,
1.281186, 1.088617, 2.238302, 1, 0, 0.6, 1,
1.292361, 0.3378112, 1.461883, 1, 0, 0.5921569, 1,
1.293904, -2.43135, 2.212392, 1, 0, 0.5882353, 1,
1.295874, -0.4829916, 1.443551, 1, 0, 0.5803922, 1,
1.304531, 0.9800321, 2.012374, 1, 0, 0.5764706, 1,
1.30459, 0.7735879, 0.1864277, 1, 0, 0.5686275, 1,
1.310329, 0.7545177, 1.494301, 1, 0, 0.5647059, 1,
1.310483, -1.374682, 3.18373, 1, 0, 0.5568628, 1,
1.313283, -0.1928447, -0.2082655, 1, 0, 0.5529412, 1,
1.323262, 0.7314181, 1.83014, 1, 0, 0.5450981, 1,
1.326153, 0.647492, 0.9056454, 1, 0, 0.5411765, 1,
1.328361, 0.9854202, 0.7312865, 1, 0, 0.5333334, 1,
1.339184, -0.959898, 3.027684, 1, 0, 0.5294118, 1,
1.341021, -0.875191, 2.32842, 1, 0, 0.5215687, 1,
1.346703, 1.476925, 0.6792265, 1, 0, 0.5176471, 1,
1.348956, -0.8220356, 1.424356, 1, 0, 0.509804, 1,
1.352419, 0.3867723, 1.187575, 1, 0, 0.5058824, 1,
1.353916, 0.1538611, 1.863695, 1, 0, 0.4980392, 1,
1.365047, 1.177033, 0.07039776, 1, 0, 0.4901961, 1,
1.377837, 0.7001956, 2.590467, 1, 0, 0.4862745, 1,
1.385175, -0.08753434, 1.848295, 1, 0, 0.4784314, 1,
1.396711, -1.597422, 0.3735518, 1, 0, 0.4745098, 1,
1.40487, -0.6703425, 2.941179, 1, 0, 0.4666667, 1,
1.416592, -1.794626, 0.7992426, 1, 0, 0.4627451, 1,
1.417911, -0.598202, 0.9662048, 1, 0, 0.454902, 1,
1.422508, -0.3013393, 2.218799, 1, 0, 0.4509804, 1,
1.423852, 1.563345, 0.4418634, 1, 0, 0.4431373, 1,
1.427866, 0.8070028, 1.153959, 1, 0, 0.4392157, 1,
1.429931, 0.7697057, 2.200715, 1, 0, 0.4313726, 1,
1.434688, 0.2626044, 1.796718, 1, 0, 0.427451, 1,
1.437003, 1.140519, -2.108794, 1, 0, 0.4196078, 1,
1.445987, 0.1175483, 2.885791, 1, 0, 0.4156863, 1,
1.450756, 0.3000172, -0.09182654, 1, 0, 0.4078431, 1,
1.455108, -0.2467924, 2.033205, 1, 0, 0.4039216, 1,
1.457422, 0.8712062, 2.232296, 1, 0, 0.3960784, 1,
1.464474, -0.5465797, 2.496406, 1, 0, 0.3882353, 1,
1.469629, -0.8040308, 2.336092, 1, 0, 0.3843137, 1,
1.482062, -0.9471397, 1.818328, 1, 0, 0.3764706, 1,
1.48665, -0.3191167, 1.986571, 1, 0, 0.372549, 1,
1.49815, 0.2627913, 1.582807, 1, 0, 0.3647059, 1,
1.531621, 0.5710538, 0.5693177, 1, 0, 0.3607843, 1,
1.536447, -0.3972814, 1.530895, 1, 0, 0.3529412, 1,
1.544028, 1.920382, 1.604569, 1, 0, 0.3490196, 1,
1.545937, -0.4187167, 1.572459, 1, 0, 0.3411765, 1,
1.564746, -0.6965631, 2.732763, 1, 0, 0.3372549, 1,
1.565037, -0.1763944, 0.5390989, 1, 0, 0.3294118, 1,
1.569513, 1.132884, 2.794351, 1, 0, 0.3254902, 1,
1.578937, -0.2033983, 2.344866, 1, 0, 0.3176471, 1,
1.586562, -1.061856, 1.772132, 1, 0, 0.3137255, 1,
1.597724, 1.271735, -0.649685, 1, 0, 0.3058824, 1,
1.60562, -0.5737753, 1.689007, 1, 0, 0.2980392, 1,
1.606934, 0.6930335, 1.04696, 1, 0, 0.2941177, 1,
1.642763, 1.365324, 2.195662, 1, 0, 0.2862745, 1,
1.65476, 0.7136294, 1.246147, 1, 0, 0.282353, 1,
1.668494, 0.6939772, 1.482883, 1, 0, 0.2745098, 1,
1.668958, -0.6883748, 0.7082402, 1, 0, 0.2705882, 1,
1.672808, 1.32215, 1.293503, 1, 0, 0.2627451, 1,
1.681986, -0.3097836, 1.512739, 1, 0, 0.2588235, 1,
1.684469, 0.6682067, 0.2584516, 1, 0, 0.2509804, 1,
1.694204, -0.2717084, 1.115909, 1, 0, 0.2470588, 1,
1.704125, 0.04408426, 1.823848, 1, 0, 0.2392157, 1,
1.705863, 0.9766783, -0.1204382, 1, 0, 0.2352941, 1,
1.706103, -1.097654, 2.998863, 1, 0, 0.227451, 1,
1.709317, -1.389848, 2.206409, 1, 0, 0.2235294, 1,
1.712102, -0.7486012, 0.7415125, 1, 0, 0.2156863, 1,
1.724577, -0.1816224, 1.738767, 1, 0, 0.2117647, 1,
1.726728, 0.04425726, 1.751871, 1, 0, 0.2039216, 1,
1.728261, 0.3765813, 2.65758, 1, 0, 0.1960784, 1,
1.750347, -0.0418686, 0.8926614, 1, 0, 0.1921569, 1,
1.751014, -1.150371, 1.387361, 1, 0, 0.1843137, 1,
1.763153, 0.3269389, 2.765545, 1, 0, 0.1803922, 1,
1.785825, 0.7508521, 1.741316, 1, 0, 0.172549, 1,
1.787515, -0.06780996, 1.28214, 1, 0, 0.1686275, 1,
1.796936, 0.2286878, 0.7734039, 1, 0, 0.1607843, 1,
1.851806, 0.2316401, 1.483229, 1, 0, 0.1568628, 1,
1.854223, 1.432505, -0.4256486, 1, 0, 0.1490196, 1,
1.863892, -0.05576001, 2.653475, 1, 0, 0.145098, 1,
1.87866, 0.3291999, 1.179685, 1, 0, 0.1372549, 1,
1.886872, -1.733377, 2.780551, 1, 0, 0.1333333, 1,
1.939353, 2.263531, 0.4133589, 1, 0, 0.1254902, 1,
1.997863, -0.6076305, 1.247549, 1, 0, 0.1215686, 1,
2.000737, -0.1765765, 1.025376, 1, 0, 0.1137255, 1,
2.066119, 0.8128765, 2.042626, 1, 0, 0.1098039, 1,
2.081769, -2.265449, 3.104165, 1, 0, 0.1019608, 1,
2.086425, -0.2671072, 1.697168, 1, 0, 0.09411765, 1,
2.115929, 2.504604, 1.419209, 1, 0, 0.09019608, 1,
2.173464, -0.1094105, 2.396821, 1, 0, 0.08235294, 1,
2.211567, 1.223163, 1.842557, 1, 0, 0.07843138, 1,
2.215525, 0.1699937, 1.437551, 1, 0, 0.07058824, 1,
2.229778, 1.994275, 1.052281, 1, 0, 0.06666667, 1,
2.237147, 0.4687075, 1.899913, 1, 0, 0.05882353, 1,
2.257721, 0.1535648, -0.2505887, 1, 0, 0.05490196, 1,
2.429555, 0.8726754, 2.391398, 1, 0, 0.04705882, 1,
2.516416, 0.002039736, 0.7273321, 1, 0, 0.04313726, 1,
2.58887, -1.340178, 1.257931, 1, 0, 0.03529412, 1,
2.672209, -0.5783705, 1.940358, 1, 0, 0.03137255, 1,
2.673079, 1.174075, 0.389017, 1, 0, 0.02352941, 1,
2.915345, 1.292853, 1.273411, 1, 0, 0.01960784, 1,
2.927811, 0.9830257, 1.890224, 1, 0, 0.01176471, 1,
3.053954, -0.7318023, 1.66332, 1, 0, 0.007843138, 1
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
0.1031594, -4.371796, -6.841486, 0, -0.5, 0.5, 0.5,
0.1031594, -4.371796, -6.841486, 1, -0.5, 0.5, 0.5,
0.1031594, -4.371796, -6.841486, 1, 1.5, 0.5, 0.5,
0.1031594, -4.371796, -6.841486, 0, 1.5, 0.5, 0.5
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
-3.847954, 0.09221756, -6.841486, 0, -0.5, 0.5, 0.5,
-3.847954, 0.09221756, -6.841486, 1, -0.5, 0.5, 0.5,
-3.847954, 0.09221756, -6.841486, 1, 1.5, 0.5, 0.5,
-3.847954, 0.09221756, -6.841486, 0, 1.5, 0.5, 0.5
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
-3.847954, -4.371796, 0.1250877, 0, -0.5, 0.5, 0.5,
-3.847954, -4.371796, 0.1250877, 1, -0.5, 0.5, 0.5,
-3.847954, -4.371796, 0.1250877, 1, 1.5, 0.5, 0.5,
-3.847954, -4.371796, 0.1250877, 0, 1.5, 0.5, 0.5
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
-2, -3.341639, -5.233815,
3, -3.341639, -5.233815,
-2, -3.341639, -5.233815,
-2, -3.513331, -5.50176,
-1, -3.341639, -5.233815,
-1, -3.513331, -5.50176,
0, -3.341639, -5.233815,
0, -3.513331, -5.50176,
1, -3.341639, -5.233815,
1, -3.513331, -5.50176,
2, -3.341639, -5.233815,
2, -3.513331, -5.50176,
3, -3.341639, -5.233815,
3, -3.513331, -5.50176
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
-2, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
-2, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
-2, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
-2, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5,
-1, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
-1, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
-1, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
-1, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5,
0, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
0, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
0, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
0, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5,
1, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
1, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
1, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
1, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5,
2, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
2, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
2, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
2, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5,
3, -3.856717, -6.03765, 0, -0.5, 0.5, 0.5,
3, -3.856717, -6.03765, 1, -0.5, 0.5, 0.5,
3, -3.856717, -6.03765, 1, 1.5, 0.5, 0.5,
3, -3.856717, -6.03765, 0, 1.5, 0.5, 0.5
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
-2.936159, -3, -5.233815,
-2.936159, 3, -5.233815,
-2.936159, -3, -5.233815,
-3.088125, -3, -5.50176,
-2.936159, -2, -5.233815,
-3.088125, -2, -5.50176,
-2.936159, -1, -5.233815,
-3.088125, -1, -5.50176,
-2.936159, 0, -5.233815,
-3.088125, 0, -5.50176,
-2.936159, 1, -5.233815,
-3.088125, 1, -5.50176,
-2.936159, 2, -5.233815,
-3.088125, 2, -5.50176,
-2.936159, 3, -5.233815,
-3.088125, 3, -5.50176
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
-3.392056, -3, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, -3, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, -3, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, -3, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, -2, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, -2, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, -2, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, -2, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, -1, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, -1, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, -1, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, -1, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, 0, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, 0, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, 0, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, 0, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, 1, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, 1, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, 1, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, 1, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, 2, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, 2, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, 2, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, 2, -6.03765, 0, 1.5, 0.5, 0.5,
-3.392056, 3, -6.03765, 0, -0.5, 0.5, 0.5,
-3.392056, 3, -6.03765, 1, -0.5, 0.5, 0.5,
-3.392056, 3, -6.03765, 1, 1.5, 0.5, 0.5,
-3.392056, 3, -6.03765, 0, 1.5, 0.5, 0.5
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
-2.936159, -3.341639, -4,
-2.936159, -3.341639, 4,
-2.936159, -3.341639, -4,
-3.088125, -3.513331, -4,
-2.936159, -3.341639, -2,
-3.088125, -3.513331, -2,
-2.936159, -3.341639, 0,
-3.088125, -3.513331, 0,
-2.936159, -3.341639, 2,
-3.088125, -3.513331, 2,
-2.936159, -3.341639, 4,
-3.088125, -3.513331, 4
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
-3.392056, -3.856717, -4, 0, -0.5, 0.5, 0.5,
-3.392056, -3.856717, -4, 1, -0.5, 0.5, 0.5,
-3.392056, -3.856717, -4, 1, 1.5, 0.5, 0.5,
-3.392056, -3.856717, -4, 0, 1.5, 0.5, 0.5,
-3.392056, -3.856717, -2, 0, -0.5, 0.5, 0.5,
-3.392056, -3.856717, -2, 1, -0.5, 0.5, 0.5,
-3.392056, -3.856717, -2, 1, 1.5, 0.5, 0.5,
-3.392056, -3.856717, -2, 0, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 0, 0, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 0, 1, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 0, 1, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 0, 0, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 2, 0, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 2, 1, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 2, 1, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 2, 0, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 4, 0, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 4, 1, -0.5, 0.5, 0.5,
-3.392056, -3.856717, 4, 1, 1.5, 0.5, 0.5,
-3.392056, -3.856717, 4, 0, 1.5, 0.5, 0.5
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
-2.936159, -3.341639, -5.233815,
-2.936159, 3.526074, -5.233815,
-2.936159, -3.341639, 5.48399,
-2.936159, 3.526074, 5.48399,
-2.936159, -3.341639, -5.233815,
-2.936159, -3.341639, 5.48399,
-2.936159, 3.526074, -5.233815,
-2.936159, 3.526074, 5.48399,
-2.936159, -3.341639, -5.233815,
3.142478, -3.341639, -5.233815,
-2.936159, -3.341639, 5.48399,
3.142478, -3.341639, 5.48399,
-2.936159, 3.526074, -5.233815,
3.142478, 3.526074, -5.233815,
-2.936159, 3.526074, 5.48399,
3.142478, 3.526074, 5.48399,
3.142478, -3.341639, -5.233815,
3.142478, 3.526074, -5.233815,
3.142478, -3.341639, 5.48399,
3.142478, 3.526074, 5.48399,
3.142478, -3.341639, -5.233815,
3.142478, -3.341639, 5.48399,
3.142478, 3.526074, -5.233815,
3.142478, 3.526074, 5.48399
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
var radius = 7.53247;
var distance = 33.51281;
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
mvMatrix.translate( -0.1031594, -0.09221756, -0.1250877 );
mvMatrix.scale( 1.339816, 1.185876, 0.7598808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.51281);
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


