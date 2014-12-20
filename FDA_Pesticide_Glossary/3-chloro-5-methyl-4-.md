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
-3.125008, -0.07137266, -0.7840625, 1, 0, 0, 1,
-2.759058, 0.01020543, 0.8114988, 1, 0.007843138, 0, 1,
-2.678364, 1.962959, -1.006226, 1, 0.01176471, 0, 1,
-2.670142, -1.207083, -1.184157, 1, 0.01960784, 0, 1,
-2.647686, 1.655169, -1.018548, 1, 0.02352941, 0, 1,
-2.644986, 0.01931044, 0.4258124, 1, 0.03137255, 0, 1,
-2.49152, 1.018267, -0.9551517, 1, 0.03529412, 0, 1,
-2.488221, 0.2412996, -2.378934, 1, 0.04313726, 0, 1,
-2.440714, -0.07871698, 0.1048805, 1, 0.04705882, 0, 1,
-2.439619, 0.02184133, -1.743141, 1, 0.05490196, 0, 1,
-2.408302, -0.1203083, -1.361666, 1, 0.05882353, 0, 1,
-2.380222, -0.5997024, -1.340465, 1, 0.06666667, 0, 1,
-2.280244, -1.528938, -0.07566138, 1, 0.07058824, 0, 1,
-2.217292, 0.9626845, -1.749404, 1, 0.07843138, 0, 1,
-2.206975, 1.709901, -1.135507, 1, 0.08235294, 0, 1,
-2.193662, -0.4652815, -1.967798, 1, 0.09019608, 0, 1,
-2.188353, -0.02335228, -2.573298, 1, 0.09411765, 0, 1,
-2.151598, 0.3290988, -0.6673841, 1, 0.1019608, 0, 1,
-2.150763, 0.1740104, -2.305507, 1, 0.1098039, 0, 1,
-2.144107, -0.646598, 1.513638, 1, 0.1137255, 0, 1,
-2.131279, -0.09151437, -1.14802, 1, 0.1215686, 0, 1,
-2.110478, 0.1758789, -2.77201, 1, 0.1254902, 0, 1,
-2.100653, 0.8458757, -0.2242467, 1, 0.1333333, 0, 1,
-2.097786, 1.196937, -1.213319, 1, 0.1372549, 0, 1,
-2.063219, -0.1903794, -1.366067, 1, 0.145098, 0, 1,
-2.035838, -0.3496581, -1.431877, 1, 0.1490196, 0, 1,
-2.019973, 0.8035673, -2.352462, 1, 0.1568628, 0, 1,
-2.017192, 1.422743, -0.05446172, 1, 0.1607843, 0, 1,
-1.976145, -0.3165804, -1.47687, 1, 0.1686275, 0, 1,
-1.941318, 0.4640621, -1.136174, 1, 0.172549, 0, 1,
-1.924837, 1.719728, -1.304826, 1, 0.1803922, 0, 1,
-1.902621, 0.837622, -2.256575, 1, 0.1843137, 0, 1,
-1.887496, 0.3668442, -1.56478, 1, 0.1921569, 0, 1,
-1.853967, 0.7940301, -1.119137, 1, 0.1960784, 0, 1,
-1.840819, 1.134078, -1.301701, 1, 0.2039216, 0, 1,
-1.830999, 0.3895947, -3.812013, 1, 0.2117647, 0, 1,
-1.801241, 1.170946, 0.1047394, 1, 0.2156863, 0, 1,
-1.798212, 0.8433917, -0.6035212, 1, 0.2235294, 0, 1,
-1.796843, 0.8829382, -1.927011, 1, 0.227451, 0, 1,
-1.777161, 1.279142, -0.3977591, 1, 0.2352941, 0, 1,
-1.774237, -2.007462, -3.500956, 1, 0.2392157, 0, 1,
-1.763068, -0.7712651, -1.4794, 1, 0.2470588, 0, 1,
-1.759912, 0.2168926, -1.522264, 1, 0.2509804, 0, 1,
-1.754408, -0.2902631, 0.04401276, 1, 0.2588235, 0, 1,
-1.748638, -0.150018, -0.6910153, 1, 0.2627451, 0, 1,
-1.731826, 0.2461042, -2.682086, 1, 0.2705882, 0, 1,
-1.728763, 0.2953709, -0.4236896, 1, 0.2745098, 0, 1,
-1.727327, -0.05526993, -1.900122, 1, 0.282353, 0, 1,
-1.700174, -0.6786287, -3.36121, 1, 0.2862745, 0, 1,
-1.691648, -1.960829, -1.627439, 1, 0.2941177, 0, 1,
-1.687138, 1.15362, -1.991278, 1, 0.3019608, 0, 1,
-1.671888, -0.2066034, -2.149703, 1, 0.3058824, 0, 1,
-1.669441, -1.173257, -2.262643, 1, 0.3137255, 0, 1,
-1.660191, 0.8302811, -1.663019, 1, 0.3176471, 0, 1,
-1.655787, 0.3467122, -0.6573328, 1, 0.3254902, 0, 1,
-1.643279, 0.6862745, -2.864003, 1, 0.3294118, 0, 1,
-1.625077, -1.118623, -2.388695, 1, 0.3372549, 0, 1,
-1.624646, -0.1880206, -1.440652, 1, 0.3411765, 0, 1,
-1.622086, -1.481376, -3.40972, 1, 0.3490196, 0, 1,
-1.621521, -0.2522563, 0.9022449, 1, 0.3529412, 0, 1,
-1.617503, 0.05280289, 0.7730579, 1, 0.3607843, 0, 1,
-1.591889, 0.4610291, -0.5039941, 1, 0.3647059, 0, 1,
-1.568678, 0.8332915, -1.860391, 1, 0.372549, 0, 1,
-1.567047, -0.384409, -1.953688, 1, 0.3764706, 0, 1,
-1.539258, -0.5942919, -3.599056, 1, 0.3843137, 0, 1,
-1.535417, 1.011936, -1.287337, 1, 0.3882353, 0, 1,
-1.5247, 0.9096453, -1.265384, 1, 0.3960784, 0, 1,
-1.523129, -0.3668131, -1.971347, 1, 0.4039216, 0, 1,
-1.522396, 0.9825234, -0.7136828, 1, 0.4078431, 0, 1,
-1.521048, -1.264308, -2.820965, 1, 0.4156863, 0, 1,
-1.497536, 0.9082878, -2.36002, 1, 0.4196078, 0, 1,
-1.484664, 1.005726, -1.73224, 1, 0.427451, 0, 1,
-1.481281, 1.133349, -0.3974377, 1, 0.4313726, 0, 1,
-1.476292, 2.390838, -0.3478564, 1, 0.4392157, 0, 1,
-1.472372, 0.6183403, -1.460045, 1, 0.4431373, 0, 1,
-1.46664, 0.1039944, -0.7005981, 1, 0.4509804, 0, 1,
-1.46289, 1.3369, -0.1816528, 1, 0.454902, 0, 1,
-1.459346, -0.07003924, -3.761662, 1, 0.4627451, 0, 1,
-1.447565, 0.7403595, -0.971556, 1, 0.4666667, 0, 1,
-1.437113, 0.3980578, -1.383564, 1, 0.4745098, 0, 1,
-1.412328, 0.1176201, -1.497401, 1, 0.4784314, 0, 1,
-1.406143, 0.5035616, -2.803689, 1, 0.4862745, 0, 1,
-1.401092, -0.5858216, -3.543161, 1, 0.4901961, 0, 1,
-1.375897, 0.9700506, -1.728952, 1, 0.4980392, 0, 1,
-1.373413, 1.817147, -0.8945184, 1, 0.5058824, 0, 1,
-1.361245, 1.225033, 0.3861974, 1, 0.509804, 0, 1,
-1.356105, 0.2265131, -1.716339, 1, 0.5176471, 0, 1,
-1.343631, 0.6154284, -1.340029, 1, 0.5215687, 0, 1,
-1.341397, 0.6696428, -2.611636, 1, 0.5294118, 0, 1,
-1.336336, -0.2790073, 0.3462414, 1, 0.5333334, 0, 1,
-1.334845, 0.339357, -0.5542102, 1, 0.5411765, 0, 1,
-1.33434, 1.354041, -0.1724969, 1, 0.5450981, 0, 1,
-1.333273, -0.1541931, -0.8964325, 1, 0.5529412, 0, 1,
-1.328238, -0.1772047, -2.258695, 1, 0.5568628, 0, 1,
-1.321334, -2.949166, -4.098785, 1, 0.5647059, 0, 1,
-1.290727, -1.054374, -2.01964, 1, 0.5686275, 0, 1,
-1.284918, 0.7305706, -2.261531, 1, 0.5764706, 0, 1,
-1.279407, -0.227034, -1.656022, 1, 0.5803922, 0, 1,
-1.276693, -1.267366, -2.336909, 1, 0.5882353, 0, 1,
-1.272986, -0.9231307, -2.011867, 1, 0.5921569, 0, 1,
-1.262029, 0.6560077, -0.5577413, 1, 0.6, 0, 1,
-1.26135, -1.089519, -2.964049, 1, 0.6078432, 0, 1,
-1.25733, -1.159835, -1.977651, 1, 0.6117647, 0, 1,
-1.252146, 0.2659003, -0.314534, 1, 0.6196079, 0, 1,
-1.251036, 0.4025267, -1.239975, 1, 0.6235294, 0, 1,
-1.248538, -0.03536725, -1.586446, 1, 0.6313726, 0, 1,
-1.24821, -0.6849259, -1.885274, 1, 0.6352941, 0, 1,
-1.248106, -1.267284, -2.550305, 1, 0.6431373, 0, 1,
-1.245411, 0.2104078, -2.755754, 1, 0.6470588, 0, 1,
-1.242951, -1.952844, -4.228293, 1, 0.654902, 0, 1,
-1.236399, 0.002621454, -2.385396, 1, 0.6588235, 0, 1,
-1.234461, 0.9076536, -0.204197, 1, 0.6666667, 0, 1,
-1.234426, -1.222742, -2.070217, 1, 0.6705883, 0, 1,
-1.229605, -0.4470022, -2.410634, 1, 0.6784314, 0, 1,
-1.223966, -0.07152869, -1.141491, 1, 0.682353, 0, 1,
-1.219522, -0.5916343, -2.452447, 1, 0.6901961, 0, 1,
-1.219492, 1.501628, -1.089121, 1, 0.6941177, 0, 1,
-1.214055, -1.157516, -1.387019, 1, 0.7019608, 0, 1,
-1.208519, -0.4414948, -1.875382, 1, 0.7098039, 0, 1,
-1.207515, 0.3765281, -4.079362, 1, 0.7137255, 0, 1,
-1.202386, -1.598384, -1.455123, 1, 0.7215686, 0, 1,
-1.194676, -0.3102461, -2.619928, 1, 0.7254902, 0, 1,
-1.194009, -0.6390212, -2.828827, 1, 0.7333333, 0, 1,
-1.185211, 0.3261051, -1.471319, 1, 0.7372549, 0, 1,
-1.183868, 0.1373128, -1.458992, 1, 0.7450981, 0, 1,
-1.176669, -0.1773035, -0.5142759, 1, 0.7490196, 0, 1,
-1.168707, -0.5346503, -1.689943, 1, 0.7568628, 0, 1,
-1.162214, -0.4051736, -1.663399, 1, 0.7607843, 0, 1,
-1.153853, 2.014246, -1.409655, 1, 0.7686275, 0, 1,
-1.150217, 0.3246291, -2.808447, 1, 0.772549, 0, 1,
-1.122622, -1.51005, -0.8778781, 1, 0.7803922, 0, 1,
-1.119888, 0.7651414, -0.2210512, 1, 0.7843137, 0, 1,
-1.117603, 1.690899, -0.5258298, 1, 0.7921569, 0, 1,
-1.11198, 0.5433105, -2.263187, 1, 0.7960784, 0, 1,
-1.110872, 0.2451463, -2.423143, 1, 0.8039216, 0, 1,
-1.104299, -0.4023944, -2.758803, 1, 0.8117647, 0, 1,
-1.098892, -0.5820404, -1.761161, 1, 0.8156863, 0, 1,
-1.096882, 0.1181855, -1.663302, 1, 0.8235294, 0, 1,
-1.096518, -0.01359189, -0.7670674, 1, 0.827451, 0, 1,
-1.089349, -0.5858712, -2.834239, 1, 0.8352941, 0, 1,
-1.086176, 1.3419, -0.3643213, 1, 0.8392157, 0, 1,
-1.083278, -0.983561, -2.838088, 1, 0.8470588, 0, 1,
-1.080395, -0.3470829, -2.438765, 1, 0.8509804, 0, 1,
-1.079656, -1.823208, -2.806822, 1, 0.8588235, 0, 1,
-1.075273, -0.3332008, -2.088143, 1, 0.8627451, 0, 1,
-1.073014, 0.4798731, -2.390586, 1, 0.8705882, 0, 1,
-1.070081, 0.1853745, -1.246016, 1, 0.8745098, 0, 1,
-1.067709, 0.7566779, -0.8470975, 1, 0.8823529, 0, 1,
-1.064902, -1.379761, -1.735036, 1, 0.8862745, 0, 1,
-1.060581, 0.6023154, -1.537735, 1, 0.8941177, 0, 1,
-1.033735, 1.075692, 0.2894376, 1, 0.8980392, 0, 1,
-1.032394, -0.452677, -1.17072, 1, 0.9058824, 0, 1,
-1.023788, 0.8648916, 0.183971, 1, 0.9137255, 0, 1,
-1.023668, 1.534835, -1.646431, 1, 0.9176471, 0, 1,
-1.022958, -0.9258634, -0.3363425, 1, 0.9254902, 0, 1,
-1.021185, -0.3407914, -1.067751, 1, 0.9294118, 0, 1,
-1.017088, 0.1905638, -0.6915751, 1, 0.9372549, 0, 1,
-1.013166, 0.1553053, -2.547791, 1, 0.9411765, 0, 1,
-1.012097, -1.113932, -4.222901, 1, 0.9490196, 0, 1,
-1.011507, 0.921174, -1.756414, 1, 0.9529412, 0, 1,
-1.005248, 1.093166, -0.6278607, 1, 0.9607843, 0, 1,
-0.9984628, 1.02834, -1.736992, 1, 0.9647059, 0, 1,
-0.9975458, 0.2215358, -0.9448, 1, 0.972549, 0, 1,
-0.9953369, -0.3963192, -3.752589, 1, 0.9764706, 0, 1,
-0.9917621, -1.279355, -3.786952, 1, 0.9843137, 0, 1,
-0.9873106, 0.4547874, -0.002549263, 1, 0.9882353, 0, 1,
-0.9856315, 0.4459827, -1.220459, 1, 0.9960784, 0, 1,
-0.9779205, 0.6593772, 1.561834, 0.9960784, 1, 0, 1,
-0.97671, 0.7740727, -1.24981, 0.9921569, 1, 0, 1,
-0.9655037, -1.426741, -4.165009, 0.9843137, 1, 0, 1,
-0.9608165, -0.4843392, -2.096123, 0.9803922, 1, 0, 1,
-0.9569474, 0.2084471, -0.8050894, 0.972549, 1, 0, 1,
-0.9543048, 1.010471, -1.710438, 0.9686275, 1, 0, 1,
-0.9538907, -1.133126, -2.651113, 0.9607843, 1, 0, 1,
-0.9477636, -0.4765312, -2.415091, 0.9568627, 1, 0, 1,
-0.9476486, -1.219213, -4.131064, 0.9490196, 1, 0, 1,
-0.9458668, -2.606853, -2.877431, 0.945098, 1, 0, 1,
-0.9412395, -0.1532119, -2.519799, 0.9372549, 1, 0, 1,
-0.9378483, -1.13141, -3.214515, 0.9333333, 1, 0, 1,
-0.9368067, 1.130412, -0.5174589, 0.9254902, 1, 0, 1,
-0.9090707, 0.7596062, -0.7593101, 0.9215686, 1, 0, 1,
-0.8980062, -1.371956, -3.377766, 0.9137255, 1, 0, 1,
-0.8924027, 0.2467733, 1.675425, 0.9098039, 1, 0, 1,
-0.8922396, -0.3430563, -0.82659, 0.9019608, 1, 0, 1,
-0.8883024, -0.5639098, -1.357789, 0.8941177, 1, 0, 1,
-0.8850641, 0.450536, -2.019402, 0.8901961, 1, 0, 1,
-0.8836068, -0.09954109, -2.298333, 0.8823529, 1, 0, 1,
-0.8833618, -0.1378092, -2.119447, 0.8784314, 1, 0, 1,
-0.8796381, 1.274283, -0.3671449, 0.8705882, 1, 0, 1,
-0.8699207, 0.8563732, 0.09175875, 0.8666667, 1, 0, 1,
-0.8676834, -0.7048413, -2.01784, 0.8588235, 1, 0, 1,
-0.867082, 0.6767212, -1.724671, 0.854902, 1, 0, 1,
-0.8617009, -0.8179709, -4.112237, 0.8470588, 1, 0, 1,
-0.8485588, 0.1831045, -0.5913745, 0.8431373, 1, 0, 1,
-0.8472008, -0.5751977, -1.304948, 0.8352941, 1, 0, 1,
-0.8468736, 0.9138229, -1.434964, 0.8313726, 1, 0, 1,
-0.8460968, -0.9877505, -2.2283, 0.8235294, 1, 0, 1,
-0.8355255, 0.693768, -1.679926, 0.8196079, 1, 0, 1,
-0.8313589, -0.7510533, -1.857186, 0.8117647, 1, 0, 1,
-0.8234599, 0.4188946, -1.188502, 0.8078431, 1, 0, 1,
-0.8225046, -0.7805772, -1.782009, 0.8, 1, 0, 1,
-0.8210438, -0.2118342, -2.680368, 0.7921569, 1, 0, 1,
-0.8197443, 1.480853, 0.6758809, 0.7882353, 1, 0, 1,
-0.8183705, -0.718133, -5.003025, 0.7803922, 1, 0, 1,
-0.8179308, 0.5367099, -1.034019, 0.7764706, 1, 0, 1,
-0.8164479, -0.1611603, -2.244953, 0.7686275, 1, 0, 1,
-0.8158202, 0.9193754, -0.4928821, 0.7647059, 1, 0, 1,
-0.8150547, 0.4223885, -2.299255, 0.7568628, 1, 0, 1,
-0.8138993, 1.318448, -2.283188, 0.7529412, 1, 0, 1,
-0.8113933, 0.6267755, -0.3744255, 0.7450981, 1, 0, 1,
-0.8069818, -0.5224953, -2.433252, 0.7411765, 1, 0, 1,
-0.8037965, -1.124714, -1.059025, 0.7333333, 1, 0, 1,
-0.7991524, -0.3015476, -3.046689, 0.7294118, 1, 0, 1,
-0.7915447, 0.9329692, 0.5200837, 0.7215686, 1, 0, 1,
-0.7892092, 0.2312838, -1.643546, 0.7176471, 1, 0, 1,
-0.7886926, -0.2202478, -2.05595, 0.7098039, 1, 0, 1,
-0.7878238, 0.1283195, -2.012822, 0.7058824, 1, 0, 1,
-0.7821742, 0.1053777, -3.281293, 0.6980392, 1, 0, 1,
-0.7763067, 1.27853, 0.5062777, 0.6901961, 1, 0, 1,
-0.7760931, -1.886057, -1.361292, 0.6862745, 1, 0, 1,
-0.7715711, -0.004354448, -2.085967, 0.6784314, 1, 0, 1,
-0.7627559, -0.6286722, -2.212895, 0.6745098, 1, 0, 1,
-0.7611797, 0.3958684, -0.8670326, 0.6666667, 1, 0, 1,
-0.7601285, -0.6365079, -2.092978, 0.6627451, 1, 0, 1,
-0.7585771, -0.6967336, 0.7746978, 0.654902, 1, 0, 1,
-0.7572937, 0.04001975, -0.7606258, 0.6509804, 1, 0, 1,
-0.7526185, -0.5224127, -1.08337, 0.6431373, 1, 0, 1,
-0.7522686, -0.3091418, -1.498308, 0.6392157, 1, 0, 1,
-0.7446551, 0.8601313, -0.1297455, 0.6313726, 1, 0, 1,
-0.7437918, 0.1505278, -0.5792258, 0.627451, 1, 0, 1,
-0.7334247, -0.1127913, -0.5352683, 0.6196079, 1, 0, 1,
-0.7291833, 1.365514, 1.552955, 0.6156863, 1, 0, 1,
-0.7277043, -0.7152069, -1.011096, 0.6078432, 1, 0, 1,
-0.7241358, -1.930511, -3.513519, 0.6039216, 1, 0, 1,
-0.7204173, 0.8751083, -0.3202996, 0.5960785, 1, 0, 1,
-0.7156082, 0.6760427, -0.4646127, 0.5882353, 1, 0, 1,
-0.7141333, 1.077311, 0.02330349, 0.5843138, 1, 0, 1,
-0.7136483, 0.02202014, -1.965133, 0.5764706, 1, 0, 1,
-0.7108961, 1.711887, 1.040236, 0.572549, 1, 0, 1,
-0.7088937, 0.5074739, -0.4246215, 0.5647059, 1, 0, 1,
-0.7073005, -0.4620458, -2.482448, 0.5607843, 1, 0, 1,
-0.7045625, -1.463338, -4.3146, 0.5529412, 1, 0, 1,
-0.7025002, 2.356024, 0.2201907, 0.5490196, 1, 0, 1,
-0.699876, -1.600448, -1.851288, 0.5411765, 1, 0, 1,
-0.6986858, 0.5497568, 0.2762452, 0.5372549, 1, 0, 1,
-0.6979934, 0.0971119, -0.3841178, 0.5294118, 1, 0, 1,
-0.6950271, 0.1728525, -2.518592, 0.5254902, 1, 0, 1,
-0.6867512, -0.6248451, -0.7001848, 0.5176471, 1, 0, 1,
-0.6850511, 0.2383585, -1.878374, 0.5137255, 1, 0, 1,
-0.6834258, -1.56356, -1.334422, 0.5058824, 1, 0, 1,
-0.6814692, 0.6667208, -1.381211, 0.5019608, 1, 0, 1,
-0.6796132, -0.8520315, -4.517608, 0.4941176, 1, 0, 1,
-0.6719951, -0.4504268, -2.963988, 0.4862745, 1, 0, 1,
-0.6668545, -0.7189422, -2.156461, 0.4823529, 1, 0, 1,
-0.6645895, 1.802022, -0.2219488, 0.4745098, 1, 0, 1,
-0.6606389, -0.7458196, -1.148107, 0.4705882, 1, 0, 1,
-0.6546506, -0.770439, -3.965825, 0.4627451, 1, 0, 1,
-0.6543874, -1.694123, -4.082593, 0.4588235, 1, 0, 1,
-0.6454468, -0.3065197, -3.937643, 0.4509804, 1, 0, 1,
-0.6445407, -1.146757, -2.877936, 0.4470588, 1, 0, 1,
-0.6404454, -1.52292, -4.087715, 0.4392157, 1, 0, 1,
-0.63744, 0.8705332, -0.75618, 0.4352941, 1, 0, 1,
-0.6323114, -0.1119843, -1.418768, 0.427451, 1, 0, 1,
-0.6311197, 0.5744301, -0.2980743, 0.4235294, 1, 0, 1,
-0.6234496, 0.8938242, -0.1843538, 0.4156863, 1, 0, 1,
-0.6203426, -0.01728313, -2.478453, 0.4117647, 1, 0, 1,
-0.619907, 1.017898, 0.993059, 0.4039216, 1, 0, 1,
-0.6127429, 0.3875778, -0.4137785, 0.3960784, 1, 0, 1,
-0.611843, -0.861587, -3.102103, 0.3921569, 1, 0, 1,
-0.6090581, -0.0214344, -1.808408, 0.3843137, 1, 0, 1,
-0.5970501, -1.864826, -1.920628, 0.3803922, 1, 0, 1,
-0.5935542, 0.1613948, -1.542835, 0.372549, 1, 0, 1,
-0.5895708, -0.3392442, -3.42455, 0.3686275, 1, 0, 1,
-0.5882372, 2.681633, -1.455416, 0.3607843, 1, 0, 1,
-0.5833752, -1.184495, -3.561506, 0.3568628, 1, 0, 1,
-0.5739922, 1.584547, 0.268918, 0.3490196, 1, 0, 1,
-0.5736976, 1.657826, -0.7058648, 0.345098, 1, 0, 1,
-0.5686976, -1.280108, -1.421523, 0.3372549, 1, 0, 1,
-0.5681897, 0.2644644, -0.6458274, 0.3333333, 1, 0, 1,
-0.5674972, 1.265128, -0.4902115, 0.3254902, 1, 0, 1,
-0.5653852, 0.7324758, -1.589939, 0.3215686, 1, 0, 1,
-0.5511837, 1.37591, 0.2487159, 0.3137255, 1, 0, 1,
-0.54836, -1.996979, -3.610465, 0.3098039, 1, 0, 1,
-0.5465307, -1.858483, -1.523693, 0.3019608, 1, 0, 1,
-0.5445969, -0.8856329, -0.8752981, 0.2941177, 1, 0, 1,
-0.5435745, -1.531212, -2.59761, 0.2901961, 1, 0, 1,
-0.5429532, -1.408601, -2.538128, 0.282353, 1, 0, 1,
-0.5411194, -0.448021, -1.489351, 0.2784314, 1, 0, 1,
-0.538954, 1.539894, -1.387414, 0.2705882, 1, 0, 1,
-0.5384425, -1.555149, -2.478755, 0.2666667, 1, 0, 1,
-0.5381044, -0.308331, -1.993827, 0.2588235, 1, 0, 1,
-0.5355894, 3.00703, -1.048078, 0.254902, 1, 0, 1,
-0.5348527, 0.5533489, -0.05248615, 0.2470588, 1, 0, 1,
-0.5321252, -1.563776, -1.684359, 0.2431373, 1, 0, 1,
-0.5315867, -0.1939371, -0.8073764, 0.2352941, 1, 0, 1,
-0.5303773, -1.411165, -1.288615, 0.2313726, 1, 0, 1,
-0.5262834, -0.4044223, -3.621416, 0.2235294, 1, 0, 1,
-0.5249173, 0.103754, -1.629953, 0.2196078, 1, 0, 1,
-0.523199, -0.2000001, 0.002465027, 0.2117647, 1, 0, 1,
-0.5231623, 1.440561, 1.954619, 0.2078431, 1, 0, 1,
-0.5212721, 0.3521561, -1.723145, 0.2, 1, 0, 1,
-0.5201712, 1.405737, 0.5795666, 0.1921569, 1, 0, 1,
-0.5138174, 1.344132, -0.6924092, 0.1882353, 1, 0, 1,
-0.5137479, 0.1722463, -0.4789704, 0.1803922, 1, 0, 1,
-0.5131779, 0.1113805, -3.949306, 0.1764706, 1, 0, 1,
-0.5119048, 0.4555913, -2.795982, 0.1686275, 1, 0, 1,
-0.5100429, -2.230372, -1.831322, 0.1647059, 1, 0, 1,
-0.5040981, -0.02334122, -2.187613, 0.1568628, 1, 0, 1,
-0.5029853, -0.2787561, -2.420689, 0.1529412, 1, 0, 1,
-0.5012859, 0.363435, -0.3587027, 0.145098, 1, 0, 1,
-0.4984988, -1.379263, -4.345072, 0.1411765, 1, 0, 1,
-0.4976669, -0.8153678, -3.751446, 0.1333333, 1, 0, 1,
-0.4953091, 0.3313711, -1.239461, 0.1294118, 1, 0, 1,
-0.4952426, -0.389357, -2.50524, 0.1215686, 1, 0, 1,
-0.4852531, 1.689339, 0.7803392, 0.1176471, 1, 0, 1,
-0.4851943, -1.666534, -3.170237, 0.1098039, 1, 0, 1,
-0.4814678, -0.143478, -1.854922, 0.1058824, 1, 0, 1,
-0.4787614, -0.2204814, -1.303963, 0.09803922, 1, 0, 1,
-0.4746567, -0.3873311, -2.009056, 0.09019608, 1, 0, 1,
-0.4715193, -0.2269945, -3.624256, 0.08627451, 1, 0, 1,
-0.4702671, -0.5028415, -2.611027, 0.07843138, 1, 0, 1,
-0.4680099, -0.8734571, -2.937013, 0.07450981, 1, 0, 1,
-0.4674188, 1.377661, -0.6192504, 0.06666667, 1, 0, 1,
-0.466323, -0.9022461, -1.084593, 0.0627451, 1, 0, 1,
-0.463656, -0.375341, -2.626544, 0.05490196, 1, 0, 1,
-0.4636389, 1.368752, -1.083285, 0.05098039, 1, 0, 1,
-0.4607789, -0.06954857, -0.5452778, 0.04313726, 1, 0, 1,
-0.457745, 0.5090073, 0.09108804, 0.03921569, 1, 0, 1,
-0.457467, 0.126851, -0.9337796, 0.03137255, 1, 0, 1,
-0.45502, -0.01221983, -1.284565, 0.02745098, 1, 0, 1,
-0.4510205, 0.3524931, 0.06423175, 0.01960784, 1, 0, 1,
-0.4509379, -0.2852908, -3.620049, 0.01568628, 1, 0, 1,
-0.4426282, 0.4131978, -1.893016, 0.007843138, 1, 0, 1,
-0.43768, -0.5671626, -0.7069006, 0.003921569, 1, 0, 1,
-0.4335204, -0.6654763, -3.556759, 0, 1, 0.003921569, 1,
-0.4318945, 0.06044906, -3.097029, 0, 1, 0.01176471, 1,
-0.4317028, 0.9422301, -0.5064859, 0, 1, 0.01568628, 1,
-0.4303201, -1.840025, -2.940165, 0, 1, 0.02352941, 1,
-0.4250447, -1.222229, -3.085221, 0, 1, 0.02745098, 1,
-0.4214009, 0.4045928, -1.66415, 0, 1, 0.03529412, 1,
-0.4204843, -0.2232668, -0.4661375, 0, 1, 0.03921569, 1,
-0.4203485, -1.790979, -2.336094, 0, 1, 0.04705882, 1,
-0.4167424, -1.013952, -2.68956, 0, 1, 0.05098039, 1,
-0.4146295, 1.193969, -0.3795333, 0, 1, 0.05882353, 1,
-0.4094417, 1.243693, 0.2482927, 0, 1, 0.0627451, 1,
-0.4084221, -2.844549, -3.633645, 0, 1, 0.07058824, 1,
-0.406267, -1.099362, -1.354287, 0, 1, 0.07450981, 1,
-0.4061354, -2.023396, -2.406312, 0, 1, 0.08235294, 1,
-0.4043247, 0.05316438, -1.068274, 0, 1, 0.08627451, 1,
-0.4032483, 0.2607107, -0.8978202, 0, 1, 0.09411765, 1,
-0.4017493, -0.1403901, -1.956083, 0, 1, 0.1019608, 1,
-0.400725, 1.103078, 1.48171, 0, 1, 0.1058824, 1,
-0.3986324, -0.4388835, -2.208667, 0, 1, 0.1137255, 1,
-0.3979852, -0.7596454, -2.029218, 0, 1, 0.1176471, 1,
-0.3967326, 0.4942411, -0.8747981, 0, 1, 0.1254902, 1,
-0.3962882, -0.8482748, -2.405918, 0, 1, 0.1294118, 1,
-0.396086, -0.8857244, -3.392979, 0, 1, 0.1372549, 1,
-0.3960057, -0.6225548, -1.847098, 0, 1, 0.1411765, 1,
-0.3950443, 0.07505514, -0.7978505, 0, 1, 0.1490196, 1,
-0.3889134, 0.3714085, -1.299342, 0, 1, 0.1529412, 1,
-0.3886337, 1.612867, -0.4881634, 0, 1, 0.1607843, 1,
-0.3874864, 0.6372529, -1.50548, 0, 1, 0.1647059, 1,
-0.3828072, 0.8909254, 0.8752882, 0, 1, 0.172549, 1,
-0.3727623, 0.7834948, 0.09669745, 0, 1, 0.1764706, 1,
-0.3720624, 0.2852843, -1.254639, 0, 1, 0.1843137, 1,
-0.3701933, -0.8400192, -2.418626, 0, 1, 0.1882353, 1,
-0.3637676, -1.385257, -5.156719, 0, 1, 0.1960784, 1,
-0.3591977, 0.8729823, 0.6655661, 0, 1, 0.2039216, 1,
-0.3587311, 1.503568, -0.7298535, 0, 1, 0.2078431, 1,
-0.3562346, 1.006195, 0.4044304, 0, 1, 0.2156863, 1,
-0.3490634, 0.9533955, -3.086681, 0, 1, 0.2196078, 1,
-0.3483826, 0.5129207, -0.07440887, 0, 1, 0.227451, 1,
-0.3477002, 1.385346, 1.656647, 0, 1, 0.2313726, 1,
-0.3461987, 1.463386, -2.12067, 0, 1, 0.2392157, 1,
-0.3457498, -0.1495767, -2.643817, 0, 1, 0.2431373, 1,
-0.3439433, -1.163754, -3.397694, 0, 1, 0.2509804, 1,
-0.3277904, -1.045054, -2.154359, 0, 1, 0.254902, 1,
-0.32743, -1.738192, -3.314357, 0, 1, 0.2627451, 1,
-0.3205832, 1.310639, -0.3368475, 0, 1, 0.2666667, 1,
-0.3205017, -0.01593568, -0.4171267, 0, 1, 0.2745098, 1,
-0.3152401, -0.3716235, -3.032536, 0, 1, 0.2784314, 1,
-0.3135192, 2.2842, 1.158962, 0, 1, 0.2862745, 1,
-0.3132272, 0.1337777, -1.699902, 0, 1, 0.2901961, 1,
-0.3104005, 0.1120887, -0.8113325, 0, 1, 0.2980392, 1,
-0.3054255, -1.229574, -2.676056, 0, 1, 0.3058824, 1,
-0.2985156, -0.5590717, -3.811369, 0, 1, 0.3098039, 1,
-0.2971664, -0.8854601, -1.613783, 0, 1, 0.3176471, 1,
-0.2959887, 0.05646704, -2.048517, 0, 1, 0.3215686, 1,
-0.2912294, -1.298181, -3.516554, 0, 1, 0.3294118, 1,
-0.28745, 0.7082638, -1.68686, 0, 1, 0.3333333, 1,
-0.2841415, -0.02112661, -1.712717, 0, 1, 0.3411765, 1,
-0.2813874, 0.3770517, -1.809224, 0, 1, 0.345098, 1,
-0.2811852, -0.6380576, -1.957843, 0, 1, 0.3529412, 1,
-0.2784064, 0.4946032, -0.9873657, 0, 1, 0.3568628, 1,
-0.2781684, -0.5516704, -1.395196, 0, 1, 0.3647059, 1,
-0.2768817, 0.7285013, -1.706551, 0, 1, 0.3686275, 1,
-0.2761589, -0.9323879, -2.503256, 0, 1, 0.3764706, 1,
-0.2682516, 0.3899279, -0.3023565, 0, 1, 0.3803922, 1,
-0.2636063, -1.623641, -2.652155, 0, 1, 0.3882353, 1,
-0.2635872, -0.8031319, -3.524872, 0, 1, 0.3921569, 1,
-0.2633393, -0.1471503, -1.475445, 0, 1, 0.4, 1,
-0.2622443, -0.6656902, -3.93529, 0, 1, 0.4078431, 1,
-0.260815, 0.9314207, 0.1132601, 0, 1, 0.4117647, 1,
-0.2605998, -1.10942, -3.814263, 0, 1, 0.4196078, 1,
-0.2568461, -0.4911261, -2.543313, 0, 1, 0.4235294, 1,
-0.2499667, 1.037466, 1.54689, 0, 1, 0.4313726, 1,
-0.2487747, 0.7762036, 1.36568, 0, 1, 0.4352941, 1,
-0.2470024, -0.6481431, -4.298948, 0, 1, 0.4431373, 1,
-0.2459672, 0.4683333, 1.04554, 0, 1, 0.4470588, 1,
-0.241538, 0.2018667, -1.474359, 0, 1, 0.454902, 1,
-0.2387858, -0.05523081, -3.546992, 0, 1, 0.4588235, 1,
-0.2368573, -0.6867571, -1.246507, 0, 1, 0.4666667, 1,
-0.2363841, 0.9141032, -0.314269, 0, 1, 0.4705882, 1,
-0.2345849, 1.210066, -1.628001, 0, 1, 0.4784314, 1,
-0.2297388, 1.237965, -0.6364536, 0, 1, 0.4823529, 1,
-0.2227492, 0.0003157049, -0.4137588, 0, 1, 0.4901961, 1,
-0.2220954, -0.7684047, -2.801226, 0, 1, 0.4941176, 1,
-0.2212928, -0.2038247, -3.09898, 0, 1, 0.5019608, 1,
-0.2188131, 0.2532311, -1.95022, 0, 1, 0.509804, 1,
-0.2130426, -0.1151022, -0.7576692, 0, 1, 0.5137255, 1,
-0.2033382, 0.291876, -0.08343755, 0, 1, 0.5215687, 1,
-0.1994164, -0.7147374, -2.172192, 0, 1, 0.5254902, 1,
-0.1974479, 1.315349, -1.922546, 0, 1, 0.5333334, 1,
-0.1973138, 0.05673801, -0.06135286, 0, 1, 0.5372549, 1,
-0.1972482, 1.83074, -0.322933, 0, 1, 0.5450981, 1,
-0.1959243, 0.8430699, 0.4883342, 0, 1, 0.5490196, 1,
-0.1959141, 1.086012, 0.6335099, 0, 1, 0.5568628, 1,
-0.1928772, 0.8578621, 0.5291897, 0, 1, 0.5607843, 1,
-0.1900245, 0.6787236, 0.4002193, 0, 1, 0.5686275, 1,
-0.1841249, -1.851222, -1.499182, 0, 1, 0.572549, 1,
-0.1807916, -0.5415654, -3.195195, 0, 1, 0.5803922, 1,
-0.1800309, -0.0605774, -0.9999566, 0, 1, 0.5843138, 1,
-0.1687085, -0.02321014, -2.946862, 0, 1, 0.5921569, 1,
-0.1672971, -0.3329386, -3.186223, 0, 1, 0.5960785, 1,
-0.1671495, 0.08198153, -0.4182982, 0, 1, 0.6039216, 1,
-0.165868, -0.2981571, -2.336457, 0, 1, 0.6117647, 1,
-0.1633618, 0.7466652, 0.1837871, 0, 1, 0.6156863, 1,
-0.1566759, 1.517024, -0.9842374, 0, 1, 0.6235294, 1,
-0.1519533, 1.10993, -0.4985032, 0, 1, 0.627451, 1,
-0.1509446, 1.617911, 1.038037, 0, 1, 0.6352941, 1,
-0.1486498, -0.9625565, -5.188985, 0, 1, 0.6392157, 1,
-0.1475351, -0.07247885, -2.544556, 0, 1, 0.6470588, 1,
-0.1453717, 1.488468, 1.068337, 0, 1, 0.6509804, 1,
-0.144108, -1.715018, -3.775733, 0, 1, 0.6588235, 1,
-0.1282734, 0.6837944, 0.2030558, 0, 1, 0.6627451, 1,
-0.1229405, -0.002273135, -0.02675132, 0, 1, 0.6705883, 1,
-0.1228538, -0.7212285, -3.520707, 0, 1, 0.6745098, 1,
-0.1216686, 0.2921587, 0.08716787, 0, 1, 0.682353, 1,
-0.1157184, -0.1882774, -0.2155517, 0, 1, 0.6862745, 1,
-0.1126623, 0.7748607, 1.347228, 0, 1, 0.6941177, 1,
-0.1124899, -1.880022, -3.280546, 0, 1, 0.7019608, 1,
-0.1119497, -0.4581977, -1.871201, 0, 1, 0.7058824, 1,
-0.1095341, 0.1058762, 0.2195914, 0, 1, 0.7137255, 1,
-0.1089095, 0.5697213, -0.3954417, 0, 1, 0.7176471, 1,
-0.1070397, 0.6231628, -0.01698313, 0, 1, 0.7254902, 1,
-0.1027397, -0.3976994, -3.136742, 0, 1, 0.7294118, 1,
-0.1021172, 0.4046708, -0.5122703, 0, 1, 0.7372549, 1,
-0.09957022, -0.4006318, -4.176916, 0, 1, 0.7411765, 1,
-0.09930951, -1.890602, -4.738449, 0, 1, 0.7490196, 1,
-0.09723286, 0.708463, -0.02987804, 0, 1, 0.7529412, 1,
-0.09205667, 0.4453707, -0.4339149, 0, 1, 0.7607843, 1,
-0.09130375, -1.163759, -4.742123, 0, 1, 0.7647059, 1,
-0.08992714, 1.300294, 1.540113, 0, 1, 0.772549, 1,
-0.08913033, -1.380966, -4.342292, 0, 1, 0.7764706, 1,
-0.0845701, 0.01873946, 0.1074683, 0, 1, 0.7843137, 1,
-0.08419389, 0.02474491, -0.6418908, 0, 1, 0.7882353, 1,
-0.07629626, 1.463396, 0.5298452, 0, 1, 0.7960784, 1,
-0.07520378, -0.4759478, -2.134413, 0, 1, 0.8039216, 1,
-0.07489537, 0.9452676, -0.3465919, 0, 1, 0.8078431, 1,
-0.07443784, 0.838451, -0.483833, 0, 1, 0.8156863, 1,
-0.06697299, 0.1019391, 0.9695379, 0, 1, 0.8196079, 1,
-0.06568424, -0.5302454, -3.439445, 0, 1, 0.827451, 1,
-0.06439632, 0.04478497, -1.486366, 0, 1, 0.8313726, 1,
-0.06284449, -0.3873192, -3.058853, 0, 1, 0.8392157, 1,
-0.05877619, 2.160786, 0.6009955, 0, 1, 0.8431373, 1,
-0.05717298, -0.1410446, -2.775627, 0, 1, 0.8509804, 1,
-0.05685115, 0.9357056, 1.100287, 0, 1, 0.854902, 1,
-0.05200816, 0.08668704, -0.3853904, 0, 1, 0.8627451, 1,
-0.048487, -0.8519982, -3.860377, 0, 1, 0.8666667, 1,
-0.03586695, -0.1273927, -2.214601, 0, 1, 0.8745098, 1,
-0.03570192, 0.5691783, 1.708573, 0, 1, 0.8784314, 1,
-0.03446206, 1.681697, 0.3741148, 0, 1, 0.8862745, 1,
-0.03337931, -0.4072452, -3.272626, 0, 1, 0.8901961, 1,
-0.03137648, 1.343048, -0.7386449, 0, 1, 0.8980392, 1,
-0.02851407, 0.3222811, 1.318309, 0, 1, 0.9058824, 1,
-0.02835813, 0.03073812, -0.9355233, 0, 1, 0.9098039, 1,
-0.02825541, 0.6198134, -1.519851, 0, 1, 0.9176471, 1,
-0.02662775, -1.784401, -4.766332, 0, 1, 0.9215686, 1,
-0.02631471, 2.460117, 2.752596, 0, 1, 0.9294118, 1,
-0.02628235, -1.336736, -2.729558, 0, 1, 0.9333333, 1,
-0.02529929, -1.328878, -3.6477, 0, 1, 0.9411765, 1,
-0.02460823, -0.8106239, -0.9774384, 0, 1, 0.945098, 1,
-0.02351829, 2.359318, 0.02717185, 0, 1, 0.9529412, 1,
-0.0166218, 0.9496251, -0.02112139, 0, 1, 0.9568627, 1,
-0.01116445, 0.7287173, -0.2276089, 0, 1, 0.9647059, 1,
-0.00455427, 0.9916527, -0.6267463, 0, 1, 0.9686275, 1,
-0.003541364, -1.148449, -3.698138, 0, 1, 0.9764706, 1,
-0.003287883, -0.105294, -4.120526, 0, 1, 0.9803922, 1,
0.005238724, 0.3072112, -0.4965495, 0, 1, 0.9882353, 1,
0.007030034, 0.04381256, 0.9232036, 0, 1, 0.9921569, 1,
0.007040806, -0.5307561, 2.946548, 0, 1, 1, 1,
0.007704348, -0.08923356, 1.680182, 0, 0.9921569, 1, 1,
0.01291197, 0.6085428, 1.939988, 0, 0.9882353, 1, 1,
0.01353997, -0.868194, 2.163042, 0, 0.9803922, 1, 1,
0.01803195, 1.566201, 0.1179205, 0, 0.9764706, 1, 1,
0.01836703, 0.2514854, -0.8883659, 0, 0.9686275, 1, 1,
0.01965424, -0.6414227, 5.725036, 0, 0.9647059, 1, 1,
0.02050686, -1.670644, 3.502177, 0, 0.9568627, 1, 1,
0.02144483, -0.7634436, 3.394026, 0, 0.9529412, 1, 1,
0.02550649, -0.6755803, 2.83598, 0, 0.945098, 1, 1,
0.02760698, 0.008673563, 2.33621, 0, 0.9411765, 1, 1,
0.03331969, 0.5596696, 0.6759415, 0, 0.9333333, 1, 1,
0.03413329, 1.759992, -1.981932, 0, 0.9294118, 1, 1,
0.03739139, -0.4780466, 2.054514, 0, 0.9215686, 1, 1,
0.04191261, -0.5410131, 4.642689, 0, 0.9176471, 1, 1,
0.04484525, 0.3253218, 1.046612, 0, 0.9098039, 1, 1,
0.04870211, -0.63193, 1.853453, 0, 0.9058824, 1, 1,
0.04893104, 0.5177648, 0.1812176, 0, 0.8980392, 1, 1,
0.05413444, -0.01890307, 1.908264, 0, 0.8901961, 1, 1,
0.06217892, -0.1225514, 3.205835, 0, 0.8862745, 1, 1,
0.0623238, 2.127307, -1.434384, 0, 0.8784314, 1, 1,
0.06550791, 1.04128, -2.437169, 0, 0.8745098, 1, 1,
0.06620922, -0.08945939, 3.010458, 0, 0.8666667, 1, 1,
0.07122681, 1.070789, 0.9293176, 0, 0.8627451, 1, 1,
0.07927865, 0.1612063, -0.697846, 0, 0.854902, 1, 1,
0.08010691, 0.6386842, 0.1958283, 0, 0.8509804, 1, 1,
0.08288132, 0.6758265, -0.2025732, 0, 0.8431373, 1, 1,
0.08601876, 1.051245, 0.4364636, 0, 0.8392157, 1, 1,
0.08766761, -0.126076, 2.153136, 0, 0.8313726, 1, 1,
0.08834337, -0.5296896, 3.006757, 0, 0.827451, 1, 1,
0.09471325, 0.6152797, -0.6092846, 0, 0.8196079, 1, 1,
0.101814, 0.1498148, -0.6443118, 0, 0.8156863, 1, 1,
0.1046825, -1.017083, 5.192555, 0, 0.8078431, 1, 1,
0.1100711, 0.223054, 1.071261, 0, 0.8039216, 1, 1,
0.1124657, 0.4977401, 1.710277, 0, 0.7960784, 1, 1,
0.1127005, -0.4865669, 3.713582, 0, 0.7882353, 1, 1,
0.1150827, -1.621307, 2.430863, 0, 0.7843137, 1, 1,
0.1159862, 0.5077077, -1.755033, 0, 0.7764706, 1, 1,
0.1178073, 0.005952605, 1.232557, 0, 0.772549, 1, 1,
0.1186417, 0.1316483, 1.201779, 0, 0.7647059, 1, 1,
0.1223675, -0.2423002, 3.567953, 0, 0.7607843, 1, 1,
0.1261442, -0.2666224, 5.296592, 0, 0.7529412, 1, 1,
0.1378709, -0.9222209, 3.206342, 0, 0.7490196, 1, 1,
0.138299, 0.3872595, 1.530858, 0, 0.7411765, 1, 1,
0.1441557, 0.7452788, -0.2724276, 0, 0.7372549, 1, 1,
0.1451686, -0.8176947, 3.042404, 0, 0.7294118, 1, 1,
0.1486042, 0.5623295, 0.7645575, 0, 0.7254902, 1, 1,
0.158099, -1.006149, 3.483698, 0, 0.7176471, 1, 1,
0.1598618, 0.0836025, -0.07385103, 0, 0.7137255, 1, 1,
0.1626698, -1.685385, 1.642658, 0, 0.7058824, 1, 1,
0.1633729, 1.554713, -0.5185293, 0, 0.6980392, 1, 1,
0.1643167, 0.1990891, 0.44598, 0, 0.6941177, 1, 1,
0.1652062, -0.8758945, 2.03239, 0, 0.6862745, 1, 1,
0.1654107, -1.700386, 3.107027, 0, 0.682353, 1, 1,
0.1703018, -0.8781905, 2.899032, 0, 0.6745098, 1, 1,
0.1745647, -0.1020154, 0.7645824, 0, 0.6705883, 1, 1,
0.1753457, 0.5064583, -1.61652, 0, 0.6627451, 1, 1,
0.1793903, 1.583877, 1.901073, 0, 0.6588235, 1, 1,
0.1880718, -0.8609686, 4.177816, 0, 0.6509804, 1, 1,
0.1899534, 0.3829396, 0.7501827, 0, 0.6470588, 1, 1,
0.1931891, -0.2590696, 1.871274, 0, 0.6392157, 1, 1,
0.1933185, 0.2745405, -1.536029, 0, 0.6352941, 1, 1,
0.1964237, -1.744607, 3.159622, 0, 0.627451, 1, 1,
0.2021977, 0.378871, -0.1719709, 0, 0.6235294, 1, 1,
0.2056693, 0.9371406, 0.6327024, 0, 0.6156863, 1, 1,
0.2067676, -0.5451389, 2.580019, 0, 0.6117647, 1, 1,
0.2094515, 0.4840744, 1.244893, 0, 0.6039216, 1, 1,
0.2102773, -0.4139853, 2.394379, 0, 0.5960785, 1, 1,
0.2140157, 0.5351921, -0.4711776, 0, 0.5921569, 1, 1,
0.2143435, -0.692612, 2.702811, 0, 0.5843138, 1, 1,
0.2158387, 1.859033, -1.058213, 0, 0.5803922, 1, 1,
0.2167493, -0.6953523, 2.674991, 0, 0.572549, 1, 1,
0.2176851, 0.1767893, 0.657229, 0, 0.5686275, 1, 1,
0.2191206, 1.073722, 0.1372152, 0, 0.5607843, 1, 1,
0.2192839, -0.1348165, 2.23667, 0, 0.5568628, 1, 1,
0.2308157, -0.2483557, 3.178578, 0, 0.5490196, 1, 1,
0.2326118, 0.4695738, 1.150274, 0, 0.5450981, 1, 1,
0.2342701, 0.8967689, -1.309185, 0, 0.5372549, 1, 1,
0.2349839, 1.249586, 0.741793, 0, 0.5333334, 1, 1,
0.2365458, 1.439294, 1.598746, 0, 0.5254902, 1, 1,
0.2379915, 0.7203474, 2.037454, 0, 0.5215687, 1, 1,
0.2405987, 0.8908975, 0.2797163, 0, 0.5137255, 1, 1,
0.2466092, 0.6299791, 1.185474, 0, 0.509804, 1, 1,
0.24675, -0.5162741, 1.388183, 0, 0.5019608, 1, 1,
0.2504051, 0.2879059, 1.326063, 0, 0.4941176, 1, 1,
0.250432, -1.206566, 2.983048, 0, 0.4901961, 1, 1,
0.2504789, 1.431123, -0.3070563, 0, 0.4823529, 1, 1,
0.2510709, -1.422223, 3.177828, 0, 0.4784314, 1, 1,
0.2538639, 1.534652, 0.3221092, 0, 0.4705882, 1, 1,
0.2550741, 0.7274468, -0.5988789, 0, 0.4666667, 1, 1,
0.2602452, -1.668318, 2.269754, 0, 0.4588235, 1, 1,
0.2607004, -0.1747699, 2.36151, 0, 0.454902, 1, 1,
0.2645032, -0.1495289, 0.4886393, 0, 0.4470588, 1, 1,
0.2646725, 0.4691798, -2.453856, 0, 0.4431373, 1, 1,
0.2687191, -1.834261, 3.971698, 0, 0.4352941, 1, 1,
0.2692515, -1.875182, 2.085553, 0, 0.4313726, 1, 1,
0.2729275, -0.1254811, -0.1321906, 0, 0.4235294, 1, 1,
0.2732686, -1.572633, 1.933051, 0, 0.4196078, 1, 1,
0.2739583, 0.535745, 0.2912592, 0, 0.4117647, 1, 1,
0.2776841, 0.08922256, 1.250016, 0, 0.4078431, 1, 1,
0.2790052, 0.3913231, 0.1066642, 0, 0.4, 1, 1,
0.2801779, 0.7340028, -0.3495824, 0, 0.3921569, 1, 1,
0.2816554, 1.29051, -0.6146557, 0, 0.3882353, 1, 1,
0.2860687, -2.126956, 3.60838, 0, 0.3803922, 1, 1,
0.2899158, -0.434082, 3.559716, 0, 0.3764706, 1, 1,
0.2907127, 0.1115243, -0.7940975, 0, 0.3686275, 1, 1,
0.2919478, 1.96347, 1.395554, 0, 0.3647059, 1, 1,
0.2927316, 0.3268089, 1.860281, 0, 0.3568628, 1, 1,
0.3112876, -0.2571078, 2.114955, 0, 0.3529412, 1, 1,
0.3160305, -0.3834546, 3.031898, 0, 0.345098, 1, 1,
0.3175316, 0.5128136, -1.356566, 0, 0.3411765, 1, 1,
0.3197525, -0.8614459, 3.037314, 0, 0.3333333, 1, 1,
0.32109, -0.6810215, 0.9512876, 0, 0.3294118, 1, 1,
0.321507, -1.060762, 1.552968, 0, 0.3215686, 1, 1,
0.325389, -1.407572, 2.513954, 0, 0.3176471, 1, 1,
0.3355142, 0.02515714, 0.387364, 0, 0.3098039, 1, 1,
0.3405276, -0.5654486, 5.006671, 0, 0.3058824, 1, 1,
0.3412843, -1.063315, 1.459464, 0, 0.2980392, 1, 1,
0.3443141, 2.051651, -1.64602, 0, 0.2901961, 1, 1,
0.3448697, -1.111272, 1.901665, 0, 0.2862745, 1, 1,
0.3450352, 0.2277033, 1.391823, 0, 0.2784314, 1, 1,
0.3464888, -0.2123359, 3.993759, 0, 0.2745098, 1, 1,
0.3538418, 0.7860641, -0.2437232, 0, 0.2666667, 1, 1,
0.3554469, -1.750118, 3.669913, 0, 0.2627451, 1, 1,
0.3563074, 0.7533233, 0.2748873, 0, 0.254902, 1, 1,
0.3565495, -0.6040608, 2.673689, 0, 0.2509804, 1, 1,
0.3569221, 0.921164, 0.9072758, 0, 0.2431373, 1, 1,
0.3569316, 0.5064351, 0.8158498, 0, 0.2392157, 1, 1,
0.3577382, -0.6162075, 3.600005, 0, 0.2313726, 1, 1,
0.3622341, 0.1487491, 0.3944443, 0, 0.227451, 1, 1,
0.3650738, 1.311975, -0.08149981, 0, 0.2196078, 1, 1,
0.3668352, -0.2251892, 3.083331, 0, 0.2156863, 1, 1,
0.3700383, 0.4214596, 1.352255, 0, 0.2078431, 1, 1,
0.3711008, -1.185256, 2.963736, 0, 0.2039216, 1, 1,
0.3711066, 2.693084, -0.5808533, 0, 0.1960784, 1, 1,
0.3742185, 1.102344, -0.1316207, 0, 0.1882353, 1, 1,
0.3752828, 0.7764778, 2.768297, 0, 0.1843137, 1, 1,
0.375474, -0.6685196, 3.218501, 0, 0.1764706, 1, 1,
0.3789065, 0.02406644, 2.566413, 0, 0.172549, 1, 1,
0.3798084, 0.2923684, 1.581479, 0, 0.1647059, 1, 1,
0.3800023, -0.6835333, 2.876134, 0, 0.1607843, 1, 1,
0.3802454, -0.1362697, 2.022933, 0, 0.1529412, 1, 1,
0.3843374, 0.1508958, 1.872243, 0, 0.1490196, 1, 1,
0.3888508, -0.5760986, 2.576724, 0, 0.1411765, 1, 1,
0.3945002, -1.194176, 3.814281, 0, 0.1372549, 1, 1,
0.3948513, -0.2200269, 0.1245062, 0, 0.1294118, 1, 1,
0.3952726, -0.5853407, 2.866788, 0, 0.1254902, 1, 1,
0.4000349, -1.074693, 3.099584, 0, 0.1176471, 1, 1,
0.4000474, -1.556769, 2.146424, 0, 0.1137255, 1, 1,
0.4009379, -0.9780289, 2.431308, 0, 0.1058824, 1, 1,
0.4026585, 0.2119433, 1.026614, 0, 0.09803922, 1, 1,
0.4027928, -1.082684, 1.669549, 0, 0.09411765, 1, 1,
0.4059298, 0.8300809, 1.474216, 0, 0.08627451, 1, 1,
0.4074066, 0.01461218, 0.9022847, 0, 0.08235294, 1, 1,
0.4080364, -0.5337733, 1.345588, 0, 0.07450981, 1, 1,
0.4097531, 0.3577539, 1.594141, 0, 0.07058824, 1, 1,
0.4129583, -0.87409, 4.182923, 0, 0.0627451, 1, 1,
0.4132352, -0.3237568, 2.690808, 0, 0.05882353, 1, 1,
0.4135655, -1.819793, 1.676388, 0, 0.05098039, 1, 1,
0.415397, -1.246359, 2.998094, 0, 0.04705882, 1, 1,
0.4253233, 0.05427381, 2.082006, 0, 0.03921569, 1, 1,
0.4281083, -0.5267057, 2.000381, 0, 0.03529412, 1, 1,
0.4294536, 1.276656, -0.3418029, 0, 0.02745098, 1, 1,
0.4311178, -0.6118539, 3.330702, 0, 0.02352941, 1, 1,
0.4352599, 0.6699522, 1.616148, 0, 0.01568628, 1, 1,
0.4379435, -0.9592679, 1.685161, 0, 0.01176471, 1, 1,
0.4405697, 0.2391838, 1.756637, 0, 0.003921569, 1, 1,
0.4442867, -0.06735569, 2.000146, 0.003921569, 0, 1, 1,
0.4453098, -0.3565819, 1.868694, 0.007843138, 0, 1, 1,
0.4470457, 0.4197136, 0.8105614, 0.01568628, 0, 1, 1,
0.4487009, -0.5102196, 3.6592, 0.01960784, 0, 1, 1,
0.4506987, 0.009335861, 3.364803, 0.02745098, 0, 1, 1,
0.4510997, 1.25809, 1.921159, 0.03137255, 0, 1, 1,
0.452525, -0.9550792, 2.648921, 0.03921569, 0, 1, 1,
0.4530558, 0.2122353, 1.239341, 0.04313726, 0, 1, 1,
0.4557186, -0.836321, 2.104465, 0.05098039, 0, 1, 1,
0.4657361, -0.3213042, 2.844236, 0.05490196, 0, 1, 1,
0.4720708, -2.050022, 1.098635, 0.0627451, 0, 1, 1,
0.4742165, 0.4611432, -0.08431854, 0.06666667, 0, 1, 1,
0.4780932, -0.00427816, 2.944105, 0.07450981, 0, 1, 1,
0.4805014, 0.3349545, 1.940929, 0.07843138, 0, 1, 1,
0.4808254, -0.3299868, 2.89953, 0.08627451, 0, 1, 1,
0.4808273, 0.4885238, 0.3755885, 0.09019608, 0, 1, 1,
0.4828997, -1.564561, 2.429865, 0.09803922, 0, 1, 1,
0.4836358, -1.113041, 2.449056, 0.1058824, 0, 1, 1,
0.484996, 0.1186184, 2.417016, 0.1098039, 0, 1, 1,
0.4857135, 1.134062, -1.969962, 0.1176471, 0, 1, 1,
0.4861893, -0.4964821, 2.050947, 0.1215686, 0, 1, 1,
0.4885904, -1.109392, 4.270478, 0.1294118, 0, 1, 1,
0.4888911, 1.175756, -0.1091786, 0.1333333, 0, 1, 1,
0.4928069, -1.089989, 3.284364, 0.1411765, 0, 1, 1,
0.4954729, -0.5815222, 1.928388, 0.145098, 0, 1, 1,
0.5021962, -1.006136, 3.227408, 0.1529412, 0, 1, 1,
0.5036297, 0.5387418, 1.934097, 0.1568628, 0, 1, 1,
0.5083944, 1.588663, -1.37783, 0.1647059, 0, 1, 1,
0.5101965, 0.08054159, 1.055916, 0.1686275, 0, 1, 1,
0.5105608, 0.3297278, 0.8708532, 0.1764706, 0, 1, 1,
0.5109206, 1.105562, -0.7916667, 0.1803922, 0, 1, 1,
0.511523, -0.3873698, 1.987016, 0.1882353, 0, 1, 1,
0.5124044, -0.03087839, 2.690156, 0.1921569, 0, 1, 1,
0.5138634, 0.2403591, 3.313086, 0.2, 0, 1, 1,
0.5181225, -0.7780274, 1.111366, 0.2078431, 0, 1, 1,
0.5222399, -0.4601647, 2.90422, 0.2117647, 0, 1, 1,
0.5250419, 0.2925597, 0.298243, 0.2196078, 0, 1, 1,
0.5328022, -0.483456, 1.679358, 0.2235294, 0, 1, 1,
0.534849, 2.107452, 0.1158244, 0.2313726, 0, 1, 1,
0.536433, -0.3315492, 1.802236, 0.2352941, 0, 1, 1,
0.5394877, 0.5629223, 0.7600736, 0.2431373, 0, 1, 1,
0.5433972, -0.3392785, 2.779256, 0.2470588, 0, 1, 1,
0.5502883, 0.4690816, 2.084702, 0.254902, 0, 1, 1,
0.5510332, -0.8832271, 2.787946, 0.2588235, 0, 1, 1,
0.5511281, -0.3499501, 2.16985, 0.2666667, 0, 1, 1,
0.5529683, -1.405518, 3.099802, 0.2705882, 0, 1, 1,
0.5546819, -0.7783598, 2.133494, 0.2784314, 0, 1, 1,
0.5632483, 0.6814098, 0.390906, 0.282353, 0, 1, 1,
0.5648524, 0.4214148, -0.3262488, 0.2901961, 0, 1, 1,
0.5681421, -0.3437268, 3.463423, 0.2941177, 0, 1, 1,
0.5731499, -0.7841389, 2.582, 0.3019608, 0, 1, 1,
0.5744627, -0.1271554, 0.5167228, 0.3098039, 0, 1, 1,
0.5747843, 0.5215837, 0.579385, 0.3137255, 0, 1, 1,
0.5748217, -0.2385711, -0.2719047, 0.3215686, 0, 1, 1,
0.5749735, -0.3686719, 2.471461, 0.3254902, 0, 1, 1,
0.5777996, -1.262675, 2.787801, 0.3333333, 0, 1, 1,
0.5808179, 0.1025571, 0.9427775, 0.3372549, 0, 1, 1,
0.5824146, 0.8140851, 1.248414, 0.345098, 0, 1, 1,
0.5846317, -1.700716, 1.929284, 0.3490196, 0, 1, 1,
0.5851331, -0.5727274, 1.954131, 0.3568628, 0, 1, 1,
0.5857654, -0.5404004, 1.574032, 0.3607843, 0, 1, 1,
0.5869296, -0.2095202, 2.782393, 0.3686275, 0, 1, 1,
0.588359, 0.05519843, 1.523816, 0.372549, 0, 1, 1,
0.5891845, -1.507347, 1.787596, 0.3803922, 0, 1, 1,
0.5958433, 2.12243, 0.3497647, 0.3843137, 0, 1, 1,
0.5961556, 0.52579, 2.256665, 0.3921569, 0, 1, 1,
0.6003739, 0.3862018, 2.590118, 0.3960784, 0, 1, 1,
0.6012066, 1.092971, 2.023233, 0.4039216, 0, 1, 1,
0.6021363, -1.114584, 2.791826, 0.4117647, 0, 1, 1,
0.6086679, -1.157143, 3.032882, 0.4156863, 0, 1, 1,
0.6138769, 0.9195654, 0.7833115, 0.4235294, 0, 1, 1,
0.6261987, 1.58023, 1.552714, 0.427451, 0, 1, 1,
0.6266318, 0.3017544, -0.8553175, 0.4352941, 0, 1, 1,
0.6278557, 0.7079685, 0.6804855, 0.4392157, 0, 1, 1,
0.6281995, 1.443611, 0.9760013, 0.4470588, 0, 1, 1,
0.6312011, -1.345517, 2.36992, 0.4509804, 0, 1, 1,
0.6341197, -0.286331, 1.932799, 0.4588235, 0, 1, 1,
0.6428162, 0.7215218, -0.2553197, 0.4627451, 0, 1, 1,
0.6430939, 0.8113656, 0.7029994, 0.4705882, 0, 1, 1,
0.6439912, 1.016385, -0.1798231, 0.4745098, 0, 1, 1,
0.6468983, -0.3346182, 1.978132, 0.4823529, 0, 1, 1,
0.6477922, -0.1226748, -0.7895674, 0.4862745, 0, 1, 1,
0.6643714, -0.7460623, 2.762756, 0.4941176, 0, 1, 1,
0.6670786, 0.7910253, 0.09046193, 0.5019608, 0, 1, 1,
0.6673366, 0.513188, 0.42786, 0.5058824, 0, 1, 1,
0.6748357, -0.3751838, 4.01168, 0.5137255, 0, 1, 1,
0.6756665, 0.1133866, 1.955382, 0.5176471, 0, 1, 1,
0.6814283, -1.49863, 2.291108, 0.5254902, 0, 1, 1,
0.6827965, 0.4838667, -0.6869721, 0.5294118, 0, 1, 1,
0.6865066, 0.5025048, 3.128819, 0.5372549, 0, 1, 1,
0.6890723, -0.04686347, 2.184795, 0.5411765, 0, 1, 1,
0.6940264, -1.912202, 1.039795, 0.5490196, 0, 1, 1,
0.7027788, 0.5019436, 1.660996, 0.5529412, 0, 1, 1,
0.7060701, -1.710038, 1.471085, 0.5607843, 0, 1, 1,
0.7082435, 0.426569, 0.5107411, 0.5647059, 0, 1, 1,
0.7083189, 1.0499, -0.3898148, 0.572549, 0, 1, 1,
0.7104644, -0.08052308, 0.8353272, 0.5764706, 0, 1, 1,
0.7112519, -0.8373452, 2.21539, 0.5843138, 0, 1, 1,
0.7119338, -1.039864, 3.324058, 0.5882353, 0, 1, 1,
0.7133881, 1.037153, -0.2398614, 0.5960785, 0, 1, 1,
0.7170329, -0.08969674, 0.6046248, 0.6039216, 0, 1, 1,
0.7197591, -2.091165, 2.356254, 0.6078432, 0, 1, 1,
0.7222094, 2.656559, -0.452417, 0.6156863, 0, 1, 1,
0.7253332, -0.2541507, 1.833077, 0.6196079, 0, 1, 1,
0.7260704, -0.6721677, 2.128825, 0.627451, 0, 1, 1,
0.7284327, -0.7576708, 2.358488, 0.6313726, 0, 1, 1,
0.7345005, 0.01018154, 0.6368002, 0.6392157, 0, 1, 1,
0.741617, 0.5014827, -0.9175228, 0.6431373, 0, 1, 1,
0.7431539, 0.70055, 1.304254, 0.6509804, 0, 1, 1,
0.746283, -0.395872, 0.670656, 0.654902, 0, 1, 1,
0.7471098, -0.2142071, 0.8196538, 0.6627451, 0, 1, 1,
0.7479132, 0.860705, -0.7856404, 0.6666667, 0, 1, 1,
0.7499505, -0.5267769, 0.4853219, 0.6745098, 0, 1, 1,
0.7548954, -2.59941, 3.462314, 0.6784314, 0, 1, 1,
0.7561213, 0.2864602, 1.452459, 0.6862745, 0, 1, 1,
0.7630646, -0.7659302, 2.168474, 0.6901961, 0, 1, 1,
0.7636706, -0.5274414, 3.903552, 0.6980392, 0, 1, 1,
0.7653772, 0.4284442, 2.116103, 0.7058824, 0, 1, 1,
0.7667201, -0.9652007, 3.280628, 0.7098039, 0, 1, 1,
0.7675391, 0.2185271, 0.8128122, 0.7176471, 0, 1, 1,
0.7705168, 0.8936463, -0.1177278, 0.7215686, 0, 1, 1,
0.7940928, 0.5775854, 0.6380332, 0.7294118, 0, 1, 1,
0.7945728, 0.1023352, 0.3479853, 0.7333333, 0, 1, 1,
0.8063046, -2.42747, 4.022332, 0.7411765, 0, 1, 1,
0.8081141, 0.5063719, 0.7536713, 0.7450981, 0, 1, 1,
0.8095778, -0.1590388, 2.293733, 0.7529412, 0, 1, 1,
0.8142379, -0.3523768, 3.836809, 0.7568628, 0, 1, 1,
0.8176614, 0.5450943, -0.02710455, 0.7647059, 0, 1, 1,
0.8202243, 3.262801, 0.6859009, 0.7686275, 0, 1, 1,
0.8204508, 0.4035531, 3.061561, 0.7764706, 0, 1, 1,
0.8204534, -0.5848761, 1.197068, 0.7803922, 0, 1, 1,
0.8206174, -0.4722429, 0.7818002, 0.7882353, 0, 1, 1,
0.822185, 0.9695961, 2.823547, 0.7921569, 0, 1, 1,
0.828027, 1.763942, -0.6202097, 0.8, 0, 1, 1,
0.8287072, -1.206643, 2.343645, 0.8078431, 0, 1, 1,
0.8312109, -0.889334, 4.392226, 0.8117647, 0, 1, 1,
0.8320987, 0.7644348, 0.06385306, 0.8196079, 0, 1, 1,
0.8340052, -2.050223, 2.081381, 0.8235294, 0, 1, 1,
0.8359658, -1.5977, 2.248495, 0.8313726, 0, 1, 1,
0.8371556, 0.5120941, 1.069074, 0.8352941, 0, 1, 1,
0.8413709, 0.2000573, -0.5079215, 0.8431373, 0, 1, 1,
0.8417461, -1.318707, 2.224135, 0.8470588, 0, 1, 1,
0.8431545, 0.3126074, 1.201067, 0.854902, 0, 1, 1,
0.8435486, -0.3056756, 1.92354, 0.8588235, 0, 1, 1,
0.8454617, -0.3132426, 1.257062, 0.8666667, 0, 1, 1,
0.8560896, -0.07886159, 2.493212, 0.8705882, 0, 1, 1,
0.8592042, -0.4333062, 2.732732, 0.8784314, 0, 1, 1,
0.8602954, 0.0809628, 1.802781, 0.8823529, 0, 1, 1,
0.8679187, -1.078508, 1.778883, 0.8901961, 0, 1, 1,
0.8688344, -1.401739, 1.680703, 0.8941177, 0, 1, 1,
0.8855635, 1.332286, 1.205051, 0.9019608, 0, 1, 1,
0.8924204, -1.246596, 3.296087, 0.9098039, 0, 1, 1,
0.8938848, 1.497322, 1.440522, 0.9137255, 0, 1, 1,
0.8940453, -0.08899752, 0.4332539, 0.9215686, 0, 1, 1,
0.8957305, -0.04667934, 2.93643, 0.9254902, 0, 1, 1,
0.8986595, -0.2218058, 0.9994187, 0.9333333, 0, 1, 1,
0.9107422, -0.3631865, 1.043977, 0.9372549, 0, 1, 1,
0.9145055, -0.9732794, 3.489949, 0.945098, 0, 1, 1,
0.9220471, 0.2735002, -0.3488734, 0.9490196, 0, 1, 1,
0.9262931, 0.4688544, 1.839714, 0.9568627, 0, 1, 1,
0.929246, -0.509955, 3.254152, 0.9607843, 0, 1, 1,
0.9305343, 1.179339, 1.645551, 0.9686275, 0, 1, 1,
0.9305691, 0.3095511, 2.282825, 0.972549, 0, 1, 1,
0.9323454, -0.1179707, 1.203356, 0.9803922, 0, 1, 1,
0.9335794, -1.389444, 2.29206, 0.9843137, 0, 1, 1,
0.9335905, 1.736711, 1.408431, 0.9921569, 0, 1, 1,
0.9355124, -1.221403, 3.351653, 0.9960784, 0, 1, 1,
0.9411554, -1.065558, 3.420358, 1, 0, 0.9960784, 1,
0.9448633, -0.3713624, 0.8618342, 1, 0, 0.9882353, 1,
0.9472466, 2.180564, -0.5988737, 1, 0, 0.9843137, 1,
0.9482223, 0.6539576, 0.720349, 1, 0, 0.9764706, 1,
0.9553147, 1.474775, 0.1001231, 1, 0, 0.972549, 1,
0.962841, 0.1532964, 0.9177439, 1, 0, 0.9647059, 1,
0.9689602, 1.527913, 0.4816504, 1, 0, 0.9607843, 1,
0.9692931, -1.747681, 0.8677773, 1, 0, 0.9529412, 1,
0.9733347, 0.351807, 1.220718, 1, 0, 0.9490196, 1,
0.9734688, -0.1110812, 1.637562, 1, 0, 0.9411765, 1,
0.974337, 0.4309408, 1.052847, 1, 0, 0.9372549, 1,
0.9828612, 1.48181, 0.6664398, 1, 0, 0.9294118, 1,
0.9832368, -0.2107047, 0.6654417, 1, 0, 0.9254902, 1,
0.9901606, -0.3806749, -0.2876949, 1, 0, 0.9176471, 1,
0.9926234, -0.06793614, 1.902186, 1, 0, 0.9137255, 1,
0.9967877, -0.5549148, 1.667392, 1, 0, 0.9058824, 1,
1.003489, -2.416044, 3.490475, 1, 0, 0.9019608, 1,
1.006369, 0.8641182, 0.2676439, 1, 0, 0.8941177, 1,
1.017938, -0.3008395, 2.491682, 1, 0, 0.8862745, 1,
1.018708, -0.9371334, 1.66915, 1, 0, 0.8823529, 1,
1.020094, 0.3720871, 1.962055, 1, 0, 0.8745098, 1,
1.028961, -0.958931, 3.16934, 1, 0, 0.8705882, 1,
1.033282, -0.5982422, 0.7392741, 1, 0, 0.8627451, 1,
1.035095, 1.030955, 1.07589, 1, 0, 0.8588235, 1,
1.035298, -0.1448901, 1.681306, 1, 0, 0.8509804, 1,
1.040293, 0.6294848, 1.626489, 1, 0, 0.8470588, 1,
1.065169, 1.092586, 0.4334685, 1, 0, 0.8392157, 1,
1.069003, -1.277197, 1.131323, 1, 0, 0.8352941, 1,
1.072206, 0.1622827, 0.9867645, 1, 0, 0.827451, 1,
1.076172, 0.5151331, 0.4282895, 1, 0, 0.8235294, 1,
1.080125, -0.363762, 0.9638326, 1, 0, 0.8156863, 1,
1.091457, 0.190133, 2.892738, 1, 0, 0.8117647, 1,
1.100279, 0.8667889, 0.5444835, 1, 0, 0.8039216, 1,
1.131499, -0.1036893, 1.349611, 1, 0, 0.7960784, 1,
1.131525, 2.189915, -0.6848065, 1, 0, 0.7921569, 1,
1.138656, 0.2623852, 3.819321, 1, 0, 0.7843137, 1,
1.142527, -0.8940552, 3.338168, 1, 0, 0.7803922, 1,
1.14354, 1.068258, 2.140843, 1, 0, 0.772549, 1,
1.145549, 0.3568382, 0.3518633, 1, 0, 0.7686275, 1,
1.152946, -1.535974, 2.71006, 1, 0, 0.7607843, 1,
1.160906, 0.5810199, 1.666271, 1, 0, 0.7568628, 1,
1.166989, 1.127908, 1.55331, 1, 0, 0.7490196, 1,
1.167252, 2.097905, -0.8516921, 1, 0, 0.7450981, 1,
1.167363, -1.722928, 0.5106387, 1, 0, 0.7372549, 1,
1.172308, 0.1725611, 1.217141, 1, 0, 0.7333333, 1,
1.176917, -1.201366, 2.942968, 1, 0, 0.7254902, 1,
1.184247, 1.288505, 0.4066819, 1, 0, 0.7215686, 1,
1.187539, 0.112086, 1.627942, 1, 0, 0.7137255, 1,
1.191165, 1.834261, -0.463102, 1, 0, 0.7098039, 1,
1.196346, -0.3055824, 1.504982, 1, 0, 0.7019608, 1,
1.209466, 0.05457624, -1.059484, 1, 0, 0.6941177, 1,
1.230541, -1.179358, 2.180417, 1, 0, 0.6901961, 1,
1.232327, -0.5997471, 0.9446396, 1, 0, 0.682353, 1,
1.238714, 0.5419397, 2.049403, 1, 0, 0.6784314, 1,
1.246065, 1.909775, -0.6496226, 1, 0, 0.6705883, 1,
1.252306, 0.4459127, 2.054824, 1, 0, 0.6666667, 1,
1.256243, -0.6697154, 0.5407644, 1, 0, 0.6588235, 1,
1.256605, -1.235271, 3.049683, 1, 0, 0.654902, 1,
1.269545, 0.1377053, 1.553756, 1, 0, 0.6470588, 1,
1.281018, 0.5338215, 0.707646, 1, 0, 0.6431373, 1,
1.2836, -0.7631865, 3.086519, 1, 0, 0.6352941, 1,
1.286041, -0.684413, 3.028097, 1, 0, 0.6313726, 1,
1.291032, -1.020068, 3.814631, 1, 0, 0.6235294, 1,
1.291646, -0.9545364, 3.110611, 1, 0, 0.6196079, 1,
1.303998, -1.326022, 4.012236, 1, 0, 0.6117647, 1,
1.313669, -0.9282334, 2.67274, 1, 0, 0.6078432, 1,
1.318256, -0.4109645, 1.358968, 1, 0, 0.6, 1,
1.322617, -1.092532, 1.674269, 1, 0, 0.5921569, 1,
1.331596, 1.987009, -0.20844, 1, 0, 0.5882353, 1,
1.33771, -0.5139889, 2.393816, 1, 0, 0.5803922, 1,
1.339533, 1.100556, 2.144656, 1, 0, 0.5764706, 1,
1.349467, -0.8369089, 2.729175, 1, 0, 0.5686275, 1,
1.352035, 1.070394, 0.03216293, 1, 0, 0.5647059, 1,
1.380059, -0.625825, 2.466033, 1, 0, 0.5568628, 1,
1.383426, 2.236783, 0.5624498, 1, 0, 0.5529412, 1,
1.384015, -1.276129, 0.6355736, 1, 0, 0.5450981, 1,
1.386681, 1.80044, 0.7114555, 1, 0, 0.5411765, 1,
1.391733, -1.694068, 2.383323, 1, 0, 0.5333334, 1,
1.39512, 0.1748899, 1.545742, 1, 0, 0.5294118, 1,
1.396495, -0.2745925, 1.318047, 1, 0, 0.5215687, 1,
1.399884, -0.9091905, 0.2551965, 1, 0, 0.5176471, 1,
1.404405, 0.1602646, 1.240024, 1, 0, 0.509804, 1,
1.424009, -0.05213685, 2.437494, 1, 0, 0.5058824, 1,
1.427362, 0.551568, -0.5037724, 1, 0, 0.4980392, 1,
1.4334, -0.2177209, 1.506503, 1, 0, 0.4901961, 1,
1.436723, -1.123926, 2.204426, 1, 0, 0.4862745, 1,
1.438219, -0.6370847, 3.198762, 1, 0, 0.4784314, 1,
1.442608, 0.7608223, 0.06502375, 1, 0, 0.4745098, 1,
1.450223, -0.7226117, 1.474807, 1, 0, 0.4666667, 1,
1.454222, 0.3030648, 2.816991, 1, 0, 0.4627451, 1,
1.465496, 0.434514, 1.516885, 1, 0, 0.454902, 1,
1.479443, 0.3183506, 2.900206, 1, 0, 0.4509804, 1,
1.508994, 0.2572927, 2.452499, 1, 0, 0.4431373, 1,
1.510661, -0.1408704, 1.175882, 1, 0, 0.4392157, 1,
1.51626, 0.97148, 1.837222, 1, 0, 0.4313726, 1,
1.537307, 1.872406, -1.659464, 1, 0, 0.427451, 1,
1.537799, 0.500641, 2.916752, 1, 0, 0.4196078, 1,
1.54828, 1.155721, -0.993726, 1, 0, 0.4156863, 1,
1.568506, -1.126438, 2.196167, 1, 0, 0.4078431, 1,
1.584349, 0.9410985, 0.2864177, 1, 0, 0.4039216, 1,
1.586753, 0.2547132, 1.738222, 1, 0, 0.3960784, 1,
1.599027, 1.708871, 0.04812121, 1, 0, 0.3882353, 1,
1.606558, 1.015948, -0.2247298, 1, 0, 0.3843137, 1,
1.615401, 0.06475047, 2.232959, 1, 0, 0.3764706, 1,
1.627773, 0.2470376, 2.711377, 1, 0, 0.372549, 1,
1.637019, 0.8833613, 1.462532, 1, 0, 0.3647059, 1,
1.659086, -0.009986633, 2.026574, 1, 0, 0.3607843, 1,
1.670821, 0.851272, -0.5951226, 1, 0, 0.3529412, 1,
1.717051, -1.729375, 1.949483, 1, 0, 0.3490196, 1,
1.726445, 1.284115, 0.1119242, 1, 0, 0.3411765, 1,
1.771875, 1.031135, 0.4309517, 1, 0, 0.3372549, 1,
1.785493, -0.099762, 1.563742, 1, 0, 0.3294118, 1,
1.813673, 0.3894554, 1.068214, 1, 0, 0.3254902, 1,
1.814038, -0.3386883, 2.64547, 1, 0, 0.3176471, 1,
1.814682, -1.015668, 0.6486032, 1, 0, 0.3137255, 1,
1.834846, 0.8821241, 0.9162771, 1, 0, 0.3058824, 1,
1.837652, -0.3224605, 1.092683, 1, 0, 0.2980392, 1,
1.844581, -1.537825, 3.762484, 1, 0, 0.2941177, 1,
1.847157, -0.9765255, 1.683469, 1, 0, 0.2862745, 1,
1.855869, 0.8964287, 2.82016, 1, 0, 0.282353, 1,
1.857662, -0.07242755, 2.518582, 1, 0, 0.2745098, 1,
1.867081, -0.001692888, 0.5045437, 1, 0, 0.2705882, 1,
1.899305, 0.970829, -1.323316, 1, 0, 0.2627451, 1,
1.906911, 1.574354, 1.697338, 1, 0, 0.2588235, 1,
1.91076, -0.6716312, 1.216653, 1, 0, 0.2509804, 1,
1.912578, 0.1744861, -0.9296547, 1, 0, 0.2470588, 1,
1.913239, 0.5458163, 0.8550034, 1, 0, 0.2392157, 1,
1.949548, -1.007532, 1.881488, 1, 0, 0.2352941, 1,
1.974156, -2.130852, 1.157974, 1, 0, 0.227451, 1,
1.974277, -0.7134898, 1.718711, 1, 0, 0.2235294, 1,
1.976732, -2.757242, 1.817951, 1, 0, 0.2156863, 1,
1.98735, 0.3365119, 0.9362662, 1, 0, 0.2117647, 1,
1.998502, 0.7609864, 0.274042, 1, 0, 0.2039216, 1,
2.000876, -1.315463, 2.048287, 1, 0, 0.1960784, 1,
2.019204, 1.419754, 0.6903248, 1, 0, 0.1921569, 1,
2.022492, -1.199454, 2.386372, 1, 0, 0.1843137, 1,
2.027412, -0.01242186, 1.769222, 1, 0, 0.1803922, 1,
2.039702, -0.4729891, 1.30926, 1, 0, 0.172549, 1,
2.042229, 0.393044, 0.04762588, 1, 0, 0.1686275, 1,
2.076331, -0.5352827, 1.15543, 1, 0, 0.1607843, 1,
2.088847, 0.3016382, 2.390929, 1, 0, 0.1568628, 1,
2.099363, 0.1997138, 0.4860983, 1, 0, 0.1490196, 1,
2.102063, -0.4415216, 3.604963, 1, 0, 0.145098, 1,
2.110279, -1.245573, 2.748909, 1, 0, 0.1372549, 1,
2.136527, 1.576979, 1.432639, 1, 0, 0.1333333, 1,
2.156827, 0.488003, 1.733911, 1, 0, 0.1254902, 1,
2.158701, 1.577802, -0.02715867, 1, 0, 0.1215686, 1,
2.165172, -0.833626, 3.083171, 1, 0, 0.1137255, 1,
2.197434, -2.542423, -0.3879688, 1, 0, 0.1098039, 1,
2.218447, -0.3696523, 2.455381, 1, 0, 0.1019608, 1,
2.300985, -0.2245684, 2.012699, 1, 0, 0.09411765, 1,
2.330291, 1.440968, 1.644487, 1, 0, 0.09019608, 1,
2.401001, 0.7398802, 2.727797, 1, 0, 0.08235294, 1,
2.432678, 0.528698, 1.979662, 1, 0, 0.07843138, 1,
2.445715, 0.3106223, 0.9019455, 1, 0, 0.07058824, 1,
2.452011, 1.835368, 0.05283151, 1, 0, 0.06666667, 1,
2.509909, -0.5605619, 2.68487, 1, 0, 0.05882353, 1,
2.645178, -0.7937583, 2.525301, 1, 0, 0.05490196, 1,
2.652394, 0.4909931, 2.087787, 1, 0, 0.04705882, 1,
2.674943, 0.8032284, 0.8479307, 1, 0, 0.04313726, 1,
2.69305, -0.3203529, 2.134858, 1, 0, 0.03529412, 1,
2.760765, 0.7386894, 2.722667, 1, 0, 0.03137255, 1,
2.779673, 0.6133566, 0.9366043, 1, 0, 0.02352941, 1,
2.793793, 0.3029881, 1.068062, 1, 0, 0.01960784, 1,
2.877515, 1.203616, 1.945196, 1, 0, 0.01176471, 1,
3.083283, -0.3721118, 1.060717, 1, 0, 0.007843138, 1
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
-0.02086246, -4.002095, -7.038911, 0, -0.5, 0.5, 0.5,
-0.02086246, -4.002095, -7.038911, 1, -0.5, 0.5, 0.5,
-0.02086246, -4.002095, -7.038911, 1, 1.5, 0.5, 0.5,
-0.02086246, -4.002095, -7.038911, 0, 1.5, 0.5, 0.5
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
-4.177314, 0.1568174, -7.038911, 0, -0.5, 0.5, 0.5,
-4.177314, 0.1568174, -7.038911, 1, -0.5, 0.5, 0.5,
-4.177314, 0.1568174, -7.038911, 1, 1.5, 0.5, 0.5,
-4.177314, 0.1568174, -7.038911, 0, 1.5, 0.5, 0.5
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
-4.177314, -4.002095, 0.2680256, 0, -0.5, 0.5, 0.5,
-4.177314, -4.002095, 0.2680256, 1, -0.5, 0.5, 0.5,
-4.177314, -4.002095, 0.2680256, 1, 1.5, 0.5, 0.5,
-4.177314, -4.002095, 0.2680256, 0, 1.5, 0.5, 0.5
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
-3, -3.042346, -5.352695,
3, -3.042346, -5.352695,
-3, -3.042346, -5.352695,
-3, -3.202304, -5.633731,
-2, -3.042346, -5.352695,
-2, -3.202304, -5.633731,
-1, -3.042346, -5.352695,
-1, -3.202304, -5.633731,
0, -3.042346, -5.352695,
0, -3.202304, -5.633731,
1, -3.042346, -5.352695,
1, -3.202304, -5.633731,
2, -3.042346, -5.352695,
2, -3.202304, -5.633731,
3, -3.042346, -5.352695,
3, -3.202304, -5.633731
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
-3, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
-3, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
-3, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
-3, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
-2, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
-2, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
-2, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
-2, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
-1, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
-1, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
-1, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
-1, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
0, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
0, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
0, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
0, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
1, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
1, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
1, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
1, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
2, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
2, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
2, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
2, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5,
3, -3.52222, -6.195803, 0, -0.5, 0.5, 0.5,
3, -3.52222, -6.195803, 1, -0.5, 0.5, 0.5,
3, -3.52222, -6.195803, 1, 1.5, 0.5, 0.5,
3, -3.52222, -6.195803, 0, 1.5, 0.5, 0.5
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
-3.218133, -2, -5.352695,
-3.218133, 3, -5.352695,
-3.218133, -2, -5.352695,
-3.377996, -2, -5.633731,
-3.218133, -1, -5.352695,
-3.377996, -1, -5.633731,
-3.218133, 0, -5.352695,
-3.377996, 0, -5.633731,
-3.218133, 1, -5.352695,
-3.377996, 1, -5.633731,
-3.218133, 2, -5.352695,
-3.377996, 2, -5.633731,
-3.218133, 3, -5.352695,
-3.377996, 3, -5.633731
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
-3.697723, -2, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, -2, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, -2, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, -2, -6.195803, 0, 1.5, 0.5, 0.5,
-3.697723, -1, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, -1, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, -1, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, -1, -6.195803, 0, 1.5, 0.5, 0.5,
-3.697723, 0, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, 0, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, 0, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, 0, -6.195803, 0, 1.5, 0.5, 0.5,
-3.697723, 1, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, 1, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, 1, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, 1, -6.195803, 0, 1.5, 0.5, 0.5,
-3.697723, 2, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, 2, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, 2, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, 2, -6.195803, 0, 1.5, 0.5, 0.5,
-3.697723, 3, -6.195803, 0, -0.5, 0.5, 0.5,
-3.697723, 3, -6.195803, 1, -0.5, 0.5, 0.5,
-3.697723, 3, -6.195803, 1, 1.5, 0.5, 0.5,
-3.697723, 3, -6.195803, 0, 1.5, 0.5, 0.5
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
-3.218133, -3.042346, -4,
-3.218133, -3.042346, 4,
-3.218133, -3.042346, -4,
-3.377996, -3.202304, -4,
-3.218133, -3.042346, -2,
-3.377996, -3.202304, -2,
-3.218133, -3.042346, 0,
-3.377996, -3.202304, 0,
-3.218133, -3.042346, 2,
-3.377996, -3.202304, 2,
-3.218133, -3.042346, 4,
-3.377996, -3.202304, 4
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
-3.697723, -3.52222, -4, 0, -0.5, 0.5, 0.5,
-3.697723, -3.52222, -4, 1, -0.5, 0.5, 0.5,
-3.697723, -3.52222, -4, 1, 1.5, 0.5, 0.5,
-3.697723, -3.52222, -4, 0, 1.5, 0.5, 0.5,
-3.697723, -3.52222, -2, 0, -0.5, 0.5, 0.5,
-3.697723, -3.52222, -2, 1, -0.5, 0.5, 0.5,
-3.697723, -3.52222, -2, 1, 1.5, 0.5, 0.5,
-3.697723, -3.52222, -2, 0, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 0, 0, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 0, 1, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 0, 1, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 0, 0, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 2, 0, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 2, 1, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 2, 1, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 2, 0, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 4, 0, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 4, 1, -0.5, 0.5, 0.5,
-3.697723, -3.52222, 4, 1, 1.5, 0.5, 0.5,
-3.697723, -3.52222, 4, 0, 1.5, 0.5, 0.5
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
-3.218133, -3.042346, -5.352695,
-3.218133, 3.355981, -5.352695,
-3.218133, -3.042346, 5.888746,
-3.218133, 3.355981, 5.888746,
-3.218133, -3.042346, -5.352695,
-3.218133, -3.042346, 5.888746,
-3.218133, 3.355981, -5.352695,
-3.218133, 3.355981, 5.888746,
-3.218133, -3.042346, -5.352695,
3.176408, -3.042346, -5.352695,
-3.218133, -3.042346, 5.888746,
3.176408, -3.042346, 5.888746,
-3.218133, 3.355981, -5.352695,
3.176408, 3.355981, -5.352695,
-3.218133, 3.355981, 5.888746,
3.176408, 3.355981, 5.888746,
3.176408, -3.042346, -5.352695,
3.176408, 3.355981, -5.352695,
3.176408, -3.042346, 5.888746,
3.176408, 3.355981, 5.888746,
3.176408, -3.042346, -5.352695,
3.176408, -3.042346, 5.888746,
3.176408, 3.355981, -5.352695,
3.176408, 3.355981, 5.888746
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
var radius = 7.704856;
var distance = 34.27977;
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
mvMatrix.translate( 0.02086246, -0.1568174, -0.2680256 );
mvMatrix.scale( 1.302774, 1.302003, 0.7410652 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.27977);
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


