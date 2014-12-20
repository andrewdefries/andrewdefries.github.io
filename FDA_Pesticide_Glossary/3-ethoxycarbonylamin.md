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
-3.414517, 0.3055808, -1.470865, 1, 0, 0, 1,
-3.16787, -0.1824722, -2.408301, 1, 0.007843138, 0, 1,
-2.897698, 0.05813023, -1.398407, 1, 0.01176471, 0, 1,
-2.736215, 0.5172873, -0.7271051, 1, 0.01960784, 0, 1,
-2.662726, 1.962398, -1.422592, 1, 0.02352941, 0, 1,
-2.61721, -0.1663973, 0.004519034, 1, 0.03137255, 0, 1,
-2.352844, 0.1196715, -1.741547, 1, 0.03529412, 0, 1,
-2.221687, -2.877447, -3.175789, 1, 0.04313726, 0, 1,
-2.217743, -0.09498824, -1.647612, 1, 0.04705882, 0, 1,
-2.199175, 1.669581, 0.4895246, 1, 0.05490196, 0, 1,
-2.140654, 2.178705, 0.2371932, 1, 0.05882353, 0, 1,
-2.099358, 1.028534, -0.6538675, 1, 0.06666667, 0, 1,
-2.092253, 0.814034, -2.16085, 1, 0.07058824, 0, 1,
-2.062867, 0.3282418, -1.488487, 1, 0.07843138, 0, 1,
-2.042641, -1.915164, -0.8720271, 1, 0.08235294, 0, 1,
-2.008169, -0.9817011, -2.712327, 1, 0.09019608, 0, 1,
-1.979214, 2.331876, -1.585199, 1, 0.09411765, 0, 1,
-1.978988, -0.7296655, -1.902416, 1, 0.1019608, 0, 1,
-1.927319, -1.049611, -1.796527, 1, 0.1098039, 0, 1,
-1.918263, -0.4935736, -1.448251, 1, 0.1137255, 0, 1,
-1.907688, -0.09250547, -0.6616662, 1, 0.1215686, 0, 1,
-1.891932, 0.04083917, -0.2751696, 1, 0.1254902, 0, 1,
-1.872223, -2.09431, -2.80787, 1, 0.1333333, 0, 1,
-1.848117, 1.305253, -0.9380211, 1, 0.1372549, 0, 1,
-1.832834, 0.9436681, -1.473432, 1, 0.145098, 0, 1,
-1.817623, -0.2770022, 1.385061, 1, 0.1490196, 0, 1,
-1.809458, -0.2897825, -0.7125572, 1, 0.1568628, 0, 1,
-1.794289, -0.6980626, -0.05438265, 1, 0.1607843, 0, 1,
-1.790215, 0.3826618, -1.762041, 1, 0.1686275, 0, 1,
-1.781116, 0.7485381, -2.054751, 1, 0.172549, 0, 1,
-1.738128, -0.198066, -1.065313, 1, 0.1803922, 0, 1,
-1.716191, -1.188318, -2.69294, 1, 0.1843137, 0, 1,
-1.704234, 1.973658, -1.002257, 1, 0.1921569, 0, 1,
-1.703656, -1.140696, -2.24511, 1, 0.1960784, 0, 1,
-1.696831, 0.1016574, -1.004593, 1, 0.2039216, 0, 1,
-1.696451, 0.9858488, -2.088492, 1, 0.2117647, 0, 1,
-1.688111, 2.650513, -0.4213804, 1, 0.2156863, 0, 1,
-1.685836, -0.1265686, -2.513944, 1, 0.2235294, 0, 1,
-1.682683, -0.9211941, -0.9821122, 1, 0.227451, 0, 1,
-1.659049, 0.9450137, -1.908664, 1, 0.2352941, 0, 1,
-1.649183, 0.498936, -0.234391, 1, 0.2392157, 0, 1,
-1.639938, -2.094684, -3.005901, 1, 0.2470588, 0, 1,
-1.631347, -1.158928, -1.253927, 1, 0.2509804, 0, 1,
-1.612985, 2.363992, -1.352711, 1, 0.2588235, 0, 1,
-1.605499, 1.834149, -0.3330109, 1, 0.2627451, 0, 1,
-1.603762, 1.446843, -1.864631, 1, 0.2705882, 0, 1,
-1.600544, -0.1553914, -2.261879, 1, 0.2745098, 0, 1,
-1.599679, -0.2870557, -2.240395, 1, 0.282353, 0, 1,
-1.597391, -0.4186681, -0.3835065, 1, 0.2862745, 0, 1,
-1.59646, -1.102649, -2.172594, 1, 0.2941177, 0, 1,
-1.592442, 0.8790503, -0.4080088, 1, 0.3019608, 0, 1,
-1.583581, 0.8779452, -1.390616, 1, 0.3058824, 0, 1,
-1.580059, 1.915586, -1.749866, 1, 0.3137255, 0, 1,
-1.560616, -1.029834, -1.823328, 1, 0.3176471, 0, 1,
-1.559115, -0.5297799, -1.284284, 1, 0.3254902, 0, 1,
-1.543818, 1.612985, -0.3159711, 1, 0.3294118, 0, 1,
-1.537416, -0.04217163, -0.971245, 1, 0.3372549, 0, 1,
-1.534111, -0.2275361, -0.480923, 1, 0.3411765, 0, 1,
-1.515544, -0.6122507, -2.731217, 1, 0.3490196, 0, 1,
-1.511548, 1.316762, -1.490737, 1, 0.3529412, 0, 1,
-1.497628, 0.5742993, -1.042323, 1, 0.3607843, 0, 1,
-1.495948, -1.501889, -2.484946, 1, 0.3647059, 0, 1,
-1.493536, 0.8309245, -0.5776601, 1, 0.372549, 0, 1,
-1.486936, 0.002746595, -1.453553, 1, 0.3764706, 0, 1,
-1.480205, 0.04099244, -3.028218, 1, 0.3843137, 0, 1,
-1.476746, 0.7652015, -2.202827, 1, 0.3882353, 0, 1,
-1.474606, 1.243408, -2.174623, 1, 0.3960784, 0, 1,
-1.457124, 0.3796846, -2.789203, 1, 0.4039216, 0, 1,
-1.449562, -0.9118019, -2.187976, 1, 0.4078431, 0, 1,
-1.44901, 0.1194739, -1.663991, 1, 0.4156863, 0, 1,
-1.438169, -0.5017968, -3.337036, 1, 0.4196078, 0, 1,
-1.425338, 1.874708, -1.189022, 1, 0.427451, 0, 1,
-1.417548, 0.8323545, -1.097256, 1, 0.4313726, 0, 1,
-1.394887, 1.18841, -0.2854352, 1, 0.4392157, 0, 1,
-1.38802, 0.5596768, -0.9340214, 1, 0.4431373, 0, 1,
-1.385272, 0.7507549, -2.180843, 1, 0.4509804, 0, 1,
-1.38407, 0.5191171, -2.576683, 1, 0.454902, 0, 1,
-1.367459, -0.8672106, -2.361023, 1, 0.4627451, 0, 1,
-1.35967, -0.274555, -3.128835, 1, 0.4666667, 0, 1,
-1.349457, 0.8546774, -0.8283315, 1, 0.4745098, 0, 1,
-1.347714, 1.516187, 0.03732721, 1, 0.4784314, 0, 1,
-1.344551, 0.8601765, -1.663705, 1, 0.4862745, 0, 1,
-1.34061, -1.964753, -3.643469, 1, 0.4901961, 0, 1,
-1.334743, 1.542106, -1.647163, 1, 0.4980392, 0, 1,
-1.30582, -0.4102942, -3.169446, 1, 0.5058824, 0, 1,
-1.300515, -2.257648, -2.867345, 1, 0.509804, 0, 1,
-1.289015, -0.3662085, -3.210615, 1, 0.5176471, 0, 1,
-1.285054, -0.1414123, -3.673889, 1, 0.5215687, 0, 1,
-1.277107, -0.3078067, -0.9392737, 1, 0.5294118, 0, 1,
-1.276263, 0.7358919, -1.650717, 1, 0.5333334, 0, 1,
-1.261389, -1.028385, -3.412918, 1, 0.5411765, 0, 1,
-1.261041, -0.3291187, -1.107112, 1, 0.5450981, 0, 1,
-1.260416, 0.09222962, -2.961833, 1, 0.5529412, 0, 1,
-1.255599, -0.08190826, -3.650185, 1, 0.5568628, 0, 1,
-1.253973, -0.8569198, -3.327778, 1, 0.5647059, 0, 1,
-1.243027, 0.3967028, -2.653304, 1, 0.5686275, 0, 1,
-1.242174, 1.717574, -0.8952347, 1, 0.5764706, 0, 1,
-1.240951, -0.6166003, -0.8697008, 1, 0.5803922, 0, 1,
-1.235278, -1.662993, -3.540877, 1, 0.5882353, 0, 1,
-1.232367, 0.2403427, -3.968683, 1, 0.5921569, 0, 1,
-1.231495, 1.05571, -1.624898, 1, 0.6, 0, 1,
-1.229027, -1.130445, -2.112738, 1, 0.6078432, 0, 1,
-1.208138, 0.5756811, -0.6709173, 1, 0.6117647, 0, 1,
-1.204911, -0.2727888, -1.429556, 1, 0.6196079, 0, 1,
-1.203416, -0.5430017, -1.479339, 1, 0.6235294, 0, 1,
-1.198511, -0.9049222, -1.16942, 1, 0.6313726, 0, 1,
-1.189252, -0.3814253, -2.360085, 1, 0.6352941, 0, 1,
-1.17792, -0.110964, -2.952867, 1, 0.6431373, 0, 1,
-1.174981, 0.3416593, -0.8356461, 1, 0.6470588, 0, 1,
-1.169015, 1.528911, -1.303961, 1, 0.654902, 0, 1,
-1.166027, 0.4687365, -2.375324, 1, 0.6588235, 0, 1,
-1.163096, 0.77259, -1.547486, 1, 0.6666667, 0, 1,
-1.150041, 0.0655498, -0.5720608, 1, 0.6705883, 0, 1,
-1.134723, 1.273705, -2.627649, 1, 0.6784314, 0, 1,
-1.122944, 0.8210087, -2.06821, 1, 0.682353, 0, 1,
-1.117802, 0.4738001, 0.3864426, 1, 0.6901961, 0, 1,
-1.115799, -0.3961548, -1.898195, 1, 0.6941177, 0, 1,
-1.10798, -0.5347288, -0.9100997, 1, 0.7019608, 0, 1,
-1.104725, 0.1143728, -2.977511, 1, 0.7098039, 0, 1,
-1.100029, 0.8474058, -0.1428852, 1, 0.7137255, 0, 1,
-1.089123, 0.7260457, -1.993815, 1, 0.7215686, 0, 1,
-1.084221, 1.343868, -0.01872618, 1, 0.7254902, 0, 1,
-1.083529, 0.07372844, -2.528858, 1, 0.7333333, 0, 1,
-1.08162, 1.269883, -0.06199433, 1, 0.7372549, 0, 1,
-1.081484, -0.9973444, -2.592108, 1, 0.7450981, 0, 1,
-1.079238, -1.504791, -1.993559, 1, 0.7490196, 0, 1,
-1.073231, 0.4240039, -0.6597047, 1, 0.7568628, 0, 1,
-1.067459, 1.009414, -0.3808817, 1, 0.7607843, 0, 1,
-1.066445, -0.6282355, -1.598705, 1, 0.7686275, 0, 1,
-1.056648, 0.6933753, -0.232128, 1, 0.772549, 0, 1,
-1.050095, -2.05908, -1.700173, 1, 0.7803922, 0, 1,
-1.048721, -0.9567979, -2.456728, 1, 0.7843137, 0, 1,
-1.044072, 0.251072, 1.078085, 1, 0.7921569, 0, 1,
-1.038804, 0.5592862, 0.7319769, 1, 0.7960784, 0, 1,
-1.035668, 0.1266823, -1.234817, 1, 0.8039216, 0, 1,
-1.030199, -0.4797757, -1.793375, 1, 0.8117647, 0, 1,
-1.030025, -0.5292867, -1.651917, 1, 0.8156863, 0, 1,
-1.02561, -0.6949832, -3.108077, 1, 0.8235294, 0, 1,
-1.022948, 0.3440414, -1.975701, 1, 0.827451, 0, 1,
-1.021827, 1.201386, -0.6512417, 1, 0.8352941, 0, 1,
-1.021285, 0.5498705, -2.171316, 1, 0.8392157, 0, 1,
-1.020796, 2.599981, -0.9686952, 1, 0.8470588, 0, 1,
-1.013559, 0.102462, -2.592264, 1, 0.8509804, 0, 1,
-1.011759, 0.4144398, -0.9191763, 1, 0.8588235, 0, 1,
-1.006118, 0.703014, -1.210371, 1, 0.8627451, 0, 1,
-1.001224, 2.185669, 1.034397, 1, 0.8705882, 0, 1,
-0.9899666, 0.08381079, -2.650774, 1, 0.8745098, 0, 1,
-0.9841498, 0.8268467, -1.849324, 1, 0.8823529, 0, 1,
-0.9800273, -0.342344, -2.939375, 1, 0.8862745, 0, 1,
-0.9789069, -0.2434383, -2.818997, 1, 0.8941177, 0, 1,
-0.9710153, -0.4259022, -1.394646, 1, 0.8980392, 0, 1,
-0.9708593, -0.486874, -2.717108, 1, 0.9058824, 0, 1,
-0.9677934, 1.972012, -0.6884094, 1, 0.9137255, 0, 1,
-0.9658694, 1.145431, 0.2499522, 1, 0.9176471, 0, 1,
-0.9620733, -0.9410683, -0.4670567, 1, 0.9254902, 0, 1,
-0.9612563, 0.5509319, -1.068758, 1, 0.9294118, 0, 1,
-0.9585354, -0.2094445, -3.773649, 1, 0.9372549, 0, 1,
-0.9571261, -1.290587, -3.549049, 1, 0.9411765, 0, 1,
-0.9558062, -0.1741501, -1.867748, 1, 0.9490196, 0, 1,
-0.9543078, 0.6824169, -0.4959755, 1, 0.9529412, 0, 1,
-0.9512641, 0.8349952, 0.7614416, 1, 0.9607843, 0, 1,
-0.9510229, 0.5711857, 0.8465056, 1, 0.9647059, 0, 1,
-0.949973, 0.5817351, 0.6740415, 1, 0.972549, 0, 1,
-0.9409459, -0.194567, -0.7795016, 1, 0.9764706, 0, 1,
-0.9288202, -0.03093514, -2.399986, 1, 0.9843137, 0, 1,
-0.9275649, -2.096442, -2.770425, 1, 0.9882353, 0, 1,
-0.9256455, 0.8283927, -0.06963456, 1, 0.9960784, 0, 1,
-0.9219147, -0.5067341, -3.058938, 0.9960784, 1, 0, 1,
-0.9064305, 0.1588779, -2.439921, 0.9921569, 1, 0, 1,
-0.9020788, 1.322478, -0.1491785, 0.9843137, 1, 0, 1,
-0.8946716, -0.8877137, -2.614546, 0.9803922, 1, 0, 1,
-0.8941621, -0.26791, -1.110888, 0.972549, 1, 0, 1,
-0.8865545, -0.1787022, -0.1062181, 0.9686275, 1, 0, 1,
-0.8842911, -0.08002368, -3.202019, 0.9607843, 1, 0, 1,
-0.8822722, -0.9183007, -2.336495, 0.9568627, 1, 0, 1,
-0.8795511, -1.01648, -4.256752, 0.9490196, 1, 0, 1,
-0.8746813, -0.6278976, -2.323438, 0.945098, 1, 0, 1,
-0.8741722, -0.003121024, -2.09291, 0.9372549, 1, 0, 1,
-0.870431, -1.931786, -1.194305, 0.9333333, 1, 0, 1,
-0.8678417, 1.924085, 0.3354866, 0.9254902, 1, 0, 1,
-0.8668488, 1.796387, -0.2268305, 0.9215686, 1, 0, 1,
-0.860086, 0.4945619, -0.8785279, 0.9137255, 1, 0, 1,
-0.8600169, -0.591295, -1.821816, 0.9098039, 1, 0, 1,
-0.859656, 0.878819, -0.1547572, 0.9019608, 1, 0, 1,
-0.8590102, -0.683508, -3.529223, 0.8941177, 1, 0, 1,
-0.8508357, -0.3004361, -2.247358, 0.8901961, 1, 0, 1,
-0.8472147, 0.5882801, -0.718693, 0.8823529, 1, 0, 1,
-0.8438162, 0.7969798, -1.288511, 0.8784314, 1, 0, 1,
-0.8373884, -1.164375, -1.398628, 0.8705882, 1, 0, 1,
-0.8183907, 0.6115713, -2.973696, 0.8666667, 1, 0, 1,
-0.8157674, 1.966263, -1.027357, 0.8588235, 1, 0, 1,
-0.8140041, -0.608791, -1.025723, 0.854902, 1, 0, 1,
-0.8082678, 1.292109, 0.9161116, 0.8470588, 1, 0, 1,
-0.805633, 0.6384075, -0.1471395, 0.8431373, 1, 0, 1,
-0.8038726, -0.2409184, -2.014493, 0.8352941, 1, 0, 1,
-0.803368, -0.2812766, -1.352907, 0.8313726, 1, 0, 1,
-0.8032114, -0.513408, -2.548971, 0.8235294, 1, 0, 1,
-0.7954136, 1.846006, -0.3055071, 0.8196079, 1, 0, 1,
-0.7927661, -0.9768776, -1.198043, 0.8117647, 1, 0, 1,
-0.7806403, 2.036226, -0.455964, 0.8078431, 1, 0, 1,
-0.7744186, -1.035119, -3.275365, 0.8, 1, 0, 1,
-0.7722396, -0.3344156, -3.130079, 0.7921569, 1, 0, 1,
-0.7681823, -1.127201, -2.042991, 0.7882353, 1, 0, 1,
-0.765097, -1.573579, -1.545905, 0.7803922, 1, 0, 1,
-0.7558254, 0.370403, -0.8820537, 0.7764706, 1, 0, 1,
-0.7546135, -0.7007064, -1.560283, 0.7686275, 1, 0, 1,
-0.751948, -1.608852, -2.613627, 0.7647059, 1, 0, 1,
-0.7513475, 1.018237, -1.440776, 0.7568628, 1, 0, 1,
-0.7500057, 0.1058797, -0.6052983, 0.7529412, 1, 0, 1,
-0.7498122, 0.0009554619, -4.007887, 0.7450981, 1, 0, 1,
-0.7479546, 1.060961, 0.1222401, 0.7411765, 1, 0, 1,
-0.7443652, 0.4817461, -1.616033, 0.7333333, 1, 0, 1,
-0.7336975, -0.9041303, -2.595521, 0.7294118, 1, 0, 1,
-0.7325602, 1.983194, 0.3795111, 0.7215686, 1, 0, 1,
-0.7286288, 1.374245, -0.4402936, 0.7176471, 1, 0, 1,
-0.7228521, -0.5882102, -2.899614, 0.7098039, 1, 0, 1,
-0.7222111, 0.1851929, -2.507499, 0.7058824, 1, 0, 1,
-0.7153925, 1.559327, -1.933765, 0.6980392, 1, 0, 1,
-0.7127731, 0.7804349, -0.4428627, 0.6901961, 1, 0, 1,
-0.7099314, -1.162877, -2.384254, 0.6862745, 1, 0, 1,
-0.70818, 0.2696379, -1.392866, 0.6784314, 1, 0, 1,
-0.7063113, 1.808233, 0.04541032, 0.6745098, 1, 0, 1,
-0.7039021, 1.882491, -0.8261467, 0.6666667, 1, 0, 1,
-0.7012954, 1.270333, 0.6464276, 0.6627451, 1, 0, 1,
-0.7004594, -0.3366652, -0.7513211, 0.654902, 1, 0, 1,
-0.700408, -0.05954645, -3.007734, 0.6509804, 1, 0, 1,
-0.6980757, 0.5555439, -2.210081, 0.6431373, 1, 0, 1,
-0.694769, -0.2262553, -0.4956289, 0.6392157, 1, 0, 1,
-0.6946445, -0.6550063, -2.137649, 0.6313726, 1, 0, 1,
-0.6924148, -0.05349854, -0.5177063, 0.627451, 1, 0, 1,
-0.6920447, 1.471782, 0.6578596, 0.6196079, 1, 0, 1,
-0.6911402, 1.30933, 1.147359, 0.6156863, 1, 0, 1,
-0.6902385, 2.008332, 0.315969, 0.6078432, 1, 0, 1,
-0.6880118, -0.1014551, -2.324392, 0.6039216, 1, 0, 1,
-0.6832322, -1.182387, -2.436027, 0.5960785, 1, 0, 1,
-0.6695074, -1.304892, -3.246059, 0.5882353, 1, 0, 1,
-0.6543161, -1.069838, -1.046857, 0.5843138, 1, 0, 1,
-0.6536486, 0.6948838, -1.421863, 0.5764706, 1, 0, 1,
-0.6524, 1.266845, -1.362085, 0.572549, 1, 0, 1,
-0.6430051, -0.4931207, -2.248752, 0.5647059, 1, 0, 1,
-0.6361846, 0.09658483, -2.988455, 0.5607843, 1, 0, 1,
-0.6350982, -0.4273668, -1.363727, 0.5529412, 1, 0, 1,
-0.6347087, 0.5558588, -0.3380171, 0.5490196, 1, 0, 1,
-0.6338018, -1.236911, -3.228286, 0.5411765, 1, 0, 1,
-0.6332667, 0.3946466, -0.7036479, 0.5372549, 1, 0, 1,
-0.6248472, 2.147179, -1.666623, 0.5294118, 1, 0, 1,
-0.6195161, -0.1079132, -3.177113, 0.5254902, 1, 0, 1,
-0.6190525, 0.5317228, -2.328321, 0.5176471, 1, 0, 1,
-0.6189547, -0.2840448, -2.329493, 0.5137255, 1, 0, 1,
-0.6151502, 1.327122, -1.342711, 0.5058824, 1, 0, 1,
-0.614186, 1.260337, -1.638978, 0.5019608, 1, 0, 1,
-0.6127949, -1.559277, -1.839931, 0.4941176, 1, 0, 1,
-0.6065679, -1.182227, -2.106483, 0.4862745, 1, 0, 1,
-0.6052032, 0.7046428, -0.1517252, 0.4823529, 1, 0, 1,
-0.6029794, 1.29073, -1.498334, 0.4745098, 1, 0, 1,
-0.6021615, -1.295834, -2.915833, 0.4705882, 1, 0, 1,
-0.6020204, 1.295373, 0.4555356, 0.4627451, 1, 0, 1,
-0.6014407, 1.028109, -1.519113, 0.4588235, 1, 0, 1,
-0.5988959, 0.7635797, -0.3163019, 0.4509804, 1, 0, 1,
-0.5955329, 0.1613555, -2.100895, 0.4470588, 1, 0, 1,
-0.5915645, -1.334893, -0.8176954, 0.4392157, 1, 0, 1,
-0.5838735, 1.428783, -0.2788906, 0.4352941, 1, 0, 1,
-0.582022, -1.018476, -1.180745, 0.427451, 1, 0, 1,
-0.5809163, -0.4681851, -1.579949, 0.4235294, 1, 0, 1,
-0.5767789, -0.9498246, -2.202791, 0.4156863, 1, 0, 1,
-0.5737931, -0.01365872, -1.053817, 0.4117647, 1, 0, 1,
-0.5727155, -0.5368493, -3.052166, 0.4039216, 1, 0, 1,
-0.5711383, -0.7820195, -2.827017, 0.3960784, 1, 0, 1,
-0.5667303, 0.1365419, -1.074633, 0.3921569, 1, 0, 1,
-0.5615057, 1.306236, -0.2379726, 0.3843137, 1, 0, 1,
-0.5590435, -1.286159, -2.194343, 0.3803922, 1, 0, 1,
-0.5578809, -0.3275313, -2.119765, 0.372549, 1, 0, 1,
-0.5577108, 0.3819926, 0.6366001, 0.3686275, 1, 0, 1,
-0.5564108, -1.925685, -3.407294, 0.3607843, 1, 0, 1,
-0.5544584, 0.2912166, -2.365822, 0.3568628, 1, 0, 1,
-0.5528321, -1.384299, -0.3757277, 0.3490196, 1, 0, 1,
-0.5471648, -2.161463, -2.073954, 0.345098, 1, 0, 1,
-0.5462441, -1.87836, -0.6756914, 0.3372549, 1, 0, 1,
-0.5454974, 0.389538, -1.247738, 0.3333333, 1, 0, 1,
-0.544692, 1.030951, -1.37778, 0.3254902, 1, 0, 1,
-0.54432, 1.090333, -0.3010802, 0.3215686, 1, 0, 1,
-0.5403842, -0.9763802, -4.883629, 0.3137255, 1, 0, 1,
-0.5369381, -0.3061602, -1.733498, 0.3098039, 1, 0, 1,
-0.5363243, 2.834884, -2.209053, 0.3019608, 1, 0, 1,
-0.5348901, 0.2160008, 0.3675101, 0.2941177, 1, 0, 1,
-0.530621, 1.078051, -0.790731, 0.2901961, 1, 0, 1,
-0.5304924, 0.7934809, -1.357, 0.282353, 1, 0, 1,
-0.5290174, 0.783492, -0.6268895, 0.2784314, 1, 0, 1,
-0.5266392, -0.9455072, -1.442475, 0.2705882, 1, 0, 1,
-0.524222, -0.2905192, -0.8021984, 0.2666667, 1, 0, 1,
-0.5237547, 0.5928566, -0.7645006, 0.2588235, 1, 0, 1,
-0.5222769, 1.111464, -0.7390006, 0.254902, 1, 0, 1,
-0.5201273, -0.1086082, -2.013258, 0.2470588, 1, 0, 1,
-0.5144376, -0.2946076, -2.966766, 0.2431373, 1, 0, 1,
-0.5084567, -0.6070814, -2.155262, 0.2352941, 1, 0, 1,
-0.5032416, -0.7892672, -1.737345, 0.2313726, 1, 0, 1,
-0.5025281, 0.6159115, -0.4425921, 0.2235294, 1, 0, 1,
-0.498847, -0.7853478, -1.972638, 0.2196078, 1, 0, 1,
-0.4980467, -0.08293448, -2.490639, 0.2117647, 1, 0, 1,
-0.497211, -2.111463, -2.661193, 0.2078431, 1, 0, 1,
-0.4947107, -0.5310827, -3.177599, 0.2, 1, 0, 1,
-0.4942428, -0.1782185, -1.627378, 0.1921569, 1, 0, 1,
-0.4938601, 0.4621305, -1.409949, 0.1882353, 1, 0, 1,
-0.4869778, 1.696121, 1.424949, 0.1803922, 1, 0, 1,
-0.4768406, -0.6770487, -4.443009, 0.1764706, 1, 0, 1,
-0.4762836, 0.3259156, -2.415526, 0.1686275, 1, 0, 1,
-0.4705149, 1.606035, -2.259168, 0.1647059, 1, 0, 1,
-0.465769, 0.3697765, -2.265423, 0.1568628, 1, 0, 1,
-0.4620738, 1.443053, -0.141989, 0.1529412, 1, 0, 1,
-0.4616553, -0.09258109, -3.198805, 0.145098, 1, 0, 1,
-0.4456242, 0.6484265, -0.5128041, 0.1411765, 1, 0, 1,
-0.4444744, 0.2426981, 1.002115, 0.1333333, 1, 0, 1,
-0.4404535, 0.9261613, 0.3166237, 0.1294118, 1, 0, 1,
-0.4401153, -1.0064, -3.260269, 0.1215686, 1, 0, 1,
-0.4378898, -1.094267, -2.488162, 0.1176471, 1, 0, 1,
-0.4339136, -1.476025, -2.745454, 0.1098039, 1, 0, 1,
-0.4332636, 0.7802219, 0.01708426, 0.1058824, 1, 0, 1,
-0.4331473, -0.266071, -2.430035, 0.09803922, 1, 0, 1,
-0.4275213, -0.3254696, -1.358771, 0.09019608, 1, 0, 1,
-0.4258057, 0.1372563, -2.326744, 0.08627451, 1, 0, 1,
-0.424883, -0.7750447, -1.29284, 0.07843138, 1, 0, 1,
-0.4241765, 0.18642, -1.02705, 0.07450981, 1, 0, 1,
-0.4234744, -0.1409326, -2.24505, 0.06666667, 1, 0, 1,
-0.4136556, 0.6113633, 0.07076414, 0.0627451, 1, 0, 1,
-0.413419, -0.4151952, -2.460143, 0.05490196, 1, 0, 1,
-0.4116054, 0.5700539, -0.7811075, 0.05098039, 1, 0, 1,
-0.4023531, -0.2654814, 0.467918, 0.04313726, 1, 0, 1,
-0.3998632, 0.7025033, -0.922572, 0.03921569, 1, 0, 1,
-0.399, 0.3547935, -2.450189, 0.03137255, 1, 0, 1,
-0.3950934, -1.121683, -0.8521171, 0.02745098, 1, 0, 1,
-0.3910242, 0.2041967, 0.2624523, 0.01960784, 1, 0, 1,
-0.3781977, 1.136421, -0.9802624, 0.01568628, 1, 0, 1,
-0.3712837, -1.762181, -4.367183, 0.007843138, 1, 0, 1,
-0.3712417, 0.5435912, -1.589187, 0.003921569, 1, 0, 1,
-0.3700258, -0.6466228, -2.072712, 0, 1, 0.003921569, 1,
-0.3665134, -0.3273603, -3.639485, 0, 1, 0.01176471, 1,
-0.3657271, 0.9526392, -2.056144, 0, 1, 0.01568628, 1,
-0.3632885, 1.001379, -1.127413, 0, 1, 0.02352941, 1,
-0.3518665, -0.7373367, -4.666331, 0, 1, 0.02745098, 1,
-0.3496241, 1.220544, -1.28433, 0, 1, 0.03529412, 1,
-0.3494919, -1.008404, -3.328646, 0, 1, 0.03921569, 1,
-0.3491551, 1.425101, -0.1041038, 0, 1, 0.04705882, 1,
-0.3419997, -0.4630355, -2.635057, 0, 1, 0.05098039, 1,
-0.3389638, -1.648539, -2.149769, 0, 1, 0.05882353, 1,
-0.3352039, 0.6084682, -1.214625, 0, 1, 0.0627451, 1,
-0.3337384, 0.9230605, 0.5856105, 0, 1, 0.07058824, 1,
-0.3331275, -0.7258158, -2.88783, 0, 1, 0.07450981, 1,
-0.329403, 0.6519259, 1.953772, 0, 1, 0.08235294, 1,
-0.3283694, -0.7082432, -2.780661, 0, 1, 0.08627451, 1,
-0.3259361, -0.8352742, -2.412749, 0, 1, 0.09411765, 1,
-0.3245048, 0.8539277, -0.2735905, 0, 1, 0.1019608, 1,
-0.3225947, 0.1119173, -1.286573, 0, 1, 0.1058824, 1,
-0.3191784, 0.6598473, -1.198446, 0, 1, 0.1137255, 1,
-0.3179108, -0.3164517, -1.773545, 0, 1, 0.1176471, 1,
-0.3176189, -0.7847112, -3.481617, 0, 1, 0.1254902, 1,
-0.3167411, 0.8356205, -0.08693565, 0, 1, 0.1294118, 1,
-0.3164852, 0.6030084, -1.209355, 0, 1, 0.1372549, 1,
-0.3093971, 0.9784631, -0.8533116, 0, 1, 0.1411765, 1,
-0.3060285, -0.6065124, -3.098058, 0, 1, 0.1490196, 1,
-0.3045487, 1.464239, -0.4506128, 0, 1, 0.1529412, 1,
-0.2997754, 0.1932947, -1.200553, 0, 1, 0.1607843, 1,
-0.2944002, -0.8916039, -3.960624, 0, 1, 0.1647059, 1,
-0.2940365, 0.7680343, -0.02982239, 0, 1, 0.172549, 1,
-0.2807761, -0.5382226, -2.308802, 0, 1, 0.1764706, 1,
-0.2800639, -0.02058039, -1.024607, 0, 1, 0.1843137, 1,
-0.2800343, -0.6184599, -0.7357646, 0, 1, 0.1882353, 1,
-0.2779347, 0.3553206, -0.8544751, 0, 1, 0.1960784, 1,
-0.2733715, 0.9121933, 0.5968865, 0, 1, 0.2039216, 1,
-0.2726903, -0.08975216, -3.569923, 0, 1, 0.2078431, 1,
-0.2659883, -1.343865, -5.458952, 0, 1, 0.2156863, 1,
-0.262409, 1.003724, -0.4621907, 0, 1, 0.2196078, 1,
-0.2605508, 1.612355, 0.5766253, 0, 1, 0.227451, 1,
-0.2584178, 0.8840646, 0.2470991, 0, 1, 0.2313726, 1,
-0.2557396, -0.3981745, -1.709392, 0, 1, 0.2392157, 1,
-0.2549536, -1.883277, -2.057544, 0, 1, 0.2431373, 1,
-0.2534271, 0.8676978, -0.08078484, 0, 1, 0.2509804, 1,
-0.2524247, -0.4741249, -1.700363, 0, 1, 0.254902, 1,
-0.2492894, -1.235436, -3.592965, 0, 1, 0.2627451, 1,
-0.2484674, -2.437458, -5.438225, 0, 1, 0.2666667, 1,
-0.2460313, 1.263765, -0.8957977, 0, 1, 0.2745098, 1,
-0.2451116, 1.315295, 0.7266831, 0, 1, 0.2784314, 1,
-0.2431296, 0.243298, -0.2924306, 0, 1, 0.2862745, 1,
-0.242783, -0.09684448, -1.545812, 0, 1, 0.2901961, 1,
-0.2401695, 0.5098303, 0.4907183, 0, 1, 0.2980392, 1,
-0.2393864, 0.7791281, -1.687777, 0, 1, 0.3058824, 1,
-0.2372551, -1.080334, -2.06408, 0, 1, 0.3098039, 1,
-0.2369328, 0.2951385, -0.5387956, 0, 1, 0.3176471, 1,
-0.2305564, -0.9143484, -2.707139, 0, 1, 0.3215686, 1,
-0.2260305, -1.370452, -1.387394, 0, 1, 0.3294118, 1,
-0.2249154, 2.297534, -0.7685196, 0, 1, 0.3333333, 1,
-0.2247173, 0.7675737, -0.7881594, 0, 1, 0.3411765, 1,
-0.2241348, 1.010043, -0.2192014, 0, 1, 0.345098, 1,
-0.2229662, 0.5954548, -0.7723159, 0, 1, 0.3529412, 1,
-0.2198055, 1.005641, 0.07509504, 0, 1, 0.3568628, 1,
-0.2180897, -0.01375564, -2.105813, 0, 1, 0.3647059, 1,
-0.2164962, 0.04228522, -1.034958, 0, 1, 0.3686275, 1,
-0.2134759, -0.5829577, -0.8471606, 0, 1, 0.3764706, 1,
-0.2088536, -0.5758591, -2.250471, 0, 1, 0.3803922, 1,
-0.2078443, 1.891639, 0.1040217, 0, 1, 0.3882353, 1,
-0.204574, -1.23318, -3.383698, 0, 1, 0.3921569, 1,
-0.2038, -1.405701, -3.443337, 0, 1, 0.4, 1,
-0.2036884, -1.689706, -4.156863, 0, 1, 0.4078431, 1,
-0.1994024, -0.001802557, -3.225091, 0, 1, 0.4117647, 1,
-0.1928069, -0.4251734, -3.0109, 0, 1, 0.4196078, 1,
-0.1890027, -0.811708, -3.61189, 0, 1, 0.4235294, 1,
-0.1844662, 0.7160292, -1.333997, 0, 1, 0.4313726, 1,
-0.1837156, 1.367883, 0.8877599, 0, 1, 0.4352941, 1,
-0.1790304, 0.1392718, -0.7742009, 0, 1, 0.4431373, 1,
-0.1785821, -1.351619, -2.462958, 0, 1, 0.4470588, 1,
-0.1776059, 1.423012, -0.2917621, 0, 1, 0.454902, 1,
-0.176268, 0.77823, 0.7409633, 0, 1, 0.4588235, 1,
-0.1753034, -1.03105, -4.171011, 0, 1, 0.4666667, 1,
-0.1751645, 0.4674716, 0.1290037, 0, 1, 0.4705882, 1,
-0.1750712, -0.5170242, -3.96294, 0, 1, 0.4784314, 1,
-0.1707667, 0.8420545, -0.1424578, 0, 1, 0.4823529, 1,
-0.1634274, 1.06305, -0.2406801, 0, 1, 0.4901961, 1,
-0.1613973, -1.331736, -2.535895, 0, 1, 0.4941176, 1,
-0.1583253, 0.5155098, 1.529185, 0, 1, 0.5019608, 1,
-0.1548321, 0.3051091, -0.6162828, 0, 1, 0.509804, 1,
-0.1501984, -0.6546752, -1.53421, 0, 1, 0.5137255, 1,
-0.1492387, -1.981012, -2.145632, 0, 1, 0.5215687, 1,
-0.1448375, -0.6265506, -2.024972, 0, 1, 0.5254902, 1,
-0.1374829, -0.4604043, -2.933167, 0, 1, 0.5333334, 1,
-0.1374206, -0.1865335, -3.323504, 0, 1, 0.5372549, 1,
-0.1372738, 0.9022809, -0.4603938, 0, 1, 0.5450981, 1,
-0.1316016, -0.6487222, -3.074032, 0, 1, 0.5490196, 1,
-0.1312418, 1.919606, -0.469872, 0, 1, 0.5568628, 1,
-0.1285179, 0.08267546, -1.479651, 0, 1, 0.5607843, 1,
-0.1284153, 0.0384304, -2.124654, 0, 1, 0.5686275, 1,
-0.1277026, -0.5208558, -2.258073, 0, 1, 0.572549, 1,
-0.1251222, 1.440824, 0.4102778, 0, 1, 0.5803922, 1,
-0.1237169, -0.1662722, -1.520089, 0, 1, 0.5843138, 1,
-0.1233225, -0.05277599, -1.04003, 0, 1, 0.5921569, 1,
-0.1217545, -0.03431521, -2.882397, 0, 1, 0.5960785, 1,
-0.1197731, 0.03373396, -1.898067, 0, 1, 0.6039216, 1,
-0.1191503, -0.4518182, -3.483907, 0, 1, 0.6117647, 1,
-0.1183773, 0.7221462, 1.043722, 0, 1, 0.6156863, 1,
-0.1162642, 0.05597759, -2.149324, 0, 1, 0.6235294, 1,
-0.1104378, 0.01543555, 0.1830857, 0, 1, 0.627451, 1,
-0.1034496, 0.1426959, -0.6814837, 0, 1, 0.6352941, 1,
-0.1031541, -0.5994288, -2.839875, 0, 1, 0.6392157, 1,
-0.1028121, 0.0010981, 1.42088, 0, 1, 0.6470588, 1,
-0.1025944, -0.5095459, -3.964989, 0, 1, 0.6509804, 1,
-0.1011232, 0.5688151, 0.2288827, 0, 1, 0.6588235, 1,
-0.09989971, -0.4323244, -2.876309, 0, 1, 0.6627451, 1,
-0.08930518, 0.4991746, -0.4672022, 0, 1, 0.6705883, 1,
-0.08877035, 0.4687205, -0.8481231, 0, 1, 0.6745098, 1,
-0.08735278, 0.2544417, 1.146793, 0, 1, 0.682353, 1,
-0.07915681, 0.3713329, 0.767305, 0, 1, 0.6862745, 1,
-0.07362924, -1.79556, -2.365252, 0, 1, 0.6941177, 1,
-0.07358947, 0.03181055, -2.735899, 0, 1, 0.7019608, 1,
-0.06232375, -1.073002, -3.321986, 0, 1, 0.7058824, 1,
-0.0616015, 0.960135, -0.7991427, 0, 1, 0.7137255, 1,
-0.0567116, -1.387692, -4.590093, 0, 1, 0.7176471, 1,
-0.05280933, -1.124302, -3.417281, 0, 1, 0.7254902, 1,
-0.04842605, 0.05311928, 0.1014114, 0, 1, 0.7294118, 1,
-0.04384431, 0.4850101, 1.240034, 0, 1, 0.7372549, 1,
-0.04254919, -0.3360002, -2.622251, 0, 1, 0.7411765, 1,
-0.04159443, 0.5917484, 0.7979594, 0, 1, 0.7490196, 1,
-0.03903699, -1.741247, -3.003066, 0, 1, 0.7529412, 1,
-0.03701997, 0.3355144, -0.5785339, 0, 1, 0.7607843, 1,
-0.03686389, -0.3444017, -3.407299, 0, 1, 0.7647059, 1,
-0.03212231, -0.58029, -2.988766, 0, 1, 0.772549, 1,
-0.03184016, 1.230131, 1.202416, 0, 1, 0.7764706, 1,
-0.03055368, -0.2011093, -0.4909114, 0, 1, 0.7843137, 1,
-0.02702558, 1.184064, -0.8782926, 0, 1, 0.7882353, 1,
-0.01747573, 0.1579538, -0.4668066, 0, 1, 0.7960784, 1,
-0.01611497, -0.03011699, -1.689088, 0, 1, 0.8039216, 1,
-0.01514367, -0.5209034, -4.251411, 0, 1, 0.8078431, 1,
-0.01450096, -1.741068, -3.012222, 0, 1, 0.8156863, 1,
-0.009021319, 1.071445, 0.5629796, 0, 1, 0.8196079, 1,
-0.008878558, 0.8473399, 1.600688, 0, 1, 0.827451, 1,
-0.006511037, -1.851654, -2.890416, 0, 1, 0.8313726, 1,
-0.005826566, -0.2454212, -1.802192, 0, 1, 0.8392157, 1,
-0.002043632, -0.1387905, -2.7891, 0, 1, 0.8431373, 1,
0.00159429, -0.8409316, 4.681589, 0, 1, 0.8509804, 1,
0.002295652, 0.5459592, 0.1162127, 0, 1, 0.854902, 1,
0.00397648, -0.5782024, 2.491896, 0, 1, 0.8627451, 1,
0.005151363, 0.8624327, -0.6133807, 0, 1, 0.8666667, 1,
0.01011221, 2.018251, 2.341201, 0, 1, 0.8745098, 1,
0.01166385, -1.026654, 4.641391, 0, 1, 0.8784314, 1,
0.01381377, 0.5551921, -0.8752768, 0, 1, 0.8862745, 1,
0.01538488, 0.8830262, 0.3819114, 0, 1, 0.8901961, 1,
0.01692852, -0.4541022, 2.413281, 0, 1, 0.8980392, 1,
0.01951668, -0.361187, 1.905201, 0, 1, 0.9058824, 1,
0.02106175, -0.5908989, 2.76404, 0, 1, 0.9098039, 1,
0.02255955, 0.4958548, -1.985696, 0, 1, 0.9176471, 1,
0.02292773, -0.02622525, 1.694591, 0, 1, 0.9215686, 1,
0.0238492, 0.8415776, -1.229237, 0, 1, 0.9294118, 1,
0.02785022, -0.06735418, 3.214793, 0, 1, 0.9333333, 1,
0.0324016, 0.3007864, -0.5059556, 0, 1, 0.9411765, 1,
0.03605695, 0.987333, -0.1720915, 0, 1, 0.945098, 1,
0.03656971, -0.02701966, 3.149566, 0, 1, 0.9529412, 1,
0.03789905, 0.3140932, 0.4522893, 0, 1, 0.9568627, 1,
0.03868492, -0.7048801, 5.145182, 0, 1, 0.9647059, 1,
0.03953902, -0.9941784, 4.679298, 0, 1, 0.9686275, 1,
0.04024835, 0.8180346, -1.024074, 0, 1, 0.9764706, 1,
0.04282645, 1.632633, 0.6568149, 0, 1, 0.9803922, 1,
0.04864479, -0.2398431, 1.308584, 0, 1, 0.9882353, 1,
0.04873019, 0.3651302, -0.3505721, 0, 1, 0.9921569, 1,
0.04953895, -1.45045, 2.410782, 0, 1, 1, 1,
0.05008639, -0.4712092, 1.863602, 0, 0.9921569, 1, 1,
0.052644, -0.2202903, 3.661108, 0, 0.9882353, 1, 1,
0.05802031, -0.5325308, 3.107587, 0, 0.9803922, 1, 1,
0.06035008, 1.631202, 0.01279949, 0, 0.9764706, 1, 1,
0.0644969, -0.2008105, 1.657879, 0, 0.9686275, 1, 1,
0.07090644, 2.419928, -0.6418495, 0, 0.9647059, 1, 1,
0.07183674, -0.9505443, 2.812713, 0, 0.9568627, 1, 1,
0.07503121, -0.9710872, 3.239157, 0, 0.9529412, 1, 1,
0.07596315, -0.6208865, 2.33517, 0, 0.945098, 1, 1,
0.07768419, 0.1850726, -0.9131142, 0, 0.9411765, 1, 1,
0.08427398, -1.255145, 2.653609, 0, 0.9333333, 1, 1,
0.08436664, -0.200906, 2.431397, 0, 0.9294118, 1, 1,
0.0867364, -0.001456872, 2.635365, 0, 0.9215686, 1, 1,
0.0888791, 0.1642905, 2.070637, 0, 0.9176471, 1, 1,
0.08922403, 0.3354849, -0.1378805, 0, 0.9098039, 1, 1,
0.09063914, -1.551645, 0.6464189, 0, 0.9058824, 1, 1,
0.09219107, -0.00322782, 1.811136, 0, 0.8980392, 1, 1,
0.09219638, 1.08638, 1.292508, 0, 0.8901961, 1, 1,
0.09220872, 0.8168981, 0.6706659, 0, 0.8862745, 1, 1,
0.09356784, 0.3707827, 1.406286, 0, 0.8784314, 1, 1,
0.09658732, -0.1309935, 1.83157, 0, 0.8745098, 1, 1,
0.09671694, -0.6920807, 0.9551513, 0, 0.8666667, 1, 1,
0.09787302, -0.8615236, 3.359661, 0, 0.8627451, 1, 1,
0.09843172, 0.3751183, -0.3284982, 0, 0.854902, 1, 1,
0.09922986, -0.7849386, 4.654584, 0, 0.8509804, 1, 1,
0.1005705, 0.02101583, 1.133312, 0, 0.8431373, 1, 1,
0.1035255, -0.3438097, 3.558786, 0, 0.8392157, 1, 1,
0.1040626, 1.008765, -1.233873, 0, 0.8313726, 1, 1,
0.1054986, 0.4535369, -0.108905, 0, 0.827451, 1, 1,
0.1060669, 2.082242, 1.058095, 0, 0.8196079, 1, 1,
0.1112272, -0.02064357, 1.587688, 0, 0.8156863, 1, 1,
0.1134484, -1.088886, 1.911428, 0, 0.8078431, 1, 1,
0.1153287, -1.085409, 3.568475, 0, 0.8039216, 1, 1,
0.115354, 1.067065, 0.9959009, 0, 0.7960784, 1, 1,
0.1163963, 0.297172, 0.7283009, 0, 0.7882353, 1, 1,
0.1189819, -0.635436, 4.091206, 0, 0.7843137, 1, 1,
0.1200043, 2.423058, 1.20007, 0, 0.7764706, 1, 1,
0.1233922, -1.086677, 1.721163, 0, 0.772549, 1, 1,
0.1248085, 1.499432, 2.210761, 0, 0.7647059, 1, 1,
0.1250556, 0.1932739, 0.8294693, 0, 0.7607843, 1, 1,
0.1271297, 0.8198925, -0.1988404, 0, 0.7529412, 1, 1,
0.1307069, -0.4088787, 2.391876, 0, 0.7490196, 1, 1,
0.1361324, 0.6794304, -0.5406392, 0, 0.7411765, 1, 1,
0.136369, -0.9296232, 3.245785, 0, 0.7372549, 1, 1,
0.142811, -1.25706, 2.865771, 0, 0.7294118, 1, 1,
0.1468387, 1.102804, 0.766291, 0, 0.7254902, 1, 1,
0.1541797, 0.5893527, 1.10105, 0, 0.7176471, 1, 1,
0.1547895, 0.07356276, 1.816968, 0, 0.7137255, 1, 1,
0.1560653, 1.174886, 0.7733402, 0, 0.7058824, 1, 1,
0.1595058, 1.432586, -0.4494261, 0, 0.6980392, 1, 1,
0.1633389, 1.583723, 0.5083715, 0, 0.6941177, 1, 1,
0.1668757, -0.2675849, 3.700636, 0, 0.6862745, 1, 1,
0.1681487, -1.086081, 3.895036, 0, 0.682353, 1, 1,
0.1710375, -0.4173229, 4.103023, 0, 0.6745098, 1, 1,
0.1725417, -0.4339153, 1.040926, 0, 0.6705883, 1, 1,
0.1770009, 1.048162, -1.123619, 0, 0.6627451, 1, 1,
0.1869562, 0.4791478, 0.9255201, 0, 0.6588235, 1, 1,
0.1891382, -0.6902902, 3.646391, 0, 0.6509804, 1, 1,
0.1901795, 0.8262444, -0.1774818, 0, 0.6470588, 1, 1,
0.1910501, 1.148467, 1.027687, 0, 0.6392157, 1, 1,
0.191804, 0.1554155, 1.375111, 0, 0.6352941, 1, 1,
0.1929199, -1.696509, 2.576348, 0, 0.627451, 1, 1,
0.1971555, 0.5113043, 0.8609014, 0, 0.6235294, 1, 1,
0.1972692, 0.9752706, -0.2137054, 0, 0.6156863, 1, 1,
0.2024574, 0.2860758, 1.422727, 0, 0.6117647, 1, 1,
0.2070329, -0.2149158, 1.913812, 0, 0.6039216, 1, 1,
0.207105, 0.9495577, 0.3319489, 0, 0.5960785, 1, 1,
0.2084187, -0.768164, 1.624617, 0, 0.5921569, 1, 1,
0.2090308, -0.3002463, 3.075422, 0, 0.5843138, 1, 1,
0.2099805, 0.2188375, 2.570037, 0, 0.5803922, 1, 1,
0.210351, 1.001548, 1.171526, 0, 0.572549, 1, 1,
0.2162006, 0.8973969, 0.08379544, 0, 0.5686275, 1, 1,
0.2198301, -0.4782791, 2.937087, 0, 0.5607843, 1, 1,
0.2220196, -0.001041116, -0.3395772, 0, 0.5568628, 1, 1,
0.223732, -0.7286389, 2.074813, 0, 0.5490196, 1, 1,
0.2251202, 0.6052123, 0.4466999, 0, 0.5450981, 1, 1,
0.2251564, 1.703555, 0.5804242, 0, 0.5372549, 1, 1,
0.2262768, 0.4357429, 0.8938213, 0, 0.5333334, 1, 1,
0.2302991, -0.08034032, -0.1005935, 0, 0.5254902, 1, 1,
0.2344111, 0.2453553, 1.59084, 0, 0.5215687, 1, 1,
0.2344802, 1.116358, -0.6677055, 0, 0.5137255, 1, 1,
0.2344834, -1.948655, 3.296036, 0, 0.509804, 1, 1,
0.2381169, -0.9201186, 0.4934297, 0, 0.5019608, 1, 1,
0.2422136, -0.9407561, 2.283824, 0, 0.4941176, 1, 1,
0.2451956, -1.054876, 2.318931, 0, 0.4901961, 1, 1,
0.2477385, -0.06022388, 2.167636, 0, 0.4823529, 1, 1,
0.2498276, -1.460047, 2.344361, 0, 0.4784314, 1, 1,
0.2522061, 1.64742, -0.212851, 0, 0.4705882, 1, 1,
0.2541563, 0.692661, 0.8386977, 0, 0.4666667, 1, 1,
0.2549148, 0.122253, 0.595771, 0, 0.4588235, 1, 1,
0.2552481, -0.6943097, 2.590199, 0, 0.454902, 1, 1,
0.2558826, 0.5552508, 0.3814788, 0, 0.4470588, 1, 1,
0.256172, -0.08613952, 2.257738, 0, 0.4431373, 1, 1,
0.2561874, 1.586534, -0.127397, 0, 0.4352941, 1, 1,
0.2587014, -1.270222, 1.612439, 0, 0.4313726, 1, 1,
0.2618138, -1.361627, 3.983502, 0, 0.4235294, 1, 1,
0.2638188, -0.07827424, 2.612229, 0, 0.4196078, 1, 1,
0.2688037, -0.3349533, 2.58806, 0, 0.4117647, 1, 1,
0.2692266, -0.4927898, 1.629761, 0, 0.4078431, 1, 1,
0.2758014, -0.4527448, 3.839396, 0, 0.4, 1, 1,
0.2786846, -1.677947, 2.50251, 0, 0.3921569, 1, 1,
0.2815789, 0.938229, -1.950462, 0, 0.3882353, 1, 1,
0.2815861, -2.026655, 2.632326, 0, 0.3803922, 1, 1,
0.2825739, 1.865672, -0.04799667, 0, 0.3764706, 1, 1,
0.2842634, -1.156433, 3.921203, 0, 0.3686275, 1, 1,
0.2860291, -0.01731305, 3.292281, 0, 0.3647059, 1, 1,
0.2867103, -0.2746031, 2.656653, 0, 0.3568628, 1, 1,
0.288072, 0.2422851, 2.128015, 0, 0.3529412, 1, 1,
0.2889415, -0.5366208, 4.529467, 0, 0.345098, 1, 1,
0.2896525, -1.189442, 4.521664, 0, 0.3411765, 1, 1,
0.2903542, -0.01961093, 2.233525, 0, 0.3333333, 1, 1,
0.2913101, 0.8018917, 0.4644673, 0, 0.3294118, 1, 1,
0.3029333, 1.388329, 1.29199, 0, 0.3215686, 1, 1,
0.30358, -0.08851955, 1.062154, 0, 0.3176471, 1, 1,
0.3044307, 0.9987156, 0.555228, 0, 0.3098039, 1, 1,
0.3069719, -1.264773, 4.094925, 0, 0.3058824, 1, 1,
0.3077128, -0.9769806, 2.496065, 0, 0.2980392, 1, 1,
0.3088973, -2.738671, 3.80535, 0, 0.2901961, 1, 1,
0.3105453, 1.163193, -0.0943296, 0, 0.2862745, 1, 1,
0.3112037, -0.748117, 2.918788, 0, 0.2784314, 1, 1,
0.3132662, -0.6680604, 3.622273, 0, 0.2745098, 1, 1,
0.3139252, 0.689178, 0.2189065, 0, 0.2666667, 1, 1,
0.3141859, 1.648692, 0.4912518, 0, 0.2627451, 1, 1,
0.3150687, 0.6809965, 0.7576887, 0, 0.254902, 1, 1,
0.3230534, -0.9334198, 3.247511, 0, 0.2509804, 1, 1,
0.3238938, 0.3598681, -0.9100254, 0, 0.2431373, 1, 1,
0.3300008, -0.392279, 1.248913, 0, 0.2392157, 1, 1,
0.3308112, -0.441794, 3.003744, 0, 0.2313726, 1, 1,
0.3312795, 0.5424004, 0.1074238, 0, 0.227451, 1, 1,
0.3344406, -0.08869801, 1.306601, 0, 0.2196078, 1, 1,
0.3351761, 0.4930185, 1.013739, 0, 0.2156863, 1, 1,
0.3353715, 0.1146946, 1.811406, 0, 0.2078431, 1, 1,
0.340075, 1.039769, 0.01694577, 0, 0.2039216, 1, 1,
0.3406579, 0.857412, -0.3803618, 0, 0.1960784, 1, 1,
0.3411994, -0.09128071, 1.051243, 0, 0.1882353, 1, 1,
0.3431433, -0.4821274, 3.103667, 0, 0.1843137, 1, 1,
0.3438665, -0.8307826, 2.635214, 0, 0.1764706, 1, 1,
0.345036, 2.487137, -0.4296136, 0, 0.172549, 1, 1,
0.3527636, -1.768462, 4.641822, 0, 0.1647059, 1, 1,
0.3588561, 0.2831603, 1.435028, 0, 0.1607843, 1, 1,
0.3592348, -1.065341, 2.149541, 0, 0.1529412, 1, 1,
0.3606964, 1.422606, 0.3639062, 0, 0.1490196, 1, 1,
0.3628002, 0.4645176, 0.2756486, 0, 0.1411765, 1, 1,
0.3628457, -0.7237135, 1.880454, 0, 0.1372549, 1, 1,
0.3642173, -0.9732853, 3.320497, 0, 0.1294118, 1, 1,
0.3681252, -1.304183, 4.073581, 0, 0.1254902, 1, 1,
0.3684757, -0.9465861, 3.391458, 0, 0.1176471, 1, 1,
0.3685194, 0.2749583, 2.900327, 0, 0.1137255, 1, 1,
0.3690693, -2.549887, 2.063517, 0, 0.1058824, 1, 1,
0.3704486, -1.558952, 2.168598, 0, 0.09803922, 1, 1,
0.3740827, 0.1634037, 1.264033, 0, 0.09411765, 1, 1,
0.3743158, -0.5219485, 1.868288, 0, 0.08627451, 1, 1,
0.376441, -1.317789, 3.269023, 0, 0.08235294, 1, 1,
0.378945, 0.1969585, 0.6143261, 0, 0.07450981, 1, 1,
0.3793685, 0.7463592, 0.3712777, 0, 0.07058824, 1, 1,
0.3860922, 0.5747687, 1.585607, 0, 0.0627451, 1, 1,
0.3903975, 2.365666, -1.024156, 0, 0.05882353, 1, 1,
0.392922, 0.1688634, 0.2330688, 0, 0.05098039, 1, 1,
0.3968144, -0.3611005, 2.235668, 0, 0.04705882, 1, 1,
0.3998214, 0.827483, 0.5551654, 0, 0.03921569, 1, 1,
0.4014736, 2.730751, 0.09931337, 0, 0.03529412, 1, 1,
0.4036961, 1.646886, -0.40602, 0, 0.02745098, 1, 1,
0.4056205, 0.2772571, 2.406843, 0, 0.02352941, 1, 1,
0.411321, 0.5796189, 1.44834, 0, 0.01568628, 1, 1,
0.4115664, -0.5514644, 1.484989, 0, 0.01176471, 1, 1,
0.4172407, 0.5764552, 1.406757, 0, 0.003921569, 1, 1,
0.4176089, -0.7429726, 2.191122, 0.003921569, 0, 1, 1,
0.4193885, 0.7330052, 1.882086, 0.007843138, 0, 1, 1,
0.4203383, -0.2979646, 2.692084, 0.01568628, 0, 1, 1,
0.4238191, 0.02837686, -0.2198496, 0.01960784, 0, 1, 1,
0.427874, -1.359536, 2.208542, 0.02745098, 0, 1, 1,
0.4284784, -0.3706565, 2.932103, 0.03137255, 0, 1, 1,
0.4316729, -0.02389945, 2.238388, 0.03921569, 0, 1, 1,
0.4333439, 2.581167, -0.2656008, 0.04313726, 0, 1, 1,
0.4340531, -0.3802621, 1.066884, 0.05098039, 0, 1, 1,
0.4374772, -2.688816, 2.155177, 0.05490196, 0, 1, 1,
0.4380552, 0.4614611, 1.106667, 0.0627451, 0, 1, 1,
0.4390197, 0.6149638, 2.460609, 0.06666667, 0, 1, 1,
0.4402569, -0.4058867, 3.161615, 0.07450981, 0, 1, 1,
0.4441718, 1.231252, 1.144287, 0.07843138, 0, 1, 1,
0.4450075, 0.5452636, 2.242089, 0.08627451, 0, 1, 1,
0.4475892, -0.344315, 3.367033, 0.09019608, 0, 1, 1,
0.4507662, 0.2699274, 1.962335, 0.09803922, 0, 1, 1,
0.4536178, -0.3355323, 2.862325, 0.1058824, 0, 1, 1,
0.4539882, -0.2077109, 2.33069, 0.1098039, 0, 1, 1,
0.4548959, -0.02348278, 0.657523, 0.1176471, 0, 1, 1,
0.4620743, 0.732851, 1.541631, 0.1215686, 0, 1, 1,
0.4652123, 1.940603, 0.5991853, 0.1294118, 0, 1, 1,
0.4654738, -1.655706, 1.54462, 0.1333333, 0, 1, 1,
0.4661969, 0.2769061, 0.2595775, 0.1411765, 0, 1, 1,
0.4695641, 1.573236, -1.150319, 0.145098, 0, 1, 1,
0.4696472, -0.2424895, 0.2731089, 0.1529412, 0, 1, 1,
0.4734859, -1.080348, 2.891356, 0.1568628, 0, 1, 1,
0.4783428, 0.5367627, -1.782362, 0.1647059, 0, 1, 1,
0.4786568, -1.241261, 2.847191, 0.1686275, 0, 1, 1,
0.4794886, -1.056132, 3.731809, 0.1764706, 0, 1, 1,
0.4814832, -1.332543, 4.823553, 0.1803922, 0, 1, 1,
0.4829618, -1.866784, 2.002748, 0.1882353, 0, 1, 1,
0.4847201, 1.955414, 2.321872, 0.1921569, 0, 1, 1,
0.4897107, -1.425582, 1.127015, 0.2, 0, 1, 1,
0.4908518, 0.7922621, 1.891004, 0.2078431, 0, 1, 1,
0.4928012, 0.07794756, 1.260073, 0.2117647, 0, 1, 1,
0.4934559, 0.07725085, 1.824482, 0.2196078, 0, 1, 1,
0.495201, -1.31538, 2.783633, 0.2235294, 0, 1, 1,
0.4956594, -0.7694658, -0.6140856, 0.2313726, 0, 1, 1,
0.5005667, -0.2198538, 1.903995, 0.2352941, 0, 1, 1,
0.5087401, 0.6785379, 0.8311046, 0.2431373, 0, 1, 1,
0.513913, -0.524121, 1.445969, 0.2470588, 0, 1, 1,
0.5142028, 0.5576972, -1.130087, 0.254902, 0, 1, 1,
0.5194132, 0.8783287, 0.7099692, 0.2588235, 0, 1, 1,
0.5230113, -0.02325898, 1.407894, 0.2666667, 0, 1, 1,
0.5279531, -1.380111, 3.706184, 0.2705882, 0, 1, 1,
0.5295181, 0.3600423, -1.575497, 0.2784314, 0, 1, 1,
0.5296573, 0.1209316, 2.25139, 0.282353, 0, 1, 1,
0.5299617, 0.5007932, 1.249149, 0.2901961, 0, 1, 1,
0.5375695, -0.889133, 2.95538, 0.2941177, 0, 1, 1,
0.5384634, 0.01847653, 3.483345, 0.3019608, 0, 1, 1,
0.5451183, -0.3604252, 1.370957, 0.3098039, 0, 1, 1,
0.5467888, 0.7085721, 1.802394, 0.3137255, 0, 1, 1,
0.5486097, -0.3477716, 2.017205, 0.3215686, 0, 1, 1,
0.5522398, -1.015088, 2.171791, 0.3254902, 0, 1, 1,
0.5576218, 1.730402, 0.3761028, 0.3333333, 0, 1, 1,
0.5589259, -0.4448771, 1.244893, 0.3372549, 0, 1, 1,
0.5635356, -0.5291877, 3.488807, 0.345098, 0, 1, 1,
0.5652971, 1.703111, 0.5358344, 0.3490196, 0, 1, 1,
0.5678062, -2.573611, 1.89989, 0.3568628, 0, 1, 1,
0.5711586, 1.547035, 0.6136069, 0.3607843, 0, 1, 1,
0.5717379, -0.2235666, 1.383113, 0.3686275, 0, 1, 1,
0.5792049, -0.4741467, 1.642795, 0.372549, 0, 1, 1,
0.5805568, 0.2655947, -0.3185142, 0.3803922, 0, 1, 1,
0.5805731, -1.179793, 3.404814, 0.3843137, 0, 1, 1,
0.5844446, 1.688071, 1.218343, 0.3921569, 0, 1, 1,
0.5863982, 0.9187673, 0.4568451, 0.3960784, 0, 1, 1,
0.5868971, 0.1010042, 2.11231, 0.4039216, 0, 1, 1,
0.6046042, -0.4849156, 1.35461, 0.4117647, 0, 1, 1,
0.6133411, -0.4009735, 3.258976, 0.4156863, 0, 1, 1,
0.6138381, -0.732782, 3.020061, 0.4235294, 0, 1, 1,
0.6171561, -0.2941892, 3.473708, 0.427451, 0, 1, 1,
0.6303844, -0.8144851, 2.210241, 0.4352941, 0, 1, 1,
0.6314235, -0.7012684, 2.94012, 0.4392157, 0, 1, 1,
0.6331359, -1.573744, 1.392397, 0.4470588, 0, 1, 1,
0.6333699, -0.7171873, 2.346152, 0.4509804, 0, 1, 1,
0.6350765, -0.4245457, 1.843731, 0.4588235, 0, 1, 1,
0.6354474, -1.11006, 2.810286, 0.4627451, 0, 1, 1,
0.6364905, 0.01832859, 0.4569741, 0.4705882, 0, 1, 1,
0.6375983, -0.5448415, 4.234048, 0.4745098, 0, 1, 1,
0.6400855, 0.7691759, -1.179662, 0.4823529, 0, 1, 1,
0.6413573, 0.3629643, 1.194779, 0.4862745, 0, 1, 1,
0.6455799, 0.05467044, 1.362542, 0.4941176, 0, 1, 1,
0.6472228, 0.3380559, 1.287894, 0.5019608, 0, 1, 1,
0.6611927, -0.8474924, 2.299339, 0.5058824, 0, 1, 1,
0.6616693, -2.236392, 3.304111, 0.5137255, 0, 1, 1,
0.667636, -0.2618541, 1.079102, 0.5176471, 0, 1, 1,
0.6711789, -1.288285, 1.626678, 0.5254902, 0, 1, 1,
0.6759909, -0.4256369, 2.887853, 0.5294118, 0, 1, 1,
0.6784857, -0.2925294, 2.993756, 0.5372549, 0, 1, 1,
0.6788714, 0.8144364, -0.1434325, 0.5411765, 0, 1, 1,
0.6869591, -0.3976666, 1.264664, 0.5490196, 0, 1, 1,
0.6874539, -0.673492, 2.361393, 0.5529412, 0, 1, 1,
0.6882182, 1.056636, -1.061184, 0.5607843, 0, 1, 1,
0.6897277, -0.3265601, 1.381098, 0.5647059, 0, 1, 1,
0.6916901, 0.6225898, 2.397069, 0.572549, 0, 1, 1,
0.6953436, 0.6273191, 1.072819, 0.5764706, 0, 1, 1,
0.6983519, 0.2199599, 0.3471134, 0.5843138, 0, 1, 1,
0.6997851, -0.1740793, 2.276316, 0.5882353, 0, 1, 1,
0.7026423, 0.4421486, 1.170531, 0.5960785, 0, 1, 1,
0.7089347, -1.748978, 2.615551, 0.6039216, 0, 1, 1,
0.7131639, -0.03265133, 1.457103, 0.6078432, 0, 1, 1,
0.7151925, -0.334177, 1.647069, 0.6156863, 0, 1, 1,
0.7153472, 0.5650207, 3.63392, 0.6196079, 0, 1, 1,
0.7168564, -0.1228102, 1.046901, 0.627451, 0, 1, 1,
0.7193532, 1.293864, 1.76911, 0.6313726, 0, 1, 1,
0.7225817, -0.2931665, 1.053969, 0.6392157, 0, 1, 1,
0.7233794, -0.07297679, 1.921872, 0.6431373, 0, 1, 1,
0.7317804, 0.6814694, 1.288767, 0.6509804, 0, 1, 1,
0.7351654, -0.02220729, 0.5465695, 0.654902, 0, 1, 1,
0.7351974, 0.8043822, 0.8960534, 0.6627451, 0, 1, 1,
0.7396024, 1.118561, 0.4305668, 0.6666667, 0, 1, 1,
0.7411722, -1.611999, 4.325023, 0.6745098, 0, 1, 1,
0.7431307, -1.384443, 1.873797, 0.6784314, 0, 1, 1,
0.7464529, -0.1872289, 3.924669, 0.6862745, 0, 1, 1,
0.7503061, -0.06859922, 2.191794, 0.6901961, 0, 1, 1,
0.7528585, 0.5305149, 2.338779, 0.6980392, 0, 1, 1,
0.7561393, 0.7979643, 0.5416721, 0.7058824, 0, 1, 1,
0.7571732, -1.578571, 0.8082135, 0.7098039, 0, 1, 1,
0.7613587, -1.870204, 3.953861, 0.7176471, 0, 1, 1,
0.7638461, -0.9999157, 3.455637, 0.7215686, 0, 1, 1,
0.7652887, 1.631741, 0.750604, 0.7294118, 0, 1, 1,
0.7681482, 1.374909, 2.736368, 0.7333333, 0, 1, 1,
0.777232, -1.004514, 1.637177, 0.7411765, 0, 1, 1,
0.7854742, 0.8515161, -0.2790777, 0.7450981, 0, 1, 1,
0.7891447, -1.435667, 4.369404, 0.7529412, 0, 1, 1,
0.7933043, -0.4242323, 1.551582, 0.7568628, 0, 1, 1,
0.8016627, 0.7115765, 0.8647861, 0.7647059, 0, 1, 1,
0.801824, -0.9564775, 3.10836, 0.7686275, 0, 1, 1,
0.8031107, 0.5065953, 0.7397406, 0.7764706, 0, 1, 1,
0.8064734, -1.39595, 1.211246, 0.7803922, 0, 1, 1,
0.8071755, -0.03488661, 2.620126, 0.7882353, 0, 1, 1,
0.8199461, 1.489672, 0.6805778, 0.7921569, 0, 1, 1,
0.8259674, -0.4720351, 2.295109, 0.8, 0, 1, 1,
0.8271375, 0.2464055, 1.396119, 0.8078431, 0, 1, 1,
0.8283964, 0.5849008, 0.9027762, 0.8117647, 0, 1, 1,
0.8358363, 0.7401357, 0.6512047, 0.8196079, 0, 1, 1,
0.8456842, -0.1193085, 0.872013, 0.8235294, 0, 1, 1,
0.8469956, 1.492862, -0.3173603, 0.8313726, 0, 1, 1,
0.8473246, 0.6079874, 1.346794, 0.8352941, 0, 1, 1,
0.8482025, -0.7875822, 2.011254, 0.8431373, 0, 1, 1,
0.8537788, 0.8082191, 0.751965, 0.8470588, 0, 1, 1,
0.8589829, -1.083289, 1.309739, 0.854902, 0, 1, 1,
0.8670537, -1.841274, 4.166962, 0.8588235, 0, 1, 1,
0.86914, -0.888481, 2.78293, 0.8666667, 0, 1, 1,
0.8697634, 1.415106, 1.030578, 0.8705882, 0, 1, 1,
0.8759314, -0.7727808, 2.066911, 0.8784314, 0, 1, 1,
0.8810012, 1.989953, 1.051377, 0.8823529, 0, 1, 1,
0.8830027, 0.1853484, 2.016939, 0.8901961, 0, 1, 1,
0.8870334, 1.343666, -0.471638, 0.8941177, 0, 1, 1,
0.8883731, -0.0422462, 1.634203, 0.9019608, 0, 1, 1,
0.8902274, 0.03197241, 0.2446362, 0.9098039, 0, 1, 1,
0.8937641, 0.5423412, -0.3683134, 0.9137255, 0, 1, 1,
0.8944039, -1.53287, 0.6073984, 0.9215686, 0, 1, 1,
0.9001423, 0.6065641, 1.578005, 0.9254902, 0, 1, 1,
0.900453, -0.6923409, 2.974991, 0.9333333, 0, 1, 1,
0.9026182, 1.024482, 1.682408, 0.9372549, 0, 1, 1,
0.9113887, -1.464136, 2.618517, 0.945098, 0, 1, 1,
0.9137675, 1.804922, -0.2109433, 0.9490196, 0, 1, 1,
0.9159027, -0.5914366, 2.469801, 0.9568627, 0, 1, 1,
0.9194728, -0.9951056, 2.794806, 0.9607843, 0, 1, 1,
0.9213589, -1.590443, 2.892377, 0.9686275, 0, 1, 1,
0.9279402, 0.1405471, 1.33666, 0.972549, 0, 1, 1,
0.9350335, 0.7209311, -1.086615, 0.9803922, 0, 1, 1,
0.9386126, 0.8202019, 1.104285, 0.9843137, 0, 1, 1,
0.9473702, 1.191236, -0.115186, 0.9921569, 0, 1, 1,
0.9515374, -2.205072, 2.808719, 0.9960784, 0, 1, 1,
0.9536691, -1.518781, 1.867749, 1, 0, 0.9960784, 1,
0.9569052, -1.057601, 2.726991, 1, 0, 0.9882353, 1,
0.9596484, 0.8139083, 2.672819, 1, 0, 0.9843137, 1,
0.9657546, 0.7388369, 0.5536466, 1, 0, 0.9764706, 1,
0.9686391, -0.3147599, 1.775355, 1, 0, 0.972549, 1,
0.9743183, -0.229554, 2.600253, 1, 0, 0.9647059, 1,
0.9774941, -0.8892948, 2.349477, 1, 0, 0.9607843, 1,
0.9792687, -1.549861, 3.389172, 1, 0, 0.9529412, 1,
0.9794892, 3.070103, -0.09724161, 1, 0, 0.9490196, 1,
0.989573, 0.7297211, 1.925764, 1, 0, 0.9411765, 1,
0.9896634, 0.006257551, 1.096614, 1, 0, 0.9372549, 1,
0.9946932, -0.9123756, 2.23854, 1, 0, 0.9294118, 1,
0.9981731, -0.9127026, 3.793153, 1, 0, 0.9254902, 1,
1.002698, 0.003119368, 1.992864, 1, 0, 0.9176471, 1,
1.002838, 1.482288, -1.215967, 1, 0, 0.9137255, 1,
1.01145, 0.2135134, -0.7288976, 1, 0, 0.9058824, 1,
1.019255, 0.9675945, 1.977546, 1, 0, 0.9019608, 1,
1.01947, 0.9919668, -0.3905421, 1, 0, 0.8941177, 1,
1.022913, -1.37143, 2.024884, 1, 0, 0.8862745, 1,
1.031805, 1.011396, 0.9631631, 1, 0, 0.8823529, 1,
1.04702, -1.614134, 2.862653, 1, 0, 0.8745098, 1,
1.049602, -0.3522833, 3.798424, 1, 0, 0.8705882, 1,
1.050722, 0.6520814, -0.0375028, 1, 0, 0.8627451, 1,
1.063527, 0.6580556, 2.565313, 1, 0, 0.8588235, 1,
1.063674, 1.1493, 2.275748, 1, 0, 0.8509804, 1,
1.066581, 0.5870374, 1.821465, 1, 0, 0.8470588, 1,
1.072006, -0.6578783, 2.392463, 1, 0, 0.8392157, 1,
1.07352, 1.40081, 0.4185706, 1, 0, 0.8352941, 1,
1.081714, -0.4879772, 2.250936, 1, 0, 0.827451, 1,
1.084929, 0.09699458, 0.9214575, 1, 0, 0.8235294, 1,
1.086848, 1.08866, -0.9281883, 1, 0, 0.8156863, 1,
1.088436, 0.07827315, 1.924825, 1, 0, 0.8117647, 1,
1.097727, 1.190297, 0.9711065, 1, 0, 0.8039216, 1,
1.106664, -0.9823802, 1.663231, 1, 0, 0.7960784, 1,
1.108444, -0.5978487, 2.632049, 1, 0, 0.7921569, 1,
1.115322, 0.4947902, 2.471078, 1, 0, 0.7843137, 1,
1.116201, 0.5800895, 0.4991202, 1, 0, 0.7803922, 1,
1.116225, 1.256017, 0.704139, 1, 0, 0.772549, 1,
1.118385, 0.4829662, -0.06532164, 1, 0, 0.7686275, 1,
1.119001, -0.457737, 2.309058, 1, 0, 0.7607843, 1,
1.119363, -1.37703, 3.020138, 1, 0, 0.7568628, 1,
1.129642, 0.5029768, 1.30914, 1, 0, 0.7490196, 1,
1.131607, 0.01593305, 0.2763231, 1, 0, 0.7450981, 1,
1.132762, 1.74901, -0.2406817, 1, 0, 0.7372549, 1,
1.13838, 1.136922, 1.095033, 1, 0, 0.7333333, 1,
1.143641, 0.0820457, 0.5013165, 1, 0, 0.7254902, 1,
1.14713, -0.2727914, 1.038018, 1, 0, 0.7215686, 1,
1.14789, 0.07659715, 0.7621429, 1, 0, 0.7137255, 1,
1.159454, -0.7575729, 3.519209, 1, 0, 0.7098039, 1,
1.178973, -0.1245037, 0.7902703, 1, 0, 0.7019608, 1,
1.179351, -0.8006173, 1.141294, 1, 0, 0.6941177, 1,
1.182369, 1.40525, -0.1984786, 1, 0, 0.6901961, 1,
1.183165, -0.1757537, 1.884783, 1, 0, 0.682353, 1,
1.193533, -0.3344547, 3.466637, 1, 0, 0.6784314, 1,
1.196401, -0.2129499, 3.14228, 1, 0, 0.6705883, 1,
1.201041, -0.1639341, 1.894634, 1, 0, 0.6666667, 1,
1.205264, -0.4742248, 2.641939, 1, 0, 0.6588235, 1,
1.220649, -0.5883341, 0.8926494, 1, 0, 0.654902, 1,
1.22409, 0.7042502, 1.842914, 1, 0, 0.6470588, 1,
1.226124, -0.1531288, 1.494869, 1, 0, 0.6431373, 1,
1.229432, 1.650007, 1.254104, 1, 0, 0.6352941, 1,
1.242226, -0.8940156, 1.613819, 1, 0, 0.6313726, 1,
1.246594, 0.6358698, 2.105109, 1, 0, 0.6235294, 1,
1.252276, 0.4350541, 0.01155776, 1, 0, 0.6196079, 1,
1.267239, 0.7490332, -0.276323, 1, 0, 0.6117647, 1,
1.269897, 0.4010102, 0.8614729, 1, 0, 0.6078432, 1,
1.275766, 0.4956058, 0.7764327, 1, 0, 0.6, 1,
1.284669, -0.5836486, 3.33166, 1, 0, 0.5921569, 1,
1.290294, -0.8437651, 1.792547, 1, 0, 0.5882353, 1,
1.301913, -0.1017178, 1.661139, 1, 0, 0.5803922, 1,
1.304598, 1.75628, 1.04877, 1, 0, 0.5764706, 1,
1.327308, -0.6408191, 2.068418, 1, 0, 0.5686275, 1,
1.328561, 0.3139396, 0.07373527, 1, 0, 0.5647059, 1,
1.337014, 0.7196703, 2.737694, 1, 0, 0.5568628, 1,
1.340238, 0.2760758, 2.59748, 1, 0, 0.5529412, 1,
1.347765, -0.3818697, 1.133968, 1, 0, 0.5450981, 1,
1.353188, -0.5179856, 2.372778, 1, 0, 0.5411765, 1,
1.368282, 1.382723, 2.766501, 1, 0, 0.5333334, 1,
1.372015, 1.982077, 1.241085, 1, 0, 0.5294118, 1,
1.380647, -0.02795167, 2.767482, 1, 0, 0.5215687, 1,
1.394509, 0.216358, 0.9853055, 1, 0, 0.5176471, 1,
1.394984, -1.265623, 0.2746021, 1, 0, 0.509804, 1,
1.402546, 0.1872126, 1.352148, 1, 0, 0.5058824, 1,
1.404285, -0.7580485, 2.96643, 1, 0, 0.4980392, 1,
1.409638, -0.03114946, 2.676717, 1, 0, 0.4901961, 1,
1.413512, -0.7062731, 0.4585507, 1, 0, 0.4862745, 1,
1.428989, -0.7012268, 0.9245651, 1, 0, 0.4784314, 1,
1.436402, 0.2462699, -0.7442412, 1, 0, 0.4745098, 1,
1.436508, -0.06764333, 2.106259, 1, 0, 0.4666667, 1,
1.445329, 1.379519, 2.804436, 1, 0, 0.4627451, 1,
1.455781, 1.341944, -0.1376712, 1, 0, 0.454902, 1,
1.457208, 0.5008256, 0.8952641, 1, 0, 0.4509804, 1,
1.459663, 0.2470886, 1.045228, 1, 0, 0.4431373, 1,
1.480542, 0.7440196, 2.650654, 1, 0, 0.4392157, 1,
1.485868, -1.028984, 3.76704, 1, 0, 0.4313726, 1,
1.489143, -0.4916955, 2.382066, 1, 0, 0.427451, 1,
1.493468, 0.08503237, 3.342191, 1, 0, 0.4196078, 1,
1.494665, -0.0329208, 2.185205, 1, 0, 0.4156863, 1,
1.504343, -1.044717, 1.844514, 1, 0, 0.4078431, 1,
1.508287, 0.438899, 0.9675959, 1, 0, 0.4039216, 1,
1.508989, 1.459357, -0.614907, 1, 0, 0.3960784, 1,
1.51034, 0.8564432, 0.3812481, 1, 0, 0.3882353, 1,
1.541245, -0.7548929, 3.176464, 1, 0, 0.3843137, 1,
1.542248, -0.2558154, 0.3322753, 1, 0, 0.3764706, 1,
1.575802, 2.07028, 0.646383, 1, 0, 0.372549, 1,
1.593328, -1.537967, 1.319843, 1, 0, 0.3647059, 1,
1.595979, -1.182365, 1.592575, 1, 0, 0.3607843, 1,
1.611275, -0.2736897, 0.3369856, 1, 0, 0.3529412, 1,
1.613142, 0.4482927, 1.989601, 1, 0, 0.3490196, 1,
1.618279, -0.8362856, 2.192828, 1, 0, 0.3411765, 1,
1.623979, 1.184792, -0.5631661, 1, 0, 0.3372549, 1,
1.63057, -0.5808352, 2.968508, 1, 0, 0.3294118, 1,
1.639851, -1.329004, 3.744839, 1, 0, 0.3254902, 1,
1.658145, 0.3070889, -0.04874497, 1, 0, 0.3176471, 1,
1.659853, -0.2176906, 1.434237, 1, 0, 0.3137255, 1,
1.664619, -0.5729253, 2.520792, 1, 0, 0.3058824, 1,
1.685346, -0.5060425, 1.398893, 1, 0, 0.2980392, 1,
1.689245, 0.2665069, 1.858399, 1, 0, 0.2941177, 1,
1.695622, -1.123106, 1.861588, 1, 0, 0.2862745, 1,
1.699176, 0.8491939, 1.894984, 1, 0, 0.282353, 1,
1.699251, 0.6197218, 1.065783, 1, 0, 0.2745098, 1,
1.710304, 0.8814278, -0.3996294, 1, 0, 0.2705882, 1,
1.712695, 0.8618382, -0.1755823, 1, 0, 0.2627451, 1,
1.72833, -0.439877, 2.2337, 1, 0, 0.2588235, 1,
1.747571, -0.9395122, 3.294515, 1, 0, 0.2509804, 1,
1.74844, 0.9506304, 0.04678791, 1, 0, 0.2470588, 1,
1.760467, -0.1786522, 2.225182, 1, 0, 0.2392157, 1,
1.766587, 1.025515, 1.085411, 1, 0, 0.2352941, 1,
1.773493, -0.6448717, 3.057952, 1, 0, 0.227451, 1,
1.77406, -0.8697678, 2.282765, 1, 0, 0.2235294, 1,
1.780213, -0.003660147, 1.842169, 1, 0, 0.2156863, 1,
1.806111, 1.911501, 0.158833, 1, 0, 0.2117647, 1,
1.817936, 0.08524182, 0.8658606, 1, 0, 0.2039216, 1,
1.821179, 0.5234079, 2.014565, 1, 0, 0.1960784, 1,
1.82427, -0.1464227, 1.275321, 1, 0, 0.1921569, 1,
1.860509, 0.3443369, 0.5259504, 1, 0, 0.1843137, 1,
1.873567, -0.3862645, 2.643111, 1, 0, 0.1803922, 1,
1.879548, -0.3022249, 1.628363, 1, 0, 0.172549, 1,
1.903998, 1.352886, 1.911944, 1, 0, 0.1686275, 1,
1.906098, 0.2506154, 3.282243, 1, 0, 0.1607843, 1,
1.909699, 0.8382764, 0.5855854, 1, 0, 0.1568628, 1,
1.911632, -1.512355, 2.324646, 1, 0, 0.1490196, 1,
1.921091, -0.1345302, 0.6237218, 1, 0, 0.145098, 1,
1.951247, -0.7500182, 1.247903, 1, 0, 0.1372549, 1,
1.961225, 0.05402441, 1.570463, 1, 0, 0.1333333, 1,
1.962663, 0.6452358, 2.106463, 1, 0, 0.1254902, 1,
1.964084, 1.503021, 1.857365, 1, 0, 0.1215686, 1,
2.005195, -0.4331633, 2.58948, 1, 0, 0.1137255, 1,
2.020852, -1.438166, 0.6440204, 1, 0, 0.1098039, 1,
2.055742, 0.7993035, 1.980159, 1, 0, 0.1019608, 1,
2.103547, 0.7070314, 2.497652, 1, 0, 0.09411765, 1,
2.104846, 0.4335644, 2.092208, 1, 0, 0.09019608, 1,
2.110077, -1.503381, 2.207276, 1, 0, 0.08235294, 1,
2.113024, 0.6288208, 1.043056, 1, 0, 0.07843138, 1,
2.175437, -0.5087845, 3.006258, 1, 0, 0.07058824, 1,
2.224133, 0.1844011, 0.702552, 1, 0, 0.06666667, 1,
2.243505, -0.2349415, 2.504827, 1, 0, 0.05882353, 1,
2.309296, 1.07138, 1.515186, 1, 0, 0.05490196, 1,
2.320337, 0.5894532, 3.545134, 1, 0, 0.04705882, 1,
2.323022, 0.6330932, 0.7503161, 1, 0, 0.04313726, 1,
2.36986, 0.909566, 0.755691, 1, 0, 0.03529412, 1,
2.429991, 1.105159, -0.01706165, 1, 0, 0.03137255, 1,
2.447519, -1.661809, 2.72426, 1, 0, 0.02352941, 1,
2.665267, 0.7295817, -0.2777394, 1, 0, 0.01960784, 1,
2.716505, -0.3235781, 2.06554, 1, 0, 0.01176471, 1,
3.395147, 0.4021656, 0.7583044, 1, 0, 0.007843138, 1
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
-0.009685159, -3.885557, -7.256352, 0, -0.5, 0.5, 0.5,
-0.009685159, -3.885557, -7.256352, 1, -0.5, 0.5, 0.5,
-0.009685159, -3.885557, -7.256352, 1, 1.5, 0.5, 0.5,
-0.009685159, -3.885557, -7.256352, 0, 1.5, 0.5, 0.5
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
-4.568755, 0.09632802, -7.256352, 0, -0.5, 0.5, 0.5,
-4.568755, 0.09632802, -7.256352, 1, -0.5, 0.5, 0.5,
-4.568755, 0.09632802, -7.256352, 1, 1.5, 0.5, 0.5,
-4.568755, 0.09632802, -7.256352, 0, 1.5, 0.5, 0.5
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
-4.568755, -3.885557, -0.1568851, 0, -0.5, 0.5, 0.5,
-4.568755, -3.885557, -0.1568851, 1, -0.5, 0.5, 0.5,
-4.568755, -3.885557, -0.1568851, 1, 1.5, 0.5, 0.5,
-4.568755, -3.885557, -0.1568851, 0, 1.5, 0.5, 0.5
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
-3, -2.966661, -5.618014,
3, -2.966661, -5.618014,
-3, -2.966661, -5.618014,
-3, -3.11981, -5.89107,
-2, -2.966661, -5.618014,
-2, -3.11981, -5.89107,
-1, -2.966661, -5.618014,
-1, -3.11981, -5.89107,
0, -2.966661, -5.618014,
0, -3.11981, -5.89107,
1, -2.966661, -5.618014,
1, -3.11981, -5.89107,
2, -2.966661, -5.618014,
2, -3.11981, -5.89107,
3, -2.966661, -5.618014,
3, -3.11981, -5.89107
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
-3, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
-3, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
-3, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
-3, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
-2, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
-2, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
-2, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
-2, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
-1, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
-1, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
-1, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
-1, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
0, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
0, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
0, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
0, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
1, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
1, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
1, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
1, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
2, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
2, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
2, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
2, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5,
3, -3.426109, -6.437183, 0, -0.5, 0.5, 0.5,
3, -3.426109, -6.437183, 1, -0.5, 0.5, 0.5,
3, -3.426109, -6.437183, 1, 1.5, 0.5, 0.5,
3, -3.426109, -6.437183, 0, 1.5, 0.5, 0.5
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
-3.516662, -2, -5.618014,
-3.516662, 3, -5.618014,
-3.516662, -2, -5.618014,
-3.692011, -2, -5.89107,
-3.516662, -1, -5.618014,
-3.692011, -1, -5.89107,
-3.516662, 0, -5.618014,
-3.692011, 0, -5.89107,
-3.516662, 1, -5.618014,
-3.692011, 1, -5.89107,
-3.516662, 2, -5.618014,
-3.692011, 2, -5.89107,
-3.516662, 3, -5.618014,
-3.692011, 3, -5.89107
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
-4.042708, -2, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, -2, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, -2, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, -2, -6.437183, 0, 1.5, 0.5, 0.5,
-4.042708, -1, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, -1, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, -1, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, -1, -6.437183, 0, 1.5, 0.5, 0.5,
-4.042708, 0, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, 0, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, 0, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, 0, -6.437183, 0, 1.5, 0.5, 0.5,
-4.042708, 1, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, 1, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, 1, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, 1, -6.437183, 0, 1.5, 0.5, 0.5,
-4.042708, 2, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, 2, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, 2, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, 2, -6.437183, 0, 1.5, 0.5, 0.5,
-4.042708, 3, -6.437183, 0, -0.5, 0.5, 0.5,
-4.042708, 3, -6.437183, 1, -0.5, 0.5, 0.5,
-4.042708, 3, -6.437183, 1, 1.5, 0.5, 0.5,
-4.042708, 3, -6.437183, 0, 1.5, 0.5, 0.5
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
-3.516662, -2.966661, -4,
-3.516662, -2.966661, 4,
-3.516662, -2.966661, -4,
-3.692011, -3.11981, -4,
-3.516662, -2.966661, -2,
-3.692011, -3.11981, -2,
-3.516662, -2.966661, 0,
-3.692011, -3.11981, 0,
-3.516662, -2.966661, 2,
-3.692011, -3.11981, 2,
-3.516662, -2.966661, 4,
-3.692011, -3.11981, 4
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
-4.042708, -3.426109, -4, 0, -0.5, 0.5, 0.5,
-4.042708, -3.426109, -4, 1, -0.5, 0.5, 0.5,
-4.042708, -3.426109, -4, 1, 1.5, 0.5, 0.5,
-4.042708, -3.426109, -4, 0, 1.5, 0.5, 0.5,
-4.042708, -3.426109, -2, 0, -0.5, 0.5, 0.5,
-4.042708, -3.426109, -2, 1, -0.5, 0.5, 0.5,
-4.042708, -3.426109, -2, 1, 1.5, 0.5, 0.5,
-4.042708, -3.426109, -2, 0, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 0, 0, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 0, 1, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 0, 1, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 0, 0, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 2, 0, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 2, 1, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 2, 1, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 2, 0, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 4, 0, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 4, 1, -0.5, 0.5, 0.5,
-4.042708, -3.426109, 4, 1, 1.5, 0.5, 0.5,
-4.042708, -3.426109, 4, 0, 1.5, 0.5, 0.5
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
-3.516662, -2.966661, -5.618014,
-3.516662, 3.159317, -5.618014,
-3.516662, -2.966661, 5.304244,
-3.516662, 3.159317, 5.304244,
-3.516662, -2.966661, -5.618014,
-3.516662, -2.966661, 5.304244,
-3.516662, 3.159317, -5.618014,
-3.516662, 3.159317, 5.304244,
-3.516662, -2.966661, -5.618014,
3.497292, -2.966661, -5.618014,
-3.516662, -2.966661, 5.304244,
3.497292, -2.966661, 5.304244,
-3.516662, 3.159317, -5.618014,
3.497292, 3.159317, -5.618014,
-3.516662, 3.159317, 5.304244,
3.497292, 3.159317, 5.304244,
3.497292, -2.966661, -5.618014,
3.497292, 3.159317, -5.618014,
3.497292, -2.966661, 5.304244,
3.497292, 3.159317, 5.304244,
3.497292, -2.966661, -5.618014,
3.497292, -2.966661, 5.304244,
3.497292, 3.159317, -5.618014,
3.497292, 3.159317, 5.304244
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
var radius = 7.664414;
var distance = 34.09985;
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
mvMatrix.translate( 0.009685159, -0.09632802, 0.1568851 );
mvMatrix.scale( 1.18149, 1.35275, 0.7587181 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.09985);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
3-ethoxycarbonylamin<-read.table("3-ethoxycarbonylamin.xyz")
```

```
## Error in read.table("3-ethoxycarbonylamin.xyz"): no lines available in input
```

```r
x<-3-ethoxycarbonylamin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylamin' not found
```

```r
y<-3-ethoxycarbonylamin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylamin' not found
```

```r
z<-3-ethoxycarbonylamin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxycarbonylamin' not found
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
-3.414517, 0.3055808, -1.470865, 0, 0, 1, 1, 1,
-3.16787, -0.1824722, -2.408301, 1, 0, 0, 1, 1,
-2.897698, 0.05813023, -1.398407, 1, 0, 0, 1, 1,
-2.736215, 0.5172873, -0.7271051, 1, 0, 0, 1, 1,
-2.662726, 1.962398, -1.422592, 1, 0, 0, 1, 1,
-2.61721, -0.1663973, 0.004519034, 1, 0, 0, 1, 1,
-2.352844, 0.1196715, -1.741547, 0, 0, 0, 1, 1,
-2.221687, -2.877447, -3.175789, 0, 0, 0, 1, 1,
-2.217743, -0.09498824, -1.647612, 0, 0, 0, 1, 1,
-2.199175, 1.669581, 0.4895246, 0, 0, 0, 1, 1,
-2.140654, 2.178705, 0.2371932, 0, 0, 0, 1, 1,
-2.099358, 1.028534, -0.6538675, 0, 0, 0, 1, 1,
-2.092253, 0.814034, -2.16085, 0, 0, 0, 1, 1,
-2.062867, 0.3282418, -1.488487, 1, 1, 1, 1, 1,
-2.042641, -1.915164, -0.8720271, 1, 1, 1, 1, 1,
-2.008169, -0.9817011, -2.712327, 1, 1, 1, 1, 1,
-1.979214, 2.331876, -1.585199, 1, 1, 1, 1, 1,
-1.978988, -0.7296655, -1.902416, 1, 1, 1, 1, 1,
-1.927319, -1.049611, -1.796527, 1, 1, 1, 1, 1,
-1.918263, -0.4935736, -1.448251, 1, 1, 1, 1, 1,
-1.907688, -0.09250547, -0.6616662, 1, 1, 1, 1, 1,
-1.891932, 0.04083917, -0.2751696, 1, 1, 1, 1, 1,
-1.872223, -2.09431, -2.80787, 1, 1, 1, 1, 1,
-1.848117, 1.305253, -0.9380211, 1, 1, 1, 1, 1,
-1.832834, 0.9436681, -1.473432, 1, 1, 1, 1, 1,
-1.817623, -0.2770022, 1.385061, 1, 1, 1, 1, 1,
-1.809458, -0.2897825, -0.7125572, 1, 1, 1, 1, 1,
-1.794289, -0.6980626, -0.05438265, 1, 1, 1, 1, 1,
-1.790215, 0.3826618, -1.762041, 0, 0, 1, 1, 1,
-1.781116, 0.7485381, -2.054751, 1, 0, 0, 1, 1,
-1.738128, -0.198066, -1.065313, 1, 0, 0, 1, 1,
-1.716191, -1.188318, -2.69294, 1, 0, 0, 1, 1,
-1.704234, 1.973658, -1.002257, 1, 0, 0, 1, 1,
-1.703656, -1.140696, -2.24511, 1, 0, 0, 1, 1,
-1.696831, 0.1016574, -1.004593, 0, 0, 0, 1, 1,
-1.696451, 0.9858488, -2.088492, 0, 0, 0, 1, 1,
-1.688111, 2.650513, -0.4213804, 0, 0, 0, 1, 1,
-1.685836, -0.1265686, -2.513944, 0, 0, 0, 1, 1,
-1.682683, -0.9211941, -0.9821122, 0, 0, 0, 1, 1,
-1.659049, 0.9450137, -1.908664, 0, 0, 0, 1, 1,
-1.649183, 0.498936, -0.234391, 0, 0, 0, 1, 1,
-1.639938, -2.094684, -3.005901, 1, 1, 1, 1, 1,
-1.631347, -1.158928, -1.253927, 1, 1, 1, 1, 1,
-1.612985, 2.363992, -1.352711, 1, 1, 1, 1, 1,
-1.605499, 1.834149, -0.3330109, 1, 1, 1, 1, 1,
-1.603762, 1.446843, -1.864631, 1, 1, 1, 1, 1,
-1.600544, -0.1553914, -2.261879, 1, 1, 1, 1, 1,
-1.599679, -0.2870557, -2.240395, 1, 1, 1, 1, 1,
-1.597391, -0.4186681, -0.3835065, 1, 1, 1, 1, 1,
-1.59646, -1.102649, -2.172594, 1, 1, 1, 1, 1,
-1.592442, 0.8790503, -0.4080088, 1, 1, 1, 1, 1,
-1.583581, 0.8779452, -1.390616, 1, 1, 1, 1, 1,
-1.580059, 1.915586, -1.749866, 1, 1, 1, 1, 1,
-1.560616, -1.029834, -1.823328, 1, 1, 1, 1, 1,
-1.559115, -0.5297799, -1.284284, 1, 1, 1, 1, 1,
-1.543818, 1.612985, -0.3159711, 1, 1, 1, 1, 1,
-1.537416, -0.04217163, -0.971245, 0, 0, 1, 1, 1,
-1.534111, -0.2275361, -0.480923, 1, 0, 0, 1, 1,
-1.515544, -0.6122507, -2.731217, 1, 0, 0, 1, 1,
-1.511548, 1.316762, -1.490737, 1, 0, 0, 1, 1,
-1.497628, 0.5742993, -1.042323, 1, 0, 0, 1, 1,
-1.495948, -1.501889, -2.484946, 1, 0, 0, 1, 1,
-1.493536, 0.8309245, -0.5776601, 0, 0, 0, 1, 1,
-1.486936, 0.002746595, -1.453553, 0, 0, 0, 1, 1,
-1.480205, 0.04099244, -3.028218, 0, 0, 0, 1, 1,
-1.476746, 0.7652015, -2.202827, 0, 0, 0, 1, 1,
-1.474606, 1.243408, -2.174623, 0, 0, 0, 1, 1,
-1.457124, 0.3796846, -2.789203, 0, 0, 0, 1, 1,
-1.449562, -0.9118019, -2.187976, 0, 0, 0, 1, 1,
-1.44901, 0.1194739, -1.663991, 1, 1, 1, 1, 1,
-1.438169, -0.5017968, -3.337036, 1, 1, 1, 1, 1,
-1.425338, 1.874708, -1.189022, 1, 1, 1, 1, 1,
-1.417548, 0.8323545, -1.097256, 1, 1, 1, 1, 1,
-1.394887, 1.18841, -0.2854352, 1, 1, 1, 1, 1,
-1.38802, 0.5596768, -0.9340214, 1, 1, 1, 1, 1,
-1.385272, 0.7507549, -2.180843, 1, 1, 1, 1, 1,
-1.38407, 0.5191171, -2.576683, 1, 1, 1, 1, 1,
-1.367459, -0.8672106, -2.361023, 1, 1, 1, 1, 1,
-1.35967, -0.274555, -3.128835, 1, 1, 1, 1, 1,
-1.349457, 0.8546774, -0.8283315, 1, 1, 1, 1, 1,
-1.347714, 1.516187, 0.03732721, 1, 1, 1, 1, 1,
-1.344551, 0.8601765, -1.663705, 1, 1, 1, 1, 1,
-1.34061, -1.964753, -3.643469, 1, 1, 1, 1, 1,
-1.334743, 1.542106, -1.647163, 1, 1, 1, 1, 1,
-1.30582, -0.4102942, -3.169446, 0, 0, 1, 1, 1,
-1.300515, -2.257648, -2.867345, 1, 0, 0, 1, 1,
-1.289015, -0.3662085, -3.210615, 1, 0, 0, 1, 1,
-1.285054, -0.1414123, -3.673889, 1, 0, 0, 1, 1,
-1.277107, -0.3078067, -0.9392737, 1, 0, 0, 1, 1,
-1.276263, 0.7358919, -1.650717, 1, 0, 0, 1, 1,
-1.261389, -1.028385, -3.412918, 0, 0, 0, 1, 1,
-1.261041, -0.3291187, -1.107112, 0, 0, 0, 1, 1,
-1.260416, 0.09222962, -2.961833, 0, 0, 0, 1, 1,
-1.255599, -0.08190826, -3.650185, 0, 0, 0, 1, 1,
-1.253973, -0.8569198, -3.327778, 0, 0, 0, 1, 1,
-1.243027, 0.3967028, -2.653304, 0, 0, 0, 1, 1,
-1.242174, 1.717574, -0.8952347, 0, 0, 0, 1, 1,
-1.240951, -0.6166003, -0.8697008, 1, 1, 1, 1, 1,
-1.235278, -1.662993, -3.540877, 1, 1, 1, 1, 1,
-1.232367, 0.2403427, -3.968683, 1, 1, 1, 1, 1,
-1.231495, 1.05571, -1.624898, 1, 1, 1, 1, 1,
-1.229027, -1.130445, -2.112738, 1, 1, 1, 1, 1,
-1.208138, 0.5756811, -0.6709173, 1, 1, 1, 1, 1,
-1.204911, -0.2727888, -1.429556, 1, 1, 1, 1, 1,
-1.203416, -0.5430017, -1.479339, 1, 1, 1, 1, 1,
-1.198511, -0.9049222, -1.16942, 1, 1, 1, 1, 1,
-1.189252, -0.3814253, -2.360085, 1, 1, 1, 1, 1,
-1.17792, -0.110964, -2.952867, 1, 1, 1, 1, 1,
-1.174981, 0.3416593, -0.8356461, 1, 1, 1, 1, 1,
-1.169015, 1.528911, -1.303961, 1, 1, 1, 1, 1,
-1.166027, 0.4687365, -2.375324, 1, 1, 1, 1, 1,
-1.163096, 0.77259, -1.547486, 1, 1, 1, 1, 1,
-1.150041, 0.0655498, -0.5720608, 0, 0, 1, 1, 1,
-1.134723, 1.273705, -2.627649, 1, 0, 0, 1, 1,
-1.122944, 0.8210087, -2.06821, 1, 0, 0, 1, 1,
-1.117802, 0.4738001, 0.3864426, 1, 0, 0, 1, 1,
-1.115799, -0.3961548, -1.898195, 1, 0, 0, 1, 1,
-1.10798, -0.5347288, -0.9100997, 1, 0, 0, 1, 1,
-1.104725, 0.1143728, -2.977511, 0, 0, 0, 1, 1,
-1.100029, 0.8474058, -0.1428852, 0, 0, 0, 1, 1,
-1.089123, 0.7260457, -1.993815, 0, 0, 0, 1, 1,
-1.084221, 1.343868, -0.01872618, 0, 0, 0, 1, 1,
-1.083529, 0.07372844, -2.528858, 0, 0, 0, 1, 1,
-1.08162, 1.269883, -0.06199433, 0, 0, 0, 1, 1,
-1.081484, -0.9973444, -2.592108, 0, 0, 0, 1, 1,
-1.079238, -1.504791, -1.993559, 1, 1, 1, 1, 1,
-1.073231, 0.4240039, -0.6597047, 1, 1, 1, 1, 1,
-1.067459, 1.009414, -0.3808817, 1, 1, 1, 1, 1,
-1.066445, -0.6282355, -1.598705, 1, 1, 1, 1, 1,
-1.056648, 0.6933753, -0.232128, 1, 1, 1, 1, 1,
-1.050095, -2.05908, -1.700173, 1, 1, 1, 1, 1,
-1.048721, -0.9567979, -2.456728, 1, 1, 1, 1, 1,
-1.044072, 0.251072, 1.078085, 1, 1, 1, 1, 1,
-1.038804, 0.5592862, 0.7319769, 1, 1, 1, 1, 1,
-1.035668, 0.1266823, -1.234817, 1, 1, 1, 1, 1,
-1.030199, -0.4797757, -1.793375, 1, 1, 1, 1, 1,
-1.030025, -0.5292867, -1.651917, 1, 1, 1, 1, 1,
-1.02561, -0.6949832, -3.108077, 1, 1, 1, 1, 1,
-1.022948, 0.3440414, -1.975701, 1, 1, 1, 1, 1,
-1.021827, 1.201386, -0.6512417, 1, 1, 1, 1, 1,
-1.021285, 0.5498705, -2.171316, 0, 0, 1, 1, 1,
-1.020796, 2.599981, -0.9686952, 1, 0, 0, 1, 1,
-1.013559, 0.102462, -2.592264, 1, 0, 0, 1, 1,
-1.011759, 0.4144398, -0.9191763, 1, 0, 0, 1, 1,
-1.006118, 0.703014, -1.210371, 1, 0, 0, 1, 1,
-1.001224, 2.185669, 1.034397, 1, 0, 0, 1, 1,
-0.9899666, 0.08381079, -2.650774, 0, 0, 0, 1, 1,
-0.9841498, 0.8268467, -1.849324, 0, 0, 0, 1, 1,
-0.9800273, -0.342344, -2.939375, 0, 0, 0, 1, 1,
-0.9789069, -0.2434383, -2.818997, 0, 0, 0, 1, 1,
-0.9710153, -0.4259022, -1.394646, 0, 0, 0, 1, 1,
-0.9708593, -0.486874, -2.717108, 0, 0, 0, 1, 1,
-0.9677934, 1.972012, -0.6884094, 0, 0, 0, 1, 1,
-0.9658694, 1.145431, 0.2499522, 1, 1, 1, 1, 1,
-0.9620733, -0.9410683, -0.4670567, 1, 1, 1, 1, 1,
-0.9612563, 0.5509319, -1.068758, 1, 1, 1, 1, 1,
-0.9585354, -0.2094445, -3.773649, 1, 1, 1, 1, 1,
-0.9571261, -1.290587, -3.549049, 1, 1, 1, 1, 1,
-0.9558062, -0.1741501, -1.867748, 1, 1, 1, 1, 1,
-0.9543078, 0.6824169, -0.4959755, 1, 1, 1, 1, 1,
-0.9512641, 0.8349952, 0.7614416, 1, 1, 1, 1, 1,
-0.9510229, 0.5711857, 0.8465056, 1, 1, 1, 1, 1,
-0.949973, 0.5817351, 0.6740415, 1, 1, 1, 1, 1,
-0.9409459, -0.194567, -0.7795016, 1, 1, 1, 1, 1,
-0.9288202, -0.03093514, -2.399986, 1, 1, 1, 1, 1,
-0.9275649, -2.096442, -2.770425, 1, 1, 1, 1, 1,
-0.9256455, 0.8283927, -0.06963456, 1, 1, 1, 1, 1,
-0.9219147, -0.5067341, -3.058938, 1, 1, 1, 1, 1,
-0.9064305, 0.1588779, -2.439921, 0, 0, 1, 1, 1,
-0.9020788, 1.322478, -0.1491785, 1, 0, 0, 1, 1,
-0.8946716, -0.8877137, -2.614546, 1, 0, 0, 1, 1,
-0.8941621, -0.26791, -1.110888, 1, 0, 0, 1, 1,
-0.8865545, -0.1787022, -0.1062181, 1, 0, 0, 1, 1,
-0.8842911, -0.08002368, -3.202019, 1, 0, 0, 1, 1,
-0.8822722, -0.9183007, -2.336495, 0, 0, 0, 1, 1,
-0.8795511, -1.01648, -4.256752, 0, 0, 0, 1, 1,
-0.8746813, -0.6278976, -2.323438, 0, 0, 0, 1, 1,
-0.8741722, -0.003121024, -2.09291, 0, 0, 0, 1, 1,
-0.870431, -1.931786, -1.194305, 0, 0, 0, 1, 1,
-0.8678417, 1.924085, 0.3354866, 0, 0, 0, 1, 1,
-0.8668488, 1.796387, -0.2268305, 0, 0, 0, 1, 1,
-0.860086, 0.4945619, -0.8785279, 1, 1, 1, 1, 1,
-0.8600169, -0.591295, -1.821816, 1, 1, 1, 1, 1,
-0.859656, 0.878819, -0.1547572, 1, 1, 1, 1, 1,
-0.8590102, -0.683508, -3.529223, 1, 1, 1, 1, 1,
-0.8508357, -0.3004361, -2.247358, 1, 1, 1, 1, 1,
-0.8472147, 0.5882801, -0.718693, 1, 1, 1, 1, 1,
-0.8438162, 0.7969798, -1.288511, 1, 1, 1, 1, 1,
-0.8373884, -1.164375, -1.398628, 1, 1, 1, 1, 1,
-0.8183907, 0.6115713, -2.973696, 1, 1, 1, 1, 1,
-0.8157674, 1.966263, -1.027357, 1, 1, 1, 1, 1,
-0.8140041, -0.608791, -1.025723, 1, 1, 1, 1, 1,
-0.8082678, 1.292109, 0.9161116, 1, 1, 1, 1, 1,
-0.805633, 0.6384075, -0.1471395, 1, 1, 1, 1, 1,
-0.8038726, -0.2409184, -2.014493, 1, 1, 1, 1, 1,
-0.803368, -0.2812766, -1.352907, 1, 1, 1, 1, 1,
-0.8032114, -0.513408, -2.548971, 0, 0, 1, 1, 1,
-0.7954136, 1.846006, -0.3055071, 1, 0, 0, 1, 1,
-0.7927661, -0.9768776, -1.198043, 1, 0, 0, 1, 1,
-0.7806403, 2.036226, -0.455964, 1, 0, 0, 1, 1,
-0.7744186, -1.035119, -3.275365, 1, 0, 0, 1, 1,
-0.7722396, -0.3344156, -3.130079, 1, 0, 0, 1, 1,
-0.7681823, -1.127201, -2.042991, 0, 0, 0, 1, 1,
-0.765097, -1.573579, -1.545905, 0, 0, 0, 1, 1,
-0.7558254, 0.370403, -0.8820537, 0, 0, 0, 1, 1,
-0.7546135, -0.7007064, -1.560283, 0, 0, 0, 1, 1,
-0.751948, -1.608852, -2.613627, 0, 0, 0, 1, 1,
-0.7513475, 1.018237, -1.440776, 0, 0, 0, 1, 1,
-0.7500057, 0.1058797, -0.6052983, 0, 0, 0, 1, 1,
-0.7498122, 0.0009554619, -4.007887, 1, 1, 1, 1, 1,
-0.7479546, 1.060961, 0.1222401, 1, 1, 1, 1, 1,
-0.7443652, 0.4817461, -1.616033, 1, 1, 1, 1, 1,
-0.7336975, -0.9041303, -2.595521, 1, 1, 1, 1, 1,
-0.7325602, 1.983194, 0.3795111, 1, 1, 1, 1, 1,
-0.7286288, 1.374245, -0.4402936, 1, 1, 1, 1, 1,
-0.7228521, -0.5882102, -2.899614, 1, 1, 1, 1, 1,
-0.7222111, 0.1851929, -2.507499, 1, 1, 1, 1, 1,
-0.7153925, 1.559327, -1.933765, 1, 1, 1, 1, 1,
-0.7127731, 0.7804349, -0.4428627, 1, 1, 1, 1, 1,
-0.7099314, -1.162877, -2.384254, 1, 1, 1, 1, 1,
-0.70818, 0.2696379, -1.392866, 1, 1, 1, 1, 1,
-0.7063113, 1.808233, 0.04541032, 1, 1, 1, 1, 1,
-0.7039021, 1.882491, -0.8261467, 1, 1, 1, 1, 1,
-0.7012954, 1.270333, 0.6464276, 1, 1, 1, 1, 1,
-0.7004594, -0.3366652, -0.7513211, 0, 0, 1, 1, 1,
-0.700408, -0.05954645, -3.007734, 1, 0, 0, 1, 1,
-0.6980757, 0.5555439, -2.210081, 1, 0, 0, 1, 1,
-0.694769, -0.2262553, -0.4956289, 1, 0, 0, 1, 1,
-0.6946445, -0.6550063, -2.137649, 1, 0, 0, 1, 1,
-0.6924148, -0.05349854, -0.5177063, 1, 0, 0, 1, 1,
-0.6920447, 1.471782, 0.6578596, 0, 0, 0, 1, 1,
-0.6911402, 1.30933, 1.147359, 0, 0, 0, 1, 1,
-0.6902385, 2.008332, 0.315969, 0, 0, 0, 1, 1,
-0.6880118, -0.1014551, -2.324392, 0, 0, 0, 1, 1,
-0.6832322, -1.182387, -2.436027, 0, 0, 0, 1, 1,
-0.6695074, -1.304892, -3.246059, 0, 0, 0, 1, 1,
-0.6543161, -1.069838, -1.046857, 0, 0, 0, 1, 1,
-0.6536486, 0.6948838, -1.421863, 1, 1, 1, 1, 1,
-0.6524, 1.266845, -1.362085, 1, 1, 1, 1, 1,
-0.6430051, -0.4931207, -2.248752, 1, 1, 1, 1, 1,
-0.6361846, 0.09658483, -2.988455, 1, 1, 1, 1, 1,
-0.6350982, -0.4273668, -1.363727, 1, 1, 1, 1, 1,
-0.6347087, 0.5558588, -0.3380171, 1, 1, 1, 1, 1,
-0.6338018, -1.236911, -3.228286, 1, 1, 1, 1, 1,
-0.6332667, 0.3946466, -0.7036479, 1, 1, 1, 1, 1,
-0.6248472, 2.147179, -1.666623, 1, 1, 1, 1, 1,
-0.6195161, -0.1079132, -3.177113, 1, 1, 1, 1, 1,
-0.6190525, 0.5317228, -2.328321, 1, 1, 1, 1, 1,
-0.6189547, -0.2840448, -2.329493, 1, 1, 1, 1, 1,
-0.6151502, 1.327122, -1.342711, 1, 1, 1, 1, 1,
-0.614186, 1.260337, -1.638978, 1, 1, 1, 1, 1,
-0.6127949, -1.559277, -1.839931, 1, 1, 1, 1, 1,
-0.6065679, -1.182227, -2.106483, 0, 0, 1, 1, 1,
-0.6052032, 0.7046428, -0.1517252, 1, 0, 0, 1, 1,
-0.6029794, 1.29073, -1.498334, 1, 0, 0, 1, 1,
-0.6021615, -1.295834, -2.915833, 1, 0, 0, 1, 1,
-0.6020204, 1.295373, 0.4555356, 1, 0, 0, 1, 1,
-0.6014407, 1.028109, -1.519113, 1, 0, 0, 1, 1,
-0.5988959, 0.7635797, -0.3163019, 0, 0, 0, 1, 1,
-0.5955329, 0.1613555, -2.100895, 0, 0, 0, 1, 1,
-0.5915645, -1.334893, -0.8176954, 0, 0, 0, 1, 1,
-0.5838735, 1.428783, -0.2788906, 0, 0, 0, 1, 1,
-0.582022, -1.018476, -1.180745, 0, 0, 0, 1, 1,
-0.5809163, -0.4681851, -1.579949, 0, 0, 0, 1, 1,
-0.5767789, -0.9498246, -2.202791, 0, 0, 0, 1, 1,
-0.5737931, -0.01365872, -1.053817, 1, 1, 1, 1, 1,
-0.5727155, -0.5368493, -3.052166, 1, 1, 1, 1, 1,
-0.5711383, -0.7820195, -2.827017, 1, 1, 1, 1, 1,
-0.5667303, 0.1365419, -1.074633, 1, 1, 1, 1, 1,
-0.5615057, 1.306236, -0.2379726, 1, 1, 1, 1, 1,
-0.5590435, -1.286159, -2.194343, 1, 1, 1, 1, 1,
-0.5578809, -0.3275313, -2.119765, 1, 1, 1, 1, 1,
-0.5577108, 0.3819926, 0.6366001, 1, 1, 1, 1, 1,
-0.5564108, -1.925685, -3.407294, 1, 1, 1, 1, 1,
-0.5544584, 0.2912166, -2.365822, 1, 1, 1, 1, 1,
-0.5528321, -1.384299, -0.3757277, 1, 1, 1, 1, 1,
-0.5471648, -2.161463, -2.073954, 1, 1, 1, 1, 1,
-0.5462441, -1.87836, -0.6756914, 1, 1, 1, 1, 1,
-0.5454974, 0.389538, -1.247738, 1, 1, 1, 1, 1,
-0.544692, 1.030951, -1.37778, 1, 1, 1, 1, 1,
-0.54432, 1.090333, -0.3010802, 0, 0, 1, 1, 1,
-0.5403842, -0.9763802, -4.883629, 1, 0, 0, 1, 1,
-0.5369381, -0.3061602, -1.733498, 1, 0, 0, 1, 1,
-0.5363243, 2.834884, -2.209053, 1, 0, 0, 1, 1,
-0.5348901, 0.2160008, 0.3675101, 1, 0, 0, 1, 1,
-0.530621, 1.078051, -0.790731, 1, 0, 0, 1, 1,
-0.5304924, 0.7934809, -1.357, 0, 0, 0, 1, 1,
-0.5290174, 0.783492, -0.6268895, 0, 0, 0, 1, 1,
-0.5266392, -0.9455072, -1.442475, 0, 0, 0, 1, 1,
-0.524222, -0.2905192, -0.8021984, 0, 0, 0, 1, 1,
-0.5237547, 0.5928566, -0.7645006, 0, 0, 0, 1, 1,
-0.5222769, 1.111464, -0.7390006, 0, 0, 0, 1, 1,
-0.5201273, -0.1086082, -2.013258, 0, 0, 0, 1, 1,
-0.5144376, -0.2946076, -2.966766, 1, 1, 1, 1, 1,
-0.5084567, -0.6070814, -2.155262, 1, 1, 1, 1, 1,
-0.5032416, -0.7892672, -1.737345, 1, 1, 1, 1, 1,
-0.5025281, 0.6159115, -0.4425921, 1, 1, 1, 1, 1,
-0.498847, -0.7853478, -1.972638, 1, 1, 1, 1, 1,
-0.4980467, -0.08293448, -2.490639, 1, 1, 1, 1, 1,
-0.497211, -2.111463, -2.661193, 1, 1, 1, 1, 1,
-0.4947107, -0.5310827, -3.177599, 1, 1, 1, 1, 1,
-0.4942428, -0.1782185, -1.627378, 1, 1, 1, 1, 1,
-0.4938601, 0.4621305, -1.409949, 1, 1, 1, 1, 1,
-0.4869778, 1.696121, 1.424949, 1, 1, 1, 1, 1,
-0.4768406, -0.6770487, -4.443009, 1, 1, 1, 1, 1,
-0.4762836, 0.3259156, -2.415526, 1, 1, 1, 1, 1,
-0.4705149, 1.606035, -2.259168, 1, 1, 1, 1, 1,
-0.465769, 0.3697765, -2.265423, 1, 1, 1, 1, 1,
-0.4620738, 1.443053, -0.141989, 0, 0, 1, 1, 1,
-0.4616553, -0.09258109, -3.198805, 1, 0, 0, 1, 1,
-0.4456242, 0.6484265, -0.5128041, 1, 0, 0, 1, 1,
-0.4444744, 0.2426981, 1.002115, 1, 0, 0, 1, 1,
-0.4404535, 0.9261613, 0.3166237, 1, 0, 0, 1, 1,
-0.4401153, -1.0064, -3.260269, 1, 0, 0, 1, 1,
-0.4378898, -1.094267, -2.488162, 0, 0, 0, 1, 1,
-0.4339136, -1.476025, -2.745454, 0, 0, 0, 1, 1,
-0.4332636, 0.7802219, 0.01708426, 0, 0, 0, 1, 1,
-0.4331473, -0.266071, -2.430035, 0, 0, 0, 1, 1,
-0.4275213, -0.3254696, -1.358771, 0, 0, 0, 1, 1,
-0.4258057, 0.1372563, -2.326744, 0, 0, 0, 1, 1,
-0.424883, -0.7750447, -1.29284, 0, 0, 0, 1, 1,
-0.4241765, 0.18642, -1.02705, 1, 1, 1, 1, 1,
-0.4234744, -0.1409326, -2.24505, 1, 1, 1, 1, 1,
-0.4136556, 0.6113633, 0.07076414, 1, 1, 1, 1, 1,
-0.413419, -0.4151952, -2.460143, 1, 1, 1, 1, 1,
-0.4116054, 0.5700539, -0.7811075, 1, 1, 1, 1, 1,
-0.4023531, -0.2654814, 0.467918, 1, 1, 1, 1, 1,
-0.3998632, 0.7025033, -0.922572, 1, 1, 1, 1, 1,
-0.399, 0.3547935, -2.450189, 1, 1, 1, 1, 1,
-0.3950934, -1.121683, -0.8521171, 1, 1, 1, 1, 1,
-0.3910242, 0.2041967, 0.2624523, 1, 1, 1, 1, 1,
-0.3781977, 1.136421, -0.9802624, 1, 1, 1, 1, 1,
-0.3712837, -1.762181, -4.367183, 1, 1, 1, 1, 1,
-0.3712417, 0.5435912, -1.589187, 1, 1, 1, 1, 1,
-0.3700258, -0.6466228, -2.072712, 1, 1, 1, 1, 1,
-0.3665134, -0.3273603, -3.639485, 1, 1, 1, 1, 1,
-0.3657271, 0.9526392, -2.056144, 0, 0, 1, 1, 1,
-0.3632885, 1.001379, -1.127413, 1, 0, 0, 1, 1,
-0.3518665, -0.7373367, -4.666331, 1, 0, 0, 1, 1,
-0.3496241, 1.220544, -1.28433, 1, 0, 0, 1, 1,
-0.3494919, -1.008404, -3.328646, 1, 0, 0, 1, 1,
-0.3491551, 1.425101, -0.1041038, 1, 0, 0, 1, 1,
-0.3419997, -0.4630355, -2.635057, 0, 0, 0, 1, 1,
-0.3389638, -1.648539, -2.149769, 0, 0, 0, 1, 1,
-0.3352039, 0.6084682, -1.214625, 0, 0, 0, 1, 1,
-0.3337384, 0.9230605, 0.5856105, 0, 0, 0, 1, 1,
-0.3331275, -0.7258158, -2.88783, 0, 0, 0, 1, 1,
-0.329403, 0.6519259, 1.953772, 0, 0, 0, 1, 1,
-0.3283694, -0.7082432, -2.780661, 0, 0, 0, 1, 1,
-0.3259361, -0.8352742, -2.412749, 1, 1, 1, 1, 1,
-0.3245048, 0.8539277, -0.2735905, 1, 1, 1, 1, 1,
-0.3225947, 0.1119173, -1.286573, 1, 1, 1, 1, 1,
-0.3191784, 0.6598473, -1.198446, 1, 1, 1, 1, 1,
-0.3179108, -0.3164517, -1.773545, 1, 1, 1, 1, 1,
-0.3176189, -0.7847112, -3.481617, 1, 1, 1, 1, 1,
-0.3167411, 0.8356205, -0.08693565, 1, 1, 1, 1, 1,
-0.3164852, 0.6030084, -1.209355, 1, 1, 1, 1, 1,
-0.3093971, 0.9784631, -0.8533116, 1, 1, 1, 1, 1,
-0.3060285, -0.6065124, -3.098058, 1, 1, 1, 1, 1,
-0.3045487, 1.464239, -0.4506128, 1, 1, 1, 1, 1,
-0.2997754, 0.1932947, -1.200553, 1, 1, 1, 1, 1,
-0.2944002, -0.8916039, -3.960624, 1, 1, 1, 1, 1,
-0.2940365, 0.7680343, -0.02982239, 1, 1, 1, 1, 1,
-0.2807761, -0.5382226, -2.308802, 1, 1, 1, 1, 1,
-0.2800639, -0.02058039, -1.024607, 0, 0, 1, 1, 1,
-0.2800343, -0.6184599, -0.7357646, 1, 0, 0, 1, 1,
-0.2779347, 0.3553206, -0.8544751, 1, 0, 0, 1, 1,
-0.2733715, 0.9121933, 0.5968865, 1, 0, 0, 1, 1,
-0.2726903, -0.08975216, -3.569923, 1, 0, 0, 1, 1,
-0.2659883, -1.343865, -5.458952, 1, 0, 0, 1, 1,
-0.262409, 1.003724, -0.4621907, 0, 0, 0, 1, 1,
-0.2605508, 1.612355, 0.5766253, 0, 0, 0, 1, 1,
-0.2584178, 0.8840646, 0.2470991, 0, 0, 0, 1, 1,
-0.2557396, -0.3981745, -1.709392, 0, 0, 0, 1, 1,
-0.2549536, -1.883277, -2.057544, 0, 0, 0, 1, 1,
-0.2534271, 0.8676978, -0.08078484, 0, 0, 0, 1, 1,
-0.2524247, -0.4741249, -1.700363, 0, 0, 0, 1, 1,
-0.2492894, -1.235436, -3.592965, 1, 1, 1, 1, 1,
-0.2484674, -2.437458, -5.438225, 1, 1, 1, 1, 1,
-0.2460313, 1.263765, -0.8957977, 1, 1, 1, 1, 1,
-0.2451116, 1.315295, 0.7266831, 1, 1, 1, 1, 1,
-0.2431296, 0.243298, -0.2924306, 1, 1, 1, 1, 1,
-0.242783, -0.09684448, -1.545812, 1, 1, 1, 1, 1,
-0.2401695, 0.5098303, 0.4907183, 1, 1, 1, 1, 1,
-0.2393864, 0.7791281, -1.687777, 1, 1, 1, 1, 1,
-0.2372551, -1.080334, -2.06408, 1, 1, 1, 1, 1,
-0.2369328, 0.2951385, -0.5387956, 1, 1, 1, 1, 1,
-0.2305564, -0.9143484, -2.707139, 1, 1, 1, 1, 1,
-0.2260305, -1.370452, -1.387394, 1, 1, 1, 1, 1,
-0.2249154, 2.297534, -0.7685196, 1, 1, 1, 1, 1,
-0.2247173, 0.7675737, -0.7881594, 1, 1, 1, 1, 1,
-0.2241348, 1.010043, -0.2192014, 1, 1, 1, 1, 1,
-0.2229662, 0.5954548, -0.7723159, 0, 0, 1, 1, 1,
-0.2198055, 1.005641, 0.07509504, 1, 0, 0, 1, 1,
-0.2180897, -0.01375564, -2.105813, 1, 0, 0, 1, 1,
-0.2164962, 0.04228522, -1.034958, 1, 0, 0, 1, 1,
-0.2134759, -0.5829577, -0.8471606, 1, 0, 0, 1, 1,
-0.2088536, -0.5758591, -2.250471, 1, 0, 0, 1, 1,
-0.2078443, 1.891639, 0.1040217, 0, 0, 0, 1, 1,
-0.204574, -1.23318, -3.383698, 0, 0, 0, 1, 1,
-0.2038, -1.405701, -3.443337, 0, 0, 0, 1, 1,
-0.2036884, -1.689706, -4.156863, 0, 0, 0, 1, 1,
-0.1994024, -0.001802557, -3.225091, 0, 0, 0, 1, 1,
-0.1928069, -0.4251734, -3.0109, 0, 0, 0, 1, 1,
-0.1890027, -0.811708, -3.61189, 0, 0, 0, 1, 1,
-0.1844662, 0.7160292, -1.333997, 1, 1, 1, 1, 1,
-0.1837156, 1.367883, 0.8877599, 1, 1, 1, 1, 1,
-0.1790304, 0.1392718, -0.7742009, 1, 1, 1, 1, 1,
-0.1785821, -1.351619, -2.462958, 1, 1, 1, 1, 1,
-0.1776059, 1.423012, -0.2917621, 1, 1, 1, 1, 1,
-0.176268, 0.77823, 0.7409633, 1, 1, 1, 1, 1,
-0.1753034, -1.03105, -4.171011, 1, 1, 1, 1, 1,
-0.1751645, 0.4674716, 0.1290037, 1, 1, 1, 1, 1,
-0.1750712, -0.5170242, -3.96294, 1, 1, 1, 1, 1,
-0.1707667, 0.8420545, -0.1424578, 1, 1, 1, 1, 1,
-0.1634274, 1.06305, -0.2406801, 1, 1, 1, 1, 1,
-0.1613973, -1.331736, -2.535895, 1, 1, 1, 1, 1,
-0.1583253, 0.5155098, 1.529185, 1, 1, 1, 1, 1,
-0.1548321, 0.3051091, -0.6162828, 1, 1, 1, 1, 1,
-0.1501984, -0.6546752, -1.53421, 1, 1, 1, 1, 1,
-0.1492387, -1.981012, -2.145632, 0, 0, 1, 1, 1,
-0.1448375, -0.6265506, -2.024972, 1, 0, 0, 1, 1,
-0.1374829, -0.4604043, -2.933167, 1, 0, 0, 1, 1,
-0.1374206, -0.1865335, -3.323504, 1, 0, 0, 1, 1,
-0.1372738, 0.9022809, -0.4603938, 1, 0, 0, 1, 1,
-0.1316016, -0.6487222, -3.074032, 1, 0, 0, 1, 1,
-0.1312418, 1.919606, -0.469872, 0, 0, 0, 1, 1,
-0.1285179, 0.08267546, -1.479651, 0, 0, 0, 1, 1,
-0.1284153, 0.0384304, -2.124654, 0, 0, 0, 1, 1,
-0.1277026, -0.5208558, -2.258073, 0, 0, 0, 1, 1,
-0.1251222, 1.440824, 0.4102778, 0, 0, 0, 1, 1,
-0.1237169, -0.1662722, -1.520089, 0, 0, 0, 1, 1,
-0.1233225, -0.05277599, -1.04003, 0, 0, 0, 1, 1,
-0.1217545, -0.03431521, -2.882397, 1, 1, 1, 1, 1,
-0.1197731, 0.03373396, -1.898067, 1, 1, 1, 1, 1,
-0.1191503, -0.4518182, -3.483907, 1, 1, 1, 1, 1,
-0.1183773, 0.7221462, 1.043722, 1, 1, 1, 1, 1,
-0.1162642, 0.05597759, -2.149324, 1, 1, 1, 1, 1,
-0.1104378, 0.01543555, 0.1830857, 1, 1, 1, 1, 1,
-0.1034496, 0.1426959, -0.6814837, 1, 1, 1, 1, 1,
-0.1031541, -0.5994288, -2.839875, 1, 1, 1, 1, 1,
-0.1028121, 0.0010981, 1.42088, 1, 1, 1, 1, 1,
-0.1025944, -0.5095459, -3.964989, 1, 1, 1, 1, 1,
-0.1011232, 0.5688151, 0.2288827, 1, 1, 1, 1, 1,
-0.09989971, -0.4323244, -2.876309, 1, 1, 1, 1, 1,
-0.08930518, 0.4991746, -0.4672022, 1, 1, 1, 1, 1,
-0.08877035, 0.4687205, -0.8481231, 1, 1, 1, 1, 1,
-0.08735278, 0.2544417, 1.146793, 1, 1, 1, 1, 1,
-0.07915681, 0.3713329, 0.767305, 0, 0, 1, 1, 1,
-0.07362924, -1.79556, -2.365252, 1, 0, 0, 1, 1,
-0.07358947, 0.03181055, -2.735899, 1, 0, 0, 1, 1,
-0.06232375, -1.073002, -3.321986, 1, 0, 0, 1, 1,
-0.0616015, 0.960135, -0.7991427, 1, 0, 0, 1, 1,
-0.0567116, -1.387692, -4.590093, 1, 0, 0, 1, 1,
-0.05280933, -1.124302, -3.417281, 0, 0, 0, 1, 1,
-0.04842605, 0.05311928, 0.1014114, 0, 0, 0, 1, 1,
-0.04384431, 0.4850101, 1.240034, 0, 0, 0, 1, 1,
-0.04254919, -0.3360002, -2.622251, 0, 0, 0, 1, 1,
-0.04159443, 0.5917484, 0.7979594, 0, 0, 0, 1, 1,
-0.03903699, -1.741247, -3.003066, 0, 0, 0, 1, 1,
-0.03701997, 0.3355144, -0.5785339, 0, 0, 0, 1, 1,
-0.03686389, -0.3444017, -3.407299, 1, 1, 1, 1, 1,
-0.03212231, -0.58029, -2.988766, 1, 1, 1, 1, 1,
-0.03184016, 1.230131, 1.202416, 1, 1, 1, 1, 1,
-0.03055368, -0.2011093, -0.4909114, 1, 1, 1, 1, 1,
-0.02702558, 1.184064, -0.8782926, 1, 1, 1, 1, 1,
-0.01747573, 0.1579538, -0.4668066, 1, 1, 1, 1, 1,
-0.01611497, -0.03011699, -1.689088, 1, 1, 1, 1, 1,
-0.01514367, -0.5209034, -4.251411, 1, 1, 1, 1, 1,
-0.01450096, -1.741068, -3.012222, 1, 1, 1, 1, 1,
-0.009021319, 1.071445, 0.5629796, 1, 1, 1, 1, 1,
-0.008878558, 0.8473399, 1.600688, 1, 1, 1, 1, 1,
-0.006511037, -1.851654, -2.890416, 1, 1, 1, 1, 1,
-0.005826566, -0.2454212, -1.802192, 1, 1, 1, 1, 1,
-0.002043632, -0.1387905, -2.7891, 1, 1, 1, 1, 1,
0.00159429, -0.8409316, 4.681589, 1, 1, 1, 1, 1,
0.002295652, 0.5459592, 0.1162127, 0, 0, 1, 1, 1,
0.00397648, -0.5782024, 2.491896, 1, 0, 0, 1, 1,
0.005151363, 0.8624327, -0.6133807, 1, 0, 0, 1, 1,
0.01011221, 2.018251, 2.341201, 1, 0, 0, 1, 1,
0.01166385, -1.026654, 4.641391, 1, 0, 0, 1, 1,
0.01381377, 0.5551921, -0.8752768, 1, 0, 0, 1, 1,
0.01538488, 0.8830262, 0.3819114, 0, 0, 0, 1, 1,
0.01692852, -0.4541022, 2.413281, 0, 0, 0, 1, 1,
0.01951668, -0.361187, 1.905201, 0, 0, 0, 1, 1,
0.02106175, -0.5908989, 2.76404, 0, 0, 0, 1, 1,
0.02255955, 0.4958548, -1.985696, 0, 0, 0, 1, 1,
0.02292773, -0.02622525, 1.694591, 0, 0, 0, 1, 1,
0.0238492, 0.8415776, -1.229237, 0, 0, 0, 1, 1,
0.02785022, -0.06735418, 3.214793, 1, 1, 1, 1, 1,
0.0324016, 0.3007864, -0.5059556, 1, 1, 1, 1, 1,
0.03605695, 0.987333, -0.1720915, 1, 1, 1, 1, 1,
0.03656971, -0.02701966, 3.149566, 1, 1, 1, 1, 1,
0.03789905, 0.3140932, 0.4522893, 1, 1, 1, 1, 1,
0.03868492, -0.7048801, 5.145182, 1, 1, 1, 1, 1,
0.03953902, -0.9941784, 4.679298, 1, 1, 1, 1, 1,
0.04024835, 0.8180346, -1.024074, 1, 1, 1, 1, 1,
0.04282645, 1.632633, 0.6568149, 1, 1, 1, 1, 1,
0.04864479, -0.2398431, 1.308584, 1, 1, 1, 1, 1,
0.04873019, 0.3651302, -0.3505721, 1, 1, 1, 1, 1,
0.04953895, -1.45045, 2.410782, 1, 1, 1, 1, 1,
0.05008639, -0.4712092, 1.863602, 1, 1, 1, 1, 1,
0.052644, -0.2202903, 3.661108, 1, 1, 1, 1, 1,
0.05802031, -0.5325308, 3.107587, 1, 1, 1, 1, 1,
0.06035008, 1.631202, 0.01279949, 0, 0, 1, 1, 1,
0.0644969, -0.2008105, 1.657879, 1, 0, 0, 1, 1,
0.07090644, 2.419928, -0.6418495, 1, 0, 0, 1, 1,
0.07183674, -0.9505443, 2.812713, 1, 0, 0, 1, 1,
0.07503121, -0.9710872, 3.239157, 1, 0, 0, 1, 1,
0.07596315, -0.6208865, 2.33517, 1, 0, 0, 1, 1,
0.07768419, 0.1850726, -0.9131142, 0, 0, 0, 1, 1,
0.08427398, -1.255145, 2.653609, 0, 0, 0, 1, 1,
0.08436664, -0.200906, 2.431397, 0, 0, 0, 1, 1,
0.0867364, -0.001456872, 2.635365, 0, 0, 0, 1, 1,
0.0888791, 0.1642905, 2.070637, 0, 0, 0, 1, 1,
0.08922403, 0.3354849, -0.1378805, 0, 0, 0, 1, 1,
0.09063914, -1.551645, 0.6464189, 0, 0, 0, 1, 1,
0.09219107, -0.00322782, 1.811136, 1, 1, 1, 1, 1,
0.09219638, 1.08638, 1.292508, 1, 1, 1, 1, 1,
0.09220872, 0.8168981, 0.6706659, 1, 1, 1, 1, 1,
0.09356784, 0.3707827, 1.406286, 1, 1, 1, 1, 1,
0.09658732, -0.1309935, 1.83157, 1, 1, 1, 1, 1,
0.09671694, -0.6920807, 0.9551513, 1, 1, 1, 1, 1,
0.09787302, -0.8615236, 3.359661, 1, 1, 1, 1, 1,
0.09843172, 0.3751183, -0.3284982, 1, 1, 1, 1, 1,
0.09922986, -0.7849386, 4.654584, 1, 1, 1, 1, 1,
0.1005705, 0.02101583, 1.133312, 1, 1, 1, 1, 1,
0.1035255, -0.3438097, 3.558786, 1, 1, 1, 1, 1,
0.1040626, 1.008765, -1.233873, 1, 1, 1, 1, 1,
0.1054986, 0.4535369, -0.108905, 1, 1, 1, 1, 1,
0.1060669, 2.082242, 1.058095, 1, 1, 1, 1, 1,
0.1112272, -0.02064357, 1.587688, 1, 1, 1, 1, 1,
0.1134484, -1.088886, 1.911428, 0, 0, 1, 1, 1,
0.1153287, -1.085409, 3.568475, 1, 0, 0, 1, 1,
0.115354, 1.067065, 0.9959009, 1, 0, 0, 1, 1,
0.1163963, 0.297172, 0.7283009, 1, 0, 0, 1, 1,
0.1189819, -0.635436, 4.091206, 1, 0, 0, 1, 1,
0.1200043, 2.423058, 1.20007, 1, 0, 0, 1, 1,
0.1233922, -1.086677, 1.721163, 0, 0, 0, 1, 1,
0.1248085, 1.499432, 2.210761, 0, 0, 0, 1, 1,
0.1250556, 0.1932739, 0.8294693, 0, 0, 0, 1, 1,
0.1271297, 0.8198925, -0.1988404, 0, 0, 0, 1, 1,
0.1307069, -0.4088787, 2.391876, 0, 0, 0, 1, 1,
0.1361324, 0.6794304, -0.5406392, 0, 0, 0, 1, 1,
0.136369, -0.9296232, 3.245785, 0, 0, 0, 1, 1,
0.142811, -1.25706, 2.865771, 1, 1, 1, 1, 1,
0.1468387, 1.102804, 0.766291, 1, 1, 1, 1, 1,
0.1541797, 0.5893527, 1.10105, 1, 1, 1, 1, 1,
0.1547895, 0.07356276, 1.816968, 1, 1, 1, 1, 1,
0.1560653, 1.174886, 0.7733402, 1, 1, 1, 1, 1,
0.1595058, 1.432586, -0.4494261, 1, 1, 1, 1, 1,
0.1633389, 1.583723, 0.5083715, 1, 1, 1, 1, 1,
0.1668757, -0.2675849, 3.700636, 1, 1, 1, 1, 1,
0.1681487, -1.086081, 3.895036, 1, 1, 1, 1, 1,
0.1710375, -0.4173229, 4.103023, 1, 1, 1, 1, 1,
0.1725417, -0.4339153, 1.040926, 1, 1, 1, 1, 1,
0.1770009, 1.048162, -1.123619, 1, 1, 1, 1, 1,
0.1869562, 0.4791478, 0.9255201, 1, 1, 1, 1, 1,
0.1891382, -0.6902902, 3.646391, 1, 1, 1, 1, 1,
0.1901795, 0.8262444, -0.1774818, 1, 1, 1, 1, 1,
0.1910501, 1.148467, 1.027687, 0, 0, 1, 1, 1,
0.191804, 0.1554155, 1.375111, 1, 0, 0, 1, 1,
0.1929199, -1.696509, 2.576348, 1, 0, 0, 1, 1,
0.1971555, 0.5113043, 0.8609014, 1, 0, 0, 1, 1,
0.1972692, 0.9752706, -0.2137054, 1, 0, 0, 1, 1,
0.2024574, 0.2860758, 1.422727, 1, 0, 0, 1, 1,
0.2070329, -0.2149158, 1.913812, 0, 0, 0, 1, 1,
0.207105, 0.9495577, 0.3319489, 0, 0, 0, 1, 1,
0.2084187, -0.768164, 1.624617, 0, 0, 0, 1, 1,
0.2090308, -0.3002463, 3.075422, 0, 0, 0, 1, 1,
0.2099805, 0.2188375, 2.570037, 0, 0, 0, 1, 1,
0.210351, 1.001548, 1.171526, 0, 0, 0, 1, 1,
0.2162006, 0.8973969, 0.08379544, 0, 0, 0, 1, 1,
0.2198301, -0.4782791, 2.937087, 1, 1, 1, 1, 1,
0.2220196, -0.001041116, -0.3395772, 1, 1, 1, 1, 1,
0.223732, -0.7286389, 2.074813, 1, 1, 1, 1, 1,
0.2251202, 0.6052123, 0.4466999, 1, 1, 1, 1, 1,
0.2251564, 1.703555, 0.5804242, 1, 1, 1, 1, 1,
0.2262768, 0.4357429, 0.8938213, 1, 1, 1, 1, 1,
0.2302991, -0.08034032, -0.1005935, 1, 1, 1, 1, 1,
0.2344111, 0.2453553, 1.59084, 1, 1, 1, 1, 1,
0.2344802, 1.116358, -0.6677055, 1, 1, 1, 1, 1,
0.2344834, -1.948655, 3.296036, 1, 1, 1, 1, 1,
0.2381169, -0.9201186, 0.4934297, 1, 1, 1, 1, 1,
0.2422136, -0.9407561, 2.283824, 1, 1, 1, 1, 1,
0.2451956, -1.054876, 2.318931, 1, 1, 1, 1, 1,
0.2477385, -0.06022388, 2.167636, 1, 1, 1, 1, 1,
0.2498276, -1.460047, 2.344361, 1, 1, 1, 1, 1,
0.2522061, 1.64742, -0.212851, 0, 0, 1, 1, 1,
0.2541563, 0.692661, 0.8386977, 1, 0, 0, 1, 1,
0.2549148, 0.122253, 0.595771, 1, 0, 0, 1, 1,
0.2552481, -0.6943097, 2.590199, 1, 0, 0, 1, 1,
0.2558826, 0.5552508, 0.3814788, 1, 0, 0, 1, 1,
0.256172, -0.08613952, 2.257738, 1, 0, 0, 1, 1,
0.2561874, 1.586534, -0.127397, 0, 0, 0, 1, 1,
0.2587014, -1.270222, 1.612439, 0, 0, 0, 1, 1,
0.2618138, -1.361627, 3.983502, 0, 0, 0, 1, 1,
0.2638188, -0.07827424, 2.612229, 0, 0, 0, 1, 1,
0.2688037, -0.3349533, 2.58806, 0, 0, 0, 1, 1,
0.2692266, -0.4927898, 1.629761, 0, 0, 0, 1, 1,
0.2758014, -0.4527448, 3.839396, 0, 0, 0, 1, 1,
0.2786846, -1.677947, 2.50251, 1, 1, 1, 1, 1,
0.2815789, 0.938229, -1.950462, 1, 1, 1, 1, 1,
0.2815861, -2.026655, 2.632326, 1, 1, 1, 1, 1,
0.2825739, 1.865672, -0.04799667, 1, 1, 1, 1, 1,
0.2842634, -1.156433, 3.921203, 1, 1, 1, 1, 1,
0.2860291, -0.01731305, 3.292281, 1, 1, 1, 1, 1,
0.2867103, -0.2746031, 2.656653, 1, 1, 1, 1, 1,
0.288072, 0.2422851, 2.128015, 1, 1, 1, 1, 1,
0.2889415, -0.5366208, 4.529467, 1, 1, 1, 1, 1,
0.2896525, -1.189442, 4.521664, 1, 1, 1, 1, 1,
0.2903542, -0.01961093, 2.233525, 1, 1, 1, 1, 1,
0.2913101, 0.8018917, 0.4644673, 1, 1, 1, 1, 1,
0.3029333, 1.388329, 1.29199, 1, 1, 1, 1, 1,
0.30358, -0.08851955, 1.062154, 1, 1, 1, 1, 1,
0.3044307, 0.9987156, 0.555228, 1, 1, 1, 1, 1,
0.3069719, -1.264773, 4.094925, 0, 0, 1, 1, 1,
0.3077128, -0.9769806, 2.496065, 1, 0, 0, 1, 1,
0.3088973, -2.738671, 3.80535, 1, 0, 0, 1, 1,
0.3105453, 1.163193, -0.0943296, 1, 0, 0, 1, 1,
0.3112037, -0.748117, 2.918788, 1, 0, 0, 1, 1,
0.3132662, -0.6680604, 3.622273, 1, 0, 0, 1, 1,
0.3139252, 0.689178, 0.2189065, 0, 0, 0, 1, 1,
0.3141859, 1.648692, 0.4912518, 0, 0, 0, 1, 1,
0.3150687, 0.6809965, 0.7576887, 0, 0, 0, 1, 1,
0.3230534, -0.9334198, 3.247511, 0, 0, 0, 1, 1,
0.3238938, 0.3598681, -0.9100254, 0, 0, 0, 1, 1,
0.3300008, -0.392279, 1.248913, 0, 0, 0, 1, 1,
0.3308112, -0.441794, 3.003744, 0, 0, 0, 1, 1,
0.3312795, 0.5424004, 0.1074238, 1, 1, 1, 1, 1,
0.3344406, -0.08869801, 1.306601, 1, 1, 1, 1, 1,
0.3351761, 0.4930185, 1.013739, 1, 1, 1, 1, 1,
0.3353715, 0.1146946, 1.811406, 1, 1, 1, 1, 1,
0.340075, 1.039769, 0.01694577, 1, 1, 1, 1, 1,
0.3406579, 0.857412, -0.3803618, 1, 1, 1, 1, 1,
0.3411994, -0.09128071, 1.051243, 1, 1, 1, 1, 1,
0.3431433, -0.4821274, 3.103667, 1, 1, 1, 1, 1,
0.3438665, -0.8307826, 2.635214, 1, 1, 1, 1, 1,
0.345036, 2.487137, -0.4296136, 1, 1, 1, 1, 1,
0.3527636, -1.768462, 4.641822, 1, 1, 1, 1, 1,
0.3588561, 0.2831603, 1.435028, 1, 1, 1, 1, 1,
0.3592348, -1.065341, 2.149541, 1, 1, 1, 1, 1,
0.3606964, 1.422606, 0.3639062, 1, 1, 1, 1, 1,
0.3628002, 0.4645176, 0.2756486, 1, 1, 1, 1, 1,
0.3628457, -0.7237135, 1.880454, 0, 0, 1, 1, 1,
0.3642173, -0.9732853, 3.320497, 1, 0, 0, 1, 1,
0.3681252, -1.304183, 4.073581, 1, 0, 0, 1, 1,
0.3684757, -0.9465861, 3.391458, 1, 0, 0, 1, 1,
0.3685194, 0.2749583, 2.900327, 1, 0, 0, 1, 1,
0.3690693, -2.549887, 2.063517, 1, 0, 0, 1, 1,
0.3704486, -1.558952, 2.168598, 0, 0, 0, 1, 1,
0.3740827, 0.1634037, 1.264033, 0, 0, 0, 1, 1,
0.3743158, -0.5219485, 1.868288, 0, 0, 0, 1, 1,
0.376441, -1.317789, 3.269023, 0, 0, 0, 1, 1,
0.378945, 0.1969585, 0.6143261, 0, 0, 0, 1, 1,
0.3793685, 0.7463592, 0.3712777, 0, 0, 0, 1, 1,
0.3860922, 0.5747687, 1.585607, 0, 0, 0, 1, 1,
0.3903975, 2.365666, -1.024156, 1, 1, 1, 1, 1,
0.392922, 0.1688634, 0.2330688, 1, 1, 1, 1, 1,
0.3968144, -0.3611005, 2.235668, 1, 1, 1, 1, 1,
0.3998214, 0.827483, 0.5551654, 1, 1, 1, 1, 1,
0.4014736, 2.730751, 0.09931337, 1, 1, 1, 1, 1,
0.4036961, 1.646886, -0.40602, 1, 1, 1, 1, 1,
0.4056205, 0.2772571, 2.406843, 1, 1, 1, 1, 1,
0.411321, 0.5796189, 1.44834, 1, 1, 1, 1, 1,
0.4115664, -0.5514644, 1.484989, 1, 1, 1, 1, 1,
0.4172407, 0.5764552, 1.406757, 1, 1, 1, 1, 1,
0.4176089, -0.7429726, 2.191122, 1, 1, 1, 1, 1,
0.4193885, 0.7330052, 1.882086, 1, 1, 1, 1, 1,
0.4203383, -0.2979646, 2.692084, 1, 1, 1, 1, 1,
0.4238191, 0.02837686, -0.2198496, 1, 1, 1, 1, 1,
0.427874, -1.359536, 2.208542, 1, 1, 1, 1, 1,
0.4284784, -0.3706565, 2.932103, 0, 0, 1, 1, 1,
0.4316729, -0.02389945, 2.238388, 1, 0, 0, 1, 1,
0.4333439, 2.581167, -0.2656008, 1, 0, 0, 1, 1,
0.4340531, -0.3802621, 1.066884, 1, 0, 0, 1, 1,
0.4374772, -2.688816, 2.155177, 1, 0, 0, 1, 1,
0.4380552, 0.4614611, 1.106667, 1, 0, 0, 1, 1,
0.4390197, 0.6149638, 2.460609, 0, 0, 0, 1, 1,
0.4402569, -0.4058867, 3.161615, 0, 0, 0, 1, 1,
0.4441718, 1.231252, 1.144287, 0, 0, 0, 1, 1,
0.4450075, 0.5452636, 2.242089, 0, 0, 0, 1, 1,
0.4475892, -0.344315, 3.367033, 0, 0, 0, 1, 1,
0.4507662, 0.2699274, 1.962335, 0, 0, 0, 1, 1,
0.4536178, -0.3355323, 2.862325, 0, 0, 0, 1, 1,
0.4539882, -0.2077109, 2.33069, 1, 1, 1, 1, 1,
0.4548959, -0.02348278, 0.657523, 1, 1, 1, 1, 1,
0.4620743, 0.732851, 1.541631, 1, 1, 1, 1, 1,
0.4652123, 1.940603, 0.5991853, 1, 1, 1, 1, 1,
0.4654738, -1.655706, 1.54462, 1, 1, 1, 1, 1,
0.4661969, 0.2769061, 0.2595775, 1, 1, 1, 1, 1,
0.4695641, 1.573236, -1.150319, 1, 1, 1, 1, 1,
0.4696472, -0.2424895, 0.2731089, 1, 1, 1, 1, 1,
0.4734859, -1.080348, 2.891356, 1, 1, 1, 1, 1,
0.4783428, 0.5367627, -1.782362, 1, 1, 1, 1, 1,
0.4786568, -1.241261, 2.847191, 1, 1, 1, 1, 1,
0.4794886, -1.056132, 3.731809, 1, 1, 1, 1, 1,
0.4814832, -1.332543, 4.823553, 1, 1, 1, 1, 1,
0.4829618, -1.866784, 2.002748, 1, 1, 1, 1, 1,
0.4847201, 1.955414, 2.321872, 1, 1, 1, 1, 1,
0.4897107, -1.425582, 1.127015, 0, 0, 1, 1, 1,
0.4908518, 0.7922621, 1.891004, 1, 0, 0, 1, 1,
0.4928012, 0.07794756, 1.260073, 1, 0, 0, 1, 1,
0.4934559, 0.07725085, 1.824482, 1, 0, 0, 1, 1,
0.495201, -1.31538, 2.783633, 1, 0, 0, 1, 1,
0.4956594, -0.7694658, -0.6140856, 1, 0, 0, 1, 1,
0.5005667, -0.2198538, 1.903995, 0, 0, 0, 1, 1,
0.5087401, 0.6785379, 0.8311046, 0, 0, 0, 1, 1,
0.513913, -0.524121, 1.445969, 0, 0, 0, 1, 1,
0.5142028, 0.5576972, -1.130087, 0, 0, 0, 1, 1,
0.5194132, 0.8783287, 0.7099692, 0, 0, 0, 1, 1,
0.5230113, -0.02325898, 1.407894, 0, 0, 0, 1, 1,
0.5279531, -1.380111, 3.706184, 0, 0, 0, 1, 1,
0.5295181, 0.3600423, -1.575497, 1, 1, 1, 1, 1,
0.5296573, 0.1209316, 2.25139, 1, 1, 1, 1, 1,
0.5299617, 0.5007932, 1.249149, 1, 1, 1, 1, 1,
0.5375695, -0.889133, 2.95538, 1, 1, 1, 1, 1,
0.5384634, 0.01847653, 3.483345, 1, 1, 1, 1, 1,
0.5451183, -0.3604252, 1.370957, 1, 1, 1, 1, 1,
0.5467888, 0.7085721, 1.802394, 1, 1, 1, 1, 1,
0.5486097, -0.3477716, 2.017205, 1, 1, 1, 1, 1,
0.5522398, -1.015088, 2.171791, 1, 1, 1, 1, 1,
0.5576218, 1.730402, 0.3761028, 1, 1, 1, 1, 1,
0.5589259, -0.4448771, 1.244893, 1, 1, 1, 1, 1,
0.5635356, -0.5291877, 3.488807, 1, 1, 1, 1, 1,
0.5652971, 1.703111, 0.5358344, 1, 1, 1, 1, 1,
0.5678062, -2.573611, 1.89989, 1, 1, 1, 1, 1,
0.5711586, 1.547035, 0.6136069, 1, 1, 1, 1, 1,
0.5717379, -0.2235666, 1.383113, 0, 0, 1, 1, 1,
0.5792049, -0.4741467, 1.642795, 1, 0, 0, 1, 1,
0.5805568, 0.2655947, -0.3185142, 1, 0, 0, 1, 1,
0.5805731, -1.179793, 3.404814, 1, 0, 0, 1, 1,
0.5844446, 1.688071, 1.218343, 1, 0, 0, 1, 1,
0.5863982, 0.9187673, 0.4568451, 1, 0, 0, 1, 1,
0.5868971, 0.1010042, 2.11231, 0, 0, 0, 1, 1,
0.6046042, -0.4849156, 1.35461, 0, 0, 0, 1, 1,
0.6133411, -0.4009735, 3.258976, 0, 0, 0, 1, 1,
0.6138381, -0.732782, 3.020061, 0, 0, 0, 1, 1,
0.6171561, -0.2941892, 3.473708, 0, 0, 0, 1, 1,
0.6303844, -0.8144851, 2.210241, 0, 0, 0, 1, 1,
0.6314235, -0.7012684, 2.94012, 0, 0, 0, 1, 1,
0.6331359, -1.573744, 1.392397, 1, 1, 1, 1, 1,
0.6333699, -0.7171873, 2.346152, 1, 1, 1, 1, 1,
0.6350765, -0.4245457, 1.843731, 1, 1, 1, 1, 1,
0.6354474, -1.11006, 2.810286, 1, 1, 1, 1, 1,
0.6364905, 0.01832859, 0.4569741, 1, 1, 1, 1, 1,
0.6375983, -0.5448415, 4.234048, 1, 1, 1, 1, 1,
0.6400855, 0.7691759, -1.179662, 1, 1, 1, 1, 1,
0.6413573, 0.3629643, 1.194779, 1, 1, 1, 1, 1,
0.6455799, 0.05467044, 1.362542, 1, 1, 1, 1, 1,
0.6472228, 0.3380559, 1.287894, 1, 1, 1, 1, 1,
0.6611927, -0.8474924, 2.299339, 1, 1, 1, 1, 1,
0.6616693, -2.236392, 3.304111, 1, 1, 1, 1, 1,
0.667636, -0.2618541, 1.079102, 1, 1, 1, 1, 1,
0.6711789, -1.288285, 1.626678, 1, 1, 1, 1, 1,
0.6759909, -0.4256369, 2.887853, 1, 1, 1, 1, 1,
0.6784857, -0.2925294, 2.993756, 0, 0, 1, 1, 1,
0.6788714, 0.8144364, -0.1434325, 1, 0, 0, 1, 1,
0.6869591, -0.3976666, 1.264664, 1, 0, 0, 1, 1,
0.6874539, -0.673492, 2.361393, 1, 0, 0, 1, 1,
0.6882182, 1.056636, -1.061184, 1, 0, 0, 1, 1,
0.6897277, -0.3265601, 1.381098, 1, 0, 0, 1, 1,
0.6916901, 0.6225898, 2.397069, 0, 0, 0, 1, 1,
0.6953436, 0.6273191, 1.072819, 0, 0, 0, 1, 1,
0.6983519, 0.2199599, 0.3471134, 0, 0, 0, 1, 1,
0.6997851, -0.1740793, 2.276316, 0, 0, 0, 1, 1,
0.7026423, 0.4421486, 1.170531, 0, 0, 0, 1, 1,
0.7089347, -1.748978, 2.615551, 0, 0, 0, 1, 1,
0.7131639, -0.03265133, 1.457103, 0, 0, 0, 1, 1,
0.7151925, -0.334177, 1.647069, 1, 1, 1, 1, 1,
0.7153472, 0.5650207, 3.63392, 1, 1, 1, 1, 1,
0.7168564, -0.1228102, 1.046901, 1, 1, 1, 1, 1,
0.7193532, 1.293864, 1.76911, 1, 1, 1, 1, 1,
0.7225817, -0.2931665, 1.053969, 1, 1, 1, 1, 1,
0.7233794, -0.07297679, 1.921872, 1, 1, 1, 1, 1,
0.7317804, 0.6814694, 1.288767, 1, 1, 1, 1, 1,
0.7351654, -0.02220729, 0.5465695, 1, 1, 1, 1, 1,
0.7351974, 0.8043822, 0.8960534, 1, 1, 1, 1, 1,
0.7396024, 1.118561, 0.4305668, 1, 1, 1, 1, 1,
0.7411722, -1.611999, 4.325023, 1, 1, 1, 1, 1,
0.7431307, -1.384443, 1.873797, 1, 1, 1, 1, 1,
0.7464529, -0.1872289, 3.924669, 1, 1, 1, 1, 1,
0.7503061, -0.06859922, 2.191794, 1, 1, 1, 1, 1,
0.7528585, 0.5305149, 2.338779, 1, 1, 1, 1, 1,
0.7561393, 0.7979643, 0.5416721, 0, 0, 1, 1, 1,
0.7571732, -1.578571, 0.8082135, 1, 0, 0, 1, 1,
0.7613587, -1.870204, 3.953861, 1, 0, 0, 1, 1,
0.7638461, -0.9999157, 3.455637, 1, 0, 0, 1, 1,
0.7652887, 1.631741, 0.750604, 1, 0, 0, 1, 1,
0.7681482, 1.374909, 2.736368, 1, 0, 0, 1, 1,
0.777232, -1.004514, 1.637177, 0, 0, 0, 1, 1,
0.7854742, 0.8515161, -0.2790777, 0, 0, 0, 1, 1,
0.7891447, -1.435667, 4.369404, 0, 0, 0, 1, 1,
0.7933043, -0.4242323, 1.551582, 0, 0, 0, 1, 1,
0.8016627, 0.7115765, 0.8647861, 0, 0, 0, 1, 1,
0.801824, -0.9564775, 3.10836, 0, 0, 0, 1, 1,
0.8031107, 0.5065953, 0.7397406, 0, 0, 0, 1, 1,
0.8064734, -1.39595, 1.211246, 1, 1, 1, 1, 1,
0.8071755, -0.03488661, 2.620126, 1, 1, 1, 1, 1,
0.8199461, 1.489672, 0.6805778, 1, 1, 1, 1, 1,
0.8259674, -0.4720351, 2.295109, 1, 1, 1, 1, 1,
0.8271375, 0.2464055, 1.396119, 1, 1, 1, 1, 1,
0.8283964, 0.5849008, 0.9027762, 1, 1, 1, 1, 1,
0.8358363, 0.7401357, 0.6512047, 1, 1, 1, 1, 1,
0.8456842, -0.1193085, 0.872013, 1, 1, 1, 1, 1,
0.8469956, 1.492862, -0.3173603, 1, 1, 1, 1, 1,
0.8473246, 0.6079874, 1.346794, 1, 1, 1, 1, 1,
0.8482025, -0.7875822, 2.011254, 1, 1, 1, 1, 1,
0.8537788, 0.8082191, 0.751965, 1, 1, 1, 1, 1,
0.8589829, -1.083289, 1.309739, 1, 1, 1, 1, 1,
0.8670537, -1.841274, 4.166962, 1, 1, 1, 1, 1,
0.86914, -0.888481, 2.78293, 1, 1, 1, 1, 1,
0.8697634, 1.415106, 1.030578, 0, 0, 1, 1, 1,
0.8759314, -0.7727808, 2.066911, 1, 0, 0, 1, 1,
0.8810012, 1.989953, 1.051377, 1, 0, 0, 1, 1,
0.8830027, 0.1853484, 2.016939, 1, 0, 0, 1, 1,
0.8870334, 1.343666, -0.471638, 1, 0, 0, 1, 1,
0.8883731, -0.0422462, 1.634203, 1, 0, 0, 1, 1,
0.8902274, 0.03197241, 0.2446362, 0, 0, 0, 1, 1,
0.8937641, 0.5423412, -0.3683134, 0, 0, 0, 1, 1,
0.8944039, -1.53287, 0.6073984, 0, 0, 0, 1, 1,
0.9001423, 0.6065641, 1.578005, 0, 0, 0, 1, 1,
0.900453, -0.6923409, 2.974991, 0, 0, 0, 1, 1,
0.9026182, 1.024482, 1.682408, 0, 0, 0, 1, 1,
0.9113887, -1.464136, 2.618517, 0, 0, 0, 1, 1,
0.9137675, 1.804922, -0.2109433, 1, 1, 1, 1, 1,
0.9159027, -0.5914366, 2.469801, 1, 1, 1, 1, 1,
0.9194728, -0.9951056, 2.794806, 1, 1, 1, 1, 1,
0.9213589, -1.590443, 2.892377, 1, 1, 1, 1, 1,
0.9279402, 0.1405471, 1.33666, 1, 1, 1, 1, 1,
0.9350335, 0.7209311, -1.086615, 1, 1, 1, 1, 1,
0.9386126, 0.8202019, 1.104285, 1, 1, 1, 1, 1,
0.9473702, 1.191236, -0.115186, 1, 1, 1, 1, 1,
0.9515374, -2.205072, 2.808719, 1, 1, 1, 1, 1,
0.9536691, -1.518781, 1.867749, 1, 1, 1, 1, 1,
0.9569052, -1.057601, 2.726991, 1, 1, 1, 1, 1,
0.9596484, 0.8139083, 2.672819, 1, 1, 1, 1, 1,
0.9657546, 0.7388369, 0.5536466, 1, 1, 1, 1, 1,
0.9686391, -0.3147599, 1.775355, 1, 1, 1, 1, 1,
0.9743183, -0.229554, 2.600253, 1, 1, 1, 1, 1,
0.9774941, -0.8892948, 2.349477, 0, 0, 1, 1, 1,
0.9792687, -1.549861, 3.389172, 1, 0, 0, 1, 1,
0.9794892, 3.070103, -0.09724161, 1, 0, 0, 1, 1,
0.989573, 0.7297211, 1.925764, 1, 0, 0, 1, 1,
0.9896634, 0.006257551, 1.096614, 1, 0, 0, 1, 1,
0.9946932, -0.9123756, 2.23854, 1, 0, 0, 1, 1,
0.9981731, -0.9127026, 3.793153, 0, 0, 0, 1, 1,
1.002698, 0.003119368, 1.992864, 0, 0, 0, 1, 1,
1.002838, 1.482288, -1.215967, 0, 0, 0, 1, 1,
1.01145, 0.2135134, -0.7288976, 0, 0, 0, 1, 1,
1.019255, 0.9675945, 1.977546, 0, 0, 0, 1, 1,
1.01947, 0.9919668, -0.3905421, 0, 0, 0, 1, 1,
1.022913, -1.37143, 2.024884, 0, 0, 0, 1, 1,
1.031805, 1.011396, 0.9631631, 1, 1, 1, 1, 1,
1.04702, -1.614134, 2.862653, 1, 1, 1, 1, 1,
1.049602, -0.3522833, 3.798424, 1, 1, 1, 1, 1,
1.050722, 0.6520814, -0.0375028, 1, 1, 1, 1, 1,
1.063527, 0.6580556, 2.565313, 1, 1, 1, 1, 1,
1.063674, 1.1493, 2.275748, 1, 1, 1, 1, 1,
1.066581, 0.5870374, 1.821465, 1, 1, 1, 1, 1,
1.072006, -0.6578783, 2.392463, 1, 1, 1, 1, 1,
1.07352, 1.40081, 0.4185706, 1, 1, 1, 1, 1,
1.081714, -0.4879772, 2.250936, 1, 1, 1, 1, 1,
1.084929, 0.09699458, 0.9214575, 1, 1, 1, 1, 1,
1.086848, 1.08866, -0.9281883, 1, 1, 1, 1, 1,
1.088436, 0.07827315, 1.924825, 1, 1, 1, 1, 1,
1.097727, 1.190297, 0.9711065, 1, 1, 1, 1, 1,
1.106664, -0.9823802, 1.663231, 1, 1, 1, 1, 1,
1.108444, -0.5978487, 2.632049, 0, 0, 1, 1, 1,
1.115322, 0.4947902, 2.471078, 1, 0, 0, 1, 1,
1.116201, 0.5800895, 0.4991202, 1, 0, 0, 1, 1,
1.116225, 1.256017, 0.704139, 1, 0, 0, 1, 1,
1.118385, 0.4829662, -0.06532164, 1, 0, 0, 1, 1,
1.119001, -0.457737, 2.309058, 1, 0, 0, 1, 1,
1.119363, -1.37703, 3.020138, 0, 0, 0, 1, 1,
1.129642, 0.5029768, 1.30914, 0, 0, 0, 1, 1,
1.131607, 0.01593305, 0.2763231, 0, 0, 0, 1, 1,
1.132762, 1.74901, -0.2406817, 0, 0, 0, 1, 1,
1.13838, 1.136922, 1.095033, 0, 0, 0, 1, 1,
1.143641, 0.0820457, 0.5013165, 0, 0, 0, 1, 1,
1.14713, -0.2727914, 1.038018, 0, 0, 0, 1, 1,
1.14789, 0.07659715, 0.7621429, 1, 1, 1, 1, 1,
1.159454, -0.7575729, 3.519209, 1, 1, 1, 1, 1,
1.178973, -0.1245037, 0.7902703, 1, 1, 1, 1, 1,
1.179351, -0.8006173, 1.141294, 1, 1, 1, 1, 1,
1.182369, 1.40525, -0.1984786, 1, 1, 1, 1, 1,
1.183165, -0.1757537, 1.884783, 1, 1, 1, 1, 1,
1.193533, -0.3344547, 3.466637, 1, 1, 1, 1, 1,
1.196401, -0.2129499, 3.14228, 1, 1, 1, 1, 1,
1.201041, -0.1639341, 1.894634, 1, 1, 1, 1, 1,
1.205264, -0.4742248, 2.641939, 1, 1, 1, 1, 1,
1.220649, -0.5883341, 0.8926494, 1, 1, 1, 1, 1,
1.22409, 0.7042502, 1.842914, 1, 1, 1, 1, 1,
1.226124, -0.1531288, 1.494869, 1, 1, 1, 1, 1,
1.229432, 1.650007, 1.254104, 1, 1, 1, 1, 1,
1.242226, -0.8940156, 1.613819, 1, 1, 1, 1, 1,
1.246594, 0.6358698, 2.105109, 0, 0, 1, 1, 1,
1.252276, 0.4350541, 0.01155776, 1, 0, 0, 1, 1,
1.267239, 0.7490332, -0.276323, 1, 0, 0, 1, 1,
1.269897, 0.4010102, 0.8614729, 1, 0, 0, 1, 1,
1.275766, 0.4956058, 0.7764327, 1, 0, 0, 1, 1,
1.284669, -0.5836486, 3.33166, 1, 0, 0, 1, 1,
1.290294, -0.8437651, 1.792547, 0, 0, 0, 1, 1,
1.301913, -0.1017178, 1.661139, 0, 0, 0, 1, 1,
1.304598, 1.75628, 1.04877, 0, 0, 0, 1, 1,
1.327308, -0.6408191, 2.068418, 0, 0, 0, 1, 1,
1.328561, 0.3139396, 0.07373527, 0, 0, 0, 1, 1,
1.337014, 0.7196703, 2.737694, 0, 0, 0, 1, 1,
1.340238, 0.2760758, 2.59748, 0, 0, 0, 1, 1,
1.347765, -0.3818697, 1.133968, 1, 1, 1, 1, 1,
1.353188, -0.5179856, 2.372778, 1, 1, 1, 1, 1,
1.368282, 1.382723, 2.766501, 1, 1, 1, 1, 1,
1.372015, 1.982077, 1.241085, 1, 1, 1, 1, 1,
1.380647, -0.02795167, 2.767482, 1, 1, 1, 1, 1,
1.394509, 0.216358, 0.9853055, 1, 1, 1, 1, 1,
1.394984, -1.265623, 0.2746021, 1, 1, 1, 1, 1,
1.402546, 0.1872126, 1.352148, 1, 1, 1, 1, 1,
1.404285, -0.7580485, 2.96643, 1, 1, 1, 1, 1,
1.409638, -0.03114946, 2.676717, 1, 1, 1, 1, 1,
1.413512, -0.7062731, 0.4585507, 1, 1, 1, 1, 1,
1.428989, -0.7012268, 0.9245651, 1, 1, 1, 1, 1,
1.436402, 0.2462699, -0.7442412, 1, 1, 1, 1, 1,
1.436508, -0.06764333, 2.106259, 1, 1, 1, 1, 1,
1.445329, 1.379519, 2.804436, 1, 1, 1, 1, 1,
1.455781, 1.341944, -0.1376712, 0, 0, 1, 1, 1,
1.457208, 0.5008256, 0.8952641, 1, 0, 0, 1, 1,
1.459663, 0.2470886, 1.045228, 1, 0, 0, 1, 1,
1.480542, 0.7440196, 2.650654, 1, 0, 0, 1, 1,
1.485868, -1.028984, 3.76704, 1, 0, 0, 1, 1,
1.489143, -0.4916955, 2.382066, 1, 0, 0, 1, 1,
1.493468, 0.08503237, 3.342191, 0, 0, 0, 1, 1,
1.494665, -0.0329208, 2.185205, 0, 0, 0, 1, 1,
1.504343, -1.044717, 1.844514, 0, 0, 0, 1, 1,
1.508287, 0.438899, 0.9675959, 0, 0, 0, 1, 1,
1.508989, 1.459357, -0.614907, 0, 0, 0, 1, 1,
1.51034, 0.8564432, 0.3812481, 0, 0, 0, 1, 1,
1.541245, -0.7548929, 3.176464, 0, 0, 0, 1, 1,
1.542248, -0.2558154, 0.3322753, 1, 1, 1, 1, 1,
1.575802, 2.07028, 0.646383, 1, 1, 1, 1, 1,
1.593328, -1.537967, 1.319843, 1, 1, 1, 1, 1,
1.595979, -1.182365, 1.592575, 1, 1, 1, 1, 1,
1.611275, -0.2736897, 0.3369856, 1, 1, 1, 1, 1,
1.613142, 0.4482927, 1.989601, 1, 1, 1, 1, 1,
1.618279, -0.8362856, 2.192828, 1, 1, 1, 1, 1,
1.623979, 1.184792, -0.5631661, 1, 1, 1, 1, 1,
1.63057, -0.5808352, 2.968508, 1, 1, 1, 1, 1,
1.639851, -1.329004, 3.744839, 1, 1, 1, 1, 1,
1.658145, 0.3070889, -0.04874497, 1, 1, 1, 1, 1,
1.659853, -0.2176906, 1.434237, 1, 1, 1, 1, 1,
1.664619, -0.5729253, 2.520792, 1, 1, 1, 1, 1,
1.685346, -0.5060425, 1.398893, 1, 1, 1, 1, 1,
1.689245, 0.2665069, 1.858399, 1, 1, 1, 1, 1,
1.695622, -1.123106, 1.861588, 0, 0, 1, 1, 1,
1.699176, 0.8491939, 1.894984, 1, 0, 0, 1, 1,
1.699251, 0.6197218, 1.065783, 1, 0, 0, 1, 1,
1.710304, 0.8814278, -0.3996294, 1, 0, 0, 1, 1,
1.712695, 0.8618382, -0.1755823, 1, 0, 0, 1, 1,
1.72833, -0.439877, 2.2337, 1, 0, 0, 1, 1,
1.747571, -0.9395122, 3.294515, 0, 0, 0, 1, 1,
1.74844, 0.9506304, 0.04678791, 0, 0, 0, 1, 1,
1.760467, -0.1786522, 2.225182, 0, 0, 0, 1, 1,
1.766587, 1.025515, 1.085411, 0, 0, 0, 1, 1,
1.773493, -0.6448717, 3.057952, 0, 0, 0, 1, 1,
1.77406, -0.8697678, 2.282765, 0, 0, 0, 1, 1,
1.780213, -0.003660147, 1.842169, 0, 0, 0, 1, 1,
1.806111, 1.911501, 0.158833, 1, 1, 1, 1, 1,
1.817936, 0.08524182, 0.8658606, 1, 1, 1, 1, 1,
1.821179, 0.5234079, 2.014565, 1, 1, 1, 1, 1,
1.82427, -0.1464227, 1.275321, 1, 1, 1, 1, 1,
1.860509, 0.3443369, 0.5259504, 1, 1, 1, 1, 1,
1.873567, -0.3862645, 2.643111, 1, 1, 1, 1, 1,
1.879548, -0.3022249, 1.628363, 1, 1, 1, 1, 1,
1.903998, 1.352886, 1.911944, 1, 1, 1, 1, 1,
1.906098, 0.2506154, 3.282243, 1, 1, 1, 1, 1,
1.909699, 0.8382764, 0.5855854, 1, 1, 1, 1, 1,
1.911632, -1.512355, 2.324646, 1, 1, 1, 1, 1,
1.921091, -0.1345302, 0.6237218, 1, 1, 1, 1, 1,
1.951247, -0.7500182, 1.247903, 1, 1, 1, 1, 1,
1.961225, 0.05402441, 1.570463, 1, 1, 1, 1, 1,
1.962663, 0.6452358, 2.106463, 1, 1, 1, 1, 1,
1.964084, 1.503021, 1.857365, 0, 0, 1, 1, 1,
2.005195, -0.4331633, 2.58948, 1, 0, 0, 1, 1,
2.020852, -1.438166, 0.6440204, 1, 0, 0, 1, 1,
2.055742, 0.7993035, 1.980159, 1, 0, 0, 1, 1,
2.103547, 0.7070314, 2.497652, 1, 0, 0, 1, 1,
2.104846, 0.4335644, 2.092208, 1, 0, 0, 1, 1,
2.110077, -1.503381, 2.207276, 0, 0, 0, 1, 1,
2.113024, 0.6288208, 1.043056, 0, 0, 0, 1, 1,
2.175437, -0.5087845, 3.006258, 0, 0, 0, 1, 1,
2.224133, 0.1844011, 0.702552, 0, 0, 0, 1, 1,
2.243505, -0.2349415, 2.504827, 0, 0, 0, 1, 1,
2.309296, 1.07138, 1.515186, 0, 0, 0, 1, 1,
2.320337, 0.5894532, 3.545134, 0, 0, 0, 1, 1,
2.323022, 0.6330932, 0.7503161, 1, 1, 1, 1, 1,
2.36986, 0.909566, 0.755691, 1, 1, 1, 1, 1,
2.429991, 1.105159, -0.01706165, 1, 1, 1, 1, 1,
2.447519, -1.661809, 2.72426, 1, 1, 1, 1, 1,
2.665267, 0.7295817, -0.2777394, 1, 1, 1, 1, 1,
2.716505, -0.3235781, 2.06554, 1, 1, 1, 1, 1,
3.395147, 0.4021656, 0.7583044, 1, 1, 1, 1, 1
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
var radius = 9.520529;
var distance = 33.44045;
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
mvMatrix.translate( 0.009685278, -0.09632814, 0.1568851 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44045);
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
