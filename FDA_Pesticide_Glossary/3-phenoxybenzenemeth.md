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
-3.202743, 0.9909413, -1.758311, 1, 0, 0, 1,
-3.108981, 0.5821696, -1.990357, 1, 0.007843138, 0, 1,
-2.782852, 1.988784, -1.273923, 1, 0.01176471, 0, 1,
-2.679295, 0.5117882, -2.648961, 1, 0.01960784, 0, 1,
-2.599495, -0.6423125, -0.4291, 1, 0.02352941, 0, 1,
-2.544239, -0.3220408, -1.109017, 1, 0.03137255, 0, 1,
-2.469851, 0.8332298, -1.237201, 1, 0.03529412, 0, 1,
-2.370509, -0.169981, -1.499177, 1, 0.04313726, 0, 1,
-2.326044, -0.08983262, -1.519732, 1, 0.04705882, 0, 1,
-2.263704, -1.175569, -1.244926, 1, 0.05490196, 0, 1,
-2.243026, -0.9117627, -1.518432, 1, 0.05882353, 0, 1,
-2.224779, 0.457627, -1.963597, 1, 0.06666667, 0, 1,
-2.161909, -0.8281358, 0.5857501, 1, 0.07058824, 0, 1,
-2.149233, 0.5507298, -0.8784013, 1, 0.07843138, 0, 1,
-2.100507, 0.8095075, -2.94294, 1, 0.08235294, 0, 1,
-2.100442, 1.033514, -2.732271, 1, 0.09019608, 0, 1,
-2.098897, -0.3245479, -1.014703, 1, 0.09411765, 0, 1,
-2.098867, 1.91077, -0.6076086, 1, 0.1019608, 0, 1,
-2.070338, -0.8010035, -2.491147, 1, 0.1098039, 0, 1,
-2.00357, -1.625902, -0.9082135, 1, 0.1137255, 0, 1,
-1.989492, 0.2354731, -1.80093, 1, 0.1215686, 0, 1,
-1.970388, -0.2338505, -2.268715, 1, 0.1254902, 0, 1,
-1.967085, 1.02124, 1.673223, 1, 0.1333333, 0, 1,
-1.96465, 0.8795825, -2.044346, 1, 0.1372549, 0, 1,
-1.944938, -1.256437, -2.67607, 1, 0.145098, 0, 1,
-1.942299, -1.317263, -1.734045, 1, 0.1490196, 0, 1,
-1.937724, 0.8126675, 0.186742, 1, 0.1568628, 0, 1,
-1.911339, 1.233912, -2.196216, 1, 0.1607843, 0, 1,
-1.901618, -0.7807555, -0.5227681, 1, 0.1686275, 0, 1,
-1.900884, -1.682206, -3.403527, 1, 0.172549, 0, 1,
-1.891536, 1.209588, 0.6453552, 1, 0.1803922, 0, 1,
-1.861092, 0.6415287, -2.373413, 1, 0.1843137, 0, 1,
-1.834289, 0.2119871, -3.371344, 1, 0.1921569, 0, 1,
-1.833404, -0.4230272, -0.8508698, 1, 0.1960784, 0, 1,
-1.832675, -0.4141242, -4.061099, 1, 0.2039216, 0, 1,
-1.820932, -0.7925396, -1.106806, 1, 0.2117647, 0, 1,
-1.811713, -0.4175597, -1.155504, 1, 0.2156863, 0, 1,
-1.79737, -0.06185013, -0.8993217, 1, 0.2235294, 0, 1,
-1.790878, -0.2922435, -1.19637, 1, 0.227451, 0, 1,
-1.790582, 0.6181344, -1.214347, 1, 0.2352941, 0, 1,
-1.785596, 0.2071072, -2.402679, 1, 0.2392157, 0, 1,
-1.761029, 0.8225335, -0.8662288, 1, 0.2470588, 0, 1,
-1.753118, -0.8587533, -1.384596, 1, 0.2509804, 0, 1,
-1.746755, -3.662521, -2.560772, 1, 0.2588235, 0, 1,
-1.734306, 2.04968, -0.3940709, 1, 0.2627451, 0, 1,
-1.724819, -0.7021634, -1.580483, 1, 0.2705882, 0, 1,
-1.721371, -0.3160159, -1.770273, 1, 0.2745098, 0, 1,
-1.705433, -0.9890812, -2.022499, 1, 0.282353, 0, 1,
-1.696814, 0.2446542, -0.09080765, 1, 0.2862745, 0, 1,
-1.695242, 0.5533453, 1.000228, 1, 0.2941177, 0, 1,
-1.679887, -0.7643027, -0.967843, 1, 0.3019608, 0, 1,
-1.669269, -0.9018172, -1.792104, 1, 0.3058824, 0, 1,
-1.662724, -2.266191, -4.445388, 1, 0.3137255, 0, 1,
-1.657562, 0.1323066, -3.710696, 1, 0.3176471, 0, 1,
-1.656766, 2.491098, -1.892465, 1, 0.3254902, 0, 1,
-1.64861, -0.6529043, -0.8696541, 1, 0.3294118, 0, 1,
-1.647084, 0.1806629, -1.143662, 1, 0.3372549, 0, 1,
-1.644999, -1.293394, -1.412233, 1, 0.3411765, 0, 1,
-1.64449, 0.3111717, -2.270994, 1, 0.3490196, 0, 1,
-1.643971, 1.007568, -1.74102, 1, 0.3529412, 0, 1,
-1.635046, 0.3473189, -3.216815, 1, 0.3607843, 0, 1,
-1.620753, 0.08795332, -0.9583443, 1, 0.3647059, 0, 1,
-1.603694, -1.435441, -1.759423, 1, 0.372549, 0, 1,
-1.596377, -0.4982, -0.8497627, 1, 0.3764706, 0, 1,
-1.593808, -1.435408, -2.052262, 1, 0.3843137, 0, 1,
-1.588423, 0.5633366, -1.447021, 1, 0.3882353, 0, 1,
-1.579622, 0.8132826, -3.118703, 1, 0.3960784, 0, 1,
-1.547485, -2.012898, -2.589228, 1, 0.4039216, 0, 1,
-1.543295, 1.881151, -0.2955761, 1, 0.4078431, 0, 1,
-1.540183, 0.9923414, 0.2573043, 1, 0.4156863, 0, 1,
-1.538736, 0.7653159, -2.392131, 1, 0.4196078, 0, 1,
-1.537554, 0.2647583, -0.365973, 1, 0.427451, 0, 1,
-1.529894, -0.6567606, -2.464153, 1, 0.4313726, 0, 1,
-1.490597, 1.020875, 0.1449975, 1, 0.4392157, 0, 1,
-1.489524, -0.6323391, -0.03021164, 1, 0.4431373, 0, 1,
-1.466426, 0.6452964, -1.007709, 1, 0.4509804, 0, 1,
-1.457668, -0.234669, -1.034777, 1, 0.454902, 0, 1,
-1.457424, 1.094093, -1.324979, 1, 0.4627451, 0, 1,
-1.457313, -0.7726964, -0.4627956, 1, 0.4666667, 0, 1,
-1.451441, -0.9098893, -3.123198, 1, 0.4745098, 0, 1,
-1.440563, -0.2998961, 1.296987, 1, 0.4784314, 0, 1,
-1.440491, -0.5597291, -1.640065, 1, 0.4862745, 0, 1,
-1.433764, 1.095781, -0.8054568, 1, 0.4901961, 0, 1,
-1.415967, 0.9469971, -0.1252491, 1, 0.4980392, 0, 1,
-1.41589, -0.0754789, -1.714147, 1, 0.5058824, 0, 1,
-1.404621, 0.5487617, -1.571923, 1, 0.509804, 0, 1,
-1.399292, 1.089455, -0.3325458, 1, 0.5176471, 0, 1,
-1.386564, -0.5176061, -2.407808, 1, 0.5215687, 0, 1,
-1.371439, -0.7569199, -1.413955, 1, 0.5294118, 0, 1,
-1.364519, -0.3542277, -1.695861, 1, 0.5333334, 0, 1,
-1.348205, -0.1829607, -1.88561, 1, 0.5411765, 0, 1,
-1.341027, 0.7839074, -0.5932328, 1, 0.5450981, 0, 1,
-1.331274, 0.9524479, -0.5371176, 1, 0.5529412, 0, 1,
-1.323362, -0.04598411, -0.3856772, 1, 0.5568628, 0, 1,
-1.321687, 0.1248375, -2.04248, 1, 0.5647059, 0, 1,
-1.31231, -0.4247314, -0.4122388, 1, 0.5686275, 0, 1,
-1.311933, 0.784347, -1.277454, 1, 0.5764706, 0, 1,
-1.30574, -0.5001806, -1.276612, 1, 0.5803922, 0, 1,
-1.302171, 0.5396637, -0.4770898, 1, 0.5882353, 0, 1,
-1.298033, 0.1121131, -3.172612, 1, 0.5921569, 0, 1,
-1.29735, -0.6475648, -2.729203, 1, 0.6, 0, 1,
-1.2897, 1.127069, -0.7090845, 1, 0.6078432, 0, 1,
-1.280178, 0.4881849, -0.7874261, 1, 0.6117647, 0, 1,
-1.262898, 1.193918, -0.2048969, 1, 0.6196079, 0, 1,
-1.262395, 2.26984, -0.9016815, 1, 0.6235294, 0, 1,
-1.261882, -0.03996298, -3.177728, 1, 0.6313726, 0, 1,
-1.261464, 0.08681004, -1.165744, 1, 0.6352941, 0, 1,
-1.260839, 1.906657, 0.06601879, 1, 0.6431373, 0, 1,
-1.256225, -1.630604, -0.8268415, 1, 0.6470588, 0, 1,
-1.247022, 0.8007445, -1.598562, 1, 0.654902, 0, 1,
-1.246913, -0.5130649, -1.679326, 1, 0.6588235, 0, 1,
-1.24285, 0.2773033, -1.355635, 1, 0.6666667, 0, 1,
-1.241585, 1.54864, -1.082428, 1, 0.6705883, 0, 1,
-1.240603, 0.8533487, -2.561437, 1, 0.6784314, 0, 1,
-1.239135, -0.4737172, -0.9830253, 1, 0.682353, 0, 1,
-1.231553, -0.9054479, -0.6599509, 1, 0.6901961, 0, 1,
-1.217909, -0.957571, -2.070214, 1, 0.6941177, 0, 1,
-1.210668, 0.7069053, 0.8505006, 1, 0.7019608, 0, 1,
-1.210214, 0.5335529, -0.4106123, 1, 0.7098039, 0, 1,
-1.20866, -0.7215627, -1.585935, 1, 0.7137255, 0, 1,
-1.208475, -0.3302978, -1.008176, 1, 0.7215686, 0, 1,
-1.201679, 1.894217, -0.4057917, 1, 0.7254902, 0, 1,
-1.199748, 0.238024, -2.27028, 1, 0.7333333, 0, 1,
-1.199281, -1.414454, -1.723212, 1, 0.7372549, 0, 1,
-1.197581, 0.2839062, 0.6294995, 1, 0.7450981, 0, 1,
-1.196155, -0.1620398, -1.444232, 1, 0.7490196, 0, 1,
-1.192675, 1.366595, -0.4881426, 1, 0.7568628, 0, 1,
-1.190052, -0.5199835, -1.685547, 1, 0.7607843, 0, 1,
-1.185579, 0.5322862, -0.4649019, 1, 0.7686275, 0, 1,
-1.177649, -0.772277, -2.852152, 1, 0.772549, 0, 1,
-1.175521, 0.02451866, -1.880267, 1, 0.7803922, 0, 1,
-1.167985, 0.2977698, -1.009325, 1, 0.7843137, 0, 1,
-1.16765, 0.2370146, -2.422171, 1, 0.7921569, 0, 1,
-1.16556, 0.01547075, -0.6584734, 1, 0.7960784, 0, 1,
-1.164214, 0.9187, -0.7786129, 1, 0.8039216, 0, 1,
-1.162585, -0.4818013, -1.903529, 1, 0.8117647, 0, 1,
-1.151629, -0.5981045, -3.976512, 1, 0.8156863, 0, 1,
-1.147706, 0.9423187, -0.1268346, 1, 0.8235294, 0, 1,
-1.142277, -1.180324, -3.020269, 1, 0.827451, 0, 1,
-1.136028, 0.3654986, -0.4250544, 1, 0.8352941, 0, 1,
-1.123042, 1.486867, -1.528795, 1, 0.8392157, 0, 1,
-1.118844, -0.007048107, -0.6008974, 1, 0.8470588, 0, 1,
-1.112157, -0.56319, -2.335377, 1, 0.8509804, 0, 1,
-1.106315, 0.07898534, -1.616933, 1, 0.8588235, 0, 1,
-1.102545, 0.3917549, -1.897942, 1, 0.8627451, 0, 1,
-1.096203, 1.522748, -0.3168859, 1, 0.8705882, 0, 1,
-1.093572, -1.162928, -3.630134, 1, 0.8745098, 0, 1,
-1.085852, 0.5745586, -0.5408719, 1, 0.8823529, 0, 1,
-1.085703, -0.5138578, -2.377208, 1, 0.8862745, 0, 1,
-1.085409, 1.526029, -1.64181, 1, 0.8941177, 0, 1,
-1.084776, 0.4608585, -1.995974, 1, 0.8980392, 0, 1,
-1.070966, 0.8695635, 0.1877145, 1, 0.9058824, 0, 1,
-1.070645, 1.437248, -0.4660518, 1, 0.9137255, 0, 1,
-1.065408, -0.2920328, -2.49468, 1, 0.9176471, 0, 1,
-1.0627, 0.2056071, -2.495339, 1, 0.9254902, 0, 1,
-1.055877, -3.877841, -3.054754, 1, 0.9294118, 0, 1,
-1.055257, 0.9976421, -1.665438, 1, 0.9372549, 0, 1,
-1.053826, -0.1857648, -2.341587, 1, 0.9411765, 0, 1,
-1.050658, 0.4584903, -1.086391, 1, 0.9490196, 0, 1,
-1.038262, -0.2811313, -2.347368, 1, 0.9529412, 0, 1,
-1.027372, 1.791109, -2.000016, 1, 0.9607843, 0, 1,
-1.025909, -0.1649159, -1.726977, 1, 0.9647059, 0, 1,
-1.018242, 0.626808, -2.123527, 1, 0.972549, 0, 1,
-1.012979, -0.8959129, -2.037483, 1, 0.9764706, 0, 1,
-1.005071, 0.6942118, -1.176405, 1, 0.9843137, 0, 1,
-1.000985, -2.024226, -0.4422272, 1, 0.9882353, 0, 1,
-0.9901819, 0.01566978, -1.17447, 1, 0.9960784, 0, 1,
-0.9869455, -0.5478627, -1.41387, 0.9960784, 1, 0, 1,
-0.9857059, -1.077076, -2.407537, 0.9921569, 1, 0, 1,
-0.9823245, 0.1723968, 0.05899164, 0.9843137, 1, 0, 1,
-0.9760931, 1.037361, 0.03531145, 0.9803922, 1, 0, 1,
-0.96274, -0.04264201, -4.524303, 0.972549, 1, 0, 1,
-0.9565167, 0.03808098, -1.01864, 0.9686275, 1, 0, 1,
-0.9505915, -1.344279, -1.692499, 0.9607843, 1, 0, 1,
-0.9501423, -0.1257006, -3.855549, 0.9568627, 1, 0, 1,
-0.9202763, 0.4452373, -0.8529166, 0.9490196, 1, 0, 1,
-0.9198902, 0.784244, -1.339771, 0.945098, 1, 0, 1,
-0.9087603, -0.3128071, -3.276782, 0.9372549, 1, 0, 1,
-0.9082128, -0.2630666, -1.882056, 0.9333333, 1, 0, 1,
-0.9026977, -0.4768652, -2.075483, 0.9254902, 1, 0, 1,
-0.9025611, -0.6206356, -1.919842, 0.9215686, 1, 0, 1,
-0.8962604, 0.9756884, 0.1165847, 0.9137255, 1, 0, 1,
-0.8960415, -2.319172, -2.550951, 0.9098039, 1, 0, 1,
-0.893971, -2.625037, -3.333697, 0.9019608, 1, 0, 1,
-0.8889271, 0.4491891, -2.390201, 0.8941177, 1, 0, 1,
-0.8856123, 0.6150691, -1.735089, 0.8901961, 1, 0, 1,
-0.8826122, 0.2333928, -1.846296, 0.8823529, 1, 0, 1,
-0.8821989, -1.851325, -2.346132, 0.8784314, 1, 0, 1,
-0.8746621, -1.070006, -4.07143, 0.8705882, 1, 0, 1,
-0.873549, -1.699064, -1.471178, 0.8666667, 1, 0, 1,
-0.8733816, 0.5680955, -1.089667, 0.8588235, 1, 0, 1,
-0.8676515, -0.4272484, -5.191454, 0.854902, 1, 0, 1,
-0.8675833, 0.3246088, -0.4743972, 0.8470588, 1, 0, 1,
-0.8668723, 2.472531, -1.0263, 0.8431373, 1, 0, 1,
-0.8641685, 0.07453651, -1.36629, 0.8352941, 1, 0, 1,
-0.8632952, 0.2077567, 1.501188, 0.8313726, 1, 0, 1,
-0.8622054, -0.4196289, -3.091843, 0.8235294, 1, 0, 1,
-0.8611665, -1.625238, -4.263587, 0.8196079, 1, 0, 1,
-0.8600878, 0.5545107, -1.871768, 0.8117647, 1, 0, 1,
-0.8586683, -0.6168909, -2.517097, 0.8078431, 1, 0, 1,
-0.8584093, -0.4006893, -1.617831, 0.8, 1, 0, 1,
-0.8577055, 0.3437768, -1.167838, 0.7921569, 1, 0, 1,
-0.8508981, -0.1241875, -0.7337781, 0.7882353, 1, 0, 1,
-0.8447605, -0.618443, -4.232491, 0.7803922, 1, 0, 1,
-0.8439844, 1.285188, -0.1649895, 0.7764706, 1, 0, 1,
-0.8436373, -0.237306, -1.965209, 0.7686275, 1, 0, 1,
-0.8426309, -0.03723947, -3.027323, 0.7647059, 1, 0, 1,
-0.8388377, -0.5168954, -1.969743, 0.7568628, 1, 0, 1,
-0.8347514, -0.2133019, -4.712993, 0.7529412, 1, 0, 1,
-0.8346849, -0.5428781, -1.440474, 0.7450981, 1, 0, 1,
-0.8331659, -0.6369292, -2.423563, 0.7411765, 1, 0, 1,
-0.8235269, 0.3714246, -2.342608, 0.7333333, 1, 0, 1,
-0.8178601, 0.5222733, -1.530478, 0.7294118, 1, 0, 1,
-0.8172493, 0.5310857, -2.665833, 0.7215686, 1, 0, 1,
-0.8171877, -0.2323087, -1.127498, 0.7176471, 1, 0, 1,
-0.8077757, 1.181849, -0.4606278, 0.7098039, 1, 0, 1,
-0.8032365, 0.8423121, -0.2406235, 0.7058824, 1, 0, 1,
-0.8030135, -1.637524, -1.900278, 0.6980392, 1, 0, 1,
-0.79963, 1.751287, -0.1614839, 0.6901961, 1, 0, 1,
-0.7993674, 2.003256, -2.65482, 0.6862745, 1, 0, 1,
-0.7977511, -0.09125012, -0.8854348, 0.6784314, 1, 0, 1,
-0.7948618, 0.2923033, -0.1596042, 0.6745098, 1, 0, 1,
-0.788316, -0.1102743, -0.7616903, 0.6666667, 1, 0, 1,
-0.7882453, 1.05878, -0.4452719, 0.6627451, 1, 0, 1,
-0.7841271, -0.3677462, -2.455734, 0.654902, 1, 0, 1,
-0.7836721, 1.508601, -1.4237, 0.6509804, 1, 0, 1,
-0.7813031, 1.800205, -0.2982183, 0.6431373, 1, 0, 1,
-0.7767082, 1.118955, -1.125575, 0.6392157, 1, 0, 1,
-0.7737264, -0.9394869, 0.2456483, 0.6313726, 1, 0, 1,
-0.7689452, 0.6425239, -0.8443403, 0.627451, 1, 0, 1,
-0.7659282, -1.38435, -3.193342, 0.6196079, 1, 0, 1,
-0.7653247, -0.5651097, -5.066636, 0.6156863, 1, 0, 1,
-0.7651684, 1.030589, 0.01863529, 0.6078432, 1, 0, 1,
-0.7637441, 1.194643, -1.881467, 0.6039216, 1, 0, 1,
-0.7584108, -0.2769842, -3.110175, 0.5960785, 1, 0, 1,
-0.7579393, 0.02170888, 0.5666107, 0.5882353, 1, 0, 1,
-0.7550126, -1.126785, -2.150727, 0.5843138, 1, 0, 1,
-0.7532415, -1.936635, -1.392277, 0.5764706, 1, 0, 1,
-0.7531629, 1.225546, 0.3929233, 0.572549, 1, 0, 1,
-0.7501166, 0.8059137, 0.4019577, 0.5647059, 1, 0, 1,
-0.7450147, -1.37044, -2.202967, 0.5607843, 1, 0, 1,
-0.7414078, -2.082057, -2.625445, 0.5529412, 1, 0, 1,
-0.7402079, -0.1231485, -0.721688, 0.5490196, 1, 0, 1,
-0.7380883, 1.345502, -0.1740802, 0.5411765, 1, 0, 1,
-0.7377412, -0.0822529, -1.763051, 0.5372549, 1, 0, 1,
-0.735728, -0.2979419, -3.104329, 0.5294118, 1, 0, 1,
-0.7339441, 0.345631, -1.315781, 0.5254902, 1, 0, 1,
-0.730934, 0.1744977, -2.047555, 0.5176471, 1, 0, 1,
-0.7222524, 1.427185, -0.3667313, 0.5137255, 1, 0, 1,
-0.713878, 0.4266245, -0.4156329, 0.5058824, 1, 0, 1,
-0.7121263, 0.9107563, -1.82474, 0.5019608, 1, 0, 1,
-0.7105963, -2.119632, -0.964703, 0.4941176, 1, 0, 1,
-0.7082496, -1.111764, -1.295921, 0.4862745, 1, 0, 1,
-0.698842, -0.1916887, -1.990066, 0.4823529, 1, 0, 1,
-0.6944902, -1.061553, -4.749549, 0.4745098, 1, 0, 1,
-0.6854474, -1.60019, -2.434208, 0.4705882, 1, 0, 1,
-0.6847304, -0.04715523, -0.9347258, 0.4627451, 1, 0, 1,
-0.680335, -0.6871382, -3.231174, 0.4588235, 1, 0, 1,
-0.6794331, -1.233643, -2.424181, 0.4509804, 1, 0, 1,
-0.6647425, 0.7628247, -1.244107, 0.4470588, 1, 0, 1,
-0.6634335, -0.9191397, -3.534418, 0.4392157, 1, 0, 1,
-0.6624517, -0.9808845, -3.184084, 0.4352941, 1, 0, 1,
-0.6570272, 1.770839, 0.4941534, 0.427451, 1, 0, 1,
-0.6560642, -0.6351832, -2.081286, 0.4235294, 1, 0, 1,
-0.6522321, -0.3826881, -1.82115, 0.4156863, 1, 0, 1,
-0.6514781, 1.786121, -0.3310821, 0.4117647, 1, 0, 1,
-0.6499869, -0.450979, -1.220086, 0.4039216, 1, 0, 1,
-0.6483634, -0.04472137, -1.239811, 0.3960784, 1, 0, 1,
-0.64646, -0.7532647, -1.842334, 0.3921569, 1, 0, 1,
-0.6463455, 0.2816705, -0.9831404, 0.3843137, 1, 0, 1,
-0.640377, 1.369367, 0.1538212, 0.3803922, 1, 0, 1,
-0.6390363, -0.2713115, -1.711612, 0.372549, 1, 0, 1,
-0.6353864, 0.09178835, -1.154781, 0.3686275, 1, 0, 1,
-0.6345307, 1.946994, -0.21669, 0.3607843, 1, 0, 1,
-0.6244302, -0.967612, -0.6833922, 0.3568628, 1, 0, 1,
-0.6112267, 0.4444292, 0.1422144, 0.3490196, 1, 0, 1,
-0.6081489, 0.6214757, -0.6015999, 0.345098, 1, 0, 1,
-0.6076961, -0.865742, -2.497756, 0.3372549, 1, 0, 1,
-0.6063802, -0.1661096, -2.352068, 0.3333333, 1, 0, 1,
-0.6012669, 1.81764, -1.157765, 0.3254902, 1, 0, 1,
-0.6001418, 0.672304, 0.8873674, 0.3215686, 1, 0, 1,
-0.5970127, -2.106159, -2.318256, 0.3137255, 1, 0, 1,
-0.5964528, -1.928274, -0.4947599, 0.3098039, 1, 0, 1,
-0.5936639, 0.9498994, -0.9980434, 0.3019608, 1, 0, 1,
-0.5930647, 0.6577852, 0.06453832, 0.2941177, 1, 0, 1,
-0.590479, 0.6897433, -1.507768, 0.2901961, 1, 0, 1,
-0.588203, -0.5292189, -0.9333441, 0.282353, 1, 0, 1,
-0.5833278, -0.3277005, -2.775973, 0.2784314, 1, 0, 1,
-0.5832533, 0.187621, -2.409541, 0.2705882, 1, 0, 1,
-0.5811948, -0.3210216, -2.352173, 0.2666667, 1, 0, 1,
-0.5776222, 0.8534368, 0.6869606, 0.2588235, 1, 0, 1,
-0.5756475, -0.7223625, -1.876343, 0.254902, 1, 0, 1,
-0.5680405, 1.695403, 1.729233, 0.2470588, 1, 0, 1,
-0.5661521, -0.4584193, -2.060518, 0.2431373, 1, 0, 1,
-0.5650584, 1.151713, 0.02712283, 0.2352941, 1, 0, 1,
-0.5645015, -1.14443, -2.721446, 0.2313726, 1, 0, 1,
-0.5545927, -0.9749635, -3.237444, 0.2235294, 1, 0, 1,
-0.5545384, -0.546073, -2.524095, 0.2196078, 1, 0, 1,
-0.5476494, -1.095751, -3.609537, 0.2117647, 1, 0, 1,
-0.5470858, -1.678601, -1.46354, 0.2078431, 1, 0, 1,
-0.5420422, -0.3273682, -3.00806, 0.2, 1, 0, 1,
-0.5374787, -1.637789, -3.62407, 0.1921569, 1, 0, 1,
-0.5324974, -0.1398434, -1.412496, 0.1882353, 1, 0, 1,
-0.5294356, -1.715314, -3.837288, 0.1803922, 1, 0, 1,
-0.5277665, -1.030617, -1.630586, 0.1764706, 1, 0, 1,
-0.5249664, -1.346136, -0.8543536, 0.1686275, 1, 0, 1,
-0.5239543, 0.8000721, -1.177354, 0.1647059, 1, 0, 1,
-0.5227733, 1.213709, -0.06567791, 0.1568628, 1, 0, 1,
-0.5225282, -0.142236, -2.091879, 0.1529412, 1, 0, 1,
-0.5188401, -0.02118723, -2.592669, 0.145098, 1, 0, 1,
-0.5158918, -0.1271547, -1.480547, 0.1411765, 1, 0, 1,
-0.5146398, -2.242807, -4.241094, 0.1333333, 1, 0, 1,
-0.5061969, -0.2612052, -2.905511, 0.1294118, 1, 0, 1,
-0.5026499, 0.8065816, 0.8759091, 0.1215686, 1, 0, 1,
-0.5023136, -0.6261412, -2.295803, 0.1176471, 1, 0, 1,
-0.5017577, -1.39079, -3.688954, 0.1098039, 1, 0, 1,
-0.4974003, 2.495295, 0.6004351, 0.1058824, 1, 0, 1,
-0.4952433, -1.146162, -1.461897, 0.09803922, 1, 0, 1,
-0.4903773, -0.4581225, -1.746836, 0.09019608, 1, 0, 1,
-0.4893776, 0.7179493, -0.616707, 0.08627451, 1, 0, 1,
-0.4865409, -1.623606, -1.622278, 0.07843138, 1, 0, 1,
-0.4819961, 0.8346766, -2.220143, 0.07450981, 1, 0, 1,
-0.4773551, 0.4605581, -0.2136932, 0.06666667, 1, 0, 1,
-0.4742072, 0.9067189, 1.496853, 0.0627451, 1, 0, 1,
-0.4726872, 0.2373114, -2.61281, 0.05490196, 1, 0, 1,
-0.471586, -0.4937979, -1.883197, 0.05098039, 1, 0, 1,
-0.4714392, -0.3965721, -2.450406, 0.04313726, 1, 0, 1,
-0.4665174, -2.388185, -2.37311, 0.03921569, 1, 0, 1,
-0.4613093, 0.3213671, -1.076203, 0.03137255, 1, 0, 1,
-0.4569535, 0.6910852, 0.2077762, 0.02745098, 1, 0, 1,
-0.4506032, -0.7247297, -2.705334, 0.01960784, 1, 0, 1,
-0.4474193, -0.01443979, -1.853307, 0.01568628, 1, 0, 1,
-0.4458114, -1.459252, -3.555001, 0.007843138, 1, 0, 1,
-0.4454385, 1.613663, -1.037182, 0.003921569, 1, 0, 1,
-0.4383139, 1.294813, 0.7416623, 0, 1, 0.003921569, 1,
-0.4382031, -0.1135001, -2.248364, 0, 1, 0.01176471, 1,
-0.4378649, -1.644086, -1.711865, 0, 1, 0.01568628, 1,
-0.4362774, 1.34996, -1.142425, 0, 1, 0.02352941, 1,
-0.4318215, -0.1848614, -4.51568, 0, 1, 0.02745098, 1,
-0.4309894, 1.985289, 0.2747652, 0, 1, 0.03529412, 1,
-0.4277352, -0.917182, -1.78533, 0, 1, 0.03921569, 1,
-0.4268611, 1.415891, -1.323519, 0, 1, 0.04705882, 1,
-0.4257547, -1.81023, -3.543903, 0, 1, 0.05098039, 1,
-0.4253696, 1.349827, 0.2485155, 0, 1, 0.05882353, 1,
-0.4183214, 1.29243, -0.7572786, 0, 1, 0.0627451, 1,
-0.4099453, 1.544016, -0.4661218, 0, 1, 0.07058824, 1,
-0.4064099, 2.066369, -0.9328096, 0, 1, 0.07450981, 1,
-0.4017568, 0.8074765, -1.462364, 0, 1, 0.08235294, 1,
-0.4014687, 0.003231365, -2.682377, 0, 1, 0.08627451, 1,
-0.3989936, -0.834424, -1.263499, 0, 1, 0.09411765, 1,
-0.3964828, -2.275128, -3.936113, 0, 1, 0.1019608, 1,
-0.3924093, -1.517797, -1.438006, 0, 1, 0.1058824, 1,
-0.3912189, -1.072335, -0.9911029, 0, 1, 0.1137255, 1,
-0.3881153, -0.5592126, -3.03519, 0, 1, 0.1176471, 1,
-0.3862146, -1.995293, -4.203517, 0, 1, 0.1254902, 1,
-0.3841912, 0.368055, 0.1227154, 0, 1, 0.1294118, 1,
-0.3841314, 0.4917549, -1.990785, 0, 1, 0.1372549, 1,
-0.379859, 0.1658457, -0.9133179, 0, 1, 0.1411765, 1,
-0.3794095, -0.1097586, -1.305364, 0, 1, 0.1490196, 1,
-0.3791889, -0.8185364, -2.857692, 0, 1, 0.1529412, 1,
-0.3773619, -0.4958725, -2.851231, 0, 1, 0.1607843, 1,
-0.3733081, 0.1481616, 0.8151532, 0, 1, 0.1647059, 1,
-0.3699495, 0.00966534, -2.023512, 0, 1, 0.172549, 1,
-0.3681661, 0.2422203, -1.950945, 0, 1, 0.1764706, 1,
-0.3672394, 1.791636, -0.7755474, 0, 1, 0.1843137, 1,
-0.3648231, 1.119287, -0.1048082, 0, 1, 0.1882353, 1,
-0.3647563, 0.04279594, -2.671331, 0, 1, 0.1960784, 1,
-0.3642108, -0.327155, -2.470098, 0, 1, 0.2039216, 1,
-0.3618098, 1.163919, 0.7491386, 0, 1, 0.2078431, 1,
-0.3577289, -0.4633163, -1.991691, 0, 1, 0.2156863, 1,
-0.3575954, -1.214983, -1.766854, 0, 1, 0.2196078, 1,
-0.3549851, -0.5578299, -0.2696801, 0, 1, 0.227451, 1,
-0.3526171, 0.3345114, -0.003140965, 0, 1, 0.2313726, 1,
-0.3488416, -1.06248, -2.993214, 0, 1, 0.2392157, 1,
-0.3478653, -1.842163, -2.309792, 0, 1, 0.2431373, 1,
-0.3430953, 0.3312011, -0.3086519, 0, 1, 0.2509804, 1,
-0.3418736, -0.9131914, -2.106613, 0, 1, 0.254902, 1,
-0.3418412, 0.2445182, -0.2002523, 0, 1, 0.2627451, 1,
-0.3387464, -0.1486452, -1.088201, 0, 1, 0.2666667, 1,
-0.3301042, -0.8735073, -3.264608, 0, 1, 0.2745098, 1,
-0.3285128, 0.07285386, -1.609102, 0, 1, 0.2784314, 1,
-0.3270754, 0.604957, 0.3042357, 0, 1, 0.2862745, 1,
-0.3268016, -0.3407183, -3.541358, 0, 1, 0.2901961, 1,
-0.3258327, 0.1034022, -0.6438357, 0, 1, 0.2980392, 1,
-0.3253105, -0.5585355, -2.640565, 0, 1, 0.3058824, 1,
-0.3236978, -0.9686031, -2.802807, 0, 1, 0.3098039, 1,
-0.323316, 0.002925724, -1.044342, 0, 1, 0.3176471, 1,
-0.3233044, -0.3155747, -4.689502, 0, 1, 0.3215686, 1,
-0.3221133, -0.01410513, -3.290747, 0, 1, 0.3294118, 1,
-0.3207179, 0.1420021, -3.01559, 0, 1, 0.3333333, 1,
-0.3198987, -1.873138, -4.585417, 0, 1, 0.3411765, 1,
-0.3188223, 2.408463, 1.405646, 0, 1, 0.345098, 1,
-0.3077206, -1.564682, -4.803992, 0, 1, 0.3529412, 1,
-0.2963211, 0.08631665, -0.7014281, 0, 1, 0.3568628, 1,
-0.295719, 0.1092774, -1.901334, 0, 1, 0.3647059, 1,
-0.2939064, -0.2216912, -3.116685, 0, 1, 0.3686275, 1,
-0.2876929, -1.721165, -3.410016, 0, 1, 0.3764706, 1,
-0.2697158, -0.8589827, -5.044775, 0, 1, 0.3803922, 1,
-0.2619545, -1.201584, -2.126469, 0, 1, 0.3882353, 1,
-0.2608815, -3.604585, -3.516657, 0, 1, 0.3921569, 1,
-0.2546829, 0.5304011, -0.3293713, 0, 1, 0.4, 1,
-0.253669, -0.830775, -2.940353, 0, 1, 0.4078431, 1,
-0.2501295, 0.009248036, -3.931941, 0, 1, 0.4117647, 1,
-0.2491053, 0.1376386, -2.947378, 0, 1, 0.4196078, 1,
-0.249037, 1.454243, -0.07366018, 0, 1, 0.4235294, 1,
-0.2393332, 0.5003314, -2.257658, 0, 1, 0.4313726, 1,
-0.2364812, -0.1204597, -2.164318, 0, 1, 0.4352941, 1,
-0.2329907, -0.1290201, -1.509539, 0, 1, 0.4431373, 1,
-0.228421, 0.9896873, -0.5520061, 0, 1, 0.4470588, 1,
-0.2270838, -0.4045633, -1.336579, 0, 1, 0.454902, 1,
-0.2258377, 0.1667066, -1.550672, 0, 1, 0.4588235, 1,
-0.2253132, 1.379557, -0.1916505, 0, 1, 0.4666667, 1,
-0.2249927, -0.4054125, -2.460484, 0, 1, 0.4705882, 1,
-0.2249898, 1.310607, -1.122525, 0, 1, 0.4784314, 1,
-0.2242943, 0.2104514, -1.149827, 0, 1, 0.4823529, 1,
-0.223397, 0.4473275, -0.9484712, 0, 1, 0.4901961, 1,
-0.2180225, 1.133699, -0.9124767, 0, 1, 0.4941176, 1,
-0.2162818, 0.3020014, -0.2538093, 0, 1, 0.5019608, 1,
-0.2134102, -0.3895838, -2.2063, 0, 1, 0.509804, 1,
-0.2108336, 2.061998, -1.896313, 0, 1, 0.5137255, 1,
-0.2103076, -2.545977, -3.397725, 0, 1, 0.5215687, 1,
-0.208626, -0.9064208, -5.252933, 0, 1, 0.5254902, 1,
-0.1944255, -0.2914098, -1.624523, 0, 1, 0.5333334, 1,
-0.1928956, 1.33789, -0.7285787, 0, 1, 0.5372549, 1,
-0.1924166, 1.16245, -0.6152053, 0, 1, 0.5450981, 1,
-0.1908777, -0.6982993, -2.329935, 0, 1, 0.5490196, 1,
-0.1901774, 0.05214271, -0.963097, 0, 1, 0.5568628, 1,
-0.1853127, -0.2976831, -1.421354, 0, 1, 0.5607843, 1,
-0.1840116, -0.6808282, -3.94381, 0, 1, 0.5686275, 1,
-0.1825797, 0.7421731, -2.930506, 0, 1, 0.572549, 1,
-0.1666438, 1.068603, -2.048702, 0, 1, 0.5803922, 1,
-0.1659127, -0.1937848, -1.983568, 0, 1, 0.5843138, 1,
-0.1630119, 0.3147539, -0.4465432, 0, 1, 0.5921569, 1,
-0.1608575, -0.2591258, -2.381399, 0, 1, 0.5960785, 1,
-0.1595151, 0.9129221, 1.129372, 0, 1, 0.6039216, 1,
-0.1580876, 0.6124483, 0.3139512, 0, 1, 0.6117647, 1,
-0.1516668, 0.1468386, -1.31144, 0, 1, 0.6156863, 1,
-0.1445227, 0.0223046, 0.01799779, 0, 1, 0.6235294, 1,
-0.1420119, 0.1034983, -0.1084891, 0, 1, 0.627451, 1,
-0.1414663, 0.7165523, -0.146883, 0, 1, 0.6352941, 1,
-0.1360538, -1.022916, -2.773486, 0, 1, 0.6392157, 1,
-0.1348319, -1.254513, -2.729103, 0, 1, 0.6470588, 1,
-0.1341705, -0.07107196, -1.975479, 0, 1, 0.6509804, 1,
-0.1332086, -0.2218695, -2.879408, 0, 1, 0.6588235, 1,
-0.1322356, -0.9371958, -2.313143, 0, 1, 0.6627451, 1,
-0.1298615, -0.5821877, -2.926029, 0, 1, 0.6705883, 1,
-0.123233, 0.2566217, -1.138176, 0, 1, 0.6745098, 1,
-0.1225472, 0.06420746, 0.7759365, 0, 1, 0.682353, 1,
-0.1216684, -0.4710591, -4.475645, 0, 1, 0.6862745, 1,
-0.1153034, 0.894978, -1.127418, 0, 1, 0.6941177, 1,
-0.1133529, -1.03244, -3.683086, 0, 1, 0.7019608, 1,
-0.1123106, -1.198892, -1.747369, 0, 1, 0.7058824, 1,
-0.1114671, -1.164881, -3.166176, 0, 1, 0.7137255, 1,
-0.109951, -1.555391, -4.101877, 0, 1, 0.7176471, 1,
-0.1079365, -0.6602708, -3.846989, 0, 1, 0.7254902, 1,
-0.1051077, 0.6970984, -0.02737565, 0, 1, 0.7294118, 1,
-0.1026342, -0.2071721, -2.116344, 0, 1, 0.7372549, 1,
-0.1009131, 1.50469, -0.1640351, 0, 1, 0.7411765, 1,
-0.0959681, 1.990371, 1.286101, 0, 1, 0.7490196, 1,
-0.0936218, -0.7098165, -4.577983, 0, 1, 0.7529412, 1,
-0.09009206, -0.3215182, -1.742792, 0, 1, 0.7607843, 1,
-0.08911429, -0.1635447, -1.459936, 0, 1, 0.7647059, 1,
-0.0878849, 0.3636141, -1.107551, 0, 1, 0.772549, 1,
-0.08773264, 0.6340916, -0.5899057, 0, 1, 0.7764706, 1,
-0.08444247, 0.4387554, -0.1429764, 0, 1, 0.7843137, 1,
-0.08358927, 0.9794744, 0.779388, 0, 1, 0.7882353, 1,
-0.08034202, 0.3638472, -1.308456, 0, 1, 0.7960784, 1,
-0.07844, 0.6141573, -1.079703, 0, 1, 0.8039216, 1,
-0.07710265, -0.8660777, -2.856133, 0, 1, 0.8078431, 1,
-0.07633028, 0.203145, -1.629583, 0, 1, 0.8156863, 1,
-0.07095457, -1.498252, -3.517527, 0, 1, 0.8196079, 1,
-0.07052895, 1.165714, 0.3183548, 0, 1, 0.827451, 1,
-0.07009453, -1.91908, -2.935152, 0, 1, 0.8313726, 1,
-0.06238602, -0.2706297, -0.6945887, 0, 1, 0.8392157, 1,
-0.06199441, -0.546322, -2.354855, 0, 1, 0.8431373, 1,
-0.06118863, -1.531621, -1.982272, 0, 1, 0.8509804, 1,
-0.06102096, 0.4957533, -2.09202, 0, 1, 0.854902, 1,
-0.05842937, -0.05998689, -2.911397, 0, 1, 0.8627451, 1,
-0.05804856, 0.7667698, 1.211116, 0, 1, 0.8666667, 1,
-0.0569521, 0.7366714, -0.366613, 0, 1, 0.8745098, 1,
-0.05087257, -0.4104938, -3.206977, 0, 1, 0.8784314, 1,
-0.04907215, -0.0807474, -3.462295, 0, 1, 0.8862745, 1,
-0.04471847, -0.08007396, -2.207988, 0, 1, 0.8901961, 1,
-0.04432944, 1.106082, -0.4804428, 0, 1, 0.8980392, 1,
-0.04316092, -0.6145905, -2.179945, 0, 1, 0.9058824, 1,
-0.04214736, -0.1860922, -3.830133, 0, 1, 0.9098039, 1,
-0.03859597, 0.5400767, 0.06516826, 0, 1, 0.9176471, 1,
-0.03432437, -0.3298393, -3.123408, 0, 1, 0.9215686, 1,
-0.03313464, -1.569149, -2.101856, 0, 1, 0.9294118, 1,
-0.03191699, 0.3589089, -0.5024573, 0, 1, 0.9333333, 1,
-0.02757209, 0.2443178, 0.005479109, 0, 1, 0.9411765, 1,
-0.02467234, -0.5063327, -1.334639, 0, 1, 0.945098, 1,
-0.0234231, -0.004084696, -3.333943, 0, 1, 0.9529412, 1,
-0.02269158, -0.3215209, -2.989079, 0, 1, 0.9568627, 1,
-0.02158546, -1.740387, -3.001365, 0, 1, 0.9647059, 1,
-0.01900343, 0.154796, 0.03245654, 0, 1, 0.9686275, 1,
-0.01859602, 2.375422, 0.4155661, 0, 1, 0.9764706, 1,
-0.01819187, -0.1171605, -2.31279, 0, 1, 0.9803922, 1,
-0.01766417, 0.1449731, 0.4323969, 0, 1, 0.9882353, 1,
-0.008979531, -0.7007111, -3.500441, 0, 1, 0.9921569, 1,
-0.008215006, -2.171792, -3.641365, 0, 1, 1, 1,
-0.005688501, 1.177327, -1.699139, 0, 0.9921569, 1, 1,
-0.003377517, -0.0877818, -2.953951, 0, 0.9882353, 1, 1,
-0.002299573, 0.2764729, -0.4237187, 0, 0.9803922, 1, 1,
0.005321005, 0.03428666, -0.1460759, 0, 0.9764706, 1, 1,
0.006037049, -1.580637, 2.79125, 0, 0.9686275, 1, 1,
0.007455596, -0.5658814, 2.607935, 0, 0.9647059, 1, 1,
0.008004028, -0.03126791, 3.303835, 0, 0.9568627, 1, 1,
0.01369814, -1.017473, 3.904893, 0, 0.9529412, 1, 1,
0.01442656, 0.1466981, 0.1381567, 0, 0.945098, 1, 1,
0.01766697, 0.3596682, -0.1861592, 0, 0.9411765, 1, 1,
0.0182709, 0.8009658, -2.18068, 0, 0.9333333, 1, 1,
0.0193186, 0.1887193, -0.7491502, 0, 0.9294118, 1, 1,
0.0218517, 1.236958, -0.3103591, 0, 0.9215686, 1, 1,
0.02614158, 0.2822833, -0.4751513, 0, 0.9176471, 1, 1,
0.03037762, -2.231176, 2.957473, 0, 0.9098039, 1, 1,
0.03189429, -1.405191, 1.964716, 0, 0.9058824, 1, 1,
0.03556245, -0.5255691, 4.724068, 0, 0.8980392, 1, 1,
0.03853858, 2.027964, 0.5514901, 0, 0.8901961, 1, 1,
0.0404234, 0.6369218, 0.9031341, 0, 0.8862745, 1, 1,
0.04066855, 1.283449, -0.08032671, 0, 0.8784314, 1, 1,
0.04399251, 1.218283, -0.1996925, 0, 0.8745098, 1, 1,
0.04897691, -0.2487129, 3.458713, 0, 0.8666667, 1, 1,
0.05352819, -1.96281, 2.785347, 0, 0.8627451, 1, 1,
0.05749085, -0.3888487, 2.944326, 0, 0.854902, 1, 1,
0.05912424, 1.307407, -1.170527, 0, 0.8509804, 1, 1,
0.06125838, 0.578845, 0.8725899, 0, 0.8431373, 1, 1,
0.0618606, -0.7906635, 2.809427, 0, 0.8392157, 1, 1,
0.06232695, -0.539196, 2.548034, 0, 0.8313726, 1, 1,
0.06266449, -0.9697983, 3.80564, 0, 0.827451, 1, 1,
0.06293179, 0.762518, 0.9572822, 0, 0.8196079, 1, 1,
0.07487299, 0.596225, 0.1925696, 0, 0.8156863, 1, 1,
0.07740697, -0.2464749, 3.508325, 0, 0.8078431, 1, 1,
0.07950208, 1.522307, 0.07734084, 0, 0.8039216, 1, 1,
0.0898852, 0.6892985, 0.5934443, 0, 0.7960784, 1, 1,
0.09346323, -0.975399, 1.429422, 0, 0.7882353, 1, 1,
0.09466998, 0.1591849, -0.9462371, 0, 0.7843137, 1, 1,
0.09571083, -2.143976, 2.025878, 0, 0.7764706, 1, 1,
0.09615944, 1.234258, -0.958768, 0, 0.772549, 1, 1,
0.09710099, 1.227386, 0.08136258, 0, 0.7647059, 1, 1,
0.09737816, 0.7909022, 0.6797205, 0, 0.7607843, 1, 1,
0.09816151, -0.3451085, 2.539911, 0, 0.7529412, 1, 1,
0.09910116, -0.7911898, 2.458341, 0, 0.7490196, 1, 1,
0.09956559, -1.17405, 4.648684, 0, 0.7411765, 1, 1,
0.1004952, -0.7040874, 2.087345, 0, 0.7372549, 1, 1,
0.1050069, 0.02953725, 1.028278, 0, 0.7294118, 1, 1,
0.1058882, -1.210407, 1.641591, 0, 0.7254902, 1, 1,
0.1083027, 0.942587, -0.5154857, 0, 0.7176471, 1, 1,
0.1086463, -1.052303, 2.175596, 0, 0.7137255, 1, 1,
0.1100757, 0.2434443, -0.995407, 0, 0.7058824, 1, 1,
0.1131711, 1.027284, -0.1220979, 0, 0.6980392, 1, 1,
0.114105, -1.286792, 3.869118, 0, 0.6941177, 1, 1,
0.1160391, 1.269572, -0.9040945, 0, 0.6862745, 1, 1,
0.1172134, -0.6234692, 2.815474, 0, 0.682353, 1, 1,
0.1247659, -0.2107156, 2.863295, 0, 0.6745098, 1, 1,
0.1261535, -0.3262734, 3.696177, 0, 0.6705883, 1, 1,
0.1327659, 0.7020741, -0.7421051, 0, 0.6627451, 1, 1,
0.1339989, 0.5285283, -0.1818021, 0, 0.6588235, 1, 1,
0.1377454, 1.443538, 0.2123951, 0, 0.6509804, 1, 1,
0.1390089, -0.656985, 3.262744, 0, 0.6470588, 1, 1,
0.1413638, 0.004529627, 1.513727, 0, 0.6392157, 1, 1,
0.1426245, 1.649132, 0.5191782, 0, 0.6352941, 1, 1,
0.1446138, 0.3049288, -1.077619, 0, 0.627451, 1, 1,
0.1520664, 0.1074104, -1.25838, 0, 0.6235294, 1, 1,
0.1525997, -0.7814814, 1.042655, 0, 0.6156863, 1, 1,
0.1567215, -0.432707, 3.580883, 0, 0.6117647, 1, 1,
0.1590877, 1.262986, -0.4879815, 0, 0.6039216, 1, 1,
0.1603994, -3.210631, 4.661933, 0, 0.5960785, 1, 1,
0.1612482, 1.23768, 0.4634871, 0, 0.5921569, 1, 1,
0.1633531, -1.600456, 3.468658, 0, 0.5843138, 1, 1,
0.1639872, 0.8344491, -0.3428941, 0, 0.5803922, 1, 1,
0.1725881, 0.7301062, 1.217582, 0, 0.572549, 1, 1,
0.1738658, -0.094757, 2.205307, 0, 0.5686275, 1, 1,
0.1758155, -1.156696, 1.960116, 0, 0.5607843, 1, 1,
0.1815119, -0.6008314, 1.81785, 0, 0.5568628, 1, 1,
0.1855117, 1.590672, 1.91838, 0, 0.5490196, 1, 1,
0.1879432, 2.47751, -0.1108822, 0, 0.5450981, 1, 1,
0.1903662, 0.2919902, 1.168965, 0, 0.5372549, 1, 1,
0.1926113, -0.4970185, 3.128201, 0, 0.5333334, 1, 1,
0.1981944, 0.349238, -0.2798807, 0, 0.5254902, 1, 1,
0.1988792, 1.051937, -1.384325, 0, 0.5215687, 1, 1,
0.2058933, 0.9214467, -0.8984072, 0, 0.5137255, 1, 1,
0.2092002, 0.423695, 0.9952357, 0, 0.509804, 1, 1,
0.2093277, 0.325507, -0.6727371, 0, 0.5019608, 1, 1,
0.215506, -0.9991153, -0.08967046, 0, 0.4941176, 1, 1,
0.2176422, -0.480802, 1.909129, 0, 0.4901961, 1, 1,
0.2176506, -0.4848153, 1.556226, 0, 0.4823529, 1, 1,
0.2181227, 1.429269, -0.05995104, 0, 0.4784314, 1, 1,
0.2195256, -0.4309252, 2.623039, 0, 0.4705882, 1, 1,
0.2224, -0.3583631, 2.415175, 0, 0.4666667, 1, 1,
0.2228706, -0.9909716, 1.27687, 0, 0.4588235, 1, 1,
0.2249046, 0.6268623, -0.1309611, 0, 0.454902, 1, 1,
0.2273271, -2.26019, 4.488198, 0, 0.4470588, 1, 1,
0.2283419, -2.712516, 3.190985, 0, 0.4431373, 1, 1,
0.234729, -0.8732582, 4.35394, 0, 0.4352941, 1, 1,
0.2348647, 0.2618194, 0.9233562, 0, 0.4313726, 1, 1,
0.2403161, 0.5231086, 0.03249886, 0, 0.4235294, 1, 1,
0.2493458, -0.5259287, 3.275849, 0, 0.4196078, 1, 1,
0.249785, -2.159052, 3.465894, 0, 0.4117647, 1, 1,
0.2556519, -0.9842637, 3.170668, 0, 0.4078431, 1, 1,
0.2642771, 1.854992, -0.6452809, 0, 0.4, 1, 1,
0.2680018, -1.616084, 3.515534, 0, 0.3921569, 1, 1,
0.2700336, 0.2665375, 2.522516, 0, 0.3882353, 1, 1,
0.2700628, 1.103741, 0.582965, 0, 0.3803922, 1, 1,
0.2701493, -0.6526135, 3.45396, 0, 0.3764706, 1, 1,
0.2749356, 0.7567987, 0.4005242, 0, 0.3686275, 1, 1,
0.2783343, 0.1305616, -1.95755, 0, 0.3647059, 1, 1,
0.2846327, 1.097501, 0.4864749, 0, 0.3568628, 1, 1,
0.2920716, 0.9008028, -0.8079754, 0, 0.3529412, 1, 1,
0.2993654, -0.6037897, 2.827348, 0, 0.345098, 1, 1,
0.2995068, -0.1432822, 1.954759, 0, 0.3411765, 1, 1,
0.3005096, -1.699331, 3.426472, 0, 0.3333333, 1, 1,
0.3014746, -0.6476042, 2.642252, 0, 0.3294118, 1, 1,
0.3046303, -0.9096837, 3.232471, 0, 0.3215686, 1, 1,
0.3076743, -0.1738233, 2.436979, 0, 0.3176471, 1, 1,
0.307686, 1.142612, -0.3565594, 0, 0.3098039, 1, 1,
0.308669, 0.3895838, 0.3860289, 0, 0.3058824, 1, 1,
0.3087723, -0.1469654, 1.049517, 0, 0.2980392, 1, 1,
0.308817, -0.4275872, 2.921063, 0, 0.2901961, 1, 1,
0.3097297, 0.3949653, 0.6263165, 0, 0.2862745, 1, 1,
0.3100371, 0.1283766, 2.448135, 0, 0.2784314, 1, 1,
0.3154871, -0.8204317, 3.46633, 0, 0.2745098, 1, 1,
0.3185373, -1.359452, 3.890358, 0, 0.2666667, 1, 1,
0.3187973, 0.7989235, 0.2073778, 0, 0.2627451, 1, 1,
0.3189251, 0.9393998, 0.3701022, 0, 0.254902, 1, 1,
0.3203393, -1.023461, 2.690685, 0, 0.2509804, 1, 1,
0.3219551, 1.503238, -0.369258, 0, 0.2431373, 1, 1,
0.3219914, 0.4303628, 0.7226468, 0, 0.2392157, 1, 1,
0.3232002, -0.6415802, 2.578098, 0, 0.2313726, 1, 1,
0.3248449, -0.4997576, 2.040812, 0, 0.227451, 1, 1,
0.3279929, 1.060107, -0.1788961, 0, 0.2196078, 1, 1,
0.3290524, 0.344243, 1.838604, 0, 0.2156863, 1, 1,
0.3310978, 0.07911123, 1.683977, 0, 0.2078431, 1, 1,
0.3436007, 2.003807, 1.265026, 0, 0.2039216, 1, 1,
0.3438851, -0.9297248, 3.948927, 0, 0.1960784, 1, 1,
0.3439058, 0.04064922, 2.303337, 0, 0.1882353, 1, 1,
0.3440224, -0.336403, 2.992246, 0, 0.1843137, 1, 1,
0.3494049, 1.200811, -0.1237189, 0, 0.1764706, 1, 1,
0.3523861, 0.342702, 2.316996, 0, 0.172549, 1, 1,
0.3528867, 0.1553802, 0.84378, 0, 0.1647059, 1, 1,
0.3529478, 1.309161, -0.2539595, 0, 0.1607843, 1, 1,
0.3530347, -0.8459979, 3.380184, 0, 0.1529412, 1, 1,
0.353118, 1.502362, -0.927354, 0, 0.1490196, 1, 1,
0.3544146, 0.3724386, -1.111571, 0, 0.1411765, 1, 1,
0.3549314, -0.3514154, 2.081883, 0, 0.1372549, 1, 1,
0.3563478, 0.1611261, 0.1091888, 0, 0.1294118, 1, 1,
0.3603606, 1.055123, 1.506296, 0, 0.1254902, 1, 1,
0.3615153, -0.01995696, 1.195762, 0, 0.1176471, 1, 1,
0.3684283, -1.725816, 2.497103, 0, 0.1137255, 1, 1,
0.3739165, -0.6999915, 3.047591, 0, 0.1058824, 1, 1,
0.3783552, 0.9613591, -0.07975081, 0, 0.09803922, 1, 1,
0.3787644, 2.067403, -0.2271365, 0, 0.09411765, 1, 1,
0.3838592, 0.897081, 0.5938184, 0, 0.08627451, 1, 1,
0.3838757, 0.2647223, 0.9408768, 0, 0.08235294, 1, 1,
0.3880242, -0.07815987, 2.072808, 0, 0.07450981, 1, 1,
0.388489, -0.009117861, 0.7093186, 0, 0.07058824, 1, 1,
0.3908665, 1.195162, -0.2834345, 0, 0.0627451, 1, 1,
0.3922872, -1.787124, 2.21125, 0, 0.05882353, 1, 1,
0.3930104, -1.789551, 1.295506, 0, 0.05098039, 1, 1,
0.3950934, 0.4219076, 0.2102257, 0, 0.04705882, 1, 1,
0.3981636, 2.747473, -1.877559, 0, 0.03921569, 1, 1,
0.3991681, 0.5571308, -0.6141217, 0, 0.03529412, 1, 1,
0.4016358, -0.3899381, 1.58904, 0, 0.02745098, 1, 1,
0.4030133, 0.5507997, 0.5345531, 0, 0.02352941, 1, 1,
0.404137, 1.202432, 0.9093832, 0, 0.01568628, 1, 1,
0.405598, -1.610372, 3.035859, 0, 0.01176471, 1, 1,
0.41291, 0.8551529, 1.448442, 0, 0.003921569, 1, 1,
0.4157135, 0.2902586, 0.1825194, 0.003921569, 0, 1, 1,
0.4172875, -1.234461, 2.106955, 0.007843138, 0, 1, 1,
0.419346, -0.677413, 1.758669, 0.01568628, 0, 1, 1,
0.4193494, -1.723269, 2.791463, 0.01960784, 0, 1, 1,
0.4205115, -0.1502044, 2.204072, 0.02745098, 0, 1, 1,
0.4222729, 1.262523, -0.3395822, 0.03137255, 0, 1, 1,
0.4249924, -0.529642, 2.365438, 0.03921569, 0, 1, 1,
0.4272163, 0.1928478, 1.993611, 0.04313726, 0, 1, 1,
0.4281899, -1.018561, 1.892176, 0.05098039, 0, 1, 1,
0.4284721, 1.601834, -1.994599, 0.05490196, 0, 1, 1,
0.4293192, -0.06453425, 2.355187, 0.0627451, 0, 1, 1,
0.4319924, 0.03494035, 2.135078, 0.06666667, 0, 1, 1,
0.4322354, 0.9964736, -0.5318759, 0.07450981, 0, 1, 1,
0.4329975, 0.08791091, 0.1441171, 0.07843138, 0, 1, 1,
0.4369668, -0.5423803, 3.439558, 0.08627451, 0, 1, 1,
0.4375774, 0.6988445, 1.566552, 0.09019608, 0, 1, 1,
0.4406842, 0.2703261, 1.324541, 0.09803922, 0, 1, 1,
0.4431544, -1.26705, 3.605946, 0.1058824, 0, 1, 1,
0.4500524, 0.6686885, -0.1298688, 0.1098039, 0, 1, 1,
0.4548862, -0.7352704, 2.741792, 0.1176471, 0, 1, 1,
0.4551669, 0.6781551, -0.1567992, 0.1215686, 0, 1, 1,
0.4575289, -0.1377911, 1.81617, 0.1294118, 0, 1, 1,
0.4603229, 0.1630398, 2.298675, 0.1333333, 0, 1, 1,
0.4615099, -0.5717849, 0.7377009, 0.1411765, 0, 1, 1,
0.4675545, -0.6620107, 2.525073, 0.145098, 0, 1, 1,
0.4711903, 0.8698951, 1.430603, 0.1529412, 0, 1, 1,
0.4768665, -1.404682, 3.575867, 0.1568628, 0, 1, 1,
0.4796943, -0.1775376, 3.03985, 0.1647059, 0, 1, 1,
0.480443, -1.44989, 2.922654, 0.1686275, 0, 1, 1,
0.4826357, 0.2691091, 0.7491534, 0.1764706, 0, 1, 1,
0.4832335, -1.320801, 2.400803, 0.1803922, 0, 1, 1,
0.4863729, 0.5314811, 0.7250041, 0.1882353, 0, 1, 1,
0.4888257, -1.17089, 1.540928, 0.1921569, 0, 1, 1,
0.4889745, -0.008286208, 1.02843, 0.2, 0, 1, 1,
0.4931739, -0.2754667, 4.479489, 0.2078431, 0, 1, 1,
0.4937679, 0.4163449, 1.171126, 0.2117647, 0, 1, 1,
0.4944828, 0.1593857, 1.463089, 0.2196078, 0, 1, 1,
0.495006, -0.6368459, 2.973781, 0.2235294, 0, 1, 1,
0.4957175, 0.02471707, 0.0335878, 0.2313726, 0, 1, 1,
0.49718, -0.2959662, 1.840893, 0.2352941, 0, 1, 1,
0.5061669, -0.7344908, 0.7498321, 0.2431373, 0, 1, 1,
0.5066023, 0.8362324, -0.3501584, 0.2470588, 0, 1, 1,
0.5092882, -0.6865135, 3.21481, 0.254902, 0, 1, 1,
0.5128943, 0.937717, 0.112461, 0.2588235, 0, 1, 1,
0.5143838, -0.3186227, 2.25207, 0.2666667, 0, 1, 1,
0.5161725, -0.3077632, 1.086355, 0.2705882, 0, 1, 1,
0.5178475, 0.9469457, -0.7807969, 0.2784314, 0, 1, 1,
0.5178704, 0.5232305, 0.8325519, 0.282353, 0, 1, 1,
0.5188966, 0.6190352, 0.9904242, 0.2901961, 0, 1, 1,
0.5191858, 1.311168, 0.2960091, 0.2941177, 0, 1, 1,
0.5259056, 0.4555158, 2.000975, 0.3019608, 0, 1, 1,
0.5268188, 0.4644392, 0.1648319, 0.3098039, 0, 1, 1,
0.528393, 0.5450407, 1.831719, 0.3137255, 0, 1, 1,
0.5367967, 1.502576, -0.2256544, 0.3215686, 0, 1, 1,
0.5405154, -0.3558562, 3.031209, 0.3254902, 0, 1, 1,
0.5429552, -0.4762841, 3.370513, 0.3333333, 0, 1, 1,
0.5452045, 0.1608416, 0.5257996, 0.3372549, 0, 1, 1,
0.5529615, -0.803081, 3.579277, 0.345098, 0, 1, 1,
0.5574856, -1.094595, 3.967755, 0.3490196, 0, 1, 1,
0.5579752, -0.2913909, 2.44552, 0.3568628, 0, 1, 1,
0.5608094, -2.296888, 0.731335, 0.3607843, 0, 1, 1,
0.5653918, -0.6204128, 0.7026281, 0.3686275, 0, 1, 1,
0.5769929, 0.08289051, 1.583939, 0.372549, 0, 1, 1,
0.5843491, 1.921184, -1.519004, 0.3803922, 0, 1, 1,
0.5851535, -0.5551356, 3.728879, 0.3843137, 0, 1, 1,
0.5878627, -0.2023109, 1.431075, 0.3921569, 0, 1, 1,
0.5898401, 0.3454602, 3.629286, 0.3960784, 0, 1, 1,
0.5910459, -0.6073787, 2.834594, 0.4039216, 0, 1, 1,
0.5914242, -0.1991053, 2.615002, 0.4117647, 0, 1, 1,
0.591577, -2.662134, 3.534342, 0.4156863, 0, 1, 1,
0.5932944, -0.03248134, 2.300403, 0.4235294, 0, 1, 1,
0.5965101, -1.154287, 2.447657, 0.427451, 0, 1, 1,
0.59692, 0.7102226, -1.813704, 0.4352941, 0, 1, 1,
0.5973114, -0.8609133, 1.951269, 0.4392157, 0, 1, 1,
0.6102601, 1.515485, -0.007422408, 0.4470588, 0, 1, 1,
0.6139449, -1.206155, 3.89355, 0.4509804, 0, 1, 1,
0.6234888, 0.574648, 3.114036, 0.4588235, 0, 1, 1,
0.6308355, -0.2841383, 2.189683, 0.4627451, 0, 1, 1,
0.6335546, -0.1330518, 1.861499, 0.4705882, 0, 1, 1,
0.6342341, 0.2243793, 3.101329, 0.4745098, 0, 1, 1,
0.6347854, 0.1047589, 1.686012, 0.4823529, 0, 1, 1,
0.6352045, -3.640698, 1.171759, 0.4862745, 0, 1, 1,
0.6370821, -0.1760984, 1.123881, 0.4941176, 0, 1, 1,
0.6436865, 0.8484375, 0.8814178, 0.5019608, 0, 1, 1,
0.6462174, 1.661558, 0.2819904, 0.5058824, 0, 1, 1,
0.6480979, 0.1231002, 2.502758, 0.5137255, 0, 1, 1,
0.6488367, -1.26992, 2.125337, 0.5176471, 0, 1, 1,
0.6523578, 1.977086, 0.3933503, 0.5254902, 0, 1, 1,
0.6541587, -0.8721119, 1.950882, 0.5294118, 0, 1, 1,
0.6577219, 0.328429, 1.551999, 0.5372549, 0, 1, 1,
0.6607587, -0.4414168, 2.961596, 0.5411765, 0, 1, 1,
0.6634423, -0.4058125, 3.007148, 0.5490196, 0, 1, 1,
0.6665576, -0.06563752, 3.929569, 0.5529412, 0, 1, 1,
0.6742457, -0.6776357, 1.742736, 0.5607843, 0, 1, 1,
0.6751475, -1.090936, 3.091743, 0.5647059, 0, 1, 1,
0.6756792, 0.4773061, -0.06059903, 0.572549, 0, 1, 1,
0.6758958, 0.7945268, 0.3053815, 0.5764706, 0, 1, 1,
0.6761433, -0.6693605, 2.268747, 0.5843138, 0, 1, 1,
0.678335, 1.45262, -0.5053924, 0.5882353, 0, 1, 1,
0.6783915, 0.7701125, 0.01785682, 0.5960785, 0, 1, 1,
0.6821954, 1.05008, 0.5533162, 0.6039216, 0, 1, 1,
0.6828103, 0.3324441, 1.856295, 0.6078432, 0, 1, 1,
0.6846869, 1.420267, 0.1905161, 0.6156863, 0, 1, 1,
0.6867509, 0.5152207, 1.032245, 0.6196079, 0, 1, 1,
0.7119905, -1.461191, 2.989269, 0.627451, 0, 1, 1,
0.7126889, 0.7626462, 1.91827, 0.6313726, 0, 1, 1,
0.7187831, -1.143988, 3.547044, 0.6392157, 0, 1, 1,
0.7200381, -1.464272, 0.8864955, 0.6431373, 0, 1, 1,
0.7226678, -1.417656, 1.995154, 0.6509804, 0, 1, 1,
0.729284, 0.1771211, 1.661663, 0.654902, 0, 1, 1,
0.732475, 0.5371393, -0.2291049, 0.6627451, 0, 1, 1,
0.7348287, 1.034215, -0.3875332, 0.6666667, 0, 1, 1,
0.7359493, -0.1512691, 2.514266, 0.6745098, 0, 1, 1,
0.7361287, -0.3213685, 0.8522552, 0.6784314, 0, 1, 1,
0.7371637, 0.4717955, 1.109855, 0.6862745, 0, 1, 1,
0.7374719, 1.895877, 1.886655, 0.6901961, 0, 1, 1,
0.7392696, -1.270243, 1.306154, 0.6980392, 0, 1, 1,
0.7487589, 2.462276, 0.7493577, 0.7058824, 0, 1, 1,
0.749008, -0.5685632, 2.524981, 0.7098039, 0, 1, 1,
0.7601834, -0.7429972, 2.161817, 0.7176471, 0, 1, 1,
0.7673072, -1.280152, 4.040796, 0.7215686, 0, 1, 1,
0.7703968, 0.2650364, 2.014175, 0.7294118, 0, 1, 1,
0.7782972, 0.6970255, 1.372118, 0.7333333, 0, 1, 1,
0.7816386, 0.3423499, 1.233875, 0.7411765, 0, 1, 1,
0.7861325, -0.3816297, 3.200015, 0.7450981, 0, 1, 1,
0.7981232, 0.600861, 0.3984179, 0.7529412, 0, 1, 1,
0.8020067, 1.019281, 0.9534301, 0.7568628, 0, 1, 1,
0.8080217, 1.809715, 0.5294418, 0.7647059, 0, 1, 1,
0.8093018, -0.08600572, 1.138947, 0.7686275, 0, 1, 1,
0.8136277, 1.133927, 1.174334, 0.7764706, 0, 1, 1,
0.8168168, 0.1826442, 1.337673, 0.7803922, 0, 1, 1,
0.8169544, 1.276314, -0.8263133, 0.7882353, 0, 1, 1,
0.8309585, -0.9331638, 1.670512, 0.7921569, 0, 1, 1,
0.8320035, -0.8986331, 3.358798, 0.8, 0, 1, 1,
0.8364077, -0.6612021, 0.1506313, 0.8078431, 0, 1, 1,
0.8366337, -0.6518077, 1.354559, 0.8117647, 0, 1, 1,
0.8380144, 1.045674, -0.1780249, 0.8196079, 0, 1, 1,
0.8420057, 2.914798, 0.1066654, 0.8235294, 0, 1, 1,
0.8440068, 0.6371372, 0.891802, 0.8313726, 0, 1, 1,
0.8447383, -1.38596, 1.91037, 0.8352941, 0, 1, 1,
0.8448628, 0.5989538, 0.9962568, 0.8431373, 0, 1, 1,
0.8466831, 1.667936, -1.397834, 0.8470588, 0, 1, 1,
0.8486645, 1.870394, -1.77555, 0.854902, 0, 1, 1,
0.8496762, -0.163624, 2.144649, 0.8588235, 0, 1, 1,
0.8565491, -0.2189009, 3.225949, 0.8666667, 0, 1, 1,
0.8573444, 1.280048, -1.626791, 0.8705882, 0, 1, 1,
0.8579091, -0.3160563, 3.431351, 0.8784314, 0, 1, 1,
0.8585573, -0.09369688, 2.333709, 0.8823529, 0, 1, 1,
0.8610514, 0.1648724, 1.074174, 0.8901961, 0, 1, 1,
0.8659899, -0.4662558, 0.773445, 0.8941177, 0, 1, 1,
0.8708853, 0.5358993, 0.9726372, 0.9019608, 0, 1, 1,
0.8715028, 1.092163, -0.155207, 0.9098039, 0, 1, 1,
0.8716449, 0.135847, -0.2838795, 0.9137255, 0, 1, 1,
0.8717127, 0.2155042, 0.8182233, 0.9215686, 0, 1, 1,
0.8722223, -1.663105, 2.753572, 0.9254902, 0, 1, 1,
0.8732269, 1.361472, 0.1510303, 0.9333333, 0, 1, 1,
0.8800259, -0.4468813, 1.281542, 0.9372549, 0, 1, 1,
0.8821129, 0.4207546, 2.062955, 0.945098, 0, 1, 1,
0.8899292, 0.08539595, 0.949499, 0.9490196, 0, 1, 1,
0.8954491, 0.04420885, -0.3788356, 0.9568627, 0, 1, 1,
0.8973598, -0.8045759, 1.562243, 0.9607843, 0, 1, 1,
0.90865, 0.09931381, 1.131774, 0.9686275, 0, 1, 1,
0.9106781, 0.4906044, 1.045761, 0.972549, 0, 1, 1,
0.9207032, -0.2861718, 1.955643, 0.9803922, 0, 1, 1,
0.9300402, 0.7434953, 1.290368, 0.9843137, 0, 1, 1,
0.9322426, -1.581139, 3.203221, 0.9921569, 0, 1, 1,
0.9324039, -1.086913, 3.333984, 0.9960784, 0, 1, 1,
0.9333211, -1.4164, 2.346473, 1, 0, 0.9960784, 1,
0.9334399, 0.9639435, 2.157372, 1, 0, 0.9882353, 1,
0.9357359, 0.9232118, -0.009030568, 1, 0, 0.9843137, 1,
0.9359838, -0.05753177, 1.640225, 1, 0, 0.9764706, 1,
0.9389035, -1.264564, 2.023785, 1, 0, 0.972549, 1,
0.9496431, -0.1256418, 1.763747, 1, 0, 0.9647059, 1,
0.9531432, -1.495353, 3.425508, 1, 0, 0.9607843, 1,
0.9585533, 0.4108596, 0.9349841, 1, 0, 0.9529412, 1,
0.9630457, 0.7032256, 0.5926534, 1, 0, 0.9490196, 1,
0.9694213, -0.9310858, 2.47723, 1, 0, 0.9411765, 1,
0.9747926, -1.607525, 2.568413, 1, 0, 0.9372549, 1,
0.9751825, -1.052257, 2.340603, 1, 0, 0.9294118, 1,
0.9761311, 0.1679513, 3.167785, 1, 0, 0.9254902, 1,
0.9790081, -0.1959594, 1.648951, 1, 0, 0.9176471, 1,
0.9848284, -0.1139302, 0.9654182, 1, 0, 0.9137255, 1,
0.9968969, -0.2764696, 1.739177, 1, 0, 0.9058824, 1,
0.9980155, -1.788867, 2.926522, 1, 0, 0.9019608, 1,
1.009994, -0.17457, 2.019449, 1, 0, 0.8941177, 1,
1.013967, -1.796631, 3.189335, 1, 0, 0.8862745, 1,
1.01496, -1.17884, 2.082202, 1, 0, 0.8823529, 1,
1.021792, -0.135081, 4.985228, 1, 0, 0.8745098, 1,
1.021793, 0.5786839, -0.4034615, 1, 0, 0.8705882, 1,
1.041358, -0.1896857, 2.892449, 1, 0, 0.8627451, 1,
1.041978, -0.8573298, 2.634364, 1, 0, 0.8588235, 1,
1.044145, 0.8514949, 1.684074, 1, 0, 0.8509804, 1,
1.06356, 0.3179129, -0.457543, 1, 0, 0.8470588, 1,
1.064232, -0.9154245, 1.140726, 1, 0, 0.8392157, 1,
1.089949, -0.7065251, 2.310464, 1, 0, 0.8352941, 1,
1.090358, -0.1900395, 1.183982, 1, 0, 0.827451, 1,
1.090546, -0.5117869, 1.54439, 1, 0, 0.8235294, 1,
1.092287, 0.3073429, 1.336437, 1, 0, 0.8156863, 1,
1.092446, 1.196713, 0.2230818, 1, 0, 0.8117647, 1,
1.096059, 0.7266785, 1.243443, 1, 0, 0.8039216, 1,
1.099836, -0.6375705, 2.016871, 1, 0, 0.7960784, 1,
1.100585, 2.629928, 1.837896, 1, 0, 0.7921569, 1,
1.101236, 0.5025848, 0.6261995, 1, 0, 0.7843137, 1,
1.102385, -1.309483, 2.920826, 1, 0, 0.7803922, 1,
1.104612, 2.636024, 0.1110094, 1, 0, 0.772549, 1,
1.118986, 2.22668, -0.0779024, 1, 0, 0.7686275, 1,
1.11967, 1.592308, -0.4281147, 1, 0, 0.7607843, 1,
1.12532, 2.608735, 0.04193959, 1, 0, 0.7568628, 1,
1.129236, -0.3870078, 2.112752, 1, 0, 0.7490196, 1,
1.145507, -1.137261, 1.600177, 1, 0, 0.7450981, 1,
1.147627, 0.123634, 0.8844017, 1, 0, 0.7372549, 1,
1.153179, -0.6381906, 2.592073, 1, 0, 0.7333333, 1,
1.16043, 0.8486165, 1.687169, 1, 0, 0.7254902, 1,
1.1648, -0.8039533, 2.391465, 1, 0, 0.7215686, 1,
1.174598, -0.1658084, 0.5699232, 1, 0, 0.7137255, 1,
1.176609, -0.9987819, 2.195273, 1, 0, 0.7098039, 1,
1.1795, 0.1315377, 3.166009, 1, 0, 0.7019608, 1,
1.190111, -1.388724, 4.339692, 1, 0, 0.6941177, 1,
1.201043, -3.271513, 3.717705, 1, 0, 0.6901961, 1,
1.210072, 0.3242994, 1.021098, 1, 0, 0.682353, 1,
1.239417, -2.410015, 3.721472, 1, 0, 0.6784314, 1,
1.250281, -0.9282466, 4.577686, 1, 0, 0.6705883, 1,
1.25055, 1.114126, 1.868632, 1, 0, 0.6666667, 1,
1.256769, 2.992278, -0.04446298, 1, 0, 0.6588235, 1,
1.267604, -0.004479604, 1.521101, 1, 0, 0.654902, 1,
1.279884, 1.292481, -1.249783, 1, 0, 0.6470588, 1,
1.290833, 0.1198746, 2.256798, 1, 0, 0.6431373, 1,
1.294401, -1.022343, 3.634638, 1, 0, 0.6352941, 1,
1.29629, 2.143904, 1.52883, 1, 0, 0.6313726, 1,
1.299791, 1.534525, 1.684972, 1, 0, 0.6235294, 1,
1.302829, -0.231983, 1.095388, 1, 0, 0.6196079, 1,
1.303159, 1.366, 1.391794, 1, 0, 0.6117647, 1,
1.303376, 1.080049, 0.4748487, 1, 0, 0.6078432, 1,
1.303523, 2.448336, -1.391542, 1, 0, 0.6, 1,
1.326037, -0.8969972, 2.364589, 1, 0, 0.5921569, 1,
1.336696, 0.7015545, 1.725194, 1, 0, 0.5882353, 1,
1.340887, 0.6954265, 0.2486959, 1, 0, 0.5803922, 1,
1.347159, -1.77719, 0.7310415, 1, 0, 0.5764706, 1,
1.348928, -0.4452012, 1.497082, 1, 0, 0.5686275, 1,
1.349276, 2.191819, 2.552673, 1, 0, 0.5647059, 1,
1.357057, 0.1791869, 1.623924, 1, 0, 0.5568628, 1,
1.360298, 1.708802, 1.063351, 1, 0, 0.5529412, 1,
1.368703, 0.4264021, 1.426585, 1, 0, 0.5450981, 1,
1.386477, 1.431438, 0.874148, 1, 0, 0.5411765, 1,
1.393104, 0.1981963, 2.32146, 1, 0, 0.5333334, 1,
1.400962, 0.1425678, 0.5638996, 1, 0, 0.5294118, 1,
1.401779, -0.003108795, 2.404261, 1, 0, 0.5215687, 1,
1.40253, -0.9309722, 0.6466808, 1, 0, 0.5176471, 1,
1.407678, -0.02581329, 0.7517933, 1, 0, 0.509804, 1,
1.415855, 0.5771316, -1.251015, 1, 0, 0.5058824, 1,
1.419549, -0.03477943, 0.8523026, 1, 0, 0.4980392, 1,
1.427522, 0.8311246, 0.7652369, 1, 0, 0.4901961, 1,
1.435437, -1.611314, 2.317556, 1, 0, 0.4862745, 1,
1.43953, -2.107143, 1.598593, 1, 0, 0.4784314, 1,
1.439995, -0.4495166, 1.90612, 1, 0, 0.4745098, 1,
1.442354, -0.4880591, 1.323328, 1, 0, 0.4666667, 1,
1.447731, -0.1743169, 1.910033, 1, 0, 0.4627451, 1,
1.456567, 0.9491281, 0.4569744, 1, 0, 0.454902, 1,
1.462658, -0.3423558, 3.199661, 1, 0, 0.4509804, 1,
1.466832, -0.9617414, 1.167479, 1, 0, 0.4431373, 1,
1.480661, -0.6713259, 1.757024, 1, 0, 0.4392157, 1,
1.487511, 0.572678, 2.212182, 1, 0, 0.4313726, 1,
1.509794, 1.510473, 0.3251111, 1, 0, 0.427451, 1,
1.524834, 0.3499661, -0.06823188, 1, 0, 0.4196078, 1,
1.52931, 0.2197243, 1.891448, 1, 0, 0.4156863, 1,
1.538353, 1.544214, 1.994178, 1, 0, 0.4078431, 1,
1.554538, 0.164105, 1.047477, 1, 0, 0.4039216, 1,
1.565309, -1.5552, 1.630681, 1, 0, 0.3960784, 1,
1.56807, 3.524365, -0.9232052, 1, 0, 0.3882353, 1,
1.602458, 0.8237389, 1.67146, 1, 0, 0.3843137, 1,
1.60633, 0.4234172, 0.03944208, 1, 0, 0.3764706, 1,
1.617408, -0.4114667, 0.4730197, 1, 0, 0.372549, 1,
1.623981, -0.2157137, 1.287929, 1, 0, 0.3647059, 1,
1.629091, -0.3164094, 2.641324, 1, 0, 0.3607843, 1,
1.630253, -0.9836276, 2.324818, 1, 0, 0.3529412, 1,
1.635147, 1.226342, 1.08803, 1, 0, 0.3490196, 1,
1.640419, 0.5715907, 1.348137, 1, 0, 0.3411765, 1,
1.642736, -1.275473, 3.522383, 1, 0, 0.3372549, 1,
1.645671, -0.5325902, -0.004517697, 1, 0, 0.3294118, 1,
1.651271, 0.2835757, 0.2959756, 1, 0, 0.3254902, 1,
1.652138, -0.8012437, 1.538839, 1, 0, 0.3176471, 1,
1.670095, -0.3402454, 2.317993, 1, 0, 0.3137255, 1,
1.672469, 0.9708428, 1.945697, 1, 0, 0.3058824, 1,
1.678954, -0.5616744, 0.7091455, 1, 0, 0.2980392, 1,
1.684834, 0.3114211, 1.355345, 1, 0, 0.2941177, 1,
1.702936, 1.533338, 0.0275283, 1, 0, 0.2862745, 1,
1.707621, -0.4634093, 3.076144, 1, 0, 0.282353, 1,
1.707739, 0.5685642, 0.5859256, 1, 0, 0.2745098, 1,
1.720945, -1.755463, 3.713247, 1, 0, 0.2705882, 1,
1.724624, -0.7904221, 1.838876, 1, 0, 0.2627451, 1,
1.745189, 1.049604, 1.585149, 1, 0, 0.2588235, 1,
1.747839, -0.3365252, 3.291765, 1, 0, 0.2509804, 1,
1.759523, -0.7315381, 1.653905, 1, 0, 0.2470588, 1,
1.776616, -0.1486358, 2.93586, 1, 0, 0.2392157, 1,
1.805348, -0.9530919, 2.06137, 1, 0, 0.2352941, 1,
1.805364, -0.3472213, 3.158384, 1, 0, 0.227451, 1,
1.816112, -0.0867148, 1.103889, 1, 0, 0.2235294, 1,
1.835224, -1.676434, 2.489287, 1, 0, 0.2156863, 1,
1.846194, -0.4727549, 1.923305, 1, 0, 0.2117647, 1,
1.85331, -1.944623, 0.6427297, 1, 0, 0.2039216, 1,
1.859027, -0.1520209, 3.507352, 1, 0, 0.1960784, 1,
1.863606, 0.4663336, 1.525265, 1, 0, 0.1921569, 1,
1.871027, -0.143597, 1.41159, 1, 0, 0.1843137, 1,
1.887854, -1.3191, 1.521735, 1, 0, 0.1803922, 1,
1.906681, -0.8624474, 1.388912, 1, 0, 0.172549, 1,
1.906682, -0.7154967, 1.712243, 1, 0, 0.1686275, 1,
1.91524, 1.111883, -0.5744932, 1, 0, 0.1607843, 1,
1.937187, 0.4767089, 0.3401421, 1, 0, 0.1568628, 1,
1.93973, -0.04990657, 3.343371, 1, 0, 0.1490196, 1,
1.946234, 1.098586, 1.717046, 1, 0, 0.145098, 1,
1.987482, 0.45093, 0.5429369, 1, 0, 0.1372549, 1,
1.997425, -1.226685, 0.2775471, 1, 0, 0.1333333, 1,
2.014236, -1.666596, 1.345319, 1, 0, 0.1254902, 1,
2.039023, -0.1289287, 0.2069775, 1, 0, 0.1215686, 1,
2.082269, -1.196478, 1.830158, 1, 0, 0.1137255, 1,
2.104417, -0.5375355, 0.2688746, 1, 0, 0.1098039, 1,
2.197908, -1.820344, 2.167796, 1, 0, 0.1019608, 1,
2.205848, -1.079769, 0.3819415, 1, 0, 0.09411765, 1,
2.247299, -1.035928, 1.866724, 1, 0, 0.09019608, 1,
2.28511, 0.5342857, 2.000651, 1, 0, 0.08235294, 1,
2.318251, -0.3035074, 1.951355, 1, 0, 0.07843138, 1,
2.341013, 2.237853, -0.2164184, 1, 0, 0.07058824, 1,
2.459604, 0.641003, 2.106283, 1, 0, 0.06666667, 1,
2.462946, 2.485479, 1.905353, 1, 0, 0.05882353, 1,
2.477678, 0.4713944, 3.353229, 1, 0, 0.05490196, 1,
2.554097, 0.7096304, 1.113296, 1, 0, 0.04705882, 1,
2.581275, 1.329376, 1.559157, 1, 0, 0.04313726, 1,
2.697818, 0.03764908, 1.203034, 1, 0, 0.03529412, 1,
2.873871, 0.02986761, 1.316869, 1, 0, 0.03137255, 1,
2.922586, 1.232421, 1.854312, 1, 0, 0.02352941, 1,
2.937112, 1.521212, 0.4632714, 1, 0, 0.01960784, 1,
2.997719, -1.560635, 2.977259, 1, 0, 0.01176471, 1,
3.06918, -2.11448, 2.057271, 1, 0, 0.007843138, 1
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
-0.06678164, -5.132514, -6.988301, 0, -0.5, 0.5, 0.5,
-0.06678164, -5.132514, -6.988301, 1, -0.5, 0.5, 0.5,
-0.06678164, -5.132514, -6.988301, 1, 1.5, 0.5, 0.5,
-0.06678164, -5.132514, -6.988301, 0, 1.5, 0.5, 0.5
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
-4.265834, -0.176738, -6.988301, 0, -0.5, 0.5, 0.5,
-4.265834, -0.176738, -6.988301, 1, -0.5, 0.5, 0.5,
-4.265834, -0.176738, -6.988301, 1, 1.5, 0.5, 0.5,
-4.265834, -0.176738, -6.988301, 0, 1.5, 0.5, 0.5
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
-4.265834, -5.132514, -0.1338525, 0, -0.5, 0.5, 0.5,
-4.265834, -5.132514, -0.1338525, 1, -0.5, 0.5, 0.5,
-4.265834, -5.132514, -0.1338525, 1, 1.5, 0.5, 0.5,
-4.265834, -5.132514, -0.1338525, 0, 1.5, 0.5, 0.5
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
-3, -3.988874, -5.406505,
3, -3.988874, -5.406505,
-3, -3.988874, -5.406505,
-3, -4.179481, -5.670137,
-2, -3.988874, -5.406505,
-2, -4.179481, -5.670137,
-1, -3.988874, -5.406505,
-1, -4.179481, -5.670137,
0, -3.988874, -5.406505,
0, -4.179481, -5.670137,
1, -3.988874, -5.406505,
1, -4.179481, -5.670137,
2, -3.988874, -5.406505,
2, -4.179481, -5.670137,
3, -3.988874, -5.406505,
3, -4.179481, -5.670137
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
-3, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
-3, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
-3, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
-3, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
-2, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
-2, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
-2, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
-2, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
-1, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
-1, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
-1, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
-1, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
0, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
0, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
0, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
0, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
1, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
1, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
1, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
1, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
2, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
2, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
2, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
2, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5,
3, -4.560694, -6.197403, 0, -0.5, 0.5, 0.5,
3, -4.560694, -6.197403, 1, -0.5, 0.5, 0.5,
3, -4.560694, -6.197403, 1, 1.5, 0.5, 0.5,
3, -4.560694, -6.197403, 0, 1.5, 0.5, 0.5
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
-3.296822, -2, -5.406505,
-3.296822, 2, -5.406505,
-3.296822, -2, -5.406505,
-3.458324, -2, -5.670137,
-3.296822, 0, -5.406505,
-3.458324, 0, -5.670137,
-3.296822, 2, -5.406505,
-3.458324, 2, -5.670137
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
"0",
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
-3.781328, -2, -6.197403, 0, -0.5, 0.5, 0.5,
-3.781328, -2, -6.197403, 1, -0.5, 0.5, 0.5,
-3.781328, -2, -6.197403, 1, 1.5, 0.5, 0.5,
-3.781328, -2, -6.197403, 0, 1.5, 0.5, 0.5,
-3.781328, 0, -6.197403, 0, -0.5, 0.5, 0.5,
-3.781328, 0, -6.197403, 1, -0.5, 0.5, 0.5,
-3.781328, 0, -6.197403, 1, 1.5, 0.5, 0.5,
-3.781328, 0, -6.197403, 0, 1.5, 0.5, 0.5,
-3.781328, 2, -6.197403, 0, -0.5, 0.5, 0.5,
-3.781328, 2, -6.197403, 1, -0.5, 0.5, 0.5,
-3.781328, 2, -6.197403, 1, 1.5, 0.5, 0.5,
-3.781328, 2, -6.197403, 0, 1.5, 0.5, 0.5
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
-3.296822, -3.988874, -4,
-3.296822, -3.988874, 4,
-3.296822, -3.988874, -4,
-3.458324, -4.179481, -4,
-3.296822, -3.988874, -2,
-3.458324, -4.179481, -2,
-3.296822, -3.988874, 0,
-3.458324, -4.179481, 0,
-3.296822, -3.988874, 2,
-3.458324, -4.179481, 2,
-3.296822, -3.988874, 4,
-3.458324, -4.179481, 4
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
-3.781328, -4.560694, -4, 0, -0.5, 0.5, 0.5,
-3.781328, -4.560694, -4, 1, -0.5, 0.5, 0.5,
-3.781328, -4.560694, -4, 1, 1.5, 0.5, 0.5,
-3.781328, -4.560694, -4, 0, 1.5, 0.5, 0.5,
-3.781328, -4.560694, -2, 0, -0.5, 0.5, 0.5,
-3.781328, -4.560694, -2, 1, -0.5, 0.5, 0.5,
-3.781328, -4.560694, -2, 1, 1.5, 0.5, 0.5,
-3.781328, -4.560694, -2, 0, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 0, 0, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 0, 1, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 0, 1, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 0, 0, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 2, 0, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 2, 1, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 2, 1, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 2, 0, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 4, 0, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 4, 1, -0.5, 0.5, 0.5,
-3.781328, -4.560694, 4, 1, 1.5, 0.5, 0.5,
-3.781328, -4.560694, 4, 0, 1.5, 0.5, 0.5
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
-3.296822, -3.988874, -5.406505,
-3.296822, 3.635398, -5.406505,
-3.296822, -3.988874, 5.1388,
-3.296822, 3.635398, 5.1388,
-3.296822, -3.988874, -5.406505,
-3.296822, -3.988874, 5.1388,
-3.296822, 3.635398, -5.406505,
-3.296822, 3.635398, 5.1388,
-3.296822, -3.988874, -5.406505,
3.163259, -3.988874, -5.406505,
-3.296822, -3.988874, 5.1388,
3.163259, -3.988874, 5.1388,
-3.296822, 3.635398, -5.406505,
3.163259, 3.635398, -5.406505,
-3.296822, 3.635398, 5.1388,
3.163259, 3.635398, 5.1388,
3.163259, -3.988874, -5.406505,
3.163259, 3.635398, -5.406505,
3.163259, -3.988874, 5.1388,
3.163259, 3.635398, 5.1388,
3.163259, -3.988874, -5.406505,
3.163259, -3.988874, 5.1388,
3.163259, 3.635398, -5.406505,
3.163259, 3.635398, 5.1388
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
var radius = 7.757722;
var distance = 34.51498;
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
mvMatrix.translate( 0.06678164, 0.176738, 0.1338525 );
mvMatrix.scale( 1.298405, 1.100145, 0.7954062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51498);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
3-phenoxybenzenemeth<-read.table("3-phenoxybenzenemeth.xyz")
```

```
## Error in read.table("3-phenoxybenzenemeth.xyz"): no lines available in input
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
-3.202743, 0.9909413, -1.758311, 0, 0, 1, 1, 1,
-3.108981, 0.5821696, -1.990357, 1, 0, 0, 1, 1,
-2.782852, 1.988784, -1.273923, 1, 0, 0, 1, 1,
-2.679295, 0.5117882, -2.648961, 1, 0, 0, 1, 1,
-2.599495, -0.6423125, -0.4291, 1, 0, 0, 1, 1,
-2.544239, -0.3220408, -1.109017, 1, 0, 0, 1, 1,
-2.469851, 0.8332298, -1.237201, 0, 0, 0, 1, 1,
-2.370509, -0.169981, -1.499177, 0, 0, 0, 1, 1,
-2.326044, -0.08983262, -1.519732, 0, 0, 0, 1, 1,
-2.263704, -1.175569, -1.244926, 0, 0, 0, 1, 1,
-2.243026, -0.9117627, -1.518432, 0, 0, 0, 1, 1,
-2.224779, 0.457627, -1.963597, 0, 0, 0, 1, 1,
-2.161909, -0.8281358, 0.5857501, 0, 0, 0, 1, 1,
-2.149233, 0.5507298, -0.8784013, 1, 1, 1, 1, 1,
-2.100507, 0.8095075, -2.94294, 1, 1, 1, 1, 1,
-2.100442, 1.033514, -2.732271, 1, 1, 1, 1, 1,
-2.098897, -0.3245479, -1.014703, 1, 1, 1, 1, 1,
-2.098867, 1.91077, -0.6076086, 1, 1, 1, 1, 1,
-2.070338, -0.8010035, -2.491147, 1, 1, 1, 1, 1,
-2.00357, -1.625902, -0.9082135, 1, 1, 1, 1, 1,
-1.989492, 0.2354731, -1.80093, 1, 1, 1, 1, 1,
-1.970388, -0.2338505, -2.268715, 1, 1, 1, 1, 1,
-1.967085, 1.02124, 1.673223, 1, 1, 1, 1, 1,
-1.96465, 0.8795825, -2.044346, 1, 1, 1, 1, 1,
-1.944938, -1.256437, -2.67607, 1, 1, 1, 1, 1,
-1.942299, -1.317263, -1.734045, 1, 1, 1, 1, 1,
-1.937724, 0.8126675, 0.186742, 1, 1, 1, 1, 1,
-1.911339, 1.233912, -2.196216, 1, 1, 1, 1, 1,
-1.901618, -0.7807555, -0.5227681, 0, 0, 1, 1, 1,
-1.900884, -1.682206, -3.403527, 1, 0, 0, 1, 1,
-1.891536, 1.209588, 0.6453552, 1, 0, 0, 1, 1,
-1.861092, 0.6415287, -2.373413, 1, 0, 0, 1, 1,
-1.834289, 0.2119871, -3.371344, 1, 0, 0, 1, 1,
-1.833404, -0.4230272, -0.8508698, 1, 0, 0, 1, 1,
-1.832675, -0.4141242, -4.061099, 0, 0, 0, 1, 1,
-1.820932, -0.7925396, -1.106806, 0, 0, 0, 1, 1,
-1.811713, -0.4175597, -1.155504, 0, 0, 0, 1, 1,
-1.79737, -0.06185013, -0.8993217, 0, 0, 0, 1, 1,
-1.790878, -0.2922435, -1.19637, 0, 0, 0, 1, 1,
-1.790582, 0.6181344, -1.214347, 0, 0, 0, 1, 1,
-1.785596, 0.2071072, -2.402679, 0, 0, 0, 1, 1,
-1.761029, 0.8225335, -0.8662288, 1, 1, 1, 1, 1,
-1.753118, -0.8587533, -1.384596, 1, 1, 1, 1, 1,
-1.746755, -3.662521, -2.560772, 1, 1, 1, 1, 1,
-1.734306, 2.04968, -0.3940709, 1, 1, 1, 1, 1,
-1.724819, -0.7021634, -1.580483, 1, 1, 1, 1, 1,
-1.721371, -0.3160159, -1.770273, 1, 1, 1, 1, 1,
-1.705433, -0.9890812, -2.022499, 1, 1, 1, 1, 1,
-1.696814, 0.2446542, -0.09080765, 1, 1, 1, 1, 1,
-1.695242, 0.5533453, 1.000228, 1, 1, 1, 1, 1,
-1.679887, -0.7643027, -0.967843, 1, 1, 1, 1, 1,
-1.669269, -0.9018172, -1.792104, 1, 1, 1, 1, 1,
-1.662724, -2.266191, -4.445388, 1, 1, 1, 1, 1,
-1.657562, 0.1323066, -3.710696, 1, 1, 1, 1, 1,
-1.656766, 2.491098, -1.892465, 1, 1, 1, 1, 1,
-1.64861, -0.6529043, -0.8696541, 1, 1, 1, 1, 1,
-1.647084, 0.1806629, -1.143662, 0, 0, 1, 1, 1,
-1.644999, -1.293394, -1.412233, 1, 0, 0, 1, 1,
-1.64449, 0.3111717, -2.270994, 1, 0, 0, 1, 1,
-1.643971, 1.007568, -1.74102, 1, 0, 0, 1, 1,
-1.635046, 0.3473189, -3.216815, 1, 0, 0, 1, 1,
-1.620753, 0.08795332, -0.9583443, 1, 0, 0, 1, 1,
-1.603694, -1.435441, -1.759423, 0, 0, 0, 1, 1,
-1.596377, -0.4982, -0.8497627, 0, 0, 0, 1, 1,
-1.593808, -1.435408, -2.052262, 0, 0, 0, 1, 1,
-1.588423, 0.5633366, -1.447021, 0, 0, 0, 1, 1,
-1.579622, 0.8132826, -3.118703, 0, 0, 0, 1, 1,
-1.547485, -2.012898, -2.589228, 0, 0, 0, 1, 1,
-1.543295, 1.881151, -0.2955761, 0, 0, 0, 1, 1,
-1.540183, 0.9923414, 0.2573043, 1, 1, 1, 1, 1,
-1.538736, 0.7653159, -2.392131, 1, 1, 1, 1, 1,
-1.537554, 0.2647583, -0.365973, 1, 1, 1, 1, 1,
-1.529894, -0.6567606, -2.464153, 1, 1, 1, 1, 1,
-1.490597, 1.020875, 0.1449975, 1, 1, 1, 1, 1,
-1.489524, -0.6323391, -0.03021164, 1, 1, 1, 1, 1,
-1.466426, 0.6452964, -1.007709, 1, 1, 1, 1, 1,
-1.457668, -0.234669, -1.034777, 1, 1, 1, 1, 1,
-1.457424, 1.094093, -1.324979, 1, 1, 1, 1, 1,
-1.457313, -0.7726964, -0.4627956, 1, 1, 1, 1, 1,
-1.451441, -0.9098893, -3.123198, 1, 1, 1, 1, 1,
-1.440563, -0.2998961, 1.296987, 1, 1, 1, 1, 1,
-1.440491, -0.5597291, -1.640065, 1, 1, 1, 1, 1,
-1.433764, 1.095781, -0.8054568, 1, 1, 1, 1, 1,
-1.415967, 0.9469971, -0.1252491, 1, 1, 1, 1, 1,
-1.41589, -0.0754789, -1.714147, 0, 0, 1, 1, 1,
-1.404621, 0.5487617, -1.571923, 1, 0, 0, 1, 1,
-1.399292, 1.089455, -0.3325458, 1, 0, 0, 1, 1,
-1.386564, -0.5176061, -2.407808, 1, 0, 0, 1, 1,
-1.371439, -0.7569199, -1.413955, 1, 0, 0, 1, 1,
-1.364519, -0.3542277, -1.695861, 1, 0, 0, 1, 1,
-1.348205, -0.1829607, -1.88561, 0, 0, 0, 1, 1,
-1.341027, 0.7839074, -0.5932328, 0, 0, 0, 1, 1,
-1.331274, 0.9524479, -0.5371176, 0, 0, 0, 1, 1,
-1.323362, -0.04598411, -0.3856772, 0, 0, 0, 1, 1,
-1.321687, 0.1248375, -2.04248, 0, 0, 0, 1, 1,
-1.31231, -0.4247314, -0.4122388, 0, 0, 0, 1, 1,
-1.311933, 0.784347, -1.277454, 0, 0, 0, 1, 1,
-1.30574, -0.5001806, -1.276612, 1, 1, 1, 1, 1,
-1.302171, 0.5396637, -0.4770898, 1, 1, 1, 1, 1,
-1.298033, 0.1121131, -3.172612, 1, 1, 1, 1, 1,
-1.29735, -0.6475648, -2.729203, 1, 1, 1, 1, 1,
-1.2897, 1.127069, -0.7090845, 1, 1, 1, 1, 1,
-1.280178, 0.4881849, -0.7874261, 1, 1, 1, 1, 1,
-1.262898, 1.193918, -0.2048969, 1, 1, 1, 1, 1,
-1.262395, 2.26984, -0.9016815, 1, 1, 1, 1, 1,
-1.261882, -0.03996298, -3.177728, 1, 1, 1, 1, 1,
-1.261464, 0.08681004, -1.165744, 1, 1, 1, 1, 1,
-1.260839, 1.906657, 0.06601879, 1, 1, 1, 1, 1,
-1.256225, -1.630604, -0.8268415, 1, 1, 1, 1, 1,
-1.247022, 0.8007445, -1.598562, 1, 1, 1, 1, 1,
-1.246913, -0.5130649, -1.679326, 1, 1, 1, 1, 1,
-1.24285, 0.2773033, -1.355635, 1, 1, 1, 1, 1,
-1.241585, 1.54864, -1.082428, 0, 0, 1, 1, 1,
-1.240603, 0.8533487, -2.561437, 1, 0, 0, 1, 1,
-1.239135, -0.4737172, -0.9830253, 1, 0, 0, 1, 1,
-1.231553, -0.9054479, -0.6599509, 1, 0, 0, 1, 1,
-1.217909, -0.957571, -2.070214, 1, 0, 0, 1, 1,
-1.210668, 0.7069053, 0.8505006, 1, 0, 0, 1, 1,
-1.210214, 0.5335529, -0.4106123, 0, 0, 0, 1, 1,
-1.20866, -0.7215627, -1.585935, 0, 0, 0, 1, 1,
-1.208475, -0.3302978, -1.008176, 0, 0, 0, 1, 1,
-1.201679, 1.894217, -0.4057917, 0, 0, 0, 1, 1,
-1.199748, 0.238024, -2.27028, 0, 0, 0, 1, 1,
-1.199281, -1.414454, -1.723212, 0, 0, 0, 1, 1,
-1.197581, 0.2839062, 0.6294995, 0, 0, 0, 1, 1,
-1.196155, -0.1620398, -1.444232, 1, 1, 1, 1, 1,
-1.192675, 1.366595, -0.4881426, 1, 1, 1, 1, 1,
-1.190052, -0.5199835, -1.685547, 1, 1, 1, 1, 1,
-1.185579, 0.5322862, -0.4649019, 1, 1, 1, 1, 1,
-1.177649, -0.772277, -2.852152, 1, 1, 1, 1, 1,
-1.175521, 0.02451866, -1.880267, 1, 1, 1, 1, 1,
-1.167985, 0.2977698, -1.009325, 1, 1, 1, 1, 1,
-1.16765, 0.2370146, -2.422171, 1, 1, 1, 1, 1,
-1.16556, 0.01547075, -0.6584734, 1, 1, 1, 1, 1,
-1.164214, 0.9187, -0.7786129, 1, 1, 1, 1, 1,
-1.162585, -0.4818013, -1.903529, 1, 1, 1, 1, 1,
-1.151629, -0.5981045, -3.976512, 1, 1, 1, 1, 1,
-1.147706, 0.9423187, -0.1268346, 1, 1, 1, 1, 1,
-1.142277, -1.180324, -3.020269, 1, 1, 1, 1, 1,
-1.136028, 0.3654986, -0.4250544, 1, 1, 1, 1, 1,
-1.123042, 1.486867, -1.528795, 0, 0, 1, 1, 1,
-1.118844, -0.007048107, -0.6008974, 1, 0, 0, 1, 1,
-1.112157, -0.56319, -2.335377, 1, 0, 0, 1, 1,
-1.106315, 0.07898534, -1.616933, 1, 0, 0, 1, 1,
-1.102545, 0.3917549, -1.897942, 1, 0, 0, 1, 1,
-1.096203, 1.522748, -0.3168859, 1, 0, 0, 1, 1,
-1.093572, -1.162928, -3.630134, 0, 0, 0, 1, 1,
-1.085852, 0.5745586, -0.5408719, 0, 0, 0, 1, 1,
-1.085703, -0.5138578, -2.377208, 0, 0, 0, 1, 1,
-1.085409, 1.526029, -1.64181, 0, 0, 0, 1, 1,
-1.084776, 0.4608585, -1.995974, 0, 0, 0, 1, 1,
-1.070966, 0.8695635, 0.1877145, 0, 0, 0, 1, 1,
-1.070645, 1.437248, -0.4660518, 0, 0, 0, 1, 1,
-1.065408, -0.2920328, -2.49468, 1, 1, 1, 1, 1,
-1.0627, 0.2056071, -2.495339, 1, 1, 1, 1, 1,
-1.055877, -3.877841, -3.054754, 1, 1, 1, 1, 1,
-1.055257, 0.9976421, -1.665438, 1, 1, 1, 1, 1,
-1.053826, -0.1857648, -2.341587, 1, 1, 1, 1, 1,
-1.050658, 0.4584903, -1.086391, 1, 1, 1, 1, 1,
-1.038262, -0.2811313, -2.347368, 1, 1, 1, 1, 1,
-1.027372, 1.791109, -2.000016, 1, 1, 1, 1, 1,
-1.025909, -0.1649159, -1.726977, 1, 1, 1, 1, 1,
-1.018242, 0.626808, -2.123527, 1, 1, 1, 1, 1,
-1.012979, -0.8959129, -2.037483, 1, 1, 1, 1, 1,
-1.005071, 0.6942118, -1.176405, 1, 1, 1, 1, 1,
-1.000985, -2.024226, -0.4422272, 1, 1, 1, 1, 1,
-0.9901819, 0.01566978, -1.17447, 1, 1, 1, 1, 1,
-0.9869455, -0.5478627, -1.41387, 1, 1, 1, 1, 1,
-0.9857059, -1.077076, -2.407537, 0, 0, 1, 1, 1,
-0.9823245, 0.1723968, 0.05899164, 1, 0, 0, 1, 1,
-0.9760931, 1.037361, 0.03531145, 1, 0, 0, 1, 1,
-0.96274, -0.04264201, -4.524303, 1, 0, 0, 1, 1,
-0.9565167, 0.03808098, -1.01864, 1, 0, 0, 1, 1,
-0.9505915, -1.344279, -1.692499, 1, 0, 0, 1, 1,
-0.9501423, -0.1257006, -3.855549, 0, 0, 0, 1, 1,
-0.9202763, 0.4452373, -0.8529166, 0, 0, 0, 1, 1,
-0.9198902, 0.784244, -1.339771, 0, 0, 0, 1, 1,
-0.9087603, -0.3128071, -3.276782, 0, 0, 0, 1, 1,
-0.9082128, -0.2630666, -1.882056, 0, 0, 0, 1, 1,
-0.9026977, -0.4768652, -2.075483, 0, 0, 0, 1, 1,
-0.9025611, -0.6206356, -1.919842, 0, 0, 0, 1, 1,
-0.8962604, 0.9756884, 0.1165847, 1, 1, 1, 1, 1,
-0.8960415, -2.319172, -2.550951, 1, 1, 1, 1, 1,
-0.893971, -2.625037, -3.333697, 1, 1, 1, 1, 1,
-0.8889271, 0.4491891, -2.390201, 1, 1, 1, 1, 1,
-0.8856123, 0.6150691, -1.735089, 1, 1, 1, 1, 1,
-0.8826122, 0.2333928, -1.846296, 1, 1, 1, 1, 1,
-0.8821989, -1.851325, -2.346132, 1, 1, 1, 1, 1,
-0.8746621, -1.070006, -4.07143, 1, 1, 1, 1, 1,
-0.873549, -1.699064, -1.471178, 1, 1, 1, 1, 1,
-0.8733816, 0.5680955, -1.089667, 1, 1, 1, 1, 1,
-0.8676515, -0.4272484, -5.191454, 1, 1, 1, 1, 1,
-0.8675833, 0.3246088, -0.4743972, 1, 1, 1, 1, 1,
-0.8668723, 2.472531, -1.0263, 1, 1, 1, 1, 1,
-0.8641685, 0.07453651, -1.36629, 1, 1, 1, 1, 1,
-0.8632952, 0.2077567, 1.501188, 1, 1, 1, 1, 1,
-0.8622054, -0.4196289, -3.091843, 0, 0, 1, 1, 1,
-0.8611665, -1.625238, -4.263587, 1, 0, 0, 1, 1,
-0.8600878, 0.5545107, -1.871768, 1, 0, 0, 1, 1,
-0.8586683, -0.6168909, -2.517097, 1, 0, 0, 1, 1,
-0.8584093, -0.4006893, -1.617831, 1, 0, 0, 1, 1,
-0.8577055, 0.3437768, -1.167838, 1, 0, 0, 1, 1,
-0.8508981, -0.1241875, -0.7337781, 0, 0, 0, 1, 1,
-0.8447605, -0.618443, -4.232491, 0, 0, 0, 1, 1,
-0.8439844, 1.285188, -0.1649895, 0, 0, 0, 1, 1,
-0.8436373, -0.237306, -1.965209, 0, 0, 0, 1, 1,
-0.8426309, -0.03723947, -3.027323, 0, 0, 0, 1, 1,
-0.8388377, -0.5168954, -1.969743, 0, 0, 0, 1, 1,
-0.8347514, -0.2133019, -4.712993, 0, 0, 0, 1, 1,
-0.8346849, -0.5428781, -1.440474, 1, 1, 1, 1, 1,
-0.8331659, -0.6369292, -2.423563, 1, 1, 1, 1, 1,
-0.8235269, 0.3714246, -2.342608, 1, 1, 1, 1, 1,
-0.8178601, 0.5222733, -1.530478, 1, 1, 1, 1, 1,
-0.8172493, 0.5310857, -2.665833, 1, 1, 1, 1, 1,
-0.8171877, -0.2323087, -1.127498, 1, 1, 1, 1, 1,
-0.8077757, 1.181849, -0.4606278, 1, 1, 1, 1, 1,
-0.8032365, 0.8423121, -0.2406235, 1, 1, 1, 1, 1,
-0.8030135, -1.637524, -1.900278, 1, 1, 1, 1, 1,
-0.79963, 1.751287, -0.1614839, 1, 1, 1, 1, 1,
-0.7993674, 2.003256, -2.65482, 1, 1, 1, 1, 1,
-0.7977511, -0.09125012, -0.8854348, 1, 1, 1, 1, 1,
-0.7948618, 0.2923033, -0.1596042, 1, 1, 1, 1, 1,
-0.788316, -0.1102743, -0.7616903, 1, 1, 1, 1, 1,
-0.7882453, 1.05878, -0.4452719, 1, 1, 1, 1, 1,
-0.7841271, -0.3677462, -2.455734, 0, 0, 1, 1, 1,
-0.7836721, 1.508601, -1.4237, 1, 0, 0, 1, 1,
-0.7813031, 1.800205, -0.2982183, 1, 0, 0, 1, 1,
-0.7767082, 1.118955, -1.125575, 1, 0, 0, 1, 1,
-0.7737264, -0.9394869, 0.2456483, 1, 0, 0, 1, 1,
-0.7689452, 0.6425239, -0.8443403, 1, 0, 0, 1, 1,
-0.7659282, -1.38435, -3.193342, 0, 0, 0, 1, 1,
-0.7653247, -0.5651097, -5.066636, 0, 0, 0, 1, 1,
-0.7651684, 1.030589, 0.01863529, 0, 0, 0, 1, 1,
-0.7637441, 1.194643, -1.881467, 0, 0, 0, 1, 1,
-0.7584108, -0.2769842, -3.110175, 0, 0, 0, 1, 1,
-0.7579393, 0.02170888, 0.5666107, 0, 0, 0, 1, 1,
-0.7550126, -1.126785, -2.150727, 0, 0, 0, 1, 1,
-0.7532415, -1.936635, -1.392277, 1, 1, 1, 1, 1,
-0.7531629, 1.225546, 0.3929233, 1, 1, 1, 1, 1,
-0.7501166, 0.8059137, 0.4019577, 1, 1, 1, 1, 1,
-0.7450147, -1.37044, -2.202967, 1, 1, 1, 1, 1,
-0.7414078, -2.082057, -2.625445, 1, 1, 1, 1, 1,
-0.7402079, -0.1231485, -0.721688, 1, 1, 1, 1, 1,
-0.7380883, 1.345502, -0.1740802, 1, 1, 1, 1, 1,
-0.7377412, -0.0822529, -1.763051, 1, 1, 1, 1, 1,
-0.735728, -0.2979419, -3.104329, 1, 1, 1, 1, 1,
-0.7339441, 0.345631, -1.315781, 1, 1, 1, 1, 1,
-0.730934, 0.1744977, -2.047555, 1, 1, 1, 1, 1,
-0.7222524, 1.427185, -0.3667313, 1, 1, 1, 1, 1,
-0.713878, 0.4266245, -0.4156329, 1, 1, 1, 1, 1,
-0.7121263, 0.9107563, -1.82474, 1, 1, 1, 1, 1,
-0.7105963, -2.119632, -0.964703, 1, 1, 1, 1, 1,
-0.7082496, -1.111764, -1.295921, 0, 0, 1, 1, 1,
-0.698842, -0.1916887, -1.990066, 1, 0, 0, 1, 1,
-0.6944902, -1.061553, -4.749549, 1, 0, 0, 1, 1,
-0.6854474, -1.60019, -2.434208, 1, 0, 0, 1, 1,
-0.6847304, -0.04715523, -0.9347258, 1, 0, 0, 1, 1,
-0.680335, -0.6871382, -3.231174, 1, 0, 0, 1, 1,
-0.6794331, -1.233643, -2.424181, 0, 0, 0, 1, 1,
-0.6647425, 0.7628247, -1.244107, 0, 0, 0, 1, 1,
-0.6634335, -0.9191397, -3.534418, 0, 0, 0, 1, 1,
-0.6624517, -0.9808845, -3.184084, 0, 0, 0, 1, 1,
-0.6570272, 1.770839, 0.4941534, 0, 0, 0, 1, 1,
-0.6560642, -0.6351832, -2.081286, 0, 0, 0, 1, 1,
-0.6522321, -0.3826881, -1.82115, 0, 0, 0, 1, 1,
-0.6514781, 1.786121, -0.3310821, 1, 1, 1, 1, 1,
-0.6499869, -0.450979, -1.220086, 1, 1, 1, 1, 1,
-0.6483634, -0.04472137, -1.239811, 1, 1, 1, 1, 1,
-0.64646, -0.7532647, -1.842334, 1, 1, 1, 1, 1,
-0.6463455, 0.2816705, -0.9831404, 1, 1, 1, 1, 1,
-0.640377, 1.369367, 0.1538212, 1, 1, 1, 1, 1,
-0.6390363, -0.2713115, -1.711612, 1, 1, 1, 1, 1,
-0.6353864, 0.09178835, -1.154781, 1, 1, 1, 1, 1,
-0.6345307, 1.946994, -0.21669, 1, 1, 1, 1, 1,
-0.6244302, -0.967612, -0.6833922, 1, 1, 1, 1, 1,
-0.6112267, 0.4444292, 0.1422144, 1, 1, 1, 1, 1,
-0.6081489, 0.6214757, -0.6015999, 1, 1, 1, 1, 1,
-0.6076961, -0.865742, -2.497756, 1, 1, 1, 1, 1,
-0.6063802, -0.1661096, -2.352068, 1, 1, 1, 1, 1,
-0.6012669, 1.81764, -1.157765, 1, 1, 1, 1, 1,
-0.6001418, 0.672304, 0.8873674, 0, 0, 1, 1, 1,
-0.5970127, -2.106159, -2.318256, 1, 0, 0, 1, 1,
-0.5964528, -1.928274, -0.4947599, 1, 0, 0, 1, 1,
-0.5936639, 0.9498994, -0.9980434, 1, 0, 0, 1, 1,
-0.5930647, 0.6577852, 0.06453832, 1, 0, 0, 1, 1,
-0.590479, 0.6897433, -1.507768, 1, 0, 0, 1, 1,
-0.588203, -0.5292189, -0.9333441, 0, 0, 0, 1, 1,
-0.5833278, -0.3277005, -2.775973, 0, 0, 0, 1, 1,
-0.5832533, 0.187621, -2.409541, 0, 0, 0, 1, 1,
-0.5811948, -0.3210216, -2.352173, 0, 0, 0, 1, 1,
-0.5776222, 0.8534368, 0.6869606, 0, 0, 0, 1, 1,
-0.5756475, -0.7223625, -1.876343, 0, 0, 0, 1, 1,
-0.5680405, 1.695403, 1.729233, 0, 0, 0, 1, 1,
-0.5661521, -0.4584193, -2.060518, 1, 1, 1, 1, 1,
-0.5650584, 1.151713, 0.02712283, 1, 1, 1, 1, 1,
-0.5645015, -1.14443, -2.721446, 1, 1, 1, 1, 1,
-0.5545927, -0.9749635, -3.237444, 1, 1, 1, 1, 1,
-0.5545384, -0.546073, -2.524095, 1, 1, 1, 1, 1,
-0.5476494, -1.095751, -3.609537, 1, 1, 1, 1, 1,
-0.5470858, -1.678601, -1.46354, 1, 1, 1, 1, 1,
-0.5420422, -0.3273682, -3.00806, 1, 1, 1, 1, 1,
-0.5374787, -1.637789, -3.62407, 1, 1, 1, 1, 1,
-0.5324974, -0.1398434, -1.412496, 1, 1, 1, 1, 1,
-0.5294356, -1.715314, -3.837288, 1, 1, 1, 1, 1,
-0.5277665, -1.030617, -1.630586, 1, 1, 1, 1, 1,
-0.5249664, -1.346136, -0.8543536, 1, 1, 1, 1, 1,
-0.5239543, 0.8000721, -1.177354, 1, 1, 1, 1, 1,
-0.5227733, 1.213709, -0.06567791, 1, 1, 1, 1, 1,
-0.5225282, -0.142236, -2.091879, 0, 0, 1, 1, 1,
-0.5188401, -0.02118723, -2.592669, 1, 0, 0, 1, 1,
-0.5158918, -0.1271547, -1.480547, 1, 0, 0, 1, 1,
-0.5146398, -2.242807, -4.241094, 1, 0, 0, 1, 1,
-0.5061969, -0.2612052, -2.905511, 1, 0, 0, 1, 1,
-0.5026499, 0.8065816, 0.8759091, 1, 0, 0, 1, 1,
-0.5023136, -0.6261412, -2.295803, 0, 0, 0, 1, 1,
-0.5017577, -1.39079, -3.688954, 0, 0, 0, 1, 1,
-0.4974003, 2.495295, 0.6004351, 0, 0, 0, 1, 1,
-0.4952433, -1.146162, -1.461897, 0, 0, 0, 1, 1,
-0.4903773, -0.4581225, -1.746836, 0, 0, 0, 1, 1,
-0.4893776, 0.7179493, -0.616707, 0, 0, 0, 1, 1,
-0.4865409, -1.623606, -1.622278, 0, 0, 0, 1, 1,
-0.4819961, 0.8346766, -2.220143, 1, 1, 1, 1, 1,
-0.4773551, 0.4605581, -0.2136932, 1, 1, 1, 1, 1,
-0.4742072, 0.9067189, 1.496853, 1, 1, 1, 1, 1,
-0.4726872, 0.2373114, -2.61281, 1, 1, 1, 1, 1,
-0.471586, -0.4937979, -1.883197, 1, 1, 1, 1, 1,
-0.4714392, -0.3965721, -2.450406, 1, 1, 1, 1, 1,
-0.4665174, -2.388185, -2.37311, 1, 1, 1, 1, 1,
-0.4613093, 0.3213671, -1.076203, 1, 1, 1, 1, 1,
-0.4569535, 0.6910852, 0.2077762, 1, 1, 1, 1, 1,
-0.4506032, -0.7247297, -2.705334, 1, 1, 1, 1, 1,
-0.4474193, -0.01443979, -1.853307, 1, 1, 1, 1, 1,
-0.4458114, -1.459252, -3.555001, 1, 1, 1, 1, 1,
-0.4454385, 1.613663, -1.037182, 1, 1, 1, 1, 1,
-0.4383139, 1.294813, 0.7416623, 1, 1, 1, 1, 1,
-0.4382031, -0.1135001, -2.248364, 1, 1, 1, 1, 1,
-0.4378649, -1.644086, -1.711865, 0, 0, 1, 1, 1,
-0.4362774, 1.34996, -1.142425, 1, 0, 0, 1, 1,
-0.4318215, -0.1848614, -4.51568, 1, 0, 0, 1, 1,
-0.4309894, 1.985289, 0.2747652, 1, 0, 0, 1, 1,
-0.4277352, -0.917182, -1.78533, 1, 0, 0, 1, 1,
-0.4268611, 1.415891, -1.323519, 1, 0, 0, 1, 1,
-0.4257547, -1.81023, -3.543903, 0, 0, 0, 1, 1,
-0.4253696, 1.349827, 0.2485155, 0, 0, 0, 1, 1,
-0.4183214, 1.29243, -0.7572786, 0, 0, 0, 1, 1,
-0.4099453, 1.544016, -0.4661218, 0, 0, 0, 1, 1,
-0.4064099, 2.066369, -0.9328096, 0, 0, 0, 1, 1,
-0.4017568, 0.8074765, -1.462364, 0, 0, 0, 1, 1,
-0.4014687, 0.003231365, -2.682377, 0, 0, 0, 1, 1,
-0.3989936, -0.834424, -1.263499, 1, 1, 1, 1, 1,
-0.3964828, -2.275128, -3.936113, 1, 1, 1, 1, 1,
-0.3924093, -1.517797, -1.438006, 1, 1, 1, 1, 1,
-0.3912189, -1.072335, -0.9911029, 1, 1, 1, 1, 1,
-0.3881153, -0.5592126, -3.03519, 1, 1, 1, 1, 1,
-0.3862146, -1.995293, -4.203517, 1, 1, 1, 1, 1,
-0.3841912, 0.368055, 0.1227154, 1, 1, 1, 1, 1,
-0.3841314, 0.4917549, -1.990785, 1, 1, 1, 1, 1,
-0.379859, 0.1658457, -0.9133179, 1, 1, 1, 1, 1,
-0.3794095, -0.1097586, -1.305364, 1, 1, 1, 1, 1,
-0.3791889, -0.8185364, -2.857692, 1, 1, 1, 1, 1,
-0.3773619, -0.4958725, -2.851231, 1, 1, 1, 1, 1,
-0.3733081, 0.1481616, 0.8151532, 1, 1, 1, 1, 1,
-0.3699495, 0.00966534, -2.023512, 1, 1, 1, 1, 1,
-0.3681661, 0.2422203, -1.950945, 1, 1, 1, 1, 1,
-0.3672394, 1.791636, -0.7755474, 0, 0, 1, 1, 1,
-0.3648231, 1.119287, -0.1048082, 1, 0, 0, 1, 1,
-0.3647563, 0.04279594, -2.671331, 1, 0, 0, 1, 1,
-0.3642108, -0.327155, -2.470098, 1, 0, 0, 1, 1,
-0.3618098, 1.163919, 0.7491386, 1, 0, 0, 1, 1,
-0.3577289, -0.4633163, -1.991691, 1, 0, 0, 1, 1,
-0.3575954, -1.214983, -1.766854, 0, 0, 0, 1, 1,
-0.3549851, -0.5578299, -0.2696801, 0, 0, 0, 1, 1,
-0.3526171, 0.3345114, -0.003140965, 0, 0, 0, 1, 1,
-0.3488416, -1.06248, -2.993214, 0, 0, 0, 1, 1,
-0.3478653, -1.842163, -2.309792, 0, 0, 0, 1, 1,
-0.3430953, 0.3312011, -0.3086519, 0, 0, 0, 1, 1,
-0.3418736, -0.9131914, -2.106613, 0, 0, 0, 1, 1,
-0.3418412, 0.2445182, -0.2002523, 1, 1, 1, 1, 1,
-0.3387464, -0.1486452, -1.088201, 1, 1, 1, 1, 1,
-0.3301042, -0.8735073, -3.264608, 1, 1, 1, 1, 1,
-0.3285128, 0.07285386, -1.609102, 1, 1, 1, 1, 1,
-0.3270754, 0.604957, 0.3042357, 1, 1, 1, 1, 1,
-0.3268016, -0.3407183, -3.541358, 1, 1, 1, 1, 1,
-0.3258327, 0.1034022, -0.6438357, 1, 1, 1, 1, 1,
-0.3253105, -0.5585355, -2.640565, 1, 1, 1, 1, 1,
-0.3236978, -0.9686031, -2.802807, 1, 1, 1, 1, 1,
-0.323316, 0.002925724, -1.044342, 1, 1, 1, 1, 1,
-0.3233044, -0.3155747, -4.689502, 1, 1, 1, 1, 1,
-0.3221133, -0.01410513, -3.290747, 1, 1, 1, 1, 1,
-0.3207179, 0.1420021, -3.01559, 1, 1, 1, 1, 1,
-0.3198987, -1.873138, -4.585417, 1, 1, 1, 1, 1,
-0.3188223, 2.408463, 1.405646, 1, 1, 1, 1, 1,
-0.3077206, -1.564682, -4.803992, 0, 0, 1, 1, 1,
-0.2963211, 0.08631665, -0.7014281, 1, 0, 0, 1, 1,
-0.295719, 0.1092774, -1.901334, 1, 0, 0, 1, 1,
-0.2939064, -0.2216912, -3.116685, 1, 0, 0, 1, 1,
-0.2876929, -1.721165, -3.410016, 1, 0, 0, 1, 1,
-0.2697158, -0.8589827, -5.044775, 1, 0, 0, 1, 1,
-0.2619545, -1.201584, -2.126469, 0, 0, 0, 1, 1,
-0.2608815, -3.604585, -3.516657, 0, 0, 0, 1, 1,
-0.2546829, 0.5304011, -0.3293713, 0, 0, 0, 1, 1,
-0.253669, -0.830775, -2.940353, 0, 0, 0, 1, 1,
-0.2501295, 0.009248036, -3.931941, 0, 0, 0, 1, 1,
-0.2491053, 0.1376386, -2.947378, 0, 0, 0, 1, 1,
-0.249037, 1.454243, -0.07366018, 0, 0, 0, 1, 1,
-0.2393332, 0.5003314, -2.257658, 1, 1, 1, 1, 1,
-0.2364812, -0.1204597, -2.164318, 1, 1, 1, 1, 1,
-0.2329907, -0.1290201, -1.509539, 1, 1, 1, 1, 1,
-0.228421, 0.9896873, -0.5520061, 1, 1, 1, 1, 1,
-0.2270838, -0.4045633, -1.336579, 1, 1, 1, 1, 1,
-0.2258377, 0.1667066, -1.550672, 1, 1, 1, 1, 1,
-0.2253132, 1.379557, -0.1916505, 1, 1, 1, 1, 1,
-0.2249927, -0.4054125, -2.460484, 1, 1, 1, 1, 1,
-0.2249898, 1.310607, -1.122525, 1, 1, 1, 1, 1,
-0.2242943, 0.2104514, -1.149827, 1, 1, 1, 1, 1,
-0.223397, 0.4473275, -0.9484712, 1, 1, 1, 1, 1,
-0.2180225, 1.133699, -0.9124767, 1, 1, 1, 1, 1,
-0.2162818, 0.3020014, -0.2538093, 1, 1, 1, 1, 1,
-0.2134102, -0.3895838, -2.2063, 1, 1, 1, 1, 1,
-0.2108336, 2.061998, -1.896313, 1, 1, 1, 1, 1,
-0.2103076, -2.545977, -3.397725, 0, 0, 1, 1, 1,
-0.208626, -0.9064208, -5.252933, 1, 0, 0, 1, 1,
-0.1944255, -0.2914098, -1.624523, 1, 0, 0, 1, 1,
-0.1928956, 1.33789, -0.7285787, 1, 0, 0, 1, 1,
-0.1924166, 1.16245, -0.6152053, 1, 0, 0, 1, 1,
-0.1908777, -0.6982993, -2.329935, 1, 0, 0, 1, 1,
-0.1901774, 0.05214271, -0.963097, 0, 0, 0, 1, 1,
-0.1853127, -0.2976831, -1.421354, 0, 0, 0, 1, 1,
-0.1840116, -0.6808282, -3.94381, 0, 0, 0, 1, 1,
-0.1825797, 0.7421731, -2.930506, 0, 0, 0, 1, 1,
-0.1666438, 1.068603, -2.048702, 0, 0, 0, 1, 1,
-0.1659127, -0.1937848, -1.983568, 0, 0, 0, 1, 1,
-0.1630119, 0.3147539, -0.4465432, 0, 0, 0, 1, 1,
-0.1608575, -0.2591258, -2.381399, 1, 1, 1, 1, 1,
-0.1595151, 0.9129221, 1.129372, 1, 1, 1, 1, 1,
-0.1580876, 0.6124483, 0.3139512, 1, 1, 1, 1, 1,
-0.1516668, 0.1468386, -1.31144, 1, 1, 1, 1, 1,
-0.1445227, 0.0223046, 0.01799779, 1, 1, 1, 1, 1,
-0.1420119, 0.1034983, -0.1084891, 1, 1, 1, 1, 1,
-0.1414663, 0.7165523, -0.146883, 1, 1, 1, 1, 1,
-0.1360538, -1.022916, -2.773486, 1, 1, 1, 1, 1,
-0.1348319, -1.254513, -2.729103, 1, 1, 1, 1, 1,
-0.1341705, -0.07107196, -1.975479, 1, 1, 1, 1, 1,
-0.1332086, -0.2218695, -2.879408, 1, 1, 1, 1, 1,
-0.1322356, -0.9371958, -2.313143, 1, 1, 1, 1, 1,
-0.1298615, -0.5821877, -2.926029, 1, 1, 1, 1, 1,
-0.123233, 0.2566217, -1.138176, 1, 1, 1, 1, 1,
-0.1225472, 0.06420746, 0.7759365, 1, 1, 1, 1, 1,
-0.1216684, -0.4710591, -4.475645, 0, 0, 1, 1, 1,
-0.1153034, 0.894978, -1.127418, 1, 0, 0, 1, 1,
-0.1133529, -1.03244, -3.683086, 1, 0, 0, 1, 1,
-0.1123106, -1.198892, -1.747369, 1, 0, 0, 1, 1,
-0.1114671, -1.164881, -3.166176, 1, 0, 0, 1, 1,
-0.109951, -1.555391, -4.101877, 1, 0, 0, 1, 1,
-0.1079365, -0.6602708, -3.846989, 0, 0, 0, 1, 1,
-0.1051077, 0.6970984, -0.02737565, 0, 0, 0, 1, 1,
-0.1026342, -0.2071721, -2.116344, 0, 0, 0, 1, 1,
-0.1009131, 1.50469, -0.1640351, 0, 0, 0, 1, 1,
-0.0959681, 1.990371, 1.286101, 0, 0, 0, 1, 1,
-0.0936218, -0.7098165, -4.577983, 0, 0, 0, 1, 1,
-0.09009206, -0.3215182, -1.742792, 0, 0, 0, 1, 1,
-0.08911429, -0.1635447, -1.459936, 1, 1, 1, 1, 1,
-0.0878849, 0.3636141, -1.107551, 1, 1, 1, 1, 1,
-0.08773264, 0.6340916, -0.5899057, 1, 1, 1, 1, 1,
-0.08444247, 0.4387554, -0.1429764, 1, 1, 1, 1, 1,
-0.08358927, 0.9794744, 0.779388, 1, 1, 1, 1, 1,
-0.08034202, 0.3638472, -1.308456, 1, 1, 1, 1, 1,
-0.07844, 0.6141573, -1.079703, 1, 1, 1, 1, 1,
-0.07710265, -0.8660777, -2.856133, 1, 1, 1, 1, 1,
-0.07633028, 0.203145, -1.629583, 1, 1, 1, 1, 1,
-0.07095457, -1.498252, -3.517527, 1, 1, 1, 1, 1,
-0.07052895, 1.165714, 0.3183548, 1, 1, 1, 1, 1,
-0.07009453, -1.91908, -2.935152, 1, 1, 1, 1, 1,
-0.06238602, -0.2706297, -0.6945887, 1, 1, 1, 1, 1,
-0.06199441, -0.546322, -2.354855, 1, 1, 1, 1, 1,
-0.06118863, -1.531621, -1.982272, 1, 1, 1, 1, 1,
-0.06102096, 0.4957533, -2.09202, 0, 0, 1, 1, 1,
-0.05842937, -0.05998689, -2.911397, 1, 0, 0, 1, 1,
-0.05804856, 0.7667698, 1.211116, 1, 0, 0, 1, 1,
-0.0569521, 0.7366714, -0.366613, 1, 0, 0, 1, 1,
-0.05087257, -0.4104938, -3.206977, 1, 0, 0, 1, 1,
-0.04907215, -0.0807474, -3.462295, 1, 0, 0, 1, 1,
-0.04471847, -0.08007396, -2.207988, 0, 0, 0, 1, 1,
-0.04432944, 1.106082, -0.4804428, 0, 0, 0, 1, 1,
-0.04316092, -0.6145905, -2.179945, 0, 0, 0, 1, 1,
-0.04214736, -0.1860922, -3.830133, 0, 0, 0, 1, 1,
-0.03859597, 0.5400767, 0.06516826, 0, 0, 0, 1, 1,
-0.03432437, -0.3298393, -3.123408, 0, 0, 0, 1, 1,
-0.03313464, -1.569149, -2.101856, 0, 0, 0, 1, 1,
-0.03191699, 0.3589089, -0.5024573, 1, 1, 1, 1, 1,
-0.02757209, 0.2443178, 0.005479109, 1, 1, 1, 1, 1,
-0.02467234, -0.5063327, -1.334639, 1, 1, 1, 1, 1,
-0.0234231, -0.004084696, -3.333943, 1, 1, 1, 1, 1,
-0.02269158, -0.3215209, -2.989079, 1, 1, 1, 1, 1,
-0.02158546, -1.740387, -3.001365, 1, 1, 1, 1, 1,
-0.01900343, 0.154796, 0.03245654, 1, 1, 1, 1, 1,
-0.01859602, 2.375422, 0.4155661, 1, 1, 1, 1, 1,
-0.01819187, -0.1171605, -2.31279, 1, 1, 1, 1, 1,
-0.01766417, 0.1449731, 0.4323969, 1, 1, 1, 1, 1,
-0.008979531, -0.7007111, -3.500441, 1, 1, 1, 1, 1,
-0.008215006, -2.171792, -3.641365, 1, 1, 1, 1, 1,
-0.005688501, 1.177327, -1.699139, 1, 1, 1, 1, 1,
-0.003377517, -0.0877818, -2.953951, 1, 1, 1, 1, 1,
-0.002299573, 0.2764729, -0.4237187, 1, 1, 1, 1, 1,
0.005321005, 0.03428666, -0.1460759, 0, 0, 1, 1, 1,
0.006037049, -1.580637, 2.79125, 1, 0, 0, 1, 1,
0.007455596, -0.5658814, 2.607935, 1, 0, 0, 1, 1,
0.008004028, -0.03126791, 3.303835, 1, 0, 0, 1, 1,
0.01369814, -1.017473, 3.904893, 1, 0, 0, 1, 1,
0.01442656, 0.1466981, 0.1381567, 1, 0, 0, 1, 1,
0.01766697, 0.3596682, -0.1861592, 0, 0, 0, 1, 1,
0.0182709, 0.8009658, -2.18068, 0, 0, 0, 1, 1,
0.0193186, 0.1887193, -0.7491502, 0, 0, 0, 1, 1,
0.0218517, 1.236958, -0.3103591, 0, 0, 0, 1, 1,
0.02614158, 0.2822833, -0.4751513, 0, 0, 0, 1, 1,
0.03037762, -2.231176, 2.957473, 0, 0, 0, 1, 1,
0.03189429, -1.405191, 1.964716, 0, 0, 0, 1, 1,
0.03556245, -0.5255691, 4.724068, 1, 1, 1, 1, 1,
0.03853858, 2.027964, 0.5514901, 1, 1, 1, 1, 1,
0.0404234, 0.6369218, 0.9031341, 1, 1, 1, 1, 1,
0.04066855, 1.283449, -0.08032671, 1, 1, 1, 1, 1,
0.04399251, 1.218283, -0.1996925, 1, 1, 1, 1, 1,
0.04897691, -0.2487129, 3.458713, 1, 1, 1, 1, 1,
0.05352819, -1.96281, 2.785347, 1, 1, 1, 1, 1,
0.05749085, -0.3888487, 2.944326, 1, 1, 1, 1, 1,
0.05912424, 1.307407, -1.170527, 1, 1, 1, 1, 1,
0.06125838, 0.578845, 0.8725899, 1, 1, 1, 1, 1,
0.0618606, -0.7906635, 2.809427, 1, 1, 1, 1, 1,
0.06232695, -0.539196, 2.548034, 1, 1, 1, 1, 1,
0.06266449, -0.9697983, 3.80564, 1, 1, 1, 1, 1,
0.06293179, 0.762518, 0.9572822, 1, 1, 1, 1, 1,
0.07487299, 0.596225, 0.1925696, 1, 1, 1, 1, 1,
0.07740697, -0.2464749, 3.508325, 0, 0, 1, 1, 1,
0.07950208, 1.522307, 0.07734084, 1, 0, 0, 1, 1,
0.0898852, 0.6892985, 0.5934443, 1, 0, 0, 1, 1,
0.09346323, -0.975399, 1.429422, 1, 0, 0, 1, 1,
0.09466998, 0.1591849, -0.9462371, 1, 0, 0, 1, 1,
0.09571083, -2.143976, 2.025878, 1, 0, 0, 1, 1,
0.09615944, 1.234258, -0.958768, 0, 0, 0, 1, 1,
0.09710099, 1.227386, 0.08136258, 0, 0, 0, 1, 1,
0.09737816, 0.7909022, 0.6797205, 0, 0, 0, 1, 1,
0.09816151, -0.3451085, 2.539911, 0, 0, 0, 1, 1,
0.09910116, -0.7911898, 2.458341, 0, 0, 0, 1, 1,
0.09956559, -1.17405, 4.648684, 0, 0, 0, 1, 1,
0.1004952, -0.7040874, 2.087345, 0, 0, 0, 1, 1,
0.1050069, 0.02953725, 1.028278, 1, 1, 1, 1, 1,
0.1058882, -1.210407, 1.641591, 1, 1, 1, 1, 1,
0.1083027, 0.942587, -0.5154857, 1, 1, 1, 1, 1,
0.1086463, -1.052303, 2.175596, 1, 1, 1, 1, 1,
0.1100757, 0.2434443, -0.995407, 1, 1, 1, 1, 1,
0.1131711, 1.027284, -0.1220979, 1, 1, 1, 1, 1,
0.114105, -1.286792, 3.869118, 1, 1, 1, 1, 1,
0.1160391, 1.269572, -0.9040945, 1, 1, 1, 1, 1,
0.1172134, -0.6234692, 2.815474, 1, 1, 1, 1, 1,
0.1247659, -0.2107156, 2.863295, 1, 1, 1, 1, 1,
0.1261535, -0.3262734, 3.696177, 1, 1, 1, 1, 1,
0.1327659, 0.7020741, -0.7421051, 1, 1, 1, 1, 1,
0.1339989, 0.5285283, -0.1818021, 1, 1, 1, 1, 1,
0.1377454, 1.443538, 0.2123951, 1, 1, 1, 1, 1,
0.1390089, -0.656985, 3.262744, 1, 1, 1, 1, 1,
0.1413638, 0.004529627, 1.513727, 0, 0, 1, 1, 1,
0.1426245, 1.649132, 0.5191782, 1, 0, 0, 1, 1,
0.1446138, 0.3049288, -1.077619, 1, 0, 0, 1, 1,
0.1520664, 0.1074104, -1.25838, 1, 0, 0, 1, 1,
0.1525997, -0.7814814, 1.042655, 1, 0, 0, 1, 1,
0.1567215, -0.432707, 3.580883, 1, 0, 0, 1, 1,
0.1590877, 1.262986, -0.4879815, 0, 0, 0, 1, 1,
0.1603994, -3.210631, 4.661933, 0, 0, 0, 1, 1,
0.1612482, 1.23768, 0.4634871, 0, 0, 0, 1, 1,
0.1633531, -1.600456, 3.468658, 0, 0, 0, 1, 1,
0.1639872, 0.8344491, -0.3428941, 0, 0, 0, 1, 1,
0.1725881, 0.7301062, 1.217582, 0, 0, 0, 1, 1,
0.1738658, -0.094757, 2.205307, 0, 0, 0, 1, 1,
0.1758155, -1.156696, 1.960116, 1, 1, 1, 1, 1,
0.1815119, -0.6008314, 1.81785, 1, 1, 1, 1, 1,
0.1855117, 1.590672, 1.91838, 1, 1, 1, 1, 1,
0.1879432, 2.47751, -0.1108822, 1, 1, 1, 1, 1,
0.1903662, 0.2919902, 1.168965, 1, 1, 1, 1, 1,
0.1926113, -0.4970185, 3.128201, 1, 1, 1, 1, 1,
0.1981944, 0.349238, -0.2798807, 1, 1, 1, 1, 1,
0.1988792, 1.051937, -1.384325, 1, 1, 1, 1, 1,
0.2058933, 0.9214467, -0.8984072, 1, 1, 1, 1, 1,
0.2092002, 0.423695, 0.9952357, 1, 1, 1, 1, 1,
0.2093277, 0.325507, -0.6727371, 1, 1, 1, 1, 1,
0.215506, -0.9991153, -0.08967046, 1, 1, 1, 1, 1,
0.2176422, -0.480802, 1.909129, 1, 1, 1, 1, 1,
0.2176506, -0.4848153, 1.556226, 1, 1, 1, 1, 1,
0.2181227, 1.429269, -0.05995104, 1, 1, 1, 1, 1,
0.2195256, -0.4309252, 2.623039, 0, 0, 1, 1, 1,
0.2224, -0.3583631, 2.415175, 1, 0, 0, 1, 1,
0.2228706, -0.9909716, 1.27687, 1, 0, 0, 1, 1,
0.2249046, 0.6268623, -0.1309611, 1, 0, 0, 1, 1,
0.2273271, -2.26019, 4.488198, 1, 0, 0, 1, 1,
0.2283419, -2.712516, 3.190985, 1, 0, 0, 1, 1,
0.234729, -0.8732582, 4.35394, 0, 0, 0, 1, 1,
0.2348647, 0.2618194, 0.9233562, 0, 0, 0, 1, 1,
0.2403161, 0.5231086, 0.03249886, 0, 0, 0, 1, 1,
0.2493458, -0.5259287, 3.275849, 0, 0, 0, 1, 1,
0.249785, -2.159052, 3.465894, 0, 0, 0, 1, 1,
0.2556519, -0.9842637, 3.170668, 0, 0, 0, 1, 1,
0.2642771, 1.854992, -0.6452809, 0, 0, 0, 1, 1,
0.2680018, -1.616084, 3.515534, 1, 1, 1, 1, 1,
0.2700336, 0.2665375, 2.522516, 1, 1, 1, 1, 1,
0.2700628, 1.103741, 0.582965, 1, 1, 1, 1, 1,
0.2701493, -0.6526135, 3.45396, 1, 1, 1, 1, 1,
0.2749356, 0.7567987, 0.4005242, 1, 1, 1, 1, 1,
0.2783343, 0.1305616, -1.95755, 1, 1, 1, 1, 1,
0.2846327, 1.097501, 0.4864749, 1, 1, 1, 1, 1,
0.2920716, 0.9008028, -0.8079754, 1, 1, 1, 1, 1,
0.2993654, -0.6037897, 2.827348, 1, 1, 1, 1, 1,
0.2995068, -0.1432822, 1.954759, 1, 1, 1, 1, 1,
0.3005096, -1.699331, 3.426472, 1, 1, 1, 1, 1,
0.3014746, -0.6476042, 2.642252, 1, 1, 1, 1, 1,
0.3046303, -0.9096837, 3.232471, 1, 1, 1, 1, 1,
0.3076743, -0.1738233, 2.436979, 1, 1, 1, 1, 1,
0.307686, 1.142612, -0.3565594, 1, 1, 1, 1, 1,
0.308669, 0.3895838, 0.3860289, 0, 0, 1, 1, 1,
0.3087723, -0.1469654, 1.049517, 1, 0, 0, 1, 1,
0.308817, -0.4275872, 2.921063, 1, 0, 0, 1, 1,
0.3097297, 0.3949653, 0.6263165, 1, 0, 0, 1, 1,
0.3100371, 0.1283766, 2.448135, 1, 0, 0, 1, 1,
0.3154871, -0.8204317, 3.46633, 1, 0, 0, 1, 1,
0.3185373, -1.359452, 3.890358, 0, 0, 0, 1, 1,
0.3187973, 0.7989235, 0.2073778, 0, 0, 0, 1, 1,
0.3189251, 0.9393998, 0.3701022, 0, 0, 0, 1, 1,
0.3203393, -1.023461, 2.690685, 0, 0, 0, 1, 1,
0.3219551, 1.503238, -0.369258, 0, 0, 0, 1, 1,
0.3219914, 0.4303628, 0.7226468, 0, 0, 0, 1, 1,
0.3232002, -0.6415802, 2.578098, 0, 0, 0, 1, 1,
0.3248449, -0.4997576, 2.040812, 1, 1, 1, 1, 1,
0.3279929, 1.060107, -0.1788961, 1, 1, 1, 1, 1,
0.3290524, 0.344243, 1.838604, 1, 1, 1, 1, 1,
0.3310978, 0.07911123, 1.683977, 1, 1, 1, 1, 1,
0.3436007, 2.003807, 1.265026, 1, 1, 1, 1, 1,
0.3438851, -0.9297248, 3.948927, 1, 1, 1, 1, 1,
0.3439058, 0.04064922, 2.303337, 1, 1, 1, 1, 1,
0.3440224, -0.336403, 2.992246, 1, 1, 1, 1, 1,
0.3494049, 1.200811, -0.1237189, 1, 1, 1, 1, 1,
0.3523861, 0.342702, 2.316996, 1, 1, 1, 1, 1,
0.3528867, 0.1553802, 0.84378, 1, 1, 1, 1, 1,
0.3529478, 1.309161, -0.2539595, 1, 1, 1, 1, 1,
0.3530347, -0.8459979, 3.380184, 1, 1, 1, 1, 1,
0.353118, 1.502362, -0.927354, 1, 1, 1, 1, 1,
0.3544146, 0.3724386, -1.111571, 1, 1, 1, 1, 1,
0.3549314, -0.3514154, 2.081883, 0, 0, 1, 1, 1,
0.3563478, 0.1611261, 0.1091888, 1, 0, 0, 1, 1,
0.3603606, 1.055123, 1.506296, 1, 0, 0, 1, 1,
0.3615153, -0.01995696, 1.195762, 1, 0, 0, 1, 1,
0.3684283, -1.725816, 2.497103, 1, 0, 0, 1, 1,
0.3739165, -0.6999915, 3.047591, 1, 0, 0, 1, 1,
0.3783552, 0.9613591, -0.07975081, 0, 0, 0, 1, 1,
0.3787644, 2.067403, -0.2271365, 0, 0, 0, 1, 1,
0.3838592, 0.897081, 0.5938184, 0, 0, 0, 1, 1,
0.3838757, 0.2647223, 0.9408768, 0, 0, 0, 1, 1,
0.3880242, -0.07815987, 2.072808, 0, 0, 0, 1, 1,
0.388489, -0.009117861, 0.7093186, 0, 0, 0, 1, 1,
0.3908665, 1.195162, -0.2834345, 0, 0, 0, 1, 1,
0.3922872, -1.787124, 2.21125, 1, 1, 1, 1, 1,
0.3930104, -1.789551, 1.295506, 1, 1, 1, 1, 1,
0.3950934, 0.4219076, 0.2102257, 1, 1, 1, 1, 1,
0.3981636, 2.747473, -1.877559, 1, 1, 1, 1, 1,
0.3991681, 0.5571308, -0.6141217, 1, 1, 1, 1, 1,
0.4016358, -0.3899381, 1.58904, 1, 1, 1, 1, 1,
0.4030133, 0.5507997, 0.5345531, 1, 1, 1, 1, 1,
0.404137, 1.202432, 0.9093832, 1, 1, 1, 1, 1,
0.405598, -1.610372, 3.035859, 1, 1, 1, 1, 1,
0.41291, 0.8551529, 1.448442, 1, 1, 1, 1, 1,
0.4157135, 0.2902586, 0.1825194, 1, 1, 1, 1, 1,
0.4172875, -1.234461, 2.106955, 1, 1, 1, 1, 1,
0.419346, -0.677413, 1.758669, 1, 1, 1, 1, 1,
0.4193494, -1.723269, 2.791463, 1, 1, 1, 1, 1,
0.4205115, -0.1502044, 2.204072, 1, 1, 1, 1, 1,
0.4222729, 1.262523, -0.3395822, 0, 0, 1, 1, 1,
0.4249924, -0.529642, 2.365438, 1, 0, 0, 1, 1,
0.4272163, 0.1928478, 1.993611, 1, 0, 0, 1, 1,
0.4281899, -1.018561, 1.892176, 1, 0, 0, 1, 1,
0.4284721, 1.601834, -1.994599, 1, 0, 0, 1, 1,
0.4293192, -0.06453425, 2.355187, 1, 0, 0, 1, 1,
0.4319924, 0.03494035, 2.135078, 0, 0, 0, 1, 1,
0.4322354, 0.9964736, -0.5318759, 0, 0, 0, 1, 1,
0.4329975, 0.08791091, 0.1441171, 0, 0, 0, 1, 1,
0.4369668, -0.5423803, 3.439558, 0, 0, 0, 1, 1,
0.4375774, 0.6988445, 1.566552, 0, 0, 0, 1, 1,
0.4406842, 0.2703261, 1.324541, 0, 0, 0, 1, 1,
0.4431544, -1.26705, 3.605946, 0, 0, 0, 1, 1,
0.4500524, 0.6686885, -0.1298688, 1, 1, 1, 1, 1,
0.4548862, -0.7352704, 2.741792, 1, 1, 1, 1, 1,
0.4551669, 0.6781551, -0.1567992, 1, 1, 1, 1, 1,
0.4575289, -0.1377911, 1.81617, 1, 1, 1, 1, 1,
0.4603229, 0.1630398, 2.298675, 1, 1, 1, 1, 1,
0.4615099, -0.5717849, 0.7377009, 1, 1, 1, 1, 1,
0.4675545, -0.6620107, 2.525073, 1, 1, 1, 1, 1,
0.4711903, 0.8698951, 1.430603, 1, 1, 1, 1, 1,
0.4768665, -1.404682, 3.575867, 1, 1, 1, 1, 1,
0.4796943, -0.1775376, 3.03985, 1, 1, 1, 1, 1,
0.480443, -1.44989, 2.922654, 1, 1, 1, 1, 1,
0.4826357, 0.2691091, 0.7491534, 1, 1, 1, 1, 1,
0.4832335, -1.320801, 2.400803, 1, 1, 1, 1, 1,
0.4863729, 0.5314811, 0.7250041, 1, 1, 1, 1, 1,
0.4888257, -1.17089, 1.540928, 1, 1, 1, 1, 1,
0.4889745, -0.008286208, 1.02843, 0, 0, 1, 1, 1,
0.4931739, -0.2754667, 4.479489, 1, 0, 0, 1, 1,
0.4937679, 0.4163449, 1.171126, 1, 0, 0, 1, 1,
0.4944828, 0.1593857, 1.463089, 1, 0, 0, 1, 1,
0.495006, -0.6368459, 2.973781, 1, 0, 0, 1, 1,
0.4957175, 0.02471707, 0.0335878, 1, 0, 0, 1, 1,
0.49718, -0.2959662, 1.840893, 0, 0, 0, 1, 1,
0.5061669, -0.7344908, 0.7498321, 0, 0, 0, 1, 1,
0.5066023, 0.8362324, -0.3501584, 0, 0, 0, 1, 1,
0.5092882, -0.6865135, 3.21481, 0, 0, 0, 1, 1,
0.5128943, 0.937717, 0.112461, 0, 0, 0, 1, 1,
0.5143838, -0.3186227, 2.25207, 0, 0, 0, 1, 1,
0.5161725, -0.3077632, 1.086355, 0, 0, 0, 1, 1,
0.5178475, 0.9469457, -0.7807969, 1, 1, 1, 1, 1,
0.5178704, 0.5232305, 0.8325519, 1, 1, 1, 1, 1,
0.5188966, 0.6190352, 0.9904242, 1, 1, 1, 1, 1,
0.5191858, 1.311168, 0.2960091, 1, 1, 1, 1, 1,
0.5259056, 0.4555158, 2.000975, 1, 1, 1, 1, 1,
0.5268188, 0.4644392, 0.1648319, 1, 1, 1, 1, 1,
0.528393, 0.5450407, 1.831719, 1, 1, 1, 1, 1,
0.5367967, 1.502576, -0.2256544, 1, 1, 1, 1, 1,
0.5405154, -0.3558562, 3.031209, 1, 1, 1, 1, 1,
0.5429552, -0.4762841, 3.370513, 1, 1, 1, 1, 1,
0.5452045, 0.1608416, 0.5257996, 1, 1, 1, 1, 1,
0.5529615, -0.803081, 3.579277, 1, 1, 1, 1, 1,
0.5574856, -1.094595, 3.967755, 1, 1, 1, 1, 1,
0.5579752, -0.2913909, 2.44552, 1, 1, 1, 1, 1,
0.5608094, -2.296888, 0.731335, 1, 1, 1, 1, 1,
0.5653918, -0.6204128, 0.7026281, 0, 0, 1, 1, 1,
0.5769929, 0.08289051, 1.583939, 1, 0, 0, 1, 1,
0.5843491, 1.921184, -1.519004, 1, 0, 0, 1, 1,
0.5851535, -0.5551356, 3.728879, 1, 0, 0, 1, 1,
0.5878627, -0.2023109, 1.431075, 1, 0, 0, 1, 1,
0.5898401, 0.3454602, 3.629286, 1, 0, 0, 1, 1,
0.5910459, -0.6073787, 2.834594, 0, 0, 0, 1, 1,
0.5914242, -0.1991053, 2.615002, 0, 0, 0, 1, 1,
0.591577, -2.662134, 3.534342, 0, 0, 0, 1, 1,
0.5932944, -0.03248134, 2.300403, 0, 0, 0, 1, 1,
0.5965101, -1.154287, 2.447657, 0, 0, 0, 1, 1,
0.59692, 0.7102226, -1.813704, 0, 0, 0, 1, 1,
0.5973114, -0.8609133, 1.951269, 0, 0, 0, 1, 1,
0.6102601, 1.515485, -0.007422408, 1, 1, 1, 1, 1,
0.6139449, -1.206155, 3.89355, 1, 1, 1, 1, 1,
0.6234888, 0.574648, 3.114036, 1, 1, 1, 1, 1,
0.6308355, -0.2841383, 2.189683, 1, 1, 1, 1, 1,
0.6335546, -0.1330518, 1.861499, 1, 1, 1, 1, 1,
0.6342341, 0.2243793, 3.101329, 1, 1, 1, 1, 1,
0.6347854, 0.1047589, 1.686012, 1, 1, 1, 1, 1,
0.6352045, -3.640698, 1.171759, 1, 1, 1, 1, 1,
0.6370821, -0.1760984, 1.123881, 1, 1, 1, 1, 1,
0.6436865, 0.8484375, 0.8814178, 1, 1, 1, 1, 1,
0.6462174, 1.661558, 0.2819904, 1, 1, 1, 1, 1,
0.6480979, 0.1231002, 2.502758, 1, 1, 1, 1, 1,
0.6488367, -1.26992, 2.125337, 1, 1, 1, 1, 1,
0.6523578, 1.977086, 0.3933503, 1, 1, 1, 1, 1,
0.6541587, -0.8721119, 1.950882, 1, 1, 1, 1, 1,
0.6577219, 0.328429, 1.551999, 0, 0, 1, 1, 1,
0.6607587, -0.4414168, 2.961596, 1, 0, 0, 1, 1,
0.6634423, -0.4058125, 3.007148, 1, 0, 0, 1, 1,
0.6665576, -0.06563752, 3.929569, 1, 0, 0, 1, 1,
0.6742457, -0.6776357, 1.742736, 1, 0, 0, 1, 1,
0.6751475, -1.090936, 3.091743, 1, 0, 0, 1, 1,
0.6756792, 0.4773061, -0.06059903, 0, 0, 0, 1, 1,
0.6758958, 0.7945268, 0.3053815, 0, 0, 0, 1, 1,
0.6761433, -0.6693605, 2.268747, 0, 0, 0, 1, 1,
0.678335, 1.45262, -0.5053924, 0, 0, 0, 1, 1,
0.6783915, 0.7701125, 0.01785682, 0, 0, 0, 1, 1,
0.6821954, 1.05008, 0.5533162, 0, 0, 0, 1, 1,
0.6828103, 0.3324441, 1.856295, 0, 0, 0, 1, 1,
0.6846869, 1.420267, 0.1905161, 1, 1, 1, 1, 1,
0.6867509, 0.5152207, 1.032245, 1, 1, 1, 1, 1,
0.7119905, -1.461191, 2.989269, 1, 1, 1, 1, 1,
0.7126889, 0.7626462, 1.91827, 1, 1, 1, 1, 1,
0.7187831, -1.143988, 3.547044, 1, 1, 1, 1, 1,
0.7200381, -1.464272, 0.8864955, 1, 1, 1, 1, 1,
0.7226678, -1.417656, 1.995154, 1, 1, 1, 1, 1,
0.729284, 0.1771211, 1.661663, 1, 1, 1, 1, 1,
0.732475, 0.5371393, -0.2291049, 1, 1, 1, 1, 1,
0.7348287, 1.034215, -0.3875332, 1, 1, 1, 1, 1,
0.7359493, -0.1512691, 2.514266, 1, 1, 1, 1, 1,
0.7361287, -0.3213685, 0.8522552, 1, 1, 1, 1, 1,
0.7371637, 0.4717955, 1.109855, 1, 1, 1, 1, 1,
0.7374719, 1.895877, 1.886655, 1, 1, 1, 1, 1,
0.7392696, -1.270243, 1.306154, 1, 1, 1, 1, 1,
0.7487589, 2.462276, 0.7493577, 0, 0, 1, 1, 1,
0.749008, -0.5685632, 2.524981, 1, 0, 0, 1, 1,
0.7601834, -0.7429972, 2.161817, 1, 0, 0, 1, 1,
0.7673072, -1.280152, 4.040796, 1, 0, 0, 1, 1,
0.7703968, 0.2650364, 2.014175, 1, 0, 0, 1, 1,
0.7782972, 0.6970255, 1.372118, 1, 0, 0, 1, 1,
0.7816386, 0.3423499, 1.233875, 0, 0, 0, 1, 1,
0.7861325, -0.3816297, 3.200015, 0, 0, 0, 1, 1,
0.7981232, 0.600861, 0.3984179, 0, 0, 0, 1, 1,
0.8020067, 1.019281, 0.9534301, 0, 0, 0, 1, 1,
0.8080217, 1.809715, 0.5294418, 0, 0, 0, 1, 1,
0.8093018, -0.08600572, 1.138947, 0, 0, 0, 1, 1,
0.8136277, 1.133927, 1.174334, 0, 0, 0, 1, 1,
0.8168168, 0.1826442, 1.337673, 1, 1, 1, 1, 1,
0.8169544, 1.276314, -0.8263133, 1, 1, 1, 1, 1,
0.8309585, -0.9331638, 1.670512, 1, 1, 1, 1, 1,
0.8320035, -0.8986331, 3.358798, 1, 1, 1, 1, 1,
0.8364077, -0.6612021, 0.1506313, 1, 1, 1, 1, 1,
0.8366337, -0.6518077, 1.354559, 1, 1, 1, 1, 1,
0.8380144, 1.045674, -0.1780249, 1, 1, 1, 1, 1,
0.8420057, 2.914798, 0.1066654, 1, 1, 1, 1, 1,
0.8440068, 0.6371372, 0.891802, 1, 1, 1, 1, 1,
0.8447383, -1.38596, 1.91037, 1, 1, 1, 1, 1,
0.8448628, 0.5989538, 0.9962568, 1, 1, 1, 1, 1,
0.8466831, 1.667936, -1.397834, 1, 1, 1, 1, 1,
0.8486645, 1.870394, -1.77555, 1, 1, 1, 1, 1,
0.8496762, -0.163624, 2.144649, 1, 1, 1, 1, 1,
0.8565491, -0.2189009, 3.225949, 1, 1, 1, 1, 1,
0.8573444, 1.280048, -1.626791, 0, 0, 1, 1, 1,
0.8579091, -0.3160563, 3.431351, 1, 0, 0, 1, 1,
0.8585573, -0.09369688, 2.333709, 1, 0, 0, 1, 1,
0.8610514, 0.1648724, 1.074174, 1, 0, 0, 1, 1,
0.8659899, -0.4662558, 0.773445, 1, 0, 0, 1, 1,
0.8708853, 0.5358993, 0.9726372, 1, 0, 0, 1, 1,
0.8715028, 1.092163, -0.155207, 0, 0, 0, 1, 1,
0.8716449, 0.135847, -0.2838795, 0, 0, 0, 1, 1,
0.8717127, 0.2155042, 0.8182233, 0, 0, 0, 1, 1,
0.8722223, -1.663105, 2.753572, 0, 0, 0, 1, 1,
0.8732269, 1.361472, 0.1510303, 0, 0, 0, 1, 1,
0.8800259, -0.4468813, 1.281542, 0, 0, 0, 1, 1,
0.8821129, 0.4207546, 2.062955, 0, 0, 0, 1, 1,
0.8899292, 0.08539595, 0.949499, 1, 1, 1, 1, 1,
0.8954491, 0.04420885, -0.3788356, 1, 1, 1, 1, 1,
0.8973598, -0.8045759, 1.562243, 1, 1, 1, 1, 1,
0.90865, 0.09931381, 1.131774, 1, 1, 1, 1, 1,
0.9106781, 0.4906044, 1.045761, 1, 1, 1, 1, 1,
0.9207032, -0.2861718, 1.955643, 1, 1, 1, 1, 1,
0.9300402, 0.7434953, 1.290368, 1, 1, 1, 1, 1,
0.9322426, -1.581139, 3.203221, 1, 1, 1, 1, 1,
0.9324039, -1.086913, 3.333984, 1, 1, 1, 1, 1,
0.9333211, -1.4164, 2.346473, 1, 1, 1, 1, 1,
0.9334399, 0.9639435, 2.157372, 1, 1, 1, 1, 1,
0.9357359, 0.9232118, -0.009030568, 1, 1, 1, 1, 1,
0.9359838, -0.05753177, 1.640225, 1, 1, 1, 1, 1,
0.9389035, -1.264564, 2.023785, 1, 1, 1, 1, 1,
0.9496431, -0.1256418, 1.763747, 1, 1, 1, 1, 1,
0.9531432, -1.495353, 3.425508, 0, 0, 1, 1, 1,
0.9585533, 0.4108596, 0.9349841, 1, 0, 0, 1, 1,
0.9630457, 0.7032256, 0.5926534, 1, 0, 0, 1, 1,
0.9694213, -0.9310858, 2.47723, 1, 0, 0, 1, 1,
0.9747926, -1.607525, 2.568413, 1, 0, 0, 1, 1,
0.9751825, -1.052257, 2.340603, 1, 0, 0, 1, 1,
0.9761311, 0.1679513, 3.167785, 0, 0, 0, 1, 1,
0.9790081, -0.1959594, 1.648951, 0, 0, 0, 1, 1,
0.9848284, -0.1139302, 0.9654182, 0, 0, 0, 1, 1,
0.9968969, -0.2764696, 1.739177, 0, 0, 0, 1, 1,
0.9980155, -1.788867, 2.926522, 0, 0, 0, 1, 1,
1.009994, -0.17457, 2.019449, 0, 0, 0, 1, 1,
1.013967, -1.796631, 3.189335, 0, 0, 0, 1, 1,
1.01496, -1.17884, 2.082202, 1, 1, 1, 1, 1,
1.021792, -0.135081, 4.985228, 1, 1, 1, 1, 1,
1.021793, 0.5786839, -0.4034615, 1, 1, 1, 1, 1,
1.041358, -0.1896857, 2.892449, 1, 1, 1, 1, 1,
1.041978, -0.8573298, 2.634364, 1, 1, 1, 1, 1,
1.044145, 0.8514949, 1.684074, 1, 1, 1, 1, 1,
1.06356, 0.3179129, -0.457543, 1, 1, 1, 1, 1,
1.064232, -0.9154245, 1.140726, 1, 1, 1, 1, 1,
1.089949, -0.7065251, 2.310464, 1, 1, 1, 1, 1,
1.090358, -0.1900395, 1.183982, 1, 1, 1, 1, 1,
1.090546, -0.5117869, 1.54439, 1, 1, 1, 1, 1,
1.092287, 0.3073429, 1.336437, 1, 1, 1, 1, 1,
1.092446, 1.196713, 0.2230818, 1, 1, 1, 1, 1,
1.096059, 0.7266785, 1.243443, 1, 1, 1, 1, 1,
1.099836, -0.6375705, 2.016871, 1, 1, 1, 1, 1,
1.100585, 2.629928, 1.837896, 0, 0, 1, 1, 1,
1.101236, 0.5025848, 0.6261995, 1, 0, 0, 1, 1,
1.102385, -1.309483, 2.920826, 1, 0, 0, 1, 1,
1.104612, 2.636024, 0.1110094, 1, 0, 0, 1, 1,
1.118986, 2.22668, -0.0779024, 1, 0, 0, 1, 1,
1.11967, 1.592308, -0.4281147, 1, 0, 0, 1, 1,
1.12532, 2.608735, 0.04193959, 0, 0, 0, 1, 1,
1.129236, -0.3870078, 2.112752, 0, 0, 0, 1, 1,
1.145507, -1.137261, 1.600177, 0, 0, 0, 1, 1,
1.147627, 0.123634, 0.8844017, 0, 0, 0, 1, 1,
1.153179, -0.6381906, 2.592073, 0, 0, 0, 1, 1,
1.16043, 0.8486165, 1.687169, 0, 0, 0, 1, 1,
1.1648, -0.8039533, 2.391465, 0, 0, 0, 1, 1,
1.174598, -0.1658084, 0.5699232, 1, 1, 1, 1, 1,
1.176609, -0.9987819, 2.195273, 1, 1, 1, 1, 1,
1.1795, 0.1315377, 3.166009, 1, 1, 1, 1, 1,
1.190111, -1.388724, 4.339692, 1, 1, 1, 1, 1,
1.201043, -3.271513, 3.717705, 1, 1, 1, 1, 1,
1.210072, 0.3242994, 1.021098, 1, 1, 1, 1, 1,
1.239417, -2.410015, 3.721472, 1, 1, 1, 1, 1,
1.250281, -0.9282466, 4.577686, 1, 1, 1, 1, 1,
1.25055, 1.114126, 1.868632, 1, 1, 1, 1, 1,
1.256769, 2.992278, -0.04446298, 1, 1, 1, 1, 1,
1.267604, -0.004479604, 1.521101, 1, 1, 1, 1, 1,
1.279884, 1.292481, -1.249783, 1, 1, 1, 1, 1,
1.290833, 0.1198746, 2.256798, 1, 1, 1, 1, 1,
1.294401, -1.022343, 3.634638, 1, 1, 1, 1, 1,
1.29629, 2.143904, 1.52883, 1, 1, 1, 1, 1,
1.299791, 1.534525, 1.684972, 0, 0, 1, 1, 1,
1.302829, -0.231983, 1.095388, 1, 0, 0, 1, 1,
1.303159, 1.366, 1.391794, 1, 0, 0, 1, 1,
1.303376, 1.080049, 0.4748487, 1, 0, 0, 1, 1,
1.303523, 2.448336, -1.391542, 1, 0, 0, 1, 1,
1.326037, -0.8969972, 2.364589, 1, 0, 0, 1, 1,
1.336696, 0.7015545, 1.725194, 0, 0, 0, 1, 1,
1.340887, 0.6954265, 0.2486959, 0, 0, 0, 1, 1,
1.347159, -1.77719, 0.7310415, 0, 0, 0, 1, 1,
1.348928, -0.4452012, 1.497082, 0, 0, 0, 1, 1,
1.349276, 2.191819, 2.552673, 0, 0, 0, 1, 1,
1.357057, 0.1791869, 1.623924, 0, 0, 0, 1, 1,
1.360298, 1.708802, 1.063351, 0, 0, 0, 1, 1,
1.368703, 0.4264021, 1.426585, 1, 1, 1, 1, 1,
1.386477, 1.431438, 0.874148, 1, 1, 1, 1, 1,
1.393104, 0.1981963, 2.32146, 1, 1, 1, 1, 1,
1.400962, 0.1425678, 0.5638996, 1, 1, 1, 1, 1,
1.401779, -0.003108795, 2.404261, 1, 1, 1, 1, 1,
1.40253, -0.9309722, 0.6466808, 1, 1, 1, 1, 1,
1.407678, -0.02581329, 0.7517933, 1, 1, 1, 1, 1,
1.415855, 0.5771316, -1.251015, 1, 1, 1, 1, 1,
1.419549, -0.03477943, 0.8523026, 1, 1, 1, 1, 1,
1.427522, 0.8311246, 0.7652369, 1, 1, 1, 1, 1,
1.435437, -1.611314, 2.317556, 1, 1, 1, 1, 1,
1.43953, -2.107143, 1.598593, 1, 1, 1, 1, 1,
1.439995, -0.4495166, 1.90612, 1, 1, 1, 1, 1,
1.442354, -0.4880591, 1.323328, 1, 1, 1, 1, 1,
1.447731, -0.1743169, 1.910033, 1, 1, 1, 1, 1,
1.456567, 0.9491281, 0.4569744, 0, 0, 1, 1, 1,
1.462658, -0.3423558, 3.199661, 1, 0, 0, 1, 1,
1.466832, -0.9617414, 1.167479, 1, 0, 0, 1, 1,
1.480661, -0.6713259, 1.757024, 1, 0, 0, 1, 1,
1.487511, 0.572678, 2.212182, 1, 0, 0, 1, 1,
1.509794, 1.510473, 0.3251111, 1, 0, 0, 1, 1,
1.524834, 0.3499661, -0.06823188, 0, 0, 0, 1, 1,
1.52931, 0.2197243, 1.891448, 0, 0, 0, 1, 1,
1.538353, 1.544214, 1.994178, 0, 0, 0, 1, 1,
1.554538, 0.164105, 1.047477, 0, 0, 0, 1, 1,
1.565309, -1.5552, 1.630681, 0, 0, 0, 1, 1,
1.56807, 3.524365, -0.9232052, 0, 0, 0, 1, 1,
1.602458, 0.8237389, 1.67146, 0, 0, 0, 1, 1,
1.60633, 0.4234172, 0.03944208, 1, 1, 1, 1, 1,
1.617408, -0.4114667, 0.4730197, 1, 1, 1, 1, 1,
1.623981, -0.2157137, 1.287929, 1, 1, 1, 1, 1,
1.629091, -0.3164094, 2.641324, 1, 1, 1, 1, 1,
1.630253, -0.9836276, 2.324818, 1, 1, 1, 1, 1,
1.635147, 1.226342, 1.08803, 1, 1, 1, 1, 1,
1.640419, 0.5715907, 1.348137, 1, 1, 1, 1, 1,
1.642736, -1.275473, 3.522383, 1, 1, 1, 1, 1,
1.645671, -0.5325902, -0.004517697, 1, 1, 1, 1, 1,
1.651271, 0.2835757, 0.2959756, 1, 1, 1, 1, 1,
1.652138, -0.8012437, 1.538839, 1, 1, 1, 1, 1,
1.670095, -0.3402454, 2.317993, 1, 1, 1, 1, 1,
1.672469, 0.9708428, 1.945697, 1, 1, 1, 1, 1,
1.678954, -0.5616744, 0.7091455, 1, 1, 1, 1, 1,
1.684834, 0.3114211, 1.355345, 1, 1, 1, 1, 1,
1.702936, 1.533338, 0.0275283, 0, 0, 1, 1, 1,
1.707621, -0.4634093, 3.076144, 1, 0, 0, 1, 1,
1.707739, 0.5685642, 0.5859256, 1, 0, 0, 1, 1,
1.720945, -1.755463, 3.713247, 1, 0, 0, 1, 1,
1.724624, -0.7904221, 1.838876, 1, 0, 0, 1, 1,
1.745189, 1.049604, 1.585149, 1, 0, 0, 1, 1,
1.747839, -0.3365252, 3.291765, 0, 0, 0, 1, 1,
1.759523, -0.7315381, 1.653905, 0, 0, 0, 1, 1,
1.776616, -0.1486358, 2.93586, 0, 0, 0, 1, 1,
1.805348, -0.9530919, 2.06137, 0, 0, 0, 1, 1,
1.805364, -0.3472213, 3.158384, 0, 0, 0, 1, 1,
1.816112, -0.0867148, 1.103889, 0, 0, 0, 1, 1,
1.835224, -1.676434, 2.489287, 0, 0, 0, 1, 1,
1.846194, -0.4727549, 1.923305, 1, 1, 1, 1, 1,
1.85331, -1.944623, 0.6427297, 1, 1, 1, 1, 1,
1.859027, -0.1520209, 3.507352, 1, 1, 1, 1, 1,
1.863606, 0.4663336, 1.525265, 1, 1, 1, 1, 1,
1.871027, -0.143597, 1.41159, 1, 1, 1, 1, 1,
1.887854, -1.3191, 1.521735, 1, 1, 1, 1, 1,
1.906681, -0.8624474, 1.388912, 1, 1, 1, 1, 1,
1.906682, -0.7154967, 1.712243, 1, 1, 1, 1, 1,
1.91524, 1.111883, -0.5744932, 1, 1, 1, 1, 1,
1.937187, 0.4767089, 0.3401421, 1, 1, 1, 1, 1,
1.93973, -0.04990657, 3.343371, 1, 1, 1, 1, 1,
1.946234, 1.098586, 1.717046, 1, 1, 1, 1, 1,
1.987482, 0.45093, 0.5429369, 1, 1, 1, 1, 1,
1.997425, -1.226685, 0.2775471, 1, 1, 1, 1, 1,
2.014236, -1.666596, 1.345319, 1, 1, 1, 1, 1,
2.039023, -0.1289287, 0.2069775, 0, 0, 1, 1, 1,
2.082269, -1.196478, 1.830158, 1, 0, 0, 1, 1,
2.104417, -0.5375355, 0.2688746, 1, 0, 0, 1, 1,
2.197908, -1.820344, 2.167796, 1, 0, 0, 1, 1,
2.205848, -1.079769, 0.3819415, 1, 0, 0, 1, 1,
2.247299, -1.035928, 1.866724, 1, 0, 0, 1, 1,
2.28511, 0.5342857, 2.000651, 0, 0, 0, 1, 1,
2.318251, -0.3035074, 1.951355, 0, 0, 0, 1, 1,
2.341013, 2.237853, -0.2164184, 0, 0, 0, 1, 1,
2.459604, 0.641003, 2.106283, 0, 0, 0, 1, 1,
2.462946, 2.485479, 1.905353, 0, 0, 0, 1, 1,
2.477678, 0.4713944, 3.353229, 0, 0, 0, 1, 1,
2.554097, 0.7096304, 1.113296, 0, 0, 0, 1, 1,
2.581275, 1.329376, 1.559157, 1, 1, 1, 1, 1,
2.697818, 0.03764908, 1.203034, 1, 1, 1, 1, 1,
2.873871, 0.02986761, 1.316869, 1, 1, 1, 1, 1,
2.922586, 1.232421, 1.854312, 1, 1, 1, 1, 1,
2.937112, 1.521212, 0.4632714, 1, 1, 1, 1, 1,
2.997719, -1.560635, 2.977259, 1, 1, 1, 1, 1,
3.06918, -2.11448, 2.057271, 1, 1, 1, 1, 1
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
var radius = 9.630479;
var distance = 33.82665;
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
mvMatrix.translate( 0.06678176, 0.1767383, 0.1338525 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82665);
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
