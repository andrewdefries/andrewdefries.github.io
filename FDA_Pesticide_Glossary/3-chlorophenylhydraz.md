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
-3.736612, 1.096083, -0.5094727, 1, 0, 0, 1,
-2.809127, -0.4890335, -1.459934, 1, 0.007843138, 0, 1,
-2.779161, 0.3474298, -1.054559, 1, 0.01176471, 0, 1,
-2.656443, 0.3587268, -1.242777, 1, 0.01960784, 0, 1,
-2.58533, -0.1499559, -1.106267, 1, 0.02352941, 0, 1,
-2.514162, 0.9624521, -1.411959, 1, 0.03137255, 0, 1,
-2.372506, 1.752656, -0.5669175, 1, 0.03529412, 0, 1,
-2.215631, -1.098269, -3.253166, 1, 0.04313726, 0, 1,
-2.189484, 0.7823683, -1.950881, 1, 0.04705882, 0, 1,
-2.092273, -0.5288751, -2.610816, 1, 0.05490196, 0, 1,
-2.09193, 0.09019326, -1.417798, 1, 0.05882353, 0, 1,
-2.089374, 0.2869355, -1.248167, 1, 0.06666667, 0, 1,
-2.073182, -0.6530161, -1.88527, 1, 0.07058824, 0, 1,
-2.058213, -1.241064, -2.201059, 1, 0.07843138, 0, 1,
-2.04275, -1.49241, -2.026426, 1, 0.08235294, 0, 1,
-2.031487, 1.605521, -0.5736993, 1, 0.09019608, 0, 1,
-2.027965, 0.3727948, -0.9067519, 1, 0.09411765, 0, 1,
-2.027922, -0.153268, -2.862225, 1, 0.1019608, 0, 1,
-2.01266, -0.4915538, -2.239572, 1, 0.1098039, 0, 1,
-2.00852, -0.08700643, -2.675608, 1, 0.1137255, 0, 1,
-2.007304, -1.853826, -2.510924, 1, 0.1215686, 0, 1,
-1.99062, -0.1880814, -0.4476858, 1, 0.1254902, 0, 1,
-1.960659, -1.196858, -3.467772, 1, 0.1333333, 0, 1,
-1.914856, 0.7428491, -0.4503292, 1, 0.1372549, 0, 1,
-1.893786, 1.055558, -1.021176, 1, 0.145098, 0, 1,
-1.874443, 1.715821, 0.1285479, 1, 0.1490196, 0, 1,
-1.872606, -0.6538569, -2.851897, 1, 0.1568628, 0, 1,
-1.867012, 0.2613056, -1.517948, 1, 0.1607843, 0, 1,
-1.861102, 0.3905087, -1.85573, 1, 0.1686275, 0, 1,
-1.826289, 0.1566214, -2.845087, 1, 0.172549, 0, 1,
-1.820807, -0.8275121, -2.547767, 1, 0.1803922, 0, 1,
-1.816719, -1.997578, -3.101595, 1, 0.1843137, 0, 1,
-1.80674, 0.9024559, -2.277861, 1, 0.1921569, 0, 1,
-1.7793, -0.7443198, -0.4196435, 1, 0.1960784, 0, 1,
-1.756201, 0.1873988, -3.10311, 1, 0.2039216, 0, 1,
-1.753238, 1.101443, 1.056144, 1, 0.2117647, 0, 1,
-1.749835, 1.179524, 1.166852, 1, 0.2156863, 0, 1,
-1.747312, -1.142464, -2.382224, 1, 0.2235294, 0, 1,
-1.719933, 0.2553101, -2.047883, 1, 0.227451, 0, 1,
-1.696586, 0.5319201, -1.199123, 1, 0.2352941, 0, 1,
-1.690725, 0.4430214, -2.794944, 1, 0.2392157, 0, 1,
-1.685965, 0.6172356, -1.931269, 1, 0.2470588, 0, 1,
-1.652539, 0.1452673, -2.431632, 1, 0.2509804, 0, 1,
-1.64157, 0.0187364, -0.2209478, 1, 0.2588235, 0, 1,
-1.640717, -0.8879102, -2.133092, 1, 0.2627451, 0, 1,
-1.631402, 0.2271188, 0.008586352, 1, 0.2705882, 0, 1,
-1.62358, 0.5077444, -0.6318044, 1, 0.2745098, 0, 1,
-1.60489, -0.4401276, -2.016431, 1, 0.282353, 0, 1,
-1.598187, 0.8309029, -1.524625, 1, 0.2862745, 0, 1,
-1.596782, -0.7188904, -0.4265137, 1, 0.2941177, 0, 1,
-1.58289, 1.144418, -0.1724257, 1, 0.3019608, 0, 1,
-1.566467, 1.384513, -1.742039, 1, 0.3058824, 0, 1,
-1.5609, -1.291969, -0.5255049, 1, 0.3137255, 0, 1,
-1.555461, -2.220838, -3.140418, 1, 0.3176471, 0, 1,
-1.550451, 1.095867, -0.9211588, 1, 0.3254902, 0, 1,
-1.549266, 0.2709869, -1.288108, 1, 0.3294118, 0, 1,
-1.545583, -1.523022, -0.9730254, 1, 0.3372549, 0, 1,
-1.531886, 0.2234851, -0.7092678, 1, 0.3411765, 0, 1,
-1.518645, 0.2229681, -1.044357, 1, 0.3490196, 0, 1,
-1.511103, 0.5406401, -2.598445, 1, 0.3529412, 0, 1,
-1.509769, 1.368336, -1.136142, 1, 0.3607843, 0, 1,
-1.509695, -0.3125204, -2.091532, 1, 0.3647059, 0, 1,
-1.504779, 0.4521681, -1.392875, 1, 0.372549, 0, 1,
-1.496287, 1.613923, -1.553142, 1, 0.3764706, 0, 1,
-1.484891, -0.5202625, -3.05068, 1, 0.3843137, 0, 1,
-1.465876, 0.8559793, 0.4314777, 1, 0.3882353, 0, 1,
-1.445456, 0.183078, -1.466457, 1, 0.3960784, 0, 1,
-1.436177, -0.5526664, -1.886967, 1, 0.4039216, 0, 1,
-1.42896, 1.124947, -0.8071554, 1, 0.4078431, 0, 1,
-1.425197, 1.11722, -1.779594, 1, 0.4156863, 0, 1,
-1.417329, 1.062609, -2.151155, 1, 0.4196078, 0, 1,
-1.414892, -1.179787, -3.880986, 1, 0.427451, 0, 1,
-1.414187, -0.3744161, 0.06606453, 1, 0.4313726, 0, 1,
-1.39948, -0.8901791, -0.3151189, 1, 0.4392157, 0, 1,
-1.370251, 1.863124, 1.343515, 1, 0.4431373, 0, 1,
-1.365427, -0.03379259, -0.8745956, 1, 0.4509804, 0, 1,
-1.365126, -1.559306, -1.580391, 1, 0.454902, 0, 1,
-1.356771, 1.805965, -0.609259, 1, 0.4627451, 0, 1,
-1.350725, 0.5510828, -1.789825, 1, 0.4666667, 0, 1,
-1.345272, 0.7484843, -0.559248, 1, 0.4745098, 0, 1,
-1.337704, 1.181084, 0.5925145, 1, 0.4784314, 0, 1,
-1.328919, -1.019742, -1.618195, 1, 0.4862745, 0, 1,
-1.32878, 0.205296, -1.895682, 1, 0.4901961, 0, 1,
-1.328586, 1.171833, -0.2440703, 1, 0.4980392, 0, 1,
-1.327905, 1.602737, -0.4629706, 1, 0.5058824, 0, 1,
-1.32689, -1.409166, -2.064024, 1, 0.509804, 0, 1,
-1.326462, -1.857059, -0.5952833, 1, 0.5176471, 0, 1,
-1.323627, 2.054817, -1.111249, 1, 0.5215687, 0, 1,
-1.321413, -2.404964, -3.334685, 1, 0.5294118, 0, 1,
-1.319412, -1.179977, -1.150036, 1, 0.5333334, 0, 1,
-1.316468, 0.8471748, 1.213017, 1, 0.5411765, 0, 1,
-1.310814, 0.963883, -0.2451557, 1, 0.5450981, 0, 1,
-1.309432, 0.1672494, -2.411625, 1, 0.5529412, 0, 1,
-1.290182, -0.05140676, -1.621416, 1, 0.5568628, 0, 1,
-1.287901, -0.07898071, -0.3233284, 1, 0.5647059, 0, 1,
-1.285205, 2.126704, -0.7395265, 1, 0.5686275, 0, 1,
-1.278113, 0.2745219, -1.626282, 1, 0.5764706, 0, 1,
-1.277282, -0.6707883, -0.7032877, 1, 0.5803922, 0, 1,
-1.275883, 1.113557, -1.535867, 1, 0.5882353, 0, 1,
-1.26629, -0.2287464, -1.758002, 1, 0.5921569, 0, 1,
-1.263656, -1.160114, -1.812284, 1, 0.6, 0, 1,
-1.263083, 1.024365, -0.1296155, 1, 0.6078432, 0, 1,
-1.258057, -0.4613353, -0.3927893, 1, 0.6117647, 0, 1,
-1.24581, 0.8872117, -2.100202, 1, 0.6196079, 0, 1,
-1.242684, 0.6362907, 0.6984686, 1, 0.6235294, 0, 1,
-1.241622, 0.1734663, -1.810203, 1, 0.6313726, 0, 1,
-1.234259, -1.187837, -3.436015, 1, 0.6352941, 0, 1,
-1.230533, -0.9770073, -1.637592, 1, 0.6431373, 0, 1,
-1.223121, 2.212091, -1.833346, 1, 0.6470588, 0, 1,
-1.21686, -0.671608, -1.397161, 1, 0.654902, 0, 1,
-1.210586, -0.4232364, -2.108612, 1, 0.6588235, 0, 1,
-1.181409, -0.90495, -2.006646, 1, 0.6666667, 0, 1,
-1.177814, -0.4033048, -1.90474, 1, 0.6705883, 0, 1,
-1.17239, -0.9425914, -2.11021, 1, 0.6784314, 0, 1,
-1.168381, 0.8048885, -1.686128, 1, 0.682353, 0, 1,
-1.167014, 0.07100773, -0.9551154, 1, 0.6901961, 0, 1,
-1.162003, 0.84649, -3.740073, 1, 0.6941177, 0, 1,
-1.160321, -0.95196, -4.036994, 1, 0.7019608, 0, 1,
-1.147154, 0.4416118, -0.8888193, 1, 0.7098039, 0, 1,
-1.145806, -1.086509, -3.276281, 1, 0.7137255, 0, 1,
-1.14339, -0.7588235, -2.022773, 1, 0.7215686, 0, 1,
-1.14159, -0.04666764, -1.78422, 1, 0.7254902, 0, 1,
-1.134254, -0.1527794, -2.617618, 1, 0.7333333, 0, 1,
-1.134104, -0.2337706, -2.847192, 1, 0.7372549, 0, 1,
-1.133716, 2.335095, 1.040527, 1, 0.7450981, 0, 1,
-1.124212, 1.042227, 0.4778931, 1, 0.7490196, 0, 1,
-1.120598, 0.1280649, -1.624675, 1, 0.7568628, 0, 1,
-1.118901, -1.672127, -2.010207, 1, 0.7607843, 0, 1,
-1.117607, -0.7928816, -1.843843, 1, 0.7686275, 0, 1,
-1.116689, -0.1816403, 0.6519129, 1, 0.772549, 0, 1,
-1.113808, -0.9944311, -3.099536, 1, 0.7803922, 0, 1,
-1.110611, 1.258345, 0.2742484, 1, 0.7843137, 0, 1,
-1.1088, -0.3814744, -2.267009, 1, 0.7921569, 0, 1,
-1.102038, -0.1907602, -1.726276, 1, 0.7960784, 0, 1,
-1.101876, 0.6417834, -1.603441, 1, 0.8039216, 0, 1,
-1.093464, 1.607893, -1.265788, 1, 0.8117647, 0, 1,
-1.08909, 1.303402, -1.055102, 1, 0.8156863, 0, 1,
-1.089035, -1.691927, -3.039454, 1, 0.8235294, 0, 1,
-1.08798, 1.654472, -0.4946275, 1, 0.827451, 0, 1,
-1.081255, 1.357589, -0.1334747, 1, 0.8352941, 0, 1,
-1.076873, 1.330836, -0.9364442, 1, 0.8392157, 0, 1,
-1.054556, -0.4614858, -3.17842, 1, 0.8470588, 0, 1,
-1.052281, 0.8602568, -2.895548, 1, 0.8509804, 0, 1,
-1.046414, -0.703182, -3.051065, 1, 0.8588235, 0, 1,
-1.044055, -0.4586623, -1.50396, 1, 0.8627451, 0, 1,
-1.041172, 0.5153868, -0.7921643, 1, 0.8705882, 0, 1,
-1.036899, 0.1743129, -2.812703, 1, 0.8745098, 0, 1,
-1.036659, 0.3062098, -0.4151188, 1, 0.8823529, 0, 1,
-1.028588, 0.03448079, -0.6896198, 1, 0.8862745, 0, 1,
-1.012401, 0.163046, -2.842536, 1, 0.8941177, 0, 1,
-1.010537, -0.02912937, -1.737478, 1, 0.8980392, 0, 1,
-1.002929, 0.6048526, -2.503554, 1, 0.9058824, 0, 1,
-1.002865, -0.3351602, -1.46065, 1, 0.9137255, 0, 1,
-1.001181, 0.02173901, -1.28942, 1, 0.9176471, 0, 1,
-0.9984198, 0.4386843, -1.686525, 1, 0.9254902, 0, 1,
-0.9940158, -1.723954, -2.721549, 1, 0.9294118, 0, 1,
-0.9897304, -1.500366, -1.387455, 1, 0.9372549, 0, 1,
-0.984212, 0.06747391, -0.5708393, 1, 0.9411765, 0, 1,
-0.9831418, -0.7098478, -1.508766, 1, 0.9490196, 0, 1,
-0.9751521, 1.023608, -0.2445345, 1, 0.9529412, 0, 1,
-0.9724689, -0.005388162, -1.359704, 1, 0.9607843, 0, 1,
-0.9693421, 1.729216, -0.558014, 1, 0.9647059, 0, 1,
-0.9669449, 2.168435, 0.8992761, 1, 0.972549, 0, 1,
-0.9642539, -0.4796376, -2.616153, 1, 0.9764706, 0, 1,
-0.9638897, -1.7882, -3.544202, 1, 0.9843137, 0, 1,
-0.9623444, 1.989372, 0.1861746, 1, 0.9882353, 0, 1,
-0.9513322, -1.1135, -1.820258, 1, 0.9960784, 0, 1,
-0.951263, 2.375077, -0.2006793, 0.9960784, 1, 0, 1,
-0.9509546, 0.5101722, -0.4782992, 0.9921569, 1, 0, 1,
-0.9498253, 0.4742425, -1.133548, 0.9843137, 1, 0, 1,
-0.948274, 0.9192254, -1.379018, 0.9803922, 1, 0, 1,
-0.9460126, 1.057192, -0.3862883, 0.972549, 1, 0, 1,
-0.942939, 1.024566, -0.0159401, 0.9686275, 1, 0, 1,
-0.9423265, 0.1205668, -1.226977, 0.9607843, 1, 0, 1,
-0.9363613, 0.8485712, -0.5289342, 0.9568627, 1, 0, 1,
-0.9337009, -0.412156, -1.495233, 0.9490196, 1, 0, 1,
-0.9320803, 1.693484, -1.749505, 0.945098, 1, 0, 1,
-0.9236001, -1.816234, -2.499053, 0.9372549, 1, 0, 1,
-0.920589, 1.079442, -1.094943, 0.9333333, 1, 0, 1,
-0.9150404, -1.199267, -1.314011, 0.9254902, 1, 0, 1,
-0.914158, 0.2945003, -2.690269, 0.9215686, 1, 0, 1,
-0.9032427, -0.8483832, -1.469647, 0.9137255, 1, 0, 1,
-0.8989674, -0.4199125, -3.017726, 0.9098039, 1, 0, 1,
-0.8982806, 0.1036978, -0.7176725, 0.9019608, 1, 0, 1,
-0.8976232, -1.666803, -3.532856, 0.8941177, 1, 0, 1,
-0.8909344, 0.5819906, -0.6514281, 0.8901961, 1, 0, 1,
-0.8892103, -1.003816, -3.024174, 0.8823529, 1, 0, 1,
-0.8767664, 1.30163, -1.814253, 0.8784314, 1, 0, 1,
-0.8723511, 0.3635059, -0.6338331, 0.8705882, 1, 0, 1,
-0.8688121, 0.4811153, -0.5708214, 0.8666667, 1, 0, 1,
-0.8683455, 0.141681, -2.157691, 0.8588235, 1, 0, 1,
-0.8678119, -0.3047398, -2.355672, 0.854902, 1, 0, 1,
-0.8659589, -0.5314336, -2.185989, 0.8470588, 1, 0, 1,
-0.8658744, 0.6789619, -3.138551, 0.8431373, 1, 0, 1,
-0.864148, -0.4874256, -1.835863, 0.8352941, 1, 0, 1,
-0.8635302, -0.6524043, -1.956952, 0.8313726, 1, 0, 1,
-0.8602868, -0.2958089, -3.05677, 0.8235294, 1, 0, 1,
-0.8567868, 0.5319856, -0.3074968, 0.8196079, 1, 0, 1,
-0.8540111, -0.6072432, -2.813228, 0.8117647, 1, 0, 1,
-0.8502248, 0.0106278, -1.208205, 0.8078431, 1, 0, 1,
-0.8477018, -0.1288961, -1.346404, 0.8, 1, 0, 1,
-0.8475131, -1.683673, -0.9448999, 0.7921569, 1, 0, 1,
-0.8454878, -0.995227, -1.96594, 0.7882353, 1, 0, 1,
-0.8432264, -0.7781888, -3.653579, 0.7803922, 1, 0, 1,
-0.8429018, 1.934704, 0.6520355, 0.7764706, 1, 0, 1,
-0.8389021, 0.5505311, -0.8737645, 0.7686275, 1, 0, 1,
-0.8286674, 2.338599, -0.1058714, 0.7647059, 1, 0, 1,
-0.8263058, -0.7975561, -4.207241, 0.7568628, 1, 0, 1,
-0.8254997, 1.070584, -1.332826, 0.7529412, 1, 0, 1,
-0.824442, -0.5986989, -2.542296, 0.7450981, 1, 0, 1,
-0.8224921, 0.9030173, -1.8473, 0.7411765, 1, 0, 1,
-0.8216531, 0.2924311, -1.96345, 0.7333333, 1, 0, 1,
-0.8205938, 0.9571349, 0.8534471, 0.7294118, 1, 0, 1,
-0.8205903, 1.066748, -0.301785, 0.7215686, 1, 0, 1,
-0.8159247, 0.7149977, -2.082007, 0.7176471, 1, 0, 1,
-0.8070834, 1.110349, -1.805851, 0.7098039, 1, 0, 1,
-0.8054453, -0.9814239, -1.940993, 0.7058824, 1, 0, 1,
-0.8017312, 1.125027, -1.444305, 0.6980392, 1, 0, 1,
-0.8005773, -0.7790759, -1.651016, 0.6901961, 1, 0, 1,
-0.7984785, -1.062281, -3.027706, 0.6862745, 1, 0, 1,
-0.7873369, -0.4871298, -2.805566, 0.6784314, 1, 0, 1,
-0.7867332, 2.41815, -0.9130217, 0.6745098, 1, 0, 1,
-0.7856001, 0.8369051, -1.514353, 0.6666667, 1, 0, 1,
-0.7847614, -1.576072, -2.51302, 0.6627451, 1, 0, 1,
-0.7799674, 0.1698938, 0.2957457, 0.654902, 1, 0, 1,
-0.7798129, -0.0522422, -0.5943877, 0.6509804, 1, 0, 1,
-0.77799, 1.235687, -1.378614, 0.6431373, 1, 0, 1,
-0.7758443, -0.5335892, -2.972952, 0.6392157, 1, 0, 1,
-0.7755963, -0.8814301, -1.545281, 0.6313726, 1, 0, 1,
-0.7732353, -0.4353839, -3.1938, 0.627451, 1, 0, 1,
-0.7723854, 1.374238, 0.09502305, 0.6196079, 1, 0, 1,
-0.7699232, -0.4316801, -2.057662, 0.6156863, 1, 0, 1,
-0.7688505, 1.547338, 0.9304029, 0.6078432, 1, 0, 1,
-0.7687226, 0.007456022, -3.228834, 0.6039216, 1, 0, 1,
-0.7660596, 2.193362, -0.1691585, 0.5960785, 1, 0, 1,
-0.7631008, -0.7642511, -1.555607, 0.5882353, 1, 0, 1,
-0.7506238, -0.867258, -3.051214, 0.5843138, 1, 0, 1,
-0.7497774, 0.9118662, 0.05819819, 0.5764706, 1, 0, 1,
-0.7483361, -2.153213, -2.025162, 0.572549, 1, 0, 1,
-0.7482575, 0.2222433, -2.71524, 0.5647059, 1, 0, 1,
-0.7459779, -0.3822387, -3.570797, 0.5607843, 1, 0, 1,
-0.7388822, 0.4882517, -2.635711, 0.5529412, 1, 0, 1,
-0.7340754, 2.01506, -1.018028, 0.5490196, 1, 0, 1,
-0.7161752, 0.8754739, -0.05063704, 0.5411765, 1, 0, 1,
-0.7071781, -1.896082, -3.809344, 0.5372549, 1, 0, 1,
-0.7051547, -0.4381533, -2.344763, 0.5294118, 1, 0, 1,
-0.70061, 1.34232, -0.4183545, 0.5254902, 1, 0, 1,
-0.7000009, 0.3335311, -2.62902, 0.5176471, 1, 0, 1,
-0.6904739, 0.8443269, -1.133606, 0.5137255, 1, 0, 1,
-0.6896048, -0.3982469, -3.330113, 0.5058824, 1, 0, 1,
-0.6823439, 0.337391, -1.962417, 0.5019608, 1, 0, 1,
-0.6727334, -0.01589775, -1.209411, 0.4941176, 1, 0, 1,
-0.672505, -0.9049382, -4.080065, 0.4862745, 1, 0, 1,
-0.6656378, 0.7333318, 0.7419358, 0.4823529, 1, 0, 1,
-0.6610117, 0.9171143, 0.3630641, 0.4745098, 1, 0, 1,
-0.6566181, -0.6509231, -2.126745, 0.4705882, 1, 0, 1,
-0.649743, -1.379607, -2.087943, 0.4627451, 1, 0, 1,
-0.6493452, -0.08285867, -1.418741, 0.4588235, 1, 0, 1,
-0.6483982, 0.1582977, -3.116058, 0.4509804, 1, 0, 1,
-0.6473354, -1.020407, -2.874932, 0.4470588, 1, 0, 1,
-0.6369745, -0.4253123, -1.652314, 0.4392157, 1, 0, 1,
-0.6359051, -0.0006579281, -1.206336, 0.4352941, 1, 0, 1,
-0.6358386, 0.2018483, -1.494658, 0.427451, 1, 0, 1,
-0.6272023, -0.4147809, -3.193555, 0.4235294, 1, 0, 1,
-0.6264534, 1.761786, -1.092343, 0.4156863, 1, 0, 1,
-0.6253447, 0.5914335, -0.943539, 0.4117647, 1, 0, 1,
-0.6241074, -0.5893183, -1.783853, 0.4039216, 1, 0, 1,
-0.6196286, -0.1060231, -1.969539, 0.3960784, 1, 0, 1,
-0.6161293, -0.2846479, -0.8723417, 0.3921569, 1, 0, 1,
-0.6152562, -0.1371686, -0.5731908, 0.3843137, 1, 0, 1,
-0.6106501, -1.096959, -2.878671, 0.3803922, 1, 0, 1,
-0.608436, 0.1989461, 0.4053553, 0.372549, 1, 0, 1,
-0.6080241, 0.6911176, -0.9522997, 0.3686275, 1, 0, 1,
-0.6076506, -0.3137779, -4.126049, 0.3607843, 1, 0, 1,
-0.6036449, 0.1460217, -0.5343307, 0.3568628, 1, 0, 1,
-0.5912326, 1.544212, -0.6856418, 0.3490196, 1, 0, 1,
-0.5912258, -0.3079368, -2.195677, 0.345098, 1, 0, 1,
-0.5910723, -1.061911, -2.866436, 0.3372549, 1, 0, 1,
-0.5909907, 0.833047, -0.3228625, 0.3333333, 1, 0, 1,
-0.5838296, -0.0999021, -1.02754, 0.3254902, 1, 0, 1,
-0.5789003, -2.215467, -3.637505, 0.3215686, 1, 0, 1,
-0.5774602, -0.2544422, -1.409878, 0.3137255, 1, 0, 1,
-0.5721117, 0.1612052, -0.8406317, 0.3098039, 1, 0, 1,
-0.5574774, 0.2301127, 0.1988036, 0.3019608, 1, 0, 1,
-0.5565371, 1.243385, -0.3340615, 0.2941177, 1, 0, 1,
-0.5550944, 0.8693463, -2.727015, 0.2901961, 1, 0, 1,
-0.5514358, -0.01760308, -0.3171088, 0.282353, 1, 0, 1,
-0.5508288, 0.7087226, -1.154475, 0.2784314, 1, 0, 1,
-0.5482465, 0.008094176, -1.761762, 0.2705882, 1, 0, 1,
-0.5476574, -0.9125806, -3.040819, 0.2666667, 1, 0, 1,
-0.5434969, -0.9672716, -3.414581, 0.2588235, 1, 0, 1,
-0.5428955, 1.245901, -0.07308218, 0.254902, 1, 0, 1,
-0.5426966, -0.9247428, -0.9960886, 0.2470588, 1, 0, 1,
-0.5385744, 1.361286, 0.6141617, 0.2431373, 1, 0, 1,
-0.5375792, 0.3626753, -1.972362, 0.2352941, 1, 0, 1,
-0.5351645, 0.8705171, 0.06067269, 0.2313726, 1, 0, 1,
-0.5306885, -0.1642945, -0.6294993, 0.2235294, 1, 0, 1,
-0.5305043, 0.2991695, -0.7448183, 0.2196078, 1, 0, 1,
-0.522391, -0.008343636, -1.971836, 0.2117647, 1, 0, 1,
-0.5173981, 1.301733, 0.1465502, 0.2078431, 1, 0, 1,
-0.5173143, -1.07856, -1.564985, 0.2, 1, 0, 1,
-0.5152969, 1.110549, -2.066199, 0.1921569, 1, 0, 1,
-0.5149603, 0.8780044, 0.4322225, 0.1882353, 1, 0, 1,
-0.5148038, 1.017613, 0.01816395, 0.1803922, 1, 0, 1,
-0.5136135, -1.272696, -2.892678, 0.1764706, 1, 0, 1,
-0.5087545, 0.4239918, -1.834054, 0.1686275, 1, 0, 1,
-0.5070121, -0.1986777, -0.8194919, 0.1647059, 1, 0, 1,
-0.5057827, -0.5419344, -3.928676, 0.1568628, 1, 0, 1,
-0.5045598, -1.189812, -4.18329, 0.1529412, 1, 0, 1,
-0.5038101, -0.2392835, -0.7329706, 0.145098, 1, 0, 1,
-0.5025136, -0.3047533, -3.598161, 0.1411765, 1, 0, 1,
-0.5002817, -2.41967, -1.9885, 0.1333333, 1, 0, 1,
-0.4968515, 0.4026451, -1.630518, 0.1294118, 1, 0, 1,
-0.4963965, -0.4848686, -3.827105, 0.1215686, 1, 0, 1,
-0.4919445, 0.3787537, -1.658279, 0.1176471, 1, 0, 1,
-0.4910747, -1.306352, -0.7499799, 0.1098039, 1, 0, 1,
-0.4884892, 0.3779649, -1.296417, 0.1058824, 1, 0, 1,
-0.4856387, -0.6553627, -3.654219, 0.09803922, 1, 0, 1,
-0.4853174, 1.041113, -0.7353216, 0.09019608, 1, 0, 1,
-0.4792961, 0.1241899, 0.6001619, 0.08627451, 1, 0, 1,
-0.4767804, 0.2602715, -2.392442, 0.07843138, 1, 0, 1,
-0.4765889, 0.4965966, -0.6003743, 0.07450981, 1, 0, 1,
-0.4756252, -0.07245518, -1.4347, 0.06666667, 1, 0, 1,
-0.4701802, 1.145459, 0.1692129, 0.0627451, 1, 0, 1,
-0.4694074, 0.6377037, -0.6909254, 0.05490196, 1, 0, 1,
-0.4686769, -0.8342988, -2.243937, 0.05098039, 1, 0, 1,
-0.4639406, -0.8886637, -3.806412, 0.04313726, 1, 0, 1,
-0.4633907, -0.2175124, -3.643679, 0.03921569, 1, 0, 1,
-0.4632084, -0.3501628, -2.291903, 0.03137255, 1, 0, 1,
-0.457632, -1.252955, -1.670192, 0.02745098, 1, 0, 1,
-0.4562648, 1.082438, -0.4840053, 0.01960784, 1, 0, 1,
-0.4546613, -1.517379, -4.515756, 0.01568628, 1, 0, 1,
-0.4533401, 0.9216262, -0.1777021, 0.007843138, 1, 0, 1,
-0.4505849, -0.2697353, -2.46316, 0.003921569, 1, 0, 1,
-0.4504459, -1.386019, -4.335796, 0, 1, 0.003921569, 1,
-0.4462323, -0.7326999, -2.244382, 0, 1, 0.01176471, 1,
-0.4455369, 0.2058581, -1.25558, 0, 1, 0.01568628, 1,
-0.4429769, 0.07644904, -0.2635779, 0, 1, 0.02352941, 1,
-0.4427691, -0.8119526, -1.845729, 0, 1, 0.02745098, 1,
-0.4422399, 0.4435385, -0.8207055, 0, 1, 0.03529412, 1,
-0.4374295, -1.22882, -3.329094, 0, 1, 0.03921569, 1,
-0.4296013, -0.5232122, -4.678751, 0, 1, 0.04705882, 1,
-0.428876, 0.7591594, -1.531136, 0, 1, 0.05098039, 1,
-0.4288047, -1.942731, -1.689688, 0, 1, 0.05882353, 1,
-0.4279591, 0.4832766, -1.278487, 0, 1, 0.0627451, 1,
-0.4267353, -0.8467368, -1.860403, 0, 1, 0.07058824, 1,
-0.4263826, 0.7549083, -1.09674, 0, 1, 0.07450981, 1,
-0.4257831, 0.5583784, -0.02947567, 0, 1, 0.08235294, 1,
-0.422179, -0.5858889, -3.965409, 0, 1, 0.08627451, 1,
-0.4110416, -0.8308948, -0.5796792, 0, 1, 0.09411765, 1,
-0.4031337, 0.9364048, 1.521719, 0, 1, 0.1019608, 1,
-0.4029649, -0.2162151, -3.134742, 0, 1, 0.1058824, 1,
-0.3865335, 0.2951247, -1.579548, 0, 1, 0.1137255, 1,
-0.3848284, -1.762756, -3.217481, 0, 1, 0.1176471, 1,
-0.3790658, 2.470744, -0.7445747, 0, 1, 0.1254902, 1,
-0.3769141, 1.566216, 1.201178, 0, 1, 0.1294118, 1,
-0.36961, -1.533038, -4.437394, 0, 1, 0.1372549, 1,
-0.3680612, -0.02929116, -0.8572162, 0, 1, 0.1411765, 1,
-0.3666104, -0.9084061, -2.962938, 0, 1, 0.1490196, 1,
-0.3661175, -0.841951, -3.986375, 0, 1, 0.1529412, 1,
-0.3639616, -0.9239498, -3.726924, 0, 1, 0.1607843, 1,
-0.3634485, 2.694843, -1.65638, 0, 1, 0.1647059, 1,
-0.3593638, -0.1095196, -2.217132, 0, 1, 0.172549, 1,
-0.3546664, -0.1192214, -0.9898922, 0, 1, 0.1764706, 1,
-0.3542046, -1.567512, -2.640481, 0, 1, 0.1843137, 1,
-0.3536916, 0.1457216, -1.528921, 0, 1, 0.1882353, 1,
-0.3505769, 0.9064277, -1.258633, 0, 1, 0.1960784, 1,
-0.350494, 0.8017959, -0.9828883, 0, 1, 0.2039216, 1,
-0.3457676, 0.5667725, -0.8643459, 0, 1, 0.2078431, 1,
-0.3341199, -0.5940878, -3.03152, 0, 1, 0.2156863, 1,
-0.3323935, 0.2505703, -3.318425, 0, 1, 0.2196078, 1,
-0.3310125, -0.0347866, -2.1088, 0, 1, 0.227451, 1,
-0.3262632, 1.398292, -1.021745, 0, 1, 0.2313726, 1,
-0.3256925, -0.3092717, -3.802917, 0, 1, 0.2392157, 1,
-0.3248216, -0.4320089, -2.600558, 0, 1, 0.2431373, 1,
-0.3229423, -0.3815463, -3.478863, 0, 1, 0.2509804, 1,
-0.3146667, 0.17507, -1.097975, 0, 1, 0.254902, 1,
-0.3138402, 0.8599484, 0.4457694, 0, 1, 0.2627451, 1,
-0.3081742, -1.773996, -3.714144, 0, 1, 0.2666667, 1,
-0.3065906, 0.641048, -2.244386, 0, 1, 0.2745098, 1,
-0.3057381, -1.674398, -2.115849, 0, 1, 0.2784314, 1,
-0.3041312, 0.2930761, -0.994631, 0, 1, 0.2862745, 1,
-0.3038251, 1.665072, 1.036251, 0, 1, 0.2901961, 1,
-0.3012265, -1.307005, -2.227816, 0, 1, 0.2980392, 1,
-0.2991759, 0.183844, -0.8777763, 0, 1, 0.3058824, 1,
-0.2955403, -0.171609, -0.7771962, 0, 1, 0.3098039, 1,
-0.2947291, -1.037656, -2.759386, 0, 1, 0.3176471, 1,
-0.2925723, -0.6672629, -2.337365, 0, 1, 0.3215686, 1,
-0.2917126, -1.014786, -4.23817, 0, 1, 0.3294118, 1,
-0.2895525, 2.03197, -0.5575191, 0, 1, 0.3333333, 1,
-0.2866291, 0.02204776, -2.051265, 0, 1, 0.3411765, 1,
-0.2810346, -0.5176995, -3.231791, 0, 1, 0.345098, 1,
-0.2803236, 0.6712625, -0.2853916, 0, 1, 0.3529412, 1,
-0.2799183, 1.059528, -0.1006119, 0, 1, 0.3568628, 1,
-0.2768878, -0.7266134, -3.775378, 0, 1, 0.3647059, 1,
-0.2763367, -0.5931945, -2.899944, 0, 1, 0.3686275, 1,
-0.266745, -0.7117586, -2.212249, 0, 1, 0.3764706, 1,
-0.264629, 0.1309797, -1.802323, 0, 1, 0.3803922, 1,
-0.2631554, -0.3444929, -2.835735, 0, 1, 0.3882353, 1,
-0.2550019, 0.574688, -0.04106864, 0, 1, 0.3921569, 1,
-0.2516302, -1.302166, -2.991003, 0, 1, 0.4, 1,
-0.247557, 1.754992, 1.186256, 0, 1, 0.4078431, 1,
-0.2437308, -1.577825, -2.142491, 0, 1, 0.4117647, 1,
-0.2365045, -2.087904, -3.006583, 0, 1, 0.4196078, 1,
-0.2351341, 1.166165, -0.4787998, 0, 1, 0.4235294, 1,
-0.2314841, -0.06564378, -2.620201, 0, 1, 0.4313726, 1,
-0.2275465, -2.27835, -2.666312, 0, 1, 0.4352941, 1,
-0.2258679, 1.393943, 0.08508049, 0, 1, 0.4431373, 1,
-0.2249795, 0.5013025, -0.822853, 0, 1, 0.4470588, 1,
-0.219551, 1.796585, -1.435767, 0, 1, 0.454902, 1,
-0.2193003, -1.298177, -3.72421, 0, 1, 0.4588235, 1,
-0.2175496, -2.113902, -2.258192, 0, 1, 0.4666667, 1,
-0.2171058, 1.014678, -0.3189545, 0, 1, 0.4705882, 1,
-0.2152858, -0.05183081, -3.451041, 0, 1, 0.4784314, 1,
-0.2143195, 0.4957373, -1.239617, 0, 1, 0.4823529, 1,
-0.2127724, -1.019516, -2.849211, 0, 1, 0.4901961, 1,
-0.2105704, 0.06735655, -0.7005786, 0, 1, 0.4941176, 1,
-0.2081917, -0.5313964, -2.413809, 0, 1, 0.5019608, 1,
-0.2067861, -2.345156, -3.52835, 0, 1, 0.509804, 1,
-0.2067343, 0.9369311, -2.099082, 0, 1, 0.5137255, 1,
-0.2018298, -0.5035054, -1.781217, 0, 1, 0.5215687, 1,
-0.2014232, 0.884936, -1.476084, 0, 1, 0.5254902, 1,
-0.1979093, -0.4943173, -2.982129, 0, 1, 0.5333334, 1,
-0.1963476, 0.802744, 0.6929881, 0, 1, 0.5372549, 1,
-0.1952741, 0.3985453, -1.255207, 0, 1, 0.5450981, 1,
-0.1947386, -0.6863225, -1.654243, 0, 1, 0.5490196, 1,
-0.1917308, -0.1862717, -3.594447, 0, 1, 0.5568628, 1,
-0.1856847, -0.5441027, -1.418967, 0, 1, 0.5607843, 1,
-0.1781599, 0.3081848, 0.2090867, 0, 1, 0.5686275, 1,
-0.1773827, -1.192258, -2.9624, 0, 1, 0.572549, 1,
-0.1761664, 1.912849, -0.492936, 0, 1, 0.5803922, 1,
-0.1711349, 0.9307346, -0.02981872, 0, 1, 0.5843138, 1,
-0.1686923, 1.245276, -2.462368, 0, 1, 0.5921569, 1,
-0.1673255, -0.7621278, -3.080955, 0, 1, 0.5960785, 1,
-0.1666404, 0.2766748, -1.516624, 0, 1, 0.6039216, 1,
-0.1660971, 0.3191242, -1.873326, 0, 1, 0.6117647, 1,
-0.1621886, -0.884249, -2.135355, 0, 1, 0.6156863, 1,
-0.1609988, -0.1933683, -2.548591, 0, 1, 0.6235294, 1,
-0.1599298, -0.4463279, 0.2374416, 0, 1, 0.627451, 1,
-0.1594351, 0.9775768, 0.1688839, 0, 1, 0.6352941, 1,
-0.1586306, -1.040462, -4.162621, 0, 1, 0.6392157, 1,
-0.1585451, -0.700444, -3.958987, 0, 1, 0.6470588, 1,
-0.1578981, 1.23741, 1.475429, 0, 1, 0.6509804, 1,
-0.1576479, 0.1495718, -2.008648, 0, 1, 0.6588235, 1,
-0.1504189, -0.8266872, -2.67177, 0, 1, 0.6627451, 1,
-0.147193, -0.2070991, -2.122052, 0, 1, 0.6705883, 1,
-0.1466954, -0.206637, -5.71247, 0, 1, 0.6745098, 1,
-0.145638, -1.781707, -4.391312, 0, 1, 0.682353, 1,
-0.1413957, 1.432147, -0.6096866, 0, 1, 0.6862745, 1,
-0.1413078, -2.269713, -4.115177, 0, 1, 0.6941177, 1,
-0.139528, -0.6614343, -3.249674, 0, 1, 0.7019608, 1,
-0.1376856, 0.1116679, -0.3303804, 0, 1, 0.7058824, 1,
-0.1364143, 0.1180599, -0.6495126, 0, 1, 0.7137255, 1,
-0.1331516, -1.724318, -5.940272, 0, 1, 0.7176471, 1,
-0.1309986, 0.939996, -1.773798, 0, 1, 0.7254902, 1,
-0.1292482, 0.6510139, 0.5210773, 0, 1, 0.7294118, 1,
-0.1277946, -0.07968789, -3.022683, 0, 1, 0.7372549, 1,
-0.1277777, 1.347171, 1.34079, 0, 1, 0.7411765, 1,
-0.1261218, 1.270228, 0.8607297, 0, 1, 0.7490196, 1,
-0.120432, 0.502681, -0.1827461, 0, 1, 0.7529412, 1,
-0.117158, 0.589519, 0.5103403, 0, 1, 0.7607843, 1,
-0.1164684, 0.6054542, -0.7804289, 0, 1, 0.7647059, 1,
-0.1102297, 1.537012, -0.110116, 0, 1, 0.772549, 1,
-0.1093189, 0.1975433, -0.5798733, 0, 1, 0.7764706, 1,
-0.1074002, 1.157691, 1.181091, 0, 1, 0.7843137, 1,
-0.1066436, 0.3998504, -1.621409, 0, 1, 0.7882353, 1,
-0.106058, 0.9441429, -0.4580936, 0, 1, 0.7960784, 1,
-0.1048031, -1.338024, -2.944075, 0, 1, 0.8039216, 1,
-0.1001325, -0.8913338, -3.548454, 0, 1, 0.8078431, 1,
-0.09896486, 1.4221, 0.6230515, 0, 1, 0.8156863, 1,
-0.09630684, 2.811232, -0.2232343, 0, 1, 0.8196079, 1,
-0.08957416, -0.437335, -3.093565, 0, 1, 0.827451, 1,
-0.07638574, 0.1396871, 0.1063799, 0, 1, 0.8313726, 1,
-0.0692269, 0.01712322, 0.1461932, 0, 1, 0.8392157, 1,
-0.06845543, -0.1883977, -1.832142, 0, 1, 0.8431373, 1,
-0.06775664, -1.323417, -1.632884, 0, 1, 0.8509804, 1,
-0.06067381, 0.4040084, 0.8561867, 0, 1, 0.854902, 1,
-0.05837769, -0.229588, -3.778044, 0, 1, 0.8627451, 1,
-0.05317089, -0.01705265, -1.91461, 0, 1, 0.8666667, 1,
-0.05040044, -0.3527584, -5.111323, 0, 1, 0.8745098, 1,
-0.04995858, -0.06848308, -3.824249, 0, 1, 0.8784314, 1,
-0.04984609, -1.08596, -4.625095, 0, 1, 0.8862745, 1,
-0.04515754, -0.6621131, -3.750958, 0, 1, 0.8901961, 1,
-0.04361175, 0.451066, 1.713792, 0, 1, 0.8980392, 1,
-0.04318081, -0.2097098, -1.88957, 0, 1, 0.9058824, 1,
-0.04254162, 0.3033054, 0.02722338, 0, 1, 0.9098039, 1,
-0.03779667, 1.195296, 0.8111978, 0, 1, 0.9176471, 1,
-0.03712073, -1.686485, -1.389561, 0, 1, 0.9215686, 1,
-0.03675939, -1.165808, -2.466479, 0, 1, 0.9294118, 1,
-0.03606792, 0.6624365, -1.55857, 0, 1, 0.9333333, 1,
-0.03464716, -1.139293, -1.526479, 0, 1, 0.9411765, 1,
-0.0329441, 0.7997546, 1.319341, 0, 1, 0.945098, 1,
-0.03172311, 0.8898305, 0.3530661, 0, 1, 0.9529412, 1,
-0.02904151, -0.05546211, -3.768634, 0, 1, 0.9568627, 1,
-0.02820083, 0.1380165, 0.4098218, 0, 1, 0.9647059, 1,
-0.02780243, 0.8530018, -0.9695862, 0, 1, 0.9686275, 1,
-0.0251106, -1.193645, -4.139508, 0, 1, 0.9764706, 1,
-0.02278701, 0.4253319, 0.3270539, 0, 1, 0.9803922, 1,
-0.02216971, -0.1938181, -3.350304, 0, 1, 0.9882353, 1,
-0.01717899, -0.1461279, -3.346464, 0, 1, 0.9921569, 1,
-0.01415432, -0.0203144, -2.769858, 0, 1, 1, 1,
-0.01305528, -0.7422463, -1.512754, 0, 0.9921569, 1, 1,
-0.009990127, 1.353849, -0.7819368, 0, 0.9882353, 1, 1,
-0.009637655, 0.9702891, 0.7079725, 0, 0.9803922, 1, 1,
-0.006901535, 0.5933864, 1.166642, 0, 0.9764706, 1, 1,
-0.005987248, -0.5282263, -2.702127, 0, 0.9686275, 1, 1,
-0.00427904, -0.1541193, -4.35721, 0, 0.9647059, 1, 1,
-0.003812923, -0.4656011, -2.342396, 0, 0.9568627, 1, 1,
0.0008100162, -0.002306907, 1.103389, 0, 0.9529412, 1, 1,
0.004662901, -0.3969289, 4.113465, 0, 0.945098, 1, 1,
0.004931248, -0.1600114, 2.47309, 0, 0.9411765, 1, 1,
0.006417779, 1.058709, -0.7730091, 0, 0.9333333, 1, 1,
0.007396436, 1.465008, -0.08005711, 0, 0.9294118, 1, 1,
0.007676934, -1.201571, 2.73747, 0, 0.9215686, 1, 1,
0.008435265, -1.068202, 1.552981, 0, 0.9176471, 1, 1,
0.01133028, -1.59092, 2.121991, 0, 0.9098039, 1, 1,
0.01175691, -0.5281401, 3.561254, 0, 0.9058824, 1, 1,
0.01296071, 0.3462892, 0.6151217, 0, 0.8980392, 1, 1,
0.01322044, -0.442481, 2.471854, 0, 0.8901961, 1, 1,
0.01485381, 0.2870731, 0.323303, 0, 0.8862745, 1, 1,
0.01786293, 0.3445928, -1.303196, 0, 0.8784314, 1, 1,
0.01928345, -1.467861, 2.095227, 0, 0.8745098, 1, 1,
0.02147465, -1.488934, 3.706015, 0, 0.8666667, 1, 1,
0.02567251, 0.08272173, 0.1698016, 0, 0.8627451, 1, 1,
0.02607596, -0.7567465, 3.466954, 0, 0.854902, 1, 1,
0.03095883, -0.127352, 3.766801, 0, 0.8509804, 1, 1,
0.0325481, -1.460923, 2.16483, 0, 0.8431373, 1, 1,
0.03376481, 0.06304108, -0.1994228, 0, 0.8392157, 1, 1,
0.03670099, -1.085016, 2.797331, 0, 0.8313726, 1, 1,
0.03867919, -0.6389141, 2.000028, 0, 0.827451, 1, 1,
0.04173313, -1.563015, 4.062252, 0, 0.8196079, 1, 1,
0.04310446, 1.111884, -0.4617985, 0, 0.8156863, 1, 1,
0.04570645, -0.3239683, 3.930248, 0, 0.8078431, 1, 1,
0.0458489, 0.2783392, 2.05256, 0, 0.8039216, 1, 1,
0.04665218, 0.4754063, -1.269704, 0, 0.7960784, 1, 1,
0.04723972, 0.7025701, 0.6926357, 0, 0.7882353, 1, 1,
0.0497457, -0.4770176, 5.624664, 0, 0.7843137, 1, 1,
0.04976923, 1.933555, 0.3982646, 0, 0.7764706, 1, 1,
0.05665896, 0.7839809, 0.3832425, 0, 0.772549, 1, 1,
0.06158806, -0.5387735, 2.790226, 0, 0.7647059, 1, 1,
0.06368028, 2.095129, -0.4560864, 0, 0.7607843, 1, 1,
0.06475736, -0.7233636, 2.85017, 0, 0.7529412, 1, 1,
0.07208732, 0.4856175, 0.6924384, 0, 0.7490196, 1, 1,
0.07352065, -1.060279, 4.481813, 0, 0.7411765, 1, 1,
0.07452322, -1.31137, 4.533716, 0, 0.7372549, 1, 1,
0.07458695, -0.237728, 2.45045, 0, 0.7294118, 1, 1,
0.07688292, -0.6048142, 3.410967, 0, 0.7254902, 1, 1,
0.07762247, 0.2337463, 1.078731, 0, 0.7176471, 1, 1,
0.07894131, -1.132663, 4.113904, 0, 0.7137255, 1, 1,
0.0799688, -0.5887396, 3.169322, 0, 0.7058824, 1, 1,
0.08023697, -0.8747841, 3.959651, 0, 0.6980392, 1, 1,
0.08105488, -0.04713333, 1.829581, 0, 0.6941177, 1, 1,
0.08921409, -0.6928995, 3.357761, 0, 0.6862745, 1, 1,
0.09121521, 0.802356, 1.108727, 0, 0.682353, 1, 1,
0.09194807, -0.1481863, 3.544621, 0, 0.6745098, 1, 1,
0.0929039, -2.009134, 2.9091, 0, 0.6705883, 1, 1,
0.1015061, 1.203005, 1.054696, 0, 0.6627451, 1, 1,
0.1042086, -0.4338267, 2.47245, 0, 0.6588235, 1, 1,
0.1051689, -0.1920584, 2.576241, 0, 0.6509804, 1, 1,
0.1067261, 1.529201, 0.1232003, 0, 0.6470588, 1, 1,
0.10719, 0.2590977, 0.6772307, 0, 0.6392157, 1, 1,
0.1082196, -0.127129, 2.572677, 0, 0.6352941, 1, 1,
0.1089806, -0.6333115, 5.528932, 0, 0.627451, 1, 1,
0.1157089, -0.9270341, 3.490921, 0, 0.6235294, 1, 1,
0.1191455, -1.797908, 3.365749, 0, 0.6156863, 1, 1,
0.1278234, 0.5284616, -0.4947219, 0, 0.6117647, 1, 1,
0.1295214, -0.05450513, -0.02110881, 0, 0.6039216, 1, 1,
0.129952, -1.625138, 4.888802, 0, 0.5960785, 1, 1,
0.1320208, -2.702995, 3.986761, 0, 0.5921569, 1, 1,
0.1324339, -1.359033, 2.001728, 0, 0.5843138, 1, 1,
0.133362, -0.3290993, 3.315177, 0, 0.5803922, 1, 1,
0.1356422, -0.751027, 0.8731032, 0, 0.572549, 1, 1,
0.1369193, -1.223574, 3.803438, 0, 0.5686275, 1, 1,
0.1413662, 1.430801, -0.4696537, 0, 0.5607843, 1, 1,
0.1457637, -1.696067, 2.970322, 0, 0.5568628, 1, 1,
0.148406, -0.6763503, 1.651061, 0, 0.5490196, 1, 1,
0.1526201, 1.563155, -0.08801007, 0, 0.5450981, 1, 1,
0.1553509, 0.3921386, 0.8209953, 0, 0.5372549, 1, 1,
0.1564686, 1.003798, -0.8315879, 0, 0.5333334, 1, 1,
0.157634, 1.008165, 0.6150814, 0, 0.5254902, 1, 1,
0.1579819, 1.419877, -0.04507483, 0, 0.5215687, 1, 1,
0.1592404, -0.4408659, 4.565118, 0, 0.5137255, 1, 1,
0.1669902, -0.6594871, 2.320535, 0, 0.509804, 1, 1,
0.1676327, -1.787765, 2.104062, 0, 0.5019608, 1, 1,
0.1726552, -0.4678671, 1.592824, 0, 0.4941176, 1, 1,
0.1744581, -0.2473516, 3.746014, 0, 0.4901961, 1, 1,
0.1748451, 1.032329, -1.463984, 0, 0.4823529, 1, 1,
0.1761669, 0.9729727, -0.06137368, 0, 0.4784314, 1, 1,
0.1813524, -1.226862, 4.199798, 0, 0.4705882, 1, 1,
0.1823892, -0.3880572, 2.564617, 0, 0.4666667, 1, 1,
0.1829346, 0.1386668, -1.130362, 0, 0.4588235, 1, 1,
0.187592, 0.8635974, -1.995869, 0, 0.454902, 1, 1,
0.1943888, -3.118966, 3.063599, 0, 0.4470588, 1, 1,
0.1955583, -0.4147096, 0.8694689, 0, 0.4431373, 1, 1,
0.2047249, 0.7425025, 1.205611, 0, 0.4352941, 1, 1,
0.2106985, -1.125093, 2.122207, 0, 0.4313726, 1, 1,
0.2124801, -1.646811, 2.3126, 0, 0.4235294, 1, 1,
0.2137954, 0.01651541, 1.539737, 0, 0.4196078, 1, 1,
0.2177974, 0.06378517, 0.918578, 0, 0.4117647, 1, 1,
0.2184113, -0.578943, 3.406788, 0, 0.4078431, 1, 1,
0.2192655, -1.134616, 1.768411, 0, 0.4, 1, 1,
0.220716, -0.8883677, 4.442824, 0, 0.3921569, 1, 1,
0.2227636, 0.2142766, 0.6142659, 0, 0.3882353, 1, 1,
0.2254607, 1.344996, 0.54199, 0, 0.3803922, 1, 1,
0.2289789, -0.02993103, 2.96556, 0, 0.3764706, 1, 1,
0.230654, -0.4879665, 3.028349, 0, 0.3686275, 1, 1,
0.2308797, -0.5150734, 2.835676, 0, 0.3647059, 1, 1,
0.234589, 1.309036, -1.546113, 0, 0.3568628, 1, 1,
0.2346443, 1.836139, 0.2297264, 0, 0.3529412, 1, 1,
0.2352547, -1.82286, 2.317478, 0, 0.345098, 1, 1,
0.2366896, 1.660622, -0.5586774, 0, 0.3411765, 1, 1,
0.2368315, 2.279301, 0.8463493, 0, 0.3333333, 1, 1,
0.2376283, 0.02732601, 0.8131023, 0, 0.3294118, 1, 1,
0.239013, -1.529174, 4.27575, 0, 0.3215686, 1, 1,
0.2393603, -0.08193236, 0.1264555, 0, 0.3176471, 1, 1,
0.240042, 1.633571, 0.08552191, 0, 0.3098039, 1, 1,
0.2438706, 2.088711, 0.8970512, 0, 0.3058824, 1, 1,
0.2455398, -0.8473033, 0.9873134, 0, 0.2980392, 1, 1,
0.2465024, -0.02350482, 3.037261, 0, 0.2901961, 1, 1,
0.2468288, -0.837911, 1.40545, 0, 0.2862745, 1, 1,
0.2495231, 0.4230585, 0.4617738, 0, 0.2784314, 1, 1,
0.2537237, -0.3576136, 2.615843, 0, 0.2745098, 1, 1,
0.2562595, -1.587328, 1.564252, 0, 0.2666667, 1, 1,
0.2571726, -0.4309474, 1.722027, 0, 0.2627451, 1, 1,
0.2578203, 0.423052, 0.07072855, 0, 0.254902, 1, 1,
0.2597658, 2.33204, 2.288474, 0, 0.2509804, 1, 1,
0.2621102, -0.7635837, 3.0393, 0, 0.2431373, 1, 1,
0.2648032, 0.06394248, 1.667253, 0, 0.2392157, 1, 1,
0.2648479, 1.056893, -0.3947482, 0, 0.2313726, 1, 1,
0.2675302, -0.4885479, 2.390236, 0, 0.227451, 1, 1,
0.2691808, 0.7327822, -0.6716556, 0, 0.2196078, 1, 1,
0.2767751, 0.2053069, 2.514659, 0, 0.2156863, 1, 1,
0.2772518, -0.6658472, 2.894404, 0, 0.2078431, 1, 1,
0.2799441, 1.076799, 0.584042, 0, 0.2039216, 1, 1,
0.2804902, 0.8578254, 0.1062858, 0, 0.1960784, 1, 1,
0.2863278, -0.8946371, 3.482369, 0, 0.1882353, 1, 1,
0.2905955, 1.269439, -1.17942, 0, 0.1843137, 1, 1,
0.2919361, 0.7421971, 1.078166, 0, 0.1764706, 1, 1,
0.2950614, 0.8107083, 0.2667272, 0, 0.172549, 1, 1,
0.2956503, -0.09668046, 2.586421, 0, 0.1647059, 1, 1,
0.2974083, 1.623349, 0.3510087, 0, 0.1607843, 1, 1,
0.2983231, -0.5013599, 3.39399, 0, 0.1529412, 1, 1,
0.2998089, 1.169256, 1.1208, 0, 0.1490196, 1, 1,
0.3041925, -1.373012, 1.816913, 0, 0.1411765, 1, 1,
0.3114251, 0.4325912, 1.175936, 0, 0.1372549, 1, 1,
0.3129363, 0.3760723, 1.486914, 0, 0.1294118, 1, 1,
0.3172073, 1.357832, -0.2422496, 0, 0.1254902, 1, 1,
0.3219823, -0.9237278, 3.534784, 0, 0.1176471, 1, 1,
0.3235514, -0.8536772, 2.663323, 0, 0.1137255, 1, 1,
0.3251263, 1.45869, 0.8895048, 0, 0.1058824, 1, 1,
0.3253921, -0.01128746, 1.808173, 0, 0.09803922, 1, 1,
0.3292133, 0.6337039, -0.9119173, 0, 0.09411765, 1, 1,
0.3292231, 0.4967849, 1.030689, 0, 0.08627451, 1, 1,
0.3351001, 0.07046965, 2.539361, 0, 0.08235294, 1, 1,
0.3388318, -0.2501132, 4.32636, 0, 0.07450981, 1, 1,
0.3389356, -0.3827927, 1.750295, 0, 0.07058824, 1, 1,
0.3515613, 0.08219081, 1.331957, 0, 0.0627451, 1, 1,
0.3516304, -1.365113, 3.641809, 0, 0.05882353, 1, 1,
0.3568466, -0.1895428, 2.554156, 0, 0.05098039, 1, 1,
0.3665321, -0.8440136, 3.939915, 0, 0.04705882, 1, 1,
0.3665825, -0.2895334, 1.376962, 0, 0.03921569, 1, 1,
0.3681582, -2.474409, 3.509099, 0, 0.03529412, 1, 1,
0.3702157, -1.330013, 1.263324, 0, 0.02745098, 1, 1,
0.3714092, -0.1012498, 2.086586, 0, 0.02352941, 1, 1,
0.3740881, -0.1351741, 2.357761, 0, 0.01568628, 1, 1,
0.3770526, 0.2441744, -0.46669, 0, 0.01176471, 1, 1,
0.3788883, -0.06227555, 2.523859, 0, 0.003921569, 1, 1,
0.3806099, -1.659798, 2.126116, 0.003921569, 0, 1, 1,
0.3845177, 1.306171, 0.4938122, 0.007843138, 0, 1, 1,
0.3849456, 0.3411856, 0.9341844, 0.01568628, 0, 1, 1,
0.3860482, -1.279338, 2.709211, 0.01960784, 0, 1, 1,
0.3888824, 0.8558394, 0.7833507, 0.02745098, 0, 1, 1,
0.3889393, -0.7095843, 3.08523, 0.03137255, 0, 1, 1,
0.3900814, 0.6943208, 1.346733, 0.03921569, 0, 1, 1,
0.3937625, 0.7272505, -0.5223129, 0.04313726, 0, 1, 1,
0.3939435, -0.4175109, 2.622053, 0.05098039, 0, 1, 1,
0.3979919, 1.748353, -0.588033, 0.05490196, 0, 1, 1,
0.4002537, 0.7887736, 1.132958, 0.0627451, 0, 1, 1,
0.4037628, -0.1892784, -0.7186995, 0.06666667, 0, 1, 1,
0.4041736, -0.1681859, 2.630345, 0.07450981, 0, 1, 1,
0.4044366, 1.849632, 1.001332, 0.07843138, 0, 1, 1,
0.4077401, -0.2482314, 2.318977, 0.08627451, 0, 1, 1,
0.4084707, 1.636401, 0.3929373, 0.09019608, 0, 1, 1,
0.4096502, -0.5494643, 1.876367, 0.09803922, 0, 1, 1,
0.4111319, -0.6769214, 2.210162, 0.1058824, 0, 1, 1,
0.4111409, -2.046127, 3.306216, 0.1098039, 0, 1, 1,
0.415835, -0.1562843, 1.553037, 0.1176471, 0, 1, 1,
0.4175961, -1.749289, 3.189472, 0.1215686, 0, 1, 1,
0.4185191, -0.5260655, 1.329993, 0.1294118, 0, 1, 1,
0.4234235, -0.2465641, 0.8739998, 0.1333333, 0, 1, 1,
0.4252304, -0.6171211, 4.634749, 0.1411765, 0, 1, 1,
0.4301077, -0.4845521, 3.598269, 0.145098, 0, 1, 1,
0.4335884, 0.6301472, 1.108541, 0.1529412, 0, 1, 1,
0.4373667, 0.6973002, 2.698121, 0.1568628, 0, 1, 1,
0.4403238, -0.1614113, 1.685536, 0.1647059, 0, 1, 1,
0.4471829, -0.651206, 0.5345719, 0.1686275, 0, 1, 1,
0.4496007, -1.42072, 3.550344, 0.1764706, 0, 1, 1,
0.4498228, -2.447752, 3.103647, 0.1803922, 0, 1, 1,
0.4502518, 0.2582681, 0.03964349, 0.1882353, 0, 1, 1,
0.4506942, 0.9024118, 2.106753, 0.1921569, 0, 1, 1,
0.4509395, -0.683775, 2.605963, 0.2, 0, 1, 1,
0.4567429, 2.840282, 0.6774437, 0.2078431, 0, 1, 1,
0.4587098, -1.072447, 2.574466, 0.2117647, 0, 1, 1,
0.4593885, -0.4342254, 0.650663, 0.2196078, 0, 1, 1,
0.4603757, -0.6874861, 3.784209, 0.2235294, 0, 1, 1,
0.4625541, 1.784287, 0.7035419, 0.2313726, 0, 1, 1,
0.4658947, -2.322392, 4.259227, 0.2352941, 0, 1, 1,
0.4666606, -1.45109, 1.183695, 0.2431373, 0, 1, 1,
0.4673513, -1.420926, 3.330435, 0.2470588, 0, 1, 1,
0.4704145, 0.6884798, 1.264277, 0.254902, 0, 1, 1,
0.4716379, -0.3658927, 2.757048, 0.2588235, 0, 1, 1,
0.4786834, -0.5752964, 1.304086, 0.2666667, 0, 1, 1,
0.4789508, -0.2139754, 2.332821, 0.2705882, 0, 1, 1,
0.4797402, -1.52098, 3.60956, 0.2784314, 0, 1, 1,
0.4805575, -0.3956488, 2.534189, 0.282353, 0, 1, 1,
0.4818421, 0.1960163, 0.556456, 0.2901961, 0, 1, 1,
0.4845835, -1.359744, 2.689178, 0.2941177, 0, 1, 1,
0.4914935, -1.145186, 2.726655, 0.3019608, 0, 1, 1,
0.4933574, -0.2180729, 1.895279, 0.3098039, 0, 1, 1,
0.4982588, 1.325742, 0.7289026, 0.3137255, 0, 1, 1,
0.5037981, -0.1590925, 1.91718, 0.3215686, 0, 1, 1,
0.5053878, 0.4117182, 1.764551, 0.3254902, 0, 1, 1,
0.5086485, 0.8100619, 0.7793216, 0.3333333, 0, 1, 1,
0.5165141, 0.311448, -0.778461, 0.3372549, 0, 1, 1,
0.5173728, 0.1563672, -0.201414, 0.345098, 0, 1, 1,
0.5224084, 0.3093673, 1.850331, 0.3490196, 0, 1, 1,
0.5293157, 0.6967912, -1.781673, 0.3568628, 0, 1, 1,
0.5359019, -0.6212378, 2.650874, 0.3607843, 0, 1, 1,
0.5450943, -1.936692, 0.6768854, 0.3686275, 0, 1, 1,
0.5464219, 1.739621, -0.9662346, 0.372549, 0, 1, 1,
0.5489828, 0.5469379, -0.7556379, 0.3803922, 0, 1, 1,
0.5559121, 0.1206974, 1.80674, 0.3843137, 0, 1, 1,
0.5559707, 1.440451, -1.403688, 0.3921569, 0, 1, 1,
0.5572646, 0.5454657, 1.235868, 0.3960784, 0, 1, 1,
0.5579761, 0.5798935, 0.4820924, 0.4039216, 0, 1, 1,
0.5642315, 0.6563415, 0.4099409, 0.4117647, 0, 1, 1,
0.5643592, 0.6135654, 1.430211, 0.4156863, 0, 1, 1,
0.5675294, -2.12895, 2.471517, 0.4235294, 0, 1, 1,
0.5701736, -0.4545842, 2.387667, 0.427451, 0, 1, 1,
0.5708545, -1.466172, 3.888984, 0.4352941, 0, 1, 1,
0.5742553, 0.5592936, 2.01171, 0.4392157, 0, 1, 1,
0.5763918, 1.522355, 0.4722063, 0.4470588, 0, 1, 1,
0.5843083, 1.359516, 0.2261644, 0.4509804, 0, 1, 1,
0.5859305, -0.3768399, 3.212753, 0.4588235, 0, 1, 1,
0.5859817, -0.1178709, 2.001271, 0.4627451, 0, 1, 1,
0.586429, 2.040784, 1.602531, 0.4705882, 0, 1, 1,
0.5883002, -0.7056214, 2.637586, 0.4745098, 0, 1, 1,
0.590442, 1.711674, 0.6364903, 0.4823529, 0, 1, 1,
0.5917287, 0.04149789, 1.979785, 0.4862745, 0, 1, 1,
0.5940596, 0.1083198, 1.411755, 0.4941176, 0, 1, 1,
0.5960785, -0.3121852, 3.640695, 0.5019608, 0, 1, 1,
0.6007536, 0.1608905, 1.432974, 0.5058824, 0, 1, 1,
0.6010424, -0.7036045, 2.041923, 0.5137255, 0, 1, 1,
0.6031146, 0.7340771, 0.6077926, 0.5176471, 0, 1, 1,
0.6045034, 0.3861873, 0.5744746, 0.5254902, 0, 1, 1,
0.6090716, -0.05112248, 0.7681826, 0.5294118, 0, 1, 1,
0.6160459, -1.347895, 1.685262, 0.5372549, 0, 1, 1,
0.6184165, -0.800051, 3.072345, 0.5411765, 0, 1, 1,
0.6199808, 1.307349, 0.3747705, 0.5490196, 0, 1, 1,
0.623988, -0.1338589, 1.552844, 0.5529412, 0, 1, 1,
0.6240193, 2.39507, -0.2102058, 0.5607843, 0, 1, 1,
0.6256839, 1.284167, 1.017724, 0.5647059, 0, 1, 1,
0.6293015, -1.632499, 2.181195, 0.572549, 0, 1, 1,
0.6309476, 1.904303, 0.7713895, 0.5764706, 0, 1, 1,
0.6344523, -1.26842, 3.638924, 0.5843138, 0, 1, 1,
0.641688, -0.6948355, 2.787221, 0.5882353, 0, 1, 1,
0.6447613, -1.350038, 1.719715, 0.5960785, 0, 1, 1,
0.6457105, -0.3525645, 0.8503693, 0.6039216, 0, 1, 1,
0.6472549, 0.04526644, 0.7266002, 0.6078432, 0, 1, 1,
0.6499549, -0.001489982, 0.4489933, 0.6156863, 0, 1, 1,
0.6500984, -0.2615987, 2.228685, 0.6196079, 0, 1, 1,
0.6520922, 0.9101934, 0.3828112, 0.627451, 0, 1, 1,
0.657934, -0.5613019, 2.682455, 0.6313726, 0, 1, 1,
0.6589853, 0.9258015, 0.4119388, 0.6392157, 0, 1, 1,
0.6609592, -0.2389827, 3.426299, 0.6431373, 0, 1, 1,
0.6612498, 1.56575, 0.9375371, 0.6509804, 0, 1, 1,
0.6631457, -0.7391052, -0.6345332, 0.654902, 0, 1, 1,
0.6743428, 0.2432973, 1.241797, 0.6627451, 0, 1, 1,
0.6752768, 0.7377926, 0.8366079, 0.6666667, 0, 1, 1,
0.6915377, 1.679278, -0.3548577, 0.6745098, 0, 1, 1,
0.6930513, -0.6105951, 1.871865, 0.6784314, 0, 1, 1,
0.6936873, 1.327345, 0.7385835, 0.6862745, 0, 1, 1,
0.6951458, -0.5981023, 2.629679, 0.6901961, 0, 1, 1,
0.6975995, -0.552033, 2.86332, 0.6980392, 0, 1, 1,
0.6985829, -0.3519475, 2.971814, 0.7058824, 0, 1, 1,
0.7065738, 1.353392, -1.231942, 0.7098039, 0, 1, 1,
0.7092573, 0.7375479, 0.9123425, 0.7176471, 0, 1, 1,
0.7116614, -1.405092, 1.953051, 0.7215686, 0, 1, 1,
0.7119758, 0.2614683, 0.9564599, 0.7294118, 0, 1, 1,
0.7174419, 0.476444, 2.394546, 0.7333333, 0, 1, 1,
0.7217185, -0.8982017, 2.107185, 0.7411765, 0, 1, 1,
0.7228141, -0.759629, 2.57394, 0.7450981, 0, 1, 1,
0.7256925, 0.8718089, 0.6574497, 0.7529412, 0, 1, 1,
0.7320207, -0.1157379, 0.5640684, 0.7568628, 0, 1, 1,
0.7338244, 0.5325633, 1.176921, 0.7647059, 0, 1, 1,
0.7351809, -0.5620863, 4.131621, 0.7686275, 0, 1, 1,
0.7387258, 1.936977, 0.6860806, 0.7764706, 0, 1, 1,
0.7463613, 0.4943965, 1.945128, 0.7803922, 0, 1, 1,
0.7493611, -0.6030086, 3.358353, 0.7882353, 0, 1, 1,
0.7497107, 1.035932, 0.6289182, 0.7921569, 0, 1, 1,
0.7509018, 0.7720448, 1.113766, 0.8, 0, 1, 1,
0.7653045, 0.1918879, 1.184035, 0.8078431, 0, 1, 1,
0.7674042, -0.6823496, 3.821926, 0.8117647, 0, 1, 1,
0.7781271, -0.2445547, 2.112951, 0.8196079, 0, 1, 1,
0.7823034, -0.772329, 2.506006, 0.8235294, 0, 1, 1,
0.784432, -3.468586, 3.007798, 0.8313726, 0, 1, 1,
0.791211, -1.39731, 3.354227, 0.8352941, 0, 1, 1,
0.7935729, 1.049032, -1.137526, 0.8431373, 0, 1, 1,
0.7975312, -0.8954205, 2.741333, 0.8470588, 0, 1, 1,
0.8060548, -0.3706156, 0.9729092, 0.854902, 0, 1, 1,
0.8118943, -0.9809601, 2.542171, 0.8588235, 0, 1, 1,
0.8142213, -0.5628133, 2.339854, 0.8666667, 0, 1, 1,
0.814944, -0.8876854, 0.9914755, 0.8705882, 0, 1, 1,
0.8364718, 0.7655687, -0.7096779, 0.8784314, 0, 1, 1,
0.8412829, 0.697191, -0.03440316, 0.8823529, 0, 1, 1,
0.841979, 0.1118921, 1.146817, 0.8901961, 0, 1, 1,
0.8424228, 2.13572, 0.2943263, 0.8941177, 0, 1, 1,
0.8463033, -1.192569, 2.619767, 0.9019608, 0, 1, 1,
0.8522548, -0.03237443, 1.857693, 0.9098039, 0, 1, 1,
0.8615407, 0.3053215, 0.9289708, 0.9137255, 0, 1, 1,
0.8653841, 1.427134, 1.238304, 0.9215686, 0, 1, 1,
0.8712588, 0.0297301, 0.9542529, 0.9254902, 0, 1, 1,
0.8732689, -0.09966505, -0.348861, 0.9333333, 0, 1, 1,
0.8792459, -1.31898, 2.857909, 0.9372549, 0, 1, 1,
0.887015, 0.7573547, 4.444638, 0.945098, 0, 1, 1,
0.8912922, 0.5186537, -0.2866437, 0.9490196, 0, 1, 1,
0.8979635, 0.3212534, 0.7996868, 0.9568627, 0, 1, 1,
0.9005125, -2.366668, 4.019218, 0.9607843, 0, 1, 1,
0.9018311, -0.1398226, 1.309965, 0.9686275, 0, 1, 1,
0.9062695, 0.05536732, 0.7144856, 0.972549, 0, 1, 1,
0.9075335, -0.5391687, 1.252181, 0.9803922, 0, 1, 1,
0.9103776, -0.1087605, 0.7678522, 0.9843137, 0, 1, 1,
0.9107978, 1.39937, 0.3874746, 0.9921569, 0, 1, 1,
0.9146521, 1.241807, -1.334866, 0.9960784, 0, 1, 1,
0.9156845, -0.5601568, -0.6092688, 1, 0, 0.9960784, 1,
0.9166776, 0.1319945, -1.041535, 1, 0, 0.9882353, 1,
0.9176917, -1.951152, 2.443702, 1, 0, 0.9843137, 1,
0.9239015, -0.897874, 3.552966, 1, 0, 0.9764706, 1,
0.9265826, 0.4893436, 1.925364, 1, 0, 0.972549, 1,
0.9271889, -0.5539905, 1.673998, 1, 0, 0.9647059, 1,
0.9290034, 0.6569767, 1.258099, 1, 0, 0.9607843, 1,
0.9346253, 0.4156733, 1.968242, 1, 0, 0.9529412, 1,
0.9349473, -1.598849, 1.368938, 1, 0, 0.9490196, 1,
0.939981, 0.882257, -0.6751875, 1, 0, 0.9411765, 1,
0.9407991, 0.2195539, -0.01033716, 1, 0, 0.9372549, 1,
0.9467111, -1.142821, 3.443343, 1, 0, 0.9294118, 1,
0.95249, 0.2145417, 2.156175, 1, 0, 0.9254902, 1,
0.9542181, -1.406766, 1.260164, 1, 0, 0.9176471, 1,
0.9737232, 0.2819358, 2.134712, 1, 0, 0.9137255, 1,
0.9759007, 1.151393, 0.04535165, 1, 0, 0.9058824, 1,
0.9779623, -1.087384, 2.589901, 1, 0, 0.9019608, 1,
0.9872952, 0.1631964, 3.222335, 1, 0, 0.8941177, 1,
0.9916695, -0.7699768, 3.229917, 1, 0, 0.8862745, 1,
0.993049, 0.411918, 1.448308, 1, 0, 0.8823529, 1,
0.9984097, 1.562732, 2.062694, 1, 0, 0.8745098, 1,
1.001843, -0.7810137, 2.802278, 1, 0, 0.8705882, 1,
1.01442, 1.147189, -0.02604033, 1, 0, 0.8627451, 1,
1.017685, 0.1514778, 0.2334499, 1, 0, 0.8588235, 1,
1.021877, 0.5027879, 0.4001978, 1, 0, 0.8509804, 1,
1.022633, 1.41345, 1.596808, 1, 0, 0.8470588, 1,
1.033062, 0.2136622, 1.337564, 1, 0, 0.8392157, 1,
1.036964, -0.2033523, 0.8678472, 1, 0, 0.8352941, 1,
1.037343, -0.8794592, 2.689915, 1, 0, 0.827451, 1,
1.04093, 0.07989169, 2.532902, 1, 0, 0.8235294, 1,
1.041089, 0.2194451, 2.408425, 1, 0, 0.8156863, 1,
1.04543, -0.3550402, 0.8891741, 1, 0, 0.8117647, 1,
1.047416, -0.09293733, 1.913525, 1, 0, 0.8039216, 1,
1.053293, -0.5811195, 0.6891882, 1, 0, 0.7960784, 1,
1.054073, -0.1357737, 0.3774094, 1, 0, 0.7921569, 1,
1.056548, 0.1988073, -1.528868, 1, 0, 0.7843137, 1,
1.056736, 1.244007, 1.633735, 1, 0, 0.7803922, 1,
1.070014, -0.6208988, 2.530877, 1, 0, 0.772549, 1,
1.07484, 1.337682, 0.4259035, 1, 0, 0.7686275, 1,
1.076691, 0.4844956, 1.837635, 1, 0, 0.7607843, 1,
1.077228, -1.518106, 2.216421, 1, 0, 0.7568628, 1,
1.077914, 1.366023, -0.3868303, 1, 0, 0.7490196, 1,
1.084975, 1.04525, 3.157268, 1, 0, 0.7450981, 1,
1.089724, -2.234097, 4.028048, 1, 0, 0.7372549, 1,
1.096786, -0.4415412, 2.624612, 1, 0, 0.7333333, 1,
1.103226, -1.124666, 2.36742, 1, 0, 0.7254902, 1,
1.110229, -0.2949902, 0.4352655, 1, 0, 0.7215686, 1,
1.116094, 1.321702, 0.04789282, 1, 0, 0.7137255, 1,
1.124298, -0.8803226, 1.639472, 1, 0, 0.7098039, 1,
1.129517, 0.587853, -0.8168851, 1, 0, 0.7019608, 1,
1.135393, -1.033318, 2.730374, 1, 0, 0.6941177, 1,
1.155115, 0.1881821, 1.760753, 1, 0, 0.6901961, 1,
1.159156, 1.75108, 2.145022, 1, 0, 0.682353, 1,
1.165901, -1.326592, 2.191997, 1, 0, 0.6784314, 1,
1.198773, 0.7046204, 0.07558185, 1, 0, 0.6705883, 1,
1.205384, 0.7463863, 1.235963, 1, 0, 0.6666667, 1,
1.217579, 0.06447872, 1.737383, 1, 0, 0.6588235, 1,
1.218488, 1.550636, 3.195312, 1, 0, 0.654902, 1,
1.226579, 0.2374067, 2.73003, 1, 0, 0.6470588, 1,
1.227341, -0.7091375, 2.813379, 1, 0, 0.6431373, 1,
1.22747, -1.037254, 3.288474, 1, 0, 0.6352941, 1,
1.237863, 0.06114137, 1.21013, 1, 0, 0.6313726, 1,
1.253035, 2.397313, -0.5329577, 1, 0, 0.6235294, 1,
1.256397, 0.2599228, 0.5131258, 1, 0, 0.6196079, 1,
1.258382, -1.86094, 3.020221, 1, 0, 0.6117647, 1,
1.262735, 0.8578752, -0.7530922, 1, 0, 0.6078432, 1,
1.265154, 1.048588, 0.906803, 1, 0, 0.6, 1,
1.265698, -0.3666573, 2.634495, 1, 0, 0.5921569, 1,
1.266706, 0.2785577, 2.187249, 1, 0, 0.5882353, 1,
1.27402, -0.1092111, 2.469507, 1, 0, 0.5803922, 1,
1.275997, 0.03952615, 2.95222, 1, 0, 0.5764706, 1,
1.282279, 0.4850146, -1.593212, 1, 0, 0.5686275, 1,
1.290715, -1.360073, 2.308202, 1, 0, 0.5647059, 1,
1.299094, 2.118097, 1.144929, 1, 0, 0.5568628, 1,
1.299989, 1.491603, 0.4100185, 1, 0, 0.5529412, 1,
1.302767, -0.6480531, 1.40904, 1, 0, 0.5450981, 1,
1.307894, -0.9118638, 2.901012, 1, 0, 0.5411765, 1,
1.308639, -0.3404348, 1.102692, 1, 0, 0.5333334, 1,
1.31825, -0.2184268, 3.546777, 1, 0, 0.5294118, 1,
1.329401, 1.151419, 0.553395, 1, 0, 0.5215687, 1,
1.333875, 0.4338526, 1.885673, 1, 0, 0.5176471, 1,
1.33587, -0.2336711, 0.9933258, 1, 0, 0.509804, 1,
1.342459, -1.12178, 1.736379, 1, 0, 0.5058824, 1,
1.353449, 1.277425, 1.472942, 1, 0, 0.4980392, 1,
1.381681, 1.209823, -0.8480175, 1, 0, 0.4901961, 1,
1.385967, -0.4199725, 2.177569, 1, 0, 0.4862745, 1,
1.403303, 3.156858, 2.378365, 1, 0, 0.4784314, 1,
1.407083, 1.169117, -0.08437527, 1, 0, 0.4745098, 1,
1.411008, -0.08627001, 2.439194, 1, 0, 0.4666667, 1,
1.41128, 1.690529, -0.2966218, 1, 0, 0.4627451, 1,
1.43396, 0.0498693, 3.021549, 1, 0, 0.454902, 1,
1.434025, -1.686999, 2.591263, 1, 0, 0.4509804, 1,
1.456586, -1.319897, 3.953469, 1, 0, 0.4431373, 1,
1.457032, 0.3785, 0.4535915, 1, 0, 0.4392157, 1,
1.465814, -0.809388, 2.070955, 1, 0, 0.4313726, 1,
1.471315, 0.08093643, 2.495179, 1, 0, 0.427451, 1,
1.477749, 0.1961993, 1.354426, 1, 0, 0.4196078, 1,
1.507262, -0.6602289, 0.6872526, 1, 0, 0.4156863, 1,
1.514904, 0.3016656, 1.364637, 1, 0, 0.4078431, 1,
1.516102, 0.2901351, 1.879233, 1, 0, 0.4039216, 1,
1.53151, 0.8303351, 0.8032427, 1, 0, 0.3960784, 1,
1.545287, 0.08879774, 1.109066, 1, 0, 0.3882353, 1,
1.545691, -1.151526, 3.687596, 1, 0, 0.3843137, 1,
1.558333, -0.3780212, 2.298644, 1, 0, 0.3764706, 1,
1.563642, 0.07481182, 0.8690163, 1, 0, 0.372549, 1,
1.567387, -0.9686662, 3.160038, 1, 0, 0.3647059, 1,
1.568728, 0.8849491, 2.244632, 1, 0, 0.3607843, 1,
1.579793, 1.381201, -0.1097537, 1, 0, 0.3529412, 1,
1.585799, -1.762891, 3.033455, 1, 0, 0.3490196, 1,
1.59493, 0.6665973, 1.457101, 1, 0, 0.3411765, 1,
1.603189, 0.508983, 1.810267, 1, 0, 0.3372549, 1,
1.604933, 0.1535719, -0.6149697, 1, 0, 0.3294118, 1,
1.60747, -1.14484, 1.974164, 1, 0, 0.3254902, 1,
1.614765, 0.2921237, 0.8882131, 1, 0, 0.3176471, 1,
1.629365, -0.9040914, 2.493126, 1, 0, 0.3137255, 1,
1.630271, -0.6470366, 2.977498, 1, 0, 0.3058824, 1,
1.651865, -0.3156916, 1.48727, 1, 0, 0.2980392, 1,
1.651956, -0.0414748, 2.566556, 1, 0, 0.2941177, 1,
1.677498, 0.5116524, 1.26555, 1, 0, 0.2862745, 1,
1.678747, 1.414438, -0.8733616, 1, 0, 0.282353, 1,
1.67948, -0.9720457, 2.654832, 1, 0, 0.2745098, 1,
1.699419, 0.3864387, 1.417102, 1, 0, 0.2705882, 1,
1.733628, 0.4915026, -0.4790943, 1, 0, 0.2627451, 1,
1.733657, 0.6193643, 0.9105478, 1, 0, 0.2588235, 1,
1.759994, 1.322929, 0.9038032, 1, 0, 0.2509804, 1,
1.798063, -0.1396186, 0.8826844, 1, 0, 0.2470588, 1,
1.801223, -0.05700051, 0.3909085, 1, 0, 0.2392157, 1,
1.810124, 0.2217235, -0.1105538, 1, 0, 0.2352941, 1,
1.810355, -0.3025924, 0.5014697, 1, 0, 0.227451, 1,
1.822677, -0.6806937, 2.872301, 1, 0, 0.2235294, 1,
1.868561, 0.03724478, 1.821257, 1, 0, 0.2156863, 1,
1.893475, 0.3289096, 0.05716406, 1, 0, 0.2117647, 1,
1.897345, 0.9685785, 1.103764, 1, 0, 0.2039216, 1,
1.924948, 0.5037938, 1.632815, 1, 0, 0.1960784, 1,
1.934246, -0.2362956, 2.316498, 1, 0, 0.1921569, 1,
1.939772, -0.2047678, 3.134869, 1, 0, 0.1843137, 1,
1.949601, -0.5784035, 1.597596, 1, 0, 0.1803922, 1,
1.952463, -0.7432737, 2.902028, 1, 0, 0.172549, 1,
1.958647, 0.9478843, 1.739472, 1, 0, 0.1686275, 1,
1.990769, 0.3107043, 0.7091265, 1, 0, 0.1607843, 1,
2.006782, -0.7637895, 1.927363, 1, 0, 0.1568628, 1,
2.010616, -0.02043326, -0.4710228, 1, 0, 0.1490196, 1,
2.018888, 0.09326732, 3.099076, 1, 0, 0.145098, 1,
2.022924, -0.4331735, 0.4699925, 1, 0, 0.1372549, 1,
2.028167, -1.022146, 2.414433, 1, 0, 0.1333333, 1,
2.030613, -2.212054, 1.991315, 1, 0, 0.1254902, 1,
2.056334, -0.170131, 1.191491, 1, 0, 0.1215686, 1,
2.080953, 0.8283852, 2.764327, 1, 0, 0.1137255, 1,
2.081256, 0.1802526, 1.038093, 1, 0, 0.1098039, 1,
2.161097, -1.017223, 1.31037, 1, 0, 0.1019608, 1,
2.163709, 0.4340295, 1.2955, 1, 0, 0.09411765, 1,
2.170854, -0.8294652, 2.218704, 1, 0, 0.09019608, 1,
2.185961, 0.7700961, -0.2098778, 1, 0, 0.08235294, 1,
2.209862, 0.3892028, 0.914719, 1, 0, 0.07843138, 1,
2.238109, -1.219894, 1.857747, 1, 0, 0.07058824, 1,
2.239281, -0.7403113, 4.063411, 1, 0, 0.06666667, 1,
2.253281, 0.06790861, 0.4420112, 1, 0, 0.05882353, 1,
2.297074, -0.2764962, 0.7206665, 1, 0, 0.05490196, 1,
2.352036, 2.43982, 1.182928, 1, 0, 0.04705882, 1,
2.41749, 1.671625, 0.4007033, 1, 0, 0.04313726, 1,
2.43496, -0.3441944, 2.50188, 1, 0, 0.03529412, 1,
2.550317, -0.5920601, 1.531796, 1, 0, 0.03137255, 1,
2.564517, 1.308834, -1.686035, 1, 0, 0.02352941, 1,
2.625222, -0.5399215, 2.437074, 1, 0, 0.01960784, 1,
2.672002, 0.2501002, 2.72057, 1, 0, 0.01176471, 1,
2.798327, -1.039524, 3.502245, 1, 0, 0.007843138, 1
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
-0.4691423, -4.591599, -7.900529, 0, -0.5, 0.5, 0.5,
-0.4691423, -4.591599, -7.900529, 1, -0.5, 0.5, 0.5,
-0.4691423, -4.591599, -7.900529, 1, 1.5, 0.5, 0.5,
-0.4691423, -4.591599, -7.900529, 0, 1.5, 0.5, 0.5
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
-4.844284, -0.1558641, -7.900529, 0, -0.5, 0.5, 0.5,
-4.844284, -0.1558641, -7.900529, 1, -0.5, 0.5, 0.5,
-4.844284, -0.1558641, -7.900529, 1, 1.5, 0.5, 0.5,
-4.844284, -0.1558641, -7.900529, 0, 1.5, 0.5, 0.5
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
-4.844284, -4.591599, -0.1578043, 0, -0.5, 0.5, 0.5,
-4.844284, -4.591599, -0.1578043, 1, -0.5, 0.5, 0.5,
-4.844284, -4.591599, -0.1578043, 1, 1.5, 0.5, 0.5,
-4.844284, -4.591599, -0.1578043, 0, 1.5, 0.5, 0.5
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
-3, -3.567968, -6.113746,
2, -3.567968, -6.113746,
-3, -3.567968, -6.113746,
-3, -3.738573, -6.411543,
-2, -3.567968, -6.113746,
-2, -3.738573, -6.411543,
-1, -3.567968, -6.113746,
-1, -3.738573, -6.411543,
0, -3.567968, -6.113746,
0, -3.738573, -6.411543,
1, -3.567968, -6.113746,
1, -3.738573, -6.411543,
2, -3.567968, -6.113746,
2, -3.738573, -6.411543
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
-3, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
-3, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
-3, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
-3, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5,
-2, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
-2, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
-2, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
-2, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5,
-1, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
-1, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
-1, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
-1, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5,
0, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
0, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
0, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
0, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5,
1, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
1, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
1, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
1, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5,
2, -4.079783, -7.007138, 0, -0.5, 0.5, 0.5,
2, -4.079783, -7.007138, 1, -0.5, 0.5, 0.5,
2, -4.079783, -7.007138, 1, 1.5, 0.5, 0.5,
2, -4.079783, -7.007138, 0, 1.5, 0.5, 0.5
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
-3.834636, -3, -6.113746,
-3.834636, 3, -6.113746,
-3.834636, -3, -6.113746,
-4.00291, -3, -6.411543,
-3.834636, -2, -6.113746,
-4.00291, -2, -6.411543,
-3.834636, -1, -6.113746,
-4.00291, -1, -6.411543,
-3.834636, 0, -6.113746,
-4.00291, 0, -6.411543,
-3.834636, 1, -6.113746,
-4.00291, 1, -6.411543,
-3.834636, 2, -6.113746,
-4.00291, 2, -6.411543,
-3.834636, 3, -6.113746,
-4.00291, 3, -6.411543
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
-4.33946, -3, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, -3, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, -3, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, -3, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, -2, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, -2, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, -2, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, -2, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, -1, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, -1, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, -1, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, -1, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, 0, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, 0, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, 0, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, 0, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, 1, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, 1, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, 1, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, 1, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, 2, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, 2, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, 2, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, 2, -7.007138, 0, 1.5, 0.5, 0.5,
-4.33946, 3, -7.007138, 0, -0.5, 0.5, 0.5,
-4.33946, 3, -7.007138, 1, -0.5, 0.5, 0.5,
-4.33946, 3, -7.007138, 1, 1.5, 0.5, 0.5,
-4.33946, 3, -7.007138, 0, 1.5, 0.5, 0.5
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
-3.834636, -3.567968, -4,
-3.834636, -3.567968, 4,
-3.834636, -3.567968, -4,
-4.00291, -3.738573, -4,
-3.834636, -3.567968, -2,
-4.00291, -3.738573, -2,
-3.834636, -3.567968, 0,
-4.00291, -3.738573, 0,
-3.834636, -3.567968, 2,
-4.00291, -3.738573, 2,
-3.834636, -3.567968, 4,
-4.00291, -3.738573, 4
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
-4.33946, -4.079783, -4, 0, -0.5, 0.5, 0.5,
-4.33946, -4.079783, -4, 1, -0.5, 0.5, 0.5,
-4.33946, -4.079783, -4, 1, 1.5, 0.5, 0.5,
-4.33946, -4.079783, -4, 0, 1.5, 0.5, 0.5,
-4.33946, -4.079783, -2, 0, -0.5, 0.5, 0.5,
-4.33946, -4.079783, -2, 1, -0.5, 0.5, 0.5,
-4.33946, -4.079783, -2, 1, 1.5, 0.5, 0.5,
-4.33946, -4.079783, -2, 0, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 0, 0, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 0, 1, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 0, 1, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 0, 0, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 2, 0, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 2, 1, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 2, 1, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 2, 0, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 4, 0, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 4, 1, -0.5, 0.5, 0.5,
-4.33946, -4.079783, 4, 1, 1.5, 0.5, 0.5,
-4.33946, -4.079783, 4, 0, 1.5, 0.5, 0.5
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
-3.834636, -3.567968, -6.113746,
-3.834636, 3.25624, -6.113746,
-3.834636, -3.567968, 5.798138,
-3.834636, 3.25624, 5.798138,
-3.834636, -3.567968, -6.113746,
-3.834636, -3.567968, 5.798138,
-3.834636, 3.25624, -6.113746,
-3.834636, 3.25624, 5.798138,
-3.834636, -3.567968, -6.113746,
2.896351, -3.567968, -6.113746,
-3.834636, -3.567968, 5.798138,
2.896351, -3.567968, 5.798138,
-3.834636, 3.25624, -6.113746,
2.896351, 3.25624, -6.113746,
-3.834636, 3.25624, 5.798138,
2.896351, 3.25624, 5.798138,
2.896351, -3.567968, -6.113746,
2.896351, 3.25624, -6.113746,
2.896351, -3.567968, 5.798138,
2.896351, 3.25624, 5.798138,
2.896351, -3.567968, -6.113746,
2.896351, -3.567968, 5.798138,
2.896351, 3.25624, -6.113746,
2.896351, 3.25624, 5.798138
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
var radius = 8.164299;
var distance = 36.32389;
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
mvMatrix.translate( 0.4691423, 0.1558641, 0.1578043 );
mvMatrix.scale( 1.311457, 1.293542, 0.7410582 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.32389);
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
3-chlorophenylhydraz<-read.table("3-chlorophenylhydraz.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-chlorophenylhydraz$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenylhydraz' not found
```

```r
y<-3-chlorophenylhydraz$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenylhydraz' not found
```

```r
z<-3-chlorophenylhydraz$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenylhydraz' not found
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
-3.736612, 1.096083, -0.5094727, 0, 0, 1, 1, 1,
-2.809127, -0.4890335, -1.459934, 1, 0, 0, 1, 1,
-2.779161, 0.3474298, -1.054559, 1, 0, 0, 1, 1,
-2.656443, 0.3587268, -1.242777, 1, 0, 0, 1, 1,
-2.58533, -0.1499559, -1.106267, 1, 0, 0, 1, 1,
-2.514162, 0.9624521, -1.411959, 1, 0, 0, 1, 1,
-2.372506, 1.752656, -0.5669175, 0, 0, 0, 1, 1,
-2.215631, -1.098269, -3.253166, 0, 0, 0, 1, 1,
-2.189484, 0.7823683, -1.950881, 0, 0, 0, 1, 1,
-2.092273, -0.5288751, -2.610816, 0, 0, 0, 1, 1,
-2.09193, 0.09019326, -1.417798, 0, 0, 0, 1, 1,
-2.089374, 0.2869355, -1.248167, 0, 0, 0, 1, 1,
-2.073182, -0.6530161, -1.88527, 0, 0, 0, 1, 1,
-2.058213, -1.241064, -2.201059, 1, 1, 1, 1, 1,
-2.04275, -1.49241, -2.026426, 1, 1, 1, 1, 1,
-2.031487, 1.605521, -0.5736993, 1, 1, 1, 1, 1,
-2.027965, 0.3727948, -0.9067519, 1, 1, 1, 1, 1,
-2.027922, -0.153268, -2.862225, 1, 1, 1, 1, 1,
-2.01266, -0.4915538, -2.239572, 1, 1, 1, 1, 1,
-2.00852, -0.08700643, -2.675608, 1, 1, 1, 1, 1,
-2.007304, -1.853826, -2.510924, 1, 1, 1, 1, 1,
-1.99062, -0.1880814, -0.4476858, 1, 1, 1, 1, 1,
-1.960659, -1.196858, -3.467772, 1, 1, 1, 1, 1,
-1.914856, 0.7428491, -0.4503292, 1, 1, 1, 1, 1,
-1.893786, 1.055558, -1.021176, 1, 1, 1, 1, 1,
-1.874443, 1.715821, 0.1285479, 1, 1, 1, 1, 1,
-1.872606, -0.6538569, -2.851897, 1, 1, 1, 1, 1,
-1.867012, 0.2613056, -1.517948, 1, 1, 1, 1, 1,
-1.861102, 0.3905087, -1.85573, 0, 0, 1, 1, 1,
-1.826289, 0.1566214, -2.845087, 1, 0, 0, 1, 1,
-1.820807, -0.8275121, -2.547767, 1, 0, 0, 1, 1,
-1.816719, -1.997578, -3.101595, 1, 0, 0, 1, 1,
-1.80674, 0.9024559, -2.277861, 1, 0, 0, 1, 1,
-1.7793, -0.7443198, -0.4196435, 1, 0, 0, 1, 1,
-1.756201, 0.1873988, -3.10311, 0, 0, 0, 1, 1,
-1.753238, 1.101443, 1.056144, 0, 0, 0, 1, 1,
-1.749835, 1.179524, 1.166852, 0, 0, 0, 1, 1,
-1.747312, -1.142464, -2.382224, 0, 0, 0, 1, 1,
-1.719933, 0.2553101, -2.047883, 0, 0, 0, 1, 1,
-1.696586, 0.5319201, -1.199123, 0, 0, 0, 1, 1,
-1.690725, 0.4430214, -2.794944, 0, 0, 0, 1, 1,
-1.685965, 0.6172356, -1.931269, 1, 1, 1, 1, 1,
-1.652539, 0.1452673, -2.431632, 1, 1, 1, 1, 1,
-1.64157, 0.0187364, -0.2209478, 1, 1, 1, 1, 1,
-1.640717, -0.8879102, -2.133092, 1, 1, 1, 1, 1,
-1.631402, 0.2271188, 0.008586352, 1, 1, 1, 1, 1,
-1.62358, 0.5077444, -0.6318044, 1, 1, 1, 1, 1,
-1.60489, -0.4401276, -2.016431, 1, 1, 1, 1, 1,
-1.598187, 0.8309029, -1.524625, 1, 1, 1, 1, 1,
-1.596782, -0.7188904, -0.4265137, 1, 1, 1, 1, 1,
-1.58289, 1.144418, -0.1724257, 1, 1, 1, 1, 1,
-1.566467, 1.384513, -1.742039, 1, 1, 1, 1, 1,
-1.5609, -1.291969, -0.5255049, 1, 1, 1, 1, 1,
-1.555461, -2.220838, -3.140418, 1, 1, 1, 1, 1,
-1.550451, 1.095867, -0.9211588, 1, 1, 1, 1, 1,
-1.549266, 0.2709869, -1.288108, 1, 1, 1, 1, 1,
-1.545583, -1.523022, -0.9730254, 0, 0, 1, 1, 1,
-1.531886, 0.2234851, -0.7092678, 1, 0, 0, 1, 1,
-1.518645, 0.2229681, -1.044357, 1, 0, 0, 1, 1,
-1.511103, 0.5406401, -2.598445, 1, 0, 0, 1, 1,
-1.509769, 1.368336, -1.136142, 1, 0, 0, 1, 1,
-1.509695, -0.3125204, -2.091532, 1, 0, 0, 1, 1,
-1.504779, 0.4521681, -1.392875, 0, 0, 0, 1, 1,
-1.496287, 1.613923, -1.553142, 0, 0, 0, 1, 1,
-1.484891, -0.5202625, -3.05068, 0, 0, 0, 1, 1,
-1.465876, 0.8559793, 0.4314777, 0, 0, 0, 1, 1,
-1.445456, 0.183078, -1.466457, 0, 0, 0, 1, 1,
-1.436177, -0.5526664, -1.886967, 0, 0, 0, 1, 1,
-1.42896, 1.124947, -0.8071554, 0, 0, 0, 1, 1,
-1.425197, 1.11722, -1.779594, 1, 1, 1, 1, 1,
-1.417329, 1.062609, -2.151155, 1, 1, 1, 1, 1,
-1.414892, -1.179787, -3.880986, 1, 1, 1, 1, 1,
-1.414187, -0.3744161, 0.06606453, 1, 1, 1, 1, 1,
-1.39948, -0.8901791, -0.3151189, 1, 1, 1, 1, 1,
-1.370251, 1.863124, 1.343515, 1, 1, 1, 1, 1,
-1.365427, -0.03379259, -0.8745956, 1, 1, 1, 1, 1,
-1.365126, -1.559306, -1.580391, 1, 1, 1, 1, 1,
-1.356771, 1.805965, -0.609259, 1, 1, 1, 1, 1,
-1.350725, 0.5510828, -1.789825, 1, 1, 1, 1, 1,
-1.345272, 0.7484843, -0.559248, 1, 1, 1, 1, 1,
-1.337704, 1.181084, 0.5925145, 1, 1, 1, 1, 1,
-1.328919, -1.019742, -1.618195, 1, 1, 1, 1, 1,
-1.32878, 0.205296, -1.895682, 1, 1, 1, 1, 1,
-1.328586, 1.171833, -0.2440703, 1, 1, 1, 1, 1,
-1.327905, 1.602737, -0.4629706, 0, 0, 1, 1, 1,
-1.32689, -1.409166, -2.064024, 1, 0, 0, 1, 1,
-1.326462, -1.857059, -0.5952833, 1, 0, 0, 1, 1,
-1.323627, 2.054817, -1.111249, 1, 0, 0, 1, 1,
-1.321413, -2.404964, -3.334685, 1, 0, 0, 1, 1,
-1.319412, -1.179977, -1.150036, 1, 0, 0, 1, 1,
-1.316468, 0.8471748, 1.213017, 0, 0, 0, 1, 1,
-1.310814, 0.963883, -0.2451557, 0, 0, 0, 1, 1,
-1.309432, 0.1672494, -2.411625, 0, 0, 0, 1, 1,
-1.290182, -0.05140676, -1.621416, 0, 0, 0, 1, 1,
-1.287901, -0.07898071, -0.3233284, 0, 0, 0, 1, 1,
-1.285205, 2.126704, -0.7395265, 0, 0, 0, 1, 1,
-1.278113, 0.2745219, -1.626282, 0, 0, 0, 1, 1,
-1.277282, -0.6707883, -0.7032877, 1, 1, 1, 1, 1,
-1.275883, 1.113557, -1.535867, 1, 1, 1, 1, 1,
-1.26629, -0.2287464, -1.758002, 1, 1, 1, 1, 1,
-1.263656, -1.160114, -1.812284, 1, 1, 1, 1, 1,
-1.263083, 1.024365, -0.1296155, 1, 1, 1, 1, 1,
-1.258057, -0.4613353, -0.3927893, 1, 1, 1, 1, 1,
-1.24581, 0.8872117, -2.100202, 1, 1, 1, 1, 1,
-1.242684, 0.6362907, 0.6984686, 1, 1, 1, 1, 1,
-1.241622, 0.1734663, -1.810203, 1, 1, 1, 1, 1,
-1.234259, -1.187837, -3.436015, 1, 1, 1, 1, 1,
-1.230533, -0.9770073, -1.637592, 1, 1, 1, 1, 1,
-1.223121, 2.212091, -1.833346, 1, 1, 1, 1, 1,
-1.21686, -0.671608, -1.397161, 1, 1, 1, 1, 1,
-1.210586, -0.4232364, -2.108612, 1, 1, 1, 1, 1,
-1.181409, -0.90495, -2.006646, 1, 1, 1, 1, 1,
-1.177814, -0.4033048, -1.90474, 0, 0, 1, 1, 1,
-1.17239, -0.9425914, -2.11021, 1, 0, 0, 1, 1,
-1.168381, 0.8048885, -1.686128, 1, 0, 0, 1, 1,
-1.167014, 0.07100773, -0.9551154, 1, 0, 0, 1, 1,
-1.162003, 0.84649, -3.740073, 1, 0, 0, 1, 1,
-1.160321, -0.95196, -4.036994, 1, 0, 0, 1, 1,
-1.147154, 0.4416118, -0.8888193, 0, 0, 0, 1, 1,
-1.145806, -1.086509, -3.276281, 0, 0, 0, 1, 1,
-1.14339, -0.7588235, -2.022773, 0, 0, 0, 1, 1,
-1.14159, -0.04666764, -1.78422, 0, 0, 0, 1, 1,
-1.134254, -0.1527794, -2.617618, 0, 0, 0, 1, 1,
-1.134104, -0.2337706, -2.847192, 0, 0, 0, 1, 1,
-1.133716, 2.335095, 1.040527, 0, 0, 0, 1, 1,
-1.124212, 1.042227, 0.4778931, 1, 1, 1, 1, 1,
-1.120598, 0.1280649, -1.624675, 1, 1, 1, 1, 1,
-1.118901, -1.672127, -2.010207, 1, 1, 1, 1, 1,
-1.117607, -0.7928816, -1.843843, 1, 1, 1, 1, 1,
-1.116689, -0.1816403, 0.6519129, 1, 1, 1, 1, 1,
-1.113808, -0.9944311, -3.099536, 1, 1, 1, 1, 1,
-1.110611, 1.258345, 0.2742484, 1, 1, 1, 1, 1,
-1.1088, -0.3814744, -2.267009, 1, 1, 1, 1, 1,
-1.102038, -0.1907602, -1.726276, 1, 1, 1, 1, 1,
-1.101876, 0.6417834, -1.603441, 1, 1, 1, 1, 1,
-1.093464, 1.607893, -1.265788, 1, 1, 1, 1, 1,
-1.08909, 1.303402, -1.055102, 1, 1, 1, 1, 1,
-1.089035, -1.691927, -3.039454, 1, 1, 1, 1, 1,
-1.08798, 1.654472, -0.4946275, 1, 1, 1, 1, 1,
-1.081255, 1.357589, -0.1334747, 1, 1, 1, 1, 1,
-1.076873, 1.330836, -0.9364442, 0, 0, 1, 1, 1,
-1.054556, -0.4614858, -3.17842, 1, 0, 0, 1, 1,
-1.052281, 0.8602568, -2.895548, 1, 0, 0, 1, 1,
-1.046414, -0.703182, -3.051065, 1, 0, 0, 1, 1,
-1.044055, -0.4586623, -1.50396, 1, 0, 0, 1, 1,
-1.041172, 0.5153868, -0.7921643, 1, 0, 0, 1, 1,
-1.036899, 0.1743129, -2.812703, 0, 0, 0, 1, 1,
-1.036659, 0.3062098, -0.4151188, 0, 0, 0, 1, 1,
-1.028588, 0.03448079, -0.6896198, 0, 0, 0, 1, 1,
-1.012401, 0.163046, -2.842536, 0, 0, 0, 1, 1,
-1.010537, -0.02912937, -1.737478, 0, 0, 0, 1, 1,
-1.002929, 0.6048526, -2.503554, 0, 0, 0, 1, 1,
-1.002865, -0.3351602, -1.46065, 0, 0, 0, 1, 1,
-1.001181, 0.02173901, -1.28942, 1, 1, 1, 1, 1,
-0.9984198, 0.4386843, -1.686525, 1, 1, 1, 1, 1,
-0.9940158, -1.723954, -2.721549, 1, 1, 1, 1, 1,
-0.9897304, -1.500366, -1.387455, 1, 1, 1, 1, 1,
-0.984212, 0.06747391, -0.5708393, 1, 1, 1, 1, 1,
-0.9831418, -0.7098478, -1.508766, 1, 1, 1, 1, 1,
-0.9751521, 1.023608, -0.2445345, 1, 1, 1, 1, 1,
-0.9724689, -0.005388162, -1.359704, 1, 1, 1, 1, 1,
-0.9693421, 1.729216, -0.558014, 1, 1, 1, 1, 1,
-0.9669449, 2.168435, 0.8992761, 1, 1, 1, 1, 1,
-0.9642539, -0.4796376, -2.616153, 1, 1, 1, 1, 1,
-0.9638897, -1.7882, -3.544202, 1, 1, 1, 1, 1,
-0.9623444, 1.989372, 0.1861746, 1, 1, 1, 1, 1,
-0.9513322, -1.1135, -1.820258, 1, 1, 1, 1, 1,
-0.951263, 2.375077, -0.2006793, 1, 1, 1, 1, 1,
-0.9509546, 0.5101722, -0.4782992, 0, 0, 1, 1, 1,
-0.9498253, 0.4742425, -1.133548, 1, 0, 0, 1, 1,
-0.948274, 0.9192254, -1.379018, 1, 0, 0, 1, 1,
-0.9460126, 1.057192, -0.3862883, 1, 0, 0, 1, 1,
-0.942939, 1.024566, -0.0159401, 1, 0, 0, 1, 1,
-0.9423265, 0.1205668, -1.226977, 1, 0, 0, 1, 1,
-0.9363613, 0.8485712, -0.5289342, 0, 0, 0, 1, 1,
-0.9337009, -0.412156, -1.495233, 0, 0, 0, 1, 1,
-0.9320803, 1.693484, -1.749505, 0, 0, 0, 1, 1,
-0.9236001, -1.816234, -2.499053, 0, 0, 0, 1, 1,
-0.920589, 1.079442, -1.094943, 0, 0, 0, 1, 1,
-0.9150404, -1.199267, -1.314011, 0, 0, 0, 1, 1,
-0.914158, 0.2945003, -2.690269, 0, 0, 0, 1, 1,
-0.9032427, -0.8483832, -1.469647, 1, 1, 1, 1, 1,
-0.8989674, -0.4199125, -3.017726, 1, 1, 1, 1, 1,
-0.8982806, 0.1036978, -0.7176725, 1, 1, 1, 1, 1,
-0.8976232, -1.666803, -3.532856, 1, 1, 1, 1, 1,
-0.8909344, 0.5819906, -0.6514281, 1, 1, 1, 1, 1,
-0.8892103, -1.003816, -3.024174, 1, 1, 1, 1, 1,
-0.8767664, 1.30163, -1.814253, 1, 1, 1, 1, 1,
-0.8723511, 0.3635059, -0.6338331, 1, 1, 1, 1, 1,
-0.8688121, 0.4811153, -0.5708214, 1, 1, 1, 1, 1,
-0.8683455, 0.141681, -2.157691, 1, 1, 1, 1, 1,
-0.8678119, -0.3047398, -2.355672, 1, 1, 1, 1, 1,
-0.8659589, -0.5314336, -2.185989, 1, 1, 1, 1, 1,
-0.8658744, 0.6789619, -3.138551, 1, 1, 1, 1, 1,
-0.864148, -0.4874256, -1.835863, 1, 1, 1, 1, 1,
-0.8635302, -0.6524043, -1.956952, 1, 1, 1, 1, 1,
-0.8602868, -0.2958089, -3.05677, 0, 0, 1, 1, 1,
-0.8567868, 0.5319856, -0.3074968, 1, 0, 0, 1, 1,
-0.8540111, -0.6072432, -2.813228, 1, 0, 0, 1, 1,
-0.8502248, 0.0106278, -1.208205, 1, 0, 0, 1, 1,
-0.8477018, -0.1288961, -1.346404, 1, 0, 0, 1, 1,
-0.8475131, -1.683673, -0.9448999, 1, 0, 0, 1, 1,
-0.8454878, -0.995227, -1.96594, 0, 0, 0, 1, 1,
-0.8432264, -0.7781888, -3.653579, 0, 0, 0, 1, 1,
-0.8429018, 1.934704, 0.6520355, 0, 0, 0, 1, 1,
-0.8389021, 0.5505311, -0.8737645, 0, 0, 0, 1, 1,
-0.8286674, 2.338599, -0.1058714, 0, 0, 0, 1, 1,
-0.8263058, -0.7975561, -4.207241, 0, 0, 0, 1, 1,
-0.8254997, 1.070584, -1.332826, 0, 0, 0, 1, 1,
-0.824442, -0.5986989, -2.542296, 1, 1, 1, 1, 1,
-0.8224921, 0.9030173, -1.8473, 1, 1, 1, 1, 1,
-0.8216531, 0.2924311, -1.96345, 1, 1, 1, 1, 1,
-0.8205938, 0.9571349, 0.8534471, 1, 1, 1, 1, 1,
-0.8205903, 1.066748, -0.301785, 1, 1, 1, 1, 1,
-0.8159247, 0.7149977, -2.082007, 1, 1, 1, 1, 1,
-0.8070834, 1.110349, -1.805851, 1, 1, 1, 1, 1,
-0.8054453, -0.9814239, -1.940993, 1, 1, 1, 1, 1,
-0.8017312, 1.125027, -1.444305, 1, 1, 1, 1, 1,
-0.8005773, -0.7790759, -1.651016, 1, 1, 1, 1, 1,
-0.7984785, -1.062281, -3.027706, 1, 1, 1, 1, 1,
-0.7873369, -0.4871298, -2.805566, 1, 1, 1, 1, 1,
-0.7867332, 2.41815, -0.9130217, 1, 1, 1, 1, 1,
-0.7856001, 0.8369051, -1.514353, 1, 1, 1, 1, 1,
-0.7847614, -1.576072, -2.51302, 1, 1, 1, 1, 1,
-0.7799674, 0.1698938, 0.2957457, 0, 0, 1, 1, 1,
-0.7798129, -0.0522422, -0.5943877, 1, 0, 0, 1, 1,
-0.77799, 1.235687, -1.378614, 1, 0, 0, 1, 1,
-0.7758443, -0.5335892, -2.972952, 1, 0, 0, 1, 1,
-0.7755963, -0.8814301, -1.545281, 1, 0, 0, 1, 1,
-0.7732353, -0.4353839, -3.1938, 1, 0, 0, 1, 1,
-0.7723854, 1.374238, 0.09502305, 0, 0, 0, 1, 1,
-0.7699232, -0.4316801, -2.057662, 0, 0, 0, 1, 1,
-0.7688505, 1.547338, 0.9304029, 0, 0, 0, 1, 1,
-0.7687226, 0.007456022, -3.228834, 0, 0, 0, 1, 1,
-0.7660596, 2.193362, -0.1691585, 0, 0, 0, 1, 1,
-0.7631008, -0.7642511, -1.555607, 0, 0, 0, 1, 1,
-0.7506238, -0.867258, -3.051214, 0, 0, 0, 1, 1,
-0.7497774, 0.9118662, 0.05819819, 1, 1, 1, 1, 1,
-0.7483361, -2.153213, -2.025162, 1, 1, 1, 1, 1,
-0.7482575, 0.2222433, -2.71524, 1, 1, 1, 1, 1,
-0.7459779, -0.3822387, -3.570797, 1, 1, 1, 1, 1,
-0.7388822, 0.4882517, -2.635711, 1, 1, 1, 1, 1,
-0.7340754, 2.01506, -1.018028, 1, 1, 1, 1, 1,
-0.7161752, 0.8754739, -0.05063704, 1, 1, 1, 1, 1,
-0.7071781, -1.896082, -3.809344, 1, 1, 1, 1, 1,
-0.7051547, -0.4381533, -2.344763, 1, 1, 1, 1, 1,
-0.70061, 1.34232, -0.4183545, 1, 1, 1, 1, 1,
-0.7000009, 0.3335311, -2.62902, 1, 1, 1, 1, 1,
-0.6904739, 0.8443269, -1.133606, 1, 1, 1, 1, 1,
-0.6896048, -0.3982469, -3.330113, 1, 1, 1, 1, 1,
-0.6823439, 0.337391, -1.962417, 1, 1, 1, 1, 1,
-0.6727334, -0.01589775, -1.209411, 1, 1, 1, 1, 1,
-0.672505, -0.9049382, -4.080065, 0, 0, 1, 1, 1,
-0.6656378, 0.7333318, 0.7419358, 1, 0, 0, 1, 1,
-0.6610117, 0.9171143, 0.3630641, 1, 0, 0, 1, 1,
-0.6566181, -0.6509231, -2.126745, 1, 0, 0, 1, 1,
-0.649743, -1.379607, -2.087943, 1, 0, 0, 1, 1,
-0.6493452, -0.08285867, -1.418741, 1, 0, 0, 1, 1,
-0.6483982, 0.1582977, -3.116058, 0, 0, 0, 1, 1,
-0.6473354, -1.020407, -2.874932, 0, 0, 0, 1, 1,
-0.6369745, -0.4253123, -1.652314, 0, 0, 0, 1, 1,
-0.6359051, -0.0006579281, -1.206336, 0, 0, 0, 1, 1,
-0.6358386, 0.2018483, -1.494658, 0, 0, 0, 1, 1,
-0.6272023, -0.4147809, -3.193555, 0, 0, 0, 1, 1,
-0.6264534, 1.761786, -1.092343, 0, 0, 0, 1, 1,
-0.6253447, 0.5914335, -0.943539, 1, 1, 1, 1, 1,
-0.6241074, -0.5893183, -1.783853, 1, 1, 1, 1, 1,
-0.6196286, -0.1060231, -1.969539, 1, 1, 1, 1, 1,
-0.6161293, -0.2846479, -0.8723417, 1, 1, 1, 1, 1,
-0.6152562, -0.1371686, -0.5731908, 1, 1, 1, 1, 1,
-0.6106501, -1.096959, -2.878671, 1, 1, 1, 1, 1,
-0.608436, 0.1989461, 0.4053553, 1, 1, 1, 1, 1,
-0.6080241, 0.6911176, -0.9522997, 1, 1, 1, 1, 1,
-0.6076506, -0.3137779, -4.126049, 1, 1, 1, 1, 1,
-0.6036449, 0.1460217, -0.5343307, 1, 1, 1, 1, 1,
-0.5912326, 1.544212, -0.6856418, 1, 1, 1, 1, 1,
-0.5912258, -0.3079368, -2.195677, 1, 1, 1, 1, 1,
-0.5910723, -1.061911, -2.866436, 1, 1, 1, 1, 1,
-0.5909907, 0.833047, -0.3228625, 1, 1, 1, 1, 1,
-0.5838296, -0.0999021, -1.02754, 1, 1, 1, 1, 1,
-0.5789003, -2.215467, -3.637505, 0, 0, 1, 1, 1,
-0.5774602, -0.2544422, -1.409878, 1, 0, 0, 1, 1,
-0.5721117, 0.1612052, -0.8406317, 1, 0, 0, 1, 1,
-0.5574774, 0.2301127, 0.1988036, 1, 0, 0, 1, 1,
-0.5565371, 1.243385, -0.3340615, 1, 0, 0, 1, 1,
-0.5550944, 0.8693463, -2.727015, 1, 0, 0, 1, 1,
-0.5514358, -0.01760308, -0.3171088, 0, 0, 0, 1, 1,
-0.5508288, 0.7087226, -1.154475, 0, 0, 0, 1, 1,
-0.5482465, 0.008094176, -1.761762, 0, 0, 0, 1, 1,
-0.5476574, -0.9125806, -3.040819, 0, 0, 0, 1, 1,
-0.5434969, -0.9672716, -3.414581, 0, 0, 0, 1, 1,
-0.5428955, 1.245901, -0.07308218, 0, 0, 0, 1, 1,
-0.5426966, -0.9247428, -0.9960886, 0, 0, 0, 1, 1,
-0.5385744, 1.361286, 0.6141617, 1, 1, 1, 1, 1,
-0.5375792, 0.3626753, -1.972362, 1, 1, 1, 1, 1,
-0.5351645, 0.8705171, 0.06067269, 1, 1, 1, 1, 1,
-0.5306885, -0.1642945, -0.6294993, 1, 1, 1, 1, 1,
-0.5305043, 0.2991695, -0.7448183, 1, 1, 1, 1, 1,
-0.522391, -0.008343636, -1.971836, 1, 1, 1, 1, 1,
-0.5173981, 1.301733, 0.1465502, 1, 1, 1, 1, 1,
-0.5173143, -1.07856, -1.564985, 1, 1, 1, 1, 1,
-0.5152969, 1.110549, -2.066199, 1, 1, 1, 1, 1,
-0.5149603, 0.8780044, 0.4322225, 1, 1, 1, 1, 1,
-0.5148038, 1.017613, 0.01816395, 1, 1, 1, 1, 1,
-0.5136135, -1.272696, -2.892678, 1, 1, 1, 1, 1,
-0.5087545, 0.4239918, -1.834054, 1, 1, 1, 1, 1,
-0.5070121, -0.1986777, -0.8194919, 1, 1, 1, 1, 1,
-0.5057827, -0.5419344, -3.928676, 1, 1, 1, 1, 1,
-0.5045598, -1.189812, -4.18329, 0, 0, 1, 1, 1,
-0.5038101, -0.2392835, -0.7329706, 1, 0, 0, 1, 1,
-0.5025136, -0.3047533, -3.598161, 1, 0, 0, 1, 1,
-0.5002817, -2.41967, -1.9885, 1, 0, 0, 1, 1,
-0.4968515, 0.4026451, -1.630518, 1, 0, 0, 1, 1,
-0.4963965, -0.4848686, -3.827105, 1, 0, 0, 1, 1,
-0.4919445, 0.3787537, -1.658279, 0, 0, 0, 1, 1,
-0.4910747, -1.306352, -0.7499799, 0, 0, 0, 1, 1,
-0.4884892, 0.3779649, -1.296417, 0, 0, 0, 1, 1,
-0.4856387, -0.6553627, -3.654219, 0, 0, 0, 1, 1,
-0.4853174, 1.041113, -0.7353216, 0, 0, 0, 1, 1,
-0.4792961, 0.1241899, 0.6001619, 0, 0, 0, 1, 1,
-0.4767804, 0.2602715, -2.392442, 0, 0, 0, 1, 1,
-0.4765889, 0.4965966, -0.6003743, 1, 1, 1, 1, 1,
-0.4756252, -0.07245518, -1.4347, 1, 1, 1, 1, 1,
-0.4701802, 1.145459, 0.1692129, 1, 1, 1, 1, 1,
-0.4694074, 0.6377037, -0.6909254, 1, 1, 1, 1, 1,
-0.4686769, -0.8342988, -2.243937, 1, 1, 1, 1, 1,
-0.4639406, -0.8886637, -3.806412, 1, 1, 1, 1, 1,
-0.4633907, -0.2175124, -3.643679, 1, 1, 1, 1, 1,
-0.4632084, -0.3501628, -2.291903, 1, 1, 1, 1, 1,
-0.457632, -1.252955, -1.670192, 1, 1, 1, 1, 1,
-0.4562648, 1.082438, -0.4840053, 1, 1, 1, 1, 1,
-0.4546613, -1.517379, -4.515756, 1, 1, 1, 1, 1,
-0.4533401, 0.9216262, -0.1777021, 1, 1, 1, 1, 1,
-0.4505849, -0.2697353, -2.46316, 1, 1, 1, 1, 1,
-0.4504459, -1.386019, -4.335796, 1, 1, 1, 1, 1,
-0.4462323, -0.7326999, -2.244382, 1, 1, 1, 1, 1,
-0.4455369, 0.2058581, -1.25558, 0, 0, 1, 1, 1,
-0.4429769, 0.07644904, -0.2635779, 1, 0, 0, 1, 1,
-0.4427691, -0.8119526, -1.845729, 1, 0, 0, 1, 1,
-0.4422399, 0.4435385, -0.8207055, 1, 0, 0, 1, 1,
-0.4374295, -1.22882, -3.329094, 1, 0, 0, 1, 1,
-0.4296013, -0.5232122, -4.678751, 1, 0, 0, 1, 1,
-0.428876, 0.7591594, -1.531136, 0, 0, 0, 1, 1,
-0.4288047, -1.942731, -1.689688, 0, 0, 0, 1, 1,
-0.4279591, 0.4832766, -1.278487, 0, 0, 0, 1, 1,
-0.4267353, -0.8467368, -1.860403, 0, 0, 0, 1, 1,
-0.4263826, 0.7549083, -1.09674, 0, 0, 0, 1, 1,
-0.4257831, 0.5583784, -0.02947567, 0, 0, 0, 1, 1,
-0.422179, -0.5858889, -3.965409, 0, 0, 0, 1, 1,
-0.4110416, -0.8308948, -0.5796792, 1, 1, 1, 1, 1,
-0.4031337, 0.9364048, 1.521719, 1, 1, 1, 1, 1,
-0.4029649, -0.2162151, -3.134742, 1, 1, 1, 1, 1,
-0.3865335, 0.2951247, -1.579548, 1, 1, 1, 1, 1,
-0.3848284, -1.762756, -3.217481, 1, 1, 1, 1, 1,
-0.3790658, 2.470744, -0.7445747, 1, 1, 1, 1, 1,
-0.3769141, 1.566216, 1.201178, 1, 1, 1, 1, 1,
-0.36961, -1.533038, -4.437394, 1, 1, 1, 1, 1,
-0.3680612, -0.02929116, -0.8572162, 1, 1, 1, 1, 1,
-0.3666104, -0.9084061, -2.962938, 1, 1, 1, 1, 1,
-0.3661175, -0.841951, -3.986375, 1, 1, 1, 1, 1,
-0.3639616, -0.9239498, -3.726924, 1, 1, 1, 1, 1,
-0.3634485, 2.694843, -1.65638, 1, 1, 1, 1, 1,
-0.3593638, -0.1095196, -2.217132, 1, 1, 1, 1, 1,
-0.3546664, -0.1192214, -0.9898922, 1, 1, 1, 1, 1,
-0.3542046, -1.567512, -2.640481, 0, 0, 1, 1, 1,
-0.3536916, 0.1457216, -1.528921, 1, 0, 0, 1, 1,
-0.3505769, 0.9064277, -1.258633, 1, 0, 0, 1, 1,
-0.350494, 0.8017959, -0.9828883, 1, 0, 0, 1, 1,
-0.3457676, 0.5667725, -0.8643459, 1, 0, 0, 1, 1,
-0.3341199, -0.5940878, -3.03152, 1, 0, 0, 1, 1,
-0.3323935, 0.2505703, -3.318425, 0, 0, 0, 1, 1,
-0.3310125, -0.0347866, -2.1088, 0, 0, 0, 1, 1,
-0.3262632, 1.398292, -1.021745, 0, 0, 0, 1, 1,
-0.3256925, -0.3092717, -3.802917, 0, 0, 0, 1, 1,
-0.3248216, -0.4320089, -2.600558, 0, 0, 0, 1, 1,
-0.3229423, -0.3815463, -3.478863, 0, 0, 0, 1, 1,
-0.3146667, 0.17507, -1.097975, 0, 0, 0, 1, 1,
-0.3138402, 0.8599484, 0.4457694, 1, 1, 1, 1, 1,
-0.3081742, -1.773996, -3.714144, 1, 1, 1, 1, 1,
-0.3065906, 0.641048, -2.244386, 1, 1, 1, 1, 1,
-0.3057381, -1.674398, -2.115849, 1, 1, 1, 1, 1,
-0.3041312, 0.2930761, -0.994631, 1, 1, 1, 1, 1,
-0.3038251, 1.665072, 1.036251, 1, 1, 1, 1, 1,
-0.3012265, -1.307005, -2.227816, 1, 1, 1, 1, 1,
-0.2991759, 0.183844, -0.8777763, 1, 1, 1, 1, 1,
-0.2955403, -0.171609, -0.7771962, 1, 1, 1, 1, 1,
-0.2947291, -1.037656, -2.759386, 1, 1, 1, 1, 1,
-0.2925723, -0.6672629, -2.337365, 1, 1, 1, 1, 1,
-0.2917126, -1.014786, -4.23817, 1, 1, 1, 1, 1,
-0.2895525, 2.03197, -0.5575191, 1, 1, 1, 1, 1,
-0.2866291, 0.02204776, -2.051265, 1, 1, 1, 1, 1,
-0.2810346, -0.5176995, -3.231791, 1, 1, 1, 1, 1,
-0.2803236, 0.6712625, -0.2853916, 0, 0, 1, 1, 1,
-0.2799183, 1.059528, -0.1006119, 1, 0, 0, 1, 1,
-0.2768878, -0.7266134, -3.775378, 1, 0, 0, 1, 1,
-0.2763367, -0.5931945, -2.899944, 1, 0, 0, 1, 1,
-0.266745, -0.7117586, -2.212249, 1, 0, 0, 1, 1,
-0.264629, 0.1309797, -1.802323, 1, 0, 0, 1, 1,
-0.2631554, -0.3444929, -2.835735, 0, 0, 0, 1, 1,
-0.2550019, 0.574688, -0.04106864, 0, 0, 0, 1, 1,
-0.2516302, -1.302166, -2.991003, 0, 0, 0, 1, 1,
-0.247557, 1.754992, 1.186256, 0, 0, 0, 1, 1,
-0.2437308, -1.577825, -2.142491, 0, 0, 0, 1, 1,
-0.2365045, -2.087904, -3.006583, 0, 0, 0, 1, 1,
-0.2351341, 1.166165, -0.4787998, 0, 0, 0, 1, 1,
-0.2314841, -0.06564378, -2.620201, 1, 1, 1, 1, 1,
-0.2275465, -2.27835, -2.666312, 1, 1, 1, 1, 1,
-0.2258679, 1.393943, 0.08508049, 1, 1, 1, 1, 1,
-0.2249795, 0.5013025, -0.822853, 1, 1, 1, 1, 1,
-0.219551, 1.796585, -1.435767, 1, 1, 1, 1, 1,
-0.2193003, -1.298177, -3.72421, 1, 1, 1, 1, 1,
-0.2175496, -2.113902, -2.258192, 1, 1, 1, 1, 1,
-0.2171058, 1.014678, -0.3189545, 1, 1, 1, 1, 1,
-0.2152858, -0.05183081, -3.451041, 1, 1, 1, 1, 1,
-0.2143195, 0.4957373, -1.239617, 1, 1, 1, 1, 1,
-0.2127724, -1.019516, -2.849211, 1, 1, 1, 1, 1,
-0.2105704, 0.06735655, -0.7005786, 1, 1, 1, 1, 1,
-0.2081917, -0.5313964, -2.413809, 1, 1, 1, 1, 1,
-0.2067861, -2.345156, -3.52835, 1, 1, 1, 1, 1,
-0.2067343, 0.9369311, -2.099082, 1, 1, 1, 1, 1,
-0.2018298, -0.5035054, -1.781217, 0, 0, 1, 1, 1,
-0.2014232, 0.884936, -1.476084, 1, 0, 0, 1, 1,
-0.1979093, -0.4943173, -2.982129, 1, 0, 0, 1, 1,
-0.1963476, 0.802744, 0.6929881, 1, 0, 0, 1, 1,
-0.1952741, 0.3985453, -1.255207, 1, 0, 0, 1, 1,
-0.1947386, -0.6863225, -1.654243, 1, 0, 0, 1, 1,
-0.1917308, -0.1862717, -3.594447, 0, 0, 0, 1, 1,
-0.1856847, -0.5441027, -1.418967, 0, 0, 0, 1, 1,
-0.1781599, 0.3081848, 0.2090867, 0, 0, 0, 1, 1,
-0.1773827, -1.192258, -2.9624, 0, 0, 0, 1, 1,
-0.1761664, 1.912849, -0.492936, 0, 0, 0, 1, 1,
-0.1711349, 0.9307346, -0.02981872, 0, 0, 0, 1, 1,
-0.1686923, 1.245276, -2.462368, 0, 0, 0, 1, 1,
-0.1673255, -0.7621278, -3.080955, 1, 1, 1, 1, 1,
-0.1666404, 0.2766748, -1.516624, 1, 1, 1, 1, 1,
-0.1660971, 0.3191242, -1.873326, 1, 1, 1, 1, 1,
-0.1621886, -0.884249, -2.135355, 1, 1, 1, 1, 1,
-0.1609988, -0.1933683, -2.548591, 1, 1, 1, 1, 1,
-0.1599298, -0.4463279, 0.2374416, 1, 1, 1, 1, 1,
-0.1594351, 0.9775768, 0.1688839, 1, 1, 1, 1, 1,
-0.1586306, -1.040462, -4.162621, 1, 1, 1, 1, 1,
-0.1585451, -0.700444, -3.958987, 1, 1, 1, 1, 1,
-0.1578981, 1.23741, 1.475429, 1, 1, 1, 1, 1,
-0.1576479, 0.1495718, -2.008648, 1, 1, 1, 1, 1,
-0.1504189, -0.8266872, -2.67177, 1, 1, 1, 1, 1,
-0.147193, -0.2070991, -2.122052, 1, 1, 1, 1, 1,
-0.1466954, -0.206637, -5.71247, 1, 1, 1, 1, 1,
-0.145638, -1.781707, -4.391312, 1, 1, 1, 1, 1,
-0.1413957, 1.432147, -0.6096866, 0, 0, 1, 1, 1,
-0.1413078, -2.269713, -4.115177, 1, 0, 0, 1, 1,
-0.139528, -0.6614343, -3.249674, 1, 0, 0, 1, 1,
-0.1376856, 0.1116679, -0.3303804, 1, 0, 0, 1, 1,
-0.1364143, 0.1180599, -0.6495126, 1, 0, 0, 1, 1,
-0.1331516, -1.724318, -5.940272, 1, 0, 0, 1, 1,
-0.1309986, 0.939996, -1.773798, 0, 0, 0, 1, 1,
-0.1292482, 0.6510139, 0.5210773, 0, 0, 0, 1, 1,
-0.1277946, -0.07968789, -3.022683, 0, 0, 0, 1, 1,
-0.1277777, 1.347171, 1.34079, 0, 0, 0, 1, 1,
-0.1261218, 1.270228, 0.8607297, 0, 0, 0, 1, 1,
-0.120432, 0.502681, -0.1827461, 0, 0, 0, 1, 1,
-0.117158, 0.589519, 0.5103403, 0, 0, 0, 1, 1,
-0.1164684, 0.6054542, -0.7804289, 1, 1, 1, 1, 1,
-0.1102297, 1.537012, -0.110116, 1, 1, 1, 1, 1,
-0.1093189, 0.1975433, -0.5798733, 1, 1, 1, 1, 1,
-0.1074002, 1.157691, 1.181091, 1, 1, 1, 1, 1,
-0.1066436, 0.3998504, -1.621409, 1, 1, 1, 1, 1,
-0.106058, 0.9441429, -0.4580936, 1, 1, 1, 1, 1,
-0.1048031, -1.338024, -2.944075, 1, 1, 1, 1, 1,
-0.1001325, -0.8913338, -3.548454, 1, 1, 1, 1, 1,
-0.09896486, 1.4221, 0.6230515, 1, 1, 1, 1, 1,
-0.09630684, 2.811232, -0.2232343, 1, 1, 1, 1, 1,
-0.08957416, -0.437335, -3.093565, 1, 1, 1, 1, 1,
-0.07638574, 0.1396871, 0.1063799, 1, 1, 1, 1, 1,
-0.0692269, 0.01712322, 0.1461932, 1, 1, 1, 1, 1,
-0.06845543, -0.1883977, -1.832142, 1, 1, 1, 1, 1,
-0.06775664, -1.323417, -1.632884, 1, 1, 1, 1, 1,
-0.06067381, 0.4040084, 0.8561867, 0, 0, 1, 1, 1,
-0.05837769, -0.229588, -3.778044, 1, 0, 0, 1, 1,
-0.05317089, -0.01705265, -1.91461, 1, 0, 0, 1, 1,
-0.05040044, -0.3527584, -5.111323, 1, 0, 0, 1, 1,
-0.04995858, -0.06848308, -3.824249, 1, 0, 0, 1, 1,
-0.04984609, -1.08596, -4.625095, 1, 0, 0, 1, 1,
-0.04515754, -0.6621131, -3.750958, 0, 0, 0, 1, 1,
-0.04361175, 0.451066, 1.713792, 0, 0, 0, 1, 1,
-0.04318081, -0.2097098, -1.88957, 0, 0, 0, 1, 1,
-0.04254162, 0.3033054, 0.02722338, 0, 0, 0, 1, 1,
-0.03779667, 1.195296, 0.8111978, 0, 0, 0, 1, 1,
-0.03712073, -1.686485, -1.389561, 0, 0, 0, 1, 1,
-0.03675939, -1.165808, -2.466479, 0, 0, 0, 1, 1,
-0.03606792, 0.6624365, -1.55857, 1, 1, 1, 1, 1,
-0.03464716, -1.139293, -1.526479, 1, 1, 1, 1, 1,
-0.0329441, 0.7997546, 1.319341, 1, 1, 1, 1, 1,
-0.03172311, 0.8898305, 0.3530661, 1, 1, 1, 1, 1,
-0.02904151, -0.05546211, -3.768634, 1, 1, 1, 1, 1,
-0.02820083, 0.1380165, 0.4098218, 1, 1, 1, 1, 1,
-0.02780243, 0.8530018, -0.9695862, 1, 1, 1, 1, 1,
-0.0251106, -1.193645, -4.139508, 1, 1, 1, 1, 1,
-0.02278701, 0.4253319, 0.3270539, 1, 1, 1, 1, 1,
-0.02216971, -0.1938181, -3.350304, 1, 1, 1, 1, 1,
-0.01717899, -0.1461279, -3.346464, 1, 1, 1, 1, 1,
-0.01415432, -0.0203144, -2.769858, 1, 1, 1, 1, 1,
-0.01305528, -0.7422463, -1.512754, 1, 1, 1, 1, 1,
-0.009990127, 1.353849, -0.7819368, 1, 1, 1, 1, 1,
-0.009637655, 0.9702891, 0.7079725, 1, 1, 1, 1, 1,
-0.006901535, 0.5933864, 1.166642, 0, 0, 1, 1, 1,
-0.005987248, -0.5282263, -2.702127, 1, 0, 0, 1, 1,
-0.00427904, -0.1541193, -4.35721, 1, 0, 0, 1, 1,
-0.003812923, -0.4656011, -2.342396, 1, 0, 0, 1, 1,
0.0008100162, -0.002306907, 1.103389, 1, 0, 0, 1, 1,
0.004662901, -0.3969289, 4.113465, 1, 0, 0, 1, 1,
0.004931248, -0.1600114, 2.47309, 0, 0, 0, 1, 1,
0.006417779, 1.058709, -0.7730091, 0, 0, 0, 1, 1,
0.007396436, 1.465008, -0.08005711, 0, 0, 0, 1, 1,
0.007676934, -1.201571, 2.73747, 0, 0, 0, 1, 1,
0.008435265, -1.068202, 1.552981, 0, 0, 0, 1, 1,
0.01133028, -1.59092, 2.121991, 0, 0, 0, 1, 1,
0.01175691, -0.5281401, 3.561254, 0, 0, 0, 1, 1,
0.01296071, 0.3462892, 0.6151217, 1, 1, 1, 1, 1,
0.01322044, -0.442481, 2.471854, 1, 1, 1, 1, 1,
0.01485381, 0.2870731, 0.323303, 1, 1, 1, 1, 1,
0.01786293, 0.3445928, -1.303196, 1, 1, 1, 1, 1,
0.01928345, -1.467861, 2.095227, 1, 1, 1, 1, 1,
0.02147465, -1.488934, 3.706015, 1, 1, 1, 1, 1,
0.02567251, 0.08272173, 0.1698016, 1, 1, 1, 1, 1,
0.02607596, -0.7567465, 3.466954, 1, 1, 1, 1, 1,
0.03095883, -0.127352, 3.766801, 1, 1, 1, 1, 1,
0.0325481, -1.460923, 2.16483, 1, 1, 1, 1, 1,
0.03376481, 0.06304108, -0.1994228, 1, 1, 1, 1, 1,
0.03670099, -1.085016, 2.797331, 1, 1, 1, 1, 1,
0.03867919, -0.6389141, 2.000028, 1, 1, 1, 1, 1,
0.04173313, -1.563015, 4.062252, 1, 1, 1, 1, 1,
0.04310446, 1.111884, -0.4617985, 1, 1, 1, 1, 1,
0.04570645, -0.3239683, 3.930248, 0, 0, 1, 1, 1,
0.0458489, 0.2783392, 2.05256, 1, 0, 0, 1, 1,
0.04665218, 0.4754063, -1.269704, 1, 0, 0, 1, 1,
0.04723972, 0.7025701, 0.6926357, 1, 0, 0, 1, 1,
0.0497457, -0.4770176, 5.624664, 1, 0, 0, 1, 1,
0.04976923, 1.933555, 0.3982646, 1, 0, 0, 1, 1,
0.05665896, 0.7839809, 0.3832425, 0, 0, 0, 1, 1,
0.06158806, -0.5387735, 2.790226, 0, 0, 0, 1, 1,
0.06368028, 2.095129, -0.4560864, 0, 0, 0, 1, 1,
0.06475736, -0.7233636, 2.85017, 0, 0, 0, 1, 1,
0.07208732, 0.4856175, 0.6924384, 0, 0, 0, 1, 1,
0.07352065, -1.060279, 4.481813, 0, 0, 0, 1, 1,
0.07452322, -1.31137, 4.533716, 0, 0, 0, 1, 1,
0.07458695, -0.237728, 2.45045, 1, 1, 1, 1, 1,
0.07688292, -0.6048142, 3.410967, 1, 1, 1, 1, 1,
0.07762247, 0.2337463, 1.078731, 1, 1, 1, 1, 1,
0.07894131, -1.132663, 4.113904, 1, 1, 1, 1, 1,
0.0799688, -0.5887396, 3.169322, 1, 1, 1, 1, 1,
0.08023697, -0.8747841, 3.959651, 1, 1, 1, 1, 1,
0.08105488, -0.04713333, 1.829581, 1, 1, 1, 1, 1,
0.08921409, -0.6928995, 3.357761, 1, 1, 1, 1, 1,
0.09121521, 0.802356, 1.108727, 1, 1, 1, 1, 1,
0.09194807, -0.1481863, 3.544621, 1, 1, 1, 1, 1,
0.0929039, -2.009134, 2.9091, 1, 1, 1, 1, 1,
0.1015061, 1.203005, 1.054696, 1, 1, 1, 1, 1,
0.1042086, -0.4338267, 2.47245, 1, 1, 1, 1, 1,
0.1051689, -0.1920584, 2.576241, 1, 1, 1, 1, 1,
0.1067261, 1.529201, 0.1232003, 1, 1, 1, 1, 1,
0.10719, 0.2590977, 0.6772307, 0, 0, 1, 1, 1,
0.1082196, -0.127129, 2.572677, 1, 0, 0, 1, 1,
0.1089806, -0.6333115, 5.528932, 1, 0, 0, 1, 1,
0.1157089, -0.9270341, 3.490921, 1, 0, 0, 1, 1,
0.1191455, -1.797908, 3.365749, 1, 0, 0, 1, 1,
0.1278234, 0.5284616, -0.4947219, 1, 0, 0, 1, 1,
0.1295214, -0.05450513, -0.02110881, 0, 0, 0, 1, 1,
0.129952, -1.625138, 4.888802, 0, 0, 0, 1, 1,
0.1320208, -2.702995, 3.986761, 0, 0, 0, 1, 1,
0.1324339, -1.359033, 2.001728, 0, 0, 0, 1, 1,
0.133362, -0.3290993, 3.315177, 0, 0, 0, 1, 1,
0.1356422, -0.751027, 0.8731032, 0, 0, 0, 1, 1,
0.1369193, -1.223574, 3.803438, 0, 0, 0, 1, 1,
0.1413662, 1.430801, -0.4696537, 1, 1, 1, 1, 1,
0.1457637, -1.696067, 2.970322, 1, 1, 1, 1, 1,
0.148406, -0.6763503, 1.651061, 1, 1, 1, 1, 1,
0.1526201, 1.563155, -0.08801007, 1, 1, 1, 1, 1,
0.1553509, 0.3921386, 0.8209953, 1, 1, 1, 1, 1,
0.1564686, 1.003798, -0.8315879, 1, 1, 1, 1, 1,
0.157634, 1.008165, 0.6150814, 1, 1, 1, 1, 1,
0.1579819, 1.419877, -0.04507483, 1, 1, 1, 1, 1,
0.1592404, -0.4408659, 4.565118, 1, 1, 1, 1, 1,
0.1669902, -0.6594871, 2.320535, 1, 1, 1, 1, 1,
0.1676327, -1.787765, 2.104062, 1, 1, 1, 1, 1,
0.1726552, -0.4678671, 1.592824, 1, 1, 1, 1, 1,
0.1744581, -0.2473516, 3.746014, 1, 1, 1, 1, 1,
0.1748451, 1.032329, -1.463984, 1, 1, 1, 1, 1,
0.1761669, 0.9729727, -0.06137368, 1, 1, 1, 1, 1,
0.1813524, -1.226862, 4.199798, 0, 0, 1, 1, 1,
0.1823892, -0.3880572, 2.564617, 1, 0, 0, 1, 1,
0.1829346, 0.1386668, -1.130362, 1, 0, 0, 1, 1,
0.187592, 0.8635974, -1.995869, 1, 0, 0, 1, 1,
0.1943888, -3.118966, 3.063599, 1, 0, 0, 1, 1,
0.1955583, -0.4147096, 0.8694689, 1, 0, 0, 1, 1,
0.2047249, 0.7425025, 1.205611, 0, 0, 0, 1, 1,
0.2106985, -1.125093, 2.122207, 0, 0, 0, 1, 1,
0.2124801, -1.646811, 2.3126, 0, 0, 0, 1, 1,
0.2137954, 0.01651541, 1.539737, 0, 0, 0, 1, 1,
0.2177974, 0.06378517, 0.918578, 0, 0, 0, 1, 1,
0.2184113, -0.578943, 3.406788, 0, 0, 0, 1, 1,
0.2192655, -1.134616, 1.768411, 0, 0, 0, 1, 1,
0.220716, -0.8883677, 4.442824, 1, 1, 1, 1, 1,
0.2227636, 0.2142766, 0.6142659, 1, 1, 1, 1, 1,
0.2254607, 1.344996, 0.54199, 1, 1, 1, 1, 1,
0.2289789, -0.02993103, 2.96556, 1, 1, 1, 1, 1,
0.230654, -0.4879665, 3.028349, 1, 1, 1, 1, 1,
0.2308797, -0.5150734, 2.835676, 1, 1, 1, 1, 1,
0.234589, 1.309036, -1.546113, 1, 1, 1, 1, 1,
0.2346443, 1.836139, 0.2297264, 1, 1, 1, 1, 1,
0.2352547, -1.82286, 2.317478, 1, 1, 1, 1, 1,
0.2366896, 1.660622, -0.5586774, 1, 1, 1, 1, 1,
0.2368315, 2.279301, 0.8463493, 1, 1, 1, 1, 1,
0.2376283, 0.02732601, 0.8131023, 1, 1, 1, 1, 1,
0.239013, -1.529174, 4.27575, 1, 1, 1, 1, 1,
0.2393603, -0.08193236, 0.1264555, 1, 1, 1, 1, 1,
0.240042, 1.633571, 0.08552191, 1, 1, 1, 1, 1,
0.2438706, 2.088711, 0.8970512, 0, 0, 1, 1, 1,
0.2455398, -0.8473033, 0.9873134, 1, 0, 0, 1, 1,
0.2465024, -0.02350482, 3.037261, 1, 0, 0, 1, 1,
0.2468288, -0.837911, 1.40545, 1, 0, 0, 1, 1,
0.2495231, 0.4230585, 0.4617738, 1, 0, 0, 1, 1,
0.2537237, -0.3576136, 2.615843, 1, 0, 0, 1, 1,
0.2562595, -1.587328, 1.564252, 0, 0, 0, 1, 1,
0.2571726, -0.4309474, 1.722027, 0, 0, 0, 1, 1,
0.2578203, 0.423052, 0.07072855, 0, 0, 0, 1, 1,
0.2597658, 2.33204, 2.288474, 0, 0, 0, 1, 1,
0.2621102, -0.7635837, 3.0393, 0, 0, 0, 1, 1,
0.2648032, 0.06394248, 1.667253, 0, 0, 0, 1, 1,
0.2648479, 1.056893, -0.3947482, 0, 0, 0, 1, 1,
0.2675302, -0.4885479, 2.390236, 1, 1, 1, 1, 1,
0.2691808, 0.7327822, -0.6716556, 1, 1, 1, 1, 1,
0.2767751, 0.2053069, 2.514659, 1, 1, 1, 1, 1,
0.2772518, -0.6658472, 2.894404, 1, 1, 1, 1, 1,
0.2799441, 1.076799, 0.584042, 1, 1, 1, 1, 1,
0.2804902, 0.8578254, 0.1062858, 1, 1, 1, 1, 1,
0.2863278, -0.8946371, 3.482369, 1, 1, 1, 1, 1,
0.2905955, 1.269439, -1.17942, 1, 1, 1, 1, 1,
0.2919361, 0.7421971, 1.078166, 1, 1, 1, 1, 1,
0.2950614, 0.8107083, 0.2667272, 1, 1, 1, 1, 1,
0.2956503, -0.09668046, 2.586421, 1, 1, 1, 1, 1,
0.2974083, 1.623349, 0.3510087, 1, 1, 1, 1, 1,
0.2983231, -0.5013599, 3.39399, 1, 1, 1, 1, 1,
0.2998089, 1.169256, 1.1208, 1, 1, 1, 1, 1,
0.3041925, -1.373012, 1.816913, 1, 1, 1, 1, 1,
0.3114251, 0.4325912, 1.175936, 0, 0, 1, 1, 1,
0.3129363, 0.3760723, 1.486914, 1, 0, 0, 1, 1,
0.3172073, 1.357832, -0.2422496, 1, 0, 0, 1, 1,
0.3219823, -0.9237278, 3.534784, 1, 0, 0, 1, 1,
0.3235514, -0.8536772, 2.663323, 1, 0, 0, 1, 1,
0.3251263, 1.45869, 0.8895048, 1, 0, 0, 1, 1,
0.3253921, -0.01128746, 1.808173, 0, 0, 0, 1, 1,
0.3292133, 0.6337039, -0.9119173, 0, 0, 0, 1, 1,
0.3292231, 0.4967849, 1.030689, 0, 0, 0, 1, 1,
0.3351001, 0.07046965, 2.539361, 0, 0, 0, 1, 1,
0.3388318, -0.2501132, 4.32636, 0, 0, 0, 1, 1,
0.3389356, -0.3827927, 1.750295, 0, 0, 0, 1, 1,
0.3515613, 0.08219081, 1.331957, 0, 0, 0, 1, 1,
0.3516304, -1.365113, 3.641809, 1, 1, 1, 1, 1,
0.3568466, -0.1895428, 2.554156, 1, 1, 1, 1, 1,
0.3665321, -0.8440136, 3.939915, 1, 1, 1, 1, 1,
0.3665825, -0.2895334, 1.376962, 1, 1, 1, 1, 1,
0.3681582, -2.474409, 3.509099, 1, 1, 1, 1, 1,
0.3702157, -1.330013, 1.263324, 1, 1, 1, 1, 1,
0.3714092, -0.1012498, 2.086586, 1, 1, 1, 1, 1,
0.3740881, -0.1351741, 2.357761, 1, 1, 1, 1, 1,
0.3770526, 0.2441744, -0.46669, 1, 1, 1, 1, 1,
0.3788883, -0.06227555, 2.523859, 1, 1, 1, 1, 1,
0.3806099, -1.659798, 2.126116, 1, 1, 1, 1, 1,
0.3845177, 1.306171, 0.4938122, 1, 1, 1, 1, 1,
0.3849456, 0.3411856, 0.9341844, 1, 1, 1, 1, 1,
0.3860482, -1.279338, 2.709211, 1, 1, 1, 1, 1,
0.3888824, 0.8558394, 0.7833507, 1, 1, 1, 1, 1,
0.3889393, -0.7095843, 3.08523, 0, 0, 1, 1, 1,
0.3900814, 0.6943208, 1.346733, 1, 0, 0, 1, 1,
0.3937625, 0.7272505, -0.5223129, 1, 0, 0, 1, 1,
0.3939435, -0.4175109, 2.622053, 1, 0, 0, 1, 1,
0.3979919, 1.748353, -0.588033, 1, 0, 0, 1, 1,
0.4002537, 0.7887736, 1.132958, 1, 0, 0, 1, 1,
0.4037628, -0.1892784, -0.7186995, 0, 0, 0, 1, 1,
0.4041736, -0.1681859, 2.630345, 0, 0, 0, 1, 1,
0.4044366, 1.849632, 1.001332, 0, 0, 0, 1, 1,
0.4077401, -0.2482314, 2.318977, 0, 0, 0, 1, 1,
0.4084707, 1.636401, 0.3929373, 0, 0, 0, 1, 1,
0.4096502, -0.5494643, 1.876367, 0, 0, 0, 1, 1,
0.4111319, -0.6769214, 2.210162, 0, 0, 0, 1, 1,
0.4111409, -2.046127, 3.306216, 1, 1, 1, 1, 1,
0.415835, -0.1562843, 1.553037, 1, 1, 1, 1, 1,
0.4175961, -1.749289, 3.189472, 1, 1, 1, 1, 1,
0.4185191, -0.5260655, 1.329993, 1, 1, 1, 1, 1,
0.4234235, -0.2465641, 0.8739998, 1, 1, 1, 1, 1,
0.4252304, -0.6171211, 4.634749, 1, 1, 1, 1, 1,
0.4301077, -0.4845521, 3.598269, 1, 1, 1, 1, 1,
0.4335884, 0.6301472, 1.108541, 1, 1, 1, 1, 1,
0.4373667, 0.6973002, 2.698121, 1, 1, 1, 1, 1,
0.4403238, -0.1614113, 1.685536, 1, 1, 1, 1, 1,
0.4471829, -0.651206, 0.5345719, 1, 1, 1, 1, 1,
0.4496007, -1.42072, 3.550344, 1, 1, 1, 1, 1,
0.4498228, -2.447752, 3.103647, 1, 1, 1, 1, 1,
0.4502518, 0.2582681, 0.03964349, 1, 1, 1, 1, 1,
0.4506942, 0.9024118, 2.106753, 1, 1, 1, 1, 1,
0.4509395, -0.683775, 2.605963, 0, 0, 1, 1, 1,
0.4567429, 2.840282, 0.6774437, 1, 0, 0, 1, 1,
0.4587098, -1.072447, 2.574466, 1, 0, 0, 1, 1,
0.4593885, -0.4342254, 0.650663, 1, 0, 0, 1, 1,
0.4603757, -0.6874861, 3.784209, 1, 0, 0, 1, 1,
0.4625541, 1.784287, 0.7035419, 1, 0, 0, 1, 1,
0.4658947, -2.322392, 4.259227, 0, 0, 0, 1, 1,
0.4666606, -1.45109, 1.183695, 0, 0, 0, 1, 1,
0.4673513, -1.420926, 3.330435, 0, 0, 0, 1, 1,
0.4704145, 0.6884798, 1.264277, 0, 0, 0, 1, 1,
0.4716379, -0.3658927, 2.757048, 0, 0, 0, 1, 1,
0.4786834, -0.5752964, 1.304086, 0, 0, 0, 1, 1,
0.4789508, -0.2139754, 2.332821, 0, 0, 0, 1, 1,
0.4797402, -1.52098, 3.60956, 1, 1, 1, 1, 1,
0.4805575, -0.3956488, 2.534189, 1, 1, 1, 1, 1,
0.4818421, 0.1960163, 0.556456, 1, 1, 1, 1, 1,
0.4845835, -1.359744, 2.689178, 1, 1, 1, 1, 1,
0.4914935, -1.145186, 2.726655, 1, 1, 1, 1, 1,
0.4933574, -0.2180729, 1.895279, 1, 1, 1, 1, 1,
0.4982588, 1.325742, 0.7289026, 1, 1, 1, 1, 1,
0.5037981, -0.1590925, 1.91718, 1, 1, 1, 1, 1,
0.5053878, 0.4117182, 1.764551, 1, 1, 1, 1, 1,
0.5086485, 0.8100619, 0.7793216, 1, 1, 1, 1, 1,
0.5165141, 0.311448, -0.778461, 1, 1, 1, 1, 1,
0.5173728, 0.1563672, -0.201414, 1, 1, 1, 1, 1,
0.5224084, 0.3093673, 1.850331, 1, 1, 1, 1, 1,
0.5293157, 0.6967912, -1.781673, 1, 1, 1, 1, 1,
0.5359019, -0.6212378, 2.650874, 1, 1, 1, 1, 1,
0.5450943, -1.936692, 0.6768854, 0, 0, 1, 1, 1,
0.5464219, 1.739621, -0.9662346, 1, 0, 0, 1, 1,
0.5489828, 0.5469379, -0.7556379, 1, 0, 0, 1, 1,
0.5559121, 0.1206974, 1.80674, 1, 0, 0, 1, 1,
0.5559707, 1.440451, -1.403688, 1, 0, 0, 1, 1,
0.5572646, 0.5454657, 1.235868, 1, 0, 0, 1, 1,
0.5579761, 0.5798935, 0.4820924, 0, 0, 0, 1, 1,
0.5642315, 0.6563415, 0.4099409, 0, 0, 0, 1, 1,
0.5643592, 0.6135654, 1.430211, 0, 0, 0, 1, 1,
0.5675294, -2.12895, 2.471517, 0, 0, 0, 1, 1,
0.5701736, -0.4545842, 2.387667, 0, 0, 0, 1, 1,
0.5708545, -1.466172, 3.888984, 0, 0, 0, 1, 1,
0.5742553, 0.5592936, 2.01171, 0, 0, 0, 1, 1,
0.5763918, 1.522355, 0.4722063, 1, 1, 1, 1, 1,
0.5843083, 1.359516, 0.2261644, 1, 1, 1, 1, 1,
0.5859305, -0.3768399, 3.212753, 1, 1, 1, 1, 1,
0.5859817, -0.1178709, 2.001271, 1, 1, 1, 1, 1,
0.586429, 2.040784, 1.602531, 1, 1, 1, 1, 1,
0.5883002, -0.7056214, 2.637586, 1, 1, 1, 1, 1,
0.590442, 1.711674, 0.6364903, 1, 1, 1, 1, 1,
0.5917287, 0.04149789, 1.979785, 1, 1, 1, 1, 1,
0.5940596, 0.1083198, 1.411755, 1, 1, 1, 1, 1,
0.5960785, -0.3121852, 3.640695, 1, 1, 1, 1, 1,
0.6007536, 0.1608905, 1.432974, 1, 1, 1, 1, 1,
0.6010424, -0.7036045, 2.041923, 1, 1, 1, 1, 1,
0.6031146, 0.7340771, 0.6077926, 1, 1, 1, 1, 1,
0.6045034, 0.3861873, 0.5744746, 1, 1, 1, 1, 1,
0.6090716, -0.05112248, 0.7681826, 1, 1, 1, 1, 1,
0.6160459, -1.347895, 1.685262, 0, 0, 1, 1, 1,
0.6184165, -0.800051, 3.072345, 1, 0, 0, 1, 1,
0.6199808, 1.307349, 0.3747705, 1, 0, 0, 1, 1,
0.623988, -0.1338589, 1.552844, 1, 0, 0, 1, 1,
0.6240193, 2.39507, -0.2102058, 1, 0, 0, 1, 1,
0.6256839, 1.284167, 1.017724, 1, 0, 0, 1, 1,
0.6293015, -1.632499, 2.181195, 0, 0, 0, 1, 1,
0.6309476, 1.904303, 0.7713895, 0, 0, 0, 1, 1,
0.6344523, -1.26842, 3.638924, 0, 0, 0, 1, 1,
0.641688, -0.6948355, 2.787221, 0, 0, 0, 1, 1,
0.6447613, -1.350038, 1.719715, 0, 0, 0, 1, 1,
0.6457105, -0.3525645, 0.8503693, 0, 0, 0, 1, 1,
0.6472549, 0.04526644, 0.7266002, 0, 0, 0, 1, 1,
0.6499549, -0.001489982, 0.4489933, 1, 1, 1, 1, 1,
0.6500984, -0.2615987, 2.228685, 1, 1, 1, 1, 1,
0.6520922, 0.9101934, 0.3828112, 1, 1, 1, 1, 1,
0.657934, -0.5613019, 2.682455, 1, 1, 1, 1, 1,
0.6589853, 0.9258015, 0.4119388, 1, 1, 1, 1, 1,
0.6609592, -0.2389827, 3.426299, 1, 1, 1, 1, 1,
0.6612498, 1.56575, 0.9375371, 1, 1, 1, 1, 1,
0.6631457, -0.7391052, -0.6345332, 1, 1, 1, 1, 1,
0.6743428, 0.2432973, 1.241797, 1, 1, 1, 1, 1,
0.6752768, 0.7377926, 0.8366079, 1, 1, 1, 1, 1,
0.6915377, 1.679278, -0.3548577, 1, 1, 1, 1, 1,
0.6930513, -0.6105951, 1.871865, 1, 1, 1, 1, 1,
0.6936873, 1.327345, 0.7385835, 1, 1, 1, 1, 1,
0.6951458, -0.5981023, 2.629679, 1, 1, 1, 1, 1,
0.6975995, -0.552033, 2.86332, 1, 1, 1, 1, 1,
0.6985829, -0.3519475, 2.971814, 0, 0, 1, 1, 1,
0.7065738, 1.353392, -1.231942, 1, 0, 0, 1, 1,
0.7092573, 0.7375479, 0.9123425, 1, 0, 0, 1, 1,
0.7116614, -1.405092, 1.953051, 1, 0, 0, 1, 1,
0.7119758, 0.2614683, 0.9564599, 1, 0, 0, 1, 1,
0.7174419, 0.476444, 2.394546, 1, 0, 0, 1, 1,
0.7217185, -0.8982017, 2.107185, 0, 0, 0, 1, 1,
0.7228141, -0.759629, 2.57394, 0, 0, 0, 1, 1,
0.7256925, 0.8718089, 0.6574497, 0, 0, 0, 1, 1,
0.7320207, -0.1157379, 0.5640684, 0, 0, 0, 1, 1,
0.7338244, 0.5325633, 1.176921, 0, 0, 0, 1, 1,
0.7351809, -0.5620863, 4.131621, 0, 0, 0, 1, 1,
0.7387258, 1.936977, 0.6860806, 0, 0, 0, 1, 1,
0.7463613, 0.4943965, 1.945128, 1, 1, 1, 1, 1,
0.7493611, -0.6030086, 3.358353, 1, 1, 1, 1, 1,
0.7497107, 1.035932, 0.6289182, 1, 1, 1, 1, 1,
0.7509018, 0.7720448, 1.113766, 1, 1, 1, 1, 1,
0.7653045, 0.1918879, 1.184035, 1, 1, 1, 1, 1,
0.7674042, -0.6823496, 3.821926, 1, 1, 1, 1, 1,
0.7781271, -0.2445547, 2.112951, 1, 1, 1, 1, 1,
0.7823034, -0.772329, 2.506006, 1, 1, 1, 1, 1,
0.784432, -3.468586, 3.007798, 1, 1, 1, 1, 1,
0.791211, -1.39731, 3.354227, 1, 1, 1, 1, 1,
0.7935729, 1.049032, -1.137526, 1, 1, 1, 1, 1,
0.7975312, -0.8954205, 2.741333, 1, 1, 1, 1, 1,
0.8060548, -0.3706156, 0.9729092, 1, 1, 1, 1, 1,
0.8118943, -0.9809601, 2.542171, 1, 1, 1, 1, 1,
0.8142213, -0.5628133, 2.339854, 1, 1, 1, 1, 1,
0.814944, -0.8876854, 0.9914755, 0, 0, 1, 1, 1,
0.8364718, 0.7655687, -0.7096779, 1, 0, 0, 1, 1,
0.8412829, 0.697191, -0.03440316, 1, 0, 0, 1, 1,
0.841979, 0.1118921, 1.146817, 1, 0, 0, 1, 1,
0.8424228, 2.13572, 0.2943263, 1, 0, 0, 1, 1,
0.8463033, -1.192569, 2.619767, 1, 0, 0, 1, 1,
0.8522548, -0.03237443, 1.857693, 0, 0, 0, 1, 1,
0.8615407, 0.3053215, 0.9289708, 0, 0, 0, 1, 1,
0.8653841, 1.427134, 1.238304, 0, 0, 0, 1, 1,
0.8712588, 0.0297301, 0.9542529, 0, 0, 0, 1, 1,
0.8732689, -0.09966505, -0.348861, 0, 0, 0, 1, 1,
0.8792459, -1.31898, 2.857909, 0, 0, 0, 1, 1,
0.887015, 0.7573547, 4.444638, 0, 0, 0, 1, 1,
0.8912922, 0.5186537, -0.2866437, 1, 1, 1, 1, 1,
0.8979635, 0.3212534, 0.7996868, 1, 1, 1, 1, 1,
0.9005125, -2.366668, 4.019218, 1, 1, 1, 1, 1,
0.9018311, -0.1398226, 1.309965, 1, 1, 1, 1, 1,
0.9062695, 0.05536732, 0.7144856, 1, 1, 1, 1, 1,
0.9075335, -0.5391687, 1.252181, 1, 1, 1, 1, 1,
0.9103776, -0.1087605, 0.7678522, 1, 1, 1, 1, 1,
0.9107978, 1.39937, 0.3874746, 1, 1, 1, 1, 1,
0.9146521, 1.241807, -1.334866, 1, 1, 1, 1, 1,
0.9156845, -0.5601568, -0.6092688, 1, 1, 1, 1, 1,
0.9166776, 0.1319945, -1.041535, 1, 1, 1, 1, 1,
0.9176917, -1.951152, 2.443702, 1, 1, 1, 1, 1,
0.9239015, -0.897874, 3.552966, 1, 1, 1, 1, 1,
0.9265826, 0.4893436, 1.925364, 1, 1, 1, 1, 1,
0.9271889, -0.5539905, 1.673998, 1, 1, 1, 1, 1,
0.9290034, 0.6569767, 1.258099, 0, 0, 1, 1, 1,
0.9346253, 0.4156733, 1.968242, 1, 0, 0, 1, 1,
0.9349473, -1.598849, 1.368938, 1, 0, 0, 1, 1,
0.939981, 0.882257, -0.6751875, 1, 0, 0, 1, 1,
0.9407991, 0.2195539, -0.01033716, 1, 0, 0, 1, 1,
0.9467111, -1.142821, 3.443343, 1, 0, 0, 1, 1,
0.95249, 0.2145417, 2.156175, 0, 0, 0, 1, 1,
0.9542181, -1.406766, 1.260164, 0, 0, 0, 1, 1,
0.9737232, 0.2819358, 2.134712, 0, 0, 0, 1, 1,
0.9759007, 1.151393, 0.04535165, 0, 0, 0, 1, 1,
0.9779623, -1.087384, 2.589901, 0, 0, 0, 1, 1,
0.9872952, 0.1631964, 3.222335, 0, 0, 0, 1, 1,
0.9916695, -0.7699768, 3.229917, 0, 0, 0, 1, 1,
0.993049, 0.411918, 1.448308, 1, 1, 1, 1, 1,
0.9984097, 1.562732, 2.062694, 1, 1, 1, 1, 1,
1.001843, -0.7810137, 2.802278, 1, 1, 1, 1, 1,
1.01442, 1.147189, -0.02604033, 1, 1, 1, 1, 1,
1.017685, 0.1514778, 0.2334499, 1, 1, 1, 1, 1,
1.021877, 0.5027879, 0.4001978, 1, 1, 1, 1, 1,
1.022633, 1.41345, 1.596808, 1, 1, 1, 1, 1,
1.033062, 0.2136622, 1.337564, 1, 1, 1, 1, 1,
1.036964, -0.2033523, 0.8678472, 1, 1, 1, 1, 1,
1.037343, -0.8794592, 2.689915, 1, 1, 1, 1, 1,
1.04093, 0.07989169, 2.532902, 1, 1, 1, 1, 1,
1.041089, 0.2194451, 2.408425, 1, 1, 1, 1, 1,
1.04543, -0.3550402, 0.8891741, 1, 1, 1, 1, 1,
1.047416, -0.09293733, 1.913525, 1, 1, 1, 1, 1,
1.053293, -0.5811195, 0.6891882, 1, 1, 1, 1, 1,
1.054073, -0.1357737, 0.3774094, 0, 0, 1, 1, 1,
1.056548, 0.1988073, -1.528868, 1, 0, 0, 1, 1,
1.056736, 1.244007, 1.633735, 1, 0, 0, 1, 1,
1.070014, -0.6208988, 2.530877, 1, 0, 0, 1, 1,
1.07484, 1.337682, 0.4259035, 1, 0, 0, 1, 1,
1.076691, 0.4844956, 1.837635, 1, 0, 0, 1, 1,
1.077228, -1.518106, 2.216421, 0, 0, 0, 1, 1,
1.077914, 1.366023, -0.3868303, 0, 0, 0, 1, 1,
1.084975, 1.04525, 3.157268, 0, 0, 0, 1, 1,
1.089724, -2.234097, 4.028048, 0, 0, 0, 1, 1,
1.096786, -0.4415412, 2.624612, 0, 0, 0, 1, 1,
1.103226, -1.124666, 2.36742, 0, 0, 0, 1, 1,
1.110229, -0.2949902, 0.4352655, 0, 0, 0, 1, 1,
1.116094, 1.321702, 0.04789282, 1, 1, 1, 1, 1,
1.124298, -0.8803226, 1.639472, 1, 1, 1, 1, 1,
1.129517, 0.587853, -0.8168851, 1, 1, 1, 1, 1,
1.135393, -1.033318, 2.730374, 1, 1, 1, 1, 1,
1.155115, 0.1881821, 1.760753, 1, 1, 1, 1, 1,
1.159156, 1.75108, 2.145022, 1, 1, 1, 1, 1,
1.165901, -1.326592, 2.191997, 1, 1, 1, 1, 1,
1.198773, 0.7046204, 0.07558185, 1, 1, 1, 1, 1,
1.205384, 0.7463863, 1.235963, 1, 1, 1, 1, 1,
1.217579, 0.06447872, 1.737383, 1, 1, 1, 1, 1,
1.218488, 1.550636, 3.195312, 1, 1, 1, 1, 1,
1.226579, 0.2374067, 2.73003, 1, 1, 1, 1, 1,
1.227341, -0.7091375, 2.813379, 1, 1, 1, 1, 1,
1.22747, -1.037254, 3.288474, 1, 1, 1, 1, 1,
1.237863, 0.06114137, 1.21013, 1, 1, 1, 1, 1,
1.253035, 2.397313, -0.5329577, 0, 0, 1, 1, 1,
1.256397, 0.2599228, 0.5131258, 1, 0, 0, 1, 1,
1.258382, -1.86094, 3.020221, 1, 0, 0, 1, 1,
1.262735, 0.8578752, -0.7530922, 1, 0, 0, 1, 1,
1.265154, 1.048588, 0.906803, 1, 0, 0, 1, 1,
1.265698, -0.3666573, 2.634495, 1, 0, 0, 1, 1,
1.266706, 0.2785577, 2.187249, 0, 0, 0, 1, 1,
1.27402, -0.1092111, 2.469507, 0, 0, 0, 1, 1,
1.275997, 0.03952615, 2.95222, 0, 0, 0, 1, 1,
1.282279, 0.4850146, -1.593212, 0, 0, 0, 1, 1,
1.290715, -1.360073, 2.308202, 0, 0, 0, 1, 1,
1.299094, 2.118097, 1.144929, 0, 0, 0, 1, 1,
1.299989, 1.491603, 0.4100185, 0, 0, 0, 1, 1,
1.302767, -0.6480531, 1.40904, 1, 1, 1, 1, 1,
1.307894, -0.9118638, 2.901012, 1, 1, 1, 1, 1,
1.308639, -0.3404348, 1.102692, 1, 1, 1, 1, 1,
1.31825, -0.2184268, 3.546777, 1, 1, 1, 1, 1,
1.329401, 1.151419, 0.553395, 1, 1, 1, 1, 1,
1.333875, 0.4338526, 1.885673, 1, 1, 1, 1, 1,
1.33587, -0.2336711, 0.9933258, 1, 1, 1, 1, 1,
1.342459, -1.12178, 1.736379, 1, 1, 1, 1, 1,
1.353449, 1.277425, 1.472942, 1, 1, 1, 1, 1,
1.381681, 1.209823, -0.8480175, 1, 1, 1, 1, 1,
1.385967, -0.4199725, 2.177569, 1, 1, 1, 1, 1,
1.403303, 3.156858, 2.378365, 1, 1, 1, 1, 1,
1.407083, 1.169117, -0.08437527, 1, 1, 1, 1, 1,
1.411008, -0.08627001, 2.439194, 1, 1, 1, 1, 1,
1.41128, 1.690529, -0.2966218, 1, 1, 1, 1, 1,
1.43396, 0.0498693, 3.021549, 0, 0, 1, 1, 1,
1.434025, -1.686999, 2.591263, 1, 0, 0, 1, 1,
1.456586, -1.319897, 3.953469, 1, 0, 0, 1, 1,
1.457032, 0.3785, 0.4535915, 1, 0, 0, 1, 1,
1.465814, -0.809388, 2.070955, 1, 0, 0, 1, 1,
1.471315, 0.08093643, 2.495179, 1, 0, 0, 1, 1,
1.477749, 0.1961993, 1.354426, 0, 0, 0, 1, 1,
1.507262, -0.6602289, 0.6872526, 0, 0, 0, 1, 1,
1.514904, 0.3016656, 1.364637, 0, 0, 0, 1, 1,
1.516102, 0.2901351, 1.879233, 0, 0, 0, 1, 1,
1.53151, 0.8303351, 0.8032427, 0, 0, 0, 1, 1,
1.545287, 0.08879774, 1.109066, 0, 0, 0, 1, 1,
1.545691, -1.151526, 3.687596, 0, 0, 0, 1, 1,
1.558333, -0.3780212, 2.298644, 1, 1, 1, 1, 1,
1.563642, 0.07481182, 0.8690163, 1, 1, 1, 1, 1,
1.567387, -0.9686662, 3.160038, 1, 1, 1, 1, 1,
1.568728, 0.8849491, 2.244632, 1, 1, 1, 1, 1,
1.579793, 1.381201, -0.1097537, 1, 1, 1, 1, 1,
1.585799, -1.762891, 3.033455, 1, 1, 1, 1, 1,
1.59493, 0.6665973, 1.457101, 1, 1, 1, 1, 1,
1.603189, 0.508983, 1.810267, 1, 1, 1, 1, 1,
1.604933, 0.1535719, -0.6149697, 1, 1, 1, 1, 1,
1.60747, -1.14484, 1.974164, 1, 1, 1, 1, 1,
1.614765, 0.2921237, 0.8882131, 1, 1, 1, 1, 1,
1.629365, -0.9040914, 2.493126, 1, 1, 1, 1, 1,
1.630271, -0.6470366, 2.977498, 1, 1, 1, 1, 1,
1.651865, -0.3156916, 1.48727, 1, 1, 1, 1, 1,
1.651956, -0.0414748, 2.566556, 1, 1, 1, 1, 1,
1.677498, 0.5116524, 1.26555, 0, 0, 1, 1, 1,
1.678747, 1.414438, -0.8733616, 1, 0, 0, 1, 1,
1.67948, -0.9720457, 2.654832, 1, 0, 0, 1, 1,
1.699419, 0.3864387, 1.417102, 1, 0, 0, 1, 1,
1.733628, 0.4915026, -0.4790943, 1, 0, 0, 1, 1,
1.733657, 0.6193643, 0.9105478, 1, 0, 0, 1, 1,
1.759994, 1.322929, 0.9038032, 0, 0, 0, 1, 1,
1.798063, -0.1396186, 0.8826844, 0, 0, 0, 1, 1,
1.801223, -0.05700051, 0.3909085, 0, 0, 0, 1, 1,
1.810124, 0.2217235, -0.1105538, 0, 0, 0, 1, 1,
1.810355, -0.3025924, 0.5014697, 0, 0, 0, 1, 1,
1.822677, -0.6806937, 2.872301, 0, 0, 0, 1, 1,
1.868561, 0.03724478, 1.821257, 0, 0, 0, 1, 1,
1.893475, 0.3289096, 0.05716406, 1, 1, 1, 1, 1,
1.897345, 0.9685785, 1.103764, 1, 1, 1, 1, 1,
1.924948, 0.5037938, 1.632815, 1, 1, 1, 1, 1,
1.934246, -0.2362956, 2.316498, 1, 1, 1, 1, 1,
1.939772, -0.2047678, 3.134869, 1, 1, 1, 1, 1,
1.949601, -0.5784035, 1.597596, 1, 1, 1, 1, 1,
1.952463, -0.7432737, 2.902028, 1, 1, 1, 1, 1,
1.958647, 0.9478843, 1.739472, 1, 1, 1, 1, 1,
1.990769, 0.3107043, 0.7091265, 1, 1, 1, 1, 1,
2.006782, -0.7637895, 1.927363, 1, 1, 1, 1, 1,
2.010616, -0.02043326, -0.4710228, 1, 1, 1, 1, 1,
2.018888, 0.09326732, 3.099076, 1, 1, 1, 1, 1,
2.022924, -0.4331735, 0.4699925, 1, 1, 1, 1, 1,
2.028167, -1.022146, 2.414433, 1, 1, 1, 1, 1,
2.030613, -2.212054, 1.991315, 1, 1, 1, 1, 1,
2.056334, -0.170131, 1.191491, 0, 0, 1, 1, 1,
2.080953, 0.8283852, 2.764327, 1, 0, 0, 1, 1,
2.081256, 0.1802526, 1.038093, 1, 0, 0, 1, 1,
2.161097, -1.017223, 1.31037, 1, 0, 0, 1, 1,
2.163709, 0.4340295, 1.2955, 1, 0, 0, 1, 1,
2.170854, -0.8294652, 2.218704, 1, 0, 0, 1, 1,
2.185961, 0.7700961, -0.2098778, 0, 0, 0, 1, 1,
2.209862, 0.3892028, 0.914719, 0, 0, 0, 1, 1,
2.238109, -1.219894, 1.857747, 0, 0, 0, 1, 1,
2.239281, -0.7403113, 4.063411, 0, 0, 0, 1, 1,
2.253281, 0.06790861, 0.4420112, 0, 0, 0, 1, 1,
2.297074, -0.2764962, 0.7206665, 0, 0, 0, 1, 1,
2.352036, 2.43982, 1.182928, 0, 0, 0, 1, 1,
2.41749, 1.671625, 0.4007033, 1, 1, 1, 1, 1,
2.43496, -0.3441944, 2.50188, 1, 1, 1, 1, 1,
2.550317, -0.5920601, 1.531796, 1, 1, 1, 1, 1,
2.564517, 1.308834, -1.686035, 1, 1, 1, 1, 1,
2.625222, -0.5399215, 2.437074, 1, 1, 1, 1, 1,
2.672002, 0.2501002, 2.72057, 1, 1, 1, 1, 1,
2.798327, -1.039524, 3.502245, 1, 1, 1, 1, 1
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
var radius = 10.01017;
var distance = 35.16028;
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
mvMatrix.translate( 0.4691422, 0.155864, 0.1578043 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.16028);
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
