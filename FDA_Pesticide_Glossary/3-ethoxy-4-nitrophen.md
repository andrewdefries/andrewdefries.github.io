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
-3.710335, -2.007577, -2.781982, 1, 0, 0, 1,
-3.000661, -0.4228479, -3.298316, 1, 0.007843138, 0, 1,
-2.77542, -0.4475908, -1.441573, 1, 0.01176471, 0, 1,
-2.593944, -1.000335, -2.013626, 1, 0.01960784, 0, 1,
-2.523301, -1.700554, -1.275201, 1, 0.02352941, 0, 1,
-2.373252, 0.08500233, -1.439612, 1, 0.03137255, 0, 1,
-2.349306, 0.6965724, -1.701702, 1, 0.03529412, 0, 1,
-2.296432, 0.9709874, -1.331797, 1, 0.04313726, 0, 1,
-2.262621, 0.7806788, -1.573026, 1, 0.04705882, 0, 1,
-2.219047, -0.1500227, -2.822526, 1, 0.05490196, 0, 1,
-2.180026, -0.03060528, -1.532871, 1, 0.05882353, 0, 1,
-2.14197, 0.3844605, -1.204162, 1, 0.06666667, 0, 1,
-2.139187, -0.1518278, -0.9684714, 1, 0.07058824, 0, 1,
-2.109976, -0.2049364, -0.756402, 1, 0.07843138, 0, 1,
-2.101544, -0.4462991, -1.083013, 1, 0.08235294, 0, 1,
-2.078418, 0.01736522, -1.450145, 1, 0.09019608, 0, 1,
-2.057922, 0.124939, -1.384477, 1, 0.09411765, 0, 1,
-2.032497, 0.2000602, -1.906306, 1, 0.1019608, 0, 1,
-2.030465, -0.8562057, -2.883967, 1, 0.1098039, 0, 1,
-1.997599, 1.140595, 0.5533054, 1, 0.1137255, 0, 1,
-1.971587, -0.9387054, -3.35297, 1, 0.1215686, 0, 1,
-1.965264, 0.0002503788, -2.805781, 1, 0.1254902, 0, 1,
-1.939621, 2.916638, -0.5311432, 1, 0.1333333, 0, 1,
-1.91786, 1.319556, -0.596715, 1, 0.1372549, 0, 1,
-1.914427, 0.9399846, 0.07396642, 1, 0.145098, 0, 1,
-1.914348, 1.048032, 0.8113799, 1, 0.1490196, 0, 1,
-1.906792, 0.4444486, -1.651414, 1, 0.1568628, 0, 1,
-1.906548, -0.1254797, -2.926667, 1, 0.1607843, 0, 1,
-1.890004, -0.2523509, -2.246312, 1, 0.1686275, 0, 1,
-1.878667, -0.1619264, -0.07277897, 1, 0.172549, 0, 1,
-1.874724, 0.1226449, -3.983015, 1, 0.1803922, 0, 1,
-1.872452, 0.9431591, 0.1225323, 1, 0.1843137, 0, 1,
-1.835273, 0.5244129, -1.102018, 1, 0.1921569, 0, 1,
-1.834273, 0.2095522, 0.1386153, 1, 0.1960784, 0, 1,
-1.827634, 1.289619, -1.800759, 1, 0.2039216, 0, 1,
-1.807417, 2.76499, -0.3192312, 1, 0.2117647, 0, 1,
-1.793933, -1.724603, -1.113041, 1, 0.2156863, 0, 1,
-1.788945, -1.540754, -3.786061, 1, 0.2235294, 0, 1,
-1.786319, 0.4292874, -1.721867, 1, 0.227451, 0, 1,
-1.782701, 1.22592, -0.2843899, 1, 0.2352941, 0, 1,
-1.746674, -0.2097632, -0.2648327, 1, 0.2392157, 0, 1,
-1.740196, 1.15962, -1.808617, 1, 0.2470588, 0, 1,
-1.732886, -0.5567236, -2.013496, 1, 0.2509804, 0, 1,
-1.726302, -0.5725096, -5.063717, 1, 0.2588235, 0, 1,
-1.725091, 0.01027576, 0.4551617, 1, 0.2627451, 0, 1,
-1.715299, -0.08870798, -1.186171, 1, 0.2705882, 0, 1,
-1.700569, 1.536932, -1.13726, 1, 0.2745098, 0, 1,
-1.691523, -0.9194499, -3.488198, 1, 0.282353, 0, 1,
-1.689887, 0.5262709, -0.6954117, 1, 0.2862745, 0, 1,
-1.685521, 0.529943, -0.8240548, 1, 0.2941177, 0, 1,
-1.680527, -0.1925596, -2.299822, 1, 0.3019608, 0, 1,
-1.677163, -1.355513, -1.189789, 1, 0.3058824, 0, 1,
-1.675937, -1.628236, -4.114068, 1, 0.3137255, 0, 1,
-1.674816, -0.1315322, -1.598052, 1, 0.3176471, 0, 1,
-1.670382, -1.288017, -1.102972, 1, 0.3254902, 0, 1,
-1.664761, -0.4557493, -1.758536, 1, 0.3294118, 0, 1,
-1.661487, 1.643803, 0.12341, 1, 0.3372549, 0, 1,
-1.656922, 2.529693, 0.03571888, 1, 0.3411765, 0, 1,
-1.645598, 0.57665, -1.301127, 1, 0.3490196, 0, 1,
-1.642988, -0.9828187, -1.688335, 1, 0.3529412, 0, 1,
-1.635927, 0.3393773, -1.715449, 1, 0.3607843, 0, 1,
-1.633832, 0.9856279, -1.635209, 1, 0.3647059, 0, 1,
-1.622355, -0.002782239, -1.924559, 1, 0.372549, 0, 1,
-1.587543, 0.6159584, -0.8152633, 1, 0.3764706, 0, 1,
-1.58599, -0.5631741, -1.492916, 1, 0.3843137, 0, 1,
-1.576951, -0.9296659, -0.5727809, 1, 0.3882353, 0, 1,
-1.559892, 0.1205477, -3.099476, 1, 0.3960784, 0, 1,
-1.556996, 0.5426717, -1.610326, 1, 0.4039216, 0, 1,
-1.543234, -0.2370477, -2.893368, 1, 0.4078431, 0, 1,
-1.542145, 0.06535382, -0.4928406, 1, 0.4156863, 0, 1,
-1.537913, 1.794441, -1.072276, 1, 0.4196078, 0, 1,
-1.528193, -0.8700433, -2.70767, 1, 0.427451, 0, 1,
-1.526392, -0.0003813818, -2.220571, 1, 0.4313726, 0, 1,
-1.514043, -0.1591129, -0.3819232, 1, 0.4392157, 0, 1,
-1.503943, 0.8186563, -2.84732, 1, 0.4431373, 0, 1,
-1.497224, -0.8642992, -0.1109973, 1, 0.4509804, 0, 1,
-1.48675, -0.1803088, -2.238525, 1, 0.454902, 0, 1,
-1.486743, -0.5096072, -0.586854, 1, 0.4627451, 0, 1,
-1.477491, -1.090142, -0.8328576, 1, 0.4666667, 0, 1,
-1.474658, -1.501748, -2.172913, 1, 0.4745098, 0, 1,
-1.467226, -1.329769, -2.116581, 1, 0.4784314, 0, 1,
-1.439913, 0.06820562, -2.154895, 1, 0.4862745, 0, 1,
-1.420722, -0.4235759, -0.3601709, 1, 0.4901961, 0, 1,
-1.41514, -0.2861164, -1.51682, 1, 0.4980392, 0, 1,
-1.413299, 0.6624538, -0.05196005, 1, 0.5058824, 0, 1,
-1.40408, 1.236437, -2.730774, 1, 0.509804, 0, 1,
-1.403962, -0.7921971, -1.712742, 1, 0.5176471, 0, 1,
-1.40006, 0.3925553, -0.4663495, 1, 0.5215687, 0, 1,
-1.378844, -1.057297, -3.032225, 1, 0.5294118, 0, 1,
-1.348552, -0.1991813, -3.739443, 1, 0.5333334, 0, 1,
-1.34712, -1.522579, -2.915826, 1, 0.5411765, 0, 1,
-1.335735, -1.087359, -1.744408, 1, 0.5450981, 0, 1,
-1.333952, -0.03545144, -1.880077, 1, 0.5529412, 0, 1,
-1.330269, 0.09577136, -3.06289, 1, 0.5568628, 0, 1,
-1.325245, 0.6657205, -1.283776, 1, 0.5647059, 0, 1,
-1.314335, 1.642212, -1.882964, 1, 0.5686275, 0, 1,
-1.303312, -0.4137297, -1.543097, 1, 0.5764706, 0, 1,
-1.29602, 0.6673319, -1.559655, 1, 0.5803922, 0, 1,
-1.291418, 1.775927, -0.7867066, 1, 0.5882353, 0, 1,
-1.272893, -0.746409, -3.112504, 1, 0.5921569, 0, 1,
-1.26692, -0.9183865, -1.076869, 1, 0.6, 0, 1,
-1.266507, -0.2374185, -2.109515, 1, 0.6078432, 0, 1,
-1.252395, 0.2772916, -0.4771381, 1, 0.6117647, 0, 1,
-1.248983, -1.02327, -3.617122, 1, 0.6196079, 0, 1,
-1.247766, 1.538517, -0.4626653, 1, 0.6235294, 0, 1,
-1.247189, 1.015977, -1.693075, 1, 0.6313726, 0, 1,
-1.240819, -0.05165815, -0.2365517, 1, 0.6352941, 0, 1,
-1.235861, 1.540528, 0.7637941, 1, 0.6431373, 0, 1,
-1.2341, 0.2913563, -1.952622, 1, 0.6470588, 0, 1,
-1.221902, 0.6445511, -0.02597873, 1, 0.654902, 0, 1,
-1.217506, 0.4418585, -1.53135, 1, 0.6588235, 0, 1,
-1.213736, -1.974252, -1.614454, 1, 0.6666667, 0, 1,
-1.212144, 0.5451683, -1.867104, 1, 0.6705883, 0, 1,
-1.209828, -1.174316, -1.259938, 1, 0.6784314, 0, 1,
-1.205159, -1.549264, -2.991853, 1, 0.682353, 0, 1,
-1.204272, 0.5735257, -2.332072, 1, 0.6901961, 0, 1,
-1.199774, 1.839163, -0.4459154, 1, 0.6941177, 0, 1,
-1.197719, 1.622395, -1.197777, 1, 0.7019608, 0, 1,
-1.192736, -0.9763592, -0.2208117, 1, 0.7098039, 0, 1,
-1.183776, 0.1606854, -2.882258, 1, 0.7137255, 0, 1,
-1.178532, -1.279844, -3.518008, 1, 0.7215686, 0, 1,
-1.175333, 0.562195, -1.71476, 1, 0.7254902, 0, 1,
-1.170918, 0.872942, -0.1748449, 1, 0.7333333, 0, 1,
-1.162318, 0.7003986, -1.056796, 1, 0.7372549, 0, 1,
-1.156802, -0.08717946, -2.595421, 1, 0.7450981, 0, 1,
-1.154172, 0.1517156, -1.337698, 1, 0.7490196, 0, 1,
-1.153399, -1.273708, -2.193612, 1, 0.7568628, 0, 1,
-1.135882, -0.6210309, -2.397083, 1, 0.7607843, 0, 1,
-1.132294, 0.2087557, -2.519633, 1, 0.7686275, 0, 1,
-1.126823, 2.175456, -3.214595, 1, 0.772549, 0, 1,
-1.109139, -0.8901954, -3.152585, 1, 0.7803922, 0, 1,
-1.098492, -0.07141741, -3.083225, 1, 0.7843137, 0, 1,
-1.091622, -0.9999143, -2.020218, 1, 0.7921569, 0, 1,
-1.089396, 0.5550963, -1.818949, 1, 0.7960784, 0, 1,
-1.08634, -1.681035, -2.985822, 1, 0.8039216, 0, 1,
-1.083508, 0.09209114, -2.690458, 1, 0.8117647, 0, 1,
-1.077435, 0.02948693, -2.885706, 1, 0.8156863, 0, 1,
-1.07702, -0.8239835, -1.838058, 1, 0.8235294, 0, 1,
-1.072229, 0.6281765, -0.5965717, 1, 0.827451, 0, 1,
-1.06963, 0.8626209, -0.9700339, 1, 0.8352941, 0, 1,
-1.068928, 0.06059986, -1.147595, 1, 0.8392157, 0, 1,
-1.052314, 0.2443129, -1.332829, 1, 0.8470588, 0, 1,
-1.048062, 0.9434111, -0.6658788, 1, 0.8509804, 0, 1,
-1.048048, -1.232771, -1.859702, 1, 0.8588235, 0, 1,
-1.045158, -1.178329, -1.087649, 1, 0.8627451, 0, 1,
-1.038772, 0.08409587, -2.384198, 1, 0.8705882, 0, 1,
-1.033939, 0.2641636, -2.011245, 1, 0.8745098, 0, 1,
-1.011267, 0.1923013, -1.734017, 1, 0.8823529, 0, 1,
-1.008938, 0.3443554, -0.1012781, 1, 0.8862745, 0, 1,
-1.005564, -1.981121, -2.656072, 1, 0.8941177, 0, 1,
-1.005282, 1.641762, -1.357891, 1, 0.8980392, 0, 1,
-1.003707, -0.1099357, -1.287103, 1, 0.9058824, 0, 1,
-1.003138, 0.5315599, -0.4349789, 1, 0.9137255, 0, 1,
-0.9987928, 0.4255565, -2.79537, 1, 0.9176471, 0, 1,
-0.9926742, 0.2006685, -2.111392, 1, 0.9254902, 0, 1,
-0.9896562, -0.2240977, -2.655854, 1, 0.9294118, 0, 1,
-0.9819579, 1.278558, -1.161906, 1, 0.9372549, 0, 1,
-0.9738538, 1.237999, -0.1877554, 1, 0.9411765, 0, 1,
-0.9721617, 0.676464, -0.5402085, 1, 0.9490196, 0, 1,
-0.9690734, -0.5843275, -3.517812, 1, 0.9529412, 0, 1,
-0.9659634, 0.4208733, -0.6519446, 1, 0.9607843, 0, 1,
-0.9650856, -0.1178877, -3.45253, 1, 0.9647059, 0, 1,
-0.9607266, -0.2788215, -2.08407, 1, 0.972549, 0, 1,
-0.960111, -0.2084345, -1.33104, 1, 0.9764706, 0, 1,
-0.9550118, 0.6638981, -1.739595, 1, 0.9843137, 0, 1,
-0.953665, 0.8971466, -0.8979807, 1, 0.9882353, 0, 1,
-0.950065, 0.2586699, 0.3655039, 1, 0.9960784, 0, 1,
-0.9494249, -2.73987, -2.931469, 0.9960784, 1, 0, 1,
-0.9492106, -0.839628, -2.441665, 0.9921569, 1, 0, 1,
-0.9488507, 2.134728, -1.062017, 0.9843137, 1, 0, 1,
-0.9454511, 0.7202645, 1.528553, 0.9803922, 1, 0, 1,
-0.9401738, -1.603017, -2.809759, 0.972549, 1, 0, 1,
-0.9350473, 0.421508, 0.2503527, 0.9686275, 1, 0, 1,
-0.9256744, 0.07514953, -1.020627, 0.9607843, 1, 0, 1,
-0.919072, -0.453032, -2.014677, 0.9568627, 1, 0, 1,
-0.9143374, 0.1058791, -2.053782, 0.9490196, 1, 0, 1,
-0.9138329, -1.666392, -2.070456, 0.945098, 1, 0, 1,
-0.9093391, 0.08344923, -3.778891, 0.9372549, 1, 0, 1,
-0.9071103, 0.2373152, -0.6125143, 0.9333333, 1, 0, 1,
-0.8963497, -0.3703427, -2.337686, 0.9254902, 1, 0, 1,
-0.8941904, -0.08763821, -0.5615989, 0.9215686, 1, 0, 1,
-0.89237, 0.4470404, -0.3305736, 0.9137255, 1, 0, 1,
-0.8846848, -2.162939, -4.23796, 0.9098039, 1, 0, 1,
-0.8842388, -0.3247732, -3.485737, 0.9019608, 1, 0, 1,
-0.8813604, 0.07657167, -2.692081, 0.8941177, 1, 0, 1,
-0.8807479, -2.62497, -0.1745374, 0.8901961, 1, 0, 1,
-0.8803569, 0.06554773, -1.964715, 0.8823529, 1, 0, 1,
-0.877426, -0.9390886, -2.939578, 0.8784314, 1, 0, 1,
-0.876387, -1.578449, -1.121551, 0.8705882, 1, 0, 1,
-0.8724045, 0.03035659, -1.016479, 0.8666667, 1, 0, 1,
-0.8708497, 0.5815125, -1.88665, 0.8588235, 1, 0, 1,
-0.8660204, 0.799194, -0.758531, 0.854902, 1, 0, 1,
-0.8625341, -0.1142698, -1.896954, 0.8470588, 1, 0, 1,
-0.8625272, -0.09085143, -2.010383, 0.8431373, 1, 0, 1,
-0.8595356, 1.45302, 1.077066, 0.8352941, 1, 0, 1,
-0.8511336, 0.772953, -1.926035, 0.8313726, 1, 0, 1,
-0.8498477, 0.01479104, -2.738667, 0.8235294, 1, 0, 1,
-0.8434317, 1.8052, -0.2480615, 0.8196079, 1, 0, 1,
-0.8408394, 2.090567, -1.752703, 0.8117647, 1, 0, 1,
-0.8336859, 0.3797902, -3.205445, 0.8078431, 1, 0, 1,
-0.8222017, 0.1403341, -0.7616978, 0.8, 1, 0, 1,
-0.8169294, -0.4240954, -2.872728, 0.7921569, 1, 0, 1,
-0.8143224, 2.197903, 2.042717, 0.7882353, 1, 0, 1,
-0.8143082, 0.4897932, -1.186821, 0.7803922, 1, 0, 1,
-0.8121889, 0.03747811, -1.74368, 0.7764706, 1, 0, 1,
-0.8116701, -1.218764, -1.482564, 0.7686275, 1, 0, 1,
-0.8115431, 1.323426, -2.331974, 0.7647059, 1, 0, 1,
-0.8081707, -0.2022601, -0.8202688, 0.7568628, 1, 0, 1,
-0.8079354, -0.2761707, -1.785707, 0.7529412, 1, 0, 1,
-0.807753, 1.579495, -0.548785, 0.7450981, 1, 0, 1,
-0.8069112, -0.4775133, -1.549477, 0.7411765, 1, 0, 1,
-0.8056877, -1.241532, -3.762074, 0.7333333, 1, 0, 1,
-0.796854, -0.9985572, -2.168225, 0.7294118, 1, 0, 1,
-0.7904894, -0.9284367, -1.402342, 0.7215686, 1, 0, 1,
-0.7875583, -0.1865796, -0.4319276, 0.7176471, 1, 0, 1,
-0.7864776, -0.3522727, -3.000344, 0.7098039, 1, 0, 1,
-0.7763334, 0.5278927, -1.650866, 0.7058824, 1, 0, 1,
-0.773117, -0.1550346, -0.06586663, 0.6980392, 1, 0, 1,
-0.7706182, 1.831169, 0.4003828, 0.6901961, 1, 0, 1,
-0.7672396, -0.5578334, -1.98172, 0.6862745, 1, 0, 1,
-0.7627124, -1.524876, -4.162091, 0.6784314, 1, 0, 1,
-0.7608116, -1.361725, -3.999805, 0.6745098, 1, 0, 1,
-0.754703, -0.3235329, -1.713578, 0.6666667, 1, 0, 1,
-0.7530991, 0.7680647, -0.1045524, 0.6627451, 1, 0, 1,
-0.7515185, 0.7728715, -0.2104898, 0.654902, 1, 0, 1,
-0.7468567, 1.461798, -0.5741073, 0.6509804, 1, 0, 1,
-0.7467832, 0.2474653, -1.567122, 0.6431373, 1, 0, 1,
-0.7380525, 0.2462519, -0.1648302, 0.6392157, 1, 0, 1,
-0.7375013, 0.7893401, 0.05125243, 0.6313726, 1, 0, 1,
-0.7363836, -0.2384079, -2.3388, 0.627451, 1, 0, 1,
-0.7328062, 1.300036, -1.368318, 0.6196079, 1, 0, 1,
-0.7227547, 0.02566228, -2.683855, 0.6156863, 1, 0, 1,
-0.7225764, 0.6402971, -0.544532, 0.6078432, 1, 0, 1,
-0.7166623, 0.6000348, -1.18478, 0.6039216, 1, 0, 1,
-0.7165753, -1.058978, -4.890694, 0.5960785, 1, 0, 1,
-0.7140946, -0.06825319, -1.839882, 0.5882353, 1, 0, 1,
-0.7116336, -0.5888908, -4.240405, 0.5843138, 1, 0, 1,
-0.711023, 1.649479, -2.709598, 0.5764706, 1, 0, 1,
-0.7062341, 0.3047789, -1.042957, 0.572549, 1, 0, 1,
-0.7056389, -1.069188, -2.102202, 0.5647059, 1, 0, 1,
-0.6983294, 1.125923, -0.1746044, 0.5607843, 1, 0, 1,
-0.6951391, -0.7080749, -0.6315351, 0.5529412, 1, 0, 1,
-0.6944503, -0.8653811, -2.15773, 0.5490196, 1, 0, 1,
-0.6875193, -0.956973, -1.509401, 0.5411765, 1, 0, 1,
-0.6869131, 2.103487, 0.2757118, 0.5372549, 1, 0, 1,
-0.6857076, 0.2610511, -1.375583, 0.5294118, 1, 0, 1,
-0.6800965, -0.2359672, -3.027476, 0.5254902, 1, 0, 1,
-0.6786547, -1.101036, -3.665666, 0.5176471, 1, 0, 1,
-0.677835, 0.6479027, -0.5597198, 0.5137255, 1, 0, 1,
-0.6772919, 0.5161994, -1.965867, 0.5058824, 1, 0, 1,
-0.6741725, 0.8329495, -1.696322, 0.5019608, 1, 0, 1,
-0.6700615, 0.4642705, 0.6584494, 0.4941176, 1, 0, 1,
-0.6695799, -0.6987553, -2.547147, 0.4862745, 1, 0, 1,
-0.668758, 2.086519, -0.7754218, 0.4823529, 1, 0, 1,
-0.6665651, 2.297093, -1.521137, 0.4745098, 1, 0, 1,
-0.6643142, 1.528859, -1.616281, 0.4705882, 1, 0, 1,
-0.6611134, -0.2406111, 0.008942676, 0.4627451, 1, 0, 1,
-0.6521732, 0.8199384, -1.407895, 0.4588235, 1, 0, 1,
-0.6502881, 0.4407084, -2.781523, 0.4509804, 1, 0, 1,
-0.6445305, -0.3037973, -2.087867, 0.4470588, 1, 0, 1,
-0.6227049, -0.674422, -3.555321, 0.4392157, 1, 0, 1,
-0.6221983, -0.5907905, -4.212295, 0.4352941, 1, 0, 1,
-0.6152657, 2.485769, -2.179614, 0.427451, 1, 0, 1,
-0.6136512, -0.8115889, -0.6957181, 0.4235294, 1, 0, 1,
-0.6105778, -0.9854844, -2.399459, 0.4156863, 1, 0, 1,
-0.6062548, -0.4151554, -0.7115162, 0.4117647, 1, 0, 1,
-0.6062295, -0.5956988, -3.572234, 0.4039216, 1, 0, 1,
-0.6005222, -0.4538555, -2.759105, 0.3960784, 1, 0, 1,
-0.5985422, 0.03755324, 0.6377298, 0.3921569, 1, 0, 1,
-0.5962275, 1.366376, 0.2682133, 0.3843137, 1, 0, 1,
-0.5893891, -0.2024928, -0.06830104, 0.3803922, 1, 0, 1,
-0.5863879, 0.4948141, 0.4385529, 0.372549, 1, 0, 1,
-0.5813529, -2.201267, -2.740254, 0.3686275, 1, 0, 1,
-0.572203, -1.052506, -1.393106, 0.3607843, 1, 0, 1,
-0.5721977, 1.417549, 1.021673, 0.3568628, 1, 0, 1,
-0.5720053, 1.485458, -0.2012636, 0.3490196, 1, 0, 1,
-0.5683964, -0.9158976, -2.468744, 0.345098, 1, 0, 1,
-0.5672394, 0.9585529, -1.158283, 0.3372549, 1, 0, 1,
-0.566959, 1.052028, -1.424361, 0.3333333, 1, 0, 1,
-0.5652435, 0.663445, 0.7214161, 0.3254902, 1, 0, 1,
-0.5642465, 0.648588, -1.04557, 0.3215686, 1, 0, 1,
-0.5634682, 0.1948608, -1.063652, 0.3137255, 1, 0, 1,
-0.5632194, -1.507873, -3.093589, 0.3098039, 1, 0, 1,
-0.5604784, 0.2898937, -0.3303213, 0.3019608, 1, 0, 1,
-0.5601445, -2.425386, -2.557011, 0.2941177, 1, 0, 1,
-0.5589786, -0.2990109, -1.674416, 0.2901961, 1, 0, 1,
-0.5579183, 1.124128, -1.552098, 0.282353, 1, 0, 1,
-0.5569842, -1.279113, -2.276192, 0.2784314, 1, 0, 1,
-0.5554209, 0.7572552, -1.595905, 0.2705882, 1, 0, 1,
-0.5553203, -0.2341407, -0.1787495, 0.2666667, 1, 0, 1,
-0.5528147, 0.8455355, 0.6072608, 0.2588235, 1, 0, 1,
-0.5526252, -1.149209, -3.886407, 0.254902, 1, 0, 1,
-0.5523793, -0.4291568, -2.94087, 0.2470588, 1, 0, 1,
-0.5445604, 0.1172513, -2.837662, 0.2431373, 1, 0, 1,
-0.5415781, -0.9248399, -1.015239, 0.2352941, 1, 0, 1,
-0.5390395, 0.1092775, -1.845156, 0.2313726, 1, 0, 1,
-0.538441, -0.1854695, -0.2354829, 0.2235294, 1, 0, 1,
-0.5356888, 1.155913, -1.587867, 0.2196078, 1, 0, 1,
-0.5350984, 1.194301, -2.275822, 0.2117647, 1, 0, 1,
-0.5350491, -0.2429315, -0.6078231, 0.2078431, 1, 0, 1,
-0.5331413, -0.2325719, -0.2696057, 0.2, 1, 0, 1,
-0.5321923, 1.235129, 0.572203, 0.1921569, 1, 0, 1,
-0.5317817, 1.287, -1.435262, 0.1882353, 1, 0, 1,
-0.5311894, -0.1619803, -2.566962, 0.1803922, 1, 0, 1,
-0.5311219, 0.08636105, -1.344968, 0.1764706, 1, 0, 1,
-0.5311173, 0.01669007, -2.451844, 0.1686275, 1, 0, 1,
-0.5254439, -1.352139, -1.088545, 0.1647059, 1, 0, 1,
-0.5214311, 0.2346241, -2.038663, 0.1568628, 1, 0, 1,
-0.5207025, -0.2452629, -2.633088, 0.1529412, 1, 0, 1,
-0.5157796, -1.290404, -2.817527, 0.145098, 1, 0, 1,
-0.5142258, -1.006527, -4.431444, 0.1411765, 1, 0, 1,
-0.5114289, -0.5620188, -2.605239, 0.1333333, 1, 0, 1,
-0.5060798, 1.091983, 0.3798355, 0.1294118, 1, 0, 1,
-0.5045623, 1.287338, -0.608527, 0.1215686, 1, 0, 1,
-0.5038063, -0.8746382, -4.026268, 0.1176471, 1, 0, 1,
-0.5021344, -1.117001, -2.544275, 0.1098039, 1, 0, 1,
-0.5015433, -0.5014056, -1.34788, 0.1058824, 1, 0, 1,
-0.5009247, 0.7234931, -0.06928025, 0.09803922, 1, 0, 1,
-0.4993203, -1.503367, -3.425055, 0.09019608, 1, 0, 1,
-0.4936118, -0.6389288, -2.562771, 0.08627451, 1, 0, 1,
-0.4923352, 1.351452, -0.9954689, 0.07843138, 1, 0, 1,
-0.4885477, 0.6387928, 1.101058, 0.07450981, 1, 0, 1,
-0.4798317, 1.540547, 0.3672935, 0.06666667, 1, 0, 1,
-0.4693958, 0.8224747, -1.266043, 0.0627451, 1, 0, 1,
-0.4612347, 0.2539488, 0.4074584, 0.05490196, 1, 0, 1,
-0.4524726, 1.234379, -0.0587459, 0.05098039, 1, 0, 1,
-0.4513476, -0.5644965, -1.949931, 0.04313726, 1, 0, 1,
-0.4459411, 1.601173, 1.542745, 0.03921569, 1, 0, 1,
-0.444985, -0.7771457, -1.124014, 0.03137255, 1, 0, 1,
-0.44009, -0.9426834, -2.433043, 0.02745098, 1, 0, 1,
-0.4302316, -1.49402, -4.254571, 0.01960784, 1, 0, 1,
-0.4284184, -0.6888505, -2.229304, 0.01568628, 1, 0, 1,
-0.4268975, -0.162894, -1.783327, 0.007843138, 1, 0, 1,
-0.4216983, 0.4370859, -0.7799909, 0.003921569, 1, 0, 1,
-0.4204279, 0.7374313, -0.6081927, 0, 1, 0.003921569, 1,
-0.4163598, -1.351598, -1.055998, 0, 1, 0.01176471, 1,
-0.4140584, 1.07734, 0.001353025, 0, 1, 0.01568628, 1,
-0.4070992, -1.135719, -3.632315, 0, 1, 0.02352941, 1,
-0.4058842, 1.214396, -0.9767129, 0, 1, 0.02745098, 1,
-0.4002964, -0.507307, -3.788036, 0, 1, 0.03529412, 1,
-0.4000131, -1.002513, -2.52529, 0, 1, 0.03921569, 1,
-0.3949914, 0.5399696, -1.67954, 0, 1, 0.04705882, 1,
-0.3943515, -0.5594448, -2.253871, 0, 1, 0.05098039, 1,
-0.3823651, -0.1769358, -1.485604, 0, 1, 0.05882353, 1,
-0.3804471, -1.012835, -3.630544, 0, 1, 0.0627451, 1,
-0.379953, 0.8579612, 0.2758411, 0, 1, 0.07058824, 1,
-0.3774732, -0.9665343, -4.279192, 0, 1, 0.07450981, 1,
-0.3770122, 0.04438984, 0.1967235, 0, 1, 0.08235294, 1,
-0.3709708, 0.2967179, -0.128794, 0, 1, 0.08627451, 1,
-0.3694237, 0.006426396, -3.035389, 0, 1, 0.09411765, 1,
-0.3688279, 0.1583005, 1.083004, 0, 1, 0.1019608, 1,
-0.3684667, 0.5932782, -1.003899, 0, 1, 0.1058824, 1,
-0.3523685, -1.025875, -4.879273, 0, 1, 0.1137255, 1,
-0.3506459, -0.8921917, -3.113667, 0, 1, 0.1176471, 1,
-0.3502366, 0.3608729, -0.8938539, 0, 1, 0.1254902, 1,
-0.3484893, -0.6283504, -2.461446, 0, 1, 0.1294118, 1,
-0.3466813, -1.396759, -3.15454, 0, 1, 0.1372549, 1,
-0.3454519, -1.135551, -3.496193, 0, 1, 0.1411765, 1,
-0.3442494, -0.5268438, -2.983625, 0, 1, 0.1490196, 1,
-0.3349971, 1.745434, 0.3082762, 0, 1, 0.1529412, 1,
-0.3295371, 0.9593319, 1.466258, 0, 1, 0.1607843, 1,
-0.3292875, -1.089743, -3.544343, 0, 1, 0.1647059, 1,
-0.3286861, -0.3785206, -2.585263, 0, 1, 0.172549, 1,
-0.3274876, -0.3746652, -1.171092, 0, 1, 0.1764706, 1,
-0.3212063, 0.02956015, -0.007971926, 0, 1, 0.1843137, 1,
-0.31917, 0.2505266, 0.4874689, 0, 1, 0.1882353, 1,
-0.3186091, -0.05514345, -2.214002, 0, 1, 0.1960784, 1,
-0.3175322, -1.521833, -3.295893, 0, 1, 0.2039216, 1,
-0.3146804, 0.1224386, -2.829774, 0, 1, 0.2078431, 1,
-0.3127663, -0.126164, -2.947326, 0, 1, 0.2156863, 1,
-0.3090229, -0.1210602, -2.86742, 0, 1, 0.2196078, 1,
-0.3083706, -1.374421, -3.345099, 0, 1, 0.227451, 1,
-0.3025303, -0.4618958, -4.235921, 0, 1, 0.2313726, 1,
-0.302179, 0.2880257, -0.4047723, 0, 1, 0.2392157, 1,
-0.3008352, 0.6095263, -0.9360443, 0, 1, 0.2431373, 1,
-0.2923456, -0.1244641, -0.1893418, 0, 1, 0.2509804, 1,
-0.2837924, -1.006637, -5.065391, 0, 1, 0.254902, 1,
-0.2815935, 0.9134983, -1.0788, 0, 1, 0.2627451, 1,
-0.2812671, -0.406894, -2.400531, 0, 1, 0.2666667, 1,
-0.2772201, -0.5585944, -1.019726, 0, 1, 0.2745098, 1,
-0.2761548, -0.9714831, -2.568305, 0, 1, 0.2784314, 1,
-0.2733557, -0.05352214, -3.869487, 0, 1, 0.2862745, 1,
-0.2701092, 0.8983407, -1.373041, 0, 1, 0.2901961, 1,
-0.2635135, -0.2663811, -3.46187, 0, 1, 0.2980392, 1,
-0.2617302, -0.7600134, -3.226473, 0, 1, 0.3058824, 1,
-0.2590202, -1.564657, -3.211277, 0, 1, 0.3098039, 1,
-0.2555685, -0.5301299, -3.720886, 0, 1, 0.3176471, 1,
-0.2543298, -0.6377907, -3.8513, 0, 1, 0.3215686, 1,
-0.252418, -0.1144931, -1.435369, 0, 1, 0.3294118, 1,
-0.2513551, -0.4242525, -1.26633, 0, 1, 0.3333333, 1,
-0.2511902, 2.068554, -1.52032, 0, 1, 0.3411765, 1,
-0.249569, -0.2818783, -3.000336, 0, 1, 0.345098, 1,
-0.2471566, 1.337586, 0.6429051, 0, 1, 0.3529412, 1,
-0.2462422, 0.5342516, -1.881377, 0, 1, 0.3568628, 1,
-0.2451595, -0.2029608, -2.689566, 0, 1, 0.3647059, 1,
-0.2447585, -0.515662, -2.654753, 0, 1, 0.3686275, 1,
-0.2433917, 0.4051796, -0.3601712, 0, 1, 0.3764706, 1,
-0.2418812, -0.4302047, -3.293067, 0, 1, 0.3803922, 1,
-0.2405257, 0.6054911, -0.4604897, 0, 1, 0.3882353, 1,
-0.2384142, 1.142529, -1.395835, 0, 1, 0.3921569, 1,
-0.2380907, 2.038522, 2.160313, 0, 1, 0.4, 1,
-0.2374303, -1.300617, -3.027228, 0, 1, 0.4078431, 1,
-0.236347, -1.598175, -5.507641, 0, 1, 0.4117647, 1,
-0.2342657, 0.6487644, 0.3208339, 0, 1, 0.4196078, 1,
-0.2323291, 0.0437833, 0.0005658253, 0, 1, 0.4235294, 1,
-0.2271183, 0.3426439, -0.7670987, 0, 1, 0.4313726, 1,
-0.2269773, 1.897936, 0.3625474, 0, 1, 0.4352941, 1,
-0.224759, 0.6702011, -0.4364941, 0, 1, 0.4431373, 1,
-0.2236173, -0.4697468, -3.314241, 0, 1, 0.4470588, 1,
-0.219615, 1.169497, 0.496471, 0, 1, 0.454902, 1,
-0.2144605, -1.061571, -5.060162, 0, 1, 0.4588235, 1,
-0.2141801, 0.5492396, 1.093729, 0, 1, 0.4666667, 1,
-0.2132556, -0.3928098, -1.569234, 0, 1, 0.4705882, 1,
-0.2098899, 0.2791062, 0.2247021, 0, 1, 0.4784314, 1,
-0.2095725, 0.2843205, 0.08632496, 0, 1, 0.4823529, 1,
-0.2091463, -0.7316729, -2.062394, 0, 1, 0.4901961, 1,
-0.2057114, -0.7153187, -3.770796, 0, 1, 0.4941176, 1,
-0.2045722, 0.7765077, -0.05862696, 0, 1, 0.5019608, 1,
-0.2014661, 0.9197275, 1.217497, 0, 1, 0.509804, 1,
-0.1995858, 1.679996, -1.544174, 0, 1, 0.5137255, 1,
-0.1938859, 0.2958795, -0.8779236, 0, 1, 0.5215687, 1,
-0.1871292, -0.6845547, -3.542343, 0, 1, 0.5254902, 1,
-0.1807545, 0.8354924, 0.2376224, 0, 1, 0.5333334, 1,
-0.1784497, 0.6166047, 0.57586, 0, 1, 0.5372549, 1,
-0.1766727, -0.09484229, -2.066789, 0, 1, 0.5450981, 1,
-0.1736972, -0.3836386, -2.733742, 0, 1, 0.5490196, 1,
-0.1722988, 0.3181126, 2.540253, 0, 1, 0.5568628, 1,
-0.1676393, 0.3014739, -0.2027919, 0, 1, 0.5607843, 1,
-0.1671718, -0.3847077, -2.229036, 0, 1, 0.5686275, 1,
-0.1667793, -0.1039936, -3.601059, 0, 1, 0.572549, 1,
-0.1655959, -0.3047769, -3.378999, 0, 1, 0.5803922, 1,
-0.1642767, 0.3660146, -1.098123, 0, 1, 0.5843138, 1,
-0.1633056, -0.09852935, -2.841608, 0, 1, 0.5921569, 1,
-0.159829, -0.560806, -2.969811, 0, 1, 0.5960785, 1,
-0.1569793, -0.7461181, -3.767431, 0, 1, 0.6039216, 1,
-0.1536345, 0.4370214, -0.2685838, 0, 1, 0.6117647, 1,
-0.1488781, -0.6303071, -3.442955, 0, 1, 0.6156863, 1,
-0.1462792, -0.867466, -4.256889, 0, 1, 0.6235294, 1,
-0.1434781, -0.3329231, -2.56553, 0, 1, 0.627451, 1,
-0.1427555, 0.8656958, -0.8194615, 0, 1, 0.6352941, 1,
-0.142573, 0.2291784, -1.268669, 0, 1, 0.6392157, 1,
-0.1376795, -0.2538238, -2.667792, 0, 1, 0.6470588, 1,
-0.1365012, -0.6261327, -4.393414, 0, 1, 0.6509804, 1,
-0.1262854, -0.8089776, -0.7406514, 0, 1, 0.6588235, 1,
-0.1244794, 1.171901, -0.6915109, 0, 1, 0.6627451, 1,
-0.1242606, 0.2824479, 0.7999033, 0, 1, 0.6705883, 1,
-0.1211152, -0.3847525, -3.384204, 0, 1, 0.6745098, 1,
-0.1148926, 1.708559, 1.861917, 0, 1, 0.682353, 1,
-0.1137954, -0.8385838, -2.714279, 0, 1, 0.6862745, 1,
-0.1137564, -0.7966607, -3.91946, 0, 1, 0.6941177, 1,
-0.1066026, -0.1119837, -0.1968694, 0, 1, 0.7019608, 1,
-0.1038244, -0.8616015, -3.410736, 0, 1, 0.7058824, 1,
-0.1025489, -1.220703, -3.547265, 0, 1, 0.7137255, 1,
-0.09885201, 0.5082338, 0.3294216, 0, 1, 0.7176471, 1,
-0.09873441, 0.1744219, -1.111211, 0, 1, 0.7254902, 1,
-0.09037183, 1.308756, 1.908444, 0, 1, 0.7294118, 1,
-0.08601104, 1.020357, -0.6829166, 0, 1, 0.7372549, 1,
-0.08592349, -0.7974967, -3.810393, 0, 1, 0.7411765, 1,
-0.08289136, 0.7622738, 1.517012, 0, 1, 0.7490196, 1,
-0.07753522, 1.347849, -1.253276, 0, 1, 0.7529412, 1,
-0.07375887, -0.6874614, -2.089605, 0, 1, 0.7607843, 1,
-0.07092186, 1.412381, -1.53481, 0, 1, 0.7647059, 1,
-0.07002963, 0.8392441, 0.0912187, 0, 1, 0.772549, 1,
-0.0629235, 1.777792, 0.6200817, 0, 1, 0.7764706, 1,
-0.06012206, 1.339571, -1.042425, 0, 1, 0.7843137, 1,
-0.05666379, -0.2583796, -3.016982, 0, 1, 0.7882353, 1,
-0.05597225, -0.2661965, -2.04448, 0, 1, 0.7960784, 1,
-0.05354123, 0.1876013, -0.1775827, 0, 1, 0.8039216, 1,
-0.04880982, -0.1136556, -2.06898, 0, 1, 0.8078431, 1,
-0.04574201, -0.8336213, -2.777307, 0, 1, 0.8156863, 1,
-0.04267309, 0.1809955, -1.408219, 0, 1, 0.8196079, 1,
-0.04158003, 1.13129, -1.657729, 0, 1, 0.827451, 1,
-0.03471466, 1.171784, -1.054709, 0, 1, 0.8313726, 1,
-0.03354565, 0.04656291, 0.4069076, 0, 1, 0.8392157, 1,
-0.02945492, 0.635913, -0.1316666, 0, 1, 0.8431373, 1,
-0.02206749, -0.9368236, -4.720956, 0, 1, 0.8509804, 1,
-0.01973927, -0.7331102, -2.344659, 0, 1, 0.854902, 1,
-0.01623684, 1.472849, -0.3853292, 0, 1, 0.8627451, 1,
-0.0138708, 1.917107, 0.6179041, 0, 1, 0.8666667, 1,
-0.00179153, -1.397257, -3.939566, 0, 1, 0.8745098, 1,
-0.001249739, -0.3251176, -2.075927, 0, 1, 0.8784314, 1,
-0.001215242, -0.3601446, -2.261829, 0, 1, 0.8862745, 1,
0.002170291, -0.293161, 4.520844, 0, 1, 0.8901961, 1,
0.004527932, -1.276319, 2.477353, 0, 1, 0.8980392, 1,
0.008549216, 0.9522764, 0.6106209, 0, 1, 0.9058824, 1,
0.009400296, -0.1295337, 2.901557, 0, 1, 0.9098039, 1,
0.01079286, -0.2847086, 3.945728, 0, 1, 0.9176471, 1,
0.01088575, -0.1530449, 2.908945, 0, 1, 0.9215686, 1,
0.01380472, -0.09551693, 4.397522, 0, 1, 0.9294118, 1,
0.01439478, 0.02491871, 1.484835, 0, 1, 0.9333333, 1,
0.01594128, 0.9716919, -1.321636, 0, 1, 0.9411765, 1,
0.01742077, -1.147951, 3.095373, 0, 1, 0.945098, 1,
0.01878325, -0.3956702, 2.878313, 0, 1, 0.9529412, 1,
0.02073404, -1.680459, 4.653311, 0, 1, 0.9568627, 1,
0.02155996, 0.1025971, 0.4893696, 0, 1, 0.9647059, 1,
0.02333291, -0.1687596, 2.84724, 0, 1, 0.9686275, 1,
0.03151562, -1.935494, 3.389402, 0, 1, 0.9764706, 1,
0.03213737, 0.6405367, 0.9697516, 0, 1, 0.9803922, 1,
0.03819169, 1.087127, -0.8174701, 0, 1, 0.9882353, 1,
0.04832711, -0.5335296, 5.11284, 0, 1, 0.9921569, 1,
0.04848031, -0.2818823, 1.571679, 0, 1, 1, 1,
0.04985137, 1.264606, -0.8137237, 0, 0.9921569, 1, 1,
0.05044966, -0.938092, 2.358305, 0, 0.9882353, 1, 1,
0.0542923, 0.6933382, 0.4849794, 0, 0.9803922, 1, 1,
0.06012134, 1.872029, 0.9241869, 0, 0.9764706, 1, 1,
0.0633513, 0.2647982, 2.072563, 0, 0.9686275, 1, 1,
0.06335884, -0.2862207, 2.62193, 0, 0.9647059, 1, 1,
0.0634395, 1.894188, 1.144795, 0, 0.9568627, 1, 1,
0.06489111, 0.5847412, -0.4662085, 0, 0.9529412, 1, 1,
0.0673033, -0.1144122, 1.984292, 0, 0.945098, 1, 1,
0.06906198, -1.16844, 3.196363, 0, 0.9411765, 1, 1,
0.06939001, 1.821698, 1.834712, 0, 0.9333333, 1, 1,
0.07398961, -0.22623, 3.509281, 0, 0.9294118, 1, 1,
0.07618291, -0.1383568, 3.342129, 0, 0.9215686, 1, 1,
0.07659588, 0.5473208, -1.205097, 0, 0.9176471, 1, 1,
0.07784532, -0.7486202, 1.8244, 0, 0.9098039, 1, 1,
0.07854381, -1.125996, 3.440628, 0, 0.9058824, 1, 1,
0.08191074, 1.310772, -0.8165488, 0, 0.8980392, 1, 1,
0.08354981, 0.5410521, 0.8189428, 0, 0.8901961, 1, 1,
0.08371554, 2.344459, 1.625488, 0, 0.8862745, 1, 1,
0.08425301, 0.8266399, -0.5443929, 0, 0.8784314, 1, 1,
0.08500449, 0.5532246, 0.7246907, 0, 0.8745098, 1, 1,
0.08667441, -1.073223, 4.07591, 0, 0.8666667, 1, 1,
0.09115136, -0.06511813, 1.938621, 0, 0.8627451, 1, 1,
0.0934724, 0.790043, 0.8656417, 0, 0.854902, 1, 1,
0.09453167, -0.3685909, 2.080072, 0, 0.8509804, 1, 1,
0.09559344, 1.25001, 0.4660823, 0, 0.8431373, 1, 1,
0.0966107, 1.361657, -0.07815564, 0, 0.8392157, 1, 1,
0.09825079, -2.64076, 2.652556, 0, 0.8313726, 1, 1,
0.09886511, -1.752748, 3.411954, 0, 0.827451, 1, 1,
0.1047226, 0.9036962, -0.7475742, 0, 0.8196079, 1, 1,
0.113857, -0.3001904, 0.3313341, 0, 0.8156863, 1, 1,
0.1143247, 0.8303727, 0.6688783, 0, 0.8078431, 1, 1,
0.1172364, -0.06637895, 2.545972, 0, 0.8039216, 1, 1,
0.1180493, -1.21002, 2.977533, 0, 0.7960784, 1, 1,
0.1195088, 0.6943104, -0.1882379, 0, 0.7882353, 1, 1,
0.1198652, 0.5328454, 0.1120226, 0, 0.7843137, 1, 1,
0.1209893, 0.3660184, 0.7143973, 0, 0.7764706, 1, 1,
0.1212311, 0.164858, 1.610435, 0, 0.772549, 1, 1,
0.1229835, 0.1711712, -0.958813, 0, 0.7647059, 1, 1,
0.1243297, 0.9795465, -0.8143707, 0, 0.7607843, 1, 1,
0.1265878, -0.03084333, 1.152865, 0, 0.7529412, 1, 1,
0.1291734, -0.02236747, 2.551181, 0, 0.7490196, 1, 1,
0.13484, -1.857389, 4.54013, 0, 0.7411765, 1, 1,
0.1481466, -1.505837, 3.257989, 0, 0.7372549, 1, 1,
0.1505182, 0.03638339, 2.860269, 0, 0.7294118, 1, 1,
0.150639, 1.442456, 2.47352, 0, 0.7254902, 1, 1,
0.1512337, 0.1519947, 0.04873086, 0, 0.7176471, 1, 1,
0.1538454, -0.1389273, 0.5602152, 0, 0.7137255, 1, 1,
0.1538543, 0.8774252, 0.7475697, 0, 0.7058824, 1, 1,
0.154737, -1.197778, 2.66084, 0, 0.6980392, 1, 1,
0.1587103, -0.3149851, 3.738724, 0, 0.6941177, 1, 1,
0.1602719, 0.5566776, -1.356415, 0, 0.6862745, 1, 1,
0.1603824, -0.9460483, 3.94057, 0, 0.682353, 1, 1,
0.164313, -0.7939421, 2.501117, 0, 0.6745098, 1, 1,
0.1662366, 1.851445, -0.2877502, 0, 0.6705883, 1, 1,
0.1667668, 0.8066671, -0.1053366, 0, 0.6627451, 1, 1,
0.1692294, -0.5275064, 3.418774, 0, 0.6588235, 1, 1,
0.1703027, -1.983239, 3.542152, 0, 0.6509804, 1, 1,
0.1733264, 0.7619388, -0.4978828, 0, 0.6470588, 1, 1,
0.1749001, 0.8066918, 0.6294628, 0, 0.6392157, 1, 1,
0.1755993, 0.4738009, 0.8036487, 0, 0.6352941, 1, 1,
0.1781105, 0.4311731, 0.1537458, 0, 0.627451, 1, 1,
0.1781276, 0.8406012, -0.1476182, 0, 0.6235294, 1, 1,
0.1782895, 1.065965, -0.05561852, 0, 0.6156863, 1, 1,
0.1851357, 0.9753826, -0.6200564, 0, 0.6117647, 1, 1,
0.1884392, 1.719754, 0.176494, 0, 0.6039216, 1, 1,
0.1937971, 1.401914, -2.09331, 0, 0.5960785, 1, 1,
0.2045868, 2.526759, -1.094638, 0, 0.5921569, 1, 1,
0.2058449, -0.2496274, 1.532422, 0, 0.5843138, 1, 1,
0.212924, -0.5981076, 2.650634, 0, 0.5803922, 1, 1,
0.2170157, -1.386985, 2.633255, 0, 0.572549, 1, 1,
0.2251022, 0.2107941, 2.197206, 0, 0.5686275, 1, 1,
0.2265671, 0.465101, -1.138031, 0, 0.5607843, 1, 1,
0.2279266, 1.51069, 0.03119523, 0, 0.5568628, 1, 1,
0.2379717, 0.6132512, 1.136527, 0, 0.5490196, 1, 1,
0.239407, -0.5290862, 1.316897, 0, 0.5450981, 1, 1,
0.239517, -1.614563, 1.98598, 0, 0.5372549, 1, 1,
0.2417375, 0.289822, 0.5702536, 0, 0.5333334, 1, 1,
0.2427469, 3.218274, 0.652451, 0, 0.5254902, 1, 1,
0.2479223, -0.649572, 2.790128, 0, 0.5215687, 1, 1,
0.2516917, 0.03797068, 1.780759, 0, 0.5137255, 1, 1,
0.2533505, 1.105098, 0.7242647, 0, 0.509804, 1, 1,
0.2544888, -0.7824115, 3.103029, 0, 0.5019608, 1, 1,
0.2554875, 0.1831881, 1.096457, 0, 0.4941176, 1, 1,
0.2562878, 0.9698108, 0.3342514, 0, 0.4901961, 1, 1,
0.2586455, 0.03730908, 1.101573, 0, 0.4823529, 1, 1,
0.2589684, 0.05090188, 0.4000911, 0, 0.4784314, 1, 1,
0.2603096, 0.8015173, -0.8312488, 0, 0.4705882, 1, 1,
0.2614801, -0.1486405, 2.217446, 0, 0.4666667, 1, 1,
0.2660302, -1.592667, 3.357877, 0, 0.4588235, 1, 1,
0.2674294, 0.5332583, 0.07130485, 0, 0.454902, 1, 1,
0.2819534, -0.01217332, 1.129546, 0, 0.4470588, 1, 1,
0.2824091, 0.340837, 2.11717, 0, 0.4431373, 1, 1,
0.2858943, 0.4940047, 2.080637, 0, 0.4352941, 1, 1,
0.2864526, 0.2018334, 0.2432563, 0, 0.4313726, 1, 1,
0.2900202, -1.530661, 4.03921, 0, 0.4235294, 1, 1,
0.2901615, 1.252663, 1.153846, 0, 0.4196078, 1, 1,
0.2928989, 0.08596269, 2.09798, 0, 0.4117647, 1, 1,
0.3069754, 0.2884019, -0.2651579, 0, 0.4078431, 1, 1,
0.3096229, -1.223003, 4.062723, 0, 0.4, 1, 1,
0.3106041, 1.604701, 0.2173658, 0, 0.3921569, 1, 1,
0.3159729, 1.24626, -0.27709, 0, 0.3882353, 1, 1,
0.3187474, -0.1024422, 2.732792, 0, 0.3803922, 1, 1,
0.3206406, 0.7925816, -0.5986873, 0, 0.3764706, 1, 1,
0.3213569, 1.290735, 0.5708344, 0, 0.3686275, 1, 1,
0.3244993, 0.4327546, -1.003093, 0, 0.3647059, 1, 1,
0.3261538, 0.656521, -0.3448731, 0, 0.3568628, 1, 1,
0.3282298, 1.097297, 0.8047234, 0, 0.3529412, 1, 1,
0.3295454, 1.245531, 0.6730497, 0, 0.345098, 1, 1,
0.3300104, 0.3774989, -1.987976, 0, 0.3411765, 1, 1,
0.3329035, 0.755931, 2.184185, 0, 0.3333333, 1, 1,
0.3338127, -0.3985215, 3.074115, 0, 0.3294118, 1, 1,
0.3351025, -0.6318831, 2.931734, 0, 0.3215686, 1, 1,
0.3355457, -0.8943126, 5.334704, 0, 0.3176471, 1, 1,
0.3376892, 0.7745249, 2.63701, 0, 0.3098039, 1, 1,
0.3377529, -2.049341, 3.027326, 0, 0.3058824, 1, 1,
0.3380095, 0.4031005, -0.9310232, 0, 0.2980392, 1, 1,
0.3465784, -0.7085129, 1.496641, 0, 0.2901961, 1, 1,
0.3468102, -0.176792, 1.780447, 0, 0.2862745, 1, 1,
0.3478461, -0.563114, 1.589107, 0, 0.2784314, 1, 1,
0.3610925, -0.3673989, 0.5785723, 0, 0.2745098, 1, 1,
0.3613209, 1.476952, 1.873117, 0, 0.2666667, 1, 1,
0.3668635, 0.8536842, 0.6073003, 0, 0.2627451, 1, 1,
0.3698072, 1.061872, 0.2198855, 0, 0.254902, 1, 1,
0.3700982, -0.510569, 0.440321, 0, 0.2509804, 1, 1,
0.3703873, -0.08265367, 2.421294, 0, 0.2431373, 1, 1,
0.3716857, 0.4069995, 1.545995, 0, 0.2392157, 1, 1,
0.3736801, 0.7433475, 0.7663181, 0, 0.2313726, 1, 1,
0.3761284, 0.4136686, -0.1645943, 0, 0.227451, 1, 1,
0.3761352, 0.903526, 0.01040785, 0, 0.2196078, 1, 1,
0.3772234, -1.603302, 3.380812, 0, 0.2156863, 1, 1,
0.3779422, -3.267439, 2.957841, 0, 0.2078431, 1, 1,
0.3779915, 0.1658203, 1.332538, 0, 0.2039216, 1, 1,
0.3780424, 1.230996, 0.2895696, 0, 0.1960784, 1, 1,
0.3792754, -0.8304569, 4.015534, 0, 0.1882353, 1, 1,
0.3795013, -1.200284, 3.874637, 0, 0.1843137, 1, 1,
0.380138, -0.530791, 4.167544, 0, 0.1764706, 1, 1,
0.3876315, -0.7219618, 1.109152, 0, 0.172549, 1, 1,
0.388181, 1.136574, -0.5861894, 0, 0.1647059, 1, 1,
0.3903103, -0.9692322, 3.852463, 0, 0.1607843, 1, 1,
0.3938202, 1.793271, -1.218627, 0, 0.1529412, 1, 1,
0.3976606, 0.4074142, -0.1021154, 0, 0.1490196, 1, 1,
0.4005414, 0.9561282, 0.6842343, 0, 0.1411765, 1, 1,
0.4026845, -0.3137575, 0.6946774, 0, 0.1372549, 1, 1,
0.4039774, 0.1261371, 0.7444775, 0, 0.1294118, 1, 1,
0.4109195, -1.138208, 2.842913, 0, 0.1254902, 1, 1,
0.4127345, -1.612785, 3.909499, 0, 0.1176471, 1, 1,
0.4190972, -0.8536198, 2.687748, 0, 0.1137255, 1, 1,
0.4206945, -0.714811, 4.614348, 0, 0.1058824, 1, 1,
0.4208249, 1.66397, 0.4419975, 0, 0.09803922, 1, 1,
0.4300654, 1.461653, 0.4655896, 0, 0.09411765, 1, 1,
0.4317831, -0.3904766, 0.5834885, 0, 0.08627451, 1, 1,
0.4324575, 0.272441, 0.2311728, 0, 0.08235294, 1, 1,
0.4350863, 1.476997, 1.639917, 0, 0.07450981, 1, 1,
0.4352829, 1.3041, -0.9934391, 0, 0.07058824, 1, 1,
0.4355579, -0.1259461, 2.416306, 0, 0.0627451, 1, 1,
0.4410095, -0.06016225, 2.038414, 0, 0.05882353, 1, 1,
0.4436895, 0.8878873, 1.709718, 0, 0.05098039, 1, 1,
0.4563199, -0.3661015, 1.405411, 0, 0.04705882, 1, 1,
0.4602313, 0.3131843, 1.581837, 0, 0.03921569, 1, 1,
0.4656594, 0.1216813, 0.0275032, 0, 0.03529412, 1, 1,
0.4704028, 0.5562193, 0.3370364, 0, 0.02745098, 1, 1,
0.4721402, -1.409305, 2.069658, 0, 0.02352941, 1, 1,
0.4744855, 0.718437, 1.845321, 0, 0.01568628, 1, 1,
0.4760046, 0.6186488, 0.4636084, 0, 0.01176471, 1, 1,
0.479882, -1.311018, 1.999776, 0, 0.003921569, 1, 1,
0.4843857, -0.736786, 2.400463, 0.003921569, 0, 1, 1,
0.486831, 0.660325, 0.004998491, 0.007843138, 0, 1, 1,
0.4872155, 1.015806, 0.554523, 0.01568628, 0, 1, 1,
0.4977785, 0.830267, 0.7212847, 0.01960784, 0, 1, 1,
0.5019812, -0.08321369, 1.282561, 0.02745098, 0, 1, 1,
0.5075865, 0.05081679, 0.5385825, 0.03137255, 0, 1, 1,
0.5077265, 0.6724294, 1.377725, 0.03921569, 0, 1, 1,
0.5097607, 0.5448711, 2.327491, 0.04313726, 0, 1, 1,
0.5112198, 0.7974043, 2.015099, 0.05098039, 0, 1, 1,
0.5116404, -0.7470474, 2.053167, 0.05490196, 0, 1, 1,
0.5165748, -0.3925251, 4.036694, 0.0627451, 0, 1, 1,
0.5197042, -0.2049287, 3.721563, 0.06666667, 0, 1, 1,
0.5212771, 0.6341585, 0.07524298, 0.07450981, 0, 1, 1,
0.5214029, -0.5037079, 3.750061, 0.07843138, 0, 1, 1,
0.5232944, 0.7980877, 0.2243769, 0.08627451, 0, 1, 1,
0.5263681, 0.07755928, 0.7159145, 0.09019608, 0, 1, 1,
0.5318719, 0.05633565, 2.40643, 0.09803922, 0, 1, 1,
0.5355041, 0.3067606, 0.2601171, 0.1058824, 0, 1, 1,
0.5375791, -0.1318052, 1.136179, 0.1098039, 0, 1, 1,
0.5384169, -1.262439, 2.848765, 0.1176471, 0, 1, 1,
0.5468266, 0.2824498, 1.631643, 0.1215686, 0, 1, 1,
0.551087, 0.8762119, 0.5132461, 0.1294118, 0, 1, 1,
0.553, 0.5840867, 0.9386128, 0.1333333, 0, 1, 1,
0.5530503, 3.22455, 0.3301028, 0.1411765, 0, 1, 1,
0.5569789, -0.8218411, 1.870039, 0.145098, 0, 1, 1,
0.5602302, 0.3437614, 1.339962, 0.1529412, 0, 1, 1,
0.560779, -1.367, 0.9223435, 0.1568628, 0, 1, 1,
0.5635858, -1.308436, 2.905938, 0.1647059, 0, 1, 1,
0.5653835, -0.2478046, 2.655495, 0.1686275, 0, 1, 1,
0.5717854, 1.777008, -0.7535596, 0.1764706, 0, 1, 1,
0.5726185, 0.4363985, 0.6621078, 0.1803922, 0, 1, 1,
0.5736198, 0.6568097, -0.6836844, 0.1882353, 0, 1, 1,
0.5787036, -0.8227754, 2.200953, 0.1921569, 0, 1, 1,
0.5806891, -0.02105323, -0.5541039, 0.2, 0, 1, 1,
0.5816988, -0.413043, 1.357548, 0.2078431, 0, 1, 1,
0.587749, -0.9832285, 2.021166, 0.2117647, 0, 1, 1,
0.5927662, 0.8564694, -0.3042427, 0.2196078, 0, 1, 1,
0.5977111, 0.6921919, -0.7687379, 0.2235294, 0, 1, 1,
0.6056651, -0.2587747, 1.075998, 0.2313726, 0, 1, 1,
0.6060685, -0.2166797, 2.009336, 0.2352941, 0, 1, 1,
0.618113, 0.9505177, 1.195024, 0.2431373, 0, 1, 1,
0.6194369, -0.1243122, 3.232414, 0.2470588, 0, 1, 1,
0.6232473, 0.00736805, 1.575011, 0.254902, 0, 1, 1,
0.6239471, -1.073473, 1.559888, 0.2588235, 0, 1, 1,
0.6260549, 1.296353, 0.6495385, 0.2666667, 0, 1, 1,
0.6279404, 0.7902922, 1.886934, 0.2705882, 0, 1, 1,
0.6312381, 0.1648493, 0.7349215, 0.2784314, 0, 1, 1,
0.6324955, 0.5289253, 0.3013662, 0.282353, 0, 1, 1,
0.6342881, -0.1654035, 3.954891, 0.2901961, 0, 1, 1,
0.6350808, 0.9041674, -0.2160317, 0.2941177, 0, 1, 1,
0.6358424, -0.06134903, -0.2983051, 0.3019608, 0, 1, 1,
0.6387378, 0.4615663, 1.280661, 0.3098039, 0, 1, 1,
0.6397127, -0.1901729, 0.998529, 0.3137255, 0, 1, 1,
0.6437688, -1.455364, 3.718015, 0.3215686, 0, 1, 1,
0.6446908, -1.236886, 1.477026, 0.3254902, 0, 1, 1,
0.6491055, 0.1487932, 2.577378, 0.3333333, 0, 1, 1,
0.6502532, -0.8591157, 1.057271, 0.3372549, 0, 1, 1,
0.6540703, 0.3099361, 2.87287, 0.345098, 0, 1, 1,
0.6555137, 0.5291716, 1.629165, 0.3490196, 0, 1, 1,
0.6566189, -0.9778574, 2.990982, 0.3568628, 0, 1, 1,
0.6599211, 0.9534425, 1.000866, 0.3607843, 0, 1, 1,
0.662142, -0.9488054, 3.394426, 0.3686275, 0, 1, 1,
0.6636209, 1.86359, 1.030129, 0.372549, 0, 1, 1,
0.6664442, -0.960147, 1.41092, 0.3803922, 0, 1, 1,
0.6705561, 0.5776436, 0.3547591, 0.3843137, 0, 1, 1,
0.6765791, -1.299616, 2.915957, 0.3921569, 0, 1, 1,
0.6783401, -0.6789067, 3.647822, 0.3960784, 0, 1, 1,
0.6797075, -0.4741802, 3.04253, 0.4039216, 0, 1, 1,
0.6802951, 0.104345, 1.740761, 0.4117647, 0, 1, 1,
0.6863189, -1.291018, 2.636474, 0.4156863, 0, 1, 1,
0.6888598, 0.1593174, 2.021162, 0.4235294, 0, 1, 1,
0.6964892, -1.629732, 1.956271, 0.427451, 0, 1, 1,
0.6966416, -1.678721, 2.787669, 0.4352941, 0, 1, 1,
0.6968582, 0.55042, -0.1203992, 0.4392157, 0, 1, 1,
0.7013476, -1.312559, 1.028997, 0.4470588, 0, 1, 1,
0.7037466, -0.5142605, 3.729799, 0.4509804, 0, 1, 1,
0.7102104, -0.898874, 2.378829, 0.4588235, 0, 1, 1,
0.7152691, 0.1910027, 1.447667, 0.4627451, 0, 1, 1,
0.7158279, 0.1383284, 2.907542, 0.4705882, 0, 1, 1,
0.7171592, 0.1655233, 0.6607307, 0.4745098, 0, 1, 1,
0.7197853, 0.007956007, 2.383097, 0.4823529, 0, 1, 1,
0.7223345, 0.3743357, 1.445513, 0.4862745, 0, 1, 1,
0.7227774, -1.349213, -0.2382707, 0.4941176, 0, 1, 1,
0.7248591, -1.499276, 3.727052, 0.5019608, 0, 1, 1,
0.7299007, 0.00236038, 0.2207082, 0.5058824, 0, 1, 1,
0.7309589, 1.886789, 0.6719478, 0.5137255, 0, 1, 1,
0.7377136, 0.2430877, 2.934302, 0.5176471, 0, 1, 1,
0.7378291, 0.9525021, 0.7684147, 0.5254902, 0, 1, 1,
0.7476196, -1.104674, 4.181192, 0.5294118, 0, 1, 1,
0.7525926, 0.0683203, 0.8146937, 0.5372549, 0, 1, 1,
0.7550864, 0.513769, -0.5481945, 0.5411765, 0, 1, 1,
0.7679425, -0.2885974, 2.394491, 0.5490196, 0, 1, 1,
0.7689282, 1.386772, -0.2865063, 0.5529412, 0, 1, 1,
0.7725559, -0.242388, 0.6352858, 0.5607843, 0, 1, 1,
0.7727699, 0.7937411, 0.7843456, 0.5647059, 0, 1, 1,
0.7731844, 1.471486, 1.536578, 0.572549, 0, 1, 1,
0.7756487, -0.05841605, 0.2419657, 0.5764706, 0, 1, 1,
0.7769293, -1.286403, 2.923286, 0.5843138, 0, 1, 1,
0.7803273, 0.005035558, 0.113901, 0.5882353, 0, 1, 1,
0.7835038, -0.8615634, -0.2109836, 0.5960785, 0, 1, 1,
0.7836796, -0.3692765, 1.654526, 0.6039216, 0, 1, 1,
0.7899238, -0.6885214, 2.969486, 0.6078432, 0, 1, 1,
0.7908649, 0.3191855, 2.379649, 0.6156863, 0, 1, 1,
0.7941527, -1.332609, 4.631855, 0.6196079, 0, 1, 1,
0.7982717, 0.1339453, -0.4368989, 0.627451, 0, 1, 1,
0.7983128, -0.4332123, 1.843735, 0.6313726, 0, 1, 1,
0.7986467, 1.502567, -0.1819811, 0.6392157, 0, 1, 1,
0.8127875, -0.1144812, 0.4683084, 0.6431373, 0, 1, 1,
0.8151999, -0.9299309, 1.958885, 0.6509804, 0, 1, 1,
0.8171537, -0.6623561, 2.44079, 0.654902, 0, 1, 1,
0.8177949, 0.8228399, 2.385449, 0.6627451, 0, 1, 1,
0.8253684, -0.2214005, 1.806308, 0.6666667, 0, 1, 1,
0.8258104, 1.213176, 0.06197744, 0.6745098, 0, 1, 1,
0.8333628, -0.2876608, 2.728729, 0.6784314, 0, 1, 1,
0.834585, -0.1699004, 0.6786276, 0.6862745, 0, 1, 1,
0.8395271, 0.2263956, 1.27761, 0.6901961, 0, 1, 1,
0.845502, -1.334439, 4.448412, 0.6980392, 0, 1, 1,
0.8469484, -2.29548, 1.848699, 0.7058824, 0, 1, 1,
0.85137, -0.886118, 4.123132, 0.7098039, 0, 1, 1,
0.853897, -0.3781718, 1.178933, 0.7176471, 0, 1, 1,
0.8544278, 0.1360234, 0.4462094, 0.7215686, 0, 1, 1,
0.8600748, -0.5446283, 3.191362, 0.7294118, 0, 1, 1,
0.8613388, 0.8403947, 1.41409, 0.7333333, 0, 1, 1,
0.8675167, 0.03937122, 1.835297, 0.7411765, 0, 1, 1,
0.8677443, -0.5103034, 0.9289708, 0.7450981, 0, 1, 1,
0.8735896, 1.09738, -0.5604104, 0.7529412, 0, 1, 1,
0.8758348, 0.00907542, 2.167112, 0.7568628, 0, 1, 1,
0.8764169, 0.1695798, 2.098886, 0.7647059, 0, 1, 1,
0.8772676, -0.06527498, 0.6950336, 0.7686275, 0, 1, 1,
0.8853005, 0.2146643, 1.252239, 0.7764706, 0, 1, 1,
0.8880738, -0.3430408, 2.103945, 0.7803922, 0, 1, 1,
0.8891585, -1.085752, 1.390895, 0.7882353, 0, 1, 1,
0.8891812, -0.912002, 1.481854, 0.7921569, 0, 1, 1,
0.9067647, -0.7717518, 2.826154, 0.8, 0, 1, 1,
0.9231634, -2.217333, 3.743275, 0.8078431, 0, 1, 1,
0.9277106, -0.1329719, 1.932209, 0.8117647, 0, 1, 1,
0.9347122, -0.4208856, 1.747912, 0.8196079, 0, 1, 1,
0.9390294, 0.08882663, 0.01401191, 0.8235294, 0, 1, 1,
0.9399173, -1.352713, 2.081392, 0.8313726, 0, 1, 1,
0.9504432, -0.102534, 1.806415, 0.8352941, 0, 1, 1,
0.9567201, 1.773471, 2.121054, 0.8431373, 0, 1, 1,
0.9608877, 1.279233, -0.1673206, 0.8470588, 0, 1, 1,
0.9645497, -0.07195422, 0.6922312, 0.854902, 0, 1, 1,
0.9650076, -0.7007697, 1.581902, 0.8588235, 0, 1, 1,
0.9669084, 1.210647, -0.05613679, 0.8666667, 0, 1, 1,
0.9734941, -1.84893, 2.920574, 0.8705882, 0, 1, 1,
0.9756027, 0.5761276, 1.620226, 0.8784314, 0, 1, 1,
0.9820054, 0.5703886, -0.08858807, 0.8823529, 0, 1, 1,
0.9857798, 1.034502, 0.8025981, 0.8901961, 0, 1, 1,
0.9882336, 0.5121651, 1.10297, 0.8941177, 0, 1, 1,
0.9888051, 0.08476133, 1.239734, 0.9019608, 0, 1, 1,
0.9991663, -0.6986305, 2.52013, 0.9098039, 0, 1, 1,
0.999426, 1.336275, 1.024902, 0.9137255, 0, 1, 1,
1.005899, 0.6045914, 2.030854, 0.9215686, 0, 1, 1,
1.015257, -1.368843, 3.862992, 0.9254902, 0, 1, 1,
1.017687, -1.605992, 1.682208, 0.9333333, 0, 1, 1,
1.017792, 0.6336596, 2.839134, 0.9372549, 0, 1, 1,
1.018853, 0.02192986, 3.568533, 0.945098, 0, 1, 1,
1.021819, 2.21666, 1.045117, 0.9490196, 0, 1, 1,
1.02397, -0.05203124, 2.058821, 0.9568627, 0, 1, 1,
1.038105, -0.7087041, 2.777908, 0.9607843, 0, 1, 1,
1.038115, 0.1316644, 1.905336, 0.9686275, 0, 1, 1,
1.042071, 1.034798, 1.597043, 0.972549, 0, 1, 1,
1.045265, 0.827806, 2.137211, 0.9803922, 0, 1, 1,
1.058997, -0.5513139, 1.067366, 0.9843137, 0, 1, 1,
1.062476, -1.385933, 2.484309, 0.9921569, 0, 1, 1,
1.064743, 0.5252013, 1.186471, 0.9960784, 0, 1, 1,
1.070191, -0.6718263, 2.202962, 1, 0, 0.9960784, 1,
1.070923, 1.886391, 0.8767058, 1, 0, 0.9882353, 1,
1.072895, 0.2657732, 1.307214, 1, 0, 0.9843137, 1,
1.074547, 1.489116, -0.02932227, 1, 0, 0.9764706, 1,
1.077312, 0.01668358, 2.410764, 1, 0, 0.972549, 1,
1.080613, -0.6945269, 1.623566, 1, 0, 0.9647059, 1,
1.0847, -1.516275, 1.932947, 1, 0, 0.9607843, 1,
1.087283, -0.4744137, 1.197114, 1, 0, 0.9529412, 1,
1.092397, 0.02044372, 1.78797, 1, 0, 0.9490196, 1,
1.099294, 0.5936521, 2.639141, 1, 0, 0.9411765, 1,
1.099991, 0.4647914, 2.128072, 1, 0, 0.9372549, 1,
1.100565, -0.2476326, 2.853393, 1, 0, 0.9294118, 1,
1.10649, -0.9257015, 2.137544, 1, 0, 0.9254902, 1,
1.108886, -0.3649189, 0.1071139, 1, 0, 0.9176471, 1,
1.110801, -0.6997589, 2.316338, 1, 0, 0.9137255, 1,
1.11085, -0.1134673, 1.262356, 1, 0, 0.9058824, 1,
1.113325, -1.621739, 4.217984, 1, 0, 0.9019608, 1,
1.115621, 0.72211, 0.129654, 1, 0, 0.8941177, 1,
1.117376, 0.1238364, 0.2174299, 1, 0, 0.8862745, 1,
1.123329, -1.059259, 3.063052, 1, 0, 0.8823529, 1,
1.12692, 0.63178, 1.263053, 1, 0, 0.8745098, 1,
1.129807, 0.03584753, 0.7733929, 1, 0, 0.8705882, 1,
1.13251, -0.8935668, 2.118148, 1, 0, 0.8627451, 1,
1.1345, 0.2937854, 1.758292, 1, 0, 0.8588235, 1,
1.135439, -0.7716161, 2.206442, 1, 0, 0.8509804, 1,
1.135882, 0.1434828, -0.5431542, 1, 0, 0.8470588, 1,
1.136601, 0.109061, -0.4931017, 1, 0, 0.8392157, 1,
1.138539, 0.5931224, 0.0869036, 1, 0, 0.8352941, 1,
1.140714, -1.862031, 4.371697, 1, 0, 0.827451, 1,
1.142312, 1.451631, -0.2093782, 1, 0, 0.8235294, 1,
1.146178, 1.50318, -0.09189265, 1, 0, 0.8156863, 1,
1.152563, -0.9618433, 2.528205, 1, 0, 0.8117647, 1,
1.154084, -0.6451761, 2.737939, 1, 0, 0.8039216, 1,
1.160392, -1.241235, 1.185367, 1, 0, 0.7960784, 1,
1.167483, -1.365617, 1.4775, 1, 0, 0.7921569, 1,
1.175514, -0.3340779, -0.05069503, 1, 0, 0.7843137, 1,
1.179978, 1.2708, -0.05733392, 1, 0, 0.7803922, 1,
1.185108, -0.5857868, 0.7324271, 1, 0, 0.772549, 1,
1.188542, -0.2731222, 2.481623, 1, 0, 0.7686275, 1,
1.19215, -0.9303129, 0.4317186, 1, 0, 0.7607843, 1,
1.197669, 0.1251472, 1.330408, 1, 0, 0.7568628, 1,
1.198178, -0.8849452, 1.075008, 1, 0, 0.7490196, 1,
1.22097, -1.276602, 4.18412, 1, 0, 0.7450981, 1,
1.22355, -2.001979, 3.683758, 1, 0, 0.7372549, 1,
1.22359, -0.9582546, 1.880339, 1, 0, 0.7333333, 1,
1.229852, 0.2465644, 1.658237, 1, 0, 0.7254902, 1,
1.232438, 1.212567, 1.305772, 1, 0, 0.7215686, 1,
1.246824, -0.8396686, 2.471217, 1, 0, 0.7137255, 1,
1.27049, -1.548597, 2.555643, 1, 0, 0.7098039, 1,
1.271488, 1.004885, 0.5523418, 1, 0, 0.7019608, 1,
1.27723, -0.9136585, 1.365313, 1, 0, 0.6941177, 1,
1.290577, 0.5560752, 2.113587, 1, 0, 0.6901961, 1,
1.294981, -1.950029, 4.70333, 1, 0, 0.682353, 1,
1.298217, 2.086273, -0.6000378, 1, 0, 0.6784314, 1,
1.307531, 0.3365363, 0.9317742, 1, 0, 0.6705883, 1,
1.308063, -0.9552548, 3.173205, 1, 0, 0.6666667, 1,
1.31276, 0.07103344, 3.851266, 1, 0, 0.6588235, 1,
1.314623, -0.0480748, 0.3416487, 1, 0, 0.654902, 1,
1.318278, 1.253456, 1.48456, 1, 0, 0.6470588, 1,
1.323409, 0.7652429, 1.604076, 1, 0, 0.6431373, 1,
1.323441, -0.4654126, 2.617849, 1, 0, 0.6352941, 1,
1.324879, 0.7640626, 0.9936172, 1, 0, 0.6313726, 1,
1.325063, 1.424674, 0.3853901, 1, 0, 0.6235294, 1,
1.330481, -0.2766286, 2.233111, 1, 0, 0.6196079, 1,
1.337974, -0.700194, 2.510254, 1, 0, 0.6117647, 1,
1.341075, -1.015905, 2.366204, 1, 0, 0.6078432, 1,
1.344536, 0.5950287, 1.629074, 1, 0, 0.6, 1,
1.346697, -0.8511906, 3.00766, 1, 0, 0.5921569, 1,
1.347723, 0.129152, -0.2201362, 1, 0, 0.5882353, 1,
1.347873, -1.807409, 2.478093, 1, 0, 0.5803922, 1,
1.361248, 0.6277275, 1.608613, 1, 0, 0.5764706, 1,
1.367107, -1.146853, 1.869636, 1, 0, 0.5686275, 1,
1.381577, -0.2152295, 2.091604, 1, 0, 0.5647059, 1,
1.383387, 1.151553, 2.48483, 1, 0, 0.5568628, 1,
1.384302, 1.122609, 0.1960571, 1, 0, 0.5529412, 1,
1.396123, 1.620664, 1.127757, 1, 0, 0.5450981, 1,
1.398266, 0.9036024, 2.373739, 1, 0, 0.5411765, 1,
1.403283, 0.753532, 0.4652914, 1, 0, 0.5333334, 1,
1.411494, -0.6108581, 2.598595, 1, 0, 0.5294118, 1,
1.41422, -0.3589641, 2.590119, 1, 0, 0.5215687, 1,
1.421099, -1.049901, 4.568391, 1, 0, 0.5176471, 1,
1.445232, 1.228546, 1.573312, 1, 0, 0.509804, 1,
1.461613, 0.1953857, 1.306488, 1, 0, 0.5058824, 1,
1.465784, -0.07067099, 1.760351, 1, 0, 0.4980392, 1,
1.472459, 0.8540697, 2.641248, 1, 0, 0.4901961, 1,
1.478767, 1.581921, -0.6171994, 1, 0, 0.4862745, 1,
1.48113, 0.4973652, 2.529081, 1, 0, 0.4784314, 1,
1.485847, 1.241211, 0.4553419, 1, 0, 0.4745098, 1,
1.507217, -0.408634, 2.327706, 1, 0, 0.4666667, 1,
1.50906, -0.2825329, 1.274425, 1, 0, 0.4627451, 1,
1.523547, -0.2095058, 0.4408924, 1, 0, 0.454902, 1,
1.524455, -0.08280276, -0.5009082, 1, 0, 0.4509804, 1,
1.54404, 0.6956058, -0.8841399, 1, 0, 0.4431373, 1,
1.544613, -0.8850774, 1.538959, 1, 0, 0.4392157, 1,
1.546499, -0.7728818, 2.235524, 1, 0, 0.4313726, 1,
1.564318, 1.223761, -0.8903097, 1, 0, 0.427451, 1,
1.565611, 0.1448473, 1.136868, 1, 0, 0.4196078, 1,
1.56599, 0.5573417, 1.108286, 1, 0, 0.4156863, 1,
1.577193, -1.79041, 2.583826, 1, 0, 0.4078431, 1,
1.580152, 0.4029154, 2.420244, 1, 0, 0.4039216, 1,
1.582238, 0.7178567, 0.6915473, 1, 0, 0.3960784, 1,
1.591621, 0.7384144, 1.026003, 1, 0, 0.3882353, 1,
1.621095, -1.324152, 3.015473, 1, 0, 0.3843137, 1,
1.632879, 1.167364, 2.037987, 1, 0, 0.3764706, 1,
1.645516, 0.4159583, 1.328254, 1, 0, 0.372549, 1,
1.662852, 0.7644552, 0.1749159, 1, 0, 0.3647059, 1,
1.665088, -0.3813845, 3.882984, 1, 0, 0.3607843, 1,
1.668114, 0.008406474, 1.489824, 1, 0, 0.3529412, 1,
1.669246, -0.3311104, 3.227169, 1, 0, 0.3490196, 1,
1.672012, 0.7433575, 1.811064, 1, 0, 0.3411765, 1,
1.673004, 1.236715, 1.641742, 1, 0, 0.3372549, 1,
1.68222, -0.2480713, 2.64039, 1, 0, 0.3294118, 1,
1.682465, -1.068683, 0.2732715, 1, 0, 0.3254902, 1,
1.699249, -0.2311864, 3.307086, 1, 0, 0.3176471, 1,
1.70068, -2.434316, 4.895627, 1, 0, 0.3137255, 1,
1.705293, -1.94898, 2.667162, 1, 0, 0.3058824, 1,
1.707504, -1.055775, 1.946936, 1, 0, 0.2980392, 1,
1.707932, 0.4285158, 1.26571, 1, 0, 0.2941177, 1,
1.708997, 0.9468344, 0.1017551, 1, 0, 0.2862745, 1,
1.711383, 0.4696338, -0.3855198, 1, 0, 0.282353, 1,
1.729511, -0.518832, 1.640801, 1, 0, 0.2745098, 1,
1.73791, 0.5357255, 0.6348904, 1, 0, 0.2705882, 1,
1.748595, 0.01028085, 0.8140669, 1, 0, 0.2627451, 1,
1.772767, 0.1729845, 0.272063, 1, 0, 0.2588235, 1,
1.776617, 1.618012, 0.2942771, 1, 0, 0.2509804, 1,
1.779944, 0.0646401, 0.7443234, 1, 0, 0.2470588, 1,
1.782916, -0.8331113, 2.70123, 1, 0, 0.2392157, 1,
1.799469, 0.5690511, 0.8917275, 1, 0, 0.2352941, 1,
1.799841, 0.4238021, -1.155033, 1, 0, 0.227451, 1,
1.80825, -1.429731, 1.394026, 1, 0, 0.2235294, 1,
1.863718, -0.7059483, 0.9827437, 1, 0, 0.2156863, 1,
1.904245, -2.233121, 2.982855, 1, 0, 0.2117647, 1,
1.923867, -1.417101, 1.714284, 1, 0, 0.2039216, 1,
1.930998, 0.538253, 2.158764, 1, 0, 0.1960784, 1,
1.963578, 1.976873, 0.9866065, 1, 0, 0.1921569, 1,
2.00516, 1.330704, -0.03978176, 1, 0, 0.1843137, 1,
2.008764, -0.9784224, 1.306333, 1, 0, 0.1803922, 1,
2.025781, 0.364277, 0.9229372, 1, 0, 0.172549, 1,
2.061317, 0.005072275, 2.108734, 1, 0, 0.1686275, 1,
2.086707, -1.7439, 3.976182, 1, 0, 0.1607843, 1,
2.094437, -0.929829, 4.181257, 1, 0, 0.1568628, 1,
2.115613, -0.7961302, 2.601376, 1, 0, 0.1490196, 1,
2.121454, -0.8808925, 1.227636, 1, 0, 0.145098, 1,
2.132615, 1.445709, -0.3091661, 1, 0, 0.1372549, 1,
2.152599, -1.319453, 0.6193901, 1, 0, 0.1333333, 1,
2.176225, -0.1403921, 2.199946, 1, 0, 0.1254902, 1,
2.18415, -0.1757909, 1.846245, 1, 0, 0.1215686, 1,
2.209425, -1.481341, 2.446758, 1, 0, 0.1137255, 1,
2.248961, 0.07269279, 3.372264, 1, 0, 0.1098039, 1,
2.277056, -0.2564861, 2.416191, 1, 0, 0.1019608, 1,
2.320462, -1.305449, 2.271358, 1, 0, 0.09411765, 1,
2.329154, -0.3931137, 3.172179, 1, 0, 0.09019608, 1,
2.338033, 0.391713, 1.858352, 1, 0, 0.08235294, 1,
2.364664, -1.760319, 2.829357, 1, 0, 0.07843138, 1,
2.377129, -0.638217, 2.695227, 1, 0, 0.07058824, 1,
2.419937, -0.9745551, 2.166226, 1, 0, 0.06666667, 1,
2.421424, -0.4695803, 2.567061, 1, 0, 0.05882353, 1,
2.485022, 0.2503861, 1.649529, 1, 0, 0.05490196, 1,
2.531606, -2.088253, 0.2794621, 1, 0, 0.04705882, 1,
2.648487, 0.2464451, 0.1948156, 1, 0, 0.04313726, 1,
2.664342, 1.84664, 1.568103, 1, 0, 0.03529412, 1,
2.717385, -0.5029611, 2.819345, 1, 0, 0.03137255, 1,
2.821966, 0.8251985, 0.7951949, 1, 0, 0.02352941, 1,
2.825196, -0.6030194, 2.462948, 1, 0, 0.01960784, 1,
3.083981, 0.1897277, 2.381303, 1, 0, 0.01176471, 1,
3.158106, 1.829353, 0.316758, 1, 0, 0.007843138, 1
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
-0.2761148, -4.367831, -7.345418, 0, -0.5, 0.5, 0.5,
-0.2761148, -4.367831, -7.345418, 1, -0.5, 0.5, 0.5,
-0.2761148, -4.367831, -7.345418, 1, 1.5, 0.5, 0.5,
-0.2761148, -4.367831, -7.345418, 0, 1.5, 0.5, 0.5
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
-4.874536, -0.02144444, -7.345418, 0, -0.5, 0.5, 0.5,
-4.874536, -0.02144444, -7.345418, 1, -0.5, 0.5, 0.5,
-4.874536, -0.02144444, -7.345418, 1, 1.5, 0.5, 0.5,
-4.874536, -0.02144444, -7.345418, 0, 1.5, 0.5, 0.5
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
-4.874536, -4.367831, -0.08646822, 0, -0.5, 0.5, 0.5,
-4.874536, -4.367831, -0.08646822, 1, -0.5, 0.5, 0.5,
-4.874536, -4.367831, -0.08646822, 1, 1.5, 0.5, 0.5,
-4.874536, -4.367831, -0.08646822, 0, 1.5, 0.5, 0.5
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
-3, -3.364819, -5.670276,
3, -3.364819, -5.670276,
-3, -3.364819, -5.670276,
-3, -3.531987, -5.949466,
-2, -3.364819, -5.670276,
-2, -3.531987, -5.949466,
-1, -3.364819, -5.670276,
-1, -3.531987, -5.949466,
0, -3.364819, -5.670276,
0, -3.531987, -5.949466,
1, -3.364819, -5.670276,
1, -3.531987, -5.949466,
2, -3.364819, -5.670276,
2, -3.531987, -5.949466,
3, -3.364819, -5.670276,
3, -3.531987, -5.949466
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
-3, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
-3, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
-3, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
-3, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
-2, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
-2, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
-2, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
-2, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
-1, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
-1, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
-1, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
-1, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
0, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
0, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
0, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
0, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
1, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
1, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
1, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
1, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
2, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
2, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
2, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
2, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5,
3, -3.866325, -6.507847, 0, -0.5, 0.5, 0.5,
3, -3.866325, -6.507847, 1, -0.5, 0.5, 0.5,
3, -3.866325, -6.507847, 1, 1.5, 0.5, 0.5,
3, -3.866325, -6.507847, 0, 1.5, 0.5, 0.5
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
-3.813362, -3, -5.670276,
-3.813362, 3, -5.670276,
-3.813362, -3, -5.670276,
-3.990224, -3, -5.949466,
-3.813362, -2, -5.670276,
-3.990224, -2, -5.949466,
-3.813362, -1, -5.670276,
-3.990224, -1, -5.949466,
-3.813362, 0, -5.670276,
-3.990224, 0, -5.949466,
-3.813362, 1, -5.670276,
-3.990224, 1, -5.949466,
-3.813362, 2, -5.670276,
-3.990224, 2, -5.949466,
-3.813362, 3, -5.670276,
-3.990224, 3, -5.949466
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
-4.343949, -3, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, -3, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, -3, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, -3, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, -2, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, -2, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, -2, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, -2, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, -1, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, -1, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, -1, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, -1, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, 0, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, 0, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, 0, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, 0, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, 1, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, 1, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, 1, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, 1, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, 2, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, 2, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, 2, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, 2, -6.507847, 0, 1.5, 0.5, 0.5,
-4.343949, 3, -6.507847, 0, -0.5, 0.5, 0.5,
-4.343949, 3, -6.507847, 1, -0.5, 0.5, 0.5,
-4.343949, 3, -6.507847, 1, 1.5, 0.5, 0.5,
-4.343949, 3, -6.507847, 0, 1.5, 0.5, 0.5
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
-3.813362, -3.364819, -4,
-3.813362, -3.364819, 4,
-3.813362, -3.364819, -4,
-3.990224, -3.531987, -4,
-3.813362, -3.364819, -2,
-3.990224, -3.531987, -2,
-3.813362, -3.364819, 0,
-3.990224, -3.531987, 0,
-3.813362, -3.364819, 2,
-3.990224, -3.531987, 2,
-3.813362, -3.364819, 4,
-3.990224, -3.531987, 4
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
-4.343949, -3.866325, -4, 0, -0.5, 0.5, 0.5,
-4.343949, -3.866325, -4, 1, -0.5, 0.5, 0.5,
-4.343949, -3.866325, -4, 1, 1.5, 0.5, 0.5,
-4.343949, -3.866325, -4, 0, 1.5, 0.5, 0.5,
-4.343949, -3.866325, -2, 0, -0.5, 0.5, 0.5,
-4.343949, -3.866325, -2, 1, -0.5, 0.5, 0.5,
-4.343949, -3.866325, -2, 1, 1.5, 0.5, 0.5,
-4.343949, -3.866325, -2, 0, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 0, 0, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 0, 1, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 0, 1, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 0, 0, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 2, 0, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 2, 1, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 2, 1, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 2, 0, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 4, 0, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 4, 1, -0.5, 0.5, 0.5,
-4.343949, -3.866325, 4, 1, 1.5, 0.5, 0.5,
-4.343949, -3.866325, 4, 0, 1.5, 0.5, 0.5
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
-3.813362, -3.364819, -5.670276,
-3.813362, 3.32193, -5.670276,
-3.813362, -3.364819, 5.49734,
-3.813362, 3.32193, 5.49734,
-3.813362, -3.364819, -5.670276,
-3.813362, -3.364819, 5.49734,
-3.813362, 3.32193, -5.670276,
-3.813362, 3.32193, 5.49734,
-3.813362, -3.364819, -5.670276,
3.261132, -3.364819, -5.670276,
-3.813362, -3.364819, 5.49734,
3.261132, -3.364819, 5.49734,
-3.813362, 3.32193, -5.670276,
3.261132, 3.32193, -5.670276,
-3.813362, 3.32193, 5.49734,
3.261132, 3.32193, 5.49734,
3.261132, -3.364819, -5.670276,
3.261132, 3.32193, -5.670276,
3.261132, -3.364819, 5.49734,
3.261132, 3.32193, 5.49734,
3.261132, -3.364819, -5.670276,
3.261132, -3.364819, 5.49734,
3.261132, 3.32193, -5.670276,
3.261132, 3.32193, 5.49734
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
var radius = 7.910787;
var distance = 35.19598;
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
mvMatrix.translate( 0.2761148, 0.02144444, 0.08646822 );
mvMatrix.scale( 1.209033, 1.279142, 0.7659019 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19598);
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
3-ethoxy-4-nitrophen<-read.table("3-ethoxy-4-nitrophen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-ethoxy-4-nitrophen$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxy' not found
```

```r
y<-3-ethoxy-4-nitrophen$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxy' not found
```

```r
z<-3-ethoxy-4-nitrophen$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxy' not found
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
-3.710335, -2.007577, -2.781982, 0, 0, 1, 1, 1,
-3.000661, -0.4228479, -3.298316, 1, 0, 0, 1, 1,
-2.77542, -0.4475908, -1.441573, 1, 0, 0, 1, 1,
-2.593944, -1.000335, -2.013626, 1, 0, 0, 1, 1,
-2.523301, -1.700554, -1.275201, 1, 0, 0, 1, 1,
-2.373252, 0.08500233, -1.439612, 1, 0, 0, 1, 1,
-2.349306, 0.6965724, -1.701702, 0, 0, 0, 1, 1,
-2.296432, 0.9709874, -1.331797, 0, 0, 0, 1, 1,
-2.262621, 0.7806788, -1.573026, 0, 0, 0, 1, 1,
-2.219047, -0.1500227, -2.822526, 0, 0, 0, 1, 1,
-2.180026, -0.03060528, -1.532871, 0, 0, 0, 1, 1,
-2.14197, 0.3844605, -1.204162, 0, 0, 0, 1, 1,
-2.139187, -0.1518278, -0.9684714, 0, 0, 0, 1, 1,
-2.109976, -0.2049364, -0.756402, 1, 1, 1, 1, 1,
-2.101544, -0.4462991, -1.083013, 1, 1, 1, 1, 1,
-2.078418, 0.01736522, -1.450145, 1, 1, 1, 1, 1,
-2.057922, 0.124939, -1.384477, 1, 1, 1, 1, 1,
-2.032497, 0.2000602, -1.906306, 1, 1, 1, 1, 1,
-2.030465, -0.8562057, -2.883967, 1, 1, 1, 1, 1,
-1.997599, 1.140595, 0.5533054, 1, 1, 1, 1, 1,
-1.971587, -0.9387054, -3.35297, 1, 1, 1, 1, 1,
-1.965264, 0.0002503788, -2.805781, 1, 1, 1, 1, 1,
-1.939621, 2.916638, -0.5311432, 1, 1, 1, 1, 1,
-1.91786, 1.319556, -0.596715, 1, 1, 1, 1, 1,
-1.914427, 0.9399846, 0.07396642, 1, 1, 1, 1, 1,
-1.914348, 1.048032, 0.8113799, 1, 1, 1, 1, 1,
-1.906792, 0.4444486, -1.651414, 1, 1, 1, 1, 1,
-1.906548, -0.1254797, -2.926667, 1, 1, 1, 1, 1,
-1.890004, -0.2523509, -2.246312, 0, 0, 1, 1, 1,
-1.878667, -0.1619264, -0.07277897, 1, 0, 0, 1, 1,
-1.874724, 0.1226449, -3.983015, 1, 0, 0, 1, 1,
-1.872452, 0.9431591, 0.1225323, 1, 0, 0, 1, 1,
-1.835273, 0.5244129, -1.102018, 1, 0, 0, 1, 1,
-1.834273, 0.2095522, 0.1386153, 1, 0, 0, 1, 1,
-1.827634, 1.289619, -1.800759, 0, 0, 0, 1, 1,
-1.807417, 2.76499, -0.3192312, 0, 0, 0, 1, 1,
-1.793933, -1.724603, -1.113041, 0, 0, 0, 1, 1,
-1.788945, -1.540754, -3.786061, 0, 0, 0, 1, 1,
-1.786319, 0.4292874, -1.721867, 0, 0, 0, 1, 1,
-1.782701, 1.22592, -0.2843899, 0, 0, 0, 1, 1,
-1.746674, -0.2097632, -0.2648327, 0, 0, 0, 1, 1,
-1.740196, 1.15962, -1.808617, 1, 1, 1, 1, 1,
-1.732886, -0.5567236, -2.013496, 1, 1, 1, 1, 1,
-1.726302, -0.5725096, -5.063717, 1, 1, 1, 1, 1,
-1.725091, 0.01027576, 0.4551617, 1, 1, 1, 1, 1,
-1.715299, -0.08870798, -1.186171, 1, 1, 1, 1, 1,
-1.700569, 1.536932, -1.13726, 1, 1, 1, 1, 1,
-1.691523, -0.9194499, -3.488198, 1, 1, 1, 1, 1,
-1.689887, 0.5262709, -0.6954117, 1, 1, 1, 1, 1,
-1.685521, 0.529943, -0.8240548, 1, 1, 1, 1, 1,
-1.680527, -0.1925596, -2.299822, 1, 1, 1, 1, 1,
-1.677163, -1.355513, -1.189789, 1, 1, 1, 1, 1,
-1.675937, -1.628236, -4.114068, 1, 1, 1, 1, 1,
-1.674816, -0.1315322, -1.598052, 1, 1, 1, 1, 1,
-1.670382, -1.288017, -1.102972, 1, 1, 1, 1, 1,
-1.664761, -0.4557493, -1.758536, 1, 1, 1, 1, 1,
-1.661487, 1.643803, 0.12341, 0, 0, 1, 1, 1,
-1.656922, 2.529693, 0.03571888, 1, 0, 0, 1, 1,
-1.645598, 0.57665, -1.301127, 1, 0, 0, 1, 1,
-1.642988, -0.9828187, -1.688335, 1, 0, 0, 1, 1,
-1.635927, 0.3393773, -1.715449, 1, 0, 0, 1, 1,
-1.633832, 0.9856279, -1.635209, 1, 0, 0, 1, 1,
-1.622355, -0.002782239, -1.924559, 0, 0, 0, 1, 1,
-1.587543, 0.6159584, -0.8152633, 0, 0, 0, 1, 1,
-1.58599, -0.5631741, -1.492916, 0, 0, 0, 1, 1,
-1.576951, -0.9296659, -0.5727809, 0, 0, 0, 1, 1,
-1.559892, 0.1205477, -3.099476, 0, 0, 0, 1, 1,
-1.556996, 0.5426717, -1.610326, 0, 0, 0, 1, 1,
-1.543234, -0.2370477, -2.893368, 0, 0, 0, 1, 1,
-1.542145, 0.06535382, -0.4928406, 1, 1, 1, 1, 1,
-1.537913, 1.794441, -1.072276, 1, 1, 1, 1, 1,
-1.528193, -0.8700433, -2.70767, 1, 1, 1, 1, 1,
-1.526392, -0.0003813818, -2.220571, 1, 1, 1, 1, 1,
-1.514043, -0.1591129, -0.3819232, 1, 1, 1, 1, 1,
-1.503943, 0.8186563, -2.84732, 1, 1, 1, 1, 1,
-1.497224, -0.8642992, -0.1109973, 1, 1, 1, 1, 1,
-1.48675, -0.1803088, -2.238525, 1, 1, 1, 1, 1,
-1.486743, -0.5096072, -0.586854, 1, 1, 1, 1, 1,
-1.477491, -1.090142, -0.8328576, 1, 1, 1, 1, 1,
-1.474658, -1.501748, -2.172913, 1, 1, 1, 1, 1,
-1.467226, -1.329769, -2.116581, 1, 1, 1, 1, 1,
-1.439913, 0.06820562, -2.154895, 1, 1, 1, 1, 1,
-1.420722, -0.4235759, -0.3601709, 1, 1, 1, 1, 1,
-1.41514, -0.2861164, -1.51682, 1, 1, 1, 1, 1,
-1.413299, 0.6624538, -0.05196005, 0, 0, 1, 1, 1,
-1.40408, 1.236437, -2.730774, 1, 0, 0, 1, 1,
-1.403962, -0.7921971, -1.712742, 1, 0, 0, 1, 1,
-1.40006, 0.3925553, -0.4663495, 1, 0, 0, 1, 1,
-1.378844, -1.057297, -3.032225, 1, 0, 0, 1, 1,
-1.348552, -0.1991813, -3.739443, 1, 0, 0, 1, 1,
-1.34712, -1.522579, -2.915826, 0, 0, 0, 1, 1,
-1.335735, -1.087359, -1.744408, 0, 0, 0, 1, 1,
-1.333952, -0.03545144, -1.880077, 0, 0, 0, 1, 1,
-1.330269, 0.09577136, -3.06289, 0, 0, 0, 1, 1,
-1.325245, 0.6657205, -1.283776, 0, 0, 0, 1, 1,
-1.314335, 1.642212, -1.882964, 0, 0, 0, 1, 1,
-1.303312, -0.4137297, -1.543097, 0, 0, 0, 1, 1,
-1.29602, 0.6673319, -1.559655, 1, 1, 1, 1, 1,
-1.291418, 1.775927, -0.7867066, 1, 1, 1, 1, 1,
-1.272893, -0.746409, -3.112504, 1, 1, 1, 1, 1,
-1.26692, -0.9183865, -1.076869, 1, 1, 1, 1, 1,
-1.266507, -0.2374185, -2.109515, 1, 1, 1, 1, 1,
-1.252395, 0.2772916, -0.4771381, 1, 1, 1, 1, 1,
-1.248983, -1.02327, -3.617122, 1, 1, 1, 1, 1,
-1.247766, 1.538517, -0.4626653, 1, 1, 1, 1, 1,
-1.247189, 1.015977, -1.693075, 1, 1, 1, 1, 1,
-1.240819, -0.05165815, -0.2365517, 1, 1, 1, 1, 1,
-1.235861, 1.540528, 0.7637941, 1, 1, 1, 1, 1,
-1.2341, 0.2913563, -1.952622, 1, 1, 1, 1, 1,
-1.221902, 0.6445511, -0.02597873, 1, 1, 1, 1, 1,
-1.217506, 0.4418585, -1.53135, 1, 1, 1, 1, 1,
-1.213736, -1.974252, -1.614454, 1, 1, 1, 1, 1,
-1.212144, 0.5451683, -1.867104, 0, 0, 1, 1, 1,
-1.209828, -1.174316, -1.259938, 1, 0, 0, 1, 1,
-1.205159, -1.549264, -2.991853, 1, 0, 0, 1, 1,
-1.204272, 0.5735257, -2.332072, 1, 0, 0, 1, 1,
-1.199774, 1.839163, -0.4459154, 1, 0, 0, 1, 1,
-1.197719, 1.622395, -1.197777, 1, 0, 0, 1, 1,
-1.192736, -0.9763592, -0.2208117, 0, 0, 0, 1, 1,
-1.183776, 0.1606854, -2.882258, 0, 0, 0, 1, 1,
-1.178532, -1.279844, -3.518008, 0, 0, 0, 1, 1,
-1.175333, 0.562195, -1.71476, 0, 0, 0, 1, 1,
-1.170918, 0.872942, -0.1748449, 0, 0, 0, 1, 1,
-1.162318, 0.7003986, -1.056796, 0, 0, 0, 1, 1,
-1.156802, -0.08717946, -2.595421, 0, 0, 0, 1, 1,
-1.154172, 0.1517156, -1.337698, 1, 1, 1, 1, 1,
-1.153399, -1.273708, -2.193612, 1, 1, 1, 1, 1,
-1.135882, -0.6210309, -2.397083, 1, 1, 1, 1, 1,
-1.132294, 0.2087557, -2.519633, 1, 1, 1, 1, 1,
-1.126823, 2.175456, -3.214595, 1, 1, 1, 1, 1,
-1.109139, -0.8901954, -3.152585, 1, 1, 1, 1, 1,
-1.098492, -0.07141741, -3.083225, 1, 1, 1, 1, 1,
-1.091622, -0.9999143, -2.020218, 1, 1, 1, 1, 1,
-1.089396, 0.5550963, -1.818949, 1, 1, 1, 1, 1,
-1.08634, -1.681035, -2.985822, 1, 1, 1, 1, 1,
-1.083508, 0.09209114, -2.690458, 1, 1, 1, 1, 1,
-1.077435, 0.02948693, -2.885706, 1, 1, 1, 1, 1,
-1.07702, -0.8239835, -1.838058, 1, 1, 1, 1, 1,
-1.072229, 0.6281765, -0.5965717, 1, 1, 1, 1, 1,
-1.06963, 0.8626209, -0.9700339, 1, 1, 1, 1, 1,
-1.068928, 0.06059986, -1.147595, 0, 0, 1, 1, 1,
-1.052314, 0.2443129, -1.332829, 1, 0, 0, 1, 1,
-1.048062, 0.9434111, -0.6658788, 1, 0, 0, 1, 1,
-1.048048, -1.232771, -1.859702, 1, 0, 0, 1, 1,
-1.045158, -1.178329, -1.087649, 1, 0, 0, 1, 1,
-1.038772, 0.08409587, -2.384198, 1, 0, 0, 1, 1,
-1.033939, 0.2641636, -2.011245, 0, 0, 0, 1, 1,
-1.011267, 0.1923013, -1.734017, 0, 0, 0, 1, 1,
-1.008938, 0.3443554, -0.1012781, 0, 0, 0, 1, 1,
-1.005564, -1.981121, -2.656072, 0, 0, 0, 1, 1,
-1.005282, 1.641762, -1.357891, 0, 0, 0, 1, 1,
-1.003707, -0.1099357, -1.287103, 0, 0, 0, 1, 1,
-1.003138, 0.5315599, -0.4349789, 0, 0, 0, 1, 1,
-0.9987928, 0.4255565, -2.79537, 1, 1, 1, 1, 1,
-0.9926742, 0.2006685, -2.111392, 1, 1, 1, 1, 1,
-0.9896562, -0.2240977, -2.655854, 1, 1, 1, 1, 1,
-0.9819579, 1.278558, -1.161906, 1, 1, 1, 1, 1,
-0.9738538, 1.237999, -0.1877554, 1, 1, 1, 1, 1,
-0.9721617, 0.676464, -0.5402085, 1, 1, 1, 1, 1,
-0.9690734, -0.5843275, -3.517812, 1, 1, 1, 1, 1,
-0.9659634, 0.4208733, -0.6519446, 1, 1, 1, 1, 1,
-0.9650856, -0.1178877, -3.45253, 1, 1, 1, 1, 1,
-0.9607266, -0.2788215, -2.08407, 1, 1, 1, 1, 1,
-0.960111, -0.2084345, -1.33104, 1, 1, 1, 1, 1,
-0.9550118, 0.6638981, -1.739595, 1, 1, 1, 1, 1,
-0.953665, 0.8971466, -0.8979807, 1, 1, 1, 1, 1,
-0.950065, 0.2586699, 0.3655039, 1, 1, 1, 1, 1,
-0.9494249, -2.73987, -2.931469, 1, 1, 1, 1, 1,
-0.9492106, -0.839628, -2.441665, 0, 0, 1, 1, 1,
-0.9488507, 2.134728, -1.062017, 1, 0, 0, 1, 1,
-0.9454511, 0.7202645, 1.528553, 1, 0, 0, 1, 1,
-0.9401738, -1.603017, -2.809759, 1, 0, 0, 1, 1,
-0.9350473, 0.421508, 0.2503527, 1, 0, 0, 1, 1,
-0.9256744, 0.07514953, -1.020627, 1, 0, 0, 1, 1,
-0.919072, -0.453032, -2.014677, 0, 0, 0, 1, 1,
-0.9143374, 0.1058791, -2.053782, 0, 0, 0, 1, 1,
-0.9138329, -1.666392, -2.070456, 0, 0, 0, 1, 1,
-0.9093391, 0.08344923, -3.778891, 0, 0, 0, 1, 1,
-0.9071103, 0.2373152, -0.6125143, 0, 0, 0, 1, 1,
-0.8963497, -0.3703427, -2.337686, 0, 0, 0, 1, 1,
-0.8941904, -0.08763821, -0.5615989, 0, 0, 0, 1, 1,
-0.89237, 0.4470404, -0.3305736, 1, 1, 1, 1, 1,
-0.8846848, -2.162939, -4.23796, 1, 1, 1, 1, 1,
-0.8842388, -0.3247732, -3.485737, 1, 1, 1, 1, 1,
-0.8813604, 0.07657167, -2.692081, 1, 1, 1, 1, 1,
-0.8807479, -2.62497, -0.1745374, 1, 1, 1, 1, 1,
-0.8803569, 0.06554773, -1.964715, 1, 1, 1, 1, 1,
-0.877426, -0.9390886, -2.939578, 1, 1, 1, 1, 1,
-0.876387, -1.578449, -1.121551, 1, 1, 1, 1, 1,
-0.8724045, 0.03035659, -1.016479, 1, 1, 1, 1, 1,
-0.8708497, 0.5815125, -1.88665, 1, 1, 1, 1, 1,
-0.8660204, 0.799194, -0.758531, 1, 1, 1, 1, 1,
-0.8625341, -0.1142698, -1.896954, 1, 1, 1, 1, 1,
-0.8625272, -0.09085143, -2.010383, 1, 1, 1, 1, 1,
-0.8595356, 1.45302, 1.077066, 1, 1, 1, 1, 1,
-0.8511336, 0.772953, -1.926035, 1, 1, 1, 1, 1,
-0.8498477, 0.01479104, -2.738667, 0, 0, 1, 1, 1,
-0.8434317, 1.8052, -0.2480615, 1, 0, 0, 1, 1,
-0.8408394, 2.090567, -1.752703, 1, 0, 0, 1, 1,
-0.8336859, 0.3797902, -3.205445, 1, 0, 0, 1, 1,
-0.8222017, 0.1403341, -0.7616978, 1, 0, 0, 1, 1,
-0.8169294, -0.4240954, -2.872728, 1, 0, 0, 1, 1,
-0.8143224, 2.197903, 2.042717, 0, 0, 0, 1, 1,
-0.8143082, 0.4897932, -1.186821, 0, 0, 0, 1, 1,
-0.8121889, 0.03747811, -1.74368, 0, 0, 0, 1, 1,
-0.8116701, -1.218764, -1.482564, 0, 0, 0, 1, 1,
-0.8115431, 1.323426, -2.331974, 0, 0, 0, 1, 1,
-0.8081707, -0.2022601, -0.8202688, 0, 0, 0, 1, 1,
-0.8079354, -0.2761707, -1.785707, 0, 0, 0, 1, 1,
-0.807753, 1.579495, -0.548785, 1, 1, 1, 1, 1,
-0.8069112, -0.4775133, -1.549477, 1, 1, 1, 1, 1,
-0.8056877, -1.241532, -3.762074, 1, 1, 1, 1, 1,
-0.796854, -0.9985572, -2.168225, 1, 1, 1, 1, 1,
-0.7904894, -0.9284367, -1.402342, 1, 1, 1, 1, 1,
-0.7875583, -0.1865796, -0.4319276, 1, 1, 1, 1, 1,
-0.7864776, -0.3522727, -3.000344, 1, 1, 1, 1, 1,
-0.7763334, 0.5278927, -1.650866, 1, 1, 1, 1, 1,
-0.773117, -0.1550346, -0.06586663, 1, 1, 1, 1, 1,
-0.7706182, 1.831169, 0.4003828, 1, 1, 1, 1, 1,
-0.7672396, -0.5578334, -1.98172, 1, 1, 1, 1, 1,
-0.7627124, -1.524876, -4.162091, 1, 1, 1, 1, 1,
-0.7608116, -1.361725, -3.999805, 1, 1, 1, 1, 1,
-0.754703, -0.3235329, -1.713578, 1, 1, 1, 1, 1,
-0.7530991, 0.7680647, -0.1045524, 1, 1, 1, 1, 1,
-0.7515185, 0.7728715, -0.2104898, 0, 0, 1, 1, 1,
-0.7468567, 1.461798, -0.5741073, 1, 0, 0, 1, 1,
-0.7467832, 0.2474653, -1.567122, 1, 0, 0, 1, 1,
-0.7380525, 0.2462519, -0.1648302, 1, 0, 0, 1, 1,
-0.7375013, 0.7893401, 0.05125243, 1, 0, 0, 1, 1,
-0.7363836, -0.2384079, -2.3388, 1, 0, 0, 1, 1,
-0.7328062, 1.300036, -1.368318, 0, 0, 0, 1, 1,
-0.7227547, 0.02566228, -2.683855, 0, 0, 0, 1, 1,
-0.7225764, 0.6402971, -0.544532, 0, 0, 0, 1, 1,
-0.7166623, 0.6000348, -1.18478, 0, 0, 0, 1, 1,
-0.7165753, -1.058978, -4.890694, 0, 0, 0, 1, 1,
-0.7140946, -0.06825319, -1.839882, 0, 0, 0, 1, 1,
-0.7116336, -0.5888908, -4.240405, 0, 0, 0, 1, 1,
-0.711023, 1.649479, -2.709598, 1, 1, 1, 1, 1,
-0.7062341, 0.3047789, -1.042957, 1, 1, 1, 1, 1,
-0.7056389, -1.069188, -2.102202, 1, 1, 1, 1, 1,
-0.6983294, 1.125923, -0.1746044, 1, 1, 1, 1, 1,
-0.6951391, -0.7080749, -0.6315351, 1, 1, 1, 1, 1,
-0.6944503, -0.8653811, -2.15773, 1, 1, 1, 1, 1,
-0.6875193, -0.956973, -1.509401, 1, 1, 1, 1, 1,
-0.6869131, 2.103487, 0.2757118, 1, 1, 1, 1, 1,
-0.6857076, 0.2610511, -1.375583, 1, 1, 1, 1, 1,
-0.6800965, -0.2359672, -3.027476, 1, 1, 1, 1, 1,
-0.6786547, -1.101036, -3.665666, 1, 1, 1, 1, 1,
-0.677835, 0.6479027, -0.5597198, 1, 1, 1, 1, 1,
-0.6772919, 0.5161994, -1.965867, 1, 1, 1, 1, 1,
-0.6741725, 0.8329495, -1.696322, 1, 1, 1, 1, 1,
-0.6700615, 0.4642705, 0.6584494, 1, 1, 1, 1, 1,
-0.6695799, -0.6987553, -2.547147, 0, 0, 1, 1, 1,
-0.668758, 2.086519, -0.7754218, 1, 0, 0, 1, 1,
-0.6665651, 2.297093, -1.521137, 1, 0, 0, 1, 1,
-0.6643142, 1.528859, -1.616281, 1, 0, 0, 1, 1,
-0.6611134, -0.2406111, 0.008942676, 1, 0, 0, 1, 1,
-0.6521732, 0.8199384, -1.407895, 1, 0, 0, 1, 1,
-0.6502881, 0.4407084, -2.781523, 0, 0, 0, 1, 1,
-0.6445305, -0.3037973, -2.087867, 0, 0, 0, 1, 1,
-0.6227049, -0.674422, -3.555321, 0, 0, 0, 1, 1,
-0.6221983, -0.5907905, -4.212295, 0, 0, 0, 1, 1,
-0.6152657, 2.485769, -2.179614, 0, 0, 0, 1, 1,
-0.6136512, -0.8115889, -0.6957181, 0, 0, 0, 1, 1,
-0.6105778, -0.9854844, -2.399459, 0, 0, 0, 1, 1,
-0.6062548, -0.4151554, -0.7115162, 1, 1, 1, 1, 1,
-0.6062295, -0.5956988, -3.572234, 1, 1, 1, 1, 1,
-0.6005222, -0.4538555, -2.759105, 1, 1, 1, 1, 1,
-0.5985422, 0.03755324, 0.6377298, 1, 1, 1, 1, 1,
-0.5962275, 1.366376, 0.2682133, 1, 1, 1, 1, 1,
-0.5893891, -0.2024928, -0.06830104, 1, 1, 1, 1, 1,
-0.5863879, 0.4948141, 0.4385529, 1, 1, 1, 1, 1,
-0.5813529, -2.201267, -2.740254, 1, 1, 1, 1, 1,
-0.572203, -1.052506, -1.393106, 1, 1, 1, 1, 1,
-0.5721977, 1.417549, 1.021673, 1, 1, 1, 1, 1,
-0.5720053, 1.485458, -0.2012636, 1, 1, 1, 1, 1,
-0.5683964, -0.9158976, -2.468744, 1, 1, 1, 1, 1,
-0.5672394, 0.9585529, -1.158283, 1, 1, 1, 1, 1,
-0.566959, 1.052028, -1.424361, 1, 1, 1, 1, 1,
-0.5652435, 0.663445, 0.7214161, 1, 1, 1, 1, 1,
-0.5642465, 0.648588, -1.04557, 0, 0, 1, 1, 1,
-0.5634682, 0.1948608, -1.063652, 1, 0, 0, 1, 1,
-0.5632194, -1.507873, -3.093589, 1, 0, 0, 1, 1,
-0.5604784, 0.2898937, -0.3303213, 1, 0, 0, 1, 1,
-0.5601445, -2.425386, -2.557011, 1, 0, 0, 1, 1,
-0.5589786, -0.2990109, -1.674416, 1, 0, 0, 1, 1,
-0.5579183, 1.124128, -1.552098, 0, 0, 0, 1, 1,
-0.5569842, -1.279113, -2.276192, 0, 0, 0, 1, 1,
-0.5554209, 0.7572552, -1.595905, 0, 0, 0, 1, 1,
-0.5553203, -0.2341407, -0.1787495, 0, 0, 0, 1, 1,
-0.5528147, 0.8455355, 0.6072608, 0, 0, 0, 1, 1,
-0.5526252, -1.149209, -3.886407, 0, 0, 0, 1, 1,
-0.5523793, -0.4291568, -2.94087, 0, 0, 0, 1, 1,
-0.5445604, 0.1172513, -2.837662, 1, 1, 1, 1, 1,
-0.5415781, -0.9248399, -1.015239, 1, 1, 1, 1, 1,
-0.5390395, 0.1092775, -1.845156, 1, 1, 1, 1, 1,
-0.538441, -0.1854695, -0.2354829, 1, 1, 1, 1, 1,
-0.5356888, 1.155913, -1.587867, 1, 1, 1, 1, 1,
-0.5350984, 1.194301, -2.275822, 1, 1, 1, 1, 1,
-0.5350491, -0.2429315, -0.6078231, 1, 1, 1, 1, 1,
-0.5331413, -0.2325719, -0.2696057, 1, 1, 1, 1, 1,
-0.5321923, 1.235129, 0.572203, 1, 1, 1, 1, 1,
-0.5317817, 1.287, -1.435262, 1, 1, 1, 1, 1,
-0.5311894, -0.1619803, -2.566962, 1, 1, 1, 1, 1,
-0.5311219, 0.08636105, -1.344968, 1, 1, 1, 1, 1,
-0.5311173, 0.01669007, -2.451844, 1, 1, 1, 1, 1,
-0.5254439, -1.352139, -1.088545, 1, 1, 1, 1, 1,
-0.5214311, 0.2346241, -2.038663, 1, 1, 1, 1, 1,
-0.5207025, -0.2452629, -2.633088, 0, 0, 1, 1, 1,
-0.5157796, -1.290404, -2.817527, 1, 0, 0, 1, 1,
-0.5142258, -1.006527, -4.431444, 1, 0, 0, 1, 1,
-0.5114289, -0.5620188, -2.605239, 1, 0, 0, 1, 1,
-0.5060798, 1.091983, 0.3798355, 1, 0, 0, 1, 1,
-0.5045623, 1.287338, -0.608527, 1, 0, 0, 1, 1,
-0.5038063, -0.8746382, -4.026268, 0, 0, 0, 1, 1,
-0.5021344, -1.117001, -2.544275, 0, 0, 0, 1, 1,
-0.5015433, -0.5014056, -1.34788, 0, 0, 0, 1, 1,
-0.5009247, 0.7234931, -0.06928025, 0, 0, 0, 1, 1,
-0.4993203, -1.503367, -3.425055, 0, 0, 0, 1, 1,
-0.4936118, -0.6389288, -2.562771, 0, 0, 0, 1, 1,
-0.4923352, 1.351452, -0.9954689, 0, 0, 0, 1, 1,
-0.4885477, 0.6387928, 1.101058, 1, 1, 1, 1, 1,
-0.4798317, 1.540547, 0.3672935, 1, 1, 1, 1, 1,
-0.4693958, 0.8224747, -1.266043, 1, 1, 1, 1, 1,
-0.4612347, 0.2539488, 0.4074584, 1, 1, 1, 1, 1,
-0.4524726, 1.234379, -0.0587459, 1, 1, 1, 1, 1,
-0.4513476, -0.5644965, -1.949931, 1, 1, 1, 1, 1,
-0.4459411, 1.601173, 1.542745, 1, 1, 1, 1, 1,
-0.444985, -0.7771457, -1.124014, 1, 1, 1, 1, 1,
-0.44009, -0.9426834, -2.433043, 1, 1, 1, 1, 1,
-0.4302316, -1.49402, -4.254571, 1, 1, 1, 1, 1,
-0.4284184, -0.6888505, -2.229304, 1, 1, 1, 1, 1,
-0.4268975, -0.162894, -1.783327, 1, 1, 1, 1, 1,
-0.4216983, 0.4370859, -0.7799909, 1, 1, 1, 1, 1,
-0.4204279, 0.7374313, -0.6081927, 1, 1, 1, 1, 1,
-0.4163598, -1.351598, -1.055998, 1, 1, 1, 1, 1,
-0.4140584, 1.07734, 0.001353025, 0, 0, 1, 1, 1,
-0.4070992, -1.135719, -3.632315, 1, 0, 0, 1, 1,
-0.4058842, 1.214396, -0.9767129, 1, 0, 0, 1, 1,
-0.4002964, -0.507307, -3.788036, 1, 0, 0, 1, 1,
-0.4000131, -1.002513, -2.52529, 1, 0, 0, 1, 1,
-0.3949914, 0.5399696, -1.67954, 1, 0, 0, 1, 1,
-0.3943515, -0.5594448, -2.253871, 0, 0, 0, 1, 1,
-0.3823651, -0.1769358, -1.485604, 0, 0, 0, 1, 1,
-0.3804471, -1.012835, -3.630544, 0, 0, 0, 1, 1,
-0.379953, 0.8579612, 0.2758411, 0, 0, 0, 1, 1,
-0.3774732, -0.9665343, -4.279192, 0, 0, 0, 1, 1,
-0.3770122, 0.04438984, 0.1967235, 0, 0, 0, 1, 1,
-0.3709708, 0.2967179, -0.128794, 0, 0, 0, 1, 1,
-0.3694237, 0.006426396, -3.035389, 1, 1, 1, 1, 1,
-0.3688279, 0.1583005, 1.083004, 1, 1, 1, 1, 1,
-0.3684667, 0.5932782, -1.003899, 1, 1, 1, 1, 1,
-0.3523685, -1.025875, -4.879273, 1, 1, 1, 1, 1,
-0.3506459, -0.8921917, -3.113667, 1, 1, 1, 1, 1,
-0.3502366, 0.3608729, -0.8938539, 1, 1, 1, 1, 1,
-0.3484893, -0.6283504, -2.461446, 1, 1, 1, 1, 1,
-0.3466813, -1.396759, -3.15454, 1, 1, 1, 1, 1,
-0.3454519, -1.135551, -3.496193, 1, 1, 1, 1, 1,
-0.3442494, -0.5268438, -2.983625, 1, 1, 1, 1, 1,
-0.3349971, 1.745434, 0.3082762, 1, 1, 1, 1, 1,
-0.3295371, 0.9593319, 1.466258, 1, 1, 1, 1, 1,
-0.3292875, -1.089743, -3.544343, 1, 1, 1, 1, 1,
-0.3286861, -0.3785206, -2.585263, 1, 1, 1, 1, 1,
-0.3274876, -0.3746652, -1.171092, 1, 1, 1, 1, 1,
-0.3212063, 0.02956015, -0.007971926, 0, 0, 1, 1, 1,
-0.31917, 0.2505266, 0.4874689, 1, 0, 0, 1, 1,
-0.3186091, -0.05514345, -2.214002, 1, 0, 0, 1, 1,
-0.3175322, -1.521833, -3.295893, 1, 0, 0, 1, 1,
-0.3146804, 0.1224386, -2.829774, 1, 0, 0, 1, 1,
-0.3127663, -0.126164, -2.947326, 1, 0, 0, 1, 1,
-0.3090229, -0.1210602, -2.86742, 0, 0, 0, 1, 1,
-0.3083706, -1.374421, -3.345099, 0, 0, 0, 1, 1,
-0.3025303, -0.4618958, -4.235921, 0, 0, 0, 1, 1,
-0.302179, 0.2880257, -0.4047723, 0, 0, 0, 1, 1,
-0.3008352, 0.6095263, -0.9360443, 0, 0, 0, 1, 1,
-0.2923456, -0.1244641, -0.1893418, 0, 0, 0, 1, 1,
-0.2837924, -1.006637, -5.065391, 0, 0, 0, 1, 1,
-0.2815935, 0.9134983, -1.0788, 1, 1, 1, 1, 1,
-0.2812671, -0.406894, -2.400531, 1, 1, 1, 1, 1,
-0.2772201, -0.5585944, -1.019726, 1, 1, 1, 1, 1,
-0.2761548, -0.9714831, -2.568305, 1, 1, 1, 1, 1,
-0.2733557, -0.05352214, -3.869487, 1, 1, 1, 1, 1,
-0.2701092, 0.8983407, -1.373041, 1, 1, 1, 1, 1,
-0.2635135, -0.2663811, -3.46187, 1, 1, 1, 1, 1,
-0.2617302, -0.7600134, -3.226473, 1, 1, 1, 1, 1,
-0.2590202, -1.564657, -3.211277, 1, 1, 1, 1, 1,
-0.2555685, -0.5301299, -3.720886, 1, 1, 1, 1, 1,
-0.2543298, -0.6377907, -3.8513, 1, 1, 1, 1, 1,
-0.252418, -0.1144931, -1.435369, 1, 1, 1, 1, 1,
-0.2513551, -0.4242525, -1.26633, 1, 1, 1, 1, 1,
-0.2511902, 2.068554, -1.52032, 1, 1, 1, 1, 1,
-0.249569, -0.2818783, -3.000336, 1, 1, 1, 1, 1,
-0.2471566, 1.337586, 0.6429051, 0, 0, 1, 1, 1,
-0.2462422, 0.5342516, -1.881377, 1, 0, 0, 1, 1,
-0.2451595, -0.2029608, -2.689566, 1, 0, 0, 1, 1,
-0.2447585, -0.515662, -2.654753, 1, 0, 0, 1, 1,
-0.2433917, 0.4051796, -0.3601712, 1, 0, 0, 1, 1,
-0.2418812, -0.4302047, -3.293067, 1, 0, 0, 1, 1,
-0.2405257, 0.6054911, -0.4604897, 0, 0, 0, 1, 1,
-0.2384142, 1.142529, -1.395835, 0, 0, 0, 1, 1,
-0.2380907, 2.038522, 2.160313, 0, 0, 0, 1, 1,
-0.2374303, -1.300617, -3.027228, 0, 0, 0, 1, 1,
-0.236347, -1.598175, -5.507641, 0, 0, 0, 1, 1,
-0.2342657, 0.6487644, 0.3208339, 0, 0, 0, 1, 1,
-0.2323291, 0.0437833, 0.0005658253, 0, 0, 0, 1, 1,
-0.2271183, 0.3426439, -0.7670987, 1, 1, 1, 1, 1,
-0.2269773, 1.897936, 0.3625474, 1, 1, 1, 1, 1,
-0.224759, 0.6702011, -0.4364941, 1, 1, 1, 1, 1,
-0.2236173, -0.4697468, -3.314241, 1, 1, 1, 1, 1,
-0.219615, 1.169497, 0.496471, 1, 1, 1, 1, 1,
-0.2144605, -1.061571, -5.060162, 1, 1, 1, 1, 1,
-0.2141801, 0.5492396, 1.093729, 1, 1, 1, 1, 1,
-0.2132556, -0.3928098, -1.569234, 1, 1, 1, 1, 1,
-0.2098899, 0.2791062, 0.2247021, 1, 1, 1, 1, 1,
-0.2095725, 0.2843205, 0.08632496, 1, 1, 1, 1, 1,
-0.2091463, -0.7316729, -2.062394, 1, 1, 1, 1, 1,
-0.2057114, -0.7153187, -3.770796, 1, 1, 1, 1, 1,
-0.2045722, 0.7765077, -0.05862696, 1, 1, 1, 1, 1,
-0.2014661, 0.9197275, 1.217497, 1, 1, 1, 1, 1,
-0.1995858, 1.679996, -1.544174, 1, 1, 1, 1, 1,
-0.1938859, 0.2958795, -0.8779236, 0, 0, 1, 1, 1,
-0.1871292, -0.6845547, -3.542343, 1, 0, 0, 1, 1,
-0.1807545, 0.8354924, 0.2376224, 1, 0, 0, 1, 1,
-0.1784497, 0.6166047, 0.57586, 1, 0, 0, 1, 1,
-0.1766727, -0.09484229, -2.066789, 1, 0, 0, 1, 1,
-0.1736972, -0.3836386, -2.733742, 1, 0, 0, 1, 1,
-0.1722988, 0.3181126, 2.540253, 0, 0, 0, 1, 1,
-0.1676393, 0.3014739, -0.2027919, 0, 0, 0, 1, 1,
-0.1671718, -0.3847077, -2.229036, 0, 0, 0, 1, 1,
-0.1667793, -0.1039936, -3.601059, 0, 0, 0, 1, 1,
-0.1655959, -0.3047769, -3.378999, 0, 0, 0, 1, 1,
-0.1642767, 0.3660146, -1.098123, 0, 0, 0, 1, 1,
-0.1633056, -0.09852935, -2.841608, 0, 0, 0, 1, 1,
-0.159829, -0.560806, -2.969811, 1, 1, 1, 1, 1,
-0.1569793, -0.7461181, -3.767431, 1, 1, 1, 1, 1,
-0.1536345, 0.4370214, -0.2685838, 1, 1, 1, 1, 1,
-0.1488781, -0.6303071, -3.442955, 1, 1, 1, 1, 1,
-0.1462792, -0.867466, -4.256889, 1, 1, 1, 1, 1,
-0.1434781, -0.3329231, -2.56553, 1, 1, 1, 1, 1,
-0.1427555, 0.8656958, -0.8194615, 1, 1, 1, 1, 1,
-0.142573, 0.2291784, -1.268669, 1, 1, 1, 1, 1,
-0.1376795, -0.2538238, -2.667792, 1, 1, 1, 1, 1,
-0.1365012, -0.6261327, -4.393414, 1, 1, 1, 1, 1,
-0.1262854, -0.8089776, -0.7406514, 1, 1, 1, 1, 1,
-0.1244794, 1.171901, -0.6915109, 1, 1, 1, 1, 1,
-0.1242606, 0.2824479, 0.7999033, 1, 1, 1, 1, 1,
-0.1211152, -0.3847525, -3.384204, 1, 1, 1, 1, 1,
-0.1148926, 1.708559, 1.861917, 1, 1, 1, 1, 1,
-0.1137954, -0.8385838, -2.714279, 0, 0, 1, 1, 1,
-0.1137564, -0.7966607, -3.91946, 1, 0, 0, 1, 1,
-0.1066026, -0.1119837, -0.1968694, 1, 0, 0, 1, 1,
-0.1038244, -0.8616015, -3.410736, 1, 0, 0, 1, 1,
-0.1025489, -1.220703, -3.547265, 1, 0, 0, 1, 1,
-0.09885201, 0.5082338, 0.3294216, 1, 0, 0, 1, 1,
-0.09873441, 0.1744219, -1.111211, 0, 0, 0, 1, 1,
-0.09037183, 1.308756, 1.908444, 0, 0, 0, 1, 1,
-0.08601104, 1.020357, -0.6829166, 0, 0, 0, 1, 1,
-0.08592349, -0.7974967, -3.810393, 0, 0, 0, 1, 1,
-0.08289136, 0.7622738, 1.517012, 0, 0, 0, 1, 1,
-0.07753522, 1.347849, -1.253276, 0, 0, 0, 1, 1,
-0.07375887, -0.6874614, -2.089605, 0, 0, 0, 1, 1,
-0.07092186, 1.412381, -1.53481, 1, 1, 1, 1, 1,
-0.07002963, 0.8392441, 0.0912187, 1, 1, 1, 1, 1,
-0.0629235, 1.777792, 0.6200817, 1, 1, 1, 1, 1,
-0.06012206, 1.339571, -1.042425, 1, 1, 1, 1, 1,
-0.05666379, -0.2583796, -3.016982, 1, 1, 1, 1, 1,
-0.05597225, -0.2661965, -2.04448, 1, 1, 1, 1, 1,
-0.05354123, 0.1876013, -0.1775827, 1, 1, 1, 1, 1,
-0.04880982, -0.1136556, -2.06898, 1, 1, 1, 1, 1,
-0.04574201, -0.8336213, -2.777307, 1, 1, 1, 1, 1,
-0.04267309, 0.1809955, -1.408219, 1, 1, 1, 1, 1,
-0.04158003, 1.13129, -1.657729, 1, 1, 1, 1, 1,
-0.03471466, 1.171784, -1.054709, 1, 1, 1, 1, 1,
-0.03354565, 0.04656291, 0.4069076, 1, 1, 1, 1, 1,
-0.02945492, 0.635913, -0.1316666, 1, 1, 1, 1, 1,
-0.02206749, -0.9368236, -4.720956, 1, 1, 1, 1, 1,
-0.01973927, -0.7331102, -2.344659, 0, 0, 1, 1, 1,
-0.01623684, 1.472849, -0.3853292, 1, 0, 0, 1, 1,
-0.0138708, 1.917107, 0.6179041, 1, 0, 0, 1, 1,
-0.00179153, -1.397257, -3.939566, 1, 0, 0, 1, 1,
-0.001249739, -0.3251176, -2.075927, 1, 0, 0, 1, 1,
-0.001215242, -0.3601446, -2.261829, 1, 0, 0, 1, 1,
0.002170291, -0.293161, 4.520844, 0, 0, 0, 1, 1,
0.004527932, -1.276319, 2.477353, 0, 0, 0, 1, 1,
0.008549216, 0.9522764, 0.6106209, 0, 0, 0, 1, 1,
0.009400296, -0.1295337, 2.901557, 0, 0, 0, 1, 1,
0.01079286, -0.2847086, 3.945728, 0, 0, 0, 1, 1,
0.01088575, -0.1530449, 2.908945, 0, 0, 0, 1, 1,
0.01380472, -0.09551693, 4.397522, 0, 0, 0, 1, 1,
0.01439478, 0.02491871, 1.484835, 1, 1, 1, 1, 1,
0.01594128, 0.9716919, -1.321636, 1, 1, 1, 1, 1,
0.01742077, -1.147951, 3.095373, 1, 1, 1, 1, 1,
0.01878325, -0.3956702, 2.878313, 1, 1, 1, 1, 1,
0.02073404, -1.680459, 4.653311, 1, 1, 1, 1, 1,
0.02155996, 0.1025971, 0.4893696, 1, 1, 1, 1, 1,
0.02333291, -0.1687596, 2.84724, 1, 1, 1, 1, 1,
0.03151562, -1.935494, 3.389402, 1, 1, 1, 1, 1,
0.03213737, 0.6405367, 0.9697516, 1, 1, 1, 1, 1,
0.03819169, 1.087127, -0.8174701, 1, 1, 1, 1, 1,
0.04832711, -0.5335296, 5.11284, 1, 1, 1, 1, 1,
0.04848031, -0.2818823, 1.571679, 1, 1, 1, 1, 1,
0.04985137, 1.264606, -0.8137237, 1, 1, 1, 1, 1,
0.05044966, -0.938092, 2.358305, 1, 1, 1, 1, 1,
0.0542923, 0.6933382, 0.4849794, 1, 1, 1, 1, 1,
0.06012134, 1.872029, 0.9241869, 0, 0, 1, 1, 1,
0.0633513, 0.2647982, 2.072563, 1, 0, 0, 1, 1,
0.06335884, -0.2862207, 2.62193, 1, 0, 0, 1, 1,
0.0634395, 1.894188, 1.144795, 1, 0, 0, 1, 1,
0.06489111, 0.5847412, -0.4662085, 1, 0, 0, 1, 1,
0.0673033, -0.1144122, 1.984292, 1, 0, 0, 1, 1,
0.06906198, -1.16844, 3.196363, 0, 0, 0, 1, 1,
0.06939001, 1.821698, 1.834712, 0, 0, 0, 1, 1,
0.07398961, -0.22623, 3.509281, 0, 0, 0, 1, 1,
0.07618291, -0.1383568, 3.342129, 0, 0, 0, 1, 1,
0.07659588, 0.5473208, -1.205097, 0, 0, 0, 1, 1,
0.07784532, -0.7486202, 1.8244, 0, 0, 0, 1, 1,
0.07854381, -1.125996, 3.440628, 0, 0, 0, 1, 1,
0.08191074, 1.310772, -0.8165488, 1, 1, 1, 1, 1,
0.08354981, 0.5410521, 0.8189428, 1, 1, 1, 1, 1,
0.08371554, 2.344459, 1.625488, 1, 1, 1, 1, 1,
0.08425301, 0.8266399, -0.5443929, 1, 1, 1, 1, 1,
0.08500449, 0.5532246, 0.7246907, 1, 1, 1, 1, 1,
0.08667441, -1.073223, 4.07591, 1, 1, 1, 1, 1,
0.09115136, -0.06511813, 1.938621, 1, 1, 1, 1, 1,
0.0934724, 0.790043, 0.8656417, 1, 1, 1, 1, 1,
0.09453167, -0.3685909, 2.080072, 1, 1, 1, 1, 1,
0.09559344, 1.25001, 0.4660823, 1, 1, 1, 1, 1,
0.0966107, 1.361657, -0.07815564, 1, 1, 1, 1, 1,
0.09825079, -2.64076, 2.652556, 1, 1, 1, 1, 1,
0.09886511, -1.752748, 3.411954, 1, 1, 1, 1, 1,
0.1047226, 0.9036962, -0.7475742, 1, 1, 1, 1, 1,
0.113857, -0.3001904, 0.3313341, 1, 1, 1, 1, 1,
0.1143247, 0.8303727, 0.6688783, 0, 0, 1, 1, 1,
0.1172364, -0.06637895, 2.545972, 1, 0, 0, 1, 1,
0.1180493, -1.21002, 2.977533, 1, 0, 0, 1, 1,
0.1195088, 0.6943104, -0.1882379, 1, 0, 0, 1, 1,
0.1198652, 0.5328454, 0.1120226, 1, 0, 0, 1, 1,
0.1209893, 0.3660184, 0.7143973, 1, 0, 0, 1, 1,
0.1212311, 0.164858, 1.610435, 0, 0, 0, 1, 1,
0.1229835, 0.1711712, -0.958813, 0, 0, 0, 1, 1,
0.1243297, 0.9795465, -0.8143707, 0, 0, 0, 1, 1,
0.1265878, -0.03084333, 1.152865, 0, 0, 0, 1, 1,
0.1291734, -0.02236747, 2.551181, 0, 0, 0, 1, 1,
0.13484, -1.857389, 4.54013, 0, 0, 0, 1, 1,
0.1481466, -1.505837, 3.257989, 0, 0, 0, 1, 1,
0.1505182, 0.03638339, 2.860269, 1, 1, 1, 1, 1,
0.150639, 1.442456, 2.47352, 1, 1, 1, 1, 1,
0.1512337, 0.1519947, 0.04873086, 1, 1, 1, 1, 1,
0.1538454, -0.1389273, 0.5602152, 1, 1, 1, 1, 1,
0.1538543, 0.8774252, 0.7475697, 1, 1, 1, 1, 1,
0.154737, -1.197778, 2.66084, 1, 1, 1, 1, 1,
0.1587103, -0.3149851, 3.738724, 1, 1, 1, 1, 1,
0.1602719, 0.5566776, -1.356415, 1, 1, 1, 1, 1,
0.1603824, -0.9460483, 3.94057, 1, 1, 1, 1, 1,
0.164313, -0.7939421, 2.501117, 1, 1, 1, 1, 1,
0.1662366, 1.851445, -0.2877502, 1, 1, 1, 1, 1,
0.1667668, 0.8066671, -0.1053366, 1, 1, 1, 1, 1,
0.1692294, -0.5275064, 3.418774, 1, 1, 1, 1, 1,
0.1703027, -1.983239, 3.542152, 1, 1, 1, 1, 1,
0.1733264, 0.7619388, -0.4978828, 1, 1, 1, 1, 1,
0.1749001, 0.8066918, 0.6294628, 0, 0, 1, 1, 1,
0.1755993, 0.4738009, 0.8036487, 1, 0, 0, 1, 1,
0.1781105, 0.4311731, 0.1537458, 1, 0, 0, 1, 1,
0.1781276, 0.8406012, -0.1476182, 1, 0, 0, 1, 1,
0.1782895, 1.065965, -0.05561852, 1, 0, 0, 1, 1,
0.1851357, 0.9753826, -0.6200564, 1, 0, 0, 1, 1,
0.1884392, 1.719754, 0.176494, 0, 0, 0, 1, 1,
0.1937971, 1.401914, -2.09331, 0, 0, 0, 1, 1,
0.2045868, 2.526759, -1.094638, 0, 0, 0, 1, 1,
0.2058449, -0.2496274, 1.532422, 0, 0, 0, 1, 1,
0.212924, -0.5981076, 2.650634, 0, 0, 0, 1, 1,
0.2170157, -1.386985, 2.633255, 0, 0, 0, 1, 1,
0.2251022, 0.2107941, 2.197206, 0, 0, 0, 1, 1,
0.2265671, 0.465101, -1.138031, 1, 1, 1, 1, 1,
0.2279266, 1.51069, 0.03119523, 1, 1, 1, 1, 1,
0.2379717, 0.6132512, 1.136527, 1, 1, 1, 1, 1,
0.239407, -0.5290862, 1.316897, 1, 1, 1, 1, 1,
0.239517, -1.614563, 1.98598, 1, 1, 1, 1, 1,
0.2417375, 0.289822, 0.5702536, 1, 1, 1, 1, 1,
0.2427469, 3.218274, 0.652451, 1, 1, 1, 1, 1,
0.2479223, -0.649572, 2.790128, 1, 1, 1, 1, 1,
0.2516917, 0.03797068, 1.780759, 1, 1, 1, 1, 1,
0.2533505, 1.105098, 0.7242647, 1, 1, 1, 1, 1,
0.2544888, -0.7824115, 3.103029, 1, 1, 1, 1, 1,
0.2554875, 0.1831881, 1.096457, 1, 1, 1, 1, 1,
0.2562878, 0.9698108, 0.3342514, 1, 1, 1, 1, 1,
0.2586455, 0.03730908, 1.101573, 1, 1, 1, 1, 1,
0.2589684, 0.05090188, 0.4000911, 1, 1, 1, 1, 1,
0.2603096, 0.8015173, -0.8312488, 0, 0, 1, 1, 1,
0.2614801, -0.1486405, 2.217446, 1, 0, 0, 1, 1,
0.2660302, -1.592667, 3.357877, 1, 0, 0, 1, 1,
0.2674294, 0.5332583, 0.07130485, 1, 0, 0, 1, 1,
0.2819534, -0.01217332, 1.129546, 1, 0, 0, 1, 1,
0.2824091, 0.340837, 2.11717, 1, 0, 0, 1, 1,
0.2858943, 0.4940047, 2.080637, 0, 0, 0, 1, 1,
0.2864526, 0.2018334, 0.2432563, 0, 0, 0, 1, 1,
0.2900202, -1.530661, 4.03921, 0, 0, 0, 1, 1,
0.2901615, 1.252663, 1.153846, 0, 0, 0, 1, 1,
0.2928989, 0.08596269, 2.09798, 0, 0, 0, 1, 1,
0.3069754, 0.2884019, -0.2651579, 0, 0, 0, 1, 1,
0.3096229, -1.223003, 4.062723, 0, 0, 0, 1, 1,
0.3106041, 1.604701, 0.2173658, 1, 1, 1, 1, 1,
0.3159729, 1.24626, -0.27709, 1, 1, 1, 1, 1,
0.3187474, -0.1024422, 2.732792, 1, 1, 1, 1, 1,
0.3206406, 0.7925816, -0.5986873, 1, 1, 1, 1, 1,
0.3213569, 1.290735, 0.5708344, 1, 1, 1, 1, 1,
0.3244993, 0.4327546, -1.003093, 1, 1, 1, 1, 1,
0.3261538, 0.656521, -0.3448731, 1, 1, 1, 1, 1,
0.3282298, 1.097297, 0.8047234, 1, 1, 1, 1, 1,
0.3295454, 1.245531, 0.6730497, 1, 1, 1, 1, 1,
0.3300104, 0.3774989, -1.987976, 1, 1, 1, 1, 1,
0.3329035, 0.755931, 2.184185, 1, 1, 1, 1, 1,
0.3338127, -0.3985215, 3.074115, 1, 1, 1, 1, 1,
0.3351025, -0.6318831, 2.931734, 1, 1, 1, 1, 1,
0.3355457, -0.8943126, 5.334704, 1, 1, 1, 1, 1,
0.3376892, 0.7745249, 2.63701, 1, 1, 1, 1, 1,
0.3377529, -2.049341, 3.027326, 0, 0, 1, 1, 1,
0.3380095, 0.4031005, -0.9310232, 1, 0, 0, 1, 1,
0.3465784, -0.7085129, 1.496641, 1, 0, 0, 1, 1,
0.3468102, -0.176792, 1.780447, 1, 0, 0, 1, 1,
0.3478461, -0.563114, 1.589107, 1, 0, 0, 1, 1,
0.3610925, -0.3673989, 0.5785723, 1, 0, 0, 1, 1,
0.3613209, 1.476952, 1.873117, 0, 0, 0, 1, 1,
0.3668635, 0.8536842, 0.6073003, 0, 0, 0, 1, 1,
0.3698072, 1.061872, 0.2198855, 0, 0, 0, 1, 1,
0.3700982, -0.510569, 0.440321, 0, 0, 0, 1, 1,
0.3703873, -0.08265367, 2.421294, 0, 0, 0, 1, 1,
0.3716857, 0.4069995, 1.545995, 0, 0, 0, 1, 1,
0.3736801, 0.7433475, 0.7663181, 0, 0, 0, 1, 1,
0.3761284, 0.4136686, -0.1645943, 1, 1, 1, 1, 1,
0.3761352, 0.903526, 0.01040785, 1, 1, 1, 1, 1,
0.3772234, -1.603302, 3.380812, 1, 1, 1, 1, 1,
0.3779422, -3.267439, 2.957841, 1, 1, 1, 1, 1,
0.3779915, 0.1658203, 1.332538, 1, 1, 1, 1, 1,
0.3780424, 1.230996, 0.2895696, 1, 1, 1, 1, 1,
0.3792754, -0.8304569, 4.015534, 1, 1, 1, 1, 1,
0.3795013, -1.200284, 3.874637, 1, 1, 1, 1, 1,
0.380138, -0.530791, 4.167544, 1, 1, 1, 1, 1,
0.3876315, -0.7219618, 1.109152, 1, 1, 1, 1, 1,
0.388181, 1.136574, -0.5861894, 1, 1, 1, 1, 1,
0.3903103, -0.9692322, 3.852463, 1, 1, 1, 1, 1,
0.3938202, 1.793271, -1.218627, 1, 1, 1, 1, 1,
0.3976606, 0.4074142, -0.1021154, 1, 1, 1, 1, 1,
0.4005414, 0.9561282, 0.6842343, 1, 1, 1, 1, 1,
0.4026845, -0.3137575, 0.6946774, 0, 0, 1, 1, 1,
0.4039774, 0.1261371, 0.7444775, 1, 0, 0, 1, 1,
0.4109195, -1.138208, 2.842913, 1, 0, 0, 1, 1,
0.4127345, -1.612785, 3.909499, 1, 0, 0, 1, 1,
0.4190972, -0.8536198, 2.687748, 1, 0, 0, 1, 1,
0.4206945, -0.714811, 4.614348, 1, 0, 0, 1, 1,
0.4208249, 1.66397, 0.4419975, 0, 0, 0, 1, 1,
0.4300654, 1.461653, 0.4655896, 0, 0, 0, 1, 1,
0.4317831, -0.3904766, 0.5834885, 0, 0, 0, 1, 1,
0.4324575, 0.272441, 0.2311728, 0, 0, 0, 1, 1,
0.4350863, 1.476997, 1.639917, 0, 0, 0, 1, 1,
0.4352829, 1.3041, -0.9934391, 0, 0, 0, 1, 1,
0.4355579, -0.1259461, 2.416306, 0, 0, 0, 1, 1,
0.4410095, -0.06016225, 2.038414, 1, 1, 1, 1, 1,
0.4436895, 0.8878873, 1.709718, 1, 1, 1, 1, 1,
0.4563199, -0.3661015, 1.405411, 1, 1, 1, 1, 1,
0.4602313, 0.3131843, 1.581837, 1, 1, 1, 1, 1,
0.4656594, 0.1216813, 0.0275032, 1, 1, 1, 1, 1,
0.4704028, 0.5562193, 0.3370364, 1, 1, 1, 1, 1,
0.4721402, -1.409305, 2.069658, 1, 1, 1, 1, 1,
0.4744855, 0.718437, 1.845321, 1, 1, 1, 1, 1,
0.4760046, 0.6186488, 0.4636084, 1, 1, 1, 1, 1,
0.479882, -1.311018, 1.999776, 1, 1, 1, 1, 1,
0.4843857, -0.736786, 2.400463, 1, 1, 1, 1, 1,
0.486831, 0.660325, 0.004998491, 1, 1, 1, 1, 1,
0.4872155, 1.015806, 0.554523, 1, 1, 1, 1, 1,
0.4977785, 0.830267, 0.7212847, 1, 1, 1, 1, 1,
0.5019812, -0.08321369, 1.282561, 1, 1, 1, 1, 1,
0.5075865, 0.05081679, 0.5385825, 0, 0, 1, 1, 1,
0.5077265, 0.6724294, 1.377725, 1, 0, 0, 1, 1,
0.5097607, 0.5448711, 2.327491, 1, 0, 0, 1, 1,
0.5112198, 0.7974043, 2.015099, 1, 0, 0, 1, 1,
0.5116404, -0.7470474, 2.053167, 1, 0, 0, 1, 1,
0.5165748, -0.3925251, 4.036694, 1, 0, 0, 1, 1,
0.5197042, -0.2049287, 3.721563, 0, 0, 0, 1, 1,
0.5212771, 0.6341585, 0.07524298, 0, 0, 0, 1, 1,
0.5214029, -0.5037079, 3.750061, 0, 0, 0, 1, 1,
0.5232944, 0.7980877, 0.2243769, 0, 0, 0, 1, 1,
0.5263681, 0.07755928, 0.7159145, 0, 0, 0, 1, 1,
0.5318719, 0.05633565, 2.40643, 0, 0, 0, 1, 1,
0.5355041, 0.3067606, 0.2601171, 0, 0, 0, 1, 1,
0.5375791, -0.1318052, 1.136179, 1, 1, 1, 1, 1,
0.5384169, -1.262439, 2.848765, 1, 1, 1, 1, 1,
0.5468266, 0.2824498, 1.631643, 1, 1, 1, 1, 1,
0.551087, 0.8762119, 0.5132461, 1, 1, 1, 1, 1,
0.553, 0.5840867, 0.9386128, 1, 1, 1, 1, 1,
0.5530503, 3.22455, 0.3301028, 1, 1, 1, 1, 1,
0.5569789, -0.8218411, 1.870039, 1, 1, 1, 1, 1,
0.5602302, 0.3437614, 1.339962, 1, 1, 1, 1, 1,
0.560779, -1.367, 0.9223435, 1, 1, 1, 1, 1,
0.5635858, -1.308436, 2.905938, 1, 1, 1, 1, 1,
0.5653835, -0.2478046, 2.655495, 1, 1, 1, 1, 1,
0.5717854, 1.777008, -0.7535596, 1, 1, 1, 1, 1,
0.5726185, 0.4363985, 0.6621078, 1, 1, 1, 1, 1,
0.5736198, 0.6568097, -0.6836844, 1, 1, 1, 1, 1,
0.5787036, -0.8227754, 2.200953, 1, 1, 1, 1, 1,
0.5806891, -0.02105323, -0.5541039, 0, 0, 1, 1, 1,
0.5816988, -0.413043, 1.357548, 1, 0, 0, 1, 1,
0.587749, -0.9832285, 2.021166, 1, 0, 0, 1, 1,
0.5927662, 0.8564694, -0.3042427, 1, 0, 0, 1, 1,
0.5977111, 0.6921919, -0.7687379, 1, 0, 0, 1, 1,
0.6056651, -0.2587747, 1.075998, 1, 0, 0, 1, 1,
0.6060685, -0.2166797, 2.009336, 0, 0, 0, 1, 1,
0.618113, 0.9505177, 1.195024, 0, 0, 0, 1, 1,
0.6194369, -0.1243122, 3.232414, 0, 0, 0, 1, 1,
0.6232473, 0.00736805, 1.575011, 0, 0, 0, 1, 1,
0.6239471, -1.073473, 1.559888, 0, 0, 0, 1, 1,
0.6260549, 1.296353, 0.6495385, 0, 0, 0, 1, 1,
0.6279404, 0.7902922, 1.886934, 0, 0, 0, 1, 1,
0.6312381, 0.1648493, 0.7349215, 1, 1, 1, 1, 1,
0.6324955, 0.5289253, 0.3013662, 1, 1, 1, 1, 1,
0.6342881, -0.1654035, 3.954891, 1, 1, 1, 1, 1,
0.6350808, 0.9041674, -0.2160317, 1, 1, 1, 1, 1,
0.6358424, -0.06134903, -0.2983051, 1, 1, 1, 1, 1,
0.6387378, 0.4615663, 1.280661, 1, 1, 1, 1, 1,
0.6397127, -0.1901729, 0.998529, 1, 1, 1, 1, 1,
0.6437688, -1.455364, 3.718015, 1, 1, 1, 1, 1,
0.6446908, -1.236886, 1.477026, 1, 1, 1, 1, 1,
0.6491055, 0.1487932, 2.577378, 1, 1, 1, 1, 1,
0.6502532, -0.8591157, 1.057271, 1, 1, 1, 1, 1,
0.6540703, 0.3099361, 2.87287, 1, 1, 1, 1, 1,
0.6555137, 0.5291716, 1.629165, 1, 1, 1, 1, 1,
0.6566189, -0.9778574, 2.990982, 1, 1, 1, 1, 1,
0.6599211, 0.9534425, 1.000866, 1, 1, 1, 1, 1,
0.662142, -0.9488054, 3.394426, 0, 0, 1, 1, 1,
0.6636209, 1.86359, 1.030129, 1, 0, 0, 1, 1,
0.6664442, -0.960147, 1.41092, 1, 0, 0, 1, 1,
0.6705561, 0.5776436, 0.3547591, 1, 0, 0, 1, 1,
0.6765791, -1.299616, 2.915957, 1, 0, 0, 1, 1,
0.6783401, -0.6789067, 3.647822, 1, 0, 0, 1, 1,
0.6797075, -0.4741802, 3.04253, 0, 0, 0, 1, 1,
0.6802951, 0.104345, 1.740761, 0, 0, 0, 1, 1,
0.6863189, -1.291018, 2.636474, 0, 0, 0, 1, 1,
0.6888598, 0.1593174, 2.021162, 0, 0, 0, 1, 1,
0.6964892, -1.629732, 1.956271, 0, 0, 0, 1, 1,
0.6966416, -1.678721, 2.787669, 0, 0, 0, 1, 1,
0.6968582, 0.55042, -0.1203992, 0, 0, 0, 1, 1,
0.7013476, -1.312559, 1.028997, 1, 1, 1, 1, 1,
0.7037466, -0.5142605, 3.729799, 1, 1, 1, 1, 1,
0.7102104, -0.898874, 2.378829, 1, 1, 1, 1, 1,
0.7152691, 0.1910027, 1.447667, 1, 1, 1, 1, 1,
0.7158279, 0.1383284, 2.907542, 1, 1, 1, 1, 1,
0.7171592, 0.1655233, 0.6607307, 1, 1, 1, 1, 1,
0.7197853, 0.007956007, 2.383097, 1, 1, 1, 1, 1,
0.7223345, 0.3743357, 1.445513, 1, 1, 1, 1, 1,
0.7227774, -1.349213, -0.2382707, 1, 1, 1, 1, 1,
0.7248591, -1.499276, 3.727052, 1, 1, 1, 1, 1,
0.7299007, 0.00236038, 0.2207082, 1, 1, 1, 1, 1,
0.7309589, 1.886789, 0.6719478, 1, 1, 1, 1, 1,
0.7377136, 0.2430877, 2.934302, 1, 1, 1, 1, 1,
0.7378291, 0.9525021, 0.7684147, 1, 1, 1, 1, 1,
0.7476196, -1.104674, 4.181192, 1, 1, 1, 1, 1,
0.7525926, 0.0683203, 0.8146937, 0, 0, 1, 1, 1,
0.7550864, 0.513769, -0.5481945, 1, 0, 0, 1, 1,
0.7679425, -0.2885974, 2.394491, 1, 0, 0, 1, 1,
0.7689282, 1.386772, -0.2865063, 1, 0, 0, 1, 1,
0.7725559, -0.242388, 0.6352858, 1, 0, 0, 1, 1,
0.7727699, 0.7937411, 0.7843456, 1, 0, 0, 1, 1,
0.7731844, 1.471486, 1.536578, 0, 0, 0, 1, 1,
0.7756487, -0.05841605, 0.2419657, 0, 0, 0, 1, 1,
0.7769293, -1.286403, 2.923286, 0, 0, 0, 1, 1,
0.7803273, 0.005035558, 0.113901, 0, 0, 0, 1, 1,
0.7835038, -0.8615634, -0.2109836, 0, 0, 0, 1, 1,
0.7836796, -0.3692765, 1.654526, 0, 0, 0, 1, 1,
0.7899238, -0.6885214, 2.969486, 0, 0, 0, 1, 1,
0.7908649, 0.3191855, 2.379649, 1, 1, 1, 1, 1,
0.7941527, -1.332609, 4.631855, 1, 1, 1, 1, 1,
0.7982717, 0.1339453, -0.4368989, 1, 1, 1, 1, 1,
0.7983128, -0.4332123, 1.843735, 1, 1, 1, 1, 1,
0.7986467, 1.502567, -0.1819811, 1, 1, 1, 1, 1,
0.8127875, -0.1144812, 0.4683084, 1, 1, 1, 1, 1,
0.8151999, -0.9299309, 1.958885, 1, 1, 1, 1, 1,
0.8171537, -0.6623561, 2.44079, 1, 1, 1, 1, 1,
0.8177949, 0.8228399, 2.385449, 1, 1, 1, 1, 1,
0.8253684, -0.2214005, 1.806308, 1, 1, 1, 1, 1,
0.8258104, 1.213176, 0.06197744, 1, 1, 1, 1, 1,
0.8333628, -0.2876608, 2.728729, 1, 1, 1, 1, 1,
0.834585, -0.1699004, 0.6786276, 1, 1, 1, 1, 1,
0.8395271, 0.2263956, 1.27761, 1, 1, 1, 1, 1,
0.845502, -1.334439, 4.448412, 1, 1, 1, 1, 1,
0.8469484, -2.29548, 1.848699, 0, 0, 1, 1, 1,
0.85137, -0.886118, 4.123132, 1, 0, 0, 1, 1,
0.853897, -0.3781718, 1.178933, 1, 0, 0, 1, 1,
0.8544278, 0.1360234, 0.4462094, 1, 0, 0, 1, 1,
0.8600748, -0.5446283, 3.191362, 1, 0, 0, 1, 1,
0.8613388, 0.8403947, 1.41409, 1, 0, 0, 1, 1,
0.8675167, 0.03937122, 1.835297, 0, 0, 0, 1, 1,
0.8677443, -0.5103034, 0.9289708, 0, 0, 0, 1, 1,
0.8735896, 1.09738, -0.5604104, 0, 0, 0, 1, 1,
0.8758348, 0.00907542, 2.167112, 0, 0, 0, 1, 1,
0.8764169, 0.1695798, 2.098886, 0, 0, 0, 1, 1,
0.8772676, -0.06527498, 0.6950336, 0, 0, 0, 1, 1,
0.8853005, 0.2146643, 1.252239, 0, 0, 0, 1, 1,
0.8880738, -0.3430408, 2.103945, 1, 1, 1, 1, 1,
0.8891585, -1.085752, 1.390895, 1, 1, 1, 1, 1,
0.8891812, -0.912002, 1.481854, 1, 1, 1, 1, 1,
0.9067647, -0.7717518, 2.826154, 1, 1, 1, 1, 1,
0.9231634, -2.217333, 3.743275, 1, 1, 1, 1, 1,
0.9277106, -0.1329719, 1.932209, 1, 1, 1, 1, 1,
0.9347122, -0.4208856, 1.747912, 1, 1, 1, 1, 1,
0.9390294, 0.08882663, 0.01401191, 1, 1, 1, 1, 1,
0.9399173, -1.352713, 2.081392, 1, 1, 1, 1, 1,
0.9504432, -0.102534, 1.806415, 1, 1, 1, 1, 1,
0.9567201, 1.773471, 2.121054, 1, 1, 1, 1, 1,
0.9608877, 1.279233, -0.1673206, 1, 1, 1, 1, 1,
0.9645497, -0.07195422, 0.6922312, 1, 1, 1, 1, 1,
0.9650076, -0.7007697, 1.581902, 1, 1, 1, 1, 1,
0.9669084, 1.210647, -0.05613679, 1, 1, 1, 1, 1,
0.9734941, -1.84893, 2.920574, 0, 0, 1, 1, 1,
0.9756027, 0.5761276, 1.620226, 1, 0, 0, 1, 1,
0.9820054, 0.5703886, -0.08858807, 1, 0, 0, 1, 1,
0.9857798, 1.034502, 0.8025981, 1, 0, 0, 1, 1,
0.9882336, 0.5121651, 1.10297, 1, 0, 0, 1, 1,
0.9888051, 0.08476133, 1.239734, 1, 0, 0, 1, 1,
0.9991663, -0.6986305, 2.52013, 0, 0, 0, 1, 1,
0.999426, 1.336275, 1.024902, 0, 0, 0, 1, 1,
1.005899, 0.6045914, 2.030854, 0, 0, 0, 1, 1,
1.015257, -1.368843, 3.862992, 0, 0, 0, 1, 1,
1.017687, -1.605992, 1.682208, 0, 0, 0, 1, 1,
1.017792, 0.6336596, 2.839134, 0, 0, 0, 1, 1,
1.018853, 0.02192986, 3.568533, 0, 0, 0, 1, 1,
1.021819, 2.21666, 1.045117, 1, 1, 1, 1, 1,
1.02397, -0.05203124, 2.058821, 1, 1, 1, 1, 1,
1.038105, -0.7087041, 2.777908, 1, 1, 1, 1, 1,
1.038115, 0.1316644, 1.905336, 1, 1, 1, 1, 1,
1.042071, 1.034798, 1.597043, 1, 1, 1, 1, 1,
1.045265, 0.827806, 2.137211, 1, 1, 1, 1, 1,
1.058997, -0.5513139, 1.067366, 1, 1, 1, 1, 1,
1.062476, -1.385933, 2.484309, 1, 1, 1, 1, 1,
1.064743, 0.5252013, 1.186471, 1, 1, 1, 1, 1,
1.070191, -0.6718263, 2.202962, 1, 1, 1, 1, 1,
1.070923, 1.886391, 0.8767058, 1, 1, 1, 1, 1,
1.072895, 0.2657732, 1.307214, 1, 1, 1, 1, 1,
1.074547, 1.489116, -0.02932227, 1, 1, 1, 1, 1,
1.077312, 0.01668358, 2.410764, 1, 1, 1, 1, 1,
1.080613, -0.6945269, 1.623566, 1, 1, 1, 1, 1,
1.0847, -1.516275, 1.932947, 0, 0, 1, 1, 1,
1.087283, -0.4744137, 1.197114, 1, 0, 0, 1, 1,
1.092397, 0.02044372, 1.78797, 1, 0, 0, 1, 1,
1.099294, 0.5936521, 2.639141, 1, 0, 0, 1, 1,
1.099991, 0.4647914, 2.128072, 1, 0, 0, 1, 1,
1.100565, -0.2476326, 2.853393, 1, 0, 0, 1, 1,
1.10649, -0.9257015, 2.137544, 0, 0, 0, 1, 1,
1.108886, -0.3649189, 0.1071139, 0, 0, 0, 1, 1,
1.110801, -0.6997589, 2.316338, 0, 0, 0, 1, 1,
1.11085, -0.1134673, 1.262356, 0, 0, 0, 1, 1,
1.113325, -1.621739, 4.217984, 0, 0, 0, 1, 1,
1.115621, 0.72211, 0.129654, 0, 0, 0, 1, 1,
1.117376, 0.1238364, 0.2174299, 0, 0, 0, 1, 1,
1.123329, -1.059259, 3.063052, 1, 1, 1, 1, 1,
1.12692, 0.63178, 1.263053, 1, 1, 1, 1, 1,
1.129807, 0.03584753, 0.7733929, 1, 1, 1, 1, 1,
1.13251, -0.8935668, 2.118148, 1, 1, 1, 1, 1,
1.1345, 0.2937854, 1.758292, 1, 1, 1, 1, 1,
1.135439, -0.7716161, 2.206442, 1, 1, 1, 1, 1,
1.135882, 0.1434828, -0.5431542, 1, 1, 1, 1, 1,
1.136601, 0.109061, -0.4931017, 1, 1, 1, 1, 1,
1.138539, 0.5931224, 0.0869036, 1, 1, 1, 1, 1,
1.140714, -1.862031, 4.371697, 1, 1, 1, 1, 1,
1.142312, 1.451631, -0.2093782, 1, 1, 1, 1, 1,
1.146178, 1.50318, -0.09189265, 1, 1, 1, 1, 1,
1.152563, -0.9618433, 2.528205, 1, 1, 1, 1, 1,
1.154084, -0.6451761, 2.737939, 1, 1, 1, 1, 1,
1.160392, -1.241235, 1.185367, 1, 1, 1, 1, 1,
1.167483, -1.365617, 1.4775, 0, 0, 1, 1, 1,
1.175514, -0.3340779, -0.05069503, 1, 0, 0, 1, 1,
1.179978, 1.2708, -0.05733392, 1, 0, 0, 1, 1,
1.185108, -0.5857868, 0.7324271, 1, 0, 0, 1, 1,
1.188542, -0.2731222, 2.481623, 1, 0, 0, 1, 1,
1.19215, -0.9303129, 0.4317186, 1, 0, 0, 1, 1,
1.197669, 0.1251472, 1.330408, 0, 0, 0, 1, 1,
1.198178, -0.8849452, 1.075008, 0, 0, 0, 1, 1,
1.22097, -1.276602, 4.18412, 0, 0, 0, 1, 1,
1.22355, -2.001979, 3.683758, 0, 0, 0, 1, 1,
1.22359, -0.9582546, 1.880339, 0, 0, 0, 1, 1,
1.229852, 0.2465644, 1.658237, 0, 0, 0, 1, 1,
1.232438, 1.212567, 1.305772, 0, 0, 0, 1, 1,
1.246824, -0.8396686, 2.471217, 1, 1, 1, 1, 1,
1.27049, -1.548597, 2.555643, 1, 1, 1, 1, 1,
1.271488, 1.004885, 0.5523418, 1, 1, 1, 1, 1,
1.27723, -0.9136585, 1.365313, 1, 1, 1, 1, 1,
1.290577, 0.5560752, 2.113587, 1, 1, 1, 1, 1,
1.294981, -1.950029, 4.70333, 1, 1, 1, 1, 1,
1.298217, 2.086273, -0.6000378, 1, 1, 1, 1, 1,
1.307531, 0.3365363, 0.9317742, 1, 1, 1, 1, 1,
1.308063, -0.9552548, 3.173205, 1, 1, 1, 1, 1,
1.31276, 0.07103344, 3.851266, 1, 1, 1, 1, 1,
1.314623, -0.0480748, 0.3416487, 1, 1, 1, 1, 1,
1.318278, 1.253456, 1.48456, 1, 1, 1, 1, 1,
1.323409, 0.7652429, 1.604076, 1, 1, 1, 1, 1,
1.323441, -0.4654126, 2.617849, 1, 1, 1, 1, 1,
1.324879, 0.7640626, 0.9936172, 1, 1, 1, 1, 1,
1.325063, 1.424674, 0.3853901, 0, 0, 1, 1, 1,
1.330481, -0.2766286, 2.233111, 1, 0, 0, 1, 1,
1.337974, -0.700194, 2.510254, 1, 0, 0, 1, 1,
1.341075, -1.015905, 2.366204, 1, 0, 0, 1, 1,
1.344536, 0.5950287, 1.629074, 1, 0, 0, 1, 1,
1.346697, -0.8511906, 3.00766, 1, 0, 0, 1, 1,
1.347723, 0.129152, -0.2201362, 0, 0, 0, 1, 1,
1.347873, -1.807409, 2.478093, 0, 0, 0, 1, 1,
1.361248, 0.6277275, 1.608613, 0, 0, 0, 1, 1,
1.367107, -1.146853, 1.869636, 0, 0, 0, 1, 1,
1.381577, -0.2152295, 2.091604, 0, 0, 0, 1, 1,
1.383387, 1.151553, 2.48483, 0, 0, 0, 1, 1,
1.384302, 1.122609, 0.1960571, 0, 0, 0, 1, 1,
1.396123, 1.620664, 1.127757, 1, 1, 1, 1, 1,
1.398266, 0.9036024, 2.373739, 1, 1, 1, 1, 1,
1.403283, 0.753532, 0.4652914, 1, 1, 1, 1, 1,
1.411494, -0.6108581, 2.598595, 1, 1, 1, 1, 1,
1.41422, -0.3589641, 2.590119, 1, 1, 1, 1, 1,
1.421099, -1.049901, 4.568391, 1, 1, 1, 1, 1,
1.445232, 1.228546, 1.573312, 1, 1, 1, 1, 1,
1.461613, 0.1953857, 1.306488, 1, 1, 1, 1, 1,
1.465784, -0.07067099, 1.760351, 1, 1, 1, 1, 1,
1.472459, 0.8540697, 2.641248, 1, 1, 1, 1, 1,
1.478767, 1.581921, -0.6171994, 1, 1, 1, 1, 1,
1.48113, 0.4973652, 2.529081, 1, 1, 1, 1, 1,
1.485847, 1.241211, 0.4553419, 1, 1, 1, 1, 1,
1.507217, -0.408634, 2.327706, 1, 1, 1, 1, 1,
1.50906, -0.2825329, 1.274425, 1, 1, 1, 1, 1,
1.523547, -0.2095058, 0.4408924, 0, 0, 1, 1, 1,
1.524455, -0.08280276, -0.5009082, 1, 0, 0, 1, 1,
1.54404, 0.6956058, -0.8841399, 1, 0, 0, 1, 1,
1.544613, -0.8850774, 1.538959, 1, 0, 0, 1, 1,
1.546499, -0.7728818, 2.235524, 1, 0, 0, 1, 1,
1.564318, 1.223761, -0.8903097, 1, 0, 0, 1, 1,
1.565611, 0.1448473, 1.136868, 0, 0, 0, 1, 1,
1.56599, 0.5573417, 1.108286, 0, 0, 0, 1, 1,
1.577193, -1.79041, 2.583826, 0, 0, 0, 1, 1,
1.580152, 0.4029154, 2.420244, 0, 0, 0, 1, 1,
1.582238, 0.7178567, 0.6915473, 0, 0, 0, 1, 1,
1.591621, 0.7384144, 1.026003, 0, 0, 0, 1, 1,
1.621095, -1.324152, 3.015473, 0, 0, 0, 1, 1,
1.632879, 1.167364, 2.037987, 1, 1, 1, 1, 1,
1.645516, 0.4159583, 1.328254, 1, 1, 1, 1, 1,
1.662852, 0.7644552, 0.1749159, 1, 1, 1, 1, 1,
1.665088, -0.3813845, 3.882984, 1, 1, 1, 1, 1,
1.668114, 0.008406474, 1.489824, 1, 1, 1, 1, 1,
1.669246, -0.3311104, 3.227169, 1, 1, 1, 1, 1,
1.672012, 0.7433575, 1.811064, 1, 1, 1, 1, 1,
1.673004, 1.236715, 1.641742, 1, 1, 1, 1, 1,
1.68222, -0.2480713, 2.64039, 1, 1, 1, 1, 1,
1.682465, -1.068683, 0.2732715, 1, 1, 1, 1, 1,
1.699249, -0.2311864, 3.307086, 1, 1, 1, 1, 1,
1.70068, -2.434316, 4.895627, 1, 1, 1, 1, 1,
1.705293, -1.94898, 2.667162, 1, 1, 1, 1, 1,
1.707504, -1.055775, 1.946936, 1, 1, 1, 1, 1,
1.707932, 0.4285158, 1.26571, 1, 1, 1, 1, 1,
1.708997, 0.9468344, 0.1017551, 0, 0, 1, 1, 1,
1.711383, 0.4696338, -0.3855198, 1, 0, 0, 1, 1,
1.729511, -0.518832, 1.640801, 1, 0, 0, 1, 1,
1.73791, 0.5357255, 0.6348904, 1, 0, 0, 1, 1,
1.748595, 0.01028085, 0.8140669, 1, 0, 0, 1, 1,
1.772767, 0.1729845, 0.272063, 1, 0, 0, 1, 1,
1.776617, 1.618012, 0.2942771, 0, 0, 0, 1, 1,
1.779944, 0.0646401, 0.7443234, 0, 0, 0, 1, 1,
1.782916, -0.8331113, 2.70123, 0, 0, 0, 1, 1,
1.799469, 0.5690511, 0.8917275, 0, 0, 0, 1, 1,
1.799841, 0.4238021, -1.155033, 0, 0, 0, 1, 1,
1.80825, -1.429731, 1.394026, 0, 0, 0, 1, 1,
1.863718, -0.7059483, 0.9827437, 0, 0, 0, 1, 1,
1.904245, -2.233121, 2.982855, 1, 1, 1, 1, 1,
1.923867, -1.417101, 1.714284, 1, 1, 1, 1, 1,
1.930998, 0.538253, 2.158764, 1, 1, 1, 1, 1,
1.963578, 1.976873, 0.9866065, 1, 1, 1, 1, 1,
2.00516, 1.330704, -0.03978176, 1, 1, 1, 1, 1,
2.008764, -0.9784224, 1.306333, 1, 1, 1, 1, 1,
2.025781, 0.364277, 0.9229372, 1, 1, 1, 1, 1,
2.061317, 0.005072275, 2.108734, 1, 1, 1, 1, 1,
2.086707, -1.7439, 3.976182, 1, 1, 1, 1, 1,
2.094437, -0.929829, 4.181257, 1, 1, 1, 1, 1,
2.115613, -0.7961302, 2.601376, 1, 1, 1, 1, 1,
2.121454, -0.8808925, 1.227636, 1, 1, 1, 1, 1,
2.132615, 1.445709, -0.3091661, 1, 1, 1, 1, 1,
2.152599, -1.319453, 0.6193901, 1, 1, 1, 1, 1,
2.176225, -0.1403921, 2.199946, 1, 1, 1, 1, 1,
2.18415, -0.1757909, 1.846245, 0, 0, 1, 1, 1,
2.209425, -1.481341, 2.446758, 1, 0, 0, 1, 1,
2.248961, 0.07269279, 3.372264, 1, 0, 0, 1, 1,
2.277056, -0.2564861, 2.416191, 1, 0, 0, 1, 1,
2.320462, -1.305449, 2.271358, 1, 0, 0, 1, 1,
2.329154, -0.3931137, 3.172179, 1, 0, 0, 1, 1,
2.338033, 0.391713, 1.858352, 0, 0, 0, 1, 1,
2.364664, -1.760319, 2.829357, 0, 0, 0, 1, 1,
2.377129, -0.638217, 2.695227, 0, 0, 0, 1, 1,
2.419937, -0.9745551, 2.166226, 0, 0, 0, 1, 1,
2.421424, -0.4695803, 2.567061, 0, 0, 0, 1, 1,
2.485022, 0.2503861, 1.649529, 0, 0, 0, 1, 1,
2.531606, -2.088253, 0.2794621, 0, 0, 0, 1, 1,
2.648487, 0.2464451, 0.1948156, 1, 1, 1, 1, 1,
2.664342, 1.84664, 1.568103, 1, 1, 1, 1, 1,
2.717385, -0.5029611, 2.819345, 1, 1, 1, 1, 1,
2.821966, 0.8251985, 0.7951949, 1, 1, 1, 1, 1,
2.825196, -0.6030194, 2.462948, 1, 1, 1, 1, 1,
3.083981, 0.1897277, 2.381303, 1, 1, 1, 1, 1,
3.158106, 1.829353, 0.316758, 1, 1, 1, 1, 1
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
var radius = 9.772201;
var distance = 34.32444;
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
mvMatrix.translate( 0.2761147, 0.02144456, 0.08646822 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32444);
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
