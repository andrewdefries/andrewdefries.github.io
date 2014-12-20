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
-3.201705, -0.1016521, -0.4388985, 1, 0, 0, 1,
-2.752934, -0.6777931, -3.148812, 1, 0.007843138, 0, 1,
-2.666235, -0.8930938, -2.648411, 1, 0.01176471, 0, 1,
-2.524858, 0.3731946, -2.638495, 1, 0.01960784, 0, 1,
-2.477177, -0.2826268, 0.4388384, 1, 0.02352941, 0, 1,
-2.409942, -0.7314121, -0.4261184, 1, 0.03137255, 0, 1,
-2.381377, -0.3643116, -0.5358333, 1, 0.03529412, 0, 1,
-2.32081, -0.289108, -2.789511, 1, 0.04313726, 0, 1,
-2.300242, 0.2307997, -1.900113, 1, 0.04705882, 0, 1,
-2.2955, 0.8967162, -0.8199545, 1, 0.05490196, 0, 1,
-2.279382, -0.2223593, -1.289285, 1, 0.05882353, 0, 1,
-2.26488, 0.8381127, -1.229219, 1, 0.06666667, 0, 1,
-2.240334, -0.9522927, -0.8239481, 1, 0.07058824, 0, 1,
-2.209512, -0.9187359, -1.073714, 1, 0.07843138, 0, 1,
-2.191146, -0.788044, -3.528556, 1, 0.08235294, 0, 1,
-2.180813, -0.1378934, -1.682459, 1, 0.09019608, 0, 1,
-2.077344, 0.239614, -0.2644087, 1, 0.09411765, 0, 1,
-2.077188, 1.028079, -1.242395, 1, 0.1019608, 0, 1,
-2.065909, -0.02139371, -2.99419, 1, 0.1098039, 0, 1,
-2.059495, 0.824286, -0.8190687, 1, 0.1137255, 0, 1,
-2.04568, -0.3994454, -1.737751, 1, 0.1215686, 0, 1,
-2.029065, -0.1543098, -1.890349, 1, 0.1254902, 0, 1,
-2.022387, 0.6259907, -0.5210579, 1, 0.1333333, 0, 1,
-2.014345, -0.325936, -1.396119, 1, 0.1372549, 0, 1,
-2.007583, 0.6439149, -0.9592574, 1, 0.145098, 0, 1,
-1.987848, -0.8850465, -2.125907, 1, 0.1490196, 0, 1,
-1.961786, 0.3223479, -0.6964907, 1, 0.1568628, 0, 1,
-1.956001, -1.174613, -2.313935, 1, 0.1607843, 0, 1,
-1.954053, -1.076449, -0.8919152, 1, 0.1686275, 0, 1,
-1.918796, -0.3203712, -2.527404, 1, 0.172549, 0, 1,
-1.884136, 0.8767387, -2.054512, 1, 0.1803922, 0, 1,
-1.880308, -0.2792236, -1.088394, 1, 0.1843137, 0, 1,
-1.875953, 0.2584503, -1.469007, 1, 0.1921569, 0, 1,
-1.864389, 0.8192165, -0.4815408, 1, 0.1960784, 0, 1,
-1.862303, 1.268323, -0.9540469, 1, 0.2039216, 0, 1,
-1.851851, 0.09423874, -0.8898259, 1, 0.2117647, 0, 1,
-1.817435, 0.08285571, -2.021594, 1, 0.2156863, 0, 1,
-1.81649, 0.0008211141, -2.876736, 1, 0.2235294, 0, 1,
-1.811053, -0.9877821, -1.904175, 1, 0.227451, 0, 1,
-1.796373, -1.464001, -1.711495, 1, 0.2352941, 0, 1,
-1.778303, 1.49796, -0.5147119, 1, 0.2392157, 0, 1,
-1.775923, -0.8417605, -3.123665, 1, 0.2470588, 0, 1,
-1.735878, -1.047423, -2.681038, 1, 0.2509804, 0, 1,
-1.726602, -1.864974, -0.9531888, 1, 0.2588235, 0, 1,
-1.724662, -1.406612, -2.419307, 1, 0.2627451, 0, 1,
-1.693531, 1.371616, -0.2288524, 1, 0.2705882, 0, 1,
-1.678134, 0.2108899, -3.144921, 1, 0.2745098, 0, 1,
-1.66957, -0.2281117, -2.055347, 1, 0.282353, 0, 1,
-1.666443, -0.9300897, -1.814428, 1, 0.2862745, 0, 1,
-1.66514, 1.816669, -1.625677, 1, 0.2941177, 0, 1,
-1.662923, -0.562473, -3.037057, 1, 0.3019608, 0, 1,
-1.642812, 0.1496237, -1.027797, 1, 0.3058824, 0, 1,
-1.634336, -0.6360284, -1.167965, 1, 0.3137255, 0, 1,
-1.623035, 0.02509195, -1.74741, 1, 0.3176471, 0, 1,
-1.598708, 0.2041522, -1.49355, 1, 0.3254902, 0, 1,
-1.590599, 0.6210191, -1.303933, 1, 0.3294118, 0, 1,
-1.584672, 1.499981, -0.1953045, 1, 0.3372549, 0, 1,
-1.575298, 2.226876, -2.31395, 1, 0.3411765, 0, 1,
-1.563468, -0.5651999, -3.097304, 1, 0.3490196, 0, 1,
-1.562498, 2.474973, 0.5188587, 1, 0.3529412, 0, 1,
-1.550441, -0.2058729, -1.792619, 1, 0.3607843, 0, 1,
-1.541336, 1.826603, -1.508657, 1, 0.3647059, 0, 1,
-1.533421, -0.9219579, -1.387182, 1, 0.372549, 0, 1,
-1.520091, -0.2602646, -1.120067, 1, 0.3764706, 0, 1,
-1.519589, -1.569133, -3.452636, 1, 0.3843137, 0, 1,
-1.517107, -0.9730408, -2.171304, 1, 0.3882353, 0, 1,
-1.51328, 1.641744, -1.227985, 1, 0.3960784, 0, 1,
-1.506126, -0.7281841, -2.973078, 1, 0.4039216, 0, 1,
-1.502395, -0.522736, -0.9101674, 1, 0.4078431, 0, 1,
-1.502156, 0.7126001, -1.767331, 1, 0.4156863, 0, 1,
-1.496837, 0.522804, 0.373924, 1, 0.4196078, 0, 1,
-1.470623, 0.6639391, -0.7093477, 1, 0.427451, 0, 1,
-1.468819, 1.235095, -0.943951, 1, 0.4313726, 0, 1,
-1.443183, -0.9316251, -3.745652, 1, 0.4392157, 0, 1,
-1.441027, -2.283367, -2.686052, 1, 0.4431373, 0, 1,
-1.431653, 0.05367827, -1.730304, 1, 0.4509804, 0, 1,
-1.430755, 0.1223634, -1.965695, 1, 0.454902, 0, 1,
-1.428184, -0.2785582, -1.349878, 1, 0.4627451, 0, 1,
-1.415247, 0.9541091, -2.623776, 1, 0.4666667, 0, 1,
-1.4127, 0.5730556, -2.602486, 1, 0.4745098, 0, 1,
-1.410887, 1.352193, 0.8075726, 1, 0.4784314, 0, 1,
-1.40864, 0.8519408, -2.513904, 1, 0.4862745, 0, 1,
-1.40632, -0.8379334, -1.024901, 1, 0.4901961, 0, 1,
-1.403094, -0.8855564, -3.061007, 1, 0.4980392, 0, 1,
-1.399697, 2.384132, -2.309987, 1, 0.5058824, 0, 1,
-1.398243, 0.4474436, -1.225653, 1, 0.509804, 0, 1,
-1.390288, -0.4290773, -1.345339, 1, 0.5176471, 0, 1,
-1.390051, -1.16981, -1.252424, 1, 0.5215687, 0, 1,
-1.375293, -0.08768894, -0.7735012, 1, 0.5294118, 0, 1,
-1.363904, -0.4203311, -0.767568, 1, 0.5333334, 0, 1,
-1.357253, -0.80911, -1.23271, 1, 0.5411765, 0, 1,
-1.356961, -0.9128454, -2.279144, 1, 0.5450981, 0, 1,
-1.350509, -0.8177631, -3.155689, 1, 0.5529412, 0, 1,
-1.348773, -0.9225508, -2.388197, 1, 0.5568628, 0, 1,
-1.345718, -1.468934, -1.567099, 1, 0.5647059, 0, 1,
-1.341053, -1.18062, -3.702046, 1, 0.5686275, 0, 1,
-1.323073, 0.767348, -1.263279, 1, 0.5764706, 0, 1,
-1.322743, -1.037666, -1.334865, 1, 0.5803922, 0, 1,
-1.314838, 0.8340144, -3.297191, 1, 0.5882353, 0, 1,
-1.310082, -0.2725825, -2.16445, 1, 0.5921569, 0, 1,
-1.300175, 0.2805408, -0.2497047, 1, 0.6, 0, 1,
-1.296002, -1.181336, -2.933338, 1, 0.6078432, 0, 1,
-1.294811, 2.22537, -0.3197965, 1, 0.6117647, 0, 1,
-1.29388, -0.4723461, -0.9993391, 1, 0.6196079, 0, 1,
-1.293341, -1.22866, -2.794985, 1, 0.6235294, 0, 1,
-1.287117, -2.110885, -2.528712, 1, 0.6313726, 0, 1,
-1.285464, 1.468929, -0.4675565, 1, 0.6352941, 0, 1,
-1.284019, 0.7625469, -1.778387, 1, 0.6431373, 0, 1,
-1.283017, -0.9936356, -1.285075, 1, 0.6470588, 0, 1,
-1.272639, -0.3580821, -2.184018, 1, 0.654902, 0, 1,
-1.270657, 0.04656787, -2.463841, 1, 0.6588235, 0, 1,
-1.265586, 0.4675128, -1.143745, 1, 0.6666667, 0, 1,
-1.255774, -0.9345533, -1.87219, 1, 0.6705883, 0, 1,
-1.253348, -1.396631, -2.513801, 1, 0.6784314, 0, 1,
-1.253189, 0.6052063, -1.235445, 1, 0.682353, 0, 1,
-1.251889, 2.001975, -0.1678654, 1, 0.6901961, 0, 1,
-1.250718, -0.7961427, -2.824805, 1, 0.6941177, 0, 1,
-1.249688, 0.1038059, -3.065041, 1, 0.7019608, 0, 1,
-1.238965, -0.4020314, -1.928057, 1, 0.7098039, 0, 1,
-1.232636, 0.2326768, -1.24338, 1, 0.7137255, 0, 1,
-1.230872, 1.158984, -1.554679, 1, 0.7215686, 0, 1,
-1.229314, -0.05520517, -0.9059083, 1, 0.7254902, 0, 1,
-1.225486, 0.718525, -1.601128, 1, 0.7333333, 0, 1,
-1.220764, 0.3895506, -0.8295897, 1, 0.7372549, 0, 1,
-1.220647, -2.128011, -2.474027, 1, 0.7450981, 0, 1,
-1.217299, 0.2719721, -2.012845, 1, 0.7490196, 0, 1,
-1.216662, 0.1769744, -1.114908, 1, 0.7568628, 0, 1,
-1.20523, -0.04407278, -4.907611, 1, 0.7607843, 0, 1,
-1.203148, -0.3116407, -2.198026, 1, 0.7686275, 0, 1,
-1.200913, -0.8972329, -3.502303, 1, 0.772549, 0, 1,
-1.19236, 1.012174, -0.3941483, 1, 0.7803922, 0, 1,
-1.189429, 0.7559009, -0.02279755, 1, 0.7843137, 0, 1,
-1.186403, -1.17103, -0.9569545, 1, 0.7921569, 0, 1,
-1.176792, 0.9184082, -1.399613, 1, 0.7960784, 0, 1,
-1.175768, -0.3981618, -2.94913, 1, 0.8039216, 0, 1,
-1.174132, 0.5362988, -1.404551, 1, 0.8117647, 0, 1,
-1.165235, -0.3651772, -2.673099, 1, 0.8156863, 0, 1,
-1.14974, 0.1279772, -2.23967, 1, 0.8235294, 0, 1,
-1.149387, -0.07786275, -2.272348, 1, 0.827451, 0, 1,
-1.147138, -1.035053, -2.57546, 1, 0.8352941, 0, 1,
-1.13782, -0.1732536, -3.789834, 1, 0.8392157, 0, 1,
-1.137186, 1.546822, 0.4268395, 1, 0.8470588, 0, 1,
-1.13542, -0.3133343, -0.8306442, 1, 0.8509804, 0, 1,
-1.135276, -0.6728796, -0.1661439, 1, 0.8588235, 0, 1,
-1.12735, 1.178727, -0.4395892, 1, 0.8627451, 0, 1,
-1.118996, -1.17455, -1.037686, 1, 0.8705882, 0, 1,
-1.114956, 0.4050216, -0.4031549, 1, 0.8745098, 0, 1,
-1.105348, 2.052465, -0.5133134, 1, 0.8823529, 0, 1,
-1.100079, 0.3597071, -0.1682446, 1, 0.8862745, 0, 1,
-1.09985, 0.4000936, -2.523467, 1, 0.8941177, 0, 1,
-1.099208, 1.096909, -1.861268, 1, 0.8980392, 0, 1,
-1.098728, -0.07429423, -0.9765731, 1, 0.9058824, 0, 1,
-1.094925, -0.1415784, -4.110847, 1, 0.9137255, 0, 1,
-1.093347, -0.486632, -2.823848, 1, 0.9176471, 0, 1,
-1.089794, 0.1388549, -1.171296, 1, 0.9254902, 0, 1,
-1.074356, -1.22773, -0.6606095, 1, 0.9294118, 0, 1,
-1.060641, -1.093575, -3.204236, 1, 0.9372549, 0, 1,
-1.052564, 0.8896723, 1.32424, 1, 0.9411765, 0, 1,
-1.052087, -0.574746, -1.604311, 1, 0.9490196, 0, 1,
-1.050826, 1.13507, -1.188429, 1, 0.9529412, 0, 1,
-1.038469, -0.1680944, -1.33635, 1, 0.9607843, 0, 1,
-1.034922, 0.2876359, 0.1068047, 1, 0.9647059, 0, 1,
-1.034843, -0.08327721, -2.119316, 1, 0.972549, 0, 1,
-1.034535, 0.8047737, -1.385232, 1, 0.9764706, 0, 1,
-1.027877, 0.7718349, -2.35342, 1, 0.9843137, 0, 1,
-1.026774, 0.5815127, -0.1878598, 1, 0.9882353, 0, 1,
-1.022069, -1.485524, -2.54087, 1, 0.9960784, 0, 1,
-1.016728, 0.08419529, -4.641245, 0.9960784, 1, 0, 1,
-1.010769, -0.9788584, -5.632938, 0.9921569, 1, 0, 1,
-1.002259, 1.17943, -1.531286, 0.9843137, 1, 0, 1,
-0.9973195, -0.6911169, -1.098281, 0.9803922, 1, 0, 1,
-0.996382, -0.306543, -2.720453, 0.972549, 1, 0, 1,
-0.9918275, 0.1943934, -1.150617, 0.9686275, 1, 0, 1,
-0.9906878, 0.8907145, 0.1070288, 0.9607843, 1, 0, 1,
-0.9882447, -0.9895734, -0.9957632, 0.9568627, 1, 0, 1,
-0.9867043, 1.332603, -0.1495267, 0.9490196, 1, 0, 1,
-0.980488, 0.411599, 0.01673563, 0.945098, 1, 0, 1,
-0.9791428, 0.295948, -2.001316, 0.9372549, 1, 0, 1,
-0.9791346, 0.1601306, 0.239718, 0.9333333, 1, 0, 1,
-0.9777352, 0.5902234, -1.274197, 0.9254902, 1, 0, 1,
-0.9731314, -1.418278, -2.115912, 0.9215686, 1, 0, 1,
-0.9697714, 0.3214916, -0.9847135, 0.9137255, 1, 0, 1,
-0.9691844, 0.1701928, -2.72971, 0.9098039, 1, 0, 1,
-0.9677728, -0.04826543, -1.869035, 0.9019608, 1, 0, 1,
-0.9636236, -2.179355, -2.308329, 0.8941177, 1, 0, 1,
-0.9593546, -0.9709591, -2.17283, 0.8901961, 1, 0, 1,
-0.9585465, -1.712178, -2.142318, 0.8823529, 1, 0, 1,
-0.9580253, -0.1843244, -1.667777, 0.8784314, 1, 0, 1,
-0.9474932, -0.5119324, -2.154791, 0.8705882, 1, 0, 1,
-0.9371222, -1.247128, -1.805635, 0.8666667, 1, 0, 1,
-0.9308093, 1.021395, -0.8592331, 0.8588235, 1, 0, 1,
-0.9226751, -2.158287, -3.696685, 0.854902, 1, 0, 1,
-0.9185209, 0.197513, 0.5376687, 0.8470588, 1, 0, 1,
-0.9174673, 1.715268, -2.018473, 0.8431373, 1, 0, 1,
-0.9167732, -1.485757, -2.538179, 0.8352941, 1, 0, 1,
-0.9141024, 1.329907, 2.116805, 0.8313726, 1, 0, 1,
-0.9096889, 0.5019746, -2.190976, 0.8235294, 1, 0, 1,
-0.9078399, -0.2944968, -0.9941007, 0.8196079, 1, 0, 1,
-0.9060994, -1.314522, -2.92988, 0.8117647, 1, 0, 1,
-0.9037483, -0.9068452, -1.021321, 0.8078431, 1, 0, 1,
-0.9021534, -1.419424, -3.144336, 0.8, 1, 0, 1,
-0.896684, 2.059834, -0.3750179, 0.7921569, 1, 0, 1,
-0.8965733, -1.176087, -2.21229, 0.7882353, 1, 0, 1,
-0.8901476, 0.05473038, -3.485569, 0.7803922, 1, 0, 1,
-0.8877352, -1.16604, -3.609331, 0.7764706, 1, 0, 1,
-0.8860859, 0.6137774, -2.040428, 0.7686275, 1, 0, 1,
-0.8839965, 0.2347429, -1.596096, 0.7647059, 1, 0, 1,
-0.8773248, -0.6194114, -1.563256, 0.7568628, 1, 0, 1,
-0.8704419, 0.4469784, -2.796651, 0.7529412, 1, 0, 1,
-0.867829, 0.2801912, -0.8368488, 0.7450981, 1, 0, 1,
-0.8656802, 0.9750871, -1.637478, 0.7411765, 1, 0, 1,
-0.8626592, -0.7070168, -4.767371, 0.7333333, 1, 0, 1,
-0.8562872, -1.682686, -2.67565, 0.7294118, 1, 0, 1,
-0.8545724, 0.8926767, -3.25127, 0.7215686, 1, 0, 1,
-0.8460956, -1.047861, -1.932303, 0.7176471, 1, 0, 1,
-0.8453158, 0.6429828, -1.65626, 0.7098039, 1, 0, 1,
-0.8426276, 0.4096338, -0.7017476, 0.7058824, 1, 0, 1,
-0.8419597, -1.135208, -3.070842, 0.6980392, 1, 0, 1,
-0.8412066, 0.2476479, 0.1580627, 0.6901961, 1, 0, 1,
-0.8398796, 0.14371, -0.6928618, 0.6862745, 1, 0, 1,
-0.8388994, 0.1284773, -1.840546, 0.6784314, 1, 0, 1,
-0.8356389, 1.57, -0.9490207, 0.6745098, 1, 0, 1,
-0.8340303, -0.5026005, -0.98369, 0.6666667, 1, 0, 1,
-0.8318016, -0.04815227, -2.066691, 0.6627451, 1, 0, 1,
-0.8312089, 0.07039025, 0.7378939, 0.654902, 1, 0, 1,
-0.8234175, 0.6974917, -1.792758, 0.6509804, 1, 0, 1,
-0.81762, 0.4306288, 0.6893228, 0.6431373, 1, 0, 1,
-0.8170335, 0.494289, 0.8324444, 0.6392157, 1, 0, 1,
-0.8160402, -0.3182359, -2.432645, 0.6313726, 1, 0, 1,
-0.8120118, 1.06642, -1.389924, 0.627451, 1, 0, 1,
-0.8098654, -1.991864, -3.181393, 0.6196079, 1, 0, 1,
-0.8048189, 0.1965829, -1.825357, 0.6156863, 1, 0, 1,
-0.8022006, 1.428867, -1.459517, 0.6078432, 1, 0, 1,
-0.8012838, 0.07061701, -2.150189, 0.6039216, 1, 0, 1,
-0.796425, 0.4000996, -0.904517, 0.5960785, 1, 0, 1,
-0.7959938, 1.298187, -0.1893642, 0.5882353, 1, 0, 1,
-0.7944052, -0.2733072, -1.515471, 0.5843138, 1, 0, 1,
-0.7943344, 0.74921, -0.3906858, 0.5764706, 1, 0, 1,
-0.79177, 2.020146, -2.623133, 0.572549, 1, 0, 1,
-0.7905962, -0.2883595, -0.4406763, 0.5647059, 1, 0, 1,
-0.7902788, -0.4767855, -1.867548, 0.5607843, 1, 0, 1,
-0.7830742, 0.5914756, -1.376613, 0.5529412, 1, 0, 1,
-0.774873, -1.557313, -2.414611, 0.5490196, 1, 0, 1,
-0.7690783, -0.608366, -1.751658, 0.5411765, 1, 0, 1,
-0.7651809, 0.06580482, -0.715481, 0.5372549, 1, 0, 1,
-0.763645, -0.4044047, -3.865772, 0.5294118, 1, 0, 1,
-0.7534704, -0.1985157, -0.3424644, 0.5254902, 1, 0, 1,
-0.7494559, 1.622646, -1.361542, 0.5176471, 1, 0, 1,
-0.7489011, -0.1968915, -1.500291, 0.5137255, 1, 0, 1,
-0.7460434, -1.493247, -2.753417, 0.5058824, 1, 0, 1,
-0.7417674, -0.2313421, -0.2271156, 0.5019608, 1, 0, 1,
-0.7379037, 0.6450202, -1.739388, 0.4941176, 1, 0, 1,
-0.7334635, -1.058491, -2.153484, 0.4862745, 1, 0, 1,
-0.7279446, 0.7864144, -2.05327, 0.4823529, 1, 0, 1,
-0.7191131, -1.432652, -2.891876, 0.4745098, 1, 0, 1,
-0.7151366, -0.04269374, -2.039576, 0.4705882, 1, 0, 1,
-0.7096369, -0.175084, -1.528265, 0.4627451, 1, 0, 1,
-0.7089306, -0.4063651, -2.61743, 0.4588235, 1, 0, 1,
-0.7070041, 2.208122, -0.4808881, 0.4509804, 1, 0, 1,
-0.7064831, 1.155905, 0.2260815, 0.4470588, 1, 0, 1,
-0.7004026, -2.04671, -2.595875, 0.4392157, 1, 0, 1,
-0.7000777, -1.648143, -1.746692, 0.4352941, 1, 0, 1,
-0.6999214, -1.220262, -3.037624, 0.427451, 1, 0, 1,
-0.698848, -0.1401122, -0.5385464, 0.4235294, 1, 0, 1,
-0.6930252, 0.6389036, 1.709912, 0.4156863, 1, 0, 1,
-0.6871497, 0.219369, -1.090155, 0.4117647, 1, 0, 1,
-0.6857597, -0.5295567, -1.595917, 0.4039216, 1, 0, 1,
-0.6855631, 0.07358524, -2.805978, 0.3960784, 1, 0, 1,
-0.6750129, 1.24988, -0.424516, 0.3921569, 1, 0, 1,
-0.6669062, 0.4558598, -0.3353216, 0.3843137, 1, 0, 1,
-0.6651934, 0.3665773, -1.296555, 0.3803922, 1, 0, 1,
-0.6621804, 0.1266001, -1.959873, 0.372549, 1, 0, 1,
-0.6617222, -1.289412, -2.242826, 0.3686275, 1, 0, 1,
-0.6610007, -1.722308, -3.113975, 0.3607843, 1, 0, 1,
-0.6582831, -1.094003, -3.529274, 0.3568628, 1, 0, 1,
-0.6530832, -1.13918, -3.744254, 0.3490196, 1, 0, 1,
-0.6441067, 0.2795254, -3.492639, 0.345098, 1, 0, 1,
-0.6434613, -0.6346192, -0.7091951, 0.3372549, 1, 0, 1,
-0.64318, 0.7283746, -1.672098, 0.3333333, 1, 0, 1,
-0.6358904, 1.630586, -0.6055174, 0.3254902, 1, 0, 1,
-0.6352826, 0.4595162, -1.365108, 0.3215686, 1, 0, 1,
-0.6328697, -0.6700277, -2.467865, 0.3137255, 1, 0, 1,
-0.632452, -0.7684839, -2.284695, 0.3098039, 1, 0, 1,
-0.6320513, -0.07688278, -2.231098, 0.3019608, 1, 0, 1,
-0.630922, -0.5239941, -0.4774196, 0.2941177, 1, 0, 1,
-0.6307524, 0.07447028, -2.075591, 0.2901961, 1, 0, 1,
-0.6272163, 1.852051, -1.359849, 0.282353, 1, 0, 1,
-0.6272084, 1.105087, -1.899278, 0.2784314, 1, 0, 1,
-0.6270783, 1.487397, 1.307781, 0.2705882, 1, 0, 1,
-0.6259556, 0.3501669, 0.1535301, 0.2666667, 1, 0, 1,
-0.6228868, 1.056054, -0.9239779, 0.2588235, 1, 0, 1,
-0.6181917, 0.5705071, -0.2805305, 0.254902, 1, 0, 1,
-0.6113002, -1.130931, -1.037056, 0.2470588, 1, 0, 1,
-0.6107451, 0.2262032, -2.192626, 0.2431373, 1, 0, 1,
-0.6080828, 1.689451, 0.5368016, 0.2352941, 1, 0, 1,
-0.601348, 0.5226366, -1.481496, 0.2313726, 1, 0, 1,
-0.5983331, -0.5274296, -2.368644, 0.2235294, 1, 0, 1,
-0.5897469, -0.3577446, -3.052003, 0.2196078, 1, 0, 1,
-0.5877241, 1.110309, -0.2996845, 0.2117647, 1, 0, 1,
-0.5806006, 1.268436, -1.271431, 0.2078431, 1, 0, 1,
-0.5782405, 1.948924, -0.1950392, 0.2, 1, 0, 1,
-0.5767496, -2.068074, -2.080842, 0.1921569, 1, 0, 1,
-0.5765008, -1.781986, -1.505487, 0.1882353, 1, 0, 1,
-0.5753379, -0.5060238, -2.382905, 0.1803922, 1, 0, 1,
-0.5688401, 0.9683118, 0.9381139, 0.1764706, 1, 0, 1,
-0.5669444, -1.339449, -3.318917, 0.1686275, 1, 0, 1,
-0.5620534, 0.7168252, -1.575314, 0.1647059, 1, 0, 1,
-0.55948, 0.9421619, -1.26559, 0.1568628, 1, 0, 1,
-0.5582685, -0.5931691, -2.307288, 0.1529412, 1, 0, 1,
-0.5563434, 0.3829938, -0.6747068, 0.145098, 1, 0, 1,
-0.5555474, -0.1329715, -1.75247, 0.1411765, 1, 0, 1,
-0.5472867, -1.709425, -4.541348, 0.1333333, 1, 0, 1,
-0.5460818, 0.1284157, -1.997902, 0.1294118, 1, 0, 1,
-0.5440149, -1.765532, -2.292494, 0.1215686, 1, 0, 1,
-0.5395429, 0.3011358, -2.614966, 0.1176471, 1, 0, 1,
-0.5372574, -0.5315806, -2.945239, 0.1098039, 1, 0, 1,
-0.5309438, -0.0351534, -1.798308, 0.1058824, 1, 0, 1,
-0.5280218, -1.133054, -4.148268, 0.09803922, 1, 0, 1,
-0.525968, -0.49871, -0.603924, 0.09019608, 1, 0, 1,
-0.5251469, 0.3568749, -2.208772, 0.08627451, 1, 0, 1,
-0.5179151, -0.9581321, -2.433728, 0.07843138, 1, 0, 1,
-0.5153965, -0.2811804, -2.338547, 0.07450981, 1, 0, 1,
-0.5109539, -0.4151171, -2.349156, 0.06666667, 1, 0, 1,
-0.5108349, 0.6512011, -0.5804209, 0.0627451, 1, 0, 1,
-0.5053752, -0.1091242, -1.370598, 0.05490196, 1, 0, 1,
-0.5041519, -1.788279, -2.252697, 0.05098039, 1, 0, 1,
-0.50063, -0.7014651, -2.630933, 0.04313726, 1, 0, 1,
-0.5001117, -0.6079202, -2.399989, 0.03921569, 1, 0, 1,
-0.4889483, -1.215418, -2.452977, 0.03137255, 1, 0, 1,
-0.487692, -0.5182717, -1.774729, 0.02745098, 1, 0, 1,
-0.4876142, -0.5398607, -2.683866, 0.01960784, 1, 0, 1,
-0.4871978, -0.8276315, -4.283622, 0.01568628, 1, 0, 1,
-0.4862478, 0.2937365, -1.336719, 0.007843138, 1, 0, 1,
-0.4847241, -0.1033899, -1.921637, 0.003921569, 1, 0, 1,
-0.483691, 0.5200627, -0.7473292, 0, 1, 0.003921569, 1,
-0.4794976, -1.375849, -2.960869, 0, 1, 0.01176471, 1,
-0.4794371, 0.6062278, 0.5431966, 0, 1, 0.01568628, 1,
-0.4791234, -2.579129, -2.147582, 0, 1, 0.02352941, 1,
-0.4774854, -0.3626569, -2.693824, 0, 1, 0.02745098, 1,
-0.4767281, 0.8080181, 0.9868916, 0, 1, 0.03529412, 1,
-0.476272, 0.6338083, -0.5042679, 0, 1, 0.03921569, 1,
-0.473644, 1.812876, 0.4165067, 0, 1, 0.04705882, 1,
-0.4729607, 0.5629099, -1.76146, 0, 1, 0.05098039, 1,
-0.4723553, -0.5186823, -1.829242, 0, 1, 0.05882353, 1,
-0.4716459, 0.02155301, -0.5419006, 0, 1, 0.0627451, 1,
-0.4616195, -1.510217, -3.128082, 0, 1, 0.07058824, 1,
-0.4615158, 1.492618, -1.053786, 0, 1, 0.07450981, 1,
-0.4601505, 0.08054652, -2.393714, 0, 1, 0.08235294, 1,
-0.4568313, -0.2486902, -1.422897, 0, 1, 0.08627451, 1,
-0.4559126, 2.004196, -2.344187, 0, 1, 0.09411765, 1,
-0.4503281, 0.7919723, 0.01260104, 0, 1, 0.1019608, 1,
-0.4496818, -0.4325312, -3.089486, 0, 1, 0.1058824, 1,
-0.4494066, -1.55368, -3.510766, 0, 1, 0.1137255, 1,
-0.4467255, -0.4700432, -1.822778, 0, 1, 0.1176471, 1,
-0.4464908, -1.997436, -2.959132, 0, 1, 0.1254902, 1,
-0.4451806, 1.141632, -0.1166141, 0, 1, 0.1294118, 1,
-0.4447647, 1.880598, -0.4633952, 0, 1, 0.1372549, 1,
-0.4430573, 0.2580416, 0.3178218, 0, 1, 0.1411765, 1,
-0.4412264, 1.150002, -0.9507898, 0, 1, 0.1490196, 1,
-0.4380741, 1.396979, 0.005911462, 0, 1, 0.1529412, 1,
-0.4374822, 0.3072433, -1.471181, 0, 1, 0.1607843, 1,
-0.4366889, -0.8978953, -3.408257, 0, 1, 0.1647059, 1,
-0.4325966, 0.6445233, -1.492379, 0, 1, 0.172549, 1,
-0.429927, -0.2115087, -1.936995, 0, 1, 0.1764706, 1,
-0.4256423, -0.1657973, -1.909442, 0, 1, 0.1843137, 1,
-0.4248417, -1.068213, -4.542252, 0, 1, 0.1882353, 1,
-0.4239681, 0.8669647, 0.538583, 0, 1, 0.1960784, 1,
-0.4207297, -0.9847748, -2.182688, 0, 1, 0.2039216, 1,
-0.4185539, 0.1408641, -0.9785542, 0, 1, 0.2078431, 1,
-0.418303, 0.8633264, 0.5195892, 0, 1, 0.2156863, 1,
-0.4148612, 0.3598419, 1.095792, 0, 1, 0.2196078, 1,
-0.4119871, -0.1525599, -2.835084, 0, 1, 0.227451, 1,
-0.4107362, -0.4229584, -1.106973, 0, 1, 0.2313726, 1,
-0.4101919, -0.2310191, -3.842304, 0, 1, 0.2392157, 1,
-0.4053552, 0.3372938, -1.364493, 0, 1, 0.2431373, 1,
-0.4010279, 1.355465, 0.5095153, 0, 1, 0.2509804, 1,
-0.3962498, 1.043869, -1.313095, 0, 1, 0.254902, 1,
-0.3955073, 1.073732, 0.1260641, 0, 1, 0.2627451, 1,
-0.3923103, 0.01212989, -2.020454, 0, 1, 0.2666667, 1,
-0.3886337, 0.09613837, -1.686348, 0, 1, 0.2745098, 1,
-0.3869531, -0.02545151, -2.035393, 0, 1, 0.2784314, 1,
-0.3866556, 2.235719, -0.3085299, 0, 1, 0.2862745, 1,
-0.3862702, 1.348776, -0.9770251, 0, 1, 0.2901961, 1,
-0.3842843, -1.734231, -3.59849, 0, 1, 0.2980392, 1,
-0.3826371, 0.2619312, -1.76119, 0, 1, 0.3058824, 1,
-0.3815193, 0.4695937, 1.583445, 0, 1, 0.3098039, 1,
-0.3813955, -0.3544827, -2.761359, 0, 1, 0.3176471, 1,
-0.3811716, 1.360659, -0.914323, 0, 1, 0.3215686, 1,
-0.3798711, 0.478094, -0.2836756, 0, 1, 0.3294118, 1,
-0.369405, -0.1244971, -1.30418, 0, 1, 0.3333333, 1,
-0.3691993, -0.08184193, -0.7346526, 0, 1, 0.3411765, 1,
-0.3675108, -1.577582, -3.949155, 0, 1, 0.345098, 1,
-0.3659294, 0.8347528, -0.5384219, 0, 1, 0.3529412, 1,
-0.3616399, -0.8749885, -2.278276, 0, 1, 0.3568628, 1,
-0.3588022, 0.1192152, -1.7782, 0, 1, 0.3647059, 1,
-0.3582386, -0.09859596, -0.2866046, 0, 1, 0.3686275, 1,
-0.3514785, 0.7229065, -1.577617, 0, 1, 0.3764706, 1,
-0.3489066, 1.371658, -1.088242, 0, 1, 0.3803922, 1,
-0.3466492, -0.863107, -1.870331, 0, 1, 0.3882353, 1,
-0.3439939, 1.534718, -0.3819557, 0, 1, 0.3921569, 1,
-0.3378197, 0.2800198, -0.04783063, 0, 1, 0.4, 1,
-0.3346196, 1.275544, 1.486202, 0, 1, 0.4078431, 1,
-0.3295444, 0.2423644, 0.1380183, 0, 1, 0.4117647, 1,
-0.3239687, 1.560128, 0.2888704, 0, 1, 0.4196078, 1,
-0.322673, -1.272376, -3.58058, 0, 1, 0.4235294, 1,
-0.3205835, -1.406123, -2.462741, 0, 1, 0.4313726, 1,
-0.3200603, 0.3927526, -1.433991, 0, 1, 0.4352941, 1,
-0.3197573, -0.1686962, -2.272903, 0, 1, 0.4431373, 1,
-0.3094538, 0.02403875, -2.394388, 0, 1, 0.4470588, 1,
-0.3085454, -0.2307408, -3.467699, 0, 1, 0.454902, 1,
-0.3083575, -0.5693908, -2.450762, 0, 1, 0.4588235, 1,
-0.3057931, 1.114667, 0.179772, 0, 1, 0.4666667, 1,
-0.3050126, 1.598904, 0.477771, 0, 1, 0.4705882, 1,
-0.3034953, -0.4433378, -3.250989, 0, 1, 0.4784314, 1,
-0.3034603, 0.3782953, -0.3342089, 0, 1, 0.4823529, 1,
-0.3025247, 0.4338778, 1.1207, 0, 1, 0.4901961, 1,
-0.3020003, -0.5314224, -3.50485, 0, 1, 0.4941176, 1,
-0.291532, 1.662673, -0.9086952, 0, 1, 0.5019608, 1,
-0.2893492, -1.547091, -2.942536, 0, 1, 0.509804, 1,
-0.2891458, 0.2299867, -2.94634, 0, 1, 0.5137255, 1,
-0.2849063, 1.571519, -0.9418132, 0, 1, 0.5215687, 1,
-0.2845486, 0.8626769, 0.8982077, 0, 1, 0.5254902, 1,
-0.2804563, -0.6846544, -2.073868, 0, 1, 0.5333334, 1,
-0.2789448, 0.555433, 1.33453, 0, 1, 0.5372549, 1,
-0.2776073, -0.6899241, -4.736493, 0, 1, 0.5450981, 1,
-0.2758672, -0.2703528, -2.124283, 0, 1, 0.5490196, 1,
-0.2725834, 0.3892973, 0.6678189, 0, 1, 0.5568628, 1,
-0.2695134, 0.1421198, -1.254166, 0, 1, 0.5607843, 1,
-0.2686057, -1.829168, -3.488778, 0, 1, 0.5686275, 1,
-0.2655225, -0.1882422, -2.620376, 0, 1, 0.572549, 1,
-0.2626071, 0.323083, -2.824113, 0, 1, 0.5803922, 1,
-0.2615636, 0.2849732, -1.66917, 0, 1, 0.5843138, 1,
-0.2615203, -0.1249871, -1.556686, 0, 1, 0.5921569, 1,
-0.259426, 0.4370021, -0.5730475, 0, 1, 0.5960785, 1,
-0.2586748, -0.9637918, -1.642783, 0, 1, 0.6039216, 1,
-0.2583338, -0.02065128, -3.3431, 0, 1, 0.6117647, 1,
-0.2574507, 1.076762, -2.281091, 0, 1, 0.6156863, 1,
-0.256184, -1.307478, -3.610475, 0, 1, 0.6235294, 1,
-0.2527052, -0.7706199, -2.929526, 0, 1, 0.627451, 1,
-0.2513705, 0.08293132, -1.929118, 0, 1, 0.6352941, 1,
-0.2507289, 0.0168431, -2.565053, 0, 1, 0.6392157, 1,
-0.2490331, -0.1018772, -3.455533, 0, 1, 0.6470588, 1,
-0.248362, -1.895243, -2.136655, 0, 1, 0.6509804, 1,
-0.2472873, 1.673827, -1.528053, 0, 1, 0.6588235, 1,
-0.2415211, 2.591105, 0.5290473, 0, 1, 0.6627451, 1,
-0.2378791, 1.405453, -2.14429, 0, 1, 0.6705883, 1,
-0.2376429, 0.332729, 0.5246388, 0, 1, 0.6745098, 1,
-0.237048, 1.490398, -1.276115, 0, 1, 0.682353, 1,
-0.2327444, 0.495017, 0.8233077, 0, 1, 0.6862745, 1,
-0.229287, -0.1370408, -1.573252, 0, 1, 0.6941177, 1,
-0.2137373, 1.163605, 1.245836, 0, 1, 0.7019608, 1,
-0.2135741, 1.042776, 0.4143709, 0, 1, 0.7058824, 1,
-0.2129664, -0.0103536, -1.173897, 0, 1, 0.7137255, 1,
-0.2124744, -0.6564501, -4.396415, 0, 1, 0.7176471, 1,
-0.2105603, 0.878192, -0.4935086, 0, 1, 0.7254902, 1,
-0.2078829, -0.03678285, -2.701296, 0, 1, 0.7294118, 1,
-0.2077889, -0.1515858, -2.901305, 0, 1, 0.7372549, 1,
-0.1983276, -3.171585, -4.058633, 0, 1, 0.7411765, 1,
-0.198092, 1.67791, -0.431699, 0, 1, 0.7490196, 1,
-0.1899362, 0.06989338, -0.9222904, 0, 1, 0.7529412, 1,
-0.1890628, 0.3131211, 0.2148524, 0, 1, 0.7607843, 1,
-0.1889815, 1.849462, -0.1961384, 0, 1, 0.7647059, 1,
-0.1877725, 0.3205014, 0.2949676, 0, 1, 0.772549, 1,
-0.184934, 0.5682058, -1.252828, 0, 1, 0.7764706, 1,
-0.183825, 0.2483188, -0.8872964, 0, 1, 0.7843137, 1,
-0.1778289, 0.852417, -1.223727, 0, 1, 0.7882353, 1,
-0.1765975, -0.4166871, -2.049433, 0, 1, 0.7960784, 1,
-0.1726218, -0.5326452, -3.108841, 0, 1, 0.8039216, 1,
-0.172398, 0.8385466, -1.69341, 0, 1, 0.8078431, 1,
-0.1691085, 0.628574, 0.6780528, 0, 1, 0.8156863, 1,
-0.1690387, 0.5390899, -0.6054822, 0, 1, 0.8196079, 1,
-0.1657057, 1.170057, 0.02227891, 0, 1, 0.827451, 1,
-0.1649767, -0.2632834, -3.138485, 0, 1, 0.8313726, 1,
-0.1635028, 1.068383, 0.6296346, 0, 1, 0.8392157, 1,
-0.1634366, 1.809126, 0.2457921, 0, 1, 0.8431373, 1,
-0.162815, 0.2149183, -0.8119373, 0, 1, 0.8509804, 1,
-0.1520991, 0.2601041, -0.4123989, 0, 1, 0.854902, 1,
-0.1504318, 1.400225, -1.60916, 0, 1, 0.8627451, 1,
-0.1499432, -0.2174657, -3.61278, 0, 1, 0.8666667, 1,
-0.1452049, 0.5666806, -1.368056, 0, 1, 0.8745098, 1,
-0.1444424, 2.009903, -0.5684105, 0, 1, 0.8784314, 1,
-0.1416823, 0.3164107, -0.2523629, 0, 1, 0.8862745, 1,
-0.1401247, -0.7974557, -4.313229, 0, 1, 0.8901961, 1,
-0.1394428, -0.679071, -2.60486, 0, 1, 0.8980392, 1,
-0.1347738, 0.4535242, -0.2792748, 0, 1, 0.9058824, 1,
-0.1336621, -0.818653, -3.787832, 0, 1, 0.9098039, 1,
-0.1321789, -0.4365466, -4.348964, 0, 1, 0.9176471, 1,
-0.1280773, 2.4603, -0.09745092, 0, 1, 0.9215686, 1,
-0.1210596, 0.2849808, -0.2772389, 0, 1, 0.9294118, 1,
-0.1197265, -0.5390242, -4.576449, 0, 1, 0.9333333, 1,
-0.1176881, -0.5536067, -3.206919, 0, 1, 0.9411765, 1,
-0.1163478, 0.005390469, -1.521982, 0, 1, 0.945098, 1,
-0.1139821, 0.7053135, -0.9322994, 0, 1, 0.9529412, 1,
-0.1131739, 0.3416821, -0.3831921, 0, 1, 0.9568627, 1,
-0.1126718, -0.01736606, -3.085038, 0, 1, 0.9647059, 1,
-0.1094113, 1.605219, 1.041957, 0, 1, 0.9686275, 1,
-0.1091001, -1.16236, -3.186949, 0, 1, 0.9764706, 1,
-0.1035178, 1.580116, -0.9840002, 0, 1, 0.9803922, 1,
-0.1021313, -0.4051288, -3.02748, 0, 1, 0.9882353, 1,
-0.1009375, 0.1403127, -1.261615, 0, 1, 0.9921569, 1,
-0.09888805, 0.9739035, -0.3166125, 0, 1, 1, 1,
-0.09826522, -0.5070448, -2.999452, 0, 0.9921569, 1, 1,
-0.09267996, 1.16989, 0.9498237, 0, 0.9882353, 1, 1,
-0.09238186, 0.5989659, -0.3857488, 0, 0.9803922, 1, 1,
-0.08938189, -0.5163683, -2.864589, 0, 0.9764706, 1, 1,
-0.08072258, -0.3774368, -2.978877, 0, 0.9686275, 1, 1,
-0.08002048, -0.5810879, -2.70474, 0, 0.9647059, 1, 1,
-0.07948998, -3.091438, -4.589674, 0, 0.9568627, 1, 1,
-0.07925022, -0.693223, -3.390336, 0, 0.9529412, 1, 1,
-0.07809362, -0.8588949, -4.227377, 0, 0.945098, 1, 1,
-0.07364494, -0.9072198, -2.754805, 0, 0.9411765, 1, 1,
-0.07005219, -0.07605854, -3.917562, 0, 0.9333333, 1, 1,
-0.06685515, 0.3359605, -0.7988132, 0, 0.9294118, 1, 1,
-0.06484926, 0.6384677, -0.06533038, 0, 0.9215686, 1, 1,
-0.06037452, 1.141377, -0.5081463, 0, 0.9176471, 1, 1,
-0.05760236, 0.2708282, -0.5577641, 0, 0.9098039, 1, 1,
-0.0570996, -0.2259549, -2.43655, 0, 0.9058824, 1, 1,
-0.05525387, -1.154702, -2.58267, 0, 0.8980392, 1, 1,
-0.05522824, -1.58036, -3.761598, 0, 0.8901961, 1, 1,
-0.0535464, 0.5691893, 0.5837935, 0, 0.8862745, 1, 1,
-0.05341896, -1.244258, -2.214158, 0, 0.8784314, 1, 1,
-0.05283614, 0.4794982, 1.375373, 0, 0.8745098, 1, 1,
-0.04285223, 0.3026361, 0.8569779, 0, 0.8666667, 1, 1,
-0.04272585, 0.5586845, 0.2168296, 0, 0.8627451, 1, 1,
-0.04145221, 0.1801393, -1.778451, 0, 0.854902, 1, 1,
-0.03982842, 0.2387525, -0.5357445, 0, 0.8509804, 1, 1,
-0.03274035, -2.188158, -2.565369, 0, 0.8431373, 1, 1,
-0.02298324, 0.2731614, 0.9104422, 0, 0.8392157, 1, 1,
-0.02219372, -1.201843, -2.466887, 0, 0.8313726, 1, 1,
-0.01903932, -0.4431985, -3.393973, 0, 0.827451, 1, 1,
-0.01624964, -0.7668259, -2.35087, 0, 0.8196079, 1, 1,
-0.01590077, -1.167095, -3.617967, 0, 0.8156863, 1, 1,
-0.01131811, 0.4371782, 0.9618848, 0, 0.8078431, 1, 1,
-0.007853043, 0.8192695, 0.0214722, 0, 0.8039216, 1, 1,
-0.003794014, -0.1542181, -2.66993, 0, 0.7960784, 1, 1,
-0.002761242, -0.3475727, -3.613914, 0, 0.7882353, 1, 1,
0.0006696685, 0.3207924, 0.562757, 0, 0.7843137, 1, 1,
0.004034212, -0.3310159, 4.470398, 0, 0.7764706, 1, 1,
0.006192591, -0.3876363, 2.966613, 0, 0.772549, 1, 1,
0.009473149, -1.065404, 3.955173, 0, 0.7647059, 1, 1,
0.01105215, -0.1760294, 4.105194, 0, 0.7607843, 1, 1,
0.01401314, -0.303421, 2.493238, 0, 0.7529412, 1, 1,
0.01531556, -0.6751804, 3.175831, 0, 0.7490196, 1, 1,
0.02021701, -0.1518889, 3.726961, 0, 0.7411765, 1, 1,
0.02028432, -0.75827, 1.624726, 0, 0.7372549, 1, 1,
0.0264278, 1.699364, 1.830698, 0, 0.7294118, 1, 1,
0.02869004, -0.5656453, 2.780137, 0, 0.7254902, 1, 1,
0.02934136, 1.085741, -1.342004, 0, 0.7176471, 1, 1,
0.03438333, 1.512964, 0.3764967, 0, 0.7137255, 1, 1,
0.03730151, 0.6642313, 0.8422934, 0, 0.7058824, 1, 1,
0.04748345, -1.17043, 2.995527, 0, 0.6980392, 1, 1,
0.04913151, -1.538751, 1.207274, 0, 0.6941177, 1, 1,
0.05065939, 1.324277, 0.3951867, 0, 0.6862745, 1, 1,
0.05646978, 2.647258, 0.2296028, 0, 0.682353, 1, 1,
0.06171792, 0.6679835, 0.3656099, 0, 0.6745098, 1, 1,
0.06512234, -0.5558028, 4.639362, 0, 0.6705883, 1, 1,
0.06663509, 0.3447468, 3.475113, 0, 0.6627451, 1, 1,
0.06980051, -0.04140779, 1.467929, 0, 0.6588235, 1, 1,
0.07569738, -0.5230353, 2.506822, 0, 0.6509804, 1, 1,
0.07751618, -0.9140242, 3.186994, 0, 0.6470588, 1, 1,
0.08468194, 0.9850324, 0.7921557, 0, 0.6392157, 1, 1,
0.08557744, -1.299133, 3.583302, 0, 0.6352941, 1, 1,
0.0947511, 0.3435182, -1.28035, 0, 0.627451, 1, 1,
0.09479936, -0.8852971, 4.279048, 0, 0.6235294, 1, 1,
0.09622112, 0.5139021, 0.6933132, 0, 0.6156863, 1, 1,
0.09795799, 0.05737052, -0.340396, 0, 0.6117647, 1, 1,
0.1014811, -0.09500276, 0.1767154, 0, 0.6039216, 1, 1,
0.1103292, -0.4538759, 2.273086, 0, 0.5960785, 1, 1,
0.1175693, -0.0977565, 2.980501, 0, 0.5921569, 1, 1,
0.1205003, -0.3481099, 2.918384, 0, 0.5843138, 1, 1,
0.1239104, -1.438984, 1.337665, 0, 0.5803922, 1, 1,
0.125711, -0.8152545, 2.425627, 0, 0.572549, 1, 1,
0.1257238, 1.116393, 0.01630653, 0, 0.5686275, 1, 1,
0.126311, 1.818165, 0.5342003, 0, 0.5607843, 1, 1,
0.1270417, -0.3553857, 1.342709, 0, 0.5568628, 1, 1,
0.1301346, 0.3930489, 1.142889, 0, 0.5490196, 1, 1,
0.1322195, 0.008367706, 0.8755381, 0, 0.5450981, 1, 1,
0.1330813, -1.597271, 3.896241, 0, 0.5372549, 1, 1,
0.1338881, 0.04336807, 0.8515192, 0, 0.5333334, 1, 1,
0.1346754, 0.08364107, -0.6968679, 0, 0.5254902, 1, 1,
0.1355904, -1.419479, 2.990845, 0, 0.5215687, 1, 1,
0.1366689, -0.1015889, 2.612639, 0, 0.5137255, 1, 1,
0.1372161, 0.7216331, -0.2902417, 0, 0.509804, 1, 1,
0.1378345, -0.1552418, 3.547575, 0, 0.5019608, 1, 1,
0.1435746, -0.2837276, 1.186134, 0, 0.4941176, 1, 1,
0.1463214, 0.2054421, 2.292554, 0, 0.4901961, 1, 1,
0.1474281, -0.1899378, 1.95216, 0, 0.4823529, 1, 1,
0.151884, 0.6918454, 0.3041184, 0, 0.4784314, 1, 1,
0.157059, -0.1219434, 1.053717, 0, 0.4705882, 1, 1,
0.157766, -0.4987491, 1.101656, 0, 0.4666667, 1, 1,
0.1584307, -2.828266, 2.150674, 0, 0.4588235, 1, 1,
0.1601456, -0.7914897, 3.143369, 0, 0.454902, 1, 1,
0.1625194, -0.3263079, 5.951697, 0, 0.4470588, 1, 1,
0.1638991, 0.6470071, -0.3992384, 0, 0.4431373, 1, 1,
0.1642825, 0.2862466, 0.95577, 0, 0.4352941, 1, 1,
0.1647283, 0.526297, 0.6175466, 0, 0.4313726, 1, 1,
0.1647363, 1.436879, 0.4348868, 0, 0.4235294, 1, 1,
0.1774671, 0.2322065, 0.6937355, 0, 0.4196078, 1, 1,
0.179968, 0.02740178, -0.4529555, 0, 0.4117647, 1, 1,
0.1801762, -0.6006507, 2.496597, 0, 0.4078431, 1, 1,
0.1841954, -0.5907749, 2.528781, 0, 0.4, 1, 1,
0.1859217, -0.965133, 0.307745, 0, 0.3921569, 1, 1,
0.1881361, 1.845488, -0.5896649, 0, 0.3882353, 1, 1,
0.1881911, 0.005944092, 1.170027, 0, 0.3803922, 1, 1,
0.191394, 0.4692961, 2.22326, 0, 0.3764706, 1, 1,
0.1923266, 0.1792136, 2.037518, 0, 0.3686275, 1, 1,
0.1940613, -0.8550828, 3.189921, 0, 0.3647059, 1, 1,
0.1948472, -0.4501363, 1.482631, 0, 0.3568628, 1, 1,
0.1957554, -1.546163, 3.846788, 0, 0.3529412, 1, 1,
0.1967147, -1.48483, 3.93114, 0, 0.345098, 1, 1,
0.2051262, 0.4479418, 0.3691906, 0, 0.3411765, 1, 1,
0.2101254, -0.676796, 3.869072, 0, 0.3333333, 1, 1,
0.2194429, 1.573406, 0.09861671, 0, 0.3294118, 1, 1,
0.2198621, -0.762483, 3.403748, 0, 0.3215686, 1, 1,
0.2223176, 0.4046028, -0.3727388, 0, 0.3176471, 1, 1,
0.2252154, 0.7319562, -0.9531592, 0, 0.3098039, 1, 1,
0.2261148, 2.003869, 1.512018, 0, 0.3058824, 1, 1,
0.2289283, 2.420373, 1.475971, 0, 0.2980392, 1, 1,
0.2289825, -1.097677, 2.739041, 0, 0.2901961, 1, 1,
0.2301561, -0.492934, 1.908341, 0, 0.2862745, 1, 1,
0.2302562, 0.5480219, 1.460745, 0, 0.2784314, 1, 1,
0.2303096, 0.5565872, -0.09461765, 0, 0.2745098, 1, 1,
0.2307094, 1.953675, 0.5739304, 0, 0.2666667, 1, 1,
0.2314637, 1.615802, -0.7787959, 0, 0.2627451, 1, 1,
0.2332683, -0.2157674, 0.3826789, 0, 0.254902, 1, 1,
0.2369471, 0.1392886, -0.5743679, 0, 0.2509804, 1, 1,
0.2401873, -1.030969, 2.366029, 0, 0.2431373, 1, 1,
0.242771, 0.9518819, 0.1773359, 0, 0.2392157, 1, 1,
0.2428356, 0.552708, 0.1390299, 0, 0.2313726, 1, 1,
0.2450533, 1.252403, 0.6701829, 0, 0.227451, 1, 1,
0.2459738, -0.1513958, 1.370691, 0, 0.2196078, 1, 1,
0.2483138, 1.218644, 0.4232345, 0, 0.2156863, 1, 1,
0.2483394, -0.1155968, 1.085413, 0, 0.2078431, 1, 1,
0.2523625, -0.715665, 3.184392, 0, 0.2039216, 1, 1,
0.2534116, -1.000004, 3.088252, 0, 0.1960784, 1, 1,
0.2543529, -0.7895301, 0.5236419, 0, 0.1882353, 1, 1,
0.2573735, -2.202912, 3.964671, 0, 0.1843137, 1, 1,
0.2650779, 0.008491935, 2.632573, 0, 0.1764706, 1, 1,
0.2655039, -0.2164962, 3.96559, 0, 0.172549, 1, 1,
0.2677239, 0.2969298, 2.682232, 0, 0.1647059, 1, 1,
0.2694823, -1.643986, 3.15552, 0, 0.1607843, 1, 1,
0.2739696, -0.03820015, -0.002301643, 0, 0.1529412, 1, 1,
0.2758971, -0.4128455, 1.900317, 0, 0.1490196, 1, 1,
0.2778157, -0.54722, 0.5498433, 0, 0.1411765, 1, 1,
0.2787911, 1.123042, -0.4458294, 0, 0.1372549, 1, 1,
0.2810949, 2.23667, -0.2753754, 0, 0.1294118, 1, 1,
0.2893823, -0.1211218, 2.809267, 0, 0.1254902, 1, 1,
0.2902581, -1.033526, 1.382329, 0, 0.1176471, 1, 1,
0.2967331, -0.6998639, 2.667048, 0, 0.1137255, 1, 1,
0.2968112, 0.5709394, 0.4614761, 0, 0.1058824, 1, 1,
0.2984835, -0.4616341, 3.023742, 0, 0.09803922, 1, 1,
0.2995311, 0.5662164, 0.755595, 0, 0.09411765, 1, 1,
0.3075876, 0.1524941, 2.098849, 0, 0.08627451, 1, 1,
0.3107757, -0.8111701, 0.4161412, 0, 0.08235294, 1, 1,
0.3127612, -0.08624393, 2.739525, 0, 0.07450981, 1, 1,
0.3141026, 1.445007, 0.6095427, 0, 0.07058824, 1, 1,
0.3142859, -0.8679523, 2.312304, 0, 0.0627451, 1, 1,
0.3193868, 1.766554, 2.18574, 0, 0.05882353, 1, 1,
0.3224699, -1.128465, 3.469236, 0, 0.05098039, 1, 1,
0.3288088, -1.125842, 2.451857, 0, 0.04705882, 1, 1,
0.3292655, 0.4894104, 1.146051, 0, 0.03921569, 1, 1,
0.3327181, 0.7654425, 2.29664, 0, 0.03529412, 1, 1,
0.3332523, -0.9212638, 1.42776, 0, 0.02745098, 1, 1,
0.3338462, -0.4051093, 3.515987, 0, 0.02352941, 1, 1,
0.3385242, -0.3236558, 3.927014, 0, 0.01568628, 1, 1,
0.3463469, -0.5654822, 1.750887, 0, 0.01176471, 1, 1,
0.3470936, -0.7942478, 3.155483, 0, 0.003921569, 1, 1,
0.3522142, 0.220531, 1.957771, 0.003921569, 0, 1, 1,
0.3530511, -0.02727276, 2.640022, 0.007843138, 0, 1, 1,
0.3534934, -1.235951, 4.163408, 0.01568628, 0, 1, 1,
0.3565701, -0.7535369, 3.199531, 0.01960784, 0, 1, 1,
0.366276, 0.7072507, 0.2912631, 0.02745098, 0, 1, 1,
0.3678454, 0.09626972, 1.631486, 0.03137255, 0, 1, 1,
0.3678536, 0.567143, 1.570643, 0.03921569, 0, 1, 1,
0.3719828, -0.2361194, 3.230609, 0.04313726, 0, 1, 1,
0.3756571, 1.442423, 0.7648941, 0.05098039, 0, 1, 1,
0.3778782, -1.177507, 2.970331, 0.05490196, 0, 1, 1,
0.3785965, -0.2617568, 2.040399, 0.0627451, 0, 1, 1,
0.3790062, -0.8255716, 2.693895, 0.06666667, 0, 1, 1,
0.38225, -0.0403259, 1.790785, 0.07450981, 0, 1, 1,
0.3836491, 1.606868, -0.07339218, 0.07843138, 0, 1, 1,
0.3875169, 0.604123, 1.234053, 0.08627451, 0, 1, 1,
0.394539, -0.723814, 2.622911, 0.09019608, 0, 1, 1,
0.3977104, -0.02123227, 2.623994, 0.09803922, 0, 1, 1,
0.4018299, 1.157974, 1.954309, 0.1058824, 0, 1, 1,
0.40295, 0.9796929, 3.140004, 0.1098039, 0, 1, 1,
0.4033704, -1.104963, 3.735208, 0.1176471, 0, 1, 1,
0.4034341, -1.140905, 2.840263, 0.1215686, 0, 1, 1,
0.4078833, 0.07993682, 2.269858, 0.1294118, 0, 1, 1,
0.4232232, 0.9497396, 0.8723114, 0.1333333, 0, 1, 1,
0.4258075, -0.4090806, 3.51669, 0.1411765, 0, 1, 1,
0.4300078, -1.114425, 4.013396, 0.145098, 0, 1, 1,
0.4360543, 0.707413, 1.462395, 0.1529412, 0, 1, 1,
0.4510764, -0.2868737, 1.762391, 0.1568628, 0, 1, 1,
0.4517266, 0.6732011, 0.1489004, 0.1647059, 0, 1, 1,
0.4529309, 0.5401356, 1.718792, 0.1686275, 0, 1, 1,
0.4536392, 1.635919, 1.954572, 0.1764706, 0, 1, 1,
0.4600904, -1.98716, 1.617165, 0.1803922, 0, 1, 1,
0.4673073, -0.1332086, 4.112109, 0.1882353, 0, 1, 1,
0.4691623, -1.401196, 3.40185, 0.1921569, 0, 1, 1,
0.4723167, -1.236767, 3.989038, 0.2, 0, 1, 1,
0.4852993, -0.2464531, 4.054625, 0.2078431, 0, 1, 1,
0.4876746, 0.7938249, -0.1365986, 0.2117647, 0, 1, 1,
0.4904846, -0.5650848, 0.7935832, 0.2196078, 0, 1, 1,
0.4950359, 0.8670375, 1.514925, 0.2235294, 0, 1, 1,
0.4969304, -1.40136, 4.768801, 0.2313726, 0, 1, 1,
0.4974619, -0.27449, 1.962036, 0.2352941, 0, 1, 1,
0.5026936, 1.103237, 1.475419, 0.2431373, 0, 1, 1,
0.5033146, 1.150033, -0.6908599, 0.2470588, 0, 1, 1,
0.5071861, -1.434006, 2.260631, 0.254902, 0, 1, 1,
0.5075171, 0.6114675, 2.005375, 0.2588235, 0, 1, 1,
0.5109854, 0.006404682, 2.649005, 0.2666667, 0, 1, 1,
0.511188, 1.500408, 0.05223035, 0.2705882, 0, 1, 1,
0.5133041, 1.161885, -0.03017842, 0.2784314, 0, 1, 1,
0.5146309, 0.6729888, 0.1560074, 0.282353, 0, 1, 1,
0.5171422, -0.7005751, 2.290489, 0.2901961, 0, 1, 1,
0.5272041, 1.614765, -0.5855359, 0.2941177, 0, 1, 1,
0.5285756, -0.3890584, 2.409066, 0.3019608, 0, 1, 1,
0.5418668, 0.7102818, 0.2012877, 0.3098039, 0, 1, 1,
0.5425521, -0.2206043, 0.3308235, 0.3137255, 0, 1, 1,
0.543448, 0.937249, -0.2148173, 0.3215686, 0, 1, 1,
0.5462799, 0.4324615, 0.181629, 0.3254902, 0, 1, 1,
0.5483069, -1.240711, 2.636485, 0.3333333, 0, 1, 1,
0.5486874, 1.083087, -0.3228226, 0.3372549, 0, 1, 1,
0.5517791, 1.059953, -0.8520908, 0.345098, 0, 1, 1,
0.5537912, -0.07164112, 2.215809, 0.3490196, 0, 1, 1,
0.5597203, 0.52593, 0.4624688, 0.3568628, 0, 1, 1,
0.5601738, 0.2676218, 1.587138, 0.3607843, 0, 1, 1,
0.5740726, -0.5950273, 2.981741, 0.3686275, 0, 1, 1,
0.5785303, 0.6232194, -0.3518833, 0.372549, 0, 1, 1,
0.5802767, 0.7379686, 1.411214, 0.3803922, 0, 1, 1,
0.5851814, 0.7328633, 0.2178778, 0.3843137, 0, 1, 1,
0.585315, -0.9343646, 2.714527, 0.3921569, 0, 1, 1,
0.5869068, 0.03142452, 1.975646, 0.3960784, 0, 1, 1,
0.5874615, -0.5821515, 2.390711, 0.4039216, 0, 1, 1,
0.5903789, -1.56521, 4.096713, 0.4117647, 0, 1, 1,
0.5935455, 0.01068529, 3.339075, 0.4156863, 0, 1, 1,
0.5955463, 1.235704, 1.211577, 0.4235294, 0, 1, 1,
0.6052127, 0.2934346, 0.6274527, 0.427451, 0, 1, 1,
0.6057442, 0.5103014, 0.6554433, 0.4352941, 0, 1, 1,
0.6065409, 0.02312463, 1.071719, 0.4392157, 0, 1, 1,
0.6136404, -0.8066023, 2.834286, 0.4470588, 0, 1, 1,
0.6173921, -1.187364, 2.53677, 0.4509804, 0, 1, 1,
0.6254824, 0.1769016, 1.093053, 0.4588235, 0, 1, 1,
0.6290377, 1.262798, 0.8502958, 0.4627451, 0, 1, 1,
0.6352355, -0.5653455, 1.630793, 0.4705882, 0, 1, 1,
0.6353309, 0.3249672, 1.699525, 0.4745098, 0, 1, 1,
0.6357554, -1.033758, 3.108257, 0.4823529, 0, 1, 1,
0.6371337, -0.2789978, 1.562197, 0.4862745, 0, 1, 1,
0.6378308, 0.1996335, 2.105183, 0.4941176, 0, 1, 1,
0.6379661, -0.8081995, 1.261991, 0.5019608, 0, 1, 1,
0.6520929, -0.610272, 2.566649, 0.5058824, 0, 1, 1,
0.6528084, 0.6856609, 1.775285, 0.5137255, 0, 1, 1,
0.669875, -0.07022235, 2.771981, 0.5176471, 0, 1, 1,
0.6709564, -1.22168, 2.505665, 0.5254902, 0, 1, 1,
0.675462, 1.517905, -0.3350758, 0.5294118, 0, 1, 1,
0.6769709, -1.372079, 1.556679, 0.5372549, 0, 1, 1,
0.6935698, 2.215173, 0.5553692, 0.5411765, 0, 1, 1,
0.696548, -0.04940511, 0.2449052, 0.5490196, 0, 1, 1,
0.6982919, -1.715596, 3.291847, 0.5529412, 0, 1, 1,
0.7026933, 1.302234, 1.837285, 0.5607843, 0, 1, 1,
0.7027254, -0.07853947, 1.434248, 0.5647059, 0, 1, 1,
0.7036109, -0.3322194, 2.575127, 0.572549, 0, 1, 1,
0.708452, -0.1859221, 2.734878, 0.5764706, 0, 1, 1,
0.70937, 1.510327, 0.5935104, 0.5843138, 0, 1, 1,
0.7169577, -0.364485, 3.48497, 0.5882353, 0, 1, 1,
0.7221373, -0.08988013, 3.115116, 0.5960785, 0, 1, 1,
0.7257572, 0.8992307, -0.1362759, 0.6039216, 0, 1, 1,
0.728681, 0.7016417, 0.1372703, 0.6078432, 0, 1, 1,
0.7328789, 0.675367, 1.725181, 0.6156863, 0, 1, 1,
0.7359188, -1.777911, 2.224922, 0.6196079, 0, 1, 1,
0.7372125, 0.6500933, 1.556881, 0.627451, 0, 1, 1,
0.7385873, 0.6697087, 0.9376377, 0.6313726, 0, 1, 1,
0.7475091, 0.3686333, 3.437897, 0.6392157, 0, 1, 1,
0.7505502, -1.068861, 1.001642, 0.6431373, 0, 1, 1,
0.7516649, -0.4767992, 0.7063159, 0.6509804, 0, 1, 1,
0.760614, -0.0874287, 1.404959, 0.654902, 0, 1, 1,
0.7637495, -0.7863041, 1.962984, 0.6627451, 0, 1, 1,
0.7699053, -0.4518293, 2.104801, 0.6666667, 0, 1, 1,
0.7705759, 0.3472226, 2.394104, 0.6745098, 0, 1, 1,
0.7732044, 0.5696097, 0.4842, 0.6784314, 0, 1, 1,
0.7764066, -0.9193501, 2.287717, 0.6862745, 0, 1, 1,
0.7919807, -0.2828124, 5.816557, 0.6901961, 0, 1, 1,
0.7922596, 0.3353603, -0.09609147, 0.6980392, 0, 1, 1,
0.7929506, 0.4861759, 1.419091, 0.7058824, 0, 1, 1,
0.7934438, -0.8488806, 2.935437, 0.7098039, 0, 1, 1,
0.8037917, 1.256066, 0.8961056, 0.7176471, 0, 1, 1,
0.8067058, -0.9598336, 4.0341, 0.7215686, 0, 1, 1,
0.8094448, 0.3493556, 2.150621, 0.7294118, 0, 1, 1,
0.8101455, 0.6038753, 1.422079, 0.7333333, 0, 1, 1,
0.8108125, 1.349586, -0.06417071, 0.7411765, 0, 1, 1,
0.8145248, 0.5039624, 0.7774943, 0.7450981, 0, 1, 1,
0.8164026, 1.676291, -1.05503, 0.7529412, 0, 1, 1,
0.8232614, -0.8729073, 3.14154, 0.7568628, 0, 1, 1,
0.8235469, -0.7824185, 2.537068, 0.7647059, 0, 1, 1,
0.8259138, 0.3772407, 0.854082, 0.7686275, 0, 1, 1,
0.835086, -0.0401005, 0.8957796, 0.7764706, 0, 1, 1,
0.836675, 0.2849674, 1.870595, 0.7803922, 0, 1, 1,
0.8431615, -0.119999, 3.510991, 0.7882353, 0, 1, 1,
0.8458436, -0.389608, 4.610864, 0.7921569, 0, 1, 1,
0.8489043, 0.1394053, 1.164263, 0.8, 0, 1, 1,
0.850139, -1.025564, 2.198018, 0.8078431, 0, 1, 1,
0.8581457, 0.5967333, 1.709669, 0.8117647, 0, 1, 1,
0.8621501, -0.3135367, 0.6696913, 0.8196079, 0, 1, 1,
0.8644655, -0.8239234, 2.095193, 0.8235294, 0, 1, 1,
0.8660946, -2.049974, 4.032147, 0.8313726, 0, 1, 1,
0.8954205, 0.4137191, 0.3619862, 0.8352941, 0, 1, 1,
0.8969728, 1.546369, -1.949798, 0.8431373, 0, 1, 1,
0.899748, -0.2779692, 2.004437, 0.8470588, 0, 1, 1,
0.9013298, -0.1090395, -1.568181, 0.854902, 0, 1, 1,
0.9029624, -1.666622, 3.025859, 0.8588235, 0, 1, 1,
0.9032063, 0.7060191, 1.031856, 0.8666667, 0, 1, 1,
0.9060371, 0.5502334, 0.549422, 0.8705882, 0, 1, 1,
0.9068119, 0.3253119, 2.129807, 0.8784314, 0, 1, 1,
0.9102873, -0.7538407, 2.57853, 0.8823529, 0, 1, 1,
0.9121016, -0.7242655, 1.010065, 0.8901961, 0, 1, 1,
0.9300966, 0.2654313, 1.497843, 0.8941177, 0, 1, 1,
0.9314211, 1.026896, 1.314221, 0.9019608, 0, 1, 1,
0.9318002, -1.859164, 2.617317, 0.9098039, 0, 1, 1,
0.9325833, -0.7714974, 2.638606, 0.9137255, 0, 1, 1,
0.9331383, -1.872442, 2.773975, 0.9215686, 0, 1, 1,
0.9391611, -1.525829, 1.641972, 0.9254902, 0, 1, 1,
0.9400465, -0.8541973, 2.808183, 0.9333333, 0, 1, 1,
0.9453798, 0.3371955, 1.141986, 0.9372549, 0, 1, 1,
0.9455019, -0.289436, 1.805723, 0.945098, 0, 1, 1,
0.9457494, -1.403642, 1.731424, 0.9490196, 0, 1, 1,
0.9599776, -0.8665573, 2.67558, 0.9568627, 0, 1, 1,
0.972451, -1.383159, 3.693473, 0.9607843, 0, 1, 1,
0.977735, -0.4389226, 1.858833, 0.9686275, 0, 1, 1,
0.9783829, 1.543078, 2.502073, 0.972549, 0, 1, 1,
0.97883, -1.221097, 4.173856, 0.9803922, 0, 1, 1,
0.9793741, -0.4851412, 0.6274155, 0.9843137, 0, 1, 1,
0.9810633, -0.06686801, 2.213852, 0.9921569, 0, 1, 1,
0.9866093, 0.6090153, 1.852972, 0.9960784, 0, 1, 1,
0.9868028, 1.379128, 1.714492, 1, 0, 0.9960784, 1,
0.9872766, 1.469178, -0.5228607, 1, 0, 0.9882353, 1,
0.9917435, -1.40821, 1.530214, 1, 0, 0.9843137, 1,
0.9997076, -1.611636, 4.17345, 1, 0, 0.9764706, 1,
0.999857, 0.5986965, 1.618649, 1, 0, 0.972549, 1,
1.007622, -0.6574458, 2.088846, 1, 0, 0.9647059, 1,
1.011123, -0.3878352, 2.738974, 1, 0, 0.9607843, 1,
1.045445, -1.445071, 1.431471, 1, 0, 0.9529412, 1,
1.048058, -1.869745, 0.9547302, 1, 0, 0.9490196, 1,
1.060144, -0.8984711, 1.334619, 1, 0, 0.9411765, 1,
1.061467, 0.1073963, 1.476311, 1, 0, 0.9372549, 1,
1.064375, 0.2501667, -0.7279847, 1, 0, 0.9294118, 1,
1.068846, 0.253912, 0.1950369, 1, 0, 0.9254902, 1,
1.071715, -1.356514, 4.190823, 1, 0, 0.9176471, 1,
1.074102, 0.2772465, -0.1101096, 1, 0, 0.9137255, 1,
1.079539, -0.1162788, -0.8026175, 1, 0, 0.9058824, 1,
1.092078, 0.7478079, 2.477807, 1, 0, 0.9019608, 1,
1.104383, 0.646637, 0.8723924, 1, 0, 0.8941177, 1,
1.10913, -0.7382247, 0.2403928, 1, 0, 0.8862745, 1,
1.110428, -1.089536, 3.361814, 1, 0, 0.8823529, 1,
1.112222, 0.5484543, 0.8189826, 1, 0, 0.8745098, 1,
1.115235, 0.09019408, 2.411483, 1, 0, 0.8705882, 1,
1.11793, 1.166149, 0.03991058, 1, 0, 0.8627451, 1,
1.136508, 0.451787, 1.821392, 1, 0, 0.8588235, 1,
1.139893, -0.7102826, 0.9912548, 1, 0, 0.8509804, 1,
1.148456, 1.067725, -0.8102415, 1, 0, 0.8470588, 1,
1.157199, -0.1615809, 0.3053315, 1, 0, 0.8392157, 1,
1.163846, -1.432805, -0.2792699, 1, 0, 0.8352941, 1,
1.167433, -1.52377, 4.030213, 1, 0, 0.827451, 1,
1.168015, 1.438103, -1.932119, 1, 0, 0.8235294, 1,
1.173124, -0.6724352, 1.992857, 1, 0, 0.8156863, 1,
1.182501, 1.132427, -0.5954032, 1, 0, 0.8117647, 1,
1.188492, 1.0163, 1.599716, 1, 0, 0.8039216, 1,
1.200738, -1.856914, 2.679112, 1, 0, 0.7960784, 1,
1.201846, 0.100122, 2.87601, 1, 0, 0.7921569, 1,
1.211469, -0.8974983, 2.616912, 1, 0, 0.7843137, 1,
1.221135, -0.3577539, 2.327411, 1, 0, 0.7803922, 1,
1.232275, 0.7091621, 1.994532, 1, 0, 0.772549, 1,
1.235237, 1.178491, 1.124745, 1, 0, 0.7686275, 1,
1.24853, -0.3025651, 2.938364, 1, 0, 0.7607843, 1,
1.254409, -1.057587, 1.337402, 1, 0, 0.7568628, 1,
1.25561, 0.3505227, 3.344826, 1, 0, 0.7490196, 1,
1.255957, 1.103184, 1.993572, 1, 0, 0.7450981, 1,
1.259608, 1.116218, 0.5696164, 1, 0, 0.7372549, 1,
1.261995, 0.5117038, 2.131798, 1, 0, 0.7333333, 1,
1.272485, 1.077411, 1.021797, 1, 0, 0.7254902, 1,
1.281, 0.1310336, 1.867004, 1, 0, 0.7215686, 1,
1.284985, -1.150456, 1.741601, 1, 0, 0.7137255, 1,
1.289838, 1.012146, 1.269158, 1, 0, 0.7098039, 1,
1.316771, -0.08337536, 0.4872211, 1, 0, 0.7019608, 1,
1.323002, -0.03543632, 1.749188, 1, 0, 0.6941177, 1,
1.325091, 1.215387, -0.8414231, 1, 0, 0.6901961, 1,
1.328248, 0.1215977, 3.294654, 1, 0, 0.682353, 1,
1.343803, -0.4005458, 1.423406, 1, 0, 0.6784314, 1,
1.346619, -0.08277177, 1.530394, 1, 0, 0.6705883, 1,
1.355196, 0.4007778, 0.6666074, 1, 0, 0.6666667, 1,
1.362847, -0.2629127, 1.515392, 1, 0, 0.6588235, 1,
1.367833, -0.7421891, 2.611575, 1, 0, 0.654902, 1,
1.371082, 0.3257231, 2.862181, 1, 0, 0.6470588, 1,
1.376546, -1.183292, 2.055467, 1, 0, 0.6431373, 1,
1.379776, -0.1167485, 1.069971, 1, 0, 0.6352941, 1,
1.380518, -1.023951, -0.8048807, 1, 0, 0.6313726, 1,
1.384529, 0.4070798, 0.05272519, 1, 0, 0.6235294, 1,
1.388173, -1.154363, 3.53403, 1, 0, 0.6196079, 1,
1.392481, -0.526065, 1.466979, 1, 0, 0.6117647, 1,
1.395758, -1.220164, 2.362585, 1, 0, 0.6078432, 1,
1.402462, 0.216681, 1.131095, 1, 0, 0.6, 1,
1.40595, 1.275824, -0.4321888, 1, 0, 0.5921569, 1,
1.407021, 1.538345, 0.5035332, 1, 0, 0.5882353, 1,
1.409941, -0.7814195, 1.800251, 1, 0, 0.5803922, 1,
1.410107, -0.1290073, 1.706256, 1, 0, 0.5764706, 1,
1.411792, 0.08197572, 1.257027, 1, 0, 0.5686275, 1,
1.418453, 0.2624243, 2.785196, 1, 0, 0.5647059, 1,
1.425374, -1.158453, 4.115276, 1, 0, 0.5568628, 1,
1.427585, -0.2357651, 2.188512, 1, 0, 0.5529412, 1,
1.429594, -0.2877997, 0.9930478, 1, 0, 0.5450981, 1,
1.430552, 0.4379741, 1.966952, 1, 0, 0.5411765, 1,
1.437819, 2.672213, 0.9929475, 1, 0, 0.5333334, 1,
1.439739, -1.786413, 2.356496, 1, 0, 0.5294118, 1,
1.443152, -1.088599, 2.533901, 1, 0, 0.5215687, 1,
1.449124, -0.4601725, 2.447241, 1, 0, 0.5176471, 1,
1.453334, -0.1899622, 2.943847, 1, 0, 0.509804, 1,
1.453927, -1.268935, 3.391133, 1, 0, 0.5058824, 1,
1.457554, 0.5816836, 0.785549, 1, 0, 0.4980392, 1,
1.459015, -1.075824, 2.157349, 1, 0, 0.4901961, 1,
1.473273, 0.4856015, 1.609452, 1, 0, 0.4862745, 1,
1.480471, -0.120734, 0.8285159, 1, 0, 0.4784314, 1,
1.482697, 0.5822634, 1.224126, 1, 0, 0.4745098, 1,
1.484491, -1.417099, 0.903258, 1, 0, 0.4666667, 1,
1.487438, -1.088238, 1.947334, 1, 0, 0.4627451, 1,
1.493026, -0.6527369, 2.132932, 1, 0, 0.454902, 1,
1.494173, -0.6183887, 3.08168, 1, 0, 0.4509804, 1,
1.501395, 2.483488, 0.550698, 1, 0, 0.4431373, 1,
1.50501, -1.18154, 2.821798, 1, 0, 0.4392157, 1,
1.513074, -0.6029423, 2.652996, 1, 0, 0.4313726, 1,
1.514164, 0.5418726, 1.644655, 1, 0, 0.427451, 1,
1.5234, -1.254964, 1.023187, 1, 0, 0.4196078, 1,
1.528033, 0.1530547, 0.0412665, 1, 0, 0.4156863, 1,
1.53061, 3.684456, -0.3990228, 1, 0, 0.4078431, 1,
1.530844, -0.05678217, 2.284711, 1, 0, 0.4039216, 1,
1.537149, -1.958547, 2.359528, 1, 0, 0.3960784, 1,
1.542603, -1.7298, 0.02389519, 1, 0, 0.3882353, 1,
1.553288, 0.01228698, 1.326277, 1, 0, 0.3843137, 1,
1.578141, 2.067559, 2.587249, 1, 0, 0.3764706, 1,
1.581929, -1.457665, 2.232883, 1, 0, 0.372549, 1,
1.589867, -0.9607634, 1.359637, 1, 0, 0.3647059, 1,
1.59541, -1.68769, 2.904223, 1, 0, 0.3607843, 1,
1.599878, 1.280167, 1.559371, 1, 0, 0.3529412, 1,
1.600984, -0.5765846, 3.986965, 1, 0, 0.3490196, 1,
1.621194, -0.463223, 2.98551, 1, 0, 0.3411765, 1,
1.627443, 1.236882, 1.335303, 1, 0, 0.3372549, 1,
1.635117, -3.072472, 2.695336, 1, 0, 0.3294118, 1,
1.637324, -1.047175, 2.887878, 1, 0, 0.3254902, 1,
1.638785, -1.276959, 1.932683, 1, 0, 0.3176471, 1,
1.660974, 0.9002572, 2.52594, 1, 0, 0.3137255, 1,
1.666852, -0.4183347, 4.002628, 1, 0, 0.3058824, 1,
1.670182, -0.4499758, 1.142791, 1, 0, 0.2980392, 1,
1.682773, 0.7187191, 2.513753, 1, 0, 0.2941177, 1,
1.686636, -1.378029, 2.816483, 1, 0, 0.2862745, 1,
1.706476, -0.07223686, 2.100823, 1, 0, 0.282353, 1,
1.710916, 1.461272, 0.1652028, 1, 0, 0.2745098, 1,
1.713045, 0.4206278, 2.25736, 1, 0, 0.2705882, 1,
1.737903, -0.170972, 0.7932514, 1, 0, 0.2627451, 1,
1.742268, 1.456511, 0.2378629, 1, 0, 0.2588235, 1,
1.751694, -1.16813, 2.145011, 1, 0, 0.2509804, 1,
1.776122, 0.01072538, 0.9517133, 1, 0, 0.2470588, 1,
1.80739, -0.2356094, 1.004156, 1, 0, 0.2392157, 1,
1.80912, 0.386329, 0.370943, 1, 0, 0.2352941, 1,
1.816485, -1.012818, 2.511499, 1, 0, 0.227451, 1,
1.826105, 0.6365105, 1.891399, 1, 0, 0.2235294, 1,
1.827942, 1.033323, 1.598364, 1, 0, 0.2156863, 1,
1.831002, 0.383846, 2.343932, 1, 0, 0.2117647, 1,
1.840926, -0.8363202, 2.275834, 1, 0, 0.2039216, 1,
1.861141, -1.434991, 2.698128, 1, 0, 0.1960784, 1,
1.879865, 0.5757667, -0.7024029, 1, 0, 0.1921569, 1,
1.891975, -0.3075487, 1.509754, 1, 0, 0.1843137, 1,
1.901227, -0.533376, 3.125227, 1, 0, 0.1803922, 1,
1.939579, -0.1302011, 2.262505, 1, 0, 0.172549, 1,
1.958378, 3.17707, 0.03793872, 1, 0, 0.1686275, 1,
1.979988, -0.7817141, 1.344374, 1, 0, 0.1607843, 1,
1.984758, -0.9882022, 1.94295, 1, 0, 0.1568628, 1,
2.027679, -0.6941912, 1.945823, 1, 0, 0.1490196, 1,
2.039184, 0.2211035, 2.723163, 1, 0, 0.145098, 1,
2.052007, -0.6516065, 2.883094, 1, 0, 0.1372549, 1,
2.059643, -0.08609819, 0.8837011, 1, 0, 0.1333333, 1,
2.069787, -1.621639, 2.029207, 1, 0, 0.1254902, 1,
2.187184, -0.4029856, 2.226915, 1, 0, 0.1215686, 1,
2.195714, 0.7370691, 0.8409268, 1, 0, 0.1137255, 1,
2.212386, 0.2751997, 0.9330245, 1, 0, 0.1098039, 1,
2.225414, 0.4872674, 1.976828, 1, 0, 0.1019608, 1,
2.237728, 0.4793748, 0.9962541, 1, 0, 0.09411765, 1,
2.330039, -0.8638615, 4.061081, 1, 0, 0.09019608, 1,
2.371173, 0.5819337, 0.3043846, 1, 0, 0.08235294, 1,
2.385667, -0.538234, 1.995989, 1, 0, 0.07843138, 1,
2.412553, -0.9862548, 0.5691306, 1, 0, 0.07058824, 1,
2.46327, 0.5472875, 3.41652, 1, 0, 0.06666667, 1,
2.520936, -0.7484644, 1.111427, 1, 0, 0.05882353, 1,
2.583049, 0.8873773, 2.98517, 1, 0, 0.05490196, 1,
2.622739, 0.007923419, 1.692903, 1, 0, 0.04705882, 1,
2.68416, 0.08537501, 2.153832, 1, 0, 0.04313726, 1,
2.761466, -0.8437685, 2.509805, 1, 0, 0.03529412, 1,
2.770981, 0.3310934, 1.352852, 1, 0, 0.03137255, 1,
2.78709, 0.65122, 1.143686, 1, 0, 0.02352941, 1,
3.085825, 0.09258489, 0.6253679, 1, 0, 0.01960784, 1,
3.405406, -0.4736987, 1.03441, 1, 0, 0.01176471, 1,
3.773073, -1.240911, 1.694792, 1, 0, 0.007843138, 1
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
0.2856843, -4.333684, -7.596534, 0, -0.5, 0.5, 0.5,
0.2856843, -4.333684, -7.596534, 1, -0.5, 0.5, 0.5,
0.2856843, -4.333684, -7.596534, 1, 1.5, 0.5, 0.5,
0.2856843, -4.333684, -7.596534, 0, 1.5, 0.5, 0.5
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
-4.383929, 0.2564358, -7.596534, 0, -0.5, 0.5, 0.5,
-4.383929, 0.2564358, -7.596534, 1, -0.5, 0.5, 0.5,
-4.383929, 0.2564358, -7.596534, 1, 1.5, 0.5, 0.5,
-4.383929, 0.2564358, -7.596534, 0, 1.5, 0.5, 0.5
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
-4.383929, -4.333684, 0.1593797, 0, -0.5, 0.5, 0.5,
-4.383929, -4.333684, 0.1593797, 1, -0.5, 0.5, 0.5,
-4.383929, -4.333684, 0.1593797, 1, 1.5, 0.5, 0.5,
-4.383929, -4.333684, 0.1593797, 0, 1.5, 0.5, 0.5
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
-3, -3.274426, -5.806707,
3, -3.274426, -5.806707,
-3, -3.274426, -5.806707,
-3, -3.450969, -6.105012,
-2, -3.274426, -5.806707,
-2, -3.450969, -6.105012,
-1, -3.274426, -5.806707,
-1, -3.450969, -6.105012,
0, -3.274426, -5.806707,
0, -3.450969, -6.105012,
1, -3.274426, -5.806707,
1, -3.450969, -6.105012,
2, -3.274426, -5.806707,
2, -3.450969, -6.105012,
3, -3.274426, -5.806707,
3, -3.450969, -6.105012
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
-3, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
-3, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
-3, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
-3, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
-2, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
-2, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
-2, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
-2, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
-1, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
-1, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
-1, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
-1, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
0, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
0, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
0, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
0, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
1, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
1, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
1, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
1, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
2, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
2, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
2, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
2, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5,
3, -3.804055, -6.701621, 0, -0.5, 0.5, 0.5,
3, -3.804055, -6.701621, 1, -0.5, 0.5, 0.5,
3, -3.804055, -6.701621, 1, 1.5, 0.5, 0.5,
3, -3.804055, -6.701621, 0, 1.5, 0.5, 0.5
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
-3.306326, -3, -5.806707,
-3.306326, 3, -5.806707,
-3.306326, -3, -5.806707,
-3.485927, -3, -6.105012,
-3.306326, -2, -5.806707,
-3.485927, -2, -6.105012,
-3.306326, -1, -5.806707,
-3.485927, -1, -6.105012,
-3.306326, 0, -5.806707,
-3.485927, 0, -6.105012,
-3.306326, 1, -5.806707,
-3.485927, 1, -6.105012,
-3.306326, 2, -5.806707,
-3.485927, 2, -6.105012,
-3.306326, 3, -5.806707,
-3.485927, 3, -6.105012
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
-3.845128, -3, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, -3, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, -3, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, -3, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, -2, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, -2, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, -2, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, -2, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, -1, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, -1, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, -1, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, -1, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, 0, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, 0, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, 0, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, 0, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, 1, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, 1, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, 1, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, 1, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, 2, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, 2, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, 2, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, 2, -6.701621, 0, 1.5, 0.5, 0.5,
-3.845128, 3, -6.701621, 0, -0.5, 0.5, 0.5,
-3.845128, 3, -6.701621, 1, -0.5, 0.5, 0.5,
-3.845128, 3, -6.701621, 1, 1.5, 0.5, 0.5,
-3.845128, 3, -6.701621, 0, 1.5, 0.5, 0.5
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
-3.306326, -3.274426, -4,
-3.306326, -3.274426, 4,
-3.306326, -3.274426, -4,
-3.485927, -3.450969, -4,
-3.306326, -3.274426, -2,
-3.485927, -3.450969, -2,
-3.306326, -3.274426, 0,
-3.485927, -3.450969, 0,
-3.306326, -3.274426, 2,
-3.485927, -3.450969, 2,
-3.306326, -3.274426, 4,
-3.485927, -3.450969, 4
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
-3.845128, -3.804055, -4, 0, -0.5, 0.5, 0.5,
-3.845128, -3.804055, -4, 1, -0.5, 0.5, 0.5,
-3.845128, -3.804055, -4, 1, 1.5, 0.5, 0.5,
-3.845128, -3.804055, -4, 0, 1.5, 0.5, 0.5,
-3.845128, -3.804055, -2, 0, -0.5, 0.5, 0.5,
-3.845128, -3.804055, -2, 1, -0.5, 0.5, 0.5,
-3.845128, -3.804055, -2, 1, 1.5, 0.5, 0.5,
-3.845128, -3.804055, -2, 0, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 0, 0, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 0, 1, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 0, 1, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 0, 0, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 2, 0, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 2, 1, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 2, 1, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 2, 0, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 4, 0, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 4, 1, -0.5, 0.5, 0.5,
-3.845128, -3.804055, 4, 1, 1.5, 0.5, 0.5,
-3.845128, -3.804055, 4, 0, 1.5, 0.5, 0.5
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
-3.306326, -3.274426, -5.806707,
-3.306326, 3.787297, -5.806707,
-3.306326, -3.274426, 6.125467,
-3.306326, 3.787297, 6.125467,
-3.306326, -3.274426, -5.806707,
-3.306326, -3.274426, 6.125467,
-3.306326, 3.787297, -5.806707,
-3.306326, 3.787297, 6.125467,
-3.306326, -3.274426, -5.806707,
3.877695, -3.274426, -5.806707,
-3.306326, -3.274426, 6.125467,
3.877695, -3.274426, 6.125467,
-3.306326, 3.787297, -5.806707,
3.877695, 3.787297, -5.806707,
-3.306326, 3.787297, 6.125467,
3.877695, 3.787297, 6.125467,
3.877695, -3.274426, -5.806707,
3.877695, 3.787297, -5.806707,
3.877695, -3.274426, 6.125467,
3.877695, 3.787297, 6.125467,
3.877695, -3.274426, -5.806707,
3.877695, -3.274426, 6.125467,
3.877695, 3.787297, -5.806707,
3.877695, 3.787297, 6.125467
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
var radius = 8.338562;
var distance = 37.09921;
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
mvMatrix.translate( -0.2856843, -0.2564358, -0.1593797 );
mvMatrix.scale( 1.254982, 1.276716, 0.7555888 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.09921);
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
3-diethoxyphosphinot<-read.table("3-diethoxyphosphinot.xyz")
```

```
## Error in read.table("3-diethoxyphosphinot.xyz"): no lines available in input
```

```r
x<-3-diethoxyphosphinot$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethoxyphosphinot' not found
```

```r
y<-3-diethoxyphosphinot$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethoxyphosphinot' not found
```

```r
z<-3-diethoxyphosphinot$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethoxyphosphinot' not found
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
-3.201705, -0.1016521, -0.4388985, 0, 0, 1, 1, 1,
-2.752934, -0.6777931, -3.148812, 1, 0, 0, 1, 1,
-2.666235, -0.8930938, -2.648411, 1, 0, 0, 1, 1,
-2.524858, 0.3731946, -2.638495, 1, 0, 0, 1, 1,
-2.477177, -0.2826268, 0.4388384, 1, 0, 0, 1, 1,
-2.409942, -0.7314121, -0.4261184, 1, 0, 0, 1, 1,
-2.381377, -0.3643116, -0.5358333, 0, 0, 0, 1, 1,
-2.32081, -0.289108, -2.789511, 0, 0, 0, 1, 1,
-2.300242, 0.2307997, -1.900113, 0, 0, 0, 1, 1,
-2.2955, 0.8967162, -0.8199545, 0, 0, 0, 1, 1,
-2.279382, -0.2223593, -1.289285, 0, 0, 0, 1, 1,
-2.26488, 0.8381127, -1.229219, 0, 0, 0, 1, 1,
-2.240334, -0.9522927, -0.8239481, 0, 0, 0, 1, 1,
-2.209512, -0.9187359, -1.073714, 1, 1, 1, 1, 1,
-2.191146, -0.788044, -3.528556, 1, 1, 1, 1, 1,
-2.180813, -0.1378934, -1.682459, 1, 1, 1, 1, 1,
-2.077344, 0.239614, -0.2644087, 1, 1, 1, 1, 1,
-2.077188, 1.028079, -1.242395, 1, 1, 1, 1, 1,
-2.065909, -0.02139371, -2.99419, 1, 1, 1, 1, 1,
-2.059495, 0.824286, -0.8190687, 1, 1, 1, 1, 1,
-2.04568, -0.3994454, -1.737751, 1, 1, 1, 1, 1,
-2.029065, -0.1543098, -1.890349, 1, 1, 1, 1, 1,
-2.022387, 0.6259907, -0.5210579, 1, 1, 1, 1, 1,
-2.014345, -0.325936, -1.396119, 1, 1, 1, 1, 1,
-2.007583, 0.6439149, -0.9592574, 1, 1, 1, 1, 1,
-1.987848, -0.8850465, -2.125907, 1, 1, 1, 1, 1,
-1.961786, 0.3223479, -0.6964907, 1, 1, 1, 1, 1,
-1.956001, -1.174613, -2.313935, 1, 1, 1, 1, 1,
-1.954053, -1.076449, -0.8919152, 0, 0, 1, 1, 1,
-1.918796, -0.3203712, -2.527404, 1, 0, 0, 1, 1,
-1.884136, 0.8767387, -2.054512, 1, 0, 0, 1, 1,
-1.880308, -0.2792236, -1.088394, 1, 0, 0, 1, 1,
-1.875953, 0.2584503, -1.469007, 1, 0, 0, 1, 1,
-1.864389, 0.8192165, -0.4815408, 1, 0, 0, 1, 1,
-1.862303, 1.268323, -0.9540469, 0, 0, 0, 1, 1,
-1.851851, 0.09423874, -0.8898259, 0, 0, 0, 1, 1,
-1.817435, 0.08285571, -2.021594, 0, 0, 0, 1, 1,
-1.81649, 0.0008211141, -2.876736, 0, 0, 0, 1, 1,
-1.811053, -0.9877821, -1.904175, 0, 0, 0, 1, 1,
-1.796373, -1.464001, -1.711495, 0, 0, 0, 1, 1,
-1.778303, 1.49796, -0.5147119, 0, 0, 0, 1, 1,
-1.775923, -0.8417605, -3.123665, 1, 1, 1, 1, 1,
-1.735878, -1.047423, -2.681038, 1, 1, 1, 1, 1,
-1.726602, -1.864974, -0.9531888, 1, 1, 1, 1, 1,
-1.724662, -1.406612, -2.419307, 1, 1, 1, 1, 1,
-1.693531, 1.371616, -0.2288524, 1, 1, 1, 1, 1,
-1.678134, 0.2108899, -3.144921, 1, 1, 1, 1, 1,
-1.66957, -0.2281117, -2.055347, 1, 1, 1, 1, 1,
-1.666443, -0.9300897, -1.814428, 1, 1, 1, 1, 1,
-1.66514, 1.816669, -1.625677, 1, 1, 1, 1, 1,
-1.662923, -0.562473, -3.037057, 1, 1, 1, 1, 1,
-1.642812, 0.1496237, -1.027797, 1, 1, 1, 1, 1,
-1.634336, -0.6360284, -1.167965, 1, 1, 1, 1, 1,
-1.623035, 0.02509195, -1.74741, 1, 1, 1, 1, 1,
-1.598708, 0.2041522, -1.49355, 1, 1, 1, 1, 1,
-1.590599, 0.6210191, -1.303933, 1, 1, 1, 1, 1,
-1.584672, 1.499981, -0.1953045, 0, 0, 1, 1, 1,
-1.575298, 2.226876, -2.31395, 1, 0, 0, 1, 1,
-1.563468, -0.5651999, -3.097304, 1, 0, 0, 1, 1,
-1.562498, 2.474973, 0.5188587, 1, 0, 0, 1, 1,
-1.550441, -0.2058729, -1.792619, 1, 0, 0, 1, 1,
-1.541336, 1.826603, -1.508657, 1, 0, 0, 1, 1,
-1.533421, -0.9219579, -1.387182, 0, 0, 0, 1, 1,
-1.520091, -0.2602646, -1.120067, 0, 0, 0, 1, 1,
-1.519589, -1.569133, -3.452636, 0, 0, 0, 1, 1,
-1.517107, -0.9730408, -2.171304, 0, 0, 0, 1, 1,
-1.51328, 1.641744, -1.227985, 0, 0, 0, 1, 1,
-1.506126, -0.7281841, -2.973078, 0, 0, 0, 1, 1,
-1.502395, -0.522736, -0.9101674, 0, 0, 0, 1, 1,
-1.502156, 0.7126001, -1.767331, 1, 1, 1, 1, 1,
-1.496837, 0.522804, 0.373924, 1, 1, 1, 1, 1,
-1.470623, 0.6639391, -0.7093477, 1, 1, 1, 1, 1,
-1.468819, 1.235095, -0.943951, 1, 1, 1, 1, 1,
-1.443183, -0.9316251, -3.745652, 1, 1, 1, 1, 1,
-1.441027, -2.283367, -2.686052, 1, 1, 1, 1, 1,
-1.431653, 0.05367827, -1.730304, 1, 1, 1, 1, 1,
-1.430755, 0.1223634, -1.965695, 1, 1, 1, 1, 1,
-1.428184, -0.2785582, -1.349878, 1, 1, 1, 1, 1,
-1.415247, 0.9541091, -2.623776, 1, 1, 1, 1, 1,
-1.4127, 0.5730556, -2.602486, 1, 1, 1, 1, 1,
-1.410887, 1.352193, 0.8075726, 1, 1, 1, 1, 1,
-1.40864, 0.8519408, -2.513904, 1, 1, 1, 1, 1,
-1.40632, -0.8379334, -1.024901, 1, 1, 1, 1, 1,
-1.403094, -0.8855564, -3.061007, 1, 1, 1, 1, 1,
-1.399697, 2.384132, -2.309987, 0, 0, 1, 1, 1,
-1.398243, 0.4474436, -1.225653, 1, 0, 0, 1, 1,
-1.390288, -0.4290773, -1.345339, 1, 0, 0, 1, 1,
-1.390051, -1.16981, -1.252424, 1, 0, 0, 1, 1,
-1.375293, -0.08768894, -0.7735012, 1, 0, 0, 1, 1,
-1.363904, -0.4203311, -0.767568, 1, 0, 0, 1, 1,
-1.357253, -0.80911, -1.23271, 0, 0, 0, 1, 1,
-1.356961, -0.9128454, -2.279144, 0, 0, 0, 1, 1,
-1.350509, -0.8177631, -3.155689, 0, 0, 0, 1, 1,
-1.348773, -0.9225508, -2.388197, 0, 0, 0, 1, 1,
-1.345718, -1.468934, -1.567099, 0, 0, 0, 1, 1,
-1.341053, -1.18062, -3.702046, 0, 0, 0, 1, 1,
-1.323073, 0.767348, -1.263279, 0, 0, 0, 1, 1,
-1.322743, -1.037666, -1.334865, 1, 1, 1, 1, 1,
-1.314838, 0.8340144, -3.297191, 1, 1, 1, 1, 1,
-1.310082, -0.2725825, -2.16445, 1, 1, 1, 1, 1,
-1.300175, 0.2805408, -0.2497047, 1, 1, 1, 1, 1,
-1.296002, -1.181336, -2.933338, 1, 1, 1, 1, 1,
-1.294811, 2.22537, -0.3197965, 1, 1, 1, 1, 1,
-1.29388, -0.4723461, -0.9993391, 1, 1, 1, 1, 1,
-1.293341, -1.22866, -2.794985, 1, 1, 1, 1, 1,
-1.287117, -2.110885, -2.528712, 1, 1, 1, 1, 1,
-1.285464, 1.468929, -0.4675565, 1, 1, 1, 1, 1,
-1.284019, 0.7625469, -1.778387, 1, 1, 1, 1, 1,
-1.283017, -0.9936356, -1.285075, 1, 1, 1, 1, 1,
-1.272639, -0.3580821, -2.184018, 1, 1, 1, 1, 1,
-1.270657, 0.04656787, -2.463841, 1, 1, 1, 1, 1,
-1.265586, 0.4675128, -1.143745, 1, 1, 1, 1, 1,
-1.255774, -0.9345533, -1.87219, 0, 0, 1, 1, 1,
-1.253348, -1.396631, -2.513801, 1, 0, 0, 1, 1,
-1.253189, 0.6052063, -1.235445, 1, 0, 0, 1, 1,
-1.251889, 2.001975, -0.1678654, 1, 0, 0, 1, 1,
-1.250718, -0.7961427, -2.824805, 1, 0, 0, 1, 1,
-1.249688, 0.1038059, -3.065041, 1, 0, 0, 1, 1,
-1.238965, -0.4020314, -1.928057, 0, 0, 0, 1, 1,
-1.232636, 0.2326768, -1.24338, 0, 0, 0, 1, 1,
-1.230872, 1.158984, -1.554679, 0, 0, 0, 1, 1,
-1.229314, -0.05520517, -0.9059083, 0, 0, 0, 1, 1,
-1.225486, 0.718525, -1.601128, 0, 0, 0, 1, 1,
-1.220764, 0.3895506, -0.8295897, 0, 0, 0, 1, 1,
-1.220647, -2.128011, -2.474027, 0, 0, 0, 1, 1,
-1.217299, 0.2719721, -2.012845, 1, 1, 1, 1, 1,
-1.216662, 0.1769744, -1.114908, 1, 1, 1, 1, 1,
-1.20523, -0.04407278, -4.907611, 1, 1, 1, 1, 1,
-1.203148, -0.3116407, -2.198026, 1, 1, 1, 1, 1,
-1.200913, -0.8972329, -3.502303, 1, 1, 1, 1, 1,
-1.19236, 1.012174, -0.3941483, 1, 1, 1, 1, 1,
-1.189429, 0.7559009, -0.02279755, 1, 1, 1, 1, 1,
-1.186403, -1.17103, -0.9569545, 1, 1, 1, 1, 1,
-1.176792, 0.9184082, -1.399613, 1, 1, 1, 1, 1,
-1.175768, -0.3981618, -2.94913, 1, 1, 1, 1, 1,
-1.174132, 0.5362988, -1.404551, 1, 1, 1, 1, 1,
-1.165235, -0.3651772, -2.673099, 1, 1, 1, 1, 1,
-1.14974, 0.1279772, -2.23967, 1, 1, 1, 1, 1,
-1.149387, -0.07786275, -2.272348, 1, 1, 1, 1, 1,
-1.147138, -1.035053, -2.57546, 1, 1, 1, 1, 1,
-1.13782, -0.1732536, -3.789834, 0, 0, 1, 1, 1,
-1.137186, 1.546822, 0.4268395, 1, 0, 0, 1, 1,
-1.13542, -0.3133343, -0.8306442, 1, 0, 0, 1, 1,
-1.135276, -0.6728796, -0.1661439, 1, 0, 0, 1, 1,
-1.12735, 1.178727, -0.4395892, 1, 0, 0, 1, 1,
-1.118996, -1.17455, -1.037686, 1, 0, 0, 1, 1,
-1.114956, 0.4050216, -0.4031549, 0, 0, 0, 1, 1,
-1.105348, 2.052465, -0.5133134, 0, 0, 0, 1, 1,
-1.100079, 0.3597071, -0.1682446, 0, 0, 0, 1, 1,
-1.09985, 0.4000936, -2.523467, 0, 0, 0, 1, 1,
-1.099208, 1.096909, -1.861268, 0, 0, 0, 1, 1,
-1.098728, -0.07429423, -0.9765731, 0, 0, 0, 1, 1,
-1.094925, -0.1415784, -4.110847, 0, 0, 0, 1, 1,
-1.093347, -0.486632, -2.823848, 1, 1, 1, 1, 1,
-1.089794, 0.1388549, -1.171296, 1, 1, 1, 1, 1,
-1.074356, -1.22773, -0.6606095, 1, 1, 1, 1, 1,
-1.060641, -1.093575, -3.204236, 1, 1, 1, 1, 1,
-1.052564, 0.8896723, 1.32424, 1, 1, 1, 1, 1,
-1.052087, -0.574746, -1.604311, 1, 1, 1, 1, 1,
-1.050826, 1.13507, -1.188429, 1, 1, 1, 1, 1,
-1.038469, -0.1680944, -1.33635, 1, 1, 1, 1, 1,
-1.034922, 0.2876359, 0.1068047, 1, 1, 1, 1, 1,
-1.034843, -0.08327721, -2.119316, 1, 1, 1, 1, 1,
-1.034535, 0.8047737, -1.385232, 1, 1, 1, 1, 1,
-1.027877, 0.7718349, -2.35342, 1, 1, 1, 1, 1,
-1.026774, 0.5815127, -0.1878598, 1, 1, 1, 1, 1,
-1.022069, -1.485524, -2.54087, 1, 1, 1, 1, 1,
-1.016728, 0.08419529, -4.641245, 1, 1, 1, 1, 1,
-1.010769, -0.9788584, -5.632938, 0, 0, 1, 1, 1,
-1.002259, 1.17943, -1.531286, 1, 0, 0, 1, 1,
-0.9973195, -0.6911169, -1.098281, 1, 0, 0, 1, 1,
-0.996382, -0.306543, -2.720453, 1, 0, 0, 1, 1,
-0.9918275, 0.1943934, -1.150617, 1, 0, 0, 1, 1,
-0.9906878, 0.8907145, 0.1070288, 1, 0, 0, 1, 1,
-0.9882447, -0.9895734, -0.9957632, 0, 0, 0, 1, 1,
-0.9867043, 1.332603, -0.1495267, 0, 0, 0, 1, 1,
-0.980488, 0.411599, 0.01673563, 0, 0, 0, 1, 1,
-0.9791428, 0.295948, -2.001316, 0, 0, 0, 1, 1,
-0.9791346, 0.1601306, 0.239718, 0, 0, 0, 1, 1,
-0.9777352, 0.5902234, -1.274197, 0, 0, 0, 1, 1,
-0.9731314, -1.418278, -2.115912, 0, 0, 0, 1, 1,
-0.9697714, 0.3214916, -0.9847135, 1, 1, 1, 1, 1,
-0.9691844, 0.1701928, -2.72971, 1, 1, 1, 1, 1,
-0.9677728, -0.04826543, -1.869035, 1, 1, 1, 1, 1,
-0.9636236, -2.179355, -2.308329, 1, 1, 1, 1, 1,
-0.9593546, -0.9709591, -2.17283, 1, 1, 1, 1, 1,
-0.9585465, -1.712178, -2.142318, 1, 1, 1, 1, 1,
-0.9580253, -0.1843244, -1.667777, 1, 1, 1, 1, 1,
-0.9474932, -0.5119324, -2.154791, 1, 1, 1, 1, 1,
-0.9371222, -1.247128, -1.805635, 1, 1, 1, 1, 1,
-0.9308093, 1.021395, -0.8592331, 1, 1, 1, 1, 1,
-0.9226751, -2.158287, -3.696685, 1, 1, 1, 1, 1,
-0.9185209, 0.197513, 0.5376687, 1, 1, 1, 1, 1,
-0.9174673, 1.715268, -2.018473, 1, 1, 1, 1, 1,
-0.9167732, -1.485757, -2.538179, 1, 1, 1, 1, 1,
-0.9141024, 1.329907, 2.116805, 1, 1, 1, 1, 1,
-0.9096889, 0.5019746, -2.190976, 0, 0, 1, 1, 1,
-0.9078399, -0.2944968, -0.9941007, 1, 0, 0, 1, 1,
-0.9060994, -1.314522, -2.92988, 1, 0, 0, 1, 1,
-0.9037483, -0.9068452, -1.021321, 1, 0, 0, 1, 1,
-0.9021534, -1.419424, -3.144336, 1, 0, 0, 1, 1,
-0.896684, 2.059834, -0.3750179, 1, 0, 0, 1, 1,
-0.8965733, -1.176087, -2.21229, 0, 0, 0, 1, 1,
-0.8901476, 0.05473038, -3.485569, 0, 0, 0, 1, 1,
-0.8877352, -1.16604, -3.609331, 0, 0, 0, 1, 1,
-0.8860859, 0.6137774, -2.040428, 0, 0, 0, 1, 1,
-0.8839965, 0.2347429, -1.596096, 0, 0, 0, 1, 1,
-0.8773248, -0.6194114, -1.563256, 0, 0, 0, 1, 1,
-0.8704419, 0.4469784, -2.796651, 0, 0, 0, 1, 1,
-0.867829, 0.2801912, -0.8368488, 1, 1, 1, 1, 1,
-0.8656802, 0.9750871, -1.637478, 1, 1, 1, 1, 1,
-0.8626592, -0.7070168, -4.767371, 1, 1, 1, 1, 1,
-0.8562872, -1.682686, -2.67565, 1, 1, 1, 1, 1,
-0.8545724, 0.8926767, -3.25127, 1, 1, 1, 1, 1,
-0.8460956, -1.047861, -1.932303, 1, 1, 1, 1, 1,
-0.8453158, 0.6429828, -1.65626, 1, 1, 1, 1, 1,
-0.8426276, 0.4096338, -0.7017476, 1, 1, 1, 1, 1,
-0.8419597, -1.135208, -3.070842, 1, 1, 1, 1, 1,
-0.8412066, 0.2476479, 0.1580627, 1, 1, 1, 1, 1,
-0.8398796, 0.14371, -0.6928618, 1, 1, 1, 1, 1,
-0.8388994, 0.1284773, -1.840546, 1, 1, 1, 1, 1,
-0.8356389, 1.57, -0.9490207, 1, 1, 1, 1, 1,
-0.8340303, -0.5026005, -0.98369, 1, 1, 1, 1, 1,
-0.8318016, -0.04815227, -2.066691, 1, 1, 1, 1, 1,
-0.8312089, 0.07039025, 0.7378939, 0, 0, 1, 1, 1,
-0.8234175, 0.6974917, -1.792758, 1, 0, 0, 1, 1,
-0.81762, 0.4306288, 0.6893228, 1, 0, 0, 1, 1,
-0.8170335, 0.494289, 0.8324444, 1, 0, 0, 1, 1,
-0.8160402, -0.3182359, -2.432645, 1, 0, 0, 1, 1,
-0.8120118, 1.06642, -1.389924, 1, 0, 0, 1, 1,
-0.8098654, -1.991864, -3.181393, 0, 0, 0, 1, 1,
-0.8048189, 0.1965829, -1.825357, 0, 0, 0, 1, 1,
-0.8022006, 1.428867, -1.459517, 0, 0, 0, 1, 1,
-0.8012838, 0.07061701, -2.150189, 0, 0, 0, 1, 1,
-0.796425, 0.4000996, -0.904517, 0, 0, 0, 1, 1,
-0.7959938, 1.298187, -0.1893642, 0, 0, 0, 1, 1,
-0.7944052, -0.2733072, -1.515471, 0, 0, 0, 1, 1,
-0.7943344, 0.74921, -0.3906858, 1, 1, 1, 1, 1,
-0.79177, 2.020146, -2.623133, 1, 1, 1, 1, 1,
-0.7905962, -0.2883595, -0.4406763, 1, 1, 1, 1, 1,
-0.7902788, -0.4767855, -1.867548, 1, 1, 1, 1, 1,
-0.7830742, 0.5914756, -1.376613, 1, 1, 1, 1, 1,
-0.774873, -1.557313, -2.414611, 1, 1, 1, 1, 1,
-0.7690783, -0.608366, -1.751658, 1, 1, 1, 1, 1,
-0.7651809, 0.06580482, -0.715481, 1, 1, 1, 1, 1,
-0.763645, -0.4044047, -3.865772, 1, 1, 1, 1, 1,
-0.7534704, -0.1985157, -0.3424644, 1, 1, 1, 1, 1,
-0.7494559, 1.622646, -1.361542, 1, 1, 1, 1, 1,
-0.7489011, -0.1968915, -1.500291, 1, 1, 1, 1, 1,
-0.7460434, -1.493247, -2.753417, 1, 1, 1, 1, 1,
-0.7417674, -0.2313421, -0.2271156, 1, 1, 1, 1, 1,
-0.7379037, 0.6450202, -1.739388, 1, 1, 1, 1, 1,
-0.7334635, -1.058491, -2.153484, 0, 0, 1, 1, 1,
-0.7279446, 0.7864144, -2.05327, 1, 0, 0, 1, 1,
-0.7191131, -1.432652, -2.891876, 1, 0, 0, 1, 1,
-0.7151366, -0.04269374, -2.039576, 1, 0, 0, 1, 1,
-0.7096369, -0.175084, -1.528265, 1, 0, 0, 1, 1,
-0.7089306, -0.4063651, -2.61743, 1, 0, 0, 1, 1,
-0.7070041, 2.208122, -0.4808881, 0, 0, 0, 1, 1,
-0.7064831, 1.155905, 0.2260815, 0, 0, 0, 1, 1,
-0.7004026, -2.04671, -2.595875, 0, 0, 0, 1, 1,
-0.7000777, -1.648143, -1.746692, 0, 0, 0, 1, 1,
-0.6999214, -1.220262, -3.037624, 0, 0, 0, 1, 1,
-0.698848, -0.1401122, -0.5385464, 0, 0, 0, 1, 1,
-0.6930252, 0.6389036, 1.709912, 0, 0, 0, 1, 1,
-0.6871497, 0.219369, -1.090155, 1, 1, 1, 1, 1,
-0.6857597, -0.5295567, -1.595917, 1, 1, 1, 1, 1,
-0.6855631, 0.07358524, -2.805978, 1, 1, 1, 1, 1,
-0.6750129, 1.24988, -0.424516, 1, 1, 1, 1, 1,
-0.6669062, 0.4558598, -0.3353216, 1, 1, 1, 1, 1,
-0.6651934, 0.3665773, -1.296555, 1, 1, 1, 1, 1,
-0.6621804, 0.1266001, -1.959873, 1, 1, 1, 1, 1,
-0.6617222, -1.289412, -2.242826, 1, 1, 1, 1, 1,
-0.6610007, -1.722308, -3.113975, 1, 1, 1, 1, 1,
-0.6582831, -1.094003, -3.529274, 1, 1, 1, 1, 1,
-0.6530832, -1.13918, -3.744254, 1, 1, 1, 1, 1,
-0.6441067, 0.2795254, -3.492639, 1, 1, 1, 1, 1,
-0.6434613, -0.6346192, -0.7091951, 1, 1, 1, 1, 1,
-0.64318, 0.7283746, -1.672098, 1, 1, 1, 1, 1,
-0.6358904, 1.630586, -0.6055174, 1, 1, 1, 1, 1,
-0.6352826, 0.4595162, -1.365108, 0, 0, 1, 1, 1,
-0.6328697, -0.6700277, -2.467865, 1, 0, 0, 1, 1,
-0.632452, -0.7684839, -2.284695, 1, 0, 0, 1, 1,
-0.6320513, -0.07688278, -2.231098, 1, 0, 0, 1, 1,
-0.630922, -0.5239941, -0.4774196, 1, 0, 0, 1, 1,
-0.6307524, 0.07447028, -2.075591, 1, 0, 0, 1, 1,
-0.6272163, 1.852051, -1.359849, 0, 0, 0, 1, 1,
-0.6272084, 1.105087, -1.899278, 0, 0, 0, 1, 1,
-0.6270783, 1.487397, 1.307781, 0, 0, 0, 1, 1,
-0.6259556, 0.3501669, 0.1535301, 0, 0, 0, 1, 1,
-0.6228868, 1.056054, -0.9239779, 0, 0, 0, 1, 1,
-0.6181917, 0.5705071, -0.2805305, 0, 0, 0, 1, 1,
-0.6113002, -1.130931, -1.037056, 0, 0, 0, 1, 1,
-0.6107451, 0.2262032, -2.192626, 1, 1, 1, 1, 1,
-0.6080828, 1.689451, 0.5368016, 1, 1, 1, 1, 1,
-0.601348, 0.5226366, -1.481496, 1, 1, 1, 1, 1,
-0.5983331, -0.5274296, -2.368644, 1, 1, 1, 1, 1,
-0.5897469, -0.3577446, -3.052003, 1, 1, 1, 1, 1,
-0.5877241, 1.110309, -0.2996845, 1, 1, 1, 1, 1,
-0.5806006, 1.268436, -1.271431, 1, 1, 1, 1, 1,
-0.5782405, 1.948924, -0.1950392, 1, 1, 1, 1, 1,
-0.5767496, -2.068074, -2.080842, 1, 1, 1, 1, 1,
-0.5765008, -1.781986, -1.505487, 1, 1, 1, 1, 1,
-0.5753379, -0.5060238, -2.382905, 1, 1, 1, 1, 1,
-0.5688401, 0.9683118, 0.9381139, 1, 1, 1, 1, 1,
-0.5669444, -1.339449, -3.318917, 1, 1, 1, 1, 1,
-0.5620534, 0.7168252, -1.575314, 1, 1, 1, 1, 1,
-0.55948, 0.9421619, -1.26559, 1, 1, 1, 1, 1,
-0.5582685, -0.5931691, -2.307288, 0, 0, 1, 1, 1,
-0.5563434, 0.3829938, -0.6747068, 1, 0, 0, 1, 1,
-0.5555474, -0.1329715, -1.75247, 1, 0, 0, 1, 1,
-0.5472867, -1.709425, -4.541348, 1, 0, 0, 1, 1,
-0.5460818, 0.1284157, -1.997902, 1, 0, 0, 1, 1,
-0.5440149, -1.765532, -2.292494, 1, 0, 0, 1, 1,
-0.5395429, 0.3011358, -2.614966, 0, 0, 0, 1, 1,
-0.5372574, -0.5315806, -2.945239, 0, 0, 0, 1, 1,
-0.5309438, -0.0351534, -1.798308, 0, 0, 0, 1, 1,
-0.5280218, -1.133054, -4.148268, 0, 0, 0, 1, 1,
-0.525968, -0.49871, -0.603924, 0, 0, 0, 1, 1,
-0.5251469, 0.3568749, -2.208772, 0, 0, 0, 1, 1,
-0.5179151, -0.9581321, -2.433728, 0, 0, 0, 1, 1,
-0.5153965, -0.2811804, -2.338547, 1, 1, 1, 1, 1,
-0.5109539, -0.4151171, -2.349156, 1, 1, 1, 1, 1,
-0.5108349, 0.6512011, -0.5804209, 1, 1, 1, 1, 1,
-0.5053752, -0.1091242, -1.370598, 1, 1, 1, 1, 1,
-0.5041519, -1.788279, -2.252697, 1, 1, 1, 1, 1,
-0.50063, -0.7014651, -2.630933, 1, 1, 1, 1, 1,
-0.5001117, -0.6079202, -2.399989, 1, 1, 1, 1, 1,
-0.4889483, -1.215418, -2.452977, 1, 1, 1, 1, 1,
-0.487692, -0.5182717, -1.774729, 1, 1, 1, 1, 1,
-0.4876142, -0.5398607, -2.683866, 1, 1, 1, 1, 1,
-0.4871978, -0.8276315, -4.283622, 1, 1, 1, 1, 1,
-0.4862478, 0.2937365, -1.336719, 1, 1, 1, 1, 1,
-0.4847241, -0.1033899, -1.921637, 1, 1, 1, 1, 1,
-0.483691, 0.5200627, -0.7473292, 1, 1, 1, 1, 1,
-0.4794976, -1.375849, -2.960869, 1, 1, 1, 1, 1,
-0.4794371, 0.6062278, 0.5431966, 0, 0, 1, 1, 1,
-0.4791234, -2.579129, -2.147582, 1, 0, 0, 1, 1,
-0.4774854, -0.3626569, -2.693824, 1, 0, 0, 1, 1,
-0.4767281, 0.8080181, 0.9868916, 1, 0, 0, 1, 1,
-0.476272, 0.6338083, -0.5042679, 1, 0, 0, 1, 1,
-0.473644, 1.812876, 0.4165067, 1, 0, 0, 1, 1,
-0.4729607, 0.5629099, -1.76146, 0, 0, 0, 1, 1,
-0.4723553, -0.5186823, -1.829242, 0, 0, 0, 1, 1,
-0.4716459, 0.02155301, -0.5419006, 0, 0, 0, 1, 1,
-0.4616195, -1.510217, -3.128082, 0, 0, 0, 1, 1,
-0.4615158, 1.492618, -1.053786, 0, 0, 0, 1, 1,
-0.4601505, 0.08054652, -2.393714, 0, 0, 0, 1, 1,
-0.4568313, -0.2486902, -1.422897, 0, 0, 0, 1, 1,
-0.4559126, 2.004196, -2.344187, 1, 1, 1, 1, 1,
-0.4503281, 0.7919723, 0.01260104, 1, 1, 1, 1, 1,
-0.4496818, -0.4325312, -3.089486, 1, 1, 1, 1, 1,
-0.4494066, -1.55368, -3.510766, 1, 1, 1, 1, 1,
-0.4467255, -0.4700432, -1.822778, 1, 1, 1, 1, 1,
-0.4464908, -1.997436, -2.959132, 1, 1, 1, 1, 1,
-0.4451806, 1.141632, -0.1166141, 1, 1, 1, 1, 1,
-0.4447647, 1.880598, -0.4633952, 1, 1, 1, 1, 1,
-0.4430573, 0.2580416, 0.3178218, 1, 1, 1, 1, 1,
-0.4412264, 1.150002, -0.9507898, 1, 1, 1, 1, 1,
-0.4380741, 1.396979, 0.005911462, 1, 1, 1, 1, 1,
-0.4374822, 0.3072433, -1.471181, 1, 1, 1, 1, 1,
-0.4366889, -0.8978953, -3.408257, 1, 1, 1, 1, 1,
-0.4325966, 0.6445233, -1.492379, 1, 1, 1, 1, 1,
-0.429927, -0.2115087, -1.936995, 1, 1, 1, 1, 1,
-0.4256423, -0.1657973, -1.909442, 0, 0, 1, 1, 1,
-0.4248417, -1.068213, -4.542252, 1, 0, 0, 1, 1,
-0.4239681, 0.8669647, 0.538583, 1, 0, 0, 1, 1,
-0.4207297, -0.9847748, -2.182688, 1, 0, 0, 1, 1,
-0.4185539, 0.1408641, -0.9785542, 1, 0, 0, 1, 1,
-0.418303, 0.8633264, 0.5195892, 1, 0, 0, 1, 1,
-0.4148612, 0.3598419, 1.095792, 0, 0, 0, 1, 1,
-0.4119871, -0.1525599, -2.835084, 0, 0, 0, 1, 1,
-0.4107362, -0.4229584, -1.106973, 0, 0, 0, 1, 1,
-0.4101919, -0.2310191, -3.842304, 0, 0, 0, 1, 1,
-0.4053552, 0.3372938, -1.364493, 0, 0, 0, 1, 1,
-0.4010279, 1.355465, 0.5095153, 0, 0, 0, 1, 1,
-0.3962498, 1.043869, -1.313095, 0, 0, 0, 1, 1,
-0.3955073, 1.073732, 0.1260641, 1, 1, 1, 1, 1,
-0.3923103, 0.01212989, -2.020454, 1, 1, 1, 1, 1,
-0.3886337, 0.09613837, -1.686348, 1, 1, 1, 1, 1,
-0.3869531, -0.02545151, -2.035393, 1, 1, 1, 1, 1,
-0.3866556, 2.235719, -0.3085299, 1, 1, 1, 1, 1,
-0.3862702, 1.348776, -0.9770251, 1, 1, 1, 1, 1,
-0.3842843, -1.734231, -3.59849, 1, 1, 1, 1, 1,
-0.3826371, 0.2619312, -1.76119, 1, 1, 1, 1, 1,
-0.3815193, 0.4695937, 1.583445, 1, 1, 1, 1, 1,
-0.3813955, -0.3544827, -2.761359, 1, 1, 1, 1, 1,
-0.3811716, 1.360659, -0.914323, 1, 1, 1, 1, 1,
-0.3798711, 0.478094, -0.2836756, 1, 1, 1, 1, 1,
-0.369405, -0.1244971, -1.30418, 1, 1, 1, 1, 1,
-0.3691993, -0.08184193, -0.7346526, 1, 1, 1, 1, 1,
-0.3675108, -1.577582, -3.949155, 1, 1, 1, 1, 1,
-0.3659294, 0.8347528, -0.5384219, 0, 0, 1, 1, 1,
-0.3616399, -0.8749885, -2.278276, 1, 0, 0, 1, 1,
-0.3588022, 0.1192152, -1.7782, 1, 0, 0, 1, 1,
-0.3582386, -0.09859596, -0.2866046, 1, 0, 0, 1, 1,
-0.3514785, 0.7229065, -1.577617, 1, 0, 0, 1, 1,
-0.3489066, 1.371658, -1.088242, 1, 0, 0, 1, 1,
-0.3466492, -0.863107, -1.870331, 0, 0, 0, 1, 1,
-0.3439939, 1.534718, -0.3819557, 0, 0, 0, 1, 1,
-0.3378197, 0.2800198, -0.04783063, 0, 0, 0, 1, 1,
-0.3346196, 1.275544, 1.486202, 0, 0, 0, 1, 1,
-0.3295444, 0.2423644, 0.1380183, 0, 0, 0, 1, 1,
-0.3239687, 1.560128, 0.2888704, 0, 0, 0, 1, 1,
-0.322673, -1.272376, -3.58058, 0, 0, 0, 1, 1,
-0.3205835, -1.406123, -2.462741, 1, 1, 1, 1, 1,
-0.3200603, 0.3927526, -1.433991, 1, 1, 1, 1, 1,
-0.3197573, -0.1686962, -2.272903, 1, 1, 1, 1, 1,
-0.3094538, 0.02403875, -2.394388, 1, 1, 1, 1, 1,
-0.3085454, -0.2307408, -3.467699, 1, 1, 1, 1, 1,
-0.3083575, -0.5693908, -2.450762, 1, 1, 1, 1, 1,
-0.3057931, 1.114667, 0.179772, 1, 1, 1, 1, 1,
-0.3050126, 1.598904, 0.477771, 1, 1, 1, 1, 1,
-0.3034953, -0.4433378, -3.250989, 1, 1, 1, 1, 1,
-0.3034603, 0.3782953, -0.3342089, 1, 1, 1, 1, 1,
-0.3025247, 0.4338778, 1.1207, 1, 1, 1, 1, 1,
-0.3020003, -0.5314224, -3.50485, 1, 1, 1, 1, 1,
-0.291532, 1.662673, -0.9086952, 1, 1, 1, 1, 1,
-0.2893492, -1.547091, -2.942536, 1, 1, 1, 1, 1,
-0.2891458, 0.2299867, -2.94634, 1, 1, 1, 1, 1,
-0.2849063, 1.571519, -0.9418132, 0, 0, 1, 1, 1,
-0.2845486, 0.8626769, 0.8982077, 1, 0, 0, 1, 1,
-0.2804563, -0.6846544, -2.073868, 1, 0, 0, 1, 1,
-0.2789448, 0.555433, 1.33453, 1, 0, 0, 1, 1,
-0.2776073, -0.6899241, -4.736493, 1, 0, 0, 1, 1,
-0.2758672, -0.2703528, -2.124283, 1, 0, 0, 1, 1,
-0.2725834, 0.3892973, 0.6678189, 0, 0, 0, 1, 1,
-0.2695134, 0.1421198, -1.254166, 0, 0, 0, 1, 1,
-0.2686057, -1.829168, -3.488778, 0, 0, 0, 1, 1,
-0.2655225, -0.1882422, -2.620376, 0, 0, 0, 1, 1,
-0.2626071, 0.323083, -2.824113, 0, 0, 0, 1, 1,
-0.2615636, 0.2849732, -1.66917, 0, 0, 0, 1, 1,
-0.2615203, -0.1249871, -1.556686, 0, 0, 0, 1, 1,
-0.259426, 0.4370021, -0.5730475, 1, 1, 1, 1, 1,
-0.2586748, -0.9637918, -1.642783, 1, 1, 1, 1, 1,
-0.2583338, -0.02065128, -3.3431, 1, 1, 1, 1, 1,
-0.2574507, 1.076762, -2.281091, 1, 1, 1, 1, 1,
-0.256184, -1.307478, -3.610475, 1, 1, 1, 1, 1,
-0.2527052, -0.7706199, -2.929526, 1, 1, 1, 1, 1,
-0.2513705, 0.08293132, -1.929118, 1, 1, 1, 1, 1,
-0.2507289, 0.0168431, -2.565053, 1, 1, 1, 1, 1,
-0.2490331, -0.1018772, -3.455533, 1, 1, 1, 1, 1,
-0.248362, -1.895243, -2.136655, 1, 1, 1, 1, 1,
-0.2472873, 1.673827, -1.528053, 1, 1, 1, 1, 1,
-0.2415211, 2.591105, 0.5290473, 1, 1, 1, 1, 1,
-0.2378791, 1.405453, -2.14429, 1, 1, 1, 1, 1,
-0.2376429, 0.332729, 0.5246388, 1, 1, 1, 1, 1,
-0.237048, 1.490398, -1.276115, 1, 1, 1, 1, 1,
-0.2327444, 0.495017, 0.8233077, 0, 0, 1, 1, 1,
-0.229287, -0.1370408, -1.573252, 1, 0, 0, 1, 1,
-0.2137373, 1.163605, 1.245836, 1, 0, 0, 1, 1,
-0.2135741, 1.042776, 0.4143709, 1, 0, 0, 1, 1,
-0.2129664, -0.0103536, -1.173897, 1, 0, 0, 1, 1,
-0.2124744, -0.6564501, -4.396415, 1, 0, 0, 1, 1,
-0.2105603, 0.878192, -0.4935086, 0, 0, 0, 1, 1,
-0.2078829, -0.03678285, -2.701296, 0, 0, 0, 1, 1,
-0.2077889, -0.1515858, -2.901305, 0, 0, 0, 1, 1,
-0.1983276, -3.171585, -4.058633, 0, 0, 0, 1, 1,
-0.198092, 1.67791, -0.431699, 0, 0, 0, 1, 1,
-0.1899362, 0.06989338, -0.9222904, 0, 0, 0, 1, 1,
-0.1890628, 0.3131211, 0.2148524, 0, 0, 0, 1, 1,
-0.1889815, 1.849462, -0.1961384, 1, 1, 1, 1, 1,
-0.1877725, 0.3205014, 0.2949676, 1, 1, 1, 1, 1,
-0.184934, 0.5682058, -1.252828, 1, 1, 1, 1, 1,
-0.183825, 0.2483188, -0.8872964, 1, 1, 1, 1, 1,
-0.1778289, 0.852417, -1.223727, 1, 1, 1, 1, 1,
-0.1765975, -0.4166871, -2.049433, 1, 1, 1, 1, 1,
-0.1726218, -0.5326452, -3.108841, 1, 1, 1, 1, 1,
-0.172398, 0.8385466, -1.69341, 1, 1, 1, 1, 1,
-0.1691085, 0.628574, 0.6780528, 1, 1, 1, 1, 1,
-0.1690387, 0.5390899, -0.6054822, 1, 1, 1, 1, 1,
-0.1657057, 1.170057, 0.02227891, 1, 1, 1, 1, 1,
-0.1649767, -0.2632834, -3.138485, 1, 1, 1, 1, 1,
-0.1635028, 1.068383, 0.6296346, 1, 1, 1, 1, 1,
-0.1634366, 1.809126, 0.2457921, 1, 1, 1, 1, 1,
-0.162815, 0.2149183, -0.8119373, 1, 1, 1, 1, 1,
-0.1520991, 0.2601041, -0.4123989, 0, 0, 1, 1, 1,
-0.1504318, 1.400225, -1.60916, 1, 0, 0, 1, 1,
-0.1499432, -0.2174657, -3.61278, 1, 0, 0, 1, 1,
-0.1452049, 0.5666806, -1.368056, 1, 0, 0, 1, 1,
-0.1444424, 2.009903, -0.5684105, 1, 0, 0, 1, 1,
-0.1416823, 0.3164107, -0.2523629, 1, 0, 0, 1, 1,
-0.1401247, -0.7974557, -4.313229, 0, 0, 0, 1, 1,
-0.1394428, -0.679071, -2.60486, 0, 0, 0, 1, 1,
-0.1347738, 0.4535242, -0.2792748, 0, 0, 0, 1, 1,
-0.1336621, -0.818653, -3.787832, 0, 0, 0, 1, 1,
-0.1321789, -0.4365466, -4.348964, 0, 0, 0, 1, 1,
-0.1280773, 2.4603, -0.09745092, 0, 0, 0, 1, 1,
-0.1210596, 0.2849808, -0.2772389, 0, 0, 0, 1, 1,
-0.1197265, -0.5390242, -4.576449, 1, 1, 1, 1, 1,
-0.1176881, -0.5536067, -3.206919, 1, 1, 1, 1, 1,
-0.1163478, 0.005390469, -1.521982, 1, 1, 1, 1, 1,
-0.1139821, 0.7053135, -0.9322994, 1, 1, 1, 1, 1,
-0.1131739, 0.3416821, -0.3831921, 1, 1, 1, 1, 1,
-0.1126718, -0.01736606, -3.085038, 1, 1, 1, 1, 1,
-0.1094113, 1.605219, 1.041957, 1, 1, 1, 1, 1,
-0.1091001, -1.16236, -3.186949, 1, 1, 1, 1, 1,
-0.1035178, 1.580116, -0.9840002, 1, 1, 1, 1, 1,
-0.1021313, -0.4051288, -3.02748, 1, 1, 1, 1, 1,
-0.1009375, 0.1403127, -1.261615, 1, 1, 1, 1, 1,
-0.09888805, 0.9739035, -0.3166125, 1, 1, 1, 1, 1,
-0.09826522, -0.5070448, -2.999452, 1, 1, 1, 1, 1,
-0.09267996, 1.16989, 0.9498237, 1, 1, 1, 1, 1,
-0.09238186, 0.5989659, -0.3857488, 1, 1, 1, 1, 1,
-0.08938189, -0.5163683, -2.864589, 0, 0, 1, 1, 1,
-0.08072258, -0.3774368, -2.978877, 1, 0, 0, 1, 1,
-0.08002048, -0.5810879, -2.70474, 1, 0, 0, 1, 1,
-0.07948998, -3.091438, -4.589674, 1, 0, 0, 1, 1,
-0.07925022, -0.693223, -3.390336, 1, 0, 0, 1, 1,
-0.07809362, -0.8588949, -4.227377, 1, 0, 0, 1, 1,
-0.07364494, -0.9072198, -2.754805, 0, 0, 0, 1, 1,
-0.07005219, -0.07605854, -3.917562, 0, 0, 0, 1, 1,
-0.06685515, 0.3359605, -0.7988132, 0, 0, 0, 1, 1,
-0.06484926, 0.6384677, -0.06533038, 0, 0, 0, 1, 1,
-0.06037452, 1.141377, -0.5081463, 0, 0, 0, 1, 1,
-0.05760236, 0.2708282, -0.5577641, 0, 0, 0, 1, 1,
-0.0570996, -0.2259549, -2.43655, 0, 0, 0, 1, 1,
-0.05525387, -1.154702, -2.58267, 1, 1, 1, 1, 1,
-0.05522824, -1.58036, -3.761598, 1, 1, 1, 1, 1,
-0.0535464, 0.5691893, 0.5837935, 1, 1, 1, 1, 1,
-0.05341896, -1.244258, -2.214158, 1, 1, 1, 1, 1,
-0.05283614, 0.4794982, 1.375373, 1, 1, 1, 1, 1,
-0.04285223, 0.3026361, 0.8569779, 1, 1, 1, 1, 1,
-0.04272585, 0.5586845, 0.2168296, 1, 1, 1, 1, 1,
-0.04145221, 0.1801393, -1.778451, 1, 1, 1, 1, 1,
-0.03982842, 0.2387525, -0.5357445, 1, 1, 1, 1, 1,
-0.03274035, -2.188158, -2.565369, 1, 1, 1, 1, 1,
-0.02298324, 0.2731614, 0.9104422, 1, 1, 1, 1, 1,
-0.02219372, -1.201843, -2.466887, 1, 1, 1, 1, 1,
-0.01903932, -0.4431985, -3.393973, 1, 1, 1, 1, 1,
-0.01624964, -0.7668259, -2.35087, 1, 1, 1, 1, 1,
-0.01590077, -1.167095, -3.617967, 1, 1, 1, 1, 1,
-0.01131811, 0.4371782, 0.9618848, 0, 0, 1, 1, 1,
-0.007853043, 0.8192695, 0.0214722, 1, 0, 0, 1, 1,
-0.003794014, -0.1542181, -2.66993, 1, 0, 0, 1, 1,
-0.002761242, -0.3475727, -3.613914, 1, 0, 0, 1, 1,
0.0006696685, 0.3207924, 0.562757, 1, 0, 0, 1, 1,
0.004034212, -0.3310159, 4.470398, 1, 0, 0, 1, 1,
0.006192591, -0.3876363, 2.966613, 0, 0, 0, 1, 1,
0.009473149, -1.065404, 3.955173, 0, 0, 0, 1, 1,
0.01105215, -0.1760294, 4.105194, 0, 0, 0, 1, 1,
0.01401314, -0.303421, 2.493238, 0, 0, 0, 1, 1,
0.01531556, -0.6751804, 3.175831, 0, 0, 0, 1, 1,
0.02021701, -0.1518889, 3.726961, 0, 0, 0, 1, 1,
0.02028432, -0.75827, 1.624726, 0, 0, 0, 1, 1,
0.0264278, 1.699364, 1.830698, 1, 1, 1, 1, 1,
0.02869004, -0.5656453, 2.780137, 1, 1, 1, 1, 1,
0.02934136, 1.085741, -1.342004, 1, 1, 1, 1, 1,
0.03438333, 1.512964, 0.3764967, 1, 1, 1, 1, 1,
0.03730151, 0.6642313, 0.8422934, 1, 1, 1, 1, 1,
0.04748345, -1.17043, 2.995527, 1, 1, 1, 1, 1,
0.04913151, -1.538751, 1.207274, 1, 1, 1, 1, 1,
0.05065939, 1.324277, 0.3951867, 1, 1, 1, 1, 1,
0.05646978, 2.647258, 0.2296028, 1, 1, 1, 1, 1,
0.06171792, 0.6679835, 0.3656099, 1, 1, 1, 1, 1,
0.06512234, -0.5558028, 4.639362, 1, 1, 1, 1, 1,
0.06663509, 0.3447468, 3.475113, 1, 1, 1, 1, 1,
0.06980051, -0.04140779, 1.467929, 1, 1, 1, 1, 1,
0.07569738, -0.5230353, 2.506822, 1, 1, 1, 1, 1,
0.07751618, -0.9140242, 3.186994, 1, 1, 1, 1, 1,
0.08468194, 0.9850324, 0.7921557, 0, 0, 1, 1, 1,
0.08557744, -1.299133, 3.583302, 1, 0, 0, 1, 1,
0.0947511, 0.3435182, -1.28035, 1, 0, 0, 1, 1,
0.09479936, -0.8852971, 4.279048, 1, 0, 0, 1, 1,
0.09622112, 0.5139021, 0.6933132, 1, 0, 0, 1, 1,
0.09795799, 0.05737052, -0.340396, 1, 0, 0, 1, 1,
0.1014811, -0.09500276, 0.1767154, 0, 0, 0, 1, 1,
0.1103292, -0.4538759, 2.273086, 0, 0, 0, 1, 1,
0.1175693, -0.0977565, 2.980501, 0, 0, 0, 1, 1,
0.1205003, -0.3481099, 2.918384, 0, 0, 0, 1, 1,
0.1239104, -1.438984, 1.337665, 0, 0, 0, 1, 1,
0.125711, -0.8152545, 2.425627, 0, 0, 0, 1, 1,
0.1257238, 1.116393, 0.01630653, 0, 0, 0, 1, 1,
0.126311, 1.818165, 0.5342003, 1, 1, 1, 1, 1,
0.1270417, -0.3553857, 1.342709, 1, 1, 1, 1, 1,
0.1301346, 0.3930489, 1.142889, 1, 1, 1, 1, 1,
0.1322195, 0.008367706, 0.8755381, 1, 1, 1, 1, 1,
0.1330813, -1.597271, 3.896241, 1, 1, 1, 1, 1,
0.1338881, 0.04336807, 0.8515192, 1, 1, 1, 1, 1,
0.1346754, 0.08364107, -0.6968679, 1, 1, 1, 1, 1,
0.1355904, -1.419479, 2.990845, 1, 1, 1, 1, 1,
0.1366689, -0.1015889, 2.612639, 1, 1, 1, 1, 1,
0.1372161, 0.7216331, -0.2902417, 1, 1, 1, 1, 1,
0.1378345, -0.1552418, 3.547575, 1, 1, 1, 1, 1,
0.1435746, -0.2837276, 1.186134, 1, 1, 1, 1, 1,
0.1463214, 0.2054421, 2.292554, 1, 1, 1, 1, 1,
0.1474281, -0.1899378, 1.95216, 1, 1, 1, 1, 1,
0.151884, 0.6918454, 0.3041184, 1, 1, 1, 1, 1,
0.157059, -0.1219434, 1.053717, 0, 0, 1, 1, 1,
0.157766, -0.4987491, 1.101656, 1, 0, 0, 1, 1,
0.1584307, -2.828266, 2.150674, 1, 0, 0, 1, 1,
0.1601456, -0.7914897, 3.143369, 1, 0, 0, 1, 1,
0.1625194, -0.3263079, 5.951697, 1, 0, 0, 1, 1,
0.1638991, 0.6470071, -0.3992384, 1, 0, 0, 1, 1,
0.1642825, 0.2862466, 0.95577, 0, 0, 0, 1, 1,
0.1647283, 0.526297, 0.6175466, 0, 0, 0, 1, 1,
0.1647363, 1.436879, 0.4348868, 0, 0, 0, 1, 1,
0.1774671, 0.2322065, 0.6937355, 0, 0, 0, 1, 1,
0.179968, 0.02740178, -0.4529555, 0, 0, 0, 1, 1,
0.1801762, -0.6006507, 2.496597, 0, 0, 0, 1, 1,
0.1841954, -0.5907749, 2.528781, 0, 0, 0, 1, 1,
0.1859217, -0.965133, 0.307745, 1, 1, 1, 1, 1,
0.1881361, 1.845488, -0.5896649, 1, 1, 1, 1, 1,
0.1881911, 0.005944092, 1.170027, 1, 1, 1, 1, 1,
0.191394, 0.4692961, 2.22326, 1, 1, 1, 1, 1,
0.1923266, 0.1792136, 2.037518, 1, 1, 1, 1, 1,
0.1940613, -0.8550828, 3.189921, 1, 1, 1, 1, 1,
0.1948472, -0.4501363, 1.482631, 1, 1, 1, 1, 1,
0.1957554, -1.546163, 3.846788, 1, 1, 1, 1, 1,
0.1967147, -1.48483, 3.93114, 1, 1, 1, 1, 1,
0.2051262, 0.4479418, 0.3691906, 1, 1, 1, 1, 1,
0.2101254, -0.676796, 3.869072, 1, 1, 1, 1, 1,
0.2194429, 1.573406, 0.09861671, 1, 1, 1, 1, 1,
0.2198621, -0.762483, 3.403748, 1, 1, 1, 1, 1,
0.2223176, 0.4046028, -0.3727388, 1, 1, 1, 1, 1,
0.2252154, 0.7319562, -0.9531592, 1, 1, 1, 1, 1,
0.2261148, 2.003869, 1.512018, 0, 0, 1, 1, 1,
0.2289283, 2.420373, 1.475971, 1, 0, 0, 1, 1,
0.2289825, -1.097677, 2.739041, 1, 0, 0, 1, 1,
0.2301561, -0.492934, 1.908341, 1, 0, 0, 1, 1,
0.2302562, 0.5480219, 1.460745, 1, 0, 0, 1, 1,
0.2303096, 0.5565872, -0.09461765, 1, 0, 0, 1, 1,
0.2307094, 1.953675, 0.5739304, 0, 0, 0, 1, 1,
0.2314637, 1.615802, -0.7787959, 0, 0, 0, 1, 1,
0.2332683, -0.2157674, 0.3826789, 0, 0, 0, 1, 1,
0.2369471, 0.1392886, -0.5743679, 0, 0, 0, 1, 1,
0.2401873, -1.030969, 2.366029, 0, 0, 0, 1, 1,
0.242771, 0.9518819, 0.1773359, 0, 0, 0, 1, 1,
0.2428356, 0.552708, 0.1390299, 0, 0, 0, 1, 1,
0.2450533, 1.252403, 0.6701829, 1, 1, 1, 1, 1,
0.2459738, -0.1513958, 1.370691, 1, 1, 1, 1, 1,
0.2483138, 1.218644, 0.4232345, 1, 1, 1, 1, 1,
0.2483394, -0.1155968, 1.085413, 1, 1, 1, 1, 1,
0.2523625, -0.715665, 3.184392, 1, 1, 1, 1, 1,
0.2534116, -1.000004, 3.088252, 1, 1, 1, 1, 1,
0.2543529, -0.7895301, 0.5236419, 1, 1, 1, 1, 1,
0.2573735, -2.202912, 3.964671, 1, 1, 1, 1, 1,
0.2650779, 0.008491935, 2.632573, 1, 1, 1, 1, 1,
0.2655039, -0.2164962, 3.96559, 1, 1, 1, 1, 1,
0.2677239, 0.2969298, 2.682232, 1, 1, 1, 1, 1,
0.2694823, -1.643986, 3.15552, 1, 1, 1, 1, 1,
0.2739696, -0.03820015, -0.002301643, 1, 1, 1, 1, 1,
0.2758971, -0.4128455, 1.900317, 1, 1, 1, 1, 1,
0.2778157, -0.54722, 0.5498433, 1, 1, 1, 1, 1,
0.2787911, 1.123042, -0.4458294, 0, 0, 1, 1, 1,
0.2810949, 2.23667, -0.2753754, 1, 0, 0, 1, 1,
0.2893823, -0.1211218, 2.809267, 1, 0, 0, 1, 1,
0.2902581, -1.033526, 1.382329, 1, 0, 0, 1, 1,
0.2967331, -0.6998639, 2.667048, 1, 0, 0, 1, 1,
0.2968112, 0.5709394, 0.4614761, 1, 0, 0, 1, 1,
0.2984835, -0.4616341, 3.023742, 0, 0, 0, 1, 1,
0.2995311, 0.5662164, 0.755595, 0, 0, 0, 1, 1,
0.3075876, 0.1524941, 2.098849, 0, 0, 0, 1, 1,
0.3107757, -0.8111701, 0.4161412, 0, 0, 0, 1, 1,
0.3127612, -0.08624393, 2.739525, 0, 0, 0, 1, 1,
0.3141026, 1.445007, 0.6095427, 0, 0, 0, 1, 1,
0.3142859, -0.8679523, 2.312304, 0, 0, 0, 1, 1,
0.3193868, 1.766554, 2.18574, 1, 1, 1, 1, 1,
0.3224699, -1.128465, 3.469236, 1, 1, 1, 1, 1,
0.3288088, -1.125842, 2.451857, 1, 1, 1, 1, 1,
0.3292655, 0.4894104, 1.146051, 1, 1, 1, 1, 1,
0.3327181, 0.7654425, 2.29664, 1, 1, 1, 1, 1,
0.3332523, -0.9212638, 1.42776, 1, 1, 1, 1, 1,
0.3338462, -0.4051093, 3.515987, 1, 1, 1, 1, 1,
0.3385242, -0.3236558, 3.927014, 1, 1, 1, 1, 1,
0.3463469, -0.5654822, 1.750887, 1, 1, 1, 1, 1,
0.3470936, -0.7942478, 3.155483, 1, 1, 1, 1, 1,
0.3522142, 0.220531, 1.957771, 1, 1, 1, 1, 1,
0.3530511, -0.02727276, 2.640022, 1, 1, 1, 1, 1,
0.3534934, -1.235951, 4.163408, 1, 1, 1, 1, 1,
0.3565701, -0.7535369, 3.199531, 1, 1, 1, 1, 1,
0.366276, 0.7072507, 0.2912631, 1, 1, 1, 1, 1,
0.3678454, 0.09626972, 1.631486, 0, 0, 1, 1, 1,
0.3678536, 0.567143, 1.570643, 1, 0, 0, 1, 1,
0.3719828, -0.2361194, 3.230609, 1, 0, 0, 1, 1,
0.3756571, 1.442423, 0.7648941, 1, 0, 0, 1, 1,
0.3778782, -1.177507, 2.970331, 1, 0, 0, 1, 1,
0.3785965, -0.2617568, 2.040399, 1, 0, 0, 1, 1,
0.3790062, -0.8255716, 2.693895, 0, 0, 0, 1, 1,
0.38225, -0.0403259, 1.790785, 0, 0, 0, 1, 1,
0.3836491, 1.606868, -0.07339218, 0, 0, 0, 1, 1,
0.3875169, 0.604123, 1.234053, 0, 0, 0, 1, 1,
0.394539, -0.723814, 2.622911, 0, 0, 0, 1, 1,
0.3977104, -0.02123227, 2.623994, 0, 0, 0, 1, 1,
0.4018299, 1.157974, 1.954309, 0, 0, 0, 1, 1,
0.40295, 0.9796929, 3.140004, 1, 1, 1, 1, 1,
0.4033704, -1.104963, 3.735208, 1, 1, 1, 1, 1,
0.4034341, -1.140905, 2.840263, 1, 1, 1, 1, 1,
0.4078833, 0.07993682, 2.269858, 1, 1, 1, 1, 1,
0.4232232, 0.9497396, 0.8723114, 1, 1, 1, 1, 1,
0.4258075, -0.4090806, 3.51669, 1, 1, 1, 1, 1,
0.4300078, -1.114425, 4.013396, 1, 1, 1, 1, 1,
0.4360543, 0.707413, 1.462395, 1, 1, 1, 1, 1,
0.4510764, -0.2868737, 1.762391, 1, 1, 1, 1, 1,
0.4517266, 0.6732011, 0.1489004, 1, 1, 1, 1, 1,
0.4529309, 0.5401356, 1.718792, 1, 1, 1, 1, 1,
0.4536392, 1.635919, 1.954572, 1, 1, 1, 1, 1,
0.4600904, -1.98716, 1.617165, 1, 1, 1, 1, 1,
0.4673073, -0.1332086, 4.112109, 1, 1, 1, 1, 1,
0.4691623, -1.401196, 3.40185, 1, 1, 1, 1, 1,
0.4723167, -1.236767, 3.989038, 0, 0, 1, 1, 1,
0.4852993, -0.2464531, 4.054625, 1, 0, 0, 1, 1,
0.4876746, 0.7938249, -0.1365986, 1, 0, 0, 1, 1,
0.4904846, -0.5650848, 0.7935832, 1, 0, 0, 1, 1,
0.4950359, 0.8670375, 1.514925, 1, 0, 0, 1, 1,
0.4969304, -1.40136, 4.768801, 1, 0, 0, 1, 1,
0.4974619, -0.27449, 1.962036, 0, 0, 0, 1, 1,
0.5026936, 1.103237, 1.475419, 0, 0, 0, 1, 1,
0.5033146, 1.150033, -0.6908599, 0, 0, 0, 1, 1,
0.5071861, -1.434006, 2.260631, 0, 0, 0, 1, 1,
0.5075171, 0.6114675, 2.005375, 0, 0, 0, 1, 1,
0.5109854, 0.006404682, 2.649005, 0, 0, 0, 1, 1,
0.511188, 1.500408, 0.05223035, 0, 0, 0, 1, 1,
0.5133041, 1.161885, -0.03017842, 1, 1, 1, 1, 1,
0.5146309, 0.6729888, 0.1560074, 1, 1, 1, 1, 1,
0.5171422, -0.7005751, 2.290489, 1, 1, 1, 1, 1,
0.5272041, 1.614765, -0.5855359, 1, 1, 1, 1, 1,
0.5285756, -0.3890584, 2.409066, 1, 1, 1, 1, 1,
0.5418668, 0.7102818, 0.2012877, 1, 1, 1, 1, 1,
0.5425521, -0.2206043, 0.3308235, 1, 1, 1, 1, 1,
0.543448, 0.937249, -0.2148173, 1, 1, 1, 1, 1,
0.5462799, 0.4324615, 0.181629, 1, 1, 1, 1, 1,
0.5483069, -1.240711, 2.636485, 1, 1, 1, 1, 1,
0.5486874, 1.083087, -0.3228226, 1, 1, 1, 1, 1,
0.5517791, 1.059953, -0.8520908, 1, 1, 1, 1, 1,
0.5537912, -0.07164112, 2.215809, 1, 1, 1, 1, 1,
0.5597203, 0.52593, 0.4624688, 1, 1, 1, 1, 1,
0.5601738, 0.2676218, 1.587138, 1, 1, 1, 1, 1,
0.5740726, -0.5950273, 2.981741, 0, 0, 1, 1, 1,
0.5785303, 0.6232194, -0.3518833, 1, 0, 0, 1, 1,
0.5802767, 0.7379686, 1.411214, 1, 0, 0, 1, 1,
0.5851814, 0.7328633, 0.2178778, 1, 0, 0, 1, 1,
0.585315, -0.9343646, 2.714527, 1, 0, 0, 1, 1,
0.5869068, 0.03142452, 1.975646, 1, 0, 0, 1, 1,
0.5874615, -0.5821515, 2.390711, 0, 0, 0, 1, 1,
0.5903789, -1.56521, 4.096713, 0, 0, 0, 1, 1,
0.5935455, 0.01068529, 3.339075, 0, 0, 0, 1, 1,
0.5955463, 1.235704, 1.211577, 0, 0, 0, 1, 1,
0.6052127, 0.2934346, 0.6274527, 0, 0, 0, 1, 1,
0.6057442, 0.5103014, 0.6554433, 0, 0, 0, 1, 1,
0.6065409, 0.02312463, 1.071719, 0, 0, 0, 1, 1,
0.6136404, -0.8066023, 2.834286, 1, 1, 1, 1, 1,
0.6173921, -1.187364, 2.53677, 1, 1, 1, 1, 1,
0.6254824, 0.1769016, 1.093053, 1, 1, 1, 1, 1,
0.6290377, 1.262798, 0.8502958, 1, 1, 1, 1, 1,
0.6352355, -0.5653455, 1.630793, 1, 1, 1, 1, 1,
0.6353309, 0.3249672, 1.699525, 1, 1, 1, 1, 1,
0.6357554, -1.033758, 3.108257, 1, 1, 1, 1, 1,
0.6371337, -0.2789978, 1.562197, 1, 1, 1, 1, 1,
0.6378308, 0.1996335, 2.105183, 1, 1, 1, 1, 1,
0.6379661, -0.8081995, 1.261991, 1, 1, 1, 1, 1,
0.6520929, -0.610272, 2.566649, 1, 1, 1, 1, 1,
0.6528084, 0.6856609, 1.775285, 1, 1, 1, 1, 1,
0.669875, -0.07022235, 2.771981, 1, 1, 1, 1, 1,
0.6709564, -1.22168, 2.505665, 1, 1, 1, 1, 1,
0.675462, 1.517905, -0.3350758, 1, 1, 1, 1, 1,
0.6769709, -1.372079, 1.556679, 0, 0, 1, 1, 1,
0.6935698, 2.215173, 0.5553692, 1, 0, 0, 1, 1,
0.696548, -0.04940511, 0.2449052, 1, 0, 0, 1, 1,
0.6982919, -1.715596, 3.291847, 1, 0, 0, 1, 1,
0.7026933, 1.302234, 1.837285, 1, 0, 0, 1, 1,
0.7027254, -0.07853947, 1.434248, 1, 0, 0, 1, 1,
0.7036109, -0.3322194, 2.575127, 0, 0, 0, 1, 1,
0.708452, -0.1859221, 2.734878, 0, 0, 0, 1, 1,
0.70937, 1.510327, 0.5935104, 0, 0, 0, 1, 1,
0.7169577, -0.364485, 3.48497, 0, 0, 0, 1, 1,
0.7221373, -0.08988013, 3.115116, 0, 0, 0, 1, 1,
0.7257572, 0.8992307, -0.1362759, 0, 0, 0, 1, 1,
0.728681, 0.7016417, 0.1372703, 0, 0, 0, 1, 1,
0.7328789, 0.675367, 1.725181, 1, 1, 1, 1, 1,
0.7359188, -1.777911, 2.224922, 1, 1, 1, 1, 1,
0.7372125, 0.6500933, 1.556881, 1, 1, 1, 1, 1,
0.7385873, 0.6697087, 0.9376377, 1, 1, 1, 1, 1,
0.7475091, 0.3686333, 3.437897, 1, 1, 1, 1, 1,
0.7505502, -1.068861, 1.001642, 1, 1, 1, 1, 1,
0.7516649, -0.4767992, 0.7063159, 1, 1, 1, 1, 1,
0.760614, -0.0874287, 1.404959, 1, 1, 1, 1, 1,
0.7637495, -0.7863041, 1.962984, 1, 1, 1, 1, 1,
0.7699053, -0.4518293, 2.104801, 1, 1, 1, 1, 1,
0.7705759, 0.3472226, 2.394104, 1, 1, 1, 1, 1,
0.7732044, 0.5696097, 0.4842, 1, 1, 1, 1, 1,
0.7764066, -0.9193501, 2.287717, 1, 1, 1, 1, 1,
0.7919807, -0.2828124, 5.816557, 1, 1, 1, 1, 1,
0.7922596, 0.3353603, -0.09609147, 1, 1, 1, 1, 1,
0.7929506, 0.4861759, 1.419091, 0, 0, 1, 1, 1,
0.7934438, -0.8488806, 2.935437, 1, 0, 0, 1, 1,
0.8037917, 1.256066, 0.8961056, 1, 0, 0, 1, 1,
0.8067058, -0.9598336, 4.0341, 1, 0, 0, 1, 1,
0.8094448, 0.3493556, 2.150621, 1, 0, 0, 1, 1,
0.8101455, 0.6038753, 1.422079, 1, 0, 0, 1, 1,
0.8108125, 1.349586, -0.06417071, 0, 0, 0, 1, 1,
0.8145248, 0.5039624, 0.7774943, 0, 0, 0, 1, 1,
0.8164026, 1.676291, -1.05503, 0, 0, 0, 1, 1,
0.8232614, -0.8729073, 3.14154, 0, 0, 0, 1, 1,
0.8235469, -0.7824185, 2.537068, 0, 0, 0, 1, 1,
0.8259138, 0.3772407, 0.854082, 0, 0, 0, 1, 1,
0.835086, -0.0401005, 0.8957796, 0, 0, 0, 1, 1,
0.836675, 0.2849674, 1.870595, 1, 1, 1, 1, 1,
0.8431615, -0.119999, 3.510991, 1, 1, 1, 1, 1,
0.8458436, -0.389608, 4.610864, 1, 1, 1, 1, 1,
0.8489043, 0.1394053, 1.164263, 1, 1, 1, 1, 1,
0.850139, -1.025564, 2.198018, 1, 1, 1, 1, 1,
0.8581457, 0.5967333, 1.709669, 1, 1, 1, 1, 1,
0.8621501, -0.3135367, 0.6696913, 1, 1, 1, 1, 1,
0.8644655, -0.8239234, 2.095193, 1, 1, 1, 1, 1,
0.8660946, -2.049974, 4.032147, 1, 1, 1, 1, 1,
0.8954205, 0.4137191, 0.3619862, 1, 1, 1, 1, 1,
0.8969728, 1.546369, -1.949798, 1, 1, 1, 1, 1,
0.899748, -0.2779692, 2.004437, 1, 1, 1, 1, 1,
0.9013298, -0.1090395, -1.568181, 1, 1, 1, 1, 1,
0.9029624, -1.666622, 3.025859, 1, 1, 1, 1, 1,
0.9032063, 0.7060191, 1.031856, 1, 1, 1, 1, 1,
0.9060371, 0.5502334, 0.549422, 0, 0, 1, 1, 1,
0.9068119, 0.3253119, 2.129807, 1, 0, 0, 1, 1,
0.9102873, -0.7538407, 2.57853, 1, 0, 0, 1, 1,
0.9121016, -0.7242655, 1.010065, 1, 0, 0, 1, 1,
0.9300966, 0.2654313, 1.497843, 1, 0, 0, 1, 1,
0.9314211, 1.026896, 1.314221, 1, 0, 0, 1, 1,
0.9318002, -1.859164, 2.617317, 0, 0, 0, 1, 1,
0.9325833, -0.7714974, 2.638606, 0, 0, 0, 1, 1,
0.9331383, -1.872442, 2.773975, 0, 0, 0, 1, 1,
0.9391611, -1.525829, 1.641972, 0, 0, 0, 1, 1,
0.9400465, -0.8541973, 2.808183, 0, 0, 0, 1, 1,
0.9453798, 0.3371955, 1.141986, 0, 0, 0, 1, 1,
0.9455019, -0.289436, 1.805723, 0, 0, 0, 1, 1,
0.9457494, -1.403642, 1.731424, 1, 1, 1, 1, 1,
0.9599776, -0.8665573, 2.67558, 1, 1, 1, 1, 1,
0.972451, -1.383159, 3.693473, 1, 1, 1, 1, 1,
0.977735, -0.4389226, 1.858833, 1, 1, 1, 1, 1,
0.9783829, 1.543078, 2.502073, 1, 1, 1, 1, 1,
0.97883, -1.221097, 4.173856, 1, 1, 1, 1, 1,
0.9793741, -0.4851412, 0.6274155, 1, 1, 1, 1, 1,
0.9810633, -0.06686801, 2.213852, 1, 1, 1, 1, 1,
0.9866093, 0.6090153, 1.852972, 1, 1, 1, 1, 1,
0.9868028, 1.379128, 1.714492, 1, 1, 1, 1, 1,
0.9872766, 1.469178, -0.5228607, 1, 1, 1, 1, 1,
0.9917435, -1.40821, 1.530214, 1, 1, 1, 1, 1,
0.9997076, -1.611636, 4.17345, 1, 1, 1, 1, 1,
0.999857, 0.5986965, 1.618649, 1, 1, 1, 1, 1,
1.007622, -0.6574458, 2.088846, 1, 1, 1, 1, 1,
1.011123, -0.3878352, 2.738974, 0, 0, 1, 1, 1,
1.045445, -1.445071, 1.431471, 1, 0, 0, 1, 1,
1.048058, -1.869745, 0.9547302, 1, 0, 0, 1, 1,
1.060144, -0.8984711, 1.334619, 1, 0, 0, 1, 1,
1.061467, 0.1073963, 1.476311, 1, 0, 0, 1, 1,
1.064375, 0.2501667, -0.7279847, 1, 0, 0, 1, 1,
1.068846, 0.253912, 0.1950369, 0, 0, 0, 1, 1,
1.071715, -1.356514, 4.190823, 0, 0, 0, 1, 1,
1.074102, 0.2772465, -0.1101096, 0, 0, 0, 1, 1,
1.079539, -0.1162788, -0.8026175, 0, 0, 0, 1, 1,
1.092078, 0.7478079, 2.477807, 0, 0, 0, 1, 1,
1.104383, 0.646637, 0.8723924, 0, 0, 0, 1, 1,
1.10913, -0.7382247, 0.2403928, 0, 0, 0, 1, 1,
1.110428, -1.089536, 3.361814, 1, 1, 1, 1, 1,
1.112222, 0.5484543, 0.8189826, 1, 1, 1, 1, 1,
1.115235, 0.09019408, 2.411483, 1, 1, 1, 1, 1,
1.11793, 1.166149, 0.03991058, 1, 1, 1, 1, 1,
1.136508, 0.451787, 1.821392, 1, 1, 1, 1, 1,
1.139893, -0.7102826, 0.9912548, 1, 1, 1, 1, 1,
1.148456, 1.067725, -0.8102415, 1, 1, 1, 1, 1,
1.157199, -0.1615809, 0.3053315, 1, 1, 1, 1, 1,
1.163846, -1.432805, -0.2792699, 1, 1, 1, 1, 1,
1.167433, -1.52377, 4.030213, 1, 1, 1, 1, 1,
1.168015, 1.438103, -1.932119, 1, 1, 1, 1, 1,
1.173124, -0.6724352, 1.992857, 1, 1, 1, 1, 1,
1.182501, 1.132427, -0.5954032, 1, 1, 1, 1, 1,
1.188492, 1.0163, 1.599716, 1, 1, 1, 1, 1,
1.200738, -1.856914, 2.679112, 1, 1, 1, 1, 1,
1.201846, 0.100122, 2.87601, 0, 0, 1, 1, 1,
1.211469, -0.8974983, 2.616912, 1, 0, 0, 1, 1,
1.221135, -0.3577539, 2.327411, 1, 0, 0, 1, 1,
1.232275, 0.7091621, 1.994532, 1, 0, 0, 1, 1,
1.235237, 1.178491, 1.124745, 1, 0, 0, 1, 1,
1.24853, -0.3025651, 2.938364, 1, 0, 0, 1, 1,
1.254409, -1.057587, 1.337402, 0, 0, 0, 1, 1,
1.25561, 0.3505227, 3.344826, 0, 0, 0, 1, 1,
1.255957, 1.103184, 1.993572, 0, 0, 0, 1, 1,
1.259608, 1.116218, 0.5696164, 0, 0, 0, 1, 1,
1.261995, 0.5117038, 2.131798, 0, 0, 0, 1, 1,
1.272485, 1.077411, 1.021797, 0, 0, 0, 1, 1,
1.281, 0.1310336, 1.867004, 0, 0, 0, 1, 1,
1.284985, -1.150456, 1.741601, 1, 1, 1, 1, 1,
1.289838, 1.012146, 1.269158, 1, 1, 1, 1, 1,
1.316771, -0.08337536, 0.4872211, 1, 1, 1, 1, 1,
1.323002, -0.03543632, 1.749188, 1, 1, 1, 1, 1,
1.325091, 1.215387, -0.8414231, 1, 1, 1, 1, 1,
1.328248, 0.1215977, 3.294654, 1, 1, 1, 1, 1,
1.343803, -0.4005458, 1.423406, 1, 1, 1, 1, 1,
1.346619, -0.08277177, 1.530394, 1, 1, 1, 1, 1,
1.355196, 0.4007778, 0.6666074, 1, 1, 1, 1, 1,
1.362847, -0.2629127, 1.515392, 1, 1, 1, 1, 1,
1.367833, -0.7421891, 2.611575, 1, 1, 1, 1, 1,
1.371082, 0.3257231, 2.862181, 1, 1, 1, 1, 1,
1.376546, -1.183292, 2.055467, 1, 1, 1, 1, 1,
1.379776, -0.1167485, 1.069971, 1, 1, 1, 1, 1,
1.380518, -1.023951, -0.8048807, 1, 1, 1, 1, 1,
1.384529, 0.4070798, 0.05272519, 0, 0, 1, 1, 1,
1.388173, -1.154363, 3.53403, 1, 0, 0, 1, 1,
1.392481, -0.526065, 1.466979, 1, 0, 0, 1, 1,
1.395758, -1.220164, 2.362585, 1, 0, 0, 1, 1,
1.402462, 0.216681, 1.131095, 1, 0, 0, 1, 1,
1.40595, 1.275824, -0.4321888, 1, 0, 0, 1, 1,
1.407021, 1.538345, 0.5035332, 0, 0, 0, 1, 1,
1.409941, -0.7814195, 1.800251, 0, 0, 0, 1, 1,
1.410107, -0.1290073, 1.706256, 0, 0, 0, 1, 1,
1.411792, 0.08197572, 1.257027, 0, 0, 0, 1, 1,
1.418453, 0.2624243, 2.785196, 0, 0, 0, 1, 1,
1.425374, -1.158453, 4.115276, 0, 0, 0, 1, 1,
1.427585, -0.2357651, 2.188512, 0, 0, 0, 1, 1,
1.429594, -0.2877997, 0.9930478, 1, 1, 1, 1, 1,
1.430552, 0.4379741, 1.966952, 1, 1, 1, 1, 1,
1.437819, 2.672213, 0.9929475, 1, 1, 1, 1, 1,
1.439739, -1.786413, 2.356496, 1, 1, 1, 1, 1,
1.443152, -1.088599, 2.533901, 1, 1, 1, 1, 1,
1.449124, -0.4601725, 2.447241, 1, 1, 1, 1, 1,
1.453334, -0.1899622, 2.943847, 1, 1, 1, 1, 1,
1.453927, -1.268935, 3.391133, 1, 1, 1, 1, 1,
1.457554, 0.5816836, 0.785549, 1, 1, 1, 1, 1,
1.459015, -1.075824, 2.157349, 1, 1, 1, 1, 1,
1.473273, 0.4856015, 1.609452, 1, 1, 1, 1, 1,
1.480471, -0.120734, 0.8285159, 1, 1, 1, 1, 1,
1.482697, 0.5822634, 1.224126, 1, 1, 1, 1, 1,
1.484491, -1.417099, 0.903258, 1, 1, 1, 1, 1,
1.487438, -1.088238, 1.947334, 1, 1, 1, 1, 1,
1.493026, -0.6527369, 2.132932, 0, 0, 1, 1, 1,
1.494173, -0.6183887, 3.08168, 1, 0, 0, 1, 1,
1.501395, 2.483488, 0.550698, 1, 0, 0, 1, 1,
1.50501, -1.18154, 2.821798, 1, 0, 0, 1, 1,
1.513074, -0.6029423, 2.652996, 1, 0, 0, 1, 1,
1.514164, 0.5418726, 1.644655, 1, 0, 0, 1, 1,
1.5234, -1.254964, 1.023187, 0, 0, 0, 1, 1,
1.528033, 0.1530547, 0.0412665, 0, 0, 0, 1, 1,
1.53061, 3.684456, -0.3990228, 0, 0, 0, 1, 1,
1.530844, -0.05678217, 2.284711, 0, 0, 0, 1, 1,
1.537149, -1.958547, 2.359528, 0, 0, 0, 1, 1,
1.542603, -1.7298, 0.02389519, 0, 0, 0, 1, 1,
1.553288, 0.01228698, 1.326277, 0, 0, 0, 1, 1,
1.578141, 2.067559, 2.587249, 1, 1, 1, 1, 1,
1.581929, -1.457665, 2.232883, 1, 1, 1, 1, 1,
1.589867, -0.9607634, 1.359637, 1, 1, 1, 1, 1,
1.59541, -1.68769, 2.904223, 1, 1, 1, 1, 1,
1.599878, 1.280167, 1.559371, 1, 1, 1, 1, 1,
1.600984, -0.5765846, 3.986965, 1, 1, 1, 1, 1,
1.621194, -0.463223, 2.98551, 1, 1, 1, 1, 1,
1.627443, 1.236882, 1.335303, 1, 1, 1, 1, 1,
1.635117, -3.072472, 2.695336, 1, 1, 1, 1, 1,
1.637324, -1.047175, 2.887878, 1, 1, 1, 1, 1,
1.638785, -1.276959, 1.932683, 1, 1, 1, 1, 1,
1.660974, 0.9002572, 2.52594, 1, 1, 1, 1, 1,
1.666852, -0.4183347, 4.002628, 1, 1, 1, 1, 1,
1.670182, -0.4499758, 1.142791, 1, 1, 1, 1, 1,
1.682773, 0.7187191, 2.513753, 1, 1, 1, 1, 1,
1.686636, -1.378029, 2.816483, 0, 0, 1, 1, 1,
1.706476, -0.07223686, 2.100823, 1, 0, 0, 1, 1,
1.710916, 1.461272, 0.1652028, 1, 0, 0, 1, 1,
1.713045, 0.4206278, 2.25736, 1, 0, 0, 1, 1,
1.737903, -0.170972, 0.7932514, 1, 0, 0, 1, 1,
1.742268, 1.456511, 0.2378629, 1, 0, 0, 1, 1,
1.751694, -1.16813, 2.145011, 0, 0, 0, 1, 1,
1.776122, 0.01072538, 0.9517133, 0, 0, 0, 1, 1,
1.80739, -0.2356094, 1.004156, 0, 0, 0, 1, 1,
1.80912, 0.386329, 0.370943, 0, 0, 0, 1, 1,
1.816485, -1.012818, 2.511499, 0, 0, 0, 1, 1,
1.826105, 0.6365105, 1.891399, 0, 0, 0, 1, 1,
1.827942, 1.033323, 1.598364, 0, 0, 0, 1, 1,
1.831002, 0.383846, 2.343932, 1, 1, 1, 1, 1,
1.840926, -0.8363202, 2.275834, 1, 1, 1, 1, 1,
1.861141, -1.434991, 2.698128, 1, 1, 1, 1, 1,
1.879865, 0.5757667, -0.7024029, 1, 1, 1, 1, 1,
1.891975, -0.3075487, 1.509754, 1, 1, 1, 1, 1,
1.901227, -0.533376, 3.125227, 1, 1, 1, 1, 1,
1.939579, -0.1302011, 2.262505, 1, 1, 1, 1, 1,
1.958378, 3.17707, 0.03793872, 1, 1, 1, 1, 1,
1.979988, -0.7817141, 1.344374, 1, 1, 1, 1, 1,
1.984758, -0.9882022, 1.94295, 1, 1, 1, 1, 1,
2.027679, -0.6941912, 1.945823, 1, 1, 1, 1, 1,
2.039184, 0.2211035, 2.723163, 1, 1, 1, 1, 1,
2.052007, -0.6516065, 2.883094, 1, 1, 1, 1, 1,
2.059643, -0.08609819, 0.8837011, 1, 1, 1, 1, 1,
2.069787, -1.621639, 2.029207, 1, 1, 1, 1, 1,
2.187184, -0.4029856, 2.226915, 0, 0, 1, 1, 1,
2.195714, 0.7370691, 0.8409268, 1, 0, 0, 1, 1,
2.212386, 0.2751997, 0.9330245, 1, 0, 0, 1, 1,
2.225414, 0.4872674, 1.976828, 1, 0, 0, 1, 1,
2.237728, 0.4793748, 0.9962541, 1, 0, 0, 1, 1,
2.330039, -0.8638615, 4.061081, 1, 0, 0, 1, 1,
2.371173, 0.5819337, 0.3043846, 0, 0, 0, 1, 1,
2.385667, -0.538234, 1.995989, 0, 0, 0, 1, 1,
2.412553, -0.9862548, 0.5691306, 0, 0, 0, 1, 1,
2.46327, 0.5472875, 3.41652, 0, 0, 0, 1, 1,
2.520936, -0.7484644, 1.111427, 0, 0, 0, 1, 1,
2.583049, 0.8873773, 2.98517, 0, 0, 0, 1, 1,
2.622739, 0.007923419, 1.692903, 0, 0, 0, 1, 1,
2.68416, 0.08537501, 2.153832, 1, 1, 1, 1, 1,
2.761466, -0.8437685, 2.509805, 1, 1, 1, 1, 1,
2.770981, 0.3310934, 1.352852, 1, 1, 1, 1, 1,
2.78709, 0.65122, 1.143686, 1, 1, 1, 1, 1,
3.085825, 0.09258489, 0.6253679, 1, 1, 1, 1, 1,
3.405406, -0.4736987, 1.03441, 1, 1, 1, 1, 1,
3.773073, -1.240911, 1.694792, 1, 1, 1, 1, 1
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
var radius = 10.19384;
var distance = 35.80542;
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
mvMatrix.translate( -0.2856843, -0.2564356, -0.1593797 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.80542);
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
