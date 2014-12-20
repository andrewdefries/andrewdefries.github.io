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
-3.545916, 0.6194552, -2.527149, 1, 0, 0, 1,
-3.124402, -0.2515793, -1.365642, 1, 0.007843138, 0, 1,
-2.894804, 1.484406, 0.3702183, 1, 0.01176471, 0, 1,
-2.519264, -0.9114893, -2.258427, 1, 0.01960784, 0, 1,
-2.502581, 1.251939, 0.1341625, 1, 0.02352941, 0, 1,
-2.445215, 1.604989, -2.125115, 1, 0.03137255, 0, 1,
-2.396889, -0.6330459, -2.243066, 1, 0.03529412, 0, 1,
-2.342023, -1.633002, -3.862204, 1, 0.04313726, 0, 1,
-2.305708, 0.03612324, -0.1073071, 1, 0.04705882, 0, 1,
-2.295099, -0.0803955, -1.882513, 1, 0.05490196, 0, 1,
-2.281196, 1.896382, -0.8457727, 1, 0.05882353, 0, 1,
-2.27441, -0.3977925, -1.866201, 1, 0.06666667, 0, 1,
-2.267103, 0.604441, -2.144702, 1, 0.07058824, 0, 1,
-2.248587, -1.394259, -1.802364, 1, 0.07843138, 0, 1,
-2.243945, -0.1841774, -0.9399344, 1, 0.08235294, 0, 1,
-2.238881, 1.106294, -2.565098, 1, 0.09019608, 0, 1,
-2.205603, 1.162654, -2.139357, 1, 0.09411765, 0, 1,
-2.195034, -1.281214, -0.4059428, 1, 0.1019608, 0, 1,
-2.13339, -0.5509586, -3.299201, 1, 0.1098039, 0, 1,
-2.091837, -1.234508, -2.060789, 1, 0.1137255, 0, 1,
-2.061528, -1.759224, -2.01461, 1, 0.1215686, 0, 1,
-2.036384, -1.006959, -2.90429, 1, 0.1254902, 0, 1,
-1.991745, -0.4234432, -1.982308, 1, 0.1333333, 0, 1,
-1.975418, -0.6961775, -1.380957, 1, 0.1372549, 0, 1,
-1.963714, -1.497474, -1.32237, 1, 0.145098, 0, 1,
-1.96066, -1.401853, -2.16985, 1, 0.1490196, 0, 1,
-1.95542, 1.340473, -0.6991746, 1, 0.1568628, 0, 1,
-1.943314, 0.102061, -0.9727662, 1, 0.1607843, 0, 1,
-1.933352, 1.36983, -1.100301, 1, 0.1686275, 0, 1,
-1.913431, -0.5477425, -1.265134, 1, 0.172549, 0, 1,
-1.904036, -0.1127651, -2.396629, 1, 0.1803922, 0, 1,
-1.902533, -0.6405719, -2.551941, 1, 0.1843137, 0, 1,
-1.877967, -0.6649806, -2.547958, 1, 0.1921569, 0, 1,
-1.871792, -0.1646115, -1.111588, 1, 0.1960784, 0, 1,
-1.859384, -0.9554811, -1.893629, 1, 0.2039216, 0, 1,
-1.840698, -1.005342, -2.32751, 1, 0.2117647, 0, 1,
-1.819133, -0.3648676, -2.589086, 1, 0.2156863, 0, 1,
-1.817427, 0.03600231, -1.295854, 1, 0.2235294, 0, 1,
-1.779167, 0.7594556, -1.426685, 1, 0.227451, 0, 1,
-1.771529, -0.569813, -1.111117, 1, 0.2352941, 0, 1,
-1.747679, 0.2823577, -0.6473407, 1, 0.2392157, 0, 1,
-1.737577, -0.05943255, -0.8016655, 1, 0.2470588, 0, 1,
-1.725857, 0.7717416, -0.9346944, 1, 0.2509804, 0, 1,
-1.715149, 0.9800914, -0.6419429, 1, 0.2588235, 0, 1,
-1.702874, 1.097072, -0.7884557, 1, 0.2627451, 0, 1,
-1.687719, 0.3178163, -0.06631237, 1, 0.2705882, 0, 1,
-1.686536, -0.09031402, -1.755127, 1, 0.2745098, 0, 1,
-1.684734, 0.7027629, -1.791763, 1, 0.282353, 0, 1,
-1.677496, 0.1097447, 1.170943, 1, 0.2862745, 0, 1,
-1.658123, -0.3256654, -2.335599, 1, 0.2941177, 0, 1,
-1.656945, 0.6651251, -0.3121815, 1, 0.3019608, 0, 1,
-1.651997, -0.7554901, -1.520447, 1, 0.3058824, 0, 1,
-1.651434, -0.9962809, -3.703923, 1, 0.3137255, 0, 1,
-1.6353, -1.391889, -3.789794, 1, 0.3176471, 0, 1,
-1.632457, -1.165478, -1.310275, 1, 0.3254902, 0, 1,
-1.630542, 0.2504748, 0.3460992, 1, 0.3294118, 0, 1,
-1.622306, -0.7269836, -1.666845, 1, 0.3372549, 0, 1,
-1.619951, -1.531045, -2.549086, 1, 0.3411765, 0, 1,
-1.613473, 0.1710942, -1.41708, 1, 0.3490196, 0, 1,
-1.608283, -0.3483936, -2.031815, 1, 0.3529412, 0, 1,
-1.583005, -0.5242322, -3.051201, 1, 0.3607843, 0, 1,
-1.582302, -1.461505, -2.983213, 1, 0.3647059, 0, 1,
-1.572467, 1.616805, 0.09652384, 1, 0.372549, 0, 1,
-1.565547, 0.2987981, -2.32581, 1, 0.3764706, 0, 1,
-1.560277, 0.4504909, -0.7972836, 1, 0.3843137, 0, 1,
-1.544798, 1.071574, -1.040329, 1, 0.3882353, 0, 1,
-1.542889, 0.06628896, -1.076835, 1, 0.3960784, 0, 1,
-1.537057, 1.334638, 0.8189025, 1, 0.4039216, 0, 1,
-1.531782, -0.2031458, -0.9769815, 1, 0.4078431, 0, 1,
-1.509108, 0.1810297, -1.749079, 1, 0.4156863, 0, 1,
-1.506269, -0.554311, -1.428148, 1, 0.4196078, 0, 1,
-1.503852, -1.539953, -2.243664, 1, 0.427451, 0, 1,
-1.495982, -1.969455, -2.823928, 1, 0.4313726, 0, 1,
-1.493031, 1.384667, -1.354663, 1, 0.4392157, 0, 1,
-1.48653, 0.7080214, -0.7343164, 1, 0.4431373, 0, 1,
-1.482026, -1.309975, -1.89396, 1, 0.4509804, 0, 1,
-1.480755, 0.3725463, 1.280642, 1, 0.454902, 0, 1,
-1.477609, -0.2563856, -1.671081, 1, 0.4627451, 0, 1,
-1.474797, -1.09848, -2.63065, 1, 0.4666667, 0, 1,
-1.467263, -0.4765182, -2.097896, 1, 0.4745098, 0, 1,
-1.452586, 0.6342158, -0.7192075, 1, 0.4784314, 0, 1,
-1.452211, -1.516854, -2.360289, 1, 0.4862745, 0, 1,
-1.441038, -0.5764475, -1.329659, 1, 0.4901961, 0, 1,
-1.440294, -1.85473, -2.606728, 1, 0.4980392, 0, 1,
-1.434301, -0.1900939, -0.1153838, 1, 0.5058824, 0, 1,
-1.430219, -2.418914, -2.086771, 1, 0.509804, 0, 1,
-1.429178, 0.128104, -1.239555, 1, 0.5176471, 0, 1,
-1.42827, 0.7972789, 0.8879761, 1, 0.5215687, 0, 1,
-1.421826, -1.133038, -2.58419, 1, 0.5294118, 0, 1,
-1.406907, -1.304764, -2.643939, 1, 0.5333334, 0, 1,
-1.404515, 1.717186, -0.6204013, 1, 0.5411765, 0, 1,
-1.400331, 0.2900608, -1.945623, 1, 0.5450981, 0, 1,
-1.393667, 0.595938, -1.981719, 1, 0.5529412, 0, 1,
-1.378367, -0.8806618, -0.5383227, 1, 0.5568628, 0, 1,
-1.375364, -1.196962, -2.983905, 1, 0.5647059, 0, 1,
-1.375287, -0.4842539, -1.678969, 1, 0.5686275, 0, 1,
-1.373848, 2.127508, -0.2272523, 1, 0.5764706, 0, 1,
-1.367534, 1.160676, -1.083448, 1, 0.5803922, 0, 1,
-1.367323, 0.5165551, -1.156289, 1, 0.5882353, 0, 1,
-1.366237, -1.238554, -2.333927, 1, 0.5921569, 0, 1,
-1.358754, -0.4642444, -4.252167, 1, 0.6, 0, 1,
-1.349939, 1.462754, -0.9260808, 1, 0.6078432, 0, 1,
-1.347479, -1.188701, -2.989646, 1, 0.6117647, 0, 1,
-1.346852, -0.3271798, -2.737538, 1, 0.6196079, 0, 1,
-1.335974, -0.389246, -2.22506, 1, 0.6235294, 0, 1,
-1.33344, -1.05889, -1.57408, 1, 0.6313726, 0, 1,
-1.327577, -1.954688, -1.156643, 1, 0.6352941, 0, 1,
-1.325797, 0.1237908, -1.457825, 1, 0.6431373, 0, 1,
-1.324623, 0.6033891, -1.32759, 1, 0.6470588, 0, 1,
-1.313287, -0.01120904, -1.688009, 1, 0.654902, 0, 1,
-1.302146, 1.398287, -1.247952, 1, 0.6588235, 0, 1,
-1.300267, -1.513609, -3.071262, 1, 0.6666667, 0, 1,
-1.274987, -0.3294042, -1.651433, 1, 0.6705883, 0, 1,
-1.268526, 0.8170403, -1.58789, 1, 0.6784314, 0, 1,
-1.24926, -0.2149682, -1.885288, 1, 0.682353, 0, 1,
-1.234781, -0.5832348, -3.377766, 1, 0.6901961, 0, 1,
-1.234342, 2.083029, 0.4484302, 1, 0.6941177, 0, 1,
-1.23013, 0.6628693, -0.9968174, 1, 0.7019608, 0, 1,
-1.226343, 0.4044336, -1.481471, 1, 0.7098039, 0, 1,
-1.225691, -0.03153868, -2.066473, 1, 0.7137255, 0, 1,
-1.221389, 1.592684, -2.547472, 1, 0.7215686, 0, 1,
-1.206196, 0.8590179, -1.353181, 1, 0.7254902, 0, 1,
-1.199329, -0.4900631, -0.2835021, 1, 0.7333333, 0, 1,
-1.192309, -0.6418708, -2.259515, 1, 0.7372549, 0, 1,
-1.190599, -1.78014, -2.536143, 1, 0.7450981, 0, 1,
-1.188583, 0.5708045, -2.778145, 1, 0.7490196, 0, 1,
-1.181738, -2.063931, -3.084479, 1, 0.7568628, 0, 1,
-1.171682, -0.2592987, -3.087656, 1, 0.7607843, 0, 1,
-1.169655, -0.8720377, -1.03416, 1, 0.7686275, 0, 1,
-1.167762, -0.2306753, -1.029856, 1, 0.772549, 0, 1,
-1.162372, 2.65817, 0.003411959, 1, 0.7803922, 0, 1,
-1.130023, 1.43567, -2.999905, 1, 0.7843137, 0, 1,
-1.12443, 0.5438065, 0.2721851, 1, 0.7921569, 0, 1,
-1.122643, -0.9537142, -2.382517, 1, 0.7960784, 0, 1,
-1.107513, -0.2701632, -2.858304, 1, 0.8039216, 0, 1,
-1.103832, -0.3551575, -1.598773, 1, 0.8117647, 0, 1,
-1.101359, 0.3207136, 0.5525697, 1, 0.8156863, 0, 1,
-1.095713, 1.817461, 0.5372885, 1, 0.8235294, 0, 1,
-1.082473, -2.736528, -3.034528, 1, 0.827451, 0, 1,
-1.081174, -1.61523, -3.901869, 1, 0.8352941, 0, 1,
-1.074597, -0.212809, -1.29031, 1, 0.8392157, 0, 1,
-1.068741, -1.479369, -3.255443, 1, 0.8470588, 0, 1,
-1.063924, -0.009193905, -0.4467396, 1, 0.8509804, 0, 1,
-1.059987, -0.7359766, -2.107807, 1, 0.8588235, 0, 1,
-1.057689, -0.6528509, -1.581874, 1, 0.8627451, 0, 1,
-1.057662, -0.05486779, -1.029566, 1, 0.8705882, 0, 1,
-1.056127, 0.3882315, -0.967669, 1, 0.8745098, 0, 1,
-1.054909, 0.1795538, -1.164988, 1, 0.8823529, 0, 1,
-1.05441, -0.3605618, -3.16808, 1, 0.8862745, 0, 1,
-1.054296, 0.06882799, -1.864814, 1, 0.8941177, 0, 1,
-1.050506, -0.1348843, -0.2176879, 1, 0.8980392, 0, 1,
-1.042193, -0.06420949, -0.4280407, 1, 0.9058824, 0, 1,
-1.041062, 0.8773854, -0.8794803, 1, 0.9137255, 0, 1,
-1.040376, -0.4578557, -2.109519, 1, 0.9176471, 0, 1,
-1.039246, 0.384927, 0.631444, 1, 0.9254902, 0, 1,
-1.036957, -0.6334683, -2.293186, 1, 0.9294118, 0, 1,
-1.0277, 0.1272988, -3.638496, 1, 0.9372549, 0, 1,
-1.024388, 1.757116, -1.036111, 1, 0.9411765, 0, 1,
-1.023991, 0.5880886, -3.272704, 1, 0.9490196, 0, 1,
-1.022769, -0.04584113, -2.327944, 1, 0.9529412, 0, 1,
-1.022483, -0.1248486, -1.104711, 1, 0.9607843, 0, 1,
-1.020055, -1.48437, -0.681263, 1, 0.9647059, 0, 1,
-1.017473, -0.1950433, -3.35739, 1, 0.972549, 0, 1,
-1.015821, 0.6723198, -1.526165, 1, 0.9764706, 0, 1,
-1.004389, 0.8546572, -0.6704367, 1, 0.9843137, 0, 1,
-1.003608, -0.04040698, -2.226692, 1, 0.9882353, 0, 1,
-1.001764, -0.6040519, -3.337993, 1, 0.9960784, 0, 1,
-0.9952456, 1.470569, -1.0582, 0.9960784, 1, 0, 1,
-0.9860063, -0.009188687, -2.786253, 0.9921569, 1, 0, 1,
-0.9794474, 0.3082587, -0.1152589, 0.9843137, 1, 0, 1,
-0.9644469, -1.519009, -2.06165, 0.9803922, 1, 0, 1,
-0.9493659, 0.644962, -0.9455186, 0.972549, 1, 0, 1,
-0.9475121, 0.116195, -3.261233, 0.9686275, 1, 0, 1,
-0.9464824, -0.1934021, -1.374117, 0.9607843, 1, 0, 1,
-0.9463752, 0.02891578, -2.365513, 0.9568627, 1, 0, 1,
-0.941021, 0.7068066, -2.046216, 0.9490196, 1, 0, 1,
-0.9369661, 0.4503139, -1.155976, 0.945098, 1, 0, 1,
-0.9321298, -1.30058, -2.46372, 0.9372549, 1, 0, 1,
-0.9313411, 0.9280195, -0.8556018, 0.9333333, 1, 0, 1,
-0.9230148, 1.623702, 0.7033072, 0.9254902, 1, 0, 1,
-0.9205161, 2.316569, -0.05816331, 0.9215686, 1, 0, 1,
-0.9154779, 2.195261, 0.179384, 0.9137255, 1, 0, 1,
-0.9083622, 0.3987161, -1.812999, 0.9098039, 1, 0, 1,
-0.9025749, 0.6124869, -1.592555, 0.9019608, 1, 0, 1,
-0.8984916, -0.7197328, -0.3353194, 0.8941177, 1, 0, 1,
-0.8924291, -1.319137, -3.46612, 0.8901961, 1, 0, 1,
-0.8917841, -0.5842844, -2.003177, 0.8823529, 1, 0, 1,
-0.8867188, -0.9140766, -5.4526, 0.8784314, 1, 0, 1,
-0.8775132, 1.343074, -0.6338388, 0.8705882, 1, 0, 1,
-0.875575, -0.2597286, -2.532907, 0.8666667, 1, 0, 1,
-0.8755361, -0.2782879, -0.4363701, 0.8588235, 1, 0, 1,
-0.8753173, 0.6731907, -1.2627, 0.854902, 1, 0, 1,
-0.8647419, 1.063787, -1.005893, 0.8470588, 1, 0, 1,
-0.8609449, 1.615375, 1.856523, 0.8431373, 1, 0, 1,
-0.8606532, 0.5352172, -1.457138, 0.8352941, 1, 0, 1,
-0.8593782, -0.7936748, -2.149112, 0.8313726, 1, 0, 1,
-0.8593625, -1.654024, -3.056095, 0.8235294, 1, 0, 1,
-0.8574723, -1.281272, -1.939424, 0.8196079, 1, 0, 1,
-0.8548121, -1.928551, -5.831029, 0.8117647, 1, 0, 1,
-0.8502407, 0.7582037, -0.785708, 0.8078431, 1, 0, 1,
-0.8435605, -0.05653166, -1.23161, 0.8, 1, 0, 1,
-0.8422337, 0.8317001, -1.575523, 0.7921569, 1, 0, 1,
-0.8357432, -1.802583, -3.88922, 0.7882353, 1, 0, 1,
-0.8308339, -0.1119295, -1.698243, 0.7803922, 1, 0, 1,
-0.8246645, 0.737466, -2.073326, 0.7764706, 1, 0, 1,
-0.8244814, 1.943375, -0.4149078, 0.7686275, 1, 0, 1,
-0.8234329, 0.3855402, -1.471478, 0.7647059, 1, 0, 1,
-0.82277, 0.9581744, -0.920691, 0.7568628, 1, 0, 1,
-0.8214368, -1.44403, -1.965103, 0.7529412, 1, 0, 1,
-0.8179262, -0.1112616, -2.631501, 0.7450981, 1, 0, 1,
-0.8139356, -0.6763184, -3.023512, 0.7411765, 1, 0, 1,
-0.8113882, -0.7273495, -2.528086, 0.7333333, 1, 0, 1,
-0.8015324, 0.8019049, -1.720595, 0.7294118, 1, 0, 1,
-0.7997614, -1.469671, -5.061267, 0.7215686, 1, 0, 1,
-0.7943473, 2.141126, -0.8144963, 0.7176471, 1, 0, 1,
-0.7940402, -0.5051578, -2.902387, 0.7098039, 1, 0, 1,
-0.7894202, -1.932014, -2.611049, 0.7058824, 1, 0, 1,
-0.7850187, 0.9383287, 0.09671018, 0.6980392, 1, 0, 1,
-0.7825974, -1.016202, -1.664949, 0.6901961, 1, 0, 1,
-0.77436, -0.6561186, -2.403386, 0.6862745, 1, 0, 1,
-0.7732288, 1.05684, -0.576851, 0.6784314, 1, 0, 1,
-0.7714907, 0.9602449, -1.118332, 0.6745098, 1, 0, 1,
-0.7665172, -1.578378, -2.739282, 0.6666667, 1, 0, 1,
-0.7654613, 0.3112438, 0.2357574, 0.6627451, 1, 0, 1,
-0.7574955, 0.3182042, -1.0676, 0.654902, 1, 0, 1,
-0.7570243, -0.7520503, -2.299988, 0.6509804, 1, 0, 1,
-0.7518631, -0.2318216, -0.9999915, 0.6431373, 1, 0, 1,
-0.750961, 1.85706, 0.5158071, 0.6392157, 1, 0, 1,
-0.7480136, -0.02449451, -2.446068, 0.6313726, 1, 0, 1,
-0.7475502, 0.7645689, -1.866495, 0.627451, 1, 0, 1,
-0.7458856, 0.173541, -2.097159, 0.6196079, 1, 0, 1,
-0.743318, 0.1987989, -0.9243238, 0.6156863, 1, 0, 1,
-0.7422296, 0.5653289, -0.856996, 0.6078432, 1, 0, 1,
-0.7421125, -0.3353451, -2.690459, 0.6039216, 1, 0, 1,
-0.7373591, -0.1502546, 0.5703368, 0.5960785, 1, 0, 1,
-0.7281796, -0.4745204, -4.009919, 0.5882353, 1, 0, 1,
-0.7273431, 0.2504394, -1.897759, 0.5843138, 1, 0, 1,
-0.7253878, 1.921757, -1.928424, 0.5764706, 1, 0, 1,
-0.7226025, -0.07714523, 1.427461, 0.572549, 1, 0, 1,
-0.7221986, 0.9772004, -0.7850798, 0.5647059, 1, 0, 1,
-0.7205892, -0.03147209, -0.3159715, 0.5607843, 1, 0, 1,
-0.7193016, 0.5698788, -0.5918738, 0.5529412, 1, 0, 1,
-0.7154688, 0.523344, -1.361377, 0.5490196, 1, 0, 1,
-0.7061508, -1.988423, -2.817485, 0.5411765, 1, 0, 1,
-0.7044113, 1.507197, -1.275647, 0.5372549, 1, 0, 1,
-0.696985, 1.433623, -0.1286541, 0.5294118, 1, 0, 1,
-0.6919021, 0.2490067, -1.859268, 0.5254902, 1, 0, 1,
-0.6876923, 0.5313541, -1.546865, 0.5176471, 1, 0, 1,
-0.6826938, 1.262895, 0.1066043, 0.5137255, 1, 0, 1,
-0.6819004, 0.1956467, -1.770452, 0.5058824, 1, 0, 1,
-0.6775804, 0.1927306, -1.928638, 0.5019608, 1, 0, 1,
-0.6748168, -0.03776037, -2.081506, 0.4941176, 1, 0, 1,
-0.6694707, -0.3787683, -3.198066, 0.4862745, 1, 0, 1,
-0.6677346, 0.5088463, -0.8973965, 0.4823529, 1, 0, 1,
-0.6615775, 0.6690408, 0.1398318, 0.4745098, 1, 0, 1,
-0.660729, -0.2173385, -2.182849, 0.4705882, 1, 0, 1,
-0.6550078, -0.2380506, -0.3392881, 0.4627451, 1, 0, 1,
-0.6525187, -1.00702, -1.336437, 0.4588235, 1, 0, 1,
-0.6517892, 0.0948794, -0.1005726, 0.4509804, 1, 0, 1,
-0.6322164, -0.5431159, -2.501368, 0.4470588, 1, 0, 1,
-0.626404, 1.077895, -0.009267404, 0.4392157, 1, 0, 1,
-0.626004, 0.2136494, 1.943294, 0.4352941, 1, 0, 1,
-0.6255191, -0.9433051, -2.020963, 0.427451, 1, 0, 1,
-0.6188588, -1.013042, -1.678443, 0.4235294, 1, 0, 1,
-0.6186252, 2.792876, 1.130136, 0.4156863, 1, 0, 1,
-0.6127576, -1.345417, -3.833795, 0.4117647, 1, 0, 1,
-0.611379, -2.025591, -2.818304, 0.4039216, 1, 0, 1,
-0.6066014, 0.7756243, -0.901566, 0.3960784, 1, 0, 1,
-0.6060069, 0.7186772, -0.7284192, 0.3921569, 1, 0, 1,
-0.6053057, 0.1999589, -1.202101, 0.3843137, 1, 0, 1,
-0.6032571, 0.1317278, -0.350091, 0.3803922, 1, 0, 1,
-0.6006178, -0.5441105, -3.296052, 0.372549, 1, 0, 1,
-0.5928296, 1.011568, -0.9081807, 0.3686275, 1, 0, 1,
-0.5911543, 0.2091194, -0.8846471, 0.3607843, 1, 0, 1,
-0.5887238, -0.8973595, -3.386793, 0.3568628, 1, 0, 1,
-0.5832801, 0.8867155, -0.1806155, 0.3490196, 1, 0, 1,
-0.5742649, -0.24906, -1.287676, 0.345098, 1, 0, 1,
-0.5731314, -0.5683942, -2.573151, 0.3372549, 1, 0, 1,
-0.5718705, -2.051933, -2.825568, 0.3333333, 1, 0, 1,
-0.5703807, -2.118908, -4.702341, 0.3254902, 1, 0, 1,
-0.5699245, 0.178162, -0.2452261, 0.3215686, 1, 0, 1,
-0.5681686, -1.12856, -1.169803, 0.3137255, 1, 0, 1,
-0.5676297, 0.2492763, -1.999194, 0.3098039, 1, 0, 1,
-0.5673983, -1.379716, -2.418355, 0.3019608, 1, 0, 1,
-0.5659214, 0.7270285, -1.249737, 0.2941177, 1, 0, 1,
-0.5648214, -1.919088, -3.295962, 0.2901961, 1, 0, 1,
-0.5628949, 0.4951207, -0.8770878, 0.282353, 1, 0, 1,
-0.5621452, 1.457805, 0.4421815, 0.2784314, 1, 0, 1,
-0.559991, 1.258498, -1.626837, 0.2705882, 1, 0, 1,
-0.5558732, -0.6122658, -2.677262, 0.2666667, 1, 0, 1,
-0.5523739, -0.01528444, -2.221054, 0.2588235, 1, 0, 1,
-0.5504184, 1.549944, -0.9466338, 0.254902, 1, 0, 1,
-0.5486545, 1.050637, -1.062539, 0.2470588, 1, 0, 1,
-0.5450828, 1.720236, -1.249912, 0.2431373, 1, 0, 1,
-0.541308, 1.754064, 1.26184, 0.2352941, 1, 0, 1,
-0.5357036, -0.9742465, -3.598724, 0.2313726, 1, 0, 1,
-0.5324694, 0.2724586, -1.449908, 0.2235294, 1, 0, 1,
-0.5306944, 2.685261, -0.6786057, 0.2196078, 1, 0, 1,
-0.5304068, 1.253419, -1.662874, 0.2117647, 1, 0, 1,
-0.5270928, 0.03069285, -0.6362237, 0.2078431, 1, 0, 1,
-0.5203351, -0.1039826, -1.580713, 0.2, 1, 0, 1,
-0.512929, -1.633668, -4.272959, 0.1921569, 1, 0, 1,
-0.5111144, -0.09750266, -3.959178, 0.1882353, 1, 0, 1,
-0.51062, 0.1767457, -0.2985576, 0.1803922, 1, 0, 1,
-0.510522, 0.9699719, -0.820959, 0.1764706, 1, 0, 1,
-0.5097209, -0.8103732, -1.024053, 0.1686275, 1, 0, 1,
-0.5073274, -0.9590763, -3.996136, 0.1647059, 1, 0, 1,
-0.5052865, 0.2754255, -2.460597, 0.1568628, 1, 0, 1,
-0.5047675, -0.304679, -2.25971, 0.1529412, 1, 0, 1,
-0.5034073, 0.107067, -1.516509, 0.145098, 1, 0, 1,
-0.5008067, 0.6749105, -0.1060482, 0.1411765, 1, 0, 1,
-0.4917109, -0.838231, -3.258248, 0.1333333, 1, 0, 1,
-0.4893014, -2.594451, -3.107028, 0.1294118, 1, 0, 1,
-0.4787019, 0.1033205, -0.453743, 0.1215686, 1, 0, 1,
-0.4708613, -0.8186233, -2.069922, 0.1176471, 1, 0, 1,
-0.468133, 0.1675123, -1.660006, 0.1098039, 1, 0, 1,
-0.4618121, 0.2938798, -0.9798004, 0.1058824, 1, 0, 1,
-0.4615202, 0.7599327, -1.799405, 0.09803922, 1, 0, 1,
-0.4609949, -2.179603, -2.980281, 0.09019608, 1, 0, 1,
-0.4597167, -0.3896768, -3.127993, 0.08627451, 1, 0, 1,
-0.4577038, -1.466515, -1.817617, 0.07843138, 1, 0, 1,
-0.4567469, 0.5664106, 0.2485054, 0.07450981, 1, 0, 1,
-0.4546697, 1.757025, -1.127182, 0.06666667, 1, 0, 1,
-0.4434396, 1.023891, -1.045063, 0.0627451, 1, 0, 1,
-0.4421037, 0.1827223, 0.08419849, 0.05490196, 1, 0, 1,
-0.4382814, 0.05115443, -2.442017, 0.05098039, 1, 0, 1,
-0.4368369, 1.620631, 0.6251134, 0.04313726, 1, 0, 1,
-0.4350948, -1.473305, -1.405617, 0.03921569, 1, 0, 1,
-0.4334564, -1.191893, -4.11856, 0.03137255, 1, 0, 1,
-0.4333472, -1.38178, -1.824883, 0.02745098, 1, 0, 1,
-0.4302245, -0.6624928, -2.861142, 0.01960784, 1, 0, 1,
-0.4243925, -0.4441595, -4.080611, 0.01568628, 1, 0, 1,
-0.4241573, -0.3143265, -2.314172, 0.007843138, 1, 0, 1,
-0.4241401, -0.152405, -1.938741, 0.003921569, 1, 0, 1,
-0.4224879, 1.224618, 0.7074965, 0, 1, 0.003921569, 1,
-0.4200809, 0.6386403, -2.059778, 0, 1, 0.01176471, 1,
-0.4192692, 0.2561271, -1.497186, 0, 1, 0.01568628, 1,
-0.4174227, -1.144721, -3.616238, 0, 1, 0.02352941, 1,
-0.4150888, 0.3276027, 0.3126334, 0, 1, 0.02745098, 1,
-0.4110281, 0.137197, -1.780547, 0, 1, 0.03529412, 1,
-0.4107693, -0.6625431, -3.341398, 0, 1, 0.03921569, 1,
-0.410744, 1.48097, -2.420227, 0, 1, 0.04705882, 1,
-0.4082931, 0.1885919, -1.326973, 0, 1, 0.05098039, 1,
-0.4028226, 0.4493515, -1.483649, 0, 1, 0.05882353, 1,
-0.4001005, 2.119613, -0.07054117, 0, 1, 0.0627451, 1,
-0.3998368, -1.420293, -1.659836, 0, 1, 0.07058824, 1,
-0.397357, 0.5745224, -0.3968907, 0, 1, 0.07450981, 1,
-0.3957596, 1.04263, -0.6115862, 0, 1, 0.08235294, 1,
-0.3948641, -0.9507031, -3.696755, 0, 1, 0.08627451, 1,
-0.3929063, -0.9909503, -3.216281, 0, 1, 0.09411765, 1,
-0.3910148, 2.418386, -0.1978733, 0, 1, 0.1019608, 1,
-0.3887701, 0.03787875, -1.240821, 0, 1, 0.1058824, 1,
-0.3885391, 2.315081, -3.081739, 0, 1, 0.1137255, 1,
-0.3869357, -0.5092558, -3.440602, 0, 1, 0.1176471, 1,
-0.3826195, 0.5467349, -2.237154, 0, 1, 0.1254902, 1,
-0.3800085, -2.430301, -2.007899, 0, 1, 0.1294118, 1,
-0.3771386, -2.201221, -3.375505, 0, 1, 0.1372549, 1,
-0.3743195, -0.3688357, -1.82831, 0, 1, 0.1411765, 1,
-0.3732879, -0.04119483, -2.478228, 0, 1, 0.1490196, 1,
-0.3699889, 1.244613, 0.9165947, 0, 1, 0.1529412, 1,
-0.364793, -0.04054389, -0.1285262, 0, 1, 0.1607843, 1,
-0.361714, -0.8160518, -3.386681, 0, 1, 0.1647059, 1,
-0.3599331, 0.304077, -0.6895019, 0, 1, 0.172549, 1,
-0.3597513, 1.416649, -0.6184538, 0, 1, 0.1764706, 1,
-0.3597059, -0.261742, -1.496005, 0, 1, 0.1843137, 1,
-0.3550216, 0.7807738, -0.3764634, 0, 1, 0.1882353, 1,
-0.3520324, -2.071149, -2.372536, 0, 1, 0.1960784, 1,
-0.3506661, 1.215885, 0.1989715, 0, 1, 0.2039216, 1,
-0.3503094, -1.136907, -2.770895, 0, 1, 0.2078431, 1,
-0.3490835, 0.03105557, -2.789743, 0, 1, 0.2156863, 1,
-0.3346254, 1.955097, -0.826934, 0, 1, 0.2196078, 1,
-0.3334311, 0.05213617, -1.267667, 0, 1, 0.227451, 1,
-0.3315163, -0.1887995, -3.057504, 0, 1, 0.2313726, 1,
-0.3294726, 2.235367, 0.7843448, 0, 1, 0.2392157, 1,
-0.3283299, -0.1258098, -3.348348, 0, 1, 0.2431373, 1,
-0.3277878, -0.5115595, -1.633941, 0, 1, 0.2509804, 1,
-0.3249177, -0.2908365, -3.323904, 0, 1, 0.254902, 1,
-0.3234516, 1.861597, -1.333076, 0, 1, 0.2627451, 1,
-0.3231689, 1.349621, 1.321072, 0, 1, 0.2666667, 1,
-0.3230448, -0.1759582, -2.120622, 0, 1, 0.2745098, 1,
-0.321822, 0.5543265, 0.5483439, 0, 1, 0.2784314, 1,
-0.3105018, 0.7001405, -1.183252, 0, 1, 0.2862745, 1,
-0.3089993, -1.33757, -0.2790295, 0, 1, 0.2901961, 1,
-0.3088508, -0.3547233, -2.930382, 0, 1, 0.2980392, 1,
-0.3088206, 0.4702252, 0.3711561, 0, 1, 0.3058824, 1,
-0.3057696, 0.7962241, -0.1930675, 0, 1, 0.3098039, 1,
-0.3039418, 0.9291846, -0.6097237, 0, 1, 0.3176471, 1,
-0.3026695, 0.8566536, 0.2651422, 0, 1, 0.3215686, 1,
-0.2996415, -1.053335, -1.322011, 0, 1, 0.3294118, 1,
-0.2946529, 1.016065, 1.447789, 0, 1, 0.3333333, 1,
-0.2945749, 0.508371, 1.236398, 0, 1, 0.3411765, 1,
-0.293293, 1.037714, -0.7118429, 0, 1, 0.345098, 1,
-0.2914608, -0.7732103, -3.118761, 0, 1, 0.3529412, 1,
-0.2907979, 0.2413085, 0.8131642, 0, 1, 0.3568628, 1,
-0.2905593, -0.1203834, -1.558591, 0, 1, 0.3647059, 1,
-0.2847015, -0.2852397, -3.410743, 0, 1, 0.3686275, 1,
-0.281767, 0.3014291, -1.15739, 0, 1, 0.3764706, 1,
-0.2726569, 0.6260712, 0.2443393, 0, 1, 0.3803922, 1,
-0.2710914, 1.173106, -1.519516, 0, 1, 0.3882353, 1,
-0.2710434, -0.5036717, -2.504958, 0, 1, 0.3921569, 1,
-0.2695959, -0.6579294, -3.154865, 0, 1, 0.4, 1,
-0.2605367, 0.641471, 0.167918, 0, 1, 0.4078431, 1,
-0.253058, -0.2333516, -3.532634, 0, 1, 0.4117647, 1,
-0.2523066, -0.3915572, -0.6383229, 0, 1, 0.4196078, 1,
-0.2520252, -0.3775269, -3.700239, 0, 1, 0.4235294, 1,
-0.2502829, -1.003412, -2.278132, 0, 1, 0.4313726, 1,
-0.2433308, 0.08428039, -2.823865, 0, 1, 0.4352941, 1,
-0.2421861, -0.7651095, -2.933342, 0, 1, 0.4431373, 1,
-0.2387309, -0.5728458, -3.323091, 0, 1, 0.4470588, 1,
-0.2379342, 0.03198119, -0.8474908, 0, 1, 0.454902, 1,
-0.2361691, -1.486892, -4.206851, 0, 1, 0.4588235, 1,
-0.2338095, 1.38648, -1.134237, 0, 1, 0.4666667, 1,
-0.2289227, 0.8921294, -0.6821272, 0, 1, 0.4705882, 1,
-0.2266377, 1.091524, -0.1986562, 0, 1, 0.4784314, 1,
-0.2257446, 0.2721496, 0.6135607, 0, 1, 0.4823529, 1,
-0.2137908, -0.536294, -2.37334, 0, 1, 0.4901961, 1,
-0.2122476, -0.6742991, -3.6159, 0, 1, 0.4941176, 1,
-0.2108988, -0.6804253, -2.336313, 0, 1, 0.5019608, 1,
-0.2087483, -0.6938653, -1.772968, 0, 1, 0.509804, 1,
-0.2079093, 1.241128, -1.019572, 0, 1, 0.5137255, 1,
-0.2031415, -0.7652726, -2.480447, 0, 1, 0.5215687, 1,
-0.2021071, 0.1433169, -0.7222329, 0, 1, 0.5254902, 1,
-0.196257, 0.6951388, 0.03043452, 0, 1, 0.5333334, 1,
-0.1953691, 0.04664341, -0.7204979, 0, 1, 0.5372549, 1,
-0.1905167, -0.08020058, -1.134861, 0, 1, 0.5450981, 1,
-0.1888251, -0.746244, -2.135644, 0, 1, 0.5490196, 1,
-0.1851257, 0.611205, -1.595137, 0, 1, 0.5568628, 1,
-0.1815539, -0.5086775, -2.002734, 0, 1, 0.5607843, 1,
-0.1794147, -0.580929, -2.617385, 0, 1, 0.5686275, 1,
-0.1782652, -0.02997342, -1.895302, 0, 1, 0.572549, 1,
-0.1752655, -0.1818607, -3.997672, 0, 1, 0.5803922, 1,
-0.1742324, 0.02427659, -1.550306, 0, 1, 0.5843138, 1,
-0.1654395, 0.1653046, 1.12342, 0, 1, 0.5921569, 1,
-0.1609782, -1.473506, -3.764771, 0, 1, 0.5960785, 1,
-0.1601679, -0.5998628, -3.359073, 0, 1, 0.6039216, 1,
-0.160142, 2.162705, 0.7997773, 0, 1, 0.6117647, 1,
-0.1580547, -1.261543, -3.627649, 0, 1, 0.6156863, 1,
-0.1565259, -0.9240633, -2.600405, 0, 1, 0.6235294, 1,
-0.1554588, 0.1247835, 1.328826, 0, 1, 0.627451, 1,
-0.1553306, -0.6904929, -0.7288035, 0, 1, 0.6352941, 1,
-0.1553302, -0.4937757, -0.9715004, 0, 1, 0.6392157, 1,
-0.1495012, 0.06141592, -2.016313, 0, 1, 0.6470588, 1,
-0.1416281, 0.5643905, 0.3047099, 0, 1, 0.6509804, 1,
-0.1414028, 0.1407319, -0.08931157, 0, 1, 0.6588235, 1,
-0.1318441, 0.1987918, -0.180695, 0, 1, 0.6627451, 1,
-0.1309692, -0.2097786, -2.855716, 0, 1, 0.6705883, 1,
-0.1307508, -0.5287735, -4.101891, 0, 1, 0.6745098, 1,
-0.1285915, -0.6450705, -3.059906, 0, 1, 0.682353, 1,
-0.1282846, -0.02659178, -1.575821, 0, 1, 0.6862745, 1,
-0.1215479, -0.527106, -1.74427, 0, 1, 0.6941177, 1,
-0.1200018, 0.4441887, -0.5849794, 0, 1, 0.7019608, 1,
-0.1081832, -1.499119, -1.730084, 0, 1, 0.7058824, 1,
-0.1023879, -1.443087, -2.914215, 0, 1, 0.7137255, 1,
-0.09863509, -0.1994239, -3.968187, 0, 1, 0.7176471, 1,
-0.09778076, 0.237189, -1.697278, 0, 1, 0.7254902, 1,
-0.09735537, 1.270596, 1.616999, 0, 1, 0.7294118, 1,
-0.09421783, -0.508445, -1.108852, 0, 1, 0.7372549, 1,
-0.09386346, -0.7440368, -3.761069, 0, 1, 0.7411765, 1,
-0.08858777, -1.622548, -1.537887, 0, 1, 0.7490196, 1,
-0.08321871, -0.3299577, -3.24369, 0, 1, 0.7529412, 1,
-0.07753303, 0.2622223, 0.8098919, 0, 1, 0.7607843, 1,
-0.07707119, 1.572697, -0.721022, 0, 1, 0.7647059, 1,
-0.07519446, -0.4602406, -3.184017, 0, 1, 0.772549, 1,
-0.07260072, 0.3144431, 1.668813, 0, 1, 0.7764706, 1,
-0.07092569, 0.2709727, 1.752579, 0, 1, 0.7843137, 1,
-0.07028926, 0.08472082, 1.489807, 0, 1, 0.7882353, 1,
-0.06589351, -0.4552877, -3.570939, 0, 1, 0.7960784, 1,
-0.06012302, -0.9083335, -4.303216, 0, 1, 0.8039216, 1,
-0.0580507, -0.02862012, -1.592597, 0, 1, 0.8078431, 1,
-0.05713197, 0.7463517, 0.2191021, 0, 1, 0.8156863, 1,
-0.05686687, -2.192752, -1.927109, 0, 1, 0.8196079, 1,
-0.04349967, 1.806275, -1.840671, 0, 1, 0.827451, 1,
-0.04201183, 0.260436, -0.5102461, 0, 1, 0.8313726, 1,
-0.02990123, 0.1300831, -1.630273, 0, 1, 0.8392157, 1,
-0.02753649, -0.01407199, -3.031308, 0, 1, 0.8431373, 1,
-0.0266884, -1.481143, -3.092999, 0, 1, 0.8509804, 1,
-0.02469624, 0.8131898, 0.7338228, 0, 1, 0.854902, 1,
-0.02231635, -0.7688282, -3.045806, 0, 1, 0.8627451, 1,
-0.02153775, 0.2798064, 0.5366795, 0, 1, 0.8666667, 1,
-0.0163027, -0.02097485, -0.9117283, 0, 1, 0.8745098, 1,
-0.01490494, 0.1176183, -0.3258735, 0, 1, 0.8784314, 1,
-0.01413554, 0.5127866, 0.2389364, 0, 1, 0.8862745, 1,
-0.004514174, 0.5245098, 0.3427517, 0, 1, 0.8901961, 1,
0.000390144, -0.127344, 4.70602, 0, 1, 0.8980392, 1,
0.001424421, -0.5636842, 3.050533, 0, 1, 0.9058824, 1,
0.002659365, 0.6018176, 1.476963, 0, 1, 0.9098039, 1,
0.002736027, -0.7645716, 3.802988, 0, 1, 0.9176471, 1,
0.003648073, 0.8744769, -0.2938439, 0, 1, 0.9215686, 1,
0.005961307, 1.133854, -0.565449, 0, 1, 0.9294118, 1,
0.009121647, -0.3790095, 3.594626, 0, 1, 0.9333333, 1,
0.009445324, 0.26851, -0.5251017, 0, 1, 0.9411765, 1,
0.01277165, -0.05645906, 1.372972, 0, 1, 0.945098, 1,
0.01296911, 0.3339396, -1.141851, 0, 1, 0.9529412, 1,
0.01417764, -0.7858437, 2.126609, 0, 1, 0.9568627, 1,
0.01563353, 0.7237578, 0.6736928, 0, 1, 0.9647059, 1,
0.01682347, 0.8783813, -0.286787, 0, 1, 0.9686275, 1,
0.01988308, -0.1482688, 4.74917, 0, 1, 0.9764706, 1,
0.023531, -0.1427211, 2.371197, 0, 1, 0.9803922, 1,
0.02912991, 1.260076, 0.07862036, 0, 1, 0.9882353, 1,
0.0317533, 1.231868, 0.7515491, 0, 1, 0.9921569, 1,
0.03255056, -1.300827, 3.678832, 0, 1, 1, 1,
0.03290129, 1.482618, 0.3656718, 0, 0.9921569, 1, 1,
0.0360411, -0.7009106, 5.106295, 0, 0.9882353, 1, 1,
0.03629798, -0.4286881, 3.36086, 0, 0.9803922, 1, 1,
0.03671956, 0.1330576, -0.407818, 0, 0.9764706, 1, 1,
0.03745348, 1.6567, 1.059036, 0, 0.9686275, 1, 1,
0.03800999, 0.2934306, 0.002506415, 0, 0.9647059, 1, 1,
0.04228356, 0.1474644, 0.7745003, 0, 0.9568627, 1, 1,
0.04380234, -0.3443058, 2.65105, 0, 0.9529412, 1, 1,
0.04394133, -0.8731802, 1.841794, 0, 0.945098, 1, 1,
0.04436645, 1.09625, 0.01337437, 0, 0.9411765, 1, 1,
0.04762549, 0.3067067, -0.6119778, 0, 0.9333333, 1, 1,
0.05433436, -1.213802, 2.072608, 0, 0.9294118, 1, 1,
0.06376773, 0.0291882, 2.073572, 0, 0.9215686, 1, 1,
0.06585205, -1.352872, 5.796247, 0, 0.9176471, 1, 1,
0.06748216, 1.231554, 0.06134796, 0, 0.9098039, 1, 1,
0.07316198, -0.3420602, 4.554135, 0, 0.9058824, 1, 1,
0.07479569, 1.088347, 0.3975938, 0, 0.8980392, 1, 1,
0.07785531, 0.9109092, -0.09846719, 0, 0.8901961, 1, 1,
0.08190757, 3.338878, -0.8101049, 0, 0.8862745, 1, 1,
0.09025127, 1.007082, 0.5272764, 0, 0.8784314, 1, 1,
0.09055487, -1.506815, 3.573557, 0, 0.8745098, 1, 1,
0.09945517, 0.2656859, 0.147757, 0, 0.8666667, 1, 1,
0.09973177, 0.5533457, -0.9761854, 0, 0.8627451, 1, 1,
0.1017158, -0.4129689, 3.021247, 0, 0.854902, 1, 1,
0.1023206, 0.9694273, 0.9273356, 0, 0.8509804, 1, 1,
0.1059726, -0.5862782, 2.84559, 0, 0.8431373, 1, 1,
0.1095177, 0.1053896, 1.573763, 0, 0.8392157, 1, 1,
0.1127262, -1.664086, 1.977257, 0, 0.8313726, 1, 1,
0.118632, -0.2903071, 3.934121, 0, 0.827451, 1, 1,
0.1209972, -1.045221, 3.424351, 0, 0.8196079, 1, 1,
0.130368, -2.013297, 4.1772, 0, 0.8156863, 1, 1,
0.130659, 1.110072, 1.161216, 0, 0.8078431, 1, 1,
0.1349412, 0.8024011, 0.4518561, 0, 0.8039216, 1, 1,
0.1355131, -0.2522776, 2.612905, 0, 0.7960784, 1, 1,
0.1362739, -1.261204, 4.8928, 0, 0.7882353, 1, 1,
0.1384619, -0.3186848, 5.200597, 0, 0.7843137, 1, 1,
0.1416073, -0.3557225, 2.457006, 0, 0.7764706, 1, 1,
0.1420134, 1.025685, 1.337059, 0, 0.772549, 1, 1,
0.1447843, -0.6282229, 5.483336, 0, 0.7647059, 1, 1,
0.1481797, -0.585784, 3.687678, 0, 0.7607843, 1, 1,
0.1545175, -0.4512608, 2.213135, 0, 0.7529412, 1, 1,
0.1559768, -0.2082101, 2.981197, 0, 0.7490196, 1, 1,
0.157516, 0.3752075, 0.5471082, 0, 0.7411765, 1, 1,
0.1615091, 1.485788, -0.2154836, 0, 0.7372549, 1, 1,
0.1623352, 0.3448012, 0.5389638, 0, 0.7294118, 1, 1,
0.1647705, 0.4484736, 1.347647, 0, 0.7254902, 1, 1,
0.1672058, 0.5050654, -0.6930525, 0, 0.7176471, 1, 1,
0.1682116, -0.7863241, 1.952861, 0, 0.7137255, 1, 1,
0.1693463, 0.3761826, 1.239947, 0, 0.7058824, 1, 1,
0.1712333, 2.556543, -1.510934, 0, 0.6980392, 1, 1,
0.1744316, 1.580371, 0.8594968, 0, 0.6941177, 1, 1,
0.1749596, -1.525935, 3.532062, 0, 0.6862745, 1, 1,
0.1765166, 0.2173439, 0.4815654, 0, 0.682353, 1, 1,
0.1777823, 0.4577321, 0.4356193, 0, 0.6745098, 1, 1,
0.1784981, -0.7542321, 2.58306, 0, 0.6705883, 1, 1,
0.1860692, 0.9224561, 0.1031313, 0, 0.6627451, 1, 1,
0.1896982, 1.456771, 0.02026151, 0, 0.6588235, 1, 1,
0.1926173, 1.993052, 0.2572716, 0, 0.6509804, 1, 1,
0.1973997, 0.2971371, 1.855442, 0, 0.6470588, 1, 1,
0.1975414, 1.459527, 1.113812, 0, 0.6392157, 1, 1,
0.2025958, 1.361218, -0.004590213, 0, 0.6352941, 1, 1,
0.2040204, 1.473425, -0.2095048, 0, 0.627451, 1, 1,
0.205601, 0.005237428, -1.542501, 0, 0.6235294, 1, 1,
0.2105712, -0.720471, 1.944619, 0, 0.6156863, 1, 1,
0.2143284, 1.857987, 1.709983, 0, 0.6117647, 1, 1,
0.2152868, 2.752351, 0.3428715, 0, 0.6039216, 1, 1,
0.2154831, -0.5309125, 2.74126, 0, 0.5960785, 1, 1,
0.2208859, 0.4292536, 0.7648792, 0, 0.5921569, 1, 1,
0.2273535, 0.5635983, 0.6648762, 0, 0.5843138, 1, 1,
0.2280442, 1.828587, 0.9913688, 0, 0.5803922, 1, 1,
0.2290151, 0.08190881, 2.122654, 0, 0.572549, 1, 1,
0.2299479, -0.6872231, 4.319843, 0, 0.5686275, 1, 1,
0.230246, -0.4631557, 2.925225, 0, 0.5607843, 1, 1,
0.2306976, -0.08501448, 1.533582, 0, 0.5568628, 1, 1,
0.234062, 1.115864, -1.382755, 0, 0.5490196, 1, 1,
0.2382289, 1.144546, -0.139012, 0, 0.5450981, 1, 1,
0.2424328, 0.8461277, 0.4307571, 0, 0.5372549, 1, 1,
0.2433375, 0.2978596, -0.9392628, 0, 0.5333334, 1, 1,
0.2447667, 0.2285997, 0.1013694, 0, 0.5254902, 1, 1,
0.2473089, 0.7438843, -0.9257958, 0, 0.5215687, 1, 1,
0.2556008, 1.98689, 0.01251713, 0, 0.5137255, 1, 1,
0.25624, -1.208124, 2.748794, 0, 0.509804, 1, 1,
0.2599712, 0.3052483, 2.487102, 0, 0.5019608, 1, 1,
0.2606018, -0.7832851, 2.067464, 0, 0.4941176, 1, 1,
0.2624556, -1.078769, 3.529801, 0, 0.4901961, 1, 1,
0.2628773, -1.374267, 3.931215, 0, 0.4823529, 1, 1,
0.2668021, 0.5090548, 0.1568399, 0, 0.4784314, 1, 1,
0.2777203, -0.4502808, 2.84487, 0, 0.4705882, 1, 1,
0.2802066, -1.187562, 3.515719, 0, 0.4666667, 1, 1,
0.2852714, -0.8270879, 1.415034, 0, 0.4588235, 1, 1,
0.2866826, 1.187642, -0.70924, 0, 0.454902, 1, 1,
0.2886286, -0.3589737, 2.391233, 0, 0.4470588, 1, 1,
0.2888211, 0.8835019, 0.3390632, 0, 0.4431373, 1, 1,
0.2902389, -0.1570675, 1.409388, 0, 0.4352941, 1, 1,
0.2950455, -0.9522161, 3.740069, 0, 0.4313726, 1, 1,
0.2959992, -0.09800995, 1.314456, 0, 0.4235294, 1, 1,
0.2966308, -0.3414539, 1.981017, 0, 0.4196078, 1, 1,
0.2968603, 0.4257874, 0.06208492, 0, 0.4117647, 1, 1,
0.2975044, 1.644283, -1.105319, 0, 0.4078431, 1, 1,
0.2980888, 1.779002, 0.9892077, 0, 0.4, 1, 1,
0.3016582, -0.6925657, 2.124038, 0, 0.3921569, 1, 1,
0.3065431, -0.1511605, 1.910314, 0, 0.3882353, 1, 1,
0.3073522, 1.03852, -0.4643815, 0, 0.3803922, 1, 1,
0.3079518, -0.7582191, 3.209189, 0, 0.3764706, 1, 1,
0.3093855, 1.19426, 1.151218, 0, 0.3686275, 1, 1,
0.3142136, 0.4380654, 1.542989, 0, 0.3647059, 1, 1,
0.3152219, -2.630856, 1.597422, 0, 0.3568628, 1, 1,
0.3156775, 1.057124, 0.6100353, 0, 0.3529412, 1, 1,
0.3228241, -0.5354245, 1.212732, 0, 0.345098, 1, 1,
0.3253348, -0.558165, 2.333999, 0, 0.3411765, 1, 1,
0.3268523, -0.8610905, 2.650483, 0, 0.3333333, 1, 1,
0.332371, -0.1461838, 2.487554, 0, 0.3294118, 1, 1,
0.3361559, -1.082711, 1.887724, 0, 0.3215686, 1, 1,
0.3445506, 0.6068588, -0.6118492, 0, 0.3176471, 1, 1,
0.3466155, -0.9781494, 4.208198, 0, 0.3098039, 1, 1,
0.3500719, 0.4440338, -0.5140216, 0, 0.3058824, 1, 1,
0.3533275, -0.03204482, 1.426995, 0, 0.2980392, 1, 1,
0.3544639, 0.8989769, 0.02472155, 0, 0.2901961, 1, 1,
0.3587064, -0.02597914, 2.384207, 0, 0.2862745, 1, 1,
0.3588005, -0.2433311, 1.339203, 0, 0.2784314, 1, 1,
0.3636779, 0.1039634, 1.601915, 0, 0.2745098, 1, 1,
0.3644816, 1.072458, 1.103149, 0, 0.2666667, 1, 1,
0.3688033, 1.449965, -1.355387, 0, 0.2627451, 1, 1,
0.3718547, -0.5955688, 2.939512, 0, 0.254902, 1, 1,
0.3748353, 0.7466633, 1.47076, 0, 0.2509804, 1, 1,
0.3753012, 0.4681308, 1.210573, 0, 0.2431373, 1, 1,
0.3759187, -0.7604007, 1.757674, 0, 0.2392157, 1, 1,
0.378884, -0.8773503, 3.255428, 0, 0.2313726, 1, 1,
0.3850986, 0.4852922, 0.5634769, 0, 0.227451, 1, 1,
0.3882661, -1.107419, 2.71485, 0, 0.2196078, 1, 1,
0.3894673, -1.475666, 1.764745, 0, 0.2156863, 1, 1,
0.3901099, -0.4009737, 4.227234, 0, 0.2078431, 1, 1,
0.3911695, 0.0391739, 1.11885, 0, 0.2039216, 1, 1,
0.3939191, 1.11476, 0.08126779, 0, 0.1960784, 1, 1,
0.3979182, 0.6556202, -1.296249, 0, 0.1882353, 1, 1,
0.3991733, 0.03089998, 1.64811, 0, 0.1843137, 1, 1,
0.4003458, 1.557057, -0.04236125, 0, 0.1764706, 1, 1,
0.4020981, -0.6292765, 3.583981, 0, 0.172549, 1, 1,
0.4035898, 0.1077745, 2.393232, 0, 0.1647059, 1, 1,
0.4041305, -0.01462955, 0.08579589, 0, 0.1607843, 1, 1,
0.4054379, 0.9566914, 0.9478336, 0, 0.1529412, 1, 1,
0.4062706, 1.070949, 0.7302814, 0, 0.1490196, 1, 1,
0.4064302, 1.147417, -0.7064168, 0, 0.1411765, 1, 1,
0.4070489, -0.4177522, 1.685159, 0, 0.1372549, 1, 1,
0.4126441, 1.097647, -1.164882, 0, 0.1294118, 1, 1,
0.4128796, -1.627642, 3.323087, 0, 0.1254902, 1, 1,
0.4137808, 0.6345834, 0.6058289, 0, 0.1176471, 1, 1,
0.4166545, 0.356702, 1.667703, 0, 0.1137255, 1, 1,
0.4184294, -1.89191, 2.491491, 0, 0.1058824, 1, 1,
0.4191744, 0.9189246, -0.3560597, 0, 0.09803922, 1, 1,
0.4214216, 1.137674, 1.423073, 0, 0.09411765, 1, 1,
0.4235775, 0.4897257, 0.8699279, 0, 0.08627451, 1, 1,
0.4293959, -0.9053828, 2.531685, 0, 0.08235294, 1, 1,
0.4343441, 1.949466, -1.397115, 0, 0.07450981, 1, 1,
0.435641, -0.888613, 2.499779, 0, 0.07058824, 1, 1,
0.4370512, -0.2331476, 1.729808, 0, 0.0627451, 1, 1,
0.4373908, 0.3816683, 1.472382, 0, 0.05882353, 1, 1,
0.4434919, 1.158087, 0.8745362, 0, 0.05098039, 1, 1,
0.4435834, 0.7912851, 0.4581906, 0, 0.04705882, 1, 1,
0.4454351, 0.7768633, 0.2258491, 0, 0.03921569, 1, 1,
0.4490119, -0.1870339, 1.396406, 0, 0.03529412, 1, 1,
0.4499198, 0.1052242, 1.57226, 0, 0.02745098, 1, 1,
0.4499278, 0.04766629, 1.972203, 0, 0.02352941, 1, 1,
0.4520276, 0.4494118, 1.524226, 0, 0.01568628, 1, 1,
0.4532154, 1.316079, 0.7904375, 0, 0.01176471, 1, 1,
0.4544396, 0.9335, 0.8354083, 0, 0.003921569, 1, 1,
0.4551507, 0.2652, 1.042245, 0.003921569, 0, 1, 1,
0.4552407, -0.3856358, 1.354241, 0.007843138, 0, 1, 1,
0.4553162, -0.3079069, 3.334767, 0.01568628, 0, 1, 1,
0.4564032, -0.03798074, 0.6449385, 0.01960784, 0, 1, 1,
0.4564577, -2.234402, 2.855596, 0.02745098, 0, 1, 1,
0.4620489, 1.011971, 2.324232, 0.03137255, 0, 1, 1,
0.4623435, -0.271085, 2.788152, 0.03921569, 0, 1, 1,
0.4666456, -1.892974, 2.508374, 0.04313726, 0, 1, 1,
0.466734, -0.0544361, 0.1448996, 0.05098039, 0, 1, 1,
0.4679468, -0.8226255, 2.471182, 0.05490196, 0, 1, 1,
0.4693015, 2.427636, 1.107203, 0.0627451, 0, 1, 1,
0.4694024, 1.220427, 0.1995182, 0.06666667, 0, 1, 1,
0.4759568, 0.5084504, -1.136151, 0.07450981, 0, 1, 1,
0.4774159, 0.3994807, -0.005485563, 0.07843138, 0, 1, 1,
0.478557, -0.7598796, 2.829623, 0.08627451, 0, 1, 1,
0.4810062, -0.7747976, 2.823716, 0.09019608, 0, 1, 1,
0.4938207, -0.1998778, 0.9885097, 0.09803922, 0, 1, 1,
0.4959518, 0.243007, 4.455073, 0.1058824, 0, 1, 1,
0.4991213, 1.008047, 0.7362443, 0.1098039, 0, 1, 1,
0.4999005, 0.04375372, 2.645807, 0.1176471, 0, 1, 1,
0.5004756, 1.432282, -1.611157, 0.1215686, 0, 1, 1,
0.5072312, 0.02595118, -0.2149795, 0.1294118, 0, 1, 1,
0.5091266, -0.5416633, 4.040199, 0.1333333, 0, 1, 1,
0.5104111, -1.386108, 3.438091, 0.1411765, 0, 1, 1,
0.5169448, -1.628025, 4.086694, 0.145098, 0, 1, 1,
0.5200135, -0.2032221, 0.7661246, 0.1529412, 0, 1, 1,
0.5214401, -0.2942126, 0.8167812, 0.1568628, 0, 1, 1,
0.5241955, 0.3220793, -0.08420722, 0.1647059, 0, 1, 1,
0.5254563, -0.08065604, 1.662188, 0.1686275, 0, 1, 1,
0.5255091, -1.430312, 3.863881, 0.1764706, 0, 1, 1,
0.5270173, 0.9533749, -2.012347, 0.1803922, 0, 1, 1,
0.5281714, 0.8080264, 0.2333994, 0.1882353, 0, 1, 1,
0.536332, 0.3864089, 0.1626645, 0.1921569, 0, 1, 1,
0.5422499, -2.502925, 2.769175, 0.2, 0, 1, 1,
0.5428932, 0.9333813, 1.567606, 0.2078431, 0, 1, 1,
0.5457489, -0.5360641, 2.775779, 0.2117647, 0, 1, 1,
0.5485526, 0.8532771, 0.7378939, 0.2196078, 0, 1, 1,
0.549894, -0.9879549, 2.356679, 0.2235294, 0, 1, 1,
0.5503534, -0.9839604, 3.040975, 0.2313726, 0, 1, 1,
0.5511099, -1.441365, 4.635385, 0.2352941, 0, 1, 1,
0.5531024, -1.31106, 3.984353, 0.2431373, 0, 1, 1,
0.5547555, 0.04097762, 1.224757, 0.2470588, 0, 1, 1,
0.5581065, 1.239778, -0.1478604, 0.254902, 0, 1, 1,
0.5637941, 0.684241, 0.01579783, 0.2588235, 0, 1, 1,
0.5643321, 2.16793, 1.421672, 0.2666667, 0, 1, 1,
0.5689611, 1.025939, -0.583344, 0.2705882, 0, 1, 1,
0.5815026, -1.281569, 2.369727, 0.2784314, 0, 1, 1,
0.5861675, -0.5944088, 2.915613, 0.282353, 0, 1, 1,
0.5867101, 0.08364066, 1.332, 0.2901961, 0, 1, 1,
0.5886528, 0.1657643, 2.269916, 0.2941177, 0, 1, 1,
0.5938578, 1.101763, 0.2030151, 0.3019608, 0, 1, 1,
0.5956523, -0.8435467, 2.92412, 0.3098039, 0, 1, 1,
0.5975676, 0.05195937, 2.959762, 0.3137255, 0, 1, 1,
0.6065741, 0.949902, 1.163204, 0.3215686, 0, 1, 1,
0.6200237, 2.101523, -0.6071643, 0.3254902, 0, 1, 1,
0.621491, 1.239509, 1.588369, 0.3333333, 0, 1, 1,
0.6291879, -0.4296388, 3.754278, 0.3372549, 0, 1, 1,
0.6296502, 0.9586573, 1.418193, 0.345098, 0, 1, 1,
0.6297283, -0.4868386, 2.265336, 0.3490196, 0, 1, 1,
0.629912, 0.08488653, 0.3040415, 0.3568628, 0, 1, 1,
0.6301155, 0.4855407, 1.263026, 0.3607843, 0, 1, 1,
0.6321147, 0.5370278, -0.9290457, 0.3686275, 0, 1, 1,
0.639019, 0.2772018, -0.1703392, 0.372549, 0, 1, 1,
0.640863, 0.4124869, 2.758739, 0.3803922, 0, 1, 1,
0.6454932, 1.329149, -0.7178884, 0.3843137, 0, 1, 1,
0.6469623, -1.219258, 3.995522, 0.3921569, 0, 1, 1,
0.6510033, -0.9341748, 2.818178, 0.3960784, 0, 1, 1,
0.6540874, 0.3138413, 2.132734, 0.4039216, 0, 1, 1,
0.6567768, 0.8277528, 1.213478, 0.4117647, 0, 1, 1,
0.6572644, 0.9441068, -0.100913, 0.4156863, 0, 1, 1,
0.6605902, 0.6287173, -1.279814, 0.4235294, 0, 1, 1,
0.6645541, 0.3026391, 1.610956, 0.427451, 0, 1, 1,
0.6687632, 1.158143, -0.847489, 0.4352941, 0, 1, 1,
0.6726415, 2.364927, 0.6269647, 0.4392157, 0, 1, 1,
0.6786951, -0.4021694, 4.043743, 0.4470588, 0, 1, 1,
0.6830407, -1.286784, 5.107131, 0.4509804, 0, 1, 1,
0.6863962, -2.242223, 2.767784, 0.4588235, 0, 1, 1,
0.6866666, -0.217398, 0.6334469, 0.4627451, 0, 1, 1,
0.687892, 0.3323668, 2.059372, 0.4705882, 0, 1, 1,
0.6879105, -0.1441983, 3.312939, 0.4745098, 0, 1, 1,
0.6919337, 0.2973048, 2.093507, 0.4823529, 0, 1, 1,
0.6937707, -0.1208077, 3.032597, 0.4862745, 0, 1, 1,
0.6947153, 0.1724014, 0.09101394, 0.4941176, 0, 1, 1,
0.6948498, -0.6785557, 4.510883, 0.5019608, 0, 1, 1,
0.7002738, 1.13099, 2.840902, 0.5058824, 0, 1, 1,
0.7003185, 0.2899214, 1.705461, 0.5137255, 0, 1, 1,
0.7008681, -0.07973783, 1.358234, 0.5176471, 0, 1, 1,
0.7052919, -0.6961483, 0.09469777, 0.5254902, 0, 1, 1,
0.7174958, -1.301147, 2.86846, 0.5294118, 0, 1, 1,
0.7204627, -0.2675366, 2.425518, 0.5372549, 0, 1, 1,
0.7222459, 0.573307, 2.376828, 0.5411765, 0, 1, 1,
0.7242945, -0.5222226, 0.8090626, 0.5490196, 0, 1, 1,
0.7247624, 0.380942, 1.566957, 0.5529412, 0, 1, 1,
0.7268168, -0.6818391, 2.126721, 0.5607843, 0, 1, 1,
0.7394465, 0.3269, 2.063223, 0.5647059, 0, 1, 1,
0.741469, 0.3310554, 1.487882, 0.572549, 0, 1, 1,
0.7438562, -0.1306065, 3.200118, 0.5764706, 0, 1, 1,
0.7439401, 0.2281131, 1.607366, 0.5843138, 0, 1, 1,
0.7452273, 0.2879815, 3.720469, 0.5882353, 0, 1, 1,
0.758477, -1.362186, 3.045011, 0.5960785, 0, 1, 1,
0.7638403, 0.6932722, 1.535416, 0.6039216, 0, 1, 1,
0.7640259, 1.463863, -0.2296134, 0.6078432, 0, 1, 1,
0.7681448, -0.9942615, 2.448462, 0.6156863, 0, 1, 1,
0.7698418, -0.0390586, 2.273877, 0.6196079, 0, 1, 1,
0.7717828, -2.108353, 2.120501, 0.627451, 0, 1, 1,
0.7721666, 1.941244, 2.337726, 0.6313726, 0, 1, 1,
0.7756847, -0.4882014, 3.5565, 0.6392157, 0, 1, 1,
0.7786917, -0.7686849, 0.4522256, 0.6431373, 0, 1, 1,
0.7809887, 0.2363977, 1.402326, 0.6509804, 0, 1, 1,
0.7814952, -0.150629, 0.4541635, 0.654902, 0, 1, 1,
0.7838403, 0.003918764, -0.1269988, 0.6627451, 0, 1, 1,
0.78654, -0.3975498, 2.038672, 0.6666667, 0, 1, 1,
0.7869245, 0.8405204, 1.094475, 0.6745098, 0, 1, 1,
0.7939487, 0.6326465, 1.183541, 0.6784314, 0, 1, 1,
0.7946174, -0.25082, 1.026876, 0.6862745, 0, 1, 1,
0.8027772, 0.1980856, 1.884174, 0.6901961, 0, 1, 1,
0.80386, -0.9673874, 1.390529, 0.6980392, 0, 1, 1,
0.8062872, -0.2574288, 3.019848, 0.7058824, 0, 1, 1,
0.8066844, -1.060962, 3.134693, 0.7098039, 0, 1, 1,
0.8096293, 0.4128656, 3.211249, 0.7176471, 0, 1, 1,
0.811138, -0.4147127, 2.897315, 0.7215686, 0, 1, 1,
0.8126832, -0.1186339, 0.5775796, 0.7294118, 0, 1, 1,
0.8166488, -0.7364179, 1.509286, 0.7333333, 0, 1, 1,
0.8167378, -0.3767143, 1.042244, 0.7411765, 0, 1, 1,
0.8225802, -0.8414499, 3.04903, 0.7450981, 0, 1, 1,
0.825541, -1.185097, 3.957016, 0.7529412, 0, 1, 1,
0.8261994, -0.4746563, 1.181613, 0.7568628, 0, 1, 1,
0.8279408, 1.033501, 2.399008, 0.7647059, 0, 1, 1,
0.8291924, 1.680297, -0.03583287, 0.7686275, 0, 1, 1,
0.8357016, -0.4967759, 1.802022, 0.7764706, 0, 1, 1,
0.8411423, -0.1146036, -0.1224513, 0.7803922, 0, 1, 1,
0.841916, -2.101202, 5.182168, 0.7882353, 0, 1, 1,
0.8421801, 0.8086686, 1.376399, 0.7921569, 0, 1, 1,
0.8595406, 0.141477, 1.305668, 0.8, 0, 1, 1,
0.8642365, -0.1203006, 2.415122, 0.8078431, 0, 1, 1,
0.8671563, 0.1962961, 2.245672, 0.8117647, 0, 1, 1,
0.8770382, -1.474534, 1.842618, 0.8196079, 0, 1, 1,
0.8770665, 0.720899, 0.1515843, 0.8235294, 0, 1, 1,
0.8806218, -0.7709928, 2.813508, 0.8313726, 0, 1, 1,
0.8825585, 0.7050497, 0.9175859, 0.8352941, 0, 1, 1,
0.8876044, -0.05219434, 3.012557, 0.8431373, 0, 1, 1,
0.8927292, 0.03334501, -0.1483861, 0.8470588, 0, 1, 1,
0.894805, -0.1904054, 2.835767, 0.854902, 0, 1, 1,
0.895601, 0.4410642, 1.904468, 0.8588235, 0, 1, 1,
0.8984183, 1.270657, -0.5320103, 0.8666667, 0, 1, 1,
0.9048972, 0.5038741, 1.095856, 0.8705882, 0, 1, 1,
0.9064667, -0.02201445, 2.218934, 0.8784314, 0, 1, 1,
0.9093335, -1.142591, 2.835625, 0.8823529, 0, 1, 1,
0.9132553, -0.1150415, 2.639655, 0.8901961, 0, 1, 1,
0.9137832, -1.446133, 3.765031, 0.8941177, 0, 1, 1,
0.9286319, 0.709105, -0.734006, 0.9019608, 0, 1, 1,
0.9398767, -1.022968, 4.157308, 0.9098039, 0, 1, 1,
0.9444552, -1.278839, 2.800262, 0.9137255, 0, 1, 1,
0.9480919, 0.4827376, 2.973354, 0.9215686, 0, 1, 1,
0.9521583, 0.7633877, 0.9940996, 0.9254902, 0, 1, 1,
0.9537354, 0.6090586, 1.070082, 0.9333333, 0, 1, 1,
0.9573092, -1.878805, 2.818765, 0.9372549, 0, 1, 1,
0.9652295, 0.5615746, 0.8115551, 0.945098, 0, 1, 1,
0.9670896, -0.5846265, 1.608493, 0.9490196, 0, 1, 1,
0.967196, 1.18161, 0.5622938, 0.9568627, 0, 1, 1,
0.9682572, 0.4701976, 1.725328, 0.9607843, 0, 1, 1,
0.9712821, 0.03429232, -0.1898692, 0.9686275, 0, 1, 1,
0.9726653, -0.2695458, 2.612804, 0.972549, 0, 1, 1,
0.9751473, -0.5738018, 3.527758, 0.9803922, 0, 1, 1,
0.9919056, -0.07173867, -0.1823868, 0.9843137, 0, 1, 1,
0.9921473, 1.054226, 0.2370447, 0.9921569, 0, 1, 1,
0.993437, 1.143566, 1.979178, 0.9960784, 0, 1, 1,
0.9955683, 0.2051682, 1.455333, 1, 0, 0.9960784, 1,
0.9956978, -0.1687817, 2.586232, 1, 0, 0.9882353, 1,
0.9977142, 0.3758572, 2.794097, 1, 0, 0.9843137, 1,
0.9986226, 1.120494, 0.1066001, 1, 0, 0.9764706, 1,
1.00498, -1.152361, 3.633471, 1, 0, 0.972549, 1,
1.009676, 0.1403774, 1.930995, 1, 0, 0.9647059, 1,
1.009869, 0.2752991, 2.138561, 1, 0, 0.9607843, 1,
1.011386, -0.7862646, 1.635656, 1, 0, 0.9529412, 1,
1.013023, -2.967574, 3.458674, 1, 0, 0.9490196, 1,
1.014979, 1.425631, 0.5930262, 1, 0, 0.9411765, 1,
1.016755, 1.046949, 0.3600376, 1, 0, 0.9372549, 1,
1.019054, 0.2139171, -1.886316, 1, 0, 0.9294118, 1,
1.019808, 0.1747851, 2.24734, 1, 0, 0.9254902, 1,
1.024982, -0.5652651, 3.865539, 1, 0, 0.9176471, 1,
1.025501, -2.027067, 2.235402, 1, 0, 0.9137255, 1,
1.025667, 0.7675961, 0.8927311, 1, 0, 0.9058824, 1,
1.028455, 0.5367503, -0.02580062, 1, 0, 0.9019608, 1,
1.033027, -1.042107, 0.9855756, 1, 0, 0.8941177, 1,
1.0373, 1.181498, 0.5709657, 1, 0, 0.8862745, 1,
1.049413, -0.1062004, 2.285158, 1, 0, 0.8823529, 1,
1.051769, 1.681549, 0.1460382, 1, 0, 0.8745098, 1,
1.060207, 0.4956673, 0.9415041, 1, 0, 0.8705882, 1,
1.065273, 0.3778261, 1.944438, 1, 0, 0.8627451, 1,
1.066385, 0.1876588, 0.6023164, 1, 0, 0.8588235, 1,
1.072906, -1.534783, 1.377269, 1, 0, 0.8509804, 1,
1.079341, -1.18441, 3.793618, 1, 0, 0.8470588, 1,
1.080054, 0.1444283, 1.47825, 1, 0, 0.8392157, 1,
1.087541, 2.397328, -1.570992, 1, 0, 0.8352941, 1,
1.088492, -0.4856197, 2.054616, 1, 0, 0.827451, 1,
1.093348, -0.9872261, 0.9132577, 1, 0, 0.8235294, 1,
1.094977, 0.8418524, 1.283334, 1, 0, 0.8156863, 1,
1.095336, -2.795111, 3.315637, 1, 0, 0.8117647, 1,
1.099125, -0.5295826, 2.14804, 1, 0, 0.8039216, 1,
1.107595, 0.4383256, 1.470422, 1, 0, 0.7960784, 1,
1.110817, 1.827031, 1.57007, 1, 0, 0.7921569, 1,
1.117737, -0.7045166, 2.436736, 1, 0, 0.7843137, 1,
1.12111, 0.8226756, 0.54572, 1, 0, 0.7803922, 1,
1.130776, -0.04606524, 1.470266, 1, 0, 0.772549, 1,
1.132048, -1.791204, 1.144846, 1, 0, 0.7686275, 1,
1.136779, 1.376546, -0.7574764, 1, 0, 0.7607843, 1,
1.142734, -1.488149, 3.280384, 1, 0, 0.7568628, 1,
1.144094, 1.45476, -1.374465, 1, 0, 0.7490196, 1,
1.157757, 0.2570852, 0.3595099, 1, 0, 0.7450981, 1,
1.157778, 0.1552255, 0.5107425, 1, 0, 0.7372549, 1,
1.162112, 1.157402, -0.4367918, 1, 0, 0.7333333, 1,
1.165688, -0.7735312, 2.481271, 1, 0, 0.7254902, 1,
1.167326, 0.8579854, -0.1693367, 1, 0, 0.7215686, 1,
1.191375, -0.02104178, 1.869082, 1, 0, 0.7137255, 1,
1.194753, 0.7158411, 0.05801554, 1, 0, 0.7098039, 1,
1.213854, 1.144356, -0.2251409, 1, 0, 0.7019608, 1,
1.216646, 0.3041896, 0.2159615, 1, 0, 0.6941177, 1,
1.228526, 0.4429074, 0.8495486, 1, 0, 0.6901961, 1,
1.249445, -0.5375089, 0.9789092, 1, 0, 0.682353, 1,
1.253665, 0.893398, 0.5165015, 1, 0, 0.6784314, 1,
1.254693, 0.2501791, 2.34202, 1, 0, 0.6705883, 1,
1.263805, -1.236403, 3.460002, 1, 0, 0.6666667, 1,
1.272141, -0.721257, 1.536231, 1, 0, 0.6588235, 1,
1.27219, 2.099686, -0.705753, 1, 0, 0.654902, 1,
1.276232, -1.042622, 2.965596, 1, 0, 0.6470588, 1,
1.280535, 0.07475936, 1.232968, 1, 0, 0.6431373, 1,
1.284204, -2.396137, 1.945597, 1, 0, 0.6352941, 1,
1.284799, -0.8863653, 3.246653, 1, 0, 0.6313726, 1,
1.285871, -1.550951, 3.765503, 1, 0, 0.6235294, 1,
1.287363, -1.366518, 3.119535, 1, 0, 0.6196079, 1,
1.288144, 2.1065, 2.268773, 1, 0, 0.6117647, 1,
1.297778, -0.4041183, 3.76132, 1, 0, 0.6078432, 1,
1.307609, 0.960856, 1.489809, 1, 0, 0.6, 1,
1.30861, 1.459324, 0.5351607, 1, 0, 0.5921569, 1,
1.315319, -0.1198624, 3.373296, 1, 0, 0.5882353, 1,
1.316571, 1.290988, 3.8299, 1, 0, 0.5803922, 1,
1.322135, 1.26484, 0.5175727, 1, 0, 0.5764706, 1,
1.326301, 1.169826, -1.219134, 1, 0, 0.5686275, 1,
1.328396, 0.8798968, 0.7989805, 1, 0, 0.5647059, 1,
1.330581, -2.108346, 2.096758, 1, 0, 0.5568628, 1,
1.338283, -0.5414534, 1.125981, 1, 0, 0.5529412, 1,
1.350519, -0.9660213, 2.504829, 1, 0, 0.5450981, 1,
1.356323, -1.669663, 3.803477, 1, 0, 0.5411765, 1,
1.364313, 0.5063694, 2.047843, 1, 0, 0.5333334, 1,
1.371946, 0.07755291, 1.542529, 1, 0, 0.5294118, 1,
1.389574, 1.023767, 2.856647, 1, 0, 0.5215687, 1,
1.392118, -0.6678307, 4.082081, 1, 0, 0.5176471, 1,
1.398461, -0.288734, 2.669382, 1, 0, 0.509804, 1,
1.399507, 0.03580608, 2.779098, 1, 0, 0.5058824, 1,
1.403782, -1.070369, 1.660345, 1, 0, 0.4980392, 1,
1.423752, -0.7860775, 1.438773, 1, 0, 0.4901961, 1,
1.423907, -0.2906312, 1.429723, 1, 0, 0.4862745, 1,
1.432454, -0.2424878, 0.7832573, 1, 0, 0.4784314, 1,
1.447832, -1.236286, 3.56188, 1, 0, 0.4745098, 1,
1.45108, 0.1114266, 1.926222, 1, 0, 0.4666667, 1,
1.455603, 0.5134383, 1.559926, 1, 0, 0.4627451, 1,
1.459197, -1.147778, 1.461711, 1, 0, 0.454902, 1,
1.45956, 1.210535, 0.9428431, 1, 0, 0.4509804, 1,
1.471819, 1.352956, 0.1080047, 1, 0, 0.4431373, 1,
1.482432, -0.7533079, 4.217297, 1, 0, 0.4392157, 1,
1.491506, -0.09915877, 0.6420518, 1, 0, 0.4313726, 1,
1.497466, -0.2824379, 0.714417, 1, 0, 0.427451, 1,
1.497916, -1.699986, 2.313966, 1, 0, 0.4196078, 1,
1.502194, 1.193271, 1.070641, 1, 0, 0.4156863, 1,
1.502856, -0.1335902, 2.030663, 1, 0, 0.4078431, 1,
1.502973, -0.6109055, 0.3248463, 1, 0, 0.4039216, 1,
1.515778, 1.416588, 0.02560018, 1, 0, 0.3960784, 1,
1.516689, -0.2211372, 2.658504, 1, 0, 0.3882353, 1,
1.519538, -0.3492981, 3.035204, 1, 0, 0.3843137, 1,
1.527974, -0.645946, 2.072422, 1, 0, 0.3764706, 1,
1.531264, -0.02902663, 0.6828833, 1, 0, 0.372549, 1,
1.533372, 0.924127, 2.497573, 1, 0, 0.3647059, 1,
1.54187, -0.4046988, 1.603862, 1, 0, 0.3607843, 1,
1.548537, -0.33215, 1.28404, 1, 0, 0.3529412, 1,
1.553293, 1.211073, 2.005733, 1, 0, 0.3490196, 1,
1.567953, -1.122345, 3.765082, 1, 0, 0.3411765, 1,
1.573124, -0.08254176, -1.952947, 1, 0, 0.3372549, 1,
1.597197, -1.053884, 1.555593, 1, 0, 0.3294118, 1,
1.623328, -0.4944263, 1.031244, 1, 0, 0.3254902, 1,
1.633826, 0.5371583, 2.022266, 1, 0, 0.3176471, 1,
1.657628, -0.510003, 2.775012, 1, 0, 0.3137255, 1,
1.657641, -0.223981, 1.876186, 1, 0, 0.3058824, 1,
1.68525, 0.175983, 2.856158, 1, 0, 0.2980392, 1,
1.686671, -1.52147, 1.289024, 1, 0, 0.2941177, 1,
1.701924, 0.03689408, 1.931413, 1, 0, 0.2862745, 1,
1.709929, 0.7398217, -0.2902132, 1, 0, 0.282353, 1,
1.711226, -0.5872527, 2.642245, 1, 0, 0.2745098, 1,
1.714362, 0.5606956, 1.976094, 1, 0, 0.2705882, 1,
1.735178, 0.450607, 0.8480766, 1, 0, 0.2627451, 1,
1.749708, 1.030658, 0.8844339, 1, 0, 0.2588235, 1,
1.754641, 0.6913952, 0.4444897, 1, 0, 0.2509804, 1,
1.769861, -0.6353096, 0.5934092, 1, 0, 0.2470588, 1,
1.781438, 1.85288, 0.1389137, 1, 0, 0.2392157, 1,
1.807371, -1.287441, 1.848746, 1, 0, 0.2352941, 1,
1.818624, 0.1513181, 2.312076, 1, 0, 0.227451, 1,
1.822353, -0.7850401, 3.132088, 1, 0, 0.2235294, 1,
1.82415, 1.018923, -0.4990968, 1, 0, 0.2156863, 1,
1.826404, 1.811126, 0.7785118, 1, 0, 0.2117647, 1,
1.831715, -0.1120332, 3.245363, 1, 0, 0.2039216, 1,
1.832778, 0.1539715, 1.433958, 1, 0, 0.1960784, 1,
1.841583, -0.4322892, 1.658997, 1, 0, 0.1921569, 1,
1.86422, 1.997388, 0.322398, 1, 0, 0.1843137, 1,
1.87517, 0.5245194, 2.043653, 1, 0, 0.1803922, 1,
1.910768, -0.1071889, 1.823647, 1, 0, 0.172549, 1,
1.911844, -0.7736338, 3.386773, 1, 0, 0.1686275, 1,
1.923681, 1.372167, 1.009838, 1, 0, 0.1607843, 1,
1.939919, 2.058362, 1.138617, 1, 0, 0.1568628, 1,
1.962993, -0.08942813, 0.9813839, 1, 0, 0.1490196, 1,
1.983346, -1.468716, 3.937858, 1, 0, 0.145098, 1,
2.005787, -0.03690922, 3.168258, 1, 0, 0.1372549, 1,
2.006191, 1.509874, 1.830255, 1, 0, 0.1333333, 1,
2.008837, 0.0664852, 2.640141, 1, 0, 0.1254902, 1,
2.044255, 1.224567, 0.6456222, 1, 0, 0.1215686, 1,
2.077214, 1.157542, 1.347261, 1, 0, 0.1137255, 1,
2.107996, 1.421223, 2.412194, 1, 0, 0.1098039, 1,
2.133592, 1.332065, 1.065706, 1, 0, 0.1019608, 1,
2.189964, 0.385188, 2.324827, 1, 0, 0.09411765, 1,
2.206474, 0.2712786, 1.07695, 1, 0, 0.09019608, 1,
2.22083, -0.32383, 2.143968, 1, 0, 0.08235294, 1,
2.242564, 1.831246, 1.223207, 1, 0, 0.07843138, 1,
2.244997, 0.3411762, 3.131551, 1, 0, 0.07058824, 1,
2.278664, 1.380094, -0.01714607, 1, 0, 0.06666667, 1,
2.298605, 1.623574, 2.944466, 1, 0, 0.05882353, 1,
2.379948, -0.377417, 1.007435, 1, 0, 0.05490196, 1,
2.433338, 0.24034, 1.115848, 1, 0, 0.04705882, 1,
2.568914, -0.298449, 3.36451, 1, 0, 0.04313726, 1,
2.667143, 0.9784147, 0.4701444, 1, 0, 0.03529412, 1,
2.701151, -0.8167212, 1.981276, 1, 0, 0.03137255, 1,
2.730676, 0.6308857, 1.347411, 1, 0, 0.02352941, 1,
2.958891, -0.05899933, 3.155148, 1, 0, 0.01960784, 1,
3.027038, -0.1609823, 1.575346, 1, 0, 0.01176471, 1,
3.090066, -0.5430318, 3.218558, 1, 0, 0.007843138, 1
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
-0.2279251, -4.036518, -7.801853, 0, -0.5, 0.5, 0.5,
-0.2279251, -4.036518, -7.801853, 1, -0.5, 0.5, 0.5,
-0.2279251, -4.036518, -7.801853, 1, 1.5, 0.5, 0.5,
-0.2279251, -4.036518, -7.801853, 0, 1.5, 0.5, 0.5
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
-4.670715, 0.1856519, -7.801853, 0, -0.5, 0.5, 0.5,
-4.670715, 0.1856519, -7.801853, 1, -0.5, 0.5, 0.5,
-4.670715, 0.1856519, -7.801853, 1, 1.5, 0.5, 0.5,
-4.670715, 0.1856519, -7.801853, 0, 1.5, 0.5, 0.5
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
-4.670715, -4.036518, -0.0173912, 0, -0.5, 0.5, 0.5,
-4.670715, -4.036518, -0.0173912, 1, -0.5, 0.5, 0.5,
-4.670715, -4.036518, -0.0173912, 1, 1.5, 0.5, 0.5,
-4.670715, -4.036518, -0.0173912, 0, 1.5, 0.5, 0.5
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
-3, -3.062171, -6.005438,
3, -3.062171, -6.005438,
-3, -3.062171, -6.005438,
-3, -3.224562, -6.304841,
-2, -3.062171, -6.005438,
-2, -3.224562, -6.304841,
-1, -3.062171, -6.005438,
-1, -3.224562, -6.304841,
0, -3.062171, -6.005438,
0, -3.224562, -6.304841,
1, -3.062171, -6.005438,
1, -3.224562, -6.304841,
2, -3.062171, -6.005438,
2, -3.224562, -6.304841,
3, -3.062171, -6.005438,
3, -3.224562, -6.304841
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
-3, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
-3, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
-3, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
-3, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
-2, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
-2, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
-2, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
-2, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
-1, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
-1, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
-1, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
-1, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
0, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
0, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
0, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
0, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
1, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
1, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
1, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
1, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
2, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
2, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
2, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
2, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5,
3, -3.549344, -6.903646, 0, -0.5, 0.5, 0.5,
3, -3.549344, -6.903646, 1, -0.5, 0.5, 0.5,
3, -3.549344, -6.903646, 1, 1.5, 0.5, 0.5,
3, -3.549344, -6.903646, 0, 1.5, 0.5, 0.5
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
-3.645456, -2, -6.005438,
-3.645456, 3, -6.005438,
-3.645456, -2, -6.005438,
-3.816333, -2, -6.304841,
-3.645456, -1, -6.005438,
-3.816333, -1, -6.304841,
-3.645456, 0, -6.005438,
-3.816333, 0, -6.304841,
-3.645456, 1, -6.005438,
-3.816333, 1, -6.304841,
-3.645456, 2, -6.005438,
-3.816333, 2, -6.304841,
-3.645456, 3, -6.005438,
-3.816333, 3, -6.304841
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
-4.158086, -2, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, -2, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, -2, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, -2, -6.903646, 0, 1.5, 0.5, 0.5,
-4.158086, -1, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, -1, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, -1, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, -1, -6.903646, 0, 1.5, 0.5, 0.5,
-4.158086, 0, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, 0, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, 0, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, 0, -6.903646, 0, 1.5, 0.5, 0.5,
-4.158086, 1, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, 1, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, 1, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, 1, -6.903646, 0, 1.5, 0.5, 0.5,
-4.158086, 2, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, 2, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, 2, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, 2, -6.903646, 0, 1.5, 0.5, 0.5,
-4.158086, 3, -6.903646, 0, -0.5, 0.5, 0.5,
-4.158086, 3, -6.903646, 1, -0.5, 0.5, 0.5,
-4.158086, 3, -6.903646, 1, 1.5, 0.5, 0.5,
-4.158086, 3, -6.903646, 0, 1.5, 0.5, 0.5
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
-3.645456, -3.062171, -4,
-3.645456, -3.062171, 4,
-3.645456, -3.062171, -4,
-3.816333, -3.224562, -4,
-3.645456, -3.062171, -2,
-3.816333, -3.224562, -2,
-3.645456, -3.062171, 0,
-3.816333, -3.224562, 0,
-3.645456, -3.062171, 2,
-3.816333, -3.224562, 2,
-3.645456, -3.062171, 4,
-3.816333, -3.224562, 4
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
-4.158086, -3.549344, -4, 0, -0.5, 0.5, 0.5,
-4.158086, -3.549344, -4, 1, -0.5, 0.5, 0.5,
-4.158086, -3.549344, -4, 1, 1.5, 0.5, 0.5,
-4.158086, -3.549344, -4, 0, 1.5, 0.5, 0.5,
-4.158086, -3.549344, -2, 0, -0.5, 0.5, 0.5,
-4.158086, -3.549344, -2, 1, -0.5, 0.5, 0.5,
-4.158086, -3.549344, -2, 1, 1.5, 0.5, 0.5,
-4.158086, -3.549344, -2, 0, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 0, 0, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 0, 1, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 0, 1, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 0, 0, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 2, 0, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 2, 1, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 2, 1, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 2, 0, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 4, 0, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 4, 1, -0.5, 0.5, 0.5,
-4.158086, -3.549344, 4, 1, 1.5, 0.5, 0.5,
-4.158086, -3.549344, 4, 0, 1.5, 0.5, 0.5
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
-3.645456, -3.062171, -6.005438,
-3.645456, 3.433475, -6.005438,
-3.645456, -3.062171, 5.970656,
-3.645456, 3.433475, 5.970656,
-3.645456, -3.062171, -6.005438,
-3.645456, -3.062171, 5.970656,
-3.645456, 3.433475, -6.005438,
-3.645456, 3.433475, 5.970656,
-3.645456, -3.062171, -6.005438,
3.189606, -3.062171, -6.005438,
-3.645456, -3.062171, 5.970656,
3.189606, -3.062171, 5.970656,
-3.645456, 3.433475, -6.005438,
3.189606, 3.433475, -6.005438,
-3.645456, 3.433475, 5.970656,
3.189606, 3.433475, 5.970656,
3.189606, -3.062171, -6.005438,
3.189606, 3.433475, -6.005438,
3.189606, -3.062171, 5.970656,
3.189606, 3.433475, 5.970656,
3.189606, -3.062171, -6.005438,
3.189606, -3.062171, 5.970656,
3.189606, 3.433475, -6.005438,
3.189606, 3.433475, 5.970656
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
var radius = 8.139278;
var distance = 36.21257;
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
mvMatrix.translate( 0.2279251, -0.1856519, 0.0173912 );
mvMatrix.scale( 1.28753, 1.354807, 0.7348261 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.21257);
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
3-ketocarbofuran<-read.table("3-ketocarbofuran.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-ketocarbofuran$V2
```

```
## Error in eval(expr, envir, enclos): object 'ketocarbofuran' not found
```

```r
y<-3-ketocarbofuran$V3
```

```
## Error in eval(expr, envir, enclos): object 'ketocarbofuran' not found
```

```r
z<-3-ketocarbofuran$V4
```

```
## Error in eval(expr, envir, enclos): object 'ketocarbofuran' not found
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
-3.545916, 0.6194552, -2.527149, 0, 0, 1, 1, 1,
-3.124402, -0.2515793, -1.365642, 1, 0, 0, 1, 1,
-2.894804, 1.484406, 0.3702183, 1, 0, 0, 1, 1,
-2.519264, -0.9114893, -2.258427, 1, 0, 0, 1, 1,
-2.502581, 1.251939, 0.1341625, 1, 0, 0, 1, 1,
-2.445215, 1.604989, -2.125115, 1, 0, 0, 1, 1,
-2.396889, -0.6330459, -2.243066, 0, 0, 0, 1, 1,
-2.342023, -1.633002, -3.862204, 0, 0, 0, 1, 1,
-2.305708, 0.03612324, -0.1073071, 0, 0, 0, 1, 1,
-2.295099, -0.0803955, -1.882513, 0, 0, 0, 1, 1,
-2.281196, 1.896382, -0.8457727, 0, 0, 0, 1, 1,
-2.27441, -0.3977925, -1.866201, 0, 0, 0, 1, 1,
-2.267103, 0.604441, -2.144702, 0, 0, 0, 1, 1,
-2.248587, -1.394259, -1.802364, 1, 1, 1, 1, 1,
-2.243945, -0.1841774, -0.9399344, 1, 1, 1, 1, 1,
-2.238881, 1.106294, -2.565098, 1, 1, 1, 1, 1,
-2.205603, 1.162654, -2.139357, 1, 1, 1, 1, 1,
-2.195034, -1.281214, -0.4059428, 1, 1, 1, 1, 1,
-2.13339, -0.5509586, -3.299201, 1, 1, 1, 1, 1,
-2.091837, -1.234508, -2.060789, 1, 1, 1, 1, 1,
-2.061528, -1.759224, -2.01461, 1, 1, 1, 1, 1,
-2.036384, -1.006959, -2.90429, 1, 1, 1, 1, 1,
-1.991745, -0.4234432, -1.982308, 1, 1, 1, 1, 1,
-1.975418, -0.6961775, -1.380957, 1, 1, 1, 1, 1,
-1.963714, -1.497474, -1.32237, 1, 1, 1, 1, 1,
-1.96066, -1.401853, -2.16985, 1, 1, 1, 1, 1,
-1.95542, 1.340473, -0.6991746, 1, 1, 1, 1, 1,
-1.943314, 0.102061, -0.9727662, 1, 1, 1, 1, 1,
-1.933352, 1.36983, -1.100301, 0, 0, 1, 1, 1,
-1.913431, -0.5477425, -1.265134, 1, 0, 0, 1, 1,
-1.904036, -0.1127651, -2.396629, 1, 0, 0, 1, 1,
-1.902533, -0.6405719, -2.551941, 1, 0, 0, 1, 1,
-1.877967, -0.6649806, -2.547958, 1, 0, 0, 1, 1,
-1.871792, -0.1646115, -1.111588, 1, 0, 0, 1, 1,
-1.859384, -0.9554811, -1.893629, 0, 0, 0, 1, 1,
-1.840698, -1.005342, -2.32751, 0, 0, 0, 1, 1,
-1.819133, -0.3648676, -2.589086, 0, 0, 0, 1, 1,
-1.817427, 0.03600231, -1.295854, 0, 0, 0, 1, 1,
-1.779167, 0.7594556, -1.426685, 0, 0, 0, 1, 1,
-1.771529, -0.569813, -1.111117, 0, 0, 0, 1, 1,
-1.747679, 0.2823577, -0.6473407, 0, 0, 0, 1, 1,
-1.737577, -0.05943255, -0.8016655, 1, 1, 1, 1, 1,
-1.725857, 0.7717416, -0.9346944, 1, 1, 1, 1, 1,
-1.715149, 0.9800914, -0.6419429, 1, 1, 1, 1, 1,
-1.702874, 1.097072, -0.7884557, 1, 1, 1, 1, 1,
-1.687719, 0.3178163, -0.06631237, 1, 1, 1, 1, 1,
-1.686536, -0.09031402, -1.755127, 1, 1, 1, 1, 1,
-1.684734, 0.7027629, -1.791763, 1, 1, 1, 1, 1,
-1.677496, 0.1097447, 1.170943, 1, 1, 1, 1, 1,
-1.658123, -0.3256654, -2.335599, 1, 1, 1, 1, 1,
-1.656945, 0.6651251, -0.3121815, 1, 1, 1, 1, 1,
-1.651997, -0.7554901, -1.520447, 1, 1, 1, 1, 1,
-1.651434, -0.9962809, -3.703923, 1, 1, 1, 1, 1,
-1.6353, -1.391889, -3.789794, 1, 1, 1, 1, 1,
-1.632457, -1.165478, -1.310275, 1, 1, 1, 1, 1,
-1.630542, 0.2504748, 0.3460992, 1, 1, 1, 1, 1,
-1.622306, -0.7269836, -1.666845, 0, 0, 1, 1, 1,
-1.619951, -1.531045, -2.549086, 1, 0, 0, 1, 1,
-1.613473, 0.1710942, -1.41708, 1, 0, 0, 1, 1,
-1.608283, -0.3483936, -2.031815, 1, 0, 0, 1, 1,
-1.583005, -0.5242322, -3.051201, 1, 0, 0, 1, 1,
-1.582302, -1.461505, -2.983213, 1, 0, 0, 1, 1,
-1.572467, 1.616805, 0.09652384, 0, 0, 0, 1, 1,
-1.565547, 0.2987981, -2.32581, 0, 0, 0, 1, 1,
-1.560277, 0.4504909, -0.7972836, 0, 0, 0, 1, 1,
-1.544798, 1.071574, -1.040329, 0, 0, 0, 1, 1,
-1.542889, 0.06628896, -1.076835, 0, 0, 0, 1, 1,
-1.537057, 1.334638, 0.8189025, 0, 0, 0, 1, 1,
-1.531782, -0.2031458, -0.9769815, 0, 0, 0, 1, 1,
-1.509108, 0.1810297, -1.749079, 1, 1, 1, 1, 1,
-1.506269, -0.554311, -1.428148, 1, 1, 1, 1, 1,
-1.503852, -1.539953, -2.243664, 1, 1, 1, 1, 1,
-1.495982, -1.969455, -2.823928, 1, 1, 1, 1, 1,
-1.493031, 1.384667, -1.354663, 1, 1, 1, 1, 1,
-1.48653, 0.7080214, -0.7343164, 1, 1, 1, 1, 1,
-1.482026, -1.309975, -1.89396, 1, 1, 1, 1, 1,
-1.480755, 0.3725463, 1.280642, 1, 1, 1, 1, 1,
-1.477609, -0.2563856, -1.671081, 1, 1, 1, 1, 1,
-1.474797, -1.09848, -2.63065, 1, 1, 1, 1, 1,
-1.467263, -0.4765182, -2.097896, 1, 1, 1, 1, 1,
-1.452586, 0.6342158, -0.7192075, 1, 1, 1, 1, 1,
-1.452211, -1.516854, -2.360289, 1, 1, 1, 1, 1,
-1.441038, -0.5764475, -1.329659, 1, 1, 1, 1, 1,
-1.440294, -1.85473, -2.606728, 1, 1, 1, 1, 1,
-1.434301, -0.1900939, -0.1153838, 0, 0, 1, 1, 1,
-1.430219, -2.418914, -2.086771, 1, 0, 0, 1, 1,
-1.429178, 0.128104, -1.239555, 1, 0, 0, 1, 1,
-1.42827, 0.7972789, 0.8879761, 1, 0, 0, 1, 1,
-1.421826, -1.133038, -2.58419, 1, 0, 0, 1, 1,
-1.406907, -1.304764, -2.643939, 1, 0, 0, 1, 1,
-1.404515, 1.717186, -0.6204013, 0, 0, 0, 1, 1,
-1.400331, 0.2900608, -1.945623, 0, 0, 0, 1, 1,
-1.393667, 0.595938, -1.981719, 0, 0, 0, 1, 1,
-1.378367, -0.8806618, -0.5383227, 0, 0, 0, 1, 1,
-1.375364, -1.196962, -2.983905, 0, 0, 0, 1, 1,
-1.375287, -0.4842539, -1.678969, 0, 0, 0, 1, 1,
-1.373848, 2.127508, -0.2272523, 0, 0, 0, 1, 1,
-1.367534, 1.160676, -1.083448, 1, 1, 1, 1, 1,
-1.367323, 0.5165551, -1.156289, 1, 1, 1, 1, 1,
-1.366237, -1.238554, -2.333927, 1, 1, 1, 1, 1,
-1.358754, -0.4642444, -4.252167, 1, 1, 1, 1, 1,
-1.349939, 1.462754, -0.9260808, 1, 1, 1, 1, 1,
-1.347479, -1.188701, -2.989646, 1, 1, 1, 1, 1,
-1.346852, -0.3271798, -2.737538, 1, 1, 1, 1, 1,
-1.335974, -0.389246, -2.22506, 1, 1, 1, 1, 1,
-1.33344, -1.05889, -1.57408, 1, 1, 1, 1, 1,
-1.327577, -1.954688, -1.156643, 1, 1, 1, 1, 1,
-1.325797, 0.1237908, -1.457825, 1, 1, 1, 1, 1,
-1.324623, 0.6033891, -1.32759, 1, 1, 1, 1, 1,
-1.313287, -0.01120904, -1.688009, 1, 1, 1, 1, 1,
-1.302146, 1.398287, -1.247952, 1, 1, 1, 1, 1,
-1.300267, -1.513609, -3.071262, 1, 1, 1, 1, 1,
-1.274987, -0.3294042, -1.651433, 0, 0, 1, 1, 1,
-1.268526, 0.8170403, -1.58789, 1, 0, 0, 1, 1,
-1.24926, -0.2149682, -1.885288, 1, 0, 0, 1, 1,
-1.234781, -0.5832348, -3.377766, 1, 0, 0, 1, 1,
-1.234342, 2.083029, 0.4484302, 1, 0, 0, 1, 1,
-1.23013, 0.6628693, -0.9968174, 1, 0, 0, 1, 1,
-1.226343, 0.4044336, -1.481471, 0, 0, 0, 1, 1,
-1.225691, -0.03153868, -2.066473, 0, 0, 0, 1, 1,
-1.221389, 1.592684, -2.547472, 0, 0, 0, 1, 1,
-1.206196, 0.8590179, -1.353181, 0, 0, 0, 1, 1,
-1.199329, -0.4900631, -0.2835021, 0, 0, 0, 1, 1,
-1.192309, -0.6418708, -2.259515, 0, 0, 0, 1, 1,
-1.190599, -1.78014, -2.536143, 0, 0, 0, 1, 1,
-1.188583, 0.5708045, -2.778145, 1, 1, 1, 1, 1,
-1.181738, -2.063931, -3.084479, 1, 1, 1, 1, 1,
-1.171682, -0.2592987, -3.087656, 1, 1, 1, 1, 1,
-1.169655, -0.8720377, -1.03416, 1, 1, 1, 1, 1,
-1.167762, -0.2306753, -1.029856, 1, 1, 1, 1, 1,
-1.162372, 2.65817, 0.003411959, 1, 1, 1, 1, 1,
-1.130023, 1.43567, -2.999905, 1, 1, 1, 1, 1,
-1.12443, 0.5438065, 0.2721851, 1, 1, 1, 1, 1,
-1.122643, -0.9537142, -2.382517, 1, 1, 1, 1, 1,
-1.107513, -0.2701632, -2.858304, 1, 1, 1, 1, 1,
-1.103832, -0.3551575, -1.598773, 1, 1, 1, 1, 1,
-1.101359, 0.3207136, 0.5525697, 1, 1, 1, 1, 1,
-1.095713, 1.817461, 0.5372885, 1, 1, 1, 1, 1,
-1.082473, -2.736528, -3.034528, 1, 1, 1, 1, 1,
-1.081174, -1.61523, -3.901869, 1, 1, 1, 1, 1,
-1.074597, -0.212809, -1.29031, 0, 0, 1, 1, 1,
-1.068741, -1.479369, -3.255443, 1, 0, 0, 1, 1,
-1.063924, -0.009193905, -0.4467396, 1, 0, 0, 1, 1,
-1.059987, -0.7359766, -2.107807, 1, 0, 0, 1, 1,
-1.057689, -0.6528509, -1.581874, 1, 0, 0, 1, 1,
-1.057662, -0.05486779, -1.029566, 1, 0, 0, 1, 1,
-1.056127, 0.3882315, -0.967669, 0, 0, 0, 1, 1,
-1.054909, 0.1795538, -1.164988, 0, 0, 0, 1, 1,
-1.05441, -0.3605618, -3.16808, 0, 0, 0, 1, 1,
-1.054296, 0.06882799, -1.864814, 0, 0, 0, 1, 1,
-1.050506, -0.1348843, -0.2176879, 0, 0, 0, 1, 1,
-1.042193, -0.06420949, -0.4280407, 0, 0, 0, 1, 1,
-1.041062, 0.8773854, -0.8794803, 0, 0, 0, 1, 1,
-1.040376, -0.4578557, -2.109519, 1, 1, 1, 1, 1,
-1.039246, 0.384927, 0.631444, 1, 1, 1, 1, 1,
-1.036957, -0.6334683, -2.293186, 1, 1, 1, 1, 1,
-1.0277, 0.1272988, -3.638496, 1, 1, 1, 1, 1,
-1.024388, 1.757116, -1.036111, 1, 1, 1, 1, 1,
-1.023991, 0.5880886, -3.272704, 1, 1, 1, 1, 1,
-1.022769, -0.04584113, -2.327944, 1, 1, 1, 1, 1,
-1.022483, -0.1248486, -1.104711, 1, 1, 1, 1, 1,
-1.020055, -1.48437, -0.681263, 1, 1, 1, 1, 1,
-1.017473, -0.1950433, -3.35739, 1, 1, 1, 1, 1,
-1.015821, 0.6723198, -1.526165, 1, 1, 1, 1, 1,
-1.004389, 0.8546572, -0.6704367, 1, 1, 1, 1, 1,
-1.003608, -0.04040698, -2.226692, 1, 1, 1, 1, 1,
-1.001764, -0.6040519, -3.337993, 1, 1, 1, 1, 1,
-0.9952456, 1.470569, -1.0582, 1, 1, 1, 1, 1,
-0.9860063, -0.009188687, -2.786253, 0, 0, 1, 1, 1,
-0.9794474, 0.3082587, -0.1152589, 1, 0, 0, 1, 1,
-0.9644469, -1.519009, -2.06165, 1, 0, 0, 1, 1,
-0.9493659, 0.644962, -0.9455186, 1, 0, 0, 1, 1,
-0.9475121, 0.116195, -3.261233, 1, 0, 0, 1, 1,
-0.9464824, -0.1934021, -1.374117, 1, 0, 0, 1, 1,
-0.9463752, 0.02891578, -2.365513, 0, 0, 0, 1, 1,
-0.941021, 0.7068066, -2.046216, 0, 0, 0, 1, 1,
-0.9369661, 0.4503139, -1.155976, 0, 0, 0, 1, 1,
-0.9321298, -1.30058, -2.46372, 0, 0, 0, 1, 1,
-0.9313411, 0.9280195, -0.8556018, 0, 0, 0, 1, 1,
-0.9230148, 1.623702, 0.7033072, 0, 0, 0, 1, 1,
-0.9205161, 2.316569, -0.05816331, 0, 0, 0, 1, 1,
-0.9154779, 2.195261, 0.179384, 1, 1, 1, 1, 1,
-0.9083622, 0.3987161, -1.812999, 1, 1, 1, 1, 1,
-0.9025749, 0.6124869, -1.592555, 1, 1, 1, 1, 1,
-0.8984916, -0.7197328, -0.3353194, 1, 1, 1, 1, 1,
-0.8924291, -1.319137, -3.46612, 1, 1, 1, 1, 1,
-0.8917841, -0.5842844, -2.003177, 1, 1, 1, 1, 1,
-0.8867188, -0.9140766, -5.4526, 1, 1, 1, 1, 1,
-0.8775132, 1.343074, -0.6338388, 1, 1, 1, 1, 1,
-0.875575, -0.2597286, -2.532907, 1, 1, 1, 1, 1,
-0.8755361, -0.2782879, -0.4363701, 1, 1, 1, 1, 1,
-0.8753173, 0.6731907, -1.2627, 1, 1, 1, 1, 1,
-0.8647419, 1.063787, -1.005893, 1, 1, 1, 1, 1,
-0.8609449, 1.615375, 1.856523, 1, 1, 1, 1, 1,
-0.8606532, 0.5352172, -1.457138, 1, 1, 1, 1, 1,
-0.8593782, -0.7936748, -2.149112, 1, 1, 1, 1, 1,
-0.8593625, -1.654024, -3.056095, 0, 0, 1, 1, 1,
-0.8574723, -1.281272, -1.939424, 1, 0, 0, 1, 1,
-0.8548121, -1.928551, -5.831029, 1, 0, 0, 1, 1,
-0.8502407, 0.7582037, -0.785708, 1, 0, 0, 1, 1,
-0.8435605, -0.05653166, -1.23161, 1, 0, 0, 1, 1,
-0.8422337, 0.8317001, -1.575523, 1, 0, 0, 1, 1,
-0.8357432, -1.802583, -3.88922, 0, 0, 0, 1, 1,
-0.8308339, -0.1119295, -1.698243, 0, 0, 0, 1, 1,
-0.8246645, 0.737466, -2.073326, 0, 0, 0, 1, 1,
-0.8244814, 1.943375, -0.4149078, 0, 0, 0, 1, 1,
-0.8234329, 0.3855402, -1.471478, 0, 0, 0, 1, 1,
-0.82277, 0.9581744, -0.920691, 0, 0, 0, 1, 1,
-0.8214368, -1.44403, -1.965103, 0, 0, 0, 1, 1,
-0.8179262, -0.1112616, -2.631501, 1, 1, 1, 1, 1,
-0.8139356, -0.6763184, -3.023512, 1, 1, 1, 1, 1,
-0.8113882, -0.7273495, -2.528086, 1, 1, 1, 1, 1,
-0.8015324, 0.8019049, -1.720595, 1, 1, 1, 1, 1,
-0.7997614, -1.469671, -5.061267, 1, 1, 1, 1, 1,
-0.7943473, 2.141126, -0.8144963, 1, 1, 1, 1, 1,
-0.7940402, -0.5051578, -2.902387, 1, 1, 1, 1, 1,
-0.7894202, -1.932014, -2.611049, 1, 1, 1, 1, 1,
-0.7850187, 0.9383287, 0.09671018, 1, 1, 1, 1, 1,
-0.7825974, -1.016202, -1.664949, 1, 1, 1, 1, 1,
-0.77436, -0.6561186, -2.403386, 1, 1, 1, 1, 1,
-0.7732288, 1.05684, -0.576851, 1, 1, 1, 1, 1,
-0.7714907, 0.9602449, -1.118332, 1, 1, 1, 1, 1,
-0.7665172, -1.578378, -2.739282, 1, 1, 1, 1, 1,
-0.7654613, 0.3112438, 0.2357574, 1, 1, 1, 1, 1,
-0.7574955, 0.3182042, -1.0676, 0, 0, 1, 1, 1,
-0.7570243, -0.7520503, -2.299988, 1, 0, 0, 1, 1,
-0.7518631, -0.2318216, -0.9999915, 1, 0, 0, 1, 1,
-0.750961, 1.85706, 0.5158071, 1, 0, 0, 1, 1,
-0.7480136, -0.02449451, -2.446068, 1, 0, 0, 1, 1,
-0.7475502, 0.7645689, -1.866495, 1, 0, 0, 1, 1,
-0.7458856, 0.173541, -2.097159, 0, 0, 0, 1, 1,
-0.743318, 0.1987989, -0.9243238, 0, 0, 0, 1, 1,
-0.7422296, 0.5653289, -0.856996, 0, 0, 0, 1, 1,
-0.7421125, -0.3353451, -2.690459, 0, 0, 0, 1, 1,
-0.7373591, -0.1502546, 0.5703368, 0, 0, 0, 1, 1,
-0.7281796, -0.4745204, -4.009919, 0, 0, 0, 1, 1,
-0.7273431, 0.2504394, -1.897759, 0, 0, 0, 1, 1,
-0.7253878, 1.921757, -1.928424, 1, 1, 1, 1, 1,
-0.7226025, -0.07714523, 1.427461, 1, 1, 1, 1, 1,
-0.7221986, 0.9772004, -0.7850798, 1, 1, 1, 1, 1,
-0.7205892, -0.03147209, -0.3159715, 1, 1, 1, 1, 1,
-0.7193016, 0.5698788, -0.5918738, 1, 1, 1, 1, 1,
-0.7154688, 0.523344, -1.361377, 1, 1, 1, 1, 1,
-0.7061508, -1.988423, -2.817485, 1, 1, 1, 1, 1,
-0.7044113, 1.507197, -1.275647, 1, 1, 1, 1, 1,
-0.696985, 1.433623, -0.1286541, 1, 1, 1, 1, 1,
-0.6919021, 0.2490067, -1.859268, 1, 1, 1, 1, 1,
-0.6876923, 0.5313541, -1.546865, 1, 1, 1, 1, 1,
-0.6826938, 1.262895, 0.1066043, 1, 1, 1, 1, 1,
-0.6819004, 0.1956467, -1.770452, 1, 1, 1, 1, 1,
-0.6775804, 0.1927306, -1.928638, 1, 1, 1, 1, 1,
-0.6748168, -0.03776037, -2.081506, 1, 1, 1, 1, 1,
-0.6694707, -0.3787683, -3.198066, 0, 0, 1, 1, 1,
-0.6677346, 0.5088463, -0.8973965, 1, 0, 0, 1, 1,
-0.6615775, 0.6690408, 0.1398318, 1, 0, 0, 1, 1,
-0.660729, -0.2173385, -2.182849, 1, 0, 0, 1, 1,
-0.6550078, -0.2380506, -0.3392881, 1, 0, 0, 1, 1,
-0.6525187, -1.00702, -1.336437, 1, 0, 0, 1, 1,
-0.6517892, 0.0948794, -0.1005726, 0, 0, 0, 1, 1,
-0.6322164, -0.5431159, -2.501368, 0, 0, 0, 1, 1,
-0.626404, 1.077895, -0.009267404, 0, 0, 0, 1, 1,
-0.626004, 0.2136494, 1.943294, 0, 0, 0, 1, 1,
-0.6255191, -0.9433051, -2.020963, 0, 0, 0, 1, 1,
-0.6188588, -1.013042, -1.678443, 0, 0, 0, 1, 1,
-0.6186252, 2.792876, 1.130136, 0, 0, 0, 1, 1,
-0.6127576, -1.345417, -3.833795, 1, 1, 1, 1, 1,
-0.611379, -2.025591, -2.818304, 1, 1, 1, 1, 1,
-0.6066014, 0.7756243, -0.901566, 1, 1, 1, 1, 1,
-0.6060069, 0.7186772, -0.7284192, 1, 1, 1, 1, 1,
-0.6053057, 0.1999589, -1.202101, 1, 1, 1, 1, 1,
-0.6032571, 0.1317278, -0.350091, 1, 1, 1, 1, 1,
-0.6006178, -0.5441105, -3.296052, 1, 1, 1, 1, 1,
-0.5928296, 1.011568, -0.9081807, 1, 1, 1, 1, 1,
-0.5911543, 0.2091194, -0.8846471, 1, 1, 1, 1, 1,
-0.5887238, -0.8973595, -3.386793, 1, 1, 1, 1, 1,
-0.5832801, 0.8867155, -0.1806155, 1, 1, 1, 1, 1,
-0.5742649, -0.24906, -1.287676, 1, 1, 1, 1, 1,
-0.5731314, -0.5683942, -2.573151, 1, 1, 1, 1, 1,
-0.5718705, -2.051933, -2.825568, 1, 1, 1, 1, 1,
-0.5703807, -2.118908, -4.702341, 1, 1, 1, 1, 1,
-0.5699245, 0.178162, -0.2452261, 0, 0, 1, 1, 1,
-0.5681686, -1.12856, -1.169803, 1, 0, 0, 1, 1,
-0.5676297, 0.2492763, -1.999194, 1, 0, 0, 1, 1,
-0.5673983, -1.379716, -2.418355, 1, 0, 0, 1, 1,
-0.5659214, 0.7270285, -1.249737, 1, 0, 0, 1, 1,
-0.5648214, -1.919088, -3.295962, 1, 0, 0, 1, 1,
-0.5628949, 0.4951207, -0.8770878, 0, 0, 0, 1, 1,
-0.5621452, 1.457805, 0.4421815, 0, 0, 0, 1, 1,
-0.559991, 1.258498, -1.626837, 0, 0, 0, 1, 1,
-0.5558732, -0.6122658, -2.677262, 0, 0, 0, 1, 1,
-0.5523739, -0.01528444, -2.221054, 0, 0, 0, 1, 1,
-0.5504184, 1.549944, -0.9466338, 0, 0, 0, 1, 1,
-0.5486545, 1.050637, -1.062539, 0, 0, 0, 1, 1,
-0.5450828, 1.720236, -1.249912, 1, 1, 1, 1, 1,
-0.541308, 1.754064, 1.26184, 1, 1, 1, 1, 1,
-0.5357036, -0.9742465, -3.598724, 1, 1, 1, 1, 1,
-0.5324694, 0.2724586, -1.449908, 1, 1, 1, 1, 1,
-0.5306944, 2.685261, -0.6786057, 1, 1, 1, 1, 1,
-0.5304068, 1.253419, -1.662874, 1, 1, 1, 1, 1,
-0.5270928, 0.03069285, -0.6362237, 1, 1, 1, 1, 1,
-0.5203351, -0.1039826, -1.580713, 1, 1, 1, 1, 1,
-0.512929, -1.633668, -4.272959, 1, 1, 1, 1, 1,
-0.5111144, -0.09750266, -3.959178, 1, 1, 1, 1, 1,
-0.51062, 0.1767457, -0.2985576, 1, 1, 1, 1, 1,
-0.510522, 0.9699719, -0.820959, 1, 1, 1, 1, 1,
-0.5097209, -0.8103732, -1.024053, 1, 1, 1, 1, 1,
-0.5073274, -0.9590763, -3.996136, 1, 1, 1, 1, 1,
-0.5052865, 0.2754255, -2.460597, 1, 1, 1, 1, 1,
-0.5047675, -0.304679, -2.25971, 0, 0, 1, 1, 1,
-0.5034073, 0.107067, -1.516509, 1, 0, 0, 1, 1,
-0.5008067, 0.6749105, -0.1060482, 1, 0, 0, 1, 1,
-0.4917109, -0.838231, -3.258248, 1, 0, 0, 1, 1,
-0.4893014, -2.594451, -3.107028, 1, 0, 0, 1, 1,
-0.4787019, 0.1033205, -0.453743, 1, 0, 0, 1, 1,
-0.4708613, -0.8186233, -2.069922, 0, 0, 0, 1, 1,
-0.468133, 0.1675123, -1.660006, 0, 0, 0, 1, 1,
-0.4618121, 0.2938798, -0.9798004, 0, 0, 0, 1, 1,
-0.4615202, 0.7599327, -1.799405, 0, 0, 0, 1, 1,
-0.4609949, -2.179603, -2.980281, 0, 0, 0, 1, 1,
-0.4597167, -0.3896768, -3.127993, 0, 0, 0, 1, 1,
-0.4577038, -1.466515, -1.817617, 0, 0, 0, 1, 1,
-0.4567469, 0.5664106, 0.2485054, 1, 1, 1, 1, 1,
-0.4546697, 1.757025, -1.127182, 1, 1, 1, 1, 1,
-0.4434396, 1.023891, -1.045063, 1, 1, 1, 1, 1,
-0.4421037, 0.1827223, 0.08419849, 1, 1, 1, 1, 1,
-0.4382814, 0.05115443, -2.442017, 1, 1, 1, 1, 1,
-0.4368369, 1.620631, 0.6251134, 1, 1, 1, 1, 1,
-0.4350948, -1.473305, -1.405617, 1, 1, 1, 1, 1,
-0.4334564, -1.191893, -4.11856, 1, 1, 1, 1, 1,
-0.4333472, -1.38178, -1.824883, 1, 1, 1, 1, 1,
-0.4302245, -0.6624928, -2.861142, 1, 1, 1, 1, 1,
-0.4243925, -0.4441595, -4.080611, 1, 1, 1, 1, 1,
-0.4241573, -0.3143265, -2.314172, 1, 1, 1, 1, 1,
-0.4241401, -0.152405, -1.938741, 1, 1, 1, 1, 1,
-0.4224879, 1.224618, 0.7074965, 1, 1, 1, 1, 1,
-0.4200809, 0.6386403, -2.059778, 1, 1, 1, 1, 1,
-0.4192692, 0.2561271, -1.497186, 0, 0, 1, 1, 1,
-0.4174227, -1.144721, -3.616238, 1, 0, 0, 1, 1,
-0.4150888, 0.3276027, 0.3126334, 1, 0, 0, 1, 1,
-0.4110281, 0.137197, -1.780547, 1, 0, 0, 1, 1,
-0.4107693, -0.6625431, -3.341398, 1, 0, 0, 1, 1,
-0.410744, 1.48097, -2.420227, 1, 0, 0, 1, 1,
-0.4082931, 0.1885919, -1.326973, 0, 0, 0, 1, 1,
-0.4028226, 0.4493515, -1.483649, 0, 0, 0, 1, 1,
-0.4001005, 2.119613, -0.07054117, 0, 0, 0, 1, 1,
-0.3998368, -1.420293, -1.659836, 0, 0, 0, 1, 1,
-0.397357, 0.5745224, -0.3968907, 0, 0, 0, 1, 1,
-0.3957596, 1.04263, -0.6115862, 0, 0, 0, 1, 1,
-0.3948641, -0.9507031, -3.696755, 0, 0, 0, 1, 1,
-0.3929063, -0.9909503, -3.216281, 1, 1, 1, 1, 1,
-0.3910148, 2.418386, -0.1978733, 1, 1, 1, 1, 1,
-0.3887701, 0.03787875, -1.240821, 1, 1, 1, 1, 1,
-0.3885391, 2.315081, -3.081739, 1, 1, 1, 1, 1,
-0.3869357, -0.5092558, -3.440602, 1, 1, 1, 1, 1,
-0.3826195, 0.5467349, -2.237154, 1, 1, 1, 1, 1,
-0.3800085, -2.430301, -2.007899, 1, 1, 1, 1, 1,
-0.3771386, -2.201221, -3.375505, 1, 1, 1, 1, 1,
-0.3743195, -0.3688357, -1.82831, 1, 1, 1, 1, 1,
-0.3732879, -0.04119483, -2.478228, 1, 1, 1, 1, 1,
-0.3699889, 1.244613, 0.9165947, 1, 1, 1, 1, 1,
-0.364793, -0.04054389, -0.1285262, 1, 1, 1, 1, 1,
-0.361714, -0.8160518, -3.386681, 1, 1, 1, 1, 1,
-0.3599331, 0.304077, -0.6895019, 1, 1, 1, 1, 1,
-0.3597513, 1.416649, -0.6184538, 1, 1, 1, 1, 1,
-0.3597059, -0.261742, -1.496005, 0, 0, 1, 1, 1,
-0.3550216, 0.7807738, -0.3764634, 1, 0, 0, 1, 1,
-0.3520324, -2.071149, -2.372536, 1, 0, 0, 1, 1,
-0.3506661, 1.215885, 0.1989715, 1, 0, 0, 1, 1,
-0.3503094, -1.136907, -2.770895, 1, 0, 0, 1, 1,
-0.3490835, 0.03105557, -2.789743, 1, 0, 0, 1, 1,
-0.3346254, 1.955097, -0.826934, 0, 0, 0, 1, 1,
-0.3334311, 0.05213617, -1.267667, 0, 0, 0, 1, 1,
-0.3315163, -0.1887995, -3.057504, 0, 0, 0, 1, 1,
-0.3294726, 2.235367, 0.7843448, 0, 0, 0, 1, 1,
-0.3283299, -0.1258098, -3.348348, 0, 0, 0, 1, 1,
-0.3277878, -0.5115595, -1.633941, 0, 0, 0, 1, 1,
-0.3249177, -0.2908365, -3.323904, 0, 0, 0, 1, 1,
-0.3234516, 1.861597, -1.333076, 1, 1, 1, 1, 1,
-0.3231689, 1.349621, 1.321072, 1, 1, 1, 1, 1,
-0.3230448, -0.1759582, -2.120622, 1, 1, 1, 1, 1,
-0.321822, 0.5543265, 0.5483439, 1, 1, 1, 1, 1,
-0.3105018, 0.7001405, -1.183252, 1, 1, 1, 1, 1,
-0.3089993, -1.33757, -0.2790295, 1, 1, 1, 1, 1,
-0.3088508, -0.3547233, -2.930382, 1, 1, 1, 1, 1,
-0.3088206, 0.4702252, 0.3711561, 1, 1, 1, 1, 1,
-0.3057696, 0.7962241, -0.1930675, 1, 1, 1, 1, 1,
-0.3039418, 0.9291846, -0.6097237, 1, 1, 1, 1, 1,
-0.3026695, 0.8566536, 0.2651422, 1, 1, 1, 1, 1,
-0.2996415, -1.053335, -1.322011, 1, 1, 1, 1, 1,
-0.2946529, 1.016065, 1.447789, 1, 1, 1, 1, 1,
-0.2945749, 0.508371, 1.236398, 1, 1, 1, 1, 1,
-0.293293, 1.037714, -0.7118429, 1, 1, 1, 1, 1,
-0.2914608, -0.7732103, -3.118761, 0, 0, 1, 1, 1,
-0.2907979, 0.2413085, 0.8131642, 1, 0, 0, 1, 1,
-0.2905593, -0.1203834, -1.558591, 1, 0, 0, 1, 1,
-0.2847015, -0.2852397, -3.410743, 1, 0, 0, 1, 1,
-0.281767, 0.3014291, -1.15739, 1, 0, 0, 1, 1,
-0.2726569, 0.6260712, 0.2443393, 1, 0, 0, 1, 1,
-0.2710914, 1.173106, -1.519516, 0, 0, 0, 1, 1,
-0.2710434, -0.5036717, -2.504958, 0, 0, 0, 1, 1,
-0.2695959, -0.6579294, -3.154865, 0, 0, 0, 1, 1,
-0.2605367, 0.641471, 0.167918, 0, 0, 0, 1, 1,
-0.253058, -0.2333516, -3.532634, 0, 0, 0, 1, 1,
-0.2523066, -0.3915572, -0.6383229, 0, 0, 0, 1, 1,
-0.2520252, -0.3775269, -3.700239, 0, 0, 0, 1, 1,
-0.2502829, -1.003412, -2.278132, 1, 1, 1, 1, 1,
-0.2433308, 0.08428039, -2.823865, 1, 1, 1, 1, 1,
-0.2421861, -0.7651095, -2.933342, 1, 1, 1, 1, 1,
-0.2387309, -0.5728458, -3.323091, 1, 1, 1, 1, 1,
-0.2379342, 0.03198119, -0.8474908, 1, 1, 1, 1, 1,
-0.2361691, -1.486892, -4.206851, 1, 1, 1, 1, 1,
-0.2338095, 1.38648, -1.134237, 1, 1, 1, 1, 1,
-0.2289227, 0.8921294, -0.6821272, 1, 1, 1, 1, 1,
-0.2266377, 1.091524, -0.1986562, 1, 1, 1, 1, 1,
-0.2257446, 0.2721496, 0.6135607, 1, 1, 1, 1, 1,
-0.2137908, -0.536294, -2.37334, 1, 1, 1, 1, 1,
-0.2122476, -0.6742991, -3.6159, 1, 1, 1, 1, 1,
-0.2108988, -0.6804253, -2.336313, 1, 1, 1, 1, 1,
-0.2087483, -0.6938653, -1.772968, 1, 1, 1, 1, 1,
-0.2079093, 1.241128, -1.019572, 1, 1, 1, 1, 1,
-0.2031415, -0.7652726, -2.480447, 0, 0, 1, 1, 1,
-0.2021071, 0.1433169, -0.7222329, 1, 0, 0, 1, 1,
-0.196257, 0.6951388, 0.03043452, 1, 0, 0, 1, 1,
-0.1953691, 0.04664341, -0.7204979, 1, 0, 0, 1, 1,
-0.1905167, -0.08020058, -1.134861, 1, 0, 0, 1, 1,
-0.1888251, -0.746244, -2.135644, 1, 0, 0, 1, 1,
-0.1851257, 0.611205, -1.595137, 0, 0, 0, 1, 1,
-0.1815539, -0.5086775, -2.002734, 0, 0, 0, 1, 1,
-0.1794147, -0.580929, -2.617385, 0, 0, 0, 1, 1,
-0.1782652, -0.02997342, -1.895302, 0, 0, 0, 1, 1,
-0.1752655, -0.1818607, -3.997672, 0, 0, 0, 1, 1,
-0.1742324, 0.02427659, -1.550306, 0, 0, 0, 1, 1,
-0.1654395, 0.1653046, 1.12342, 0, 0, 0, 1, 1,
-0.1609782, -1.473506, -3.764771, 1, 1, 1, 1, 1,
-0.1601679, -0.5998628, -3.359073, 1, 1, 1, 1, 1,
-0.160142, 2.162705, 0.7997773, 1, 1, 1, 1, 1,
-0.1580547, -1.261543, -3.627649, 1, 1, 1, 1, 1,
-0.1565259, -0.9240633, -2.600405, 1, 1, 1, 1, 1,
-0.1554588, 0.1247835, 1.328826, 1, 1, 1, 1, 1,
-0.1553306, -0.6904929, -0.7288035, 1, 1, 1, 1, 1,
-0.1553302, -0.4937757, -0.9715004, 1, 1, 1, 1, 1,
-0.1495012, 0.06141592, -2.016313, 1, 1, 1, 1, 1,
-0.1416281, 0.5643905, 0.3047099, 1, 1, 1, 1, 1,
-0.1414028, 0.1407319, -0.08931157, 1, 1, 1, 1, 1,
-0.1318441, 0.1987918, -0.180695, 1, 1, 1, 1, 1,
-0.1309692, -0.2097786, -2.855716, 1, 1, 1, 1, 1,
-0.1307508, -0.5287735, -4.101891, 1, 1, 1, 1, 1,
-0.1285915, -0.6450705, -3.059906, 1, 1, 1, 1, 1,
-0.1282846, -0.02659178, -1.575821, 0, 0, 1, 1, 1,
-0.1215479, -0.527106, -1.74427, 1, 0, 0, 1, 1,
-0.1200018, 0.4441887, -0.5849794, 1, 0, 0, 1, 1,
-0.1081832, -1.499119, -1.730084, 1, 0, 0, 1, 1,
-0.1023879, -1.443087, -2.914215, 1, 0, 0, 1, 1,
-0.09863509, -0.1994239, -3.968187, 1, 0, 0, 1, 1,
-0.09778076, 0.237189, -1.697278, 0, 0, 0, 1, 1,
-0.09735537, 1.270596, 1.616999, 0, 0, 0, 1, 1,
-0.09421783, -0.508445, -1.108852, 0, 0, 0, 1, 1,
-0.09386346, -0.7440368, -3.761069, 0, 0, 0, 1, 1,
-0.08858777, -1.622548, -1.537887, 0, 0, 0, 1, 1,
-0.08321871, -0.3299577, -3.24369, 0, 0, 0, 1, 1,
-0.07753303, 0.2622223, 0.8098919, 0, 0, 0, 1, 1,
-0.07707119, 1.572697, -0.721022, 1, 1, 1, 1, 1,
-0.07519446, -0.4602406, -3.184017, 1, 1, 1, 1, 1,
-0.07260072, 0.3144431, 1.668813, 1, 1, 1, 1, 1,
-0.07092569, 0.2709727, 1.752579, 1, 1, 1, 1, 1,
-0.07028926, 0.08472082, 1.489807, 1, 1, 1, 1, 1,
-0.06589351, -0.4552877, -3.570939, 1, 1, 1, 1, 1,
-0.06012302, -0.9083335, -4.303216, 1, 1, 1, 1, 1,
-0.0580507, -0.02862012, -1.592597, 1, 1, 1, 1, 1,
-0.05713197, 0.7463517, 0.2191021, 1, 1, 1, 1, 1,
-0.05686687, -2.192752, -1.927109, 1, 1, 1, 1, 1,
-0.04349967, 1.806275, -1.840671, 1, 1, 1, 1, 1,
-0.04201183, 0.260436, -0.5102461, 1, 1, 1, 1, 1,
-0.02990123, 0.1300831, -1.630273, 1, 1, 1, 1, 1,
-0.02753649, -0.01407199, -3.031308, 1, 1, 1, 1, 1,
-0.0266884, -1.481143, -3.092999, 1, 1, 1, 1, 1,
-0.02469624, 0.8131898, 0.7338228, 0, 0, 1, 1, 1,
-0.02231635, -0.7688282, -3.045806, 1, 0, 0, 1, 1,
-0.02153775, 0.2798064, 0.5366795, 1, 0, 0, 1, 1,
-0.0163027, -0.02097485, -0.9117283, 1, 0, 0, 1, 1,
-0.01490494, 0.1176183, -0.3258735, 1, 0, 0, 1, 1,
-0.01413554, 0.5127866, 0.2389364, 1, 0, 0, 1, 1,
-0.004514174, 0.5245098, 0.3427517, 0, 0, 0, 1, 1,
0.000390144, -0.127344, 4.70602, 0, 0, 0, 1, 1,
0.001424421, -0.5636842, 3.050533, 0, 0, 0, 1, 1,
0.002659365, 0.6018176, 1.476963, 0, 0, 0, 1, 1,
0.002736027, -0.7645716, 3.802988, 0, 0, 0, 1, 1,
0.003648073, 0.8744769, -0.2938439, 0, 0, 0, 1, 1,
0.005961307, 1.133854, -0.565449, 0, 0, 0, 1, 1,
0.009121647, -0.3790095, 3.594626, 1, 1, 1, 1, 1,
0.009445324, 0.26851, -0.5251017, 1, 1, 1, 1, 1,
0.01277165, -0.05645906, 1.372972, 1, 1, 1, 1, 1,
0.01296911, 0.3339396, -1.141851, 1, 1, 1, 1, 1,
0.01417764, -0.7858437, 2.126609, 1, 1, 1, 1, 1,
0.01563353, 0.7237578, 0.6736928, 1, 1, 1, 1, 1,
0.01682347, 0.8783813, -0.286787, 1, 1, 1, 1, 1,
0.01988308, -0.1482688, 4.74917, 1, 1, 1, 1, 1,
0.023531, -0.1427211, 2.371197, 1, 1, 1, 1, 1,
0.02912991, 1.260076, 0.07862036, 1, 1, 1, 1, 1,
0.0317533, 1.231868, 0.7515491, 1, 1, 1, 1, 1,
0.03255056, -1.300827, 3.678832, 1, 1, 1, 1, 1,
0.03290129, 1.482618, 0.3656718, 1, 1, 1, 1, 1,
0.0360411, -0.7009106, 5.106295, 1, 1, 1, 1, 1,
0.03629798, -0.4286881, 3.36086, 1, 1, 1, 1, 1,
0.03671956, 0.1330576, -0.407818, 0, 0, 1, 1, 1,
0.03745348, 1.6567, 1.059036, 1, 0, 0, 1, 1,
0.03800999, 0.2934306, 0.002506415, 1, 0, 0, 1, 1,
0.04228356, 0.1474644, 0.7745003, 1, 0, 0, 1, 1,
0.04380234, -0.3443058, 2.65105, 1, 0, 0, 1, 1,
0.04394133, -0.8731802, 1.841794, 1, 0, 0, 1, 1,
0.04436645, 1.09625, 0.01337437, 0, 0, 0, 1, 1,
0.04762549, 0.3067067, -0.6119778, 0, 0, 0, 1, 1,
0.05433436, -1.213802, 2.072608, 0, 0, 0, 1, 1,
0.06376773, 0.0291882, 2.073572, 0, 0, 0, 1, 1,
0.06585205, -1.352872, 5.796247, 0, 0, 0, 1, 1,
0.06748216, 1.231554, 0.06134796, 0, 0, 0, 1, 1,
0.07316198, -0.3420602, 4.554135, 0, 0, 0, 1, 1,
0.07479569, 1.088347, 0.3975938, 1, 1, 1, 1, 1,
0.07785531, 0.9109092, -0.09846719, 1, 1, 1, 1, 1,
0.08190757, 3.338878, -0.8101049, 1, 1, 1, 1, 1,
0.09025127, 1.007082, 0.5272764, 1, 1, 1, 1, 1,
0.09055487, -1.506815, 3.573557, 1, 1, 1, 1, 1,
0.09945517, 0.2656859, 0.147757, 1, 1, 1, 1, 1,
0.09973177, 0.5533457, -0.9761854, 1, 1, 1, 1, 1,
0.1017158, -0.4129689, 3.021247, 1, 1, 1, 1, 1,
0.1023206, 0.9694273, 0.9273356, 1, 1, 1, 1, 1,
0.1059726, -0.5862782, 2.84559, 1, 1, 1, 1, 1,
0.1095177, 0.1053896, 1.573763, 1, 1, 1, 1, 1,
0.1127262, -1.664086, 1.977257, 1, 1, 1, 1, 1,
0.118632, -0.2903071, 3.934121, 1, 1, 1, 1, 1,
0.1209972, -1.045221, 3.424351, 1, 1, 1, 1, 1,
0.130368, -2.013297, 4.1772, 1, 1, 1, 1, 1,
0.130659, 1.110072, 1.161216, 0, 0, 1, 1, 1,
0.1349412, 0.8024011, 0.4518561, 1, 0, 0, 1, 1,
0.1355131, -0.2522776, 2.612905, 1, 0, 0, 1, 1,
0.1362739, -1.261204, 4.8928, 1, 0, 0, 1, 1,
0.1384619, -0.3186848, 5.200597, 1, 0, 0, 1, 1,
0.1416073, -0.3557225, 2.457006, 1, 0, 0, 1, 1,
0.1420134, 1.025685, 1.337059, 0, 0, 0, 1, 1,
0.1447843, -0.6282229, 5.483336, 0, 0, 0, 1, 1,
0.1481797, -0.585784, 3.687678, 0, 0, 0, 1, 1,
0.1545175, -0.4512608, 2.213135, 0, 0, 0, 1, 1,
0.1559768, -0.2082101, 2.981197, 0, 0, 0, 1, 1,
0.157516, 0.3752075, 0.5471082, 0, 0, 0, 1, 1,
0.1615091, 1.485788, -0.2154836, 0, 0, 0, 1, 1,
0.1623352, 0.3448012, 0.5389638, 1, 1, 1, 1, 1,
0.1647705, 0.4484736, 1.347647, 1, 1, 1, 1, 1,
0.1672058, 0.5050654, -0.6930525, 1, 1, 1, 1, 1,
0.1682116, -0.7863241, 1.952861, 1, 1, 1, 1, 1,
0.1693463, 0.3761826, 1.239947, 1, 1, 1, 1, 1,
0.1712333, 2.556543, -1.510934, 1, 1, 1, 1, 1,
0.1744316, 1.580371, 0.8594968, 1, 1, 1, 1, 1,
0.1749596, -1.525935, 3.532062, 1, 1, 1, 1, 1,
0.1765166, 0.2173439, 0.4815654, 1, 1, 1, 1, 1,
0.1777823, 0.4577321, 0.4356193, 1, 1, 1, 1, 1,
0.1784981, -0.7542321, 2.58306, 1, 1, 1, 1, 1,
0.1860692, 0.9224561, 0.1031313, 1, 1, 1, 1, 1,
0.1896982, 1.456771, 0.02026151, 1, 1, 1, 1, 1,
0.1926173, 1.993052, 0.2572716, 1, 1, 1, 1, 1,
0.1973997, 0.2971371, 1.855442, 1, 1, 1, 1, 1,
0.1975414, 1.459527, 1.113812, 0, 0, 1, 1, 1,
0.2025958, 1.361218, -0.004590213, 1, 0, 0, 1, 1,
0.2040204, 1.473425, -0.2095048, 1, 0, 0, 1, 1,
0.205601, 0.005237428, -1.542501, 1, 0, 0, 1, 1,
0.2105712, -0.720471, 1.944619, 1, 0, 0, 1, 1,
0.2143284, 1.857987, 1.709983, 1, 0, 0, 1, 1,
0.2152868, 2.752351, 0.3428715, 0, 0, 0, 1, 1,
0.2154831, -0.5309125, 2.74126, 0, 0, 0, 1, 1,
0.2208859, 0.4292536, 0.7648792, 0, 0, 0, 1, 1,
0.2273535, 0.5635983, 0.6648762, 0, 0, 0, 1, 1,
0.2280442, 1.828587, 0.9913688, 0, 0, 0, 1, 1,
0.2290151, 0.08190881, 2.122654, 0, 0, 0, 1, 1,
0.2299479, -0.6872231, 4.319843, 0, 0, 0, 1, 1,
0.230246, -0.4631557, 2.925225, 1, 1, 1, 1, 1,
0.2306976, -0.08501448, 1.533582, 1, 1, 1, 1, 1,
0.234062, 1.115864, -1.382755, 1, 1, 1, 1, 1,
0.2382289, 1.144546, -0.139012, 1, 1, 1, 1, 1,
0.2424328, 0.8461277, 0.4307571, 1, 1, 1, 1, 1,
0.2433375, 0.2978596, -0.9392628, 1, 1, 1, 1, 1,
0.2447667, 0.2285997, 0.1013694, 1, 1, 1, 1, 1,
0.2473089, 0.7438843, -0.9257958, 1, 1, 1, 1, 1,
0.2556008, 1.98689, 0.01251713, 1, 1, 1, 1, 1,
0.25624, -1.208124, 2.748794, 1, 1, 1, 1, 1,
0.2599712, 0.3052483, 2.487102, 1, 1, 1, 1, 1,
0.2606018, -0.7832851, 2.067464, 1, 1, 1, 1, 1,
0.2624556, -1.078769, 3.529801, 1, 1, 1, 1, 1,
0.2628773, -1.374267, 3.931215, 1, 1, 1, 1, 1,
0.2668021, 0.5090548, 0.1568399, 1, 1, 1, 1, 1,
0.2777203, -0.4502808, 2.84487, 0, 0, 1, 1, 1,
0.2802066, -1.187562, 3.515719, 1, 0, 0, 1, 1,
0.2852714, -0.8270879, 1.415034, 1, 0, 0, 1, 1,
0.2866826, 1.187642, -0.70924, 1, 0, 0, 1, 1,
0.2886286, -0.3589737, 2.391233, 1, 0, 0, 1, 1,
0.2888211, 0.8835019, 0.3390632, 1, 0, 0, 1, 1,
0.2902389, -0.1570675, 1.409388, 0, 0, 0, 1, 1,
0.2950455, -0.9522161, 3.740069, 0, 0, 0, 1, 1,
0.2959992, -0.09800995, 1.314456, 0, 0, 0, 1, 1,
0.2966308, -0.3414539, 1.981017, 0, 0, 0, 1, 1,
0.2968603, 0.4257874, 0.06208492, 0, 0, 0, 1, 1,
0.2975044, 1.644283, -1.105319, 0, 0, 0, 1, 1,
0.2980888, 1.779002, 0.9892077, 0, 0, 0, 1, 1,
0.3016582, -0.6925657, 2.124038, 1, 1, 1, 1, 1,
0.3065431, -0.1511605, 1.910314, 1, 1, 1, 1, 1,
0.3073522, 1.03852, -0.4643815, 1, 1, 1, 1, 1,
0.3079518, -0.7582191, 3.209189, 1, 1, 1, 1, 1,
0.3093855, 1.19426, 1.151218, 1, 1, 1, 1, 1,
0.3142136, 0.4380654, 1.542989, 1, 1, 1, 1, 1,
0.3152219, -2.630856, 1.597422, 1, 1, 1, 1, 1,
0.3156775, 1.057124, 0.6100353, 1, 1, 1, 1, 1,
0.3228241, -0.5354245, 1.212732, 1, 1, 1, 1, 1,
0.3253348, -0.558165, 2.333999, 1, 1, 1, 1, 1,
0.3268523, -0.8610905, 2.650483, 1, 1, 1, 1, 1,
0.332371, -0.1461838, 2.487554, 1, 1, 1, 1, 1,
0.3361559, -1.082711, 1.887724, 1, 1, 1, 1, 1,
0.3445506, 0.6068588, -0.6118492, 1, 1, 1, 1, 1,
0.3466155, -0.9781494, 4.208198, 1, 1, 1, 1, 1,
0.3500719, 0.4440338, -0.5140216, 0, 0, 1, 1, 1,
0.3533275, -0.03204482, 1.426995, 1, 0, 0, 1, 1,
0.3544639, 0.8989769, 0.02472155, 1, 0, 0, 1, 1,
0.3587064, -0.02597914, 2.384207, 1, 0, 0, 1, 1,
0.3588005, -0.2433311, 1.339203, 1, 0, 0, 1, 1,
0.3636779, 0.1039634, 1.601915, 1, 0, 0, 1, 1,
0.3644816, 1.072458, 1.103149, 0, 0, 0, 1, 1,
0.3688033, 1.449965, -1.355387, 0, 0, 0, 1, 1,
0.3718547, -0.5955688, 2.939512, 0, 0, 0, 1, 1,
0.3748353, 0.7466633, 1.47076, 0, 0, 0, 1, 1,
0.3753012, 0.4681308, 1.210573, 0, 0, 0, 1, 1,
0.3759187, -0.7604007, 1.757674, 0, 0, 0, 1, 1,
0.378884, -0.8773503, 3.255428, 0, 0, 0, 1, 1,
0.3850986, 0.4852922, 0.5634769, 1, 1, 1, 1, 1,
0.3882661, -1.107419, 2.71485, 1, 1, 1, 1, 1,
0.3894673, -1.475666, 1.764745, 1, 1, 1, 1, 1,
0.3901099, -0.4009737, 4.227234, 1, 1, 1, 1, 1,
0.3911695, 0.0391739, 1.11885, 1, 1, 1, 1, 1,
0.3939191, 1.11476, 0.08126779, 1, 1, 1, 1, 1,
0.3979182, 0.6556202, -1.296249, 1, 1, 1, 1, 1,
0.3991733, 0.03089998, 1.64811, 1, 1, 1, 1, 1,
0.4003458, 1.557057, -0.04236125, 1, 1, 1, 1, 1,
0.4020981, -0.6292765, 3.583981, 1, 1, 1, 1, 1,
0.4035898, 0.1077745, 2.393232, 1, 1, 1, 1, 1,
0.4041305, -0.01462955, 0.08579589, 1, 1, 1, 1, 1,
0.4054379, 0.9566914, 0.9478336, 1, 1, 1, 1, 1,
0.4062706, 1.070949, 0.7302814, 1, 1, 1, 1, 1,
0.4064302, 1.147417, -0.7064168, 1, 1, 1, 1, 1,
0.4070489, -0.4177522, 1.685159, 0, 0, 1, 1, 1,
0.4126441, 1.097647, -1.164882, 1, 0, 0, 1, 1,
0.4128796, -1.627642, 3.323087, 1, 0, 0, 1, 1,
0.4137808, 0.6345834, 0.6058289, 1, 0, 0, 1, 1,
0.4166545, 0.356702, 1.667703, 1, 0, 0, 1, 1,
0.4184294, -1.89191, 2.491491, 1, 0, 0, 1, 1,
0.4191744, 0.9189246, -0.3560597, 0, 0, 0, 1, 1,
0.4214216, 1.137674, 1.423073, 0, 0, 0, 1, 1,
0.4235775, 0.4897257, 0.8699279, 0, 0, 0, 1, 1,
0.4293959, -0.9053828, 2.531685, 0, 0, 0, 1, 1,
0.4343441, 1.949466, -1.397115, 0, 0, 0, 1, 1,
0.435641, -0.888613, 2.499779, 0, 0, 0, 1, 1,
0.4370512, -0.2331476, 1.729808, 0, 0, 0, 1, 1,
0.4373908, 0.3816683, 1.472382, 1, 1, 1, 1, 1,
0.4434919, 1.158087, 0.8745362, 1, 1, 1, 1, 1,
0.4435834, 0.7912851, 0.4581906, 1, 1, 1, 1, 1,
0.4454351, 0.7768633, 0.2258491, 1, 1, 1, 1, 1,
0.4490119, -0.1870339, 1.396406, 1, 1, 1, 1, 1,
0.4499198, 0.1052242, 1.57226, 1, 1, 1, 1, 1,
0.4499278, 0.04766629, 1.972203, 1, 1, 1, 1, 1,
0.4520276, 0.4494118, 1.524226, 1, 1, 1, 1, 1,
0.4532154, 1.316079, 0.7904375, 1, 1, 1, 1, 1,
0.4544396, 0.9335, 0.8354083, 1, 1, 1, 1, 1,
0.4551507, 0.2652, 1.042245, 1, 1, 1, 1, 1,
0.4552407, -0.3856358, 1.354241, 1, 1, 1, 1, 1,
0.4553162, -0.3079069, 3.334767, 1, 1, 1, 1, 1,
0.4564032, -0.03798074, 0.6449385, 1, 1, 1, 1, 1,
0.4564577, -2.234402, 2.855596, 1, 1, 1, 1, 1,
0.4620489, 1.011971, 2.324232, 0, 0, 1, 1, 1,
0.4623435, -0.271085, 2.788152, 1, 0, 0, 1, 1,
0.4666456, -1.892974, 2.508374, 1, 0, 0, 1, 1,
0.466734, -0.0544361, 0.1448996, 1, 0, 0, 1, 1,
0.4679468, -0.8226255, 2.471182, 1, 0, 0, 1, 1,
0.4693015, 2.427636, 1.107203, 1, 0, 0, 1, 1,
0.4694024, 1.220427, 0.1995182, 0, 0, 0, 1, 1,
0.4759568, 0.5084504, -1.136151, 0, 0, 0, 1, 1,
0.4774159, 0.3994807, -0.005485563, 0, 0, 0, 1, 1,
0.478557, -0.7598796, 2.829623, 0, 0, 0, 1, 1,
0.4810062, -0.7747976, 2.823716, 0, 0, 0, 1, 1,
0.4938207, -0.1998778, 0.9885097, 0, 0, 0, 1, 1,
0.4959518, 0.243007, 4.455073, 0, 0, 0, 1, 1,
0.4991213, 1.008047, 0.7362443, 1, 1, 1, 1, 1,
0.4999005, 0.04375372, 2.645807, 1, 1, 1, 1, 1,
0.5004756, 1.432282, -1.611157, 1, 1, 1, 1, 1,
0.5072312, 0.02595118, -0.2149795, 1, 1, 1, 1, 1,
0.5091266, -0.5416633, 4.040199, 1, 1, 1, 1, 1,
0.5104111, -1.386108, 3.438091, 1, 1, 1, 1, 1,
0.5169448, -1.628025, 4.086694, 1, 1, 1, 1, 1,
0.5200135, -0.2032221, 0.7661246, 1, 1, 1, 1, 1,
0.5214401, -0.2942126, 0.8167812, 1, 1, 1, 1, 1,
0.5241955, 0.3220793, -0.08420722, 1, 1, 1, 1, 1,
0.5254563, -0.08065604, 1.662188, 1, 1, 1, 1, 1,
0.5255091, -1.430312, 3.863881, 1, 1, 1, 1, 1,
0.5270173, 0.9533749, -2.012347, 1, 1, 1, 1, 1,
0.5281714, 0.8080264, 0.2333994, 1, 1, 1, 1, 1,
0.536332, 0.3864089, 0.1626645, 1, 1, 1, 1, 1,
0.5422499, -2.502925, 2.769175, 0, 0, 1, 1, 1,
0.5428932, 0.9333813, 1.567606, 1, 0, 0, 1, 1,
0.5457489, -0.5360641, 2.775779, 1, 0, 0, 1, 1,
0.5485526, 0.8532771, 0.7378939, 1, 0, 0, 1, 1,
0.549894, -0.9879549, 2.356679, 1, 0, 0, 1, 1,
0.5503534, -0.9839604, 3.040975, 1, 0, 0, 1, 1,
0.5511099, -1.441365, 4.635385, 0, 0, 0, 1, 1,
0.5531024, -1.31106, 3.984353, 0, 0, 0, 1, 1,
0.5547555, 0.04097762, 1.224757, 0, 0, 0, 1, 1,
0.5581065, 1.239778, -0.1478604, 0, 0, 0, 1, 1,
0.5637941, 0.684241, 0.01579783, 0, 0, 0, 1, 1,
0.5643321, 2.16793, 1.421672, 0, 0, 0, 1, 1,
0.5689611, 1.025939, -0.583344, 0, 0, 0, 1, 1,
0.5815026, -1.281569, 2.369727, 1, 1, 1, 1, 1,
0.5861675, -0.5944088, 2.915613, 1, 1, 1, 1, 1,
0.5867101, 0.08364066, 1.332, 1, 1, 1, 1, 1,
0.5886528, 0.1657643, 2.269916, 1, 1, 1, 1, 1,
0.5938578, 1.101763, 0.2030151, 1, 1, 1, 1, 1,
0.5956523, -0.8435467, 2.92412, 1, 1, 1, 1, 1,
0.5975676, 0.05195937, 2.959762, 1, 1, 1, 1, 1,
0.6065741, 0.949902, 1.163204, 1, 1, 1, 1, 1,
0.6200237, 2.101523, -0.6071643, 1, 1, 1, 1, 1,
0.621491, 1.239509, 1.588369, 1, 1, 1, 1, 1,
0.6291879, -0.4296388, 3.754278, 1, 1, 1, 1, 1,
0.6296502, 0.9586573, 1.418193, 1, 1, 1, 1, 1,
0.6297283, -0.4868386, 2.265336, 1, 1, 1, 1, 1,
0.629912, 0.08488653, 0.3040415, 1, 1, 1, 1, 1,
0.6301155, 0.4855407, 1.263026, 1, 1, 1, 1, 1,
0.6321147, 0.5370278, -0.9290457, 0, 0, 1, 1, 1,
0.639019, 0.2772018, -0.1703392, 1, 0, 0, 1, 1,
0.640863, 0.4124869, 2.758739, 1, 0, 0, 1, 1,
0.6454932, 1.329149, -0.7178884, 1, 0, 0, 1, 1,
0.6469623, -1.219258, 3.995522, 1, 0, 0, 1, 1,
0.6510033, -0.9341748, 2.818178, 1, 0, 0, 1, 1,
0.6540874, 0.3138413, 2.132734, 0, 0, 0, 1, 1,
0.6567768, 0.8277528, 1.213478, 0, 0, 0, 1, 1,
0.6572644, 0.9441068, -0.100913, 0, 0, 0, 1, 1,
0.6605902, 0.6287173, -1.279814, 0, 0, 0, 1, 1,
0.6645541, 0.3026391, 1.610956, 0, 0, 0, 1, 1,
0.6687632, 1.158143, -0.847489, 0, 0, 0, 1, 1,
0.6726415, 2.364927, 0.6269647, 0, 0, 0, 1, 1,
0.6786951, -0.4021694, 4.043743, 1, 1, 1, 1, 1,
0.6830407, -1.286784, 5.107131, 1, 1, 1, 1, 1,
0.6863962, -2.242223, 2.767784, 1, 1, 1, 1, 1,
0.6866666, -0.217398, 0.6334469, 1, 1, 1, 1, 1,
0.687892, 0.3323668, 2.059372, 1, 1, 1, 1, 1,
0.6879105, -0.1441983, 3.312939, 1, 1, 1, 1, 1,
0.6919337, 0.2973048, 2.093507, 1, 1, 1, 1, 1,
0.6937707, -0.1208077, 3.032597, 1, 1, 1, 1, 1,
0.6947153, 0.1724014, 0.09101394, 1, 1, 1, 1, 1,
0.6948498, -0.6785557, 4.510883, 1, 1, 1, 1, 1,
0.7002738, 1.13099, 2.840902, 1, 1, 1, 1, 1,
0.7003185, 0.2899214, 1.705461, 1, 1, 1, 1, 1,
0.7008681, -0.07973783, 1.358234, 1, 1, 1, 1, 1,
0.7052919, -0.6961483, 0.09469777, 1, 1, 1, 1, 1,
0.7174958, -1.301147, 2.86846, 1, 1, 1, 1, 1,
0.7204627, -0.2675366, 2.425518, 0, 0, 1, 1, 1,
0.7222459, 0.573307, 2.376828, 1, 0, 0, 1, 1,
0.7242945, -0.5222226, 0.8090626, 1, 0, 0, 1, 1,
0.7247624, 0.380942, 1.566957, 1, 0, 0, 1, 1,
0.7268168, -0.6818391, 2.126721, 1, 0, 0, 1, 1,
0.7394465, 0.3269, 2.063223, 1, 0, 0, 1, 1,
0.741469, 0.3310554, 1.487882, 0, 0, 0, 1, 1,
0.7438562, -0.1306065, 3.200118, 0, 0, 0, 1, 1,
0.7439401, 0.2281131, 1.607366, 0, 0, 0, 1, 1,
0.7452273, 0.2879815, 3.720469, 0, 0, 0, 1, 1,
0.758477, -1.362186, 3.045011, 0, 0, 0, 1, 1,
0.7638403, 0.6932722, 1.535416, 0, 0, 0, 1, 1,
0.7640259, 1.463863, -0.2296134, 0, 0, 0, 1, 1,
0.7681448, -0.9942615, 2.448462, 1, 1, 1, 1, 1,
0.7698418, -0.0390586, 2.273877, 1, 1, 1, 1, 1,
0.7717828, -2.108353, 2.120501, 1, 1, 1, 1, 1,
0.7721666, 1.941244, 2.337726, 1, 1, 1, 1, 1,
0.7756847, -0.4882014, 3.5565, 1, 1, 1, 1, 1,
0.7786917, -0.7686849, 0.4522256, 1, 1, 1, 1, 1,
0.7809887, 0.2363977, 1.402326, 1, 1, 1, 1, 1,
0.7814952, -0.150629, 0.4541635, 1, 1, 1, 1, 1,
0.7838403, 0.003918764, -0.1269988, 1, 1, 1, 1, 1,
0.78654, -0.3975498, 2.038672, 1, 1, 1, 1, 1,
0.7869245, 0.8405204, 1.094475, 1, 1, 1, 1, 1,
0.7939487, 0.6326465, 1.183541, 1, 1, 1, 1, 1,
0.7946174, -0.25082, 1.026876, 1, 1, 1, 1, 1,
0.8027772, 0.1980856, 1.884174, 1, 1, 1, 1, 1,
0.80386, -0.9673874, 1.390529, 1, 1, 1, 1, 1,
0.8062872, -0.2574288, 3.019848, 0, 0, 1, 1, 1,
0.8066844, -1.060962, 3.134693, 1, 0, 0, 1, 1,
0.8096293, 0.4128656, 3.211249, 1, 0, 0, 1, 1,
0.811138, -0.4147127, 2.897315, 1, 0, 0, 1, 1,
0.8126832, -0.1186339, 0.5775796, 1, 0, 0, 1, 1,
0.8166488, -0.7364179, 1.509286, 1, 0, 0, 1, 1,
0.8167378, -0.3767143, 1.042244, 0, 0, 0, 1, 1,
0.8225802, -0.8414499, 3.04903, 0, 0, 0, 1, 1,
0.825541, -1.185097, 3.957016, 0, 0, 0, 1, 1,
0.8261994, -0.4746563, 1.181613, 0, 0, 0, 1, 1,
0.8279408, 1.033501, 2.399008, 0, 0, 0, 1, 1,
0.8291924, 1.680297, -0.03583287, 0, 0, 0, 1, 1,
0.8357016, -0.4967759, 1.802022, 0, 0, 0, 1, 1,
0.8411423, -0.1146036, -0.1224513, 1, 1, 1, 1, 1,
0.841916, -2.101202, 5.182168, 1, 1, 1, 1, 1,
0.8421801, 0.8086686, 1.376399, 1, 1, 1, 1, 1,
0.8595406, 0.141477, 1.305668, 1, 1, 1, 1, 1,
0.8642365, -0.1203006, 2.415122, 1, 1, 1, 1, 1,
0.8671563, 0.1962961, 2.245672, 1, 1, 1, 1, 1,
0.8770382, -1.474534, 1.842618, 1, 1, 1, 1, 1,
0.8770665, 0.720899, 0.1515843, 1, 1, 1, 1, 1,
0.8806218, -0.7709928, 2.813508, 1, 1, 1, 1, 1,
0.8825585, 0.7050497, 0.9175859, 1, 1, 1, 1, 1,
0.8876044, -0.05219434, 3.012557, 1, 1, 1, 1, 1,
0.8927292, 0.03334501, -0.1483861, 1, 1, 1, 1, 1,
0.894805, -0.1904054, 2.835767, 1, 1, 1, 1, 1,
0.895601, 0.4410642, 1.904468, 1, 1, 1, 1, 1,
0.8984183, 1.270657, -0.5320103, 1, 1, 1, 1, 1,
0.9048972, 0.5038741, 1.095856, 0, 0, 1, 1, 1,
0.9064667, -0.02201445, 2.218934, 1, 0, 0, 1, 1,
0.9093335, -1.142591, 2.835625, 1, 0, 0, 1, 1,
0.9132553, -0.1150415, 2.639655, 1, 0, 0, 1, 1,
0.9137832, -1.446133, 3.765031, 1, 0, 0, 1, 1,
0.9286319, 0.709105, -0.734006, 1, 0, 0, 1, 1,
0.9398767, -1.022968, 4.157308, 0, 0, 0, 1, 1,
0.9444552, -1.278839, 2.800262, 0, 0, 0, 1, 1,
0.9480919, 0.4827376, 2.973354, 0, 0, 0, 1, 1,
0.9521583, 0.7633877, 0.9940996, 0, 0, 0, 1, 1,
0.9537354, 0.6090586, 1.070082, 0, 0, 0, 1, 1,
0.9573092, -1.878805, 2.818765, 0, 0, 0, 1, 1,
0.9652295, 0.5615746, 0.8115551, 0, 0, 0, 1, 1,
0.9670896, -0.5846265, 1.608493, 1, 1, 1, 1, 1,
0.967196, 1.18161, 0.5622938, 1, 1, 1, 1, 1,
0.9682572, 0.4701976, 1.725328, 1, 1, 1, 1, 1,
0.9712821, 0.03429232, -0.1898692, 1, 1, 1, 1, 1,
0.9726653, -0.2695458, 2.612804, 1, 1, 1, 1, 1,
0.9751473, -0.5738018, 3.527758, 1, 1, 1, 1, 1,
0.9919056, -0.07173867, -0.1823868, 1, 1, 1, 1, 1,
0.9921473, 1.054226, 0.2370447, 1, 1, 1, 1, 1,
0.993437, 1.143566, 1.979178, 1, 1, 1, 1, 1,
0.9955683, 0.2051682, 1.455333, 1, 1, 1, 1, 1,
0.9956978, -0.1687817, 2.586232, 1, 1, 1, 1, 1,
0.9977142, 0.3758572, 2.794097, 1, 1, 1, 1, 1,
0.9986226, 1.120494, 0.1066001, 1, 1, 1, 1, 1,
1.00498, -1.152361, 3.633471, 1, 1, 1, 1, 1,
1.009676, 0.1403774, 1.930995, 1, 1, 1, 1, 1,
1.009869, 0.2752991, 2.138561, 0, 0, 1, 1, 1,
1.011386, -0.7862646, 1.635656, 1, 0, 0, 1, 1,
1.013023, -2.967574, 3.458674, 1, 0, 0, 1, 1,
1.014979, 1.425631, 0.5930262, 1, 0, 0, 1, 1,
1.016755, 1.046949, 0.3600376, 1, 0, 0, 1, 1,
1.019054, 0.2139171, -1.886316, 1, 0, 0, 1, 1,
1.019808, 0.1747851, 2.24734, 0, 0, 0, 1, 1,
1.024982, -0.5652651, 3.865539, 0, 0, 0, 1, 1,
1.025501, -2.027067, 2.235402, 0, 0, 0, 1, 1,
1.025667, 0.7675961, 0.8927311, 0, 0, 0, 1, 1,
1.028455, 0.5367503, -0.02580062, 0, 0, 0, 1, 1,
1.033027, -1.042107, 0.9855756, 0, 0, 0, 1, 1,
1.0373, 1.181498, 0.5709657, 0, 0, 0, 1, 1,
1.049413, -0.1062004, 2.285158, 1, 1, 1, 1, 1,
1.051769, 1.681549, 0.1460382, 1, 1, 1, 1, 1,
1.060207, 0.4956673, 0.9415041, 1, 1, 1, 1, 1,
1.065273, 0.3778261, 1.944438, 1, 1, 1, 1, 1,
1.066385, 0.1876588, 0.6023164, 1, 1, 1, 1, 1,
1.072906, -1.534783, 1.377269, 1, 1, 1, 1, 1,
1.079341, -1.18441, 3.793618, 1, 1, 1, 1, 1,
1.080054, 0.1444283, 1.47825, 1, 1, 1, 1, 1,
1.087541, 2.397328, -1.570992, 1, 1, 1, 1, 1,
1.088492, -0.4856197, 2.054616, 1, 1, 1, 1, 1,
1.093348, -0.9872261, 0.9132577, 1, 1, 1, 1, 1,
1.094977, 0.8418524, 1.283334, 1, 1, 1, 1, 1,
1.095336, -2.795111, 3.315637, 1, 1, 1, 1, 1,
1.099125, -0.5295826, 2.14804, 1, 1, 1, 1, 1,
1.107595, 0.4383256, 1.470422, 1, 1, 1, 1, 1,
1.110817, 1.827031, 1.57007, 0, 0, 1, 1, 1,
1.117737, -0.7045166, 2.436736, 1, 0, 0, 1, 1,
1.12111, 0.8226756, 0.54572, 1, 0, 0, 1, 1,
1.130776, -0.04606524, 1.470266, 1, 0, 0, 1, 1,
1.132048, -1.791204, 1.144846, 1, 0, 0, 1, 1,
1.136779, 1.376546, -0.7574764, 1, 0, 0, 1, 1,
1.142734, -1.488149, 3.280384, 0, 0, 0, 1, 1,
1.144094, 1.45476, -1.374465, 0, 0, 0, 1, 1,
1.157757, 0.2570852, 0.3595099, 0, 0, 0, 1, 1,
1.157778, 0.1552255, 0.5107425, 0, 0, 0, 1, 1,
1.162112, 1.157402, -0.4367918, 0, 0, 0, 1, 1,
1.165688, -0.7735312, 2.481271, 0, 0, 0, 1, 1,
1.167326, 0.8579854, -0.1693367, 0, 0, 0, 1, 1,
1.191375, -0.02104178, 1.869082, 1, 1, 1, 1, 1,
1.194753, 0.7158411, 0.05801554, 1, 1, 1, 1, 1,
1.213854, 1.144356, -0.2251409, 1, 1, 1, 1, 1,
1.216646, 0.3041896, 0.2159615, 1, 1, 1, 1, 1,
1.228526, 0.4429074, 0.8495486, 1, 1, 1, 1, 1,
1.249445, -0.5375089, 0.9789092, 1, 1, 1, 1, 1,
1.253665, 0.893398, 0.5165015, 1, 1, 1, 1, 1,
1.254693, 0.2501791, 2.34202, 1, 1, 1, 1, 1,
1.263805, -1.236403, 3.460002, 1, 1, 1, 1, 1,
1.272141, -0.721257, 1.536231, 1, 1, 1, 1, 1,
1.27219, 2.099686, -0.705753, 1, 1, 1, 1, 1,
1.276232, -1.042622, 2.965596, 1, 1, 1, 1, 1,
1.280535, 0.07475936, 1.232968, 1, 1, 1, 1, 1,
1.284204, -2.396137, 1.945597, 1, 1, 1, 1, 1,
1.284799, -0.8863653, 3.246653, 1, 1, 1, 1, 1,
1.285871, -1.550951, 3.765503, 0, 0, 1, 1, 1,
1.287363, -1.366518, 3.119535, 1, 0, 0, 1, 1,
1.288144, 2.1065, 2.268773, 1, 0, 0, 1, 1,
1.297778, -0.4041183, 3.76132, 1, 0, 0, 1, 1,
1.307609, 0.960856, 1.489809, 1, 0, 0, 1, 1,
1.30861, 1.459324, 0.5351607, 1, 0, 0, 1, 1,
1.315319, -0.1198624, 3.373296, 0, 0, 0, 1, 1,
1.316571, 1.290988, 3.8299, 0, 0, 0, 1, 1,
1.322135, 1.26484, 0.5175727, 0, 0, 0, 1, 1,
1.326301, 1.169826, -1.219134, 0, 0, 0, 1, 1,
1.328396, 0.8798968, 0.7989805, 0, 0, 0, 1, 1,
1.330581, -2.108346, 2.096758, 0, 0, 0, 1, 1,
1.338283, -0.5414534, 1.125981, 0, 0, 0, 1, 1,
1.350519, -0.9660213, 2.504829, 1, 1, 1, 1, 1,
1.356323, -1.669663, 3.803477, 1, 1, 1, 1, 1,
1.364313, 0.5063694, 2.047843, 1, 1, 1, 1, 1,
1.371946, 0.07755291, 1.542529, 1, 1, 1, 1, 1,
1.389574, 1.023767, 2.856647, 1, 1, 1, 1, 1,
1.392118, -0.6678307, 4.082081, 1, 1, 1, 1, 1,
1.398461, -0.288734, 2.669382, 1, 1, 1, 1, 1,
1.399507, 0.03580608, 2.779098, 1, 1, 1, 1, 1,
1.403782, -1.070369, 1.660345, 1, 1, 1, 1, 1,
1.423752, -0.7860775, 1.438773, 1, 1, 1, 1, 1,
1.423907, -0.2906312, 1.429723, 1, 1, 1, 1, 1,
1.432454, -0.2424878, 0.7832573, 1, 1, 1, 1, 1,
1.447832, -1.236286, 3.56188, 1, 1, 1, 1, 1,
1.45108, 0.1114266, 1.926222, 1, 1, 1, 1, 1,
1.455603, 0.5134383, 1.559926, 1, 1, 1, 1, 1,
1.459197, -1.147778, 1.461711, 0, 0, 1, 1, 1,
1.45956, 1.210535, 0.9428431, 1, 0, 0, 1, 1,
1.471819, 1.352956, 0.1080047, 1, 0, 0, 1, 1,
1.482432, -0.7533079, 4.217297, 1, 0, 0, 1, 1,
1.491506, -0.09915877, 0.6420518, 1, 0, 0, 1, 1,
1.497466, -0.2824379, 0.714417, 1, 0, 0, 1, 1,
1.497916, -1.699986, 2.313966, 0, 0, 0, 1, 1,
1.502194, 1.193271, 1.070641, 0, 0, 0, 1, 1,
1.502856, -0.1335902, 2.030663, 0, 0, 0, 1, 1,
1.502973, -0.6109055, 0.3248463, 0, 0, 0, 1, 1,
1.515778, 1.416588, 0.02560018, 0, 0, 0, 1, 1,
1.516689, -0.2211372, 2.658504, 0, 0, 0, 1, 1,
1.519538, -0.3492981, 3.035204, 0, 0, 0, 1, 1,
1.527974, -0.645946, 2.072422, 1, 1, 1, 1, 1,
1.531264, -0.02902663, 0.6828833, 1, 1, 1, 1, 1,
1.533372, 0.924127, 2.497573, 1, 1, 1, 1, 1,
1.54187, -0.4046988, 1.603862, 1, 1, 1, 1, 1,
1.548537, -0.33215, 1.28404, 1, 1, 1, 1, 1,
1.553293, 1.211073, 2.005733, 1, 1, 1, 1, 1,
1.567953, -1.122345, 3.765082, 1, 1, 1, 1, 1,
1.573124, -0.08254176, -1.952947, 1, 1, 1, 1, 1,
1.597197, -1.053884, 1.555593, 1, 1, 1, 1, 1,
1.623328, -0.4944263, 1.031244, 1, 1, 1, 1, 1,
1.633826, 0.5371583, 2.022266, 1, 1, 1, 1, 1,
1.657628, -0.510003, 2.775012, 1, 1, 1, 1, 1,
1.657641, -0.223981, 1.876186, 1, 1, 1, 1, 1,
1.68525, 0.175983, 2.856158, 1, 1, 1, 1, 1,
1.686671, -1.52147, 1.289024, 1, 1, 1, 1, 1,
1.701924, 0.03689408, 1.931413, 0, 0, 1, 1, 1,
1.709929, 0.7398217, -0.2902132, 1, 0, 0, 1, 1,
1.711226, -0.5872527, 2.642245, 1, 0, 0, 1, 1,
1.714362, 0.5606956, 1.976094, 1, 0, 0, 1, 1,
1.735178, 0.450607, 0.8480766, 1, 0, 0, 1, 1,
1.749708, 1.030658, 0.8844339, 1, 0, 0, 1, 1,
1.754641, 0.6913952, 0.4444897, 0, 0, 0, 1, 1,
1.769861, -0.6353096, 0.5934092, 0, 0, 0, 1, 1,
1.781438, 1.85288, 0.1389137, 0, 0, 0, 1, 1,
1.807371, -1.287441, 1.848746, 0, 0, 0, 1, 1,
1.818624, 0.1513181, 2.312076, 0, 0, 0, 1, 1,
1.822353, -0.7850401, 3.132088, 0, 0, 0, 1, 1,
1.82415, 1.018923, -0.4990968, 0, 0, 0, 1, 1,
1.826404, 1.811126, 0.7785118, 1, 1, 1, 1, 1,
1.831715, -0.1120332, 3.245363, 1, 1, 1, 1, 1,
1.832778, 0.1539715, 1.433958, 1, 1, 1, 1, 1,
1.841583, -0.4322892, 1.658997, 1, 1, 1, 1, 1,
1.86422, 1.997388, 0.322398, 1, 1, 1, 1, 1,
1.87517, 0.5245194, 2.043653, 1, 1, 1, 1, 1,
1.910768, -0.1071889, 1.823647, 1, 1, 1, 1, 1,
1.911844, -0.7736338, 3.386773, 1, 1, 1, 1, 1,
1.923681, 1.372167, 1.009838, 1, 1, 1, 1, 1,
1.939919, 2.058362, 1.138617, 1, 1, 1, 1, 1,
1.962993, -0.08942813, 0.9813839, 1, 1, 1, 1, 1,
1.983346, -1.468716, 3.937858, 1, 1, 1, 1, 1,
2.005787, -0.03690922, 3.168258, 1, 1, 1, 1, 1,
2.006191, 1.509874, 1.830255, 1, 1, 1, 1, 1,
2.008837, 0.0664852, 2.640141, 1, 1, 1, 1, 1,
2.044255, 1.224567, 0.6456222, 0, 0, 1, 1, 1,
2.077214, 1.157542, 1.347261, 1, 0, 0, 1, 1,
2.107996, 1.421223, 2.412194, 1, 0, 0, 1, 1,
2.133592, 1.332065, 1.065706, 1, 0, 0, 1, 1,
2.189964, 0.385188, 2.324827, 1, 0, 0, 1, 1,
2.206474, 0.2712786, 1.07695, 1, 0, 0, 1, 1,
2.22083, -0.32383, 2.143968, 0, 0, 0, 1, 1,
2.242564, 1.831246, 1.223207, 0, 0, 0, 1, 1,
2.244997, 0.3411762, 3.131551, 0, 0, 0, 1, 1,
2.278664, 1.380094, -0.01714607, 0, 0, 0, 1, 1,
2.298605, 1.623574, 2.944466, 0, 0, 0, 1, 1,
2.379948, -0.377417, 1.007435, 0, 0, 0, 1, 1,
2.433338, 0.24034, 1.115848, 0, 0, 0, 1, 1,
2.568914, -0.298449, 3.36451, 1, 1, 1, 1, 1,
2.667143, 0.9784147, 0.4701444, 1, 1, 1, 1, 1,
2.701151, -0.8167212, 1.981276, 1, 1, 1, 1, 1,
2.730676, 0.6308857, 1.347411, 1, 1, 1, 1, 1,
2.958891, -0.05899933, 3.155148, 1, 1, 1, 1, 1,
3.027038, -0.1609823, 1.575346, 1, 1, 1, 1, 1,
3.090066, -0.5430318, 3.218558, 1, 1, 1, 1, 1
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
var radius = 9.980341;
var distance = 35.05552;
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
mvMatrix.translate( 0.2279253, -0.1856519, 0.0173912 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05552);
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
