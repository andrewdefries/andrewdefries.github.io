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
-3.126398, -1.336572, -2.034306, 1, 0, 0, 1,
-2.696121, -0.2651023, -0.7986919, 1, 0.007843138, 0, 1,
-2.664685, -0.2338361, -2.258704, 1, 0.01176471, 0, 1,
-2.509846, 0.7103983, -1.695944, 1, 0.01960784, 0, 1,
-2.465739, -0.04850173, -1.168059, 1, 0.02352941, 0, 1,
-2.434677, -0.5834287, -1.185815, 1, 0.03137255, 0, 1,
-2.377559, 0.4976988, 0.6239684, 1, 0.03529412, 0, 1,
-2.362206, -0.3682826, -3.761329, 1, 0.04313726, 0, 1,
-2.358288, 1.589805, -1.145953, 1, 0.04705882, 0, 1,
-2.354268, 1.381364, -2.442738, 1, 0.05490196, 0, 1,
-2.307637, 0.08235589, -0.5177434, 1, 0.05882353, 0, 1,
-2.270997, 0.5245482, -1.95742, 1, 0.06666667, 0, 1,
-2.263129, -0.2474197, -2.271918, 1, 0.07058824, 0, 1,
-2.225723, -0.9730668, -1.241857, 1, 0.07843138, 0, 1,
-2.211153, -1.000355, -2.583908, 1, 0.08235294, 0, 1,
-2.164885, 0.5258583, -0.9177594, 1, 0.09019608, 0, 1,
-2.119719, -0.5691733, -2.129023, 1, 0.09411765, 0, 1,
-2.110773, -1.710606, -3.80127, 1, 0.1019608, 0, 1,
-2.088464, -0.811452, -2.288445, 1, 0.1098039, 0, 1,
-2.085676, 0.4845604, -1.432502, 1, 0.1137255, 0, 1,
-2.050701, -1.73376, -2.187486, 1, 0.1215686, 0, 1,
-2.050003, -0.01868632, -2.446735, 1, 0.1254902, 0, 1,
-2.043055, 0.8355494, 0.1955261, 1, 0.1333333, 0, 1,
-2.035795, 0.5546402, -2.563363, 1, 0.1372549, 0, 1,
-2.034845, 1.057003, 0.076527, 1, 0.145098, 0, 1,
-2.020722, -0.4940145, -0.2266946, 1, 0.1490196, 0, 1,
-2.008868, -1.254842, -3.858043, 1, 0.1568628, 0, 1,
-1.997977, -1.48367, -3.37038, 1, 0.1607843, 0, 1,
-1.962218, -1.065018, -2.779829, 1, 0.1686275, 0, 1,
-1.94236, 0.2523732, -1.258597, 1, 0.172549, 0, 1,
-1.916241, 1.377793, 0.2549256, 1, 0.1803922, 0, 1,
-1.899971, -0.8078935, -2.643366, 1, 0.1843137, 0, 1,
-1.878152, -1.718315, -3.392945, 1, 0.1921569, 0, 1,
-1.824082, 0.4671169, -1.80285, 1, 0.1960784, 0, 1,
-1.800337, -0.769142, -2.547018, 1, 0.2039216, 0, 1,
-1.793631, -0.231969, -2.131583, 1, 0.2117647, 0, 1,
-1.778723, -0.6548933, -2.543087, 1, 0.2156863, 0, 1,
-1.756421, -0.4092711, -2.107438, 1, 0.2235294, 0, 1,
-1.752507, 1.978283, -0.41391, 1, 0.227451, 0, 1,
-1.751282, -0.3674627, -2.052927, 1, 0.2352941, 0, 1,
-1.721628, -0.05642401, -1.909028, 1, 0.2392157, 0, 1,
-1.709664, -0.7099079, 0.6052021, 1, 0.2470588, 0, 1,
-1.695467, -0.8650435, -2.978393, 1, 0.2509804, 0, 1,
-1.684977, -0.6142873, -1.415917, 1, 0.2588235, 0, 1,
-1.674714, 1.211381, -1.706666, 1, 0.2627451, 0, 1,
-1.664878, 0.4684918, -0.590941, 1, 0.2705882, 0, 1,
-1.640664, 0.711728, -2.081233, 1, 0.2745098, 0, 1,
-1.634477, -0.3732903, -0.2125469, 1, 0.282353, 0, 1,
-1.631763, 1.213841, -2.147044, 1, 0.2862745, 0, 1,
-1.612608, -1.229938, -0.3056581, 1, 0.2941177, 0, 1,
-1.611649, 2.00624, 0.1940369, 1, 0.3019608, 0, 1,
-1.607047, 0.07508215, -1.709833, 1, 0.3058824, 0, 1,
-1.604587, -1.170115, -1.83217, 1, 0.3137255, 0, 1,
-1.597671, -0.6601226, -1.800743, 1, 0.3176471, 0, 1,
-1.587043, -0.4925231, -2.992296, 1, 0.3254902, 0, 1,
-1.585842, 1.90831, 0.5375369, 1, 0.3294118, 0, 1,
-1.564114, -1.111032, -0.2676196, 1, 0.3372549, 0, 1,
-1.553371, 0.397984, 0.1765367, 1, 0.3411765, 0, 1,
-1.549927, 1.399884, -0.8390384, 1, 0.3490196, 0, 1,
-1.542774, 1.241233, -1.238016, 1, 0.3529412, 0, 1,
-1.537221, -0.79338, -1.425461, 1, 0.3607843, 0, 1,
-1.535678, 0.5049975, -2.261747, 1, 0.3647059, 0, 1,
-1.523601, -0.2629534, -1.485559, 1, 0.372549, 0, 1,
-1.513634, -0.5001671, -3.384835, 1, 0.3764706, 0, 1,
-1.509763, -1.098408, -2.897405, 1, 0.3843137, 0, 1,
-1.507829, -0.4272656, -2.689125, 1, 0.3882353, 0, 1,
-1.505497, -0.975007, -2.870947, 1, 0.3960784, 0, 1,
-1.498753, -0.4758473, -1.84061, 1, 0.4039216, 0, 1,
-1.492045, 1.794939, -1.524284, 1, 0.4078431, 0, 1,
-1.4899, -0.3935093, -1.086073, 1, 0.4156863, 0, 1,
-1.487169, 0.4540981, -0.8377286, 1, 0.4196078, 0, 1,
-1.48355, 1.867223, -0.6117541, 1, 0.427451, 0, 1,
-1.482532, -1.462012, -3.376089, 1, 0.4313726, 0, 1,
-1.44379, -1.426069, -3.200752, 1, 0.4392157, 0, 1,
-1.433281, -0.657103, -1.772182, 1, 0.4431373, 0, 1,
-1.433215, 1.238333, -0.2343928, 1, 0.4509804, 0, 1,
-1.432978, -0.5472364, -2.221365, 1, 0.454902, 0, 1,
-1.430315, 0.1072356, -1.875936, 1, 0.4627451, 0, 1,
-1.423319, 1.115252, -2.848504, 1, 0.4666667, 0, 1,
-1.413864, -2.369033, -2.770467, 1, 0.4745098, 0, 1,
-1.406948, -1.225138, -2.622585, 1, 0.4784314, 0, 1,
-1.382196, 1.693478, -1.907205, 1, 0.4862745, 0, 1,
-1.380371, 0.5905799, -1.383757, 1, 0.4901961, 0, 1,
-1.374043, 0.7571384, -1.107263, 1, 0.4980392, 0, 1,
-1.373023, -0.7691638, -2.972947, 1, 0.5058824, 0, 1,
-1.372163, -0.3909595, -0.6093009, 1, 0.509804, 0, 1,
-1.368272, 0.8704168, -0.8290563, 1, 0.5176471, 0, 1,
-1.355311, -0.3202851, -2.519678, 1, 0.5215687, 0, 1,
-1.34926, -0.9452708, -3.881806, 1, 0.5294118, 0, 1,
-1.331767, 0.07109552, -2.073647, 1, 0.5333334, 0, 1,
-1.309756, -0.5893968, -2.791441, 1, 0.5411765, 0, 1,
-1.305535, -0.4520783, -0.9332216, 1, 0.5450981, 0, 1,
-1.300467, 0.04647762, -1.752016, 1, 0.5529412, 0, 1,
-1.293473, -1.216533, -2.928315, 1, 0.5568628, 0, 1,
-1.280195, 1.37362, -0.297763, 1, 0.5647059, 0, 1,
-1.271801, -0.6448342, -2.637699, 1, 0.5686275, 0, 1,
-1.265512, 1.276013, 0.02513866, 1, 0.5764706, 0, 1,
-1.255939, 1.054185, -0.007909024, 1, 0.5803922, 0, 1,
-1.254226, 0.7850728, -0.7393208, 1, 0.5882353, 0, 1,
-1.246752, 0.8212695, -1.939811, 1, 0.5921569, 0, 1,
-1.227525, 0.1383342, -2.345425, 1, 0.6, 0, 1,
-1.219378, -1.322558, -1.800334, 1, 0.6078432, 0, 1,
-1.217161, -0.0864836, -1.945855, 1, 0.6117647, 0, 1,
-1.212256, 0.1113887, 0.003903472, 1, 0.6196079, 0, 1,
-1.208992, 2.321402, -1.048887, 1, 0.6235294, 0, 1,
-1.196743, 0.787025, -1.167986, 1, 0.6313726, 0, 1,
-1.195813, 1.193179, -0.2498419, 1, 0.6352941, 0, 1,
-1.179312, 1.286852, -0.5063295, 1, 0.6431373, 0, 1,
-1.176265, 1.03552, -0.835192, 1, 0.6470588, 0, 1,
-1.169278, 0.2699786, -1.498517, 1, 0.654902, 0, 1,
-1.169132, 0.2566794, -0.8396167, 1, 0.6588235, 0, 1,
-1.160247, -0.6347172, -0.8843981, 1, 0.6666667, 0, 1,
-1.160044, 0.9772361, -0.1059734, 1, 0.6705883, 0, 1,
-1.145314, -0.04114545, -2.946884, 1, 0.6784314, 0, 1,
-1.142876, 0.4167042, -0.5081712, 1, 0.682353, 0, 1,
-1.142856, 1.512009, -1.375672, 1, 0.6901961, 0, 1,
-1.131411, -1.018959, -0.09919775, 1, 0.6941177, 0, 1,
-1.129438, -0.714649, -0.9007097, 1, 0.7019608, 0, 1,
-1.125353, -0.1969849, -3.471783, 1, 0.7098039, 0, 1,
-1.11957, -1.45954, -3.129243, 1, 0.7137255, 0, 1,
-1.118856, 2.046288, 0.4755163, 1, 0.7215686, 0, 1,
-1.118725, -0.7435428, -0.6315654, 1, 0.7254902, 0, 1,
-1.099367, 0.5897393, -0.4991086, 1, 0.7333333, 0, 1,
-1.09693, -1.408073, -2.012341, 1, 0.7372549, 0, 1,
-1.089259, 0.05892547, -1.634384, 1, 0.7450981, 0, 1,
-1.087994, -1.546672, -3.731489, 1, 0.7490196, 0, 1,
-1.087772, 0.7421218, -1.217526, 1, 0.7568628, 0, 1,
-1.080561, 1.546852, -0.2643344, 1, 0.7607843, 0, 1,
-1.078434, 0.5233271, -2.458591, 1, 0.7686275, 0, 1,
-1.06304, 1.918671, 0.6591642, 1, 0.772549, 0, 1,
-1.060445, 0.04191241, -1.327993, 1, 0.7803922, 0, 1,
-1.048453, 0.9480948, -0.7838085, 1, 0.7843137, 0, 1,
-1.047581, 0.2518876, -0.3939705, 1, 0.7921569, 0, 1,
-1.04532, 0.473178, -2.902961, 1, 0.7960784, 0, 1,
-1.039427, 0.2401656, -1.580842, 1, 0.8039216, 0, 1,
-1.03629, 0.129882, 0.3198376, 1, 0.8117647, 0, 1,
-1.035115, 1.437855, 0.6641129, 1, 0.8156863, 0, 1,
-1.031682, -0.3534809, -1.947187, 1, 0.8235294, 0, 1,
-1.031015, 0.7515427, -0.4150615, 1, 0.827451, 0, 1,
-1.029684, 1.295037, -1.521621, 1, 0.8352941, 0, 1,
-1.028346, 1.054882, -0.9822797, 1, 0.8392157, 0, 1,
-1.027688, 0.07833304, -0.5982843, 1, 0.8470588, 0, 1,
-1.025066, -1.128682, -4.987752, 1, 0.8509804, 0, 1,
-1.019157, 0.5763229, -1.059938, 1, 0.8588235, 0, 1,
-1.016761, 2.052293, 0.3603262, 1, 0.8627451, 0, 1,
-1.014975, -1.027109, -1.751336, 1, 0.8705882, 0, 1,
-1.013626, -0.5039145, -3.095847, 1, 0.8745098, 0, 1,
-1.004627, 1.459049, -0.5351763, 1, 0.8823529, 0, 1,
-1.004442, 0.7769057, -0.5400804, 1, 0.8862745, 0, 1,
-0.9993544, -0.2394759, -3.39751, 1, 0.8941177, 0, 1,
-0.9982644, 0.1135873, -2.363043, 1, 0.8980392, 0, 1,
-0.998041, -1.866712, -3.459748, 1, 0.9058824, 0, 1,
-0.9957545, -1.065779, -1.840239, 1, 0.9137255, 0, 1,
-0.9928883, 0.5451698, -0.4940611, 1, 0.9176471, 0, 1,
-0.9864646, 0.7640526, -1.238367, 1, 0.9254902, 0, 1,
-0.9842802, 1.1707, 0.305412, 1, 0.9294118, 0, 1,
-0.9840501, 0.4457845, -1.488936, 1, 0.9372549, 0, 1,
-0.9833275, -0.9832464, -2.211715, 1, 0.9411765, 0, 1,
-0.9828885, 0.9201977, -1.642599, 1, 0.9490196, 0, 1,
-0.9741223, 1.347681, -1.79402, 1, 0.9529412, 0, 1,
-0.9687474, 0.9189613, 0.347878, 1, 0.9607843, 0, 1,
-0.9520081, 0.0727282, -0.6203814, 1, 0.9647059, 0, 1,
-0.9493791, -0.5181138, -2.700927, 1, 0.972549, 0, 1,
-0.945089, -0.253521, -2.239511, 1, 0.9764706, 0, 1,
-0.9403821, -0.5994161, -2.980304, 1, 0.9843137, 0, 1,
-0.936296, 0.4014516, -2.443736, 1, 0.9882353, 0, 1,
-0.9355887, -2.078304, -3.653494, 1, 0.9960784, 0, 1,
-0.9304467, 1.512175, -1.115756, 0.9960784, 1, 0, 1,
-0.9291033, 0.418201, -2.909161, 0.9921569, 1, 0, 1,
-0.9283039, 0.1158878, -2.155407, 0.9843137, 1, 0, 1,
-0.9196274, 0.6723881, 0.6442595, 0.9803922, 1, 0, 1,
-0.9188765, 1.211079, -1.357342, 0.972549, 1, 0, 1,
-0.917938, -0.6648676, -2.365839, 0.9686275, 1, 0, 1,
-0.9163405, -1.533513, -3.38329, 0.9607843, 1, 0, 1,
-0.9063662, 0.1606334, -1.026922, 0.9568627, 1, 0, 1,
-0.9045601, 1.673135, -0.567256, 0.9490196, 1, 0, 1,
-0.8993656, 1.784855, -1.065664, 0.945098, 1, 0, 1,
-0.8927476, -1.379013, -4.423275, 0.9372549, 1, 0, 1,
-0.8905289, -0.2556431, -1.380638, 0.9333333, 1, 0, 1,
-0.881056, -0.3934166, -2.655305, 0.9254902, 1, 0, 1,
-0.8772869, 1.064974, 0.4297443, 0.9215686, 1, 0, 1,
-0.8699381, 0.2309268, -0.05014082, 0.9137255, 1, 0, 1,
-0.8671259, 3.230272, 0.2227295, 0.9098039, 1, 0, 1,
-0.8659642, -0.3903963, -2.490656, 0.9019608, 1, 0, 1,
-0.8583084, -0.7998563, -3.067687, 0.8941177, 1, 0, 1,
-0.8566059, 1.207261, -0.5420171, 0.8901961, 1, 0, 1,
-0.8532926, 2.501413, -1.234285, 0.8823529, 1, 0, 1,
-0.8506668, 0.0880791, -2.120374, 0.8784314, 1, 0, 1,
-0.8449693, 1.390787, -1.510878, 0.8705882, 1, 0, 1,
-0.8382297, -0.1019466, -2.155102, 0.8666667, 1, 0, 1,
-0.8379554, 1.058423, -1.412491, 0.8588235, 1, 0, 1,
-0.8323557, -0.3658336, -1.46907, 0.854902, 1, 0, 1,
-0.8294867, -2.426311, -2.23319, 0.8470588, 1, 0, 1,
-0.8272955, -0.5490193, -2.326813, 0.8431373, 1, 0, 1,
-0.8257299, 1.679989, 1.352067, 0.8352941, 1, 0, 1,
-0.825682, 0.1005987, -1.683792, 0.8313726, 1, 0, 1,
-0.8206974, 0.9747717, -0.6773537, 0.8235294, 1, 0, 1,
-0.8179109, -0.8283282, -2.641784, 0.8196079, 1, 0, 1,
-0.8173091, 0.03979437, -1.450133, 0.8117647, 1, 0, 1,
-0.8080107, -0.218837, -1.141331, 0.8078431, 1, 0, 1,
-0.8039948, 0.249307, -2.224869, 0.8, 1, 0, 1,
-0.8020624, 1.365344, -1.810972, 0.7921569, 1, 0, 1,
-0.7995309, 0.9431564, -0.5174708, 0.7882353, 1, 0, 1,
-0.7955549, 1.897665, -1.422247, 0.7803922, 1, 0, 1,
-0.7948603, -1.231934, -2.95888, 0.7764706, 1, 0, 1,
-0.7944337, -0.9857871, -0.9387227, 0.7686275, 1, 0, 1,
-0.7877538, -1.604873, -2.057487, 0.7647059, 1, 0, 1,
-0.7864422, 0.1455556, 0.1926041, 0.7568628, 1, 0, 1,
-0.7862815, 0.2250626, 0.266691, 0.7529412, 1, 0, 1,
-0.7797136, -2.013597, -2.65634, 0.7450981, 1, 0, 1,
-0.7734439, -0.1196866, -1.737743, 0.7411765, 1, 0, 1,
-0.7570025, 1.475357, 0.6124728, 0.7333333, 1, 0, 1,
-0.753108, -1.974498, -3.776217, 0.7294118, 1, 0, 1,
-0.7489481, -0.31203, 0.82609, 0.7215686, 1, 0, 1,
-0.7475911, -0.06990156, -1.717779, 0.7176471, 1, 0, 1,
-0.7459114, -0.9478984, -1.86523, 0.7098039, 1, 0, 1,
-0.7452411, -0.9013132, -1.827444, 0.7058824, 1, 0, 1,
-0.7446524, -0.3998457, -4.318992, 0.6980392, 1, 0, 1,
-0.7336685, -0.1538628, -2.276502, 0.6901961, 1, 0, 1,
-0.7287111, -1.240246, -3.496708, 0.6862745, 1, 0, 1,
-0.7282513, -0.8443581, -3.398055, 0.6784314, 1, 0, 1,
-0.7229871, 0.8195259, -0.8909322, 0.6745098, 1, 0, 1,
-0.7213053, 0.8070294, -0.3305914, 0.6666667, 1, 0, 1,
-0.7204102, 0.4278929, -0.5081571, 0.6627451, 1, 0, 1,
-0.7201607, -0.3132243, -1.885799, 0.654902, 1, 0, 1,
-0.7113734, 0.1875604, -2.858685, 0.6509804, 1, 0, 1,
-0.7109007, -1.842828, -3.816499, 0.6431373, 1, 0, 1,
-0.7091462, -0.4042287, -3.395559, 0.6392157, 1, 0, 1,
-0.7027892, 1.186245, 0.1848013, 0.6313726, 1, 0, 1,
-0.7022775, -1.723491, -4.281978, 0.627451, 1, 0, 1,
-0.701833, -0.3604465, -1.880945, 0.6196079, 1, 0, 1,
-0.700547, -0.2307364, -1.497739, 0.6156863, 1, 0, 1,
-0.6992837, -0.1707836, -2.274536, 0.6078432, 1, 0, 1,
-0.6951504, -0.931214, -3.216055, 0.6039216, 1, 0, 1,
-0.6951031, 0.02317547, 0.03361412, 0.5960785, 1, 0, 1,
-0.6938056, -1.024559, -2.336202, 0.5882353, 1, 0, 1,
-0.6927807, 0.6711412, -0.1584995, 0.5843138, 1, 0, 1,
-0.6927043, -1.003386, -4.627831, 0.5764706, 1, 0, 1,
-0.6851473, 0.5081462, -1.088699, 0.572549, 1, 0, 1,
-0.6812365, -1.492805, -0.7076375, 0.5647059, 1, 0, 1,
-0.6798751, 1.297168, -0.8733938, 0.5607843, 1, 0, 1,
-0.6790168, 0.399154, -1.662709, 0.5529412, 1, 0, 1,
-0.6724725, 0.3936491, -3.748582, 0.5490196, 1, 0, 1,
-0.6718304, -0.3407074, -4.320198, 0.5411765, 1, 0, 1,
-0.6712976, -1.226688, -3.221373, 0.5372549, 1, 0, 1,
-0.6711254, 0.5325165, -1.550711, 0.5294118, 1, 0, 1,
-0.6689802, -0.8334023, -1.771595, 0.5254902, 1, 0, 1,
-0.6650673, -0.4337754, -3.216033, 0.5176471, 1, 0, 1,
-0.6444259, -1.794831, -3.710424, 0.5137255, 1, 0, 1,
-0.6436017, -0.610294, -1.284402, 0.5058824, 1, 0, 1,
-0.6372567, -0.1449289, -2.510889, 0.5019608, 1, 0, 1,
-0.6358162, -1.19435, -3.662407, 0.4941176, 1, 0, 1,
-0.634922, -0.7563904, -0.2423389, 0.4862745, 1, 0, 1,
-0.6333455, 0.8317595, 1.063502, 0.4823529, 1, 0, 1,
-0.6259326, -2.088028, -4.021137, 0.4745098, 1, 0, 1,
-0.6231327, 1.22951, -0.3822765, 0.4705882, 1, 0, 1,
-0.620176, 0.2648501, -1.513121, 0.4627451, 1, 0, 1,
-0.6189049, -0.02023445, -1.938203, 0.4588235, 1, 0, 1,
-0.6115512, -0.958832, -1.98925, 0.4509804, 1, 0, 1,
-0.6011291, 1.542712, 0.02619134, 0.4470588, 1, 0, 1,
-0.5881653, 0.2468057, -2.33128, 0.4392157, 1, 0, 1,
-0.5871661, -1.36604, -1.609078, 0.4352941, 1, 0, 1,
-0.5859947, 1.511522, 0.6684538, 0.427451, 1, 0, 1,
-0.5760422, -1.012175, -1.798494, 0.4235294, 1, 0, 1,
-0.566463, 0.06264123, -0.6189097, 0.4156863, 1, 0, 1,
-0.565729, -1.664518, -3.336886, 0.4117647, 1, 0, 1,
-0.5629713, 1.034762, -0.1461474, 0.4039216, 1, 0, 1,
-0.5618486, 0.7000446, -0.4180329, 0.3960784, 1, 0, 1,
-0.5549179, -1.327037, -2.141611, 0.3921569, 1, 0, 1,
-0.5538757, 0.7339408, -0.4858704, 0.3843137, 1, 0, 1,
-0.5538391, -0.05103812, -2.22811, 0.3803922, 1, 0, 1,
-0.553355, 0.7612879, -0.4258837, 0.372549, 1, 0, 1,
-0.5509019, 0.6818198, -1.035314, 0.3686275, 1, 0, 1,
-0.548961, -0.4563965, -2.373224, 0.3607843, 1, 0, 1,
-0.5385514, -0.5350471, -3.195873, 0.3568628, 1, 0, 1,
-0.5346619, 0.5745755, -0.6473485, 0.3490196, 1, 0, 1,
-0.5336322, -0.3052151, -1.483113, 0.345098, 1, 0, 1,
-0.5319855, 0.6878616, -0.8241714, 0.3372549, 1, 0, 1,
-0.5299532, 2.492466, -0.7035792, 0.3333333, 1, 0, 1,
-0.5133377, -0.5079182, -2.858968, 0.3254902, 1, 0, 1,
-0.506058, -1.111387, -1.315744, 0.3215686, 1, 0, 1,
-0.5060241, -0.729215, -1.06416, 0.3137255, 1, 0, 1,
-0.5048456, -1.312593, -2.593496, 0.3098039, 1, 0, 1,
-0.5033925, -0.4311233, -2.872343, 0.3019608, 1, 0, 1,
-0.5024418, -1.108473, -2.89514, 0.2941177, 1, 0, 1,
-0.4962816, 2.178651, -0.1361949, 0.2901961, 1, 0, 1,
-0.4962756, 0.2615759, -0.1203236, 0.282353, 1, 0, 1,
-0.4956039, 1.792247, -0.4606077, 0.2784314, 1, 0, 1,
-0.4937608, 2.163583, 0.6085082, 0.2705882, 1, 0, 1,
-0.4934044, -1.601283, -2.519844, 0.2666667, 1, 0, 1,
-0.4927375, -2.081089, -3.165394, 0.2588235, 1, 0, 1,
-0.4922049, 0.9326538, -0.1564805, 0.254902, 1, 0, 1,
-0.4879065, 1.514047, -2.551456, 0.2470588, 1, 0, 1,
-0.4860817, -0.4308667, -3.049175, 0.2431373, 1, 0, 1,
-0.482464, 0.9358276, -0.1948508, 0.2352941, 1, 0, 1,
-0.4799699, 0.04377042, -0.9296502, 0.2313726, 1, 0, 1,
-0.4786956, 1.470071, 2.018794, 0.2235294, 1, 0, 1,
-0.4753614, -0.5196843, -3.817934, 0.2196078, 1, 0, 1,
-0.4734342, 1.149223, -0.4554485, 0.2117647, 1, 0, 1,
-0.473291, 1.037307, -0.166426, 0.2078431, 1, 0, 1,
-0.4659226, -0.3089326, -4.540246, 0.2, 1, 0, 1,
-0.4611496, -0.6386194, -3.966861, 0.1921569, 1, 0, 1,
-0.4607652, -0.02774473, -1.726705, 0.1882353, 1, 0, 1,
-0.4581352, 0.6174355, -1.13518, 0.1803922, 1, 0, 1,
-0.4568996, -1.019719, -4.012566, 0.1764706, 1, 0, 1,
-0.4529418, -1.20146, -2.762551, 0.1686275, 1, 0, 1,
-0.4527139, -1.144461, -2.690695, 0.1647059, 1, 0, 1,
-0.4516219, -1.104571, -2.905202, 0.1568628, 1, 0, 1,
-0.4505905, 2.154298, 1.763161, 0.1529412, 1, 0, 1,
-0.4465376, -2.718208, -3.595629, 0.145098, 1, 0, 1,
-0.4454274, -1.296188, -1.208715, 0.1411765, 1, 0, 1,
-0.445307, 0.3930249, -4.070253, 0.1333333, 1, 0, 1,
-0.4451407, -0.2144331, -1.269842, 0.1294118, 1, 0, 1,
-0.4382288, 1.170171, 0.7966948, 0.1215686, 1, 0, 1,
-0.4363286, 0.8205128, -0.9902683, 0.1176471, 1, 0, 1,
-0.4354321, 0.004975892, -2.891855, 0.1098039, 1, 0, 1,
-0.435027, -1.737178, -2.648013, 0.1058824, 1, 0, 1,
-0.4348931, 0.7521592, -1.622267, 0.09803922, 1, 0, 1,
-0.4282951, -1.59408, -2.450105, 0.09019608, 1, 0, 1,
-0.4254794, -1.083577, -3.874693, 0.08627451, 1, 0, 1,
-0.4239448, -0.5599167, -4.20725, 0.07843138, 1, 0, 1,
-0.4235471, -0.9828843, -3.726656, 0.07450981, 1, 0, 1,
-0.421429, -0.3339539, -2.667673, 0.06666667, 1, 0, 1,
-0.416403, -0.8158394, -4.090656, 0.0627451, 1, 0, 1,
-0.4163713, -1.583052, -1.223109, 0.05490196, 1, 0, 1,
-0.4109866, -0.5499296, -2.249756, 0.05098039, 1, 0, 1,
-0.4101914, -1.156966, -1.082117, 0.04313726, 1, 0, 1,
-0.4016146, 1.677808, -0.567147, 0.03921569, 1, 0, 1,
-0.3929799, 0.07563724, -2.590875, 0.03137255, 1, 0, 1,
-0.392455, 2.031458, -1.611591, 0.02745098, 1, 0, 1,
-0.3881969, -0.1888396, -2.151572, 0.01960784, 1, 0, 1,
-0.3859703, -0.386469, -2.613786, 0.01568628, 1, 0, 1,
-0.3832411, 1.938575, -1.999834, 0.007843138, 1, 0, 1,
-0.377155, -1.020588, -1.676052, 0.003921569, 1, 0, 1,
-0.3729537, -1.800016, -3.285445, 0, 1, 0.003921569, 1,
-0.3712666, 1.282884, -0.7096996, 0, 1, 0.01176471, 1,
-0.3610658, 0.2247024, 1.36615, 0, 1, 0.01568628, 1,
-0.354176, 1.292093, -1.032873, 0, 1, 0.02352941, 1,
-0.3539567, 1.118475, 0.1574002, 0, 1, 0.02745098, 1,
-0.3531147, 0.06258591, -0.5572782, 0, 1, 0.03529412, 1,
-0.3529068, -0.6751419, -3.30279, 0, 1, 0.03921569, 1,
-0.3508547, 1.505101, -1.137231, 0, 1, 0.04705882, 1,
-0.3501992, -0.2709694, -3.147055, 0, 1, 0.05098039, 1,
-0.3497519, 0.7742091, 0.3997438, 0, 1, 0.05882353, 1,
-0.3485079, 0.4799057, -0.561864, 0, 1, 0.0627451, 1,
-0.3484176, 0.3411404, -1.919219, 0, 1, 0.07058824, 1,
-0.3450131, -1.585517, -2.210549, 0, 1, 0.07450981, 1,
-0.3415754, 1.550405, -1.145366, 0, 1, 0.08235294, 1,
-0.3392865, -0.3069949, -1.536332, 0, 1, 0.08627451, 1,
-0.3386167, -0.2440812, -2.15718, 0, 1, 0.09411765, 1,
-0.3363132, 2.237496, -2.287538, 0, 1, 0.1019608, 1,
-0.3319003, -1.3161, -1.461557, 0, 1, 0.1058824, 1,
-0.3279482, -0.3729222, -1.202457, 0, 1, 0.1137255, 1,
-0.319823, -0.1063647, -0.9531152, 0, 1, 0.1176471, 1,
-0.3197289, -0.6406777, -2.373939, 0, 1, 0.1254902, 1,
-0.3190193, -0.9720368, -2.611001, 0, 1, 0.1294118, 1,
-0.3142816, 0.2145602, -1.687221, 0, 1, 0.1372549, 1,
-0.308144, -0.5582297, -1.971682, 0, 1, 0.1411765, 1,
-0.3079812, -0.9265299, -3.278339, 0, 1, 0.1490196, 1,
-0.3073387, 0.7792784, -1.267229, 0, 1, 0.1529412, 1,
-0.3058129, 1.030089, -0.5235342, 0, 1, 0.1607843, 1,
-0.3016284, -1.375357, -3.889503, 0, 1, 0.1647059, 1,
-0.3012086, 0.2537898, -0.1989345, 0, 1, 0.172549, 1,
-0.3001894, -0.2225555, -3.786036, 0, 1, 0.1764706, 1,
-0.2942005, 0.1449572, 0.3477924, 0, 1, 0.1843137, 1,
-0.2928763, 1.151676, -0.6341646, 0, 1, 0.1882353, 1,
-0.2850684, -1.343571, -1.195329, 0, 1, 0.1960784, 1,
-0.281572, -0.8822428, -1.328634, 0, 1, 0.2039216, 1,
-0.2815444, -2.040844, -1.474984, 0, 1, 0.2078431, 1,
-0.2793697, -1.593352, -2.764455, 0, 1, 0.2156863, 1,
-0.2789396, -0.402369, -2.997122, 0, 1, 0.2196078, 1,
-0.2741382, 0.1043099, -0.9831043, 0, 1, 0.227451, 1,
-0.2729829, 0.85474, -0.7094517, 0, 1, 0.2313726, 1,
-0.2712238, 0.07926662, -1.133505, 0, 1, 0.2392157, 1,
-0.270505, -0.8222603, -2.920979, 0, 1, 0.2431373, 1,
-0.2699901, -1.159099, -1.882105, 0, 1, 0.2509804, 1,
-0.2639643, 0.5584185, -0.5032975, 0, 1, 0.254902, 1,
-0.2617107, -0.4257236, -3.376992, 0, 1, 0.2627451, 1,
-0.2605676, 0.451685, -2.414057, 0, 1, 0.2666667, 1,
-0.2550869, 1.969637, 0.4526547, 0, 1, 0.2745098, 1,
-0.2522177, -0.3691522, -2.963403, 0, 1, 0.2784314, 1,
-0.2497687, 0.3360225, -1.39204, 0, 1, 0.2862745, 1,
-0.2433896, 1.027053, 0.04416872, 0, 1, 0.2901961, 1,
-0.241317, -0.4918536, -1.059427, 0, 1, 0.2980392, 1,
-0.2373482, -0.0003855042, -0.6071558, 0, 1, 0.3058824, 1,
-0.2372597, 0.1569942, -1.765686, 0, 1, 0.3098039, 1,
-0.2339209, 1.152742, -1.491114, 0, 1, 0.3176471, 1,
-0.2264651, 0.2400824, -0.1050812, 0, 1, 0.3215686, 1,
-0.2257484, -0.3909248, -2.21036, 0, 1, 0.3294118, 1,
-0.2227076, 0.7426396, -1.080344, 0, 1, 0.3333333, 1,
-0.2223981, 0.9663084, 0.06483266, 0, 1, 0.3411765, 1,
-0.2140033, 1.136926, -0.8017523, 0, 1, 0.345098, 1,
-0.2138548, 0.0861698, -0.8725792, 0, 1, 0.3529412, 1,
-0.2135871, 0.4919591, -2.693145, 0, 1, 0.3568628, 1,
-0.2135186, -0.2447028, -2.852116, 0, 1, 0.3647059, 1,
-0.2116708, 0.4679669, 0.5866988, 0, 1, 0.3686275, 1,
-0.2102235, 0.2262624, -1.142493, 0, 1, 0.3764706, 1,
-0.2013995, 0.3299515, -1.106646, 0, 1, 0.3803922, 1,
-0.2012922, 0.9469465, 0.4918725, 0, 1, 0.3882353, 1,
-0.2005664, 0.3821666, 1.831153, 0, 1, 0.3921569, 1,
-0.1950165, -0.765166, -2.440331, 0, 1, 0.4, 1,
-0.1948592, -0.604946, -2.773173, 0, 1, 0.4078431, 1,
-0.1944408, -1.199751, -2.739076, 0, 1, 0.4117647, 1,
-0.1904427, 0.3467902, -0.08722965, 0, 1, 0.4196078, 1,
-0.1882023, 1.308001, -0.6133437, 0, 1, 0.4235294, 1,
-0.1861524, 0.3633624, -2.0985, 0, 1, 0.4313726, 1,
-0.1841428, 0.8536915, 0.8390527, 0, 1, 0.4352941, 1,
-0.1780093, -0.6861761, -3.972622, 0, 1, 0.4431373, 1,
-0.1773301, 0.5511573, 0.4020516, 0, 1, 0.4470588, 1,
-0.1727093, 0.1557075, -1.479146, 0, 1, 0.454902, 1,
-0.1717224, -0.4683672, -4.136735, 0, 1, 0.4588235, 1,
-0.1711535, 1.108659, -0.4249934, 0, 1, 0.4666667, 1,
-0.1707562, -0.2477846, -1.524064, 0, 1, 0.4705882, 1,
-0.1704592, -0.3607674, -2.928947, 0, 1, 0.4784314, 1,
-0.1682314, 0.1695927, -0.2933304, 0, 1, 0.4823529, 1,
-0.1680316, -1.257259, -2.294425, 0, 1, 0.4901961, 1,
-0.1645319, -0.3286124, -2.095844, 0, 1, 0.4941176, 1,
-0.1605736, 0.3256068, 0.1796582, 0, 1, 0.5019608, 1,
-0.1570967, -0.301488, -4.125135, 0, 1, 0.509804, 1,
-0.1552678, -1.164978, -5.339572, 0, 1, 0.5137255, 1,
-0.151165, 2.125162, -1.33927, 0, 1, 0.5215687, 1,
-0.1471276, 0.6033737, 0.7896473, 0, 1, 0.5254902, 1,
-0.142773, -1.297458, -3.862537, 0, 1, 0.5333334, 1,
-0.1420693, 0.2158237, -0.5528926, 0, 1, 0.5372549, 1,
-0.1372087, 0.829111, -0.03691626, 0, 1, 0.5450981, 1,
-0.1362998, -2.156883, -3.527224, 0, 1, 0.5490196, 1,
-0.1329761, 0.3026972, -1.274485, 0, 1, 0.5568628, 1,
-0.1298313, 2.560736, -1.627124, 0, 1, 0.5607843, 1,
-0.1273639, -0.435896, -3.649975, 0, 1, 0.5686275, 1,
-0.127084, 0.2593143, 0.1427531, 0, 1, 0.572549, 1,
-0.1262911, -0.6289221, -4.416047, 0, 1, 0.5803922, 1,
-0.1213622, 0.5991744, -0.3801274, 0, 1, 0.5843138, 1,
-0.1125933, 0.1866966, -0.2989874, 0, 1, 0.5921569, 1,
-0.1123637, -0.447889, -2.396307, 0, 1, 0.5960785, 1,
-0.1092311, 0.0745091, -3.78166, 0, 1, 0.6039216, 1,
-0.106068, 1.146657, -0.1641325, 0, 1, 0.6117647, 1,
-0.1030341, -1.681163, -3.251559, 0, 1, 0.6156863, 1,
-0.1005129, -0.8935788, -3.049253, 0, 1, 0.6235294, 1,
-0.09475544, 1.535278, 0.3872757, 0, 1, 0.627451, 1,
-0.08958048, -0.5106444, -3.698101, 0, 1, 0.6352941, 1,
-0.08729142, 0.6008849, -0.4168652, 0, 1, 0.6392157, 1,
-0.0847417, 1.526457, 0.9940227, 0, 1, 0.6470588, 1,
-0.08286116, 1.419895, 1.328372, 0, 1, 0.6509804, 1,
-0.08199041, 0.3262993, -0.04547015, 0, 1, 0.6588235, 1,
-0.06860483, 0.9308992, 0.5725184, 0, 1, 0.6627451, 1,
-0.06787914, -2.19368, -3.906711, 0, 1, 0.6705883, 1,
-0.0649576, -0.1948217, -3.180361, 0, 1, 0.6745098, 1,
-0.06336684, 0.3960919, -0.8872416, 0, 1, 0.682353, 1,
-0.05913129, -1.065148, -2.993442, 0, 1, 0.6862745, 1,
-0.05755477, 1.351265, -2.537952, 0, 1, 0.6941177, 1,
-0.05606532, -0.9636429, -1.047743, 0, 1, 0.7019608, 1,
-0.05196979, 0.4481459, -1.066853, 0, 1, 0.7058824, 1,
-0.05075154, 1.15194, 0.2232921, 0, 1, 0.7137255, 1,
-0.04952993, 2.389263, 1.400551, 0, 1, 0.7176471, 1,
-0.04720986, 0.7442662, -1.797749, 0, 1, 0.7254902, 1,
-0.04430079, -0.9074017, -3.114777, 0, 1, 0.7294118, 1,
-0.03834975, 0.2489534, 0.7434144, 0, 1, 0.7372549, 1,
-0.0380058, 0.2197703, 0.2888551, 0, 1, 0.7411765, 1,
-0.03467023, 0.7198967, -0.2722471, 0, 1, 0.7490196, 1,
-0.02604988, 0.3241452, -1.54025, 0, 1, 0.7529412, 1,
-0.02266999, 1.488057, -1.614298, 0, 1, 0.7607843, 1,
-0.0197642, 0.536415, 0.9516129, 0, 1, 0.7647059, 1,
-0.01639591, -1.490215, -1.132685, 0, 1, 0.772549, 1,
-0.01535895, -0.5393664, -2.119502, 0, 1, 0.7764706, 1,
-0.013788, -0.4648019, -3.165487, 0, 1, 0.7843137, 1,
-0.01335954, 1.130549, 0.09466103, 0, 1, 0.7882353, 1,
-0.01091457, 0.04795843, 0.7510284, 0, 1, 0.7960784, 1,
-0.01040089, -1.838551, -3.467965, 0, 1, 0.8039216, 1,
-0.009967285, -0.1931514, -4.799087, 0, 1, 0.8078431, 1,
-0.005164186, -1.536191, -3.832027, 0, 1, 0.8156863, 1,
-0.0038848, 0.03904231, 0.01251279, 0, 1, 0.8196079, 1,
0.005304445, 0.4499024, 0.4155887, 0, 1, 0.827451, 1,
0.01021606, 1.874017, -1.344854, 0, 1, 0.8313726, 1,
0.01242651, -1.326848, 5.06264, 0, 1, 0.8392157, 1,
0.0143623, -0.5460113, 4.912698, 0, 1, 0.8431373, 1,
0.01539278, 0.6248157, -1.507232, 0, 1, 0.8509804, 1,
0.01748289, -1.767969, 2.093734, 0, 1, 0.854902, 1,
0.0176971, -0.5505769, 3.585857, 0, 1, 0.8627451, 1,
0.01805595, 0.7898586, 0.8282219, 0, 1, 0.8666667, 1,
0.02154521, -0.1281532, 3.081027, 0, 1, 0.8745098, 1,
0.02262382, -0.0136495, 2.256751, 0, 1, 0.8784314, 1,
0.02524937, -2.538967, 2.791259, 0, 1, 0.8862745, 1,
0.02538615, 1.325999, -2.516553, 0, 1, 0.8901961, 1,
0.02858383, -0.7786333, 3.508917, 0, 1, 0.8980392, 1,
0.02971623, 1.435143, -1.059196, 0, 1, 0.9058824, 1,
0.03269656, -0.981123, 3.718756, 0, 1, 0.9098039, 1,
0.03274598, 0.7773997, 0.6085914, 0, 1, 0.9176471, 1,
0.03292049, -0.6020454, 3.45697, 0, 1, 0.9215686, 1,
0.03650727, 1.222116, -0.1129781, 0, 1, 0.9294118, 1,
0.03723324, -1.021568, 3.963868, 0, 1, 0.9333333, 1,
0.03851028, 0.5472435, 1.200116, 0, 1, 0.9411765, 1,
0.04217827, 0.1299169, 0.4724243, 0, 1, 0.945098, 1,
0.04324635, 0.8782684, -2.323973, 0, 1, 0.9529412, 1,
0.04377068, 1.248945, 1.721498, 0, 1, 0.9568627, 1,
0.05213523, 0.1720285, 0.5993567, 0, 1, 0.9647059, 1,
0.05735848, -0.1719915, 1.614717, 0, 1, 0.9686275, 1,
0.06014286, -0.674854, 2.901927, 0, 1, 0.9764706, 1,
0.06066731, 1.706698, 0.01307837, 0, 1, 0.9803922, 1,
0.0611052, -0.04990169, 3.01619, 0, 1, 0.9882353, 1,
0.06193773, -0.1653216, 2.107872, 0, 1, 0.9921569, 1,
0.06404434, 0.4104008, -0.2722542, 0, 1, 1, 1,
0.06492419, -0.1126004, 2.368941, 0, 0.9921569, 1, 1,
0.06630995, -1.043717, 4.011163, 0, 0.9882353, 1, 1,
0.0675664, 1.10473, -0.3158586, 0, 0.9803922, 1, 1,
0.06780592, -0.6364912, 3.029463, 0, 0.9764706, 1, 1,
0.06989361, -2.128483, 0.9934325, 0, 0.9686275, 1, 1,
0.07388391, -0.7883578, 2.571333, 0, 0.9647059, 1, 1,
0.07791651, 0.5958701, -0.09748073, 0, 0.9568627, 1, 1,
0.07799713, 0.05088534, 0.7190132, 0, 0.9529412, 1, 1,
0.08017231, 2.077033, -0.8121479, 0, 0.945098, 1, 1,
0.08140273, 0.9491334, 0.4303599, 0, 0.9411765, 1, 1,
0.08290809, 1.402451, -1.187402, 0, 0.9333333, 1, 1,
0.1005099, -0.9820963, 1.06492, 0, 0.9294118, 1, 1,
0.1023068, 0.8354923, 0.2691641, 0, 0.9215686, 1, 1,
0.1032459, -0.5603478, 3.369454, 0, 0.9176471, 1, 1,
0.1037601, 0.3220463, -0.9657063, 0, 0.9098039, 1, 1,
0.1073177, -0.3635554, 3.351107, 0, 0.9058824, 1, 1,
0.1113363, 0.1293741, -0.0923133, 0, 0.8980392, 1, 1,
0.1123001, 1.416833, -0.7445786, 0, 0.8901961, 1, 1,
0.1124383, 0.4019254, 0.5883213, 0, 0.8862745, 1, 1,
0.1195796, -0.06760506, 1.432303, 0, 0.8784314, 1, 1,
0.1234222, -0.8758253, 2.184829, 0, 0.8745098, 1, 1,
0.1248616, -1.115306, 3.882098, 0, 0.8666667, 1, 1,
0.1277803, -0.3066838, 3.314172, 0, 0.8627451, 1, 1,
0.1280131, 1.298712, 0.9018377, 0, 0.854902, 1, 1,
0.1305454, 1.268994, 0.2626591, 0, 0.8509804, 1, 1,
0.1320205, -1.611128, 4.026814, 0, 0.8431373, 1, 1,
0.1329251, -0.3802493, 2.114263, 0, 0.8392157, 1, 1,
0.133323, 0.4446104, -0.01409095, 0, 0.8313726, 1, 1,
0.138298, -0.03839984, 0.9912623, 0, 0.827451, 1, 1,
0.138427, 0.6943316, -1.295342, 0, 0.8196079, 1, 1,
0.1412954, 0.1661936, -0.2008152, 0, 0.8156863, 1, 1,
0.1423065, 0.4818962, 0.03818056, 0, 0.8078431, 1, 1,
0.143587, 0.1369619, 1.01231, 0, 0.8039216, 1, 1,
0.143938, -0.9248444, 4.772983, 0, 0.7960784, 1, 1,
0.1456093, -0.8167449, 2.29178, 0, 0.7882353, 1, 1,
0.1496158, -0.3269086, 2.391384, 0, 0.7843137, 1, 1,
0.1510245, 0.158001, 0.6247884, 0, 0.7764706, 1, 1,
0.1523962, -2.122453, -0.01213895, 0, 0.772549, 1, 1,
0.1610234, 0.6540347, -1.615755, 0, 0.7647059, 1, 1,
0.1627153, -0.5607459, 1.811166, 0, 0.7607843, 1, 1,
0.1642224, -0.1145459, 2.944032, 0, 0.7529412, 1, 1,
0.167117, -0.2430233, 4.393716, 0, 0.7490196, 1, 1,
0.1672422, -1.495812, 2.967417, 0, 0.7411765, 1, 1,
0.1706899, 0.4261795, 1.648881, 0, 0.7372549, 1, 1,
0.1732869, -0.6964123, 1.974285, 0, 0.7294118, 1, 1,
0.179204, 0.5853162, 0.2096835, 0, 0.7254902, 1, 1,
0.1825391, 1.005876, 1.095965, 0, 0.7176471, 1, 1,
0.1833424, 0.1533875, 0.3612331, 0, 0.7137255, 1, 1,
0.1839619, -0.1706523, 2.070898, 0, 0.7058824, 1, 1,
0.1920627, 0.1485764, 0.9041537, 0, 0.6980392, 1, 1,
0.192211, -1.648749, 4.995416, 0, 0.6941177, 1, 1,
0.1928739, 0.380211, 0.6992639, 0, 0.6862745, 1, 1,
0.1963874, 0.3740762, 1.823087, 0, 0.682353, 1, 1,
0.1986835, 1.596202, 0.07820039, 0, 0.6745098, 1, 1,
0.1990516, 1.886758, 0.6515038, 0, 0.6705883, 1, 1,
0.2004056, 0.497463, 0.2874123, 0, 0.6627451, 1, 1,
0.2018237, 0.7187881, 0.8738279, 0, 0.6588235, 1, 1,
0.202903, -0.7981897, 3.699948, 0, 0.6509804, 1, 1,
0.2082948, 0.9258484, 1.365427, 0, 0.6470588, 1, 1,
0.2106823, 1.38984, -0.2488611, 0, 0.6392157, 1, 1,
0.2135207, 0.5208403, 1.495968, 0, 0.6352941, 1, 1,
0.2136444, -0.04445666, 1.395932, 0, 0.627451, 1, 1,
0.2144061, 0.7286477, 0.9651855, 0, 0.6235294, 1, 1,
0.2146226, -1.674912, 4.496974, 0, 0.6156863, 1, 1,
0.2158941, 0.1945387, 1.975551, 0, 0.6117647, 1, 1,
0.2174163, -1.317904, 4.94814, 0, 0.6039216, 1, 1,
0.229063, -0.7162599, 1.623492, 0, 0.5960785, 1, 1,
0.2291639, -0.4548532, 3.16827, 0, 0.5921569, 1, 1,
0.2315029, -0.5326254, 1.519425, 0, 0.5843138, 1, 1,
0.2389114, -0.1371285, 2.779723, 0, 0.5803922, 1, 1,
0.2420991, 1.258917, 0.7290246, 0, 0.572549, 1, 1,
0.2458839, 1.140842, 1.235775, 0, 0.5686275, 1, 1,
0.2474701, 1.74818, 0.29426, 0, 0.5607843, 1, 1,
0.2478635, -0.4303493, 4.457079, 0, 0.5568628, 1, 1,
0.2486574, 1.110983, -1.49119, 0, 0.5490196, 1, 1,
0.2520967, -0.1281289, 2.328082, 0, 0.5450981, 1, 1,
0.2526797, -0.358868, 2.907915, 0, 0.5372549, 1, 1,
0.2531346, 0.5628853, 0.8416309, 0, 0.5333334, 1, 1,
0.2559173, -0.2484374, 1.790421, 0, 0.5254902, 1, 1,
0.2657582, 0.7381634, 0.09715303, 0, 0.5215687, 1, 1,
0.2672757, 0.7788256, 1.656468, 0, 0.5137255, 1, 1,
0.2675158, 0.08354451, 1.387938, 0, 0.509804, 1, 1,
0.2677568, 0.583554, 2.047218, 0, 0.5019608, 1, 1,
0.2696968, 0.8737274, 0.6082343, 0, 0.4941176, 1, 1,
0.27411, 1.970003, -0.9317456, 0, 0.4901961, 1, 1,
0.2741197, -0.748485, 2.119388, 0, 0.4823529, 1, 1,
0.274356, -1.24753, 4.293514, 0, 0.4784314, 1, 1,
0.2797399, -1.2227, 3.534433, 0, 0.4705882, 1, 1,
0.281158, -0.04477355, 2.175319, 0, 0.4666667, 1, 1,
0.2863814, -0.8704631, 1.749878, 0, 0.4588235, 1, 1,
0.2866743, -1.128318, 4.575232, 0, 0.454902, 1, 1,
0.2893033, -0.03133508, 3.374844, 0, 0.4470588, 1, 1,
0.2911337, -1.532241, 2.411106, 0, 0.4431373, 1, 1,
0.2914661, 0.04736714, 0.7995671, 0, 0.4352941, 1, 1,
0.2924306, -0.2496945, 2.331569, 0, 0.4313726, 1, 1,
0.2962171, 0.9594553, 0.351035, 0, 0.4235294, 1, 1,
0.3039648, 0.5988047, 0.3471636, 0, 0.4196078, 1, 1,
0.3063149, 0.04996694, 0.84477, 0, 0.4117647, 1, 1,
0.3068173, -1.380499, 1.736377, 0, 0.4078431, 1, 1,
0.3097365, 0.6751041, -0.2263052, 0, 0.4, 1, 1,
0.3112175, 1.937981, -0.6593769, 0, 0.3921569, 1, 1,
0.3115535, 1.676138, 0.5289701, 0, 0.3882353, 1, 1,
0.3211082, 1.01637, 0.6173399, 0, 0.3803922, 1, 1,
0.3213524, 1.974917, 0.2244655, 0, 0.3764706, 1, 1,
0.3214543, 3.051578, -0.8891054, 0, 0.3686275, 1, 1,
0.3215984, 0.42394, 2.217118, 0, 0.3647059, 1, 1,
0.3225923, -0.9905077, 2.491346, 0, 0.3568628, 1, 1,
0.3227237, -0.4900234, 1.733679, 0, 0.3529412, 1, 1,
0.3268857, 0.04464318, 1.332694, 0, 0.345098, 1, 1,
0.327215, -0.3023748, 2.539888, 0, 0.3411765, 1, 1,
0.3298454, 0.6558553, -0.2990081, 0, 0.3333333, 1, 1,
0.3331064, -0.9119114, 2.248719, 0, 0.3294118, 1, 1,
0.3378762, 0.6851543, -0.3802937, 0, 0.3215686, 1, 1,
0.3406347, 0.311879, 1.237899, 0, 0.3176471, 1, 1,
0.3438675, -0.590337, 2.816103, 0, 0.3098039, 1, 1,
0.345992, 0.2262755, -0.3247598, 0, 0.3058824, 1, 1,
0.347372, -0.5532991, 3.206218, 0, 0.2980392, 1, 1,
0.3508212, 0.8384207, -0.07045525, 0, 0.2901961, 1, 1,
0.352012, 0.3028431, 1.87984, 0, 0.2862745, 1, 1,
0.3539118, -0.3108209, 3.441192, 0, 0.2784314, 1, 1,
0.3560153, 2.479056, 0.7174981, 0, 0.2745098, 1, 1,
0.357099, -0.4730445, 2.004596, 0, 0.2666667, 1, 1,
0.3591596, 0.4474089, -0.05012878, 0, 0.2627451, 1, 1,
0.3658427, 0.2735991, 0.7445059, 0, 0.254902, 1, 1,
0.3664658, -0.3430917, 2.203613, 0, 0.2509804, 1, 1,
0.3719282, -1.228955, 4.722371, 0, 0.2431373, 1, 1,
0.3722638, -1.736473, 5.18329, 0, 0.2392157, 1, 1,
0.3742488, 1.758113, -0.4573815, 0, 0.2313726, 1, 1,
0.3743667, 0.8294749, -0.8502558, 0, 0.227451, 1, 1,
0.380073, -1.305792, 4.153378, 0, 0.2196078, 1, 1,
0.3849679, 0.5129943, 0.803219, 0, 0.2156863, 1, 1,
0.3856057, -1.14098, 3.352546, 0, 0.2078431, 1, 1,
0.3878099, 2.376967, 0.06008383, 0, 0.2039216, 1, 1,
0.3884479, -0.3722689, 1.814615, 0, 0.1960784, 1, 1,
0.3925296, -0.2050278, 2.196214, 0, 0.1882353, 1, 1,
0.3931554, -1.016724, 3.636103, 0, 0.1843137, 1, 1,
0.3945555, -1.483271, 2.43701, 0, 0.1764706, 1, 1,
0.3962131, -1.337449, 2.858516, 0, 0.172549, 1, 1,
0.3975447, -0.235779, 2.251934, 0, 0.1647059, 1, 1,
0.3977734, 0.4179325, 1.90569, 0, 0.1607843, 1, 1,
0.3981064, -0.4708797, 2.937555, 0, 0.1529412, 1, 1,
0.4006345, -1.710284, 4.526265, 0, 0.1490196, 1, 1,
0.4072403, -0.5970315, 3.622465, 0, 0.1411765, 1, 1,
0.4079325, 0.9162169, 2.083007, 0, 0.1372549, 1, 1,
0.4079534, 0.2748985, 0.2058343, 0, 0.1294118, 1, 1,
0.4092372, -0.01550431, 1.289882, 0, 0.1254902, 1, 1,
0.4162671, -1.349477, 3.498955, 0, 0.1176471, 1, 1,
0.4170156, -0.468908, 3.451497, 0, 0.1137255, 1, 1,
0.4187861, 0.5301446, 0.5801652, 0, 0.1058824, 1, 1,
0.4192317, 1.208633, 2.531568, 0, 0.09803922, 1, 1,
0.4220301, 1.02626, 0.8260148, 0, 0.09411765, 1, 1,
0.4244672, -0.374014, 1.39301, 0, 0.08627451, 1, 1,
0.4257897, -0.411801, 1.728913, 0, 0.08235294, 1, 1,
0.4284419, -0.171056, 1.148135, 0, 0.07450981, 1, 1,
0.4334516, 0.06677957, 3.208299, 0, 0.07058824, 1, 1,
0.4401899, 0.152752, 0.7249891, 0, 0.0627451, 1, 1,
0.4449329, 0.215819, 0.2695759, 0, 0.05882353, 1, 1,
0.4495077, -1.923422, 1.997491, 0, 0.05098039, 1, 1,
0.452648, 0.2156707, 1.187317, 0, 0.04705882, 1, 1,
0.4538434, -0.5585565, 0.7456883, 0, 0.03921569, 1, 1,
0.4562564, -1.469407, 1.682607, 0, 0.03529412, 1, 1,
0.4587677, -0.4143325, 1.934476, 0, 0.02745098, 1, 1,
0.4606015, -0.9034811, 2.727486, 0, 0.02352941, 1, 1,
0.4615635, -0.4539922, 1.023497, 0, 0.01568628, 1, 1,
0.4645132, 1.596239, -0.2685402, 0, 0.01176471, 1, 1,
0.4665621, 2.159893, -0.8214, 0, 0.003921569, 1, 1,
0.4673605, -0.3051231, 2.970153, 0.003921569, 0, 1, 1,
0.4691132, -0.003758136, 1.56751, 0.007843138, 0, 1, 1,
0.4717767, 1.329715, -1.860205, 0.01568628, 0, 1, 1,
0.4738692, 0.09126248, 2.191924, 0.01960784, 0, 1, 1,
0.4751023, 1.637371, -0.211223, 0.02745098, 0, 1, 1,
0.478791, -0.5760818, 1.919505, 0.03137255, 0, 1, 1,
0.4802765, -0.8661761, 2.554485, 0.03921569, 0, 1, 1,
0.4889179, -1.420232, 2.865668, 0.04313726, 0, 1, 1,
0.4898441, -0.4725605, 2.643306, 0.05098039, 0, 1, 1,
0.4902752, -2.637269, 2.768775, 0.05490196, 0, 1, 1,
0.4970505, -0.7659593, 1.532138, 0.0627451, 0, 1, 1,
0.4983672, 0.7839496, 1.34277, 0.06666667, 0, 1, 1,
0.5018076, -1.211886, 1.829375, 0.07450981, 0, 1, 1,
0.5020269, -1.450155, 3.221008, 0.07843138, 0, 1, 1,
0.5044279, 0.7307593, 0.4514832, 0.08627451, 0, 1, 1,
0.5104672, 0.9084781, 1.718554, 0.09019608, 0, 1, 1,
0.5116065, 0.2097248, 2.628248, 0.09803922, 0, 1, 1,
0.5125664, -1.459907, 3.099218, 0.1058824, 0, 1, 1,
0.5148356, -0.4968483, 3.202727, 0.1098039, 0, 1, 1,
0.5189235, 0.09659252, 2.432813, 0.1176471, 0, 1, 1,
0.5196216, -0.7254596, 5.178108, 0.1215686, 0, 1, 1,
0.5212763, 0.1851882, 1.31459, 0.1294118, 0, 1, 1,
0.5259022, -0.4263996, 2.986763, 0.1333333, 0, 1, 1,
0.5344168, 0.4733282, 0.6967989, 0.1411765, 0, 1, 1,
0.5382095, 0.2368965, 2.446875, 0.145098, 0, 1, 1,
0.5383959, -0.7264187, 4.598361, 0.1529412, 0, 1, 1,
0.5414498, 0.05354805, 1.943558, 0.1568628, 0, 1, 1,
0.5535824, -0.8641534, 1.855005, 0.1647059, 0, 1, 1,
0.554355, 0.3401682, 1.269287, 0.1686275, 0, 1, 1,
0.5577643, 0.2472944, 1.998478, 0.1764706, 0, 1, 1,
0.5596817, 1.660531, -0.3269317, 0.1803922, 0, 1, 1,
0.5608085, -1.045764, 5.060405, 0.1882353, 0, 1, 1,
0.562704, -0.08887742, 4.325533, 0.1921569, 0, 1, 1,
0.5643548, 0.2372266, 1.281017, 0.2, 0, 1, 1,
0.5712805, 1.853802, 1.467466, 0.2078431, 0, 1, 1,
0.5753715, 1.242519, 0.4917827, 0.2117647, 0, 1, 1,
0.578028, -1.20235, 1.503103, 0.2196078, 0, 1, 1,
0.5800217, -0.02526203, 2.686932, 0.2235294, 0, 1, 1,
0.5864985, -1.207778, 3.861794, 0.2313726, 0, 1, 1,
0.5901784, -1.524257, 3.794368, 0.2352941, 0, 1, 1,
0.5905711, -0.1131943, 4.1442, 0.2431373, 0, 1, 1,
0.5906094, -0.159008, 2.340762, 0.2470588, 0, 1, 1,
0.5976991, -3.251166, 1.147752, 0.254902, 0, 1, 1,
0.6006415, 0.4878669, 0.6549459, 0.2588235, 0, 1, 1,
0.6027783, -0.5026984, 2.194926, 0.2666667, 0, 1, 1,
0.6031787, 0.3740593, 1.083748, 0.2705882, 0, 1, 1,
0.6152846, 1.486681, -0.7083616, 0.2784314, 0, 1, 1,
0.6171393, 0.4972238, 0.3722188, 0.282353, 0, 1, 1,
0.6296361, -1.251949, 3.803793, 0.2901961, 0, 1, 1,
0.6303251, -0.541065, 1.786419, 0.2941177, 0, 1, 1,
0.6333427, -1.245842, 4.98286, 0.3019608, 0, 1, 1,
0.6336035, -1.551954, 2.918226, 0.3098039, 0, 1, 1,
0.6372184, 1.529899, -1.345451, 0.3137255, 0, 1, 1,
0.6411455, 1.182562, -0.1375213, 0.3215686, 0, 1, 1,
0.6439303, -0.9771546, 2.293765, 0.3254902, 0, 1, 1,
0.6454173, -0.3689386, 2.354309, 0.3333333, 0, 1, 1,
0.6465127, -1.240758, 3.213965, 0.3372549, 0, 1, 1,
0.648592, 1.281469, 0.3393147, 0.345098, 0, 1, 1,
0.649177, 0.8565251, -0.5133497, 0.3490196, 0, 1, 1,
0.6511815, 0.380032, 1.910218, 0.3568628, 0, 1, 1,
0.6519779, -0.8737224, 2.48288, 0.3607843, 0, 1, 1,
0.6541703, -0.3095554, 2.880296, 0.3686275, 0, 1, 1,
0.6550819, -1.606663, 4.836613, 0.372549, 0, 1, 1,
0.6630275, 2.22814, -0.07090247, 0.3803922, 0, 1, 1,
0.6685035, -0.3355122, 2.403628, 0.3843137, 0, 1, 1,
0.6706521, 0.5353624, 0.9676287, 0.3921569, 0, 1, 1,
0.6750676, -0.5673775, 2.598845, 0.3960784, 0, 1, 1,
0.6768177, -1.356226, 1.431088, 0.4039216, 0, 1, 1,
0.6777718, -0.7917193, 3.309375, 0.4117647, 0, 1, 1,
0.6784546, -0.1996639, 1.8038, 0.4156863, 0, 1, 1,
0.6786327, -0.4742413, 5.137623, 0.4235294, 0, 1, 1,
0.6789995, 0.7557343, -1.510521, 0.427451, 0, 1, 1,
0.6861272, -0.4807576, 1.795818, 0.4352941, 0, 1, 1,
0.687474, -2.378426, 2.458092, 0.4392157, 0, 1, 1,
0.6886595, -1.393785, 3.56252, 0.4470588, 0, 1, 1,
0.6893291, -0.3023863, 0.9381768, 0.4509804, 0, 1, 1,
0.7014164, 0.9551644, 1.608822, 0.4588235, 0, 1, 1,
0.7018487, 1.513922, -1.418377, 0.4627451, 0, 1, 1,
0.7102384, -0.5954589, 1.919531, 0.4705882, 0, 1, 1,
0.7123427, 0.07800984, 0.2057264, 0.4745098, 0, 1, 1,
0.7131481, -0.8739361, 3.046861, 0.4823529, 0, 1, 1,
0.7152144, -1.411006, 3.313278, 0.4862745, 0, 1, 1,
0.7155272, 1.957671, 1.07383, 0.4941176, 0, 1, 1,
0.7243384, -0.7446091, 1.585589, 0.5019608, 0, 1, 1,
0.7363602, -0.08597881, 2.800632, 0.5058824, 0, 1, 1,
0.7390407, -0.03717182, 1.308784, 0.5137255, 0, 1, 1,
0.740413, -0.2349921, 2.378063, 0.5176471, 0, 1, 1,
0.7494874, 0.6543995, 0.3449804, 0.5254902, 0, 1, 1,
0.7508752, 0.1651871, 3.349556, 0.5294118, 0, 1, 1,
0.7512844, -0.925504, 2.607263, 0.5372549, 0, 1, 1,
0.755168, -1.699683, 3.010767, 0.5411765, 0, 1, 1,
0.7573381, 0.4219005, 0.5654377, 0.5490196, 0, 1, 1,
0.7695686, -0.8046165, -0.1019904, 0.5529412, 0, 1, 1,
0.769861, -0.0162357, 2.307208, 0.5607843, 0, 1, 1,
0.770262, 1.155317, -0.6864128, 0.5647059, 0, 1, 1,
0.7767507, -0.0754422, 2.173112, 0.572549, 0, 1, 1,
0.7774864, 0.4297566, 1.839739, 0.5764706, 0, 1, 1,
0.7820847, -0.2867546, 1.435689, 0.5843138, 0, 1, 1,
0.7829233, 0.9704511, 1.390729, 0.5882353, 0, 1, 1,
0.7973232, 0.1955736, 3.202462, 0.5960785, 0, 1, 1,
0.797726, 0.9447296, 2.08011, 0.6039216, 0, 1, 1,
0.7978609, 0.8196756, -0.2689279, 0.6078432, 0, 1, 1,
0.8012382, -0.5872068, 3.1682, 0.6156863, 0, 1, 1,
0.8068968, 1.004691, 0.195419, 0.6196079, 0, 1, 1,
0.8077164, -0.3628043, 2.202495, 0.627451, 0, 1, 1,
0.8077564, 1.180751, 1.386376, 0.6313726, 0, 1, 1,
0.8078467, 0.6130145, -0.2987096, 0.6392157, 0, 1, 1,
0.8095654, -0.9851199, 2.557678, 0.6431373, 0, 1, 1,
0.8097263, -1.075849, 3.110911, 0.6509804, 0, 1, 1,
0.8125724, -0.8299335, 4.371008, 0.654902, 0, 1, 1,
0.8181653, 0.4273115, 1.728215, 0.6627451, 0, 1, 1,
0.8273023, 0.08727682, 0.145294, 0.6666667, 0, 1, 1,
0.828521, 0.009655172, 2.118715, 0.6745098, 0, 1, 1,
0.8317516, -1.678233, 2.026543, 0.6784314, 0, 1, 1,
0.8330842, -2.209285, 2.042536, 0.6862745, 0, 1, 1,
0.8332587, 1.407586, -0.2178324, 0.6901961, 0, 1, 1,
0.8353252, 0.2672455, 0.4022247, 0.6980392, 0, 1, 1,
0.8354174, -0.4594157, 0.5694433, 0.7058824, 0, 1, 1,
0.843134, -1.276856, 1.680808, 0.7098039, 0, 1, 1,
0.8432059, 0.374979, 1.22583, 0.7176471, 0, 1, 1,
0.8479527, 1.084508, 0.9866937, 0.7215686, 0, 1, 1,
0.8516983, 0.9735472, 2.079974, 0.7294118, 0, 1, 1,
0.8562058, 3.696587, -1.367374, 0.7333333, 0, 1, 1,
0.8593064, 0.8302131, 0.025923, 0.7411765, 0, 1, 1,
0.8602464, -0.1764408, 0.2853881, 0.7450981, 0, 1, 1,
0.8655526, 1.626047, 0.5787552, 0.7529412, 0, 1, 1,
0.8676167, -0.6932902, 2.231987, 0.7568628, 0, 1, 1,
0.8679091, -1.233445, 2.669548, 0.7647059, 0, 1, 1,
0.8680871, 1.395787, -0.1889233, 0.7686275, 0, 1, 1,
0.8708304, -0.747571, -0.2537858, 0.7764706, 0, 1, 1,
0.8758224, 0.8127904, 0.4429007, 0.7803922, 0, 1, 1,
0.8776587, -0.5476354, 2.551816, 0.7882353, 0, 1, 1,
0.883222, 0.161968, 2.06584, 0.7921569, 0, 1, 1,
0.8856943, 1.154842, 0.8383157, 0.8, 0, 1, 1,
0.8859194, 0.3827682, 0.4402098, 0.8078431, 0, 1, 1,
0.9097459, -0.7275427, 0.4440256, 0.8117647, 0, 1, 1,
0.9118844, -1.908696, 2.9002, 0.8196079, 0, 1, 1,
0.9218667, 0.2459349, -0.5555142, 0.8235294, 0, 1, 1,
0.9277915, -0.789279, 2.597561, 0.8313726, 0, 1, 1,
0.9350622, 0.6751652, 1.221239, 0.8352941, 0, 1, 1,
0.9383667, 1.310678, 0.9450992, 0.8431373, 0, 1, 1,
0.9431008, 0.2963274, 0.3886186, 0.8470588, 0, 1, 1,
0.9444546, -0.1101208, 0.9323758, 0.854902, 0, 1, 1,
0.9514355, -1.395002, 2.981548, 0.8588235, 0, 1, 1,
0.9584206, -1.504559, 1.992866, 0.8666667, 0, 1, 1,
0.9649855, -0.1865881, 1.823572, 0.8705882, 0, 1, 1,
0.9661855, -0.8555158, 3.005609, 0.8784314, 0, 1, 1,
0.9696072, -0.1693991, 2.00753, 0.8823529, 0, 1, 1,
0.9728777, -0.001766311, 2.529826, 0.8901961, 0, 1, 1,
0.9734886, -0.3637497, 1.183013, 0.8941177, 0, 1, 1,
0.9736698, 0.07443124, 2.571537, 0.9019608, 0, 1, 1,
0.9804608, 1.910771, -1.105022, 0.9098039, 0, 1, 1,
0.9806001, -0.2614428, 2.399927, 0.9137255, 0, 1, 1,
0.9916971, 1.039327, 0.08376763, 0.9215686, 0, 1, 1,
0.9954959, -0.392769, 0.68542, 0.9254902, 0, 1, 1,
0.9964378, 0.9218349, 1.20451, 0.9333333, 0, 1, 1,
0.9970056, -0.6231574, 3.906103, 0.9372549, 0, 1, 1,
1.003105, -0.1269679, 2.159405, 0.945098, 0, 1, 1,
1.010251, 0.3520558, 2.292025, 0.9490196, 0, 1, 1,
1.014668, 1.621665, 0.266642, 0.9568627, 0, 1, 1,
1.021588, -1.098702, 0.5197837, 0.9607843, 0, 1, 1,
1.022133, -1.668298, 3.177601, 0.9686275, 0, 1, 1,
1.024168, 1.518097, 0.02671877, 0.972549, 0, 1, 1,
1.026416, -0.9327025, 2.597543, 0.9803922, 0, 1, 1,
1.030836, -2.537981, 0.1812881, 0.9843137, 0, 1, 1,
1.037545, -1.153765, 1.990118, 0.9921569, 0, 1, 1,
1.038689, 1.779403, 1.055522, 0.9960784, 0, 1, 1,
1.041397, -0.5826554, 1.782396, 1, 0, 0.9960784, 1,
1.046252, 0.1979684, 0.8004174, 1, 0, 0.9882353, 1,
1.046287, 0.2055822, 0.9020602, 1, 0, 0.9843137, 1,
1.050857, -0.07958872, 2.403525, 1, 0, 0.9764706, 1,
1.054467, 0.05465483, -0.1512089, 1, 0, 0.972549, 1,
1.058951, -0.8875695, 2.532894, 1, 0, 0.9647059, 1,
1.062909, -1.242614, 4.391935, 1, 0, 0.9607843, 1,
1.073194, 0.5361133, -0.2775573, 1, 0, 0.9529412, 1,
1.074679, 0.6780585, -0.1596394, 1, 0, 0.9490196, 1,
1.075304, -0.7478056, 1.315845, 1, 0, 0.9411765, 1,
1.078324, 0.1688713, 2.996645, 1, 0, 0.9372549, 1,
1.078626, 0.4813044, 2.247362, 1, 0, 0.9294118, 1,
1.082465, 1.34263, 0.8817305, 1, 0, 0.9254902, 1,
1.084133, -0.08842327, 0.1790187, 1, 0, 0.9176471, 1,
1.086633, -0.6792298, 2.380435, 1, 0, 0.9137255, 1,
1.095217, -0.05428157, 1.724916, 1, 0, 0.9058824, 1,
1.101249, -0.6854632, 1.402712, 1, 0, 0.9019608, 1,
1.103314, 0.938701, 1.664363, 1, 0, 0.8941177, 1,
1.10592, 2.828102, -0.3666547, 1, 0, 0.8862745, 1,
1.111587, -2.498577, 2.176161, 1, 0, 0.8823529, 1,
1.126047, 0.6389232, 0.9348333, 1, 0, 0.8745098, 1,
1.129155, -1.180981, 2.012332, 1, 0, 0.8705882, 1,
1.131146, 0.5055654, -0.1571925, 1, 0, 0.8627451, 1,
1.135376, -0.6309252, 1.038828, 1, 0, 0.8588235, 1,
1.148941, 0.9484073, -0.6157439, 1, 0, 0.8509804, 1,
1.164678, 0.1384659, 2.589186, 1, 0, 0.8470588, 1,
1.16514, 0.504549, 0.7040156, 1, 0, 0.8392157, 1,
1.166081, 1.22107, 3.715122, 1, 0, 0.8352941, 1,
1.175358, -0.1012559, 0.3829417, 1, 0, 0.827451, 1,
1.183509, -0.2271553, 0.2430269, 1, 0, 0.8235294, 1,
1.184584, -0.09716651, 1.195688, 1, 0, 0.8156863, 1,
1.185054, 1.545934, 0.6423931, 1, 0, 0.8117647, 1,
1.190804, -0.1318263, -0.9003019, 1, 0, 0.8039216, 1,
1.199493, 0.1972001, 0.02704296, 1, 0, 0.7960784, 1,
1.200727, -0.4092285, 0.8011415, 1, 0, 0.7921569, 1,
1.201664, -0.1989438, 1.987841, 1, 0, 0.7843137, 1,
1.213196, 0.596844, 0.8342204, 1, 0, 0.7803922, 1,
1.215718, -0.8375534, 2.016232, 1, 0, 0.772549, 1,
1.226016, 1.011928, 0.4167617, 1, 0, 0.7686275, 1,
1.227501, -0.845431, 2.589869, 1, 0, 0.7607843, 1,
1.23221, 0.810856, -0.5757118, 1, 0, 0.7568628, 1,
1.238528, -1.351712, 2.454897, 1, 0, 0.7490196, 1,
1.240385, -0.8534053, 3.350957, 1, 0, 0.7450981, 1,
1.240939, -1.460837, 0.8020159, 1, 0, 0.7372549, 1,
1.243248, 0.5882084, 1.02178, 1, 0, 0.7333333, 1,
1.248497, 0.1133615, 2.206422, 1, 0, 0.7254902, 1,
1.250312, 0.8147151, 2.044648, 1, 0, 0.7215686, 1,
1.255858, 0.3010302, -0.9491019, 1, 0, 0.7137255, 1,
1.266879, 2.177223, 0.1024404, 1, 0, 0.7098039, 1,
1.272599, -1.796398, 3.6894, 1, 0, 0.7019608, 1,
1.272881, 0.6223428, 0.952381, 1, 0, 0.6941177, 1,
1.274395, -0.8685424, 1.658614, 1, 0, 0.6901961, 1,
1.282202, -1.535381, 1.152167, 1, 0, 0.682353, 1,
1.284622, 0.1267682, 0.3691667, 1, 0, 0.6784314, 1,
1.30618, 2.151742, -0.1985993, 1, 0, 0.6705883, 1,
1.307338, 0.9734927, -0.1785761, 1, 0, 0.6666667, 1,
1.307759, 0.4465713, 0.3557215, 1, 0, 0.6588235, 1,
1.31116, -0.7962906, 1.355989, 1, 0, 0.654902, 1,
1.327079, 0.8679095, 1.764154, 1, 0, 0.6470588, 1,
1.333459, 0.368193, 1.99925, 1, 0, 0.6431373, 1,
1.33362, 1.826994, -1.164564, 1, 0, 0.6352941, 1,
1.336545, 1.533851, 0.01576997, 1, 0, 0.6313726, 1,
1.342623, 1.458532, 0.4356752, 1, 0, 0.6235294, 1,
1.348428, -1.014699, 2.164693, 1, 0, 0.6196079, 1,
1.348871, 0.810219, 0.4626377, 1, 0, 0.6117647, 1,
1.350215, -1.787012, 2.770781, 1, 0, 0.6078432, 1,
1.350314, 1.263628, 1.041655, 1, 0, 0.6, 1,
1.356916, -0.1645013, 1.666789, 1, 0, 0.5921569, 1,
1.370708, 1.452086, 1.534772, 1, 0, 0.5882353, 1,
1.374399, 0.6648197, 2.116855, 1, 0, 0.5803922, 1,
1.376416, 1.050628, 0.3472793, 1, 0, 0.5764706, 1,
1.38338, -1.597338, 2.624395, 1, 0, 0.5686275, 1,
1.390476, -0.6544, 0.6114963, 1, 0, 0.5647059, 1,
1.396562, -0.5976387, 3.204891, 1, 0, 0.5568628, 1,
1.405353, -0.9803545, 3.595156, 1, 0, 0.5529412, 1,
1.405487, 2.193808, 1.218658, 1, 0, 0.5450981, 1,
1.415814, -0.5064015, 1.957489, 1, 0, 0.5411765, 1,
1.422376, 0.5609382, 3.254741, 1, 0, 0.5333334, 1,
1.42792, 0.4027847, 1.068505, 1, 0, 0.5294118, 1,
1.431006, -0.04345361, 2.078496, 1, 0, 0.5215687, 1,
1.439559, 0.5090626, -0.6987677, 1, 0, 0.5176471, 1,
1.442599, -0.4465882, 1.987552, 1, 0, 0.509804, 1,
1.446818, 1.360048, 0.5265971, 1, 0, 0.5058824, 1,
1.450752, 0.1459414, 0.6618497, 1, 0, 0.4980392, 1,
1.460922, -0.09370998, 1.849149, 1, 0, 0.4901961, 1,
1.467131, 0.3742116, 1.233498, 1, 0, 0.4862745, 1,
1.468027, 0.2739875, 1.077619, 1, 0, 0.4784314, 1,
1.469934, 0.3612823, 1.412464, 1, 0, 0.4745098, 1,
1.485919, -0.4740792, 1.09458, 1, 0, 0.4666667, 1,
1.48776, -0.6255581, 3.43529, 1, 0, 0.4627451, 1,
1.49105, -0.04643057, 2.132489, 1, 0, 0.454902, 1,
1.498919, 1.147319, 3.025895, 1, 0, 0.4509804, 1,
1.508042, -1.269049, 0.6340117, 1, 0, 0.4431373, 1,
1.509346, -0.8409114, 2.105997, 1, 0, 0.4392157, 1,
1.509635, -0.5587637, 1.69577, 1, 0, 0.4313726, 1,
1.510571, -0.100504, 0.1691257, 1, 0, 0.427451, 1,
1.514512, -0.9213889, 2.994169, 1, 0, 0.4196078, 1,
1.519147, -0.1889419, 1.208145, 1, 0, 0.4156863, 1,
1.521411, -1.943899, 2.118275, 1, 0, 0.4078431, 1,
1.524243, 0.03662572, 0.7889272, 1, 0, 0.4039216, 1,
1.526637, -2.001663, 2.097334, 1, 0, 0.3960784, 1,
1.527055, 1.51599, 2.216913, 1, 0, 0.3882353, 1,
1.52773, 2.220787, 1.142986, 1, 0, 0.3843137, 1,
1.528787, 0.205392, 1.348072, 1, 0, 0.3764706, 1,
1.539854, -0.6743697, 0.9884652, 1, 0, 0.372549, 1,
1.541054, 1.441688, -0.02784546, 1, 0, 0.3647059, 1,
1.547081, -0.6023933, 2.003421, 1, 0, 0.3607843, 1,
1.547636, -0.3838917, -0.06080353, 1, 0, 0.3529412, 1,
1.549235, 1.113309, 1.492196, 1, 0, 0.3490196, 1,
1.550311, 0.5242277, 4.41617, 1, 0, 0.3411765, 1,
1.55095, -0.5287953, 1.799996, 1, 0, 0.3372549, 1,
1.557087, 0.491842, 2.390496, 1, 0, 0.3294118, 1,
1.557644, -0.2068485, 1.461042, 1, 0, 0.3254902, 1,
1.582839, 0.1369277, 2.186355, 1, 0, 0.3176471, 1,
1.611179, -0.3135124, 1.66449, 1, 0, 0.3137255, 1,
1.639788, 0.5824367, 1.185097, 1, 0, 0.3058824, 1,
1.644988, -0.87676, 1.437273, 1, 0, 0.2980392, 1,
1.645252, 0.7584426, 1.182661, 1, 0, 0.2941177, 1,
1.646563, 1.748678, -0.03503264, 1, 0, 0.2862745, 1,
1.647443, 0.6686817, 1.035466, 1, 0, 0.282353, 1,
1.695239, -1.304607, 0.4171037, 1, 0, 0.2745098, 1,
1.719878, 0.3509653, 1.622303, 1, 0, 0.2705882, 1,
1.735364, 0.191982, 1.859422, 1, 0, 0.2627451, 1,
1.741885, -0.8847815, 3.082283, 1, 0, 0.2588235, 1,
1.761339, -0.09861991, 2.236692, 1, 0, 0.2509804, 1,
1.786553, 0.2955224, 2.000292, 1, 0, 0.2470588, 1,
1.803297, -0.29381, 2.791051, 1, 0, 0.2392157, 1,
1.814863, -0.3541136, 0.7984241, 1, 0, 0.2352941, 1,
1.832263, -0.8786915, 1.63232, 1, 0, 0.227451, 1,
1.83905, -0.6699485, 3.744088, 1, 0, 0.2235294, 1,
1.852598, 0.2746196, 0.8861154, 1, 0, 0.2156863, 1,
1.920165, 0.1746699, 1.962712, 1, 0, 0.2117647, 1,
1.938295, -1.442156, 0.8965679, 1, 0, 0.2039216, 1,
1.949556, -0.5990329, -0.436523, 1, 0, 0.1960784, 1,
1.95356, -0.1842846, 1.681715, 1, 0, 0.1921569, 1,
1.957959, -0.8141625, 2.237687, 1, 0, 0.1843137, 1,
1.958067, -1.710092, 2.49722, 1, 0, 0.1803922, 1,
1.958922, 0.06489841, -0.9374163, 1, 0, 0.172549, 1,
1.986615, -1.387219, 3.141362, 1, 0, 0.1686275, 1,
1.998742, 0.06022062, 1.175748, 1, 0, 0.1607843, 1,
2.012755, 1.601475, 1.291818, 1, 0, 0.1568628, 1,
2.017099, 0.8879062, 1.1317, 1, 0, 0.1490196, 1,
2.02562, 0.1120843, 1.809573, 1, 0, 0.145098, 1,
2.032598, -1.266485, 1.328589, 1, 0, 0.1372549, 1,
2.049366, -0.3811526, 2.808657, 1, 0, 0.1333333, 1,
2.060467, -1.209368, 4.613493, 1, 0, 0.1254902, 1,
2.11618, 0.5619933, 2.470504, 1, 0, 0.1215686, 1,
2.116585, -1.923989, 1.223987, 1, 0, 0.1137255, 1,
2.124438, 0.7974052, -0.1248701, 1, 0, 0.1098039, 1,
2.132073, 0.9027204, 0.5739241, 1, 0, 0.1019608, 1,
2.137826, 1.049733, 2.732084, 1, 0, 0.09411765, 1,
2.140965, 0.2543525, 1.707704, 1, 0, 0.09019608, 1,
2.167138, 1.058364, 0.606819, 1, 0, 0.08235294, 1,
2.174246, -1.542783, 3.69911, 1, 0, 0.07843138, 1,
2.204044, 1.311667, 0.6371461, 1, 0, 0.07058824, 1,
2.209429, -0.0477067, 0.2473186, 1, 0, 0.06666667, 1,
2.227148, 1.296632, 1.601025, 1, 0, 0.05882353, 1,
2.244739, -0.4415175, 0.222377, 1, 0, 0.05490196, 1,
2.298445, -0.9208963, 1.000769, 1, 0, 0.04705882, 1,
2.299278, -1.872219, 1.555389, 1, 0, 0.04313726, 1,
2.311726, -2.422844, 2.224764, 1, 0, 0.03529412, 1,
2.319202, -1.440037, 1.198626, 1, 0, 0.03137255, 1,
2.355702, -0.7407525, 1.124956, 1, 0, 0.02352941, 1,
2.474147, -0.238541, 0.6000443, 1, 0, 0.01960784, 1,
2.517393, 1.427884, 1.620947, 1, 0, 0.01176471, 1,
2.633841, 0.7553646, 1.416262, 1, 0, 0.007843138, 1
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
-0.2462782, -4.42881, -7.123198, 0, -0.5, 0.5, 0.5,
-0.2462782, -4.42881, -7.123198, 1, -0.5, 0.5, 0.5,
-0.2462782, -4.42881, -7.123198, 1, 1.5, 0.5, 0.5,
-0.2462782, -4.42881, -7.123198, 0, 1.5, 0.5, 0.5
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
-4.102758, 0.2227105, -7.123198, 0, -0.5, 0.5, 0.5,
-4.102758, 0.2227105, -7.123198, 1, -0.5, 0.5, 0.5,
-4.102758, 0.2227105, -7.123198, 1, 1.5, 0.5, 0.5,
-4.102758, 0.2227105, -7.123198, 0, 1.5, 0.5, 0.5
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
-4.102758, -4.42881, -0.07814097, 0, -0.5, 0.5, 0.5,
-4.102758, -4.42881, -0.07814097, 1, -0.5, 0.5, 0.5,
-4.102758, -4.42881, -0.07814097, 1, 1.5, 0.5, 0.5,
-4.102758, -4.42881, -0.07814097, 0, 1.5, 0.5, 0.5
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
-3, -3.355382, -5.497416,
2, -3.355382, -5.497416,
-3, -3.355382, -5.497416,
-3, -3.534287, -5.768379,
-2, -3.355382, -5.497416,
-2, -3.534287, -5.768379,
-1, -3.355382, -5.497416,
-1, -3.534287, -5.768379,
0, -3.355382, -5.497416,
0, -3.534287, -5.768379,
1, -3.355382, -5.497416,
1, -3.534287, -5.768379,
2, -3.355382, -5.497416,
2, -3.534287, -5.768379
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
-3, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
-3, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
-3, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
-3, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5,
-2, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
-2, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
-2, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
-2, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5,
-1, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
-1, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
-1, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
-1, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5,
0, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
0, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
0, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
0, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5,
1, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
1, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
1, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
1, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5,
2, -3.892096, -6.310307, 0, -0.5, 0.5, 0.5,
2, -3.892096, -6.310307, 1, -0.5, 0.5, 0.5,
2, -3.892096, -6.310307, 1, 1.5, 0.5, 0.5,
2, -3.892096, -6.310307, 0, 1.5, 0.5, 0.5
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
-3.212801, -3, -5.497416,
-3.212801, 3, -5.497416,
-3.212801, -3, -5.497416,
-3.361127, -3, -5.768379,
-3.212801, -2, -5.497416,
-3.361127, -2, -5.768379,
-3.212801, -1, -5.497416,
-3.361127, -1, -5.768379,
-3.212801, 0, -5.497416,
-3.361127, 0, -5.768379,
-3.212801, 1, -5.497416,
-3.361127, 1, -5.768379,
-3.212801, 2, -5.497416,
-3.361127, 2, -5.768379,
-3.212801, 3, -5.497416,
-3.361127, 3, -5.768379
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
-3.65778, -3, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, -3, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, -3, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, -3, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, -2, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, -2, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, -2, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, -2, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, -1, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, -1, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, -1, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, -1, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, 0, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, 0, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, 0, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, 0, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, 1, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, 1, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, 1, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, 1, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, 2, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, 2, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, 2, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, 2, -6.310307, 0, 1.5, 0.5, 0.5,
-3.65778, 3, -6.310307, 0, -0.5, 0.5, 0.5,
-3.65778, 3, -6.310307, 1, -0.5, 0.5, 0.5,
-3.65778, 3, -6.310307, 1, 1.5, 0.5, 0.5,
-3.65778, 3, -6.310307, 0, 1.5, 0.5, 0.5
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
-3.212801, -3.355382, -4,
-3.212801, -3.355382, 4,
-3.212801, -3.355382, -4,
-3.361127, -3.534287, -4,
-3.212801, -3.355382, -2,
-3.361127, -3.534287, -2,
-3.212801, -3.355382, 0,
-3.361127, -3.534287, 0,
-3.212801, -3.355382, 2,
-3.361127, -3.534287, 2,
-3.212801, -3.355382, 4,
-3.361127, -3.534287, 4
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
-3.65778, -3.892096, -4, 0, -0.5, 0.5, 0.5,
-3.65778, -3.892096, -4, 1, -0.5, 0.5, 0.5,
-3.65778, -3.892096, -4, 1, 1.5, 0.5, 0.5,
-3.65778, -3.892096, -4, 0, 1.5, 0.5, 0.5,
-3.65778, -3.892096, -2, 0, -0.5, 0.5, 0.5,
-3.65778, -3.892096, -2, 1, -0.5, 0.5, 0.5,
-3.65778, -3.892096, -2, 1, 1.5, 0.5, 0.5,
-3.65778, -3.892096, -2, 0, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 0, 0, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 0, 1, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 0, 1, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 0, 0, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 2, 0, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 2, 1, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 2, 1, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 2, 0, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 4, 0, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 4, 1, -0.5, 0.5, 0.5,
-3.65778, -3.892096, 4, 1, 1.5, 0.5, 0.5,
-3.65778, -3.892096, 4, 0, 1.5, 0.5, 0.5
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
-3.212801, -3.355382, -5.497416,
-3.212801, 3.800803, -5.497416,
-3.212801, -3.355382, 5.341134,
-3.212801, 3.800803, 5.341134,
-3.212801, -3.355382, -5.497416,
-3.212801, -3.355382, 5.341134,
-3.212801, 3.800803, -5.497416,
-3.212801, 3.800803, 5.341134,
-3.212801, -3.355382, -5.497416,
2.720245, -3.355382, -5.497416,
-3.212801, -3.355382, 5.341134,
2.720245, -3.355382, 5.341134,
-3.212801, 3.800803, -5.497416,
2.720245, 3.800803, -5.497416,
-3.212801, 3.800803, 5.341134,
2.720245, 3.800803, 5.341134,
2.720245, -3.355382, -5.497416,
2.720245, 3.800803, -5.497416,
2.720245, -3.355382, 5.341134,
2.720245, 3.800803, 5.341134,
2.720245, -3.355382, -5.497416,
2.720245, -3.355382, 5.341134,
2.720245, 3.800803, -5.497416,
2.720245, 3.800803, 5.341134
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
var radius = 7.62464;
var distance = 33.92289;
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
mvMatrix.translate( 0.2462782, -0.2227105, 0.07814097 );
mvMatrix.scale( 1.38949, 1.151998, 0.7606102 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.92289);
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
3-ketocarbofuran<-read.table("3-ketocarbofuran.xyz", skip=1)
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
-3.126398, -1.336572, -2.034306, 0, 0, 1, 1, 1,
-2.696121, -0.2651023, -0.7986919, 1, 0, 0, 1, 1,
-2.664685, -0.2338361, -2.258704, 1, 0, 0, 1, 1,
-2.509846, 0.7103983, -1.695944, 1, 0, 0, 1, 1,
-2.465739, -0.04850173, -1.168059, 1, 0, 0, 1, 1,
-2.434677, -0.5834287, -1.185815, 1, 0, 0, 1, 1,
-2.377559, 0.4976988, 0.6239684, 0, 0, 0, 1, 1,
-2.362206, -0.3682826, -3.761329, 0, 0, 0, 1, 1,
-2.358288, 1.589805, -1.145953, 0, 0, 0, 1, 1,
-2.354268, 1.381364, -2.442738, 0, 0, 0, 1, 1,
-2.307637, 0.08235589, -0.5177434, 0, 0, 0, 1, 1,
-2.270997, 0.5245482, -1.95742, 0, 0, 0, 1, 1,
-2.263129, -0.2474197, -2.271918, 0, 0, 0, 1, 1,
-2.225723, -0.9730668, -1.241857, 1, 1, 1, 1, 1,
-2.211153, -1.000355, -2.583908, 1, 1, 1, 1, 1,
-2.164885, 0.5258583, -0.9177594, 1, 1, 1, 1, 1,
-2.119719, -0.5691733, -2.129023, 1, 1, 1, 1, 1,
-2.110773, -1.710606, -3.80127, 1, 1, 1, 1, 1,
-2.088464, -0.811452, -2.288445, 1, 1, 1, 1, 1,
-2.085676, 0.4845604, -1.432502, 1, 1, 1, 1, 1,
-2.050701, -1.73376, -2.187486, 1, 1, 1, 1, 1,
-2.050003, -0.01868632, -2.446735, 1, 1, 1, 1, 1,
-2.043055, 0.8355494, 0.1955261, 1, 1, 1, 1, 1,
-2.035795, 0.5546402, -2.563363, 1, 1, 1, 1, 1,
-2.034845, 1.057003, 0.076527, 1, 1, 1, 1, 1,
-2.020722, -0.4940145, -0.2266946, 1, 1, 1, 1, 1,
-2.008868, -1.254842, -3.858043, 1, 1, 1, 1, 1,
-1.997977, -1.48367, -3.37038, 1, 1, 1, 1, 1,
-1.962218, -1.065018, -2.779829, 0, 0, 1, 1, 1,
-1.94236, 0.2523732, -1.258597, 1, 0, 0, 1, 1,
-1.916241, 1.377793, 0.2549256, 1, 0, 0, 1, 1,
-1.899971, -0.8078935, -2.643366, 1, 0, 0, 1, 1,
-1.878152, -1.718315, -3.392945, 1, 0, 0, 1, 1,
-1.824082, 0.4671169, -1.80285, 1, 0, 0, 1, 1,
-1.800337, -0.769142, -2.547018, 0, 0, 0, 1, 1,
-1.793631, -0.231969, -2.131583, 0, 0, 0, 1, 1,
-1.778723, -0.6548933, -2.543087, 0, 0, 0, 1, 1,
-1.756421, -0.4092711, -2.107438, 0, 0, 0, 1, 1,
-1.752507, 1.978283, -0.41391, 0, 0, 0, 1, 1,
-1.751282, -0.3674627, -2.052927, 0, 0, 0, 1, 1,
-1.721628, -0.05642401, -1.909028, 0, 0, 0, 1, 1,
-1.709664, -0.7099079, 0.6052021, 1, 1, 1, 1, 1,
-1.695467, -0.8650435, -2.978393, 1, 1, 1, 1, 1,
-1.684977, -0.6142873, -1.415917, 1, 1, 1, 1, 1,
-1.674714, 1.211381, -1.706666, 1, 1, 1, 1, 1,
-1.664878, 0.4684918, -0.590941, 1, 1, 1, 1, 1,
-1.640664, 0.711728, -2.081233, 1, 1, 1, 1, 1,
-1.634477, -0.3732903, -0.2125469, 1, 1, 1, 1, 1,
-1.631763, 1.213841, -2.147044, 1, 1, 1, 1, 1,
-1.612608, -1.229938, -0.3056581, 1, 1, 1, 1, 1,
-1.611649, 2.00624, 0.1940369, 1, 1, 1, 1, 1,
-1.607047, 0.07508215, -1.709833, 1, 1, 1, 1, 1,
-1.604587, -1.170115, -1.83217, 1, 1, 1, 1, 1,
-1.597671, -0.6601226, -1.800743, 1, 1, 1, 1, 1,
-1.587043, -0.4925231, -2.992296, 1, 1, 1, 1, 1,
-1.585842, 1.90831, 0.5375369, 1, 1, 1, 1, 1,
-1.564114, -1.111032, -0.2676196, 0, 0, 1, 1, 1,
-1.553371, 0.397984, 0.1765367, 1, 0, 0, 1, 1,
-1.549927, 1.399884, -0.8390384, 1, 0, 0, 1, 1,
-1.542774, 1.241233, -1.238016, 1, 0, 0, 1, 1,
-1.537221, -0.79338, -1.425461, 1, 0, 0, 1, 1,
-1.535678, 0.5049975, -2.261747, 1, 0, 0, 1, 1,
-1.523601, -0.2629534, -1.485559, 0, 0, 0, 1, 1,
-1.513634, -0.5001671, -3.384835, 0, 0, 0, 1, 1,
-1.509763, -1.098408, -2.897405, 0, 0, 0, 1, 1,
-1.507829, -0.4272656, -2.689125, 0, 0, 0, 1, 1,
-1.505497, -0.975007, -2.870947, 0, 0, 0, 1, 1,
-1.498753, -0.4758473, -1.84061, 0, 0, 0, 1, 1,
-1.492045, 1.794939, -1.524284, 0, 0, 0, 1, 1,
-1.4899, -0.3935093, -1.086073, 1, 1, 1, 1, 1,
-1.487169, 0.4540981, -0.8377286, 1, 1, 1, 1, 1,
-1.48355, 1.867223, -0.6117541, 1, 1, 1, 1, 1,
-1.482532, -1.462012, -3.376089, 1, 1, 1, 1, 1,
-1.44379, -1.426069, -3.200752, 1, 1, 1, 1, 1,
-1.433281, -0.657103, -1.772182, 1, 1, 1, 1, 1,
-1.433215, 1.238333, -0.2343928, 1, 1, 1, 1, 1,
-1.432978, -0.5472364, -2.221365, 1, 1, 1, 1, 1,
-1.430315, 0.1072356, -1.875936, 1, 1, 1, 1, 1,
-1.423319, 1.115252, -2.848504, 1, 1, 1, 1, 1,
-1.413864, -2.369033, -2.770467, 1, 1, 1, 1, 1,
-1.406948, -1.225138, -2.622585, 1, 1, 1, 1, 1,
-1.382196, 1.693478, -1.907205, 1, 1, 1, 1, 1,
-1.380371, 0.5905799, -1.383757, 1, 1, 1, 1, 1,
-1.374043, 0.7571384, -1.107263, 1, 1, 1, 1, 1,
-1.373023, -0.7691638, -2.972947, 0, 0, 1, 1, 1,
-1.372163, -0.3909595, -0.6093009, 1, 0, 0, 1, 1,
-1.368272, 0.8704168, -0.8290563, 1, 0, 0, 1, 1,
-1.355311, -0.3202851, -2.519678, 1, 0, 0, 1, 1,
-1.34926, -0.9452708, -3.881806, 1, 0, 0, 1, 1,
-1.331767, 0.07109552, -2.073647, 1, 0, 0, 1, 1,
-1.309756, -0.5893968, -2.791441, 0, 0, 0, 1, 1,
-1.305535, -0.4520783, -0.9332216, 0, 0, 0, 1, 1,
-1.300467, 0.04647762, -1.752016, 0, 0, 0, 1, 1,
-1.293473, -1.216533, -2.928315, 0, 0, 0, 1, 1,
-1.280195, 1.37362, -0.297763, 0, 0, 0, 1, 1,
-1.271801, -0.6448342, -2.637699, 0, 0, 0, 1, 1,
-1.265512, 1.276013, 0.02513866, 0, 0, 0, 1, 1,
-1.255939, 1.054185, -0.007909024, 1, 1, 1, 1, 1,
-1.254226, 0.7850728, -0.7393208, 1, 1, 1, 1, 1,
-1.246752, 0.8212695, -1.939811, 1, 1, 1, 1, 1,
-1.227525, 0.1383342, -2.345425, 1, 1, 1, 1, 1,
-1.219378, -1.322558, -1.800334, 1, 1, 1, 1, 1,
-1.217161, -0.0864836, -1.945855, 1, 1, 1, 1, 1,
-1.212256, 0.1113887, 0.003903472, 1, 1, 1, 1, 1,
-1.208992, 2.321402, -1.048887, 1, 1, 1, 1, 1,
-1.196743, 0.787025, -1.167986, 1, 1, 1, 1, 1,
-1.195813, 1.193179, -0.2498419, 1, 1, 1, 1, 1,
-1.179312, 1.286852, -0.5063295, 1, 1, 1, 1, 1,
-1.176265, 1.03552, -0.835192, 1, 1, 1, 1, 1,
-1.169278, 0.2699786, -1.498517, 1, 1, 1, 1, 1,
-1.169132, 0.2566794, -0.8396167, 1, 1, 1, 1, 1,
-1.160247, -0.6347172, -0.8843981, 1, 1, 1, 1, 1,
-1.160044, 0.9772361, -0.1059734, 0, 0, 1, 1, 1,
-1.145314, -0.04114545, -2.946884, 1, 0, 0, 1, 1,
-1.142876, 0.4167042, -0.5081712, 1, 0, 0, 1, 1,
-1.142856, 1.512009, -1.375672, 1, 0, 0, 1, 1,
-1.131411, -1.018959, -0.09919775, 1, 0, 0, 1, 1,
-1.129438, -0.714649, -0.9007097, 1, 0, 0, 1, 1,
-1.125353, -0.1969849, -3.471783, 0, 0, 0, 1, 1,
-1.11957, -1.45954, -3.129243, 0, 0, 0, 1, 1,
-1.118856, 2.046288, 0.4755163, 0, 0, 0, 1, 1,
-1.118725, -0.7435428, -0.6315654, 0, 0, 0, 1, 1,
-1.099367, 0.5897393, -0.4991086, 0, 0, 0, 1, 1,
-1.09693, -1.408073, -2.012341, 0, 0, 0, 1, 1,
-1.089259, 0.05892547, -1.634384, 0, 0, 0, 1, 1,
-1.087994, -1.546672, -3.731489, 1, 1, 1, 1, 1,
-1.087772, 0.7421218, -1.217526, 1, 1, 1, 1, 1,
-1.080561, 1.546852, -0.2643344, 1, 1, 1, 1, 1,
-1.078434, 0.5233271, -2.458591, 1, 1, 1, 1, 1,
-1.06304, 1.918671, 0.6591642, 1, 1, 1, 1, 1,
-1.060445, 0.04191241, -1.327993, 1, 1, 1, 1, 1,
-1.048453, 0.9480948, -0.7838085, 1, 1, 1, 1, 1,
-1.047581, 0.2518876, -0.3939705, 1, 1, 1, 1, 1,
-1.04532, 0.473178, -2.902961, 1, 1, 1, 1, 1,
-1.039427, 0.2401656, -1.580842, 1, 1, 1, 1, 1,
-1.03629, 0.129882, 0.3198376, 1, 1, 1, 1, 1,
-1.035115, 1.437855, 0.6641129, 1, 1, 1, 1, 1,
-1.031682, -0.3534809, -1.947187, 1, 1, 1, 1, 1,
-1.031015, 0.7515427, -0.4150615, 1, 1, 1, 1, 1,
-1.029684, 1.295037, -1.521621, 1, 1, 1, 1, 1,
-1.028346, 1.054882, -0.9822797, 0, 0, 1, 1, 1,
-1.027688, 0.07833304, -0.5982843, 1, 0, 0, 1, 1,
-1.025066, -1.128682, -4.987752, 1, 0, 0, 1, 1,
-1.019157, 0.5763229, -1.059938, 1, 0, 0, 1, 1,
-1.016761, 2.052293, 0.3603262, 1, 0, 0, 1, 1,
-1.014975, -1.027109, -1.751336, 1, 0, 0, 1, 1,
-1.013626, -0.5039145, -3.095847, 0, 0, 0, 1, 1,
-1.004627, 1.459049, -0.5351763, 0, 0, 0, 1, 1,
-1.004442, 0.7769057, -0.5400804, 0, 0, 0, 1, 1,
-0.9993544, -0.2394759, -3.39751, 0, 0, 0, 1, 1,
-0.9982644, 0.1135873, -2.363043, 0, 0, 0, 1, 1,
-0.998041, -1.866712, -3.459748, 0, 0, 0, 1, 1,
-0.9957545, -1.065779, -1.840239, 0, 0, 0, 1, 1,
-0.9928883, 0.5451698, -0.4940611, 1, 1, 1, 1, 1,
-0.9864646, 0.7640526, -1.238367, 1, 1, 1, 1, 1,
-0.9842802, 1.1707, 0.305412, 1, 1, 1, 1, 1,
-0.9840501, 0.4457845, -1.488936, 1, 1, 1, 1, 1,
-0.9833275, -0.9832464, -2.211715, 1, 1, 1, 1, 1,
-0.9828885, 0.9201977, -1.642599, 1, 1, 1, 1, 1,
-0.9741223, 1.347681, -1.79402, 1, 1, 1, 1, 1,
-0.9687474, 0.9189613, 0.347878, 1, 1, 1, 1, 1,
-0.9520081, 0.0727282, -0.6203814, 1, 1, 1, 1, 1,
-0.9493791, -0.5181138, -2.700927, 1, 1, 1, 1, 1,
-0.945089, -0.253521, -2.239511, 1, 1, 1, 1, 1,
-0.9403821, -0.5994161, -2.980304, 1, 1, 1, 1, 1,
-0.936296, 0.4014516, -2.443736, 1, 1, 1, 1, 1,
-0.9355887, -2.078304, -3.653494, 1, 1, 1, 1, 1,
-0.9304467, 1.512175, -1.115756, 1, 1, 1, 1, 1,
-0.9291033, 0.418201, -2.909161, 0, 0, 1, 1, 1,
-0.9283039, 0.1158878, -2.155407, 1, 0, 0, 1, 1,
-0.9196274, 0.6723881, 0.6442595, 1, 0, 0, 1, 1,
-0.9188765, 1.211079, -1.357342, 1, 0, 0, 1, 1,
-0.917938, -0.6648676, -2.365839, 1, 0, 0, 1, 1,
-0.9163405, -1.533513, -3.38329, 1, 0, 0, 1, 1,
-0.9063662, 0.1606334, -1.026922, 0, 0, 0, 1, 1,
-0.9045601, 1.673135, -0.567256, 0, 0, 0, 1, 1,
-0.8993656, 1.784855, -1.065664, 0, 0, 0, 1, 1,
-0.8927476, -1.379013, -4.423275, 0, 0, 0, 1, 1,
-0.8905289, -0.2556431, -1.380638, 0, 0, 0, 1, 1,
-0.881056, -0.3934166, -2.655305, 0, 0, 0, 1, 1,
-0.8772869, 1.064974, 0.4297443, 0, 0, 0, 1, 1,
-0.8699381, 0.2309268, -0.05014082, 1, 1, 1, 1, 1,
-0.8671259, 3.230272, 0.2227295, 1, 1, 1, 1, 1,
-0.8659642, -0.3903963, -2.490656, 1, 1, 1, 1, 1,
-0.8583084, -0.7998563, -3.067687, 1, 1, 1, 1, 1,
-0.8566059, 1.207261, -0.5420171, 1, 1, 1, 1, 1,
-0.8532926, 2.501413, -1.234285, 1, 1, 1, 1, 1,
-0.8506668, 0.0880791, -2.120374, 1, 1, 1, 1, 1,
-0.8449693, 1.390787, -1.510878, 1, 1, 1, 1, 1,
-0.8382297, -0.1019466, -2.155102, 1, 1, 1, 1, 1,
-0.8379554, 1.058423, -1.412491, 1, 1, 1, 1, 1,
-0.8323557, -0.3658336, -1.46907, 1, 1, 1, 1, 1,
-0.8294867, -2.426311, -2.23319, 1, 1, 1, 1, 1,
-0.8272955, -0.5490193, -2.326813, 1, 1, 1, 1, 1,
-0.8257299, 1.679989, 1.352067, 1, 1, 1, 1, 1,
-0.825682, 0.1005987, -1.683792, 1, 1, 1, 1, 1,
-0.8206974, 0.9747717, -0.6773537, 0, 0, 1, 1, 1,
-0.8179109, -0.8283282, -2.641784, 1, 0, 0, 1, 1,
-0.8173091, 0.03979437, -1.450133, 1, 0, 0, 1, 1,
-0.8080107, -0.218837, -1.141331, 1, 0, 0, 1, 1,
-0.8039948, 0.249307, -2.224869, 1, 0, 0, 1, 1,
-0.8020624, 1.365344, -1.810972, 1, 0, 0, 1, 1,
-0.7995309, 0.9431564, -0.5174708, 0, 0, 0, 1, 1,
-0.7955549, 1.897665, -1.422247, 0, 0, 0, 1, 1,
-0.7948603, -1.231934, -2.95888, 0, 0, 0, 1, 1,
-0.7944337, -0.9857871, -0.9387227, 0, 0, 0, 1, 1,
-0.7877538, -1.604873, -2.057487, 0, 0, 0, 1, 1,
-0.7864422, 0.1455556, 0.1926041, 0, 0, 0, 1, 1,
-0.7862815, 0.2250626, 0.266691, 0, 0, 0, 1, 1,
-0.7797136, -2.013597, -2.65634, 1, 1, 1, 1, 1,
-0.7734439, -0.1196866, -1.737743, 1, 1, 1, 1, 1,
-0.7570025, 1.475357, 0.6124728, 1, 1, 1, 1, 1,
-0.753108, -1.974498, -3.776217, 1, 1, 1, 1, 1,
-0.7489481, -0.31203, 0.82609, 1, 1, 1, 1, 1,
-0.7475911, -0.06990156, -1.717779, 1, 1, 1, 1, 1,
-0.7459114, -0.9478984, -1.86523, 1, 1, 1, 1, 1,
-0.7452411, -0.9013132, -1.827444, 1, 1, 1, 1, 1,
-0.7446524, -0.3998457, -4.318992, 1, 1, 1, 1, 1,
-0.7336685, -0.1538628, -2.276502, 1, 1, 1, 1, 1,
-0.7287111, -1.240246, -3.496708, 1, 1, 1, 1, 1,
-0.7282513, -0.8443581, -3.398055, 1, 1, 1, 1, 1,
-0.7229871, 0.8195259, -0.8909322, 1, 1, 1, 1, 1,
-0.7213053, 0.8070294, -0.3305914, 1, 1, 1, 1, 1,
-0.7204102, 0.4278929, -0.5081571, 1, 1, 1, 1, 1,
-0.7201607, -0.3132243, -1.885799, 0, 0, 1, 1, 1,
-0.7113734, 0.1875604, -2.858685, 1, 0, 0, 1, 1,
-0.7109007, -1.842828, -3.816499, 1, 0, 0, 1, 1,
-0.7091462, -0.4042287, -3.395559, 1, 0, 0, 1, 1,
-0.7027892, 1.186245, 0.1848013, 1, 0, 0, 1, 1,
-0.7022775, -1.723491, -4.281978, 1, 0, 0, 1, 1,
-0.701833, -0.3604465, -1.880945, 0, 0, 0, 1, 1,
-0.700547, -0.2307364, -1.497739, 0, 0, 0, 1, 1,
-0.6992837, -0.1707836, -2.274536, 0, 0, 0, 1, 1,
-0.6951504, -0.931214, -3.216055, 0, 0, 0, 1, 1,
-0.6951031, 0.02317547, 0.03361412, 0, 0, 0, 1, 1,
-0.6938056, -1.024559, -2.336202, 0, 0, 0, 1, 1,
-0.6927807, 0.6711412, -0.1584995, 0, 0, 0, 1, 1,
-0.6927043, -1.003386, -4.627831, 1, 1, 1, 1, 1,
-0.6851473, 0.5081462, -1.088699, 1, 1, 1, 1, 1,
-0.6812365, -1.492805, -0.7076375, 1, 1, 1, 1, 1,
-0.6798751, 1.297168, -0.8733938, 1, 1, 1, 1, 1,
-0.6790168, 0.399154, -1.662709, 1, 1, 1, 1, 1,
-0.6724725, 0.3936491, -3.748582, 1, 1, 1, 1, 1,
-0.6718304, -0.3407074, -4.320198, 1, 1, 1, 1, 1,
-0.6712976, -1.226688, -3.221373, 1, 1, 1, 1, 1,
-0.6711254, 0.5325165, -1.550711, 1, 1, 1, 1, 1,
-0.6689802, -0.8334023, -1.771595, 1, 1, 1, 1, 1,
-0.6650673, -0.4337754, -3.216033, 1, 1, 1, 1, 1,
-0.6444259, -1.794831, -3.710424, 1, 1, 1, 1, 1,
-0.6436017, -0.610294, -1.284402, 1, 1, 1, 1, 1,
-0.6372567, -0.1449289, -2.510889, 1, 1, 1, 1, 1,
-0.6358162, -1.19435, -3.662407, 1, 1, 1, 1, 1,
-0.634922, -0.7563904, -0.2423389, 0, 0, 1, 1, 1,
-0.6333455, 0.8317595, 1.063502, 1, 0, 0, 1, 1,
-0.6259326, -2.088028, -4.021137, 1, 0, 0, 1, 1,
-0.6231327, 1.22951, -0.3822765, 1, 0, 0, 1, 1,
-0.620176, 0.2648501, -1.513121, 1, 0, 0, 1, 1,
-0.6189049, -0.02023445, -1.938203, 1, 0, 0, 1, 1,
-0.6115512, -0.958832, -1.98925, 0, 0, 0, 1, 1,
-0.6011291, 1.542712, 0.02619134, 0, 0, 0, 1, 1,
-0.5881653, 0.2468057, -2.33128, 0, 0, 0, 1, 1,
-0.5871661, -1.36604, -1.609078, 0, 0, 0, 1, 1,
-0.5859947, 1.511522, 0.6684538, 0, 0, 0, 1, 1,
-0.5760422, -1.012175, -1.798494, 0, 0, 0, 1, 1,
-0.566463, 0.06264123, -0.6189097, 0, 0, 0, 1, 1,
-0.565729, -1.664518, -3.336886, 1, 1, 1, 1, 1,
-0.5629713, 1.034762, -0.1461474, 1, 1, 1, 1, 1,
-0.5618486, 0.7000446, -0.4180329, 1, 1, 1, 1, 1,
-0.5549179, -1.327037, -2.141611, 1, 1, 1, 1, 1,
-0.5538757, 0.7339408, -0.4858704, 1, 1, 1, 1, 1,
-0.5538391, -0.05103812, -2.22811, 1, 1, 1, 1, 1,
-0.553355, 0.7612879, -0.4258837, 1, 1, 1, 1, 1,
-0.5509019, 0.6818198, -1.035314, 1, 1, 1, 1, 1,
-0.548961, -0.4563965, -2.373224, 1, 1, 1, 1, 1,
-0.5385514, -0.5350471, -3.195873, 1, 1, 1, 1, 1,
-0.5346619, 0.5745755, -0.6473485, 1, 1, 1, 1, 1,
-0.5336322, -0.3052151, -1.483113, 1, 1, 1, 1, 1,
-0.5319855, 0.6878616, -0.8241714, 1, 1, 1, 1, 1,
-0.5299532, 2.492466, -0.7035792, 1, 1, 1, 1, 1,
-0.5133377, -0.5079182, -2.858968, 1, 1, 1, 1, 1,
-0.506058, -1.111387, -1.315744, 0, 0, 1, 1, 1,
-0.5060241, -0.729215, -1.06416, 1, 0, 0, 1, 1,
-0.5048456, -1.312593, -2.593496, 1, 0, 0, 1, 1,
-0.5033925, -0.4311233, -2.872343, 1, 0, 0, 1, 1,
-0.5024418, -1.108473, -2.89514, 1, 0, 0, 1, 1,
-0.4962816, 2.178651, -0.1361949, 1, 0, 0, 1, 1,
-0.4962756, 0.2615759, -0.1203236, 0, 0, 0, 1, 1,
-0.4956039, 1.792247, -0.4606077, 0, 0, 0, 1, 1,
-0.4937608, 2.163583, 0.6085082, 0, 0, 0, 1, 1,
-0.4934044, -1.601283, -2.519844, 0, 0, 0, 1, 1,
-0.4927375, -2.081089, -3.165394, 0, 0, 0, 1, 1,
-0.4922049, 0.9326538, -0.1564805, 0, 0, 0, 1, 1,
-0.4879065, 1.514047, -2.551456, 0, 0, 0, 1, 1,
-0.4860817, -0.4308667, -3.049175, 1, 1, 1, 1, 1,
-0.482464, 0.9358276, -0.1948508, 1, 1, 1, 1, 1,
-0.4799699, 0.04377042, -0.9296502, 1, 1, 1, 1, 1,
-0.4786956, 1.470071, 2.018794, 1, 1, 1, 1, 1,
-0.4753614, -0.5196843, -3.817934, 1, 1, 1, 1, 1,
-0.4734342, 1.149223, -0.4554485, 1, 1, 1, 1, 1,
-0.473291, 1.037307, -0.166426, 1, 1, 1, 1, 1,
-0.4659226, -0.3089326, -4.540246, 1, 1, 1, 1, 1,
-0.4611496, -0.6386194, -3.966861, 1, 1, 1, 1, 1,
-0.4607652, -0.02774473, -1.726705, 1, 1, 1, 1, 1,
-0.4581352, 0.6174355, -1.13518, 1, 1, 1, 1, 1,
-0.4568996, -1.019719, -4.012566, 1, 1, 1, 1, 1,
-0.4529418, -1.20146, -2.762551, 1, 1, 1, 1, 1,
-0.4527139, -1.144461, -2.690695, 1, 1, 1, 1, 1,
-0.4516219, -1.104571, -2.905202, 1, 1, 1, 1, 1,
-0.4505905, 2.154298, 1.763161, 0, 0, 1, 1, 1,
-0.4465376, -2.718208, -3.595629, 1, 0, 0, 1, 1,
-0.4454274, -1.296188, -1.208715, 1, 0, 0, 1, 1,
-0.445307, 0.3930249, -4.070253, 1, 0, 0, 1, 1,
-0.4451407, -0.2144331, -1.269842, 1, 0, 0, 1, 1,
-0.4382288, 1.170171, 0.7966948, 1, 0, 0, 1, 1,
-0.4363286, 0.8205128, -0.9902683, 0, 0, 0, 1, 1,
-0.4354321, 0.004975892, -2.891855, 0, 0, 0, 1, 1,
-0.435027, -1.737178, -2.648013, 0, 0, 0, 1, 1,
-0.4348931, 0.7521592, -1.622267, 0, 0, 0, 1, 1,
-0.4282951, -1.59408, -2.450105, 0, 0, 0, 1, 1,
-0.4254794, -1.083577, -3.874693, 0, 0, 0, 1, 1,
-0.4239448, -0.5599167, -4.20725, 0, 0, 0, 1, 1,
-0.4235471, -0.9828843, -3.726656, 1, 1, 1, 1, 1,
-0.421429, -0.3339539, -2.667673, 1, 1, 1, 1, 1,
-0.416403, -0.8158394, -4.090656, 1, 1, 1, 1, 1,
-0.4163713, -1.583052, -1.223109, 1, 1, 1, 1, 1,
-0.4109866, -0.5499296, -2.249756, 1, 1, 1, 1, 1,
-0.4101914, -1.156966, -1.082117, 1, 1, 1, 1, 1,
-0.4016146, 1.677808, -0.567147, 1, 1, 1, 1, 1,
-0.3929799, 0.07563724, -2.590875, 1, 1, 1, 1, 1,
-0.392455, 2.031458, -1.611591, 1, 1, 1, 1, 1,
-0.3881969, -0.1888396, -2.151572, 1, 1, 1, 1, 1,
-0.3859703, -0.386469, -2.613786, 1, 1, 1, 1, 1,
-0.3832411, 1.938575, -1.999834, 1, 1, 1, 1, 1,
-0.377155, -1.020588, -1.676052, 1, 1, 1, 1, 1,
-0.3729537, -1.800016, -3.285445, 1, 1, 1, 1, 1,
-0.3712666, 1.282884, -0.7096996, 1, 1, 1, 1, 1,
-0.3610658, 0.2247024, 1.36615, 0, 0, 1, 1, 1,
-0.354176, 1.292093, -1.032873, 1, 0, 0, 1, 1,
-0.3539567, 1.118475, 0.1574002, 1, 0, 0, 1, 1,
-0.3531147, 0.06258591, -0.5572782, 1, 0, 0, 1, 1,
-0.3529068, -0.6751419, -3.30279, 1, 0, 0, 1, 1,
-0.3508547, 1.505101, -1.137231, 1, 0, 0, 1, 1,
-0.3501992, -0.2709694, -3.147055, 0, 0, 0, 1, 1,
-0.3497519, 0.7742091, 0.3997438, 0, 0, 0, 1, 1,
-0.3485079, 0.4799057, -0.561864, 0, 0, 0, 1, 1,
-0.3484176, 0.3411404, -1.919219, 0, 0, 0, 1, 1,
-0.3450131, -1.585517, -2.210549, 0, 0, 0, 1, 1,
-0.3415754, 1.550405, -1.145366, 0, 0, 0, 1, 1,
-0.3392865, -0.3069949, -1.536332, 0, 0, 0, 1, 1,
-0.3386167, -0.2440812, -2.15718, 1, 1, 1, 1, 1,
-0.3363132, 2.237496, -2.287538, 1, 1, 1, 1, 1,
-0.3319003, -1.3161, -1.461557, 1, 1, 1, 1, 1,
-0.3279482, -0.3729222, -1.202457, 1, 1, 1, 1, 1,
-0.319823, -0.1063647, -0.9531152, 1, 1, 1, 1, 1,
-0.3197289, -0.6406777, -2.373939, 1, 1, 1, 1, 1,
-0.3190193, -0.9720368, -2.611001, 1, 1, 1, 1, 1,
-0.3142816, 0.2145602, -1.687221, 1, 1, 1, 1, 1,
-0.308144, -0.5582297, -1.971682, 1, 1, 1, 1, 1,
-0.3079812, -0.9265299, -3.278339, 1, 1, 1, 1, 1,
-0.3073387, 0.7792784, -1.267229, 1, 1, 1, 1, 1,
-0.3058129, 1.030089, -0.5235342, 1, 1, 1, 1, 1,
-0.3016284, -1.375357, -3.889503, 1, 1, 1, 1, 1,
-0.3012086, 0.2537898, -0.1989345, 1, 1, 1, 1, 1,
-0.3001894, -0.2225555, -3.786036, 1, 1, 1, 1, 1,
-0.2942005, 0.1449572, 0.3477924, 0, 0, 1, 1, 1,
-0.2928763, 1.151676, -0.6341646, 1, 0, 0, 1, 1,
-0.2850684, -1.343571, -1.195329, 1, 0, 0, 1, 1,
-0.281572, -0.8822428, -1.328634, 1, 0, 0, 1, 1,
-0.2815444, -2.040844, -1.474984, 1, 0, 0, 1, 1,
-0.2793697, -1.593352, -2.764455, 1, 0, 0, 1, 1,
-0.2789396, -0.402369, -2.997122, 0, 0, 0, 1, 1,
-0.2741382, 0.1043099, -0.9831043, 0, 0, 0, 1, 1,
-0.2729829, 0.85474, -0.7094517, 0, 0, 0, 1, 1,
-0.2712238, 0.07926662, -1.133505, 0, 0, 0, 1, 1,
-0.270505, -0.8222603, -2.920979, 0, 0, 0, 1, 1,
-0.2699901, -1.159099, -1.882105, 0, 0, 0, 1, 1,
-0.2639643, 0.5584185, -0.5032975, 0, 0, 0, 1, 1,
-0.2617107, -0.4257236, -3.376992, 1, 1, 1, 1, 1,
-0.2605676, 0.451685, -2.414057, 1, 1, 1, 1, 1,
-0.2550869, 1.969637, 0.4526547, 1, 1, 1, 1, 1,
-0.2522177, -0.3691522, -2.963403, 1, 1, 1, 1, 1,
-0.2497687, 0.3360225, -1.39204, 1, 1, 1, 1, 1,
-0.2433896, 1.027053, 0.04416872, 1, 1, 1, 1, 1,
-0.241317, -0.4918536, -1.059427, 1, 1, 1, 1, 1,
-0.2373482, -0.0003855042, -0.6071558, 1, 1, 1, 1, 1,
-0.2372597, 0.1569942, -1.765686, 1, 1, 1, 1, 1,
-0.2339209, 1.152742, -1.491114, 1, 1, 1, 1, 1,
-0.2264651, 0.2400824, -0.1050812, 1, 1, 1, 1, 1,
-0.2257484, -0.3909248, -2.21036, 1, 1, 1, 1, 1,
-0.2227076, 0.7426396, -1.080344, 1, 1, 1, 1, 1,
-0.2223981, 0.9663084, 0.06483266, 1, 1, 1, 1, 1,
-0.2140033, 1.136926, -0.8017523, 1, 1, 1, 1, 1,
-0.2138548, 0.0861698, -0.8725792, 0, 0, 1, 1, 1,
-0.2135871, 0.4919591, -2.693145, 1, 0, 0, 1, 1,
-0.2135186, -0.2447028, -2.852116, 1, 0, 0, 1, 1,
-0.2116708, 0.4679669, 0.5866988, 1, 0, 0, 1, 1,
-0.2102235, 0.2262624, -1.142493, 1, 0, 0, 1, 1,
-0.2013995, 0.3299515, -1.106646, 1, 0, 0, 1, 1,
-0.2012922, 0.9469465, 0.4918725, 0, 0, 0, 1, 1,
-0.2005664, 0.3821666, 1.831153, 0, 0, 0, 1, 1,
-0.1950165, -0.765166, -2.440331, 0, 0, 0, 1, 1,
-0.1948592, -0.604946, -2.773173, 0, 0, 0, 1, 1,
-0.1944408, -1.199751, -2.739076, 0, 0, 0, 1, 1,
-0.1904427, 0.3467902, -0.08722965, 0, 0, 0, 1, 1,
-0.1882023, 1.308001, -0.6133437, 0, 0, 0, 1, 1,
-0.1861524, 0.3633624, -2.0985, 1, 1, 1, 1, 1,
-0.1841428, 0.8536915, 0.8390527, 1, 1, 1, 1, 1,
-0.1780093, -0.6861761, -3.972622, 1, 1, 1, 1, 1,
-0.1773301, 0.5511573, 0.4020516, 1, 1, 1, 1, 1,
-0.1727093, 0.1557075, -1.479146, 1, 1, 1, 1, 1,
-0.1717224, -0.4683672, -4.136735, 1, 1, 1, 1, 1,
-0.1711535, 1.108659, -0.4249934, 1, 1, 1, 1, 1,
-0.1707562, -0.2477846, -1.524064, 1, 1, 1, 1, 1,
-0.1704592, -0.3607674, -2.928947, 1, 1, 1, 1, 1,
-0.1682314, 0.1695927, -0.2933304, 1, 1, 1, 1, 1,
-0.1680316, -1.257259, -2.294425, 1, 1, 1, 1, 1,
-0.1645319, -0.3286124, -2.095844, 1, 1, 1, 1, 1,
-0.1605736, 0.3256068, 0.1796582, 1, 1, 1, 1, 1,
-0.1570967, -0.301488, -4.125135, 1, 1, 1, 1, 1,
-0.1552678, -1.164978, -5.339572, 1, 1, 1, 1, 1,
-0.151165, 2.125162, -1.33927, 0, 0, 1, 1, 1,
-0.1471276, 0.6033737, 0.7896473, 1, 0, 0, 1, 1,
-0.142773, -1.297458, -3.862537, 1, 0, 0, 1, 1,
-0.1420693, 0.2158237, -0.5528926, 1, 0, 0, 1, 1,
-0.1372087, 0.829111, -0.03691626, 1, 0, 0, 1, 1,
-0.1362998, -2.156883, -3.527224, 1, 0, 0, 1, 1,
-0.1329761, 0.3026972, -1.274485, 0, 0, 0, 1, 1,
-0.1298313, 2.560736, -1.627124, 0, 0, 0, 1, 1,
-0.1273639, -0.435896, -3.649975, 0, 0, 0, 1, 1,
-0.127084, 0.2593143, 0.1427531, 0, 0, 0, 1, 1,
-0.1262911, -0.6289221, -4.416047, 0, 0, 0, 1, 1,
-0.1213622, 0.5991744, -0.3801274, 0, 0, 0, 1, 1,
-0.1125933, 0.1866966, -0.2989874, 0, 0, 0, 1, 1,
-0.1123637, -0.447889, -2.396307, 1, 1, 1, 1, 1,
-0.1092311, 0.0745091, -3.78166, 1, 1, 1, 1, 1,
-0.106068, 1.146657, -0.1641325, 1, 1, 1, 1, 1,
-0.1030341, -1.681163, -3.251559, 1, 1, 1, 1, 1,
-0.1005129, -0.8935788, -3.049253, 1, 1, 1, 1, 1,
-0.09475544, 1.535278, 0.3872757, 1, 1, 1, 1, 1,
-0.08958048, -0.5106444, -3.698101, 1, 1, 1, 1, 1,
-0.08729142, 0.6008849, -0.4168652, 1, 1, 1, 1, 1,
-0.0847417, 1.526457, 0.9940227, 1, 1, 1, 1, 1,
-0.08286116, 1.419895, 1.328372, 1, 1, 1, 1, 1,
-0.08199041, 0.3262993, -0.04547015, 1, 1, 1, 1, 1,
-0.06860483, 0.9308992, 0.5725184, 1, 1, 1, 1, 1,
-0.06787914, -2.19368, -3.906711, 1, 1, 1, 1, 1,
-0.0649576, -0.1948217, -3.180361, 1, 1, 1, 1, 1,
-0.06336684, 0.3960919, -0.8872416, 1, 1, 1, 1, 1,
-0.05913129, -1.065148, -2.993442, 0, 0, 1, 1, 1,
-0.05755477, 1.351265, -2.537952, 1, 0, 0, 1, 1,
-0.05606532, -0.9636429, -1.047743, 1, 0, 0, 1, 1,
-0.05196979, 0.4481459, -1.066853, 1, 0, 0, 1, 1,
-0.05075154, 1.15194, 0.2232921, 1, 0, 0, 1, 1,
-0.04952993, 2.389263, 1.400551, 1, 0, 0, 1, 1,
-0.04720986, 0.7442662, -1.797749, 0, 0, 0, 1, 1,
-0.04430079, -0.9074017, -3.114777, 0, 0, 0, 1, 1,
-0.03834975, 0.2489534, 0.7434144, 0, 0, 0, 1, 1,
-0.0380058, 0.2197703, 0.2888551, 0, 0, 0, 1, 1,
-0.03467023, 0.7198967, -0.2722471, 0, 0, 0, 1, 1,
-0.02604988, 0.3241452, -1.54025, 0, 0, 0, 1, 1,
-0.02266999, 1.488057, -1.614298, 0, 0, 0, 1, 1,
-0.0197642, 0.536415, 0.9516129, 1, 1, 1, 1, 1,
-0.01639591, -1.490215, -1.132685, 1, 1, 1, 1, 1,
-0.01535895, -0.5393664, -2.119502, 1, 1, 1, 1, 1,
-0.013788, -0.4648019, -3.165487, 1, 1, 1, 1, 1,
-0.01335954, 1.130549, 0.09466103, 1, 1, 1, 1, 1,
-0.01091457, 0.04795843, 0.7510284, 1, 1, 1, 1, 1,
-0.01040089, -1.838551, -3.467965, 1, 1, 1, 1, 1,
-0.009967285, -0.1931514, -4.799087, 1, 1, 1, 1, 1,
-0.005164186, -1.536191, -3.832027, 1, 1, 1, 1, 1,
-0.0038848, 0.03904231, 0.01251279, 1, 1, 1, 1, 1,
0.005304445, 0.4499024, 0.4155887, 1, 1, 1, 1, 1,
0.01021606, 1.874017, -1.344854, 1, 1, 1, 1, 1,
0.01242651, -1.326848, 5.06264, 1, 1, 1, 1, 1,
0.0143623, -0.5460113, 4.912698, 1, 1, 1, 1, 1,
0.01539278, 0.6248157, -1.507232, 1, 1, 1, 1, 1,
0.01748289, -1.767969, 2.093734, 0, 0, 1, 1, 1,
0.0176971, -0.5505769, 3.585857, 1, 0, 0, 1, 1,
0.01805595, 0.7898586, 0.8282219, 1, 0, 0, 1, 1,
0.02154521, -0.1281532, 3.081027, 1, 0, 0, 1, 1,
0.02262382, -0.0136495, 2.256751, 1, 0, 0, 1, 1,
0.02524937, -2.538967, 2.791259, 1, 0, 0, 1, 1,
0.02538615, 1.325999, -2.516553, 0, 0, 0, 1, 1,
0.02858383, -0.7786333, 3.508917, 0, 0, 0, 1, 1,
0.02971623, 1.435143, -1.059196, 0, 0, 0, 1, 1,
0.03269656, -0.981123, 3.718756, 0, 0, 0, 1, 1,
0.03274598, 0.7773997, 0.6085914, 0, 0, 0, 1, 1,
0.03292049, -0.6020454, 3.45697, 0, 0, 0, 1, 1,
0.03650727, 1.222116, -0.1129781, 0, 0, 0, 1, 1,
0.03723324, -1.021568, 3.963868, 1, 1, 1, 1, 1,
0.03851028, 0.5472435, 1.200116, 1, 1, 1, 1, 1,
0.04217827, 0.1299169, 0.4724243, 1, 1, 1, 1, 1,
0.04324635, 0.8782684, -2.323973, 1, 1, 1, 1, 1,
0.04377068, 1.248945, 1.721498, 1, 1, 1, 1, 1,
0.05213523, 0.1720285, 0.5993567, 1, 1, 1, 1, 1,
0.05735848, -0.1719915, 1.614717, 1, 1, 1, 1, 1,
0.06014286, -0.674854, 2.901927, 1, 1, 1, 1, 1,
0.06066731, 1.706698, 0.01307837, 1, 1, 1, 1, 1,
0.0611052, -0.04990169, 3.01619, 1, 1, 1, 1, 1,
0.06193773, -0.1653216, 2.107872, 1, 1, 1, 1, 1,
0.06404434, 0.4104008, -0.2722542, 1, 1, 1, 1, 1,
0.06492419, -0.1126004, 2.368941, 1, 1, 1, 1, 1,
0.06630995, -1.043717, 4.011163, 1, 1, 1, 1, 1,
0.0675664, 1.10473, -0.3158586, 1, 1, 1, 1, 1,
0.06780592, -0.6364912, 3.029463, 0, 0, 1, 1, 1,
0.06989361, -2.128483, 0.9934325, 1, 0, 0, 1, 1,
0.07388391, -0.7883578, 2.571333, 1, 0, 0, 1, 1,
0.07791651, 0.5958701, -0.09748073, 1, 0, 0, 1, 1,
0.07799713, 0.05088534, 0.7190132, 1, 0, 0, 1, 1,
0.08017231, 2.077033, -0.8121479, 1, 0, 0, 1, 1,
0.08140273, 0.9491334, 0.4303599, 0, 0, 0, 1, 1,
0.08290809, 1.402451, -1.187402, 0, 0, 0, 1, 1,
0.1005099, -0.9820963, 1.06492, 0, 0, 0, 1, 1,
0.1023068, 0.8354923, 0.2691641, 0, 0, 0, 1, 1,
0.1032459, -0.5603478, 3.369454, 0, 0, 0, 1, 1,
0.1037601, 0.3220463, -0.9657063, 0, 0, 0, 1, 1,
0.1073177, -0.3635554, 3.351107, 0, 0, 0, 1, 1,
0.1113363, 0.1293741, -0.0923133, 1, 1, 1, 1, 1,
0.1123001, 1.416833, -0.7445786, 1, 1, 1, 1, 1,
0.1124383, 0.4019254, 0.5883213, 1, 1, 1, 1, 1,
0.1195796, -0.06760506, 1.432303, 1, 1, 1, 1, 1,
0.1234222, -0.8758253, 2.184829, 1, 1, 1, 1, 1,
0.1248616, -1.115306, 3.882098, 1, 1, 1, 1, 1,
0.1277803, -0.3066838, 3.314172, 1, 1, 1, 1, 1,
0.1280131, 1.298712, 0.9018377, 1, 1, 1, 1, 1,
0.1305454, 1.268994, 0.2626591, 1, 1, 1, 1, 1,
0.1320205, -1.611128, 4.026814, 1, 1, 1, 1, 1,
0.1329251, -0.3802493, 2.114263, 1, 1, 1, 1, 1,
0.133323, 0.4446104, -0.01409095, 1, 1, 1, 1, 1,
0.138298, -0.03839984, 0.9912623, 1, 1, 1, 1, 1,
0.138427, 0.6943316, -1.295342, 1, 1, 1, 1, 1,
0.1412954, 0.1661936, -0.2008152, 1, 1, 1, 1, 1,
0.1423065, 0.4818962, 0.03818056, 0, 0, 1, 1, 1,
0.143587, 0.1369619, 1.01231, 1, 0, 0, 1, 1,
0.143938, -0.9248444, 4.772983, 1, 0, 0, 1, 1,
0.1456093, -0.8167449, 2.29178, 1, 0, 0, 1, 1,
0.1496158, -0.3269086, 2.391384, 1, 0, 0, 1, 1,
0.1510245, 0.158001, 0.6247884, 1, 0, 0, 1, 1,
0.1523962, -2.122453, -0.01213895, 0, 0, 0, 1, 1,
0.1610234, 0.6540347, -1.615755, 0, 0, 0, 1, 1,
0.1627153, -0.5607459, 1.811166, 0, 0, 0, 1, 1,
0.1642224, -0.1145459, 2.944032, 0, 0, 0, 1, 1,
0.167117, -0.2430233, 4.393716, 0, 0, 0, 1, 1,
0.1672422, -1.495812, 2.967417, 0, 0, 0, 1, 1,
0.1706899, 0.4261795, 1.648881, 0, 0, 0, 1, 1,
0.1732869, -0.6964123, 1.974285, 1, 1, 1, 1, 1,
0.179204, 0.5853162, 0.2096835, 1, 1, 1, 1, 1,
0.1825391, 1.005876, 1.095965, 1, 1, 1, 1, 1,
0.1833424, 0.1533875, 0.3612331, 1, 1, 1, 1, 1,
0.1839619, -0.1706523, 2.070898, 1, 1, 1, 1, 1,
0.1920627, 0.1485764, 0.9041537, 1, 1, 1, 1, 1,
0.192211, -1.648749, 4.995416, 1, 1, 1, 1, 1,
0.1928739, 0.380211, 0.6992639, 1, 1, 1, 1, 1,
0.1963874, 0.3740762, 1.823087, 1, 1, 1, 1, 1,
0.1986835, 1.596202, 0.07820039, 1, 1, 1, 1, 1,
0.1990516, 1.886758, 0.6515038, 1, 1, 1, 1, 1,
0.2004056, 0.497463, 0.2874123, 1, 1, 1, 1, 1,
0.2018237, 0.7187881, 0.8738279, 1, 1, 1, 1, 1,
0.202903, -0.7981897, 3.699948, 1, 1, 1, 1, 1,
0.2082948, 0.9258484, 1.365427, 1, 1, 1, 1, 1,
0.2106823, 1.38984, -0.2488611, 0, 0, 1, 1, 1,
0.2135207, 0.5208403, 1.495968, 1, 0, 0, 1, 1,
0.2136444, -0.04445666, 1.395932, 1, 0, 0, 1, 1,
0.2144061, 0.7286477, 0.9651855, 1, 0, 0, 1, 1,
0.2146226, -1.674912, 4.496974, 1, 0, 0, 1, 1,
0.2158941, 0.1945387, 1.975551, 1, 0, 0, 1, 1,
0.2174163, -1.317904, 4.94814, 0, 0, 0, 1, 1,
0.229063, -0.7162599, 1.623492, 0, 0, 0, 1, 1,
0.2291639, -0.4548532, 3.16827, 0, 0, 0, 1, 1,
0.2315029, -0.5326254, 1.519425, 0, 0, 0, 1, 1,
0.2389114, -0.1371285, 2.779723, 0, 0, 0, 1, 1,
0.2420991, 1.258917, 0.7290246, 0, 0, 0, 1, 1,
0.2458839, 1.140842, 1.235775, 0, 0, 0, 1, 1,
0.2474701, 1.74818, 0.29426, 1, 1, 1, 1, 1,
0.2478635, -0.4303493, 4.457079, 1, 1, 1, 1, 1,
0.2486574, 1.110983, -1.49119, 1, 1, 1, 1, 1,
0.2520967, -0.1281289, 2.328082, 1, 1, 1, 1, 1,
0.2526797, -0.358868, 2.907915, 1, 1, 1, 1, 1,
0.2531346, 0.5628853, 0.8416309, 1, 1, 1, 1, 1,
0.2559173, -0.2484374, 1.790421, 1, 1, 1, 1, 1,
0.2657582, 0.7381634, 0.09715303, 1, 1, 1, 1, 1,
0.2672757, 0.7788256, 1.656468, 1, 1, 1, 1, 1,
0.2675158, 0.08354451, 1.387938, 1, 1, 1, 1, 1,
0.2677568, 0.583554, 2.047218, 1, 1, 1, 1, 1,
0.2696968, 0.8737274, 0.6082343, 1, 1, 1, 1, 1,
0.27411, 1.970003, -0.9317456, 1, 1, 1, 1, 1,
0.2741197, -0.748485, 2.119388, 1, 1, 1, 1, 1,
0.274356, -1.24753, 4.293514, 1, 1, 1, 1, 1,
0.2797399, -1.2227, 3.534433, 0, 0, 1, 1, 1,
0.281158, -0.04477355, 2.175319, 1, 0, 0, 1, 1,
0.2863814, -0.8704631, 1.749878, 1, 0, 0, 1, 1,
0.2866743, -1.128318, 4.575232, 1, 0, 0, 1, 1,
0.2893033, -0.03133508, 3.374844, 1, 0, 0, 1, 1,
0.2911337, -1.532241, 2.411106, 1, 0, 0, 1, 1,
0.2914661, 0.04736714, 0.7995671, 0, 0, 0, 1, 1,
0.2924306, -0.2496945, 2.331569, 0, 0, 0, 1, 1,
0.2962171, 0.9594553, 0.351035, 0, 0, 0, 1, 1,
0.3039648, 0.5988047, 0.3471636, 0, 0, 0, 1, 1,
0.3063149, 0.04996694, 0.84477, 0, 0, 0, 1, 1,
0.3068173, -1.380499, 1.736377, 0, 0, 0, 1, 1,
0.3097365, 0.6751041, -0.2263052, 0, 0, 0, 1, 1,
0.3112175, 1.937981, -0.6593769, 1, 1, 1, 1, 1,
0.3115535, 1.676138, 0.5289701, 1, 1, 1, 1, 1,
0.3211082, 1.01637, 0.6173399, 1, 1, 1, 1, 1,
0.3213524, 1.974917, 0.2244655, 1, 1, 1, 1, 1,
0.3214543, 3.051578, -0.8891054, 1, 1, 1, 1, 1,
0.3215984, 0.42394, 2.217118, 1, 1, 1, 1, 1,
0.3225923, -0.9905077, 2.491346, 1, 1, 1, 1, 1,
0.3227237, -0.4900234, 1.733679, 1, 1, 1, 1, 1,
0.3268857, 0.04464318, 1.332694, 1, 1, 1, 1, 1,
0.327215, -0.3023748, 2.539888, 1, 1, 1, 1, 1,
0.3298454, 0.6558553, -0.2990081, 1, 1, 1, 1, 1,
0.3331064, -0.9119114, 2.248719, 1, 1, 1, 1, 1,
0.3378762, 0.6851543, -0.3802937, 1, 1, 1, 1, 1,
0.3406347, 0.311879, 1.237899, 1, 1, 1, 1, 1,
0.3438675, -0.590337, 2.816103, 1, 1, 1, 1, 1,
0.345992, 0.2262755, -0.3247598, 0, 0, 1, 1, 1,
0.347372, -0.5532991, 3.206218, 1, 0, 0, 1, 1,
0.3508212, 0.8384207, -0.07045525, 1, 0, 0, 1, 1,
0.352012, 0.3028431, 1.87984, 1, 0, 0, 1, 1,
0.3539118, -0.3108209, 3.441192, 1, 0, 0, 1, 1,
0.3560153, 2.479056, 0.7174981, 1, 0, 0, 1, 1,
0.357099, -0.4730445, 2.004596, 0, 0, 0, 1, 1,
0.3591596, 0.4474089, -0.05012878, 0, 0, 0, 1, 1,
0.3658427, 0.2735991, 0.7445059, 0, 0, 0, 1, 1,
0.3664658, -0.3430917, 2.203613, 0, 0, 0, 1, 1,
0.3719282, -1.228955, 4.722371, 0, 0, 0, 1, 1,
0.3722638, -1.736473, 5.18329, 0, 0, 0, 1, 1,
0.3742488, 1.758113, -0.4573815, 0, 0, 0, 1, 1,
0.3743667, 0.8294749, -0.8502558, 1, 1, 1, 1, 1,
0.380073, -1.305792, 4.153378, 1, 1, 1, 1, 1,
0.3849679, 0.5129943, 0.803219, 1, 1, 1, 1, 1,
0.3856057, -1.14098, 3.352546, 1, 1, 1, 1, 1,
0.3878099, 2.376967, 0.06008383, 1, 1, 1, 1, 1,
0.3884479, -0.3722689, 1.814615, 1, 1, 1, 1, 1,
0.3925296, -0.2050278, 2.196214, 1, 1, 1, 1, 1,
0.3931554, -1.016724, 3.636103, 1, 1, 1, 1, 1,
0.3945555, -1.483271, 2.43701, 1, 1, 1, 1, 1,
0.3962131, -1.337449, 2.858516, 1, 1, 1, 1, 1,
0.3975447, -0.235779, 2.251934, 1, 1, 1, 1, 1,
0.3977734, 0.4179325, 1.90569, 1, 1, 1, 1, 1,
0.3981064, -0.4708797, 2.937555, 1, 1, 1, 1, 1,
0.4006345, -1.710284, 4.526265, 1, 1, 1, 1, 1,
0.4072403, -0.5970315, 3.622465, 1, 1, 1, 1, 1,
0.4079325, 0.9162169, 2.083007, 0, 0, 1, 1, 1,
0.4079534, 0.2748985, 0.2058343, 1, 0, 0, 1, 1,
0.4092372, -0.01550431, 1.289882, 1, 0, 0, 1, 1,
0.4162671, -1.349477, 3.498955, 1, 0, 0, 1, 1,
0.4170156, -0.468908, 3.451497, 1, 0, 0, 1, 1,
0.4187861, 0.5301446, 0.5801652, 1, 0, 0, 1, 1,
0.4192317, 1.208633, 2.531568, 0, 0, 0, 1, 1,
0.4220301, 1.02626, 0.8260148, 0, 0, 0, 1, 1,
0.4244672, -0.374014, 1.39301, 0, 0, 0, 1, 1,
0.4257897, -0.411801, 1.728913, 0, 0, 0, 1, 1,
0.4284419, -0.171056, 1.148135, 0, 0, 0, 1, 1,
0.4334516, 0.06677957, 3.208299, 0, 0, 0, 1, 1,
0.4401899, 0.152752, 0.7249891, 0, 0, 0, 1, 1,
0.4449329, 0.215819, 0.2695759, 1, 1, 1, 1, 1,
0.4495077, -1.923422, 1.997491, 1, 1, 1, 1, 1,
0.452648, 0.2156707, 1.187317, 1, 1, 1, 1, 1,
0.4538434, -0.5585565, 0.7456883, 1, 1, 1, 1, 1,
0.4562564, -1.469407, 1.682607, 1, 1, 1, 1, 1,
0.4587677, -0.4143325, 1.934476, 1, 1, 1, 1, 1,
0.4606015, -0.9034811, 2.727486, 1, 1, 1, 1, 1,
0.4615635, -0.4539922, 1.023497, 1, 1, 1, 1, 1,
0.4645132, 1.596239, -0.2685402, 1, 1, 1, 1, 1,
0.4665621, 2.159893, -0.8214, 1, 1, 1, 1, 1,
0.4673605, -0.3051231, 2.970153, 1, 1, 1, 1, 1,
0.4691132, -0.003758136, 1.56751, 1, 1, 1, 1, 1,
0.4717767, 1.329715, -1.860205, 1, 1, 1, 1, 1,
0.4738692, 0.09126248, 2.191924, 1, 1, 1, 1, 1,
0.4751023, 1.637371, -0.211223, 1, 1, 1, 1, 1,
0.478791, -0.5760818, 1.919505, 0, 0, 1, 1, 1,
0.4802765, -0.8661761, 2.554485, 1, 0, 0, 1, 1,
0.4889179, -1.420232, 2.865668, 1, 0, 0, 1, 1,
0.4898441, -0.4725605, 2.643306, 1, 0, 0, 1, 1,
0.4902752, -2.637269, 2.768775, 1, 0, 0, 1, 1,
0.4970505, -0.7659593, 1.532138, 1, 0, 0, 1, 1,
0.4983672, 0.7839496, 1.34277, 0, 0, 0, 1, 1,
0.5018076, -1.211886, 1.829375, 0, 0, 0, 1, 1,
0.5020269, -1.450155, 3.221008, 0, 0, 0, 1, 1,
0.5044279, 0.7307593, 0.4514832, 0, 0, 0, 1, 1,
0.5104672, 0.9084781, 1.718554, 0, 0, 0, 1, 1,
0.5116065, 0.2097248, 2.628248, 0, 0, 0, 1, 1,
0.5125664, -1.459907, 3.099218, 0, 0, 0, 1, 1,
0.5148356, -0.4968483, 3.202727, 1, 1, 1, 1, 1,
0.5189235, 0.09659252, 2.432813, 1, 1, 1, 1, 1,
0.5196216, -0.7254596, 5.178108, 1, 1, 1, 1, 1,
0.5212763, 0.1851882, 1.31459, 1, 1, 1, 1, 1,
0.5259022, -0.4263996, 2.986763, 1, 1, 1, 1, 1,
0.5344168, 0.4733282, 0.6967989, 1, 1, 1, 1, 1,
0.5382095, 0.2368965, 2.446875, 1, 1, 1, 1, 1,
0.5383959, -0.7264187, 4.598361, 1, 1, 1, 1, 1,
0.5414498, 0.05354805, 1.943558, 1, 1, 1, 1, 1,
0.5535824, -0.8641534, 1.855005, 1, 1, 1, 1, 1,
0.554355, 0.3401682, 1.269287, 1, 1, 1, 1, 1,
0.5577643, 0.2472944, 1.998478, 1, 1, 1, 1, 1,
0.5596817, 1.660531, -0.3269317, 1, 1, 1, 1, 1,
0.5608085, -1.045764, 5.060405, 1, 1, 1, 1, 1,
0.562704, -0.08887742, 4.325533, 1, 1, 1, 1, 1,
0.5643548, 0.2372266, 1.281017, 0, 0, 1, 1, 1,
0.5712805, 1.853802, 1.467466, 1, 0, 0, 1, 1,
0.5753715, 1.242519, 0.4917827, 1, 0, 0, 1, 1,
0.578028, -1.20235, 1.503103, 1, 0, 0, 1, 1,
0.5800217, -0.02526203, 2.686932, 1, 0, 0, 1, 1,
0.5864985, -1.207778, 3.861794, 1, 0, 0, 1, 1,
0.5901784, -1.524257, 3.794368, 0, 0, 0, 1, 1,
0.5905711, -0.1131943, 4.1442, 0, 0, 0, 1, 1,
0.5906094, -0.159008, 2.340762, 0, 0, 0, 1, 1,
0.5976991, -3.251166, 1.147752, 0, 0, 0, 1, 1,
0.6006415, 0.4878669, 0.6549459, 0, 0, 0, 1, 1,
0.6027783, -0.5026984, 2.194926, 0, 0, 0, 1, 1,
0.6031787, 0.3740593, 1.083748, 0, 0, 0, 1, 1,
0.6152846, 1.486681, -0.7083616, 1, 1, 1, 1, 1,
0.6171393, 0.4972238, 0.3722188, 1, 1, 1, 1, 1,
0.6296361, -1.251949, 3.803793, 1, 1, 1, 1, 1,
0.6303251, -0.541065, 1.786419, 1, 1, 1, 1, 1,
0.6333427, -1.245842, 4.98286, 1, 1, 1, 1, 1,
0.6336035, -1.551954, 2.918226, 1, 1, 1, 1, 1,
0.6372184, 1.529899, -1.345451, 1, 1, 1, 1, 1,
0.6411455, 1.182562, -0.1375213, 1, 1, 1, 1, 1,
0.6439303, -0.9771546, 2.293765, 1, 1, 1, 1, 1,
0.6454173, -0.3689386, 2.354309, 1, 1, 1, 1, 1,
0.6465127, -1.240758, 3.213965, 1, 1, 1, 1, 1,
0.648592, 1.281469, 0.3393147, 1, 1, 1, 1, 1,
0.649177, 0.8565251, -0.5133497, 1, 1, 1, 1, 1,
0.6511815, 0.380032, 1.910218, 1, 1, 1, 1, 1,
0.6519779, -0.8737224, 2.48288, 1, 1, 1, 1, 1,
0.6541703, -0.3095554, 2.880296, 0, 0, 1, 1, 1,
0.6550819, -1.606663, 4.836613, 1, 0, 0, 1, 1,
0.6630275, 2.22814, -0.07090247, 1, 0, 0, 1, 1,
0.6685035, -0.3355122, 2.403628, 1, 0, 0, 1, 1,
0.6706521, 0.5353624, 0.9676287, 1, 0, 0, 1, 1,
0.6750676, -0.5673775, 2.598845, 1, 0, 0, 1, 1,
0.6768177, -1.356226, 1.431088, 0, 0, 0, 1, 1,
0.6777718, -0.7917193, 3.309375, 0, 0, 0, 1, 1,
0.6784546, -0.1996639, 1.8038, 0, 0, 0, 1, 1,
0.6786327, -0.4742413, 5.137623, 0, 0, 0, 1, 1,
0.6789995, 0.7557343, -1.510521, 0, 0, 0, 1, 1,
0.6861272, -0.4807576, 1.795818, 0, 0, 0, 1, 1,
0.687474, -2.378426, 2.458092, 0, 0, 0, 1, 1,
0.6886595, -1.393785, 3.56252, 1, 1, 1, 1, 1,
0.6893291, -0.3023863, 0.9381768, 1, 1, 1, 1, 1,
0.7014164, 0.9551644, 1.608822, 1, 1, 1, 1, 1,
0.7018487, 1.513922, -1.418377, 1, 1, 1, 1, 1,
0.7102384, -0.5954589, 1.919531, 1, 1, 1, 1, 1,
0.7123427, 0.07800984, 0.2057264, 1, 1, 1, 1, 1,
0.7131481, -0.8739361, 3.046861, 1, 1, 1, 1, 1,
0.7152144, -1.411006, 3.313278, 1, 1, 1, 1, 1,
0.7155272, 1.957671, 1.07383, 1, 1, 1, 1, 1,
0.7243384, -0.7446091, 1.585589, 1, 1, 1, 1, 1,
0.7363602, -0.08597881, 2.800632, 1, 1, 1, 1, 1,
0.7390407, -0.03717182, 1.308784, 1, 1, 1, 1, 1,
0.740413, -0.2349921, 2.378063, 1, 1, 1, 1, 1,
0.7494874, 0.6543995, 0.3449804, 1, 1, 1, 1, 1,
0.7508752, 0.1651871, 3.349556, 1, 1, 1, 1, 1,
0.7512844, -0.925504, 2.607263, 0, 0, 1, 1, 1,
0.755168, -1.699683, 3.010767, 1, 0, 0, 1, 1,
0.7573381, 0.4219005, 0.5654377, 1, 0, 0, 1, 1,
0.7695686, -0.8046165, -0.1019904, 1, 0, 0, 1, 1,
0.769861, -0.0162357, 2.307208, 1, 0, 0, 1, 1,
0.770262, 1.155317, -0.6864128, 1, 0, 0, 1, 1,
0.7767507, -0.0754422, 2.173112, 0, 0, 0, 1, 1,
0.7774864, 0.4297566, 1.839739, 0, 0, 0, 1, 1,
0.7820847, -0.2867546, 1.435689, 0, 0, 0, 1, 1,
0.7829233, 0.9704511, 1.390729, 0, 0, 0, 1, 1,
0.7973232, 0.1955736, 3.202462, 0, 0, 0, 1, 1,
0.797726, 0.9447296, 2.08011, 0, 0, 0, 1, 1,
0.7978609, 0.8196756, -0.2689279, 0, 0, 0, 1, 1,
0.8012382, -0.5872068, 3.1682, 1, 1, 1, 1, 1,
0.8068968, 1.004691, 0.195419, 1, 1, 1, 1, 1,
0.8077164, -0.3628043, 2.202495, 1, 1, 1, 1, 1,
0.8077564, 1.180751, 1.386376, 1, 1, 1, 1, 1,
0.8078467, 0.6130145, -0.2987096, 1, 1, 1, 1, 1,
0.8095654, -0.9851199, 2.557678, 1, 1, 1, 1, 1,
0.8097263, -1.075849, 3.110911, 1, 1, 1, 1, 1,
0.8125724, -0.8299335, 4.371008, 1, 1, 1, 1, 1,
0.8181653, 0.4273115, 1.728215, 1, 1, 1, 1, 1,
0.8273023, 0.08727682, 0.145294, 1, 1, 1, 1, 1,
0.828521, 0.009655172, 2.118715, 1, 1, 1, 1, 1,
0.8317516, -1.678233, 2.026543, 1, 1, 1, 1, 1,
0.8330842, -2.209285, 2.042536, 1, 1, 1, 1, 1,
0.8332587, 1.407586, -0.2178324, 1, 1, 1, 1, 1,
0.8353252, 0.2672455, 0.4022247, 1, 1, 1, 1, 1,
0.8354174, -0.4594157, 0.5694433, 0, 0, 1, 1, 1,
0.843134, -1.276856, 1.680808, 1, 0, 0, 1, 1,
0.8432059, 0.374979, 1.22583, 1, 0, 0, 1, 1,
0.8479527, 1.084508, 0.9866937, 1, 0, 0, 1, 1,
0.8516983, 0.9735472, 2.079974, 1, 0, 0, 1, 1,
0.8562058, 3.696587, -1.367374, 1, 0, 0, 1, 1,
0.8593064, 0.8302131, 0.025923, 0, 0, 0, 1, 1,
0.8602464, -0.1764408, 0.2853881, 0, 0, 0, 1, 1,
0.8655526, 1.626047, 0.5787552, 0, 0, 0, 1, 1,
0.8676167, -0.6932902, 2.231987, 0, 0, 0, 1, 1,
0.8679091, -1.233445, 2.669548, 0, 0, 0, 1, 1,
0.8680871, 1.395787, -0.1889233, 0, 0, 0, 1, 1,
0.8708304, -0.747571, -0.2537858, 0, 0, 0, 1, 1,
0.8758224, 0.8127904, 0.4429007, 1, 1, 1, 1, 1,
0.8776587, -0.5476354, 2.551816, 1, 1, 1, 1, 1,
0.883222, 0.161968, 2.06584, 1, 1, 1, 1, 1,
0.8856943, 1.154842, 0.8383157, 1, 1, 1, 1, 1,
0.8859194, 0.3827682, 0.4402098, 1, 1, 1, 1, 1,
0.9097459, -0.7275427, 0.4440256, 1, 1, 1, 1, 1,
0.9118844, -1.908696, 2.9002, 1, 1, 1, 1, 1,
0.9218667, 0.2459349, -0.5555142, 1, 1, 1, 1, 1,
0.9277915, -0.789279, 2.597561, 1, 1, 1, 1, 1,
0.9350622, 0.6751652, 1.221239, 1, 1, 1, 1, 1,
0.9383667, 1.310678, 0.9450992, 1, 1, 1, 1, 1,
0.9431008, 0.2963274, 0.3886186, 1, 1, 1, 1, 1,
0.9444546, -0.1101208, 0.9323758, 1, 1, 1, 1, 1,
0.9514355, -1.395002, 2.981548, 1, 1, 1, 1, 1,
0.9584206, -1.504559, 1.992866, 1, 1, 1, 1, 1,
0.9649855, -0.1865881, 1.823572, 0, 0, 1, 1, 1,
0.9661855, -0.8555158, 3.005609, 1, 0, 0, 1, 1,
0.9696072, -0.1693991, 2.00753, 1, 0, 0, 1, 1,
0.9728777, -0.001766311, 2.529826, 1, 0, 0, 1, 1,
0.9734886, -0.3637497, 1.183013, 1, 0, 0, 1, 1,
0.9736698, 0.07443124, 2.571537, 1, 0, 0, 1, 1,
0.9804608, 1.910771, -1.105022, 0, 0, 0, 1, 1,
0.9806001, -0.2614428, 2.399927, 0, 0, 0, 1, 1,
0.9916971, 1.039327, 0.08376763, 0, 0, 0, 1, 1,
0.9954959, -0.392769, 0.68542, 0, 0, 0, 1, 1,
0.9964378, 0.9218349, 1.20451, 0, 0, 0, 1, 1,
0.9970056, -0.6231574, 3.906103, 0, 0, 0, 1, 1,
1.003105, -0.1269679, 2.159405, 0, 0, 0, 1, 1,
1.010251, 0.3520558, 2.292025, 1, 1, 1, 1, 1,
1.014668, 1.621665, 0.266642, 1, 1, 1, 1, 1,
1.021588, -1.098702, 0.5197837, 1, 1, 1, 1, 1,
1.022133, -1.668298, 3.177601, 1, 1, 1, 1, 1,
1.024168, 1.518097, 0.02671877, 1, 1, 1, 1, 1,
1.026416, -0.9327025, 2.597543, 1, 1, 1, 1, 1,
1.030836, -2.537981, 0.1812881, 1, 1, 1, 1, 1,
1.037545, -1.153765, 1.990118, 1, 1, 1, 1, 1,
1.038689, 1.779403, 1.055522, 1, 1, 1, 1, 1,
1.041397, -0.5826554, 1.782396, 1, 1, 1, 1, 1,
1.046252, 0.1979684, 0.8004174, 1, 1, 1, 1, 1,
1.046287, 0.2055822, 0.9020602, 1, 1, 1, 1, 1,
1.050857, -0.07958872, 2.403525, 1, 1, 1, 1, 1,
1.054467, 0.05465483, -0.1512089, 1, 1, 1, 1, 1,
1.058951, -0.8875695, 2.532894, 1, 1, 1, 1, 1,
1.062909, -1.242614, 4.391935, 0, 0, 1, 1, 1,
1.073194, 0.5361133, -0.2775573, 1, 0, 0, 1, 1,
1.074679, 0.6780585, -0.1596394, 1, 0, 0, 1, 1,
1.075304, -0.7478056, 1.315845, 1, 0, 0, 1, 1,
1.078324, 0.1688713, 2.996645, 1, 0, 0, 1, 1,
1.078626, 0.4813044, 2.247362, 1, 0, 0, 1, 1,
1.082465, 1.34263, 0.8817305, 0, 0, 0, 1, 1,
1.084133, -0.08842327, 0.1790187, 0, 0, 0, 1, 1,
1.086633, -0.6792298, 2.380435, 0, 0, 0, 1, 1,
1.095217, -0.05428157, 1.724916, 0, 0, 0, 1, 1,
1.101249, -0.6854632, 1.402712, 0, 0, 0, 1, 1,
1.103314, 0.938701, 1.664363, 0, 0, 0, 1, 1,
1.10592, 2.828102, -0.3666547, 0, 0, 0, 1, 1,
1.111587, -2.498577, 2.176161, 1, 1, 1, 1, 1,
1.126047, 0.6389232, 0.9348333, 1, 1, 1, 1, 1,
1.129155, -1.180981, 2.012332, 1, 1, 1, 1, 1,
1.131146, 0.5055654, -0.1571925, 1, 1, 1, 1, 1,
1.135376, -0.6309252, 1.038828, 1, 1, 1, 1, 1,
1.148941, 0.9484073, -0.6157439, 1, 1, 1, 1, 1,
1.164678, 0.1384659, 2.589186, 1, 1, 1, 1, 1,
1.16514, 0.504549, 0.7040156, 1, 1, 1, 1, 1,
1.166081, 1.22107, 3.715122, 1, 1, 1, 1, 1,
1.175358, -0.1012559, 0.3829417, 1, 1, 1, 1, 1,
1.183509, -0.2271553, 0.2430269, 1, 1, 1, 1, 1,
1.184584, -0.09716651, 1.195688, 1, 1, 1, 1, 1,
1.185054, 1.545934, 0.6423931, 1, 1, 1, 1, 1,
1.190804, -0.1318263, -0.9003019, 1, 1, 1, 1, 1,
1.199493, 0.1972001, 0.02704296, 1, 1, 1, 1, 1,
1.200727, -0.4092285, 0.8011415, 0, 0, 1, 1, 1,
1.201664, -0.1989438, 1.987841, 1, 0, 0, 1, 1,
1.213196, 0.596844, 0.8342204, 1, 0, 0, 1, 1,
1.215718, -0.8375534, 2.016232, 1, 0, 0, 1, 1,
1.226016, 1.011928, 0.4167617, 1, 0, 0, 1, 1,
1.227501, -0.845431, 2.589869, 1, 0, 0, 1, 1,
1.23221, 0.810856, -0.5757118, 0, 0, 0, 1, 1,
1.238528, -1.351712, 2.454897, 0, 0, 0, 1, 1,
1.240385, -0.8534053, 3.350957, 0, 0, 0, 1, 1,
1.240939, -1.460837, 0.8020159, 0, 0, 0, 1, 1,
1.243248, 0.5882084, 1.02178, 0, 0, 0, 1, 1,
1.248497, 0.1133615, 2.206422, 0, 0, 0, 1, 1,
1.250312, 0.8147151, 2.044648, 0, 0, 0, 1, 1,
1.255858, 0.3010302, -0.9491019, 1, 1, 1, 1, 1,
1.266879, 2.177223, 0.1024404, 1, 1, 1, 1, 1,
1.272599, -1.796398, 3.6894, 1, 1, 1, 1, 1,
1.272881, 0.6223428, 0.952381, 1, 1, 1, 1, 1,
1.274395, -0.8685424, 1.658614, 1, 1, 1, 1, 1,
1.282202, -1.535381, 1.152167, 1, 1, 1, 1, 1,
1.284622, 0.1267682, 0.3691667, 1, 1, 1, 1, 1,
1.30618, 2.151742, -0.1985993, 1, 1, 1, 1, 1,
1.307338, 0.9734927, -0.1785761, 1, 1, 1, 1, 1,
1.307759, 0.4465713, 0.3557215, 1, 1, 1, 1, 1,
1.31116, -0.7962906, 1.355989, 1, 1, 1, 1, 1,
1.327079, 0.8679095, 1.764154, 1, 1, 1, 1, 1,
1.333459, 0.368193, 1.99925, 1, 1, 1, 1, 1,
1.33362, 1.826994, -1.164564, 1, 1, 1, 1, 1,
1.336545, 1.533851, 0.01576997, 1, 1, 1, 1, 1,
1.342623, 1.458532, 0.4356752, 0, 0, 1, 1, 1,
1.348428, -1.014699, 2.164693, 1, 0, 0, 1, 1,
1.348871, 0.810219, 0.4626377, 1, 0, 0, 1, 1,
1.350215, -1.787012, 2.770781, 1, 0, 0, 1, 1,
1.350314, 1.263628, 1.041655, 1, 0, 0, 1, 1,
1.356916, -0.1645013, 1.666789, 1, 0, 0, 1, 1,
1.370708, 1.452086, 1.534772, 0, 0, 0, 1, 1,
1.374399, 0.6648197, 2.116855, 0, 0, 0, 1, 1,
1.376416, 1.050628, 0.3472793, 0, 0, 0, 1, 1,
1.38338, -1.597338, 2.624395, 0, 0, 0, 1, 1,
1.390476, -0.6544, 0.6114963, 0, 0, 0, 1, 1,
1.396562, -0.5976387, 3.204891, 0, 0, 0, 1, 1,
1.405353, -0.9803545, 3.595156, 0, 0, 0, 1, 1,
1.405487, 2.193808, 1.218658, 1, 1, 1, 1, 1,
1.415814, -0.5064015, 1.957489, 1, 1, 1, 1, 1,
1.422376, 0.5609382, 3.254741, 1, 1, 1, 1, 1,
1.42792, 0.4027847, 1.068505, 1, 1, 1, 1, 1,
1.431006, -0.04345361, 2.078496, 1, 1, 1, 1, 1,
1.439559, 0.5090626, -0.6987677, 1, 1, 1, 1, 1,
1.442599, -0.4465882, 1.987552, 1, 1, 1, 1, 1,
1.446818, 1.360048, 0.5265971, 1, 1, 1, 1, 1,
1.450752, 0.1459414, 0.6618497, 1, 1, 1, 1, 1,
1.460922, -0.09370998, 1.849149, 1, 1, 1, 1, 1,
1.467131, 0.3742116, 1.233498, 1, 1, 1, 1, 1,
1.468027, 0.2739875, 1.077619, 1, 1, 1, 1, 1,
1.469934, 0.3612823, 1.412464, 1, 1, 1, 1, 1,
1.485919, -0.4740792, 1.09458, 1, 1, 1, 1, 1,
1.48776, -0.6255581, 3.43529, 1, 1, 1, 1, 1,
1.49105, -0.04643057, 2.132489, 0, 0, 1, 1, 1,
1.498919, 1.147319, 3.025895, 1, 0, 0, 1, 1,
1.508042, -1.269049, 0.6340117, 1, 0, 0, 1, 1,
1.509346, -0.8409114, 2.105997, 1, 0, 0, 1, 1,
1.509635, -0.5587637, 1.69577, 1, 0, 0, 1, 1,
1.510571, -0.100504, 0.1691257, 1, 0, 0, 1, 1,
1.514512, -0.9213889, 2.994169, 0, 0, 0, 1, 1,
1.519147, -0.1889419, 1.208145, 0, 0, 0, 1, 1,
1.521411, -1.943899, 2.118275, 0, 0, 0, 1, 1,
1.524243, 0.03662572, 0.7889272, 0, 0, 0, 1, 1,
1.526637, -2.001663, 2.097334, 0, 0, 0, 1, 1,
1.527055, 1.51599, 2.216913, 0, 0, 0, 1, 1,
1.52773, 2.220787, 1.142986, 0, 0, 0, 1, 1,
1.528787, 0.205392, 1.348072, 1, 1, 1, 1, 1,
1.539854, -0.6743697, 0.9884652, 1, 1, 1, 1, 1,
1.541054, 1.441688, -0.02784546, 1, 1, 1, 1, 1,
1.547081, -0.6023933, 2.003421, 1, 1, 1, 1, 1,
1.547636, -0.3838917, -0.06080353, 1, 1, 1, 1, 1,
1.549235, 1.113309, 1.492196, 1, 1, 1, 1, 1,
1.550311, 0.5242277, 4.41617, 1, 1, 1, 1, 1,
1.55095, -0.5287953, 1.799996, 1, 1, 1, 1, 1,
1.557087, 0.491842, 2.390496, 1, 1, 1, 1, 1,
1.557644, -0.2068485, 1.461042, 1, 1, 1, 1, 1,
1.582839, 0.1369277, 2.186355, 1, 1, 1, 1, 1,
1.611179, -0.3135124, 1.66449, 1, 1, 1, 1, 1,
1.639788, 0.5824367, 1.185097, 1, 1, 1, 1, 1,
1.644988, -0.87676, 1.437273, 1, 1, 1, 1, 1,
1.645252, 0.7584426, 1.182661, 1, 1, 1, 1, 1,
1.646563, 1.748678, -0.03503264, 0, 0, 1, 1, 1,
1.647443, 0.6686817, 1.035466, 1, 0, 0, 1, 1,
1.695239, -1.304607, 0.4171037, 1, 0, 0, 1, 1,
1.719878, 0.3509653, 1.622303, 1, 0, 0, 1, 1,
1.735364, 0.191982, 1.859422, 1, 0, 0, 1, 1,
1.741885, -0.8847815, 3.082283, 1, 0, 0, 1, 1,
1.761339, -0.09861991, 2.236692, 0, 0, 0, 1, 1,
1.786553, 0.2955224, 2.000292, 0, 0, 0, 1, 1,
1.803297, -0.29381, 2.791051, 0, 0, 0, 1, 1,
1.814863, -0.3541136, 0.7984241, 0, 0, 0, 1, 1,
1.832263, -0.8786915, 1.63232, 0, 0, 0, 1, 1,
1.83905, -0.6699485, 3.744088, 0, 0, 0, 1, 1,
1.852598, 0.2746196, 0.8861154, 0, 0, 0, 1, 1,
1.920165, 0.1746699, 1.962712, 1, 1, 1, 1, 1,
1.938295, -1.442156, 0.8965679, 1, 1, 1, 1, 1,
1.949556, -0.5990329, -0.436523, 1, 1, 1, 1, 1,
1.95356, -0.1842846, 1.681715, 1, 1, 1, 1, 1,
1.957959, -0.8141625, 2.237687, 1, 1, 1, 1, 1,
1.958067, -1.710092, 2.49722, 1, 1, 1, 1, 1,
1.958922, 0.06489841, -0.9374163, 1, 1, 1, 1, 1,
1.986615, -1.387219, 3.141362, 1, 1, 1, 1, 1,
1.998742, 0.06022062, 1.175748, 1, 1, 1, 1, 1,
2.012755, 1.601475, 1.291818, 1, 1, 1, 1, 1,
2.017099, 0.8879062, 1.1317, 1, 1, 1, 1, 1,
2.02562, 0.1120843, 1.809573, 1, 1, 1, 1, 1,
2.032598, -1.266485, 1.328589, 1, 1, 1, 1, 1,
2.049366, -0.3811526, 2.808657, 1, 1, 1, 1, 1,
2.060467, -1.209368, 4.613493, 1, 1, 1, 1, 1,
2.11618, 0.5619933, 2.470504, 0, 0, 1, 1, 1,
2.116585, -1.923989, 1.223987, 1, 0, 0, 1, 1,
2.124438, 0.7974052, -0.1248701, 1, 0, 0, 1, 1,
2.132073, 0.9027204, 0.5739241, 1, 0, 0, 1, 1,
2.137826, 1.049733, 2.732084, 1, 0, 0, 1, 1,
2.140965, 0.2543525, 1.707704, 1, 0, 0, 1, 1,
2.167138, 1.058364, 0.606819, 0, 0, 0, 1, 1,
2.174246, -1.542783, 3.69911, 0, 0, 0, 1, 1,
2.204044, 1.311667, 0.6371461, 0, 0, 0, 1, 1,
2.209429, -0.0477067, 0.2473186, 0, 0, 0, 1, 1,
2.227148, 1.296632, 1.601025, 0, 0, 0, 1, 1,
2.244739, -0.4415175, 0.222377, 0, 0, 0, 1, 1,
2.298445, -0.9208963, 1.000769, 0, 0, 0, 1, 1,
2.299278, -1.872219, 1.555389, 1, 1, 1, 1, 1,
2.311726, -2.422844, 2.224764, 1, 1, 1, 1, 1,
2.319202, -1.440037, 1.198626, 1, 1, 1, 1, 1,
2.355702, -0.7407525, 1.124956, 1, 1, 1, 1, 1,
2.474147, -0.238541, 0.6000443, 1, 1, 1, 1, 1,
2.517393, 1.427884, 1.620947, 1, 1, 1, 1, 1,
2.633841, 0.7553646, 1.416262, 1, 1, 1, 1, 1
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
var radius = 9.480215;
var distance = 33.29885;
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
mvMatrix.translate( 0.2462782, -0.2227104, 0.07814097 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29885);
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
