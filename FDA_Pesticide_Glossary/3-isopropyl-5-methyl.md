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
-3.492028, 1.560442, -2.226038, 1, 0, 0, 1,
-2.870621, -0.1821091, -2.084313, 1, 0.007843138, 0, 1,
-2.804969, -1.047996, -0.6735241, 1, 0.01176471, 0, 1,
-2.786102, 0.8815216, 0.245596, 1, 0.01960784, 0, 1,
-2.709755, -0.3863691, -1.820762, 1, 0.02352941, 0, 1,
-2.639226, 0.9857702, -1.157054, 1, 0.03137255, 0, 1,
-2.606714, -0.2280217, -0.7422408, 1, 0.03529412, 0, 1,
-2.542415, 1.020679, -1.259246, 1, 0.04313726, 0, 1,
-2.469902, -2.033599, -0.5054303, 1, 0.04705882, 0, 1,
-2.355083, 1.30113, -0.8073665, 1, 0.05490196, 0, 1,
-2.313403, -0.936245, -1.7358, 1, 0.05882353, 0, 1,
-2.306762, -2.262372, -3.287188, 1, 0.06666667, 0, 1,
-2.289893, 0.1649069, -2.753058, 1, 0.07058824, 0, 1,
-2.252064, -0.1830594, -0.5977826, 1, 0.07843138, 0, 1,
-2.241761, 1.548365, -1.498147, 1, 0.08235294, 0, 1,
-2.192377, 0.5697399, -0.5336874, 1, 0.09019608, 0, 1,
-2.183576, -0.2761137, -2.985828, 1, 0.09411765, 0, 1,
-2.179372, -0.4872514, -1.597332, 1, 0.1019608, 0, 1,
-2.125867, 0.7437149, -1.798646, 1, 0.1098039, 0, 1,
-2.105395, 0.816512, -0.6897785, 1, 0.1137255, 0, 1,
-2.095001, -1.460085, -2.960524, 1, 0.1215686, 0, 1,
-2.081636, 0.9790022, -0.5519411, 1, 0.1254902, 0, 1,
-2.076867, 2.709133, -0.8099439, 1, 0.1333333, 0, 1,
-2.068452, 0.189244, -1.047332, 1, 0.1372549, 0, 1,
-2.033107, -0.4882328, -1.298839, 1, 0.145098, 0, 1,
-2.030246, 1.451687, -1.526239, 1, 0.1490196, 0, 1,
-2.00799, -0.8187351, -1.96551, 1, 0.1568628, 0, 1,
-2.0058, -0.2134245, -2.978979, 1, 0.1607843, 0, 1,
-1.989555, 1.02374, -2.064504, 1, 0.1686275, 0, 1,
-1.961284, -2.171791, -2.385529, 1, 0.172549, 0, 1,
-1.937322, -0.1845925, -1.043639, 1, 0.1803922, 0, 1,
-1.930775, 0.1908201, -0.7806917, 1, 0.1843137, 0, 1,
-1.924987, -0.0316184, -1.029499, 1, 0.1921569, 0, 1,
-1.886772, 0.2944486, 0.4123402, 1, 0.1960784, 0, 1,
-1.884026, 1.177065, -1.10259, 1, 0.2039216, 0, 1,
-1.878049, 0.4389634, -2.112892, 1, 0.2117647, 0, 1,
-1.867802, 0.7826657, -1.805888, 1, 0.2156863, 0, 1,
-1.859855, -0.4579138, -3.290905, 1, 0.2235294, 0, 1,
-1.857934, -1.218193, -1.359352, 1, 0.227451, 0, 1,
-1.850214, 0.2457087, 0.2338836, 1, 0.2352941, 0, 1,
-1.849966, -0.3622473, -0.8270358, 1, 0.2392157, 0, 1,
-1.82212, 0.6250572, -1.162047, 1, 0.2470588, 0, 1,
-1.814982, -0.7635215, -1.233141, 1, 0.2509804, 0, 1,
-1.765453, 1.746523, -1.717552, 1, 0.2588235, 0, 1,
-1.745223, -0.9970529, -1.466079, 1, 0.2627451, 0, 1,
-1.743605, 0.7628596, -1.296726, 1, 0.2705882, 0, 1,
-1.731744, 0.193034, -1.38474, 1, 0.2745098, 0, 1,
-1.707609, 1.357295, -0.142863, 1, 0.282353, 0, 1,
-1.679379, 0.6080005, 0.8406648, 1, 0.2862745, 0, 1,
-1.67137, 1.661862, 0.315686, 1, 0.2941177, 0, 1,
-1.653044, 0.7554204, -1.172638, 1, 0.3019608, 0, 1,
-1.644131, -0.08896162, -1.906452, 1, 0.3058824, 0, 1,
-1.603207, -0.649691, -2.003517, 1, 0.3137255, 0, 1,
-1.598562, -0.4045972, -0.5708188, 1, 0.3176471, 0, 1,
-1.587317, 0.2500548, -1.781167, 1, 0.3254902, 0, 1,
-1.574777, -0.7932175, -1.511361, 1, 0.3294118, 0, 1,
-1.57058, -0.9337121, -1.871395, 1, 0.3372549, 0, 1,
-1.560836, 0.9954875, -0.3342681, 1, 0.3411765, 0, 1,
-1.560624, -0.4716379, -2.356931, 1, 0.3490196, 0, 1,
-1.558306, -0.07974399, -1.271935, 1, 0.3529412, 0, 1,
-1.555561, 0.5245309, -0.8807826, 1, 0.3607843, 0, 1,
-1.552091, 0.348883, -1.720214, 1, 0.3647059, 0, 1,
-1.539195, -1.351192, -1.768485, 1, 0.372549, 0, 1,
-1.531633, -1.223679, -2.375832, 1, 0.3764706, 0, 1,
-1.527516, 1.810673, 0.1573043, 1, 0.3843137, 0, 1,
-1.522555, -2.161612, -2.369218, 1, 0.3882353, 0, 1,
-1.521844, -1.172484, -0.9245738, 1, 0.3960784, 0, 1,
-1.520073, -0.6881071, -3.631144, 1, 0.4039216, 0, 1,
-1.517752, 1.171555, -0.7659271, 1, 0.4078431, 0, 1,
-1.515223, -1.606248, -1.029222, 1, 0.4156863, 0, 1,
-1.50875, -1.434215, -3.936966, 1, 0.4196078, 0, 1,
-1.504906, 0.6357909, -0.8247478, 1, 0.427451, 0, 1,
-1.498626, -0.4664262, -0.03488487, 1, 0.4313726, 0, 1,
-1.496397, 1.582832, -2.070948, 1, 0.4392157, 0, 1,
-1.484203, -1.511731, -3.411751, 1, 0.4431373, 0, 1,
-1.469939, 0.6919327, -0.1204673, 1, 0.4509804, 0, 1,
-1.456174, -1.155535, -1.117532, 1, 0.454902, 0, 1,
-1.455059, -1.441518, -2.573029, 1, 0.4627451, 0, 1,
-1.451527, -0.5925793, -2.340589, 1, 0.4666667, 0, 1,
-1.451495, -0.3490133, -2.687726, 1, 0.4745098, 0, 1,
-1.424107, -0.6409563, -2.383427, 1, 0.4784314, 0, 1,
-1.422132, -0.765766, -4.150206, 1, 0.4862745, 0, 1,
-1.413547, -0.2968143, -0.5985591, 1, 0.4901961, 0, 1,
-1.407484, 1.65571, -0.5409665, 1, 0.4980392, 0, 1,
-1.406136, -0.264593, -1.105778, 1, 0.5058824, 0, 1,
-1.398176, -0.7123124, -3.624205, 1, 0.509804, 0, 1,
-1.394338, -0.7506406, -1.189168, 1, 0.5176471, 0, 1,
-1.388687, 0.9043256, -0.2702156, 1, 0.5215687, 0, 1,
-1.383126, -0.1300148, -1.647362, 1, 0.5294118, 0, 1,
-1.379036, -0.6250329, -2.871315, 1, 0.5333334, 0, 1,
-1.367635, 0.146354, -1.731991, 1, 0.5411765, 0, 1,
-1.367503, 2.145343, -1.028284, 1, 0.5450981, 0, 1,
-1.362581, -1.027098, -2.795229, 1, 0.5529412, 0, 1,
-1.344843, 0.4244893, -1.99772, 1, 0.5568628, 0, 1,
-1.334287, -0.8734109, -3.835313, 1, 0.5647059, 0, 1,
-1.327682, -0.7683463, -2.917655, 1, 0.5686275, 0, 1,
-1.326784, -1.69452, -3.134597, 1, 0.5764706, 0, 1,
-1.323905, 0.06090275, -0.1976785, 1, 0.5803922, 0, 1,
-1.322239, -0.502206, -2.253219, 1, 0.5882353, 0, 1,
-1.318542, -0.3182395, -3.500872, 1, 0.5921569, 0, 1,
-1.317803, -0.6419058, -2.389752, 1, 0.6, 0, 1,
-1.308065, 0.3889525, -1.154302, 1, 0.6078432, 0, 1,
-1.307083, 0.08914159, -1.769811, 1, 0.6117647, 0, 1,
-1.281878, 0.02218553, -0.8544441, 1, 0.6196079, 0, 1,
-1.277203, -0.8659777, -0.5448224, 1, 0.6235294, 0, 1,
-1.274352, 0.2747489, -2.117504, 1, 0.6313726, 0, 1,
-1.273357, 0.8859503, -0.5617284, 1, 0.6352941, 0, 1,
-1.263991, -0.6811703, -1.883999, 1, 0.6431373, 0, 1,
-1.26193, 0.8273458, 1.834167, 1, 0.6470588, 0, 1,
-1.252451, 1.401692, -3.373439, 1, 0.654902, 0, 1,
-1.238042, -0.5081162, -2.417479, 1, 0.6588235, 0, 1,
-1.231721, -1.019599, -2.520304, 1, 0.6666667, 0, 1,
-1.230014, 0.6354454, -1.970489, 1, 0.6705883, 0, 1,
-1.22434, -1.124269, -3.473381, 1, 0.6784314, 0, 1,
-1.220625, -0.2612159, -1.084312, 1, 0.682353, 0, 1,
-1.208646, 0.4930609, -1.572145, 1, 0.6901961, 0, 1,
-1.208093, -1.244358, -1.419184, 1, 0.6941177, 0, 1,
-1.204138, 0.2565992, -1.026944, 1, 0.7019608, 0, 1,
-1.202023, 2.942734, -1.598033, 1, 0.7098039, 0, 1,
-1.188002, 0.3374481, -0.8997768, 1, 0.7137255, 0, 1,
-1.179765, 1.387844, -0.2351845, 1, 0.7215686, 0, 1,
-1.176352, 1.821058, -0.3644578, 1, 0.7254902, 0, 1,
-1.170358, 0.597012, -1.042379, 1, 0.7333333, 0, 1,
-1.15388, -0.2337001, -1.597768, 1, 0.7372549, 0, 1,
-1.150872, -0.6459354, -2.151871, 1, 0.7450981, 0, 1,
-1.142491, -0.67217, -1.894117, 1, 0.7490196, 0, 1,
-1.138686, 0.9576558, -2.218542, 1, 0.7568628, 0, 1,
-1.134601, -0.3356381, -0.5264592, 1, 0.7607843, 0, 1,
-1.131285, -0.6540045, -2.08672, 1, 0.7686275, 0, 1,
-1.131127, -0.7771068, -1.690369, 1, 0.772549, 0, 1,
-1.126352, -0.2664909, -3.8042, 1, 0.7803922, 0, 1,
-1.108307, -0.3691233, 0.1761314, 1, 0.7843137, 0, 1,
-1.107365, 0.3491611, -0.2742563, 1, 0.7921569, 0, 1,
-1.099859, -0.4531324, -3.228301, 1, 0.7960784, 0, 1,
-1.099436, -1.623953, -2.588515, 1, 0.8039216, 0, 1,
-1.09802, -0.6121892, -2.985857, 1, 0.8117647, 0, 1,
-1.09391, -0.5227363, -2.981061, 1, 0.8156863, 0, 1,
-1.087538, -2.006636, -2.977935, 1, 0.8235294, 0, 1,
-1.079988, -1.275145, -2.359174, 1, 0.827451, 0, 1,
-1.078015, 0.4759712, -0.979578, 1, 0.8352941, 0, 1,
-1.074289, -0.9661117, -2.29863, 1, 0.8392157, 0, 1,
-1.06472, -1.867042, -2.370225, 1, 0.8470588, 0, 1,
-1.063696, -0.4901259, -1.602575, 1, 0.8509804, 0, 1,
-1.062299, -1.059984, -1.193831, 1, 0.8588235, 0, 1,
-1.060093, 1.421079, -0.1353807, 1, 0.8627451, 0, 1,
-1.051121, 0.6790332, 0.1034297, 1, 0.8705882, 0, 1,
-1.048641, 0.8296052, -1.767318, 1, 0.8745098, 0, 1,
-1.046158, 1.312519, -0.8477854, 1, 0.8823529, 0, 1,
-1.04607, 0.499209, -0.1978069, 1, 0.8862745, 0, 1,
-1.045475, -0.1342904, -1.054793, 1, 0.8941177, 0, 1,
-1.036359, 0.0920967, -1.998743, 1, 0.8980392, 0, 1,
-1.035846, -0.3534665, -3.585539, 1, 0.9058824, 0, 1,
-1.035182, 0.3699013, -1.955296, 1, 0.9137255, 0, 1,
-1.023513, -0.2942762, -1.252568, 1, 0.9176471, 0, 1,
-1.023464, -0.511825, -0.6415126, 1, 0.9254902, 0, 1,
-1.022798, 0.2164802, -3.373076, 1, 0.9294118, 0, 1,
-1.022542, -0.3259513, -1.511867, 1, 0.9372549, 0, 1,
-1.019717, 0.0265405, -1.82852, 1, 0.9411765, 0, 1,
-1.009357, 0.5058882, -2.042307, 1, 0.9490196, 0, 1,
-1.00773, -1.423844, -0.2348768, 1, 0.9529412, 0, 1,
-1.005229, -0.7591965, -1.627898, 1, 0.9607843, 0, 1,
-1.004545, 0.5186002, 0.7252516, 1, 0.9647059, 0, 1,
-1.000575, -0.6963485, -0.9857205, 1, 0.972549, 0, 1,
-0.9961583, -0.4468841, -5.013884, 1, 0.9764706, 0, 1,
-0.9958234, -0.3099668, -2.796815, 1, 0.9843137, 0, 1,
-0.9934148, -1.117994, -2.167525, 1, 0.9882353, 0, 1,
-0.9745219, -2.514672, -2.781083, 1, 0.9960784, 0, 1,
-0.9692187, -0.8013681, -0.08451574, 0.9960784, 1, 0, 1,
-0.963348, -0.6019267, -3.589342, 0.9921569, 1, 0, 1,
-0.955637, -0.4899009, -4.055563, 0.9843137, 1, 0, 1,
-0.9497684, -0.4518431, -1.929872, 0.9803922, 1, 0, 1,
-0.9437122, -1.712865, -2.712873, 0.972549, 1, 0, 1,
-0.9403337, 1.760669, -0.3017896, 0.9686275, 1, 0, 1,
-0.937664, -0.04845669, -1.774689, 0.9607843, 1, 0, 1,
-0.9349817, -2.061922, -1.96911, 0.9568627, 1, 0, 1,
-0.933507, 0.1253543, 0.2257842, 0.9490196, 1, 0, 1,
-0.9321917, -0.3966722, -0.79997, 0.945098, 1, 0, 1,
-0.9169176, -0.6225805, -1.151493, 0.9372549, 1, 0, 1,
-0.9160746, -0.4630539, -1.632603, 0.9333333, 1, 0, 1,
-0.9152693, -1.322473, -3.004991, 0.9254902, 1, 0, 1,
-0.9143515, 0.8450071, -1.393813, 0.9215686, 1, 0, 1,
-0.9131667, -1.78963, -3.811063, 0.9137255, 1, 0, 1,
-0.9098305, -0.6311824, -2.595713, 0.9098039, 1, 0, 1,
-0.9085485, -1.854388, -2.744903, 0.9019608, 1, 0, 1,
-0.9081329, -0.5630754, -3.11644, 0.8941177, 1, 0, 1,
-0.9061917, -0.3012311, -0.7872487, 0.8901961, 1, 0, 1,
-0.9049492, 1.054328, -2.380004, 0.8823529, 1, 0, 1,
-0.9008924, -1.187979, -1.627901, 0.8784314, 1, 0, 1,
-0.8992341, 0.8068556, -1.645927, 0.8705882, 1, 0, 1,
-0.8989192, 2.468733, -0.5448803, 0.8666667, 1, 0, 1,
-0.8936172, 0.2322344, -1.309979, 0.8588235, 1, 0, 1,
-0.8875355, 0.3586415, -0.6364526, 0.854902, 1, 0, 1,
-0.8753469, 0.9158358, -0.1175879, 0.8470588, 1, 0, 1,
-0.8739765, 0.03782622, -3.823405, 0.8431373, 1, 0, 1,
-0.8731431, -1.056992, -2.19783, 0.8352941, 1, 0, 1,
-0.8729665, 2.66481, 0.5621752, 0.8313726, 1, 0, 1,
-0.8667063, 0.9539053, -3.800844, 0.8235294, 1, 0, 1,
-0.8617355, -1.707741, -2.433851, 0.8196079, 1, 0, 1,
-0.8576962, 0.375407, -1.585465, 0.8117647, 1, 0, 1,
-0.8559625, 0.005295836, -0.360446, 0.8078431, 1, 0, 1,
-0.852208, 0.4712821, -0.3207511, 0.8, 1, 0, 1,
-0.8475794, 1.761085, -0.3068044, 0.7921569, 1, 0, 1,
-0.8470916, 0.7952566, -0.9990636, 0.7882353, 1, 0, 1,
-0.843508, -0.7188148, -1.99952, 0.7803922, 1, 0, 1,
-0.8410026, 0.368948, -1.125728, 0.7764706, 1, 0, 1,
-0.8381101, -0.1554064, -1.99946, 0.7686275, 1, 0, 1,
-0.8279678, -1.345421, -3.409403, 0.7647059, 1, 0, 1,
-0.8276548, 2.941033, -1.033423, 0.7568628, 1, 0, 1,
-0.8217233, -0.3831055, -0.9165483, 0.7529412, 1, 0, 1,
-0.8179428, -1.596728, -2.944187, 0.7450981, 1, 0, 1,
-0.8100117, -1.420744, -1.00745, 0.7411765, 1, 0, 1,
-0.8080194, -0.3638761, -2.708255, 0.7333333, 1, 0, 1,
-0.8064071, -0.3015952, -1.598124, 0.7294118, 1, 0, 1,
-0.8048469, -0.8305991, -2.260795, 0.7215686, 1, 0, 1,
-0.8040435, 0.6693162, -1.530694, 0.7176471, 1, 0, 1,
-0.8009625, 1.273575, 0.0990841, 0.7098039, 1, 0, 1,
-0.7998261, -0.8608855, -2.114286, 0.7058824, 1, 0, 1,
-0.7992073, -0.5849102, -3.742063, 0.6980392, 1, 0, 1,
-0.7871639, 0.8266457, -1.835604, 0.6901961, 1, 0, 1,
-0.7847966, -0.5299413, -1.408241, 0.6862745, 1, 0, 1,
-0.7826269, -0.08327159, -1.770665, 0.6784314, 1, 0, 1,
-0.782043, -0.2813714, -1.106161, 0.6745098, 1, 0, 1,
-0.7809066, 0.7582508, -0.5154844, 0.6666667, 1, 0, 1,
-0.7786196, -2.637422, -3.04672, 0.6627451, 1, 0, 1,
-0.7633274, -0.5779845, -1.938899, 0.654902, 1, 0, 1,
-0.7613167, -0.3138037, -3.220588, 0.6509804, 1, 0, 1,
-0.7603659, -1.723814, -2.731871, 0.6431373, 1, 0, 1,
-0.7601303, -0.571812, -1.41167, 0.6392157, 1, 0, 1,
-0.7560772, 0.09178389, -1.560046, 0.6313726, 1, 0, 1,
-0.7531142, 0.6648864, -2.342062, 0.627451, 1, 0, 1,
-0.750093, -1.18214, -2.141916, 0.6196079, 1, 0, 1,
-0.7473761, -0.6833864, -2.787614, 0.6156863, 1, 0, 1,
-0.7434739, 0.8319305, -0.6761994, 0.6078432, 1, 0, 1,
-0.7420778, -2.123682, -3.76987, 0.6039216, 1, 0, 1,
-0.7416126, -0.478692, -1.155388, 0.5960785, 1, 0, 1,
-0.7409931, -0.8504437, -2.932199, 0.5882353, 1, 0, 1,
-0.7392375, 0.3525057, -1.53473, 0.5843138, 1, 0, 1,
-0.7352498, -0.6014454, -1.307777, 0.5764706, 1, 0, 1,
-0.7276484, 0.7909627, -0.8161384, 0.572549, 1, 0, 1,
-0.726997, 0.0155562, -1.113354, 0.5647059, 1, 0, 1,
-0.7268093, 0.9291162, 0.0957551, 0.5607843, 1, 0, 1,
-0.725585, 0.5328961, -0.6444951, 0.5529412, 1, 0, 1,
-0.7250134, -0.8930297, -0.6842502, 0.5490196, 1, 0, 1,
-0.717826, 0.5370967, -0.081731, 0.5411765, 1, 0, 1,
-0.7150219, -2.525052, -2.341963, 0.5372549, 1, 0, 1,
-0.7148641, -1.463704, -3.85284, 0.5294118, 1, 0, 1,
-0.713275, -1.970771, -2.507668, 0.5254902, 1, 0, 1,
-0.7131424, 0.3962608, -2.228987, 0.5176471, 1, 0, 1,
-0.7090704, 0.9515383, -0.6092048, 0.5137255, 1, 0, 1,
-0.709052, 1.452876, -0.3013693, 0.5058824, 1, 0, 1,
-0.7089923, 0.1135151, -0.4563819, 0.5019608, 1, 0, 1,
-0.7087371, -1.952745, -2.464825, 0.4941176, 1, 0, 1,
-0.7083491, 0.02471628, -1.301095, 0.4862745, 1, 0, 1,
-0.7068439, -0.7762729, -4.093482, 0.4823529, 1, 0, 1,
-0.703948, 0.435582, -1.023203, 0.4745098, 1, 0, 1,
-0.7002682, -0.6106964, -1.710304, 0.4705882, 1, 0, 1,
-0.6981403, -0.3304076, -2.473684, 0.4627451, 1, 0, 1,
-0.6924619, -0.6918398, -2.547545, 0.4588235, 1, 0, 1,
-0.6854158, -0.9235136, -3.656332, 0.4509804, 1, 0, 1,
-0.6778222, -0.5122353, -3.21244, 0.4470588, 1, 0, 1,
-0.6758356, 1.535117, -0.8179761, 0.4392157, 1, 0, 1,
-0.6725532, -0.0691537, -2.880231, 0.4352941, 1, 0, 1,
-0.6720617, 0.7630903, -0.02138835, 0.427451, 1, 0, 1,
-0.6719664, -0.2757233, -1.781497, 0.4235294, 1, 0, 1,
-0.6697869, 0.2682429, -0.5401261, 0.4156863, 1, 0, 1,
-0.6691871, 0.6687033, -0.300144, 0.4117647, 1, 0, 1,
-0.6649026, 0.3331459, -3.173827, 0.4039216, 1, 0, 1,
-0.6648223, 0.5182143, -0.2564742, 0.3960784, 1, 0, 1,
-0.6643621, -0.1533672, -2.449563, 0.3921569, 1, 0, 1,
-0.6640521, 0.4593813, -1.545354, 0.3843137, 1, 0, 1,
-0.6629801, 0.8053808, 0.5257961, 0.3803922, 1, 0, 1,
-0.6610239, 0.5252294, -0.1238042, 0.372549, 1, 0, 1,
-0.6543972, 1.471956, -0.1145151, 0.3686275, 1, 0, 1,
-0.6522243, 0.2444002, 0.602504, 0.3607843, 1, 0, 1,
-0.652214, -0.4749103, -1.53621, 0.3568628, 1, 0, 1,
-0.6453516, 1.601914, 1.33413, 0.3490196, 1, 0, 1,
-0.6408022, -0.805721, -2.886802, 0.345098, 1, 0, 1,
-0.640058, -0.07864247, -2.525025, 0.3372549, 1, 0, 1,
-0.635588, -0.692987, -3.289858, 0.3333333, 1, 0, 1,
-0.6346297, 0.2832946, -1.337571, 0.3254902, 1, 0, 1,
-0.6306247, 2.180404, -1.233639, 0.3215686, 1, 0, 1,
-0.628858, 1.165049, 0.2750103, 0.3137255, 1, 0, 1,
-0.6283307, -0.7121071, -2.026358, 0.3098039, 1, 0, 1,
-0.6276036, -0.6066675, -0.956156, 0.3019608, 1, 0, 1,
-0.6257572, -1.041634, -3.232973, 0.2941177, 1, 0, 1,
-0.6181373, 0.7258224, -0.4749683, 0.2901961, 1, 0, 1,
-0.6128025, 2.141485, -0.8932354, 0.282353, 1, 0, 1,
-0.6089189, -0.539571, -3.868012, 0.2784314, 1, 0, 1,
-0.6086078, 0.1295485, -1.878942, 0.2705882, 1, 0, 1,
-0.6074045, -0.7825357, -1.227854, 0.2666667, 1, 0, 1,
-0.6062933, -0.4606676, -1.865161, 0.2588235, 1, 0, 1,
-0.6020193, -1.063173, -2.881434, 0.254902, 1, 0, 1,
-0.5967075, 0.8481752, -0.08391959, 0.2470588, 1, 0, 1,
-0.5956684, -0.006426517, -1.833353, 0.2431373, 1, 0, 1,
-0.5898258, -0.4629257, -3.546735, 0.2352941, 1, 0, 1,
-0.5825715, -0.920415, -1.760712, 0.2313726, 1, 0, 1,
-0.5802015, 1.156888, 0.997438, 0.2235294, 1, 0, 1,
-0.5756377, 0.6332155, -0.921857, 0.2196078, 1, 0, 1,
-0.5743935, -1.222504, -2.87664, 0.2117647, 1, 0, 1,
-0.5713257, -0.06407879, -3.274857, 0.2078431, 1, 0, 1,
-0.5675857, -0.3048198, 1.38694, 0.2, 1, 0, 1,
-0.5653948, -0.3952627, -3.228855, 0.1921569, 1, 0, 1,
-0.562863, -0.8571454, -2.910449, 0.1882353, 1, 0, 1,
-0.5610084, -0.4288753, -2.702608, 0.1803922, 1, 0, 1,
-0.5574529, 0.4642847, -0.9485083, 0.1764706, 1, 0, 1,
-0.5556532, -0.6576959, -3.273674, 0.1686275, 1, 0, 1,
-0.5531088, 0.1273813, -2.627612, 0.1647059, 1, 0, 1,
-0.5495718, 1.11138, -0.4937542, 0.1568628, 1, 0, 1,
-0.5458655, -1.859842, -1.559036, 0.1529412, 1, 0, 1,
-0.545827, -0.3266692, -3.236327, 0.145098, 1, 0, 1,
-0.5421023, -1.471292, -2.784105, 0.1411765, 1, 0, 1,
-0.5394712, 1.128633, -0.09631316, 0.1333333, 1, 0, 1,
-0.532756, -0.8020776, -2.115286, 0.1294118, 1, 0, 1,
-0.5280054, 0.7840819, 1.001245, 0.1215686, 1, 0, 1,
-0.5227266, -0.6862699, -1.341713, 0.1176471, 1, 0, 1,
-0.5216596, 2.114754, -0.3439481, 0.1098039, 1, 0, 1,
-0.5207954, -0.6074975, -1.785176, 0.1058824, 1, 0, 1,
-0.5162049, -0.1690109, -1.914751, 0.09803922, 1, 0, 1,
-0.5150651, -0.4898082, -1.234853, 0.09019608, 1, 0, 1,
-0.512913, -1.420225, -2.672609, 0.08627451, 1, 0, 1,
-0.5092483, 0.6528113, -1.251778, 0.07843138, 1, 0, 1,
-0.5056952, -0.4486193, -1.986043, 0.07450981, 1, 0, 1,
-0.4885652, 0.909041, -2.497118, 0.06666667, 1, 0, 1,
-0.4850074, -0.3518414, -0.4719232, 0.0627451, 1, 0, 1,
-0.481407, 0.02925271, -0.9124403, 0.05490196, 1, 0, 1,
-0.4784015, 1.736033, -0.1597718, 0.05098039, 1, 0, 1,
-0.4763589, -0.347894, -3.931827, 0.04313726, 1, 0, 1,
-0.4686956, 1.217396, -0.5187711, 0.03921569, 1, 0, 1,
-0.4673167, -0.2406963, -3.153807, 0.03137255, 1, 0, 1,
-0.4666134, -0.4282459, -3.189667, 0.02745098, 1, 0, 1,
-0.4656594, 0.4214255, -2.125828, 0.01960784, 1, 0, 1,
-0.4654934, 0.4032536, -2.423094, 0.01568628, 1, 0, 1,
-0.457798, 0.08636941, -0.8746779, 0.007843138, 1, 0, 1,
-0.4539399, -1.662707, -3.244502, 0.003921569, 1, 0, 1,
-0.4535613, -0.2817447, -0.3706508, 0, 1, 0.003921569, 1,
-0.4447417, 1.110316, -1.178698, 0, 1, 0.01176471, 1,
-0.4411917, 1.557924, 1.230593, 0, 1, 0.01568628, 1,
-0.4384718, -0.4474998, -1.373965, 0, 1, 0.02352941, 1,
-0.4351209, 0.6394937, -1.5659, 0, 1, 0.02745098, 1,
-0.4328502, 0.4310932, -1.450965, 0, 1, 0.03529412, 1,
-0.4304062, 0.2265725, -1.552362, 0, 1, 0.03921569, 1,
-0.4256847, 0.4821086, -1.169602, 0, 1, 0.04705882, 1,
-0.4238976, -1.070427, -2.077658, 0, 1, 0.05098039, 1,
-0.4216081, 0.3793715, -0.6793593, 0, 1, 0.05882353, 1,
-0.4133259, 1.310465, -1.035493, 0, 1, 0.0627451, 1,
-0.4110257, 0.6407726, -0.6433128, 0, 1, 0.07058824, 1,
-0.4095526, 0.1974096, -1.33135, 0, 1, 0.07450981, 1,
-0.4071863, 1.722955, -0.8107269, 0, 1, 0.08235294, 1,
-0.4051515, 0.889944, -1.825386, 0, 1, 0.08627451, 1,
-0.4013746, -0.3082014, -1.695847, 0, 1, 0.09411765, 1,
-0.4012846, 1.052196, 1.661099, 0, 1, 0.1019608, 1,
-0.4002047, 0.244473, 0.7010419, 0, 1, 0.1058824, 1,
-0.3989512, -0.8838575, -0.7006899, 0, 1, 0.1137255, 1,
-0.394897, 0.5894454, 0.3045884, 0, 1, 0.1176471, 1,
-0.3942092, -0.7911605, -3.685126, 0, 1, 0.1254902, 1,
-0.3920914, -1.561715, -2.500356, 0, 1, 0.1294118, 1,
-0.3898233, 1.631304, -0.2747929, 0, 1, 0.1372549, 1,
-0.3892106, 1.751253, 0.07819472, 0, 1, 0.1411765, 1,
-0.3857099, -0.9344169, -1.874665, 0, 1, 0.1490196, 1,
-0.3836108, -0.7577452, -1.270439, 0, 1, 0.1529412, 1,
-0.3804418, -1.056345, -2.593641, 0, 1, 0.1607843, 1,
-0.3771271, 0.06062409, -0.5815358, 0, 1, 0.1647059, 1,
-0.3765848, 0.3742725, 0.7742991, 0, 1, 0.172549, 1,
-0.3706749, -0.3797299, -1.136977, 0, 1, 0.1764706, 1,
-0.3624334, -1.086226, -2.580838, 0, 1, 0.1843137, 1,
-0.3607918, -0.6915883, -2.923005, 0, 1, 0.1882353, 1,
-0.3603512, 2.299789, -0.1538435, 0, 1, 0.1960784, 1,
-0.3591725, 1.996467, 1.134484, 0, 1, 0.2039216, 1,
-0.3588458, 0.8665634, -1.496194, 0, 1, 0.2078431, 1,
-0.3538831, 0.5037973, -0.804719, 0, 1, 0.2156863, 1,
-0.3505209, -0.1157144, -0.7581661, 0, 1, 0.2196078, 1,
-0.3504601, 0.2065898, -1.77025, 0, 1, 0.227451, 1,
-0.3429292, 1.837944, -1.122226, 0, 1, 0.2313726, 1,
-0.3422019, 1.774537, -1.570784, 0, 1, 0.2392157, 1,
-0.3394354, 0.07233503, -2.03243, 0, 1, 0.2431373, 1,
-0.3374122, -0.2579804, -0.8574321, 0, 1, 0.2509804, 1,
-0.3367838, 0.5754133, -0.7163553, 0, 1, 0.254902, 1,
-0.3360195, 0.9063884, 0.6640163, 0, 1, 0.2627451, 1,
-0.3358157, -0.1643814, -3.593106, 0, 1, 0.2666667, 1,
-0.328225, 0.5784457, -0.8956354, 0, 1, 0.2745098, 1,
-0.3253745, -1.182639, -1.33321, 0, 1, 0.2784314, 1,
-0.3098186, 1.054303, -1.223223, 0, 1, 0.2862745, 1,
-0.305506, -1.828012, -3.414508, 0, 1, 0.2901961, 1,
-0.3046878, -0.7737118, -3.794598, 0, 1, 0.2980392, 1,
-0.3025182, -0.2103782, -2.080547, 0, 1, 0.3058824, 1,
-0.2997423, 0.05266989, -1.740027, 0, 1, 0.3098039, 1,
-0.2946428, 1.922242, -1.065094, 0, 1, 0.3176471, 1,
-0.2926672, 0.7320634, -0.9093596, 0, 1, 0.3215686, 1,
-0.292642, -0.1902403, -3.532498, 0, 1, 0.3294118, 1,
-0.2926068, -0.05154379, -2.311994, 0, 1, 0.3333333, 1,
-0.2911867, 0.6226895, 0.1271143, 0, 1, 0.3411765, 1,
-0.2895491, 0.7704323, -0.1915633, 0, 1, 0.345098, 1,
-0.2870468, -0.23404, -3.742131, 0, 1, 0.3529412, 1,
-0.2858096, -0.5763856, -4.979923, 0, 1, 0.3568628, 1,
-0.2825036, 0.9956834, 0.6520172, 0, 1, 0.3647059, 1,
-0.2806692, -0.7452127, -4.260552, 0, 1, 0.3686275, 1,
-0.2804081, -0.760556, -1.745055, 0, 1, 0.3764706, 1,
-0.2795655, -0.5435399, -1.852413, 0, 1, 0.3803922, 1,
-0.2719217, -0.8424524, -2.289423, 0, 1, 0.3882353, 1,
-0.2717188, 1.492432, -0.884726, 0, 1, 0.3921569, 1,
-0.2694563, -1.082289, -2.234111, 0, 1, 0.4, 1,
-0.2652367, 1.357252, -1.330908, 0, 1, 0.4078431, 1,
-0.2600348, -1.887065, -2.646983, 0, 1, 0.4117647, 1,
-0.2598945, 0.120248, -0.5493796, 0, 1, 0.4196078, 1,
-0.2585526, -0.1534335, -2.256735, 0, 1, 0.4235294, 1,
-0.2571277, 0.6833943, -0.546735, 0, 1, 0.4313726, 1,
-0.2571244, -0.349459, 0.2388152, 0, 1, 0.4352941, 1,
-0.2545449, -0.8957413, -2.841136, 0, 1, 0.4431373, 1,
-0.2515178, 0.2176388, -0.8494655, 0, 1, 0.4470588, 1,
-0.2513267, -0.1321427, 0.5762434, 0, 1, 0.454902, 1,
-0.2512012, 0.2159708, -2.270363, 0, 1, 0.4588235, 1,
-0.2433797, -0.4164657, -2.442522, 0, 1, 0.4666667, 1,
-0.2392805, -0.3512282, -2.003749, 0, 1, 0.4705882, 1,
-0.2384216, -2.204158, -4.458696, 0, 1, 0.4784314, 1,
-0.2324089, -0.6083214, -1.329136, 0, 1, 0.4823529, 1,
-0.2303324, 1.55218, 0.5739384, 0, 1, 0.4901961, 1,
-0.2296845, -1.155952, -3.549665, 0, 1, 0.4941176, 1,
-0.2295575, 0.5364577, 1.297303, 0, 1, 0.5019608, 1,
-0.2265805, -0.1415719, -3.040074, 0, 1, 0.509804, 1,
-0.2249032, 0.8214417, 0.3164, 0, 1, 0.5137255, 1,
-0.2238699, -1.969282, -3.199163, 0, 1, 0.5215687, 1,
-0.2201942, 0.5721198, -1.118173, 0, 1, 0.5254902, 1,
-0.2191393, 0.545891, -1.083619, 0, 1, 0.5333334, 1,
-0.2174665, -0.2459136, -0.9590194, 0, 1, 0.5372549, 1,
-0.2172432, -1.636905, -4.228345, 0, 1, 0.5450981, 1,
-0.2098909, 0.6248114, -0.0970135, 0, 1, 0.5490196, 1,
-0.2062379, -0.503579, -1.411655, 0, 1, 0.5568628, 1,
-0.2021441, -0.05754149, -0.5276119, 0, 1, 0.5607843, 1,
-0.1992205, 1.095714, -1.761525, 0, 1, 0.5686275, 1,
-0.1990123, 2.708207, 1.374161, 0, 1, 0.572549, 1,
-0.1945917, -0.8613503, -2.884131, 0, 1, 0.5803922, 1,
-0.1921821, 0.6953294, -1.431235, 0, 1, 0.5843138, 1,
-0.1861563, -2.275068, -1.102979, 0, 1, 0.5921569, 1,
-0.1854898, -1.017598, -3.1628, 0, 1, 0.5960785, 1,
-0.1818013, 0.9091693, -0.05733398, 0, 1, 0.6039216, 1,
-0.1800058, -0.9281364, -3.27093, 0, 1, 0.6117647, 1,
-0.1789003, 0.6563933, -1.385129, 0, 1, 0.6156863, 1,
-0.1774465, 0.8651438, 0.8109867, 0, 1, 0.6235294, 1,
-0.1764507, 0.6978728, 0.673599, 0, 1, 0.627451, 1,
-0.1687229, 0.4109795, -1.528442, 0, 1, 0.6352941, 1,
-0.1684312, 0.04133534, -0.6095712, 0, 1, 0.6392157, 1,
-0.1670801, 0.8101763, 0.7102677, 0, 1, 0.6470588, 1,
-0.162545, 0.04516597, -2.581697, 0, 1, 0.6509804, 1,
-0.162334, -2.094257, -4.571773, 0, 1, 0.6588235, 1,
-0.1495944, 0.05351146, -0.990625, 0, 1, 0.6627451, 1,
-0.1480068, 0.6592011, 0.05010163, 0, 1, 0.6705883, 1,
-0.1467612, -0.1232191, -2.188005, 0, 1, 0.6745098, 1,
-0.141898, -1.597302, -3.650054, 0, 1, 0.682353, 1,
-0.1359747, 0.5326014, -0.4281135, 0, 1, 0.6862745, 1,
-0.134363, -1.06196, -3.711131, 0, 1, 0.6941177, 1,
-0.128747, -1.186986, -4.613036, 0, 1, 0.7019608, 1,
-0.1282056, 1.082171, -0.6303378, 0, 1, 0.7058824, 1,
-0.1163605, -1.613675, -3.174067, 0, 1, 0.7137255, 1,
-0.11449, -1.001432, -3.860797, 0, 1, 0.7176471, 1,
-0.1133587, -0.3267584, -3.330594, 0, 1, 0.7254902, 1,
-0.1111434, 1.08796, -0.3386335, 0, 1, 0.7294118, 1,
-0.1104179, -0.3234753, -3.811872, 0, 1, 0.7372549, 1,
-0.1086198, -1.474406, -4.739491, 0, 1, 0.7411765, 1,
-0.1039791, 1.285564, 0.3223009, 0, 1, 0.7490196, 1,
-0.1012162, -0.5624573, -2.300504, 0, 1, 0.7529412, 1,
-0.1004482, -2.292675, -3.741464, 0, 1, 0.7607843, 1,
-0.09997093, 1.95968, -1.053933, 0, 1, 0.7647059, 1,
-0.09981973, -1.646691, -4.218331, 0, 1, 0.772549, 1,
-0.09897935, 0.3394128, -2.249329, 0, 1, 0.7764706, 1,
-0.09823237, -0.553238, -2.132033, 0, 1, 0.7843137, 1,
-0.09714847, 0.4276075, -1.489933, 0, 1, 0.7882353, 1,
-0.0970728, -0.1854864, -3.176872, 0, 1, 0.7960784, 1,
-0.08901379, -1.269847, -2.785601, 0, 1, 0.8039216, 1,
-0.08829772, 0.1360681, -0.9789158, 0, 1, 0.8078431, 1,
-0.08664294, -0.711209, -1.922256, 0, 1, 0.8156863, 1,
-0.0841846, 0.8300601, -1.050343, 0, 1, 0.8196079, 1,
-0.08413114, -0.3097048, -2.545873, 0, 1, 0.827451, 1,
-0.07777282, 0.32133, 0.2338531, 0, 1, 0.8313726, 1,
-0.0751171, 1.072474, -0.1467602, 0, 1, 0.8392157, 1,
-0.07435661, 0.7984406, -0.3064194, 0, 1, 0.8431373, 1,
-0.07400104, -0.689077, -3.137653, 0, 1, 0.8509804, 1,
-0.07300864, -0.1538571, -2.780915, 0, 1, 0.854902, 1,
-0.0728076, -0.4579104, -3.235392, 0, 1, 0.8627451, 1,
-0.06593999, 0.7569165, -0.7539613, 0, 1, 0.8666667, 1,
-0.06161127, -0.8005502, -2.331786, 0, 1, 0.8745098, 1,
-0.0613093, 0.7428458, -0.2540549, 0, 1, 0.8784314, 1,
-0.05764302, -0.9481972, -2.277037, 0, 1, 0.8862745, 1,
-0.05675254, -1.091853, -1.901874, 0, 1, 0.8901961, 1,
-0.05670963, 1.693918, 1.892818, 0, 1, 0.8980392, 1,
-0.05154713, 1.280368, -0.7409585, 0, 1, 0.9058824, 1,
-0.04925717, -0.2939531, -2.733072, 0, 1, 0.9098039, 1,
-0.04274695, -1.808148, -3.368786, 0, 1, 0.9176471, 1,
-0.04198573, -0.4887753, -1.927936, 0, 1, 0.9215686, 1,
-0.03473035, -0.551157, -4.953727, 0, 1, 0.9294118, 1,
-0.03342714, -0.3379876, -2.930245, 0, 1, 0.9333333, 1,
-0.03304936, -1.96375, -4.206978, 0, 1, 0.9411765, 1,
-0.03282755, -0.8329341, -3.64842, 0, 1, 0.945098, 1,
-0.02494625, -2.519888, -4.968579, 0, 1, 0.9529412, 1,
-0.02187414, 0.7151845, -2.131426, 0, 1, 0.9568627, 1,
-0.01914036, 0.4493075, 2.268636, 0, 1, 0.9647059, 1,
-0.01740476, -1.307431, -1.979537, 0, 1, 0.9686275, 1,
-0.01453819, 1.388497, 0.9764679, 0, 1, 0.9764706, 1,
-0.01250947, 0.3853812, 1.376155, 0, 1, 0.9803922, 1,
-0.01063245, -0.4792732, -1.871156, 0, 1, 0.9882353, 1,
-0.01010417, 0.9716741, 0.6793805, 0, 1, 0.9921569, 1,
-0.007201064, -0.6680722, -3.131354, 0, 1, 1, 1,
-0.001011487, 1.129919, 0.5750204, 0, 0.9921569, 1, 1,
0.00193846, -0.6751547, 3.044091, 0, 0.9882353, 1, 1,
0.006261061, 0.6747488, 0.2205116, 0, 0.9803922, 1, 1,
0.009622966, 0.3087229, 0.6022211, 0, 0.9764706, 1, 1,
0.0127414, 1.285737, -0.3622304, 0, 0.9686275, 1, 1,
0.01354387, 0.5507165, -1.877034, 0, 0.9647059, 1, 1,
0.01407415, -0.2604271, 1.589592, 0, 0.9568627, 1, 1,
0.01481065, -0.5172526, 3.583702, 0, 0.9529412, 1, 1,
0.01632159, 0.2909606, 0.7064611, 0, 0.945098, 1, 1,
0.02111001, 0.4864512, 0.09613609, 0, 0.9411765, 1, 1,
0.02176406, 1.094207, -0.08554534, 0, 0.9333333, 1, 1,
0.02469128, 1.786415, -0.03967068, 0, 0.9294118, 1, 1,
0.02533751, -1.656175, 3.224473, 0, 0.9215686, 1, 1,
0.02894742, 0.839447, 0.03323692, 0, 0.9176471, 1, 1,
0.03091853, 0.6194587, 0.3062155, 0, 0.9098039, 1, 1,
0.03141376, -0.009903852, 2.245064, 0, 0.9058824, 1, 1,
0.03520591, -1.054745, 3.651849, 0, 0.8980392, 1, 1,
0.03830715, 0.8493347, -0.3728691, 0, 0.8901961, 1, 1,
0.04047282, -1.53074, 3.501932, 0, 0.8862745, 1, 1,
0.04159466, 1.244175, 1.455506, 0, 0.8784314, 1, 1,
0.04326044, -1.078774, 4.21057, 0, 0.8745098, 1, 1,
0.04345946, -0.4032967, 2.485092, 0, 0.8666667, 1, 1,
0.04380798, 2.110234, -1.285477, 0, 0.8627451, 1, 1,
0.04682895, -0.4338597, 4.953245, 0, 0.854902, 1, 1,
0.04846606, 0.4875956, -0.4867339, 0, 0.8509804, 1, 1,
0.0505996, 0.603502, 0.2674123, 0, 0.8431373, 1, 1,
0.05112535, -1.097355, 3.944438, 0, 0.8392157, 1, 1,
0.05510879, -0.2557291, 3.643898, 0, 0.8313726, 1, 1,
0.05523949, -0.95539, 3.873134, 0, 0.827451, 1, 1,
0.0574035, 0.5314816, -0.01435968, 0, 0.8196079, 1, 1,
0.06040357, -0.3921678, 3.67726, 0, 0.8156863, 1, 1,
0.06079754, 1.493782, 0.2382774, 0, 0.8078431, 1, 1,
0.06087335, 0.6546522, 0.2804074, 0, 0.8039216, 1, 1,
0.0632551, -0.754445, 2.136817, 0, 0.7960784, 1, 1,
0.06329951, 0.2291567, 0.943054, 0, 0.7882353, 1, 1,
0.06438748, 0.1338788, 1.505205, 0, 0.7843137, 1, 1,
0.06568731, -0.1090717, 1.489739, 0, 0.7764706, 1, 1,
0.06792095, 0.2667175, 0.4564032, 0, 0.772549, 1, 1,
0.07010572, -0.6724458, 4.166722, 0, 0.7647059, 1, 1,
0.0751643, 0.1894938, 2.08283, 0, 0.7607843, 1, 1,
0.08005089, -1.796866, 1.130283, 0, 0.7529412, 1, 1,
0.08846705, 0.9509903, 1.624381, 0, 0.7490196, 1, 1,
0.09232289, 1.152481, 1.878753, 0, 0.7411765, 1, 1,
0.09360377, -0.5946208, 3.659173, 0, 0.7372549, 1, 1,
0.09833416, 0.9734152, 1.622828, 0, 0.7294118, 1, 1,
0.09926948, -0.579461, 2.28134, 0, 0.7254902, 1, 1,
0.1013832, 0.2904723, 1.14665, 0, 0.7176471, 1, 1,
0.1017833, 1.142246, 0.7496328, 0, 0.7137255, 1, 1,
0.1033199, -1.907658, 2.892684, 0, 0.7058824, 1, 1,
0.1091623, 1.061102, -0.8963508, 0, 0.6980392, 1, 1,
0.1119659, 0.5556066, -0.8133415, 0, 0.6941177, 1, 1,
0.1129486, 0.2644091, -0.7950857, 0, 0.6862745, 1, 1,
0.1134958, -0.144211, 2.823507, 0, 0.682353, 1, 1,
0.119578, -0.3735316, 5.413358, 0, 0.6745098, 1, 1,
0.1196569, 0.2993027, 0.007713672, 0, 0.6705883, 1, 1,
0.1196883, -2.604715, 2.150012, 0, 0.6627451, 1, 1,
0.1260286, -0.9888523, 2.72887, 0, 0.6588235, 1, 1,
0.1341639, 1.643324, -1.468686, 0, 0.6509804, 1, 1,
0.1342923, 0.8283739, -0.9746101, 0, 0.6470588, 1, 1,
0.1394411, 0.1125722, 0.4389812, 0, 0.6392157, 1, 1,
0.1408359, -0.425955, 2.887645, 0, 0.6352941, 1, 1,
0.1499221, -0.5543312, 2.758962, 0, 0.627451, 1, 1,
0.1538072, 0.1804476, 1.953953, 0, 0.6235294, 1, 1,
0.1583017, 0.1285018, -0.5873209, 0, 0.6156863, 1, 1,
0.158414, -0.05597154, 1.846676, 0, 0.6117647, 1, 1,
0.1591042, -1.60193, 1.681803, 0, 0.6039216, 1, 1,
0.1637058, 0.008596881, 1.401253, 0, 0.5960785, 1, 1,
0.1696119, -1.642795, 2.164539, 0, 0.5921569, 1, 1,
0.1719049, 1.12245, 0.05251822, 0, 0.5843138, 1, 1,
0.1829582, 1.786734, 0.1931976, 0, 0.5803922, 1, 1,
0.1852011, -0.4936719, 1.859293, 0, 0.572549, 1, 1,
0.1885018, -0.4245402, 2.789979, 0, 0.5686275, 1, 1,
0.1941183, 2.386067, 0.483088, 0, 0.5607843, 1, 1,
0.1947381, 0.7442082, 1.372535, 0, 0.5568628, 1, 1,
0.1964079, 0.07170454, 0.7812423, 0, 0.5490196, 1, 1,
0.1967573, 0.527788, -0.2496561, 0, 0.5450981, 1, 1,
0.1999502, -0.1480588, 3.052047, 0, 0.5372549, 1, 1,
0.2016033, 0.6011098, 1.485818, 0, 0.5333334, 1, 1,
0.202596, 0.9996856, -0.8017391, 0, 0.5254902, 1, 1,
0.2045908, 0.1762573, 1.886262, 0, 0.5215687, 1, 1,
0.2064783, 1.519533, 0.3488657, 0, 0.5137255, 1, 1,
0.2065019, 0.6559783, -0.5877337, 0, 0.509804, 1, 1,
0.2150838, 0.6369116, -1.372639, 0, 0.5019608, 1, 1,
0.217772, -1.225757, 0.8901435, 0, 0.4941176, 1, 1,
0.2178852, 0.4040992, 1.40633, 0, 0.4901961, 1, 1,
0.2201584, -0.5522098, 2.283319, 0, 0.4823529, 1, 1,
0.226044, 1.341796, 0.6831916, 0, 0.4784314, 1, 1,
0.2272697, 0.8653797, 0.0226267, 0, 0.4705882, 1, 1,
0.2286111, -0.1371915, 2.924013, 0, 0.4666667, 1, 1,
0.2341144, 0.2489772, 0.5896633, 0, 0.4588235, 1, 1,
0.2358783, 0.01153862, 1.818901, 0, 0.454902, 1, 1,
0.2461763, -0.6645218, 2.704343, 0, 0.4470588, 1, 1,
0.2496005, -0.09337031, 2.351292, 0, 0.4431373, 1, 1,
0.2497941, -0.1291602, 2.176261, 0, 0.4352941, 1, 1,
0.2526888, 1.130937, 0.8020098, 0, 0.4313726, 1, 1,
0.252935, 1.873099, -1.358555, 0, 0.4235294, 1, 1,
0.2533075, 1.075263, -0.4398642, 0, 0.4196078, 1, 1,
0.2534139, -0.3159671, 3.001543, 0, 0.4117647, 1, 1,
0.2547419, -0.2637984, 2.059136, 0, 0.4078431, 1, 1,
0.2586902, 0.4636319, -0.5774149, 0, 0.4, 1, 1,
0.2637107, -1.304687, 4.298342, 0, 0.3921569, 1, 1,
0.2641402, -0.8011611, 1.771114, 0, 0.3882353, 1, 1,
0.2687956, 0.0772414, -0.04960851, 0, 0.3803922, 1, 1,
0.2738981, -0.3028857, 3.120273, 0, 0.3764706, 1, 1,
0.2755744, 0.2752458, 0.03048341, 0, 0.3686275, 1, 1,
0.2816803, 0.2613654, 2.75381, 0, 0.3647059, 1, 1,
0.2818257, 0.9201976, 1.424676, 0, 0.3568628, 1, 1,
0.2823946, -0.8531539, 2.079276, 0, 0.3529412, 1, 1,
0.2865407, 0.3428105, 1.832326, 0, 0.345098, 1, 1,
0.2872609, 0.4978339, 2.099678, 0, 0.3411765, 1, 1,
0.290756, 0.2427138, 1.273006, 0, 0.3333333, 1, 1,
0.2917711, -0.8437154, 1.478597, 0, 0.3294118, 1, 1,
0.2930667, 1.308787, 0.865342, 0, 0.3215686, 1, 1,
0.2940396, -0.3419715, 0.8687276, 0, 0.3176471, 1, 1,
0.2964821, 0.5175542, -0.3987418, 0, 0.3098039, 1, 1,
0.2973896, -0.2970675, 2.554057, 0, 0.3058824, 1, 1,
0.3020133, 0.06760175, 1.578226, 0, 0.2980392, 1, 1,
0.3027593, -0.6955814, 3.120876, 0, 0.2901961, 1, 1,
0.3032018, 0.03198775, 0.04562141, 0, 0.2862745, 1, 1,
0.3057513, 0.1921825, 0.1609902, 0, 0.2784314, 1, 1,
0.3146656, 0.955169, -0.5214562, 0, 0.2745098, 1, 1,
0.3171972, 1.408884, -1.518247, 0, 0.2666667, 1, 1,
0.3212053, 0.3766585, 2.240896, 0, 0.2627451, 1, 1,
0.3217857, 0.293435, 2.198737, 0, 0.254902, 1, 1,
0.324461, 1.639812, 1.08039, 0, 0.2509804, 1, 1,
0.3244652, -0.2756886, 3.180087, 0, 0.2431373, 1, 1,
0.3250781, -0.418319, 1.805159, 0, 0.2392157, 1, 1,
0.3357351, 0.8261117, -0.9664038, 0, 0.2313726, 1, 1,
0.3381705, 1.271034, -0.3393453, 0, 0.227451, 1, 1,
0.3382061, 0.5515095, 0.818264, 0, 0.2196078, 1, 1,
0.3426618, -0.958578, 4.015424, 0, 0.2156863, 1, 1,
0.3458762, -0.1772488, 1.771519, 0, 0.2078431, 1, 1,
0.352054, 0.6540725, 0.39382, 0, 0.2039216, 1, 1,
0.3600218, -0.4698443, 4.230134, 0, 0.1960784, 1, 1,
0.3604663, 0.7738556, 0.7486162, 0, 0.1882353, 1, 1,
0.3606768, -1.503204, 3.010906, 0, 0.1843137, 1, 1,
0.3655964, 0.5603543, 0.8340214, 0, 0.1764706, 1, 1,
0.3657953, -1.74792, 1.728044, 0, 0.172549, 1, 1,
0.3669798, 0.5787651, 0.05874414, 0, 0.1647059, 1, 1,
0.3709654, 1.025909, 2.096247, 0, 0.1607843, 1, 1,
0.3733756, 3.234362, 0.7025084, 0, 0.1529412, 1, 1,
0.3737651, 1.299224, -0.5162944, 0, 0.1490196, 1, 1,
0.3761645, -1.047093, 3.801133, 0, 0.1411765, 1, 1,
0.3764074, -0.3302897, 2.13614, 0, 0.1372549, 1, 1,
0.3806998, 0.1433943, 1.286926, 0, 0.1294118, 1, 1,
0.385244, -0.8126811, 2.806442, 0, 0.1254902, 1, 1,
0.3854885, -0.4610897, 2.253142, 0, 0.1176471, 1, 1,
0.3880932, -0.9178388, 3.463417, 0, 0.1137255, 1, 1,
0.3944552, -0.02125021, 1.73481, 0, 0.1058824, 1, 1,
0.3959562, -0.798691, 2.360821, 0, 0.09803922, 1, 1,
0.3997969, 1.043307, 0.6832027, 0, 0.09411765, 1, 1,
0.4000182, -1.66409, 3.222094, 0, 0.08627451, 1, 1,
0.4075728, 2.191968, -0.1618909, 0, 0.08235294, 1, 1,
0.40937, 1.203519, 1.561286, 0, 0.07450981, 1, 1,
0.4109668, -1.302013, 1.59704, 0, 0.07058824, 1, 1,
0.4192677, 0.01783365, 2.380057, 0, 0.0627451, 1, 1,
0.420264, -1.210883, 1.191813, 0, 0.05882353, 1, 1,
0.4224731, -0.1830595, 1.710015, 0, 0.05098039, 1, 1,
0.4224925, -0.8737546, 2.714293, 0, 0.04705882, 1, 1,
0.4232045, -1.896217, 3.318838, 0, 0.03921569, 1, 1,
0.4233475, 0.6946327, 2.109595, 0, 0.03529412, 1, 1,
0.4264984, -1.416505, 1.939783, 0, 0.02745098, 1, 1,
0.4309958, 0.4493035, -1.004477, 0, 0.02352941, 1, 1,
0.4323229, -0.706944, 2.409974, 0, 0.01568628, 1, 1,
0.43284, -1.376338, 2.295361, 0, 0.01176471, 1, 1,
0.4352547, -0.4479016, 2.65702, 0, 0.003921569, 1, 1,
0.4392124, 0.7156901, 1.231818, 0.003921569, 0, 1, 1,
0.4401528, 0.6475323, 2.461025, 0.007843138, 0, 1, 1,
0.4463314, 0.5418539, 1.852491, 0.01568628, 0, 1, 1,
0.4493035, 1.556607, -0.3527194, 0.01960784, 0, 1, 1,
0.4503971, 2.429329, 1.462743, 0.02745098, 0, 1, 1,
0.4551219, -0.06478458, 3.304548, 0.03137255, 0, 1, 1,
0.4574979, -1.418846, 1.270825, 0.03921569, 0, 1, 1,
0.464826, 0.4725853, 0.9758779, 0.04313726, 0, 1, 1,
0.4654213, -1.064119, 2.779924, 0.05098039, 0, 1, 1,
0.4674622, 0.9095998, -1.452621, 0.05490196, 0, 1, 1,
0.4678168, 0.3590988, 0.5778093, 0.0627451, 0, 1, 1,
0.4685661, 0.6302188, -1.050881, 0.06666667, 0, 1, 1,
0.4727106, 0.6063184, -0.1362705, 0.07450981, 0, 1, 1,
0.4771953, -0.4520098, 2.4316, 0.07843138, 0, 1, 1,
0.4793309, -1.393963, 3.05556, 0.08627451, 0, 1, 1,
0.4797165, 1.616736, -0.1931087, 0.09019608, 0, 1, 1,
0.4813805, 1.986838, 0.5330215, 0.09803922, 0, 1, 1,
0.4828053, -0.309536, 0.7536217, 0.1058824, 0, 1, 1,
0.4834878, 0.005892487, 2.554318, 0.1098039, 0, 1, 1,
0.4860515, -1.062148, 2.506809, 0.1176471, 0, 1, 1,
0.491141, 0.4106741, 2.203732, 0.1215686, 0, 1, 1,
0.4974342, -0.05026047, 1.302557, 0.1294118, 0, 1, 1,
0.4984277, 0.1696207, 1.353123, 0.1333333, 0, 1, 1,
0.4989138, 0.1092933, 0.3972383, 0.1411765, 0, 1, 1,
0.503965, -0.01843489, 2.025573, 0.145098, 0, 1, 1,
0.5064614, -0.6804841, 2.809975, 0.1529412, 0, 1, 1,
0.5122336, 0.02282687, 0.5347053, 0.1568628, 0, 1, 1,
0.5175631, -1.174719, 2.121046, 0.1647059, 0, 1, 1,
0.5201936, -0.02609203, 1.355617, 0.1686275, 0, 1, 1,
0.5203387, 0.6330434, 0.208593, 0.1764706, 0, 1, 1,
0.5206278, 0.670787, 3.088295, 0.1803922, 0, 1, 1,
0.5208071, -0.05948817, -0.1651903, 0.1882353, 0, 1, 1,
0.5335003, -0.7061134, 3.047565, 0.1921569, 0, 1, 1,
0.5350721, 0.4271559, 3.387077, 0.2, 0, 1, 1,
0.5504711, -0.8800136, 3.418005, 0.2078431, 0, 1, 1,
0.550557, -1.115133, 3.894854, 0.2117647, 0, 1, 1,
0.553077, 0.7899273, 2.744249, 0.2196078, 0, 1, 1,
0.5599043, 0.6364359, 0.5033553, 0.2235294, 0, 1, 1,
0.5674474, -0.6913661, 2.159033, 0.2313726, 0, 1, 1,
0.5696176, 0.4338555, 1.804669, 0.2352941, 0, 1, 1,
0.5704826, -0.2764576, 2.536422, 0.2431373, 0, 1, 1,
0.5708908, -0.6111075, 1.0325, 0.2470588, 0, 1, 1,
0.5729701, -1.303236, 3.909474, 0.254902, 0, 1, 1,
0.5806628, 0.8627942, -0.2723957, 0.2588235, 0, 1, 1,
0.5811079, -0.4856993, 2.067782, 0.2666667, 0, 1, 1,
0.5820525, -0.2347965, 2.280735, 0.2705882, 0, 1, 1,
0.5849085, -0.665716, 1.246638, 0.2784314, 0, 1, 1,
0.5856194, -0.4265824, 2.521214, 0.282353, 0, 1, 1,
0.5866249, 0.305648, -0.2508141, 0.2901961, 0, 1, 1,
0.5928826, 0.3829041, 3.104069, 0.2941177, 0, 1, 1,
0.5995861, 0.3147773, 0.008871969, 0.3019608, 0, 1, 1,
0.6020056, 2.801664, 0.8968225, 0.3098039, 0, 1, 1,
0.6058549, -0.9803025, -0.3539948, 0.3137255, 0, 1, 1,
0.6108999, 1.688206, 0.4311638, 0.3215686, 0, 1, 1,
0.6142557, 1.236569, 0.608189, 0.3254902, 0, 1, 1,
0.6165879, -0.9697399, 3.088313, 0.3333333, 0, 1, 1,
0.6178365, -0.8381051, 3.40975, 0.3372549, 0, 1, 1,
0.6194533, 0.6382511, 0.2637424, 0.345098, 0, 1, 1,
0.6199397, 0.04745399, 1.542557, 0.3490196, 0, 1, 1,
0.6212155, -0.5688384, 2.022523, 0.3568628, 0, 1, 1,
0.6228029, -0.5900076, 2.073822, 0.3607843, 0, 1, 1,
0.6285582, -1.113604, 0.5113638, 0.3686275, 0, 1, 1,
0.6338317, 1.394657, 0.7788741, 0.372549, 0, 1, 1,
0.6365653, -1.34183, 2.843083, 0.3803922, 0, 1, 1,
0.6454998, 0.531381, 1.734335, 0.3843137, 0, 1, 1,
0.6455295, 0.2594161, 1.68037, 0.3921569, 0, 1, 1,
0.6463104, -2.082277, 1.347393, 0.3960784, 0, 1, 1,
0.6478382, -0.9267044, 2.821117, 0.4039216, 0, 1, 1,
0.648151, -0.6855635, 1.272662, 0.4117647, 0, 1, 1,
0.6488594, 0.05188762, 3.02763, 0.4156863, 0, 1, 1,
0.6526197, -0.8988495, 2.104779, 0.4235294, 0, 1, 1,
0.6549139, 0.1717066, 2.479357, 0.427451, 0, 1, 1,
0.6598971, -1.079668, 3.294836, 0.4352941, 0, 1, 1,
0.6631644, 2.036689, -0.02495312, 0.4392157, 0, 1, 1,
0.6734581, 2.021667, -0.6705103, 0.4470588, 0, 1, 1,
0.6788056, 1.350808, -0.5051311, 0.4509804, 0, 1, 1,
0.6800662, 0.6129445, 1.067128, 0.4588235, 0, 1, 1,
0.6804391, 0.3736329, -1.281972, 0.4627451, 0, 1, 1,
0.6844244, 0.6893219, -0.2804958, 0.4705882, 0, 1, 1,
0.6878327, 0.9866132, -0.2418499, 0.4745098, 0, 1, 1,
0.6925781, -0.02361012, 2.099447, 0.4823529, 0, 1, 1,
0.6940543, -1.015956, 1.875274, 0.4862745, 0, 1, 1,
0.698209, -0.1662378, 3.285178, 0.4941176, 0, 1, 1,
0.7053342, -0.4701981, 2.541802, 0.5019608, 0, 1, 1,
0.713118, -0.7635728, 2.399188, 0.5058824, 0, 1, 1,
0.7201716, 0.3358577, 1.566675, 0.5137255, 0, 1, 1,
0.7227813, -0.003231845, 0.6162613, 0.5176471, 0, 1, 1,
0.7243029, 0.4405406, 0.2356906, 0.5254902, 0, 1, 1,
0.7364545, -0.7546237, 2.614516, 0.5294118, 0, 1, 1,
0.7379888, 0.8426483, 0.529308, 0.5372549, 0, 1, 1,
0.7380024, -1.093908, 3.033934, 0.5411765, 0, 1, 1,
0.7521829, -0.1958991, 0.2684107, 0.5490196, 0, 1, 1,
0.7535558, -0.8091467, 1.787518, 0.5529412, 0, 1, 1,
0.7553482, -0.7419499, 1.541229, 0.5607843, 0, 1, 1,
0.7570919, -2.181066, 3.908739, 0.5647059, 0, 1, 1,
0.7580156, -0.8931676, 3.064395, 0.572549, 0, 1, 1,
0.7586496, 0.3627657, 0.4487684, 0.5764706, 0, 1, 1,
0.7597299, -1.18696, 2.497768, 0.5843138, 0, 1, 1,
0.7622283, 0.9178034, -0.9177362, 0.5882353, 0, 1, 1,
0.7667355, 0.463299, 2.004885, 0.5960785, 0, 1, 1,
0.7678425, -1.682927, 2.814794, 0.6039216, 0, 1, 1,
0.7682794, 1.694657, -0.3171103, 0.6078432, 0, 1, 1,
0.7685624, 1.243573, 0.8261255, 0.6156863, 0, 1, 1,
0.7719018, 1.584437, -1.116688, 0.6196079, 0, 1, 1,
0.7725775, -0.5011796, 1.422206, 0.627451, 0, 1, 1,
0.7730979, -0.9682974, 3.23548, 0.6313726, 0, 1, 1,
0.7752902, -0.1170041, 2.639732, 0.6392157, 0, 1, 1,
0.7788109, -0.3483382, 1.821295, 0.6431373, 0, 1, 1,
0.7838029, -0.2624833, 0.1079781, 0.6509804, 0, 1, 1,
0.7929279, -1.236022, 1.222349, 0.654902, 0, 1, 1,
0.804665, -1.247001, 1.14079, 0.6627451, 0, 1, 1,
0.8151675, 1.655038, -0.5120972, 0.6666667, 0, 1, 1,
0.8176622, 0.2485456, 0.4419034, 0.6745098, 0, 1, 1,
0.8191558, -0.740133, 1.205351, 0.6784314, 0, 1, 1,
0.8229636, -0.2280965, 2.820302, 0.6862745, 0, 1, 1,
0.8303454, -0.2888625, 3.322126, 0.6901961, 0, 1, 1,
0.8305541, 0.3272905, 2.514821, 0.6980392, 0, 1, 1,
0.8353962, -0.6968417, 0.9506268, 0.7058824, 0, 1, 1,
0.835965, 0.07095558, 1.458788, 0.7098039, 0, 1, 1,
0.8393545, 0.033103, 1.216989, 0.7176471, 0, 1, 1,
0.842197, 0.08137437, 3.421302, 0.7215686, 0, 1, 1,
0.8426037, 0.1474132, 3.831772, 0.7294118, 0, 1, 1,
0.8438534, -1.418725, 4.946779, 0.7333333, 0, 1, 1,
0.8456395, -1.204473, 1.961431, 0.7411765, 0, 1, 1,
0.8463246, -0.4581401, 0.9427978, 0.7450981, 0, 1, 1,
0.8486657, 1.411292, 0.4156037, 0.7529412, 0, 1, 1,
0.8543867, 0.245864, 2.1302, 0.7568628, 0, 1, 1,
0.8550168, -1.629675, 1.95865, 0.7647059, 0, 1, 1,
0.8584312, 0.093667, 1.371658, 0.7686275, 0, 1, 1,
0.8586376, -0.9411793, 2.518445, 0.7764706, 0, 1, 1,
0.8588333, 1.935034, 0.3593801, 0.7803922, 0, 1, 1,
0.8625425, -0.4090306, 2.688334, 0.7882353, 0, 1, 1,
0.8687381, 0.2459248, 2.614051, 0.7921569, 0, 1, 1,
0.8725515, -1.8971, 4.049798, 0.8, 0, 1, 1,
0.8744043, 1.723054, 0.7140568, 0.8078431, 0, 1, 1,
0.8792346, -0.2574666, 0.05726517, 0.8117647, 0, 1, 1,
0.8817815, 1.676832, 0.9237362, 0.8196079, 0, 1, 1,
0.8844918, -0.7860234, 2.181717, 0.8235294, 0, 1, 1,
0.8886008, -1.401857, 4.032574, 0.8313726, 0, 1, 1,
0.8889146, 0.5645395, 1.299936, 0.8352941, 0, 1, 1,
0.8932745, 0.03229354, 2.151142, 0.8431373, 0, 1, 1,
0.8994603, -0.6215442, 1.1598, 0.8470588, 0, 1, 1,
0.9011942, 0.2201484, 2.218028, 0.854902, 0, 1, 1,
0.9027907, 1.330561, 1.393762, 0.8588235, 0, 1, 1,
0.9036434, 1.268537, 1.38465, 0.8666667, 0, 1, 1,
0.9041974, -0.6899439, 2.444142, 0.8705882, 0, 1, 1,
0.9125367, -0.5351112, 1.559029, 0.8784314, 0, 1, 1,
0.9196218, 0.7976784, 0.8312631, 0.8823529, 0, 1, 1,
0.9208279, 0.7041472, 2.93962, 0.8901961, 0, 1, 1,
0.9236845, 0.5124176, -0.4948505, 0.8941177, 0, 1, 1,
0.9250732, -1.015677, 2.469146, 0.9019608, 0, 1, 1,
0.9279808, 0.2896972, 2.456134, 0.9098039, 0, 1, 1,
0.9286401, 0.1511291, -1.260682, 0.9137255, 0, 1, 1,
0.9304011, -0.8660094, 0.8094773, 0.9215686, 0, 1, 1,
0.9427669, -0.9245825, 1.929569, 0.9254902, 0, 1, 1,
0.9494438, -0.5223506, 3.255621, 0.9333333, 0, 1, 1,
0.9574713, 0.304428, 1.129891, 0.9372549, 0, 1, 1,
0.9625754, -0.2167632, 1.307773, 0.945098, 0, 1, 1,
0.9649813, 0.1688587, 1.935553, 0.9490196, 0, 1, 1,
0.971273, 0.6917077, -0.3379002, 0.9568627, 0, 1, 1,
0.9783489, -0.3197336, 1.045674, 0.9607843, 0, 1, 1,
0.9859537, -0.4370982, 3.104406, 0.9686275, 0, 1, 1,
0.993116, -0.6740835, 1.89207, 0.972549, 0, 1, 1,
1.003932, 0.9930508, -0.1788273, 0.9803922, 0, 1, 1,
1.007536, 1.447688, -0.2902456, 0.9843137, 0, 1, 1,
1.0107, -0.9050264, 3.961352, 0.9921569, 0, 1, 1,
1.011198, -0.9084833, 1.004721, 0.9960784, 0, 1, 1,
1.021363, 0.7630316, 0.7539493, 1, 0, 0.9960784, 1,
1.022069, -1.464344, 2.96795, 1, 0, 0.9882353, 1,
1.023587, -0.672931, 1.330751, 1, 0, 0.9843137, 1,
1.030913, -1.858071, 4.099747, 1, 0, 0.9764706, 1,
1.032227, 1.944066, -0.6104365, 1, 0, 0.972549, 1,
1.035881, 0.4752872, 2.39345, 1, 0, 0.9647059, 1,
1.036946, -1.127861, 3.889183, 1, 0, 0.9607843, 1,
1.042752, -0.07018702, 3.108857, 1, 0, 0.9529412, 1,
1.046294, -0.3072348, 2.93536, 1, 0, 0.9490196, 1,
1.049284, -0.6725258, 1.054338, 1, 0, 0.9411765, 1,
1.061251, -0.1528431, 1.859752, 1, 0, 0.9372549, 1,
1.06556, -0.3455592, 1.185659, 1, 0, 0.9294118, 1,
1.065654, -0.0002218977, 1.492492, 1, 0, 0.9254902, 1,
1.074095, 0.3213307, 0.4419678, 1, 0, 0.9176471, 1,
1.078449, -1.62118, 1.664045, 1, 0, 0.9137255, 1,
1.079344, 0.3284782, 1.763027, 1, 0, 0.9058824, 1,
1.084415, -0.6016291, 3.038128, 1, 0, 0.9019608, 1,
1.088058, -0.6533862, 2.974654, 1, 0, 0.8941177, 1,
1.091295, 1.7686, 2.100206, 1, 0, 0.8862745, 1,
1.094166, -0.3884079, 1.237178, 1, 0, 0.8823529, 1,
1.096063, 0.2509215, 0.395267, 1, 0, 0.8745098, 1,
1.100498, 0.8376032, 0.5534805, 1, 0, 0.8705882, 1,
1.103176, 0.2249276, 1.441844, 1, 0, 0.8627451, 1,
1.10737, 0.8801153, 2.148107, 1, 0, 0.8588235, 1,
1.112474, -0.6940551, 2.859622, 1, 0, 0.8509804, 1,
1.114871, 0.6148852, 0.3633697, 1, 0, 0.8470588, 1,
1.118747, 0.1348221, 1.301002, 1, 0, 0.8392157, 1,
1.122676, -0.4376346, 1.135057, 1, 0, 0.8352941, 1,
1.129185, -0.2885562, 3.926571, 1, 0, 0.827451, 1,
1.133319, -0.5372155, 1.400481, 1, 0, 0.8235294, 1,
1.133894, 1.529857, 1.985052, 1, 0, 0.8156863, 1,
1.139046, 1.08565, 0.6223901, 1, 0, 0.8117647, 1,
1.139598, 1.403526, -0.02754974, 1, 0, 0.8039216, 1,
1.157901, 1.63892, 0.8710863, 1, 0, 0.7960784, 1,
1.158936, 0.7310295, 2.061361, 1, 0, 0.7921569, 1,
1.184867, -0.5182168, 2.009026, 1, 0, 0.7843137, 1,
1.188773, 0.2562396, 1.201199, 1, 0, 0.7803922, 1,
1.198802, 0.4112534, 1.315034, 1, 0, 0.772549, 1,
1.208752, 0.1831264, -0.2885606, 1, 0, 0.7686275, 1,
1.210598, -1.926964, 2.407976, 1, 0, 0.7607843, 1,
1.233899, -0.2072337, 2.006204, 1, 0, 0.7568628, 1,
1.235592, -0.2401975, 0.8285602, 1, 0, 0.7490196, 1,
1.236878, 0.1245279, 0.897958, 1, 0, 0.7450981, 1,
1.253634, 1.346623, 0.6439582, 1, 0, 0.7372549, 1,
1.259206, 0.23194, 0.2883787, 1, 0, 0.7333333, 1,
1.259664, 1.148605, 1.062348, 1, 0, 0.7254902, 1,
1.264004, 0.4953934, 1.047711, 1, 0, 0.7215686, 1,
1.266479, -0.3905952, 1.78697, 1, 0, 0.7137255, 1,
1.277014, 0.6299466, 1.124394, 1, 0, 0.7098039, 1,
1.278123, 1.112856, 1.449554, 1, 0, 0.7019608, 1,
1.279652, -0.123777, 2.867543, 1, 0, 0.6941177, 1,
1.289225, 0.8308609, -0.03850904, 1, 0, 0.6901961, 1,
1.289398, -0.7696317, 0.7869776, 1, 0, 0.682353, 1,
1.291374, 1.897834, 1.05069, 1, 0, 0.6784314, 1,
1.30155, 2.016057, -1.135309, 1, 0, 0.6705883, 1,
1.301799, -2.027205, 3.91706, 1, 0, 0.6666667, 1,
1.307288, 0.145832, 1.442837, 1, 0, 0.6588235, 1,
1.31051, 0.6750792, 1.452662, 1, 0, 0.654902, 1,
1.311594, -0.3830578, 1.789253, 1, 0, 0.6470588, 1,
1.32412, -0.2994435, 2.523756, 1, 0, 0.6431373, 1,
1.329313, -0.3198741, 0.725102, 1, 0, 0.6352941, 1,
1.331313, -1.106289, 1.906825, 1, 0, 0.6313726, 1,
1.331346, 1.269151, 1.528438, 1, 0, 0.6235294, 1,
1.336352, 1.184025, 0.7467858, 1, 0, 0.6196079, 1,
1.337955, 0.6220304, 0.6629159, 1, 0, 0.6117647, 1,
1.339164, 0.2010261, 1.047037, 1, 0, 0.6078432, 1,
1.347553, -0.2580508, 0.716681, 1, 0, 0.6, 1,
1.352137, -0.1675157, 2.317902, 1, 0, 0.5921569, 1,
1.358326, 0.6170476, 1.706202, 1, 0, 0.5882353, 1,
1.3709, -1.742033, 2.53825, 1, 0, 0.5803922, 1,
1.386088, -0.2254307, 3.838197, 1, 0, 0.5764706, 1,
1.394668, 0.1159034, 2.157744, 1, 0, 0.5686275, 1,
1.399146, 0.8368462, 0.2726555, 1, 0, 0.5647059, 1,
1.403203, -0.698427, 2.106277, 1, 0, 0.5568628, 1,
1.405185, -1.114445, 2.737939, 1, 0, 0.5529412, 1,
1.405948, 0.1362728, 1.23587, 1, 0, 0.5450981, 1,
1.422952, -0.1260136, 1.97345, 1, 0, 0.5411765, 1,
1.442475, -0.4932968, 2.668971, 1, 0, 0.5333334, 1,
1.449093, -1.904751, 2.721481, 1, 0, 0.5294118, 1,
1.458623, 0.4976522, 2.417572, 1, 0, 0.5215687, 1,
1.458896, -1.319596, 2.403045, 1, 0, 0.5176471, 1,
1.468029, -1.917829, 0.8855926, 1, 0, 0.509804, 1,
1.474473, 0.6530225, 0.8362225, 1, 0, 0.5058824, 1,
1.480967, 0.4121076, 0.906621, 1, 0, 0.4980392, 1,
1.489346, 1.380123, 0.6399717, 1, 0, 0.4901961, 1,
1.504596, -1.61645, 1.086183, 1, 0, 0.4862745, 1,
1.510608, 1.180512, -0.1044899, 1, 0, 0.4784314, 1,
1.512424, 1.054867, 0.6564291, 1, 0, 0.4745098, 1,
1.521009, 0.4262829, 2.073314, 1, 0, 0.4666667, 1,
1.535438, -1.178501, 1.141891, 1, 0, 0.4627451, 1,
1.5381, 0.6525718, 2.233007, 1, 0, 0.454902, 1,
1.553331, -0.7736574, 2.339466, 1, 0, 0.4509804, 1,
1.560097, -0.5816574, 1.118626, 1, 0, 0.4431373, 1,
1.563941, 1.141253, 2.847947, 1, 0, 0.4392157, 1,
1.571718, 0.4318299, 1.786347, 1, 0, 0.4313726, 1,
1.577059, -0.0774777, 0.6025256, 1, 0, 0.427451, 1,
1.582108, -1.324128, 0.5090376, 1, 0, 0.4196078, 1,
1.582404, -0.07377978, 0.3626219, 1, 0, 0.4156863, 1,
1.583429, 0.2103808, 1.13381, 1, 0, 0.4078431, 1,
1.584903, 0.5353898, 1.618329, 1, 0, 0.4039216, 1,
1.591195, -0.7972714, 1.937108, 1, 0, 0.3960784, 1,
1.597472, 0.8120886, 3.487895, 1, 0, 0.3882353, 1,
1.620891, -1.591901, 2.328902, 1, 0, 0.3843137, 1,
1.628564, -2.200464, 3.639762, 1, 0, 0.3764706, 1,
1.644637, 0.2617891, 1.11502, 1, 0, 0.372549, 1,
1.677011, -0.5565289, 0.1534491, 1, 0, 0.3647059, 1,
1.697709, -0.1175346, 2.786728, 1, 0, 0.3607843, 1,
1.699923, -0.5172966, 1.229167, 1, 0, 0.3529412, 1,
1.710598, -0.4190872, 1.733764, 1, 0, 0.3490196, 1,
1.713899, -0.8783933, 2.746379, 1, 0, 0.3411765, 1,
1.714702, 0.04833862, 2.828378, 1, 0, 0.3372549, 1,
1.717522, 0.01372165, 2.11882, 1, 0, 0.3294118, 1,
1.722619, -1.004749, 1.492814, 1, 0, 0.3254902, 1,
1.72265, 0.326388, 1.601553, 1, 0, 0.3176471, 1,
1.745479, -1.079686, 1.462926, 1, 0, 0.3137255, 1,
1.772552, 1.731063, 0.3366512, 1, 0, 0.3058824, 1,
1.788224, -0.2325281, 1.797674, 1, 0, 0.2980392, 1,
1.825217, -0.5872232, 2.536106, 1, 0, 0.2941177, 1,
1.834735, -0.9811503, 3.531859, 1, 0, 0.2862745, 1,
1.840018, -2.260532, 1.985956, 1, 0, 0.282353, 1,
1.842651, 1.843194, 0.4177661, 1, 0, 0.2745098, 1,
1.844615, 0.579099, -0.1037237, 1, 0, 0.2705882, 1,
1.847801, -1.455288, 3.064947, 1, 0, 0.2627451, 1,
1.854768, -1.076706, 2.379892, 1, 0, 0.2588235, 1,
1.864462, -0.8609444, 3.122585, 1, 0, 0.2509804, 1,
1.865078, 1.71701, 0.6838982, 1, 0, 0.2470588, 1,
1.872027, 1.3069, 0.1692571, 1, 0, 0.2392157, 1,
1.881238, 0.2168297, 1.965706, 1, 0, 0.2352941, 1,
1.881656, 0.76282, -0.09758133, 1, 0, 0.227451, 1,
1.88361, -0.2543684, 2.131397, 1, 0, 0.2235294, 1,
1.88688, -0.1832875, 1.863936, 1, 0, 0.2156863, 1,
1.908709, 1.172845, -0.4076649, 1, 0, 0.2117647, 1,
1.91769, 0.7785712, 0.156302, 1, 0, 0.2039216, 1,
1.943374, -0.1576905, 1.990438, 1, 0, 0.1960784, 1,
1.963465, 0.7578605, 1.677554, 1, 0, 0.1921569, 1,
1.976483, 0.405455, -0.1400954, 1, 0, 0.1843137, 1,
1.988178, 1.309512, -1.3278, 1, 0, 0.1803922, 1,
1.99591, -0.3760341, 2.04046, 1, 0, 0.172549, 1,
2.014631, -0.9586871, 0.2430611, 1, 0, 0.1686275, 1,
2.024675, -0.7872578, 0.4114414, 1, 0, 0.1607843, 1,
2.043572, -2.152815, 1.767411, 1, 0, 0.1568628, 1,
2.078219, -0.5275606, 2.186079, 1, 0, 0.1490196, 1,
2.080308, -0.6625592, 1.165268, 1, 0, 0.145098, 1,
2.134768, 0.1574241, 0.5605855, 1, 0, 0.1372549, 1,
2.149919, 1.326714, 2.030363, 1, 0, 0.1333333, 1,
2.183729, -0.9833901, 2.504032, 1, 0, 0.1254902, 1,
2.192124, -0.9942451, 2.163178, 1, 0, 0.1215686, 1,
2.19449, 0.5051305, 0.05315514, 1, 0, 0.1137255, 1,
2.342765, -2.069749, 2.651141, 1, 0, 0.1098039, 1,
2.356873, 0.1035972, 2.729592, 1, 0, 0.1019608, 1,
2.408886, -0.1204724, 2.893514, 1, 0, 0.09411765, 1,
2.444768, -1.594511, 2.371253, 1, 0, 0.09019608, 1,
2.466067, 1.343942, 2.661516, 1, 0, 0.08235294, 1,
2.515774, -0.4127217, 0.8166053, 1, 0, 0.07843138, 1,
2.541489, 0.6053563, 1.34911, 1, 0, 0.07058824, 1,
2.547761, 0.8448432, 1.294549, 1, 0, 0.06666667, 1,
2.54994, 1.095662, -0.04945982, 1, 0, 0.05882353, 1,
2.571039, 2.152961, 3.014924, 1, 0, 0.05490196, 1,
2.827738, 2.487952, 0.3695322, 1, 0, 0.04705882, 1,
2.838444, 0.01023376, 2.658338, 1, 0, 0.04313726, 1,
2.92305, -0.0702256, 2.252805, 1, 0, 0.03529412, 1,
3.178739, -2.147964, 1.089544, 1, 0, 0.03137255, 1,
3.377922, -1.908111, 0.8650265, 1, 0, 0.02352941, 1,
3.437109, -0.7638485, 1.915033, 1, 0, 0.01960784, 1,
3.508492, 2.48835, 1.340316, 1, 0, 0.01176471, 1,
3.560324, -2.179621, 2.214436, 1, 0, 0.007843138, 1
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
0.03414786, -3.632689, -6.781301, 0, -0.5, 0.5, 0.5,
0.03414786, -3.632689, -6.781301, 1, -0.5, 0.5, 0.5,
0.03414786, -3.632689, -6.781301, 1, 1.5, 0.5, 0.5,
0.03414786, -3.632689, -6.781301, 0, 1.5, 0.5, 0.5
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
-4.687402, 0.2984701, -6.781301, 0, -0.5, 0.5, 0.5,
-4.687402, 0.2984701, -6.781301, 1, -0.5, 0.5, 0.5,
-4.687402, 0.2984701, -6.781301, 1, 1.5, 0.5, 0.5,
-4.687402, 0.2984701, -6.781301, 0, 1.5, 0.5, 0.5
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
-4.687402, -3.632689, 0.1997371, 0, -0.5, 0.5, 0.5,
-4.687402, -3.632689, 0.1997371, 1, -0.5, 0.5, 0.5,
-4.687402, -3.632689, 0.1997371, 1, 1.5, 0.5, 0.5,
-4.687402, -3.632689, 0.1997371, 0, 1.5, 0.5, 0.5
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
-2, -2.725499, -5.170293,
2, -2.725499, -5.170293,
-2, -2.725499, -5.170293,
-2, -2.876697, -5.438794,
0, -2.725499, -5.170293,
0, -2.876697, -5.438794,
2, -2.725499, -5.170293,
2, -2.876697, -5.438794
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
"0",
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
-2, -3.179094, -5.975797, 0, -0.5, 0.5, 0.5,
-2, -3.179094, -5.975797, 1, -0.5, 0.5, 0.5,
-2, -3.179094, -5.975797, 1, 1.5, 0.5, 0.5,
-2, -3.179094, -5.975797, 0, 1.5, 0.5, 0.5,
0, -3.179094, -5.975797, 0, -0.5, 0.5, 0.5,
0, -3.179094, -5.975797, 1, -0.5, 0.5, 0.5,
0, -3.179094, -5.975797, 1, 1.5, 0.5, 0.5,
0, -3.179094, -5.975797, 0, 1.5, 0.5, 0.5,
2, -3.179094, -5.975797, 0, -0.5, 0.5, 0.5,
2, -3.179094, -5.975797, 1, -0.5, 0.5, 0.5,
2, -3.179094, -5.975797, 1, 1.5, 0.5, 0.5,
2, -3.179094, -5.975797, 0, 1.5, 0.5, 0.5
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
-3.597814, -2, -5.170293,
-3.597814, 3, -5.170293,
-3.597814, -2, -5.170293,
-3.779412, -2, -5.438794,
-3.597814, -1, -5.170293,
-3.779412, -1, -5.438794,
-3.597814, 0, -5.170293,
-3.779412, 0, -5.438794,
-3.597814, 1, -5.170293,
-3.779412, 1, -5.438794,
-3.597814, 2, -5.170293,
-3.779412, 2, -5.438794,
-3.597814, 3, -5.170293,
-3.779412, 3, -5.438794
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
-4.142608, -2, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, -2, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, -2, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, -2, -5.975797, 0, 1.5, 0.5, 0.5,
-4.142608, -1, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, -1, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, -1, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, -1, -5.975797, 0, 1.5, 0.5, 0.5,
-4.142608, 0, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, 0, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, 0, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, 0, -5.975797, 0, 1.5, 0.5, 0.5,
-4.142608, 1, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, 1, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, 1, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, 1, -5.975797, 0, 1.5, 0.5, 0.5,
-4.142608, 2, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, 2, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, 2, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, 2, -5.975797, 0, 1.5, 0.5, 0.5,
-4.142608, 3, -5.975797, 0, -0.5, 0.5, 0.5,
-4.142608, 3, -5.975797, 1, -0.5, 0.5, 0.5,
-4.142608, 3, -5.975797, 1, 1.5, 0.5, 0.5,
-4.142608, 3, -5.975797, 0, 1.5, 0.5, 0.5
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
-3.597814, -2.725499, -4,
-3.597814, -2.725499, 4,
-3.597814, -2.725499, -4,
-3.779412, -2.876697, -4,
-3.597814, -2.725499, -2,
-3.779412, -2.876697, -2,
-3.597814, -2.725499, 0,
-3.779412, -2.876697, 0,
-3.597814, -2.725499, 2,
-3.779412, -2.876697, 2,
-3.597814, -2.725499, 4,
-3.779412, -2.876697, 4
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
-4.142608, -3.179094, -4, 0, -0.5, 0.5, 0.5,
-4.142608, -3.179094, -4, 1, -0.5, 0.5, 0.5,
-4.142608, -3.179094, -4, 1, 1.5, 0.5, 0.5,
-4.142608, -3.179094, -4, 0, 1.5, 0.5, 0.5,
-4.142608, -3.179094, -2, 0, -0.5, 0.5, 0.5,
-4.142608, -3.179094, -2, 1, -0.5, 0.5, 0.5,
-4.142608, -3.179094, -2, 1, 1.5, 0.5, 0.5,
-4.142608, -3.179094, -2, 0, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 0, 0, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 0, 1, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 0, 1, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 0, 0, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 2, 0, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 2, 1, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 2, 1, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 2, 0, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 4, 0, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 4, 1, -0.5, 0.5, 0.5,
-4.142608, -3.179094, 4, 1, 1.5, 0.5, 0.5,
-4.142608, -3.179094, 4, 0, 1.5, 0.5, 0.5
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
-3.597814, -2.725499, -5.170293,
-3.597814, 3.322439, -5.170293,
-3.597814, -2.725499, 5.569767,
-3.597814, 3.322439, 5.569767,
-3.597814, -2.725499, -5.170293,
-3.597814, -2.725499, 5.569767,
-3.597814, 3.322439, -5.170293,
-3.597814, 3.322439, 5.569767,
-3.597814, -2.725499, -5.170293,
3.666109, -2.725499, -5.170293,
-3.597814, -2.725499, 5.569767,
3.666109, -2.725499, 5.569767,
-3.597814, 3.322439, -5.170293,
3.666109, 3.322439, -5.170293,
-3.597814, 3.322439, 5.569767,
3.666109, 3.322439, 5.569767,
3.666109, -2.725499, -5.170293,
3.666109, 3.322439, -5.170293,
3.666109, -2.725499, 5.569767,
3.666109, 3.322439, 5.569767,
3.666109, -2.725499, -5.170293,
3.666109, -2.725499, 5.569767,
3.666109, 3.322439, -5.170293,
3.666109, 3.322439, 5.569767
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
var radius = 7.639674;
var distance = 33.98978;
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
mvMatrix.translate( -0.03414786, -0.2984701, -0.1997371 );
mvMatrix.scale( 1.137149, 1.365782, 0.7690987 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.98978);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
3-isopropyl-5-methyl<-read.table("3-isopropyl-5-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-isopropyl-5-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl' not found
```

```r
y<-3-isopropyl-5-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl' not found
```

```r
z<-3-isopropyl-5-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl' not found
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
-3.492028, 1.560442, -2.226038, 0, 0, 1, 1, 1,
-2.870621, -0.1821091, -2.084313, 1, 0, 0, 1, 1,
-2.804969, -1.047996, -0.6735241, 1, 0, 0, 1, 1,
-2.786102, 0.8815216, 0.245596, 1, 0, 0, 1, 1,
-2.709755, -0.3863691, -1.820762, 1, 0, 0, 1, 1,
-2.639226, 0.9857702, -1.157054, 1, 0, 0, 1, 1,
-2.606714, -0.2280217, -0.7422408, 0, 0, 0, 1, 1,
-2.542415, 1.020679, -1.259246, 0, 0, 0, 1, 1,
-2.469902, -2.033599, -0.5054303, 0, 0, 0, 1, 1,
-2.355083, 1.30113, -0.8073665, 0, 0, 0, 1, 1,
-2.313403, -0.936245, -1.7358, 0, 0, 0, 1, 1,
-2.306762, -2.262372, -3.287188, 0, 0, 0, 1, 1,
-2.289893, 0.1649069, -2.753058, 0, 0, 0, 1, 1,
-2.252064, -0.1830594, -0.5977826, 1, 1, 1, 1, 1,
-2.241761, 1.548365, -1.498147, 1, 1, 1, 1, 1,
-2.192377, 0.5697399, -0.5336874, 1, 1, 1, 1, 1,
-2.183576, -0.2761137, -2.985828, 1, 1, 1, 1, 1,
-2.179372, -0.4872514, -1.597332, 1, 1, 1, 1, 1,
-2.125867, 0.7437149, -1.798646, 1, 1, 1, 1, 1,
-2.105395, 0.816512, -0.6897785, 1, 1, 1, 1, 1,
-2.095001, -1.460085, -2.960524, 1, 1, 1, 1, 1,
-2.081636, 0.9790022, -0.5519411, 1, 1, 1, 1, 1,
-2.076867, 2.709133, -0.8099439, 1, 1, 1, 1, 1,
-2.068452, 0.189244, -1.047332, 1, 1, 1, 1, 1,
-2.033107, -0.4882328, -1.298839, 1, 1, 1, 1, 1,
-2.030246, 1.451687, -1.526239, 1, 1, 1, 1, 1,
-2.00799, -0.8187351, -1.96551, 1, 1, 1, 1, 1,
-2.0058, -0.2134245, -2.978979, 1, 1, 1, 1, 1,
-1.989555, 1.02374, -2.064504, 0, 0, 1, 1, 1,
-1.961284, -2.171791, -2.385529, 1, 0, 0, 1, 1,
-1.937322, -0.1845925, -1.043639, 1, 0, 0, 1, 1,
-1.930775, 0.1908201, -0.7806917, 1, 0, 0, 1, 1,
-1.924987, -0.0316184, -1.029499, 1, 0, 0, 1, 1,
-1.886772, 0.2944486, 0.4123402, 1, 0, 0, 1, 1,
-1.884026, 1.177065, -1.10259, 0, 0, 0, 1, 1,
-1.878049, 0.4389634, -2.112892, 0, 0, 0, 1, 1,
-1.867802, 0.7826657, -1.805888, 0, 0, 0, 1, 1,
-1.859855, -0.4579138, -3.290905, 0, 0, 0, 1, 1,
-1.857934, -1.218193, -1.359352, 0, 0, 0, 1, 1,
-1.850214, 0.2457087, 0.2338836, 0, 0, 0, 1, 1,
-1.849966, -0.3622473, -0.8270358, 0, 0, 0, 1, 1,
-1.82212, 0.6250572, -1.162047, 1, 1, 1, 1, 1,
-1.814982, -0.7635215, -1.233141, 1, 1, 1, 1, 1,
-1.765453, 1.746523, -1.717552, 1, 1, 1, 1, 1,
-1.745223, -0.9970529, -1.466079, 1, 1, 1, 1, 1,
-1.743605, 0.7628596, -1.296726, 1, 1, 1, 1, 1,
-1.731744, 0.193034, -1.38474, 1, 1, 1, 1, 1,
-1.707609, 1.357295, -0.142863, 1, 1, 1, 1, 1,
-1.679379, 0.6080005, 0.8406648, 1, 1, 1, 1, 1,
-1.67137, 1.661862, 0.315686, 1, 1, 1, 1, 1,
-1.653044, 0.7554204, -1.172638, 1, 1, 1, 1, 1,
-1.644131, -0.08896162, -1.906452, 1, 1, 1, 1, 1,
-1.603207, -0.649691, -2.003517, 1, 1, 1, 1, 1,
-1.598562, -0.4045972, -0.5708188, 1, 1, 1, 1, 1,
-1.587317, 0.2500548, -1.781167, 1, 1, 1, 1, 1,
-1.574777, -0.7932175, -1.511361, 1, 1, 1, 1, 1,
-1.57058, -0.9337121, -1.871395, 0, 0, 1, 1, 1,
-1.560836, 0.9954875, -0.3342681, 1, 0, 0, 1, 1,
-1.560624, -0.4716379, -2.356931, 1, 0, 0, 1, 1,
-1.558306, -0.07974399, -1.271935, 1, 0, 0, 1, 1,
-1.555561, 0.5245309, -0.8807826, 1, 0, 0, 1, 1,
-1.552091, 0.348883, -1.720214, 1, 0, 0, 1, 1,
-1.539195, -1.351192, -1.768485, 0, 0, 0, 1, 1,
-1.531633, -1.223679, -2.375832, 0, 0, 0, 1, 1,
-1.527516, 1.810673, 0.1573043, 0, 0, 0, 1, 1,
-1.522555, -2.161612, -2.369218, 0, 0, 0, 1, 1,
-1.521844, -1.172484, -0.9245738, 0, 0, 0, 1, 1,
-1.520073, -0.6881071, -3.631144, 0, 0, 0, 1, 1,
-1.517752, 1.171555, -0.7659271, 0, 0, 0, 1, 1,
-1.515223, -1.606248, -1.029222, 1, 1, 1, 1, 1,
-1.50875, -1.434215, -3.936966, 1, 1, 1, 1, 1,
-1.504906, 0.6357909, -0.8247478, 1, 1, 1, 1, 1,
-1.498626, -0.4664262, -0.03488487, 1, 1, 1, 1, 1,
-1.496397, 1.582832, -2.070948, 1, 1, 1, 1, 1,
-1.484203, -1.511731, -3.411751, 1, 1, 1, 1, 1,
-1.469939, 0.6919327, -0.1204673, 1, 1, 1, 1, 1,
-1.456174, -1.155535, -1.117532, 1, 1, 1, 1, 1,
-1.455059, -1.441518, -2.573029, 1, 1, 1, 1, 1,
-1.451527, -0.5925793, -2.340589, 1, 1, 1, 1, 1,
-1.451495, -0.3490133, -2.687726, 1, 1, 1, 1, 1,
-1.424107, -0.6409563, -2.383427, 1, 1, 1, 1, 1,
-1.422132, -0.765766, -4.150206, 1, 1, 1, 1, 1,
-1.413547, -0.2968143, -0.5985591, 1, 1, 1, 1, 1,
-1.407484, 1.65571, -0.5409665, 1, 1, 1, 1, 1,
-1.406136, -0.264593, -1.105778, 0, 0, 1, 1, 1,
-1.398176, -0.7123124, -3.624205, 1, 0, 0, 1, 1,
-1.394338, -0.7506406, -1.189168, 1, 0, 0, 1, 1,
-1.388687, 0.9043256, -0.2702156, 1, 0, 0, 1, 1,
-1.383126, -0.1300148, -1.647362, 1, 0, 0, 1, 1,
-1.379036, -0.6250329, -2.871315, 1, 0, 0, 1, 1,
-1.367635, 0.146354, -1.731991, 0, 0, 0, 1, 1,
-1.367503, 2.145343, -1.028284, 0, 0, 0, 1, 1,
-1.362581, -1.027098, -2.795229, 0, 0, 0, 1, 1,
-1.344843, 0.4244893, -1.99772, 0, 0, 0, 1, 1,
-1.334287, -0.8734109, -3.835313, 0, 0, 0, 1, 1,
-1.327682, -0.7683463, -2.917655, 0, 0, 0, 1, 1,
-1.326784, -1.69452, -3.134597, 0, 0, 0, 1, 1,
-1.323905, 0.06090275, -0.1976785, 1, 1, 1, 1, 1,
-1.322239, -0.502206, -2.253219, 1, 1, 1, 1, 1,
-1.318542, -0.3182395, -3.500872, 1, 1, 1, 1, 1,
-1.317803, -0.6419058, -2.389752, 1, 1, 1, 1, 1,
-1.308065, 0.3889525, -1.154302, 1, 1, 1, 1, 1,
-1.307083, 0.08914159, -1.769811, 1, 1, 1, 1, 1,
-1.281878, 0.02218553, -0.8544441, 1, 1, 1, 1, 1,
-1.277203, -0.8659777, -0.5448224, 1, 1, 1, 1, 1,
-1.274352, 0.2747489, -2.117504, 1, 1, 1, 1, 1,
-1.273357, 0.8859503, -0.5617284, 1, 1, 1, 1, 1,
-1.263991, -0.6811703, -1.883999, 1, 1, 1, 1, 1,
-1.26193, 0.8273458, 1.834167, 1, 1, 1, 1, 1,
-1.252451, 1.401692, -3.373439, 1, 1, 1, 1, 1,
-1.238042, -0.5081162, -2.417479, 1, 1, 1, 1, 1,
-1.231721, -1.019599, -2.520304, 1, 1, 1, 1, 1,
-1.230014, 0.6354454, -1.970489, 0, 0, 1, 1, 1,
-1.22434, -1.124269, -3.473381, 1, 0, 0, 1, 1,
-1.220625, -0.2612159, -1.084312, 1, 0, 0, 1, 1,
-1.208646, 0.4930609, -1.572145, 1, 0, 0, 1, 1,
-1.208093, -1.244358, -1.419184, 1, 0, 0, 1, 1,
-1.204138, 0.2565992, -1.026944, 1, 0, 0, 1, 1,
-1.202023, 2.942734, -1.598033, 0, 0, 0, 1, 1,
-1.188002, 0.3374481, -0.8997768, 0, 0, 0, 1, 1,
-1.179765, 1.387844, -0.2351845, 0, 0, 0, 1, 1,
-1.176352, 1.821058, -0.3644578, 0, 0, 0, 1, 1,
-1.170358, 0.597012, -1.042379, 0, 0, 0, 1, 1,
-1.15388, -0.2337001, -1.597768, 0, 0, 0, 1, 1,
-1.150872, -0.6459354, -2.151871, 0, 0, 0, 1, 1,
-1.142491, -0.67217, -1.894117, 1, 1, 1, 1, 1,
-1.138686, 0.9576558, -2.218542, 1, 1, 1, 1, 1,
-1.134601, -0.3356381, -0.5264592, 1, 1, 1, 1, 1,
-1.131285, -0.6540045, -2.08672, 1, 1, 1, 1, 1,
-1.131127, -0.7771068, -1.690369, 1, 1, 1, 1, 1,
-1.126352, -0.2664909, -3.8042, 1, 1, 1, 1, 1,
-1.108307, -0.3691233, 0.1761314, 1, 1, 1, 1, 1,
-1.107365, 0.3491611, -0.2742563, 1, 1, 1, 1, 1,
-1.099859, -0.4531324, -3.228301, 1, 1, 1, 1, 1,
-1.099436, -1.623953, -2.588515, 1, 1, 1, 1, 1,
-1.09802, -0.6121892, -2.985857, 1, 1, 1, 1, 1,
-1.09391, -0.5227363, -2.981061, 1, 1, 1, 1, 1,
-1.087538, -2.006636, -2.977935, 1, 1, 1, 1, 1,
-1.079988, -1.275145, -2.359174, 1, 1, 1, 1, 1,
-1.078015, 0.4759712, -0.979578, 1, 1, 1, 1, 1,
-1.074289, -0.9661117, -2.29863, 0, 0, 1, 1, 1,
-1.06472, -1.867042, -2.370225, 1, 0, 0, 1, 1,
-1.063696, -0.4901259, -1.602575, 1, 0, 0, 1, 1,
-1.062299, -1.059984, -1.193831, 1, 0, 0, 1, 1,
-1.060093, 1.421079, -0.1353807, 1, 0, 0, 1, 1,
-1.051121, 0.6790332, 0.1034297, 1, 0, 0, 1, 1,
-1.048641, 0.8296052, -1.767318, 0, 0, 0, 1, 1,
-1.046158, 1.312519, -0.8477854, 0, 0, 0, 1, 1,
-1.04607, 0.499209, -0.1978069, 0, 0, 0, 1, 1,
-1.045475, -0.1342904, -1.054793, 0, 0, 0, 1, 1,
-1.036359, 0.0920967, -1.998743, 0, 0, 0, 1, 1,
-1.035846, -0.3534665, -3.585539, 0, 0, 0, 1, 1,
-1.035182, 0.3699013, -1.955296, 0, 0, 0, 1, 1,
-1.023513, -0.2942762, -1.252568, 1, 1, 1, 1, 1,
-1.023464, -0.511825, -0.6415126, 1, 1, 1, 1, 1,
-1.022798, 0.2164802, -3.373076, 1, 1, 1, 1, 1,
-1.022542, -0.3259513, -1.511867, 1, 1, 1, 1, 1,
-1.019717, 0.0265405, -1.82852, 1, 1, 1, 1, 1,
-1.009357, 0.5058882, -2.042307, 1, 1, 1, 1, 1,
-1.00773, -1.423844, -0.2348768, 1, 1, 1, 1, 1,
-1.005229, -0.7591965, -1.627898, 1, 1, 1, 1, 1,
-1.004545, 0.5186002, 0.7252516, 1, 1, 1, 1, 1,
-1.000575, -0.6963485, -0.9857205, 1, 1, 1, 1, 1,
-0.9961583, -0.4468841, -5.013884, 1, 1, 1, 1, 1,
-0.9958234, -0.3099668, -2.796815, 1, 1, 1, 1, 1,
-0.9934148, -1.117994, -2.167525, 1, 1, 1, 1, 1,
-0.9745219, -2.514672, -2.781083, 1, 1, 1, 1, 1,
-0.9692187, -0.8013681, -0.08451574, 1, 1, 1, 1, 1,
-0.963348, -0.6019267, -3.589342, 0, 0, 1, 1, 1,
-0.955637, -0.4899009, -4.055563, 1, 0, 0, 1, 1,
-0.9497684, -0.4518431, -1.929872, 1, 0, 0, 1, 1,
-0.9437122, -1.712865, -2.712873, 1, 0, 0, 1, 1,
-0.9403337, 1.760669, -0.3017896, 1, 0, 0, 1, 1,
-0.937664, -0.04845669, -1.774689, 1, 0, 0, 1, 1,
-0.9349817, -2.061922, -1.96911, 0, 0, 0, 1, 1,
-0.933507, 0.1253543, 0.2257842, 0, 0, 0, 1, 1,
-0.9321917, -0.3966722, -0.79997, 0, 0, 0, 1, 1,
-0.9169176, -0.6225805, -1.151493, 0, 0, 0, 1, 1,
-0.9160746, -0.4630539, -1.632603, 0, 0, 0, 1, 1,
-0.9152693, -1.322473, -3.004991, 0, 0, 0, 1, 1,
-0.9143515, 0.8450071, -1.393813, 0, 0, 0, 1, 1,
-0.9131667, -1.78963, -3.811063, 1, 1, 1, 1, 1,
-0.9098305, -0.6311824, -2.595713, 1, 1, 1, 1, 1,
-0.9085485, -1.854388, -2.744903, 1, 1, 1, 1, 1,
-0.9081329, -0.5630754, -3.11644, 1, 1, 1, 1, 1,
-0.9061917, -0.3012311, -0.7872487, 1, 1, 1, 1, 1,
-0.9049492, 1.054328, -2.380004, 1, 1, 1, 1, 1,
-0.9008924, -1.187979, -1.627901, 1, 1, 1, 1, 1,
-0.8992341, 0.8068556, -1.645927, 1, 1, 1, 1, 1,
-0.8989192, 2.468733, -0.5448803, 1, 1, 1, 1, 1,
-0.8936172, 0.2322344, -1.309979, 1, 1, 1, 1, 1,
-0.8875355, 0.3586415, -0.6364526, 1, 1, 1, 1, 1,
-0.8753469, 0.9158358, -0.1175879, 1, 1, 1, 1, 1,
-0.8739765, 0.03782622, -3.823405, 1, 1, 1, 1, 1,
-0.8731431, -1.056992, -2.19783, 1, 1, 1, 1, 1,
-0.8729665, 2.66481, 0.5621752, 1, 1, 1, 1, 1,
-0.8667063, 0.9539053, -3.800844, 0, 0, 1, 1, 1,
-0.8617355, -1.707741, -2.433851, 1, 0, 0, 1, 1,
-0.8576962, 0.375407, -1.585465, 1, 0, 0, 1, 1,
-0.8559625, 0.005295836, -0.360446, 1, 0, 0, 1, 1,
-0.852208, 0.4712821, -0.3207511, 1, 0, 0, 1, 1,
-0.8475794, 1.761085, -0.3068044, 1, 0, 0, 1, 1,
-0.8470916, 0.7952566, -0.9990636, 0, 0, 0, 1, 1,
-0.843508, -0.7188148, -1.99952, 0, 0, 0, 1, 1,
-0.8410026, 0.368948, -1.125728, 0, 0, 0, 1, 1,
-0.8381101, -0.1554064, -1.99946, 0, 0, 0, 1, 1,
-0.8279678, -1.345421, -3.409403, 0, 0, 0, 1, 1,
-0.8276548, 2.941033, -1.033423, 0, 0, 0, 1, 1,
-0.8217233, -0.3831055, -0.9165483, 0, 0, 0, 1, 1,
-0.8179428, -1.596728, -2.944187, 1, 1, 1, 1, 1,
-0.8100117, -1.420744, -1.00745, 1, 1, 1, 1, 1,
-0.8080194, -0.3638761, -2.708255, 1, 1, 1, 1, 1,
-0.8064071, -0.3015952, -1.598124, 1, 1, 1, 1, 1,
-0.8048469, -0.8305991, -2.260795, 1, 1, 1, 1, 1,
-0.8040435, 0.6693162, -1.530694, 1, 1, 1, 1, 1,
-0.8009625, 1.273575, 0.0990841, 1, 1, 1, 1, 1,
-0.7998261, -0.8608855, -2.114286, 1, 1, 1, 1, 1,
-0.7992073, -0.5849102, -3.742063, 1, 1, 1, 1, 1,
-0.7871639, 0.8266457, -1.835604, 1, 1, 1, 1, 1,
-0.7847966, -0.5299413, -1.408241, 1, 1, 1, 1, 1,
-0.7826269, -0.08327159, -1.770665, 1, 1, 1, 1, 1,
-0.782043, -0.2813714, -1.106161, 1, 1, 1, 1, 1,
-0.7809066, 0.7582508, -0.5154844, 1, 1, 1, 1, 1,
-0.7786196, -2.637422, -3.04672, 1, 1, 1, 1, 1,
-0.7633274, -0.5779845, -1.938899, 0, 0, 1, 1, 1,
-0.7613167, -0.3138037, -3.220588, 1, 0, 0, 1, 1,
-0.7603659, -1.723814, -2.731871, 1, 0, 0, 1, 1,
-0.7601303, -0.571812, -1.41167, 1, 0, 0, 1, 1,
-0.7560772, 0.09178389, -1.560046, 1, 0, 0, 1, 1,
-0.7531142, 0.6648864, -2.342062, 1, 0, 0, 1, 1,
-0.750093, -1.18214, -2.141916, 0, 0, 0, 1, 1,
-0.7473761, -0.6833864, -2.787614, 0, 0, 0, 1, 1,
-0.7434739, 0.8319305, -0.6761994, 0, 0, 0, 1, 1,
-0.7420778, -2.123682, -3.76987, 0, 0, 0, 1, 1,
-0.7416126, -0.478692, -1.155388, 0, 0, 0, 1, 1,
-0.7409931, -0.8504437, -2.932199, 0, 0, 0, 1, 1,
-0.7392375, 0.3525057, -1.53473, 0, 0, 0, 1, 1,
-0.7352498, -0.6014454, -1.307777, 1, 1, 1, 1, 1,
-0.7276484, 0.7909627, -0.8161384, 1, 1, 1, 1, 1,
-0.726997, 0.0155562, -1.113354, 1, 1, 1, 1, 1,
-0.7268093, 0.9291162, 0.0957551, 1, 1, 1, 1, 1,
-0.725585, 0.5328961, -0.6444951, 1, 1, 1, 1, 1,
-0.7250134, -0.8930297, -0.6842502, 1, 1, 1, 1, 1,
-0.717826, 0.5370967, -0.081731, 1, 1, 1, 1, 1,
-0.7150219, -2.525052, -2.341963, 1, 1, 1, 1, 1,
-0.7148641, -1.463704, -3.85284, 1, 1, 1, 1, 1,
-0.713275, -1.970771, -2.507668, 1, 1, 1, 1, 1,
-0.7131424, 0.3962608, -2.228987, 1, 1, 1, 1, 1,
-0.7090704, 0.9515383, -0.6092048, 1, 1, 1, 1, 1,
-0.709052, 1.452876, -0.3013693, 1, 1, 1, 1, 1,
-0.7089923, 0.1135151, -0.4563819, 1, 1, 1, 1, 1,
-0.7087371, -1.952745, -2.464825, 1, 1, 1, 1, 1,
-0.7083491, 0.02471628, -1.301095, 0, 0, 1, 1, 1,
-0.7068439, -0.7762729, -4.093482, 1, 0, 0, 1, 1,
-0.703948, 0.435582, -1.023203, 1, 0, 0, 1, 1,
-0.7002682, -0.6106964, -1.710304, 1, 0, 0, 1, 1,
-0.6981403, -0.3304076, -2.473684, 1, 0, 0, 1, 1,
-0.6924619, -0.6918398, -2.547545, 1, 0, 0, 1, 1,
-0.6854158, -0.9235136, -3.656332, 0, 0, 0, 1, 1,
-0.6778222, -0.5122353, -3.21244, 0, 0, 0, 1, 1,
-0.6758356, 1.535117, -0.8179761, 0, 0, 0, 1, 1,
-0.6725532, -0.0691537, -2.880231, 0, 0, 0, 1, 1,
-0.6720617, 0.7630903, -0.02138835, 0, 0, 0, 1, 1,
-0.6719664, -0.2757233, -1.781497, 0, 0, 0, 1, 1,
-0.6697869, 0.2682429, -0.5401261, 0, 0, 0, 1, 1,
-0.6691871, 0.6687033, -0.300144, 1, 1, 1, 1, 1,
-0.6649026, 0.3331459, -3.173827, 1, 1, 1, 1, 1,
-0.6648223, 0.5182143, -0.2564742, 1, 1, 1, 1, 1,
-0.6643621, -0.1533672, -2.449563, 1, 1, 1, 1, 1,
-0.6640521, 0.4593813, -1.545354, 1, 1, 1, 1, 1,
-0.6629801, 0.8053808, 0.5257961, 1, 1, 1, 1, 1,
-0.6610239, 0.5252294, -0.1238042, 1, 1, 1, 1, 1,
-0.6543972, 1.471956, -0.1145151, 1, 1, 1, 1, 1,
-0.6522243, 0.2444002, 0.602504, 1, 1, 1, 1, 1,
-0.652214, -0.4749103, -1.53621, 1, 1, 1, 1, 1,
-0.6453516, 1.601914, 1.33413, 1, 1, 1, 1, 1,
-0.6408022, -0.805721, -2.886802, 1, 1, 1, 1, 1,
-0.640058, -0.07864247, -2.525025, 1, 1, 1, 1, 1,
-0.635588, -0.692987, -3.289858, 1, 1, 1, 1, 1,
-0.6346297, 0.2832946, -1.337571, 1, 1, 1, 1, 1,
-0.6306247, 2.180404, -1.233639, 0, 0, 1, 1, 1,
-0.628858, 1.165049, 0.2750103, 1, 0, 0, 1, 1,
-0.6283307, -0.7121071, -2.026358, 1, 0, 0, 1, 1,
-0.6276036, -0.6066675, -0.956156, 1, 0, 0, 1, 1,
-0.6257572, -1.041634, -3.232973, 1, 0, 0, 1, 1,
-0.6181373, 0.7258224, -0.4749683, 1, 0, 0, 1, 1,
-0.6128025, 2.141485, -0.8932354, 0, 0, 0, 1, 1,
-0.6089189, -0.539571, -3.868012, 0, 0, 0, 1, 1,
-0.6086078, 0.1295485, -1.878942, 0, 0, 0, 1, 1,
-0.6074045, -0.7825357, -1.227854, 0, 0, 0, 1, 1,
-0.6062933, -0.4606676, -1.865161, 0, 0, 0, 1, 1,
-0.6020193, -1.063173, -2.881434, 0, 0, 0, 1, 1,
-0.5967075, 0.8481752, -0.08391959, 0, 0, 0, 1, 1,
-0.5956684, -0.006426517, -1.833353, 1, 1, 1, 1, 1,
-0.5898258, -0.4629257, -3.546735, 1, 1, 1, 1, 1,
-0.5825715, -0.920415, -1.760712, 1, 1, 1, 1, 1,
-0.5802015, 1.156888, 0.997438, 1, 1, 1, 1, 1,
-0.5756377, 0.6332155, -0.921857, 1, 1, 1, 1, 1,
-0.5743935, -1.222504, -2.87664, 1, 1, 1, 1, 1,
-0.5713257, -0.06407879, -3.274857, 1, 1, 1, 1, 1,
-0.5675857, -0.3048198, 1.38694, 1, 1, 1, 1, 1,
-0.5653948, -0.3952627, -3.228855, 1, 1, 1, 1, 1,
-0.562863, -0.8571454, -2.910449, 1, 1, 1, 1, 1,
-0.5610084, -0.4288753, -2.702608, 1, 1, 1, 1, 1,
-0.5574529, 0.4642847, -0.9485083, 1, 1, 1, 1, 1,
-0.5556532, -0.6576959, -3.273674, 1, 1, 1, 1, 1,
-0.5531088, 0.1273813, -2.627612, 1, 1, 1, 1, 1,
-0.5495718, 1.11138, -0.4937542, 1, 1, 1, 1, 1,
-0.5458655, -1.859842, -1.559036, 0, 0, 1, 1, 1,
-0.545827, -0.3266692, -3.236327, 1, 0, 0, 1, 1,
-0.5421023, -1.471292, -2.784105, 1, 0, 0, 1, 1,
-0.5394712, 1.128633, -0.09631316, 1, 0, 0, 1, 1,
-0.532756, -0.8020776, -2.115286, 1, 0, 0, 1, 1,
-0.5280054, 0.7840819, 1.001245, 1, 0, 0, 1, 1,
-0.5227266, -0.6862699, -1.341713, 0, 0, 0, 1, 1,
-0.5216596, 2.114754, -0.3439481, 0, 0, 0, 1, 1,
-0.5207954, -0.6074975, -1.785176, 0, 0, 0, 1, 1,
-0.5162049, -0.1690109, -1.914751, 0, 0, 0, 1, 1,
-0.5150651, -0.4898082, -1.234853, 0, 0, 0, 1, 1,
-0.512913, -1.420225, -2.672609, 0, 0, 0, 1, 1,
-0.5092483, 0.6528113, -1.251778, 0, 0, 0, 1, 1,
-0.5056952, -0.4486193, -1.986043, 1, 1, 1, 1, 1,
-0.4885652, 0.909041, -2.497118, 1, 1, 1, 1, 1,
-0.4850074, -0.3518414, -0.4719232, 1, 1, 1, 1, 1,
-0.481407, 0.02925271, -0.9124403, 1, 1, 1, 1, 1,
-0.4784015, 1.736033, -0.1597718, 1, 1, 1, 1, 1,
-0.4763589, -0.347894, -3.931827, 1, 1, 1, 1, 1,
-0.4686956, 1.217396, -0.5187711, 1, 1, 1, 1, 1,
-0.4673167, -0.2406963, -3.153807, 1, 1, 1, 1, 1,
-0.4666134, -0.4282459, -3.189667, 1, 1, 1, 1, 1,
-0.4656594, 0.4214255, -2.125828, 1, 1, 1, 1, 1,
-0.4654934, 0.4032536, -2.423094, 1, 1, 1, 1, 1,
-0.457798, 0.08636941, -0.8746779, 1, 1, 1, 1, 1,
-0.4539399, -1.662707, -3.244502, 1, 1, 1, 1, 1,
-0.4535613, -0.2817447, -0.3706508, 1, 1, 1, 1, 1,
-0.4447417, 1.110316, -1.178698, 1, 1, 1, 1, 1,
-0.4411917, 1.557924, 1.230593, 0, 0, 1, 1, 1,
-0.4384718, -0.4474998, -1.373965, 1, 0, 0, 1, 1,
-0.4351209, 0.6394937, -1.5659, 1, 0, 0, 1, 1,
-0.4328502, 0.4310932, -1.450965, 1, 0, 0, 1, 1,
-0.4304062, 0.2265725, -1.552362, 1, 0, 0, 1, 1,
-0.4256847, 0.4821086, -1.169602, 1, 0, 0, 1, 1,
-0.4238976, -1.070427, -2.077658, 0, 0, 0, 1, 1,
-0.4216081, 0.3793715, -0.6793593, 0, 0, 0, 1, 1,
-0.4133259, 1.310465, -1.035493, 0, 0, 0, 1, 1,
-0.4110257, 0.6407726, -0.6433128, 0, 0, 0, 1, 1,
-0.4095526, 0.1974096, -1.33135, 0, 0, 0, 1, 1,
-0.4071863, 1.722955, -0.8107269, 0, 0, 0, 1, 1,
-0.4051515, 0.889944, -1.825386, 0, 0, 0, 1, 1,
-0.4013746, -0.3082014, -1.695847, 1, 1, 1, 1, 1,
-0.4012846, 1.052196, 1.661099, 1, 1, 1, 1, 1,
-0.4002047, 0.244473, 0.7010419, 1, 1, 1, 1, 1,
-0.3989512, -0.8838575, -0.7006899, 1, 1, 1, 1, 1,
-0.394897, 0.5894454, 0.3045884, 1, 1, 1, 1, 1,
-0.3942092, -0.7911605, -3.685126, 1, 1, 1, 1, 1,
-0.3920914, -1.561715, -2.500356, 1, 1, 1, 1, 1,
-0.3898233, 1.631304, -0.2747929, 1, 1, 1, 1, 1,
-0.3892106, 1.751253, 0.07819472, 1, 1, 1, 1, 1,
-0.3857099, -0.9344169, -1.874665, 1, 1, 1, 1, 1,
-0.3836108, -0.7577452, -1.270439, 1, 1, 1, 1, 1,
-0.3804418, -1.056345, -2.593641, 1, 1, 1, 1, 1,
-0.3771271, 0.06062409, -0.5815358, 1, 1, 1, 1, 1,
-0.3765848, 0.3742725, 0.7742991, 1, 1, 1, 1, 1,
-0.3706749, -0.3797299, -1.136977, 1, 1, 1, 1, 1,
-0.3624334, -1.086226, -2.580838, 0, 0, 1, 1, 1,
-0.3607918, -0.6915883, -2.923005, 1, 0, 0, 1, 1,
-0.3603512, 2.299789, -0.1538435, 1, 0, 0, 1, 1,
-0.3591725, 1.996467, 1.134484, 1, 0, 0, 1, 1,
-0.3588458, 0.8665634, -1.496194, 1, 0, 0, 1, 1,
-0.3538831, 0.5037973, -0.804719, 1, 0, 0, 1, 1,
-0.3505209, -0.1157144, -0.7581661, 0, 0, 0, 1, 1,
-0.3504601, 0.2065898, -1.77025, 0, 0, 0, 1, 1,
-0.3429292, 1.837944, -1.122226, 0, 0, 0, 1, 1,
-0.3422019, 1.774537, -1.570784, 0, 0, 0, 1, 1,
-0.3394354, 0.07233503, -2.03243, 0, 0, 0, 1, 1,
-0.3374122, -0.2579804, -0.8574321, 0, 0, 0, 1, 1,
-0.3367838, 0.5754133, -0.7163553, 0, 0, 0, 1, 1,
-0.3360195, 0.9063884, 0.6640163, 1, 1, 1, 1, 1,
-0.3358157, -0.1643814, -3.593106, 1, 1, 1, 1, 1,
-0.328225, 0.5784457, -0.8956354, 1, 1, 1, 1, 1,
-0.3253745, -1.182639, -1.33321, 1, 1, 1, 1, 1,
-0.3098186, 1.054303, -1.223223, 1, 1, 1, 1, 1,
-0.305506, -1.828012, -3.414508, 1, 1, 1, 1, 1,
-0.3046878, -0.7737118, -3.794598, 1, 1, 1, 1, 1,
-0.3025182, -0.2103782, -2.080547, 1, 1, 1, 1, 1,
-0.2997423, 0.05266989, -1.740027, 1, 1, 1, 1, 1,
-0.2946428, 1.922242, -1.065094, 1, 1, 1, 1, 1,
-0.2926672, 0.7320634, -0.9093596, 1, 1, 1, 1, 1,
-0.292642, -0.1902403, -3.532498, 1, 1, 1, 1, 1,
-0.2926068, -0.05154379, -2.311994, 1, 1, 1, 1, 1,
-0.2911867, 0.6226895, 0.1271143, 1, 1, 1, 1, 1,
-0.2895491, 0.7704323, -0.1915633, 1, 1, 1, 1, 1,
-0.2870468, -0.23404, -3.742131, 0, 0, 1, 1, 1,
-0.2858096, -0.5763856, -4.979923, 1, 0, 0, 1, 1,
-0.2825036, 0.9956834, 0.6520172, 1, 0, 0, 1, 1,
-0.2806692, -0.7452127, -4.260552, 1, 0, 0, 1, 1,
-0.2804081, -0.760556, -1.745055, 1, 0, 0, 1, 1,
-0.2795655, -0.5435399, -1.852413, 1, 0, 0, 1, 1,
-0.2719217, -0.8424524, -2.289423, 0, 0, 0, 1, 1,
-0.2717188, 1.492432, -0.884726, 0, 0, 0, 1, 1,
-0.2694563, -1.082289, -2.234111, 0, 0, 0, 1, 1,
-0.2652367, 1.357252, -1.330908, 0, 0, 0, 1, 1,
-0.2600348, -1.887065, -2.646983, 0, 0, 0, 1, 1,
-0.2598945, 0.120248, -0.5493796, 0, 0, 0, 1, 1,
-0.2585526, -0.1534335, -2.256735, 0, 0, 0, 1, 1,
-0.2571277, 0.6833943, -0.546735, 1, 1, 1, 1, 1,
-0.2571244, -0.349459, 0.2388152, 1, 1, 1, 1, 1,
-0.2545449, -0.8957413, -2.841136, 1, 1, 1, 1, 1,
-0.2515178, 0.2176388, -0.8494655, 1, 1, 1, 1, 1,
-0.2513267, -0.1321427, 0.5762434, 1, 1, 1, 1, 1,
-0.2512012, 0.2159708, -2.270363, 1, 1, 1, 1, 1,
-0.2433797, -0.4164657, -2.442522, 1, 1, 1, 1, 1,
-0.2392805, -0.3512282, -2.003749, 1, 1, 1, 1, 1,
-0.2384216, -2.204158, -4.458696, 1, 1, 1, 1, 1,
-0.2324089, -0.6083214, -1.329136, 1, 1, 1, 1, 1,
-0.2303324, 1.55218, 0.5739384, 1, 1, 1, 1, 1,
-0.2296845, -1.155952, -3.549665, 1, 1, 1, 1, 1,
-0.2295575, 0.5364577, 1.297303, 1, 1, 1, 1, 1,
-0.2265805, -0.1415719, -3.040074, 1, 1, 1, 1, 1,
-0.2249032, 0.8214417, 0.3164, 1, 1, 1, 1, 1,
-0.2238699, -1.969282, -3.199163, 0, 0, 1, 1, 1,
-0.2201942, 0.5721198, -1.118173, 1, 0, 0, 1, 1,
-0.2191393, 0.545891, -1.083619, 1, 0, 0, 1, 1,
-0.2174665, -0.2459136, -0.9590194, 1, 0, 0, 1, 1,
-0.2172432, -1.636905, -4.228345, 1, 0, 0, 1, 1,
-0.2098909, 0.6248114, -0.0970135, 1, 0, 0, 1, 1,
-0.2062379, -0.503579, -1.411655, 0, 0, 0, 1, 1,
-0.2021441, -0.05754149, -0.5276119, 0, 0, 0, 1, 1,
-0.1992205, 1.095714, -1.761525, 0, 0, 0, 1, 1,
-0.1990123, 2.708207, 1.374161, 0, 0, 0, 1, 1,
-0.1945917, -0.8613503, -2.884131, 0, 0, 0, 1, 1,
-0.1921821, 0.6953294, -1.431235, 0, 0, 0, 1, 1,
-0.1861563, -2.275068, -1.102979, 0, 0, 0, 1, 1,
-0.1854898, -1.017598, -3.1628, 1, 1, 1, 1, 1,
-0.1818013, 0.9091693, -0.05733398, 1, 1, 1, 1, 1,
-0.1800058, -0.9281364, -3.27093, 1, 1, 1, 1, 1,
-0.1789003, 0.6563933, -1.385129, 1, 1, 1, 1, 1,
-0.1774465, 0.8651438, 0.8109867, 1, 1, 1, 1, 1,
-0.1764507, 0.6978728, 0.673599, 1, 1, 1, 1, 1,
-0.1687229, 0.4109795, -1.528442, 1, 1, 1, 1, 1,
-0.1684312, 0.04133534, -0.6095712, 1, 1, 1, 1, 1,
-0.1670801, 0.8101763, 0.7102677, 1, 1, 1, 1, 1,
-0.162545, 0.04516597, -2.581697, 1, 1, 1, 1, 1,
-0.162334, -2.094257, -4.571773, 1, 1, 1, 1, 1,
-0.1495944, 0.05351146, -0.990625, 1, 1, 1, 1, 1,
-0.1480068, 0.6592011, 0.05010163, 1, 1, 1, 1, 1,
-0.1467612, -0.1232191, -2.188005, 1, 1, 1, 1, 1,
-0.141898, -1.597302, -3.650054, 1, 1, 1, 1, 1,
-0.1359747, 0.5326014, -0.4281135, 0, 0, 1, 1, 1,
-0.134363, -1.06196, -3.711131, 1, 0, 0, 1, 1,
-0.128747, -1.186986, -4.613036, 1, 0, 0, 1, 1,
-0.1282056, 1.082171, -0.6303378, 1, 0, 0, 1, 1,
-0.1163605, -1.613675, -3.174067, 1, 0, 0, 1, 1,
-0.11449, -1.001432, -3.860797, 1, 0, 0, 1, 1,
-0.1133587, -0.3267584, -3.330594, 0, 0, 0, 1, 1,
-0.1111434, 1.08796, -0.3386335, 0, 0, 0, 1, 1,
-0.1104179, -0.3234753, -3.811872, 0, 0, 0, 1, 1,
-0.1086198, -1.474406, -4.739491, 0, 0, 0, 1, 1,
-0.1039791, 1.285564, 0.3223009, 0, 0, 0, 1, 1,
-0.1012162, -0.5624573, -2.300504, 0, 0, 0, 1, 1,
-0.1004482, -2.292675, -3.741464, 0, 0, 0, 1, 1,
-0.09997093, 1.95968, -1.053933, 1, 1, 1, 1, 1,
-0.09981973, -1.646691, -4.218331, 1, 1, 1, 1, 1,
-0.09897935, 0.3394128, -2.249329, 1, 1, 1, 1, 1,
-0.09823237, -0.553238, -2.132033, 1, 1, 1, 1, 1,
-0.09714847, 0.4276075, -1.489933, 1, 1, 1, 1, 1,
-0.0970728, -0.1854864, -3.176872, 1, 1, 1, 1, 1,
-0.08901379, -1.269847, -2.785601, 1, 1, 1, 1, 1,
-0.08829772, 0.1360681, -0.9789158, 1, 1, 1, 1, 1,
-0.08664294, -0.711209, -1.922256, 1, 1, 1, 1, 1,
-0.0841846, 0.8300601, -1.050343, 1, 1, 1, 1, 1,
-0.08413114, -0.3097048, -2.545873, 1, 1, 1, 1, 1,
-0.07777282, 0.32133, 0.2338531, 1, 1, 1, 1, 1,
-0.0751171, 1.072474, -0.1467602, 1, 1, 1, 1, 1,
-0.07435661, 0.7984406, -0.3064194, 1, 1, 1, 1, 1,
-0.07400104, -0.689077, -3.137653, 1, 1, 1, 1, 1,
-0.07300864, -0.1538571, -2.780915, 0, 0, 1, 1, 1,
-0.0728076, -0.4579104, -3.235392, 1, 0, 0, 1, 1,
-0.06593999, 0.7569165, -0.7539613, 1, 0, 0, 1, 1,
-0.06161127, -0.8005502, -2.331786, 1, 0, 0, 1, 1,
-0.0613093, 0.7428458, -0.2540549, 1, 0, 0, 1, 1,
-0.05764302, -0.9481972, -2.277037, 1, 0, 0, 1, 1,
-0.05675254, -1.091853, -1.901874, 0, 0, 0, 1, 1,
-0.05670963, 1.693918, 1.892818, 0, 0, 0, 1, 1,
-0.05154713, 1.280368, -0.7409585, 0, 0, 0, 1, 1,
-0.04925717, -0.2939531, -2.733072, 0, 0, 0, 1, 1,
-0.04274695, -1.808148, -3.368786, 0, 0, 0, 1, 1,
-0.04198573, -0.4887753, -1.927936, 0, 0, 0, 1, 1,
-0.03473035, -0.551157, -4.953727, 0, 0, 0, 1, 1,
-0.03342714, -0.3379876, -2.930245, 1, 1, 1, 1, 1,
-0.03304936, -1.96375, -4.206978, 1, 1, 1, 1, 1,
-0.03282755, -0.8329341, -3.64842, 1, 1, 1, 1, 1,
-0.02494625, -2.519888, -4.968579, 1, 1, 1, 1, 1,
-0.02187414, 0.7151845, -2.131426, 1, 1, 1, 1, 1,
-0.01914036, 0.4493075, 2.268636, 1, 1, 1, 1, 1,
-0.01740476, -1.307431, -1.979537, 1, 1, 1, 1, 1,
-0.01453819, 1.388497, 0.9764679, 1, 1, 1, 1, 1,
-0.01250947, 0.3853812, 1.376155, 1, 1, 1, 1, 1,
-0.01063245, -0.4792732, -1.871156, 1, 1, 1, 1, 1,
-0.01010417, 0.9716741, 0.6793805, 1, 1, 1, 1, 1,
-0.007201064, -0.6680722, -3.131354, 1, 1, 1, 1, 1,
-0.001011487, 1.129919, 0.5750204, 1, 1, 1, 1, 1,
0.00193846, -0.6751547, 3.044091, 1, 1, 1, 1, 1,
0.006261061, 0.6747488, 0.2205116, 1, 1, 1, 1, 1,
0.009622966, 0.3087229, 0.6022211, 0, 0, 1, 1, 1,
0.0127414, 1.285737, -0.3622304, 1, 0, 0, 1, 1,
0.01354387, 0.5507165, -1.877034, 1, 0, 0, 1, 1,
0.01407415, -0.2604271, 1.589592, 1, 0, 0, 1, 1,
0.01481065, -0.5172526, 3.583702, 1, 0, 0, 1, 1,
0.01632159, 0.2909606, 0.7064611, 1, 0, 0, 1, 1,
0.02111001, 0.4864512, 0.09613609, 0, 0, 0, 1, 1,
0.02176406, 1.094207, -0.08554534, 0, 0, 0, 1, 1,
0.02469128, 1.786415, -0.03967068, 0, 0, 0, 1, 1,
0.02533751, -1.656175, 3.224473, 0, 0, 0, 1, 1,
0.02894742, 0.839447, 0.03323692, 0, 0, 0, 1, 1,
0.03091853, 0.6194587, 0.3062155, 0, 0, 0, 1, 1,
0.03141376, -0.009903852, 2.245064, 0, 0, 0, 1, 1,
0.03520591, -1.054745, 3.651849, 1, 1, 1, 1, 1,
0.03830715, 0.8493347, -0.3728691, 1, 1, 1, 1, 1,
0.04047282, -1.53074, 3.501932, 1, 1, 1, 1, 1,
0.04159466, 1.244175, 1.455506, 1, 1, 1, 1, 1,
0.04326044, -1.078774, 4.21057, 1, 1, 1, 1, 1,
0.04345946, -0.4032967, 2.485092, 1, 1, 1, 1, 1,
0.04380798, 2.110234, -1.285477, 1, 1, 1, 1, 1,
0.04682895, -0.4338597, 4.953245, 1, 1, 1, 1, 1,
0.04846606, 0.4875956, -0.4867339, 1, 1, 1, 1, 1,
0.0505996, 0.603502, 0.2674123, 1, 1, 1, 1, 1,
0.05112535, -1.097355, 3.944438, 1, 1, 1, 1, 1,
0.05510879, -0.2557291, 3.643898, 1, 1, 1, 1, 1,
0.05523949, -0.95539, 3.873134, 1, 1, 1, 1, 1,
0.0574035, 0.5314816, -0.01435968, 1, 1, 1, 1, 1,
0.06040357, -0.3921678, 3.67726, 1, 1, 1, 1, 1,
0.06079754, 1.493782, 0.2382774, 0, 0, 1, 1, 1,
0.06087335, 0.6546522, 0.2804074, 1, 0, 0, 1, 1,
0.0632551, -0.754445, 2.136817, 1, 0, 0, 1, 1,
0.06329951, 0.2291567, 0.943054, 1, 0, 0, 1, 1,
0.06438748, 0.1338788, 1.505205, 1, 0, 0, 1, 1,
0.06568731, -0.1090717, 1.489739, 1, 0, 0, 1, 1,
0.06792095, 0.2667175, 0.4564032, 0, 0, 0, 1, 1,
0.07010572, -0.6724458, 4.166722, 0, 0, 0, 1, 1,
0.0751643, 0.1894938, 2.08283, 0, 0, 0, 1, 1,
0.08005089, -1.796866, 1.130283, 0, 0, 0, 1, 1,
0.08846705, 0.9509903, 1.624381, 0, 0, 0, 1, 1,
0.09232289, 1.152481, 1.878753, 0, 0, 0, 1, 1,
0.09360377, -0.5946208, 3.659173, 0, 0, 0, 1, 1,
0.09833416, 0.9734152, 1.622828, 1, 1, 1, 1, 1,
0.09926948, -0.579461, 2.28134, 1, 1, 1, 1, 1,
0.1013832, 0.2904723, 1.14665, 1, 1, 1, 1, 1,
0.1017833, 1.142246, 0.7496328, 1, 1, 1, 1, 1,
0.1033199, -1.907658, 2.892684, 1, 1, 1, 1, 1,
0.1091623, 1.061102, -0.8963508, 1, 1, 1, 1, 1,
0.1119659, 0.5556066, -0.8133415, 1, 1, 1, 1, 1,
0.1129486, 0.2644091, -0.7950857, 1, 1, 1, 1, 1,
0.1134958, -0.144211, 2.823507, 1, 1, 1, 1, 1,
0.119578, -0.3735316, 5.413358, 1, 1, 1, 1, 1,
0.1196569, 0.2993027, 0.007713672, 1, 1, 1, 1, 1,
0.1196883, -2.604715, 2.150012, 1, 1, 1, 1, 1,
0.1260286, -0.9888523, 2.72887, 1, 1, 1, 1, 1,
0.1341639, 1.643324, -1.468686, 1, 1, 1, 1, 1,
0.1342923, 0.8283739, -0.9746101, 1, 1, 1, 1, 1,
0.1394411, 0.1125722, 0.4389812, 0, 0, 1, 1, 1,
0.1408359, -0.425955, 2.887645, 1, 0, 0, 1, 1,
0.1499221, -0.5543312, 2.758962, 1, 0, 0, 1, 1,
0.1538072, 0.1804476, 1.953953, 1, 0, 0, 1, 1,
0.1583017, 0.1285018, -0.5873209, 1, 0, 0, 1, 1,
0.158414, -0.05597154, 1.846676, 1, 0, 0, 1, 1,
0.1591042, -1.60193, 1.681803, 0, 0, 0, 1, 1,
0.1637058, 0.008596881, 1.401253, 0, 0, 0, 1, 1,
0.1696119, -1.642795, 2.164539, 0, 0, 0, 1, 1,
0.1719049, 1.12245, 0.05251822, 0, 0, 0, 1, 1,
0.1829582, 1.786734, 0.1931976, 0, 0, 0, 1, 1,
0.1852011, -0.4936719, 1.859293, 0, 0, 0, 1, 1,
0.1885018, -0.4245402, 2.789979, 0, 0, 0, 1, 1,
0.1941183, 2.386067, 0.483088, 1, 1, 1, 1, 1,
0.1947381, 0.7442082, 1.372535, 1, 1, 1, 1, 1,
0.1964079, 0.07170454, 0.7812423, 1, 1, 1, 1, 1,
0.1967573, 0.527788, -0.2496561, 1, 1, 1, 1, 1,
0.1999502, -0.1480588, 3.052047, 1, 1, 1, 1, 1,
0.2016033, 0.6011098, 1.485818, 1, 1, 1, 1, 1,
0.202596, 0.9996856, -0.8017391, 1, 1, 1, 1, 1,
0.2045908, 0.1762573, 1.886262, 1, 1, 1, 1, 1,
0.2064783, 1.519533, 0.3488657, 1, 1, 1, 1, 1,
0.2065019, 0.6559783, -0.5877337, 1, 1, 1, 1, 1,
0.2150838, 0.6369116, -1.372639, 1, 1, 1, 1, 1,
0.217772, -1.225757, 0.8901435, 1, 1, 1, 1, 1,
0.2178852, 0.4040992, 1.40633, 1, 1, 1, 1, 1,
0.2201584, -0.5522098, 2.283319, 1, 1, 1, 1, 1,
0.226044, 1.341796, 0.6831916, 1, 1, 1, 1, 1,
0.2272697, 0.8653797, 0.0226267, 0, 0, 1, 1, 1,
0.2286111, -0.1371915, 2.924013, 1, 0, 0, 1, 1,
0.2341144, 0.2489772, 0.5896633, 1, 0, 0, 1, 1,
0.2358783, 0.01153862, 1.818901, 1, 0, 0, 1, 1,
0.2461763, -0.6645218, 2.704343, 1, 0, 0, 1, 1,
0.2496005, -0.09337031, 2.351292, 1, 0, 0, 1, 1,
0.2497941, -0.1291602, 2.176261, 0, 0, 0, 1, 1,
0.2526888, 1.130937, 0.8020098, 0, 0, 0, 1, 1,
0.252935, 1.873099, -1.358555, 0, 0, 0, 1, 1,
0.2533075, 1.075263, -0.4398642, 0, 0, 0, 1, 1,
0.2534139, -0.3159671, 3.001543, 0, 0, 0, 1, 1,
0.2547419, -0.2637984, 2.059136, 0, 0, 0, 1, 1,
0.2586902, 0.4636319, -0.5774149, 0, 0, 0, 1, 1,
0.2637107, -1.304687, 4.298342, 1, 1, 1, 1, 1,
0.2641402, -0.8011611, 1.771114, 1, 1, 1, 1, 1,
0.2687956, 0.0772414, -0.04960851, 1, 1, 1, 1, 1,
0.2738981, -0.3028857, 3.120273, 1, 1, 1, 1, 1,
0.2755744, 0.2752458, 0.03048341, 1, 1, 1, 1, 1,
0.2816803, 0.2613654, 2.75381, 1, 1, 1, 1, 1,
0.2818257, 0.9201976, 1.424676, 1, 1, 1, 1, 1,
0.2823946, -0.8531539, 2.079276, 1, 1, 1, 1, 1,
0.2865407, 0.3428105, 1.832326, 1, 1, 1, 1, 1,
0.2872609, 0.4978339, 2.099678, 1, 1, 1, 1, 1,
0.290756, 0.2427138, 1.273006, 1, 1, 1, 1, 1,
0.2917711, -0.8437154, 1.478597, 1, 1, 1, 1, 1,
0.2930667, 1.308787, 0.865342, 1, 1, 1, 1, 1,
0.2940396, -0.3419715, 0.8687276, 1, 1, 1, 1, 1,
0.2964821, 0.5175542, -0.3987418, 1, 1, 1, 1, 1,
0.2973896, -0.2970675, 2.554057, 0, 0, 1, 1, 1,
0.3020133, 0.06760175, 1.578226, 1, 0, 0, 1, 1,
0.3027593, -0.6955814, 3.120876, 1, 0, 0, 1, 1,
0.3032018, 0.03198775, 0.04562141, 1, 0, 0, 1, 1,
0.3057513, 0.1921825, 0.1609902, 1, 0, 0, 1, 1,
0.3146656, 0.955169, -0.5214562, 1, 0, 0, 1, 1,
0.3171972, 1.408884, -1.518247, 0, 0, 0, 1, 1,
0.3212053, 0.3766585, 2.240896, 0, 0, 0, 1, 1,
0.3217857, 0.293435, 2.198737, 0, 0, 0, 1, 1,
0.324461, 1.639812, 1.08039, 0, 0, 0, 1, 1,
0.3244652, -0.2756886, 3.180087, 0, 0, 0, 1, 1,
0.3250781, -0.418319, 1.805159, 0, 0, 0, 1, 1,
0.3357351, 0.8261117, -0.9664038, 0, 0, 0, 1, 1,
0.3381705, 1.271034, -0.3393453, 1, 1, 1, 1, 1,
0.3382061, 0.5515095, 0.818264, 1, 1, 1, 1, 1,
0.3426618, -0.958578, 4.015424, 1, 1, 1, 1, 1,
0.3458762, -0.1772488, 1.771519, 1, 1, 1, 1, 1,
0.352054, 0.6540725, 0.39382, 1, 1, 1, 1, 1,
0.3600218, -0.4698443, 4.230134, 1, 1, 1, 1, 1,
0.3604663, 0.7738556, 0.7486162, 1, 1, 1, 1, 1,
0.3606768, -1.503204, 3.010906, 1, 1, 1, 1, 1,
0.3655964, 0.5603543, 0.8340214, 1, 1, 1, 1, 1,
0.3657953, -1.74792, 1.728044, 1, 1, 1, 1, 1,
0.3669798, 0.5787651, 0.05874414, 1, 1, 1, 1, 1,
0.3709654, 1.025909, 2.096247, 1, 1, 1, 1, 1,
0.3733756, 3.234362, 0.7025084, 1, 1, 1, 1, 1,
0.3737651, 1.299224, -0.5162944, 1, 1, 1, 1, 1,
0.3761645, -1.047093, 3.801133, 1, 1, 1, 1, 1,
0.3764074, -0.3302897, 2.13614, 0, 0, 1, 1, 1,
0.3806998, 0.1433943, 1.286926, 1, 0, 0, 1, 1,
0.385244, -0.8126811, 2.806442, 1, 0, 0, 1, 1,
0.3854885, -0.4610897, 2.253142, 1, 0, 0, 1, 1,
0.3880932, -0.9178388, 3.463417, 1, 0, 0, 1, 1,
0.3944552, -0.02125021, 1.73481, 1, 0, 0, 1, 1,
0.3959562, -0.798691, 2.360821, 0, 0, 0, 1, 1,
0.3997969, 1.043307, 0.6832027, 0, 0, 0, 1, 1,
0.4000182, -1.66409, 3.222094, 0, 0, 0, 1, 1,
0.4075728, 2.191968, -0.1618909, 0, 0, 0, 1, 1,
0.40937, 1.203519, 1.561286, 0, 0, 0, 1, 1,
0.4109668, -1.302013, 1.59704, 0, 0, 0, 1, 1,
0.4192677, 0.01783365, 2.380057, 0, 0, 0, 1, 1,
0.420264, -1.210883, 1.191813, 1, 1, 1, 1, 1,
0.4224731, -0.1830595, 1.710015, 1, 1, 1, 1, 1,
0.4224925, -0.8737546, 2.714293, 1, 1, 1, 1, 1,
0.4232045, -1.896217, 3.318838, 1, 1, 1, 1, 1,
0.4233475, 0.6946327, 2.109595, 1, 1, 1, 1, 1,
0.4264984, -1.416505, 1.939783, 1, 1, 1, 1, 1,
0.4309958, 0.4493035, -1.004477, 1, 1, 1, 1, 1,
0.4323229, -0.706944, 2.409974, 1, 1, 1, 1, 1,
0.43284, -1.376338, 2.295361, 1, 1, 1, 1, 1,
0.4352547, -0.4479016, 2.65702, 1, 1, 1, 1, 1,
0.4392124, 0.7156901, 1.231818, 1, 1, 1, 1, 1,
0.4401528, 0.6475323, 2.461025, 1, 1, 1, 1, 1,
0.4463314, 0.5418539, 1.852491, 1, 1, 1, 1, 1,
0.4493035, 1.556607, -0.3527194, 1, 1, 1, 1, 1,
0.4503971, 2.429329, 1.462743, 1, 1, 1, 1, 1,
0.4551219, -0.06478458, 3.304548, 0, 0, 1, 1, 1,
0.4574979, -1.418846, 1.270825, 1, 0, 0, 1, 1,
0.464826, 0.4725853, 0.9758779, 1, 0, 0, 1, 1,
0.4654213, -1.064119, 2.779924, 1, 0, 0, 1, 1,
0.4674622, 0.9095998, -1.452621, 1, 0, 0, 1, 1,
0.4678168, 0.3590988, 0.5778093, 1, 0, 0, 1, 1,
0.4685661, 0.6302188, -1.050881, 0, 0, 0, 1, 1,
0.4727106, 0.6063184, -0.1362705, 0, 0, 0, 1, 1,
0.4771953, -0.4520098, 2.4316, 0, 0, 0, 1, 1,
0.4793309, -1.393963, 3.05556, 0, 0, 0, 1, 1,
0.4797165, 1.616736, -0.1931087, 0, 0, 0, 1, 1,
0.4813805, 1.986838, 0.5330215, 0, 0, 0, 1, 1,
0.4828053, -0.309536, 0.7536217, 0, 0, 0, 1, 1,
0.4834878, 0.005892487, 2.554318, 1, 1, 1, 1, 1,
0.4860515, -1.062148, 2.506809, 1, 1, 1, 1, 1,
0.491141, 0.4106741, 2.203732, 1, 1, 1, 1, 1,
0.4974342, -0.05026047, 1.302557, 1, 1, 1, 1, 1,
0.4984277, 0.1696207, 1.353123, 1, 1, 1, 1, 1,
0.4989138, 0.1092933, 0.3972383, 1, 1, 1, 1, 1,
0.503965, -0.01843489, 2.025573, 1, 1, 1, 1, 1,
0.5064614, -0.6804841, 2.809975, 1, 1, 1, 1, 1,
0.5122336, 0.02282687, 0.5347053, 1, 1, 1, 1, 1,
0.5175631, -1.174719, 2.121046, 1, 1, 1, 1, 1,
0.5201936, -0.02609203, 1.355617, 1, 1, 1, 1, 1,
0.5203387, 0.6330434, 0.208593, 1, 1, 1, 1, 1,
0.5206278, 0.670787, 3.088295, 1, 1, 1, 1, 1,
0.5208071, -0.05948817, -0.1651903, 1, 1, 1, 1, 1,
0.5335003, -0.7061134, 3.047565, 1, 1, 1, 1, 1,
0.5350721, 0.4271559, 3.387077, 0, 0, 1, 1, 1,
0.5504711, -0.8800136, 3.418005, 1, 0, 0, 1, 1,
0.550557, -1.115133, 3.894854, 1, 0, 0, 1, 1,
0.553077, 0.7899273, 2.744249, 1, 0, 0, 1, 1,
0.5599043, 0.6364359, 0.5033553, 1, 0, 0, 1, 1,
0.5674474, -0.6913661, 2.159033, 1, 0, 0, 1, 1,
0.5696176, 0.4338555, 1.804669, 0, 0, 0, 1, 1,
0.5704826, -0.2764576, 2.536422, 0, 0, 0, 1, 1,
0.5708908, -0.6111075, 1.0325, 0, 0, 0, 1, 1,
0.5729701, -1.303236, 3.909474, 0, 0, 0, 1, 1,
0.5806628, 0.8627942, -0.2723957, 0, 0, 0, 1, 1,
0.5811079, -0.4856993, 2.067782, 0, 0, 0, 1, 1,
0.5820525, -0.2347965, 2.280735, 0, 0, 0, 1, 1,
0.5849085, -0.665716, 1.246638, 1, 1, 1, 1, 1,
0.5856194, -0.4265824, 2.521214, 1, 1, 1, 1, 1,
0.5866249, 0.305648, -0.2508141, 1, 1, 1, 1, 1,
0.5928826, 0.3829041, 3.104069, 1, 1, 1, 1, 1,
0.5995861, 0.3147773, 0.008871969, 1, 1, 1, 1, 1,
0.6020056, 2.801664, 0.8968225, 1, 1, 1, 1, 1,
0.6058549, -0.9803025, -0.3539948, 1, 1, 1, 1, 1,
0.6108999, 1.688206, 0.4311638, 1, 1, 1, 1, 1,
0.6142557, 1.236569, 0.608189, 1, 1, 1, 1, 1,
0.6165879, -0.9697399, 3.088313, 1, 1, 1, 1, 1,
0.6178365, -0.8381051, 3.40975, 1, 1, 1, 1, 1,
0.6194533, 0.6382511, 0.2637424, 1, 1, 1, 1, 1,
0.6199397, 0.04745399, 1.542557, 1, 1, 1, 1, 1,
0.6212155, -0.5688384, 2.022523, 1, 1, 1, 1, 1,
0.6228029, -0.5900076, 2.073822, 1, 1, 1, 1, 1,
0.6285582, -1.113604, 0.5113638, 0, 0, 1, 1, 1,
0.6338317, 1.394657, 0.7788741, 1, 0, 0, 1, 1,
0.6365653, -1.34183, 2.843083, 1, 0, 0, 1, 1,
0.6454998, 0.531381, 1.734335, 1, 0, 0, 1, 1,
0.6455295, 0.2594161, 1.68037, 1, 0, 0, 1, 1,
0.6463104, -2.082277, 1.347393, 1, 0, 0, 1, 1,
0.6478382, -0.9267044, 2.821117, 0, 0, 0, 1, 1,
0.648151, -0.6855635, 1.272662, 0, 0, 0, 1, 1,
0.6488594, 0.05188762, 3.02763, 0, 0, 0, 1, 1,
0.6526197, -0.8988495, 2.104779, 0, 0, 0, 1, 1,
0.6549139, 0.1717066, 2.479357, 0, 0, 0, 1, 1,
0.6598971, -1.079668, 3.294836, 0, 0, 0, 1, 1,
0.6631644, 2.036689, -0.02495312, 0, 0, 0, 1, 1,
0.6734581, 2.021667, -0.6705103, 1, 1, 1, 1, 1,
0.6788056, 1.350808, -0.5051311, 1, 1, 1, 1, 1,
0.6800662, 0.6129445, 1.067128, 1, 1, 1, 1, 1,
0.6804391, 0.3736329, -1.281972, 1, 1, 1, 1, 1,
0.6844244, 0.6893219, -0.2804958, 1, 1, 1, 1, 1,
0.6878327, 0.9866132, -0.2418499, 1, 1, 1, 1, 1,
0.6925781, -0.02361012, 2.099447, 1, 1, 1, 1, 1,
0.6940543, -1.015956, 1.875274, 1, 1, 1, 1, 1,
0.698209, -0.1662378, 3.285178, 1, 1, 1, 1, 1,
0.7053342, -0.4701981, 2.541802, 1, 1, 1, 1, 1,
0.713118, -0.7635728, 2.399188, 1, 1, 1, 1, 1,
0.7201716, 0.3358577, 1.566675, 1, 1, 1, 1, 1,
0.7227813, -0.003231845, 0.6162613, 1, 1, 1, 1, 1,
0.7243029, 0.4405406, 0.2356906, 1, 1, 1, 1, 1,
0.7364545, -0.7546237, 2.614516, 1, 1, 1, 1, 1,
0.7379888, 0.8426483, 0.529308, 0, 0, 1, 1, 1,
0.7380024, -1.093908, 3.033934, 1, 0, 0, 1, 1,
0.7521829, -0.1958991, 0.2684107, 1, 0, 0, 1, 1,
0.7535558, -0.8091467, 1.787518, 1, 0, 0, 1, 1,
0.7553482, -0.7419499, 1.541229, 1, 0, 0, 1, 1,
0.7570919, -2.181066, 3.908739, 1, 0, 0, 1, 1,
0.7580156, -0.8931676, 3.064395, 0, 0, 0, 1, 1,
0.7586496, 0.3627657, 0.4487684, 0, 0, 0, 1, 1,
0.7597299, -1.18696, 2.497768, 0, 0, 0, 1, 1,
0.7622283, 0.9178034, -0.9177362, 0, 0, 0, 1, 1,
0.7667355, 0.463299, 2.004885, 0, 0, 0, 1, 1,
0.7678425, -1.682927, 2.814794, 0, 0, 0, 1, 1,
0.7682794, 1.694657, -0.3171103, 0, 0, 0, 1, 1,
0.7685624, 1.243573, 0.8261255, 1, 1, 1, 1, 1,
0.7719018, 1.584437, -1.116688, 1, 1, 1, 1, 1,
0.7725775, -0.5011796, 1.422206, 1, 1, 1, 1, 1,
0.7730979, -0.9682974, 3.23548, 1, 1, 1, 1, 1,
0.7752902, -0.1170041, 2.639732, 1, 1, 1, 1, 1,
0.7788109, -0.3483382, 1.821295, 1, 1, 1, 1, 1,
0.7838029, -0.2624833, 0.1079781, 1, 1, 1, 1, 1,
0.7929279, -1.236022, 1.222349, 1, 1, 1, 1, 1,
0.804665, -1.247001, 1.14079, 1, 1, 1, 1, 1,
0.8151675, 1.655038, -0.5120972, 1, 1, 1, 1, 1,
0.8176622, 0.2485456, 0.4419034, 1, 1, 1, 1, 1,
0.8191558, -0.740133, 1.205351, 1, 1, 1, 1, 1,
0.8229636, -0.2280965, 2.820302, 1, 1, 1, 1, 1,
0.8303454, -0.2888625, 3.322126, 1, 1, 1, 1, 1,
0.8305541, 0.3272905, 2.514821, 1, 1, 1, 1, 1,
0.8353962, -0.6968417, 0.9506268, 0, 0, 1, 1, 1,
0.835965, 0.07095558, 1.458788, 1, 0, 0, 1, 1,
0.8393545, 0.033103, 1.216989, 1, 0, 0, 1, 1,
0.842197, 0.08137437, 3.421302, 1, 0, 0, 1, 1,
0.8426037, 0.1474132, 3.831772, 1, 0, 0, 1, 1,
0.8438534, -1.418725, 4.946779, 1, 0, 0, 1, 1,
0.8456395, -1.204473, 1.961431, 0, 0, 0, 1, 1,
0.8463246, -0.4581401, 0.9427978, 0, 0, 0, 1, 1,
0.8486657, 1.411292, 0.4156037, 0, 0, 0, 1, 1,
0.8543867, 0.245864, 2.1302, 0, 0, 0, 1, 1,
0.8550168, -1.629675, 1.95865, 0, 0, 0, 1, 1,
0.8584312, 0.093667, 1.371658, 0, 0, 0, 1, 1,
0.8586376, -0.9411793, 2.518445, 0, 0, 0, 1, 1,
0.8588333, 1.935034, 0.3593801, 1, 1, 1, 1, 1,
0.8625425, -0.4090306, 2.688334, 1, 1, 1, 1, 1,
0.8687381, 0.2459248, 2.614051, 1, 1, 1, 1, 1,
0.8725515, -1.8971, 4.049798, 1, 1, 1, 1, 1,
0.8744043, 1.723054, 0.7140568, 1, 1, 1, 1, 1,
0.8792346, -0.2574666, 0.05726517, 1, 1, 1, 1, 1,
0.8817815, 1.676832, 0.9237362, 1, 1, 1, 1, 1,
0.8844918, -0.7860234, 2.181717, 1, 1, 1, 1, 1,
0.8886008, -1.401857, 4.032574, 1, 1, 1, 1, 1,
0.8889146, 0.5645395, 1.299936, 1, 1, 1, 1, 1,
0.8932745, 0.03229354, 2.151142, 1, 1, 1, 1, 1,
0.8994603, -0.6215442, 1.1598, 1, 1, 1, 1, 1,
0.9011942, 0.2201484, 2.218028, 1, 1, 1, 1, 1,
0.9027907, 1.330561, 1.393762, 1, 1, 1, 1, 1,
0.9036434, 1.268537, 1.38465, 1, 1, 1, 1, 1,
0.9041974, -0.6899439, 2.444142, 0, 0, 1, 1, 1,
0.9125367, -0.5351112, 1.559029, 1, 0, 0, 1, 1,
0.9196218, 0.7976784, 0.8312631, 1, 0, 0, 1, 1,
0.9208279, 0.7041472, 2.93962, 1, 0, 0, 1, 1,
0.9236845, 0.5124176, -0.4948505, 1, 0, 0, 1, 1,
0.9250732, -1.015677, 2.469146, 1, 0, 0, 1, 1,
0.9279808, 0.2896972, 2.456134, 0, 0, 0, 1, 1,
0.9286401, 0.1511291, -1.260682, 0, 0, 0, 1, 1,
0.9304011, -0.8660094, 0.8094773, 0, 0, 0, 1, 1,
0.9427669, -0.9245825, 1.929569, 0, 0, 0, 1, 1,
0.9494438, -0.5223506, 3.255621, 0, 0, 0, 1, 1,
0.9574713, 0.304428, 1.129891, 0, 0, 0, 1, 1,
0.9625754, -0.2167632, 1.307773, 0, 0, 0, 1, 1,
0.9649813, 0.1688587, 1.935553, 1, 1, 1, 1, 1,
0.971273, 0.6917077, -0.3379002, 1, 1, 1, 1, 1,
0.9783489, -0.3197336, 1.045674, 1, 1, 1, 1, 1,
0.9859537, -0.4370982, 3.104406, 1, 1, 1, 1, 1,
0.993116, -0.6740835, 1.89207, 1, 1, 1, 1, 1,
1.003932, 0.9930508, -0.1788273, 1, 1, 1, 1, 1,
1.007536, 1.447688, -0.2902456, 1, 1, 1, 1, 1,
1.0107, -0.9050264, 3.961352, 1, 1, 1, 1, 1,
1.011198, -0.9084833, 1.004721, 1, 1, 1, 1, 1,
1.021363, 0.7630316, 0.7539493, 1, 1, 1, 1, 1,
1.022069, -1.464344, 2.96795, 1, 1, 1, 1, 1,
1.023587, -0.672931, 1.330751, 1, 1, 1, 1, 1,
1.030913, -1.858071, 4.099747, 1, 1, 1, 1, 1,
1.032227, 1.944066, -0.6104365, 1, 1, 1, 1, 1,
1.035881, 0.4752872, 2.39345, 1, 1, 1, 1, 1,
1.036946, -1.127861, 3.889183, 0, 0, 1, 1, 1,
1.042752, -0.07018702, 3.108857, 1, 0, 0, 1, 1,
1.046294, -0.3072348, 2.93536, 1, 0, 0, 1, 1,
1.049284, -0.6725258, 1.054338, 1, 0, 0, 1, 1,
1.061251, -0.1528431, 1.859752, 1, 0, 0, 1, 1,
1.06556, -0.3455592, 1.185659, 1, 0, 0, 1, 1,
1.065654, -0.0002218977, 1.492492, 0, 0, 0, 1, 1,
1.074095, 0.3213307, 0.4419678, 0, 0, 0, 1, 1,
1.078449, -1.62118, 1.664045, 0, 0, 0, 1, 1,
1.079344, 0.3284782, 1.763027, 0, 0, 0, 1, 1,
1.084415, -0.6016291, 3.038128, 0, 0, 0, 1, 1,
1.088058, -0.6533862, 2.974654, 0, 0, 0, 1, 1,
1.091295, 1.7686, 2.100206, 0, 0, 0, 1, 1,
1.094166, -0.3884079, 1.237178, 1, 1, 1, 1, 1,
1.096063, 0.2509215, 0.395267, 1, 1, 1, 1, 1,
1.100498, 0.8376032, 0.5534805, 1, 1, 1, 1, 1,
1.103176, 0.2249276, 1.441844, 1, 1, 1, 1, 1,
1.10737, 0.8801153, 2.148107, 1, 1, 1, 1, 1,
1.112474, -0.6940551, 2.859622, 1, 1, 1, 1, 1,
1.114871, 0.6148852, 0.3633697, 1, 1, 1, 1, 1,
1.118747, 0.1348221, 1.301002, 1, 1, 1, 1, 1,
1.122676, -0.4376346, 1.135057, 1, 1, 1, 1, 1,
1.129185, -0.2885562, 3.926571, 1, 1, 1, 1, 1,
1.133319, -0.5372155, 1.400481, 1, 1, 1, 1, 1,
1.133894, 1.529857, 1.985052, 1, 1, 1, 1, 1,
1.139046, 1.08565, 0.6223901, 1, 1, 1, 1, 1,
1.139598, 1.403526, -0.02754974, 1, 1, 1, 1, 1,
1.157901, 1.63892, 0.8710863, 1, 1, 1, 1, 1,
1.158936, 0.7310295, 2.061361, 0, 0, 1, 1, 1,
1.184867, -0.5182168, 2.009026, 1, 0, 0, 1, 1,
1.188773, 0.2562396, 1.201199, 1, 0, 0, 1, 1,
1.198802, 0.4112534, 1.315034, 1, 0, 0, 1, 1,
1.208752, 0.1831264, -0.2885606, 1, 0, 0, 1, 1,
1.210598, -1.926964, 2.407976, 1, 0, 0, 1, 1,
1.233899, -0.2072337, 2.006204, 0, 0, 0, 1, 1,
1.235592, -0.2401975, 0.8285602, 0, 0, 0, 1, 1,
1.236878, 0.1245279, 0.897958, 0, 0, 0, 1, 1,
1.253634, 1.346623, 0.6439582, 0, 0, 0, 1, 1,
1.259206, 0.23194, 0.2883787, 0, 0, 0, 1, 1,
1.259664, 1.148605, 1.062348, 0, 0, 0, 1, 1,
1.264004, 0.4953934, 1.047711, 0, 0, 0, 1, 1,
1.266479, -0.3905952, 1.78697, 1, 1, 1, 1, 1,
1.277014, 0.6299466, 1.124394, 1, 1, 1, 1, 1,
1.278123, 1.112856, 1.449554, 1, 1, 1, 1, 1,
1.279652, -0.123777, 2.867543, 1, 1, 1, 1, 1,
1.289225, 0.8308609, -0.03850904, 1, 1, 1, 1, 1,
1.289398, -0.7696317, 0.7869776, 1, 1, 1, 1, 1,
1.291374, 1.897834, 1.05069, 1, 1, 1, 1, 1,
1.30155, 2.016057, -1.135309, 1, 1, 1, 1, 1,
1.301799, -2.027205, 3.91706, 1, 1, 1, 1, 1,
1.307288, 0.145832, 1.442837, 1, 1, 1, 1, 1,
1.31051, 0.6750792, 1.452662, 1, 1, 1, 1, 1,
1.311594, -0.3830578, 1.789253, 1, 1, 1, 1, 1,
1.32412, -0.2994435, 2.523756, 1, 1, 1, 1, 1,
1.329313, -0.3198741, 0.725102, 1, 1, 1, 1, 1,
1.331313, -1.106289, 1.906825, 1, 1, 1, 1, 1,
1.331346, 1.269151, 1.528438, 0, 0, 1, 1, 1,
1.336352, 1.184025, 0.7467858, 1, 0, 0, 1, 1,
1.337955, 0.6220304, 0.6629159, 1, 0, 0, 1, 1,
1.339164, 0.2010261, 1.047037, 1, 0, 0, 1, 1,
1.347553, -0.2580508, 0.716681, 1, 0, 0, 1, 1,
1.352137, -0.1675157, 2.317902, 1, 0, 0, 1, 1,
1.358326, 0.6170476, 1.706202, 0, 0, 0, 1, 1,
1.3709, -1.742033, 2.53825, 0, 0, 0, 1, 1,
1.386088, -0.2254307, 3.838197, 0, 0, 0, 1, 1,
1.394668, 0.1159034, 2.157744, 0, 0, 0, 1, 1,
1.399146, 0.8368462, 0.2726555, 0, 0, 0, 1, 1,
1.403203, -0.698427, 2.106277, 0, 0, 0, 1, 1,
1.405185, -1.114445, 2.737939, 0, 0, 0, 1, 1,
1.405948, 0.1362728, 1.23587, 1, 1, 1, 1, 1,
1.422952, -0.1260136, 1.97345, 1, 1, 1, 1, 1,
1.442475, -0.4932968, 2.668971, 1, 1, 1, 1, 1,
1.449093, -1.904751, 2.721481, 1, 1, 1, 1, 1,
1.458623, 0.4976522, 2.417572, 1, 1, 1, 1, 1,
1.458896, -1.319596, 2.403045, 1, 1, 1, 1, 1,
1.468029, -1.917829, 0.8855926, 1, 1, 1, 1, 1,
1.474473, 0.6530225, 0.8362225, 1, 1, 1, 1, 1,
1.480967, 0.4121076, 0.906621, 1, 1, 1, 1, 1,
1.489346, 1.380123, 0.6399717, 1, 1, 1, 1, 1,
1.504596, -1.61645, 1.086183, 1, 1, 1, 1, 1,
1.510608, 1.180512, -0.1044899, 1, 1, 1, 1, 1,
1.512424, 1.054867, 0.6564291, 1, 1, 1, 1, 1,
1.521009, 0.4262829, 2.073314, 1, 1, 1, 1, 1,
1.535438, -1.178501, 1.141891, 1, 1, 1, 1, 1,
1.5381, 0.6525718, 2.233007, 0, 0, 1, 1, 1,
1.553331, -0.7736574, 2.339466, 1, 0, 0, 1, 1,
1.560097, -0.5816574, 1.118626, 1, 0, 0, 1, 1,
1.563941, 1.141253, 2.847947, 1, 0, 0, 1, 1,
1.571718, 0.4318299, 1.786347, 1, 0, 0, 1, 1,
1.577059, -0.0774777, 0.6025256, 1, 0, 0, 1, 1,
1.582108, -1.324128, 0.5090376, 0, 0, 0, 1, 1,
1.582404, -0.07377978, 0.3626219, 0, 0, 0, 1, 1,
1.583429, 0.2103808, 1.13381, 0, 0, 0, 1, 1,
1.584903, 0.5353898, 1.618329, 0, 0, 0, 1, 1,
1.591195, -0.7972714, 1.937108, 0, 0, 0, 1, 1,
1.597472, 0.8120886, 3.487895, 0, 0, 0, 1, 1,
1.620891, -1.591901, 2.328902, 0, 0, 0, 1, 1,
1.628564, -2.200464, 3.639762, 1, 1, 1, 1, 1,
1.644637, 0.2617891, 1.11502, 1, 1, 1, 1, 1,
1.677011, -0.5565289, 0.1534491, 1, 1, 1, 1, 1,
1.697709, -0.1175346, 2.786728, 1, 1, 1, 1, 1,
1.699923, -0.5172966, 1.229167, 1, 1, 1, 1, 1,
1.710598, -0.4190872, 1.733764, 1, 1, 1, 1, 1,
1.713899, -0.8783933, 2.746379, 1, 1, 1, 1, 1,
1.714702, 0.04833862, 2.828378, 1, 1, 1, 1, 1,
1.717522, 0.01372165, 2.11882, 1, 1, 1, 1, 1,
1.722619, -1.004749, 1.492814, 1, 1, 1, 1, 1,
1.72265, 0.326388, 1.601553, 1, 1, 1, 1, 1,
1.745479, -1.079686, 1.462926, 1, 1, 1, 1, 1,
1.772552, 1.731063, 0.3366512, 1, 1, 1, 1, 1,
1.788224, -0.2325281, 1.797674, 1, 1, 1, 1, 1,
1.825217, -0.5872232, 2.536106, 1, 1, 1, 1, 1,
1.834735, -0.9811503, 3.531859, 0, 0, 1, 1, 1,
1.840018, -2.260532, 1.985956, 1, 0, 0, 1, 1,
1.842651, 1.843194, 0.4177661, 1, 0, 0, 1, 1,
1.844615, 0.579099, -0.1037237, 1, 0, 0, 1, 1,
1.847801, -1.455288, 3.064947, 1, 0, 0, 1, 1,
1.854768, -1.076706, 2.379892, 1, 0, 0, 1, 1,
1.864462, -0.8609444, 3.122585, 0, 0, 0, 1, 1,
1.865078, 1.71701, 0.6838982, 0, 0, 0, 1, 1,
1.872027, 1.3069, 0.1692571, 0, 0, 0, 1, 1,
1.881238, 0.2168297, 1.965706, 0, 0, 0, 1, 1,
1.881656, 0.76282, -0.09758133, 0, 0, 0, 1, 1,
1.88361, -0.2543684, 2.131397, 0, 0, 0, 1, 1,
1.88688, -0.1832875, 1.863936, 0, 0, 0, 1, 1,
1.908709, 1.172845, -0.4076649, 1, 1, 1, 1, 1,
1.91769, 0.7785712, 0.156302, 1, 1, 1, 1, 1,
1.943374, -0.1576905, 1.990438, 1, 1, 1, 1, 1,
1.963465, 0.7578605, 1.677554, 1, 1, 1, 1, 1,
1.976483, 0.405455, -0.1400954, 1, 1, 1, 1, 1,
1.988178, 1.309512, -1.3278, 1, 1, 1, 1, 1,
1.99591, -0.3760341, 2.04046, 1, 1, 1, 1, 1,
2.014631, -0.9586871, 0.2430611, 1, 1, 1, 1, 1,
2.024675, -0.7872578, 0.4114414, 1, 1, 1, 1, 1,
2.043572, -2.152815, 1.767411, 1, 1, 1, 1, 1,
2.078219, -0.5275606, 2.186079, 1, 1, 1, 1, 1,
2.080308, -0.6625592, 1.165268, 1, 1, 1, 1, 1,
2.134768, 0.1574241, 0.5605855, 1, 1, 1, 1, 1,
2.149919, 1.326714, 2.030363, 1, 1, 1, 1, 1,
2.183729, -0.9833901, 2.504032, 1, 1, 1, 1, 1,
2.192124, -0.9942451, 2.163178, 0, 0, 1, 1, 1,
2.19449, 0.5051305, 0.05315514, 1, 0, 0, 1, 1,
2.342765, -2.069749, 2.651141, 1, 0, 0, 1, 1,
2.356873, 0.1035972, 2.729592, 1, 0, 0, 1, 1,
2.408886, -0.1204724, 2.893514, 1, 0, 0, 1, 1,
2.444768, -1.594511, 2.371253, 1, 0, 0, 1, 1,
2.466067, 1.343942, 2.661516, 0, 0, 0, 1, 1,
2.515774, -0.4127217, 0.8166053, 0, 0, 0, 1, 1,
2.541489, 0.6053563, 1.34911, 0, 0, 0, 1, 1,
2.547761, 0.8448432, 1.294549, 0, 0, 0, 1, 1,
2.54994, 1.095662, -0.04945982, 0, 0, 0, 1, 1,
2.571039, 2.152961, 3.014924, 0, 0, 0, 1, 1,
2.827738, 2.487952, 0.3695322, 0, 0, 0, 1, 1,
2.838444, 0.01023376, 2.658338, 1, 1, 1, 1, 1,
2.92305, -0.0702256, 2.252805, 1, 1, 1, 1, 1,
3.178739, -2.147964, 1.089544, 1, 1, 1, 1, 1,
3.377922, -1.908111, 0.8650265, 1, 1, 1, 1, 1,
3.437109, -0.7638485, 1.915033, 1, 1, 1, 1, 1,
3.508492, 2.48835, 1.340316, 1, 1, 1, 1, 1,
3.560324, -2.179621, 2.214436, 1, 1, 1, 1, 1
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
var radius = 9.499989;
var distance = 33.36831;
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
mvMatrix.translate( -0.03414774, -0.2984703, -0.1997371 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36831);
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
