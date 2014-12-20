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
-3.310015, 0.3513632, -1.253709, 1, 0, 0, 1,
-2.872097, -0.00921593, -0.5337367, 1, 0.007843138, 0, 1,
-2.864467, 0.3780548, -1.36588, 1, 0.01176471, 0, 1,
-2.589958, 0.8314157, -2.133394, 1, 0.01960784, 0, 1,
-2.425116, -2.062499, -0.6545394, 1, 0.02352941, 0, 1,
-2.353058, 0.08991793, -0.3640583, 1, 0.03137255, 0, 1,
-2.317569, 0.6374574, 0.0626427, 1, 0.03529412, 0, 1,
-2.296099, 0.1692446, 0.2262669, 1, 0.04313726, 0, 1,
-2.262682, -0.08104162, -1.640439, 1, 0.04705882, 0, 1,
-2.253709, 0.5299642, -0.7153172, 1, 0.05490196, 0, 1,
-2.186681, 0.207285, -0.4577902, 1, 0.05882353, 0, 1,
-2.126695, 0.5321863, -1.963332, 1, 0.06666667, 0, 1,
-2.084734, -0.6158158, -2.782615, 1, 0.07058824, 0, 1,
-2.081518, -0.3765998, -1.920768, 1, 0.07843138, 0, 1,
-2.040949, -0.9052095, -0.5151213, 1, 0.08235294, 0, 1,
-2.034543, -0.2455167, -2.167068, 1, 0.09019608, 0, 1,
-2.032517, 1.612221, -1.97361, 1, 0.09411765, 0, 1,
-2.019788, -1.172207, -2.019065, 1, 0.1019608, 0, 1,
-2.013513, -0.7993696, -1.792417, 1, 0.1098039, 0, 1,
-2.000575, 0.1753682, -1.392383, 1, 0.1137255, 0, 1,
-1.940069, -0.1974272, 0.7586803, 1, 0.1215686, 0, 1,
-1.935987, -0.007445983, -2.05929, 1, 0.1254902, 0, 1,
-1.923581, 0.02311196, -0.8620582, 1, 0.1333333, 0, 1,
-1.89972, -0.01975903, 0.4413651, 1, 0.1372549, 0, 1,
-1.868444, 1.359944, -3.142827, 1, 0.145098, 0, 1,
-1.862814, -1.284086, -3.633066, 1, 0.1490196, 0, 1,
-1.861176, 1.023129, -1.588953, 1, 0.1568628, 0, 1,
-1.854086, 0.961966, -2.076366, 1, 0.1607843, 0, 1,
-1.852448, -0.03440875, -1.225234, 1, 0.1686275, 0, 1,
-1.84406, -0.8893574, -2.469294, 1, 0.172549, 0, 1,
-1.838566, -0.5191553, -2.827298, 1, 0.1803922, 0, 1,
-1.822998, 0.3301181, 0.09204704, 1, 0.1843137, 0, 1,
-1.813078, 0.5783547, -0.5006986, 1, 0.1921569, 0, 1,
-1.80749, -0.8293899, -2.178988, 1, 0.1960784, 0, 1,
-1.805707, -0.4984823, -0.5282489, 1, 0.2039216, 0, 1,
-1.799012, 0.5416535, -0.5584309, 1, 0.2117647, 0, 1,
-1.791999, 0.7801191, -1.392638, 1, 0.2156863, 0, 1,
-1.783694, -0.1574777, -2.20013, 1, 0.2235294, 0, 1,
-1.767974, 2.650446, 0.1094672, 1, 0.227451, 0, 1,
-1.766123, 0.11122, -0.4810231, 1, 0.2352941, 0, 1,
-1.765325, -2.458291, -2.622603, 1, 0.2392157, 0, 1,
-1.762123, 0.6746145, -1.670685, 1, 0.2470588, 0, 1,
-1.749811, -1.002808, -2.940828, 1, 0.2509804, 0, 1,
-1.725661, -0.8533396, -2.124164, 1, 0.2588235, 0, 1,
-1.712476, -0.4474049, -2.605996, 1, 0.2627451, 0, 1,
-1.707593, -0.4599229, -2.498683, 1, 0.2705882, 0, 1,
-1.699555, -1.628188, -2.384927, 1, 0.2745098, 0, 1,
-1.682439, -0.5858209, -2.262364, 1, 0.282353, 0, 1,
-1.674007, 1.082629, -0.5557265, 1, 0.2862745, 0, 1,
-1.669766, 0.6674467, -1.850816, 1, 0.2941177, 0, 1,
-1.668234, -0.4920963, -1.251753, 1, 0.3019608, 0, 1,
-1.665265, -0.635393, -2.789632, 1, 0.3058824, 0, 1,
-1.65692, 0.06696233, -0.9370863, 1, 0.3137255, 0, 1,
-1.64356, 0.4196939, -0.7953653, 1, 0.3176471, 0, 1,
-1.633792, 0.2157865, -1.079778, 1, 0.3254902, 0, 1,
-1.622683, 0.3516889, -3.322371, 1, 0.3294118, 0, 1,
-1.619443, -0.3932185, -2.004298, 1, 0.3372549, 0, 1,
-1.617017, -1.408065, -1.230347, 1, 0.3411765, 0, 1,
-1.601163, -0.7633569, -1.627502, 1, 0.3490196, 0, 1,
-1.586025, -1.197202, -2.343766, 1, 0.3529412, 0, 1,
-1.581195, 0.7033554, 0.6013861, 1, 0.3607843, 0, 1,
-1.576371, -0.6167249, -1.470878, 1, 0.3647059, 0, 1,
-1.573553, -0.2492729, -1.527473, 1, 0.372549, 0, 1,
-1.555819, -0.3245122, -1.809043, 1, 0.3764706, 0, 1,
-1.537239, -0.3946275, -1.492074, 1, 0.3843137, 0, 1,
-1.535096, -0.115397, -4.967162, 1, 0.3882353, 0, 1,
-1.53509, -2.30757, -3.407439, 1, 0.3960784, 0, 1,
-1.531092, 0.9715632, -0.8000689, 1, 0.4039216, 0, 1,
-1.520622, -0.220197, -0.7073224, 1, 0.4078431, 0, 1,
-1.520191, -0.8434249, -0.8305356, 1, 0.4156863, 0, 1,
-1.512862, -0.3201915, -2.359539, 1, 0.4196078, 0, 1,
-1.502552, 0.9090945, -2.345897, 1, 0.427451, 0, 1,
-1.502113, 1.362464, -0.07872872, 1, 0.4313726, 0, 1,
-1.499383, 0.8368384, 0.6672632, 1, 0.4392157, 0, 1,
-1.494469, 0.7378026, -0.5170999, 1, 0.4431373, 0, 1,
-1.492485, -0.1875312, -2.461756, 1, 0.4509804, 0, 1,
-1.490391, 0.9790951, -0.1885508, 1, 0.454902, 0, 1,
-1.480474, 1.484916, -1.160735, 1, 0.4627451, 0, 1,
-1.480305, -0.4657967, 0.4555157, 1, 0.4666667, 0, 1,
-1.477551, 1.006726, -0.6380054, 1, 0.4745098, 0, 1,
-1.465679, -1.60813, -3.067964, 1, 0.4784314, 0, 1,
-1.461775, 0.1397325, -1.786912, 1, 0.4862745, 0, 1,
-1.456831, 0.07808897, -0.2556457, 1, 0.4901961, 0, 1,
-1.411806, 1.066592, -0.3988385, 1, 0.4980392, 0, 1,
-1.407674, 0.2385215, -1.444035, 1, 0.5058824, 0, 1,
-1.406439, 0.1507287, -3.102166, 1, 0.509804, 0, 1,
-1.403367, -1.773562, -2.356313, 1, 0.5176471, 0, 1,
-1.396122, -0.4142703, -2.829777, 1, 0.5215687, 0, 1,
-1.392421, 0.02898637, -0.2579363, 1, 0.5294118, 0, 1,
-1.391331, -0.4455428, -0.6646878, 1, 0.5333334, 0, 1,
-1.386727, -1.164318, -1.617004, 1, 0.5411765, 0, 1,
-1.385889, 2.668335, -0.1526967, 1, 0.5450981, 0, 1,
-1.369197, 1.820876, -2.14848, 1, 0.5529412, 0, 1,
-1.366292, -1.842389, -4.0863, 1, 0.5568628, 0, 1,
-1.351968, -0.3671327, -1.343336, 1, 0.5647059, 0, 1,
-1.342345, 0.5124251, -0.822437, 1, 0.5686275, 0, 1,
-1.341424, -0.9107028, -2.722198, 1, 0.5764706, 0, 1,
-1.33961, 1.119536, -0.3437796, 1, 0.5803922, 0, 1,
-1.324764, 0.7313318, 0.911445, 1, 0.5882353, 0, 1,
-1.321488, 0.3807522, -2.088398, 1, 0.5921569, 0, 1,
-1.31527, 1.430716, -0.4778192, 1, 0.6, 0, 1,
-1.313678, -1.253848, -0.8356569, 1, 0.6078432, 0, 1,
-1.311212, 0.04514081, -0.8631331, 1, 0.6117647, 0, 1,
-1.307241, -1.770837, -2.021686, 1, 0.6196079, 0, 1,
-1.304631, -0.1920243, -1.994577, 1, 0.6235294, 0, 1,
-1.292529, -0.4814395, -0.8424972, 1, 0.6313726, 0, 1,
-1.292375, 2.634648, -0.2704381, 1, 0.6352941, 0, 1,
-1.291601, -1.111734, -2.275465, 1, 0.6431373, 0, 1,
-1.288297, 0.6534709, -1.411532, 1, 0.6470588, 0, 1,
-1.281402, 0.07647172, -0.7987717, 1, 0.654902, 0, 1,
-1.268494, 1.038937, -0.01275322, 1, 0.6588235, 0, 1,
-1.267216, 1.587295, -1.492952, 1, 0.6666667, 0, 1,
-1.259227, 1.294962, -1.845566, 1, 0.6705883, 0, 1,
-1.249088, -2.259055, -1.694764, 1, 0.6784314, 0, 1,
-1.225804, 0.3901005, -2.035259, 1, 0.682353, 0, 1,
-1.201021, -0.02413322, -3.173567, 1, 0.6901961, 0, 1,
-1.199709, 0.9588476, 0.2602185, 1, 0.6941177, 0, 1,
-1.193755, 0.3945931, -0.8114668, 1, 0.7019608, 0, 1,
-1.19105, 0.1090081, -2.419034, 1, 0.7098039, 0, 1,
-1.18989, 1.14552, -1.368218, 1, 0.7137255, 0, 1,
-1.189494, -0.1516714, -0.7917812, 1, 0.7215686, 0, 1,
-1.188661, 0.03208733, -2.560549, 1, 0.7254902, 0, 1,
-1.186357, -0.02154835, -1.170134, 1, 0.7333333, 0, 1,
-1.185097, 0.1709691, -2.187095, 1, 0.7372549, 0, 1,
-1.18474, 0.566856, -1.803327, 1, 0.7450981, 0, 1,
-1.182752, 1.375602, -0.3901475, 1, 0.7490196, 0, 1,
-1.177144, -0.527642, -0.8561034, 1, 0.7568628, 0, 1,
-1.176988, 1.930037, 0.6174511, 1, 0.7607843, 0, 1,
-1.171938, -0.397902, -2.073803, 1, 0.7686275, 0, 1,
-1.17099, -0.4768656, -1.869884, 1, 0.772549, 0, 1,
-1.165208, -0.9248472, -3.585147, 1, 0.7803922, 0, 1,
-1.164183, 0.4406967, -2.794968, 1, 0.7843137, 0, 1,
-1.159239, -0.4510369, -1.56847, 1, 0.7921569, 0, 1,
-1.151295, 0.05986552, -0.2692022, 1, 0.7960784, 0, 1,
-1.144667, 0.8550074, -0.7843941, 1, 0.8039216, 0, 1,
-1.140358, -0.5546812, -1.697387, 1, 0.8117647, 0, 1,
-1.138879, -0.8142961, -3.490591, 1, 0.8156863, 0, 1,
-1.136837, -0.7371088, -2.128927, 1, 0.8235294, 0, 1,
-1.132452, 0.9813129, -0.8458285, 1, 0.827451, 0, 1,
-1.129596, -2.13818, -2.862716, 1, 0.8352941, 0, 1,
-1.124336, -0.993605, -1.516667, 1, 0.8392157, 0, 1,
-1.123405, -0.521138, -0.7361535, 1, 0.8470588, 0, 1,
-1.119935, -1.147973, -3.013393, 1, 0.8509804, 0, 1,
-1.118835, -0.6825432, -2.23176, 1, 0.8588235, 0, 1,
-1.113109, 2.326419, 0.6666588, 1, 0.8627451, 0, 1,
-1.112928, 1.012797, -2.178128, 1, 0.8705882, 0, 1,
-1.110341, 0.2088801, -0.4116067, 1, 0.8745098, 0, 1,
-1.105296, -0.4189808, -3.054405, 1, 0.8823529, 0, 1,
-1.097068, 0.4524651, -1.23388, 1, 0.8862745, 0, 1,
-1.090073, -1.278113, -2.520129, 1, 0.8941177, 0, 1,
-1.089844, 0.6721479, -0.5933971, 1, 0.8980392, 0, 1,
-1.089147, -0.9504417, -2.861638, 1, 0.9058824, 0, 1,
-1.087165, 1.58857, -0.7765095, 1, 0.9137255, 0, 1,
-1.082598, -1.287651, -1.91519, 1, 0.9176471, 0, 1,
-1.081682, -0.44471, -1.523426, 1, 0.9254902, 0, 1,
-1.079879, 1.275037, -0.07877976, 1, 0.9294118, 0, 1,
-1.076836, -2.168574, -2.731998, 1, 0.9372549, 0, 1,
-1.074085, 0.03831007, -1.053957, 1, 0.9411765, 0, 1,
-1.073392, -0.3118362, -1.260062, 1, 0.9490196, 0, 1,
-1.072002, -1.579394, -3.432371, 1, 0.9529412, 0, 1,
-1.066017, -0.4003889, -3.786367, 1, 0.9607843, 0, 1,
-1.060538, -0.09005275, -2.103301, 1, 0.9647059, 0, 1,
-1.058274, -0.1687401, -1.862855, 1, 0.972549, 0, 1,
-1.045094, 0.8985703, -0.3918988, 1, 0.9764706, 0, 1,
-1.040072, -0.4929969, -3.101231, 1, 0.9843137, 0, 1,
-1.034089, -1.007644, -2.755887, 1, 0.9882353, 0, 1,
-1.033376, 1.102931, 1.204263, 1, 0.9960784, 0, 1,
-1.030859, -1.035867, -3.055809, 0.9960784, 1, 0, 1,
-1.027569, 1.437928, -1.192694, 0.9921569, 1, 0, 1,
-1.026607, -0.5943439, -0.3789903, 0.9843137, 1, 0, 1,
-1.023321, 0.8656235, -0.5616687, 0.9803922, 1, 0, 1,
-1.02201, -0.218517, -2.954277, 0.972549, 1, 0, 1,
-1.020608, 1.935279, -0.2991915, 0.9686275, 1, 0, 1,
-1.018733, 0.9637878, 0.4680321, 0.9607843, 1, 0, 1,
-1.016252, -1.798964, -2.756287, 0.9568627, 1, 0, 1,
-1.015864, -1.896376, -2.622424, 0.9490196, 1, 0, 1,
-1.015354, 0.05096144, 0.4281319, 0.945098, 1, 0, 1,
-1.00698, -0.07673667, -2.637249, 0.9372549, 1, 0, 1,
-1.005218, -0.8661004, -2.81595, 0.9333333, 1, 0, 1,
-1.000254, -0.7631057, -1.748314, 0.9254902, 1, 0, 1,
-0.9939856, -0.2592056, -3.248873, 0.9215686, 1, 0, 1,
-0.9924085, 0.02182362, -3.528531, 0.9137255, 1, 0, 1,
-0.9919962, 0.2005637, -0.9019337, 0.9098039, 1, 0, 1,
-0.9868109, -1.322724, -1.411272, 0.9019608, 1, 0, 1,
-0.9860759, -0.01013895, -1.078112, 0.8941177, 1, 0, 1,
-0.9821146, 1.689613, -1.031855, 0.8901961, 1, 0, 1,
-0.9710085, 1.026472, -0.3646556, 0.8823529, 1, 0, 1,
-0.959788, -0.8793015, -1.442335, 0.8784314, 1, 0, 1,
-0.9585879, 0.2864665, -0.6466537, 0.8705882, 1, 0, 1,
-0.9570465, 1.538668, 0.04355001, 0.8666667, 1, 0, 1,
-0.9547796, 1.286777, -0.51809, 0.8588235, 1, 0, 1,
-0.9362655, 1.352529, -0.681172, 0.854902, 1, 0, 1,
-0.9358946, -0.990281, -1.335265, 0.8470588, 1, 0, 1,
-0.9343632, -0.6505734, -0.8084344, 0.8431373, 1, 0, 1,
-0.9322111, 0.8376222, -0.9026061, 0.8352941, 1, 0, 1,
-0.9297373, -1.173661, -2.599236, 0.8313726, 1, 0, 1,
-0.9251596, 0.7034249, -0.9433255, 0.8235294, 1, 0, 1,
-0.9245301, -0.2924542, -1.84003, 0.8196079, 1, 0, 1,
-0.9192594, 1.024557, -1.181031, 0.8117647, 1, 0, 1,
-0.9155023, 0.2987483, -2.021435, 0.8078431, 1, 0, 1,
-0.9112098, 0.2988223, -0.5158204, 0.8, 1, 0, 1,
-0.9076997, -1.193506, -0.9603448, 0.7921569, 1, 0, 1,
-0.9007393, -0.1465676, -4.032225, 0.7882353, 1, 0, 1,
-0.8973846, 1.187495, -2.032507, 0.7803922, 1, 0, 1,
-0.89624, 0.5229657, -1.943044, 0.7764706, 1, 0, 1,
-0.8937334, -1.343478, -1.560154, 0.7686275, 1, 0, 1,
-0.8886085, 3.471253, 1.025684, 0.7647059, 1, 0, 1,
-0.8857431, 1.2964, -1.728374, 0.7568628, 1, 0, 1,
-0.88278, -1.903803, -1.759748, 0.7529412, 1, 0, 1,
-0.8761529, 1.294724, -1.715933, 0.7450981, 1, 0, 1,
-0.8717536, -1.503078, -2.73764, 0.7411765, 1, 0, 1,
-0.8691216, 0.2889374, -0.7322013, 0.7333333, 1, 0, 1,
-0.8674473, -0.3215215, -2.710474, 0.7294118, 1, 0, 1,
-0.8627828, -0.2300269, -2.67309, 0.7215686, 1, 0, 1,
-0.8579432, 1.291049, -2.054492, 0.7176471, 1, 0, 1,
-0.8484295, 1.110641, -0.5745358, 0.7098039, 1, 0, 1,
-0.8465457, -0.6042412, -0.02378376, 0.7058824, 1, 0, 1,
-0.845938, -0.1797943, -3.573892, 0.6980392, 1, 0, 1,
-0.8417281, -0.2879688, -2.661433, 0.6901961, 1, 0, 1,
-0.8338187, 1.190055, 0.6334993, 0.6862745, 1, 0, 1,
-0.8270673, -1.379498, -2.645597, 0.6784314, 1, 0, 1,
-0.8214634, -1.120977, -2.791975, 0.6745098, 1, 0, 1,
-0.8201119, 0.4289362, -1.232576, 0.6666667, 1, 0, 1,
-0.8192508, 0.2961843, -1.839875, 0.6627451, 1, 0, 1,
-0.8129334, -0.1729337, -3.088525, 0.654902, 1, 0, 1,
-0.8110052, -0.8978868, -3.338168, 0.6509804, 1, 0, 1,
-0.8074507, -1.483616, -2.802524, 0.6431373, 1, 0, 1,
-0.8048005, -1.262138, -3.316455, 0.6392157, 1, 0, 1,
-0.8030022, 1.561861, 1.627036, 0.6313726, 1, 0, 1,
-0.7983708, -0.8523729, -3.166146, 0.627451, 1, 0, 1,
-0.7972852, -1.811227, -2.990358, 0.6196079, 1, 0, 1,
-0.7892479, -1.348924, -2.849368, 0.6156863, 1, 0, 1,
-0.7878642, -0.7901023, -2.034368, 0.6078432, 1, 0, 1,
-0.7865525, -1.197144, -1.832181, 0.6039216, 1, 0, 1,
-0.7804726, 2.649109, -1.020576, 0.5960785, 1, 0, 1,
-0.7753172, 0.6761836, -1.422126, 0.5882353, 1, 0, 1,
-0.7720866, 1.402409, -0.5570213, 0.5843138, 1, 0, 1,
-0.7707333, -2.5102, -2.668624, 0.5764706, 1, 0, 1,
-0.7699366, -2.115358, -3.378433, 0.572549, 1, 0, 1,
-0.7675025, -0.4504808, -1.45155, 0.5647059, 1, 0, 1,
-0.7559497, 0.1660452, -0.2950757, 0.5607843, 1, 0, 1,
-0.7520653, 0.61943, -1.038246, 0.5529412, 1, 0, 1,
-0.7512278, 0.08096863, -0.558696, 0.5490196, 1, 0, 1,
-0.7506186, -0.9154833, -4.421011, 0.5411765, 1, 0, 1,
-0.750001, -0.6375415, -1.147588, 0.5372549, 1, 0, 1,
-0.7466233, -1.348779, -2.915991, 0.5294118, 1, 0, 1,
-0.7465037, 0.5334844, -2.326159, 0.5254902, 1, 0, 1,
-0.7416344, 0.7480979, -0.926376, 0.5176471, 1, 0, 1,
-0.7380218, -0.5954694, -3.307542, 0.5137255, 1, 0, 1,
-0.7355443, 0.1768647, -0.3021915, 0.5058824, 1, 0, 1,
-0.7292102, -1.26467, -4.68638, 0.5019608, 1, 0, 1,
-0.7279391, 0.2303973, -0.558116, 0.4941176, 1, 0, 1,
-0.7164108, 1.169772, 2.553147, 0.4862745, 1, 0, 1,
-0.7128087, 1.271414, -1.411845, 0.4823529, 1, 0, 1,
-0.7102656, 1.124204, -0.2029345, 0.4745098, 1, 0, 1,
-0.7089665, -0.09991536, -1.894799, 0.4705882, 1, 0, 1,
-0.7079115, 0.3225714, -0.6502663, 0.4627451, 1, 0, 1,
-0.7073985, 1.645099, -0.7259303, 0.4588235, 1, 0, 1,
-0.7038243, 2.976094, -0.2446934, 0.4509804, 1, 0, 1,
-0.7025989, -1.316624, -2.832501, 0.4470588, 1, 0, 1,
-0.7012663, -0.002488923, -0.5897956, 0.4392157, 1, 0, 1,
-0.6972659, 0.09292629, -1.610422, 0.4352941, 1, 0, 1,
-0.6959835, 0.6168806, -0.297474, 0.427451, 1, 0, 1,
-0.693463, 1.147227, 1.042428, 0.4235294, 1, 0, 1,
-0.6924904, -0.7951177, -2.563269, 0.4156863, 1, 0, 1,
-0.6913728, -0.1902612, -1.878826, 0.4117647, 1, 0, 1,
-0.690082, -1.44729, -4.346764, 0.4039216, 1, 0, 1,
-0.6798558, -0.5642142, -2.546551, 0.3960784, 1, 0, 1,
-0.6796901, 0.5325524, -1.575187, 0.3921569, 1, 0, 1,
-0.6736193, -0.1408653, -2.150862, 0.3843137, 1, 0, 1,
-0.6685385, -0.5965936, -3.905261, 0.3803922, 1, 0, 1,
-0.6663391, 0.8829076, 0.06426794, 0.372549, 1, 0, 1,
-0.6651489, 0.8387401, -0.2155535, 0.3686275, 1, 0, 1,
-0.6634014, -0.6794023, -1.232877, 0.3607843, 1, 0, 1,
-0.657456, -0.5385852, -3.07461, 0.3568628, 1, 0, 1,
-0.6551926, 1.448003, -0.7620068, 0.3490196, 1, 0, 1,
-0.6546471, 1.559991, 0.6797178, 0.345098, 1, 0, 1,
-0.6539459, 0.8537199, 0.7645844, 0.3372549, 1, 0, 1,
-0.6491536, -0.9364325, -4.035163, 0.3333333, 1, 0, 1,
-0.6471792, 0.844366, -1.814643, 0.3254902, 1, 0, 1,
-0.6375382, 0.1999039, -0.1003202, 0.3215686, 1, 0, 1,
-0.6360208, -0.3618158, -3.520376, 0.3137255, 1, 0, 1,
-0.6303503, 0.8490101, -0.4866073, 0.3098039, 1, 0, 1,
-0.6283824, -0.8648907, -2.651624, 0.3019608, 1, 0, 1,
-0.6267268, 0.6561438, -0.4778767, 0.2941177, 1, 0, 1,
-0.625805, 0.6884338, -1.274723, 0.2901961, 1, 0, 1,
-0.6227634, -2.192394, -3.205316, 0.282353, 1, 0, 1,
-0.620939, -0.478331, -1.427179, 0.2784314, 1, 0, 1,
-0.6184584, -0.9632387, -3.105085, 0.2705882, 1, 0, 1,
-0.6163744, 1.241017, 0.8811793, 0.2666667, 1, 0, 1,
-0.6066105, 0.5128598, -0.662959, 0.2588235, 1, 0, 1,
-0.6055862, 1.345428, -1.771247, 0.254902, 1, 0, 1,
-0.6017079, -0.9234211, -2.390184, 0.2470588, 1, 0, 1,
-0.5994087, 0.1408946, -1.342807, 0.2431373, 1, 0, 1,
-0.5993781, 0.7331597, -2.586996, 0.2352941, 1, 0, 1,
-0.599141, -0.9738718, -3.021045, 0.2313726, 1, 0, 1,
-0.5987904, -0.2330539, -2.612431, 0.2235294, 1, 0, 1,
-0.59847, 0.2974121, -1.584664, 0.2196078, 1, 0, 1,
-0.5984562, 0.02572752, -2.697558, 0.2117647, 1, 0, 1,
-0.5980847, 0.1261286, 0.4370939, 0.2078431, 1, 0, 1,
-0.5976344, -0.1229303, -0.3632551, 0.2, 1, 0, 1,
-0.5966522, 0.3990199, -0.9239552, 0.1921569, 1, 0, 1,
-0.5927123, -0.312608, -3.176579, 0.1882353, 1, 0, 1,
-0.5901869, -0.2075014, -2.540355, 0.1803922, 1, 0, 1,
-0.5755743, -0.4677062, -1.187955, 0.1764706, 1, 0, 1,
-0.5722906, -0.2627202, -0.2270397, 0.1686275, 1, 0, 1,
-0.5671577, 0.2692947, -2.520361, 0.1647059, 1, 0, 1,
-0.5617576, 0.489873, -1.956048, 0.1568628, 1, 0, 1,
-0.5558054, 1.308522, 1.565807, 0.1529412, 1, 0, 1,
-0.5554165, -2.330457, -4.464808, 0.145098, 1, 0, 1,
-0.5546948, -0.3081021, -1.594394, 0.1411765, 1, 0, 1,
-0.5524662, -0.1355749, -2.669812, 0.1333333, 1, 0, 1,
-0.5503982, -0.3722982, -1.230199, 0.1294118, 1, 0, 1,
-0.5497051, -1.353317, -2.453946, 0.1215686, 1, 0, 1,
-0.5488887, -0.2618894, -2.815957, 0.1176471, 1, 0, 1,
-0.5448036, -0.198338, -1.898757, 0.1098039, 1, 0, 1,
-0.54237, 1.020295, -0.9393962, 0.1058824, 1, 0, 1,
-0.5412319, -0.3103981, -1.927576, 0.09803922, 1, 0, 1,
-0.5389041, -0.6943433, -3.117923, 0.09019608, 1, 0, 1,
-0.5380078, -0.7915399, -1.522072, 0.08627451, 1, 0, 1,
-0.5330179, -0.6492354, -1.375108, 0.07843138, 1, 0, 1,
-0.5312091, -1.415163, -4.135114, 0.07450981, 1, 0, 1,
-0.5309379, -0.496121, -2.728821, 0.06666667, 1, 0, 1,
-0.5250134, 0.3916993, -1.66766, 0.0627451, 1, 0, 1,
-0.5189985, 0.2120817, -0.2647166, 0.05490196, 1, 0, 1,
-0.5141046, -2.03067, -2.221045, 0.05098039, 1, 0, 1,
-0.513867, 0.9516303, -0.05090386, 0.04313726, 1, 0, 1,
-0.506497, 1.87018, -1.183075, 0.03921569, 1, 0, 1,
-0.5039184, -2.005159, -3.675914, 0.03137255, 1, 0, 1,
-0.503879, 0.3542441, -2.034532, 0.02745098, 1, 0, 1,
-0.5027682, -1.083495, -4.743052, 0.01960784, 1, 0, 1,
-0.4932325, -0.9354184, -1.970944, 0.01568628, 1, 0, 1,
-0.489394, 0.4820398, -2.507164, 0.007843138, 1, 0, 1,
-0.4884824, -0.1029615, -1.91698, 0.003921569, 1, 0, 1,
-0.4859402, 1.230312, -0.1217575, 0, 1, 0.003921569, 1,
-0.4819881, -0.1913061, -2.004687, 0, 1, 0.01176471, 1,
-0.4763047, 0.4005111, -2.298963, 0, 1, 0.01568628, 1,
-0.4753281, -1.465122, -3.480797, 0, 1, 0.02352941, 1,
-0.4708321, 0.5612045, -1.28678, 0, 1, 0.02745098, 1,
-0.4691348, 1.226587, 1.428762, 0, 1, 0.03529412, 1,
-0.4685478, -0.4759235, -2.202888, 0, 1, 0.03921569, 1,
-0.467662, -0.1839154, -2.5866, 0, 1, 0.04705882, 1,
-0.4652769, -1.959907, -2.183832, 0, 1, 0.05098039, 1,
-0.4645042, -0.7703345, -2.894882, 0, 1, 0.05882353, 1,
-0.46043, 0.2724282, -1.511558, 0, 1, 0.0627451, 1,
-0.4542147, 1.27799, -0.7710977, 0, 1, 0.07058824, 1,
-0.4510954, -1.726458, -2.080047, 0, 1, 0.07450981, 1,
-0.4491486, 0.8633513, -1.606992, 0, 1, 0.08235294, 1,
-0.4480731, -1.42187, -2.281353, 0, 1, 0.08627451, 1,
-0.4444723, 0.1434483, -1.8077, 0, 1, 0.09411765, 1,
-0.4443868, -1.564218, -2.417162, 0, 1, 0.1019608, 1,
-0.4426935, -2.042165, -2.989829, 0, 1, 0.1058824, 1,
-0.4402232, -0.2972276, -2.598138, 0, 1, 0.1137255, 1,
-0.4383622, 0.2537678, -1.929288, 0, 1, 0.1176471, 1,
-0.4375581, 0.3178183, -1.19032, 0, 1, 0.1254902, 1,
-0.4373438, -0.002561548, -0.5021377, 0, 1, 0.1294118, 1,
-0.4335956, -1.31015, -2.729547, 0, 1, 0.1372549, 1,
-0.4333274, 1.514322, 0.5989733, 0, 1, 0.1411765, 1,
-0.4273801, 0.1747591, -0.3944925, 0, 1, 0.1490196, 1,
-0.4257507, -0.4336015, -2.757273, 0, 1, 0.1529412, 1,
-0.4224693, 0.09863362, -0.3481471, 0, 1, 0.1607843, 1,
-0.4204492, 0.3902343, -3.183335, 0, 1, 0.1647059, 1,
-0.4171275, 2.266358, -1.054155, 0, 1, 0.172549, 1,
-0.416319, 1.465652, -0.1232899, 0, 1, 0.1764706, 1,
-0.4157858, -0.8103194, -1.278759, 0, 1, 0.1843137, 1,
-0.414564, 1.874481, -0.843206, 0, 1, 0.1882353, 1,
-0.4096533, 0.8476305, -1.101792, 0, 1, 0.1960784, 1,
-0.4094646, -0.1020116, -1.963126, 0, 1, 0.2039216, 1,
-0.4074578, 0.5555626, -0.9741254, 0, 1, 0.2078431, 1,
-0.4019682, 2.342198, -0.43371, 0, 1, 0.2156863, 1,
-0.3928111, 0.5356535, -0.8611858, 0, 1, 0.2196078, 1,
-0.3913896, -0.3528461, -2.159146, 0, 1, 0.227451, 1,
-0.3884114, -0.7409613, -2.816954, 0, 1, 0.2313726, 1,
-0.3881088, -0.4481847, -2.359877, 0, 1, 0.2392157, 1,
-0.3802817, -0.5706372, -3.127944, 0, 1, 0.2431373, 1,
-0.3757367, -1.453876, -1.704217, 0, 1, 0.2509804, 1,
-0.3756604, 0.2081912, -2.291399, 0, 1, 0.254902, 1,
-0.375294, -0.1025236, -1.548711, 0, 1, 0.2627451, 1,
-0.3750248, 0.8268712, -0.8720897, 0, 1, 0.2666667, 1,
-0.3715037, -0.3383397, -2.64251, 0, 1, 0.2745098, 1,
-0.3703911, -0.8242974, -2.961007, 0, 1, 0.2784314, 1,
-0.3658778, -0.5677037, -3.229691, 0, 1, 0.2862745, 1,
-0.3624848, 0.6822818, -0.913223, 0, 1, 0.2901961, 1,
-0.3598038, -0.6202989, -2.821669, 0, 1, 0.2980392, 1,
-0.3570186, 0.3032182, -1.236214, 0, 1, 0.3058824, 1,
-0.3567047, 0.1799301, -0.6068437, 0, 1, 0.3098039, 1,
-0.3565499, -0.1913343, -0.9038123, 0, 1, 0.3176471, 1,
-0.3560683, 1.02946, 0.6631049, 0, 1, 0.3215686, 1,
-0.3553625, 0.3079288, -2.396019, 0, 1, 0.3294118, 1,
-0.3540098, 0.5627071, -1.075548, 0, 1, 0.3333333, 1,
-0.3512975, 1.090925, 0.1101627, 0, 1, 0.3411765, 1,
-0.3473203, 0.3510179, -1.454837, 0, 1, 0.345098, 1,
-0.3427506, -0.1247949, -1.714053, 0, 1, 0.3529412, 1,
-0.3413983, 0.4230951, 0.6884413, 0, 1, 0.3568628, 1,
-0.3406155, 1.353796, 0.7906982, 0, 1, 0.3647059, 1,
-0.3229624, -0.0004019509, -0.237263, 0, 1, 0.3686275, 1,
-0.3154543, 1.651018, -1.591981, 0, 1, 0.3764706, 1,
-0.3143275, -0.5045702, -1.660507, 0, 1, 0.3803922, 1,
-0.3139375, -0.2215153, -2.873321, 0, 1, 0.3882353, 1,
-0.3112324, -0.2022818, -1.538579, 0, 1, 0.3921569, 1,
-0.3049917, 0.02874859, -1.303717, 0, 1, 0.4, 1,
-0.3044197, -2.369416, -3.839995, 0, 1, 0.4078431, 1,
-0.3025768, 0.5290563, 0.326825, 0, 1, 0.4117647, 1,
-0.3012576, -0.6721601, -3.684421, 0, 1, 0.4196078, 1,
-0.2940095, 0.41022, 0.4909007, 0, 1, 0.4235294, 1,
-0.2908956, 0.2922806, -0.2798681, 0, 1, 0.4313726, 1,
-0.2893707, -2.976737, -3.195767, 0, 1, 0.4352941, 1,
-0.289278, -0.0935168, -1.555864, 0, 1, 0.4431373, 1,
-0.2859504, 0.8500899, 0.7307485, 0, 1, 0.4470588, 1,
-0.2822793, 1.064593, 0.05681638, 0, 1, 0.454902, 1,
-0.2808667, -0.2693264, -0.9946418, 0, 1, 0.4588235, 1,
-0.2787282, -0.05928599, -1.325769, 0, 1, 0.4666667, 1,
-0.2730217, 0.5737802, 0.1768501, 0, 1, 0.4705882, 1,
-0.2725554, -1.189776, -4.028299, 0, 1, 0.4784314, 1,
-0.2699745, 1.121053, -0.2617173, 0, 1, 0.4823529, 1,
-0.2679172, 1.263286, 0.772842, 0, 1, 0.4901961, 1,
-0.2583676, 0.46584, -0.412576, 0, 1, 0.4941176, 1,
-0.2582912, 0.8567719, 0.4702113, 0, 1, 0.5019608, 1,
-0.2577365, -0.9440164, -3.151116, 0, 1, 0.509804, 1,
-0.2573654, -0.04817352, -1.048723, 0, 1, 0.5137255, 1,
-0.2520956, 0.01088728, -0.656549, 0, 1, 0.5215687, 1,
-0.2510404, -1.314427, -2.733092, 0, 1, 0.5254902, 1,
-0.2485858, -0.8176941, -3.620613, 0, 1, 0.5333334, 1,
-0.2463973, -1.386144, -2.51891, 0, 1, 0.5372549, 1,
-0.2453731, 0.2733275, -1.649286, 0, 1, 0.5450981, 1,
-0.2440473, -1.261032, -2.086567, 0, 1, 0.5490196, 1,
-0.2310664, 0.5517769, -1.874551, 0, 1, 0.5568628, 1,
-0.2300726, 1.46174, -0.5825261, 0, 1, 0.5607843, 1,
-0.2285666, 0.3601079, -1.72963, 0, 1, 0.5686275, 1,
-0.2275143, 0.3219067, -2.056293, 0, 1, 0.572549, 1,
-0.2259387, 0.5544193, -0.8434956, 0, 1, 0.5803922, 1,
-0.2230361, -0.4411085, -3.105745, 0, 1, 0.5843138, 1,
-0.2193374, -0.1225138, -2.873446, 0, 1, 0.5921569, 1,
-0.216633, -0.02957771, 0.5908781, 0, 1, 0.5960785, 1,
-0.2162253, -1.445128, -1.026812, 0, 1, 0.6039216, 1,
-0.2130958, 0.501102, -0.2879421, 0, 1, 0.6117647, 1,
-0.2129119, -0.4500578, -3.358915, 0, 1, 0.6156863, 1,
-0.2120818, -0.8851526, -1.132481, 0, 1, 0.6235294, 1,
-0.2069493, -0.2276283, -2.960916, 0, 1, 0.627451, 1,
-0.2047944, 1.255719, -0.9474226, 0, 1, 0.6352941, 1,
-0.197756, -0.2953275, -3.512499, 0, 1, 0.6392157, 1,
-0.1924606, 1.041578, 0.6395687, 0, 1, 0.6470588, 1,
-0.1910284, 1.142838, -0.9441593, 0, 1, 0.6509804, 1,
-0.1904781, -0.1883825, -2.286731, 0, 1, 0.6588235, 1,
-0.1888856, -0.2389364, -2.284997, 0, 1, 0.6627451, 1,
-0.1874592, -1.198406, -4.232465, 0, 1, 0.6705883, 1,
-0.1810485, -1.104815, -4.403174, 0, 1, 0.6745098, 1,
-0.1765316, -0.7921426, -2.341911, 0, 1, 0.682353, 1,
-0.1763047, 0.3001936, 0.9918078, 0, 1, 0.6862745, 1,
-0.1754877, -0.1751674, -1.471869, 0, 1, 0.6941177, 1,
-0.1688629, -0.1550924, -1.571881, 0, 1, 0.7019608, 1,
-0.1656951, -0.352474, -2.992597, 0, 1, 0.7058824, 1,
-0.1587833, -1.151065, -2.987838, 0, 1, 0.7137255, 1,
-0.1578189, -0.01848875, -4.399709, 0, 1, 0.7176471, 1,
-0.1550211, 0.3774302, -2.119511, 0, 1, 0.7254902, 1,
-0.153483, 0.240968, -0.1872018, 0, 1, 0.7294118, 1,
-0.1506617, -0.9305062, -3.265257, 0, 1, 0.7372549, 1,
-0.148664, 2.091947, -0.8399305, 0, 1, 0.7411765, 1,
-0.1420625, 0.6492439, -0.9203157, 0, 1, 0.7490196, 1,
-0.1391802, 0.6939859, -0.1611496, 0, 1, 0.7529412, 1,
-0.1376663, -0.7426573, -3.742181, 0, 1, 0.7607843, 1,
-0.1375473, -0.882165, -1.74167, 0, 1, 0.7647059, 1,
-0.1326743, -0.02324375, -0.7338127, 0, 1, 0.772549, 1,
-0.131831, 0.8008379, -0.1663513, 0, 1, 0.7764706, 1,
-0.1273679, 1.342141, -1.640686, 0, 1, 0.7843137, 1,
-0.1259642, 0.6472658, -1.305435, 0, 1, 0.7882353, 1,
-0.1250641, 0.7610074, -1.066219, 0, 1, 0.7960784, 1,
-0.1218705, 0.9030839, -0.7219082, 0, 1, 0.8039216, 1,
-0.1203645, 0.00250706, -3.142001, 0, 1, 0.8078431, 1,
-0.1187808, -0.4999823, -4.486397, 0, 1, 0.8156863, 1,
-0.1131317, -0.2083194, -0.4328038, 0, 1, 0.8196079, 1,
-0.1115417, -0.221105, 0.2292168, 0, 1, 0.827451, 1,
-0.1097821, -0.8551791, -4.964312, 0, 1, 0.8313726, 1,
-0.1085568, -0.4917197, -2.020423, 0, 1, 0.8392157, 1,
-0.1032625, 0.6801549, -0.0693498, 0, 1, 0.8431373, 1,
-0.09778678, -0.5595834, -3.011044, 0, 1, 0.8509804, 1,
-0.09027062, -0.4585524, -3.458999, 0, 1, 0.854902, 1,
-0.08917592, 0.2686961, -0.979946, 0, 1, 0.8627451, 1,
-0.08770827, 1.317979, 0.6213487, 0, 1, 0.8666667, 1,
-0.08575933, -0.7376164, -2.683272, 0, 1, 0.8745098, 1,
-0.08452594, 0.407593, -0.6918506, 0, 1, 0.8784314, 1,
-0.08323797, -0.1558128, -1.685444, 0, 1, 0.8862745, 1,
-0.08177948, -0.006327365, -0.446879, 0, 1, 0.8901961, 1,
-0.07354102, 0.1487335, 0.3255447, 0, 1, 0.8980392, 1,
-0.07071517, 0.6261578, -0.4339079, 0, 1, 0.9058824, 1,
-0.06699543, 0.3556153, -2.192705, 0, 1, 0.9098039, 1,
-0.0622303, -2.007444, -3.589406, 0, 1, 0.9176471, 1,
-0.05838929, -0.4738831, -4.473697, 0, 1, 0.9215686, 1,
-0.05721155, -1.972855, -2.801662, 0, 1, 0.9294118, 1,
-0.05069283, 0.006619301, 0.006625793, 0, 1, 0.9333333, 1,
-0.04992293, -0.4409291, -2.327138, 0, 1, 0.9411765, 1,
-0.04849307, 1.32555, -1.315971, 0, 1, 0.945098, 1,
-0.0461877, -0.3436517, -3.357231, 0, 1, 0.9529412, 1,
-0.04483096, -1.229307, -2.787698, 0, 1, 0.9568627, 1,
-0.04056155, -0.1867224, -1.582513, 0, 1, 0.9647059, 1,
-0.03879032, 0.674165, -0.3539976, 0, 1, 0.9686275, 1,
-0.03372769, -0.6112111, -5.172309, 0, 1, 0.9764706, 1,
-0.03013228, 0.9595247, 0.1660381, 0, 1, 0.9803922, 1,
-0.02876006, -0.8165802, -4.134527, 0, 1, 0.9882353, 1,
-0.02533706, -1.334903, -2.401406, 0, 1, 0.9921569, 1,
-0.02031182, -2.286648, -3.525025, 0, 1, 1, 1,
-0.01319254, -0.1791773, -1.635021, 0, 0.9921569, 1, 1,
-0.01211578, -0.5183688, -1.479788, 0, 0.9882353, 1, 1,
-0.01087764, -0.7796517, -4.896448, 0, 0.9803922, 1, 1,
-0.01086549, 1.495992, -0.8842989, 0, 0.9764706, 1, 1,
-0.002343697, -0.7218342, -1.623182, 0, 0.9686275, 1, 1,
-0.0007937766, -0.3923557, -3.952657, 0, 0.9647059, 1, 1,
0.0009647518, 2.884902, -0.4762526, 0, 0.9568627, 1, 1,
0.005589372, 0.1036973, 0.8443397, 0, 0.9529412, 1, 1,
0.01059245, -0.08584809, 3.432163, 0, 0.945098, 1, 1,
0.0112628, -0.2454716, 1.807984, 0, 0.9411765, 1, 1,
0.01429846, -0.9482678, 0.7396189, 0, 0.9333333, 1, 1,
0.01437446, 0.6831024, 0.05354559, 0, 0.9294118, 1, 1,
0.02010506, -1.446196, 4.435144, 0, 0.9215686, 1, 1,
0.0210993, -0.2021838, 5.085991, 0, 0.9176471, 1, 1,
0.02155145, -0.5015619, 2.795508, 0, 0.9098039, 1, 1,
0.02156934, 0.5167591, -0.2838151, 0, 0.9058824, 1, 1,
0.02285585, 0.7551358, -0.7427245, 0, 0.8980392, 1, 1,
0.02409012, -0.5056549, 4.060286, 0, 0.8901961, 1, 1,
0.02449309, -0.7506569, 3.025177, 0, 0.8862745, 1, 1,
0.02639099, 0.1947145, -0.1659611, 0, 0.8784314, 1, 1,
0.02740605, -0.5594435, 3.953265, 0, 0.8745098, 1, 1,
0.02974341, 0.2928693, -0.105393, 0, 0.8666667, 1, 1,
0.03534299, -1.491562, 2.802696, 0, 0.8627451, 1, 1,
0.03924193, 0.5858404, -0.1171219, 0, 0.854902, 1, 1,
0.04794181, -0.2134048, 2.055464, 0, 0.8509804, 1, 1,
0.04832437, -1.568911, 3.591325, 0, 0.8431373, 1, 1,
0.05329455, 1.302834, 0.7974789, 0, 0.8392157, 1, 1,
0.05726388, 0.5937664, -0.73561, 0, 0.8313726, 1, 1,
0.05770491, -2.18731, 3.19608, 0, 0.827451, 1, 1,
0.06159576, -0.8595012, 1.762883, 0, 0.8196079, 1, 1,
0.06773278, 0.1262576, -0.2019991, 0, 0.8156863, 1, 1,
0.06817473, -1.559828, 2.189895, 0, 0.8078431, 1, 1,
0.07051512, 1.263922, -0.7415168, 0, 0.8039216, 1, 1,
0.08411895, 1.02199, 1.199902, 0, 0.7960784, 1, 1,
0.08756217, -1.012432, 2.994568, 0, 0.7882353, 1, 1,
0.08822066, 1.371105, 1.570139, 0, 0.7843137, 1, 1,
0.08919782, -0.004407413, 1.135766, 0, 0.7764706, 1, 1,
0.08926893, 0.1058176, 0.3729671, 0, 0.772549, 1, 1,
0.09050848, -0.8486753, 2.753704, 0, 0.7647059, 1, 1,
0.09133974, -0.06589331, 2.618826, 0, 0.7607843, 1, 1,
0.09150875, 0.1374499, -0.84987, 0, 0.7529412, 1, 1,
0.0921447, -0.3993552, 0.5726486, 0, 0.7490196, 1, 1,
0.09371427, -1.368981, 2.361077, 0, 0.7411765, 1, 1,
0.09797192, -0.1120645, 1.872058, 0, 0.7372549, 1, 1,
0.09819068, -0.2537441, 3.973576, 0, 0.7294118, 1, 1,
0.09975749, 0.007531652, 1.760699, 0, 0.7254902, 1, 1,
0.1013768, 0.2942858, -1.853787, 0, 0.7176471, 1, 1,
0.1056033, 0.1877664, -1.197329, 0, 0.7137255, 1, 1,
0.1105291, -0.04686771, 2.175669, 0, 0.7058824, 1, 1,
0.1138077, -1.170295, 3.269487, 0, 0.6980392, 1, 1,
0.1146631, 0.04058551, 0.7483845, 0, 0.6941177, 1, 1,
0.1153697, 0.4903204, -0.2326433, 0, 0.6862745, 1, 1,
0.1217527, -0.4179753, 2.463343, 0, 0.682353, 1, 1,
0.1232826, 0.1531914, 1.358321, 0, 0.6745098, 1, 1,
0.1265527, 0.4912469, 1.467815, 0, 0.6705883, 1, 1,
0.1325264, -0.3897443, 2.845793, 0, 0.6627451, 1, 1,
0.1333237, -0.2283887, 1.875203, 0, 0.6588235, 1, 1,
0.1385582, 1.103282, 0.7206433, 0, 0.6509804, 1, 1,
0.1392472, 0.7407992, -0.6656813, 0, 0.6470588, 1, 1,
0.1447653, 0.3876546, 0.1840513, 0, 0.6392157, 1, 1,
0.1453635, 0.8245727, 0.9692298, 0, 0.6352941, 1, 1,
0.1489834, 1.07929, -1.175628, 0, 0.627451, 1, 1,
0.1504102, -0.2021787, 4.045277, 0, 0.6235294, 1, 1,
0.1505096, -0.6803707, 2.664266, 0, 0.6156863, 1, 1,
0.1513479, -0.7926011, 2.652911, 0, 0.6117647, 1, 1,
0.151724, -0.7525551, 0.4916494, 0, 0.6039216, 1, 1,
0.1615296, -1.408042, 3.690448, 0, 0.5960785, 1, 1,
0.1638658, -0.1661557, 2.403899, 0, 0.5921569, 1, 1,
0.1642561, 1.027493, 0.5244495, 0, 0.5843138, 1, 1,
0.1691349, 0.4790584, 0.6909395, 0, 0.5803922, 1, 1,
0.1695763, -0.5543048, 2.372872, 0, 0.572549, 1, 1,
0.1724185, 0.4255868, 1.334374, 0, 0.5686275, 1, 1,
0.1786588, 1.030223, 2.52994, 0, 0.5607843, 1, 1,
0.1878408, 1.600208, 0.7561556, 0, 0.5568628, 1, 1,
0.1886992, -1.025071, 4.341753, 0, 0.5490196, 1, 1,
0.1905293, 0.1844084, 0.2801565, 0, 0.5450981, 1, 1,
0.1917461, -2.367791, 3.978164, 0, 0.5372549, 1, 1,
0.1953749, -1.426061, 3.303842, 0, 0.5333334, 1, 1,
0.1993908, 0.6709303, 2.615409, 0, 0.5254902, 1, 1,
0.2006774, 1.507304, 0.457031, 0, 0.5215687, 1, 1,
0.2037015, -5.470996e-05, 1.912289, 0, 0.5137255, 1, 1,
0.2060583, 0.6347901, -0.4438199, 0, 0.509804, 1, 1,
0.2093541, -1.424124, 2.639233, 0, 0.5019608, 1, 1,
0.2109298, 2.341016, 1.17777, 0, 0.4941176, 1, 1,
0.2115305, -1.480891, 3.209676, 0, 0.4901961, 1, 1,
0.2121269, 0.9957114, 1.897405, 0, 0.4823529, 1, 1,
0.2131891, -0.1058333, 1.412462, 0, 0.4784314, 1, 1,
0.2167672, 1.031934, 0.1989668, 0, 0.4705882, 1, 1,
0.2188642, -0.4557465, 2.105543, 0, 0.4666667, 1, 1,
0.2208261, -0.2111413, 3.25116, 0, 0.4588235, 1, 1,
0.2211303, -0.3260666, 1.549833, 0, 0.454902, 1, 1,
0.2218889, 0.1202965, 1.55793, 0, 0.4470588, 1, 1,
0.2227729, -1.166222, 4.260695, 0, 0.4431373, 1, 1,
0.2273268, -0.6350065, 2.657346, 0, 0.4352941, 1, 1,
0.2281913, 2.22633, 0.3430488, 0, 0.4313726, 1, 1,
0.2322423, 0.9847279, 0.16778, 0, 0.4235294, 1, 1,
0.2329013, 0.4561566, 1.335124, 0, 0.4196078, 1, 1,
0.2348596, -0.2442988, 2.26826, 0, 0.4117647, 1, 1,
0.2350314, 1.486615, 0.02906019, 0, 0.4078431, 1, 1,
0.2359086, 0.7391428, 1.294013, 0, 0.4, 1, 1,
0.2384163, 1.806543, -0.1006752, 0, 0.3921569, 1, 1,
0.2411238, -0.06120921, 2.859948, 0, 0.3882353, 1, 1,
0.2424549, 0.7245598, -0.6791596, 0, 0.3803922, 1, 1,
0.2451911, -0.5939294, 3.528734, 0, 0.3764706, 1, 1,
0.2460999, 0.7176874, 0.5552601, 0, 0.3686275, 1, 1,
0.2474805, -0.4975105, 2.98786, 0, 0.3647059, 1, 1,
0.2502092, 0.3412328, 1.640368, 0, 0.3568628, 1, 1,
0.2529385, -0.9647714, 2.983853, 0, 0.3529412, 1, 1,
0.2532002, 0.1808712, 3.592042, 0, 0.345098, 1, 1,
0.2537467, 0.09151877, 2.333278, 0, 0.3411765, 1, 1,
0.2538654, -0.692957, 2.323729, 0, 0.3333333, 1, 1,
0.2554188, -0.5827454, 2.177234, 0, 0.3294118, 1, 1,
0.2559687, 0.4028304, 0.5826253, 0, 0.3215686, 1, 1,
0.26984, 1.849439, 0.5974948, 0, 0.3176471, 1, 1,
0.2706059, 0.04657295, -0.3263943, 0, 0.3098039, 1, 1,
0.2796539, -1.554105, 2.756814, 0, 0.3058824, 1, 1,
0.281376, -0.4855291, 2.207711, 0, 0.2980392, 1, 1,
0.2850538, 1.735245, 0.4138727, 0, 0.2901961, 1, 1,
0.2884109, 1.806756, 1.510651, 0, 0.2862745, 1, 1,
0.2892092, 1.684719, 0.190925, 0, 0.2784314, 1, 1,
0.2927715, 0.4568445, -0.5164829, 0, 0.2745098, 1, 1,
0.293298, -0.180289, 2.19563, 0, 0.2666667, 1, 1,
0.2946311, -0.5193786, 3.254609, 0, 0.2627451, 1, 1,
0.2949517, -0.2942964, 3.748206, 0, 0.254902, 1, 1,
0.2950608, -0.2593487, 1.132096, 0, 0.2509804, 1, 1,
0.296743, 1.072261, 0.289842, 0, 0.2431373, 1, 1,
0.2985398, 1.780825, 1.680077, 0, 0.2392157, 1, 1,
0.2988357, 0.006562332, 1.086324, 0, 0.2313726, 1, 1,
0.3016775, -0.2434711, 0.8225029, 0, 0.227451, 1, 1,
0.3045001, -0.268114, 2.805999, 0, 0.2196078, 1, 1,
0.3054782, 0.3087274, 0.802814, 0, 0.2156863, 1, 1,
0.3080309, 0.2184972, 0.5821411, 0, 0.2078431, 1, 1,
0.308178, -0.6734788, 1.364894, 0, 0.2039216, 1, 1,
0.3127004, -0.6666803, 4.021484, 0, 0.1960784, 1, 1,
0.3129303, -0.467033, 2.63265, 0, 0.1882353, 1, 1,
0.3213303, -0.7132944, 3.382697, 0, 0.1843137, 1, 1,
0.3226956, 0.4499364, 0.879907, 0, 0.1764706, 1, 1,
0.3230115, 1.051919, -1.210242, 0, 0.172549, 1, 1,
0.3293488, -0.5742248, 2.128374, 0, 0.1647059, 1, 1,
0.3294889, -0.1939245, 1.572699, 0, 0.1607843, 1, 1,
0.3300358, 0.443282, 1.98563, 0, 0.1529412, 1, 1,
0.3304493, -1.157044, 3.176133, 0, 0.1490196, 1, 1,
0.3331203, 0.9585389, -0.2803238, 0, 0.1411765, 1, 1,
0.3335339, 2.310043, -0.1243699, 0, 0.1372549, 1, 1,
0.3353628, 0.08612734, 0.644908, 0, 0.1294118, 1, 1,
0.3418545, -0.02896998, 2.616034, 0, 0.1254902, 1, 1,
0.3425791, -0.6082354, 3.519169, 0, 0.1176471, 1, 1,
0.3433322, 0.3050714, 0.5837473, 0, 0.1137255, 1, 1,
0.3441757, -0.2394158, 1.625803, 0, 0.1058824, 1, 1,
0.3470208, -0.3058114, 1.67331, 0, 0.09803922, 1, 1,
0.3537728, -1.105065, 2.860389, 0, 0.09411765, 1, 1,
0.3548158, -0.4208712, 1.448176, 0, 0.08627451, 1, 1,
0.3555016, 0.8176064, 1.2879, 0, 0.08235294, 1, 1,
0.3572469, -1.263506, 3.071089, 0, 0.07450981, 1, 1,
0.3581312, 1.817889, 0.6371036, 0, 0.07058824, 1, 1,
0.3592319, 0.2391323, 1.349641, 0, 0.0627451, 1, 1,
0.3608971, -0.8679527, 3.198733, 0, 0.05882353, 1, 1,
0.3636467, 0.9591503, 0.1856206, 0, 0.05098039, 1, 1,
0.3704703, 1.238824, 0.5908361, 0, 0.04705882, 1, 1,
0.3760159, -0.7954085, 2.558123, 0, 0.03921569, 1, 1,
0.3785909, 1.021856, 0.6401072, 0, 0.03529412, 1, 1,
0.3790796, 1.819895, 0.2010702, 0, 0.02745098, 1, 1,
0.3797054, 2.02947, -0.3563136, 0, 0.02352941, 1, 1,
0.3838565, -0.5799768, 2.545823, 0, 0.01568628, 1, 1,
0.3913926, -0.6142325, 1.93788, 0, 0.01176471, 1, 1,
0.3928883, -1.59861, 2.570884, 0, 0.003921569, 1, 1,
0.3938647, -0.06896984, 1.453182, 0.003921569, 0, 1, 1,
0.3939431, 0.7614024, 0.4820097, 0.007843138, 0, 1, 1,
0.3945356, 1.227586, 1.281962, 0.01568628, 0, 1, 1,
0.3951149, 1.000329, 0.7810703, 0.01960784, 0, 1, 1,
0.3978332, 0.810196, 0.09009372, 0.02745098, 0, 1, 1,
0.3983721, -0.9550391, 2.722939, 0.03137255, 0, 1, 1,
0.3984174, -0.1006878, 4.243653, 0.03921569, 0, 1, 1,
0.3988128, -0.981846, 3.810244, 0.04313726, 0, 1, 1,
0.3994734, -0.009860181, 2.023752, 0.05098039, 0, 1, 1,
0.4031875, -0.4479041, 1.967006, 0.05490196, 0, 1, 1,
0.4048253, 0.9970002, -0.4336707, 0.0627451, 0, 1, 1,
0.4092496, -0.708535, 3.259345, 0.06666667, 0, 1, 1,
0.4107317, -1.623665, 2.3372, 0.07450981, 0, 1, 1,
0.4115373, 0.1859185, -0.1311957, 0.07843138, 0, 1, 1,
0.4120603, 0.2290445, 1.178865, 0.08627451, 0, 1, 1,
0.4145114, -0.6068245, 3.736404, 0.09019608, 0, 1, 1,
0.4160944, -0.8947447, 3.31019, 0.09803922, 0, 1, 1,
0.4242868, -1.150818, 1.8795, 0.1058824, 0, 1, 1,
0.4341938, 1.579726, -1.421057, 0.1098039, 0, 1, 1,
0.435538, -0.4068278, 2.827438, 0.1176471, 0, 1, 1,
0.4421114, 0.7670563, 1.370529, 0.1215686, 0, 1, 1,
0.4437693, -0.1984193, 3.454141, 0.1294118, 0, 1, 1,
0.4445416, -0.997386, 1.653705, 0.1333333, 0, 1, 1,
0.4462385, -0.1625016, 1.775862, 0.1411765, 0, 1, 1,
0.4477815, 0.4608851, 1.239207, 0.145098, 0, 1, 1,
0.4524469, -0.2975039, 0.4994649, 0.1529412, 0, 1, 1,
0.4587528, 0.2055408, 2.59588, 0.1568628, 0, 1, 1,
0.4633272, 0.5883677, 0.9340947, 0.1647059, 0, 1, 1,
0.4638329, -0.2514115, 2.832196, 0.1686275, 0, 1, 1,
0.4725095, 1.048687, 0.3218597, 0.1764706, 0, 1, 1,
0.473972, 2.065732, -0.6434457, 0.1803922, 0, 1, 1,
0.4757412, -0.1467541, 2.051273, 0.1882353, 0, 1, 1,
0.4785594, -0.3570287, 2.884592, 0.1921569, 0, 1, 1,
0.479527, -1.161176, 2.364398, 0.2, 0, 1, 1,
0.4862359, -0.01706121, 1.42598, 0.2078431, 0, 1, 1,
0.4871158, 1.011783, -1.12333, 0.2117647, 0, 1, 1,
0.4889568, 0.1712481, -0.7666711, 0.2196078, 0, 1, 1,
0.491221, 1.350087, -0.6338679, 0.2235294, 0, 1, 1,
0.4965718, 0.0919372, 0.8902336, 0.2313726, 0, 1, 1,
0.4999936, -0.2825108, 3.598308, 0.2352941, 0, 1, 1,
0.5071523, 1.24259, 0.3203185, 0.2431373, 0, 1, 1,
0.5073998, -0.6239578, 1.627687, 0.2470588, 0, 1, 1,
0.5098804, 0.6227797, 0.8056653, 0.254902, 0, 1, 1,
0.5100793, 2.046, 1.893172, 0.2588235, 0, 1, 1,
0.5114548, -0.236867, 3.906394, 0.2666667, 0, 1, 1,
0.5125133, 0.959678, 0.6901315, 0.2705882, 0, 1, 1,
0.513011, 1.046277, 0.8784648, 0.2784314, 0, 1, 1,
0.5182003, 0.5802817, 0.975516, 0.282353, 0, 1, 1,
0.5189092, 0.6303197, 0.820406, 0.2901961, 0, 1, 1,
0.5193797, -0.2058603, 0.6278602, 0.2941177, 0, 1, 1,
0.5244551, -0.5110322, 3.590069, 0.3019608, 0, 1, 1,
0.5268517, -1.630654, 2.392069, 0.3098039, 0, 1, 1,
0.5357539, 1.226539, 1.00432, 0.3137255, 0, 1, 1,
0.542124, -0.4520043, 1.849331, 0.3215686, 0, 1, 1,
0.5426008, 0.2078744, 0.517679, 0.3254902, 0, 1, 1,
0.5469043, -0.8802745, 2.880285, 0.3333333, 0, 1, 1,
0.5469123, 0.2869015, 2.859014, 0.3372549, 0, 1, 1,
0.5487723, 1.366949, 1.184979, 0.345098, 0, 1, 1,
0.5488476, -0.9818823, 1.251983, 0.3490196, 0, 1, 1,
0.5508169, -0.9764666, 3.707227, 0.3568628, 0, 1, 1,
0.5520297, -0.2222819, 1.977576, 0.3607843, 0, 1, 1,
0.56129, -1.045773, 3.312231, 0.3686275, 0, 1, 1,
0.5652295, -0.7241579, 1.894596, 0.372549, 0, 1, 1,
0.5656126, 0.2476119, 0.8528085, 0.3803922, 0, 1, 1,
0.5677601, -0.909816, 1.890489, 0.3843137, 0, 1, 1,
0.5697476, 0.6558004, 1.265574, 0.3921569, 0, 1, 1,
0.5723148, 0.3936702, 0.9119077, 0.3960784, 0, 1, 1,
0.5748352, -0.3779063, 0.8811893, 0.4039216, 0, 1, 1,
0.5772134, -0.460026, 1.991379, 0.4117647, 0, 1, 1,
0.5776716, 1.089504, 0.2744567, 0.4156863, 0, 1, 1,
0.5809362, 1.694189, -1.441055, 0.4235294, 0, 1, 1,
0.5815138, -0.07725558, 0.3733055, 0.427451, 0, 1, 1,
0.5818682, -0.771149, 4.27563, 0.4352941, 0, 1, 1,
0.5831181, 0.8564143, 1.949584, 0.4392157, 0, 1, 1,
0.5838689, -0.3359329, 2.751001, 0.4470588, 0, 1, 1,
0.5922388, 1.313446, -1.192046, 0.4509804, 0, 1, 1,
0.5923274, 1.050337, 1.434421, 0.4588235, 0, 1, 1,
0.5960482, -0.4096771, 2.849349, 0.4627451, 0, 1, 1,
0.6022478, -1.305848, 1.63327, 0.4705882, 0, 1, 1,
0.6025727, 0.5610534, 0.7610179, 0.4745098, 0, 1, 1,
0.6030743, 1.351796, -0.9427481, 0.4823529, 0, 1, 1,
0.6066405, -0.9273884, 2.606824, 0.4862745, 0, 1, 1,
0.610496, -1.369036, 3.831539, 0.4941176, 0, 1, 1,
0.6114351, 0.03153417, 2.22665, 0.5019608, 0, 1, 1,
0.6127937, 0.5239592, 0.7672675, 0.5058824, 0, 1, 1,
0.6152527, 0.1947972, 0.6283298, 0.5137255, 0, 1, 1,
0.6174556, 0.9785612, 1.945774, 0.5176471, 0, 1, 1,
0.618885, -0.5394026, 3.069176, 0.5254902, 0, 1, 1,
0.6243888, -1.030689, 2.264189, 0.5294118, 0, 1, 1,
0.6295542, 0.9399616, 1.611133, 0.5372549, 0, 1, 1,
0.6315553, -0.8999985, 2.252627, 0.5411765, 0, 1, 1,
0.6317658, 0.4882639, 0.2164289, 0.5490196, 0, 1, 1,
0.6477802, -0.5067056, 2.816483, 0.5529412, 0, 1, 1,
0.6612521, 0.1613779, 1.838086, 0.5607843, 0, 1, 1,
0.6613737, -0.8147025, 3.488488, 0.5647059, 0, 1, 1,
0.6701093, 0.490869, 1.190674, 0.572549, 0, 1, 1,
0.6718819, -1.111344, 2.599079, 0.5764706, 0, 1, 1,
0.6724803, 0.3175906, 1.970589, 0.5843138, 0, 1, 1,
0.6765187, -0.3201942, 1.321203, 0.5882353, 0, 1, 1,
0.680347, -0.9458041, 1.970402, 0.5960785, 0, 1, 1,
0.6828351, -0.7522136, 1.204374, 0.6039216, 0, 1, 1,
0.6868997, -0.4115311, 2.339279, 0.6078432, 0, 1, 1,
0.6887281, -1.470148, 2.913801, 0.6156863, 0, 1, 1,
0.6896925, -1.567792, 2.111429, 0.6196079, 0, 1, 1,
0.6939897, -1.169923, 0.9307772, 0.627451, 0, 1, 1,
0.694339, 0.07853557, 1.640361, 0.6313726, 0, 1, 1,
0.6946517, -0.9068474, 1.600016, 0.6392157, 0, 1, 1,
0.6955709, -0.7155312, 3.00859, 0.6431373, 0, 1, 1,
0.699433, 1.346657, -0.4305964, 0.6509804, 0, 1, 1,
0.7121502, -0.0827913, 2.070265, 0.654902, 0, 1, 1,
0.7181963, -0.2469766, 3.459689, 0.6627451, 0, 1, 1,
0.7248532, 0.01418507, 2.910346, 0.6666667, 0, 1, 1,
0.7260054, -1.088388, 2.781291, 0.6745098, 0, 1, 1,
0.7289755, -0.7486144, 4.565773, 0.6784314, 0, 1, 1,
0.7299961, 0.8310512, 0.5927023, 0.6862745, 0, 1, 1,
0.7302504, -1.224104, 2.078103, 0.6901961, 0, 1, 1,
0.7309564, 0.5630288, -0.5429881, 0.6980392, 0, 1, 1,
0.7372501, -0.04946748, 1.891225, 0.7058824, 0, 1, 1,
0.7374733, -0.1592034, 2.535978, 0.7098039, 0, 1, 1,
0.7460341, 0.07250601, -1.23049, 0.7176471, 0, 1, 1,
0.7467874, 0.3769268, 2.016695, 0.7215686, 0, 1, 1,
0.7486237, -0.1291066, 0.9114772, 0.7294118, 0, 1, 1,
0.7501228, -0.01010728, 2.698429, 0.7333333, 0, 1, 1,
0.7512496, -0.1993401, 0.5667368, 0.7411765, 0, 1, 1,
0.7571792, 0.4392782, 2.851341, 0.7450981, 0, 1, 1,
0.7651763, 0.9188975, 0.5207594, 0.7529412, 0, 1, 1,
0.7657935, -0.06132224, 4.078712, 0.7568628, 0, 1, 1,
0.7662391, 0.7103203, 0.3345917, 0.7647059, 0, 1, 1,
0.7699654, 0.6366546, 1.465671, 0.7686275, 0, 1, 1,
0.7722795, 1.210033, 1.071815, 0.7764706, 0, 1, 1,
0.7770116, 1.033856, 0.1464284, 0.7803922, 0, 1, 1,
0.7814996, 0.6926693, -0.9544536, 0.7882353, 0, 1, 1,
0.782929, -0.09683889, 0.5681751, 0.7921569, 0, 1, 1,
0.784885, 1.31934, 1.186082, 0.8, 0, 1, 1,
0.7897698, -0.8165578, 3.091712, 0.8078431, 0, 1, 1,
0.789822, -1.538864, 1.881146, 0.8117647, 0, 1, 1,
0.7940571, 0.8664952, 1.939931, 0.8196079, 0, 1, 1,
0.7943024, -0.1975816, 2.002326, 0.8235294, 0, 1, 1,
0.7944888, -1.626387, 1.123826, 0.8313726, 0, 1, 1,
0.8025768, 1.413787, 0.007747571, 0.8352941, 0, 1, 1,
0.8034386, -2.08382, 2.466662, 0.8431373, 0, 1, 1,
0.808208, -0.7595913, 3.176328, 0.8470588, 0, 1, 1,
0.8124386, -0.8846402, 2.686323, 0.854902, 0, 1, 1,
0.8254819, -1.481957, 2.715088, 0.8588235, 0, 1, 1,
0.8430505, 0.6923249, 2.042859, 0.8666667, 0, 1, 1,
0.8522785, -0.2621018, 2.674341, 0.8705882, 0, 1, 1,
0.8551022, 0.3868889, 1.652995, 0.8784314, 0, 1, 1,
0.8588319, -1.053545, 3.841528, 0.8823529, 0, 1, 1,
0.862308, -2.423008, 3.432287, 0.8901961, 0, 1, 1,
0.8679643, 0.4154547, 2.538699, 0.8941177, 0, 1, 1,
0.8691019, 1.186808, 0.7206716, 0.9019608, 0, 1, 1,
0.8740621, 0.2552584, 2.328596, 0.9098039, 0, 1, 1,
0.8803808, -0.427698, 0.4031128, 0.9137255, 0, 1, 1,
0.8832955, 1.222288, 0.5033031, 0.9215686, 0, 1, 1,
0.8853969, 0.2262281, -0.6099791, 0.9254902, 0, 1, 1,
0.8869541, -0.7949784, 2.119549, 0.9333333, 0, 1, 1,
0.8927847, -0.8682731, 0.9020604, 0.9372549, 0, 1, 1,
0.8940386, -0.5327924, 2.863135, 0.945098, 0, 1, 1,
0.8970627, -1.872162, 3.879911, 0.9490196, 0, 1, 1,
0.8970932, 0.1204641, 2.905326, 0.9568627, 0, 1, 1,
0.9085764, -1.211295, 1.788768, 0.9607843, 0, 1, 1,
0.9138723, -1.153133, 2.20333, 0.9686275, 0, 1, 1,
0.9188694, -2.366675, 3.127321, 0.972549, 0, 1, 1,
0.9203757, -1.558083, 3.818812, 0.9803922, 0, 1, 1,
0.9215415, 0.7403702, 0.5501081, 0.9843137, 0, 1, 1,
0.924742, -1.278668, 3.17817, 0.9921569, 0, 1, 1,
0.9288794, -0.2532915, 1.205892, 0.9960784, 0, 1, 1,
0.9295913, 0.1148425, 1.299566, 1, 0, 0.9960784, 1,
0.9306087, 0.6837591, 1.395296, 1, 0, 0.9882353, 1,
0.9324687, 1.406766, -0.1934597, 1, 0, 0.9843137, 1,
0.9377493, -0.3176573, 2.649296, 1, 0, 0.9764706, 1,
0.9398343, 0.2436054, -0.2088094, 1, 0, 0.972549, 1,
0.9562882, 1.080799, 0.325491, 1, 0, 0.9647059, 1,
0.9579846, 0.1836616, 1.581759, 1, 0, 0.9607843, 1,
0.9592253, 0.393674, 0.3793431, 1, 0, 0.9529412, 1,
0.9636924, -0.1070788, 0.1789138, 1, 0, 0.9490196, 1,
0.9695393, -0.8122573, 2.073097, 1, 0, 0.9411765, 1,
0.9701967, -0.4993047, 1.046357, 1, 0, 0.9372549, 1,
0.9743621, -1.846, 2.402199, 1, 0, 0.9294118, 1,
0.9870353, 0.2579887, 1.389973, 1, 0, 0.9254902, 1,
0.9875822, -0.2557906, 0.980228, 1, 0, 0.9176471, 1,
0.9932474, 0.7191995, 0.7827528, 1, 0, 0.9137255, 1,
0.9997809, 0.1895603, 0.4200066, 1, 0, 0.9058824, 1,
1.003567, -0.2953408, 3.743731, 1, 0, 0.9019608, 1,
1.004761, -0.5508715, 3.179866, 1, 0, 0.8941177, 1,
1.014303, 1.188358, -0.22755, 1, 0, 0.8862745, 1,
1.014723, -0.1175271, 1.066978, 1, 0, 0.8823529, 1,
1.01935, 0.1312314, 0.5340559, 1, 0, 0.8745098, 1,
1.023233, 1.826146, 0.5323207, 1, 0, 0.8705882, 1,
1.023479, -0.6317526, 2.168446, 1, 0, 0.8627451, 1,
1.024205, -0.1921858, 2.333077, 1, 0, 0.8588235, 1,
1.029976, -0.08223316, 0.7807075, 1, 0, 0.8509804, 1,
1.051422, -0.7547429, 1.436586, 1, 0, 0.8470588, 1,
1.051494, -1.074135, 4.759766, 1, 0, 0.8392157, 1,
1.054004, 0.330381, 1.532651, 1, 0, 0.8352941, 1,
1.060744, -0.08834241, 2.884709, 1, 0, 0.827451, 1,
1.061786, 0.708233, 0.622527, 1, 0, 0.8235294, 1,
1.062549, -0.4007985, 0.8932701, 1, 0, 0.8156863, 1,
1.063585, -1.853209, 1.722827, 1, 0, 0.8117647, 1,
1.067392, 0.9530591, 0.8104953, 1, 0, 0.8039216, 1,
1.067433, 1.03588, -0.4574749, 1, 0, 0.7960784, 1,
1.080212, 0.1359791, -0.4287097, 1, 0, 0.7921569, 1,
1.089122, 0.4818276, 0.6641337, 1, 0, 0.7843137, 1,
1.090829, -1.248471, 1.590107, 1, 0, 0.7803922, 1,
1.091838, -0.5875409, 3.693429, 1, 0, 0.772549, 1,
1.095659, 1.499977, 0.9225752, 1, 0, 0.7686275, 1,
1.096025, -1.168851, 2.712334, 1, 0, 0.7607843, 1,
1.098541, 0.2148176, 0.799108, 1, 0, 0.7568628, 1,
1.099044, -0.5861463, 1.422662, 1, 0, 0.7490196, 1,
1.105707, 1.062335, 2.089248, 1, 0, 0.7450981, 1,
1.108652, 1.030761, 1.38331, 1, 0, 0.7372549, 1,
1.109138, 0.3772361, -1.201593, 1, 0, 0.7333333, 1,
1.111599, -1.636511, 3.52331, 1, 0, 0.7254902, 1,
1.120232, -0.5044109, -0.1330235, 1, 0, 0.7215686, 1,
1.126404, 0.8612209, 0.2207009, 1, 0, 0.7137255, 1,
1.126662, -2.882107, 3.902449, 1, 0, 0.7098039, 1,
1.132904, -0.4482954, 2.513732, 1, 0, 0.7019608, 1,
1.144059, 0.8621997, 0.599913, 1, 0, 0.6941177, 1,
1.147178, -0.4565096, 0.5054291, 1, 0, 0.6901961, 1,
1.147626, 1.364823, 1.596521, 1, 0, 0.682353, 1,
1.150555, 0.04210691, 1.558108, 1, 0, 0.6784314, 1,
1.166843, 2.210822, 1.978443, 1, 0, 0.6705883, 1,
1.168713, 1.018425, -0.3602448, 1, 0, 0.6666667, 1,
1.18033, -0.1470712, 0.9173079, 1, 0, 0.6588235, 1,
1.194291, -1.043459, 2.575289, 1, 0, 0.654902, 1,
1.206398, -0.8131709, 3.53519, 1, 0, 0.6470588, 1,
1.210488, -0.9341859, 1.899567, 1, 0, 0.6431373, 1,
1.211792, 0.3632142, 2.017761, 1, 0, 0.6352941, 1,
1.220953, 1.33941, 2.197627, 1, 0, 0.6313726, 1,
1.227293, -1.12092, 0.2047715, 1, 0, 0.6235294, 1,
1.237468, 1.264719, 0.5193963, 1, 0, 0.6196079, 1,
1.2448, -2.608832, 2.850577, 1, 0, 0.6117647, 1,
1.252303, -0.9269409, 2.293227, 1, 0, 0.6078432, 1,
1.257056, 0.7782305, 1.801166, 1, 0, 0.6, 1,
1.261332, -0.1912401, 1.621689, 1, 0, 0.5921569, 1,
1.267615, -0.3526931, 2.565581, 1, 0, 0.5882353, 1,
1.270006, -0.2328812, 0.8801849, 1, 0, 0.5803922, 1,
1.280122, -0.7464351, 2.015888, 1, 0, 0.5764706, 1,
1.290718, -0.01656136, 2.507277, 1, 0, 0.5686275, 1,
1.297725, -0.1880067, 1.32194, 1, 0, 0.5647059, 1,
1.301821, -2.054299, 1.746091, 1, 0, 0.5568628, 1,
1.314432, -0.5541259, 2.86512, 1, 0, 0.5529412, 1,
1.32067, -1.883569, 2.920083, 1, 0, 0.5450981, 1,
1.326741, 0.06782535, 0.8832327, 1, 0, 0.5411765, 1,
1.352301, -0.3870775, 2.743157, 1, 0, 0.5333334, 1,
1.360047, -0.3020103, 0.5557685, 1, 0, 0.5294118, 1,
1.367203, 0.41626, -0.4670971, 1, 0, 0.5215687, 1,
1.369593, -0.7462553, 2.48639, 1, 0, 0.5176471, 1,
1.387681, 0.2215848, 2.157217, 1, 0, 0.509804, 1,
1.392482, -1.154021, 2.944891, 1, 0, 0.5058824, 1,
1.393856, 0.177204, 0.7169529, 1, 0, 0.4980392, 1,
1.393898, 0.4386356, 0.9818478, 1, 0, 0.4901961, 1,
1.396318, -0.1242929, 2.492935, 1, 0, 0.4862745, 1,
1.398451, -1.007329, 2.053433, 1, 0, 0.4784314, 1,
1.413351, 0.2867962, 0.6836578, 1, 0, 0.4745098, 1,
1.441002, 0.5503966, 2.436258, 1, 0, 0.4666667, 1,
1.44777, 0.264249, -0.1716622, 1, 0, 0.4627451, 1,
1.44811, -0.1322374, 1.478181, 1, 0, 0.454902, 1,
1.453982, 0.4634665, 2.542371, 1, 0, 0.4509804, 1,
1.454247, -0.08421058, 1.060439, 1, 0, 0.4431373, 1,
1.458196, 0.6973646, 0.3045979, 1, 0, 0.4392157, 1,
1.46218, 0.1310682, 1.286968, 1, 0, 0.4313726, 1,
1.483329, 0.209817, 1.224025, 1, 0, 0.427451, 1,
1.505504, 0.58641, 0.01913643, 1, 0, 0.4196078, 1,
1.519798, 0.05833782, -0.3022481, 1, 0, 0.4156863, 1,
1.520821, 0.9954006, 0.7574398, 1, 0, 0.4078431, 1,
1.525504, -0.3430466, 2.200052, 1, 0, 0.4039216, 1,
1.560336, 0.5721133, 2.051142, 1, 0, 0.3960784, 1,
1.565158, 0.5114777, 2.518207, 1, 0, 0.3882353, 1,
1.566207, -0.2991577, -0.007732477, 1, 0, 0.3843137, 1,
1.577536, 0.5902585, 1.314778, 1, 0, 0.3764706, 1,
1.579394, 0.7014903, 2.725863, 1, 0, 0.372549, 1,
1.590566, 2.272447, 0.4946933, 1, 0, 0.3647059, 1,
1.590593, 0.05899014, 1.10464, 1, 0, 0.3607843, 1,
1.590856, -0.4133254, 1.650908, 1, 0, 0.3529412, 1,
1.591064, -0.01213769, 2.412883, 1, 0, 0.3490196, 1,
1.599373, 1.352948, -1.460012, 1, 0, 0.3411765, 1,
1.656081, 0.2584128, -0.7123853, 1, 0, 0.3372549, 1,
1.662014, 1.369685, 2.303809, 1, 0, 0.3294118, 1,
1.662114, -1.8973, 1.510751, 1, 0, 0.3254902, 1,
1.667598, 1.695328, 0.932856, 1, 0, 0.3176471, 1,
1.669233, 0.5689474, 1.569334, 1, 0, 0.3137255, 1,
1.675775, -0.08018199, 1.776142, 1, 0, 0.3058824, 1,
1.676027, 0.3293002, 1.828416, 1, 0, 0.2980392, 1,
1.676585, -0.2330162, 2.83047, 1, 0, 0.2941177, 1,
1.693548, -0.02532703, 1.477191, 1, 0, 0.2862745, 1,
1.695742, 1.515072, 1.28882, 1, 0, 0.282353, 1,
1.716818, -0.3889918, 4.061643, 1, 0, 0.2745098, 1,
1.723214, -0.2432691, 2.225053, 1, 0, 0.2705882, 1,
1.726741, -0.9300435, 1.356255, 1, 0, 0.2627451, 1,
1.731859, -0.2595054, 0.4597572, 1, 0, 0.2588235, 1,
1.745796, -0.8821263, 0.7934578, 1, 0, 0.2509804, 1,
1.780818, -0.08583342, 3.368458, 1, 0, 0.2470588, 1,
1.783651, 0.4848384, 1.002763, 1, 0, 0.2392157, 1,
1.803871, 0.1053581, 2.719638, 1, 0, 0.2352941, 1,
1.824166, 0.5325335, 1.193117, 1, 0, 0.227451, 1,
1.827263, 0.6774501, 1.945981, 1, 0, 0.2235294, 1,
1.829658, 0.3156044, 2.61363, 1, 0, 0.2156863, 1,
1.834564, 0.7666041, 0.6073546, 1, 0, 0.2117647, 1,
1.844463, -0.7406587, 0.4418974, 1, 0, 0.2039216, 1,
1.883727, -1.501595, 2.196325, 1, 0, 0.1960784, 1,
1.888934, -0.1181662, 1.277615, 1, 0, 0.1921569, 1,
1.903618, -0.934244, 2.592314, 1, 0, 0.1843137, 1,
1.928899, 0.6757714, 0.6952267, 1, 0, 0.1803922, 1,
1.938851, -0.007768736, 2.250283, 1, 0, 0.172549, 1,
1.967423, 1.655788, 0.02999785, 1, 0, 0.1686275, 1,
1.994919, 1.475401, 1.691598, 1, 0, 0.1607843, 1,
2.000526, -0.406702, 1.429974, 1, 0, 0.1568628, 1,
2.006309, -0.219654, 0.1626587, 1, 0, 0.1490196, 1,
2.016406, -0.3604469, 2.012073, 1, 0, 0.145098, 1,
2.027226, 1.043893, 0.5804752, 1, 0, 0.1372549, 1,
2.032695, -0.5216256, 1.718976, 1, 0, 0.1333333, 1,
2.053768, -1.413661, 1.584455, 1, 0, 0.1254902, 1,
2.068737, 0.5747701, 0.7749296, 1, 0, 0.1215686, 1,
2.070251, 1.67697, 0.4634042, 1, 0, 0.1137255, 1,
2.094407, -2.074464, 4.134133, 1, 0, 0.1098039, 1,
2.103052, 0.1555513, 2.167325, 1, 0, 0.1019608, 1,
2.114897, -0.7291742, 1.259192, 1, 0, 0.09411765, 1,
2.11596, 0.6456225, -0.3863826, 1, 0, 0.09019608, 1,
2.151388, 0.983965, 0.5583807, 1, 0, 0.08235294, 1,
2.235376, 1.556519, 0.3960356, 1, 0, 0.07843138, 1,
2.237494, 0.2143155, 0.6799523, 1, 0, 0.07058824, 1,
2.23753, -1.862278, 1.218138, 1, 0, 0.06666667, 1,
2.248878, -1.267777, 3.345594, 1, 0, 0.05882353, 1,
2.287277, -0.4799893, 0.7208456, 1, 0, 0.05490196, 1,
2.34255, 1.43561, 1.597083, 1, 0, 0.04705882, 1,
2.385061, 1.759022, 1.287281, 1, 0, 0.04313726, 1,
2.386606, 1.092452, 1.700721, 1, 0, 0.03529412, 1,
2.447382, -0.6400518, 3.531696, 1, 0, 0.03137255, 1,
2.589268, -0.4478388, 1.734982, 1, 0, 0.02352941, 1,
2.636855, -1.053293, -1.078904, 1, 0, 0.01960784, 1,
3.14036, -1.897048, 3.752774, 1, 0, 0.01176471, 1,
4.442319, 0.06100085, 1.97866, 1, 0, 0.007843138, 1
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
0.5661517, -4.069671, -6.911091, 0, -0.5, 0.5, 0.5,
0.5661517, -4.069671, -6.911091, 1, -0.5, 0.5, 0.5,
0.5661517, -4.069671, -6.911091, 1, 1.5, 0.5, 0.5,
0.5661517, -4.069671, -6.911091, 0, 1.5, 0.5, 0.5
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
-4.624036, 0.2472582, -6.911091, 0, -0.5, 0.5, 0.5,
-4.624036, 0.2472582, -6.911091, 1, -0.5, 0.5, 0.5,
-4.624036, 0.2472582, -6.911091, 1, 1.5, 0.5, 0.5,
-4.624036, 0.2472582, -6.911091, 0, 1.5, 0.5, 0.5
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
-4.624036, -4.069671, -0.04315925, 0, -0.5, 0.5, 0.5,
-4.624036, -4.069671, -0.04315925, 1, -0.5, 0.5, 0.5,
-4.624036, -4.069671, -0.04315925, 1, 1.5, 0.5, 0.5,
-4.624036, -4.069671, -0.04315925, 0, 1.5, 0.5, 0.5
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
-2, -3.073456, -5.326184,
4, -3.073456, -5.326184,
-2, -3.073456, -5.326184,
-2, -3.239492, -5.590335,
0, -3.073456, -5.326184,
0, -3.239492, -5.590335,
2, -3.073456, -5.326184,
2, -3.239492, -5.590335,
4, -3.073456, -5.326184,
4, -3.239492, -5.590335
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
"2",
"4"
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
-2, -3.571563, -6.118638, 0, -0.5, 0.5, 0.5,
-2, -3.571563, -6.118638, 1, -0.5, 0.5, 0.5,
-2, -3.571563, -6.118638, 1, 1.5, 0.5, 0.5,
-2, -3.571563, -6.118638, 0, 1.5, 0.5, 0.5,
0, -3.571563, -6.118638, 0, -0.5, 0.5, 0.5,
0, -3.571563, -6.118638, 1, -0.5, 0.5, 0.5,
0, -3.571563, -6.118638, 1, 1.5, 0.5, 0.5,
0, -3.571563, -6.118638, 0, 1.5, 0.5, 0.5,
2, -3.571563, -6.118638, 0, -0.5, 0.5, 0.5,
2, -3.571563, -6.118638, 1, -0.5, 0.5, 0.5,
2, -3.571563, -6.118638, 1, 1.5, 0.5, 0.5,
2, -3.571563, -6.118638, 0, 1.5, 0.5, 0.5,
4, -3.571563, -6.118638, 0, -0.5, 0.5, 0.5,
4, -3.571563, -6.118638, 1, -0.5, 0.5, 0.5,
4, -3.571563, -6.118638, 1, 1.5, 0.5, 0.5,
4, -3.571563, -6.118638, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.426301, -2, -5.326184,
-3.426301, 3, -5.326184,
-3.426301, -2, -5.326184,
-3.625923, -2, -5.590335,
-3.426301, -1, -5.326184,
-3.625923, -1, -5.590335,
-3.426301, 0, -5.326184,
-3.625923, 0, -5.590335,
-3.426301, 1, -5.326184,
-3.625923, 1, -5.590335,
-3.426301, 2, -5.326184,
-3.625923, 2, -5.590335,
-3.426301, 3, -5.326184,
-3.625923, 3, -5.590335
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
-4.025168, -2, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, -2, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, -2, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, -2, -6.118638, 0, 1.5, 0.5, 0.5,
-4.025168, -1, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, -1, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, -1, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, -1, -6.118638, 0, 1.5, 0.5, 0.5,
-4.025168, 0, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, 0, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, 0, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, 0, -6.118638, 0, 1.5, 0.5, 0.5,
-4.025168, 1, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, 1, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, 1, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, 1, -6.118638, 0, 1.5, 0.5, 0.5,
-4.025168, 2, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, 2, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, 2, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, 2, -6.118638, 0, 1.5, 0.5, 0.5,
-4.025168, 3, -6.118638, 0, -0.5, 0.5, 0.5,
-4.025168, 3, -6.118638, 1, -0.5, 0.5, 0.5,
-4.025168, 3, -6.118638, 1, 1.5, 0.5, 0.5,
-4.025168, 3, -6.118638, 0, 1.5, 0.5, 0.5
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
-3.426301, -3.073456, -4,
-3.426301, -3.073456, 4,
-3.426301, -3.073456, -4,
-3.625923, -3.239492, -4,
-3.426301, -3.073456, -2,
-3.625923, -3.239492, -2,
-3.426301, -3.073456, 0,
-3.625923, -3.239492, 0,
-3.426301, -3.073456, 2,
-3.625923, -3.239492, 2,
-3.426301, -3.073456, 4,
-3.625923, -3.239492, 4
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
-4.025168, -3.571563, -4, 0, -0.5, 0.5, 0.5,
-4.025168, -3.571563, -4, 1, -0.5, 0.5, 0.5,
-4.025168, -3.571563, -4, 1, 1.5, 0.5, 0.5,
-4.025168, -3.571563, -4, 0, 1.5, 0.5, 0.5,
-4.025168, -3.571563, -2, 0, -0.5, 0.5, 0.5,
-4.025168, -3.571563, -2, 1, -0.5, 0.5, 0.5,
-4.025168, -3.571563, -2, 1, 1.5, 0.5, 0.5,
-4.025168, -3.571563, -2, 0, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 0, 0, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 0, 1, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 0, 1, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 0, 0, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 2, 0, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 2, 1, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 2, 1, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 2, 0, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 4, 0, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 4, 1, -0.5, 0.5, 0.5,
-4.025168, -3.571563, 4, 1, 1.5, 0.5, 0.5,
-4.025168, -3.571563, 4, 0, 1.5, 0.5, 0.5
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
-3.426301, -3.073456, -5.326184,
-3.426301, 3.567973, -5.326184,
-3.426301, -3.073456, 5.239865,
-3.426301, 3.567973, 5.239865,
-3.426301, -3.073456, -5.326184,
-3.426301, -3.073456, 5.239865,
-3.426301, 3.567973, -5.326184,
-3.426301, 3.567973, 5.239865,
-3.426301, -3.073456, -5.326184,
4.558604, -3.073456, -5.326184,
-3.426301, -3.073456, 5.239865,
4.558604, -3.073456, 5.239865,
-3.426301, 3.567973, -5.326184,
4.558604, 3.567973, -5.326184,
-3.426301, 3.567973, 5.239865,
4.558604, 3.567973, 5.239865,
4.558604, -3.073456, -5.326184,
4.558604, 3.567973, -5.326184,
4.558604, -3.073456, 5.239865,
4.558604, 3.567973, 5.239865,
4.558604, -3.073456, -5.326184,
4.558604, -3.073456, 5.239865,
4.558604, 3.567973, -5.326184,
4.558604, 3.567973, 5.239865
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
var radius = 7.911363;
var distance = 35.19855;
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
mvMatrix.translate( -0.5661517, -0.2472582, 0.04315925 );
mvMatrix.scale( 1.071262, 1.287964, 0.8095666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19855);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
## Error in read.table("3-isopropyl-5-methyl.xyz"): no lines available in input
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
-3.310015, 0.3513632, -1.253709, 0, 0, 1, 1, 1,
-2.872097, -0.00921593, -0.5337367, 1, 0, 0, 1, 1,
-2.864467, 0.3780548, -1.36588, 1, 0, 0, 1, 1,
-2.589958, 0.8314157, -2.133394, 1, 0, 0, 1, 1,
-2.425116, -2.062499, -0.6545394, 1, 0, 0, 1, 1,
-2.353058, 0.08991793, -0.3640583, 1, 0, 0, 1, 1,
-2.317569, 0.6374574, 0.0626427, 0, 0, 0, 1, 1,
-2.296099, 0.1692446, 0.2262669, 0, 0, 0, 1, 1,
-2.262682, -0.08104162, -1.640439, 0, 0, 0, 1, 1,
-2.253709, 0.5299642, -0.7153172, 0, 0, 0, 1, 1,
-2.186681, 0.207285, -0.4577902, 0, 0, 0, 1, 1,
-2.126695, 0.5321863, -1.963332, 0, 0, 0, 1, 1,
-2.084734, -0.6158158, -2.782615, 0, 0, 0, 1, 1,
-2.081518, -0.3765998, -1.920768, 1, 1, 1, 1, 1,
-2.040949, -0.9052095, -0.5151213, 1, 1, 1, 1, 1,
-2.034543, -0.2455167, -2.167068, 1, 1, 1, 1, 1,
-2.032517, 1.612221, -1.97361, 1, 1, 1, 1, 1,
-2.019788, -1.172207, -2.019065, 1, 1, 1, 1, 1,
-2.013513, -0.7993696, -1.792417, 1, 1, 1, 1, 1,
-2.000575, 0.1753682, -1.392383, 1, 1, 1, 1, 1,
-1.940069, -0.1974272, 0.7586803, 1, 1, 1, 1, 1,
-1.935987, -0.007445983, -2.05929, 1, 1, 1, 1, 1,
-1.923581, 0.02311196, -0.8620582, 1, 1, 1, 1, 1,
-1.89972, -0.01975903, 0.4413651, 1, 1, 1, 1, 1,
-1.868444, 1.359944, -3.142827, 1, 1, 1, 1, 1,
-1.862814, -1.284086, -3.633066, 1, 1, 1, 1, 1,
-1.861176, 1.023129, -1.588953, 1, 1, 1, 1, 1,
-1.854086, 0.961966, -2.076366, 1, 1, 1, 1, 1,
-1.852448, -0.03440875, -1.225234, 0, 0, 1, 1, 1,
-1.84406, -0.8893574, -2.469294, 1, 0, 0, 1, 1,
-1.838566, -0.5191553, -2.827298, 1, 0, 0, 1, 1,
-1.822998, 0.3301181, 0.09204704, 1, 0, 0, 1, 1,
-1.813078, 0.5783547, -0.5006986, 1, 0, 0, 1, 1,
-1.80749, -0.8293899, -2.178988, 1, 0, 0, 1, 1,
-1.805707, -0.4984823, -0.5282489, 0, 0, 0, 1, 1,
-1.799012, 0.5416535, -0.5584309, 0, 0, 0, 1, 1,
-1.791999, 0.7801191, -1.392638, 0, 0, 0, 1, 1,
-1.783694, -0.1574777, -2.20013, 0, 0, 0, 1, 1,
-1.767974, 2.650446, 0.1094672, 0, 0, 0, 1, 1,
-1.766123, 0.11122, -0.4810231, 0, 0, 0, 1, 1,
-1.765325, -2.458291, -2.622603, 0, 0, 0, 1, 1,
-1.762123, 0.6746145, -1.670685, 1, 1, 1, 1, 1,
-1.749811, -1.002808, -2.940828, 1, 1, 1, 1, 1,
-1.725661, -0.8533396, -2.124164, 1, 1, 1, 1, 1,
-1.712476, -0.4474049, -2.605996, 1, 1, 1, 1, 1,
-1.707593, -0.4599229, -2.498683, 1, 1, 1, 1, 1,
-1.699555, -1.628188, -2.384927, 1, 1, 1, 1, 1,
-1.682439, -0.5858209, -2.262364, 1, 1, 1, 1, 1,
-1.674007, 1.082629, -0.5557265, 1, 1, 1, 1, 1,
-1.669766, 0.6674467, -1.850816, 1, 1, 1, 1, 1,
-1.668234, -0.4920963, -1.251753, 1, 1, 1, 1, 1,
-1.665265, -0.635393, -2.789632, 1, 1, 1, 1, 1,
-1.65692, 0.06696233, -0.9370863, 1, 1, 1, 1, 1,
-1.64356, 0.4196939, -0.7953653, 1, 1, 1, 1, 1,
-1.633792, 0.2157865, -1.079778, 1, 1, 1, 1, 1,
-1.622683, 0.3516889, -3.322371, 1, 1, 1, 1, 1,
-1.619443, -0.3932185, -2.004298, 0, 0, 1, 1, 1,
-1.617017, -1.408065, -1.230347, 1, 0, 0, 1, 1,
-1.601163, -0.7633569, -1.627502, 1, 0, 0, 1, 1,
-1.586025, -1.197202, -2.343766, 1, 0, 0, 1, 1,
-1.581195, 0.7033554, 0.6013861, 1, 0, 0, 1, 1,
-1.576371, -0.6167249, -1.470878, 1, 0, 0, 1, 1,
-1.573553, -0.2492729, -1.527473, 0, 0, 0, 1, 1,
-1.555819, -0.3245122, -1.809043, 0, 0, 0, 1, 1,
-1.537239, -0.3946275, -1.492074, 0, 0, 0, 1, 1,
-1.535096, -0.115397, -4.967162, 0, 0, 0, 1, 1,
-1.53509, -2.30757, -3.407439, 0, 0, 0, 1, 1,
-1.531092, 0.9715632, -0.8000689, 0, 0, 0, 1, 1,
-1.520622, -0.220197, -0.7073224, 0, 0, 0, 1, 1,
-1.520191, -0.8434249, -0.8305356, 1, 1, 1, 1, 1,
-1.512862, -0.3201915, -2.359539, 1, 1, 1, 1, 1,
-1.502552, 0.9090945, -2.345897, 1, 1, 1, 1, 1,
-1.502113, 1.362464, -0.07872872, 1, 1, 1, 1, 1,
-1.499383, 0.8368384, 0.6672632, 1, 1, 1, 1, 1,
-1.494469, 0.7378026, -0.5170999, 1, 1, 1, 1, 1,
-1.492485, -0.1875312, -2.461756, 1, 1, 1, 1, 1,
-1.490391, 0.9790951, -0.1885508, 1, 1, 1, 1, 1,
-1.480474, 1.484916, -1.160735, 1, 1, 1, 1, 1,
-1.480305, -0.4657967, 0.4555157, 1, 1, 1, 1, 1,
-1.477551, 1.006726, -0.6380054, 1, 1, 1, 1, 1,
-1.465679, -1.60813, -3.067964, 1, 1, 1, 1, 1,
-1.461775, 0.1397325, -1.786912, 1, 1, 1, 1, 1,
-1.456831, 0.07808897, -0.2556457, 1, 1, 1, 1, 1,
-1.411806, 1.066592, -0.3988385, 1, 1, 1, 1, 1,
-1.407674, 0.2385215, -1.444035, 0, 0, 1, 1, 1,
-1.406439, 0.1507287, -3.102166, 1, 0, 0, 1, 1,
-1.403367, -1.773562, -2.356313, 1, 0, 0, 1, 1,
-1.396122, -0.4142703, -2.829777, 1, 0, 0, 1, 1,
-1.392421, 0.02898637, -0.2579363, 1, 0, 0, 1, 1,
-1.391331, -0.4455428, -0.6646878, 1, 0, 0, 1, 1,
-1.386727, -1.164318, -1.617004, 0, 0, 0, 1, 1,
-1.385889, 2.668335, -0.1526967, 0, 0, 0, 1, 1,
-1.369197, 1.820876, -2.14848, 0, 0, 0, 1, 1,
-1.366292, -1.842389, -4.0863, 0, 0, 0, 1, 1,
-1.351968, -0.3671327, -1.343336, 0, 0, 0, 1, 1,
-1.342345, 0.5124251, -0.822437, 0, 0, 0, 1, 1,
-1.341424, -0.9107028, -2.722198, 0, 0, 0, 1, 1,
-1.33961, 1.119536, -0.3437796, 1, 1, 1, 1, 1,
-1.324764, 0.7313318, 0.911445, 1, 1, 1, 1, 1,
-1.321488, 0.3807522, -2.088398, 1, 1, 1, 1, 1,
-1.31527, 1.430716, -0.4778192, 1, 1, 1, 1, 1,
-1.313678, -1.253848, -0.8356569, 1, 1, 1, 1, 1,
-1.311212, 0.04514081, -0.8631331, 1, 1, 1, 1, 1,
-1.307241, -1.770837, -2.021686, 1, 1, 1, 1, 1,
-1.304631, -0.1920243, -1.994577, 1, 1, 1, 1, 1,
-1.292529, -0.4814395, -0.8424972, 1, 1, 1, 1, 1,
-1.292375, 2.634648, -0.2704381, 1, 1, 1, 1, 1,
-1.291601, -1.111734, -2.275465, 1, 1, 1, 1, 1,
-1.288297, 0.6534709, -1.411532, 1, 1, 1, 1, 1,
-1.281402, 0.07647172, -0.7987717, 1, 1, 1, 1, 1,
-1.268494, 1.038937, -0.01275322, 1, 1, 1, 1, 1,
-1.267216, 1.587295, -1.492952, 1, 1, 1, 1, 1,
-1.259227, 1.294962, -1.845566, 0, 0, 1, 1, 1,
-1.249088, -2.259055, -1.694764, 1, 0, 0, 1, 1,
-1.225804, 0.3901005, -2.035259, 1, 0, 0, 1, 1,
-1.201021, -0.02413322, -3.173567, 1, 0, 0, 1, 1,
-1.199709, 0.9588476, 0.2602185, 1, 0, 0, 1, 1,
-1.193755, 0.3945931, -0.8114668, 1, 0, 0, 1, 1,
-1.19105, 0.1090081, -2.419034, 0, 0, 0, 1, 1,
-1.18989, 1.14552, -1.368218, 0, 0, 0, 1, 1,
-1.189494, -0.1516714, -0.7917812, 0, 0, 0, 1, 1,
-1.188661, 0.03208733, -2.560549, 0, 0, 0, 1, 1,
-1.186357, -0.02154835, -1.170134, 0, 0, 0, 1, 1,
-1.185097, 0.1709691, -2.187095, 0, 0, 0, 1, 1,
-1.18474, 0.566856, -1.803327, 0, 0, 0, 1, 1,
-1.182752, 1.375602, -0.3901475, 1, 1, 1, 1, 1,
-1.177144, -0.527642, -0.8561034, 1, 1, 1, 1, 1,
-1.176988, 1.930037, 0.6174511, 1, 1, 1, 1, 1,
-1.171938, -0.397902, -2.073803, 1, 1, 1, 1, 1,
-1.17099, -0.4768656, -1.869884, 1, 1, 1, 1, 1,
-1.165208, -0.9248472, -3.585147, 1, 1, 1, 1, 1,
-1.164183, 0.4406967, -2.794968, 1, 1, 1, 1, 1,
-1.159239, -0.4510369, -1.56847, 1, 1, 1, 1, 1,
-1.151295, 0.05986552, -0.2692022, 1, 1, 1, 1, 1,
-1.144667, 0.8550074, -0.7843941, 1, 1, 1, 1, 1,
-1.140358, -0.5546812, -1.697387, 1, 1, 1, 1, 1,
-1.138879, -0.8142961, -3.490591, 1, 1, 1, 1, 1,
-1.136837, -0.7371088, -2.128927, 1, 1, 1, 1, 1,
-1.132452, 0.9813129, -0.8458285, 1, 1, 1, 1, 1,
-1.129596, -2.13818, -2.862716, 1, 1, 1, 1, 1,
-1.124336, -0.993605, -1.516667, 0, 0, 1, 1, 1,
-1.123405, -0.521138, -0.7361535, 1, 0, 0, 1, 1,
-1.119935, -1.147973, -3.013393, 1, 0, 0, 1, 1,
-1.118835, -0.6825432, -2.23176, 1, 0, 0, 1, 1,
-1.113109, 2.326419, 0.6666588, 1, 0, 0, 1, 1,
-1.112928, 1.012797, -2.178128, 1, 0, 0, 1, 1,
-1.110341, 0.2088801, -0.4116067, 0, 0, 0, 1, 1,
-1.105296, -0.4189808, -3.054405, 0, 0, 0, 1, 1,
-1.097068, 0.4524651, -1.23388, 0, 0, 0, 1, 1,
-1.090073, -1.278113, -2.520129, 0, 0, 0, 1, 1,
-1.089844, 0.6721479, -0.5933971, 0, 0, 0, 1, 1,
-1.089147, -0.9504417, -2.861638, 0, 0, 0, 1, 1,
-1.087165, 1.58857, -0.7765095, 0, 0, 0, 1, 1,
-1.082598, -1.287651, -1.91519, 1, 1, 1, 1, 1,
-1.081682, -0.44471, -1.523426, 1, 1, 1, 1, 1,
-1.079879, 1.275037, -0.07877976, 1, 1, 1, 1, 1,
-1.076836, -2.168574, -2.731998, 1, 1, 1, 1, 1,
-1.074085, 0.03831007, -1.053957, 1, 1, 1, 1, 1,
-1.073392, -0.3118362, -1.260062, 1, 1, 1, 1, 1,
-1.072002, -1.579394, -3.432371, 1, 1, 1, 1, 1,
-1.066017, -0.4003889, -3.786367, 1, 1, 1, 1, 1,
-1.060538, -0.09005275, -2.103301, 1, 1, 1, 1, 1,
-1.058274, -0.1687401, -1.862855, 1, 1, 1, 1, 1,
-1.045094, 0.8985703, -0.3918988, 1, 1, 1, 1, 1,
-1.040072, -0.4929969, -3.101231, 1, 1, 1, 1, 1,
-1.034089, -1.007644, -2.755887, 1, 1, 1, 1, 1,
-1.033376, 1.102931, 1.204263, 1, 1, 1, 1, 1,
-1.030859, -1.035867, -3.055809, 1, 1, 1, 1, 1,
-1.027569, 1.437928, -1.192694, 0, 0, 1, 1, 1,
-1.026607, -0.5943439, -0.3789903, 1, 0, 0, 1, 1,
-1.023321, 0.8656235, -0.5616687, 1, 0, 0, 1, 1,
-1.02201, -0.218517, -2.954277, 1, 0, 0, 1, 1,
-1.020608, 1.935279, -0.2991915, 1, 0, 0, 1, 1,
-1.018733, 0.9637878, 0.4680321, 1, 0, 0, 1, 1,
-1.016252, -1.798964, -2.756287, 0, 0, 0, 1, 1,
-1.015864, -1.896376, -2.622424, 0, 0, 0, 1, 1,
-1.015354, 0.05096144, 0.4281319, 0, 0, 0, 1, 1,
-1.00698, -0.07673667, -2.637249, 0, 0, 0, 1, 1,
-1.005218, -0.8661004, -2.81595, 0, 0, 0, 1, 1,
-1.000254, -0.7631057, -1.748314, 0, 0, 0, 1, 1,
-0.9939856, -0.2592056, -3.248873, 0, 0, 0, 1, 1,
-0.9924085, 0.02182362, -3.528531, 1, 1, 1, 1, 1,
-0.9919962, 0.2005637, -0.9019337, 1, 1, 1, 1, 1,
-0.9868109, -1.322724, -1.411272, 1, 1, 1, 1, 1,
-0.9860759, -0.01013895, -1.078112, 1, 1, 1, 1, 1,
-0.9821146, 1.689613, -1.031855, 1, 1, 1, 1, 1,
-0.9710085, 1.026472, -0.3646556, 1, 1, 1, 1, 1,
-0.959788, -0.8793015, -1.442335, 1, 1, 1, 1, 1,
-0.9585879, 0.2864665, -0.6466537, 1, 1, 1, 1, 1,
-0.9570465, 1.538668, 0.04355001, 1, 1, 1, 1, 1,
-0.9547796, 1.286777, -0.51809, 1, 1, 1, 1, 1,
-0.9362655, 1.352529, -0.681172, 1, 1, 1, 1, 1,
-0.9358946, -0.990281, -1.335265, 1, 1, 1, 1, 1,
-0.9343632, -0.6505734, -0.8084344, 1, 1, 1, 1, 1,
-0.9322111, 0.8376222, -0.9026061, 1, 1, 1, 1, 1,
-0.9297373, -1.173661, -2.599236, 1, 1, 1, 1, 1,
-0.9251596, 0.7034249, -0.9433255, 0, 0, 1, 1, 1,
-0.9245301, -0.2924542, -1.84003, 1, 0, 0, 1, 1,
-0.9192594, 1.024557, -1.181031, 1, 0, 0, 1, 1,
-0.9155023, 0.2987483, -2.021435, 1, 0, 0, 1, 1,
-0.9112098, 0.2988223, -0.5158204, 1, 0, 0, 1, 1,
-0.9076997, -1.193506, -0.9603448, 1, 0, 0, 1, 1,
-0.9007393, -0.1465676, -4.032225, 0, 0, 0, 1, 1,
-0.8973846, 1.187495, -2.032507, 0, 0, 0, 1, 1,
-0.89624, 0.5229657, -1.943044, 0, 0, 0, 1, 1,
-0.8937334, -1.343478, -1.560154, 0, 0, 0, 1, 1,
-0.8886085, 3.471253, 1.025684, 0, 0, 0, 1, 1,
-0.8857431, 1.2964, -1.728374, 0, 0, 0, 1, 1,
-0.88278, -1.903803, -1.759748, 0, 0, 0, 1, 1,
-0.8761529, 1.294724, -1.715933, 1, 1, 1, 1, 1,
-0.8717536, -1.503078, -2.73764, 1, 1, 1, 1, 1,
-0.8691216, 0.2889374, -0.7322013, 1, 1, 1, 1, 1,
-0.8674473, -0.3215215, -2.710474, 1, 1, 1, 1, 1,
-0.8627828, -0.2300269, -2.67309, 1, 1, 1, 1, 1,
-0.8579432, 1.291049, -2.054492, 1, 1, 1, 1, 1,
-0.8484295, 1.110641, -0.5745358, 1, 1, 1, 1, 1,
-0.8465457, -0.6042412, -0.02378376, 1, 1, 1, 1, 1,
-0.845938, -0.1797943, -3.573892, 1, 1, 1, 1, 1,
-0.8417281, -0.2879688, -2.661433, 1, 1, 1, 1, 1,
-0.8338187, 1.190055, 0.6334993, 1, 1, 1, 1, 1,
-0.8270673, -1.379498, -2.645597, 1, 1, 1, 1, 1,
-0.8214634, -1.120977, -2.791975, 1, 1, 1, 1, 1,
-0.8201119, 0.4289362, -1.232576, 1, 1, 1, 1, 1,
-0.8192508, 0.2961843, -1.839875, 1, 1, 1, 1, 1,
-0.8129334, -0.1729337, -3.088525, 0, 0, 1, 1, 1,
-0.8110052, -0.8978868, -3.338168, 1, 0, 0, 1, 1,
-0.8074507, -1.483616, -2.802524, 1, 0, 0, 1, 1,
-0.8048005, -1.262138, -3.316455, 1, 0, 0, 1, 1,
-0.8030022, 1.561861, 1.627036, 1, 0, 0, 1, 1,
-0.7983708, -0.8523729, -3.166146, 1, 0, 0, 1, 1,
-0.7972852, -1.811227, -2.990358, 0, 0, 0, 1, 1,
-0.7892479, -1.348924, -2.849368, 0, 0, 0, 1, 1,
-0.7878642, -0.7901023, -2.034368, 0, 0, 0, 1, 1,
-0.7865525, -1.197144, -1.832181, 0, 0, 0, 1, 1,
-0.7804726, 2.649109, -1.020576, 0, 0, 0, 1, 1,
-0.7753172, 0.6761836, -1.422126, 0, 0, 0, 1, 1,
-0.7720866, 1.402409, -0.5570213, 0, 0, 0, 1, 1,
-0.7707333, -2.5102, -2.668624, 1, 1, 1, 1, 1,
-0.7699366, -2.115358, -3.378433, 1, 1, 1, 1, 1,
-0.7675025, -0.4504808, -1.45155, 1, 1, 1, 1, 1,
-0.7559497, 0.1660452, -0.2950757, 1, 1, 1, 1, 1,
-0.7520653, 0.61943, -1.038246, 1, 1, 1, 1, 1,
-0.7512278, 0.08096863, -0.558696, 1, 1, 1, 1, 1,
-0.7506186, -0.9154833, -4.421011, 1, 1, 1, 1, 1,
-0.750001, -0.6375415, -1.147588, 1, 1, 1, 1, 1,
-0.7466233, -1.348779, -2.915991, 1, 1, 1, 1, 1,
-0.7465037, 0.5334844, -2.326159, 1, 1, 1, 1, 1,
-0.7416344, 0.7480979, -0.926376, 1, 1, 1, 1, 1,
-0.7380218, -0.5954694, -3.307542, 1, 1, 1, 1, 1,
-0.7355443, 0.1768647, -0.3021915, 1, 1, 1, 1, 1,
-0.7292102, -1.26467, -4.68638, 1, 1, 1, 1, 1,
-0.7279391, 0.2303973, -0.558116, 1, 1, 1, 1, 1,
-0.7164108, 1.169772, 2.553147, 0, 0, 1, 1, 1,
-0.7128087, 1.271414, -1.411845, 1, 0, 0, 1, 1,
-0.7102656, 1.124204, -0.2029345, 1, 0, 0, 1, 1,
-0.7089665, -0.09991536, -1.894799, 1, 0, 0, 1, 1,
-0.7079115, 0.3225714, -0.6502663, 1, 0, 0, 1, 1,
-0.7073985, 1.645099, -0.7259303, 1, 0, 0, 1, 1,
-0.7038243, 2.976094, -0.2446934, 0, 0, 0, 1, 1,
-0.7025989, -1.316624, -2.832501, 0, 0, 0, 1, 1,
-0.7012663, -0.002488923, -0.5897956, 0, 0, 0, 1, 1,
-0.6972659, 0.09292629, -1.610422, 0, 0, 0, 1, 1,
-0.6959835, 0.6168806, -0.297474, 0, 0, 0, 1, 1,
-0.693463, 1.147227, 1.042428, 0, 0, 0, 1, 1,
-0.6924904, -0.7951177, -2.563269, 0, 0, 0, 1, 1,
-0.6913728, -0.1902612, -1.878826, 1, 1, 1, 1, 1,
-0.690082, -1.44729, -4.346764, 1, 1, 1, 1, 1,
-0.6798558, -0.5642142, -2.546551, 1, 1, 1, 1, 1,
-0.6796901, 0.5325524, -1.575187, 1, 1, 1, 1, 1,
-0.6736193, -0.1408653, -2.150862, 1, 1, 1, 1, 1,
-0.6685385, -0.5965936, -3.905261, 1, 1, 1, 1, 1,
-0.6663391, 0.8829076, 0.06426794, 1, 1, 1, 1, 1,
-0.6651489, 0.8387401, -0.2155535, 1, 1, 1, 1, 1,
-0.6634014, -0.6794023, -1.232877, 1, 1, 1, 1, 1,
-0.657456, -0.5385852, -3.07461, 1, 1, 1, 1, 1,
-0.6551926, 1.448003, -0.7620068, 1, 1, 1, 1, 1,
-0.6546471, 1.559991, 0.6797178, 1, 1, 1, 1, 1,
-0.6539459, 0.8537199, 0.7645844, 1, 1, 1, 1, 1,
-0.6491536, -0.9364325, -4.035163, 1, 1, 1, 1, 1,
-0.6471792, 0.844366, -1.814643, 1, 1, 1, 1, 1,
-0.6375382, 0.1999039, -0.1003202, 0, 0, 1, 1, 1,
-0.6360208, -0.3618158, -3.520376, 1, 0, 0, 1, 1,
-0.6303503, 0.8490101, -0.4866073, 1, 0, 0, 1, 1,
-0.6283824, -0.8648907, -2.651624, 1, 0, 0, 1, 1,
-0.6267268, 0.6561438, -0.4778767, 1, 0, 0, 1, 1,
-0.625805, 0.6884338, -1.274723, 1, 0, 0, 1, 1,
-0.6227634, -2.192394, -3.205316, 0, 0, 0, 1, 1,
-0.620939, -0.478331, -1.427179, 0, 0, 0, 1, 1,
-0.6184584, -0.9632387, -3.105085, 0, 0, 0, 1, 1,
-0.6163744, 1.241017, 0.8811793, 0, 0, 0, 1, 1,
-0.6066105, 0.5128598, -0.662959, 0, 0, 0, 1, 1,
-0.6055862, 1.345428, -1.771247, 0, 0, 0, 1, 1,
-0.6017079, -0.9234211, -2.390184, 0, 0, 0, 1, 1,
-0.5994087, 0.1408946, -1.342807, 1, 1, 1, 1, 1,
-0.5993781, 0.7331597, -2.586996, 1, 1, 1, 1, 1,
-0.599141, -0.9738718, -3.021045, 1, 1, 1, 1, 1,
-0.5987904, -0.2330539, -2.612431, 1, 1, 1, 1, 1,
-0.59847, 0.2974121, -1.584664, 1, 1, 1, 1, 1,
-0.5984562, 0.02572752, -2.697558, 1, 1, 1, 1, 1,
-0.5980847, 0.1261286, 0.4370939, 1, 1, 1, 1, 1,
-0.5976344, -0.1229303, -0.3632551, 1, 1, 1, 1, 1,
-0.5966522, 0.3990199, -0.9239552, 1, 1, 1, 1, 1,
-0.5927123, -0.312608, -3.176579, 1, 1, 1, 1, 1,
-0.5901869, -0.2075014, -2.540355, 1, 1, 1, 1, 1,
-0.5755743, -0.4677062, -1.187955, 1, 1, 1, 1, 1,
-0.5722906, -0.2627202, -0.2270397, 1, 1, 1, 1, 1,
-0.5671577, 0.2692947, -2.520361, 1, 1, 1, 1, 1,
-0.5617576, 0.489873, -1.956048, 1, 1, 1, 1, 1,
-0.5558054, 1.308522, 1.565807, 0, 0, 1, 1, 1,
-0.5554165, -2.330457, -4.464808, 1, 0, 0, 1, 1,
-0.5546948, -0.3081021, -1.594394, 1, 0, 0, 1, 1,
-0.5524662, -0.1355749, -2.669812, 1, 0, 0, 1, 1,
-0.5503982, -0.3722982, -1.230199, 1, 0, 0, 1, 1,
-0.5497051, -1.353317, -2.453946, 1, 0, 0, 1, 1,
-0.5488887, -0.2618894, -2.815957, 0, 0, 0, 1, 1,
-0.5448036, -0.198338, -1.898757, 0, 0, 0, 1, 1,
-0.54237, 1.020295, -0.9393962, 0, 0, 0, 1, 1,
-0.5412319, -0.3103981, -1.927576, 0, 0, 0, 1, 1,
-0.5389041, -0.6943433, -3.117923, 0, 0, 0, 1, 1,
-0.5380078, -0.7915399, -1.522072, 0, 0, 0, 1, 1,
-0.5330179, -0.6492354, -1.375108, 0, 0, 0, 1, 1,
-0.5312091, -1.415163, -4.135114, 1, 1, 1, 1, 1,
-0.5309379, -0.496121, -2.728821, 1, 1, 1, 1, 1,
-0.5250134, 0.3916993, -1.66766, 1, 1, 1, 1, 1,
-0.5189985, 0.2120817, -0.2647166, 1, 1, 1, 1, 1,
-0.5141046, -2.03067, -2.221045, 1, 1, 1, 1, 1,
-0.513867, 0.9516303, -0.05090386, 1, 1, 1, 1, 1,
-0.506497, 1.87018, -1.183075, 1, 1, 1, 1, 1,
-0.5039184, -2.005159, -3.675914, 1, 1, 1, 1, 1,
-0.503879, 0.3542441, -2.034532, 1, 1, 1, 1, 1,
-0.5027682, -1.083495, -4.743052, 1, 1, 1, 1, 1,
-0.4932325, -0.9354184, -1.970944, 1, 1, 1, 1, 1,
-0.489394, 0.4820398, -2.507164, 1, 1, 1, 1, 1,
-0.4884824, -0.1029615, -1.91698, 1, 1, 1, 1, 1,
-0.4859402, 1.230312, -0.1217575, 1, 1, 1, 1, 1,
-0.4819881, -0.1913061, -2.004687, 1, 1, 1, 1, 1,
-0.4763047, 0.4005111, -2.298963, 0, 0, 1, 1, 1,
-0.4753281, -1.465122, -3.480797, 1, 0, 0, 1, 1,
-0.4708321, 0.5612045, -1.28678, 1, 0, 0, 1, 1,
-0.4691348, 1.226587, 1.428762, 1, 0, 0, 1, 1,
-0.4685478, -0.4759235, -2.202888, 1, 0, 0, 1, 1,
-0.467662, -0.1839154, -2.5866, 1, 0, 0, 1, 1,
-0.4652769, -1.959907, -2.183832, 0, 0, 0, 1, 1,
-0.4645042, -0.7703345, -2.894882, 0, 0, 0, 1, 1,
-0.46043, 0.2724282, -1.511558, 0, 0, 0, 1, 1,
-0.4542147, 1.27799, -0.7710977, 0, 0, 0, 1, 1,
-0.4510954, -1.726458, -2.080047, 0, 0, 0, 1, 1,
-0.4491486, 0.8633513, -1.606992, 0, 0, 0, 1, 1,
-0.4480731, -1.42187, -2.281353, 0, 0, 0, 1, 1,
-0.4444723, 0.1434483, -1.8077, 1, 1, 1, 1, 1,
-0.4443868, -1.564218, -2.417162, 1, 1, 1, 1, 1,
-0.4426935, -2.042165, -2.989829, 1, 1, 1, 1, 1,
-0.4402232, -0.2972276, -2.598138, 1, 1, 1, 1, 1,
-0.4383622, 0.2537678, -1.929288, 1, 1, 1, 1, 1,
-0.4375581, 0.3178183, -1.19032, 1, 1, 1, 1, 1,
-0.4373438, -0.002561548, -0.5021377, 1, 1, 1, 1, 1,
-0.4335956, -1.31015, -2.729547, 1, 1, 1, 1, 1,
-0.4333274, 1.514322, 0.5989733, 1, 1, 1, 1, 1,
-0.4273801, 0.1747591, -0.3944925, 1, 1, 1, 1, 1,
-0.4257507, -0.4336015, -2.757273, 1, 1, 1, 1, 1,
-0.4224693, 0.09863362, -0.3481471, 1, 1, 1, 1, 1,
-0.4204492, 0.3902343, -3.183335, 1, 1, 1, 1, 1,
-0.4171275, 2.266358, -1.054155, 1, 1, 1, 1, 1,
-0.416319, 1.465652, -0.1232899, 1, 1, 1, 1, 1,
-0.4157858, -0.8103194, -1.278759, 0, 0, 1, 1, 1,
-0.414564, 1.874481, -0.843206, 1, 0, 0, 1, 1,
-0.4096533, 0.8476305, -1.101792, 1, 0, 0, 1, 1,
-0.4094646, -0.1020116, -1.963126, 1, 0, 0, 1, 1,
-0.4074578, 0.5555626, -0.9741254, 1, 0, 0, 1, 1,
-0.4019682, 2.342198, -0.43371, 1, 0, 0, 1, 1,
-0.3928111, 0.5356535, -0.8611858, 0, 0, 0, 1, 1,
-0.3913896, -0.3528461, -2.159146, 0, 0, 0, 1, 1,
-0.3884114, -0.7409613, -2.816954, 0, 0, 0, 1, 1,
-0.3881088, -0.4481847, -2.359877, 0, 0, 0, 1, 1,
-0.3802817, -0.5706372, -3.127944, 0, 0, 0, 1, 1,
-0.3757367, -1.453876, -1.704217, 0, 0, 0, 1, 1,
-0.3756604, 0.2081912, -2.291399, 0, 0, 0, 1, 1,
-0.375294, -0.1025236, -1.548711, 1, 1, 1, 1, 1,
-0.3750248, 0.8268712, -0.8720897, 1, 1, 1, 1, 1,
-0.3715037, -0.3383397, -2.64251, 1, 1, 1, 1, 1,
-0.3703911, -0.8242974, -2.961007, 1, 1, 1, 1, 1,
-0.3658778, -0.5677037, -3.229691, 1, 1, 1, 1, 1,
-0.3624848, 0.6822818, -0.913223, 1, 1, 1, 1, 1,
-0.3598038, -0.6202989, -2.821669, 1, 1, 1, 1, 1,
-0.3570186, 0.3032182, -1.236214, 1, 1, 1, 1, 1,
-0.3567047, 0.1799301, -0.6068437, 1, 1, 1, 1, 1,
-0.3565499, -0.1913343, -0.9038123, 1, 1, 1, 1, 1,
-0.3560683, 1.02946, 0.6631049, 1, 1, 1, 1, 1,
-0.3553625, 0.3079288, -2.396019, 1, 1, 1, 1, 1,
-0.3540098, 0.5627071, -1.075548, 1, 1, 1, 1, 1,
-0.3512975, 1.090925, 0.1101627, 1, 1, 1, 1, 1,
-0.3473203, 0.3510179, -1.454837, 1, 1, 1, 1, 1,
-0.3427506, -0.1247949, -1.714053, 0, 0, 1, 1, 1,
-0.3413983, 0.4230951, 0.6884413, 1, 0, 0, 1, 1,
-0.3406155, 1.353796, 0.7906982, 1, 0, 0, 1, 1,
-0.3229624, -0.0004019509, -0.237263, 1, 0, 0, 1, 1,
-0.3154543, 1.651018, -1.591981, 1, 0, 0, 1, 1,
-0.3143275, -0.5045702, -1.660507, 1, 0, 0, 1, 1,
-0.3139375, -0.2215153, -2.873321, 0, 0, 0, 1, 1,
-0.3112324, -0.2022818, -1.538579, 0, 0, 0, 1, 1,
-0.3049917, 0.02874859, -1.303717, 0, 0, 0, 1, 1,
-0.3044197, -2.369416, -3.839995, 0, 0, 0, 1, 1,
-0.3025768, 0.5290563, 0.326825, 0, 0, 0, 1, 1,
-0.3012576, -0.6721601, -3.684421, 0, 0, 0, 1, 1,
-0.2940095, 0.41022, 0.4909007, 0, 0, 0, 1, 1,
-0.2908956, 0.2922806, -0.2798681, 1, 1, 1, 1, 1,
-0.2893707, -2.976737, -3.195767, 1, 1, 1, 1, 1,
-0.289278, -0.0935168, -1.555864, 1, 1, 1, 1, 1,
-0.2859504, 0.8500899, 0.7307485, 1, 1, 1, 1, 1,
-0.2822793, 1.064593, 0.05681638, 1, 1, 1, 1, 1,
-0.2808667, -0.2693264, -0.9946418, 1, 1, 1, 1, 1,
-0.2787282, -0.05928599, -1.325769, 1, 1, 1, 1, 1,
-0.2730217, 0.5737802, 0.1768501, 1, 1, 1, 1, 1,
-0.2725554, -1.189776, -4.028299, 1, 1, 1, 1, 1,
-0.2699745, 1.121053, -0.2617173, 1, 1, 1, 1, 1,
-0.2679172, 1.263286, 0.772842, 1, 1, 1, 1, 1,
-0.2583676, 0.46584, -0.412576, 1, 1, 1, 1, 1,
-0.2582912, 0.8567719, 0.4702113, 1, 1, 1, 1, 1,
-0.2577365, -0.9440164, -3.151116, 1, 1, 1, 1, 1,
-0.2573654, -0.04817352, -1.048723, 1, 1, 1, 1, 1,
-0.2520956, 0.01088728, -0.656549, 0, 0, 1, 1, 1,
-0.2510404, -1.314427, -2.733092, 1, 0, 0, 1, 1,
-0.2485858, -0.8176941, -3.620613, 1, 0, 0, 1, 1,
-0.2463973, -1.386144, -2.51891, 1, 0, 0, 1, 1,
-0.2453731, 0.2733275, -1.649286, 1, 0, 0, 1, 1,
-0.2440473, -1.261032, -2.086567, 1, 0, 0, 1, 1,
-0.2310664, 0.5517769, -1.874551, 0, 0, 0, 1, 1,
-0.2300726, 1.46174, -0.5825261, 0, 0, 0, 1, 1,
-0.2285666, 0.3601079, -1.72963, 0, 0, 0, 1, 1,
-0.2275143, 0.3219067, -2.056293, 0, 0, 0, 1, 1,
-0.2259387, 0.5544193, -0.8434956, 0, 0, 0, 1, 1,
-0.2230361, -0.4411085, -3.105745, 0, 0, 0, 1, 1,
-0.2193374, -0.1225138, -2.873446, 0, 0, 0, 1, 1,
-0.216633, -0.02957771, 0.5908781, 1, 1, 1, 1, 1,
-0.2162253, -1.445128, -1.026812, 1, 1, 1, 1, 1,
-0.2130958, 0.501102, -0.2879421, 1, 1, 1, 1, 1,
-0.2129119, -0.4500578, -3.358915, 1, 1, 1, 1, 1,
-0.2120818, -0.8851526, -1.132481, 1, 1, 1, 1, 1,
-0.2069493, -0.2276283, -2.960916, 1, 1, 1, 1, 1,
-0.2047944, 1.255719, -0.9474226, 1, 1, 1, 1, 1,
-0.197756, -0.2953275, -3.512499, 1, 1, 1, 1, 1,
-0.1924606, 1.041578, 0.6395687, 1, 1, 1, 1, 1,
-0.1910284, 1.142838, -0.9441593, 1, 1, 1, 1, 1,
-0.1904781, -0.1883825, -2.286731, 1, 1, 1, 1, 1,
-0.1888856, -0.2389364, -2.284997, 1, 1, 1, 1, 1,
-0.1874592, -1.198406, -4.232465, 1, 1, 1, 1, 1,
-0.1810485, -1.104815, -4.403174, 1, 1, 1, 1, 1,
-0.1765316, -0.7921426, -2.341911, 1, 1, 1, 1, 1,
-0.1763047, 0.3001936, 0.9918078, 0, 0, 1, 1, 1,
-0.1754877, -0.1751674, -1.471869, 1, 0, 0, 1, 1,
-0.1688629, -0.1550924, -1.571881, 1, 0, 0, 1, 1,
-0.1656951, -0.352474, -2.992597, 1, 0, 0, 1, 1,
-0.1587833, -1.151065, -2.987838, 1, 0, 0, 1, 1,
-0.1578189, -0.01848875, -4.399709, 1, 0, 0, 1, 1,
-0.1550211, 0.3774302, -2.119511, 0, 0, 0, 1, 1,
-0.153483, 0.240968, -0.1872018, 0, 0, 0, 1, 1,
-0.1506617, -0.9305062, -3.265257, 0, 0, 0, 1, 1,
-0.148664, 2.091947, -0.8399305, 0, 0, 0, 1, 1,
-0.1420625, 0.6492439, -0.9203157, 0, 0, 0, 1, 1,
-0.1391802, 0.6939859, -0.1611496, 0, 0, 0, 1, 1,
-0.1376663, -0.7426573, -3.742181, 0, 0, 0, 1, 1,
-0.1375473, -0.882165, -1.74167, 1, 1, 1, 1, 1,
-0.1326743, -0.02324375, -0.7338127, 1, 1, 1, 1, 1,
-0.131831, 0.8008379, -0.1663513, 1, 1, 1, 1, 1,
-0.1273679, 1.342141, -1.640686, 1, 1, 1, 1, 1,
-0.1259642, 0.6472658, -1.305435, 1, 1, 1, 1, 1,
-0.1250641, 0.7610074, -1.066219, 1, 1, 1, 1, 1,
-0.1218705, 0.9030839, -0.7219082, 1, 1, 1, 1, 1,
-0.1203645, 0.00250706, -3.142001, 1, 1, 1, 1, 1,
-0.1187808, -0.4999823, -4.486397, 1, 1, 1, 1, 1,
-0.1131317, -0.2083194, -0.4328038, 1, 1, 1, 1, 1,
-0.1115417, -0.221105, 0.2292168, 1, 1, 1, 1, 1,
-0.1097821, -0.8551791, -4.964312, 1, 1, 1, 1, 1,
-0.1085568, -0.4917197, -2.020423, 1, 1, 1, 1, 1,
-0.1032625, 0.6801549, -0.0693498, 1, 1, 1, 1, 1,
-0.09778678, -0.5595834, -3.011044, 1, 1, 1, 1, 1,
-0.09027062, -0.4585524, -3.458999, 0, 0, 1, 1, 1,
-0.08917592, 0.2686961, -0.979946, 1, 0, 0, 1, 1,
-0.08770827, 1.317979, 0.6213487, 1, 0, 0, 1, 1,
-0.08575933, -0.7376164, -2.683272, 1, 0, 0, 1, 1,
-0.08452594, 0.407593, -0.6918506, 1, 0, 0, 1, 1,
-0.08323797, -0.1558128, -1.685444, 1, 0, 0, 1, 1,
-0.08177948, -0.006327365, -0.446879, 0, 0, 0, 1, 1,
-0.07354102, 0.1487335, 0.3255447, 0, 0, 0, 1, 1,
-0.07071517, 0.6261578, -0.4339079, 0, 0, 0, 1, 1,
-0.06699543, 0.3556153, -2.192705, 0, 0, 0, 1, 1,
-0.0622303, -2.007444, -3.589406, 0, 0, 0, 1, 1,
-0.05838929, -0.4738831, -4.473697, 0, 0, 0, 1, 1,
-0.05721155, -1.972855, -2.801662, 0, 0, 0, 1, 1,
-0.05069283, 0.006619301, 0.006625793, 1, 1, 1, 1, 1,
-0.04992293, -0.4409291, -2.327138, 1, 1, 1, 1, 1,
-0.04849307, 1.32555, -1.315971, 1, 1, 1, 1, 1,
-0.0461877, -0.3436517, -3.357231, 1, 1, 1, 1, 1,
-0.04483096, -1.229307, -2.787698, 1, 1, 1, 1, 1,
-0.04056155, -0.1867224, -1.582513, 1, 1, 1, 1, 1,
-0.03879032, 0.674165, -0.3539976, 1, 1, 1, 1, 1,
-0.03372769, -0.6112111, -5.172309, 1, 1, 1, 1, 1,
-0.03013228, 0.9595247, 0.1660381, 1, 1, 1, 1, 1,
-0.02876006, -0.8165802, -4.134527, 1, 1, 1, 1, 1,
-0.02533706, -1.334903, -2.401406, 1, 1, 1, 1, 1,
-0.02031182, -2.286648, -3.525025, 1, 1, 1, 1, 1,
-0.01319254, -0.1791773, -1.635021, 1, 1, 1, 1, 1,
-0.01211578, -0.5183688, -1.479788, 1, 1, 1, 1, 1,
-0.01087764, -0.7796517, -4.896448, 1, 1, 1, 1, 1,
-0.01086549, 1.495992, -0.8842989, 0, 0, 1, 1, 1,
-0.002343697, -0.7218342, -1.623182, 1, 0, 0, 1, 1,
-0.0007937766, -0.3923557, -3.952657, 1, 0, 0, 1, 1,
0.0009647518, 2.884902, -0.4762526, 1, 0, 0, 1, 1,
0.005589372, 0.1036973, 0.8443397, 1, 0, 0, 1, 1,
0.01059245, -0.08584809, 3.432163, 1, 0, 0, 1, 1,
0.0112628, -0.2454716, 1.807984, 0, 0, 0, 1, 1,
0.01429846, -0.9482678, 0.7396189, 0, 0, 0, 1, 1,
0.01437446, 0.6831024, 0.05354559, 0, 0, 0, 1, 1,
0.02010506, -1.446196, 4.435144, 0, 0, 0, 1, 1,
0.0210993, -0.2021838, 5.085991, 0, 0, 0, 1, 1,
0.02155145, -0.5015619, 2.795508, 0, 0, 0, 1, 1,
0.02156934, 0.5167591, -0.2838151, 0, 0, 0, 1, 1,
0.02285585, 0.7551358, -0.7427245, 1, 1, 1, 1, 1,
0.02409012, -0.5056549, 4.060286, 1, 1, 1, 1, 1,
0.02449309, -0.7506569, 3.025177, 1, 1, 1, 1, 1,
0.02639099, 0.1947145, -0.1659611, 1, 1, 1, 1, 1,
0.02740605, -0.5594435, 3.953265, 1, 1, 1, 1, 1,
0.02974341, 0.2928693, -0.105393, 1, 1, 1, 1, 1,
0.03534299, -1.491562, 2.802696, 1, 1, 1, 1, 1,
0.03924193, 0.5858404, -0.1171219, 1, 1, 1, 1, 1,
0.04794181, -0.2134048, 2.055464, 1, 1, 1, 1, 1,
0.04832437, -1.568911, 3.591325, 1, 1, 1, 1, 1,
0.05329455, 1.302834, 0.7974789, 1, 1, 1, 1, 1,
0.05726388, 0.5937664, -0.73561, 1, 1, 1, 1, 1,
0.05770491, -2.18731, 3.19608, 1, 1, 1, 1, 1,
0.06159576, -0.8595012, 1.762883, 1, 1, 1, 1, 1,
0.06773278, 0.1262576, -0.2019991, 1, 1, 1, 1, 1,
0.06817473, -1.559828, 2.189895, 0, 0, 1, 1, 1,
0.07051512, 1.263922, -0.7415168, 1, 0, 0, 1, 1,
0.08411895, 1.02199, 1.199902, 1, 0, 0, 1, 1,
0.08756217, -1.012432, 2.994568, 1, 0, 0, 1, 1,
0.08822066, 1.371105, 1.570139, 1, 0, 0, 1, 1,
0.08919782, -0.004407413, 1.135766, 1, 0, 0, 1, 1,
0.08926893, 0.1058176, 0.3729671, 0, 0, 0, 1, 1,
0.09050848, -0.8486753, 2.753704, 0, 0, 0, 1, 1,
0.09133974, -0.06589331, 2.618826, 0, 0, 0, 1, 1,
0.09150875, 0.1374499, -0.84987, 0, 0, 0, 1, 1,
0.0921447, -0.3993552, 0.5726486, 0, 0, 0, 1, 1,
0.09371427, -1.368981, 2.361077, 0, 0, 0, 1, 1,
0.09797192, -0.1120645, 1.872058, 0, 0, 0, 1, 1,
0.09819068, -0.2537441, 3.973576, 1, 1, 1, 1, 1,
0.09975749, 0.007531652, 1.760699, 1, 1, 1, 1, 1,
0.1013768, 0.2942858, -1.853787, 1, 1, 1, 1, 1,
0.1056033, 0.1877664, -1.197329, 1, 1, 1, 1, 1,
0.1105291, -0.04686771, 2.175669, 1, 1, 1, 1, 1,
0.1138077, -1.170295, 3.269487, 1, 1, 1, 1, 1,
0.1146631, 0.04058551, 0.7483845, 1, 1, 1, 1, 1,
0.1153697, 0.4903204, -0.2326433, 1, 1, 1, 1, 1,
0.1217527, -0.4179753, 2.463343, 1, 1, 1, 1, 1,
0.1232826, 0.1531914, 1.358321, 1, 1, 1, 1, 1,
0.1265527, 0.4912469, 1.467815, 1, 1, 1, 1, 1,
0.1325264, -0.3897443, 2.845793, 1, 1, 1, 1, 1,
0.1333237, -0.2283887, 1.875203, 1, 1, 1, 1, 1,
0.1385582, 1.103282, 0.7206433, 1, 1, 1, 1, 1,
0.1392472, 0.7407992, -0.6656813, 1, 1, 1, 1, 1,
0.1447653, 0.3876546, 0.1840513, 0, 0, 1, 1, 1,
0.1453635, 0.8245727, 0.9692298, 1, 0, 0, 1, 1,
0.1489834, 1.07929, -1.175628, 1, 0, 0, 1, 1,
0.1504102, -0.2021787, 4.045277, 1, 0, 0, 1, 1,
0.1505096, -0.6803707, 2.664266, 1, 0, 0, 1, 1,
0.1513479, -0.7926011, 2.652911, 1, 0, 0, 1, 1,
0.151724, -0.7525551, 0.4916494, 0, 0, 0, 1, 1,
0.1615296, -1.408042, 3.690448, 0, 0, 0, 1, 1,
0.1638658, -0.1661557, 2.403899, 0, 0, 0, 1, 1,
0.1642561, 1.027493, 0.5244495, 0, 0, 0, 1, 1,
0.1691349, 0.4790584, 0.6909395, 0, 0, 0, 1, 1,
0.1695763, -0.5543048, 2.372872, 0, 0, 0, 1, 1,
0.1724185, 0.4255868, 1.334374, 0, 0, 0, 1, 1,
0.1786588, 1.030223, 2.52994, 1, 1, 1, 1, 1,
0.1878408, 1.600208, 0.7561556, 1, 1, 1, 1, 1,
0.1886992, -1.025071, 4.341753, 1, 1, 1, 1, 1,
0.1905293, 0.1844084, 0.2801565, 1, 1, 1, 1, 1,
0.1917461, -2.367791, 3.978164, 1, 1, 1, 1, 1,
0.1953749, -1.426061, 3.303842, 1, 1, 1, 1, 1,
0.1993908, 0.6709303, 2.615409, 1, 1, 1, 1, 1,
0.2006774, 1.507304, 0.457031, 1, 1, 1, 1, 1,
0.2037015, -5.470996e-05, 1.912289, 1, 1, 1, 1, 1,
0.2060583, 0.6347901, -0.4438199, 1, 1, 1, 1, 1,
0.2093541, -1.424124, 2.639233, 1, 1, 1, 1, 1,
0.2109298, 2.341016, 1.17777, 1, 1, 1, 1, 1,
0.2115305, -1.480891, 3.209676, 1, 1, 1, 1, 1,
0.2121269, 0.9957114, 1.897405, 1, 1, 1, 1, 1,
0.2131891, -0.1058333, 1.412462, 1, 1, 1, 1, 1,
0.2167672, 1.031934, 0.1989668, 0, 0, 1, 1, 1,
0.2188642, -0.4557465, 2.105543, 1, 0, 0, 1, 1,
0.2208261, -0.2111413, 3.25116, 1, 0, 0, 1, 1,
0.2211303, -0.3260666, 1.549833, 1, 0, 0, 1, 1,
0.2218889, 0.1202965, 1.55793, 1, 0, 0, 1, 1,
0.2227729, -1.166222, 4.260695, 1, 0, 0, 1, 1,
0.2273268, -0.6350065, 2.657346, 0, 0, 0, 1, 1,
0.2281913, 2.22633, 0.3430488, 0, 0, 0, 1, 1,
0.2322423, 0.9847279, 0.16778, 0, 0, 0, 1, 1,
0.2329013, 0.4561566, 1.335124, 0, 0, 0, 1, 1,
0.2348596, -0.2442988, 2.26826, 0, 0, 0, 1, 1,
0.2350314, 1.486615, 0.02906019, 0, 0, 0, 1, 1,
0.2359086, 0.7391428, 1.294013, 0, 0, 0, 1, 1,
0.2384163, 1.806543, -0.1006752, 1, 1, 1, 1, 1,
0.2411238, -0.06120921, 2.859948, 1, 1, 1, 1, 1,
0.2424549, 0.7245598, -0.6791596, 1, 1, 1, 1, 1,
0.2451911, -0.5939294, 3.528734, 1, 1, 1, 1, 1,
0.2460999, 0.7176874, 0.5552601, 1, 1, 1, 1, 1,
0.2474805, -0.4975105, 2.98786, 1, 1, 1, 1, 1,
0.2502092, 0.3412328, 1.640368, 1, 1, 1, 1, 1,
0.2529385, -0.9647714, 2.983853, 1, 1, 1, 1, 1,
0.2532002, 0.1808712, 3.592042, 1, 1, 1, 1, 1,
0.2537467, 0.09151877, 2.333278, 1, 1, 1, 1, 1,
0.2538654, -0.692957, 2.323729, 1, 1, 1, 1, 1,
0.2554188, -0.5827454, 2.177234, 1, 1, 1, 1, 1,
0.2559687, 0.4028304, 0.5826253, 1, 1, 1, 1, 1,
0.26984, 1.849439, 0.5974948, 1, 1, 1, 1, 1,
0.2706059, 0.04657295, -0.3263943, 1, 1, 1, 1, 1,
0.2796539, -1.554105, 2.756814, 0, 0, 1, 1, 1,
0.281376, -0.4855291, 2.207711, 1, 0, 0, 1, 1,
0.2850538, 1.735245, 0.4138727, 1, 0, 0, 1, 1,
0.2884109, 1.806756, 1.510651, 1, 0, 0, 1, 1,
0.2892092, 1.684719, 0.190925, 1, 0, 0, 1, 1,
0.2927715, 0.4568445, -0.5164829, 1, 0, 0, 1, 1,
0.293298, -0.180289, 2.19563, 0, 0, 0, 1, 1,
0.2946311, -0.5193786, 3.254609, 0, 0, 0, 1, 1,
0.2949517, -0.2942964, 3.748206, 0, 0, 0, 1, 1,
0.2950608, -0.2593487, 1.132096, 0, 0, 0, 1, 1,
0.296743, 1.072261, 0.289842, 0, 0, 0, 1, 1,
0.2985398, 1.780825, 1.680077, 0, 0, 0, 1, 1,
0.2988357, 0.006562332, 1.086324, 0, 0, 0, 1, 1,
0.3016775, -0.2434711, 0.8225029, 1, 1, 1, 1, 1,
0.3045001, -0.268114, 2.805999, 1, 1, 1, 1, 1,
0.3054782, 0.3087274, 0.802814, 1, 1, 1, 1, 1,
0.3080309, 0.2184972, 0.5821411, 1, 1, 1, 1, 1,
0.308178, -0.6734788, 1.364894, 1, 1, 1, 1, 1,
0.3127004, -0.6666803, 4.021484, 1, 1, 1, 1, 1,
0.3129303, -0.467033, 2.63265, 1, 1, 1, 1, 1,
0.3213303, -0.7132944, 3.382697, 1, 1, 1, 1, 1,
0.3226956, 0.4499364, 0.879907, 1, 1, 1, 1, 1,
0.3230115, 1.051919, -1.210242, 1, 1, 1, 1, 1,
0.3293488, -0.5742248, 2.128374, 1, 1, 1, 1, 1,
0.3294889, -0.1939245, 1.572699, 1, 1, 1, 1, 1,
0.3300358, 0.443282, 1.98563, 1, 1, 1, 1, 1,
0.3304493, -1.157044, 3.176133, 1, 1, 1, 1, 1,
0.3331203, 0.9585389, -0.2803238, 1, 1, 1, 1, 1,
0.3335339, 2.310043, -0.1243699, 0, 0, 1, 1, 1,
0.3353628, 0.08612734, 0.644908, 1, 0, 0, 1, 1,
0.3418545, -0.02896998, 2.616034, 1, 0, 0, 1, 1,
0.3425791, -0.6082354, 3.519169, 1, 0, 0, 1, 1,
0.3433322, 0.3050714, 0.5837473, 1, 0, 0, 1, 1,
0.3441757, -0.2394158, 1.625803, 1, 0, 0, 1, 1,
0.3470208, -0.3058114, 1.67331, 0, 0, 0, 1, 1,
0.3537728, -1.105065, 2.860389, 0, 0, 0, 1, 1,
0.3548158, -0.4208712, 1.448176, 0, 0, 0, 1, 1,
0.3555016, 0.8176064, 1.2879, 0, 0, 0, 1, 1,
0.3572469, -1.263506, 3.071089, 0, 0, 0, 1, 1,
0.3581312, 1.817889, 0.6371036, 0, 0, 0, 1, 1,
0.3592319, 0.2391323, 1.349641, 0, 0, 0, 1, 1,
0.3608971, -0.8679527, 3.198733, 1, 1, 1, 1, 1,
0.3636467, 0.9591503, 0.1856206, 1, 1, 1, 1, 1,
0.3704703, 1.238824, 0.5908361, 1, 1, 1, 1, 1,
0.3760159, -0.7954085, 2.558123, 1, 1, 1, 1, 1,
0.3785909, 1.021856, 0.6401072, 1, 1, 1, 1, 1,
0.3790796, 1.819895, 0.2010702, 1, 1, 1, 1, 1,
0.3797054, 2.02947, -0.3563136, 1, 1, 1, 1, 1,
0.3838565, -0.5799768, 2.545823, 1, 1, 1, 1, 1,
0.3913926, -0.6142325, 1.93788, 1, 1, 1, 1, 1,
0.3928883, -1.59861, 2.570884, 1, 1, 1, 1, 1,
0.3938647, -0.06896984, 1.453182, 1, 1, 1, 1, 1,
0.3939431, 0.7614024, 0.4820097, 1, 1, 1, 1, 1,
0.3945356, 1.227586, 1.281962, 1, 1, 1, 1, 1,
0.3951149, 1.000329, 0.7810703, 1, 1, 1, 1, 1,
0.3978332, 0.810196, 0.09009372, 1, 1, 1, 1, 1,
0.3983721, -0.9550391, 2.722939, 0, 0, 1, 1, 1,
0.3984174, -0.1006878, 4.243653, 1, 0, 0, 1, 1,
0.3988128, -0.981846, 3.810244, 1, 0, 0, 1, 1,
0.3994734, -0.009860181, 2.023752, 1, 0, 0, 1, 1,
0.4031875, -0.4479041, 1.967006, 1, 0, 0, 1, 1,
0.4048253, 0.9970002, -0.4336707, 1, 0, 0, 1, 1,
0.4092496, -0.708535, 3.259345, 0, 0, 0, 1, 1,
0.4107317, -1.623665, 2.3372, 0, 0, 0, 1, 1,
0.4115373, 0.1859185, -0.1311957, 0, 0, 0, 1, 1,
0.4120603, 0.2290445, 1.178865, 0, 0, 0, 1, 1,
0.4145114, -0.6068245, 3.736404, 0, 0, 0, 1, 1,
0.4160944, -0.8947447, 3.31019, 0, 0, 0, 1, 1,
0.4242868, -1.150818, 1.8795, 0, 0, 0, 1, 1,
0.4341938, 1.579726, -1.421057, 1, 1, 1, 1, 1,
0.435538, -0.4068278, 2.827438, 1, 1, 1, 1, 1,
0.4421114, 0.7670563, 1.370529, 1, 1, 1, 1, 1,
0.4437693, -0.1984193, 3.454141, 1, 1, 1, 1, 1,
0.4445416, -0.997386, 1.653705, 1, 1, 1, 1, 1,
0.4462385, -0.1625016, 1.775862, 1, 1, 1, 1, 1,
0.4477815, 0.4608851, 1.239207, 1, 1, 1, 1, 1,
0.4524469, -0.2975039, 0.4994649, 1, 1, 1, 1, 1,
0.4587528, 0.2055408, 2.59588, 1, 1, 1, 1, 1,
0.4633272, 0.5883677, 0.9340947, 1, 1, 1, 1, 1,
0.4638329, -0.2514115, 2.832196, 1, 1, 1, 1, 1,
0.4725095, 1.048687, 0.3218597, 1, 1, 1, 1, 1,
0.473972, 2.065732, -0.6434457, 1, 1, 1, 1, 1,
0.4757412, -0.1467541, 2.051273, 1, 1, 1, 1, 1,
0.4785594, -0.3570287, 2.884592, 1, 1, 1, 1, 1,
0.479527, -1.161176, 2.364398, 0, 0, 1, 1, 1,
0.4862359, -0.01706121, 1.42598, 1, 0, 0, 1, 1,
0.4871158, 1.011783, -1.12333, 1, 0, 0, 1, 1,
0.4889568, 0.1712481, -0.7666711, 1, 0, 0, 1, 1,
0.491221, 1.350087, -0.6338679, 1, 0, 0, 1, 1,
0.4965718, 0.0919372, 0.8902336, 1, 0, 0, 1, 1,
0.4999936, -0.2825108, 3.598308, 0, 0, 0, 1, 1,
0.5071523, 1.24259, 0.3203185, 0, 0, 0, 1, 1,
0.5073998, -0.6239578, 1.627687, 0, 0, 0, 1, 1,
0.5098804, 0.6227797, 0.8056653, 0, 0, 0, 1, 1,
0.5100793, 2.046, 1.893172, 0, 0, 0, 1, 1,
0.5114548, -0.236867, 3.906394, 0, 0, 0, 1, 1,
0.5125133, 0.959678, 0.6901315, 0, 0, 0, 1, 1,
0.513011, 1.046277, 0.8784648, 1, 1, 1, 1, 1,
0.5182003, 0.5802817, 0.975516, 1, 1, 1, 1, 1,
0.5189092, 0.6303197, 0.820406, 1, 1, 1, 1, 1,
0.5193797, -0.2058603, 0.6278602, 1, 1, 1, 1, 1,
0.5244551, -0.5110322, 3.590069, 1, 1, 1, 1, 1,
0.5268517, -1.630654, 2.392069, 1, 1, 1, 1, 1,
0.5357539, 1.226539, 1.00432, 1, 1, 1, 1, 1,
0.542124, -0.4520043, 1.849331, 1, 1, 1, 1, 1,
0.5426008, 0.2078744, 0.517679, 1, 1, 1, 1, 1,
0.5469043, -0.8802745, 2.880285, 1, 1, 1, 1, 1,
0.5469123, 0.2869015, 2.859014, 1, 1, 1, 1, 1,
0.5487723, 1.366949, 1.184979, 1, 1, 1, 1, 1,
0.5488476, -0.9818823, 1.251983, 1, 1, 1, 1, 1,
0.5508169, -0.9764666, 3.707227, 1, 1, 1, 1, 1,
0.5520297, -0.2222819, 1.977576, 1, 1, 1, 1, 1,
0.56129, -1.045773, 3.312231, 0, 0, 1, 1, 1,
0.5652295, -0.7241579, 1.894596, 1, 0, 0, 1, 1,
0.5656126, 0.2476119, 0.8528085, 1, 0, 0, 1, 1,
0.5677601, -0.909816, 1.890489, 1, 0, 0, 1, 1,
0.5697476, 0.6558004, 1.265574, 1, 0, 0, 1, 1,
0.5723148, 0.3936702, 0.9119077, 1, 0, 0, 1, 1,
0.5748352, -0.3779063, 0.8811893, 0, 0, 0, 1, 1,
0.5772134, -0.460026, 1.991379, 0, 0, 0, 1, 1,
0.5776716, 1.089504, 0.2744567, 0, 0, 0, 1, 1,
0.5809362, 1.694189, -1.441055, 0, 0, 0, 1, 1,
0.5815138, -0.07725558, 0.3733055, 0, 0, 0, 1, 1,
0.5818682, -0.771149, 4.27563, 0, 0, 0, 1, 1,
0.5831181, 0.8564143, 1.949584, 0, 0, 0, 1, 1,
0.5838689, -0.3359329, 2.751001, 1, 1, 1, 1, 1,
0.5922388, 1.313446, -1.192046, 1, 1, 1, 1, 1,
0.5923274, 1.050337, 1.434421, 1, 1, 1, 1, 1,
0.5960482, -0.4096771, 2.849349, 1, 1, 1, 1, 1,
0.6022478, -1.305848, 1.63327, 1, 1, 1, 1, 1,
0.6025727, 0.5610534, 0.7610179, 1, 1, 1, 1, 1,
0.6030743, 1.351796, -0.9427481, 1, 1, 1, 1, 1,
0.6066405, -0.9273884, 2.606824, 1, 1, 1, 1, 1,
0.610496, -1.369036, 3.831539, 1, 1, 1, 1, 1,
0.6114351, 0.03153417, 2.22665, 1, 1, 1, 1, 1,
0.6127937, 0.5239592, 0.7672675, 1, 1, 1, 1, 1,
0.6152527, 0.1947972, 0.6283298, 1, 1, 1, 1, 1,
0.6174556, 0.9785612, 1.945774, 1, 1, 1, 1, 1,
0.618885, -0.5394026, 3.069176, 1, 1, 1, 1, 1,
0.6243888, -1.030689, 2.264189, 1, 1, 1, 1, 1,
0.6295542, 0.9399616, 1.611133, 0, 0, 1, 1, 1,
0.6315553, -0.8999985, 2.252627, 1, 0, 0, 1, 1,
0.6317658, 0.4882639, 0.2164289, 1, 0, 0, 1, 1,
0.6477802, -0.5067056, 2.816483, 1, 0, 0, 1, 1,
0.6612521, 0.1613779, 1.838086, 1, 0, 0, 1, 1,
0.6613737, -0.8147025, 3.488488, 1, 0, 0, 1, 1,
0.6701093, 0.490869, 1.190674, 0, 0, 0, 1, 1,
0.6718819, -1.111344, 2.599079, 0, 0, 0, 1, 1,
0.6724803, 0.3175906, 1.970589, 0, 0, 0, 1, 1,
0.6765187, -0.3201942, 1.321203, 0, 0, 0, 1, 1,
0.680347, -0.9458041, 1.970402, 0, 0, 0, 1, 1,
0.6828351, -0.7522136, 1.204374, 0, 0, 0, 1, 1,
0.6868997, -0.4115311, 2.339279, 0, 0, 0, 1, 1,
0.6887281, -1.470148, 2.913801, 1, 1, 1, 1, 1,
0.6896925, -1.567792, 2.111429, 1, 1, 1, 1, 1,
0.6939897, -1.169923, 0.9307772, 1, 1, 1, 1, 1,
0.694339, 0.07853557, 1.640361, 1, 1, 1, 1, 1,
0.6946517, -0.9068474, 1.600016, 1, 1, 1, 1, 1,
0.6955709, -0.7155312, 3.00859, 1, 1, 1, 1, 1,
0.699433, 1.346657, -0.4305964, 1, 1, 1, 1, 1,
0.7121502, -0.0827913, 2.070265, 1, 1, 1, 1, 1,
0.7181963, -0.2469766, 3.459689, 1, 1, 1, 1, 1,
0.7248532, 0.01418507, 2.910346, 1, 1, 1, 1, 1,
0.7260054, -1.088388, 2.781291, 1, 1, 1, 1, 1,
0.7289755, -0.7486144, 4.565773, 1, 1, 1, 1, 1,
0.7299961, 0.8310512, 0.5927023, 1, 1, 1, 1, 1,
0.7302504, -1.224104, 2.078103, 1, 1, 1, 1, 1,
0.7309564, 0.5630288, -0.5429881, 1, 1, 1, 1, 1,
0.7372501, -0.04946748, 1.891225, 0, 0, 1, 1, 1,
0.7374733, -0.1592034, 2.535978, 1, 0, 0, 1, 1,
0.7460341, 0.07250601, -1.23049, 1, 0, 0, 1, 1,
0.7467874, 0.3769268, 2.016695, 1, 0, 0, 1, 1,
0.7486237, -0.1291066, 0.9114772, 1, 0, 0, 1, 1,
0.7501228, -0.01010728, 2.698429, 1, 0, 0, 1, 1,
0.7512496, -0.1993401, 0.5667368, 0, 0, 0, 1, 1,
0.7571792, 0.4392782, 2.851341, 0, 0, 0, 1, 1,
0.7651763, 0.9188975, 0.5207594, 0, 0, 0, 1, 1,
0.7657935, -0.06132224, 4.078712, 0, 0, 0, 1, 1,
0.7662391, 0.7103203, 0.3345917, 0, 0, 0, 1, 1,
0.7699654, 0.6366546, 1.465671, 0, 0, 0, 1, 1,
0.7722795, 1.210033, 1.071815, 0, 0, 0, 1, 1,
0.7770116, 1.033856, 0.1464284, 1, 1, 1, 1, 1,
0.7814996, 0.6926693, -0.9544536, 1, 1, 1, 1, 1,
0.782929, -0.09683889, 0.5681751, 1, 1, 1, 1, 1,
0.784885, 1.31934, 1.186082, 1, 1, 1, 1, 1,
0.7897698, -0.8165578, 3.091712, 1, 1, 1, 1, 1,
0.789822, -1.538864, 1.881146, 1, 1, 1, 1, 1,
0.7940571, 0.8664952, 1.939931, 1, 1, 1, 1, 1,
0.7943024, -0.1975816, 2.002326, 1, 1, 1, 1, 1,
0.7944888, -1.626387, 1.123826, 1, 1, 1, 1, 1,
0.8025768, 1.413787, 0.007747571, 1, 1, 1, 1, 1,
0.8034386, -2.08382, 2.466662, 1, 1, 1, 1, 1,
0.808208, -0.7595913, 3.176328, 1, 1, 1, 1, 1,
0.8124386, -0.8846402, 2.686323, 1, 1, 1, 1, 1,
0.8254819, -1.481957, 2.715088, 1, 1, 1, 1, 1,
0.8430505, 0.6923249, 2.042859, 1, 1, 1, 1, 1,
0.8522785, -0.2621018, 2.674341, 0, 0, 1, 1, 1,
0.8551022, 0.3868889, 1.652995, 1, 0, 0, 1, 1,
0.8588319, -1.053545, 3.841528, 1, 0, 0, 1, 1,
0.862308, -2.423008, 3.432287, 1, 0, 0, 1, 1,
0.8679643, 0.4154547, 2.538699, 1, 0, 0, 1, 1,
0.8691019, 1.186808, 0.7206716, 1, 0, 0, 1, 1,
0.8740621, 0.2552584, 2.328596, 0, 0, 0, 1, 1,
0.8803808, -0.427698, 0.4031128, 0, 0, 0, 1, 1,
0.8832955, 1.222288, 0.5033031, 0, 0, 0, 1, 1,
0.8853969, 0.2262281, -0.6099791, 0, 0, 0, 1, 1,
0.8869541, -0.7949784, 2.119549, 0, 0, 0, 1, 1,
0.8927847, -0.8682731, 0.9020604, 0, 0, 0, 1, 1,
0.8940386, -0.5327924, 2.863135, 0, 0, 0, 1, 1,
0.8970627, -1.872162, 3.879911, 1, 1, 1, 1, 1,
0.8970932, 0.1204641, 2.905326, 1, 1, 1, 1, 1,
0.9085764, -1.211295, 1.788768, 1, 1, 1, 1, 1,
0.9138723, -1.153133, 2.20333, 1, 1, 1, 1, 1,
0.9188694, -2.366675, 3.127321, 1, 1, 1, 1, 1,
0.9203757, -1.558083, 3.818812, 1, 1, 1, 1, 1,
0.9215415, 0.7403702, 0.5501081, 1, 1, 1, 1, 1,
0.924742, -1.278668, 3.17817, 1, 1, 1, 1, 1,
0.9288794, -0.2532915, 1.205892, 1, 1, 1, 1, 1,
0.9295913, 0.1148425, 1.299566, 1, 1, 1, 1, 1,
0.9306087, 0.6837591, 1.395296, 1, 1, 1, 1, 1,
0.9324687, 1.406766, -0.1934597, 1, 1, 1, 1, 1,
0.9377493, -0.3176573, 2.649296, 1, 1, 1, 1, 1,
0.9398343, 0.2436054, -0.2088094, 1, 1, 1, 1, 1,
0.9562882, 1.080799, 0.325491, 1, 1, 1, 1, 1,
0.9579846, 0.1836616, 1.581759, 0, 0, 1, 1, 1,
0.9592253, 0.393674, 0.3793431, 1, 0, 0, 1, 1,
0.9636924, -0.1070788, 0.1789138, 1, 0, 0, 1, 1,
0.9695393, -0.8122573, 2.073097, 1, 0, 0, 1, 1,
0.9701967, -0.4993047, 1.046357, 1, 0, 0, 1, 1,
0.9743621, -1.846, 2.402199, 1, 0, 0, 1, 1,
0.9870353, 0.2579887, 1.389973, 0, 0, 0, 1, 1,
0.9875822, -0.2557906, 0.980228, 0, 0, 0, 1, 1,
0.9932474, 0.7191995, 0.7827528, 0, 0, 0, 1, 1,
0.9997809, 0.1895603, 0.4200066, 0, 0, 0, 1, 1,
1.003567, -0.2953408, 3.743731, 0, 0, 0, 1, 1,
1.004761, -0.5508715, 3.179866, 0, 0, 0, 1, 1,
1.014303, 1.188358, -0.22755, 0, 0, 0, 1, 1,
1.014723, -0.1175271, 1.066978, 1, 1, 1, 1, 1,
1.01935, 0.1312314, 0.5340559, 1, 1, 1, 1, 1,
1.023233, 1.826146, 0.5323207, 1, 1, 1, 1, 1,
1.023479, -0.6317526, 2.168446, 1, 1, 1, 1, 1,
1.024205, -0.1921858, 2.333077, 1, 1, 1, 1, 1,
1.029976, -0.08223316, 0.7807075, 1, 1, 1, 1, 1,
1.051422, -0.7547429, 1.436586, 1, 1, 1, 1, 1,
1.051494, -1.074135, 4.759766, 1, 1, 1, 1, 1,
1.054004, 0.330381, 1.532651, 1, 1, 1, 1, 1,
1.060744, -0.08834241, 2.884709, 1, 1, 1, 1, 1,
1.061786, 0.708233, 0.622527, 1, 1, 1, 1, 1,
1.062549, -0.4007985, 0.8932701, 1, 1, 1, 1, 1,
1.063585, -1.853209, 1.722827, 1, 1, 1, 1, 1,
1.067392, 0.9530591, 0.8104953, 1, 1, 1, 1, 1,
1.067433, 1.03588, -0.4574749, 1, 1, 1, 1, 1,
1.080212, 0.1359791, -0.4287097, 0, 0, 1, 1, 1,
1.089122, 0.4818276, 0.6641337, 1, 0, 0, 1, 1,
1.090829, -1.248471, 1.590107, 1, 0, 0, 1, 1,
1.091838, -0.5875409, 3.693429, 1, 0, 0, 1, 1,
1.095659, 1.499977, 0.9225752, 1, 0, 0, 1, 1,
1.096025, -1.168851, 2.712334, 1, 0, 0, 1, 1,
1.098541, 0.2148176, 0.799108, 0, 0, 0, 1, 1,
1.099044, -0.5861463, 1.422662, 0, 0, 0, 1, 1,
1.105707, 1.062335, 2.089248, 0, 0, 0, 1, 1,
1.108652, 1.030761, 1.38331, 0, 0, 0, 1, 1,
1.109138, 0.3772361, -1.201593, 0, 0, 0, 1, 1,
1.111599, -1.636511, 3.52331, 0, 0, 0, 1, 1,
1.120232, -0.5044109, -0.1330235, 0, 0, 0, 1, 1,
1.126404, 0.8612209, 0.2207009, 1, 1, 1, 1, 1,
1.126662, -2.882107, 3.902449, 1, 1, 1, 1, 1,
1.132904, -0.4482954, 2.513732, 1, 1, 1, 1, 1,
1.144059, 0.8621997, 0.599913, 1, 1, 1, 1, 1,
1.147178, -0.4565096, 0.5054291, 1, 1, 1, 1, 1,
1.147626, 1.364823, 1.596521, 1, 1, 1, 1, 1,
1.150555, 0.04210691, 1.558108, 1, 1, 1, 1, 1,
1.166843, 2.210822, 1.978443, 1, 1, 1, 1, 1,
1.168713, 1.018425, -0.3602448, 1, 1, 1, 1, 1,
1.18033, -0.1470712, 0.9173079, 1, 1, 1, 1, 1,
1.194291, -1.043459, 2.575289, 1, 1, 1, 1, 1,
1.206398, -0.8131709, 3.53519, 1, 1, 1, 1, 1,
1.210488, -0.9341859, 1.899567, 1, 1, 1, 1, 1,
1.211792, 0.3632142, 2.017761, 1, 1, 1, 1, 1,
1.220953, 1.33941, 2.197627, 1, 1, 1, 1, 1,
1.227293, -1.12092, 0.2047715, 0, 0, 1, 1, 1,
1.237468, 1.264719, 0.5193963, 1, 0, 0, 1, 1,
1.2448, -2.608832, 2.850577, 1, 0, 0, 1, 1,
1.252303, -0.9269409, 2.293227, 1, 0, 0, 1, 1,
1.257056, 0.7782305, 1.801166, 1, 0, 0, 1, 1,
1.261332, -0.1912401, 1.621689, 1, 0, 0, 1, 1,
1.267615, -0.3526931, 2.565581, 0, 0, 0, 1, 1,
1.270006, -0.2328812, 0.8801849, 0, 0, 0, 1, 1,
1.280122, -0.7464351, 2.015888, 0, 0, 0, 1, 1,
1.290718, -0.01656136, 2.507277, 0, 0, 0, 1, 1,
1.297725, -0.1880067, 1.32194, 0, 0, 0, 1, 1,
1.301821, -2.054299, 1.746091, 0, 0, 0, 1, 1,
1.314432, -0.5541259, 2.86512, 0, 0, 0, 1, 1,
1.32067, -1.883569, 2.920083, 1, 1, 1, 1, 1,
1.326741, 0.06782535, 0.8832327, 1, 1, 1, 1, 1,
1.352301, -0.3870775, 2.743157, 1, 1, 1, 1, 1,
1.360047, -0.3020103, 0.5557685, 1, 1, 1, 1, 1,
1.367203, 0.41626, -0.4670971, 1, 1, 1, 1, 1,
1.369593, -0.7462553, 2.48639, 1, 1, 1, 1, 1,
1.387681, 0.2215848, 2.157217, 1, 1, 1, 1, 1,
1.392482, -1.154021, 2.944891, 1, 1, 1, 1, 1,
1.393856, 0.177204, 0.7169529, 1, 1, 1, 1, 1,
1.393898, 0.4386356, 0.9818478, 1, 1, 1, 1, 1,
1.396318, -0.1242929, 2.492935, 1, 1, 1, 1, 1,
1.398451, -1.007329, 2.053433, 1, 1, 1, 1, 1,
1.413351, 0.2867962, 0.6836578, 1, 1, 1, 1, 1,
1.441002, 0.5503966, 2.436258, 1, 1, 1, 1, 1,
1.44777, 0.264249, -0.1716622, 1, 1, 1, 1, 1,
1.44811, -0.1322374, 1.478181, 0, 0, 1, 1, 1,
1.453982, 0.4634665, 2.542371, 1, 0, 0, 1, 1,
1.454247, -0.08421058, 1.060439, 1, 0, 0, 1, 1,
1.458196, 0.6973646, 0.3045979, 1, 0, 0, 1, 1,
1.46218, 0.1310682, 1.286968, 1, 0, 0, 1, 1,
1.483329, 0.209817, 1.224025, 1, 0, 0, 1, 1,
1.505504, 0.58641, 0.01913643, 0, 0, 0, 1, 1,
1.519798, 0.05833782, -0.3022481, 0, 0, 0, 1, 1,
1.520821, 0.9954006, 0.7574398, 0, 0, 0, 1, 1,
1.525504, -0.3430466, 2.200052, 0, 0, 0, 1, 1,
1.560336, 0.5721133, 2.051142, 0, 0, 0, 1, 1,
1.565158, 0.5114777, 2.518207, 0, 0, 0, 1, 1,
1.566207, -0.2991577, -0.007732477, 0, 0, 0, 1, 1,
1.577536, 0.5902585, 1.314778, 1, 1, 1, 1, 1,
1.579394, 0.7014903, 2.725863, 1, 1, 1, 1, 1,
1.590566, 2.272447, 0.4946933, 1, 1, 1, 1, 1,
1.590593, 0.05899014, 1.10464, 1, 1, 1, 1, 1,
1.590856, -0.4133254, 1.650908, 1, 1, 1, 1, 1,
1.591064, -0.01213769, 2.412883, 1, 1, 1, 1, 1,
1.599373, 1.352948, -1.460012, 1, 1, 1, 1, 1,
1.656081, 0.2584128, -0.7123853, 1, 1, 1, 1, 1,
1.662014, 1.369685, 2.303809, 1, 1, 1, 1, 1,
1.662114, -1.8973, 1.510751, 1, 1, 1, 1, 1,
1.667598, 1.695328, 0.932856, 1, 1, 1, 1, 1,
1.669233, 0.5689474, 1.569334, 1, 1, 1, 1, 1,
1.675775, -0.08018199, 1.776142, 1, 1, 1, 1, 1,
1.676027, 0.3293002, 1.828416, 1, 1, 1, 1, 1,
1.676585, -0.2330162, 2.83047, 1, 1, 1, 1, 1,
1.693548, -0.02532703, 1.477191, 0, 0, 1, 1, 1,
1.695742, 1.515072, 1.28882, 1, 0, 0, 1, 1,
1.716818, -0.3889918, 4.061643, 1, 0, 0, 1, 1,
1.723214, -0.2432691, 2.225053, 1, 0, 0, 1, 1,
1.726741, -0.9300435, 1.356255, 1, 0, 0, 1, 1,
1.731859, -0.2595054, 0.4597572, 1, 0, 0, 1, 1,
1.745796, -0.8821263, 0.7934578, 0, 0, 0, 1, 1,
1.780818, -0.08583342, 3.368458, 0, 0, 0, 1, 1,
1.783651, 0.4848384, 1.002763, 0, 0, 0, 1, 1,
1.803871, 0.1053581, 2.719638, 0, 0, 0, 1, 1,
1.824166, 0.5325335, 1.193117, 0, 0, 0, 1, 1,
1.827263, 0.6774501, 1.945981, 0, 0, 0, 1, 1,
1.829658, 0.3156044, 2.61363, 0, 0, 0, 1, 1,
1.834564, 0.7666041, 0.6073546, 1, 1, 1, 1, 1,
1.844463, -0.7406587, 0.4418974, 1, 1, 1, 1, 1,
1.883727, -1.501595, 2.196325, 1, 1, 1, 1, 1,
1.888934, -0.1181662, 1.277615, 1, 1, 1, 1, 1,
1.903618, -0.934244, 2.592314, 1, 1, 1, 1, 1,
1.928899, 0.6757714, 0.6952267, 1, 1, 1, 1, 1,
1.938851, -0.007768736, 2.250283, 1, 1, 1, 1, 1,
1.967423, 1.655788, 0.02999785, 1, 1, 1, 1, 1,
1.994919, 1.475401, 1.691598, 1, 1, 1, 1, 1,
2.000526, -0.406702, 1.429974, 1, 1, 1, 1, 1,
2.006309, -0.219654, 0.1626587, 1, 1, 1, 1, 1,
2.016406, -0.3604469, 2.012073, 1, 1, 1, 1, 1,
2.027226, 1.043893, 0.5804752, 1, 1, 1, 1, 1,
2.032695, -0.5216256, 1.718976, 1, 1, 1, 1, 1,
2.053768, -1.413661, 1.584455, 1, 1, 1, 1, 1,
2.068737, 0.5747701, 0.7749296, 0, 0, 1, 1, 1,
2.070251, 1.67697, 0.4634042, 1, 0, 0, 1, 1,
2.094407, -2.074464, 4.134133, 1, 0, 0, 1, 1,
2.103052, 0.1555513, 2.167325, 1, 0, 0, 1, 1,
2.114897, -0.7291742, 1.259192, 1, 0, 0, 1, 1,
2.11596, 0.6456225, -0.3863826, 1, 0, 0, 1, 1,
2.151388, 0.983965, 0.5583807, 0, 0, 0, 1, 1,
2.235376, 1.556519, 0.3960356, 0, 0, 0, 1, 1,
2.237494, 0.2143155, 0.6799523, 0, 0, 0, 1, 1,
2.23753, -1.862278, 1.218138, 0, 0, 0, 1, 1,
2.248878, -1.267777, 3.345594, 0, 0, 0, 1, 1,
2.287277, -0.4799893, 0.7208456, 0, 0, 0, 1, 1,
2.34255, 1.43561, 1.597083, 0, 0, 0, 1, 1,
2.385061, 1.759022, 1.287281, 1, 1, 1, 1, 1,
2.386606, 1.092452, 1.700721, 1, 1, 1, 1, 1,
2.447382, -0.6400518, 3.531696, 1, 1, 1, 1, 1,
2.589268, -0.4478388, 1.734982, 1, 1, 1, 1, 1,
2.636855, -1.053293, -1.078904, 1, 1, 1, 1, 1,
3.14036, -1.897048, 3.752774, 1, 1, 1, 1, 1,
4.442319, 0.06100085, 1.97866, 1, 1, 1, 1, 1
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
var radius = 9.788493;
var distance = 34.38167;
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
mvMatrix.translate( -0.5661516, -0.2472582, 0.04315925 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38167);
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
