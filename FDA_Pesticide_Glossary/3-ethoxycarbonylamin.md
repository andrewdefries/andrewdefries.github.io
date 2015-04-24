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
-2.933379, 0.8149761, 0.3983187, 1, 0, 0, 1,
-2.905892, 1.212342, -0.3901916, 1, 0.007843138, 0, 1,
-2.828347, 2.380555, -0.07806237, 1, 0.01176471, 0, 1,
-2.8218, 0.3614788, -0.4039547, 1, 0.01960784, 0, 1,
-2.807796, 0.116483, -3.018036, 1, 0.02352941, 0, 1,
-2.505575, -0.9996108, -4.153368, 1, 0.03137255, 0, 1,
-2.484408, -0.4472587, -1.871852, 1, 0.03529412, 0, 1,
-2.454611, -1.999704, -1.233985, 1, 0.04313726, 0, 1,
-2.374011, 0.04185351, -1.581447, 1, 0.04705882, 0, 1,
-2.374007, -0.6790481, -2.321914, 1, 0.05490196, 0, 1,
-2.315007, -0.2922162, -0.7030358, 1, 0.05882353, 0, 1,
-2.297265, -0.4337991, -1.257803, 1, 0.06666667, 0, 1,
-2.274049, 0.3169256, -0.4260819, 1, 0.07058824, 0, 1,
-2.257131, -1.594369, -2.559002, 1, 0.07843138, 0, 1,
-2.249125, -1.01851, -0.4280077, 1, 0.08235294, 0, 1,
-2.219191, 1.702855, -1.005802, 1, 0.09019608, 0, 1,
-2.138335, -0.0501166, -1.008982, 1, 0.09411765, 0, 1,
-2.113583, 0.2594127, -2.933312, 1, 0.1019608, 0, 1,
-2.077942, -3.337224, -3.301144, 1, 0.1098039, 0, 1,
-2.071062, 0.7080361, -0.9991879, 1, 0.1137255, 0, 1,
-2.067611, 1.631617, -1.347087, 1, 0.1215686, 0, 1,
-2.032369, 0.960224, -2.410776, 1, 0.1254902, 0, 1,
-2.02815, -1.473699, -4.274295, 1, 0.1333333, 0, 1,
-2.026096, -1.541379, -3.29002, 1, 0.1372549, 0, 1,
-2.021234, 2.166547, -0.3404515, 1, 0.145098, 0, 1,
-2.006196, 0.4319426, -1.451068, 1, 0.1490196, 0, 1,
-1.972104, -1.0014, -1.318206, 1, 0.1568628, 0, 1,
-1.942361, 0.4772354, -2.111446, 1, 0.1607843, 0, 1,
-1.937967, 0.2787914, -1.150259, 1, 0.1686275, 0, 1,
-1.934595, 0.408289, -1.206861, 1, 0.172549, 0, 1,
-1.905608, 0.2209505, -3.077677, 1, 0.1803922, 0, 1,
-1.888729, -1.294042, -2.109874, 1, 0.1843137, 0, 1,
-1.88565, -1.580641, -1.855783, 1, 0.1921569, 0, 1,
-1.868208, -0.3544422, -2.057494, 1, 0.1960784, 0, 1,
-1.854646, 0.01496847, -2.067398, 1, 0.2039216, 0, 1,
-1.849203, -0.6472228, -1.257858, 1, 0.2117647, 0, 1,
-1.841039, -0.8981698, -3.417771, 1, 0.2156863, 0, 1,
-1.803842, 0.6198944, -1.671882, 1, 0.2235294, 0, 1,
-1.768331, -0.4927513, -1.61057, 1, 0.227451, 0, 1,
-1.763923, 0.06465683, -1.506606, 1, 0.2352941, 0, 1,
-1.763582, -1.417961, -1.246903, 1, 0.2392157, 0, 1,
-1.757739, 0.9615558, 0.8292223, 1, 0.2470588, 0, 1,
-1.757102, -0.3110297, -1.587597, 1, 0.2509804, 0, 1,
-1.747788, -0.4038586, -2.266657, 1, 0.2588235, 0, 1,
-1.723463, 0.8135596, -1.13156, 1, 0.2627451, 0, 1,
-1.718871, 1.69533, -2.671606, 1, 0.2705882, 0, 1,
-1.709467, -0.7235927, -0.3986155, 1, 0.2745098, 0, 1,
-1.691975, -1.148501, -1.457484, 1, 0.282353, 0, 1,
-1.685838, -1.367, -2.53655, 1, 0.2862745, 0, 1,
-1.674749, 0.8644497, -0.5604321, 1, 0.2941177, 0, 1,
-1.674285, -1.848624, -2.605885, 1, 0.3019608, 0, 1,
-1.668736, 2.324116, 0.9143566, 1, 0.3058824, 0, 1,
-1.662492, 1.427216, -1.926509, 1, 0.3137255, 0, 1,
-1.659735, 0.9012892, -1.323947, 1, 0.3176471, 0, 1,
-1.647515, -0.8106624, -1.761789, 1, 0.3254902, 0, 1,
-1.625228, 3.067266, -0.7901883, 1, 0.3294118, 0, 1,
-1.614095, 0.8131788, -0.4647911, 1, 0.3372549, 0, 1,
-1.609647, 0.7671417, -0.1016292, 1, 0.3411765, 0, 1,
-1.599031, -1.450303, -0.1843975, 1, 0.3490196, 0, 1,
-1.591847, -1.291752, -1.534859, 1, 0.3529412, 0, 1,
-1.579515, -0.5241618, -1.769869, 1, 0.3607843, 0, 1,
-1.57689, 0.8524181, -2.192014, 1, 0.3647059, 0, 1,
-1.570883, -0.839036, -2.244107, 1, 0.372549, 0, 1,
-1.568775, -0.3799196, -2.224804, 1, 0.3764706, 0, 1,
-1.560472, 0.2374341, -1.014366, 1, 0.3843137, 0, 1,
-1.557875, -0.544265, -2.405677, 1, 0.3882353, 0, 1,
-1.556256, 0.3788413, 0.1051919, 1, 0.3960784, 0, 1,
-1.552506, -0.1148022, -1.494102, 1, 0.4039216, 0, 1,
-1.549641, -0.331048, -1.68706, 1, 0.4078431, 0, 1,
-1.545842, 0.1595076, -1.313536, 1, 0.4156863, 0, 1,
-1.543885, 0.3464502, -3.380331, 1, 0.4196078, 0, 1,
-1.540483, -0.7206985, -2.661159, 1, 0.427451, 0, 1,
-1.521922, -0.1842451, -1.091102, 1, 0.4313726, 0, 1,
-1.520511, 0.5446853, -1.758334, 1, 0.4392157, 0, 1,
-1.52029, -1.434197, -2.178248, 1, 0.4431373, 0, 1,
-1.511935, -0.3531866, -2.076025, 1, 0.4509804, 0, 1,
-1.510646, 0.2121686, -1.073019, 1, 0.454902, 0, 1,
-1.495033, -0.8963718, -2.987859, 1, 0.4627451, 0, 1,
-1.49277, -0.9779766, -2.914663, 1, 0.4666667, 0, 1,
-1.490453, -0.8791773, -3.530676, 1, 0.4745098, 0, 1,
-1.47117, -0.2155015, -2.238332, 1, 0.4784314, 0, 1,
-1.469746, 0.7737843, -1.027597, 1, 0.4862745, 0, 1,
-1.465255, -1.36741, -4.268341, 1, 0.4901961, 0, 1,
-1.464596, 0.1584929, -3.106425, 1, 0.4980392, 0, 1,
-1.461002, -0.3927718, -1.803644, 1, 0.5058824, 0, 1,
-1.46043, -1.840282, -2.876431, 1, 0.509804, 0, 1,
-1.459663, 1.726846, -0.9017928, 1, 0.5176471, 0, 1,
-1.458152, -0.5530142, -2.151457, 1, 0.5215687, 0, 1,
-1.456061, -0.8296964, -2.083424, 1, 0.5294118, 0, 1,
-1.452756, -0.6628219, -1.341987, 1, 0.5333334, 0, 1,
-1.441068, 0.2557715, -2.608051, 1, 0.5411765, 0, 1,
-1.433798, -0.9055555, -3.014614, 1, 0.5450981, 0, 1,
-1.432614, 0.3675533, -1.282649, 1, 0.5529412, 0, 1,
-1.432292, 1.573678, -0.02122338, 1, 0.5568628, 0, 1,
-1.422805, 0.9200977, -1.43633, 1, 0.5647059, 0, 1,
-1.421743, 0.3539872, -1.587896, 1, 0.5686275, 0, 1,
-1.40335, -0.02728553, 0.01816508, 1, 0.5764706, 0, 1,
-1.399215, -1.157494, -1.184473, 1, 0.5803922, 0, 1,
-1.382804, -0.698493, -2.452877, 1, 0.5882353, 0, 1,
-1.378394, 0.6076788, -0.6437221, 1, 0.5921569, 0, 1,
-1.377848, 0.4917934, -2.241082, 1, 0.6, 0, 1,
-1.361355, 0.2942017, -1.994411, 1, 0.6078432, 0, 1,
-1.357652, -0.7622774, -2.073606, 1, 0.6117647, 0, 1,
-1.334128, -0.7989591, -2.395086, 1, 0.6196079, 0, 1,
-1.332064, -0.5017651, -4.374978, 1, 0.6235294, 0, 1,
-1.329665, -0.7218633, -0.6016891, 1, 0.6313726, 0, 1,
-1.329608, 1.721314, -0.7571101, 1, 0.6352941, 0, 1,
-1.310093, -0.4379677, -2.130179, 1, 0.6431373, 0, 1,
-1.289359, -1.203867, -1.167932, 1, 0.6470588, 0, 1,
-1.285189, -0.03882792, -5.399808, 1, 0.654902, 0, 1,
-1.281688, -0.4787684, -0.3660244, 1, 0.6588235, 0, 1,
-1.280939, -0.9647417, -1.974995, 1, 0.6666667, 0, 1,
-1.253944, 0.4424084, -0.8655958, 1, 0.6705883, 0, 1,
-1.250062, 1.19763, -2.022424, 1, 0.6784314, 0, 1,
-1.249905, -0.4167571, -0.03518939, 1, 0.682353, 0, 1,
-1.24147, 0.8238422, -2.015439, 1, 0.6901961, 0, 1,
-1.239182, -0.920881, -2.133194, 1, 0.6941177, 0, 1,
-1.237454, -1.116164, -1.929316, 1, 0.7019608, 0, 1,
-1.235159, 0.8951946, -1.077293, 1, 0.7098039, 0, 1,
-1.214768, 0.3014306, -1.610343, 1, 0.7137255, 0, 1,
-1.211497, 0.6938659, -2.341929, 1, 0.7215686, 0, 1,
-1.211483, -0.795444, 0.1271581, 1, 0.7254902, 0, 1,
-1.204935, 0.7456132, -1.132706, 1, 0.7333333, 0, 1,
-1.203539, 0.3759114, -3.197105, 1, 0.7372549, 0, 1,
-1.203316, 0.3151757, -1.176633, 1, 0.7450981, 0, 1,
-1.195093, 0.9948189, -0.719883, 1, 0.7490196, 0, 1,
-1.181196, -0.5651405, -2.429873, 1, 0.7568628, 0, 1,
-1.173286, 1.09233, -0.8710246, 1, 0.7607843, 0, 1,
-1.172805, 0.6346656, -2.353312, 1, 0.7686275, 0, 1,
-1.169085, 0.3357849, -1.848645, 1, 0.772549, 0, 1,
-1.162589, 0.7033992, -0.4680927, 1, 0.7803922, 0, 1,
-1.158731, 0.08507753, -0.6418895, 1, 0.7843137, 0, 1,
-1.15006, 0.1819197, -1.728443, 1, 0.7921569, 0, 1,
-1.143137, 0.0565837, -0.4068669, 1, 0.7960784, 0, 1,
-1.140924, -1.380622, -3.107773, 1, 0.8039216, 0, 1,
-1.136048, 1.003575, -1.129261, 1, 0.8117647, 0, 1,
-1.130497, -0.8916922, -3.401677, 1, 0.8156863, 0, 1,
-1.12794, -0.7122288, -2.041567, 1, 0.8235294, 0, 1,
-1.126848, -1.125442, -1.55212, 1, 0.827451, 0, 1,
-1.126316, -1.432916, -2.485161, 1, 0.8352941, 0, 1,
-1.123631, -0.5463254, -4.260561, 1, 0.8392157, 0, 1,
-1.123099, -0.2310445, -0.9200685, 1, 0.8470588, 0, 1,
-1.122424, -1.580015, -3.263712, 1, 0.8509804, 0, 1,
-1.118675, 0.3323221, -2.155761, 1, 0.8588235, 0, 1,
-1.115768, -0.5657817, -1.659193, 1, 0.8627451, 0, 1,
-1.110898, -1.291599, -1.90994, 1, 0.8705882, 0, 1,
-1.108022, -0.7200056, -1.000301, 1, 0.8745098, 0, 1,
-1.101334, -2.067307, -2.836561, 1, 0.8823529, 0, 1,
-1.097915, 1.511276, -0.2280454, 1, 0.8862745, 0, 1,
-1.097431, -0.4480492, -1.015682, 1, 0.8941177, 0, 1,
-1.097212, -0.07534413, -1.78405, 1, 0.8980392, 0, 1,
-1.094484, -0.126897, -2.24671, 1, 0.9058824, 0, 1,
-1.093845, 0.4681082, -1.834651, 1, 0.9137255, 0, 1,
-1.093786, -0.543698, -1.72202, 1, 0.9176471, 0, 1,
-1.088911, -0.07858853, -1.100724, 1, 0.9254902, 0, 1,
-1.088728, 1.34057, -1.362135, 1, 0.9294118, 0, 1,
-1.086371, -0.287815, -0.6431004, 1, 0.9372549, 0, 1,
-1.08142, 0.9400736, -1.523143, 1, 0.9411765, 0, 1,
-1.080466, 0.855401, -1.788463, 1, 0.9490196, 0, 1,
-1.074662, 0.603747, -0.737852, 1, 0.9529412, 0, 1,
-1.073518, -0.5199507, -2.290134, 1, 0.9607843, 0, 1,
-1.069784, -1.362604, -1.965989, 1, 0.9647059, 0, 1,
-1.06312, 1.433684, -0.3679586, 1, 0.972549, 0, 1,
-1.059377, 0.6016216, -1.644632, 1, 0.9764706, 0, 1,
-1.059134, 1.177441, -1.444441, 1, 0.9843137, 0, 1,
-1.047858, 0.1994267, -2.699202, 1, 0.9882353, 0, 1,
-1.04675, -0.09636513, -2.951869, 1, 0.9960784, 0, 1,
-1.025869, -0.8001434, -0.9355575, 0.9960784, 1, 0, 1,
-1.012365, -2.121774, -4.01746, 0.9921569, 1, 0, 1,
-1.009742, -0.1640902, -0.4391596, 0.9843137, 1, 0, 1,
-1.005366, 1.125854, 0.08582361, 0.9803922, 1, 0, 1,
-1.004397, -0.7180094, -2.460353, 0.972549, 1, 0, 1,
-1.003995, 1.360309, 0.7890688, 0.9686275, 1, 0, 1,
-1.002156, -0.7711133, -1.631527, 0.9607843, 1, 0, 1,
-0.9949352, 0.8624552, -1.718259, 0.9568627, 1, 0, 1,
-0.9876339, 0.4466064, 1.012119, 0.9490196, 1, 0, 1,
-0.9853212, 0.2501949, -3.010651, 0.945098, 1, 0, 1,
-0.9795787, 1.016615, -0.9843394, 0.9372549, 1, 0, 1,
-0.9677534, -0.9306448, -2.721923, 0.9333333, 1, 0, 1,
-0.9672713, -0.6535234, 0.7252194, 0.9254902, 1, 0, 1,
-0.9626867, -1.396904, -1.96009, 0.9215686, 1, 0, 1,
-0.9609249, -0.2193466, -2.550072, 0.9137255, 1, 0, 1,
-0.9601921, -1.332323, -3.325882, 0.9098039, 1, 0, 1,
-0.9521292, -0.8270545, -1.668186, 0.9019608, 1, 0, 1,
-0.9487507, -0.1513835, -2.233881, 0.8941177, 1, 0, 1,
-0.9350587, 0.6622302, -0.5550354, 0.8901961, 1, 0, 1,
-0.9297989, 0.9853408, -1.974151, 0.8823529, 1, 0, 1,
-0.9246255, -0.906671, -2.093243, 0.8784314, 1, 0, 1,
-0.9235686, 0.6860709, -0.1422957, 0.8705882, 1, 0, 1,
-0.9203085, -0.2277245, -1.257901, 0.8666667, 1, 0, 1,
-0.9182734, -0.5961454, -3.070842, 0.8588235, 1, 0, 1,
-0.9148057, -1.49617, -5.0845, 0.854902, 1, 0, 1,
-0.9017789, 0.5911578, -1.899095, 0.8470588, 1, 0, 1,
-0.9013562, 0.07358078, -0.5897664, 0.8431373, 1, 0, 1,
-0.8921584, -0.2511205, -0.2545697, 0.8352941, 1, 0, 1,
-0.8892524, 0.2324986, -1.078363, 0.8313726, 1, 0, 1,
-0.8890303, -0.02336308, -1.344113, 0.8235294, 1, 0, 1,
-0.8885476, 1.449458, -1.480042, 0.8196079, 1, 0, 1,
-0.8827177, 0.9542866, -0.5022101, 0.8117647, 1, 0, 1,
-0.8805994, -0.1169856, -0.5322855, 0.8078431, 1, 0, 1,
-0.8788179, 0.3278388, -1.186859, 0.8, 1, 0, 1,
-0.8783501, -1.385516, -2.394593, 0.7921569, 1, 0, 1,
-0.8783175, 0.6083057, 0.1168249, 0.7882353, 1, 0, 1,
-0.8725882, 0.658059, -0.987039, 0.7803922, 1, 0, 1,
-0.8714936, -0.9049385, -0.6916778, 0.7764706, 1, 0, 1,
-0.8678628, -0.7845354, -1.243326, 0.7686275, 1, 0, 1,
-0.8676484, -0.01544562, -1.107964, 0.7647059, 1, 0, 1,
-0.8667693, 0.3189397, -3.23657, 0.7568628, 1, 0, 1,
-0.8653052, -0.9507676, -2.627551, 0.7529412, 1, 0, 1,
-0.861366, 0.937805, -0.01462481, 0.7450981, 1, 0, 1,
-0.8541815, -0.6807674, -1.771702, 0.7411765, 1, 0, 1,
-0.8525185, -0.5021789, -2.092606, 0.7333333, 1, 0, 1,
-0.8506399, -1.571653, -2.906059, 0.7294118, 1, 0, 1,
-0.8493733, 1.854926, -1.239497, 0.7215686, 1, 0, 1,
-0.8197306, -0.6459342, -2.390079, 0.7176471, 1, 0, 1,
-0.8136398, 1.54451, -1.014333, 0.7098039, 1, 0, 1,
-0.8132755, -0.3319105, -3.805207, 0.7058824, 1, 0, 1,
-0.8117816, -0.1745123, -0.194062, 0.6980392, 1, 0, 1,
-0.8089253, 1.432768, -1.643283, 0.6901961, 1, 0, 1,
-0.8040647, 0.3886736, -0.6082098, 0.6862745, 1, 0, 1,
-0.7940951, 0.4884072, 0.04799223, 0.6784314, 1, 0, 1,
-0.7845147, -0.7522256, -2.12942, 0.6745098, 1, 0, 1,
-0.7844356, -0.166468, -1.658405, 0.6666667, 1, 0, 1,
-0.7809433, 0.5949035, -0.7675794, 0.6627451, 1, 0, 1,
-0.7785427, 2.2641, -1.244945, 0.654902, 1, 0, 1,
-0.7716591, -1.429946, -2.758182, 0.6509804, 1, 0, 1,
-0.7670322, -1.157751, -2.173607, 0.6431373, 1, 0, 1,
-0.766265, 0.7236624, -2.581899, 0.6392157, 1, 0, 1,
-0.7602339, 0.1854241, -0.6655468, 0.6313726, 1, 0, 1,
-0.7579538, -0.7580358, -2.920124, 0.627451, 1, 0, 1,
-0.7560845, -0.1022964, -1.204647, 0.6196079, 1, 0, 1,
-0.7558947, 0.4068333, -0.9583623, 0.6156863, 1, 0, 1,
-0.7543775, -1.928626, -2.52017, 0.6078432, 1, 0, 1,
-0.7516207, 1.38414, -2.958853, 0.6039216, 1, 0, 1,
-0.7505734, -0.1862741, -2.925251, 0.5960785, 1, 0, 1,
-0.7455283, 0.4270258, -2.934423, 0.5882353, 1, 0, 1,
-0.7421385, 0.08196826, -3.087733, 0.5843138, 1, 0, 1,
-0.742009, 0.1352928, -1.831609, 0.5764706, 1, 0, 1,
-0.7379493, -1.459314, -2.543365, 0.572549, 1, 0, 1,
-0.7348579, 1.242721, -1.009475, 0.5647059, 1, 0, 1,
-0.7313781, 2.049433, 1.152296, 0.5607843, 1, 0, 1,
-0.7248159, 1.296366, -1.119476, 0.5529412, 1, 0, 1,
-0.7229161, 1.485289, 0.6126557, 0.5490196, 1, 0, 1,
-0.7221595, 2.40273, 0.5459489, 0.5411765, 1, 0, 1,
-0.7111998, 1.813531, -1.09859, 0.5372549, 1, 0, 1,
-0.7109662, -0.6329414, -2.66413, 0.5294118, 1, 0, 1,
-0.7100429, 0.5347331, -0.3034452, 0.5254902, 1, 0, 1,
-0.7070791, 0.216958, -0.3653336, 0.5176471, 1, 0, 1,
-0.7000167, -0.778577, -0.9673087, 0.5137255, 1, 0, 1,
-0.6882985, 0.5980605, 1.147502, 0.5058824, 1, 0, 1,
-0.6774365, -1.520617, -2.840159, 0.5019608, 1, 0, 1,
-0.672518, 1.281951, -0.3282855, 0.4941176, 1, 0, 1,
-0.6718783, -1.064408, -4.122416, 0.4862745, 1, 0, 1,
-0.6701741, 1.053498, -0.7399575, 0.4823529, 1, 0, 1,
-0.6695307, -1.369225, -3.509585, 0.4745098, 1, 0, 1,
-0.6667197, -1.551468, -3.91809, 0.4705882, 1, 0, 1,
-0.6622412, 0.359965, -1.916194, 0.4627451, 1, 0, 1,
-0.6613947, -0.5632487, -1.674205, 0.4588235, 1, 0, 1,
-0.6601553, 0.8470728, -0.2903786, 0.4509804, 1, 0, 1,
-0.6489964, -0.5709229, -1.249711, 0.4470588, 1, 0, 1,
-0.6447949, 1.070257, -0.4421175, 0.4392157, 1, 0, 1,
-0.6378024, 1.5122, -0.1322513, 0.4352941, 1, 0, 1,
-0.6335837, 2.18606, -1.381664, 0.427451, 1, 0, 1,
-0.6331737, 0.1256921, -0.9889725, 0.4235294, 1, 0, 1,
-0.6319358, -1.03522, -2.661566, 0.4156863, 1, 0, 1,
-0.6307222, -0.4664758, -1.51012, 0.4117647, 1, 0, 1,
-0.6198872, -0.3707057, -3.265537, 0.4039216, 1, 0, 1,
-0.6174117, -0.815523, -2.587592, 0.3960784, 1, 0, 1,
-0.6147991, 0.7450541, -1.751921, 0.3921569, 1, 0, 1,
-0.6138077, 0.3312059, -2.180482, 0.3843137, 1, 0, 1,
-0.6113641, 1.838608, 0.3152217, 0.3803922, 1, 0, 1,
-0.6097009, 2.025691, -0.9865528, 0.372549, 1, 0, 1,
-0.6085959, -1.068887, -1.838866, 0.3686275, 1, 0, 1,
-0.6069955, 0.6298907, 0.2002546, 0.3607843, 1, 0, 1,
-0.6058876, -0.107798, -1.619299, 0.3568628, 1, 0, 1,
-0.599489, -0.6957381, -3.581684, 0.3490196, 1, 0, 1,
-0.5934061, 1.475351, -2.814837, 0.345098, 1, 0, 1,
-0.5870842, -1.187551, -3.315548, 0.3372549, 1, 0, 1,
-0.5863747, -0.5291213, -0.842327, 0.3333333, 1, 0, 1,
-0.5853308, 2.883746, -0.1553181, 0.3254902, 1, 0, 1,
-0.584132, -1.00296, -3.366436, 0.3215686, 1, 0, 1,
-0.5813145, 0.6885594, -1.14794, 0.3137255, 1, 0, 1,
-0.5809407, -0.3391565, -3.413697, 0.3098039, 1, 0, 1,
-0.5807362, -0.4533047, -1.806198, 0.3019608, 1, 0, 1,
-0.577695, -0.1273015, -3.595689, 0.2941177, 1, 0, 1,
-0.5770203, -0.5283395, -3.154977, 0.2901961, 1, 0, 1,
-0.5756992, 1.4523, -1.791847, 0.282353, 1, 0, 1,
-0.5742927, 0.09995016, -2.573159, 0.2784314, 1, 0, 1,
-0.574259, 0.5293345, -0.08460073, 0.2705882, 1, 0, 1,
-0.5740875, -0.1114578, -3.049001, 0.2666667, 1, 0, 1,
-0.5736715, -1.158724, -2.712711, 0.2588235, 1, 0, 1,
-0.5723949, -0.8960492, -1.263675, 0.254902, 1, 0, 1,
-0.5703083, -0.08475247, -2.782395, 0.2470588, 1, 0, 1,
-0.5670317, -1.472666, -3.978702, 0.2431373, 1, 0, 1,
-0.5609155, 0.9186602, -0.2034609, 0.2352941, 1, 0, 1,
-0.5600921, 0.6061311, -1.14657, 0.2313726, 1, 0, 1,
-0.5594259, 0.6445861, -1.421223, 0.2235294, 1, 0, 1,
-0.5589982, 0.2087049, 0.4055293, 0.2196078, 1, 0, 1,
-0.5573448, 0.9275596, 1.283767, 0.2117647, 1, 0, 1,
-0.5509069, 0.3520141, 1.108172, 0.2078431, 1, 0, 1,
-0.5504722, -0.1227604, -1.234368, 0.2, 1, 0, 1,
-0.5498268, 0.770819, -0.5234145, 0.1921569, 1, 0, 1,
-0.5424853, 0.5254759, -0.3385172, 0.1882353, 1, 0, 1,
-0.5423549, 0.2182517, -0.830178, 0.1803922, 1, 0, 1,
-0.5403773, 0.4485146, -1.624158, 0.1764706, 1, 0, 1,
-0.5334278, -0.6363745, -3.785497, 0.1686275, 1, 0, 1,
-0.531984, 1.273492, 0.5183855, 0.1647059, 1, 0, 1,
-0.5267536, 0.01373909, 0.06952097, 0.1568628, 1, 0, 1,
-0.5263237, 1.178155, 1.08117, 0.1529412, 1, 0, 1,
-0.5180603, 2.668205, -0.303761, 0.145098, 1, 0, 1,
-0.5173803, 0.08942007, -1.233564, 0.1411765, 1, 0, 1,
-0.5118515, 0.7793876, -1.751941, 0.1333333, 1, 0, 1,
-0.5106045, -2.104545, -4.156056, 0.1294118, 1, 0, 1,
-0.5074853, 2.600619, 0.6586287, 0.1215686, 1, 0, 1,
-0.5061762, 0.07857988, -2.541788, 0.1176471, 1, 0, 1,
-0.5056867, 0.7568602, 0.3523169, 0.1098039, 1, 0, 1,
-0.505145, -0.09722895, -0.03179006, 0.1058824, 1, 0, 1,
-0.4998218, -1.54425, -2.309306, 0.09803922, 1, 0, 1,
-0.4947722, 1.591914, -0.0451165, 0.09019608, 1, 0, 1,
-0.4883104, 2.065557, -1.460213, 0.08627451, 1, 0, 1,
-0.4805205, 1.168477, -0.8273785, 0.07843138, 1, 0, 1,
-0.478321, -0.1961094, -2.920812, 0.07450981, 1, 0, 1,
-0.4772412, 1.51931, 0.658456, 0.06666667, 1, 0, 1,
-0.4763133, 0.04028745, -1.273755, 0.0627451, 1, 0, 1,
-0.4757642, 0.2036791, -0.3778647, 0.05490196, 1, 0, 1,
-0.4755, -0.1905804, -0.5305558, 0.05098039, 1, 0, 1,
-0.4610225, -2.156581, -1.656306, 0.04313726, 1, 0, 1,
-0.4583985, -0.1688704, -2.18751, 0.03921569, 1, 0, 1,
-0.4565699, 1.092088, -0.286739, 0.03137255, 1, 0, 1,
-0.4515857, 1.082425, 0.3358982, 0.02745098, 1, 0, 1,
-0.4504203, 1.110501, -2.239019, 0.01960784, 1, 0, 1,
-0.4495532, -0.4973575, -2.900227, 0.01568628, 1, 0, 1,
-0.4480931, -1.53338, -4.100094, 0.007843138, 1, 0, 1,
-0.4446259, -0.8277132, -3.919813, 0.003921569, 1, 0, 1,
-0.4388714, -1.469196, -3.305707, 0, 1, 0.003921569, 1,
-0.4319984, -0.5475154, -2.581675, 0, 1, 0.01176471, 1,
-0.4319833, -0.7144607, -2.233586, 0, 1, 0.01568628, 1,
-0.4317653, 1.523584, -0.5985776, 0, 1, 0.02352941, 1,
-0.4298159, -0.2098315, -0.4921412, 0, 1, 0.02745098, 1,
-0.4266138, 1.248253, -2.009212, 0, 1, 0.03529412, 1,
-0.4255693, 2.164084, 0.04586065, 0, 1, 0.03921569, 1,
-0.4223742, -0.2429554, -1.040824, 0, 1, 0.04705882, 1,
-0.4199701, -0.928428, -1.925842, 0, 1, 0.05098039, 1,
-0.4180161, -0.5590947, -2.611583, 0, 1, 0.05882353, 1,
-0.4108292, -0.3541694, -2.662735, 0, 1, 0.0627451, 1,
-0.4063175, -0.3066887, -4.692116, 0, 1, 0.07058824, 1,
-0.4051936, -1.191559, -1.501696, 0, 1, 0.07450981, 1,
-0.4030475, -1.416284, -3.166916, 0, 1, 0.08235294, 1,
-0.4013914, 0.5540511, 0.01396905, 0, 1, 0.08627451, 1,
-0.4012014, -0.8146173, -1.324337, 0, 1, 0.09411765, 1,
-0.3978846, -0.7294537, -3.59717, 0, 1, 0.1019608, 1,
-0.3948866, -1.020234, -2.581747, 0, 1, 0.1058824, 1,
-0.3908896, -1.175403, -3.331726, 0, 1, 0.1137255, 1,
-0.3903045, -0.05593381, -1.651751, 0, 1, 0.1176471, 1,
-0.3881723, 0.6929059, -0.858036, 0, 1, 0.1254902, 1,
-0.3841564, 0.2624922, -1.834346, 0, 1, 0.1294118, 1,
-0.3813125, 0.3409529, -0.4412995, 0, 1, 0.1372549, 1,
-0.3810411, -1.852885, -2.724032, 0, 1, 0.1411765, 1,
-0.379954, 0.8405083, -0.8626446, 0, 1, 0.1490196, 1,
-0.3798746, -0.331521, -1.283495, 0, 1, 0.1529412, 1,
-0.3777528, 0.1786742, -1.556026, 0, 1, 0.1607843, 1,
-0.3733898, -0.1568546, -1.738086, 0, 1, 0.1647059, 1,
-0.3720522, 0.7232537, -0.3891343, 0, 1, 0.172549, 1,
-0.3719188, -0.04641176, -2.007715, 0, 1, 0.1764706, 1,
-0.3676071, -0.9831398, -2.171961, 0, 1, 0.1843137, 1,
-0.3640651, -0.1478817, -0.1322855, 0, 1, 0.1882353, 1,
-0.361845, -2.062623, -3.461811, 0, 1, 0.1960784, 1,
-0.3540701, -6.320247e-05, 0.2070637, 0, 1, 0.2039216, 1,
-0.353399, -1.327183, -3.685378, 0, 1, 0.2078431, 1,
-0.3524545, 3.308203, -0.9348027, 0, 1, 0.2156863, 1,
-0.3515817, -0.1244842, -3.567305, 0, 1, 0.2196078, 1,
-0.3484663, 0.4919524, -0.1431007, 0, 1, 0.227451, 1,
-0.3440121, -1.652087, -3.016671, 0, 1, 0.2313726, 1,
-0.3432606, 0.9080555, -0.7789756, 0, 1, 0.2392157, 1,
-0.3371101, 2.916645, 1.177378, 0, 1, 0.2431373, 1,
-0.3352707, 0.9018952, -0.6123021, 0, 1, 0.2509804, 1,
-0.3350707, -0.7782049, -1.739299, 0, 1, 0.254902, 1,
-0.3266278, -2.213591, -3.293931, 0, 1, 0.2627451, 1,
-0.3125827, -1.464859, -2.344162, 0, 1, 0.2666667, 1,
-0.3118953, -0.01769512, 0.4227254, 0, 1, 0.2745098, 1,
-0.3097444, 0.1324374, 0.2651265, 0, 1, 0.2784314, 1,
-0.3052606, 1.332777, 1.860332, 0, 1, 0.2862745, 1,
-0.3042908, 0.9447911, 0.8729607, 0, 1, 0.2901961, 1,
-0.3030044, 0.4430813, -1.498861, 0, 1, 0.2980392, 1,
-0.30136, -0.4720936, -4.085907, 0, 1, 0.3058824, 1,
-0.2998233, -1.031549, -2.698714, 0, 1, 0.3098039, 1,
-0.2979271, -0.3048021, -2.860102, 0, 1, 0.3176471, 1,
-0.2953425, 0.5832855, -0.1198877, 0, 1, 0.3215686, 1,
-0.2904634, -0.4533592, -3.430087, 0, 1, 0.3294118, 1,
-0.2865413, 0.3505683, -0.52409, 0, 1, 0.3333333, 1,
-0.2769205, 1.105065, -0.4113991, 0, 1, 0.3411765, 1,
-0.2755444, 0.9952446, -0.8561593, 0, 1, 0.345098, 1,
-0.2755305, 1.048746, 1.036903, 0, 1, 0.3529412, 1,
-0.2731179, 0.2101676, -0.8447069, 0, 1, 0.3568628, 1,
-0.2722908, 0.4558587, -0.05587622, 0, 1, 0.3647059, 1,
-0.2597655, -1.499545, -1.855155, 0, 1, 0.3686275, 1,
-0.2583209, -0.7405651, -3.904891, 0, 1, 0.3764706, 1,
-0.2582, -1.443444, -3.143424, 0, 1, 0.3803922, 1,
-0.2548023, 0.4651127, 1.16987, 0, 1, 0.3882353, 1,
-0.2488057, 1.152798, -0.6622519, 0, 1, 0.3921569, 1,
-0.2443172, 0.7375137, 0.688502, 0, 1, 0.4, 1,
-0.2422683, 0.545594, 1.649951, 0, 1, 0.4078431, 1,
-0.2399235, -0.429588, -2.971475, 0, 1, 0.4117647, 1,
-0.2383204, -0.3463646, -3.055272, 0, 1, 0.4196078, 1,
-0.2353771, 1.021477, 0.6935518, 0, 1, 0.4235294, 1,
-0.2321722, -0.6907589, -2.730895, 0, 1, 0.4313726, 1,
-0.2320429, -1.264293, -4.278473, 0, 1, 0.4352941, 1,
-0.2319068, -1.906427, -1.852473, 0, 1, 0.4431373, 1,
-0.2251148, -0.7403839, -3.516029, 0, 1, 0.4470588, 1,
-0.2207843, 0.4199526, 1.681123, 0, 1, 0.454902, 1,
-0.219195, -0.6900106, -3.380929, 0, 1, 0.4588235, 1,
-0.2189201, -0.07251723, -0.7698289, 0, 1, 0.4666667, 1,
-0.2144805, -0.750583, -2.480608, 0, 1, 0.4705882, 1,
-0.2124275, -0.04106014, -2.190485, 0, 1, 0.4784314, 1,
-0.2074717, 0.5044069, -0.271549, 0, 1, 0.4823529, 1,
-0.2054707, 1.104424, 1.460998, 0, 1, 0.4901961, 1,
-0.1994112, 0.2066867, -1.919288, 0, 1, 0.4941176, 1,
-0.1882713, -1.9651, -3.477112, 0, 1, 0.5019608, 1,
-0.1876733, -1.024021, -1.779493, 0, 1, 0.509804, 1,
-0.1856812, -0.1597603, -3.471275, 0, 1, 0.5137255, 1,
-0.1742004, 0.8567565, -0.4337423, 0, 1, 0.5215687, 1,
-0.172261, -0.2295148, -0.9072705, 0, 1, 0.5254902, 1,
-0.171441, -0.7223518, -3.569051, 0, 1, 0.5333334, 1,
-0.1712212, 1.153605, -0.1443883, 0, 1, 0.5372549, 1,
-0.1698208, -0.1922281, -1.480187, 0, 1, 0.5450981, 1,
-0.1644138, -0.5595753, -1.561506, 0, 1, 0.5490196, 1,
-0.1622416, -1.12498, -5.379495, 0, 1, 0.5568628, 1,
-0.1613321, -0.7060749, -3.970933, 0, 1, 0.5607843, 1,
-0.1529435, -0.6238317, -2.46469, 0, 1, 0.5686275, 1,
-0.1489495, -0.7753775, -2.654049, 0, 1, 0.572549, 1,
-0.1487474, 0.3625506, 0.4719587, 0, 1, 0.5803922, 1,
-0.1486878, -0.9232741, -2.919388, 0, 1, 0.5843138, 1,
-0.1441168, 1.296665, 0.07591379, 0, 1, 0.5921569, 1,
-0.1392292, 0.4670176, -1.320387, 0, 1, 0.5960785, 1,
-0.1383718, -0.8409838, -2.610268, 0, 1, 0.6039216, 1,
-0.1347246, 1.271354, -0.9409273, 0, 1, 0.6117647, 1,
-0.1343648, 0.004360029, -2.449381, 0, 1, 0.6156863, 1,
-0.1331558, 0.2533089, 0.1046619, 0, 1, 0.6235294, 1,
-0.1276767, 0.9137129, 1.780558, 0, 1, 0.627451, 1,
-0.113861, 0.668926, -2.54114, 0, 1, 0.6352941, 1,
-0.1125839, -0.5136451, -1.458979, 0, 1, 0.6392157, 1,
-0.1101586, -1.269446, -4.89037, 0, 1, 0.6470588, 1,
-0.1061202, -1.238099, -3.018707, 0, 1, 0.6509804, 1,
-0.1014581, -1.158501, -3.384815, 0, 1, 0.6588235, 1,
-0.1007854, -0.1198344, -4.046057, 0, 1, 0.6627451, 1,
-0.09830226, 0.6985823, -1.324069, 0, 1, 0.6705883, 1,
-0.09692433, 0.257373, -0.2499921, 0, 1, 0.6745098, 1,
-0.09472599, -1.822957, -3.179811, 0, 1, 0.682353, 1,
-0.09318179, 1.008437, -0.2294799, 0, 1, 0.6862745, 1,
-0.09222838, 1.180368, -1.650536, 0, 1, 0.6941177, 1,
-0.09098659, 0.5845689, -0.5596489, 0, 1, 0.7019608, 1,
-0.08881563, 0.9554876, -0.00553306, 0, 1, 0.7058824, 1,
-0.08867938, 0.246718, 0.0833201, 0, 1, 0.7137255, 1,
-0.08795691, -0.8615617, -2.727887, 0, 1, 0.7176471, 1,
-0.08400588, 0.3793096, -0.9599987, 0, 1, 0.7254902, 1,
-0.0758389, -0.8950989, -5.165852, 0, 1, 0.7294118, 1,
-0.07537017, 0.2613135, -0.1775428, 0, 1, 0.7372549, 1,
-0.07370082, -0.2204315, -3.607507, 0, 1, 0.7411765, 1,
-0.07185401, 0.9038232, 0.5374479, 0, 1, 0.7490196, 1,
-0.0689365, -0.2320834, -0.4253438, 0, 1, 0.7529412, 1,
-0.06782403, -0.3458943, -2.125863, 0, 1, 0.7607843, 1,
-0.06736119, -0.8288276, -3.541976, 0, 1, 0.7647059, 1,
-0.06315326, -0.7235656, -3.849082, 0, 1, 0.772549, 1,
-0.06256677, 0.1225498, -0.2090534, 0, 1, 0.7764706, 1,
-0.06207421, -0.1449692, -0.6276227, 0, 1, 0.7843137, 1,
-0.05811733, 0.4733109, 0.698226, 0, 1, 0.7882353, 1,
-0.05766081, 1.650065, 0.5806946, 0, 1, 0.7960784, 1,
-0.05267648, -1.424448, -3.75739, 0, 1, 0.8039216, 1,
-0.0487451, 0.6110482, -1.339672, 0, 1, 0.8078431, 1,
-0.04706877, 1.148359, 1.113444, 0, 1, 0.8156863, 1,
-0.04337287, -1.167376, -3.702507, 0, 1, 0.8196079, 1,
-0.04194802, -0.4758311, -4.737342, 0, 1, 0.827451, 1,
-0.04073517, 0.2459631, -0.1904719, 0, 1, 0.8313726, 1,
-0.03609074, 1.310334, -1.05516, 0, 1, 0.8392157, 1,
-0.03303194, 0.8102418, -0.1996116, 0, 1, 0.8431373, 1,
-0.03206538, -0.1284532, -3.453725, 0, 1, 0.8509804, 1,
-0.02927197, -1.967007, -2.804188, 0, 1, 0.854902, 1,
-0.02693956, 2.230679, -1.025836, 0, 1, 0.8627451, 1,
-0.02398675, -0.1856833, -4.187008, 0, 1, 0.8666667, 1,
-0.02328337, -0.9819292, -2.471597, 0, 1, 0.8745098, 1,
-0.02231815, -0.3559749, -4.167057, 0, 1, 0.8784314, 1,
-0.01672938, -1.232894, -4.471341, 0, 1, 0.8862745, 1,
-0.01626296, 1.406327, -2.195072, 0, 1, 0.8901961, 1,
-0.01562936, 2.846973, -0.4942621, 0, 1, 0.8980392, 1,
-0.01481521, 1.016855, -0.0143477, 0, 1, 0.9058824, 1,
-0.01420986, -0.8142614, -5.088149, 0, 1, 0.9098039, 1,
-0.006102167, -0.6979687, -4.383788, 0, 1, 0.9176471, 1,
-0.004880703, 1.760245, 0.7159396, 0, 1, 0.9215686, 1,
-0.003602799, 0.6579231, 0.07137633, 0, 1, 0.9294118, 1,
-0.00221631, -0.06624759, -4.078551, 0, 1, 0.9333333, 1,
0.0001251408, 0.988345, -1.098951, 0, 1, 0.9411765, 1,
0.0005876804, -0.1191801, 3.48581, 0, 1, 0.945098, 1,
0.002889125, -0.02021908, 1.83682, 0, 1, 0.9529412, 1,
0.005230866, 0.8804602, 0.8988847, 0, 1, 0.9568627, 1,
0.006922527, 1.692416, -0.01689143, 0, 1, 0.9647059, 1,
0.008770779, 0.04967161, 1.565426, 0, 1, 0.9686275, 1,
0.009527258, -2.381979, 2.471484, 0, 1, 0.9764706, 1,
0.01315979, -1.050405, 2.2526, 0, 1, 0.9803922, 1,
0.01390805, -1.716815, 2.326868, 0, 1, 0.9882353, 1,
0.01450819, 1.214996, -1.021324, 0, 1, 0.9921569, 1,
0.0146593, -0.5288382, 4.02824, 0, 1, 1, 1,
0.01498629, -0.04343875, 3.023538, 0, 0.9921569, 1, 1,
0.01640959, -0.06352161, 4.799912, 0, 0.9882353, 1, 1,
0.01651253, -0.5684654, 2.774901, 0, 0.9803922, 1, 1,
0.0258539, 0.3494797, 1.598259, 0, 0.9764706, 1, 1,
0.02647907, 0.4264855, 1.274049, 0, 0.9686275, 1, 1,
0.02850709, 1.174734, 0.3233926, 0, 0.9647059, 1, 1,
0.03021167, 0.2369487, 0.8685081, 0, 0.9568627, 1, 1,
0.03274972, -1.939834, 4.540421, 0, 0.9529412, 1, 1,
0.03327033, -0.5547995, 4.08283, 0, 0.945098, 1, 1,
0.03524205, 0.7397425, -0.5954755, 0, 0.9411765, 1, 1,
0.03550398, -1.498081, 3.234123, 0, 0.9333333, 1, 1,
0.04058691, 0.1834372, 0.7220691, 0, 0.9294118, 1, 1,
0.0420077, -1.03586, 1.387584, 0, 0.9215686, 1, 1,
0.04205389, -0.4351521, 3.384127, 0, 0.9176471, 1, 1,
0.04385457, -0.194071, 3.979359, 0, 0.9098039, 1, 1,
0.04422041, 2.133098, 0.4254565, 0, 0.9058824, 1, 1,
0.04430633, 1.137634, -1.576633, 0, 0.8980392, 1, 1,
0.04463835, 0.1883448, 0.1436854, 0, 0.8901961, 1, 1,
0.04599339, -0.08435287, 3.218543, 0, 0.8862745, 1, 1,
0.0491792, 0.4903968, 0.8418928, 0, 0.8784314, 1, 1,
0.05097295, -1.402309, 4.008853, 0, 0.8745098, 1, 1,
0.05122272, -1.342496, 5.054163, 0, 0.8666667, 1, 1,
0.0620206, 0.3141526, -1.123377, 0, 0.8627451, 1, 1,
0.06259796, 1.628116, 1.335844, 0, 0.854902, 1, 1,
0.06731785, 0.3232275, 1.013333, 0, 0.8509804, 1, 1,
0.06798277, 1.165867, -0.1679779, 0, 0.8431373, 1, 1,
0.06984434, -0.1022746, 2.449458, 0, 0.8392157, 1, 1,
0.0706662, 1.06794, 1.18042, 0, 0.8313726, 1, 1,
0.07128782, -0.7932579, 3.123903, 0, 0.827451, 1, 1,
0.07767847, 1.3322, 0.6579576, 0, 0.8196079, 1, 1,
0.08106084, -0.6349967, 4.283154, 0, 0.8156863, 1, 1,
0.0860741, 0.5550832, -1.000192, 0, 0.8078431, 1, 1,
0.08723246, 1.209276, 0.1669831, 0, 0.8039216, 1, 1,
0.08734317, 1.311772, -0.06939755, 0, 0.7960784, 1, 1,
0.09026419, -0.894615, 2.617488, 0, 0.7882353, 1, 1,
0.09347393, 1.488152, -0.47471, 0, 0.7843137, 1, 1,
0.09362388, -0.497336, 3.790717, 0, 0.7764706, 1, 1,
0.09482003, 0.32803, 0.1343971, 0, 0.772549, 1, 1,
0.1019752, -0.7267244, 3.014165, 0, 0.7647059, 1, 1,
0.1042558, 0.0296099, 1.326298, 0, 0.7607843, 1, 1,
0.1056507, 1.831441, -0.7857906, 0, 0.7529412, 1, 1,
0.1069696, -0.6356717, 4.218748, 0, 0.7490196, 1, 1,
0.1075355, 0.006379822, 1.100662, 0, 0.7411765, 1, 1,
0.1080005, 1.380075, 1.115371, 0, 0.7372549, 1, 1,
0.1150988, -1.694086, 3.208286, 0, 0.7294118, 1, 1,
0.116256, -0.1844066, -0.5218983, 0, 0.7254902, 1, 1,
0.1167493, 0.05678757, 1.237279, 0, 0.7176471, 1, 1,
0.1182332, -0.40924, 2.306009, 0, 0.7137255, 1, 1,
0.1211478, -1.660231, 3.676271, 0, 0.7058824, 1, 1,
0.121843, 0.2439661, -1.260027, 0, 0.6980392, 1, 1,
0.1255295, -1.125628, 3.975027, 0, 0.6941177, 1, 1,
0.1257669, 1.219089, 0.2285161, 0, 0.6862745, 1, 1,
0.1268458, 0.1605175, 0.9536255, 0, 0.682353, 1, 1,
0.130362, 0.64298, 0.1095591, 0, 0.6745098, 1, 1,
0.1310073, 0.438866, 1.027542, 0, 0.6705883, 1, 1,
0.1313167, -0.7043898, 1.037011, 0, 0.6627451, 1, 1,
0.1326582, 1.538094, 1.066721, 0, 0.6588235, 1, 1,
0.1334625, -0.3984009, 4.862967, 0, 0.6509804, 1, 1,
0.1356911, 0.1025833, 1.293761, 0, 0.6470588, 1, 1,
0.1470949, -1.557407, 1.951496, 0, 0.6392157, 1, 1,
0.1578209, 1.024413, -0.9458464, 0, 0.6352941, 1, 1,
0.1644683, -0.3536809, 2.027506, 0, 0.627451, 1, 1,
0.1644802, -0.2702766, 1.961612, 0, 0.6235294, 1, 1,
0.1650153, -0.1645681, 2.000886, 0, 0.6156863, 1, 1,
0.1689933, 0.3616351, 1.105225, 0, 0.6117647, 1, 1,
0.1698709, -0.3335601, 3.815404, 0, 0.6039216, 1, 1,
0.1720982, -0.5490189, 2.45997, 0, 0.5960785, 1, 1,
0.1740272, -0.5230684, 2.410451, 0, 0.5921569, 1, 1,
0.1746285, 1.094642, -1.841418, 0, 0.5843138, 1, 1,
0.1760181, -2.105665, 2.208293, 0, 0.5803922, 1, 1,
0.1776175, -0.3843972, 3.134751, 0, 0.572549, 1, 1,
0.1783609, -0.4017207, 4.031217, 0, 0.5686275, 1, 1,
0.1803355, 0.001093414, 0.09477676, 0, 0.5607843, 1, 1,
0.1822232, 0.5946316, -0.9258127, 0, 0.5568628, 1, 1,
0.1829885, 0.7540891, -0.1334239, 0, 0.5490196, 1, 1,
0.1864245, -1.44285, 3.244358, 0, 0.5450981, 1, 1,
0.1909421, 2.201349, 0.2397913, 0, 0.5372549, 1, 1,
0.1987713, -0.4430099, 4.28312, 0, 0.5333334, 1, 1,
0.200323, -0.2633214, 3.040137, 0, 0.5254902, 1, 1,
0.2012752, -0.07012624, 0.8800673, 0, 0.5215687, 1, 1,
0.2022431, -0.5565637, 0.7897382, 0, 0.5137255, 1, 1,
0.2049142, 0.2274265, 0.700304, 0, 0.509804, 1, 1,
0.2071089, 0.7901363, 0.7478421, 0, 0.5019608, 1, 1,
0.2096377, 1.370792, 0.1334095, 0, 0.4941176, 1, 1,
0.21, 0.9205009, 0.5227239, 0, 0.4901961, 1, 1,
0.2112211, 0.005632117, 1.297086, 0, 0.4823529, 1, 1,
0.2135154, -0.2826372, 2.74901, 0, 0.4784314, 1, 1,
0.2264765, 0.8640864, 1.017859, 0, 0.4705882, 1, 1,
0.227263, -0.6295658, 2.441081, 0, 0.4666667, 1, 1,
0.2283891, 2.071322, 0.1475422, 0, 0.4588235, 1, 1,
0.2286915, 0.8195959, 0.1600757, 0, 0.454902, 1, 1,
0.2299093, 1.755963, 0.5188411, 0, 0.4470588, 1, 1,
0.2308041, 0.5499079, 1.15185, 0, 0.4431373, 1, 1,
0.2339914, 0.1696697, -0.6735732, 0, 0.4352941, 1, 1,
0.2353735, -0.3750597, 2.385545, 0, 0.4313726, 1, 1,
0.2488742, -1.603544, 3.732156, 0, 0.4235294, 1, 1,
0.2570056, -1.059029, 3.373783, 0, 0.4196078, 1, 1,
0.2593535, -1.556859, 2.170763, 0, 0.4117647, 1, 1,
0.2603185, 0.4087138, -0.2213665, 0, 0.4078431, 1, 1,
0.2621448, 0.2539535, -0.7814568, 0, 0.4, 1, 1,
0.2672073, -1.059108, 3.192878, 0, 0.3921569, 1, 1,
0.26835, 0.001431216, 2.051977, 0, 0.3882353, 1, 1,
0.2715723, 0.2230451, 0.4208559, 0, 0.3803922, 1, 1,
0.2737585, -1.405186, 2.75424, 0, 0.3764706, 1, 1,
0.2753634, -1.201221, 3.308852, 0, 0.3686275, 1, 1,
0.2756386, -0.3135425, 2.427682, 0, 0.3647059, 1, 1,
0.276765, -1.869281, 2.611661, 0, 0.3568628, 1, 1,
0.2804446, 1.428747, 0.2719032, 0, 0.3529412, 1, 1,
0.2829587, 1.211774, -0.5519394, 0, 0.345098, 1, 1,
0.2829984, 1.379836, 1.122118, 0, 0.3411765, 1, 1,
0.2836869, -0.573029, 2.703738, 0, 0.3333333, 1, 1,
0.2841858, -0.4929457, 2.139651, 0, 0.3294118, 1, 1,
0.2841867, 0.8597388, 2.551324, 0, 0.3215686, 1, 1,
0.2869872, 0.1633355, -0.2619152, 0, 0.3176471, 1, 1,
0.2910499, -0.2166832, 2.09948, 0, 0.3098039, 1, 1,
0.2915459, 0.6142752, 0.4679238, 0, 0.3058824, 1, 1,
0.2968554, 1.221715, 0.6504113, 0, 0.2980392, 1, 1,
0.3003466, 0.006804721, 1.641718, 0, 0.2901961, 1, 1,
0.3017537, 0.4575575, -0.5361614, 0, 0.2862745, 1, 1,
0.3020851, 0.0005897565, 3.417723, 0, 0.2784314, 1, 1,
0.3056566, -0.7531717, 1.524297, 0, 0.2745098, 1, 1,
0.311212, -0.2938267, 3.072219, 0, 0.2666667, 1, 1,
0.312509, -0.04898638, 2.703806, 0, 0.2627451, 1, 1,
0.3129917, 0.5415132, -0.3515837, 0, 0.254902, 1, 1,
0.3137483, 1.471393, 0.8266131, 0, 0.2509804, 1, 1,
0.3138015, -0.219336, 0.6837206, 0, 0.2431373, 1, 1,
0.316039, 0.6377401, 1.422833, 0, 0.2392157, 1, 1,
0.3165738, -0.5973257, 0.791815, 0, 0.2313726, 1, 1,
0.3189852, -0.7177036, 2.392696, 0, 0.227451, 1, 1,
0.3201519, 0.7342118, 0.15093, 0, 0.2196078, 1, 1,
0.3206728, 0.4124211, 1.3653, 0, 0.2156863, 1, 1,
0.3250343, -0.5155134, 1.834791, 0, 0.2078431, 1, 1,
0.332368, 0.6018628, 1.315283, 0, 0.2039216, 1, 1,
0.3340952, 0.4532871, 0.8516515, 0, 0.1960784, 1, 1,
0.336291, -1.141503, 4.324764, 0, 0.1882353, 1, 1,
0.3389438, 0.2703557, 0.5770918, 0, 0.1843137, 1, 1,
0.3401676, 0.3177941, -1.474414, 0, 0.1764706, 1, 1,
0.3404378, 2.006219, -1.245366, 0, 0.172549, 1, 1,
0.3452927, -0.369104, 2.079475, 0, 0.1647059, 1, 1,
0.3481217, 0.6789826, -0.3090999, 0, 0.1607843, 1, 1,
0.359299, 0.2875493, 0.8701984, 0, 0.1529412, 1, 1,
0.3651777, -2.383898, 2.162213, 0, 0.1490196, 1, 1,
0.3655093, -0.7556174, 4.151348, 0, 0.1411765, 1, 1,
0.3680669, -0.1181437, 1.997426, 0, 0.1372549, 1, 1,
0.3685125, -0.681184, 0.7599925, 0, 0.1294118, 1, 1,
0.3691502, -2.067899, 3.128204, 0, 0.1254902, 1, 1,
0.3693005, -1.140361, 3.03098, 0, 0.1176471, 1, 1,
0.380035, -0.0988719, -0.4085409, 0, 0.1137255, 1, 1,
0.3824058, -0.4112302, 2.988398, 0, 0.1058824, 1, 1,
0.3840753, 1.392374, 0.8105853, 0, 0.09803922, 1, 1,
0.3848575, -1.02792, 3.928369, 0, 0.09411765, 1, 1,
0.3851969, 0.5952263, 0.4314038, 0, 0.08627451, 1, 1,
0.3882557, 0.08092147, 0.9345255, 0, 0.08235294, 1, 1,
0.3954962, -0.3052269, 2.98102, 0, 0.07450981, 1, 1,
0.3981397, -0.1364686, 2.621595, 0, 0.07058824, 1, 1,
0.3988225, 0.1963183, 1.095506, 0, 0.0627451, 1, 1,
0.4002411, 0.2140474, 0.1245699, 0, 0.05882353, 1, 1,
0.4065872, -1.725393, 1.096688, 0, 0.05098039, 1, 1,
0.4116729, -0.1838816, -0.2194863, 0, 0.04705882, 1, 1,
0.4133231, -0.511162, 3.655389, 0, 0.03921569, 1, 1,
0.4140677, -0.6218785, 1.53654, 0, 0.03529412, 1, 1,
0.4170486, 0.8305124, -0.2995688, 0, 0.02745098, 1, 1,
0.4214471, -1.043586, 3.667506, 0, 0.02352941, 1, 1,
0.4230124, -1.994149, 4.159118, 0, 0.01568628, 1, 1,
0.4270972, 0.4007992, 2.060711, 0, 0.01176471, 1, 1,
0.4279703, -0.1378302, 1.631388, 0, 0.003921569, 1, 1,
0.42822, 0.7781054, 0.1805951, 0.003921569, 0, 1, 1,
0.4294564, 1.189791, 0.4136037, 0.007843138, 0, 1, 1,
0.4296412, 0.8360383, 1.563218, 0.01568628, 0, 1, 1,
0.4331536, 0.9448571, 1.716851, 0.01960784, 0, 1, 1,
0.4362247, 0.8401338, -0.3406047, 0.02745098, 0, 1, 1,
0.4374917, 0.6381856, -0.3074719, 0.03137255, 0, 1, 1,
0.4380046, -0.2761342, 2.588167, 0.03921569, 0, 1, 1,
0.4382994, -1.512242, 3.260174, 0.04313726, 0, 1, 1,
0.4388546, -0.4210665, 2.042443, 0.05098039, 0, 1, 1,
0.4401686, -0.4935674, 1.207487, 0.05490196, 0, 1, 1,
0.4484449, -0.5914409, 1.258392, 0.0627451, 0, 1, 1,
0.452764, -0.6524231, 3.081336, 0.06666667, 0, 1, 1,
0.4569441, -1.306621, 3.778394, 0.07450981, 0, 1, 1,
0.4572278, 0.3827358, 2.208325, 0.07843138, 0, 1, 1,
0.4580628, -1.096128, 2.75493, 0.08627451, 0, 1, 1,
0.4585354, 0.7719628, 0.6282019, 0.09019608, 0, 1, 1,
0.4593236, -0.8553571, 5.372424, 0.09803922, 0, 1, 1,
0.4593412, -2.821674, 2.199504, 0.1058824, 0, 1, 1,
0.4646961, -0.7069863, 2.542311, 0.1098039, 0, 1, 1,
0.468597, -0.605924, 1.699525, 0.1176471, 0, 1, 1,
0.4687909, -0.5623846, 2.17962, 0.1215686, 0, 1, 1,
0.4793681, 0.6486347, 0.1361066, 0.1294118, 0, 1, 1,
0.481962, -0.02422545, 2.082698, 0.1333333, 0, 1, 1,
0.4831395, 0.245288, 1.120249, 0.1411765, 0, 1, 1,
0.4846275, -1.313684, 2.67478, 0.145098, 0, 1, 1,
0.4862571, 0.8280829, 0.4351984, 0.1529412, 0, 1, 1,
0.4870428, 1.672393, 0.3106003, 0.1568628, 0, 1, 1,
0.4949138, -0.9427439, 3.04059, 0.1647059, 0, 1, 1,
0.499375, -0.4184907, 0.8004777, 0.1686275, 0, 1, 1,
0.5020257, -0.4326477, 2.338129, 0.1764706, 0, 1, 1,
0.5041764, 0.4150794, -0.09399408, 0.1803922, 0, 1, 1,
0.5086103, 0.2543795, 2.124755, 0.1882353, 0, 1, 1,
0.5117494, -1.312629, 1.056184, 0.1921569, 0, 1, 1,
0.515577, -0.2344169, 1.445967, 0.2, 0, 1, 1,
0.5181133, 0.4446023, 0.2454578, 0.2078431, 0, 1, 1,
0.526933, -1.415543, 3.523128, 0.2117647, 0, 1, 1,
0.5286708, 1.033302, 0.3346392, 0.2196078, 0, 1, 1,
0.5292158, -0.09022371, 1.659058, 0.2235294, 0, 1, 1,
0.531212, 1.166047, 0.2054393, 0.2313726, 0, 1, 1,
0.5312532, -0.4512603, 2.560405, 0.2352941, 0, 1, 1,
0.5326577, -0.3122635, 2.142909, 0.2431373, 0, 1, 1,
0.533417, 0.4243617, 1.385945, 0.2470588, 0, 1, 1,
0.536964, -2.036808, 1.683708, 0.254902, 0, 1, 1,
0.5385461, 0.583531, -0.2462924, 0.2588235, 0, 1, 1,
0.5395228, 1.829518, -1.79341, 0.2666667, 0, 1, 1,
0.5411731, -1.735582, 2.135073, 0.2705882, 0, 1, 1,
0.5556064, -0.6479735, 3.549152, 0.2784314, 0, 1, 1,
0.5559123, -0.5950325, 1.756008, 0.282353, 0, 1, 1,
0.5599643, -0.2912387, 1.57351, 0.2901961, 0, 1, 1,
0.5609997, -0.4779037, 3.185516, 0.2941177, 0, 1, 1,
0.5617215, -0.1085334, 1.407488, 0.3019608, 0, 1, 1,
0.5630399, -0.8967733, 3.296733, 0.3098039, 0, 1, 1,
0.5657846, -0.4164838, 1.860948, 0.3137255, 0, 1, 1,
0.5803279, -0.595831, 2.123628, 0.3215686, 0, 1, 1,
0.5815488, 0.1070914, 0.7448977, 0.3254902, 0, 1, 1,
0.5854546, -1.081198, 1.614595, 0.3333333, 0, 1, 1,
0.5861591, -0.935587, 1.882973, 0.3372549, 0, 1, 1,
0.5942494, -0.6719522, 2.139466, 0.345098, 0, 1, 1,
0.5980192, -0.6240817, 2.567901, 0.3490196, 0, 1, 1,
0.6057464, 0.6804095, 1.3664, 0.3568628, 0, 1, 1,
0.6095648, 0.8032521, 1.99105, 0.3607843, 0, 1, 1,
0.609975, -0.516325, 4.507637, 0.3686275, 0, 1, 1,
0.6101841, -0.5212213, 3.368824, 0.372549, 0, 1, 1,
0.6133347, -0.6414933, 2.20104, 0.3803922, 0, 1, 1,
0.615328, 0.4846429, 2.631524, 0.3843137, 0, 1, 1,
0.6240554, -1.320123, 3.587679, 0.3921569, 0, 1, 1,
0.6250173, -1.067735, 1.295174, 0.3960784, 0, 1, 1,
0.6281004, 1.353522, 1.43597, 0.4039216, 0, 1, 1,
0.6295779, 0.4395164, 0.9809974, 0.4117647, 0, 1, 1,
0.6331211, 0.0007797854, 1.975036, 0.4156863, 0, 1, 1,
0.6349095, -2.195626, 2.666322, 0.4235294, 0, 1, 1,
0.6350257, -0.6494724, 3.270631, 0.427451, 0, 1, 1,
0.6366472, 0.2981656, 1.02633, 0.4352941, 0, 1, 1,
0.6399618, -0.3178271, 0.8560994, 0.4392157, 0, 1, 1,
0.6405479, 0.05635393, 1.755245, 0.4470588, 0, 1, 1,
0.6442493, -0.1820104, 2.129313, 0.4509804, 0, 1, 1,
0.6449737, 0.7726325, 0.8364451, 0.4588235, 0, 1, 1,
0.6476432, 0.0217267, 1.541771, 0.4627451, 0, 1, 1,
0.6497077, -0.03395443, 2.358377, 0.4705882, 0, 1, 1,
0.6594776, 1.200662, 0.2039628, 0.4745098, 0, 1, 1,
0.6601599, -1.029839, 4.159103, 0.4823529, 0, 1, 1,
0.6605667, -1.075645, 3.462784, 0.4862745, 0, 1, 1,
0.6690053, -0.6669213, 2.373201, 0.4941176, 0, 1, 1,
0.6741995, 0.5409973, 1.593014, 0.5019608, 0, 1, 1,
0.674297, 0.6222605, 0.04711034, 0.5058824, 0, 1, 1,
0.677963, 0.4206396, 0.7180126, 0.5137255, 0, 1, 1,
0.6839231, -0.4803513, 2.710716, 0.5176471, 0, 1, 1,
0.6841018, 0.806728, 0.1201591, 0.5254902, 0, 1, 1,
0.6853628, 0.8584544, 0.04304493, 0.5294118, 0, 1, 1,
0.6905988, 0.2548751, 1.531209, 0.5372549, 0, 1, 1,
0.6923441, 0.009829901, 0.3352744, 0.5411765, 0, 1, 1,
0.6994131, 0.4946944, 0.9251666, 0.5490196, 0, 1, 1,
0.700048, 0.3465635, 2.314306, 0.5529412, 0, 1, 1,
0.7049579, 1.044175, 1.46851, 0.5607843, 0, 1, 1,
0.7093967, 2.247731, -0.3019099, 0.5647059, 0, 1, 1,
0.7123872, -2.616803, 2.274163, 0.572549, 0, 1, 1,
0.7133082, -0.4836869, 3.284784, 0.5764706, 0, 1, 1,
0.7144887, -2.221003, 1.430227, 0.5843138, 0, 1, 1,
0.714774, 1.090378, -0.9242033, 0.5882353, 0, 1, 1,
0.7158226, -0.7799289, 1.880622, 0.5960785, 0, 1, 1,
0.7166139, -0.01491893, 3.356821, 0.6039216, 0, 1, 1,
0.7177398, -1.389989, 1.113571, 0.6078432, 0, 1, 1,
0.7249596, 1.461839, -0.7028112, 0.6156863, 0, 1, 1,
0.7260496, -0.01273785, 1.0962, 0.6196079, 0, 1, 1,
0.7276454, 1.098946, 0.3500866, 0.627451, 0, 1, 1,
0.7293076, -0.126581, 1.736217, 0.6313726, 0, 1, 1,
0.7358459, -1.366182, 3.65408, 0.6392157, 0, 1, 1,
0.7379503, -1.460649, 2.026422, 0.6431373, 0, 1, 1,
0.7415001, -0.9416323, 2.059772, 0.6509804, 0, 1, 1,
0.7429366, -1.216493, 3.37476, 0.654902, 0, 1, 1,
0.7433875, -0.49029, 1.574807, 0.6627451, 0, 1, 1,
0.7445254, 0.3748764, -0.2968393, 0.6666667, 0, 1, 1,
0.7480993, -1.534556, 4.997748, 0.6745098, 0, 1, 1,
0.7510636, -0.6834548, 2.265893, 0.6784314, 0, 1, 1,
0.7564765, 1.291499, -0.1238297, 0.6862745, 0, 1, 1,
0.7612157, -1.412993, 2.244745, 0.6901961, 0, 1, 1,
0.7680272, 0.0348825, 0.4878735, 0.6980392, 0, 1, 1,
0.7703026, 0.1266015, 1.739133, 0.7058824, 0, 1, 1,
0.7725073, -0.07207597, 1.615302, 0.7098039, 0, 1, 1,
0.7751861, 2.19961, 0.8358414, 0.7176471, 0, 1, 1,
0.7785574, 0.9882976, 0.1646071, 0.7215686, 0, 1, 1,
0.7798909, -0.3522516, 2.066526, 0.7294118, 0, 1, 1,
0.7850608, -0.9833307, 2.719205, 0.7333333, 0, 1, 1,
0.7861568, 1.040498, 0.4814511, 0.7411765, 0, 1, 1,
0.7873049, 1.104937, 1.86568, 0.7450981, 0, 1, 1,
0.7972642, 0.4236095, 1.285165, 0.7529412, 0, 1, 1,
0.7985103, -0.4424916, 2.801763, 0.7568628, 0, 1, 1,
0.7992678, 0.9738963, 0.2128334, 0.7647059, 0, 1, 1,
0.8061187, -0.08780123, 4.042892, 0.7686275, 0, 1, 1,
0.8083687, 1.530189, -0.3218944, 0.7764706, 0, 1, 1,
0.8107052, 0.1661008, 0.1144208, 0.7803922, 0, 1, 1,
0.8204121, 0.8763984, -0.1544443, 0.7882353, 0, 1, 1,
0.8235646, -0.7837461, 2.329855, 0.7921569, 0, 1, 1,
0.8294093, -0.1779657, 2.776098, 0.8, 0, 1, 1,
0.8297021, -1.892872, 3.732867, 0.8078431, 0, 1, 1,
0.8337461, 0.5355054, 1.760319, 0.8117647, 0, 1, 1,
0.83622, -0.03911629, 0.7690659, 0.8196079, 0, 1, 1,
0.8437903, 0.8277214, 0.5514736, 0.8235294, 0, 1, 1,
0.8444868, -1.104214, 3.254606, 0.8313726, 0, 1, 1,
0.849297, 0.8536157, 1.289664, 0.8352941, 0, 1, 1,
0.8599781, 0.6295914, 1.386136, 0.8431373, 0, 1, 1,
0.8680858, 0.1245409, 0.9243512, 0.8470588, 0, 1, 1,
0.8697368, 0.8315066, 1.891218, 0.854902, 0, 1, 1,
0.8755891, 0.2026562, -0.117533, 0.8588235, 0, 1, 1,
0.8759825, -0.04740958, 0.6917837, 0.8666667, 0, 1, 1,
0.8845726, -0.7099829, 3.999731, 0.8705882, 0, 1, 1,
0.8905785, -0.4590962, 1.150949, 0.8784314, 0, 1, 1,
0.8916552, 0.03579476, 1.129691, 0.8823529, 0, 1, 1,
0.8985136, -0.9153454, 3.016571, 0.8901961, 0, 1, 1,
0.9040966, 0.8175201, 1.875872, 0.8941177, 0, 1, 1,
0.9051038, -1.685506, 2.531369, 0.9019608, 0, 1, 1,
0.911487, 0.4885055, 1.485625, 0.9098039, 0, 1, 1,
0.9129869, -0.1767579, 1.70506, 0.9137255, 0, 1, 1,
0.9138449, -0.7891847, 1.882181, 0.9215686, 0, 1, 1,
0.9165705, -0.1517349, 0.6261132, 0.9254902, 0, 1, 1,
0.9212807, -0.276768, 1.389252, 0.9333333, 0, 1, 1,
0.921809, 0.4854866, 1.454627, 0.9372549, 0, 1, 1,
0.9247139, -0.788475, 2.634574, 0.945098, 0, 1, 1,
0.929745, -0.0001160165, 2.324682, 0.9490196, 0, 1, 1,
0.9306396, -1.014866, 1.034672, 0.9568627, 0, 1, 1,
0.932605, 0.4622242, 0.06624024, 0.9607843, 0, 1, 1,
0.9405127, 1.240166, 0.7206621, 0.9686275, 0, 1, 1,
0.9480572, -0.4438823, 1.758971, 0.972549, 0, 1, 1,
0.9627609, 0.8444081, -0.6633749, 0.9803922, 0, 1, 1,
0.9662442, -1.097082, 1.855419, 0.9843137, 0, 1, 1,
0.9791149, -0.5822449, 1.925415, 0.9921569, 0, 1, 1,
0.9800773, -0.9840915, 1.810117, 0.9960784, 0, 1, 1,
0.9812835, 0.7896519, 1.566997, 1, 0, 0.9960784, 1,
0.9864886, -0.5794898, 2.290735, 1, 0, 0.9882353, 1,
0.9898592, -1.390526, 2.186581, 1, 0, 0.9843137, 1,
0.9902343, -1.07385, 3.330964, 1, 0, 0.9764706, 1,
0.9947805, -0.2162685, 0.727906, 1, 0, 0.972549, 1,
0.9965625, 1.05801, 2.059231, 1, 0, 0.9647059, 1,
1.003599, -0.5731813, 2.419444, 1, 0, 0.9607843, 1,
1.009372, 0.6811867, 0.4948969, 1, 0, 0.9529412, 1,
1.009937, -0.2546674, 2.851048, 1, 0, 0.9490196, 1,
1.013356, 1.268025, -0.2730005, 1, 0, 0.9411765, 1,
1.013822, -0.3996502, 1.980448, 1, 0, 0.9372549, 1,
1.01654, 0.06300119, 2.573673, 1, 0, 0.9294118, 1,
1.017926, -0.7925243, -0.03180056, 1, 0, 0.9254902, 1,
1.020536, -0.9658625, 2.125206, 1, 0, 0.9176471, 1,
1.022793, 1.376953, -0.5631372, 1, 0, 0.9137255, 1,
1.024565, 1.187919, 0.7742679, 1, 0, 0.9058824, 1,
1.027344, 0.4423466, 2.599964, 1, 0, 0.9019608, 1,
1.028459, 1.035203, 1.271605, 1, 0, 0.8941177, 1,
1.032829, 1.187122, 1.618599, 1, 0, 0.8862745, 1,
1.04069, -0.5086085, 1.905681, 1, 0, 0.8823529, 1,
1.042183, -2.181578, 3.526433, 1, 0, 0.8745098, 1,
1.044245, 0.1098155, 1.278022, 1, 0, 0.8705882, 1,
1.044799, -0.2113317, 2.380035, 1, 0, 0.8627451, 1,
1.04586, -0.72912, 3.147927, 1, 0, 0.8588235, 1,
1.048665, -0.538509, 2.027642, 1, 0, 0.8509804, 1,
1.050852, -0.01720299, 2.484275, 1, 0, 0.8470588, 1,
1.051826, -0.01357688, 1.399312, 1, 0, 0.8392157, 1,
1.05212, -0.5301407, 2.443901, 1, 0, 0.8352941, 1,
1.055515, -1.691517, 4.296475, 1, 0, 0.827451, 1,
1.058379, -0.7046478, 1.685364, 1, 0, 0.8235294, 1,
1.062169, -0.3803832, 2.045496, 1, 0, 0.8156863, 1,
1.065596, -0.5633031, 2.447435, 1, 0, 0.8117647, 1,
1.077111, -1.192408, 2.273933, 1, 0, 0.8039216, 1,
1.079258, -0.2183887, 1.717118, 1, 0, 0.7960784, 1,
1.080007, -1.285145, 2.879822, 1, 0, 0.7921569, 1,
1.092016, -0.1519894, 1.811632, 1, 0, 0.7843137, 1,
1.09546, -1.6071, 1.276374, 1, 0, 0.7803922, 1,
1.097732, -3.210915, 1.509179, 1, 0, 0.772549, 1,
1.101047, -1.80814, 2.31461, 1, 0, 0.7686275, 1,
1.105523, -0.9128036, 2.230335, 1, 0, 0.7607843, 1,
1.11116, -0.8573008, 2.993642, 1, 0, 0.7568628, 1,
1.11511, 0.7820871, 0.7815697, 1, 0, 0.7490196, 1,
1.130501, -0.3216262, 0.7784383, 1, 0, 0.7450981, 1,
1.136735, 0.8346659, 0.9027942, 1, 0, 0.7372549, 1,
1.141825, 0.6127036, 0.0695487, 1, 0, 0.7333333, 1,
1.143128, -0.4804644, 2.821719, 1, 0, 0.7254902, 1,
1.155465, -1.06245, 3.167295, 1, 0, 0.7215686, 1,
1.16016, 0.1371869, 2.660532, 1, 0, 0.7137255, 1,
1.161013, 0.215702, 2.390181, 1, 0, 0.7098039, 1,
1.161358, 1.483761, 0.2574458, 1, 0, 0.7019608, 1,
1.170393, -0.8755196, 1.355036, 1, 0, 0.6941177, 1,
1.188668, -0.6635759, 0.948599, 1, 0, 0.6901961, 1,
1.189039, 0.3171941, -0.2916732, 1, 0, 0.682353, 1,
1.191221, 1.431637, 0.7198678, 1, 0, 0.6784314, 1,
1.193505, -0.8998286, 1.709823, 1, 0, 0.6705883, 1,
1.197478, 1.247205, 0.8352934, 1, 0, 0.6666667, 1,
1.204755, 0.2596771, 0.01899805, 1, 0, 0.6588235, 1,
1.206864, -0.744023, 2.958239, 1, 0, 0.654902, 1,
1.220111, 0.393637, 1.11322, 1, 0, 0.6470588, 1,
1.239088, 0.3510622, 0.1875305, 1, 0, 0.6431373, 1,
1.243071, 0.8095894, 1.579069, 1, 0, 0.6352941, 1,
1.245894, 1.020327, -0.07531978, 1, 0, 0.6313726, 1,
1.248765, 0.4356313, 0.1599437, 1, 0, 0.6235294, 1,
1.266475, -0.2787451, 2.645629, 1, 0, 0.6196079, 1,
1.277633, 0.9372175, -0.7446137, 1, 0, 0.6117647, 1,
1.279528, 0.4904887, 2.408196, 1, 0, 0.6078432, 1,
1.280054, -1.436506, 3.006512, 1, 0, 0.6, 1,
1.284965, 1.523066, 1.737565, 1, 0, 0.5921569, 1,
1.285924, 0.1371225, 2.197959, 1, 0, 0.5882353, 1,
1.294629, -0.08734392, 1.607076, 1, 0, 0.5803922, 1,
1.29875, -0.2639341, 1.440342, 1, 0, 0.5764706, 1,
1.299909, 0.3772401, 0.8977811, 1, 0, 0.5686275, 1,
1.300758, -0.4327826, 1.952025, 1, 0, 0.5647059, 1,
1.30561, 0.4590063, 1.794863, 1, 0, 0.5568628, 1,
1.32312, -0.6503432, 1.571421, 1, 0, 0.5529412, 1,
1.323956, 1.194027, 2.334055, 1, 0, 0.5450981, 1,
1.32533, 0.9120948, 2.739574, 1, 0, 0.5411765, 1,
1.342114, 1.251367, 0.4637175, 1, 0, 0.5333334, 1,
1.343129, -2.655684, 4.819213, 1, 0, 0.5294118, 1,
1.34793, 0.9653288, 0.4826896, 1, 0, 0.5215687, 1,
1.349801, -0.4899121, 0.1690204, 1, 0, 0.5176471, 1,
1.351539, -0.2890188, 1.839663, 1, 0, 0.509804, 1,
1.361791, -0.4545995, 2.223962, 1, 0, 0.5058824, 1,
1.381317, 0.1157997, 2.284554, 1, 0, 0.4980392, 1,
1.383323, -0.661877, 3.631114, 1, 0, 0.4901961, 1,
1.387893, -0.4912129, 1.728207, 1, 0, 0.4862745, 1,
1.388131, -1.015401, 1.405093, 1, 0, 0.4784314, 1,
1.389985, 0.8020724, 0.7265912, 1, 0, 0.4745098, 1,
1.390486, -0.9432815, 2.385436, 1, 0, 0.4666667, 1,
1.391171, 0.4925826, 0.5413975, 1, 0, 0.4627451, 1,
1.393761, -1.43454, 2.484591, 1, 0, 0.454902, 1,
1.418369, -0.7848177, 1.741377, 1, 0, 0.4509804, 1,
1.435811, -0.02121311, 2.987867, 1, 0, 0.4431373, 1,
1.438591, -0.4828743, 0.9335601, 1, 0, 0.4392157, 1,
1.438625, -2.297421, 1.337433, 1, 0, 0.4313726, 1,
1.439653, -1.942279, 2.336451, 1, 0, 0.427451, 1,
1.440444, -0.07221416, 2.643672, 1, 0, 0.4196078, 1,
1.44217, -0.02421152, 1.732733, 1, 0, 0.4156863, 1,
1.464287, 1.304309, -0.5097703, 1, 0, 0.4078431, 1,
1.469658, -1.533054, 3.991406, 1, 0, 0.4039216, 1,
1.48355, 1.389094, 2.656171, 1, 0, 0.3960784, 1,
1.495269, 1.566743, 0.1479419, 1, 0, 0.3882353, 1,
1.499529, -0.552092, 1.714899, 1, 0, 0.3843137, 1,
1.507632, -0.1656878, 1.313402, 1, 0, 0.3764706, 1,
1.52504, -0.3972311, 2.996213, 1, 0, 0.372549, 1,
1.530478, -0.5414689, 3.277072, 1, 0, 0.3647059, 1,
1.534574, 0.2227108, 1.087284, 1, 0, 0.3607843, 1,
1.54428, -0.05827811, 1.647277, 1, 0, 0.3529412, 1,
1.5485, -1.540685, 3.94047, 1, 0, 0.3490196, 1,
1.553507, 1.278617, 1.788136, 1, 0, 0.3411765, 1,
1.560852, -0.5697998, 2.449842, 1, 0, 0.3372549, 1,
1.563033, -0.09253121, 3.399145, 1, 0, 0.3294118, 1,
1.570142, 0.458171, 1.317264, 1, 0, 0.3254902, 1,
1.584252, 1.015026, 0.9739476, 1, 0, 0.3176471, 1,
1.585, 0.5026824, 2.544557, 1, 0, 0.3137255, 1,
1.612881, -0.8971454, 0.1433492, 1, 0, 0.3058824, 1,
1.632501, -0.3850321, 0.07930557, 1, 0, 0.2980392, 1,
1.634421, 0.589349, 1.156578, 1, 0, 0.2941177, 1,
1.641701, -0.8742337, 1.584773, 1, 0, 0.2862745, 1,
1.654528, 0.7837472, 1.627458, 1, 0, 0.282353, 1,
1.672376, 0.3022147, 0.8544503, 1, 0, 0.2745098, 1,
1.674369, 0.5187382, 1.454039, 1, 0, 0.2705882, 1,
1.68082, -0.8135843, 2.354248, 1, 0, 0.2627451, 1,
1.693779, -0.5755225, 1.591838, 1, 0, 0.2588235, 1,
1.705937, 0.09240874, 2.066092, 1, 0, 0.2509804, 1,
1.724945, 0.8819777, 0.7580087, 1, 0, 0.2470588, 1,
1.730172, -0.10078, 2.468688, 1, 0, 0.2392157, 1,
1.733586, 0.6261707, 0.6907536, 1, 0, 0.2352941, 1,
1.740742, -0.1319244, 1.996649, 1, 0, 0.227451, 1,
1.752551, -0.4813658, 1.405413, 1, 0, 0.2235294, 1,
1.753021, 0.002930987, 1.073016, 1, 0, 0.2156863, 1,
1.753068, 0.7740166, 0.3467166, 1, 0, 0.2117647, 1,
1.770511, 1.88603, 1.292558, 1, 0, 0.2039216, 1,
1.775649, -1.459767, 1.769015, 1, 0, 0.1960784, 1,
1.77819, 0.1616932, 0.4141197, 1, 0, 0.1921569, 1,
1.79995, 0.4798119, 0.6363601, 1, 0, 0.1843137, 1,
1.800269, 0.02178712, 1.736849, 1, 0, 0.1803922, 1,
1.800796, 0.8436769, -0.6542727, 1, 0, 0.172549, 1,
1.805708, 1.61643, 0.5482598, 1, 0, 0.1686275, 1,
1.82507, -1.156008, 3.965333, 1, 0, 0.1607843, 1,
1.849156, 0.3925905, 1.749246, 1, 0, 0.1568628, 1,
1.86466, 0.01183747, 2.736592, 1, 0, 0.1490196, 1,
1.910002, -0.003696733, 2.040454, 1, 0, 0.145098, 1,
1.913394, 2.434401, 1.228124, 1, 0, 0.1372549, 1,
1.920411, -0.8734717, 2.214832, 1, 0, 0.1333333, 1,
1.926622, 0.9010699, -0.5417566, 1, 0, 0.1254902, 1,
1.965732, -0.1985423, 2.113007, 1, 0, 0.1215686, 1,
2.012805, 0.9750432, -0.2936168, 1, 0, 0.1137255, 1,
2.031405, 1.836831, 0.8525386, 1, 0, 0.1098039, 1,
2.118932, 1.435889, 1.056495, 1, 0, 0.1019608, 1,
2.133415, 2.600359, 2.482628, 1, 0, 0.09411765, 1,
2.135635, -1.329461, 1.354988, 1, 0, 0.09019608, 1,
2.166549, -1.214759, 2.143435, 1, 0, 0.08235294, 1,
2.205195, 0.00633755, 0.9512048, 1, 0, 0.07843138, 1,
2.301766, 1.020494, 2.653275, 1, 0, 0.07058824, 1,
2.303847, 0.1444508, 1.164089, 1, 0, 0.06666667, 1,
2.305093, 0.3343451, 1.941942, 1, 0, 0.05882353, 1,
2.338673, -0.4832728, 0.8223345, 1, 0, 0.05490196, 1,
2.340601, -1.318233, 1.439957, 1, 0, 0.04705882, 1,
2.386271, 0.02120187, 1.991821, 1, 0, 0.04313726, 1,
2.595255, -0.3582196, 1.583222, 1, 0, 0.03529412, 1,
2.603841, -0.1238428, 0.5019188, 1, 0, 0.03137255, 1,
2.632097, -0.07031557, 1.432366, 1, 0, 0.02352941, 1,
2.657262, -0.8073786, 2.080121, 1, 0, 0.01960784, 1,
2.997253, 0.05811885, 2.705574, 1, 0, 0.01176471, 1,
3.388872, 1.895099, -0.9716994, 1, 0, 0.007843138, 1
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
0.2277464, -4.463624, -7.225702, 0, -0.5, 0.5, 0.5,
0.2277464, -4.463624, -7.225702, 1, -0.5, 0.5, 0.5,
0.2277464, -4.463624, -7.225702, 1, 1.5, 0.5, 0.5,
0.2277464, -4.463624, -7.225702, 0, 1.5, 0.5, 0.5
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
-4.005001, -0.01451027, -7.225702, 0, -0.5, 0.5, 0.5,
-4.005001, -0.01451027, -7.225702, 1, -0.5, 0.5, 0.5,
-4.005001, -0.01451027, -7.225702, 1, 1.5, 0.5, 0.5,
-4.005001, -0.01451027, -7.225702, 0, 1.5, 0.5, 0.5
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
-4.005001, -4.463624, -0.01369238, 0, -0.5, 0.5, 0.5,
-4.005001, -4.463624, -0.01369238, 1, -0.5, 0.5, 0.5,
-4.005001, -4.463624, -0.01369238, 1, 1.5, 0.5, 0.5,
-4.005001, -4.463624, -0.01369238, 0, 1.5, 0.5, 0.5
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
-2, -3.436905, -5.561392,
3, -3.436905, -5.561392,
-2, -3.436905, -5.561392,
-2, -3.608025, -5.838777,
-1, -3.436905, -5.561392,
-1, -3.608025, -5.838777,
0, -3.436905, -5.561392,
0, -3.608025, -5.838777,
1, -3.436905, -5.561392,
1, -3.608025, -5.838777,
2, -3.436905, -5.561392,
2, -3.608025, -5.838777,
3, -3.436905, -5.561392,
3, -3.608025, -5.838777
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
-2, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
-2, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
-2, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
-2, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5,
-1, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
-1, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
-1, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
-1, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5,
0, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
0, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
0, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
0, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5,
1, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
1, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
1, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
1, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5,
2, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
2, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
2, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
2, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5,
3, -3.950264, -6.393547, 0, -0.5, 0.5, 0.5,
3, -3.950264, -6.393547, 1, -0.5, 0.5, 0.5,
3, -3.950264, -6.393547, 1, 1.5, 0.5, 0.5,
3, -3.950264, -6.393547, 0, 1.5, 0.5, 0.5
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
-3.028213, -3, -5.561392,
-3.028213, 3, -5.561392,
-3.028213, -3, -5.561392,
-3.191011, -3, -5.838777,
-3.028213, -2, -5.561392,
-3.191011, -2, -5.838777,
-3.028213, -1, -5.561392,
-3.191011, -1, -5.838777,
-3.028213, 0, -5.561392,
-3.191011, 0, -5.838777,
-3.028213, 1, -5.561392,
-3.191011, 1, -5.838777,
-3.028213, 2, -5.561392,
-3.191011, 2, -5.838777,
-3.028213, 3, -5.561392,
-3.191011, 3, -5.838777
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
-3.516607, -3, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, -3, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, -3, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, -3, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, -2, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, -2, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, -2, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, -2, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, -1, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, -1, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, -1, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, -1, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, 0, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, 0, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, 0, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, 0, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, 1, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, 1, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, 1, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, 1, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, 2, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, 2, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, 2, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, 2, -6.393547, 0, 1.5, 0.5, 0.5,
-3.516607, 3, -6.393547, 0, -0.5, 0.5, 0.5,
-3.516607, 3, -6.393547, 1, -0.5, 0.5, 0.5,
-3.516607, 3, -6.393547, 1, 1.5, 0.5, 0.5,
-3.516607, 3, -6.393547, 0, 1.5, 0.5, 0.5
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
-3.028213, -3.436905, -4,
-3.028213, -3.436905, 4,
-3.028213, -3.436905, -4,
-3.191011, -3.608025, -4,
-3.028213, -3.436905, -2,
-3.191011, -3.608025, -2,
-3.028213, -3.436905, 0,
-3.191011, -3.608025, 0,
-3.028213, -3.436905, 2,
-3.191011, -3.608025, 2,
-3.028213, -3.436905, 4,
-3.191011, -3.608025, 4
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
-3.516607, -3.950264, -4, 0, -0.5, 0.5, 0.5,
-3.516607, -3.950264, -4, 1, -0.5, 0.5, 0.5,
-3.516607, -3.950264, -4, 1, 1.5, 0.5, 0.5,
-3.516607, -3.950264, -4, 0, 1.5, 0.5, 0.5,
-3.516607, -3.950264, -2, 0, -0.5, 0.5, 0.5,
-3.516607, -3.950264, -2, 1, -0.5, 0.5, 0.5,
-3.516607, -3.950264, -2, 1, 1.5, 0.5, 0.5,
-3.516607, -3.950264, -2, 0, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 0, 0, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 0, 1, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 0, 1, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 0, 0, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 2, 0, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 2, 1, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 2, 1, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 2, 0, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 4, 0, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 4, 1, -0.5, 0.5, 0.5,
-3.516607, -3.950264, 4, 1, 1.5, 0.5, 0.5,
-3.516607, -3.950264, 4, 0, 1.5, 0.5, 0.5
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
-3.028213, -3.436905, -5.561392,
-3.028213, 3.407884, -5.561392,
-3.028213, -3.436905, 5.534007,
-3.028213, 3.407884, 5.534007,
-3.028213, -3.436905, -5.561392,
-3.028213, -3.436905, 5.534007,
-3.028213, 3.407884, -5.561392,
-3.028213, 3.407884, 5.534007,
-3.028213, -3.436905, -5.561392,
3.483706, -3.436905, -5.561392,
-3.028213, -3.436905, 5.534007,
3.483706, -3.436905, 5.534007,
-3.028213, 3.407884, -5.561392,
3.483706, 3.407884, -5.561392,
-3.028213, 3.407884, 5.534007,
3.483706, 3.407884, 5.534007,
3.483706, -3.436905, -5.561392,
3.483706, 3.407884, -5.561392,
3.483706, -3.436905, 5.534007,
3.483706, 3.407884, 5.534007,
3.483706, -3.436905, -5.561392,
3.483706, -3.436905, 5.534007,
3.483706, 3.407884, -5.561392,
3.483706, 3.407884, 5.534007
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
var radius = 7.781548;
var distance = 34.62099;
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
mvMatrix.translate( -0.2277464, 0.01451027, 0.01369238 );
mvMatrix.scale( 1.292025, 1.229192, 0.7582929 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62099);
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
3-ethoxycarbonylamin<-read.table("3-ethoxycarbonylamin.xyz", skip=1)
```

```
## Error in read.table("3-ethoxycarbonylamin.xyz", skip = 1): duplicate 'row.names' are not allowed
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
-2.933379, 0.8149761, 0.3983187, 0, 0, 1, 1, 1,
-2.905892, 1.212342, -0.3901916, 1, 0, 0, 1, 1,
-2.828347, 2.380555, -0.07806237, 1, 0, 0, 1, 1,
-2.8218, 0.3614788, -0.4039547, 1, 0, 0, 1, 1,
-2.807796, 0.116483, -3.018036, 1, 0, 0, 1, 1,
-2.505575, -0.9996108, -4.153368, 1, 0, 0, 1, 1,
-2.484408, -0.4472587, -1.871852, 0, 0, 0, 1, 1,
-2.454611, -1.999704, -1.233985, 0, 0, 0, 1, 1,
-2.374011, 0.04185351, -1.581447, 0, 0, 0, 1, 1,
-2.374007, -0.6790481, -2.321914, 0, 0, 0, 1, 1,
-2.315007, -0.2922162, -0.7030358, 0, 0, 0, 1, 1,
-2.297265, -0.4337991, -1.257803, 0, 0, 0, 1, 1,
-2.274049, 0.3169256, -0.4260819, 0, 0, 0, 1, 1,
-2.257131, -1.594369, -2.559002, 1, 1, 1, 1, 1,
-2.249125, -1.01851, -0.4280077, 1, 1, 1, 1, 1,
-2.219191, 1.702855, -1.005802, 1, 1, 1, 1, 1,
-2.138335, -0.0501166, -1.008982, 1, 1, 1, 1, 1,
-2.113583, 0.2594127, -2.933312, 1, 1, 1, 1, 1,
-2.077942, -3.337224, -3.301144, 1, 1, 1, 1, 1,
-2.071062, 0.7080361, -0.9991879, 1, 1, 1, 1, 1,
-2.067611, 1.631617, -1.347087, 1, 1, 1, 1, 1,
-2.032369, 0.960224, -2.410776, 1, 1, 1, 1, 1,
-2.02815, -1.473699, -4.274295, 1, 1, 1, 1, 1,
-2.026096, -1.541379, -3.29002, 1, 1, 1, 1, 1,
-2.021234, 2.166547, -0.3404515, 1, 1, 1, 1, 1,
-2.006196, 0.4319426, -1.451068, 1, 1, 1, 1, 1,
-1.972104, -1.0014, -1.318206, 1, 1, 1, 1, 1,
-1.942361, 0.4772354, -2.111446, 1, 1, 1, 1, 1,
-1.937967, 0.2787914, -1.150259, 0, 0, 1, 1, 1,
-1.934595, 0.408289, -1.206861, 1, 0, 0, 1, 1,
-1.905608, 0.2209505, -3.077677, 1, 0, 0, 1, 1,
-1.888729, -1.294042, -2.109874, 1, 0, 0, 1, 1,
-1.88565, -1.580641, -1.855783, 1, 0, 0, 1, 1,
-1.868208, -0.3544422, -2.057494, 1, 0, 0, 1, 1,
-1.854646, 0.01496847, -2.067398, 0, 0, 0, 1, 1,
-1.849203, -0.6472228, -1.257858, 0, 0, 0, 1, 1,
-1.841039, -0.8981698, -3.417771, 0, 0, 0, 1, 1,
-1.803842, 0.6198944, -1.671882, 0, 0, 0, 1, 1,
-1.768331, -0.4927513, -1.61057, 0, 0, 0, 1, 1,
-1.763923, 0.06465683, -1.506606, 0, 0, 0, 1, 1,
-1.763582, -1.417961, -1.246903, 0, 0, 0, 1, 1,
-1.757739, 0.9615558, 0.8292223, 1, 1, 1, 1, 1,
-1.757102, -0.3110297, -1.587597, 1, 1, 1, 1, 1,
-1.747788, -0.4038586, -2.266657, 1, 1, 1, 1, 1,
-1.723463, 0.8135596, -1.13156, 1, 1, 1, 1, 1,
-1.718871, 1.69533, -2.671606, 1, 1, 1, 1, 1,
-1.709467, -0.7235927, -0.3986155, 1, 1, 1, 1, 1,
-1.691975, -1.148501, -1.457484, 1, 1, 1, 1, 1,
-1.685838, -1.367, -2.53655, 1, 1, 1, 1, 1,
-1.674749, 0.8644497, -0.5604321, 1, 1, 1, 1, 1,
-1.674285, -1.848624, -2.605885, 1, 1, 1, 1, 1,
-1.668736, 2.324116, 0.9143566, 1, 1, 1, 1, 1,
-1.662492, 1.427216, -1.926509, 1, 1, 1, 1, 1,
-1.659735, 0.9012892, -1.323947, 1, 1, 1, 1, 1,
-1.647515, -0.8106624, -1.761789, 1, 1, 1, 1, 1,
-1.625228, 3.067266, -0.7901883, 1, 1, 1, 1, 1,
-1.614095, 0.8131788, -0.4647911, 0, 0, 1, 1, 1,
-1.609647, 0.7671417, -0.1016292, 1, 0, 0, 1, 1,
-1.599031, -1.450303, -0.1843975, 1, 0, 0, 1, 1,
-1.591847, -1.291752, -1.534859, 1, 0, 0, 1, 1,
-1.579515, -0.5241618, -1.769869, 1, 0, 0, 1, 1,
-1.57689, 0.8524181, -2.192014, 1, 0, 0, 1, 1,
-1.570883, -0.839036, -2.244107, 0, 0, 0, 1, 1,
-1.568775, -0.3799196, -2.224804, 0, 0, 0, 1, 1,
-1.560472, 0.2374341, -1.014366, 0, 0, 0, 1, 1,
-1.557875, -0.544265, -2.405677, 0, 0, 0, 1, 1,
-1.556256, 0.3788413, 0.1051919, 0, 0, 0, 1, 1,
-1.552506, -0.1148022, -1.494102, 0, 0, 0, 1, 1,
-1.549641, -0.331048, -1.68706, 0, 0, 0, 1, 1,
-1.545842, 0.1595076, -1.313536, 1, 1, 1, 1, 1,
-1.543885, 0.3464502, -3.380331, 1, 1, 1, 1, 1,
-1.540483, -0.7206985, -2.661159, 1, 1, 1, 1, 1,
-1.521922, -0.1842451, -1.091102, 1, 1, 1, 1, 1,
-1.520511, 0.5446853, -1.758334, 1, 1, 1, 1, 1,
-1.52029, -1.434197, -2.178248, 1, 1, 1, 1, 1,
-1.511935, -0.3531866, -2.076025, 1, 1, 1, 1, 1,
-1.510646, 0.2121686, -1.073019, 1, 1, 1, 1, 1,
-1.495033, -0.8963718, -2.987859, 1, 1, 1, 1, 1,
-1.49277, -0.9779766, -2.914663, 1, 1, 1, 1, 1,
-1.490453, -0.8791773, -3.530676, 1, 1, 1, 1, 1,
-1.47117, -0.2155015, -2.238332, 1, 1, 1, 1, 1,
-1.469746, 0.7737843, -1.027597, 1, 1, 1, 1, 1,
-1.465255, -1.36741, -4.268341, 1, 1, 1, 1, 1,
-1.464596, 0.1584929, -3.106425, 1, 1, 1, 1, 1,
-1.461002, -0.3927718, -1.803644, 0, 0, 1, 1, 1,
-1.46043, -1.840282, -2.876431, 1, 0, 0, 1, 1,
-1.459663, 1.726846, -0.9017928, 1, 0, 0, 1, 1,
-1.458152, -0.5530142, -2.151457, 1, 0, 0, 1, 1,
-1.456061, -0.8296964, -2.083424, 1, 0, 0, 1, 1,
-1.452756, -0.6628219, -1.341987, 1, 0, 0, 1, 1,
-1.441068, 0.2557715, -2.608051, 0, 0, 0, 1, 1,
-1.433798, -0.9055555, -3.014614, 0, 0, 0, 1, 1,
-1.432614, 0.3675533, -1.282649, 0, 0, 0, 1, 1,
-1.432292, 1.573678, -0.02122338, 0, 0, 0, 1, 1,
-1.422805, 0.9200977, -1.43633, 0, 0, 0, 1, 1,
-1.421743, 0.3539872, -1.587896, 0, 0, 0, 1, 1,
-1.40335, -0.02728553, 0.01816508, 0, 0, 0, 1, 1,
-1.399215, -1.157494, -1.184473, 1, 1, 1, 1, 1,
-1.382804, -0.698493, -2.452877, 1, 1, 1, 1, 1,
-1.378394, 0.6076788, -0.6437221, 1, 1, 1, 1, 1,
-1.377848, 0.4917934, -2.241082, 1, 1, 1, 1, 1,
-1.361355, 0.2942017, -1.994411, 1, 1, 1, 1, 1,
-1.357652, -0.7622774, -2.073606, 1, 1, 1, 1, 1,
-1.334128, -0.7989591, -2.395086, 1, 1, 1, 1, 1,
-1.332064, -0.5017651, -4.374978, 1, 1, 1, 1, 1,
-1.329665, -0.7218633, -0.6016891, 1, 1, 1, 1, 1,
-1.329608, 1.721314, -0.7571101, 1, 1, 1, 1, 1,
-1.310093, -0.4379677, -2.130179, 1, 1, 1, 1, 1,
-1.289359, -1.203867, -1.167932, 1, 1, 1, 1, 1,
-1.285189, -0.03882792, -5.399808, 1, 1, 1, 1, 1,
-1.281688, -0.4787684, -0.3660244, 1, 1, 1, 1, 1,
-1.280939, -0.9647417, -1.974995, 1, 1, 1, 1, 1,
-1.253944, 0.4424084, -0.8655958, 0, 0, 1, 1, 1,
-1.250062, 1.19763, -2.022424, 1, 0, 0, 1, 1,
-1.249905, -0.4167571, -0.03518939, 1, 0, 0, 1, 1,
-1.24147, 0.8238422, -2.015439, 1, 0, 0, 1, 1,
-1.239182, -0.920881, -2.133194, 1, 0, 0, 1, 1,
-1.237454, -1.116164, -1.929316, 1, 0, 0, 1, 1,
-1.235159, 0.8951946, -1.077293, 0, 0, 0, 1, 1,
-1.214768, 0.3014306, -1.610343, 0, 0, 0, 1, 1,
-1.211497, 0.6938659, -2.341929, 0, 0, 0, 1, 1,
-1.211483, -0.795444, 0.1271581, 0, 0, 0, 1, 1,
-1.204935, 0.7456132, -1.132706, 0, 0, 0, 1, 1,
-1.203539, 0.3759114, -3.197105, 0, 0, 0, 1, 1,
-1.203316, 0.3151757, -1.176633, 0, 0, 0, 1, 1,
-1.195093, 0.9948189, -0.719883, 1, 1, 1, 1, 1,
-1.181196, -0.5651405, -2.429873, 1, 1, 1, 1, 1,
-1.173286, 1.09233, -0.8710246, 1, 1, 1, 1, 1,
-1.172805, 0.6346656, -2.353312, 1, 1, 1, 1, 1,
-1.169085, 0.3357849, -1.848645, 1, 1, 1, 1, 1,
-1.162589, 0.7033992, -0.4680927, 1, 1, 1, 1, 1,
-1.158731, 0.08507753, -0.6418895, 1, 1, 1, 1, 1,
-1.15006, 0.1819197, -1.728443, 1, 1, 1, 1, 1,
-1.143137, 0.0565837, -0.4068669, 1, 1, 1, 1, 1,
-1.140924, -1.380622, -3.107773, 1, 1, 1, 1, 1,
-1.136048, 1.003575, -1.129261, 1, 1, 1, 1, 1,
-1.130497, -0.8916922, -3.401677, 1, 1, 1, 1, 1,
-1.12794, -0.7122288, -2.041567, 1, 1, 1, 1, 1,
-1.126848, -1.125442, -1.55212, 1, 1, 1, 1, 1,
-1.126316, -1.432916, -2.485161, 1, 1, 1, 1, 1,
-1.123631, -0.5463254, -4.260561, 0, 0, 1, 1, 1,
-1.123099, -0.2310445, -0.9200685, 1, 0, 0, 1, 1,
-1.122424, -1.580015, -3.263712, 1, 0, 0, 1, 1,
-1.118675, 0.3323221, -2.155761, 1, 0, 0, 1, 1,
-1.115768, -0.5657817, -1.659193, 1, 0, 0, 1, 1,
-1.110898, -1.291599, -1.90994, 1, 0, 0, 1, 1,
-1.108022, -0.7200056, -1.000301, 0, 0, 0, 1, 1,
-1.101334, -2.067307, -2.836561, 0, 0, 0, 1, 1,
-1.097915, 1.511276, -0.2280454, 0, 0, 0, 1, 1,
-1.097431, -0.4480492, -1.015682, 0, 0, 0, 1, 1,
-1.097212, -0.07534413, -1.78405, 0, 0, 0, 1, 1,
-1.094484, -0.126897, -2.24671, 0, 0, 0, 1, 1,
-1.093845, 0.4681082, -1.834651, 0, 0, 0, 1, 1,
-1.093786, -0.543698, -1.72202, 1, 1, 1, 1, 1,
-1.088911, -0.07858853, -1.100724, 1, 1, 1, 1, 1,
-1.088728, 1.34057, -1.362135, 1, 1, 1, 1, 1,
-1.086371, -0.287815, -0.6431004, 1, 1, 1, 1, 1,
-1.08142, 0.9400736, -1.523143, 1, 1, 1, 1, 1,
-1.080466, 0.855401, -1.788463, 1, 1, 1, 1, 1,
-1.074662, 0.603747, -0.737852, 1, 1, 1, 1, 1,
-1.073518, -0.5199507, -2.290134, 1, 1, 1, 1, 1,
-1.069784, -1.362604, -1.965989, 1, 1, 1, 1, 1,
-1.06312, 1.433684, -0.3679586, 1, 1, 1, 1, 1,
-1.059377, 0.6016216, -1.644632, 1, 1, 1, 1, 1,
-1.059134, 1.177441, -1.444441, 1, 1, 1, 1, 1,
-1.047858, 0.1994267, -2.699202, 1, 1, 1, 1, 1,
-1.04675, -0.09636513, -2.951869, 1, 1, 1, 1, 1,
-1.025869, -0.8001434, -0.9355575, 1, 1, 1, 1, 1,
-1.012365, -2.121774, -4.01746, 0, 0, 1, 1, 1,
-1.009742, -0.1640902, -0.4391596, 1, 0, 0, 1, 1,
-1.005366, 1.125854, 0.08582361, 1, 0, 0, 1, 1,
-1.004397, -0.7180094, -2.460353, 1, 0, 0, 1, 1,
-1.003995, 1.360309, 0.7890688, 1, 0, 0, 1, 1,
-1.002156, -0.7711133, -1.631527, 1, 0, 0, 1, 1,
-0.9949352, 0.8624552, -1.718259, 0, 0, 0, 1, 1,
-0.9876339, 0.4466064, 1.012119, 0, 0, 0, 1, 1,
-0.9853212, 0.2501949, -3.010651, 0, 0, 0, 1, 1,
-0.9795787, 1.016615, -0.9843394, 0, 0, 0, 1, 1,
-0.9677534, -0.9306448, -2.721923, 0, 0, 0, 1, 1,
-0.9672713, -0.6535234, 0.7252194, 0, 0, 0, 1, 1,
-0.9626867, -1.396904, -1.96009, 0, 0, 0, 1, 1,
-0.9609249, -0.2193466, -2.550072, 1, 1, 1, 1, 1,
-0.9601921, -1.332323, -3.325882, 1, 1, 1, 1, 1,
-0.9521292, -0.8270545, -1.668186, 1, 1, 1, 1, 1,
-0.9487507, -0.1513835, -2.233881, 1, 1, 1, 1, 1,
-0.9350587, 0.6622302, -0.5550354, 1, 1, 1, 1, 1,
-0.9297989, 0.9853408, -1.974151, 1, 1, 1, 1, 1,
-0.9246255, -0.906671, -2.093243, 1, 1, 1, 1, 1,
-0.9235686, 0.6860709, -0.1422957, 1, 1, 1, 1, 1,
-0.9203085, -0.2277245, -1.257901, 1, 1, 1, 1, 1,
-0.9182734, -0.5961454, -3.070842, 1, 1, 1, 1, 1,
-0.9148057, -1.49617, -5.0845, 1, 1, 1, 1, 1,
-0.9017789, 0.5911578, -1.899095, 1, 1, 1, 1, 1,
-0.9013562, 0.07358078, -0.5897664, 1, 1, 1, 1, 1,
-0.8921584, -0.2511205, -0.2545697, 1, 1, 1, 1, 1,
-0.8892524, 0.2324986, -1.078363, 1, 1, 1, 1, 1,
-0.8890303, -0.02336308, -1.344113, 0, 0, 1, 1, 1,
-0.8885476, 1.449458, -1.480042, 1, 0, 0, 1, 1,
-0.8827177, 0.9542866, -0.5022101, 1, 0, 0, 1, 1,
-0.8805994, -0.1169856, -0.5322855, 1, 0, 0, 1, 1,
-0.8788179, 0.3278388, -1.186859, 1, 0, 0, 1, 1,
-0.8783501, -1.385516, -2.394593, 1, 0, 0, 1, 1,
-0.8783175, 0.6083057, 0.1168249, 0, 0, 0, 1, 1,
-0.8725882, 0.658059, -0.987039, 0, 0, 0, 1, 1,
-0.8714936, -0.9049385, -0.6916778, 0, 0, 0, 1, 1,
-0.8678628, -0.7845354, -1.243326, 0, 0, 0, 1, 1,
-0.8676484, -0.01544562, -1.107964, 0, 0, 0, 1, 1,
-0.8667693, 0.3189397, -3.23657, 0, 0, 0, 1, 1,
-0.8653052, -0.9507676, -2.627551, 0, 0, 0, 1, 1,
-0.861366, 0.937805, -0.01462481, 1, 1, 1, 1, 1,
-0.8541815, -0.6807674, -1.771702, 1, 1, 1, 1, 1,
-0.8525185, -0.5021789, -2.092606, 1, 1, 1, 1, 1,
-0.8506399, -1.571653, -2.906059, 1, 1, 1, 1, 1,
-0.8493733, 1.854926, -1.239497, 1, 1, 1, 1, 1,
-0.8197306, -0.6459342, -2.390079, 1, 1, 1, 1, 1,
-0.8136398, 1.54451, -1.014333, 1, 1, 1, 1, 1,
-0.8132755, -0.3319105, -3.805207, 1, 1, 1, 1, 1,
-0.8117816, -0.1745123, -0.194062, 1, 1, 1, 1, 1,
-0.8089253, 1.432768, -1.643283, 1, 1, 1, 1, 1,
-0.8040647, 0.3886736, -0.6082098, 1, 1, 1, 1, 1,
-0.7940951, 0.4884072, 0.04799223, 1, 1, 1, 1, 1,
-0.7845147, -0.7522256, -2.12942, 1, 1, 1, 1, 1,
-0.7844356, -0.166468, -1.658405, 1, 1, 1, 1, 1,
-0.7809433, 0.5949035, -0.7675794, 1, 1, 1, 1, 1,
-0.7785427, 2.2641, -1.244945, 0, 0, 1, 1, 1,
-0.7716591, -1.429946, -2.758182, 1, 0, 0, 1, 1,
-0.7670322, -1.157751, -2.173607, 1, 0, 0, 1, 1,
-0.766265, 0.7236624, -2.581899, 1, 0, 0, 1, 1,
-0.7602339, 0.1854241, -0.6655468, 1, 0, 0, 1, 1,
-0.7579538, -0.7580358, -2.920124, 1, 0, 0, 1, 1,
-0.7560845, -0.1022964, -1.204647, 0, 0, 0, 1, 1,
-0.7558947, 0.4068333, -0.9583623, 0, 0, 0, 1, 1,
-0.7543775, -1.928626, -2.52017, 0, 0, 0, 1, 1,
-0.7516207, 1.38414, -2.958853, 0, 0, 0, 1, 1,
-0.7505734, -0.1862741, -2.925251, 0, 0, 0, 1, 1,
-0.7455283, 0.4270258, -2.934423, 0, 0, 0, 1, 1,
-0.7421385, 0.08196826, -3.087733, 0, 0, 0, 1, 1,
-0.742009, 0.1352928, -1.831609, 1, 1, 1, 1, 1,
-0.7379493, -1.459314, -2.543365, 1, 1, 1, 1, 1,
-0.7348579, 1.242721, -1.009475, 1, 1, 1, 1, 1,
-0.7313781, 2.049433, 1.152296, 1, 1, 1, 1, 1,
-0.7248159, 1.296366, -1.119476, 1, 1, 1, 1, 1,
-0.7229161, 1.485289, 0.6126557, 1, 1, 1, 1, 1,
-0.7221595, 2.40273, 0.5459489, 1, 1, 1, 1, 1,
-0.7111998, 1.813531, -1.09859, 1, 1, 1, 1, 1,
-0.7109662, -0.6329414, -2.66413, 1, 1, 1, 1, 1,
-0.7100429, 0.5347331, -0.3034452, 1, 1, 1, 1, 1,
-0.7070791, 0.216958, -0.3653336, 1, 1, 1, 1, 1,
-0.7000167, -0.778577, -0.9673087, 1, 1, 1, 1, 1,
-0.6882985, 0.5980605, 1.147502, 1, 1, 1, 1, 1,
-0.6774365, -1.520617, -2.840159, 1, 1, 1, 1, 1,
-0.672518, 1.281951, -0.3282855, 1, 1, 1, 1, 1,
-0.6718783, -1.064408, -4.122416, 0, 0, 1, 1, 1,
-0.6701741, 1.053498, -0.7399575, 1, 0, 0, 1, 1,
-0.6695307, -1.369225, -3.509585, 1, 0, 0, 1, 1,
-0.6667197, -1.551468, -3.91809, 1, 0, 0, 1, 1,
-0.6622412, 0.359965, -1.916194, 1, 0, 0, 1, 1,
-0.6613947, -0.5632487, -1.674205, 1, 0, 0, 1, 1,
-0.6601553, 0.8470728, -0.2903786, 0, 0, 0, 1, 1,
-0.6489964, -0.5709229, -1.249711, 0, 0, 0, 1, 1,
-0.6447949, 1.070257, -0.4421175, 0, 0, 0, 1, 1,
-0.6378024, 1.5122, -0.1322513, 0, 0, 0, 1, 1,
-0.6335837, 2.18606, -1.381664, 0, 0, 0, 1, 1,
-0.6331737, 0.1256921, -0.9889725, 0, 0, 0, 1, 1,
-0.6319358, -1.03522, -2.661566, 0, 0, 0, 1, 1,
-0.6307222, -0.4664758, -1.51012, 1, 1, 1, 1, 1,
-0.6198872, -0.3707057, -3.265537, 1, 1, 1, 1, 1,
-0.6174117, -0.815523, -2.587592, 1, 1, 1, 1, 1,
-0.6147991, 0.7450541, -1.751921, 1, 1, 1, 1, 1,
-0.6138077, 0.3312059, -2.180482, 1, 1, 1, 1, 1,
-0.6113641, 1.838608, 0.3152217, 1, 1, 1, 1, 1,
-0.6097009, 2.025691, -0.9865528, 1, 1, 1, 1, 1,
-0.6085959, -1.068887, -1.838866, 1, 1, 1, 1, 1,
-0.6069955, 0.6298907, 0.2002546, 1, 1, 1, 1, 1,
-0.6058876, -0.107798, -1.619299, 1, 1, 1, 1, 1,
-0.599489, -0.6957381, -3.581684, 1, 1, 1, 1, 1,
-0.5934061, 1.475351, -2.814837, 1, 1, 1, 1, 1,
-0.5870842, -1.187551, -3.315548, 1, 1, 1, 1, 1,
-0.5863747, -0.5291213, -0.842327, 1, 1, 1, 1, 1,
-0.5853308, 2.883746, -0.1553181, 1, 1, 1, 1, 1,
-0.584132, -1.00296, -3.366436, 0, 0, 1, 1, 1,
-0.5813145, 0.6885594, -1.14794, 1, 0, 0, 1, 1,
-0.5809407, -0.3391565, -3.413697, 1, 0, 0, 1, 1,
-0.5807362, -0.4533047, -1.806198, 1, 0, 0, 1, 1,
-0.577695, -0.1273015, -3.595689, 1, 0, 0, 1, 1,
-0.5770203, -0.5283395, -3.154977, 1, 0, 0, 1, 1,
-0.5756992, 1.4523, -1.791847, 0, 0, 0, 1, 1,
-0.5742927, 0.09995016, -2.573159, 0, 0, 0, 1, 1,
-0.574259, 0.5293345, -0.08460073, 0, 0, 0, 1, 1,
-0.5740875, -0.1114578, -3.049001, 0, 0, 0, 1, 1,
-0.5736715, -1.158724, -2.712711, 0, 0, 0, 1, 1,
-0.5723949, -0.8960492, -1.263675, 0, 0, 0, 1, 1,
-0.5703083, -0.08475247, -2.782395, 0, 0, 0, 1, 1,
-0.5670317, -1.472666, -3.978702, 1, 1, 1, 1, 1,
-0.5609155, 0.9186602, -0.2034609, 1, 1, 1, 1, 1,
-0.5600921, 0.6061311, -1.14657, 1, 1, 1, 1, 1,
-0.5594259, 0.6445861, -1.421223, 1, 1, 1, 1, 1,
-0.5589982, 0.2087049, 0.4055293, 1, 1, 1, 1, 1,
-0.5573448, 0.9275596, 1.283767, 1, 1, 1, 1, 1,
-0.5509069, 0.3520141, 1.108172, 1, 1, 1, 1, 1,
-0.5504722, -0.1227604, -1.234368, 1, 1, 1, 1, 1,
-0.5498268, 0.770819, -0.5234145, 1, 1, 1, 1, 1,
-0.5424853, 0.5254759, -0.3385172, 1, 1, 1, 1, 1,
-0.5423549, 0.2182517, -0.830178, 1, 1, 1, 1, 1,
-0.5403773, 0.4485146, -1.624158, 1, 1, 1, 1, 1,
-0.5334278, -0.6363745, -3.785497, 1, 1, 1, 1, 1,
-0.531984, 1.273492, 0.5183855, 1, 1, 1, 1, 1,
-0.5267536, 0.01373909, 0.06952097, 1, 1, 1, 1, 1,
-0.5263237, 1.178155, 1.08117, 0, 0, 1, 1, 1,
-0.5180603, 2.668205, -0.303761, 1, 0, 0, 1, 1,
-0.5173803, 0.08942007, -1.233564, 1, 0, 0, 1, 1,
-0.5118515, 0.7793876, -1.751941, 1, 0, 0, 1, 1,
-0.5106045, -2.104545, -4.156056, 1, 0, 0, 1, 1,
-0.5074853, 2.600619, 0.6586287, 1, 0, 0, 1, 1,
-0.5061762, 0.07857988, -2.541788, 0, 0, 0, 1, 1,
-0.5056867, 0.7568602, 0.3523169, 0, 0, 0, 1, 1,
-0.505145, -0.09722895, -0.03179006, 0, 0, 0, 1, 1,
-0.4998218, -1.54425, -2.309306, 0, 0, 0, 1, 1,
-0.4947722, 1.591914, -0.0451165, 0, 0, 0, 1, 1,
-0.4883104, 2.065557, -1.460213, 0, 0, 0, 1, 1,
-0.4805205, 1.168477, -0.8273785, 0, 0, 0, 1, 1,
-0.478321, -0.1961094, -2.920812, 1, 1, 1, 1, 1,
-0.4772412, 1.51931, 0.658456, 1, 1, 1, 1, 1,
-0.4763133, 0.04028745, -1.273755, 1, 1, 1, 1, 1,
-0.4757642, 0.2036791, -0.3778647, 1, 1, 1, 1, 1,
-0.4755, -0.1905804, -0.5305558, 1, 1, 1, 1, 1,
-0.4610225, -2.156581, -1.656306, 1, 1, 1, 1, 1,
-0.4583985, -0.1688704, -2.18751, 1, 1, 1, 1, 1,
-0.4565699, 1.092088, -0.286739, 1, 1, 1, 1, 1,
-0.4515857, 1.082425, 0.3358982, 1, 1, 1, 1, 1,
-0.4504203, 1.110501, -2.239019, 1, 1, 1, 1, 1,
-0.4495532, -0.4973575, -2.900227, 1, 1, 1, 1, 1,
-0.4480931, -1.53338, -4.100094, 1, 1, 1, 1, 1,
-0.4446259, -0.8277132, -3.919813, 1, 1, 1, 1, 1,
-0.4388714, -1.469196, -3.305707, 1, 1, 1, 1, 1,
-0.4319984, -0.5475154, -2.581675, 1, 1, 1, 1, 1,
-0.4319833, -0.7144607, -2.233586, 0, 0, 1, 1, 1,
-0.4317653, 1.523584, -0.5985776, 1, 0, 0, 1, 1,
-0.4298159, -0.2098315, -0.4921412, 1, 0, 0, 1, 1,
-0.4266138, 1.248253, -2.009212, 1, 0, 0, 1, 1,
-0.4255693, 2.164084, 0.04586065, 1, 0, 0, 1, 1,
-0.4223742, -0.2429554, -1.040824, 1, 0, 0, 1, 1,
-0.4199701, -0.928428, -1.925842, 0, 0, 0, 1, 1,
-0.4180161, -0.5590947, -2.611583, 0, 0, 0, 1, 1,
-0.4108292, -0.3541694, -2.662735, 0, 0, 0, 1, 1,
-0.4063175, -0.3066887, -4.692116, 0, 0, 0, 1, 1,
-0.4051936, -1.191559, -1.501696, 0, 0, 0, 1, 1,
-0.4030475, -1.416284, -3.166916, 0, 0, 0, 1, 1,
-0.4013914, 0.5540511, 0.01396905, 0, 0, 0, 1, 1,
-0.4012014, -0.8146173, -1.324337, 1, 1, 1, 1, 1,
-0.3978846, -0.7294537, -3.59717, 1, 1, 1, 1, 1,
-0.3948866, -1.020234, -2.581747, 1, 1, 1, 1, 1,
-0.3908896, -1.175403, -3.331726, 1, 1, 1, 1, 1,
-0.3903045, -0.05593381, -1.651751, 1, 1, 1, 1, 1,
-0.3881723, 0.6929059, -0.858036, 1, 1, 1, 1, 1,
-0.3841564, 0.2624922, -1.834346, 1, 1, 1, 1, 1,
-0.3813125, 0.3409529, -0.4412995, 1, 1, 1, 1, 1,
-0.3810411, -1.852885, -2.724032, 1, 1, 1, 1, 1,
-0.379954, 0.8405083, -0.8626446, 1, 1, 1, 1, 1,
-0.3798746, -0.331521, -1.283495, 1, 1, 1, 1, 1,
-0.3777528, 0.1786742, -1.556026, 1, 1, 1, 1, 1,
-0.3733898, -0.1568546, -1.738086, 1, 1, 1, 1, 1,
-0.3720522, 0.7232537, -0.3891343, 1, 1, 1, 1, 1,
-0.3719188, -0.04641176, -2.007715, 1, 1, 1, 1, 1,
-0.3676071, -0.9831398, -2.171961, 0, 0, 1, 1, 1,
-0.3640651, -0.1478817, -0.1322855, 1, 0, 0, 1, 1,
-0.361845, -2.062623, -3.461811, 1, 0, 0, 1, 1,
-0.3540701, -6.320247e-05, 0.2070637, 1, 0, 0, 1, 1,
-0.353399, -1.327183, -3.685378, 1, 0, 0, 1, 1,
-0.3524545, 3.308203, -0.9348027, 1, 0, 0, 1, 1,
-0.3515817, -0.1244842, -3.567305, 0, 0, 0, 1, 1,
-0.3484663, 0.4919524, -0.1431007, 0, 0, 0, 1, 1,
-0.3440121, -1.652087, -3.016671, 0, 0, 0, 1, 1,
-0.3432606, 0.9080555, -0.7789756, 0, 0, 0, 1, 1,
-0.3371101, 2.916645, 1.177378, 0, 0, 0, 1, 1,
-0.3352707, 0.9018952, -0.6123021, 0, 0, 0, 1, 1,
-0.3350707, -0.7782049, -1.739299, 0, 0, 0, 1, 1,
-0.3266278, -2.213591, -3.293931, 1, 1, 1, 1, 1,
-0.3125827, -1.464859, -2.344162, 1, 1, 1, 1, 1,
-0.3118953, -0.01769512, 0.4227254, 1, 1, 1, 1, 1,
-0.3097444, 0.1324374, 0.2651265, 1, 1, 1, 1, 1,
-0.3052606, 1.332777, 1.860332, 1, 1, 1, 1, 1,
-0.3042908, 0.9447911, 0.8729607, 1, 1, 1, 1, 1,
-0.3030044, 0.4430813, -1.498861, 1, 1, 1, 1, 1,
-0.30136, -0.4720936, -4.085907, 1, 1, 1, 1, 1,
-0.2998233, -1.031549, -2.698714, 1, 1, 1, 1, 1,
-0.2979271, -0.3048021, -2.860102, 1, 1, 1, 1, 1,
-0.2953425, 0.5832855, -0.1198877, 1, 1, 1, 1, 1,
-0.2904634, -0.4533592, -3.430087, 1, 1, 1, 1, 1,
-0.2865413, 0.3505683, -0.52409, 1, 1, 1, 1, 1,
-0.2769205, 1.105065, -0.4113991, 1, 1, 1, 1, 1,
-0.2755444, 0.9952446, -0.8561593, 1, 1, 1, 1, 1,
-0.2755305, 1.048746, 1.036903, 0, 0, 1, 1, 1,
-0.2731179, 0.2101676, -0.8447069, 1, 0, 0, 1, 1,
-0.2722908, 0.4558587, -0.05587622, 1, 0, 0, 1, 1,
-0.2597655, -1.499545, -1.855155, 1, 0, 0, 1, 1,
-0.2583209, -0.7405651, -3.904891, 1, 0, 0, 1, 1,
-0.2582, -1.443444, -3.143424, 1, 0, 0, 1, 1,
-0.2548023, 0.4651127, 1.16987, 0, 0, 0, 1, 1,
-0.2488057, 1.152798, -0.6622519, 0, 0, 0, 1, 1,
-0.2443172, 0.7375137, 0.688502, 0, 0, 0, 1, 1,
-0.2422683, 0.545594, 1.649951, 0, 0, 0, 1, 1,
-0.2399235, -0.429588, -2.971475, 0, 0, 0, 1, 1,
-0.2383204, -0.3463646, -3.055272, 0, 0, 0, 1, 1,
-0.2353771, 1.021477, 0.6935518, 0, 0, 0, 1, 1,
-0.2321722, -0.6907589, -2.730895, 1, 1, 1, 1, 1,
-0.2320429, -1.264293, -4.278473, 1, 1, 1, 1, 1,
-0.2319068, -1.906427, -1.852473, 1, 1, 1, 1, 1,
-0.2251148, -0.7403839, -3.516029, 1, 1, 1, 1, 1,
-0.2207843, 0.4199526, 1.681123, 1, 1, 1, 1, 1,
-0.219195, -0.6900106, -3.380929, 1, 1, 1, 1, 1,
-0.2189201, -0.07251723, -0.7698289, 1, 1, 1, 1, 1,
-0.2144805, -0.750583, -2.480608, 1, 1, 1, 1, 1,
-0.2124275, -0.04106014, -2.190485, 1, 1, 1, 1, 1,
-0.2074717, 0.5044069, -0.271549, 1, 1, 1, 1, 1,
-0.2054707, 1.104424, 1.460998, 1, 1, 1, 1, 1,
-0.1994112, 0.2066867, -1.919288, 1, 1, 1, 1, 1,
-0.1882713, -1.9651, -3.477112, 1, 1, 1, 1, 1,
-0.1876733, -1.024021, -1.779493, 1, 1, 1, 1, 1,
-0.1856812, -0.1597603, -3.471275, 1, 1, 1, 1, 1,
-0.1742004, 0.8567565, -0.4337423, 0, 0, 1, 1, 1,
-0.172261, -0.2295148, -0.9072705, 1, 0, 0, 1, 1,
-0.171441, -0.7223518, -3.569051, 1, 0, 0, 1, 1,
-0.1712212, 1.153605, -0.1443883, 1, 0, 0, 1, 1,
-0.1698208, -0.1922281, -1.480187, 1, 0, 0, 1, 1,
-0.1644138, -0.5595753, -1.561506, 1, 0, 0, 1, 1,
-0.1622416, -1.12498, -5.379495, 0, 0, 0, 1, 1,
-0.1613321, -0.7060749, -3.970933, 0, 0, 0, 1, 1,
-0.1529435, -0.6238317, -2.46469, 0, 0, 0, 1, 1,
-0.1489495, -0.7753775, -2.654049, 0, 0, 0, 1, 1,
-0.1487474, 0.3625506, 0.4719587, 0, 0, 0, 1, 1,
-0.1486878, -0.9232741, -2.919388, 0, 0, 0, 1, 1,
-0.1441168, 1.296665, 0.07591379, 0, 0, 0, 1, 1,
-0.1392292, 0.4670176, -1.320387, 1, 1, 1, 1, 1,
-0.1383718, -0.8409838, -2.610268, 1, 1, 1, 1, 1,
-0.1347246, 1.271354, -0.9409273, 1, 1, 1, 1, 1,
-0.1343648, 0.004360029, -2.449381, 1, 1, 1, 1, 1,
-0.1331558, 0.2533089, 0.1046619, 1, 1, 1, 1, 1,
-0.1276767, 0.9137129, 1.780558, 1, 1, 1, 1, 1,
-0.113861, 0.668926, -2.54114, 1, 1, 1, 1, 1,
-0.1125839, -0.5136451, -1.458979, 1, 1, 1, 1, 1,
-0.1101586, -1.269446, -4.89037, 1, 1, 1, 1, 1,
-0.1061202, -1.238099, -3.018707, 1, 1, 1, 1, 1,
-0.1014581, -1.158501, -3.384815, 1, 1, 1, 1, 1,
-0.1007854, -0.1198344, -4.046057, 1, 1, 1, 1, 1,
-0.09830226, 0.6985823, -1.324069, 1, 1, 1, 1, 1,
-0.09692433, 0.257373, -0.2499921, 1, 1, 1, 1, 1,
-0.09472599, -1.822957, -3.179811, 1, 1, 1, 1, 1,
-0.09318179, 1.008437, -0.2294799, 0, 0, 1, 1, 1,
-0.09222838, 1.180368, -1.650536, 1, 0, 0, 1, 1,
-0.09098659, 0.5845689, -0.5596489, 1, 0, 0, 1, 1,
-0.08881563, 0.9554876, -0.00553306, 1, 0, 0, 1, 1,
-0.08867938, 0.246718, 0.0833201, 1, 0, 0, 1, 1,
-0.08795691, -0.8615617, -2.727887, 1, 0, 0, 1, 1,
-0.08400588, 0.3793096, -0.9599987, 0, 0, 0, 1, 1,
-0.0758389, -0.8950989, -5.165852, 0, 0, 0, 1, 1,
-0.07537017, 0.2613135, -0.1775428, 0, 0, 0, 1, 1,
-0.07370082, -0.2204315, -3.607507, 0, 0, 0, 1, 1,
-0.07185401, 0.9038232, 0.5374479, 0, 0, 0, 1, 1,
-0.0689365, -0.2320834, -0.4253438, 0, 0, 0, 1, 1,
-0.06782403, -0.3458943, -2.125863, 0, 0, 0, 1, 1,
-0.06736119, -0.8288276, -3.541976, 1, 1, 1, 1, 1,
-0.06315326, -0.7235656, -3.849082, 1, 1, 1, 1, 1,
-0.06256677, 0.1225498, -0.2090534, 1, 1, 1, 1, 1,
-0.06207421, -0.1449692, -0.6276227, 1, 1, 1, 1, 1,
-0.05811733, 0.4733109, 0.698226, 1, 1, 1, 1, 1,
-0.05766081, 1.650065, 0.5806946, 1, 1, 1, 1, 1,
-0.05267648, -1.424448, -3.75739, 1, 1, 1, 1, 1,
-0.0487451, 0.6110482, -1.339672, 1, 1, 1, 1, 1,
-0.04706877, 1.148359, 1.113444, 1, 1, 1, 1, 1,
-0.04337287, -1.167376, -3.702507, 1, 1, 1, 1, 1,
-0.04194802, -0.4758311, -4.737342, 1, 1, 1, 1, 1,
-0.04073517, 0.2459631, -0.1904719, 1, 1, 1, 1, 1,
-0.03609074, 1.310334, -1.05516, 1, 1, 1, 1, 1,
-0.03303194, 0.8102418, -0.1996116, 1, 1, 1, 1, 1,
-0.03206538, -0.1284532, -3.453725, 1, 1, 1, 1, 1,
-0.02927197, -1.967007, -2.804188, 0, 0, 1, 1, 1,
-0.02693956, 2.230679, -1.025836, 1, 0, 0, 1, 1,
-0.02398675, -0.1856833, -4.187008, 1, 0, 0, 1, 1,
-0.02328337, -0.9819292, -2.471597, 1, 0, 0, 1, 1,
-0.02231815, -0.3559749, -4.167057, 1, 0, 0, 1, 1,
-0.01672938, -1.232894, -4.471341, 1, 0, 0, 1, 1,
-0.01626296, 1.406327, -2.195072, 0, 0, 0, 1, 1,
-0.01562936, 2.846973, -0.4942621, 0, 0, 0, 1, 1,
-0.01481521, 1.016855, -0.0143477, 0, 0, 0, 1, 1,
-0.01420986, -0.8142614, -5.088149, 0, 0, 0, 1, 1,
-0.006102167, -0.6979687, -4.383788, 0, 0, 0, 1, 1,
-0.004880703, 1.760245, 0.7159396, 0, 0, 0, 1, 1,
-0.003602799, 0.6579231, 0.07137633, 0, 0, 0, 1, 1,
-0.00221631, -0.06624759, -4.078551, 1, 1, 1, 1, 1,
0.0001251408, 0.988345, -1.098951, 1, 1, 1, 1, 1,
0.0005876804, -0.1191801, 3.48581, 1, 1, 1, 1, 1,
0.002889125, -0.02021908, 1.83682, 1, 1, 1, 1, 1,
0.005230866, 0.8804602, 0.8988847, 1, 1, 1, 1, 1,
0.006922527, 1.692416, -0.01689143, 1, 1, 1, 1, 1,
0.008770779, 0.04967161, 1.565426, 1, 1, 1, 1, 1,
0.009527258, -2.381979, 2.471484, 1, 1, 1, 1, 1,
0.01315979, -1.050405, 2.2526, 1, 1, 1, 1, 1,
0.01390805, -1.716815, 2.326868, 1, 1, 1, 1, 1,
0.01450819, 1.214996, -1.021324, 1, 1, 1, 1, 1,
0.0146593, -0.5288382, 4.02824, 1, 1, 1, 1, 1,
0.01498629, -0.04343875, 3.023538, 1, 1, 1, 1, 1,
0.01640959, -0.06352161, 4.799912, 1, 1, 1, 1, 1,
0.01651253, -0.5684654, 2.774901, 1, 1, 1, 1, 1,
0.0258539, 0.3494797, 1.598259, 0, 0, 1, 1, 1,
0.02647907, 0.4264855, 1.274049, 1, 0, 0, 1, 1,
0.02850709, 1.174734, 0.3233926, 1, 0, 0, 1, 1,
0.03021167, 0.2369487, 0.8685081, 1, 0, 0, 1, 1,
0.03274972, -1.939834, 4.540421, 1, 0, 0, 1, 1,
0.03327033, -0.5547995, 4.08283, 1, 0, 0, 1, 1,
0.03524205, 0.7397425, -0.5954755, 0, 0, 0, 1, 1,
0.03550398, -1.498081, 3.234123, 0, 0, 0, 1, 1,
0.04058691, 0.1834372, 0.7220691, 0, 0, 0, 1, 1,
0.0420077, -1.03586, 1.387584, 0, 0, 0, 1, 1,
0.04205389, -0.4351521, 3.384127, 0, 0, 0, 1, 1,
0.04385457, -0.194071, 3.979359, 0, 0, 0, 1, 1,
0.04422041, 2.133098, 0.4254565, 0, 0, 0, 1, 1,
0.04430633, 1.137634, -1.576633, 1, 1, 1, 1, 1,
0.04463835, 0.1883448, 0.1436854, 1, 1, 1, 1, 1,
0.04599339, -0.08435287, 3.218543, 1, 1, 1, 1, 1,
0.0491792, 0.4903968, 0.8418928, 1, 1, 1, 1, 1,
0.05097295, -1.402309, 4.008853, 1, 1, 1, 1, 1,
0.05122272, -1.342496, 5.054163, 1, 1, 1, 1, 1,
0.0620206, 0.3141526, -1.123377, 1, 1, 1, 1, 1,
0.06259796, 1.628116, 1.335844, 1, 1, 1, 1, 1,
0.06731785, 0.3232275, 1.013333, 1, 1, 1, 1, 1,
0.06798277, 1.165867, -0.1679779, 1, 1, 1, 1, 1,
0.06984434, -0.1022746, 2.449458, 1, 1, 1, 1, 1,
0.0706662, 1.06794, 1.18042, 1, 1, 1, 1, 1,
0.07128782, -0.7932579, 3.123903, 1, 1, 1, 1, 1,
0.07767847, 1.3322, 0.6579576, 1, 1, 1, 1, 1,
0.08106084, -0.6349967, 4.283154, 1, 1, 1, 1, 1,
0.0860741, 0.5550832, -1.000192, 0, 0, 1, 1, 1,
0.08723246, 1.209276, 0.1669831, 1, 0, 0, 1, 1,
0.08734317, 1.311772, -0.06939755, 1, 0, 0, 1, 1,
0.09026419, -0.894615, 2.617488, 1, 0, 0, 1, 1,
0.09347393, 1.488152, -0.47471, 1, 0, 0, 1, 1,
0.09362388, -0.497336, 3.790717, 1, 0, 0, 1, 1,
0.09482003, 0.32803, 0.1343971, 0, 0, 0, 1, 1,
0.1019752, -0.7267244, 3.014165, 0, 0, 0, 1, 1,
0.1042558, 0.0296099, 1.326298, 0, 0, 0, 1, 1,
0.1056507, 1.831441, -0.7857906, 0, 0, 0, 1, 1,
0.1069696, -0.6356717, 4.218748, 0, 0, 0, 1, 1,
0.1075355, 0.006379822, 1.100662, 0, 0, 0, 1, 1,
0.1080005, 1.380075, 1.115371, 0, 0, 0, 1, 1,
0.1150988, -1.694086, 3.208286, 1, 1, 1, 1, 1,
0.116256, -0.1844066, -0.5218983, 1, 1, 1, 1, 1,
0.1167493, 0.05678757, 1.237279, 1, 1, 1, 1, 1,
0.1182332, -0.40924, 2.306009, 1, 1, 1, 1, 1,
0.1211478, -1.660231, 3.676271, 1, 1, 1, 1, 1,
0.121843, 0.2439661, -1.260027, 1, 1, 1, 1, 1,
0.1255295, -1.125628, 3.975027, 1, 1, 1, 1, 1,
0.1257669, 1.219089, 0.2285161, 1, 1, 1, 1, 1,
0.1268458, 0.1605175, 0.9536255, 1, 1, 1, 1, 1,
0.130362, 0.64298, 0.1095591, 1, 1, 1, 1, 1,
0.1310073, 0.438866, 1.027542, 1, 1, 1, 1, 1,
0.1313167, -0.7043898, 1.037011, 1, 1, 1, 1, 1,
0.1326582, 1.538094, 1.066721, 1, 1, 1, 1, 1,
0.1334625, -0.3984009, 4.862967, 1, 1, 1, 1, 1,
0.1356911, 0.1025833, 1.293761, 1, 1, 1, 1, 1,
0.1470949, -1.557407, 1.951496, 0, 0, 1, 1, 1,
0.1578209, 1.024413, -0.9458464, 1, 0, 0, 1, 1,
0.1644683, -0.3536809, 2.027506, 1, 0, 0, 1, 1,
0.1644802, -0.2702766, 1.961612, 1, 0, 0, 1, 1,
0.1650153, -0.1645681, 2.000886, 1, 0, 0, 1, 1,
0.1689933, 0.3616351, 1.105225, 1, 0, 0, 1, 1,
0.1698709, -0.3335601, 3.815404, 0, 0, 0, 1, 1,
0.1720982, -0.5490189, 2.45997, 0, 0, 0, 1, 1,
0.1740272, -0.5230684, 2.410451, 0, 0, 0, 1, 1,
0.1746285, 1.094642, -1.841418, 0, 0, 0, 1, 1,
0.1760181, -2.105665, 2.208293, 0, 0, 0, 1, 1,
0.1776175, -0.3843972, 3.134751, 0, 0, 0, 1, 1,
0.1783609, -0.4017207, 4.031217, 0, 0, 0, 1, 1,
0.1803355, 0.001093414, 0.09477676, 1, 1, 1, 1, 1,
0.1822232, 0.5946316, -0.9258127, 1, 1, 1, 1, 1,
0.1829885, 0.7540891, -0.1334239, 1, 1, 1, 1, 1,
0.1864245, -1.44285, 3.244358, 1, 1, 1, 1, 1,
0.1909421, 2.201349, 0.2397913, 1, 1, 1, 1, 1,
0.1987713, -0.4430099, 4.28312, 1, 1, 1, 1, 1,
0.200323, -0.2633214, 3.040137, 1, 1, 1, 1, 1,
0.2012752, -0.07012624, 0.8800673, 1, 1, 1, 1, 1,
0.2022431, -0.5565637, 0.7897382, 1, 1, 1, 1, 1,
0.2049142, 0.2274265, 0.700304, 1, 1, 1, 1, 1,
0.2071089, 0.7901363, 0.7478421, 1, 1, 1, 1, 1,
0.2096377, 1.370792, 0.1334095, 1, 1, 1, 1, 1,
0.21, 0.9205009, 0.5227239, 1, 1, 1, 1, 1,
0.2112211, 0.005632117, 1.297086, 1, 1, 1, 1, 1,
0.2135154, -0.2826372, 2.74901, 1, 1, 1, 1, 1,
0.2264765, 0.8640864, 1.017859, 0, 0, 1, 1, 1,
0.227263, -0.6295658, 2.441081, 1, 0, 0, 1, 1,
0.2283891, 2.071322, 0.1475422, 1, 0, 0, 1, 1,
0.2286915, 0.8195959, 0.1600757, 1, 0, 0, 1, 1,
0.2299093, 1.755963, 0.5188411, 1, 0, 0, 1, 1,
0.2308041, 0.5499079, 1.15185, 1, 0, 0, 1, 1,
0.2339914, 0.1696697, -0.6735732, 0, 0, 0, 1, 1,
0.2353735, -0.3750597, 2.385545, 0, 0, 0, 1, 1,
0.2488742, -1.603544, 3.732156, 0, 0, 0, 1, 1,
0.2570056, -1.059029, 3.373783, 0, 0, 0, 1, 1,
0.2593535, -1.556859, 2.170763, 0, 0, 0, 1, 1,
0.2603185, 0.4087138, -0.2213665, 0, 0, 0, 1, 1,
0.2621448, 0.2539535, -0.7814568, 0, 0, 0, 1, 1,
0.2672073, -1.059108, 3.192878, 1, 1, 1, 1, 1,
0.26835, 0.001431216, 2.051977, 1, 1, 1, 1, 1,
0.2715723, 0.2230451, 0.4208559, 1, 1, 1, 1, 1,
0.2737585, -1.405186, 2.75424, 1, 1, 1, 1, 1,
0.2753634, -1.201221, 3.308852, 1, 1, 1, 1, 1,
0.2756386, -0.3135425, 2.427682, 1, 1, 1, 1, 1,
0.276765, -1.869281, 2.611661, 1, 1, 1, 1, 1,
0.2804446, 1.428747, 0.2719032, 1, 1, 1, 1, 1,
0.2829587, 1.211774, -0.5519394, 1, 1, 1, 1, 1,
0.2829984, 1.379836, 1.122118, 1, 1, 1, 1, 1,
0.2836869, -0.573029, 2.703738, 1, 1, 1, 1, 1,
0.2841858, -0.4929457, 2.139651, 1, 1, 1, 1, 1,
0.2841867, 0.8597388, 2.551324, 1, 1, 1, 1, 1,
0.2869872, 0.1633355, -0.2619152, 1, 1, 1, 1, 1,
0.2910499, -0.2166832, 2.09948, 1, 1, 1, 1, 1,
0.2915459, 0.6142752, 0.4679238, 0, 0, 1, 1, 1,
0.2968554, 1.221715, 0.6504113, 1, 0, 0, 1, 1,
0.3003466, 0.006804721, 1.641718, 1, 0, 0, 1, 1,
0.3017537, 0.4575575, -0.5361614, 1, 0, 0, 1, 1,
0.3020851, 0.0005897565, 3.417723, 1, 0, 0, 1, 1,
0.3056566, -0.7531717, 1.524297, 1, 0, 0, 1, 1,
0.311212, -0.2938267, 3.072219, 0, 0, 0, 1, 1,
0.312509, -0.04898638, 2.703806, 0, 0, 0, 1, 1,
0.3129917, 0.5415132, -0.3515837, 0, 0, 0, 1, 1,
0.3137483, 1.471393, 0.8266131, 0, 0, 0, 1, 1,
0.3138015, -0.219336, 0.6837206, 0, 0, 0, 1, 1,
0.316039, 0.6377401, 1.422833, 0, 0, 0, 1, 1,
0.3165738, -0.5973257, 0.791815, 0, 0, 0, 1, 1,
0.3189852, -0.7177036, 2.392696, 1, 1, 1, 1, 1,
0.3201519, 0.7342118, 0.15093, 1, 1, 1, 1, 1,
0.3206728, 0.4124211, 1.3653, 1, 1, 1, 1, 1,
0.3250343, -0.5155134, 1.834791, 1, 1, 1, 1, 1,
0.332368, 0.6018628, 1.315283, 1, 1, 1, 1, 1,
0.3340952, 0.4532871, 0.8516515, 1, 1, 1, 1, 1,
0.336291, -1.141503, 4.324764, 1, 1, 1, 1, 1,
0.3389438, 0.2703557, 0.5770918, 1, 1, 1, 1, 1,
0.3401676, 0.3177941, -1.474414, 1, 1, 1, 1, 1,
0.3404378, 2.006219, -1.245366, 1, 1, 1, 1, 1,
0.3452927, -0.369104, 2.079475, 1, 1, 1, 1, 1,
0.3481217, 0.6789826, -0.3090999, 1, 1, 1, 1, 1,
0.359299, 0.2875493, 0.8701984, 1, 1, 1, 1, 1,
0.3651777, -2.383898, 2.162213, 1, 1, 1, 1, 1,
0.3655093, -0.7556174, 4.151348, 1, 1, 1, 1, 1,
0.3680669, -0.1181437, 1.997426, 0, 0, 1, 1, 1,
0.3685125, -0.681184, 0.7599925, 1, 0, 0, 1, 1,
0.3691502, -2.067899, 3.128204, 1, 0, 0, 1, 1,
0.3693005, -1.140361, 3.03098, 1, 0, 0, 1, 1,
0.380035, -0.0988719, -0.4085409, 1, 0, 0, 1, 1,
0.3824058, -0.4112302, 2.988398, 1, 0, 0, 1, 1,
0.3840753, 1.392374, 0.8105853, 0, 0, 0, 1, 1,
0.3848575, -1.02792, 3.928369, 0, 0, 0, 1, 1,
0.3851969, 0.5952263, 0.4314038, 0, 0, 0, 1, 1,
0.3882557, 0.08092147, 0.9345255, 0, 0, 0, 1, 1,
0.3954962, -0.3052269, 2.98102, 0, 0, 0, 1, 1,
0.3981397, -0.1364686, 2.621595, 0, 0, 0, 1, 1,
0.3988225, 0.1963183, 1.095506, 0, 0, 0, 1, 1,
0.4002411, 0.2140474, 0.1245699, 1, 1, 1, 1, 1,
0.4065872, -1.725393, 1.096688, 1, 1, 1, 1, 1,
0.4116729, -0.1838816, -0.2194863, 1, 1, 1, 1, 1,
0.4133231, -0.511162, 3.655389, 1, 1, 1, 1, 1,
0.4140677, -0.6218785, 1.53654, 1, 1, 1, 1, 1,
0.4170486, 0.8305124, -0.2995688, 1, 1, 1, 1, 1,
0.4214471, -1.043586, 3.667506, 1, 1, 1, 1, 1,
0.4230124, -1.994149, 4.159118, 1, 1, 1, 1, 1,
0.4270972, 0.4007992, 2.060711, 1, 1, 1, 1, 1,
0.4279703, -0.1378302, 1.631388, 1, 1, 1, 1, 1,
0.42822, 0.7781054, 0.1805951, 1, 1, 1, 1, 1,
0.4294564, 1.189791, 0.4136037, 1, 1, 1, 1, 1,
0.4296412, 0.8360383, 1.563218, 1, 1, 1, 1, 1,
0.4331536, 0.9448571, 1.716851, 1, 1, 1, 1, 1,
0.4362247, 0.8401338, -0.3406047, 1, 1, 1, 1, 1,
0.4374917, 0.6381856, -0.3074719, 0, 0, 1, 1, 1,
0.4380046, -0.2761342, 2.588167, 1, 0, 0, 1, 1,
0.4382994, -1.512242, 3.260174, 1, 0, 0, 1, 1,
0.4388546, -0.4210665, 2.042443, 1, 0, 0, 1, 1,
0.4401686, -0.4935674, 1.207487, 1, 0, 0, 1, 1,
0.4484449, -0.5914409, 1.258392, 1, 0, 0, 1, 1,
0.452764, -0.6524231, 3.081336, 0, 0, 0, 1, 1,
0.4569441, -1.306621, 3.778394, 0, 0, 0, 1, 1,
0.4572278, 0.3827358, 2.208325, 0, 0, 0, 1, 1,
0.4580628, -1.096128, 2.75493, 0, 0, 0, 1, 1,
0.4585354, 0.7719628, 0.6282019, 0, 0, 0, 1, 1,
0.4593236, -0.8553571, 5.372424, 0, 0, 0, 1, 1,
0.4593412, -2.821674, 2.199504, 0, 0, 0, 1, 1,
0.4646961, -0.7069863, 2.542311, 1, 1, 1, 1, 1,
0.468597, -0.605924, 1.699525, 1, 1, 1, 1, 1,
0.4687909, -0.5623846, 2.17962, 1, 1, 1, 1, 1,
0.4793681, 0.6486347, 0.1361066, 1, 1, 1, 1, 1,
0.481962, -0.02422545, 2.082698, 1, 1, 1, 1, 1,
0.4831395, 0.245288, 1.120249, 1, 1, 1, 1, 1,
0.4846275, -1.313684, 2.67478, 1, 1, 1, 1, 1,
0.4862571, 0.8280829, 0.4351984, 1, 1, 1, 1, 1,
0.4870428, 1.672393, 0.3106003, 1, 1, 1, 1, 1,
0.4949138, -0.9427439, 3.04059, 1, 1, 1, 1, 1,
0.499375, -0.4184907, 0.8004777, 1, 1, 1, 1, 1,
0.5020257, -0.4326477, 2.338129, 1, 1, 1, 1, 1,
0.5041764, 0.4150794, -0.09399408, 1, 1, 1, 1, 1,
0.5086103, 0.2543795, 2.124755, 1, 1, 1, 1, 1,
0.5117494, -1.312629, 1.056184, 1, 1, 1, 1, 1,
0.515577, -0.2344169, 1.445967, 0, 0, 1, 1, 1,
0.5181133, 0.4446023, 0.2454578, 1, 0, 0, 1, 1,
0.526933, -1.415543, 3.523128, 1, 0, 0, 1, 1,
0.5286708, 1.033302, 0.3346392, 1, 0, 0, 1, 1,
0.5292158, -0.09022371, 1.659058, 1, 0, 0, 1, 1,
0.531212, 1.166047, 0.2054393, 1, 0, 0, 1, 1,
0.5312532, -0.4512603, 2.560405, 0, 0, 0, 1, 1,
0.5326577, -0.3122635, 2.142909, 0, 0, 0, 1, 1,
0.533417, 0.4243617, 1.385945, 0, 0, 0, 1, 1,
0.536964, -2.036808, 1.683708, 0, 0, 0, 1, 1,
0.5385461, 0.583531, -0.2462924, 0, 0, 0, 1, 1,
0.5395228, 1.829518, -1.79341, 0, 0, 0, 1, 1,
0.5411731, -1.735582, 2.135073, 0, 0, 0, 1, 1,
0.5556064, -0.6479735, 3.549152, 1, 1, 1, 1, 1,
0.5559123, -0.5950325, 1.756008, 1, 1, 1, 1, 1,
0.5599643, -0.2912387, 1.57351, 1, 1, 1, 1, 1,
0.5609997, -0.4779037, 3.185516, 1, 1, 1, 1, 1,
0.5617215, -0.1085334, 1.407488, 1, 1, 1, 1, 1,
0.5630399, -0.8967733, 3.296733, 1, 1, 1, 1, 1,
0.5657846, -0.4164838, 1.860948, 1, 1, 1, 1, 1,
0.5803279, -0.595831, 2.123628, 1, 1, 1, 1, 1,
0.5815488, 0.1070914, 0.7448977, 1, 1, 1, 1, 1,
0.5854546, -1.081198, 1.614595, 1, 1, 1, 1, 1,
0.5861591, -0.935587, 1.882973, 1, 1, 1, 1, 1,
0.5942494, -0.6719522, 2.139466, 1, 1, 1, 1, 1,
0.5980192, -0.6240817, 2.567901, 1, 1, 1, 1, 1,
0.6057464, 0.6804095, 1.3664, 1, 1, 1, 1, 1,
0.6095648, 0.8032521, 1.99105, 1, 1, 1, 1, 1,
0.609975, -0.516325, 4.507637, 0, 0, 1, 1, 1,
0.6101841, -0.5212213, 3.368824, 1, 0, 0, 1, 1,
0.6133347, -0.6414933, 2.20104, 1, 0, 0, 1, 1,
0.615328, 0.4846429, 2.631524, 1, 0, 0, 1, 1,
0.6240554, -1.320123, 3.587679, 1, 0, 0, 1, 1,
0.6250173, -1.067735, 1.295174, 1, 0, 0, 1, 1,
0.6281004, 1.353522, 1.43597, 0, 0, 0, 1, 1,
0.6295779, 0.4395164, 0.9809974, 0, 0, 0, 1, 1,
0.6331211, 0.0007797854, 1.975036, 0, 0, 0, 1, 1,
0.6349095, -2.195626, 2.666322, 0, 0, 0, 1, 1,
0.6350257, -0.6494724, 3.270631, 0, 0, 0, 1, 1,
0.6366472, 0.2981656, 1.02633, 0, 0, 0, 1, 1,
0.6399618, -0.3178271, 0.8560994, 0, 0, 0, 1, 1,
0.6405479, 0.05635393, 1.755245, 1, 1, 1, 1, 1,
0.6442493, -0.1820104, 2.129313, 1, 1, 1, 1, 1,
0.6449737, 0.7726325, 0.8364451, 1, 1, 1, 1, 1,
0.6476432, 0.0217267, 1.541771, 1, 1, 1, 1, 1,
0.6497077, -0.03395443, 2.358377, 1, 1, 1, 1, 1,
0.6594776, 1.200662, 0.2039628, 1, 1, 1, 1, 1,
0.6601599, -1.029839, 4.159103, 1, 1, 1, 1, 1,
0.6605667, -1.075645, 3.462784, 1, 1, 1, 1, 1,
0.6690053, -0.6669213, 2.373201, 1, 1, 1, 1, 1,
0.6741995, 0.5409973, 1.593014, 1, 1, 1, 1, 1,
0.674297, 0.6222605, 0.04711034, 1, 1, 1, 1, 1,
0.677963, 0.4206396, 0.7180126, 1, 1, 1, 1, 1,
0.6839231, -0.4803513, 2.710716, 1, 1, 1, 1, 1,
0.6841018, 0.806728, 0.1201591, 1, 1, 1, 1, 1,
0.6853628, 0.8584544, 0.04304493, 1, 1, 1, 1, 1,
0.6905988, 0.2548751, 1.531209, 0, 0, 1, 1, 1,
0.6923441, 0.009829901, 0.3352744, 1, 0, 0, 1, 1,
0.6994131, 0.4946944, 0.9251666, 1, 0, 0, 1, 1,
0.700048, 0.3465635, 2.314306, 1, 0, 0, 1, 1,
0.7049579, 1.044175, 1.46851, 1, 0, 0, 1, 1,
0.7093967, 2.247731, -0.3019099, 1, 0, 0, 1, 1,
0.7123872, -2.616803, 2.274163, 0, 0, 0, 1, 1,
0.7133082, -0.4836869, 3.284784, 0, 0, 0, 1, 1,
0.7144887, -2.221003, 1.430227, 0, 0, 0, 1, 1,
0.714774, 1.090378, -0.9242033, 0, 0, 0, 1, 1,
0.7158226, -0.7799289, 1.880622, 0, 0, 0, 1, 1,
0.7166139, -0.01491893, 3.356821, 0, 0, 0, 1, 1,
0.7177398, -1.389989, 1.113571, 0, 0, 0, 1, 1,
0.7249596, 1.461839, -0.7028112, 1, 1, 1, 1, 1,
0.7260496, -0.01273785, 1.0962, 1, 1, 1, 1, 1,
0.7276454, 1.098946, 0.3500866, 1, 1, 1, 1, 1,
0.7293076, -0.126581, 1.736217, 1, 1, 1, 1, 1,
0.7358459, -1.366182, 3.65408, 1, 1, 1, 1, 1,
0.7379503, -1.460649, 2.026422, 1, 1, 1, 1, 1,
0.7415001, -0.9416323, 2.059772, 1, 1, 1, 1, 1,
0.7429366, -1.216493, 3.37476, 1, 1, 1, 1, 1,
0.7433875, -0.49029, 1.574807, 1, 1, 1, 1, 1,
0.7445254, 0.3748764, -0.2968393, 1, 1, 1, 1, 1,
0.7480993, -1.534556, 4.997748, 1, 1, 1, 1, 1,
0.7510636, -0.6834548, 2.265893, 1, 1, 1, 1, 1,
0.7564765, 1.291499, -0.1238297, 1, 1, 1, 1, 1,
0.7612157, -1.412993, 2.244745, 1, 1, 1, 1, 1,
0.7680272, 0.0348825, 0.4878735, 1, 1, 1, 1, 1,
0.7703026, 0.1266015, 1.739133, 0, 0, 1, 1, 1,
0.7725073, -0.07207597, 1.615302, 1, 0, 0, 1, 1,
0.7751861, 2.19961, 0.8358414, 1, 0, 0, 1, 1,
0.7785574, 0.9882976, 0.1646071, 1, 0, 0, 1, 1,
0.7798909, -0.3522516, 2.066526, 1, 0, 0, 1, 1,
0.7850608, -0.9833307, 2.719205, 1, 0, 0, 1, 1,
0.7861568, 1.040498, 0.4814511, 0, 0, 0, 1, 1,
0.7873049, 1.104937, 1.86568, 0, 0, 0, 1, 1,
0.7972642, 0.4236095, 1.285165, 0, 0, 0, 1, 1,
0.7985103, -0.4424916, 2.801763, 0, 0, 0, 1, 1,
0.7992678, 0.9738963, 0.2128334, 0, 0, 0, 1, 1,
0.8061187, -0.08780123, 4.042892, 0, 0, 0, 1, 1,
0.8083687, 1.530189, -0.3218944, 0, 0, 0, 1, 1,
0.8107052, 0.1661008, 0.1144208, 1, 1, 1, 1, 1,
0.8204121, 0.8763984, -0.1544443, 1, 1, 1, 1, 1,
0.8235646, -0.7837461, 2.329855, 1, 1, 1, 1, 1,
0.8294093, -0.1779657, 2.776098, 1, 1, 1, 1, 1,
0.8297021, -1.892872, 3.732867, 1, 1, 1, 1, 1,
0.8337461, 0.5355054, 1.760319, 1, 1, 1, 1, 1,
0.83622, -0.03911629, 0.7690659, 1, 1, 1, 1, 1,
0.8437903, 0.8277214, 0.5514736, 1, 1, 1, 1, 1,
0.8444868, -1.104214, 3.254606, 1, 1, 1, 1, 1,
0.849297, 0.8536157, 1.289664, 1, 1, 1, 1, 1,
0.8599781, 0.6295914, 1.386136, 1, 1, 1, 1, 1,
0.8680858, 0.1245409, 0.9243512, 1, 1, 1, 1, 1,
0.8697368, 0.8315066, 1.891218, 1, 1, 1, 1, 1,
0.8755891, 0.2026562, -0.117533, 1, 1, 1, 1, 1,
0.8759825, -0.04740958, 0.6917837, 1, 1, 1, 1, 1,
0.8845726, -0.7099829, 3.999731, 0, 0, 1, 1, 1,
0.8905785, -0.4590962, 1.150949, 1, 0, 0, 1, 1,
0.8916552, 0.03579476, 1.129691, 1, 0, 0, 1, 1,
0.8985136, -0.9153454, 3.016571, 1, 0, 0, 1, 1,
0.9040966, 0.8175201, 1.875872, 1, 0, 0, 1, 1,
0.9051038, -1.685506, 2.531369, 1, 0, 0, 1, 1,
0.911487, 0.4885055, 1.485625, 0, 0, 0, 1, 1,
0.9129869, -0.1767579, 1.70506, 0, 0, 0, 1, 1,
0.9138449, -0.7891847, 1.882181, 0, 0, 0, 1, 1,
0.9165705, -0.1517349, 0.6261132, 0, 0, 0, 1, 1,
0.9212807, -0.276768, 1.389252, 0, 0, 0, 1, 1,
0.921809, 0.4854866, 1.454627, 0, 0, 0, 1, 1,
0.9247139, -0.788475, 2.634574, 0, 0, 0, 1, 1,
0.929745, -0.0001160165, 2.324682, 1, 1, 1, 1, 1,
0.9306396, -1.014866, 1.034672, 1, 1, 1, 1, 1,
0.932605, 0.4622242, 0.06624024, 1, 1, 1, 1, 1,
0.9405127, 1.240166, 0.7206621, 1, 1, 1, 1, 1,
0.9480572, -0.4438823, 1.758971, 1, 1, 1, 1, 1,
0.9627609, 0.8444081, -0.6633749, 1, 1, 1, 1, 1,
0.9662442, -1.097082, 1.855419, 1, 1, 1, 1, 1,
0.9791149, -0.5822449, 1.925415, 1, 1, 1, 1, 1,
0.9800773, -0.9840915, 1.810117, 1, 1, 1, 1, 1,
0.9812835, 0.7896519, 1.566997, 1, 1, 1, 1, 1,
0.9864886, -0.5794898, 2.290735, 1, 1, 1, 1, 1,
0.9898592, -1.390526, 2.186581, 1, 1, 1, 1, 1,
0.9902343, -1.07385, 3.330964, 1, 1, 1, 1, 1,
0.9947805, -0.2162685, 0.727906, 1, 1, 1, 1, 1,
0.9965625, 1.05801, 2.059231, 1, 1, 1, 1, 1,
1.003599, -0.5731813, 2.419444, 0, 0, 1, 1, 1,
1.009372, 0.6811867, 0.4948969, 1, 0, 0, 1, 1,
1.009937, -0.2546674, 2.851048, 1, 0, 0, 1, 1,
1.013356, 1.268025, -0.2730005, 1, 0, 0, 1, 1,
1.013822, -0.3996502, 1.980448, 1, 0, 0, 1, 1,
1.01654, 0.06300119, 2.573673, 1, 0, 0, 1, 1,
1.017926, -0.7925243, -0.03180056, 0, 0, 0, 1, 1,
1.020536, -0.9658625, 2.125206, 0, 0, 0, 1, 1,
1.022793, 1.376953, -0.5631372, 0, 0, 0, 1, 1,
1.024565, 1.187919, 0.7742679, 0, 0, 0, 1, 1,
1.027344, 0.4423466, 2.599964, 0, 0, 0, 1, 1,
1.028459, 1.035203, 1.271605, 0, 0, 0, 1, 1,
1.032829, 1.187122, 1.618599, 0, 0, 0, 1, 1,
1.04069, -0.5086085, 1.905681, 1, 1, 1, 1, 1,
1.042183, -2.181578, 3.526433, 1, 1, 1, 1, 1,
1.044245, 0.1098155, 1.278022, 1, 1, 1, 1, 1,
1.044799, -0.2113317, 2.380035, 1, 1, 1, 1, 1,
1.04586, -0.72912, 3.147927, 1, 1, 1, 1, 1,
1.048665, -0.538509, 2.027642, 1, 1, 1, 1, 1,
1.050852, -0.01720299, 2.484275, 1, 1, 1, 1, 1,
1.051826, -0.01357688, 1.399312, 1, 1, 1, 1, 1,
1.05212, -0.5301407, 2.443901, 1, 1, 1, 1, 1,
1.055515, -1.691517, 4.296475, 1, 1, 1, 1, 1,
1.058379, -0.7046478, 1.685364, 1, 1, 1, 1, 1,
1.062169, -0.3803832, 2.045496, 1, 1, 1, 1, 1,
1.065596, -0.5633031, 2.447435, 1, 1, 1, 1, 1,
1.077111, -1.192408, 2.273933, 1, 1, 1, 1, 1,
1.079258, -0.2183887, 1.717118, 1, 1, 1, 1, 1,
1.080007, -1.285145, 2.879822, 0, 0, 1, 1, 1,
1.092016, -0.1519894, 1.811632, 1, 0, 0, 1, 1,
1.09546, -1.6071, 1.276374, 1, 0, 0, 1, 1,
1.097732, -3.210915, 1.509179, 1, 0, 0, 1, 1,
1.101047, -1.80814, 2.31461, 1, 0, 0, 1, 1,
1.105523, -0.9128036, 2.230335, 1, 0, 0, 1, 1,
1.11116, -0.8573008, 2.993642, 0, 0, 0, 1, 1,
1.11511, 0.7820871, 0.7815697, 0, 0, 0, 1, 1,
1.130501, -0.3216262, 0.7784383, 0, 0, 0, 1, 1,
1.136735, 0.8346659, 0.9027942, 0, 0, 0, 1, 1,
1.141825, 0.6127036, 0.0695487, 0, 0, 0, 1, 1,
1.143128, -0.4804644, 2.821719, 0, 0, 0, 1, 1,
1.155465, -1.06245, 3.167295, 0, 0, 0, 1, 1,
1.16016, 0.1371869, 2.660532, 1, 1, 1, 1, 1,
1.161013, 0.215702, 2.390181, 1, 1, 1, 1, 1,
1.161358, 1.483761, 0.2574458, 1, 1, 1, 1, 1,
1.170393, -0.8755196, 1.355036, 1, 1, 1, 1, 1,
1.188668, -0.6635759, 0.948599, 1, 1, 1, 1, 1,
1.189039, 0.3171941, -0.2916732, 1, 1, 1, 1, 1,
1.191221, 1.431637, 0.7198678, 1, 1, 1, 1, 1,
1.193505, -0.8998286, 1.709823, 1, 1, 1, 1, 1,
1.197478, 1.247205, 0.8352934, 1, 1, 1, 1, 1,
1.204755, 0.2596771, 0.01899805, 1, 1, 1, 1, 1,
1.206864, -0.744023, 2.958239, 1, 1, 1, 1, 1,
1.220111, 0.393637, 1.11322, 1, 1, 1, 1, 1,
1.239088, 0.3510622, 0.1875305, 1, 1, 1, 1, 1,
1.243071, 0.8095894, 1.579069, 1, 1, 1, 1, 1,
1.245894, 1.020327, -0.07531978, 1, 1, 1, 1, 1,
1.248765, 0.4356313, 0.1599437, 0, 0, 1, 1, 1,
1.266475, -0.2787451, 2.645629, 1, 0, 0, 1, 1,
1.277633, 0.9372175, -0.7446137, 1, 0, 0, 1, 1,
1.279528, 0.4904887, 2.408196, 1, 0, 0, 1, 1,
1.280054, -1.436506, 3.006512, 1, 0, 0, 1, 1,
1.284965, 1.523066, 1.737565, 1, 0, 0, 1, 1,
1.285924, 0.1371225, 2.197959, 0, 0, 0, 1, 1,
1.294629, -0.08734392, 1.607076, 0, 0, 0, 1, 1,
1.29875, -0.2639341, 1.440342, 0, 0, 0, 1, 1,
1.299909, 0.3772401, 0.8977811, 0, 0, 0, 1, 1,
1.300758, -0.4327826, 1.952025, 0, 0, 0, 1, 1,
1.30561, 0.4590063, 1.794863, 0, 0, 0, 1, 1,
1.32312, -0.6503432, 1.571421, 0, 0, 0, 1, 1,
1.323956, 1.194027, 2.334055, 1, 1, 1, 1, 1,
1.32533, 0.9120948, 2.739574, 1, 1, 1, 1, 1,
1.342114, 1.251367, 0.4637175, 1, 1, 1, 1, 1,
1.343129, -2.655684, 4.819213, 1, 1, 1, 1, 1,
1.34793, 0.9653288, 0.4826896, 1, 1, 1, 1, 1,
1.349801, -0.4899121, 0.1690204, 1, 1, 1, 1, 1,
1.351539, -0.2890188, 1.839663, 1, 1, 1, 1, 1,
1.361791, -0.4545995, 2.223962, 1, 1, 1, 1, 1,
1.381317, 0.1157997, 2.284554, 1, 1, 1, 1, 1,
1.383323, -0.661877, 3.631114, 1, 1, 1, 1, 1,
1.387893, -0.4912129, 1.728207, 1, 1, 1, 1, 1,
1.388131, -1.015401, 1.405093, 1, 1, 1, 1, 1,
1.389985, 0.8020724, 0.7265912, 1, 1, 1, 1, 1,
1.390486, -0.9432815, 2.385436, 1, 1, 1, 1, 1,
1.391171, 0.4925826, 0.5413975, 1, 1, 1, 1, 1,
1.393761, -1.43454, 2.484591, 0, 0, 1, 1, 1,
1.418369, -0.7848177, 1.741377, 1, 0, 0, 1, 1,
1.435811, -0.02121311, 2.987867, 1, 0, 0, 1, 1,
1.438591, -0.4828743, 0.9335601, 1, 0, 0, 1, 1,
1.438625, -2.297421, 1.337433, 1, 0, 0, 1, 1,
1.439653, -1.942279, 2.336451, 1, 0, 0, 1, 1,
1.440444, -0.07221416, 2.643672, 0, 0, 0, 1, 1,
1.44217, -0.02421152, 1.732733, 0, 0, 0, 1, 1,
1.464287, 1.304309, -0.5097703, 0, 0, 0, 1, 1,
1.469658, -1.533054, 3.991406, 0, 0, 0, 1, 1,
1.48355, 1.389094, 2.656171, 0, 0, 0, 1, 1,
1.495269, 1.566743, 0.1479419, 0, 0, 0, 1, 1,
1.499529, -0.552092, 1.714899, 0, 0, 0, 1, 1,
1.507632, -0.1656878, 1.313402, 1, 1, 1, 1, 1,
1.52504, -0.3972311, 2.996213, 1, 1, 1, 1, 1,
1.530478, -0.5414689, 3.277072, 1, 1, 1, 1, 1,
1.534574, 0.2227108, 1.087284, 1, 1, 1, 1, 1,
1.54428, -0.05827811, 1.647277, 1, 1, 1, 1, 1,
1.5485, -1.540685, 3.94047, 1, 1, 1, 1, 1,
1.553507, 1.278617, 1.788136, 1, 1, 1, 1, 1,
1.560852, -0.5697998, 2.449842, 1, 1, 1, 1, 1,
1.563033, -0.09253121, 3.399145, 1, 1, 1, 1, 1,
1.570142, 0.458171, 1.317264, 1, 1, 1, 1, 1,
1.584252, 1.015026, 0.9739476, 1, 1, 1, 1, 1,
1.585, 0.5026824, 2.544557, 1, 1, 1, 1, 1,
1.612881, -0.8971454, 0.1433492, 1, 1, 1, 1, 1,
1.632501, -0.3850321, 0.07930557, 1, 1, 1, 1, 1,
1.634421, 0.589349, 1.156578, 1, 1, 1, 1, 1,
1.641701, -0.8742337, 1.584773, 0, 0, 1, 1, 1,
1.654528, 0.7837472, 1.627458, 1, 0, 0, 1, 1,
1.672376, 0.3022147, 0.8544503, 1, 0, 0, 1, 1,
1.674369, 0.5187382, 1.454039, 1, 0, 0, 1, 1,
1.68082, -0.8135843, 2.354248, 1, 0, 0, 1, 1,
1.693779, -0.5755225, 1.591838, 1, 0, 0, 1, 1,
1.705937, 0.09240874, 2.066092, 0, 0, 0, 1, 1,
1.724945, 0.8819777, 0.7580087, 0, 0, 0, 1, 1,
1.730172, -0.10078, 2.468688, 0, 0, 0, 1, 1,
1.733586, 0.6261707, 0.6907536, 0, 0, 0, 1, 1,
1.740742, -0.1319244, 1.996649, 0, 0, 0, 1, 1,
1.752551, -0.4813658, 1.405413, 0, 0, 0, 1, 1,
1.753021, 0.002930987, 1.073016, 0, 0, 0, 1, 1,
1.753068, 0.7740166, 0.3467166, 1, 1, 1, 1, 1,
1.770511, 1.88603, 1.292558, 1, 1, 1, 1, 1,
1.775649, -1.459767, 1.769015, 1, 1, 1, 1, 1,
1.77819, 0.1616932, 0.4141197, 1, 1, 1, 1, 1,
1.79995, 0.4798119, 0.6363601, 1, 1, 1, 1, 1,
1.800269, 0.02178712, 1.736849, 1, 1, 1, 1, 1,
1.800796, 0.8436769, -0.6542727, 1, 1, 1, 1, 1,
1.805708, 1.61643, 0.5482598, 1, 1, 1, 1, 1,
1.82507, -1.156008, 3.965333, 1, 1, 1, 1, 1,
1.849156, 0.3925905, 1.749246, 1, 1, 1, 1, 1,
1.86466, 0.01183747, 2.736592, 1, 1, 1, 1, 1,
1.910002, -0.003696733, 2.040454, 1, 1, 1, 1, 1,
1.913394, 2.434401, 1.228124, 1, 1, 1, 1, 1,
1.920411, -0.8734717, 2.214832, 1, 1, 1, 1, 1,
1.926622, 0.9010699, -0.5417566, 1, 1, 1, 1, 1,
1.965732, -0.1985423, 2.113007, 0, 0, 1, 1, 1,
2.012805, 0.9750432, -0.2936168, 1, 0, 0, 1, 1,
2.031405, 1.836831, 0.8525386, 1, 0, 0, 1, 1,
2.118932, 1.435889, 1.056495, 1, 0, 0, 1, 1,
2.133415, 2.600359, 2.482628, 1, 0, 0, 1, 1,
2.135635, -1.329461, 1.354988, 1, 0, 0, 1, 1,
2.166549, -1.214759, 2.143435, 0, 0, 0, 1, 1,
2.205195, 0.00633755, 0.9512048, 0, 0, 0, 1, 1,
2.301766, 1.020494, 2.653275, 0, 0, 0, 1, 1,
2.303847, 0.1444508, 1.164089, 0, 0, 0, 1, 1,
2.305093, 0.3343451, 1.941942, 0, 0, 0, 1, 1,
2.338673, -0.4832728, 0.8223345, 0, 0, 0, 1, 1,
2.340601, -1.318233, 1.439957, 0, 0, 0, 1, 1,
2.386271, 0.02120187, 1.991821, 1, 1, 1, 1, 1,
2.595255, -0.3582196, 1.583222, 1, 1, 1, 1, 1,
2.603841, -0.1238428, 0.5019188, 1, 1, 1, 1, 1,
2.632097, -0.07031557, 1.432366, 1, 1, 1, 1, 1,
2.657262, -0.8073786, 2.080121, 1, 1, 1, 1, 1,
2.997253, 0.05811885, 2.705574, 1, 1, 1, 1, 1,
3.388872, 1.895099, -0.9716994, 1, 1, 1, 1, 1
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
var radius = 9.638868;
var distance = 33.85612;
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
mvMatrix.translate( -0.2277464, 0.01451039, 0.01369238 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.85612);
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