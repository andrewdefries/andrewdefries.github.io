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
-3.334178, 0.1146844, -1.725343, 1, 0, 0, 1,
-3.104469, 0.3876833, -2.27441, 1, 0.007843138, 0, 1,
-2.795792, 1.454569, -0.5689516, 1, 0.01176471, 0, 1,
-2.752477, -0.07110178, -1.441274, 1, 0.01960784, 0, 1,
-2.501449, -0.2959848, -1.209285, 1, 0.02352941, 0, 1,
-2.464402, -2.890128, -0.8284559, 1, 0.03137255, 0, 1,
-2.403887, 0.8253126, -2.196839, 1, 0.03529412, 0, 1,
-2.354589, -0.4744089, -1.390038, 1, 0.04313726, 0, 1,
-2.267895, -1.384998, -3.492441, 1, 0.04705882, 0, 1,
-2.250104, 0.08186539, -2.632676, 1, 0.05490196, 0, 1,
-2.197256, 0.7438757, -0.6798111, 1, 0.05882353, 0, 1,
-2.180795, -0.4615324, -0.7271019, 1, 0.06666667, 0, 1,
-2.124755, -0.8977976, -1.016258, 1, 0.07058824, 0, 1,
-2.118887, -0.161222, -1.681679, 1, 0.07843138, 0, 1,
-2.090993, -0.0752032, -3.020603, 1, 0.08235294, 0, 1,
-2.079105, 2.454402, 0.7659991, 1, 0.09019608, 0, 1,
-2.003019, 0.2096726, -1.311871, 1, 0.09411765, 0, 1,
-1.998194, 0.1460957, 0.08361737, 1, 0.1019608, 0, 1,
-1.997066, -0.3733957, -1.556872, 1, 0.1098039, 0, 1,
-1.996022, 0.1485928, -1.165526, 1, 0.1137255, 0, 1,
-1.986061, 1.789, -2.293929, 1, 0.1215686, 0, 1,
-1.971729, -1.006264, -0.2952699, 1, 0.1254902, 0, 1,
-1.967104, -1.644688, -2.518626, 1, 0.1333333, 0, 1,
-1.950686, -0.3179712, -2.855895, 1, 0.1372549, 0, 1,
-1.921991, 0.5621595, -0.3296435, 1, 0.145098, 0, 1,
-1.904652, 0.2839667, -1.383165, 1, 0.1490196, 0, 1,
-1.903281, 1.054332, -0.5149853, 1, 0.1568628, 0, 1,
-1.889761, -0.2919245, -2.070855, 1, 0.1607843, 0, 1,
-1.867771, -1.47209, -3.09672, 1, 0.1686275, 0, 1,
-1.837349, 0.09328396, -1.813457, 1, 0.172549, 0, 1,
-1.826571, 0.1772134, -1.606333, 1, 0.1803922, 0, 1,
-1.817978, 0.1727019, -3.500834, 1, 0.1843137, 0, 1,
-1.785219, 0.9356161, -1.307232, 1, 0.1921569, 0, 1,
-1.780193, 0.5108847, 0.7212016, 1, 0.1960784, 0, 1,
-1.755383, -0.307753, -1.22989, 1, 0.2039216, 0, 1,
-1.754009, 0.7891129, -1.145609, 1, 0.2117647, 0, 1,
-1.739935, -0.7076439, -2.066744, 1, 0.2156863, 0, 1,
-1.738558, -0.1835295, -2.403208, 1, 0.2235294, 0, 1,
-1.723627, 0.05804687, -2.807787, 1, 0.227451, 0, 1,
-1.701873, -0.8510462, -3.417736, 1, 0.2352941, 0, 1,
-1.687104, 1.103966, -2.917706, 1, 0.2392157, 0, 1,
-1.66299, 1.038032, -0.1711752, 1, 0.2470588, 0, 1,
-1.63913, -0.6334504, -0.6295469, 1, 0.2509804, 0, 1,
-1.612585, -0.3738559, -3.996382, 1, 0.2588235, 0, 1,
-1.603377, -0.9268845, -1.555416, 1, 0.2627451, 0, 1,
-1.600034, 0.3735386, -1.664043, 1, 0.2705882, 0, 1,
-1.589767, -0.2677087, -0.3939768, 1, 0.2745098, 0, 1,
-1.57867, -0.201073, -1.258433, 1, 0.282353, 0, 1,
-1.574741, 0.3711331, -2.397563, 1, 0.2862745, 0, 1,
-1.570994, -0.114227, -1.16948, 1, 0.2941177, 0, 1,
-1.560574, 1.525991, -1.74949, 1, 0.3019608, 0, 1,
-1.55708, 1.849347, -1.265764, 1, 0.3058824, 0, 1,
-1.556704, 2.485014, -0.5832229, 1, 0.3137255, 0, 1,
-1.552337, 2.178745, -0.3556391, 1, 0.3176471, 0, 1,
-1.545504, 0.3614069, -1.562911, 1, 0.3254902, 0, 1,
-1.543586, 0.1713071, -1.687955, 1, 0.3294118, 0, 1,
-1.542512, -1.196087, 0.1169364, 1, 0.3372549, 0, 1,
-1.512646, -1.24561, -2.455168, 1, 0.3411765, 0, 1,
-1.512199, -0.4364201, -2.371524, 1, 0.3490196, 0, 1,
-1.481429, 1.061805, -0.8323979, 1, 0.3529412, 0, 1,
-1.472301, -0.4635671, -1.383879, 1, 0.3607843, 0, 1,
-1.47005, -0.705457, -0.4929326, 1, 0.3647059, 0, 1,
-1.465681, -0.7822508, -2.122272, 1, 0.372549, 0, 1,
-1.465044, 1.005277, -0.4703144, 1, 0.3764706, 0, 1,
-1.454725, 0.04783101, 0.5281321, 1, 0.3843137, 0, 1,
-1.452801, -0.3214017, -2.637422, 1, 0.3882353, 0, 1,
-1.446957, 1.16477, 1.023268, 1, 0.3960784, 0, 1,
-1.446501, 1.240559, -0.232171, 1, 0.4039216, 0, 1,
-1.43099, 0.1594211, -1.743543, 1, 0.4078431, 0, 1,
-1.420035, 0.7595977, -1.73114, 1, 0.4156863, 0, 1,
-1.417952, -1.372948, -3.894564, 1, 0.4196078, 0, 1,
-1.416952, -0.6886311, -2.098395, 1, 0.427451, 0, 1,
-1.41389, -0.0009635625, -3.077236, 1, 0.4313726, 0, 1,
-1.410711, -0.5622972, -2.772096, 1, 0.4392157, 0, 1,
-1.410213, -0.04645627, -0.5988159, 1, 0.4431373, 0, 1,
-1.407084, 1.022153, 0.7320029, 1, 0.4509804, 0, 1,
-1.399108, 1.667256, -0.446198, 1, 0.454902, 0, 1,
-1.398906, -0.4758299, -3.216746, 1, 0.4627451, 0, 1,
-1.397765, -0.4086754, -2.81515, 1, 0.4666667, 0, 1,
-1.396345, -1.350863, -0.7027708, 1, 0.4745098, 0, 1,
-1.392567, -0.3014485, -1.713901, 1, 0.4784314, 0, 1,
-1.391215, 0.770702, -2.58327, 1, 0.4862745, 0, 1,
-1.377579, -0.1348546, -0.9516643, 1, 0.4901961, 0, 1,
-1.370535, 1.938228, -1.345801, 1, 0.4980392, 0, 1,
-1.370474, -1.513297, -2.893377, 1, 0.5058824, 0, 1,
-1.369996, 0.9380577, -0.6755385, 1, 0.509804, 0, 1,
-1.369655, 0.5181744, -0.263187, 1, 0.5176471, 0, 1,
-1.363426, 0.9063793, -3.734005, 1, 0.5215687, 0, 1,
-1.362547, -0.4684373, -1.183422, 1, 0.5294118, 0, 1,
-1.362527, 0.3161507, 0.1146006, 1, 0.5333334, 0, 1,
-1.359296, -0.3355106, -4.052971, 1, 0.5411765, 0, 1,
-1.356769, -1.380513, -1.444065, 1, 0.5450981, 0, 1,
-1.354171, -0.5663837, -0.9369859, 1, 0.5529412, 0, 1,
-1.35142, 0.8358386, -1.810928, 1, 0.5568628, 0, 1,
-1.334716, -0.3169905, -2.377483, 1, 0.5647059, 0, 1,
-1.331008, 2.570629, 0.837132, 1, 0.5686275, 0, 1,
-1.330922, -1.332242, -3.065007, 1, 0.5764706, 0, 1,
-1.325459, 1.540743, -0.05098423, 1, 0.5803922, 0, 1,
-1.322691, 0.4287527, -0.6221112, 1, 0.5882353, 0, 1,
-1.317787, -0.9042634, -2.522709, 1, 0.5921569, 0, 1,
-1.316257, -0.9326823, -2.740391, 1, 0.6, 0, 1,
-1.304248, -0.138913, -1.972219, 1, 0.6078432, 0, 1,
-1.304189, 0.5165485, -1.79204, 1, 0.6117647, 0, 1,
-1.301375, 0.07830088, -1.046758, 1, 0.6196079, 0, 1,
-1.300332, -0.01006764, -2.648347, 1, 0.6235294, 0, 1,
-1.299314, -0.6401667, -0.7947387, 1, 0.6313726, 0, 1,
-1.299217, 0.2128543, -2.568358, 1, 0.6352941, 0, 1,
-1.293036, 1.201336, -1.663859, 1, 0.6431373, 0, 1,
-1.29225, 0.01475547, -1.563803, 1, 0.6470588, 0, 1,
-1.291853, 0.1716261, -1.92388, 1, 0.654902, 0, 1,
-1.287146, 1.496, -1.396119, 1, 0.6588235, 0, 1,
-1.286453, 0.9379306, 0.4748843, 1, 0.6666667, 0, 1,
-1.282939, -0.4739502, -1.333948, 1, 0.6705883, 0, 1,
-1.279866, 1.051843, 0.2484915, 1, 0.6784314, 0, 1,
-1.275342, 0.07693773, -0.6920983, 1, 0.682353, 0, 1,
-1.272288, -0.7975287, -3.256698, 1, 0.6901961, 0, 1,
-1.251668, 0.753409, -2.18189, 1, 0.6941177, 0, 1,
-1.24611, -0.5422465, -1.332856, 1, 0.7019608, 0, 1,
-1.243699, -0.1759015, -1.580979, 1, 0.7098039, 0, 1,
-1.242591, 0.3164552, -0.1209706, 1, 0.7137255, 0, 1,
-1.230043, -0.9179857, -2.215753, 1, 0.7215686, 0, 1,
-1.209073, -1.815392, -3.217005, 1, 0.7254902, 0, 1,
-1.208835, 0.3194163, -0.6088822, 1, 0.7333333, 0, 1,
-1.207876, -1.083747, 0.3770949, 1, 0.7372549, 0, 1,
-1.204236, 0.82355, -0.2564767, 1, 0.7450981, 0, 1,
-1.198938, -0.7730737, -2.000459, 1, 0.7490196, 0, 1,
-1.187331, -0.1768265, -2.208169, 1, 0.7568628, 0, 1,
-1.181967, -2.787284, -1.630763, 1, 0.7607843, 0, 1,
-1.179164, -0.9205227, -1.297306, 1, 0.7686275, 0, 1,
-1.170596, -0.2093568, -1.523094, 1, 0.772549, 0, 1,
-1.158721, 1.595995, 0.2814302, 1, 0.7803922, 0, 1,
-1.149234, -1.388846, -2.1622, 1, 0.7843137, 0, 1,
-1.148882, 1.23245, 0.2660941, 1, 0.7921569, 0, 1,
-1.148723, 0.3949161, -0.8792648, 1, 0.7960784, 0, 1,
-1.14593, 0.2924567, -1.20146, 1, 0.8039216, 0, 1,
-1.144054, 1.063468, -2.899501, 1, 0.8117647, 0, 1,
-1.143885, 2.344519, -0.8039735, 1, 0.8156863, 0, 1,
-1.139273, -1.844124, -2.042439, 1, 0.8235294, 0, 1,
-1.13625, 1.160132, -0.301649, 1, 0.827451, 0, 1,
-1.125164, 0.4836142, -1.752429, 1, 0.8352941, 0, 1,
-1.122675, -0.7772509, -2.262245, 1, 0.8392157, 0, 1,
-1.120782, 0.1083932, -3.194256, 1, 0.8470588, 0, 1,
-1.115882, 0.2052875, -0.9244391, 1, 0.8509804, 0, 1,
-1.109197, -1.637712, -2.874278, 1, 0.8588235, 0, 1,
-1.105504, 0.358369, 0.1766146, 1, 0.8627451, 0, 1,
-1.096487, -0.04732703, -1.866082, 1, 0.8705882, 0, 1,
-1.09211, 1.946898, -2.161262, 1, 0.8745098, 0, 1,
-1.087875, -0.5641081, -1.385826, 1, 0.8823529, 0, 1,
-1.087265, -0.2583714, -1.723862, 1, 0.8862745, 0, 1,
-1.084819, -0.2249566, -1.951611, 1, 0.8941177, 0, 1,
-1.075655, 0.1204788, -1.965868, 1, 0.8980392, 0, 1,
-1.073248, 2.077047, -0.5233682, 1, 0.9058824, 0, 1,
-1.06582, -0.648406, -0.3697853, 1, 0.9137255, 0, 1,
-1.058078, -0.1387998, -1.846099, 1, 0.9176471, 0, 1,
-1.057424, 0.2220163, -0.5787672, 1, 0.9254902, 0, 1,
-1.054591, 0.004210905, -1.172068, 1, 0.9294118, 0, 1,
-1.050529, 0.6766213, -2.031957, 1, 0.9372549, 0, 1,
-1.048854, 0.02265592, -1.421313, 1, 0.9411765, 0, 1,
-1.040582, -1.237324, -4.147867, 1, 0.9490196, 0, 1,
-1.040528, 0.5784609, -0.7815983, 1, 0.9529412, 0, 1,
-1.038609, 0.6844028, -0.9747438, 1, 0.9607843, 0, 1,
-1.036762, -1.019726, -3.781761, 1, 0.9647059, 0, 1,
-1.029161, -0.7369296, -1.249684, 1, 0.972549, 0, 1,
-1.025521, -1.286877, -1.715125, 1, 0.9764706, 0, 1,
-1.016963, -1.068823, -1.433648, 1, 0.9843137, 0, 1,
-1.011364, 1.484422, -1.505483, 1, 0.9882353, 0, 1,
-1.011057, -0.50014, -1.95713, 1, 0.9960784, 0, 1,
-1.00511, -0.8772906, -4.650115, 0.9960784, 1, 0, 1,
-0.9946715, -1.76394, -3.040839, 0.9921569, 1, 0, 1,
-0.9899509, 1.720248, -0.1920617, 0.9843137, 1, 0, 1,
-0.9887065, -1.229914, -3.215911, 0.9803922, 1, 0, 1,
-0.9831162, 0.7017541, -2.012321, 0.972549, 1, 0, 1,
-0.9808335, -0.9493713, -1.523064, 0.9686275, 1, 0, 1,
-0.9667402, -0.8093284, -3.700449, 0.9607843, 1, 0, 1,
-0.9657463, 0.7500713, -2.12522, 0.9568627, 1, 0, 1,
-0.9600397, -0.5996504, -1.52371, 0.9490196, 1, 0, 1,
-0.9520415, 1.098325, -1.186067, 0.945098, 1, 0, 1,
-0.9509891, 0.004263877, -1.532851, 0.9372549, 1, 0, 1,
-0.9392757, -0.4459342, -1.293023, 0.9333333, 1, 0, 1,
-0.9360965, -1.261505, -3.66182, 0.9254902, 1, 0, 1,
-0.9335137, -1.762176, -1.284622, 0.9215686, 1, 0, 1,
-0.9324554, -1.028489, -2.894878, 0.9137255, 1, 0, 1,
-0.9265426, 0.7868006, -1.19078, 0.9098039, 1, 0, 1,
-0.9242014, -0.1394435, -2.961474, 0.9019608, 1, 0, 1,
-0.9241523, 0.8784578, -0.05716349, 0.8941177, 1, 0, 1,
-0.9223961, 1.432727, -1.108236, 0.8901961, 1, 0, 1,
-0.9217888, -1.777769, -3.159863, 0.8823529, 1, 0, 1,
-0.9190402, -0.1812841, -2.590513, 0.8784314, 1, 0, 1,
-0.9156229, -0.3629193, -2.810338, 0.8705882, 1, 0, 1,
-0.914575, -2.293622, -3.662703, 0.8666667, 1, 0, 1,
-0.913825, -2.220317, -1.181274, 0.8588235, 1, 0, 1,
-0.9026372, -0.2179194, -1.635297, 0.854902, 1, 0, 1,
-0.891277, -0.3157141, -1.002028, 0.8470588, 1, 0, 1,
-0.8854164, -1.074594, -3.937604, 0.8431373, 1, 0, 1,
-0.882085, -0.8563722, -2.733947, 0.8352941, 1, 0, 1,
-0.8816497, -0.474746, -1.846812, 0.8313726, 1, 0, 1,
-0.8811885, -0.8049135, -1.112999, 0.8235294, 1, 0, 1,
-0.8774432, -0.04294655, -2.020573, 0.8196079, 1, 0, 1,
-0.8722851, -0.4308405, -3.735716, 0.8117647, 1, 0, 1,
-0.8696918, 0.449014, 0.6224248, 0.8078431, 1, 0, 1,
-0.8649951, 0.435957, -2.278089, 0.8, 1, 0, 1,
-0.8589627, 0.07406557, -3.309469, 0.7921569, 1, 0, 1,
-0.8579753, 0.7184507, -0.7255661, 0.7882353, 1, 0, 1,
-0.8563744, 0.329323, -2.177481, 0.7803922, 1, 0, 1,
-0.8541508, 1.129673, 0.8736264, 0.7764706, 1, 0, 1,
-0.8523046, -0.4470404, -2.781611, 0.7686275, 1, 0, 1,
-0.8491372, -0.2520547, -2.741367, 0.7647059, 1, 0, 1,
-0.8446195, -1.242579, -4.313559, 0.7568628, 1, 0, 1,
-0.8435585, -0.7221653, -1.630679, 0.7529412, 1, 0, 1,
-0.8419303, -1.156668, -0.9288118, 0.7450981, 1, 0, 1,
-0.8413949, 0.3332123, -1.275345, 0.7411765, 1, 0, 1,
-0.8413892, 0.7544895, -0.3403402, 0.7333333, 1, 0, 1,
-0.8299828, 0.504509, -2.144188, 0.7294118, 1, 0, 1,
-0.8261178, -1.605277, -2.005828, 0.7215686, 1, 0, 1,
-0.8229454, 0.1094688, -0.001178154, 0.7176471, 1, 0, 1,
-0.8214169, -1.249984, -2.005739, 0.7098039, 1, 0, 1,
-0.817267, -0.02003476, -0.8567131, 0.7058824, 1, 0, 1,
-0.816154, 2.221712, -0.1583325, 0.6980392, 1, 0, 1,
-0.8155926, -2.052304, -1.828117, 0.6901961, 1, 0, 1,
-0.8152825, 1.488981, -0.6670677, 0.6862745, 1, 0, 1,
-0.8106947, -0.9389989, -2.926039, 0.6784314, 1, 0, 1,
-0.8104185, -0.3004812, -3.507815, 0.6745098, 1, 0, 1,
-0.8087212, -2.113399, -3.476963, 0.6666667, 1, 0, 1,
-0.8068135, 1.377451, 1.416703, 0.6627451, 1, 0, 1,
-0.8021478, 1.645501, -0.09422524, 0.654902, 1, 0, 1,
-0.7993916, -0.8600503, -2.607259, 0.6509804, 1, 0, 1,
-0.7847759, 1.566484, -3.148044, 0.6431373, 1, 0, 1,
-0.7812042, 1.441047, -0.1754431, 0.6392157, 1, 0, 1,
-0.7809733, -0.2752504, -0.9883482, 0.6313726, 1, 0, 1,
-0.7736932, 0.2206858, -2.063827, 0.627451, 1, 0, 1,
-0.7735832, 2.102424, 0.8366535, 0.6196079, 1, 0, 1,
-0.7686999, 0.8800185, -0.4620644, 0.6156863, 1, 0, 1,
-0.7682081, 0.08015016, -1.525019, 0.6078432, 1, 0, 1,
-0.7615035, -2.042114, -4.378286, 0.6039216, 1, 0, 1,
-0.7592833, -1.321967, -1.884278, 0.5960785, 1, 0, 1,
-0.7575559, 0.4404055, -1.028535, 0.5882353, 1, 0, 1,
-0.7565854, 0.1605237, 0.5520982, 0.5843138, 1, 0, 1,
-0.7563833, -1.355243, -2.751822, 0.5764706, 1, 0, 1,
-0.7552844, 1.944896, -0.4077775, 0.572549, 1, 0, 1,
-0.7512541, -0.1048644, -1.818871, 0.5647059, 1, 0, 1,
-0.7448248, -0.4738131, -3.456311, 0.5607843, 1, 0, 1,
-0.7400661, 0.8072237, -1.449174, 0.5529412, 1, 0, 1,
-0.7382561, 0.4086527, -2.254837, 0.5490196, 1, 0, 1,
-0.7379428, -0.5776149, -2.255668, 0.5411765, 1, 0, 1,
-0.737525, -0.3928495, -2.484072, 0.5372549, 1, 0, 1,
-0.7368819, -1.763226, -3.223665, 0.5294118, 1, 0, 1,
-0.7311454, -0.1066756, -1.677181, 0.5254902, 1, 0, 1,
-0.7298598, 0.484763, -2.533265, 0.5176471, 1, 0, 1,
-0.7278136, 0.3250847, -3.04617, 0.5137255, 1, 0, 1,
-0.7182985, 1.663482, -0.8928728, 0.5058824, 1, 0, 1,
-0.7042076, -0.6465078, -2.050347, 0.5019608, 1, 0, 1,
-0.7029244, 0.5420068, 0.8557604, 0.4941176, 1, 0, 1,
-0.7017683, -1.056163, -1.91531, 0.4862745, 1, 0, 1,
-0.6958314, -0.5948428, -3.246867, 0.4823529, 1, 0, 1,
-0.6931201, -0.4983292, -1.598728, 0.4745098, 1, 0, 1,
-0.6926801, 0.1542223, -1.033761, 0.4705882, 1, 0, 1,
-0.6819137, -0.07002109, -1.782817, 0.4627451, 1, 0, 1,
-0.6814643, -0.4655074, -3.76939, 0.4588235, 1, 0, 1,
-0.6806164, -0.568985, -2.817802, 0.4509804, 1, 0, 1,
-0.6783041, -0.5926995, -3.946645, 0.4470588, 1, 0, 1,
-0.6739582, 0.5437854, -1.030708, 0.4392157, 1, 0, 1,
-0.6738784, 0.7486684, 0.4670112, 0.4352941, 1, 0, 1,
-0.6733294, 0.838383, -0.522038, 0.427451, 1, 0, 1,
-0.6700698, -0.3725789, -3.444438, 0.4235294, 1, 0, 1,
-0.6674759, 0.3885507, -2.094469, 0.4156863, 1, 0, 1,
-0.6667255, 0.527027, 1.61516, 0.4117647, 1, 0, 1,
-0.6658922, -0.6458549, -2.707133, 0.4039216, 1, 0, 1,
-0.6630248, -0.9011877, -2.171751, 0.3960784, 1, 0, 1,
-0.6612912, -0.8156557, -3.627924, 0.3921569, 1, 0, 1,
-0.6596746, -2.506945, -3.604886, 0.3843137, 1, 0, 1,
-0.6524406, -1.719055, -0.7249705, 0.3803922, 1, 0, 1,
-0.641553, -0.432738, -3.312605, 0.372549, 1, 0, 1,
-0.6339706, 0.2081181, -3.42381, 0.3686275, 1, 0, 1,
-0.6293327, 1.673914, 1.216155, 0.3607843, 1, 0, 1,
-0.624948, -0.5145428, -2.955459, 0.3568628, 1, 0, 1,
-0.6131346, 1.322865, -2.014731, 0.3490196, 1, 0, 1,
-0.6131218, -0.9481325, -2.826171, 0.345098, 1, 0, 1,
-0.6127802, -0.2469222, -3.355304, 0.3372549, 1, 0, 1,
-0.6091772, 0.009994042, -1.358493, 0.3333333, 1, 0, 1,
-0.6086437, 1.384502, -1.817547, 0.3254902, 1, 0, 1,
-0.6056055, -0.6826053, -2.225844, 0.3215686, 1, 0, 1,
-0.5888161, 0.2352192, -0.417737, 0.3137255, 1, 0, 1,
-0.579086, -0.4884452, -3.057407, 0.3098039, 1, 0, 1,
-0.5746735, 1.716828, -1.440824, 0.3019608, 1, 0, 1,
-0.5732098, -0.2664786, -2.231932, 0.2941177, 1, 0, 1,
-0.5725312, 1.052816, 0.03118093, 0.2901961, 1, 0, 1,
-0.5718692, -0.3948444, -4.773232, 0.282353, 1, 0, 1,
-0.5708404, 0.04280438, -2.829599, 0.2784314, 1, 0, 1,
-0.5681688, 0.893142, 0.4424611, 0.2705882, 1, 0, 1,
-0.5668228, -0.6838623, -2.615863, 0.2666667, 1, 0, 1,
-0.5668084, 0.4659072, -0.2070481, 0.2588235, 1, 0, 1,
-0.563067, 0.7550668, -2.061693, 0.254902, 1, 0, 1,
-0.5627189, -1.996587, -2.145881, 0.2470588, 1, 0, 1,
-0.5626964, -0.2405158, -2.161735, 0.2431373, 1, 0, 1,
-0.5609227, 0.6927191, -1.003217, 0.2352941, 1, 0, 1,
-0.5582859, -0.7836244, -2.235783, 0.2313726, 1, 0, 1,
-0.5579545, 0.2209551, -2.579638, 0.2235294, 1, 0, 1,
-0.5576078, -1.304774, -2.467008, 0.2196078, 1, 0, 1,
-0.5560716, 2.865201, 0.1492733, 0.2117647, 1, 0, 1,
-0.555616, 0.1191293, -1.248099, 0.2078431, 1, 0, 1,
-0.5430272, -1.049384, -3.387261, 0.2, 1, 0, 1,
-0.5369163, 1.565563, 0.1009197, 0.1921569, 1, 0, 1,
-0.535933, -0.7254165, -3.350096, 0.1882353, 1, 0, 1,
-0.5309713, -0.2627423, -0.9809024, 0.1803922, 1, 0, 1,
-0.5305552, -0.607335, -2.054933, 0.1764706, 1, 0, 1,
-0.5300052, 1.325692, -1.126968, 0.1686275, 1, 0, 1,
-0.5266901, 0.439002, -1.732386, 0.1647059, 1, 0, 1,
-0.5192821, 0.1502865, -1.539064, 0.1568628, 1, 0, 1,
-0.5190505, -1.639408, -3.642411, 0.1529412, 1, 0, 1,
-0.5129422, 0.5240982, -0.816843, 0.145098, 1, 0, 1,
-0.5060279, 0.981779, -1.360886, 0.1411765, 1, 0, 1,
-0.5022218, -2.790997, -4.569921, 0.1333333, 1, 0, 1,
-0.5010964, -0.8264846, -2.901891, 0.1294118, 1, 0, 1,
-0.4985555, -1.76234, -3.283163, 0.1215686, 1, 0, 1,
-0.4923544, 0.557972, -0.005238881, 0.1176471, 1, 0, 1,
-0.4916082, 1.194215, 0.9887989, 0.1098039, 1, 0, 1,
-0.4880207, 1.23988, 0.22293, 0.1058824, 1, 0, 1,
-0.4824848, -0.03535634, -2.101966, 0.09803922, 1, 0, 1,
-0.4814332, 1.61063, -0.3123697, 0.09019608, 1, 0, 1,
-0.4779661, 0.6158901, 0.3171835, 0.08627451, 1, 0, 1,
-0.4779446, 0.0369655, -2.341269, 0.07843138, 1, 0, 1,
-0.4759347, -1.018686, -2.9511, 0.07450981, 1, 0, 1,
-0.4747862, -0.8243372, -1.369067, 0.06666667, 1, 0, 1,
-0.473291, -0.5180348, -2.707579, 0.0627451, 1, 0, 1,
-0.4718497, -0.05099668, -1.034268, 0.05490196, 1, 0, 1,
-0.4690468, -0.8387262, -3.485174, 0.05098039, 1, 0, 1,
-0.46358, -0.5763775, -2.715101, 0.04313726, 1, 0, 1,
-0.4564866, 0.2150327, -2.147319, 0.03921569, 1, 0, 1,
-0.4501072, 1.279025, -1.218117, 0.03137255, 1, 0, 1,
-0.4499242, 0.205181, -1.329702, 0.02745098, 1, 0, 1,
-0.4493403, -0.875823, -3.657353, 0.01960784, 1, 0, 1,
-0.4458249, -0.144176, -0.682582, 0.01568628, 1, 0, 1,
-0.4444146, 0.3072523, -0.6375704, 0.007843138, 1, 0, 1,
-0.4418365, -1.244599, -2.56457, 0.003921569, 1, 0, 1,
-0.4409901, -0.6038416, -1.494909, 0, 1, 0.003921569, 1,
-0.425152, -0.6808823, -2.099829, 0, 1, 0.01176471, 1,
-0.4242325, 0.6900707, -0.8799275, 0, 1, 0.01568628, 1,
-0.4227745, -2.277189, -1.98078, 0, 1, 0.02352941, 1,
-0.4227365, 0.8850814, -0.3503965, 0, 1, 0.02745098, 1,
-0.4090045, -0.6566129, -2.443473, 0, 1, 0.03529412, 1,
-0.4060355, 2.419529, -0.5734921, 0, 1, 0.03921569, 1,
-0.4021251, 0.5766118, -0.3925635, 0, 1, 0.04705882, 1,
-0.3997516, 0.572689, 0.3208075, 0, 1, 0.05098039, 1,
-0.3967322, -1.595066, -2.91644, 0, 1, 0.05882353, 1,
-0.3965023, 0.2463458, -0.3677862, 0, 1, 0.0627451, 1,
-0.3960001, -0.1082986, -0.4488329, 0, 1, 0.07058824, 1,
-0.3958511, -1.998107, -4.190981, 0, 1, 0.07450981, 1,
-0.3921344, -0.3375115, -1.802536, 0, 1, 0.08235294, 1,
-0.3892409, -0.7600874, -2.964228, 0, 1, 0.08627451, 1,
-0.3857293, -0.5358595, -2.549155, 0, 1, 0.09411765, 1,
-0.3832394, 0.8068488, -0.5653072, 0, 1, 0.1019608, 1,
-0.3819256, 1.90001, -0.8597473, 0, 1, 0.1058824, 1,
-0.3796587, 1.435574, 1.05592, 0, 1, 0.1137255, 1,
-0.3710816, 0.1130176, -2.987816, 0, 1, 0.1176471, 1,
-0.3670378, 1.840684, -0.1037664, 0, 1, 0.1254902, 1,
-0.3631303, -0.1227887, -1.744514, 0, 1, 0.1294118, 1,
-0.3604573, -1.43561, -3.073461, 0, 1, 0.1372549, 1,
-0.360248, 0.7876201, -1.345138, 0, 1, 0.1411765, 1,
-0.3591753, -0.2563048, -2.879608, 0, 1, 0.1490196, 1,
-0.3566875, -0.186325, -2.580877, 0, 1, 0.1529412, 1,
-0.3555452, -1.031752, -2.403843, 0, 1, 0.1607843, 1,
-0.3537402, -0.1664606, -0.5663269, 0, 1, 0.1647059, 1,
-0.3523744, -0.3593297, -4.114209, 0, 1, 0.172549, 1,
-0.3514546, 0.4912855, -1.143865, 0, 1, 0.1764706, 1,
-0.3506359, 0.5356195, -1.154182, 0, 1, 0.1843137, 1,
-0.3465804, -0.07508468, -2.029432, 0, 1, 0.1882353, 1,
-0.3448125, -0.7659352, -2.217437, 0, 1, 0.1960784, 1,
-0.3416426, -0.5774801, -3.256827, 0, 1, 0.2039216, 1,
-0.3412071, -0.2720605, -2.109396, 0, 1, 0.2078431, 1,
-0.3395593, -1.979836, -4.398058, 0, 1, 0.2156863, 1,
-0.3383106, -1.38358, -2.773662, 0, 1, 0.2196078, 1,
-0.337688, 0.9304329, 0.6631256, 0, 1, 0.227451, 1,
-0.3354454, 0.6591274, -0.8843223, 0, 1, 0.2313726, 1,
-0.3347274, 0.9828693, 0.40154, 0, 1, 0.2392157, 1,
-0.3340762, -0.2381986, -2.180238, 0, 1, 0.2431373, 1,
-0.3312613, -0.2833811, -1.948291, 0, 1, 0.2509804, 1,
-0.3299342, 0.1425305, -0.7647409, 0, 1, 0.254902, 1,
-0.3286737, -1.305614, -2.468849, 0, 1, 0.2627451, 1,
-0.3264538, 1.690052, 0.2529652, 0, 1, 0.2666667, 1,
-0.3237991, -1.39217, -4.652778, 0, 1, 0.2745098, 1,
-0.3211426, 0.01822489, -1.682561, 0, 1, 0.2784314, 1,
-0.3179009, -0.7023957, -3.644025, 0, 1, 0.2862745, 1,
-0.316909, 0.9497092, -2.793717, 0, 1, 0.2901961, 1,
-0.3149054, -0.7319553, -2.613281, 0, 1, 0.2980392, 1,
-0.3120075, 0.3805695, -1.507093, 0, 1, 0.3058824, 1,
-0.3099759, 0.4919733, 0.1501586, 0, 1, 0.3098039, 1,
-0.3089734, 0.5950181, -0.0006340888, 0, 1, 0.3176471, 1,
-0.3078131, 0.316583, -2.551904, 0, 1, 0.3215686, 1,
-0.307108, -0.3474705, -2.433103, 0, 1, 0.3294118, 1,
-0.3055177, -0.4924754, -2.927921, 0, 1, 0.3333333, 1,
-0.301844, -1.994458, -3.633247, 0, 1, 0.3411765, 1,
-0.2985436, 1.074801, 0.6967205, 0, 1, 0.345098, 1,
-0.2966901, 0.1350657, -2.515579, 0, 1, 0.3529412, 1,
-0.2964081, 0.4377305, -1.135127, 0, 1, 0.3568628, 1,
-0.2958622, 0.6891317, 0.356289, 0, 1, 0.3647059, 1,
-0.2951719, 0.2522869, -0.564819, 0, 1, 0.3686275, 1,
-0.290286, 0.5193545, -1.825251, 0, 1, 0.3764706, 1,
-0.2886438, 1.336787, -0.4472004, 0, 1, 0.3803922, 1,
-0.2868619, 0.6053007, -1.11986, 0, 1, 0.3882353, 1,
-0.2858935, -0.4564527, -2.015002, 0, 1, 0.3921569, 1,
-0.2822154, -0.1996122, -2.177119, 0, 1, 0.4, 1,
-0.2808919, -0.8156232, -1.835632, 0, 1, 0.4078431, 1,
-0.2758843, 0.531303, 0.8268053, 0, 1, 0.4117647, 1,
-0.2737951, 1.360754, 1.97466, 0, 1, 0.4196078, 1,
-0.2654317, 0.2215252, -2.61674, 0, 1, 0.4235294, 1,
-0.265209, -1.121163, -2.183757, 0, 1, 0.4313726, 1,
-0.2648045, 0.8388813, -0.01313618, 0, 1, 0.4352941, 1,
-0.2582898, 0.07659955, -2.85053, 0, 1, 0.4431373, 1,
-0.2582408, -1.89504, -3.676042, 0, 1, 0.4470588, 1,
-0.2581466, 0.6571581, -0.04349174, 0, 1, 0.454902, 1,
-0.2561215, 0.986339, -0.9573171, 0, 1, 0.4588235, 1,
-0.255949, 1.022923, -0.9030347, 0, 1, 0.4666667, 1,
-0.2540138, -1.672806, -2.85698, 0, 1, 0.4705882, 1,
-0.2514259, -0.2321988, -3.73382, 0, 1, 0.4784314, 1,
-0.2496664, 0.5237909, -1.085967, 0, 1, 0.4823529, 1,
-0.2441491, 1.048859, -1.168466, 0, 1, 0.4901961, 1,
-0.2433002, -2.018762, -3.65686, 0, 1, 0.4941176, 1,
-0.242875, -0.5565313, -1.954644, 0, 1, 0.5019608, 1,
-0.2369331, 1.266107, 0.6179774, 0, 1, 0.509804, 1,
-0.2358939, 0.5465806, 1.245286, 0, 1, 0.5137255, 1,
-0.2351145, -0.07177804, -4.6436, 0, 1, 0.5215687, 1,
-0.2224013, -0.8766167, -5.373533, 0, 1, 0.5254902, 1,
-0.2215247, 0.4651575, -0.3944458, 0, 1, 0.5333334, 1,
-0.2202409, 0.8638667, 0.3523338, 0, 1, 0.5372549, 1,
-0.2172124, -0.3978472, -2.816334, 0, 1, 0.5450981, 1,
-0.2152035, -0.381754, -2.328383, 0, 1, 0.5490196, 1,
-0.2112554, 0.07255516, -0.3643643, 0, 1, 0.5568628, 1,
-0.2098351, 0.03439695, -0.001780267, 0, 1, 0.5607843, 1,
-0.2086928, -3.111653, -2.4748, 0, 1, 0.5686275, 1,
-0.2082485, -0.9198846, -2.479253, 0, 1, 0.572549, 1,
-0.206638, -1.6071, -1.850919, 0, 1, 0.5803922, 1,
-0.2063182, 1.824148, -1.025557, 0, 1, 0.5843138, 1,
-0.204096, -1.620626, -3.979268, 0, 1, 0.5921569, 1,
-0.1995731, -0.6588253, -4.435798, 0, 1, 0.5960785, 1,
-0.1953021, 0.8597474, -0.1659566, 0, 1, 0.6039216, 1,
-0.1926316, 0.357487, 0.05870295, 0, 1, 0.6117647, 1,
-0.1888443, -0.1865755, -2.721851, 0, 1, 0.6156863, 1,
-0.1887734, -2.116729, -2.726609, 0, 1, 0.6235294, 1,
-0.1857763, 1.113685, -0.1918917, 0, 1, 0.627451, 1,
-0.1755181, -0.569381, -3.07081, 0, 1, 0.6352941, 1,
-0.1721714, 0.8146707, 0.5994404, 0, 1, 0.6392157, 1,
-0.1711417, -0.8769449, -2.302018, 0, 1, 0.6470588, 1,
-0.1710851, -0.3565761, -1.716414, 0, 1, 0.6509804, 1,
-0.1612961, -0.6677929, -2.340735, 0, 1, 0.6588235, 1,
-0.159892, -0.6672409, -3.455134, 0, 1, 0.6627451, 1,
-0.1571378, 0.6745456, -0.3421629, 0, 1, 0.6705883, 1,
-0.1522877, 0.8303711, -0.9837609, 0, 1, 0.6745098, 1,
-0.1511905, -0.4156897, -3.467877, 0, 1, 0.682353, 1,
-0.1489808, -0.9888942, -3.795205, 0, 1, 0.6862745, 1,
-0.1471047, 2.258493, 0.7620419, 0, 1, 0.6941177, 1,
-0.1415903, -0.4698242, -2.571244, 0, 1, 0.7019608, 1,
-0.1402488, -0.9282424, -2.696642, 0, 1, 0.7058824, 1,
-0.1350376, -1.479624, -3.657167, 0, 1, 0.7137255, 1,
-0.1345979, -1.125834, -3.647438, 0, 1, 0.7176471, 1,
-0.1335375, 0.2252224, 0.8634482, 0, 1, 0.7254902, 1,
-0.1329805, 0.3149428, -2.432143, 0, 1, 0.7294118, 1,
-0.1275411, -0.3231792, -2.569906, 0, 1, 0.7372549, 1,
-0.1258933, 1.174159, -0.5695677, 0, 1, 0.7411765, 1,
-0.1218867, -0.01256843, -1.580237, 0, 1, 0.7490196, 1,
-0.1195288, 2.183456, 1.415827, 0, 1, 0.7529412, 1,
-0.1180586, -1.707546, -2.563931, 0, 1, 0.7607843, 1,
-0.1174135, -2.50974, -3.532111, 0, 1, 0.7647059, 1,
-0.1047102, 0.4021392, 0.4530977, 0, 1, 0.772549, 1,
-0.1018756, -0.3563427, -3.044616, 0, 1, 0.7764706, 1,
-0.1009649, 0.02442223, -1.351952, 0, 1, 0.7843137, 1,
-0.09969592, 0.7010264, 0.685724, 0, 1, 0.7882353, 1,
-0.09956896, -1.270988, -1.639171, 0, 1, 0.7960784, 1,
-0.09634939, -0.4122483, -2.780745, 0, 1, 0.8039216, 1,
-0.09064034, 0.3413427, 0.01375628, 0, 1, 0.8078431, 1,
-0.08788944, 1.229431, -0.01607299, 0, 1, 0.8156863, 1,
-0.0876736, -0.5278206, -3.012778, 0, 1, 0.8196079, 1,
-0.08429979, 0.9153256, 0.1741788, 0, 1, 0.827451, 1,
-0.08275682, 1.370744, -1.109589, 0, 1, 0.8313726, 1,
-0.07718699, 0.7430926, -1.634997, 0, 1, 0.8392157, 1,
-0.07631105, 0.9716554, -0.2758899, 0, 1, 0.8431373, 1,
-0.07223192, 1.191184, 1.713691, 0, 1, 0.8509804, 1,
-0.07164428, 0.6322346, 1.089289, 0, 1, 0.854902, 1,
-0.06827468, 0.8825647, 0.2775528, 0, 1, 0.8627451, 1,
-0.0611193, -0.801253, -5.752937, 0, 1, 0.8666667, 1,
-0.06076678, 0.3285756, -1.797831, 0, 1, 0.8745098, 1,
-0.05842711, 0.09968118, -1.363462, 0, 1, 0.8784314, 1,
-0.05838249, 0.4059906, -0.8211142, 0, 1, 0.8862745, 1,
-0.0556839, 0.02684528, 0.2450424, 0, 1, 0.8901961, 1,
-0.05451505, 1.942029, -0.8022239, 0, 1, 0.8980392, 1,
-0.05354378, 1.775906, -1.360667, 0, 1, 0.9058824, 1,
-0.05246655, 0.5814585, 1.839207, 0, 1, 0.9098039, 1,
-0.05192025, -0.3883289, -2.775615, 0, 1, 0.9176471, 1,
-0.03107646, 0.4870581, -1.865315, 0, 1, 0.9215686, 1,
-0.03089988, -1.457479, -2.446289, 0, 1, 0.9294118, 1,
-0.0248008, -1.745191, -3.312151, 0, 1, 0.9333333, 1,
-0.02412612, 0.3965732, -2.149363, 0, 1, 0.9411765, 1,
-0.02166549, -0.4110575, -2.67065, 0, 1, 0.945098, 1,
-0.02015547, -0.1236037, -4.762341, 0, 1, 0.9529412, 1,
-0.0199159, -0.6743674, -3.790469, 0, 1, 0.9568627, 1,
-0.01678089, 0.8244638, -0.05290526, 0, 1, 0.9647059, 1,
-0.0148546, 0.1213333, 0.4267287, 0, 1, 0.9686275, 1,
-0.0101978, 0.2467723, 0.441903, 0, 1, 0.9764706, 1,
-0.009110824, 0.2518461, -0.9608312, 0, 1, 0.9803922, 1,
-0.008579032, 0.03064724, -0.2444565, 0, 1, 0.9882353, 1,
-0.008403283, -0.1501901, -3.906239, 0, 1, 0.9921569, 1,
-0.004233878, 0.4855601, 0.2763324, 0, 1, 1, 1,
0.002244068, -0.4737312, 4.429479, 0, 0.9921569, 1, 1,
0.002404485, -2.155974, 1.939183, 0, 0.9882353, 1, 1,
0.009931538, 2.009685, 0.3874272, 0, 0.9803922, 1, 1,
0.01100958, 1.61017, -1.387696, 0, 0.9764706, 1, 1,
0.01150443, 0.4115214, 1.289361, 0, 0.9686275, 1, 1,
0.01810499, 1.173703, -0.2322748, 0, 0.9647059, 1, 1,
0.01834414, -0.5639947, 4.382102, 0, 0.9568627, 1, 1,
0.02469113, 0.4743402, 0.9679229, 0, 0.9529412, 1, 1,
0.02625378, -0.7327812, 2.82128, 0, 0.945098, 1, 1,
0.02671661, 1.243288, -1.101114, 0, 0.9411765, 1, 1,
0.02992246, 0.9657924, 0.4416296, 0, 0.9333333, 1, 1,
0.03221762, -0.2979436, 2.442872, 0, 0.9294118, 1, 1,
0.0344658, -1.130542, 4.278872, 0, 0.9215686, 1, 1,
0.03466543, 0.8702176, 0.002572202, 0, 0.9176471, 1, 1,
0.03649796, 0.8993692, 0.2237702, 0, 0.9098039, 1, 1,
0.03747196, -1.416187, 3.41139, 0, 0.9058824, 1, 1,
0.03889284, 0.6436333, 1.173689, 0, 0.8980392, 1, 1,
0.04135633, 0.9146881, -0.9341558, 0, 0.8901961, 1, 1,
0.0427626, 1.51103, -1.872157, 0, 0.8862745, 1, 1,
0.04911911, 0.5767951, -0.0635379, 0, 0.8784314, 1, 1,
0.05284226, 0.3720925, -0.6969761, 0, 0.8745098, 1, 1,
0.053363, 0.7922674, 2.548205, 0, 0.8666667, 1, 1,
0.05657881, 0.5457981, -1.490265, 0, 0.8627451, 1, 1,
0.05661154, -1.529493, 3.012449, 0, 0.854902, 1, 1,
0.06353004, -0.8448432, 2.753679, 0, 0.8509804, 1, 1,
0.06360027, 0.05053309, 1.989038, 0, 0.8431373, 1, 1,
0.06496427, 1.210189, 0.05627263, 0, 0.8392157, 1, 1,
0.07143958, -1.108999, 2.173156, 0, 0.8313726, 1, 1,
0.07382604, -2.602551, 3.744868, 0, 0.827451, 1, 1,
0.07385296, 1.801715, -1.422339, 0, 0.8196079, 1, 1,
0.07458983, -1.70393, 2.520548, 0, 0.8156863, 1, 1,
0.07612655, -1.158245, 4.058322, 0, 0.8078431, 1, 1,
0.07640605, 1.69496, -0.7915807, 0, 0.8039216, 1, 1,
0.07676358, 0.6090724, -0.3226653, 0, 0.7960784, 1, 1,
0.07866268, -0.4832063, 1.349536, 0, 0.7882353, 1, 1,
0.08667091, 0.5286537, 0.3369216, 0, 0.7843137, 1, 1,
0.09554774, -1.106278, 5.167707, 0, 0.7764706, 1, 1,
0.09557892, -0.9599131, 3.710609, 0, 0.772549, 1, 1,
0.09745853, -2.046813, 2.53928, 0, 0.7647059, 1, 1,
0.1029652, -1.498847, 3.083319, 0, 0.7607843, 1, 1,
0.1036964, -1.113613, 4.668888, 0, 0.7529412, 1, 1,
0.1038487, -0.1528075, 3.106522, 0, 0.7490196, 1, 1,
0.1101211, 0.2706711, 1.506601, 0, 0.7411765, 1, 1,
0.1106436, 1.098844, 0.7333102, 0, 0.7372549, 1, 1,
0.1129081, -0.8466319, 3.528062, 0, 0.7294118, 1, 1,
0.1177295, 0.1860088, 1.089899, 0, 0.7254902, 1, 1,
0.1201862, -0.1412226, 2.812681, 0, 0.7176471, 1, 1,
0.1234419, 2.558303, 0.1017569, 0, 0.7137255, 1, 1,
0.1249819, 1.818408, -2.566931, 0, 0.7058824, 1, 1,
0.1261787, -0.2214485, 2.598602, 0, 0.6980392, 1, 1,
0.1273079, 1.125821, -0.08756844, 0, 0.6941177, 1, 1,
0.1304378, -0.5089383, 4.407244, 0, 0.6862745, 1, 1,
0.1324266, 0.4557404, 0.9998047, 0, 0.682353, 1, 1,
0.1374412, 1.512904, 0.667801, 0, 0.6745098, 1, 1,
0.142108, 0.5713964, 1.384516, 0, 0.6705883, 1, 1,
0.1433546, 0.5489261, -0.2862716, 0, 0.6627451, 1, 1,
0.1452274, 1.353483, 0.7590818, 0, 0.6588235, 1, 1,
0.1526839, 0.5265142, -0.5319815, 0, 0.6509804, 1, 1,
0.1557239, 1.854846, 1.720271, 0, 0.6470588, 1, 1,
0.1564128, -0.7159072, 2.044408, 0, 0.6392157, 1, 1,
0.1572726, 0.7303782, 0.1961489, 0, 0.6352941, 1, 1,
0.1573297, -1.229226, 4.248857, 0, 0.627451, 1, 1,
0.1586237, -0.9273089, 2.431696, 0, 0.6235294, 1, 1,
0.1628044, 0.005460476, 0.9165899, 0, 0.6156863, 1, 1,
0.1660207, -0.7228844, 0.9442028, 0, 0.6117647, 1, 1,
0.1663714, 0.6680435, -1.41612, 0, 0.6039216, 1, 1,
0.1688877, -1.30651, 0.2899857, 0, 0.5960785, 1, 1,
0.1695471, 0.4761383, -1.086713, 0, 0.5921569, 1, 1,
0.1701144, 0.4218591, 1.519404, 0, 0.5843138, 1, 1,
0.1727768, -1.043447, 2.712569, 0, 0.5803922, 1, 1,
0.1728574, -0.2440064, 3.258759, 0, 0.572549, 1, 1,
0.1783432, -0.2429629, 3.102204, 0, 0.5686275, 1, 1,
0.1868752, 0.1656565, 1.598687, 0, 0.5607843, 1, 1,
0.1872995, 1.010412, -0.003372134, 0, 0.5568628, 1, 1,
0.1898389, 0.1255833, 0.3460265, 0, 0.5490196, 1, 1,
0.1904746, 2.461493, 0.02091663, 0, 0.5450981, 1, 1,
0.1924952, 2.291211, 0.2136618, 0, 0.5372549, 1, 1,
0.1956629, -1.059843, 2.655874, 0, 0.5333334, 1, 1,
0.1987709, 0.06853079, 1.111738, 0, 0.5254902, 1, 1,
0.1989544, -2.445908, 4.532007, 0, 0.5215687, 1, 1,
0.2113828, 0.8754365, -1.019474, 0, 0.5137255, 1, 1,
0.2188103, -0.5580859, 3.733709, 0, 0.509804, 1, 1,
0.2212831, -0.7478481, 3.468591, 0, 0.5019608, 1, 1,
0.2215577, -0.959163, 1.395908, 0, 0.4941176, 1, 1,
0.2216516, 0.4412547, 0.1798776, 0, 0.4901961, 1, 1,
0.2229945, -0.4985003, 2.887693, 0, 0.4823529, 1, 1,
0.2237589, -0.5835536, 1.729751, 0, 0.4784314, 1, 1,
0.2324974, 0.5949061, 0.6631334, 0, 0.4705882, 1, 1,
0.2333128, 0.7592116, -1.959932, 0, 0.4666667, 1, 1,
0.2338483, 0.8081194, -0.09533952, 0, 0.4588235, 1, 1,
0.2345113, -0.4849532, 1.981366, 0, 0.454902, 1, 1,
0.2363317, 1.880262, 0.7356905, 0, 0.4470588, 1, 1,
0.236594, 0.6412979, 1.747312, 0, 0.4431373, 1, 1,
0.2379583, 0.01925775, -1.685883, 0, 0.4352941, 1, 1,
0.2382807, 0.932417, -0.4461735, 0, 0.4313726, 1, 1,
0.2384917, 1.288214, 2.282968, 0, 0.4235294, 1, 1,
0.2421712, 0.7081913, 0.3752204, 0, 0.4196078, 1, 1,
0.2426016, 1.078381, -0.2108771, 0, 0.4117647, 1, 1,
0.2433585, 0.7145212, 1.585797, 0, 0.4078431, 1, 1,
0.2470871, -0.9648274, 1.473895, 0, 0.4, 1, 1,
0.2514714, 0.9073129, 1.608137, 0, 0.3921569, 1, 1,
0.2549402, -1.01444, 3.151925, 0, 0.3882353, 1, 1,
0.2646864, -1.431914, 2.179606, 0, 0.3803922, 1, 1,
0.266039, -1.850864, 3.256771, 0, 0.3764706, 1, 1,
0.2672313, 0.1562261, 0.03953863, 0, 0.3686275, 1, 1,
0.2679348, 0.9478478, -0.4075384, 0, 0.3647059, 1, 1,
0.2704482, 2.042804, 0.1498561, 0, 0.3568628, 1, 1,
0.2717564, 0.4652312, 1.258773, 0, 0.3529412, 1, 1,
0.28658, -0.3133318, 2.403389, 0, 0.345098, 1, 1,
0.2870465, -0.5096002, 3.429834, 0, 0.3411765, 1, 1,
0.2872221, 1.364662, -1.527919, 0, 0.3333333, 1, 1,
0.2948127, 0.1163994, 0.2740749, 0, 0.3294118, 1, 1,
0.2952176, -0.4450961, 1.537298, 0, 0.3215686, 1, 1,
0.2958378, 0.2834568, 2.84795, 0, 0.3176471, 1, 1,
0.2966179, -0.3967712, 2.143733, 0, 0.3098039, 1, 1,
0.3007358, -0.5841199, 3.046086, 0, 0.3058824, 1, 1,
0.3035601, 0.8184154, 1.982699, 0, 0.2980392, 1, 1,
0.3074272, 1.065179, 2.370135, 0, 0.2901961, 1, 1,
0.3148202, 0.8584701, -0.4690942, 0, 0.2862745, 1, 1,
0.31688, -0.009185915, 2.629568, 0, 0.2784314, 1, 1,
0.3300906, -1.000577, 3.589466, 0, 0.2745098, 1, 1,
0.3304851, -0.1908954, 4.278603, 0, 0.2666667, 1, 1,
0.3339612, 0.4571414, -0.4087078, 0, 0.2627451, 1, 1,
0.338216, 0.9073136, -0.05299896, 0, 0.254902, 1, 1,
0.3393776, -0.2883474, 2.417118, 0, 0.2509804, 1, 1,
0.3462512, -0.5368423, 1.886693, 0, 0.2431373, 1, 1,
0.3514748, 0.9087901, 0.2315532, 0, 0.2392157, 1, 1,
0.3559684, -0.4784415, 1.293617, 0, 0.2313726, 1, 1,
0.3566609, -1.014946, 3.361267, 0, 0.227451, 1, 1,
0.3570769, -1.1097, 4.555684, 0, 0.2196078, 1, 1,
0.3581684, 0.2655483, 2.259151, 0, 0.2156863, 1, 1,
0.3584465, 0.5233234, 0.3679764, 0, 0.2078431, 1, 1,
0.362581, -0.3826203, 2.886569, 0, 0.2039216, 1, 1,
0.3640179, -0.06489243, 1.847349, 0, 0.1960784, 1, 1,
0.3648725, 2.623829, -0.9312408, 0, 0.1882353, 1, 1,
0.3667687, -1.035554, 4.137741, 0, 0.1843137, 1, 1,
0.3708688, 0.530159, 0.8681874, 0, 0.1764706, 1, 1,
0.3880398, 1.174903, -0.1756016, 0, 0.172549, 1, 1,
0.3903064, 0.5980456, 0.980691, 0, 0.1647059, 1, 1,
0.3903516, 0.4774606, -0.9465027, 0, 0.1607843, 1, 1,
0.3922308, 0.5778996, 1.34141, 0, 0.1529412, 1, 1,
0.3958748, -0.5228488, 3.068129, 0, 0.1490196, 1, 1,
0.4013135, -0.3946951, 1.826424, 0, 0.1411765, 1, 1,
0.4020797, 0.8375745, 2.126677, 0, 0.1372549, 1, 1,
0.4039588, 0.3479114, 0.04814701, 0, 0.1294118, 1, 1,
0.4054647, -0.9581509, 1.880807, 0, 0.1254902, 1, 1,
0.4062178, -1.733787, 1.476545, 0, 0.1176471, 1, 1,
0.4098456, 1.193761, -0.7352917, 0, 0.1137255, 1, 1,
0.4098698, 0.6484095, -0.3725009, 0, 0.1058824, 1, 1,
0.4107338, -1.393744, 3.513501, 0, 0.09803922, 1, 1,
0.4134866, 0.6099985, 1.657957, 0, 0.09411765, 1, 1,
0.4142341, 0.4976906, 1.199783, 0, 0.08627451, 1, 1,
0.415502, 0.3342932, 0.3146901, 0, 0.08235294, 1, 1,
0.4165157, -0.7293479, 3.417411, 0, 0.07450981, 1, 1,
0.4175295, -0.02556737, 2.982727, 0, 0.07058824, 1, 1,
0.4296919, -0.3472034, 3.238752, 0, 0.0627451, 1, 1,
0.4305735, 0.7578146, 0.07286613, 0, 0.05882353, 1, 1,
0.432713, -0.6650375, 3.396695, 0, 0.05098039, 1, 1,
0.4328676, 0.08358083, 1.564125, 0, 0.04705882, 1, 1,
0.4343202, 0.418803, 0.2930238, 0, 0.03921569, 1, 1,
0.4361422, 1.509066, -0.2378261, 0, 0.03529412, 1, 1,
0.4391183, -2.489896, 2.32433, 0, 0.02745098, 1, 1,
0.4395604, 0.5791606, 1.559798, 0, 0.02352941, 1, 1,
0.4428807, -1.068256, 3.054903, 0, 0.01568628, 1, 1,
0.4507749, 2.034577, 0.6489977, 0, 0.01176471, 1, 1,
0.4557377, 0.4514264, 0.5377731, 0, 0.003921569, 1, 1,
0.4576077, 2.13543, 0.6752927, 0.003921569, 0, 1, 1,
0.4593805, 0.5112181, 0.1839611, 0.007843138, 0, 1, 1,
0.4630899, 1.726708, -0.6873422, 0.01568628, 0, 1, 1,
0.465484, 0.7370986, 0.05945565, 0.01960784, 0, 1, 1,
0.4681951, 1.238085, -0.2032565, 0.02745098, 0, 1, 1,
0.469, 1.166374, 2.332509, 0.03137255, 0, 1, 1,
0.469256, 0.3309646, -0.2549202, 0.03921569, 0, 1, 1,
0.4715295, -1.219977, 3.960577, 0.04313726, 0, 1, 1,
0.4717483, 0.2522426, 1.283979, 0.05098039, 0, 1, 1,
0.4727168, -1.173493, 3.554175, 0.05490196, 0, 1, 1,
0.4728913, 0.3960936, -0.634636, 0.0627451, 0, 1, 1,
0.4784526, -0.9113984, 4.019696, 0.06666667, 0, 1, 1,
0.4795875, 0.7284289, 0.9711206, 0.07450981, 0, 1, 1,
0.4798323, -1.414272, 3.023021, 0.07843138, 0, 1, 1,
0.4861925, -1.419746, 3.912297, 0.08627451, 0, 1, 1,
0.49041, -0.4753638, 2.992115, 0.09019608, 0, 1, 1,
0.4967833, -0.1182489, 1.850387, 0.09803922, 0, 1, 1,
0.5011407, 0.5138747, -0.9607189, 0.1058824, 0, 1, 1,
0.5044155, 0.9214259, -0.349866, 0.1098039, 0, 1, 1,
0.5131059, -2.075595, 4.431387, 0.1176471, 0, 1, 1,
0.5136743, -1.048469, 3.892164, 0.1215686, 0, 1, 1,
0.5143316, 1.588192, -0.2688074, 0.1294118, 0, 1, 1,
0.5148802, 0.580317, 1.219365, 0.1333333, 0, 1, 1,
0.5160805, -0.3634576, 2.72562, 0.1411765, 0, 1, 1,
0.5167688, 1.519785, 0.9619143, 0.145098, 0, 1, 1,
0.5226377, 0.5754457, 2.036276, 0.1529412, 0, 1, 1,
0.5226915, 0.2472731, -1.147524, 0.1568628, 0, 1, 1,
0.5244493, -0.9428788, 2.390175, 0.1647059, 0, 1, 1,
0.5261412, -0.05043946, 0.7854258, 0.1686275, 0, 1, 1,
0.5262535, 0.624863, 1.966155, 0.1764706, 0, 1, 1,
0.5268494, -0.5774102, 2.63669, 0.1803922, 0, 1, 1,
0.5276873, 1.718925, -2.180259, 0.1882353, 0, 1, 1,
0.5393106, -1.426943, 4.669472, 0.1921569, 0, 1, 1,
0.5405335, 0.1068145, 0.9344429, 0.2, 0, 1, 1,
0.5430866, -1.586918, 2.916656, 0.2078431, 0, 1, 1,
0.5509679, 1.026957, 0.8944402, 0.2117647, 0, 1, 1,
0.5550481, -0.2073887, 0.9378491, 0.2196078, 0, 1, 1,
0.5562524, -1.579044, 3.808817, 0.2235294, 0, 1, 1,
0.5579218, 0.06242275, 0.564409, 0.2313726, 0, 1, 1,
0.5597078, -1.270915, 2.810636, 0.2352941, 0, 1, 1,
0.5625159, 1.293894, 0.1760887, 0.2431373, 0, 1, 1,
0.5660704, -2.687464, 3.480435, 0.2470588, 0, 1, 1,
0.567727, 0.7572062, -0.4042403, 0.254902, 0, 1, 1,
0.5680404, 0.6403151, 0.5964313, 0.2588235, 0, 1, 1,
0.569235, -0.9241816, 3.82342, 0.2666667, 0, 1, 1,
0.5712658, 0.1574065, 1.397538, 0.2705882, 0, 1, 1,
0.5724172, 0.2865973, 1.462563, 0.2784314, 0, 1, 1,
0.573532, 0.5421772, 0.1672247, 0.282353, 0, 1, 1,
0.5795569, -0.2610732, 1.60183, 0.2901961, 0, 1, 1,
0.5812346, 0.06885202, 2.15204, 0.2941177, 0, 1, 1,
0.584174, 0.2888606, 1.191807, 0.3019608, 0, 1, 1,
0.5865107, 0.05863852, 0.7776366, 0.3098039, 0, 1, 1,
0.5922797, 0.823575, 0.5148479, 0.3137255, 0, 1, 1,
0.5940188, 0.04152559, 1.618755, 0.3215686, 0, 1, 1,
0.5991153, -1.852167, 2.532337, 0.3254902, 0, 1, 1,
0.6038651, 1.125039, -0.4674216, 0.3333333, 0, 1, 1,
0.6040049, -1.372893, 3.916661, 0.3372549, 0, 1, 1,
0.6091177, -1.364407, 3.247987, 0.345098, 0, 1, 1,
0.6116989, 0.730683, 2.666081, 0.3490196, 0, 1, 1,
0.6129017, -1.376425, 2.379042, 0.3568628, 0, 1, 1,
0.6166466, -1.778803, -0.01489733, 0.3607843, 0, 1, 1,
0.6224872, -1.438384, 2.180206, 0.3686275, 0, 1, 1,
0.6231105, -0.6623765, 1.640257, 0.372549, 0, 1, 1,
0.6243979, 0.6469565, 0.2362059, 0.3803922, 0, 1, 1,
0.6357329, -1.055119, 2.155005, 0.3843137, 0, 1, 1,
0.636761, -0.1210707, 1.686867, 0.3921569, 0, 1, 1,
0.6418169, 0.3577692, -0.247513, 0.3960784, 0, 1, 1,
0.6450535, 2.328841, -0.935852, 0.4039216, 0, 1, 1,
0.6466643, 1.771075, -0.08630484, 0.4117647, 0, 1, 1,
0.6504248, 0.1557519, 2.669307, 0.4156863, 0, 1, 1,
0.6512584, 0.7152001, -0.08715395, 0.4235294, 0, 1, 1,
0.6552938, 3.585611, 2.139828, 0.427451, 0, 1, 1,
0.6598353, -0.4368294, 1.853315, 0.4352941, 0, 1, 1,
0.6661267, -0.172592, 3.270851, 0.4392157, 0, 1, 1,
0.6703698, -0.5319567, 2.237798, 0.4470588, 0, 1, 1,
0.6768659, 2.273669, 1.161528, 0.4509804, 0, 1, 1,
0.6793283, -0.9637951, 2.644333, 0.4588235, 0, 1, 1,
0.6796116, 2.414776, 0.6998923, 0.4627451, 0, 1, 1,
0.6815957, 0.01385691, 0.5850576, 0.4705882, 0, 1, 1,
0.6838144, -0.8010777, 2.26388, 0.4745098, 0, 1, 1,
0.6910642, -1.117372, 1.670592, 0.4823529, 0, 1, 1,
0.6999621, 0.04721754, 1.524961, 0.4862745, 0, 1, 1,
0.7009858, 0.2998986, 0.8549116, 0.4941176, 0, 1, 1,
0.702108, -0.7903928, 1.506137, 0.5019608, 0, 1, 1,
0.7062723, -1.988517, 1.638921, 0.5058824, 0, 1, 1,
0.7084962, -0.395884, 0.2554533, 0.5137255, 0, 1, 1,
0.7085134, 0.07060495, 1.235313, 0.5176471, 0, 1, 1,
0.7127735, 1.292227, -0.005811013, 0.5254902, 0, 1, 1,
0.7152574, 0.7667062, 2.188293, 0.5294118, 0, 1, 1,
0.7166373, -0.7226984, 2.672994, 0.5372549, 0, 1, 1,
0.7192242, -0.2320646, 0.6614015, 0.5411765, 0, 1, 1,
0.720841, -1.241145, 2.218729, 0.5490196, 0, 1, 1,
0.7245423, -0.002405501, 1.2637, 0.5529412, 0, 1, 1,
0.7313756, 0.7756462, 0.5390374, 0.5607843, 0, 1, 1,
0.7326264, 0.751592, 2.011338, 0.5647059, 0, 1, 1,
0.7328544, -0.2207347, 1.179909, 0.572549, 0, 1, 1,
0.7331996, 0.953506, 0.881652, 0.5764706, 0, 1, 1,
0.7370108, -0.676618, 1.925652, 0.5843138, 0, 1, 1,
0.7472921, -0.1979505, 3.690475, 0.5882353, 0, 1, 1,
0.7507181, 0.09695967, 1.907629, 0.5960785, 0, 1, 1,
0.7560149, 0.9889877, 0.7827802, 0.6039216, 0, 1, 1,
0.7573655, -0.9004188, 2.408188, 0.6078432, 0, 1, 1,
0.758532, -0.6632734, 2.239103, 0.6156863, 0, 1, 1,
0.7623851, -2.198479, 3.816691, 0.6196079, 0, 1, 1,
0.765685, 0.3820205, 0.3446147, 0.627451, 0, 1, 1,
0.7657607, -1.546387, 2.625023, 0.6313726, 0, 1, 1,
0.7711771, 0.6032324, 1.185697, 0.6392157, 0, 1, 1,
0.7902321, 0.2569699, 3.439483, 0.6431373, 0, 1, 1,
0.804541, 1.499404, -0.770062, 0.6509804, 0, 1, 1,
0.8086691, 0.2498736, 0.9252868, 0.654902, 0, 1, 1,
0.8107843, 0.9921102, 1.615373, 0.6627451, 0, 1, 1,
0.8133647, 0.08298419, 0.2375873, 0.6666667, 0, 1, 1,
0.8144309, -0.3417532, 2.288956, 0.6745098, 0, 1, 1,
0.8148659, -1.681991, 1.894817, 0.6784314, 0, 1, 1,
0.8187302, 0.7407123, 1.618987, 0.6862745, 0, 1, 1,
0.8198971, 0.2498048, 0.4488489, 0.6901961, 0, 1, 1,
0.8205726, -1.37672, 1.956703, 0.6980392, 0, 1, 1,
0.8239045, 0.5387041, 1.748158, 0.7058824, 0, 1, 1,
0.8242653, 0.9464836, -0.1081935, 0.7098039, 0, 1, 1,
0.8242963, -1.699314, 2.919336, 0.7176471, 0, 1, 1,
0.8306758, 0.5691063, 0.5473873, 0.7215686, 0, 1, 1,
0.8527274, 0.665134, 0.7502168, 0.7294118, 0, 1, 1,
0.8617088, 0.8882216, 0.8809626, 0.7333333, 0, 1, 1,
0.8645905, 0.4730784, 0.8478361, 0.7411765, 0, 1, 1,
0.8648975, 0.339454, 2.412731, 0.7450981, 0, 1, 1,
0.8739899, 0.4488662, 0.6489894, 0.7529412, 0, 1, 1,
0.8804094, -0.106626, 1.334664, 0.7568628, 0, 1, 1,
0.8828417, -0.7754304, 3.254676, 0.7647059, 0, 1, 1,
0.8896789, 0.769411, 1.7623, 0.7686275, 0, 1, 1,
0.8904971, 0.2742387, 0.1687578, 0.7764706, 0, 1, 1,
0.8925582, -0.3686885, 0.4275539, 0.7803922, 0, 1, 1,
0.8934472, -0.981839, 1.571408, 0.7882353, 0, 1, 1,
0.8938214, -0.4178761, 1.237216, 0.7921569, 0, 1, 1,
0.8942034, 1.382631, 0.4426198, 0.8, 0, 1, 1,
0.8949483, -1.807702, 1.892054, 0.8078431, 0, 1, 1,
0.8959345, 0.9309584, 1.486385, 0.8117647, 0, 1, 1,
0.8970701, 1.329341, 0.6465037, 0.8196079, 0, 1, 1,
0.8976926, -0.8839866, 4.218061, 0.8235294, 0, 1, 1,
0.9032894, 2.392754, 0.8165125, 0.8313726, 0, 1, 1,
0.9061227, 0.4488726, 0.9788067, 0.8352941, 0, 1, 1,
0.9161642, 0.4898463, 1.651419, 0.8431373, 0, 1, 1,
0.9198184, -0.3701087, 1.244064, 0.8470588, 0, 1, 1,
0.9218554, 0.2661397, 0.7569647, 0.854902, 0, 1, 1,
0.9273047, -0.9922583, 1.660314, 0.8588235, 0, 1, 1,
0.9308736, 0.3580651, 2.5262, 0.8666667, 0, 1, 1,
0.9339736, -0.8681489, 2.984716, 0.8705882, 0, 1, 1,
0.9528452, -2.128114, 1.831653, 0.8784314, 0, 1, 1,
0.9532186, -0.9707183, 3.160799, 0.8823529, 0, 1, 1,
0.9593, 0.2019803, -0.03632786, 0.8901961, 0, 1, 1,
0.9628648, -0.6884571, 0.186109, 0.8941177, 0, 1, 1,
0.9630345, 0.2676768, -0.3690484, 0.9019608, 0, 1, 1,
0.9657124, -0.3455784, 2.339705, 0.9098039, 0, 1, 1,
0.9699393, 0.6796284, 1.546422, 0.9137255, 0, 1, 1,
0.9703482, -0.2837348, 1.921418, 0.9215686, 0, 1, 1,
0.9711526, 1.388473, 1.751583, 0.9254902, 0, 1, 1,
0.976454, 1.052433, -1.285872, 0.9333333, 0, 1, 1,
0.9787552, -1.794217, 1.824669, 0.9372549, 0, 1, 1,
0.994541, -1.054476, 3.937327, 0.945098, 0, 1, 1,
0.9963288, -0.8572844, 0.05635848, 0.9490196, 0, 1, 1,
1.00071, 0.7684842, 1.992117, 0.9568627, 0, 1, 1,
1.003782, 0.4868331, 0.8453318, 0.9607843, 0, 1, 1,
1.005794, 0.836722, -0.05421413, 0.9686275, 0, 1, 1,
1.008013, -1.103502, 2.503139, 0.972549, 0, 1, 1,
1.009896, -0.9580167, 1.654863, 0.9803922, 0, 1, 1,
1.018633, 1.314617, -0.02653005, 0.9843137, 0, 1, 1,
1.019812, 1.375966, -0.2446181, 0.9921569, 0, 1, 1,
1.0216, 1.017764, 1.246942, 0.9960784, 0, 1, 1,
1.021739, 0.3935438, 2.071635, 1, 0, 0.9960784, 1,
1.022284, 0.3532718, 0.5114887, 1, 0, 0.9882353, 1,
1.024151, -1.59282, 3.052671, 1, 0, 0.9843137, 1,
1.025119, 0.9709327, 0.6193784, 1, 0, 0.9764706, 1,
1.029021, -0.09798458, 2.339245, 1, 0, 0.972549, 1,
1.0292, -0.1666793, 1.286397, 1, 0, 0.9647059, 1,
1.046719, -0.904754, 2.890943, 1, 0, 0.9607843, 1,
1.05043, 1.740954, 1.362583, 1, 0, 0.9529412, 1,
1.054467, -0.1507099, 0.6317737, 1, 0, 0.9490196, 1,
1.055503, -0.2912265, 1.878271, 1, 0, 0.9411765, 1,
1.059802, 2.226093, 0.552693, 1, 0, 0.9372549, 1,
1.063863, -0.5024743, 2.308352, 1, 0, 0.9294118, 1,
1.068339, 0.2678694, 0.4673283, 1, 0, 0.9254902, 1,
1.070629, -0.770197, 2.159324, 1, 0, 0.9176471, 1,
1.075109, -1.14133, 2.297081, 1, 0, 0.9137255, 1,
1.07963, 1.425287, 0.9110813, 1, 0, 0.9058824, 1,
1.082161, 0.5555363, 0.8510908, 1, 0, 0.9019608, 1,
1.087213, 0.4264458, 0.7322081, 1, 0, 0.8941177, 1,
1.103097, 0.07180151, 2.635772, 1, 0, 0.8862745, 1,
1.103253, -0.7529705, 2.850806, 1, 0, 0.8823529, 1,
1.104204, -1.012445, 3.190403, 1, 0, 0.8745098, 1,
1.107929, 0.841294, 1.237355, 1, 0, 0.8705882, 1,
1.109539, -0.2027778, 0.3248533, 1, 0, 0.8627451, 1,
1.110034, 1.1368, 0.03329941, 1, 0, 0.8588235, 1,
1.126378, -0.7030085, 2.28462, 1, 0, 0.8509804, 1,
1.136436, 0.05962848, 0.4311507, 1, 0, 0.8470588, 1,
1.137478, 0.8563711, 2.559074, 1, 0, 0.8392157, 1,
1.154687, 1.011197, -0.9311042, 1, 0, 0.8352941, 1,
1.169517, -0.6794233, 2.95512, 1, 0, 0.827451, 1,
1.175694, 1.452636, -0.6344085, 1, 0, 0.8235294, 1,
1.176411, -0.3348011, 1.630749, 1, 0, 0.8156863, 1,
1.183331, 0.2923311, 2.160765, 1, 0, 0.8117647, 1,
1.185324, 0.1576758, 1.913055, 1, 0, 0.8039216, 1,
1.186665, -0.04787553, 2.288051, 1, 0, 0.7960784, 1,
1.193205, -1.085368, 2.528215, 1, 0, 0.7921569, 1,
1.197381, -0.862792, 2.161294, 1, 0, 0.7843137, 1,
1.197543, -1.88407, 0.8163162, 1, 0, 0.7803922, 1,
1.197642, -0.104039, 1.576477, 1, 0, 0.772549, 1,
1.199133, -0.03482081, 1.160096, 1, 0, 0.7686275, 1,
1.200467, -0.01442076, 2.017469, 1, 0, 0.7607843, 1,
1.203868, -0.2663824, 1.263434, 1, 0, 0.7568628, 1,
1.216141, 0.5988229, 0.2507252, 1, 0, 0.7490196, 1,
1.218044, -0.6139676, 1.048384, 1, 0, 0.7450981, 1,
1.222032, -0.5254942, 2.874924, 1, 0, 0.7372549, 1,
1.234888, 1.623269, 0.2937854, 1, 0, 0.7333333, 1,
1.237301, -0.246367, 3.749218, 1, 0, 0.7254902, 1,
1.237763, 0.1922824, 0.7915146, 1, 0, 0.7215686, 1,
1.256409, -0.9550444, 3.003144, 1, 0, 0.7137255, 1,
1.258193, -0.6814918, 1.340454, 1, 0, 0.7098039, 1,
1.263919, -0.8083046, 1.774912, 1, 0, 0.7019608, 1,
1.265597, -0.4023355, 3.630056, 1, 0, 0.6941177, 1,
1.273693, 0.2036089, 2.896104, 1, 0, 0.6901961, 1,
1.274592, -0.03281634, 1.752991, 1, 0, 0.682353, 1,
1.28194, 0.8776176, 1.321995, 1, 0, 0.6784314, 1,
1.28424, 0.6687689, 1.072022, 1, 0, 0.6705883, 1,
1.297334, -1.14684, 3.013708, 1, 0, 0.6666667, 1,
1.299481, 1.301941, -0.07494909, 1, 0, 0.6588235, 1,
1.302494, 1.248294, 0.9134321, 1, 0, 0.654902, 1,
1.31509, -0.4847032, 1.130561, 1, 0, 0.6470588, 1,
1.322179, -1.390479, 2.335923, 1, 0, 0.6431373, 1,
1.324938, -1.618323, 2.584046, 1, 0, 0.6352941, 1,
1.327145, 0.5362582, 1.716436, 1, 0, 0.6313726, 1,
1.327254, -1.895518, 1.336724, 1, 0, 0.6235294, 1,
1.327698, -1.113212, 2.634492, 1, 0, 0.6196079, 1,
1.328676, 0.5798073, 0.7885752, 1, 0, 0.6117647, 1,
1.333909, 1.786802, -0.08915741, 1, 0, 0.6078432, 1,
1.340789, 1.671308, 0.8704908, 1, 0, 0.6, 1,
1.342529, -1.094849, 3.199939, 1, 0, 0.5921569, 1,
1.347363, 0.1216551, -0.7734478, 1, 0, 0.5882353, 1,
1.350769, -1.421129, 0.5161507, 1, 0, 0.5803922, 1,
1.359451, -0.6740161, 3.963578, 1, 0, 0.5764706, 1,
1.370141, -0.6511832, 2.056594, 1, 0, 0.5686275, 1,
1.382366, 1.30248, -0.02715623, 1, 0, 0.5647059, 1,
1.390498, 1.345844, 0.3976938, 1, 0, 0.5568628, 1,
1.4093, -0.5223316, 1.740708, 1, 0, 0.5529412, 1,
1.42386, -0.9406455, 1.130486, 1, 0, 0.5450981, 1,
1.42485, 0.2777726, -1.134235, 1, 0, 0.5411765, 1,
1.426825, -1.602351, 1.96016, 1, 0, 0.5333334, 1,
1.427675, 3.628353, -0.3733571, 1, 0, 0.5294118, 1,
1.428256, 1.444512, 1.689383, 1, 0, 0.5215687, 1,
1.438586, 0.8477607, 0.8290435, 1, 0, 0.5176471, 1,
1.440984, -0.3764126, 3.877303, 1, 0, 0.509804, 1,
1.460408, 0.9031102, 1.164133, 1, 0, 0.5058824, 1,
1.466066, 2.318443, 0.5720185, 1, 0, 0.4980392, 1,
1.470968, 1.227978, 2.06184, 1, 0, 0.4901961, 1,
1.480155, 0.7373912, -1.068114, 1, 0, 0.4862745, 1,
1.488698, 1.30465, 0.4827895, 1, 0, 0.4784314, 1,
1.499693, 0.8029479, -0.1891982, 1, 0, 0.4745098, 1,
1.500722, 1.044739, 0.5678076, 1, 0, 0.4666667, 1,
1.506357, 1.702832, 2.476881, 1, 0, 0.4627451, 1,
1.506958, -1.16809, 1.076076, 1, 0, 0.454902, 1,
1.507599, 0.8922924, 1.683059, 1, 0, 0.4509804, 1,
1.515478, -1.421182, 2.123963, 1, 0, 0.4431373, 1,
1.515974, -0.7003794, 2.323815, 1, 0, 0.4392157, 1,
1.518158, -1.042443, 1.359219, 1, 0, 0.4313726, 1,
1.518879, 1.402915, 1.588552, 1, 0, 0.427451, 1,
1.535557, -3.835232, 3.425131, 1, 0, 0.4196078, 1,
1.542192, -0.3572211, 3.278384, 1, 0, 0.4156863, 1,
1.553223, 0.1300435, 1.428748, 1, 0, 0.4078431, 1,
1.557114, -1.625258, 2.102503, 1, 0, 0.4039216, 1,
1.560789, 1.067464, 0.1899556, 1, 0, 0.3960784, 1,
1.569336, 1.932178, -0.5295859, 1, 0, 0.3882353, 1,
1.570176, 0.1748108, 3.124519, 1, 0, 0.3843137, 1,
1.585938, -0.4600327, 2.247349, 1, 0, 0.3764706, 1,
1.5879, 0.7725744, 1.535924, 1, 0, 0.372549, 1,
1.588961, 0.7243135, 1.011255, 1, 0, 0.3647059, 1,
1.59959, 0.4332991, 1.159912, 1, 0, 0.3607843, 1,
1.608543, -0.4376497, 1.171648, 1, 0, 0.3529412, 1,
1.61896, 0.6310118, 1.79113, 1, 0, 0.3490196, 1,
1.621643, -0.7342296, 1.862359, 1, 0, 0.3411765, 1,
1.623756, 0.3417548, 3.207654, 1, 0, 0.3372549, 1,
1.640773, -0.9492868, 3.166447, 1, 0, 0.3294118, 1,
1.641947, -1.196737, 3.079326, 1, 0, 0.3254902, 1,
1.656132, -0.5639408, 1.761343, 1, 0, 0.3176471, 1,
1.666963, 1.193157, -0.3313908, 1, 0, 0.3137255, 1,
1.670234, -1.549881, 1.237184, 1, 0, 0.3058824, 1,
1.697634, -1.46664, 1.336751, 1, 0, 0.2980392, 1,
1.704439, -0.07009794, 2.33651, 1, 0, 0.2941177, 1,
1.709579, -0.1417044, 1.986046, 1, 0, 0.2862745, 1,
1.714234, -0.3958913, 3.070123, 1, 0, 0.282353, 1,
1.728976, -1.094611, 2.257827, 1, 0, 0.2745098, 1,
1.730968, -0.1526868, 1.462443, 1, 0, 0.2705882, 1,
1.740715, -0.05820046, 2.426329, 1, 0, 0.2627451, 1,
1.749611, 0.5576628, 0.9794229, 1, 0, 0.2588235, 1,
1.751041, -1.577292, 2.082615, 1, 0, 0.2509804, 1,
1.753202, 1.256856, 1.076749, 1, 0, 0.2470588, 1,
1.763747, -0.5126873, 0.3732221, 1, 0, 0.2392157, 1,
1.782869, -1.251015, 1.933656, 1, 0, 0.2352941, 1,
1.787271, 1.481589, 1.816207, 1, 0, 0.227451, 1,
1.812322, 0.6976148, 0.3337591, 1, 0, 0.2235294, 1,
1.830705, -0.02755486, 1.69885, 1, 0, 0.2156863, 1,
1.859078, -0.1479038, 0.1879828, 1, 0, 0.2117647, 1,
1.888787, -0.5115066, 1.601531, 1, 0, 0.2039216, 1,
1.892218, -1.866423, 0.5743248, 1, 0, 0.1960784, 1,
1.895173, -1.423438, 2.640102, 1, 0, 0.1921569, 1,
1.900861, -1.139556, 1.467421, 1, 0, 0.1843137, 1,
1.91729, -0.2971775, 2.092814, 1, 0, 0.1803922, 1,
1.94325, 0.5426767, 0.7112313, 1, 0, 0.172549, 1,
1.947421, 0.82658, 1.371648, 1, 0, 0.1686275, 1,
1.949901, -0.0442346, 1.936535, 1, 0, 0.1607843, 1,
1.981982, -1.142042, 2.526264, 1, 0, 0.1568628, 1,
1.986121, 0.6361693, 0.3208955, 1, 0, 0.1490196, 1,
2.003158, 1.043593, 0.01144692, 1, 0, 0.145098, 1,
2.012631, 0.7635003, 0.6161081, 1, 0, 0.1372549, 1,
2.072256, 0.2025167, 0.607226, 1, 0, 0.1333333, 1,
2.075603, 0.881063, 1.266367, 1, 0, 0.1254902, 1,
2.08968, 0.02423494, 0.7771755, 1, 0, 0.1215686, 1,
2.182445, 0.5457419, 2.086952, 1, 0, 0.1137255, 1,
2.188738, -0.9196354, 3.067958, 1, 0, 0.1098039, 1,
2.196503, 0.445012, -0.7004341, 1, 0, 0.1019608, 1,
2.20791, 1.110143, -0.1438788, 1, 0, 0.09411765, 1,
2.208169, -1.691637, 2.702899, 1, 0, 0.09019608, 1,
2.210308, -0.222186, 1.116123, 1, 0, 0.08235294, 1,
2.228662, 1.430528, 0.0516323, 1, 0, 0.07843138, 1,
2.230704, 1.420183, 0.919258, 1, 0, 0.07058824, 1,
2.248409, -0.4083291, 0.7579012, 1, 0, 0.06666667, 1,
2.317109, -0.3695555, 0.9668384, 1, 0, 0.05882353, 1,
2.360025, -0.6610312, 2.233282, 1, 0, 0.05490196, 1,
2.456346, 0.08005797, 0.05370467, 1, 0, 0.04705882, 1,
2.477308, 1.598918, 0.3736568, 1, 0, 0.04313726, 1,
2.494337, -0.08729494, 0.8235633, 1, 0, 0.03529412, 1,
2.516731, 0.1563284, 1.564481, 1, 0, 0.03137255, 1,
2.751751, 1.831154, 1.484349, 1, 0, 0.02352941, 1,
2.842954, 1.564138, 0.8652538, 1, 0, 0.01960784, 1,
2.84627, 1.756115, 1.072648, 1, 0, 0.01176471, 1,
2.869751, 0.4801258, 1.596643, 1, 0, 0.007843138, 1
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
-0.2322136, -5.100309, -7.603986, 0, -0.5, 0.5, 0.5,
-0.2322136, -5.100309, -7.603986, 1, -0.5, 0.5, 0.5,
-0.2322136, -5.100309, -7.603986, 1, 1.5, 0.5, 0.5,
-0.2322136, -5.100309, -7.603986, 0, 1.5, 0.5, 0.5
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
-4.385744, -0.1034396, -7.603986, 0, -0.5, 0.5, 0.5,
-4.385744, -0.1034396, -7.603986, 1, -0.5, 0.5, 0.5,
-4.385744, -0.1034396, -7.603986, 1, 1.5, 0.5, 0.5,
-4.385744, -0.1034396, -7.603986, 0, 1.5, 0.5, 0.5
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
-4.385744, -5.100309, -0.2926147, 0, -0.5, 0.5, 0.5,
-4.385744, -5.100309, -0.2926147, 1, -0.5, 0.5, 0.5,
-4.385744, -5.100309, -0.2926147, 1, 1.5, 0.5, 0.5,
-4.385744, -5.100309, -0.2926147, 0, 1.5, 0.5, 0.5
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
-3, -3.947186, -5.916747,
2, -3.947186, -5.916747,
-3, -3.947186, -5.916747,
-3, -4.139373, -6.197953,
-2, -3.947186, -5.916747,
-2, -4.139373, -6.197953,
-1, -3.947186, -5.916747,
-1, -4.139373, -6.197953,
0, -3.947186, -5.916747,
0, -4.139373, -6.197953,
1, -3.947186, -5.916747,
1, -4.139373, -6.197953,
2, -3.947186, -5.916747,
2, -4.139373, -6.197953
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
-3, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
-3, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
-3, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
-3, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5,
-2, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
-2, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
-2, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
-2, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5,
-1, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
-1, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
-1, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
-1, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5,
0, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
0, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
0, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
0, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5,
1, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
1, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
1, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
1, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5,
2, -4.523747, -6.760366, 0, -0.5, 0.5, 0.5,
2, -4.523747, -6.760366, 1, -0.5, 0.5, 0.5,
2, -4.523747, -6.760366, 1, 1.5, 0.5, 0.5,
2, -4.523747, -6.760366, 0, 1.5, 0.5, 0.5
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
-3.427237, -2, -5.916747,
-3.427237, 2, -5.916747,
-3.427237, -2, -5.916747,
-3.586988, -2, -6.197953,
-3.427237, 0, -5.916747,
-3.586988, 0, -6.197953,
-3.427237, 2, -5.916747,
-3.586988, 2, -6.197953
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
-3.90649, -2, -6.760366, 0, -0.5, 0.5, 0.5,
-3.90649, -2, -6.760366, 1, -0.5, 0.5, 0.5,
-3.90649, -2, -6.760366, 1, 1.5, 0.5, 0.5,
-3.90649, -2, -6.760366, 0, 1.5, 0.5, 0.5,
-3.90649, 0, -6.760366, 0, -0.5, 0.5, 0.5,
-3.90649, 0, -6.760366, 1, -0.5, 0.5, 0.5,
-3.90649, 0, -6.760366, 1, 1.5, 0.5, 0.5,
-3.90649, 0, -6.760366, 0, 1.5, 0.5, 0.5,
-3.90649, 2, -6.760366, 0, -0.5, 0.5, 0.5,
-3.90649, 2, -6.760366, 1, -0.5, 0.5, 0.5,
-3.90649, 2, -6.760366, 1, 1.5, 0.5, 0.5,
-3.90649, 2, -6.760366, 0, 1.5, 0.5, 0.5
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
-3.427237, -3.947186, -4,
-3.427237, -3.947186, 4,
-3.427237, -3.947186, -4,
-3.586988, -4.139373, -4,
-3.427237, -3.947186, -2,
-3.586988, -4.139373, -2,
-3.427237, -3.947186, 0,
-3.586988, -4.139373, 0,
-3.427237, -3.947186, 2,
-3.586988, -4.139373, 2,
-3.427237, -3.947186, 4,
-3.586988, -4.139373, 4
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
-3.90649, -4.523747, -4, 0, -0.5, 0.5, 0.5,
-3.90649, -4.523747, -4, 1, -0.5, 0.5, 0.5,
-3.90649, -4.523747, -4, 1, 1.5, 0.5, 0.5,
-3.90649, -4.523747, -4, 0, 1.5, 0.5, 0.5,
-3.90649, -4.523747, -2, 0, -0.5, 0.5, 0.5,
-3.90649, -4.523747, -2, 1, -0.5, 0.5, 0.5,
-3.90649, -4.523747, -2, 1, 1.5, 0.5, 0.5,
-3.90649, -4.523747, -2, 0, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 0, 0, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 0, 1, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 0, 1, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 0, 0, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 2, 0, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 2, 1, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 2, 1, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 2, 0, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 4, 0, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 4, 1, -0.5, 0.5, 0.5,
-3.90649, -4.523747, 4, 1, 1.5, 0.5, 0.5,
-3.90649, -4.523747, 4, 0, 1.5, 0.5, 0.5
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
-3.427237, -3.947186, -5.916747,
-3.427237, 3.740306, -5.916747,
-3.427237, -3.947186, 5.331517,
-3.427237, 3.740306, 5.331517,
-3.427237, -3.947186, -5.916747,
-3.427237, -3.947186, 5.331517,
-3.427237, 3.740306, -5.916747,
-3.427237, 3.740306, 5.331517,
-3.427237, -3.947186, -5.916747,
2.96281, -3.947186, -5.916747,
-3.427237, -3.947186, 5.331517,
2.96281, -3.947186, 5.331517,
-3.427237, 3.740306, -5.916747,
2.96281, 3.740306, -5.916747,
-3.427237, 3.740306, 5.331517,
2.96281, 3.740306, 5.331517,
2.96281, -3.947186, -5.916747,
2.96281, 3.740306, -5.916747,
2.96281, -3.947186, 5.331517,
2.96281, 3.740306, 5.331517,
2.96281, -3.947186, -5.916747,
2.96281, -3.947186, 5.331517,
2.96281, 3.740306, -5.916747,
2.96281, 3.740306, 5.331517
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
var radius = 8.035541;
var distance = 35.75103;
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
mvMatrix.translate( 0.2322136, 0.1034396, 0.2926147 );
mvMatrix.scale( 1.359643, 1.130172, 0.7724023 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75103);
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
3-ethoxy-4-nitrophen<-read.table("3-ethoxy-4-nitrophen.xyz", skip=1)
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
-3.334178, 0.1146844, -1.725343, 0, 0, 1, 1, 1,
-3.104469, 0.3876833, -2.27441, 1, 0, 0, 1, 1,
-2.795792, 1.454569, -0.5689516, 1, 0, 0, 1, 1,
-2.752477, -0.07110178, -1.441274, 1, 0, 0, 1, 1,
-2.501449, -0.2959848, -1.209285, 1, 0, 0, 1, 1,
-2.464402, -2.890128, -0.8284559, 1, 0, 0, 1, 1,
-2.403887, 0.8253126, -2.196839, 0, 0, 0, 1, 1,
-2.354589, -0.4744089, -1.390038, 0, 0, 0, 1, 1,
-2.267895, -1.384998, -3.492441, 0, 0, 0, 1, 1,
-2.250104, 0.08186539, -2.632676, 0, 0, 0, 1, 1,
-2.197256, 0.7438757, -0.6798111, 0, 0, 0, 1, 1,
-2.180795, -0.4615324, -0.7271019, 0, 0, 0, 1, 1,
-2.124755, -0.8977976, -1.016258, 0, 0, 0, 1, 1,
-2.118887, -0.161222, -1.681679, 1, 1, 1, 1, 1,
-2.090993, -0.0752032, -3.020603, 1, 1, 1, 1, 1,
-2.079105, 2.454402, 0.7659991, 1, 1, 1, 1, 1,
-2.003019, 0.2096726, -1.311871, 1, 1, 1, 1, 1,
-1.998194, 0.1460957, 0.08361737, 1, 1, 1, 1, 1,
-1.997066, -0.3733957, -1.556872, 1, 1, 1, 1, 1,
-1.996022, 0.1485928, -1.165526, 1, 1, 1, 1, 1,
-1.986061, 1.789, -2.293929, 1, 1, 1, 1, 1,
-1.971729, -1.006264, -0.2952699, 1, 1, 1, 1, 1,
-1.967104, -1.644688, -2.518626, 1, 1, 1, 1, 1,
-1.950686, -0.3179712, -2.855895, 1, 1, 1, 1, 1,
-1.921991, 0.5621595, -0.3296435, 1, 1, 1, 1, 1,
-1.904652, 0.2839667, -1.383165, 1, 1, 1, 1, 1,
-1.903281, 1.054332, -0.5149853, 1, 1, 1, 1, 1,
-1.889761, -0.2919245, -2.070855, 1, 1, 1, 1, 1,
-1.867771, -1.47209, -3.09672, 0, 0, 1, 1, 1,
-1.837349, 0.09328396, -1.813457, 1, 0, 0, 1, 1,
-1.826571, 0.1772134, -1.606333, 1, 0, 0, 1, 1,
-1.817978, 0.1727019, -3.500834, 1, 0, 0, 1, 1,
-1.785219, 0.9356161, -1.307232, 1, 0, 0, 1, 1,
-1.780193, 0.5108847, 0.7212016, 1, 0, 0, 1, 1,
-1.755383, -0.307753, -1.22989, 0, 0, 0, 1, 1,
-1.754009, 0.7891129, -1.145609, 0, 0, 0, 1, 1,
-1.739935, -0.7076439, -2.066744, 0, 0, 0, 1, 1,
-1.738558, -0.1835295, -2.403208, 0, 0, 0, 1, 1,
-1.723627, 0.05804687, -2.807787, 0, 0, 0, 1, 1,
-1.701873, -0.8510462, -3.417736, 0, 0, 0, 1, 1,
-1.687104, 1.103966, -2.917706, 0, 0, 0, 1, 1,
-1.66299, 1.038032, -0.1711752, 1, 1, 1, 1, 1,
-1.63913, -0.6334504, -0.6295469, 1, 1, 1, 1, 1,
-1.612585, -0.3738559, -3.996382, 1, 1, 1, 1, 1,
-1.603377, -0.9268845, -1.555416, 1, 1, 1, 1, 1,
-1.600034, 0.3735386, -1.664043, 1, 1, 1, 1, 1,
-1.589767, -0.2677087, -0.3939768, 1, 1, 1, 1, 1,
-1.57867, -0.201073, -1.258433, 1, 1, 1, 1, 1,
-1.574741, 0.3711331, -2.397563, 1, 1, 1, 1, 1,
-1.570994, -0.114227, -1.16948, 1, 1, 1, 1, 1,
-1.560574, 1.525991, -1.74949, 1, 1, 1, 1, 1,
-1.55708, 1.849347, -1.265764, 1, 1, 1, 1, 1,
-1.556704, 2.485014, -0.5832229, 1, 1, 1, 1, 1,
-1.552337, 2.178745, -0.3556391, 1, 1, 1, 1, 1,
-1.545504, 0.3614069, -1.562911, 1, 1, 1, 1, 1,
-1.543586, 0.1713071, -1.687955, 1, 1, 1, 1, 1,
-1.542512, -1.196087, 0.1169364, 0, 0, 1, 1, 1,
-1.512646, -1.24561, -2.455168, 1, 0, 0, 1, 1,
-1.512199, -0.4364201, -2.371524, 1, 0, 0, 1, 1,
-1.481429, 1.061805, -0.8323979, 1, 0, 0, 1, 1,
-1.472301, -0.4635671, -1.383879, 1, 0, 0, 1, 1,
-1.47005, -0.705457, -0.4929326, 1, 0, 0, 1, 1,
-1.465681, -0.7822508, -2.122272, 0, 0, 0, 1, 1,
-1.465044, 1.005277, -0.4703144, 0, 0, 0, 1, 1,
-1.454725, 0.04783101, 0.5281321, 0, 0, 0, 1, 1,
-1.452801, -0.3214017, -2.637422, 0, 0, 0, 1, 1,
-1.446957, 1.16477, 1.023268, 0, 0, 0, 1, 1,
-1.446501, 1.240559, -0.232171, 0, 0, 0, 1, 1,
-1.43099, 0.1594211, -1.743543, 0, 0, 0, 1, 1,
-1.420035, 0.7595977, -1.73114, 1, 1, 1, 1, 1,
-1.417952, -1.372948, -3.894564, 1, 1, 1, 1, 1,
-1.416952, -0.6886311, -2.098395, 1, 1, 1, 1, 1,
-1.41389, -0.0009635625, -3.077236, 1, 1, 1, 1, 1,
-1.410711, -0.5622972, -2.772096, 1, 1, 1, 1, 1,
-1.410213, -0.04645627, -0.5988159, 1, 1, 1, 1, 1,
-1.407084, 1.022153, 0.7320029, 1, 1, 1, 1, 1,
-1.399108, 1.667256, -0.446198, 1, 1, 1, 1, 1,
-1.398906, -0.4758299, -3.216746, 1, 1, 1, 1, 1,
-1.397765, -0.4086754, -2.81515, 1, 1, 1, 1, 1,
-1.396345, -1.350863, -0.7027708, 1, 1, 1, 1, 1,
-1.392567, -0.3014485, -1.713901, 1, 1, 1, 1, 1,
-1.391215, 0.770702, -2.58327, 1, 1, 1, 1, 1,
-1.377579, -0.1348546, -0.9516643, 1, 1, 1, 1, 1,
-1.370535, 1.938228, -1.345801, 1, 1, 1, 1, 1,
-1.370474, -1.513297, -2.893377, 0, 0, 1, 1, 1,
-1.369996, 0.9380577, -0.6755385, 1, 0, 0, 1, 1,
-1.369655, 0.5181744, -0.263187, 1, 0, 0, 1, 1,
-1.363426, 0.9063793, -3.734005, 1, 0, 0, 1, 1,
-1.362547, -0.4684373, -1.183422, 1, 0, 0, 1, 1,
-1.362527, 0.3161507, 0.1146006, 1, 0, 0, 1, 1,
-1.359296, -0.3355106, -4.052971, 0, 0, 0, 1, 1,
-1.356769, -1.380513, -1.444065, 0, 0, 0, 1, 1,
-1.354171, -0.5663837, -0.9369859, 0, 0, 0, 1, 1,
-1.35142, 0.8358386, -1.810928, 0, 0, 0, 1, 1,
-1.334716, -0.3169905, -2.377483, 0, 0, 0, 1, 1,
-1.331008, 2.570629, 0.837132, 0, 0, 0, 1, 1,
-1.330922, -1.332242, -3.065007, 0, 0, 0, 1, 1,
-1.325459, 1.540743, -0.05098423, 1, 1, 1, 1, 1,
-1.322691, 0.4287527, -0.6221112, 1, 1, 1, 1, 1,
-1.317787, -0.9042634, -2.522709, 1, 1, 1, 1, 1,
-1.316257, -0.9326823, -2.740391, 1, 1, 1, 1, 1,
-1.304248, -0.138913, -1.972219, 1, 1, 1, 1, 1,
-1.304189, 0.5165485, -1.79204, 1, 1, 1, 1, 1,
-1.301375, 0.07830088, -1.046758, 1, 1, 1, 1, 1,
-1.300332, -0.01006764, -2.648347, 1, 1, 1, 1, 1,
-1.299314, -0.6401667, -0.7947387, 1, 1, 1, 1, 1,
-1.299217, 0.2128543, -2.568358, 1, 1, 1, 1, 1,
-1.293036, 1.201336, -1.663859, 1, 1, 1, 1, 1,
-1.29225, 0.01475547, -1.563803, 1, 1, 1, 1, 1,
-1.291853, 0.1716261, -1.92388, 1, 1, 1, 1, 1,
-1.287146, 1.496, -1.396119, 1, 1, 1, 1, 1,
-1.286453, 0.9379306, 0.4748843, 1, 1, 1, 1, 1,
-1.282939, -0.4739502, -1.333948, 0, 0, 1, 1, 1,
-1.279866, 1.051843, 0.2484915, 1, 0, 0, 1, 1,
-1.275342, 0.07693773, -0.6920983, 1, 0, 0, 1, 1,
-1.272288, -0.7975287, -3.256698, 1, 0, 0, 1, 1,
-1.251668, 0.753409, -2.18189, 1, 0, 0, 1, 1,
-1.24611, -0.5422465, -1.332856, 1, 0, 0, 1, 1,
-1.243699, -0.1759015, -1.580979, 0, 0, 0, 1, 1,
-1.242591, 0.3164552, -0.1209706, 0, 0, 0, 1, 1,
-1.230043, -0.9179857, -2.215753, 0, 0, 0, 1, 1,
-1.209073, -1.815392, -3.217005, 0, 0, 0, 1, 1,
-1.208835, 0.3194163, -0.6088822, 0, 0, 0, 1, 1,
-1.207876, -1.083747, 0.3770949, 0, 0, 0, 1, 1,
-1.204236, 0.82355, -0.2564767, 0, 0, 0, 1, 1,
-1.198938, -0.7730737, -2.000459, 1, 1, 1, 1, 1,
-1.187331, -0.1768265, -2.208169, 1, 1, 1, 1, 1,
-1.181967, -2.787284, -1.630763, 1, 1, 1, 1, 1,
-1.179164, -0.9205227, -1.297306, 1, 1, 1, 1, 1,
-1.170596, -0.2093568, -1.523094, 1, 1, 1, 1, 1,
-1.158721, 1.595995, 0.2814302, 1, 1, 1, 1, 1,
-1.149234, -1.388846, -2.1622, 1, 1, 1, 1, 1,
-1.148882, 1.23245, 0.2660941, 1, 1, 1, 1, 1,
-1.148723, 0.3949161, -0.8792648, 1, 1, 1, 1, 1,
-1.14593, 0.2924567, -1.20146, 1, 1, 1, 1, 1,
-1.144054, 1.063468, -2.899501, 1, 1, 1, 1, 1,
-1.143885, 2.344519, -0.8039735, 1, 1, 1, 1, 1,
-1.139273, -1.844124, -2.042439, 1, 1, 1, 1, 1,
-1.13625, 1.160132, -0.301649, 1, 1, 1, 1, 1,
-1.125164, 0.4836142, -1.752429, 1, 1, 1, 1, 1,
-1.122675, -0.7772509, -2.262245, 0, 0, 1, 1, 1,
-1.120782, 0.1083932, -3.194256, 1, 0, 0, 1, 1,
-1.115882, 0.2052875, -0.9244391, 1, 0, 0, 1, 1,
-1.109197, -1.637712, -2.874278, 1, 0, 0, 1, 1,
-1.105504, 0.358369, 0.1766146, 1, 0, 0, 1, 1,
-1.096487, -0.04732703, -1.866082, 1, 0, 0, 1, 1,
-1.09211, 1.946898, -2.161262, 0, 0, 0, 1, 1,
-1.087875, -0.5641081, -1.385826, 0, 0, 0, 1, 1,
-1.087265, -0.2583714, -1.723862, 0, 0, 0, 1, 1,
-1.084819, -0.2249566, -1.951611, 0, 0, 0, 1, 1,
-1.075655, 0.1204788, -1.965868, 0, 0, 0, 1, 1,
-1.073248, 2.077047, -0.5233682, 0, 0, 0, 1, 1,
-1.06582, -0.648406, -0.3697853, 0, 0, 0, 1, 1,
-1.058078, -0.1387998, -1.846099, 1, 1, 1, 1, 1,
-1.057424, 0.2220163, -0.5787672, 1, 1, 1, 1, 1,
-1.054591, 0.004210905, -1.172068, 1, 1, 1, 1, 1,
-1.050529, 0.6766213, -2.031957, 1, 1, 1, 1, 1,
-1.048854, 0.02265592, -1.421313, 1, 1, 1, 1, 1,
-1.040582, -1.237324, -4.147867, 1, 1, 1, 1, 1,
-1.040528, 0.5784609, -0.7815983, 1, 1, 1, 1, 1,
-1.038609, 0.6844028, -0.9747438, 1, 1, 1, 1, 1,
-1.036762, -1.019726, -3.781761, 1, 1, 1, 1, 1,
-1.029161, -0.7369296, -1.249684, 1, 1, 1, 1, 1,
-1.025521, -1.286877, -1.715125, 1, 1, 1, 1, 1,
-1.016963, -1.068823, -1.433648, 1, 1, 1, 1, 1,
-1.011364, 1.484422, -1.505483, 1, 1, 1, 1, 1,
-1.011057, -0.50014, -1.95713, 1, 1, 1, 1, 1,
-1.00511, -0.8772906, -4.650115, 1, 1, 1, 1, 1,
-0.9946715, -1.76394, -3.040839, 0, 0, 1, 1, 1,
-0.9899509, 1.720248, -0.1920617, 1, 0, 0, 1, 1,
-0.9887065, -1.229914, -3.215911, 1, 0, 0, 1, 1,
-0.9831162, 0.7017541, -2.012321, 1, 0, 0, 1, 1,
-0.9808335, -0.9493713, -1.523064, 1, 0, 0, 1, 1,
-0.9667402, -0.8093284, -3.700449, 1, 0, 0, 1, 1,
-0.9657463, 0.7500713, -2.12522, 0, 0, 0, 1, 1,
-0.9600397, -0.5996504, -1.52371, 0, 0, 0, 1, 1,
-0.9520415, 1.098325, -1.186067, 0, 0, 0, 1, 1,
-0.9509891, 0.004263877, -1.532851, 0, 0, 0, 1, 1,
-0.9392757, -0.4459342, -1.293023, 0, 0, 0, 1, 1,
-0.9360965, -1.261505, -3.66182, 0, 0, 0, 1, 1,
-0.9335137, -1.762176, -1.284622, 0, 0, 0, 1, 1,
-0.9324554, -1.028489, -2.894878, 1, 1, 1, 1, 1,
-0.9265426, 0.7868006, -1.19078, 1, 1, 1, 1, 1,
-0.9242014, -0.1394435, -2.961474, 1, 1, 1, 1, 1,
-0.9241523, 0.8784578, -0.05716349, 1, 1, 1, 1, 1,
-0.9223961, 1.432727, -1.108236, 1, 1, 1, 1, 1,
-0.9217888, -1.777769, -3.159863, 1, 1, 1, 1, 1,
-0.9190402, -0.1812841, -2.590513, 1, 1, 1, 1, 1,
-0.9156229, -0.3629193, -2.810338, 1, 1, 1, 1, 1,
-0.914575, -2.293622, -3.662703, 1, 1, 1, 1, 1,
-0.913825, -2.220317, -1.181274, 1, 1, 1, 1, 1,
-0.9026372, -0.2179194, -1.635297, 1, 1, 1, 1, 1,
-0.891277, -0.3157141, -1.002028, 1, 1, 1, 1, 1,
-0.8854164, -1.074594, -3.937604, 1, 1, 1, 1, 1,
-0.882085, -0.8563722, -2.733947, 1, 1, 1, 1, 1,
-0.8816497, -0.474746, -1.846812, 1, 1, 1, 1, 1,
-0.8811885, -0.8049135, -1.112999, 0, 0, 1, 1, 1,
-0.8774432, -0.04294655, -2.020573, 1, 0, 0, 1, 1,
-0.8722851, -0.4308405, -3.735716, 1, 0, 0, 1, 1,
-0.8696918, 0.449014, 0.6224248, 1, 0, 0, 1, 1,
-0.8649951, 0.435957, -2.278089, 1, 0, 0, 1, 1,
-0.8589627, 0.07406557, -3.309469, 1, 0, 0, 1, 1,
-0.8579753, 0.7184507, -0.7255661, 0, 0, 0, 1, 1,
-0.8563744, 0.329323, -2.177481, 0, 0, 0, 1, 1,
-0.8541508, 1.129673, 0.8736264, 0, 0, 0, 1, 1,
-0.8523046, -0.4470404, -2.781611, 0, 0, 0, 1, 1,
-0.8491372, -0.2520547, -2.741367, 0, 0, 0, 1, 1,
-0.8446195, -1.242579, -4.313559, 0, 0, 0, 1, 1,
-0.8435585, -0.7221653, -1.630679, 0, 0, 0, 1, 1,
-0.8419303, -1.156668, -0.9288118, 1, 1, 1, 1, 1,
-0.8413949, 0.3332123, -1.275345, 1, 1, 1, 1, 1,
-0.8413892, 0.7544895, -0.3403402, 1, 1, 1, 1, 1,
-0.8299828, 0.504509, -2.144188, 1, 1, 1, 1, 1,
-0.8261178, -1.605277, -2.005828, 1, 1, 1, 1, 1,
-0.8229454, 0.1094688, -0.001178154, 1, 1, 1, 1, 1,
-0.8214169, -1.249984, -2.005739, 1, 1, 1, 1, 1,
-0.817267, -0.02003476, -0.8567131, 1, 1, 1, 1, 1,
-0.816154, 2.221712, -0.1583325, 1, 1, 1, 1, 1,
-0.8155926, -2.052304, -1.828117, 1, 1, 1, 1, 1,
-0.8152825, 1.488981, -0.6670677, 1, 1, 1, 1, 1,
-0.8106947, -0.9389989, -2.926039, 1, 1, 1, 1, 1,
-0.8104185, -0.3004812, -3.507815, 1, 1, 1, 1, 1,
-0.8087212, -2.113399, -3.476963, 1, 1, 1, 1, 1,
-0.8068135, 1.377451, 1.416703, 1, 1, 1, 1, 1,
-0.8021478, 1.645501, -0.09422524, 0, 0, 1, 1, 1,
-0.7993916, -0.8600503, -2.607259, 1, 0, 0, 1, 1,
-0.7847759, 1.566484, -3.148044, 1, 0, 0, 1, 1,
-0.7812042, 1.441047, -0.1754431, 1, 0, 0, 1, 1,
-0.7809733, -0.2752504, -0.9883482, 1, 0, 0, 1, 1,
-0.7736932, 0.2206858, -2.063827, 1, 0, 0, 1, 1,
-0.7735832, 2.102424, 0.8366535, 0, 0, 0, 1, 1,
-0.7686999, 0.8800185, -0.4620644, 0, 0, 0, 1, 1,
-0.7682081, 0.08015016, -1.525019, 0, 0, 0, 1, 1,
-0.7615035, -2.042114, -4.378286, 0, 0, 0, 1, 1,
-0.7592833, -1.321967, -1.884278, 0, 0, 0, 1, 1,
-0.7575559, 0.4404055, -1.028535, 0, 0, 0, 1, 1,
-0.7565854, 0.1605237, 0.5520982, 0, 0, 0, 1, 1,
-0.7563833, -1.355243, -2.751822, 1, 1, 1, 1, 1,
-0.7552844, 1.944896, -0.4077775, 1, 1, 1, 1, 1,
-0.7512541, -0.1048644, -1.818871, 1, 1, 1, 1, 1,
-0.7448248, -0.4738131, -3.456311, 1, 1, 1, 1, 1,
-0.7400661, 0.8072237, -1.449174, 1, 1, 1, 1, 1,
-0.7382561, 0.4086527, -2.254837, 1, 1, 1, 1, 1,
-0.7379428, -0.5776149, -2.255668, 1, 1, 1, 1, 1,
-0.737525, -0.3928495, -2.484072, 1, 1, 1, 1, 1,
-0.7368819, -1.763226, -3.223665, 1, 1, 1, 1, 1,
-0.7311454, -0.1066756, -1.677181, 1, 1, 1, 1, 1,
-0.7298598, 0.484763, -2.533265, 1, 1, 1, 1, 1,
-0.7278136, 0.3250847, -3.04617, 1, 1, 1, 1, 1,
-0.7182985, 1.663482, -0.8928728, 1, 1, 1, 1, 1,
-0.7042076, -0.6465078, -2.050347, 1, 1, 1, 1, 1,
-0.7029244, 0.5420068, 0.8557604, 1, 1, 1, 1, 1,
-0.7017683, -1.056163, -1.91531, 0, 0, 1, 1, 1,
-0.6958314, -0.5948428, -3.246867, 1, 0, 0, 1, 1,
-0.6931201, -0.4983292, -1.598728, 1, 0, 0, 1, 1,
-0.6926801, 0.1542223, -1.033761, 1, 0, 0, 1, 1,
-0.6819137, -0.07002109, -1.782817, 1, 0, 0, 1, 1,
-0.6814643, -0.4655074, -3.76939, 1, 0, 0, 1, 1,
-0.6806164, -0.568985, -2.817802, 0, 0, 0, 1, 1,
-0.6783041, -0.5926995, -3.946645, 0, 0, 0, 1, 1,
-0.6739582, 0.5437854, -1.030708, 0, 0, 0, 1, 1,
-0.6738784, 0.7486684, 0.4670112, 0, 0, 0, 1, 1,
-0.6733294, 0.838383, -0.522038, 0, 0, 0, 1, 1,
-0.6700698, -0.3725789, -3.444438, 0, 0, 0, 1, 1,
-0.6674759, 0.3885507, -2.094469, 0, 0, 0, 1, 1,
-0.6667255, 0.527027, 1.61516, 1, 1, 1, 1, 1,
-0.6658922, -0.6458549, -2.707133, 1, 1, 1, 1, 1,
-0.6630248, -0.9011877, -2.171751, 1, 1, 1, 1, 1,
-0.6612912, -0.8156557, -3.627924, 1, 1, 1, 1, 1,
-0.6596746, -2.506945, -3.604886, 1, 1, 1, 1, 1,
-0.6524406, -1.719055, -0.7249705, 1, 1, 1, 1, 1,
-0.641553, -0.432738, -3.312605, 1, 1, 1, 1, 1,
-0.6339706, 0.2081181, -3.42381, 1, 1, 1, 1, 1,
-0.6293327, 1.673914, 1.216155, 1, 1, 1, 1, 1,
-0.624948, -0.5145428, -2.955459, 1, 1, 1, 1, 1,
-0.6131346, 1.322865, -2.014731, 1, 1, 1, 1, 1,
-0.6131218, -0.9481325, -2.826171, 1, 1, 1, 1, 1,
-0.6127802, -0.2469222, -3.355304, 1, 1, 1, 1, 1,
-0.6091772, 0.009994042, -1.358493, 1, 1, 1, 1, 1,
-0.6086437, 1.384502, -1.817547, 1, 1, 1, 1, 1,
-0.6056055, -0.6826053, -2.225844, 0, 0, 1, 1, 1,
-0.5888161, 0.2352192, -0.417737, 1, 0, 0, 1, 1,
-0.579086, -0.4884452, -3.057407, 1, 0, 0, 1, 1,
-0.5746735, 1.716828, -1.440824, 1, 0, 0, 1, 1,
-0.5732098, -0.2664786, -2.231932, 1, 0, 0, 1, 1,
-0.5725312, 1.052816, 0.03118093, 1, 0, 0, 1, 1,
-0.5718692, -0.3948444, -4.773232, 0, 0, 0, 1, 1,
-0.5708404, 0.04280438, -2.829599, 0, 0, 0, 1, 1,
-0.5681688, 0.893142, 0.4424611, 0, 0, 0, 1, 1,
-0.5668228, -0.6838623, -2.615863, 0, 0, 0, 1, 1,
-0.5668084, 0.4659072, -0.2070481, 0, 0, 0, 1, 1,
-0.563067, 0.7550668, -2.061693, 0, 0, 0, 1, 1,
-0.5627189, -1.996587, -2.145881, 0, 0, 0, 1, 1,
-0.5626964, -0.2405158, -2.161735, 1, 1, 1, 1, 1,
-0.5609227, 0.6927191, -1.003217, 1, 1, 1, 1, 1,
-0.5582859, -0.7836244, -2.235783, 1, 1, 1, 1, 1,
-0.5579545, 0.2209551, -2.579638, 1, 1, 1, 1, 1,
-0.5576078, -1.304774, -2.467008, 1, 1, 1, 1, 1,
-0.5560716, 2.865201, 0.1492733, 1, 1, 1, 1, 1,
-0.555616, 0.1191293, -1.248099, 1, 1, 1, 1, 1,
-0.5430272, -1.049384, -3.387261, 1, 1, 1, 1, 1,
-0.5369163, 1.565563, 0.1009197, 1, 1, 1, 1, 1,
-0.535933, -0.7254165, -3.350096, 1, 1, 1, 1, 1,
-0.5309713, -0.2627423, -0.9809024, 1, 1, 1, 1, 1,
-0.5305552, -0.607335, -2.054933, 1, 1, 1, 1, 1,
-0.5300052, 1.325692, -1.126968, 1, 1, 1, 1, 1,
-0.5266901, 0.439002, -1.732386, 1, 1, 1, 1, 1,
-0.5192821, 0.1502865, -1.539064, 1, 1, 1, 1, 1,
-0.5190505, -1.639408, -3.642411, 0, 0, 1, 1, 1,
-0.5129422, 0.5240982, -0.816843, 1, 0, 0, 1, 1,
-0.5060279, 0.981779, -1.360886, 1, 0, 0, 1, 1,
-0.5022218, -2.790997, -4.569921, 1, 0, 0, 1, 1,
-0.5010964, -0.8264846, -2.901891, 1, 0, 0, 1, 1,
-0.4985555, -1.76234, -3.283163, 1, 0, 0, 1, 1,
-0.4923544, 0.557972, -0.005238881, 0, 0, 0, 1, 1,
-0.4916082, 1.194215, 0.9887989, 0, 0, 0, 1, 1,
-0.4880207, 1.23988, 0.22293, 0, 0, 0, 1, 1,
-0.4824848, -0.03535634, -2.101966, 0, 0, 0, 1, 1,
-0.4814332, 1.61063, -0.3123697, 0, 0, 0, 1, 1,
-0.4779661, 0.6158901, 0.3171835, 0, 0, 0, 1, 1,
-0.4779446, 0.0369655, -2.341269, 0, 0, 0, 1, 1,
-0.4759347, -1.018686, -2.9511, 1, 1, 1, 1, 1,
-0.4747862, -0.8243372, -1.369067, 1, 1, 1, 1, 1,
-0.473291, -0.5180348, -2.707579, 1, 1, 1, 1, 1,
-0.4718497, -0.05099668, -1.034268, 1, 1, 1, 1, 1,
-0.4690468, -0.8387262, -3.485174, 1, 1, 1, 1, 1,
-0.46358, -0.5763775, -2.715101, 1, 1, 1, 1, 1,
-0.4564866, 0.2150327, -2.147319, 1, 1, 1, 1, 1,
-0.4501072, 1.279025, -1.218117, 1, 1, 1, 1, 1,
-0.4499242, 0.205181, -1.329702, 1, 1, 1, 1, 1,
-0.4493403, -0.875823, -3.657353, 1, 1, 1, 1, 1,
-0.4458249, -0.144176, -0.682582, 1, 1, 1, 1, 1,
-0.4444146, 0.3072523, -0.6375704, 1, 1, 1, 1, 1,
-0.4418365, -1.244599, -2.56457, 1, 1, 1, 1, 1,
-0.4409901, -0.6038416, -1.494909, 1, 1, 1, 1, 1,
-0.425152, -0.6808823, -2.099829, 1, 1, 1, 1, 1,
-0.4242325, 0.6900707, -0.8799275, 0, 0, 1, 1, 1,
-0.4227745, -2.277189, -1.98078, 1, 0, 0, 1, 1,
-0.4227365, 0.8850814, -0.3503965, 1, 0, 0, 1, 1,
-0.4090045, -0.6566129, -2.443473, 1, 0, 0, 1, 1,
-0.4060355, 2.419529, -0.5734921, 1, 0, 0, 1, 1,
-0.4021251, 0.5766118, -0.3925635, 1, 0, 0, 1, 1,
-0.3997516, 0.572689, 0.3208075, 0, 0, 0, 1, 1,
-0.3967322, -1.595066, -2.91644, 0, 0, 0, 1, 1,
-0.3965023, 0.2463458, -0.3677862, 0, 0, 0, 1, 1,
-0.3960001, -0.1082986, -0.4488329, 0, 0, 0, 1, 1,
-0.3958511, -1.998107, -4.190981, 0, 0, 0, 1, 1,
-0.3921344, -0.3375115, -1.802536, 0, 0, 0, 1, 1,
-0.3892409, -0.7600874, -2.964228, 0, 0, 0, 1, 1,
-0.3857293, -0.5358595, -2.549155, 1, 1, 1, 1, 1,
-0.3832394, 0.8068488, -0.5653072, 1, 1, 1, 1, 1,
-0.3819256, 1.90001, -0.8597473, 1, 1, 1, 1, 1,
-0.3796587, 1.435574, 1.05592, 1, 1, 1, 1, 1,
-0.3710816, 0.1130176, -2.987816, 1, 1, 1, 1, 1,
-0.3670378, 1.840684, -0.1037664, 1, 1, 1, 1, 1,
-0.3631303, -0.1227887, -1.744514, 1, 1, 1, 1, 1,
-0.3604573, -1.43561, -3.073461, 1, 1, 1, 1, 1,
-0.360248, 0.7876201, -1.345138, 1, 1, 1, 1, 1,
-0.3591753, -0.2563048, -2.879608, 1, 1, 1, 1, 1,
-0.3566875, -0.186325, -2.580877, 1, 1, 1, 1, 1,
-0.3555452, -1.031752, -2.403843, 1, 1, 1, 1, 1,
-0.3537402, -0.1664606, -0.5663269, 1, 1, 1, 1, 1,
-0.3523744, -0.3593297, -4.114209, 1, 1, 1, 1, 1,
-0.3514546, 0.4912855, -1.143865, 1, 1, 1, 1, 1,
-0.3506359, 0.5356195, -1.154182, 0, 0, 1, 1, 1,
-0.3465804, -0.07508468, -2.029432, 1, 0, 0, 1, 1,
-0.3448125, -0.7659352, -2.217437, 1, 0, 0, 1, 1,
-0.3416426, -0.5774801, -3.256827, 1, 0, 0, 1, 1,
-0.3412071, -0.2720605, -2.109396, 1, 0, 0, 1, 1,
-0.3395593, -1.979836, -4.398058, 1, 0, 0, 1, 1,
-0.3383106, -1.38358, -2.773662, 0, 0, 0, 1, 1,
-0.337688, 0.9304329, 0.6631256, 0, 0, 0, 1, 1,
-0.3354454, 0.6591274, -0.8843223, 0, 0, 0, 1, 1,
-0.3347274, 0.9828693, 0.40154, 0, 0, 0, 1, 1,
-0.3340762, -0.2381986, -2.180238, 0, 0, 0, 1, 1,
-0.3312613, -0.2833811, -1.948291, 0, 0, 0, 1, 1,
-0.3299342, 0.1425305, -0.7647409, 0, 0, 0, 1, 1,
-0.3286737, -1.305614, -2.468849, 1, 1, 1, 1, 1,
-0.3264538, 1.690052, 0.2529652, 1, 1, 1, 1, 1,
-0.3237991, -1.39217, -4.652778, 1, 1, 1, 1, 1,
-0.3211426, 0.01822489, -1.682561, 1, 1, 1, 1, 1,
-0.3179009, -0.7023957, -3.644025, 1, 1, 1, 1, 1,
-0.316909, 0.9497092, -2.793717, 1, 1, 1, 1, 1,
-0.3149054, -0.7319553, -2.613281, 1, 1, 1, 1, 1,
-0.3120075, 0.3805695, -1.507093, 1, 1, 1, 1, 1,
-0.3099759, 0.4919733, 0.1501586, 1, 1, 1, 1, 1,
-0.3089734, 0.5950181, -0.0006340888, 1, 1, 1, 1, 1,
-0.3078131, 0.316583, -2.551904, 1, 1, 1, 1, 1,
-0.307108, -0.3474705, -2.433103, 1, 1, 1, 1, 1,
-0.3055177, -0.4924754, -2.927921, 1, 1, 1, 1, 1,
-0.301844, -1.994458, -3.633247, 1, 1, 1, 1, 1,
-0.2985436, 1.074801, 0.6967205, 1, 1, 1, 1, 1,
-0.2966901, 0.1350657, -2.515579, 0, 0, 1, 1, 1,
-0.2964081, 0.4377305, -1.135127, 1, 0, 0, 1, 1,
-0.2958622, 0.6891317, 0.356289, 1, 0, 0, 1, 1,
-0.2951719, 0.2522869, -0.564819, 1, 0, 0, 1, 1,
-0.290286, 0.5193545, -1.825251, 1, 0, 0, 1, 1,
-0.2886438, 1.336787, -0.4472004, 1, 0, 0, 1, 1,
-0.2868619, 0.6053007, -1.11986, 0, 0, 0, 1, 1,
-0.2858935, -0.4564527, -2.015002, 0, 0, 0, 1, 1,
-0.2822154, -0.1996122, -2.177119, 0, 0, 0, 1, 1,
-0.2808919, -0.8156232, -1.835632, 0, 0, 0, 1, 1,
-0.2758843, 0.531303, 0.8268053, 0, 0, 0, 1, 1,
-0.2737951, 1.360754, 1.97466, 0, 0, 0, 1, 1,
-0.2654317, 0.2215252, -2.61674, 0, 0, 0, 1, 1,
-0.265209, -1.121163, -2.183757, 1, 1, 1, 1, 1,
-0.2648045, 0.8388813, -0.01313618, 1, 1, 1, 1, 1,
-0.2582898, 0.07659955, -2.85053, 1, 1, 1, 1, 1,
-0.2582408, -1.89504, -3.676042, 1, 1, 1, 1, 1,
-0.2581466, 0.6571581, -0.04349174, 1, 1, 1, 1, 1,
-0.2561215, 0.986339, -0.9573171, 1, 1, 1, 1, 1,
-0.255949, 1.022923, -0.9030347, 1, 1, 1, 1, 1,
-0.2540138, -1.672806, -2.85698, 1, 1, 1, 1, 1,
-0.2514259, -0.2321988, -3.73382, 1, 1, 1, 1, 1,
-0.2496664, 0.5237909, -1.085967, 1, 1, 1, 1, 1,
-0.2441491, 1.048859, -1.168466, 1, 1, 1, 1, 1,
-0.2433002, -2.018762, -3.65686, 1, 1, 1, 1, 1,
-0.242875, -0.5565313, -1.954644, 1, 1, 1, 1, 1,
-0.2369331, 1.266107, 0.6179774, 1, 1, 1, 1, 1,
-0.2358939, 0.5465806, 1.245286, 1, 1, 1, 1, 1,
-0.2351145, -0.07177804, -4.6436, 0, 0, 1, 1, 1,
-0.2224013, -0.8766167, -5.373533, 1, 0, 0, 1, 1,
-0.2215247, 0.4651575, -0.3944458, 1, 0, 0, 1, 1,
-0.2202409, 0.8638667, 0.3523338, 1, 0, 0, 1, 1,
-0.2172124, -0.3978472, -2.816334, 1, 0, 0, 1, 1,
-0.2152035, -0.381754, -2.328383, 1, 0, 0, 1, 1,
-0.2112554, 0.07255516, -0.3643643, 0, 0, 0, 1, 1,
-0.2098351, 0.03439695, -0.001780267, 0, 0, 0, 1, 1,
-0.2086928, -3.111653, -2.4748, 0, 0, 0, 1, 1,
-0.2082485, -0.9198846, -2.479253, 0, 0, 0, 1, 1,
-0.206638, -1.6071, -1.850919, 0, 0, 0, 1, 1,
-0.2063182, 1.824148, -1.025557, 0, 0, 0, 1, 1,
-0.204096, -1.620626, -3.979268, 0, 0, 0, 1, 1,
-0.1995731, -0.6588253, -4.435798, 1, 1, 1, 1, 1,
-0.1953021, 0.8597474, -0.1659566, 1, 1, 1, 1, 1,
-0.1926316, 0.357487, 0.05870295, 1, 1, 1, 1, 1,
-0.1888443, -0.1865755, -2.721851, 1, 1, 1, 1, 1,
-0.1887734, -2.116729, -2.726609, 1, 1, 1, 1, 1,
-0.1857763, 1.113685, -0.1918917, 1, 1, 1, 1, 1,
-0.1755181, -0.569381, -3.07081, 1, 1, 1, 1, 1,
-0.1721714, 0.8146707, 0.5994404, 1, 1, 1, 1, 1,
-0.1711417, -0.8769449, -2.302018, 1, 1, 1, 1, 1,
-0.1710851, -0.3565761, -1.716414, 1, 1, 1, 1, 1,
-0.1612961, -0.6677929, -2.340735, 1, 1, 1, 1, 1,
-0.159892, -0.6672409, -3.455134, 1, 1, 1, 1, 1,
-0.1571378, 0.6745456, -0.3421629, 1, 1, 1, 1, 1,
-0.1522877, 0.8303711, -0.9837609, 1, 1, 1, 1, 1,
-0.1511905, -0.4156897, -3.467877, 1, 1, 1, 1, 1,
-0.1489808, -0.9888942, -3.795205, 0, 0, 1, 1, 1,
-0.1471047, 2.258493, 0.7620419, 1, 0, 0, 1, 1,
-0.1415903, -0.4698242, -2.571244, 1, 0, 0, 1, 1,
-0.1402488, -0.9282424, -2.696642, 1, 0, 0, 1, 1,
-0.1350376, -1.479624, -3.657167, 1, 0, 0, 1, 1,
-0.1345979, -1.125834, -3.647438, 1, 0, 0, 1, 1,
-0.1335375, 0.2252224, 0.8634482, 0, 0, 0, 1, 1,
-0.1329805, 0.3149428, -2.432143, 0, 0, 0, 1, 1,
-0.1275411, -0.3231792, -2.569906, 0, 0, 0, 1, 1,
-0.1258933, 1.174159, -0.5695677, 0, 0, 0, 1, 1,
-0.1218867, -0.01256843, -1.580237, 0, 0, 0, 1, 1,
-0.1195288, 2.183456, 1.415827, 0, 0, 0, 1, 1,
-0.1180586, -1.707546, -2.563931, 0, 0, 0, 1, 1,
-0.1174135, -2.50974, -3.532111, 1, 1, 1, 1, 1,
-0.1047102, 0.4021392, 0.4530977, 1, 1, 1, 1, 1,
-0.1018756, -0.3563427, -3.044616, 1, 1, 1, 1, 1,
-0.1009649, 0.02442223, -1.351952, 1, 1, 1, 1, 1,
-0.09969592, 0.7010264, 0.685724, 1, 1, 1, 1, 1,
-0.09956896, -1.270988, -1.639171, 1, 1, 1, 1, 1,
-0.09634939, -0.4122483, -2.780745, 1, 1, 1, 1, 1,
-0.09064034, 0.3413427, 0.01375628, 1, 1, 1, 1, 1,
-0.08788944, 1.229431, -0.01607299, 1, 1, 1, 1, 1,
-0.0876736, -0.5278206, -3.012778, 1, 1, 1, 1, 1,
-0.08429979, 0.9153256, 0.1741788, 1, 1, 1, 1, 1,
-0.08275682, 1.370744, -1.109589, 1, 1, 1, 1, 1,
-0.07718699, 0.7430926, -1.634997, 1, 1, 1, 1, 1,
-0.07631105, 0.9716554, -0.2758899, 1, 1, 1, 1, 1,
-0.07223192, 1.191184, 1.713691, 1, 1, 1, 1, 1,
-0.07164428, 0.6322346, 1.089289, 0, 0, 1, 1, 1,
-0.06827468, 0.8825647, 0.2775528, 1, 0, 0, 1, 1,
-0.0611193, -0.801253, -5.752937, 1, 0, 0, 1, 1,
-0.06076678, 0.3285756, -1.797831, 1, 0, 0, 1, 1,
-0.05842711, 0.09968118, -1.363462, 1, 0, 0, 1, 1,
-0.05838249, 0.4059906, -0.8211142, 1, 0, 0, 1, 1,
-0.0556839, 0.02684528, 0.2450424, 0, 0, 0, 1, 1,
-0.05451505, 1.942029, -0.8022239, 0, 0, 0, 1, 1,
-0.05354378, 1.775906, -1.360667, 0, 0, 0, 1, 1,
-0.05246655, 0.5814585, 1.839207, 0, 0, 0, 1, 1,
-0.05192025, -0.3883289, -2.775615, 0, 0, 0, 1, 1,
-0.03107646, 0.4870581, -1.865315, 0, 0, 0, 1, 1,
-0.03089988, -1.457479, -2.446289, 0, 0, 0, 1, 1,
-0.0248008, -1.745191, -3.312151, 1, 1, 1, 1, 1,
-0.02412612, 0.3965732, -2.149363, 1, 1, 1, 1, 1,
-0.02166549, -0.4110575, -2.67065, 1, 1, 1, 1, 1,
-0.02015547, -0.1236037, -4.762341, 1, 1, 1, 1, 1,
-0.0199159, -0.6743674, -3.790469, 1, 1, 1, 1, 1,
-0.01678089, 0.8244638, -0.05290526, 1, 1, 1, 1, 1,
-0.0148546, 0.1213333, 0.4267287, 1, 1, 1, 1, 1,
-0.0101978, 0.2467723, 0.441903, 1, 1, 1, 1, 1,
-0.009110824, 0.2518461, -0.9608312, 1, 1, 1, 1, 1,
-0.008579032, 0.03064724, -0.2444565, 1, 1, 1, 1, 1,
-0.008403283, -0.1501901, -3.906239, 1, 1, 1, 1, 1,
-0.004233878, 0.4855601, 0.2763324, 1, 1, 1, 1, 1,
0.002244068, -0.4737312, 4.429479, 1, 1, 1, 1, 1,
0.002404485, -2.155974, 1.939183, 1, 1, 1, 1, 1,
0.009931538, 2.009685, 0.3874272, 1, 1, 1, 1, 1,
0.01100958, 1.61017, -1.387696, 0, 0, 1, 1, 1,
0.01150443, 0.4115214, 1.289361, 1, 0, 0, 1, 1,
0.01810499, 1.173703, -0.2322748, 1, 0, 0, 1, 1,
0.01834414, -0.5639947, 4.382102, 1, 0, 0, 1, 1,
0.02469113, 0.4743402, 0.9679229, 1, 0, 0, 1, 1,
0.02625378, -0.7327812, 2.82128, 1, 0, 0, 1, 1,
0.02671661, 1.243288, -1.101114, 0, 0, 0, 1, 1,
0.02992246, 0.9657924, 0.4416296, 0, 0, 0, 1, 1,
0.03221762, -0.2979436, 2.442872, 0, 0, 0, 1, 1,
0.0344658, -1.130542, 4.278872, 0, 0, 0, 1, 1,
0.03466543, 0.8702176, 0.002572202, 0, 0, 0, 1, 1,
0.03649796, 0.8993692, 0.2237702, 0, 0, 0, 1, 1,
0.03747196, -1.416187, 3.41139, 0, 0, 0, 1, 1,
0.03889284, 0.6436333, 1.173689, 1, 1, 1, 1, 1,
0.04135633, 0.9146881, -0.9341558, 1, 1, 1, 1, 1,
0.0427626, 1.51103, -1.872157, 1, 1, 1, 1, 1,
0.04911911, 0.5767951, -0.0635379, 1, 1, 1, 1, 1,
0.05284226, 0.3720925, -0.6969761, 1, 1, 1, 1, 1,
0.053363, 0.7922674, 2.548205, 1, 1, 1, 1, 1,
0.05657881, 0.5457981, -1.490265, 1, 1, 1, 1, 1,
0.05661154, -1.529493, 3.012449, 1, 1, 1, 1, 1,
0.06353004, -0.8448432, 2.753679, 1, 1, 1, 1, 1,
0.06360027, 0.05053309, 1.989038, 1, 1, 1, 1, 1,
0.06496427, 1.210189, 0.05627263, 1, 1, 1, 1, 1,
0.07143958, -1.108999, 2.173156, 1, 1, 1, 1, 1,
0.07382604, -2.602551, 3.744868, 1, 1, 1, 1, 1,
0.07385296, 1.801715, -1.422339, 1, 1, 1, 1, 1,
0.07458983, -1.70393, 2.520548, 1, 1, 1, 1, 1,
0.07612655, -1.158245, 4.058322, 0, 0, 1, 1, 1,
0.07640605, 1.69496, -0.7915807, 1, 0, 0, 1, 1,
0.07676358, 0.6090724, -0.3226653, 1, 0, 0, 1, 1,
0.07866268, -0.4832063, 1.349536, 1, 0, 0, 1, 1,
0.08667091, 0.5286537, 0.3369216, 1, 0, 0, 1, 1,
0.09554774, -1.106278, 5.167707, 1, 0, 0, 1, 1,
0.09557892, -0.9599131, 3.710609, 0, 0, 0, 1, 1,
0.09745853, -2.046813, 2.53928, 0, 0, 0, 1, 1,
0.1029652, -1.498847, 3.083319, 0, 0, 0, 1, 1,
0.1036964, -1.113613, 4.668888, 0, 0, 0, 1, 1,
0.1038487, -0.1528075, 3.106522, 0, 0, 0, 1, 1,
0.1101211, 0.2706711, 1.506601, 0, 0, 0, 1, 1,
0.1106436, 1.098844, 0.7333102, 0, 0, 0, 1, 1,
0.1129081, -0.8466319, 3.528062, 1, 1, 1, 1, 1,
0.1177295, 0.1860088, 1.089899, 1, 1, 1, 1, 1,
0.1201862, -0.1412226, 2.812681, 1, 1, 1, 1, 1,
0.1234419, 2.558303, 0.1017569, 1, 1, 1, 1, 1,
0.1249819, 1.818408, -2.566931, 1, 1, 1, 1, 1,
0.1261787, -0.2214485, 2.598602, 1, 1, 1, 1, 1,
0.1273079, 1.125821, -0.08756844, 1, 1, 1, 1, 1,
0.1304378, -0.5089383, 4.407244, 1, 1, 1, 1, 1,
0.1324266, 0.4557404, 0.9998047, 1, 1, 1, 1, 1,
0.1374412, 1.512904, 0.667801, 1, 1, 1, 1, 1,
0.142108, 0.5713964, 1.384516, 1, 1, 1, 1, 1,
0.1433546, 0.5489261, -0.2862716, 1, 1, 1, 1, 1,
0.1452274, 1.353483, 0.7590818, 1, 1, 1, 1, 1,
0.1526839, 0.5265142, -0.5319815, 1, 1, 1, 1, 1,
0.1557239, 1.854846, 1.720271, 1, 1, 1, 1, 1,
0.1564128, -0.7159072, 2.044408, 0, 0, 1, 1, 1,
0.1572726, 0.7303782, 0.1961489, 1, 0, 0, 1, 1,
0.1573297, -1.229226, 4.248857, 1, 0, 0, 1, 1,
0.1586237, -0.9273089, 2.431696, 1, 0, 0, 1, 1,
0.1628044, 0.005460476, 0.9165899, 1, 0, 0, 1, 1,
0.1660207, -0.7228844, 0.9442028, 1, 0, 0, 1, 1,
0.1663714, 0.6680435, -1.41612, 0, 0, 0, 1, 1,
0.1688877, -1.30651, 0.2899857, 0, 0, 0, 1, 1,
0.1695471, 0.4761383, -1.086713, 0, 0, 0, 1, 1,
0.1701144, 0.4218591, 1.519404, 0, 0, 0, 1, 1,
0.1727768, -1.043447, 2.712569, 0, 0, 0, 1, 1,
0.1728574, -0.2440064, 3.258759, 0, 0, 0, 1, 1,
0.1783432, -0.2429629, 3.102204, 0, 0, 0, 1, 1,
0.1868752, 0.1656565, 1.598687, 1, 1, 1, 1, 1,
0.1872995, 1.010412, -0.003372134, 1, 1, 1, 1, 1,
0.1898389, 0.1255833, 0.3460265, 1, 1, 1, 1, 1,
0.1904746, 2.461493, 0.02091663, 1, 1, 1, 1, 1,
0.1924952, 2.291211, 0.2136618, 1, 1, 1, 1, 1,
0.1956629, -1.059843, 2.655874, 1, 1, 1, 1, 1,
0.1987709, 0.06853079, 1.111738, 1, 1, 1, 1, 1,
0.1989544, -2.445908, 4.532007, 1, 1, 1, 1, 1,
0.2113828, 0.8754365, -1.019474, 1, 1, 1, 1, 1,
0.2188103, -0.5580859, 3.733709, 1, 1, 1, 1, 1,
0.2212831, -0.7478481, 3.468591, 1, 1, 1, 1, 1,
0.2215577, -0.959163, 1.395908, 1, 1, 1, 1, 1,
0.2216516, 0.4412547, 0.1798776, 1, 1, 1, 1, 1,
0.2229945, -0.4985003, 2.887693, 1, 1, 1, 1, 1,
0.2237589, -0.5835536, 1.729751, 1, 1, 1, 1, 1,
0.2324974, 0.5949061, 0.6631334, 0, 0, 1, 1, 1,
0.2333128, 0.7592116, -1.959932, 1, 0, 0, 1, 1,
0.2338483, 0.8081194, -0.09533952, 1, 0, 0, 1, 1,
0.2345113, -0.4849532, 1.981366, 1, 0, 0, 1, 1,
0.2363317, 1.880262, 0.7356905, 1, 0, 0, 1, 1,
0.236594, 0.6412979, 1.747312, 1, 0, 0, 1, 1,
0.2379583, 0.01925775, -1.685883, 0, 0, 0, 1, 1,
0.2382807, 0.932417, -0.4461735, 0, 0, 0, 1, 1,
0.2384917, 1.288214, 2.282968, 0, 0, 0, 1, 1,
0.2421712, 0.7081913, 0.3752204, 0, 0, 0, 1, 1,
0.2426016, 1.078381, -0.2108771, 0, 0, 0, 1, 1,
0.2433585, 0.7145212, 1.585797, 0, 0, 0, 1, 1,
0.2470871, -0.9648274, 1.473895, 0, 0, 0, 1, 1,
0.2514714, 0.9073129, 1.608137, 1, 1, 1, 1, 1,
0.2549402, -1.01444, 3.151925, 1, 1, 1, 1, 1,
0.2646864, -1.431914, 2.179606, 1, 1, 1, 1, 1,
0.266039, -1.850864, 3.256771, 1, 1, 1, 1, 1,
0.2672313, 0.1562261, 0.03953863, 1, 1, 1, 1, 1,
0.2679348, 0.9478478, -0.4075384, 1, 1, 1, 1, 1,
0.2704482, 2.042804, 0.1498561, 1, 1, 1, 1, 1,
0.2717564, 0.4652312, 1.258773, 1, 1, 1, 1, 1,
0.28658, -0.3133318, 2.403389, 1, 1, 1, 1, 1,
0.2870465, -0.5096002, 3.429834, 1, 1, 1, 1, 1,
0.2872221, 1.364662, -1.527919, 1, 1, 1, 1, 1,
0.2948127, 0.1163994, 0.2740749, 1, 1, 1, 1, 1,
0.2952176, -0.4450961, 1.537298, 1, 1, 1, 1, 1,
0.2958378, 0.2834568, 2.84795, 1, 1, 1, 1, 1,
0.2966179, -0.3967712, 2.143733, 1, 1, 1, 1, 1,
0.3007358, -0.5841199, 3.046086, 0, 0, 1, 1, 1,
0.3035601, 0.8184154, 1.982699, 1, 0, 0, 1, 1,
0.3074272, 1.065179, 2.370135, 1, 0, 0, 1, 1,
0.3148202, 0.8584701, -0.4690942, 1, 0, 0, 1, 1,
0.31688, -0.009185915, 2.629568, 1, 0, 0, 1, 1,
0.3300906, -1.000577, 3.589466, 1, 0, 0, 1, 1,
0.3304851, -0.1908954, 4.278603, 0, 0, 0, 1, 1,
0.3339612, 0.4571414, -0.4087078, 0, 0, 0, 1, 1,
0.338216, 0.9073136, -0.05299896, 0, 0, 0, 1, 1,
0.3393776, -0.2883474, 2.417118, 0, 0, 0, 1, 1,
0.3462512, -0.5368423, 1.886693, 0, 0, 0, 1, 1,
0.3514748, 0.9087901, 0.2315532, 0, 0, 0, 1, 1,
0.3559684, -0.4784415, 1.293617, 0, 0, 0, 1, 1,
0.3566609, -1.014946, 3.361267, 1, 1, 1, 1, 1,
0.3570769, -1.1097, 4.555684, 1, 1, 1, 1, 1,
0.3581684, 0.2655483, 2.259151, 1, 1, 1, 1, 1,
0.3584465, 0.5233234, 0.3679764, 1, 1, 1, 1, 1,
0.362581, -0.3826203, 2.886569, 1, 1, 1, 1, 1,
0.3640179, -0.06489243, 1.847349, 1, 1, 1, 1, 1,
0.3648725, 2.623829, -0.9312408, 1, 1, 1, 1, 1,
0.3667687, -1.035554, 4.137741, 1, 1, 1, 1, 1,
0.3708688, 0.530159, 0.8681874, 1, 1, 1, 1, 1,
0.3880398, 1.174903, -0.1756016, 1, 1, 1, 1, 1,
0.3903064, 0.5980456, 0.980691, 1, 1, 1, 1, 1,
0.3903516, 0.4774606, -0.9465027, 1, 1, 1, 1, 1,
0.3922308, 0.5778996, 1.34141, 1, 1, 1, 1, 1,
0.3958748, -0.5228488, 3.068129, 1, 1, 1, 1, 1,
0.4013135, -0.3946951, 1.826424, 1, 1, 1, 1, 1,
0.4020797, 0.8375745, 2.126677, 0, 0, 1, 1, 1,
0.4039588, 0.3479114, 0.04814701, 1, 0, 0, 1, 1,
0.4054647, -0.9581509, 1.880807, 1, 0, 0, 1, 1,
0.4062178, -1.733787, 1.476545, 1, 0, 0, 1, 1,
0.4098456, 1.193761, -0.7352917, 1, 0, 0, 1, 1,
0.4098698, 0.6484095, -0.3725009, 1, 0, 0, 1, 1,
0.4107338, -1.393744, 3.513501, 0, 0, 0, 1, 1,
0.4134866, 0.6099985, 1.657957, 0, 0, 0, 1, 1,
0.4142341, 0.4976906, 1.199783, 0, 0, 0, 1, 1,
0.415502, 0.3342932, 0.3146901, 0, 0, 0, 1, 1,
0.4165157, -0.7293479, 3.417411, 0, 0, 0, 1, 1,
0.4175295, -0.02556737, 2.982727, 0, 0, 0, 1, 1,
0.4296919, -0.3472034, 3.238752, 0, 0, 0, 1, 1,
0.4305735, 0.7578146, 0.07286613, 1, 1, 1, 1, 1,
0.432713, -0.6650375, 3.396695, 1, 1, 1, 1, 1,
0.4328676, 0.08358083, 1.564125, 1, 1, 1, 1, 1,
0.4343202, 0.418803, 0.2930238, 1, 1, 1, 1, 1,
0.4361422, 1.509066, -0.2378261, 1, 1, 1, 1, 1,
0.4391183, -2.489896, 2.32433, 1, 1, 1, 1, 1,
0.4395604, 0.5791606, 1.559798, 1, 1, 1, 1, 1,
0.4428807, -1.068256, 3.054903, 1, 1, 1, 1, 1,
0.4507749, 2.034577, 0.6489977, 1, 1, 1, 1, 1,
0.4557377, 0.4514264, 0.5377731, 1, 1, 1, 1, 1,
0.4576077, 2.13543, 0.6752927, 1, 1, 1, 1, 1,
0.4593805, 0.5112181, 0.1839611, 1, 1, 1, 1, 1,
0.4630899, 1.726708, -0.6873422, 1, 1, 1, 1, 1,
0.465484, 0.7370986, 0.05945565, 1, 1, 1, 1, 1,
0.4681951, 1.238085, -0.2032565, 1, 1, 1, 1, 1,
0.469, 1.166374, 2.332509, 0, 0, 1, 1, 1,
0.469256, 0.3309646, -0.2549202, 1, 0, 0, 1, 1,
0.4715295, -1.219977, 3.960577, 1, 0, 0, 1, 1,
0.4717483, 0.2522426, 1.283979, 1, 0, 0, 1, 1,
0.4727168, -1.173493, 3.554175, 1, 0, 0, 1, 1,
0.4728913, 0.3960936, -0.634636, 1, 0, 0, 1, 1,
0.4784526, -0.9113984, 4.019696, 0, 0, 0, 1, 1,
0.4795875, 0.7284289, 0.9711206, 0, 0, 0, 1, 1,
0.4798323, -1.414272, 3.023021, 0, 0, 0, 1, 1,
0.4861925, -1.419746, 3.912297, 0, 0, 0, 1, 1,
0.49041, -0.4753638, 2.992115, 0, 0, 0, 1, 1,
0.4967833, -0.1182489, 1.850387, 0, 0, 0, 1, 1,
0.5011407, 0.5138747, -0.9607189, 0, 0, 0, 1, 1,
0.5044155, 0.9214259, -0.349866, 1, 1, 1, 1, 1,
0.5131059, -2.075595, 4.431387, 1, 1, 1, 1, 1,
0.5136743, -1.048469, 3.892164, 1, 1, 1, 1, 1,
0.5143316, 1.588192, -0.2688074, 1, 1, 1, 1, 1,
0.5148802, 0.580317, 1.219365, 1, 1, 1, 1, 1,
0.5160805, -0.3634576, 2.72562, 1, 1, 1, 1, 1,
0.5167688, 1.519785, 0.9619143, 1, 1, 1, 1, 1,
0.5226377, 0.5754457, 2.036276, 1, 1, 1, 1, 1,
0.5226915, 0.2472731, -1.147524, 1, 1, 1, 1, 1,
0.5244493, -0.9428788, 2.390175, 1, 1, 1, 1, 1,
0.5261412, -0.05043946, 0.7854258, 1, 1, 1, 1, 1,
0.5262535, 0.624863, 1.966155, 1, 1, 1, 1, 1,
0.5268494, -0.5774102, 2.63669, 1, 1, 1, 1, 1,
0.5276873, 1.718925, -2.180259, 1, 1, 1, 1, 1,
0.5393106, -1.426943, 4.669472, 1, 1, 1, 1, 1,
0.5405335, 0.1068145, 0.9344429, 0, 0, 1, 1, 1,
0.5430866, -1.586918, 2.916656, 1, 0, 0, 1, 1,
0.5509679, 1.026957, 0.8944402, 1, 0, 0, 1, 1,
0.5550481, -0.2073887, 0.9378491, 1, 0, 0, 1, 1,
0.5562524, -1.579044, 3.808817, 1, 0, 0, 1, 1,
0.5579218, 0.06242275, 0.564409, 1, 0, 0, 1, 1,
0.5597078, -1.270915, 2.810636, 0, 0, 0, 1, 1,
0.5625159, 1.293894, 0.1760887, 0, 0, 0, 1, 1,
0.5660704, -2.687464, 3.480435, 0, 0, 0, 1, 1,
0.567727, 0.7572062, -0.4042403, 0, 0, 0, 1, 1,
0.5680404, 0.6403151, 0.5964313, 0, 0, 0, 1, 1,
0.569235, -0.9241816, 3.82342, 0, 0, 0, 1, 1,
0.5712658, 0.1574065, 1.397538, 0, 0, 0, 1, 1,
0.5724172, 0.2865973, 1.462563, 1, 1, 1, 1, 1,
0.573532, 0.5421772, 0.1672247, 1, 1, 1, 1, 1,
0.5795569, -0.2610732, 1.60183, 1, 1, 1, 1, 1,
0.5812346, 0.06885202, 2.15204, 1, 1, 1, 1, 1,
0.584174, 0.2888606, 1.191807, 1, 1, 1, 1, 1,
0.5865107, 0.05863852, 0.7776366, 1, 1, 1, 1, 1,
0.5922797, 0.823575, 0.5148479, 1, 1, 1, 1, 1,
0.5940188, 0.04152559, 1.618755, 1, 1, 1, 1, 1,
0.5991153, -1.852167, 2.532337, 1, 1, 1, 1, 1,
0.6038651, 1.125039, -0.4674216, 1, 1, 1, 1, 1,
0.6040049, -1.372893, 3.916661, 1, 1, 1, 1, 1,
0.6091177, -1.364407, 3.247987, 1, 1, 1, 1, 1,
0.6116989, 0.730683, 2.666081, 1, 1, 1, 1, 1,
0.6129017, -1.376425, 2.379042, 1, 1, 1, 1, 1,
0.6166466, -1.778803, -0.01489733, 1, 1, 1, 1, 1,
0.6224872, -1.438384, 2.180206, 0, 0, 1, 1, 1,
0.6231105, -0.6623765, 1.640257, 1, 0, 0, 1, 1,
0.6243979, 0.6469565, 0.2362059, 1, 0, 0, 1, 1,
0.6357329, -1.055119, 2.155005, 1, 0, 0, 1, 1,
0.636761, -0.1210707, 1.686867, 1, 0, 0, 1, 1,
0.6418169, 0.3577692, -0.247513, 1, 0, 0, 1, 1,
0.6450535, 2.328841, -0.935852, 0, 0, 0, 1, 1,
0.6466643, 1.771075, -0.08630484, 0, 0, 0, 1, 1,
0.6504248, 0.1557519, 2.669307, 0, 0, 0, 1, 1,
0.6512584, 0.7152001, -0.08715395, 0, 0, 0, 1, 1,
0.6552938, 3.585611, 2.139828, 0, 0, 0, 1, 1,
0.6598353, -0.4368294, 1.853315, 0, 0, 0, 1, 1,
0.6661267, -0.172592, 3.270851, 0, 0, 0, 1, 1,
0.6703698, -0.5319567, 2.237798, 1, 1, 1, 1, 1,
0.6768659, 2.273669, 1.161528, 1, 1, 1, 1, 1,
0.6793283, -0.9637951, 2.644333, 1, 1, 1, 1, 1,
0.6796116, 2.414776, 0.6998923, 1, 1, 1, 1, 1,
0.6815957, 0.01385691, 0.5850576, 1, 1, 1, 1, 1,
0.6838144, -0.8010777, 2.26388, 1, 1, 1, 1, 1,
0.6910642, -1.117372, 1.670592, 1, 1, 1, 1, 1,
0.6999621, 0.04721754, 1.524961, 1, 1, 1, 1, 1,
0.7009858, 0.2998986, 0.8549116, 1, 1, 1, 1, 1,
0.702108, -0.7903928, 1.506137, 1, 1, 1, 1, 1,
0.7062723, -1.988517, 1.638921, 1, 1, 1, 1, 1,
0.7084962, -0.395884, 0.2554533, 1, 1, 1, 1, 1,
0.7085134, 0.07060495, 1.235313, 1, 1, 1, 1, 1,
0.7127735, 1.292227, -0.005811013, 1, 1, 1, 1, 1,
0.7152574, 0.7667062, 2.188293, 1, 1, 1, 1, 1,
0.7166373, -0.7226984, 2.672994, 0, 0, 1, 1, 1,
0.7192242, -0.2320646, 0.6614015, 1, 0, 0, 1, 1,
0.720841, -1.241145, 2.218729, 1, 0, 0, 1, 1,
0.7245423, -0.002405501, 1.2637, 1, 0, 0, 1, 1,
0.7313756, 0.7756462, 0.5390374, 1, 0, 0, 1, 1,
0.7326264, 0.751592, 2.011338, 1, 0, 0, 1, 1,
0.7328544, -0.2207347, 1.179909, 0, 0, 0, 1, 1,
0.7331996, 0.953506, 0.881652, 0, 0, 0, 1, 1,
0.7370108, -0.676618, 1.925652, 0, 0, 0, 1, 1,
0.7472921, -0.1979505, 3.690475, 0, 0, 0, 1, 1,
0.7507181, 0.09695967, 1.907629, 0, 0, 0, 1, 1,
0.7560149, 0.9889877, 0.7827802, 0, 0, 0, 1, 1,
0.7573655, -0.9004188, 2.408188, 0, 0, 0, 1, 1,
0.758532, -0.6632734, 2.239103, 1, 1, 1, 1, 1,
0.7623851, -2.198479, 3.816691, 1, 1, 1, 1, 1,
0.765685, 0.3820205, 0.3446147, 1, 1, 1, 1, 1,
0.7657607, -1.546387, 2.625023, 1, 1, 1, 1, 1,
0.7711771, 0.6032324, 1.185697, 1, 1, 1, 1, 1,
0.7902321, 0.2569699, 3.439483, 1, 1, 1, 1, 1,
0.804541, 1.499404, -0.770062, 1, 1, 1, 1, 1,
0.8086691, 0.2498736, 0.9252868, 1, 1, 1, 1, 1,
0.8107843, 0.9921102, 1.615373, 1, 1, 1, 1, 1,
0.8133647, 0.08298419, 0.2375873, 1, 1, 1, 1, 1,
0.8144309, -0.3417532, 2.288956, 1, 1, 1, 1, 1,
0.8148659, -1.681991, 1.894817, 1, 1, 1, 1, 1,
0.8187302, 0.7407123, 1.618987, 1, 1, 1, 1, 1,
0.8198971, 0.2498048, 0.4488489, 1, 1, 1, 1, 1,
0.8205726, -1.37672, 1.956703, 1, 1, 1, 1, 1,
0.8239045, 0.5387041, 1.748158, 0, 0, 1, 1, 1,
0.8242653, 0.9464836, -0.1081935, 1, 0, 0, 1, 1,
0.8242963, -1.699314, 2.919336, 1, 0, 0, 1, 1,
0.8306758, 0.5691063, 0.5473873, 1, 0, 0, 1, 1,
0.8527274, 0.665134, 0.7502168, 1, 0, 0, 1, 1,
0.8617088, 0.8882216, 0.8809626, 1, 0, 0, 1, 1,
0.8645905, 0.4730784, 0.8478361, 0, 0, 0, 1, 1,
0.8648975, 0.339454, 2.412731, 0, 0, 0, 1, 1,
0.8739899, 0.4488662, 0.6489894, 0, 0, 0, 1, 1,
0.8804094, -0.106626, 1.334664, 0, 0, 0, 1, 1,
0.8828417, -0.7754304, 3.254676, 0, 0, 0, 1, 1,
0.8896789, 0.769411, 1.7623, 0, 0, 0, 1, 1,
0.8904971, 0.2742387, 0.1687578, 0, 0, 0, 1, 1,
0.8925582, -0.3686885, 0.4275539, 1, 1, 1, 1, 1,
0.8934472, -0.981839, 1.571408, 1, 1, 1, 1, 1,
0.8938214, -0.4178761, 1.237216, 1, 1, 1, 1, 1,
0.8942034, 1.382631, 0.4426198, 1, 1, 1, 1, 1,
0.8949483, -1.807702, 1.892054, 1, 1, 1, 1, 1,
0.8959345, 0.9309584, 1.486385, 1, 1, 1, 1, 1,
0.8970701, 1.329341, 0.6465037, 1, 1, 1, 1, 1,
0.8976926, -0.8839866, 4.218061, 1, 1, 1, 1, 1,
0.9032894, 2.392754, 0.8165125, 1, 1, 1, 1, 1,
0.9061227, 0.4488726, 0.9788067, 1, 1, 1, 1, 1,
0.9161642, 0.4898463, 1.651419, 1, 1, 1, 1, 1,
0.9198184, -0.3701087, 1.244064, 1, 1, 1, 1, 1,
0.9218554, 0.2661397, 0.7569647, 1, 1, 1, 1, 1,
0.9273047, -0.9922583, 1.660314, 1, 1, 1, 1, 1,
0.9308736, 0.3580651, 2.5262, 1, 1, 1, 1, 1,
0.9339736, -0.8681489, 2.984716, 0, 0, 1, 1, 1,
0.9528452, -2.128114, 1.831653, 1, 0, 0, 1, 1,
0.9532186, -0.9707183, 3.160799, 1, 0, 0, 1, 1,
0.9593, 0.2019803, -0.03632786, 1, 0, 0, 1, 1,
0.9628648, -0.6884571, 0.186109, 1, 0, 0, 1, 1,
0.9630345, 0.2676768, -0.3690484, 1, 0, 0, 1, 1,
0.9657124, -0.3455784, 2.339705, 0, 0, 0, 1, 1,
0.9699393, 0.6796284, 1.546422, 0, 0, 0, 1, 1,
0.9703482, -0.2837348, 1.921418, 0, 0, 0, 1, 1,
0.9711526, 1.388473, 1.751583, 0, 0, 0, 1, 1,
0.976454, 1.052433, -1.285872, 0, 0, 0, 1, 1,
0.9787552, -1.794217, 1.824669, 0, 0, 0, 1, 1,
0.994541, -1.054476, 3.937327, 0, 0, 0, 1, 1,
0.9963288, -0.8572844, 0.05635848, 1, 1, 1, 1, 1,
1.00071, 0.7684842, 1.992117, 1, 1, 1, 1, 1,
1.003782, 0.4868331, 0.8453318, 1, 1, 1, 1, 1,
1.005794, 0.836722, -0.05421413, 1, 1, 1, 1, 1,
1.008013, -1.103502, 2.503139, 1, 1, 1, 1, 1,
1.009896, -0.9580167, 1.654863, 1, 1, 1, 1, 1,
1.018633, 1.314617, -0.02653005, 1, 1, 1, 1, 1,
1.019812, 1.375966, -0.2446181, 1, 1, 1, 1, 1,
1.0216, 1.017764, 1.246942, 1, 1, 1, 1, 1,
1.021739, 0.3935438, 2.071635, 1, 1, 1, 1, 1,
1.022284, 0.3532718, 0.5114887, 1, 1, 1, 1, 1,
1.024151, -1.59282, 3.052671, 1, 1, 1, 1, 1,
1.025119, 0.9709327, 0.6193784, 1, 1, 1, 1, 1,
1.029021, -0.09798458, 2.339245, 1, 1, 1, 1, 1,
1.0292, -0.1666793, 1.286397, 1, 1, 1, 1, 1,
1.046719, -0.904754, 2.890943, 0, 0, 1, 1, 1,
1.05043, 1.740954, 1.362583, 1, 0, 0, 1, 1,
1.054467, -0.1507099, 0.6317737, 1, 0, 0, 1, 1,
1.055503, -0.2912265, 1.878271, 1, 0, 0, 1, 1,
1.059802, 2.226093, 0.552693, 1, 0, 0, 1, 1,
1.063863, -0.5024743, 2.308352, 1, 0, 0, 1, 1,
1.068339, 0.2678694, 0.4673283, 0, 0, 0, 1, 1,
1.070629, -0.770197, 2.159324, 0, 0, 0, 1, 1,
1.075109, -1.14133, 2.297081, 0, 0, 0, 1, 1,
1.07963, 1.425287, 0.9110813, 0, 0, 0, 1, 1,
1.082161, 0.5555363, 0.8510908, 0, 0, 0, 1, 1,
1.087213, 0.4264458, 0.7322081, 0, 0, 0, 1, 1,
1.103097, 0.07180151, 2.635772, 0, 0, 0, 1, 1,
1.103253, -0.7529705, 2.850806, 1, 1, 1, 1, 1,
1.104204, -1.012445, 3.190403, 1, 1, 1, 1, 1,
1.107929, 0.841294, 1.237355, 1, 1, 1, 1, 1,
1.109539, -0.2027778, 0.3248533, 1, 1, 1, 1, 1,
1.110034, 1.1368, 0.03329941, 1, 1, 1, 1, 1,
1.126378, -0.7030085, 2.28462, 1, 1, 1, 1, 1,
1.136436, 0.05962848, 0.4311507, 1, 1, 1, 1, 1,
1.137478, 0.8563711, 2.559074, 1, 1, 1, 1, 1,
1.154687, 1.011197, -0.9311042, 1, 1, 1, 1, 1,
1.169517, -0.6794233, 2.95512, 1, 1, 1, 1, 1,
1.175694, 1.452636, -0.6344085, 1, 1, 1, 1, 1,
1.176411, -0.3348011, 1.630749, 1, 1, 1, 1, 1,
1.183331, 0.2923311, 2.160765, 1, 1, 1, 1, 1,
1.185324, 0.1576758, 1.913055, 1, 1, 1, 1, 1,
1.186665, -0.04787553, 2.288051, 1, 1, 1, 1, 1,
1.193205, -1.085368, 2.528215, 0, 0, 1, 1, 1,
1.197381, -0.862792, 2.161294, 1, 0, 0, 1, 1,
1.197543, -1.88407, 0.8163162, 1, 0, 0, 1, 1,
1.197642, -0.104039, 1.576477, 1, 0, 0, 1, 1,
1.199133, -0.03482081, 1.160096, 1, 0, 0, 1, 1,
1.200467, -0.01442076, 2.017469, 1, 0, 0, 1, 1,
1.203868, -0.2663824, 1.263434, 0, 0, 0, 1, 1,
1.216141, 0.5988229, 0.2507252, 0, 0, 0, 1, 1,
1.218044, -0.6139676, 1.048384, 0, 0, 0, 1, 1,
1.222032, -0.5254942, 2.874924, 0, 0, 0, 1, 1,
1.234888, 1.623269, 0.2937854, 0, 0, 0, 1, 1,
1.237301, -0.246367, 3.749218, 0, 0, 0, 1, 1,
1.237763, 0.1922824, 0.7915146, 0, 0, 0, 1, 1,
1.256409, -0.9550444, 3.003144, 1, 1, 1, 1, 1,
1.258193, -0.6814918, 1.340454, 1, 1, 1, 1, 1,
1.263919, -0.8083046, 1.774912, 1, 1, 1, 1, 1,
1.265597, -0.4023355, 3.630056, 1, 1, 1, 1, 1,
1.273693, 0.2036089, 2.896104, 1, 1, 1, 1, 1,
1.274592, -0.03281634, 1.752991, 1, 1, 1, 1, 1,
1.28194, 0.8776176, 1.321995, 1, 1, 1, 1, 1,
1.28424, 0.6687689, 1.072022, 1, 1, 1, 1, 1,
1.297334, -1.14684, 3.013708, 1, 1, 1, 1, 1,
1.299481, 1.301941, -0.07494909, 1, 1, 1, 1, 1,
1.302494, 1.248294, 0.9134321, 1, 1, 1, 1, 1,
1.31509, -0.4847032, 1.130561, 1, 1, 1, 1, 1,
1.322179, -1.390479, 2.335923, 1, 1, 1, 1, 1,
1.324938, -1.618323, 2.584046, 1, 1, 1, 1, 1,
1.327145, 0.5362582, 1.716436, 1, 1, 1, 1, 1,
1.327254, -1.895518, 1.336724, 0, 0, 1, 1, 1,
1.327698, -1.113212, 2.634492, 1, 0, 0, 1, 1,
1.328676, 0.5798073, 0.7885752, 1, 0, 0, 1, 1,
1.333909, 1.786802, -0.08915741, 1, 0, 0, 1, 1,
1.340789, 1.671308, 0.8704908, 1, 0, 0, 1, 1,
1.342529, -1.094849, 3.199939, 1, 0, 0, 1, 1,
1.347363, 0.1216551, -0.7734478, 0, 0, 0, 1, 1,
1.350769, -1.421129, 0.5161507, 0, 0, 0, 1, 1,
1.359451, -0.6740161, 3.963578, 0, 0, 0, 1, 1,
1.370141, -0.6511832, 2.056594, 0, 0, 0, 1, 1,
1.382366, 1.30248, -0.02715623, 0, 0, 0, 1, 1,
1.390498, 1.345844, 0.3976938, 0, 0, 0, 1, 1,
1.4093, -0.5223316, 1.740708, 0, 0, 0, 1, 1,
1.42386, -0.9406455, 1.130486, 1, 1, 1, 1, 1,
1.42485, 0.2777726, -1.134235, 1, 1, 1, 1, 1,
1.426825, -1.602351, 1.96016, 1, 1, 1, 1, 1,
1.427675, 3.628353, -0.3733571, 1, 1, 1, 1, 1,
1.428256, 1.444512, 1.689383, 1, 1, 1, 1, 1,
1.438586, 0.8477607, 0.8290435, 1, 1, 1, 1, 1,
1.440984, -0.3764126, 3.877303, 1, 1, 1, 1, 1,
1.460408, 0.9031102, 1.164133, 1, 1, 1, 1, 1,
1.466066, 2.318443, 0.5720185, 1, 1, 1, 1, 1,
1.470968, 1.227978, 2.06184, 1, 1, 1, 1, 1,
1.480155, 0.7373912, -1.068114, 1, 1, 1, 1, 1,
1.488698, 1.30465, 0.4827895, 1, 1, 1, 1, 1,
1.499693, 0.8029479, -0.1891982, 1, 1, 1, 1, 1,
1.500722, 1.044739, 0.5678076, 1, 1, 1, 1, 1,
1.506357, 1.702832, 2.476881, 1, 1, 1, 1, 1,
1.506958, -1.16809, 1.076076, 0, 0, 1, 1, 1,
1.507599, 0.8922924, 1.683059, 1, 0, 0, 1, 1,
1.515478, -1.421182, 2.123963, 1, 0, 0, 1, 1,
1.515974, -0.7003794, 2.323815, 1, 0, 0, 1, 1,
1.518158, -1.042443, 1.359219, 1, 0, 0, 1, 1,
1.518879, 1.402915, 1.588552, 1, 0, 0, 1, 1,
1.535557, -3.835232, 3.425131, 0, 0, 0, 1, 1,
1.542192, -0.3572211, 3.278384, 0, 0, 0, 1, 1,
1.553223, 0.1300435, 1.428748, 0, 0, 0, 1, 1,
1.557114, -1.625258, 2.102503, 0, 0, 0, 1, 1,
1.560789, 1.067464, 0.1899556, 0, 0, 0, 1, 1,
1.569336, 1.932178, -0.5295859, 0, 0, 0, 1, 1,
1.570176, 0.1748108, 3.124519, 0, 0, 0, 1, 1,
1.585938, -0.4600327, 2.247349, 1, 1, 1, 1, 1,
1.5879, 0.7725744, 1.535924, 1, 1, 1, 1, 1,
1.588961, 0.7243135, 1.011255, 1, 1, 1, 1, 1,
1.59959, 0.4332991, 1.159912, 1, 1, 1, 1, 1,
1.608543, -0.4376497, 1.171648, 1, 1, 1, 1, 1,
1.61896, 0.6310118, 1.79113, 1, 1, 1, 1, 1,
1.621643, -0.7342296, 1.862359, 1, 1, 1, 1, 1,
1.623756, 0.3417548, 3.207654, 1, 1, 1, 1, 1,
1.640773, -0.9492868, 3.166447, 1, 1, 1, 1, 1,
1.641947, -1.196737, 3.079326, 1, 1, 1, 1, 1,
1.656132, -0.5639408, 1.761343, 1, 1, 1, 1, 1,
1.666963, 1.193157, -0.3313908, 1, 1, 1, 1, 1,
1.670234, -1.549881, 1.237184, 1, 1, 1, 1, 1,
1.697634, -1.46664, 1.336751, 1, 1, 1, 1, 1,
1.704439, -0.07009794, 2.33651, 1, 1, 1, 1, 1,
1.709579, -0.1417044, 1.986046, 0, 0, 1, 1, 1,
1.714234, -0.3958913, 3.070123, 1, 0, 0, 1, 1,
1.728976, -1.094611, 2.257827, 1, 0, 0, 1, 1,
1.730968, -0.1526868, 1.462443, 1, 0, 0, 1, 1,
1.740715, -0.05820046, 2.426329, 1, 0, 0, 1, 1,
1.749611, 0.5576628, 0.9794229, 1, 0, 0, 1, 1,
1.751041, -1.577292, 2.082615, 0, 0, 0, 1, 1,
1.753202, 1.256856, 1.076749, 0, 0, 0, 1, 1,
1.763747, -0.5126873, 0.3732221, 0, 0, 0, 1, 1,
1.782869, -1.251015, 1.933656, 0, 0, 0, 1, 1,
1.787271, 1.481589, 1.816207, 0, 0, 0, 1, 1,
1.812322, 0.6976148, 0.3337591, 0, 0, 0, 1, 1,
1.830705, -0.02755486, 1.69885, 0, 0, 0, 1, 1,
1.859078, -0.1479038, 0.1879828, 1, 1, 1, 1, 1,
1.888787, -0.5115066, 1.601531, 1, 1, 1, 1, 1,
1.892218, -1.866423, 0.5743248, 1, 1, 1, 1, 1,
1.895173, -1.423438, 2.640102, 1, 1, 1, 1, 1,
1.900861, -1.139556, 1.467421, 1, 1, 1, 1, 1,
1.91729, -0.2971775, 2.092814, 1, 1, 1, 1, 1,
1.94325, 0.5426767, 0.7112313, 1, 1, 1, 1, 1,
1.947421, 0.82658, 1.371648, 1, 1, 1, 1, 1,
1.949901, -0.0442346, 1.936535, 1, 1, 1, 1, 1,
1.981982, -1.142042, 2.526264, 1, 1, 1, 1, 1,
1.986121, 0.6361693, 0.3208955, 1, 1, 1, 1, 1,
2.003158, 1.043593, 0.01144692, 1, 1, 1, 1, 1,
2.012631, 0.7635003, 0.6161081, 1, 1, 1, 1, 1,
2.072256, 0.2025167, 0.607226, 1, 1, 1, 1, 1,
2.075603, 0.881063, 1.266367, 1, 1, 1, 1, 1,
2.08968, 0.02423494, 0.7771755, 0, 0, 1, 1, 1,
2.182445, 0.5457419, 2.086952, 1, 0, 0, 1, 1,
2.188738, -0.9196354, 3.067958, 1, 0, 0, 1, 1,
2.196503, 0.445012, -0.7004341, 1, 0, 0, 1, 1,
2.20791, 1.110143, -0.1438788, 1, 0, 0, 1, 1,
2.208169, -1.691637, 2.702899, 1, 0, 0, 1, 1,
2.210308, -0.222186, 1.116123, 0, 0, 0, 1, 1,
2.228662, 1.430528, 0.0516323, 0, 0, 0, 1, 1,
2.230704, 1.420183, 0.919258, 0, 0, 0, 1, 1,
2.248409, -0.4083291, 0.7579012, 0, 0, 0, 1, 1,
2.317109, -0.3695555, 0.9668384, 0, 0, 0, 1, 1,
2.360025, -0.6610312, 2.233282, 0, 0, 0, 1, 1,
2.456346, 0.08005797, 0.05370467, 0, 0, 0, 1, 1,
2.477308, 1.598918, 0.3736568, 1, 1, 1, 1, 1,
2.494337, -0.08729494, 0.8235633, 1, 1, 1, 1, 1,
2.516731, 0.1563284, 1.564481, 1, 1, 1, 1, 1,
2.751751, 1.831154, 1.484349, 1, 1, 1, 1, 1,
2.842954, 1.564138, 0.8652538, 1, 1, 1, 1, 1,
2.84627, 1.756115, 1.072648, 1, 1, 1, 1, 1,
2.869751, 0.4801258, 1.596643, 1, 1, 1, 1, 1
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
var radius = 9.89705;
var distance = 34.76297;
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
mvMatrix.translate( 0.2322136, 0.1034396, 0.2926147 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76297);
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