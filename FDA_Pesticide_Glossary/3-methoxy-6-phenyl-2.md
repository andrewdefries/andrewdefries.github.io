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
-2.660016, 0.5989268, -0.1859623, 1, 0, 0, 1,
-2.647438, -0.1131312, -1.576735, 1, 0.007843138, 0, 1,
-2.56583, 0.6273289, -1.551617, 1, 0.01176471, 0, 1,
-2.4525, 0.4549758, -1.024832, 1, 0.01960784, 0, 1,
-2.410826, -0.8384452, 0.211258, 1, 0.02352941, 0, 1,
-2.366387, 1.084412, -1.77784, 1, 0.03137255, 0, 1,
-2.338351, 0.2531629, -1.795388, 1, 0.03529412, 0, 1,
-2.332943, 0.6790292, 0.6023443, 1, 0.04313726, 0, 1,
-2.313973, 1.337009, -1.446544, 1, 0.04705882, 0, 1,
-2.31098, -1.368658, -3.30628, 1, 0.05490196, 0, 1,
-2.307178, -0.4106276, -1.544799, 1, 0.05882353, 0, 1,
-2.295255, -0.4524923, -0.4698473, 1, 0.06666667, 0, 1,
-2.245773, 1.145736, -0.2630005, 1, 0.07058824, 0, 1,
-2.196047, -0.8347999, -1.457065, 1, 0.07843138, 0, 1,
-2.151934, 0.3710406, -0.2211207, 1, 0.08235294, 0, 1,
-2.132982, -1.395658, -3.197777, 1, 0.09019608, 0, 1,
-2.065792, -0.2317881, -2.983659, 1, 0.09411765, 0, 1,
-2.045402, -0.5829245, -0.6972091, 1, 0.1019608, 0, 1,
-2.029953, -0.3108276, -2.504262, 1, 0.1098039, 0, 1,
-2.019046, 1.266196, -2.577443, 1, 0.1137255, 0, 1,
-1.986433, -1.372003, -2.707932, 1, 0.1215686, 0, 1,
-1.979429, 2.254961, 0.03858391, 1, 0.1254902, 0, 1,
-1.973229, -0.988368, -1.148599, 1, 0.1333333, 0, 1,
-1.949358, -0.5734962, -2.184013, 1, 0.1372549, 0, 1,
-1.94803, -0.4834192, -0.4400763, 1, 0.145098, 0, 1,
-1.947512, 0.8824682, -0.515111, 1, 0.1490196, 0, 1,
-1.930725, -0.3037147, -1.288984, 1, 0.1568628, 0, 1,
-1.918668, -1.131688, -1.808973, 1, 0.1607843, 0, 1,
-1.909147, -0.07764202, -3.342354, 1, 0.1686275, 0, 1,
-1.909101, -1.150883, -2.349272, 1, 0.172549, 0, 1,
-1.908549, 0.3127636, -3.39543, 1, 0.1803922, 0, 1,
-1.876869, 0.1617861, -0.4967973, 1, 0.1843137, 0, 1,
-1.874262, -0.4076506, -1.294899, 1, 0.1921569, 0, 1,
-1.855131, 1.534346, -1.447731, 1, 0.1960784, 0, 1,
-1.852828, -0.7249234, 0.1984652, 1, 0.2039216, 0, 1,
-1.84351, 1.08713, -1.933554, 1, 0.2117647, 0, 1,
-1.802898, -0.2754238, -0.6660095, 1, 0.2156863, 0, 1,
-1.755887, 0.1488649, -1.446463, 1, 0.2235294, 0, 1,
-1.755631, -0.1862743, -2.227845, 1, 0.227451, 0, 1,
-1.754346, -0.1476994, -2.560887, 1, 0.2352941, 0, 1,
-1.75409, -0.2494391, -0.5367551, 1, 0.2392157, 0, 1,
-1.743591, 1.335966, 1.247696, 1, 0.2470588, 0, 1,
-1.735503, -0.4648733, -2.759284, 1, 0.2509804, 0, 1,
-1.73472, -0.4308614, -1.974423, 1, 0.2588235, 0, 1,
-1.726319, -0.1949384, -1.12363, 1, 0.2627451, 0, 1,
-1.712564, 0.2665346, 0.4770959, 1, 0.2705882, 0, 1,
-1.70795, 0.2069468, -2.573787, 1, 0.2745098, 0, 1,
-1.706972, -0.3789733, -0.4956549, 1, 0.282353, 0, 1,
-1.701694, 2.453726, -1.392838, 1, 0.2862745, 0, 1,
-1.697296, -0.07359353, -1.905977, 1, 0.2941177, 0, 1,
-1.694661, 1.352097, 1.36681, 1, 0.3019608, 0, 1,
-1.693992, 0.8038433, -2.739096, 1, 0.3058824, 0, 1,
-1.691332, -0.04277976, -0.9020355, 1, 0.3137255, 0, 1,
-1.6872, -0.02003703, -4.59402, 1, 0.3176471, 0, 1,
-1.686512, 1.20902, -2.629098, 1, 0.3254902, 0, 1,
-1.678045, 0.9099224, -2.442466, 1, 0.3294118, 0, 1,
-1.662864, -0.1321982, -0.9806252, 1, 0.3372549, 0, 1,
-1.655498, 1.971058, 1.050791, 1, 0.3411765, 0, 1,
-1.653371, 1.215666, -2.906411, 1, 0.3490196, 0, 1,
-1.63687, -0.9692513, -3.254623, 1, 0.3529412, 0, 1,
-1.636147, 0.5323313, -0.2280883, 1, 0.3607843, 0, 1,
-1.628286, 0.6970391, -0.6669955, 1, 0.3647059, 0, 1,
-1.625573, -1.060444, -0.5240511, 1, 0.372549, 0, 1,
-1.618501, -0.1377609, -1.616089, 1, 0.3764706, 0, 1,
-1.618071, -1.654971, -2.803107, 1, 0.3843137, 0, 1,
-1.614074, -0.5247898, -0.2588141, 1, 0.3882353, 0, 1,
-1.605808, 1.175067, -1.957751, 1, 0.3960784, 0, 1,
-1.603659, 1.583812, 0.9301415, 1, 0.4039216, 0, 1,
-1.599752, -1.301312, -1.653924, 1, 0.4078431, 0, 1,
-1.591603, -0.08639994, -3.984443, 1, 0.4156863, 0, 1,
-1.575418, 0.9859453, -1.729528, 1, 0.4196078, 0, 1,
-1.574483, 0.03083201, -0.1671574, 1, 0.427451, 0, 1,
-1.570288, -0.8045561, -2.868382, 1, 0.4313726, 0, 1,
-1.536937, 0.5130196, -1.43642, 1, 0.4392157, 0, 1,
-1.511593, 0.7596625, -1.492162, 1, 0.4431373, 0, 1,
-1.50597, -1.501072, -2.073554, 1, 0.4509804, 0, 1,
-1.496525, 0.5707462, -1.127114, 1, 0.454902, 0, 1,
-1.496116, -0.4129654, -2.115177, 1, 0.4627451, 0, 1,
-1.480475, 0.3594039, -1.81072, 1, 0.4666667, 0, 1,
-1.467307, 2.410774, -1.387786, 1, 0.4745098, 0, 1,
-1.462404, -1.938514, -1.888632, 1, 0.4784314, 0, 1,
-1.461961, -0.5845644, -2.928372, 1, 0.4862745, 0, 1,
-1.461002, 0.3193671, -1.387533, 1, 0.4901961, 0, 1,
-1.459576, 1.104805, 0.636643, 1, 0.4980392, 0, 1,
-1.454443, -0.4490259, -0.3367921, 1, 0.5058824, 0, 1,
-1.452146, 2.923909, 0.3429911, 1, 0.509804, 0, 1,
-1.447739, -0.8430325, -2.729545, 1, 0.5176471, 0, 1,
-1.442837, 1.274513, -1.733607, 1, 0.5215687, 0, 1,
-1.437999, 0.04337728, -1.604392, 1, 0.5294118, 0, 1,
-1.433447, -1.023311, -2.846094, 1, 0.5333334, 0, 1,
-1.425304, 1.813315, 0.4313261, 1, 0.5411765, 0, 1,
-1.41729, -0.5056518, -1.04284, 1, 0.5450981, 0, 1,
-1.389789, -0.3054158, -1.364778, 1, 0.5529412, 0, 1,
-1.388554, -0.6987073, -3.736732, 1, 0.5568628, 0, 1,
-1.381572, 0.168668, -2.055511, 1, 0.5647059, 0, 1,
-1.381084, 0.3330976, -1.725268, 1, 0.5686275, 0, 1,
-1.380705, -0.6582416, -1.559854, 1, 0.5764706, 0, 1,
-1.379955, 1.106409, -0.1664035, 1, 0.5803922, 0, 1,
-1.379496, 0.08755098, -1.038561, 1, 0.5882353, 0, 1,
-1.378547, 0.7041195, -1.904109, 1, 0.5921569, 0, 1,
-1.375628, 1.324393, -2.584854, 1, 0.6, 0, 1,
-1.365648, 0.9254994, -1.588968, 1, 0.6078432, 0, 1,
-1.365558, -0.8115309, -2.040456, 1, 0.6117647, 0, 1,
-1.36218, 1.607362, -0.4250087, 1, 0.6196079, 0, 1,
-1.349233, 0.7152365, -1.169782, 1, 0.6235294, 0, 1,
-1.3455, -0.5290789, -4.494133, 1, 0.6313726, 0, 1,
-1.340467, -0.8017774, -3.923846, 1, 0.6352941, 0, 1,
-1.33484, -0.3151206, -2.378119, 1, 0.6431373, 0, 1,
-1.325452, 1.574939, -0.7783623, 1, 0.6470588, 0, 1,
-1.322532, 0.8677301, -1.226032, 1, 0.654902, 0, 1,
-1.320711, -1.152392, -2.399624, 1, 0.6588235, 0, 1,
-1.318912, 0.9403638, -0.1452378, 1, 0.6666667, 0, 1,
-1.303697, -0.9169871, -2.992171, 1, 0.6705883, 0, 1,
-1.29347, 0.2085611, -1.589233, 1, 0.6784314, 0, 1,
-1.289794, -0.3307149, -3.407506, 1, 0.682353, 0, 1,
-1.286845, 0.4402052, -0.8387558, 1, 0.6901961, 0, 1,
-1.280378, -0.9912102, -2.466689, 1, 0.6941177, 0, 1,
-1.271815, -1.013152, -2.71211, 1, 0.7019608, 0, 1,
-1.264962, 0.528114, -0.6347089, 1, 0.7098039, 0, 1,
-1.264491, 1.478448, -0.7502691, 1, 0.7137255, 0, 1,
-1.252519, -0.8253222, -2.280903, 1, 0.7215686, 0, 1,
-1.249898, -0.6951747, -1.946465, 1, 0.7254902, 0, 1,
-1.228359, -0.4292353, -2.144863, 1, 0.7333333, 0, 1,
-1.227061, 1.002791, -0.04885064, 1, 0.7372549, 0, 1,
-1.22679, 0.1284253, -2.261004, 1, 0.7450981, 0, 1,
-1.225746, 0.06605417, -2.123335, 1, 0.7490196, 0, 1,
-1.22326, -0.0604682, -2.210914, 1, 0.7568628, 0, 1,
-1.21782, 0.9195437, 1.345196, 1, 0.7607843, 0, 1,
-1.211917, -0.4009482, -3.163377, 1, 0.7686275, 0, 1,
-1.208073, 0.8997664, -1.259426, 1, 0.772549, 0, 1,
-1.20425, -0.1051296, -1.058135, 1, 0.7803922, 0, 1,
-1.195158, 0.3886449, 0.2793877, 1, 0.7843137, 0, 1,
-1.190932, 0.3587963, 0.2582978, 1, 0.7921569, 0, 1,
-1.185632, 0.7086778, -0.7371693, 1, 0.7960784, 0, 1,
-1.16688, 2.733504, 0.3350034, 1, 0.8039216, 0, 1,
-1.166493, 1.762894, -0.1365863, 1, 0.8117647, 0, 1,
-1.163491, 0.2086943, -1.422168, 1, 0.8156863, 0, 1,
-1.159218, 0.3085049, -0.8283638, 1, 0.8235294, 0, 1,
-1.155194, -2.354574, -3.170326, 1, 0.827451, 0, 1,
-1.152297, 1.250236, -1.514967, 1, 0.8352941, 0, 1,
-1.146619, -0.9706463, -2.98826, 1, 0.8392157, 0, 1,
-1.132744, 1.302143, -0.2039954, 1, 0.8470588, 0, 1,
-1.12121, -0.1160759, -2.746647, 1, 0.8509804, 0, 1,
-1.120285, -0.5713016, -1.526859, 1, 0.8588235, 0, 1,
-1.117598, 0.8652331, -2.039617, 1, 0.8627451, 0, 1,
-1.115424, 0.946106, -1.349161, 1, 0.8705882, 0, 1,
-1.112235, 0.569734, -0.6940236, 1, 0.8745098, 0, 1,
-1.107457, -1.842389, -4.138512, 1, 0.8823529, 0, 1,
-1.092346, 0.08417094, -1.881928, 1, 0.8862745, 0, 1,
-1.083994, 0.8635171, 0.0024319, 1, 0.8941177, 0, 1,
-1.070031, -0.2579014, -1.414632, 1, 0.8980392, 0, 1,
-1.061201, 0.2453214, -2.099685, 1, 0.9058824, 0, 1,
-1.060122, 0.2136658, -1.60483, 1, 0.9137255, 0, 1,
-1.05521, -0.9442874, -1.157647, 1, 0.9176471, 0, 1,
-1.051969, -0.3672895, -2.37977, 1, 0.9254902, 0, 1,
-1.049261, 0.01529482, -1.684127, 1, 0.9294118, 0, 1,
-1.049128, 0.8176292, -2.203269, 1, 0.9372549, 0, 1,
-1.046078, 1.09866, 0.5695094, 1, 0.9411765, 0, 1,
-1.041195, -1.81081, 0.1264269, 1, 0.9490196, 0, 1,
-1.040197, -0.3406462, -3.243802, 1, 0.9529412, 0, 1,
-1.038897, -2.038054, -1.77331, 1, 0.9607843, 0, 1,
-1.038117, -0.465844, -2.45501, 1, 0.9647059, 0, 1,
-1.03413, 0.5181395, -0.4900405, 1, 0.972549, 0, 1,
-1.03325, 0.2262363, -0.3892016, 1, 0.9764706, 0, 1,
-1.029099, 1.99149, -0.8771273, 1, 0.9843137, 0, 1,
-1.024182, 1.294375, 0.3419394, 1, 0.9882353, 0, 1,
-1.023185, -0.5951003, -1.940137, 1, 0.9960784, 0, 1,
-1.022359, -0.5448098, -2.738462, 0.9960784, 1, 0, 1,
-1.022055, 1.182803, -0.2102506, 0.9921569, 1, 0, 1,
-1.01372, 0.8837619, -0.940123, 0.9843137, 1, 0, 1,
-1.010025, -0.539783, -0.2087183, 0.9803922, 1, 0, 1,
-1.009683, -0.3888247, -2.109104, 0.972549, 1, 0, 1,
-1.009174, -1.045305, -2.843919, 0.9686275, 1, 0, 1,
-1.008042, -0.06154488, -4.526186, 0.9607843, 1, 0, 1,
-0.9979995, -0.8819491, -2.967561, 0.9568627, 1, 0, 1,
-0.9938467, -0.2588305, -1.078965, 0.9490196, 1, 0, 1,
-0.9907417, -0.1836538, -2.358063, 0.945098, 1, 0, 1,
-0.9902639, 0.1801905, -2.187627, 0.9372549, 1, 0, 1,
-0.9851391, 0.1522605, 0.03319513, 0.9333333, 1, 0, 1,
-0.9652084, 0.003538941, -1.239174, 0.9254902, 1, 0, 1,
-0.9636875, -1.366722, -2.670629, 0.9215686, 1, 0, 1,
-0.9632519, -0.3991402, -2.334137, 0.9137255, 1, 0, 1,
-0.9625373, 0.6747749, -1.454522, 0.9098039, 1, 0, 1,
-0.9550991, -2.110077, -4.747582, 0.9019608, 1, 0, 1,
-0.954909, 0.1057479, -1.28054, 0.8941177, 1, 0, 1,
-0.9493792, 0.02426359, -0.05514618, 0.8901961, 1, 0, 1,
-0.9485244, 0.1724122, -1.430474, 0.8823529, 1, 0, 1,
-0.9478721, -0.01663795, -2.131164, 0.8784314, 1, 0, 1,
-0.9444915, 0.1314442, 0.2780986, 0.8705882, 1, 0, 1,
-0.94403, -0.5191751, -1.983937, 0.8666667, 1, 0, 1,
-0.9408978, -0.9213026, -1.542269, 0.8588235, 1, 0, 1,
-0.9404106, -1.024282, -1.626585, 0.854902, 1, 0, 1,
-0.9365569, 0.02041495, -3.929503, 0.8470588, 1, 0, 1,
-0.9363858, 0.09559299, -1.677387, 0.8431373, 1, 0, 1,
-0.9299846, 0.8792473, -0.8645908, 0.8352941, 1, 0, 1,
-0.9299539, -0.5633039, -3.333573, 0.8313726, 1, 0, 1,
-0.9272908, -0.6115956, -2.319544, 0.8235294, 1, 0, 1,
-0.9201239, -0.5635449, -3.299914, 0.8196079, 1, 0, 1,
-0.9085953, 0.9045534, -1.509904, 0.8117647, 1, 0, 1,
-0.9064195, 0.1544864, -0.9665513, 0.8078431, 1, 0, 1,
-0.9033014, 0.5595614, 0.5749506, 0.8, 1, 0, 1,
-0.8978142, -0.4501528, -1.395339, 0.7921569, 1, 0, 1,
-0.8942956, 1.876086, 0.168992, 0.7882353, 1, 0, 1,
-0.8918967, -1.227566, -3.349842, 0.7803922, 1, 0, 1,
-0.8906353, -0.07051197, -1.99891, 0.7764706, 1, 0, 1,
-0.8891353, 0.7161181, 1.797257, 0.7686275, 1, 0, 1,
-0.87404, 1.591945, 0.2942299, 0.7647059, 1, 0, 1,
-0.8730344, 0.3683838, -0.2550548, 0.7568628, 1, 0, 1,
-0.8697193, 0.5625902, -0.3444141, 0.7529412, 1, 0, 1,
-0.8687184, -0.5633779, -3.548319, 0.7450981, 1, 0, 1,
-0.8662245, -0.2480139, -0.6204551, 0.7411765, 1, 0, 1,
-0.8634252, 0.3154936, 0.01915139, 0.7333333, 1, 0, 1,
-0.8603969, 0.02197053, -2.008131, 0.7294118, 1, 0, 1,
-0.8499003, -0.870608, -0.7541605, 0.7215686, 1, 0, 1,
-0.8496968, -1.956088, -3.333965, 0.7176471, 1, 0, 1,
-0.8490399, -1.981018, -2.429343, 0.7098039, 1, 0, 1,
-0.8472349, 0.5750226, -2.191669, 0.7058824, 1, 0, 1,
-0.8438004, 0.4449598, -0.6442507, 0.6980392, 1, 0, 1,
-0.8389944, -1.510236, -1.266107, 0.6901961, 1, 0, 1,
-0.8343006, 0.4865949, -0.3109669, 0.6862745, 1, 0, 1,
-0.8270305, 0.4212788, -1.40004, 0.6784314, 1, 0, 1,
-0.8269274, -0.7631001, -3.045946, 0.6745098, 1, 0, 1,
-0.8227077, 0.8059171, 0.2827045, 0.6666667, 1, 0, 1,
-0.8196924, -1.028783, -2.773893, 0.6627451, 1, 0, 1,
-0.8187743, -0.8983832, -1.358704, 0.654902, 1, 0, 1,
-0.8146253, 0.3421592, -2.426815, 0.6509804, 1, 0, 1,
-0.8104783, 0.3985423, -0.230776, 0.6431373, 1, 0, 1,
-0.8060362, -1.047807, -3.472449, 0.6392157, 1, 0, 1,
-0.7920342, 0.2122253, -1.686448, 0.6313726, 1, 0, 1,
-0.7913908, -0.9263976, -1.091877, 0.627451, 1, 0, 1,
-0.7735322, -0.001770888, -0.1679198, 0.6196079, 1, 0, 1,
-0.7722337, 0.1696246, -1.066855, 0.6156863, 1, 0, 1,
-0.7705145, -0.7880313, -2.198488, 0.6078432, 1, 0, 1,
-0.767719, -2.119829, -2.081181, 0.6039216, 1, 0, 1,
-0.7648785, -1.321709, -1.335341, 0.5960785, 1, 0, 1,
-0.7646182, 1.068057, -0.9600279, 0.5882353, 1, 0, 1,
-0.7608992, 0.1624049, -2.872639, 0.5843138, 1, 0, 1,
-0.7593389, 0.2063559, -1.356055, 0.5764706, 1, 0, 1,
-0.7549378, -1.800099, -1.404123, 0.572549, 1, 0, 1,
-0.7523278, -1.088892, -3.802478, 0.5647059, 1, 0, 1,
-0.7520971, 1.003917, -0.7009661, 0.5607843, 1, 0, 1,
-0.7499725, -1.247645, -1.215166, 0.5529412, 1, 0, 1,
-0.744988, -0.04453564, -0.9522263, 0.5490196, 1, 0, 1,
-0.7446392, 0.5192022, -1.607843, 0.5411765, 1, 0, 1,
-0.736807, 1.133625, 0.8991656, 0.5372549, 1, 0, 1,
-0.7317269, 0.1457467, 0.3416356, 0.5294118, 1, 0, 1,
-0.730965, 1.116913, 0.3595243, 0.5254902, 1, 0, 1,
-0.7238446, 0.8906165, -0.8644134, 0.5176471, 1, 0, 1,
-0.7200344, -0.3793886, -2.069512, 0.5137255, 1, 0, 1,
-0.7195682, 1.147758, -1.119412, 0.5058824, 1, 0, 1,
-0.7195465, 0.8804584, 0.4966461, 0.5019608, 1, 0, 1,
-0.7150567, 0.7516977, 0.1488461, 0.4941176, 1, 0, 1,
-0.7147456, 1.359679, 0.5214707, 0.4862745, 1, 0, 1,
-0.7115484, -0.2821854, -1.074133, 0.4823529, 1, 0, 1,
-0.7040018, 1.254451, -0.5500026, 0.4745098, 1, 0, 1,
-0.7035361, 0.8978605, -0.4381024, 0.4705882, 1, 0, 1,
-0.7029048, -0.5199919, -2.69373, 0.4627451, 1, 0, 1,
-0.7003922, -2.372309, -4.047355, 0.4588235, 1, 0, 1,
-0.6970661, -0.9321589, -3.283424, 0.4509804, 1, 0, 1,
-0.6944808, -2.444384, -1.714936, 0.4470588, 1, 0, 1,
-0.6944624, 0.9566376, -2.386283, 0.4392157, 1, 0, 1,
-0.6936927, -0.3429944, -2.694261, 0.4352941, 1, 0, 1,
-0.6933981, 0.296202, -1.39419, 0.427451, 1, 0, 1,
-0.6933555, -0.4626575, -0.3383017, 0.4235294, 1, 0, 1,
-0.6931381, 0.1627053, -1.088942, 0.4156863, 1, 0, 1,
-0.690771, 1.112857, -1.348676, 0.4117647, 1, 0, 1,
-0.6896791, 0.5725204, -0.3371435, 0.4039216, 1, 0, 1,
-0.6864129, 0.3378973, -1.588979, 0.3960784, 1, 0, 1,
-0.6787681, 1.098011, -0.1340031, 0.3921569, 1, 0, 1,
-0.6787656, 1.813917, -0.3071139, 0.3843137, 1, 0, 1,
-0.6755949, -1.303361, -1.952754, 0.3803922, 1, 0, 1,
-0.6727263, -0.5205311, -1.571825, 0.372549, 1, 0, 1,
-0.6725684, 0.5037103, -1.021342, 0.3686275, 1, 0, 1,
-0.6703646, -0.9758757, -3.447128, 0.3607843, 1, 0, 1,
-0.6697381, 0.921885, -0.02816619, 0.3568628, 1, 0, 1,
-0.6660726, -1.500035, -2.804996, 0.3490196, 1, 0, 1,
-0.6657609, -1.415728, -1.260089, 0.345098, 1, 0, 1,
-0.6647609, -2.200801, -2.958104, 0.3372549, 1, 0, 1,
-0.6640697, 1.059741, -0.3556967, 0.3333333, 1, 0, 1,
-0.6632339, 0.9916886, -1.504078, 0.3254902, 1, 0, 1,
-0.6585913, -0.2102403, -2.00137, 0.3215686, 1, 0, 1,
-0.6555195, 0.9601138, 0.7480974, 0.3137255, 1, 0, 1,
-0.6533535, -1.625869, -3.664748, 0.3098039, 1, 0, 1,
-0.6457629, -0.3012874, -1.713893, 0.3019608, 1, 0, 1,
-0.6444172, 1.582324, -0.3471955, 0.2941177, 1, 0, 1,
-0.6431137, -0.9045501, -2.387477, 0.2901961, 1, 0, 1,
-0.633786, -1.635741, -2.465312, 0.282353, 1, 0, 1,
-0.6260778, 0.6700354, -1.910313, 0.2784314, 1, 0, 1,
-0.6216887, -0.9607673, -2.257051, 0.2705882, 1, 0, 1,
-0.6085516, -0.6053375, -1.255574, 0.2666667, 1, 0, 1,
-0.5902712, 0.7056043, -0.5419784, 0.2588235, 1, 0, 1,
-0.5893039, 1.260723, -1.680285, 0.254902, 1, 0, 1,
-0.5890009, 0.1404458, 0.3502043, 0.2470588, 1, 0, 1,
-0.5866382, -1.151825, -1.312297, 0.2431373, 1, 0, 1,
-0.584173, -0.686975, -1.492649, 0.2352941, 1, 0, 1,
-0.5754621, -1.435745, -3.017303, 0.2313726, 1, 0, 1,
-0.5753224, 0.1523312, 0.3186685, 0.2235294, 1, 0, 1,
-0.5751556, -1.107967, -0.8395332, 0.2196078, 1, 0, 1,
-0.5727575, 0.9732994, -0.5578167, 0.2117647, 1, 0, 1,
-0.5717354, -0.2887687, -1.37879, 0.2078431, 1, 0, 1,
-0.566963, -1.655288, -3.452298, 0.2, 1, 0, 1,
-0.5650142, -0.5533188, -3.419937, 0.1921569, 1, 0, 1,
-0.5644596, -0.08763081, -3.655322, 0.1882353, 1, 0, 1,
-0.5625494, -0.4039217, -0.5670685, 0.1803922, 1, 0, 1,
-0.5546429, 0.3214569, -1.717436, 0.1764706, 1, 0, 1,
-0.5494723, -1.113848, -2.621695, 0.1686275, 1, 0, 1,
-0.5478731, 0.4086047, -1.522021, 0.1647059, 1, 0, 1,
-0.5464628, -0.5635323, -2.187653, 0.1568628, 1, 0, 1,
-0.5405858, -0.6632268, -1.150386, 0.1529412, 1, 0, 1,
-0.5402287, 0.4027379, 0.1906419, 0.145098, 1, 0, 1,
-0.5399956, -0.0264698, -2.531899, 0.1411765, 1, 0, 1,
-0.5377445, -0.2747279, -1.377055, 0.1333333, 1, 0, 1,
-0.5370834, -3.374405, -1.498851, 0.1294118, 1, 0, 1,
-0.5361378, 2.215897, -0.2434928, 0.1215686, 1, 0, 1,
-0.531104, 0.2053433, -1.501732, 0.1176471, 1, 0, 1,
-0.5255476, 1.821695, -0.01588482, 0.1098039, 1, 0, 1,
-0.5135534, -1.151415, -4.977471, 0.1058824, 1, 0, 1,
-0.5130361, -0.3082095, -1.848072, 0.09803922, 1, 0, 1,
-0.511919, 0.03536395, -2.321383, 0.09019608, 1, 0, 1,
-0.5083053, -0.09848764, -1.235163, 0.08627451, 1, 0, 1,
-0.5073997, 0.9280108, -0.5749527, 0.07843138, 1, 0, 1,
-0.5024458, -1.667807, -4.11417, 0.07450981, 1, 0, 1,
-0.4988172, -0.7441068, -2.319236, 0.06666667, 1, 0, 1,
-0.4913692, -0.8338437, -1.127535, 0.0627451, 1, 0, 1,
-0.4906973, -0.2358727, -2.903061, 0.05490196, 1, 0, 1,
-0.4895697, -0.9315971, -2.448868, 0.05098039, 1, 0, 1,
-0.4857613, -0.2196101, -1.158741, 0.04313726, 1, 0, 1,
-0.482098, -0.06698991, -2.951799, 0.03921569, 1, 0, 1,
-0.4811794, 1.027312, -2.265389, 0.03137255, 1, 0, 1,
-0.4779421, 0.5251424, 0.9889312, 0.02745098, 1, 0, 1,
-0.4767309, -0.4345558, -2.498589, 0.01960784, 1, 0, 1,
-0.4745339, -2.149693, -4.067058, 0.01568628, 1, 0, 1,
-0.4702223, 1.287718, -1.929189, 0.007843138, 1, 0, 1,
-0.4496386, 0.7883766, -2.180579, 0.003921569, 1, 0, 1,
-0.4487115, -0.1890215, -3.229364, 0, 1, 0.003921569, 1,
-0.447184, -1.64931, -3.891941, 0, 1, 0.01176471, 1,
-0.4432018, -0.8253344, -2.672379, 0, 1, 0.01568628, 1,
-0.4386844, -0.2452937, -1.451354, 0, 1, 0.02352941, 1,
-0.4318561, -0.2671196, -2.788126, 0, 1, 0.02745098, 1,
-0.4284529, 0.6351117, -1.563878, 0, 1, 0.03529412, 1,
-0.423386, 0.655981, -0.6477399, 0, 1, 0.03921569, 1,
-0.4232945, 0.5119029, -1.771666, 0, 1, 0.04705882, 1,
-0.4196231, -0.7570555, -2.851627, 0, 1, 0.05098039, 1,
-0.4080585, 2.356696, 1.384148, 0, 1, 0.05882353, 1,
-0.406124, -0.6385466, -2.977011, 0, 1, 0.0627451, 1,
-0.4007598, -0.3518922, -1.986685, 0, 1, 0.07058824, 1,
-0.3990005, -0.08200004, -0.5499065, 0, 1, 0.07450981, 1,
-0.3986672, -0.1301588, -1.440694, 0, 1, 0.08235294, 1,
-0.3964087, -0.7437304, -2.734648, 0, 1, 0.08627451, 1,
-0.3861669, 0.1887338, -1.148892, 0, 1, 0.09411765, 1,
-0.3776387, 0.01053252, -2.914483, 0, 1, 0.1019608, 1,
-0.376735, -0.745123, -0.4088315, 0, 1, 0.1058824, 1,
-0.3749845, -0.1233104, -2.363509, 0, 1, 0.1137255, 1,
-0.3736664, -0.3164178, -1.595229, 0, 1, 0.1176471, 1,
-0.3727281, -0.6654422, -2.767907, 0, 1, 0.1254902, 1,
-0.3726993, -1.254353, -3.179538, 0, 1, 0.1294118, 1,
-0.3704319, -1.448438, -3.344715, 0, 1, 0.1372549, 1,
-0.3691914, 0.5095086, 0.371404, 0, 1, 0.1411765, 1,
-0.3656881, 1.591033, -0.04949989, 0, 1, 0.1490196, 1,
-0.3629571, -1.6943, -4.324944, 0, 1, 0.1529412, 1,
-0.3610346, -1.011164, -4.393484, 0, 1, 0.1607843, 1,
-0.3540001, 1.055392, -1.487452, 0, 1, 0.1647059, 1,
-0.3516507, -0.08306013, -3.351438, 0, 1, 0.172549, 1,
-0.3498988, -2.074527, -1.674343, 0, 1, 0.1764706, 1,
-0.3488002, 2.233575, -0.8321083, 0, 1, 0.1843137, 1,
-0.3444346, 1.751348, 1.131458, 0, 1, 0.1882353, 1,
-0.3418344, 0.6132076, 0.2989181, 0, 1, 0.1960784, 1,
-0.3393938, 0.21929, -0.8389427, 0, 1, 0.2039216, 1,
-0.3366807, 2.662376, -0.3218093, 0, 1, 0.2078431, 1,
-0.3358458, -0.0627527, -1.773678, 0, 1, 0.2156863, 1,
-0.3339212, -2.672021, -2.200155, 0, 1, 0.2196078, 1,
-0.3337959, 0.07889218, 0.7152232, 0, 1, 0.227451, 1,
-0.328911, 1.419075, -1.184094, 0, 1, 0.2313726, 1,
-0.3286138, 0.2487348, -0.3521224, 0, 1, 0.2392157, 1,
-0.3271933, -0.744642, -1.051045, 0, 1, 0.2431373, 1,
-0.3267674, 0.4696781, -0.4922774, 0, 1, 0.2509804, 1,
-0.3249731, 1.069989, 0.04758766, 0, 1, 0.254902, 1,
-0.3205369, -1.822345, -4.240219, 0, 1, 0.2627451, 1,
-0.3193835, -0.2207823, -2.298395, 0, 1, 0.2666667, 1,
-0.3182607, -0.1737727, -4.469277, 0, 1, 0.2745098, 1,
-0.3148108, -1.143093, -3.970917, 0, 1, 0.2784314, 1,
-0.3107177, 0.5147843, -2.192256, 0, 1, 0.2862745, 1,
-0.3033565, -0.8344823, -1.880277, 0, 1, 0.2901961, 1,
-0.3007916, 0.003931638, -1.806249, 0, 1, 0.2980392, 1,
-0.295198, -0.01704822, -0.9688645, 0, 1, 0.3058824, 1,
-0.2939615, -0.02512033, -2.967598, 0, 1, 0.3098039, 1,
-0.2933788, 0.08295082, -0.8073403, 0, 1, 0.3176471, 1,
-0.2815329, -0.475996, -4.366114, 0, 1, 0.3215686, 1,
-0.2808482, -0.8851981, -2.19803, 0, 1, 0.3294118, 1,
-0.2768461, -1.363386, -1.681228, 0, 1, 0.3333333, 1,
-0.2734171, -0.2962078, -2.345314, 0, 1, 0.3411765, 1,
-0.2711328, 0.9100036, 1.401906, 0, 1, 0.345098, 1,
-0.2672093, 1.130162, -0.9515395, 0, 1, 0.3529412, 1,
-0.2654925, 1.323952, -0.3071776, 0, 1, 0.3568628, 1,
-0.2649003, 1.677003, 1.191301, 0, 1, 0.3647059, 1,
-0.2633503, -0.5182264, -2.982161, 0, 1, 0.3686275, 1,
-0.2556163, -0.400102, -3.267443, 0, 1, 0.3764706, 1,
-0.2550413, 0.7440812, -1.139809, 0, 1, 0.3803922, 1,
-0.2531027, 1.360537, 0.8373517, 0, 1, 0.3882353, 1,
-0.2514267, -0.7661839, -3.287733, 0, 1, 0.3921569, 1,
-0.2495769, -1.173437, -2.533045, 0, 1, 0.4, 1,
-0.2413303, 0.2707901, -1.373954, 0, 1, 0.4078431, 1,
-0.239016, -0.09365588, -3.185326, 0, 1, 0.4117647, 1,
-0.2365934, 1.440315, 0.1753411, 0, 1, 0.4196078, 1,
-0.2355115, 1.007722, 0.1205647, 0, 1, 0.4235294, 1,
-0.2352433, 0.947591, -1.667511, 0, 1, 0.4313726, 1,
-0.2351747, -0.3702567, -2.527622, 0, 1, 0.4352941, 1,
-0.234765, 0.204836, -1.374501, 0, 1, 0.4431373, 1,
-0.234086, 0.5753676, 1.306062, 0, 1, 0.4470588, 1,
-0.2332053, 0.5096642, -0.1252208, 0, 1, 0.454902, 1,
-0.2321285, 0.8389984, -1.011686, 0, 1, 0.4588235, 1,
-0.2302804, -1.582983, -1.27978, 0, 1, 0.4666667, 1,
-0.2283456, -1.190038, -1.640049, 0, 1, 0.4705882, 1,
-0.225777, -0.5963593, -2.109137, 0, 1, 0.4784314, 1,
-0.2219346, 1.105592, 0.01263442, 0, 1, 0.4823529, 1,
-0.216337, 0.3800385, -0.2890305, 0, 1, 0.4901961, 1,
-0.2140644, 0.04380007, -1.214819, 0, 1, 0.4941176, 1,
-0.2133274, 1.682998, -0.4103779, 0, 1, 0.5019608, 1,
-0.2130321, -0.724139, -1.920431, 0, 1, 0.509804, 1,
-0.2115804, 0.7250321, 0.7094864, 0, 1, 0.5137255, 1,
-0.2087043, 0.670478, -0.1062419, 0, 1, 0.5215687, 1,
-0.203839, -1.177998, -3.626158, 0, 1, 0.5254902, 1,
-0.2018684, -0.07446423, -1.233042, 0, 1, 0.5333334, 1,
-0.201221, 1.943904, -0.04044142, 0, 1, 0.5372549, 1,
-0.1985353, 0.6743281, 2.184073, 0, 1, 0.5450981, 1,
-0.1981942, 1.177802, 0.3559649, 0, 1, 0.5490196, 1,
-0.1980145, 0.7679583, -2.326907, 0, 1, 0.5568628, 1,
-0.1963029, -0.9134836, -3.994359, 0, 1, 0.5607843, 1,
-0.1904459, 0.5718426, 2.181957, 0, 1, 0.5686275, 1,
-0.1901835, -1.271664, -3.200879, 0, 1, 0.572549, 1,
-0.1873868, -0.04983865, -2.365549, 0, 1, 0.5803922, 1,
-0.1747641, 1.749816, 1.005868, 0, 1, 0.5843138, 1,
-0.1722313, -1.971356, -3.402099, 0, 1, 0.5921569, 1,
-0.169867, -2.987043, -1.622068, 0, 1, 0.5960785, 1,
-0.169077, 0.8111148, -0.5015605, 0, 1, 0.6039216, 1,
-0.1662022, -0.2286975, -2.019626, 0, 1, 0.6117647, 1,
-0.1646284, -0.8784271, -2.141575, 0, 1, 0.6156863, 1,
-0.1637092, -1.072164, -3.728662, 0, 1, 0.6235294, 1,
-0.1636786, 2.277681, -0.7587376, 0, 1, 0.627451, 1,
-0.1624278, -0.183877, -1.464567, 0, 1, 0.6352941, 1,
-0.1590427, 1.798433, 0.7413525, 0, 1, 0.6392157, 1,
-0.1557731, -1.273883, -1.878915, 0, 1, 0.6470588, 1,
-0.1483691, 0.8931031, -1.266992, 0, 1, 0.6509804, 1,
-0.1462001, -0.03960093, 0.7005188, 0, 1, 0.6588235, 1,
-0.1456665, -1.217055, -2.804845, 0, 1, 0.6627451, 1,
-0.1453345, 0.4605392, -2.258133, 0, 1, 0.6705883, 1,
-0.1448285, 0.1824343, -2.862362, 0, 1, 0.6745098, 1,
-0.1398792, -0.9709015, -1.978774, 0, 1, 0.682353, 1,
-0.1388308, 1.103999, 0.2682681, 0, 1, 0.6862745, 1,
-0.1384792, -0.4773579, -2.531162, 0, 1, 0.6941177, 1,
-0.1330717, 0.3800241, -0.6959566, 0, 1, 0.7019608, 1,
-0.1329665, 0.7643334, -0.7631866, 0, 1, 0.7058824, 1,
-0.1285209, 0.3250263, 0.7118829, 0, 1, 0.7137255, 1,
-0.1284705, 0.6377947, -1.58376, 0, 1, 0.7176471, 1,
-0.1232714, -1.839926, -3.403732, 0, 1, 0.7254902, 1,
-0.1205605, -1.340476, -3.857594, 0, 1, 0.7294118, 1,
-0.1200618, 0.0965608, -0.5978126, 0, 1, 0.7372549, 1,
-0.1174959, 1.151545, -0.6562185, 0, 1, 0.7411765, 1,
-0.1126479, -1.069513, -2.834607, 0, 1, 0.7490196, 1,
-0.1111278, -0.2863988, -1.562919, 0, 1, 0.7529412, 1,
-0.09742271, 0.5523254, 1.04622, 0, 1, 0.7607843, 1,
-0.09382159, -1.806384, -3.320364, 0, 1, 0.7647059, 1,
-0.09180534, 2.165163, 0.02246764, 0, 1, 0.772549, 1,
-0.09146143, 0.7632978, -0.3769103, 0, 1, 0.7764706, 1,
-0.09130262, 0.5268031, -0.481692, 0, 1, 0.7843137, 1,
-0.08496083, -1.60221, -2.023989, 0, 1, 0.7882353, 1,
-0.08390162, -0.4930417, -2.079478, 0, 1, 0.7960784, 1,
-0.08239062, 0.3179864, 0.9539521, 0, 1, 0.8039216, 1,
-0.08081314, -0.05265241, -2.597161, 0, 1, 0.8078431, 1,
-0.07802911, -0.2397194, -3.579103, 0, 1, 0.8156863, 1,
-0.07490696, 1.192428, 1.095631, 0, 1, 0.8196079, 1,
-0.07393073, -0.5845126, -4.116875, 0, 1, 0.827451, 1,
-0.07096049, 1.013166, -0.4225829, 0, 1, 0.8313726, 1,
-0.06785139, 1.224026, 0.9057805, 0, 1, 0.8392157, 1,
-0.06388205, 0.237339, -1.484761, 0, 1, 0.8431373, 1,
-0.06368656, -0.4089865, -0.9189177, 0, 1, 0.8509804, 1,
-0.06289601, -0.130977, -3.704451, 0, 1, 0.854902, 1,
-0.05999087, 0.8266379, 0.7856059, 0, 1, 0.8627451, 1,
-0.05913305, -0.3032945, -3.484752, 0, 1, 0.8666667, 1,
-0.05878391, -0.712505, -3.122562, 0, 1, 0.8745098, 1,
-0.05845667, 0.735369, -0.7626846, 0, 1, 0.8784314, 1,
-0.05778652, -1.333351, -4.194506, 0, 1, 0.8862745, 1,
-0.05478762, -1.12881, -3.502782, 0, 1, 0.8901961, 1,
-0.04253219, -0.1117673, -1.241464, 0, 1, 0.8980392, 1,
-0.04198391, 0.3974545, 0.6040871, 0, 1, 0.9058824, 1,
-0.04006591, 0.1394253, -0.6148192, 0, 1, 0.9098039, 1,
-0.03785016, 0.7266775, 0.5191166, 0, 1, 0.9176471, 1,
-0.03605427, 0.03248101, -0.654968, 0, 1, 0.9215686, 1,
-0.03445551, 0.2197926, 0.1561153, 0, 1, 0.9294118, 1,
-0.03318113, -2.649446, -3.693027, 0, 1, 0.9333333, 1,
-0.03089805, -0.1010906, -2.690248, 0, 1, 0.9411765, 1,
-0.02974654, -0.2210463, -3.165668, 0, 1, 0.945098, 1,
-0.02785243, -1.791448, -1.224333, 0, 1, 0.9529412, 1,
-0.02335963, 1.172422, -0.5319339, 0, 1, 0.9568627, 1,
-0.0224005, 1.14441, -2.351326, 0, 1, 0.9647059, 1,
-0.01452059, 1.610976, 0.3266949, 0, 1, 0.9686275, 1,
-0.01372571, -0.4211959, -3.308893, 0, 1, 0.9764706, 1,
-0.005652862, 0.05513618, -1.215199, 0, 1, 0.9803922, 1,
-0.003798486, -1.413646, -4.514466, 0, 1, 0.9882353, 1,
-0.002593473, -0.9704781, -4.183182, 0, 1, 0.9921569, 1,
-0.002283604, 0.6139304, -0.6155645, 0, 1, 1, 1,
-0.001541636, -2.126301, -1.510411, 0, 0.9921569, 1, 1,
0.001580206, 1.446156, 0.06742004, 0, 0.9882353, 1, 1,
0.005141993, 0.2108185, -0.325855, 0, 0.9803922, 1, 1,
0.00519774, -0.3466445, 2.553191, 0, 0.9764706, 1, 1,
0.007716555, -1.493011, 2.436225, 0, 0.9686275, 1, 1,
0.01283873, -1.301498, 2.970346, 0, 0.9647059, 1, 1,
0.01780171, 1.286154, -1.559887, 0, 0.9568627, 1, 1,
0.01941625, -0.8296677, 2.55724, 0, 0.9529412, 1, 1,
0.02918315, 1.000756, 1.041542, 0, 0.945098, 1, 1,
0.03572503, -1.255746, 3.741158, 0, 0.9411765, 1, 1,
0.03678761, -0.7228471, 2.394699, 0, 0.9333333, 1, 1,
0.03719342, -0.3207607, 2.325242, 0, 0.9294118, 1, 1,
0.03836431, 0.03428271, -0.6145817, 0, 0.9215686, 1, 1,
0.03946956, 0.6500838, 0.9792675, 0, 0.9176471, 1, 1,
0.04108996, -0.8526744, 3.816657, 0, 0.9098039, 1, 1,
0.04322029, -0.6524854, 1.561081, 0, 0.9058824, 1, 1,
0.04633548, -0.5264584, 3.534912, 0, 0.8980392, 1, 1,
0.04761977, 0.1571158, 0.8599412, 0, 0.8901961, 1, 1,
0.05021591, 0.8250007, -1.190417, 0, 0.8862745, 1, 1,
0.05223639, -0.8919806, 3.738872, 0, 0.8784314, 1, 1,
0.05877332, -0.1418111, 3.702137, 0, 0.8745098, 1, 1,
0.06188557, -1.469586, 1.656172, 0, 0.8666667, 1, 1,
0.06220296, -0.23592, 4.06582, 0, 0.8627451, 1, 1,
0.06310675, -1.076546, 3.754048, 0, 0.854902, 1, 1,
0.07010141, 0.3951521, -0.7874774, 0, 0.8509804, 1, 1,
0.07191949, -0.1382832, 0.9753464, 0, 0.8431373, 1, 1,
0.07392919, 0.7255911, 1.276891, 0, 0.8392157, 1, 1,
0.07481378, -0.06910986, 1.545262, 0, 0.8313726, 1, 1,
0.07688011, -0.4901326, 3.714905, 0, 0.827451, 1, 1,
0.07969535, 1.379299, 0.8707466, 0, 0.8196079, 1, 1,
0.08351088, 0.09041686, 0.5248278, 0, 0.8156863, 1, 1,
0.0837368, 0.2538435, -0.08059745, 0, 0.8078431, 1, 1,
0.09100027, 1.030614, -0.4143994, 0, 0.8039216, 1, 1,
0.09238906, 1.299934, 1.037108, 0, 0.7960784, 1, 1,
0.09674224, 0.8322579, 0.456974, 0, 0.7882353, 1, 1,
0.1006656, 2.025958, 1.292907, 0, 0.7843137, 1, 1,
0.105786, -0.06785838, 1.061619, 0, 0.7764706, 1, 1,
0.108236, -1.216173, 4.108548, 0, 0.772549, 1, 1,
0.1087905, -0.01121588, 1.036093, 0, 0.7647059, 1, 1,
0.1090397, 0.4333668, -0.5946717, 0, 0.7607843, 1, 1,
0.1107575, -1.606644, 2.235476, 0, 0.7529412, 1, 1,
0.1107908, -0.1948697, 3.493207, 0, 0.7490196, 1, 1,
0.1126245, 1.677832, 0.4909337, 0, 0.7411765, 1, 1,
0.1130575, -0.6144539, 3.177812, 0, 0.7372549, 1, 1,
0.1136188, 0.8672106, -1.893844, 0, 0.7294118, 1, 1,
0.1162163, -0.8553239, 2.802332, 0, 0.7254902, 1, 1,
0.1170072, 0.7101106, 0.6579531, 0, 0.7176471, 1, 1,
0.1173427, -0.3562638, 0.8995728, 0, 0.7137255, 1, 1,
0.1203195, -0.05474341, 1.324111, 0, 0.7058824, 1, 1,
0.1310331, 0.8414089, 0.8492555, 0, 0.6980392, 1, 1,
0.1337429, -0.5491507, 0.8798416, 0, 0.6941177, 1, 1,
0.1355298, -0.7848837, 3.650919, 0, 0.6862745, 1, 1,
0.1416213, 0.7323244, 1.636318, 0, 0.682353, 1, 1,
0.1463671, 0.1276671, 0.7741452, 0, 0.6745098, 1, 1,
0.1568371, -0.4038081, 2.904569, 0, 0.6705883, 1, 1,
0.1584495, -0.6679589, 2.875556, 0, 0.6627451, 1, 1,
0.1647398, -0.8749371, 2.658669, 0, 0.6588235, 1, 1,
0.1654815, -1.150174, 2.486011, 0, 0.6509804, 1, 1,
0.1656908, -1.355876, 5.049945, 0, 0.6470588, 1, 1,
0.1662107, -1.82327, 3.200553, 0, 0.6392157, 1, 1,
0.1664351, -0.9343044, 3.442347, 0, 0.6352941, 1, 1,
0.1681918, -2.380647, 2.735457, 0, 0.627451, 1, 1,
0.1771636, -0.475473, 2.619935, 0, 0.6235294, 1, 1,
0.1774905, -0.4692084, 1.830177, 0, 0.6156863, 1, 1,
0.1792982, 0.3996529, 1.245687, 0, 0.6117647, 1, 1,
0.17984, 0.5040159, 0.3335753, 0, 0.6039216, 1, 1,
0.1821712, 0.1093323, 0.2746771, 0, 0.5960785, 1, 1,
0.1865149, -1.426781, 2.339836, 0, 0.5921569, 1, 1,
0.1867766, 0.2421269, -0.8335679, 0, 0.5843138, 1, 1,
0.1888001, 0.1224173, 1.852012, 0, 0.5803922, 1, 1,
0.1917067, 0.009862381, 2.296737, 0, 0.572549, 1, 1,
0.1931626, -1.092483, 3.393894, 0, 0.5686275, 1, 1,
0.1963848, 1.396008, -2.073735, 0, 0.5607843, 1, 1,
0.1996928, -0.601589, 2.099829, 0, 0.5568628, 1, 1,
0.2045695, 0.654435, 0.6112673, 0, 0.5490196, 1, 1,
0.2051159, -1.228009, 4.566914, 0, 0.5450981, 1, 1,
0.2077966, 1.470779, -0.07029898, 0, 0.5372549, 1, 1,
0.2170831, -0.03562233, 2.06321, 0, 0.5333334, 1, 1,
0.2222222, 0.9411877, 0.6267931, 0, 0.5254902, 1, 1,
0.223494, -0.5912632, 4.380568, 0, 0.5215687, 1, 1,
0.2259216, -1.863915, 3.021018, 0, 0.5137255, 1, 1,
0.2327795, -0.3273654, 1.64701, 0, 0.509804, 1, 1,
0.2416598, 1.439105, 1.949308, 0, 0.5019608, 1, 1,
0.2439936, 1.355633, 0.4102408, 0, 0.4941176, 1, 1,
0.2495836, 0.1383643, 1.288144, 0, 0.4901961, 1, 1,
0.254395, 0.8916284, -0.6304317, 0, 0.4823529, 1, 1,
0.2580304, -0.7924909, 2.576482, 0, 0.4784314, 1, 1,
0.2621488, -0.1248506, 2.105511, 0, 0.4705882, 1, 1,
0.265569, 0.4039865, 0.6604209, 0, 0.4666667, 1, 1,
0.2686952, 0.8184335, -0.340472, 0, 0.4588235, 1, 1,
0.2732989, 0.0479987, 0.903232, 0, 0.454902, 1, 1,
0.2745889, -0.1462529, 1.867107, 0, 0.4470588, 1, 1,
0.2818216, -0.03119509, 1.318672, 0, 0.4431373, 1, 1,
0.2822393, -0.1321657, 0.9262623, 0, 0.4352941, 1, 1,
0.2877003, 0.6955059, -1.086363, 0, 0.4313726, 1, 1,
0.2903728, 0.1826444, 0.8635607, 0, 0.4235294, 1, 1,
0.2966633, -1.250872, 3.416258, 0, 0.4196078, 1, 1,
0.3011312, -1.019561, 3.274021, 0, 0.4117647, 1, 1,
0.3024699, 0.809268, 0.156302, 0, 0.4078431, 1, 1,
0.3024819, 0.7762136, 1.55152, 0, 0.4, 1, 1,
0.3038901, 0.861829, 0.2816804, 0, 0.3921569, 1, 1,
0.3062711, 2.780639, -0.2287466, 0, 0.3882353, 1, 1,
0.3094368, -0.532331, 1.320557, 0, 0.3803922, 1, 1,
0.3129903, 0.0737661, 0.06649303, 0, 0.3764706, 1, 1,
0.3178201, -0.3716616, 1.173458, 0, 0.3686275, 1, 1,
0.3275755, 0.9192004, -0.1116798, 0, 0.3647059, 1, 1,
0.32871, 1.051135, 1.404399, 0, 0.3568628, 1, 1,
0.3290494, 0.7495776, 0.1677598, 0, 0.3529412, 1, 1,
0.3334115, -0.8873529, 3.346339, 0, 0.345098, 1, 1,
0.3348497, -1.237851, 3.9684, 0, 0.3411765, 1, 1,
0.336594, 0.1641869, 1.119693, 0, 0.3333333, 1, 1,
0.3401428, 0.6294367, 0.6669064, 0, 0.3294118, 1, 1,
0.3403154, 0.2136517, -0.1774392, 0, 0.3215686, 1, 1,
0.3415124, -0.3199303, 1.757178, 0, 0.3176471, 1, 1,
0.3541021, -1.160601, 2.635797, 0, 0.3098039, 1, 1,
0.360524, 0.5641852, -0.01654674, 0, 0.3058824, 1, 1,
0.3617542, -0.0814574, 0.05136828, 0, 0.2980392, 1, 1,
0.3618665, -1.159619, 3.015276, 0, 0.2901961, 1, 1,
0.3630501, -0.02393986, 2.522715, 0, 0.2862745, 1, 1,
0.3648668, 0.6184151, 1.612981, 0, 0.2784314, 1, 1,
0.3662011, 0.2381424, 0.518976, 0, 0.2745098, 1, 1,
0.3676438, -0.5802575, 3.88793, 0, 0.2666667, 1, 1,
0.3696782, -0.196815, 1.618139, 0, 0.2627451, 1, 1,
0.3698282, -0.8053518, 3.597413, 0, 0.254902, 1, 1,
0.3709602, -0.4355834, 0.6830224, 0, 0.2509804, 1, 1,
0.3733329, -1.338401, 2.554054, 0, 0.2431373, 1, 1,
0.3752648, -0.1127522, 2.064818, 0, 0.2392157, 1, 1,
0.3779482, 1.487401, 0.7281572, 0, 0.2313726, 1, 1,
0.3821182, 0.382368, 1.145223, 0, 0.227451, 1, 1,
0.3835813, 0.2712703, 1.271517, 0, 0.2196078, 1, 1,
0.385969, -0.6525033, 3.016311, 0, 0.2156863, 1, 1,
0.3877401, 0.02011659, 2.193359, 0, 0.2078431, 1, 1,
0.3894569, -1.17567, 1.989866, 0, 0.2039216, 1, 1,
0.3920144, -1.61005, 1.384014, 0, 0.1960784, 1, 1,
0.3965279, 0.01496773, 0.4276375, 0, 0.1882353, 1, 1,
0.3984468, -0.01930683, 3.11554, 0, 0.1843137, 1, 1,
0.3984613, -0.6637796, 4.125898, 0, 0.1764706, 1, 1,
0.399596, 0.8958969, -1.206912, 0, 0.172549, 1, 1,
0.4050386, 0.01340229, 1.331891, 0, 0.1647059, 1, 1,
0.4098659, -0.3881979, 1.474231, 0, 0.1607843, 1, 1,
0.4119184, -0.8902712, 1.690588, 0, 0.1529412, 1, 1,
0.4126479, 0.8677696, -0.8219357, 0, 0.1490196, 1, 1,
0.41562, 0.07882198, 0.6071453, 0, 0.1411765, 1, 1,
0.4195221, 1.970711, -0.3872156, 0, 0.1372549, 1, 1,
0.4218781, -0.07935826, 2.6208, 0, 0.1294118, 1, 1,
0.4220444, 1.436761, 1.208902, 0, 0.1254902, 1, 1,
0.4261491, -0.5178334, 1.812018, 0, 0.1176471, 1, 1,
0.4372038, -0.3251587, 2.798149, 0, 0.1137255, 1, 1,
0.4397447, -0.5783517, 1.025327, 0, 0.1058824, 1, 1,
0.441736, 1.012308, -0.7788117, 0, 0.09803922, 1, 1,
0.4464263, -1.600824, 3.401552, 0, 0.09411765, 1, 1,
0.4466268, -0.4855888, 2.952527, 0, 0.08627451, 1, 1,
0.4480464, -2.827358, 3.121226, 0, 0.08235294, 1, 1,
0.4488277, 0.9172571, 1.55423, 0, 0.07450981, 1, 1,
0.4499322, -0.8277395, 2.094555, 0, 0.07058824, 1, 1,
0.451699, 0.0530856, 1.507149, 0, 0.0627451, 1, 1,
0.4523607, 0.2584147, 0.7767419, 0, 0.05882353, 1, 1,
0.453551, 0.564353, 1.755529, 0, 0.05098039, 1, 1,
0.4541942, -0.1507991, 0.4946887, 0, 0.04705882, 1, 1,
0.4544256, -0.1515047, 1.884535, 0, 0.03921569, 1, 1,
0.4548342, -0.3150538, 2.735429, 0, 0.03529412, 1, 1,
0.4551043, 0.09358972, 1.722731, 0, 0.02745098, 1, 1,
0.4554556, -0.5433156, 3.441673, 0, 0.02352941, 1, 1,
0.4563638, -0.1993344, 5.039753, 0, 0.01568628, 1, 1,
0.456539, -1.702761, 2.057202, 0, 0.01176471, 1, 1,
0.4587201, -0.04546582, 2.952119, 0, 0.003921569, 1, 1,
0.4588334, 1.067685, 0.7189071, 0.003921569, 0, 1, 1,
0.4588683, -0.6185296, 3.78215, 0.007843138, 0, 1, 1,
0.4624402, 1.187308, -0.8696584, 0.01568628, 0, 1, 1,
0.4650917, 0.7407938, -0.8130636, 0.01960784, 0, 1, 1,
0.4673999, 0.1629714, 0.9778844, 0.02745098, 0, 1, 1,
0.4705904, 0.4032682, 0.511602, 0.03137255, 0, 1, 1,
0.4761913, -1.43843, 3.93511, 0.03921569, 0, 1, 1,
0.4850313, -0.9805725, 2.681967, 0.04313726, 0, 1, 1,
0.488133, 0.1118433, 0.997027, 0.05098039, 0, 1, 1,
0.4913828, -0.6583172, 0.8930804, 0.05490196, 0, 1, 1,
0.4938688, -0.9678041, 0.726537, 0.0627451, 0, 1, 1,
0.4980243, -0.6502063, 2.231344, 0.06666667, 0, 1, 1,
0.49918, -0.6809463, 1.76281, 0.07450981, 0, 1, 1,
0.5032985, -0.1707437, 2.997806, 0.07843138, 0, 1, 1,
0.5072792, -0.1555011, 3.009033, 0.08627451, 0, 1, 1,
0.5097079, 0.4039691, -0.304078, 0.09019608, 0, 1, 1,
0.509882, -0.2943483, 2.734119, 0.09803922, 0, 1, 1,
0.5108891, -1.748432, 1.188916, 0.1058824, 0, 1, 1,
0.5119193, 1.206951, 1.984901, 0.1098039, 0, 1, 1,
0.518742, 0.3586478, 0.856518, 0.1176471, 0, 1, 1,
0.5240428, 0.389062, 1.917295, 0.1215686, 0, 1, 1,
0.5303122, 0.03359731, 0.7356119, 0.1294118, 0, 1, 1,
0.5358768, 0.7132633, 3.441178, 0.1333333, 0, 1, 1,
0.5380849, 1.91612, 0.6891103, 0.1411765, 0, 1, 1,
0.5430366, 1.15345, 0.7249535, 0.145098, 0, 1, 1,
0.5435627, 1.123045, 1.094001, 0.1529412, 0, 1, 1,
0.5453503, 0.1348854, 1.080088, 0.1568628, 0, 1, 1,
0.546933, 0.3430107, 1.055793, 0.1647059, 0, 1, 1,
0.5479905, -1.284311, 2.326378, 0.1686275, 0, 1, 1,
0.5524233, -0.04883147, 1.743732, 0.1764706, 0, 1, 1,
0.5540823, 0.2352178, 1.017563, 0.1803922, 0, 1, 1,
0.5561357, 0.1711648, 1.676655, 0.1882353, 0, 1, 1,
0.5572622, 1.007895, 1.601857, 0.1921569, 0, 1, 1,
0.5575436, -0.9877667, 3.609232, 0.2, 0, 1, 1,
0.5589538, -1.911672, 3.309576, 0.2078431, 0, 1, 1,
0.558984, -0.7108039, 3.192394, 0.2117647, 0, 1, 1,
0.5629051, -0.6904421, 2.365944, 0.2196078, 0, 1, 1,
0.5654319, 2.176255, -0.2832384, 0.2235294, 0, 1, 1,
0.5662602, 1.282315, -0.2367478, 0.2313726, 0, 1, 1,
0.5796933, -0.2127101, 3.766445, 0.2352941, 0, 1, 1,
0.580071, 1.193731, -0.09256192, 0.2431373, 0, 1, 1,
0.5817643, 1.1244, 0.8322909, 0.2470588, 0, 1, 1,
0.5838186, 1.399445, -0.6075441, 0.254902, 0, 1, 1,
0.5840607, 2.332818, -2.721777, 0.2588235, 0, 1, 1,
0.5902501, 1.137538, 1.065259, 0.2666667, 0, 1, 1,
0.591621, 0.4897407, -0.392564, 0.2705882, 0, 1, 1,
0.592133, 0.4213445, 2.064533, 0.2784314, 0, 1, 1,
0.5921349, 0.4374768, 1.722005, 0.282353, 0, 1, 1,
0.5961302, -0.5065179, 1.076973, 0.2901961, 0, 1, 1,
0.5977913, 2.772362, 1.404926, 0.2941177, 0, 1, 1,
0.6007994, -0.4713092, 1.958925, 0.3019608, 0, 1, 1,
0.6036116, 0.4497491, 0.06173497, 0.3098039, 0, 1, 1,
0.6086247, -0.1311694, 1.929086, 0.3137255, 0, 1, 1,
0.6130151, -0.794086, 3.00609, 0.3215686, 0, 1, 1,
0.6137702, 0.9103776, 0.387748, 0.3254902, 0, 1, 1,
0.6182328, -0.2480497, 2.375174, 0.3333333, 0, 1, 1,
0.6206641, -0.6650444, 2.067554, 0.3372549, 0, 1, 1,
0.6277579, -0.1949436, 3.159127, 0.345098, 0, 1, 1,
0.6294769, -0.05990357, 1.091717, 0.3490196, 0, 1, 1,
0.635157, 0.3325998, 0.3536033, 0.3568628, 0, 1, 1,
0.6364044, 0.2339891, 3.068366, 0.3607843, 0, 1, 1,
0.6426523, 0.1261953, 0.8869139, 0.3686275, 0, 1, 1,
0.6430345, 0.1738874, 1.170678, 0.372549, 0, 1, 1,
0.6465821, -0.6046652, 3.297132, 0.3803922, 0, 1, 1,
0.6471372, -0.5154788, 3.210648, 0.3843137, 0, 1, 1,
0.6510201, 1.058299, 0.02177383, 0.3921569, 0, 1, 1,
0.6516963, -1.521886, 4.453542, 0.3960784, 0, 1, 1,
0.6588528, -1.071565, 4.05427, 0.4039216, 0, 1, 1,
0.659842, -0.5362267, 2.347971, 0.4117647, 0, 1, 1,
0.6602712, -0.29929, 2.567203, 0.4156863, 0, 1, 1,
0.6619301, 0.7614362, -0.1703635, 0.4235294, 0, 1, 1,
0.6624039, -0.3839624, 1.552454, 0.427451, 0, 1, 1,
0.663479, -1.576289, 1.572264, 0.4352941, 0, 1, 1,
0.6719164, -1.933079, 3.03868, 0.4392157, 0, 1, 1,
0.6755567, -0.6190516, 2.300576, 0.4470588, 0, 1, 1,
0.6778908, -1.018246, 1.585022, 0.4509804, 0, 1, 1,
0.6812156, -2.665724, 3.978218, 0.4588235, 0, 1, 1,
0.6822295, -1.345525, 3.350682, 0.4627451, 0, 1, 1,
0.6840152, -0.7441502, 1.47383, 0.4705882, 0, 1, 1,
0.6847388, 0.4135782, 2.485447, 0.4745098, 0, 1, 1,
0.6852596, -0.8257974, 1.807643, 0.4823529, 0, 1, 1,
0.6911982, -0.340132, -0.1470278, 0.4862745, 0, 1, 1,
0.6919497, -0.2295843, 1.573735, 0.4941176, 0, 1, 1,
0.6932048, 0.1746623, 0.3148531, 0.5019608, 0, 1, 1,
0.6953876, 1.092435, 0.0542681, 0.5058824, 0, 1, 1,
0.6995097, -1.061139, 3.784438, 0.5137255, 0, 1, 1,
0.7040607, -0.4005454, 2.639455, 0.5176471, 0, 1, 1,
0.7211159, 0.3424403, 0.434699, 0.5254902, 0, 1, 1,
0.7270249, 0.96578, 1.356275, 0.5294118, 0, 1, 1,
0.7301285, 0.2031973, 0.04633203, 0.5372549, 0, 1, 1,
0.7307265, 0.4694654, 1.215786, 0.5411765, 0, 1, 1,
0.7332094, -0.08230907, -0.01240235, 0.5490196, 0, 1, 1,
0.7439121, 0.1882955, 2.624221, 0.5529412, 0, 1, 1,
0.7444437, -1.111337, 2.532484, 0.5607843, 0, 1, 1,
0.7467719, -1.796315, 1.274614, 0.5647059, 0, 1, 1,
0.75799, 0.6543966, 0.3436476, 0.572549, 0, 1, 1,
0.7592822, -0.06512098, 0.1408119, 0.5764706, 0, 1, 1,
0.7599768, -0.5928715, 0.5732853, 0.5843138, 0, 1, 1,
0.7642002, -1.448182, 2.10037, 0.5882353, 0, 1, 1,
0.7696218, -0.2099191, 1.465807, 0.5960785, 0, 1, 1,
0.7697201, 1.045631, 1.323244, 0.6039216, 0, 1, 1,
0.7714007, 0.0711457, 2.909151, 0.6078432, 0, 1, 1,
0.7789661, 0.5612191, 1.297168, 0.6156863, 0, 1, 1,
0.7797139, 1.637877, 1.0755, 0.6196079, 0, 1, 1,
0.7803023, -1.148062, 3.711498, 0.627451, 0, 1, 1,
0.7847208, -0.8743954, 2.375221, 0.6313726, 0, 1, 1,
0.7849295, 1.087812, 1.012025, 0.6392157, 0, 1, 1,
0.7855833, -0.07816698, 1.358489, 0.6431373, 0, 1, 1,
0.790614, 1.251575, -0.05367215, 0.6509804, 0, 1, 1,
0.7934474, 0.0137783, 0.3572178, 0.654902, 0, 1, 1,
0.7960162, 0.6899134, 2.003964, 0.6627451, 0, 1, 1,
0.7962496, 0.8653361, -1.401047, 0.6666667, 0, 1, 1,
0.8068009, 0.5357134, 1.005122, 0.6745098, 0, 1, 1,
0.8113196, -0.2958833, 3.10473, 0.6784314, 0, 1, 1,
0.8156578, -1.077541, 2.721645, 0.6862745, 0, 1, 1,
0.8227517, -1.166626, 1.288633, 0.6901961, 0, 1, 1,
0.8310958, -1.539814, 3.149348, 0.6980392, 0, 1, 1,
0.8333182, -0.5089153, 2.996544, 0.7058824, 0, 1, 1,
0.8380884, 1.157249, -0.08752819, 0.7098039, 0, 1, 1,
0.8470556, -0.1052488, 1.468184, 0.7176471, 0, 1, 1,
0.8500047, -1.12236, 3.665415, 0.7215686, 0, 1, 1,
0.8502122, 0.2164845, 1.726556, 0.7294118, 0, 1, 1,
0.8567939, 0.4196277, 1.401659, 0.7333333, 0, 1, 1,
0.8598424, 1.319268, 1.420772, 0.7411765, 0, 1, 1,
0.861201, -1.678867, 3.470057, 0.7450981, 0, 1, 1,
0.861314, 1.270447, 2.211198, 0.7529412, 0, 1, 1,
0.8661953, -0.5589917, 2.895205, 0.7568628, 0, 1, 1,
0.8666484, 0.0769605, 0.9686877, 0.7647059, 0, 1, 1,
0.8683675, -1.054054, 3.079181, 0.7686275, 0, 1, 1,
0.8717877, -0.4440801, 0.8426954, 0.7764706, 0, 1, 1,
0.872757, -1.833475, 4.350488, 0.7803922, 0, 1, 1,
0.8798311, 1.446374, -0.1283922, 0.7882353, 0, 1, 1,
0.884971, 2.211385, 0.9215528, 0.7921569, 0, 1, 1,
0.8869857, -0.02916615, 0.414202, 0.8, 0, 1, 1,
0.8967955, -0.2283127, 0.552188, 0.8078431, 0, 1, 1,
0.8975118, 0.5154353, 1.467968, 0.8117647, 0, 1, 1,
0.8997897, 0.6494644, 0.617645, 0.8196079, 0, 1, 1,
0.9006658, -0.03262135, 2.617969, 0.8235294, 0, 1, 1,
0.9030142, -0.6374972, 0.7140538, 0.8313726, 0, 1, 1,
0.9069431, 1.756969, 1.074565, 0.8352941, 0, 1, 1,
0.9239851, -0.08336185, 1.314285, 0.8431373, 0, 1, 1,
0.9248406, 0.3871444, 0.04274604, 0.8470588, 0, 1, 1,
0.9293527, -0.650439, 2.83842, 0.854902, 0, 1, 1,
0.9330251, 1.417748, 0.6329646, 0.8588235, 0, 1, 1,
0.9352144, -0.4165852, 1.264603, 0.8666667, 0, 1, 1,
0.936774, -0.7427776, 3.421222, 0.8705882, 0, 1, 1,
0.941995, 0.6147306, -0.6674079, 0.8784314, 0, 1, 1,
0.9480915, -1.673924, 2.354678, 0.8823529, 0, 1, 1,
0.957256, -0.6931981, 2.678787, 0.8901961, 0, 1, 1,
0.9603311, -0.2490128, 0.9626462, 0.8941177, 0, 1, 1,
0.9626632, 0.9724478, 0.3597978, 0.9019608, 0, 1, 1,
0.9694986, -0.7957528, 1.981273, 0.9098039, 0, 1, 1,
0.9746914, 0.1927897, 1.268963, 0.9137255, 0, 1, 1,
0.9798313, 0.747452, 2.256205, 0.9215686, 0, 1, 1,
0.9948654, 1.202279, 1.482136, 0.9254902, 0, 1, 1,
0.9992794, 0.2782585, 0.9948458, 0.9333333, 0, 1, 1,
1.002828, 1.659938, -0.3207779, 0.9372549, 0, 1, 1,
1.004251, -0.5544859, 4.491318, 0.945098, 0, 1, 1,
1.006165, -0.5401086, 2.061664, 0.9490196, 0, 1, 1,
1.006546, 0.4607658, 1.357025, 0.9568627, 0, 1, 1,
1.017257, 1.397796, 0.5664237, 0.9607843, 0, 1, 1,
1.020054, -0.4649413, 1.420285, 0.9686275, 0, 1, 1,
1.021426, 0.5691994, 0.7760141, 0.972549, 0, 1, 1,
1.042175, 0.8657464, -0.9052073, 0.9803922, 0, 1, 1,
1.047847, 0.1428199, 2.159716, 0.9843137, 0, 1, 1,
1.050265, 1.522937, 0.7462943, 0.9921569, 0, 1, 1,
1.057441, 1.052129, 2.628452, 0.9960784, 0, 1, 1,
1.064601, -1.325932, 4.990423, 1, 0, 0.9960784, 1,
1.065665, -0.09977876, 2.607114, 1, 0, 0.9882353, 1,
1.07682, -0.07425363, 1.825592, 1, 0, 0.9843137, 1,
1.079696, 0.1623976, 2.600098, 1, 0, 0.9764706, 1,
1.082007, -0.1264748, 3.31189, 1, 0, 0.972549, 1,
1.082517, -1.770393, 1.370322, 1, 0, 0.9647059, 1,
1.092374, 0.08612099, 0.1127392, 1, 0, 0.9607843, 1,
1.104754, -0.7473716, 0.6689485, 1, 0, 0.9529412, 1,
1.11046, -0.841359, 2.373783, 1, 0, 0.9490196, 1,
1.114552, 0.3657491, 1.569155, 1, 0, 0.9411765, 1,
1.116738, 1.019748, 1.249345, 1, 0, 0.9372549, 1,
1.118934, -1.143342, 2.511713, 1, 0, 0.9294118, 1,
1.122133, -0.397153, 1.964175, 1, 0, 0.9254902, 1,
1.126869, -0.8192669, 4.753767, 1, 0, 0.9176471, 1,
1.127497, 1.035784, 2.166898, 1, 0, 0.9137255, 1,
1.134212, -0.2375719, 1.345394, 1, 0, 0.9058824, 1,
1.134741, 1.197592, 1.764105, 1, 0, 0.9019608, 1,
1.138955, -0.3207098, 2.095826, 1, 0, 0.8941177, 1,
1.144275, 2.028614, 0.3260592, 1, 0, 0.8862745, 1,
1.14619, 0.5558919, 0.4746528, 1, 0, 0.8823529, 1,
1.153312, -0.393527, 3.443234, 1, 0, 0.8745098, 1,
1.155068, 1.232147, 1.442292, 1, 0, 0.8705882, 1,
1.155656, 0.7766032, 2.224793, 1, 0, 0.8627451, 1,
1.161429, 0.525368, 0.9333707, 1, 0, 0.8588235, 1,
1.164022, 0.8317578, 1.28231, 1, 0, 0.8509804, 1,
1.168601, -0.07231144, 1.702613, 1, 0, 0.8470588, 1,
1.172072, 0.6352677, 3.373939, 1, 0, 0.8392157, 1,
1.173052, -0.4501038, 1.740878, 1, 0, 0.8352941, 1,
1.180874, 1.553437, 2.661865, 1, 0, 0.827451, 1,
1.181065, -0.6593334, 2.423664, 1, 0, 0.8235294, 1,
1.183642, 0.04751783, 1.418571, 1, 0, 0.8156863, 1,
1.192043, 0.4083187, 1.679325, 1, 0, 0.8117647, 1,
1.194798, -0.7108859, 0.8415137, 1, 0, 0.8039216, 1,
1.199437, -0.9247785, 1.662924, 1, 0, 0.7960784, 1,
1.20046, 0.4428808, 2.219056, 1, 0, 0.7921569, 1,
1.20924, -1.520192, 0.2402635, 1, 0, 0.7843137, 1,
1.217754, -0.2082934, 1.062499, 1, 0, 0.7803922, 1,
1.222958, -0.9504207, 3.019298, 1, 0, 0.772549, 1,
1.227254, -0.9550833, 1.660231, 1, 0, 0.7686275, 1,
1.228623, 0.6452532, 2.349177, 1, 0, 0.7607843, 1,
1.23103, -1.18659, 2.974051, 1, 0, 0.7568628, 1,
1.243604, -1.970267, 3.023969, 1, 0, 0.7490196, 1,
1.26625, -0.7530444, 1.59755, 1, 0, 0.7450981, 1,
1.267126, 0.4475369, -0.8574665, 1, 0, 0.7372549, 1,
1.270853, -0.6293821, 0.8351234, 1, 0, 0.7333333, 1,
1.272253, -0.2746795, 1.223464, 1, 0, 0.7254902, 1,
1.281599, 0.36995, 0.6163979, 1, 0, 0.7215686, 1,
1.282036, -1.607745, 2.984318, 1, 0, 0.7137255, 1,
1.283211, 0.2501886, 0.8103015, 1, 0, 0.7098039, 1,
1.286055, 0.4907472, 2.243454, 1, 0, 0.7019608, 1,
1.294748, -0.403319, 2.365909, 1, 0, 0.6941177, 1,
1.31536, -0.543128, 1.118828, 1, 0, 0.6901961, 1,
1.31723, 0.7438698, 2.847156, 1, 0, 0.682353, 1,
1.317511, -0.3926286, 1.812849, 1, 0, 0.6784314, 1,
1.318992, -0.9653788, 1.853962, 1, 0, 0.6705883, 1,
1.321834, -1.204302, 0.6983206, 1, 0, 0.6666667, 1,
1.333672, 1.180833, 1.053939, 1, 0, 0.6588235, 1,
1.340569, 0.427878, 1.198153, 1, 0, 0.654902, 1,
1.342631, -1.033103, 2.003798, 1, 0, 0.6470588, 1,
1.344517, 1.472395, -1.137121, 1, 0, 0.6431373, 1,
1.347375, -0.1827832, 2.702814, 1, 0, 0.6352941, 1,
1.356456, -0.8884885, 1.617608, 1, 0, 0.6313726, 1,
1.357985, -0.4322901, 2.221631, 1, 0, 0.6235294, 1,
1.363947, 0.5143447, 0.3680905, 1, 0, 0.6196079, 1,
1.373296, -0.05745153, 1.906548, 1, 0, 0.6117647, 1,
1.374451, -0.9455661, 2.378544, 1, 0, 0.6078432, 1,
1.3857, 0.5937415, 1.110606, 1, 0, 0.6, 1,
1.386266, 0.8026321, 2.237972, 1, 0, 0.5921569, 1,
1.388595, -1.463051, 3.079474, 1, 0, 0.5882353, 1,
1.392752, -0.2391813, 1.189341, 1, 0, 0.5803922, 1,
1.398741, 0.1084845, 2.377296, 1, 0, 0.5764706, 1,
1.407158, -0.6252936, 1.954412, 1, 0, 0.5686275, 1,
1.408645, -1.541912, 1.185158, 1, 0, 0.5647059, 1,
1.42051, -0.8816354, 2.858593, 1, 0, 0.5568628, 1,
1.432293, 0.4879175, 1.99331, 1, 0, 0.5529412, 1,
1.438106, -0.7448418, 0.4050839, 1, 0, 0.5450981, 1,
1.439193, -0.3070419, 1.430197, 1, 0, 0.5411765, 1,
1.439936, -0.3566916, 0.1986336, 1, 0, 0.5333334, 1,
1.44374, -1.276095, 3.352625, 1, 0, 0.5294118, 1,
1.448295, -0.09006092, 0.5529323, 1, 0, 0.5215687, 1,
1.456182, 0.3663538, 2.404818, 1, 0, 0.5176471, 1,
1.459902, -1.167386, 2.604036, 1, 0, 0.509804, 1,
1.462716, -0.8276437, 0.3850576, 1, 0, 0.5058824, 1,
1.472955, 0.6829423, 0.9806323, 1, 0, 0.4980392, 1,
1.474494, -1.070156, 2.121828, 1, 0, 0.4901961, 1,
1.477353, 0.1081205, 0.582225, 1, 0, 0.4862745, 1,
1.48127, -1.636026, 3.46453, 1, 0, 0.4784314, 1,
1.489354, 0.464465, 0.8518938, 1, 0, 0.4745098, 1,
1.490187, 1.720617, 0.5787224, 1, 0, 0.4666667, 1,
1.494573, -0.7515128, 2.137267, 1, 0, 0.4627451, 1,
1.497183, 1.751363, 0.8938349, 1, 0, 0.454902, 1,
1.51456, 0.3380142, -0.9801798, 1, 0, 0.4509804, 1,
1.522174, -1.710441, 1.01267, 1, 0, 0.4431373, 1,
1.523742, -0.1997946, 3.787118, 1, 0, 0.4392157, 1,
1.524972, -0.2130495, 0.5035918, 1, 0, 0.4313726, 1,
1.528782, 0.3297347, 2.612512, 1, 0, 0.427451, 1,
1.532413, 0.3577624, 1.322808, 1, 0, 0.4196078, 1,
1.542493, -0.2482609, 1.943056, 1, 0, 0.4156863, 1,
1.54408, 0.4079637, 2.237324, 1, 0, 0.4078431, 1,
1.559343, -1.06113, 2.948785, 1, 0, 0.4039216, 1,
1.566842, 0.218628, 0.2533384, 1, 0, 0.3960784, 1,
1.574881, 0.9335964, 1.193589, 1, 0, 0.3882353, 1,
1.585246, 1.356673, 2.072142, 1, 0, 0.3843137, 1,
1.585902, 0.8668792, 2.9578, 1, 0, 0.3764706, 1,
1.5991, 0.5714004, 1.094514, 1, 0, 0.372549, 1,
1.604548, 0.1067122, -0.08733725, 1, 0, 0.3647059, 1,
1.607422, 1.114995, -0.4009214, 1, 0, 0.3607843, 1,
1.610703, 0.0636517, 0.8686593, 1, 0, 0.3529412, 1,
1.610778, 0.5479562, 2.102999, 1, 0, 0.3490196, 1,
1.623704, -0.3224067, 0.7521719, 1, 0, 0.3411765, 1,
1.625754, -0.08479174, 1.875206, 1, 0, 0.3372549, 1,
1.663626, 0.8355516, 0.8085638, 1, 0, 0.3294118, 1,
1.716753, -1.431507, 2.428757, 1, 0, 0.3254902, 1,
1.732623, 0.1008296, 0.4768243, 1, 0, 0.3176471, 1,
1.742849, 0.4598965, 1.014607, 1, 0, 0.3137255, 1,
1.744209, 0.4766139, 1.981046, 1, 0, 0.3058824, 1,
1.746342, -0.4936317, 2.133645, 1, 0, 0.2980392, 1,
1.746486, -1.580978, 3.732826, 1, 0, 0.2941177, 1,
1.747718, -0.4298906, 1.334991, 1, 0, 0.2862745, 1,
1.751139, -2.420016, 1.773361, 1, 0, 0.282353, 1,
1.781222, -0.955042, 3.563859, 1, 0, 0.2745098, 1,
1.785598, -1.047511, 1.539661, 1, 0, 0.2705882, 1,
1.788365, -0.3825859, 2.434344, 1, 0, 0.2627451, 1,
1.817742, 0.4212382, 2.690104, 1, 0, 0.2588235, 1,
1.824667, 0.6679388, 2.47667, 1, 0, 0.2509804, 1,
1.8362, 0.530795, 3.880712, 1, 0, 0.2470588, 1,
1.850434, -0.5646302, 3.204405, 1, 0, 0.2392157, 1,
1.861202, -0.01494558, 1.555778, 1, 0, 0.2352941, 1,
1.869957, -0.5606878, 1.80149, 1, 0, 0.227451, 1,
1.87156, -0.6928826, 0.9419771, 1, 0, 0.2235294, 1,
1.882723, 0.1100395, 0.07225722, 1, 0, 0.2156863, 1,
1.898338, 1.274652, 2.029434, 1, 0, 0.2117647, 1,
1.913283, -1.864885, 1.868663, 1, 0, 0.2039216, 1,
1.917077, 0.7386885, 0.609064, 1, 0, 0.1960784, 1,
1.973443, -2.845592, 2.964317, 1, 0, 0.1921569, 1,
2.012049, 1.416281, -0.4427065, 1, 0, 0.1843137, 1,
2.073334, -0.1946113, 0.3966067, 1, 0, 0.1803922, 1,
2.078449, 0.279929, 0.315681, 1, 0, 0.172549, 1,
2.086404, -0.7860653, 0.3894633, 1, 0, 0.1686275, 1,
2.102609, -0.1434918, 2.160333, 1, 0, 0.1607843, 1,
2.103865, -0.5829991, 1.045397, 1, 0, 0.1568628, 1,
2.105011, 0.1673273, 1.910461, 1, 0, 0.1490196, 1,
2.108012, -0.7313159, 1.709391, 1, 0, 0.145098, 1,
2.129694, -1.376193, 1.943294, 1, 0, 0.1372549, 1,
2.137195, 0.4984952, -0.01394358, 1, 0, 0.1333333, 1,
2.139165, -0.1462372, 1.348632, 1, 0, 0.1254902, 1,
2.1531, -0.1949073, 2.086292, 1, 0, 0.1215686, 1,
2.203387, 0.07992609, 1.843157, 1, 0, 0.1137255, 1,
2.246587, -1.714579, 1.991452, 1, 0, 0.1098039, 1,
2.29094, 2.462726, 0.1182688, 1, 0, 0.1019608, 1,
2.345442, -0.2224, 0.2040404, 1, 0, 0.09411765, 1,
2.345451, 0.6286214, 2.578878, 1, 0, 0.09019608, 1,
2.364299, -1.31211, 1.97409, 1, 0, 0.08235294, 1,
2.36998, -0.2801985, 1.593916, 1, 0, 0.07843138, 1,
2.406807, -0.7424711, 1.09703, 1, 0, 0.07058824, 1,
2.40742, 0.4358584, 1.481702, 1, 0, 0.06666667, 1,
2.424742, 0.50975, 0.4138153, 1, 0, 0.05882353, 1,
2.456414, 0.7976106, 1.214971, 1, 0, 0.05490196, 1,
2.520204, -0.4104269, 1.357518, 1, 0, 0.04705882, 1,
2.596015, 1.875199, 1.906747, 1, 0, 0.04313726, 1,
2.59895, -1.09372, 1.450349, 1, 0, 0.03529412, 1,
2.63519, 0.8751258, -0.9039464, 1, 0, 0.03137255, 1,
2.682803, -1.324657, 1.718895, 1, 0, 0.02352941, 1,
2.72733, -0.3912888, 0.4952278, 1, 0, 0.01960784, 1,
2.796733, 0.1172383, 1.042283, 1, 0, 0.01176471, 1,
3.250124, 0.5568208, 0.6983399, 1, 0, 0.007843138, 1
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
0.2950541, -4.44197, -6.677118, 0, -0.5, 0.5, 0.5,
0.2950541, -4.44197, -6.677118, 1, -0.5, 0.5, 0.5,
0.2950541, -4.44197, -6.677118, 1, 1.5, 0.5, 0.5,
0.2950541, -4.44197, -6.677118, 0, 1.5, 0.5, 0.5
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
-3.661784, -0.225248, -6.677118, 0, -0.5, 0.5, 0.5,
-3.661784, -0.225248, -6.677118, 1, -0.5, 0.5, 0.5,
-3.661784, -0.225248, -6.677118, 1, 1.5, 0.5, 0.5,
-3.661784, -0.225248, -6.677118, 0, 1.5, 0.5, 0.5
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
-3.661784, -4.44197, 0.03623676, 0, -0.5, 0.5, 0.5,
-3.661784, -4.44197, 0.03623676, 1, -0.5, 0.5, 0.5,
-3.661784, -4.44197, 0.03623676, 1, 1.5, 0.5, 0.5,
-3.661784, -4.44197, 0.03623676, 0, 1.5, 0.5, 0.5
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
-2, -3.46888, -5.127882,
3, -3.46888, -5.127882,
-2, -3.46888, -5.127882,
-2, -3.631062, -5.386088,
-1, -3.46888, -5.127882,
-1, -3.631062, -5.386088,
0, -3.46888, -5.127882,
0, -3.631062, -5.386088,
1, -3.46888, -5.127882,
1, -3.631062, -5.386088,
2, -3.46888, -5.127882,
2, -3.631062, -5.386088,
3, -3.46888, -5.127882,
3, -3.631062, -5.386088
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
-2, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
-2, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
-2, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
-2, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5,
-1, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
-1, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
-1, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
-1, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5,
0, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
0, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
0, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
0, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5,
1, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
1, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
1, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
1, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5,
2, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
2, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
2, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
2, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5,
3, -3.955425, -5.902501, 0, -0.5, 0.5, 0.5,
3, -3.955425, -5.902501, 1, -0.5, 0.5, 0.5,
3, -3.955425, -5.902501, 1, 1.5, 0.5, 0.5,
3, -3.955425, -5.902501, 0, 1.5, 0.5, 0.5
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
-2.748668, -3, -5.127882,
-2.748668, 2, -5.127882,
-2.748668, -3, -5.127882,
-2.900854, -3, -5.386088,
-2.748668, -2, -5.127882,
-2.900854, -2, -5.386088,
-2.748668, -1, -5.127882,
-2.900854, -1, -5.386088,
-2.748668, 0, -5.127882,
-2.900854, 0, -5.386088,
-2.748668, 1, -5.127882,
-2.900854, 1, -5.386088,
-2.748668, 2, -5.127882,
-2.900854, 2, -5.386088
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
"2"
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
-3.205226, -3, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, -3, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, -3, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, -3, -5.902501, 0, 1.5, 0.5, 0.5,
-3.205226, -2, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, -2, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, -2, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, -2, -5.902501, 0, 1.5, 0.5, 0.5,
-3.205226, -1, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, -1, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, -1, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, -1, -5.902501, 0, 1.5, 0.5, 0.5,
-3.205226, 0, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, 0, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, 0, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, 0, -5.902501, 0, 1.5, 0.5, 0.5,
-3.205226, 1, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, 1, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, 1, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, 1, -5.902501, 0, 1.5, 0.5, 0.5,
-3.205226, 2, -5.902501, 0, -0.5, 0.5, 0.5,
-3.205226, 2, -5.902501, 1, -0.5, 0.5, 0.5,
-3.205226, 2, -5.902501, 1, 1.5, 0.5, 0.5,
-3.205226, 2, -5.902501, 0, 1.5, 0.5, 0.5
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
-2.748668, -3.46888, -4,
-2.748668, -3.46888, 4,
-2.748668, -3.46888, -4,
-2.900854, -3.631062, -4,
-2.748668, -3.46888, -2,
-2.900854, -3.631062, -2,
-2.748668, -3.46888, 0,
-2.900854, -3.631062, 0,
-2.748668, -3.46888, 2,
-2.900854, -3.631062, 2,
-2.748668, -3.46888, 4,
-2.900854, -3.631062, 4
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
-3.205226, -3.955425, -4, 0, -0.5, 0.5, 0.5,
-3.205226, -3.955425, -4, 1, -0.5, 0.5, 0.5,
-3.205226, -3.955425, -4, 1, 1.5, 0.5, 0.5,
-3.205226, -3.955425, -4, 0, 1.5, 0.5, 0.5,
-3.205226, -3.955425, -2, 0, -0.5, 0.5, 0.5,
-3.205226, -3.955425, -2, 1, -0.5, 0.5, 0.5,
-3.205226, -3.955425, -2, 1, 1.5, 0.5, 0.5,
-3.205226, -3.955425, -2, 0, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 0, 0, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 0, 1, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 0, 1, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 0, 0, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 2, 0, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 2, 1, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 2, 1, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 2, 0, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 4, 0, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 4, 1, -0.5, 0.5, 0.5,
-3.205226, -3.955425, 4, 1, 1.5, 0.5, 0.5,
-3.205226, -3.955425, 4, 0, 1.5, 0.5, 0.5
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
-2.748668, -3.46888, -5.127882,
-2.748668, 3.018384, -5.127882,
-2.748668, -3.46888, 5.200356,
-2.748668, 3.018384, 5.200356,
-2.748668, -3.46888, -5.127882,
-2.748668, -3.46888, 5.200356,
-2.748668, 3.018384, -5.127882,
-2.748668, 3.018384, 5.200356,
-2.748668, -3.46888, -5.127882,
3.338776, -3.46888, -5.127882,
-2.748668, -3.46888, 5.200356,
3.338776, -3.46888, 5.200356,
-2.748668, 3.018384, -5.127882,
3.338776, 3.018384, -5.127882,
-2.748668, 3.018384, 5.200356,
3.338776, 3.018384, 5.200356,
3.338776, -3.46888, -5.127882,
3.338776, 3.018384, -5.127882,
3.338776, -3.46888, 5.200356,
3.338776, 3.018384, 5.200356,
3.338776, -3.46888, -5.127882,
3.338776, -3.46888, 5.200356,
3.338776, 3.018384, -5.127882,
3.338776, 3.018384, 5.200356
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
var radius = 7.278884;
var distance = 32.38458;
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
mvMatrix.translate( -0.2950541, 0.225248, -0.03623676 );
mvMatrix.scale( 1.292837, 1.213157, 0.7619956 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.38458);
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
3-methoxy-6-phenyl-2<-read.table("3-methoxy-6-phenyl-2.xyz")
```

```
## Error in read.table("3-methoxy-6-phenyl-2.xyz"): no lines available in input
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
-2.660016, 0.5989268, -0.1859623, 0, 0, 1, 1, 1,
-2.647438, -0.1131312, -1.576735, 1, 0, 0, 1, 1,
-2.56583, 0.6273289, -1.551617, 1, 0, 0, 1, 1,
-2.4525, 0.4549758, -1.024832, 1, 0, 0, 1, 1,
-2.410826, -0.8384452, 0.211258, 1, 0, 0, 1, 1,
-2.366387, 1.084412, -1.77784, 1, 0, 0, 1, 1,
-2.338351, 0.2531629, -1.795388, 0, 0, 0, 1, 1,
-2.332943, 0.6790292, 0.6023443, 0, 0, 0, 1, 1,
-2.313973, 1.337009, -1.446544, 0, 0, 0, 1, 1,
-2.31098, -1.368658, -3.30628, 0, 0, 0, 1, 1,
-2.307178, -0.4106276, -1.544799, 0, 0, 0, 1, 1,
-2.295255, -0.4524923, -0.4698473, 0, 0, 0, 1, 1,
-2.245773, 1.145736, -0.2630005, 0, 0, 0, 1, 1,
-2.196047, -0.8347999, -1.457065, 1, 1, 1, 1, 1,
-2.151934, 0.3710406, -0.2211207, 1, 1, 1, 1, 1,
-2.132982, -1.395658, -3.197777, 1, 1, 1, 1, 1,
-2.065792, -0.2317881, -2.983659, 1, 1, 1, 1, 1,
-2.045402, -0.5829245, -0.6972091, 1, 1, 1, 1, 1,
-2.029953, -0.3108276, -2.504262, 1, 1, 1, 1, 1,
-2.019046, 1.266196, -2.577443, 1, 1, 1, 1, 1,
-1.986433, -1.372003, -2.707932, 1, 1, 1, 1, 1,
-1.979429, 2.254961, 0.03858391, 1, 1, 1, 1, 1,
-1.973229, -0.988368, -1.148599, 1, 1, 1, 1, 1,
-1.949358, -0.5734962, -2.184013, 1, 1, 1, 1, 1,
-1.94803, -0.4834192, -0.4400763, 1, 1, 1, 1, 1,
-1.947512, 0.8824682, -0.515111, 1, 1, 1, 1, 1,
-1.930725, -0.3037147, -1.288984, 1, 1, 1, 1, 1,
-1.918668, -1.131688, -1.808973, 1, 1, 1, 1, 1,
-1.909147, -0.07764202, -3.342354, 0, 0, 1, 1, 1,
-1.909101, -1.150883, -2.349272, 1, 0, 0, 1, 1,
-1.908549, 0.3127636, -3.39543, 1, 0, 0, 1, 1,
-1.876869, 0.1617861, -0.4967973, 1, 0, 0, 1, 1,
-1.874262, -0.4076506, -1.294899, 1, 0, 0, 1, 1,
-1.855131, 1.534346, -1.447731, 1, 0, 0, 1, 1,
-1.852828, -0.7249234, 0.1984652, 0, 0, 0, 1, 1,
-1.84351, 1.08713, -1.933554, 0, 0, 0, 1, 1,
-1.802898, -0.2754238, -0.6660095, 0, 0, 0, 1, 1,
-1.755887, 0.1488649, -1.446463, 0, 0, 0, 1, 1,
-1.755631, -0.1862743, -2.227845, 0, 0, 0, 1, 1,
-1.754346, -0.1476994, -2.560887, 0, 0, 0, 1, 1,
-1.75409, -0.2494391, -0.5367551, 0, 0, 0, 1, 1,
-1.743591, 1.335966, 1.247696, 1, 1, 1, 1, 1,
-1.735503, -0.4648733, -2.759284, 1, 1, 1, 1, 1,
-1.73472, -0.4308614, -1.974423, 1, 1, 1, 1, 1,
-1.726319, -0.1949384, -1.12363, 1, 1, 1, 1, 1,
-1.712564, 0.2665346, 0.4770959, 1, 1, 1, 1, 1,
-1.70795, 0.2069468, -2.573787, 1, 1, 1, 1, 1,
-1.706972, -0.3789733, -0.4956549, 1, 1, 1, 1, 1,
-1.701694, 2.453726, -1.392838, 1, 1, 1, 1, 1,
-1.697296, -0.07359353, -1.905977, 1, 1, 1, 1, 1,
-1.694661, 1.352097, 1.36681, 1, 1, 1, 1, 1,
-1.693992, 0.8038433, -2.739096, 1, 1, 1, 1, 1,
-1.691332, -0.04277976, -0.9020355, 1, 1, 1, 1, 1,
-1.6872, -0.02003703, -4.59402, 1, 1, 1, 1, 1,
-1.686512, 1.20902, -2.629098, 1, 1, 1, 1, 1,
-1.678045, 0.9099224, -2.442466, 1, 1, 1, 1, 1,
-1.662864, -0.1321982, -0.9806252, 0, 0, 1, 1, 1,
-1.655498, 1.971058, 1.050791, 1, 0, 0, 1, 1,
-1.653371, 1.215666, -2.906411, 1, 0, 0, 1, 1,
-1.63687, -0.9692513, -3.254623, 1, 0, 0, 1, 1,
-1.636147, 0.5323313, -0.2280883, 1, 0, 0, 1, 1,
-1.628286, 0.6970391, -0.6669955, 1, 0, 0, 1, 1,
-1.625573, -1.060444, -0.5240511, 0, 0, 0, 1, 1,
-1.618501, -0.1377609, -1.616089, 0, 0, 0, 1, 1,
-1.618071, -1.654971, -2.803107, 0, 0, 0, 1, 1,
-1.614074, -0.5247898, -0.2588141, 0, 0, 0, 1, 1,
-1.605808, 1.175067, -1.957751, 0, 0, 0, 1, 1,
-1.603659, 1.583812, 0.9301415, 0, 0, 0, 1, 1,
-1.599752, -1.301312, -1.653924, 0, 0, 0, 1, 1,
-1.591603, -0.08639994, -3.984443, 1, 1, 1, 1, 1,
-1.575418, 0.9859453, -1.729528, 1, 1, 1, 1, 1,
-1.574483, 0.03083201, -0.1671574, 1, 1, 1, 1, 1,
-1.570288, -0.8045561, -2.868382, 1, 1, 1, 1, 1,
-1.536937, 0.5130196, -1.43642, 1, 1, 1, 1, 1,
-1.511593, 0.7596625, -1.492162, 1, 1, 1, 1, 1,
-1.50597, -1.501072, -2.073554, 1, 1, 1, 1, 1,
-1.496525, 0.5707462, -1.127114, 1, 1, 1, 1, 1,
-1.496116, -0.4129654, -2.115177, 1, 1, 1, 1, 1,
-1.480475, 0.3594039, -1.81072, 1, 1, 1, 1, 1,
-1.467307, 2.410774, -1.387786, 1, 1, 1, 1, 1,
-1.462404, -1.938514, -1.888632, 1, 1, 1, 1, 1,
-1.461961, -0.5845644, -2.928372, 1, 1, 1, 1, 1,
-1.461002, 0.3193671, -1.387533, 1, 1, 1, 1, 1,
-1.459576, 1.104805, 0.636643, 1, 1, 1, 1, 1,
-1.454443, -0.4490259, -0.3367921, 0, 0, 1, 1, 1,
-1.452146, 2.923909, 0.3429911, 1, 0, 0, 1, 1,
-1.447739, -0.8430325, -2.729545, 1, 0, 0, 1, 1,
-1.442837, 1.274513, -1.733607, 1, 0, 0, 1, 1,
-1.437999, 0.04337728, -1.604392, 1, 0, 0, 1, 1,
-1.433447, -1.023311, -2.846094, 1, 0, 0, 1, 1,
-1.425304, 1.813315, 0.4313261, 0, 0, 0, 1, 1,
-1.41729, -0.5056518, -1.04284, 0, 0, 0, 1, 1,
-1.389789, -0.3054158, -1.364778, 0, 0, 0, 1, 1,
-1.388554, -0.6987073, -3.736732, 0, 0, 0, 1, 1,
-1.381572, 0.168668, -2.055511, 0, 0, 0, 1, 1,
-1.381084, 0.3330976, -1.725268, 0, 0, 0, 1, 1,
-1.380705, -0.6582416, -1.559854, 0, 0, 0, 1, 1,
-1.379955, 1.106409, -0.1664035, 1, 1, 1, 1, 1,
-1.379496, 0.08755098, -1.038561, 1, 1, 1, 1, 1,
-1.378547, 0.7041195, -1.904109, 1, 1, 1, 1, 1,
-1.375628, 1.324393, -2.584854, 1, 1, 1, 1, 1,
-1.365648, 0.9254994, -1.588968, 1, 1, 1, 1, 1,
-1.365558, -0.8115309, -2.040456, 1, 1, 1, 1, 1,
-1.36218, 1.607362, -0.4250087, 1, 1, 1, 1, 1,
-1.349233, 0.7152365, -1.169782, 1, 1, 1, 1, 1,
-1.3455, -0.5290789, -4.494133, 1, 1, 1, 1, 1,
-1.340467, -0.8017774, -3.923846, 1, 1, 1, 1, 1,
-1.33484, -0.3151206, -2.378119, 1, 1, 1, 1, 1,
-1.325452, 1.574939, -0.7783623, 1, 1, 1, 1, 1,
-1.322532, 0.8677301, -1.226032, 1, 1, 1, 1, 1,
-1.320711, -1.152392, -2.399624, 1, 1, 1, 1, 1,
-1.318912, 0.9403638, -0.1452378, 1, 1, 1, 1, 1,
-1.303697, -0.9169871, -2.992171, 0, 0, 1, 1, 1,
-1.29347, 0.2085611, -1.589233, 1, 0, 0, 1, 1,
-1.289794, -0.3307149, -3.407506, 1, 0, 0, 1, 1,
-1.286845, 0.4402052, -0.8387558, 1, 0, 0, 1, 1,
-1.280378, -0.9912102, -2.466689, 1, 0, 0, 1, 1,
-1.271815, -1.013152, -2.71211, 1, 0, 0, 1, 1,
-1.264962, 0.528114, -0.6347089, 0, 0, 0, 1, 1,
-1.264491, 1.478448, -0.7502691, 0, 0, 0, 1, 1,
-1.252519, -0.8253222, -2.280903, 0, 0, 0, 1, 1,
-1.249898, -0.6951747, -1.946465, 0, 0, 0, 1, 1,
-1.228359, -0.4292353, -2.144863, 0, 0, 0, 1, 1,
-1.227061, 1.002791, -0.04885064, 0, 0, 0, 1, 1,
-1.22679, 0.1284253, -2.261004, 0, 0, 0, 1, 1,
-1.225746, 0.06605417, -2.123335, 1, 1, 1, 1, 1,
-1.22326, -0.0604682, -2.210914, 1, 1, 1, 1, 1,
-1.21782, 0.9195437, 1.345196, 1, 1, 1, 1, 1,
-1.211917, -0.4009482, -3.163377, 1, 1, 1, 1, 1,
-1.208073, 0.8997664, -1.259426, 1, 1, 1, 1, 1,
-1.20425, -0.1051296, -1.058135, 1, 1, 1, 1, 1,
-1.195158, 0.3886449, 0.2793877, 1, 1, 1, 1, 1,
-1.190932, 0.3587963, 0.2582978, 1, 1, 1, 1, 1,
-1.185632, 0.7086778, -0.7371693, 1, 1, 1, 1, 1,
-1.16688, 2.733504, 0.3350034, 1, 1, 1, 1, 1,
-1.166493, 1.762894, -0.1365863, 1, 1, 1, 1, 1,
-1.163491, 0.2086943, -1.422168, 1, 1, 1, 1, 1,
-1.159218, 0.3085049, -0.8283638, 1, 1, 1, 1, 1,
-1.155194, -2.354574, -3.170326, 1, 1, 1, 1, 1,
-1.152297, 1.250236, -1.514967, 1, 1, 1, 1, 1,
-1.146619, -0.9706463, -2.98826, 0, 0, 1, 1, 1,
-1.132744, 1.302143, -0.2039954, 1, 0, 0, 1, 1,
-1.12121, -0.1160759, -2.746647, 1, 0, 0, 1, 1,
-1.120285, -0.5713016, -1.526859, 1, 0, 0, 1, 1,
-1.117598, 0.8652331, -2.039617, 1, 0, 0, 1, 1,
-1.115424, 0.946106, -1.349161, 1, 0, 0, 1, 1,
-1.112235, 0.569734, -0.6940236, 0, 0, 0, 1, 1,
-1.107457, -1.842389, -4.138512, 0, 0, 0, 1, 1,
-1.092346, 0.08417094, -1.881928, 0, 0, 0, 1, 1,
-1.083994, 0.8635171, 0.0024319, 0, 0, 0, 1, 1,
-1.070031, -0.2579014, -1.414632, 0, 0, 0, 1, 1,
-1.061201, 0.2453214, -2.099685, 0, 0, 0, 1, 1,
-1.060122, 0.2136658, -1.60483, 0, 0, 0, 1, 1,
-1.05521, -0.9442874, -1.157647, 1, 1, 1, 1, 1,
-1.051969, -0.3672895, -2.37977, 1, 1, 1, 1, 1,
-1.049261, 0.01529482, -1.684127, 1, 1, 1, 1, 1,
-1.049128, 0.8176292, -2.203269, 1, 1, 1, 1, 1,
-1.046078, 1.09866, 0.5695094, 1, 1, 1, 1, 1,
-1.041195, -1.81081, 0.1264269, 1, 1, 1, 1, 1,
-1.040197, -0.3406462, -3.243802, 1, 1, 1, 1, 1,
-1.038897, -2.038054, -1.77331, 1, 1, 1, 1, 1,
-1.038117, -0.465844, -2.45501, 1, 1, 1, 1, 1,
-1.03413, 0.5181395, -0.4900405, 1, 1, 1, 1, 1,
-1.03325, 0.2262363, -0.3892016, 1, 1, 1, 1, 1,
-1.029099, 1.99149, -0.8771273, 1, 1, 1, 1, 1,
-1.024182, 1.294375, 0.3419394, 1, 1, 1, 1, 1,
-1.023185, -0.5951003, -1.940137, 1, 1, 1, 1, 1,
-1.022359, -0.5448098, -2.738462, 1, 1, 1, 1, 1,
-1.022055, 1.182803, -0.2102506, 0, 0, 1, 1, 1,
-1.01372, 0.8837619, -0.940123, 1, 0, 0, 1, 1,
-1.010025, -0.539783, -0.2087183, 1, 0, 0, 1, 1,
-1.009683, -0.3888247, -2.109104, 1, 0, 0, 1, 1,
-1.009174, -1.045305, -2.843919, 1, 0, 0, 1, 1,
-1.008042, -0.06154488, -4.526186, 1, 0, 0, 1, 1,
-0.9979995, -0.8819491, -2.967561, 0, 0, 0, 1, 1,
-0.9938467, -0.2588305, -1.078965, 0, 0, 0, 1, 1,
-0.9907417, -0.1836538, -2.358063, 0, 0, 0, 1, 1,
-0.9902639, 0.1801905, -2.187627, 0, 0, 0, 1, 1,
-0.9851391, 0.1522605, 0.03319513, 0, 0, 0, 1, 1,
-0.9652084, 0.003538941, -1.239174, 0, 0, 0, 1, 1,
-0.9636875, -1.366722, -2.670629, 0, 0, 0, 1, 1,
-0.9632519, -0.3991402, -2.334137, 1, 1, 1, 1, 1,
-0.9625373, 0.6747749, -1.454522, 1, 1, 1, 1, 1,
-0.9550991, -2.110077, -4.747582, 1, 1, 1, 1, 1,
-0.954909, 0.1057479, -1.28054, 1, 1, 1, 1, 1,
-0.9493792, 0.02426359, -0.05514618, 1, 1, 1, 1, 1,
-0.9485244, 0.1724122, -1.430474, 1, 1, 1, 1, 1,
-0.9478721, -0.01663795, -2.131164, 1, 1, 1, 1, 1,
-0.9444915, 0.1314442, 0.2780986, 1, 1, 1, 1, 1,
-0.94403, -0.5191751, -1.983937, 1, 1, 1, 1, 1,
-0.9408978, -0.9213026, -1.542269, 1, 1, 1, 1, 1,
-0.9404106, -1.024282, -1.626585, 1, 1, 1, 1, 1,
-0.9365569, 0.02041495, -3.929503, 1, 1, 1, 1, 1,
-0.9363858, 0.09559299, -1.677387, 1, 1, 1, 1, 1,
-0.9299846, 0.8792473, -0.8645908, 1, 1, 1, 1, 1,
-0.9299539, -0.5633039, -3.333573, 1, 1, 1, 1, 1,
-0.9272908, -0.6115956, -2.319544, 0, 0, 1, 1, 1,
-0.9201239, -0.5635449, -3.299914, 1, 0, 0, 1, 1,
-0.9085953, 0.9045534, -1.509904, 1, 0, 0, 1, 1,
-0.9064195, 0.1544864, -0.9665513, 1, 0, 0, 1, 1,
-0.9033014, 0.5595614, 0.5749506, 1, 0, 0, 1, 1,
-0.8978142, -0.4501528, -1.395339, 1, 0, 0, 1, 1,
-0.8942956, 1.876086, 0.168992, 0, 0, 0, 1, 1,
-0.8918967, -1.227566, -3.349842, 0, 0, 0, 1, 1,
-0.8906353, -0.07051197, -1.99891, 0, 0, 0, 1, 1,
-0.8891353, 0.7161181, 1.797257, 0, 0, 0, 1, 1,
-0.87404, 1.591945, 0.2942299, 0, 0, 0, 1, 1,
-0.8730344, 0.3683838, -0.2550548, 0, 0, 0, 1, 1,
-0.8697193, 0.5625902, -0.3444141, 0, 0, 0, 1, 1,
-0.8687184, -0.5633779, -3.548319, 1, 1, 1, 1, 1,
-0.8662245, -0.2480139, -0.6204551, 1, 1, 1, 1, 1,
-0.8634252, 0.3154936, 0.01915139, 1, 1, 1, 1, 1,
-0.8603969, 0.02197053, -2.008131, 1, 1, 1, 1, 1,
-0.8499003, -0.870608, -0.7541605, 1, 1, 1, 1, 1,
-0.8496968, -1.956088, -3.333965, 1, 1, 1, 1, 1,
-0.8490399, -1.981018, -2.429343, 1, 1, 1, 1, 1,
-0.8472349, 0.5750226, -2.191669, 1, 1, 1, 1, 1,
-0.8438004, 0.4449598, -0.6442507, 1, 1, 1, 1, 1,
-0.8389944, -1.510236, -1.266107, 1, 1, 1, 1, 1,
-0.8343006, 0.4865949, -0.3109669, 1, 1, 1, 1, 1,
-0.8270305, 0.4212788, -1.40004, 1, 1, 1, 1, 1,
-0.8269274, -0.7631001, -3.045946, 1, 1, 1, 1, 1,
-0.8227077, 0.8059171, 0.2827045, 1, 1, 1, 1, 1,
-0.8196924, -1.028783, -2.773893, 1, 1, 1, 1, 1,
-0.8187743, -0.8983832, -1.358704, 0, 0, 1, 1, 1,
-0.8146253, 0.3421592, -2.426815, 1, 0, 0, 1, 1,
-0.8104783, 0.3985423, -0.230776, 1, 0, 0, 1, 1,
-0.8060362, -1.047807, -3.472449, 1, 0, 0, 1, 1,
-0.7920342, 0.2122253, -1.686448, 1, 0, 0, 1, 1,
-0.7913908, -0.9263976, -1.091877, 1, 0, 0, 1, 1,
-0.7735322, -0.001770888, -0.1679198, 0, 0, 0, 1, 1,
-0.7722337, 0.1696246, -1.066855, 0, 0, 0, 1, 1,
-0.7705145, -0.7880313, -2.198488, 0, 0, 0, 1, 1,
-0.767719, -2.119829, -2.081181, 0, 0, 0, 1, 1,
-0.7648785, -1.321709, -1.335341, 0, 0, 0, 1, 1,
-0.7646182, 1.068057, -0.9600279, 0, 0, 0, 1, 1,
-0.7608992, 0.1624049, -2.872639, 0, 0, 0, 1, 1,
-0.7593389, 0.2063559, -1.356055, 1, 1, 1, 1, 1,
-0.7549378, -1.800099, -1.404123, 1, 1, 1, 1, 1,
-0.7523278, -1.088892, -3.802478, 1, 1, 1, 1, 1,
-0.7520971, 1.003917, -0.7009661, 1, 1, 1, 1, 1,
-0.7499725, -1.247645, -1.215166, 1, 1, 1, 1, 1,
-0.744988, -0.04453564, -0.9522263, 1, 1, 1, 1, 1,
-0.7446392, 0.5192022, -1.607843, 1, 1, 1, 1, 1,
-0.736807, 1.133625, 0.8991656, 1, 1, 1, 1, 1,
-0.7317269, 0.1457467, 0.3416356, 1, 1, 1, 1, 1,
-0.730965, 1.116913, 0.3595243, 1, 1, 1, 1, 1,
-0.7238446, 0.8906165, -0.8644134, 1, 1, 1, 1, 1,
-0.7200344, -0.3793886, -2.069512, 1, 1, 1, 1, 1,
-0.7195682, 1.147758, -1.119412, 1, 1, 1, 1, 1,
-0.7195465, 0.8804584, 0.4966461, 1, 1, 1, 1, 1,
-0.7150567, 0.7516977, 0.1488461, 1, 1, 1, 1, 1,
-0.7147456, 1.359679, 0.5214707, 0, 0, 1, 1, 1,
-0.7115484, -0.2821854, -1.074133, 1, 0, 0, 1, 1,
-0.7040018, 1.254451, -0.5500026, 1, 0, 0, 1, 1,
-0.7035361, 0.8978605, -0.4381024, 1, 0, 0, 1, 1,
-0.7029048, -0.5199919, -2.69373, 1, 0, 0, 1, 1,
-0.7003922, -2.372309, -4.047355, 1, 0, 0, 1, 1,
-0.6970661, -0.9321589, -3.283424, 0, 0, 0, 1, 1,
-0.6944808, -2.444384, -1.714936, 0, 0, 0, 1, 1,
-0.6944624, 0.9566376, -2.386283, 0, 0, 0, 1, 1,
-0.6936927, -0.3429944, -2.694261, 0, 0, 0, 1, 1,
-0.6933981, 0.296202, -1.39419, 0, 0, 0, 1, 1,
-0.6933555, -0.4626575, -0.3383017, 0, 0, 0, 1, 1,
-0.6931381, 0.1627053, -1.088942, 0, 0, 0, 1, 1,
-0.690771, 1.112857, -1.348676, 1, 1, 1, 1, 1,
-0.6896791, 0.5725204, -0.3371435, 1, 1, 1, 1, 1,
-0.6864129, 0.3378973, -1.588979, 1, 1, 1, 1, 1,
-0.6787681, 1.098011, -0.1340031, 1, 1, 1, 1, 1,
-0.6787656, 1.813917, -0.3071139, 1, 1, 1, 1, 1,
-0.6755949, -1.303361, -1.952754, 1, 1, 1, 1, 1,
-0.6727263, -0.5205311, -1.571825, 1, 1, 1, 1, 1,
-0.6725684, 0.5037103, -1.021342, 1, 1, 1, 1, 1,
-0.6703646, -0.9758757, -3.447128, 1, 1, 1, 1, 1,
-0.6697381, 0.921885, -0.02816619, 1, 1, 1, 1, 1,
-0.6660726, -1.500035, -2.804996, 1, 1, 1, 1, 1,
-0.6657609, -1.415728, -1.260089, 1, 1, 1, 1, 1,
-0.6647609, -2.200801, -2.958104, 1, 1, 1, 1, 1,
-0.6640697, 1.059741, -0.3556967, 1, 1, 1, 1, 1,
-0.6632339, 0.9916886, -1.504078, 1, 1, 1, 1, 1,
-0.6585913, -0.2102403, -2.00137, 0, 0, 1, 1, 1,
-0.6555195, 0.9601138, 0.7480974, 1, 0, 0, 1, 1,
-0.6533535, -1.625869, -3.664748, 1, 0, 0, 1, 1,
-0.6457629, -0.3012874, -1.713893, 1, 0, 0, 1, 1,
-0.6444172, 1.582324, -0.3471955, 1, 0, 0, 1, 1,
-0.6431137, -0.9045501, -2.387477, 1, 0, 0, 1, 1,
-0.633786, -1.635741, -2.465312, 0, 0, 0, 1, 1,
-0.6260778, 0.6700354, -1.910313, 0, 0, 0, 1, 1,
-0.6216887, -0.9607673, -2.257051, 0, 0, 0, 1, 1,
-0.6085516, -0.6053375, -1.255574, 0, 0, 0, 1, 1,
-0.5902712, 0.7056043, -0.5419784, 0, 0, 0, 1, 1,
-0.5893039, 1.260723, -1.680285, 0, 0, 0, 1, 1,
-0.5890009, 0.1404458, 0.3502043, 0, 0, 0, 1, 1,
-0.5866382, -1.151825, -1.312297, 1, 1, 1, 1, 1,
-0.584173, -0.686975, -1.492649, 1, 1, 1, 1, 1,
-0.5754621, -1.435745, -3.017303, 1, 1, 1, 1, 1,
-0.5753224, 0.1523312, 0.3186685, 1, 1, 1, 1, 1,
-0.5751556, -1.107967, -0.8395332, 1, 1, 1, 1, 1,
-0.5727575, 0.9732994, -0.5578167, 1, 1, 1, 1, 1,
-0.5717354, -0.2887687, -1.37879, 1, 1, 1, 1, 1,
-0.566963, -1.655288, -3.452298, 1, 1, 1, 1, 1,
-0.5650142, -0.5533188, -3.419937, 1, 1, 1, 1, 1,
-0.5644596, -0.08763081, -3.655322, 1, 1, 1, 1, 1,
-0.5625494, -0.4039217, -0.5670685, 1, 1, 1, 1, 1,
-0.5546429, 0.3214569, -1.717436, 1, 1, 1, 1, 1,
-0.5494723, -1.113848, -2.621695, 1, 1, 1, 1, 1,
-0.5478731, 0.4086047, -1.522021, 1, 1, 1, 1, 1,
-0.5464628, -0.5635323, -2.187653, 1, 1, 1, 1, 1,
-0.5405858, -0.6632268, -1.150386, 0, 0, 1, 1, 1,
-0.5402287, 0.4027379, 0.1906419, 1, 0, 0, 1, 1,
-0.5399956, -0.0264698, -2.531899, 1, 0, 0, 1, 1,
-0.5377445, -0.2747279, -1.377055, 1, 0, 0, 1, 1,
-0.5370834, -3.374405, -1.498851, 1, 0, 0, 1, 1,
-0.5361378, 2.215897, -0.2434928, 1, 0, 0, 1, 1,
-0.531104, 0.2053433, -1.501732, 0, 0, 0, 1, 1,
-0.5255476, 1.821695, -0.01588482, 0, 0, 0, 1, 1,
-0.5135534, -1.151415, -4.977471, 0, 0, 0, 1, 1,
-0.5130361, -0.3082095, -1.848072, 0, 0, 0, 1, 1,
-0.511919, 0.03536395, -2.321383, 0, 0, 0, 1, 1,
-0.5083053, -0.09848764, -1.235163, 0, 0, 0, 1, 1,
-0.5073997, 0.9280108, -0.5749527, 0, 0, 0, 1, 1,
-0.5024458, -1.667807, -4.11417, 1, 1, 1, 1, 1,
-0.4988172, -0.7441068, -2.319236, 1, 1, 1, 1, 1,
-0.4913692, -0.8338437, -1.127535, 1, 1, 1, 1, 1,
-0.4906973, -0.2358727, -2.903061, 1, 1, 1, 1, 1,
-0.4895697, -0.9315971, -2.448868, 1, 1, 1, 1, 1,
-0.4857613, -0.2196101, -1.158741, 1, 1, 1, 1, 1,
-0.482098, -0.06698991, -2.951799, 1, 1, 1, 1, 1,
-0.4811794, 1.027312, -2.265389, 1, 1, 1, 1, 1,
-0.4779421, 0.5251424, 0.9889312, 1, 1, 1, 1, 1,
-0.4767309, -0.4345558, -2.498589, 1, 1, 1, 1, 1,
-0.4745339, -2.149693, -4.067058, 1, 1, 1, 1, 1,
-0.4702223, 1.287718, -1.929189, 1, 1, 1, 1, 1,
-0.4496386, 0.7883766, -2.180579, 1, 1, 1, 1, 1,
-0.4487115, -0.1890215, -3.229364, 1, 1, 1, 1, 1,
-0.447184, -1.64931, -3.891941, 1, 1, 1, 1, 1,
-0.4432018, -0.8253344, -2.672379, 0, 0, 1, 1, 1,
-0.4386844, -0.2452937, -1.451354, 1, 0, 0, 1, 1,
-0.4318561, -0.2671196, -2.788126, 1, 0, 0, 1, 1,
-0.4284529, 0.6351117, -1.563878, 1, 0, 0, 1, 1,
-0.423386, 0.655981, -0.6477399, 1, 0, 0, 1, 1,
-0.4232945, 0.5119029, -1.771666, 1, 0, 0, 1, 1,
-0.4196231, -0.7570555, -2.851627, 0, 0, 0, 1, 1,
-0.4080585, 2.356696, 1.384148, 0, 0, 0, 1, 1,
-0.406124, -0.6385466, -2.977011, 0, 0, 0, 1, 1,
-0.4007598, -0.3518922, -1.986685, 0, 0, 0, 1, 1,
-0.3990005, -0.08200004, -0.5499065, 0, 0, 0, 1, 1,
-0.3986672, -0.1301588, -1.440694, 0, 0, 0, 1, 1,
-0.3964087, -0.7437304, -2.734648, 0, 0, 0, 1, 1,
-0.3861669, 0.1887338, -1.148892, 1, 1, 1, 1, 1,
-0.3776387, 0.01053252, -2.914483, 1, 1, 1, 1, 1,
-0.376735, -0.745123, -0.4088315, 1, 1, 1, 1, 1,
-0.3749845, -0.1233104, -2.363509, 1, 1, 1, 1, 1,
-0.3736664, -0.3164178, -1.595229, 1, 1, 1, 1, 1,
-0.3727281, -0.6654422, -2.767907, 1, 1, 1, 1, 1,
-0.3726993, -1.254353, -3.179538, 1, 1, 1, 1, 1,
-0.3704319, -1.448438, -3.344715, 1, 1, 1, 1, 1,
-0.3691914, 0.5095086, 0.371404, 1, 1, 1, 1, 1,
-0.3656881, 1.591033, -0.04949989, 1, 1, 1, 1, 1,
-0.3629571, -1.6943, -4.324944, 1, 1, 1, 1, 1,
-0.3610346, -1.011164, -4.393484, 1, 1, 1, 1, 1,
-0.3540001, 1.055392, -1.487452, 1, 1, 1, 1, 1,
-0.3516507, -0.08306013, -3.351438, 1, 1, 1, 1, 1,
-0.3498988, -2.074527, -1.674343, 1, 1, 1, 1, 1,
-0.3488002, 2.233575, -0.8321083, 0, 0, 1, 1, 1,
-0.3444346, 1.751348, 1.131458, 1, 0, 0, 1, 1,
-0.3418344, 0.6132076, 0.2989181, 1, 0, 0, 1, 1,
-0.3393938, 0.21929, -0.8389427, 1, 0, 0, 1, 1,
-0.3366807, 2.662376, -0.3218093, 1, 0, 0, 1, 1,
-0.3358458, -0.0627527, -1.773678, 1, 0, 0, 1, 1,
-0.3339212, -2.672021, -2.200155, 0, 0, 0, 1, 1,
-0.3337959, 0.07889218, 0.7152232, 0, 0, 0, 1, 1,
-0.328911, 1.419075, -1.184094, 0, 0, 0, 1, 1,
-0.3286138, 0.2487348, -0.3521224, 0, 0, 0, 1, 1,
-0.3271933, -0.744642, -1.051045, 0, 0, 0, 1, 1,
-0.3267674, 0.4696781, -0.4922774, 0, 0, 0, 1, 1,
-0.3249731, 1.069989, 0.04758766, 0, 0, 0, 1, 1,
-0.3205369, -1.822345, -4.240219, 1, 1, 1, 1, 1,
-0.3193835, -0.2207823, -2.298395, 1, 1, 1, 1, 1,
-0.3182607, -0.1737727, -4.469277, 1, 1, 1, 1, 1,
-0.3148108, -1.143093, -3.970917, 1, 1, 1, 1, 1,
-0.3107177, 0.5147843, -2.192256, 1, 1, 1, 1, 1,
-0.3033565, -0.8344823, -1.880277, 1, 1, 1, 1, 1,
-0.3007916, 0.003931638, -1.806249, 1, 1, 1, 1, 1,
-0.295198, -0.01704822, -0.9688645, 1, 1, 1, 1, 1,
-0.2939615, -0.02512033, -2.967598, 1, 1, 1, 1, 1,
-0.2933788, 0.08295082, -0.8073403, 1, 1, 1, 1, 1,
-0.2815329, -0.475996, -4.366114, 1, 1, 1, 1, 1,
-0.2808482, -0.8851981, -2.19803, 1, 1, 1, 1, 1,
-0.2768461, -1.363386, -1.681228, 1, 1, 1, 1, 1,
-0.2734171, -0.2962078, -2.345314, 1, 1, 1, 1, 1,
-0.2711328, 0.9100036, 1.401906, 1, 1, 1, 1, 1,
-0.2672093, 1.130162, -0.9515395, 0, 0, 1, 1, 1,
-0.2654925, 1.323952, -0.3071776, 1, 0, 0, 1, 1,
-0.2649003, 1.677003, 1.191301, 1, 0, 0, 1, 1,
-0.2633503, -0.5182264, -2.982161, 1, 0, 0, 1, 1,
-0.2556163, -0.400102, -3.267443, 1, 0, 0, 1, 1,
-0.2550413, 0.7440812, -1.139809, 1, 0, 0, 1, 1,
-0.2531027, 1.360537, 0.8373517, 0, 0, 0, 1, 1,
-0.2514267, -0.7661839, -3.287733, 0, 0, 0, 1, 1,
-0.2495769, -1.173437, -2.533045, 0, 0, 0, 1, 1,
-0.2413303, 0.2707901, -1.373954, 0, 0, 0, 1, 1,
-0.239016, -0.09365588, -3.185326, 0, 0, 0, 1, 1,
-0.2365934, 1.440315, 0.1753411, 0, 0, 0, 1, 1,
-0.2355115, 1.007722, 0.1205647, 0, 0, 0, 1, 1,
-0.2352433, 0.947591, -1.667511, 1, 1, 1, 1, 1,
-0.2351747, -0.3702567, -2.527622, 1, 1, 1, 1, 1,
-0.234765, 0.204836, -1.374501, 1, 1, 1, 1, 1,
-0.234086, 0.5753676, 1.306062, 1, 1, 1, 1, 1,
-0.2332053, 0.5096642, -0.1252208, 1, 1, 1, 1, 1,
-0.2321285, 0.8389984, -1.011686, 1, 1, 1, 1, 1,
-0.2302804, -1.582983, -1.27978, 1, 1, 1, 1, 1,
-0.2283456, -1.190038, -1.640049, 1, 1, 1, 1, 1,
-0.225777, -0.5963593, -2.109137, 1, 1, 1, 1, 1,
-0.2219346, 1.105592, 0.01263442, 1, 1, 1, 1, 1,
-0.216337, 0.3800385, -0.2890305, 1, 1, 1, 1, 1,
-0.2140644, 0.04380007, -1.214819, 1, 1, 1, 1, 1,
-0.2133274, 1.682998, -0.4103779, 1, 1, 1, 1, 1,
-0.2130321, -0.724139, -1.920431, 1, 1, 1, 1, 1,
-0.2115804, 0.7250321, 0.7094864, 1, 1, 1, 1, 1,
-0.2087043, 0.670478, -0.1062419, 0, 0, 1, 1, 1,
-0.203839, -1.177998, -3.626158, 1, 0, 0, 1, 1,
-0.2018684, -0.07446423, -1.233042, 1, 0, 0, 1, 1,
-0.201221, 1.943904, -0.04044142, 1, 0, 0, 1, 1,
-0.1985353, 0.6743281, 2.184073, 1, 0, 0, 1, 1,
-0.1981942, 1.177802, 0.3559649, 1, 0, 0, 1, 1,
-0.1980145, 0.7679583, -2.326907, 0, 0, 0, 1, 1,
-0.1963029, -0.9134836, -3.994359, 0, 0, 0, 1, 1,
-0.1904459, 0.5718426, 2.181957, 0, 0, 0, 1, 1,
-0.1901835, -1.271664, -3.200879, 0, 0, 0, 1, 1,
-0.1873868, -0.04983865, -2.365549, 0, 0, 0, 1, 1,
-0.1747641, 1.749816, 1.005868, 0, 0, 0, 1, 1,
-0.1722313, -1.971356, -3.402099, 0, 0, 0, 1, 1,
-0.169867, -2.987043, -1.622068, 1, 1, 1, 1, 1,
-0.169077, 0.8111148, -0.5015605, 1, 1, 1, 1, 1,
-0.1662022, -0.2286975, -2.019626, 1, 1, 1, 1, 1,
-0.1646284, -0.8784271, -2.141575, 1, 1, 1, 1, 1,
-0.1637092, -1.072164, -3.728662, 1, 1, 1, 1, 1,
-0.1636786, 2.277681, -0.7587376, 1, 1, 1, 1, 1,
-0.1624278, -0.183877, -1.464567, 1, 1, 1, 1, 1,
-0.1590427, 1.798433, 0.7413525, 1, 1, 1, 1, 1,
-0.1557731, -1.273883, -1.878915, 1, 1, 1, 1, 1,
-0.1483691, 0.8931031, -1.266992, 1, 1, 1, 1, 1,
-0.1462001, -0.03960093, 0.7005188, 1, 1, 1, 1, 1,
-0.1456665, -1.217055, -2.804845, 1, 1, 1, 1, 1,
-0.1453345, 0.4605392, -2.258133, 1, 1, 1, 1, 1,
-0.1448285, 0.1824343, -2.862362, 1, 1, 1, 1, 1,
-0.1398792, -0.9709015, -1.978774, 1, 1, 1, 1, 1,
-0.1388308, 1.103999, 0.2682681, 0, 0, 1, 1, 1,
-0.1384792, -0.4773579, -2.531162, 1, 0, 0, 1, 1,
-0.1330717, 0.3800241, -0.6959566, 1, 0, 0, 1, 1,
-0.1329665, 0.7643334, -0.7631866, 1, 0, 0, 1, 1,
-0.1285209, 0.3250263, 0.7118829, 1, 0, 0, 1, 1,
-0.1284705, 0.6377947, -1.58376, 1, 0, 0, 1, 1,
-0.1232714, -1.839926, -3.403732, 0, 0, 0, 1, 1,
-0.1205605, -1.340476, -3.857594, 0, 0, 0, 1, 1,
-0.1200618, 0.0965608, -0.5978126, 0, 0, 0, 1, 1,
-0.1174959, 1.151545, -0.6562185, 0, 0, 0, 1, 1,
-0.1126479, -1.069513, -2.834607, 0, 0, 0, 1, 1,
-0.1111278, -0.2863988, -1.562919, 0, 0, 0, 1, 1,
-0.09742271, 0.5523254, 1.04622, 0, 0, 0, 1, 1,
-0.09382159, -1.806384, -3.320364, 1, 1, 1, 1, 1,
-0.09180534, 2.165163, 0.02246764, 1, 1, 1, 1, 1,
-0.09146143, 0.7632978, -0.3769103, 1, 1, 1, 1, 1,
-0.09130262, 0.5268031, -0.481692, 1, 1, 1, 1, 1,
-0.08496083, -1.60221, -2.023989, 1, 1, 1, 1, 1,
-0.08390162, -0.4930417, -2.079478, 1, 1, 1, 1, 1,
-0.08239062, 0.3179864, 0.9539521, 1, 1, 1, 1, 1,
-0.08081314, -0.05265241, -2.597161, 1, 1, 1, 1, 1,
-0.07802911, -0.2397194, -3.579103, 1, 1, 1, 1, 1,
-0.07490696, 1.192428, 1.095631, 1, 1, 1, 1, 1,
-0.07393073, -0.5845126, -4.116875, 1, 1, 1, 1, 1,
-0.07096049, 1.013166, -0.4225829, 1, 1, 1, 1, 1,
-0.06785139, 1.224026, 0.9057805, 1, 1, 1, 1, 1,
-0.06388205, 0.237339, -1.484761, 1, 1, 1, 1, 1,
-0.06368656, -0.4089865, -0.9189177, 1, 1, 1, 1, 1,
-0.06289601, -0.130977, -3.704451, 0, 0, 1, 1, 1,
-0.05999087, 0.8266379, 0.7856059, 1, 0, 0, 1, 1,
-0.05913305, -0.3032945, -3.484752, 1, 0, 0, 1, 1,
-0.05878391, -0.712505, -3.122562, 1, 0, 0, 1, 1,
-0.05845667, 0.735369, -0.7626846, 1, 0, 0, 1, 1,
-0.05778652, -1.333351, -4.194506, 1, 0, 0, 1, 1,
-0.05478762, -1.12881, -3.502782, 0, 0, 0, 1, 1,
-0.04253219, -0.1117673, -1.241464, 0, 0, 0, 1, 1,
-0.04198391, 0.3974545, 0.6040871, 0, 0, 0, 1, 1,
-0.04006591, 0.1394253, -0.6148192, 0, 0, 0, 1, 1,
-0.03785016, 0.7266775, 0.5191166, 0, 0, 0, 1, 1,
-0.03605427, 0.03248101, -0.654968, 0, 0, 0, 1, 1,
-0.03445551, 0.2197926, 0.1561153, 0, 0, 0, 1, 1,
-0.03318113, -2.649446, -3.693027, 1, 1, 1, 1, 1,
-0.03089805, -0.1010906, -2.690248, 1, 1, 1, 1, 1,
-0.02974654, -0.2210463, -3.165668, 1, 1, 1, 1, 1,
-0.02785243, -1.791448, -1.224333, 1, 1, 1, 1, 1,
-0.02335963, 1.172422, -0.5319339, 1, 1, 1, 1, 1,
-0.0224005, 1.14441, -2.351326, 1, 1, 1, 1, 1,
-0.01452059, 1.610976, 0.3266949, 1, 1, 1, 1, 1,
-0.01372571, -0.4211959, -3.308893, 1, 1, 1, 1, 1,
-0.005652862, 0.05513618, -1.215199, 1, 1, 1, 1, 1,
-0.003798486, -1.413646, -4.514466, 1, 1, 1, 1, 1,
-0.002593473, -0.9704781, -4.183182, 1, 1, 1, 1, 1,
-0.002283604, 0.6139304, -0.6155645, 1, 1, 1, 1, 1,
-0.001541636, -2.126301, -1.510411, 1, 1, 1, 1, 1,
0.001580206, 1.446156, 0.06742004, 1, 1, 1, 1, 1,
0.005141993, 0.2108185, -0.325855, 1, 1, 1, 1, 1,
0.00519774, -0.3466445, 2.553191, 0, 0, 1, 1, 1,
0.007716555, -1.493011, 2.436225, 1, 0, 0, 1, 1,
0.01283873, -1.301498, 2.970346, 1, 0, 0, 1, 1,
0.01780171, 1.286154, -1.559887, 1, 0, 0, 1, 1,
0.01941625, -0.8296677, 2.55724, 1, 0, 0, 1, 1,
0.02918315, 1.000756, 1.041542, 1, 0, 0, 1, 1,
0.03572503, -1.255746, 3.741158, 0, 0, 0, 1, 1,
0.03678761, -0.7228471, 2.394699, 0, 0, 0, 1, 1,
0.03719342, -0.3207607, 2.325242, 0, 0, 0, 1, 1,
0.03836431, 0.03428271, -0.6145817, 0, 0, 0, 1, 1,
0.03946956, 0.6500838, 0.9792675, 0, 0, 0, 1, 1,
0.04108996, -0.8526744, 3.816657, 0, 0, 0, 1, 1,
0.04322029, -0.6524854, 1.561081, 0, 0, 0, 1, 1,
0.04633548, -0.5264584, 3.534912, 1, 1, 1, 1, 1,
0.04761977, 0.1571158, 0.8599412, 1, 1, 1, 1, 1,
0.05021591, 0.8250007, -1.190417, 1, 1, 1, 1, 1,
0.05223639, -0.8919806, 3.738872, 1, 1, 1, 1, 1,
0.05877332, -0.1418111, 3.702137, 1, 1, 1, 1, 1,
0.06188557, -1.469586, 1.656172, 1, 1, 1, 1, 1,
0.06220296, -0.23592, 4.06582, 1, 1, 1, 1, 1,
0.06310675, -1.076546, 3.754048, 1, 1, 1, 1, 1,
0.07010141, 0.3951521, -0.7874774, 1, 1, 1, 1, 1,
0.07191949, -0.1382832, 0.9753464, 1, 1, 1, 1, 1,
0.07392919, 0.7255911, 1.276891, 1, 1, 1, 1, 1,
0.07481378, -0.06910986, 1.545262, 1, 1, 1, 1, 1,
0.07688011, -0.4901326, 3.714905, 1, 1, 1, 1, 1,
0.07969535, 1.379299, 0.8707466, 1, 1, 1, 1, 1,
0.08351088, 0.09041686, 0.5248278, 1, 1, 1, 1, 1,
0.0837368, 0.2538435, -0.08059745, 0, 0, 1, 1, 1,
0.09100027, 1.030614, -0.4143994, 1, 0, 0, 1, 1,
0.09238906, 1.299934, 1.037108, 1, 0, 0, 1, 1,
0.09674224, 0.8322579, 0.456974, 1, 0, 0, 1, 1,
0.1006656, 2.025958, 1.292907, 1, 0, 0, 1, 1,
0.105786, -0.06785838, 1.061619, 1, 0, 0, 1, 1,
0.108236, -1.216173, 4.108548, 0, 0, 0, 1, 1,
0.1087905, -0.01121588, 1.036093, 0, 0, 0, 1, 1,
0.1090397, 0.4333668, -0.5946717, 0, 0, 0, 1, 1,
0.1107575, -1.606644, 2.235476, 0, 0, 0, 1, 1,
0.1107908, -0.1948697, 3.493207, 0, 0, 0, 1, 1,
0.1126245, 1.677832, 0.4909337, 0, 0, 0, 1, 1,
0.1130575, -0.6144539, 3.177812, 0, 0, 0, 1, 1,
0.1136188, 0.8672106, -1.893844, 1, 1, 1, 1, 1,
0.1162163, -0.8553239, 2.802332, 1, 1, 1, 1, 1,
0.1170072, 0.7101106, 0.6579531, 1, 1, 1, 1, 1,
0.1173427, -0.3562638, 0.8995728, 1, 1, 1, 1, 1,
0.1203195, -0.05474341, 1.324111, 1, 1, 1, 1, 1,
0.1310331, 0.8414089, 0.8492555, 1, 1, 1, 1, 1,
0.1337429, -0.5491507, 0.8798416, 1, 1, 1, 1, 1,
0.1355298, -0.7848837, 3.650919, 1, 1, 1, 1, 1,
0.1416213, 0.7323244, 1.636318, 1, 1, 1, 1, 1,
0.1463671, 0.1276671, 0.7741452, 1, 1, 1, 1, 1,
0.1568371, -0.4038081, 2.904569, 1, 1, 1, 1, 1,
0.1584495, -0.6679589, 2.875556, 1, 1, 1, 1, 1,
0.1647398, -0.8749371, 2.658669, 1, 1, 1, 1, 1,
0.1654815, -1.150174, 2.486011, 1, 1, 1, 1, 1,
0.1656908, -1.355876, 5.049945, 1, 1, 1, 1, 1,
0.1662107, -1.82327, 3.200553, 0, 0, 1, 1, 1,
0.1664351, -0.9343044, 3.442347, 1, 0, 0, 1, 1,
0.1681918, -2.380647, 2.735457, 1, 0, 0, 1, 1,
0.1771636, -0.475473, 2.619935, 1, 0, 0, 1, 1,
0.1774905, -0.4692084, 1.830177, 1, 0, 0, 1, 1,
0.1792982, 0.3996529, 1.245687, 1, 0, 0, 1, 1,
0.17984, 0.5040159, 0.3335753, 0, 0, 0, 1, 1,
0.1821712, 0.1093323, 0.2746771, 0, 0, 0, 1, 1,
0.1865149, -1.426781, 2.339836, 0, 0, 0, 1, 1,
0.1867766, 0.2421269, -0.8335679, 0, 0, 0, 1, 1,
0.1888001, 0.1224173, 1.852012, 0, 0, 0, 1, 1,
0.1917067, 0.009862381, 2.296737, 0, 0, 0, 1, 1,
0.1931626, -1.092483, 3.393894, 0, 0, 0, 1, 1,
0.1963848, 1.396008, -2.073735, 1, 1, 1, 1, 1,
0.1996928, -0.601589, 2.099829, 1, 1, 1, 1, 1,
0.2045695, 0.654435, 0.6112673, 1, 1, 1, 1, 1,
0.2051159, -1.228009, 4.566914, 1, 1, 1, 1, 1,
0.2077966, 1.470779, -0.07029898, 1, 1, 1, 1, 1,
0.2170831, -0.03562233, 2.06321, 1, 1, 1, 1, 1,
0.2222222, 0.9411877, 0.6267931, 1, 1, 1, 1, 1,
0.223494, -0.5912632, 4.380568, 1, 1, 1, 1, 1,
0.2259216, -1.863915, 3.021018, 1, 1, 1, 1, 1,
0.2327795, -0.3273654, 1.64701, 1, 1, 1, 1, 1,
0.2416598, 1.439105, 1.949308, 1, 1, 1, 1, 1,
0.2439936, 1.355633, 0.4102408, 1, 1, 1, 1, 1,
0.2495836, 0.1383643, 1.288144, 1, 1, 1, 1, 1,
0.254395, 0.8916284, -0.6304317, 1, 1, 1, 1, 1,
0.2580304, -0.7924909, 2.576482, 1, 1, 1, 1, 1,
0.2621488, -0.1248506, 2.105511, 0, 0, 1, 1, 1,
0.265569, 0.4039865, 0.6604209, 1, 0, 0, 1, 1,
0.2686952, 0.8184335, -0.340472, 1, 0, 0, 1, 1,
0.2732989, 0.0479987, 0.903232, 1, 0, 0, 1, 1,
0.2745889, -0.1462529, 1.867107, 1, 0, 0, 1, 1,
0.2818216, -0.03119509, 1.318672, 1, 0, 0, 1, 1,
0.2822393, -0.1321657, 0.9262623, 0, 0, 0, 1, 1,
0.2877003, 0.6955059, -1.086363, 0, 0, 0, 1, 1,
0.2903728, 0.1826444, 0.8635607, 0, 0, 0, 1, 1,
0.2966633, -1.250872, 3.416258, 0, 0, 0, 1, 1,
0.3011312, -1.019561, 3.274021, 0, 0, 0, 1, 1,
0.3024699, 0.809268, 0.156302, 0, 0, 0, 1, 1,
0.3024819, 0.7762136, 1.55152, 0, 0, 0, 1, 1,
0.3038901, 0.861829, 0.2816804, 1, 1, 1, 1, 1,
0.3062711, 2.780639, -0.2287466, 1, 1, 1, 1, 1,
0.3094368, -0.532331, 1.320557, 1, 1, 1, 1, 1,
0.3129903, 0.0737661, 0.06649303, 1, 1, 1, 1, 1,
0.3178201, -0.3716616, 1.173458, 1, 1, 1, 1, 1,
0.3275755, 0.9192004, -0.1116798, 1, 1, 1, 1, 1,
0.32871, 1.051135, 1.404399, 1, 1, 1, 1, 1,
0.3290494, 0.7495776, 0.1677598, 1, 1, 1, 1, 1,
0.3334115, -0.8873529, 3.346339, 1, 1, 1, 1, 1,
0.3348497, -1.237851, 3.9684, 1, 1, 1, 1, 1,
0.336594, 0.1641869, 1.119693, 1, 1, 1, 1, 1,
0.3401428, 0.6294367, 0.6669064, 1, 1, 1, 1, 1,
0.3403154, 0.2136517, -0.1774392, 1, 1, 1, 1, 1,
0.3415124, -0.3199303, 1.757178, 1, 1, 1, 1, 1,
0.3541021, -1.160601, 2.635797, 1, 1, 1, 1, 1,
0.360524, 0.5641852, -0.01654674, 0, 0, 1, 1, 1,
0.3617542, -0.0814574, 0.05136828, 1, 0, 0, 1, 1,
0.3618665, -1.159619, 3.015276, 1, 0, 0, 1, 1,
0.3630501, -0.02393986, 2.522715, 1, 0, 0, 1, 1,
0.3648668, 0.6184151, 1.612981, 1, 0, 0, 1, 1,
0.3662011, 0.2381424, 0.518976, 1, 0, 0, 1, 1,
0.3676438, -0.5802575, 3.88793, 0, 0, 0, 1, 1,
0.3696782, -0.196815, 1.618139, 0, 0, 0, 1, 1,
0.3698282, -0.8053518, 3.597413, 0, 0, 0, 1, 1,
0.3709602, -0.4355834, 0.6830224, 0, 0, 0, 1, 1,
0.3733329, -1.338401, 2.554054, 0, 0, 0, 1, 1,
0.3752648, -0.1127522, 2.064818, 0, 0, 0, 1, 1,
0.3779482, 1.487401, 0.7281572, 0, 0, 0, 1, 1,
0.3821182, 0.382368, 1.145223, 1, 1, 1, 1, 1,
0.3835813, 0.2712703, 1.271517, 1, 1, 1, 1, 1,
0.385969, -0.6525033, 3.016311, 1, 1, 1, 1, 1,
0.3877401, 0.02011659, 2.193359, 1, 1, 1, 1, 1,
0.3894569, -1.17567, 1.989866, 1, 1, 1, 1, 1,
0.3920144, -1.61005, 1.384014, 1, 1, 1, 1, 1,
0.3965279, 0.01496773, 0.4276375, 1, 1, 1, 1, 1,
0.3984468, -0.01930683, 3.11554, 1, 1, 1, 1, 1,
0.3984613, -0.6637796, 4.125898, 1, 1, 1, 1, 1,
0.399596, 0.8958969, -1.206912, 1, 1, 1, 1, 1,
0.4050386, 0.01340229, 1.331891, 1, 1, 1, 1, 1,
0.4098659, -0.3881979, 1.474231, 1, 1, 1, 1, 1,
0.4119184, -0.8902712, 1.690588, 1, 1, 1, 1, 1,
0.4126479, 0.8677696, -0.8219357, 1, 1, 1, 1, 1,
0.41562, 0.07882198, 0.6071453, 1, 1, 1, 1, 1,
0.4195221, 1.970711, -0.3872156, 0, 0, 1, 1, 1,
0.4218781, -0.07935826, 2.6208, 1, 0, 0, 1, 1,
0.4220444, 1.436761, 1.208902, 1, 0, 0, 1, 1,
0.4261491, -0.5178334, 1.812018, 1, 0, 0, 1, 1,
0.4372038, -0.3251587, 2.798149, 1, 0, 0, 1, 1,
0.4397447, -0.5783517, 1.025327, 1, 0, 0, 1, 1,
0.441736, 1.012308, -0.7788117, 0, 0, 0, 1, 1,
0.4464263, -1.600824, 3.401552, 0, 0, 0, 1, 1,
0.4466268, -0.4855888, 2.952527, 0, 0, 0, 1, 1,
0.4480464, -2.827358, 3.121226, 0, 0, 0, 1, 1,
0.4488277, 0.9172571, 1.55423, 0, 0, 0, 1, 1,
0.4499322, -0.8277395, 2.094555, 0, 0, 0, 1, 1,
0.451699, 0.0530856, 1.507149, 0, 0, 0, 1, 1,
0.4523607, 0.2584147, 0.7767419, 1, 1, 1, 1, 1,
0.453551, 0.564353, 1.755529, 1, 1, 1, 1, 1,
0.4541942, -0.1507991, 0.4946887, 1, 1, 1, 1, 1,
0.4544256, -0.1515047, 1.884535, 1, 1, 1, 1, 1,
0.4548342, -0.3150538, 2.735429, 1, 1, 1, 1, 1,
0.4551043, 0.09358972, 1.722731, 1, 1, 1, 1, 1,
0.4554556, -0.5433156, 3.441673, 1, 1, 1, 1, 1,
0.4563638, -0.1993344, 5.039753, 1, 1, 1, 1, 1,
0.456539, -1.702761, 2.057202, 1, 1, 1, 1, 1,
0.4587201, -0.04546582, 2.952119, 1, 1, 1, 1, 1,
0.4588334, 1.067685, 0.7189071, 1, 1, 1, 1, 1,
0.4588683, -0.6185296, 3.78215, 1, 1, 1, 1, 1,
0.4624402, 1.187308, -0.8696584, 1, 1, 1, 1, 1,
0.4650917, 0.7407938, -0.8130636, 1, 1, 1, 1, 1,
0.4673999, 0.1629714, 0.9778844, 1, 1, 1, 1, 1,
0.4705904, 0.4032682, 0.511602, 0, 0, 1, 1, 1,
0.4761913, -1.43843, 3.93511, 1, 0, 0, 1, 1,
0.4850313, -0.9805725, 2.681967, 1, 0, 0, 1, 1,
0.488133, 0.1118433, 0.997027, 1, 0, 0, 1, 1,
0.4913828, -0.6583172, 0.8930804, 1, 0, 0, 1, 1,
0.4938688, -0.9678041, 0.726537, 1, 0, 0, 1, 1,
0.4980243, -0.6502063, 2.231344, 0, 0, 0, 1, 1,
0.49918, -0.6809463, 1.76281, 0, 0, 0, 1, 1,
0.5032985, -0.1707437, 2.997806, 0, 0, 0, 1, 1,
0.5072792, -0.1555011, 3.009033, 0, 0, 0, 1, 1,
0.5097079, 0.4039691, -0.304078, 0, 0, 0, 1, 1,
0.509882, -0.2943483, 2.734119, 0, 0, 0, 1, 1,
0.5108891, -1.748432, 1.188916, 0, 0, 0, 1, 1,
0.5119193, 1.206951, 1.984901, 1, 1, 1, 1, 1,
0.518742, 0.3586478, 0.856518, 1, 1, 1, 1, 1,
0.5240428, 0.389062, 1.917295, 1, 1, 1, 1, 1,
0.5303122, 0.03359731, 0.7356119, 1, 1, 1, 1, 1,
0.5358768, 0.7132633, 3.441178, 1, 1, 1, 1, 1,
0.5380849, 1.91612, 0.6891103, 1, 1, 1, 1, 1,
0.5430366, 1.15345, 0.7249535, 1, 1, 1, 1, 1,
0.5435627, 1.123045, 1.094001, 1, 1, 1, 1, 1,
0.5453503, 0.1348854, 1.080088, 1, 1, 1, 1, 1,
0.546933, 0.3430107, 1.055793, 1, 1, 1, 1, 1,
0.5479905, -1.284311, 2.326378, 1, 1, 1, 1, 1,
0.5524233, -0.04883147, 1.743732, 1, 1, 1, 1, 1,
0.5540823, 0.2352178, 1.017563, 1, 1, 1, 1, 1,
0.5561357, 0.1711648, 1.676655, 1, 1, 1, 1, 1,
0.5572622, 1.007895, 1.601857, 1, 1, 1, 1, 1,
0.5575436, -0.9877667, 3.609232, 0, 0, 1, 1, 1,
0.5589538, -1.911672, 3.309576, 1, 0, 0, 1, 1,
0.558984, -0.7108039, 3.192394, 1, 0, 0, 1, 1,
0.5629051, -0.6904421, 2.365944, 1, 0, 0, 1, 1,
0.5654319, 2.176255, -0.2832384, 1, 0, 0, 1, 1,
0.5662602, 1.282315, -0.2367478, 1, 0, 0, 1, 1,
0.5796933, -0.2127101, 3.766445, 0, 0, 0, 1, 1,
0.580071, 1.193731, -0.09256192, 0, 0, 0, 1, 1,
0.5817643, 1.1244, 0.8322909, 0, 0, 0, 1, 1,
0.5838186, 1.399445, -0.6075441, 0, 0, 0, 1, 1,
0.5840607, 2.332818, -2.721777, 0, 0, 0, 1, 1,
0.5902501, 1.137538, 1.065259, 0, 0, 0, 1, 1,
0.591621, 0.4897407, -0.392564, 0, 0, 0, 1, 1,
0.592133, 0.4213445, 2.064533, 1, 1, 1, 1, 1,
0.5921349, 0.4374768, 1.722005, 1, 1, 1, 1, 1,
0.5961302, -0.5065179, 1.076973, 1, 1, 1, 1, 1,
0.5977913, 2.772362, 1.404926, 1, 1, 1, 1, 1,
0.6007994, -0.4713092, 1.958925, 1, 1, 1, 1, 1,
0.6036116, 0.4497491, 0.06173497, 1, 1, 1, 1, 1,
0.6086247, -0.1311694, 1.929086, 1, 1, 1, 1, 1,
0.6130151, -0.794086, 3.00609, 1, 1, 1, 1, 1,
0.6137702, 0.9103776, 0.387748, 1, 1, 1, 1, 1,
0.6182328, -0.2480497, 2.375174, 1, 1, 1, 1, 1,
0.6206641, -0.6650444, 2.067554, 1, 1, 1, 1, 1,
0.6277579, -0.1949436, 3.159127, 1, 1, 1, 1, 1,
0.6294769, -0.05990357, 1.091717, 1, 1, 1, 1, 1,
0.635157, 0.3325998, 0.3536033, 1, 1, 1, 1, 1,
0.6364044, 0.2339891, 3.068366, 1, 1, 1, 1, 1,
0.6426523, 0.1261953, 0.8869139, 0, 0, 1, 1, 1,
0.6430345, 0.1738874, 1.170678, 1, 0, 0, 1, 1,
0.6465821, -0.6046652, 3.297132, 1, 0, 0, 1, 1,
0.6471372, -0.5154788, 3.210648, 1, 0, 0, 1, 1,
0.6510201, 1.058299, 0.02177383, 1, 0, 0, 1, 1,
0.6516963, -1.521886, 4.453542, 1, 0, 0, 1, 1,
0.6588528, -1.071565, 4.05427, 0, 0, 0, 1, 1,
0.659842, -0.5362267, 2.347971, 0, 0, 0, 1, 1,
0.6602712, -0.29929, 2.567203, 0, 0, 0, 1, 1,
0.6619301, 0.7614362, -0.1703635, 0, 0, 0, 1, 1,
0.6624039, -0.3839624, 1.552454, 0, 0, 0, 1, 1,
0.663479, -1.576289, 1.572264, 0, 0, 0, 1, 1,
0.6719164, -1.933079, 3.03868, 0, 0, 0, 1, 1,
0.6755567, -0.6190516, 2.300576, 1, 1, 1, 1, 1,
0.6778908, -1.018246, 1.585022, 1, 1, 1, 1, 1,
0.6812156, -2.665724, 3.978218, 1, 1, 1, 1, 1,
0.6822295, -1.345525, 3.350682, 1, 1, 1, 1, 1,
0.6840152, -0.7441502, 1.47383, 1, 1, 1, 1, 1,
0.6847388, 0.4135782, 2.485447, 1, 1, 1, 1, 1,
0.6852596, -0.8257974, 1.807643, 1, 1, 1, 1, 1,
0.6911982, -0.340132, -0.1470278, 1, 1, 1, 1, 1,
0.6919497, -0.2295843, 1.573735, 1, 1, 1, 1, 1,
0.6932048, 0.1746623, 0.3148531, 1, 1, 1, 1, 1,
0.6953876, 1.092435, 0.0542681, 1, 1, 1, 1, 1,
0.6995097, -1.061139, 3.784438, 1, 1, 1, 1, 1,
0.7040607, -0.4005454, 2.639455, 1, 1, 1, 1, 1,
0.7211159, 0.3424403, 0.434699, 1, 1, 1, 1, 1,
0.7270249, 0.96578, 1.356275, 1, 1, 1, 1, 1,
0.7301285, 0.2031973, 0.04633203, 0, 0, 1, 1, 1,
0.7307265, 0.4694654, 1.215786, 1, 0, 0, 1, 1,
0.7332094, -0.08230907, -0.01240235, 1, 0, 0, 1, 1,
0.7439121, 0.1882955, 2.624221, 1, 0, 0, 1, 1,
0.7444437, -1.111337, 2.532484, 1, 0, 0, 1, 1,
0.7467719, -1.796315, 1.274614, 1, 0, 0, 1, 1,
0.75799, 0.6543966, 0.3436476, 0, 0, 0, 1, 1,
0.7592822, -0.06512098, 0.1408119, 0, 0, 0, 1, 1,
0.7599768, -0.5928715, 0.5732853, 0, 0, 0, 1, 1,
0.7642002, -1.448182, 2.10037, 0, 0, 0, 1, 1,
0.7696218, -0.2099191, 1.465807, 0, 0, 0, 1, 1,
0.7697201, 1.045631, 1.323244, 0, 0, 0, 1, 1,
0.7714007, 0.0711457, 2.909151, 0, 0, 0, 1, 1,
0.7789661, 0.5612191, 1.297168, 1, 1, 1, 1, 1,
0.7797139, 1.637877, 1.0755, 1, 1, 1, 1, 1,
0.7803023, -1.148062, 3.711498, 1, 1, 1, 1, 1,
0.7847208, -0.8743954, 2.375221, 1, 1, 1, 1, 1,
0.7849295, 1.087812, 1.012025, 1, 1, 1, 1, 1,
0.7855833, -0.07816698, 1.358489, 1, 1, 1, 1, 1,
0.790614, 1.251575, -0.05367215, 1, 1, 1, 1, 1,
0.7934474, 0.0137783, 0.3572178, 1, 1, 1, 1, 1,
0.7960162, 0.6899134, 2.003964, 1, 1, 1, 1, 1,
0.7962496, 0.8653361, -1.401047, 1, 1, 1, 1, 1,
0.8068009, 0.5357134, 1.005122, 1, 1, 1, 1, 1,
0.8113196, -0.2958833, 3.10473, 1, 1, 1, 1, 1,
0.8156578, -1.077541, 2.721645, 1, 1, 1, 1, 1,
0.8227517, -1.166626, 1.288633, 1, 1, 1, 1, 1,
0.8310958, -1.539814, 3.149348, 1, 1, 1, 1, 1,
0.8333182, -0.5089153, 2.996544, 0, 0, 1, 1, 1,
0.8380884, 1.157249, -0.08752819, 1, 0, 0, 1, 1,
0.8470556, -0.1052488, 1.468184, 1, 0, 0, 1, 1,
0.8500047, -1.12236, 3.665415, 1, 0, 0, 1, 1,
0.8502122, 0.2164845, 1.726556, 1, 0, 0, 1, 1,
0.8567939, 0.4196277, 1.401659, 1, 0, 0, 1, 1,
0.8598424, 1.319268, 1.420772, 0, 0, 0, 1, 1,
0.861201, -1.678867, 3.470057, 0, 0, 0, 1, 1,
0.861314, 1.270447, 2.211198, 0, 0, 0, 1, 1,
0.8661953, -0.5589917, 2.895205, 0, 0, 0, 1, 1,
0.8666484, 0.0769605, 0.9686877, 0, 0, 0, 1, 1,
0.8683675, -1.054054, 3.079181, 0, 0, 0, 1, 1,
0.8717877, -0.4440801, 0.8426954, 0, 0, 0, 1, 1,
0.872757, -1.833475, 4.350488, 1, 1, 1, 1, 1,
0.8798311, 1.446374, -0.1283922, 1, 1, 1, 1, 1,
0.884971, 2.211385, 0.9215528, 1, 1, 1, 1, 1,
0.8869857, -0.02916615, 0.414202, 1, 1, 1, 1, 1,
0.8967955, -0.2283127, 0.552188, 1, 1, 1, 1, 1,
0.8975118, 0.5154353, 1.467968, 1, 1, 1, 1, 1,
0.8997897, 0.6494644, 0.617645, 1, 1, 1, 1, 1,
0.9006658, -0.03262135, 2.617969, 1, 1, 1, 1, 1,
0.9030142, -0.6374972, 0.7140538, 1, 1, 1, 1, 1,
0.9069431, 1.756969, 1.074565, 1, 1, 1, 1, 1,
0.9239851, -0.08336185, 1.314285, 1, 1, 1, 1, 1,
0.9248406, 0.3871444, 0.04274604, 1, 1, 1, 1, 1,
0.9293527, -0.650439, 2.83842, 1, 1, 1, 1, 1,
0.9330251, 1.417748, 0.6329646, 1, 1, 1, 1, 1,
0.9352144, -0.4165852, 1.264603, 1, 1, 1, 1, 1,
0.936774, -0.7427776, 3.421222, 0, 0, 1, 1, 1,
0.941995, 0.6147306, -0.6674079, 1, 0, 0, 1, 1,
0.9480915, -1.673924, 2.354678, 1, 0, 0, 1, 1,
0.957256, -0.6931981, 2.678787, 1, 0, 0, 1, 1,
0.9603311, -0.2490128, 0.9626462, 1, 0, 0, 1, 1,
0.9626632, 0.9724478, 0.3597978, 1, 0, 0, 1, 1,
0.9694986, -0.7957528, 1.981273, 0, 0, 0, 1, 1,
0.9746914, 0.1927897, 1.268963, 0, 0, 0, 1, 1,
0.9798313, 0.747452, 2.256205, 0, 0, 0, 1, 1,
0.9948654, 1.202279, 1.482136, 0, 0, 0, 1, 1,
0.9992794, 0.2782585, 0.9948458, 0, 0, 0, 1, 1,
1.002828, 1.659938, -0.3207779, 0, 0, 0, 1, 1,
1.004251, -0.5544859, 4.491318, 0, 0, 0, 1, 1,
1.006165, -0.5401086, 2.061664, 1, 1, 1, 1, 1,
1.006546, 0.4607658, 1.357025, 1, 1, 1, 1, 1,
1.017257, 1.397796, 0.5664237, 1, 1, 1, 1, 1,
1.020054, -0.4649413, 1.420285, 1, 1, 1, 1, 1,
1.021426, 0.5691994, 0.7760141, 1, 1, 1, 1, 1,
1.042175, 0.8657464, -0.9052073, 1, 1, 1, 1, 1,
1.047847, 0.1428199, 2.159716, 1, 1, 1, 1, 1,
1.050265, 1.522937, 0.7462943, 1, 1, 1, 1, 1,
1.057441, 1.052129, 2.628452, 1, 1, 1, 1, 1,
1.064601, -1.325932, 4.990423, 1, 1, 1, 1, 1,
1.065665, -0.09977876, 2.607114, 1, 1, 1, 1, 1,
1.07682, -0.07425363, 1.825592, 1, 1, 1, 1, 1,
1.079696, 0.1623976, 2.600098, 1, 1, 1, 1, 1,
1.082007, -0.1264748, 3.31189, 1, 1, 1, 1, 1,
1.082517, -1.770393, 1.370322, 1, 1, 1, 1, 1,
1.092374, 0.08612099, 0.1127392, 0, 0, 1, 1, 1,
1.104754, -0.7473716, 0.6689485, 1, 0, 0, 1, 1,
1.11046, -0.841359, 2.373783, 1, 0, 0, 1, 1,
1.114552, 0.3657491, 1.569155, 1, 0, 0, 1, 1,
1.116738, 1.019748, 1.249345, 1, 0, 0, 1, 1,
1.118934, -1.143342, 2.511713, 1, 0, 0, 1, 1,
1.122133, -0.397153, 1.964175, 0, 0, 0, 1, 1,
1.126869, -0.8192669, 4.753767, 0, 0, 0, 1, 1,
1.127497, 1.035784, 2.166898, 0, 0, 0, 1, 1,
1.134212, -0.2375719, 1.345394, 0, 0, 0, 1, 1,
1.134741, 1.197592, 1.764105, 0, 0, 0, 1, 1,
1.138955, -0.3207098, 2.095826, 0, 0, 0, 1, 1,
1.144275, 2.028614, 0.3260592, 0, 0, 0, 1, 1,
1.14619, 0.5558919, 0.4746528, 1, 1, 1, 1, 1,
1.153312, -0.393527, 3.443234, 1, 1, 1, 1, 1,
1.155068, 1.232147, 1.442292, 1, 1, 1, 1, 1,
1.155656, 0.7766032, 2.224793, 1, 1, 1, 1, 1,
1.161429, 0.525368, 0.9333707, 1, 1, 1, 1, 1,
1.164022, 0.8317578, 1.28231, 1, 1, 1, 1, 1,
1.168601, -0.07231144, 1.702613, 1, 1, 1, 1, 1,
1.172072, 0.6352677, 3.373939, 1, 1, 1, 1, 1,
1.173052, -0.4501038, 1.740878, 1, 1, 1, 1, 1,
1.180874, 1.553437, 2.661865, 1, 1, 1, 1, 1,
1.181065, -0.6593334, 2.423664, 1, 1, 1, 1, 1,
1.183642, 0.04751783, 1.418571, 1, 1, 1, 1, 1,
1.192043, 0.4083187, 1.679325, 1, 1, 1, 1, 1,
1.194798, -0.7108859, 0.8415137, 1, 1, 1, 1, 1,
1.199437, -0.9247785, 1.662924, 1, 1, 1, 1, 1,
1.20046, 0.4428808, 2.219056, 0, 0, 1, 1, 1,
1.20924, -1.520192, 0.2402635, 1, 0, 0, 1, 1,
1.217754, -0.2082934, 1.062499, 1, 0, 0, 1, 1,
1.222958, -0.9504207, 3.019298, 1, 0, 0, 1, 1,
1.227254, -0.9550833, 1.660231, 1, 0, 0, 1, 1,
1.228623, 0.6452532, 2.349177, 1, 0, 0, 1, 1,
1.23103, -1.18659, 2.974051, 0, 0, 0, 1, 1,
1.243604, -1.970267, 3.023969, 0, 0, 0, 1, 1,
1.26625, -0.7530444, 1.59755, 0, 0, 0, 1, 1,
1.267126, 0.4475369, -0.8574665, 0, 0, 0, 1, 1,
1.270853, -0.6293821, 0.8351234, 0, 0, 0, 1, 1,
1.272253, -0.2746795, 1.223464, 0, 0, 0, 1, 1,
1.281599, 0.36995, 0.6163979, 0, 0, 0, 1, 1,
1.282036, -1.607745, 2.984318, 1, 1, 1, 1, 1,
1.283211, 0.2501886, 0.8103015, 1, 1, 1, 1, 1,
1.286055, 0.4907472, 2.243454, 1, 1, 1, 1, 1,
1.294748, -0.403319, 2.365909, 1, 1, 1, 1, 1,
1.31536, -0.543128, 1.118828, 1, 1, 1, 1, 1,
1.31723, 0.7438698, 2.847156, 1, 1, 1, 1, 1,
1.317511, -0.3926286, 1.812849, 1, 1, 1, 1, 1,
1.318992, -0.9653788, 1.853962, 1, 1, 1, 1, 1,
1.321834, -1.204302, 0.6983206, 1, 1, 1, 1, 1,
1.333672, 1.180833, 1.053939, 1, 1, 1, 1, 1,
1.340569, 0.427878, 1.198153, 1, 1, 1, 1, 1,
1.342631, -1.033103, 2.003798, 1, 1, 1, 1, 1,
1.344517, 1.472395, -1.137121, 1, 1, 1, 1, 1,
1.347375, -0.1827832, 2.702814, 1, 1, 1, 1, 1,
1.356456, -0.8884885, 1.617608, 1, 1, 1, 1, 1,
1.357985, -0.4322901, 2.221631, 0, 0, 1, 1, 1,
1.363947, 0.5143447, 0.3680905, 1, 0, 0, 1, 1,
1.373296, -0.05745153, 1.906548, 1, 0, 0, 1, 1,
1.374451, -0.9455661, 2.378544, 1, 0, 0, 1, 1,
1.3857, 0.5937415, 1.110606, 1, 0, 0, 1, 1,
1.386266, 0.8026321, 2.237972, 1, 0, 0, 1, 1,
1.388595, -1.463051, 3.079474, 0, 0, 0, 1, 1,
1.392752, -0.2391813, 1.189341, 0, 0, 0, 1, 1,
1.398741, 0.1084845, 2.377296, 0, 0, 0, 1, 1,
1.407158, -0.6252936, 1.954412, 0, 0, 0, 1, 1,
1.408645, -1.541912, 1.185158, 0, 0, 0, 1, 1,
1.42051, -0.8816354, 2.858593, 0, 0, 0, 1, 1,
1.432293, 0.4879175, 1.99331, 0, 0, 0, 1, 1,
1.438106, -0.7448418, 0.4050839, 1, 1, 1, 1, 1,
1.439193, -0.3070419, 1.430197, 1, 1, 1, 1, 1,
1.439936, -0.3566916, 0.1986336, 1, 1, 1, 1, 1,
1.44374, -1.276095, 3.352625, 1, 1, 1, 1, 1,
1.448295, -0.09006092, 0.5529323, 1, 1, 1, 1, 1,
1.456182, 0.3663538, 2.404818, 1, 1, 1, 1, 1,
1.459902, -1.167386, 2.604036, 1, 1, 1, 1, 1,
1.462716, -0.8276437, 0.3850576, 1, 1, 1, 1, 1,
1.472955, 0.6829423, 0.9806323, 1, 1, 1, 1, 1,
1.474494, -1.070156, 2.121828, 1, 1, 1, 1, 1,
1.477353, 0.1081205, 0.582225, 1, 1, 1, 1, 1,
1.48127, -1.636026, 3.46453, 1, 1, 1, 1, 1,
1.489354, 0.464465, 0.8518938, 1, 1, 1, 1, 1,
1.490187, 1.720617, 0.5787224, 1, 1, 1, 1, 1,
1.494573, -0.7515128, 2.137267, 1, 1, 1, 1, 1,
1.497183, 1.751363, 0.8938349, 0, 0, 1, 1, 1,
1.51456, 0.3380142, -0.9801798, 1, 0, 0, 1, 1,
1.522174, -1.710441, 1.01267, 1, 0, 0, 1, 1,
1.523742, -0.1997946, 3.787118, 1, 0, 0, 1, 1,
1.524972, -0.2130495, 0.5035918, 1, 0, 0, 1, 1,
1.528782, 0.3297347, 2.612512, 1, 0, 0, 1, 1,
1.532413, 0.3577624, 1.322808, 0, 0, 0, 1, 1,
1.542493, -0.2482609, 1.943056, 0, 0, 0, 1, 1,
1.54408, 0.4079637, 2.237324, 0, 0, 0, 1, 1,
1.559343, -1.06113, 2.948785, 0, 0, 0, 1, 1,
1.566842, 0.218628, 0.2533384, 0, 0, 0, 1, 1,
1.574881, 0.9335964, 1.193589, 0, 0, 0, 1, 1,
1.585246, 1.356673, 2.072142, 0, 0, 0, 1, 1,
1.585902, 0.8668792, 2.9578, 1, 1, 1, 1, 1,
1.5991, 0.5714004, 1.094514, 1, 1, 1, 1, 1,
1.604548, 0.1067122, -0.08733725, 1, 1, 1, 1, 1,
1.607422, 1.114995, -0.4009214, 1, 1, 1, 1, 1,
1.610703, 0.0636517, 0.8686593, 1, 1, 1, 1, 1,
1.610778, 0.5479562, 2.102999, 1, 1, 1, 1, 1,
1.623704, -0.3224067, 0.7521719, 1, 1, 1, 1, 1,
1.625754, -0.08479174, 1.875206, 1, 1, 1, 1, 1,
1.663626, 0.8355516, 0.8085638, 1, 1, 1, 1, 1,
1.716753, -1.431507, 2.428757, 1, 1, 1, 1, 1,
1.732623, 0.1008296, 0.4768243, 1, 1, 1, 1, 1,
1.742849, 0.4598965, 1.014607, 1, 1, 1, 1, 1,
1.744209, 0.4766139, 1.981046, 1, 1, 1, 1, 1,
1.746342, -0.4936317, 2.133645, 1, 1, 1, 1, 1,
1.746486, -1.580978, 3.732826, 1, 1, 1, 1, 1,
1.747718, -0.4298906, 1.334991, 0, 0, 1, 1, 1,
1.751139, -2.420016, 1.773361, 1, 0, 0, 1, 1,
1.781222, -0.955042, 3.563859, 1, 0, 0, 1, 1,
1.785598, -1.047511, 1.539661, 1, 0, 0, 1, 1,
1.788365, -0.3825859, 2.434344, 1, 0, 0, 1, 1,
1.817742, 0.4212382, 2.690104, 1, 0, 0, 1, 1,
1.824667, 0.6679388, 2.47667, 0, 0, 0, 1, 1,
1.8362, 0.530795, 3.880712, 0, 0, 0, 1, 1,
1.850434, -0.5646302, 3.204405, 0, 0, 0, 1, 1,
1.861202, -0.01494558, 1.555778, 0, 0, 0, 1, 1,
1.869957, -0.5606878, 1.80149, 0, 0, 0, 1, 1,
1.87156, -0.6928826, 0.9419771, 0, 0, 0, 1, 1,
1.882723, 0.1100395, 0.07225722, 0, 0, 0, 1, 1,
1.898338, 1.274652, 2.029434, 1, 1, 1, 1, 1,
1.913283, -1.864885, 1.868663, 1, 1, 1, 1, 1,
1.917077, 0.7386885, 0.609064, 1, 1, 1, 1, 1,
1.973443, -2.845592, 2.964317, 1, 1, 1, 1, 1,
2.012049, 1.416281, -0.4427065, 1, 1, 1, 1, 1,
2.073334, -0.1946113, 0.3966067, 1, 1, 1, 1, 1,
2.078449, 0.279929, 0.315681, 1, 1, 1, 1, 1,
2.086404, -0.7860653, 0.3894633, 1, 1, 1, 1, 1,
2.102609, -0.1434918, 2.160333, 1, 1, 1, 1, 1,
2.103865, -0.5829991, 1.045397, 1, 1, 1, 1, 1,
2.105011, 0.1673273, 1.910461, 1, 1, 1, 1, 1,
2.108012, -0.7313159, 1.709391, 1, 1, 1, 1, 1,
2.129694, -1.376193, 1.943294, 1, 1, 1, 1, 1,
2.137195, 0.4984952, -0.01394358, 1, 1, 1, 1, 1,
2.139165, -0.1462372, 1.348632, 1, 1, 1, 1, 1,
2.1531, -0.1949073, 2.086292, 0, 0, 1, 1, 1,
2.203387, 0.07992609, 1.843157, 1, 0, 0, 1, 1,
2.246587, -1.714579, 1.991452, 1, 0, 0, 1, 1,
2.29094, 2.462726, 0.1182688, 1, 0, 0, 1, 1,
2.345442, -0.2224, 0.2040404, 1, 0, 0, 1, 1,
2.345451, 0.6286214, 2.578878, 1, 0, 0, 1, 1,
2.364299, -1.31211, 1.97409, 0, 0, 0, 1, 1,
2.36998, -0.2801985, 1.593916, 0, 0, 0, 1, 1,
2.406807, -0.7424711, 1.09703, 0, 0, 0, 1, 1,
2.40742, 0.4358584, 1.481702, 0, 0, 0, 1, 1,
2.424742, 0.50975, 0.4138153, 0, 0, 0, 1, 1,
2.456414, 0.7976106, 1.214971, 0, 0, 0, 1, 1,
2.520204, -0.4104269, 1.357518, 0, 0, 0, 1, 1,
2.596015, 1.875199, 1.906747, 1, 1, 1, 1, 1,
2.59895, -1.09372, 1.450349, 1, 1, 1, 1, 1,
2.63519, 0.8751258, -0.9039464, 1, 1, 1, 1, 1,
2.682803, -1.324657, 1.718895, 1, 1, 1, 1, 1,
2.72733, -0.3912888, 0.4952278, 1, 1, 1, 1, 1,
2.796733, 0.1172383, 1.042283, 1, 1, 1, 1, 1,
3.250124, 0.5568208, 0.6983399, 1, 1, 1, 1, 1
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
var radius = 9.138794;
var distance = 32.09962;
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
mvMatrix.translate( -0.2950541, 0.225248, -0.03623676 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.09962);
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
