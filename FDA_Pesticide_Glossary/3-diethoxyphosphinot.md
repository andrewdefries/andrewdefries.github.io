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
-3.327755, 0.7673454, -1.433661, 1, 0, 0, 1,
-3.060103, 0.9461895, -3.158453, 1, 0.007843138, 0, 1,
-3.002011, 0.8839028, -0.8446785, 1, 0.01176471, 0, 1,
-2.710026, 1.035255, -2.385333, 1, 0.01960784, 0, 1,
-2.662611, -1.419026, -0.7401069, 1, 0.02352941, 0, 1,
-2.654397, -0.1131822, 0.253961, 1, 0.03137255, 0, 1,
-2.64935, -1.286287, -2.455331, 1, 0.03529412, 0, 1,
-2.549943, -0.4048392, -0.4614222, 1, 0.04313726, 0, 1,
-2.468107, -0.138011, -1.191511, 1, 0.04705882, 0, 1,
-2.348, 0.4733772, -1.428156, 1, 0.05490196, 0, 1,
-2.337962, -1.007017, -1.891987, 1, 0.05882353, 0, 1,
-2.297007, -1.69572, -0.757775, 1, 0.06666667, 0, 1,
-2.223968, -0.8401428, -0.3637684, 1, 0.07058824, 0, 1,
-2.22241, 0.7118406, -0.7264779, 1, 0.07843138, 0, 1,
-2.222335, 0.6900001, -1.558769, 1, 0.08235294, 0, 1,
-2.135147, 2.289756, -1.177144, 1, 0.09019608, 0, 1,
-2.095834, -0.8463131, -1.652918, 1, 0.09411765, 0, 1,
-2.092567, 0.788438, -2.051511, 1, 0.1019608, 0, 1,
-2.089577, 1.283561, -0.9390525, 1, 0.1098039, 0, 1,
-2.083619, 0.3896625, -0.7023736, 1, 0.1137255, 0, 1,
-2.083364, -0.5162102, -2.617746, 1, 0.1215686, 0, 1,
-2.082864, 1.967993, -1.359517, 1, 0.1254902, 0, 1,
-2.067469, 0.493663, -1.734147, 1, 0.1333333, 0, 1,
-2.04022, 2.351634, -0.7163053, 1, 0.1372549, 0, 1,
-2.023088, 0.1206687, -0.9099979, 1, 0.145098, 0, 1,
-2.020964, -0.4090073, 1.106297, 1, 0.1490196, 0, 1,
-2.010998, 0.4665466, 0.3041803, 1, 0.1568628, 0, 1,
-1.987392, -1.667843, -3.071907, 1, 0.1607843, 0, 1,
-1.933827, 1.19924, -1.074407, 1, 0.1686275, 0, 1,
-1.912067, -0.9669176, -2.079327, 1, 0.172549, 0, 1,
-1.890441, 0.05098593, -1.687695, 1, 0.1803922, 0, 1,
-1.884197, -0.7614665, -1.514972, 1, 0.1843137, 0, 1,
-1.866211, -1.076612, -2.562203, 1, 0.1921569, 0, 1,
-1.842708, -1.345046, -2.660074, 1, 0.1960784, 0, 1,
-1.836671, 0.1858088, -0.6940309, 1, 0.2039216, 0, 1,
-1.826756, -2.72927, -0.6328274, 1, 0.2117647, 0, 1,
-1.814232, 1.361742, -0.3627532, 1, 0.2156863, 0, 1,
-1.80411, 0.2139992, -0.1723199, 1, 0.2235294, 0, 1,
-1.79214, 1.83278, -3.189977, 1, 0.227451, 0, 1,
-1.707445, -0.6397687, -2.587547, 1, 0.2352941, 0, 1,
-1.688552, 1.16903, -0.2722391, 1, 0.2392157, 0, 1,
-1.683174, 1.464381, 0.8863444, 1, 0.2470588, 0, 1,
-1.671822, 0.8356195, -1.073208, 1, 0.2509804, 0, 1,
-1.662913, 0.5344272, -0.3811669, 1, 0.2588235, 0, 1,
-1.661297, 0.01096003, -0.8145108, 1, 0.2627451, 0, 1,
-1.656256, -1.452299, -2.585383, 1, 0.2705882, 0, 1,
-1.656221, -1.623948, -1.434838, 1, 0.2745098, 0, 1,
-1.653394, -0.2528539, -2.608069, 1, 0.282353, 0, 1,
-1.635219, -0.274835, -0.3639435, 1, 0.2862745, 0, 1,
-1.626567, -2.241992, -1.154969, 1, 0.2941177, 0, 1,
-1.62186, -1.438809, -2.580894, 1, 0.3019608, 0, 1,
-1.607381, -0.6656811, -1.159011, 1, 0.3058824, 0, 1,
-1.601158, -0.2960289, -2.75706, 1, 0.3137255, 0, 1,
-1.599217, 0.07341254, -1.102914, 1, 0.3176471, 0, 1,
-1.567438, -1.323918, -3.278481, 1, 0.3254902, 0, 1,
-1.555165, 1.325202, -1.785825, 1, 0.3294118, 0, 1,
-1.549134, 0.3364531, 0.08777778, 1, 0.3372549, 0, 1,
-1.548162, -0.7578166, -1.598696, 1, 0.3411765, 0, 1,
-1.543287, -0.1789984, -2.12775, 1, 0.3490196, 0, 1,
-1.540323, -0.653374, -0.4423032, 1, 0.3529412, 0, 1,
-1.526351, 0.2367747, -1.462253, 1, 0.3607843, 0, 1,
-1.521102, 0.592333, -0.3950142, 1, 0.3647059, 0, 1,
-1.510866, -1.785595, -0.9776323, 1, 0.372549, 0, 1,
-1.51086, 1.738164, -0.2636778, 1, 0.3764706, 0, 1,
-1.500125, -0.6488961, -1.150365, 1, 0.3843137, 0, 1,
-1.495529, 0.2193252, -0.3436176, 1, 0.3882353, 0, 1,
-1.489713, -0.6034383, -1.021852, 1, 0.3960784, 0, 1,
-1.480379, 0.02488997, -1.755639, 1, 0.4039216, 0, 1,
-1.478371, 0.8967623, -0.5170705, 1, 0.4078431, 0, 1,
-1.468688, -0.03432065, -0.3141328, 1, 0.4156863, 0, 1,
-1.448408, 2.428018, 0.614228, 1, 0.4196078, 0, 1,
-1.447877, -0.3425027, -0.8466584, 1, 0.427451, 0, 1,
-1.417637, 0.9282413, 0.2783939, 1, 0.4313726, 0, 1,
-1.397837, 1.237459, -0.369885, 1, 0.4392157, 0, 1,
-1.389681, 0.3423085, -0.7663493, 1, 0.4431373, 0, 1,
-1.384543, -1.266685, -2.487905, 1, 0.4509804, 0, 1,
-1.381629, 2.237283, -2.269625, 1, 0.454902, 0, 1,
-1.374151, 1.045482, -0.7535017, 1, 0.4627451, 0, 1,
-1.368066, -0.4043522, -2.754146, 1, 0.4666667, 0, 1,
-1.36768, 1.519703, -1.932798, 1, 0.4745098, 0, 1,
-1.357955, -1.455086, -2.58289, 1, 0.4784314, 0, 1,
-1.351861, -1.030761, -2.919162, 1, 0.4862745, 0, 1,
-1.348326, 0.5905091, -0.168662, 1, 0.4901961, 0, 1,
-1.335748, 0.9428298, -1.262913, 1, 0.4980392, 0, 1,
-1.334197, 0.4503687, -0.8974504, 1, 0.5058824, 0, 1,
-1.332397, -1.267029, -3.865301, 1, 0.509804, 0, 1,
-1.332173, 0.13509, -1.52787, 1, 0.5176471, 0, 1,
-1.325238, -1.918978, -2.339234, 1, 0.5215687, 0, 1,
-1.320302, 0.301441, 0.7500806, 1, 0.5294118, 0, 1,
-1.312392, -0.7952713, -1.521648, 1, 0.5333334, 0, 1,
-1.30773, 1.47377, 0.05544027, 1, 0.5411765, 0, 1,
-1.306657, -1.652583, -2.914135, 1, 0.5450981, 0, 1,
-1.294343, 0.1683558, -0.3030505, 1, 0.5529412, 0, 1,
-1.290794, 0.410708, -1.531206, 1, 0.5568628, 0, 1,
-1.286992, -2.038182, -3.107125, 1, 0.5647059, 0, 1,
-1.28051, 1.181749, 0.2868076, 1, 0.5686275, 0, 1,
-1.274656, -0.1890329, -1.184726, 1, 0.5764706, 0, 1,
-1.259308, 0.9227551, -0.5803794, 1, 0.5803922, 0, 1,
-1.259028, 0.9476889, -0.4938087, 1, 0.5882353, 0, 1,
-1.255433, 1.139346, -3.164363, 1, 0.5921569, 0, 1,
-1.251996, 1.832652, 0.2482111, 1, 0.6, 0, 1,
-1.251338, -0.4047555, -2.442064, 1, 0.6078432, 0, 1,
-1.247365, -0.7629101, -1.828471, 1, 0.6117647, 0, 1,
-1.242802, 1.079002, 0.3623495, 1, 0.6196079, 0, 1,
-1.241139, 0.3236306, -0.9502845, 1, 0.6235294, 0, 1,
-1.233059, -0.8874892, -2.52754, 1, 0.6313726, 0, 1,
-1.229768, -0.1248798, -0.5494444, 1, 0.6352941, 0, 1,
-1.228536, -1.65094, -1.52973, 1, 0.6431373, 0, 1,
-1.223409, 2.963636, -0.81525, 1, 0.6470588, 0, 1,
-1.219709, 0.02802694, -2.316961, 1, 0.654902, 0, 1,
-1.213539, 0.4536307, -1.526572, 1, 0.6588235, 0, 1,
-1.207366, 0.9061003, -0.2885623, 1, 0.6666667, 0, 1,
-1.206208, 0.03150055, -1.313231, 1, 0.6705883, 0, 1,
-1.205181, -0.3633348, -1.303556, 1, 0.6784314, 0, 1,
-1.203487, -0.9130621, -3.042467, 1, 0.682353, 0, 1,
-1.200252, -0.1685418, -3.055747, 1, 0.6901961, 0, 1,
-1.197817, 2.527328, -2.747634, 1, 0.6941177, 0, 1,
-1.196797, -1.446733, -2.409895, 1, 0.7019608, 0, 1,
-1.191303, 1.073456, -0.3256307, 1, 0.7098039, 0, 1,
-1.177457, 0.1262067, 0.5544543, 1, 0.7137255, 0, 1,
-1.169576, -1.817432, -2.146283, 1, 0.7215686, 0, 1,
-1.156619, -1.8337, -4.939197, 1, 0.7254902, 0, 1,
-1.141365, -0.2855872, -1.564644, 1, 0.7333333, 0, 1,
-1.138575, 1.246322, -1.056552, 1, 0.7372549, 0, 1,
-1.138561, 1.307679, 0.1652916, 1, 0.7450981, 0, 1,
-1.137906, -0.315548, -3.509778, 1, 0.7490196, 0, 1,
-1.124695, 1.111848, 0.507382, 1, 0.7568628, 0, 1,
-1.123968, 0.2141883, -1.871911, 1, 0.7607843, 0, 1,
-1.122389, -1.699365, -3.11208, 1, 0.7686275, 0, 1,
-1.107377, -0.5732818, -2.646079, 1, 0.772549, 0, 1,
-1.085103, -0.3752188, -1.874626, 1, 0.7803922, 0, 1,
-1.085054, -0.5672663, -2.590712, 1, 0.7843137, 0, 1,
-1.072239, 0.5986765, -1.757779, 1, 0.7921569, 0, 1,
-1.071575, -1.274711, -1.382127, 1, 0.7960784, 0, 1,
-1.060211, -0.5381129, -0.6338452, 1, 0.8039216, 0, 1,
-1.054665, -0.6943549, -1.743638, 1, 0.8117647, 0, 1,
-1.043024, -0.3268945, -2.736863, 1, 0.8156863, 0, 1,
-1.042008, -0.02645801, -2.680844, 1, 0.8235294, 0, 1,
-1.038399, -0.6439033, -3.343712, 1, 0.827451, 0, 1,
-1.033662, 1.48456, 0.2892208, 1, 0.8352941, 0, 1,
-1.027697, -1.563434, -3.341482, 1, 0.8392157, 0, 1,
-1.021573, -1.283454, -2.666955, 1, 0.8470588, 0, 1,
-1.021267, 0.9819856, -0.4246211, 1, 0.8509804, 0, 1,
-1.018859, 0.6345078, -1.453473, 1, 0.8588235, 0, 1,
-1.009389, -0.7135609, -1.893192, 1, 0.8627451, 0, 1,
-1.008795, -0.01670305, -1.102816, 1, 0.8705882, 0, 1,
-1.007961, 1.019887, -0.116648, 1, 0.8745098, 0, 1,
-0.9987548, 0.6538025, -1.71627, 1, 0.8823529, 0, 1,
-0.9949707, 0.7735826, 0.3284087, 1, 0.8862745, 0, 1,
-0.9918413, -0.5155621, -2.707726, 1, 0.8941177, 0, 1,
-0.9727582, -1.298007, -3.140397, 1, 0.8980392, 0, 1,
-0.9718135, -0.4888565, -2.39323, 1, 0.9058824, 0, 1,
-0.9663935, -0.2276157, -0.9101006, 1, 0.9137255, 0, 1,
-0.9625416, 0.1059734, -3.109818, 1, 0.9176471, 0, 1,
-0.9571602, 1.560729, 0.2602276, 1, 0.9254902, 0, 1,
-0.9554508, 1.271674, -0.6477571, 1, 0.9294118, 0, 1,
-0.954799, 0.3693751, -0.6613634, 1, 0.9372549, 0, 1,
-0.9544353, -0.09604903, -2.839051, 1, 0.9411765, 0, 1,
-0.9532687, 1.282831, 0.6859428, 1, 0.9490196, 0, 1,
-0.9510201, -1.235022, -1.676666, 1, 0.9529412, 0, 1,
-0.9477953, 0.3782966, -0.2676619, 1, 0.9607843, 0, 1,
-0.9465584, 1.550163, -0.9801314, 1, 0.9647059, 0, 1,
-0.9437822, 0.4609195, -2.139429, 1, 0.972549, 0, 1,
-0.9303606, 0.845454, -0.248051, 1, 0.9764706, 0, 1,
-0.9253753, -0.2827556, -1.144637, 1, 0.9843137, 0, 1,
-0.9215145, 0.811348, 0.3086019, 1, 0.9882353, 0, 1,
-0.9208912, 0.2638739, -4.539387, 1, 0.9960784, 0, 1,
-0.9198127, -1.315247, -0.8822903, 0.9960784, 1, 0, 1,
-0.916199, 1.610164, -1.1236, 0.9921569, 1, 0, 1,
-0.9084701, 0.7463601, 0.1039796, 0.9843137, 1, 0, 1,
-0.9055439, -0.6353105, -3.209874, 0.9803922, 1, 0, 1,
-0.9020287, 0.6418083, -0.3924915, 0.972549, 1, 0, 1,
-0.9016484, 2.102986, -2.222162, 0.9686275, 1, 0, 1,
-0.8938798, -0.1874357, -1.154833, 0.9607843, 1, 0, 1,
-0.8921171, -0.545554, -3.906563, 0.9568627, 1, 0, 1,
-0.8912604, 0.4773368, 0.04800078, 0.9490196, 1, 0, 1,
-0.886053, 0.842306, -0.6066206, 0.945098, 1, 0, 1,
-0.8836777, 0.09247128, -0.6716204, 0.9372549, 1, 0, 1,
-0.8830914, -1.472274, -2.28479, 0.9333333, 1, 0, 1,
-0.8820356, 0.5367339, -1.295734, 0.9254902, 1, 0, 1,
-0.8818918, -0.2732506, -0.6764463, 0.9215686, 1, 0, 1,
-0.8797212, -0.4577212, 0.2254193, 0.9137255, 1, 0, 1,
-0.8765612, -0.05955689, -2.251503, 0.9098039, 1, 0, 1,
-0.8721246, -1.287508, -3.191877, 0.9019608, 1, 0, 1,
-0.8594634, -1.225261, -1.213066, 0.8941177, 1, 0, 1,
-0.8576099, 0.6846859, -1.917495, 0.8901961, 1, 0, 1,
-0.8542677, -0.1190657, -3.337182, 0.8823529, 1, 0, 1,
-0.8504414, 2.366334, -0.1464715, 0.8784314, 1, 0, 1,
-0.8449383, 0.5861784, -1.743443, 0.8705882, 1, 0, 1,
-0.8385643, -1.15047, -3.46861, 0.8666667, 1, 0, 1,
-0.8267336, -0.476869, -1.223828, 0.8588235, 1, 0, 1,
-0.8264651, 0.4540012, -1.740588, 0.854902, 1, 0, 1,
-0.8242242, 1.650473, -0.4657829, 0.8470588, 1, 0, 1,
-0.8158429, -1.818052, -0.7308865, 0.8431373, 1, 0, 1,
-0.8135396, 0.4497535, -1.790421, 0.8352941, 1, 0, 1,
-0.8127899, -1.562652, -2.969397, 0.8313726, 1, 0, 1,
-0.8088469, -0.7513549, -1.054731, 0.8235294, 1, 0, 1,
-0.8054127, 2.044506, -0.8889318, 0.8196079, 1, 0, 1,
-0.8024536, 1.127143, -0.9412746, 0.8117647, 1, 0, 1,
-0.7995821, 1.21154, 1.018348, 0.8078431, 1, 0, 1,
-0.7964864, 0.9856331, -0.5630885, 0.8, 1, 0, 1,
-0.7887503, -0.195986, -0.7162565, 0.7921569, 1, 0, 1,
-0.7827777, 0.2723327, -2.338833, 0.7882353, 1, 0, 1,
-0.7787046, -0.715395, -1.072518, 0.7803922, 1, 0, 1,
-0.7749772, -1.128482, -3.856047, 0.7764706, 1, 0, 1,
-0.7737135, -0.6219596, -2.43294, 0.7686275, 1, 0, 1,
-0.770143, 0.01528386, -1.941782, 0.7647059, 1, 0, 1,
-0.7622692, 0.04341291, -3.097518, 0.7568628, 1, 0, 1,
-0.7600455, 1.771504, -0.8243114, 0.7529412, 1, 0, 1,
-0.7599972, -0.2826738, -2.123932, 0.7450981, 1, 0, 1,
-0.7576621, -1.675055, -1.583555, 0.7411765, 1, 0, 1,
-0.755599, 0.8197746, -0.4499817, 0.7333333, 1, 0, 1,
-0.752206, 0.06545589, -3.151014, 0.7294118, 1, 0, 1,
-0.7431628, -0.4494577, -3.140707, 0.7215686, 1, 0, 1,
-0.7403995, 0.7209787, -2.335675, 0.7176471, 1, 0, 1,
-0.7383552, 0.6905848, -2.495007, 0.7098039, 1, 0, 1,
-0.7379695, 0.2668839, -1.277116, 0.7058824, 1, 0, 1,
-0.7297884, -0.6822525, -3.041354, 0.6980392, 1, 0, 1,
-0.7294844, -0.8046709, -4.645023, 0.6901961, 1, 0, 1,
-0.7274852, -0.0377963, -2.942342, 0.6862745, 1, 0, 1,
-0.7215329, 1.05102, 0.6226778, 0.6784314, 1, 0, 1,
-0.7194917, -0.362127, -3.1944, 0.6745098, 1, 0, 1,
-0.7183914, -0.895101, -2.500159, 0.6666667, 1, 0, 1,
-0.7102031, 0.261021, -2.228, 0.6627451, 1, 0, 1,
-0.7076893, 1.071126, 0.1838509, 0.654902, 1, 0, 1,
-0.7068757, 0.4916545, -0.7525097, 0.6509804, 1, 0, 1,
-0.7048017, 0.4024269, -0.06594995, 0.6431373, 1, 0, 1,
-0.7042248, -1.483119, -3.263438, 0.6392157, 1, 0, 1,
-0.7013425, -0.2802612, -3.418535, 0.6313726, 1, 0, 1,
-0.6995513, -0.8397974, -3.238835, 0.627451, 1, 0, 1,
-0.6953727, -0.9104031, -2.293902, 0.6196079, 1, 0, 1,
-0.6946627, -0.554478, -4.589411, 0.6156863, 1, 0, 1,
-0.6892412, -0.7785935, -2.671423, 0.6078432, 1, 0, 1,
-0.6884919, 1.197719, -0.5787399, 0.6039216, 1, 0, 1,
-0.6883278, 0.2777546, -0.996032, 0.5960785, 1, 0, 1,
-0.684829, -0.7564986, -3.325312, 0.5882353, 1, 0, 1,
-0.6836197, 2.223351, 0.5846424, 0.5843138, 1, 0, 1,
-0.6824206, -1.341999, -3.223161, 0.5764706, 1, 0, 1,
-0.6809878, 2.228905, -1.228135, 0.572549, 1, 0, 1,
-0.6798483, -0.6835409, -2.395701, 0.5647059, 1, 0, 1,
-0.6794032, 1.998129, 0.6473901, 0.5607843, 1, 0, 1,
-0.6779552, -1.390981, -4.028305, 0.5529412, 1, 0, 1,
-0.6756557, -1.316904, -4.253048, 0.5490196, 1, 0, 1,
-0.6749014, -0.2256946, -1.396161, 0.5411765, 1, 0, 1,
-0.6741015, -0.5703574, -3.222715, 0.5372549, 1, 0, 1,
-0.6678387, 1.658127, -0.7459761, 0.5294118, 1, 0, 1,
-0.6653121, -0.1938165, -0.5736092, 0.5254902, 1, 0, 1,
-0.6643769, -1.974119, -3.328258, 0.5176471, 1, 0, 1,
-0.6527081, -0.07722831, -2.541121, 0.5137255, 1, 0, 1,
-0.6521508, 1.714344, -0.2529404, 0.5058824, 1, 0, 1,
-0.6491889, -0.8175519, -3.963804, 0.5019608, 1, 0, 1,
-0.6441602, 0.456858, -0.4778006, 0.4941176, 1, 0, 1,
-0.6405616, 0.3417685, -1.286748, 0.4862745, 1, 0, 1,
-0.6403208, 1.482727, -2.397684, 0.4823529, 1, 0, 1,
-0.6354504, 0.8170106, -0.9120754, 0.4745098, 1, 0, 1,
-0.6297019, -2.032102, -3.480383, 0.4705882, 1, 0, 1,
-0.6285298, -0.7865208, -0.650471, 0.4627451, 1, 0, 1,
-0.6262421, 0.7366016, 0.7238772, 0.4588235, 1, 0, 1,
-0.6259788, 1.298939, -0.4396418, 0.4509804, 1, 0, 1,
-0.6190364, -0.2671588, -2.903163, 0.4470588, 1, 0, 1,
-0.618331, -1.489298, -0.9746077, 0.4392157, 1, 0, 1,
-0.6153773, 1.163148, -0.08939655, 0.4352941, 1, 0, 1,
-0.6120403, 0.5352488, -1.001303, 0.427451, 1, 0, 1,
-0.6090305, -0.3596144, -0.9106385, 0.4235294, 1, 0, 1,
-0.6024181, -0.6238571, -3.328519, 0.4156863, 1, 0, 1,
-0.5999106, -0.5046793, -1.405489, 0.4117647, 1, 0, 1,
-0.5986029, -1.786617, -2.368385, 0.4039216, 1, 0, 1,
-0.593926, -0.002142125, -1.20982, 0.3960784, 1, 0, 1,
-0.5908875, 0.4138245, -0.9530531, 0.3921569, 1, 0, 1,
-0.589048, -0.2536705, -0.9927156, 0.3843137, 1, 0, 1,
-0.587577, -0.7335164, -2.956486, 0.3803922, 1, 0, 1,
-0.5873919, -0.8274984, -1.666901, 0.372549, 1, 0, 1,
-0.5790702, -0.8754362, -3.658993, 0.3686275, 1, 0, 1,
-0.5785297, 0.4424807, -0.355261, 0.3607843, 1, 0, 1,
-0.5782901, -0.9244232, -1.018779, 0.3568628, 1, 0, 1,
-0.5781956, -1.110644, -2.211142, 0.3490196, 1, 0, 1,
-0.5774786, -0.5509812, -2.763053, 0.345098, 1, 0, 1,
-0.5744529, -0.2531245, -2.267853, 0.3372549, 1, 0, 1,
-0.5743799, 0.9889593, 0.7861717, 0.3333333, 1, 0, 1,
-0.5713759, -0.7841749, -1.983934, 0.3254902, 1, 0, 1,
-0.5625173, 2.07166, -0.3410527, 0.3215686, 1, 0, 1,
-0.5625064, -0.3960694, -2.712832, 0.3137255, 1, 0, 1,
-0.5618364, -1.244038, -2.110546, 0.3098039, 1, 0, 1,
-0.5611635, -0.2380243, -1.094776, 0.3019608, 1, 0, 1,
-0.5560195, 0.9284236, -1.820443, 0.2941177, 1, 0, 1,
-0.5459895, -0.4536177, -3.318303, 0.2901961, 1, 0, 1,
-0.5457624, 0.2710717, -0.2175194, 0.282353, 1, 0, 1,
-0.545445, -0.6176071, -1.207591, 0.2784314, 1, 0, 1,
-0.5425756, 0.4325579, -0.334277, 0.2705882, 1, 0, 1,
-0.5392067, 0.8861613, 1.194008, 0.2666667, 1, 0, 1,
-0.5362906, 0.870667, -0.206337, 0.2588235, 1, 0, 1,
-0.533705, 0.4232535, -0.6672298, 0.254902, 1, 0, 1,
-0.5336775, 1.285221, -1.66754, 0.2470588, 1, 0, 1,
-0.5314701, 1.580558, -1.179569, 0.2431373, 1, 0, 1,
-0.5296207, 0.1733067, -1.283198, 0.2352941, 1, 0, 1,
-0.5273581, -1.144224, -5.066283, 0.2313726, 1, 0, 1,
-0.5264704, 0.5179291, -1.238195, 0.2235294, 1, 0, 1,
-0.5260063, -0.1397095, -3.028048, 0.2196078, 1, 0, 1,
-0.5197489, -0.9706773, -4.266253, 0.2117647, 1, 0, 1,
-0.5191047, 1.869956, -0.9486271, 0.2078431, 1, 0, 1,
-0.5075468, -1.125998, -2.510571, 0.2, 1, 0, 1,
-0.5061206, 0.9403322, 0.1936297, 0.1921569, 1, 0, 1,
-0.5060558, -0.2452284, -2.623518, 0.1882353, 1, 0, 1,
-0.5037817, 1.210281, -0.8480304, 0.1803922, 1, 0, 1,
-0.5009249, 1.050857, -0.8716901, 0.1764706, 1, 0, 1,
-0.498288, -1.663882, -2.327893, 0.1686275, 1, 0, 1,
-0.4937896, 0.6437265, -0.3771443, 0.1647059, 1, 0, 1,
-0.489735, 1.21518, -0.1712827, 0.1568628, 1, 0, 1,
-0.4828096, 1.02773, -1.508195, 0.1529412, 1, 0, 1,
-0.4730109, -0.3084406, -2.141987, 0.145098, 1, 0, 1,
-0.471508, 1.013839, 0.5367945, 0.1411765, 1, 0, 1,
-0.4707211, -0.7349929, -3.567541, 0.1333333, 1, 0, 1,
-0.4609312, -0.2129073, -2.318075, 0.1294118, 1, 0, 1,
-0.4608471, 1.028768, -1.140071, 0.1215686, 1, 0, 1,
-0.4577504, -0.7987395, -3.985024, 0.1176471, 1, 0, 1,
-0.4565074, -0.6843138, -2.64261, 0.1098039, 1, 0, 1,
-0.4523892, -0.6654286, -3.075683, 0.1058824, 1, 0, 1,
-0.4516377, -0.6296851, -2.465069, 0.09803922, 1, 0, 1,
-0.4510749, 1.633064, -1.576307, 0.09019608, 1, 0, 1,
-0.4486171, -0.05443415, -2.177927, 0.08627451, 1, 0, 1,
-0.4445512, 0.460882, 0.3746104, 0.07843138, 1, 0, 1,
-0.4427555, 0.0502427, -0.896968, 0.07450981, 1, 0, 1,
-0.4402743, -0.6044176, -2.640442, 0.06666667, 1, 0, 1,
-0.4393082, -0.2606547, -1.996743, 0.0627451, 1, 0, 1,
-0.4347471, 1.686863, -0.03270027, 0.05490196, 1, 0, 1,
-0.43471, -1.195735, -2.934086, 0.05098039, 1, 0, 1,
-0.4341356, -1.624679, -1.847455, 0.04313726, 1, 0, 1,
-0.4340947, -0.07448239, -2.319672, 0.03921569, 1, 0, 1,
-0.4295193, 2.437585, 0.8455686, 0.03137255, 1, 0, 1,
-0.4288387, -0.2798037, -0.9516953, 0.02745098, 1, 0, 1,
-0.423029, -1.374508, -1.496193, 0.01960784, 1, 0, 1,
-0.416868, 0.5865282, -0.9861889, 0.01568628, 1, 0, 1,
-0.4145153, -0.5291977, -3.797868, 0.007843138, 1, 0, 1,
-0.4102448, 0.04590283, -3.727889, 0.003921569, 1, 0, 1,
-0.4033837, -0.6116034, -2.798076, 0, 1, 0.003921569, 1,
-0.4033104, 0.3898953, -0.3817629, 0, 1, 0.01176471, 1,
-0.4028212, 0.1498322, 0.622327, 0, 1, 0.01568628, 1,
-0.3992386, -0.516793, -3.489683, 0, 1, 0.02352941, 1,
-0.395975, -1.955739, -4.300331, 0, 1, 0.02745098, 1,
-0.3955228, -0.3518575, -2.852606, 0, 1, 0.03529412, 1,
-0.3930582, -0.6858643, -2.705153, 0, 1, 0.03921569, 1,
-0.3919638, -0.7666936, -1.819041, 0, 1, 0.04705882, 1,
-0.3901162, -0.06687471, -2.065567, 0, 1, 0.05098039, 1,
-0.3881995, -0.1770764, -3.250473, 0, 1, 0.05882353, 1,
-0.3831199, -2.555356, -3.888869, 0, 1, 0.0627451, 1,
-0.3825279, 0.4104762, -2.621314, 0, 1, 0.07058824, 1,
-0.3823445, 0.631349, 0.5571266, 0, 1, 0.07450981, 1,
-0.3819286, 0.4529617, -1.440551, 0, 1, 0.08235294, 1,
-0.3752121, 0.6707978, 1.921248, 0, 1, 0.08627451, 1,
-0.3729392, 0.5884304, -1.594062, 0, 1, 0.09411765, 1,
-0.3691463, 1.01128, -1.890318, 0, 1, 0.1019608, 1,
-0.3634239, -2.595851, -2.618215, 0, 1, 0.1058824, 1,
-0.361686, -0.9079868, -4.13758, 0, 1, 0.1137255, 1,
-0.3589498, 0.5067566, 0.3578683, 0, 1, 0.1176471, 1,
-0.3556136, -0.7594934, -3.404599, 0, 1, 0.1254902, 1,
-0.3544351, -0.7407645, -3.657467, 0, 1, 0.1294118, 1,
-0.3535437, 0.1964903, -2.258126, 0, 1, 0.1372549, 1,
-0.3519144, -0.6029642, -1.549705, 0, 1, 0.1411765, 1,
-0.3491261, 1.430776, -1.079798, 0, 1, 0.1490196, 1,
-0.3480527, -1.382811, -2.641468, 0, 1, 0.1529412, 1,
-0.3464469, -1.450262, -2.403784, 0, 1, 0.1607843, 1,
-0.3454089, 0.7403904, -0.8551893, 0, 1, 0.1647059, 1,
-0.3404849, -0.9415026, -1.919699, 0, 1, 0.172549, 1,
-0.3371902, -0.8152651, -1.562391, 0, 1, 0.1764706, 1,
-0.3361484, -1.077929, -3.449056, 0, 1, 0.1843137, 1,
-0.3318121, -0.9446892, -2.413112, 0, 1, 0.1882353, 1,
-0.3291528, -0.9192756, -4.383129, 0, 1, 0.1960784, 1,
-0.323154, -0.6827146, -4.125499, 0, 1, 0.2039216, 1,
-0.3223985, 0.9323323, -1.036524, 0, 1, 0.2078431, 1,
-0.320895, 1.575514, 0.7115186, 0, 1, 0.2156863, 1,
-0.3193588, 0.4758408, -1.767582, 0, 1, 0.2196078, 1,
-0.3188448, 0.8582712, 1.098974, 0, 1, 0.227451, 1,
-0.3080212, 0.2521542, -1.181326, 0, 1, 0.2313726, 1,
-0.3074825, 1.264732, 0.1678741, 0, 1, 0.2392157, 1,
-0.3058403, -0.0220171, -2.058673, 0, 1, 0.2431373, 1,
-0.3051763, -1.109564, -2.223626, 0, 1, 0.2509804, 1,
-0.3027784, 0.2172645, -2.708163, 0, 1, 0.254902, 1,
-0.302673, -1.913154, -3.909595, 0, 1, 0.2627451, 1,
-0.3017985, -0.3984155, -0.6447084, 0, 1, 0.2666667, 1,
-0.2983184, 1.008352, -1.390396, 0, 1, 0.2745098, 1,
-0.2954412, 1.033851, -0.7420059, 0, 1, 0.2784314, 1,
-0.2932982, -0.1684187, -1.669838, 0, 1, 0.2862745, 1,
-0.2926928, 0.5031493, 0.4360131, 0, 1, 0.2901961, 1,
-0.2923937, 0.7269326, -1.767482, 0, 1, 0.2980392, 1,
-0.291145, -1.503467, -2.251905, 0, 1, 0.3058824, 1,
-0.2895631, -0.4770578, -3.708853, 0, 1, 0.3098039, 1,
-0.2891642, 0.7813599, 0.4852115, 0, 1, 0.3176471, 1,
-0.281566, -0.1498516, -1.865761, 0, 1, 0.3215686, 1,
-0.278276, -0.6974036, -4.090616, 0, 1, 0.3294118, 1,
-0.2745475, 1.386694, -0.8063284, 0, 1, 0.3333333, 1,
-0.2743335, -2.478059, -2.828962, 0, 1, 0.3411765, 1,
-0.2734234, 2.527641, -0.2166502, 0, 1, 0.345098, 1,
-0.2725855, 1.551654, 0.8100601, 0, 1, 0.3529412, 1,
-0.2705464, -0.4607129, -0.9048497, 0, 1, 0.3568628, 1,
-0.2693788, -0.9193664, -2.868357, 0, 1, 0.3647059, 1,
-0.2642463, -0.01416591, -1.290728, 0, 1, 0.3686275, 1,
-0.260299, -0.3033162, -2.454453, 0, 1, 0.3764706, 1,
-0.2599992, -1.172888, -3.05076, 0, 1, 0.3803922, 1,
-0.2587894, -1.102862, -3.668456, 0, 1, 0.3882353, 1,
-0.2587499, -1.970199, -2.242743, 0, 1, 0.3921569, 1,
-0.2585513, 0.7689994, 0.130134, 0, 1, 0.4, 1,
-0.2567988, 0.1168562, -2.470777, 0, 1, 0.4078431, 1,
-0.2545085, 0.655627, -0.7847133, 0, 1, 0.4117647, 1,
-0.2472478, -0.2558569, -0.4429943, 0, 1, 0.4196078, 1,
-0.2460249, -0.5462078, -2.343425, 0, 1, 0.4235294, 1,
-0.2423579, -0.8678523, -3.457646, 0, 1, 0.4313726, 1,
-0.2385638, -0.8639478, -3.027942, 0, 1, 0.4352941, 1,
-0.2294957, -0.1545389, -1.927499, 0, 1, 0.4431373, 1,
-0.2268328, 0.6917424, -0.4906185, 0, 1, 0.4470588, 1,
-0.2235404, 0.4449654, 0.6168491, 0, 1, 0.454902, 1,
-0.2228802, 0.07270153, -0.6166983, 0, 1, 0.4588235, 1,
-0.2208266, -0.6157957, -0.8861192, 0, 1, 0.4666667, 1,
-0.2199311, -0.4607557, -1.993633, 0, 1, 0.4705882, 1,
-0.2159259, -0.1457751, -0.9239556, 0, 1, 0.4784314, 1,
-0.212087, -1.399127, -2.446931, 0, 1, 0.4823529, 1,
-0.2071997, 1.459862, -1.340573, 0, 1, 0.4901961, 1,
-0.2037892, 0.636861, -0.9381062, 0, 1, 0.4941176, 1,
-0.2018889, 2.303259, 0.3357347, 0, 1, 0.5019608, 1,
-0.1987454, -1.157838, -6.337914, 0, 1, 0.509804, 1,
-0.1927502, -0.2964071, -1.386172, 0, 1, 0.5137255, 1,
-0.1916561, 1.320289, 0.5792442, 0, 1, 0.5215687, 1,
-0.1869054, 0.2084899, -1.089041, 0, 1, 0.5254902, 1,
-0.1786447, 0.4356942, 0.1182255, 0, 1, 0.5333334, 1,
-0.1774563, 0.5101717, -0.3562396, 0, 1, 0.5372549, 1,
-0.176178, 0.4672613, -1.535311, 0, 1, 0.5450981, 1,
-0.1759536, -0.3592536, -3.467326, 0, 1, 0.5490196, 1,
-0.1745777, -1.671824, -4.006037, 0, 1, 0.5568628, 1,
-0.1725113, -1.857567, -3.318397, 0, 1, 0.5607843, 1,
-0.1719845, -0.03974392, -2.432202, 0, 1, 0.5686275, 1,
-0.1704164, 0.1736638, -2.302267, 0, 1, 0.572549, 1,
-0.1698739, 0.1028415, -3.427946, 0, 1, 0.5803922, 1,
-0.168856, -0.2085898, -2.804907, 0, 1, 0.5843138, 1,
-0.166188, -1.286725, -3.170422, 0, 1, 0.5921569, 1,
-0.1648727, 0.1692633, 0.7244264, 0, 1, 0.5960785, 1,
-0.1607595, 2.311906, 0.4087004, 0, 1, 0.6039216, 1,
-0.1591128, -1.217729, -2.811274, 0, 1, 0.6117647, 1,
-0.1587613, -0.1703465, -2.516265, 0, 1, 0.6156863, 1,
-0.1566848, -0.238984, -2.601678, 0, 1, 0.6235294, 1,
-0.1522099, 0.9827384, -0.7262275, 0, 1, 0.627451, 1,
-0.1482807, 0.00290893, -1.998901, 0, 1, 0.6352941, 1,
-0.1468743, -1.253731, -4.924927, 0, 1, 0.6392157, 1,
-0.1453007, 1.850573, 0.09908481, 0, 1, 0.6470588, 1,
-0.1430786, -1.223031, -3.992279, 0, 1, 0.6509804, 1,
-0.1406875, 3.34585, 0.7765871, 0, 1, 0.6588235, 1,
-0.1371574, 0.09030993, -0.85721, 0, 1, 0.6627451, 1,
-0.1352751, -1.727081, -1.559744, 0, 1, 0.6705883, 1,
-0.1349781, 1.37343, 1.234923, 0, 1, 0.6745098, 1,
-0.1339429, -0.9069074, -2.605489, 0, 1, 0.682353, 1,
-0.1295712, -0.8084443, -3.656089, 0, 1, 0.6862745, 1,
-0.1276733, -0.2232602, -2.659057, 0, 1, 0.6941177, 1,
-0.1267729, 0.06102509, 0.141174, 0, 1, 0.7019608, 1,
-0.1265582, 2.002743, 0.1577303, 0, 1, 0.7058824, 1,
-0.1251641, 0.3387795, -0.03057873, 0, 1, 0.7137255, 1,
-0.1138875, -0.9774498, -2.858351, 0, 1, 0.7176471, 1,
-0.112264, -1.545049, -2.659023, 0, 1, 0.7254902, 1,
-0.1119507, 0.7752874, 1.491291, 0, 1, 0.7294118, 1,
-0.1109889, 0.007477164, -3.149171, 0, 1, 0.7372549, 1,
-0.1107619, 0.1720053, 0.1603945, 0, 1, 0.7411765, 1,
-0.1092888, 1.768292, 0.9992857, 0, 1, 0.7490196, 1,
-0.1051139, -0.6712899, -3.185449, 0, 1, 0.7529412, 1,
-0.1047196, 0.6616361, -0.2435496, 0, 1, 0.7607843, 1,
-0.09832693, -0.9339576, -3.303392, 0, 1, 0.7647059, 1,
-0.09600362, -1.58906, -3.025936, 0, 1, 0.772549, 1,
-0.09374163, 1.664106, 0.3261446, 0, 1, 0.7764706, 1,
-0.09329773, 1.218782, -0.6606696, 0, 1, 0.7843137, 1,
-0.08829582, -0.4761006, -2.733072, 0, 1, 0.7882353, 1,
-0.08680096, -0.7131459, -4.184582, 0, 1, 0.7960784, 1,
-0.08224443, 2.018433, 0.9302505, 0, 1, 0.8039216, 1,
-0.08153128, 1.634735, 0.5125733, 0, 1, 0.8078431, 1,
-0.07945765, -1.395352, -2.728012, 0, 1, 0.8156863, 1,
-0.07571463, -0.4523644, -5.396251, 0, 1, 0.8196079, 1,
-0.07196898, 0.6721335, 0.9643096, 0, 1, 0.827451, 1,
-0.06980143, 0.6631624, 1.175489, 0, 1, 0.8313726, 1,
-0.06547038, -1.374361, -3.412684, 0, 1, 0.8392157, 1,
-0.06499103, -0.1414645, -2.476531, 0, 1, 0.8431373, 1,
-0.06463692, -1.735201, -2.223159, 0, 1, 0.8509804, 1,
-0.06413316, 0.8994277, -0.7143203, 0, 1, 0.854902, 1,
-0.05694193, 0.2284518, -0.5424544, 0, 1, 0.8627451, 1,
-0.05645003, -1.438356, -3.978678, 0, 1, 0.8666667, 1,
-0.05613665, 0.3612696, -1.235125, 0, 1, 0.8745098, 1,
-0.05537857, -1.118444, -2.49592, 0, 1, 0.8784314, 1,
-0.05462083, -1.591261, -4.462274, 0, 1, 0.8862745, 1,
-0.05068172, 0.9193029, 0.6995266, 0, 1, 0.8901961, 1,
-0.04981909, -0.2298514, -2.436114, 0, 1, 0.8980392, 1,
-0.04477536, 0.3148917, -0.1307735, 0, 1, 0.9058824, 1,
-0.03992029, 2.010903, -0.4815231, 0, 1, 0.9098039, 1,
-0.03723298, -0.9265203, -2.820969, 0, 1, 0.9176471, 1,
-0.03674582, 0.4848261, -0.1819648, 0, 1, 0.9215686, 1,
-0.03507647, 0.166405, 1.462561, 0, 1, 0.9294118, 1,
-0.03492611, -0.768821, -3.554907, 0, 1, 0.9333333, 1,
-0.03456942, 0.6942863, -1.206248, 0, 1, 0.9411765, 1,
-0.03255631, 0.1164654, -0.01627915, 0, 1, 0.945098, 1,
-0.02839148, 0.8360668, -1.16026, 0, 1, 0.9529412, 1,
-0.02445598, -0.1707848, -4.255583, 0, 1, 0.9568627, 1,
-0.02028952, 0.4507864, 0.3939489, 0, 1, 0.9647059, 1,
-0.01687128, 0.7084023, -0.8700005, 0, 1, 0.9686275, 1,
-0.01458686, -0.4226172, -3.871531, 0, 1, 0.9764706, 1,
-0.01087804, 0.1031839, 0.01099396, 0, 1, 0.9803922, 1,
-0.005692601, 0.04258425, -2.14005, 0, 1, 0.9882353, 1,
-4.139299e-05, 0.2927991, 0.5744287, 0, 1, 0.9921569, 1,
0.002976736, 0.03010764, -1.935575, 0, 1, 1, 1,
0.004757348, 0.3773502, 1.393215, 0, 0.9921569, 1, 1,
0.005098914, -1.600754, 3.446235, 0, 0.9882353, 1, 1,
0.00556044, -0.1962095, 3.048293, 0, 0.9803922, 1, 1,
0.01048668, -1.793228, 2.32835, 0, 0.9764706, 1, 1,
0.01276751, 0.09074312, -0.7683034, 0, 0.9686275, 1, 1,
0.01591069, -0.7003019, 3.850049, 0, 0.9647059, 1, 1,
0.01777183, 0.6295085, -0.2011119, 0, 0.9568627, 1, 1,
0.02060271, -0.7545089, 0.8355891, 0, 0.9529412, 1, 1,
0.02082924, 1.244716, -0.3428187, 0, 0.945098, 1, 1,
0.02096796, -1.467608, 1.662617, 0, 0.9411765, 1, 1,
0.02292322, 0.05712225, 0.2929554, 0, 0.9333333, 1, 1,
0.02315482, -0.7379288, 3.028746, 0, 0.9294118, 1, 1,
0.0235236, 1.156813, -0.4870952, 0, 0.9215686, 1, 1,
0.02653266, 2.321373, -0.6158679, 0, 0.9176471, 1, 1,
0.03067709, -0.2798533, 2.982387, 0, 0.9098039, 1, 1,
0.03307255, 0.4470541, 0.3332186, 0, 0.9058824, 1, 1,
0.03481631, -0.5796448, 1.313834, 0, 0.8980392, 1, 1,
0.03544676, -0.7564341, 2.187726, 0, 0.8901961, 1, 1,
0.03701296, 1.31451, -0.4800254, 0, 0.8862745, 1, 1,
0.04523313, -0.7213982, 2.314331, 0, 0.8784314, 1, 1,
0.05175798, 1.34175, 1.15127, 0, 0.8745098, 1, 1,
0.05254598, -0.48251, 3.618827, 0, 0.8666667, 1, 1,
0.05341348, -0.9669527, 4.517794, 0, 0.8627451, 1, 1,
0.05372559, -0.8775262, 4.188304, 0, 0.854902, 1, 1,
0.05478002, 1.113906, -0.3225617, 0, 0.8509804, 1, 1,
0.05963228, -0.2337738, 2.524834, 0, 0.8431373, 1, 1,
0.06439894, -0.2968093, 4.711193, 0, 0.8392157, 1, 1,
0.06483518, -1.433598, 2.940629, 0, 0.8313726, 1, 1,
0.06919533, -0.7033653, 2.736972, 0, 0.827451, 1, 1,
0.0696153, -0.584344, 5.541921, 0, 0.8196079, 1, 1,
0.07117751, 1.813347, -0.3395799, 0, 0.8156863, 1, 1,
0.07141545, -0.6256919, 2.498464, 0, 0.8078431, 1, 1,
0.07379296, 0.5863252, 0.07692531, 0, 0.8039216, 1, 1,
0.0752934, -0.6505056, 1.822135, 0, 0.7960784, 1, 1,
0.07815539, -2.344966, 2.565985, 0, 0.7882353, 1, 1,
0.08042508, -2.038889, 2.63479, 0, 0.7843137, 1, 1,
0.08433643, 0.8707892, 1.19799, 0, 0.7764706, 1, 1,
0.08661509, 0.007657777, 1.782726, 0, 0.772549, 1, 1,
0.08857516, 1.581214, -1.068934, 0, 0.7647059, 1, 1,
0.09429634, -0.2755982, 4.208485, 0, 0.7607843, 1, 1,
0.09731436, -0.4486725, 2.281651, 0, 0.7529412, 1, 1,
0.1009237, 1.524864, 1.405624, 0, 0.7490196, 1, 1,
0.1037122, -0.8327871, 1.769209, 0, 0.7411765, 1, 1,
0.1037413, 0.4536059, 0.387264, 0, 0.7372549, 1, 1,
0.1046569, -0.5645478, 5.132276, 0, 0.7294118, 1, 1,
0.1052932, 0.8626919, 0.8234258, 0, 0.7254902, 1, 1,
0.1061473, -1.063238, 3.568964, 0, 0.7176471, 1, 1,
0.1074036, 1.088026, -0.01805509, 0, 0.7137255, 1, 1,
0.1088551, 1.225579, -0.4916086, 0, 0.7058824, 1, 1,
0.1126362, 0.4541125, 2.493851, 0, 0.6980392, 1, 1,
0.1127073, -2.129552, 2.755524, 0, 0.6941177, 1, 1,
0.1146279, 0.871247, -2.359949, 0, 0.6862745, 1, 1,
0.117586, 0.07619379, 0.3971117, 0, 0.682353, 1, 1,
0.1183704, 0.05829165, 2.553731, 0, 0.6745098, 1, 1,
0.1192596, -0.7400336, 3.64912, 0, 0.6705883, 1, 1,
0.1201323, -0.576314, 1.880289, 0, 0.6627451, 1, 1,
0.1225739, -0.6387163, 0.4490123, 0, 0.6588235, 1, 1,
0.1261738, -0.1459756, 2.9523, 0, 0.6509804, 1, 1,
0.1274026, 0.258979, 0.9602206, 0, 0.6470588, 1, 1,
0.1330273, 1.469021, -1.015415, 0, 0.6392157, 1, 1,
0.1370335, 0.3949376, 1.881556, 0, 0.6352941, 1, 1,
0.1397518, -0.01985775, 3.111142, 0, 0.627451, 1, 1,
0.1408135, -1.384251, 1.650499, 0, 0.6235294, 1, 1,
0.1409874, -0.5273815, 5.051413, 0, 0.6156863, 1, 1,
0.1411944, -0.8758131, 2.981482, 0, 0.6117647, 1, 1,
0.1422453, 0.6741935, 1.31329, 0, 0.6039216, 1, 1,
0.1513009, -1.300458, 3.213826, 0, 0.5960785, 1, 1,
0.1545513, -0.4364571, 4.541249, 0, 0.5921569, 1, 1,
0.1548129, 1.161229, -0.5766683, 0, 0.5843138, 1, 1,
0.1581424, 1.348199, -0.5576947, 0, 0.5803922, 1, 1,
0.1636173, -1.060154, 3.949789, 0, 0.572549, 1, 1,
0.1637367, 0.584032, 2.295588, 0, 0.5686275, 1, 1,
0.1638544, -0.7995695, 5.971734, 0, 0.5607843, 1, 1,
0.167665, 1.466079, 0.4966481, 0, 0.5568628, 1, 1,
0.1679896, -1.47491, 4.179857, 0, 0.5490196, 1, 1,
0.1690018, -0.07667898, 2.589843, 0, 0.5450981, 1, 1,
0.1703468, -0.06333118, 1.711681, 0, 0.5372549, 1, 1,
0.1731571, 0.1748731, 1.417601, 0, 0.5333334, 1, 1,
0.1780289, 1.020846, -0.9429951, 0, 0.5254902, 1, 1,
0.1781297, -0.3701581, 1.719615, 0, 0.5215687, 1, 1,
0.1784509, -0.2724263, 2.8969, 0, 0.5137255, 1, 1,
0.1818525, 0.4587986, -0.3814369, 0, 0.509804, 1, 1,
0.1888499, -1.068303, 1.99991, 0, 0.5019608, 1, 1,
0.1942493, 0.3786077, -0.4744327, 0, 0.4941176, 1, 1,
0.1950518, 0.3905339, 1.535336, 0, 0.4901961, 1, 1,
0.1975167, -1.469802, 4.017153, 0, 0.4823529, 1, 1,
0.1997297, -0.1515916, 1.08069, 0, 0.4784314, 1, 1,
0.200179, 1.354681, 1.015176, 0, 0.4705882, 1, 1,
0.2011909, 0.4471259, 0.6127309, 0, 0.4666667, 1, 1,
0.2053895, -0.2671572, 3.416402, 0, 0.4588235, 1, 1,
0.2065768, 0.3908882, -1.532626, 0, 0.454902, 1, 1,
0.2086547, 0.9354655, 0.3374411, 0, 0.4470588, 1, 1,
0.2104326, 1.224458, 0.1739659, 0, 0.4431373, 1, 1,
0.2129495, 1.83274, -0.007387979, 0, 0.4352941, 1, 1,
0.2222617, -0.9540607, 1.905624, 0, 0.4313726, 1, 1,
0.2223979, 1.263285, 1.556801, 0, 0.4235294, 1, 1,
0.2228266, -0.8180213, 1.605297, 0, 0.4196078, 1, 1,
0.2230976, 1.88696, 0.9360951, 0, 0.4117647, 1, 1,
0.2241753, -0.2415507, 2.383528, 0, 0.4078431, 1, 1,
0.2258153, 0.3092365, 0.6889271, 0, 0.4, 1, 1,
0.2314131, -0.5648639, 2.546193, 0, 0.3921569, 1, 1,
0.2323806, 0.5279173, 0.9286436, 0, 0.3882353, 1, 1,
0.233268, 0.5530769, 1.950353, 0, 0.3803922, 1, 1,
0.2344697, 0.5579268, -1.239344, 0, 0.3764706, 1, 1,
0.2369792, 0.3069382, 0.4876769, 0, 0.3686275, 1, 1,
0.2377799, 0.7851089, 0.6042514, 0, 0.3647059, 1, 1,
0.2393588, 0.337141, 2.264341, 0, 0.3568628, 1, 1,
0.2400608, -0.350111, 3.080057, 0, 0.3529412, 1, 1,
0.2405931, 0.9219911, -0.759699, 0, 0.345098, 1, 1,
0.2429067, 0.505135, -0.8417289, 0, 0.3411765, 1, 1,
0.2610365, 0.4719729, 0.3970141, 0, 0.3333333, 1, 1,
0.2615137, -0.08373247, 1.3254, 0, 0.3294118, 1, 1,
0.2629708, -0.9529408, 2.372911, 0, 0.3215686, 1, 1,
0.2636298, 1.048331, -0.8615952, 0, 0.3176471, 1, 1,
0.2643915, -0.8628287, 2.59794, 0, 0.3098039, 1, 1,
0.2660518, 0.1372711, 1.852666, 0, 0.3058824, 1, 1,
0.2666554, 1.054603, 2.107433, 0, 0.2980392, 1, 1,
0.273749, 0.1166226, 0.787042, 0, 0.2901961, 1, 1,
0.276813, 0.3786327, -0.9644296, 0, 0.2862745, 1, 1,
0.2862018, -1.160867, 3.057806, 0, 0.2784314, 1, 1,
0.2866712, -1.836762, 3.508772, 0, 0.2745098, 1, 1,
0.2875401, 1.272059, -0.3100484, 0, 0.2666667, 1, 1,
0.2882097, -1.250049, 2.316492, 0, 0.2627451, 1, 1,
0.291203, 0.889411, -0.3195193, 0, 0.254902, 1, 1,
0.2925793, -0.1584506, 3.130188, 0, 0.2509804, 1, 1,
0.299357, -0.5469797, 3.925085, 0, 0.2431373, 1, 1,
0.3017623, -0.9583281, 4.26516, 0, 0.2392157, 1, 1,
0.3030139, -0.8602417, 2.301363, 0, 0.2313726, 1, 1,
0.3056349, 1.096568, 2.031543, 0, 0.227451, 1, 1,
0.3064865, -0.2662337, 2.491066, 0, 0.2196078, 1, 1,
0.307514, 0.05332091, 2.64355, 0, 0.2156863, 1, 1,
0.3095405, 0.4435232, 0.09131864, 0, 0.2078431, 1, 1,
0.3097507, 0.3824826, 2.323343, 0, 0.2039216, 1, 1,
0.3104292, 0.7182997, 0.7248767, 0, 0.1960784, 1, 1,
0.3111759, 0.8735631, -0.7988947, 0, 0.1882353, 1, 1,
0.3129925, 0.04956575, 1.293583, 0, 0.1843137, 1, 1,
0.3200332, 0.3567162, 1.67472, 0, 0.1764706, 1, 1,
0.3226396, 1.589396, 0.6036288, 0, 0.172549, 1, 1,
0.3259134, 0.5908276, -1.110404, 0, 0.1647059, 1, 1,
0.3274857, 0.8475751, -1.000995, 0, 0.1607843, 1, 1,
0.3301678, -0.1274674, 1.722322, 0, 0.1529412, 1, 1,
0.3312269, 0.1688157, 3.139874, 0, 0.1490196, 1, 1,
0.3320952, 0.3429677, 1.048484, 0, 0.1411765, 1, 1,
0.3333917, 1.207708, 1.310123, 0, 0.1372549, 1, 1,
0.3338051, 0.4129729, 0.8803018, 0, 0.1294118, 1, 1,
0.3353284, 1.242353, 0.1781968, 0, 0.1254902, 1, 1,
0.3360794, 0.3894736, 0.1735469, 0, 0.1176471, 1, 1,
0.336651, 0.6936192, -1.273095, 0, 0.1137255, 1, 1,
0.3370688, 0.4676012, 1.199048, 0, 0.1058824, 1, 1,
0.3377593, 0.6288496, 0.5263075, 0, 0.09803922, 1, 1,
0.3445112, 1.983698, 0.9410274, 0, 0.09411765, 1, 1,
0.3463795, -0.6863106, 2.740224, 0, 0.08627451, 1, 1,
0.3485243, -0.2770641, 3.296232, 0, 0.08235294, 1, 1,
0.3487806, 0.2179466, 1.847256, 0, 0.07450981, 1, 1,
0.350418, -1.462738, 2.395937, 0, 0.07058824, 1, 1,
0.3540286, 0.6165668, 1.185113, 0, 0.0627451, 1, 1,
0.3551622, -0.1233281, 2.599235, 0, 0.05882353, 1, 1,
0.3561609, -0.1101815, 0.5849812, 0, 0.05098039, 1, 1,
0.3575441, 0.6928787, -0.1501601, 0, 0.04705882, 1, 1,
0.3585289, -0.07902362, 1.507551, 0, 0.03921569, 1, 1,
0.358585, -0.2116409, 3.389795, 0, 0.03529412, 1, 1,
0.3661649, -0.5324231, 2.174117, 0, 0.02745098, 1, 1,
0.3703238, 0.4071931, 1.266308, 0, 0.02352941, 1, 1,
0.3755834, 1.284422, -0.3091954, 0, 0.01568628, 1, 1,
0.3776892, -0.5872378, 3.049041, 0, 0.01176471, 1, 1,
0.3821539, 0.1171153, 1.279793, 0, 0.003921569, 1, 1,
0.3840603, -1.476685, 2.892778, 0.003921569, 0, 1, 1,
0.3900196, -0.1610583, 1.751627, 0.007843138, 0, 1, 1,
0.3967594, -0.5380956, 1.546931, 0.01568628, 0, 1, 1,
0.3985318, 1.525885, -0.9198145, 0.01960784, 0, 1, 1,
0.4019339, -0.2932708, 0.5166499, 0.02745098, 0, 1, 1,
0.4028037, -1.125543, 3.809929, 0.03137255, 0, 1, 1,
0.4045903, 1.161227, 0.1993106, 0.03921569, 0, 1, 1,
0.4121882, 0.3687399, 2.384964, 0.04313726, 0, 1, 1,
0.4122255, 0.07355003, 0.02812887, 0.05098039, 0, 1, 1,
0.4144835, 2.815476, 0.08984342, 0.05490196, 0, 1, 1,
0.4193956, -0.4280379, 3.472388, 0.0627451, 0, 1, 1,
0.4235359, 1.445786, -0.8165482, 0.06666667, 0, 1, 1,
0.4254924, -0.8969722, 2.656694, 0.07450981, 0, 1, 1,
0.4259562, -2.57095, 2.954732, 0.07843138, 0, 1, 1,
0.4280775, -0.4153987, 3.494526, 0.08627451, 0, 1, 1,
0.4280838, 1.818349, 0.7290004, 0.09019608, 0, 1, 1,
0.4321017, 0.2847603, 1.69118, 0.09803922, 0, 1, 1,
0.4341022, 0.3578845, 0.6409458, 0.1058824, 0, 1, 1,
0.4346895, 1.184674, -0.8898926, 0.1098039, 0, 1, 1,
0.4355901, -1.079815, 3.705491, 0.1176471, 0, 1, 1,
0.4405868, -0.5267789, 3.363877, 0.1215686, 0, 1, 1,
0.441775, -2.694687, 4.91716, 0.1294118, 0, 1, 1,
0.4519649, 0.8614685, 1.22917, 0.1333333, 0, 1, 1,
0.4583719, 0.1289065, 1.212642, 0.1411765, 0, 1, 1,
0.4607366, -1.175874, 2.260409, 0.145098, 0, 1, 1,
0.4631851, 0.6208898, 0.5983732, 0.1529412, 0, 1, 1,
0.4697973, 1.65389, -0.6148745, 0.1568628, 0, 1, 1,
0.4753821, 0.3162571, 1.208961, 0.1647059, 0, 1, 1,
0.4815358, -0.6916515, 4.065299, 0.1686275, 0, 1, 1,
0.4829811, -1.096554, 1.51745, 0.1764706, 0, 1, 1,
0.4858764, 1.882545, 1.70011, 0.1803922, 0, 1, 1,
0.4871551, -0.2998015, 1.833897, 0.1882353, 0, 1, 1,
0.4877129, 0.2041418, 2.520523, 0.1921569, 0, 1, 1,
0.4901211, 1.017898, 1.137573, 0.2, 0, 1, 1,
0.492687, -0.1829656, 2.094165, 0.2078431, 0, 1, 1,
0.4958934, -0.1168555, 0.8546543, 0.2117647, 0, 1, 1,
0.4980052, -0.2066841, 1.91461, 0.2196078, 0, 1, 1,
0.502183, -0.08392168, 1.921129, 0.2235294, 0, 1, 1,
0.5040119, 0.5027622, 0.00270479, 0.2313726, 0, 1, 1,
0.5054527, -0.3348595, 3.006331, 0.2352941, 0, 1, 1,
0.5064588, 0.3120175, 1.687758, 0.2431373, 0, 1, 1,
0.507186, 0.189078, -0.09206157, 0.2470588, 0, 1, 1,
0.5095209, -1.179677, 3.249557, 0.254902, 0, 1, 1,
0.5100012, -1.926491, 2.991418, 0.2588235, 0, 1, 1,
0.5115524, -1.661062, 3.468836, 0.2666667, 0, 1, 1,
0.5128307, -0.01652876, 0.9979111, 0.2705882, 0, 1, 1,
0.5202135, 0.5022113, 0.09785228, 0.2784314, 0, 1, 1,
0.5251484, -1.258717, 3.523748, 0.282353, 0, 1, 1,
0.5252033, 0.4284064, 2.175747, 0.2901961, 0, 1, 1,
0.5266453, -0.5440956, 2.487603, 0.2941177, 0, 1, 1,
0.527515, -0.9311153, 1.362286, 0.3019608, 0, 1, 1,
0.528558, 0.9578188, -1.256358, 0.3098039, 0, 1, 1,
0.5297113, 0.313315, 1.97733, 0.3137255, 0, 1, 1,
0.5310633, 2.123037, 0.5416138, 0.3215686, 0, 1, 1,
0.5310888, 1.24547, 1.09339, 0.3254902, 0, 1, 1,
0.5323101, 0.09965467, 1.534617, 0.3333333, 0, 1, 1,
0.5326114, -0.9060183, 2.187424, 0.3372549, 0, 1, 1,
0.5331746, -0.1804077, 0.873363, 0.345098, 0, 1, 1,
0.5381333, 0.5892095, 0.1711164, 0.3490196, 0, 1, 1,
0.5382594, 0.7980561, -0.1801852, 0.3568628, 0, 1, 1,
0.5401153, -0.4572062, 2.032371, 0.3607843, 0, 1, 1,
0.5424257, -1.503704, 2.190278, 0.3686275, 0, 1, 1,
0.5438808, 0.7569318, 1.733599, 0.372549, 0, 1, 1,
0.5460523, -0.6647864, 1.002825, 0.3803922, 0, 1, 1,
0.5482846, 0.2944985, 0.1974584, 0.3843137, 0, 1, 1,
0.5485982, 0.9403069, -0.3062305, 0.3921569, 0, 1, 1,
0.5527921, 0.1049522, 2.635626, 0.3960784, 0, 1, 1,
0.5568026, -0.9215526, 1.308161, 0.4039216, 0, 1, 1,
0.5582528, 0.6961266, 0.6166576, 0.4117647, 0, 1, 1,
0.5604606, 0.9460205, 0.4709359, 0.4156863, 0, 1, 1,
0.5619044, 0.7442629, 1.15879, 0.4235294, 0, 1, 1,
0.5642033, -0.02579843, 1.497463, 0.427451, 0, 1, 1,
0.5717589, 0.1251956, 0.9286632, 0.4352941, 0, 1, 1,
0.5722096, -0.271355, 3.606766, 0.4392157, 0, 1, 1,
0.5741827, -0.08957873, 4.388499, 0.4470588, 0, 1, 1,
0.5752535, -0.3615224, 2.218573, 0.4509804, 0, 1, 1,
0.5773568, 1.255393, -0.2713123, 0.4588235, 0, 1, 1,
0.5827155, 0.8188831, 1.133986, 0.4627451, 0, 1, 1,
0.5852406, 0.5734105, 0.1781687, 0.4705882, 0, 1, 1,
0.5858392, -0.8705068, 3.0691, 0.4745098, 0, 1, 1,
0.5891538, 1.618785, 0.2657208, 0.4823529, 0, 1, 1,
0.593107, 0.8580957, 0.2379485, 0.4862745, 0, 1, 1,
0.6003246, -1.754445, 1.87322, 0.4941176, 0, 1, 1,
0.604053, -1.824674, 3.120315, 0.5019608, 0, 1, 1,
0.6054577, 0.3933355, 0.5271508, 0.5058824, 0, 1, 1,
0.6113307, -0.5341887, 2.663309, 0.5137255, 0, 1, 1,
0.6169764, -0.1572945, 2.824999, 0.5176471, 0, 1, 1,
0.6170268, 0.2175039, 2.575016, 0.5254902, 0, 1, 1,
0.6189203, 2.254358, -0.7592984, 0.5294118, 0, 1, 1,
0.6193739, -0.4952112, 3.830698, 0.5372549, 0, 1, 1,
0.6218836, 0.6775795, 0.1603728, 0.5411765, 0, 1, 1,
0.6263146, 1.457363, -0.5522846, 0.5490196, 0, 1, 1,
0.6340469, -0.1765278, 2.907484, 0.5529412, 0, 1, 1,
0.6342421, -0.1666467, 0.5440929, 0.5607843, 0, 1, 1,
0.6418779, 0.09966724, 1.177223, 0.5647059, 0, 1, 1,
0.6430118, -0.9144895, 1.817966, 0.572549, 0, 1, 1,
0.645482, -1.580633, 0.4239888, 0.5764706, 0, 1, 1,
0.6471366, 0.8594796, 0.1036047, 0.5843138, 0, 1, 1,
0.6480809, -0.7997544, 1.826502, 0.5882353, 0, 1, 1,
0.6525151, 1.996614, 0.4032692, 0.5960785, 0, 1, 1,
0.6547254, 1.156024, 1.422667, 0.6039216, 0, 1, 1,
0.657064, 1.338856, 1.128126, 0.6078432, 0, 1, 1,
0.6608816, 0.4203638, 1.402821, 0.6156863, 0, 1, 1,
0.6710545, -1.053585, 5.052535, 0.6196079, 0, 1, 1,
0.6723679, -0.1753844, 2.158417, 0.627451, 0, 1, 1,
0.6782711, 0.3248776, -0.09887911, 0.6313726, 0, 1, 1,
0.6826408, 2.899349, 0.9082519, 0.6392157, 0, 1, 1,
0.6956995, -0.2780555, 1.763597, 0.6431373, 0, 1, 1,
0.6967067, -0.04743653, 1.515266, 0.6509804, 0, 1, 1,
0.6976131, 0.1077504, 0.4799263, 0.654902, 0, 1, 1,
0.6988896, -2.472637, 2.146768, 0.6627451, 0, 1, 1,
0.7054691, 0.6295472, 0.8543507, 0.6666667, 0, 1, 1,
0.705494, -0.3943875, 1.544415, 0.6745098, 0, 1, 1,
0.7082125, 0.6922821, 0.3962887, 0.6784314, 0, 1, 1,
0.709225, 0.3866106, 0.2340086, 0.6862745, 0, 1, 1,
0.7107713, 0.08099113, 1.9906, 0.6901961, 0, 1, 1,
0.71503, -0.1767555, 3.037836, 0.6980392, 0, 1, 1,
0.7160545, 1.281036, 0.1069052, 0.7058824, 0, 1, 1,
0.7163362, 0.1194292, 1.540347, 0.7098039, 0, 1, 1,
0.7175043, -1.153961, -0.7397336, 0.7176471, 0, 1, 1,
0.7294374, -0.380857, 2.008834, 0.7215686, 0, 1, 1,
0.730091, 0.6081185, -0.4788767, 0.7294118, 0, 1, 1,
0.7329045, -0.2047392, 1.234694, 0.7333333, 0, 1, 1,
0.7352454, 1.182605, 1.53285, 0.7411765, 0, 1, 1,
0.7379218, 1.31298, 1.602976, 0.7450981, 0, 1, 1,
0.7401851, 0.255612, 0.7005456, 0.7529412, 0, 1, 1,
0.7417139, -0.3555609, 1.839791, 0.7568628, 0, 1, 1,
0.742933, -1.676219, 2.084062, 0.7647059, 0, 1, 1,
0.7440234, 0.9893994, 0.857366, 0.7686275, 0, 1, 1,
0.7475158, 1.799526, 0.9684842, 0.7764706, 0, 1, 1,
0.7517864, -0.02178442, 2.809736, 0.7803922, 0, 1, 1,
0.7521748, 1.766515, -1.252236, 0.7882353, 0, 1, 1,
0.7535199, -0.05458683, 0.6992933, 0.7921569, 0, 1, 1,
0.7560434, -0.7169236, 2.292556, 0.8, 0, 1, 1,
0.7566686, -0.7235502, 4.631306, 0.8078431, 0, 1, 1,
0.7584077, 1.092844, 1.228208, 0.8117647, 0, 1, 1,
0.7637663, -0.4206862, 2.669751, 0.8196079, 0, 1, 1,
0.7693301, 0.2793114, 1.151814, 0.8235294, 0, 1, 1,
0.7699221, 0.2028845, 0.3626871, 0.8313726, 0, 1, 1,
0.7760533, 0.7783198, 1.634477, 0.8352941, 0, 1, 1,
0.7777478, -0.1917546, 3.191198, 0.8431373, 0, 1, 1,
0.7795842, 0.9843406, 0.5010008, 0.8470588, 0, 1, 1,
0.7822452, -0.6066358, 0.1286776, 0.854902, 0, 1, 1,
0.783281, 1.680871, 2.071035, 0.8588235, 0, 1, 1,
0.7860187, -0.3453423, 1.224388, 0.8666667, 0, 1, 1,
0.7861142, -0.309559, 2.130118, 0.8705882, 0, 1, 1,
0.7927836, -0.8792018, 1.312134, 0.8784314, 0, 1, 1,
0.7938557, 0.811554, 0.9975838, 0.8823529, 0, 1, 1,
0.7977731, -0.9904531, 2.647904, 0.8901961, 0, 1, 1,
0.7979931, 0.1847184, 1.983392, 0.8941177, 0, 1, 1,
0.8020046, 2.017745, 0.4382791, 0.9019608, 0, 1, 1,
0.8025275, -0.06641597, -0.1279756, 0.9098039, 0, 1, 1,
0.8036039, -0.1719894, 3.374558, 0.9137255, 0, 1, 1,
0.8076625, 0.05194571, 1.379347, 0.9215686, 0, 1, 1,
0.8182849, -0.4630269, 2.865492, 0.9254902, 0, 1, 1,
0.8191651, 0.01720626, 0.9653806, 0.9333333, 0, 1, 1,
0.8241832, -0.1552958, 1.942914, 0.9372549, 0, 1, 1,
0.8258983, 2.225132, -0.1153509, 0.945098, 0, 1, 1,
0.8485245, -0.4399614, 3.275869, 0.9490196, 0, 1, 1,
0.8495676, -0.619865, 2.135184, 0.9568627, 0, 1, 1,
0.850908, 0.01790536, 2.183803, 0.9607843, 0, 1, 1,
0.8634048, -1.165835, 1.202764, 0.9686275, 0, 1, 1,
0.8644802, -1.905815, 2.749135, 0.972549, 0, 1, 1,
0.8680842, 0.2243612, 1.410415, 0.9803922, 0, 1, 1,
0.8707268, -0.391278, 1.253187, 0.9843137, 0, 1, 1,
0.8753206, 1.256055, -0.3041109, 0.9921569, 0, 1, 1,
0.8846529, 0.03532295, 2.045839, 0.9960784, 0, 1, 1,
0.8858723, 1.313511, 2.246989, 1, 0, 0.9960784, 1,
0.8881161, 0.633517, 0.6230239, 1, 0, 0.9882353, 1,
0.8883386, 1.264444, 1.44441, 1, 0, 0.9843137, 1,
0.8902383, 1.870788, 0.8630644, 1, 0, 0.9764706, 1,
0.8924515, 0.4248551, 0.2991986, 1, 0, 0.972549, 1,
0.8963318, -0.6770976, 1.145935, 1, 0, 0.9647059, 1,
0.9043608, -0.3047656, 0.9913515, 1, 0, 0.9607843, 1,
0.9074747, 0.2510408, 2.730762, 1, 0, 0.9529412, 1,
0.9098436, 0.2708296, 0.900838, 1, 0, 0.9490196, 1,
0.9112648, -0.1599076, -0.3492408, 1, 0, 0.9411765, 1,
0.9156298, 0.4682691, 0.9274098, 1, 0, 0.9372549, 1,
0.9191328, 0.2721945, 0.8718663, 1, 0, 0.9294118, 1,
0.9203278, -0.3241548, 1.420402, 1, 0, 0.9254902, 1,
0.9224919, 0.5376929, 0.2430516, 1, 0, 0.9176471, 1,
0.925695, 0.1400697, -0.0750818, 1, 0, 0.9137255, 1,
0.9340118, -0.2176461, 0.8529498, 1, 0, 0.9058824, 1,
0.9340572, -1.096136, 3.352026, 1, 0, 0.9019608, 1,
0.9360948, 0.4538193, 0.5128602, 1, 0, 0.8941177, 1,
0.9418609, -0.4286056, 2.937001, 1, 0, 0.8862745, 1,
0.9547316, 0.07252528, 0.6312777, 1, 0, 0.8823529, 1,
0.9616383, 0.7228592, 0.2334371, 1, 0, 0.8745098, 1,
0.9657243, -2.085688, 3.588084, 1, 0, 0.8705882, 1,
0.9671919, 0.1082764, 0.498904, 1, 0, 0.8627451, 1,
0.9702386, 0.4203245, 0.4765831, 1, 0, 0.8588235, 1,
0.9734318, 0.3446302, 0.868564, 1, 0, 0.8509804, 1,
0.9777679, -0.2706451, -1.010502, 1, 0, 0.8470588, 1,
0.98751, 0.1149454, 1.31881, 1, 0, 0.8392157, 1,
0.9890949, 0.2152595, 0.1626045, 1, 0, 0.8352941, 1,
0.9902773, -0.4984603, 0.3189453, 1, 0, 0.827451, 1,
0.9918632, 1.411222, 0.626358, 1, 0, 0.8235294, 1,
0.9925665, -1.312281, 2.684084, 1, 0, 0.8156863, 1,
0.9939303, -1.026121, 1.849293, 1, 0, 0.8117647, 1,
0.9940126, 0.1423323, 1.437944, 1, 0, 0.8039216, 1,
1.015536, -1.350433, 2.619209, 1, 0, 0.7960784, 1,
1.019365, -0.9498102, 2.54898, 1, 0, 0.7921569, 1,
1.0322, -0.5853564, 2.53471, 1, 0, 0.7843137, 1,
1.041051, -0.2144078, 3.224047, 1, 0, 0.7803922, 1,
1.043154, 2.074837, 0.9600697, 1, 0, 0.772549, 1,
1.045256, 0.7976518, 0.7330897, 1, 0, 0.7686275, 1,
1.048361, -1.099121, 2.185158, 1, 0, 0.7607843, 1,
1.057266, 0.2590577, 2.346373, 1, 0, 0.7568628, 1,
1.06356, -1.485887, 3.099342, 1, 0, 0.7490196, 1,
1.080032, 0.4848652, -0.3049137, 1, 0, 0.7450981, 1,
1.084927, -0.5820284, 1.686465, 1, 0, 0.7372549, 1,
1.088048, 0.1274733, 0.5723932, 1, 0, 0.7333333, 1,
1.095032, 0.9153892, 0.8921067, 1, 0, 0.7254902, 1,
1.096585, 0.5625088, 0.526183, 1, 0, 0.7215686, 1,
1.09957, -1.278796, 1.97706, 1, 0, 0.7137255, 1,
1.101936, -1.396451, 1.144004, 1, 0, 0.7098039, 1,
1.106392, 0.2543593, 0.8759204, 1, 0, 0.7019608, 1,
1.108323, 0.7462597, 0.6610079, 1, 0, 0.6941177, 1,
1.129404, -0.7435737, 3.257178, 1, 0, 0.6901961, 1,
1.135651, 0.4897976, 0.9861304, 1, 0, 0.682353, 1,
1.151037, -0.7356305, 1.067413, 1, 0, 0.6784314, 1,
1.151866, -0.3666613, 1.000454, 1, 0, 0.6705883, 1,
1.155878, -0.4244429, 2.041173, 1, 0, 0.6666667, 1,
1.162809, 1.916155, -0.1768677, 1, 0, 0.6588235, 1,
1.165787, 0.3611121, 1.480846, 1, 0, 0.654902, 1,
1.166519, -0.04626835, 3.041386, 1, 0, 0.6470588, 1,
1.171483, 0.9092138, 1.487481, 1, 0, 0.6431373, 1,
1.174892, -0.246061, 1.032293, 1, 0, 0.6352941, 1,
1.193438, -0.6074247, 2.627788, 1, 0, 0.6313726, 1,
1.194884, 1.486089, -1.413917, 1, 0, 0.6235294, 1,
1.200342, -1.699452, 2.904575, 1, 0, 0.6196079, 1,
1.214124, 0.8584538, 0.6855433, 1, 0, 0.6117647, 1,
1.214453, 0.6430346, 0.2861285, 1, 0, 0.6078432, 1,
1.221208, -1.081628, 2.972733, 1, 0, 0.6, 1,
1.225973, 0.2574901, 1.77463, 1, 0, 0.5921569, 1,
1.259266, -0.09198159, 1.096646, 1, 0, 0.5882353, 1,
1.27075, -1.393242, 2.218254, 1, 0, 0.5803922, 1,
1.275244, 0.4968573, 3.378276, 1, 0, 0.5764706, 1,
1.283126, -1.544661, 1.876808, 1, 0, 0.5686275, 1,
1.291738, -0.8155516, 1.868073, 1, 0, 0.5647059, 1,
1.30492, 1.186944, 0.3927422, 1, 0, 0.5568628, 1,
1.310518, -0.268712, 1.018229, 1, 0, 0.5529412, 1,
1.312395, 0.3004314, 0.8621216, 1, 0, 0.5450981, 1,
1.325439, 0.2000155, 1.006647, 1, 0, 0.5411765, 1,
1.329814, 1.545911, 1.460194, 1, 0, 0.5333334, 1,
1.332526, 0.5237251, 0.5009228, 1, 0, 0.5294118, 1,
1.337627, -1.08636, 3.535335, 1, 0, 0.5215687, 1,
1.343441, 0.7599077, 1.581264, 1, 0, 0.5176471, 1,
1.34792, -0.1105716, -0.1818336, 1, 0, 0.509804, 1,
1.348086, -0.2040914, 1.716189, 1, 0, 0.5058824, 1,
1.353603, -0.4107175, 1.854518, 1, 0, 0.4980392, 1,
1.355417, 0.4418224, 2.817287, 1, 0, 0.4901961, 1,
1.360945, -0.8075144, 2.645332, 1, 0, 0.4862745, 1,
1.364239, -0.3967765, 4.115123, 1, 0, 0.4784314, 1,
1.373209, -0.6729073, 1.170568, 1, 0, 0.4745098, 1,
1.379326, -0.5558838, 2.317036, 1, 0, 0.4666667, 1,
1.381987, -0.402557, 0.6927716, 1, 0, 0.4627451, 1,
1.383948, -0.2284823, 2.849309, 1, 0, 0.454902, 1,
1.390524, 0.04181336, 1.15639, 1, 0, 0.4509804, 1,
1.395445, -0.4761008, 2.822737, 1, 0, 0.4431373, 1,
1.398587, 0.8546885, 2.214824, 1, 0, 0.4392157, 1,
1.406233, -0.1440749, 1.361672, 1, 0, 0.4313726, 1,
1.411132, 0.2595956, 2.274153, 1, 0, 0.427451, 1,
1.416488, -1.443995, 1.959617, 1, 0, 0.4196078, 1,
1.429788, -0.1289225, 2.481674, 1, 0, 0.4156863, 1,
1.437644, 1.345342, 0.6739309, 1, 0, 0.4078431, 1,
1.439019, -0.4135255, 1.271754, 1, 0, 0.4039216, 1,
1.449185, 0.4024194, 2.474726, 1, 0, 0.3960784, 1,
1.455092, 0.604915, 2.294379, 1, 0, 0.3882353, 1,
1.455891, 0.02718844, 2.106765, 1, 0, 0.3843137, 1,
1.456306, -0.793442, 1.746632, 1, 0, 0.3764706, 1,
1.463568, 0.7248932, 1.703306, 1, 0, 0.372549, 1,
1.46658, 2.378681, 1.461681, 1, 0, 0.3647059, 1,
1.468632, 1.171049, -2.272958, 1, 0, 0.3607843, 1,
1.468973, -1.197613, 2.641802, 1, 0, 0.3529412, 1,
1.469429, 0.7729599, 0.3152319, 1, 0, 0.3490196, 1,
1.48425, -0.5619119, 1.363073, 1, 0, 0.3411765, 1,
1.485284, 0.6262026, 0.04728532, 1, 0, 0.3372549, 1,
1.490638, -0.7802715, 1.285683, 1, 0, 0.3294118, 1,
1.493332, 1.248318, 2.401765, 1, 0, 0.3254902, 1,
1.506395, -0.5633506, 4.392956, 1, 0, 0.3176471, 1,
1.513066, -2.254772, 1.661922, 1, 0, 0.3137255, 1,
1.518925, 2.357507, 0.1878566, 1, 0, 0.3058824, 1,
1.529368, 0.1183314, 3.636395, 1, 0, 0.2980392, 1,
1.529534, -0.0654751, 2.455446, 1, 0, 0.2941177, 1,
1.546319, -0.31491, 0.1274398, 1, 0, 0.2862745, 1,
1.555054, 0.3655804, 1.459155, 1, 0, 0.282353, 1,
1.613278, 1.605071, 1.354107, 1, 0, 0.2745098, 1,
1.627414, -0.2344192, 2.121296, 1, 0, 0.2705882, 1,
1.634145, 0.4662856, 2.13824, 1, 0, 0.2627451, 1,
1.648813, 0.6154274, -0.1657299, 1, 0, 0.2588235, 1,
1.651968, -0.3051912, 0.852942, 1, 0, 0.2509804, 1,
1.672499, -1.050053, 1.980348, 1, 0, 0.2470588, 1,
1.679694, 0.7656168, 0.1901155, 1, 0, 0.2392157, 1,
1.68967, 0.4713483, 1.651457, 1, 0, 0.2352941, 1,
1.690186, -0.5205494, 3.12643, 1, 0, 0.227451, 1,
1.698525, -0.176494, 0.8978826, 1, 0, 0.2235294, 1,
1.701728, 0.8783624, -0.1400813, 1, 0, 0.2156863, 1,
1.706372, 0.5526141, -0.4899817, 1, 0, 0.2117647, 1,
1.714284, 2.490468, -0.06463034, 1, 0, 0.2039216, 1,
1.750592, -1.296777, 1.986248, 1, 0, 0.1960784, 1,
1.804244, 1.387088, -0.02710118, 1, 0, 0.1921569, 1,
1.809693, 0.4442056, 2.472212, 1, 0, 0.1843137, 1,
1.861325, 1.096856, 0.006146696, 1, 0, 0.1803922, 1,
1.877199, -0.4680939, 2.956863, 1, 0, 0.172549, 1,
1.893094, -1.274599, 2.577562, 1, 0, 0.1686275, 1,
1.897495, 0.8578393, -0.9807385, 1, 0, 0.1607843, 1,
1.901837, 1.562479, -0.009701219, 1, 0, 0.1568628, 1,
1.919925, 0.07068796, 1.536898, 1, 0, 0.1490196, 1,
1.927357, -1.985204, 1.409037, 1, 0, 0.145098, 1,
1.951155, -2.06531, 2.547099, 1, 0, 0.1372549, 1,
1.96554, -1.879562, 2.577907, 1, 0, 0.1333333, 1,
1.980947, 0.136431, 3.281053, 1, 0, 0.1254902, 1,
1.999303, 0.4149477, 1.965659, 1, 0, 0.1215686, 1,
2.048853, 0.4148861, 0.7765023, 1, 0, 0.1137255, 1,
2.091335, -0.7080733, 2.071758, 1, 0, 0.1098039, 1,
2.133252, 0.8417856, 1.249745, 1, 0, 0.1019608, 1,
2.156315, 0.9264596, 2.639551, 1, 0, 0.09411765, 1,
2.15677, -1.408532, 2.004045, 1, 0, 0.09019608, 1,
2.19551, 0.4821131, 0.6768278, 1, 0, 0.08235294, 1,
2.272845, 0.286379, -0.2978709, 1, 0, 0.07843138, 1,
2.292534, -0.2864836, 0.7059371, 1, 0, 0.07058824, 1,
2.324531, 0.1362095, 2.925112, 1, 0, 0.06666667, 1,
2.338377, 0.1033287, 1.490985, 1, 0, 0.05882353, 1,
2.449239, -0.8028516, 1.598831, 1, 0, 0.05490196, 1,
2.46677, 0.3570177, 1.035959, 1, 0, 0.04705882, 1,
2.548912, -0.9286855, 3.278087, 1, 0, 0.04313726, 1,
2.573285, -0.1087349, 1.847342, 1, 0, 0.03529412, 1,
2.624407, -0.7416559, 0.7578267, 1, 0, 0.03137255, 1,
2.729164, -0.07455735, 2.396617, 1, 0, 0.02352941, 1,
2.984248, -0.4588262, 0.5614766, 1, 0, 0.01960784, 1,
2.987614, 0.2185973, 1.564494, 1, 0, 0.01176471, 1,
3.023133, 0.3413889, 1.382309, 1, 0, 0.007843138, 1
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
-0.1523111, -3.759002, -8.424399, 0, -0.5, 0.5, 0.5,
-0.1523111, -3.759002, -8.424399, 1, -0.5, 0.5, 0.5,
-0.1523111, -3.759002, -8.424399, 1, 1.5, 0.5, 0.5,
-0.1523111, -3.759002, -8.424399, 0, 1.5, 0.5, 0.5
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
-4.404231, 0.30829, -8.424399, 0, -0.5, 0.5, 0.5,
-4.404231, 0.30829, -8.424399, 1, -0.5, 0.5, 0.5,
-4.404231, 0.30829, -8.424399, 1, 1.5, 0.5, 0.5,
-4.404231, 0.30829, -8.424399, 0, 1.5, 0.5, 0.5
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
-4.404231, -3.759002, -0.18309, 0, -0.5, 0.5, 0.5,
-4.404231, -3.759002, -0.18309, 1, -0.5, 0.5, 0.5,
-4.404231, -3.759002, -0.18309, 1, 1.5, 0.5, 0.5,
-4.404231, -3.759002, -0.18309, 0, 1.5, 0.5, 0.5
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
-3, -2.820396, -6.522559,
3, -2.820396, -6.522559,
-3, -2.820396, -6.522559,
-3, -2.976831, -6.839532,
-2, -2.820396, -6.522559,
-2, -2.976831, -6.839532,
-1, -2.820396, -6.522559,
-1, -2.976831, -6.839532,
0, -2.820396, -6.522559,
0, -2.976831, -6.839532,
1, -2.820396, -6.522559,
1, -2.976831, -6.839532,
2, -2.820396, -6.522559,
2, -2.976831, -6.839532,
3, -2.820396, -6.522559,
3, -2.976831, -6.839532
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
-3, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
-3, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
-3, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
-3, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
-2, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
-2, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
-2, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
-2, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
-1, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
-1, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
-1, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
-1, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
0, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
0, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
0, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
0, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
1, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
1, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
1, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
1, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
2, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
2, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
2, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
2, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5,
3, -3.289699, -7.473479, 0, -0.5, 0.5, 0.5,
3, -3.289699, -7.473479, 1, -0.5, 0.5, 0.5,
3, -3.289699, -7.473479, 1, 1.5, 0.5, 0.5,
3, -3.289699, -7.473479, 0, 1.5, 0.5, 0.5
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
-3.423018, -2, -6.522559,
-3.423018, 3, -6.522559,
-3.423018, -2, -6.522559,
-3.586554, -2, -6.839532,
-3.423018, -1, -6.522559,
-3.586554, -1, -6.839532,
-3.423018, 0, -6.522559,
-3.586554, 0, -6.839532,
-3.423018, 1, -6.522559,
-3.586554, 1, -6.839532,
-3.423018, 2, -6.522559,
-3.586554, 2, -6.839532,
-3.423018, 3, -6.522559,
-3.586554, 3, -6.839532
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
-3.913625, -2, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, -2, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, -2, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, -2, -7.473479, 0, 1.5, 0.5, 0.5,
-3.913625, -1, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, -1, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, -1, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, -1, -7.473479, 0, 1.5, 0.5, 0.5,
-3.913625, 0, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, 0, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, 0, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, 0, -7.473479, 0, 1.5, 0.5, 0.5,
-3.913625, 1, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, 1, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, 1, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, 1, -7.473479, 0, 1.5, 0.5, 0.5,
-3.913625, 2, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, 2, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, 2, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, 2, -7.473479, 0, 1.5, 0.5, 0.5,
-3.913625, 3, -7.473479, 0, -0.5, 0.5, 0.5,
-3.913625, 3, -7.473479, 1, -0.5, 0.5, 0.5,
-3.913625, 3, -7.473479, 1, 1.5, 0.5, 0.5,
-3.913625, 3, -7.473479, 0, 1.5, 0.5, 0.5
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
-3.423018, -2.820396, -6,
-3.423018, -2.820396, 4,
-3.423018, -2.820396, -6,
-3.586554, -2.976831, -6,
-3.423018, -2.820396, -4,
-3.586554, -2.976831, -4,
-3.423018, -2.820396, -2,
-3.586554, -2.976831, -2,
-3.423018, -2.820396, 0,
-3.586554, -2.976831, 0,
-3.423018, -2.820396, 2,
-3.586554, -2.976831, 2,
-3.423018, -2.820396, 4,
-3.586554, -2.976831, 4
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
"-6",
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
-3.913625, -3.289699, -6, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -6, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -6, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, -6, 0, 1.5, 0.5, 0.5,
-3.913625, -3.289699, -4, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -4, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -4, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, -4, 0, 1.5, 0.5, 0.5,
-3.913625, -3.289699, -2, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -2, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, -2, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, -2, 0, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 0, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 0, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 0, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 0, 0, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 2, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 2, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 2, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 2, 0, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 4, 0, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 4, 1, -0.5, 0.5, 0.5,
-3.913625, -3.289699, 4, 1, 1.5, 0.5, 0.5,
-3.913625, -3.289699, 4, 0, 1.5, 0.5, 0.5
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
-3.423018, -2.820396, -6.522559,
-3.423018, 3.436976, -6.522559,
-3.423018, -2.820396, 6.156379,
-3.423018, 3.436976, 6.156379,
-3.423018, -2.820396, -6.522559,
-3.423018, -2.820396, 6.156379,
-3.423018, 3.436976, -6.522559,
-3.423018, 3.436976, 6.156379,
-3.423018, -2.820396, -6.522559,
3.118396, -2.820396, -6.522559,
-3.423018, -2.820396, 6.156379,
3.118396, -2.820396, 6.156379,
-3.423018, 3.436976, -6.522559,
3.118396, 3.436976, -6.522559,
-3.423018, 3.436976, 6.156379,
3.118396, 3.436976, 6.156379,
3.118396, -2.820396, -6.522559,
3.118396, 3.436976, -6.522559,
3.118396, -2.820396, 6.156379,
3.118396, 3.436976, 6.156379,
3.118396, -2.820396, -6.522559,
3.118396, -2.820396, 6.156379,
3.118396, 3.436976, -6.522559,
3.118396, 3.436976, 6.156379
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
var radius = 8.318798;
var distance = 37.01128;
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
mvMatrix.translate( 0.1523111, -0.30829, 0.18309 );
mvMatrix.scale( 1.375, 1.437416, 0.7094008 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.01128);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-diethoxyphosphinot<-read.table("3-diethoxyphosphinot.xyz", skip=1)
```

```
## Error in read.table("3-diethoxyphosphinot.xyz", skip = 1): duplicate 'row.names' are not allowed
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
-3.327755, 0.7673454, -1.433661, 0, 0, 1, 1, 1,
-3.060103, 0.9461895, -3.158453, 1, 0, 0, 1, 1,
-3.002011, 0.8839028, -0.8446785, 1, 0, 0, 1, 1,
-2.710026, 1.035255, -2.385333, 1, 0, 0, 1, 1,
-2.662611, -1.419026, -0.7401069, 1, 0, 0, 1, 1,
-2.654397, -0.1131822, 0.253961, 1, 0, 0, 1, 1,
-2.64935, -1.286287, -2.455331, 0, 0, 0, 1, 1,
-2.549943, -0.4048392, -0.4614222, 0, 0, 0, 1, 1,
-2.468107, -0.138011, -1.191511, 0, 0, 0, 1, 1,
-2.348, 0.4733772, -1.428156, 0, 0, 0, 1, 1,
-2.337962, -1.007017, -1.891987, 0, 0, 0, 1, 1,
-2.297007, -1.69572, -0.757775, 0, 0, 0, 1, 1,
-2.223968, -0.8401428, -0.3637684, 0, 0, 0, 1, 1,
-2.22241, 0.7118406, -0.7264779, 1, 1, 1, 1, 1,
-2.222335, 0.6900001, -1.558769, 1, 1, 1, 1, 1,
-2.135147, 2.289756, -1.177144, 1, 1, 1, 1, 1,
-2.095834, -0.8463131, -1.652918, 1, 1, 1, 1, 1,
-2.092567, 0.788438, -2.051511, 1, 1, 1, 1, 1,
-2.089577, 1.283561, -0.9390525, 1, 1, 1, 1, 1,
-2.083619, 0.3896625, -0.7023736, 1, 1, 1, 1, 1,
-2.083364, -0.5162102, -2.617746, 1, 1, 1, 1, 1,
-2.082864, 1.967993, -1.359517, 1, 1, 1, 1, 1,
-2.067469, 0.493663, -1.734147, 1, 1, 1, 1, 1,
-2.04022, 2.351634, -0.7163053, 1, 1, 1, 1, 1,
-2.023088, 0.1206687, -0.9099979, 1, 1, 1, 1, 1,
-2.020964, -0.4090073, 1.106297, 1, 1, 1, 1, 1,
-2.010998, 0.4665466, 0.3041803, 1, 1, 1, 1, 1,
-1.987392, -1.667843, -3.071907, 1, 1, 1, 1, 1,
-1.933827, 1.19924, -1.074407, 0, 0, 1, 1, 1,
-1.912067, -0.9669176, -2.079327, 1, 0, 0, 1, 1,
-1.890441, 0.05098593, -1.687695, 1, 0, 0, 1, 1,
-1.884197, -0.7614665, -1.514972, 1, 0, 0, 1, 1,
-1.866211, -1.076612, -2.562203, 1, 0, 0, 1, 1,
-1.842708, -1.345046, -2.660074, 1, 0, 0, 1, 1,
-1.836671, 0.1858088, -0.6940309, 0, 0, 0, 1, 1,
-1.826756, -2.72927, -0.6328274, 0, 0, 0, 1, 1,
-1.814232, 1.361742, -0.3627532, 0, 0, 0, 1, 1,
-1.80411, 0.2139992, -0.1723199, 0, 0, 0, 1, 1,
-1.79214, 1.83278, -3.189977, 0, 0, 0, 1, 1,
-1.707445, -0.6397687, -2.587547, 0, 0, 0, 1, 1,
-1.688552, 1.16903, -0.2722391, 0, 0, 0, 1, 1,
-1.683174, 1.464381, 0.8863444, 1, 1, 1, 1, 1,
-1.671822, 0.8356195, -1.073208, 1, 1, 1, 1, 1,
-1.662913, 0.5344272, -0.3811669, 1, 1, 1, 1, 1,
-1.661297, 0.01096003, -0.8145108, 1, 1, 1, 1, 1,
-1.656256, -1.452299, -2.585383, 1, 1, 1, 1, 1,
-1.656221, -1.623948, -1.434838, 1, 1, 1, 1, 1,
-1.653394, -0.2528539, -2.608069, 1, 1, 1, 1, 1,
-1.635219, -0.274835, -0.3639435, 1, 1, 1, 1, 1,
-1.626567, -2.241992, -1.154969, 1, 1, 1, 1, 1,
-1.62186, -1.438809, -2.580894, 1, 1, 1, 1, 1,
-1.607381, -0.6656811, -1.159011, 1, 1, 1, 1, 1,
-1.601158, -0.2960289, -2.75706, 1, 1, 1, 1, 1,
-1.599217, 0.07341254, -1.102914, 1, 1, 1, 1, 1,
-1.567438, -1.323918, -3.278481, 1, 1, 1, 1, 1,
-1.555165, 1.325202, -1.785825, 1, 1, 1, 1, 1,
-1.549134, 0.3364531, 0.08777778, 0, 0, 1, 1, 1,
-1.548162, -0.7578166, -1.598696, 1, 0, 0, 1, 1,
-1.543287, -0.1789984, -2.12775, 1, 0, 0, 1, 1,
-1.540323, -0.653374, -0.4423032, 1, 0, 0, 1, 1,
-1.526351, 0.2367747, -1.462253, 1, 0, 0, 1, 1,
-1.521102, 0.592333, -0.3950142, 1, 0, 0, 1, 1,
-1.510866, -1.785595, -0.9776323, 0, 0, 0, 1, 1,
-1.51086, 1.738164, -0.2636778, 0, 0, 0, 1, 1,
-1.500125, -0.6488961, -1.150365, 0, 0, 0, 1, 1,
-1.495529, 0.2193252, -0.3436176, 0, 0, 0, 1, 1,
-1.489713, -0.6034383, -1.021852, 0, 0, 0, 1, 1,
-1.480379, 0.02488997, -1.755639, 0, 0, 0, 1, 1,
-1.478371, 0.8967623, -0.5170705, 0, 0, 0, 1, 1,
-1.468688, -0.03432065, -0.3141328, 1, 1, 1, 1, 1,
-1.448408, 2.428018, 0.614228, 1, 1, 1, 1, 1,
-1.447877, -0.3425027, -0.8466584, 1, 1, 1, 1, 1,
-1.417637, 0.9282413, 0.2783939, 1, 1, 1, 1, 1,
-1.397837, 1.237459, -0.369885, 1, 1, 1, 1, 1,
-1.389681, 0.3423085, -0.7663493, 1, 1, 1, 1, 1,
-1.384543, -1.266685, -2.487905, 1, 1, 1, 1, 1,
-1.381629, 2.237283, -2.269625, 1, 1, 1, 1, 1,
-1.374151, 1.045482, -0.7535017, 1, 1, 1, 1, 1,
-1.368066, -0.4043522, -2.754146, 1, 1, 1, 1, 1,
-1.36768, 1.519703, -1.932798, 1, 1, 1, 1, 1,
-1.357955, -1.455086, -2.58289, 1, 1, 1, 1, 1,
-1.351861, -1.030761, -2.919162, 1, 1, 1, 1, 1,
-1.348326, 0.5905091, -0.168662, 1, 1, 1, 1, 1,
-1.335748, 0.9428298, -1.262913, 1, 1, 1, 1, 1,
-1.334197, 0.4503687, -0.8974504, 0, 0, 1, 1, 1,
-1.332397, -1.267029, -3.865301, 1, 0, 0, 1, 1,
-1.332173, 0.13509, -1.52787, 1, 0, 0, 1, 1,
-1.325238, -1.918978, -2.339234, 1, 0, 0, 1, 1,
-1.320302, 0.301441, 0.7500806, 1, 0, 0, 1, 1,
-1.312392, -0.7952713, -1.521648, 1, 0, 0, 1, 1,
-1.30773, 1.47377, 0.05544027, 0, 0, 0, 1, 1,
-1.306657, -1.652583, -2.914135, 0, 0, 0, 1, 1,
-1.294343, 0.1683558, -0.3030505, 0, 0, 0, 1, 1,
-1.290794, 0.410708, -1.531206, 0, 0, 0, 1, 1,
-1.286992, -2.038182, -3.107125, 0, 0, 0, 1, 1,
-1.28051, 1.181749, 0.2868076, 0, 0, 0, 1, 1,
-1.274656, -0.1890329, -1.184726, 0, 0, 0, 1, 1,
-1.259308, 0.9227551, -0.5803794, 1, 1, 1, 1, 1,
-1.259028, 0.9476889, -0.4938087, 1, 1, 1, 1, 1,
-1.255433, 1.139346, -3.164363, 1, 1, 1, 1, 1,
-1.251996, 1.832652, 0.2482111, 1, 1, 1, 1, 1,
-1.251338, -0.4047555, -2.442064, 1, 1, 1, 1, 1,
-1.247365, -0.7629101, -1.828471, 1, 1, 1, 1, 1,
-1.242802, 1.079002, 0.3623495, 1, 1, 1, 1, 1,
-1.241139, 0.3236306, -0.9502845, 1, 1, 1, 1, 1,
-1.233059, -0.8874892, -2.52754, 1, 1, 1, 1, 1,
-1.229768, -0.1248798, -0.5494444, 1, 1, 1, 1, 1,
-1.228536, -1.65094, -1.52973, 1, 1, 1, 1, 1,
-1.223409, 2.963636, -0.81525, 1, 1, 1, 1, 1,
-1.219709, 0.02802694, -2.316961, 1, 1, 1, 1, 1,
-1.213539, 0.4536307, -1.526572, 1, 1, 1, 1, 1,
-1.207366, 0.9061003, -0.2885623, 1, 1, 1, 1, 1,
-1.206208, 0.03150055, -1.313231, 0, 0, 1, 1, 1,
-1.205181, -0.3633348, -1.303556, 1, 0, 0, 1, 1,
-1.203487, -0.9130621, -3.042467, 1, 0, 0, 1, 1,
-1.200252, -0.1685418, -3.055747, 1, 0, 0, 1, 1,
-1.197817, 2.527328, -2.747634, 1, 0, 0, 1, 1,
-1.196797, -1.446733, -2.409895, 1, 0, 0, 1, 1,
-1.191303, 1.073456, -0.3256307, 0, 0, 0, 1, 1,
-1.177457, 0.1262067, 0.5544543, 0, 0, 0, 1, 1,
-1.169576, -1.817432, -2.146283, 0, 0, 0, 1, 1,
-1.156619, -1.8337, -4.939197, 0, 0, 0, 1, 1,
-1.141365, -0.2855872, -1.564644, 0, 0, 0, 1, 1,
-1.138575, 1.246322, -1.056552, 0, 0, 0, 1, 1,
-1.138561, 1.307679, 0.1652916, 0, 0, 0, 1, 1,
-1.137906, -0.315548, -3.509778, 1, 1, 1, 1, 1,
-1.124695, 1.111848, 0.507382, 1, 1, 1, 1, 1,
-1.123968, 0.2141883, -1.871911, 1, 1, 1, 1, 1,
-1.122389, -1.699365, -3.11208, 1, 1, 1, 1, 1,
-1.107377, -0.5732818, -2.646079, 1, 1, 1, 1, 1,
-1.085103, -0.3752188, -1.874626, 1, 1, 1, 1, 1,
-1.085054, -0.5672663, -2.590712, 1, 1, 1, 1, 1,
-1.072239, 0.5986765, -1.757779, 1, 1, 1, 1, 1,
-1.071575, -1.274711, -1.382127, 1, 1, 1, 1, 1,
-1.060211, -0.5381129, -0.6338452, 1, 1, 1, 1, 1,
-1.054665, -0.6943549, -1.743638, 1, 1, 1, 1, 1,
-1.043024, -0.3268945, -2.736863, 1, 1, 1, 1, 1,
-1.042008, -0.02645801, -2.680844, 1, 1, 1, 1, 1,
-1.038399, -0.6439033, -3.343712, 1, 1, 1, 1, 1,
-1.033662, 1.48456, 0.2892208, 1, 1, 1, 1, 1,
-1.027697, -1.563434, -3.341482, 0, 0, 1, 1, 1,
-1.021573, -1.283454, -2.666955, 1, 0, 0, 1, 1,
-1.021267, 0.9819856, -0.4246211, 1, 0, 0, 1, 1,
-1.018859, 0.6345078, -1.453473, 1, 0, 0, 1, 1,
-1.009389, -0.7135609, -1.893192, 1, 0, 0, 1, 1,
-1.008795, -0.01670305, -1.102816, 1, 0, 0, 1, 1,
-1.007961, 1.019887, -0.116648, 0, 0, 0, 1, 1,
-0.9987548, 0.6538025, -1.71627, 0, 0, 0, 1, 1,
-0.9949707, 0.7735826, 0.3284087, 0, 0, 0, 1, 1,
-0.9918413, -0.5155621, -2.707726, 0, 0, 0, 1, 1,
-0.9727582, -1.298007, -3.140397, 0, 0, 0, 1, 1,
-0.9718135, -0.4888565, -2.39323, 0, 0, 0, 1, 1,
-0.9663935, -0.2276157, -0.9101006, 0, 0, 0, 1, 1,
-0.9625416, 0.1059734, -3.109818, 1, 1, 1, 1, 1,
-0.9571602, 1.560729, 0.2602276, 1, 1, 1, 1, 1,
-0.9554508, 1.271674, -0.6477571, 1, 1, 1, 1, 1,
-0.954799, 0.3693751, -0.6613634, 1, 1, 1, 1, 1,
-0.9544353, -0.09604903, -2.839051, 1, 1, 1, 1, 1,
-0.9532687, 1.282831, 0.6859428, 1, 1, 1, 1, 1,
-0.9510201, -1.235022, -1.676666, 1, 1, 1, 1, 1,
-0.9477953, 0.3782966, -0.2676619, 1, 1, 1, 1, 1,
-0.9465584, 1.550163, -0.9801314, 1, 1, 1, 1, 1,
-0.9437822, 0.4609195, -2.139429, 1, 1, 1, 1, 1,
-0.9303606, 0.845454, -0.248051, 1, 1, 1, 1, 1,
-0.9253753, -0.2827556, -1.144637, 1, 1, 1, 1, 1,
-0.9215145, 0.811348, 0.3086019, 1, 1, 1, 1, 1,
-0.9208912, 0.2638739, -4.539387, 1, 1, 1, 1, 1,
-0.9198127, -1.315247, -0.8822903, 1, 1, 1, 1, 1,
-0.916199, 1.610164, -1.1236, 0, 0, 1, 1, 1,
-0.9084701, 0.7463601, 0.1039796, 1, 0, 0, 1, 1,
-0.9055439, -0.6353105, -3.209874, 1, 0, 0, 1, 1,
-0.9020287, 0.6418083, -0.3924915, 1, 0, 0, 1, 1,
-0.9016484, 2.102986, -2.222162, 1, 0, 0, 1, 1,
-0.8938798, -0.1874357, -1.154833, 1, 0, 0, 1, 1,
-0.8921171, -0.545554, -3.906563, 0, 0, 0, 1, 1,
-0.8912604, 0.4773368, 0.04800078, 0, 0, 0, 1, 1,
-0.886053, 0.842306, -0.6066206, 0, 0, 0, 1, 1,
-0.8836777, 0.09247128, -0.6716204, 0, 0, 0, 1, 1,
-0.8830914, -1.472274, -2.28479, 0, 0, 0, 1, 1,
-0.8820356, 0.5367339, -1.295734, 0, 0, 0, 1, 1,
-0.8818918, -0.2732506, -0.6764463, 0, 0, 0, 1, 1,
-0.8797212, -0.4577212, 0.2254193, 1, 1, 1, 1, 1,
-0.8765612, -0.05955689, -2.251503, 1, 1, 1, 1, 1,
-0.8721246, -1.287508, -3.191877, 1, 1, 1, 1, 1,
-0.8594634, -1.225261, -1.213066, 1, 1, 1, 1, 1,
-0.8576099, 0.6846859, -1.917495, 1, 1, 1, 1, 1,
-0.8542677, -0.1190657, -3.337182, 1, 1, 1, 1, 1,
-0.8504414, 2.366334, -0.1464715, 1, 1, 1, 1, 1,
-0.8449383, 0.5861784, -1.743443, 1, 1, 1, 1, 1,
-0.8385643, -1.15047, -3.46861, 1, 1, 1, 1, 1,
-0.8267336, -0.476869, -1.223828, 1, 1, 1, 1, 1,
-0.8264651, 0.4540012, -1.740588, 1, 1, 1, 1, 1,
-0.8242242, 1.650473, -0.4657829, 1, 1, 1, 1, 1,
-0.8158429, -1.818052, -0.7308865, 1, 1, 1, 1, 1,
-0.8135396, 0.4497535, -1.790421, 1, 1, 1, 1, 1,
-0.8127899, -1.562652, -2.969397, 1, 1, 1, 1, 1,
-0.8088469, -0.7513549, -1.054731, 0, 0, 1, 1, 1,
-0.8054127, 2.044506, -0.8889318, 1, 0, 0, 1, 1,
-0.8024536, 1.127143, -0.9412746, 1, 0, 0, 1, 1,
-0.7995821, 1.21154, 1.018348, 1, 0, 0, 1, 1,
-0.7964864, 0.9856331, -0.5630885, 1, 0, 0, 1, 1,
-0.7887503, -0.195986, -0.7162565, 1, 0, 0, 1, 1,
-0.7827777, 0.2723327, -2.338833, 0, 0, 0, 1, 1,
-0.7787046, -0.715395, -1.072518, 0, 0, 0, 1, 1,
-0.7749772, -1.128482, -3.856047, 0, 0, 0, 1, 1,
-0.7737135, -0.6219596, -2.43294, 0, 0, 0, 1, 1,
-0.770143, 0.01528386, -1.941782, 0, 0, 0, 1, 1,
-0.7622692, 0.04341291, -3.097518, 0, 0, 0, 1, 1,
-0.7600455, 1.771504, -0.8243114, 0, 0, 0, 1, 1,
-0.7599972, -0.2826738, -2.123932, 1, 1, 1, 1, 1,
-0.7576621, -1.675055, -1.583555, 1, 1, 1, 1, 1,
-0.755599, 0.8197746, -0.4499817, 1, 1, 1, 1, 1,
-0.752206, 0.06545589, -3.151014, 1, 1, 1, 1, 1,
-0.7431628, -0.4494577, -3.140707, 1, 1, 1, 1, 1,
-0.7403995, 0.7209787, -2.335675, 1, 1, 1, 1, 1,
-0.7383552, 0.6905848, -2.495007, 1, 1, 1, 1, 1,
-0.7379695, 0.2668839, -1.277116, 1, 1, 1, 1, 1,
-0.7297884, -0.6822525, -3.041354, 1, 1, 1, 1, 1,
-0.7294844, -0.8046709, -4.645023, 1, 1, 1, 1, 1,
-0.7274852, -0.0377963, -2.942342, 1, 1, 1, 1, 1,
-0.7215329, 1.05102, 0.6226778, 1, 1, 1, 1, 1,
-0.7194917, -0.362127, -3.1944, 1, 1, 1, 1, 1,
-0.7183914, -0.895101, -2.500159, 1, 1, 1, 1, 1,
-0.7102031, 0.261021, -2.228, 1, 1, 1, 1, 1,
-0.7076893, 1.071126, 0.1838509, 0, 0, 1, 1, 1,
-0.7068757, 0.4916545, -0.7525097, 1, 0, 0, 1, 1,
-0.7048017, 0.4024269, -0.06594995, 1, 0, 0, 1, 1,
-0.7042248, -1.483119, -3.263438, 1, 0, 0, 1, 1,
-0.7013425, -0.2802612, -3.418535, 1, 0, 0, 1, 1,
-0.6995513, -0.8397974, -3.238835, 1, 0, 0, 1, 1,
-0.6953727, -0.9104031, -2.293902, 0, 0, 0, 1, 1,
-0.6946627, -0.554478, -4.589411, 0, 0, 0, 1, 1,
-0.6892412, -0.7785935, -2.671423, 0, 0, 0, 1, 1,
-0.6884919, 1.197719, -0.5787399, 0, 0, 0, 1, 1,
-0.6883278, 0.2777546, -0.996032, 0, 0, 0, 1, 1,
-0.684829, -0.7564986, -3.325312, 0, 0, 0, 1, 1,
-0.6836197, 2.223351, 0.5846424, 0, 0, 0, 1, 1,
-0.6824206, -1.341999, -3.223161, 1, 1, 1, 1, 1,
-0.6809878, 2.228905, -1.228135, 1, 1, 1, 1, 1,
-0.6798483, -0.6835409, -2.395701, 1, 1, 1, 1, 1,
-0.6794032, 1.998129, 0.6473901, 1, 1, 1, 1, 1,
-0.6779552, -1.390981, -4.028305, 1, 1, 1, 1, 1,
-0.6756557, -1.316904, -4.253048, 1, 1, 1, 1, 1,
-0.6749014, -0.2256946, -1.396161, 1, 1, 1, 1, 1,
-0.6741015, -0.5703574, -3.222715, 1, 1, 1, 1, 1,
-0.6678387, 1.658127, -0.7459761, 1, 1, 1, 1, 1,
-0.6653121, -0.1938165, -0.5736092, 1, 1, 1, 1, 1,
-0.6643769, -1.974119, -3.328258, 1, 1, 1, 1, 1,
-0.6527081, -0.07722831, -2.541121, 1, 1, 1, 1, 1,
-0.6521508, 1.714344, -0.2529404, 1, 1, 1, 1, 1,
-0.6491889, -0.8175519, -3.963804, 1, 1, 1, 1, 1,
-0.6441602, 0.456858, -0.4778006, 1, 1, 1, 1, 1,
-0.6405616, 0.3417685, -1.286748, 0, 0, 1, 1, 1,
-0.6403208, 1.482727, -2.397684, 1, 0, 0, 1, 1,
-0.6354504, 0.8170106, -0.9120754, 1, 0, 0, 1, 1,
-0.6297019, -2.032102, -3.480383, 1, 0, 0, 1, 1,
-0.6285298, -0.7865208, -0.650471, 1, 0, 0, 1, 1,
-0.6262421, 0.7366016, 0.7238772, 1, 0, 0, 1, 1,
-0.6259788, 1.298939, -0.4396418, 0, 0, 0, 1, 1,
-0.6190364, -0.2671588, -2.903163, 0, 0, 0, 1, 1,
-0.618331, -1.489298, -0.9746077, 0, 0, 0, 1, 1,
-0.6153773, 1.163148, -0.08939655, 0, 0, 0, 1, 1,
-0.6120403, 0.5352488, -1.001303, 0, 0, 0, 1, 1,
-0.6090305, -0.3596144, -0.9106385, 0, 0, 0, 1, 1,
-0.6024181, -0.6238571, -3.328519, 0, 0, 0, 1, 1,
-0.5999106, -0.5046793, -1.405489, 1, 1, 1, 1, 1,
-0.5986029, -1.786617, -2.368385, 1, 1, 1, 1, 1,
-0.593926, -0.002142125, -1.20982, 1, 1, 1, 1, 1,
-0.5908875, 0.4138245, -0.9530531, 1, 1, 1, 1, 1,
-0.589048, -0.2536705, -0.9927156, 1, 1, 1, 1, 1,
-0.587577, -0.7335164, -2.956486, 1, 1, 1, 1, 1,
-0.5873919, -0.8274984, -1.666901, 1, 1, 1, 1, 1,
-0.5790702, -0.8754362, -3.658993, 1, 1, 1, 1, 1,
-0.5785297, 0.4424807, -0.355261, 1, 1, 1, 1, 1,
-0.5782901, -0.9244232, -1.018779, 1, 1, 1, 1, 1,
-0.5781956, -1.110644, -2.211142, 1, 1, 1, 1, 1,
-0.5774786, -0.5509812, -2.763053, 1, 1, 1, 1, 1,
-0.5744529, -0.2531245, -2.267853, 1, 1, 1, 1, 1,
-0.5743799, 0.9889593, 0.7861717, 1, 1, 1, 1, 1,
-0.5713759, -0.7841749, -1.983934, 1, 1, 1, 1, 1,
-0.5625173, 2.07166, -0.3410527, 0, 0, 1, 1, 1,
-0.5625064, -0.3960694, -2.712832, 1, 0, 0, 1, 1,
-0.5618364, -1.244038, -2.110546, 1, 0, 0, 1, 1,
-0.5611635, -0.2380243, -1.094776, 1, 0, 0, 1, 1,
-0.5560195, 0.9284236, -1.820443, 1, 0, 0, 1, 1,
-0.5459895, -0.4536177, -3.318303, 1, 0, 0, 1, 1,
-0.5457624, 0.2710717, -0.2175194, 0, 0, 0, 1, 1,
-0.545445, -0.6176071, -1.207591, 0, 0, 0, 1, 1,
-0.5425756, 0.4325579, -0.334277, 0, 0, 0, 1, 1,
-0.5392067, 0.8861613, 1.194008, 0, 0, 0, 1, 1,
-0.5362906, 0.870667, -0.206337, 0, 0, 0, 1, 1,
-0.533705, 0.4232535, -0.6672298, 0, 0, 0, 1, 1,
-0.5336775, 1.285221, -1.66754, 0, 0, 0, 1, 1,
-0.5314701, 1.580558, -1.179569, 1, 1, 1, 1, 1,
-0.5296207, 0.1733067, -1.283198, 1, 1, 1, 1, 1,
-0.5273581, -1.144224, -5.066283, 1, 1, 1, 1, 1,
-0.5264704, 0.5179291, -1.238195, 1, 1, 1, 1, 1,
-0.5260063, -0.1397095, -3.028048, 1, 1, 1, 1, 1,
-0.5197489, -0.9706773, -4.266253, 1, 1, 1, 1, 1,
-0.5191047, 1.869956, -0.9486271, 1, 1, 1, 1, 1,
-0.5075468, -1.125998, -2.510571, 1, 1, 1, 1, 1,
-0.5061206, 0.9403322, 0.1936297, 1, 1, 1, 1, 1,
-0.5060558, -0.2452284, -2.623518, 1, 1, 1, 1, 1,
-0.5037817, 1.210281, -0.8480304, 1, 1, 1, 1, 1,
-0.5009249, 1.050857, -0.8716901, 1, 1, 1, 1, 1,
-0.498288, -1.663882, -2.327893, 1, 1, 1, 1, 1,
-0.4937896, 0.6437265, -0.3771443, 1, 1, 1, 1, 1,
-0.489735, 1.21518, -0.1712827, 1, 1, 1, 1, 1,
-0.4828096, 1.02773, -1.508195, 0, 0, 1, 1, 1,
-0.4730109, -0.3084406, -2.141987, 1, 0, 0, 1, 1,
-0.471508, 1.013839, 0.5367945, 1, 0, 0, 1, 1,
-0.4707211, -0.7349929, -3.567541, 1, 0, 0, 1, 1,
-0.4609312, -0.2129073, -2.318075, 1, 0, 0, 1, 1,
-0.4608471, 1.028768, -1.140071, 1, 0, 0, 1, 1,
-0.4577504, -0.7987395, -3.985024, 0, 0, 0, 1, 1,
-0.4565074, -0.6843138, -2.64261, 0, 0, 0, 1, 1,
-0.4523892, -0.6654286, -3.075683, 0, 0, 0, 1, 1,
-0.4516377, -0.6296851, -2.465069, 0, 0, 0, 1, 1,
-0.4510749, 1.633064, -1.576307, 0, 0, 0, 1, 1,
-0.4486171, -0.05443415, -2.177927, 0, 0, 0, 1, 1,
-0.4445512, 0.460882, 0.3746104, 0, 0, 0, 1, 1,
-0.4427555, 0.0502427, -0.896968, 1, 1, 1, 1, 1,
-0.4402743, -0.6044176, -2.640442, 1, 1, 1, 1, 1,
-0.4393082, -0.2606547, -1.996743, 1, 1, 1, 1, 1,
-0.4347471, 1.686863, -0.03270027, 1, 1, 1, 1, 1,
-0.43471, -1.195735, -2.934086, 1, 1, 1, 1, 1,
-0.4341356, -1.624679, -1.847455, 1, 1, 1, 1, 1,
-0.4340947, -0.07448239, -2.319672, 1, 1, 1, 1, 1,
-0.4295193, 2.437585, 0.8455686, 1, 1, 1, 1, 1,
-0.4288387, -0.2798037, -0.9516953, 1, 1, 1, 1, 1,
-0.423029, -1.374508, -1.496193, 1, 1, 1, 1, 1,
-0.416868, 0.5865282, -0.9861889, 1, 1, 1, 1, 1,
-0.4145153, -0.5291977, -3.797868, 1, 1, 1, 1, 1,
-0.4102448, 0.04590283, -3.727889, 1, 1, 1, 1, 1,
-0.4033837, -0.6116034, -2.798076, 1, 1, 1, 1, 1,
-0.4033104, 0.3898953, -0.3817629, 1, 1, 1, 1, 1,
-0.4028212, 0.1498322, 0.622327, 0, 0, 1, 1, 1,
-0.3992386, -0.516793, -3.489683, 1, 0, 0, 1, 1,
-0.395975, -1.955739, -4.300331, 1, 0, 0, 1, 1,
-0.3955228, -0.3518575, -2.852606, 1, 0, 0, 1, 1,
-0.3930582, -0.6858643, -2.705153, 1, 0, 0, 1, 1,
-0.3919638, -0.7666936, -1.819041, 1, 0, 0, 1, 1,
-0.3901162, -0.06687471, -2.065567, 0, 0, 0, 1, 1,
-0.3881995, -0.1770764, -3.250473, 0, 0, 0, 1, 1,
-0.3831199, -2.555356, -3.888869, 0, 0, 0, 1, 1,
-0.3825279, 0.4104762, -2.621314, 0, 0, 0, 1, 1,
-0.3823445, 0.631349, 0.5571266, 0, 0, 0, 1, 1,
-0.3819286, 0.4529617, -1.440551, 0, 0, 0, 1, 1,
-0.3752121, 0.6707978, 1.921248, 0, 0, 0, 1, 1,
-0.3729392, 0.5884304, -1.594062, 1, 1, 1, 1, 1,
-0.3691463, 1.01128, -1.890318, 1, 1, 1, 1, 1,
-0.3634239, -2.595851, -2.618215, 1, 1, 1, 1, 1,
-0.361686, -0.9079868, -4.13758, 1, 1, 1, 1, 1,
-0.3589498, 0.5067566, 0.3578683, 1, 1, 1, 1, 1,
-0.3556136, -0.7594934, -3.404599, 1, 1, 1, 1, 1,
-0.3544351, -0.7407645, -3.657467, 1, 1, 1, 1, 1,
-0.3535437, 0.1964903, -2.258126, 1, 1, 1, 1, 1,
-0.3519144, -0.6029642, -1.549705, 1, 1, 1, 1, 1,
-0.3491261, 1.430776, -1.079798, 1, 1, 1, 1, 1,
-0.3480527, -1.382811, -2.641468, 1, 1, 1, 1, 1,
-0.3464469, -1.450262, -2.403784, 1, 1, 1, 1, 1,
-0.3454089, 0.7403904, -0.8551893, 1, 1, 1, 1, 1,
-0.3404849, -0.9415026, -1.919699, 1, 1, 1, 1, 1,
-0.3371902, -0.8152651, -1.562391, 1, 1, 1, 1, 1,
-0.3361484, -1.077929, -3.449056, 0, 0, 1, 1, 1,
-0.3318121, -0.9446892, -2.413112, 1, 0, 0, 1, 1,
-0.3291528, -0.9192756, -4.383129, 1, 0, 0, 1, 1,
-0.323154, -0.6827146, -4.125499, 1, 0, 0, 1, 1,
-0.3223985, 0.9323323, -1.036524, 1, 0, 0, 1, 1,
-0.320895, 1.575514, 0.7115186, 1, 0, 0, 1, 1,
-0.3193588, 0.4758408, -1.767582, 0, 0, 0, 1, 1,
-0.3188448, 0.8582712, 1.098974, 0, 0, 0, 1, 1,
-0.3080212, 0.2521542, -1.181326, 0, 0, 0, 1, 1,
-0.3074825, 1.264732, 0.1678741, 0, 0, 0, 1, 1,
-0.3058403, -0.0220171, -2.058673, 0, 0, 0, 1, 1,
-0.3051763, -1.109564, -2.223626, 0, 0, 0, 1, 1,
-0.3027784, 0.2172645, -2.708163, 0, 0, 0, 1, 1,
-0.302673, -1.913154, -3.909595, 1, 1, 1, 1, 1,
-0.3017985, -0.3984155, -0.6447084, 1, 1, 1, 1, 1,
-0.2983184, 1.008352, -1.390396, 1, 1, 1, 1, 1,
-0.2954412, 1.033851, -0.7420059, 1, 1, 1, 1, 1,
-0.2932982, -0.1684187, -1.669838, 1, 1, 1, 1, 1,
-0.2926928, 0.5031493, 0.4360131, 1, 1, 1, 1, 1,
-0.2923937, 0.7269326, -1.767482, 1, 1, 1, 1, 1,
-0.291145, -1.503467, -2.251905, 1, 1, 1, 1, 1,
-0.2895631, -0.4770578, -3.708853, 1, 1, 1, 1, 1,
-0.2891642, 0.7813599, 0.4852115, 1, 1, 1, 1, 1,
-0.281566, -0.1498516, -1.865761, 1, 1, 1, 1, 1,
-0.278276, -0.6974036, -4.090616, 1, 1, 1, 1, 1,
-0.2745475, 1.386694, -0.8063284, 1, 1, 1, 1, 1,
-0.2743335, -2.478059, -2.828962, 1, 1, 1, 1, 1,
-0.2734234, 2.527641, -0.2166502, 1, 1, 1, 1, 1,
-0.2725855, 1.551654, 0.8100601, 0, 0, 1, 1, 1,
-0.2705464, -0.4607129, -0.9048497, 1, 0, 0, 1, 1,
-0.2693788, -0.9193664, -2.868357, 1, 0, 0, 1, 1,
-0.2642463, -0.01416591, -1.290728, 1, 0, 0, 1, 1,
-0.260299, -0.3033162, -2.454453, 1, 0, 0, 1, 1,
-0.2599992, -1.172888, -3.05076, 1, 0, 0, 1, 1,
-0.2587894, -1.102862, -3.668456, 0, 0, 0, 1, 1,
-0.2587499, -1.970199, -2.242743, 0, 0, 0, 1, 1,
-0.2585513, 0.7689994, 0.130134, 0, 0, 0, 1, 1,
-0.2567988, 0.1168562, -2.470777, 0, 0, 0, 1, 1,
-0.2545085, 0.655627, -0.7847133, 0, 0, 0, 1, 1,
-0.2472478, -0.2558569, -0.4429943, 0, 0, 0, 1, 1,
-0.2460249, -0.5462078, -2.343425, 0, 0, 0, 1, 1,
-0.2423579, -0.8678523, -3.457646, 1, 1, 1, 1, 1,
-0.2385638, -0.8639478, -3.027942, 1, 1, 1, 1, 1,
-0.2294957, -0.1545389, -1.927499, 1, 1, 1, 1, 1,
-0.2268328, 0.6917424, -0.4906185, 1, 1, 1, 1, 1,
-0.2235404, 0.4449654, 0.6168491, 1, 1, 1, 1, 1,
-0.2228802, 0.07270153, -0.6166983, 1, 1, 1, 1, 1,
-0.2208266, -0.6157957, -0.8861192, 1, 1, 1, 1, 1,
-0.2199311, -0.4607557, -1.993633, 1, 1, 1, 1, 1,
-0.2159259, -0.1457751, -0.9239556, 1, 1, 1, 1, 1,
-0.212087, -1.399127, -2.446931, 1, 1, 1, 1, 1,
-0.2071997, 1.459862, -1.340573, 1, 1, 1, 1, 1,
-0.2037892, 0.636861, -0.9381062, 1, 1, 1, 1, 1,
-0.2018889, 2.303259, 0.3357347, 1, 1, 1, 1, 1,
-0.1987454, -1.157838, -6.337914, 1, 1, 1, 1, 1,
-0.1927502, -0.2964071, -1.386172, 1, 1, 1, 1, 1,
-0.1916561, 1.320289, 0.5792442, 0, 0, 1, 1, 1,
-0.1869054, 0.2084899, -1.089041, 1, 0, 0, 1, 1,
-0.1786447, 0.4356942, 0.1182255, 1, 0, 0, 1, 1,
-0.1774563, 0.5101717, -0.3562396, 1, 0, 0, 1, 1,
-0.176178, 0.4672613, -1.535311, 1, 0, 0, 1, 1,
-0.1759536, -0.3592536, -3.467326, 1, 0, 0, 1, 1,
-0.1745777, -1.671824, -4.006037, 0, 0, 0, 1, 1,
-0.1725113, -1.857567, -3.318397, 0, 0, 0, 1, 1,
-0.1719845, -0.03974392, -2.432202, 0, 0, 0, 1, 1,
-0.1704164, 0.1736638, -2.302267, 0, 0, 0, 1, 1,
-0.1698739, 0.1028415, -3.427946, 0, 0, 0, 1, 1,
-0.168856, -0.2085898, -2.804907, 0, 0, 0, 1, 1,
-0.166188, -1.286725, -3.170422, 0, 0, 0, 1, 1,
-0.1648727, 0.1692633, 0.7244264, 1, 1, 1, 1, 1,
-0.1607595, 2.311906, 0.4087004, 1, 1, 1, 1, 1,
-0.1591128, -1.217729, -2.811274, 1, 1, 1, 1, 1,
-0.1587613, -0.1703465, -2.516265, 1, 1, 1, 1, 1,
-0.1566848, -0.238984, -2.601678, 1, 1, 1, 1, 1,
-0.1522099, 0.9827384, -0.7262275, 1, 1, 1, 1, 1,
-0.1482807, 0.00290893, -1.998901, 1, 1, 1, 1, 1,
-0.1468743, -1.253731, -4.924927, 1, 1, 1, 1, 1,
-0.1453007, 1.850573, 0.09908481, 1, 1, 1, 1, 1,
-0.1430786, -1.223031, -3.992279, 1, 1, 1, 1, 1,
-0.1406875, 3.34585, 0.7765871, 1, 1, 1, 1, 1,
-0.1371574, 0.09030993, -0.85721, 1, 1, 1, 1, 1,
-0.1352751, -1.727081, -1.559744, 1, 1, 1, 1, 1,
-0.1349781, 1.37343, 1.234923, 1, 1, 1, 1, 1,
-0.1339429, -0.9069074, -2.605489, 1, 1, 1, 1, 1,
-0.1295712, -0.8084443, -3.656089, 0, 0, 1, 1, 1,
-0.1276733, -0.2232602, -2.659057, 1, 0, 0, 1, 1,
-0.1267729, 0.06102509, 0.141174, 1, 0, 0, 1, 1,
-0.1265582, 2.002743, 0.1577303, 1, 0, 0, 1, 1,
-0.1251641, 0.3387795, -0.03057873, 1, 0, 0, 1, 1,
-0.1138875, -0.9774498, -2.858351, 1, 0, 0, 1, 1,
-0.112264, -1.545049, -2.659023, 0, 0, 0, 1, 1,
-0.1119507, 0.7752874, 1.491291, 0, 0, 0, 1, 1,
-0.1109889, 0.007477164, -3.149171, 0, 0, 0, 1, 1,
-0.1107619, 0.1720053, 0.1603945, 0, 0, 0, 1, 1,
-0.1092888, 1.768292, 0.9992857, 0, 0, 0, 1, 1,
-0.1051139, -0.6712899, -3.185449, 0, 0, 0, 1, 1,
-0.1047196, 0.6616361, -0.2435496, 0, 0, 0, 1, 1,
-0.09832693, -0.9339576, -3.303392, 1, 1, 1, 1, 1,
-0.09600362, -1.58906, -3.025936, 1, 1, 1, 1, 1,
-0.09374163, 1.664106, 0.3261446, 1, 1, 1, 1, 1,
-0.09329773, 1.218782, -0.6606696, 1, 1, 1, 1, 1,
-0.08829582, -0.4761006, -2.733072, 1, 1, 1, 1, 1,
-0.08680096, -0.7131459, -4.184582, 1, 1, 1, 1, 1,
-0.08224443, 2.018433, 0.9302505, 1, 1, 1, 1, 1,
-0.08153128, 1.634735, 0.5125733, 1, 1, 1, 1, 1,
-0.07945765, -1.395352, -2.728012, 1, 1, 1, 1, 1,
-0.07571463, -0.4523644, -5.396251, 1, 1, 1, 1, 1,
-0.07196898, 0.6721335, 0.9643096, 1, 1, 1, 1, 1,
-0.06980143, 0.6631624, 1.175489, 1, 1, 1, 1, 1,
-0.06547038, -1.374361, -3.412684, 1, 1, 1, 1, 1,
-0.06499103, -0.1414645, -2.476531, 1, 1, 1, 1, 1,
-0.06463692, -1.735201, -2.223159, 1, 1, 1, 1, 1,
-0.06413316, 0.8994277, -0.7143203, 0, 0, 1, 1, 1,
-0.05694193, 0.2284518, -0.5424544, 1, 0, 0, 1, 1,
-0.05645003, -1.438356, -3.978678, 1, 0, 0, 1, 1,
-0.05613665, 0.3612696, -1.235125, 1, 0, 0, 1, 1,
-0.05537857, -1.118444, -2.49592, 1, 0, 0, 1, 1,
-0.05462083, -1.591261, -4.462274, 1, 0, 0, 1, 1,
-0.05068172, 0.9193029, 0.6995266, 0, 0, 0, 1, 1,
-0.04981909, -0.2298514, -2.436114, 0, 0, 0, 1, 1,
-0.04477536, 0.3148917, -0.1307735, 0, 0, 0, 1, 1,
-0.03992029, 2.010903, -0.4815231, 0, 0, 0, 1, 1,
-0.03723298, -0.9265203, -2.820969, 0, 0, 0, 1, 1,
-0.03674582, 0.4848261, -0.1819648, 0, 0, 0, 1, 1,
-0.03507647, 0.166405, 1.462561, 0, 0, 0, 1, 1,
-0.03492611, -0.768821, -3.554907, 1, 1, 1, 1, 1,
-0.03456942, 0.6942863, -1.206248, 1, 1, 1, 1, 1,
-0.03255631, 0.1164654, -0.01627915, 1, 1, 1, 1, 1,
-0.02839148, 0.8360668, -1.16026, 1, 1, 1, 1, 1,
-0.02445598, -0.1707848, -4.255583, 1, 1, 1, 1, 1,
-0.02028952, 0.4507864, 0.3939489, 1, 1, 1, 1, 1,
-0.01687128, 0.7084023, -0.8700005, 1, 1, 1, 1, 1,
-0.01458686, -0.4226172, -3.871531, 1, 1, 1, 1, 1,
-0.01087804, 0.1031839, 0.01099396, 1, 1, 1, 1, 1,
-0.005692601, 0.04258425, -2.14005, 1, 1, 1, 1, 1,
-4.139299e-05, 0.2927991, 0.5744287, 1, 1, 1, 1, 1,
0.002976736, 0.03010764, -1.935575, 1, 1, 1, 1, 1,
0.004757348, 0.3773502, 1.393215, 1, 1, 1, 1, 1,
0.005098914, -1.600754, 3.446235, 1, 1, 1, 1, 1,
0.00556044, -0.1962095, 3.048293, 1, 1, 1, 1, 1,
0.01048668, -1.793228, 2.32835, 0, 0, 1, 1, 1,
0.01276751, 0.09074312, -0.7683034, 1, 0, 0, 1, 1,
0.01591069, -0.7003019, 3.850049, 1, 0, 0, 1, 1,
0.01777183, 0.6295085, -0.2011119, 1, 0, 0, 1, 1,
0.02060271, -0.7545089, 0.8355891, 1, 0, 0, 1, 1,
0.02082924, 1.244716, -0.3428187, 1, 0, 0, 1, 1,
0.02096796, -1.467608, 1.662617, 0, 0, 0, 1, 1,
0.02292322, 0.05712225, 0.2929554, 0, 0, 0, 1, 1,
0.02315482, -0.7379288, 3.028746, 0, 0, 0, 1, 1,
0.0235236, 1.156813, -0.4870952, 0, 0, 0, 1, 1,
0.02653266, 2.321373, -0.6158679, 0, 0, 0, 1, 1,
0.03067709, -0.2798533, 2.982387, 0, 0, 0, 1, 1,
0.03307255, 0.4470541, 0.3332186, 0, 0, 0, 1, 1,
0.03481631, -0.5796448, 1.313834, 1, 1, 1, 1, 1,
0.03544676, -0.7564341, 2.187726, 1, 1, 1, 1, 1,
0.03701296, 1.31451, -0.4800254, 1, 1, 1, 1, 1,
0.04523313, -0.7213982, 2.314331, 1, 1, 1, 1, 1,
0.05175798, 1.34175, 1.15127, 1, 1, 1, 1, 1,
0.05254598, -0.48251, 3.618827, 1, 1, 1, 1, 1,
0.05341348, -0.9669527, 4.517794, 1, 1, 1, 1, 1,
0.05372559, -0.8775262, 4.188304, 1, 1, 1, 1, 1,
0.05478002, 1.113906, -0.3225617, 1, 1, 1, 1, 1,
0.05963228, -0.2337738, 2.524834, 1, 1, 1, 1, 1,
0.06439894, -0.2968093, 4.711193, 1, 1, 1, 1, 1,
0.06483518, -1.433598, 2.940629, 1, 1, 1, 1, 1,
0.06919533, -0.7033653, 2.736972, 1, 1, 1, 1, 1,
0.0696153, -0.584344, 5.541921, 1, 1, 1, 1, 1,
0.07117751, 1.813347, -0.3395799, 1, 1, 1, 1, 1,
0.07141545, -0.6256919, 2.498464, 0, 0, 1, 1, 1,
0.07379296, 0.5863252, 0.07692531, 1, 0, 0, 1, 1,
0.0752934, -0.6505056, 1.822135, 1, 0, 0, 1, 1,
0.07815539, -2.344966, 2.565985, 1, 0, 0, 1, 1,
0.08042508, -2.038889, 2.63479, 1, 0, 0, 1, 1,
0.08433643, 0.8707892, 1.19799, 1, 0, 0, 1, 1,
0.08661509, 0.007657777, 1.782726, 0, 0, 0, 1, 1,
0.08857516, 1.581214, -1.068934, 0, 0, 0, 1, 1,
0.09429634, -0.2755982, 4.208485, 0, 0, 0, 1, 1,
0.09731436, -0.4486725, 2.281651, 0, 0, 0, 1, 1,
0.1009237, 1.524864, 1.405624, 0, 0, 0, 1, 1,
0.1037122, -0.8327871, 1.769209, 0, 0, 0, 1, 1,
0.1037413, 0.4536059, 0.387264, 0, 0, 0, 1, 1,
0.1046569, -0.5645478, 5.132276, 1, 1, 1, 1, 1,
0.1052932, 0.8626919, 0.8234258, 1, 1, 1, 1, 1,
0.1061473, -1.063238, 3.568964, 1, 1, 1, 1, 1,
0.1074036, 1.088026, -0.01805509, 1, 1, 1, 1, 1,
0.1088551, 1.225579, -0.4916086, 1, 1, 1, 1, 1,
0.1126362, 0.4541125, 2.493851, 1, 1, 1, 1, 1,
0.1127073, -2.129552, 2.755524, 1, 1, 1, 1, 1,
0.1146279, 0.871247, -2.359949, 1, 1, 1, 1, 1,
0.117586, 0.07619379, 0.3971117, 1, 1, 1, 1, 1,
0.1183704, 0.05829165, 2.553731, 1, 1, 1, 1, 1,
0.1192596, -0.7400336, 3.64912, 1, 1, 1, 1, 1,
0.1201323, -0.576314, 1.880289, 1, 1, 1, 1, 1,
0.1225739, -0.6387163, 0.4490123, 1, 1, 1, 1, 1,
0.1261738, -0.1459756, 2.9523, 1, 1, 1, 1, 1,
0.1274026, 0.258979, 0.9602206, 1, 1, 1, 1, 1,
0.1330273, 1.469021, -1.015415, 0, 0, 1, 1, 1,
0.1370335, 0.3949376, 1.881556, 1, 0, 0, 1, 1,
0.1397518, -0.01985775, 3.111142, 1, 0, 0, 1, 1,
0.1408135, -1.384251, 1.650499, 1, 0, 0, 1, 1,
0.1409874, -0.5273815, 5.051413, 1, 0, 0, 1, 1,
0.1411944, -0.8758131, 2.981482, 1, 0, 0, 1, 1,
0.1422453, 0.6741935, 1.31329, 0, 0, 0, 1, 1,
0.1513009, -1.300458, 3.213826, 0, 0, 0, 1, 1,
0.1545513, -0.4364571, 4.541249, 0, 0, 0, 1, 1,
0.1548129, 1.161229, -0.5766683, 0, 0, 0, 1, 1,
0.1581424, 1.348199, -0.5576947, 0, 0, 0, 1, 1,
0.1636173, -1.060154, 3.949789, 0, 0, 0, 1, 1,
0.1637367, 0.584032, 2.295588, 0, 0, 0, 1, 1,
0.1638544, -0.7995695, 5.971734, 1, 1, 1, 1, 1,
0.167665, 1.466079, 0.4966481, 1, 1, 1, 1, 1,
0.1679896, -1.47491, 4.179857, 1, 1, 1, 1, 1,
0.1690018, -0.07667898, 2.589843, 1, 1, 1, 1, 1,
0.1703468, -0.06333118, 1.711681, 1, 1, 1, 1, 1,
0.1731571, 0.1748731, 1.417601, 1, 1, 1, 1, 1,
0.1780289, 1.020846, -0.9429951, 1, 1, 1, 1, 1,
0.1781297, -0.3701581, 1.719615, 1, 1, 1, 1, 1,
0.1784509, -0.2724263, 2.8969, 1, 1, 1, 1, 1,
0.1818525, 0.4587986, -0.3814369, 1, 1, 1, 1, 1,
0.1888499, -1.068303, 1.99991, 1, 1, 1, 1, 1,
0.1942493, 0.3786077, -0.4744327, 1, 1, 1, 1, 1,
0.1950518, 0.3905339, 1.535336, 1, 1, 1, 1, 1,
0.1975167, -1.469802, 4.017153, 1, 1, 1, 1, 1,
0.1997297, -0.1515916, 1.08069, 1, 1, 1, 1, 1,
0.200179, 1.354681, 1.015176, 0, 0, 1, 1, 1,
0.2011909, 0.4471259, 0.6127309, 1, 0, 0, 1, 1,
0.2053895, -0.2671572, 3.416402, 1, 0, 0, 1, 1,
0.2065768, 0.3908882, -1.532626, 1, 0, 0, 1, 1,
0.2086547, 0.9354655, 0.3374411, 1, 0, 0, 1, 1,
0.2104326, 1.224458, 0.1739659, 1, 0, 0, 1, 1,
0.2129495, 1.83274, -0.007387979, 0, 0, 0, 1, 1,
0.2222617, -0.9540607, 1.905624, 0, 0, 0, 1, 1,
0.2223979, 1.263285, 1.556801, 0, 0, 0, 1, 1,
0.2228266, -0.8180213, 1.605297, 0, 0, 0, 1, 1,
0.2230976, 1.88696, 0.9360951, 0, 0, 0, 1, 1,
0.2241753, -0.2415507, 2.383528, 0, 0, 0, 1, 1,
0.2258153, 0.3092365, 0.6889271, 0, 0, 0, 1, 1,
0.2314131, -0.5648639, 2.546193, 1, 1, 1, 1, 1,
0.2323806, 0.5279173, 0.9286436, 1, 1, 1, 1, 1,
0.233268, 0.5530769, 1.950353, 1, 1, 1, 1, 1,
0.2344697, 0.5579268, -1.239344, 1, 1, 1, 1, 1,
0.2369792, 0.3069382, 0.4876769, 1, 1, 1, 1, 1,
0.2377799, 0.7851089, 0.6042514, 1, 1, 1, 1, 1,
0.2393588, 0.337141, 2.264341, 1, 1, 1, 1, 1,
0.2400608, -0.350111, 3.080057, 1, 1, 1, 1, 1,
0.2405931, 0.9219911, -0.759699, 1, 1, 1, 1, 1,
0.2429067, 0.505135, -0.8417289, 1, 1, 1, 1, 1,
0.2610365, 0.4719729, 0.3970141, 1, 1, 1, 1, 1,
0.2615137, -0.08373247, 1.3254, 1, 1, 1, 1, 1,
0.2629708, -0.9529408, 2.372911, 1, 1, 1, 1, 1,
0.2636298, 1.048331, -0.8615952, 1, 1, 1, 1, 1,
0.2643915, -0.8628287, 2.59794, 1, 1, 1, 1, 1,
0.2660518, 0.1372711, 1.852666, 0, 0, 1, 1, 1,
0.2666554, 1.054603, 2.107433, 1, 0, 0, 1, 1,
0.273749, 0.1166226, 0.787042, 1, 0, 0, 1, 1,
0.276813, 0.3786327, -0.9644296, 1, 0, 0, 1, 1,
0.2862018, -1.160867, 3.057806, 1, 0, 0, 1, 1,
0.2866712, -1.836762, 3.508772, 1, 0, 0, 1, 1,
0.2875401, 1.272059, -0.3100484, 0, 0, 0, 1, 1,
0.2882097, -1.250049, 2.316492, 0, 0, 0, 1, 1,
0.291203, 0.889411, -0.3195193, 0, 0, 0, 1, 1,
0.2925793, -0.1584506, 3.130188, 0, 0, 0, 1, 1,
0.299357, -0.5469797, 3.925085, 0, 0, 0, 1, 1,
0.3017623, -0.9583281, 4.26516, 0, 0, 0, 1, 1,
0.3030139, -0.8602417, 2.301363, 0, 0, 0, 1, 1,
0.3056349, 1.096568, 2.031543, 1, 1, 1, 1, 1,
0.3064865, -0.2662337, 2.491066, 1, 1, 1, 1, 1,
0.307514, 0.05332091, 2.64355, 1, 1, 1, 1, 1,
0.3095405, 0.4435232, 0.09131864, 1, 1, 1, 1, 1,
0.3097507, 0.3824826, 2.323343, 1, 1, 1, 1, 1,
0.3104292, 0.7182997, 0.7248767, 1, 1, 1, 1, 1,
0.3111759, 0.8735631, -0.7988947, 1, 1, 1, 1, 1,
0.3129925, 0.04956575, 1.293583, 1, 1, 1, 1, 1,
0.3200332, 0.3567162, 1.67472, 1, 1, 1, 1, 1,
0.3226396, 1.589396, 0.6036288, 1, 1, 1, 1, 1,
0.3259134, 0.5908276, -1.110404, 1, 1, 1, 1, 1,
0.3274857, 0.8475751, -1.000995, 1, 1, 1, 1, 1,
0.3301678, -0.1274674, 1.722322, 1, 1, 1, 1, 1,
0.3312269, 0.1688157, 3.139874, 1, 1, 1, 1, 1,
0.3320952, 0.3429677, 1.048484, 1, 1, 1, 1, 1,
0.3333917, 1.207708, 1.310123, 0, 0, 1, 1, 1,
0.3338051, 0.4129729, 0.8803018, 1, 0, 0, 1, 1,
0.3353284, 1.242353, 0.1781968, 1, 0, 0, 1, 1,
0.3360794, 0.3894736, 0.1735469, 1, 0, 0, 1, 1,
0.336651, 0.6936192, -1.273095, 1, 0, 0, 1, 1,
0.3370688, 0.4676012, 1.199048, 1, 0, 0, 1, 1,
0.3377593, 0.6288496, 0.5263075, 0, 0, 0, 1, 1,
0.3445112, 1.983698, 0.9410274, 0, 0, 0, 1, 1,
0.3463795, -0.6863106, 2.740224, 0, 0, 0, 1, 1,
0.3485243, -0.2770641, 3.296232, 0, 0, 0, 1, 1,
0.3487806, 0.2179466, 1.847256, 0, 0, 0, 1, 1,
0.350418, -1.462738, 2.395937, 0, 0, 0, 1, 1,
0.3540286, 0.6165668, 1.185113, 0, 0, 0, 1, 1,
0.3551622, -0.1233281, 2.599235, 1, 1, 1, 1, 1,
0.3561609, -0.1101815, 0.5849812, 1, 1, 1, 1, 1,
0.3575441, 0.6928787, -0.1501601, 1, 1, 1, 1, 1,
0.3585289, -0.07902362, 1.507551, 1, 1, 1, 1, 1,
0.358585, -0.2116409, 3.389795, 1, 1, 1, 1, 1,
0.3661649, -0.5324231, 2.174117, 1, 1, 1, 1, 1,
0.3703238, 0.4071931, 1.266308, 1, 1, 1, 1, 1,
0.3755834, 1.284422, -0.3091954, 1, 1, 1, 1, 1,
0.3776892, -0.5872378, 3.049041, 1, 1, 1, 1, 1,
0.3821539, 0.1171153, 1.279793, 1, 1, 1, 1, 1,
0.3840603, -1.476685, 2.892778, 1, 1, 1, 1, 1,
0.3900196, -0.1610583, 1.751627, 1, 1, 1, 1, 1,
0.3967594, -0.5380956, 1.546931, 1, 1, 1, 1, 1,
0.3985318, 1.525885, -0.9198145, 1, 1, 1, 1, 1,
0.4019339, -0.2932708, 0.5166499, 1, 1, 1, 1, 1,
0.4028037, -1.125543, 3.809929, 0, 0, 1, 1, 1,
0.4045903, 1.161227, 0.1993106, 1, 0, 0, 1, 1,
0.4121882, 0.3687399, 2.384964, 1, 0, 0, 1, 1,
0.4122255, 0.07355003, 0.02812887, 1, 0, 0, 1, 1,
0.4144835, 2.815476, 0.08984342, 1, 0, 0, 1, 1,
0.4193956, -0.4280379, 3.472388, 1, 0, 0, 1, 1,
0.4235359, 1.445786, -0.8165482, 0, 0, 0, 1, 1,
0.4254924, -0.8969722, 2.656694, 0, 0, 0, 1, 1,
0.4259562, -2.57095, 2.954732, 0, 0, 0, 1, 1,
0.4280775, -0.4153987, 3.494526, 0, 0, 0, 1, 1,
0.4280838, 1.818349, 0.7290004, 0, 0, 0, 1, 1,
0.4321017, 0.2847603, 1.69118, 0, 0, 0, 1, 1,
0.4341022, 0.3578845, 0.6409458, 0, 0, 0, 1, 1,
0.4346895, 1.184674, -0.8898926, 1, 1, 1, 1, 1,
0.4355901, -1.079815, 3.705491, 1, 1, 1, 1, 1,
0.4405868, -0.5267789, 3.363877, 1, 1, 1, 1, 1,
0.441775, -2.694687, 4.91716, 1, 1, 1, 1, 1,
0.4519649, 0.8614685, 1.22917, 1, 1, 1, 1, 1,
0.4583719, 0.1289065, 1.212642, 1, 1, 1, 1, 1,
0.4607366, -1.175874, 2.260409, 1, 1, 1, 1, 1,
0.4631851, 0.6208898, 0.5983732, 1, 1, 1, 1, 1,
0.4697973, 1.65389, -0.6148745, 1, 1, 1, 1, 1,
0.4753821, 0.3162571, 1.208961, 1, 1, 1, 1, 1,
0.4815358, -0.6916515, 4.065299, 1, 1, 1, 1, 1,
0.4829811, -1.096554, 1.51745, 1, 1, 1, 1, 1,
0.4858764, 1.882545, 1.70011, 1, 1, 1, 1, 1,
0.4871551, -0.2998015, 1.833897, 1, 1, 1, 1, 1,
0.4877129, 0.2041418, 2.520523, 1, 1, 1, 1, 1,
0.4901211, 1.017898, 1.137573, 0, 0, 1, 1, 1,
0.492687, -0.1829656, 2.094165, 1, 0, 0, 1, 1,
0.4958934, -0.1168555, 0.8546543, 1, 0, 0, 1, 1,
0.4980052, -0.2066841, 1.91461, 1, 0, 0, 1, 1,
0.502183, -0.08392168, 1.921129, 1, 0, 0, 1, 1,
0.5040119, 0.5027622, 0.00270479, 1, 0, 0, 1, 1,
0.5054527, -0.3348595, 3.006331, 0, 0, 0, 1, 1,
0.5064588, 0.3120175, 1.687758, 0, 0, 0, 1, 1,
0.507186, 0.189078, -0.09206157, 0, 0, 0, 1, 1,
0.5095209, -1.179677, 3.249557, 0, 0, 0, 1, 1,
0.5100012, -1.926491, 2.991418, 0, 0, 0, 1, 1,
0.5115524, -1.661062, 3.468836, 0, 0, 0, 1, 1,
0.5128307, -0.01652876, 0.9979111, 0, 0, 0, 1, 1,
0.5202135, 0.5022113, 0.09785228, 1, 1, 1, 1, 1,
0.5251484, -1.258717, 3.523748, 1, 1, 1, 1, 1,
0.5252033, 0.4284064, 2.175747, 1, 1, 1, 1, 1,
0.5266453, -0.5440956, 2.487603, 1, 1, 1, 1, 1,
0.527515, -0.9311153, 1.362286, 1, 1, 1, 1, 1,
0.528558, 0.9578188, -1.256358, 1, 1, 1, 1, 1,
0.5297113, 0.313315, 1.97733, 1, 1, 1, 1, 1,
0.5310633, 2.123037, 0.5416138, 1, 1, 1, 1, 1,
0.5310888, 1.24547, 1.09339, 1, 1, 1, 1, 1,
0.5323101, 0.09965467, 1.534617, 1, 1, 1, 1, 1,
0.5326114, -0.9060183, 2.187424, 1, 1, 1, 1, 1,
0.5331746, -0.1804077, 0.873363, 1, 1, 1, 1, 1,
0.5381333, 0.5892095, 0.1711164, 1, 1, 1, 1, 1,
0.5382594, 0.7980561, -0.1801852, 1, 1, 1, 1, 1,
0.5401153, -0.4572062, 2.032371, 1, 1, 1, 1, 1,
0.5424257, -1.503704, 2.190278, 0, 0, 1, 1, 1,
0.5438808, 0.7569318, 1.733599, 1, 0, 0, 1, 1,
0.5460523, -0.6647864, 1.002825, 1, 0, 0, 1, 1,
0.5482846, 0.2944985, 0.1974584, 1, 0, 0, 1, 1,
0.5485982, 0.9403069, -0.3062305, 1, 0, 0, 1, 1,
0.5527921, 0.1049522, 2.635626, 1, 0, 0, 1, 1,
0.5568026, -0.9215526, 1.308161, 0, 0, 0, 1, 1,
0.5582528, 0.6961266, 0.6166576, 0, 0, 0, 1, 1,
0.5604606, 0.9460205, 0.4709359, 0, 0, 0, 1, 1,
0.5619044, 0.7442629, 1.15879, 0, 0, 0, 1, 1,
0.5642033, -0.02579843, 1.497463, 0, 0, 0, 1, 1,
0.5717589, 0.1251956, 0.9286632, 0, 0, 0, 1, 1,
0.5722096, -0.271355, 3.606766, 0, 0, 0, 1, 1,
0.5741827, -0.08957873, 4.388499, 1, 1, 1, 1, 1,
0.5752535, -0.3615224, 2.218573, 1, 1, 1, 1, 1,
0.5773568, 1.255393, -0.2713123, 1, 1, 1, 1, 1,
0.5827155, 0.8188831, 1.133986, 1, 1, 1, 1, 1,
0.5852406, 0.5734105, 0.1781687, 1, 1, 1, 1, 1,
0.5858392, -0.8705068, 3.0691, 1, 1, 1, 1, 1,
0.5891538, 1.618785, 0.2657208, 1, 1, 1, 1, 1,
0.593107, 0.8580957, 0.2379485, 1, 1, 1, 1, 1,
0.6003246, -1.754445, 1.87322, 1, 1, 1, 1, 1,
0.604053, -1.824674, 3.120315, 1, 1, 1, 1, 1,
0.6054577, 0.3933355, 0.5271508, 1, 1, 1, 1, 1,
0.6113307, -0.5341887, 2.663309, 1, 1, 1, 1, 1,
0.6169764, -0.1572945, 2.824999, 1, 1, 1, 1, 1,
0.6170268, 0.2175039, 2.575016, 1, 1, 1, 1, 1,
0.6189203, 2.254358, -0.7592984, 1, 1, 1, 1, 1,
0.6193739, -0.4952112, 3.830698, 0, 0, 1, 1, 1,
0.6218836, 0.6775795, 0.1603728, 1, 0, 0, 1, 1,
0.6263146, 1.457363, -0.5522846, 1, 0, 0, 1, 1,
0.6340469, -0.1765278, 2.907484, 1, 0, 0, 1, 1,
0.6342421, -0.1666467, 0.5440929, 1, 0, 0, 1, 1,
0.6418779, 0.09966724, 1.177223, 1, 0, 0, 1, 1,
0.6430118, -0.9144895, 1.817966, 0, 0, 0, 1, 1,
0.645482, -1.580633, 0.4239888, 0, 0, 0, 1, 1,
0.6471366, 0.8594796, 0.1036047, 0, 0, 0, 1, 1,
0.6480809, -0.7997544, 1.826502, 0, 0, 0, 1, 1,
0.6525151, 1.996614, 0.4032692, 0, 0, 0, 1, 1,
0.6547254, 1.156024, 1.422667, 0, 0, 0, 1, 1,
0.657064, 1.338856, 1.128126, 0, 0, 0, 1, 1,
0.6608816, 0.4203638, 1.402821, 1, 1, 1, 1, 1,
0.6710545, -1.053585, 5.052535, 1, 1, 1, 1, 1,
0.6723679, -0.1753844, 2.158417, 1, 1, 1, 1, 1,
0.6782711, 0.3248776, -0.09887911, 1, 1, 1, 1, 1,
0.6826408, 2.899349, 0.9082519, 1, 1, 1, 1, 1,
0.6956995, -0.2780555, 1.763597, 1, 1, 1, 1, 1,
0.6967067, -0.04743653, 1.515266, 1, 1, 1, 1, 1,
0.6976131, 0.1077504, 0.4799263, 1, 1, 1, 1, 1,
0.6988896, -2.472637, 2.146768, 1, 1, 1, 1, 1,
0.7054691, 0.6295472, 0.8543507, 1, 1, 1, 1, 1,
0.705494, -0.3943875, 1.544415, 1, 1, 1, 1, 1,
0.7082125, 0.6922821, 0.3962887, 1, 1, 1, 1, 1,
0.709225, 0.3866106, 0.2340086, 1, 1, 1, 1, 1,
0.7107713, 0.08099113, 1.9906, 1, 1, 1, 1, 1,
0.71503, -0.1767555, 3.037836, 1, 1, 1, 1, 1,
0.7160545, 1.281036, 0.1069052, 0, 0, 1, 1, 1,
0.7163362, 0.1194292, 1.540347, 1, 0, 0, 1, 1,
0.7175043, -1.153961, -0.7397336, 1, 0, 0, 1, 1,
0.7294374, -0.380857, 2.008834, 1, 0, 0, 1, 1,
0.730091, 0.6081185, -0.4788767, 1, 0, 0, 1, 1,
0.7329045, -0.2047392, 1.234694, 1, 0, 0, 1, 1,
0.7352454, 1.182605, 1.53285, 0, 0, 0, 1, 1,
0.7379218, 1.31298, 1.602976, 0, 0, 0, 1, 1,
0.7401851, 0.255612, 0.7005456, 0, 0, 0, 1, 1,
0.7417139, -0.3555609, 1.839791, 0, 0, 0, 1, 1,
0.742933, -1.676219, 2.084062, 0, 0, 0, 1, 1,
0.7440234, 0.9893994, 0.857366, 0, 0, 0, 1, 1,
0.7475158, 1.799526, 0.9684842, 0, 0, 0, 1, 1,
0.7517864, -0.02178442, 2.809736, 1, 1, 1, 1, 1,
0.7521748, 1.766515, -1.252236, 1, 1, 1, 1, 1,
0.7535199, -0.05458683, 0.6992933, 1, 1, 1, 1, 1,
0.7560434, -0.7169236, 2.292556, 1, 1, 1, 1, 1,
0.7566686, -0.7235502, 4.631306, 1, 1, 1, 1, 1,
0.7584077, 1.092844, 1.228208, 1, 1, 1, 1, 1,
0.7637663, -0.4206862, 2.669751, 1, 1, 1, 1, 1,
0.7693301, 0.2793114, 1.151814, 1, 1, 1, 1, 1,
0.7699221, 0.2028845, 0.3626871, 1, 1, 1, 1, 1,
0.7760533, 0.7783198, 1.634477, 1, 1, 1, 1, 1,
0.7777478, -0.1917546, 3.191198, 1, 1, 1, 1, 1,
0.7795842, 0.9843406, 0.5010008, 1, 1, 1, 1, 1,
0.7822452, -0.6066358, 0.1286776, 1, 1, 1, 1, 1,
0.783281, 1.680871, 2.071035, 1, 1, 1, 1, 1,
0.7860187, -0.3453423, 1.224388, 1, 1, 1, 1, 1,
0.7861142, -0.309559, 2.130118, 0, 0, 1, 1, 1,
0.7927836, -0.8792018, 1.312134, 1, 0, 0, 1, 1,
0.7938557, 0.811554, 0.9975838, 1, 0, 0, 1, 1,
0.7977731, -0.9904531, 2.647904, 1, 0, 0, 1, 1,
0.7979931, 0.1847184, 1.983392, 1, 0, 0, 1, 1,
0.8020046, 2.017745, 0.4382791, 1, 0, 0, 1, 1,
0.8025275, -0.06641597, -0.1279756, 0, 0, 0, 1, 1,
0.8036039, -0.1719894, 3.374558, 0, 0, 0, 1, 1,
0.8076625, 0.05194571, 1.379347, 0, 0, 0, 1, 1,
0.8182849, -0.4630269, 2.865492, 0, 0, 0, 1, 1,
0.8191651, 0.01720626, 0.9653806, 0, 0, 0, 1, 1,
0.8241832, -0.1552958, 1.942914, 0, 0, 0, 1, 1,
0.8258983, 2.225132, -0.1153509, 0, 0, 0, 1, 1,
0.8485245, -0.4399614, 3.275869, 1, 1, 1, 1, 1,
0.8495676, -0.619865, 2.135184, 1, 1, 1, 1, 1,
0.850908, 0.01790536, 2.183803, 1, 1, 1, 1, 1,
0.8634048, -1.165835, 1.202764, 1, 1, 1, 1, 1,
0.8644802, -1.905815, 2.749135, 1, 1, 1, 1, 1,
0.8680842, 0.2243612, 1.410415, 1, 1, 1, 1, 1,
0.8707268, -0.391278, 1.253187, 1, 1, 1, 1, 1,
0.8753206, 1.256055, -0.3041109, 1, 1, 1, 1, 1,
0.8846529, 0.03532295, 2.045839, 1, 1, 1, 1, 1,
0.8858723, 1.313511, 2.246989, 1, 1, 1, 1, 1,
0.8881161, 0.633517, 0.6230239, 1, 1, 1, 1, 1,
0.8883386, 1.264444, 1.44441, 1, 1, 1, 1, 1,
0.8902383, 1.870788, 0.8630644, 1, 1, 1, 1, 1,
0.8924515, 0.4248551, 0.2991986, 1, 1, 1, 1, 1,
0.8963318, -0.6770976, 1.145935, 1, 1, 1, 1, 1,
0.9043608, -0.3047656, 0.9913515, 0, 0, 1, 1, 1,
0.9074747, 0.2510408, 2.730762, 1, 0, 0, 1, 1,
0.9098436, 0.2708296, 0.900838, 1, 0, 0, 1, 1,
0.9112648, -0.1599076, -0.3492408, 1, 0, 0, 1, 1,
0.9156298, 0.4682691, 0.9274098, 1, 0, 0, 1, 1,
0.9191328, 0.2721945, 0.8718663, 1, 0, 0, 1, 1,
0.9203278, -0.3241548, 1.420402, 0, 0, 0, 1, 1,
0.9224919, 0.5376929, 0.2430516, 0, 0, 0, 1, 1,
0.925695, 0.1400697, -0.0750818, 0, 0, 0, 1, 1,
0.9340118, -0.2176461, 0.8529498, 0, 0, 0, 1, 1,
0.9340572, -1.096136, 3.352026, 0, 0, 0, 1, 1,
0.9360948, 0.4538193, 0.5128602, 0, 0, 0, 1, 1,
0.9418609, -0.4286056, 2.937001, 0, 0, 0, 1, 1,
0.9547316, 0.07252528, 0.6312777, 1, 1, 1, 1, 1,
0.9616383, 0.7228592, 0.2334371, 1, 1, 1, 1, 1,
0.9657243, -2.085688, 3.588084, 1, 1, 1, 1, 1,
0.9671919, 0.1082764, 0.498904, 1, 1, 1, 1, 1,
0.9702386, 0.4203245, 0.4765831, 1, 1, 1, 1, 1,
0.9734318, 0.3446302, 0.868564, 1, 1, 1, 1, 1,
0.9777679, -0.2706451, -1.010502, 1, 1, 1, 1, 1,
0.98751, 0.1149454, 1.31881, 1, 1, 1, 1, 1,
0.9890949, 0.2152595, 0.1626045, 1, 1, 1, 1, 1,
0.9902773, -0.4984603, 0.3189453, 1, 1, 1, 1, 1,
0.9918632, 1.411222, 0.626358, 1, 1, 1, 1, 1,
0.9925665, -1.312281, 2.684084, 1, 1, 1, 1, 1,
0.9939303, -1.026121, 1.849293, 1, 1, 1, 1, 1,
0.9940126, 0.1423323, 1.437944, 1, 1, 1, 1, 1,
1.015536, -1.350433, 2.619209, 1, 1, 1, 1, 1,
1.019365, -0.9498102, 2.54898, 0, 0, 1, 1, 1,
1.0322, -0.5853564, 2.53471, 1, 0, 0, 1, 1,
1.041051, -0.2144078, 3.224047, 1, 0, 0, 1, 1,
1.043154, 2.074837, 0.9600697, 1, 0, 0, 1, 1,
1.045256, 0.7976518, 0.7330897, 1, 0, 0, 1, 1,
1.048361, -1.099121, 2.185158, 1, 0, 0, 1, 1,
1.057266, 0.2590577, 2.346373, 0, 0, 0, 1, 1,
1.06356, -1.485887, 3.099342, 0, 0, 0, 1, 1,
1.080032, 0.4848652, -0.3049137, 0, 0, 0, 1, 1,
1.084927, -0.5820284, 1.686465, 0, 0, 0, 1, 1,
1.088048, 0.1274733, 0.5723932, 0, 0, 0, 1, 1,
1.095032, 0.9153892, 0.8921067, 0, 0, 0, 1, 1,
1.096585, 0.5625088, 0.526183, 0, 0, 0, 1, 1,
1.09957, -1.278796, 1.97706, 1, 1, 1, 1, 1,
1.101936, -1.396451, 1.144004, 1, 1, 1, 1, 1,
1.106392, 0.2543593, 0.8759204, 1, 1, 1, 1, 1,
1.108323, 0.7462597, 0.6610079, 1, 1, 1, 1, 1,
1.129404, -0.7435737, 3.257178, 1, 1, 1, 1, 1,
1.135651, 0.4897976, 0.9861304, 1, 1, 1, 1, 1,
1.151037, -0.7356305, 1.067413, 1, 1, 1, 1, 1,
1.151866, -0.3666613, 1.000454, 1, 1, 1, 1, 1,
1.155878, -0.4244429, 2.041173, 1, 1, 1, 1, 1,
1.162809, 1.916155, -0.1768677, 1, 1, 1, 1, 1,
1.165787, 0.3611121, 1.480846, 1, 1, 1, 1, 1,
1.166519, -0.04626835, 3.041386, 1, 1, 1, 1, 1,
1.171483, 0.9092138, 1.487481, 1, 1, 1, 1, 1,
1.174892, -0.246061, 1.032293, 1, 1, 1, 1, 1,
1.193438, -0.6074247, 2.627788, 1, 1, 1, 1, 1,
1.194884, 1.486089, -1.413917, 0, 0, 1, 1, 1,
1.200342, -1.699452, 2.904575, 1, 0, 0, 1, 1,
1.214124, 0.8584538, 0.6855433, 1, 0, 0, 1, 1,
1.214453, 0.6430346, 0.2861285, 1, 0, 0, 1, 1,
1.221208, -1.081628, 2.972733, 1, 0, 0, 1, 1,
1.225973, 0.2574901, 1.77463, 1, 0, 0, 1, 1,
1.259266, -0.09198159, 1.096646, 0, 0, 0, 1, 1,
1.27075, -1.393242, 2.218254, 0, 0, 0, 1, 1,
1.275244, 0.4968573, 3.378276, 0, 0, 0, 1, 1,
1.283126, -1.544661, 1.876808, 0, 0, 0, 1, 1,
1.291738, -0.8155516, 1.868073, 0, 0, 0, 1, 1,
1.30492, 1.186944, 0.3927422, 0, 0, 0, 1, 1,
1.310518, -0.268712, 1.018229, 0, 0, 0, 1, 1,
1.312395, 0.3004314, 0.8621216, 1, 1, 1, 1, 1,
1.325439, 0.2000155, 1.006647, 1, 1, 1, 1, 1,
1.329814, 1.545911, 1.460194, 1, 1, 1, 1, 1,
1.332526, 0.5237251, 0.5009228, 1, 1, 1, 1, 1,
1.337627, -1.08636, 3.535335, 1, 1, 1, 1, 1,
1.343441, 0.7599077, 1.581264, 1, 1, 1, 1, 1,
1.34792, -0.1105716, -0.1818336, 1, 1, 1, 1, 1,
1.348086, -0.2040914, 1.716189, 1, 1, 1, 1, 1,
1.353603, -0.4107175, 1.854518, 1, 1, 1, 1, 1,
1.355417, 0.4418224, 2.817287, 1, 1, 1, 1, 1,
1.360945, -0.8075144, 2.645332, 1, 1, 1, 1, 1,
1.364239, -0.3967765, 4.115123, 1, 1, 1, 1, 1,
1.373209, -0.6729073, 1.170568, 1, 1, 1, 1, 1,
1.379326, -0.5558838, 2.317036, 1, 1, 1, 1, 1,
1.381987, -0.402557, 0.6927716, 1, 1, 1, 1, 1,
1.383948, -0.2284823, 2.849309, 0, 0, 1, 1, 1,
1.390524, 0.04181336, 1.15639, 1, 0, 0, 1, 1,
1.395445, -0.4761008, 2.822737, 1, 0, 0, 1, 1,
1.398587, 0.8546885, 2.214824, 1, 0, 0, 1, 1,
1.406233, -0.1440749, 1.361672, 1, 0, 0, 1, 1,
1.411132, 0.2595956, 2.274153, 1, 0, 0, 1, 1,
1.416488, -1.443995, 1.959617, 0, 0, 0, 1, 1,
1.429788, -0.1289225, 2.481674, 0, 0, 0, 1, 1,
1.437644, 1.345342, 0.6739309, 0, 0, 0, 1, 1,
1.439019, -0.4135255, 1.271754, 0, 0, 0, 1, 1,
1.449185, 0.4024194, 2.474726, 0, 0, 0, 1, 1,
1.455092, 0.604915, 2.294379, 0, 0, 0, 1, 1,
1.455891, 0.02718844, 2.106765, 0, 0, 0, 1, 1,
1.456306, -0.793442, 1.746632, 1, 1, 1, 1, 1,
1.463568, 0.7248932, 1.703306, 1, 1, 1, 1, 1,
1.46658, 2.378681, 1.461681, 1, 1, 1, 1, 1,
1.468632, 1.171049, -2.272958, 1, 1, 1, 1, 1,
1.468973, -1.197613, 2.641802, 1, 1, 1, 1, 1,
1.469429, 0.7729599, 0.3152319, 1, 1, 1, 1, 1,
1.48425, -0.5619119, 1.363073, 1, 1, 1, 1, 1,
1.485284, 0.6262026, 0.04728532, 1, 1, 1, 1, 1,
1.490638, -0.7802715, 1.285683, 1, 1, 1, 1, 1,
1.493332, 1.248318, 2.401765, 1, 1, 1, 1, 1,
1.506395, -0.5633506, 4.392956, 1, 1, 1, 1, 1,
1.513066, -2.254772, 1.661922, 1, 1, 1, 1, 1,
1.518925, 2.357507, 0.1878566, 1, 1, 1, 1, 1,
1.529368, 0.1183314, 3.636395, 1, 1, 1, 1, 1,
1.529534, -0.0654751, 2.455446, 1, 1, 1, 1, 1,
1.546319, -0.31491, 0.1274398, 0, 0, 1, 1, 1,
1.555054, 0.3655804, 1.459155, 1, 0, 0, 1, 1,
1.613278, 1.605071, 1.354107, 1, 0, 0, 1, 1,
1.627414, -0.2344192, 2.121296, 1, 0, 0, 1, 1,
1.634145, 0.4662856, 2.13824, 1, 0, 0, 1, 1,
1.648813, 0.6154274, -0.1657299, 1, 0, 0, 1, 1,
1.651968, -0.3051912, 0.852942, 0, 0, 0, 1, 1,
1.672499, -1.050053, 1.980348, 0, 0, 0, 1, 1,
1.679694, 0.7656168, 0.1901155, 0, 0, 0, 1, 1,
1.68967, 0.4713483, 1.651457, 0, 0, 0, 1, 1,
1.690186, -0.5205494, 3.12643, 0, 0, 0, 1, 1,
1.698525, -0.176494, 0.8978826, 0, 0, 0, 1, 1,
1.701728, 0.8783624, -0.1400813, 0, 0, 0, 1, 1,
1.706372, 0.5526141, -0.4899817, 1, 1, 1, 1, 1,
1.714284, 2.490468, -0.06463034, 1, 1, 1, 1, 1,
1.750592, -1.296777, 1.986248, 1, 1, 1, 1, 1,
1.804244, 1.387088, -0.02710118, 1, 1, 1, 1, 1,
1.809693, 0.4442056, 2.472212, 1, 1, 1, 1, 1,
1.861325, 1.096856, 0.006146696, 1, 1, 1, 1, 1,
1.877199, -0.4680939, 2.956863, 1, 1, 1, 1, 1,
1.893094, -1.274599, 2.577562, 1, 1, 1, 1, 1,
1.897495, 0.8578393, -0.9807385, 1, 1, 1, 1, 1,
1.901837, 1.562479, -0.009701219, 1, 1, 1, 1, 1,
1.919925, 0.07068796, 1.536898, 1, 1, 1, 1, 1,
1.927357, -1.985204, 1.409037, 1, 1, 1, 1, 1,
1.951155, -2.06531, 2.547099, 1, 1, 1, 1, 1,
1.96554, -1.879562, 2.577907, 1, 1, 1, 1, 1,
1.980947, 0.136431, 3.281053, 1, 1, 1, 1, 1,
1.999303, 0.4149477, 1.965659, 0, 0, 1, 1, 1,
2.048853, 0.4148861, 0.7765023, 1, 0, 0, 1, 1,
2.091335, -0.7080733, 2.071758, 1, 0, 0, 1, 1,
2.133252, 0.8417856, 1.249745, 1, 0, 0, 1, 1,
2.156315, 0.9264596, 2.639551, 1, 0, 0, 1, 1,
2.15677, -1.408532, 2.004045, 1, 0, 0, 1, 1,
2.19551, 0.4821131, 0.6768278, 0, 0, 0, 1, 1,
2.272845, 0.286379, -0.2978709, 0, 0, 0, 1, 1,
2.292534, -0.2864836, 0.7059371, 0, 0, 0, 1, 1,
2.324531, 0.1362095, 2.925112, 0, 0, 0, 1, 1,
2.338377, 0.1033287, 1.490985, 0, 0, 0, 1, 1,
2.449239, -0.8028516, 1.598831, 0, 0, 0, 1, 1,
2.46677, 0.3570177, 1.035959, 0, 0, 0, 1, 1,
2.548912, -0.9286855, 3.278087, 1, 1, 1, 1, 1,
2.573285, -0.1087349, 1.847342, 1, 1, 1, 1, 1,
2.624407, -0.7416559, 0.7578267, 1, 1, 1, 1, 1,
2.729164, -0.07455735, 2.396617, 1, 1, 1, 1, 1,
2.984248, -0.4588262, 0.5614766, 1, 1, 1, 1, 1,
2.987614, 0.2185973, 1.564494, 1, 1, 1, 1, 1,
3.023133, 0.3413889, 1.382309, 1, 1, 1, 1, 1
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
var radius = 10.13719;
var distance = 35.60644;
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
mvMatrix.translate( 0.1523108, -0.30829, 0.18309 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.60644);
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
