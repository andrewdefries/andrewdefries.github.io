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
-2.894757, 0.7459024, -0.5724412, 1, 0, 0, 1,
-2.8733, 0.2803419, -1.823394, 1, 0.007843138, 0, 1,
-2.832841, -0.7798239, -2.349284, 1, 0.01176471, 0, 1,
-2.683345, -0.6930681, -2.714702, 1, 0.01960784, 0, 1,
-2.598267, 0.406211, -1.006761, 1, 0.02352941, 0, 1,
-2.531062, 2.029441, -0.6082416, 1, 0.03137255, 0, 1,
-2.480005, -0.3741917, -0.9941136, 1, 0.03529412, 0, 1,
-2.416996, -0.857358, -0.20673, 1, 0.04313726, 0, 1,
-2.391422, 0.526797, -1.244871, 1, 0.04705882, 0, 1,
-2.31137, 0.3497344, -1.828994, 1, 0.05490196, 0, 1,
-2.310295, -0.2312045, -2.076791, 1, 0.05882353, 0, 1,
-2.259167, -0.7835427, 2.679095, 1, 0.06666667, 0, 1,
-2.225943, -0.05231408, -3.803039, 1, 0.07058824, 0, 1,
-2.221044, -0.6497321, -0.5455516, 1, 0.07843138, 0, 1,
-2.162582, 0.08470208, -1.701429, 1, 0.08235294, 0, 1,
-2.151244, 0.1371319, -2.436608, 1, 0.09019608, 0, 1,
-2.142824, -0.5512531, -2.126463, 1, 0.09411765, 0, 1,
-2.139577, 0.3371807, -2.354148, 1, 0.1019608, 0, 1,
-2.136048, 0.1083421, -2.512099, 1, 0.1098039, 0, 1,
-2.094885, 0.01685348, -0.836166, 1, 0.1137255, 0, 1,
-2.085649, 2.113966, -1.898885, 1, 0.1215686, 0, 1,
-2.033642, 1.84245, -0.03162649, 1, 0.1254902, 0, 1,
-2.022901, -2.830627, -1.815092, 1, 0.1333333, 0, 1,
-2.010437, -1.435412, -3.926453, 1, 0.1372549, 0, 1,
-1.99273, 0.2660559, -1.815154, 1, 0.145098, 0, 1,
-1.9863, 0.4040142, -2.542769, 1, 0.1490196, 0, 1,
-1.977831, -0.489767, -1.540216, 1, 0.1568628, 0, 1,
-1.97738, 0.2297251, -0.6867401, 1, 0.1607843, 0, 1,
-1.96922, 0.0441981, -1.117147, 1, 0.1686275, 0, 1,
-1.969161, 0.5903246, -2.892826, 1, 0.172549, 0, 1,
-1.955013, -1.263871, -1.331427, 1, 0.1803922, 0, 1,
-1.942645, 0.4162265, -1.603613, 1, 0.1843137, 0, 1,
-1.923034, 1.695753, -0.9436549, 1, 0.1921569, 0, 1,
-1.879193, -0.157903, -1.621342, 1, 0.1960784, 0, 1,
-1.868182, -0.5048711, 0.3505397, 1, 0.2039216, 0, 1,
-1.865469, 0.06294829, -1.705692, 1, 0.2117647, 0, 1,
-1.847951, 0.8156589, -1.715284, 1, 0.2156863, 0, 1,
-1.832, -0.02130758, -1.841781, 1, 0.2235294, 0, 1,
-1.830763, -1.045126, -2.31288, 1, 0.227451, 0, 1,
-1.795857, 1.021131, -0.9493835, 1, 0.2352941, 0, 1,
-1.780415, 1.914076, -0.7973491, 1, 0.2392157, 0, 1,
-1.754679, -0.6897758, -2.09779, 1, 0.2470588, 0, 1,
-1.751711, 0.8834682, -0.4256149, 1, 0.2509804, 0, 1,
-1.751283, -2.04608, -0.2687474, 1, 0.2588235, 0, 1,
-1.748037, 1.192023, -1.100833, 1, 0.2627451, 0, 1,
-1.742707, -0.09497365, -2.005521, 1, 0.2705882, 0, 1,
-1.731132, -1.117205, -2.51414, 1, 0.2745098, 0, 1,
-1.716599, 1.19072, -1.962764, 1, 0.282353, 0, 1,
-1.711828, 0.2664337, -3.062891, 1, 0.2862745, 0, 1,
-1.700826, 1.358549, -1.062632, 1, 0.2941177, 0, 1,
-1.699145, -1.246914, -2.759353, 1, 0.3019608, 0, 1,
-1.690995, -0.5888577, -2.120316, 1, 0.3058824, 0, 1,
-1.688939, 0.349346, -2.440301, 1, 0.3137255, 0, 1,
-1.628619, -0.1801897, -1.476824, 1, 0.3176471, 0, 1,
-1.623748, -0.4190001, -1.548004, 1, 0.3254902, 0, 1,
-1.620208, 1.558389, 0.3812526, 1, 0.3294118, 0, 1,
-1.617118, -1.07821, -2.205254, 1, 0.3372549, 0, 1,
-1.614211, -0.830928, -0.7870718, 1, 0.3411765, 0, 1,
-1.60466, 0.5099836, -0.1596337, 1, 0.3490196, 0, 1,
-1.603237, 0.1519572, -0.09383605, 1, 0.3529412, 0, 1,
-1.602121, -0.8127089, -2.085074, 1, 0.3607843, 0, 1,
-1.598197, -0.5777416, -0.9350263, 1, 0.3647059, 0, 1,
-1.597712, -1.9756, -2.139621, 1, 0.372549, 0, 1,
-1.59707, -1.070795, -2.369986, 1, 0.3764706, 0, 1,
-1.594856, 0.2514974, -0.9936794, 1, 0.3843137, 0, 1,
-1.58745, 1.144366, -1.951829, 1, 0.3882353, 0, 1,
-1.578299, 0.8926831, -0.3191547, 1, 0.3960784, 0, 1,
-1.561666, -0.1735706, -2.104172, 1, 0.4039216, 0, 1,
-1.559841, -0.8745108, -0.612305, 1, 0.4078431, 0, 1,
-1.558025, 0.2139511, -1.924969, 1, 0.4156863, 0, 1,
-1.546136, 1.949434, -2.373059, 1, 0.4196078, 0, 1,
-1.542208, -0.5616904, -0.3614869, 1, 0.427451, 0, 1,
-1.529331, -1.359208, -3.898703, 1, 0.4313726, 0, 1,
-1.527132, 0.2121486, -1.096385, 1, 0.4392157, 0, 1,
-1.510038, -1.106447, -2.881414, 1, 0.4431373, 0, 1,
-1.497343, -0.393479, -1.942738, 1, 0.4509804, 0, 1,
-1.486867, -0.4328432, -0.7689036, 1, 0.454902, 0, 1,
-1.474232, -3.165664, -1.602138, 1, 0.4627451, 0, 1,
-1.466374, -0.9606276, -1.636399, 1, 0.4666667, 0, 1,
-1.464985, 0.5221624, -1.069024, 1, 0.4745098, 0, 1,
-1.458993, 1.404818, -1.452546, 1, 0.4784314, 0, 1,
-1.451836, -0.4764859, -0.01585685, 1, 0.4862745, 0, 1,
-1.451088, -0.6721739, -1.775318, 1, 0.4901961, 0, 1,
-1.445523, -0.07248789, 0.3021226, 1, 0.4980392, 0, 1,
-1.445045, -1.785486, -1.672756, 1, 0.5058824, 0, 1,
-1.421696, 0.3074514, -1.17513, 1, 0.509804, 0, 1,
-1.410553, 1.773418, -1.61174, 1, 0.5176471, 0, 1,
-1.408779, 0.4718866, -0.5154049, 1, 0.5215687, 0, 1,
-1.406089, -0.315033, -2.150126, 1, 0.5294118, 0, 1,
-1.402063, 0.729213, -1.134636, 1, 0.5333334, 0, 1,
-1.394507, 0.2587464, -2.397044, 1, 0.5411765, 0, 1,
-1.385755, 1.392348, -1.399077, 1, 0.5450981, 0, 1,
-1.368715, -1.559034, -3.792877, 1, 0.5529412, 0, 1,
-1.366948, 0.292291, -1.189028, 1, 0.5568628, 0, 1,
-1.360505, -0.8234665, -2.541791, 1, 0.5647059, 0, 1,
-1.358778, 1.562868, -1.065174, 1, 0.5686275, 0, 1,
-1.354645, -0.09534811, -1.04908, 1, 0.5764706, 0, 1,
-1.34812, 0.4805573, 0.8012981, 1, 0.5803922, 0, 1,
-1.347333, 1.205029, -1.059306, 1, 0.5882353, 0, 1,
-1.337434, -0.9147375, -1.408836, 1, 0.5921569, 0, 1,
-1.332715, 0.3862707, -3.028256, 1, 0.6, 0, 1,
-1.330522, -1.946936, -1.714652, 1, 0.6078432, 0, 1,
-1.315575, 0.1468333, -2.530628, 1, 0.6117647, 0, 1,
-1.314981, -0.9278831, -2.60649, 1, 0.6196079, 0, 1,
-1.301666, -0.3479452, -2.42251, 1, 0.6235294, 0, 1,
-1.297998, 0.8789364, -0.1718077, 1, 0.6313726, 0, 1,
-1.295993, 1.700388, -1.424777, 1, 0.6352941, 0, 1,
-1.28998, -0.2240443, -0.5484263, 1, 0.6431373, 0, 1,
-1.284981, -2.556094, -3.176259, 1, 0.6470588, 0, 1,
-1.281816, 0.7717443, -1.595134, 1, 0.654902, 0, 1,
-1.280156, -0.5832948, -3.451921, 1, 0.6588235, 0, 1,
-1.277067, -0.6101744, -2.312405, 1, 0.6666667, 0, 1,
-1.273118, 0.1249919, -0.6817199, 1, 0.6705883, 0, 1,
-1.253466, -0.6025943, -1.482486, 1, 0.6784314, 0, 1,
-1.244776, 0.6208825, 0.6006795, 1, 0.682353, 0, 1,
-1.243978, -0.002564994, -1.095389, 1, 0.6901961, 0, 1,
-1.237311, 3.545102, -0.699727, 1, 0.6941177, 0, 1,
-1.226296, 1.743025, -0.4717461, 1, 0.7019608, 0, 1,
-1.224863, 2.327537, -1.445389, 1, 0.7098039, 0, 1,
-1.222983, 0.4656306, -2.15064, 1, 0.7137255, 0, 1,
-1.222506, 0.7560263, -1.622331, 1, 0.7215686, 0, 1,
-1.219621, -2.024995, -3.132432, 1, 0.7254902, 0, 1,
-1.205025, -0.1599021, -1.866348, 1, 0.7333333, 0, 1,
-1.200641, -1.199541, -2.562358, 1, 0.7372549, 0, 1,
-1.199796, 0.887601, -0.4924202, 1, 0.7450981, 0, 1,
-1.199689, -0.1641215, -1.865797, 1, 0.7490196, 0, 1,
-1.198098, -0.5665407, -0.8286593, 1, 0.7568628, 0, 1,
-1.189744, -0.4493862, -1.246816, 1, 0.7607843, 0, 1,
-1.187744, -0.7299484, -2.302294, 1, 0.7686275, 0, 1,
-1.186217, -0.5839754, -3.678534, 1, 0.772549, 0, 1,
-1.185793, -1.087636, -3.408332, 1, 0.7803922, 0, 1,
-1.182454, 1.708976, -3.095634, 1, 0.7843137, 0, 1,
-1.182227, 1.07282, -0.9381821, 1, 0.7921569, 0, 1,
-1.18202, -1.128902, -3.289022, 1, 0.7960784, 0, 1,
-1.180759, 0.4893633, -0.0951042, 1, 0.8039216, 0, 1,
-1.178747, 1.579312, -1.830724, 1, 0.8117647, 0, 1,
-1.174712, 0.3147897, -0.1865601, 1, 0.8156863, 0, 1,
-1.160094, -0.2502391, -1.707873, 1, 0.8235294, 0, 1,
-1.159883, -0.7391183, -2.455335, 1, 0.827451, 0, 1,
-1.156524, -0.1102743, 0.452305, 1, 0.8352941, 0, 1,
-1.152438, 0.5850275, -1.382297, 1, 0.8392157, 0, 1,
-1.152009, 0.5861657, 0.3848846, 1, 0.8470588, 0, 1,
-1.147781, 2.974478, -0.4624147, 1, 0.8509804, 0, 1,
-1.139447, 1.768262, 0.5391238, 1, 0.8588235, 0, 1,
-1.138209, 1.501583, -0.6092498, 1, 0.8627451, 0, 1,
-1.132799, 0.6597316, -1.708543, 1, 0.8705882, 0, 1,
-1.12866, -0.3476448, -2.72859, 1, 0.8745098, 0, 1,
-1.12259, 0.4281088, 0.1091817, 1, 0.8823529, 0, 1,
-1.121863, 0.1131476, -2.121404, 1, 0.8862745, 0, 1,
-1.105677, -2.683963, -1.785218, 1, 0.8941177, 0, 1,
-1.101265, 0.3680573, -2.039876, 1, 0.8980392, 0, 1,
-1.098634, 0.1310856, -1.004259, 1, 0.9058824, 0, 1,
-1.095053, -0.1319439, 0.331244, 1, 0.9137255, 0, 1,
-1.095005, -0.7551646, -4.478099, 1, 0.9176471, 0, 1,
-1.093302, 1.135347, -1.202971, 1, 0.9254902, 0, 1,
-1.085902, -0.1113632, -1.65564, 1, 0.9294118, 0, 1,
-1.085588, -0.4676005, -0.6109617, 1, 0.9372549, 0, 1,
-1.079522, 0.4968563, -0.03785411, 1, 0.9411765, 0, 1,
-1.058969, 0.2833575, -0.8406937, 1, 0.9490196, 0, 1,
-1.056807, -2.40104, -2.165281, 1, 0.9529412, 0, 1,
-1.049833, -0.4858415, -1.422148, 1, 0.9607843, 0, 1,
-1.041165, 0.2730728, -2.101113, 1, 0.9647059, 0, 1,
-1.034914, 0.6997524, -0.02065637, 1, 0.972549, 0, 1,
-1.033576, -0.4157406, -3.603469, 1, 0.9764706, 0, 1,
-1.00095, -1.527288, -1.52908, 1, 0.9843137, 0, 1,
-0.9999528, 1.84863, -0.4631524, 1, 0.9882353, 0, 1,
-0.9988141, -1.06965, -2.333653, 1, 0.9960784, 0, 1,
-0.9964492, -0.1430675, -2.091155, 0.9960784, 1, 0, 1,
-0.9872679, -1.296149, -1.765064, 0.9921569, 1, 0, 1,
-0.9871933, 1.405529, -0.5644648, 0.9843137, 1, 0, 1,
-0.9836017, -1.611976, -4.649096, 0.9803922, 1, 0, 1,
-0.9816626, -0.802509, -3.113127, 0.972549, 1, 0, 1,
-0.9790769, -0.6542265, -3.240411, 0.9686275, 1, 0, 1,
-0.9748489, -0.7845478, -2.119082, 0.9607843, 1, 0, 1,
-0.9728226, -2.66359, -4.986399, 0.9568627, 1, 0, 1,
-0.9645146, -1.624094, -4.274305, 0.9490196, 1, 0, 1,
-0.962796, -0.7942528, -4.011284, 0.945098, 1, 0, 1,
-0.9627904, -0.353446, -0.8264431, 0.9372549, 1, 0, 1,
-0.9599589, -0.1473524, -2.111206, 0.9333333, 1, 0, 1,
-0.9532628, -0.2069516, -2.99024, 0.9254902, 1, 0, 1,
-0.95274, 0.1967398, -0.8177954, 0.9215686, 1, 0, 1,
-0.9507802, 0.8489842, -1.264537, 0.9137255, 1, 0, 1,
-0.9494042, 1.272524, -1.74602, 0.9098039, 1, 0, 1,
-0.9443547, -0.9373676, -1.134153, 0.9019608, 1, 0, 1,
-0.9401402, 0.1208315, -0.9653167, 0.8941177, 1, 0, 1,
-0.923029, -1.436278, -1.558407, 0.8901961, 1, 0, 1,
-0.9220262, -0.1275022, -2.64435, 0.8823529, 1, 0, 1,
-0.9188785, -1.623354, -2.29898, 0.8784314, 1, 0, 1,
-0.9177451, 0.8168389, -0.1008238, 0.8705882, 1, 0, 1,
-0.9177158, -0.2208176, -1.084378, 0.8666667, 1, 0, 1,
-0.9131181, -0.236586, -1.943309, 0.8588235, 1, 0, 1,
-0.8856392, -0.2669373, -2.343397, 0.854902, 1, 0, 1,
-0.8853118, 0.045365, -1.285504, 0.8470588, 1, 0, 1,
-0.8845335, -0.6628986, -2.816468, 0.8431373, 1, 0, 1,
-0.8842058, -1.499301, -2.343152, 0.8352941, 1, 0, 1,
-0.8830696, -1.45535, -3.290721, 0.8313726, 1, 0, 1,
-0.8795837, -0.3223672, -3.916987, 0.8235294, 1, 0, 1,
-0.8771322, -1.219744, -1.749095, 0.8196079, 1, 0, 1,
-0.8745478, 0.8409696, 0.2369917, 0.8117647, 1, 0, 1,
-0.874254, 0.3054646, -2.211345, 0.8078431, 1, 0, 1,
-0.8732347, -1.150503, -2.361502, 0.8, 1, 0, 1,
-0.8562852, -0.604309, -1.182292, 0.7921569, 1, 0, 1,
-0.8498839, 0.6629973, -0.2236717, 0.7882353, 1, 0, 1,
-0.8495134, -1.477109, -5.019498, 0.7803922, 1, 0, 1,
-0.8459988, -0.6460198, -2.321223, 0.7764706, 1, 0, 1,
-0.8450226, 0.1225341, -1.977016, 0.7686275, 1, 0, 1,
-0.8435466, 0.9764093, -0.7287447, 0.7647059, 1, 0, 1,
-0.8383963, -1.613653, -2.341683, 0.7568628, 1, 0, 1,
-0.8312569, -1.351907, -2.29643, 0.7529412, 1, 0, 1,
-0.8246055, 1.515319, -0.1360468, 0.7450981, 1, 0, 1,
-0.81917, -1.142717, -2.87539, 0.7411765, 1, 0, 1,
-0.8135684, 0.8210965, -0.3351685, 0.7333333, 1, 0, 1,
-0.8118777, 0.3988737, -1.181976, 0.7294118, 1, 0, 1,
-0.8028724, -0.5285282, -2.408627, 0.7215686, 1, 0, 1,
-0.7892919, 1.12312, -1.4763, 0.7176471, 1, 0, 1,
-0.7862761, 1.046755, -0.1386575, 0.7098039, 1, 0, 1,
-0.7836436, 0.8147084, 0.3822872, 0.7058824, 1, 0, 1,
-0.7651331, -1.385658, -1.111938, 0.6980392, 1, 0, 1,
-0.7650261, 0.1577307, -0.6475987, 0.6901961, 1, 0, 1,
-0.764225, -0.3514319, -1.496118, 0.6862745, 1, 0, 1,
-0.7629911, 1.151182, 0.4241513, 0.6784314, 1, 0, 1,
-0.7527739, 0.2634666, -0.4552182, 0.6745098, 1, 0, 1,
-0.7517862, 0.9416302, -0.997125, 0.6666667, 1, 0, 1,
-0.7491724, 0.4177132, -0.7580246, 0.6627451, 1, 0, 1,
-0.7443693, 0.2084204, -0.3218691, 0.654902, 1, 0, 1,
-0.7411125, -0.3740689, -2.062726, 0.6509804, 1, 0, 1,
-0.7405546, 0.221277, 0.3559176, 0.6431373, 1, 0, 1,
-0.7402094, -0.860183, -2.040316, 0.6392157, 1, 0, 1,
-0.7321728, -0.97421, -3.243086, 0.6313726, 1, 0, 1,
-0.7304392, -0.4036143, -2.215365, 0.627451, 1, 0, 1,
-0.7274996, -0.9664742, -3.750124, 0.6196079, 1, 0, 1,
-0.7272713, 0.2962663, 0.698291, 0.6156863, 1, 0, 1,
-0.7239006, -0.4564019, -2.640346, 0.6078432, 1, 0, 1,
-0.7214824, 1.106066, -0.2242006, 0.6039216, 1, 0, 1,
-0.7161849, -0.937869, -1.714925, 0.5960785, 1, 0, 1,
-0.7146037, -1.386192, -3.295631, 0.5882353, 1, 0, 1,
-0.7088298, 1.458066, -1.436681, 0.5843138, 1, 0, 1,
-0.7072742, 0.8548254, 1.952431, 0.5764706, 1, 0, 1,
-0.7003936, 0.2689668, -0.3245805, 0.572549, 1, 0, 1,
-0.7000131, 3.119959, -1.237386, 0.5647059, 1, 0, 1,
-0.698508, -0.8408341, -2.139501, 0.5607843, 1, 0, 1,
-0.69835, -1.457404, -2.097916, 0.5529412, 1, 0, 1,
-0.6973907, 1.015688, -0.1412765, 0.5490196, 1, 0, 1,
-0.6934772, 0.3162998, -0.7408493, 0.5411765, 1, 0, 1,
-0.6929303, 0.8420348, -0.1936565, 0.5372549, 1, 0, 1,
-0.691662, 0.7697505, 0.160175, 0.5294118, 1, 0, 1,
-0.6888587, 0.1931229, 0.8019528, 0.5254902, 1, 0, 1,
-0.6855417, -0.05278732, -0.284227, 0.5176471, 1, 0, 1,
-0.679152, 1.646016, 0.8649387, 0.5137255, 1, 0, 1,
-0.6778679, -0.8209798, -3.265895, 0.5058824, 1, 0, 1,
-0.66717, 0.8305507, -1.183258, 0.5019608, 1, 0, 1,
-0.6623881, 0.703954, -1.562673, 0.4941176, 1, 0, 1,
-0.6568532, 1.545962, -0.2890243, 0.4862745, 1, 0, 1,
-0.6564671, -0.653915, -0.2777511, 0.4823529, 1, 0, 1,
-0.6559485, 1.272198, 0.4146725, 0.4745098, 1, 0, 1,
-0.6555637, -0.03658746, -0.6233325, 0.4705882, 1, 0, 1,
-0.6529291, -0.5977737, -1.050382, 0.4627451, 1, 0, 1,
-0.6365091, 0.05877659, -0.921688, 0.4588235, 1, 0, 1,
-0.6320545, -0.1324087, -0.1129679, 0.4509804, 1, 0, 1,
-0.6189494, -0.467999, -1.063254, 0.4470588, 1, 0, 1,
-0.6188086, 1.74068, -0.8001992, 0.4392157, 1, 0, 1,
-0.6131996, -0.1797261, -0.4201672, 0.4352941, 1, 0, 1,
-0.61251, -0.3202635, -2.04879, 0.427451, 1, 0, 1,
-0.6062893, 0.5686957, -0.5161798, 0.4235294, 1, 0, 1,
-0.6061949, -0.8688251, -2.82435, 0.4156863, 1, 0, 1,
-0.6055958, -0.6855878, -2.865881, 0.4117647, 1, 0, 1,
-0.6024107, 0.3961882, 0.1800262, 0.4039216, 1, 0, 1,
-0.5899477, -2.575022, -4.032983, 0.3960784, 1, 0, 1,
-0.5809663, -1.550352, -1.91813, 0.3921569, 1, 0, 1,
-0.5761684, 0.5049779, -1.759274, 0.3843137, 1, 0, 1,
-0.5742058, -0.0219591, -1.669288, 0.3803922, 1, 0, 1,
-0.5727324, -0.9715372, -1.835089, 0.372549, 1, 0, 1,
-0.5687445, 0.06376459, -2.51382, 0.3686275, 1, 0, 1,
-0.5680673, -0.9593214, -3.145852, 0.3607843, 1, 0, 1,
-0.5640976, -0.05583055, -2.420621, 0.3568628, 1, 0, 1,
-0.5580584, -0.6014537, -2.117775, 0.3490196, 1, 0, 1,
-0.5510668, -0.4639362, -2.131739, 0.345098, 1, 0, 1,
-0.5489234, -0.8139113, -1.660197, 0.3372549, 1, 0, 1,
-0.5467715, -1.143485, -1.654844, 0.3333333, 1, 0, 1,
-0.5382802, 0.5343402, -0.1694135, 0.3254902, 1, 0, 1,
-0.5336392, -0.2107205, -1.562374, 0.3215686, 1, 0, 1,
-0.5331397, 0.6285492, -0.05409614, 0.3137255, 1, 0, 1,
-0.5297814, 1.520794, -0.5200781, 0.3098039, 1, 0, 1,
-0.5252438, -0.4908516, -1.023864, 0.3019608, 1, 0, 1,
-0.5237638, -1.400288, -2.357821, 0.2941177, 1, 0, 1,
-0.5190982, -0.8149596, -2.324581, 0.2901961, 1, 0, 1,
-0.5166161, 0.5070178, -0.2931823, 0.282353, 1, 0, 1,
-0.5163174, -0.5670441, -1.732163, 0.2784314, 1, 0, 1,
-0.5154402, -2.931471, -4.338253, 0.2705882, 1, 0, 1,
-0.5146091, 0.09976029, -1.714247, 0.2666667, 1, 0, 1,
-0.514087, 1.163507, -0.8360723, 0.2588235, 1, 0, 1,
-0.5139426, 1.383827, 0.6413892, 0.254902, 1, 0, 1,
-0.5133646, 0.09847473, -0.4016155, 0.2470588, 1, 0, 1,
-0.5127448, -0.4105821, -4.088017, 0.2431373, 1, 0, 1,
-0.5118651, -0.8769044, -1.621876, 0.2352941, 1, 0, 1,
-0.5084507, -1.438629, -0.8855331, 0.2313726, 1, 0, 1,
-0.5028239, -0.002956701, -1.446279, 0.2235294, 1, 0, 1,
-0.5004049, 1.282693, 0.5487143, 0.2196078, 1, 0, 1,
-0.4899864, -1.011087, -3.596981, 0.2117647, 1, 0, 1,
-0.4873522, 1.080435, -0.1325667, 0.2078431, 1, 0, 1,
-0.4836717, 0.1765065, -2.269747, 0.2, 1, 0, 1,
-0.4824598, -0.3630783, -3.868681, 0.1921569, 1, 0, 1,
-0.4811252, 0.4369856, 0.09648159, 0.1882353, 1, 0, 1,
-0.4748226, 0.4265521, -1.330171, 0.1803922, 1, 0, 1,
-0.473767, 1.699088, -1.024409, 0.1764706, 1, 0, 1,
-0.4693244, -1.538336, -1.874407, 0.1686275, 1, 0, 1,
-0.4665417, -0.6175244, -2.145763, 0.1647059, 1, 0, 1,
-0.4614547, 0.05234849, -2.054933, 0.1568628, 1, 0, 1,
-0.4573286, -1.495096, -4.409061, 0.1529412, 1, 0, 1,
-0.4529116, -0.6089762, -4.060684, 0.145098, 1, 0, 1,
-0.4447924, 1.846478, 1.494421, 0.1411765, 1, 0, 1,
-0.4338496, -0.09034903, -0.04055816, 0.1333333, 1, 0, 1,
-0.4338085, -0.3283284, -0.3838235, 0.1294118, 1, 0, 1,
-0.4302218, 0.7217908, -1.535864, 0.1215686, 1, 0, 1,
-0.4292767, -0.773035, -0.03440201, 0.1176471, 1, 0, 1,
-0.4231185, -0.8292931, -2.385254, 0.1098039, 1, 0, 1,
-0.4230045, -0.1649344, -0.6354256, 0.1058824, 1, 0, 1,
-0.4155903, 0.1416047, -0.2769293, 0.09803922, 1, 0, 1,
-0.4146294, 0.8235204, -0.9038566, 0.09019608, 1, 0, 1,
-0.4143433, -0.05054847, -1.319767, 0.08627451, 1, 0, 1,
-0.4123488, -0.7023301, -2.927893, 0.07843138, 1, 0, 1,
-0.4109318, 0.5813675, -0.9134648, 0.07450981, 1, 0, 1,
-0.4066972, 0.152446, -1.031089, 0.06666667, 1, 0, 1,
-0.4066671, 0.3404309, -0.8127838, 0.0627451, 1, 0, 1,
-0.3995849, 1.279871, -0.7101026, 0.05490196, 1, 0, 1,
-0.398183, -0.3461518, -2.497276, 0.05098039, 1, 0, 1,
-0.3965091, 0.5178582, -2.117495, 0.04313726, 1, 0, 1,
-0.394662, -0.5348035, -2.125118, 0.03921569, 1, 0, 1,
-0.3886333, -1.235061, -4.294957, 0.03137255, 1, 0, 1,
-0.3853356, -0.5971835, -3.352528, 0.02745098, 1, 0, 1,
-0.3828788, -0.1296713, -1.480931, 0.01960784, 1, 0, 1,
-0.3799349, -0.1221938, 0.2265552, 0.01568628, 1, 0, 1,
-0.3733684, 1.932809, 0.1465925, 0.007843138, 1, 0, 1,
-0.370259, 0.5990121, -1.241059, 0.003921569, 1, 0, 1,
-0.3656004, -0.6152868, -3.262915, 0, 1, 0.003921569, 1,
-0.3653136, 1.350427, -1.905309, 0, 1, 0.01176471, 1,
-0.363553, -1.274555, -3.742072, 0, 1, 0.01568628, 1,
-0.363279, -0.9519854, -1.371888, 0, 1, 0.02352941, 1,
-0.360802, 1.231241, -0.1979511, 0, 1, 0.02745098, 1,
-0.3551503, -0.2025229, -0.9248412, 0, 1, 0.03529412, 1,
-0.3544886, -0.09899814, -2.634863, 0, 1, 0.03921569, 1,
-0.3537449, -1.055858, -3.544741, 0, 1, 0.04705882, 1,
-0.3524138, -0.6621428, -2.222132, 0, 1, 0.05098039, 1,
-0.3487062, 1.040647, -0.09029539, 0, 1, 0.05882353, 1,
-0.3459376, 0.4019662, -1.348413, 0, 1, 0.0627451, 1,
-0.3456195, 0.4573859, -1.793564, 0, 1, 0.07058824, 1,
-0.3429396, -0.02071812, -1.87302, 0, 1, 0.07450981, 1,
-0.3371846, -0.6873245, -4.05406, 0, 1, 0.08235294, 1,
-0.3367851, 0.3630935, -1.926325, 0, 1, 0.08627451, 1,
-0.3357299, -1.35189, -1.976888, 0, 1, 0.09411765, 1,
-0.3356422, 1.817148, -0.08792689, 0, 1, 0.1019608, 1,
-0.332901, 0.1802311, -3.047884, 0, 1, 0.1058824, 1,
-0.3295767, 0.609694, -0.9251046, 0, 1, 0.1137255, 1,
-0.3294551, 0.4961847, -1.225761, 0, 1, 0.1176471, 1,
-0.3252972, 0.5176916, 0.2089013, 0, 1, 0.1254902, 1,
-0.3236862, 0.04453486, -2.878269, 0, 1, 0.1294118, 1,
-0.3182224, 0.03391506, -1.35797, 0, 1, 0.1372549, 1,
-0.3160651, -0.0825533, -0.812001, 0, 1, 0.1411765, 1,
-0.3156593, -0.6400568, -2.260773, 0, 1, 0.1490196, 1,
-0.3154857, 0.8394803, -0.4551179, 0, 1, 0.1529412, 1,
-0.308589, 0.2094316, -1.338971, 0, 1, 0.1607843, 1,
-0.3068075, 0.3213469, -0.6892347, 0, 1, 0.1647059, 1,
-0.3002203, 0.272004, -0.2082559, 0, 1, 0.172549, 1,
-0.2976218, -1.369055, -3.6006, 0, 1, 0.1764706, 1,
-0.2973508, 1.033373, -0.5433415, 0, 1, 0.1843137, 1,
-0.2947339, 0.9604273, -0.2320487, 0, 1, 0.1882353, 1,
-0.2939278, 1.691567, -0.3409509, 0, 1, 0.1960784, 1,
-0.2934554, 0.08940756, -1.660486, 0, 1, 0.2039216, 1,
-0.2920141, 0.672883, 0.1232015, 0, 1, 0.2078431, 1,
-0.2909973, 0.3129994, -1.676341, 0, 1, 0.2156863, 1,
-0.2889496, 1.845581, 0.4310568, 0, 1, 0.2196078, 1,
-0.2885377, -1.075736, -4.763579, 0, 1, 0.227451, 1,
-0.2847414, -0.2290762, -1.535043, 0, 1, 0.2313726, 1,
-0.284573, -0.7705506, -2.588406, 0, 1, 0.2392157, 1,
-0.2744182, -0.435213, -0.4504203, 0, 1, 0.2431373, 1,
-0.2713512, -1.075722, -3.403491, 0, 1, 0.2509804, 1,
-0.2585462, 0.2926408, -0.5317982, 0, 1, 0.254902, 1,
-0.2584353, -2.326686, -3.677656, 0, 1, 0.2627451, 1,
-0.2534559, -1.115746, -4.107098, 0, 1, 0.2666667, 1,
-0.248864, -2.470415, -3.049982, 0, 1, 0.2745098, 1,
-0.2477139, -0.6946233, -3.000364, 0, 1, 0.2784314, 1,
-0.2435518, -1.067576, -3.949418, 0, 1, 0.2862745, 1,
-0.2376498, -0.7432123, -1.268379, 0, 1, 0.2901961, 1,
-0.2350251, 1.042218, 0.3951244, 0, 1, 0.2980392, 1,
-0.2349815, 1.005059, 0.2490034, 0, 1, 0.3058824, 1,
-0.234094, 0.9453894, -1.599285, 0, 1, 0.3098039, 1,
-0.2321124, -0.8440971, -1.867331, 0, 1, 0.3176471, 1,
-0.228957, 0.7695942, -0.4807219, 0, 1, 0.3215686, 1,
-0.2287632, 0.5827106, 0.9598968, 0, 1, 0.3294118, 1,
-0.2261236, -0.4847378, -2.117134, 0, 1, 0.3333333, 1,
-0.2163058, 2.281253, 0.1095344, 0, 1, 0.3411765, 1,
-0.2124853, 0.3037733, 0.249679, 0, 1, 0.345098, 1,
-0.2090616, 0.7734485, -1.14912, 0, 1, 0.3529412, 1,
-0.2082761, 0.06495513, 1.092774, 0, 1, 0.3568628, 1,
-0.2048216, -0.6607632, -2.982816, 0, 1, 0.3647059, 1,
-0.2012319, 1.330618, -0.9170856, 0, 1, 0.3686275, 1,
-0.2000657, -2.427039, -3.12725, 0, 1, 0.3764706, 1,
-0.1937768, 1.081917, -1.273269, 0, 1, 0.3803922, 1,
-0.1914155, 0.8674788, 1.011663, 0, 1, 0.3882353, 1,
-0.1863501, -0.2317621, -1.335333, 0, 1, 0.3921569, 1,
-0.1843555, 1.598235, -1.436281, 0, 1, 0.4, 1,
-0.1839667, 0.8870119, -1.698701, 0, 1, 0.4078431, 1,
-0.1763635, 1.093418, 0.1032834, 0, 1, 0.4117647, 1,
-0.1741645, 0.5704337, -2.159503, 0, 1, 0.4196078, 1,
-0.174164, -0.727355, -3.303807, 0, 1, 0.4235294, 1,
-0.172492, -0.8280712, -2.427096, 0, 1, 0.4313726, 1,
-0.1702767, 0.3568253, -1.163678, 0, 1, 0.4352941, 1,
-0.166832, -0.4006267, -2.964173, 0, 1, 0.4431373, 1,
-0.163647, -0.3360677, -2.433915, 0, 1, 0.4470588, 1,
-0.157502, -0.08003007, -2.769671, 0, 1, 0.454902, 1,
-0.1569514, -0.290924, -2.056566, 0, 1, 0.4588235, 1,
-0.1553694, -1.972522, -2.432127, 0, 1, 0.4666667, 1,
-0.1478912, 0.7334579, -1.111741, 0, 1, 0.4705882, 1,
-0.14508, -0.3048904, -1.458388, 0, 1, 0.4784314, 1,
-0.1417195, 0.00985298, -0.4722555, 0, 1, 0.4823529, 1,
-0.1415066, -1.404487, -2.204863, 0, 1, 0.4901961, 1,
-0.1401169, 0.7992837, 0.003958571, 0, 1, 0.4941176, 1,
-0.1382376, 1.131244, -0.0730933, 0, 1, 0.5019608, 1,
-0.1361617, 1.309946, 0.150389, 0, 1, 0.509804, 1,
-0.1354258, -0.229693, -2.286397, 0, 1, 0.5137255, 1,
-0.1352462, 0.7311461, 0.1793764, 0, 1, 0.5215687, 1,
-0.1325821, 1.025673, 0.04019845, 0, 1, 0.5254902, 1,
-0.1325147, -0.6790234, -1.890386, 0, 1, 0.5333334, 1,
-0.1324366, -0.01180721, -1.267645, 0, 1, 0.5372549, 1,
-0.1299951, 2.113957, -2.04049, 0, 1, 0.5450981, 1,
-0.128247, -1.515491, -2.428513, 0, 1, 0.5490196, 1,
-0.1280784, -2.607214, -3.279386, 0, 1, 0.5568628, 1,
-0.1273408, 1.399406, 1.119796, 0, 1, 0.5607843, 1,
-0.1263229, 0.2443986, -0.3879567, 0, 1, 0.5686275, 1,
-0.1234334, 0.2851254, -0.7522908, 0, 1, 0.572549, 1,
-0.1216558, 0.4159723, 0.558037, 0, 1, 0.5803922, 1,
-0.1171871, -0.690542, -2.2202, 0, 1, 0.5843138, 1,
-0.1168117, 0.2128595, -1.504526, 0, 1, 0.5921569, 1,
-0.1152792, -1.250694, -1.526698, 0, 1, 0.5960785, 1,
-0.1150508, 0.1554505, 0.1449719, 0, 1, 0.6039216, 1,
-0.1148909, -1.212741, -3.239033, 0, 1, 0.6117647, 1,
-0.1099699, 0.8455907, 1.250846, 0, 1, 0.6156863, 1,
-0.1096361, 1.396006, 0.2091879, 0, 1, 0.6235294, 1,
-0.1062366, -1.091445, -3.56884, 0, 1, 0.627451, 1,
-0.1056953, 1.675111, 0.6818119, 0, 1, 0.6352941, 1,
-0.1024105, -1.00067, -3.269238, 0, 1, 0.6392157, 1,
-0.1008696, 0.3927002, 0.06119039, 0, 1, 0.6470588, 1,
-0.09939015, -1.953484, -1.931197, 0, 1, 0.6509804, 1,
-0.09714457, 0.2536003, -0.9748675, 0, 1, 0.6588235, 1,
-0.09420906, 0.2906819, -2.126698, 0, 1, 0.6627451, 1,
-0.09049132, -2.702276, -2.635633, 0, 1, 0.6705883, 1,
-0.09017912, 1.383828, 0.08754556, 0, 1, 0.6745098, 1,
-0.08856022, 0.2048095, -1.724269, 0, 1, 0.682353, 1,
-0.08718091, -0.7477142, -2.531126, 0, 1, 0.6862745, 1,
-0.08631183, -0.5354245, -3.35286, 0, 1, 0.6941177, 1,
-0.08516721, 1.515644, -1.047661, 0, 1, 0.7019608, 1,
-0.08391216, -0.5795048, -3.418103, 0, 1, 0.7058824, 1,
-0.08254184, 0.5600596, 1.132898, 0, 1, 0.7137255, 1,
-0.0823833, 0.6902072, -1.001655, 0, 1, 0.7176471, 1,
-0.08171248, -1.69543, -5.63555, 0, 1, 0.7254902, 1,
-0.08164293, -0.3695682, -4.22077, 0, 1, 0.7294118, 1,
-0.08008339, -0.8192406, -3.71631, 0, 1, 0.7372549, 1,
-0.07771708, 1.511305, 0.3400954, 0, 1, 0.7411765, 1,
-0.07712679, -0.6276359, -2.936624, 0, 1, 0.7490196, 1,
-0.07470474, 1.105431, 1.630101, 0, 1, 0.7529412, 1,
-0.07059034, 0.2662624, -0.9013457, 0, 1, 0.7607843, 1,
-0.06687959, 0.1808348, -1.512019, 0, 1, 0.7647059, 1,
-0.06346875, -1.285937, -3.263735, 0, 1, 0.772549, 1,
-0.06333147, 0.08553919, 1.926646, 0, 1, 0.7764706, 1,
-0.06312214, 0.1499657, 1.186255, 0, 1, 0.7843137, 1,
-0.06261542, 0.2939405, -1.484133, 0, 1, 0.7882353, 1,
-0.05850021, -0.4443124, -1.735682, 0, 1, 0.7960784, 1,
-0.05777827, 1.764352, -0.8614285, 0, 1, 0.8039216, 1,
-0.05488177, 0.9748524, 0.8975543, 0, 1, 0.8078431, 1,
-0.05413008, -0.9142092, -2.687685, 0, 1, 0.8156863, 1,
-0.05110022, -0.07480939, -3.892179, 0, 1, 0.8196079, 1,
-0.04977817, -1.13589, -3.519154, 0, 1, 0.827451, 1,
-0.04964789, 1.369041, -0.2792426, 0, 1, 0.8313726, 1,
-0.04940208, 1.029822, -0.5040958, 0, 1, 0.8392157, 1,
-0.04782653, -2.549951, -2.523053, 0, 1, 0.8431373, 1,
-0.0399816, 1.647593, 0.6615071, 0, 1, 0.8509804, 1,
-0.03725298, 0.4366148, -0.9400827, 0, 1, 0.854902, 1,
-0.03357458, 0.2104343, 0.2856218, 0, 1, 0.8627451, 1,
-0.03141966, 1.613851, 0.3259967, 0, 1, 0.8666667, 1,
-0.03035529, 0.5374788, 0.1223643, 0, 1, 0.8745098, 1,
-0.02352239, -1.26042, -5.393703, 0, 1, 0.8784314, 1,
-0.02342114, -0.5014694, -2.341702, 0, 1, 0.8862745, 1,
-0.02055323, -1.48456, -2.975916, 0, 1, 0.8901961, 1,
-0.01784944, 0.9559473, 0.3089694, 0, 1, 0.8980392, 1,
-0.01691692, 0.2759629, 0.5487677, 0, 1, 0.9058824, 1,
-0.01691511, 0.5234147, 1.384007, 0, 1, 0.9098039, 1,
-0.01268959, -0.2813835, -4.568003, 0, 1, 0.9176471, 1,
-0.008601693, 0.5580812, 1.122679, 0, 1, 0.9215686, 1,
-0.007060132, 0.4174902, 1.350665, 0, 1, 0.9294118, 1,
-0.002467513, -1.463685, -3.143075, 0, 1, 0.9333333, 1,
-0.001603732, 0.09681118, 0.4088716, 0, 1, 0.9411765, 1,
0.0005854497, -0.8203924, 4.59489, 0, 1, 0.945098, 1,
0.003597225, 0.5245579, 1.998401, 0, 1, 0.9529412, 1,
0.004671011, 1.063343, -2.548717, 0, 1, 0.9568627, 1,
0.008231735, 1.068076, 1.199805, 0, 1, 0.9647059, 1,
0.01499407, -0.5848812, 4.046095, 0, 1, 0.9686275, 1,
0.0171059, -1.500456, 4.213154, 0, 1, 0.9764706, 1,
0.01831883, -0.9484557, 2.351958, 0, 1, 0.9803922, 1,
0.02192771, 1.394947, 0.5976661, 0, 1, 0.9882353, 1,
0.02679822, 0.1806551, -0.4238937, 0, 1, 0.9921569, 1,
0.0281154, -1.625935, 4.044792, 0, 1, 1, 1,
0.02932806, 1.012542, 0.7013478, 0, 0.9921569, 1, 1,
0.03202362, 0.4218601, -1.262748, 0, 0.9882353, 1, 1,
0.03586001, 0.2885876, -0.2159619, 0, 0.9803922, 1, 1,
0.03646095, -0.5263979, 2.489765, 0, 0.9764706, 1, 1,
0.04291955, 0.7235863, -0.3917008, 0, 0.9686275, 1, 1,
0.0444541, -0.0455027, 2.265112, 0, 0.9647059, 1, 1,
0.04470071, 0.4642211, -0.4001511, 0, 0.9568627, 1, 1,
0.04865376, 0.7116996, -0.5162308, 0, 0.9529412, 1, 1,
0.05058606, 0.268358, -2.484433, 0, 0.945098, 1, 1,
0.05102045, -0.07321946, 1.37988, 0, 0.9411765, 1, 1,
0.05351274, 0.8129446, 0.4538322, 0, 0.9333333, 1, 1,
0.05700321, -0.9608614, 3.479247, 0, 0.9294118, 1, 1,
0.05750014, 0.9570398, 2.182018, 0, 0.9215686, 1, 1,
0.05894393, -0.2420392, 3.818684, 0, 0.9176471, 1, 1,
0.05953059, 1.473995, 0.7269076, 0, 0.9098039, 1, 1,
0.05985807, 0.707263, -0.5394678, 0, 0.9058824, 1, 1,
0.06134818, -1.44043, 3.972478, 0, 0.8980392, 1, 1,
0.06307892, -0.2565596, 1.011776, 0, 0.8901961, 1, 1,
0.06652713, -1.015235, 1.775256, 0, 0.8862745, 1, 1,
0.0693484, 0.2412407, 0.3666537, 0, 0.8784314, 1, 1,
0.07189362, -0.6013561, 2.519481, 0, 0.8745098, 1, 1,
0.07248866, 0.1681213, 0.7387831, 0, 0.8666667, 1, 1,
0.0848641, 0.2180037, 2.510898, 0, 0.8627451, 1, 1,
0.08531455, -0.1852255, 2.081329, 0, 0.854902, 1, 1,
0.08967888, 1.227179, -0.4672951, 0, 0.8509804, 1, 1,
0.09010398, -0.7365659, 3.341755, 0, 0.8431373, 1, 1,
0.09448759, -0.613475, 3.576508, 0, 0.8392157, 1, 1,
0.09686179, -0.0211537, 0.5881097, 0, 0.8313726, 1, 1,
0.09786198, 0.6030939, 2.360282, 0, 0.827451, 1, 1,
0.1045702, -0.449292, 2.88762, 0, 0.8196079, 1, 1,
0.1105287, -0.178842, 3.571201, 0, 0.8156863, 1, 1,
0.1131507, -0.03794129, 0.8120727, 0, 0.8078431, 1, 1,
0.1136152, -0.3657917, 1.443964, 0, 0.8039216, 1, 1,
0.1137201, -0.05513851, 1.793185, 0, 0.7960784, 1, 1,
0.11784, -1.282697, 2.180972, 0, 0.7882353, 1, 1,
0.1240395, 0.1886411, 1.502993, 0, 0.7843137, 1, 1,
0.125648, -1.533996, 2.93838, 0, 0.7764706, 1, 1,
0.1263937, -0.2490543, 2.911748, 0, 0.772549, 1, 1,
0.1283658, -0.02944597, 2.778712, 0, 0.7647059, 1, 1,
0.1330273, 1.977427, 0.7988988, 0, 0.7607843, 1, 1,
0.1360017, 0.3826563, 2.505288, 0, 0.7529412, 1, 1,
0.1363474, -0.1521166, 3.594863, 0, 0.7490196, 1, 1,
0.1484258, -0.3292876, 2.747988, 0, 0.7411765, 1, 1,
0.1552059, 0.718069, -0.4920242, 0, 0.7372549, 1, 1,
0.1567638, 0.9426129, -0.2803708, 0, 0.7294118, 1, 1,
0.15843, 0.1508605, 1.324274, 0, 0.7254902, 1, 1,
0.1665544, -0.7972087, 4.201546, 0, 0.7176471, 1, 1,
0.1678492, 0.5347971, 0.4848252, 0, 0.7137255, 1, 1,
0.1685783, 0.3360283, 1.690586, 0, 0.7058824, 1, 1,
0.1704111, -1.639288, 3.418985, 0, 0.6980392, 1, 1,
0.1715224, -0.5870274, 2.960825, 0, 0.6941177, 1, 1,
0.1719946, 1.065899, 0.2989748, 0, 0.6862745, 1, 1,
0.1796854, -0.3617101, 2.334847, 0, 0.682353, 1, 1,
0.1819337, 2.117553, -1.234748, 0, 0.6745098, 1, 1,
0.1849781, 1.187927, 0.8440375, 0, 0.6705883, 1, 1,
0.1889948, -0.4373337, 3.779123, 0, 0.6627451, 1, 1,
0.1916044, 0.6083746, -0.1035683, 0, 0.6588235, 1, 1,
0.1966847, 1.730952, 1.289245, 0, 0.6509804, 1, 1,
0.2041787, -0.2412212, 1.898795, 0, 0.6470588, 1, 1,
0.204282, -0.09671259, 1.282492, 0, 0.6392157, 1, 1,
0.2062049, -0.1775114, 1.520831, 0, 0.6352941, 1, 1,
0.21616, -0.1511709, 1.445011, 0, 0.627451, 1, 1,
0.2163442, -0.3193017, 3.907718, 0, 0.6235294, 1, 1,
0.217904, 0.09193954, 0.822136, 0, 0.6156863, 1, 1,
0.2197901, 0.1425453, 1.625325, 0, 0.6117647, 1, 1,
0.2389742, 0.6534321, 1.805782, 0, 0.6039216, 1, 1,
0.2398522, 1.324732, 0.1709011, 0, 0.5960785, 1, 1,
0.2399032, 1.522839, -0.9093316, 0, 0.5921569, 1, 1,
0.2421112, -0.3735156, 3.516048, 0, 0.5843138, 1, 1,
0.2429418, 0.7461951, -0.6117347, 0, 0.5803922, 1, 1,
0.2498171, -0.277445, 0.8192973, 0, 0.572549, 1, 1,
0.2508071, -0.7264187, 2.856558, 0, 0.5686275, 1, 1,
0.2548711, 1.372825, 0.8698292, 0, 0.5607843, 1, 1,
0.2550106, -1.708803, 3.405049, 0, 0.5568628, 1, 1,
0.2555673, -0.4550965, 3.652183, 0, 0.5490196, 1, 1,
0.2562329, 1.042231, -0.1912329, 0, 0.5450981, 1, 1,
0.2579495, -0.7404929, 3.050312, 0, 0.5372549, 1, 1,
0.2635895, 0.2259342, 0.5935937, 0, 0.5333334, 1, 1,
0.2671196, -1.479584, 2.998667, 0, 0.5254902, 1, 1,
0.2675239, 0.4550514, -0.4022897, 0, 0.5215687, 1, 1,
0.2676995, 2.309364, -0.5443723, 0, 0.5137255, 1, 1,
0.2687653, 0.6801502, -0.5972095, 0, 0.509804, 1, 1,
0.2717524, 1.458738, -0.7659152, 0, 0.5019608, 1, 1,
0.2734365, 0.001909148, 2.665092, 0, 0.4941176, 1, 1,
0.2786911, -0.3419586, 2.815568, 0, 0.4901961, 1, 1,
0.2787108, -0.1882769, 3.067285, 0, 0.4823529, 1, 1,
0.2798225, 1.422432, 0.4163108, 0, 0.4784314, 1, 1,
0.2799032, -1.695368, 1.826535, 0, 0.4705882, 1, 1,
0.2805212, -0.7941492, 2.523008, 0, 0.4666667, 1, 1,
0.2818595, -0.0893463, 0.9118404, 0, 0.4588235, 1, 1,
0.2826651, -0.02186318, 2.843598, 0, 0.454902, 1, 1,
0.2832711, -0.8454794, 3.59025, 0, 0.4470588, 1, 1,
0.284252, -3.451981, 3.277911, 0, 0.4431373, 1, 1,
0.284478, -0.8572823, 4.211661, 0, 0.4352941, 1, 1,
0.2861704, 0.03148325, 1.525779, 0, 0.4313726, 1, 1,
0.2913035, 1.02974, -0.9326411, 0, 0.4235294, 1, 1,
0.2964131, 0.368973, 1.643744, 0, 0.4196078, 1, 1,
0.2979946, 0.8880246, 1.809865, 0, 0.4117647, 1, 1,
0.2983897, -0.03597407, 1.745944, 0, 0.4078431, 1, 1,
0.3065946, -0.04543563, 2.656247, 0, 0.4, 1, 1,
0.311849, -0.4507782, 2.221836, 0, 0.3921569, 1, 1,
0.3132682, -0.6203223, 1.660119, 0, 0.3882353, 1, 1,
0.3177834, 0.1627135, 2.323614, 0, 0.3803922, 1, 1,
0.3265436, 0.4365338, 0.03693879, 0, 0.3764706, 1, 1,
0.3268139, -1.575687, 0.8719913, 0, 0.3686275, 1, 1,
0.3269784, 0.8378902, 1.117951, 0, 0.3647059, 1, 1,
0.328968, -0.4227961, 3.623208, 0, 0.3568628, 1, 1,
0.3300695, -0.1562301, 3.142464, 0, 0.3529412, 1, 1,
0.3325639, -0.9771179, 5.399489, 0, 0.345098, 1, 1,
0.3332663, -1.255934, 5.305472, 0, 0.3411765, 1, 1,
0.3349275, 0.3101845, 1.057646, 0, 0.3333333, 1, 1,
0.3366217, 0.6930291, 0.9763591, 0, 0.3294118, 1, 1,
0.3473464, 0.758262, -0.6251174, 0, 0.3215686, 1, 1,
0.3491936, -0.2722784, 3.058335, 0, 0.3176471, 1, 1,
0.3514512, 0.2475991, 0.8273446, 0, 0.3098039, 1, 1,
0.3516135, 0.2410534, 0.9206807, 0, 0.3058824, 1, 1,
0.3520115, 0.3676929, -0.4998056, 0, 0.2980392, 1, 1,
0.3537164, 0.4139002, -0.3564075, 0, 0.2901961, 1, 1,
0.3551481, 0.9307913, -0.3473129, 0, 0.2862745, 1, 1,
0.3584194, -0.04432447, 3.266494, 0, 0.2784314, 1, 1,
0.3609188, -0.6688896, 2.370683, 0, 0.2745098, 1, 1,
0.361705, 0.5913306, -1.777467, 0, 0.2666667, 1, 1,
0.3628103, -0.2588791, 1.916788, 0, 0.2627451, 1, 1,
0.369243, 1.077997, 0.009104609, 0, 0.254902, 1, 1,
0.3702476, -1.055814, 2.12097, 0, 0.2509804, 1, 1,
0.371155, 0.09054644, 0.4833817, 0, 0.2431373, 1, 1,
0.3720984, -0.6829903, 2.579771, 0, 0.2392157, 1, 1,
0.3734536, -0.8642511, 4.089933, 0, 0.2313726, 1, 1,
0.373648, -0.3993353, 1.267602, 0, 0.227451, 1, 1,
0.3740381, -0.9006768, 3.665231, 0, 0.2196078, 1, 1,
0.3756894, 0.325336, -0.3325807, 0, 0.2156863, 1, 1,
0.3782611, -0.81396, 3.046779, 0, 0.2078431, 1, 1,
0.3784914, -0.4228795, 3.566895, 0, 0.2039216, 1, 1,
0.3787206, -1.112162, 2.791754, 0, 0.1960784, 1, 1,
0.3869214, -0.5206686, 1.376049, 0, 0.1882353, 1, 1,
0.3906614, 0.6265414, -0.409068, 0, 0.1843137, 1, 1,
0.3954513, 0.07570554, 1.198552, 0, 0.1764706, 1, 1,
0.3955719, 0.1767566, 0.8747756, 0, 0.172549, 1, 1,
0.3961106, 0.8821871, 1.614, 0, 0.1647059, 1, 1,
0.4018868, 0.2953191, -0.1397744, 0, 0.1607843, 1, 1,
0.4040737, -0.6950412, 4.037958, 0, 0.1529412, 1, 1,
0.4104964, -1.287416, 1.632375, 0, 0.1490196, 1, 1,
0.4155624, 0.7745938, 1.90832, 0, 0.1411765, 1, 1,
0.4161943, -0.8819916, 2.810111, 0, 0.1372549, 1, 1,
0.4198466, 0.3866443, 0.9517878, 0, 0.1294118, 1, 1,
0.4216743, 0.7778218, 0.6516986, 0, 0.1254902, 1, 1,
0.4294454, 0.2733968, -1.061625, 0, 0.1176471, 1, 1,
0.4316957, -0.5808819, 2.279909, 0, 0.1137255, 1, 1,
0.4320244, -0.1057064, 2.597329, 0, 0.1058824, 1, 1,
0.4374391, 0.151574, 1.450708, 0, 0.09803922, 1, 1,
0.4376836, -0.7718533, 0.464834, 0, 0.09411765, 1, 1,
0.4376931, 0.3484958, -0.125961, 0, 0.08627451, 1, 1,
0.4387916, -0.5874925, 3.182145, 0, 0.08235294, 1, 1,
0.4393392, -0.7298536, 0.8237972, 0, 0.07450981, 1, 1,
0.4421364, -0.9272227, 3.232457, 0, 0.07058824, 1, 1,
0.4478809, 2.324636, -0.1136299, 0, 0.0627451, 1, 1,
0.4551794, -1.348712, 1.051472, 0, 0.05882353, 1, 1,
0.4652759, 1.191871, 3.459566, 0, 0.05098039, 1, 1,
0.4682163, 1.488833, 1.002575, 0, 0.04705882, 1, 1,
0.4707827, -0.2596325, -0.1314369, 0, 0.03921569, 1, 1,
0.4741466, 0.8741224, 1.118544, 0, 0.03529412, 1, 1,
0.4834075, -0.03428909, 1.510037, 0, 0.02745098, 1, 1,
0.4881527, -0.7211964, 2.634526, 0, 0.02352941, 1, 1,
0.4928474, 1.215095, 0.007278763, 0, 0.01568628, 1, 1,
0.495785, 1.242055, 1.419517, 0, 0.01176471, 1, 1,
0.4965746, -0.4668969, 2.642648, 0, 0.003921569, 1, 1,
0.4997666, -0.09816192, 0.2666181, 0.003921569, 0, 1, 1,
0.5059415, 0.6452207, 1.461762, 0.007843138, 0, 1, 1,
0.5123372, -1.619892, 2.13446, 0.01568628, 0, 1, 1,
0.5138497, -2.230919, 3.613624, 0.01960784, 0, 1, 1,
0.5206935, 0.03284096, 0.9873129, 0.02745098, 0, 1, 1,
0.5219201, -0.8764942, 2.329605, 0.03137255, 0, 1, 1,
0.5221133, 0.3958394, 0.7017645, 0.03921569, 0, 1, 1,
0.524394, 0.05560117, 1.574317, 0.04313726, 0, 1, 1,
0.5270774, 2.336441, 0.783265, 0.05098039, 0, 1, 1,
0.5271309, -0.4755517, 1.893732, 0.05490196, 0, 1, 1,
0.5355347, -0.717541, 3.467608, 0.0627451, 0, 1, 1,
0.5376235, 0.1509361, 1.968809, 0.06666667, 0, 1, 1,
0.5401511, -1.254821, 1.88843, 0.07450981, 0, 1, 1,
0.5454645, 0.8447044, -0.5587678, 0.07843138, 0, 1, 1,
0.5461649, 0.8832589, -1.271374, 0.08627451, 0, 1, 1,
0.5494528, -0.2723527, 3.771456, 0.09019608, 0, 1, 1,
0.5550537, -0.2275305, 2.560513, 0.09803922, 0, 1, 1,
0.5623833, 1.151807, -0.478809, 0.1058824, 0, 1, 1,
0.5651923, 0.3548138, 1.020598, 0.1098039, 0, 1, 1,
0.5658687, -0.2744404, 1.846503, 0.1176471, 0, 1, 1,
0.5767947, -0.3820717, 3.020518, 0.1215686, 0, 1, 1,
0.5769973, 0.3898025, 0.2410892, 0.1294118, 0, 1, 1,
0.5784346, -0.07472011, 0.3548255, 0.1333333, 0, 1, 1,
0.5882313, 0.9601166, 1.207907, 0.1411765, 0, 1, 1,
0.5883789, 0.2046188, 2.664537, 0.145098, 0, 1, 1,
0.5919791, 2.385283, -1.451785, 0.1529412, 0, 1, 1,
0.5932721, 1.027862, 0.05760749, 0.1568628, 0, 1, 1,
0.5935761, -0.6419612, 0.813329, 0.1647059, 0, 1, 1,
0.5966161, -0.4732866, 2.889236, 0.1686275, 0, 1, 1,
0.6030197, -0.3716167, 1.859004, 0.1764706, 0, 1, 1,
0.603281, 0.6908761, -0.01614856, 0.1803922, 0, 1, 1,
0.6039801, -1.200029, 0.5704993, 0.1882353, 0, 1, 1,
0.6121881, 2.578274, 0.6777744, 0.1921569, 0, 1, 1,
0.6131377, -0.1901736, 1.872211, 0.2, 0, 1, 1,
0.6137828, -0.4995972, 1.963655, 0.2078431, 0, 1, 1,
0.6220272, -0.1166815, 2.633723, 0.2117647, 0, 1, 1,
0.6259412, 0.4455392, -0.1751548, 0.2196078, 0, 1, 1,
0.6270838, 0.6614842, 2.647716, 0.2235294, 0, 1, 1,
0.6326287, 0.5599945, 0.4467753, 0.2313726, 0, 1, 1,
0.6338283, 0.4262193, 1.879655, 0.2352941, 0, 1, 1,
0.6339898, 0.358372, 2.750847, 0.2431373, 0, 1, 1,
0.636229, 3.054019, 1.093714, 0.2470588, 0, 1, 1,
0.6376935, -0.6226896, 2.742008, 0.254902, 0, 1, 1,
0.642318, 0.2404994, 0.1171637, 0.2588235, 0, 1, 1,
0.6484752, 0.9732329, 0.9042128, 0.2666667, 0, 1, 1,
0.6494631, -0.6913903, 2.891271, 0.2705882, 0, 1, 1,
0.6569623, -0.6766891, 2.578337, 0.2784314, 0, 1, 1,
0.6594965, -0.6732329, 1.82285, 0.282353, 0, 1, 1,
0.6612074, -0.5883065, -0.09847561, 0.2901961, 0, 1, 1,
0.6657456, 0.3353449, 1.940519, 0.2941177, 0, 1, 1,
0.6681365, 0.6610396, -0.2359059, 0.3019608, 0, 1, 1,
0.6699007, -1.970077, 2.512214, 0.3098039, 0, 1, 1,
0.6700364, -0.03955788, 2.586873, 0.3137255, 0, 1, 1,
0.6743642, -1.384889, 2.591754, 0.3215686, 0, 1, 1,
0.6749738, 0.5996907, 1.909224, 0.3254902, 0, 1, 1,
0.6751829, -1.139391, 1.717152, 0.3333333, 0, 1, 1,
0.6922934, -1.585503, 2.088151, 0.3372549, 0, 1, 1,
0.6939585, -0.07053529, 0.3905413, 0.345098, 0, 1, 1,
0.6956925, 0.9989735, 3.455817, 0.3490196, 0, 1, 1,
0.6988676, -0.9489235, 3.547452, 0.3568628, 0, 1, 1,
0.6989905, -1.159441, 0.9977981, 0.3607843, 0, 1, 1,
0.7027608, -0.4442384, 3.062526, 0.3686275, 0, 1, 1,
0.7109515, 0.3310411, -0.7112017, 0.372549, 0, 1, 1,
0.7130412, -0.5487644, 2.2816, 0.3803922, 0, 1, 1,
0.7149057, -0.07614422, 0.8764632, 0.3843137, 0, 1, 1,
0.718918, -0.6952015, 3.387811, 0.3921569, 0, 1, 1,
0.7203253, -0.11016, 1.98482, 0.3960784, 0, 1, 1,
0.7229568, 0.02538082, 2.978932, 0.4039216, 0, 1, 1,
0.729287, -0.1195998, 1.844443, 0.4117647, 0, 1, 1,
0.7346907, 0.2287735, 4.053738, 0.4156863, 0, 1, 1,
0.7377718, 0.4069716, 0.2291982, 0.4235294, 0, 1, 1,
0.7445824, -0.5402113, 1.81357, 0.427451, 0, 1, 1,
0.7534248, -0.1072072, 3.216143, 0.4352941, 0, 1, 1,
0.7535858, -2.557172, 3.561784, 0.4392157, 0, 1, 1,
0.7570059, -0.6882673, 1.879889, 0.4470588, 0, 1, 1,
0.7669216, -0.7229993, 2.637357, 0.4509804, 0, 1, 1,
0.7722278, 0.5448202, 1.042093, 0.4588235, 0, 1, 1,
0.7752961, 1.117457, 1.001623, 0.4627451, 0, 1, 1,
0.7779623, 1.332599, -0.8235037, 0.4705882, 0, 1, 1,
0.7812405, 0.444712, 2.052317, 0.4745098, 0, 1, 1,
0.7814981, -0.1042652, 1.27432, 0.4823529, 0, 1, 1,
0.784534, -0.03976877, 2.093777, 0.4862745, 0, 1, 1,
0.7900401, -0.7148588, 2.824176, 0.4941176, 0, 1, 1,
0.7910301, 0.03295011, 2.699236, 0.5019608, 0, 1, 1,
0.7928084, -0.4644941, 1.173357, 0.5058824, 0, 1, 1,
0.79584, -0.2070678, 1.831295, 0.5137255, 0, 1, 1,
0.7964522, -1.259122, 2.429525, 0.5176471, 0, 1, 1,
0.7969028, -0.9921721, 2.596939, 0.5254902, 0, 1, 1,
0.797745, -0.2458078, 3.3086, 0.5294118, 0, 1, 1,
0.7980265, 1.074817, 0.9912933, 0.5372549, 0, 1, 1,
0.7987528, -0.1823565, 1.032134, 0.5411765, 0, 1, 1,
0.8056794, -0.3661311, 2.215111, 0.5490196, 0, 1, 1,
0.8078377, 0.919687, 1.700397, 0.5529412, 0, 1, 1,
0.8166586, -0.2080817, 2.665828, 0.5607843, 0, 1, 1,
0.8190627, 0.04893535, 1.66844, 0.5647059, 0, 1, 1,
0.8200406, 1.177817, 1.943967, 0.572549, 0, 1, 1,
0.831307, 0.29592, 0.9524117, 0.5764706, 0, 1, 1,
0.8315535, -1.256019, 2.944525, 0.5843138, 0, 1, 1,
0.8334795, 0.7520138, -0.4093411, 0.5882353, 0, 1, 1,
0.8341235, -1.234868, 2.118678, 0.5960785, 0, 1, 1,
0.8358343, 0.1094666, 1.841267, 0.6039216, 0, 1, 1,
0.8365698, 0.230595, 1.657388, 0.6078432, 0, 1, 1,
0.8414294, 0.6275297, 1.987282, 0.6156863, 0, 1, 1,
0.8446121, -0.02150633, 0.02207396, 0.6196079, 0, 1, 1,
0.8503291, -0.9579749, 4.799378, 0.627451, 0, 1, 1,
0.8588949, 1.418911, 0.6785197, 0.6313726, 0, 1, 1,
0.8616647, -1.1709, 2.705096, 0.6392157, 0, 1, 1,
0.8647705, 0.1343002, 1.21042, 0.6431373, 0, 1, 1,
0.8787785, 0.7268376, 1.442056, 0.6509804, 0, 1, 1,
0.88122, -0.1154884, 2.854454, 0.654902, 0, 1, 1,
0.8869685, 0.2136932, 0.6136705, 0.6627451, 0, 1, 1,
0.8889938, -0.691521, 2.273453, 0.6666667, 0, 1, 1,
0.896772, -0.176086, 1.927089, 0.6745098, 0, 1, 1,
0.9027566, -0.7002549, 2.497252, 0.6784314, 0, 1, 1,
0.9032671, -0.2072554, 2.38873, 0.6862745, 0, 1, 1,
0.9063542, -0.07836221, 1.936832, 0.6901961, 0, 1, 1,
0.9067875, -1.009709, -0.6828024, 0.6980392, 0, 1, 1,
0.908222, 0.6892624, 1.118338, 0.7058824, 0, 1, 1,
0.9102387, -0.7743583, 2.47266, 0.7098039, 0, 1, 1,
0.9103452, 0.03281042, 0.8280032, 0.7176471, 0, 1, 1,
0.9110875, -0.9959038, 1.912707, 0.7215686, 0, 1, 1,
0.9120712, -0.1329303, 0.8304754, 0.7294118, 0, 1, 1,
0.9128272, 1.799252, 1.889758, 0.7333333, 0, 1, 1,
0.9133339, -0.9768313, 1.772937, 0.7411765, 0, 1, 1,
0.9141547, 0.6863123, 1.019061, 0.7450981, 0, 1, 1,
0.9189708, -0.7508054, 3.608465, 0.7529412, 0, 1, 1,
0.9264039, 1.625751, -0.4587179, 0.7568628, 0, 1, 1,
0.9265481, 0.4972133, 2.184335, 0.7647059, 0, 1, 1,
0.9288145, -1.039045, 3.267899, 0.7686275, 0, 1, 1,
0.930757, -2.096599, 3.601425, 0.7764706, 0, 1, 1,
0.9316955, 0.07823283, 0.9346253, 0.7803922, 0, 1, 1,
0.9355239, -0.8215879, 2.237408, 0.7882353, 0, 1, 1,
0.9373359, 1.098039, -0.2590988, 0.7921569, 0, 1, 1,
0.9457767, -0.5822176, 2.015914, 0.8, 0, 1, 1,
0.9476326, -0.3822944, 2.27059, 0.8078431, 0, 1, 1,
0.9479491, -0.9184496, 2.878084, 0.8117647, 0, 1, 1,
0.9496612, 1.894922, 1.249789, 0.8196079, 0, 1, 1,
0.954453, 1.31165, -0.7170884, 0.8235294, 0, 1, 1,
0.9545489, 1.510876, 1.163353, 0.8313726, 0, 1, 1,
0.9564627, -1.148826, 2.914685, 0.8352941, 0, 1, 1,
0.9577078, 1.255533, 1.366386, 0.8431373, 0, 1, 1,
0.9624853, -1.222128, 1.328771, 0.8470588, 0, 1, 1,
0.9644532, -1.105285, 2.600195, 0.854902, 0, 1, 1,
0.9669306, 1.712507, 1.117679, 0.8588235, 0, 1, 1,
0.9703214, 1.06236, -0.09676585, 0.8666667, 0, 1, 1,
0.9759911, 0.4050339, 1.541807, 0.8705882, 0, 1, 1,
0.9808403, -1.658016, 3.350612, 0.8784314, 0, 1, 1,
0.9814473, 0.3406524, 2.286611, 0.8823529, 0, 1, 1,
0.9849296, -2.035679, 4.26282, 0.8901961, 0, 1, 1,
0.9899898, -0.04208849, 1.792344, 0.8941177, 0, 1, 1,
0.9930516, 0.4193059, 1.488962, 0.9019608, 0, 1, 1,
0.9970008, -0.8504283, 2.154658, 0.9098039, 0, 1, 1,
0.9973493, 0.4504722, 3.179421, 0.9137255, 0, 1, 1,
0.9997718, 0.2971416, 1.955922, 0.9215686, 0, 1, 1,
1.005686, -0.963884, 2.059973, 0.9254902, 0, 1, 1,
1.005969, -0.05384319, 1.5398, 0.9333333, 0, 1, 1,
1.005983, -0.7076169, 2.963679, 0.9372549, 0, 1, 1,
1.008988, -0.2090962, 2.579826, 0.945098, 0, 1, 1,
1.010143, 0.3152041, 1.357085, 0.9490196, 0, 1, 1,
1.016268, 0.5777974, -0.3533281, 0.9568627, 0, 1, 1,
1.01997, -0.8965052, 1.53334, 0.9607843, 0, 1, 1,
1.020424, -0.7005862, 3.429666, 0.9686275, 0, 1, 1,
1.023883, -1.471133, 3.051311, 0.972549, 0, 1, 1,
1.026344, 2.163485, 0.3851854, 0.9803922, 0, 1, 1,
1.027746, -2.385835, 4.360222, 0.9843137, 0, 1, 1,
1.035634, 2.306794, -0.4765337, 0.9921569, 0, 1, 1,
1.043486, -0.1589623, 1.961128, 0.9960784, 0, 1, 1,
1.051673, 0.483587, -0.5548685, 1, 0, 0.9960784, 1,
1.058312, -1.090569, 2.450399, 1, 0, 0.9882353, 1,
1.059209, -1.26926, 2.013568, 1, 0, 0.9843137, 1,
1.064188, 0.7383861, 0.3372257, 1, 0, 0.9764706, 1,
1.06452, -0.9848657, 2.396258, 1, 0, 0.972549, 1,
1.074011, 0.3011481, 0.9486163, 1, 0, 0.9647059, 1,
1.075804, 0.5008358, 2.611808, 1, 0, 0.9607843, 1,
1.088909, -0.381606, 0.4524122, 1, 0, 0.9529412, 1,
1.091275, 1.234656, 2.100019, 1, 0, 0.9490196, 1,
1.092112, -0.4243014, 2.176547, 1, 0, 0.9411765, 1,
1.092667, -0.8972591, 2.157733, 1, 0, 0.9372549, 1,
1.094441, 0.2454792, 3.491031, 1, 0, 0.9294118, 1,
1.102894, 0.4217299, 1.587811, 1, 0, 0.9254902, 1,
1.104112, 0.5763015, 1.830478, 1, 0, 0.9176471, 1,
1.106914, -0.938684, 2.499996, 1, 0, 0.9137255, 1,
1.107491, 1.688612, 0.05560589, 1, 0, 0.9058824, 1,
1.113559, -0.3307956, 1.68511, 1, 0, 0.9019608, 1,
1.119995, -0.5662863, 1.847666, 1, 0, 0.8941177, 1,
1.123118, -0.7124613, 2.607987, 1, 0, 0.8862745, 1,
1.12624, 2.118888, -0.07459404, 1, 0, 0.8823529, 1,
1.129845, -1.700149, 1.240921, 1, 0, 0.8745098, 1,
1.13027, 0.5136572, 0.1987012, 1, 0, 0.8705882, 1,
1.133758, 0.8261259, 1.726576, 1, 0, 0.8627451, 1,
1.141064, -0.5459641, 1.767359, 1, 0, 0.8588235, 1,
1.14455, -1.606608, 2.581932, 1, 0, 0.8509804, 1,
1.14523, 0.5297863, 1.545871, 1, 0, 0.8470588, 1,
1.148682, -1.749557, 0.925124, 1, 0, 0.8392157, 1,
1.148928, -0.4609118, 2.037238, 1, 0, 0.8352941, 1,
1.150334, 1.362538, 0.2517332, 1, 0, 0.827451, 1,
1.151228, -2.259386, 1.179446, 1, 0, 0.8235294, 1,
1.151453, -0.4318352, 2.387614, 1, 0, 0.8156863, 1,
1.152843, 0.2689584, 1.684545, 1, 0, 0.8117647, 1,
1.154801, 1.899232, 0.7923371, 1, 0, 0.8039216, 1,
1.158622, 0.884841, 2.418461, 1, 0, 0.7960784, 1,
1.16501, 1.658042, 1.415151, 1, 0, 0.7921569, 1,
1.168975, 0.8916547, -0.07750772, 1, 0, 0.7843137, 1,
1.171359, 1.017548, 0.5554992, 1, 0, 0.7803922, 1,
1.181265, 1.261902, 0.4293883, 1, 0, 0.772549, 1,
1.187667, -1.743037, 3.679376, 1, 0, 0.7686275, 1,
1.189131, -0.2364615, 1.948669, 1, 0, 0.7607843, 1,
1.189713, -0.3536567, 2.593986, 1, 0, 0.7568628, 1,
1.189849, -1.377578, 1.60272, 1, 0, 0.7490196, 1,
1.196711, -0.6835111, 2.433445, 1, 0, 0.7450981, 1,
1.211519, 0.3669378, 0.1952611, 1, 0, 0.7372549, 1,
1.218117, -0.9364747, 2.283846, 1, 0, 0.7333333, 1,
1.220999, 0.877342, 0.7244473, 1, 0, 0.7254902, 1,
1.228856, -0.3014649, 1.462551, 1, 0, 0.7215686, 1,
1.237616, 1.627747, 1.257485, 1, 0, 0.7137255, 1,
1.243623, 1.269106, 0.6088542, 1, 0, 0.7098039, 1,
1.245588, 0.9628007, 0.1392424, 1, 0, 0.7019608, 1,
1.252235, 1.220274, 0.2518543, 1, 0, 0.6941177, 1,
1.253158, 1.042729, 0.5485485, 1, 0, 0.6901961, 1,
1.258302, -0.2298653, 0.3741546, 1, 0, 0.682353, 1,
1.261302, -1.385189, 1.254383, 1, 0, 0.6784314, 1,
1.268234, 0.7772264, 1.357786, 1, 0, 0.6705883, 1,
1.268728, -0.3771273, 2.754306, 1, 0, 0.6666667, 1,
1.279789, 1.565024, -0.4259782, 1, 0, 0.6588235, 1,
1.281229, 1.750475, -0.1665868, 1, 0, 0.654902, 1,
1.281563, -1.471725, 1.586788, 1, 0, 0.6470588, 1,
1.282948, 1.319799, 2.370389, 1, 0, 0.6431373, 1,
1.287334, 0.236556, 2.586787, 1, 0, 0.6352941, 1,
1.302044, 0.4892159, -0.01176799, 1, 0, 0.6313726, 1,
1.308789, -0.7160032, 2.615479, 1, 0, 0.6235294, 1,
1.309616, -0.03377139, 1.027683, 1, 0, 0.6196079, 1,
1.322377, 0.5487793, 2.330101, 1, 0, 0.6117647, 1,
1.339579, 1.163912, 1.222157, 1, 0, 0.6078432, 1,
1.34182, -0.05628775, 2.341282, 1, 0, 0.6, 1,
1.34243, -0.5572125, 0.9333599, 1, 0, 0.5921569, 1,
1.343248, -0.5450027, 3.575555, 1, 0, 0.5882353, 1,
1.349029, 0.6034462, 1.349332, 1, 0, 0.5803922, 1,
1.353384, 0.1184953, 1.063208, 1, 0, 0.5764706, 1,
1.355107, 0.1529409, 2.316034, 1, 0, 0.5686275, 1,
1.371386, -0.1407497, 2.294643, 1, 0, 0.5647059, 1,
1.373431, 0.2679991, 2.029245, 1, 0, 0.5568628, 1,
1.376822, 1.478805, -0.8564866, 1, 0, 0.5529412, 1,
1.381993, -1.311893, 3.434921, 1, 0, 0.5450981, 1,
1.3948, -1.153419, 0.8118928, 1, 0, 0.5411765, 1,
1.415389, -2.089712, 1.994495, 1, 0, 0.5333334, 1,
1.429673, -0.6145739, 1.880506, 1, 0, 0.5294118, 1,
1.431013, -0.9302772, 2.205522, 1, 0, 0.5215687, 1,
1.438663, -1.479522, 1.586927, 1, 0, 0.5176471, 1,
1.456019, 0.4809687, 3.524978, 1, 0, 0.509804, 1,
1.464631, 1.203571, -0.3586953, 1, 0, 0.5058824, 1,
1.469121, 0.5900461, 1.689811, 1, 0, 0.4980392, 1,
1.4718, -0.7056121, 0.8544695, 1, 0, 0.4901961, 1,
1.472161, -2.395897, 3.215622, 1, 0, 0.4862745, 1,
1.473461, -2.078759, 2.038679, 1, 0, 0.4784314, 1,
1.479576, -1.443207, 3.153278, 1, 0, 0.4745098, 1,
1.480246, 0.1900338, 1.456042, 1, 0, 0.4666667, 1,
1.481843, 0.07709847, 1.732308, 1, 0, 0.4627451, 1,
1.483058, -0.1671319, 3.108304, 1, 0, 0.454902, 1,
1.488675, -0.427986, 1.404493, 1, 0, 0.4509804, 1,
1.492402, 0.824019, 2.422582, 1, 0, 0.4431373, 1,
1.498324, 0.8553891, 0.07520561, 1, 0, 0.4392157, 1,
1.501915, -0.2550507, 1.880128, 1, 0, 0.4313726, 1,
1.504452, 0.4184704, 1.380821, 1, 0, 0.427451, 1,
1.516497, -1.743155, 4.417292, 1, 0, 0.4196078, 1,
1.519061, 0.5787459, 1.892583, 1, 0, 0.4156863, 1,
1.532167, 1.887178, 0.6827699, 1, 0, 0.4078431, 1,
1.534568, -0.7609155, 1.005682, 1, 0, 0.4039216, 1,
1.541729, -1.661885, 2.36252, 1, 0, 0.3960784, 1,
1.54544, -1.992591, 3.306725, 1, 0, 0.3882353, 1,
1.547773, 0.09021436, 0.2748371, 1, 0, 0.3843137, 1,
1.567892, 0.3705636, 2.099331, 1, 0, 0.3764706, 1,
1.572448, 0.2608564, 1.759977, 1, 0, 0.372549, 1,
1.572919, 2.392647, 1.470741, 1, 0, 0.3647059, 1,
1.610258, 0.6485184, 1.73461, 1, 0, 0.3607843, 1,
1.618507, -2.075201, 2.628778, 1, 0, 0.3529412, 1,
1.619673, -1.120036, 2.763219, 1, 0, 0.3490196, 1,
1.625639, -0.8690588, 2.538957, 1, 0, 0.3411765, 1,
1.632837, 0.2837991, 0.3131662, 1, 0, 0.3372549, 1,
1.640988, -1.734378, -0.05297413, 1, 0, 0.3294118, 1,
1.642369, -0.2423698, 1.122527, 1, 0, 0.3254902, 1,
1.667413, -0.03034203, 1.536109, 1, 0, 0.3176471, 1,
1.674516, -0.3416062, 1.495743, 1, 0, 0.3137255, 1,
1.693057, -0.4380798, 3.144025, 1, 0, 0.3058824, 1,
1.722758, 1.921124, 1.370238, 1, 0, 0.2980392, 1,
1.727303, -0.04626015, 0.9169086, 1, 0, 0.2941177, 1,
1.753755, 0.353429, 1.669989, 1, 0, 0.2862745, 1,
1.753909, 0.3221779, 1.203831, 1, 0, 0.282353, 1,
1.755614, -0.4579762, 1.647763, 1, 0, 0.2745098, 1,
1.769516, 0.5579932, -0.5500016, 1, 0, 0.2705882, 1,
1.7753, 0.4904749, 1.669345, 1, 0, 0.2627451, 1,
1.794144, 0.5384485, 2.803226, 1, 0, 0.2588235, 1,
1.807591, 1.367116, 1.755648, 1, 0, 0.2509804, 1,
1.820942, -0.2495076, 2.385028, 1, 0, 0.2470588, 1,
1.822387, -0.1109762, 1.678931, 1, 0, 0.2392157, 1,
1.826005, -0.7197973, 0.9361693, 1, 0, 0.2352941, 1,
1.849957, 1.597771, 0.74522, 1, 0, 0.227451, 1,
1.868462, -0.9253192, 2.51817, 1, 0, 0.2235294, 1,
1.887554, 1.820222, 0.5068494, 1, 0, 0.2156863, 1,
1.928545, 0.6208565, 1.001177, 1, 0, 0.2117647, 1,
1.93744, -1.185892, 3.821218, 1, 0, 0.2039216, 1,
1.954546, -0.3265558, 2.353753, 1, 0, 0.1960784, 1,
1.956736, -1.107922, 3.117362, 1, 0, 0.1921569, 1,
1.964126, -1.030721, 1.323282, 1, 0, 0.1843137, 1,
1.970142, 0.2016002, 3.801962, 1, 0, 0.1803922, 1,
2.053032, 0.05013444, 1.90774, 1, 0, 0.172549, 1,
2.055315, 1.177786, 0.521333, 1, 0, 0.1686275, 1,
2.113032, 0.2332527, 1.594721, 1, 0, 0.1607843, 1,
2.20382, -1.796949, 3.200713, 1, 0, 0.1568628, 1,
2.216442, -0.4345997, 1.49428, 1, 0, 0.1490196, 1,
2.217821, 0.4957296, 2.209993, 1, 0, 0.145098, 1,
2.229816, 0.1234567, 1.722654, 1, 0, 0.1372549, 1,
2.313921, 0.2650887, 2.53706, 1, 0, 0.1333333, 1,
2.325183, -0.8592157, 2.548574, 1, 0, 0.1254902, 1,
2.334726, 0.9892174, 0.1123486, 1, 0, 0.1215686, 1,
2.334756, 0.0001737326, 0.4217936, 1, 0, 0.1137255, 1,
2.339977, 0.234856, 0.7393291, 1, 0, 0.1098039, 1,
2.348593, -0.5124174, 2.33814, 1, 0, 0.1019608, 1,
2.421367, -1.4093, 2.172024, 1, 0, 0.09411765, 1,
2.436934, -0.2006424, 2.398869, 1, 0, 0.09019608, 1,
2.444498, -0.1442262, 1.702697, 1, 0, 0.08235294, 1,
2.46099, 1.193316, -1.980957, 1, 0, 0.07843138, 1,
2.515589, 0.1970783, 0.1569779, 1, 0, 0.07058824, 1,
2.515839, 0.06806302, 0.1725537, 1, 0, 0.06666667, 1,
2.540923, -1.81571, 1.995392, 1, 0, 0.05882353, 1,
2.603939, 0.4500865, 0.2327353, 1, 0, 0.05490196, 1,
2.612135, -0.2338721, 1.027754, 1, 0, 0.04705882, 1,
2.705224, 2.231777, 0.1345953, 1, 0, 0.04313726, 1,
2.826575, -1.355536, 2.741915, 1, 0, 0.03529412, 1,
2.847799, 0.1134886, 2.746152, 1, 0, 0.03137255, 1,
2.906556, -1.136912, 2.932459, 1, 0, 0.02352941, 1,
3.025655, 1.492162, 0.5430897, 1, 0, 0.01960784, 1,
3.21877, 0.5396215, -0.7648718, 1, 0, 0.01176471, 1,
3.447225, 0.004624191, 2.064455, 1, 0, 0.007843138, 1
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
0.2762338, -4.637987, -7.50599, 0, -0.5, 0.5, 0.5,
0.2762338, -4.637987, -7.50599, 1, -0.5, 0.5, 0.5,
0.2762338, -4.637987, -7.50599, 1, 1.5, 0.5, 0.5,
0.2762338, -4.637987, -7.50599, 0, 1.5, 0.5, 0.5
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
-3.969723, 0.04656053, -7.50599, 0, -0.5, 0.5, 0.5,
-3.969723, 0.04656053, -7.50599, 1, -0.5, 0.5, 0.5,
-3.969723, 0.04656053, -7.50599, 1, 1.5, 0.5, 0.5,
-3.969723, 0.04656053, -7.50599, 0, 1.5, 0.5, 0.5
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
-3.969723, -4.637987, -0.1180305, 0, -0.5, 0.5, 0.5,
-3.969723, -4.637987, -0.1180305, 1, -0.5, 0.5, 0.5,
-3.969723, -4.637987, -0.1180305, 1, 1.5, 0.5, 0.5,
-3.969723, -4.637987, -0.1180305, 0, 1.5, 0.5, 0.5
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
-2, -3.556937, -5.801076,
3, -3.556937, -5.801076,
-2, -3.556937, -5.801076,
-2, -3.737113, -6.085228,
-1, -3.556937, -5.801076,
-1, -3.737113, -6.085228,
0, -3.556937, -5.801076,
0, -3.737113, -6.085228,
1, -3.556937, -5.801076,
1, -3.737113, -6.085228,
2, -3.556937, -5.801076,
2, -3.737113, -6.085228,
3, -3.556937, -5.801076,
3, -3.737113, -6.085228
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
-2, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
-2, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
-2, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
-2, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5,
-1, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
-1, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
-1, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
-1, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5,
0, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
0, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
0, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
0, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5,
1, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
1, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
1, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
1, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5,
2, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
2, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
2, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
2, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5,
3, -4.097462, -6.653533, 0, -0.5, 0.5, 0.5,
3, -4.097462, -6.653533, 1, -0.5, 0.5, 0.5,
3, -4.097462, -6.653533, 1, 1.5, 0.5, 0.5,
3, -4.097462, -6.653533, 0, 1.5, 0.5, 0.5
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
-2.989887, -3, -5.801076,
-2.989887, 3, -5.801076,
-2.989887, -3, -5.801076,
-3.153193, -3, -6.085228,
-2.989887, -2, -5.801076,
-3.153193, -2, -6.085228,
-2.989887, -1, -5.801076,
-3.153193, -1, -6.085228,
-2.989887, 0, -5.801076,
-3.153193, 0, -6.085228,
-2.989887, 1, -5.801076,
-3.153193, 1, -6.085228,
-2.989887, 2, -5.801076,
-3.153193, 2, -6.085228,
-2.989887, 3, -5.801076,
-3.153193, 3, -6.085228
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
-3.479805, -3, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, -3, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, -3, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, -3, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, -2, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, -2, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, -2, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, -2, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, -1, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, -1, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, -1, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, -1, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, 0, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, 0, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, 0, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, 0, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, 1, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, 1, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, 1, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, 1, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, 2, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, 2, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, 2, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, 2, -6.653533, 0, 1.5, 0.5, 0.5,
-3.479805, 3, -6.653533, 0, -0.5, 0.5, 0.5,
-3.479805, 3, -6.653533, 1, -0.5, 0.5, 0.5,
-3.479805, 3, -6.653533, 1, 1.5, 0.5, 0.5,
-3.479805, 3, -6.653533, 0, 1.5, 0.5, 0.5
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
-2.989887, -3.556937, -4,
-2.989887, -3.556937, 4,
-2.989887, -3.556937, -4,
-3.153193, -3.737113, -4,
-2.989887, -3.556937, -2,
-3.153193, -3.737113, -2,
-2.989887, -3.556937, 0,
-3.153193, -3.737113, 0,
-2.989887, -3.556937, 2,
-3.153193, -3.737113, 2,
-2.989887, -3.556937, 4,
-3.153193, -3.737113, 4
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
-3.479805, -4.097462, -4, 0, -0.5, 0.5, 0.5,
-3.479805, -4.097462, -4, 1, -0.5, 0.5, 0.5,
-3.479805, -4.097462, -4, 1, 1.5, 0.5, 0.5,
-3.479805, -4.097462, -4, 0, 1.5, 0.5, 0.5,
-3.479805, -4.097462, -2, 0, -0.5, 0.5, 0.5,
-3.479805, -4.097462, -2, 1, -0.5, 0.5, 0.5,
-3.479805, -4.097462, -2, 1, 1.5, 0.5, 0.5,
-3.479805, -4.097462, -2, 0, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 0, 0, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 0, 1, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 0, 1, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 0, 0, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 2, 0, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 2, 1, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 2, 1, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 2, 0, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 4, 0, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 4, 1, -0.5, 0.5, 0.5,
-3.479805, -4.097462, 4, 1, 1.5, 0.5, 0.5,
-3.479805, -4.097462, 4, 0, 1.5, 0.5, 0.5
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
-2.989887, -3.556937, -5.801076,
-2.989887, 3.650059, -5.801076,
-2.989887, -3.556937, 5.565015,
-2.989887, 3.650059, 5.565015,
-2.989887, -3.556937, -5.801076,
-2.989887, -3.556937, 5.565015,
-2.989887, 3.650059, -5.801076,
-2.989887, 3.650059, 5.565015,
-2.989887, -3.556937, -5.801076,
3.542354, -3.556937, -5.801076,
-2.989887, -3.556937, 5.565015,
3.542354, -3.556937, 5.565015,
-2.989887, 3.650059, -5.801076,
3.542354, 3.650059, -5.801076,
-2.989887, 3.650059, 5.565015,
3.542354, 3.650059, 5.565015,
3.542354, -3.556937, -5.801076,
3.542354, 3.650059, -5.801076,
3.542354, -3.556937, 5.565015,
3.542354, 3.650059, 5.565015,
3.542354, -3.556937, -5.801076,
3.542354, -3.556937, 5.565015,
3.542354, 3.650059, -5.801076,
3.542354, 3.650059, 5.565015
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
var radius = 7.988303;
var distance = 35.54086;
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
mvMatrix.translate( -0.2762338, -0.04656053, 0.1180305 );
mvMatrix.scale( 1.322228, 1.198434, 0.7599015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54086);
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
3-methoxy-6-phenyl-2<-read.table("3-methoxy-6-phenyl-2.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-methoxy-6-phenyl-2$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoxy' not found
```

```r
y<-3-methoxy-6-phenyl-2$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoxy' not found
```

```r
z<-3-methoxy-6-phenyl-2$V4
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
-2.894757, 0.7459024, -0.5724412, 0, 0, 1, 1, 1,
-2.8733, 0.2803419, -1.823394, 1, 0, 0, 1, 1,
-2.832841, -0.7798239, -2.349284, 1, 0, 0, 1, 1,
-2.683345, -0.6930681, -2.714702, 1, 0, 0, 1, 1,
-2.598267, 0.406211, -1.006761, 1, 0, 0, 1, 1,
-2.531062, 2.029441, -0.6082416, 1, 0, 0, 1, 1,
-2.480005, -0.3741917, -0.9941136, 0, 0, 0, 1, 1,
-2.416996, -0.857358, -0.20673, 0, 0, 0, 1, 1,
-2.391422, 0.526797, -1.244871, 0, 0, 0, 1, 1,
-2.31137, 0.3497344, -1.828994, 0, 0, 0, 1, 1,
-2.310295, -0.2312045, -2.076791, 0, 0, 0, 1, 1,
-2.259167, -0.7835427, 2.679095, 0, 0, 0, 1, 1,
-2.225943, -0.05231408, -3.803039, 0, 0, 0, 1, 1,
-2.221044, -0.6497321, -0.5455516, 1, 1, 1, 1, 1,
-2.162582, 0.08470208, -1.701429, 1, 1, 1, 1, 1,
-2.151244, 0.1371319, -2.436608, 1, 1, 1, 1, 1,
-2.142824, -0.5512531, -2.126463, 1, 1, 1, 1, 1,
-2.139577, 0.3371807, -2.354148, 1, 1, 1, 1, 1,
-2.136048, 0.1083421, -2.512099, 1, 1, 1, 1, 1,
-2.094885, 0.01685348, -0.836166, 1, 1, 1, 1, 1,
-2.085649, 2.113966, -1.898885, 1, 1, 1, 1, 1,
-2.033642, 1.84245, -0.03162649, 1, 1, 1, 1, 1,
-2.022901, -2.830627, -1.815092, 1, 1, 1, 1, 1,
-2.010437, -1.435412, -3.926453, 1, 1, 1, 1, 1,
-1.99273, 0.2660559, -1.815154, 1, 1, 1, 1, 1,
-1.9863, 0.4040142, -2.542769, 1, 1, 1, 1, 1,
-1.977831, -0.489767, -1.540216, 1, 1, 1, 1, 1,
-1.97738, 0.2297251, -0.6867401, 1, 1, 1, 1, 1,
-1.96922, 0.0441981, -1.117147, 0, 0, 1, 1, 1,
-1.969161, 0.5903246, -2.892826, 1, 0, 0, 1, 1,
-1.955013, -1.263871, -1.331427, 1, 0, 0, 1, 1,
-1.942645, 0.4162265, -1.603613, 1, 0, 0, 1, 1,
-1.923034, 1.695753, -0.9436549, 1, 0, 0, 1, 1,
-1.879193, -0.157903, -1.621342, 1, 0, 0, 1, 1,
-1.868182, -0.5048711, 0.3505397, 0, 0, 0, 1, 1,
-1.865469, 0.06294829, -1.705692, 0, 0, 0, 1, 1,
-1.847951, 0.8156589, -1.715284, 0, 0, 0, 1, 1,
-1.832, -0.02130758, -1.841781, 0, 0, 0, 1, 1,
-1.830763, -1.045126, -2.31288, 0, 0, 0, 1, 1,
-1.795857, 1.021131, -0.9493835, 0, 0, 0, 1, 1,
-1.780415, 1.914076, -0.7973491, 0, 0, 0, 1, 1,
-1.754679, -0.6897758, -2.09779, 1, 1, 1, 1, 1,
-1.751711, 0.8834682, -0.4256149, 1, 1, 1, 1, 1,
-1.751283, -2.04608, -0.2687474, 1, 1, 1, 1, 1,
-1.748037, 1.192023, -1.100833, 1, 1, 1, 1, 1,
-1.742707, -0.09497365, -2.005521, 1, 1, 1, 1, 1,
-1.731132, -1.117205, -2.51414, 1, 1, 1, 1, 1,
-1.716599, 1.19072, -1.962764, 1, 1, 1, 1, 1,
-1.711828, 0.2664337, -3.062891, 1, 1, 1, 1, 1,
-1.700826, 1.358549, -1.062632, 1, 1, 1, 1, 1,
-1.699145, -1.246914, -2.759353, 1, 1, 1, 1, 1,
-1.690995, -0.5888577, -2.120316, 1, 1, 1, 1, 1,
-1.688939, 0.349346, -2.440301, 1, 1, 1, 1, 1,
-1.628619, -0.1801897, -1.476824, 1, 1, 1, 1, 1,
-1.623748, -0.4190001, -1.548004, 1, 1, 1, 1, 1,
-1.620208, 1.558389, 0.3812526, 1, 1, 1, 1, 1,
-1.617118, -1.07821, -2.205254, 0, 0, 1, 1, 1,
-1.614211, -0.830928, -0.7870718, 1, 0, 0, 1, 1,
-1.60466, 0.5099836, -0.1596337, 1, 0, 0, 1, 1,
-1.603237, 0.1519572, -0.09383605, 1, 0, 0, 1, 1,
-1.602121, -0.8127089, -2.085074, 1, 0, 0, 1, 1,
-1.598197, -0.5777416, -0.9350263, 1, 0, 0, 1, 1,
-1.597712, -1.9756, -2.139621, 0, 0, 0, 1, 1,
-1.59707, -1.070795, -2.369986, 0, 0, 0, 1, 1,
-1.594856, 0.2514974, -0.9936794, 0, 0, 0, 1, 1,
-1.58745, 1.144366, -1.951829, 0, 0, 0, 1, 1,
-1.578299, 0.8926831, -0.3191547, 0, 0, 0, 1, 1,
-1.561666, -0.1735706, -2.104172, 0, 0, 0, 1, 1,
-1.559841, -0.8745108, -0.612305, 0, 0, 0, 1, 1,
-1.558025, 0.2139511, -1.924969, 1, 1, 1, 1, 1,
-1.546136, 1.949434, -2.373059, 1, 1, 1, 1, 1,
-1.542208, -0.5616904, -0.3614869, 1, 1, 1, 1, 1,
-1.529331, -1.359208, -3.898703, 1, 1, 1, 1, 1,
-1.527132, 0.2121486, -1.096385, 1, 1, 1, 1, 1,
-1.510038, -1.106447, -2.881414, 1, 1, 1, 1, 1,
-1.497343, -0.393479, -1.942738, 1, 1, 1, 1, 1,
-1.486867, -0.4328432, -0.7689036, 1, 1, 1, 1, 1,
-1.474232, -3.165664, -1.602138, 1, 1, 1, 1, 1,
-1.466374, -0.9606276, -1.636399, 1, 1, 1, 1, 1,
-1.464985, 0.5221624, -1.069024, 1, 1, 1, 1, 1,
-1.458993, 1.404818, -1.452546, 1, 1, 1, 1, 1,
-1.451836, -0.4764859, -0.01585685, 1, 1, 1, 1, 1,
-1.451088, -0.6721739, -1.775318, 1, 1, 1, 1, 1,
-1.445523, -0.07248789, 0.3021226, 1, 1, 1, 1, 1,
-1.445045, -1.785486, -1.672756, 0, 0, 1, 1, 1,
-1.421696, 0.3074514, -1.17513, 1, 0, 0, 1, 1,
-1.410553, 1.773418, -1.61174, 1, 0, 0, 1, 1,
-1.408779, 0.4718866, -0.5154049, 1, 0, 0, 1, 1,
-1.406089, -0.315033, -2.150126, 1, 0, 0, 1, 1,
-1.402063, 0.729213, -1.134636, 1, 0, 0, 1, 1,
-1.394507, 0.2587464, -2.397044, 0, 0, 0, 1, 1,
-1.385755, 1.392348, -1.399077, 0, 0, 0, 1, 1,
-1.368715, -1.559034, -3.792877, 0, 0, 0, 1, 1,
-1.366948, 0.292291, -1.189028, 0, 0, 0, 1, 1,
-1.360505, -0.8234665, -2.541791, 0, 0, 0, 1, 1,
-1.358778, 1.562868, -1.065174, 0, 0, 0, 1, 1,
-1.354645, -0.09534811, -1.04908, 0, 0, 0, 1, 1,
-1.34812, 0.4805573, 0.8012981, 1, 1, 1, 1, 1,
-1.347333, 1.205029, -1.059306, 1, 1, 1, 1, 1,
-1.337434, -0.9147375, -1.408836, 1, 1, 1, 1, 1,
-1.332715, 0.3862707, -3.028256, 1, 1, 1, 1, 1,
-1.330522, -1.946936, -1.714652, 1, 1, 1, 1, 1,
-1.315575, 0.1468333, -2.530628, 1, 1, 1, 1, 1,
-1.314981, -0.9278831, -2.60649, 1, 1, 1, 1, 1,
-1.301666, -0.3479452, -2.42251, 1, 1, 1, 1, 1,
-1.297998, 0.8789364, -0.1718077, 1, 1, 1, 1, 1,
-1.295993, 1.700388, -1.424777, 1, 1, 1, 1, 1,
-1.28998, -0.2240443, -0.5484263, 1, 1, 1, 1, 1,
-1.284981, -2.556094, -3.176259, 1, 1, 1, 1, 1,
-1.281816, 0.7717443, -1.595134, 1, 1, 1, 1, 1,
-1.280156, -0.5832948, -3.451921, 1, 1, 1, 1, 1,
-1.277067, -0.6101744, -2.312405, 1, 1, 1, 1, 1,
-1.273118, 0.1249919, -0.6817199, 0, 0, 1, 1, 1,
-1.253466, -0.6025943, -1.482486, 1, 0, 0, 1, 1,
-1.244776, 0.6208825, 0.6006795, 1, 0, 0, 1, 1,
-1.243978, -0.002564994, -1.095389, 1, 0, 0, 1, 1,
-1.237311, 3.545102, -0.699727, 1, 0, 0, 1, 1,
-1.226296, 1.743025, -0.4717461, 1, 0, 0, 1, 1,
-1.224863, 2.327537, -1.445389, 0, 0, 0, 1, 1,
-1.222983, 0.4656306, -2.15064, 0, 0, 0, 1, 1,
-1.222506, 0.7560263, -1.622331, 0, 0, 0, 1, 1,
-1.219621, -2.024995, -3.132432, 0, 0, 0, 1, 1,
-1.205025, -0.1599021, -1.866348, 0, 0, 0, 1, 1,
-1.200641, -1.199541, -2.562358, 0, 0, 0, 1, 1,
-1.199796, 0.887601, -0.4924202, 0, 0, 0, 1, 1,
-1.199689, -0.1641215, -1.865797, 1, 1, 1, 1, 1,
-1.198098, -0.5665407, -0.8286593, 1, 1, 1, 1, 1,
-1.189744, -0.4493862, -1.246816, 1, 1, 1, 1, 1,
-1.187744, -0.7299484, -2.302294, 1, 1, 1, 1, 1,
-1.186217, -0.5839754, -3.678534, 1, 1, 1, 1, 1,
-1.185793, -1.087636, -3.408332, 1, 1, 1, 1, 1,
-1.182454, 1.708976, -3.095634, 1, 1, 1, 1, 1,
-1.182227, 1.07282, -0.9381821, 1, 1, 1, 1, 1,
-1.18202, -1.128902, -3.289022, 1, 1, 1, 1, 1,
-1.180759, 0.4893633, -0.0951042, 1, 1, 1, 1, 1,
-1.178747, 1.579312, -1.830724, 1, 1, 1, 1, 1,
-1.174712, 0.3147897, -0.1865601, 1, 1, 1, 1, 1,
-1.160094, -0.2502391, -1.707873, 1, 1, 1, 1, 1,
-1.159883, -0.7391183, -2.455335, 1, 1, 1, 1, 1,
-1.156524, -0.1102743, 0.452305, 1, 1, 1, 1, 1,
-1.152438, 0.5850275, -1.382297, 0, 0, 1, 1, 1,
-1.152009, 0.5861657, 0.3848846, 1, 0, 0, 1, 1,
-1.147781, 2.974478, -0.4624147, 1, 0, 0, 1, 1,
-1.139447, 1.768262, 0.5391238, 1, 0, 0, 1, 1,
-1.138209, 1.501583, -0.6092498, 1, 0, 0, 1, 1,
-1.132799, 0.6597316, -1.708543, 1, 0, 0, 1, 1,
-1.12866, -0.3476448, -2.72859, 0, 0, 0, 1, 1,
-1.12259, 0.4281088, 0.1091817, 0, 0, 0, 1, 1,
-1.121863, 0.1131476, -2.121404, 0, 0, 0, 1, 1,
-1.105677, -2.683963, -1.785218, 0, 0, 0, 1, 1,
-1.101265, 0.3680573, -2.039876, 0, 0, 0, 1, 1,
-1.098634, 0.1310856, -1.004259, 0, 0, 0, 1, 1,
-1.095053, -0.1319439, 0.331244, 0, 0, 0, 1, 1,
-1.095005, -0.7551646, -4.478099, 1, 1, 1, 1, 1,
-1.093302, 1.135347, -1.202971, 1, 1, 1, 1, 1,
-1.085902, -0.1113632, -1.65564, 1, 1, 1, 1, 1,
-1.085588, -0.4676005, -0.6109617, 1, 1, 1, 1, 1,
-1.079522, 0.4968563, -0.03785411, 1, 1, 1, 1, 1,
-1.058969, 0.2833575, -0.8406937, 1, 1, 1, 1, 1,
-1.056807, -2.40104, -2.165281, 1, 1, 1, 1, 1,
-1.049833, -0.4858415, -1.422148, 1, 1, 1, 1, 1,
-1.041165, 0.2730728, -2.101113, 1, 1, 1, 1, 1,
-1.034914, 0.6997524, -0.02065637, 1, 1, 1, 1, 1,
-1.033576, -0.4157406, -3.603469, 1, 1, 1, 1, 1,
-1.00095, -1.527288, -1.52908, 1, 1, 1, 1, 1,
-0.9999528, 1.84863, -0.4631524, 1, 1, 1, 1, 1,
-0.9988141, -1.06965, -2.333653, 1, 1, 1, 1, 1,
-0.9964492, -0.1430675, -2.091155, 1, 1, 1, 1, 1,
-0.9872679, -1.296149, -1.765064, 0, 0, 1, 1, 1,
-0.9871933, 1.405529, -0.5644648, 1, 0, 0, 1, 1,
-0.9836017, -1.611976, -4.649096, 1, 0, 0, 1, 1,
-0.9816626, -0.802509, -3.113127, 1, 0, 0, 1, 1,
-0.9790769, -0.6542265, -3.240411, 1, 0, 0, 1, 1,
-0.9748489, -0.7845478, -2.119082, 1, 0, 0, 1, 1,
-0.9728226, -2.66359, -4.986399, 0, 0, 0, 1, 1,
-0.9645146, -1.624094, -4.274305, 0, 0, 0, 1, 1,
-0.962796, -0.7942528, -4.011284, 0, 0, 0, 1, 1,
-0.9627904, -0.353446, -0.8264431, 0, 0, 0, 1, 1,
-0.9599589, -0.1473524, -2.111206, 0, 0, 0, 1, 1,
-0.9532628, -0.2069516, -2.99024, 0, 0, 0, 1, 1,
-0.95274, 0.1967398, -0.8177954, 0, 0, 0, 1, 1,
-0.9507802, 0.8489842, -1.264537, 1, 1, 1, 1, 1,
-0.9494042, 1.272524, -1.74602, 1, 1, 1, 1, 1,
-0.9443547, -0.9373676, -1.134153, 1, 1, 1, 1, 1,
-0.9401402, 0.1208315, -0.9653167, 1, 1, 1, 1, 1,
-0.923029, -1.436278, -1.558407, 1, 1, 1, 1, 1,
-0.9220262, -0.1275022, -2.64435, 1, 1, 1, 1, 1,
-0.9188785, -1.623354, -2.29898, 1, 1, 1, 1, 1,
-0.9177451, 0.8168389, -0.1008238, 1, 1, 1, 1, 1,
-0.9177158, -0.2208176, -1.084378, 1, 1, 1, 1, 1,
-0.9131181, -0.236586, -1.943309, 1, 1, 1, 1, 1,
-0.8856392, -0.2669373, -2.343397, 1, 1, 1, 1, 1,
-0.8853118, 0.045365, -1.285504, 1, 1, 1, 1, 1,
-0.8845335, -0.6628986, -2.816468, 1, 1, 1, 1, 1,
-0.8842058, -1.499301, -2.343152, 1, 1, 1, 1, 1,
-0.8830696, -1.45535, -3.290721, 1, 1, 1, 1, 1,
-0.8795837, -0.3223672, -3.916987, 0, 0, 1, 1, 1,
-0.8771322, -1.219744, -1.749095, 1, 0, 0, 1, 1,
-0.8745478, 0.8409696, 0.2369917, 1, 0, 0, 1, 1,
-0.874254, 0.3054646, -2.211345, 1, 0, 0, 1, 1,
-0.8732347, -1.150503, -2.361502, 1, 0, 0, 1, 1,
-0.8562852, -0.604309, -1.182292, 1, 0, 0, 1, 1,
-0.8498839, 0.6629973, -0.2236717, 0, 0, 0, 1, 1,
-0.8495134, -1.477109, -5.019498, 0, 0, 0, 1, 1,
-0.8459988, -0.6460198, -2.321223, 0, 0, 0, 1, 1,
-0.8450226, 0.1225341, -1.977016, 0, 0, 0, 1, 1,
-0.8435466, 0.9764093, -0.7287447, 0, 0, 0, 1, 1,
-0.8383963, -1.613653, -2.341683, 0, 0, 0, 1, 1,
-0.8312569, -1.351907, -2.29643, 0, 0, 0, 1, 1,
-0.8246055, 1.515319, -0.1360468, 1, 1, 1, 1, 1,
-0.81917, -1.142717, -2.87539, 1, 1, 1, 1, 1,
-0.8135684, 0.8210965, -0.3351685, 1, 1, 1, 1, 1,
-0.8118777, 0.3988737, -1.181976, 1, 1, 1, 1, 1,
-0.8028724, -0.5285282, -2.408627, 1, 1, 1, 1, 1,
-0.7892919, 1.12312, -1.4763, 1, 1, 1, 1, 1,
-0.7862761, 1.046755, -0.1386575, 1, 1, 1, 1, 1,
-0.7836436, 0.8147084, 0.3822872, 1, 1, 1, 1, 1,
-0.7651331, -1.385658, -1.111938, 1, 1, 1, 1, 1,
-0.7650261, 0.1577307, -0.6475987, 1, 1, 1, 1, 1,
-0.764225, -0.3514319, -1.496118, 1, 1, 1, 1, 1,
-0.7629911, 1.151182, 0.4241513, 1, 1, 1, 1, 1,
-0.7527739, 0.2634666, -0.4552182, 1, 1, 1, 1, 1,
-0.7517862, 0.9416302, -0.997125, 1, 1, 1, 1, 1,
-0.7491724, 0.4177132, -0.7580246, 1, 1, 1, 1, 1,
-0.7443693, 0.2084204, -0.3218691, 0, 0, 1, 1, 1,
-0.7411125, -0.3740689, -2.062726, 1, 0, 0, 1, 1,
-0.7405546, 0.221277, 0.3559176, 1, 0, 0, 1, 1,
-0.7402094, -0.860183, -2.040316, 1, 0, 0, 1, 1,
-0.7321728, -0.97421, -3.243086, 1, 0, 0, 1, 1,
-0.7304392, -0.4036143, -2.215365, 1, 0, 0, 1, 1,
-0.7274996, -0.9664742, -3.750124, 0, 0, 0, 1, 1,
-0.7272713, 0.2962663, 0.698291, 0, 0, 0, 1, 1,
-0.7239006, -0.4564019, -2.640346, 0, 0, 0, 1, 1,
-0.7214824, 1.106066, -0.2242006, 0, 0, 0, 1, 1,
-0.7161849, -0.937869, -1.714925, 0, 0, 0, 1, 1,
-0.7146037, -1.386192, -3.295631, 0, 0, 0, 1, 1,
-0.7088298, 1.458066, -1.436681, 0, 0, 0, 1, 1,
-0.7072742, 0.8548254, 1.952431, 1, 1, 1, 1, 1,
-0.7003936, 0.2689668, -0.3245805, 1, 1, 1, 1, 1,
-0.7000131, 3.119959, -1.237386, 1, 1, 1, 1, 1,
-0.698508, -0.8408341, -2.139501, 1, 1, 1, 1, 1,
-0.69835, -1.457404, -2.097916, 1, 1, 1, 1, 1,
-0.6973907, 1.015688, -0.1412765, 1, 1, 1, 1, 1,
-0.6934772, 0.3162998, -0.7408493, 1, 1, 1, 1, 1,
-0.6929303, 0.8420348, -0.1936565, 1, 1, 1, 1, 1,
-0.691662, 0.7697505, 0.160175, 1, 1, 1, 1, 1,
-0.6888587, 0.1931229, 0.8019528, 1, 1, 1, 1, 1,
-0.6855417, -0.05278732, -0.284227, 1, 1, 1, 1, 1,
-0.679152, 1.646016, 0.8649387, 1, 1, 1, 1, 1,
-0.6778679, -0.8209798, -3.265895, 1, 1, 1, 1, 1,
-0.66717, 0.8305507, -1.183258, 1, 1, 1, 1, 1,
-0.6623881, 0.703954, -1.562673, 1, 1, 1, 1, 1,
-0.6568532, 1.545962, -0.2890243, 0, 0, 1, 1, 1,
-0.6564671, -0.653915, -0.2777511, 1, 0, 0, 1, 1,
-0.6559485, 1.272198, 0.4146725, 1, 0, 0, 1, 1,
-0.6555637, -0.03658746, -0.6233325, 1, 0, 0, 1, 1,
-0.6529291, -0.5977737, -1.050382, 1, 0, 0, 1, 1,
-0.6365091, 0.05877659, -0.921688, 1, 0, 0, 1, 1,
-0.6320545, -0.1324087, -0.1129679, 0, 0, 0, 1, 1,
-0.6189494, -0.467999, -1.063254, 0, 0, 0, 1, 1,
-0.6188086, 1.74068, -0.8001992, 0, 0, 0, 1, 1,
-0.6131996, -0.1797261, -0.4201672, 0, 0, 0, 1, 1,
-0.61251, -0.3202635, -2.04879, 0, 0, 0, 1, 1,
-0.6062893, 0.5686957, -0.5161798, 0, 0, 0, 1, 1,
-0.6061949, -0.8688251, -2.82435, 0, 0, 0, 1, 1,
-0.6055958, -0.6855878, -2.865881, 1, 1, 1, 1, 1,
-0.6024107, 0.3961882, 0.1800262, 1, 1, 1, 1, 1,
-0.5899477, -2.575022, -4.032983, 1, 1, 1, 1, 1,
-0.5809663, -1.550352, -1.91813, 1, 1, 1, 1, 1,
-0.5761684, 0.5049779, -1.759274, 1, 1, 1, 1, 1,
-0.5742058, -0.0219591, -1.669288, 1, 1, 1, 1, 1,
-0.5727324, -0.9715372, -1.835089, 1, 1, 1, 1, 1,
-0.5687445, 0.06376459, -2.51382, 1, 1, 1, 1, 1,
-0.5680673, -0.9593214, -3.145852, 1, 1, 1, 1, 1,
-0.5640976, -0.05583055, -2.420621, 1, 1, 1, 1, 1,
-0.5580584, -0.6014537, -2.117775, 1, 1, 1, 1, 1,
-0.5510668, -0.4639362, -2.131739, 1, 1, 1, 1, 1,
-0.5489234, -0.8139113, -1.660197, 1, 1, 1, 1, 1,
-0.5467715, -1.143485, -1.654844, 1, 1, 1, 1, 1,
-0.5382802, 0.5343402, -0.1694135, 1, 1, 1, 1, 1,
-0.5336392, -0.2107205, -1.562374, 0, 0, 1, 1, 1,
-0.5331397, 0.6285492, -0.05409614, 1, 0, 0, 1, 1,
-0.5297814, 1.520794, -0.5200781, 1, 0, 0, 1, 1,
-0.5252438, -0.4908516, -1.023864, 1, 0, 0, 1, 1,
-0.5237638, -1.400288, -2.357821, 1, 0, 0, 1, 1,
-0.5190982, -0.8149596, -2.324581, 1, 0, 0, 1, 1,
-0.5166161, 0.5070178, -0.2931823, 0, 0, 0, 1, 1,
-0.5163174, -0.5670441, -1.732163, 0, 0, 0, 1, 1,
-0.5154402, -2.931471, -4.338253, 0, 0, 0, 1, 1,
-0.5146091, 0.09976029, -1.714247, 0, 0, 0, 1, 1,
-0.514087, 1.163507, -0.8360723, 0, 0, 0, 1, 1,
-0.5139426, 1.383827, 0.6413892, 0, 0, 0, 1, 1,
-0.5133646, 0.09847473, -0.4016155, 0, 0, 0, 1, 1,
-0.5127448, -0.4105821, -4.088017, 1, 1, 1, 1, 1,
-0.5118651, -0.8769044, -1.621876, 1, 1, 1, 1, 1,
-0.5084507, -1.438629, -0.8855331, 1, 1, 1, 1, 1,
-0.5028239, -0.002956701, -1.446279, 1, 1, 1, 1, 1,
-0.5004049, 1.282693, 0.5487143, 1, 1, 1, 1, 1,
-0.4899864, -1.011087, -3.596981, 1, 1, 1, 1, 1,
-0.4873522, 1.080435, -0.1325667, 1, 1, 1, 1, 1,
-0.4836717, 0.1765065, -2.269747, 1, 1, 1, 1, 1,
-0.4824598, -0.3630783, -3.868681, 1, 1, 1, 1, 1,
-0.4811252, 0.4369856, 0.09648159, 1, 1, 1, 1, 1,
-0.4748226, 0.4265521, -1.330171, 1, 1, 1, 1, 1,
-0.473767, 1.699088, -1.024409, 1, 1, 1, 1, 1,
-0.4693244, -1.538336, -1.874407, 1, 1, 1, 1, 1,
-0.4665417, -0.6175244, -2.145763, 1, 1, 1, 1, 1,
-0.4614547, 0.05234849, -2.054933, 1, 1, 1, 1, 1,
-0.4573286, -1.495096, -4.409061, 0, 0, 1, 1, 1,
-0.4529116, -0.6089762, -4.060684, 1, 0, 0, 1, 1,
-0.4447924, 1.846478, 1.494421, 1, 0, 0, 1, 1,
-0.4338496, -0.09034903, -0.04055816, 1, 0, 0, 1, 1,
-0.4338085, -0.3283284, -0.3838235, 1, 0, 0, 1, 1,
-0.4302218, 0.7217908, -1.535864, 1, 0, 0, 1, 1,
-0.4292767, -0.773035, -0.03440201, 0, 0, 0, 1, 1,
-0.4231185, -0.8292931, -2.385254, 0, 0, 0, 1, 1,
-0.4230045, -0.1649344, -0.6354256, 0, 0, 0, 1, 1,
-0.4155903, 0.1416047, -0.2769293, 0, 0, 0, 1, 1,
-0.4146294, 0.8235204, -0.9038566, 0, 0, 0, 1, 1,
-0.4143433, -0.05054847, -1.319767, 0, 0, 0, 1, 1,
-0.4123488, -0.7023301, -2.927893, 0, 0, 0, 1, 1,
-0.4109318, 0.5813675, -0.9134648, 1, 1, 1, 1, 1,
-0.4066972, 0.152446, -1.031089, 1, 1, 1, 1, 1,
-0.4066671, 0.3404309, -0.8127838, 1, 1, 1, 1, 1,
-0.3995849, 1.279871, -0.7101026, 1, 1, 1, 1, 1,
-0.398183, -0.3461518, -2.497276, 1, 1, 1, 1, 1,
-0.3965091, 0.5178582, -2.117495, 1, 1, 1, 1, 1,
-0.394662, -0.5348035, -2.125118, 1, 1, 1, 1, 1,
-0.3886333, -1.235061, -4.294957, 1, 1, 1, 1, 1,
-0.3853356, -0.5971835, -3.352528, 1, 1, 1, 1, 1,
-0.3828788, -0.1296713, -1.480931, 1, 1, 1, 1, 1,
-0.3799349, -0.1221938, 0.2265552, 1, 1, 1, 1, 1,
-0.3733684, 1.932809, 0.1465925, 1, 1, 1, 1, 1,
-0.370259, 0.5990121, -1.241059, 1, 1, 1, 1, 1,
-0.3656004, -0.6152868, -3.262915, 1, 1, 1, 1, 1,
-0.3653136, 1.350427, -1.905309, 1, 1, 1, 1, 1,
-0.363553, -1.274555, -3.742072, 0, 0, 1, 1, 1,
-0.363279, -0.9519854, -1.371888, 1, 0, 0, 1, 1,
-0.360802, 1.231241, -0.1979511, 1, 0, 0, 1, 1,
-0.3551503, -0.2025229, -0.9248412, 1, 0, 0, 1, 1,
-0.3544886, -0.09899814, -2.634863, 1, 0, 0, 1, 1,
-0.3537449, -1.055858, -3.544741, 1, 0, 0, 1, 1,
-0.3524138, -0.6621428, -2.222132, 0, 0, 0, 1, 1,
-0.3487062, 1.040647, -0.09029539, 0, 0, 0, 1, 1,
-0.3459376, 0.4019662, -1.348413, 0, 0, 0, 1, 1,
-0.3456195, 0.4573859, -1.793564, 0, 0, 0, 1, 1,
-0.3429396, -0.02071812, -1.87302, 0, 0, 0, 1, 1,
-0.3371846, -0.6873245, -4.05406, 0, 0, 0, 1, 1,
-0.3367851, 0.3630935, -1.926325, 0, 0, 0, 1, 1,
-0.3357299, -1.35189, -1.976888, 1, 1, 1, 1, 1,
-0.3356422, 1.817148, -0.08792689, 1, 1, 1, 1, 1,
-0.332901, 0.1802311, -3.047884, 1, 1, 1, 1, 1,
-0.3295767, 0.609694, -0.9251046, 1, 1, 1, 1, 1,
-0.3294551, 0.4961847, -1.225761, 1, 1, 1, 1, 1,
-0.3252972, 0.5176916, 0.2089013, 1, 1, 1, 1, 1,
-0.3236862, 0.04453486, -2.878269, 1, 1, 1, 1, 1,
-0.3182224, 0.03391506, -1.35797, 1, 1, 1, 1, 1,
-0.3160651, -0.0825533, -0.812001, 1, 1, 1, 1, 1,
-0.3156593, -0.6400568, -2.260773, 1, 1, 1, 1, 1,
-0.3154857, 0.8394803, -0.4551179, 1, 1, 1, 1, 1,
-0.308589, 0.2094316, -1.338971, 1, 1, 1, 1, 1,
-0.3068075, 0.3213469, -0.6892347, 1, 1, 1, 1, 1,
-0.3002203, 0.272004, -0.2082559, 1, 1, 1, 1, 1,
-0.2976218, -1.369055, -3.6006, 1, 1, 1, 1, 1,
-0.2973508, 1.033373, -0.5433415, 0, 0, 1, 1, 1,
-0.2947339, 0.9604273, -0.2320487, 1, 0, 0, 1, 1,
-0.2939278, 1.691567, -0.3409509, 1, 0, 0, 1, 1,
-0.2934554, 0.08940756, -1.660486, 1, 0, 0, 1, 1,
-0.2920141, 0.672883, 0.1232015, 1, 0, 0, 1, 1,
-0.2909973, 0.3129994, -1.676341, 1, 0, 0, 1, 1,
-0.2889496, 1.845581, 0.4310568, 0, 0, 0, 1, 1,
-0.2885377, -1.075736, -4.763579, 0, 0, 0, 1, 1,
-0.2847414, -0.2290762, -1.535043, 0, 0, 0, 1, 1,
-0.284573, -0.7705506, -2.588406, 0, 0, 0, 1, 1,
-0.2744182, -0.435213, -0.4504203, 0, 0, 0, 1, 1,
-0.2713512, -1.075722, -3.403491, 0, 0, 0, 1, 1,
-0.2585462, 0.2926408, -0.5317982, 0, 0, 0, 1, 1,
-0.2584353, -2.326686, -3.677656, 1, 1, 1, 1, 1,
-0.2534559, -1.115746, -4.107098, 1, 1, 1, 1, 1,
-0.248864, -2.470415, -3.049982, 1, 1, 1, 1, 1,
-0.2477139, -0.6946233, -3.000364, 1, 1, 1, 1, 1,
-0.2435518, -1.067576, -3.949418, 1, 1, 1, 1, 1,
-0.2376498, -0.7432123, -1.268379, 1, 1, 1, 1, 1,
-0.2350251, 1.042218, 0.3951244, 1, 1, 1, 1, 1,
-0.2349815, 1.005059, 0.2490034, 1, 1, 1, 1, 1,
-0.234094, 0.9453894, -1.599285, 1, 1, 1, 1, 1,
-0.2321124, -0.8440971, -1.867331, 1, 1, 1, 1, 1,
-0.228957, 0.7695942, -0.4807219, 1, 1, 1, 1, 1,
-0.2287632, 0.5827106, 0.9598968, 1, 1, 1, 1, 1,
-0.2261236, -0.4847378, -2.117134, 1, 1, 1, 1, 1,
-0.2163058, 2.281253, 0.1095344, 1, 1, 1, 1, 1,
-0.2124853, 0.3037733, 0.249679, 1, 1, 1, 1, 1,
-0.2090616, 0.7734485, -1.14912, 0, 0, 1, 1, 1,
-0.2082761, 0.06495513, 1.092774, 1, 0, 0, 1, 1,
-0.2048216, -0.6607632, -2.982816, 1, 0, 0, 1, 1,
-0.2012319, 1.330618, -0.9170856, 1, 0, 0, 1, 1,
-0.2000657, -2.427039, -3.12725, 1, 0, 0, 1, 1,
-0.1937768, 1.081917, -1.273269, 1, 0, 0, 1, 1,
-0.1914155, 0.8674788, 1.011663, 0, 0, 0, 1, 1,
-0.1863501, -0.2317621, -1.335333, 0, 0, 0, 1, 1,
-0.1843555, 1.598235, -1.436281, 0, 0, 0, 1, 1,
-0.1839667, 0.8870119, -1.698701, 0, 0, 0, 1, 1,
-0.1763635, 1.093418, 0.1032834, 0, 0, 0, 1, 1,
-0.1741645, 0.5704337, -2.159503, 0, 0, 0, 1, 1,
-0.174164, -0.727355, -3.303807, 0, 0, 0, 1, 1,
-0.172492, -0.8280712, -2.427096, 1, 1, 1, 1, 1,
-0.1702767, 0.3568253, -1.163678, 1, 1, 1, 1, 1,
-0.166832, -0.4006267, -2.964173, 1, 1, 1, 1, 1,
-0.163647, -0.3360677, -2.433915, 1, 1, 1, 1, 1,
-0.157502, -0.08003007, -2.769671, 1, 1, 1, 1, 1,
-0.1569514, -0.290924, -2.056566, 1, 1, 1, 1, 1,
-0.1553694, -1.972522, -2.432127, 1, 1, 1, 1, 1,
-0.1478912, 0.7334579, -1.111741, 1, 1, 1, 1, 1,
-0.14508, -0.3048904, -1.458388, 1, 1, 1, 1, 1,
-0.1417195, 0.00985298, -0.4722555, 1, 1, 1, 1, 1,
-0.1415066, -1.404487, -2.204863, 1, 1, 1, 1, 1,
-0.1401169, 0.7992837, 0.003958571, 1, 1, 1, 1, 1,
-0.1382376, 1.131244, -0.0730933, 1, 1, 1, 1, 1,
-0.1361617, 1.309946, 0.150389, 1, 1, 1, 1, 1,
-0.1354258, -0.229693, -2.286397, 1, 1, 1, 1, 1,
-0.1352462, 0.7311461, 0.1793764, 0, 0, 1, 1, 1,
-0.1325821, 1.025673, 0.04019845, 1, 0, 0, 1, 1,
-0.1325147, -0.6790234, -1.890386, 1, 0, 0, 1, 1,
-0.1324366, -0.01180721, -1.267645, 1, 0, 0, 1, 1,
-0.1299951, 2.113957, -2.04049, 1, 0, 0, 1, 1,
-0.128247, -1.515491, -2.428513, 1, 0, 0, 1, 1,
-0.1280784, -2.607214, -3.279386, 0, 0, 0, 1, 1,
-0.1273408, 1.399406, 1.119796, 0, 0, 0, 1, 1,
-0.1263229, 0.2443986, -0.3879567, 0, 0, 0, 1, 1,
-0.1234334, 0.2851254, -0.7522908, 0, 0, 0, 1, 1,
-0.1216558, 0.4159723, 0.558037, 0, 0, 0, 1, 1,
-0.1171871, -0.690542, -2.2202, 0, 0, 0, 1, 1,
-0.1168117, 0.2128595, -1.504526, 0, 0, 0, 1, 1,
-0.1152792, -1.250694, -1.526698, 1, 1, 1, 1, 1,
-0.1150508, 0.1554505, 0.1449719, 1, 1, 1, 1, 1,
-0.1148909, -1.212741, -3.239033, 1, 1, 1, 1, 1,
-0.1099699, 0.8455907, 1.250846, 1, 1, 1, 1, 1,
-0.1096361, 1.396006, 0.2091879, 1, 1, 1, 1, 1,
-0.1062366, -1.091445, -3.56884, 1, 1, 1, 1, 1,
-0.1056953, 1.675111, 0.6818119, 1, 1, 1, 1, 1,
-0.1024105, -1.00067, -3.269238, 1, 1, 1, 1, 1,
-0.1008696, 0.3927002, 0.06119039, 1, 1, 1, 1, 1,
-0.09939015, -1.953484, -1.931197, 1, 1, 1, 1, 1,
-0.09714457, 0.2536003, -0.9748675, 1, 1, 1, 1, 1,
-0.09420906, 0.2906819, -2.126698, 1, 1, 1, 1, 1,
-0.09049132, -2.702276, -2.635633, 1, 1, 1, 1, 1,
-0.09017912, 1.383828, 0.08754556, 1, 1, 1, 1, 1,
-0.08856022, 0.2048095, -1.724269, 1, 1, 1, 1, 1,
-0.08718091, -0.7477142, -2.531126, 0, 0, 1, 1, 1,
-0.08631183, -0.5354245, -3.35286, 1, 0, 0, 1, 1,
-0.08516721, 1.515644, -1.047661, 1, 0, 0, 1, 1,
-0.08391216, -0.5795048, -3.418103, 1, 0, 0, 1, 1,
-0.08254184, 0.5600596, 1.132898, 1, 0, 0, 1, 1,
-0.0823833, 0.6902072, -1.001655, 1, 0, 0, 1, 1,
-0.08171248, -1.69543, -5.63555, 0, 0, 0, 1, 1,
-0.08164293, -0.3695682, -4.22077, 0, 0, 0, 1, 1,
-0.08008339, -0.8192406, -3.71631, 0, 0, 0, 1, 1,
-0.07771708, 1.511305, 0.3400954, 0, 0, 0, 1, 1,
-0.07712679, -0.6276359, -2.936624, 0, 0, 0, 1, 1,
-0.07470474, 1.105431, 1.630101, 0, 0, 0, 1, 1,
-0.07059034, 0.2662624, -0.9013457, 0, 0, 0, 1, 1,
-0.06687959, 0.1808348, -1.512019, 1, 1, 1, 1, 1,
-0.06346875, -1.285937, -3.263735, 1, 1, 1, 1, 1,
-0.06333147, 0.08553919, 1.926646, 1, 1, 1, 1, 1,
-0.06312214, 0.1499657, 1.186255, 1, 1, 1, 1, 1,
-0.06261542, 0.2939405, -1.484133, 1, 1, 1, 1, 1,
-0.05850021, -0.4443124, -1.735682, 1, 1, 1, 1, 1,
-0.05777827, 1.764352, -0.8614285, 1, 1, 1, 1, 1,
-0.05488177, 0.9748524, 0.8975543, 1, 1, 1, 1, 1,
-0.05413008, -0.9142092, -2.687685, 1, 1, 1, 1, 1,
-0.05110022, -0.07480939, -3.892179, 1, 1, 1, 1, 1,
-0.04977817, -1.13589, -3.519154, 1, 1, 1, 1, 1,
-0.04964789, 1.369041, -0.2792426, 1, 1, 1, 1, 1,
-0.04940208, 1.029822, -0.5040958, 1, 1, 1, 1, 1,
-0.04782653, -2.549951, -2.523053, 1, 1, 1, 1, 1,
-0.0399816, 1.647593, 0.6615071, 1, 1, 1, 1, 1,
-0.03725298, 0.4366148, -0.9400827, 0, 0, 1, 1, 1,
-0.03357458, 0.2104343, 0.2856218, 1, 0, 0, 1, 1,
-0.03141966, 1.613851, 0.3259967, 1, 0, 0, 1, 1,
-0.03035529, 0.5374788, 0.1223643, 1, 0, 0, 1, 1,
-0.02352239, -1.26042, -5.393703, 1, 0, 0, 1, 1,
-0.02342114, -0.5014694, -2.341702, 1, 0, 0, 1, 1,
-0.02055323, -1.48456, -2.975916, 0, 0, 0, 1, 1,
-0.01784944, 0.9559473, 0.3089694, 0, 0, 0, 1, 1,
-0.01691692, 0.2759629, 0.5487677, 0, 0, 0, 1, 1,
-0.01691511, 0.5234147, 1.384007, 0, 0, 0, 1, 1,
-0.01268959, -0.2813835, -4.568003, 0, 0, 0, 1, 1,
-0.008601693, 0.5580812, 1.122679, 0, 0, 0, 1, 1,
-0.007060132, 0.4174902, 1.350665, 0, 0, 0, 1, 1,
-0.002467513, -1.463685, -3.143075, 1, 1, 1, 1, 1,
-0.001603732, 0.09681118, 0.4088716, 1, 1, 1, 1, 1,
0.0005854497, -0.8203924, 4.59489, 1, 1, 1, 1, 1,
0.003597225, 0.5245579, 1.998401, 1, 1, 1, 1, 1,
0.004671011, 1.063343, -2.548717, 1, 1, 1, 1, 1,
0.008231735, 1.068076, 1.199805, 1, 1, 1, 1, 1,
0.01499407, -0.5848812, 4.046095, 1, 1, 1, 1, 1,
0.0171059, -1.500456, 4.213154, 1, 1, 1, 1, 1,
0.01831883, -0.9484557, 2.351958, 1, 1, 1, 1, 1,
0.02192771, 1.394947, 0.5976661, 1, 1, 1, 1, 1,
0.02679822, 0.1806551, -0.4238937, 1, 1, 1, 1, 1,
0.0281154, -1.625935, 4.044792, 1, 1, 1, 1, 1,
0.02932806, 1.012542, 0.7013478, 1, 1, 1, 1, 1,
0.03202362, 0.4218601, -1.262748, 1, 1, 1, 1, 1,
0.03586001, 0.2885876, -0.2159619, 1, 1, 1, 1, 1,
0.03646095, -0.5263979, 2.489765, 0, 0, 1, 1, 1,
0.04291955, 0.7235863, -0.3917008, 1, 0, 0, 1, 1,
0.0444541, -0.0455027, 2.265112, 1, 0, 0, 1, 1,
0.04470071, 0.4642211, -0.4001511, 1, 0, 0, 1, 1,
0.04865376, 0.7116996, -0.5162308, 1, 0, 0, 1, 1,
0.05058606, 0.268358, -2.484433, 1, 0, 0, 1, 1,
0.05102045, -0.07321946, 1.37988, 0, 0, 0, 1, 1,
0.05351274, 0.8129446, 0.4538322, 0, 0, 0, 1, 1,
0.05700321, -0.9608614, 3.479247, 0, 0, 0, 1, 1,
0.05750014, 0.9570398, 2.182018, 0, 0, 0, 1, 1,
0.05894393, -0.2420392, 3.818684, 0, 0, 0, 1, 1,
0.05953059, 1.473995, 0.7269076, 0, 0, 0, 1, 1,
0.05985807, 0.707263, -0.5394678, 0, 0, 0, 1, 1,
0.06134818, -1.44043, 3.972478, 1, 1, 1, 1, 1,
0.06307892, -0.2565596, 1.011776, 1, 1, 1, 1, 1,
0.06652713, -1.015235, 1.775256, 1, 1, 1, 1, 1,
0.0693484, 0.2412407, 0.3666537, 1, 1, 1, 1, 1,
0.07189362, -0.6013561, 2.519481, 1, 1, 1, 1, 1,
0.07248866, 0.1681213, 0.7387831, 1, 1, 1, 1, 1,
0.0848641, 0.2180037, 2.510898, 1, 1, 1, 1, 1,
0.08531455, -0.1852255, 2.081329, 1, 1, 1, 1, 1,
0.08967888, 1.227179, -0.4672951, 1, 1, 1, 1, 1,
0.09010398, -0.7365659, 3.341755, 1, 1, 1, 1, 1,
0.09448759, -0.613475, 3.576508, 1, 1, 1, 1, 1,
0.09686179, -0.0211537, 0.5881097, 1, 1, 1, 1, 1,
0.09786198, 0.6030939, 2.360282, 1, 1, 1, 1, 1,
0.1045702, -0.449292, 2.88762, 1, 1, 1, 1, 1,
0.1105287, -0.178842, 3.571201, 1, 1, 1, 1, 1,
0.1131507, -0.03794129, 0.8120727, 0, 0, 1, 1, 1,
0.1136152, -0.3657917, 1.443964, 1, 0, 0, 1, 1,
0.1137201, -0.05513851, 1.793185, 1, 0, 0, 1, 1,
0.11784, -1.282697, 2.180972, 1, 0, 0, 1, 1,
0.1240395, 0.1886411, 1.502993, 1, 0, 0, 1, 1,
0.125648, -1.533996, 2.93838, 1, 0, 0, 1, 1,
0.1263937, -0.2490543, 2.911748, 0, 0, 0, 1, 1,
0.1283658, -0.02944597, 2.778712, 0, 0, 0, 1, 1,
0.1330273, 1.977427, 0.7988988, 0, 0, 0, 1, 1,
0.1360017, 0.3826563, 2.505288, 0, 0, 0, 1, 1,
0.1363474, -0.1521166, 3.594863, 0, 0, 0, 1, 1,
0.1484258, -0.3292876, 2.747988, 0, 0, 0, 1, 1,
0.1552059, 0.718069, -0.4920242, 0, 0, 0, 1, 1,
0.1567638, 0.9426129, -0.2803708, 1, 1, 1, 1, 1,
0.15843, 0.1508605, 1.324274, 1, 1, 1, 1, 1,
0.1665544, -0.7972087, 4.201546, 1, 1, 1, 1, 1,
0.1678492, 0.5347971, 0.4848252, 1, 1, 1, 1, 1,
0.1685783, 0.3360283, 1.690586, 1, 1, 1, 1, 1,
0.1704111, -1.639288, 3.418985, 1, 1, 1, 1, 1,
0.1715224, -0.5870274, 2.960825, 1, 1, 1, 1, 1,
0.1719946, 1.065899, 0.2989748, 1, 1, 1, 1, 1,
0.1796854, -0.3617101, 2.334847, 1, 1, 1, 1, 1,
0.1819337, 2.117553, -1.234748, 1, 1, 1, 1, 1,
0.1849781, 1.187927, 0.8440375, 1, 1, 1, 1, 1,
0.1889948, -0.4373337, 3.779123, 1, 1, 1, 1, 1,
0.1916044, 0.6083746, -0.1035683, 1, 1, 1, 1, 1,
0.1966847, 1.730952, 1.289245, 1, 1, 1, 1, 1,
0.2041787, -0.2412212, 1.898795, 1, 1, 1, 1, 1,
0.204282, -0.09671259, 1.282492, 0, 0, 1, 1, 1,
0.2062049, -0.1775114, 1.520831, 1, 0, 0, 1, 1,
0.21616, -0.1511709, 1.445011, 1, 0, 0, 1, 1,
0.2163442, -0.3193017, 3.907718, 1, 0, 0, 1, 1,
0.217904, 0.09193954, 0.822136, 1, 0, 0, 1, 1,
0.2197901, 0.1425453, 1.625325, 1, 0, 0, 1, 1,
0.2389742, 0.6534321, 1.805782, 0, 0, 0, 1, 1,
0.2398522, 1.324732, 0.1709011, 0, 0, 0, 1, 1,
0.2399032, 1.522839, -0.9093316, 0, 0, 0, 1, 1,
0.2421112, -0.3735156, 3.516048, 0, 0, 0, 1, 1,
0.2429418, 0.7461951, -0.6117347, 0, 0, 0, 1, 1,
0.2498171, -0.277445, 0.8192973, 0, 0, 0, 1, 1,
0.2508071, -0.7264187, 2.856558, 0, 0, 0, 1, 1,
0.2548711, 1.372825, 0.8698292, 1, 1, 1, 1, 1,
0.2550106, -1.708803, 3.405049, 1, 1, 1, 1, 1,
0.2555673, -0.4550965, 3.652183, 1, 1, 1, 1, 1,
0.2562329, 1.042231, -0.1912329, 1, 1, 1, 1, 1,
0.2579495, -0.7404929, 3.050312, 1, 1, 1, 1, 1,
0.2635895, 0.2259342, 0.5935937, 1, 1, 1, 1, 1,
0.2671196, -1.479584, 2.998667, 1, 1, 1, 1, 1,
0.2675239, 0.4550514, -0.4022897, 1, 1, 1, 1, 1,
0.2676995, 2.309364, -0.5443723, 1, 1, 1, 1, 1,
0.2687653, 0.6801502, -0.5972095, 1, 1, 1, 1, 1,
0.2717524, 1.458738, -0.7659152, 1, 1, 1, 1, 1,
0.2734365, 0.001909148, 2.665092, 1, 1, 1, 1, 1,
0.2786911, -0.3419586, 2.815568, 1, 1, 1, 1, 1,
0.2787108, -0.1882769, 3.067285, 1, 1, 1, 1, 1,
0.2798225, 1.422432, 0.4163108, 1, 1, 1, 1, 1,
0.2799032, -1.695368, 1.826535, 0, 0, 1, 1, 1,
0.2805212, -0.7941492, 2.523008, 1, 0, 0, 1, 1,
0.2818595, -0.0893463, 0.9118404, 1, 0, 0, 1, 1,
0.2826651, -0.02186318, 2.843598, 1, 0, 0, 1, 1,
0.2832711, -0.8454794, 3.59025, 1, 0, 0, 1, 1,
0.284252, -3.451981, 3.277911, 1, 0, 0, 1, 1,
0.284478, -0.8572823, 4.211661, 0, 0, 0, 1, 1,
0.2861704, 0.03148325, 1.525779, 0, 0, 0, 1, 1,
0.2913035, 1.02974, -0.9326411, 0, 0, 0, 1, 1,
0.2964131, 0.368973, 1.643744, 0, 0, 0, 1, 1,
0.2979946, 0.8880246, 1.809865, 0, 0, 0, 1, 1,
0.2983897, -0.03597407, 1.745944, 0, 0, 0, 1, 1,
0.3065946, -0.04543563, 2.656247, 0, 0, 0, 1, 1,
0.311849, -0.4507782, 2.221836, 1, 1, 1, 1, 1,
0.3132682, -0.6203223, 1.660119, 1, 1, 1, 1, 1,
0.3177834, 0.1627135, 2.323614, 1, 1, 1, 1, 1,
0.3265436, 0.4365338, 0.03693879, 1, 1, 1, 1, 1,
0.3268139, -1.575687, 0.8719913, 1, 1, 1, 1, 1,
0.3269784, 0.8378902, 1.117951, 1, 1, 1, 1, 1,
0.328968, -0.4227961, 3.623208, 1, 1, 1, 1, 1,
0.3300695, -0.1562301, 3.142464, 1, 1, 1, 1, 1,
0.3325639, -0.9771179, 5.399489, 1, 1, 1, 1, 1,
0.3332663, -1.255934, 5.305472, 1, 1, 1, 1, 1,
0.3349275, 0.3101845, 1.057646, 1, 1, 1, 1, 1,
0.3366217, 0.6930291, 0.9763591, 1, 1, 1, 1, 1,
0.3473464, 0.758262, -0.6251174, 1, 1, 1, 1, 1,
0.3491936, -0.2722784, 3.058335, 1, 1, 1, 1, 1,
0.3514512, 0.2475991, 0.8273446, 1, 1, 1, 1, 1,
0.3516135, 0.2410534, 0.9206807, 0, 0, 1, 1, 1,
0.3520115, 0.3676929, -0.4998056, 1, 0, 0, 1, 1,
0.3537164, 0.4139002, -0.3564075, 1, 0, 0, 1, 1,
0.3551481, 0.9307913, -0.3473129, 1, 0, 0, 1, 1,
0.3584194, -0.04432447, 3.266494, 1, 0, 0, 1, 1,
0.3609188, -0.6688896, 2.370683, 1, 0, 0, 1, 1,
0.361705, 0.5913306, -1.777467, 0, 0, 0, 1, 1,
0.3628103, -0.2588791, 1.916788, 0, 0, 0, 1, 1,
0.369243, 1.077997, 0.009104609, 0, 0, 0, 1, 1,
0.3702476, -1.055814, 2.12097, 0, 0, 0, 1, 1,
0.371155, 0.09054644, 0.4833817, 0, 0, 0, 1, 1,
0.3720984, -0.6829903, 2.579771, 0, 0, 0, 1, 1,
0.3734536, -0.8642511, 4.089933, 0, 0, 0, 1, 1,
0.373648, -0.3993353, 1.267602, 1, 1, 1, 1, 1,
0.3740381, -0.9006768, 3.665231, 1, 1, 1, 1, 1,
0.3756894, 0.325336, -0.3325807, 1, 1, 1, 1, 1,
0.3782611, -0.81396, 3.046779, 1, 1, 1, 1, 1,
0.3784914, -0.4228795, 3.566895, 1, 1, 1, 1, 1,
0.3787206, -1.112162, 2.791754, 1, 1, 1, 1, 1,
0.3869214, -0.5206686, 1.376049, 1, 1, 1, 1, 1,
0.3906614, 0.6265414, -0.409068, 1, 1, 1, 1, 1,
0.3954513, 0.07570554, 1.198552, 1, 1, 1, 1, 1,
0.3955719, 0.1767566, 0.8747756, 1, 1, 1, 1, 1,
0.3961106, 0.8821871, 1.614, 1, 1, 1, 1, 1,
0.4018868, 0.2953191, -0.1397744, 1, 1, 1, 1, 1,
0.4040737, -0.6950412, 4.037958, 1, 1, 1, 1, 1,
0.4104964, -1.287416, 1.632375, 1, 1, 1, 1, 1,
0.4155624, 0.7745938, 1.90832, 1, 1, 1, 1, 1,
0.4161943, -0.8819916, 2.810111, 0, 0, 1, 1, 1,
0.4198466, 0.3866443, 0.9517878, 1, 0, 0, 1, 1,
0.4216743, 0.7778218, 0.6516986, 1, 0, 0, 1, 1,
0.4294454, 0.2733968, -1.061625, 1, 0, 0, 1, 1,
0.4316957, -0.5808819, 2.279909, 1, 0, 0, 1, 1,
0.4320244, -0.1057064, 2.597329, 1, 0, 0, 1, 1,
0.4374391, 0.151574, 1.450708, 0, 0, 0, 1, 1,
0.4376836, -0.7718533, 0.464834, 0, 0, 0, 1, 1,
0.4376931, 0.3484958, -0.125961, 0, 0, 0, 1, 1,
0.4387916, -0.5874925, 3.182145, 0, 0, 0, 1, 1,
0.4393392, -0.7298536, 0.8237972, 0, 0, 0, 1, 1,
0.4421364, -0.9272227, 3.232457, 0, 0, 0, 1, 1,
0.4478809, 2.324636, -0.1136299, 0, 0, 0, 1, 1,
0.4551794, -1.348712, 1.051472, 1, 1, 1, 1, 1,
0.4652759, 1.191871, 3.459566, 1, 1, 1, 1, 1,
0.4682163, 1.488833, 1.002575, 1, 1, 1, 1, 1,
0.4707827, -0.2596325, -0.1314369, 1, 1, 1, 1, 1,
0.4741466, 0.8741224, 1.118544, 1, 1, 1, 1, 1,
0.4834075, -0.03428909, 1.510037, 1, 1, 1, 1, 1,
0.4881527, -0.7211964, 2.634526, 1, 1, 1, 1, 1,
0.4928474, 1.215095, 0.007278763, 1, 1, 1, 1, 1,
0.495785, 1.242055, 1.419517, 1, 1, 1, 1, 1,
0.4965746, -0.4668969, 2.642648, 1, 1, 1, 1, 1,
0.4997666, -0.09816192, 0.2666181, 1, 1, 1, 1, 1,
0.5059415, 0.6452207, 1.461762, 1, 1, 1, 1, 1,
0.5123372, -1.619892, 2.13446, 1, 1, 1, 1, 1,
0.5138497, -2.230919, 3.613624, 1, 1, 1, 1, 1,
0.5206935, 0.03284096, 0.9873129, 1, 1, 1, 1, 1,
0.5219201, -0.8764942, 2.329605, 0, 0, 1, 1, 1,
0.5221133, 0.3958394, 0.7017645, 1, 0, 0, 1, 1,
0.524394, 0.05560117, 1.574317, 1, 0, 0, 1, 1,
0.5270774, 2.336441, 0.783265, 1, 0, 0, 1, 1,
0.5271309, -0.4755517, 1.893732, 1, 0, 0, 1, 1,
0.5355347, -0.717541, 3.467608, 1, 0, 0, 1, 1,
0.5376235, 0.1509361, 1.968809, 0, 0, 0, 1, 1,
0.5401511, -1.254821, 1.88843, 0, 0, 0, 1, 1,
0.5454645, 0.8447044, -0.5587678, 0, 0, 0, 1, 1,
0.5461649, 0.8832589, -1.271374, 0, 0, 0, 1, 1,
0.5494528, -0.2723527, 3.771456, 0, 0, 0, 1, 1,
0.5550537, -0.2275305, 2.560513, 0, 0, 0, 1, 1,
0.5623833, 1.151807, -0.478809, 0, 0, 0, 1, 1,
0.5651923, 0.3548138, 1.020598, 1, 1, 1, 1, 1,
0.5658687, -0.2744404, 1.846503, 1, 1, 1, 1, 1,
0.5767947, -0.3820717, 3.020518, 1, 1, 1, 1, 1,
0.5769973, 0.3898025, 0.2410892, 1, 1, 1, 1, 1,
0.5784346, -0.07472011, 0.3548255, 1, 1, 1, 1, 1,
0.5882313, 0.9601166, 1.207907, 1, 1, 1, 1, 1,
0.5883789, 0.2046188, 2.664537, 1, 1, 1, 1, 1,
0.5919791, 2.385283, -1.451785, 1, 1, 1, 1, 1,
0.5932721, 1.027862, 0.05760749, 1, 1, 1, 1, 1,
0.5935761, -0.6419612, 0.813329, 1, 1, 1, 1, 1,
0.5966161, -0.4732866, 2.889236, 1, 1, 1, 1, 1,
0.6030197, -0.3716167, 1.859004, 1, 1, 1, 1, 1,
0.603281, 0.6908761, -0.01614856, 1, 1, 1, 1, 1,
0.6039801, -1.200029, 0.5704993, 1, 1, 1, 1, 1,
0.6121881, 2.578274, 0.6777744, 1, 1, 1, 1, 1,
0.6131377, -0.1901736, 1.872211, 0, 0, 1, 1, 1,
0.6137828, -0.4995972, 1.963655, 1, 0, 0, 1, 1,
0.6220272, -0.1166815, 2.633723, 1, 0, 0, 1, 1,
0.6259412, 0.4455392, -0.1751548, 1, 0, 0, 1, 1,
0.6270838, 0.6614842, 2.647716, 1, 0, 0, 1, 1,
0.6326287, 0.5599945, 0.4467753, 1, 0, 0, 1, 1,
0.6338283, 0.4262193, 1.879655, 0, 0, 0, 1, 1,
0.6339898, 0.358372, 2.750847, 0, 0, 0, 1, 1,
0.636229, 3.054019, 1.093714, 0, 0, 0, 1, 1,
0.6376935, -0.6226896, 2.742008, 0, 0, 0, 1, 1,
0.642318, 0.2404994, 0.1171637, 0, 0, 0, 1, 1,
0.6484752, 0.9732329, 0.9042128, 0, 0, 0, 1, 1,
0.6494631, -0.6913903, 2.891271, 0, 0, 0, 1, 1,
0.6569623, -0.6766891, 2.578337, 1, 1, 1, 1, 1,
0.6594965, -0.6732329, 1.82285, 1, 1, 1, 1, 1,
0.6612074, -0.5883065, -0.09847561, 1, 1, 1, 1, 1,
0.6657456, 0.3353449, 1.940519, 1, 1, 1, 1, 1,
0.6681365, 0.6610396, -0.2359059, 1, 1, 1, 1, 1,
0.6699007, -1.970077, 2.512214, 1, 1, 1, 1, 1,
0.6700364, -0.03955788, 2.586873, 1, 1, 1, 1, 1,
0.6743642, -1.384889, 2.591754, 1, 1, 1, 1, 1,
0.6749738, 0.5996907, 1.909224, 1, 1, 1, 1, 1,
0.6751829, -1.139391, 1.717152, 1, 1, 1, 1, 1,
0.6922934, -1.585503, 2.088151, 1, 1, 1, 1, 1,
0.6939585, -0.07053529, 0.3905413, 1, 1, 1, 1, 1,
0.6956925, 0.9989735, 3.455817, 1, 1, 1, 1, 1,
0.6988676, -0.9489235, 3.547452, 1, 1, 1, 1, 1,
0.6989905, -1.159441, 0.9977981, 1, 1, 1, 1, 1,
0.7027608, -0.4442384, 3.062526, 0, 0, 1, 1, 1,
0.7109515, 0.3310411, -0.7112017, 1, 0, 0, 1, 1,
0.7130412, -0.5487644, 2.2816, 1, 0, 0, 1, 1,
0.7149057, -0.07614422, 0.8764632, 1, 0, 0, 1, 1,
0.718918, -0.6952015, 3.387811, 1, 0, 0, 1, 1,
0.7203253, -0.11016, 1.98482, 1, 0, 0, 1, 1,
0.7229568, 0.02538082, 2.978932, 0, 0, 0, 1, 1,
0.729287, -0.1195998, 1.844443, 0, 0, 0, 1, 1,
0.7346907, 0.2287735, 4.053738, 0, 0, 0, 1, 1,
0.7377718, 0.4069716, 0.2291982, 0, 0, 0, 1, 1,
0.7445824, -0.5402113, 1.81357, 0, 0, 0, 1, 1,
0.7534248, -0.1072072, 3.216143, 0, 0, 0, 1, 1,
0.7535858, -2.557172, 3.561784, 0, 0, 0, 1, 1,
0.7570059, -0.6882673, 1.879889, 1, 1, 1, 1, 1,
0.7669216, -0.7229993, 2.637357, 1, 1, 1, 1, 1,
0.7722278, 0.5448202, 1.042093, 1, 1, 1, 1, 1,
0.7752961, 1.117457, 1.001623, 1, 1, 1, 1, 1,
0.7779623, 1.332599, -0.8235037, 1, 1, 1, 1, 1,
0.7812405, 0.444712, 2.052317, 1, 1, 1, 1, 1,
0.7814981, -0.1042652, 1.27432, 1, 1, 1, 1, 1,
0.784534, -0.03976877, 2.093777, 1, 1, 1, 1, 1,
0.7900401, -0.7148588, 2.824176, 1, 1, 1, 1, 1,
0.7910301, 0.03295011, 2.699236, 1, 1, 1, 1, 1,
0.7928084, -0.4644941, 1.173357, 1, 1, 1, 1, 1,
0.79584, -0.2070678, 1.831295, 1, 1, 1, 1, 1,
0.7964522, -1.259122, 2.429525, 1, 1, 1, 1, 1,
0.7969028, -0.9921721, 2.596939, 1, 1, 1, 1, 1,
0.797745, -0.2458078, 3.3086, 1, 1, 1, 1, 1,
0.7980265, 1.074817, 0.9912933, 0, 0, 1, 1, 1,
0.7987528, -0.1823565, 1.032134, 1, 0, 0, 1, 1,
0.8056794, -0.3661311, 2.215111, 1, 0, 0, 1, 1,
0.8078377, 0.919687, 1.700397, 1, 0, 0, 1, 1,
0.8166586, -0.2080817, 2.665828, 1, 0, 0, 1, 1,
0.8190627, 0.04893535, 1.66844, 1, 0, 0, 1, 1,
0.8200406, 1.177817, 1.943967, 0, 0, 0, 1, 1,
0.831307, 0.29592, 0.9524117, 0, 0, 0, 1, 1,
0.8315535, -1.256019, 2.944525, 0, 0, 0, 1, 1,
0.8334795, 0.7520138, -0.4093411, 0, 0, 0, 1, 1,
0.8341235, -1.234868, 2.118678, 0, 0, 0, 1, 1,
0.8358343, 0.1094666, 1.841267, 0, 0, 0, 1, 1,
0.8365698, 0.230595, 1.657388, 0, 0, 0, 1, 1,
0.8414294, 0.6275297, 1.987282, 1, 1, 1, 1, 1,
0.8446121, -0.02150633, 0.02207396, 1, 1, 1, 1, 1,
0.8503291, -0.9579749, 4.799378, 1, 1, 1, 1, 1,
0.8588949, 1.418911, 0.6785197, 1, 1, 1, 1, 1,
0.8616647, -1.1709, 2.705096, 1, 1, 1, 1, 1,
0.8647705, 0.1343002, 1.21042, 1, 1, 1, 1, 1,
0.8787785, 0.7268376, 1.442056, 1, 1, 1, 1, 1,
0.88122, -0.1154884, 2.854454, 1, 1, 1, 1, 1,
0.8869685, 0.2136932, 0.6136705, 1, 1, 1, 1, 1,
0.8889938, -0.691521, 2.273453, 1, 1, 1, 1, 1,
0.896772, -0.176086, 1.927089, 1, 1, 1, 1, 1,
0.9027566, -0.7002549, 2.497252, 1, 1, 1, 1, 1,
0.9032671, -0.2072554, 2.38873, 1, 1, 1, 1, 1,
0.9063542, -0.07836221, 1.936832, 1, 1, 1, 1, 1,
0.9067875, -1.009709, -0.6828024, 1, 1, 1, 1, 1,
0.908222, 0.6892624, 1.118338, 0, 0, 1, 1, 1,
0.9102387, -0.7743583, 2.47266, 1, 0, 0, 1, 1,
0.9103452, 0.03281042, 0.8280032, 1, 0, 0, 1, 1,
0.9110875, -0.9959038, 1.912707, 1, 0, 0, 1, 1,
0.9120712, -0.1329303, 0.8304754, 1, 0, 0, 1, 1,
0.9128272, 1.799252, 1.889758, 1, 0, 0, 1, 1,
0.9133339, -0.9768313, 1.772937, 0, 0, 0, 1, 1,
0.9141547, 0.6863123, 1.019061, 0, 0, 0, 1, 1,
0.9189708, -0.7508054, 3.608465, 0, 0, 0, 1, 1,
0.9264039, 1.625751, -0.4587179, 0, 0, 0, 1, 1,
0.9265481, 0.4972133, 2.184335, 0, 0, 0, 1, 1,
0.9288145, -1.039045, 3.267899, 0, 0, 0, 1, 1,
0.930757, -2.096599, 3.601425, 0, 0, 0, 1, 1,
0.9316955, 0.07823283, 0.9346253, 1, 1, 1, 1, 1,
0.9355239, -0.8215879, 2.237408, 1, 1, 1, 1, 1,
0.9373359, 1.098039, -0.2590988, 1, 1, 1, 1, 1,
0.9457767, -0.5822176, 2.015914, 1, 1, 1, 1, 1,
0.9476326, -0.3822944, 2.27059, 1, 1, 1, 1, 1,
0.9479491, -0.9184496, 2.878084, 1, 1, 1, 1, 1,
0.9496612, 1.894922, 1.249789, 1, 1, 1, 1, 1,
0.954453, 1.31165, -0.7170884, 1, 1, 1, 1, 1,
0.9545489, 1.510876, 1.163353, 1, 1, 1, 1, 1,
0.9564627, -1.148826, 2.914685, 1, 1, 1, 1, 1,
0.9577078, 1.255533, 1.366386, 1, 1, 1, 1, 1,
0.9624853, -1.222128, 1.328771, 1, 1, 1, 1, 1,
0.9644532, -1.105285, 2.600195, 1, 1, 1, 1, 1,
0.9669306, 1.712507, 1.117679, 1, 1, 1, 1, 1,
0.9703214, 1.06236, -0.09676585, 1, 1, 1, 1, 1,
0.9759911, 0.4050339, 1.541807, 0, 0, 1, 1, 1,
0.9808403, -1.658016, 3.350612, 1, 0, 0, 1, 1,
0.9814473, 0.3406524, 2.286611, 1, 0, 0, 1, 1,
0.9849296, -2.035679, 4.26282, 1, 0, 0, 1, 1,
0.9899898, -0.04208849, 1.792344, 1, 0, 0, 1, 1,
0.9930516, 0.4193059, 1.488962, 1, 0, 0, 1, 1,
0.9970008, -0.8504283, 2.154658, 0, 0, 0, 1, 1,
0.9973493, 0.4504722, 3.179421, 0, 0, 0, 1, 1,
0.9997718, 0.2971416, 1.955922, 0, 0, 0, 1, 1,
1.005686, -0.963884, 2.059973, 0, 0, 0, 1, 1,
1.005969, -0.05384319, 1.5398, 0, 0, 0, 1, 1,
1.005983, -0.7076169, 2.963679, 0, 0, 0, 1, 1,
1.008988, -0.2090962, 2.579826, 0, 0, 0, 1, 1,
1.010143, 0.3152041, 1.357085, 1, 1, 1, 1, 1,
1.016268, 0.5777974, -0.3533281, 1, 1, 1, 1, 1,
1.01997, -0.8965052, 1.53334, 1, 1, 1, 1, 1,
1.020424, -0.7005862, 3.429666, 1, 1, 1, 1, 1,
1.023883, -1.471133, 3.051311, 1, 1, 1, 1, 1,
1.026344, 2.163485, 0.3851854, 1, 1, 1, 1, 1,
1.027746, -2.385835, 4.360222, 1, 1, 1, 1, 1,
1.035634, 2.306794, -0.4765337, 1, 1, 1, 1, 1,
1.043486, -0.1589623, 1.961128, 1, 1, 1, 1, 1,
1.051673, 0.483587, -0.5548685, 1, 1, 1, 1, 1,
1.058312, -1.090569, 2.450399, 1, 1, 1, 1, 1,
1.059209, -1.26926, 2.013568, 1, 1, 1, 1, 1,
1.064188, 0.7383861, 0.3372257, 1, 1, 1, 1, 1,
1.06452, -0.9848657, 2.396258, 1, 1, 1, 1, 1,
1.074011, 0.3011481, 0.9486163, 1, 1, 1, 1, 1,
1.075804, 0.5008358, 2.611808, 0, 0, 1, 1, 1,
1.088909, -0.381606, 0.4524122, 1, 0, 0, 1, 1,
1.091275, 1.234656, 2.100019, 1, 0, 0, 1, 1,
1.092112, -0.4243014, 2.176547, 1, 0, 0, 1, 1,
1.092667, -0.8972591, 2.157733, 1, 0, 0, 1, 1,
1.094441, 0.2454792, 3.491031, 1, 0, 0, 1, 1,
1.102894, 0.4217299, 1.587811, 0, 0, 0, 1, 1,
1.104112, 0.5763015, 1.830478, 0, 0, 0, 1, 1,
1.106914, -0.938684, 2.499996, 0, 0, 0, 1, 1,
1.107491, 1.688612, 0.05560589, 0, 0, 0, 1, 1,
1.113559, -0.3307956, 1.68511, 0, 0, 0, 1, 1,
1.119995, -0.5662863, 1.847666, 0, 0, 0, 1, 1,
1.123118, -0.7124613, 2.607987, 0, 0, 0, 1, 1,
1.12624, 2.118888, -0.07459404, 1, 1, 1, 1, 1,
1.129845, -1.700149, 1.240921, 1, 1, 1, 1, 1,
1.13027, 0.5136572, 0.1987012, 1, 1, 1, 1, 1,
1.133758, 0.8261259, 1.726576, 1, 1, 1, 1, 1,
1.141064, -0.5459641, 1.767359, 1, 1, 1, 1, 1,
1.14455, -1.606608, 2.581932, 1, 1, 1, 1, 1,
1.14523, 0.5297863, 1.545871, 1, 1, 1, 1, 1,
1.148682, -1.749557, 0.925124, 1, 1, 1, 1, 1,
1.148928, -0.4609118, 2.037238, 1, 1, 1, 1, 1,
1.150334, 1.362538, 0.2517332, 1, 1, 1, 1, 1,
1.151228, -2.259386, 1.179446, 1, 1, 1, 1, 1,
1.151453, -0.4318352, 2.387614, 1, 1, 1, 1, 1,
1.152843, 0.2689584, 1.684545, 1, 1, 1, 1, 1,
1.154801, 1.899232, 0.7923371, 1, 1, 1, 1, 1,
1.158622, 0.884841, 2.418461, 1, 1, 1, 1, 1,
1.16501, 1.658042, 1.415151, 0, 0, 1, 1, 1,
1.168975, 0.8916547, -0.07750772, 1, 0, 0, 1, 1,
1.171359, 1.017548, 0.5554992, 1, 0, 0, 1, 1,
1.181265, 1.261902, 0.4293883, 1, 0, 0, 1, 1,
1.187667, -1.743037, 3.679376, 1, 0, 0, 1, 1,
1.189131, -0.2364615, 1.948669, 1, 0, 0, 1, 1,
1.189713, -0.3536567, 2.593986, 0, 0, 0, 1, 1,
1.189849, -1.377578, 1.60272, 0, 0, 0, 1, 1,
1.196711, -0.6835111, 2.433445, 0, 0, 0, 1, 1,
1.211519, 0.3669378, 0.1952611, 0, 0, 0, 1, 1,
1.218117, -0.9364747, 2.283846, 0, 0, 0, 1, 1,
1.220999, 0.877342, 0.7244473, 0, 0, 0, 1, 1,
1.228856, -0.3014649, 1.462551, 0, 0, 0, 1, 1,
1.237616, 1.627747, 1.257485, 1, 1, 1, 1, 1,
1.243623, 1.269106, 0.6088542, 1, 1, 1, 1, 1,
1.245588, 0.9628007, 0.1392424, 1, 1, 1, 1, 1,
1.252235, 1.220274, 0.2518543, 1, 1, 1, 1, 1,
1.253158, 1.042729, 0.5485485, 1, 1, 1, 1, 1,
1.258302, -0.2298653, 0.3741546, 1, 1, 1, 1, 1,
1.261302, -1.385189, 1.254383, 1, 1, 1, 1, 1,
1.268234, 0.7772264, 1.357786, 1, 1, 1, 1, 1,
1.268728, -0.3771273, 2.754306, 1, 1, 1, 1, 1,
1.279789, 1.565024, -0.4259782, 1, 1, 1, 1, 1,
1.281229, 1.750475, -0.1665868, 1, 1, 1, 1, 1,
1.281563, -1.471725, 1.586788, 1, 1, 1, 1, 1,
1.282948, 1.319799, 2.370389, 1, 1, 1, 1, 1,
1.287334, 0.236556, 2.586787, 1, 1, 1, 1, 1,
1.302044, 0.4892159, -0.01176799, 1, 1, 1, 1, 1,
1.308789, -0.7160032, 2.615479, 0, 0, 1, 1, 1,
1.309616, -0.03377139, 1.027683, 1, 0, 0, 1, 1,
1.322377, 0.5487793, 2.330101, 1, 0, 0, 1, 1,
1.339579, 1.163912, 1.222157, 1, 0, 0, 1, 1,
1.34182, -0.05628775, 2.341282, 1, 0, 0, 1, 1,
1.34243, -0.5572125, 0.9333599, 1, 0, 0, 1, 1,
1.343248, -0.5450027, 3.575555, 0, 0, 0, 1, 1,
1.349029, 0.6034462, 1.349332, 0, 0, 0, 1, 1,
1.353384, 0.1184953, 1.063208, 0, 0, 0, 1, 1,
1.355107, 0.1529409, 2.316034, 0, 0, 0, 1, 1,
1.371386, -0.1407497, 2.294643, 0, 0, 0, 1, 1,
1.373431, 0.2679991, 2.029245, 0, 0, 0, 1, 1,
1.376822, 1.478805, -0.8564866, 0, 0, 0, 1, 1,
1.381993, -1.311893, 3.434921, 1, 1, 1, 1, 1,
1.3948, -1.153419, 0.8118928, 1, 1, 1, 1, 1,
1.415389, -2.089712, 1.994495, 1, 1, 1, 1, 1,
1.429673, -0.6145739, 1.880506, 1, 1, 1, 1, 1,
1.431013, -0.9302772, 2.205522, 1, 1, 1, 1, 1,
1.438663, -1.479522, 1.586927, 1, 1, 1, 1, 1,
1.456019, 0.4809687, 3.524978, 1, 1, 1, 1, 1,
1.464631, 1.203571, -0.3586953, 1, 1, 1, 1, 1,
1.469121, 0.5900461, 1.689811, 1, 1, 1, 1, 1,
1.4718, -0.7056121, 0.8544695, 1, 1, 1, 1, 1,
1.472161, -2.395897, 3.215622, 1, 1, 1, 1, 1,
1.473461, -2.078759, 2.038679, 1, 1, 1, 1, 1,
1.479576, -1.443207, 3.153278, 1, 1, 1, 1, 1,
1.480246, 0.1900338, 1.456042, 1, 1, 1, 1, 1,
1.481843, 0.07709847, 1.732308, 1, 1, 1, 1, 1,
1.483058, -0.1671319, 3.108304, 0, 0, 1, 1, 1,
1.488675, -0.427986, 1.404493, 1, 0, 0, 1, 1,
1.492402, 0.824019, 2.422582, 1, 0, 0, 1, 1,
1.498324, 0.8553891, 0.07520561, 1, 0, 0, 1, 1,
1.501915, -0.2550507, 1.880128, 1, 0, 0, 1, 1,
1.504452, 0.4184704, 1.380821, 1, 0, 0, 1, 1,
1.516497, -1.743155, 4.417292, 0, 0, 0, 1, 1,
1.519061, 0.5787459, 1.892583, 0, 0, 0, 1, 1,
1.532167, 1.887178, 0.6827699, 0, 0, 0, 1, 1,
1.534568, -0.7609155, 1.005682, 0, 0, 0, 1, 1,
1.541729, -1.661885, 2.36252, 0, 0, 0, 1, 1,
1.54544, -1.992591, 3.306725, 0, 0, 0, 1, 1,
1.547773, 0.09021436, 0.2748371, 0, 0, 0, 1, 1,
1.567892, 0.3705636, 2.099331, 1, 1, 1, 1, 1,
1.572448, 0.2608564, 1.759977, 1, 1, 1, 1, 1,
1.572919, 2.392647, 1.470741, 1, 1, 1, 1, 1,
1.610258, 0.6485184, 1.73461, 1, 1, 1, 1, 1,
1.618507, -2.075201, 2.628778, 1, 1, 1, 1, 1,
1.619673, -1.120036, 2.763219, 1, 1, 1, 1, 1,
1.625639, -0.8690588, 2.538957, 1, 1, 1, 1, 1,
1.632837, 0.2837991, 0.3131662, 1, 1, 1, 1, 1,
1.640988, -1.734378, -0.05297413, 1, 1, 1, 1, 1,
1.642369, -0.2423698, 1.122527, 1, 1, 1, 1, 1,
1.667413, -0.03034203, 1.536109, 1, 1, 1, 1, 1,
1.674516, -0.3416062, 1.495743, 1, 1, 1, 1, 1,
1.693057, -0.4380798, 3.144025, 1, 1, 1, 1, 1,
1.722758, 1.921124, 1.370238, 1, 1, 1, 1, 1,
1.727303, -0.04626015, 0.9169086, 1, 1, 1, 1, 1,
1.753755, 0.353429, 1.669989, 0, 0, 1, 1, 1,
1.753909, 0.3221779, 1.203831, 1, 0, 0, 1, 1,
1.755614, -0.4579762, 1.647763, 1, 0, 0, 1, 1,
1.769516, 0.5579932, -0.5500016, 1, 0, 0, 1, 1,
1.7753, 0.4904749, 1.669345, 1, 0, 0, 1, 1,
1.794144, 0.5384485, 2.803226, 1, 0, 0, 1, 1,
1.807591, 1.367116, 1.755648, 0, 0, 0, 1, 1,
1.820942, -0.2495076, 2.385028, 0, 0, 0, 1, 1,
1.822387, -0.1109762, 1.678931, 0, 0, 0, 1, 1,
1.826005, -0.7197973, 0.9361693, 0, 0, 0, 1, 1,
1.849957, 1.597771, 0.74522, 0, 0, 0, 1, 1,
1.868462, -0.9253192, 2.51817, 0, 0, 0, 1, 1,
1.887554, 1.820222, 0.5068494, 0, 0, 0, 1, 1,
1.928545, 0.6208565, 1.001177, 1, 1, 1, 1, 1,
1.93744, -1.185892, 3.821218, 1, 1, 1, 1, 1,
1.954546, -0.3265558, 2.353753, 1, 1, 1, 1, 1,
1.956736, -1.107922, 3.117362, 1, 1, 1, 1, 1,
1.964126, -1.030721, 1.323282, 1, 1, 1, 1, 1,
1.970142, 0.2016002, 3.801962, 1, 1, 1, 1, 1,
2.053032, 0.05013444, 1.90774, 1, 1, 1, 1, 1,
2.055315, 1.177786, 0.521333, 1, 1, 1, 1, 1,
2.113032, 0.2332527, 1.594721, 1, 1, 1, 1, 1,
2.20382, -1.796949, 3.200713, 1, 1, 1, 1, 1,
2.216442, -0.4345997, 1.49428, 1, 1, 1, 1, 1,
2.217821, 0.4957296, 2.209993, 1, 1, 1, 1, 1,
2.229816, 0.1234567, 1.722654, 1, 1, 1, 1, 1,
2.313921, 0.2650887, 2.53706, 1, 1, 1, 1, 1,
2.325183, -0.8592157, 2.548574, 1, 1, 1, 1, 1,
2.334726, 0.9892174, 0.1123486, 0, 0, 1, 1, 1,
2.334756, 0.0001737326, 0.4217936, 1, 0, 0, 1, 1,
2.339977, 0.234856, 0.7393291, 1, 0, 0, 1, 1,
2.348593, -0.5124174, 2.33814, 1, 0, 0, 1, 1,
2.421367, -1.4093, 2.172024, 1, 0, 0, 1, 1,
2.436934, -0.2006424, 2.398869, 1, 0, 0, 1, 1,
2.444498, -0.1442262, 1.702697, 0, 0, 0, 1, 1,
2.46099, 1.193316, -1.980957, 0, 0, 0, 1, 1,
2.515589, 0.1970783, 0.1569779, 0, 0, 0, 1, 1,
2.515839, 0.06806302, 0.1725537, 0, 0, 0, 1, 1,
2.540923, -1.81571, 1.995392, 0, 0, 0, 1, 1,
2.603939, 0.4500865, 0.2327353, 0, 0, 0, 1, 1,
2.612135, -0.2338721, 1.027754, 0, 0, 0, 1, 1,
2.705224, 2.231777, 0.1345953, 1, 1, 1, 1, 1,
2.826575, -1.355536, 2.741915, 1, 1, 1, 1, 1,
2.847799, 0.1134886, 2.746152, 1, 1, 1, 1, 1,
2.906556, -1.136912, 2.932459, 1, 1, 1, 1, 1,
3.025655, 1.492162, 0.5430897, 1, 1, 1, 1, 1,
3.21877, 0.5396215, -0.7648718, 1, 1, 1, 1, 1,
3.447225, 0.004624191, 2.064455, 1, 1, 1, 1, 1
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
var radius = 9.845591;
var distance = 34.58222;
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
mvMatrix.translate( -0.2762338, -0.04656029, 0.1180305 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.58222);
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
