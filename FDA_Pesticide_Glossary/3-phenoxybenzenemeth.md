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
-3.304874, -0.9680095, -1.189522, 1, 0, 0, 1,
-3.195144, -0.3119241, -1.451031, 1, 0.007843138, 0, 1,
-3.101258, 1.127403, -1.521172, 1, 0.01176471, 0, 1,
-2.648183, -1.848616, -2.835114, 1, 0.01960784, 0, 1,
-2.465508, 1.279078, -2.321118, 1, 0.02352941, 0, 1,
-2.309278, 0.4706315, -0.1703276, 1, 0.03137255, 0, 1,
-2.306643, 0.5654318, -1.384273, 1, 0.03529412, 0, 1,
-2.293003, -0.9585864, -1.571473, 1, 0.04313726, 0, 1,
-2.223432, 0.4185842, -0.8908366, 1, 0.04705882, 0, 1,
-2.212778, -1.261809, -2.835584, 1, 0.05490196, 0, 1,
-2.179878, 0.6696722, -0.07221457, 1, 0.05882353, 0, 1,
-2.171992, 1.274291, -1.088482, 1, 0.06666667, 0, 1,
-2.164778, -0.0362777, -2.520616, 1, 0.07058824, 0, 1,
-2.144263, 0.378619, -0.3815034, 1, 0.07843138, 0, 1,
-2.126725, 1.609884, -2.0274, 1, 0.08235294, 0, 1,
-2.122499, 0.9964159, -0.4702052, 1, 0.09019608, 0, 1,
-2.108576, -0.312042, -2.530165, 1, 0.09411765, 0, 1,
-2.103269, -1.090289, -2.657322, 1, 0.1019608, 0, 1,
-2.100122, -0.06416635, -1.432468, 1, 0.1098039, 0, 1,
-2.076039, 1.007441, 0.02180649, 1, 0.1137255, 0, 1,
-2.073743, -0.5028043, -1.82162, 1, 0.1215686, 0, 1,
-2.065176, -0.3220477, 1.720538, 1, 0.1254902, 0, 1,
-2.042821, 1.607752, -1.365641, 1, 0.1333333, 0, 1,
-2.041749, -1.595575, 0.1134432, 1, 0.1372549, 0, 1,
-2.037816, -0.2764901, -0.6733077, 1, 0.145098, 0, 1,
-2.036164, 0.5451156, -0.9238552, 1, 0.1490196, 0, 1,
-1.994956, 0.7756457, -1.814662, 1, 0.1568628, 0, 1,
-1.994521, 0.0418806, -2.032895, 1, 0.1607843, 0, 1,
-1.944683, 0.5690115, -0.5564544, 1, 0.1686275, 0, 1,
-1.930551, -0.1102361, -1.019651, 1, 0.172549, 0, 1,
-1.928322, 0.1701981, -0.5731749, 1, 0.1803922, 0, 1,
-1.923649, 0.1759038, -2.005015, 1, 0.1843137, 0, 1,
-1.879815, -0.4888009, -2.460986, 1, 0.1921569, 0, 1,
-1.875852, -0.1686053, -1.401378, 1, 0.1960784, 0, 1,
-1.855049, -2.430494, -4.400962, 1, 0.2039216, 0, 1,
-1.850065, -0.2099738, -3.057722, 1, 0.2117647, 0, 1,
-1.845982, 2.237871, -0.485827, 1, 0.2156863, 0, 1,
-1.828806, -0.4067037, -2.530982, 1, 0.2235294, 0, 1,
-1.815814, 1.152271, -1.211746, 1, 0.227451, 0, 1,
-1.797289, 0.6836687, -2.479301, 1, 0.2352941, 0, 1,
-1.791286, 0.9381524, 0.8603312, 1, 0.2392157, 0, 1,
-1.785902, -0.02332692, -1.687601, 1, 0.2470588, 0, 1,
-1.783543, 1.402316, -1.109954, 1, 0.2509804, 0, 1,
-1.766301, 0.4883778, -1.171931, 1, 0.2588235, 0, 1,
-1.765595, -0.201418, -2.842499, 1, 0.2627451, 0, 1,
-1.761008, -0.5919686, -0.9633454, 1, 0.2705882, 0, 1,
-1.758829, 0.06733738, -2.744133, 1, 0.2745098, 0, 1,
-1.741168, 0.8695774, -2.607486, 1, 0.282353, 0, 1,
-1.731068, 0.730076, -0.3664902, 1, 0.2862745, 0, 1,
-1.7258, 0.9709549, -0.0584654, 1, 0.2941177, 0, 1,
-1.716133, 0.5609199, -0.7854448, 1, 0.3019608, 0, 1,
-1.689484, -0.1924096, -1.683185, 1, 0.3058824, 0, 1,
-1.679361, -0.863346, -2.729589, 1, 0.3137255, 0, 1,
-1.666233, -1.649241, -2.922136, 1, 0.3176471, 0, 1,
-1.664214, 1.858644, 0.5035638, 1, 0.3254902, 0, 1,
-1.656798, 0.6787246, -2.022354, 1, 0.3294118, 0, 1,
-1.649628, -1.390362, -2.847377, 1, 0.3372549, 0, 1,
-1.636629, -2.511498, -2.680279, 1, 0.3411765, 0, 1,
-1.635397, -0.4172083, -2.265242, 1, 0.3490196, 0, 1,
-1.634187, -0.8365029, -1.869196, 1, 0.3529412, 0, 1,
-1.632313, 0.2135654, -2.816331, 1, 0.3607843, 0, 1,
-1.619036, 0.1674696, -1.576971, 1, 0.3647059, 0, 1,
-1.617895, 0.4651383, -2.170025, 1, 0.372549, 0, 1,
-1.615253, 0.726315, -1.084383, 1, 0.3764706, 0, 1,
-1.613566, -0.9832838, -4.000796, 1, 0.3843137, 0, 1,
-1.598209, -0.1466089, -2.486635, 1, 0.3882353, 0, 1,
-1.576243, 0.145762, -2.525437, 1, 0.3960784, 0, 1,
-1.570153, -0.906456, -1.955656, 1, 0.4039216, 0, 1,
-1.566218, -1.526741, -2.870284, 1, 0.4078431, 0, 1,
-1.562433, 0.6465847, -0.8775925, 1, 0.4156863, 0, 1,
-1.547817, 0.5174135, -2.030661, 1, 0.4196078, 0, 1,
-1.525425, -0.3152136, -2.773579, 1, 0.427451, 0, 1,
-1.524727, 0.2532887, -0.3991468, 1, 0.4313726, 0, 1,
-1.508729, 0.6549793, -1.336013, 1, 0.4392157, 0, 1,
-1.508098, 0.5115543, -1.478289, 1, 0.4431373, 0, 1,
-1.499949, 0.6460116, -3.248745, 1, 0.4509804, 0, 1,
-1.486859, 0.5467896, -2.116498, 1, 0.454902, 0, 1,
-1.486205, -0.01892428, -3.356118, 1, 0.4627451, 0, 1,
-1.471348, -0.5125242, -1.110414, 1, 0.4666667, 0, 1,
-1.470287, 0.03300507, -2.290003, 1, 0.4745098, 0, 1,
-1.465847, 1.306426, 1.190235, 1, 0.4784314, 0, 1,
-1.455925, -1.145763, -3.186131, 1, 0.4862745, 0, 1,
-1.442035, -0.7014111, -2.02454, 1, 0.4901961, 0, 1,
-1.441074, 0.4737716, -4.112453, 1, 0.4980392, 0, 1,
-1.438185, 0.009904982, -1.775162, 1, 0.5058824, 0, 1,
-1.438083, 0.2776495, -0.6625953, 1, 0.509804, 0, 1,
-1.434874, 0.8675735, -0.6136112, 1, 0.5176471, 0, 1,
-1.427306, -0.7111146, -1.942458, 1, 0.5215687, 0, 1,
-1.426, -1.465449, -1.267847, 1, 0.5294118, 0, 1,
-1.425294, 1.189549, -0.6067054, 1, 0.5333334, 0, 1,
-1.421913, 1.360011, -0.6908121, 1, 0.5411765, 0, 1,
-1.421302, -0.2053914, -1.588317, 1, 0.5450981, 0, 1,
-1.417592, 1.418155, 0.3585686, 1, 0.5529412, 0, 1,
-1.416483, 0.5067675, -1.00607, 1, 0.5568628, 0, 1,
-1.403066, -0.8062951, -4.041626, 1, 0.5647059, 0, 1,
-1.400913, 0.04563485, -3.172659, 1, 0.5686275, 0, 1,
-1.392138, 0.1236002, -2.751086, 1, 0.5764706, 0, 1,
-1.3722, 2.342926, -1.625009, 1, 0.5803922, 0, 1,
-1.362888, 1.757165, -0.7422242, 1, 0.5882353, 0, 1,
-1.359053, -0.3763418, -3.254838, 1, 0.5921569, 0, 1,
-1.350859, -0.6568279, -1.490111, 1, 0.6, 0, 1,
-1.339136, 0.5806638, -3.345787, 1, 0.6078432, 0, 1,
-1.333809, -0.5074725, -2.721139, 1, 0.6117647, 0, 1,
-1.32753, 0.2721596, 0.7842979, 1, 0.6196079, 0, 1,
-1.325893, -0.1397623, -2.608154, 1, 0.6235294, 0, 1,
-1.324648, 0.4413158, -2.647024, 1, 0.6313726, 0, 1,
-1.318843, 0.5891883, -2.727681, 1, 0.6352941, 0, 1,
-1.313172, 1.695134, 0.2734389, 1, 0.6431373, 0, 1,
-1.310705, 0.8127317, -1.149433, 1, 0.6470588, 0, 1,
-1.30704, 0.6108891, -1.636072, 1, 0.654902, 0, 1,
-1.303915, -1.070901, -1.912691, 1, 0.6588235, 0, 1,
-1.303131, 0.9332357, -0.6022998, 1, 0.6666667, 0, 1,
-1.302509, 0.8292376, -0.9499086, 1, 0.6705883, 0, 1,
-1.295355, 0.6040104, -0.9825355, 1, 0.6784314, 0, 1,
-1.28514, -1.246426, -1.38112, 1, 0.682353, 0, 1,
-1.277791, 1.117823, 1.226317, 1, 0.6901961, 0, 1,
-1.272016, -1.148424, -2.429548, 1, 0.6941177, 0, 1,
-1.268474, 1.490384, -0.9707106, 1, 0.7019608, 0, 1,
-1.265923, -0.6639938, -2.202589, 1, 0.7098039, 0, 1,
-1.263334, 1.498572, -1.01746, 1, 0.7137255, 0, 1,
-1.260926, -0.6308259, -2.517852, 1, 0.7215686, 0, 1,
-1.259146, -1.027542, -1.319298, 1, 0.7254902, 0, 1,
-1.25663, -1.109451, -3.737314, 1, 0.7333333, 0, 1,
-1.250306, 0.2452814, -3.589229, 1, 0.7372549, 0, 1,
-1.249466, -1.080856, -2.439887, 1, 0.7450981, 0, 1,
-1.237036, 1.037536, -1.875989, 1, 0.7490196, 0, 1,
-1.231169, 0.06751031, -3.002283, 1, 0.7568628, 0, 1,
-1.2289, -0.3287876, -2.579518, 1, 0.7607843, 0, 1,
-1.221108, 0.439395, -1.664494, 1, 0.7686275, 0, 1,
-1.211997, -1.198524, -0.08328705, 1, 0.772549, 0, 1,
-1.21177, -1.636239, -1.059612, 1, 0.7803922, 0, 1,
-1.204341, 3.159825, -1.745639, 1, 0.7843137, 0, 1,
-1.194059, 0.293564, -0.7250219, 1, 0.7921569, 0, 1,
-1.18832, 0.103073, -2.983031, 1, 0.7960784, 0, 1,
-1.18088, 0.05890517, -2.394388, 1, 0.8039216, 0, 1,
-1.170362, 2.166142, -1.631352, 1, 0.8117647, 0, 1,
-1.162688, -0.8890364, -3.224432, 1, 0.8156863, 0, 1,
-1.15379, 1.859385, 1.458119, 1, 0.8235294, 0, 1,
-1.147074, 1.826493, -2.709425, 1, 0.827451, 0, 1,
-1.146549, -0.3002422, -2.414343, 1, 0.8352941, 0, 1,
-1.143406, -0.4134647, -2.57273, 1, 0.8392157, 0, 1,
-1.136726, 0.1118067, -0.7970054, 1, 0.8470588, 0, 1,
-1.135423, -0.01411799, -2.134025, 1, 0.8509804, 0, 1,
-1.125001, -0.3185631, -2.032996, 1, 0.8588235, 0, 1,
-1.123246, -1.366666, -3.202888, 1, 0.8627451, 0, 1,
-1.118541, 0.1041056, -3.76347, 1, 0.8705882, 0, 1,
-1.116156, -1.549073, -2.506389, 1, 0.8745098, 0, 1,
-1.112557, -1.032161, -2.847344, 1, 0.8823529, 0, 1,
-1.112066, 0.4840015, -1.471166, 1, 0.8862745, 0, 1,
-1.091791, -0.11393, -0.3853959, 1, 0.8941177, 0, 1,
-1.088069, 0.7764947, -3.143763, 1, 0.8980392, 0, 1,
-1.083331, -0.2722135, -2.249433, 1, 0.9058824, 0, 1,
-1.073529, -1.698262, -2.924541, 1, 0.9137255, 0, 1,
-1.07123, 0.3794852, -1.958416, 1, 0.9176471, 0, 1,
-1.071086, -0.6810457, -1.07605, 1, 0.9254902, 0, 1,
-1.064009, -1.237813, -2.31963, 1, 0.9294118, 0, 1,
-1.056843, -0.284106, -1.788727, 1, 0.9372549, 0, 1,
-1.05561, 0.1621166, -2.197151, 1, 0.9411765, 0, 1,
-1.051933, -0.1209513, -2.283033, 1, 0.9490196, 0, 1,
-1.042663, 0.2099635, -0.636475, 1, 0.9529412, 0, 1,
-1.042041, 1.204663, 0.1720667, 1, 0.9607843, 0, 1,
-1.034905, -0.4274632, -2.202741, 1, 0.9647059, 0, 1,
-1.034328, -0.1237553, -0.1117354, 1, 0.972549, 0, 1,
-1.022686, -0.4770472, -3.423401, 1, 0.9764706, 0, 1,
-1.02161, -0.278108, -1.170098, 1, 0.9843137, 0, 1,
-1.018205, -0.2970159, -2.981641, 1, 0.9882353, 0, 1,
-1.008975, 0.05853267, -1.13121, 1, 0.9960784, 0, 1,
-1.007202, 2.16893, 0.03875901, 0.9960784, 1, 0, 1,
-0.9995586, 0.1671074, -1.088177, 0.9921569, 1, 0, 1,
-0.9959376, 1.083957, -1.899195, 0.9843137, 1, 0, 1,
-0.9903588, 0.1754036, -0.7594499, 0.9803922, 1, 0, 1,
-0.9850731, 2.40267, -0.7037129, 0.972549, 1, 0, 1,
-0.985056, 0.6971462, 0.3027526, 0.9686275, 1, 0, 1,
-0.9820255, 0.6971594, 0.2412663, 0.9607843, 1, 0, 1,
-0.9810646, 0.5467982, -0.9143033, 0.9568627, 1, 0, 1,
-0.9780864, 0.6636162, 0.551812, 0.9490196, 1, 0, 1,
-0.9770225, -1.243903, -3.110555, 0.945098, 1, 0, 1,
-0.9719024, 1.068686, -0.7834601, 0.9372549, 1, 0, 1,
-0.9636559, 2.118889, -1.483905, 0.9333333, 1, 0, 1,
-0.9477371, -0.7091904, -2.26043, 0.9254902, 1, 0, 1,
-0.9424183, -0.5232262, -1.24184, 0.9215686, 1, 0, 1,
-0.9395138, 1.770961, -1.255627, 0.9137255, 1, 0, 1,
-0.9357817, 0.9788435, -0.392385, 0.9098039, 1, 0, 1,
-0.9335067, -1.050593, -2.261737, 0.9019608, 1, 0, 1,
-0.9240997, 1.013328, 0.9055173, 0.8941177, 1, 0, 1,
-0.9172541, -0.05297481, -1.754084, 0.8901961, 1, 0, 1,
-0.9152067, 1.497844, -0.8901783, 0.8823529, 1, 0, 1,
-0.9145948, -0.1253588, -2.158292, 0.8784314, 1, 0, 1,
-0.9142493, 0.8657612, -0.6888362, 0.8705882, 1, 0, 1,
-0.9139757, -0.3802031, -0.7704273, 0.8666667, 1, 0, 1,
-0.9138423, -0.1268289, -2.633449, 0.8588235, 1, 0, 1,
-0.9124582, 1.037874, -0.4426582, 0.854902, 1, 0, 1,
-0.9114115, -1.215683, -2.050167, 0.8470588, 1, 0, 1,
-0.9055244, -0.1427072, -1.790832, 0.8431373, 1, 0, 1,
-0.902257, 0.1874899, -1.0778, 0.8352941, 1, 0, 1,
-0.899788, 0.1713032, -1.185084, 0.8313726, 1, 0, 1,
-0.8990157, 0.3884685, -2.652562, 0.8235294, 1, 0, 1,
-0.8958582, 0.7478125, -0.3067506, 0.8196079, 1, 0, 1,
-0.8873254, 0.9951617, 1.54463, 0.8117647, 1, 0, 1,
-0.8858818, 0.4745969, -2.682876, 0.8078431, 1, 0, 1,
-0.8851465, -0.2980202, -2.316985, 0.8, 1, 0, 1,
-0.8652178, 0.9226907, 0.09347961, 0.7921569, 1, 0, 1,
-0.8624035, 1.866863, -1.687006, 0.7882353, 1, 0, 1,
-0.8552296, -0.8274143, -4.289829, 0.7803922, 1, 0, 1,
-0.8540924, -0.2631842, -1.39591, 0.7764706, 1, 0, 1,
-0.8538232, 1.569488, -0.1315332, 0.7686275, 1, 0, 1,
-0.8462903, -0.2684197, -0.9588808, 0.7647059, 1, 0, 1,
-0.8432904, -0.2317726, -2.767908, 0.7568628, 1, 0, 1,
-0.8409858, 1.041968, -0.1857996, 0.7529412, 1, 0, 1,
-0.8314714, -1.560224, -1.10762, 0.7450981, 1, 0, 1,
-0.8309999, 0.8361596, -0.7276651, 0.7411765, 1, 0, 1,
-0.8301059, -2.30146, -0.8861474, 0.7333333, 1, 0, 1,
-0.8283256, 1.347625, -0.6666337, 0.7294118, 1, 0, 1,
-0.8251718, -1.058646, -1.918638, 0.7215686, 1, 0, 1,
-0.8238931, -1.315405, -2.38582, 0.7176471, 1, 0, 1,
-0.8219528, -1.273526, -3.538888, 0.7098039, 1, 0, 1,
-0.8208422, 1.046767, -1.180741, 0.7058824, 1, 0, 1,
-0.8169899, -0.8824098, -2.728459, 0.6980392, 1, 0, 1,
-0.813917, 1.016067, -0.7324578, 0.6901961, 1, 0, 1,
-0.8120468, -1.041827, -2.854496, 0.6862745, 1, 0, 1,
-0.811672, -0.5959557, -0.7552549, 0.6784314, 1, 0, 1,
-0.8092518, -0.1974137, -2.213985, 0.6745098, 1, 0, 1,
-0.8062132, -1.639228, -2.665229, 0.6666667, 1, 0, 1,
-0.7932509, -0.5318028, -3.003826, 0.6627451, 1, 0, 1,
-0.7762768, 0.4549045, -0.9627025, 0.654902, 1, 0, 1,
-0.7726954, -0.5236079, -3.992404, 0.6509804, 1, 0, 1,
-0.7704402, -0.06372105, -3.507741, 0.6431373, 1, 0, 1,
-0.7665273, -0.2572832, -3.441025, 0.6392157, 1, 0, 1,
-0.7608129, 0.2461635, -3.397069, 0.6313726, 1, 0, 1,
-0.7556092, -0.1596329, -3.292878, 0.627451, 1, 0, 1,
-0.7534238, 0.5704762, -0.6652761, 0.6196079, 1, 0, 1,
-0.7520701, -0.0692234, -1.844157, 0.6156863, 1, 0, 1,
-0.7465101, 1.105091, -0.890582, 0.6078432, 1, 0, 1,
-0.7399301, 1.946362, 1.187564, 0.6039216, 1, 0, 1,
-0.7356273, 1.472872, 0.4870427, 0.5960785, 1, 0, 1,
-0.7349285, -0.99081, -3.294691, 0.5882353, 1, 0, 1,
-0.7323356, -0.1439355, -1.057546, 0.5843138, 1, 0, 1,
-0.7322872, 0.06620471, 0.00284317, 0.5764706, 1, 0, 1,
-0.7284046, -1.060168, -2.382714, 0.572549, 1, 0, 1,
-0.7248582, -0.5775436, -2.562759, 0.5647059, 1, 0, 1,
-0.7216787, 0.6113393, 1.34704, 0.5607843, 1, 0, 1,
-0.7122463, -0.9325607, -2.046497, 0.5529412, 1, 0, 1,
-0.7112108, -0.4167937, -2.179988, 0.5490196, 1, 0, 1,
-0.7083586, 0.2453392, -2.509711, 0.5411765, 1, 0, 1,
-0.7026172, 0.4122003, -1.956197, 0.5372549, 1, 0, 1,
-0.7005238, 0.7066341, -1.06472, 0.5294118, 1, 0, 1,
-0.6995237, -0.3016275, -1.438403, 0.5254902, 1, 0, 1,
-0.6979832, -0.02579025, -2.191332, 0.5176471, 1, 0, 1,
-0.6979348, 1.587425, 1.925001, 0.5137255, 1, 0, 1,
-0.6956969, 0.3905708, -0.8081418, 0.5058824, 1, 0, 1,
-0.6926026, 0.7480645, -0.1752144, 0.5019608, 1, 0, 1,
-0.691774, -0.844337, -2.862756, 0.4941176, 1, 0, 1,
-0.6870457, 0.2604645, -2.133499, 0.4862745, 1, 0, 1,
-0.6866095, 0.6904025, -1.790504, 0.4823529, 1, 0, 1,
-0.6815639, -0.4579508, -2.996807, 0.4745098, 1, 0, 1,
-0.6771125, 0.07639079, -1.637587, 0.4705882, 1, 0, 1,
-0.6729885, 0.3243215, -2.15108, 0.4627451, 1, 0, 1,
-0.6716844, 0.5852501, 0.2232801, 0.4588235, 1, 0, 1,
-0.6674875, -1.353557, -2.594967, 0.4509804, 1, 0, 1,
-0.66694, 1.15686, -2.810628, 0.4470588, 1, 0, 1,
-0.665445, 0.7515451, -0.3373218, 0.4392157, 1, 0, 1,
-0.6650321, -1.222083, -1.627199, 0.4352941, 1, 0, 1,
-0.659138, 0.8597573, 0.4230607, 0.427451, 1, 0, 1,
-0.65622, -0.7863917, -3.872028, 0.4235294, 1, 0, 1,
-0.6501011, 1.51337, -0.8841078, 0.4156863, 1, 0, 1,
-0.6425389, 0.4896037, 1.00873, 0.4117647, 1, 0, 1,
-0.6419219, 0.9719961, 0.5615328, 0.4039216, 1, 0, 1,
-0.6396836, 0.6604787, -1.608242, 0.3960784, 1, 0, 1,
-0.6392745, 0.1635631, -2.026312, 0.3921569, 1, 0, 1,
-0.6391805, -0.4582748, -1.480849, 0.3843137, 1, 0, 1,
-0.6387343, -0.4603912, -4.900598, 0.3803922, 1, 0, 1,
-0.6340334, -0.05811727, -4.036424, 0.372549, 1, 0, 1,
-0.6335384, 0.03248279, -1.558617, 0.3686275, 1, 0, 1,
-0.6324874, 0.2759998, -2.054657, 0.3607843, 1, 0, 1,
-0.6306958, -0.7122526, 0.2967932, 0.3568628, 1, 0, 1,
-0.6276353, -1.866134, -2.042699, 0.3490196, 1, 0, 1,
-0.625877, 1.932351, 0.5441383, 0.345098, 1, 0, 1,
-0.6254916, -2.158722, -2.70928, 0.3372549, 1, 0, 1,
-0.6243636, 0.3413005, -2.869805, 0.3333333, 1, 0, 1,
-0.6232029, -0.4959098, -2.572858, 0.3254902, 1, 0, 1,
-0.6165496, -1.389723, -1.083039, 0.3215686, 1, 0, 1,
-0.6157668, -0.41643, -2.553982, 0.3137255, 1, 0, 1,
-0.6123566, 0.489771, -1.482893, 0.3098039, 1, 0, 1,
-0.6103603, 0.6228365, 0.2267654, 0.3019608, 1, 0, 1,
-0.5989579, -1.404403, -2.945564, 0.2941177, 1, 0, 1,
-0.597165, 1.102453, -1.260754, 0.2901961, 1, 0, 1,
-0.5970811, -2.690445, -3.131136, 0.282353, 1, 0, 1,
-0.5940439, -0.3170066, -3.092091, 0.2784314, 1, 0, 1,
-0.5895293, -0.2827962, -2.346131, 0.2705882, 1, 0, 1,
-0.5846573, 0.06800379, -1.655183, 0.2666667, 1, 0, 1,
-0.5811514, -1.064389, -2.594717, 0.2588235, 1, 0, 1,
-0.5778584, 0.0604844, -1.5708, 0.254902, 1, 0, 1,
-0.5756788, -0.5040305, -2.530612, 0.2470588, 1, 0, 1,
-0.5705756, -0.4719909, -2.670586, 0.2431373, 1, 0, 1,
-0.5679398, 0.06876069, -0.1919795, 0.2352941, 1, 0, 1,
-0.5648723, 0.8250722, 0.3841141, 0.2313726, 1, 0, 1,
-0.5614396, -0.4849993, -2.678492, 0.2235294, 1, 0, 1,
-0.560118, -1.192197, -4.154994, 0.2196078, 1, 0, 1,
-0.5485103, 0.320751, -0.9611921, 0.2117647, 1, 0, 1,
-0.5439757, 0.9889969, -1.117532, 0.2078431, 1, 0, 1,
-0.5430371, 0.1354453, -3.415145, 0.2, 1, 0, 1,
-0.5370474, 2.04528, -0.2778513, 0.1921569, 1, 0, 1,
-0.5345703, -0.5150658, -3.051004, 0.1882353, 1, 0, 1,
-0.5315563, -1.102989, -1.754927, 0.1803922, 1, 0, 1,
-0.5287402, -0.09899375, -2.148391, 0.1764706, 1, 0, 1,
-0.5234045, 2.248481, -2.54732, 0.1686275, 1, 0, 1,
-0.5199775, 0.4716, -1.102501, 0.1647059, 1, 0, 1,
-0.5185103, 2.295878, 1.125206, 0.1568628, 1, 0, 1,
-0.5178185, -0.3502292, -2.498829, 0.1529412, 1, 0, 1,
-0.5101131, 0.7116187, -1.814211, 0.145098, 1, 0, 1,
-0.5022637, 0.2535879, -0.7234766, 0.1411765, 1, 0, 1,
-0.4999333, -2.025028, -3.402465, 0.1333333, 1, 0, 1,
-0.4995218, -0.6564654, -3.48325, 0.1294118, 1, 0, 1,
-0.4993746, 1.159644, -1.286795, 0.1215686, 1, 0, 1,
-0.4966466, -0.7814787, -2.982774, 0.1176471, 1, 0, 1,
-0.4948629, -0.8301097, -2.277111, 0.1098039, 1, 0, 1,
-0.4897302, 0.3773159, -0.3550859, 0.1058824, 1, 0, 1,
-0.4889007, -0.6434522, -3.251021, 0.09803922, 1, 0, 1,
-0.4834397, -0.1970647, -0.1368262, 0.09019608, 1, 0, 1,
-0.4824815, -0.05073792, -1.325181, 0.08627451, 1, 0, 1,
-0.4820218, -0.7081878, -2.936233, 0.07843138, 1, 0, 1,
-0.475271, -1.454757, -2.698128, 0.07450981, 1, 0, 1,
-0.4746974, -0.5747633, -3.157544, 0.06666667, 1, 0, 1,
-0.4744689, 1.114966, 0.2740358, 0.0627451, 1, 0, 1,
-0.471604, -1.480544, -2.082822, 0.05490196, 1, 0, 1,
-0.4708858, -1.257043, -3.670514, 0.05098039, 1, 0, 1,
-0.4629865, -2.079974, -6.11398, 0.04313726, 1, 0, 1,
-0.4515803, 0.3529046, -0.2677436, 0.03921569, 1, 0, 1,
-0.4497645, -0.1944892, -1.728083, 0.03137255, 1, 0, 1,
-0.449558, 1.086974, 2.316926, 0.02745098, 1, 0, 1,
-0.4482183, 0.0569391, -1.796226, 0.01960784, 1, 0, 1,
-0.446103, 0.1404082, -1.4832, 0.01568628, 1, 0, 1,
-0.4432549, 2.136582, 1.216171, 0.007843138, 1, 0, 1,
-0.4419151, -1.331805, -1.950608, 0.003921569, 1, 0, 1,
-0.4389623, 0.05199517, -2.414716, 0, 1, 0.003921569, 1,
-0.4340832, -1.84542, -4.5132, 0, 1, 0.01176471, 1,
-0.4333863, 0.1422729, -1.346482, 0, 1, 0.01568628, 1,
-0.4319882, -0.1672385, -1.362148, 0, 1, 0.02352941, 1,
-0.4304827, -1.72879, -2.227682, 0, 1, 0.02745098, 1,
-0.4302695, 0.7276764, 0.6790968, 0, 1, 0.03529412, 1,
-0.4278587, -0.6498293, -3.427191, 0, 1, 0.03921569, 1,
-0.4225219, -0.5285614, -2.253184, 0, 1, 0.04705882, 1,
-0.4158961, -0.6344624, -2.901689, 0, 1, 0.05098039, 1,
-0.4078391, -0.4591998, -1.619767, 0, 1, 0.05882353, 1,
-0.4068276, -1.352285, -4.40376, 0, 1, 0.0627451, 1,
-0.404082, 0.04678828, -2.389021, 0, 1, 0.07058824, 1,
-0.4039342, 0.4027524, 0.1970144, 0, 1, 0.07450981, 1,
-0.4033498, 0.3128126, -0.04197456, 0, 1, 0.08235294, 1,
-0.4025726, -0.1164649, 0.3422112, 0, 1, 0.08627451, 1,
-0.4024352, 0.9317684, 0.121753, 0, 1, 0.09411765, 1,
-0.4004458, -1.421066, -3.288172, 0, 1, 0.1019608, 1,
-0.3867936, -0.2638332, -3.865592, 0, 1, 0.1058824, 1,
-0.3851192, -1.11965, -3.638159, 0, 1, 0.1137255, 1,
-0.3826511, -1.012787, -2.341714, 0, 1, 0.1176471, 1,
-0.3728089, 0.07250214, -1.135206, 0, 1, 0.1254902, 1,
-0.3672801, 1.614518, -0.4340499, 0, 1, 0.1294118, 1,
-0.3419867, -0.1333145, -3.209841, 0, 1, 0.1372549, 1,
-0.3412215, 0.2090963, 0.2390585, 0, 1, 0.1411765, 1,
-0.3395852, -0.5562779, -4.727582, 0, 1, 0.1490196, 1,
-0.3384651, 0.4785854, -0.5236001, 0, 1, 0.1529412, 1,
-0.3374003, 1.873565, 0.5495929, 0, 1, 0.1607843, 1,
-0.3371364, -0.0003072626, -1.148743, 0, 1, 0.1647059, 1,
-0.3340625, -0.2611982, -3.369699, 0, 1, 0.172549, 1,
-0.3334953, 0.6475838, 0.6855505, 0, 1, 0.1764706, 1,
-0.3318397, -0.3612554, -2.717987, 0, 1, 0.1843137, 1,
-0.327888, 0.6751472, 0.05619128, 0, 1, 0.1882353, 1,
-0.326979, -0.6286442, -2.074122, 0, 1, 0.1960784, 1,
-0.3235449, 0.227903, -2.226391, 0, 1, 0.2039216, 1,
-0.3213544, -0.6089962, -2.271629, 0, 1, 0.2078431, 1,
-0.3209083, 0.1924146, -1.876337, 0, 1, 0.2156863, 1,
-0.3173783, 0.4265304, -0.1242273, 0, 1, 0.2196078, 1,
-0.3094784, -0.4110153, -1.997424, 0, 1, 0.227451, 1,
-0.3082863, -0.5717223, -3.385772, 0, 1, 0.2313726, 1,
-0.3044282, -0.9880319, -2.19287, 0, 1, 0.2392157, 1,
-0.3041115, -0.2647533, -2.545876, 0, 1, 0.2431373, 1,
-0.3040128, -1.268379, -2.538404, 0, 1, 0.2509804, 1,
-0.3024001, -0.8541, -2.039401, 0, 1, 0.254902, 1,
-0.3023959, 0.3008962, -0.190637, 0, 1, 0.2627451, 1,
-0.3016235, 1.148261, -0.6935853, 0, 1, 0.2666667, 1,
-0.2974717, -0.6032181, -3.60873, 0, 1, 0.2745098, 1,
-0.2948137, 0.4093142, -0.6621302, 0, 1, 0.2784314, 1,
-0.2939951, 0.3349484, -0.7907887, 0, 1, 0.2862745, 1,
-0.2866902, -0.8738194, -3.048018, 0, 1, 0.2901961, 1,
-0.2835303, -2.039478, -4.761307, 0, 1, 0.2980392, 1,
-0.2783607, -1.106905, -2.72589, 0, 1, 0.3058824, 1,
-0.2740012, -0.7836943, -2.49578, 0, 1, 0.3098039, 1,
-0.2729467, -1.70396, -1.765242, 0, 1, 0.3176471, 1,
-0.2725237, -2.255063, -4.030813, 0, 1, 0.3215686, 1,
-0.2692123, 0.2851236, -2.124861, 0, 1, 0.3294118, 1,
-0.2691232, -0.5500387, -2.923796, 0, 1, 0.3333333, 1,
-0.2589435, 0.6425185, -2.237881, 0, 1, 0.3411765, 1,
-0.2584026, -1.558685, -3.256954, 0, 1, 0.345098, 1,
-0.2528667, -0.01460506, -2.788233, 0, 1, 0.3529412, 1,
-0.2497981, -0.4496763, -1.536392, 0, 1, 0.3568628, 1,
-0.2494235, 1.218966, 1.555072, 0, 1, 0.3647059, 1,
-0.2481829, -1.347562, -4.51071, 0, 1, 0.3686275, 1,
-0.2471932, 0.475293, 0.942461, 0, 1, 0.3764706, 1,
-0.2466282, -0.05290749, -3.397017, 0, 1, 0.3803922, 1,
-0.245647, 1.725718, -0.2816108, 0, 1, 0.3882353, 1,
-0.2408057, 0.3636872, -2.076124, 0, 1, 0.3921569, 1,
-0.2363339, -0.3277005, -3.778042, 0, 1, 0.4, 1,
-0.2334289, 0.7702105, -0.8350714, 0, 1, 0.4078431, 1,
-0.2280528, -0.8013939, -3.12608, 0, 1, 0.4117647, 1,
-0.2240984, -0.01620857, -1.22257, 0, 1, 0.4196078, 1,
-0.2238278, 0.557619, -1.941222, 0, 1, 0.4235294, 1,
-0.2233427, 0.4778037, -2.27247, 0, 1, 0.4313726, 1,
-0.2225005, 1.002489, -0.9130784, 0, 1, 0.4352941, 1,
-0.2191091, 0.04626782, -2.068588, 0, 1, 0.4431373, 1,
-0.2177976, 1.813284, -0.6389984, 0, 1, 0.4470588, 1,
-0.2171508, 2.065787, 0.2081287, 0, 1, 0.454902, 1,
-0.2156656, -0.4794731, -1.858786, 0, 1, 0.4588235, 1,
-0.2138852, -0.754141, -3.40231, 0, 1, 0.4666667, 1,
-0.2137032, -1.291971, -3.284154, 0, 1, 0.4705882, 1,
-0.2123032, -0.08822981, -2.492649, 0, 1, 0.4784314, 1,
-0.2085195, 1.370685, 0.3287207, 0, 1, 0.4823529, 1,
-0.2083133, -0.8398012, -2.105885, 0, 1, 0.4901961, 1,
-0.2072963, 0.7432758, 0.6355717, 0, 1, 0.4941176, 1,
-0.2062329, -0.4894583, -2.342016, 0, 1, 0.5019608, 1,
-0.2031469, -0.9853569, -3.080045, 0, 1, 0.509804, 1,
-0.2012206, -0.9574286, -3.467719, 0, 1, 0.5137255, 1,
-0.2000326, -0.3013413, -2.656765, 0, 1, 0.5215687, 1,
-0.1969355, -0.009915337, -1.62922, 0, 1, 0.5254902, 1,
-0.1946947, 1.311476, -0.7219313, 0, 1, 0.5333334, 1,
-0.1926702, -0.2441946, -2.523828, 0, 1, 0.5372549, 1,
-0.1925853, 0.881612, 0.7140692, 0, 1, 0.5450981, 1,
-0.1912501, 0.2190063, -0.7289476, 0, 1, 0.5490196, 1,
-0.1884729, 1.270614, -0.7875903, 0, 1, 0.5568628, 1,
-0.1866058, 1.019011, -0.8635954, 0, 1, 0.5607843, 1,
-0.1865569, -0.6451104, -3.360643, 0, 1, 0.5686275, 1,
-0.1863335, 0.5386367, -0.596889, 0, 1, 0.572549, 1,
-0.1799083, 0.4896109, -1.27978, 0, 1, 0.5803922, 1,
-0.1782986, -0.3670931, -1.648346, 0, 1, 0.5843138, 1,
-0.1764163, 2.125718, 0.5825096, 0, 1, 0.5921569, 1,
-0.1751491, -0.498542, -2.290354, 0, 1, 0.5960785, 1,
-0.1662864, 2.171233, 0.6406707, 0, 1, 0.6039216, 1,
-0.166016, 0.8773605, 0.4109821, 0, 1, 0.6117647, 1,
-0.165182, 0.3317631, -1.066016, 0, 1, 0.6156863, 1,
-0.1621973, -0.769502, -0.8788834, 0, 1, 0.6235294, 1,
-0.1588626, -1.867932, -1.873383, 0, 1, 0.627451, 1,
-0.157554, -0.8701455, -3.007539, 0, 1, 0.6352941, 1,
-0.1571899, -0.7958382, -3.047885, 0, 1, 0.6392157, 1,
-0.1528557, -1.911558, -4.945347, 0, 1, 0.6470588, 1,
-0.1510868, 0.9189814, -1.398769, 0, 1, 0.6509804, 1,
-0.1504391, 0.255753, -0.6772109, 0, 1, 0.6588235, 1,
-0.148231, 0.002419301, -3.200267, 0, 1, 0.6627451, 1,
-0.1431435, -0.4658857, -1.246714, 0, 1, 0.6705883, 1,
-0.1416899, 0.134066, 0.01982569, 0, 1, 0.6745098, 1,
-0.1397475, -0.6308088, -4.123724, 0, 1, 0.682353, 1,
-0.1397372, -0.7906127, -3.854579, 0, 1, 0.6862745, 1,
-0.1343061, 1.144255, 1.598496, 0, 1, 0.6941177, 1,
-0.1329369, 0.8134471, 0.213036, 0, 1, 0.7019608, 1,
-0.1304435, -0.2143941, -3.185805, 0, 1, 0.7058824, 1,
-0.1284026, -1.252898, -4.254274, 0, 1, 0.7137255, 1,
-0.1241561, -0.7894076, -2.344145, 0, 1, 0.7176471, 1,
-0.1208969, 0.7897022, 1.379496, 0, 1, 0.7254902, 1,
-0.1171459, -0.489914, -4.865525, 0, 1, 0.7294118, 1,
-0.1156491, 0.5520345, 0.5793056, 0, 1, 0.7372549, 1,
-0.1065116, 0.8668073, -0.1592969, 0, 1, 0.7411765, 1,
-0.1032163, -0.1076899, -3.071016, 0, 1, 0.7490196, 1,
-0.1019948, -0.6567912, -2.457484, 0, 1, 0.7529412, 1,
-0.1003888, -1.196614, -1.034884, 0, 1, 0.7607843, 1,
-0.09941459, -1.352448, -3.707575, 0, 1, 0.7647059, 1,
-0.09849723, -0.1616516, -4.363401, 0, 1, 0.772549, 1,
-0.09135149, -0.7123317, -2.404256, 0, 1, 0.7764706, 1,
-0.08260611, -1.105939, -3.733293, 0, 1, 0.7843137, 1,
-0.08247596, -1.980618, -4.760961, 0, 1, 0.7882353, 1,
-0.07756141, 0.1612102, -0.4001281, 0, 1, 0.7960784, 1,
-0.07476488, -0.5321618, -3.428267, 0, 1, 0.8039216, 1,
-0.071421, 1.387398, 1.526536, 0, 1, 0.8078431, 1,
-0.07133891, 0.3311245, -0.3296785, 0, 1, 0.8156863, 1,
-0.07116999, 0.1433678, 0.2387372, 0, 1, 0.8196079, 1,
-0.07031613, 0.07608718, -1.507227, 0, 1, 0.827451, 1,
-0.06188709, -1.763835, -5.380015, 0, 1, 0.8313726, 1,
-0.05866297, -1.02097, -2.129033, 0, 1, 0.8392157, 1,
-0.05554153, -0.9250539, -1.643831, 0, 1, 0.8431373, 1,
-0.05387009, 0.1234505, -3.512578, 0, 1, 0.8509804, 1,
-0.04991603, -0.8246419, -2.185287, 0, 1, 0.854902, 1,
-0.04271573, 0.9173578, -1.224754, 0, 1, 0.8627451, 1,
-0.04269705, 0.5878361, -0.7479574, 0, 1, 0.8666667, 1,
-0.04234615, -0.3721839, -2.775417, 0, 1, 0.8745098, 1,
-0.0417116, -0.04037668, -1.499706, 0, 1, 0.8784314, 1,
-0.04007053, -2.484953, -2.788875, 0, 1, 0.8862745, 1,
-0.0353322, -0.1700878, -2.896154, 0, 1, 0.8901961, 1,
-0.02868356, 0.6414382, 1.481553, 0, 1, 0.8980392, 1,
-0.02806976, -1.901476, -1.752085, 0, 1, 0.9058824, 1,
-0.02627591, 0.4455865, 0.8691196, 0, 1, 0.9098039, 1,
-0.02497006, -1.871398, -2.651965, 0, 1, 0.9176471, 1,
-0.02262035, -0.8355803, -2.654398, 0, 1, 0.9215686, 1,
-0.02142032, -0.5009466, -3.961378, 0, 1, 0.9294118, 1,
-0.02137482, 3.060796, 0.08074947, 0, 1, 0.9333333, 1,
-0.02105602, 0.1432457, -0.4134959, 0, 1, 0.9411765, 1,
-0.01835693, 1.120875, 0.3648751, 0, 1, 0.945098, 1,
-0.01477844, -0.4825408, -3.750396, 0, 1, 0.9529412, 1,
-0.004546873, 0.4643596, -0.7317694, 0, 1, 0.9568627, 1,
-0.004396771, -0.4638452, -2.534868, 0, 1, 0.9647059, 1,
-0.003807112, 0.6448671, 0.1995436, 0, 1, 0.9686275, 1,
-0.002222052, 0.5939533, 0.9773561, 0, 1, 0.9764706, 1,
-0.0002640302, 1.92951, -0.02953063, 0, 1, 0.9803922, 1,
0.0001519196, -0.4922812, 2.452785, 0, 1, 0.9882353, 1,
0.002275768, -0.1886241, 3.916046, 0, 1, 0.9921569, 1,
0.01056843, -0.02548238, 4.278358, 0, 1, 1, 1,
0.01244119, 0.5237209, -0.002380726, 0, 0.9921569, 1, 1,
0.01260886, -1.59881, 3.112762, 0, 0.9882353, 1, 1,
0.01396937, -0.7488486, 3.995236, 0, 0.9803922, 1, 1,
0.01429648, 0.3159193, 0.0791096, 0, 0.9764706, 1, 1,
0.01989994, -1.053695, 1.590545, 0, 0.9686275, 1, 1,
0.02021308, 0.7180641, -1.481046, 0, 0.9647059, 1, 1,
0.0238474, 2.409017, -1.327717, 0, 0.9568627, 1, 1,
0.02525978, -0.6139828, 4.255789, 0, 0.9529412, 1, 1,
0.02690382, 0.2520831, -1.19155, 0, 0.945098, 1, 1,
0.02801216, 0.287114, -0.08405931, 0, 0.9411765, 1, 1,
0.02807427, 0.5059382, -0.2966737, 0, 0.9333333, 1, 1,
0.03088333, 1.023597, -1.48526, 0, 0.9294118, 1, 1,
0.03184507, 0.1387593, 0.3343676, 0, 0.9215686, 1, 1,
0.03188764, -1.041473, 1.530398, 0, 0.9176471, 1, 1,
0.03350442, 1.568297, 0.9080858, 0, 0.9098039, 1, 1,
0.0359512, -0.1126859, 2.405871, 0, 0.9058824, 1, 1,
0.0367444, 1.747933, -0.6280751, 0, 0.8980392, 1, 1,
0.03752812, 1.216125, 0.4830774, 0, 0.8901961, 1, 1,
0.04238248, 1.766886, -1.273931, 0, 0.8862745, 1, 1,
0.04698515, 0.6294713, -0.5429893, 0, 0.8784314, 1, 1,
0.04969921, 0.3360739, 0.2228614, 0, 0.8745098, 1, 1,
0.05081162, -1.0347, 4.715408, 0, 0.8666667, 1, 1,
0.05095769, -1.135144, 4.400569, 0, 0.8627451, 1, 1,
0.05192916, -1.359197, 3.95136, 0, 0.854902, 1, 1,
0.05404861, -1.391013, 2.823274, 0, 0.8509804, 1, 1,
0.05501116, 1.567887, 0.1278835, 0, 0.8431373, 1, 1,
0.05653168, 0.8850791, 0.4373008, 0, 0.8392157, 1, 1,
0.05728437, -1.993188, 4.109929, 0, 0.8313726, 1, 1,
0.06697841, -0.3274856, 3.825057, 0, 0.827451, 1, 1,
0.07211218, -0.5841814, 2.356126, 0, 0.8196079, 1, 1,
0.07212477, -0.6267976, 4.282328, 0, 0.8156863, 1, 1,
0.07317831, 1.694676, -0.1284428, 0, 0.8078431, 1, 1,
0.07352752, -0.1404031, 2.047231, 0, 0.8039216, 1, 1,
0.07398178, -0.740277, 4.078418, 0, 0.7960784, 1, 1,
0.07448559, -0.2563967, 1.90529, 0, 0.7882353, 1, 1,
0.07897127, -2.477018, 1.471133, 0, 0.7843137, 1, 1,
0.07950558, 0.4167908, 1.011385, 0, 0.7764706, 1, 1,
0.08305192, 0.003947097, 0.9731088, 0, 0.772549, 1, 1,
0.08745884, -0.1103618, 2.148746, 0, 0.7647059, 1, 1,
0.08810872, 1.197647, -1.421934, 0, 0.7607843, 1, 1,
0.09117845, 2.118139, 1.197911, 0, 0.7529412, 1, 1,
0.1008708, -0.07048649, 2.125237, 0, 0.7490196, 1, 1,
0.1031717, 1.371343, 0.4397867, 0, 0.7411765, 1, 1,
0.1090739, 0.9742968, -0.1868823, 0, 0.7372549, 1, 1,
0.1099809, 0.1254371, 1.376354, 0, 0.7294118, 1, 1,
0.1135086, -0.9259942, 3.47886, 0, 0.7254902, 1, 1,
0.1168445, -0.3225757, 3.738408, 0, 0.7176471, 1, 1,
0.1171622, -0.01515921, 2.543876, 0, 0.7137255, 1, 1,
0.1195374, 2.447012, -0.8968129, 0, 0.7058824, 1, 1,
0.1211753, -0.1475368, 2.568511, 0, 0.6980392, 1, 1,
0.1224803, -0.8938745, 3.419459, 0, 0.6941177, 1, 1,
0.1248141, 0.8744463, 1.167662, 0, 0.6862745, 1, 1,
0.1373267, -0.6333414, 2.011082, 0, 0.682353, 1, 1,
0.1384012, 0.05991528, 1.007285, 0, 0.6745098, 1, 1,
0.1424828, -0.04029791, 1.565606, 0, 0.6705883, 1, 1,
0.1447205, 0.7978334, -1.117193, 0, 0.6627451, 1, 1,
0.1498355, 0.5422264, 0.05689394, 0, 0.6588235, 1, 1,
0.1515242, -1.015446, 3.350141, 0, 0.6509804, 1, 1,
0.1530359, 0.4255971, 0.1647711, 0, 0.6470588, 1, 1,
0.1538205, 0.1846622, 1.756562, 0, 0.6392157, 1, 1,
0.1549773, -1.616318, 3.136736, 0, 0.6352941, 1, 1,
0.155973, -0.03371595, 1.397387, 0, 0.627451, 1, 1,
0.1602419, -0.3199611, 2.944156, 0, 0.6235294, 1, 1,
0.1612697, 1.374198, 0.7007465, 0, 0.6156863, 1, 1,
0.1694752, -1.203592, 5.039785, 0, 0.6117647, 1, 1,
0.1705797, 0.006641028, 2.026035, 0, 0.6039216, 1, 1,
0.1717289, 1.538026, -1.579535, 0, 0.5960785, 1, 1,
0.1778314, -0.7535746, 3.879258, 0, 0.5921569, 1, 1,
0.1891405, -0.1384835, 2.446356, 0, 0.5843138, 1, 1,
0.1923727, -0.0438235, 2.004227, 0, 0.5803922, 1, 1,
0.1951641, 2.150987, -0.734683, 0, 0.572549, 1, 1,
0.1959467, 0.5960338, 1.604309, 0, 0.5686275, 1, 1,
0.2010508, 0.325755, 2.555762, 0, 0.5607843, 1, 1,
0.2053583, -1.040543, 2.128871, 0, 0.5568628, 1, 1,
0.209017, 0.08349863, 0.7412255, 0, 0.5490196, 1, 1,
0.2130183, 0.398399, 1.806477, 0, 0.5450981, 1, 1,
0.2140406, -0.4585207, 2.974688, 0, 0.5372549, 1, 1,
0.2143823, -1.323411, 2.510249, 0, 0.5333334, 1, 1,
0.2174829, 0.9117827, 0.0819262, 0, 0.5254902, 1, 1,
0.2215208, 1.478382, 0.1183991, 0, 0.5215687, 1, 1,
0.2309886, -0.8845331, 1.89462, 0, 0.5137255, 1, 1,
0.2344025, 1.114554, 0.1536884, 0, 0.509804, 1, 1,
0.2346747, -0.06090029, 1.370623, 0, 0.5019608, 1, 1,
0.2370872, 0.5997594, -1.006893, 0, 0.4941176, 1, 1,
0.2553897, 1.86306, 0.5848818, 0, 0.4901961, 1, 1,
0.255584, -0.5479076, 2.644243, 0, 0.4823529, 1, 1,
0.2631751, -1.131784, 3.817936, 0, 0.4784314, 1, 1,
0.2632785, 1.362459, -0.6635683, 0, 0.4705882, 1, 1,
0.2647184, -0.426802, 1.154969, 0, 0.4666667, 1, 1,
0.2660769, 1.826213, -0.362893, 0, 0.4588235, 1, 1,
0.2714527, -0.6306548, 2.210681, 0, 0.454902, 1, 1,
0.2735924, 0.008476264, 1.499794, 0, 0.4470588, 1, 1,
0.2771277, -1.77128, 4.277548, 0, 0.4431373, 1, 1,
0.2834884, -1.779074, 3.10114, 0, 0.4352941, 1, 1,
0.2871344, -0.7862863, 3.045812, 0, 0.4313726, 1, 1,
0.2906381, -0.2510871, 2.637784, 0, 0.4235294, 1, 1,
0.291471, -1.06976, 4.345089, 0, 0.4196078, 1, 1,
0.2943539, -0.7845762, 3.355493, 0, 0.4117647, 1, 1,
0.2963955, -0.3463196, 3.101939, 0, 0.4078431, 1, 1,
0.2975979, 1.017539, 0.5637217, 0, 0.4, 1, 1,
0.2980648, -1.098821, 4.118309, 0, 0.3921569, 1, 1,
0.3000371, -0.436251, 1.364325, 0, 0.3882353, 1, 1,
0.3085513, 1.145467, 0.06108803, 0, 0.3803922, 1, 1,
0.3102058, -0.380324, 1.209755, 0, 0.3764706, 1, 1,
0.3154302, 1.626459, -0.6011276, 0, 0.3686275, 1, 1,
0.3166037, 0.1837822, 0.8108321, 0, 0.3647059, 1, 1,
0.3168734, -0.3248042, 2.543417, 0, 0.3568628, 1, 1,
0.3190165, -0.6728033, 3.458461, 0, 0.3529412, 1, 1,
0.3221444, 1.065744, -0.5043952, 0, 0.345098, 1, 1,
0.3226572, -0.8064461, 3.789549, 0, 0.3411765, 1, 1,
0.3261916, -0.4308881, 2.231943, 0, 0.3333333, 1, 1,
0.3306474, 0.4748926, 0.1222248, 0, 0.3294118, 1, 1,
0.3319983, -0.6755418, 2.546138, 0, 0.3215686, 1, 1,
0.333685, -0.8285981, 3.74668, 0, 0.3176471, 1, 1,
0.3421549, -2.411561, 2.307237, 0, 0.3098039, 1, 1,
0.3433185, 0.4083062, -0.2792486, 0, 0.3058824, 1, 1,
0.3450469, 0.3390298, 0.5847231, 0, 0.2980392, 1, 1,
0.3523182, -0.4618729, 1.522231, 0, 0.2901961, 1, 1,
0.352422, 0.1152345, 1.215304, 0, 0.2862745, 1, 1,
0.3543606, -0.4993549, 3.602547, 0, 0.2784314, 1, 1,
0.3550443, -0.6851534, 3.398186, 0, 0.2745098, 1, 1,
0.3556151, -0.5844352, 3.398912, 0, 0.2666667, 1, 1,
0.3563199, -0.5086108, 3.003568, 0, 0.2627451, 1, 1,
0.3564671, 0.2754204, 1.774153, 0, 0.254902, 1, 1,
0.3595243, -0.33922, 1.672996, 0, 0.2509804, 1, 1,
0.3655962, -2.523387, 0.29883, 0, 0.2431373, 1, 1,
0.3662521, 0.4040744, 2.870818, 0, 0.2392157, 1, 1,
0.3741448, -0.3151833, 2.291653, 0, 0.2313726, 1, 1,
0.3746811, 1.169132, 1.438933, 0, 0.227451, 1, 1,
0.3755398, 0.1622088, -0.894409, 0, 0.2196078, 1, 1,
0.3796997, 1.439671, 0.9739278, 0, 0.2156863, 1, 1,
0.3806222, 0.5793608, 1.630078, 0, 0.2078431, 1, 1,
0.3810644, -1.113545, 2.285963, 0, 0.2039216, 1, 1,
0.388716, -2.459219, 3.904733, 0, 0.1960784, 1, 1,
0.3896325, -0.8964111, 2.114079, 0, 0.1882353, 1, 1,
0.3902532, -1.476445, 3.155668, 0, 0.1843137, 1, 1,
0.3928376, 0.9686105, 1.305197, 0, 0.1764706, 1, 1,
0.3956503, -0.6389711, 0.6378855, 0, 0.172549, 1, 1,
0.3966973, 2.16248, 0.108416, 0, 0.1647059, 1, 1,
0.4015484, -0.999207, 3.371551, 0, 0.1607843, 1, 1,
0.4045443, -0.4418702, 1.235832, 0, 0.1529412, 1, 1,
0.4062617, 0.2415027, -0.1556857, 0, 0.1490196, 1, 1,
0.4084151, 0.4147375, 0.230789, 0, 0.1411765, 1, 1,
0.4084635, -1.097262, 2.799108, 0, 0.1372549, 1, 1,
0.4090295, 1.112403, 0.07283665, 0, 0.1294118, 1, 1,
0.410656, 0.4170703, -0.1152041, 0, 0.1254902, 1, 1,
0.4132097, 0.9443718, 0.4542603, 0, 0.1176471, 1, 1,
0.4161754, -0.6027295, 0.5879762, 0, 0.1137255, 1, 1,
0.4164156, 1.260516, 0.9192694, 0, 0.1058824, 1, 1,
0.4169017, -1.10588, 4.224619, 0, 0.09803922, 1, 1,
0.4186619, 0.8501834, -1.119896, 0, 0.09411765, 1, 1,
0.424021, -0.4829698, 2.80287, 0, 0.08627451, 1, 1,
0.4255461, -0.9155658, 2.484201, 0, 0.08235294, 1, 1,
0.428853, 1.621526, 2.208244, 0, 0.07450981, 1, 1,
0.4319439, -0.6765506, 2.47031, 0, 0.07058824, 1, 1,
0.4320235, 0.4242649, 1.011004, 0, 0.0627451, 1, 1,
0.4336737, 1.391953, -2.320574, 0, 0.05882353, 1, 1,
0.4407439, -1.3218, 1.470926, 0, 0.05098039, 1, 1,
0.441422, 1.329816, -0.8507515, 0, 0.04705882, 1, 1,
0.4497719, -0.6034345, 2.843323, 0, 0.03921569, 1, 1,
0.4555967, 0.2746704, 1.350155, 0, 0.03529412, 1, 1,
0.4601744, 0.4297184, 1.159311, 0, 0.02745098, 1, 1,
0.4632015, 1.18514, -0.3606547, 0, 0.02352941, 1, 1,
0.4635697, 0.2469434, 0.7782906, 0, 0.01568628, 1, 1,
0.4642937, -0.07866401, 1.08097, 0, 0.01176471, 1, 1,
0.4643945, 0.9874688, 0.3261864, 0, 0.003921569, 1, 1,
0.4709694, -1.892754, 1.846929, 0.003921569, 0, 1, 1,
0.4739595, 0.5099148, 0.3543479, 0.007843138, 0, 1, 1,
0.4747063, -0.2063444, 3.140958, 0.01568628, 0, 1, 1,
0.4779092, -0.4096246, 1.446849, 0.01960784, 0, 1, 1,
0.4826016, -1.073757, 2.226835, 0.02745098, 0, 1, 1,
0.4837404, -1.623193, 1.579048, 0.03137255, 0, 1, 1,
0.4851453, -0.6570953, 1.008151, 0.03921569, 0, 1, 1,
0.4896238, -0.731632, 2.734309, 0.04313726, 0, 1, 1,
0.490369, 0.6734803, 2.11177, 0.05098039, 0, 1, 1,
0.4908264, 0.1746216, 2.056335, 0.05490196, 0, 1, 1,
0.4989915, 0.6243458, 1.846175, 0.0627451, 0, 1, 1,
0.4998968, 0.4630194, -0.7408212, 0.06666667, 0, 1, 1,
0.5000387, 1.024391, -0.1109632, 0.07450981, 0, 1, 1,
0.5023974, -0.4261418, 3.955648, 0.07843138, 0, 1, 1,
0.5037945, 0.1211611, 1.110174, 0.08627451, 0, 1, 1,
0.5038983, -0.5980132, 0.630574, 0.09019608, 0, 1, 1,
0.5041764, 1.462207, -0.2745884, 0.09803922, 0, 1, 1,
0.505046, 0.2148552, 0.3786784, 0.1058824, 0, 1, 1,
0.50918, -0.2590321, 2.61732, 0.1098039, 0, 1, 1,
0.5114851, 1.297229, -0.8110706, 0.1176471, 0, 1, 1,
0.5116953, -0.8618833, 1.751041, 0.1215686, 0, 1, 1,
0.5132761, -0.6220255, 3.717937, 0.1294118, 0, 1, 1,
0.5180184, 0.5938951, -0.47348, 0.1333333, 0, 1, 1,
0.5206994, -1.213993, 2.573886, 0.1411765, 0, 1, 1,
0.5233777, -0.6388119, 1.496571, 0.145098, 0, 1, 1,
0.5277124, 1.245667, 1.257684, 0.1529412, 0, 1, 1,
0.528925, 0.7162276, 1.167962, 0.1568628, 0, 1, 1,
0.5302791, -2.335506, 3.122309, 0.1647059, 0, 1, 1,
0.5349087, 0.5565062, -0.5060754, 0.1686275, 0, 1, 1,
0.5352069, -0.5505848, 1.856907, 0.1764706, 0, 1, 1,
0.5364874, 0.004587896, 2.876435, 0.1803922, 0, 1, 1,
0.5392407, 1.163523, 0.4002518, 0.1882353, 0, 1, 1,
0.5411009, -1.344889, 2.992887, 0.1921569, 0, 1, 1,
0.5425906, -0.8809255, 0.9553261, 0.2, 0, 1, 1,
0.5440424, 0.5569847, -1.663995, 0.2078431, 0, 1, 1,
0.5493445, -0.2062752, 3.92582, 0.2117647, 0, 1, 1,
0.5510259, 0.03416892, 1.592131, 0.2196078, 0, 1, 1,
0.5540662, 0.9598715, 0.3535155, 0.2235294, 0, 1, 1,
0.561767, -0.1318866, 2.539286, 0.2313726, 0, 1, 1,
0.5625798, -1.839517, 3.855082, 0.2352941, 0, 1, 1,
0.5629029, -0.2055466, 1.664531, 0.2431373, 0, 1, 1,
0.5683456, 0.1371993, 1.070994, 0.2470588, 0, 1, 1,
0.568449, 0.8336037, 1.767122, 0.254902, 0, 1, 1,
0.5716864, 0.006348344, 1.278075, 0.2588235, 0, 1, 1,
0.5755334, 0.2538215, 2.445807, 0.2666667, 0, 1, 1,
0.5777535, 0.2901406, 0.1641026, 0.2705882, 0, 1, 1,
0.580418, 0.4960361, 1.110672, 0.2784314, 0, 1, 1,
0.5807183, 0.6129155, 0.9180389, 0.282353, 0, 1, 1,
0.583029, 0.3602752, 1.297803, 0.2901961, 0, 1, 1,
0.5842929, 1.871537, -0.5680878, 0.2941177, 0, 1, 1,
0.5855598, 0.5019764, -1.001585, 0.3019608, 0, 1, 1,
0.5861157, 0.7021794, 1.168887, 0.3098039, 0, 1, 1,
0.5923927, 0.1564436, 2.470912, 0.3137255, 0, 1, 1,
0.5963461, 1.192599, 1.690346, 0.3215686, 0, 1, 1,
0.6022045, 2.085719, 0.2647604, 0.3254902, 0, 1, 1,
0.6127092, 1.356021, 1.164829, 0.3333333, 0, 1, 1,
0.6166601, -0.4851519, 1.416104, 0.3372549, 0, 1, 1,
0.6234583, -0.8760641, 2.634091, 0.345098, 0, 1, 1,
0.6245754, -0.108203, 3.128647, 0.3490196, 0, 1, 1,
0.6313788, -0.7060993, 2.204751, 0.3568628, 0, 1, 1,
0.6314302, 0.8630185, 0.1282315, 0.3607843, 0, 1, 1,
0.6325368, 0.3715042, 1.728826, 0.3686275, 0, 1, 1,
0.6335388, -1.245751, 2.88237, 0.372549, 0, 1, 1,
0.6340987, -2.133068, 2.26369, 0.3803922, 0, 1, 1,
0.6371931, 0.6359944, 0.3089103, 0.3843137, 0, 1, 1,
0.6387438, 1.561315, -0.3721911, 0.3921569, 0, 1, 1,
0.6396813, -0.2322088, 1.561819, 0.3960784, 0, 1, 1,
0.6417854, -0.4637491, 3.783856, 0.4039216, 0, 1, 1,
0.641875, 0.6008232, 0.9235017, 0.4117647, 0, 1, 1,
0.6475592, 0.3887682, 1.919912, 0.4156863, 0, 1, 1,
0.6540725, -0.4710248, 1.873344, 0.4235294, 0, 1, 1,
0.6546302, -0.8233033, 4.193174, 0.427451, 0, 1, 1,
0.6575697, 0.3034164, 0.2395572, 0.4352941, 0, 1, 1,
0.6582496, -0.01241841, 1.868843, 0.4392157, 0, 1, 1,
0.6599431, 1.540478, -0.2335633, 0.4470588, 0, 1, 1,
0.6638363, -1.42856, 2.380242, 0.4509804, 0, 1, 1,
0.663872, -0.7944034, 2.032099, 0.4588235, 0, 1, 1,
0.6643795, -1.230863, 1.563838, 0.4627451, 0, 1, 1,
0.6712747, 0.8230122, 1.131314, 0.4705882, 0, 1, 1,
0.6724964, -2.087371, 3.889278, 0.4745098, 0, 1, 1,
0.6731623, -2.041595, 3.125005, 0.4823529, 0, 1, 1,
0.6766204, -1.153977, 4.445676, 0.4862745, 0, 1, 1,
0.6787314, 1.147864, 0.996043, 0.4941176, 0, 1, 1,
0.6819035, 1.36201, -0.493723, 0.5019608, 0, 1, 1,
0.6833254, -0.5317857, 2.924728, 0.5058824, 0, 1, 1,
0.685091, 1.657048, 0.8752125, 0.5137255, 0, 1, 1,
0.6872039, 1.359946, 0.397013, 0.5176471, 0, 1, 1,
0.6936072, -0.2703025, 1.621906, 0.5254902, 0, 1, 1,
0.6959729, 0.140702, -0.623123, 0.5294118, 0, 1, 1,
0.6998527, 0.3148002, 1.365829, 0.5372549, 0, 1, 1,
0.7017633, -0.1916684, 1.231051, 0.5411765, 0, 1, 1,
0.7091761, 0.4777637, 0.2288306, 0.5490196, 0, 1, 1,
0.7121696, -0.06647873, -0.7969657, 0.5529412, 0, 1, 1,
0.7190135, 1.023441, 0.2090878, 0.5607843, 0, 1, 1,
0.7203847, 0.07928212, 3.436454, 0.5647059, 0, 1, 1,
0.721729, -0.6663823, 3.422877, 0.572549, 0, 1, 1,
0.7312953, 1.389706, 0.7876291, 0.5764706, 0, 1, 1,
0.7327593, -0.231325, 2.265669, 0.5843138, 0, 1, 1,
0.7366856, 0.4614185, -0.4520117, 0.5882353, 0, 1, 1,
0.7368174, -1.694089, 3.14883, 0.5960785, 0, 1, 1,
0.7385994, 0.3672721, -1.717293, 0.6039216, 0, 1, 1,
0.7423211, 0.276597, 2.883066, 0.6078432, 0, 1, 1,
0.7424643, -0.5384053, 1.796892, 0.6156863, 0, 1, 1,
0.7482163, 3.118082, 0.2654364, 0.6196079, 0, 1, 1,
0.7482997, -0.5615968, 2.488073, 0.627451, 0, 1, 1,
0.756123, 0.2050157, 1.91864, 0.6313726, 0, 1, 1,
0.7644899, 0.4194349, 0.2808398, 0.6392157, 0, 1, 1,
0.7715034, 0.1869671, 1.548546, 0.6431373, 0, 1, 1,
0.7737688, -0.2725896, 1.508088, 0.6509804, 0, 1, 1,
0.7763215, -0.5195599, 2.219306, 0.654902, 0, 1, 1,
0.7785861, 1.464647, -1.325538, 0.6627451, 0, 1, 1,
0.7802441, -0.8733954, 1.473027, 0.6666667, 0, 1, 1,
0.7889275, -1.816092, 3.600254, 0.6745098, 0, 1, 1,
0.7997926, 0.02964105, 2.856101, 0.6784314, 0, 1, 1,
0.8011996, -1.852021, 2.88971, 0.6862745, 0, 1, 1,
0.8017046, 2.144773, -0.3274492, 0.6901961, 0, 1, 1,
0.8034648, -1.039251, 3.051953, 0.6980392, 0, 1, 1,
0.8057243, 1.358477, -0.03508997, 0.7058824, 0, 1, 1,
0.8088347, 0.4130795, 2.590966, 0.7098039, 0, 1, 1,
0.8098826, 0.6709595, 2.287525, 0.7176471, 0, 1, 1,
0.8108714, -0.4358938, 2.349827, 0.7215686, 0, 1, 1,
0.8123193, 0.9477897, 1.306189, 0.7294118, 0, 1, 1,
0.8138804, 0.4938257, 1.666335, 0.7333333, 0, 1, 1,
0.8153183, -0.9295053, 2.728587, 0.7411765, 0, 1, 1,
0.815615, 0.5935329, -0.6492487, 0.7450981, 0, 1, 1,
0.8160192, 0.1526186, 2.995712, 0.7529412, 0, 1, 1,
0.8200657, -2.174191, 3.133297, 0.7568628, 0, 1, 1,
0.8241214, 1.603152, -0.2450594, 0.7647059, 0, 1, 1,
0.8309099, 1.431218, 1.916015, 0.7686275, 0, 1, 1,
0.8323637, 0.2023282, 1.985166, 0.7764706, 0, 1, 1,
0.8366369, 1.12587, 0.621236, 0.7803922, 0, 1, 1,
0.8397489, -1.357015, 1.198913, 0.7882353, 0, 1, 1,
0.848557, 2.113307, -1.152652, 0.7921569, 0, 1, 1,
0.8517296, -1.118891, 3.330431, 0.8, 0, 1, 1,
0.8542245, 1.115524, -1.218622, 0.8078431, 0, 1, 1,
0.8586372, -0.2021589, 1.407237, 0.8117647, 0, 1, 1,
0.8622764, -0.684132, 2.972772, 0.8196079, 0, 1, 1,
0.8649384, 0.5301694, 0.7794499, 0.8235294, 0, 1, 1,
0.8723952, 0.2112886, 1.905071, 0.8313726, 0, 1, 1,
0.8733914, -1.095385, 0.9436121, 0.8352941, 0, 1, 1,
0.8899555, 0.6028248, 2.124717, 0.8431373, 0, 1, 1,
0.8912442, -1.311968, 3.660203, 0.8470588, 0, 1, 1,
0.8927481, 1.277292, 0.0613392, 0.854902, 0, 1, 1,
0.894062, 0.4760188, 0.7623263, 0.8588235, 0, 1, 1,
0.8962789, 0.4317945, 0.5647154, 0.8666667, 0, 1, 1,
0.9036641, 1.054311, 0.3959837, 0.8705882, 0, 1, 1,
0.9062892, 0.01208485, -0.09490761, 0.8784314, 0, 1, 1,
0.9066697, -0.3548793, 2.367736, 0.8823529, 0, 1, 1,
0.9081254, 0.8759035, 0.4308874, 0.8901961, 0, 1, 1,
0.911249, 0.0211674, -0.6145208, 0.8941177, 0, 1, 1,
0.9112673, -0.4052983, 2.036854, 0.9019608, 0, 1, 1,
0.9122096, -1.376259, 2.646151, 0.9098039, 0, 1, 1,
0.9161893, 0.03099189, -0.8199151, 0.9137255, 0, 1, 1,
0.9186644, -0.8000429, 2.795715, 0.9215686, 0, 1, 1,
0.9309314, -1.322275, 2.758954, 0.9254902, 0, 1, 1,
0.9319829, 1.218426, -1.407523, 0.9333333, 0, 1, 1,
0.9406527, -0.6807854, 2.62673, 0.9372549, 0, 1, 1,
0.9447688, 1.26392, -0.1216175, 0.945098, 0, 1, 1,
0.9460497, -0.9084666, 1.608402, 0.9490196, 0, 1, 1,
0.9543803, -0.5597817, 2.48113, 0.9568627, 0, 1, 1,
0.9676392, -0.3425912, 0.6672499, 0.9607843, 0, 1, 1,
0.9683754, 0.7196611, 0.5289924, 0.9686275, 0, 1, 1,
0.9689406, 1.427248, -1.698652, 0.972549, 0, 1, 1,
0.972617, 0.247389, 1.182351, 0.9803922, 0, 1, 1,
0.9748573, 1.70799, -0.8227586, 0.9843137, 0, 1, 1,
0.9800267, 1.107141, 2.250914, 0.9921569, 0, 1, 1,
0.9815502, -0.4716292, 3.71662, 0.9960784, 0, 1, 1,
0.9944509, -0.01223318, 0.9414343, 1, 0, 0.9960784, 1,
0.9946856, -0.1684127, 2.392992, 1, 0, 0.9882353, 1,
1.004187, -0.1021606, 1.490288, 1, 0, 0.9843137, 1,
1.005555, -1.322433, 3.055562, 1, 0, 0.9764706, 1,
1.007062, -0.9424579, 1.676735, 1, 0, 0.972549, 1,
1.007753, -1.356053, 2.577229, 1, 0, 0.9647059, 1,
1.010842, -1.160794, 3.177764, 1, 0, 0.9607843, 1,
1.019268, -1.52062, 0.7235274, 1, 0, 0.9529412, 1,
1.022722, 1.77655, -0.3287263, 1, 0, 0.9490196, 1,
1.0334, 0.1484289, 0.1779724, 1, 0, 0.9411765, 1,
1.037066, 0.116054, 0.5491835, 1, 0, 0.9372549, 1,
1.043273, -0.3755793, 1.758403, 1, 0, 0.9294118, 1,
1.053075, -1.174413, 2.175285, 1, 0, 0.9254902, 1,
1.055067, 0.4871889, 0.06243394, 1, 0, 0.9176471, 1,
1.055076, -0.4970542, 3.201101, 1, 0, 0.9137255, 1,
1.064524, -0.1217601, 0.2700893, 1, 0, 0.9058824, 1,
1.070903, 0.7257987, 1.774944, 1, 0, 0.9019608, 1,
1.077829, -0.3009244, 3.067893, 1, 0, 0.8941177, 1,
1.079689, -1.325975, 2.942387, 1, 0, 0.8862745, 1,
1.081708, 0.901792, 0.74733, 1, 0, 0.8823529, 1,
1.083227, 0.7078367, 1.132621, 1, 0, 0.8745098, 1,
1.09371, 0.2485494, 0.8293516, 1, 0, 0.8705882, 1,
1.095436, -1.462626, 2.093333, 1, 0, 0.8627451, 1,
1.111638, -0.8491278, 0.6453315, 1, 0, 0.8588235, 1,
1.115689, -1.3434, 2.529017, 1, 0, 0.8509804, 1,
1.121413, 0.4337427, -0.8605615, 1, 0, 0.8470588, 1,
1.137793, -0.5248223, 2.669378, 1, 0, 0.8392157, 1,
1.146784, 0.9775882, 2.451642, 1, 0, 0.8352941, 1,
1.15265, -0.9804797, 1.875105, 1, 0, 0.827451, 1,
1.164291, -0.3058468, 1.163578, 1, 0, 0.8235294, 1,
1.168748, -1.337085, 1.743701, 1, 0, 0.8156863, 1,
1.171692, -0.01525614, 2.143691, 1, 0, 0.8117647, 1,
1.1754, 0.08304646, 0.1787771, 1, 0, 0.8039216, 1,
1.175857, -0.5692788, 2.591435, 1, 0, 0.7960784, 1,
1.179879, -0.1397183, 2.871267, 1, 0, 0.7921569, 1,
1.188745, 1.094394, 1.064277, 1, 0, 0.7843137, 1,
1.193816, -1.781785, 0.8078762, 1, 0, 0.7803922, 1,
1.204005, -0.7003236, -0.4031348, 1, 0, 0.772549, 1,
1.207789, 0.6176282, 7.988641e-05, 1, 0, 0.7686275, 1,
1.208245, 1.314074, 0.5804257, 1, 0, 0.7607843, 1,
1.208557, 1.384195, 0.2308948, 1, 0, 0.7568628, 1,
1.209738, 1.122707, 1.948038, 1, 0, 0.7490196, 1,
1.212761, 0.09211097, 1.078353, 1, 0, 0.7450981, 1,
1.215801, 0.8268514, 0.7583196, 1, 0, 0.7372549, 1,
1.235068, 0.644258, 0.7060381, 1, 0, 0.7333333, 1,
1.23613, 1.523551, 0.2998958, 1, 0, 0.7254902, 1,
1.24176, 1.963773, 0.001809093, 1, 0, 0.7215686, 1,
1.261505, 0.2777599, 1.111092, 1, 0, 0.7137255, 1,
1.26606, -1.191486, 1.432083, 1, 0, 0.7098039, 1,
1.270538, 1.272779, 1.945288, 1, 0, 0.7019608, 1,
1.273126, -1.041375, 2.038355, 1, 0, 0.6941177, 1,
1.283382, -0.3174506, 1.591318, 1, 0, 0.6901961, 1,
1.290616, -0.8878029, 1.793876, 1, 0, 0.682353, 1,
1.294421, -0.4697362, 2.177046, 1, 0, 0.6784314, 1,
1.29693, 1.90156, 2.255553, 1, 0, 0.6705883, 1,
1.313097, -1.158525, 1.700599, 1, 0, 0.6666667, 1,
1.314387, 1.18868, 1.080709, 1, 0, 0.6588235, 1,
1.320742, -1.055066, 0.9053604, 1, 0, 0.654902, 1,
1.333773, 0.1501213, 0.8710582, 1, 0, 0.6470588, 1,
1.344877, 1.345788, 0.9855528, 1, 0, 0.6431373, 1,
1.354101, -0.1523043, 0.9906889, 1, 0, 0.6352941, 1,
1.355896, -0.5017029, 3.225674, 1, 0, 0.6313726, 1,
1.362346, 1.14961, -0.5008606, 1, 0, 0.6235294, 1,
1.362511, 1.224415, 2.774653, 1, 0, 0.6196079, 1,
1.36474, 0.6611145, 1.049166, 1, 0, 0.6117647, 1,
1.371239, -0.7473441, 3.191424, 1, 0, 0.6078432, 1,
1.371667, -0.1587953, 1.22521, 1, 0, 0.6, 1,
1.376035, 0.9716719, 1.412601, 1, 0, 0.5921569, 1,
1.383189, -0.07311264, 2.068758, 1, 0, 0.5882353, 1,
1.396017, -1.102488, 1.834652, 1, 0, 0.5803922, 1,
1.397591, -0.004170215, 1.42862, 1, 0, 0.5764706, 1,
1.400999, 0.3709739, 0.7429107, 1, 0, 0.5686275, 1,
1.404266, -0.7268425, 1.448099, 1, 0, 0.5647059, 1,
1.415365, -0.2063141, 2.62401, 1, 0, 0.5568628, 1,
1.425515, -1.331669, 3.674902, 1, 0, 0.5529412, 1,
1.432783, -1.563254, 1.887615, 1, 0, 0.5450981, 1,
1.437901, -0.7562628, 1.703099, 1, 0, 0.5411765, 1,
1.439648, 0.2590572, 1.442518, 1, 0, 0.5333334, 1,
1.443639, 0.5137166, 1.745831, 1, 0, 0.5294118, 1,
1.446398, 0.9417585, 2.539112, 1, 0, 0.5215687, 1,
1.453062, 0.5504281, 0.764783, 1, 0, 0.5176471, 1,
1.457673, -0.008464196, 0.9698831, 1, 0, 0.509804, 1,
1.481203, 0.2701446, 1.881486, 1, 0, 0.5058824, 1,
1.483809, 1.324364, 1.4594, 1, 0, 0.4980392, 1,
1.493413, -0.924575, 2.021467, 1, 0, 0.4901961, 1,
1.49511, -0.6479026, 2.670634, 1, 0, 0.4862745, 1,
1.500436, 0.8434824, 0.4217362, 1, 0, 0.4784314, 1,
1.501906, -0.6374182, 3.73958, 1, 0, 0.4745098, 1,
1.504594, 0.9476755, 1.473251, 1, 0, 0.4666667, 1,
1.5213, 0.06533157, -0.01396531, 1, 0, 0.4627451, 1,
1.525164, 0.5054356, 1.752024, 1, 0, 0.454902, 1,
1.52882, 1.373966, 2.076845, 1, 0, 0.4509804, 1,
1.539938, -0.4815243, 0.1494868, 1, 0, 0.4431373, 1,
1.543733, 1.31787, 1.284729, 1, 0, 0.4392157, 1,
1.56237, 0.07655451, 1.541992, 1, 0, 0.4313726, 1,
1.565557, -0.5528442, -0.325604, 1, 0, 0.427451, 1,
1.573538, -2.135635, 2.687033, 1, 0, 0.4196078, 1,
1.573613, -0.4839442, 2.995877, 1, 0, 0.4156863, 1,
1.589654, 2.106628, 0.9466542, 1, 0, 0.4078431, 1,
1.602436, -0.5675904, 3.437366, 1, 0, 0.4039216, 1,
1.604671, 0.5542449, 1.752733, 1, 0, 0.3960784, 1,
1.605283, 0.7521918, 0.533274, 1, 0, 0.3882353, 1,
1.613649, -0.688047, 2.156487, 1, 0, 0.3843137, 1,
1.635185, 0.7614459, -1.023053, 1, 0, 0.3764706, 1,
1.64702, 0.7874448, 0.995735, 1, 0, 0.372549, 1,
1.64801, 0.6447883, 0.81024, 1, 0, 0.3647059, 1,
1.661613, 0.4650731, 0.4411553, 1, 0, 0.3607843, 1,
1.669775, -0.03365204, 1.564923, 1, 0, 0.3529412, 1,
1.670171, -0.1657114, 3.86202, 1, 0, 0.3490196, 1,
1.670574, -0.4888462, 0.88854, 1, 0, 0.3411765, 1,
1.67366, 0.8394541, 0.8077291, 1, 0, 0.3372549, 1,
1.676033, -0.4430212, 0.4465763, 1, 0, 0.3294118, 1,
1.691865, 0.9618692, 1.076118, 1, 0, 0.3254902, 1,
1.707741, -0.1223934, 2.280584, 1, 0, 0.3176471, 1,
1.719202, -0.4161521, 1.893439, 1, 0, 0.3137255, 1,
1.719814, -2.333463, 4.31442, 1, 0, 0.3058824, 1,
1.72306, 1.006, -0.0204049, 1, 0, 0.2980392, 1,
1.72557, -0.8788422, 1.420936, 1, 0, 0.2941177, 1,
1.728926, -1.221397, -1.343417, 1, 0, 0.2862745, 1,
1.746458, 1.033995, 1.317311, 1, 0, 0.282353, 1,
1.766726, 0.6652461, 1.439211, 1, 0, 0.2745098, 1,
1.768016, 0.5098884, 3.390381, 1, 0, 0.2705882, 1,
1.768042, 1.243722, -0.1931943, 1, 0, 0.2627451, 1,
1.779482, 0.940672, 1.135532, 1, 0, 0.2588235, 1,
1.790536, 0.9246219, 1.337596, 1, 0, 0.2509804, 1,
1.801067, 1.033318, 2.079149, 1, 0, 0.2470588, 1,
1.803642, -1.497367, 1.457166, 1, 0, 0.2392157, 1,
1.811177, 2.082753, 1.165709, 1, 0, 0.2352941, 1,
1.81389, 0.4191301, 1.303914, 1, 0, 0.227451, 1,
1.826129, -0.3560094, 2.120705, 1, 0, 0.2235294, 1,
1.83154, -0.765972, 1.525145, 1, 0, 0.2156863, 1,
1.838213, 0.2952337, 3.079445, 1, 0, 0.2117647, 1,
1.847363, 2.006419, 1.76362, 1, 0, 0.2039216, 1,
1.89144, 1.10622, 2.305058, 1, 0, 0.1960784, 1,
1.898149, 0.1780768, 1.047113, 1, 0, 0.1921569, 1,
1.900532, -0.9491426, 3.048374, 1, 0, 0.1843137, 1,
1.928273, -1.552056, 3.261274, 1, 0, 0.1803922, 1,
1.938724, 0.4792945, 2.599355, 1, 0, 0.172549, 1,
1.94345, -0.02229668, 1.42122, 1, 0, 0.1686275, 1,
1.96352, -0.04750215, 1.184045, 1, 0, 0.1607843, 1,
1.97444, -1.847374, 2.263966, 1, 0, 0.1568628, 1,
1.999494, -0.0237646, 1.392879, 1, 0, 0.1490196, 1,
2.017535, 0.5827078, 0.1728913, 1, 0, 0.145098, 1,
2.046424, 1.799345, -0.1835529, 1, 0, 0.1372549, 1,
2.053611, -0.7519286, 1.372092, 1, 0, 0.1333333, 1,
2.060635, -0.7608823, 3.964319, 1, 0, 0.1254902, 1,
2.068907, 0.5002833, 1.273137, 1, 0, 0.1215686, 1,
2.072327, 0.1979118, 2.104412, 1, 0, 0.1137255, 1,
2.080853, 0.8767167, 0.6579806, 1, 0, 0.1098039, 1,
2.085881, -0.6950689, 1.475721, 1, 0, 0.1019608, 1,
2.107152, -0.1736063, 0.6812808, 1, 0, 0.09411765, 1,
2.257663, -0.1941336, 1.799134, 1, 0, 0.09019608, 1,
2.261889, 0.8377764, 1.796931, 1, 0, 0.08235294, 1,
2.306715, 0.5339909, 1.02026, 1, 0, 0.07843138, 1,
2.319997, -0.6078403, 1.81762, 1, 0, 0.07058824, 1,
2.346127, 0.2432123, 0.01557781, 1, 0, 0.06666667, 1,
2.394663, -0.4416202, 2.227709, 1, 0, 0.05882353, 1,
2.427043, -0.7777108, 2.462946, 1, 0, 0.05490196, 1,
2.450081, -1.439656, 2.761108, 1, 0, 0.04705882, 1,
2.451257, 0.6524489, 1.99787, 1, 0, 0.04313726, 1,
2.491064, -0.6558707, 3.121589, 1, 0, 0.03529412, 1,
2.705188, 1.196173, 0.004860013, 1, 0, 0.03137255, 1,
2.834307, 1.207799, 2.034267, 1, 0, 0.02352941, 1,
2.866005, 0.09021914, 1.642716, 1, 0, 0.01960784, 1,
2.997204, 1.051633, 1.319308, 1, 0, 0.01176471, 1,
3.108788, 0.4696437, 2.79203, 1, 0, 0.007843138, 1
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
-0.09804344, -3.682065, -8.004543, 0, -0.5, 0.5, 0.5,
-0.09804344, -3.682065, -8.004543, 1, -0.5, 0.5, 0.5,
-0.09804344, -3.682065, -8.004543, 1, 1.5, 0.5, 0.5,
-0.09804344, -3.682065, -8.004543, 0, 1.5, 0.5, 0.5
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
-4.39199, 0.2346903, -8.004543, 0, -0.5, 0.5, 0.5,
-4.39199, 0.2346903, -8.004543, 1, -0.5, 0.5, 0.5,
-4.39199, 0.2346903, -8.004543, 1, 1.5, 0.5, 0.5,
-4.39199, 0.2346903, -8.004543, 0, 1.5, 0.5, 0.5
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
-4.39199, -3.682065, -0.5370975, 0, -0.5, 0.5, 0.5,
-4.39199, -3.682065, -0.5370975, 1, -0.5, 0.5, 0.5,
-4.39199, -3.682065, -0.5370975, 1, 1.5, 0.5, 0.5,
-4.39199, -3.682065, -0.5370975, 0, 1.5, 0.5, 0.5
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
-3, -2.778199, -6.281286,
3, -2.778199, -6.281286,
-3, -2.778199, -6.281286,
-3, -2.928843, -6.568496,
-2, -2.778199, -6.281286,
-2, -2.928843, -6.568496,
-1, -2.778199, -6.281286,
-1, -2.928843, -6.568496,
0, -2.778199, -6.281286,
0, -2.928843, -6.568496,
1, -2.778199, -6.281286,
1, -2.928843, -6.568496,
2, -2.778199, -6.281286,
2, -2.928843, -6.568496,
3, -2.778199, -6.281286,
3, -2.928843, -6.568496
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
-3, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
-3, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
-3, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
-3, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
-2, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
-2, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
-2, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
-2, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
-1, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
-1, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
-1, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
-1, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
0, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
0, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
0, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
0, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
1, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
1, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
1, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
1, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
2, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
2, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
2, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
2, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5,
3, -3.230132, -7.142915, 0, -0.5, 0.5, 0.5,
3, -3.230132, -7.142915, 1, -0.5, 0.5, 0.5,
3, -3.230132, -7.142915, 1, 1.5, 0.5, 0.5,
3, -3.230132, -7.142915, 0, 1.5, 0.5, 0.5
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
-3.401079, -2, -6.281286,
-3.401079, 3, -6.281286,
-3.401079, -2, -6.281286,
-3.566231, -2, -6.568496,
-3.401079, -1, -6.281286,
-3.566231, -1, -6.568496,
-3.401079, 0, -6.281286,
-3.566231, 0, -6.568496,
-3.401079, 1, -6.281286,
-3.566231, 1, -6.568496,
-3.401079, 2, -6.281286,
-3.566231, 2, -6.568496,
-3.401079, 3, -6.281286,
-3.566231, 3, -6.568496
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
-3.896535, -2, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, -2, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, -2, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, -2, -7.142915, 0, 1.5, 0.5, 0.5,
-3.896535, -1, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, -1, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, -1, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, -1, -7.142915, 0, 1.5, 0.5, 0.5,
-3.896535, 0, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, 0, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, 0, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, 0, -7.142915, 0, 1.5, 0.5, 0.5,
-3.896535, 1, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, 1, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, 1, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, 1, -7.142915, 0, 1.5, 0.5, 0.5,
-3.896535, 2, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, 2, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, 2, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, 2, -7.142915, 0, 1.5, 0.5, 0.5,
-3.896535, 3, -7.142915, 0, -0.5, 0.5, 0.5,
-3.896535, 3, -7.142915, 1, -0.5, 0.5, 0.5,
-3.896535, 3, -7.142915, 1, 1.5, 0.5, 0.5,
-3.896535, 3, -7.142915, 0, 1.5, 0.5, 0.5
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
-3.401079, -2.778199, -6,
-3.401079, -2.778199, 4,
-3.401079, -2.778199, -6,
-3.566231, -2.928843, -6,
-3.401079, -2.778199, -4,
-3.566231, -2.928843, -4,
-3.401079, -2.778199, -2,
-3.566231, -2.928843, -2,
-3.401079, -2.778199, 0,
-3.566231, -2.928843, 0,
-3.401079, -2.778199, 2,
-3.566231, -2.928843, 2,
-3.401079, -2.778199, 4,
-3.566231, -2.928843, 4
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
"-6",
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
-3.896535, -3.230132, -6, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -6, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -6, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, -6, 0, 1.5, 0.5, 0.5,
-3.896535, -3.230132, -4, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -4, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -4, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, -4, 0, 1.5, 0.5, 0.5,
-3.896535, -3.230132, -2, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -2, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, -2, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, -2, 0, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 0, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 0, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 0, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 0, 0, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 2, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 2, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 2, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 2, 0, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 4, 0, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 4, 1, -0.5, 0.5, 0.5,
-3.896535, -3.230132, 4, 1, 1.5, 0.5, 0.5,
-3.896535, -3.230132, 4, 0, 1.5, 0.5, 0.5
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
-3.401079, -2.778199, -6.281286,
-3.401079, 3.247579, -6.281286,
-3.401079, -2.778199, 5.207091,
-3.401079, 3.247579, 5.207091,
-3.401079, -2.778199, -6.281286,
-3.401079, -2.778199, 5.207091,
-3.401079, 3.247579, -6.281286,
-3.401079, 3.247579, 5.207091,
-3.401079, -2.778199, -6.281286,
3.204993, -2.778199, -6.281286,
-3.401079, -2.778199, 5.207091,
3.204993, -2.778199, 5.207091,
-3.401079, 3.247579, -6.281286,
3.204993, 3.247579, -6.281286,
-3.401079, 3.247579, 5.207091,
3.204993, 3.247579, 5.207091,
3.204993, -2.778199, -6.281286,
3.204993, 3.247579, -6.281286,
3.204993, -2.778199, 5.207091,
3.204993, 3.247579, 5.207091,
3.204993, -2.778199, -6.281286,
3.204993, -2.778199, 5.207091,
3.204993, 3.247579, -6.281286,
3.204993, 3.247579, 5.207091
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
var radius = 7.773646;
var distance = 34.58583;
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
mvMatrix.translate( 0.09804344, -0.2346903, 0.5370975 );
mvMatrix.scale( 1.272317, 1.394844, 0.7316106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58583);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
3-phenoxybenzenemeth<-read.table("3-phenoxybenzenemeth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-phenoxybenzenemeth$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzenemeth' not found
```

```r
y<-3-phenoxybenzenemeth$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzenemeth' not found
```

```r
z<-3-phenoxybenzenemeth$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzenemeth' not found
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
-3.304874, -0.9680095, -1.189522, 0, 0, 1, 1, 1,
-3.195144, -0.3119241, -1.451031, 1, 0, 0, 1, 1,
-3.101258, 1.127403, -1.521172, 1, 0, 0, 1, 1,
-2.648183, -1.848616, -2.835114, 1, 0, 0, 1, 1,
-2.465508, 1.279078, -2.321118, 1, 0, 0, 1, 1,
-2.309278, 0.4706315, -0.1703276, 1, 0, 0, 1, 1,
-2.306643, 0.5654318, -1.384273, 0, 0, 0, 1, 1,
-2.293003, -0.9585864, -1.571473, 0, 0, 0, 1, 1,
-2.223432, 0.4185842, -0.8908366, 0, 0, 0, 1, 1,
-2.212778, -1.261809, -2.835584, 0, 0, 0, 1, 1,
-2.179878, 0.6696722, -0.07221457, 0, 0, 0, 1, 1,
-2.171992, 1.274291, -1.088482, 0, 0, 0, 1, 1,
-2.164778, -0.0362777, -2.520616, 0, 0, 0, 1, 1,
-2.144263, 0.378619, -0.3815034, 1, 1, 1, 1, 1,
-2.126725, 1.609884, -2.0274, 1, 1, 1, 1, 1,
-2.122499, 0.9964159, -0.4702052, 1, 1, 1, 1, 1,
-2.108576, -0.312042, -2.530165, 1, 1, 1, 1, 1,
-2.103269, -1.090289, -2.657322, 1, 1, 1, 1, 1,
-2.100122, -0.06416635, -1.432468, 1, 1, 1, 1, 1,
-2.076039, 1.007441, 0.02180649, 1, 1, 1, 1, 1,
-2.073743, -0.5028043, -1.82162, 1, 1, 1, 1, 1,
-2.065176, -0.3220477, 1.720538, 1, 1, 1, 1, 1,
-2.042821, 1.607752, -1.365641, 1, 1, 1, 1, 1,
-2.041749, -1.595575, 0.1134432, 1, 1, 1, 1, 1,
-2.037816, -0.2764901, -0.6733077, 1, 1, 1, 1, 1,
-2.036164, 0.5451156, -0.9238552, 1, 1, 1, 1, 1,
-1.994956, 0.7756457, -1.814662, 1, 1, 1, 1, 1,
-1.994521, 0.0418806, -2.032895, 1, 1, 1, 1, 1,
-1.944683, 0.5690115, -0.5564544, 0, 0, 1, 1, 1,
-1.930551, -0.1102361, -1.019651, 1, 0, 0, 1, 1,
-1.928322, 0.1701981, -0.5731749, 1, 0, 0, 1, 1,
-1.923649, 0.1759038, -2.005015, 1, 0, 0, 1, 1,
-1.879815, -0.4888009, -2.460986, 1, 0, 0, 1, 1,
-1.875852, -0.1686053, -1.401378, 1, 0, 0, 1, 1,
-1.855049, -2.430494, -4.400962, 0, 0, 0, 1, 1,
-1.850065, -0.2099738, -3.057722, 0, 0, 0, 1, 1,
-1.845982, 2.237871, -0.485827, 0, 0, 0, 1, 1,
-1.828806, -0.4067037, -2.530982, 0, 0, 0, 1, 1,
-1.815814, 1.152271, -1.211746, 0, 0, 0, 1, 1,
-1.797289, 0.6836687, -2.479301, 0, 0, 0, 1, 1,
-1.791286, 0.9381524, 0.8603312, 0, 0, 0, 1, 1,
-1.785902, -0.02332692, -1.687601, 1, 1, 1, 1, 1,
-1.783543, 1.402316, -1.109954, 1, 1, 1, 1, 1,
-1.766301, 0.4883778, -1.171931, 1, 1, 1, 1, 1,
-1.765595, -0.201418, -2.842499, 1, 1, 1, 1, 1,
-1.761008, -0.5919686, -0.9633454, 1, 1, 1, 1, 1,
-1.758829, 0.06733738, -2.744133, 1, 1, 1, 1, 1,
-1.741168, 0.8695774, -2.607486, 1, 1, 1, 1, 1,
-1.731068, 0.730076, -0.3664902, 1, 1, 1, 1, 1,
-1.7258, 0.9709549, -0.0584654, 1, 1, 1, 1, 1,
-1.716133, 0.5609199, -0.7854448, 1, 1, 1, 1, 1,
-1.689484, -0.1924096, -1.683185, 1, 1, 1, 1, 1,
-1.679361, -0.863346, -2.729589, 1, 1, 1, 1, 1,
-1.666233, -1.649241, -2.922136, 1, 1, 1, 1, 1,
-1.664214, 1.858644, 0.5035638, 1, 1, 1, 1, 1,
-1.656798, 0.6787246, -2.022354, 1, 1, 1, 1, 1,
-1.649628, -1.390362, -2.847377, 0, 0, 1, 1, 1,
-1.636629, -2.511498, -2.680279, 1, 0, 0, 1, 1,
-1.635397, -0.4172083, -2.265242, 1, 0, 0, 1, 1,
-1.634187, -0.8365029, -1.869196, 1, 0, 0, 1, 1,
-1.632313, 0.2135654, -2.816331, 1, 0, 0, 1, 1,
-1.619036, 0.1674696, -1.576971, 1, 0, 0, 1, 1,
-1.617895, 0.4651383, -2.170025, 0, 0, 0, 1, 1,
-1.615253, 0.726315, -1.084383, 0, 0, 0, 1, 1,
-1.613566, -0.9832838, -4.000796, 0, 0, 0, 1, 1,
-1.598209, -0.1466089, -2.486635, 0, 0, 0, 1, 1,
-1.576243, 0.145762, -2.525437, 0, 0, 0, 1, 1,
-1.570153, -0.906456, -1.955656, 0, 0, 0, 1, 1,
-1.566218, -1.526741, -2.870284, 0, 0, 0, 1, 1,
-1.562433, 0.6465847, -0.8775925, 1, 1, 1, 1, 1,
-1.547817, 0.5174135, -2.030661, 1, 1, 1, 1, 1,
-1.525425, -0.3152136, -2.773579, 1, 1, 1, 1, 1,
-1.524727, 0.2532887, -0.3991468, 1, 1, 1, 1, 1,
-1.508729, 0.6549793, -1.336013, 1, 1, 1, 1, 1,
-1.508098, 0.5115543, -1.478289, 1, 1, 1, 1, 1,
-1.499949, 0.6460116, -3.248745, 1, 1, 1, 1, 1,
-1.486859, 0.5467896, -2.116498, 1, 1, 1, 1, 1,
-1.486205, -0.01892428, -3.356118, 1, 1, 1, 1, 1,
-1.471348, -0.5125242, -1.110414, 1, 1, 1, 1, 1,
-1.470287, 0.03300507, -2.290003, 1, 1, 1, 1, 1,
-1.465847, 1.306426, 1.190235, 1, 1, 1, 1, 1,
-1.455925, -1.145763, -3.186131, 1, 1, 1, 1, 1,
-1.442035, -0.7014111, -2.02454, 1, 1, 1, 1, 1,
-1.441074, 0.4737716, -4.112453, 1, 1, 1, 1, 1,
-1.438185, 0.009904982, -1.775162, 0, 0, 1, 1, 1,
-1.438083, 0.2776495, -0.6625953, 1, 0, 0, 1, 1,
-1.434874, 0.8675735, -0.6136112, 1, 0, 0, 1, 1,
-1.427306, -0.7111146, -1.942458, 1, 0, 0, 1, 1,
-1.426, -1.465449, -1.267847, 1, 0, 0, 1, 1,
-1.425294, 1.189549, -0.6067054, 1, 0, 0, 1, 1,
-1.421913, 1.360011, -0.6908121, 0, 0, 0, 1, 1,
-1.421302, -0.2053914, -1.588317, 0, 0, 0, 1, 1,
-1.417592, 1.418155, 0.3585686, 0, 0, 0, 1, 1,
-1.416483, 0.5067675, -1.00607, 0, 0, 0, 1, 1,
-1.403066, -0.8062951, -4.041626, 0, 0, 0, 1, 1,
-1.400913, 0.04563485, -3.172659, 0, 0, 0, 1, 1,
-1.392138, 0.1236002, -2.751086, 0, 0, 0, 1, 1,
-1.3722, 2.342926, -1.625009, 1, 1, 1, 1, 1,
-1.362888, 1.757165, -0.7422242, 1, 1, 1, 1, 1,
-1.359053, -0.3763418, -3.254838, 1, 1, 1, 1, 1,
-1.350859, -0.6568279, -1.490111, 1, 1, 1, 1, 1,
-1.339136, 0.5806638, -3.345787, 1, 1, 1, 1, 1,
-1.333809, -0.5074725, -2.721139, 1, 1, 1, 1, 1,
-1.32753, 0.2721596, 0.7842979, 1, 1, 1, 1, 1,
-1.325893, -0.1397623, -2.608154, 1, 1, 1, 1, 1,
-1.324648, 0.4413158, -2.647024, 1, 1, 1, 1, 1,
-1.318843, 0.5891883, -2.727681, 1, 1, 1, 1, 1,
-1.313172, 1.695134, 0.2734389, 1, 1, 1, 1, 1,
-1.310705, 0.8127317, -1.149433, 1, 1, 1, 1, 1,
-1.30704, 0.6108891, -1.636072, 1, 1, 1, 1, 1,
-1.303915, -1.070901, -1.912691, 1, 1, 1, 1, 1,
-1.303131, 0.9332357, -0.6022998, 1, 1, 1, 1, 1,
-1.302509, 0.8292376, -0.9499086, 0, 0, 1, 1, 1,
-1.295355, 0.6040104, -0.9825355, 1, 0, 0, 1, 1,
-1.28514, -1.246426, -1.38112, 1, 0, 0, 1, 1,
-1.277791, 1.117823, 1.226317, 1, 0, 0, 1, 1,
-1.272016, -1.148424, -2.429548, 1, 0, 0, 1, 1,
-1.268474, 1.490384, -0.9707106, 1, 0, 0, 1, 1,
-1.265923, -0.6639938, -2.202589, 0, 0, 0, 1, 1,
-1.263334, 1.498572, -1.01746, 0, 0, 0, 1, 1,
-1.260926, -0.6308259, -2.517852, 0, 0, 0, 1, 1,
-1.259146, -1.027542, -1.319298, 0, 0, 0, 1, 1,
-1.25663, -1.109451, -3.737314, 0, 0, 0, 1, 1,
-1.250306, 0.2452814, -3.589229, 0, 0, 0, 1, 1,
-1.249466, -1.080856, -2.439887, 0, 0, 0, 1, 1,
-1.237036, 1.037536, -1.875989, 1, 1, 1, 1, 1,
-1.231169, 0.06751031, -3.002283, 1, 1, 1, 1, 1,
-1.2289, -0.3287876, -2.579518, 1, 1, 1, 1, 1,
-1.221108, 0.439395, -1.664494, 1, 1, 1, 1, 1,
-1.211997, -1.198524, -0.08328705, 1, 1, 1, 1, 1,
-1.21177, -1.636239, -1.059612, 1, 1, 1, 1, 1,
-1.204341, 3.159825, -1.745639, 1, 1, 1, 1, 1,
-1.194059, 0.293564, -0.7250219, 1, 1, 1, 1, 1,
-1.18832, 0.103073, -2.983031, 1, 1, 1, 1, 1,
-1.18088, 0.05890517, -2.394388, 1, 1, 1, 1, 1,
-1.170362, 2.166142, -1.631352, 1, 1, 1, 1, 1,
-1.162688, -0.8890364, -3.224432, 1, 1, 1, 1, 1,
-1.15379, 1.859385, 1.458119, 1, 1, 1, 1, 1,
-1.147074, 1.826493, -2.709425, 1, 1, 1, 1, 1,
-1.146549, -0.3002422, -2.414343, 1, 1, 1, 1, 1,
-1.143406, -0.4134647, -2.57273, 0, 0, 1, 1, 1,
-1.136726, 0.1118067, -0.7970054, 1, 0, 0, 1, 1,
-1.135423, -0.01411799, -2.134025, 1, 0, 0, 1, 1,
-1.125001, -0.3185631, -2.032996, 1, 0, 0, 1, 1,
-1.123246, -1.366666, -3.202888, 1, 0, 0, 1, 1,
-1.118541, 0.1041056, -3.76347, 1, 0, 0, 1, 1,
-1.116156, -1.549073, -2.506389, 0, 0, 0, 1, 1,
-1.112557, -1.032161, -2.847344, 0, 0, 0, 1, 1,
-1.112066, 0.4840015, -1.471166, 0, 0, 0, 1, 1,
-1.091791, -0.11393, -0.3853959, 0, 0, 0, 1, 1,
-1.088069, 0.7764947, -3.143763, 0, 0, 0, 1, 1,
-1.083331, -0.2722135, -2.249433, 0, 0, 0, 1, 1,
-1.073529, -1.698262, -2.924541, 0, 0, 0, 1, 1,
-1.07123, 0.3794852, -1.958416, 1, 1, 1, 1, 1,
-1.071086, -0.6810457, -1.07605, 1, 1, 1, 1, 1,
-1.064009, -1.237813, -2.31963, 1, 1, 1, 1, 1,
-1.056843, -0.284106, -1.788727, 1, 1, 1, 1, 1,
-1.05561, 0.1621166, -2.197151, 1, 1, 1, 1, 1,
-1.051933, -0.1209513, -2.283033, 1, 1, 1, 1, 1,
-1.042663, 0.2099635, -0.636475, 1, 1, 1, 1, 1,
-1.042041, 1.204663, 0.1720667, 1, 1, 1, 1, 1,
-1.034905, -0.4274632, -2.202741, 1, 1, 1, 1, 1,
-1.034328, -0.1237553, -0.1117354, 1, 1, 1, 1, 1,
-1.022686, -0.4770472, -3.423401, 1, 1, 1, 1, 1,
-1.02161, -0.278108, -1.170098, 1, 1, 1, 1, 1,
-1.018205, -0.2970159, -2.981641, 1, 1, 1, 1, 1,
-1.008975, 0.05853267, -1.13121, 1, 1, 1, 1, 1,
-1.007202, 2.16893, 0.03875901, 1, 1, 1, 1, 1,
-0.9995586, 0.1671074, -1.088177, 0, 0, 1, 1, 1,
-0.9959376, 1.083957, -1.899195, 1, 0, 0, 1, 1,
-0.9903588, 0.1754036, -0.7594499, 1, 0, 0, 1, 1,
-0.9850731, 2.40267, -0.7037129, 1, 0, 0, 1, 1,
-0.985056, 0.6971462, 0.3027526, 1, 0, 0, 1, 1,
-0.9820255, 0.6971594, 0.2412663, 1, 0, 0, 1, 1,
-0.9810646, 0.5467982, -0.9143033, 0, 0, 0, 1, 1,
-0.9780864, 0.6636162, 0.551812, 0, 0, 0, 1, 1,
-0.9770225, -1.243903, -3.110555, 0, 0, 0, 1, 1,
-0.9719024, 1.068686, -0.7834601, 0, 0, 0, 1, 1,
-0.9636559, 2.118889, -1.483905, 0, 0, 0, 1, 1,
-0.9477371, -0.7091904, -2.26043, 0, 0, 0, 1, 1,
-0.9424183, -0.5232262, -1.24184, 0, 0, 0, 1, 1,
-0.9395138, 1.770961, -1.255627, 1, 1, 1, 1, 1,
-0.9357817, 0.9788435, -0.392385, 1, 1, 1, 1, 1,
-0.9335067, -1.050593, -2.261737, 1, 1, 1, 1, 1,
-0.9240997, 1.013328, 0.9055173, 1, 1, 1, 1, 1,
-0.9172541, -0.05297481, -1.754084, 1, 1, 1, 1, 1,
-0.9152067, 1.497844, -0.8901783, 1, 1, 1, 1, 1,
-0.9145948, -0.1253588, -2.158292, 1, 1, 1, 1, 1,
-0.9142493, 0.8657612, -0.6888362, 1, 1, 1, 1, 1,
-0.9139757, -0.3802031, -0.7704273, 1, 1, 1, 1, 1,
-0.9138423, -0.1268289, -2.633449, 1, 1, 1, 1, 1,
-0.9124582, 1.037874, -0.4426582, 1, 1, 1, 1, 1,
-0.9114115, -1.215683, -2.050167, 1, 1, 1, 1, 1,
-0.9055244, -0.1427072, -1.790832, 1, 1, 1, 1, 1,
-0.902257, 0.1874899, -1.0778, 1, 1, 1, 1, 1,
-0.899788, 0.1713032, -1.185084, 1, 1, 1, 1, 1,
-0.8990157, 0.3884685, -2.652562, 0, 0, 1, 1, 1,
-0.8958582, 0.7478125, -0.3067506, 1, 0, 0, 1, 1,
-0.8873254, 0.9951617, 1.54463, 1, 0, 0, 1, 1,
-0.8858818, 0.4745969, -2.682876, 1, 0, 0, 1, 1,
-0.8851465, -0.2980202, -2.316985, 1, 0, 0, 1, 1,
-0.8652178, 0.9226907, 0.09347961, 1, 0, 0, 1, 1,
-0.8624035, 1.866863, -1.687006, 0, 0, 0, 1, 1,
-0.8552296, -0.8274143, -4.289829, 0, 0, 0, 1, 1,
-0.8540924, -0.2631842, -1.39591, 0, 0, 0, 1, 1,
-0.8538232, 1.569488, -0.1315332, 0, 0, 0, 1, 1,
-0.8462903, -0.2684197, -0.9588808, 0, 0, 0, 1, 1,
-0.8432904, -0.2317726, -2.767908, 0, 0, 0, 1, 1,
-0.8409858, 1.041968, -0.1857996, 0, 0, 0, 1, 1,
-0.8314714, -1.560224, -1.10762, 1, 1, 1, 1, 1,
-0.8309999, 0.8361596, -0.7276651, 1, 1, 1, 1, 1,
-0.8301059, -2.30146, -0.8861474, 1, 1, 1, 1, 1,
-0.8283256, 1.347625, -0.6666337, 1, 1, 1, 1, 1,
-0.8251718, -1.058646, -1.918638, 1, 1, 1, 1, 1,
-0.8238931, -1.315405, -2.38582, 1, 1, 1, 1, 1,
-0.8219528, -1.273526, -3.538888, 1, 1, 1, 1, 1,
-0.8208422, 1.046767, -1.180741, 1, 1, 1, 1, 1,
-0.8169899, -0.8824098, -2.728459, 1, 1, 1, 1, 1,
-0.813917, 1.016067, -0.7324578, 1, 1, 1, 1, 1,
-0.8120468, -1.041827, -2.854496, 1, 1, 1, 1, 1,
-0.811672, -0.5959557, -0.7552549, 1, 1, 1, 1, 1,
-0.8092518, -0.1974137, -2.213985, 1, 1, 1, 1, 1,
-0.8062132, -1.639228, -2.665229, 1, 1, 1, 1, 1,
-0.7932509, -0.5318028, -3.003826, 1, 1, 1, 1, 1,
-0.7762768, 0.4549045, -0.9627025, 0, 0, 1, 1, 1,
-0.7726954, -0.5236079, -3.992404, 1, 0, 0, 1, 1,
-0.7704402, -0.06372105, -3.507741, 1, 0, 0, 1, 1,
-0.7665273, -0.2572832, -3.441025, 1, 0, 0, 1, 1,
-0.7608129, 0.2461635, -3.397069, 1, 0, 0, 1, 1,
-0.7556092, -0.1596329, -3.292878, 1, 0, 0, 1, 1,
-0.7534238, 0.5704762, -0.6652761, 0, 0, 0, 1, 1,
-0.7520701, -0.0692234, -1.844157, 0, 0, 0, 1, 1,
-0.7465101, 1.105091, -0.890582, 0, 0, 0, 1, 1,
-0.7399301, 1.946362, 1.187564, 0, 0, 0, 1, 1,
-0.7356273, 1.472872, 0.4870427, 0, 0, 0, 1, 1,
-0.7349285, -0.99081, -3.294691, 0, 0, 0, 1, 1,
-0.7323356, -0.1439355, -1.057546, 0, 0, 0, 1, 1,
-0.7322872, 0.06620471, 0.00284317, 1, 1, 1, 1, 1,
-0.7284046, -1.060168, -2.382714, 1, 1, 1, 1, 1,
-0.7248582, -0.5775436, -2.562759, 1, 1, 1, 1, 1,
-0.7216787, 0.6113393, 1.34704, 1, 1, 1, 1, 1,
-0.7122463, -0.9325607, -2.046497, 1, 1, 1, 1, 1,
-0.7112108, -0.4167937, -2.179988, 1, 1, 1, 1, 1,
-0.7083586, 0.2453392, -2.509711, 1, 1, 1, 1, 1,
-0.7026172, 0.4122003, -1.956197, 1, 1, 1, 1, 1,
-0.7005238, 0.7066341, -1.06472, 1, 1, 1, 1, 1,
-0.6995237, -0.3016275, -1.438403, 1, 1, 1, 1, 1,
-0.6979832, -0.02579025, -2.191332, 1, 1, 1, 1, 1,
-0.6979348, 1.587425, 1.925001, 1, 1, 1, 1, 1,
-0.6956969, 0.3905708, -0.8081418, 1, 1, 1, 1, 1,
-0.6926026, 0.7480645, -0.1752144, 1, 1, 1, 1, 1,
-0.691774, -0.844337, -2.862756, 1, 1, 1, 1, 1,
-0.6870457, 0.2604645, -2.133499, 0, 0, 1, 1, 1,
-0.6866095, 0.6904025, -1.790504, 1, 0, 0, 1, 1,
-0.6815639, -0.4579508, -2.996807, 1, 0, 0, 1, 1,
-0.6771125, 0.07639079, -1.637587, 1, 0, 0, 1, 1,
-0.6729885, 0.3243215, -2.15108, 1, 0, 0, 1, 1,
-0.6716844, 0.5852501, 0.2232801, 1, 0, 0, 1, 1,
-0.6674875, -1.353557, -2.594967, 0, 0, 0, 1, 1,
-0.66694, 1.15686, -2.810628, 0, 0, 0, 1, 1,
-0.665445, 0.7515451, -0.3373218, 0, 0, 0, 1, 1,
-0.6650321, -1.222083, -1.627199, 0, 0, 0, 1, 1,
-0.659138, 0.8597573, 0.4230607, 0, 0, 0, 1, 1,
-0.65622, -0.7863917, -3.872028, 0, 0, 0, 1, 1,
-0.6501011, 1.51337, -0.8841078, 0, 0, 0, 1, 1,
-0.6425389, 0.4896037, 1.00873, 1, 1, 1, 1, 1,
-0.6419219, 0.9719961, 0.5615328, 1, 1, 1, 1, 1,
-0.6396836, 0.6604787, -1.608242, 1, 1, 1, 1, 1,
-0.6392745, 0.1635631, -2.026312, 1, 1, 1, 1, 1,
-0.6391805, -0.4582748, -1.480849, 1, 1, 1, 1, 1,
-0.6387343, -0.4603912, -4.900598, 1, 1, 1, 1, 1,
-0.6340334, -0.05811727, -4.036424, 1, 1, 1, 1, 1,
-0.6335384, 0.03248279, -1.558617, 1, 1, 1, 1, 1,
-0.6324874, 0.2759998, -2.054657, 1, 1, 1, 1, 1,
-0.6306958, -0.7122526, 0.2967932, 1, 1, 1, 1, 1,
-0.6276353, -1.866134, -2.042699, 1, 1, 1, 1, 1,
-0.625877, 1.932351, 0.5441383, 1, 1, 1, 1, 1,
-0.6254916, -2.158722, -2.70928, 1, 1, 1, 1, 1,
-0.6243636, 0.3413005, -2.869805, 1, 1, 1, 1, 1,
-0.6232029, -0.4959098, -2.572858, 1, 1, 1, 1, 1,
-0.6165496, -1.389723, -1.083039, 0, 0, 1, 1, 1,
-0.6157668, -0.41643, -2.553982, 1, 0, 0, 1, 1,
-0.6123566, 0.489771, -1.482893, 1, 0, 0, 1, 1,
-0.6103603, 0.6228365, 0.2267654, 1, 0, 0, 1, 1,
-0.5989579, -1.404403, -2.945564, 1, 0, 0, 1, 1,
-0.597165, 1.102453, -1.260754, 1, 0, 0, 1, 1,
-0.5970811, -2.690445, -3.131136, 0, 0, 0, 1, 1,
-0.5940439, -0.3170066, -3.092091, 0, 0, 0, 1, 1,
-0.5895293, -0.2827962, -2.346131, 0, 0, 0, 1, 1,
-0.5846573, 0.06800379, -1.655183, 0, 0, 0, 1, 1,
-0.5811514, -1.064389, -2.594717, 0, 0, 0, 1, 1,
-0.5778584, 0.0604844, -1.5708, 0, 0, 0, 1, 1,
-0.5756788, -0.5040305, -2.530612, 0, 0, 0, 1, 1,
-0.5705756, -0.4719909, -2.670586, 1, 1, 1, 1, 1,
-0.5679398, 0.06876069, -0.1919795, 1, 1, 1, 1, 1,
-0.5648723, 0.8250722, 0.3841141, 1, 1, 1, 1, 1,
-0.5614396, -0.4849993, -2.678492, 1, 1, 1, 1, 1,
-0.560118, -1.192197, -4.154994, 1, 1, 1, 1, 1,
-0.5485103, 0.320751, -0.9611921, 1, 1, 1, 1, 1,
-0.5439757, 0.9889969, -1.117532, 1, 1, 1, 1, 1,
-0.5430371, 0.1354453, -3.415145, 1, 1, 1, 1, 1,
-0.5370474, 2.04528, -0.2778513, 1, 1, 1, 1, 1,
-0.5345703, -0.5150658, -3.051004, 1, 1, 1, 1, 1,
-0.5315563, -1.102989, -1.754927, 1, 1, 1, 1, 1,
-0.5287402, -0.09899375, -2.148391, 1, 1, 1, 1, 1,
-0.5234045, 2.248481, -2.54732, 1, 1, 1, 1, 1,
-0.5199775, 0.4716, -1.102501, 1, 1, 1, 1, 1,
-0.5185103, 2.295878, 1.125206, 1, 1, 1, 1, 1,
-0.5178185, -0.3502292, -2.498829, 0, 0, 1, 1, 1,
-0.5101131, 0.7116187, -1.814211, 1, 0, 0, 1, 1,
-0.5022637, 0.2535879, -0.7234766, 1, 0, 0, 1, 1,
-0.4999333, -2.025028, -3.402465, 1, 0, 0, 1, 1,
-0.4995218, -0.6564654, -3.48325, 1, 0, 0, 1, 1,
-0.4993746, 1.159644, -1.286795, 1, 0, 0, 1, 1,
-0.4966466, -0.7814787, -2.982774, 0, 0, 0, 1, 1,
-0.4948629, -0.8301097, -2.277111, 0, 0, 0, 1, 1,
-0.4897302, 0.3773159, -0.3550859, 0, 0, 0, 1, 1,
-0.4889007, -0.6434522, -3.251021, 0, 0, 0, 1, 1,
-0.4834397, -0.1970647, -0.1368262, 0, 0, 0, 1, 1,
-0.4824815, -0.05073792, -1.325181, 0, 0, 0, 1, 1,
-0.4820218, -0.7081878, -2.936233, 0, 0, 0, 1, 1,
-0.475271, -1.454757, -2.698128, 1, 1, 1, 1, 1,
-0.4746974, -0.5747633, -3.157544, 1, 1, 1, 1, 1,
-0.4744689, 1.114966, 0.2740358, 1, 1, 1, 1, 1,
-0.471604, -1.480544, -2.082822, 1, 1, 1, 1, 1,
-0.4708858, -1.257043, -3.670514, 1, 1, 1, 1, 1,
-0.4629865, -2.079974, -6.11398, 1, 1, 1, 1, 1,
-0.4515803, 0.3529046, -0.2677436, 1, 1, 1, 1, 1,
-0.4497645, -0.1944892, -1.728083, 1, 1, 1, 1, 1,
-0.449558, 1.086974, 2.316926, 1, 1, 1, 1, 1,
-0.4482183, 0.0569391, -1.796226, 1, 1, 1, 1, 1,
-0.446103, 0.1404082, -1.4832, 1, 1, 1, 1, 1,
-0.4432549, 2.136582, 1.216171, 1, 1, 1, 1, 1,
-0.4419151, -1.331805, -1.950608, 1, 1, 1, 1, 1,
-0.4389623, 0.05199517, -2.414716, 1, 1, 1, 1, 1,
-0.4340832, -1.84542, -4.5132, 1, 1, 1, 1, 1,
-0.4333863, 0.1422729, -1.346482, 0, 0, 1, 1, 1,
-0.4319882, -0.1672385, -1.362148, 1, 0, 0, 1, 1,
-0.4304827, -1.72879, -2.227682, 1, 0, 0, 1, 1,
-0.4302695, 0.7276764, 0.6790968, 1, 0, 0, 1, 1,
-0.4278587, -0.6498293, -3.427191, 1, 0, 0, 1, 1,
-0.4225219, -0.5285614, -2.253184, 1, 0, 0, 1, 1,
-0.4158961, -0.6344624, -2.901689, 0, 0, 0, 1, 1,
-0.4078391, -0.4591998, -1.619767, 0, 0, 0, 1, 1,
-0.4068276, -1.352285, -4.40376, 0, 0, 0, 1, 1,
-0.404082, 0.04678828, -2.389021, 0, 0, 0, 1, 1,
-0.4039342, 0.4027524, 0.1970144, 0, 0, 0, 1, 1,
-0.4033498, 0.3128126, -0.04197456, 0, 0, 0, 1, 1,
-0.4025726, -0.1164649, 0.3422112, 0, 0, 0, 1, 1,
-0.4024352, 0.9317684, 0.121753, 1, 1, 1, 1, 1,
-0.4004458, -1.421066, -3.288172, 1, 1, 1, 1, 1,
-0.3867936, -0.2638332, -3.865592, 1, 1, 1, 1, 1,
-0.3851192, -1.11965, -3.638159, 1, 1, 1, 1, 1,
-0.3826511, -1.012787, -2.341714, 1, 1, 1, 1, 1,
-0.3728089, 0.07250214, -1.135206, 1, 1, 1, 1, 1,
-0.3672801, 1.614518, -0.4340499, 1, 1, 1, 1, 1,
-0.3419867, -0.1333145, -3.209841, 1, 1, 1, 1, 1,
-0.3412215, 0.2090963, 0.2390585, 1, 1, 1, 1, 1,
-0.3395852, -0.5562779, -4.727582, 1, 1, 1, 1, 1,
-0.3384651, 0.4785854, -0.5236001, 1, 1, 1, 1, 1,
-0.3374003, 1.873565, 0.5495929, 1, 1, 1, 1, 1,
-0.3371364, -0.0003072626, -1.148743, 1, 1, 1, 1, 1,
-0.3340625, -0.2611982, -3.369699, 1, 1, 1, 1, 1,
-0.3334953, 0.6475838, 0.6855505, 1, 1, 1, 1, 1,
-0.3318397, -0.3612554, -2.717987, 0, 0, 1, 1, 1,
-0.327888, 0.6751472, 0.05619128, 1, 0, 0, 1, 1,
-0.326979, -0.6286442, -2.074122, 1, 0, 0, 1, 1,
-0.3235449, 0.227903, -2.226391, 1, 0, 0, 1, 1,
-0.3213544, -0.6089962, -2.271629, 1, 0, 0, 1, 1,
-0.3209083, 0.1924146, -1.876337, 1, 0, 0, 1, 1,
-0.3173783, 0.4265304, -0.1242273, 0, 0, 0, 1, 1,
-0.3094784, -0.4110153, -1.997424, 0, 0, 0, 1, 1,
-0.3082863, -0.5717223, -3.385772, 0, 0, 0, 1, 1,
-0.3044282, -0.9880319, -2.19287, 0, 0, 0, 1, 1,
-0.3041115, -0.2647533, -2.545876, 0, 0, 0, 1, 1,
-0.3040128, -1.268379, -2.538404, 0, 0, 0, 1, 1,
-0.3024001, -0.8541, -2.039401, 0, 0, 0, 1, 1,
-0.3023959, 0.3008962, -0.190637, 1, 1, 1, 1, 1,
-0.3016235, 1.148261, -0.6935853, 1, 1, 1, 1, 1,
-0.2974717, -0.6032181, -3.60873, 1, 1, 1, 1, 1,
-0.2948137, 0.4093142, -0.6621302, 1, 1, 1, 1, 1,
-0.2939951, 0.3349484, -0.7907887, 1, 1, 1, 1, 1,
-0.2866902, -0.8738194, -3.048018, 1, 1, 1, 1, 1,
-0.2835303, -2.039478, -4.761307, 1, 1, 1, 1, 1,
-0.2783607, -1.106905, -2.72589, 1, 1, 1, 1, 1,
-0.2740012, -0.7836943, -2.49578, 1, 1, 1, 1, 1,
-0.2729467, -1.70396, -1.765242, 1, 1, 1, 1, 1,
-0.2725237, -2.255063, -4.030813, 1, 1, 1, 1, 1,
-0.2692123, 0.2851236, -2.124861, 1, 1, 1, 1, 1,
-0.2691232, -0.5500387, -2.923796, 1, 1, 1, 1, 1,
-0.2589435, 0.6425185, -2.237881, 1, 1, 1, 1, 1,
-0.2584026, -1.558685, -3.256954, 1, 1, 1, 1, 1,
-0.2528667, -0.01460506, -2.788233, 0, 0, 1, 1, 1,
-0.2497981, -0.4496763, -1.536392, 1, 0, 0, 1, 1,
-0.2494235, 1.218966, 1.555072, 1, 0, 0, 1, 1,
-0.2481829, -1.347562, -4.51071, 1, 0, 0, 1, 1,
-0.2471932, 0.475293, 0.942461, 1, 0, 0, 1, 1,
-0.2466282, -0.05290749, -3.397017, 1, 0, 0, 1, 1,
-0.245647, 1.725718, -0.2816108, 0, 0, 0, 1, 1,
-0.2408057, 0.3636872, -2.076124, 0, 0, 0, 1, 1,
-0.2363339, -0.3277005, -3.778042, 0, 0, 0, 1, 1,
-0.2334289, 0.7702105, -0.8350714, 0, 0, 0, 1, 1,
-0.2280528, -0.8013939, -3.12608, 0, 0, 0, 1, 1,
-0.2240984, -0.01620857, -1.22257, 0, 0, 0, 1, 1,
-0.2238278, 0.557619, -1.941222, 0, 0, 0, 1, 1,
-0.2233427, 0.4778037, -2.27247, 1, 1, 1, 1, 1,
-0.2225005, 1.002489, -0.9130784, 1, 1, 1, 1, 1,
-0.2191091, 0.04626782, -2.068588, 1, 1, 1, 1, 1,
-0.2177976, 1.813284, -0.6389984, 1, 1, 1, 1, 1,
-0.2171508, 2.065787, 0.2081287, 1, 1, 1, 1, 1,
-0.2156656, -0.4794731, -1.858786, 1, 1, 1, 1, 1,
-0.2138852, -0.754141, -3.40231, 1, 1, 1, 1, 1,
-0.2137032, -1.291971, -3.284154, 1, 1, 1, 1, 1,
-0.2123032, -0.08822981, -2.492649, 1, 1, 1, 1, 1,
-0.2085195, 1.370685, 0.3287207, 1, 1, 1, 1, 1,
-0.2083133, -0.8398012, -2.105885, 1, 1, 1, 1, 1,
-0.2072963, 0.7432758, 0.6355717, 1, 1, 1, 1, 1,
-0.2062329, -0.4894583, -2.342016, 1, 1, 1, 1, 1,
-0.2031469, -0.9853569, -3.080045, 1, 1, 1, 1, 1,
-0.2012206, -0.9574286, -3.467719, 1, 1, 1, 1, 1,
-0.2000326, -0.3013413, -2.656765, 0, 0, 1, 1, 1,
-0.1969355, -0.009915337, -1.62922, 1, 0, 0, 1, 1,
-0.1946947, 1.311476, -0.7219313, 1, 0, 0, 1, 1,
-0.1926702, -0.2441946, -2.523828, 1, 0, 0, 1, 1,
-0.1925853, 0.881612, 0.7140692, 1, 0, 0, 1, 1,
-0.1912501, 0.2190063, -0.7289476, 1, 0, 0, 1, 1,
-0.1884729, 1.270614, -0.7875903, 0, 0, 0, 1, 1,
-0.1866058, 1.019011, -0.8635954, 0, 0, 0, 1, 1,
-0.1865569, -0.6451104, -3.360643, 0, 0, 0, 1, 1,
-0.1863335, 0.5386367, -0.596889, 0, 0, 0, 1, 1,
-0.1799083, 0.4896109, -1.27978, 0, 0, 0, 1, 1,
-0.1782986, -0.3670931, -1.648346, 0, 0, 0, 1, 1,
-0.1764163, 2.125718, 0.5825096, 0, 0, 0, 1, 1,
-0.1751491, -0.498542, -2.290354, 1, 1, 1, 1, 1,
-0.1662864, 2.171233, 0.6406707, 1, 1, 1, 1, 1,
-0.166016, 0.8773605, 0.4109821, 1, 1, 1, 1, 1,
-0.165182, 0.3317631, -1.066016, 1, 1, 1, 1, 1,
-0.1621973, -0.769502, -0.8788834, 1, 1, 1, 1, 1,
-0.1588626, -1.867932, -1.873383, 1, 1, 1, 1, 1,
-0.157554, -0.8701455, -3.007539, 1, 1, 1, 1, 1,
-0.1571899, -0.7958382, -3.047885, 1, 1, 1, 1, 1,
-0.1528557, -1.911558, -4.945347, 1, 1, 1, 1, 1,
-0.1510868, 0.9189814, -1.398769, 1, 1, 1, 1, 1,
-0.1504391, 0.255753, -0.6772109, 1, 1, 1, 1, 1,
-0.148231, 0.002419301, -3.200267, 1, 1, 1, 1, 1,
-0.1431435, -0.4658857, -1.246714, 1, 1, 1, 1, 1,
-0.1416899, 0.134066, 0.01982569, 1, 1, 1, 1, 1,
-0.1397475, -0.6308088, -4.123724, 1, 1, 1, 1, 1,
-0.1397372, -0.7906127, -3.854579, 0, 0, 1, 1, 1,
-0.1343061, 1.144255, 1.598496, 1, 0, 0, 1, 1,
-0.1329369, 0.8134471, 0.213036, 1, 0, 0, 1, 1,
-0.1304435, -0.2143941, -3.185805, 1, 0, 0, 1, 1,
-0.1284026, -1.252898, -4.254274, 1, 0, 0, 1, 1,
-0.1241561, -0.7894076, -2.344145, 1, 0, 0, 1, 1,
-0.1208969, 0.7897022, 1.379496, 0, 0, 0, 1, 1,
-0.1171459, -0.489914, -4.865525, 0, 0, 0, 1, 1,
-0.1156491, 0.5520345, 0.5793056, 0, 0, 0, 1, 1,
-0.1065116, 0.8668073, -0.1592969, 0, 0, 0, 1, 1,
-0.1032163, -0.1076899, -3.071016, 0, 0, 0, 1, 1,
-0.1019948, -0.6567912, -2.457484, 0, 0, 0, 1, 1,
-0.1003888, -1.196614, -1.034884, 0, 0, 0, 1, 1,
-0.09941459, -1.352448, -3.707575, 1, 1, 1, 1, 1,
-0.09849723, -0.1616516, -4.363401, 1, 1, 1, 1, 1,
-0.09135149, -0.7123317, -2.404256, 1, 1, 1, 1, 1,
-0.08260611, -1.105939, -3.733293, 1, 1, 1, 1, 1,
-0.08247596, -1.980618, -4.760961, 1, 1, 1, 1, 1,
-0.07756141, 0.1612102, -0.4001281, 1, 1, 1, 1, 1,
-0.07476488, -0.5321618, -3.428267, 1, 1, 1, 1, 1,
-0.071421, 1.387398, 1.526536, 1, 1, 1, 1, 1,
-0.07133891, 0.3311245, -0.3296785, 1, 1, 1, 1, 1,
-0.07116999, 0.1433678, 0.2387372, 1, 1, 1, 1, 1,
-0.07031613, 0.07608718, -1.507227, 1, 1, 1, 1, 1,
-0.06188709, -1.763835, -5.380015, 1, 1, 1, 1, 1,
-0.05866297, -1.02097, -2.129033, 1, 1, 1, 1, 1,
-0.05554153, -0.9250539, -1.643831, 1, 1, 1, 1, 1,
-0.05387009, 0.1234505, -3.512578, 1, 1, 1, 1, 1,
-0.04991603, -0.8246419, -2.185287, 0, 0, 1, 1, 1,
-0.04271573, 0.9173578, -1.224754, 1, 0, 0, 1, 1,
-0.04269705, 0.5878361, -0.7479574, 1, 0, 0, 1, 1,
-0.04234615, -0.3721839, -2.775417, 1, 0, 0, 1, 1,
-0.0417116, -0.04037668, -1.499706, 1, 0, 0, 1, 1,
-0.04007053, -2.484953, -2.788875, 1, 0, 0, 1, 1,
-0.0353322, -0.1700878, -2.896154, 0, 0, 0, 1, 1,
-0.02868356, 0.6414382, 1.481553, 0, 0, 0, 1, 1,
-0.02806976, -1.901476, -1.752085, 0, 0, 0, 1, 1,
-0.02627591, 0.4455865, 0.8691196, 0, 0, 0, 1, 1,
-0.02497006, -1.871398, -2.651965, 0, 0, 0, 1, 1,
-0.02262035, -0.8355803, -2.654398, 0, 0, 0, 1, 1,
-0.02142032, -0.5009466, -3.961378, 0, 0, 0, 1, 1,
-0.02137482, 3.060796, 0.08074947, 1, 1, 1, 1, 1,
-0.02105602, 0.1432457, -0.4134959, 1, 1, 1, 1, 1,
-0.01835693, 1.120875, 0.3648751, 1, 1, 1, 1, 1,
-0.01477844, -0.4825408, -3.750396, 1, 1, 1, 1, 1,
-0.004546873, 0.4643596, -0.7317694, 1, 1, 1, 1, 1,
-0.004396771, -0.4638452, -2.534868, 1, 1, 1, 1, 1,
-0.003807112, 0.6448671, 0.1995436, 1, 1, 1, 1, 1,
-0.002222052, 0.5939533, 0.9773561, 1, 1, 1, 1, 1,
-0.0002640302, 1.92951, -0.02953063, 1, 1, 1, 1, 1,
0.0001519196, -0.4922812, 2.452785, 1, 1, 1, 1, 1,
0.002275768, -0.1886241, 3.916046, 1, 1, 1, 1, 1,
0.01056843, -0.02548238, 4.278358, 1, 1, 1, 1, 1,
0.01244119, 0.5237209, -0.002380726, 1, 1, 1, 1, 1,
0.01260886, -1.59881, 3.112762, 1, 1, 1, 1, 1,
0.01396937, -0.7488486, 3.995236, 1, 1, 1, 1, 1,
0.01429648, 0.3159193, 0.0791096, 0, 0, 1, 1, 1,
0.01989994, -1.053695, 1.590545, 1, 0, 0, 1, 1,
0.02021308, 0.7180641, -1.481046, 1, 0, 0, 1, 1,
0.0238474, 2.409017, -1.327717, 1, 0, 0, 1, 1,
0.02525978, -0.6139828, 4.255789, 1, 0, 0, 1, 1,
0.02690382, 0.2520831, -1.19155, 1, 0, 0, 1, 1,
0.02801216, 0.287114, -0.08405931, 0, 0, 0, 1, 1,
0.02807427, 0.5059382, -0.2966737, 0, 0, 0, 1, 1,
0.03088333, 1.023597, -1.48526, 0, 0, 0, 1, 1,
0.03184507, 0.1387593, 0.3343676, 0, 0, 0, 1, 1,
0.03188764, -1.041473, 1.530398, 0, 0, 0, 1, 1,
0.03350442, 1.568297, 0.9080858, 0, 0, 0, 1, 1,
0.0359512, -0.1126859, 2.405871, 0, 0, 0, 1, 1,
0.0367444, 1.747933, -0.6280751, 1, 1, 1, 1, 1,
0.03752812, 1.216125, 0.4830774, 1, 1, 1, 1, 1,
0.04238248, 1.766886, -1.273931, 1, 1, 1, 1, 1,
0.04698515, 0.6294713, -0.5429893, 1, 1, 1, 1, 1,
0.04969921, 0.3360739, 0.2228614, 1, 1, 1, 1, 1,
0.05081162, -1.0347, 4.715408, 1, 1, 1, 1, 1,
0.05095769, -1.135144, 4.400569, 1, 1, 1, 1, 1,
0.05192916, -1.359197, 3.95136, 1, 1, 1, 1, 1,
0.05404861, -1.391013, 2.823274, 1, 1, 1, 1, 1,
0.05501116, 1.567887, 0.1278835, 1, 1, 1, 1, 1,
0.05653168, 0.8850791, 0.4373008, 1, 1, 1, 1, 1,
0.05728437, -1.993188, 4.109929, 1, 1, 1, 1, 1,
0.06697841, -0.3274856, 3.825057, 1, 1, 1, 1, 1,
0.07211218, -0.5841814, 2.356126, 1, 1, 1, 1, 1,
0.07212477, -0.6267976, 4.282328, 1, 1, 1, 1, 1,
0.07317831, 1.694676, -0.1284428, 0, 0, 1, 1, 1,
0.07352752, -0.1404031, 2.047231, 1, 0, 0, 1, 1,
0.07398178, -0.740277, 4.078418, 1, 0, 0, 1, 1,
0.07448559, -0.2563967, 1.90529, 1, 0, 0, 1, 1,
0.07897127, -2.477018, 1.471133, 1, 0, 0, 1, 1,
0.07950558, 0.4167908, 1.011385, 1, 0, 0, 1, 1,
0.08305192, 0.003947097, 0.9731088, 0, 0, 0, 1, 1,
0.08745884, -0.1103618, 2.148746, 0, 0, 0, 1, 1,
0.08810872, 1.197647, -1.421934, 0, 0, 0, 1, 1,
0.09117845, 2.118139, 1.197911, 0, 0, 0, 1, 1,
0.1008708, -0.07048649, 2.125237, 0, 0, 0, 1, 1,
0.1031717, 1.371343, 0.4397867, 0, 0, 0, 1, 1,
0.1090739, 0.9742968, -0.1868823, 0, 0, 0, 1, 1,
0.1099809, 0.1254371, 1.376354, 1, 1, 1, 1, 1,
0.1135086, -0.9259942, 3.47886, 1, 1, 1, 1, 1,
0.1168445, -0.3225757, 3.738408, 1, 1, 1, 1, 1,
0.1171622, -0.01515921, 2.543876, 1, 1, 1, 1, 1,
0.1195374, 2.447012, -0.8968129, 1, 1, 1, 1, 1,
0.1211753, -0.1475368, 2.568511, 1, 1, 1, 1, 1,
0.1224803, -0.8938745, 3.419459, 1, 1, 1, 1, 1,
0.1248141, 0.8744463, 1.167662, 1, 1, 1, 1, 1,
0.1373267, -0.6333414, 2.011082, 1, 1, 1, 1, 1,
0.1384012, 0.05991528, 1.007285, 1, 1, 1, 1, 1,
0.1424828, -0.04029791, 1.565606, 1, 1, 1, 1, 1,
0.1447205, 0.7978334, -1.117193, 1, 1, 1, 1, 1,
0.1498355, 0.5422264, 0.05689394, 1, 1, 1, 1, 1,
0.1515242, -1.015446, 3.350141, 1, 1, 1, 1, 1,
0.1530359, 0.4255971, 0.1647711, 1, 1, 1, 1, 1,
0.1538205, 0.1846622, 1.756562, 0, 0, 1, 1, 1,
0.1549773, -1.616318, 3.136736, 1, 0, 0, 1, 1,
0.155973, -0.03371595, 1.397387, 1, 0, 0, 1, 1,
0.1602419, -0.3199611, 2.944156, 1, 0, 0, 1, 1,
0.1612697, 1.374198, 0.7007465, 1, 0, 0, 1, 1,
0.1694752, -1.203592, 5.039785, 1, 0, 0, 1, 1,
0.1705797, 0.006641028, 2.026035, 0, 0, 0, 1, 1,
0.1717289, 1.538026, -1.579535, 0, 0, 0, 1, 1,
0.1778314, -0.7535746, 3.879258, 0, 0, 0, 1, 1,
0.1891405, -0.1384835, 2.446356, 0, 0, 0, 1, 1,
0.1923727, -0.0438235, 2.004227, 0, 0, 0, 1, 1,
0.1951641, 2.150987, -0.734683, 0, 0, 0, 1, 1,
0.1959467, 0.5960338, 1.604309, 0, 0, 0, 1, 1,
0.2010508, 0.325755, 2.555762, 1, 1, 1, 1, 1,
0.2053583, -1.040543, 2.128871, 1, 1, 1, 1, 1,
0.209017, 0.08349863, 0.7412255, 1, 1, 1, 1, 1,
0.2130183, 0.398399, 1.806477, 1, 1, 1, 1, 1,
0.2140406, -0.4585207, 2.974688, 1, 1, 1, 1, 1,
0.2143823, -1.323411, 2.510249, 1, 1, 1, 1, 1,
0.2174829, 0.9117827, 0.0819262, 1, 1, 1, 1, 1,
0.2215208, 1.478382, 0.1183991, 1, 1, 1, 1, 1,
0.2309886, -0.8845331, 1.89462, 1, 1, 1, 1, 1,
0.2344025, 1.114554, 0.1536884, 1, 1, 1, 1, 1,
0.2346747, -0.06090029, 1.370623, 1, 1, 1, 1, 1,
0.2370872, 0.5997594, -1.006893, 1, 1, 1, 1, 1,
0.2553897, 1.86306, 0.5848818, 1, 1, 1, 1, 1,
0.255584, -0.5479076, 2.644243, 1, 1, 1, 1, 1,
0.2631751, -1.131784, 3.817936, 1, 1, 1, 1, 1,
0.2632785, 1.362459, -0.6635683, 0, 0, 1, 1, 1,
0.2647184, -0.426802, 1.154969, 1, 0, 0, 1, 1,
0.2660769, 1.826213, -0.362893, 1, 0, 0, 1, 1,
0.2714527, -0.6306548, 2.210681, 1, 0, 0, 1, 1,
0.2735924, 0.008476264, 1.499794, 1, 0, 0, 1, 1,
0.2771277, -1.77128, 4.277548, 1, 0, 0, 1, 1,
0.2834884, -1.779074, 3.10114, 0, 0, 0, 1, 1,
0.2871344, -0.7862863, 3.045812, 0, 0, 0, 1, 1,
0.2906381, -0.2510871, 2.637784, 0, 0, 0, 1, 1,
0.291471, -1.06976, 4.345089, 0, 0, 0, 1, 1,
0.2943539, -0.7845762, 3.355493, 0, 0, 0, 1, 1,
0.2963955, -0.3463196, 3.101939, 0, 0, 0, 1, 1,
0.2975979, 1.017539, 0.5637217, 0, 0, 0, 1, 1,
0.2980648, -1.098821, 4.118309, 1, 1, 1, 1, 1,
0.3000371, -0.436251, 1.364325, 1, 1, 1, 1, 1,
0.3085513, 1.145467, 0.06108803, 1, 1, 1, 1, 1,
0.3102058, -0.380324, 1.209755, 1, 1, 1, 1, 1,
0.3154302, 1.626459, -0.6011276, 1, 1, 1, 1, 1,
0.3166037, 0.1837822, 0.8108321, 1, 1, 1, 1, 1,
0.3168734, -0.3248042, 2.543417, 1, 1, 1, 1, 1,
0.3190165, -0.6728033, 3.458461, 1, 1, 1, 1, 1,
0.3221444, 1.065744, -0.5043952, 1, 1, 1, 1, 1,
0.3226572, -0.8064461, 3.789549, 1, 1, 1, 1, 1,
0.3261916, -0.4308881, 2.231943, 1, 1, 1, 1, 1,
0.3306474, 0.4748926, 0.1222248, 1, 1, 1, 1, 1,
0.3319983, -0.6755418, 2.546138, 1, 1, 1, 1, 1,
0.333685, -0.8285981, 3.74668, 1, 1, 1, 1, 1,
0.3421549, -2.411561, 2.307237, 1, 1, 1, 1, 1,
0.3433185, 0.4083062, -0.2792486, 0, 0, 1, 1, 1,
0.3450469, 0.3390298, 0.5847231, 1, 0, 0, 1, 1,
0.3523182, -0.4618729, 1.522231, 1, 0, 0, 1, 1,
0.352422, 0.1152345, 1.215304, 1, 0, 0, 1, 1,
0.3543606, -0.4993549, 3.602547, 1, 0, 0, 1, 1,
0.3550443, -0.6851534, 3.398186, 1, 0, 0, 1, 1,
0.3556151, -0.5844352, 3.398912, 0, 0, 0, 1, 1,
0.3563199, -0.5086108, 3.003568, 0, 0, 0, 1, 1,
0.3564671, 0.2754204, 1.774153, 0, 0, 0, 1, 1,
0.3595243, -0.33922, 1.672996, 0, 0, 0, 1, 1,
0.3655962, -2.523387, 0.29883, 0, 0, 0, 1, 1,
0.3662521, 0.4040744, 2.870818, 0, 0, 0, 1, 1,
0.3741448, -0.3151833, 2.291653, 0, 0, 0, 1, 1,
0.3746811, 1.169132, 1.438933, 1, 1, 1, 1, 1,
0.3755398, 0.1622088, -0.894409, 1, 1, 1, 1, 1,
0.3796997, 1.439671, 0.9739278, 1, 1, 1, 1, 1,
0.3806222, 0.5793608, 1.630078, 1, 1, 1, 1, 1,
0.3810644, -1.113545, 2.285963, 1, 1, 1, 1, 1,
0.388716, -2.459219, 3.904733, 1, 1, 1, 1, 1,
0.3896325, -0.8964111, 2.114079, 1, 1, 1, 1, 1,
0.3902532, -1.476445, 3.155668, 1, 1, 1, 1, 1,
0.3928376, 0.9686105, 1.305197, 1, 1, 1, 1, 1,
0.3956503, -0.6389711, 0.6378855, 1, 1, 1, 1, 1,
0.3966973, 2.16248, 0.108416, 1, 1, 1, 1, 1,
0.4015484, -0.999207, 3.371551, 1, 1, 1, 1, 1,
0.4045443, -0.4418702, 1.235832, 1, 1, 1, 1, 1,
0.4062617, 0.2415027, -0.1556857, 1, 1, 1, 1, 1,
0.4084151, 0.4147375, 0.230789, 1, 1, 1, 1, 1,
0.4084635, -1.097262, 2.799108, 0, 0, 1, 1, 1,
0.4090295, 1.112403, 0.07283665, 1, 0, 0, 1, 1,
0.410656, 0.4170703, -0.1152041, 1, 0, 0, 1, 1,
0.4132097, 0.9443718, 0.4542603, 1, 0, 0, 1, 1,
0.4161754, -0.6027295, 0.5879762, 1, 0, 0, 1, 1,
0.4164156, 1.260516, 0.9192694, 1, 0, 0, 1, 1,
0.4169017, -1.10588, 4.224619, 0, 0, 0, 1, 1,
0.4186619, 0.8501834, -1.119896, 0, 0, 0, 1, 1,
0.424021, -0.4829698, 2.80287, 0, 0, 0, 1, 1,
0.4255461, -0.9155658, 2.484201, 0, 0, 0, 1, 1,
0.428853, 1.621526, 2.208244, 0, 0, 0, 1, 1,
0.4319439, -0.6765506, 2.47031, 0, 0, 0, 1, 1,
0.4320235, 0.4242649, 1.011004, 0, 0, 0, 1, 1,
0.4336737, 1.391953, -2.320574, 1, 1, 1, 1, 1,
0.4407439, -1.3218, 1.470926, 1, 1, 1, 1, 1,
0.441422, 1.329816, -0.8507515, 1, 1, 1, 1, 1,
0.4497719, -0.6034345, 2.843323, 1, 1, 1, 1, 1,
0.4555967, 0.2746704, 1.350155, 1, 1, 1, 1, 1,
0.4601744, 0.4297184, 1.159311, 1, 1, 1, 1, 1,
0.4632015, 1.18514, -0.3606547, 1, 1, 1, 1, 1,
0.4635697, 0.2469434, 0.7782906, 1, 1, 1, 1, 1,
0.4642937, -0.07866401, 1.08097, 1, 1, 1, 1, 1,
0.4643945, 0.9874688, 0.3261864, 1, 1, 1, 1, 1,
0.4709694, -1.892754, 1.846929, 1, 1, 1, 1, 1,
0.4739595, 0.5099148, 0.3543479, 1, 1, 1, 1, 1,
0.4747063, -0.2063444, 3.140958, 1, 1, 1, 1, 1,
0.4779092, -0.4096246, 1.446849, 1, 1, 1, 1, 1,
0.4826016, -1.073757, 2.226835, 1, 1, 1, 1, 1,
0.4837404, -1.623193, 1.579048, 0, 0, 1, 1, 1,
0.4851453, -0.6570953, 1.008151, 1, 0, 0, 1, 1,
0.4896238, -0.731632, 2.734309, 1, 0, 0, 1, 1,
0.490369, 0.6734803, 2.11177, 1, 0, 0, 1, 1,
0.4908264, 0.1746216, 2.056335, 1, 0, 0, 1, 1,
0.4989915, 0.6243458, 1.846175, 1, 0, 0, 1, 1,
0.4998968, 0.4630194, -0.7408212, 0, 0, 0, 1, 1,
0.5000387, 1.024391, -0.1109632, 0, 0, 0, 1, 1,
0.5023974, -0.4261418, 3.955648, 0, 0, 0, 1, 1,
0.5037945, 0.1211611, 1.110174, 0, 0, 0, 1, 1,
0.5038983, -0.5980132, 0.630574, 0, 0, 0, 1, 1,
0.5041764, 1.462207, -0.2745884, 0, 0, 0, 1, 1,
0.505046, 0.2148552, 0.3786784, 0, 0, 0, 1, 1,
0.50918, -0.2590321, 2.61732, 1, 1, 1, 1, 1,
0.5114851, 1.297229, -0.8110706, 1, 1, 1, 1, 1,
0.5116953, -0.8618833, 1.751041, 1, 1, 1, 1, 1,
0.5132761, -0.6220255, 3.717937, 1, 1, 1, 1, 1,
0.5180184, 0.5938951, -0.47348, 1, 1, 1, 1, 1,
0.5206994, -1.213993, 2.573886, 1, 1, 1, 1, 1,
0.5233777, -0.6388119, 1.496571, 1, 1, 1, 1, 1,
0.5277124, 1.245667, 1.257684, 1, 1, 1, 1, 1,
0.528925, 0.7162276, 1.167962, 1, 1, 1, 1, 1,
0.5302791, -2.335506, 3.122309, 1, 1, 1, 1, 1,
0.5349087, 0.5565062, -0.5060754, 1, 1, 1, 1, 1,
0.5352069, -0.5505848, 1.856907, 1, 1, 1, 1, 1,
0.5364874, 0.004587896, 2.876435, 1, 1, 1, 1, 1,
0.5392407, 1.163523, 0.4002518, 1, 1, 1, 1, 1,
0.5411009, -1.344889, 2.992887, 1, 1, 1, 1, 1,
0.5425906, -0.8809255, 0.9553261, 0, 0, 1, 1, 1,
0.5440424, 0.5569847, -1.663995, 1, 0, 0, 1, 1,
0.5493445, -0.2062752, 3.92582, 1, 0, 0, 1, 1,
0.5510259, 0.03416892, 1.592131, 1, 0, 0, 1, 1,
0.5540662, 0.9598715, 0.3535155, 1, 0, 0, 1, 1,
0.561767, -0.1318866, 2.539286, 1, 0, 0, 1, 1,
0.5625798, -1.839517, 3.855082, 0, 0, 0, 1, 1,
0.5629029, -0.2055466, 1.664531, 0, 0, 0, 1, 1,
0.5683456, 0.1371993, 1.070994, 0, 0, 0, 1, 1,
0.568449, 0.8336037, 1.767122, 0, 0, 0, 1, 1,
0.5716864, 0.006348344, 1.278075, 0, 0, 0, 1, 1,
0.5755334, 0.2538215, 2.445807, 0, 0, 0, 1, 1,
0.5777535, 0.2901406, 0.1641026, 0, 0, 0, 1, 1,
0.580418, 0.4960361, 1.110672, 1, 1, 1, 1, 1,
0.5807183, 0.6129155, 0.9180389, 1, 1, 1, 1, 1,
0.583029, 0.3602752, 1.297803, 1, 1, 1, 1, 1,
0.5842929, 1.871537, -0.5680878, 1, 1, 1, 1, 1,
0.5855598, 0.5019764, -1.001585, 1, 1, 1, 1, 1,
0.5861157, 0.7021794, 1.168887, 1, 1, 1, 1, 1,
0.5923927, 0.1564436, 2.470912, 1, 1, 1, 1, 1,
0.5963461, 1.192599, 1.690346, 1, 1, 1, 1, 1,
0.6022045, 2.085719, 0.2647604, 1, 1, 1, 1, 1,
0.6127092, 1.356021, 1.164829, 1, 1, 1, 1, 1,
0.6166601, -0.4851519, 1.416104, 1, 1, 1, 1, 1,
0.6234583, -0.8760641, 2.634091, 1, 1, 1, 1, 1,
0.6245754, -0.108203, 3.128647, 1, 1, 1, 1, 1,
0.6313788, -0.7060993, 2.204751, 1, 1, 1, 1, 1,
0.6314302, 0.8630185, 0.1282315, 1, 1, 1, 1, 1,
0.6325368, 0.3715042, 1.728826, 0, 0, 1, 1, 1,
0.6335388, -1.245751, 2.88237, 1, 0, 0, 1, 1,
0.6340987, -2.133068, 2.26369, 1, 0, 0, 1, 1,
0.6371931, 0.6359944, 0.3089103, 1, 0, 0, 1, 1,
0.6387438, 1.561315, -0.3721911, 1, 0, 0, 1, 1,
0.6396813, -0.2322088, 1.561819, 1, 0, 0, 1, 1,
0.6417854, -0.4637491, 3.783856, 0, 0, 0, 1, 1,
0.641875, 0.6008232, 0.9235017, 0, 0, 0, 1, 1,
0.6475592, 0.3887682, 1.919912, 0, 0, 0, 1, 1,
0.6540725, -0.4710248, 1.873344, 0, 0, 0, 1, 1,
0.6546302, -0.8233033, 4.193174, 0, 0, 0, 1, 1,
0.6575697, 0.3034164, 0.2395572, 0, 0, 0, 1, 1,
0.6582496, -0.01241841, 1.868843, 0, 0, 0, 1, 1,
0.6599431, 1.540478, -0.2335633, 1, 1, 1, 1, 1,
0.6638363, -1.42856, 2.380242, 1, 1, 1, 1, 1,
0.663872, -0.7944034, 2.032099, 1, 1, 1, 1, 1,
0.6643795, -1.230863, 1.563838, 1, 1, 1, 1, 1,
0.6712747, 0.8230122, 1.131314, 1, 1, 1, 1, 1,
0.6724964, -2.087371, 3.889278, 1, 1, 1, 1, 1,
0.6731623, -2.041595, 3.125005, 1, 1, 1, 1, 1,
0.6766204, -1.153977, 4.445676, 1, 1, 1, 1, 1,
0.6787314, 1.147864, 0.996043, 1, 1, 1, 1, 1,
0.6819035, 1.36201, -0.493723, 1, 1, 1, 1, 1,
0.6833254, -0.5317857, 2.924728, 1, 1, 1, 1, 1,
0.685091, 1.657048, 0.8752125, 1, 1, 1, 1, 1,
0.6872039, 1.359946, 0.397013, 1, 1, 1, 1, 1,
0.6936072, -0.2703025, 1.621906, 1, 1, 1, 1, 1,
0.6959729, 0.140702, -0.623123, 1, 1, 1, 1, 1,
0.6998527, 0.3148002, 1.365829, 0, 0, 1, 1, 1,
0.7017633, -0.1916684, 1.231051, 1, 0, 0, 1, 1,
0.7091761, 0.4777637, 0.2288306, 1, 0, 0, 1, 1,
0.7121696, -0.06647873, -0.7969657, 1, 0, 0, 1, 1,
0.7190135, 1.023441, 0.2090878, 1, 0, 0, 1, 1,
0.7203847, 0.07928212, 3.436454, 1, 0, 0, 1, 1,
0.721729, -0.6663823, 3.422877, 0, 0, 0, 1, 1,
0.7312953, 1.389706, 0.7876291, 0, 0, 0, 1, 1,
0.7327593, -0.231325, 2.265669, 0, 0, 0, 1, 1,
0.7366856, 0.4614185, -0.4520117, 0, 0, 0, 1, 1,
0.7368174, -1.694089, 3.14883, 0, 0, 0, 1, 1,
0.7385994, 0.3672721, -1.717293, 0, 0, 0, 1, 1,
0.7423211, 0.276597, 2.883066, 0, 0, 0, 1, 1,
0.7424643, -0.5384053, 1.796892, 1, 1, 1, 1, 1,
0.7482163, 3.118082, 0.2654364, 1, 1, 1, 1, 1,
0.7482997, -0.5615968, 2.488073, 1, 1, 1, 1, 1,
0.756123, 0.2050157, 1.91864, 1, 1, 1, 1, 1,
0.7644899, 0.4194349, 0.2808398, 1, 1, 1, 1, 1,
0.7715034, 0.1869671, 1.548546, 1, 1, 1, 1, 1,
0.7737688, -0.2725896, 1.508088, 1, 1, 1, 1, 1,
0.7763215, -0.5195599, 2.219306, 1, 1, 1, 1, 1,
0.7785861, 1.464647, -1.325538, 1, 1, 1, 1, 1,
0.7802441, -0.8733954, 1.473027, 1, 1, 1, 1, 1,
0.7889275, -1.816092, 3.600254, 1, 1, 1, 1, 1,
0.7997926, 0.02964105, 2.856101, 1, 1, 1, 1, 1,
0.8011996, -1.852021, 2.88971, 1, 1, 1, 1, 1,
0.8017046, 2.144773, -0.3274492, 1, 1, 1, 1, 1,
0.8034648, -1.039251, 3.051953, 1, 1, 1, 1, 1,
0.8057243, 1.358477, -0.03508997, 0, 0, 1, 1, 1,
0.8088347, 0.4130795, 2.590966, 1, 0, 0, 1, 1,
0.8098826, 0.6709595, 2.287525, 1, 0, 0, 1, 1,
0.8108714, -0.4358938, 2.349827, 1, 0, 0, 1, 1,
0.8123193, 0.9477897, 1.306189, 1, 0, 0, 1, 1,
0.8138804, 0.4938257, 1.666335, 1, 0, 0, 1, 1,
0.8153183, -0.9295053, 2.728587, 0, 0, 0, 1, 1,
0.815615, 0.5935329, -0.6492487, 0, 0, 0, 1, 1,
0.8160192, 0.1526186, 2.995712, 0, 0, 0, 1, 1,
0.8200657, -2.174191, 3.133297, 0, 0, 0, 1, 1,
0.8241214, 1.603152, -0.2450594, 0, 0, 0, 1, 1,
0.8309099, 1.431218, 1.916015, 0, 0, 0, 1, 1,
0.8323637, 0.2023282, 1.985166, 0, 0, 0, 1, 1,
0.8366369, 1.12587, 0.621236, 1, 1, 1, 1, 1,
0.8397489, -1.357015, 1.198913, 1, 1, 1, 1, 1,
0.848557, 2.113307, -1.152652, 1, 1, 1, 1, 1,
0.8517296, -1.118891, 3.330431, 1, 1, 1, 1, 1,
0.8542245, 1.115524, -1.218622, 1, 1, 1, 1, 1,
0.8586372, -0.2021589, 1.407237, 1, 1, 1, 1, 1,
0.8622764, -0.684132, 2.972772, 1, 1, 1, 1, 1,
0.8649384, 0.5301694, 0.7794499, 1, 1, 1, 1, 1,
0.8723952, 0.2112886, 1.905071, 1, 1, 1, 1, 1,
0.8733914, -1.095385, 0.9436121, 1, 1, 1, 1, 1,
0.8899555, 0.6028248, 2.124717, 1, 1, 1, 1, 1,
0.8912442, -1.311968, 3.660203, 1, 1, 1, 1, 1,
0.8927481, 1.277292, 0.0613392, 1, 1, 1, 1, 1,
0.894062, 0.4760188, 0.7623263, 1, 1, 1, 1, 1,
0.8962789, 0.4317945, 0.5647154, 1, 1, 1, 1, 1,
0.9036641, 1.054311, 0.3959837, 0, 0, 1, 1, 1,
0.9062892, 0.01208485, -0.09490761, 1, 0, 0, 1, 1,
0.9066697, -0.3548793, 2.367736, 1, 0, 0, 1, 1,
0.9081254, 0.8759035, 0.4308874, 1, 0, 0, 1, 1,
0.911249, 0.0211674, -0.6145208, 1, 0, 0, 1, 1,
0.9112673, -0.4052983, 2.036854, 1, 0, 0, 1, 1,
0.9122096, -1.376259, 2.646151, 0, 0, 0, 1, 1,
0.9161893, 0.03099189, -0.8199151, 0, 0, 0, 1, 1,
0.9186644, -0.8000429, 2.795715, 0, 0, 0, 1, 1,
0.9309314, -1.322275, 2.758954, 0, 0, 0, 1, 1,
0.9319829, 1.218426, -1.407523, 0, 0, 0, 1, 1,
0.9406527, -0.6807854, 2.62673, 0, 0, 0, 1, 1,
0.9447688, 1.26392, -0.1216175, 0, 0, 0, 1, 1,
0.9460497, -0.9084666, 1.608402, 1, 1, 1, 1, 1,
0.9543803, -0.5597817, 2.48113, 1, 1, 1, 1, 1,
0.9676392, -0.3425912, 0.6672499, 1, 1, 1, 1, 1,
0.9683754, 0.7196611, 0.5289924, 1, 1, 1, 1, 1,
0.9689406, 1.427248, -1.698652, 1, 1, 1, 1, 1,
0.972617, 0.247389, 1.182351, 1, 1, 1, 1, 1,
0.9748573, 1.70799, -0.8227586, 1, 1, 1, 1, 1,
0.9800267, 1.107141, 2.250914, 1, 1, 1, 1, 1,
0.9815502, -0.4716292, 3.71662, 1, 1, 1, 1, 1,
0.9944509, -0.01223318, 0.9414343, 1, 1, 1, 1, 1,
0.9946856, -0.1684127, 2.392992, 1, 1, 1, 1, 1,
1.004187, -0.1021606, 1.490288, 1, 1, 1, 1, 1,
1.005555, -1.322433, 3.055562, 1, 1, 1, 1, 1,
1.007062, -0.9424579, 1.676735, 1, 1, 1, 1, 1,
1.007753, -1.356053, 2.577229, 1, 1, 1, 1, 1,
1.010842, -1.160794, 3.177764, 0, 0, 1, 1, 1,
1.019268, -1.52062, 0.7235274, 1, 0, 0, 1, 1,
1.022722, 1.77655, -0.3287263, 1, 0, 0, 1, 1,
1.0334, 0.1484289, 0.1779724, 1, 0, 0, 1, 1,
1.037066, 0.116054, 0.5491835, 1, 0, 0, 1, 1,
1.043273, -0.3755793, 1.758403, 1, 0, 0, 1, 1,
1.053075, -1.174413, 2.175285, 0, 0, 0, 1, 1,
1.055067, 0.4871889, 0.06243394, 0, 0, 0, 1, 1,
1.055076, -0.4970542, 3.201101, 0, 0, 0, 1, 1,
1.064524, -0.1217601, 0.2700893, 0, 0, 0, 1, 1,
1.070903, 0.7257987, 1.774944, 0, 0, 0, 1, 1,
1.077829, -0.3009244, 3.067893, 0, 0, 0, 1, 1,
1.079689, -1.325975, 2.942387, 0, 0, 0, 1, 1,
1.081708, 0.901792, 0.74733, 1, 1, 1, 1, 1,
1.083227, 0.7078367, 1.132621, 1, 1, 1, 1, 1,
1.09371, 0.2485494, 0.8293516, 1, 1, 1, 1, 1,
1.095436, -1.462626, 2.093333, 1, 1, 1, 1, 1,
1.111638, -0.8491278, 0.6453315, 1, 1, 1, 1, 1,
1.115689, -1.3434, 2.529017, 1, 1, 1, 1, 1,
1.121413, 0.4337427, -0.8605615, 1, 1, 1, 1, 1,
1.137793, -0.5248223, 2.669378, 1, 1, 1, 1, 1,
1.146784, 0.9775882, 2.451642, 1, 1, 1, 1, 1,
1.15265, -0.9804797, 1.875105, 1, 1, 1, 1, 1,
1.164291, -0.3058468, 1.163578, 1, 1, 1, 1, 1,
1.168748, -1.337085, 1.743701, 1, 1, 1, 1, 1,
1.171692, -0.01525614, 2.143691, 1, 1, 1, 1, 1,
1.1754, 0.08304646, 0.1787771, 1, 1, 1, 1, 1,
1.175857, -0.5692788, 2.591435, 1, 1, 1, 1, 1,
1.179879, -0.1397183, 2.871267, 0, 0, 1, 1, 1,
1.188745, 1.094394, 1.064277, 1, 0, 0, 1, 1,
1.193816, -1.781785, 0.8078762, 1, 0, 0, 1, 1,
1.204005, -0.7003236, -0.4031348, 1, 0, 0, 1, 1,
1.207789, 0.6176282, 7.988641e-05, 1, 0, 0, 1, 1,
1.208245, 1.314074, 0.5804257, 1, 0, 0, 1, 1,
1.208557, 1.384195, 0.2308948, 0, 0, 0, 1, 1,
1.209738, 1.122707, 1.948038, 0, 0, 0, 1, 1,
1.212761, 0.09211097, 1.078353, 0, 0, 0, 1, 1,
1.215801, 0.8268514, 0.7583196, 0, 0, 0, 1, 1,
1.235068, 0.644258, 0.7060381, 0, 0, 0, 1, 1,
1.23613, 1.523551, 0.2998958, 0, 0, 0, 1, 1,
1.24176, 1.963773, 0.001809093, 0, 0, 0, 1, 1,
1.261505, 0.2777599, 1.111092, 1, 1, 1, 1, 1,
1.26606, -1.191486, 1.432083, 1, 1, 1, 1, 1,
1.270538, 1.272779, 1.945288, 1, 1, 1, 1, 1,
1.273126, -1.041375, 2.038355, 1, 1, 1, 1, 1,
1.283382, -0.3174506, 1.591318, 1, 1, 1, 1, 1,
1.290616, -0.8878029, 1.793876, 1, 1, 1, 1, 1,
1.294421, -0.4697362, 2.177046, 1, 1, 1, 1, 1,
1.29693, 1.90156, 2.255553, 1, 1, 1, 1, 1,
1.313097, -1.158525, 1.700599, 1, 1, 1, 1, 1,
1.314387, 1.18868, 1.080709, 1, 1, 1, 1, 1,
1.320742, -1.055066, 0.9053604, 1, 1, 1, 1, 1,
1.333773, 0.1501213, 0.8710582, 1, 1, 1, 1, 1,
1.344877, 1.345788, 0.9855528, 1, 1, 1, 1, 1,
1.354101, -0.1523043, 0.9906889, 1, 1, 1, 1, 1,
1.355896, -0.5017029, 3.225674, 1, 1, 1, 1, 1,
1.362346, 1.14961, -0.5008606, 0, 0, 1, 1, 1,
1.362511, 1.224415, 2.774653, 1, 0, 0, 1, 1,
1.36474, 0.6611145, 1.049166, 1, 0, 0, 1, 1,
1.371239, -0.7473441, 3.191424, 1, 0, 0, 1, 1,
1.371667, -0.1587953, 1.22521, 1, 0, 0, 1, 1,
1.376035, 0.9716719, 1.412601, 1, 0, 0, 1, 1,
1.383189, -0.07311264, 2.068758, 0, 0, 0, 1, 1,
1.396017, -1.102488, 1.834652, 0, 0, 0, 1, 1,
1.397591, -0.004170215, 1.42862, 0, 0, 0, 1, 1,
1.400999, 0.3709739, 0.7429107, 0, 0, 0, 1, 1,
1.404266, -0.7268425, 1.448099, 0, 0, 0, 1, 1,
1.415365, -0.2063141, 2.62401, 0, 0, 0, 1, 1,
1.425515, -1.331669, 3.674902, 0, 0, 0, 1, 1,
1.432783, -1.563254, 1.887615, 1, 1, 1, 1, 1,
1.437901, -0.7562628, 1.703099, 1, 1, 1, 1, 1,
1.439648, 0.2590572, 1.442518, 1, 1, 1, 1, 1,
1.443639, 0.5137166, 1.745831, 1, 1, 1, 1, 1,
1.446398, 0.9417585, 2.539112, 1, 1, 1, 1, 1,
1.453062, 0.5504281, 0.764783, 1, 1, 1, 1, 1,
1.457673, -0.008464196, 0.9698831, 1, 1, 1, 1, 1,
1.481203, 0.2701446, 1.881486, 1, 1, 1, 1, 1,
1.483809, 1.324364, 1.4594, 1, 1, 1, 1, 1,
1.493413, -0.924575, 2.021467, 1, 1, 1, 1, 1,
1.49511, -0.6479026, 2.670634, 1, 1, 1, 1, 1,
1.500436, 0.8434824, 0.4217362, 1, 1, 1, 1, 1,
1.501906, -0.6374182, 3.73958, 1, 1, 1, 1, 1,
1.504594, 0.9476755, 1.473251, 1, 1, 1, 1, 1,
1.5213, 0.06533157, -0.01396531, 1, 1, 1, 1, 1,
1.525164, 0.5054356, 1.752024, 0, 0, 1, 1, 1,
1.52882, 1.373966, 2.076845, 1, 0, 0, 1, 1,
1.539938, -0.4815243, 0.1494868, 1, 0, 0, 1, 1,
1.543733, 1.31787, 1.284729, 1, 0, 0, 1, 1,
1.56237, 0.07655451, 1.541992, 1, 0, 0, 1, 1,
1.565557, -0.5528442, -0.325604, 1, 0, 0, 1, 1,
1.573538, -2.135635, 2.687033, 0, 0, 0, 1, 1,
1.573613, -0.4839442, 2.995877, 0, 0, 0, 1, 1,
1.589654, 2.106628, 0.9466542, 0, 0, 0, 1, 1,
1.602436, -0.5675904, 3.437366, 0, 0, 0, 1, 1,
1.604671, 0.5542449, 1.752733, 0, 0, 0, 1, 1,
1.605283, 0.7521918, 0.533274, 0, 0, 0, 1, 1,
1.613649, -0.688047, 2.156487, 0, 0, 0, 1, 1,
1.635185, 0.7614459, -1.023053, 1, 1, 1, 1, 1,
1.64702, 0.7874448, 0.995735, 1, 1, 1, 1, 1,
1.64801, 0.6447883, 0.81024, 1, 1, 1, 1, 1,
1.661613, 0.4650731, 0.4411553, 1, 1, 1, 1, 1,
1.669775, -0.03365204, 1.564923, 1, 1, 1, 1, 1,
1.670171, -0.1657114, 3.86202, 1, 1, 1, 1, 1,
1.670574, -0.4888462, 0.88854, 1, 1, 1, 1, 1,
1.67366, 0.8394541, 0.8077291, 1, 1, 1, 1, 1,
1.676033, -0.4430212, 0.4465763, 1, 1, 1, 1, 1,
1.691865, 0.9618692, 1.076118, 1, 1, 1, 1, 1,
1.707741, -0.1223934, 2.280584, 1, 1, 1, 1, 1,
1.719202, -0.4161521, 1.893439, 1, 1, 1, 1, 1,
1.719814, -2.333463, 4.31442, 1, 1, 1, 1, 1,
1.72306, 1.006, -0.0204049, 1, 1, 1, 1, 1,
1.72557, -0.8788422, 1.420936, 1, 1, 1, 1, 1,
1.728926, -1.221397, -1.343417, 0, 0, 1, 1, 1,
1.746458, 1.033995, 1.317311, 1, 0, 0, 1, 1,
1.766726, 0.6652461, 1.439211, 1, 0, 0, 1, 1,
1.768016, 0.5098884, 3.390381, 1, 0, 0, 1, 1,
1.768042, 1.243722, -0.1931943, 1, 0, 0, 1, 1,
1.779482, 0.940672, 1.135532, 1, 0, 0, 1, 1,
1.790536, 0.9246219, 1.337596, 0, 0, 0, 1, 1,
1.801067, 1.033318, 2.079149, 0, 0, 0, 1, 1,
1.803642, -1.497367, 1.457166, 0, 0, 0, 1, 1,
1.811177, 2.082753, 1.165709, 0, 0, 0, 1, 1,
1.81389, 0.4191301, 1.303914, 0, 0, 0, 1, 1,
1.826129, -0.3560094, 2.120705, 0, 0, 0, 1, 1,
1.83154, -0.765972, 1.525145, 0, 0, 0, 1, 1,
1.838213, 0.2952337, 3.079445, 1, 1, 1, 1, 1,
1.847363, 2.006419, 1.76362, 1, 1, 1, 1, 1,
1.89144, 1.10622, 2.305058, 1, 1, 1, 1, 1,
1.898149, 0.1780768, 1.047113, 1, 1, 1, 1, 1,
1.900532, -0.9491426, 3.048374, 1, 1, 1, 1, 1,
1.928273, -1.552056, 3.261274, 1, 1, 1, 1, 1,
1.938724, 0.4792945, 2.599355, 1, 1, 1, 1, 1,
1.94345, -0.02229668, 1.42122, 1, 1, 1, 1, 1,
1.96352, -0.04750215, 1.184045, 1, 1, 1, 1, 1,
1.97444, -1.847374, 2.263966, 1, 1, 1, 1, 1,
1.999494, -0.0237646, 1.392879, 1, 1, 1, 1, 1,
2.017535, 0.5827078, 0.1728913, 1, 1, 1, 1, 1,
2.046424, 1.799345, -0.1835529, 1, 1, 1, 1, 1,
2.053611, -0.7519286, 1.372092, 1, 1, 1, 1, 1,
2.060635, -0.7608823, 3.964319, 1, 1, 1, 1, 1,
2.068907, 0.5002833, 1.273137, 0, 0, 1, 1, 1,
2.072327, 0.1979118, 2.104412, 1, 0, 0, 1, 1,
2.080853, 0.8767167, 0.6579806, 1, 0, 0, 1, 1,
2.085881, -0.6950689, 1.475721, 1, 0, 0, 1, 1,
2.107152, -0.1736063, 0.6812808, 1, 0, 0, 1, 1,
2.257663, -0.1941336, 1.799134, 1, 0, 0, 1, 1,
2.261889, 0.8377764, 1.796931, 0, 0, 0, 1, 1,
2.306715, 0.5339909, 1.02026, 0, 0, 0, 1, 1,
2.319997, -0.6078403, 1.81762, 0, 0, 0, 1, 1,
2.346127, 0.2432123, 0.01557781, 0, 0, 0, 1, 1,
2.394663, -0.4416202, 2.227709, 0, 0, 0, 1, 1,
2.427043, -0.7777108, 2.462946, 0, 0, 0, 1, 1,
2.450081, -1.439656, 2.761108, 0, 0, 0, 1, 1,
2.451257, 0.6524489, 1.99787, 1, 1, 1, 1, 1,
2.491064, -0.6558707, 3.121589, 1, 1, 1, 1, 1,
2.705188, 1.196173, 0.004860013, 1, 1, 1, 1, 1,
2.834307, 1.207799, 2.034267, 1, 1, 1, 1, 1,
2.866005, 0.09021914, 1.642716, 1, 1, 1, 1, 1,
2.997204, 1.051633, 1.319308, 1, 1, 1, 1, 1,
3.108788, 0.4696437, 2.79203, 1, 1, 1, 1, 1
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
var radius = 9.612231;
var distance = 33.76255;
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
mvMatrix.translate( 0.09804344, -0.2346903, 0.5370975 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76255);
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
