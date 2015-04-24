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
-2.955998, -1.97593, -2.229162, 1, 0, 0, 1,
-2.841187, -0.9677922, -1.768986, 1, 0.007843138, 0, 1,
-2.691801, -1.054668, -1.06566, 1, 0.01176471, 0, 1,
-2.618603, 2.334421, -0.6464358, 1, 0.01960784, 0, 1,
-2.578327, -0.4556078, -2.606054, 1, 0.02352941, 0, 1,
-2.493432, -0.03900546, -0.4753564, 1, 0.03137255, 0, 1,
-2.470427, 1.089518, -1.029444, 1, 0.03529412, 0, 1,
-2.456597, -0.4588267, -1.629703, 1, 0.04313726, 0, 1,
-2.455286, -2.11781, -1.615966, 1, 0.04705882, 0, 1,
-2.404114, 0.2480672, 0.6544622, 1, 0.05490196, 0, 1,
-2.344337, -0.9378934, -2.005108, 1, 0.05882353, 0, 1,
-2.340524, 3.109977, -0.7846171, 1, 0.06666667, 0, 1,
-2.332389, 1.135169, -0.161827, 1, 0.07058824, 0, 1,
-2.313831, -0.05679498, -1.601539, 1, 0.07843138, 0, 1,
-2.167555, -0.03425844, -1.274382, 1, 0.08235294, 0, 1,
-2.123911, 0.3410813, -1.070186, 1, 0.09019608, 0, 1,
-2.097026, -0.9988604, -0.5080121, 1, 0.09411765, 0, 1,
-2.069382, 0.6999241, -1.63816, 1, 0.1019608, 0, 1,
-2.067735, 1.206655, -0.02205086, 1, 0.1098039, 0, 1,
-2.061107, 0.05505766, -1.021525, 1, 0.1137255, 0, 1,
-2.056992, -1.777548, -1.680781, 1, 0.1215686, 0, 1,
-1.994789, 0.379638, -0.1246243, 1, 0.1254902, 0, 1,
-1.971446, -1.42886, -2.265237, 1, 0.1333333, 0, 1,
-1.966754, 0.9308009, 1.254907, 1, 0.1372549, 0, 1,
-1.936996, 0.4677724, -3.157336, 1, 0.145098, 0, 1,
-1.918941, -1.161702, -3.98278, 1, 0.1490196, 0, 1,
-1.907588, 0.2998692, -0.9673618, 1, 0.1568628, 0, 1,
-1.897383, 1.746942, -1.536412, 1, 0.1607843, 0, 1,
-1.881236, 0.1080354, -1.373416, 1, 0.1686275, 0, 1,
-1.875325, 0.3168265, -0.6635613, 1, 0.172549, 0, 1,
-1.86801, 0.7184039, -1.812848, 1, 0.1803922, 0, 1,
-1.858812, -0.7684293, -1.66302, 1, 0.1843137, 0, 1,
-1.858314, 0.655976, -1.414812, 1, 0.1921569, 0, 1,
-1.785365, -0.2783418, -1.483505, 1, 0.1960784, 0, 1,
-1.776631, -1.192179, -2.103338, 1, 0.2039216, 0, 1,
-1.776134, -0.9860827, -2.053572, 1, 0.2117647, 0, 1,
-1.775942, -1.655053, -0.8950194, 1, 0.2156863, 0, 1,
-1.767385, 0.1370566, -1.166763, 1, 0.2235294, 0, 1,
-1.730644, 0.88306, -1.666392, 1, 0.227451, 0, 1,
-1.707136, -1.05675, -2.459383, 1, 0.2352941, 0, 1,
-1.690003, 0.09356716, -2.656454, 1, 0.2392157, 0, 1,
-1.685859, -1.167313, -1.419979, 1, 0.2470588, 0, 1,
-1.679546, -0.1341421, -1.709693, 1, 0.2509804, 0, 1,
-1.671764, -1.065646, -3.538455, 1, 0.2588235, 0, 1,
-1.661911, -2.65038, -1.991924, 1, 0.2627451, 0, 1,
-1.642778, -1.122967, -3.35024, 1, 0.2705882, 0, 1,
-1.642526, 1.449631, -0.6702345, 1, 0.2745098, 0, 1,
-1.639193, 1.668855, -0.005549991, 1, 0.282353, 0, 1,
-1.621127, 0.1720123, -3.34554, 1, 0.2862745, 0, 1,
-1.620843, 0.8192643, -2.46868, 1, 0.2941177, 0, 1,
-1.605759, -1.7233, -3.945075, 1, 0.3019608, 0, 1,
-1.601704, -0.7714908, -2.348285, 1, 0.3058824, 0, 1,
-1.598175, 0.8362633, -2.521205, 1, 0.3137255, 0, 1,
-1.597692, -0.240483, -0.4741835, 1, 0.3176471, 0, 1,
-1.558365, -0.9681499, -2.413365, 1, 0.3254902, 0, 1,
-1.522156, 0.4845525, -2.100966, 1, 0.3294118, 0, 1,
-1.514435, -0.948117, -1.204797, 1, 0.3372549, 0, 1,
-1.513326, 1.533285, -0.3374192, 1, 0.3411765, 0, 1,
-1.507761, -0.6892529, -2.277953, 1, 0.3490196, 0, 1,
-1.503533, -0.8343342, -3.331502, 1, 0.3529412, 0, 1,
-1.47327, -2.567032, -2.258626, 1, 0.3607843, 0, 1,
-1.449468, 0.3976145, -1.399883, 1, 0.3647059, 0, 1,
-1.439635, -0.05661147, -2.236432, 1, 0.372549, 0, 1,
-1.431138, -0.4405661, -2.516617, 1, 0.3764706, 0, 1,
-1.423455, -1.409167, -1.447221, 1, 0.3843137, 0, 1,
-1.399326, -0.2322536, -2.191457, 1, 0.3882353, 0, 1,
-1.396813, -0.04971061, -1.109211, 1, 0.3960784, 0, 1,
-1.392831, 0.7744405, -0.9930517, 1, 0.4039216, 0, 1,
-1.37227, -1.364727, -4.091558, 1, 0.4078431, 0, 1,
-1.361796, 0.6890062, -0.1005024, 1, 0.4156863, 0, 1,
-1.35725, -0.0817391, -2.373635, 1, 0.4196078, 0, 1,
-1.35466, -0.9485109, -2.066886, 1, 0.427451, 0, 1,
-1.354454, 0.08902737, -1.37038, 1, 0.4313726, 0, 1,
-1.353078, 0.09239852, -2.451025, 1, 0.4392157, 0, 1,
-1.352597, 1.027793, -0.2591736, 1, 0.4431373, 0, 1,
-1.34, 0.5102897, -2.755542, 1, 0.4509804, 0, 1,
-1.338433, -1.488853, -3.245468, 1, 0.454902, 0, 1,
-1.332536, 0.05566495, -2.966522, 1, 0.4627451, 0, 1,
-1.318607, -1.462336, -2.198409, 1, 0.4666667, 0, 1,
-1.31612, -0.1862994, -0.1785336, 1, 0.4745098, 0, 1,
-1.315938, 0.2688536, -1.206036, 1, 0.4784314, 0, 1,
-1.31375, 0.6335839, -0.402751, 1, 0.4862745, 0, 1,
-1.312356, -0.08448578, -1.99784, 1, 0.4901961, 0, 1,
-1.311021, -0.3884186, -2.116227, 1, 0.4980392, 0, 1,
-1.304139, 0.2273548, -0.7758086, 1, 0.5058824, 0, 1,
-1.299535, -2.124071, -2.531303, 1, 0.509804, 0, 1,
-1.293443, 2.493613, -0.5962088, 1, 0.5176471, 0, 1,
-1.291967, -0.6415043, -2.587377, 1, 0.5215687, 0, 1,
-1.289131, 0.1507353, -0.8444641, 1, 0.5294118, 0, 1,
-1.289089, -0.2207606, -1.23162, 1, 0.5333334, 0, 1,
-1.286891, 1.459574, -0.7858292, 1, 0.5411765, 0, 1,
-1.28651, 0.7853686, -0.3750065, 1, 0.5450981, 0, 1,
-1.285199, 0.5321129, 0.7402327, 1, 0.5529412, 0, 1,
-1.282158, -0.8574189, -1.117736, 1, 0.5568628, 0, 1,
-1.255545, -0.1743838, -2.945633, 1, 0.5647059, 0, 1,
-1.253981, 1.559378, -0.5903472, 1, 0.5686275, 0, 1,
-1.247538, 0.128551, -2.931465, 1, 0.5764706, 0, 1,
-1.24613, 1.051133, -0.2287638, 1, 0.5803922, 0, 1,
-1.244193, 0.2502646, -0.9988354, 1, 0.5882353, 0, 1,
-1.239912, -1.12436, -3.057708, 1, 0.5921569, 0, 1,
-1.238683, 0.1998835, -1.180575, 1, 0.6, 0, 1,
-1.237267, 1.231039, -0.2182783, 1, 0.6078432, 0, 1,
-1.217867, 0.6209518, 0.1182958, 1, 0.6117647, 0, 1,
-1.217548, 1.23257, -0.3417981, 1, 0.6196079, 0, 1,
-1.213881, -2.416486, -1.543632, 1, 0.6235294, 0, 1,
-1.212011, -0.5337169, -0.9994662, 1, 0.6313726, 0, 1,
-1.202301, 1.998509, -0.1337572, 1, 0.6352941, 0, 1,
-1.200544, -0.3645997, -0.4492894, 1, 0.6431373, 0, 1,
-1.192429, 0.5756035, 0.5607224, 1, 0.6470588, 0, 1,
-1.184165, 0.1654153, -0.8455376, 1, 0.654902, 0, 1,
-1.178125, 2.494903, 2.084328, 1, 0.6588235, 0, 1,
-1.159555, -0.7615194, -0.5320755, 1, 0.6666667, 0, 1,
-1.149414, 0.7420115, -2.008109, 1, 0.6705883, 0, 1,
-1.141543, 0.4907838, -1.703401, 1, 0.6784314, 0, 1,
-1.14151, 0.08574621, -0.1416604, 1, 0.682353, 0, 1,
-1.134312, -1.597198, -1.274819, 1, 0.6901961, 0, 1,
-1.130568, 0.1515117, -2.350416, 1, 0.6941177, 0, 1,
-1.12946, 1.203495, -0.8787163, 1, 0.7019608, 0, 1,
-1.12484, 0.6757127, -1.806337, 1, 0.7098039, 0, 1,
-1.111316, -0.7299026, -3.874747, 1, 0.7137255, 0, 1,
-1.110225, -0.4233816, -1.48886, 1, 0.7215686, 0, 1,
-1.108888, -0.7539884, -2.617144, 1, 0.7254902, 0, 1,
-1.107204, -0.0672615, -4.777792, 1, 0.7333333, 0, 1,
-1.103483, -2.221116, -2.345653, 1, 0.7372549, 0, 1,
-1.086169, 0.4553281, -4.469628, 1, 0.7450981, 0, 1,
-1.074256, -0.9521568, -2.812234, 1, 0.7490196, 0, 1,
-1.065636, 0.3221542, -2.560945, 1, 0.7568628, 0, 1,
-1.060551, 1.273038, -0.1979817, 1, 0.7607843, 0, 1,
-1.053356, -0.6118059, -1.195658, 1, 0.7686275, 0, 1,
-1.048275, 2.230814, -0.9404642, 1, 0.772549, 0, 1,
-1.033903, -1.223128, -3.600075, 1, 0.7803922, 0, 1,
-1.032451, -0.846895, -1.110488, 1, 0.7843137, 0, 1,
-1.030049, -1.220443, -1.178485, 1, 0.7921569, 0, 1,
-1.026254, -0.5481356, -1.797996, 1, 0.7960784, 0, 1,
-1.014534, -0.1246076, -0.3381225, 1, 0.8039216, 0, 1,
-1.011137, 0.5098965, -0.8952675, 1, 0.8117647, 0, 1,
-1.009941, -0.6534169, -2.364152, 1, 0.8156863, 0, 1,
-1.008877, -0.4195948, -2.594806, 1, 0.8235294, 0, 1,
-1.001902, -1.656482, -2.291691, 1, 0.827451, 0, 1,
-0.9963905, 0.3354129, -3.555736, 1, 0.8352941, 0, 1,
-0.9910761, 0.9561913, -1.443898, 1, 0.8392157, 0, 1,
-0.9898764, -0.03025197, -1.061103, 1, 0.8470588, 0, 1,
-0.9893387, -1.036523, -3.592457, 1, 0.8509804, 0, 1,
-0.9784815, 0.02081034, -0.1627205, 1, 0.8588235, 0, 1,
-0.9782403, -0.794082, -2.232457, 1, 0.8627451, 0, 1,
-0.9782133, -0.05067799, -0.9900239, 1, 0.8705882, 0, 1,
-0.9631681, 2.114514, -2.478001, 1, 0.8745098, 0, 1,
-0.95983, 0.3293718, -0.5254635, 1, 0.8823529, 0, 1,
-0.9550827, -0.02091037, -1.157556, 1, 0.8862745, 0, 1,
-0.9548595, -3.03517, -0.8827804, 1, 0.8941177, 0, 1,
-0.9546909, -1.440461, -2.696875, 1, 0.8980392, 0, 1,
-0.9519371, 0.8761143, -0.3795777, 1, 0.9058824, 0, 1,
-0.9475349, 1.338819, -1.40055, 1, 0.9137255, 0, 1,
-0.9416138, -0.2953668, -3.998971, 1, 0.9176471, 0, 1,
-0.9348257, 2.142568, 1.992412, 1, 0.9254902, 0, 1,
-0.9285089, 0.267828, -2.074663, 1, 0.9294118, 0, 1,
-0.9239473, 0.4752315, -2.29199, 1, 0.9372549, 0, 1,
-0.9210303, -0.5945773, -0.148863, 1, 0.9411765, 0, 1,
-0.920974, 0.04501107, -2.520497, 1, 0.9490196, 0, 1,
-0.9197727, 0.07891314, -2.025858, 1, 0.9529412, 0, 1,
-0.9131896, -0.9711866, -2.639827, 1, 0.9607843, 0, 1,
-0.911387, 0.8088773, -1.178786, 1, 0.9647059, 0, 1,
-0.9023253, 0.1945532, -1.169113, 1, 0.972549, 0, 1,
-0.8984736, -0.1069029, -0.6161869, 1, 0.9764706, 0, 1,
-0.8973767, -0.2387087, -2.784348, 1, 0.9843137, 0, 1,
-0.8933805, 0.8551073, -1.677012, 1, 0.9882353, 0, 1,
-0.8877422, -2.230931, -2.281452, 1, 0.9960784, 0, 1,
-0.8871095, 1.195673, -2.507871, 0.9960784, 1, 0, 1,
-0.8835723, 0.9813471, -1.395871, 0.9921569, 1, 0, 1,
-0.8824199, 0.8423204, 0.01369012, 0.9843137, 1, 0, 1,
-0.8774253, 0.1108407, -1.755156, 0.9803922, 1, 0, 1,
-0.8750932, 0.850307, -0.8328013, 0.972549, 1, 0, 1,
-0.8719018, -0.7045959, -1.464027, 0.9686275, 1, 0, 1,
-0.8678141, 1.480426, 0.505955, 0.9607843, 1, 0, 1,
-0.8670449, 0.6713016, -1.359118, 0.9568627, 1, 0, 1,
-0.8644779, 0.8615136, -1.078175, 0.9490196, 1, 0, 1,
-0.8640329, -0.1364472, -1.566139, 0.945098, 1, 0, 1,
-0.8630032, 0.5327121, 0.1790511, 0.9372549, 1, 0, 1,
-0.8626788, 1.398463, 0.3643438, 0.9333333, 1, 0, 1,
-0.8622711, 0.4208484, 0.1123092, 0.9254902, 1, 0, 1,
-0.8603294, 1.529254, 0.01137746, 0.9215686, 1, 0, 1,
-0.8443455, 0.2942529, -1.455919, 0.9137255, 1, 0, 1,
-0.84363, -0.7478344, -2.886501, 0.9098039, 1, 0, 1,
-0.8404791, 1.496529, 0.1125411, 0.9019608, 1, 0, 1,
-0.8337266, -0.9469545, -2.768404, 0.8941177, 1, 0, 1,
-0.8315687, 0.7303057, -1.715788, 0.8901961, 1, 0, 1,
-0.8296174, -0.3125108, -1.685089, 0.8823529, 1, 0, 1,
-0.8252022, -1.373618, -3.54626, 0.8784314, 1, 0, 1,
-0.8230262, 0.995981, 0.3270523, 0.8705882, 1, 0, 1,
-0.8228569, -1.810721, -3.915825, 0.8666667, 1, 0, 1,
-0.8129145, -1.465063, -3.441005, 0.8588235, 1, 0, 1,
-0.8051127, -0.104748, -0.9033801, 0.854902, 1, 0, 1,
-0.8048021, -0.03137029, -0.9692133, 0.8470588, 1, 0, 1,
-0.8047372, 0.7691492, -0.7976676, 0.8431373, 1, 0, 1,
-0.8030348, 0.1977466, -2.668116, 0.8352941, 1, 0, 1,
-0.7878591, 0.440343, -0.9764256, 0.8313726, 1, 0, 1,
-0.7878306, 0.6293564, -1.744154, 0.8235294, 1, 0, 1,
-0.7874354, 0.9619649, -0.02029764, 0.8196079, 1, 0, 1,
-0.7836024, 0.4091716, -0.7432228, 0.8117647, 1, 0, 1,
-0.7813019, -0.1163275, -1.263032, 0.8078431, 1, 0, 1,
-0.777906, 0.02261118, -0.7419328, 0.8, 1, 0, 1,
-0.772864, 1.221856, -0.8759967, 0.7921569, 1, 0, 1,
-0.7681063, 0.917097, -1.128478, 0.7882353, 1, 0, 1,
-0.7653809, 0.2003657, -0.5603403, 0.7803922, 1, 0, 1,
-0.7617437, 1.521042, -2.488673, 0.7764706, 1, 0, 1,
-0.7531539, -0.5502595, -1.395997, 0.7686275, 1, 0, 1,
-0.7524439, 0.3189735, -0.4273402, 0.7647059, 1, 0, 1,
-0.7417219, 0.07585671, -1.920846, 0.7568628, 1, 0, 1,
-0.741438, 0.7232118, -0.7718454, 0.7529412, 1, 0, 1,
-0.7410051, 0.1974282, -3.157876, 0.7450981, 1, 0, 1,
-0.7386775, -0.8431454, -1.981765, 0.7411765, 1, 0, 1,
-0.7347328, 1.721884, -1.136121, 0.7333333, 1, 0, 1,
-0.733566, 0.1973055, -1.94642, 0.7294118, 1, 0, 1,
-0.7327226, -0.948576, -1.622447, 0.7215686, 1, 0, 1,
-0.7263619, 0.6016692, -1.584227, 0.7176471, 1, 0, 1,
-0.7253498, -1.279179, -3.043682, 0.7098039, 1, 0, 1,
-0.7230859, -0.9634793, -1.936296, 0.7058824, 1, 0, 1,
-0.7200791, -0.7759595, -3.537043, 0.6980392, 1, 0, 1,
-0.7165659, 1.103482, 0.4508937, 0.6901961, 1, 0, 1,
-0.7147077, 0.6655813, -1.202692, 0.6862745, 1, 0, 1,
-0.7142626, 0.724636, -1.350283, 0.6784314, 1, 0, 1,
-0.7130131, 2.384326, -0.6118214, 0.6745098, 1, 0, 1,
-0.7091353, 0.1912612, -1.118794, 0.6666667, 1, 0, 1,
-0.7083741, 0.9205989, -1.499306, 0.6627451, 1, 0, 1,
-0.6933672, -0.2026179, -1.582695, 0.654902, 1, 0, 1,
-0.6927484, -1.587654, -3.403621, 0.6509804, 1, 0, 1,
-0.6869212, 0.6431094, -0.5042409, 0.6431373, 1, 0, 1,
-0.6850461, 1.179558, -0.2114722, 0.6392157, 1, 0, 1,
-0.6847239, -0.08713181, -1.66825, 0.6313726, 1, 0, 1,
-0.6789591, 3.076378, -0.5203585, 0.627451, 1, 0, 1,
-0.6761881, 0.2177549, -0.129233, 0.6196079, 1, 0, 1,
-0.667846, -0.1813916, -1.204072, 0.6156863, 1, 0, 1,
-0.6650606, 0.03661119, -2.115558, 0.6078432, 1, 0, 1,
-0.6641207, 0.2673388, -1.040644, 0.6039216, 1, 0, 1,
-0.6633965, -2.907315, -2.700465, 0.5960785, 1, 0, 1,
-0.6611769, 0.8556278, -1.16969, 0.5882353, 1, 0, 1,
-0.6541883, -2.135331, -4.059993, 0.5843138, 1, 0, 1,
-0.6534525, 2.282079, -0.5696304, 0.5764706, 1, 0, 1,
-0.6484773, -0.192231, -2.847306, 0.572549, 1, 0, 1,
-0.6473206, 1.641554, -2.779444, 0.5647059, 1, 0, 1,
-0.6409637, -0.05199778, -0.3135624, 0.5607843, 1, 0, 1,
-0.63916, 1.763683, 0.0700767, 0.5529412, 1, 0, 1,
-0.6289159, 0.9382826, -2.562582, 0.5490196, 1, 0, 1,
-0.6260034, -1.971413, -2.366567, 0.5411765, 1, 0, 1,
-0.625959, 0.008397328, -1.761619, 0.5372549, 1, 0, 1,
-0.6251868, 0.3326783, -2.135377, 0.5294118, 1, 0, 1,
-0.6242443, 0.6692605, -0.02860899, 0.5254902, 1, 0, 1,
-0.6238302, 1.50184, -0.7615532, 0.5176471, 1, 0, 1,
-0.6215923, -1.616611, -3.147399, 0.5137255, 1, 0, 1,
-0.620239, -0.2373213, -1.952358, 0.5058824, 1, 0, 1,
-0.6169206, 0.775403, 0.8042901, 0.5019608, 1, 0, 1,
-0.6144658, 1.419388, -1.976215, 0.4941176, 1, 0, 1,
-0.6117146, -0.7953351, -4.068039, 0.4862745, 1, 0, 1,
-0.6082181, 0.1947413, -1.794601, 0.4823529, 1, 0, 1,
-0.6032654, 0.009316551, -1.677939, 0.4745098, 1, 0, 1,
-0.5976418, 1.037951, 0.502782, 0.4705882, 1, 0, 1,
-0.5954632, -1.763572, -2.048589, 0.4627451, 1, 0, 1,
-0.5949807, -0.7975717, -3.099644, 0.4588235, 1, 0, 1,
-0.5911765, -0.04053326, -2.263808, 0.4509804, 1, 0, 1,
-0.5907068, 0.786754, -0.5196443, 0.4470588, 1, 0, 1,
-0.5888864, 0.006901979, 0.403593, 0.4392157, 1, 0, 1,
-0.5872685, -1.241318, -2.046326, 0.4352941, 1, 0, 1,
-0.587223, -1.540542, -3.228559, 0.427451, 1, 0, 1,
-0.5869669, -0.0729183, -1.752048, 0.4235294, 1, 0, 1,
-0.585161, 1.132488, 0.918002, 0.4156863, 1, 0, 1,
-0.5806366, 1.263129, 0.1582441, 0.4117647, 1, 0, 1,
-0.5806012, -1.49806, -3.379337, 0.4039216, 1, 0, 1,
-0.580444, -0.9554195, -1.875769, 0.3960784, 1, 0, 1,
-0.5780825, 0.751723, -0.8450722, 0.3921569, 1, 0, 1,
-0.5725224, 0.5154899, -2.42663, 0.3843137, 1, 0, 1,
-0.5715683, -2.394293, -3.48054, 0.3803922, 1, 0, 1,
-0.5692796, 0.290833, -0.4383118, 0.372549, 1, 0, 1,
-0.5657536, -0.06750713, -0.03536366, 0.3686275, 1, 0, 1,
-0.5650304, -0.03612035, -2.164435, 0.3607843, 1, 0, 1,
-0.563597, 0.7106938, 0.2263604, 0.3568628, 1, 0, 1,
-0.5603451, -1.216812, -3.27913, 0.3490196, 1, 0, 1,
-0.555664, 1.031311, -0.435424, 0.345098, 1, 0, 1,
-0.5536895, -1.211895, -3.349098, 0.3372549, 1, 0, 1,
-0.5526724, 0.09301397, -1.821409, 0.3333333, 1, 0, 1,
-0.5514192, 0.7157472, -2.603954, 0.3254902, 1, 0, 1,
-0.550792, -1.414725, -4.286662, 0.3215686, 1, 0, 1,
-0.5490183, -0.3924262, -2.246893, 0.3137255, 1, 0, 1,
-0.5458077, -0.3199868, -1.810469, 0.3098039, 1, 0, 1,
-0.5431167, 0.2087126, -1.953632, 0.3019608, 1, 0, 1,
-0.5428139, 0.4193158, 1.574607, 0.2941177, 1, 0, 1,
-0.537569, 0.4150172, -2.0516, 0.2901961, 1, 0, 1,
-0.5278882, -1.029115, -3.564073, 0.282353, 1, 0, 1,
-0.5186678, -0.3866183, -4.009355, 0.2784314, 1, 0, 1,
-0.5122584, 1.465474, -0.4394881, 0.2705882, 1, 0, 1,
-0.5115329, -0.4755245, -1.970538, 0.2666667, 1, 0, 1,
-0.5089768, -0.08634188, -1.962008, 0.2588235, 1, 0, 1,
-0.5064553, -0.6864499, -1.6222, 0.254902, 1, 0, 1,
-0.5058689, -0.5611867, -0.6848091, 0.2470588, 1, 0, 1,
-0.5038735, 1.333729, -0.06282821, 0.2431373, 1, 0, 1,
-0.4994473, 1.650984, 0.2310697, 0.2352941, 1, 0, 1,
-0.4993236, 0.3685142, -0.9372252, 0.2313726, 1, 0, 1,
-0.4975086, -0.3715416, -1.793292, 0.2235294, 1, 0, 1,
-0.4973376, -0.366442, -2.017436, 0.2196078, 1, 0, 1,
-0.4971755, -0.2362426, -2.247034, 0.2117647, 1, 0, 1,
-0.4963514, 0.2538054, 0.3358293, 0.2078431, 1, 0, 1,
-0.4962354, -0.2849959, -0.1511565, 0.2, 1, 0, 1,
-0.489961, -0.1856577, -1.338071, 0.1921569, 1, 0, 1,
-0.4897856, -1.482159, -3.724862, 0.1882353, 1, 0, 1,
-0.4897348, 0.1503692, -1.578925, 0.1803922, 1, 0, 1,
-0.4892961, -1.382358, -3.278117, 0.1764706, 1, 0, 1,
-0.4874127, -0.3381751, -1.851425, 0.1686275, 1, 0, 1,
-0.4861366, 1.595816, -0.7430212, 0.1647059, 1, 0, 1,
-0.4819556, 0.1270044, -0.4153147, 0.1568628, 1, 0, 1,
-0.480236, -0.5480887, -2.23798, 0.1529412, 1, 0, 1,
-0.4785628, 0.5535522, -2.004618, 0.145098, 1, 0, 1,
-0.4765908, -1.389955, -2.439878, 0.1411765, 1, 0, 1,
-0.4746197, 0.06129334, -0.7220042, 0.1333333, 1, 0, 1,
-0.4739413, 0.6954052, -0.7857298, 0.1294118, 1, 0, 1,
-0.4725487, -0.2111448, -1.776508, 0.1215686, 1, 0, 1,
-0.4722717, 2.781555, -1.810962, 0.1176471, 1, 0, 1,
-0.4707961, 0.2854353, -0.361239, 0.1098039, 1, 0, 1,
-0.4704588, 0.9164093, -0.7491365, 0.1058824, 1, 0, 1,
-0.4695559, 1.061129, -1.205417, 0.09803922, 1, 0, 1,
-0.4682807, -0.8094773, -2.199469, 0.09019608, 1, 0, 1,
-0.4634714, 0.9446105, -2.004435, 0.08627451, 1, 0, 1,
-0.4604477, -1.888053, -2.594159, 0.07843138, 1, 0, 1,
-0.4601825, -0.5338535, -1.411036, 0.07450981, 1, 0, 1,
-0.4549931, -0.1958374, -2.412898, 0.06666667, 1, 0, 1,
-0.4525195, -0.1807093, -1.751384, 0.0627451, 1, 0, 1,
-0.4513662, 0.5816314, 0.07790767, 0.05490196, 1, 0, 1,
-0.4480089, 0.6014869, 1.216209, 0.05098039, 1, 0, 1,
-0.4413522, -1.468894, -3.77326, 0.04313726, 1, 0, 1,
-0.4409816, 0.6032524, -1.077646, 0.03921569, 1, 0, 1,
-0.4402956, -0.351182, -2.370882, 0.03137255, 1, 0, 1,
-0.4395484, -2.286194, -1.766704, 0.02745098, 1, 0, 1,
-0.4370363, 0.306943, -2.51589, 0.01960784, 1, 0, 1,
-0.4363112, -0.7359349, -2.153597, 0.01568628, 1, 0, 1,
-0.436031, -1.284513, -1.162272, 0.007843138, 1, 0, 1,
-0.4353763, 1.577317, -0.06489712, 0.003921569, 1, 0, 1,
-0.4310543, -0.52781, -1.873823, 0, 1, 0.003921569, 1,
-0.4207554, -0.3480203, -0.6392829, 0, 1, 0.01176471, 1,
-0.4153201, 0.6583104, 0.0718074, 0, 1, 0.01568628, 1,
-0.4144388, 0.2707763, -2.457422, 0, 1, 0.02352941, 1,
-0.4067186, 0.831759, -0.9875933, 0, 1, 0.02745098, 1,
-0.4031247, -0.649519, -3.622133, 0, 1, 0.03529412, 1,
-0.3993387, -0.9208496, -4.06805, 0, 1, 0.03921569, 1,
-0.3927502, -0.3607686, -2.037193, 0, 1, 0.04705882, 1,
-0.3872277, -0.8410624, -2.143879, 0, 1, 0.05098039, 1,
-0.3807507, 0.1132681, -0.188726, 0, 1, 0.05882353, 1,
-0.3795188, 0.7470499, -1.259434, 0, 1, 0.0627451, 1,
-0.3684439, -1.052684, -1.559237, 0, 1, 0.07058824, 1,
-0.3657418, -0.2651006, -1.091308, 0, 1, 0.07450981, 1,
-0.3654626, -0.7128645, -3.252374, 0, 1, 0.08235294, 1,
-0.3617905, -1.2731, -2.521219, 0, 1, 0.08627451, 1,
-0.3603205, -0.1953829, -0.6330903, 0, 1, 0.09411765, 1,
-0.3595482, 0.2423901, -1.237118, 0, 1, 0.1019608, 1,
-0.359475, 0.07767487, -2.235493, 0, 1, 0.1058824, 1,
-0.3547925, -1.077553, -3.318475, 0, 1, 0.1137255, 1,
-0.3541103, -0.2285302, -1.48848, 0, 1, 0.1176471, 1,
-0.3526873, -0.3497515, -3.281964, 0, 1, 0.1254902, 1,
-0.3509957, 0.8860156, -0.5191919, 0, 1, 0.1294118, 1,
-0.3509748, -0.9180434, -3.947411, 0, 1, 0.1372549, 1,
-0.3502203, -1.111612, -3.561474, 0, 1, 0.1411765, 1,
-0.3479456, -0.5973024, -4.499076, 0, 1, 0.1490196, 1,
-0.3396543, -0.6695388, -1.788109, 0, 1, 0.1529412, 1,
-0.338957, -1.035974, -3.822506, 0, 1, 0.1607843, 1,
-0.3377946, -0.7146987, -1.606148, 0, 1, 0.1647059, 1,
-0.3373927, -0.5318351, -2.258712, 0, 1, 0.172549, 1,
-0.3345106, 0.2783506, -1.139228, 0, 1, 0.1764706, 1,
-0.3344839, -0.6001947, -1.647856, 0, 1, 0.1843137, 1,
-0.3310278, -0.4054069, -3.413631, 0, 1, 0.1882353, 1,
-0.3302203, -0.401852, -1.913792, 0, 1, 0.1960784, 1,
-0.3297851, -0.9993606, -2.17528, 0, 1, 0.2039216, 1,
-0.3255374, 0.3473405, -2.408599, 0, 1, 0.2078431, 1,
-0.3232329, -0.0227516, -1.692373, 0, 1, 0.2156863, 1,
-0.3087322, -0.02762696, -0.1662614, 0, 1, 0.2196078, 1,
-0.3078762, -1.678932, -2.409894, 0, 1, 0.227451, 1,
-0.3026859, 0.5219074, -0.6145275, 0, 1, 0.2313726, 1,
-0.3021767, -1.231129, -4.054571, 0, 1, 0.2392157, 1,
-0.298788, 1.010605, -0.5893769, 0, 1, 0.2431373, 1,
-0.2952821, -1.162565, -4.724888, 0, 1, 0.2509804, 1,
-0.2889669, -1.475095, -0.8409088, 0, 1, 0.254902, 1,
-0.2878111, 0.8807225, -0.3245346, 0, 1, 0.2627451, 1,
-0.2874683, 0.7043643, -0.7919978, 0, 1, 0.2666667, 1,
-0.2839845, 0.1739651, -0.3754144, 0, 1, 0.2745098, 1,
-0.28361, -1.254136, -3.499659, 0, 1, 0.2784314, 1,
-0.2828808, -0.360162, -2.764689, 0, 1, 0.2862745, 1,
-0.2825531, 0.005000615, -3.347661, 0, 1, 0.2901961, 1,
-0.27102, -1.850633, -3.346578, 0, 1, 0.2980392, 1,
-0.2707403, -0.2578627, -2.402994, 0, 1, 0.3058824, 1,
-0.2703844, -2.583156, -3.868257, 0, 1, 0.3098039, 1,
-0.2652173, 1.222116, -1.505436, 0, 1, 0.3176471, 1,
-0.2645947, 2.619622, -0.5687044, 0, 1, 0.3215686, 1,
-0.2545721, 0.3528862, -0.02840208, 0, 1, 0.3294118, 1,
-0.2543792, -0.7137377, -3.411994, 0, 1, 0.3333333, 1,
-0.2519829, 0.2311776, -2.300305, 0, 1, 0.3411765, 1,
-0.249985, -0.4302287, -2.539647, 0, 1, 0.345098, 1,
-0.2476926, -0.4733262, -1.87683, 0, 1, 0.3529412, 1,
-0.2444093, 0.4148804, -1.731922, 0, 1, 0.3568628, 1,
-0.2391314, 0.01294939, -2.726005, 0, 1, 0.3647059, 1,
-0.2383108, 1.151625, -1.78376, 0, 1, 0.3686275, 1,
-0.2292576, -1.263576, -3.633668, 0, 1, 0.3764706, 1,
-0.2282877, -0.9103851, -3.851979, 0, 1, 0.3803922, 1,
-0.2240505, 1.91855, -0.733542, 0, 1, 0.3882353, 1,
-0.2187812, 0.4745902, -2.059998, 0, 1, 0.3921569, 1,
-0.2149877, -1.847606, -4.244555, 0, 1, 0.4, 1,
-0.214648, 0.4163396, 0.645847, 0, 1, 0.4078431, 1,
-0.213972, 0.9624861, -2.591034, 0, 1, 0.4117647, 1,
-0.2111516, -0.3595047, -1.502039, 0, 1, 0.4196078, 1,
-0.210589, 0.4405344, -1.320387, 0, 1, 0.4235294, 1,
-0.2036213, 0.9796687, 0.1804342, 0, 1, 0.4313726, 1,
-0.2008329, 0.2780997, 1.349803, 0, 1, 0.4352941, 1,
-0.200305, 0.3656891, 0.4437867, 0, 1, 0.4431373, 1,
-0.1977728, 1.065424, -2.603414, 0, 1, 0.4470588, 1,
-0.1955185, -0.5803778, -2.307578, 0, 1, 0.454902, 1,
-0.1954704, -1.04469, -3.149773, 0, 1, 0.4588235, 1,
-0.1937264, -0.2513722, -1.950933, 0, 1, 0.4666667, 1,
-0.1911349, 0.2344281, 0.1037323, 0, 1, 0.4705882, 1,
-0.1852525, 0.220559, 0.421966, 0, 1, 0.4784314, 1,
-0.1846233, 1.383374, -0.345025, 0, 1, 0.4823529, 1,
-0.1807454, -1.713846, -2.011912, 0, 1, 0.4901961, 1,
-0.1793686, -0.5898551, -1.423401, 0, 1, 0.4941176, 1,
-0.1767857, 0.3682577, -0.784207, 0, 1, 0.5019608, 1,
-0.1764977, 0.3180753, -0.09774245, 0, 1, 0.509804, 1,
-0.1737518, 0.5949895, 0.5939325, 0, 1, 0.5137255, 1,
-0.170239, 2.514093, -2.162522, 0, 1, 0.5215687, 1,
-0.1660277, -0.07716075, -1.645818, 0, 1, 0.5254902, 1,
-0.1642009, -0.3478244, -1.74545, 0, 1, 0.5333334, 1,
-0.1578574, 0.8571948, -0.3557837, 0, 1, 0.5372549, 1,
-0.1564129, 0.8002092, 0.9876794, 0, 1, 0.5450981, 1,
-0.1547242, -0.2444315, -3.014538, 0, 1, 0.5490196, 1,
-0.1537754, -0.0474151, -4.511434, 0, 1, 0.5568628, 1,
-0.1514609, -1.738334, -3.604542, 0, 1, 0.5607843, 1,
-0.1478097, 0.2980284, -0.2422982, 0, 1, 0.5686275, 1,
-0.1462925, -1.937161, -2.031399, 0, 1, 0.572549, 1,
-0.1449208, -0.8012522, -5.024958, 0, 1, 0.5803922, 1,
-0.14387, 0.07702258, -1.281716, 0, 1, 0.5843138, 1,
-0.1422262, 0.1002362, -1.081305, 0, 1, 0.5921569, 1,
-0.1418831, 0.8502559, -1.401624, 0, 1, 0.5960785, 1,
-0.1409424, -0.7303452, -3.672271, 0, 1, 0.6039216, 1,
-0.1385218, -0.159082, -1.704651, 0, 1, 0.6117647, 1,
-0.1383772, -1.392686, -2.767805, 0, 1, 0.6156863, 1,
-0.1336947, 1.55111, 0.4736172, 0, 1, 0.6235294, 1,
-0.1331192, -2.260981, -4.131999, 0, 1, 0.627451, 1,
-0.1325598, -0.297799, -2.512303, 0, 1, 0.6352941, 1,
-0.1206877, 1.208721, -1.556248, 0, 1, 0.6392157, 1,
-0.1206094, 0.3326053, -0.5292335, 0, 1, 0.6470588, 1,
-0.1189583, 0.1802287, -0.9731982, 0, 1, 0.6509804, 1,
-0.1171316, 0.1276499, -1.111821, 0, 1, 0.6588235, 1,
-0.1155742, -0.7452125, -1.799342, 0, 1, 0.6627451, 1,
-0.112901, -1.585141, -1.954491, 0, 1, 0.6705883, 1,
-0.1106554, -0.9311013, -3.166946, 0, 1, 0.6745098, 1,
-0.1050429, -1.418932, -5.286007, 0, 1, 0.682353, 1,
-0.1042189, 0.5708356, 0.05893942, 0, 1, 0.6862745, 1,
-0.1036625, 0.1510989, -0.2238761, 0, 1, 0.6941177, 1,
-0.1029652, 2.325861, 0.7181494, 0, 1, 0.7019608, 1,
-0.09827527, -0.04456418, -0.463629, 0, 1, 0.7058824, 1,
-0.09799239, 0.300288, -1.854746, 0, 1, 0.7137255, 1,
-0.09259957, -0.4600225, -1.822031, 0, 1, 0.7176471, 1,
-0.09255386, -1.987999, -4.629865, 0, 1, 0.7254902, 1,
-0.09023859, -0.6552961, -1.961321, 0, 1, 0.7294118, 1,
-0.08994371, -0.3642, -2.58499, 0, 1, 0.7372549, 1,
-0.0899384, -0.5582612, -2.457517, 0, 1, 0.7411765, 1,
-0.08718555, -2.337788, -3.34499, 0, 1, 0.7490196, 1,
-0.08148149, -0.04979915, -1.43997, 0, 1, 0.7529412, 1,
-0.08032709, 0.5739545, 1.453456, 0, 1, 0.7607843, 1,
-0.08005286, -0.2115919, -3.306466, 0, 1, 0.7647059, 1,
-0.07468965, -0.8798293, -4.09762, 0, 1, 0.772549, 1,
-0.07232177, 1.220224, -0.6324495, 0, 1, 0.7764706, 1,
-0.05846144, -0.3786829, -4.44609, 0, 1, 0.7843137, 1,
-0.05790608, -0.8141887, -3.728831, 0, 1, 0.7882353, 1,
-0.05695395, -0.4858949, -2.217142, 0, 1, 0.7960784, 1,
-0.05364279, 0.4631545, -0.7640952, 0, 1, 0.8039216, 1,
-0.05352313, -0.265484, -2.561705, 0, 1, 0.8078431, 1,
-0.05325537, 0.009073213, -1.432009, 0, 1, 0.8156863, 1,
-0.05230033, -1.446355, -1.934822, 0, 1, 0.8196079, 1,
-0.05121851, 0.08457056, -1.171358, 0, 1, 0.827451, 1,
-0.05036145, 0.5746796, -0.3040451, 0, 1, 0.8313726, 1,
-0.05017139, -0.4749135, -2.955503, 0, 1, 0.8392157, 1,
-0.04985055, 0.5852881, -0.6542712, 0, 1, 0.8431373, 1,
-0.04944965, 1.251369, -0.7680182, 0, 1, 0.8509804, 1,
-0.03903833, 0.5157817, 1.575581, 0, 1, 0.854902, 1,
-0.03853932, -1.224065, -2.855224, 0, 1, 0.8627451, 1,
-0.03445477, -2.006687, -3.926829, 0, 1, 0.8666667, 1,
-0.03238809, 0.7621566, 1.247136, 0, 1, 0.8745098, 1,
-0.02959834, -0.5214724, -2.769294, 0, 1, 0.8784314, 1,
-0.02521628, -0.1187141, -2.318286, 0, 1, 0.8862745, 1,
-0.01605773, 0.4912972, 0.2666217, 0, 1, 0.8901961, 1,
-0.01277235, -0.01163617, -2.000893, 0, 1, 0.8980392, 1,
-0.01156882, 0.7231654, 1.130671, 0, 1, 0.9058824, 1,
-0.009305265, -0.2765725, -2.596987, 0, 1, 0.9098039, 1,
-0.008851023, 0.785077, -0.4911155, 0, 1, 0.9176471, 1,
-0.002604665, -0.1971594, -2.765302, 0, 1, 0.9215686, 1,
-0.002591899, 0.1040643, -0.824044, 0, 1, 0.9294118, 1,
-0.001307786, -0.311871, -2.426426, 0, 1, 0.9333333, 1,
-0.001118633, 0.07289252, -0.09558444, 0, 1, 0.9411765, 1,
0.0004026626, -1.199327, 3.1901, 0, 1, 0.945098, 1,
0.0068827, -0.6029269, 3.615459, 0, 1, 0.9529412, 1,
0.01318499, -0.7571605, 5.467817, 0, 1, 0.9568627, 1,
0.01323508, 0.2775947, 0.7105529, 0, 1, 0.9647059, 1,
0.01376092, -1.114657, 1.659896, 0, 1, 0.9686275, 1,
0.01678066, 0.2969151, -1.347305, 0, 1, 0.9764706, 1,
0.0174302, -1.117501, 4.912086, 0, 1, 0.9803922, 1,
0.0186509, 1.029904, 0.5821673, 0, 1, 0.9882353, 1,
0.02022395, 0.0005111771, 2.044868, 0, 1, 0.9921569, 1,
0.02153257, 0.5430525, -1.647805, 0, 1, 1, 1,
0.02420556, 0.8294352, 1.379023, 0, 0.9921569, 1, 1,
0.024554, -0.4349189, 3.485158, 0, 0.9882353, 1, 1,
0.02479685, -0.03222331, 3.057983, 0, 0.9803922, 1, 1,
0.0345629, 0.9500924, 0.6203919, 0, 0.9764706, 1, 1,
0.03857813, -0.7102987, 4.056111, 0, 0.9686275, 1, 1,
0.0388642, -1.077921, 3.650343, 0, 0.9647059, 1, 1,
0.04131698, 1.152241, 0.03165253, 0, 0.9568627, 1, 1,
0.04290207, -0.3705112, 2.884305, 0, 0.9529412, 1, 1,
0.04478686, 1.209027, -0.2326142, 0, 0.945098, 1, 1,
0.04676491, -0.7010062, 3.733266, 0, 0.9411765, 1, 1,
0.04718042, 1.068584, -0.3254297, 0, 0.9333333, 1, 1,
0.04862069, 0.4414676, 0.3141393, 0, 0.9294118, 1, 1,
0.05529307, -0.3537839, 3.046997, 0, 0.9215686, 1, 1,
0.05793878, -0.3241875, 2.31307, 0, 0.9176471, 1, 1,
0.05918966, 0.6341245, 1.763944, 0, 0.9098039, 1, 1,
0.06211511, -2.471824, 2.607353, 0, 0.9058824, 1, 1,
0.0646396, 0.1269434, 0.574077, 0, 0.8980392, 1, 1,
0.07006089, 0.09023632, 0.6565578, 0, 0.8901961, 1, 1,
0.07951621, -1.316827, 4.357713, 0, 0.8862745, 1, 1,
0.08417517, 0.8962491, 0.5750121, 0, 0.8784314, 1, 1,
0.08438643, 0.8766007, 1.510095, 0, 0.8745098, 1, 1,
0.08973644, 0.2335031, 0.6892706, 0, 0.8666667, 1, 1,
0.09208357, -0.2471488, 2.779946, 0, 0.8627451, 1, 1,
0.1001329, 0.1210391, 1.566657, 0, 0.854902, 1, 1,
0.1134381, 0.4045305, -0.4443709, 0, 0.8509804, 1, 1,
0.1165513, -1.341825, 2.670573, 0, 0.8431373, 1, 1,
0.1179672, -1.654651, 2.948375, 0, 0.8392157, 1, 1,
0.1191573, 1.015426, 1.386017, 0, 0.8313726, 1, 1,
0.1219941, -2.258161, 4.463819, 0, 0.827451, 1, 1,
0.1264411, -0.9731004, 5.114771, 0, 0.8196079, 1, 1,
0.1285142, 0.639943, 0.08002681, 0, 0.8156863, 1, 1,
0.1322121, 1.228701, 2.184892, 0, 0.8078431, 1, 1,
0.1365555, -0.08680224, 2.936566, 0, 0.8039216, 1, 1,
0.1381108, -0.4202237, 4.153172, 0, 0.7960784, 1, 1,
0.1384593, 1.068393, 0.4382569, 0, 0.7882353, 1, 1,
0.1385112, 1.482775, 0.8980263, 0, 0.7843137, 1, 1,
0.1406612, -1.011783, 3.401737, 0, 0.7764706, 1, 1,
0.1431258, 0.06684083, 0.5429142, 0, 0.772549, 1, 1,
0.143461, -0.2883216, 1.517473, 0, 0.7647059, 1, 1,
0.1482646, 0.638297, -0.07961524, 0, 0.7607843, 1, 1,
0.1495086, 0.6496476, -0.07937842, 0, 0.7529412, 1, 1,
0.1609987, -0.2833316, 4.70347, 0, 0.7490196, 1, 1,
0.1636731, -1.264535, 2.327686, 0, 0.7411765, 1, 1,
0.1647948, 0.234649, 0.2995295, 0, 0.7372549, 1, 1,
0.1739166, -1.188304, 4.022559, 0, 0.7294118, 1, 1,
0.1744615, -1.27957, 2.149694, 0, 0.7254902, 1, 1,
0.1820864, 0.07672881, 1.561652, 0, 0.7176471, 1, 1,
0.183993, 0.5198716, -1.245996, 0, 0.7137255, 1, 1,
0.1861338, 1.198271, 0.7673647, 0, 0.7058824, 1, 1,
0.1869688, 0.7734482, -1.625843, 0, 0.6980392, 1, 1,
0.1887408, 1.28519, -1.881159, 0, 0.6941177, 1, 1,
0.1975859, 0.1956358, 0.6144407, 0, 0.6862745, 1, 1,
0.1977794, 0.4943988, 0.7781865, 0, 0.682353, 1, 1,
0.1981449, -0.5652317, 4.645479, 0, 0.6745098, 1, 1,
0.1984631, -0.2083923, 0.3041961, 0, 0.6705883, 1, 1,
0.1988068, 0.07178522, 1.127277, 0, 0.6627451, 1, 1,
0.2024633, -0.01654336, 1.516965, 0, 0.6588235, 1, 1,
0.2029959, 1.281565, 1.002664, 0, 0.6509804, 1, 1,
0.2055765, -1.06553, 2.485137, 0, 0.6470588, 1, 1,
0.2078777, -0.2827405, 1.317654, 0, 0.6392157, 1, 1,
0.2102666, -1.201225, 1.387486, 0, 0.6352941, 1, 1,
0.2129309, -0.8244887, 3.434829, 0, 0.627451, 1, 1,
0.2149646, -0.1682393, 3.261971, 0, 0.6235294, 1, 1,
0.2312428, -1.177028, 2.129982, 0, 0.6156863, 1, 1,
0.2331669, -2.093644, 3.084736, 0, 0.6117647, 1, 1,
0.2353066, -0.6020709, 1.328889, 0, 0.6039216, 1, 1,
0.2362012, 0.4189804, 1.653249, 0, 0.5960785, 1, 1,
0.23863, -0.2666287, 3.386192, 0, 0.5921569, 1, 1,
0.2418585, -0.8565733, 2.297013, 0, 0.5843138, 1, 1,
0.2437206, 0.5044082, 1.663972, 0, 0.5803922, 1, 1,
0.2458438, 0.9841697, 1.530342, 0, 0.572549, 1, 1,
0.2460024, 0.1378069, 0.096015, 0, 0.5686275, 1, 1,
0.2493387, -0.6865191, 3.330748, 0, 0.5607843, 1, 1,
0.2504093, 1.682123, -2.633002, 0, 0.5568628, 1, 1,
0.2507589, 0.6980084, 0.5843985, 0, 0.5490196, 1, 1,
0.2514065, -0.5988603, 4.419655, 0, 0.5450981, 1, 1,
0.2614408, 0.06079267, 1.44493, 0, 0.5372549, 1, 1,
0.2624907, -2.327264, 2.547582, 0, 0.5333334, 1, 1,
0.2647545, -0.3155901, 2.323942, 0, 0.5254902, 1, 1,
0.2654528, -0.2229003, 1.989031, 0, 0.5215687, 1, 1,
0.2664322, -1.265955, 2.868887, 0, 0.5137255, 1, 1,
0.2668014, 0.8282095, 1.801497, 0, 0.509804, 1, 1,
0.269216, -1.442316, 2.815565, 0, 0.5019608, 1, 1,
0.2698037, -0.8801003, 2.412116, 0, 0.4941176, 1, 1,
0.2799943, -0.5477061, 2.012122, 0, 0.4901961, 1, 1,
0.2858571, -0.8560535, 3.023228, 0, 0.4823529, 1, 1,
0.2872361, -0.5014164, 2.674149, 0, 0.4784314, 1, 1,
0.2879837, 1.387771, 0.6747876, 0, 0.4705882, 1, 1,
0.2900966, 0.6637958, 1.139192, 0, 0.4666667, 1, 1,
0.2916187, -0.1736997, 2.45983, 0, 0.4588235, 1, 1,
0.2920555, -0.7099084, 3.156376, 0, 0.454902, 1, 1,
0.2930407, 0.3197497, 0.3812806, 0, 0.4470588, 1, 1,
0.2966091, 1.051904, -0.2211, 0, 0.4431373, 1, 1,
0.2974901, 0.9037678, 0.8497143, 0, 0.4352941, 1, 1,
0.2990996, -0.2352076, 2.945723, 0, 0.4313726, 1, 1,
0.3000873, 0.65512, -1.014855, 0, 0.4235294, 1, 1,
0.300922, -0.6243382, 1.86188, 0, 0.4196078, 1, 1,
0.304373, 0.8378945, -0.01596375, 0, 0.4117647, 1, 1,
0.3116134, 0.05743842, 2.325064, 0, 0.4078431, 1, 1,
0.3148399, -0.01481078, 0.6664934, 0, 0.4, 1, 1,
0.3161859, -0.1125736, 1.779873, 0, 0.3921569, 1, 1,
0.3188608, -0.1423756, 1.026564, 0, 0.3882353, 1, 1,
0.3191026, -1.554817, 1.939553, 0, 0.3803922, 1, 1,
0.3232194, -0.6202294, 3.590576, 0, 0.3764706, 1, 1,
0.3286053, -0.6604846, 2.609172, 0, 0.3686275, 1, 1,
0.3361016, -0.1189988, 0.7302659, 0, 0.3647059, 1, 1,
0.336713, 0.5660585, 1.943921, 0, 0.3568628, 1, 1,
0.3401457, -0.7995556, 3.235835, 0, 0.3529412, 1, 1,
0.34224, 1.014361, -0.4718494, 0, 0.345098, 1, 1,
0.3431827, -0.7958388, 2.281894, 0, 0.3411765, 1, 1,
0.3573591, 0.2743718, 1.747383, 0, 0.3333333, 1, 1,
0.3638315, 0.4093955, -0.9436888, 0, 0.3294118, 1, 1,
0.3652377, -0.5802751, 3.332479, 0, 0.3215686, 1, 1,
0.3685072, 0.8015662, 1.999725, 0, 0.3176471, 1, 1,
0.3685139, 1.091993, -0.01428402, 0, 0.3098039, 1, 1,
0.3686955, 0.6873804, -0.122918, 0, 0.3058824, 1, 1,
0.3690548, -0.5976449, 3.751222, 0, 0.2980392, 1, 1,
0.3701078, -1.040331, 3.25966, 0, 0.2901961, 1, 1,
0.3710903, 1.065958, -0.06549895, 0, 0.2862745, 1, 1,
0.3713752, -0.1673299, 0.9648216, 0, 0.2784314, 1, 1,
0.3718569, 1.443245, 1.251626, 0, 0.2745098, 1, 1,
0.3758367, -0.9474251, 3.705444, 0, 0.2666667, 1, 1,
0.3788433, -1.314736, 3.099441, 0, 0.2627451, 1, 1,
0.3798466, 0.03561797, 3.109547, 0, 0.254902, 1, 1,
0.3800261, -0.5216038, 2.57155, 0, 0.2509804, 1, 1,
0.3809966, 0.6025104, 0.05053299, 0, 0.2431373, 1, 1,
0.3815772, -0.02391875, 0.4935073, 0, 0.2392157, 1, 1,
0.3836513, -1.63665, 3.606191, 0, 0.2313726, 1, 1,
0.3843789, -0.9433943, 2.735736, 0, 0.227451, 1, 1,
0.3906941, -1.366671, 1.645917, 0, 0.2196078, 1, 1,
0.3946926, 1.356289, 1.229589, 0, 0.2156863, 1, 1,
0.3962093, 0.01453628, 0.5409995, 0, 0.2078431, 1, 1,
0.4004741, 0.002468216, 1.885618, 0, 0.2039216, 1, 1,
0.4008905, -1.205825, 2.852367, 0, 0.1960784, 1, 1,
0.4027239, -0.2402388, 2.031593, 0, 0.1882353, 1, 1,
0.4030299, -0.5303348, 3.174457, 0, 0.1843137, 1, 1,
0.404824, 1.231321, 2.459867, 0, 0.1764706, 1, 1,
0.4051152, -1.189214, 3.188483, 0, 0.172549, 1, 1,
0.4090253, -1.584902, 2.820807, 0, 0.1647059, 1, 1,
0.4129055, 1.782462, 1.12162, 0, 0.1607843, 1, 1,
0.4132162, 0.4526763, 1.144157, 0, 0.1529412, 1, 1,
0.4135953, 1.521386, 1.153017, 0, 0.1490196, 1, 1,
0.4155436, -0.9385222, 2.540419, 0, 0.1411765, 1, 1,
0.423076, 1.796206, 1.040705, 0, 0.1372549, 1, 1,
0.4231494, -1.309476, 2.452326, 0, 0.1294118, 1, 1,
0.4255236, 0.2758112, 0.5518582, 0, 0.1254902, 1, 1,
0.4304438, 0.5093191, 1.399829, 0, 0.1176471, 1, 1,
0.4329319, 1.456289, -1.090847, 0, 0.1137255, 1, 1,
0.4411942, 1.55824, 0.01969365, 0, 0.1058824, 1, 1,
0.4418036, 1.018076, -0.646714, 0, 0.09803922, 1, 1,
0.4431381, -0.06602608, 1.812147, 0, 0.09411765, 1, 1,
0.4441569, 0.8890139, 1.862023, 0, 0.08627451, 1, 1,
0.4451416, -0.9464422, 3.255235, 0, 0.08235294, 1, 1,
0.4453807, -0.7327197, 3.081985, 0, 0.07450981, 1, 1,
0.4479803, -2.07721, 4.390119, 0, 0.07058824, 1, 1,
0.4481911, -1.293209, 3.720625, 0, 0.0627451, 1, 1,
0.4487826, -0.7056961, 3.565098, 0, 0.05882353, 1, 1,
0.4501906, 1.996034, 0.3795414, 0, 0.05098039, 1, 1,
0.4506357, -0.9152964, 2.777178, 0, 0.04705882, 1, 1,
0.4556812, -1.695053, 2.2176, 0, 0.03921569, 1, 1,
0.4572494, -0.2664637, 2.592136, 0, 0.03529412, 1, 1,
0.4684586, 0.7852622, 0.139029, 0, 0.02745098, 1, 1,
0.4695114, 0.9069275, 1.448978, 0, 0.02352941, 1, 1,
0.4704159, 0.8908048, 1.129263, 0, 0.01568628, 1, 1,
0.4704899, -0.8532099, 2.968658, 0, 0.01176471, 1, 1,
0.4852973, 0.08231922, -0.5779026, 0, 0.003921569, 1, 1,
0.4925805, 0.3062169, 1.621117, 0.003921569, 0, 1, 1,
0.4936045, 0.4176859, 1.515084, 0.007843138, 0, 1, 1,
0.4944586, 0.394055, 0.4902924, 0.01568628, 0, 1, 1,
0.4965036, -0.9760146, 2.609193, 0.01960784, 0, 1, 1,
0.4983367, 1.660465, -0.374033, 0.02745098, 0, 1, 1,
0.5097286, -1.41069, 0.8243079, 0.03137255, 0, 1, 1,
0.5101581, -1.504001, 3.76916, 0.03921569, 0, 1, 1,
0.510731, 0.3200679, 0.905784, 0.04313726, 0, 1, 1,
0.5107901, -2.347973, 2.599174, 0.05098039, 0, 1, 1,
0.5148762, 0.8923135, -1.873833, 0.05490196, 0, 1, 1,
0.5162932, -1.528804, 1.625476, 0.0627451, 0, 1, 1,
0.5163912, 0.1756596, 2.183611, 0.06666667, 0, 1, 1,
0.5198295, 1.955723, -1.813653, 0.07450981, 0, 1, 1,
0.5199485, -2.15043, 2.231651, 0.07843138, 0, 1, 1,
0.5229734, -1.115299, 2.301101, 0.08627451, 0, 1, 1,
0.5235987, -0.6319835, 3.451453, 0.09019608, 0, 1, 1,
0.5287089, 0.03448545, 2.11322, 0.09803922, 0, 1, 1,
0.5289163, -0.5051569, 0.7811437, 0.1058824, 0, 1, 1,
0.5433465, -0.01618579, -1.191856, 0.1098039, 0, 1, 1,
0.5440169, 1.265928, 0.6808093, 0.1176471, 0, 1, 1,
0.5486571, 0.2596026, -0.1970022, 0.1215686, 0, 1, 1,
0.5534793, -1.176861, 4.578668, 0.1294118, 0, 1, 1,
0.5537634, -1.03078, 1.741505, 0.1333333, 0, 1, 1,
0.5540779, 0.3360309, 1.191051, 0.1411765, 0, 1, 1,
0.5551406, -0.06287752, 0.8451633, 0.145098, 0, 1, 1,
0.5617948, 1.029388, 1.24587, 0.1529412, 0, 1, 1,
0.5642787, -0.494198, 1.078293, 0.1568628, 0, 1, 1,
0.5645152, -1.215486, 0.8842183, 0.1647059, 0, 1, 1,
0.5646646, 0.3845216, 0.250331, 0.1686275, 0, 1, 1,
0.5668778, -0.3069166, 1.181485, 0.1764706, 0, 1, 1,
0.5684946, -0.5557096, 2.941783, 0.1803922, 0, 1, 1,
0.57363, 0.7230353, 0.1575076, 0.1882353, 0, 1, 1,
0.5763944, 0.930961, 0.7947785, 0.1921569, 0, 1, 1,
0.5772621, -0.5461717, 1.969398, 0.2, 0, 1, 1,
0.5786359, -0.05340149, 1.112329, 0.2078431, 0, 1, 1,
0.5802514, -0.5940345, 3.638166, 0.2117647, 0, 1, 1,
0.5818498, -0.2597712, 2.549167, 0.2196078, 0, 1, 1,
0.5844218, -0.5073508, 2.29144, 0.2235294, 0, 1, 1,
0.5868756, 0.5018331, 0.9735041, 0.2313726, 0, 1, 1,
0.5872586, -1.712534, 1.839467, 0.2352941, 0, 1, 1,
0.5892889, 0.2853692, -0.05919941, 0.2431373, 0, 1, 1,
0.590726, 1.329083, 1.150865, 0.2470588, 0, 1, 1,
0.5953769, 0.09147564, 1.264307, 0.254902, 0, 1, 1,
0.5961656, 0.2091256, 0.341003, 0.2588235, 0, 1, 1,
0.5975351, -0.3215509, 2.194257, 0.2666667, 0, 1, 1,
0.5986958, 0.5596288, 0.3764724, 0.2705882, 0, 1, 1,
0.6021858, -0.2745427, 0.2939121, 0.2784314, 0, 1, 1,
0.603704, 0.6422002, 0.4300295, 0.282353, 0, 1, 1,
0.6044359, 0.4370396, 0.173965, 0.2901961, 0, 1, 1,
0.6055791, -0.6892213, 2.253261, 0.2941177, 0, 1, 1,
0.6146523, -0.08939938, 1.709497, 0.3019608, 0, 1, 1,
0.6185766, -0.659288, 1.327355, 0.3098039, 0, 1, 1,
0.6211888, 1.106789, -1.532607, 0.3137255, 0, 1, 1,
0.6239873, 0.1614974, 0.003922622, 0.3215686, 0, 1, 1,
0.6282623, -0.6273155, 3.914992, 0.3254902, 0, 1, 1,
0.6291687, -1.091108, 4.164146, 0.3333333, 0, 1, 1,
0.6329664, 1.443255, 0.7568442, 0.3372549, 0, 1, 1,
0.6333458, 0.01292573, 0.910809, 0.345098, 0, 1, 1,
0.6423634, -0.7101873, 2.93569, 0.3490196, 0, 1, 1,
0.6489896, 0.5135658, 2.594938, 0.3568628, 0, 1, 1,
0.6546331, 0.3520801, 0.6864091, 0.3607843, 0, 1, 1,
0.6579216, -0.336317, 0.8660396, 0.3686275, 0, 1, 1,
0.6589271, 0.4734068, 0.8844164, 0.372549, 0, 1, 1,
0.6640602, -0.002800796, 2.269025, 0.3803922, 0, 1, 1,
0.6668602, 1.197589, -0.919488, 0.3843137, 0, 1, 1,
0.6674923, -0.2238059, 0.1686332, 0.3921569, 0, 1, 1,
0.6676678, -2.484707, 3.000601, 0.3960784, 0, 1, 1,
0.6713336, 0.1423039, -0.1118667, 0.4039216, 0, 1, 1,
0.6722822, 1.709799, 1.454585, 0.4117647, 0, 1, 1,
0.673468, -0.1287044, 1.105226, 0.4156863, 0, 1, 1,
0.6752538, -0.006456153, 0.892815, 0.4235294, 0, 1, 1,
0.677313, -1.918412, 0.9002782, 0.427451, 0, 1, 1,
0.6787972, 1.754556, -0.3978458, 0.4352941, 0, 1, 1,
0.6812969, 1.794679, -0.6247713, 0.4392157, 0, 1, 1,
0.682135, -0.03595181, 4.277612, 0.4470588, 0, 1, 1,
0.6827537, 0.5154464, 0.7408037, 0.4509804, 0, 1, 1,
0.6843237, 0.3557639, 0.4494399, 0.4588235, 0, 1, 1,
0.6868742, 2.329358, -0.6673688, 0.4627451, 0, 1, 1,
0.6886725, 0.9732339, -0.05579755, 0.4705882, 0, 1, 1,
0.6888102, 0.5811504, -1.260929, 0.4745098, 0, 1, 1,
0.6959654, -1.769782, 1.579496, 0.4823529, 0, 1, 1,
0.6975838, 0.2670277, 0.1234866, 0.4862745, 0, 1, 1,
0.69885, -0.8412892, 2.425661, 0.4941176, 0, 1, 1,
0.700764, -0.4797438, 2.516714, 0.5019608, 0, 1, 1,
0.7052521, 1.332315, -1.618348, 0.5058824, 0, 1, 1,
0.7075988, 0.9462989, -1.197543, 0.5137255, 0, 1, 1,
0.7115351, 0.2575231, 0.3010443, 0.5176471, 0, 1, 1,
0.7141885, 0.5266536, 0.2680199, 0.5254902, 0, 1, 1,
0.7167962, -0.4448446, 1.055555, 0.5294118, 0, 1, 1,
0.7177151, 1.636449, 1.685815, 0.5372549, 0, 1, 1,
0.720286, -0.5438646, 1.001411, 0.5411765, 0, 1, 1,
0.7234029, 1.895823, 0.9821459, 0.5490196, 0, 1, 1,
0.7253379, 1.348379, 0.2897402, 0.5529412, 0, 1, 1,
0.729551, 0.05152634, 2.093439, 0.5607843, 0, 1, 1,
0.7443389, 0.2692681, 0.9286491, 0.5647059, 0, 1, 1,
0.7460858, -0.02193843, 0.5343905, 0.572549, 0, 1, 1,
0.7465712, -0.1122576, 1.233967, 0.5764706, 0, 1, 1,
0.7492502, 1.488763, 1.206534, 0.5843138, 0, 1, 1,
0.7493281, 0.523891, -1.220142, 0.5882353, 0, 1, 1,
0.7494707, 0.8770754, 1.004194, 0.5960785, 0, 1, 1,
0.7505985, 0.04797247, 0.2331361, 0.6039216, 0, 1, 1,
0.7506256, -0.6537683, 3.527341, 0.6078432, 0, 1, 1,
0.7516114, 1.616604, 0.5869102, 0.6156863, 0, 1, 1,
0.7538148, 0.821036, 0.2304181, 0.6196079, 0, 1, 1,
0.7552865, -1.21697, 1.269812, 0.627451, 0, 1, 1,
0.7562208, 0.5943106, 1.495978, 0.6313726, 0, 1, 1,
0.7571867, 1.057613, -1.07238, 0.6392157, 0, 1, 1,
0.7591661, 1.007484, 1.119886, 0.6431373, 0, 1, 1,
0.7607798, -3.003081, 2.299847, 0.6509804, 0, 1, 1,
0.7678089, 0.1529761, 0.3962635, 0.654902, 0, 1, 1,
0.7767664, 0.5446712, 1.434262, 0.6627451, 0, 1, 1,
0.7792304, 0.2701759, 1.724412, 0.6666667, 0, 1, 1,
0.7914827, -1.12389, 2.647518, 0.6745098, 0, 1, 1,
0.7916935, -0.3228003, 1.939358, 0.6784314, 0, 1, 1,
0.7918344, 0.1848744, 2.213768, 0.6862745, 0, 1, 1,
0.7938979, -0.5921084, 2.640775, 0.6901961, 0, 1, 1,
0.7963095, 0.5950476, 0.7781881, 0.6980392, 0, 1, 1,
0.8030961, 1.096135, -1.723527, 0.7058824, 0, 1, 1,
0.8043277, 0.8634117, 0.8261024, 0.7098039, 0, 1, 1,
0.8066168, 2.387279, 0.7848893, 0.7176471, 0, 1, 1,
0.8067227, 0.4984246, 1.537955, 0.7215686, 0, 1, 1,
0.8121888, 1.114186, -0.005875567, 0.7294118, 0, 1, 1,
0.819205, 0.5979897, 1.325391, 0.7333333, 0, 1, 1,
0.8249294, 2.062416, 0.4205285, 0.7411765, 0, 1, 1,
0.8311803, -0.424771, 1.402948, 0.7450981, 0, 1, 1,
0.8335343, -0.9118452, 3.24534, 0.7529412, 0, 1, 1,
0.8357111, -0.6762313, 2.210964, 0.7568628, 0, 1, 1,
0.8433858, 0.6618775, -0.3888534, 0.7647059, 0, 1, 1,
0.8434803, 1.151393, 0.9693242, 0.7686275, 0, 1, 1,
0.8548205, -0.6477154, 2.435493, 0.7764706, 0, 1, 1,
0.8581793, 0.2628829, 3.000682, 0.7803922, 0, 1, 1,
0.8610802, 1.069935, 0.5061945, 0.7882353, 0, 1, 1,
0.8626651, 0.4703533, 0.5585162, 0.7921569, 0, 1, 1,
0.8638977, -0.4902976, 1.850652, 0.8, 0, 1, 1,
0.8648182, -0.3967794, 2.400424, 0.8078431, 0, 1, 1,
0.8670691, -0.1154319, 1.839929, 0.8117647, 0, 1, 1,
0.872216, -1.314133, -1.235757, 0.8196079, 0, 1, 1,
0.8735484, -1.656152, 2.753224, 0.8235294, 0, 1, 1,
0.876089, -0.7038411, 1.623655, 0.8313726, 0, 1, 1,
0.8787169, -0.9401988, 3.020831, 0.8352941, 0, 1, 1,
0.8812249, -0.7945564, 2.498864, 0.8431373, 0, 1, 1,
0.8846295, 1.439092, 0.8688592, 0.8470588, 0, 1, 1,
0.8870916, 0.3608462, -0.004266296, 0.854902, 0, 1, 1,
0.8873385, 0.1375647, 1.769452, 0.8588235, 0, 1, 1,
0.8899424, -1.3194, 2.205612, 0.8666667, 0, 1, 1,
0.8910545, -0.5496893, 2.591988, 0.8705882, 0, 1, 1,
0.8917233, 1.155258, 0.5786834, 0.8784314, 0, 1, 1,
0.8918778, 0.05479379, 1.055286, 0.8823529, 0, 1, 1,
0.9060666, 0.7320642, 0.7625102, 0.8901961, 0, 1, 1,
0.9190625, -0.6262437, 2.544506, 0.8941177, 0, 1, 1,
0.9200698, -0.922529, 1.14185, 0.9019608, 0, 1, 1,
0.9269651, 1.513628, -1.016175, 0.9098039, 0, 1, 1,
0.9337099, -0.2248672, 1.324862, 0.9137255, 0, 1, 1,
0.9345003, -0.1853328, 2.164715, 0.9215686, 0, 1, 1,
0.9385819, 0.09566626, 0.5647473, 0.9254902, 0, 1, 1,
0.9401696, -2.362611, 2.73807, 0.9333333, 0, 1, 1,
0.9428497, -0.4547336, 3.033652, 0.9372549, 0, 1, 1,
0.9503804, 0.8608857, 2.652048, 0.945098, 0, 1, 1,
0.9633643, -0.612919, 0.4850157, 0.9490196, 0, 1, 1,
0.9684978, 0.7006574, 0.8857654, 0.9568627, 0, 1, 1,
0.9719816, 0.5274683, 0.7985536, 0.9607843, 0, 1, 1,
0.9739001, -0.504674, 0.4229017, 0.9686275, 0, 1, 1,
0.9785314, -0.9180231, 3.120404, 0.972549, 0, 1, 1,
0.9786264, -0.5496962, 1.760116, 0.9803922, 0, 1, 1,
0.9846241, 1.018571, 1.653788, 0.9843137, 0, 1, 1,
0.9891947, 0.91359, 1.153642, 0.9921569, 0, 1, 1,
0.9909286, -1.28019, 0.6776212, 0.9960784, 0, 1, 1,
0.9923829, 1.086252, 0.5586243, 1, 0, 0.9960784, 1,
0.9930432, -0.4679733, 1.826603, 1, 0, 0.9882353, 1,
1.001697, -0.1222339, 1.105209, 1, 0, 0.9843137, 1,
1.004764, 0.3666201, -1.220983, 1, 0, 0.9764706, 1,
1.006821, 1.34616, 0.6415161, 1, 0, 0.972549, 1,
1.007037, -1.011352, 2.783028, 1, 0, 0.9647059, 1,
1.012167, -0.4497542, 3.262717, 1, 0, 0.9607843, 1,
1.017137, -0.1782165, 0.5304917, 1, 0, 0.9529412, 1,
1.017536, 1.247008, -1.15925, 1, 0, 0.9490196, 1,
1.023561, 1.211937, -0.1850988, 1, 0, 0.9411765, 1,
1.023586, -1.146583, 2.53655, 1, 0, 0.9372549, 1,
1.023696, -0.751877, 2.556913, 1, 0, 0.9294118, 1,
1.028211, 2.215168, 0.9913616, 1, 0, 0.9254902, 1,
1.029144, -1.964567, 2.474548, 1, 0, 0.9176471, 1,
1.037922, 1.022996, 1.59294, 1, 0, 0.9137255, 1,
1.039284, -0.7023312, 1.956638, 1, 0, 0.9058824, 1,
1.040654, -1.400309, 1.888945, 1, 0, 0.9019608, 1,
1.043947, 1.421848, -0.647008, 1, 0, 0.8941177, 1,
1.04511, -0.524105, 1.622816, 1, 0, 0.8862745, 1,
1.049008, 1.771436, -0.9500104, 1, 0, 0.8823529, 1,
1.050644, 1.581285, 0.6374779, 1, 0, 0.8745098, 1,
1.053426, 0.9874677, 0.05389907, 1, 0, 0.8705882, 1,
1.054337, -0.14844, 2.696534, 1, 0, 0.8627451, 1,
1.063277, 0.6758855, 2.456543, 1, 0, 0.8588235, 1,
1.073176, 0.7121176, 1.162752, 1, 0, 0.8509804, 1,
1.075244, 2.158633, 1.053466, 1, 0, 0.8470588, 1,
1.083109, -0.6594106, 1.885399, 1, 0, 0.8392157, 1,
1.093974, -1.083501, 3.130478, 1, 0, 0.8352941, 1,
1.094011, 0.1548173, 1.539747, 1, 0, 0.827451, 1,
1.097324, -0.2199924, 1.528511, 1, 0, 0.8235294, 1,
1.107384, -0.845696, 3.027843, 1, 0, 0.8156863, 1,
1.152043, 0.4256896, 1.279191, 1, 0, 0.8117647, 1,
1.154909, 2.063479, 2.591821, 1, 0, 0.8039216, 1,
1.158463, 0.3652031, 0.6110823, 1, 0, 0.7960784, 1,
1.167119, 0.2999808, 1.880647, 1, 0, 0.7921569, 1,
1.168287, -0.2501732, 3.216156, 1, 0, 0.7843137, 1,
1.176679, 1.081789, 0.3980328, 1, 0, 0.7803922, 1,
1.185792, 1.446767, 1.291841, 1, 0, 0.772549, 1,
1.191846, 0.5207509, 1.308633, 1, 0, 0.7686275, 1,
1.19801, -1.767885, 1.614267, 1, 0, 0.7607843, 1,
1.199117, 1.874008, 1.878902, 1, 0, 0.7568628, 1,
1.204115, 1.658214, 0.6928441, 1, 0, 0.7490196, 1,
1.217315, -1.302554, 4.982235, 1, 0, 0.7450981, 1,
1.218496, -0.5711247, 2.390538, 1, 0, 0.7372549, 1,
1.220684, -1.795467, 1.79645, 1, 0, 0.7333333, 1,
1.223089, 1.000237, -1.169434, 1, 0, 0.7254902, 1,
1.22714, -0.7411521, 1.774706, 1, 0, 0.7215686, 1,
1.229521, 0.5759752, 1.956321, 1, 0, 0.7137255, 1,
1.233932, -0.05369696, 1.268293, 1, 0, 0.7098039, 1,
1.235753, 1.42424, 1.334799, 1, 0, 0.7019608, 1,
1.23954, 0.4010416, 2.287009, 1, 0, 0.6941177, 1,
1.255593, 0.09633075, 3.927393, 1, 0, 0.6901961, 1,
1.259415, -0.7528915, 0.9506893, 1, 0, 0.682353, 1,
1.261095, 0.2755693, 3.349093, 1, 0, 0.6784314, 1,
1.263935, -3.235751, 3.895596, 1, 0, 0.6705883, 1,
1.268622, 0.645612, 1.350923, 1, 0, 0.6666667, 1,
1.271227, 0.1028322, 1.083607, 1, 0, 0.6588235, 1,
1.27447, 0.6034501, 2.324877, 1, 0, 0.654902, 1,
1.277441, -1.502276, 3.282074, 1, 0, 0.6470588, 1,
1.285616, -0.3940188, 0.5899751, 1, 0, 0.6431373, 1,
1.298821, 0.8624524, 1.385237, 1, 0, 0.6352941, 1,
1.303112, 0.2141055, 1.72905, 1, 0, 0.6313726, 1,
1.303947, -1.42708, 1.926943, 1, 0, 0.6235294, 1,
1.312492, -0.2506137, 3.55198, 1, 0, 0.6196079, 1,
1.317431, -0.1595501, 1.499782, 1, 0, 0.6117647, 1,
1.321242, 0.9133815, 0.6479741, 1, 0, 0.6078432, 1,
1.32453, 0.7902489, 0.4819073, 1, 0, 0.6, 1,
1.346403, -0.2573432, 0.6488261, 1, 0, 0.5921569, 1,
1.356085, 1.309487, 0.8944139, 1, 0, 0.5882353, 1,
1.357085, -0.6263521, 1.149988, 1, 0, 0.5803922, 1,
1.357845, -0.3551026, 2.868993, 1, 0, 0.5764706, 1,
1.361473, 0.4062743, 0.8351973, 1, 0, 0.5686275, 1,
1.365126, -1.048184, 3.241797, 1, 0, 0.5647059, 1,
1.370839, -1.107285, 1.631017, 1, 0, 0.5568628, 1,
1.38075, -0.3452435, 1.007904, 1, 0, 0.5529412, 1,
1.394698, -3.3162, 2.600317, 1, 0, 0.5450981, 1,
1.412427, 0.2251894, 0.04544719, 1, 0, 0.5411765, 1,
1.424031, 1.437325, 0.006726804, 1, 0, 0.5333334, 1,
1.433486, -0.1661841, 0.5403626, 1, 0, 0.5294118, 1,
1.456795, 0.8795723, 1.384793, 1, 0, 0.5215687, 1,
1.458543, -0.9385329, 0.4441943, 1, 0, 0.5176471, 1,
1.460853, -0.1665055, 2.057017, 1, 0, 0.509804, 1,
1.460947, -0.4313838, 1.40728, 1, 0, 0.5058824, 1,
1.463541, 0.4028157, 3.454391, 1, 0, 0.4980392, 1,
1.465323, -1.263451, 3.61924, 1, 0, 0.4901961, 1,
1.466738, 0.8624834, 1.322682, 1, 0, 0.4862745, 1,
1.469626, 1.654818, 0.9916226, 1, 0, 0.4784314, 1,
1.47542, 0.923773, 0.333513, 1, 0, 0.4745098, 1,
1.476655, -1.321195, 3.046455, 1, 0, 0.4666667, 1,
1.482336, 0.4573951, 2.18712, 1, 0, 0.4627451, 1,
1.486432, -0.3356699, 1.733577, 1, 0, 0.454902, 1,
1.488289, 0.2071036, 0.4445925, 1, 0, 0.4509804, 1,
1.493054, 0.5530779, 0.4980509, 1, 0, 0.4431373, 1,
1.496136, -0.6738183, 1.107265, 1, 0, 0.4392157, 1,
1.515845, 0.5118413, 0.3862439, 1, 0, 0.4313726, 1,
1.518663, -0.2276186, 3.615244, 1, 0, 0.427451, 1,
1.521258, -0.524248, 2.175427, 1, 0, 0.4196078, 1,
1.527725, 2.151327, 1.862506, 1, 0, 0.4156863, 1,
1.528334, 0.2464426, 0.8910457, 1, 0, 0.4078431, 1,
1.534299, 0.5098321, 0.3993966, 1, 0, 0.4039216, 1,
1.549606, -0.5911536, 2.042424, 1, 0, 0.3960784, 1,
1.585383, 0.9099463, 1.151532, 1, 0, 0.3882353, 1,
1.586152, -0.2689359, 2.088258, 1, 0, 0.3843137, 1,
1.588908, 1.53352, 0.131226, 1, 0, 0.3764706, 1,
1.598024, 0.1884153, 1.635331, 1, 0, 0.372549, 1,
1.598286, -1.151218, 2.437931, 1, 0, 0.3647059, 1,
1.599138, -0.306913, 2.064589, 1, 0, 0.3607843, 1,
1.600327, -0.8447908, 1.426203, 1, 0, 0.3529412, 1,
1.602741, 0.6690276, 1.163503, 1, 0, 0.3490196, 1,
1.604377, -1.835441, 3.248337, 1, 0, 0.3411765, 1,
1.607865, -1.158193, 1.024265, 1, 0, 0.3372549, 1,
1.608742, -0.3027586, 0.8685735, 1, 0, 0.3294118, 1,
1.611228, -0.5030367, 0.5029801, 1, 0, 0.3254902, 1,
1.616935, -0.1669127, 2.229791, 1, 0, 0.3176471, 1,
1.645625, -0.2859168, 1.564985, 1, 0, 0.3137255, 1,
1.671957, -0.01578248, -0.5348631, 1, 0, 0.3058824, 1,
1.679428, 0.9093419, 0.3656811, 1, 0, 0.2980392, 1,
1.680401, 1.179051, 2.565066, 1, 0, 0.2941177, 1,
1.692209, 0.1059291, 1.45931, 1, 0, 0.2862745, 1,
1.693787, 1.277437, 2.591193, 1, 0, 0.282353, 1,
1.694691, 0.7041339, 0.7409921, 1, 0, 0.2745098, 1,
1.695656, -2.019192, 3.561582, 1, 0, 0.2705882, 1,
1.714178, 0.1318975, 1.664738, 1, 0, 0.2627451, 1,
1.719116, 0.5635059, -0.1963784, 1, 0, 0.2588235, 1,
1.720292, 0.04785154, 0.3647535, 1, 0, 0.2509804, 1,
1.726912, -0.15134, 1.464355, 1, 0, 0.2470588, 1,
1.760875, -0.6450005, 1.250009, 1, 0, 0.2392157, 1,
1.77032, 1.752648, 0.07580053, 1, 0, 0.2352941, 1,
1.773619, 1.065344, 0.9817338, 1, 0, 0.227451, 1,
1.797136, 0.5244874, 0.7999454, 1, 0, 0.2235294, 1,
1.811629, 1.292448, 2.145531, 1, 0, 0.2156863, 1,
1.82444, -1.853339, 0.9170815, 1, 0, 0.2117647, 1,
1.832477, 1.044101, 1.690756, 1, 0, 0.2039216, 1,
1.839915, 0.6280004, 0.8998336, 1, 0, 0.1960784, 1,
1.86436, -0.6368191, 3.257972, 1, 0, 0.1921569, 1,
1.8957, -0.3535419, 0.2586761, 1, 0, 0.1843137, 1,
1.898594, 1.643826, -0.2151576, 1, 0, 0.1803922, 1,
1.910004, 0.1811234, -0.5467445, 1, 0, 0.172549, 1,
1.928724, -0.4691152, 1.342825, 1, 0, 0.1686275, 1,
1.961216, 0.3857653, -0.9327064, 1, 0, 0.1607843, 1,
1.962383, 0.391693, 1.206761, 1, 0, 0.1568628, 1,
1.967126, -0.7533146, 1.42785, 1, 0, 0.1490196, 1,
1.981923, -0.7268168, 2.136118, 1, 0, 0.145098, 1,
2.008121, -0.5426829, 1.871973, 1, 0, 0.1372549, 1,
2.020217, 0.6570516, 2.393021, 1, 0, 0.1333333, 1,
2.054318, -1.514502, 2.612869, 1, 0, 0.1254902, 1,
2.072177, 1.14485, 0.642234, 1, 0, 0.1215686, 1,
2.07527, -0.7470431, 1.334018, 1, 0, 0.1137255, 1,
2.135303, 1.597309, 1.609391, 1, 0, 0.1098039, 1,
2.137424, -1.614442, 2.488553, 1, 0, 0.1019608, 1,
2.138872, 0.7051505, 2.538479, 1, 0, 0.09411765, 1,
2.220148, 0.3732945, 1.624623, 1, 0, 0.09019608, 1,
2.250322, 0.733825, 3.544952, 1, 0, 0.08235294, 1,
2.251639, 1.238817, 1.067668, 1, 0, 0.07843138, 1,
2.264921, 0.3625416, 0.1117121, 1, 0, 0.07058824, 1,
2.26761, 1.039978, 0.3319856, 1, 0, 0.06666667, 1,
2.304199, -0.6173937, 2.662983, 1, 0, 0.05882353, 1,
2.342562, -0.8778869, 1.372428, 1, 0, 0.05490196, 1,
2.44933, -0.4005337, 0.6116158, 1, 0, 0.04705882, 1,
2.464179, -0.8281986, 2.944238, 1, 0, 0.04313726, 1,
2.594151, -2.021839, 3.128775, 1, 0, 0.03529412, 1,
2.63355, -0.9298909, 2.482279, 1, 0, 0.03137255, 1,
2.959424, 0.6007352, 1.548873, 1, 0, 0.02352941, 1,
2.975457, -0.9068898, 3.123447, 1, 0, 0.01960784, 1,
3.330172, -0.2163562, -0.5964656, 1, 0, 0.01176471, 1,
3.48024, 0.7049913, 1.163463, 1, 0, 0.007843138, 1
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
0.262121, -4.405437, -7.10878, 0, -0.5, 0.5, 0.5,
0.262121, -4.405437, -7.10878, 1, -0.5, 0.5, 0.5,
0.262121, -4.405437, -7.10878, 1, 1.5, 0.5, 0.5,
0.262121, -4.405437, -7.10878, 0, 1.5, 0.5, 0.5
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
-4.046941, -0.1031116, -7.10878, 0, -0.5, 0.5, 0.5,
-4.046941, -0.1031116, -7.10878, 1, -0.5, 0.5, 0.5,
-4.046941, -0.1031116, -7.10878, 1, 1.5, 0.5, 0.5,
-4.046941, -0.1031116, -7.10878, 0, 1.5, 0.5, 0.5
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
-4.046941, -4.405437, 0.09090519, 0, -0.5, 0.5, 0.5,
-4.046941, -4.405437, 0.09090519, 1, -0.5, 0.5, 0.5,
-4.046941, -4.405437, 0.09090519, 1, 1.5, 0.5, 0.5,
-4.046941, -4.405437, 0.09090519, 0, 1.5, 0.5, 0.5
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
-2, -3.412592, -5.447314,
3, -3.412592, -5.447314,
-2, -3.412592, -5.447314,
-2, -3.578066, -5.724225,
-1, -3.412592, -5.447314,
-1, -3.578066, -5.724225,
0, -3.412592, -5.447314,
0, -3.578066, -5.724225,
1, -3.412592, -5.447314,
1, -3.578066, -5.724225,
2, -3.412592, -5.447314,
2, -3.578066, -5.724225,
3, -3.412592, -5.447314,
3, -3.578066, -5.724225
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
-2, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
-2, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
-2, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
-2, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5,
-1, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
-1, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
-1, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
-1, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5,
0, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
0, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
0, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
0, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5,
1, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
1, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
1, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
1, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5,
2, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
2, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
2, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
2, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5,
3, -3.909014, -6.278047, 0, -0.5, 0.5, 0.5,
3, -3.909014, -6.278047, 1, -0.5, 0.5, 0.5,
3, -3.909014, -6.278047, 1, 1.5, 0.5, 0.5,
3, -3.909014, -6.278047, 0, 1.5, 0.5, 0.5
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
-3.052542, -3, -5.447314,
-3.052542, 3, -5.447314,
-3.052542, -3, -5.447314,
-3.218275, -3, -5.724225,
-3.052542, -2, -5.447314,
-3.218275, -2, -5.724225,
-3.052542, -1, -5.447314,
-3.218275, -1, -5.724225,
-3.052542, 0, -5.447314,
-3.218275, 0, -5.724225,
-3.052542, 1, -5.447314,
-3.218275, 1, -5.724225,
-3.052542, 2, -5.447314,
-3.218275, 2, -5.724225,
-3.052542, 3, -5.447314,
-3.218275, 3, -5.724225
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
-3.549741, -3, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, -3, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, -3, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, -3, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, -2, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, -2, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, -2, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, -2, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, -1, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, -1, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, -1, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, -1, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, 0, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, 0, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, 0, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, 0, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, 1, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, 1, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, 1, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, 1, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, 2, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, 2, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, 2, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, 2, -6.278047, 0, 1.5, 0.5, 0.5,
-3.549741, 3, -6.278047, 0, -0.5, 0.5, 0.5,
-3.549741, 3, -6.278047, 1, -0.5, 0.5, 0.5,
-3.549741, 3, -6.278047, 1, 1.5, 0.5, 0.5,
-3.549741, 3, -6.278047, 0, 1.5, 0.5, 0.5
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
-3.052542, -3.412592, -4,
-3.052542, -3.412592, 4,
-3.052542, -3.412592, -4,
-3.218275, -3.578066, -4,
-3.052542, -3.412592, -2,
-3.218275, -3.578066, -2,
-3.052542, -3.412592, 0,
-3.218275, -3.578066, 0,
-3.052542, -3.412592, 2,
-3.218275, -3.578066, 2,
-3.052542, -3.412592, 4,
-3.218275, -3.578066, 4
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
-3.549741, -3.909014, -4, 0, -0.5, 0.5, 0.5,
-3.549741, -3.909014, -4, 1, -0.5, 0.5, 0.5,
-3.549741, -3.909014, -4, 1, 1.5, 0.5, 0.5,
-3.549741, -3.909014, -4, 0, 1.5, 0.5, 0.5,
-3.549741, -3.909014, -2, 0, -0.5, 0.5, 0.5,
-3.549741, -3.909014, -2, 1, -0.5, 0.5, 0.5,
-3.549741, -3.909014, -2, 1, 1.5, 0.5, 0.5,
-3.549741, -3.909014, -2, 0, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 0, 0, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 0, 1, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 0, 1, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 0, 0, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 2, 0, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 2, 1, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 2, 1, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 2, 0, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 4, 0, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 4, 1, -0.5, 0.5, 0.5,
-3.549741, -3.909014, 4, 1, 1.5, 0.5, 0.5,
-3.549741, -3.909014, 4, 0, 1.5, 0.5, 0.5
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
-3.052542, -3.412592, -5.447314,
-3.052542, 3.206369, -5.447314,
-3.052542, -3.412592, 5.629125,
-3.052542, 3.206369, 5.629125,
-3.052542, -3.412592, -5.447314,
-3.052542, -3.412592, 5.629125,
-3.052542, 3.206369, -5.447314,
-3.052542, 3.206369, 5.629125,
-3.052542, -3.412592, -5.447314,
3.576784, -3.412592, -5.447314,
-3.052542, -3.412592, 5.629125,
3.576784, -3.412592, 5.629125,
-3.052542, 3.206369, -5.447314,
3.576784, 3.206369, -5.447314,
-3.052542, 3.206369, 5.629125,
3.576784, 3.206369, 5.629125,
3.576784, -3.412592, -5.447314,
3.576784, 3.206369, -5.447314,
3.576784, -3.412592, 5.629125,
3.576784, 3.206369, 5.629125,
3.576784, -3.412592, -5.447314,
3.576784, -3.412592, 5.629125,
3.576784, 3.206369, -5.447314,
3.576784, 3.206369, 5.629125
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
var radius = 7.746329;
var distance = 34.46429;
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
mvMatrix.translate( -0.262121, 0.1031116, -0.09090519 );
mvMatrix.scale( 1.263399, 1.265377, 0.756153 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.46429);
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
3-methoxy-2-methylbe<-read.table("3-methoxy-2-methylbe.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-methoxy-2-methylbe$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoxy' not found
```

```r
y<-3-methoxy-2-methylbe$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoxy' not found
```

```r
z<-3-methoxy-2-methylbe$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoxy' not found
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
-2.955998, -1.97593, -2.229162, 0, 0, 1, 1, 1,
-2.841187, -0.9677922, -1.768986, 1, 0, 0, 1, 1,
-2.691801, -1.054668, -1.06566, 1, 0, 0, 1, 1,
-2.618603, 2.334421, -0.6464358, 1, 0, 0, 1, 1,
-2.578327, -0.4556078, -2.606054, 1, 0, 0, 1, 1,
-2.493432, -0.03900546, -0.4753564, 1, 0, 0, 1, 1,
-2.470427, 1.089518, -1.029444, 0, 0, 0, 1, 1,
-2.456597, -0.4588267, -1.629703, 0, 0, 0, 1, 1,
-2.455286, -2.11781, -1.615966, 0, 0, 0, 1, 1,
-2.404114, 0.2480672, 0.6544622, 0, 0, 0, 1, 1,
-2.344337, -0.9378934, -2.005108, 0, 0, 0, 1, 1,
-2.340524, 3.109977, -0.7846171, 0, 0, 0, 1, 1,
-2.332389, 1.135169, -0.161827, 0, 0, 0, 1, 1,
-2.313831, -0.05679498, -1.601539, 1, 1, 1, 1, 1,
-2.167555, -0.03425844, -1.274382, 1, 1, 1, 1, 1,
-2.123911, 0.3410813, -1.070186, 1, 1, 1, 1, 1,
-2.097026, -0.9988604, -0.5080121, 1, 1, 1, 1, 1,
-2.069382, 0.6999241, -1.63816, 1, 1, 1, 1, 1,
-2.067735, 1.206655, -0.02205086, 1, 1, 1, 1, 1,
-2.061107, 0.05505766, -1.021525, 1, 1, 1, 1, 1,
-2.056992, -1.777548, -1.680781, 1, 1, 1, 1, 1,
-1.994789, 0.379638, -0.1246243, 1, 1, 1, 1, 1,
-1.971446, -1.42886, -2.265237, 1, 1, 1, 1, 1,
-1.966754, 0.9308009, 1.254907, 1, 1, 1, 1, 1,
-1.936996, 0.4677724, -3.157336, 1, 1, 1, 1, 1,
-1.918941, -1.161702, -3.98278, 1, 1, 1, 1, 1,
-1.907588, 0.2998692, -0.9673618, 1, 1, 1, 1, 1,
-1.897383, 1.746942, -1.536412, 1, 1, 1, 1, 1,
-1.881236, 0.1080354, -1.373416, 0, 0, 1, 1, 1,
-1.875325, 0.3168265, -0.6635613, 1, 0, 0, 1, 1,
-1.86801, 0.7184039, -1.812848, 1, 0, 0, 1, 1,
-1.858812, -0.7684293, -1.66302, 1, 0, 0, 1, 1,
-1.858314, 0.655976, -1.414812, 1, 0, 0, 1, 1,
-1.785365, -0.2783418, -1.483505, 1, 0, 0, 1, 1,
-1.776631, -1.192179, -2.103338, 0, 0, 0, 1, 1,
-1.776134, -0.9860827, -2.053572, 0, 0, 0, 1, 1,
-1.775942, -1.655053, -0.8950194, 0, 0, 0, 1, 1,
-1.767385, 0.1370566, -1.166763, 0, 0, 0, 1, 1,
-1.730644, 0.88306, -1.666392, 0, 0, 0, 1, 1,
-1.707136, -1.05675, -2.459383, 0, 0, 0, 1, 1,
-1.690003, 0.09356716, -2.656454, 0, 0, 0, 1, 1,
-1.685859, -1.167313, -1.419979, 1, 1, 1, 1, 1,
-1.679546, -0.1341421, -1.709693, 1, 1, 1, 1, 1,
-1.671764, -1.065646, -3.538455, 1, 1, 1, 1, 1,
-1.661911, -2.65038, -1.991924, 1, 1, 1, 1, 1,
-1.642778, -1.122967, -3.35024, 1, 1, 1, 1, 1,
-1.642526, 1.449631, -0.6702345, 1, 1, 1, 1, 1,
-1.639193, 1.668855, -0.005549991, 1, 1, 1, 1, 1,
-1.621127, 0.1720123, -3.34554, 1, 1, 1, 1, 1,
-1.620843, 0.8192643, -2.46868, 1, 1, 1, 1, 1,
-1.605759, -1.7233, -3.945075, 1, 1, 1, 1, 1,
-1.601704, -0.7714908, -2.348285, 1, 1, 1, 1, 1,
-1.598175, 0.8362633, -2.521205, 1, 1, 1, 1, 1,
-1.597692, -0.240483, -0.4741835, 1, 1, 1, 1, 1,
-1.558365, -0.9681499, -2.413365, 1, 1, 1, 1, 1,
-1.522156, 0.4845525, -2.100966, 1, 1, 1, 1, 1,
-1.514435, -0.948117, -1.204797, 0, 0, 1, 1, 1,
-1.513326, 1.533285, -0.3374192, 1, 0, 0, 1, 1,
-1.507761, -0.6892529, -2.277953, 1, 0, 0, 1, 1,
-1.503533, -0.8343342, -3.331502, 1, 0, 0, 1, 1,
-1.47327, -2.567032, -2.258626, 1, 0, 0, 1, 1,
-1.449468, 0.3976145, -1.399883, 1, 0, 0, 1, 1,
-1.439635, -0.05661147, -2.236432, 0, 0, 0, 1, 1,
-1.431138, -0.4405661, -2.516617, 0, 0, 0, 1, 1,
-1.423455, -1.409167, -1.447221, 0, 0, 0, 1, 1,
-1.399326, -0.2322536, -2.191457, 0, 0, 0, 1, 1,
-1.396813, -0.04971061, -1.109211, 0, 0, 0, 1, 1,
-1.392831, 0.7744405, -0.9930517, 0, 0, 0, 1, 1,
-1.37227, -1.364727, -4.091558, 0, 0, 0, 1, 1,
-1.361796, 0.6890062, -0.1005024, 1, 1, 1, 1, 1,
-1.35725, -0.0817391, -2.373635, 1, 1, 1, 1, 1,
-1.35466, -0.9485109, -2.066886, 1, 1, 1, 1, 1,
-1.354454, 0.08902737, -1.37038, 1, 1, 1, 1, 1,
-1.353078, 0.09239852, -2.451025, 1, 1, 1, 1, 1,
-1.352597, 1.027793, -0.2591736, 1, 1, 1, 1, 1,
-1.34, 0.5102897, -2.755542, 1, 1, 1, 1, 1,
-1.338433, -1.488853, -3.245468, 1, 1, 1, 1, 1,
-1.332536, 0.05566495, -2.966522, 1, 1, 1, 1, 1,
-1.318607, -1.462336, -2.198409, 1, 1, 1, 1, 1,
-1.31612, -0.1862994, -0.1785336, 1, 1, 1, 1, 1,
-1.315938, 0.2688536, -1.206036, 1, 1, 1, 1, 1,
-1.31375, 0.6335839, -0.402751, 1, 1, 1, 1, 1,
-1.312356, -0.08448578, -1.99784, 1, 1, 1, 1, 1,
-1.311021, -0.3884186, -2.116227, 1, 1, 1, 1, 1,
-1.304139, 0.2273548, -0.7758086, 0, 0, 1, 1, 1,
-1.299535, -2.124071, -2.531303, 1, 0, 0, 1, 1,
-1.293443, 2.493613, -0.5962088, 1, 0, 0, 1, 1,
-1.291967, -0.6415043, -2.587377, 1, 0, 0, 1, 1,
-1.289131, 0.1507353, -0.8444641, 1, 0, 0, 1, 1,
-1.289089, -0.2207606, -1.23162, 1, 0, 0, 1, 1,
-1.286891, 1.459574, -0.7858292, 0, 0, 0, 1, 1,
-1.28651, 0.7853686, -0.3750065, 0, 0, 0, 1, 1,
-1.285199, 0.5321129, 0.7402327, 0, 0, 0, 1, 1,
-1.282158, -0.8574189, -1.117736, 0, 0, 0, 1, 1,
-1.255545, -0.1743838, -2.945633, 0, 0, 0, 1, 1,
-1.253981, 1.559378, -0.5903472, 0, 0, 0, 1, 1,
-1.247538, 0.128551, -2.931465, 0, 0, 0, 1, 1,
-1.24613, 1.051133, -0.2287638, 1, 1, 1, 1, 1,
-1.244193, 0.2502646, -0.9988354, 1, 1, 1, 1, 1,
-1.239912, -1.12436, -3.057708, 1, 1, 1, 1, 1,
-1.238683, 0.1998835, -1.180575, 1, 1, 1, 1, 1,
-1.237267, 1.231039, -0.2182783, 1, 1, 1, 1, 1,
-1.217867, 0.6209518, 0.1182958, 1, 1, 1, 1, 1,
-1.217548, 1.23257, -0.3417981, 1, 1, 1, 1, 1,
-1.213881, -2.416486, -1.543632, 1, 1, 1, 1, 1,
-1.212011, -0.5337169, -0.9994662, 1, 1, 1, 1, 1,
-1.202301, 1.998509, -0.1337572, 1, 1, 1, 1, 1,
-1.200544, -0.3645997, -0.4492894, 1, 1, 1, 1, 1,
-1.192429, 0.5756035, 0.5607224, 1, 1, 1, 1, 1,
-1.184165, 0.1654153, -0.8455376, 1, 1, 1, 1, 1,
-1.178125, 2.494903, 2.084328, 1, 1, 1, 1, 1,
-1.159555, -0.7615194, -0.5320755, 1, 1, 1, 1, 1,
-1.149414, 0.7420115, -2.008109, 0, 0, 1, 1, 1,
-1.141543, 0.4907838, -1.703401, 1, 0, 0, 1, 1,
-1.14151, 0.08574621, -0.1416604, 1, 0, 0, 1, 1,
-1.134312, -1.597198, -1.274819, 1, 0, 0, 1, 1,
-1.130568, 0.1515117, -2.350416, 1, 0, 0, 1, 1,
-1.12946, 1.203495, -0.8787163, 1, 0, 0, 1, 1,
-1.12484, 0.6757127, -1.806337, 0, 0, 0, 1, 1,
-1.111316, -0.7299026, -3.874747, 0, 0, 0, 1, 1,
-1.110225, -0.4233816, -1.48886, 0, 0, 0, 1, 1,
-1.108888, -0.7539884, -2.617144, 0, 0, 0, 1, 1,
-1.107204, -0.0672615, -4.777792, 0, 0, 0, 1, 1,
-1.103483, -2.221116, -2.345653, 0, 0, 0, 1, 1,
-1.086169, 0.4553281, -4.469628, 0, 0, 0, 1, 1,
-1.074256, -0.9521568, -2.812234, 1, 1, 1, 1, 1,
-1.065636, 0.3221542, -2.560945, 1, 1, 1, 1, 1,
-1.060551, 1.273038, -0.1979817, 1, 1, 1, 1, 1,
-1.053356, -0.6118059, -1.195658, 1, 1, 1, 1, 1,
-1.048275, 2.230814, -0.9404642, 1, 1, 1, 1, 1,
-1.033903, -1.223128, -3.600075, 1, 1, 1, 1, 1,
-1.032451, -0.846895, -1.110488, 1, 1, 1, 1, 1,
-1.030049, -1.220443, -1.178485, 1, 1, 1, 1, 1,
-1.026254, -0.5481356, -1.797996, 1, 1, 1, 1, 1,
-1.014534, -0.1246076, -0.3381225, 1, 1, 1, 1, 1,
-1.011137, 0.5098965, -0.8952675, 1, 1, 1, 1, 1,
-1.009941, -0.6534169, -2.364152, 1, 1, 1, 1, 1,
-1.008877, -0.4195948, -2.594806, 1, 1, 1, 1, 1,
-1.001902, -1.656482, -2.291691, 1, 1, 1, 1, 1,
-0.9963905, 0.3354129, -3.555736, 1, 1, 1, 1, 1,
-0.9910761, 0.9561913, -1.443898, 0, 0, 1, 1, 1,
-0.9898764, -0.03025197, -1.061103, 1, 0, 0, 1, 1,
-0.9893387, -1.036523, -3.592457, 1, 0, 0, 1, 1,
-0.9784815, 0.02081034, -0.1627205, 1, 0, 0, 1, 1,
-0.9782403, -0.794082, -2.232457, 1, 0, 0, 1, 1,
-0.9782133, -0.05067799, -0.9900239, 1, 0, 0, 1, 1,
-0.9631681, 2.114514, -2.478001, 0, 0, 0, 1, 1,
-0.95983, 0.3293718, -0.5254635, 0, 0, 0, 1, 1,
-0.9550827, -0.02091037, -1.157556, 0, 0, 0, 1, 1,
-0.9548595, -3.03517, -0.8827804, 0, 0, 0, 1, 1,
-0.9546909, -1.440461, -2.696875, 0, 0, 0, 1, 1,
-0.9519371, 0.8761143, -0.3795777, 0, 0, 0, 1, 1,
-0.9475349, 1.338819, -1.40055, 0, 0, 0, 1, 1,
-0.9416138, -0.2953668, -3.998971, 1, 1, 1, 1, 1,
-0.9348257, 2.142568, 1.992412, 1, 1, 1, 1, 1,
-0.9285089, 0.267828, -2.074663, 1, 1, 1, 1, 1,
-0.9239473, 0.4752315, -2.29199, 1, 1, 1, 1, 1,
-0.9210303, -0.5945773, -0.148863, 1, 1, 1, 1, 1,
-0.920974, 0.04501107, -2.520497, 1, 1, 1, 1, 1,
-0.9197727, 0.07891314, -2.025858, 1, 1, 1, 1, 1,
-0.9131896, -0.9711866, -2.639827, 1, 1, 1, 1, 1,
-0.911387, 0.8088773, -1.178786, 1, 1, 1, 1, 1,
-0.9023253, 0.1945532, -1.169113, 1, 1, 1, 1, 1,
-0.8984736, -0.1069029, -0.6161869, 1, 1, 1, 1, 1,
-0.8973767, -0.2387087, -2.784348, 1, 1, 1, 1, 1,
-0.8933805, 0.8551073, -1.677012, 1, 1, 1, 1, 1,
-0.8877422, -2.230931, -2.281452, 1, 1, 1, 1, 1,
-0.8871095, 1.195673, -2.507871, 1, 1, 1, 1, 1,
-0.8835723, 0.9813471, -1.395871, 0, 0, 1, 1, 1,
-0.8824199, 0.8423204, 0.01369012, 1, 0, 0, 1, 1,
-0.8774253, 0.1108407, -1.755156, 1, 0, 0, 1, 1,
-0.8750932, 0.850307, -0.8328013, 1, 0, 0, 1, 1,
-0.8719018, -0.7045959, -1.464027, 1, 0, 0, 1, 1,
-0.8678141, 1.480426, 0.505955, 1, 0, 0, 1, 1,
-0.8670449, 0.6713016, -1.359118, 0, 0, 0, 1, 1,
-0.8644779, 0.8615136, -1.078175, 0, 0, 0, 1, 1,
-0.8640329, -0.1364472, -1.566139, 0, 0, 0, 1, 1,
-0.8630032, 0.5327121, 0.1790511, 0, 0, 0, 1, 1,
-0.8626788, 1.398463, 0.3643438, 0, 0, 0, 1, 1,
-0.8622711, 0.4208484, 0.1123092, 0, 0, 0, 1, 1,
-0.8603294, 1.529254, 0.01137746, 0, 0, 0, 1, 1,
-0.8443455, 0.2942529, -1.455919, 1, 1, 1, 1, 1,
-0.84363, -0.7478344, -2.886501, 1, 1, 1, 1, 1,
-0.8404791, 1.496529, 0.1125411, 1, 1, 1, 1, 1,
-0.8337266, -0.9469545, -2.768404, 1, 1, 1, 1, 1,
-0.8315687, 0.7303057, -1.715788, 1, 1, 1, 1, 1,
-0.8296174, -0.3125108, -1.685089, 1, 1, 1, 1, 1,
-0.8252022, -1.373618, -3.54626, 1, 1, 1, 1, 1,
-0.8230262, 0.995981, 0.3270523, 1, 1, 1, 1, 1,
-0.8228569, -1.810721, -3.915825, 1, 1, 1, 1, 1,
-0.8129145, -1.465063, -3.441005, 1, 1, 1, 1, 1,
-0.8051127, -0.104748, -0.9033801, 1, 1, 1, 1, 1,
-0.8048021, -0.03137029, -0.9692133, 1, 1, 1, 1, 1,
-0.8047372, 0.7691492, -0.7976676, 1, 1, 1, 1, 1,
-0.8030348, 0.1977466, -2.668116, 1, 1, 1, 1, 1,
-0.7878591, 0.440343, -0.9764256, 1, 1, 1, 1, 1,
-0.7878306, 0.6293564, -1.744154, 0, 0, 1, 1, 1,
-0.7874354, 0.9619649, -0.02029764, 1, 0, 0, 1, 1,
-0.7836024, 0.4091716, -0.7432228, 1, 0, 0, 1, 1,
-0.7813019, -0.1163275, -1.263032, 1, 0, 0, 1, 1,
-0.777906, 0.02261118, -0.7419328, 1, 0, 0, 1, 1,
-0.772864, 1.221856, -0.8759967, 1, 0, 0, 1, 1,
-0.7681063, 0.917097, -1.128478, 0, 0, 0, 1, 1,
-0.7653809, 0.2003657, -0.5603403, 0, 0, 0, 1, 1,
-0.7617437, 1.521042, -2.488673, 0, 0, 0, 1, 1,
-0.7531539, -0.5502595, -1.395997, 0, 0, 0, 1, 1,
-0.7524439, 0.3189735, -0.4273402, 0, 0, 0, 1, 1,
-0.7417219, 0.07585671, -1.920846, 0, 0, 0, 1, 1,
-0.741438, 0.7232118, -0.7718454, 0, 0, 0, 1, 1,
-0.7410051, 0.1974282, -3.157876, 1, 1, 1, 1, 1,
-0.7386775, -0.8431454, -1.981765, 1, 1, 1, 1, 1,
-0.7347328, 1.721884, -1.136121, 1, 1, 1, 1, 1,
-0.733566, 0.1973055, -1.94642, 1, 1, 1, 1, 1,
-0.7327226, -0.948576, -1.622447, 1, 1, 1, 1, 1,
-0.7263619, 0.6016692, -1.584227, 1, 1, 1, 1, 1,
-0.7253498, -1.279179, -3.043682, 1, 1, 1, 1, 1,
-0.7230859, -0.9634793, -1.936296, 1, 1, 1, 1, 1,
-0.7200791, -0.7759595, -3.537043, 1, 1, 1, 1, 1,
-0.7165659, 1.103482, 0.4508937, 1, 1, 1, 1, 1,
-0.7147077, 0.6655813, -1.202692, 1, 1, 1, 1, 1,
-0.7142626, 0.724636, -1.350283, 1, 1, 1, 1, 1,
-0.7130131, 2.384326, -0.6118214, 1, 1, 1, 1, 1,
-0.7091353, 0.1912612, -1.118794, 1, 1, 1, 1, 1,
-0.7083741, 0.9205989, -1.499306, 1, 1, 1, 1, 1,
-0.6933672, -0.2026179, -1.582695, 0, 0, 1, 1, 1,
-0.6927484, -1.587654, -3.403621, 1, 0, 0, 1, 1,
-0.6869212, 0.6431094, -0.5042409, 1, 0, 0, 1, 1,
-0.6850461, 1.179558, -0.2114722, 1, 0, 0, 1, 1,
-0.6847239, -0.08713181, -1.66825, 1, 0, 0, 1, 1,
-0.6789591, 3.076378, -0.5203585, 1, 0, 0, 1, 1,
-0.6761881, 0.2177549, -0.129233, 0, 0, 0, 1, 1,
-0.667846, -0.1813916, -1.204072, 0, 0, 0, 1, 1,
-0.6650606, 0.03661119, -2.115558, 0, 0, 0, 1, 1,
-0.6641207, 0.2673388, -1.040644, 0, 0, 0, 1, 1,
-0.6633965, -2.907315, -2.700465, 0, 0, 0, 1, 1,
-0.6611769, 0.8556278, -1.16969, 0, 0, 0, 1, 1,
-0.6541883, -2.135331, -4.059993, 0, 0, 0, 1, 1,
-0.6534525, 2.282079, -0.5696304, 1, 1, 1, 1, 1,
-0.6484773, -0.192231, -2.847306, 1, 1, 1, 1, 1,
-0.6473206, 1.641554, -2.779444, 1, 1, 1, 1, 1,
-0.6409637, -0.05199778, -0.3135624, 1, 1, 1, 1, 1,
-0.63916, 1.763683, 0.0700767, 1, 1, 1, 1, 1,
-0.6289159, 0.9382826, -2.562582, 1, 1, 1, 1, 1,
-0.6260034, -1.971413, -2.366567, 1, 1, 1, 1, 1,
-0.625959, 0.008397328, -1.761619, 1, 1, 1, 1, 1,
-0.6251868, 0.3326783, -2.135377, 1, 1, 1, 1, 1,
-0.6242443, 0.6692605, -0.02860899, 1, 1, 1, 1, 1,
-0.6238302, 1.50184, -0.7615532, 1, 1, 1, 1, 1,
-0.6215923, -1.616611, -3.147399, 1, 1, 1, 1, 1,
-0.620239, -0.2373213, -1.952358, 1, 1, 1, 1, 1,
-0.6169206, 0.775403, 0.8042901, 1, 1, 1, 1, 1,
-0.6144658, 1.419388, -1.976215, 1, 1, 1, 1, 1,
-0.6117146, -0.7953351, -4.068039, 0, 0, 1, 1, 1,
-0.6082181, 0.1947413, -1.794601, 1, 0, 0, 1, 1,
-0.6032654, 0.009316551, -1.677939, 1, 0, 0, 1, 1,
-0.5976418, 1.037951, 0.502782, 1, 0, 0, 1, 1,
-0.5954632, -1.763572, -2.048589, 1, 0, 0, 1, 1,
-0.5949807, -0.7975717, -3.099644, 1, 0, 0, 1, 1,
-0.5911765, -0.04053326, -2.263808, 0, 0, 0, 1, 1,
-0.5907068, 0.786754, -0.5196443, 0, 0, 0, 1, 1,
-0.5888864, 0.006901979, 0.403593, 0, 0, 0, 1, 1,
-0.5872685, -1.241318, -2.046326, 0, 0, 0, 1, 1,
-0.587223, -1.540542, -3.228559, 0, 0, 0, 1, 1,
-0.5869669, -0.0729183, -1.752048, 0, 0, 0, 1, 1,
-0.585161, 1.132488, 0.918002, 0, 0, 0, 1, 1,
-0.5806366, 1.263129, 0.1582441, 1, 1, 1, 1, 1,
-0.5806012, -1.49806, -3.379337, 1, 1, 1, 1, 1,
-0.580444, -0.9554195, -1.875769, 1, 1, 1, 1, 1,
-0.5780825, 0.751723, -0.8450722, 1, 1, 1, 1, 1,
-0.5725224, 0.5154899, -2.42663, 1, 1, 1, 1, 1,
-0.5715683, -2.394293, -3.48054, 1, 1, 1, 1, 1,
-0.5692796, 0.290833, -0.4383118, 1, 1, 1, 1, 1,
-0.5657536, -0.06750713, -0.03536366, 1, 1, 1, 1, 1,
-0.5650304, -0.03612035, -2.164435, 1, 1, 1, 1, 1,
-0.563597, 0.7106938, 0.2263604, 1, 1, 1, 1, 1,
-0.5603451, -1.216812, -3.27913, 1, 1, 1, 1, 1,
-0.555664, 1.031311, -0.435424, 1, 1, 1, 1, 1,
-0.5536895, -1.211895, -3.349098, 1, 1, 1, 1, 1,
-0.5526724, 0.09301397, -1.821409, 1, 1, 1, 1, 1,
-0.5514192, 0.7157472, -2.603954, 1, 1, 1, 1, 1,
-0.550792, -1.414725, -4.286662, 0, 0, 1, 1, 1,
-0.5490183, -0.3924262, -2.246893, 1, 0, 0, 1, 1,
-0.5458077, -0.3199868, -1.810469, 1, 0, 0, 1, 1,
-0.5431167, 0.2087126, -1.953632, 1, 0, 0, 1, 1,
-0.5428139, 0.4193158, 1.574607, 1, 0, 0, 1, 1,
-0.537569, 0.4150172, -2.0516, 1, 0, 0, 1, 1,
-0.5278882, -1.029115, -3.564073, 0, 0, 0, 1, 1,
-0.5186678, -0.3866183, -4.009355, 0, 0, 0, 1, 1,
-0.5122584, 1.465474, -0.4394881, 0, 0, 0, 1, 1,
-0.5115329, -0.4755245, -1.970538, 0, 0, 0, 1, 1,
-0.5089768, -0.08634188, -1.962008, 0, 0, 0, 1, 1,
-0.5064553, -0.6864499, -1.6222, 0, 0, 0, 1, 1,
-0.5058689, -0.5611867, -0.6848091, 0, 0, 0, 1, 1,
-0.5038735, 1.333729, -0.06282821, 1, 1, 1, 1, 1,
-0.4994473, 1.650984, 0.2310697, 1, 1, 1, 1, 1,
-0.4993236, 0.3685142, -0.9372252, 1, 1, 1, 1, 1,
-0.4975086, -0.3715416, -1.793292, 1, 1, 1, 1, 1,
-0.4973376, -0.366442, -2.017436, 1, 1, 1, 1, 1,
-0.4971755, -0.2362426, -2.247034, 1, 1, 1, 1, 1,
-0.4963514, 0.2538054, 0.3358293, 1, 1, 1, 1, 1,
-0.4962354, -0.2849959, -0.1511565, 1, 1, 1, 1, 1,
-0.489961, -0.1856577, -1.338071, 1, 1, 1, 1, 1,
-0.4897856, -1.482159, -3.724862, 1, 1, 1, 1, 1,
-0.4897348, 0.1503692, -1.578925, 1, 1, 1, 1, 1,
-0.4892961, -1.382358, -3.278117, 1, 1, 1, 1, 1,
-0.4874127, -0.3381751, -1.851425, 1, 1, 1, 1, 1,
-0.4861366, 1.595816, -0.7430212, 1, 1, 1, 1, 1,
-0.4819556, 0.1270044, -0.4153147, 1, 1, 1, 1, 1,
-0.480236, -0.5480887, -2.23798, 0, 0, 1, 1, 1,
-0.4785628, 0.5535522, -2.004618, 1, 0, 0, 1, 1,
-0.4765908, -1.389955, -2.439878, 1, 0, 0, 1, 1,
-0.4746197, 0.06129334, -0.7220042, 1, 0, 0, 1, 1,
-0.4739413, 0.6954052, -0.7857298, 1, 0, 0, 1, 1,
-0.4725487, -0.2111448, -1.776508, 1, 0, 0, 1, 1,
-0.4722717, 2.781555, -1.810962, 0, 0, 0, 1, 1,
-0.4707961, 0.2854353, -0.361239, 0, 0, 0, 1, 1,
-0.4704588, 0.9164093, -0.7491365, 0, 0, 0, 1, 1,
-0.4695559, 1.061129, -1.205417, 0, 0, 0, 1, 1,
-0.4682807, -0.8094773, -2.199469, 0, 0, 0, 1, 1,
-0.4634714, 0.9446105, -2.004435, 0, 0, 0, 1, 1,
-0.4604477, -1.888053, -2.594159, 0, 0, 0, 1, 1,
-0.4601825, -0.5338535, -1.411036, 1, 1, 1, 1, 1,
-0.4549931, -0.1958374, -2.412898, 1, 1, 1, 1, 1,
-0.4525195, -0.1807093, -1.751384, 1, 1, 1, 1, 1,
-0.4513662, 0.5816314, 0.07790767, 1, 1, 1, 1, 1,
-0.4480089, 0.6014869, 1.216209, 1, 1, 1, 1, 1,
-0.4413522, -1.468894, -3.77326, 1, 1, 1, 1, 1,
-0.4409816, 0.6032524, -1.077646, 1, 1, 1, 1, 1,
-0.4402956, -0.351182, -2.370882, 1, 1, 1, 1, 1,
-0.4395484, -2.286194, -1.766704, 1, 1, 1, 1, 1,
-0.4370363, 0.306943, -2.51589, 1, 1, 1, 1, 1,
-0.4363112, -0.7359349, -2.153597, 1, 1, 1, 1, 1,
-0.436031, -1.284513, -1.162272, 1, 1, 1, 1, 1,
-0.4353763, 1.577317, -0.06489712, 1, 1, 1, 1, 1,
-0.4310543, -0.52781, -1.873823, 1, 1, 1, 1, 1,
-0.4207554, -0.3480203, -0.6392829, 1, 1, 1, 1, 1,
-0.4153201, 0.6583104, 0.0718074, 0, 0, 1, 1, 1,
-0.4144388, 0.2707763, -2.457422, 1, 0, 0, 1, 1,
-0.4067186, 0.831759, -0.9875933, 1, 0, 0, 1, 1,
-0.4031247, -0.649519, -3.622133, 1, 0, 0, 1, 1,
-0.3993387, -0.9208496, -4.06805, 1, 0, 0, 1, 1,
-0.3927502, -0.3607686, -2.037193, 1, 0, 0, 1, 1,
-0.3872277, -0.8410624, -2.143879, 0, 0, 0, 1, 1,
-0.3807507, 0.1132681, -0.188726, 0, 0, 0, 1, 1,
-0.3795188, 0.7470499, -1.259434, 0, 0, 0, 1, 1,
-0.3684439, -1.052684, -1.559237, 0, 0, 0, 1, 1,
-0.3657418, -0.2651006, -1.091308, 0, 0, 0, 1, 1,
-0.3654626, -0.7128645, -3.252374, 0, 0, 0, 1, 1,
-0.3617905, -1.2731, -2.521219, 0, 0, 0, 1, 1,
-0.3603205, -0.1953829, -0.6330903, 1, 1, 1, 1, 1,
-0.3595482, 0.2423901, -1.237118, 1, 1, 1, 1, 1,
-0.359475, 0.07767487, -2.235493, 1, 1, 1, 1, 1,
-0.3547925, -1.077553, -3.318475, 1, 1, 1, 1, 1,
-0.3541103, -0.2285302, -1.48848, 1, 1, 1, 1, 1,
-0.3526873, -0.3497515, -3.281964, 1, 1, 1, 1, 1,
-0.3509957, 0.8860156, -0.5191919, 1, 1, 1, 1, 1,
-0.3509748, -0.9180434, -3.947411, 1, 1, 1, 1, 1,
-0.3502203, -1.111612, -3.561474, 1, 1, 1, 1, 1,
-0.3479456, -0.5973024, -4.499076, 1, 1, 1, 1, 1,
-0.3396543, -0.6695388, -1.788109, 1, 1, 1, 1, 1,
-0.338957, -1.035974, -3.822506, 1, 1, 1, 1, 1,
-0.3377946, -0.7146987, -1.606148, 1, 1, 1, 1, 1,
-0.3373927, -0.5318351, -2.258712, 1, 1, 1, 1, 1,
-0.3345106, 0.2783506, -1.139228, 1, 1, 1, 1, 1,
-0.3344839, -0.6001947, -1.647856, 0, 0, 1, 1, 1,
-0.3310278, -0.4054069, -3.413631, 1, 0, 0, 1, 1,
-0.3302203, -0.401852, -1.913792, 1, 0, 0, 1, 1,
-0.3297851, -0.9993606, -2.17528, 1, 0, 0, 1, 1,
-0.3255374, 0.3473405, -2.408599, 1, 0, 0, 1, 1,
-0.3232329, -0.0227516, -1.692373, 1, 0, 0, 1, 1,
-0.3087322, -0.02762696, -0.1662614, 0, 0, 0, 1, 1,
-0.3078762, -1.678932, -2.409894, 0, 0, 0, 1, 1,
-0.3026859, 0.5219074, -0.6145275, 0, 0, 0, 1, 1,
-0.3021767, -1.231129, -4.054571, 0, 0, 0, 1, 1,
-0.298788, 1.010605, -0.5893769, 0, 0, 0, 1, 1,
-0.2952821, -1.162565, -4.724888, 0, 0, 0, 1, 1,
-0.2889669, -1.475095, -0.8409088, 0, 0, 0, 1, 1,
-0.2878111, 0.8807225, -0.3245346, 1, 1, 1, 1, 1,
-0.2874683, 0.7043643, -0.7919978, 1, 1, 1, 1, 1,
-0.2839845, 0.1739651, -0.3754144, 1, 1, 1, 1, 1,
-0.28361, -1.254136, -3.499659, 1, 1, 1, 1, 1,
-0.2828808, -0.360162, -2.764689, 1, 1, 1, 1, 1,
-0.2825531, 0.005000615, -3.347661, 1, 1, 1, 1, 1,
-0.27102, -1.850633, -3.346578, 1, 1, 1, 1, 1,
-0.2707403, -0.2578627, -2.402994, 1, 1, 1, 1, 1,
-0.2703844, -2.583156, -3.868257, 1, 1, 1, 1, 1,
-0.2652173, 1.222116, -1.505436, 1, 1, 1, 1, 1,
-0.2645947, 2.619622, -0.5687044, 1, 1, 1, 1, 1,
-0.2545721, 0.3528862, -0.02840208, 1, 1, 1, 1, 1,
-0.2543792, -0.7137377, -3.411994, 1, 1, 1, 1, 1,
-0.2519829, 0.2311776, -2.300305, 1, 1, 1, 1, 1,
-0.249985, -0.4302287, -2.539647, 1, 1, 1, 1, 1,
-0.2476926, -0.4733262, -1.87683, 0, 0, 1, 1, 1,
-0.2444093, 0.4148804, -1.731922, 1, 0, 0, 1, 1,
-0.2391314, 0.01294939, -2.726005, 1, 0, 0, 1, 1,
-0.2383108, 1.151625, -1.78376, 1, 0, 0, 1, 1,
-0.2292576, -1.263576, -3.633668, 1, 0, 0, 1, 1,
-0.2282877, -0.9103851, -3.851979, 1, 0, 0, 1, 1,
-0.2240505, 1.91855, -0.733542, 0, 0, 0, 1, 1,
-0.2187812, 0.4745902, -2.059998, 0, 0, 0, 1, 1,
-0.2149877, -1.847606, -4.244555, 0, 0, 0, 1, 1,
-0.214648, 0.4163396, 0.645847, 0, 0, 0, 1, 1,
-0.213972, 0.9624861, -2.591034, 0, 0, 0, 1, 1,
-0.2111516, -0.3595047, -1.502039, 0, 0, 0, 1, 1,
-0.210589, 0.4405344, -1.320387, 0, 0, 0, 1, 1,
-0.2036213, 0.9796687, 0.1804342, 1, 1, 1, 1, 1,
-0.2008329, 0.2780997, 1.349803, 1, 1, 1, 1, 1,
-0.200305, 0.3656891, 0.4437867, 1, 1, 1, 1, 1,
-0.1977728, 1.065424, -2.603414, 1, 1, 1, 1, 1,
-0.1955185, -0.5803778, -2.307578, 1, 1, 1, 1, 1,
-0.1954704, -1.04469, -3.149773, 1, 1, 1, 1, 1,
-0.1937264, -0.2513722, -1.950933, 1, 1, 1, 1, 1,
-0.1911349, 0.2344281, 0.1037323, 1, 1, 1, 1, 1,
-0.1852525, 0.220559, 0.421966, 1, 1, 1, 1, 1,
-0.1846233, 1.383374, -0.345025, 1, 1, 1, 1, 1,
-0.1807454, -1.713846, -2.011912, 1, 1, 1, 1, 1,
-0.1793686, -0.5898551, -1.423401, 1, 1, 1, 1, 1,
-0.1767857, 0.3682577, -0.784207, 1, 1, 1, 1, 1,
-0.1764977, 0.3180753, -0.09774245, 1, 1, 1, 1, 1,
-0.1737518, 0.5949895, 0.5939325, 1, 1, 1, 1, 1,
-0.170239, 2.514093, -2.162522, 0, 0, 1, 1, 1,
-0.1660277, -0.07716075, -1.645818, 1, 0, 0, 1, 1,
-0.1642009, -0.3478244, -1.74545, 1, 0, 0, 1, 1,
-0.1578574, 0.8571948, -0.3557837, 1, 0, 0, 1, 1,
-0.1564129, 0.8002092, 0.9876794, 1, 0, 0, 1, 1,
-0.1547242, -0.2444315, -3.014538, 1, 0, 0, 1, 1,
-0.1537754, -0.0474151, -4.511434, 0, 0, 0, 1, 1,
-0.1514609, -1.738334, -3.604542, 0, 0, 0, 1, 1,
-0.1478097, 0.2980284, -0.2422982, 0, 0, 0, 1, 1,
-0.1462925, -1.937161, -2.031399, 0, 0, 0, 1, 1,
-0.1449208, -0.8012522, -5.024958, 0, 0, 0, 1, 1,
-0.14387, 0.07702258, -1.281716, 0, 0, 0, 1, 1,
-0.1422262, 0.1002362, -1.081305, 0, 0, 0, 1, 1,
-0.1418831, 0.8502559, -1.401624, 1, 1, 1, 1, 1,
-0.1409424, -0.7303452, -3.672271, 1, 1, 1, 1, 1,
-0.1385218, -0.159082, -1.704651, 1, 1, 1, 1, 1,
-0.1383772, -1.392686, -2.767805, 1, 1, 1, 1, 1,
-0.1336947, 1.55111, 0.4736172, 1, 1, 1, 1, 1,
-0.1331192, -2.260981, -4.131999, 1, 1, 1, 1, 1,
-0.1325598, -0.297799, -2.512303, 1, 1, 1, 1, 1,
-0.1206877, 1.208721, -1.556248, 1, 1, 1, 1, 1,
-0.1206094, 0.3326053, -0.5292335, 1, 1, 1, 1, 1,
-0.1189583, 0.1802287, -0.9731982, 1, 1, 1, 1, 1,
-0.1171316, 0.1276499, -1.111821, 1, 1, 1, 1, 1,
-0.1155742, -0.7452125, -1.799342, 1, 1, 1, 1, 1,
-0.112901, -1.585141, -1.954491, 1, 1, 1, 1, 1,
-0.1106554, -0.9311013, -3.166946, 1, 1, 1, 1, 1,
-0.1050429, -1.418932, -5.286007, 1, 1, 1, 1, 1,
-0.1042189, 0.5708356, 0.05893942, 0, 0, 1, 1, 1,
-0.1036625, 0.1510989, -0.2238761, 1, 0, 0, 1, 1,
-0.1029652, 2.325861, 0.7181494, 1, 0, 0, 1, 1,
-0.09827527, -0.04456418, -0.463629, 1, 0, 0, 1, 1,
-0.09799239, 0.300288, -1.854746, 1, 0, 0, 1, 1,
-0.09259957, -0.4600225, -1.822031, 1, 0, 0, 1, 1,
-0.09255386, -1.987999, -4.629865, 0, 0, 0, 1, 1,
-0.09023859, -0.6552961, -1.961321, 0, 0, 0, 1, 1,
-0.08994371, -0.3642, -2.58499, 0, 0, 0, 1, 1,
-0.0899384, -0.5582612, -2.457517, 0, 0, 0, 1, 1,
-0.08718555, -2.337788, -3.34499, 0, 0, 0, 1, 1,
-0.08148149, -0.04979915, -1.43997, 0, 0, 0, 1, 1,
-0.08032709, 0.5739545, 1.453456, 0, 0, 0, 1, 1,
-0.08005286, -0.2115919, -3.306466, 1, 1, 1, 1, 1,
-0.07468965, -0.8798293, -4.09762, 1, 1, 1, 1, 1,
-0.07232177, 1.220224, -0.6324495, 1, 1, 1, 1, 1,
-0.05846144, -0.3786829, -4.44609, 1, 1, 1, 1, 1,
-0.05790608, -0.8141887, -3.728831, 1, 1, 1, 1, 1,
-0.05695395, -0.4858949, -2.217142, 1, 1, 1, 1, 1,
-0.05364279, 0.4631545, -0.7640952, 1, 1, 1, 1, 1,
-0.05352313, -0.265484, -2.561705, 1, 1, 1, 1, 1,
-0.05325537, 0.009073213, -1.432009, 1, 1, 1, 1, 1,
-0.05230033, -1.446355, -1.934822, 1, 1, 1, 1, 1,
-0.05121851, 0.08457056, -1.171358, 1, 1, 1, 1, 1,
-0.05036145, 0.5746796, -0.3040451, 1, 1, 1, 1, 1,
-0.05017139, -0.4749135, -2.955503, 1, 1, 1, 1, 1,
-0.04985055, 0.5852881, -0.6542712, 1, 1, 1, 1, 1,
-0.04944965, 1.251369, -0.7680182, 1, 1, 1, 1, 1,
-0.03903833, 0.5157817, 1.575581, 0, 0, 1, 1, 1,
-0.03853932, -1.224065, -2.855224, 1, 0, 0, 1, 1,
-0.03445477, -2.006687, -3.926829, 1, 0, 0, 1, 1,
-0.03238809, 0.7621566, 1.247136, 1, 0, 0, 1, 1,
-0.02959834, -0.5214724, -2.769294, 1, 0, 0, 1, 1,
-0.02521628, -0.1187141, -2.318286, 1, 0, 0, 1, 1,
-0.01605773, 0.4912972, 0.2666217, 0, 0, 0, 1, 1,
-0.01277235, -0.01163617, -2.000893, 0, 0, 0, 1, 1,
-0.01156882, 0.7231654, 1.130671, 0, 0, 0, 1, 1,
-0.009305265, -0.2765725, -2.596987, 0, 0, 0, 1, 1,
-0.008851023, 0.785077, -0.4911155, 0, 0, 0, 1, 1,
-0.002604665, -0.1971594, -2.765302, 0, 0, 0, 1, 1,
-0.002591899, 0.1040643, -0.824044, 0, 0, 0, 1, 1,
-0.001307786, -0.311871, -2.426426, 1, 1, 1, 1, 1,
-0.001118633, 0.07289252, -0.09558444, 1, 1, 1, 1, 1,
0.0004026626, -1.199327, 3.1901, 1, 1, 1, 1, 1,
0.0068827, -0.6029269, 3.615459, 1, 1, 1, 1, 1,
0.01318499, -0.7571605, 5.467817, 1, 1, 1, 1, 1,
0.01323508, 0.2775947, 0.7105529, 1, 1, 1, 1, 1,
0.01376092, -1.114657, 1.659896, 1, 1, 1, 1, 1,
0.01678066, 0.2969151, -1.347305, 1, 1, 1, 1, 1,
0.0174302, -1.117501, 4.912086, 1, 1, 1, 1, 1,
0.0186509, 1.029904, 0.5821673, 1, 1, 1, 1, 1,
0.02022395, 0.0005111771, 2.044868, 1, 1, 1, 1, 1,
0.02153257, 0.5430525, -1.647805, 1, 1, 1, 1, 1,
0.02420556, 0.8294352, 1.379023, 1, 1, 1, 1, 1,
0.024554, -0.4349189, 3.485158, 1, 1, 1, 1, 1,
0.02479685, -0.03222331, 3.057983, 1, 1, 1, 1, 1,
0.0345629, 0.9500924, 0.6203919, 0, 0, 1, 1, 1,
0.03857813, -0.7102987, 4.056111, 1, 0, 0, 1, 1,
0.0388642, -1.077921, 3.650343, 1, 0, 0, 1, 1,
0.04131698, 1.152241, 0.03165253, 1, 0, 0, 1, 1,
0.04290207, -0.3705112, 2.884305, 1, 0, 0, 1, 1,
0.04478686, 1.209027, -0.2326142, 1, 0, 0, 1, 1,
0.04676491, -0.7010062, 3.733266, 0, 0, 0, 1, 1,
0.04718042, 1.068584, -0.3254297, 0, 0, 0, 1, 1,
0.04862069, 0.4414676, 0.3141393, 0, 0, 0, 1, 1,
0.05529307, -0.3537839, 3.046997, 0, 0, 0, 1, 1,
0.05793878, -0.3241875, 2.31307, 0, 0, 0, 1, 1,
0.05918966, 0.6341245, 1.763944, 0, 0, 0, 1, 1,
0.06211511, -2.471824, 2.607353, 0, 0, 0, 1, 1,
0.0646396, 0.1269434, 0.574077, 1, 1, 1, 1, 1,
0.07006089, 0.09023632, 0.6565578, 1, 1, 1, 1, 1,
0.07951621, -1.316827, 4.357713, 1, 1, 1, 1, 1,
0.08417517, 0.8962491, 0.5750121, 1, 1, 1, 1, 1,
0.08438643, 0.8766007, 1.510095, 1, 1, 1, 1, 1,
0.08973644, 0.2335031, 0.6892706, 1, 1, 1, 1, 1,
0.09208357, -0.2471488, 2.779946, 1, 1, 1, 1, 1,
0.1001329, 0.1210391, 1.566657, 1, 1, 1, 1, 1,
0.1134381, 0.4045305, -0.4443709, 1, 1, 1, 1, 1,
0.1165513, -1.341825, 2.670573, 1, 1, 1, 1, 1,
0.1179672, -1.654651, 2.948375, 1, 1, 1, 1, 1,
0.1191573, 1.015426, 1.386017, 1, 1, 1, 1, 1,
0.1219941, -2.258161, 4.463819, 1, 1, 1, 1, 1,
0.1264411, -0.9731004, 5.114771, 1, 1, 1, 1, 1,
0.1285142, 0.639943, 0.08002681, 1, 1, 1, 1, 1,
0.1322121, 1.228701, 2.184892, 0, 0, 1, 1, 1,
0.1365555, -0.08680224, 2.936566, 1, 0, 0, 1, 1,
0.1381108, -0.4202237, 4.153172, 1, 0, 0, 1, 1,
0.1384593, 1.068393, 0.4382569, 1, 0, 0, 1, 1,
0.1385112, 1.482775, 0.8980263, 1, 0, 0, 1, 1,
0.1406612, -1.011783, 3.401737, 1, 0, 0, 1, 1,
0.1431258, 0.06684083, 0.5429142, 0, 0, 0, 1, 1,
0.143461, -0.2883216, 1.517473, 0, 0, 0, 1, 1,
0.1482646, 0.638297, -0.07961524, 0, 0, 0, 1, 1,
0.1495086, 0.6496476, -0.07937842, 0, 0, 0, 1, 1,
0.1609987, -0.2833316, 4.70347, 0, 0, 0, 1, 1,
0.1636731, -1.264535, 2.327686, 0, 0, 0, 1, 1,
0.1647948, 0.234649, 0.2995295, 0, 0, 0, 1, 1,
0.1739166, -1.188304, 4.022559, 1, 1, 1, 1, 1,
0.1744615, -1.27957, 2.149694, 1, 1, 1, 1, 1,
0.1820864, 0.07672881, 1.561652, 1, 1, 1, 1, 1,
0.183993, 0.5198716, -1.245996, 1, 1, 1, 1, 1,
0.1861338, 1.198271, 0.7673647, 1, 1, 1, 1, 1,
0.1869688, 0.7734482, -1.625843, 1, 1, 1, 1, 1,
0.1887408, 1.28519, -1.881159, 1, 1, 1, 1, 1,
0.1975859, 0.1956358, 0.6144407, 1, 1, 1, 1, 1,
0.1977794, 0.4943988, 0.7781865, 1, 1, 1, 1, 1,
0.1981449, -0.5652317, 4.645479, 1, 1, 1, 1, 1,
0.1984631, -0.2083923, 0.3041961, 1, 1, 1, 1, 1,
0.1988068, 0.07178522, 1.127277, 1, 1, 1, 1, 1,
0.2024633, -0.01654336, 1.516965, 1, 1, 1, 1, 1,
0.2029959, 1.281565, 1.002664, 1, 1, 1, 1, 1,
0.2055765, -1.06553, 2.485137, 1, 1, 1, 1, 1,
0.2078777, -0.2827405, 1.317654, 0, 0, 1, 1, 1,
0.2102666, -1.201225, 1.387486, 1, 0, 0, 1, 1,
0.2129309, -0.8244887, 3.434829, 1, 0, 0, 1, 1,
0.2149646, -0.1682393, 3.261971, 1, 0, 0, 1, 1,
0.2312428, -1.177028, 2.129982, 1, 0, 0, 1, 1,
0.2331669, -2.093644, 3.084736, 1, 0, 0, 1, 1,
0.2353066, -0.6020709, 1.328889, 0, 0, 0, 1, 1,
0.2362012, 0.4189804, 1.653249, 0, 0, 0, 1, 1,
0.23863, -0.2666287, 3.386192, 0, 0, 0, 1, 1,
0.2418585, -0.8565733, 2.297013, 0, 0, 0, 1, 1,
0.2437206, 0.5044082, 1.663972, 0, 0, 0, 1, 1,
0.2458438, 0.9841697, 1.530342, 0, 0, 0, 1, 1,
0.2460024, 0.1378069, 0.096015, 0, 0, 0, 1, 1,
0.2493387, -0.6865191, 3.330748, 1, 1, 1, 1, 1,
0.2504093, 1.682123, -2.633002, 1, 1, 1, 1, 1,
0.2507589, 0.6980084, 0.5843985, 1, 1, 1, 1, 1,
0.2514065, -0.5988603, 4.419655, 1, 1, 1, 1, 1,
0.2614408, 0.06079267, 1.44493, 1, 1, 1, 1, 1,
0.2624907, -2.327264, 2.547582, 1, 1, 1, 1, 1,
0.2647545, -0.3155901, 2.323942, 1, 1, 1, 1, 1,
0.2654528, -0.2229003, 1.989031, 1, 1, 1, 1, 1,
0.2664322, -1.265955, 2.868887, 1, 1, 1, 1, 1,
0.2668014, 0.8282095, 1.801497, 1, 1, 1, 1, 1,
0.269216, -1.442316, 2.815565, 1, 1, 1, 1, 1,
0.2698037, -0.8801003, 2.412116, 1, 1, 1, 1, 1,
0.2799943, -0.5477061, 2.012122, 1, 1, 1, 1, 1,
0.2858571, -0.8560535, 3.023228, 1, 1, 1, 1, 1,
0.2872361, -0.5014164, 2.674149, 1, 1, 1, 1, 1,
0.2879837, 1.387771, 0.6747876, 0, 0, 1, 1, 1,
0.2900966, 0.6637958, 1.139192, 1, 0, 0, 1, 1,
0.2916187, -0.1736997, 2.45983, 1, 0, 0, 1, 1,
0.2920555, -0.7099084, 3.156376, 1, 0, 0, 1, 1,
0.2930407, 0.3197497, 0.3812806, 1, 0, 0, 1, 1,
0.2966091, 1.051904, -0.2211, 1, 0, 0, 1, 1,
0.2974901, 0.9037678, 0.8497143, 0, 0, 0, 1, 1,
0.2990996, -0.2352076, 2.945723, 0, 0, 0, 1, 1,
0.3000873, 0.65512, -1.014855, 0, 0, 0, 1, 1,
0.300922, -0.6243382, 1.86188, 0, 0, 0, 1, 1,
0.304373, 0.8378945, -0.01596375, 0, 0, 0, 1, 1,
0.3116134, 0.05743842, 2.325064, 0, 0, 0, 1, 1,
0.3148399, -0.01481078, 0.6664934, 0, 0, 0, 1, 1,
0.3161859, -0.1125736, 1.779873, 1, 1, 1, 1, 1,
0.3188608, -0.1423756, 1.026564, 1, 1, 1, 1, 1,
0.3191026, -1.554817, 1.939553, 1, 1, 1, 1, 1,
0.3232194, -0.6202294, 3.590576, 1, 1, 1, 1, 1,
0.3286053, -0.6604846, 2.609172, 1, 1, 1, 1, 1,
0.3361016, -0.1189988, 0.7302659, 1, 1, 1, 1, 1,
0.336713, 0.5660585, 1.943921, 1, 1, 1, 1, 1,
0.3401457, -0.7995556, 3.235835, 1, 1, 1, 1, 1,
0.34224, 1.014361, -0.4718494, 1, 1, 1, 1, 1,
0.3431827, -0.7958388, 2.281894, 1, 1, 1, 1, 1,
0.3573591, 0.2743718, 1.747383, 1, 1, 1, 1, 1,
0.3638315, 0.4093955, -0.9436888, 1, 1, 1, 1, 1,
0.3652377, -0.5802751, 3.332479, 1, 1, 1, 1, 1,
0.3685072, 0.8015662, 1.999725, 1, 1, 1, 1, 1,
0.3685139, 1.091993, -0.01428402, 1, 1, 1, 1, 1,
0.3686955, 0.6873804, -0.122918, 0, 0, 1, 1, 1,
0.3690548, -0.5976449, 3.751222, 1, 0, 0, 1, 1,
0.3701078, -1.040331, 3.25966, 1, 0, 0, 1, 1,
0.3710903, 1.065958, -0.06549895, 1, 0, 0, 1, 1,
0.3713752, -0.1673299, 0.9648216, 1, 0, 0, 1, 1,
0.3718569, 1.443245, 1.251626, 1, 0, 0, 1, 1,
0.3758367, -0.9474251, 3.705444, 0, 0, 0, 1, 1,
0.3788433, -1.314736, 3.099441, 0, 0, 0, 1, 1,
0.3798466, 0.03561797, 3.109547, 0, 0, 0, 1, 1,
0.3800261, -0.5216038, 2.57155, 0, 0, 0, 1, 1,
0.3809966, 0.6025104, 0.05053299, 0, 0, 0, 1, 1,
0.3815772, -0.02391875, 0.4935073, 0, 0, 0, 1, 1,
0.3836513, -1.63665, 3.606191, 0, 0, 0, 1, 1,
0.3843789, -0.9433943, 2.735736, 1, 1, 1, 1, 1,
0.3906941, -1.366671, 1.645917, 1, 1, 1, 1, 1,
0.3946926, 1.356289, 1.229589, 1, 1, 1, 1, 1,
0.3962093, 0.01453628, 0.5409995, 1, 1, 1, 1, 1,
0.4004741, 0.002468216, 1.885618, 1, 1, 1, 1, 1,
0.4008905, -1.205825, 2.852367, 1, 1, 1, 1, 1,
0.4027239, -0.2402388, 2.031593, 1, 1, 1, 1, 1,
0.4030299, -0.5303348, 3.174457, 1, 1, 1, 1, 1,
0.404824, 1.231321, 2.459867, 1, 1, 1, 1, 1,
0.4051152, -1.189214, 3.188483, 1, 1, 1, 1, 1,
0.4090253, -1.584902, 2.820807, 1, 1, 1, 1, 1,
0.4129055, 1.782462, 1.12162, 1, 1, 1, 1, 1,
0.4132162, 0.4526763, 1.144157, 1, 1, 1, 1, 1,
0.4135953, 1.521386, 1.153017, 1, 1, 1, 1, 1,
0.4155436, -0.9385222, 2.540419, 1, 1, 1, 1, 1,
0.423076, 1.796206, 1.040705, 0, 0, 1, 1, 1,
0.4231494, -1.309476, 2.452326, 1, 0, 0, 1, 1,
0.4255236, 0.2758112, 0.5518582, 1, 0, 0, 1, 1,
0.4304438, 0.5093191, 1.399829, 1, 0, 0, 1, 1,
0.4329319, 1.456289, -1.090847, 1, 0, 0, 1, 1,
0.4411942, 1.55824, 0.01969365, 1, 0, 0, 1, 1,
0.4418036, 1.018076, -0.646714, 0, 0, 0, 1, 1,
0.4431381, -0.06602608, 1.812147, 0, 0, 0, 1, 1,
0.4441569, 0.8890139, 1.862023, 0, 0, 0, 1, 1,
0.4451416, -0.9464422, 3.255235, 0, 0, 0, 1, 1,
0.4453807, -0.7327197, 3.081985, 0, 0, 0, 1, 1,
0.4479803, -2.07721, 4.390119, 0, 0, 0, 1, 1,
0.4481911, -1.293209, 3.720625, 0, 0, 0, 1, 1,
0.4487826, -0.7056961, 3.565098, 1, 1, 1, 1, 1,
0.4501906, 1.996034, 0.3795414, 1, 1, 1, 1, 1,
0.4506357, -0.9152964, 2.777178, 1, 1, 1, 1, 1,
0.4556812, -1.695053, 2.2176, 1, 1, 1, 1, 1,
0.4572494, -0.2664637, 2.592136, 1, 1, 1, 1, 1,
0.4684586, 0.7852622, 0.139029, 1, 1, 1, 1, 1,
0.4695114, 0.9069275, 1.448978, 1, 1, 1, 1, 1,
0.4704159, 0.8908048, 1.129263, 1, 1, 1, 1, 1,
0.4704899, -0.8532099, 2.968658, 1, 1, 1, 1, 1,
0.4852973, 0.08231922, -0.5779026, 1, 1, 1, 1, 1,
0.4925805, 0.3062169, 1.621117, 1, 1, 1, 1, 1,
0.4936045, 0.4176859, 1.515084, 1, 1, 1, 1, 1,
0.4944586, 0.394055, 0.4902924, 1, 1, 1, 1, 1,
0.4965036, -0.9760146, 2.609193, 1, 1, 1, 1, 1,
0.4983367, 1.660465, -0.374033, 1, 1, 1, 1, 1,
0.5097286, -1.41069, 0.8243079, 0, 0, 1, 1, 1,
0.5101581, -1.504001, 3.76916, 1, 0, 0, 1, 1,
0.510731, 0.3200679, 0.905784, 1, 0, 0, 1, 1,
0.5107901, -2.347973, 2.599174, 1, 0, 0, 1, 1,
0.5148762, 0.8923135, -1.873833, 1, 0, 0, 1, 1,
0.5162932, -1.528804, 1.625476, 1, 0, 0, 1, 1,
0.5163912, 0.1756596, 2.183611, 0, 0, 0, 1, 1,
0.5198295, 1.955723, -1.813653, 0, 0, 0, 1, 1,
0.5199485, -2.15043, 2.231651, 0, 0, 0, 1, 1,
0.5229734, -1.115299, 2.301101, 0, 0, 0, 1, 1,
0.5235987, -0.6319835, 3.451453, 0, 0, 0, 1, 1,
0.5287089, 0.03448545, 2.11322, 0, 0, 0, 1, 1,
0.5289163, -0.5051569, 0.7811437, 0, 0, 0, 1, 1,
0.5433465, -0.01618579, -1.191856, 1, 1, 1, 1, 1,
0.5440169, 1.265928, 0.6808093, 1, 1, 1, 1, 1,
0.5486571, 0.2596026, -0.1970022, 1, 1, 1, 1, 1,
0.5534793, -1.176861, 4.578668, 1, 1, 1, 1, 1,
0.5537634, -1.03078, 1.741505, 1, 1, 1, 1, 1,
0.5540779, 0.3360309, 1.191051, 1, 1, 1, 1, 1,
0.5551406, -0.06287752, 0.8451633, 1, 1, 1, 1, 1,
0.5617948, 1.029388, 1.24587, 1, 1, 1, 1, 1,
0.5642787, -0.494198, 1.078293, 1, 1, 1, 1, 1,
0.5645152, -1.215486, 0.8842183, 1, 1, 1, 1, 1,
0.5646646, 0.3845216, 0.250331, 1, 1, 1, 1, 1,
0.5668778, -0.3069166, 1.181485, 1, 1, 1, 1, 1,
0.5684946, -0.5557096, 2.941783, 1, 1, 1, 1, 1,
0.57363, 0.7230353, 0.1575076, 1, 1, 1, 1, 1,
0.5763944, 0.930961, 0.7947785, 1, 1, 1, 1, 1,
0.5772621, -0.5461717, 1.969398, 0, 0, 1, 1, 1,
0.5786359, -0.05340149, 1.112329, 1, 0, 0, 1, 1,
0.5802514, -0.5940345, 3.638166, 1, 0, 0, 1, 1,
0.5818498, -0.2597712, 2.549167, 1, 0, 0, 1, 1,
0.5844218, -0.5073508, 2.29144, 1, 0, 0, 1, 1,
0.5868756, 0.5018331, 0.9735041, 1, 0, 0, 1, 1,
0.5872586, -1.712534, 1.839467, 0, 0, 0, 1, 1,
0.5892889, 0.2853692, -0.05919941, 0, 0, 0, 1, 1,
0.590726, 1.329083, 1.150865, 0, 0, 0, 1, 1,
0.5953769, 0.09147564, 1.264307, 0, 0, 0, 1, 1,
0.5961656, 0.2091256, 0.341003, 0, 0, 0, 1, 1,
0.5975351, -0.3215509, 2.194257, 0, 0, 0, 1, 1,
0.5986958, 0.5596288, 0.3764724, 0, 0, 0, 1, 1,
0.6021858, -0.2745427, 0.2939121, 1, 1, 1, 1, 1,
0.603704, 0.6422002, 0.4300295, 1, 1, 1, 1, 1,
0.6044359, 0.4370396, 0.173965, 1, 1, 1, 1, 1,
0.6055791, -0.6892213, 2.253261, 1, 1, 1, 1, 1,
0.6146523, -0.08939938, 1.709497, 1, 1, 1, 1, 1,
0.6185766, -0.659288, 1.327355, 1, 1, 1, 1, 1,
0.6211888, 1.106789, -1.532607, 1, 1, 1, 1, 1,
0.6239873, 0.1614974, 0.003922622, 1, 1, 1, 1, 1,
0.6282623, -0.6273155, 3.914992, 1, 1, 1, 1, 1,
0.6291687, -1.091108, 4.164146, 1, 1, 1, 1, 1,
0.6329664, 1.443255, 0.7568442, 1, 1, 1, 1, 1,
0.6333458, 0.01292573, 0.910809, 1, 1, 1, 1, 1,
0.6423634, -0.7101873, 2.93569, 1, 1, 1, 1, 1,
0.6489896, 0.5135658, 2.594938, 1, 1, 1, 1, 1,
0.6546331, 0.3520801, 0.6864091, 1, 1, 1, 1, 1,
0.6579216, -0.336317, 0.8660396, 0, 0, 1, 1, 1,
0.6589271, 0.4734068, 0.8844164, 1, 0, 0, 1, 1,
0.6640602, -0.002800796, 2.269025, 1, 0, 0, 1, 1,
0.6668602, 1.197589, -0.919488, 1, 0, 0, 1, 1,
0.6674923, -0.2238059, 0.1686332, 1, 0, 0, 1, 1,
0.6676678, -2.484707, 3.000601, 1, 0, 0, 1, 1,
0.6713336, 0.1423039, -0.1118667, 0, 0, 0, 1, 1,
0.6722822, 1.709799, 1.454585, 0, 0, 0, 1, 1,
0.673468, -0.1287044, 1.105226, 0, 0, 0, 1, 1,
0.6752538, -0.006456153, 0.892815, 0, 0, 0, 1, 1,
0.677313, -1.918412, 0.9002782, 0, 0, 0, 1, 1,
0.6787972, 1.754556, -0.3978458, 0, 0, 0, 1, 1,
0.6812969, 1.794679, -0.6247713, 0, 0, 0, 1, 1,
0.682135, -0.03595181, 4.277612, 1, 1, 1, 1, 1,
0.6827537, 0.5154464, 0.7408037, 1, 1, 1, 1, 1,
0.6843237, 0.3557639, 0.4494399, 1, 1, 1, 1, 1,
0.6868742, 2.329358, -0.6673688, 1, 1, 1, 1, 1,
0.6886725, 0.9732339, -0.05579755, 1, 1, 1, 1, 1,
0.6888102, 0.5811504, -1.260929, 1, 1, 1, 1, 1,
0.6959654, -1.769782, 1.579496, 1, 1, 1, 1, 1,
0.6975838, 0.2670277, 0.1234866, 1, 1, 1, 1, 1,
0.69885, -0.8412892, 2.425661, 1, 1, 1, 1, 1,
0.700764, -0.4797438, 2.516714, 1, 1, 1, 1, 1,
0.7052521, 1.332315, -1.618348, 1, 1, 1, 1, 1,
0.7075988, 0.9462989, -1.197543, 1, 1, 1, 1, 1,
0.7115351, 0.2575231, 0.3010443, 1, 1, 1, 1, 1,
0.7141885, 0.5266536, 0.2680199, 1, 1, 1, 1, 1,
0.7167962, -0.4448446, 1.055555, 1, 1, 1, 1, 1,
0.7177151, 1.636449, 1.685815, 0, 0, 1, 1, 1,
0.720286, -0.5438646, 1.001411, 1, 0, 0, 1, 1,
0.7234029, 1.895823, 0.9821459, 1, 0, 0, 1, 1,
0.7253379, 1.348379, 0.2897402, 1, 0, 0, 1, 1,
0.729551, 0.05152634, 2.093439, 1, 0, 0, 1, 1,
0.7443389, 0.2692681, 0.9286491, 1, 0, 0, 1, 1,
0.7460858, -0.02193843, 0.5343905, 0, 0, 0, 1, 1,
0.7465712, -0.1122576, 1.233967, 0, 0, 0, 1, 1,
0.7492502, 1.488763, 1.206534, 0, 0, 0, 1, 1,
0.7493281, 0.523891, -1.220142, 0, 0, 0, 1, 1,
0.7494707, 0.8770754, 1.004194, 0, 0, 0, 1, 1,
0.7505985, 0.04797247, 0.2331361, 0, 0, 0, 1, 1,
0.7506256, -0.6537683, 3.527341, 0, 0, 0, 1, 1,
0.7516114, 1.616604, 0.5869102, 1, 1, 1, 1, 1,
0.7538148, 0.821036, 0.2304181, 1, 1, 1, 1, 1,
0.7552865, -1.21697, 1.269812, 1, 1, 1, 1, 1,
0.7562208, 0.5943106, 1.495978, 1, 1, 1, 1, 1,
0.7571867, 1.057613, -1.07238, 1, 1, 1, 1, 1,
0.7591661, 1.007484, 1.119886, 1, 1, 1, 1, 1,
0.7607798, -3.003081, 2.299847, 1, 1, 1, 1, 1,
0.7678089, 0.1529761, 0.3962635, 1, 1, 1, 1, 1,
0.7767664, 0.5446712, 1.434262, 1, 1, 1, 1, 1,
0.7792304, 0.2701759, 1.724412, 1, 1, 1, 1, 1,
0.7914827, -1.12389, 2.647518, 1, 1, 1, 1, 1,
0.7916935, -0.3228003, 1.939358, 1, 1, 1, 1, 1,
0.7918344, 0.1848744, 2.213768, 1, 1, 1, 1, 1,
0.7938979, -0.5921084, 2.640775, 1, 1, 1, 1, 1,
0.7963095, 0.5950476, 0.7781881, 1, 1, 1, 1, 1,
0.8030961, 1.096135, -1.723527, 0, 0, 1, 1, 1,
0.8043277, 0.8634117, 0.8261024, 1, 0, 0, 1, 1,
0.8066168, 2.387279, 0.7848893, 1, 0, 0, 1, 1,
0.8067227, 0.4984246, 1.537955, 1, 0, 0, 1, 1,
0.8121888, 1.114186, -0.005875567, 1, 0, 0, 1, 1,
0.819205, 0.5979897, 1.325391, 1, 0, 0, 1, 1,
0.8249294, 2.062416, 0.4205285, 0, 0, 0, 1, 1,
0.8311803, -0.424771, 1.402948, 0, 0, 0, 1, 1,
0.8335343, -0.9118452, 3.24534, 0, 0, 0, 1, 1,
0.8357111, -0.6762313, 2.210964, 0, 0, 0, 1, 1,
0.8433858, 0.6618775, -0.3888534, 0, 0, 0, 1, 1,
0.8434803, 1.151393, 0.9693242, 0, 0, 0, 1, 1,
0.8548205, -0.6477154, 2.435493, 0, 0, 0, 1, 1,
0.8581793, 0.2628829, 3.000682, 1, 1, 1, 1, 1,
0.8610802, 1.069935, 0.5061945, 1, 1, 1, 1, 1,
0.8626651, 0.4703533, 0.5585162, 1, 1, 1, 1, 1,
0.8638977, -0.4902976, 1.850652, 1, 1, 1, 1, 1,
0.8648182, -0.3967794, 2.400424, 1, 1, 1, 1, 1,
0.8670691, -0.1154319, 1.839929, 1, 1, 1, 1, 1,
0.872216, -1.314133, -1.235757, 1, 1, 1, 1, 1,
0.8735484, -1.656152, 2.753224, 1, 1, 1, 1, 1,
0.876089, -0.7038411, 1.623655, 1, 1, 1, 1, 1,
0.8787169, -0.9401988, 3.020831, 1, 1, 1, 1, 1,
0.8812249, -0.7945564, 2.498864, 1, 1, 1, 1, 1,
0.8846295, 1.439092, 0.8688592, 1, 1, 1, 1, 1,
0.8870916, 0.3608462, -0.004266296, 1, 1, 1, 1, 1,
0.8873385, 0.1375647, 1.769452, 1, 1, 1, 1, 1,
0.8899424, -1.3194, 2.205612, 1, 1, 1, 1, 1,
0.8910545, -0.5496893, 2.591988, 0, 0, 1, 1, 1,
0.8917233, 1.155258, 0.5786834, 1, 0, 0, 1, 1,
0.8918778, 0.05479379, 1.055286, 1, 0, 0, 1, 1,
0.9060666, 0.7320642, 0.7625102, 1, 0, 0, 1, 1,
0.9190625, -0.6262437, 2.544506, 1, 0, 0, 1, 1,
0.9200698, -0.922529, 1.14185, 1, 0, 0, 1, 1,
0.9269651, 1.513628, -1.016175, 0, 0, 0, 1, 1,
0.9337099, -0.2248672, 1.324862, 0, 0, 0, 1, 1,
0.9345003, -0.1853328, 2.164715, 0, 0, 0, 1, 1,
0.9385819, 0.09566626, 0.5647473, 0, 0, 0, 1, 1,
0.9401696, -2.362611, 2.73807, 0, 0, 0, 1, 1,
0.9428497, -0.4547336, 3.033652, 0, 0, 0, 1, 1,
0.9503804, 0.8608857, 2.652048, 0, 0, 0, 1, 1,
0.9633643, -0.612919, 0.4850157, 1, 1, 1, 1, 1,
0.9684978, 0.7006574, 0.8857654, 1, 1, 1, 1, 1,
0.9719816, 0.5274683, 0.7985536, 1, 1, 1, 1, 1,
0.9739001, -0.504674, 0.4229017, 1, 1, 1, 1, 1,
0.9785314, -0.9180231, 3.120404, 1, 1, 1, 1, 1,
0.9786264, -0.5496962, 1.760116, 1, 1, 1, 1, 1,
0.9846241, 1.018571, 1.653788, 1, 1, 1, 1, 1,
0.9891947, 0.91359, 1.153642, 1, 1, 1, 1, 1,
0.9909286, -1.28019, 0.6776212, 1, 1, 1, 1, 1,
0.9923829, 1.086252, 0.5586243, 1, 1, 1, 1, 1,
0.9930432, -0.4679733, 1.826603, 1, 1, 1, 1, 1,
1.001697, -0.1222339, 1.105209, 1, 1, 1, 1, 1,
1.004764, 0.3666201, -1.220983, 1, 1, 1, 1, 1,
1.006821, 1.34616, 0.6415161, 1, 1, 1, 1, 1,
1.007037, -1.011352, 2.783028, 1, 1, 1, 1, 1,
1.012167, -0.4497542, 3.262717, 0, 0, 1, 1, 1,
1.017137, -0.1782165, 0.5304917, 1, 0, 0, 1, 1,
1.017536, 1.247008, -1.15925, 1, 0, 0, 1, 1,
1.023561, 1.211937, -0.1850988, 1, 0, 0, 1, 1,
1.023586, -1.146583, 2.53655, 1, 0, 0, 1, 1,
1.023696, -0.751877, 2.556913, 1, 0, 0, 1, 1,
1.028211, 2.215168, 0.9913616, 0, 0, 0, 1, 1,
1.029144, -1.964567, 2.474548, 0, 0, 0, 1, 1,
1.037922, 1.022996, 1.59294, 0, 0, 0, 1, 1,
1.039284, -0.7023312, 1.956638, 0, 0, 0, 1, 1,
1.040654, -1.400309, 1.888945, 0, 0, 0, 1, 1,
1.043947, 1.421848, -0.647008, 0, 0, 0, 1, 1,
1.04511, -0.524105, 1.622816, 0, 0, 0, 1, 1,
1.049008, 1.771436, -0.9500104, 1, 1, 1, 1, 1,
1.050644, 1.581285, 0.6374779, 1, 1, 1, 1, 1,
1.053426, 0.9874677, 0.05389907, 1, 1, 1, 1, 1,
1.054337, -0.14844, 2.696534, 1, 1, 1, 1, 1,
1.063277, 0.6758855, 2.456543, 1, 1, 1, 1, 1,
1.073176, 0.7121176, 1.162752, 1, 1, 1, 1, 1,
1.075244, 2.158633, 1.053466, 1, 1, 1, 1, 1,
1.083109, -0.6594106, 1.885399, 1, 1, 1, 1, 1,
1.093974, -1.083501, 3.130478, 1, 1, 1, 1, 1,
1.094011, 0.1548173, 1.539747, 1, 1, 1, 1, 1,
1.097324, -0.2199924, 1.528511, 1, 1, 1, 1, 1,
1.107384, -0.845696, 3.027843, 1, 1, 1, 1, 1,
1.152043, 0.4256896, 1.279191, 1, 1, 1, 1, 1,
1.154909, 2.063479, 2.591821, 1, 1, 1, 1, 1,
1.158463, 0.3652031, 0.6110823, 1, 1, 1, 1, 1,
1.167119, 0.2999808, 1.880647, 0, 0, 1, 1, 1,
1.168287, -0.2501732, 3.216156, 1, 0, 0, 1, 1,
1.176679, 1.081789, 0.3980328, 1, 0, 0, 1, 1,
1.185792, 1.446767, 1.291841, 1, 0, 0, 1, 1,
1.191846, 0.5207509, 1.308633, 1, 0, 0, 1, 1,
1.19801, -1.767885, 1.614267, 1, 0, 0, 1, 1,
1.199117, 1.874008, 1.878902, 0, 0, 0, 1, 1,
1.204115, 1.658214, 0.6928441, 0, 0, 0, 1, 1,
1.217315, -1.302554, 4.982235, 0, 0, 0, 1, 1,
1.218496, -0.5711247, 2.390538, 0, 0, 0, 1, 1,
1.220684, -1.795467, 1.79645, 0, 0, 0, 1, 1,
1.223089, 1.000237, -1.169434, 0, 0, 0, 1, 1,
1.22714, -0.7411521, 1.774706, 0, 0, 0, 1, 1,
1.229521, 0.5759752, 1.956321, 1, 1, 1, 1, 1,
1.233932, -0.05369696, 1.268293, 1, 1, 1, 1, 1,
1.235753, 1.42424, 1.334799, 1, 1, 1, 1, 1,
1.23954, 0.4010416, 2.287009, 1, 1, 1, 1, 1,
1.255593, 0.09633075, 3.927393, 1, 1, 1, 1, 1,
1.259415, -0.7528915, 0.9506893, 1, 1, 1, 1, 1,
1.261095, 0.2755693, 3.349093, 1, 1, 1, 1, 1,
1.263935, -3.235751, 3.895596, 1, 1, 1, 1, 1,
1.268622, 0.645612, 1.350923, 1, 1, 1, 1, 1,
1.271227, 0.1028322, 1.083607, 1, 1, 1, 1, 1,
1.27447, 0.6034501, 2.324877, 1, 1, 1, 1, 1,
1.277441, -1.502276, 3.282074, 1, 1, 1, 1, 1,
1.285616, -0.3940188, 0.5899751, 1, 1, 1, 1, 1,
1.298821, 0.8624524, 1.385237, 1, 1, 1, 1, 1,
1.303112, 0.2141055, 1.72905, 1, 1, 1, 1, 1,
1.303947, -1.42708, 1.926943, 0, 0, 1, 1, 1,
1.312492, -0.2506137, 3.55198, 1, 0, 0, 1, 1,
1.317431, -0.1595501, 1.499782, 1, 0, 0, 1, 1,
1.321242, 0.9133815, 0.6479741, 1, 0, 0, 1, 1,
1.32453, 0.7902489, 0.4819073, 1, 0, 0, 1, 1,
1.346403, -0.2573432, 0.6488261, 1, 0, 0, 1, 1,
1.356085, 1.309487, 0.8944139, 0, 0, 0, 1, 1,
1.357085, -0.6263521, 1.149988, 0, 0, 0, 1, 1,
1.357845, -0.3551026, 2.868993, 0, 0, 0, 1, 1,
1.361473, 0.4062743, 0.8351973, 0, 0, 0, 1, 1,
1.365126, -1.048184, 3.241797, 0, 0, 0, 1, 1,
1.370839, -1.107285, 1.631017, 0, 0, 0, 1, 1,
1.38075, -0.3452435, 1.007904, 0, 0, 0, 1, 1,
1.394698, -3.3162, 2.600317, 1, 1, 1, 1, 1,
1.412427, 0.2251894, 0.04544719, 1, 1, 1, 1, 1,
1.424031, 1.437325, 0.006726804, 1, 1, 1, 1, 1,
1.433486, -0.1661841, 0.5403626, 1, 1, 1, 1, 1,
1.456795, 0.8795723, 1.384793, 1, 1, 1, 1, 1,
1.458543, -0.9385329, 0.4441943, 1, 1, 1, 1, 1,
1.460853, -0.1665055, 2.057017, 1, 1, 1, 1, 1,
1.460947, -0.4313838, 1.40728, 1, 1, 1, 1, 1,
1.463541, 0.4028157, 3.454391, 1, 1, 1, 1, 1,
1.465323, -1.263451, 3.61924, 1, 1, 1, 1, 1,
1.466738, 0.8624834, 1.322682, 1, 1, 1, 1, 1,
1.469626, 1.654818, 0.9916226, 1, 1, 1, 1, 1,
1.47542, 0.923773, 0.333513, 1, 1, 1, 1, 1,
1.476655, -1.321195, 3.046455, 1, 1, 1, 1, 1,
1.482336, 0.4573951, 2.18712, 1, 1, 1, 1, 1,
1.486432, -0.3356699, 1.733577, 0, 0, 1, 1, 1,
1.488289, 0.2071036, 0.4445925, 1, 0, 0, 1, 1,
1.493054, 0.5530779, 0.4980509, 1, 0, 0, 1, 1,
1.496136, -0.6738183, 1.107265, 1, 0, 0, 1, 1,
1.515845, 0.5118413, 0.3862439, 1, 0, 0, 1, 1,
1.518663, -0.2276186, 3.615244, 1, 0, 0, 1, 1,
1.521258, -0.524248, 2.175427, 0, 0, 0, 1, 1,
1.527725, 2.151327, 1.862506, 0, 0, 0, 1, 1,
1.528334, 0.2464426, 0.8910457, 0, 0, 0, 1, 1,
1.534299, 0.5098321, 0.3993966, 0, 0, 0, 1, 1,
1.549606, -0.5911536, 2.042424, 0, 0, 0, 1, 1,
1.585383, 0.9099463, 1.151532, 0, 0, 0, 1, 1,
1.586152, -0.2689359, 2.088258, 0, 0, 0, 1, 1,
1.588908, 1.53352, 0.131226, 1, 1, 1, 1, 1,
1.598024, 0.1884153, 1.635331, 1, 1, 1, 1, 1,
1.598286, -1.151218, 2.437931, 1, 1, 1, 1, 1,
1.599138, -0.306913, 2.064589, 1, 1, 1, 1, 1,
1.600327, -0.8447908, 1.426203, 1, 1, 1, 1, 1,
1.602741, 0.6690276, 1.163503, 1, 1, 1, 1, 1,
1.604377, -1.835441, 3.248337, 1, 1, 1, 1, 1,
1.607865, -1.158193, 1.024265, 1, 1, 1, 1, 1,
1.608742, -0.3027586, 0.8685735, 1, 1, 1, 1, 1,
1.611228, -0.5030367, 0.5029801, 1, 1, 1, 1, 1,
1.616935, -0.1669127, 2.229791, 1, 1, 1, 1, 1,
1.645625, -0.2859168, 1.564985, 1, 1, 1, 1, 1,
1.671957, -0.01578248, -0.5348631, 1, 1, 1, 1, 1,
1.679428, 0.9093419, 0.3656811, 1, 1, 1, 1, 1,
1.680401, 1.179051, 2.565066, 1, 1, 1, 1, 1,
1.692209, 0.1059291, 1.45931, 0, 0, 1, 1, 1,
1.693787, 1.277437, 2.591193, 1, 0, 0, 1, 1,
1.694691, 0.7041339, 0.7409921, 1, 0, 0, 1, 1,
1.695656, -2.019192, 3.561582, 1, 0, 0, 1, 1,
1.714178, 0.1318975, 1.664738, 1, 0, 0, 1, 1,
1.719116, 0.5635059, -0.1963784, 1, 0, 0, 1, 1,
1.720292, 0.04785154, 0.3647535, 0, 0, 0, 1, 1,
1.726912, -0.15134, 1.464355, 0, 0, 0, 1, 1,
1.760875, -0.6450005, 1.250009, 0, 0, 0, 1, 1,
1.77032, 1.752648, 0.07580053, 0, 0, 0, 1, 1,
1.773619, 1.065344, 0.9817338, 0, 0, 0, 1, 1,
1.797136, 0.5244874, 0.7999454, 0, 0, 0, 1, 1,
1.811629, 1.292448, 2.145531, 0, 0, 0, 1, 1,
1.82444, -1.853339, 0.9170815, 1, 1, 1, 1, 1,
1.832477, 1.044101, 1.690756, 1, 1, 1, 1, 1,
1.839915, 0.6280004, 0.8998336, 1, 1, 1, 1, 1,
1.86436, -0.6368191, 3.257972, 1, 1, 1, 1, 1,
1.8957, -0.3535419, 0.2586761, 1, 1, 1, 1, 1,
1.898594, 1.643826, -0.2151576, 1, 1, 1, 1, 1,
1.910004, 0.1811234, -0.5467445, 1, 1, 1, 1, 1,
1.928724, -0.4691152, 1.342825, 1, 1, 1, 1, 1,
1.961216, 0.3857653, -0.9327064, 1, 1, 1, 1, 1,
1.962383, 0.391693, 1.206761, 1, 1, 1, 1, 1,
1.967126, -0.7533146, 1.42785, 1, 1, 1, 1, 1,
1.981923, -0.7268168, 2.136118, 1, 1, 1, 1, 1,
2.008121, -0.5426829, 1.871973, 1, 1, 1, 1, 1,
2.020217, 0.6570516, 2.393021, 1, 1, 1, 1, 1,
2.054318, -1.514502, 2.612869, 1, 1, 1, 1, 1,
2.072177, 1.14485, 0.642234, 0, 0, 1, 1, 1,
2.07527, -0.7470431, 1.334018, 1, 0, 0, 1, 1,
2.135303, 1.597309, 1.609391, 1, 0, 0, 1, 1,
2.137424, -1.614442, 2.488553, 1, 0, 0, 1, 1,
2.138872, 0.7051505, 2.538479, 1, 0, 0, 1, 1,
2.220148, 0.3732945, 1.624623, 1, 0, 0, 1, 1,
2.250322, 0.733825, 3.544952, 0, 0, 0, 1, 1,
2.251639, 1.238817, 1.067668, 0, 0, 0, 1, 1,
2.264921, 0.3625416, 0.1117121, 0, 0, 0, 1, 1,
2.26761, 1.039978, 0.3319856, 0, 0, 0, 1, 1,
2.304199, -0.6173937, 2.662983, 0, 0, 0, 1, 1,
2.342562, -0.8778869, 1.372428, 0, 0, 0, 1, 1,
2.44933, -0.4005337, 0.6116158, 0, 0, 0, 1, 1,
2.464179, -0.8281986, 2.944238, 1, 1, 1, 1, 1,
2.594151, -2.021839, 3.128775, 1, 1, 1, 1, 1,
2.63355, -0.9298909, 2.482279, 1, 1, 1, 1, 1,
2.959424, 0.6007352, 1.548873, 1, 1, 1, 1, 1,
2.975457, -0.9068898, 3.123447, 1, 1, 1, 1, 1,
3.330172, -0.2163562, -0.5964656, 1, 1, 1, 1, 1,
3.48024, 0.7049913, 1.163463, 1, 1, 1, 1, 1
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
var radius = 9.602669;
var distance = 33.72897;
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
mvMatrix.translate( -0.2621208, 0.1031115, -0.09090519 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.72897);
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