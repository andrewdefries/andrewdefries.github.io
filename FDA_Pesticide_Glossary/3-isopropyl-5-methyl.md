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
-3.287353, -1.276861, -1.297293, 1, 0, 0, 1,
-3.245891, 1.009422, -1.192987, 1, 0.007843138, 0, 1,
-2.999404, -2.941547, -3.420295, 1, 0.01176471, 0, 1,
-2.965653, 0.8495687, -1.352518, 1, 0.01960784, 0, 1,
-2.928704, 0.8010687, -2.316874, 1, 0.02352941, 0, 1,
-2.734765, 0.5577502, -0.2453806, 1, 0.03137255, 0, 1,
-2.678994, -1.281648, -1.286949, 1, 0.03529412, 0, 1,
-2.525097, -0.6428888, -2.057759, 1, 0.04313726, 0, 1,
-2.380171, 0.2378982, -2.892085, 1, 0.04705882, 0, 1,
-2.355373, -1.013074, -3.044586, 1, 0.05490196, 0, 1,
-2.335794, 0.1951432, -1.162142, 1, 0.05882353, 0, 1,
-2.314722, 0.2431901, -1.590615, 1, 0.06666667, 0, 1,
-2.304174, -1.691591, -1.821068, 1, 0.07058824, 0, 1,
-2.230389, -0.7873364, -2.704861, 1, 0.07843138, 0, 1,
-2.208951, -1.469724, -2.335152, 1, 0.08235294, 0, 1,
-2.170982, -0.5298502, -1.522931, 1, 0.09019608, 0, 1,
-2.163013, -0.9288058, -2.120927, 1, 0.09411765, 0, 1,
-2.156427, 1.636184, 0.5187949, 1, 0.1019608, 0, 1,
-2.108465, -0.5269711, -2.777532, 1, 0.1098039, 0, 1,
-2.09632, 1.356122, -0.5338279, 1, 0.1137255, 0, 1,
-2.087068, -0.3756174, -2.770218, 1, 0.1215686, 0, 1,
-2.063197, 2.356376, -1.241675, 1, 0.1254902, 0, 1,
-2.050086, -0.7751466, -1.050077, 1, 0.1333333, 0, 1,
-1.947048, -0.5857502, -2.099893, 1, 0.1372549, 0, 1,
-1.943928, 1.421142, -1.238629, 1, 0.145098, 0, 1,
-1.930801, -1.000171, -2.126524, 1, 0.1490196, 0, 1,
-1.914357, 1.253231, -0.3688036, 1, 0.1568628, 0, 1,
-1.893468, 1.458979, -1.638973, 1, 0.1607843, 0, 1,
-1.831218, -1.085135, -2.820353, 1, 0.1686275, 0, 1,
-1.812896, 1.691975, -1.7617, 1, 0.172549, 0, 1,
-1.806062, 0.7135562, -1.718888, 1, 0.1803922, 0, 1,
-1.801915, -0.1941923, -1.273854, 1, 0.1843137, 0, 1,
-1.79094, -0.6869546, -1.421035, 1, 0.1921569, 0, 1,
-1.789189, 0.2583563, -1.848996, 1, 0.1960784, 0, 1,
-1.788023, 0.02769472, -1.696277, 1, 0.2039216, 0, 1,
-1.786921, -0.4806235, -1.784063, 1, 0.2117647, 0, 1,
-1.764974, 0.4728021, -2.380126, 1, 0.2156863, 0, 1,
-1.763872, 1.227376, -2.028875, 1, 0.2235294, 0, 1,
-1.748023, -0.2126476, -3.059747, 1, 0.227451, 0, 1,
-1.74129, -1.039039, -3.043048, 1, 0.2352941, 0, 1,
-1.736328, 0.992773, -0.7312458, 1, 0.2392157, 0, 1,
-1.7253, 1.845355, -1.833293, 1, 0.2470588, 0, 1,
-1.704975, -1.689784, -2.017977, 1, 0.2509804, 0, 1,
-1.690389, -1.1883, -2.103822, 1, 0.2588235, 0, 1,
-1.681562, -0.2447295, -2.750896, 1, 0.2627451, 0, 1,
-1.677175, -0.2940294, -1.034132, 1, 0.2705882, 0, 1,
-1.674898, 1.458936, -1.58145, 1, 0.2745098, 0, 1,
-1.673095, -1.563884, -2.080331, 1, 0.282353, 0, 1,
-1.653054, 0.513854, -0.300954, 1, 0.2862745, 0, 1,
-1.643457, 0.2876526, -0.8339827, 1, 0.2941177, 0, 1,
-1.629135, -1.327306, -3.685316, 1, 0.3019608, 0, 1,
-1.613168, 0.8503349, -2.961799, 1, 0.3058824, 0, 1,
-1.601602, 1.176286, -1.523975, 1, 0.3137255, 0, 1,
-1.568103, -0.2646382, -1.137984, 1, 0.3176471, 0, 1,
-1.563928, -0.3052313, -1.497835, 1, 0.3254902, 0, 1,
-1.558998, -0.8056548, 0.1203866, 1, 0.3294118, 0, 1,
-1.523221, -0.01999889, -1.829724, 1, 0.3372549, 0, 1,
-1.517042, 0.8130724, -0.2511359, 1, 0.3411765, 0, 1,
-1.505315, -0.735779, -1.599428, 1, 0.3490196, 0, 1,
-1.504512, 0.4956985, -1.478147, 1, 0.3529412, 0, 1,
-1.504309, -0.5580188, -3.417781, 1, 0.3607843, 0, 1,
-1.479032, 1.024337, 0.6407768, 1, 0.3647059, 0, 1,
-1.476111, 0.1215026, -1.140396, 1, 0.372549, 0, 1,
-1.468611, 1.384197, -0.5936522, 1, 0.3764706, 0, 1,
-1.459751, -2.023826, -1.450803, 1, 0.3843137, 0, 1,
-1.39709, -1.243356, -1.654017, 1, 0.3882353, 0, 1,
-1.395451, 0.3130608, -0.2147559, 1, 0.3960784, 0, 1,
-1.369923, -0.2102643, -0.6999931, 1, 0.4039216, 0, 1,
-1.364563, 0.02528289, -0.430559, 1, 0.4078431, 0, 1,
-1.363377, 0.2425697, -2.01171, 1, 0.4156863, 0, 1,
-1.360102, 0.8512799, -1.354777, 1, 0.4196078, 0, 1,
-1.359754, 2.227975, -0.4416039, 1, 0.427451, 0, 1,
-1.354157, 0.3752368, 0.2479257, 1, 0.4313726, 0, 1,
-1.35185, -2.193043, -1.680146, 1, 0.4392157, 0, 1,
-1.338976, -0.9393676, -1.395234, 1, 0.4431373, 0, 1,
-1.320008, -2.334095, -2.659686, 1, 0.4509804, 0, 1,
-1.313848, -0.4466085, -0.8515874, 1, 0.454902, 0, 1,
-1.302056, 0.2113937, -2.038323, 1, 0.4627451, 0, 1,
-1.298103, 0.4258358, -2.177403, 1, 0.4666667, 0, 1,
-1.294139, -1.401339, -3.376024, 1, 0.4745098, 0, 1,
-1.275399, -0.6964897, -2.386871, 1, 0.4784314, 0, 1,
-1.274312, 1.119, -2.201257, 1, 0.4862745, 0, 1,
-1.274026, 0.3677614, -0.08266917, 1, 0.4901961, 0, 1,
-1.272633, -0.2816421, -1.632555, 1, 0.4980392, 0, 1,
-1.268782, -0.7632974, -1.444135, 1, 0.5058824, 0, 1,
-1.259882, -0.862399, -2.674954, 1, 0.509804, 0, 1,
-1.257034, -0.1421974, -1.414554, 1, 0.5176471, 0, 1,
-1.251583, -0.2390893, -1.407069, 1, 0.5215687, 0, 1,
-1.244449, -0.8895754, -2.473506, 1, 0.5294118, 0, 1,
-1.238929, 0.5429624, 0.5972366, 1, 0.5333334, 0, 1,
-1.229341, 0.264681, -2.631572, 1, 0.5411765, 0, 1,
-1.226629, -0.7003903, -0.488624, 1, 0.5450981, 0, 1,
-1.223374, 0.3125387, -1.103237, 1, 0.5529412, 0, 1,
-1.210586, -0.1533033, -1.117146, 1, 0.5568628, 0, 1,
-1.21007, -0.1891114, -0.8248286, 1, 0.5647059, 0, 1,
-1.204733, -0.5546823, -3.220482, 1, 0.5686275, 0, 1,
-1.182016, -1.444892, -3.014888, 1, 0.5764706, 0, 1,
-1.178257, 0.5955095, 0.3429191, 1, 0.5803922, 0, 1,
-1.169668, -0.667118, -2.605241, 1, 0.5882353, 0, 1,
-1.168483, 0.1646258, -2.611586, 1, 0.5921569, 0, 1,
-1.168411, -0.7610244, -2.340557, 1, 0.6, 0, 1,
-1.164389, -0.5990707, -2.570523, 1, 0.6078432, 0, 1,
-1.163021, -0.5292982, -0.6477961, 1, 0.6117647, 0, 1,
-1.154256, -0.4917684, -0.7547891, 1, 0.6196079, 0, 1,
-1.149078, 0.3057956, -1.231272, 1, 0.6235294, 0, 1,
-1.145078, -1.379037, -1.81702, 1, 0.6313726, 0, 1,
-1.129796, 0.9091993, 0.1070285, 1, 0.6352941, 0, 1,
-1.112626, 0.1775153, -1.045487, 1, 0.6431373, 0, 1,
-1.112498, -3.014646, -2.171976, 1, 0.6470588, 0, 1,
-1.111014, 0.3876487, -1.939804, 1, 0.654902, 0, 1,
-1.103455, 0.8110819, -2.326293, 1, 0.6588235, 0, 1,
-1.102162, -0.131665, -2.527044, 1, 0.6666667, 0, 1,
-1.10039, -0.370481, -1.206663, 1, 0.6705883, 0, 1,
-1.096846, -1.119994, -1.357549, 1, 0.6784314, 0, 1,
-1.085792, -0.4159639, -1.946226, 1, 0.682353, 0, 1,
-1.083409, -1.205179, -2.938109, 1, 0.6901961, 0, 1,
-1.08036, -0.3357167, -3.934444, 1, 0.6941177, 0, 1,
-1.065636, -0.7832927, -1.438854, 1, 0.7019608, 0, 1,
-1.06505, 1.439321, -3.787342, 1, 0.7098039, 0, 1,
-1.061449, 0.206058, -2.406825, 1, 0.7137255, 0, 1,
-1.060517, 0.7933635, -0.6237924, 1, 0.7215686, 0, 1,
-1.056189, -0.3973894, -1.129904, 1, 0.7254902, 0, 1,
-1.05539, 0.3939103, -1.900992, 1, 0.7333333, 0, 1,
-1.039827, 0.3582206, -2.106933, 1, 0.7372549, 0, 1,
-1.034362, 0.01685268, -2.200951, 1, 0.7450981, 0, 1,
-1.033857, -0.5133878, -1.096399, 1, 0.7490196, 0, 1,
-1.031605, 0.7557435, -0.8755692, 1, 0.7568628, 0, 1,
-1.027464, -0.05094739, -1.877365, 1, 0.7607843, 0, 1,
-1.026113, 0.2270832, -2.224183, 1, 0.7686275, 0, 1,
-1.016832, -1.498004, -2.568262, 1, 0.772549, 0, 1,
-1.016628, -0.9440338, -2.709186, 1, 0.7803922, 0, 1,
-1.015316, 1.652165, -0.08197817, 1, 0.7843137, 0, 1,
-1.014329, 0.5101923, -1.93083, 1, 0.7921569, 0, 1,
-1.012971, 2.472459, 0.4580075, 1, 0.7960784, 0, 1,
-1.008794, 0.4083919, 1.059915, 1, 0.8039216, 0, 1,
-1.00743, -0.1945195, -2.28549, 1, 0.8117647, 0, 1,
-1.006883, -1.24087, -0.1840489, 1, 0.8156863, 0, 1,
-1.000853, 1.353907, -2.736661, 1, 0.8235294, 0, 1,
-0.999125, -0.8846054, -2.317587, 1, 0.827451, 0, 1,
-0.9953336, -0.4095646, -3.569617, 1, 0.8352941, 0, 1,
-0.9921273, -1.147727, -2.165666, 1, 0.8392157, 0, 1,
-0.9862468, 0.3557885, -0.3721057, 1, 0.8470588, 0, 1,
-0.9804759, -1.0339, -2.874457, 1, 0.8509804, 0, 1,
-0.9720432, 0.1187457, -2.539356, 1, 0.8588235, 0, 1,
-0.9532673, -1.10726, -2.55085, 1, 0.8627451, 0, 1,
-0.9526249, -0.6867582, 0.04893485, 1, 0.8705882, 0, 1,
-0.9479043, 1.84168, -1.040015, 1, 0.8745098, 0, 1,
-0.9432402, -0.0623419, -2.059099, 1, 0.8823529, 0, 1,
-0.9432142, 0.4000267, -1.071598, 1, 0.8862745, 0, 1,
-0.9385008, 0.1130114, -0.9150442, 1, 0.8941177, 0, 1,
-0.9379598, -0.735589, -1.469048, 1, 0.8980392, 0, 1,
-0.9193015, -0.1946411, -2.070943, 1, 0.9058824, 0, 1,
-0.917206, -0.7058623, -2.262355, 1, 0.9137255, 0, 1,
-0.9150824, -0.02799967, -1.625852, 1, 0.9176471, 0, 1,
-0.9118149, 0.1317919, 1.425149, 1, 0.9254902, 0, 1,
-0.9042868, 1.625057, -0.36979, 1, 0.9294118, 0, 1,
-0.9039348, 1.675929, -0.7687128, 1, 0.9372549, 0, 1,
-0.8992385, -1.119095, -2.66106, 1, 0.9411765, 0, 1,
-0.8986173, -0.9526811, -1.033063, 1, 0.9490196, 0, 1,
-0.895887, -0.7484528, -2.506454, 1, 0.9529412, 0, 1,
-0.8948511, 0.3434623, -0.8405713, 1, 0.9607843, 0, 1,
-0.8829247, 0.1312335, -1.711515, 1, 0.9647059, 0, 1,
-0.882108, -0.04095366, -0.8471613, 1, 0.972549, 0, 1,
-0.8810911, -1.699377, -2.844709, 1, 0.9764706, 0, 1,
-0.8803555, -1.331895, -3.05168, 1, 0.9843137, 0, 1,
-0.8784682, 0.7494662, -0.2634339, 1, 0.9882353, 0, 1,
-0.877133, 0.6660969, -2.232771, 1, 0.9960784, 0, 1,
-0.8719326, 1.610576, 0.1680416, 0.9960784, 1, 0, 1,
-0.8715246, -0.3317776, -1.371045, 0.9921569, 1, 0, 1,
-0.869875, -0.7791416, -4.147585, 0.9843137, 1, 0, 1,
-0.8678614, -0.4209566, -3.846116, 0.9803922, 1, 0, 1,
-0.8615513, 0.1849216, -1.027344, 0.972549, 1, 0, 1,
-0.8495941, 0.547286, 0.3225364, 0.9686275, 1, 0, 1,
-0.8490242, 0.5372562, 1.435989, 0.9607843, 1, 0, 1,
-0.8454785, -0.154523, -1.35054, 0.9568627, 1, 0, 1,
-0.8448365, 0.2241341, -1.69784, 0.9490196, 1, 0, 1,
-0.8336226, -2.292229, -1.038319, 0.945098, 1, 0, 1,
-0.8332129, 0.7872949, -0.2037401, 0.9372549, 1, 0, 1,
-0.8278424, 0.42718, -2.227868, 0.9333333, 1, 0, 1,
-0.8277798, 0.2361608, -1.499472, 0.9254902, 1, 0, 1,
-0.8139039, 0.1106066, -2.001686, 0.9215686, 1, 0, 1,
-0.809833, 0.9065345, -1.329028, 0.9137255, 1, 0, 1,
-0.8068749, 1.246061, -0.4810411, 0.9098039, 1, 0, 1,
-0.7973714, 0.1096103, -1.092099, 0.9019608, 1, 0, 1,
-0.7967703, 1.177769, 0.6953549, 0.8941177, 1, 0, 1,
-0.7966127, -0.5835953, -1.257622, 0.8901961, 1, 0, 1,
-0.7958384, 0.2051824, -0.6580747, 0.8823529, 1, 0, 1,
-0.7893022, 0.4210049, 0.1996173, 0.8784314, 1, 0, 1,
-0.7877392, 0.9439843, 1.008518, 0.8705882, 1, 0, 1,
-0.7859843, 0.3365806, -0.2450297, 0.8666667, 1, 0, 1,
-0.7846812, -0.9847475, -4.12081, 0.8588235, 1, 0, 1,
-0.7784496, 0.6038513, -1.382531, 0.854902, 1, 0, 1,
-0.7714555, -1.177113, -1.685535, 0.8470588, 1, 0, 1,
-0.7699483, -0.4457857, -1.909399, 0.8431373, 1, 0, 1,
-0.7674039, -0.7229696, -2.407557, 0.8352941, 1, 0, 1,
-0.7648417, 0.6674006, -0.8297789, 0.8313726, 1, 0, 1,
-0.7563549, -1.345933, -2.193351, 0.8235294, 1, 0, 1,
-0.7556444, -0.9979986, -2.851812, 0.8196079, 1, 0, 1,
-0.754466, -1.31925, -2.720687, 0.8117647, 1, 0, 1,
-0.7496194, -0.5341514, -2.830327, 0.8078431, 1, 0, 1,
-0.7454613, -0.0209987, -0.6998748, 0.8, 1, 0, 1,
-0.7434291, -0.2265049, -2.650365, 0.7921569, 1, 0, 1,
-0.7384017, 0.9225543, 0.4528205, 0.7882353, 1, 0, 1,
-0.7309305, 1.792295, -1.164786, 0.7803922, 1, 0, 1,
-0.7300182, -1.499781, -2.683538, 0.7764706, 1, 0, 1,
-0.7265353, 0.6374216, 0.09583465, 0.7686275, 1, 0, 1,
-0.7247228, 0.6736256, -0.8505535, 0.7647059, 1, 0, 1,
-0.7199728, 0.1793766, -0.8134837, 0.7568628, 1, 0, 1,
-0.7152141, 0.9758754, -0.8208838, 0.7529412, 1, 0, 1,
-0.7111859, -2.35184, -2.156427, 0.7450981, 1, 0, 1,
-0.7097289, -0.2092771, -2.303398, 0.7411765, 1, 0, 1,
-0.7094479, -0.7217838, -2.304617, 0.7333333, 1, 0, 1,
-0.7084002, -0.4550838, -2.158592, 0.7294118, 1, 0, 1,
-0.7043192, -0.9921369, -2.255634, 0.7215686, 1, 0, 1,
-0.7036489, 0.183043, -1.282449, 0.7176471, 1, 0, 1,
-0.703612, -0.0825337, -2.974957, 0.7098039, 1, 0, 1,
-0.70191, -0.7797762, -1.446418, 0.7058824, 1, 0, 1,
-0.6963668, -1.200659, -3.753474, 0.6980392, 1, 0, 1,
-0.6920097, 0.1836402, -2.620953, 0.6901961, 1, 0, 1,
-0.6883742, -0.78608, -1.921467, 0.6862745, 1, 0, 1,
-0.6882518, 0.3806468, -0.5521573, 0.6784314, 1, 0, 1,
-0.6882129, 0.7813927, -1.525153, 0.6745098, 1, 0, 1,
-0.6839543, -0.751918, -2.8584, 0.6666667, 1, 0, 1,
-0.6837512, -0.736978, -2.675001, 0.6627451, 1, 0, 1,
-0.6805795, 0.8862851, -1.771306, 0.654902, 1, 0, 1,
-0.6718602, -1.142588, -3.247976, 0.6509804, 1, 0, 1,
-0.6701584, -1.279889, -2.535579, 0.6431373, 1, 0, 1,
-0.6663237, 0.4033815, -0.9256387, 0.6392157, 1, 0, 1,
-0.6612617, 0.2721242, -0.6912295, 0.6313726, 1, 0, 1,
-0.6605102, 2.045837, -0.0374519, 0.627451, 1, 0, 1,
-0.657526, -0.5250356, -2.372265, 0.6196079, 1, 0, 1,
-0.650127, -0.4861436, -1.838903, 0.6156863, 1, 0, 1,
-0.6454499, -0.6093654, -1.538599, 0.6078432, 1, 0, 1,
-0.6407694, 1.092049, -0.7120117, 0.6039216, 1, 0, 1,
-0.6400809, 1.582049, 0.09494208, 0.5960785, 1, 0, 1,
-0.6396165, 0.01715464, -1.194061, 0.5882353, 1, 0, 1,
-0.6358513, 1.282645, -0.2376664, 0.5843138, 1, 0, 1,
-0.6242936, 0.2020071, 0.4661402, 0.5764706, 1, 0, 1,
-0.6238145, 2.736958, 1.071964, 0.572549, 1, 0, 1,
-0.6234375, 0.1908015, -0.770276, 0.5647059, 1, 0, 1,
-0.622619, 1.255502, -1.383372, 0.5607843, 1, 0, 1,
-0.6207302, -1.903821, -3.532424, 0.5529412, 1, 0, 1,
-0.6200208, 0.4026816, -0.496327, 0.5490196, 1, 0, 1,
-0.6191883, -0.5989683, -3.111822, 0.5411765, 1, 0, 1,
-0.6140445, -0.9901425, -3.086546, 0.5372549, 1, 0, 1,
-0.6105818, -1.110632, -1.607267, 0.5294118, 1, 0, 1,
-0.6080039, 0.8067682, 0.4743252, 0.5254902, 1, 0, 1,
-0.6079698, -1.241222, -2.027586, 0.5176471, 1, 0, 1,
-0.6075065, 1.088497, -0.6417176, 0.5137255, 1, 0, 1,
-0.6064246, 0.1710586, 0.3463955, 0.5058824, 1, 0, 1,
-0.5990095, -1.018672, -1.50318, 0.5019608, 1, 0, 1,
-0.5979584, -0.4238013, -2.300521, 0.4941176, 1, 0, 1,
-0.5973359, -1.528232, -1.421078, 0.4862745, 1, 0, 1,
-0.5973073, 0.2198589, -0.7438464, 0.4823529, 1, 0, 1,
-0.5942225, -0.5153188, -0.8501888, 0.4745098, 1, 0, 1,
-0.5921383, 1.102097, -1.558191, 0.4705882, 1, 0, 1,
-0.5870873, 0.4874193, -0.1679012, 0.4627451, 1, 0, 1,
-0.5870612, 0.5357268, -0.465331, 0.4588235, 1, 0, 1,
-0.5793344, 0.3608105, -1.141682, 0.4509804, 1, 0, 1,
-0.5778207, 1.098081, -0.3245942, 0.4470588, 1, 0, 1,
-0.5772167, -0.3122841, -4.056555, 0.4392157, 1, 0, 1,
-0.5768102, 1.505209, -0.7546321, 0.4352941, 1, 0, 1,
-0.5738506, -0.1079697, -1.490135, 0.427451, 1, 0, 1,
-0.5688915, -0.7023936, -1.423752, 0.4235294, 1, 0, 1,
-0.5686247, 1.051531, -2.249375, 0.4156863, 1, 0, 1,
-0.5681285, -0.2313292, -1.496628, 0.4117647, 1, 0, 1,
-0.5643753, 2.108284, -0.2068924, 0.4039216, 1, 0, 1,
-0.5623424, -0.7968287, -3.778494, 0.3960784, 1, 0, 1,
-0.5574487, 0.05211152, -1.551011, 0.3921569, 1, 0, 1,
-0.5548506, 1.694247, 0.3170809, 0.3843137, 1, 0, 1,
-0.55441, 0.06746107, -1.283566, 0.3803922, 1, 0, 1,
-0.5514343, 1.088505, -2.379048, 0.372549, 1, 0, 1,
-0.5476125, 0.9939417, -0.1953007, 0.3686275, 1, 0, 1,
-0.5470017, 0.6467686, -0.2565674, 0.3607843, 1, 0, 1,
-0.5469937, -0.7998822, -2.651608, 0.3568628, 1, 0, 1,
-0.5430786, 2.020766, -0.7267023, 0.3490196, 1, 0, 1,
-0.541715, 0.1034432, -1.755879, 0.345098, 1, 0, 1,
-0.5307284, 0.07461976, -2.505907, 0.3372549, 1, 0, 1,
-0.5249234, 0.8745561, -0.5564672, 0.3333333, 1, 0, 1,
-0.5238837, -1.910184, -2.412833, 0.3254902, 1, 0, 1,
-0.5135781, 0.6183937, -3.912262, 0.3215686, 1, 0, 1,
-0.5107234, 0.1491961, -1.967716, 0.3137255, 1, 0, 1,
-0.5076592, 0.2326428, -2.295886, 0.3098039, 1, 0, 1,
-0.502422, 1.174406, 0.5886328, 0.3019608, 1, 0, 1,
-0.5016868, -0.3364728, -1.860597, 0.2941177, 1, 0, 1,
-0.5003897, 0.9508832, -1.179688, 0.2901961, 1, 0, 1,
-0.4996607, 0.01391372, -0.6532882, 0.282353, 1, 0, 1,
-0.4992657, -0.7676362, -2.801839, 0.2784314, 1, 0, 1,
-0.4977036, 0.5558226, -0.04141034, 0.2705882, 1, 0, 1,
-0.4935313, 0.8964387, -1.503528, 0.2666667, 1, 0, 1,
-0.4879578, 2.717233, -0.2234947, 0.2588235, 1, 0, 1,
-0.485071, 0.6473526, -0.8468165, 0.254902, 1, 0, 1,
-0.4840032, -0.7495592, -3.177942, 0.2470588, 1, 0, 1,
-0.4816476, 0.7883281, -2.258432, 0.2431373, 1, 0, 1,
-0.4815945, -0.0886113, -2.067604, 0.2352941, 1, 0, 1,
-0.4806866, 0.04715378, -0.1757454, 0.2313726, 1, 0, 1,
-0.4799622, 1.357706, -1.057306, 0.2235294, 1, 0, 1,
-0.4750929, 0.07817697, 0.1903921, 0.2196078, 1, 0, 1,
-0.4740764, 1.691544, 0.6126448, 0.2117647, 1, 0, 1,
-0.4733159, 1.241219, 0.3322044, 0.2078431, 1, 0, 1,
-0.4713449, 0.1951371, -2.240043, 0.2, 1, 0, 1,
-0.4653543, 1.55009, 0.6523865, 0.1921569, 1, 0, 1,
-0.4631466, -1.140588, -3.346758, 0.1882353, 1, 0, 1,
-0.4619367, 0.6694371, 0.166372, 0.1803922, 1, 0, 1,
-0.4600171, 0.05152209, 1.699325, 0.1764706, 1, 0, 1,
-0.454319, -0.1084909, -1.348138, 0.1686275, 1, 0, 1,
-0.4482964, -0.8483493, -4.174304, 0.1647059, 1, 0, 1,
-0.4448785, -0.001089158, -2.538945, 0.1568628, 1, 0, 1,
-0.4387385, -0.2672659, -1.124156, 0.1529412, 1, 0, 1,
-0.4355481, 1.030193, 0.7247568, 0.145098, 1, 0, 1,
-0.434804, -1.283559, -2.721752, 0.1411765, 1, 0, 1,
-0.4346687, 0.02686651, -2.522839, 0.1333333, 1, 0, 1,
-0.4314848, 0.9227858, -0.04406535, 0.1294118, 1, 0, 1,
-0.4270322, -1.376762, -3.144009, 0.1215686, 1, 0, 1,
-0.4263364, 0.2147507, -0.08190688, 0.1176471, 1, 0, 1,
-0.4246314, 0.2346763, 0.5078987, 0.1098039, 1, 0, 1,
-0.4228782, -1.392305, -3.375844, 0.1058824, 1, 0, 1,
-0.4194411, 0.313197, 0.1679316, 0.09803922, 1, 0, 1,
-0.4188872, 1.354645, -0.1752459, 0.09019608, 1, 0, 1,
-0.4169121, -1.182444, -3.054641, 0.08627451, 1, 0, 1,
-0.4111935, 0.8149871, -1.183814, 0.07843138, 1, 0, 1,
-0.4077213, -1.089107, -3.108453, 0.07450981, 1, 0, 1,
-0.4072947, -1.02108, -3.247401, 0.06666667, 1, 0, 1,
-0.4049859, 0.6969674, 0.1686249, 0.0627451, 1, 0, 1,
-0.4046401, -0.5684029, -2.478029, 0.05490196, 1, 0, 1,
-0.3961444, -0.8669845, -3.431059, 0.05098039, 1, 0, 1,
-0.3947443, 0.2608631, -1.24236, 0.04313726, 1, 0, 1,
-0.3929924, -1.677661, -1.957887, 0.03921569, 1, 0, 1,
-0.3913424, -1.814926, -3.480436, 0.03137255, 1, 0, 1,
-0.3865652, -0.3071824, -0.406569, 0.02745098, 1, 0, 1,
-0.3813007, -0.4806717, -2.458172, 0.01960784, 1, 0, 1,
-0.3808599, 1.611442, -1.179638, 0.01568628, 1, 0, 1,
-0.3784317, -1.278409, -3.143203, 0.007843138, 1, 0, 1,
-0.3774415, -0.6010922, -2.970972, 0.003921569, 1, 0, 1,
-0.3752377, -0.3015804, -0.5212514, 0, 1, 0.003921569, 1,
-0.3722478, 0.7326472, -0.2762648, 0, 1, 0.01176471, 1,
-0.3716274, 1.39491, -0.004182659, 0, 1, 0.01568628, 1,
-0.3686142, 0.7335995, -0.06472381, 0, 1, 0.02352941, 1,
-0.3682167, -1.402245, -1.15762, 0, 1, 0.02745098, 1,
-0.3573944, -0.008207829, -0.3149103, 0, 1, 0.03529412, 1,
-0.3557664, 0.08009479, -0.9904955, 0, 1, 0.03921569, 1,
-0.3539646, -0.09804337, -1.937058, 0, 1, 0.04705882, 1,
-0.3515835, 0.8302717, -0.0374813, 0, 1, 0.05098039, 1,
-0.3504645, 0.4897255, 0.9914712, 0, 1, 0.05882353, 1,
-0.3504035, -2.113005, -1.032948, 0, 1, 0.0627451, 1,
-0.3472809, -0.2371729, 0.9913794, 0, 1, 0.07058824, 1,
-0.3376928, 1.384723, 1.388478, 0, 1, 0.07450981, 1,
-0.3367292, 3.520885, 2.275859, 0, 1, 0.08235294, 1,
-0.335295, -0.8524083, -2.808064, 0, 1, 0.08627451, 1,
-0.3324578, -1.977878, -4.259776, 0, 1, 0.09411765, 1,
-0.3320796, -1.33185, -2.114396, 0, 1, 0.1019608, 1,
-0.3290593, 0.1335443, -1.935125, 0, 1, 0.1058824, 1,
-0.3283932, -0.06851193, -2.59811, 0, 1, 0.1137255, 1,
-0.3270986, -0.8881785, -3.809017, 0, 1, 0.1176471, 1,
-0.3253261, 1.715377, -1.616187, 0, 1, 0.1254902, 1,
-0.324627, 0.7694172, -0.5122837, 0, 1, 0.1294118, 1,
-0.321264, 0.01569194, -2.176437, 0, 1, 0.1372549, 1,
-0.3183527, -0.9846682, -2.843354, 0, 1, 0.1411765, 1,
-0.3175886, -0.5350609, -2.678714, 0, 1, 0.1490196, 1,
-0.3119691, 0.5069348, -1.522538, 0, 1, 0.1529412, 1,
-0.3094617, -0.6552382, -2.209525, 0, 1, 0.1607843, 1,
-0.3068279, 1.293191, 0.3030772, 0, 1, 0.1647059, 1,
-0.3064188, 0.8653412, -0.01580016, 0, 1, 0.172549, 1,
-0.2971646, 0.1270974, -0.4668211, 0, 1, 0.1764706, 1,
-0.2958207, 1.18949, -0.282135, 0, 1, 0.1843137, 1,
-0.2925117, -0.1108262, -1.872285, 0, 1, 0.1882353, 1,
-0.2902026, 0.2257189, -1.985652, 0, 1, 0.1960784, 1,
-0.2883613, 2.02748, 0.2082375, 0, 1, 0.2039216, 1,
-0.2831405, 2.127438, -1.993438, 0, 1, 0.2078431, 1,
-0.2826962, -1.233142, -2.322307, 0, 1, 0.2156863, 1,
-0.2819636, -0.4061233, -1.55996, 0, 1, 0.2196078, 1,
-0.2817473, 0.4966085, -2.017888, 0, 1, 0.227451, 1,
-0.2770128, 0.5735816, 0.2404409, 0, 1, 0.2313726, 1,
-0.2758591, -0.5648586, -3.362962, 0, 1, 0.2392157, 1,
-0.2733924, 0.09485634, -1.122688, 0, 1, 0.2431373, 1,
-0.2720791, -2.72824, -4.656538, 0, 1, 0.2509804, 1,
-0.2715841, 1.360827, 0.0006273835, 0, 1, 0.254902, 1,
-0.2678812, 0.01966439, -2.363698, 0, 1, 0.2627451, 1,
-0.2663066, 0.5112178, 1.326131, 0, 1, 0.2666667, 1,
-0.2658671, 1.571893, -1.956971, 0, 1, 0.2745098, 1,
-0.2629655, 0.940084, -0.1525044, 0, 1, 0.2784314, 1,
-0.2620846, 1.265183, 0.4654897, 0, 1, 0.2862745, 1,
-0.2615175, -0.6478948, -3.018321, 0, 1, 0.2901961, 1,
-0.26091, 0.5974736, -0.9124071, 0, 1, 0.2980392, 1,
-0.2584789, -0.5362181, -1.66593, 0, 1, 0.3058824, 1,
-0.25444, 1.208498, -0.1891491, 0, 1, 0.3098039, 1,
-0.2499934, 2.00672, -0.3380073, 0, 1, 0.3176471, 1,
-0.249485, -0.4886083, -3.062856, 0, 1, 0.3215686, 1,
-0.2485702, 0.1844353, 0.8088027, 0, 1, 0.3294118, 1,
-0.2480115, 1.37564, -0.06266184, 0, 1, 0.3333333, 1,
-0.2448176, 1.255948, 1.235069, 0, 1, 0.3411765, 1,
-0.244679, -0.3598502, -2.220426, 0, 1, 0.345098, 1,
-0.2389306, -0.612354, -2.788467, 0, 1, 0.3529412, 1,
-0.2286278, 1.855936, -0.04015463, 0, 1, 0.3568628, 1,
-0.2273098, -0.07056402, -2.799303, 0, 1, 0.3647059, 1,
-0.2261839, -0.1594529, -1.414088, 0, 1, 0.3686275, 1,
-0.2201858, 0.2291769, -0.5312039, 0, 1, 0.3764706, 1,
-0.2143453, 0.2107134, -0.1448348, 0, 1, 0.3803922, 1,
-0.2135171, -0.9447363, -3.723901, 0, 1, 0.3882353, 1,
-0.2107059, -1.14252, -2.823397, 0, 1, 0.3921569, 1,
-0.2088379, -1.172451, -3.901192, 0, 1, 0.4, 1,
-0.2085759, -0.6167008, -4.024887, 0, 1, 0.4078431, 1,
-0.2072827, 0.8276336, -1.223004, 0, 1, 0.4117647, 1,
-0.2067479, -1.188317, -2.127303, 0, 1, 0.4196078, 1,
-0.2047762, -0.4738126, -4.108318, 0, 1, 0.4235294, 1,
-0.203663, 0.6432629, -0.5993389, 0, 1, 0.4313726, 1,
-0.2017715, 0.01921009, -2.716365, 0, 1, 0.4352941, 1,
-0.1973063, 0.2885474, -1.459648, 0, 1, 0.4431373, 1,
-0.1929495, -0.3741565, -3.581767, 0, 1, 0.4470588, 1,
-0.1875553, -2.655428, -4.236227, 0, 1, 0.454902, 1,
-0.185582, 1.029115, 0.4887684, 0, 1, 0.4588235, 1,
-0.1846336, 1.104726, -0.6646649, 0, 1, 0.4666667, 1,
-0.1820258, 0.02436842, -1.851988, 0, 1, 0.4705882, 1,
-0.1808502, 0.192307, -1.756354, 0, 1, 0.4784314, 1,
-0.180768, -0.797547, -2.800167, 0, 1, 0.4823529, 1,
-0.1771563, 0.3422631, -1.164691, 0, 1, 0.4901961, 1,
-0.1770896, 0.09925213, -1.192724, 0, 1, 0.4941176, 1,
-0.170869, 1.171257, -0.3644077, 0, 1, 0.5019608, 1,
-0.1654068, 0.3132249, -0.02422243, 0, 1, 0.509804, 1,
-0.1642094, -1.468646, -3.32864, 0, 1, 0.5137255, 1,
-0.1636683, -0.007674807, -1.624695, 0, 1, 0.5215687, 1,
-0.1629187, 0.4892696, -1.591759, 0, 1, 0.5254902, 1,
-0.1617213, 0.01738985, -1.799009, 0, 1, 0.5333334, 1,
-0.1616425, 0.9833062, -1.188948, 0, 1, 0.5372549, 1,
-0.1605269, 2.756906, -0.651848, 0, 1, 0.5450981, 1,
-0.158635, 0.8146147, -1.690133, 0, 1, 0.5490196, 1,
-0.1583742, -0.6229607, -2.306903, 0, 1, 0.5568628, 1,
-0.1582632, 0.5384773, -0.9668664, 0, 1, 0.5607843, 1,
-0.1562918, -0.4542659, -3.236076, 0, 1, 0.5686275, 1,
-0.1528301, -0.433593, -1.034586, 0, 1, 0.572549, 1,
-0.1509865, -1.823308, -3.089713, 0, 1, 0.5803922, 1,
-0.1465718, 0.789124, -0.4681331, 0, 1, 0.5843138, 1,
-0.145972, 0.7587021, 0.1028349, 0, 1, 0.5921569, 1,
-0.1404006, 0.1059211, -0.3342366, 0, 1, 0.5960785, 1,
-0.1358741, -0.5881388, -3.198476, 0, 1, 0.6039216, 1,
-0.1357679, -1.53086, -3.110667, 0, 1, 0.6117647, 1,
-0.1332525, -0.7410986, -5.029212, 0, 1, 0.6156863, 1,
-0.1209119, -1.09858, -3.245159, 0, 1, 0.6235294, 1,
-0.1201756, 0.9868594, 0.981698, 0, 1, 0.627451, 1,
-0.1179193, -0.2151508, -4.33909, 0, 1, 0.6352941, 1,
-0.1177868, -0.5316848, -2.199722, 0, 1, 0.6392157, 1,
-0.1169401, -0.3195252, -3.025542, 0, 1, 0.6470588, 1,
-0.1160967, 0.4503411, -0.1734799, 0, 1, 0.6509804, 1,
-0.1150732, 0.548605, 1.175756, 0, 1, 0.6588235, 1,
-0.1147435, -0.7906485, -3.038064, 0, 1, 0.6627451, 1,
-0.1132029, -0.1453634, -3.278118, 0, 1, 0.6705883, 1,
-0.1067977, -0.9748943, -3.520923, 0, 1, 0.6745098, 1,
-0.09889903, 0.2542507, 0.6780592, 0, 1, 0.682353, 1,
-0.09802175, 1.623342, -0.1107522, 0, 1, 0.6862745, 1,
-0.09584592, 1.325288, 1.122161, 0, 1, 0.6941177, 1,
-0.09578872, 0.3671763, 0.8578296, 0, 1, 0.7019608, 1,
-0.09431018, -0.2494778, -2.098925, 0, 1, 0.7058824, 1,
-0.08982904, 0.7286738, 0.7550755, 0, 1, 0.7137255, 1,
-0.08567596, -0.6459659, -1.629826, 0, 1, 0.7176471, 1,
-0.08468885, 0.08089735, -0.799641, 0, 1, 0.7254902, 1,
-0.08432642, -0.5341922, -3.779967, 0, 1, 0.7294118, 1,
-0.08228839, -0.4302407, -3.431483, 0, 1, 0.7372549, 1,
-0.08169597, -0.9994458, -1.895749, 0, 1, 0.7411765, 1,
-0.07988842, 0.6298417, 2.026174, 0, 1, 0.7490196, 1,
-0.07412855, 1.334621, -0.4790386, 0, 1, 0.7529412, 1,
-0.07198719, -0.2190952, -2.083196, 0, 1, 0.7607843, 1,
-0.07076859, -0.4649938, -2.56546, 0, 1, 0.7647059, 1,
-0.06859227, -0.4589394, -3.189958, 0, 1, 0.772549, 1,
-0.06570499, -1.386911, -3.152981, 0, 1, 0.7764706, 1,
-0.06565698, 0.4421737, -1.585107, 0, 1, 0.7843137, 1,
-0.0635896, 1.042983, 0.9377096, 0, 1, 0.7882353, 1,
-0.05966857, 0.1292445, -2.344643, 0, 1, 0.7960784, 1,
-0.05440909, 0.8565233, -0.2328903, 0, 1, 0.8039216, 1,
-0.04612044, 0.9563323, -1.506791, 0, 1, 0.8078431, 1,
-0.04492262, 0.08060397, -1.229601, 0, 1, 0.8156863, 1,
-0.04215143, -0.7726108, -1.97801, 0, 1, 0.8196079, 1,
-0.03990632, 1.612937, 2.18932, 0, 1, 0.827451, 1,
-0.03526944, -0.02489324, -1.779961, 0, 1, 0.8313726, 1,
-0.0267112, 0.09857438, -1.763042, 0, 1, 0.8392157, 1,
-0.0259898, 0.3925818, 0.1697608, 0, 1, 0.8431373, 1,
-0.02543654, 2.495631, -1.593748, 0, 1, 0.8509804, 1,
-0.02176901, -0.3285536, -3.13852, 0, 1, 0.854902, 1,
-0.02035405, -0.9132977, -1.791677, 0, 1, 0.8627451, 1,
-0.01964179, 0.8841538, 1.277016, 0, 1, 0.8666667, 1,
-0.0155486, 0.6486757, 0.3222149, 0, 1, 0.8745098, 1,
-0.01404807, -1.246176, -3.683659, 0, 1, 0.8784314, 1,
-0.01386109, -0.5981398, -3.84626, 0, 1, 0.8862745, 1,
-0.01285129, -2.073772, -2.929052, 0, 1, 0.8901961, 1,
-0.01142343, 0.9962839, -0.4811859, 0, 1, 0.8980392, 1,
-0.01129794, -0.1674631, -4.83626, 0, 1, 0.9058824, 1,
-0.008274488, -0.4693626, -2.840636, 0, 1, 0.9098039, 1,
0.003539799, -0.8557115, 3.040119, 0, 1, 0.9176471, 1,
0.00798578, -0.9013789, 2.564306, 0, 1, 0.9215686, 1,
0.00868162, -0.02240361, 2.387521, 0, 1, 0.9294118, 1,
0.008722377, -0.8154349, 1.203621, 0, 1, 0.9333333, 1,
0.01075866, -1.054733, 2.761024, 0, 1, 0.9411765, 1,
0.01311558, 0.3288878, -0.3897186, 0, 1, 0.945098, 1,
0.01400083, -0.535313, 1.704012, 0, 1, 0.9529412, 1,
0.01536006, 1.874529, -0.433116, 0, 1, 0.9568627, 1,
0.01546321, -1.676725, 2.557053, 0, 1, 0.9647059, 1,
0.01675897, 0.03480766, 0.9309371, 0, 1, 0.9686275, 1,
0.01717444, -1.252389, 2.865924, 0, 1, 0.9764706, 1,
0.01902136, 0.354568, 1.39663, 0, 1, 0.9803922, 1,
0.01962965, -1.704042, 1.40386, 0, 1, 0.9882353, 1,
0.02045401, 0.228733, -0.2566869, 0, 1, 0.9921569, 1,
0.0235441, -1.019034, 4.939332, 0, 1, 1, 1,
0.02588595, 0.2434607, 0.70861, 0, 0.9921569, 1, 1,
0.02942602, 1.231503, -1.078959, 0, 0.9882353, 1, 1,
0.02943144, 0.371273, 1.944027, 0, 0.9803922, 1, 1,
0.03003681, 0.09951267, 1.665329, 0, 0.9764706, 1, 1,
0.0310076, 1.906519, 1.536969, 0, 0.9686275, 1, 1,
0.03371783, 1.973994, 0.8746216, 0, 0.9647059, 1, 1,
0.03462511, -0.5129855, 1.670853, 0, 0.9568627, 1, 1,
0.03494284, 0.4705374, -1.081072, 0, 0.9529412, 1, 1,
0.04016574, 0.2551599, 1.4544, 0, 0.945098, 1, 1,
0.04016773, 0.8039356, 0.6000729, 0, 0.9411765, 1, 1,
0.04685813, -0.2204481, 2.327608, 0, 0.9333333, 1, 1,
0.04837427, -0.3657078, 2.041962, 0, 0.9294118, 1, 1,
0.04839668, -0.4866776, 4.186351, 0, 0.9215686, 1, 1,
0.04988786, -1.645486, 3.65553, 0, 0.9176471, 1, 1,
0.05355439, -0.4693925, 3.240601, 0, 0.9098039, 1, 1,
0.05361453, -0.9903546, 2.687085, 0, 0.9058824, 1, 1,
0.05597727, 0.07437721, 1.284164, 0, 0.8980392, 1, 1,
0.05689927, -1.306009, 3.562012, 0, 0.8901961, 1, 1,
0.05758201, 1.996424, 0.77219, 0, 0.8862745, 1, 1,
0.05886966, -1.112714, 3.549983, 0, 0.8784314, 1, 1,
0.06534683, -1.678176, 3.127571, 0, 0.8745098, 1, 1,
0.06739113, 1.079989, -0.8511804, 0, 0.8666667, 1, 1,
0.06853998, 0.2235948, -0.5011635, 0, 0.8627451, 1, 1,
0.07585485, -2.28278, 2.44132, 0, 0.854902, 1, 1,
0.07903861, 1.165941, -0.5075449, 0, 0.8509804, 1, 1,
0.08050437, 0.1109024, 0.8841442, 0, 0.8431373, 1, 1,
0.08354276, -0.4744018, 1.203332, 0, 0.8392157, 1, 1,
0.08441703, 1.981742, -0.3097692, 0, 0.8313726, 1, 1,
0.08563547, -1.154966, 1.653811, 0, 0.827451, 1, 1,
0.08763495, 0.06173673, -0.1929488, 0, 0.8196079, 1, 1,
0.08881211, -0.8943487, 3.147439, 0, 0.8156863, 1, 1,
0.09193396, 0.8806814, -0.4687006, 0, 0.8078431, 1, 1,
0.09200171, 1.768229, -0.1490359, 0, 0.8039216, 1, 1,
0.09248281, -0.2720152, 1.660537, 0, 0.7960784, 1, 1,
0.09331609, -0.3538597, 2.929347, 0, 0.7882353, 1, 1,
0.09348325, -0.3488162, 2.446701, 0, 0.7843137, 1, 1,
0.09873177, 1.552982, 0.01671637, 0, 0.7764706, 1, 1,
0.09966319, 0.1962262, 1.22456, 0, 0.772549, 1, 1,
0.1106104, -0.5261027, 1.399645, 0, 0.7647059, 1, 1,
0.1149167, -0.8106496, 2.597644, 0, 0.7607843, 1, 1,
0.123216, 0.1696627, 0.7249749, 0, 0.7529412, 1, 1,
0.1277356, 1.126456, -0.283187, 0, 0.7490196, 1, 1,
0.1324979, -2.583654, 2.639069, 0, 0.7411765, 1, 1,
0.1329248, 0.03786721, 1.009462, 0, 0.7372549, 1, 1,
0.1339033, -1.127625, 0.2332453, 0, 0.7294118, 1, 1,
0.1345321, 0.4642353, -1.059457, 0, 0.7254902, 1, 1,
0.138256, -0.5447655, 2.450285, 0, 0.7176471, 1, 1,
0.1429822, -0.950325, 0.4379009, 0, 0.7137255, 1, 1,
0.1447055, 2.509861, -0.8796551, 0, 0.7058824, 1, 1,
0.1503496, -0.07664679, 1.874329, 0, 0.6980392, 1, 1,
0.1529673, -0.281617, 3.778606, 0, 0.6941177, 1, 1,
0.1542674, 0.02953738, 1.555987, 0, 0.6862745, 1, 1,
0.1547504, 0.6433234, -0.7110258, 0, 0.682353, 1, 1,
0.1562744, 0.5003183, 0.2199552, 0, 0.6745098, 1, 1,
0.1575135, 0.5628515, -0.4249688, 0, 0.6705883, 1, 1,
0.1674524, -0.8556174, 2.763739, 0, 0.6627451, 1, 1,
0.1683829, 1.964121, -1.782506, 0, 0.6588235, 1, 1,
0.1694368, 1.454856, -0.104296, 0, 0.6509804, 1, 1,
0.1758005, 0.3871428, -0.1215918, 0, 0.6470588, 1, 1,
0.1768778, 0.5706528, -1.778154, 0, 0.6392157, 1, 1,
0.1774754, -0.5241783, 2.515994, 0, 0.6352941, 1, 1,
0.1797157, -0.1613756, 2.524081, 0, 0.627451, 1, 1,
0.1797439, 1.521853, -0.7794767, 0, 0.6235294, 1, 1,
0.1819016, -1.335209, 3.403703, 0, 0.6156863, 1, 1,
0.1830294, -0.8667206, 3.867324, 0, 0.6117647, 1, 1,
0.1839374, 1.692806, -0.526769, 0, 0.6039216, 1, 1,
0.185839, -1.16869, 2.93178, 0, 0.5960785, 1, 1,
0.1861385, 2.198275, -1.147849, 0, 0.5921569, 1, 1,
0.1866307, -0.2060659, 3.46413, 0, 0.5843138, 1, 1,
0.1904762, -0.005572699, 2.004617, 0, 0.5803922, 1, 1,
0.191842, -0.01359167, 1.238774, 0, 0.572549, 1, 1,
0.1997721, -0.2551125, 3.410245, 0, 0.5686275, 1, 1,
0.2042523, 0.9079652, -0.7111914, 0, 0.5607843, 1, 1,
0.2064156, 0.9196924, 0.7912359, 0, 0.5568628, 1, 1,
0.2094983, -0.8562302, 2.436654, 0, 0.5490196, 1, 1,
0.2100674, -1.785104, 2.39444, 0, 0.5450981, 1, 1,
0.2134534, -1.123597, 2.339897, 0, 0.5372549, 1, 1,
0.2137029, -0.239628, 2.932743, 0, 0.5333334, 1, 1,
0.2166172, 0.2455556, 0.1465346, 0, 0.5254902, 1, 1,
0.2195468, -0.4524012, 3.05919, 0, 0.5215687, 1, 1,
0.2239734, -0.4229751, 2.030492, 0, 0.5137255, 1, 1,
0.2242308, -0.370086, 2.869425, 0, 0.509804, 1, 1,
0.2250834, -0.1199109, 2.83687, 0, 0.5019608, 1, 1,
0.225526, 0.1978574, 1.360531, 0, 0.4941176, 1, 1,
0.2311272, 1.656108, -0.4749752, 0, 0.4901961, 1, 1,
0.2337828, 0.455581, 1.181043, 0, 0.4823529, 1, 1,
0.2406783, -0.5051917, 3.74392, 0, 0.4784314, 1, 1,
0.2417386, -2.423171, 3.100734, 0, 0.4705882, 1, 1,
0.2418161, 0.44718, 0.1274179, 0, 0.4666667, 1, 1,
0.2437278, 1.435931, 0.6882378, 0, 0.4588235, 1, 1,
0.2475895, -0.9114935, 4.499496, 0, 0.454902, 1, 1,
0.250207, -1.289137, 1.09654, 0, 0.4470588, 1, 1,
0.2518096, 0.1612643, -0.5263009, 0, 0.4431373, 1, 1,
0.2525411, -2.416832, 4.440749, 0, 0.4352941, 1, 1,
0.2560226, -0.8099402, 2.309961, 0, 0.4313726, 1, 1,
0.258502, -0.6448396, 2.056475, 0, 0.4235294, 1, 1,
0.2592211, 0.08581905, 0.4547205, 0, 0.4196078, 1, 1,
0.2598109, 1.364139, 1.657979, 0, 0.4117647, 1, 1,
0.261389, 1.14755, 1.535636, 0, 0.4078431, 1, 1,
0.2650325, 1.702434, -0.9367546, 0, 0.4, 1, 1,
0.266307, 0.2788447, 0.6184949, 0, 0.3921569, 1, 1,
0.2673083, 0.7725201, 1.017131, 0, 0.3882353, 1, 1,
0.2676926, -1.990136, 2.579611, 0, 0.3803922, 1, 1,
0.2687649, 1.331379, -0.133573, 0, 0.3764706, 1, 1,
0.2729121, 0.8356633, 0.3536787, 0, 0.3686275, 1, 1,
0.273659, 2.616299, -0.2453641, 0, 0.3647059, 1, 1,
0.277277, -0.4076956, 1.237613, 0, 0.3568628, 1, 1,
0.2799346, 1.241654, -0.496575, 0, 0.3529412, 1, 1,
0.2824816, 1.227236, -1.410153, 0, 0.345098, 1, 1,
0.2892087, -0.5863156, 4.150176, 0, 0.3411765, 1, 1,
0.29072, 0.1802505, 0.8932914, 0, 0.3333333, 1, 1,
0.2940885, -0.5666802, 3.178699, 0, 0.3294118, 1, 1,
0.2967996, -0.7230753, 2.24314, 0, 0.3215686, 1, 1,
0.2986858, 0.963651, -1.415658, 0, 0.3176471, 1, 1,
0.2988866, 1.189628, 0.7094625, 0, 0.3098039, 1, 1,
0.2999483, 1.767222, -0.3816615, 0, 0.3058824, 1, 1,
0.299988, 0.7256278, -1.511276, 0, 0.2980392, 1, 1,
0.3030526, -1.277033, 2.852783, 0, 0.2901961, 1, 1,
0.3060827, 1.136856, -1.029087, 0, 0.2862745, 1, 1,
0.306134, -0.3415855, 2.678217, 0, 0.2784314, 1, 1,
0.3067342, -0.5830622, 2.184118, 0, 0.2745098, 1, 1,
0.3081308, -0.8014364, 3.749629, 0, 0.2666667, 1, 1,
0.3091878, -1.64619, 2.432361, 0, 0.2627451, 1, 1,
0.310392, -0.3467384, 1.106231, 0, 0.254902, 1, 1,
0.312388, 0.4684688, 0.4887321, 0, 0.2509804, 1, 1,
0.3140443, -0.01730714, 1.924051, 0, 0.2431373, 1, 1,
0.3150917, 0.9568995, 0.274564, 0, 0.2392157, 1, 1,
0.3202606, -0.3021024, 1.887937, 0, 0.2313726, 1, 1,
0.3215952, 1.622553, -0.3346607, 0, 0.227451, 1, 1,
0.3307591, 0.009343898, 3.686721, 0, 0.2196078, 1, 1,
0.3317607, -0.8271222, 2.603093, 0, 0.2156863, 1, 1,
0.3318215, -1.486391, 4.35387, 0, 0.2078431, 1, 1,
0.3337003, -0.6957993, 1.013804, 0, 0.2039216, 1, 1,
0.3341225, 0.6650796, -0.3175379, 0, 0.1960784, 1, 1,
0.3346582, -0.0824577, 1.640923, 0, 0.1882353, 1, 1,
0.335076, -0.9176676, 2.440904, 0, 0.1843137, 1, 1,
0.3398739, 1.180619, 1.443477, 0, 0.1764706, 1, 1,
0.3436758, -0.2612189, 2.151953, 0, 0.172549, 1, 1,
0.3478719, 0.6227865, 1.047082, 0, 0.1647059, 1, 1,
0.3500968, 0.2143794, 1.732232, 0, 0.1607843, 1, 1,
0.3504495, -0.7410722, 2.981904, 0, 0.1529412, 1, 1,
0.3515655, -0.4537444, 1.869563, 0, 0.1490196, 1, 1,
0.3538544, 0.3824357, 1.34868, 0, 0.1411765, 1, 1,
0.3557403, -1.606402, 3.99352, 0, 0.1372549, 1, 1,
0.3558942, 1.600588, -0.7241085, 0, 0.1294118, 1, 1,
0.3592448, 0.9435349, -1.446835, 0, 0.1254902, 1, 1,
0.3598898, -0.8413507, 1.12642, 0, 0.1176471, 1, 1,
0.3607557, -0.8611026, 2.76425, 0, 0.1137255, 1, 1,
0.362765, 1.401809, 0.5053539, 0, 0.1058824, 1, 1,
0.364277, 1.015804, -0.02338871, 0, 0.09803922, 1, 1,
0.3645133, -0.3643758, 2.054661, 0, 0.09411765, 1, 1,
0.367198, -0.6958812, 2.602725, 0, 0.08627451, 1, 1,
0.3793768, -1.225904, 2.721475, 0, 0.08235294, 1, 1,
0.3799831, 0.9001019, -0.6677344, 0, 0.07450981, 1, 1,
0.380596, -0.2562671, 2.520485, 0, 0.07058824, 1, 1,
0.3816685, -0.8554183, 2.61204, 0, 0.0627451, 1, 1,
0.3829291, 1.888888, -0.9139179, 0, 0.05882353, 1, 1,
0.3880941, -1.337412, 2.099806, 0, 0.05098039, 1, 1,
0.3891099, -1.863838, 2.438984, 0, 0.04705882, 1, 1,
0.3930832, -0.09156796, 2.841238, 0, 0.03921569, 1, 1,
0.3945997, 0.1910452, 1.957041, 0, 0.03529412, 1, 1,
0.394683, 0.149379, -0.590699, 0, 0.02745098, 1, 1,
0.3947393, -0.836804, 1.955419, 0, 0.02352941, 1, 1,
0.3959179, -0.7739985, 1.770413, 0, 0.01568628, 1, 1,
0.3960383, -0.6072986, 2.664075, 0, 0.01176471, 1, 1,
0.3967811, 2.129375, 1.144071, 0, 0.003921569, 1, 1,
0.397503, 0.1233557, 0.4869373, 0.003921569, 0, 1, 1,
0.4080938, 0.09878074, 2.483055, 0.007843138, 0, 1, 1,
0.4158672, 0.8327984, -0.7972496, 0.01568628, 0, 1, 1,
0.4159815, 1.45235, 0.590479, 0.01960784, 0, 1, 1,
0.4162588, 0.275681, 2.299368, 0.02745098, 0, 1, 1,
0.4168045, 2.254154, 0.2989894, 0.03137255, 0, 1, 1,
0.4170016, 2.11793, 0.3956235, 0.03921569, 0, 1, 1,
0.4188189, 0.1922535, -0.2758577, 0.04313726, 0, 1, 1,
0.4190868, 0.6605716, 1.380189, 0.05098039, 0, 1, 1,
0.4193695, -0.2785558, 0.9587334, 0.05490196, 0, 1, 1,
0.4210011, -0.2858324, 2.830615, 0.0627451, 0, 1, 1,
0.4231773, 0.6565824, 1.949355, 0.06666667, 0, 1, 1,
0.4278159, 0.7822292, 0.9070508, 0.07450981, 0, 1, 1,
0.4293836, -1.314755, 2.688332, 0.07843138, 0, 1, 1,
0.4297661, -0.1434951, 2.294869, 0.08627451, 0, 1, 1,
0.4300382, 1.436565, -1.234749, 0.09019608, 0, 1, 1,
0.4303954, 0.470791, -0.3603363, 0.09803922, 0, 1, 1,
0.4310976, -0.3624145, 2.157144, 0.1058824, 0, 1, 1,
0.436727, -0.4732083, 3.035055, 0.1098039, 0, 1, 1,
0.4408431, -0.09456597, 3.284059, 0.1176471, 0, 1, 1,
0.4435126, 1.196049, 1.326057, 0.1215686, 0, 1, 1,
0.4449764, 0.8166396, 0.2471508, 0.1294118, 0, 1, 1,
0.449542, 2.384018, 1.747705, 0.1333333, 0, 1, 1,
0.45245, 0.4333685, 1.00863, 0.1411765, 0, 1, 1,
0.4588539, -0.6272675, 2.46323, 0.145098, 0, 1, 1,
0.46066, -0.6079553, 1.2062, 0.1529412, 0, 1, 1,
0.4647391, 0.008213411, 0.3088867, 0.1568628, 0, 1, 1,
0.4659991, 1.104442, 1.22143, 0.1647059, 0, 1, 1,
0.4667991, -0.1273085, 2.217505, 0.1686275, 0, 1, 1,
0.4683558, 0.2161489, 1.554453, 0.1764706, 0, 1, 1,
0.4686582, 0.203897, 0.9401619, 0.1803922, 0, 1, 1,
0.4714327, 0.2143491, 2.785825, 0.1882353, 0, 1, 1,
0.477026, -0.3485751, 0.6776712, 0.1921569, 0, 1, 1,
0.4874116, -0.0797459, 2.423568, 0.2, 0, 1, 1,
0.488117, 1.006547, 0.02723194, 0.2078431, 0, 1, 1,
0.4891983, 0.1500497, 0.01005344, 0.2117647, 0, 1, 1,
0.4975547, -1.099524, 2.4428, 0.2196078, 0, 1, 1,
0.509109, -0.7844687, 2.241234, 0.2235294, 0, 1, 1,
0.5144802, 0.314502, -0.3771516, 0.2313726, 0, 1, 1,
0.5160307, 0.3121873, 1.371261, 0.2352941, 0, 1, 1,
0.5194381, -0.8855995, 1.199267, 0.2431373, 0, 1, 1,
0.5206265, 0.04940386, -0.6365234, 0.2470588, 0, 1, 1,
0.5280101, 1.574594, 1.867022, 0.254902, 0, 1, 1,
0.5325164, -0.9314032, 4.547888, 0.2588235, 0, 1, 1,
0.5332164, -0.2440221, 0.966948, 0.2666667, 0, 1, 1,
0.5344146, 1.939624, -0.2889175, 0.2705882, 0, 1, 1,
0.5386008, 1.604202, 1.217544, 0.2784314, 0, 1, 1,
0.5412267, 0.09668603, 1.439625, 0.282353, 0, 1, 1,
0.5444173, -0.2885955, 2.920016, 0.2901961, 0, 1, 1,
0.5445945, -0.3486228, 3.419931, 0.2941177, 0, 1, 1,
0.5478701, -0.234908, 2.264037, 0.3019608, 0, 1, 1,
0.5482019, -0.4964448, 1.978048, 0.3098039, 0, 1, 1,
0.5487251, 0.5449702, 2.228675, 0.3137255, 0, 1, 1,
0.558805, 0.3899469, 1.371636, 0.3215686, 0, 1, 1,
0.5639876, 1.328815, 1.431949, 0.3254902, 0, 1, 1,
0.571184, -0.5624614, 2.984284, 0.3333333, 0, 1, 1,
0.5721611, -0.8388863, 3.592975, 0.3372549, 0, 1, 1,
0.5735083, 1.779025, -0.3556755, 0.345098, 0, 1, 1,
0.5755008, 1.240227, -1.997866, 0.3490196, 0, 1, 1,
0.5765432, 0.2671689, 2.3532, 0.3568628, 0, 1, 1,
0.5778465, -0.1927725, 3.17596, 0.3607843, 0, 1, 1,
0.5798679, -0.2100897, -0.08403096, 0.3686275, 0, 1, 1,
0.5892002, 1.65586, 1.009272, 0.372549, 0, 1, 1,
0.5906335, 0.3509058, 1.769501, 0.3803922, 0, 1, 1,
0.5966298, 0.3651904, 1.036123, 0.3843137, 0, 1, 1,
0.5966939, 0.8669386, -0.1105361, 0.3921569, 0, 1, 1,
0.5987071, -0.08500668, 2.532187, 0.3960784, 0, 1, 1,
0.5989714, -1.695537, 3.071153, 0.4039216, 0, 1, 1,
0.5999154, 0.1777666, 1.12037, 0.4117647, 0, 1, 1,
0.6035805, -0.0208963, 2.121233, 0.4156863, 0, 1, 1,
0.6054393, -0.1030096, 3.556717, 0.4235294, 0, 1, 1,
0.6062444, -0.02071144, 3.020277, 0.427451, 0, 1, 1,
0.6069057, -0.7393001, 1.398389, 0.4352941, 0, 1, 1,
0.6089566, -1.733938, 2.36663, 0.4392157, 0, 1, 1,
0.6214049, 0.3619063, 0.4643401, 0.4470588, 0, 1, 1,
0.6214194, -0.314389, 1.562528, 0.4509804, 0, 1, 1,
0.6231651, -0.3268234, -0.01087802, 0.4588235, 0, 1, 1,
0.6252496, -0.02898828, 1.55212, 0.4627451, 0, 1, 1,
0.6312244, -0.1027688, 1.214544, 0.4705882, 0, 1, 1,
0.6333575, -0.1436106, 1.205962, 0.4745098, 0, 1, 1,
0.6370629, -2.486984, 2.12218, 0.4823529, 0, 1, 1,
0.6383496, 0.9165617, -0.1599791, 0.4862745, 0, 1, 1,
0.6388216, 0.700447, -0.08508399, 0.4941176, 0, 1, 1,
0.6409301, 0.2473127, 0.9617167, 0.5019608, 0, 1, 1,
0.656001, 0.8943725, 0.8949193, 0.5058824, 0, 1, 1,
0.6569687, 0.2402972, -0.6967796, 0.5137255, 0, 1, 1,
0.6604807, -0.6746813, 2.809541, 0.5176471, 0, 1, 1,
0.660947, 2.493549, 0.2523696, 0.5254902, 0, 1, 1,
0.6617665, 0.883446, 0.72127, 0.5294118, 0, 1, 1,
0.6681171, 1.615406, -0.2125729, 0.5372549, 0, 1, 1,
0.6681275, 0.1467277, 2.815125, 0.5411765, 0, 1, 1,
0.6773126, 0.1052984, 2.327086, 0.5490196, 0, 1, 1,
0.6774331, 0.7033707, 0.9901136, 0.5529412, 0, 1, 1,
0.6851032, 0.94672, -1.479465, 0.5607843, 0, 1, 1,
0.6875196, -1.020244, 2.88763, 0.5647059, 0, 1, 1,
0.6903543, 0.5692481, 0.1074086, 0.572549, 0, 1, 1,
0.6927716, -1.113312, 1.107693, 0.5764706, 0, 1, 1,
0.6951547, 1.758326, -0.7710475, 0.5843138, 0, 1, 1,
0.6956646, -0.07045821, 0.7141891, 0.5882353, 0, 1, 1,
0.7075983, -1.047892, 2.886658, 0.5960785, 0, 1, 1,
0.7163873, 0.7030293, 0.58321, 0.6039216, 0, 1, 1,
0.7166145, 1.510399, 2.952483, 0.6078432, 0, 1, 1,
0.7175649, -0.7289228, 1.595785, 0.6156863, 0, 1, 1,
0.7184941, -0.391219, 2.328841, 0.6196079, 0, 1, 1,
0.7307087, 0.06540441, 2.119351, 0.627451, 0, 1, 1,
0.7362572, 1.603694, 0.006553572, 0.6313726, 0, 1, 1,
0.7377636, -1.479263, 2.96905, 0.6392157, 0, 1, 1,
0.7397107, 0.4236558, 0.5703959, 0.6431373, 0, 1, 1,
0.7400611, -0.6378765, 1.748722, 0.6509804, 0, 1, 1,
0.7409996, 1.873106, 0.3194721, 0.654902, 0, 1, 1,
0.7458733, 0.323265, 2.035636, 0.6627451, 0, 1, 1,
0.7466564, -1.968264, 3.275651, 0.6666667, 0, 1, 1,
0.7482775, 0.9371725, 0.836495, 0.6745098, 0, 1, 1,
0.7533762, 1.208028, -0.1520543, 0.6784314, 0, 1, 1,
0.7563159, 1.527696, 0.3341676, 0.6862745, 0, 1, 1,
0.7601995, -0.4689674, 2.092152, 0.6901961, 0, 1, 1,
0.7633373, -0.6952773, 2.715296, 0.6980392, 0, 1, 1,
0.7657482, -0.06834324, -0.4283229, 0.7058824, 0, 1, 1,
0.7689072, -1.418931, 0.1077214, 0.7098039, 0, 1, 1,
0.7694296, 0.5272595, 1.622092, 0.7176471, 0, 1, 1,
0.7740331, -0.7844756, 3.908579, 0.7215686, 0, 1, 1,
0.7748789, -2.03153, 2.760367, 0.7294118, 0, 1, 1,
0.7831988, -0.6769344, 3.211271, 0.7333333, 0, 1, 1,
0.7875508, 1.80205, -1.019818, 0.7411765, 0, 1, 1,
0.7892374, 1.365582, -0.4636109, 0.7450981, 0, 1, 1,
0.7961517, 0.07893903, 1.672893, 0.7529412, 0, 1, 1,
0.7966665, -0.07753378, 3.85512, 0.7568628, 0, 1, 1,
0.7969302, 0.4294438, 1.034576, 0.7647059, 0, 1, 1,
0.7983741, -0.4336762, 1.959555, 0.7686275, 0, 1, 1,
0.8030919, -0.7565488, 3.877228, 0.7764706, 0, 1, 1,
0.8032389, -1.063908, 1.663754, 0.7803922, 0, 1, 1,
0.8040006, 1.30718, -0.1440692, 0.7882353, 0, 1, 1,
0.8114352, 0.6352224, 1.727957, 0.7921569, 0, 1, 1,
0.813241, -0.2322202, 1.41967, 0.8, 0, 1, 1,
0.8138891, 0.9799065, -1.818318, 0.8078431, 0, 1, 1,
0.8220527, 1.584926, 0.8709684, 0.8117647, 0, 1, 1,
0.8229837, 0.09611353, 1.293194, 0.8196079, 0, 1, 1,
0.8354655, 1.7921, -0.1500826, 0.8235294, 0, 1, 1,
0.8434209, 0.5986639, 1.901178, 0.8313726, 0, 1, 1,
0.8473387, -1.114382, 2.71302, 0.8352941, 0, 1, 1,
0.8500269, 0.152159, 2.065755, 0.8431373, 0, 1, 1,
0.862247, -0.9324421, 2.614954, 0.8470588, 0, 1, 1,
0.8699372, 0.3923183, 0.930377, 0.854902, 0, 1, 1,
0.8700443, 0.1594112, 2.676775, 0.8588235, 0, 1, 1,
0.8746673, 1.640829, 1.868567, 0.8666667, 0, 1, 1,
0.8765631, 1.158635, 0.3012738, 0.8705882, 0, 1, 1,
0.8791113, 1.369957, 0.1738587, 0.8784314, 0, 1, 1,
0.8864655, 2.09514, -0.6655262, 0.8823529, 0, 1, 1,
0.8876197, 0.5217849, 1.404453, 0.8901961, 0, 1, 1,
0.8909391, 0.9055741, 1.219567, 0.8941177, 0, 1, 1,
0.894634, 1.170453, 1.74241, 0.9019608, 0, 1, 1,
0.8963712, -0.07710068, 2.438302, 0.9098039, 0, 1, 1,
0.8968273, -0.8768291, 3.12277, 0.9137255, 0, 1, 1,
0.8998082, 0.4022858, 0.8227729, 0.9215686, 0, 1, 1,
0.9069483, 0.6827095, 2.626075, 0.9254902, 0, 1, 1,
0.910473, -0.2734537, 0.572484, 0.9333333, 0, 1, 1,
0.9136603, 2.221384, -1.916851, 0.9372549, 0, 1, 1,
0.9141735, 2.371627, -0.8325393, 0.945098, 0, 1, 1,
0.9187109, 0.8341235, 0.6974489, 0.9490196, 0, 1, 1,
0.92153, 0.434518, 0.4430361, 0.9568627, 0, 1, 1,
0.9223572, 0.246952, 1.141294, 0.9607843, 0, 1, 1,
0.9453568, 2.422955, 1.979686, 0.9686275, 0, 1, 1,
0.9454261, -2.608583, 4.07143, 0.972549, 0, 1, 1,
0.9521832, -1.035194, 3.392857, 0.9803922, 0, 1, 1,
0.9534909, 0.6288472, 0.6194361, 0.9843137, 0, 1, 1,
0.9595266, -0.2188172, 1.958524, 0.9921569, 0, 1, 1,
0.9663552, -1.277563, 3.687889, 0.9960784, 0, 1, 1,
0.9674033, 0.1710459, 1.179729, 1, 0, 0.9960784, 1,
0.9711435, -0.1024985, 1.892565, 1, 0, 0.9882353, 1,
0.9720716, -0.06295571, 1.800023, 1, 0, 0.9843137, 1,
0.9774724, -0.3304774, 1.67882, 1, 0, 0.9764706, 1,
0.9833029, -1.216114, 3.908628, 1, 0, 0.972549, 1,
0.9838242, -0.1008254, 3.665731, 1, 0, 0.9647059, 1,
0.9851681, 1.320932, 0.8632542, 1, 0, 0.9607843, 1,
0.9924147, -0.5446169, 1.833872, 1, 0, 0.9529412, 1,
0.9936749, 0.1892415, 1.960904, 1, 0, 0.9490196, 1,
1.00308, 0.5552649, 1.197486, 1, 0, 0.9411765, 1,
1.004519, 1.50852, 2.124393, 1, 0, 0.9372549, 1,
1.004879, 1.115409, 2.635396, 1, 0, 0.9294118, 1,
1.013739, -0.8634885, 2.038294, 1, 0, 0.9254902, 1,
1.015092, -1.032846, 1.34665, 1, 0, 0.9176471, 1,
1.017761, 0.8699094, 1.297222, 1, 0, 0.9137255, 1,
1.021908, -0.7423565, 3.377133, 1, 0, 0.9058824, 1,
1.030433, -0.9808287, 4.292357, 1, 0, 0.9019608, 1,
1.036204, -0.8485143, 1.844633, 1, 0, 0.8941177, 1,
1.042782, 0.1637415, 1.526986, 1, 0, 0.8862745, 1,
1.044102, 2.296355, 1.814089, 1, 0, 0.8823529, 1,
1.044478, -0.6738415, 2.914148, 1, 0, 0.8745098, 1,
1.046239, -1.009869, 1.175387, 1, 0, 0.8705882, 1,
1.055986, -0.6876832, 2.019193, 1, 0, 0.8627451, 1,
1.060136, -0.9844617, 2.875927, 1, 0, 0.8588235, 1,
1.060526, -0.0448662, 0.869925, 1, 0, 0.8509804, 1,
1.061424, 0.5868482, 0.6070656, 1, 0, 0.8470588, 1,
1.067552, 0.1131652, 0.6643075, 1, 0, 0.8392157, 1,
1.07917, 0.8227122, 1.927939, 1, 0, 0.8352941, 1,
1.083905, 1.078364, 1.431205, 1, 0, 0.827451, 1,
1.088064, -0.07358707, 1.992193, 1, 0, 0.8235294, 1,
1.091703, -0.4521663, 1.882288, 1, 0, 0.8156863, 1,
1.094118, 0.420858, 1.374307, 1, 0, 0.8117647, 1,
1.094877, -0.3118766, 0.4463374, 1, 0, 0.8039216, 1,
1.096374, 0.1248879, 2.454153, 1, 0, 0.7960784, 1,
1.100277, 0.8451252, 1.27698, 1, 0, 0.7921569, 1,
1.10308, -0.8324174, 1.64444, 1, 0, 0.7843137, 1,
1.112962, 0.1949732, 1.458593, 1, 0, 0.7803922, 1,
1.116062, 1.110166, 0.2962988, 1, 0, 0.772549, 1,
1.123273, -1.329794, 2.898833, 1, 0, 0.7686275, 1,
1.125871, 1.696132, -1.034391, 1, 0, 0.7607843, 1,
1.127951, -0.2562348, 2.395311, 1, 0, 0.7568628, 1,
1.130629, -0.9085217, 0.3365896, 1, 0, 0.7490196, 1,
1.133554, -1.44248, 2.226868, 1, 0, 0.7450981, 1,
1.13876, 1.040301, -2.81881, 1, 0, 0.7372549, 1,
1.139946, -0.8082129, 0.2311856, 1, 0, 0.7333333, 1,
1.142222, 0.8543286, 1.931902, 1, 0, 0.7254902, 1,
1.143786, 1.587306, -0.4673771, 1, 0, 0.7215686, 1,
1.144435, 0.1565751, -0.06800844, 1, 0, 0.7137255, 1,
1.151269, 0.5202238, 0.2909008, 1, 0, 0.7098039, 1,
1.15251, 1.17449, -0.6644991, 1, 0, 0.7019608, 1,
1.159443, 0.1417451, 0.8565415, 1, 0, 0.6941177, 1,
1.161259, 0.2641667, 1.391894, 1, 0, 0.6901961, 1,
1.173078, -0.03086596, 0.9327034, 1, 0, 0.682353, 1,
1.181555, -0.4812574, 1.449839, 1, 0, 0.6784314, 1,
1.190773, 0.01059414, -0.1280917, 1, 0, 0.6705883, 1,
1.19228, 0.8642437, 0.009756063, 1, 0, 0.6666667, 1,
1.197377, 0.6595687, -0.8750703, 1, 0, 0.6588235, 1,
1.19778, 0.1081551, 1.334247, 1, 0, 0.654902, 1,
1.200458, -1.667036, 2.373477, 1, 0, 0.6470588, 1,
1.200548, 1.153901, 1.386068, 1, 0, 0.6431373, 1,
1.217512, -2.351505, 3.224777, 1, 0, 0.6352941, 1,
1.220245, 0.689038, 0.5932497, 1, 0, 0.6313726, 1,
1.221347, 2.658503, -1.886494, 1, 0, 0.6235294, 1,
1.245555, -0.978136, 2.94412, 1, 0, 0.6196079, 1,
1.248188, 3.235566, 0.7093105, 1, 0, 0.6117647, 1,
1.264661, 0.38839, 2.084272, 1, 0, 0.6078432, 1,
1.266091, 0.744121, 1.062442, 1, 0, 0.6, 1,
1.281482, 0.3434508, 0.003278619, 1, 0, 0.5921569, 1,
1.284696, 0.6124403, 4.269772, 1, 0, 0.5882353, 1,
1.295726, 0.4319837, 2.370026, 1, 0, 0.5803922, 1,
1.297277, 0.2512828, 1.15373, 1, 0, 0.5764706, 1,
1.314458, -1.118044, 0.976024, 1, 0, 0.5686275, 1,
1.314759, -0.09069587, 1.074112, 1, 0, 0.5647059, 1,
1.320881, 0.2562862, 0.2052698, 1, 0, 0.5568628, 1,
1.323489, -0.5322787, 2.995309, 1, 0, 0.5529412, 1,
1.327319, 1.262437, 1.844563, 1, 0, 0.5450981, 1,
1.329088, 0.4579301, 0.5539579, 1, 0, 0.5411765, 1,
1.332251, -0.8197827, 2.63208, 1, 0, 0.5333334, 1,
1.350035, 0.526517, 0.6678022, 1, 0, 0.5294118, 1,
1.352439, -1.359001, 3.174401, 1, 0, 0.5215687, 1,
1.354569, 1.942261, -0.2152133, 1, 0, 0.5176471, 1,
1.355755, -0.1183002, 1.321839, 1, 0, 0.509804, 1,
1.361341, 0.08578364, 2.323198, 1, 0, 0.5058824, 1,
1.361347, -2.005192, 2.22335, 1, 0, 0.4980392, 1,
1.362653, -0.1534537, 0.5687452, 1, 0, 0.4901961, 1,
1.364793, -1.02053, 3.416688, 1, 0, 0.4862745, 1,
1.365361, -0.6862669, 0.9911055, 1, 0, 0.4784314, 1,
1.367042, -1.248359, 1.814451, 1, 0, 0.4745098, 1,
1.371356, -0.428961, 3.337886, 1, 0, 0.4666667, 1,
1.372989, 0.1508036, 1.979376, 1, 0, 0.4627451, 1,
1.377834, -0.457861, 1.841995, 1, 0, 0.454902, 1,
1.378501, -0.3369158, 0.8310458, 1, 0, 0.4509804, 1,
1.392294, 0.127999, 1.696073, 1, 0, 0.4431373, 1,
1.394818, -0.1995189, 0.2810681, 1, 0, 0.4392157, 1,
1.405651, 0.8140616, 1.68145, 1, 0, 0.4313726, 1,
1.40828, 0.8576242, 1.235036, 1, 0, 0.427451, 1,
1.409763, -0.4493458, 1.553257, 1, 0, 0.4196078, 1,
1.41639, -0.7805268, 1.722351, 1, 0, 0.4156863, 1,
1.429425, 2.613299, -0.5957486, 1, 0, 0.4078431, 1,
1.432714, -0.1962359, 2.35639, 1, 0, 0.4039216, 1,
1.436313, 0.1870817, 2.487935, 1, 0, 0.3960784, 1,
1.438147, 0.1839951, -0.1824314, 1, 0, 0.3882353, 1,
1.454789, 0.608868, 2.624463, 1, 0, 0.3843137, 1,
1.475389, -1.302555, 3.71488, 1, 0, 0.3764706, 1,
1.477571, 0.6356694, 3.301487, 1, 0, 0.372549, 1,
1.479489, -0.7023379, 1.201019, 1, 0, 0.3647059, 1,
1.481465, -0.05868609, 0.2530434, 1, 0, 0.3607843, 1,
1.496245, 1.363168, 0.6519357, 1, 0, 0.3529412, 1,
1.502219, -0.1714258, 0.6423534, 1, 0, 0.3490196, 1,
1.508665, -0.6406368, 0.8592489, 1, 0, 0.3411765, 1,
1.528751, -0.9661129, 1.922698, 1, 0, 0.3372549, 1,
1.540347, 0.8304266, 1.992364, 1, 0, 0.3294118, 1,
1.547352, 0.3283016, 1.18251, 1, 0, 0.3254902, 1,
1.555899, 0.4505604, -0.503346, 1, 0, 0.3176471, 1,
1.563147, 1.235072, 0.6263416, 1, 0, 0.3137255, 1,
1.634077, -1.184643, 3.305981, 1, 0, 0.3058824, 1,
1.656525, -1.08813, 4.295531, 1, 0, 0.2980392, 1,
1.66577, -0.6862572, 2.81002, 1, 0, 0.2941177, 1,
1.667823, 0.416286, 1.656192, 1, 0, 0.2862745, 1,
1.671218, -1.337798, 2.136651, 1, 0, 0.282353, 1,
1.714486, -0.6604152, 0.4287849, 1, 0, 0.2745098, 1,
1.723053, 0.4474249, 1.587297, 1, 0, 0.2705882, 1,
1.72336, 0.820567, 1.974707, 1, 0, 0.2627451, 1,
1.729524, 1.304687, 1.555822, 1, 0, 0.2588235, 1,
1.744826, -0.296831, 3.663573, 1, 0, 0.2509804, 1,
1.783576, -0.09324319, 1.787382, 1, 0, 0.2470588, 1,
1.78359, 0.4644095, 1.403832, 1, 0, 0.2392157, 1,
1.804837, 0.4197375, 1.589174, 1, 0, 0.2352941, 1,
1.809701, 0.9774681, 1.447045, 1, 0, 0.227451, 1,
1.810257, -0.0409831, 1.546156, 1, 0, 0.2235294, 1,
1.81528, 0.06390208, 1.293114, 1, 0, 0.2156863, 1,
1.821277, 1.001531, 1.15618, 1, 0, 0.2117647, 1,
1.835005, -0.8467787, 1.173647, 1, 0, 0.2039216, 1,
1.841682, -0.9666509, 1.335568, 1, 0, 0.1960784, 1,
1.868816, 1.705716, 2.172608, 1, 0, 0.1921569, 1,
1.872503, 1.060635, -0.8023496, 1, 0, 0.1843137, 1,
1.904163, 0.1591969, 3.293597, 1, 0, 0.1803922, 1,
1.907925, -0.6999814, 1.826531, 1, 0, 0.172549, 1,
1.946486, 2.19967, 1.046659, 1, 0, 0.1686275, 1,
1.948013, -1.248669, 1.672639, 1, 0, 0.1607843, 1,
1.954401, 0.8790548, 1.776282, 1, 0, 0.1568628, 1,
1.963544, -0.4467574, 0.4912334, 1, 0, 0.1490196, 1,
1.966152, 2.293716, 1.791079, 1, 0, 0.145098, 1,
1.967362, 0.8578003, 2.531028, 1, 0, 0.1372549, 1,
1.975961, -1.30819, 1.682765, 1, 0, 0.1333333, 1,
1.988328, -0.1594272, 1.185293, 1, 0, 0.1254902, 1,
1.988531, -0.5503253, 1.216396, 1, 0, 0.1215686, 1,
2.001883, 0.8917435, 3.101779, 1, 0, 0.1137255, 1,
2.02193, -1.302404, 0.8103708, 1, 0, 0.1098039, 1,
2.026258, -0.4647968, 2.165243, 1, 0, 0.1019608, 1,
2.066152, 1.209411, 1.883045, 1, 0, 0.09411765, 1,
2.066214, 0.3185623, 1.822723, 1, 0, 0.09019608, 1,
2.074507, 0.08133934, 2.642044, 1, 0, 0.08235294, 1,
2.077011, 0.1213218, 2.170807, 1, 0, 0.07843138, 1,
2.083656, -0.2535873, 0.5508488, 1, 0, 0.07058824, 1,
2.090044, 0.2161752, 1.46556, 1, 0, 0.06666667, 1,
2.116533, 0.9490151, 1.587037, 1, 0, 0.05882353, 1,
2.139301, -1.028686, 1.634618, 1, 0, 0.05490196, 1,
2.167352, 1.219131, 0.496372, 1, 0, 0.04705882, 1,
2.229136, -0.4993537, 3.331695, 1, 0, 0.04313726, 1,
2.371797, -1.854724, 3.374125, 1, 0, 0.03529412, 1,
2.381763, 1.221389, 1.447225, 1, 0, 0.03137255, 1,
2.389084, 1.194037, 0.5280633, 1, 0, 0.02352941, 1,
2.581511, 0.4725666, 1.82644, 1, 0, 0.01960784, 1,
2.644335, -0.05893175, 1.385545, 1, 0, 0.01176471, 1,
2.872782, -0.6229188, 0.7577664, 1, 0, 0.007843138, 1
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
-0.2072856, -4.122418, -6.71888, 0, -0.5, 0.5, 0.5,
-0.2072856, -4.122418, -6.71888, 1, -0.5, 0.5, 0.5,
-0.2072856, -4.122418, -6.71888, 1, 1.5, 0.5, 0.5,
-0.2072856, -4.122418, -6.71888, 0, 1.5, 0.5, 0.5
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
-4.331496, 0.2531197, -6.71888, 0, -0.5, 0.5, 0.5,
-4.331496, 0.2531197, -6.71888, 1, -0.5, 0.5, 0.5,
-4.331496, 0.2531197, -6.71888, 1, 1.5, 0.5, 0.5,
-4.331496, 0.2531197, -6.71888, 0, 1.5, 0.5, 0.5
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
-4.331496, -4.122418, -0.04493999, 0, -0.5, 0.5, 0.5,
-4.331496, -4.122418, -0.04493999, 1, -0.5, 0.5, 0.5,
-4.331496, -4.122418, -0.04493999, 1, 1.5, 0.5, 0.5,
-4.331496, -4.122418, -0.04493999, 0, 1.5, 0.5, 0.5
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
-3, -3.112679, -5.17874,
2, -3.112679, -5.17874,
-3, -3.112679, -5.17874,
-3, -3.280968, -5.43543,
-2, -3.112679, -5.17874,
-2, -3.280968, -5.43543,
-1, -3.112679, -5.17874,
-1, -3.280968, -5.43543,
0, -3.112679, -5.17874,
0, -3.280968, -5.43543,
1, -3.112679, -5.17874,
1, -3.280968, -5.43543,
2, -3.112679, -5.17874,
2, -3.280968, -5.43543
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
-3, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
-3, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
-3, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
-3, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5,
-2, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
-2, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
-2, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
-2, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5,
-1, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
-1, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
-1, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
-1, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5,
0, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
0, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
0, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
0, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5,
1, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
1, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
1, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
1, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5,
2, -3.617548, -5.94881, 0, -0.5, 0.5, 0.5,
2, -3.617548, -5.94881, 1, -0.5, 0.5, 0.5,
2, -3.617548, -5.94881, 1, 1.5, 0.5, 0.5,
2, -3.617548, -5.94881, 0, 1.5, 0.5, 0.5
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
-3.379755, -3, -5.17874,
-3.379755, 3, -5.17874,
-3.379755, -3, -5.17874,
-3.538379, -3, -5.43543,
-3.379755, -2, -5.17874,
-3.538379, -2, -5.43543,
-3.379755, -1, -5.17874,
-3.538379, -1, -5.43543,
-3.379755, 0, -5.17874,
-3.538379, 0, -5.43543,
-3.379755, 1, -5.17874,
-3.538379, 1, -5.43543,
-3.379755, 2, -5.17874,
-3.538379, 2, -5.43543,
-3.379755, 3, -5.17874,
-3.538379, 3, -5.43543
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
-3.855626, -3, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, -3, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, -3, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, -3, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, -2, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, -2, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, -2, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, -2, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, -1, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, -1, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, -1, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, -1, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, 0, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, 0, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, 0, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, 0, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, 1, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, 1, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, 1, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, 1, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, 2, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, 2, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, 2, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, 2, -5.94881, 0, 1.5, 0.5, 0.5,
-3.855626, 3, -5.94881, 0, -0.5, 0.5, 0.5,
-3.855626, 3, -5.94881, 1, -0.5, 0.5, 0.5,
-3.855626, 3, -5.94881, 1, 1.5, 0.5, 0.5,
-3.855626, 3, -5.94881, 0, 1.5, 0.5, 0.5
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
-3.379755, -3.112679, -4,
-3.379755, -3.112679, 4,
-3.379755, -3.112679, -4,
-3.538379, -3.280968, -4,
-3.379755, -3.112679, -2,
-3.538379, -3.280968, -2,
-3.379755, -3.112679, 0,
-3.538379, -3.280968, 0,
-3.379755, -3.112679, 2,
-3.538379, -3.280968, 2,
-3.379755, -3.112679, 4,
-3.538379, -3.280968, 4
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
-3.855626, -3.617548, -4, 0, -0.5, 0.5, 0.5,
-3.855626, -3.617548, -4, 1, -0.5, 0.5, 0.5,
-3.855626, -3.617548, -4, 1, 1.5, 0.5, 0.5,
-3.855626, -3.617548, -4, 0, 1.5, 0.5, 0.5,
-3.855626, -3.617548, -2, 0, -0.5, 0.5, 0.5,
-3.855626, -3.617548, -2, 1, -0.5, 0.5, 0.5,
-3.855626, -3.617548, -2, 1, 1.5, 0.5, 0.5,
-3.855626, -3.617548, -2, 0, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 0, 0, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 0, 1, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 0, 1, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 0, 0, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 2, 0, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 2, 1, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 2, 1, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 2, 0, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 4, 0, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 4, 1, -0.5, 0.5, 0.5,
-3.855626, -3.617548, 4, 1, 1.5, 0.5, 0.5,
-3.855626, -3.617548, 4, 0, 1.5, 0.5, 0.5
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
-3.379755, -3.112679, -5.17874,
-3.379755, 3.618918, -5.17874,
-3.379755, -3.112679, 5.08886,
-3.379755, 3.618918, 5.08886,
-3.379755, -3.112679, -5.17874,
-3.379755, -3.112679, 5.08886,
-3.379755, 3.618918, -5.17874,
-3.379755, 3.618918, 5.08886,
-3.379755, -3.112679, -5.17874,
2.965184, -3.112679, -5.17874,
-3.379755, -3.112679, 5.08886,
2.965184, -3.112679, 5.08886,
-3.379755, 3.618918, -5.17874,
2.965184, 3.618918, -5.17874,
-3.379755, 3.618918, 5.08886,
2.965184, 3.618918, 5.08886,
2.965184, -3.112679, -5.17874,
2.965184, 3.618918, -5.17874,
2.965184, -3.112679, 5.08886,
2.965184, 3.618918, 5.08886,
2.965184, -3.112679, -5.17874,
2.965184, -3.112679, 5.08886,
2.965184, 3.618918, -5.17874,
2.965184, 3.618918, 5.08886
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
var radius = 7.379686;
var distance = 32.83306;
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
mvMatrix.translate( 0.2072856, -0.2531197, 0.04493999 );
mvMatrix.scale( 1.257547, 1.185315, 0.7771106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.83306);
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
3-isopropyl-5-methyl<-read.table("3-isopropyl-5-methyl.xyz", skip=1)
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
-3.287353, -1.276861, -1.297293, 0, 0, 1, 1, 1,
-3.245891, 1.009422, -1.192987, 1, 0, 0, 1, 1,
-2.999404, -2.941547, -3.420295, 1, 0, 0, 1, 1,
-2.965653, 0.8495687, -1.352518, 1, 0, 0, 1, 1,
-2.928704, 0.8010687, -2.316874, 1, 0, 0, 1, 1,
-2.734765, 0.5577502, -0.2453806, 1, 0, 0, 1, 1,
-2.678994, -1.281648, -1.286949, 0, 0, 0, 1, 1,
-2.525097, -0.6428888, -2.057759, 0, 0, 0, 1, 1,
-2.380171, 0.2378982, -2.892085, 0, 0, 0, 1, 1,
-2.355373, -1.013074, -3.044586, 0, 0, 0, 1, 1,
-2.335794, 0.1951432, -1.162142, 0, 0, 0, 1, 1,
-2.314722, 0.2431901, -1.590615, 0, 0, 0, 1, 1,
-2.304174, -1.691591, -1.821068, 0, 0, 0, 1, 1,
-2.230389, -0.7873364, -2.704861, 1, 1, 1, 1, 1,
-2.208951, -1.469724, -2.335152, 1, 1, 1, 1, 1,
-2.170982, -0.5298502, -1.522931, 1, 1, 1, 1, 1,
-2.163013, -0.9288058, -2.120927, 1, 1, 1, 1, 1,
-2.156427, 1.636184, 0.5187949, 1, 1, 1, 1, 1,
-2.108465, -0.5269711, -2.777532, 1, 1, 1, 1, 1,
-2.09632, 1.356122, -0.5338279, 1, 1, 1, 1, 1,
-2.087068, -0.3756174, -2.770218, 1, 1, 1, 1, 1,
-2.063197, 2.356376, -1.241675, 1, 1, 1, 1, 1,
-2.050086, -0.7751466, -1.050077, 1, 1, 1, 1, 1,
-1.947048, -0.5857502, -2.099893, 1, 1, 1, 1, 1,
-1.943928, 1.421142, -1.238629, 1, 1, 1, 1, 1,
-1.930801, -1.000171, -2.126524, 1, 1, 1, 1, 1,
-1.914357, 1.253231, -0.3688036, 1, 1, 1, 1, 1,
-1.893468, 1.458979, -1.638973, 1, 1, 1, 1, 1,
-1.831218, -1.085135, -2.820353, 0, 0, 1, 1, 1,
-1.812896, 1.691975, -1.7617, 1, 0, 0, 1, 1,
-1.806062, 0.7135562, -1.718888, 1, 0, 0, 1, 1,
-1.801915, -0.1941923, -1.273854, 1, 0, 0, 1, 1,
-1.79094, -0.6869546, -1.421035, 1, 0, 0, 1, 1,
-1.789189, 0.2583563, -1.848996, 1, 0, 0, 1, 1,
-1.788023, 0.02769472, -1.696277, 0, 0, 0, 1, 1,
-1.786921, -0.4806235, -1.784063, 0, 0, 0, 1, 1,
-1.764974, 0.4728021, -2.380126, 0, 0, 0, 1, 1,
-1.763872, 1.227376, -2.028875, 0, 0, 0, 1, 1,
-1.748023, -0.2126476, -3.059747, 0, 0, 0, 1, 1,
-1.74129, -1.039039, -3.043048, 0, 0, 0, 1, 1,
-1.736328, 0.992773, -0.7312458, 0, 0, 0, 1, 1,
-1.7253, 1.845355, -1.833293, 1, 1, 1, 1, 1,
-1.704975, -1.689784, -2.017977, 1, 1, 1, 1, 1,
-1.690389, -1.1883, -2.103822, 1, 1, 1, 1, 1,
-1.681562, -0.2447295, -2.750896, 1, 1, 1, 1, 1,
-1.677175, -0.2940294, -1.034132, 1, 1, 1, 1, 1,
-1.674898, 1.458936, -1.58145, 1, 1, 1, 1, 1,
-1.673095, -1.563884, -2.080331, 1, 1, 1, 1, 1,
-1.653054, 0.513854, -0.300954, 1, 1, 1, 1, 1,
-1.643457, 0.2876526, -0.8339827, 1, 1, 1, 1, 1,
-1.629135, -1.327306, -3.685316, 1, 1, 1, 1, 1,
-1.613168, 0.8503349, -2.961799, 1, 1, 1, 1, 1,
-1.601602, 1.176286, -1.523975, 1, 1, 1, 1, 1,
-1.568103, -0.2646382, -1.137984, 1, 1, 1, 1, 1,
-1.563928, -0.3052313, -1.497835, 1, 1, 1, 1, 1,
-1.558998, -0.8056548, 0.1203866, 1, 1, 1, 1, 1,
-1.523221, -0.01999889, -1.829724, 0, 0, 1, 1, 1,
-1.517042, 0.8130724, -0.2511359, 1, 0, 0, 1, 1,
-1.505315, -0.735779, -1.599428, 1, 0, 0, 1, 1,
-1.504512, 0.4956985, -1.478147, 1, 0, 0, 1, 1,
-1.504309, -0.5580188, -3.417781, 1, 0, 0, 1, 1,
-1.479032, 1.024337, 0.6407768, 1, 0, 0, 1, 1,
-1.476111, 0.1215026, -1.140396, 0, 0, 0, 1, 1,
-1.468611, 1.384197, -0.5936522, 0, 0, 0, 1, 1,
-1.459751, -2.023826, -1.450803, 0, 0, 0, 1, 1,
-1.39709, -1.243356, -1.654017, 0, 0, 0, 1, 1,
-1.395451, 0.3130608, -0.2147559, 0, 0, 0, 1, 1,
-1.369923, -0.2102643, -0.6999931, 0, 0, 0, 1, 1,
-1.364563, 0.02528289, -0.430559, 0, 0, 0, 1, 1,
-1.363377, 0.2425697, -2.01171, 1, 1, 1, 1, 1,
-1.360102, 0.8512799, -1.354777, 1, 1, 1, 1, 1,
-1.359754, 2.227975, -0.4416039, 1, 1, 1, 1, 1,
-1.354157, 0.3752368, 0.2479257, 1, 1, 1, 1, 1,
-1.35185, -2.193043, -1.680146, 1, 1, 1, 1, 1,
-1.338976, -0.9393676, -1.395234, 1, 1, 1, 1, 1,
-1.320008, -2.334095, -2.659686, 1, 1, 1, 1, 1,
-1.313848, -0.4466085, -0.8515874, 1, 1, 1, 1, 1,
-1.302056, 0.2113937, -2.038323, 1, 1, 1, 1, 1,
-1.298103, 0.4258358, -2.177403, 1, 1, 1, 1, 1,
-1.294139, -1.401339, -3.376024, 1, 1, 1, 1, 1,
-1.275399, -0.6964897, -2.386871, 1, 1, 1, 1, 1,
-1.274312, 1.119, -2.201257, 1, 1, 1, 1, 1,
-1.274026, 0.3677614, -0.08266917, 1, 1, 1, 1, 1,
-1.272633, -0.2816421, -1.632555, 1, 1, 1, 1, 1,
-1.268782, -0.7632974, -1.444135, 0, 0, 1, 1, 1,
-1.259882, -0.862399, -2.674954, 1, 0, 0, 1, 1,
-1.257034, -0.1421974, -1.414554, 1, 0, 0, 1, 1,
-1.251583, -0.2390893, -1.407069, 1, 0, 0, 1, 1,
-1.244449, -0.8895754, -2.473506, 1, 0, 0, 1, 1,
-1.238929, 0.5429624, 0.5972366, 1, 0, 0, 1, 1,
-1.229341, 0.264681, -2.631572, 0, 0, 0, 1, 1,
-1.226629, -0.7003903, -0.488624, 0, 0, 0, 1, 1,
-1.223374, 0.3125387, -1.103237, 0, 0, 0, 1, 1,
-1.210586, -0.1533033, -1.117146, 0, 0, 0, 1, 1,
-1.21007, -0.1891114, -0.8248286, 0, 0, 0, 1, 1,
-1.204733, -0.5546823, -3.220482, 0, 0, 0, 1, 1,
-1.182016, -1.444892, -3.014888, 0, 0, 0, 1, 1,
-1.178257, 0.5955095, 0.3429191, 1, 1, 1, 1, 1,
-1.169668, -0.667118, -2.605241, 1, 1, 1, 1, 1,
-1.168483, 0.1646258, -2.611586, 1, 1, 1, 1, 1,
-1.168411, -0.7610244, -2.340557, 1, 1, 1, 1, 1,
-1.164389, -0.5990707, -2.570523, 1, 1, 1, 1, 1,
-1.163021, -0.5292982, -0.6477961, 1, 1, 1, 1, 1,
-1.154256, -0.4917684, -0.7547891, 1, 1, 1, 1, 1,
-1.149078, 0.3057956, -1.231272, 1, 1, 1, 1, 1,
-1.145078, -1.379037, -1.81702, 1, 1, 1, 1, 1,
-1.129796, 0.9091993, 0.1070285, 1, 1, 1, 1, 1,
-1.112626, 0.1775153, -1.045487, 1, 1, 1, 1, 1,
-1.112498, -3.014646, -2.171976, 1, 1, 1, 1, 1,
-1.111014, 0.3876487, -1.939804, 1, 1, 1, 1, 1,
-1.103455, 0.8110819, -2.326293, 1, 1, 1, 1, 1,
-1.102162, -0.131665, -2.527044, 1, 1, 1, 1, 1,
-1.10039, -0.370481, -1.206663, 0, 0, 1, 1, 1,
-1.096846, -1.119994, -1.357549, 1, 0, 0, 1, 1,
-1.085792, -0.4159639, -1.946226, 1, 0, 0, 1, 1,
-1.083409, -1.205179, -2.938109, 1, 0, 0, 1, 1,
-1.08036, -0.3357167, -3.934444, 1, 0, 0, 1, 1,
-1.065636, -0.7832927, -1.438854, 1, 0, 0, 1, 1,
-1.06505, 1.439321, -3.787342, 0, 0, 0, 1, 1,
-1.061449, 0.206058, -2.406825, 0, 0, 0, 1, 1,
-1.060517, 0.7933635, -0.6237924, 0, 0, 0, 1, 1,
-1.056189, -0.3973894, -1.129904, 0, 0, 0, 1, 1,
-1.05539, 0.3939103, -1.900992, 0, 0, 0, 1, 1,
-1.039827, 0.3582206, -2.106933, 0, 0, 0, 1, 1,
-1.034362, 0.01685268, -2.200951, 0, 0, 0, 1, 1,
-1.033857, -0.5133878, -1.096399, 1, 1, 1, 1, 1,
-1.031605, 0.7557435, -0.8755692, 1, 1, 1, 1, 1,
-1.027464, -0.05094739, -1.877365, 1, 1, 1, 1, 1,
-1.026113, 0.2270832, -2.224183, 1, 1, 1, 1, 1,
-1.016832, -1.498004, -2.568262, 1, 1, 1, 1, 1,
-1.016628, -0.9440338, -2.709186, 1, 1, 1, 1, 1,
-1.015316, 1.652165, -0.08197817, 1, 1, 1, 1, 1,
-1.014329, 0.5101923, -1.93083, 1, 1, 1, 1, 1,
-1.012971, 2.472459, 0.4580075, 1, 1, 1, 1, 1,
-1.008794, 0.4083919, 1.059915, 1, 1, 1, 1, 1,
-1.00743, -0.1945195, -2.28549, 1, 1, 1, 1, 1,
-1.006883, -1.24087, -0.1840489, 1, 1, 1, 1, 1,
-1.000853, 1.353907, -2.736661, 1, 1, 1, 1, 1,
-0.999125, -0.8846054, -2.317587, 1, 1, 1, 1, 1,
-0.9953336, -0.4095646, -3.569617, 1, 1, 1, 1, 1,
-0.9921273, -1.147727, -2.165666, 0, 0, 1, 1, 1,
-0.9862468, 0.3557885, -0.3721057, 1, 0, 0, 1, 1,
-0.9804759, -1.0339, -2.874457, 1, 0, 0, 1, 1,
-0.9720432, 0.1187457, -2.539356, 1, 0, 0, 1, 1,
-0.9532673, -1.10726, -2.55085, 1, 0, 0, 1, 1,
-0.9526249, -0.6867582, 0.04893485, 1, 0, 0, 1, 1,
-0.9479043, 1.84168, -1.040015, 0, 0, 0, 1, 1,
-0.9432402, -0.0623419, -2.059099, 0, 0, 0, 1, 1,
-0.9432142, 0.4000267, -1.071598, 0, 0, 0, 1, 1,
-0.9385008, 0.1130114, -0.9150442, 0, 0, 0, 1, 1,
-0.9379598, -0.735589, -1.469048, 0, 0, 0, 1, 1,
-0.9193015, -0.1946411, -2.070943, 0, 0, 0, 1, 1,
-0.917206, -0.7058623, -2.262355, 0, 0, 0, 1, 1,
-0.9150824, -0.02799967, -1.625852, 1, 1, 1, 1, 1,
-0.9118149, 0.1317919, 1.425149, 1, 1, 1, 1, 1,
-0.9042868, 1.625057, -0.36979, 1, 1, 1, 1, 1,
-0.9039348, 1.675929, -0.7687128, 1, 1, 1, 1, 1,
-0.8992385, -1.119095, -2.66106, 1, 1, 1, 1, 1,
-0.8986173, -0.9526811, -1.033063, 1, 1, 1, 1, 1,
-0.895887, -0.7484528, -2.506454, 1, 1, 1, 1, 1,
-0.8948511, 0.3434623, -0.8405713, 1, 1, 1, 1, 1,
-0.8829247, 0.1312335, -1.711515, 1, 1, 1, 1, 1,
-0.882108, -0.04095366, -0.8471613, 1, 1, 1, 1, 1,
-0.8810911, -1.699377, -2.844709, 1, 1, 1, 1, 1,
-0.8803555, -1.331895, -3.05168, 1, 1, 1, 1, 1,
-0.8784682, 0.7494662, -0.2634339, 1, 1, 1, 1, 1,
-0.877133, 0.6660969, -2.232771, 1, 1, 1, 1, 1,
-0.8719326, 1.610576, 0.1680416, 1, 1, 1, 1, 1,
-0.8715246, -0.3317776, -1.371045, 0, 0, 1, 1, 1,
-0.869875, -0.7791416, -4.147585, 1, 0, 0, 1, 1,
-0.8678614, -0.4209566, -3.846116, 1, 0, 0, 1, 1,
-0.8615513, 0.1849216, -1.027344, 1, 0, 0, 1, 1,
-0.8495941, 0.547286, 0.3225364, 1, 0, 0, 1, 1,
-0.8490242, 0.5372562, 1.435989, 1, 0, 0, 1, 1,
-0.8454785, -0.154523, -1.35054, 0, 0, 0, 1, 1,
-0.8448365, 0.2241341, -1.69784, 0, 0, 0, 1, 1,
-0.8336226, -2.292229, -1.038319, 0, 0, 0, 1, 1,
-0.8332129, 0.7872949, -0.2037401, 0, 0, 0, 1, 1,
-0.8278424, 0.42718, -2.227868, 0, 0, 0, 1, 1,
-0.8277798, 0.2361608, -1.499472, 0, 0, 0, 1, 1,
-0.8139039, 0.1106066, -2.001686, 0, 0, 0, 1, 1,
-0.809833, 0.9065345, -1.329028, 1, 1, 1, 1, 1,
-0.8068749, 1.246061, -0.4810411, 1, 1, 1, 1, 1,
-0.7973714, 0.1096103, -1.092099, 1, 1, 1, 1, 1,
-0.7967703, 1.177769, 0.6953549, 1, 1, 1, 1, 1,
-0.7966127, -0.5835953, -1.257622, 1, 1, 1, 1, 1,
-0.7958384, 0.2051824, -0.6580747, 1, 1, 1, 1, 1,
-0.7893022, 0.4210049, 0.1996173, 1, 1, 1, 1, 1,
-0.7877392, 0.9439843, 1.008518, 1, 1, 1, 1, 1,
-0.7859843, 0.3365806, -0.2450297, 1, 1, 1, 1, 1,
-0.7846812, -0.9847475, -4.12081, 1, 1, 1, 1, 1,
-0.7784496, 0.6038513, -1.382531, 1, 1, 1, 1, 1,
-0.7714555, -1.177113, -1.685535, 1, 1, 1, 1, 1,
-0.7699483, -0.4457857, -1.909399, 1, 1, 1, 1, 1,
-0.7674039, -0.7229696, -2.407557, 1, 1, 1, 1, 1,
-0.7648417, 0.6674006, -0.8297789, 1, 1, 1, 1, 1,
-0.7563549, -1.345933, -2.193351, 0, 0, 1, 1, 1,
-0.7556444, -0.9979986, -2.851812, 1, 0, 0, 1, 1,
-0.754466, -1.31925, -2.720687, 1, 0, 0, 1, 1,
-0.7496194, -0.5341514, -2.830327, 1, 0, 0, 1, 1,
-0.7454613, -0.0209987, -0.6998748, 1, 0, 0, 1, 1,
-0.7434291, -0.2265049, -2.650365, 1, 0, 0, 1, 1,
-0.7384017, 0.9225543, 0.4528205, 0, 0, 0, 1, 1,
-0.7309305, 1.792295, -1.164786, 0, 0, 0, 1, 1,
-0.7300182, -1.499781, -2.683538, 0, 0, 0, 1, 1,
-0.7265353, 0.6374216, 0.09583465, 0, 0, 0, 1, 1,
-0.7247228, 0.6736256, -0.8505535, 0, 0, 0, 1, 1,
-0.7199728, 0.1793766, -0.8134837, 0, 0, 0, 1, 1,
-0.7152141, 0.9758754, -0.8208838, 0, 0, 0, 1, 1,
-0.7111859, -2.35184, -2.156427, 1, 1, 1, 1, 1,
-0.7097289, -0.2092771, -2.303398, 1, 1, 1, 1, 1,
-0.7094479, -0.7217838, -2.304617, 1, 1, 1, 1, 1,
-0.7084002, -0.4550838, -2.158592, 1, 1, 1, 1, 1,
-0.7043192, -0.9921369, -2.255634, 1, 1, 1, 1, 1,
-0.7036489, 0.183043, -1.282449, 1, 1, 1, 1, 1,
-0.703612, -0.0825337, -2.974957, 1, 1, 1, 1, 1,
-0.70191, -0.7797762, -1.446418, 1, 1, 1, 1, 1,
-0.6963668, -1.200659, -3.753474, 1, 1, 1, 1, 1,
-0.6920097, 0.1836402, -2.620953, 1, 1, 1, 1, 1,
-0.6883742, -0.78608, -1.921467, 1, 1, 1, 1, 1,
-0.6882518, 0.3806468, -0.5521573, 1, 1, 1, 1, 1,
-0.6882129, 0.7813927, -1.525153, 1, 1, 1, 1, 1,
-0.6839543, -0.751918, -2.8584, 1, 1, 1, 1, 1,
-0.6837512, -0.736978, -2.675001, 1, 1, 1, 1, 1,
-0.6805795, 0.8862851, -1.771306, 0, 0, 1, 1, 1,
-0.6718602, -1.142588, -3.247976, 1, 0, 0, 1, 1,
-0.6701584, -1.279889, -2.535579, 1, 0, 0, 1, 1,
-0.6663237, 0.4033815, -0.9256387, 1, 0, 0, 1, 1,
-0.6612617, 0.2721242, -0.6912295, 1, 0, 0, 1, 1,
-0.6605102, 2.045837, -0.0374519, 1, 0, 0, 1, 1,
-0.657526, -0.5250356, -2.372265, 0, 0, 0, 1, 1,
-0.650127, -0.4861436, -1.838903, 0, 0, 0, 1, 1,
-0.6454499, -0.6093654, -1.538599, 0, 0, 0, 1, 1,
-0.6407694, 1.092049, -0.7120117, 0, 0, 0, 1, 1,
-0.6400809, 1.582049, 0.09494208, 0, 0, 0, 1, 1,
-0.6396165, 0.01715464, -1.194061, 0, 0, 0, 1, 1,
-0.6358513, 1.282645, -0.2376664, 0, 0, 0, 1, 1,
-0.6242936, 0.2020071, 0.4661402, 1, 1, 1, 1, 1,
-0.6238145, 2.736958, 1.071964, 1, 1, 1, 1, 1,
-0.6234375, 0.1908015, -0.770276, 1, 1, 1, 1, 1,
-0.622619, 1.255502, -1.383372, 1, 1, 1, 1, 1,
-0.6207302, -1.903821, -3.532424, 1, 1, 1, 1, 1,
-0.6200208, 0.4026816, -0.496327, 1, 1, 1, 1, 1,
-0.6191883, -0.5989683, -3.111822, 1, 1, 1, 1, 1,
-0.6140445, -0.9901425, -3.086546, 1, 1, 1, 1, 1,
-0.6105818, -1.110632, -1.607267, 1, 1, 1, 1, 1,
-0.6080039, 0.8067682, 0.4743252, 1, 1, 1, 1, 1,
-0.6079698, -1.241222, -2.027586, 1, 1, 1, 1, 1,
-0.6075065, 1.088497, -0.6417176, 1, 1, 1, 1, 1,
-0.6064246, 0.1710586, 0.3463955, 1, 1, 1, 1, 1,
-0.5990095, -1.018672, -1.50318, 1, 1, 1, 1, 1,
-0.5979584, -0.4238013, -2.300521, 1, 1, 1, 1, 1,
-0.5973359, -1.528232, -1.421078, 0, 0, 1, 1, 1,
-0.5973073, 0.2198589, -0.7438464, 1, 0, 0, 1, 1,
-0.5942225, -0.5153188, -0.8501888, 1, 0, 0, 1, 1,
-0.5921383, 1.102097, -1.558191, 1, 0, 0, 1, 1,
-0.5870873, 0.4874193, -0.1679012, 1, 0, 0, 1, 1,
-0.5870612, 0.5357268, -0.465331, 1, 0, 0, 1, 1,
-0.5793344, 0.3608105, -1.141682, 0, 0, 0, 1, 1,
-0.5778207, 1.098081, -0.3245942, 0, 0, 0, 1, 1,
-0.5772167, -0.3122841, -4.056555, 0, 0, 0, 1, 1,
-0.5768102, 1.505209, -0.7546321, 0, 0, 0, 1, 1,
-0.5738506, -0.1079697, -1.490135, 0, 0, 0, 1, 1,
-0.5688915, -0.7023936, -1.423752, 0, 0, 0, 1, 1,
-0.5686247, 1.051531, -2.249375, 0, 0, 0, 1, 1,
-0.5681285, -0.2313292, -1.496628, 1, 1, 1, 1, 1,
-0.5643753, 2.108284, -0.2068924, 1, 1, 1, 1, 1,
-0.5623424, -0.7968287, -3.778494, 1, 1, 1, 1, 1,
-0.5574487, 0.05211152, -1.551011, 1, 1, 1, 1, 1,
-0.5548506, 1.694247, 0.3170809, 1, 1, 1, 1, 1,
-0.55441, 0.06746107, -1.283566, 1, 1, 1, 1, 1,
-0.5514343, 1.088505, -2.379048, 1, 1, 1, 1, 1,
-0.5476125, 0.9939417, -0.1953007, 1, 1, 1, 1, 1,
-0.5470017, 0.6467686, -0.2565674, 1, 1, 1, 1, 1,
-0.5469937, -0.7998822, -2.651608, 1, 1, 1, 1, 1,
-0.5430786, 2.020766, -0.7267023, 1, 1, 1, 1, 1,
-0.541715, 0.1034432, -1.755879, 1, 1, 1, 1, 1,
-0.5307284, 0.07461976, -2.505907, 1, 1, 1, 1, 1,
-0.5249234, 0.8745561, -0.5564672, 1, 1, 1, 1, 1,
-0.5238837, -1.910184, -2.412833, 1, 1, 1, 1, 1,
-0.5135781, 0.6183937, -3.912262, 0, 0, 1, 1, 1,
-0.5107234, 0.1491961, -1.967716, 1, 0, 0, 1, 1,
-0.5076592, 0.2326428, -2.295886, 1, 0, 0, 1, 1,
-0.502422, 1.174406, 0.5886328, 1, 0, 0, 1, 1,
-0.5016868, -0.3364728, -1.860597, 1, 0, 0, 1, 1,
-0.5003897, 0.9508832, -1.179688, 1, 0, 0, 1, 1,
-0.4996607, 0.01391372, -0.6532882, 0, 0, 0, 1, 1,
-0.4992657, -0.7676362, -2.801839, 0, 0, 0, 1, 1,
-0.4977036, 0.5558226, -0.04141034, 0, 0, 0, 1, 1,
-0.4935313, 0.8964387, -1.503528, 0, 0, 0, 1, 1,
-0.4879578, 2.717233, -0.2234947, 0, 0, 0, 1, 1,
-0.485071, 0.6473526, -0.8468165, 0, 0, 0, 1, 1,
-0.4840032, -0.7495592, -3.177942, 0, 0, 0, 1, 1,
-0.4816476, 0.7883281, -2.258432, 1, 1, 1, 1, 1,
-0.4815945, -0.0886113, -2.067604, 1, 1, 1, 1, 1,
-0.4806866, 0.04715378, -0.1757454, 1, 1, 1, 1, 1,
-0.4799622, 1.357706, -1.057306, 1, 1, 1, 1, 1,
-0.4750929, 0.07817697, 0.1903921, 1, 1, 1, 1, 1,
-0.4740764, 1.691544, 0.6126448, 1, 1, 1, 1, 1,
-0.4733159, 1.241219, 0.3322044, 1, 1, 1, 1, 1,
-0.4713449, 0.1951371, -2.240043, 1, 1, 1, 1, 1,
-0.4653543, 1.55009, 0.6523865, 1, 1, 1, 1, 1,
-0.4631466, -1.140588, -3.346758, 1, 1, 1, 1, 1,
-0.4619367, 0.6694371, 0.166372, 1, 1, 1, 1, 1,
-0.4600171, 0.05152209, 1.699325, 1, 1, 1, 1, 1,
-0.454319, -0.1084909, -1.348138, 1, 1, 1, 1, 1,
-0.4482964, -0.8483493, -4.174304, 1, 1, 1, 1, 1,
-0.4448785, -0.001089158, -2.538945, 1, 1, 1, 1, 1,
-0.4387385, -0.2672659, -1.124156, 0, 0, 1, 1, 1,
-0.4355481, 1.030193, 0.7247568, 1, 0, 0, 1, 1,
-0.434804, -1.283559, -2.721752, 1, 0, 0, 1, 1,
-0.4346687, 0.02686651, -2.522839, 1, 0, 0, 1, 1,
-0.4314848, 0.9227858, -0.04406535, 1, 0, 0, 1, 1,
-0.4270322, -1.376762, -3.144009, 1, 0, 0, 1, 1,
-0.4263364, 0.2147507, -0.08190688, 0, 0, 0, 1, 1,
-0.4246314, 0.2346763, 0.5078987, 0, 0, 0, 1, 1,
-0.4228782, -1.392305, -3.375844, 0, 0, 0, 1, 1,
-0.4194411, 0.313197, 0.1679316, 0, 0, 0, 1, 1,
-0.4188872, 1.354645, -0.1752459, 0, 0, 0, 1, 1,
-0.4169121, -1.182444, -3.054641, 0, 0, 0, 1, 1,
-0.4111935, 0.8149871, -1.183814, 0, 0, 0, 1, 1,
-0.4077213, -1.089107, -3.108453, 1, 1, 1, 1, 1,
-0.4072947, -1.02108, -3.247401, 1, 1, 1, 1, 1,
-0.4049859, 0.6969674, 0.1686249, 1, 1, 1, 1, 1,
-0.4046401, -0.5684029, -2.478029, 1, 1, 1, 1, 1,
-0.3961444, -0.8669845, -3.431059, 1, 1, 1, 1, 1,
-0.3947443, 0.2608631, -1.24236, 1, 1, 1, 1, 1,
-0.3929924, -1.677661, -1.957887, 1, 1, 1, 1, 1,
-0.3913424, -1.814926, -3.480436, 1, 1, 1, 1, 1,
-0.3865652, -0.3071824, -0.406569, 1, 1, 1, 1, 1,
-0.3813007, -0.4806717, -2.458172, 1, 1, 1, 1, 1,
-0.3808599, 1.611442, -1.179638, 1, 1, 1, 1, 1,
-0.3784317, -1.278409, -3.143203, 1, 1, 1, 1, 1,
-0.3774415, -0.6010922, -2.970972, 1, 1, 1, 1, 1,
-0.3752377, -0.3015804, -0.5212514, 1, 1, 1, 1, 1,
-0.3722478, 0.7326472, -0.2762648, 1, 1, 1, 1, 1,
-0.3716274, 1.39491, -0.004182659, 0, 0, 1, 1, 1,
-0.3686142, 0.7335995, -0.06472381, 1, 0, 0, 1, 1,
-0.3682167, -1.402245, -1.15762, 1, 0, 0, 1, 1,
-0.3573944, -0.008207829, -0.3149103, 1, 0, 0, 1, 1,
-0.3557664, 0.08009479, -0.9904955, 1, 0, 0, 1, 1,
-0.3539646, -0.09804337, -1.937058, 1, 0, 0, 1, 1,
-0.3515835, 0.8302717, -0.0374813, 0, 0, 0, 1, 1,
-0.3504645, 0.4897255, 0.9914712, 0, 0, 0, 1, 1,
-0.3504035, -2.113005, -1.032948, 0, 0, 0, 1, 1,
-0.3472809, -0.2371729, 0.9913794, 0, 0, 0, 1, 1,
-0.3376928, 1.384723, 1.388478, 0, 0, 0, 1, 1,
-0.3367292, 3.520885, 2.275859, 0, 0, 0, 1, 1,
-0.335295, -0.8524083, -2.808064, 0, 0, 0, 1, 1,
-0.3324578, -1.977878, -4.259776, 1, 1, 1, 1, 1,
-0.3320796, -1.33185, -2.114396, 1, 1, 1, 1, 1,
-0.3290593, 0.1335443, -1.935125, 1, 1, 1, 1, 1,
-0.3283932, -0.06851193, -2.59811, 1, 1, 1, 1, 1,
-0.3270986, -0.8881785, -3.809017, 1, 1, 1, 1, 1,
-0.3253261, 1.715377, -1.616187, 1, 1, 1, 1, 1,
-0.324627, 0.7694172, -0.5122837, 1, 1, 1, 1, 1,
-0.321264, 0.01569194, -2.176437, 1, 1, 1, 1, 1,
-0.3183527, -0.9846682, -2.843354, 1, 1, 1, 1, 1,
-0.3175886, -0.5350609, -2.678714, 1, 1, 1, 1, 1,
-0.3119691, 0.5069348, -1.522538, 1, 1, 1, 1, 1,
-0.3094617, -0.6552382, -2.209525, 1, 1, 1, 1, 1,
-0.3068279, 1.293191, 0.3030772, 1, 1, 1, 1, 1,
-0.3064188, 0.8653412, -0.01580016, 1, 1, 1, 1, 1,
-0.2971646, 0.1270974, -0.4668211, 1, 1, 1, 1, 1,
-0.2958207, 1.18949, -0.282135, 0, 0, 1, 1, 1,
-0.2925117, -0.1108262, -1.872285, 1, 0, 0, 1, 1,
-0.2902026, 0.2257189, -1.985652, 1, 0, 0, 1, 1,
-0.2883613, 2.02748, 0.2082375, 1, 0, 0, 1, 1,
-0.2831405, 2.127438, -1.993438, 1, 0, 0, 1, 1,
-0.2826962, -1.233142, -2.322307, 1, 0, 0, 1, 1,
-0.2819636, -0.4061233, -1.55996, 0, 0, 0, 1, 1,
-0.2817473, 0.4966085, -2.017888, 0, 0, 0, 1, 1,
-0.2770128, 0.5735816, 0.2404409, 0, 0, 0, 1, 1,
-0.2758591, -0.5648586, -3.362962, 0, 0, 0, 1, 1,
-0.2733924, 0.09485634, -1.122688, 0, 0, 0, 1, 1,
-0.2720791, -2.72824, -4.656538, 0, 0, 0, 1, 1,
-0.2715841, 1.360827, 0.0006273835, 0, 0, 0, 1, 1,
-0.2678812, 0.01966439, -2.363698, 1, 1, 1, 1, 1,
-0.2663066, 0.5112178, 1.326131, 1, 1, 1, 1, 1,
-0.2658671, 1.571893, -1.956971, 1, 1, 1, 1, 1,
-0.2629655, 0.940084, -0.1525044, 1, 1, 1, 1, 1,
-0.2620846, 1.265183, 0.4654897, 1, 1, 1, 1, 1,
-0.2615175, -0.6478948, -3.018321, 1, 1, 1, 1, 1,
-0.26091, 0.5974736, -0.9124071, 1, 1, 1, 1, 1,
-0.2584789, -0.5362181, -1.66593, 1, 1, 1, 1, 1,
-0.25444, 1.208498, -0.1891491, 1, 1, 1, 1, 1,
-0.2499934, 2.00672, -0.3380073, 1, 1, 1, 1, 1,
-0.249485, -0.4886083, -3.062856, 1, 1, 1, 1, 1,
-0.2485702, 0.1844353, 0.8088027, 1, 1, 1, 1, 1,
-0.2480115, 1.37564, -0.06266184, 1, 1, 1, 1, 1,
-0.2448176, 1.255948, 1.235069, 1, 1, 1, 1, 1,
-0.244679, -0.3598502, -2.220426, 1, 1, 1, 1, 1,
-0.2389306, -0.612354, -2.788467, 0, 0, 1, 1, 1,
-0.2286278, 1.855936, -0.04015463, 1, 0, 0, 1, 1,
-0.2273098, -0.07056402, -2.799303, 1, 0, 0, 1, 1,
-0.2261839, -0.1594529, -1.414088, 1, 0, 0, 1, 1,
-0.2201858, 0.2291769, -0.5312039, 1, 0, 0, 1, 1,
-0.2143453, 0.2107134, -0.1448348, 1, 0, 0, 1, 1,
-0.2135171, -0.9447363, -3.723901, 0, 0, 0, 1, 1,
-0.2107059, -1.14252, -2.823397, 0, 0, 0, 1, 1,
-0.2088379, -1.172451, -3.901192, 0, 0, 0, 1, 1,
-0.2085759, -0.6167008, -4.024887, 0, 0, 0, 1, 1,
-0.2072827, 0.8276336, -1.223004, 0, 0, 0, 1, 1,
-0.2067479, -1.188317, -2.127303, 0, 0, 0, 1, 1,
-0.2047762, -0.4738126, -4.108318, 0, 0, 0, 1, 1,
-0.203663, 0.6432629, -0.5993389, 1, 1, 1, 1, 1,
-0.2017715, 0.01921009, -2.716365, 1, 1, 1, 1, 1,
-0.1973063, 0.2885474, -1.459648, 1, 1, 1, 1, 1,
-0.1929495, -0.3741565, -3.581767, 1, 1, 1, 1, 1,
-0.1875553, -2.655428, -4.236227, 1, 1, 1, 1, 1,
-0.185582, 1.029115, 0.4887684, 1, 1, 1, 1, 1,
-0.1846336, 1.104726, -0.6646649, 1, 1, 1, 1, 1,
-0.1820258, 0.02436842, -1.851988, 1, 1, 1, 1, 1,
-0.1808502, 0.192307, -1.756354, 1, 1, 1, 1, 1,
-0.180768, -0.797547, -2.800167, 1, 1, 1, 1, 1,
-0.1771563, 0.3422631, -1.164691, 1, 1, 1, 1, 1,
-0.1770896, 0.09925213, -1.192724, 1, 1, 1, 1, 1,
-0.170869, 1.171257, -0.3644077, 1, 1, 1, 1, 1,
-0.1654068, 0.3132249, -0.02422243, 1, 1, 1, 1, 1,
-0.1642094, -1.468646, -3.32864, 1, 1, 1, 1, 1,
-0.1636683, -0.007674807, -1.624695, 0, 0, 1, 1, 1,
-0.1629187, 0.4892696, -1.591759, 1, 0, 0, 1, 1,
-0.1617213, 0.01738985, -1.799009, 1, 0, 0, 1, 1,
-0.1616425, 0.9833062, -1.188948, 1, 0, 0, 1, 1,
-0.1605269, 2.756906, -0.651848, 1, 0, 0, 1, 1,
-0.158635, 0.8146147, -1.690133, 1, 0, 0, 1, 1,
-0.1583742, -0.6229607, -2.306903, 0, 0, 0, 1, 1,
-0.1582632, 0.5384773, -0.9668664, 0, 0, 0, 1, 1,
-0.1562918, -0.4542659, -3.236076, 0, 0, 0, 1, 1,
-0.1528301, -0.433593, -1.034586, 0, 0, 0, 1, 1,
-0.1509865, -1.823308, -3.089713, 0, 0, 0, 1, 1,
-0.1465718, 0.789124, -0.4681331, 0, 0, 0, 1, 1,
-0.145972, 0.7587021, 0.1028349, 0, 0, 0, 1, 1,
-0.1404006, 0.1059211, -0.3342366, 1, 1, 1, 1, 1,
-0.1358741, -0.5881388, -3.198476, 1, 1, 1, 1, 1,
-0.1357679, -1.53086, -3.110667, 1, 1, 1, 1, 1,
-0.1332525, -0.7410986, -5.029212, 1, 1, 1, 1, 1,
-0.1209119, -1.09858, -3.245159, 1, 1, 1, 1, 1,
-0.1201756, 0.9868594, 0.981698, 1, 1, 1, 1, 1,
-0.1179193, -0.2151508, -4.33909, 1, 1, 1, 1, 1,
-0.1177868, -0.5316848, -2.199722, 1, 1, 1, 1, 1,
-0.1169401, -0.3195252, -3.025542, 1, 1, 1, 1, 1,
-0.1160967, 0.4503411, -0.1734799, 1, 1, 1, 1, 1,
-0.1150732, 0.548605, 1.175756, 1, 1, 1, 1, 1,
-0.1147435, -0.7906485, -3.038064, 1, 1, 1, 1, 1,
-0.1132029, -0.1453634, -3.278118, 1, 1, 1, 1, 1,
-0.1067977, -0.9748943, -3.520923, 1, 1, 1, 1, 1,
-0.09889903, 0.2542507, 0.6780592, 1, 1, 1, 1, 1,
-0.09802175, 1.623342, -0.1107522, 0, 0, 1, 1, 1,
-0.09584592, 1.325288, 1.122161, 1, 0, 0, 1, 1,
-0.09578872, 0.3671763, 0.8578296, 1, 0, 0, 1, 1,
-0.09431018, -0.2494778, -2.098925, 1, 0, 0, 1, 1,
-0.08982904, 0.7286738, 0.7550755, 1, 0, 0, 1, 1,
-0.08567596, -0.6459659, -1.629826, 1, 0, 0, 1, 1,
-0.08468885, 0.08089735, -0.799641, 0, 0, 0, 1, 1,
-0.08432642, -0.5341922, -3.779967, 0, 0, 0, 1, 1,
-0.08228839, -0.4302407, -3.431483, 0, 0, 0, 1, 1,
-0.08169597, -0.9994458, -1.895749, 0, 0, 0, 1, 1,
-0.07988842, 0.6298417, 2.026174, 0, 0, 0, 1, 1,
-0.07412855, 1.334621, -0.4790386, 0, 0, 0, 1, 1,
-0.07198719, -0.2190952, -2.083196, 0, 0, 0, 1, 1,
-0.07076859, -0.4649938, -2.56546, 1, 1, 1, 1, 1,
-0.06859227, -0.4589394, -3.189958, 1, 1, 1, 1, 1,
-0.06570499, -1.386911, -3.152981, 1, 1, 1, 1, 1,
-0.06565698, 0.4421737, -1.585107, 1, 1, 1, 1, 1,
-0.0635896, 1.042983, 0.9377096, 1, 1, 1, 1, 1,
-0.05966857, 0.1292445, -2.344643, 1, 1, 1, 1, 1,
-0.05440909, 0.8565233, -0.2328903, 1, 1, 1, 1, 1,
-0.04612044, 0.9563323, -1.506791, 1, 1, 1, 1, 1,
-0.04492262, 0.08060397, -1.229601, 1, 1, 1, 1, 1,
-0.04215143, -0.7726108, -1.97801, 1, 1, 1, 1, 1,
-0.03990632, 1.612937, 2.18932, 1, 1, 1, 1, 1,
-0.03526944, -0.02489324, -1.779961, 1, 1, 1, 1, 1,
-0.0267112, 0.09857438, -1.763042, 1, 1, 1, 1, 1,
-0.0259898, 0.3925818, 0.1697608, 1, 1, 1, 1, 1,
-0.02543654, 2.495631, -1.593748, 1, 1, 1, 1, 1,
-0.02176901, -0.3285536, -3.13852, 0, 0, 1, 1, 1,
-0.02035405, -0.9132977, -1.791677, 1, 0, 0, 1, 1,
-0.01964179, 0.8841538, 1.277016, 1, 0, 0, 1, 1,
-0.0155486, 0.6486757, 0.3222149, 1, 0, 0, 1, 1,
-0.01404807, -1.246176, -3.683659, 1, 0, 0, 1, 1,
-0.01386109, -0.5981398, -3.84626, 1, 0, 0, 1, 1,
-0.01285129, -2.073772, -2.929052, 0, 0, 0, 1, 1,
-0.01142343, 0.9962839, -0.4811859, 0, 0, 0, 1, 1,
-0.01129794, -0.1674631, -4.83626, 0, 0, 0, 1, 1,
-0.008274488, -0.4693626, -2.840636, 0, 0, 0, 1, 1,
0.003539799, -0.8557115, 3.040119, 0, 0, 0, 1, 1,
0.00798578, -0.9013789, 2.564306, 0, 0, 0, 1, 1,
0.00868162, -0.02240361, 2.387521, 0, 0, 0, 1, 1,
0.008722377, -0.8154349, 1.203621, 1, 1, 1, 1, 1,
0.01075866, -1.054733, 2.761024, 1, 1, 1, 1, 1,
0.01311558, 0.3288878, -0.3897186, 1, 1, 1, 1, 1,
0.01400083, -0.535313, 1.704012, 1, 1, 1, 1, 1,
0.01536006, 1.874529, -0.433116, 1, 1, 1, 1, 1,
0.01546321, -1.676725, 2.557053, 1, 1, 1, 1, 1,
0.01675897, 0.03480766, 0.9309371, 1, 1, 1, 1, 1,
0.01717444, -1.252389, 2.865924, 1, 1, 1, 1, 1,
0.01902136, 0.354568, 1.39663, 1, 1, 1, 1, 1,
0.01962965, -1.704042, 1.40386, 1, 1, 1, 1, 1,
0.02045401, 0.228733, -0.2566869, 1, 1, 1, 1, 1,
0.0235441, -1.019034, 4.939332, 1, 1, 1, 1, 1,
0.02588595, 0.2434607, 0.70861, 1, 1, 1, 1, 1,
0.02942602, 1.231503, -1.078959, 1, 1, 1, 1, 1,
0.02943144, 0.371273, 1.944027, 1, 1, 1, 1, 1,
0.03003681, 0.09951267, 1.665329, 0, 0, 1, 1, 1,
0.0310076, 1.906519, 1.536969, 1, 0, 0, 1, 1,
0.03371783, 1.973994, 0.8746216, 1, 0, 0, 1, 1,
0.03462511, -0.5129855, 1.670853, 1, 0, 0, 1, 1,
0.03494284, 0.4705374, -1.081072, 1, 0, 0, 1, 1,
0.04016574, 0.2551599, 1.4544, 1, 0, 0, 1, 1,
0.04016773, 0.8039356, 0.6000729, 0, 0, 0, 1, 1,
0.04685813, -0.2204481, 2.327608, 0, 0, 0, 1, 1,
0.04837427, -0.3657078, 2.041962, 0, 0, 0, 1, 1,
0.04839668, -0.4866776, 4.186351, 0, 0, 0, 1, 1,
0.04988786, -1.645486, 3.65553, 0, 0, 0, 1, 1,
0.05355439, -0.4693925, 3.240601, 0, 0, 0, 1, 1,
0.05361453, -0.9903546, 2.687085, 0, 0, 0, 1, 1,
0.05597727, 0.07437721, 1.284164, 1, 1, 1, 1, 1,
0.05689927, -1.306009, 3.562012, 1, 1, 1, 1, 1,
0.05758201, 1.996424, 0.77219, 1, 1, 1, 1, 1,
0.05886966, -1.112714, 3.549983, 1, 1, 1, 1, 1,
0.06534683, -1.678176, 3.127571, 1, 1, 1, 1, 1,
0.06739113, 1.079989, -0.8511804, 1, 1, 1, 1, 1,
0.06853998, 0.2235948, -0.5011635, 1, 1, 1, 1, 1,
0.07585485, -2.28278, 2.44132, 1, 1, 1, 1, 1,
0.07903861, 1.165941, -0.5075449, 1, 1, 1, 1, 1,
0.08050437, 0.1109024, 0.8841442, 1, 1, 1, 1, 1,
0.08354276, -0.4744018, 1.203332, 1, 1, 1, 1, 1,
0.08441703, 1.981742, -0.3097692, 1, 1, 1, 1, 1,
0.08563547, -1.154966, 1.653811, 1, 1, 1, 1, 1,
0.08763495, 0.06173673, -0.1929488, 1, 1, 1, 1, 1,
0.08881211, -0.8943487, 3.147439, 1, 1, 1, 1, 1,
0.09193396, 0.8806814, -0.4687006, 0, 0, 1, 1, 1,
0.09200171, 1.768229, -0.1490359, 1, 0, 0, 1, 1,
0.09248281, -0.2720152, 1.660537, 1, 0, 0, 1, 1,
0.09331609, -0.3538597, 2.929347, 1, 0, 0, 1, 1,
0.09348325, -0.3488162, 2.446701, 1, 0, 0, 1, 1,
0.09873177, 1.552982, 0.01671637, 1, 0, 0, 1, 1,
0.09966319, 0.1962262, 1.22456, 0, 0, 0, 1, 1,
0.1106104, -0.5261027, 1.399645, 0, 0, 0, 1, 1,
0.1149167, -0.8106496, 2.597644, 0, 0, 0, 1, 1,
0.123216, 0.1696627, 0.7249749, 0, 0, 0, 1, 1,
0.1277356, 1.126456, -0.283187, 0, 0, 0, 1, 1,
0.1324979, -2.583654, 2.639069, 0, 0, 0, 1, 1,
0.1329248, 0.03786721, 1.009462, 0, 0, 0, 1, 1,
0.1339033, -1.127625, 0.2332453, 1, 1, 1, 1, 1,
0.1345321, 0.4642353, -1.059457, 1, 1, 1, 1, 1,
0.138256, -0.5447655, 2.450285, 1, 1, 1, 1, 1,
0.1429822, -0.950325, 0.4379009, 1, 1, 1, 1, 1,
0.1447055, 2.509861, -0.8796551, 1, 1, 1, 1, 1,
0.1503496, -0.07664679, 1.874329, 1, 1, 1, 1, 1,
0.1529673, -0.281617, 3.778606, 1, 1, 1, 1, 1,
0.1542674, 0.02953738, 1.555987, 1, 1, 1, 1, 1,
0.1547504, 0.6433234, -0.7110258, 1, 1, 1, 1, 1,
0.1562744, 0.5003183, 0.2199552, 1, 1, 1, 1, 1,
0.1575135, 0.5628515, -0.4249688, 1, 1, 1, 1, 1,
0.1674524, -0.8556174, 2.763739, 1, 1, 1, 1, 1,
0.1683829, 1.964121, -1.782506, 1, 1, 1, 1, 1,
0.1694368, 1.454856, -0.104296, 1, 1, 1, 1, 1,
0.1758005, 0.3871428, -0.1215918, 1, 1, 1, 1, 1,
0.1768778, 0.5706528, -1.778154, 0, 0, 1, 1, 1,
0.1774754, -0.5241783, 2.515994, 1, 0, 0, 1, 1,
0.1797157, -0.1613756, 2.524081, 1, 0, 0, 1, 1,
0.1797439, 1.521853, -0.7794767, 1, 0, 0, 1, 1,
0.1819016, -1.335209, 3.403703, 1, 0, 0, 1, 1,
0.1830294, -0.8667206, 3.867324, 1, 0, 0, 1, 1,
0.1839374, 1.692806, -0.526769, 0, 0, 0, 1, 1,
0.185839, -1.16869, 2.93178, 0, 0, 0, 1, 1,
0.1861385, 2.198275, -1.147849, 0, 0, 0, 1, 1,
0.1866307, -0.2060659, 3.46413, 0, 0, 0, 1, 1,
0.1904762, -0.005572699, 2.004617, 0, 0, 0, 1, 1,
0.191842, -0.01359167, 1.238774, 0, 0, 0, 1, 1,
0.1997721, -0.2551125, 3.410245, 0, 0, 0, 1, 1,
0.2042523, 0.9079652, -0.7111914, 1, 1, 1, 1, 1,
0.2064156, 0.9196924, 0.7912359, 1, 1, 1, 1, 1,
0.2094983, -0.8562302, 2.436654, 1, 1, 1, 1, 1,
0.2100674, -1.785104, 2.39444, 1, 1, 1, 1, 1,
0.2134534, -1.123597, 2.339897, 1, 1, 1, 1, 1,
0.2137029, -0.239628, 2.932743, 1, 1, 1, 1, 1,
0.2166172, 0.2455556, 0.1465346, 1, 1, 1, 1, 1,
0.2195468, -0.4524012, 3.05919, 1, 1, 1, 1, 1,
0.2239734, -0.4229751, 2.030492, 1, 1, 1, 1, 1,
0.2242308, -0.370086, 2.869425, 1, 1, 1, 1, 1,
0.2250834, -0.1199109, 2.83687, 1, 1, 1, 1, 1,
0.225526, 0.1978574, 1.360531, 1, 1, 1, 1, 1,
0.2311272, 1.656108, -0.4749752, 1, 1, 1, 1, 1,
0.2337828, 0.455581, 1.181043, 1, 1, 1, 1, 1,
0.2406783, -0.5051917, 3.74392, 1, 1, 1, 1, 1,
0.2417386, -2.423171, 3.100734, 0, 0, 1, 1, 1,
0.2418161, 0.44718, 0.1274179, 1, 0, 0, 1, 1,
0.2437278, 1.435931, 0.6882378, 1, 0, 0, 1, 1,
0.2475895, -0.9114935, 4.499496, 1, 0, 0, 1, 1,
0.250207, -1.289137, 1.09654, 1, 0, 0, 1, 1,
0.2518096, 0.1612643, -0.5263009, 1, 0, 0, 1, 1,
0.2525411, -2.416832, 4.440749, 0, 0, 0, 1, 1,
0.2560226, -0.8099402, 2.309961, 0, 0, 0, 1, 1,
0.258502, -0.6448396, 2.056475, 0, 0, 0, 1, 1,
0.2592211, 0.08581905, 0.4547205, 0, 0, 0, 1, 1,
0.2598109, 1.364139, 1.657979, 0, 0, 0, 1, 1,
0.261389, 1.14755, 1.535636, 0, 0, 0, 1, 1,
0.2650325, 1.702434, -0.9367546, 0, 0, 0, 1, 1,
0.266307, 0.2788447, 0.6184949, 1, 1, 1, 1, 1,
0.2673083, 0.7725201, 1.017131, 1, 1, 1, 1, 1,
0.2676926, -1.990136, 2.579611, 1, 1, 1, 1, 1,
0.2687649, 1.331379, -0.133573, 1, 1, 1, 1, 1,
0.2729121, 0.8356633, 0.3536787, 1, 1, 1, 1, 1,
0.273659, 2.616299, -0.2453641, 1, 1, 1, 1, 1,
0.277277, -0.4076956, 1.237613, 1, 1, 1, 1, 1,
0.2799346, 1.241654, -0.496575, 1, 1, 1, 1, 1,
0.2824816, 1.227236, -1.410153, 1, 1, 1, 1, 1,
0.2892087, -0.5863156, 4.150176, 1, 1, 1, 1, 1,
0.29072, 0.1802505, 0.8932914, 1, 1, 1, 1, 1,
0.2940885, -0.5666802, 3.178699, 1, 1, 1, 1, 1,
0.2967996, -0.7230753, 2.24314, 1, 1, 1, 1, 1,
0.2986858, 0.963651, -1.415658, 1, 1, 1, 1, 1,
0.2988866, 1.189628, 0.7094625, 1, 1, 1, 1, 1,
0.2999483, 1.767222, -0.3816615, 0, 0, 1, 1, 1,
0.299988, 0.7256278, -1.511276, 1, 0, 0, 1, 1,
0.3030526, -1.277033, 2.852783, 1, 0, 0, 1, 1,
0.3060827, 1.136856, -1.029087, 1, 0, 0, 1, 1,
0.306134, -0.3415855, 2.678217, 1, 0, 0, 1, 1,
0.3067342, -0.5830622, 2.184118, 1, 0, 0, 1, 1,
0.3081308, -0.8014364, 3.749629, 0, 0, 0, 1, 1,
0.3091878, -1.64619, 2.432361, 0, 0, 0, 1, 1,
0.310392, -0.3467384, 1.106231, 0, 0, 0, 1, 1,
0.312388, 0.4684688, 0.4887321, 0, 0, 0, 1, 1,
0.3140443, -0.01730714, 1.924051, 0, 0, 0, 1, 1,
0.3150917, 0.9568995, 0.274564, 0, 0, 0, 1, 1,
0.3202606, -0.3021024, 1.887937, 0, 0, 0, 1, 1,
0.3215952, 1.622553, -0.3346607, 1, 1, 1, 1, 1,
0.3307591, 0.009343898, 3.686721, 1, 1, 1, 1, 1,
0.3317607, -0.8271222, 2.603093, 1, 1, 1, 1, 1,
0.3318215, -1.486391, 4.35387, 1, 1, 1, 1, 1,
0.3337003, -0.6957993, 1.013804, 1, 1, 1, 1, 1,
0.3341225, 0.6650796, -0.3175379, 1, 1, 1, 1, 1,
0.3346582, -0.0824577, 1.640923, 1, 1, 1, 1, 1,
0.335076, -0.9176676, 2.440904, 1, 1, 1, 1, 1,
0.3398739, 1.180619, 1.443477, 1, 1, 1, 1, 1,
0.3436758, -0.2612189, 2.151953, 1, 1, 1, 1, 1,
0.3478719, 0.6227865, 1.047082, 1, 1, 1, 1, 1,
0.3500968, 0.2143794, 1.732232, 1, 1, 1, 1, 1,
0.3504495, -0.7410722, 2.981904, 1, 1, 1, 1, 1,
0.3515655, -0.4537444, 1.869563, 1, 1, 1, 1, 1,
0.3538544, 0.3824357, 1.34868, 1, 1, 1, 1, 1,
0.3557403, -1.606402, 3.99352, 0, 0, 1, 1, 1,
0.3558942, 1.600588, -0.7241085, 1, 0, 0, 1, 1,
0.3592448, 0.9435349, -1.446835, 1, 0, 0, 1, 1,
0.3598898, -0.8413507, 1.12642, 1, 0, 0, 1, 1,
0.3607557, -0.8611026, 2.76425, 1, 0, 0, 1, 1,
0.362765, 1.401809, 0.5053539, 1, 0, 0, 1, 1,
0.364277, 1.015804, -0.02338871, 0, 0, 0, 1, 1,
0.3645133, -0.3643758, 2.054661, 0, 0, 0, 1, 1,
0.367198, -0.6958812, 2.602725, 0, 0, 0, 1, 1,
0.3793768, -1.225904, 2.721475, 0, 0, 0, 1, 1,
0.3799831, 0.9001019, -0.6677344, 0, 0, 0, 1, 1,
0.380596, -0.2562671, 2.520485, 0, 0, 0, 1, 1,
0.3816685, -0.8554183, 2.61204, 0, 0, 0, 1, 1,
0.3829291, 1.888888, -0.9139179, 1, 1, 1, 1, 1,
0.3880941, -1.337412, 2.099806, 1, 1, 1, 1, 1,
0.3891099, -1.863838, 2.438984, 1, 1, 1, 1, 1,
0.3930832, -0.09156796, 2.841238, 1, 1, 1, 1, 1,
0.3945997, 0.1910452, 1.957041, 1, 1, 1, 1, 1,
0.394683, 0.149379, -0.590699, 1, 1, 1, 1, 1,
0.3947393, -0.836804, 1.955419, 1, 1, 1, 1, 1,
0.3959179, -0.7739985, 1.770413, 1, 1, 1, 1, 1,
0.3960383, -0.6072986, 2.664075, 1, 1, 1, 1, 1,
0.3967811, 2.129375, 1.144071, 1, 1, 1, 1, 1,
0.397503, 0.1233557, 0.4869373, 1, 1, 1, 1, 1,
0.4080938, 0.09878074, 2.483055, 1, 1, 1, 1, 1,
0.4158672, 0.8327984, -0.7972496, 1, 1, 1, 1, 1,
0.4159815, 1.45235, 0.590479, 1, 1, 1, 1, 1,
0.4162588, 0.275681, 2.299368, 1, 1, 1, 1, 1,
0.4168045, 2.254154, 0.2989894, 0, 0, 1, 1, 1,
0.4170016, 2.11793, 0.3956235, 1, 0, 0, 1, 1,
0.4188189, 0.1922535, -0.2758577, 1, 0, 0, 1, 1,
0.4190868, 0.6605716, 1.380189, 1, 0, 0, 1, 1,
0.4193695, -0.2785558, 0.9587334, 1, 0, 0, 1, 1,
0.4210011, -0.2858324, 2.830615, 1, 0, 0, 1, 1,
0.4231773, 0.6565824, 1.949355, 0, 0, 0, 1, 1,
0.4278159, 0.7822292, 0.9070508, 0, 0, 0, 1, 1,
0.4293836, -1.314755, 2.688332, 0, 0, 0, 1, 1,
0.4297661, -0.1434951, 2.294869, 0, 0, 0, 1, 1,
0.4300382, 1.436565, -1.234749, 0, 0, 0, 1, 1,
0.4303954, 0.470791, -0.3603363, 0, 0, 0, 1, 1,
0.4310976, -0.3624145, 2.157144, 0, 0, 0, 1, 1,
0.436727, -0.4732083, 3.035055, 1, 1, 1, 1, 1,
0.4408431, -0.09456597, 3.284059, 1, 1, 1, 1, 1,
0.4435126, 1.196049, 1.326057, 1, 1, 1, 1, 1,
0.4449764, 0.8166396, 0.2471508, 1, 1, 1, 1, 1,
0.449542, 2.384018, 1.747705, 1, 1, 1, 1, 1,
0.45245, 0.4333685, 1.00863, 1, 1, 1, 1, 1,
0.4588539, -0.6272675, 2.46323, 1, 1, 1, 1, 1,
0.46066, -0.6079553, 1.2062, 1, 1, 1, 1, 1,
0.4647391, 0.008213411, 0.3088867, 1, 1, 1, 1, 1,
0.4659991, 1.104442, 1.22143, 1, 1, 1, 1, 1,
0.4667991, -0.1273085, 2.217505, 1, 1, 1, 1, 1,
0.4683558, 0.2161489, 1.554453, 1, 1, 1, 1, 1,
0.4686582, 0.203897, 0.9401619, 1, 1, 1, 1, 1,
0.4714327, 0.2143491, 2.785825, 1, 1, 1, 1, 1,
0.477026, -0.3485751, 0.6776712, 1, 1, 1, 1, 1,
0.4874116, -0.0797459, 2.423568, 0, 0, 1, 1, 1,
0.488117, 1.006547, 0.02723194, 1, 0, 0, 1, 1,
0.4891983, 0.1500497, 0.01005344, 1, 0, 0, 1, 1,
0.4975547, -1.099524, 2.4428, 1, 0, 0, 1, 1,
0.509109, -0.7844687, 2.241234, 1, 0, 0, 1, 1,
0.5144802, 0.314502, -0.3771516, 1, 0, 0, 1, 1,
0.5160307, 0.3121873, 1.371261, 0, 0, 0, 1, 1,
0.5194381, -0.8855995, 1.199267, 0, 0, 0, 1, 1,
0.5206265, 0.04940386, -0.6365234, 0, 0, 0, 1, 1,
0.5280101, 1.574594, 1.867022, 0, 0, 0, 1, 1,
0.5325164, -0.9314032, 4.547888, 0, 0, 0, 1, 1,
0.5332164, -0.2440221, 0.966948, 0, 0, 0, 1, 1,
0.5344146, 1.939624, -0.2889175, 0, 0, 0, 1, 1,
0.5386008, 1.604202, 1.217544, 1, 1, 1, 1, 1,
0.5412267, 0.09668603, 1.439625, 1, 1, 1, 1, 1,
0.5444173, -0.2885955, 2.920016, 1, 1, 1, 1, 1,
0.5445945, -0.3486228, 3.419931, 1, 1, 1, 1, 1,
0.5478701, -0.234908, 2.264037, 1, 1, 1, 1, 1,
0.5482019, -0.4964448, 1.978048, 1, 1, 1, 1, 1,
0.5487251, 0.5449702, 2.228675, 1, 1, 1, 1, 1,
0.558805, 0.3899469, 1.371636, 1, 1, 1, 1, 1,
0.5639876, 1.328815, 1.431949, 1, 1, 1, 1, 1,
0.571184, -0.5624614, 2.984284, 1, 1, 1, 1, 1,
0.5721611, -0.8388863, 3.592975, 1, 1, 1, 1, 1,
0.5735083, 1.779025, -0.3556755, 1, 1, 1, 1, 1,
0.5755008, 1.240227, -1.997866, 1, 1, 1, 1, 1,
0.5765432, 0.2671689, 2.3532, 1, 1, 1, 1, 1,
0.5778465, -0.1927725, 3.17596, 1, 1, 1, 1, 1,
0.5798679, -0.2100897, -0.08403096, 0, 0, 1, 1, 1,
0.5892002, 1.65586, 1.009272, 1, 0, 0, 1, 1,
0.5906335, 0.3509058, 1.769501, 1, 0, 0, 1, 1,
0.5966298, 0.3651904, 1.036123, 1, 0, 0, 1, 1,
0.5966939, 0.8669386, -0.1105361, 1, 0, 0, 1, 1,
0.5987071, -0.08500668, 2.532187, 1, 0, 0, 1, 1,
0.5989714, -1.695537, 3.071153, 0, 0, 0, 1, 1,
0.5999154, 0.1777666, 1.12037, 0, 0, 0, 1, 1,
0.6035805, -0.0208963, 2.121233, 0, 0, 0, 1, 1,
0.6054393, -0.1030096, 3.556717, 0, 0, 0, 1, 1,
0.6062444, -0.02071144, 3.020277, 0, 0, 0, 1, 1,
0.6069057, -0.7393001, 1.398389, 0, 0, 0, 1, 1,
0.6089566, -1.733938, 2.36663, 0, 0, 0, 1, 1,
0.6214049, 0.3619063, 0.4643401, 1, 1, 1, 1, 1,
0.6214194, -0.314389, 1.562528, 1, 1, 1, 1, 1,
0.6231651, -0.3268234, -0.01087802, 1, 1, 1, 1, 1,
0.6252496, -0.02898828, 1.55212, 1, 1, 1, 1, 1,
0.6312244, -0.1027688, 1.214544, 1, 1, 1, 1, 1,
0.6333575, -0.1436106, 1.205962, 1, 1, 1, 1, 1,
0.6370629, -2.486984, 2.12218, 1, 1, 1, 1, 1,
0.6383496, 0.9165617, -0.1599791, 1, 1, 1, 1, 1,
0.6388216, 0.700447, -0.08508399, 1, 1, 1, 1, 1,
0.6409301, 0.2473127, 0.9617167, 1, 1, 1, 1, 1,
0.656001, 0.8943725, 0.8949193, 1, 1, 1, 1, 1,
0.6569687, 0.2402972, -0.6967796, 1, 1, 1, 1, 1,
0.6604807, -0.6746813, 2.809541, 1, 1, 1, 1, 1,
0.660947, 2.493549, 0.2523696, 1, 1, 1, 1, 1,
0.6617665, 0.883446, 0.72127, 1, 1, 1, 1, 1,
0.6681171, 1.615406, -0.2125729, 0, 0, 1, 1, 1,
0.6681275, 0.1467277, 2.815125, 1, 0, 0, 1, 1,
0.6773126, 0.1052984, 2.327086, 1, 0, 0, 1, 1,
0.6774331, 0.7033707, 0.9901136, 1, 0, 0, 1, 1,
0.6851032, 0.94672, -1.479465, 1, 0, 0, 1, 1,
0.6875196, -1.020244, 2.88763, 1, 0, 0, 1, 1,
0.6903543, 0.5692481, 0.1074086, 0, 0, 0, 1, 1,
0.6927716, -1.113312, 1.107693, 0, 0, 0, 1, 1,
0.6951547, 1.758326, -0.7710475, 0, 0, 0, 1, 1,
0.6956646, -0.07045821, 0.7141891, 0, 0, 0, 1, 1,
0.7075983, -1.047892, 2.886658, 0, 0, 0, 1, 1,
0.7163873, 0.7030293, 0.58321, 0, 0, 0, 1, 1,
0.7166145, 1.510399, 2.952483, 0, 0, 0, 1, 1,
0.7175649, -0.7289228, 1.595785, 1, 1, 1, 1, 1,
0.7184941, -0.391219, 2.328841, 1, 1, 1, 1, 1,
0.7307087, 0.06540441, 2.119351, 1, 1, 1, 1, 1,
0.7362572, 1.603694, 0.006553572, 1, 1, 1, 1, 1,
0.7377636, -1.479263, 2.96905, 1, 1, 1, 1, 1,
0.7397107, 0.4236558, 0.5703959, 1, 1, 1, 1, 1,
0.7400611, -0.6378765, 1.748722, 1, 1, 1, 1, 1,
0.7409996, 1.873106, 0.3194721, 1, 1, 1, 1, 1,
0.7458733, 0.323265, 2.035636, 1, 1, 1, 1, 1,
0.7466564, -1.968264, 3.275651, 1, 1, 1, 1, 1,
0.7482775, 0.9371725, 0.836495, 1, 1, 1, 1, 1,
0.7533762, 1.208028, -0.1520543, 1, 1, 1, 1, 1,
0.7563159, 1.527696, 0.3341676, 1, 1, 1, 1, 1,
0.7601995, -0.4689674, 2.092152, 1, 1, 1, 1, 1,
0.7633373, -0.6952773, 2.715296, 1, 1, 1, 1, 1,
0.7657482, -0.06834324, -0.4283229, 0, 0, 1, 1, 1,
0.7689072, -1.418931, 0.1077214, 1, 0, 0, 1, 1,
0.7694296, 0.5272595, 1.622092, 1, 0, 0, 1, 1,
0.7740331, -0.7844756, 3.908579, 1, 0, 0, 1, 1,
0.7748789, -2.03153, 2.760367, 1, 0, 0, 1, 1,
0.7831988, -0.6769344, 3.211271, 1, 0, 0, 1, 1,
0.7875508, 1.80205, -1.019818, 0, 0, 0, 1, 1,
0.7892374, 1.365582, -0.4636109, 0, 0, 0, 1, 1,
0.7961517, 0.07893903, 1.672893, 0, 0, 0, 1, 1,
0.7966665, -0.07753378, 3.85512, 0, 0, 0, 1, 1,
0.7969302, 0.4294438, 1.034576, 0, 0, 0, 1, 1,
0.7983741, -0.4336762, 1.959555, 0, 0, 0, 1, 1,
0.8030919, -0.7565488, 3.877228, 0, 0, 0, 1, 1,
0.8032389, -1.063908, 1.663754, 1, 1, 1, 1, 1,
0.8040006, 1.30718, -0.1440692, 1, 1, 1, 1, 1,
0.8114352, 0.6352224, 1.727957, 1, 1, 1, 1, 1,
0.813241, -0.2322202, 1.41967, 1, 1, 1, 1, 1,
0.8138891, 0.9799065, -1.818318, 1, 1, 1, 1, 1,
0.8220527, 1.584926, 0.8709684, 1, 1, 1, 1, 1,
0.8229837, 0.09611353, 1.293194, 1, 1, 1, 1, 1,
0.8354655, 1.7921, -0.1500826, 1, 1, 1, 1, 1,
0.8434209, 0.5986639, 1.901178, 1, 1, 1, 1, 1,
0.8473387, -1.114382, 2.71302, 1, 1, 1, 1, 1,
0.8500269, 0.152159, 2.065755, 1, 1, 1, 1, 1,
0.862247, -0.9324421, 2.614954, 1, 1, 1, 1, 1,
0.8699372, 0.3923183, 0.930377, 1, 1, 1, 1, 1,
0.8700443, 0.1594112, 2.676775, 1, 1, 1, 1, 1,
0.8746673, 1.640829, 1.868567, 1, 1, 1, 1, 1,
0.8765631, 1.158635, 0.3012738, 0, 0, 1, 1, 1,
0.8791113, 1.369957, 0.1738587, 1, 0, 0, 1, 1,
0.8864655, 2.09514, -0.6655262, 1, 0, 0, 1, 1,
0.8876197, 0.5217849, 1.404453, 1, 0, 0, 1, 1,
0.8909391, 0.9055741, 1.219567, 1, 0, 0, 1, 1,
0.894634, 1.170453, 1.74241, 1, 0, 0, 1, 1,
0.8963712, -0.07710068, 2.438302, 0, 0, 0, 1, 1,
0.8968273, -0.8768291, 3.12277, 0, 0, 0, 1, 1,
0.8998082, 0.4022858, 0.8227729, 0, 0, 0, 1, 1,
0.9069483, 0.6827095, 2.626075, 0, 0, 0, 1, 1,
0.910473, -0.2734537, 0.572484, 0, 0, 0, 1, 1,
0.9136603, 2.221384, -1.916851, 0, 0, 0, 1, 1,
0.9141735, 2.371627, -0.8325393, 0, 0, 0, 1, 1,
0.9187109, 0.8341235, 0.6974489, 1, 1, 1, 1, 1,
0.92153, 0.434518, 0.4430361, 1, 1, 1, 1, 1,
0.9223572, 0.246952, 1.141294, 1, 1, 1, 1, 1,
0.9453568, 2.422955, 1.979686, 1, 1, 1, 1, 1,
0.9454261, -2.608583, 4.07143, 1, 1, 1, 1, 1,
0.9521832, -1.035194, 3.392857, 1, 1, 1, 1, 1,
0.9534909, 0.6288472, 0.6194361, 1, 1, 1, 1, 1,
0.9595266, -0.2188172, 1.958524, 1, 1, 1, 1, 1,
0.9663552, -1.277563, 3.687889, 1, 1, 1, 1, 1,
0.9674033, 0.1710459, 1.179729, 1, 1, 1, 1, 1,
0.9711435, -0.1024985, 1.892565, 1, 1, 1, 1, 1,
0.9720716, -0.06295571, 1.800023, 1, 1, 1, 1, 1,
0.9774724, -0.3304774, 1.67882, 1, 1, 1, 1, 1,
0.9833029, -1.216114, 3.908628, 1, 1, 1, 1, 1,
0.9838242, -0.1008254, 3.665731, 1, 1, 1, 1, 1,
0.9851681, 1.320932, 0.8632542, 0, 0, 1, 1, 1,
0.9924147, -0.5446169, 1.833872, 1, 0, 0, 1, 1,
0.9936749, 0.1892415, 1.960904, 1, 0, 0, 1, 1,
1.00308, 0.5552649, 1.197486, 1, 0, 0, 1, 1,
1.004519, 1.50852, 2.124393, 1, 0, 0, 1, 1,
1.004879, 1.115409, 2.635396, 1, 0, 0, 1, 1,
1.013739, -0.8634885, 2.038294, 0, 0, 0, 1, 1,
1.015092, -1.032846, 1.34665, 0, 0, 0, 1, 1,
1.017761, 0.8699094, 1.297222, 0, 0, 0, 1, 1,
1.021908, -0.7423565, 3.377133, 0, 0, 0, 1, 1,
1.030433, -0.9808287, 4.292357, 0, 0, 0, 1, 1,
1.036204, -0.8485143, 1.844633, 0, 0, 0, 1, 1,
1.042782, 0.1637415, 1.526986, 0, 0, 0, 1, 1,
1.044102, 2.296355, 1.814089, 1, 1, 1, 1, 1,
1.044478, -0.6738415, 2.914148, 1, 1, 1, 1, 1,
1.046239, -1.009869, 1.175387, 1, 1, 1, 1, 1,
1.055986, -0.6876832, 2.019193, 1, 1, 1, 1, 1,
1.060136, -0.9844617, 2.875927, 1, 1, 1, 1, 1,
1.060526, -0.0448662, 0.869925, 1, 1, 1, 1, 1,
1.061424, 0.5868482, 0.6070656, 1, 1, 1, 1, 1,
1.067552, 0.1131652, 0.6643075, 1, 1, 1, 1, 1,
1.07917, 0.8227122, 1.927939, 1, 1, 1, 1, 1,
1.083905, 1.078364, 1.431205, 1, 1, 1, 1, 1,
1.088064, -0.07358707, 1.992193, 1, 1, 1, 1, 1,
1.091703, -0.4521663, 1.882288, 1, 1, 1, 1, 1,
1.094118, 0.420858, 1.374307, 1, 1, 1, 1, 1,
1.094877, -0.3118766, 0.4463374, 1, 1, 1, 1, 1,
1.096374, 0.1248879, 2.454153, 1, 1, 1, 1, 1,
1.100277, 0.8451252, 1.27698, 0, 0, 1, 1, 1,
1.10308, -0.8324174, 1.64444, 1, 0, 0, 1, 1,
1.112962, 0.1949732, 1.458593, 1, 0, 0, 1, 1,
1.116062, 1.110166, 0.2962988, 1, 0, 0, 1, 1,
1.123273, -1.329794, 2.898833, 1, 0, 0, 1, 1,
1.125871, 1.696132, -1.034391, 1, 0, 0, 1, 1,
1.127951, -0.2562348, 2.395311, 0, 0, 0, 1, 1,
1.130629, -0.9085217, 0.3365896, 0, 0, 0, 1, 1,
1.133554, -1.44248, 2.226868, 0, 0, 0, 1, 1,
1.13876, 1.040301, -2.81881, 0, 0, 0, 1, 1,
1.139946, -0.8082129, 0.2311856, 0, 0, 0, 1, 1,
1.142222, 0.8543286, 1.931902, 0, 0, 0, 1, 1,
1.143786, 1.587306, -0.4673771, 0, 0, 0, 1, 1,
1.144435, 0.1565751, -0.06800844, 1, 1, 1, 1, 1,
1.151269, 0.5202238, 0.2909008, 1, 1, 1, 1, 1,
1.15251, 1.17449, -0.6644991, 1, 1, 1, 1, 1,
1.159443, 0.1417451, 0.8565415, 1, 1, 1, 1, 1,
1.161259, 0.2641667, 1.391894, 1, 1, 1, 1, 1,
1.173078, -0.03086596, 0.9327034, 1, 1, 1, 1, 1,
1.181555, -0.4812574, 1.449839, 1, 1, 1, 1, 1,
1.190773, 0.01059414, -0.1280917, 1, 1, 1, 1, 1,
1.19228, 0.8642437, 0.009756063, 1, 1, 1, 1, 1,
1.197377, 0.6595687, -0.8750703, 1, 1, 1, 1, 1,
1.19778, 0.1081551, 1.334247, 1, 1, 1, 1, 1,
1.200458, -1.667036, 2.373477, 1, 1, 1, 1, 1,
1.200548, 1.153901, 1.386068, 1, 1, 1, 1, 1,
1.217512, -2.351505, 3.224777, 1, 1, 1, 1, 1,
1.220245, 0.689038, 0.5932497, 1, 1, 1, 1, 1,
1.221347, 2.658503, -1.886494, 0, 0, 1, 1, 1,
1.245555, -0.978136, 2.94412, 1, 0, 0, 1, 1,
1.248188, 3.235566, 0.7093105, 1, 0, 0, 1, 1,
1.264661, 0.38839, 2.084272, 1, 0, 0, 1, 1,
1.266091, 0.744121, 1.062442, 1, 0, 0, 1, 1,
1.281482, 0.3434508, 0.003278619, 1, 0, 0, 1, 1,
1.284696, 0.6124403, 4.269772, 0, 0, 0, 1, 1,
1.295726, 0.4319837, 2.370026, 0, 0, 0, 1, 1,
1.297277, 0.2512828, 1.15373, 0, 0, 0, 1, 1,
1.314458, -1.118044, 0.976024, 0, 0, 0, 1, 1,
1.314759, -0.09069587, 1.074112, 0, 0, 0, 1, 1,
1.320881, 0.2562862, 0.2052698, 0, 0, 0, 1, 1,
1.323489, -0.5322787, 2.995309, 0, 0, 0, 1, 1,
1.327319, 1.262437, 1.844563, 1, 1, 1, 1, 1,
1.329088, 0.4579301, 0.5539579, 1, 1, 1, 1, 1,
1.332251, -0.8197827, 2.63208, 1, 1, 1, 1, 1,
1.350035, 0.526517, 0.6678022, 1, 1, 1, 1, 1,
1.352439, -1.359001, 3.174401, 1, 1, 1, 1, 1,
1.354569, 1.942261, -0.2152133, 1, 1, 1, 1, 1,
1.355755, -0.1183002, 1.321839, 1, 1, 1, 1, 1,
1.361341, 0.08578364, 2.323198, 1, 1, 1, 1, 1,
1.361347, -2.005192, 2.22335, 1, 1, 1, 1, 1,
1.362653, -0.1534537, 0.5687452, 1, 1, 1, 1, 1,
1.364793, -1.02053, 3.416688, 1, 1, 1, 1, 1,
1.365361, -0.6862669, 0.9911055, 1, 1, 1, 1, 1,
1.367042, -1.248359, 1.814451, 1, 1, 1, 1, 1,
1.371356, -0.428961, 3.337886, 1, 1, 1, 1, 1,
1.372989, 0.1508036, 1.979376, 1, 1, 1, 1, 1,
1.377834, -0.457861, 1.841995, 0, 0, 1, 1, 1,
1.378501, -0.3369158, 0.8310458, 1, 0, 0, 1, 1,
1.392294, 0.127999, 1.696073, 1, 0, 0, 1, 1,
1.394818, -0.1995189, 0.2810681, 1, 0, 0, 1, 1,
1.405651, 0.8140616, 1.68145, 1, 0, 0, 1, 1,
1.40828, 0.8576242, 1.235036, 1, 0, 0, 1, 1,
1.409763, -0.4493458, 1.553257, 0, 0, 0, 1, 1,
1.41639, -0.7805268, 1.722351, 0, 0, 0, 1, 1,
1.429425, 2.613299, -0.5957486, 0, 0, 0, 1, 1,
1.432714, -0.1962359, 2.35639, 0, 0, 0, 1, 1,
1.436313, 0.1870817, 2.487935, 0, 0, 0, 1, 1,
1.438147, 0.1839951, -0.1824314, 0, 0, 0, 1, 1,
1.454789, 0.608868, 2.624463, 0, 0, 0, 1, 1,
1.475389, -1.302555, 3.71488, 1, 1, 1, 1, 1,
1.477571, 0.6356694, 3.301487, 1, 1, 1, 1, 1,
1.479489, -0.7023379, 1.201019, 1, 1, 1, 1, 1,
1.481465, -0.05868609, 0.2530434, 1, 1, 1, 1, 1,
1.496245, 1.363168, 0.6519357, 1, 1, 1, 1, 1,
1.502219, -0.1714258, 0.6423534, 1, 1, 1, 1, 1,
1.508665, -0.6406368, 0.8592489, 1, 1, 1, 1, 1,
1.528751, -0.9661129, 1.922698, 1, 1, 1, 1, 1,
1.540347, 0.8304266, 1.992364, 1, 1, 1, 1, 1,
1.547352, 0.3283016, 1.18251, 1, 1, 1, 1, 1,
1.555899, 0.4505604, -0.503346, 1, 1, 1, 1, 1,
1.563147, 1.235072, 0.6263416, 1, 1, 1, 1, 1,
1.634077, -1.184643, 3.305981, 1, 1, 1, 1, 1,
1.656525, -1.08813, 4.295531, 1, 1, 1, 1, 1,
1.66577, -0.6862572, 2.81002, 1, 1, 1, 1, 1,
1.667823, 0.416286, 1.656192, 0, 0, 1, 1, 1,
1.671218, -1.337798, 2.136651, 1, 0, 0, 1, 1,
1.714486, -0.6604152, 0.4287849, 1, 0, 0, 1, 1,
1.723053, 0.4474249, 1.587297, 1, 0, 0, 1, 1,
1.72336, 0.820567, 1.974707, 1, 0, 0, 1, 1,
1.729524, 1.304687, 1.555822, 1, 0, 0, 1, 1,
1.744826, -0.296831, 3.663573, 0, 0, 0, 1, 1,
1.783576, -0.09324319, 1.787382, 0, 0, 0, 1, 1,
1.78359, 0.4644095, 1.403832, 0, 0, 0, 1, 1,
1.804837, 0.4197375, 1.589174, 0, 0, 0, 1, 1,
1.809701, 0.9774681, 1.447045, 0, 0, 0, 1, 1,
1.810257, -0.0409831, 1.546156, 0, 0, 0, 1, 1,
1.81528, 0.06390208, 1.293114, 0, 0, 0, 1, 1,
1.821277, 1.001531, 1.15618, 1, 1, 1, 1, 1,
1.835005, -0.8467787, 1.173647, 1, 1, 1, 1, 1,
1.841682, -0.9666509, 1.335568, 1, 1, 1, 1, 1,
1.868816, 1.705716, 2.172608, 1, 1, 1, 1, 1,
1.872503, 1.060635, -0.8023496, 1, 1, 1, 1, 1,
1.904163, 0.1591969, 3.293597, 1, 1, 1, 1, 1,
1.907925, -0.6999814, 1.826531, 1, 1, 1, 1, 1,
1.946486, 2.19967, 1.046659, 1, 1, 1, 1, 1,
1.948013, -1.248669, 1.672639, 1, 1, 1, 1, 1,
1.954401, 0.8790548, 1.776282, 1, 1, 1, 1, 1,
1.963544, -0.4467574, 0.4912334, 1, 1, 1, 1, 1,
1.966152, 2.293716, 1.791079, 1, 1, 1, 1, 1,
1.967362, 0.8578003, 2.531028, 1, 1, 1, 1, 1,
1.975961, -1.30819, 1.682765, 1, 1, 1, 1, 1,
1.988328, -0.1594272, 1.185293, 1, 1, 1, 1, 1,
1.988531, -0.5503253, 1.216396, 0, 0, 1, 1, 1,
2.001883, 0.8917435, 3.101779, 1, 0, 0, 1, 1,
2.02193, -1.302404, 0.8103708, 1, 0, 0, 1, 1,
2.026258, -0.4647968, 2.165243, 1, 0, 0, 1, 1,
2.066152, 1.209411, 1.883045, 1, 0, 0, 1, 1,
2.066214, 0.3185623, 1.822723, 1, 0, 0, 1, 1,
2.074507, 0.08133934, 2.642044, 0, 0, 0, 1, 1,
2.077011, 0.1213218, 2.170807, 0, 0, 0, 1, 1,
2.083656, -0.2535873, 0.5508488, 0, 0, 0, 1, 1,
2.090044, 0.2161752, 1.46556, 0, 0, 0, 1, 1,
2.116533, 0.9490151, 1.587037, 0, 0, 0, 1, 1,
2.139301, -1.028686, 1.634618, 0, 0, 0, 1, 1,
2.167352, 1.219131, 0.496372, 0, 0, 0, 1, 1,
2.229136, -0.4993537, 3.331695, 1, 1, 1, 1, 1,
2.371797, -1.854724, 3.374125, 1, 1, 1, 1, 1,
2.381763, 1.221389, 1.447225, 1, 1, 1, 1, 1,
2.389084, 1.194037, 0.5280633, 1, 1, 1, 1, 1,
2.581511, 0.4725666, 1.82644, 1, 1, 1, 1, 1,
2.644335, -0.05893175, 1.385545, 1, 1, 1, 1, 1,
2.872782, -0.6229188, 0.7577664, 1, 1, 1, 1, 1
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
var radius = 9.247349;
var distance = 32.48092;
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
mvMatrix.translate( 0.2072858, -0.2531197, 0.04493999 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.48092);
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