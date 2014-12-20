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
-3.037722, 1.593517, -1.327256, 1, 0, 0, 1,
-2.923056, 0.3188831, -1.357345, 1, 0.007843138, 0, 1,
-2.698292, 1.661811, -0.1165184, 1, 0.01176471, 0, 1,
-2.649849, -0.9899727, -1.417782, 1, 0.01960784, 0, 1,
-2.622692, -0.02888284, -1.220887, 1, 0.02352941, 0, 1,
-2.575279, 0.8071759, -0.7303175, 1, 0.03137255, 0, 1,
-2.515306, 0.5713755, -0.8684018, 1, 0.03529412, 0, 1,
-2.433126, -1.174518, -1.388622, 1, 0.04313726, 0, 1,
-2.419187, -0.3719987, -2.646961, 1, 0.04705882, 0, 1,
-2.390622, -0.8290572, -1.960688, 1, 0.05490196, 0, 1,
-2.358407, -0.2505603, -1.054833, 1, 0.05882353, 0, 1,
-2.214536, 0.6737931, -1.383886, 1, 0.06666667, 0, 1,
-2.206591, -0.2849161, -1.345374, 1, 0.07058824, 0, 1,
-2.11557, 0.3469238, -0.7452364, 1, 0.07843138, 0, 1,
-2.114264, 1.645392, -0.8169242, 1, 0.08235294, 0, 1,
-2.102564, 0.5433434, -0.5443404, 1, 0.09019608, 0, 1,
-2.098056, -0.339434, -2.684756, 1, 0.09411765, 0, 1,
-2.033758, -0.4735337, -0.3358967, 1, 0.1019608, 0, 1,
-2.004215, -1.781746, -2.336601, 1, 0.1098039, 0, 1,
-1.949782, 1.138752, -1.911392, 1, 0.1137255, 0, 1,
-1.94623, 0.533722, 0.4289328, 1, 0.1215686, 0, 1,
-1.943509, -0.125895, -1.962822, 1, 0.1254902, 0, 1,
-1.907517, -0.2793082, -2.491912, 1, 0.1333333, 0, 1,
-1.886694, 0.6898121, -0.7181922, 1, 0.1372549, 0, 1,
-1.860761, 0.3239723, -1.403361, 1, 0.145098, 0, 1,
-1.850397, 0.01219787, 0.4097401, 1, 0.1490196, 0, 1,
-1.847786, -0.5916198, -2.251587, 1, 0.1568628, 0, 1,
-1.846155, 0.9007792, -0.368756, 1, 0.1607843, 0, 1,
-1.838127, 0.4221929, -1.645433, 1, 0.1686275, 0, 1,
-1.821419, -0.5322855, -1.333271, 1, 0.172549, 0, 1,
-1.818585, -1.40709, -0.3073303, 1, 0.1803922, 0, 1,
-1.79704, -0.5455076, -1.274428, 1, 0.1843137, 0, 1,
-1.785052, 0.610112, -1.420229, 1, 0.1921569, 0, 1,
-1.78404, -0.8974268, -1.424228, 1, 0.1960784, 0, 1,
-1.774077, 0.6222125, -2.387091, 1, 0.2039216, 0, 1,
-1.772031, 1.600608, -0.9483482, 1, 0.2117647, 0, 1,
-1.770649, -0.8929434, -1.046178, 1, 0.2156863, 0, 1,
-1.769268, -1.308822, -3.063416, 1, 0.2235294, 0, 1,
-1.736261, -0.3031618, -1.92501, 1, 0.227451, 0, 1,
-1.730571, -0.3536541, -1.101764, 1, 0.2352941, 0, 1,
-1.728844, -0.05984197, -3.085436, 1, 0.2392157, 0, 1,
-1.714937, 1.3492, -0.6571579, 1, 0.2470588, 0, 1,
-1.709597, 0.1063595, -0.7397203, 1, 0.2509804, 0, 1,
-1.709579, 0.604802, -1.093475, 1, 0.2588235, 0, 1,
-1.706884, 0.04343287, -2.502963, 1, 0.2627451, 0, 1,
-1.69454, 1.447956, -1.013131, 1, 0.2705882, 0, 1,
-1.69406, -1.328145, -2.563633, 1, 0.2745098, 0, 1,
-1.689141, 0.6893231, -1.07726, 1, 0.282353, 0, 1,
-1.687294, -0.4817847, -1.534578, 1, 0.2862745, 0, 1,
-1.674482, 2.763047, 0.5120925, 1, 0.2941177, 0, 1,
-1.648527, -0.6685275, -0.4962431, 1, 0.3019608, 0, 1,
-1.641791, -1.423784, -4.212128, 1, 0.3058824, 0, 1,
-1.63728, 1.695582, -1.359981, 1, 0.3137255, 0, 1,
-1.632656, 0.3513366, -2.71629, 1, 0.3176471, 0, 1,
-1.625848, -1.453409, -3.174337, 1, 0.3254902, 0, 1,
-1.622273, -0.7225724, -1.571737, 1, 0.3294118, 0, 1,
-1.604885, 2.183072, -0.4744484, 1, 0.3372549, 0, 1,
-1.601439, -0.8338582, -1.612824, 1, 0.3411765, 0, 1,
-1.593496, -1.837893, -2.590619, 1, 0.3490196, 0, 1,
-1.582268, 0.5695534, -2.48082, 1, 0.3529412, 0, 1,
-1.578621, -1.254385, -1.716511, 1, 0.3607843, 0, 1,
-1.576325, 1.449084, -2.065067, 1, 0.3647059, 0, 1,
-1.552595, 0.2078932, -2.939569, 1, 0.372549, 0, 1,
-1.528194, -0.5000451, -2.832744, 1, 0.3764706, 0, 1,
-1.524072, -1.01634, -3.439044, 1, 0.3843137, 0, 1,
-1.517378, -1.233146, -2.920895, 1, 0.3882353, 0, 1,
-1.511967, 0.7669857, -0.1865746, 1, 0.3960784, 0, 1,
-1.501926, 1.032842, -1.735516, 1, 0.4039216, 0, 1,
-1.48806, -0.03122544, -0.6117926, 1, 0.4078431, 0, 1,
-1.482136, 0.367421, -1.673993, 1, 0.4156863, 0, 1,
-1.477969, 0.8276971, -1.404592, 1, 0.4196078, 0, 1,
-1.455561, 0.7102034, -2.124817, 1, 0.427451, 0, 1,
-1.44755, 2.358428, -0.1431529, 1, 0.4313726, 0, 1,
-1.442369, -0.4366421, -0.7505237, 1, 0.4392157, 0, 1,
-1.438181, 0.2636001, 0.8316313, 1, 0.4431373, 0, 1,
-1.434525, -0.8966597, -1.497824, 1, 0.4509804, 0, 1,
-1.430462, 1.180227, -1.896796, 1, 0.454902, 0, 1,
-1.429709, 1.147538, -1.160073, 1, 0.4627451, 0, 1,
-1.401186, -0.9874759, -2.789869, 1, 0.4666667, 0, 1,
-1.398438, -0.9234267, -3.001271, 1, 0.4745098, 0, 1,
-1.395084, 0.06513475, -1.81553, 1, 0.4784314, 0, 1,
-1.393044, 1.876985, -0.2614551, 1, 0.4862745, 0, 1,
-1.390727, -1.155376, -2.031698, 1, 0.4901961, 0, 1,
-1.361378, 0.3379349, -2.684319, 1, 0.4980392, 0, 1,
-1.358113, -0.1277002, -0.5586801, 1, 0.5058824, 0, 1,
-1.34922, 0.4367198, -2.337532, 1, 0.509804, 0, 1,
-1.341681, -2.028893, -3.146051, 1, 0.5176471, 0, 1,
-1.339034, 0.2394054, -1.494174, 1, 0.5215687, 0, 1,
-1.338076, 0.08417334, -2.571609, 1, 0.5294118, 0, 1,
-1.336114, -0.9978093, -1.694589, 1, 0.5333334, 0, 1,
-1.328663, -0.6602419, -2.525727, 1, 0.5411765, 0, 1,
-1.32615, -0.4790812, -1.675546, 1, 0.5450981, 0, 1,
-1.322423, -1.091245, -2.415485, 1, 0.5529412, 0, 1,
-1.315708, 0.2333615, -1.264931, 1, 0.5568628, 0, 1,
-1.304634, 0.2850092, -2.532866, 1, 0.5647059, 0, 1,
-1.302743, -0.6290643, -2.274885, 1, 0.5686275, 0, 1,
-1.302662, 1.046019, 0.3720292, 1, 0.5764706, 0, 1,
-1.297977, 0.545484, -1.179569, 1, 0.5803922, 0, 1,
-1.29354, -1.061881, -2.774803, 1, 0.5882353, 0, 1,
-1.293182, -0.7748541, -1.642828, 1, 0.5921569, 0, 1,
-1.289582, 0.4052638, -1.537911, 1, 0.6, 0, 1,
-1.276188, 0.07617933, 0.1164558, 1, 0.6078432, 0, 1,
-1.263883, -0.9082845, -0.6472756, 1, 0.6117647, 0, 1,
-1.259396, 0.2056697, -0.1593762, 1, 0.6196079, 0, 1,
-1.242359, -0.5809091, -1.869226, 1, 0.6235294, 0, 1,
-1.233597, -0.6682914, -2.186448, 1, 0.6313726, 0, 1,
-1.221506, 0.08952174, -1.91976, 1, 0.6352941, 0, 1,
-1.221351, -0.3555925, -2.828298, 1, 0.6431373, 0, 1,
-1.214986, 0.3547762, 0.0901134, 1, 0.6470588, 0, 1,
-1.204136, -0.05397213, -2.541255, 1, 0.654902, 0, 1,
-1.201129, -0.7611733, -3.981159, 1, 0.6588235, 0, 1,
-1.188801, -1.044698, -1.30588, 1, 0.6666667, 0, 1,
-1.184847, -0.3844286, -0.9972986, 1, 0.6705883, 0, 1,
-1.177764, 0.4071602, -1.726194, 1, 0.6784314, 0, 1,
-1.167305, -0.575672, -2.211732, 1, 0.682353, 0, 1,
-1.165604, -0.4237978, -3.442852, 1, 0.6901961, 0, 1,
-1.160152, -0.8436404, -2.585785, 1, 0.6941177, 0, 1,
-1.152646, -1.055251, -4.505612, 1, 0.7019608, 0, 1,
-1.150817, -0.2805007, -2.499212, 1, 0.7098039, 0, 1,
-1.149846, 1.219192, 0.7988778, 1, 0.7137255, 0, 1,
-1.145061, 0.9564818, -2.675635, 1, 0.7215686, 0, 1,
-1.137604, -0.7630787, -1.38808, 1, 0.7254902, 0, 1,
-1.136979, 1.69165, -2.087084, 1, 0.7333333, 0, 1,
-1.12405, 1.767885, -0.6421372, 1, 0.7372549, 0, 1,
-1.117418, -1.07656, -1.687562, 1, 0.7450981, 0, 1,
-1.117179, 0.7611848, -1.880635, 1, 0.7490196, 0, 1,
-1.112304, -0.08679205, -2.649527, 1, 0.7568628, 0, 1,
-1.109763, 0.6119329, -1.077431, 1, 0.7607843, 0, 1,
-1.109482, 0.3066086, -0.1858864, 1, 0.7686275, 0, 1,
-1.108286, 0.06756176, -0.4483055, 1, 0.772549, 0, 1,
-1.106262, -0.6893982, -2.536764, 1, 0.7803922, 0, 1,
-1.105337, 0.065376, -3.153859, 1, 0.7843137, 0, 1,
-1.094851, -1.422058, -3.483398, 1, 0.7921569, 0, 1,
-1.084346, -0.6586524, -0.48583, 1, 0.7960784, 0, 1,
-1.081052, 0.9565881, 1.023574, 1, 0.8039216, 0, 1,
-1.076189, -0.2053168, 1.444077, 1, 0.8117647, 0, 1,
-1.076052, -0.553231, -1.414654, 1, 0.8156863, 0, 1,
-1.07451, 0.2733634, -0.1048809, 1, 0.8235294, 0, 1,
-1.062317, -1.914691, -3.830744, 1, 0.827451, 0, 1,
-1.056132, 0.006786908, -0.8569899, 1, 0.8352941, 0, 1,
-1.047261, -0.3240428, -1.658083, 1, 0.8392157, 0, 1,
-1.041594, -0.392598, -0.8688408, 1, 0.8470588, 0, 1,
-1.038395, 1.682373, -1.75529, 1, 0.8509804, 0, 1,
-1.036588, -1.577273, -2.414551, 1, 0.8588235, 0, 1,
-1.035395, 0.5006671, 0.492976, 1, 0.8627451, 0, 1,
-1.030947, 0.008951583, -1.709568, 1, 0.8705882, 0, 1,
-1.025258, -0.4098157, -2.251928, 1, 0.8745098, 0, 1,
-1.024941, 0.3885255, 0.08091051, 1, 0.8823529, 0, 1,
-1.018791, -0.2740806, -0.9952187, 1, 0.8862745, 0, 1,
-1.018251, 2.034472, -1.308228, 1, 0.8941177, 0, 1,
-1.015947, 1.068541, -1.626337, 1, 0.8980392, 0, 1,
-1.010466, 0.9377707, 0.1346236, 1, 0.9058824, 0, 1,
-1.007341, -1.733337, -1.012406, 1, 0.9137255, 0, 1,
-1.005697, 1.002568, -1.090291, 1, 0.9176471, 0, 1,
-0.9942133, -0.3452029, -0.3908856, 1, 0.9254902, 0, 1,
-0.9929322, -2.611223, -3.150274, 1, 0.9294118, 0, 1,
-0.992914, 0.8558233, -0.8190995, 1, 0.9372549, 0, 1,
-0.9891915, 1.612601, -0.5918642, 1, 0.9411765, 0, 1,
-0.9788342, 0.3353986, -0.9001694, 1, 0.9490196, 0, 1,
-0.9716833, -0.2213764, -2.845517, 1, 0.9529412, 0, 1,
-0.9664448, 0.3460779, -1.534146, 1, 0.9607843, 0, 1,
-0.9631205, 0.6649533, -1.523456, 1, 0.9647059, 0, 1,
-0.9514793, 0.2375468, -1.721258, 1, 0.972549, 0, 1,
-0.9510532, -0.1151973, -1.984801, 1, 0.9764706, 0, 1,
-0.9508886, -0.5407644, -3.730123, 1, 0.9843137, 0, 1,
-0.9411494, -0.3955224, -1.972256, 1, 0.9882353, 0, 1,
-0.9322673, 2.717786, 1.20235, 1, 0.9960784, 0, 1,
-0.9283151, -0.7310287, -3.306219, 0.9960784, 1, 0, 1,
-0.918864, 1.880443, 0.4405475, 0.9921569, 1, 0, 1,
-0.9062365, 1.587252, -0.4523528, 0.9843137, 1, 0, 1,
-0.9020867, -1.464498, 0.2483055, 0.9803922, 1, 0, 1,
-0.9003298, -1.001506, -2.303339, 0.972549, 1, 0, 1,
-0.8981917, -0.9990663, -3.621957, 0.9686275, 1, 0, 1,
-0.8974555, 0.2040546, -3.420756, 0.9607843, 1, 0, 1,
-0.8939632, -0.2565249, -2.432714, 0.9568627, 1, 0, 1,
-0.8814366, -1.249543, -1.957904, 0.9490196, 1, 0, 1,
-0.8746493, 0.02498446, -2.031854, 0.945098, 1, 0, 1,
-0.8709412, 0.6703205, -1.17429, 0.9372549, 1, 0, 1,
-0.8686653, 1.304896, -1.317367, 0.9333333, 1, 0, 1,
-0.8683383, -1.904029, -3.709698, 0.9254902, 1, 0, 1,
-0.8675722, -0.5490935, -1.930357, 0.9215686, 1, 0, 1,
-0.86275, -2.008738, -2.742755, 0.9137255, 1, 0, 1,
-0.8607027, -1.703758, -3.048431, 0.9098039, 1, 0, 1,
-0.8593361, -0.636167, -1.783371, 0.9019608, 1, 0, 1,
-0.8591503, -1.292905, -1.998938, 0.8941177, 1, 0, 1,
-0.8556535, 0.4694558, -1.235709, 0.8901961, 1, 0, 1,
-0.8510864, -0.9458588, -0.7296292, 0.8823529, 1, 0, 1,
-0.8483002, 0.7378967, 0.06537927, 0.8784314, 1, 0, 1,
-0.8482698, -1.578384, -2.092037, 0.8705882, 1, 0, 1,
-0.8471168, 0.6652158, -4.097372, 0.8666667, 1, 0, 1,
-0.8445536, -1.169877, -2.101303, 0.8588235, 1, 0, 1,
-0.8380525, -0.2474916, -3.417825, 0.854902, 1, 0, 1,
-0.8377795, -0.3879321, -0.7378054, 0.8470588, 1, 0, 1,
-0.8369483, 0.6316687, 0.08445682, 0.8431373, 1, 0, 1,
-0.8366563, 0.7176791, -1.52074, 0.8352941, 1, 0, 1,
-0.83634, -0.4605961, -2.19104, 0.8313726, 1, 0, 1,
-0.8306299, 1.468855, -2.297395, 0.8235294, 1, 0, 1,
-0.8216316, -0.2761691, -2.391884, 0.8196079, 1, 0, 1,
-0.8168994, 0.8593464, -0.2542944, 0.8117647, 1, 0, 1,
-0.8159921, -0.682416, -1.944929, 0.8078431, 1, 0, 1,
-0.8103893, -0.9329187, -3.214691, 0.8, 1, 0, 1,
-0.8056053, 1.851287, 0.2586715, 0.7921569, 1, 0, 1,
-0.8027266, -1.359394, -4.242918, 0.7882353, 1, 0, 1,
-0.7996268, 0.6078458, -1.575786, 0.7803922, 1, 0, 1,
-0.7945972, -0.6419826, -3.15299, 0.7764706, 1, 0, 1,
-0.7897681, 0.4665191, -2.014887, 0.7686275, 1, 0, 1,
-0.7849575, 1.835885, -0.04504744, 0.7647059, 1, 0, 1,
-0.7843388, -0.6685629, -2.654397, 0.7568628, 1, 0, 1,
-0.781149, 0.8041454, 0.285047, 0.7529412, 1, 0, 1,
-0.7804382, -0.4010236, -1.623966, 0.7450981, 1, 0, 1,
-0.779662, 1.300146, -0.8013222, 0.7411765, 1, 0, 1,
-0.7761011, 0.3649841, -2.293627, 0.7333333, 1, 0, 1,
-0.7713529, 0.7041602, 0.284808, 0.7294118, 1, 0, 1,
-0.7712544, -2.067066, -1.505293, 0.7215686, 1, 0, 1,
-0.7648852, -2.193789, -1.394898, 0.7176471, 1, 0, 1,
-0.7645318, -1.093308, -3.860583, 0.7098039, 1, 0, 1,
-0.7640855, -0.5016857, -2.666131, 0.7058824, 1, 0, 1,
-0.7639756, -0.9301517, -3.537354, 0.6980392, 1, 0, 1,
-0.7572895, 0.1547603, -2.086959, 0.6901961, 1, 0, 1,
-0.7560738, -0.971318, -2.472413, 0.6862745, 1, 0, 1,
-0.7552611, 1.76213, -0.4439623, 0.6784314, 1, 0, 1,
-0.753791, 1.465772, 0.1085367, 0.6745098, 1, 0, 1,
-0.7507575, -1.545984, -2.439513, 0.6666667, 1, 0, 1,
-0.74985, 1.347019, 0.284507, 0.6627451, 1, 0, 1,
-0.7475972, -0.6180823, -1.102693, 0.654902, 1, 0, 1,
-0.7437716, -0.1561752, -1.551467, 0.6509804, 1, 0, 1,
-0.7418926, -0.4246026, -1.60679, 0.6431373, 1, 0, 1,
-0.7412431, -0.7264226, -4.735302, 0.6392157, 1, 0, 1,
-0.7371012, -1.620399, -3.787737, 0.6313726, 1, 0, 1,
-0.7369456, -0.3387567, -2.033274, 0.627451, 1, 0, 1,
-0.7332807, 1.149193, -1.128789, 0.6196079, 1, 0, 1,
-0.7312537, -0.4416682, -2.427024, 0.6156863, 1, 0, 1,
-0.727289, 0.2733518, -2.157552, 0.6078432, 1, 0, 1,
-0.7212973, 1.69147, 0.8039041, 0.6039216, 1, 0, 1,
-0.7194686, -1.043361, -1.809758, 0.5960785, 1, 0, 1,
-0.7083572, -0.007762294, -2.855861, 0.5882353, 1, 0, 1,
-0.707715, 1.333878, -1.03029, 0.5843138, 1, 0, 1,
-0.7051808, 1.068299, 1.964883, 0.5764706, 1, 0, 1,
-0.7011805, 0.341415, -1.749238, 0.572549, 1, 0, 1,
-0.6948859, -1.263215, -3.417764, 0.5647059, 1, 0, 1,
-0.6942241, 1.642668, -1.516481, 0.5607843, 1, 0, 1,
-0.6808196, 0.1273894, -0.7187673, 0.5529412, 1, 0, 1,
-0.6794482, -0.6487678, -3.106066, 0.5490196, 1, 0, 1,
-0.6760611, -0.3343959, -1.239689, 0.5411765, 1, 0, 1,
-0.675214, 1.521426, 0.2915215, 0.5372549, 1, 0, 1,
-0.675198, -0.07377903, -2.718358, 0.5294118, 1, 0, 1,
-0.6739591, 0.2816411, 0.04588039, 0.5254902, 1, 0, 1,
-0.6719745, -2.012858, -3.873489, 0.5176471, 1, 0, 1,
-0.6684808, -0.1111765, -3.146308, 0.5137255, 1, 0, 1,
-0.6676943, 0.679881, -0.8486204, 0.5058824, 1, 0, 1,
-0.6647208, 0.5932304, 0.4156187, 0.5019608, 1, 0, 1,
-0.6630124, -0.3197262, -4.360188, 0.4941176, 1, 0, 1,
-0.6625068, -1.986247, -1.918075, 0.4862745, 1, 0, 1,
-0.6602805, -0.3085962, -1.342683, 0.4823529, 1, 0, 1,
-0.6573228, 0.6562464, -0.470091, 0.4745098, 1, 0, 1,
-0.6570653, 0.5111064, 0.9296784, 0.4705882, 1, 0, 1,
-0.6568965, 1.791021, 0.1513037, 0.4627451, 1, 0, 1,
-0.6517856, 0.4707055, -4.109338, 0.4588235, 1, 0, 1,
-0.6508909, 1.169619, 0.1163224, 0.4509804, 1, 0, 1,
-0.6370583, -0.8525861, -2.11866, 0.4470588, 1, 0, 1,
-0.635441, 0.5291154, -1.701006, 0.4392157, 1, 0, 1,
-0.6352624, -0.1631202, -3.222623, 0.4352941, 1, 0, 1,
-0.6341801, -0.5525024, -4.115366, 0.427451, 1, 0, 1,
-0.6333776, 2.01368, -1.465425, 0.4235294, 1, 0, 1,
-0.6327351, -1.085646, -2.600497, 0.4156863, 1, 0, 1,
-0.6315492, -0.042495, 0.5266693, 0.4117647, 1, 0, 1,
-0.6195393, 0.4835862, -0.3749769, 0.4039216, 1, 0, 1,
-0.6155147, -0.783299, -2.626675, 0.3960784, 1, 0, 1,
-0.6043252, -0.666557, -3.614338, 0.3921569, 1, 0, 1,
-0.6039948, -0.621877, 0.6891195, 0.3843137, 1, 0, 1,
-0.6018831, 0.9647993, -0.8911037, 0.3803922, 1, 0, 1,
-0.5955147, 1.179174, -1.064505, 0.372549, 1, 0, 1,
-0.5901155, 0.02583427, -1.744813, 0.3686275, 1, 0, 1,
-0.5837976, -0.5927509, -3.02855, 0.3607843, 1, 0, 1,
-0.5836676, 1.73898, -1.167193, 0.3568628, 1, 0, 1,
-0.5806056, 0.7104146, -0.5691413, 0.3490196, 1, 0, 1,
-0.5785422, 0.08472607, -1.910005, 0.345098, 1, 0, 1,
-0.5783063, -0.4828526, -2.496452, 0.3372549, 1, 0, 1,
-0.575816, -0.8786125, -2.882686, 0.3333333, 1, 0, 1,
-0.5740641, 0.421512, -1.601433, 0.3254902, 1, 0, 1,
-0.5730008, -0.810401, -3.36112, 0.3215686, 1, 0, 1,
-0.5656565, -1.395017, -4.212692, 0.3137255, 1, 0, 1,
-0.5648553, 0.4763128, 0.02689185, 0.3098039, 1, 0, 1,
-0.5625617, -0.2714429, -2.380476, 0.3019608, 1, 0, 1,
-0.5610256, -1.902244, -4.554954, 0.2941177, 1, 0, 1,
-0.5543689, 1.454428, 0.5081152, 0.2901961, 1, 0, 1,
-0.5499973, -0.210482, -1.521754, 0.282353, 1, 0, 1,
-0.5471157, -0.7864347, -2.31922, 0.2784314, 1, 0, 1,
-0.5469025, 0.2935929, -1.294105, 0.2705882, 1, 0, 1,
-0.5408769, -0.5473138, -2.552975, 0.2666667, 1, 0, 1,
-0.5404281, 0.08659182, -1.301721, 0.2588235, 1, 0, 1,
-0.5400538, -0.2071442, -0.7305718, 0.254902, 1, 0, 1,
-0.5385547, 1.089787, -0.03063506, 0.2470588, 1, 0, 1,
-0.5380257, -1.276006, -3.80848, 0.2431373, 1, 0, 1,
-0.5378293, -1.228545, -2.70382, 0.2352941, 1, 0, 1,
-0.5364323, 0.4039122, -0.6253822, 0.2313726, 1, 0, 1,
-0.5336081, 0.5072012, 0.0630163, 0.2235294, 1, 0, 1,
-0.5331798, -0.5619123, -2.022399, 0.2196078, 1, 0, 1,
-0.5325949, -0.4600143, -2.1353, 0.2117647, 1, 0, 1,
-0.5314553, -1.994268, -2.722326, 0.2078431, 1, 0, 1,
-0.5307387, -0.6437947, -2.978317, 0.2, 1, 0, 1,
-0.524438, -1.406225, -2.22423, 0.1921569, 1, 0, 1,
-0.5211185, -0.04823022, -2.129603, 0.1882353, 1, 0, 1,
-0.5149376, 1.535821, 0.5402393, 0.1803922, 1, 0, 1,
-0.5145026, 2.262927, -0.6184245, 0.1764706, 1, 0, 1,
-0.5052166, 1.648712, -1.290314, 0.1686275, 1, 0, 1,
-0.5010342, 1.267439, 0.07805565, 0.1647059, 1, 0, 1,
-0.4896078, 0.8353022, 0.08873821, 0.1568628, 1, 0, 1,
-0.487469, -0.9365242, -4.896524, 0.1529412, 1, 0, 1,
-0.483311, 1.348383, 0.5808802, 0.145098, 1, 0, 1,
-0.4822783, 0.3527039, -2.487729, 0.1411765, 1, 0, 1,
-0.4765248, 0.2228341, -3.358516, 0.1333333, 1, 0, 1,
-0.4706035, -0.5065263, -2.69185, 0.1294118, 1, 0, 1,
-0.4693398, -0.999335, -1.694957, 0.1215686, 1, 0, 1,
-0.4661116, -0.2054415, -2.021653, 0.1176471, 1, 0, 1,
-0.4659362, -0.4974677, -3.792621, 0.1098039, 1, 0, 1,
-0.4649365, -0.4233535, -0.4456179, 0.1058824, 1, 0, 1,
-0.4635358, -1.229795, -1.198976, 0.09803922, 1, 0, 1,
-0.4520176, 1.404747, -0.9687659, 0.09019608, 1, 0, 1,
-0.4490631, -0.5116494, -2.21529, 0.08627451, 1, 0, 1,
-0.4454098, -0.4916335, -1.63097, 0.07843138, 1, 0, 1,
-0.4449885, -0.1085308, -0.223657, 0.07450981, 1, 0, 1,
-0.4439596, 0.5436507, -0.2302583, 0.06666667, 1, 0, 1,
-0.4392742, -0.3174758, -2.001972, 0.0627451, 1, 0, 1,
-0.4385225, 0.2541039, -1.935578, 0.05490196, 1, 0, 1,
-0.4375528, -0.4486131, -2.281757, 0.05098039, 1, 0, 1,
-0.4324416, -1.336804, -3.50584, 0.04313726, 1, 0, 1,
-0.4266019, 0.3183332, -1.237315, 0.03921569, 1, 0, 1,
-0.4238703, 0.9080222, -0.9786473, 0.03137255, 1, 0, 1,
-0.4076874, 1.25997, -0.4414223, 0.02745098, 1, 0, 1,
-0.4060206, 2.223947, -1.307346, 0.01960784, 1, 0, 1,
-0.4039116, -1.150462, 0.1667549, 0.01568628, 1, 0, 1,
-0.4037876, 0.1247072, -0.2708806, 0.007843138, 1, 0, 1,
-0.4032022, 0.8319941, -1.174192, 0.003921569, 1, 0, 1,
-0.4030261, 1.932396, 0.293602, 0, 1, 0.003921569, 1,
-0.4019023, 1.183192, -0.3360937, 0, 1, 0.01176471, 1,
-0.4004012, -1.082025, -1.457018, 0, 1, 0.01568628, 1,
-0.3987944, -0.25981, -3.248386, 0, 1, 0.02352941, 1,
-0.3933606, 0.1937307, -1.733068, 0, 1, 0.02745098, 1,
-0.3930601, -1.475913, -4.447295, 0, 1, 0.03529412, 1,
-0.3909311, 0.7400007, -1.171118, 0, 1, 0.03921569, 1,
-0.3821584, -1.243466, -2.993711, 0, 1, 0.04705882, 1,
-0.3809153, -0.7706903, -3.030199, 0, 1, 0.05098039, 1,
-0.3798104, -0.8805696, -1.976373, 0, 1, 0.05882353, 1,
-0.3765607, 1.283687, 0.170073, 0, 1, 0.0627451, 1,
-0.3695677, -0.6189382, -2.607352, 0, 1, 0.07058824, 1,
-0.3632306, -0.4256146, -2.75563, 0, 1, 0.07450981, 1,
-0.35853, -0.9759067, -3.475676, 0, 1, 0.08235294, 1,
-0.3580594, 0.3433507, 0.01062622, 0, 1, 0.08627451, 1,
-0.3520533, 0.7720784, 1.894742, 0, 1, 0.09411765, 1,
-0.3511098, 1.350867, 0.5474792, 0, 1, 0.1019608, 1,
-0.3450297, -1.041587, -2.401498, 0, 1, 0.1058824, 1,
-0.3440209, 0.2547907, 0.02696768, 0, 1, 0.1137255, 1,
-0.342207, 0.08314873, -1.297149, 0, 1, 0.1176471, 1,
-0.3409417, -0.6660964, -3.311682, 0, 1, 0.1254902, 1,
-0.3400461, 0.4826863, -0.838603, 0, 1, 0.1294118, 1,
-0.3371808, 0.01473694, -2.484124, 0, 1, 0.1372549, 1,
-0.3329493, -0.7247406, -4.230005, 0, 1, 0.1411765, 1,
-0.3230061, 0.2859713, 0.9496009, 0, 1, 0.1490196, 1,
-0.3171999, -2.282084, -3.017469, 0, 1, 0.1529412, 1,
-0.317053, 0.6133654, 0.5636085, 0, 1, 0.1607843, 1,
-0.3167182, -0.1313968, -1.652634, 0, 1, 0.1647059, 1,
-0.3036662, 1.215842, 0.4370492, 0, 1, 0.172549, 1,
-0.3036607, -0.795976, -2.063975, 0, 1, 0.1764706, 1,
-0.3033732, 0.8257779, -2.197468, 0, 1, 0.1843137, 1,
-0.3010187, -0.6003657, -3.172254, 0, 1, 0.1882353, 1,
-0.2992514, -1.225223, -3.96683, 0, 1, 0.1960784, 1,
-0.2982963, -1.730973, -1.673348, 0, 1, 0.2039216, 1,
-0.2958092, -0.2848894, -1.648289, 0, 1, 0.2078431, 1,
-0.295716, 0.0394422, -0.840361, 0, 1, 0.2156863, 1,
-0.2955914, -1.741145, -5.804911, 0, 1, 0.2196078, 1,
-0.2942436, 2.061212, 0.2449922, 0, 1, 0.227451, 1,
-0.2935707, 0.6376055, -1.006982, 0, 1, 0.2313726, 1,
-0.2921604, 0.7579379, -0.5640297, 0, 1, 0.2392157, 1,
-0.291203, -0.09648837, -1.349711, 0, 1, 0.2431373, 1,
-0.2866504, 0.1259431, 0.2277629, 0, 1, 0.2509804, 1,
-0.2813966, -0.13317, -1.784177, 0, 1, 0.254902, 1,
-0.279093, 0.1632442, -0.1573075, 0, 1, 0.2627451, 1,
-0.2775073, -1.610385, -2.634433, 0, 1, 0.2666667, 1,
-0.2722862, -0.1301242, -1.29303, 0, 1, 0.2745098, 1,
-0.2704826, 1.759175, 1.133069, 0, 1, 0.2784314, 1,
-0.2652259, 1.033336, 0.2542625, 0, 1, 0.2862745, 1,
-0.2604938, 0.7063433, -1.9847, 0, 1, 0.2901961, 1,
-0.2601951, 0.09098183, -1.471511, 0, 1, 0.2980392, 1,
-0.2582242, -0.227447, -0.6448929, 0, 1, 0.3058824, 1,
-0.2548423, -0.8311535, -3.559423, 0, 1, 0.3098039, 1,
-0.2542456, -1.371311, -2.597598, 0, 1, 0.3176471, 1,
-0.249402, 0.06347307, 0.3931895, 0, 1, 0.3215686, 1,
-0.248617, 1.365469, 0.4869694, 0, 1, 0.3294118, 1,
-0.2486084, 0.7977083, -1.115959, 0, 1, 0.3333333, 1,
-0.2412073, -0.1706252, -1.399253, 0, 1, 0.3411765, 1,
-0.2370642, -0.3321391, -3.510151, 0, 1, 0.345098, 1,
-0.2346099, 1.035559, -1.245305, 0, 1, 0.3529412, 1,
-0.2345176, -0.06806725, -1.724173, 0, 1, 0.3568628, 1,
-0.2326573, -1.802534, -2.956328, 0, 1, 0.3647059, 1,
-0.2306015, 0.1546741, -1.992133, 0, 1, 0.3686275, 1,
-0.2279876, 0.9021211, 1.166316, 0, 1, 0.3764706, 1,
-0.2260213, 0.9159141, 0.1873496, 0, 1, 0.3803922, 1,
-0.2231225, 0.3734832, 0.7758868, 0, 1, 0.3882353, 1,
-0.2230302, -1.740476, -4.973117, 0, 1, 0.3921569, 1,
-0.2229551, 0.2056402, -1.388087, 0, 1, 0.4, 1,
-0.2227322, 1.529523, -1.95947, 0, 1, 0.4078431, 1,
-0.2226886, -0.7565945, -4.670846, 0, 1, 0.4117647, 1,
-0.2202132, -0.2533297, -2.318803, 0, 1, 0.4196078, 1,
-0.2189602, 0.1076737, 0.1245032, 0, 1, 0.4235294, 1,
-0.2177325, -0.2305433, -2.673948, 0, 1, 0.4313726, 1,
-0.2143816, 1.325969, -2.113506, 0, 1, 0.4352941, 1,
-0.210024, 0.08244026, -0.9113432, 0, 1, 0.4431373, 1,
-0.2100019, 0.2428627, -1.75829, 0, 1, 0.4470588, 1,
-0.2073908, -0.03478651, -2.281503, 0, 1, 0.454902, 1,
-0.203037, -0.6666707, -0.3674512, 0, 1, 0.4588235, 1,
-0.2024042, -0.5444323, -2.267847, 0, 1, 0.4666667, 1,
-0.1998053, -0.1113208, 0.4011675, 0, 1, 0.4705882, 1,
-0.1971599, -1.430456, -4.060037, 0, 1, 0.4784314, 1,
-0.19413, 1.739859, 1.347011, 0, 1, 0.4823529, 1,
-0.1881684, 1.157891, -0.3807949, 0, 1, 0.4901961, 1,
-0.1868764, -1.531076, -3.420692, 0, 1, 0.4941176, 1,
-0.1856204, -2.74716, -2.34056, 0, 1, 0.5019608, 1,
-0.1792632, -0.003429816, -1.783018, 0, 1, 0.509804, 1,
-0.1781001, -0.7796396, -2.739728, 0, 1, 0.5137255, 1,
-0.1736724, 1.681248, -0.158228, 0, 1, 0.5215687, 1,
-0.1656819, 1.013732, 0.3289956, 0, 1, 0.5254902, 1,
-0.1650884, -0.842869, -1.134128, 0, 1, 0.5333334, 1,
-0.1637581, -0.418208, -3.690387, 0, 1, 0.5372549, 1,
-0.1637007, -2.234433, -3.467242, 0, 1, 0.5450981, 1,
-0.163373, -0.3406287, -3.540053, 0, 1, 0.5490196, 1,
-0.1573921, 0.02322591, 0.1830366, 0, 1, 0.5568628, 1,
-0.157261, 0.9223611, -0.7132097, 0, 1, 0.5607843, 1,
-0.1560059, 0.9574803, -0.7794993, 0, 1, 0.5686275, 1,
-0.1534039, 0.09518537, -0.9544206, 0, 1, 0.572549, 1,
-0.1525789, 1.735163, 1.285768, 0, 1, 0.5803922, 1,
-0.1472131, -1.916162, -4.285883, 0, 1, 0.5843138, 1,
-0.146043, 0.1385571, -0.9829199, 0, 1, 0.5921569, 1,
-0.1438156, -0.503807, -3.787651, 0, 1, 0.5960785, 1,
-0.1414153, 0.1154516, -1.23194, 0, 1, 0.6039216, 1,
-0.1378482, -0.9075739, -3.434909, 0, 1, 0.6117647, 1,
-0.1290654, -1.872227, -2.886207, 0, 1, 0.6156863, 1,
-0.1266729, -1.344281, -4.784426, 0, 1, 0.6235294, 1,
-0.126014, -2.143276, -3.130589, 0, 1, 0.627451, 1,
-0.1242232, 1.376382, -1.766595, 0, 1, 0.6352941, 1,
-0.1230569, 0.2109398, -1.630785, 0, 1, 0.6392157, 1,
-0.1218621, 0.7193221, 0.4551529, 0, 1, 0.6470588, 1,
-0.1202534, -2.267413, -3.844463, 0, 1, 0.6509804, 1,
-0.1150831, 1.282007, -0.4741628, 0, 1, 0.6588235, 1,
-0.1149091, -2.547067, -2.490068, 0, 1, 0.6627451, 1,
-0.1147682, 0.6100556, 0.6226298, 0, 1, 0.6705883, 1,
-0.1117973, 0.6769167, 0.6910734, 0, 1, 0.6745098, 1,
-0.1114387, -1.003303, -3.959526, 0, 1, 0.682353, 1,
-0.1071819, 1.539276, 1.005587, 0, 1, 0.6862745, 1,
-0.102263, -2.460816, -4.827742, 0, 1, 0.6941177, 1,
-0.1014239, -1.201655, -3.073242, 0, 1, 0.7019608, 1,
-0.1000853, 0.9062947, 0.1708638, 0, 1, 0.7058824, 1,
-0.09952098, 0.07357007, -0.7191032, 0, 1, 0.7137255, 1,
-0.09440168, 0.1652963, 0.8628727, 0, 1, 0.7176471, 1,
-0.09353321, -0.1463618, -1.124533, 0, 1, 0.7254902, 1,
-0.09330333, -0.6574572, -2.770665, 0, 1, 0.7294118, 1,
-0.0894514, -2.339957, -2.596262, 0, 1, 0.7372549, 1,
-0.08798796, 0.5499043, 1.80736, 0, 1, 0.7411765, 1,
-0.0867759, 1.272778, -0.06162961, 0, 1, 0.7490196, 1,
-0.08620032, 0.7611343, -0.7135844, 0, 1, 0.7529412, 1,
-0.08417719, -0.04314125, -2.165709, 0, 1, 0.7607843, 1,
-0.08413746, 0.410116, 0.0136346, 0, 1, 0.7647059, 1,
-0.08329964, 0.208543, 0.8646779, 0, 1, 0.772549, 1,
-0.08048846, -1.141134, -4.365859, 0, 1, 0.7764706, 1,
-0.0784984, 0.5331525, -2.815197, 0, 1, 0.7843137, 1,
-0.07712122, -0.1324738, -1.802102, 0, 1, 0.7882353, 1,
-0.07027623, -0.7630098, -3.377913, 0, 1, 0.7960784, 1,
-0.06741742, 2.458763, 1.53428, 0, 1, 0.8039216, 1,
-0.06467251, -0.9039651, -3.122524, 0, 1, 0.8078431, 1,
-0.06249071, 0.1755179, 1.084029, 0, 1, 0.8156863, 1,
-0.0594127, -0.1376394, -1.852152, 0, 1, 0.8196079, 1,
-0.05918195, -0.7021924, -2.94238, 0, 1, 0.827451, 1,
-0.05622606, -1.063389, -3.003242, 0, 1, 0.8313726, 1,
-0.05465065, -0.002737165, -1.771084, 0, 1, 0.8392157, 1,
-0.05264052, 0.739605, 0.1472496, 0, 1, 0.8431373, 1,
-0.04967284, 0.9322977, 0.6163027, 0, 1, 0.8509804, 1,
-0.04558104, 0.7244006, 0.146846, 0, 1, 0.854902, 1,
-0.04460986, -1.958706, -1.144388, 0, 1, 0.8627451, 1,
-0.04086919, -1.701219, -3.581587, 0, 1, 0.8666667, 1,
-0.0371544, 0.7296661, -1.689852, 0, 1, 0.8745098, 1,
-0.03692348, -1.155015, -3.069875, 0, 1, 0.8784314, 1,
-0.03516734, 0.8813701, 0.4867946, 0, 1, 0.8862745, 1,
-0.03436527, -0.1858175, -4.076045, 0, 1, 0.8901961, 1,
-0.03184742, -0.6915631, -2.367576, 0, 1, 0.8980392, 1,
-0.02986029, 0.2193749, -0.5369526, 0, 1, 0.9058824, 1,
-0.02950058, -1.694497, -0.9295651, 0, 1, 0.9098039, 1,
-0.02890954, -0.6401093, -3.302434, 0, 1, 0.9176471, 1,
-0.02875442, 0.2888483, -0.6599346, 0, 1, 0.9215686, 1,
-0.02507847, 0.850517, 0.9961703, 0, 1, 0.9294118, 1,
-0.01612902, 0.08355418, -0.05773418, 0, 1, 0.9333333, 1,
-0.01560143, 0.2624071, 1.203958, 0, 1, 0.9411765, 1,
-0.01462361, -0.27201, -0.8356271, 0, 1, 0.945098, 1,
-0.007742245, -0.5654999, -1.816803, 0, 1, 0.9529412, 1,
-0.0004852001, -0.3365994, -3.360779, 0, 1, 0.9568627, 1,
-0.0004032024, 1.114582, 1.686862, 0, 1, 0.9647059, 1,
0.0008689726, 0.8229113, 0.514775, 0, 1, 0.9686275, 1,
0.009014549, -0.8931563, 4.845976, 0, 1, 0.9764706, 1,
0.009086257, 2.027266, -0.9886872, 0, 1, 0.9803922, 1,
0.01126278, 3.412202, -1.559955, 0, 1, 0.9882353, 1,
0.01240085, -1.40898, 2.956484, 0, 1, 0.9921569, 1,
0.01343724, 0.7134312, 1.287402, 0, 1, 1, 1,
0.0142948, -1.089451, 1.345636, 0, 0.9921569, 1, 1,
0.01798469, 0.1064557, 0.1517124, 0, 0.9882353, 1, 1,
0.0321773, -0.5706227, 3.032661, 0, 0.9803922, 1, 1,
0.03423179, 0.1752094, 1.66608, 0, 0.9764706, 1, 1,
0.0360702, -0.6724905, 0.9759266, 0, 0.9686275, 1, 1,
0.03653874, 1.058032, 0.1683065, 0, 0.9647059, 1, 1,
0.03945689, 0.819006, 2.074342, 0, 0.9568627, 1, 1,
0.04292969, -1.045663, 3.187196, 0, 0.9529412, 1, 1,
0.04612633, 0.1134432, 0.951398, 0, 0.945098, 1, 1,
0.05034036, -0.999859, 2.725249, 0, 0.9411765, 1, 1,
0.05703269, -0.388531, 2.660049, 0, 0.9333333, 1, 1,
0.05853722, -1.418063, 2.837054, 0, 0.9294118, 1, 1,
0.06007442, -0.7428045, 3.440672, 0, 0.9215686, 1, 1,
0.06333254, -0.8613306, 2.860596, 0, 0.9176471, 1, 1,
0.06370699, -0.9802269, 4.092681, 0, 0.9098039, 1, 1,
0.06394418, 0.7554474, -0.1327808, 0, 0.9058824, 1, 1,
0.06488418, -0.6613065, 1.892817, 0, 0.8980392, 1, 1,
0.06538139, -0.9271544, 3.000968, 0, 0.8901961, 1, 1,
0.0665639, -0.5423002, 3.016118, 0, 0.8862745, 1, 1,
0.07085811, 0.05545707, 0.1600418, 0, 0.8784314, 1, 1,
0.07381564, 0.9665887, 1.484623, 0, 0.8745098, 1, 1,
0.07548572, -0.6242381, 2.580355, 0, 0.8666667, 1, 1,
0.07555173, -0.8244757, 2.868377, 0, 0.8627451, 1, 1,
0.08101676, -0.6059363, 3.641816, 0, 0.854902, 1, 1,
0.08696768, -1.760662, 3.472313, 0, 0.8509804, 1, 1,
0.08996024, -1.1343, 2.54133, 0, 0.8431373, 1, 1,
0.0957417, -0.5716209, 3.955245, 0, 0.8392157, 1, 1,
0.09587674, -0.8643577, 3.051316, 0, 0.8313726, 1, 1,
0.1035834, 0.4520798, 1.000172, 0, 0.827451, 1, 1,
0.1049407, 0.1054981, 0.3662065, 0, 0.8196079, 1, 1,
0.1051955, 0.6705089, 0.5974891, 0, 0.8156863, 1, 1,
0.1081844, -0.4643564, 4.009802, 0, 0.8078431, 1, 1,
0.1085565, 0.4785213, 0.5098199, 0, 0.8039216, 1, 1,
0.1107521, -0.06921144, 2.562144, 0, 0.7960784, 1, 1,
0.1158538, 2.764986, -0.092588, 0, 0.7882353, 1, 1,
0.118001, -0.5448908, 2.856284, 0, 0.7843137, 1, 1,
0.1213983, -0.7978948, 1.50649, 0, 0.7764706, 1, 1,
0.1219667, 0.441721, 1.503719, 0, 0.772549, 1, 1,
0.1228402, -0.6481399, 3.4374, 0, 0.7647059, 1, 1,
0.1270235, -0.1573551, 2.619299, 0, 0.7607843, 1, 1,
0.1294187, 1.446666, 1.630538, 0, 0.7529412, 1, 1,
0.1297174, -1.32137, 3.652238, 0, 0.7490196, 1, 1,
0.134406, 0.2928785, 0.4524685, 0, 0.7411765, 1, 1,
0.1376811, -1.0928, 2.272562, 0, 0.7372549, 1, 1,
0.1390459, 1.263182, 1.145949, 0, 0.7294118, 1, 1,
0.1400686, -0.4491444, 3.915464, 0, 0.7254902, 1, 1,
0.1468425, 0.1706704, 0.8757457, 0, 0.7176471, 1, 1,
0.1506428, -1.603856, 3.84179, 0, 0.7137255, 1, 1,
0.1511296, 2.349386, 0.02893217, 0, 0.7058824, 1, 1,
0.1525475, 0.716445, 0.61132, 0, 0.6980392, 1, 1,
0.1563812, 1.420009, -0.5283771, 0, 0.6941177, 1, 1,
0.1566038, 0.3354456, 0.2593864, 0, 0.6862745, 1, 1,
0.1571732, -1.222188, 2.054011, 0, 0.682353, 1, 1,
0.1583153, -0.2690344, 1.443444, 0, 0.6745098, 1, 1,
0.161799, -0.04071642, 1.233334, 0, 0.6705883, 1, 1,
0.1663074, 1.539698, 1.63777, 0, 0.6627451, 1, 1,
0.1669943, 0.3099693, 0.2736812, 0, 0.6588235, 1, 1,
0.1684941, 2.245505, -0.4530151, 0, 0.6509804, 1, 1,
0.1694328, 1.764514, 1.761741, 0, 0.6470588, 1, 1,
0.170068, 0.9821691, -1.558345, 0, 0.6392157, 1, 1,
0.1704531, 0.4390807, 1.701447, 0, 0.6352941, 1, 1,
0.1714286, 0.5570745, 0.6553497, 0, 0.627451, 1, 1,
0.17301, 0.6666452, 1.709178, 0, 0.6235294, 1, 1,
0.1745998, 0.3671376, 0.01350701, 0, 0.6156863, 1, 1,
0.1806073, -0.424687, 1.855099, 0, 0.6117647, 1, 1,
0.1852277, -0.9231974, 2.318151, 0, 0.6039216, 1, 1,
0.1926908, -0.4587283, 1.875703, 0, 0.5960785, 1, 1,
0.1929227, -0.3890644, 3.64113, 0, 0.5921569, 1, 1,
0.195567, -0.8271158, 3.975866, 0, 0.5843138, 1, 1,
0.1987513, -0.05538457, 2.298669, 0, 0.5803922, 1, 1,
0.2003735, 1.000492, -0.595367, 0, 0.572549, 1, 1,
0.2049467, 1.116002, 1.175844, 0, 0.5686275, 1, 1,
0.2065057, -0.6180804, 1.955937, 0, 0.5607843, 1, 1,
0.2067687, -2.801784, 3.263907, 0, 0.5568628, 1, 1,
0.2152429, -0.6767304, 2.565079, 0, 0.5490196, 1, 1,
0.2159697, -0.02027628, -0.6096191, 0, 0.5450981, 1, 1,
0.2195252, -0.1462535, 1.421978, 0, 0.5372549, 1, 1,
0.2196647, -0.9752173, 3.854735, 0, 0.5333334, 1, 1,
0.2199458, 0.150768, 0.5713379, 0, 0.5254902, 1, 1,
0.2205581, -1.162306, 3.089612, 0, 0.5215687, 1, 1,
0.2263312, 1.010483, 0.321466, 0, 0.5137255, 1, 1,
0.2325654, -0.7172117, 3.245021, 0, 0.509804, 1, 1,
0.233922, 1.730665, 0.2814451, 0, 0.5019608, 1, 1,
0.2341307, -0.08243585, 1.673013, 0, 0.4941176, 1, 1,
0.2352089, 0.1287739, 0.09439665, 0, 0.4901961, 1, 1,
0.2374752, -1.615526, 1.436073, 0, 0.4823529, 1, 1,
0.2376219, -2.293665, 3.942693, 0, 0.4784314, 1, 1,
0.2415496, -1.759303, 4.135302, 0, 0.4705882, 1, 1,
0.2422305, 0.03485127, 1.852051, 0, 0.4666667, 1, 1,
0.2445147, -0.3955706, 1.38813, 0, 0.4588235, 1, 1,
0.246911, 1.369522, -0.4679368, 0, 0.454902, 1, 1,
0.2497913, -0.0986347, 2.004319, 0, 0.4470588, 1, 1,
0.2514524, -0.08612326, 1.702936, 0, 0.4431373, 1, 1,
0.254689, 0.2517091, 0.1723127, 0, 0.4352941, 1, 1,
0.2547006, 0.1457975, 0.6358137, 0, 0.4313726, 1, 1,
0.2578704, 2.882094, -1.497563, 0, 0.4235294, 1, 1,
0.2610929, -0.8962469, 0.4076216, 0, 0.4196078, 1, 1,
0.2618851, 0.5396596, 0.4551072, 0, 0.4117647, 1, 1,
0.2647476, 0.3610709, -1.458328, 0, 0.4078431, 1, 1,
0.2650472, -0.05026503, 1.373379, 0, 0.4, 1, 1,
0.273344, -0.1340812, 2.520899, 0, 0.3921569, 1, 1,
0.2763239, -0.9798859, 1.654955, 0, 0.3882353, 1, 1,
0.2820223, -0.6630721, 2.544976, 0, 0.3803922, 1, 1,
0.2852392, 0.159117, 1.769309, 0, 0.3764706, 1, 1,
0.2906058, -0.1564627, 3.58589, 0, 0.3686275, 1, 1,
0.294592, 3.758001, 0.1071458, 0, 0.3647059, 1, 1,
0.2983695, 1.96974, -1.468301, 0, 0.3568628, 1, 1,
0.3021412, -0.04619695, 4.28429, 0, 0.3529412, 1, 1,
0.3038425, 0.456654, 0.009126324, 0, 0.345098, 1, 1,
0.3066837, 0.9521832, 0.5919867, 0, 0.3411765, 1, 1,
0.3148073, -0.3757496, 3.859805, 0, 0.3333333, 1, 1,
0.3150991, -0.5774657, 0.8417933, 0, 0.3294118, 1, 1,
0.3188433, 0.4700706, 0.4948046, 0, 0.3215686, 1, 1,
0.3192767, 2.551486, -0.9024327, 0, 0.3176471, 1, 1,
0.3201063, -0.1368401, 1.624968, 0, 0.3098039, 1, 1,
0.3206997, 0.7954849, 1.203992, 0, 0.3058824, 1, 1,
0.323987, -1.323379, 2.708582, 0, 0.2980392, 1, 1,
0.3304313, 0.5128798, 0.05931942, 0, 0.2901961, 1, 1,
0.3355745, 0.4654328, 1.089626, 0, 0.2862745, 1, 1,
0.3369378, -0.4768204, 2.262847, 0, 0.2784314, 1, 1,
0.3505051, -0.04361537, 2.412247, 0, 0.2745098, 1, 1,
0.354765, -0.2623289, 0.858059, 0, 0.2666667, 1, 1,
0.3592661, 0.853958, -0.9591155, 0, 0.2627451, 1, 1,
0.360923, -0.4010781, 0.105474, 0, 0.254902, 1, 1,
0.3658899, 1.841412, 0.9048101, 0, 0.2509804, 1, 1,
0.3703724, 0.07467708, 0.9358264, 0, 0.2431373, 1, 1,
0.3782057, -0.5648493, 3.419799, 0, 0.2392157, 1, 1,
0.380528, 1.23615, 1.9619, 0, 0.2313726, 1, 1,
0.3808037, 0.07251554, 0.2095883, 0, 0.227451, 1, 1,
0.3817319, 3.271399, 1.080939, 0, 0.2196078, 1, 1,
0.384269, -1.644354, 3.331879, 0, 0.2156863, 1, 1,
0.3918138, -0.7312667, 3.408627, 0, 0.2078431, 1, 1,
0.4031437, 1.853541, -0.7669454, 0, 0.2039216, 1, 1,
0.4044675, -0.4355687, 0.6353898, 0, 0.1960784, 1, 1,
0.4048789, -0.6994426, 1.580346, 0, 0.1882353, 1, 1,
0.4088777, -1.33625, 2.25257, 0, 0.1843137, 1, 1,
0.4090449, -0.6643008, 2.779207, 0, 0.1764706, 1, 1,
0.4090612, -1.381447, 3.969768, 0, 0.172549, 1, 1,
0.411011, 0.9530618, 0.2214572, 0, 0.1647059, 1, 1,
0.413609, -0.1572773, 0.294116, 0, 0.1607843, 1, 1,
0.4137826, 0.3026814, 0.1746972, 0, 0.1529412, 1, 1,
0.41423, -1.666844, 4.249968, 0, 0.1490196, 1, 1,
0.4168998, -0.6406943, 1.513128, 0, 0.1411765, 1, 1,
0.4201048, -0.4620246, 1.036872, 0, 0.1372549, 1, 1,
0.4212014, -0.8666784, 2.103003, 0, 0.1294118, 1, 1,
0.4282177, 1.092849, 2.507572, 0, 0.1254902, 1, 1,
0.4332024, 0.1264494, 1.781054, 0, 0.1176471, 1, 1,
0.4365134, -1.394443, 2.640961, 0, 0.1137255, 1, 1,
0.4442852, 0.4937435, -1.127684, 0, 0.1058824, 1, 1,
0.4453873, -0.4230533, 3.235857, 0, 0.09803922, 1, 1,
0.4471939, -1.148131, 1.907959, 0, 0.09411765, 1, 1,
0.4513255, 0.314276, 0.5576056, 0, 0.08627451, 1, 1,
0.4524224, -0.2157159, 3.434082, 0, 0.08235294, 1, 1,
0.4534118, 0.4101345, 0.659544, 0, 0.07450981, 1, 1,
0.4558436, -0.5726279, 2.353626, 0, 0.07058824, 1, 1,
0.4561725, 1.308534, 0.8946959, 0, 0.0627451, 1, 1,
0.4574337, 0.5248634, 0.6926409, 0, 0.05882353, 1, 1,
0.4581539, -0.9526181, 4.226266, 0, 0.05098039, 1, 1,
0.4598004, -1.716285, 0.4469305, 0, 0.04705882, 1, 1,
0.4652135, -1.427998, 1.910683, 0, 0.03921569, 1, 1,
0.465921, -0.2889046, 0.6369621, 0, 0.03529412, 1, 1,
0.4659333, 0.3683321, -0.4796645, 0, 0.02745098, 1, 1,
0.47103, 0.3081127, 0.9292394, 0, 0.02352941, 1, 1,
0.4716395, -2.288341, 3.465863, 0, 0.01568628, 1, 1,
0.4750538, -1.007003, 3.262199, 0, 0.01176471, 1, 1,
0.4768453, -0.3614973, 1.813886, 0, 0.003921569, 1, 1,
0.478226, 1.057949, 0.941344, 0.003921569, 0, 1, 1,
0.4836917, 1.002879, 2.609259, 0.007843138, 0, 1, 1,
0.4887427, -1.349244, 2.106998, 0.01568628, 0, 1, 1,
0.4937396, 0.9838765, 2.052935, 0.01960784, 0, 1, 1,
0.4940395, -0.05668588, 0.3314197, 0.02745098, 0, 1, 1,
0.4961066, 0.6334504, 2.41785, 0.03137255, 0, 1, 1,
0.496603, 0.8325666, -0.5710056, 0.03921569, 0, 1, 1,
0.5008581, 0.8607821, 1.630815, 0.04313726, 0, 1, 1,
0.5162867, 0.5200955, 1.530989, 0.05098039, 0, 1, 1,
0.5223109, -0.6236261, 2.718281, 0.05490196, 0, 1, 1,
0.5224902, 0.007313529, 0.5416457, 0.0627451, 0, 1, 1,
0.5269182, 0.2549194, 0.7999676, 0.06666667, 0, 1, 1,
0.5272161, -1.689635, 2.817007, 0.07450981, 0, 1, 1,
0.5312194, 0.01926266, 2.097512, 0.07843138, 0, 1, 1,
0.5384139, 0.665899, 0.1581154, 0.08627451, 0, 1, 1,
0.5412994, 0.6533646, 2.138844, 0.09019608, 0, 1, 1,
0.5456437, 1.253482, 0.02312935, 0.09803922, 0, 1, 1,
0.5464517, -0.1985072, 1.382355, 0.1058824, 0, 1, 1,
0.5477786, -0.8723711, 3.298269, 0.1098039, 0, 1, 1,
0.5526886, -0.7469316, 2.065999, 0.1176471, 0, 1, 1,
0.5620811, 0.4618713, 0.2302639, 0.1215686, 0, 1, 1,
0.5671526, -0.9285082, 1.182367, 0.1294118, 0, 1, 1,
0.570857, -0.9471642, 2.500813, 0.1333333, 0, 1, 1,
0.5714749, -0.8884888, 1.439134, 0.1411765, 0, 1, 1,
0.5715818, 0.1811585, 0.6908626, 0.145098, 0, 1, 1,
0.5718451, 0.05103511, 1.296343, 0.1529412, 0, 1, 1,
0.574063, 0.2488577, 1.613249, 0.1568628, 0, 1, 1,
0.5745437, -0.6289321, 1.150283, 0.1647059, 0, 1, 1,
0.5745679, 1.111073, 0.859797, 0.1686275, 0, 1, 1,
0.5775094, 0.3063432, 1.520317, 0.1764706, 0, 1, 1,
0.5803778, -1.623082, 4.63523, 0.1803922, 0, 1, 1,
0.5820098, 1.479799, 1.45276, 0.1882353, 0, 1, 1,
0.5825439, 0.9823613, -0.03326695, 0.1921569, 0, 1, 1,
0.5892881, 0.4337792, 0.4261958, 0.2, 0, 1, 1,
0.5920796, 1.493585, 0.6605492, 0.2078431, 0, 1, 1,
0.5929353, -1.191568, 3.1291, 0.2117647, 0, 1, 1,
0.5931856, -0.7083414, 2.864152, 0.2196078, 0, 1, 1,
0.5972831, -0.6595537, 1.099694, 0.2235294, 0, 1, 1,
0.5992117, 0.6608582, 2.260987, 0.2313726, 0, 1, 1,
0.6029464, -0.3419048, 1.763795, 0.2352941, 0, 1, 1,
0.6069919, 0.1297117, 1.694515, 0.2431373, 0, 1, 1,
0.6073487, 1.208431, 0.7537029, 0.2470588, 0, 1, 1,
0.60967, 0.3862127, 0.4125429, 0.254902, 0, 1, 1,
0.6129882, -0.8580955, 2.983294, 0.2588235, 0, 1, 1,
0.6139894, 0.5600237, 1.538824, 0.2666667, 0, 1, 1,
0.6147571, -0.8214254, 3.081913, 0.2705882, 0, 1, 1,
0.617154, -0.6625229, 2.196686, 0.2784314, 0, 1, 1,
0.6265689, -0.7635171, 3.351019, 0.282353, 0, 1, 1,
0.6290011, -0.4379427, 1.976254, 0.2901961, 0, 1, 1,
0.6306926, 0.5999507, 1.240696, 0.2941177, 0, 1, 1,
0.6330763, -0.03183743, 1.460337, 0.3019608, 0, 1, 1,
0.6346913, 0.0866423, 1.068378, 0.3098039, 0, 1, 1,
0.6359678, -0.1084323, 2.530365, 0.3137255, 0, 1, 1,
0.6418691, -1.177509, 3.366083, 0.3215686, 0, 1, 1,
0.64661, -1.03335, 2.576294, 0.3254902, 0, 1, 1,
0.663094, 1.711744, 1.295787, 0.3333333, 0, 1, 1,
0.6646535, -0.3952353, 2.358848, 0.3372549, 0, 1, 1,
0.6738523, -0.5503586, 2.074438, 0.345098, 0, 1, 1,
0.6783932, -0.7138282, 1.308343, 0.3490196, 0, 1, 1,
0.6795602, 1.376683, -0.33807, 0.3568628, 0, 1, 1,
0.6818951, 0.2991539, 2.077806, 0.3607843, 0, 1, 1,
0.6827158, -0.9789641, 1.512936, 0.3686275, 0, 1, 1,
0.68398, -0.5639578, 2.395708, 0.372549, 0, 1, 1,
0.6906091, 2.105314, 0.2912314, 0.3803922, 0, 1, 1,
0.6911119, -0.4683378, 3.368023, 0.3843137, 0, 1, 1,
0.7007964, -1.801544, 1.414061, 0.3921569, 0, 1, 1,
0.7025256, -0.4644181, 2.708297, 0.3960784, 0, 1, 1,
0.7047749, 1.803786, 1.437615, 0.4039216, 0, 1, 1,
0.7072905, -0.1244422, 2.892267, 0.4117647, 0, 1, 1,
0.7085864, -1.64689, 2.242042, 0.4156863, 0, 1, 1,
0.7100169, 0.5592204, 2.429726, 0.4235294, 0, 1, 1,
0.7117717, -1.706129, 2.256133, 0.427451, 0, 1, 1,
0.7165208, -0.2834602, 3.793047, 0.4352941, 0, 1, 1,
0.7263615, -1.622165, 3.031533, 0.4392157, 0, 1, 1,
0.727192, -0.07048842, 1.32188, 0.4470588, 0, 1, 1,
0.7287332, -1.293981, 3.630503, 0.4509804, 0, 1, 1,
0.739522, 1.301509, 1.165227, 0.4588235, 0, 1, 1,
0.7465926, 0.1136966, 0.3983696, 0.4627451, 0, 1, 1,
0.7481644, 2.549493, 0.9726139, 0.4705882, 0, 1, 1,
0.7486435, -0.3626607, 2.378583, 0.4745098, 0, 1, 1,
0.7495977, -1.084725, 1.891802, 0.4823529, 0, 1, 1,
0.7507031, -0.0396368, 1.812335, 0.4862745, 0, 1, 1,
0.750876, 1.184203, -1.481982, 0.4941176, 0, 1, 1,
0.7522517, -0.2050804, 1.148473, 0.5019608, 0, 1, 1,
0.7616302, -0.03497422, -0.3117913, 0.5058824, 0, 1, 1,
0.7646085, -1.885654, 2.669357, 0.5137255, 0, 1, 1,
0.7646369, -0.4395779, 2.273769, 0.5176471, 0, 1, 1,
0.7671613, -0.4440773, 1.620119, 0.5254902, 0, 1, 1,
0.7698101, -1.07148, 0.6545997, 0.5294118, 0, 1, 1,
0.7699897, 0.6992574, 1.760427, 0.5372549, 0, 1, 1,
0.7782857, -1.286159, 2.816671, 0.5411765, 0, 1, 1,
0.7790931, -1.787417, 3.906575, 0.5490196, 0, 1, 1,
0.781138, -0.2233667, 1.798241, 0.5529412, 0, 1, 1,
0.7849362, -2.080616, 3.210743, 0.5607843, 0, 1, 1,
0.7876592, -1.317258, 1.663463, 0.5647059, 0, 1, 1,
0.7908399, -0.2854478, 1.818354, 0.572549, 0, 1, 1,
0.7934665, 0.2544649, 1.610009, 0.5764706, 0, 1, 1,
0.7938066, 0.8826788, 1.250391, 0.5843138, 0, 1, 1,
0.7942578, -1.408205, 0.6189473, 0.5882353, 0, 1, 1,
0.7961509, 0.8266464, -1.07114, 0.5960785, 0, 1, 1,
0.8054465, -0.4068448, 3.118779, 0.6039216, 0, 1, 1,
0.8071471, 1.127304, 1.641511, 0.6078432, 0, 1, 1,
0.8091304, 0.8935254, 0.7719399, 0.6156863, 0, 1, 1,
0.8103001, 0.419609, 2.438749, 0.6196079, 0, 1, 1,
0.8190212, 1.050048, 2.088586, 0.627451, 0, 1, 1,
0.8248985, 0.3487409, 2.485668, 0.6313726, 0, 1, 1,
0.8358696, -0.5833909, 1.903886, 0.6392157, 0, 1, 1,
0.8386025, 0.9239538, 1.070119, 0.6431373, 0, 1, 1,
0.8386495, -1.419328, 1.879452, 0.6509804, 0, 1, 1,
0.8394834, -0.4667837, 2.161067, 0.654902, 0, 1, 1,
0.8402618, -0.5987377, 1.635229, 0.6627451, 0, 1, 1,
0.8409011, -0.4530098, 1.486469, 0.6666667, 0, 1, 1,
0.8712822, 1.388113, 0.8682382, 0.6745098, 0, 1, 1,
0.8734484, 1.144008, -0.7127178, 0.6784314, 0, 1, 1,
0.8758814, -0.5708363, 3.057868, 0.6862745, 0, 1, 1,
0.8774702, 1.237057, 0.3194637, 0.6901961, 0, 1, 1,
0.8806318, -0.3820081, 2.505709, 0.6980392, 0, 1, 1,
0.8811344, -0.7424373, 1.779735, 0.7058824, 0, 1, 1,
0.8845762, 0.2723016, 1.425303, 0.7098039, 0, 1, 1,
0.886435, 0.3546393, 1.556156, 0.7176471, 0, 1, 1,
0.8878443, 1.404305, 0.5343082, 0.7215686, 0, 1, 1,
0.8884882, -0.1051781, 1.6762, 0.7294118, 0, 1, 1,
0.8886937, 0.3816521, 2.783895, 0.7333333, 0, 1, 1,
0.8906567, 0.3466641, 1.823248, 0.7411765, 0, 1, 1,
0.8951998, 1.439845, 0.6509489, 0.7450981, 0, 1, 1,
0.8970836, 0.8296216, 0.4499302, 0.7529412, 0, 1, 1,
0.901304, -0.2740858, 2.337423, 0.7568628, 0, 1, 1,
0.9063068, 0.5032947, 3.035864, 0.7647059, 0, 1, 1,
0.9117584, -0.6756759, 1.439386, 0.7686275, 0, 1, 1,
0.9134445, 1.255443, -0.3868318, 0.7764706, 0, 1, 1,
0.9146472, 0.7740163, 0.3985516, 0.7803922, 0, 1, 1,
0.9152806, -0.1885168, 2.485738, 0.7882353, 0, 1, 1,
0.9295854, 0.8397788, 0.9476207, 0.7921569, 0, 1, 1,
0.9309792, -1.415003, 0.6581193, 0.8, 0, 1, 1,
0.938359, 0.4729671, -1.094337, 0.8078431, 0, 1, 1,
0.9434953, 1.034565, 1.063999, 0.8117647, 0, 1, 1,
0.9462718, -1.075871, 1.5224, 0.8196079, 0, 1, 1,
0.9472108, -1.318299, 3.396626, 0.8235294, 0, 1, 1,
0.9589467, 2.625443, -1.843921, 0.8313726, 0, 1, 1,
0.9612665, 2.126636, -0.02490876, 0.8352941, 0, 1, 1,
0.964035, -0.5015641, 2.356292, 0.8431373, 0, 1, 1,
0.9687954, 0.3988124, 0.2158908, 0.8470588, 0, 1, 1,
0.9700444, 0.3792267, 0.3783998, 0.854902, 0, 1, 1,
0.9706063, -2.153003, 2.935215, 0.8588235, 0, 1, 1,
0.9747311, 0.9325573, 0.8499575, 0.8666667, 0, 1, 1,
0.9831961, -1.552727, 1.840327, 0.8705882, 0, 1, 1,
0.9890425, -1.620124, 3.28741, 0.8784314, 0, 1, 1,
0.9913356, -0.08381145, 0.08650188, 0.8823529, 0, 1, 1,
0.9925697, -0.7868698, 0.2973874, 0.8901961, 0, 1, 1,
0.999484, 1.64665, -0.4558426, 0.8941177, 0, 1, 1,
0.9995272, 0.4362862, 2.377175, 0.9019608, 0, 1, 1,
1.003247, -0.7756363, 0.4883504, 0.9098039, 0, 1, 1,
1.006795, 0.05654718, 1.950746, 0.9137255, 0, 1, 1,
1.008175, 1.225044, 0.3310744, 0.9215686, 0, 1, 1,
1.015784, 0.2634757, 1.254164, 0.9254902, 0, 1, 1,
1.019643, -1.899815, 3.382441, 0.9333333, 0, 1, 1,
1.024438, -0.4497611, 1.694356, 0.9372549, 0, 1, 1,
1.025481, 1.594021, 1.111308, 0.945098, 0, 1, 1,
1.027368, -0.06860355, 2.704867, 0.9490196, 0, 1, 1,
1.031864, -0.5842639, 1.248902, 0.9568627, 0, 1, 1,
1.039918, -0.08172957, 2.6273, 0.9607843, 0, 1, 1,
1.040985, -0.5322044, 4.359808, 0.9686275, 0, 1, 1,
1.052122, 0.291768, 2.655803, 0.972549, 0, 1, 1,
1.053953, -1.07461, 2.290139, 0.9803922, 0, 1, 1,
1.054984, 0.1208676, 1.281926, 0.9843137, 0, 1, 1,
1.057263, 1.041919, 2.621059, 0.9921569, 0, 1, 1,
1.058675, 0.3863072, 2.057688, 0.9960784, 0, 1, 1,
1.063888, -0.5357826, 1.712245, 1, 0, 0.9960784, 1,
1.071183, -0.3613562, 1.96559, 1, 0, 0.9882353, 1,
1.080666, -1.126188, 3.823055, 1, 0, 0.9843137, 1,
1.09107, 0.8038874, 1.832065, 1, 0, 0.9764706, 1,
1.095205, -0.3188938, 2.49551, 1, 0, 0.972549, 1,
1.101153, -0.6264926, 3.546239, 1, 0, 0.9647059, 1,
1.11702, -0.2835844, 3.800181, 1, 0, 0.9607843, 1,
1.122026, 0.5328175, -0.0946877, 1, 0, 0.9529412, 1,
1.123379, -0.1186554, 0.8389088, 1, 0, 0.9490196, 1,
1.127325, 0.874337, 0.8865107, 1, 0, 0.9411765, 1,
1.128247, -0.07850197, 0.2743126, 1, 0, 0.9372549, 1,
1.139784, 0.1545122, 1.004578, 1, 0, 0.9294118, 1,
1.143102, -1.564879, 2.456273, 1, 0, 0.9254902, 1,
1.143832, -2.19543, 2.679388, 1, 0, 0.9176471, 1,
1.148001, -0.5101922, 3.085058, 1, 0, 0.9137255, 1,
1.157045, 1.085895, 1.473815, 1, 0, 0.9058824, 1,
1.157295, -1.68103, 1.099996, 1, 0, 0.9019608, 1,
1.162323, 1.119752, 2.306583, 1, 0, 0.8941177, 1,
1.162663, -2.074211, 0.7025791, 1, 0, 0.8862745, 1,
1.174689, 0.5358223, 0.2942316, 1, 0, 0.8823529, 1,
1.178481, -1.124203, 2.628043, 1, 0, 0.8745098, 1,
1.182029, 1.424366, 0.2322643, 1, 0, 0.8705882, 1,
1.187667, -0.2866983, 1.596157, 1, 0, 0.8627451, 1,
1.189009, 1.573094, 0.5731569, 1, 0, 0.8588235, 1,
1.191627, 1.841165, 2.56564, 1, 0, 0.8509804, 1,
1.195553, 1.214018, 1.107154, 1, 0, 0.8470588, 1,
1.195875, 0.1426678, 2.612596, 1, 0, 0.8392157, 1,
1.198077, -1.938863, 2.688498, 1, 0, 0.8352941, 1,
1.19952, 1.155415, 1.799468, 1, 0, 0.827451, 1,
1.201382, 0.6994627, -1.075144, 1, 0, 0.8235294, 1,
1.214167, -0.4866112, 2.123155, 1, 0, 0.8156863, 1,
1.215457, -1.440614, 2.418693, 1, 0, 0.8117647, 1,
1.216378, 0.00407397, 0.7228059, 1, 0, 0.8039216, 1,
1.218304, -0.6898198, 0.6963292, 1, 0, 0.7960784, 1,
1.21897, 0.3045708, 2.462017, 1, 0, 0.7921569, 1,
1.224783, -0.9963382, 0.07855001, 1, 0, 0.7843137, 1,
1.23091, -0.4046103, 1.589723, 1, 0, 0.7803922, 1,
1.243037, 0.2237018, 2.053707, 1, 0, 0.772549, 1,
1.243477, -1.304693, 1.508945, 1, 0, 0.7686275, 1,
1.247929, 0.7916303, 0.1751168, 1, 0, 0.7607843, 1,
1.250765, 1.213492, -0.4964659, 1, 0, 0.7568628, 1,
1.253899, -0.2659476, 1.250156, 1, 0, 0.7490196, 1,
1.258895, -0.2942225, 2.296721, 1, 0, 0.7450981, 1,
1.262912, 0.06958093, 2.826809, 1, 0, 0.7372549, 1,
1.265368, 1.083828, 0.1692231, 1, 0, 0.7333333, 1,
1.267329, -0.9769855, 2.410053, 1, 0, 0.7254902, 1,
1.275264, -0.1938251, 2.084326, 1, 0, 0.7215686, 1,
1.289111, 0.2858423, 1.328639, 1, 0, 0.7137255, 1,
1.2895, -0.6910574, 1.544621, 1, 0, 0.7098039, 1,
1.305929, 0.6255778, 1.647254, 1, 0, 0.7019608, 1,
1.307694, 0.6124521, 2.728089, 1, 0, 0.6941177, 1,
1.310991, 0.4990889, 1.445227, 1, 0, 0.6901961, 1,
1.315271, -1.179649, 1.678015, 1, 0, 0.682353, 1,
1.316668, 0.2852519, 2.029091, 1, 0, 0.6784314, 1,
1.316747, 0.5728284, 1.462034, 1, 0, 0.6705883, 1,
1.325058, 0.3087533, 1.424554, 1, 0, 0.6666667, 1,
1.325898, -1.753775, 1.153659, 1, 0, 0.6588235, 1,
1.325996, -1.026456, 4.700212, 1, 0, 0.654902, 1,
1.326348, -1.715629, 2.377339, 1, 0, 0.6470588, 1,
1.328715, 0.7011356, 1.158901, 1, 0, 0.6431373, 1,
1.338064, -1.421699, 1.977756, 1, 0, 0.6352941, 1,
1.339992, -0.7314907, 1.191369, 1, 0, 0.6313726, 1,
1.342949, 1.247282, 0.9900907, 1, 0, 0.6235294, 1,
1.349035, 1.52294, 0.9679987, 1, 0, 0.6196079, 1,
1.35394, -0.594642, 0.4966037, 1, 0, 0.6117647, 1,
1.354593, -0.03851851, 2.4357, 1, 0, 0.6078432, 1,
1.357063, 1.241776, 0.8221776, 1, 0, 0.6, 1,
1.357239, 0.3320318, 1.898657, 1, 0, 0.5921569, 1,
1.364112, -0.2509845, 0.8574919, 1, 0, 0.5882353, 1,
1.368881, -1.429756, -0.1699806, 1, 0, 0.5803922, 1,
1.375046, 0.2193804, 2.145134, 1, 0, 0.5764706, 1,
1.382913, -0.2395247, 1.596216, 1, 0, 0.5686275, 1,
1.386721, -0.3824803, 1.215671, 1, 0, 0.5647059, 1,
1.388053, 1.067137, 0.9977334, 1, 0, 0.5568628, 1,
1.392713, -1.51755, 2.430714, 1, 0, 0.5529412, 1,
1.393112, 1.15777, 0.5513515, 1, 0, 0.5450981, 1,
1.397138, 0.647904, -0.5627629, 1, 0, 0.5411765, 1,
1.401174, 0.4903193, 1.875773, 1, 0, 0.5333334, 1,
1.401345, 1.136023, 0.1670442, 1, 0, 0.5294118, 1,
1.443215, -0.372649, 2.490342, 1, 0, 0.5215687, 1,
1.44337, 1.194809, 0.2411993, 1, 0, 0.5176471, 1,
1.450017, -0.4963387, 2.467813, 1, 0, 0.509804, 1,
1.455811, -1.45138, 1.582801, 1, 0, 0.5058824, 1,
1.456433, 2.168696, -0.04163653, 1, 0, 0.4980392, 1,
1.458359, -0.1609141, 0.1543745, 1, 0, 0.4901961, 1,
1.473285, 0.3397083, 1.329923, 1, 0, 0.4862745, 1,
1.473376, -1.143809, 0.7351326, 1, 0, 0.4784314, 1,
1.480677, -1.192037, 3.502293, 1, 0, 0.4745098, 1,
1.499454, 0.07846102, 0.3360048, 1, 0, 0.4666667, 1,
1.507245, -0.1230155, 1.788884, 1, 0, 0.4627451, 1,
1.512046, -1.054185, 4.002129, 1, 0, 0.454902, 1,
1.516837, 1.073191, 3.010509, 1, 0, 0.4509804, 1,
1.524561, -0.08735947, 0.1166889, 1, 0, 0.4431373, 1,
1.525497, -0.3902457, 4.036071, 1, 0, 0.4392157, 1,
1.533552, 0.8738357, 0.1680431, 1, 0, 0.4313726, 1,
1.533778, -2.515601, 1.228359, 1, 0, 0.427451, 1,
1.540642, 0.9121376, 0.4928614, 1, 0, 0.4196078, 1,
1.544027, -1.370931, 3.030244, 1, 0, 0.4156863, 1,
1.545968, -0.7911478, 2.116492, 1, 0, 0.4078431, 1,
1.547695, 1.925749, -0.5856906, 1, 0, 0.4039216, 1,
1.551559, -0.03728202, 1.702299, 1, 0, 0.3960784, 1,
1.585784, -0.6099945, 1.088992, 1, 0, 0.3882353, 1,
1.588109, 2.263883, 1.629533, 1, 0, 0.3843137, 1,
1.590017, -0.9791316, 0.996245, 1, 0, 0.3764706, 1,
1.596691, 0.9595135, 2.115426, 1, 0, 0.372549, 1,
1.603279, -0.396982, 3.225776, 1, 0, 0.3647059, 1,
1.60645, 1.164565, 3.390201, 1, 0, 0.3607843, 1,
1.636843, 0.2118566, 1.173897, 1, 0, 0.3529412, 1,
1.640538, -0.1588162, 0.9355765, 1, 0, 0.3490196, 1,
1.658699, -0.9771175, 2.006059, 1, 0, 0.3411765, 1,
1.675727, -0.513457, 1.160478, 1, 0, 0.3372549, 1,
1.697967, -0.334832, 1.743635, 1, 0, 0.3294118, 1,
1.708529, 0.02945788, -0.1715906, 1, 0, 0.3254902, 1,
1.713305, 1.040271, 2.676321, 1, 0, 0.3176471, 1,
1.713308, 1.018228, 0.1640097, 1, 0, 0.3137255, 1,
1.714789, 1.0807, 1.186642, 1, 0, 0.3058824, 1,
1.717149, 0.7564006, 1.922888, 1, 0, 0.2980392, 1,
1.725959, -0.8645787, 3.105879, 1, 0, 0.2941177, 1,
1.747703, 1.193549, 2.368522, 1, 0, 0.2862745, 1,
1.749793, 0.7522413, 0.3974423, 1, 0, 0.282353, 1,
1.751234, 0.0950121, 1.977116, 1, 0, 0.2745098, 1,
1.769478, -1.8607, 2.698638, 1, 0, 0.2705882, 1,
1.779976, -0.6007555, 3.305851, 1, 0, 0.2627451, 1,
1.808267, 0.2501233, -1.033093, 1, 0, 0.2588235, 1,
1.815616, -0.611198, 0.2386263, 1, 0, 0.2509804, 1,
1.815706, 1.197795, 1.320016, 1, 0, 0.2470588, 1,
1.818545, 0.9261854, 0.3216374, 1, 0, 0.2392157, 1,
1.820344, 0.4258329, 3.034991, 1, 0, 0.2352941, 1,
1.850462, -1.372552, 3.640206, 1, 0, 0.227451, 1,
1.853859, -0.3486383, 3.891938, 1, 0, 0.2235294, 1,
1.87947, 1.101477, 0.8126466, 1, 0, 0.2156863, 1,
1.889269, -1.406802, 0.9156865, 1, 0, 0.2117647, 1,
1.892589, -0.5249191, 0.6461179, 1, 0, 0.2039216, 1,
1.896758, 0.4489644, 0.4439032, 1, 0, 0.1960784, 1,
1.898402, 0.5217115, 2.484927, 1, 0, 0.1921569, 1,
1.902268, -0.3544096, 2.378795, 1, 0, 0.1843137, 1,
1.913638, 0.08118652, 2.752023, 1, 0, 0.1803922, 1,
1.960846, 0.1831676, 2.581557, 1, 0, 0.172549, 1,
1.988865, 0.2365287, 1.629403, 1, 0, 0.1686275, 1,
2.016575, -0.05311758, 2.517572, 1, 0, 0.1607843, 1,
2.04097, -0.3708209, 1.320233, 1, 0, 0.1568628, 1,
2.041008, -1.013555, 3.363479, 1, 0, 0.1490196, 1,
2.068412, 0.1010653, 1.064469, 1, 0, 0.145098, 1,
2.08137, 1.902358, 0.4763927, 1, 0, 0.1372549, 1,
2.096917, -0.7078891, 2.38723, 1, 0, 0.1333333, 1,
2.111945, 2.037697, 0.6616089, 1, 0, 0.1254902, 1,
2.132864, 1.573397, 2.059316, 1, 0, 0.1215686, 1,
2.13568, -0.824012, 2.884112, 1, 0, 0.1137255, 1,
2.143382, 1.790723, -0.5726523, 1, 0, 0.1098039, 1,
2.16333, 0.3985925, -0.1976458, 1, 0, 0.1019608, 1,
2.203049, 0.2174292, 1.74789, 1, 0, 0.09411765, 1,
2.224881, 0.4081624, 0.4586847, 1, 0, 0.09019608, 1,
2.237083, -0.1483938, 1.137448, 1, 0, 0.08235294, 1,
2.273706, 0.7924564, 3.814223, 1, 0, 0.07843138, 1,
2.323232, 0.5313489, 1.114491, 1, 0, 0.07058824, 1,
2.327111, -1.865433, 3.148248, 1, 0, 0.06666667, 1,
2.368673, 0.9661703, 0.4964763, 1, 0, 0.05882353, 1,
2.387781, -1.748752, 2.036644, 1, 0, 0.05490196, 1,
2.396021, 1.464129, 0.8778538, 1, 0, 0.04705882, 1,
2.399318, -1.465743, 2.516521, 1, 0, 0.04313726, 1,
2.401382, 1.00472, 3.718989, 1, 0, 0.03529412, 1,
2.574893, -0.3282608, 1.959708, 1, 0, 0.03137255, 1,
2.762599, 0.5299519, 0.8719111, 1, 0, 0.02352941, 1,
2.771002, 0.5652269, 0.4261995, 1, 0, 0.01960784, 1,
2.815128, 0.4265165, 1.50866, 1, 0, 0.01176471, 1,
2.820267, -0.1489397, 0.4492089, 1, 0, 0.007843138, 1
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
-0.1087276, -3.913667, -7.610236, 0, -0.5, 0.5, 0.5,
-0.1087276, -3.913667, -7.610236, 1, -0.5, 0.5, 0.5,
-0.1087276, -3.913667, -7.610236, 1, 1.5, 0.5, 0.5,
-0.1087276, -3.913667, -7.610236, 0, 1.5, 0.5, 0.5
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
-4.030652, 0.4781088, -7.610236, 0, -0.5, 0.5, 0.5,
-4.030652, 0.4781088, -7.610236, 1, -0.5, 0.5, 0.5,
-4.030652, 0.4781088, -7.610236, 1, 1.5, 0.5, 0.5,
-4.030652, 0.4781088, -7.610236, 0, 1.5, 0.5, 0.5
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
-4.030652, -3.913667, -0.4794674, 0, -0.5, 0.5, 0.5,
-4.030652, -3.913667, -0.4794674, 1, -0.5, 0.5, 0.5,
-4.030652, -3.913667, -0.4794674, 1, 1.5, 0.5, 0.5,
-4.030652, -3.913667, -0.4794674, 0, 1.5, 0.5, 0.5
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
-3, -2.900181, -5.964674,
2, -2.900181, -5.964674,
-3, -2.900181, -5.964674,
-3, -3.069095, -6.238935,
-2, -2.900181, -5.964674,
-2, -3.069095, -6.238935,
-1, -2.900181, -5.964674,
-1, -3.069095, -6.238935,
0, -2.900181, -5.964674,
0, -3.069095, -6.238935,
1, -2.900181, -5.964674,
1, -3.069095, -6.238935,
2, -2.900181, -5.964674,
2, -3.069095, -6.238935
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
-3, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
-3, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
-3, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
-3, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5,
-2, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
-2, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
-2, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
-2, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5,
-1, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
-1, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
-1, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
-1, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5,
0, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
0, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
0, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
0, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5,
1, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
1, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
1, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
1, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5,
2, -3.406924, -6.787455, 0, -0.5, 0.5, 0.5,
2, -3.406924, -6.787455, 1, -0.5, 0.5, 0.5,
2, -3.406924, -6.787455, 1, 1.5, 0.5, 0.5,
2, -3.406924, -6.787455, 0, 1.5, 0.5, 0.5
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
-3.125592, -2, -5.964674,
-3.125592, 3, -5.964674,
-3.125592, -2, -5.964674,
-3.276435, -2, -6.238935,
-3.125592, -1, -5.964674,
-3.276435, -1, -6.238935,
-3.125592, 0, -5.964674,
-3.276435, 0, -6.238935,
-3.125592, 1, -5.964674,
-3.276435, 1, -6.238935,
-3.125592, 2, -5.964674,
-3.276435, 2, -6.238935,
-3.125592, 3, -5.964674,
-3.276435, 3, -6.238935
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
-3.578122, -2, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, -2, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, -2, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, -2, -6.787455, 0, 1.5, 0.5, 0.5,
-3.578122, -1, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, -1, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, -1, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, -1, -6.787455, 0, 1.5, 0.5, 0.5,
-3.578122, 0, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, 0, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, 0, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, 0, -6.787455, 0, 1.5, 0.5, 0.5,
-3.578122, 1, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, 1, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, 1, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, 1, -6.787455, 0, 1.5, 0.5, 0.5,
-3.578122, 2, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, 2, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, 2, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, 2, -6.787455, 0, 1.5, 0.5, 0.5,
-3.578122, 3, -6.787455, 0, -0.5, 0.5, 0.5,
-3.578122, 3, -6.787455, 1, -0.5, 0.5, 0.5,
-3.578122, 3, -6.787455, 1, 1.5, 0.5, 0.5,
-3.578122, 3, -6.787455, 0, 1.5, 0.5, 0.5
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
-3.125592, -2.900181, -4,
-3.125592, -2.900181, 4,
-3.125592, -2.900181, -4,
-3.276435, -3.069095, -4,
-3.125592, -2.900181, -2,
-3.276435, -3.069095, -2,
-3.125592, -2.900181, 0,
-3.276435, -3.069095, 0,
-3.125592, -2.900181, 2,
-3.276435, -3.069095, 2,
-3.125592, -2.900181, 4,
-3.276435, -3.069095, 4
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
-3.578122, -3.406924, -4, 0, -0.5, 0.5, 0.5,
-3.578122, -3.406924, -4, 1, -0.5, 0.5, 0.5,
-3.578122, -3.406924, -4, 1, 1.5, 0.5, 0.5,
-3.578122, -3.406924, -4, 0, 1.5, 0.5, 0.5,
-3.578122, -3.406924, -2, 0, -0.5, 0.5, 0.5,
-3.578122, -3.406924, -2, 1, -0.5, 0.5, 0.5,
-3.578122, -3.406924, -2, 1, 1.5, 0.5, 0.5,
-3.578122, -3.406924, -2, 0, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 0, 0, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 0, 1, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 0, 1, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 0, 0, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 2, 0, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 2, 1, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 2, 1, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 2, 0, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 4, 0, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 4, 1, -0.5, 0.5, 0.5,
-3.578122, -3.406924, 4, 1, 1.5, 0.5, 0.5,
-3.578122, -3.406924, 4, 0, 1.5, 0.5, 0.5
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
-3.125592, -2.900181, -5.964674,
-3.125592, 3.856398, -5.964674,
-3.125592, -2.900181, 5.005739,
-3.125592, 3.856398, 5.005739,
-3.125592, -2.900181, -5.964674,
-3.125592, -2.900181, 5.005739,
-3.125592, 3.856398, -5.964674,
-3.125592, 3.856398, 5.005739,
-3.125592, -2.900181, -5.964674,
2.908137, -2.900181, -5.964674,
-3.125592, -2.900181, 5.005739,
2.908137, -2.900181, 5.005739,
-3.125592, 3.856398, -5.964674,
2.908137, 3.856398, -5.964674,
-3.125592, 3.856398, 5.005739,
2.908137, 3.856398, 5.005739,
2.908137, -2.900181, -5.964674,
2.908137, 3.856398, -5.964674,
2.908137, -2.900181, 5.005739,
2.908137, 3.856398, 5.005739,
2.908137, -2.900181, -5.964674,
2.908137, -2.900181, 5.005739,
2.908137, 3.856398, -5.964674,
2.908137, 3.856398, 5.005739
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
var radius = 7.596936;
var distance = 33.79963;
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
mvMatrix.translate( 0.1087276, -0.4781088, 0.4794674 );
mvMatrix.scale( 1.36134, 1.215698, 0.7487372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79963);
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
3-methoxy-6-phenyl-2<-read.table("3-methoxy-6-phenyl-2.xyz", skip=1)
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
-3.037722, 1.593517, -1.327256, 0, 0, 1, 1, 1,
-2.923056, 0.3188831, -1.357345, 1, 0, 0, 1, 1,
-2.698292, 1.661811, -0.1165184, 1, 0, 0, 1, 1,
-2.649849, -0.9899727, -1.417782, 1, 0, 0, 1, 1,
-2.622692, -0.02888284, -1.220887, 1, 0, 0, 1, 1,
-2.575279, 0.8071759, -0.7303175, 1, 0, 0, 1, 1,
-2.515306, 0.5713755, -0.8684018, 0, 0, 0, 1, 1,
-2.433126, -1.174518, -1.388622, 0, 0, 0, 1, 1,
-2.419187, -0.3719987, -2.646961, 0, 0, 0, 1, 1,
-2.390622, -0.8290572, -1.960688, 0, 0, 0, 1, 1,
-2.358407, -0.2505603, -1.054833, 0, 0, 0, 1, 1,
-2.214536, 0.6737931, -1.383886, 0, 0, 0, 1, 1,
-2.206591, -0.2849161, -1.345374, 0, 0, 0, 1, 1,
-2.11557, 0.3469238, -0.7452364, 1, 1, 1, 1, 1,
-2.114264, 1.645392, -0.8169242, 1, 1, 1, 1, 1,
-2.102564, 0.5433434, -0.5443404, 1, 1, 1, 1, 1,
-2.098056, -0.339434, -2.684756, 1, 1, 1, 1, 1,
-2.033758, -0.4735337, -0.3358967, 1, 1, 1, 1, 1,
-2.004215, -1.781746, -2.336601, 1, 1, 1, 1, 1,
-1.949782, 1.138752, -1.911392, 1, 1, 1, 1, 1,
-1.94623, 0.533722, 0.4289328, 1, 1, 1, 1, 1,
-1.943509, -0.125895, -1.962822, 1, 1, 1, 1, 1,
-1.907517, -0.2793082, -2.491912, 1, 1, 1, 1, 1,
-1.886694, 0.6898121, -0.7181922, 1, 1, 1, 1, 1,
-1.860761, 0.3239723, -1.403361, 1, 1, 1, 1, 1,
-1.850397, 0.01219787, 0.4097401, 1, 1, 1, 1, 1,
-1.847786, -0.5916198, -2.251587, 1, 1, 1, 1, 1,
-1.846155, 0.9007792, -0.368756, 1, 1, 1, 1, 1,
-1.838127, 0.4221929, -1.645433, 0, 0, 1, 1, 1,
-1.821419, -0.5322855, -1.333271, 1, 0, 0, 1, 1,
-1.818585, -1.40709, -0.3073303, 1, 0, 0, 1, 1,
-1.79704, -0.5455076, -1.274428, 1, 0, 0, 1, 1,
-1.785052, 0.610112, -1.420229, 1, 0, 0, 1, 1,
-1.78404, -0.8974268, -1.424228, 1, 0, 0, 1, 1,
-1.774077, 0.6222125, -2.387091, 0, 0, 0, 1, 1,
-1.772031, 1.600608, -0.9483482, 0, 0, 0, 1, 1,
-1.770649, -0.8929434, -1.046178, 0, 0, 0, 1, 1,
-1.769268, -1.308822, -3.063416, 0, 0, 0, 1, 1,
-1.736261, -0.3031618, -1.92501, 0, 0, 0, 1, 1,
-1.730571, -0.3536541, -1.101764, 0, 0, 0, 1, 1,
-1.728844, -0.05984197, -3.085436, 0, 0, 0, 1, 1,
-1.714937, 1.3492, -0.6571579, 1, 1, 1, 1, 1,
-1.709597, 0.1063595, -0.7397203, 1, 1, 1, 1, 1,
-1.709579, 0.604802, -1.093475, 1, 1, 1, 1, 1,
-1.706884, 0.04343287, -2.502963, 1, 1, 1, 1, 1,
-1.69454, 1.447956, -1.013131, 1, 1, 1, 1, 1,
-1.69406, -1.328145, -2.563633, 1, 1, 1, 1, 1,
-1.689141, 0.6893231, -1.07726, 1, 1, 1, 1, 1,
-1.687294, -0.4817847, -1.534578, 1, 1, 1, 1, 1,
-1.674482, 2.763047, 0.5120925, 1, 1, 1, 1, 1,
-1.648527, -0.6685275, -0.4962431, 1, 1, 1, 1, 1,
-1.641791, -1.423784, -4.212128, 1, 1, 1, 1, 1,
-1.63728, 1.695582, -1.359981, 1, 1, 1, 1, 1,
-1.632656, 0.3513366, -2.71629, 1, 1, 1, 1, 1,
-1.625848, -1.453409, -3.174337, 1, 1, 1, 1, 1,
-1.622273, -0.7225724, -1.571737, 1, 1, 1, 1, 1,
-1.604885, 2.183072, -0.4744484, 0, 0, 1, 1, 1,
-1.601439, -0.8338582, -1.612824, 1, 0, 0, 1, 1,
-1.593496, -1.837893, -2.590619, 1, 0, 0, 1, 1,
-1.582268, 0.5695534, -2.48082, 1, 0, 0, 1, 1,
-1.578621, -1.254385, -1.716511, 1, 0, 0, 1, 1,
-1.576325, 1.449084, -2.065067, 1, 0, 0, 1, 1,
-1.552595, 0.2078932, -2.939569, 0, 0, 0, 1, 1,
-1.528194, -0.5000451, -2.832744, 0, 0, 0, 1, 1,
-1.524072, -1.01634, -3.439044, 0, 0, 0, 1, 1,
-1.517378, -1.233146, -2.920895, 0, 0, 0, 1, 1,
-1.511967, 0.7669857, -0.1865746, 0, 0, 0, 1, 1,
-1.501926, 1.032842, -1.735516, 0, 0, 0, 1, 1,
-1.48806, -0.03122544, -0.6117926, 0, 0, 0, 1, 1,
-1.482136, 0.367421, -1.673993, 1, 1, 1, 1, 1,
-1.477969, 0.8276971, -1.404592, 1, 1, 1, 1, 1,
-1.455561, 0.7102034, -2.124817, 1, 1, 1, 1, 1,
-1.44755, 2.358428, -0.1431529, 1, 1, 1, 1, 1,
-1.442369, -0.4366421, -0.7505237, 1, 1, 1, 1, 1,
-1.438181, 0.2636001, 0.8316313, 1, 1, 1, 1, 1,
-1.434525, -0.8966597, -1.497824, 1, 1, 1, 1, 1,
-1.430462, 1.180227, -1.896796, 1, 1, 1, 1, 1,
-1.429709, 1.147538, -1.160073, 1, 1, 1, 1, 1,
-1.401186, -0.9874759, -2.789869, 1, 1, 1, 1, 1,
-1.398438, -0.9234267, -3.001271, 1, 1, 1, 1, 1,
-1.395084, 0.06513475, -1.81553, 1, 1, 1, 1, 1,
-1.393044, 1.876985, -0.2614551, 1, 1, 1, 1, 1,
-1.390727, -1.155376, -2.031698, 1, 1, 1, 1, 1,
-1.361378, 0.3379349, -2.684319, 1, 1, 1, 1, 1,
-1.358113, -0.1277002, -0.5586801, 0, 0, 1, 1, 1,
-1.34922, 0.4367198, -2.337532, 1, 0, 0, 1, 1,
-1.341681, -2.028893, -3.146051, 1, 0, 0, 1, 1,
-1.339034, 0.2394054, -1.494174, 1, 0, 0, 1, 1,
-1.338076, 0.08417334, -2.571609, 1, 0, 0, 1, 1,
-1.336114, -0.9978093, -1.694589, 1, 0, 0, 1, 1,
-1.328663, -0.6602419, -2.525727, 0, 0, 0, 1, 1,
-1.32615, -0.4790812, -1.675546, 0, 0, 0, 1, 1,
-1.322423, -1.091245, -2.415485, 0, 0, 0, 1, 1,
-1.315708, 0.2333615, -1.264931, 0, 0, 0, 1, 1,
-1.304634, 0.2850092, -2.532866, 0, 0, 0, 1, 1,
-1.302743, -0.6290643, -2.274885, 0, 0, 0, 1, 1,
-1.302662, 1.046019, 0.3720292, 0, 0, 0, 1, 1,
-1.297977, 0.545484, -1.179569, 1, 1, 1, 1, 1,
-1.29354, -1.061881, -2.774803, 1, 1, 1, 1, 1,
-1.293182, -0.7748541, -1.642828, 1, 1, 1, 1, 1,
-1.289582, 0.4052638, -1.537911, 1, 1, 1, 1, 1,
-1.276188, 0.07617933, 0.1164558, 1, 1, 1, 1, 1,
-1.263883, -0.9082845, -0.6472756, 1, 1, 1, 1, 1,
-1.259396, 0.2056697, -0.1593762, 1, 1, 1, 1, 1,
-1.242359, -0.5809091, -1.869226, 1, 1, 1, 1, 1,
-1.233597, -0.6682914, -2.186448, 1, 1, 1, 1, 1,
-1.221506, 0.08952174, -1.91976, 1, 1, 1, 1, 1,
-1.221351, -0.3555925, -2.828298, 1, 1, 1, 1, 1,
-1.214986, 0.3547762, 0.0901134, 1, 1, 1, 1, 1,
-1.204136, -0.05397213, -2.541255, 1, 1, 1, 1, 1,
-1.201129, -0.7611733, -3.981159, 1, 1, 1, 1, 1,
-1.188801, -1.044698, -1.30588, 1, 1, 1, 1, 1,
-1.184847, -0.3844286, -0.9972986, 0, 0, 1, 1, 1,
-1.177764, 0.4071602, -1.726194, 1, 0, 0, 1, 1,
-1.167305, -0.575672, -2.211732, 1, 0, 0, 1, 1,
-1.165604, -0.4237978, -3.442852, 1, 0, 0, 1, 1,
-1.160152, -0.8436404, -2.585785, 1, 0, 0, 1, 1,
-1.152646, -1.055251, -4.505612, 1, 0, 0, 1, 1,
-1.150817, -0.2805007, -2.499212, 0, 0, 0, 1, 1,
-1.149846, 1.219192, 0.7988778, 0, 0, 0, 1, 1,
-1.145061, 0.9564818, -2.675635, 0, 0, 0, 1, 1,
-1.137604, -0.7630787, -1.38808, 0, 0, 0, 1, 1,
-1.136979, 1.69165, -2.087084, 0, 0, 0, 1, 1,
-1.12405, 1.767885, -0.6421372, 0, 0, 0, 1, 1,
-1.117418, -1.07656, -1.687562, 0, 0, 0, 1, 1,
-1.117179, 0.7611848, -1.880635, 1, 1, 1, 1, 1,
-1.112304, -0.08679205, -2.649527, 1, 1, 1, 1, 1,
-1.109763, 0.6119329, -1.077431, 1, 1, 1, 1, 1,
-1.109482, 0.3066086, -0.1858864, 1, 1, 1, 1, 1,
-1.108286, 0.06756176, -0.4483055, 1, 1, 1, 1, 1,
-1.106262, -0.6893982, -2.536764, 1, 1, 1, 1, 1,
-1.105337, 0.065376, -3.153859, 1, 1, 1, 1, 1,
-1.094851, -1.422058, -3.483398, 1, 1, 1, 1, 1,
-1.084346, -0.6586524, -0.48583, 1, 1, 1, 1, 1,
-1.081052, 0.9565881, 1.023574, 1, 1, 1, 1, 1,
-1.076189, -0.2053168, 1.444077, 1, 1, 1, 1, 1,
-1.076052, -0.553231, -1.414654, 1, 1, 1, 1, 1,
-1.07451, 0.2733634, -0.1048809, 1, 1, 1, 1, 1,
-1.062317, -1.914691, -3.830744, 1, 1, 1, 1, 1,
-1.056132, 0.006786908, -0.8569899, 1, 1, 1, 1, 1,
-1.047261, -0.3240428, -1.658083, 0, 0, 1, 1, 1,
-1.041594, -0.392598, -0.8688408, 1, 0, 0, 1, 1,
-1.038395, 1.682373, -1.75529, 1, 0, 0, 1, 1,
-1.036588, -1.577273, -2.414551, 1, 0, 0, 1, 1,
-1.035395, 0.5006671, 0.492976, 1, 0, 0, 1, 1,
-1.030947, 0.008951583, -1.709568, 1, 0, 0, 1, 1,
-1.025258, -0.4098157, -2.251928, 0, 0, 0, 1, 1,
-1.024941, 0.3885255, 0.08091051, 0, 0, 0, 1, 1,
-1.018791, -0.2740806, -0.9952187, 0, 0, 0, 1, 1,
-1.018251, 2.034472, -1.308228, 0, 0, 0, 1, 1,
-1.015947, 1.068541, -1.626337, 0, 0, 0, 1, 1,
-1.010466, 0.9377707, 0.1346236, 0, 0, 0, 1, 1,
-1.007341, -1.733337, -1.012406, 0, 0, 0, 1, 1,
-1.005697, 1.002568, -1.090291, 1, 1, 1, 1, 1,
-0.9942133, -0.3452029, -0.3908856, 1, 1, 1, 1, 1,
-0.9929322, -2.611223, -3.150274, 1, 1, 1, 1, 1,
-0.992914, 0.8558233, -0.8190995, 1, 1, 1, 1, 1,
-0.9891915, 1.612601, -0.5918642, 1, 1, 1, 1, 1,
-0.9788342, 0.3353986, -0.9001694, 1, 1, 1, 1, 1,
-0.9716833, -0.2213764, -2.845517, 1, 1, 1, 1, 1,
-0.9664448, 0.3460779, -1.534146, 1, 1, 1, 1, 1,
-0.9631205, 0.6649533, -1.523456, 1, 1, 1, 1, 1,
-0.9514793, 0.2375468, -1.721258, 1, 1, 1, 1, 1,
-0.9510532, -0.1151973, -1.984801, 1, 1, 1, 1, 1,
-0.9508886, -0.5407644, -3.730123, 1, 1, 1, 1, 1,
-0.9411494, -0.3955224, -1.972256, 1, 1, 1, 1, 1,
-0.9322673, 2.717786, 1.20235, 1, 1, 1, 1, 1,
-0.9283151, -0.7310287, -3.306219, 1, 1, 1, 1, 1,
-0.918864, 1.880443, 0.4405475, 0, 0, 1, 1, 1,
-0.9062365, 1.587252, -0.4523528, 1, 0, 0, 1, 1,
-0.9020867, -1.464498, 0.2483055, 1, 0, 0, 1, 1,
-0.9003298, -1.001506, -2.303339, 1, 0, 0, 1, 1,
-0.8981917, -0.9990663, -3.621957, 1, 0, 0, 1, 1,
-0.8974555, 0.2040546, -3.420756, 1, 0, 0, 1, 1,
-0.8939632, -0.2565249, -2.432714, 0, 0, 0, 1, 1,
-0.8814366, -1.249543, -1.957904, 0, 0, 0, 1, 1,
-0.8746493, 0.02498446, -2.031854, 0, 0, 0, 1, 1,
-0.8709412, 0.6703205, -1.17429, 0, 0, 0, 1, 1,
-0.8686653, 1.304896, -1.317367, 0, 0, 0, 1, 1,
-0.8683383, -1.904029, -3.709698, 0, 0, 0, 1, 1,
-0.8675722, -0.5490935, -1.930357, 0, 0, 0, 1, 1,
-0.86275, -2.008738, -2.742755, 1, 1, 1, 1, 1,
-0.8607027, -1.703758, -3.048431, 1, 1, 1, 1, 1,
-0.8593361, -0.636167, -1.783371, 1, 1, 1, 1, 1,
-0.8591503, -1.292905, -1.998938, 1, 1, 1, 1, 1,
-0.8556535, 0.4694558, -1.235709, 1, 1, 1, 1, 1,
-0.8510864, -0.9458588, -0.7296292, 1, 1, 1, 1, 1,
-0.8483002, 0.7378967, 0.06537927, 1, 1, 1, 1, 1,
-0.8482698, -1.578384, -2.092037, 1, 1, 1, 1, 1,
-0.8471168, 0.6652158, -4.097372, 1, 1, 1, 1, 1,
-0.8445536, -1.169877, -2.101303, 1, 1, 1, 1, 1,
-0.8380525, -0.2474916, -3.417825, 1, 1, 1, 1, 1,
-0.8377795, -0.3879321, -0.7378054, 1, 1, 1, 1, 1,
-0.8369483, 0.6316687, 0.08445682, 1, 1, 1, 1, 1,
-0.8366563, 0.7176791, -1.52074, 1, 1, 1, 1, 1,
-0.83634, -0.4605961, -2.19104, 1, 1, 1, 1, 1,
-0.8306299, 1.468855, -2.297395, 0, 0, 1, 1, 1,
-0.8216316, -0.2761691, -2.391884, 1, 0, 0, 1, 1,
-0.8168994, 0.8593464, -0.2542944, 1, 0, 0, 1, 1,
-0.8159921, -0.682416, -1.944929, 1, 0, 0, 1, 1,
-0.8103893, -0.9329187, -3.214691, 1, 0, 0, 1, 1,
-0.8056053, 1.851287, 0.2586715, 1, 0, 0, 1, 1,
-0.8027266, -1.359394, -4.242918, 0, 0, 0, 1, 1,
-0.7996268, 0.6078458, -1.575786, 0, 0, 0, 1, 1,
-0.7945972, -0.6419826, -3.15299, 0, 0, 0, 1, 1,
-0.7897681, 0.4665191, -2.014887, 0, 0, 0, 1, 1,
-0.7849575, 1.835885, -0.04504744, 0, 0, 0, 1, 1,
-0.7843388, -0.6685629, -2.654397, 0, 0, 0, 1, 1,
-0.781149, 0.8041454, 0.285047, 0, 0, 0, 1, 1,
-0.7804382, -0.4010236, -1.623966, 1, 1, 1, 1, 1,
-0.779662, 1.300146, -0.8013222, 1, 1, 1, 1, 1,
-0.7761011, 0.3649841, -2.293627, 1, 1, 1, 1, 1,
-0.7713529, 0.7041602, 0.284808, 1, 1, 1, 1, 1,
-0.7712544, -2.067066, -1.505293, 1, 1, 1, 1, 1,
-0.7648852, -2.193789, -1.394898, 1, 1, 1, 1, 1,
-0.7645318, -1.093308, -3.860583, 1, 1, 1, 1, 1,
-0.7640855, -0.5016857, -2.666131, 1, 1, 1, 1, 1,
-0.7639756, -0.9301517, -3.537354, 1, 1, 1, 1, 1,
-0.7572895, 0.1547603, -2.086959, 1, 1, 1, 1, 1,
-0.7560738, -0.971318, -2.472413, 1, 1, 1, 1, 1,
-0.7552611, 1.76213, -0.4439623, 1, 1, 1, 1, 1,
-0.753791, 1.465772, 0.1085367, 1, 1, 1, 1, 1,
-0.7507575, -1.545984, -2.439513, 1, 1, 1, 1, 1,
-0.74985, 1.347019, 0.284507, 1, 1, 1, 1, 1,
-0.7475972, -0.6180823, -1.102693, 0, 0, 1, 1, 1,
-0.7437716, -0.1561752, -1.551467, 1, 0, 0, 1, 1,
-0.7418926, -0.4246026, -1.60679, 1, 0, 0, 1, 1,
-0.7412431, -0.7264226, -4.735302, 1, 0, 0, 1, 1,
-0.7371012, -1.620399, -3.787737, 1, 0, 0, 1, 1,
-0.7369456, -0.3387567, -2.033274, 1, 0, 0, 1, 1,
-0.7332807, 1.149193, -1.128789, 0, 0, 0, 1, 1,
-0.7312537, -0.4416682, -2.427024, 0, 0, 0, 1, 1,
-0.727289, 0.2733518, -2.157552, 0, 0, 0, 1, 1,
-0.7212973, 1.69147, 0.8039041, 0, 0, 0, 1, 1,
-0.7194686, -1.043361, -1.809758, 0, 0, 0, 1, 1,
-0.7083572, -0.007762294, -2.855861, 0, 0, 0, 1, 1,
-0.707715, 1.333878, -1.03029, 0, 0, 0, 1, 1,
-0.7051808, 1.068299, 1.964883, 1, 1, 1, 1, 1,
-0.7011805, 0.341415, -1.749238, 1, 1, 1, 1, 1,
-0.6948859, -1.263215, -3.417764, 1, 1, 1, 1, 1,
-0.6942241, 1.642668, -1.516481, 1, 1, 1, 1, 1,
-0.6808196, 0.1273894, -0.7187673, 1, 1, 1, 1, 1,
-0.6794482, -0.6487678, -3.106066, 1, 1, 1, 1, 1,
-0.6760611, -0.3343959, -1.239689, 1, 1, 1, 1, 1,
-0.675214, 1.521426, 0.2915215, 1, 1, 1, 1, 1,
-0.675198, -0.07377903, -2.718358, 1, 1, 1, 1, 1,
-0.6739591, 0.2816411, 0.04588039, 1, 1, 1, 1, 1,
-0.6719745, -2.012858, -3.873489, 1, 1, 1, 1, 1,
-0.6684808, -0.1111765, -3.146308, 1, 1, 1, 1, 1,
-0.6676943, 0.679881, -0.8486204, 1, 1, 1, 1, 1,
-0.6647208, 0.5932304, 0.4156187, 1, 1, 1, 1, 1,
-0.6630124, -0.3197262, -4.360188, 1, 1, 1, 1, 1,
-0.6625068, -1.986247, -1.918075, 0, 0, 1, 1, 1,
-0.6602805, -0.3085962, -1.342683, 1, 0, 0, 1, 1,
-0.6573228, 0.6562464, -0.470091, 1, 0, 0, 1, 1,
-0.6570653, 0.5111064, 0.9296784, 1, 0, 0, 1, 1,
-0.6568965, 1.791021, 0.1513037, 1, 0, 0, 1, 1,
-0.6517856, 0.4707055, -4.109338, 1, 0, 0, 1, 1,
-0.6508909, 1.169619, 0.1163224, 0, 0, 0, 1, 1,
-0.6370583, -0.8525861, -2.11866, 0, 0, 0, 1, 1,
-0.635441, 0.5291154, -1.701006, 0, 0, 0, 1, 1,
-0.6352624, -0.1631202, -3.222623, 0, 0, 0, 1, 1,
-0.6341801, -0.5525024, -4.115366, 0, 0, 0, 1, 1,
-0.6333776, 2.01368, -1.465425, 0, 0, 0, 1, 1,
-0.6327351, -1.085646, -2.600497, 0, 0, 0, 1, 1,
-0.6315492, -0.042495, 0.5266693, 1, 1, 1, 1, 1,
-0.6195393, 0.4835862, -0.3749769, 1, 1, 1, 1, 1,
-0.6155147, -0.783299, -2.626675, 1, 1, 1, 1, 1,
-0.6043252, -0.666557, -3.614338, 1, 1, 1, 1, 1,
-0.6039948, -0.621877, 0.6891195, 1, 1, 1, 1, 1,
-0.6018831, 0.9647993, -0.8911037, 1, 1, 1, 1, 1,
-0.5955147, 1.179174, -1.064505, 1, 1, 1, 1, 1,
-0.5901155, 0.02583427, -1.744813, 1, 1, 1, 1, 1,
-0.5837976, -0.5927509, -3.02855, 1, 1, 1, 1, 1,
-0.5836676, 1.73898, -1.167193, 1, 1, 1, 1, 1,
-0.5806056, 0.7104146, -0.5691413, 1, 1, 1, 1, 1,
-0.5785422, 0.08472607, -1.910005, 1, 1, 1, 1, 1,
-0.5783063, -0.4828526, -2.496452, 1, 1, 1, 1, 1,
-0.575816, -0.8786125, -2.882686, 1, 1, 1, 1, 1,
-0.5740641, 0.421512, -1.601433, 1, 1, 1, 1, 1,
-0.5730008, -0.810401, -3.36112, 0, 0, 1, 1, 1,
-0.5656565, -1.395017, -4.212692, 1, 0, 0, 1, 1,
-0.5648553, 0.4763128, 0.02689185, 1, 0, 0, 1, 1,
-0.5625617, -0.2714429, -2.380476, 1, 0, 0, 1, 1,
-0.5610256, -1.902244, -4.554954, 1, 0, 0, 1, 1,
-0.5543689, 1.454428, 0.5081152, 1, 0, 0, 1, 1,
-0.5499973, -0.210482, -1.521754, 0, 0, 0, 1, 1,
-0.5471157, -0.7864347, -2.31922, 0, 0, 0, 1, 1,
-0.5469025, 0.2935929, -1.294105, 0, 0, 0, 1, 1,
-0.5408769, -0.5473138, -2.552975, 0, 0, 0, 1, 1,
-0.5404281, 0.08659182, -1.301721, 0, 0, 0, 1, 1,
-0.5400538, -0.2071442, -0.7305718, 0, 0, 0, 1, 1,
-0.5385547, 1.089787, -0.03063506, 0, 0, 0, 1, 1,
-0.5380257, -1.276006, -3.80848, 1, 1, 1, 1, 1,
-0.5378293, -1.228545, -2.70382, 1, 1, 1, 1, 1,
-0.5364323, 0.4039122, -0.6253822, 1, 1, 1, 1, 1,
-0.5336081, 0.5072012, 0.0630163, 1, 1, 1, 1, 1,
-0.5331798, -0.5619123, -2.022399, 1, 1, 1, 1, 1,
-0.5325949, -0.4600143, -2.1353, 1, 1, 1, 1, 1,
-0.5314553, -1.994268, -2.722326, 1, 1, 1, 1, 1,
-0.5307387, -0.6437947, -2.978317, 1, 1, 1, 1, 1,
-0.524438, -1.406225, -2.22423, 1, 1, 1, 1, 1,
-0.5211185, -0.04823022, -2.129603, 1, 1, 1, 1, 1,
-0.5149376, 1.535821, 0.5402393, 1, 1, 1, 1, 1,
-0.5145026, 2.262927, -0.6184245, 1, 1, 1, 1, 1,
-0.5052166, 1.648712, -1.290314, 1, 1, 1, 1, 1,
-0.5010342, 1.267439, 0.07805565, 1, 1, 1, 1, 1,
-0.4896078, 0.8353022, 0.08873821, 1, 1, 1, 1, 1,
-0.487469, -0.9365242, -4.896524, 0, 0, 1, 1, 1,
-0.483311, 1.348383, 0.5808802, 1, 0, 0, 1, 1,
-0.4822783, 0.3527039, -2.487729, 1, 0, 0, 1, 1,
-0.4765248, 0.2228341, -3.358516, 1, 0, 0, 1, 1,
-0.4706035, -0.5065263, -2.69185, 1, 0, 0, 1, 1,
-0.4693398, -0.999335, -1.694957, 1, 0, 0, 1, 1,
-0.4661116, -0.2054415, -2.021653, 0, 0, 0, 1, 1,
-0.4659362, -0.4974677, -3.792621, 0, 0, 0, 1, 1,
-0.4649365, -0.4233535, -0.4456179, 0, 0, 0, 1, 1,
-0.4635358, -1.229795, -1.198976, 0, 0, 0, 1, 1,
-0.4520176, 1.404747, -0.9687659, 0, 0, 0, 1, 1,
-0.4490631, -0.5116494, -2.21529, 0, 0, 0, 1, 1,
-0.4454098, -0.4916335, -1.63097, 0, 0, 0, 1, 1,
-0.4449885, -0.1085308, -0.223657, 1, 1, 1, 1, 1,
-0.4439596, 0.5436507, -0.2302583, 1, 1, 1, 1, 1,
-0.4392742, -0.3174758, -2.001972, 1, 1, 1, 1, 1,
-0.4385225, 0.2541039, -1.935578, 1, 1, 1, 1, 1,
-0.4375528, -0.4486131, -2.281757, 1, 1, 1, 1, 1,
-0.4324416, -1.336804, -3.50584, 1, 1, 1, 1, 1,
-0.4266019, 0.3183332, -1.237315, 1, 1, 1, 1, 1,
-0.4238703, 0.9080222, -0.9786473, 1, 1, 1, 1, 1,
-0.4076874, 1.25997, -0.4414223, 1, 1, 1, 1, 1,
-0.4060206, 2.223947, -1.307346, 1, 1, 1, 1, 1,
-0.4039116, -1.150462, 0.1667549, 1, 1, 1, 1, 1,
-0.4037876, 0.1247072, -0.2708806, 1, 1, 1, 1, 1,
-0.4032022, 0.8319941, -1.174192, 1, 1, 1, 1, 1,
-0.4030261, 1.932396, 0.293602, 1, 1, 1, 1, 1,
-0.4019023, 1.183192, -0.3360937, 1, 1, 1, 1, 1,
-0.4004012, -1.082025, -1.457018, 0, 0, 1, 1, 1,
-0.3987944, -0.25981, -3.248386, 1, 0, 0, 1, 1,
-0.3933606, 0.1937307, -1.733068, 1, 0, 0, 1, 1,
-0.3930601, -1.475913, -4.447295, 1, 0, 0, 1, 1,
-0.3909311, 0.7400007, -1.171118, 1, 0, 0, 1, 1,
-0.3821584, -1.243466, -2.993711, 1, 0, 0, 1, 1,
-0.3809153, -0.7706903, -3.030199, 0, 0, 0, 1, 1,
-0.3798104, -0.8805696, -1.976373, 0, 0, 0, 1, 1,
-0.3765607, 1.283687, 0.170073, 0, 0, 0, 1, 1,
-0.3695677, -0.6189382, -2.607352, 0, 0, 0, 1, 1,
-0.3632306, -0.4256146, -2.75563, 0, 0, 0, 1, 1,
-0.35853, -0.9759067, -3.475676, 0, 0, 0, 1, 1,
-0.3580594, 0.3433507, 0.01062622, 0, 0, 0, 1, 1,
-0.3520533, 0.7720784, 1.894742, 1, 1, 1, 1, 1,
-0.3511098, 1.350867, 0.5474792, 1, 1, 1, 1, 1,
-0.3450297, -1.041587, -2.401498, 1, 1, 1, 1, 1,
-0.3440209, 0.2547907, 0.02696768, 1, 1, 1, 1, 1,
-0.342207, 0.08314873, -1.297149, 1, 1, 1, 1, 1,
-0.3409417, -0.6660964, -3.311682, 1, 1, 1, 1, 1,
-0.3400461, 0.4826863, -0.838603, 1, 1, 1, 1, 1,
-0.3371808, 0.01473694, -2.484124, 1, 1, 1, 1, 1,
-0.3329493, -0.7247406, -4.230005, 1, 1, 1, 1, 1,
-0.3230061, 0.2859713, 0.9496009, 1, 1, 1, 1, 1,
-0.3171999, -2.282084, -3.017469, 1, 1, 1, 1, 1,
-0.317053, 0.6133654, 0.5636085, 1, 1, 1, 1, 1,
-0.3167182, -0.1313968, -1.652634, 1, 1, 1, 1, 1,
-0.3036662, 1.215842, 0.4370492, 1, 1, 1, 1, 1,
-0.3036607, -0.795976, -2.063975, 1, 1, 1, 1, 1,
-0.3033732, 0.8257779, -2.197468, 0, 0, 1, 1, 1,
-0.3010187, -0.6003657, -3.172254, 1, 0, 0, 1, 1,
-0.2992514, -1.225223, -3.96683, 1, 0, 0, 1, 1,
-0.2982963, -1.730973, -1.673348, 1, 0, 0, 1, 1,
-0.2958092, -0.2848894, -1.648289, 1, 0, 0, 1, 1,
-0.295716, 0.0394422, -0.840361, 1, 0, 0, 1, 1,
-0.2955914, -1.741145, -5.804911, 0, 0, 0, 1, 1,
-0.2942436, 2.061212, 0.2449922, 0, 0, 0, 1, 1,
-0.2935707, 0.6376055, -1.006982, 0, 0, 0, 1, 1,
-0.2921604, 0.7579379, -0.5640297, 0, 0, 0, 1, 1,
-0.291203, -0.09648837, -1.349711, 0, 0, 0, 1, 1,
-0.2866504, 0.1259431, 0.2277629, 0, 0, 0, 1, 1,
-0.2813966, -0.13317, -1.784177, 0, 0, 0, 1, 1,
-0.279093, 0.1632442, -0.1573075, 1, 1, 1, 1, 1,
-0.2775073, -1.610385, -2.634433, 1, 1, 1, 1, 1,
-0.2722862, -0.1301242, -1.29303, 1, 1, 1, 1, 1,
-0.2704826, 1.759175, 1.133069, 1, 1, 1, 1, 1,
-0.2652259, 1.033336, 0.2542625, 1, 1, 1, 1, 1,
-0.2604938, 0.7063433, -1.9847, 1, 1, 1, 1, 1,
-0.2601951, 0.09098183, -1.471511, 1, 1, 1, 1, 1,
-0.2582242, -0.227447, -0.6448929, 1, 1, 1, 1, 1,
-0.2548423, -0.8311535, -3.559423, 1, 1, 1, 1, 1,
-0.2542456, -1.371311, -2.597598, 1, 1, 1, 1, 1,
-0.249402, 0.06347307, 0.3931895, 1, 1, 1, 1, 1,
-0.248617, 1.365469, 0.4869694, 1, 1, 1, 1, 1,
-0.2486084, 0.7977083, -1.115959, 1, 1, 1, 1, 1,
-0.2412073, -0.1706252, -1.399253, 1, 1, 1, 1, 1,
-0.2370642, -0.3321391, -3.510151, 1, 1, 1, 1, 1,
-0.2346099, 1.035559, -1.245305, 0, 0, 1, 1, 1,
-0.2345176, -0.06806725, -1.724173, 1, 0, 0, 1, 1,
-0.2326573, -1.802534, -2.956328, 1, 0, 0, 1, 1,
-0.2306015, 0.1546741, -1.992133, 1, 0, 0, 1, 1,
-0.2279876, 0.9021211, 1.166316, 1, 0, 0, 1, 1,
-0.2260213, 0.9159141, 0.1873496, 1, 0, 0, 1, 1,
-0.2231225, 0.3734832, 0.7758868, 0, 0, 0, 1, 1,
-0.2230302, -1.740476, -4.973117, 0, 0, 0, 1, 1,
-0.2229551, 0.2056402, -1.388087, 0, 0, 0, 1, 1,
-0.2227322, 1.529523, -1.95947, 0, 0, 0, 1, 1,
-0.2226886, -0.7565945, -4.670846, 0, 0, 0, 1, 1,
-0.2202132, -0.2533297, -2.318803, 0, 0, 0, 1, 1,
-0.2189602, 0.1076737, 0.1245032, 0, 0, 0, 1, 1,
-0.2177325, -0.2305433, -2.673948, 1, 1, 1, 1, 1,
-0.2143816, 1.325969, -2.113506, 1, 1, 1, 1, 1,
-0.210024, 0.08244026, -0.9113432, 1, 1, 1, 1, 1,
-0.2100019, 0.2428627, -1.75829, 1, 1, 1, 1, 1,
-0.2073908, -0.03478651, -2.281503, 1, 1, 1, 1, 1,
-0.203037, -0.6666707, -0.3674512, 1, 1, 1, 1, 1,
-0.2024042, -0.5444323, -2.267847, 1, 1, 1, 1, 1,
-0.1998053, -0.1113208, 0.4011675, 1, 1, 1, 1, 1,
-0.1971599, -1.430456, -4.060037, 1, 1, 1, 1, 1,
-0.19413, 1.739859, 1.347011, 1, 1, 1, 1, 1,
-0.1881684, 1.157891, -0.3807949, 1, 1, 1, 1, 1,
-0.1868764, -1.531076, -3.420692, 1, 1, 1, 1, 1,
-0.1856204, -2.74716, -2.34056, 1, 1, 1, 1, 1,
-0.1792632, -0.003429816, -1.783018, 1, 1, 1, 1, 1,
-0.1781001, -0.7796396, -2.739728, 1, 1, 1, 1, 1,
-0.1736724, 1.681248, -0.158228, 0, 0, 1, 1, 1,
-0.1656819, 1.013732, 0.3289956, 1, 0, 0, 1, 1,
-0.1650884, -0.842869, -1.134128, 1, 0, 0, 1, 1,
-0.1637581, -0.418208, -3.690387, 1, 0, 0, 1, 1,
-0.1637007, -2.234433, -3.467242, 1, 0, 0, 1, 1,
-0.163373, -0.3406287, -3.540053, 1, 0, 0, 1, 1,
-0.1573921, 0.02322591, 0.1830366, 0, 0, 0, 1, 1,
-0.157261, 0.9223611, -0.7132097, 0, 0, 0, 1, 1,
-0.1560059, 0.9574803, -0.7794993, 0, 0, 0, 1, 1,
-0.1534039, 0.09518537, -0.9544206, 0, 0, 0, 1, 1,
-0.1525789, 1.735163, 1.285768, 0, 0, 0, 1, 1,
-0.1472131, -1.916162, -4.285883, 0, 0, 0, 1, 1,
-0.146043, 0.1385571, -0.9829199, 0, 0, 0, 1, 1,
-0.1438156, -0.503807, -3.787651, 1, 1, 1, 1, 1,
-0.1414153, 0.1154516, -1.23194, 1, 1, 1, 1, 1,
-0.1378482, -0.9075739, -3.434909, 1, 1, 1, 1, 1,
-0.1290654, -1.872227, -2.886207, 1, 1, 1, 1, 1,
-0.1266729, -1.344281, -4.784426, 1, 1, 1, 1, 1,
-0.126014, -2.143276, -3.130589, 1, 1, 1, 1, 1,
-0.1242232, 1.376382, -1.766595, 1, 1, 1, 1, 1,
-0.1230569, 0.2109398, -1.630785, 1, 1, 1, 1, 1,
-0.1218621, 0.7193221, 0.4551529, 1, 1, 1, 1, 1,
-0.1202534, -2.267413, -3.844463, 1, 1, 1, 1, 1,
-0.1150831, 1.282007, -0.4741628, 1, 1, 1, 1, 1,
-0.1149091, -2.547067, -2.490068, 1, 1, 1, 1, 1,
-0.1147682, 0.6100556, 0.6226298, 1, 1, 1, 1, 1,
-0.1117973, 0.6769167, 0.6910734, 1, 1, 1, 1, 1,
-0.1114387, -1.003303, -3.959526, 1, 1, 1, 1, 1,
-0.1071819, 1.539276, 1.005587, 0, 0, 1, 1, 1,
-0.102263, -2.460816, -4.827742, 1, 0, 0, 1, 1,
-0.1014239, -1.201655, -3.073242, 1, 0, 0, 1, 1,
-0.1000853, 0.9062947, 0.1708638, 1, 0, 0, 1, 1,
-0.09952098, 0.07357007, -0.7191032, 1, 0, 0, 1, 1,
-0.09440168, 0.1652963, 0.8628727, 1, 0, 0, 1, 1,
-0.09353321, -0.1463618, -1.124533, 0, 0, 0, 1, 1,
-0.09330333, -0.6574572, -2.770665, 0, 0, 0, 1, 1,
-0.0894514, -2.339957, -2.596262, 0, 0, 0, 1, 1,
-0.08798796, 0.5499043, 1.80736, 0, 0, 0, 1, 1,
-0.0867759, 1.272778, -0.06162961, 0, 0, 0, 1, 1,
-0.08620032, 0.7611343, -0.7135844, 0, 0, 0, 1, 1,
-0.08417719, -0.04314125, -2.165709, 0, 0, 0, 1, 1,
-0.08413746, 0.410116, 0.0136346, 1, 1, 1, 1, 1,
-0.08329964, 0.208543, 0.8646779, 1, 1, 1, 1, 1,
-0.08048846, -1.141134, -4.365859, 1, 1, 1, 1, 1,
-0.0784984, 0.5331525, -2.815197, 1, 1, 1, 1, 1,
-0.07712122, -0.1324738, -1.802102, 1, 1, 1, 1, 1,
-0.07027623, -0.7630098, -3.377913, 1, 1, 1, 1, 1,
-0.06741742, 2.458763, 1.53428, 1, 1, 1, 1, 1,
-0.06467251, -0.9039651, -3.122524, 1, 1, 1, 1, 1,
-0.06249071, 0.1755179, 1.084029, 1, 1, 1, 1, 1,
-0.0594127, -0.1376394, -1.852152, 1, 1, 1, 1, 1,
-0.05918195, -0.7021924, -2.94238, 1, 1, 1, 1, 1,
-0.05622606, -1.063389, -3.003242, 1, 1, 1, 1, 1,
-0.05465065, -0.002737165, -1.771084, 1, 1, 1, 1, 1,
-0.05264052, 0.739605, 0.1472496, 1, 1, 1, 1, 1,
-0.04967284, 0.9322977, 0.6163027, 1, 1, 1, 1, 1,
-0.04558104, 0.7244006, 0.146846, 0, 0, 1, 1, 1,
-0.04460986, -1.958706, -1.144388, 1, 0, 0, 1, 1,
-0.04086919, -1.701219, -3.581587, 1, 0, 0, 1, 1,
-0.0371544, 0.7296661, -1.689852, 1, 0, 0, 1, 1,
-0.03692348, -1.155015, -3.069875, 1, 0, 0, 1, 1,
-0.03516734, 0.8813701, 0.4867946, 1, 0, 0, 1, 1,
-0.03436527, -0.1858175, -4.076045, 0, 0, 0, 1, 1,
-0.03184742, -0.6915631, -2.367576, 0, 0, 0, 1, 1,
-0.02986029, 0.2193749, -0.5369526, 0, 0, 0, 1, 1,
-0.02950058, -1.694497, -0.9295651, 0, 0, 0, 1, 1,
-0.02890954, -0.6401093, -3.302434, 0, 0, 0, 1, 1,
-0.02875442, 0.2888483, -0.6599346, 0, 0, 0, 1, 1,
-0.02507847, 0.850517, 0.9961703, 0, 0, 0, 1, 1,
-0.01612902, 0.08355418, -0.05773418, 1, 1, 1, 1, 1,
-0.01560143, 0.2624071, 1.203958, 1, 1, 1, 1, 1,
-0.01462361, -0.27201, -0.8356271, 1, 1, 1, 1, 1,
-0.007742245, -0.5654999, -1.816803, 1, 1, 1, 1, 1,
-0.0004852001, -0.3365994, -3.360779, 1, 1, 1, 1, 1,
-0.0004032024, 1.114582, 1.686862, 1, 1, 1, 1, 1,
0.0008689726, 0.8229113, 0.514775, 1, 1, 1, 1, 1,
0.009014549, -0.8931563, 4.845976, 1, 1, 1, 1, 1,
0.009086257, 2.027266, -0.9886872, 1, 1, 1, 1, 1,
0.01126278, 3.412202, -1.559955, 1, 1, 1, 1, 1,
0.01240085, -1.40898, 2.956484, 1, 1, 1, 1, 1,
0.01343724, 0.7134312, 1.287402, 1, 1, 1, 1, 1,
0.0142948, -1.089451, 1.345636, 1, 1, 1, 1, 1,
0.01798469, 0.1064557, 0.1517124, 1, 1, 1, 1, 1,
0.0321773, -0.5706227, 3.032661, 1, 1, 1, 1, 1,
0.03423179, 0.1752094, 1.66608, 0, 0, 1, 1, 1,
0.0360702, -0.6724905, 0.9759266, 1, 0, 0, 1, 1,
0.03653874, 1.058032, 0.1683065, 1, 0, 0, 1, 1,
0.03945689, 0.819006, 2.074342, 1, 0, 0, 1, 1,
0.04292969, -1.045663, 3.187196, 1, 0, 0, 1, 1,
0.04612633, 0.1134432, 0.951398, 1, 0, 0, 1, 1,
0.05034036, -0.999859, 2.725249, 0, 0, 0, 1, 1,
0.05703269, -0.388531, 2.660049, 0, 0, 0, 1, 1,
0.05853722, -1.418063, 2.837054, 0, 0, 0, 1, 1,
0.06007442, -0.7428045, 3.440672, 0, 0, 0, 1, 1,
0.06333254, -0.8613306, 2.860596, 0, 0, 0, 1, 1,
0.06370699, -0.9802269, 4.092681, 0, 0, 0, 1, 1,
0.06394418, 0.7554474, -0.1327808, 0, 0, 0, 1, 1,
0.06488418, -0.6613065, 1.892817, 1, 1, 1, 1, 1,
0.06538139, -0.9271544, 3.000968, 1, 1, 1, 1, 1,
0.0665639, -0.5423002, 3.016118, 1, 1, 1, 1, 1,
0.07085811, 0.05545707, 0.1600418, 1, 1, 1, 1, 1,
0.07381564, 0.9665887, 1.484623, 1, 1, 1, 1, 1,
0.07548572, -0.6242381, 2.580355, 1, 1, 1, 1, 1,
0.07555173, -0.8244757, 2.868377, 1, 1, 1, 1, 1,
0.08101676, -0.6059363, 3.641816, 1, 1, 1, 1, 1,
0.08696768, -1.760662, 3.472313, 1, 1, 1, 1, 1,
0.08996024, -1.1343, 2.54133, 1, 1, 1, 1, 1,
0.0957417, -0.5716209, 3.955245, 1, 1, 1, 1, 1,
0.09587674, -0.8643577, 3.051316, 1, 1, 1, 1, 1,
0.1035834, 0.4520798, 1.000172, 1, 1, 1, 1, 1,
0.1049407, 0.1054981, 0.3662065, 1, 1, 1, 1, 1,
0.1051955, 0.6705089, 0.5974891, 1, 1, 1, 1, 1,
0.1081844, -0.4643564, 4.009802, 0, 0, 1, 1, 1,
0.1085565, 0.4785213, 0.5098199, 1, 0, 0, 1, 1,
0.1107521, -0.06921144, 2.562144, 1, 0, 0, 1, 1,
0.1158538, 2.764986, -0.092588, 1, 0, 0, 1, 1,
0.118001, -0.5448908, 2.856284, 1, 0, 0, 1, 1,
0.1213983, -0.7978948, 1.50649, 1, 0, 0, 1, 1,
0.1219667, 0.441721, 1.503719, 0, 0, 0, 1, 1,
0.1228402, -0.6481399, 3.4374, 0, 0, 0, 1, 1,
0.1270235, -0.1573551, 2.619299, 0, 0, 0, 1, 1,
0.1294187, 1.446666, 1.630538, 0, 0, 0, 1, 1,
0.1297174, -1.32137, 3.652238, 0, 0, 0, 1, 1,
0.134406, 0.2928785, 0.4524685, 0, 0, 0, 1, 1,
0.1376811, -1.0928, 2.272562, 0, 0, 0, 1, 1,
0.1390459, 1.263182, 1.145949, 1, 1, 1, 1, 1,
0.1400686, -0.4491444, 3.915464, 1, 1, 1, 1, 1,
0.1468425, 0.1706704, 0.8757457, 1, 1, 1, 1, 1,
0.1506428, -1.603856, 3.84179, 1, 1, 1, 1, 1,
0.1511296, 2.349386, 0.02893217, 1, 1, 1, 1, 1,
0.1525475, 0.716445, 0.61132, 1, 1, 1, 1, 1,
0.1563812, 1.420009, -0.5283771, 1, 1, 1, 1, 1,
0.1566038, 0.3354456, 0.2593864, 1, 1, 1, 1, 1,
0.1571732, -1.222188, 2.054011, 1, 1, 1, 1, 1,
0.1583153, -0.2690344, 1.443444, 1, 1, 1, 1, 1,
0.161799, -0.04071642, 1.233334, 1, 1, 1, 1, 1,
0.1663074, 1.539698, 1.63777, 1, 1, 1, 1, 1,
0.1669943, 0.3099693, 0.2736812, 1, 1, 1, 1, 1,
0.1684941, 2.245505, -0.4530151, 1, 1, 1, 1, 1,
0.1694328, 1.764514, 1.761741, 1, 1, 1, 1, 1,
0.170068, 0.9821691, -1.558345, 0, 0, 1, 1, 1,
0.1704531, 0.4390807, 1.701447, 1, 0, 0, 1, 1,
0.1714286, 0.5570745, 0.6553497, 1, 0, 0, 1, 1,
0.17301, 0.6666452, 1.709178, 1, 0, 0, 1, 1,
0.1745998, 0.3671376, 0.01350701, 1, 0, 0, 1, 1,
0.1806073, -0.424687, 1.855099, 1, 0, 0, 1, 1,
0.1852277, -0.9231974, 2.318151, 0, 0, 0, 1, 1,
0.1926908, -0.4587283, 1.875703, 0, 0, 0, 1, 1,
0.1929227, -0.3890644, 3.64113, 0, 0, 0, 1, 1,
0.195567, -0.8271158, 3.975866, 0, 0, 0, 1, 1,
0.1987513, -0.05538457, 2.298669, 0, 0, 0, 1, 1,
0.2003735, 1.000492, -0.595367, 0, 0, 0, 1, 1,
0.2049467, 1.116002, 1.175844, 0, 0, 0, 1, 1,
0.2065057, -0.6180804, 1.955937, 1, 1, 1, 1, 1,
0.2067687, -2.801784, 3.263907, 1, 1, 1, 1, 1,
0.2152429, -0.6767304, 2.565079, 1, 1, 1, 1, 1,
0.2159697, -0.02027628, -0.6096191, 1, 1, 1, 1, 1,
0.2195252, -0.1462535, 1.421978, 1, 1, 1, 1, 1,
0.2196647, -0.9752173, 3.854735, 1, 1, 1, 1, 1,
0.2199458, 0.150768, 0.5713379, 1, 1, 1, 1, 1,
0.2205581, -1.162306, 3.089612, 1, 1, 1, 1, 1,
0.2263312, 1.010483, 0.321466, 1, 1, 1, 1, 1,
0.2325654, -0.7172117, 3.245021, 1, 1, 1, 1, 1,
0.233922, 1.730665, 0.2814451, 1, 1, 1, 1, 1,
0.2341307, -0.08243585, 1.673013, 1, 1, 1, 1, 1,
0.2352089, 0.1287739, 0.09439665, 1, 1, 1, 1, 1,
0.2374752, -1.615526, 1.436073, 1, 1, 1, 1, 1,
0.2376219, -2.293665, 3.942693, 1, 1, 1, 1, 1,
0.2415496, -1.759303, 4.135302, 0, 0, 1, 1, 1,
0.2422305, 0.03485127, 1.852051, 1, 0, 0, 1, 1,
0.2445147, -0.3955706, 1.38813, 1, 0, 0, 1, 1,
0.246911, 1.369522, -0.4679368, 1, 0, 0, 1, 1,
0.2497913, -0.0986347, 2.004319, 1, 0, 0, 1, 1,
0.2514524, -0.08612326, 1.702936, 1, 0, 0, 1, 1,
0.254689, 0.2517091, 0.1723127, 0, 0, 0, 1, 1,
0.2547006, 0.1457975, 0.6358137, 0, 0, 0, 1, 1,
0.2578704, 2.882094, -1.497563, 0, 0, 0, 1, 1,
0.2610929, -0.8962469, 0.4076216, 0, 0, 0, 1, 1,
0.2618851, 0.5396596, 0.4551072, 0, 0, 0, 1, 1,
0.2647476, 0.3610709, -1.458328, 0, 0, 0, 1, 1,
0.2650472, -0.05026503, 1.373379, 0, 0, 0, 1, 1,
0.273344, -0.1340812, 2.520899, 1, 1, 1, 1, 1,
0.2763239, -0.9798859, 1.654955, 1, 1, 1, 1, 1,
0.2820223, -0.6630721, 2.544976, 1, 1, 1, 1, 1,
0.2852392, 0.159117, 1.769309, 1, 1, 1, 1, 1,
0.2906058, -0.1564627, 3.58589, 1, 1, 1, 1, 1,
0.294592, 3.758001, 0.1071458, 1, 1, 1, 1, 1,
0.2983695, 1.96974, -1.468301, 1, 1, 1, 1, 1,
0.3021412, -0.04619695, 4.28429, 1, 1, 1, 1, 1,
0.3038425, 0.456654, 0.009126324, 1, 1, 1, 1, 1,
0.3066837, 0.9521832, 0.5919867, 1, 1, 1, 1, 1,
0.3148073, -0.3757496, 3.859805, 1, 1, 1, 1, 1,
0.3150991, -0.5774657, 0.8417933, 1, 1, 1, 1, 1,
0.3188433, 0.4700706, 0.4948046, 1, 1, 1, 1, 1,
0.3192767, 2.551486, -0.9024327, 1, 1, 1, 1, 1,
0.3201063, -0.1368401, 1.624968, 1, 1, 1, 1, 1,
0.3206997, 0.7954849, 1.203992, 0, 0, 1, 1, 1,
0.323987, -1.323379, 2.708582, 1, 0, 0, 1, 1,
0.3304313, 0.5128798, 0.05931942, 1, 0, 0, 1, 1,
0.3355745, 0.4654328, 1.089626, 1, 0, 0, 1, 1,
0.3369378, -0.4768204, 2.262847, 1, 0, 0, 1, 1,
0.3505051, -0.04361537, 2.412247, 1, 0, 0, 1, 1,
0.354765, -0.2623289, 0.858059, 0, 0, 0, 1, 1,
0.3592661, 0.853958, -0.9591155, 0, 0, 0, 1, 1,
0.360923, -0.4010781, 0.105474, 0, 0, 0, 1, 1,
0.3658899, 1.841412, 0.9048101, 0, 0, 0, 1, 1,
0.3703724, 0.07467708, 0.9358264, 0, 0, 0, 1, 1,
0.3782057, -0.5648493, 3.419799, 0, 0, 0, 1, 1,
0.380528, 1.23615, 1.9619, 0, 0, 0, 1, 1,
0.3808037, 0.07251554, 0.2095883, 1, 1, 1, 1, 1,
0.3817319, 3.271399, 1.080939, 1, 1, 1, 1, 1,
0.384269, -1.644354, 3.331879, 1, 1, 1, 1, 1,
0.3918138, -0.7312667, 3.408627, 1, 1, 1, 1, 1,
0.4031437, 1.853541, -0.7669454, 1, 1, 1, 1, 1,
0.4044675, -0.4355687, 0.6353898, 1, 1, 1, 1, 1,
0.4048789, -0.6994426, 1.580346, 1, 1, 1, 1, 1,
0.4088777, -1.33625, 2.25257, 1, 1, 1, 1, 1,
0.4090449, -0.6643008, 2.779207, 1, 1, 1, 1, 1,
0.4090612, -1.381447, 3.969768, 1, 1, 1, 1, 1,
0.411011, 0.9530618, 0.2214572, 1, 1, 1, 1, 1,
0.413609, -0.1572773, 0.294116, 1, 1, 1, 1, 1,
0.4137826, 0.3026814, 0.1746972, 1, 1, 1, 1, 1,
0.41423, -1.666844, 4.249968, 1, 1, 1, 1, 1,
0.4168998, -0.6406943, 1.513128, 1, 1, 1, 1, 1,
0.4201048, -0.4620246, 1.036872, 0, 0, 1, 1, 1,
0.4212014, -0.8666784, 2.103003, 1, 0, 0, 1, 1,
0.4282177, 1.092849, 2.507572, 1, 0, 0, 1, 1,
0.4332024, 0.1264494, 1.781054, 1, 0, 0, 1, 1,
0.4365134, -1.394443, 2.640961, 1, 0, 0, 1, 1,
0.4442852, 0.4937435, -1.127684, 1, 0, 0, 1, 1,
0.4453873, -0.4230533, 3.235857, 0, 0, 0, 1, 1,
0.4471939, -1.148131, 1.907959, 0, 0, 0, 1, 1,
0.4513255, 0.314276, 0.5576056, 0, 0, 0, 1, 1,
0.4524224, -0.2157159, 3.434082, 0, 0, 0, 1, 1,
0.4534118, 0.4101345, 0.659544, 0, 0, 0, 1, 1,
0.4558436, -0.5726279, 2.353626, 0, 0, 0, 1, 1,
0.4561725, 1.308534, 0.8946959, 0, 0, 0, 1, 1,
0.4574337, 0.5248634, 0.6926409, 1, 1, 1, 1, 1,
0.4581539, -0.9526181, 4.226266, 1, 1, 1, 1, 1,
0.4598004, -1.716285, 0.4469305, 1, 1, 1, 1, 1,
0.4652135, -1.427998, 1.910683, 1, 1, 1, 1, 1,
0.465921, -0.2889046, 0.6369621, 1, 1, 1, 1, 1,
0.4659333, 0.3683321, -0.4796645, 1, 1, 1, 1, 1,
0.47103, 0.3081127, 0.9292394, 1, 1, 1, 1, 1,
0.4716395, -2.288341, 3.465863, 1, 1, 1, 1, 1,
0.4750538, -1.007003, 3.262199, 1, 1, 1, 1, 1,
0.4768453, -0.3614973, 1.813886, 1, 1, 1, 1, 1,
0.478226, 1.057949, 0.941344, 1, 1, 1, 1, 1,
0.4836917, 1.002879, 2.609259, 1, 1, 1, 1, 1,
0.4887427, -1.349244, 2.106998, 1, 1, 1, 1, 1,
0.4937396, 0.9838765, 2.052935, 1, 1, 1, 1, 1,
0.4940395, -0.05668588, 0.3314197, 1, 1, 1, 1, 1,
0.4961066, 0.6334504, 2.41785, 0, 0, 1, 1, 1,
0.496603, 0.8325666, -0.5710056, 1, 0, 0, 1, 1,
0.5008581, 0.8607821, 1.630815, 1, 0, 0, 1, 1,
0.5162867, 0.5200955, 1.530989, 1, 0, 0, 1, 1,
0.5223109, -0.6236261, 2.718281, 1, 0, 0, 1, 1,
0.5224902, 0.007313529, 0.5416457, 1, 0, 0, 1, 1,
0.5269182, 0.2549194, 0.7999676, 0, 0, 0, 1, 1,
0.5272161, -1.689635, 2.817007, 0, 0, 0, 1, 1,
0.5312194, 0.01926266, 2.097512, 0, 0, 0, 1, 1,
0.5384139, 0.665899, 0.1581154, 0, 0, 0, 1, 1,
0.5412994, 0.6533646, 2.138844, 0, 0, 0, 1, 1,
0.5456437, 1.253482, 0.02312935, 0, 0, 0, 1, 1,
0.5464517, -0.1985072, 1.382355, 0, 0, 0, 1, 1,
0.5477786, -0.8723711, 3.298269, 1, 1, 1, 1, 1,
0.5526886, -0.7469316, 2.065999, 1, 1, 1, 1, 1,
0.5620811, 0.4618713, 0.2302639, 1, 1, 1, 1, 1,
0.5671526, -0.9285082, 1.182367, 1, 1, 1, 1, 1,
0.570857, -0.9471642, 2.500813, 1, 1, 1, 1, 1,
0.5714749, -0.8884888, 1.439134, 1, 1, 1, 1, 1,
0.5715818, 0.1811585, 0.6908626, 1, 1, 1, 1, 1,
0.5718451, 0.05103511, 1.296343, 1, 1, 1, 1, 1,
0.574063, 0.2488577, 1.613249, 1, 1, 1, 1, 1,
0.5745437, -0.6289321, 1.150283, 1, 1, 1, 1, 1,
0.5745679, 1.111073, 0.859797, 1, 1, 1, 1, 1,
0.5775094, 0.3063432, 1.520317, 1, 1, 1, 1, 1,
0.5803778, -1.623082, 4.63523, 1, 1, 1, 1, 1,
0.5820098, 1.479799, 1.45276, 1, 1, 1, 1, 1,
0.5825439, 0.9823613, -0.03326695, 1, 1, 1, 1, 1,
0.5892881, 0.4337792, 0.4261958, 0, 0, 1, 1, 1,
0.5920796, 1.493585, 0.6605492, 1, 0, 0, 1, 1,
0.5929353, -1.191568, 3.1291, 1, 0, 0, 1, 1,
0.5931856, -0.7083414, 2.864152, 1, 0, 0, 1, 1,
0.5972831, -0.6595537, 1.099694, 1, 0, 0, 1, 1,
0.5992117, 0.6608582, 2.260987, 1, 0, 0, 1, 1,
0.6029464, -0.3419048, 1.763795, 0, 0, 0, 1, 1,
0.6069919, 0.1297117, 1.694515, 0, 0, 0, 1, 1,
0.6073487, 1.208431, 0.7537029, 0, 0, 0, 1, 1,
0.60967, 0.3862127, 0.4125429, 0, 0, 0, 1, 1,
0.6129882, -0.8580955, 2.983294, 0, 0, 0, 1, 1,
0.6139894, 0.5600237, 1.538824, 0, 0, 0, 1, 1,
0.6147571, -0.8214254, 3.081913, 0, 0, 0, 1, 1,
0.617154, -0.6625229, 2.196686, 1, 1, 1, 1, 1,
0.6265689, -0.7635171, 3.351019, 1, 1, 1, 1, 1,
0.6290011, -0.4379427, 1.976254, 1, 1, 1, 1, 1,
0.6306926, 0.5999507, 1.240696, 1, 1, 1, 1, 1,
0.6330763, -0.03183743, 1.460337, 1, 1, 1, 1, 1,
0.6346913, 0.0866423, 1.068378, 1, 1, 1, 1, 1,
0.6359678, -0.1084323, 2.530365, 1, 1, 1, 1, 1,
0.6418691, -1.177509, 3.366083, 1, 1, 1, 1, 1,
0.64661, -1.03335, 2.576294, 1, 1, 1, 1, 1,
0.663094, 1.711744, 1.295787, 1, 1, 1, 1, 1,
0.6646535, -0.3952353, 2.358848, 1, 1, 1, 1, 1,
0.6738523, -0.5503586, 2.074438, 1, 1, 1, 1, 1,
0.6783932, -0.7138282, 1.308343, 1, 1, 1, 1, 1,
0.6795602, 1.376683, -0.33807, 1, 1, 1, 1, 1,
0.6818951, 0.2991539, 2.077806, 1, 1, 1, 1, 1,
0.6827158, -0.9789641, 1.512936, 0, 0, 1, 1, 1,
0.68398, -0.5639578, 2.395708, 1, 0, 0, 1, 1,
0.6906091, 2.105314, 0.2912314, 1, 0, 0, 1, 1,
0.6911119, -0.4683378, 3.368023, 1, 0, 0, 1, 1,
0.7007964, -1.801544, 1.414061, 1, 0, 0, 1, 1,
0.7025256, -0.4644181, 2.708297, 1, 0, 0, 1, 1,
0.7047749, 1.803786, 1.437615, 0, 0, 0, 1, 1,
0.7072905, -0.1244422, 2.892267, 0, 0, 0, 1, 1,
0.7085864, -1.64689, 2.242042, 0, 0, 0, 1, 1,
0.7100169, 0.5592204, 2.429726, 0, 0, 0, 1, 1,
0.7117717, -1.706129, 2.256133, 0, 0, 0, 1, 1,
0.7165208, -0.2834602, 3.793047, 0, 0, 0, 1, 1,
0.7263615, -1.622165, 3.031533, 0, 0, 0, 1, 1,
0.727192, -0.07048842, 1.32188, 1, 1, 1, 1, 1,
0.7287332, -1.293981, 3.630503, 1, 1, 1, 1, 1,
0.739522, 1.301509, 1.165227, 1, 1, 1, 1, 1,
0.7465926, 0.1136966, 0.3983696, 1, 1, 1, 1, 1,
0.7481644, 2.549493, 0.9726139, 1, 1, 1, 1, 1,
0.7486435, -0.3626607, 2.378583, 1, 1, 1, 1, 1,
0.7495977, -1.084725, 1.891802, 1, 1, 1, 1, 1,
0.7507031, -0.0396368, 1.812335, 1, 1, 1, 1, 1,
0.750876, 1.184203, -1.481982, 1, 1, 1, 1, 1,
0.7522517, -0.2050804, 1.148473, 1, 1, 1, 1, 1,
0.7616302, -0.03497422, -0.3117913, 1, 1, 1, 1, 1,
0.7646085, -1.885654, 2.669357, 1, 1, 1, 1, 1,
0.7646369, -0.4395779, 2.273769, 1, 1, 1, 1, 1,
0.7671613, -0.4440773, 1.620119, 1, 1, 1, 1, 1,
0.7698101, -1.07148, 0.6545997, 1, 1, 1, 1, 1,
0.7699897, 0.6992574, 1.760427, 0, 0, 1, 1, 1,
0.7782857, -1.286159, 2.816671, 1, 0, 0, 1, 1,
0.7790931, -1.787417, 3.906575, 1, 0, 0, 1, 1,
0.781138, -0.2233667, 1.798241, 1, 0, 0, 1, 1,
0.7849362, -2.080616, 3.210743, 1, 0, 0, 1, 1,
0.7876592, -1.317258, 1.663463, 1, 0, 0, 1, 1,
0.7908399, -0.2854478, 1.818354, 0, 0, 0, 1, 1,
0.7934665, 0.2544649, 1.610009, 0, 0, 0, 1, 1,
0.7938066, 0.8826788, 1.250391, 0, 0, 0, 1, 1,
0.7942578, -1.408205, 0.6189473, 0, 0, 0, 1, 1,
0.7961509, 0.8266464, -1.07114, 0, 0, 0, 1, 1,
0.8054465, -0.4068448, 3.118779, 0, 0, 0, 1, 1,
0.8071471, 1.127304, 1.641511, 0, 0, 0, 1, 1,
0.8091304, 0.8935254, 0.7719399, 1, 1, 1, 1, 1,
0.8103001, 0.419609, 2.438749, 1, 1, 1, 1, 1,
0.8190212, 1.050048, 2.088586, 1, 1, 1, 1, 1,
0.8248985, 0.3487409, 2.485668, 1, 1, 1, 1, 1,
0.8358696, -0.5833909, 1.903886, 1, 1, 1, 1, 1,
0.8386025, 0.9239538, 1.070119, 1, 1, 1, 1, 1,
0.8386495, -1.419328, 1.879452, 1, 1, 1, 1, 1,
0.8394834, -0.4667837, 2.161067, 1, 1, 1, 1, 1,
0.8402618, -0.5987377, 1.635229, 1, 1, 1, 1, 1,
0.8409011, -0.4530098, 1.486469, 1, 1, 1, 1, 1,
0.8712822, 1.388113, 0.8682382, 1, 1, 1, 1, 1,
0.8734484, 1.144008, -0.7127178, 1, 1, 1, 1, 1,
0.8758814, -0.5708363, 3.057868, 1, 1, 1, 1, 1,
0.8774702, 1.237057, 0.3194637, 1, 1, 1, 1, 1,
0.8806318, -0.3820081, 2.505709, 1, 1, 1, 1, 1,
0.8811344, -0.7424373, 1.779735, 0, 0, 1, 1, 1,
0.8845762, 0.2723016, 1.425303, 1, 0, 0, 1, 1,
0.886435, 0.3546393, 1.556156, 1, 0, 0, 1, 1,
0.8878443, 1.404305, 0.5343082, 1, 0, 0, 1, 1,
0.8884882, -0.1051781, 1.6762, 1, 0, 0, 1, 1,
0.8886937, 0.3816521, 2.783895, 1, 0, 0, 1, 1,
0.8906567, 0.3466641, 1.823248, 0, 0, 0, 1, 1,
0.8951998, 1.439845, 0.6509489, 0, 0, 0, 1, 1,
0.8970836, 0.8296216, 0.4499302, 0, 0, 0, 1, 1,
0.901304, -0.2740858, 2.337423, 0, 0, 0, 1, 1,
0.9063068, 0.5032947, 3.035864, 0, 0, 0, 1, 1,
0.9117584, -0.6756759, 1.439386, 0, 0, 0, 1, 1,
0.9134445, 1.255443, -0.3868318, 0, 0, 0, 1, 1,
0.9146472, 0.7740163, 0.3985516, 1, 1, 1, 1, 1,
0.9152806, -0.1885168, 2.485738, 1, 1, 1, 1, 1,
0.9295854, 0.8397788, 0.9476207, 1, 1, 1, 1, 1,
0.9309792, -1.415003, 0.6581193, 1, 1, 1, 1, 1,
0.938359, 0.4729671, -1.094337, 1, 1, 1, 1, 1,
0.9434953, 1.034565, 1.063999, 1, 1, 1, 1, 1,
0.9462718, -1.075871, 1.5224, 1, 1, 1, 1, 1,
0.9472108, -1.318299, 3.396626, 1, 1, 1, 1, 1,
0.9589467, 2.625443, -1.843921, 1, 1, 1, 1, 1,
0.9612665, 2.126636, -0.02490876, 1, 1, 1, 1, 1,
0.964035, -0.5015641, 2.356292, 1, 1, 1, 1, 1,
0.9687954, 0.3988124, 0.2158908, 1, 1, 1, 1, 1,
0.9700444, 0.3792267, 0.3783998, 1, 1, 1, 1, 1,
0.9706063, -2.153003, 2.935215, 1, 1, 1, 1, 1,
0.9747311, 0.9325573, 0.8499575, 1, 1, 1, 1, 1,
0.9831961, -1.552727, 1.840327, 0, 0, 1, 1, 1,
0.9890425, -1.620124, 3.28741, 1, 0, 0, 1, 1,
0.9913356, -0.08381145, 0.08650188, 1, 0, 0, 1, 1,
0.9925697, -0.7868698, 0.2973874, 1, 0, 0, 1, 1,
0.999484, 1.64665, -0.4558426, 1, 0, 0, 1, 1,
0.9995272, 0.4362862, 2.377175, 1, 0, 0, 1, 1,
1.003247, -0.7756363, 0.4883504, 0, 0, 0, 1, 1,
1.006795, 0.05654718, 1.950746, 0, 0, 0, 1, 1,
1.008175, 1.225044, 0.3310744, 0, 0, 0, 1, 1,
1.015784, 0.2634757, 1.254164, 0, 0, 0, 1, 1,
1.019643, -1.899815, 3.382441, 0, 0, 0, 1, 1,
1.024438, -0.4497611, 1.694356, 0, 0, 0, 1, 1,
1.025481, 1.594021, 1.111308, 0, 0, 0, 1, 1,
1.027368, -0.06860355, 2.704867, 1, 1, 1, 1, 1,
1.031864, -0.5842639, 1.248902, 1, 1, 1, 1, 1,
1.039918, -0.08172957, 2.6273, 1, 1, 1, 1, 1,
1.040985, -0.5322044, 4.359808, 1, 1, 1, 1, 1,
1.052122, 0.291768, 2.655803, 1, 1, 1, 1, 1,
1.053953, -1.07461, 2.290139, 1, 1, 1, 1, 1,
1.054984, 0.1208676, 1.281926, 1, 1, 1, 1, 1,
1.057263, 1.041919, 2.621059, 1, 1, 1, 1, 1,
1.058675, 0.3863072, 2.057688, 1, 1, 1, 1, 1,
1.063888, -0.5357826, 1.712245, 1, 1, 1, 1, 1,
1.071183, -0.3613562, 1.96559, 1, 1, 1, 1, 1,
1.080666, -1.126188, 3.823055, 1, 1, 1, 1, 1,
1.09107, 0.8038874, 1.832065, 1, 1, 1, 1, 1,
1.095205, -0.3188938, 2.49551, 1, 1, 1, 1, 1,
1.101153, -0.6264926, 3.546239, 1, 1, 1, 1, 1,
1.11702, -0.2835844, 3.800181, 0, 0, 1, 1, 1,
1.122026, 0.5328175, -0.0946877, 1, 0, 0, 1, 1,
1.123379, -0.1186554, 0.8389088, 1, 0, 0, 1, 1,
1.127325, 0.874337, 0.8865107, 1, 0, 0, 1, 1,
1.128247, -0.07850197, 0.2743126, 1, 0, 0, 1, 1,
1.139784, 0.1545122, 1.004578, 1, 0, 0, 1, 1,
1.143102, -1.564879, 2.456273, 0, 0, 0, 1, 1,
1.143832, -2.19543, 2.679388, 0, 0, 0, 1, 1,
1.148001, -0.5101922, 3.085058, 0, 0, 0, 1, 1,
1.157045, 1.085895, 1.473815, 0, 0, 0, 1, 1,
1.157295, -1.68103, 1.099996, 0, 0, 0, 1, 1,
1.162323, 1.119752, 2.306583, 0, 0, 0, 1, 1,
1.162663, -2.074211, 0.7025791, 0, 0, 0, 1, 1,
1.174689, 0.5358223, 0.2942316, 1, 1, 1, 1, 1,
1.178481, -1.124203, 2.628043, 1, 1, 1, 1, 1,
1.182029, 1.424366, 0.2322643, 1, 1, 1, 1, 1,
1.187667, -0.2866983, 1.596157, 1, 1, 1, 1, 1,
1.189009, 1.573094, 0.5731569, 1, 1, 1, 1, 1,
1.191627, 1.841165, 2.56564, 1, 1, 1, 1, 1,
1.195553, 1.214018, 1.107154, 1, 1, 1, 1, 1,
1.195875, 0.1426678, 2.612596, 1, 1, 1, 1, 1,
1.198077, -1.938863, 2.688498, 1, 1, 1, 1, 1,
1.19952, 1.155415, 1.799468, 1, 1, 1, 1, 1,
1.201382, 0.6994627, -1.075144, 1, 1, 1, 1, 1,
1.214167, -0.4866112, 2.123155, 1, 1, 1, 1, 1,
1.215457, -1.440614, 2.418693, 1, 1, 1, 1, 1,
1.216378, 0.00407397, 0.7228059, 1, 1, 1, 1, 1,
1.218304, -0.6898198, 0.6963292, 1, 1, 1, 1, 1,
1.21897, 0.3045708, 2.462017, 0, 0, 1, 1, 1,
1.224783, -0.9963382, 0.07855001, 1, 0, 0, 1, 1,
1.23091, -0.4046103, 1.589723, 1, 0, 0, 1, 1,
1.243037, 0.2237018, 2.053707, 1, 0, 0, 1, 1,
1.243477, -1.304693, 1.508945, 1, 0, 0, 1, 1,
1.247929, 0.7916303, 0.1751168, 1, 0, 0, 1, 1,
1.250765, 1.213492, -0.4964659, 0, 0, 0, 1, 1,
1.253899, -0.2659476, 1.250156, 0, 0, 0, 1, 1,
1.258895, -0.2942225, 2.296721, 0, 0, 0, 1, 1,
1.262912, 0.06958093, 2.826809, 0, 0, 0, 1, 1,
1.265368, 1.083828, 0.1692231, 0, 0, 0, 1, 1,
1.267329, -0.9769855, 2.410053, 0, 0, 0, 1, 1,
1.275264, -0.1938251, 2.084326, 0, 0, 0, 1, 1,
1.289111, 0.2858423, 1.328639, 1, 1, 1, 1, 1,
1.2895, -0.6910574, 1.544621, 1, 1, 1, 1, 1,
1.305929, 0.6255778, 1.647254, 1, 1, 1, 1, 1,
1.307694, 0.6124521, 2.728089, 1, 1, 1, 1, 1,
1.310991, 0.4990889, 1.445227, 1, 1, 1, 1, 1,
1.315271, -1.179649, 1.678015, 1, 1, 1, 1, 1,
1.316668, 0.2852519, 2.029091, 1, 1, 1, 1, 1,
1.316747, 0.5728284, 1.462034, 1, 1, 1, 1, 1,
1.325058, 0.3087533, 1.424554, 1, 1, 1, 1, 1,
1.325898, -1.753775, 1.153659, 1, 1, 1, 1, 1,
1.325996, -1.026456, 4.700212, 1, 1, 1, 1, 1,
1.326348, -1.715629, 2.377339, 1, 1, 1, 1, 1,
1.328715, 0.7011356, 1.158901, 1, 1, 1, 1, 1,
1.338064, -1.421699, 1.977756, 1, 1, 1, 1, 1,
1.339992, -0.7314907, 1.191369, 1, 1, 1, 1, 1,
1.342949, 1.247282, 0.9900907, 0, 0, 1, 1, 1,
1.349035, 1.52294, 0.9679987, 1, 0, 0, 1, 1,
1.35394, -0.594642, 0.4966037, 1, 0, 0, 1, 1,
1.354593, -0.03851851, 2.4357, 1, 0, 0, 1, 1,
1.357063, 1.241776, 0.8221776, 1, 0, 0, 1, 1,
1.357239, 0.3320318, 1.898657, 1, 0, 0, 1, 1,
1.364112, -0.2509845, 0.8574919, 0, 0, 0, 1, 1,
1.368881, -1.429756, -0.1699806, 0, 0, 0, 1, 1,
1.375046, 0.2193804, 2.145134, 0, 0, 0, 1, 1,
1.382913, -0.2395247, 1.596216, 0, 0, 0, 1, 1,
1.386721, -0.3824803, 1.215671, 0, 0, 0, 1, 1,
1.388053, 1.067137, 0.9977334, 0, 0, 0, 1, 1,
1.392713, -1.51755, 2.430714, 0, 0, 0, 1, 1,
1.393112, 1.15777, 0.5513515, 1, 1, 1, 1, 1,
1.397138, 0.647904, -0.5627629, 1, 1, 1, 1, 1,
1.401174, 0.4903193, 1.875773, 1, 1, 1, 1, 1,
1.401345, 1.136023, 0.1670442, 1, 1, 1, 1, 1,
1.443215, -0.372649, 2.490342, 1, 1, 1, 1, 1,
1.44337, 1.194809, 0.2411993, 1, 1, 1, 1, 1,
1.450017, -0.4963387, 2.467813, 1, 1, 1, 1, 1,
1.455811, -1.45138, 1.582801, 1, 1, 1, 1, 1,
1.456433, 2.168696, -0.04163653, 1, 1, 1, 1, 1,
1.458359, -0.1609141, 0.1543745, 1, 1, 1, 1, 1,
1.473285, 0.3397083, 1.329923, 1, 1, 1, 1, 1,
1.473376, -1.143809, 0.7351326, 1, 1, 1, 1, 1,
1.480677, -1.192037, 3.502293, 1, 1, 1, 1, 1,
1.499454, 0.07846102, 0.3360048, 1, 1, 1, 1, 1,
1.507245, -0.1230155, 1.788884, 1, 1, 1, 1, 1,
1.512046, -1.054185, 4.002129, 0, 0, 1, 1, 1,
1.516837, 1.073191, 3.010509, 1, 0, 0, 1, 1,
1.524561, -0.08735947, 0.1166889, 1, 0, 0, 1, 1,
1.525497, -0.3902457, 4.036071, 1, 0, 0, 1, 1,
1.533552, 0.8738357, 0.1680431, 1, 0, 0, 1, 1,
1.533778, -2.515601, 1.228359, 1, 0, 0, 1, 1,
1.540642, 0.9121376, 0.4928614, 0, 0, 0, 1, 1,
1.544027, -1.370931, 3.030244, 0, 0, 0, 1, 1,
1.545968, -0.7911478, 2.116492, 0, 0, 0, 1, 1,
1.547695, 1.925749, -0.5856906, 0, 0, 0, 1, 1,
1.551559, -0.03728202, 1.702299, 0, 0, 0, 1, 1,
1.585784, -0.6099945, 1.088992, 0, 0, 0, 1, 1,
1.588109, 2.263883, 1.629533, 0, 0, 0, 1, 1,
1.590017, -0.9791316, 0.996245, 1, 1, 1, 1, 1,
1.596691, 0.9595135, 2.115426, 1, 1, 1, 1, 1,
1.603279, -0.396982, 3.225776, 1, 1, 1, 1, 1,
1.60645, 1.164565, 3.390201, 1, 1, 1, 1, 1,
1.636843, 0.2118566, 1.173897, 1, 1, 1, 1, 1,
1.640538, -0.1588162, 0.9355765, 1, 1, 1, 1, 1,
1.658699, -0.9771175, 2.006059, 1, 1, 1, 1, 1,
1.675727, -0.513457, 1.160478, 1, 1, 1, 1, 1,
1.697967, -0.334832, 1.743635, 1, 1, 1, 1, 1,
1.708529, 0.02945788, -0.1715906, 1, 1, 1, 1, 1,
1.713305, 1.040271, 2.676321, 1, 1, 1, 1, 1,
1.713308, 1.018228, 0.1640097, 1, 1, 1, 1, 1,
1.714789, 1.0807, 1.186642, 1, 1, 1, 1, 1,
1.717149, 0.7564006, 1.922888, 1, 1, 1, 1, 1,
1.725959, -0.8645787, 3.105879, 1, 1, 1, 1, 1,
1.747703, 1.193549, 2.368522, 0, 0, 1, 1, 1,
1.749793, 0.7522413, 0.3974423, 1, 0, 0, 1, 1,
1.751234, 0.0950121, 1.977116, 1, 0, 0, 1, 1,
1.769478, -1.8607, 2.698638, 1, 0, 0, 1, 1,
1.779976, -0.6007555, 3.305851, 1, 0, 0, 1, 1,
1.808267, 0.2501233, -1.033093, 1, 0, 0, 1, 1,
1.815616, -0.611198, 0.2386263, 0, 0, 0, 1, 1,
1.815706, 1.197795, 1.320016, 0, 0, 0, 1, 1,
1.818545, 0.9261854, 0.3216374, 0, 0, 0, 1, 1,
1.820344, 0.4258329, 3.034991, 0, 0, 0, 1, 1,
1.850462, -1.372552, 3.640206, 0, 0, 0, 1, 1,
1.853859, -0.3486383, 3.891938, 0, 0, 0, 1, 1,
1.87947, 1.101477, 0.8126466, 0, 0, 0, 1, 1,
1.889269, -1.406802, 0.9156865, 1, 1, 1, 1, 1,
1.892589, -0.5249191, 0.6461179, 1, 1, 1, 1, 1,
1.896758, 0.4489644, 0.4439032, 1, 1, 1, 1, 1,
1.898402, 0.5217115, 2.484927, 1, 1, 1, 1, 1,
1.902268, -0.3544096, 2.378795, 1, 1, 1, 1, 1,
1.913638, 0.08118652, 2.752023, 1, 1, 1, 1, 1,
1.960846, 0.1831676, 2.581557, 1, 1, 1, 1, 1,
1.988865, 0.2365287, 1.629403, 1, 1, 1, 1, 1,
2.016575, -0.05311758, 2.517572, 1, 1, 1, 1, 1,
2.04097, -0.3708209, 1.320233, 1, 1, 1, 1, 1,
2.041008, -1.013555, 3.363479, 1, 1, 1, 1, 1,
2.068412, 0.1010653, 1.064469, 1, 1, 1, 1, 1,
2.08137, 1.902358, 0.4763927, 1, 1, 1, 1, 1,
2.096917, -0.7078891, 2.38723, 1, 1, 1, 1, 1,
2.111945, 2.037697, 0.6616089, 1, 1, 1, 1, 1,
2.132864, 1.573397, 2.059316, 0, 0, 1, 1, 1,
2.13568, -0.824012, 2.884112, 1, 0, 0, 1, 1,
2.143382, 1.790723, -0.5726523, 1, 0, 0, 1, 1,
2.16333, 0.3985925, -0.1976458, 1, 0, 0, 1, 1,
2.203049, 0.2174292, 1.74789, 1, 0, 0, 1, 1,
2.224881, 0.4081624, 0.4586847, 1, 0, 0, 1, 1,
2.237083, -0.1483938, 1.137448, 0, 0, 0, 1, 1,
2.273706, 0.7924564, 3.814223, 0, 0, 0, 1, 1,
2.323232, 0.5313489, 1.114491, 0, 0, 0, 1, 1,
2.327111, -1.865433, 3.148248, 0, 0, 0, 1, 1,
2.368673, 0.9661703, 0.4964763, 0, 0, 0, 1, 1,
2.387781, -1.748752, 2.036644, 0, 0, 0, 1, 1,
2.396021, 1.464129, 0.8778538, 0, 0, 0, 1, 1,
2.399318, -1.465743, 2.516521, 1, 1, 1, 1, 1,
2.401382, 1.00472, 3.718989, 1, 1, 1, 1, 1,
2.574893, -0.3282608, 1.959708, 1, 1, 1, 1, 1,
2.762599, 0.5299519, 0.8719111, 1, 1, 1, 1, 1,
2.771002, 0.5652269, 0.4261995, 1, 1, 1, 1, 1,
2.815128, 0.4265165, 1.50866, 1, 1, 1, 1, 1,
2.820267, -0.1489397, 0.4492089, 1, 1, 1, 1, 1
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
var radius = 9.447567;
var distance = 33.18418;
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
mvMatrix.translate( 0.1087277, -0.4781088, 0.4794674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18418);
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
