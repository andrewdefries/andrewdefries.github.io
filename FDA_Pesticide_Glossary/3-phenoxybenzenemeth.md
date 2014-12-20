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
-3.378164, 1.461182, 1.736675, 1, 0, 0, 1,
-2.952285, 0.1193695, -2.85797, 1, 0.007843138, 0, 1,
-2.689714, -1.161337, -0.9027723, 1, 0.01176471, 0, 1,
-2.392906, -0.618508, -0.465926, 1, 0.01960784, 0, 1,
-2.378139, -0.3038957, 0.3151694, 1, 0.02352941, 0, 1,
-2.366834, 0.9009081, -2.105196, 1, 0.03137255, 0, 1,
-2.302484, 1.54938, -1.206802, 1, 0.03529412, 0, 1,
-2.291968, -0.3945642, -2.626976, 1, 0.04313726, 0, 1,
-2.289623, -1.501727, -0.9993266, 1, 0.04705882, 0, 1,
-2.257134, 2.252572, -0.05286054, 1, 0.05490196, 0, 1,
-2.223589, -0.7543063, -2.283824, 1, 0.05882353, 0, 1,
-2.210526, -0.6441369, -1.031708, 1, 0.06666667, 0, 1,
-2.167692, -0.1051444, -2.589085, 1, 0.07058824, 0, 1,
-2.161805, -0.9817674, -1.108929, 1, 0.07843138, 0, 1,
-2.159241, 0.6355841, 0.1412693, 1, 0.08235294, 0, 1,
-2.152989, 0.1118306, -0.6773135, 1, 0.09019608, 0, 1,
-2.133035, 0.2641101, -0.3824618, 1, 0.09411765, 0, 1,
-2.132681, 0.1055784, -1.041309, 1, 0.1019608, 0, 1,
-2.124677, -1.153947, -0.8332667, 1, 0.1098039, 0, 1,
-2.091583, 0.4384416, -0.7616042, 1, 0.1137255, 0, 1,
-2.047682, 0.435706, -1.03285, 1, 0.1215686, 0, 1,
-2.006051, 0.04909492, -1.584038, 1, 0.1254902, 0, 1,
-1.970568, -0.7145413, -0.5636284, 1, 0.1333333, 0, 1,
-1.969749, -0.5235024, -0.881417, 1, 0.1372549, 0, 1,
-1.967155, 1.558246, -0.3580767, 1, 0.145098, 0, 1,
-1.959687, -1.432321, -1.565748, 1, 0.1490196, 0, 1,
-1.958236, -0.8239977, -1.546107, 1, 0.1568628, 0, 1,
-1.930487, 0.1007072, -0.9294552, 1, 0.1607843, 0, 1,
-1.922898, -0.3607537, -1.69324, 1, 0.1686275, 0, 1,
-1.919073, -0.7643948, -1.411568, 1, 0.172549, 0, 1,
-1.896915, 2.82962, -0.2707476, 1, 0.1803922, 0, 1,
-1.885762, 0.4421841, -1.17953, 1, 0.1843137, 0, 1,
-1.880282, 0.3375272, -1.262081, 1, 0.1921569, 0, 1,
-1.858175, 0.3054467, -0.4560556, 1, 0.1960784, 0, 1,
-1.855473, 0.3305402, -0.9728816, 1, 0.2039216, 0, 1,
-1.796763, 0.1864028, -0.6585901, 1, 0.2117647, 0, 1,
-1.7716, -0.7983203, -1.715855, 1, 0.2156863, 0, 1,
-1.768433, 1.319669, -2.37906, 1, 0.2235294, 0, 1,
-1.734034, -0.5852355, -1.206808, 1, 0.227451, 0, 1,
-1.733284, -1.176793, -3.291497, 1, 0.2352941, 0, 1,
-1.723004, -0.6503067, -2.515614, 1, 0.2392157, 0, 1,
-1.708904, 0.8644185, -2.711443, 1, 0.2470588, 0, 1,
-1.69561, -0.7360356, -0.5031058, 1, 0.2509804, 0, 1,
-1.693924, 1.342851, -0.8405689, 1, 0.2588235, 0, 1,
-1.691341, -0.265619, -2.281905, 1, 0.2627451, 0, 1,
-1.68285, -0.5091873, 0.2783658, 1, 0.2705882, 0, 1,
-1.678219, -0.6039949, -2.211957, 1, 0.2745098, 0, 1,
-1.663892, -0.3687308, -1.9001, 1, 0.282353, 0, 1,
-1.650804, 0.3264989, -0.04411216, 1, 0.2862745, 0, 1,
-1.649548, -0.4505592, -1.626092, 1, 0.2941177, 0, 1,
-1.635105, -1.694416, -1.719427, 1, 0.3019608, 0, 1,
-1.633061, -2.50037, -3.391203, 1, 0.3058824, 0, 1,
-1.632104, -0.3370086, -2.218869, 1, 0.3137255, 0, 1,
-1.621065, 0.9076588, -2.253731, 1, 0.3176471, 0, 1,
-1.619993, 0.09905706, 0.7385311, 1, 0.3254902, 0, 1,
-1.61957, 3.11115, -0.8014555, 1, 0.3294118, 0, 1,
-1.612138, 0.4989508, -1.57269, 1, 0.3372549, 0, 1,
-1.609501, -0.5756486, -1.999408, 1, 0.3411765, 0, 1,
-1.609083, -0.444748, -0.8059602, 1, 0.3490196, 0, 1,
-1.596403, -1.334109, -1.843456, 1, 0.3529412, 0, 1,
-1.595224, 0.1781507, -0.9114862, 1, 0.3607843, 0, 1,
-1.594674, -0.6518677, -1.189228, 1, 0.3647059, 0, 1,
-1.593456, -1.121707, -3.094631, 1, 0.372549, 0, 1,
-1.556987, -0.3128287, -2.569921, 1, 0.3764706, 0, 1,
-1.533038, 0.9717609, -0.2243297, 1, 0.3843137, 0, 1,
-1.526164, 0.2323342, -0.9617895, 1, 0.3882353, 0, 1,
-1.518387, 0.06814461, 0.7960882, 1, 0.3960784, 0, 1,
-1.493518, 1.114671, -1.121673, 1, 0.4039216, 0, 1,
-1.464879, 0.3128795, -1.777772, 1, 0.4078431, 0, 1,
-1.458634, -0.5379564, -1.092304, 1, 0.4156863, 0, 1,
-1.439111, 0.100023, -1.658268, 1, 0.4196078, 0, 1,
-1.433294, 0.04618699, -1.078972, 1, 0.427451, 0, 1,
-1.431482, 0.1370003, -0.524, 1, 0.4313726, 0, 1,
-1.428376, 0.3660227, -1.095667, 1, 0.4392157, 0, 1,
-1.421324, 0.8075838, -0.8254, 1, 0.4431373, 0, 1,
-1.414702, -0.4098239, -2.438659, 1, 0.4509804, 0, 1,
-1.410594, -1.473907, -1.723649, 1, 0.454902, 0, 1,
-1.408473, 0.1411254, -2.464337, 1, 0.4627451, 0, 1,
-1.39825, -1.28908, -2.681894, 1, 0.4666667, 0, 1,
-1.386674, -0.1312745, -0.9319047, 1, 0.4745098, 0, 1,
-1.382104, -0.6810147, -1.83294, 1, 0.4784314, 0, 1,
-1.373795, -1.737692, -2.98263, 1, 0.4862745, 0, 1,
-1.361975, 1.592682, -1.821766, 1, 0.4901961, 0, 1,
-1.360635, -1.487222, -2.303669, 1, 0.4980392, 0, 1,
-1.35749, -1.24177, -0.9889452, 1, 0.5058824, 0, 1,
-1.343783, 1.976882, -0.1689057, 1, 0.509804, 0, 1,
-1.334997, 1.092569, -1.324018, 1, 0.5176471, 0, 1,
-1.33445, -1.707105, -2.299066, 1, 0.5215687, 0, 1,
-1.331917, 0.6068115, -0.0518323, 1, 0.5294118, 0, 1,
-1.330239, -0.4379998, -1.894251, 1, 0.5333334, 0, 1,
-1.328359, -0.4408929, -3.156826, 1, 0.5411765, 0, 1,
-1.324276, 2.486561, -0.08463339, 1, 0.5450981, 0, 1,
-1.306298, 0.2921474, -3.626593, 1, 0.5529412, 0, 1,
-1.303487, -0.6911123, -1.389214, 1, 0.5568628, 0, 1,
-1.299754, 0.2311864, -0.5883712, 1, 0.5647059, 0, 1,
-1.286223, 1.743625, 1.347095, 1, 0.5686275, 0, 1,
-1.276737, 1.669443, 0.2556073, 1, 0.5764706, 0, 1,
-1.269702, 0.4764915, -0.9589612, 1, 0.5803922, 0, 1,
-1.257245, 0.8718954, -1.129973, 1, 0.5882353, 0, 1,
-1.257137, -1.714983, -1.621801, 1, 0.5921569, 0, 1,
-1.255464, 0.7948307, -0.2807455, 1, 0.6, 0, 1,
-1.253567, 0.8441625, -0.05245395, 1, 0.6078432, 0, 1,
-1.24376, 0.9163688, -2.313596, 1, 0.6117647, 0, 1,
-1.239312, -0.1158718, -2.209118, 1, 0.6196079, 0, 1,
-1.232974, 0.06080044, -0.8815278, 1, 0.6235294, 0, 1,
-1.203232, -0.2374556, -2.389281, 1, 0.6313726, 0, 1,
-1.202863, -0.1902362, -0.884014, 1, 0.6352941, 0, 1,
-1.202671, -1.450404, -4.303175, 1, 0.6431373, 0, 1,
-1.187251, 2.28478, -0.3005904, 1, 0.6470588, 0, 1,
-1.175835, 0.8710623, -1.892502, 1, 0.654902, 0, 1,
-1.163301, -0.5329406, -1.589384, 1, 0.6588235, 0, 1,
-1.157162, 0.1326684, -2.80811, 1, 0.6666667, 0, 1,
-1.152859, 0.1475501, -2.105579, 1, 0.6705883, 0, 1,
-1.13655, 1.693586, -0.9382738, 1, 0.6784314, 0, 1,
-1.129893, -0.9480945, -2.194067, 1, 0.682353, 0, 1,
-1.128563, 0.1863899, -0.8682448, 1, 0.6901961, 0, 1,
-1.126787, 0.4796125, 0.3378597, 1, 0.6941177, 0, 1,
-1.126467, -0.7691609, -3.36319, 1, 0.7019608, 0, 1,
-1.126295, 1.07939, -1.019353, 1, 0.7098039, 0, 1,
-1.125656, -1.282846, -2.037289, 1, 0.7137255, 0, 1,
-1.123461, 0.1491245, 0.6981596, 1, 0.7215686, 0, 1,
-1.121069, 0.7368944, -2.458547, 1, 0.7254902, 0, 1,
-1.11958, 0.03667937, -1.348253, 1, 0.7333333, 0, 1,
-1.116218, 0.2664549, -1.585136, 1, 0.7372549, 0, 1,
-1.111957, 0.6863458, -2.066139, 1, 0.7450981, 0, 1,
-1.106032, 0.7962834, 0.3700219, 1, 0.7490196, 0, 1,
-1.101669, 1.008557, -0.04904589, 1, 0.7568628, 0, 1,
-1.097422, 0.3028676, -2.962055, 1, 0.7607843, 0, 1,
-1.094441, -0.1793015, -0.6038873, 1, 0.7686275, 0, 1,
-1.092134, -0.785477, -1.219715, 1, 0.772549, 0, 1,
-1.085202, -0.7764229, -1.360427, 1, 0.7803922, 0, 1,
-1.08331, 0.9262739, -0.8620045, 1, 0.7843137, 0, 1,
-1.075447, 1.589285, -0.6071854, 1, 0.7921569, 0, 1,
-1.075184, -1.49544, -1.597782, 1, 0.7960784, 0, 1,
-1.065788, 0.5371493, -1.667288, 1, 0.8039216, 0, 1,
-1.063404, -0.01342775, -1.635635, 1, 0.8117647, 0, 1,
-1.05908, -0.1161034, -3.438303, 1, 0.8156863, 0, 1,
-1.054194, 0.01121822, -1.403364, 1, 0.8235294, 0, 1,
-1.044424, -0.4150327, -2.439731, 1, 0.827451, 0, 1,
-1.043406, -0.6249568, -2.582237, 1, 0.8352941, 0, 1,
-1.042522, 1.392873, 0.6339253, 1, 0.8392157, 0, 1,
-1.036393, -0.7368255, -1.695789, 1, 0.8470588, 0, 1,
-1.031202, -1.827147, -2.912044, 1, 0.8509804, 0, 1,
-1.028926, -0.08039515, -1.643731, 1, 0.8588235, 0, 1,
-1.028852, 0.2765299, -1.332226, 1, 0.8627451, 0, 1,
-1.024189, 1.774693, -1.701818, 1, 0.8705882, 0, 1,
-1.022811, 1.124249, -2.445668, 1, 0.8745098, 0, 1,
-1.022657, -0.809603, -3.888726, 1, 0.8823529, 0, 1,
-1.021529, -0.9432297, -1.116744, 1, 0.8862745, 0, 1,
-1.018606, -1.096859, -1.104319, 1, 0.8941177, 0, 1,
-1.016667, -1.166502, -3.263365, 1, 0.8980392, 0, 1,
-1.008944, 2.925656, 0.8031299, 1, 0.9058824, 0, 1,
-1.008232, -1.573298, -2.43229, 1, 0.9137255, 0, 1,
-1.003094, 0.01551529, -1.811713, 1, 0.9176471, 0, 1,
-1.002247, -0.2160013, -0.8741091, 1, 0.9254902, 0, 1,
-0.9906209, 1.049779, 1.977485, 1, 0.9294118, 0, 1,
-0.9896285, 0.5677957, -1.345553, 1, 0.9372549, 0, 1,
-0.9877887, -0.8405727, -3.78017, 1, 0.9411765, 0, 1,
-0.9847167, -0.04064723, -2.620977, 1, 0.9490196, 0, 1,
-0.9765418, -0.7971873, -1.806201, 1, 0.9529412, 0, 1,
-0.9759341, -1.172465, -3.183995, 1, 0.9607843, 0, 1,
-0.974736, 0.8166388, 0.6462337, 1, 0.9647059, 0, 1,
-0.9735948, 0.023939, -0.6225973, 1, 0.972549, 0, 1,
-0.9725288, -0.2727494, 0.552704, 1, 0.9764706, 0, 1,
-0.9725034, 0.613877, -1.25621, 1, 0.9843137, 0, 1,
-0.9688665, 0.3605336, 0.0858518, 1, 0.9882353, 0, 1,
-0.9626953, -0.288935, -1.955018, 1, 0.9960784, 0, 1,
-0.9620983, -0.1096117, -3.284717, 0.9960784, 1, 0, 1,
-0.9583375, -2.403327, -1.882774, 0.9921569, 1, 0, 1,
-0.9532143, -1.411325, -1.477606, 0.9843137, 1, 0, 1,
-0.9516703, 0.8174463, -0.9070226, 0.9803922, 1, 0, 1,
-0.9447964, -1.213707, -1.845695, 0.972549, 1, 0, 1,
-0.9365367, 0.6370884, -0.4406644, 0.9686275, 1, 0, 1,
-0.9284637, -1.793019, -3.308701, 0.9607843, 1, 0, 1,
-0.9096731, 0.2995645, -1.500242, 0.9568627, 1, 0, 1,
-0.9036337, -0.9432486, -2.320567, 0.9490196, 1, 0, 1,
-0.9023424, 1.712734, -0.07147752, 0.945098, 1, 0, 1,
-0.9000458, 1.030916, -1.268854, 0.9372549, 1, 0, 1,
-0.8984845, -0.1983486, -0.9865721, 0.9333333, 1, 0, 1,
-0.8982873, 0.5548003, -1.621324, 0.9254902, 1, 0, 1,
-0.8975073, -0.5046096, -2.452086, 0.9215686, 1, 0, 1,
-0.8934535, -1.241138, -1.73309, 0.9137255, 1, 0, 1,
-0.8883423, 0.546226, -0.1937409, 0.9098039, 1, 0, 1,
-0.8803402, 0.03024995, 0.3508891, 0.9019608, 1, 0, 1,
-0.8589029, 0.6234741, -0.6226872, 0.8941177, 1, 0, 1,
-0.8573429, 0.06931176, -1.778351, 0.8901961, 1, 0, 1,
-0.8517343, -2.028774, -2.732051, 0.8823529, 1, 0, 1,
-0.8440191, -0.7562431, -3.019212, 0.8784314, 1, 0, 1,
-0.8393795, 1.347481, -0.3119591, 0.8705882, 1, 0, 1,
-0.8344625, 0.4426732, -1.941726, 0.8666667, 1, 0, 1,
-0.8311471, 1.253051, -1.318592, 0.8588235, 1, 0, 1,
-0.8286352, 0.3510806, -1.016687, 0.854902, 1, 0, 1,
-0.8282517, 1.106025, -2.137859, 0.8470588, 1, 0, 1,
-0.8208106, -1.111424, -3.602951, 0.8431373, 1, 0, 1,
-0.8205735, 0.4598414, -1.496426, 0.8352941, 1, 0, 1,
-0.8152678, -0.4349559, -0.8844144, 0.8313726, 1, 0, 1,
-0.8042292, 0.5661324, 1.038331, 0.8235294, 1, 0, 1,
-0.8010305, -0.6501578, -0.8735179, 0.8196079, 1, 0, 1,
-0.7972196, 1.121704, -1.804284, 0.8117647, 1, 0, 1,
-0.7925109, 0.06368015, -2.149376, 0.8078431, 1, 0, 1,
-0.7902532, 1.148949, 0.1009644, 0.8, 1, 0, 1,
-0.7894779, -1.447361, -0.9792842, 0.7921569, 1, 0, 1,
-0.7848664, 0.7005237, -0.6509826, 0.7882353, 1, 0, 1,
-0.7803311, 1.524742, -0.9120333, 0.7803922, 1, 0, 1,
-0.7751024, -0.04231401, -1.834302, 0.7764706, 1, 0, 1,
-0.7702553, -0.4309947, -0.03284099, 0.7686275, 1, 0, 1,
-0.7668445, -1.734196, -2.373078, 0.7647059, 1, 0, 1,
-0.7644196, -1.639774, -4.594543, 0.7568628, 1, 0, 1,
-0.7624823, -0.2754402, -2.644839, 0.7529412, 1, 0, 1,
-0.75758, 0.1370316, -1.926483, 0.7450981, 1, 0, 1,
-0.7568792, -1.008355, -2.175031, 0.7411765, 1, 0, 1,
-0.7523673, 0.3706428, -0.3521557, 0.7333333, 1, 0, 1,
-0.7484914, -0.2467119, -2.540278, 0.7294118, 1, 0, 1,
-0.7480208, 1.359354, -1.112651, 0.7215686, 1, 0, 1,
-0.7467212, 0.3100766, -0.7031775, 0.7176471, 1, 0, 1,
-0.7395269, 0.6518236, -0.8958262, 0.7098039, 1, 0, 1,
-0.7389718, -0.5950516, -2.758957, 0.7058824, 1, 0, 1,
-0.7224363, 0.1808023, -2.122851, 0.6980392, 1, 0, 1,
-0.7209471, -0.5361731, -2.541538, 0.6901961, 1, 0, 1,
-0.7161086, 0.6703846, -0.8016231, 0.6862745, 1, 0, 1,
-0.7086354, -2.291862, -3.176822, 0.6784314, 1, 0, 1,
-0.7067213, -0.5840288, -1.540764, 0.6745098, 1, 0, 1,
-0.7054611, 0.208519, -1.26505, 0.6666667, 1, 0, 1,
-0.7052378, 0.6786183, -1.174815, 0.6627451, 1, 0, 1,
-0.6973106, -0.9449339, -1.397138, 0.654902, 1, 0, 1,
-0.6939765, -0.01788346, -1.912824, 0.6509804, 1, 0, 1,
-0.6919088, 2.102193, 0.8909748, 0.6431373, 1, 0, 1,
-0.6900849, 0.4055608, -1.353942, 0.6392157, 1, 0, 1,
-0.6843117, -1.322293, -1.266216, 0.6313726, 1, 0, 1,
-0.6838001, -0.348258, -2.04027, 0.627451, 1, 0, 1,
-0.6802225, 1.047083, 1.57429, 0.6196079, 1, 0, 1,
-0.6799455, 1.725039, -1.511792, 0.6156863, 1, 0, 1,
-0.6775085, 0.5150546, 0.7469947, 0.6078432, 1, 0, 1,
-0.6743057, -0.4383247, -3.094795, 0.6039216, 1, 0, 1,
-0.6721786, 0.9725579, -2.160932, 0.5960785, 1, 0, 1,
-0.6718488, 0.2898069, -2.06716, 0.5882353, 1, 0, 1,
-0.6668065, -1.330702, -0.9789479, 0.5843138, 1, 0, 1,
-0.6502802, -0.6708313, -2.170621, 0.5764706, 1, 0, 1,
-0.6494991, -0.8240654, -4.101461, 0.572549, 1, 0, 1,
-0.6480922, 1.814453, -1.509415, 0.5647059, 1, 0, 1,
-0.6396105, 0.0670886, -1.452507, 0.5607843, 1, 0, 1,
-0.6312323, 0.4353446, -2.406975, 0.5529412, 1, 0, 1,
-0.6299426, -0.212057, -1.305054, 0.5490196, 1, 0, 1,
-0.6263812, 0.541653, -0.724522, 0.5411765, 1, 0, 1,
-0.6255706, -2.605915, -3.713758, 0.5372549, 1, 0, 1,
-0.6234723, -0.08822936, -2.592039, 0.5294118, 1, 0, 1,
-0.6229888, 0.9765167, -1.285761, 0.5254902, 1, 0, 1,
-0.62162, 0.05562431, -2.198994, 0.5176471, 1, 0, 1,
-0.6215998, 1.296318, -0.7819929, 0.5137255, 1, 0, 1,
-0.6187035, -1.661434, -3.346853, 0.5058824, 1, 0, 1,
-0.6181347, 0.6666749, -0.5898767, 0.5019608, 1, 0, 1,
-0.6157752, 0.560233, 1.400846, 0.4941176, 1, 0, 1,
-0.6157472, 1.814573, -0.8321881, 0.4862745, 1, 0, 1,
-0.6116618, -1.774233, -1.801093, 0.4823529, 1, 0, 1,
-0.6089963, -0.9540746, -2.381128, 0.4745098, 1, 0, 1,
-0.607842, 0.525537, -1.182892, 0.4705882, 1, 0, 1,
-0.6025963, -1.656758, -2.12307, 0.4627451, 1, 0, 1,
-0.6008853, -1.717378, -0.7475978, 0.4588235, 1, 0, 1,
-0.595419, -0.3105467, -2.268506, 0.4509804, 1, 0, 1,
-0.5860754, 1.134692, -0.598263, 0.4470588, 1, 0, 1,
-0.5847441, 0.3779717, -1.044756, 0.4392157, 1, 0, 1,
-0.5823876, -0.7048493, -2.027987, 0.4352941, 1, 0, 1,
-0.580224, 0.779355, -1.237147, 0.427451, 1, 0, 1,
-0.569706, -0.2775017, -2.2415, 0.4235294, 1, 0, 1,
-0.5687076, 0.05080529, -2.22046, 0.4156863, 1, 0, 1,
-0.5609193, 0.402447, -0.7207559, 0.4117647, 1, 0, 1,
-0.5572476, -0.7539022, -1.642372, 0.4039216, 1, 0, 1,
-0.5548131, -0.4504855, -2.270284, 0.3960784, 1, 0, 1,
-0.5541871, -0.4036833, -3.268508, 0.3921569, 1, 0, 1,
-0.5489632, 1.372806, -0.4648597, 0.3843137, 1, 0, 1,
-0.5473418, 0.3928798, 0.8396093, 0.3803922, 1, 0, 1,
-0.5462029, 0.9025845, -1.974728, 0.372549, 1, 0, 1,
-0.5387108, 0.6805941, 0.5823805, 0.3686275, 1, 0, 1,
-0.5357445, 0.8286537, 0.7873129, 0.3607843, 1, 0, 1,
-0.5301602, -1.4164, -2.488213, 0.3568628, 1, 0, 1,
-0.5191894, -1.258969, -3.094295, 0.3490196, 1, 0, 1,
-0.5191786, 1.003861, 1.802771, 0.345098, 1, 0, 1,
-0.512058, -0.4887958, -2.565934, 0.3372549, 1, 0, 1,
-0.5117042, -2.410519, -2.091302, 0.3333333, 1, 0, 1,
-0.5105293, 0.3328773, 0.3085749, 0.3254902, 1, 0, 1,
-0.5073251, -0.3553886, -3.170451, 0.3215686, 1, 0, 1,
-0.5071773, 2.582044, -1.47537, 0.3137255, 1, 0, 1,
-0.4972437, 0.5174982, -1.214654, 0.3098039, 1, 0, 1,
-0.4956138, -0.6998889, -2.94117, 0.3019608, 1, 0, 1,
-0.4905753, -0.720663, -0.5878317, 0.2941177, 1, 0, 1,
-0.4888673, -0.3286033, -3.55638, 0.2901961, 1, 0, 1,
-0.4869274, 0.01084869, -0.4681211, 0.282353, 1, 0, 1,
-0.484102, -2.57232, -4.176582, 0.2784314, 1, 0, 1,
-0.4840435, -1.712011, -2.256267, 0.2705882, 1, 0, 1,
-0.4833133, -0.6197721, -2.620094, 0.2666667, 1, 0, 1,
-0.4802654, 0.07785001, -0.5347291, 0.2588235, 1, 0, 1,
-0.4755334, 2.230751, -0.2597464, 0.254902, 1, 0, 1,
-0.4724628, -1.662709, -1.176503, 0.2470588, 1, 0, 1,
-0.4710528, 0.4297073, -0.7130859, 0.2431373, 1, 0, 1,
-0.4695705, -0.06206587, -2.79919, 0.2352941, 1, 0, 1,
-0.4684585, 0.6452273, -0.7918291, 0.2313726, 1, 0, 1,
-0.4640144, -0.02229155, 0.2138607, 0.2235294, 1, 0, 1,
-0.4588076, -0.1810217, -1.890894, 0.2196078, 1, 0, 1,
-0.4522725, 0.2908834, -0.0486368, 0.2117647, 1, 0, 1,
-0.4486978, 0.7277219, -0.1604663, 0.2078431, 1, 0, 1,
-0.4438598, -0.9932232, -3.498007, 0.2, 1, 0, 1,
-0.4413709, -1.040029, -3.067804, 0.1921569, 1, 0, 1,
-0.4406409, 0.5048755, -0.6903173, 0.1882353, 1, 0, 1,
-0.4358208, -1.198038, -2.90345, 0.1803922, 1, 0, 1,
-0.4350797, 1.401842, -0.941532, 0.1764706, 1, 0, 1,
-0.4319574, 0.8134993, -0.1475174, 0.1686275, 1, 0, 1,
-0.4251369, -0.5513349, -2.922179, 0.1647059, 1, 0, 1,
-0.4238888, -0.8662497, -2.069291, 0.1568628, 1, 0, 1,
-0.4165916, 0.1489727, 0.7526547, 0.1529412, 1, 0, 1,
-0.411429, -1.691877, -1.027724, 0.145098, 1, 0, 1,
-0.4094922, -0.7355579, -5.272161, 0.1411765, 1, 0, 1,
-0.4070848, 0.5951258, 0.397508, 0.1333333, 1, 0, 1,
-0.4069034, -0.7805149, -5.010798, 0.1294118, 1, 0, 1,
-0.40683, 0.9680901, 0.8789341, 0.1215686, 1, 0, 1,
-0.4063728, -0.02164846, -1.769463, 0.1176471, 1, 0, 1,
-0.4060835, 0.1998898, -0.9003785, 0.1098039, 1, 0, 1,
-0.4049565, 1.362112, -0.4217045, 0.1058824, 1, 0, 1,
-0.4003252, 1.720927, 1.792719, 0.09803922, 1, 0, 1,
-0.3996064, -0.05320371, -2.505388, 0.09019608, 1, 0, 1,
-0.3965864, -1.814438, -3.688273, 0.08627451, 1, 0, 1,
-0.3961681, -0.8227193, -3.036161, 0.07843138, 1, 0, 1,
-0.3939385, -0.5125422, -1.689738, 0.07450981, 1, 0, 1,
-0.3927361, 0.8792687, -0.6330675, 0.06666667, 1, 0, 1,
-0.3887434, -1.079153, -3.059938, 0.0627451, 1, 0, 1,
-0.3850469, -1.459025, -2.786781, 0.05490196, 1, 0, 1,
-0.3804345, 1.905068, -0.6611724, 0.05098039, 1, 0, 1,
-0.3781147, -0.6077823, -3.088395, 0.04313726, 1, 0, 1,
-0.3754059, -0.4417709, -2.589084, 0.03921569, 1, 0, 1,
-0.3739219, -1.036068, -2.358218, 0.03137255, 1, 0, 1,
-0.3718561, -1.158681, -2.487256, 0.02745098, 1, 0, 1,
-0.3698587, -0.5654205, -1.703912, 0.01960784, 1, 0, 1,
-0.3673658, -0.7324368, -1.059177, 0.01568628, 1, 0, 1,
-0.3654045, 0.5006754, -0.9110925, 0.007843138, 1, 0, 1,
-0.3597165, -1.332943, -3.006751, 0.003921569, 1, 0, 1,
-0.358627, -1.14222, -3.600957, 0, 1, 0.003921569, 1,
-0.3543793, -1.323677, -2.587918, 0, 1, 0.01176471, 1,
-0.3525214, -0.3887293, -0.8556611, 0, 1, 0.01568628, 1,
-0.3493239, -0.2749422, -1.677414, 0, 1, 0.02352941, 1,
-0.3490648, -1.700183, -4.399549, 0, 1, 0.02745098, 1,
-0.3454708, 0.6871364, -2.736421, 0, 1, 0.03529412, 1,
-0.3421018, -0.2533632, -2.923934, 0, 1, 0.03921569, 1,
-0.3367586, 0.5427976, 0.2838738, 0, 1, 0.04705882, 1,
-0.3284622, -1.768128, -3.685861, 0, 1, 0.05098039, 1,
-0.3238469, -1.615484, -3.43099, 0, 1, 0.05882353, 1,
-0.3165307, -0.108011, -1.060914, 0, 1, 0.0627451, 1,
-0.3126008, 0.2161166, 1.087453, 0, 1, 0.07058824, 1,
-0.3103409, 0.9282376, -2.074704, 0, 1, 0.07450981, 1,
-0.3094489, 1.211858, -0.6309908, 0, 1, 0.08235294, 1,
-0.3076071, 0.2449259, 1.880458, 0, 1, 0.08627451, 1,
-0.2975963, 0.3841728, -1.532486, 0, 1, 0.09411765, 1,
-0.2917098, -0.3082564, -1.70285, 0, 1, 0.1019608, 1,
-0.2901759, 0.4885918, 0.2430415, 0, 1, 0.1058824, 1,
-0.2882305, 1.148847, -1.034571, 0, 1, 0.1137255, 1,
-0.2881415, 0.1449074, -1.72911, 0, 1, 0.1176471, 1,
-0.2875617, 1.755615, -0.3978399, 0, 1, 0.1254902, 1,
-0.2865894, -1.763677, -3.351636, 0, 1, 0.1294118, 1,
-0.2836281, -0.3226097, -1.12982, 0, 1, 0.1372549, 1,
-0.2774788, 0.4970312, -1.541255, 0, 1, 0.1411765, 1,
-0.2748235, 0.3855486, -0.9808467, 0, 1, 0.1490196, 1,
-0.2734796, 0.2595913, 1.49465, 0, 1, 0.1529412, 1,
-0.2700121, 0.6621872, -3.642328, 0, 1, 0.1607843, 1,
-0.2693315, 1.035212, 0.04099327, 0, 1, 0.1647059, 1,
-0.2693067, -0.7751887, -3.555439, 0, 1, 0.172549, 1,
-0.2686484, -2.181902, -4.458387, 0, 1, 0.1764706, 1,
-0.2638531, -0.7472373, -2.661548, 0, 1, 0.1843137, 1,
-0.2608352, 0.4903648, -0.9047414, 0, 1, 0.1882353, 1,
-0.2604671, 0.02520287, -0.6786397, 0, 1, 0.1960784, 1,
-0.2585604, -0.5784442, 0.4798938, 0, 1, 0.2039216, 1,
-0.2538109, 0.1569806, -2.242536, 0, 1, 0.2078431, 1,
-0.251253, 0.1039443, -2.673145, 0, 1, 0.2156863, 1,
-0.2419931, 0.1198981, -0.7498226, 0, 1, 0.2196078, 1,
-0.2390141, -0.3746665, -2.521732, 0, 1, 0.227451, 1,
-0.2374153, -0.5648015, -2.057901, 0, 1, 0.2313726, 1,
-0.2339911, 0.8898594, 1.406174, 0, 1, 0.2392157, 1,
-0.2338243, -0.1227927, -2.043165, 0, 1, 0.2431373, 1,
-0.2337964, 0.3799081, -0.06194455, 0, 1, 0.2509804, 1,
-0.2330817, -1.75947, -5.498071, 0, 1, 0.254902, 1,
-0.2320546, -0.0602532, -1.529156, 0, 1, 0.2627451, 1,
-0.2261723, 2.388361, 0.1749516, 0, 1, 0.2666667, 1,
-0.2257864, 0.3197269, -0.3744468, 0, 1, 0.2745098, 1,
-0.2255931, 0.9303658, -1.393061, 0, 1, 0.2784314, 1,
-0.2198673, -0.2714511, -3.77977, 0, 1, 0.2862745, 1,
-0.2182733, -0.2527788, -3.110459, 0, 1, 0.2901961, 1,
-0.21788, 1.305716, -1.169706, 0, 1, 0.2980392, 1,
-0.2174388, 1.650906, -1.584478, 0, 1, 0.3058824, 1,
-0.2171787, 0.135665, -1.257747, 0, 1, 0.3098039, 1,
-0.2084891, 0.8084372, -1.09057, 0, 1, 0.3176471, 1,
-0.2051661, -0.6520491, -1.976062, 0, 1, 0.3215686, 1,
-0.2021322, -0.1903534, -4.238863, 0, 1, 0.3294118, 1,
-0.2018751, 1.015191, 0.4068108, 0, 1, 0.3333333, 1,
-0.1982931, 0.8257342, -1.838014, 0, 1, 0.3411765, 1,
-0.1980854, 1.311724, 0.0774098, 0, 1, 0.345098, 1,
-0.1966815, -0.1244234, -2.073935, 0, 1, 0.3529412, 1,
-0.1964372, -0.843335, -2.473706, 0, 1, 0.3568628, 1,
-0.192359, -0.6564528, -3.581505, 0, 1, 0.3647059, 1,
-0.1861107, 1.156341, 0.749786, 0, 1, 0.3686275, 1,
-0.180608, 0.8011566, 0.644495, 0, 1, 0.3764706, 1,
-0.175792, 0.4140555, -1.154882, 0, 1, 0.3803922, 1,
-0.1755016, 0.795123, -1.181744, 0, 1, 0.3882353, 1,
-0.1742858, 0.5660754, 0.2460549, 0, 1, 0.3921569, 1,
-0.1739366, 0.7920233, -0.7310494, 0, 1, 0.4, 1,
-0.1688965, -0.1119422, -2.21656, 0, 1, 0.4078431, 1,
-0.1634412, -0.426725, -3.332741, 0, 1, 0.4117647, 1,
-0.1607293, 0.5078314, -0.2548653, 0, 1, 0.4196078, 1,
-0.1550539, -1.777357, -2.969376, 0, 1, 0.4235294, 1,
-0.1510519, -0.5532921, -1.726149, 0, 1, 0.4313726, 1,
-0.1475778, 1.676874, -0.4325548, 0, 1, 0.4352941, 1,
-0.1452328, 1.063427, 0.3149022, 0, 1, 0.4431373, 1,
-0.1403442, -0.08674975, -1.73313, 0, 1, 0.4470588, 1,
-0.1385967, -0.6583089, -1.397603, 0, 1, 0.454902, 1,
-0.1375985, -0.03246416, -0.6478148, 0, 1, 0.4588235, 1,
-0.1375815, 0.1938108, 0.1088512, 0, 1, 0.4666667, 1,
-0.1347972, -1.205884, -2.655192, 0, 1, 0.4705882, 1,
-0.1327202, -0.8246486, -1.819209, 0, 1, 0.4784314, 1,
-0.1287773, 0.185202, 0.3460611, 0, 1, 0.4823529, 1,
-0.1275342, 0.106806, -2.764765, 0, 1, 0.4901961, 1,
-0.1237566, 0.5678788, 1.474015, 0, 1, 0.4941176, 1,
-0.1208502, 1.895851, 0.5238956, 0, 1, 0.5019608, 1,
-0.1167009, -0.698912, -4.106768, 0, 1, 0.509804, 1,
-0.110051, 0.6604601, 1.38805, 0, 1, 0.5137255, 1,
-0.1080497, 1.128497, -0.9718982, 0, 1, 0.5215687, 1,
-0.1080094, -1.080431, -1.695207, 0, 1, 0.5254902, 1,
-0.1073781, -0.5177293, -2.875714, 0, 1, 0.5333334, 1,
-0.1063152, -0.9209378, -2.878053, 0, 1, 0.5372549, 1,
-0.1049025, 0.7051502, 0.0427958, 0, 1, 0.5450981, 1,
-0.104824, 0.4736155, -0.7573347, 0, 1, 0.5490196, 1,
-0.1044789, 0.1632795, -1.699717, 0, 1, 0.5568628, 1,
-0.1034992, 1.648681, 0.3760222, 0, 1, 0.5607843, 1,
-0.1030091, 1.065906, -0.4024554, 0, 1, 0.5686275, 1,
-0.1023765, 0.1347256, -1.200807, 0, 1, 0.572549, 1,
-0.09742017, -0.08387855, -1.980858, 0, 1, 0.5803922, 1,
-0.09381747, 0.7917622, 2.46986, 0, 1, 0.5843138, 1,
-0.0898909, 1.509235, -1.94748, 0, 1, 0.5921569, 1,
-0.08780318, -0.4872192, -3.904545, 0, 1, 0.5960785, 1,
-0.08756471, 0.5949543, -0.307796, 0, 1, 0.6039216, 1,
-0.08474898, -1.184368, -2.266109, 0, 1, 0.6117647, 1,
-0.07894517, -0.7203567, -4.687528, 0, 1, 0.6156863, 1,
-0.07700879, 0.2863945, 1.470196, 0, 1, 0.6235294, 1,
-0.07481938, 0.940143, -0.07904613, 0, 1, 0.627451, 1,
-0.07356455, 0.419627, -0.02721731, 0, 1, 0.6352941, 1,
-0.07211807, 3.041897, 0.10424, 0, 1, 0.6392157, 1,
-0.07023263, 0.8393376, 0.8973608, 0, 1, 0.6470588, 1,
-0.06931347, 0.2422417, -0.5369344, 0, 1, 0.6509804, 1,
-0.06895156, 0.2416698, -1.675084, 0, 1, 0.6588235, 1,
-0.06839787, 1.716335, 0.4328141, 0, 1, 0.6627451, 1,
-0.06799744, -0.0161285, -1.092043, 0, 1, 0.6705883, 1,
-0.06403988, -0.1553879, 0.007465865, 0, 1, 0.6745098, 1,
-0.05986038, -0.9884803, -1.85645, 0, 1, 0.682353, 1,
-0.0532699, -1.458378, -3.089903, 0, 1, 0.6862745, 1,
-0.04867135, -1.155214, -2.684632, 0, 1, 0.6941177, 1,
-0.04372866, -0.4204705, -1.249049, 0, 1, 0.7019608, 1,
-0.03961822, 1.416788, 0.3899355, 0, 1, 0.7058824, 1,
-0.03725467, 1.235791, 0.1692399, 0, 1, 0.7137255, 1,
-0.03565123, 1.395853, -0.5628565, 0, 1, 0.7176471, 1,
-0.02919489, -0.805871, -4.341651, 0, 1, 0.7254902, 1,
-0.0277946, 0.5308598, -2.209538, 0, 1, 0.7294118, 1,
-0.02444007, 1.452793, 0.09666189, 0, 1, 0.7372549, 1,
-0.01908026, 0.1151626, -0.1957562, 0, 1, 0.7411765, 1,
-0.01800063, 0.3416051, 0.1427386, 0, 1, 0.7490196, 1,
-0.01397186, -0.8011705, -3.277572, 0, 1, 0.7529412, 1,
-0.009475518, -0.6815143, -3.619925, 0, 1, 0.7607843, 1,
-0.009341273, -0.1285051, -3.683399, 0, 1, 0.7647059, 1,
-0.007367512, -0.3855515, -2.603344, 0, 1, 0.772549, 1,
0.002695873, 0.6384675, -0.7128538, 0, 1, 0.7764706, 1,
0.003161055, -1.248057, 2.862161, 0, 1, 0.7843137, 1,
0.005421232, -0.4849683, 2.482215, 0, 1, 0.7882353, 1,
0.00560596, 1.092749, -0.4044714, 0, 1, 0.7960784, 1,
0.006913276, 0.7582101, 1.678922, 0, 1, 0.8039216, 1,
0.007641281, 0.6501719, 0.4949742, 0, 1, 0.8078431, 1,
0.01097849, 0.5609592, 1.461746, 0, 1, 0.8156863, 1,
0.0128358, -0.09212483, 3.445012, 0, 1, 0.8196079, 1,
0.01301727, -0.5164132, 2.074111, 0, 1, 0.827451, 1,
0.01499947, 0.2595238, 1.449524, 0, 1, 0.8313726, 1,
0.01504575, 0.4484601, 0.1789927, 0, 1, 0.8392157, 1,
0.01748309, 0.2058523, 0.4413517, 0, 1, 0.8431373, 1,
0.0220152, 1.136175, -1.675471, 0, 1, 0.8509804, 1,
0.02396324, 0.8617949, 1.730947, 0, 1, 0.854902, 1,
0.02458693, 0.7545464, 0.3450546, 0, 1, 0.8627451, 1,
0.02990317, -0.008665774, 2.175388, 0, 1, 0.8666667, 1,
0.03032116, 0.07751792, 0.1254567, 0, 1, 0.8745098, 1,
0.03423829, 0.908718, 1.704076, 0, 1, 0.8784314, 1,
0.03425981, 0.03923069, 1.667218, 0, 1, 0.8862745, 1,
0.03783903, -0.7771689, 3.099223, 0, 1, 0.8901961, 1,
0.0387654, 1.180122, -0.5185347, 0, 1, 0.8980392, 1,
0.04612905, -0.03820878, 1.839299, 0, 1, 0.9058824, 1,
0.0473848, -1.554243, 4.919428, 0, 1, 0.9098039, 1,
0.0507846, -0.2717393, 3.889806, 0, 1, 0.9176471, 1,
0.05158619, 0.5311328, 0.2005295, 0, 1, 0.9215686, 1,
0.05177606, 0.6906268, -1.052705, 0, 1, 0.9294118, 1,
0.0541623, -0.893536, 3.284681, 0, 1, 0.9333333, 1,
0.058277, -1.238331, 3.52593, 0, 1, 0.9411765, 1,
0.06246304, -0.7651297, 2.297252, 0, 1, 0.945098, 1,
0.06338501, -2.253459, 3.740733, 0, 1, 0.9529412, 1,
0.06405236, 1.24415, -1.374655, 0, 1, 0.9568627, 1,
0.06451197, 2.35051, 1.306352, 0, 1, 0.9647059, 1,
0.06714768, 0.1225617, -0.5842356, 0, 1, 0.9686275, 1,
0.06873178, 1.530941, 1.620901, 0, 1, 0.9764706, 1,
0.07017406, -1.096648, 2.472396, 0, 1, 0.9803922, 1,
0.07050043, -0.8285975, 4.752129, 0, 1, 0.9882353, 1,
0.0709674, -0.8884994, 2.679056, 0, 1, 0.9921569, 1,
0.07402392, 0.1364932, 0.06063344, 0, 1, 1, 1,
0.07766186, 0.4093699, 0.2947252, 0, 0.9921569, 1, 1,
0.07900416, -0.8388264, 2.674299, 0, 0.9882353, 1, 1,
0.08112241, -0.08223484, 3.284294, 0, 0.9803922, 1, 1,
0.08482704, 0.1647036, 1.036586, 0, 0.9764706, 1, 1,
0.08531339, 0.6234487, 1.000383, 0, 0.9686275, 1, 1,
0.08782899, -0.703242, 4.198117, 0, 0.9647059, 1, 1,
0.08880351, 0.2617449, 0.7047462, 0, 0.9568627, 1, 1,
0.09083539, -0.9701985, 3.769445, 0, 0.9529412, 1, 1,
0.09233301, -0.5208796, 3.359308, 0, 0.945098, 1, 1,
0.09358581, 0.9922078, -1.446328, 0, 0.9411765, 1, 1,
0.09378881, 1.109183, -1.004376, 0, 0.9333333, 1, 1,
0.09639562, 1.232995, 2.080541, 0, 0.9294118, 1, 1,
0.09723018, 0.8689359, -0.5488999, 0, 0.9215686, 1, 1,
0.1013675, 0.6369307, 0.007863778, 0, 0.9176471, 1, 1,
0.1021373, -1.743633, 4.15899, 0, 0.9098039, 1, 1,
0.1057649, -0.3196263, 1.749408, 0, 0.9058824, 1, 1,
0.1077251, 1.381366, 1.075516, 0, 0.8980392, 1, 1,
0.1107794, 0.03377221, 0.9597599, 0, 0.8901961, 1, 1,
0.1130993, -0.09658261, 3.125296, 0, 0.8862745, 1, 1,
0.1134359, 0.4189971, -0.258548, 0, 0.8784314, 1, 1,
0.1170083, -0.8477898, 1.756541, 0, 0.8745098, 1, 1,
0.1172696, -0.7161627, 2.228571, 0, 0.8666667, 1, 1,
0.1184845, -0.4245049, 2.131144, 0, 0.8627451, 1, 1,
0.1209074, 1.709339, -0.03271987, 0, 0.854902, 1, 1,
0.122232, -0.821209, 3.48932, 0, 0.8509804, 1, 1,
0.123193, -1.304287, 2.329133, 0, 0.8431373, 1, 1,
0.1239807, -1.373273, 2.836791, 0, 0.8392157, 1, 1,
0.1284276, -1.176046, 3.536277, 0, 0.8313726, 1, 1,
0.1314504, -0.4215643, 5.047705, 0, 0.827451, 1, 1,
0.1376484, 1.260492, -1.089673, 0, 0.8196079, 1, 1,
0.1388876, 2.019131, 0.001917021, 0, 0.8156863, 1, 1,
0.1455602, 0.281398, 1.250135, 0, 0.8078431, 1, 1,
0.1463652, 1.133114, -0.4599458, 0, 0.8039216, 1, 1,
0.1489768, -0.2622039, 3.449343, 0, 0.7960784, 1, 1,
0.150278, -0.2806169, 2.703568, 0, 0.7882353, 1, 1,
0.1543566, 0.9041124, -0.1067012, 0, 0.7843137, 1, 1,
0.1546149, 0.2574272, 0.2250265, 0, 0.7764706, 1, 1,
0.1603971, 0.5006861, 1.392837, 0, 0.772549, 1, 1,
0.1607043, 2.108682, 0.07519009, 0, 0.7647059, 1, 1,
0.1650537, -0.3349277, 1.5402, 0, 0.7607843, 1, 1,
0.1667767, -0.1787532, 2.755675, 0, 0.7529412, 1, 1,
0.1678746, 1.06008, 1.155958, 0, 0.7490196, 1, 1,
0.1695486, -0.5706045, 1.715771, 0, 0.7411765, 1, 1,
0.1702197, -0.2140214, 1.160994, 0, 0.7372549, 1, 1,
0.1752687, -0.6235728, 3.893383, 0, 0.7294118, 1, 1,
0.1760259, -1.762232, 1.834059, 0, 0.7254902, 1, 1,
0.17949, -0.1018409, 0.9530182, 0, 0.7176471, 1, 1,
0.1801862, 0.7187875, -0.62786, 0, 0.7137255, 1, 1,
0.1806547, 0.7306288, 0.4398542, 0, 0.7058824, 1, 1,
0.1808166, -0.04171989, 2.923136, 0, 0.6980392, 1, 1,
0.1834654, -0.5062598, 0.7295086, 0, 0.6941177, 1, 1,
0.1840501, 0.1166407, 1.126183, 0, 0.6862745, 1, 1,
0.1855348, 0.606916, 0.8786138, 0, 0.682353, 1, 1,
0.1903386, 1.372108, -2.128602, 0, 0.6745098, 1, 1,
0.1905326, -1.811702, 2.483899, 0, 0.6705883, 1, 1,
0.1926101, 0.2069074, 2.43942, 0, 0.6627451, 1, 1,
0.1935117, 1.920132, -1.25465, 0, 0.6588235, 1, 1,
0.19596, 0.02639401, 1.860461, 0, 0.6509804, 1, 1,
0.1969599, 1.023716, 0.6978727, 0, 0.6470588, 1, 1,
0.1997176, -1.21566, 1.626883, 0, 0.6392157, 1, 1,
0.2028885, -1.186494, 2.192752, 0, 0.6352941, 1, 1,
0.206765, -0.1617579, 2.243006, 0, 0.627451, 1, 1,
0.2080457, 0.7690558, 0.1776861, 0, 0.6235294, 1, 1,
0.2097033, -0.8391345, 2.575692, 0, 0.6156863, 1, 1,
0.2129338, -0.3980137, 3.349369, 0, 0.6117647, 1, 1,
0.2136808, -0.9145073, 2.592932, 0, 0.6039216, 1, 1,
0.215271, -1.485257, 3.686333, 0, 0.5960785, 1, 1,
0.2205506, 1.077887, 1.183455, 0, 0.5921569, 1, 1,
0.2210983, -0.1660998, 1.502915, 0, 0.5843138, 1, 1,
0.221668, 1.063483, 0.5059208, 0, 0.5803922, 1, 1,
0.225067, -1.261021, 3.055643, 0, 0.572549, 1, 1,
0.2251121, -0.3747137, 1.911032, 0, 0.5686275, 1, 1,
0.2328992, 0.484187, 0.951396, 0, 0.5607843, 1, 1,
0.2355206, 1.445928, 1.033234, 0, 0.5568628, 1, 1,
0.2376906, 0.5536708, 3.285509, 0, 0.5490196, 1, 1,
0.2395165, 0.6877332, 0.9746411, 0, 0.5450981, 1, 1,
0.2413226, -1.417137, 2.202214, 0, 0.5372549, 1, 1,
0.2426404, 0.3780147, 1.964999, 0, 0.5333334, 1, 1,
0.25078, 0.2965441, 0.9103565, 0, 0.5254902, 1, 1,
0.2517238, -1.173334, 3.220602, 0, 0.5215687, 1, 1,
0.2552655, -0.7871667, 2.037289, 0, 0.5137255, 1, 1,
0.2583934, -0.3185633, 2.001924, 0, 0.509804, 1, 1,
0.2611733, 0.2403563, -0.0859182, 0, 0.5019608, 1, 1,
0.2640573, 0.06887068, 1.14003, 0, 0.4941176, 1, 1,
0.265783, 0.3538981, 1.205159, 0, 0.4901961, 1, 1,
0.271744, -0.3048592, 1.274209, 0, 0.4823529, 1, 1,
0.2732226, -1.470534, 2.272515, 0, 0.4784314, 1, 1,
0.2742476, 1.212838, 1.198713, 0, 0.4705882, 1, 1,
0.2750879, -0.8013121, 1.955832, 0, 0.4666667, 1, 1,
0.278484, -0.217367, 1.693521, 0, 0.4588235, 1, 1,
0.2799511, 0.6897476, 1.644244, 0, 0.454902, 1, 1,
0.2806928, -0.5235443, 2.490789, 0, 0.4470588, 1, 1,
0.283387, 0.5992301, -0.2883529, 0, 0.4431373, 1, 1,
0.2957469, 2.134789, 0.1919868, 0, 0.4352941, 1, 1,
0.2997634, -0.07261098, 2.417229, 0, 0.4313726, 1, 1,
0.3010347, 0.9620368, -0.03974229, 0, 0.4235294, 1, 1,
0.3091167, 1.307551, -0.2245618, 0, 0.4196078, 1, 1,
0.314813, -1.903197, 1.519674, 0, 0.4117647, 1, 1,
0.3164564, 0.2154915, 1.550058, 0, 0.4078431, 1, 1,
0.3178523, 1.289215, 0.7424986, 0, 0.4, 1, 1,
0.3209081, 0.3926899, 0.570609, 0, 0.3921569, 1, 1,
0.3212755, -1.481597, 3.013261, 0, 0.3882353, 1, 1,
0.328342, -0.2877527, 2.155133, 0, 0.3803922, 1, 1,
0.3311652, 1.249965, 1.152025, 0, 0.3764706, 1, 1,
0.3328812, -0.6973082, 3.346827, 0, 0.3686275, 1, 1,
0.3339343, 0.5061111, -1.165546, 0, 0.3647059, 1, 1,
0.340032, 0.5876103, 1.398066, 0, 0.3568628, 1, 1,
0.3430727, -0.8922206, 4.342944, 0, 0.3529412, 1, 1,
0.3437236, -0.6714089, 2.188823, 0, 0.345098, 1, 1,
0.3446658, 1.511337, 0.7188064, 0, 0.3411765, 1, 1,
0.3491659, 1.267263, 0.03092549, 0, 0.3333333, 1, 1,
0.3496679, -0.04637445, 1.824803, 0, 0.3294118, 1, 1,
0.3532747, -0.2797827, 3.089606, 0, 0.3215686, 1, 1,
0.3533199, -0.8739259, 3.302529, 0, 0.3176471, 1, 1,
0.3544208, 0.2302423, 1.622886, 0, 0.3098039, 1, 1,
0.35542, -1.604657, 3.999918, 0, 0.3058824, 1, 1,
0.3563057, -0.06870995, 3.014868, 0, 0.2980392, 1, 1,
0.358238, -0.9356905, 2.717427, 0, 0.2901961, 1, 1,
0.3609646, 0.5145696, -0.4969436, 0, 0.2862745, 1, 1,
0.3652186, 0.5166157, 0.714731, 0, 0.2784314, 1, 1,
0.3676913, 0.7715118, 1.344483, 0, 0.2745098, 1, 1,
0.3693024, -0.6286589, 1.990299, 0, 0.2666667, 1, 1,
0.3708986, -0.6567273, 3.72648, 0, 0.2627451, 1, 1,
0.3711108, -1.12637, 2.103715, 0, 0.254902, 1, 1,
0.3723399, -0.3315123, 0.4551787, 0, 0.2509804, 1, 1,
0.3762397, -0.4927892, 2.023363, 0, 0.2431373, 1, 1,
0.3814764, -1.155123, 3.509656, 0, 0.2392157, 1, 1,
0.3823915, 0.6486588, 1.689492, 0, 0.2313726, 1, 1,
0.3869012, -0.9267375, 3.906088, 0, 0.227451, 1, 1,
0.3900634, -0.5076537, 3.088143, 0, 0.2196078, 1, 1,
0.3908235, -0.3455907, 2.309153, 0, 0.2156863, 1, 1,
0.391195, -0.1994975, 3.76907, 0, 0.2078431, 1, 1,
0.3955691, 0.2464354, -0.5124397, 0, 0.2039216, 1, 1,
0.39706, -1.27608, 0.279082, 0, 0.1960784, 1, 1,
0.3999641, 0.173206, 1.082746, 0, 0.1882353, 1, 1,
0.4032943, -0.2847226, 1.960954, 0, 0.1843137, 1, 1,
0.4045945, -1.096588, 3.193017, 0, 0.1764706, 1, 1,
0.4049495, -1.786771, 4.799312, 0, 0.172549, 1, 1,
0.4069941, -0.5334023, 1.363609, 0, 0.1647059, 1, 1,
0.4139615, 1.399943, 0.4470422, 0, 0.1607843, 1, 1,
0.4148271, -0.6481542, 1.774279, 0, 0.1529412, 1, 1,
0.4187197, 0.5767885, 1.092395, 0, 0.1490196, 1, 1,
0.4201341, -1.062716, 4.602476, 0, 0.1411765, 1, 1,
0.4272874, 0.3987821, 2.199731, 0, 0.1372549, 1, 1,
0.4283919, -0.1798312, 3.003069, 0, 0.1294118, 1, 1,
0.4298374, -0.1114249, 1.431621, 0, 0.1254902, 1, 1,
0.4302913, 1.590193, 1.094451, 0, 0.1176471, 1, 1,
0.4323353, 0.866406, 0.363451, 0, 0.1137255, 1, 1,
0.4344397, -1.025594, 3.498482, 0, 0.1058824, 1, 1,
0.4355799, 0.7722885, 1.086385, 0, 0.09803922, 1, 1,
0.4374613, -0.3953331, 2.848299, 0, 0.09411765, 1, 1,
0.4383221, 0.8049873, 0.4241619, 0, 0.08627451, 1, 1,
0.4419857, 1.05288, -0.08310561, 0, 0.08235294, 1, 1,
0.4473894, 1.512048, 0.5245342, 0, 0.07450981, 1, 1,
0.4519647, 0.5331089, 1.008139, 0, 0.07058824, 1, 1,
0.4541959, 0.9377061, 0.6406927, 0, 0.0627451, 1, 1,
0.4545426, 1.307504, 1.436134, 0, 0.05882353, 1, 1,
0.4575668, 0.1644278, 1.491266, 0, 0.05098039, 1, 1,
0.46157, 0.3624375, 1.476247, 0, 0.04705882, 1, 1,
0.462764, -0.5984901, 1.692724, 0, 0.03921569, 1, 1,
0.4652019, -1.583811, 2.306984, 0, 0.03529412, 1, 1,
0.4665659, 0.71824, -1.865321, 0, 0.02745098, 1, 1,
0.4716716, 2.219049, 1.091638, 0, 0.02352941, 1, 1,
0.4719729, 0.5465025, 0.6870326, 0, 0.01568628, 1, 1,
0.4739023, -1.004502, 1.083477, 0, 0.01176471, 1, 1,
0.4741665, 1.810929, -0.3910357, 0, 0.003921569, 1, 1,
0.4744164, -0.2832071, 0.9623064, 0.003921569, 0, 1, 1,
0.4758203, -1.203829, 1.279284, 0.007843138, 0, 1, 1,
0.4773516, 1.541359, 0.6876832, 0.01568628, 0, 1, 1,
0.479435, -1.596667, 4.459082, 0.01960784, 0, 1, 1,
0.4847375, -0.7123473, 2.919043, 0.02745098, 0, 1, 1,
0.4855062, 0.3225788, -0.5732341, 0.03137255, 0, 1, 1,
0.48673, 0.6699021, 2.962482, 0.03921569, 0, 1, 1,
0.4929033, 0.1590835, 1.816644, 0.04313726, 0, 1, 1,
0.4940752, -0.8338609, 3.49005, 0.05098039, 0, 1, 1,
0.49602, -1.406787, 2.397531, 0.05490196, 0, 1, 1,
0.4963361, -1.724261, 1.051306, 0.0627451, 0, 1, 1,
0.4971408, -0.9831508, 2.585545, 0.06666667, 0, 1, 1,
0.5051182, 0.8919514, 0.1611489, 0.07450981, 0, 1, 1,
0.5123702, -0.2353987, 1.241004, 0.07843138, 0, 1, 1,
0.5136312, -0.0724893, 1.238958, 0.08627451, 0, 1, 1,
0.513834, 1.153411, -1.059938, 0.09019608, 0, 1, 1,
0.5138478, 0.4700218, 1.204336, 0.09803922, 0, 1, 1,
0.5139806, -0.5307738, 3.102856, 0.1058824, 0, 1, 1,
0.5142659, 0.4462331, 0.5024547, 0.1098039, 0, 1, 1,
0.5207756, 1.664279, -0.684392, 0.1176471, 0, 1, 1,
0.5236081, 0.3012394, 0.42521, 0.1215686, 0, 1, 1,
0.5241786, -0.002621591, 1.545833, 0.1294118, 0, 1, 1,
0.5261802, -0.7975668, 1.635945, 0.1333333, 0, 1, 1,
0.5289297, 0.9695537, 1.187278, 0.1411765, 0, 1, 1,
0.5333703, 0.8804021, -0.4017103, 0.145098, 0, 1, 1,
0.5352827, 0.6896958, 0.3507013, 0.1529412, 0, 1, 1,
0.5376143, -0.2469958, 1.72499, 0.1568628, 0, 1, 1,
0.53843, 0.04723668, 1.995971, 0.1647059, 0, 1, 1,
0.5386501, -0.3085685, 2.995048, 0.1686275, 0, 1, 1,
0.539813, 0.007020673, 3.046491, 0.1764706, 0, 1, 1,
0.5409176, -0.0907908, 2.20609, 0.1803922, 0, 1, 1,
0.5435334, 1.731638, -0.01889827, 0.1882353, 0, 1, 1,
0.5452607, -0.4843992, 0.9764982, 0.1921569, 0, 1, 1,
0.5460571, -0.4646273, 3.010419, 0.2, 0, 1, 1,
0.5469786, -1.041038, 2.498865, 0.2078431, 0, 1, 1,
0.5486212, -0.1991006, 0.8984495, 0.2117647, 0, 1, 1,
0.5500814, 0.4334516, 1.578525, 0.2196078, 0, 1, 1,
0.551029, 0.4416873, 0.4290532, 0.2235294, 0, 1, 1,
0.5526481, -1.271673, 2.799749, 0.2313726, 0, 1, 1,
0.5546919, 0.7649714, 0.1884056, 0.2352941, 0, 1, 1,
0.5644405, 1.054161, 0.9826714, 0.2431373, 0, 1, 1,
0.5646577, -1.870187, 3.070064, 0.2470588, 0, 1, 1,
0.5658051, 0.1116365, 1.599756, 0.254902, 0, 1, 1,
0.5671793, 0.1002486, 1.562991, 0.2588235, 0, 1, 1,
0.5680926, 1.319022, 0.3366003, 0.2666667, 0, 1, 1,
0.5684925, 1.379838, -0.7522575, 0.2705882, 0, 1, 1,
0.5799341, 0.3348409, 0.854091, 0.2784314, 0, 1, 1,
0.5858134, -1.095587, 4.178421, 0.282353, 0, 1, 1,
0.5887314, 0.7715221, 1.284297, 0.2901961, 0, 1, 1,
0.592012, -1.046447, 2.105253, 0.2941177, 0, 1, 1,
0.593013, -0.55216, 3.180772, 0.3019608, 0, 1, 1,
0.5954339, -0.5376017, 1.810216, 0.3098039, 0, 1, 1,
0.5971509, -0.890897, 2.64768, 0.3137255, 0, 1, 1,
0.5977314, -0.4495467, 1.074067, 0.3215686, 0, 1, 1,
0.6008538, -0.08777621, 2.17602, 0.3254902, 0, 1, 1,
0.6029927, -0.6811997, 1.91817, 0.3333333, 0, 1, 1,
0.605384, 1.060699, -0.6689214, 0.3372549, 0, 1, 1,
0.613261, 2.069134, 0.08543089, 0.345098, 0, 1, 1,
0.6156316, 1.413551, 2.00615, 0.3490196, 0, 1, 1,
0.6213227, -1.026342, 3.384989, 0.3568628, 0, 1, 1,
0.6226331, 1.82146, -0.6923233, 0.3607843, 0, 1, 1,
0.6245462, 0.3576124, 1.332533, 0.3686275, 0, 1, 1,
0.628012, 0.2884669, -0.277272, 0.372549, 0, 1, 1,
0.6291179, -0.1597163, 0.6754981, 0.3803922, 0, 1, 1,
0.6297555, 0.04332289, 0.6170927, 0.3843137, 0, 1, 1,
0.6343902, 1.460617, 0.2936936, 0.3921569, 0, 1, 1,
0.6387435, -1.621961, 1.963412, 0.3960784, 0, 1, 1,
0.6414216, 0.2802434, -0.9225015, 0.4039216, 0, 1, 1,
0.6423707, -1.882665, 2.124657, 0.4117647, 0, 1, 1,
0.6449279, 1.478537, -0.4257636, 0.4156863, 0, 1, 1,
0.6537024, -1.223872, 2.310918, 0.4235294, 0, 1, 1,
0.6580705, 0.8765337, 3.614732, 0.427451, 0, 1, 1,
0.6614144, -0.4090117, 1.708876, 0.4352941, 0, 1, 1,
0.6657119, 0.5587969, -0.7199315, 0.4392157, 0, 1, 1,
0.6667337, 0.7848994, 0.06801467, 0.4470588, 0, 1, 1,
0.6672371, -0.8117437, 2.26387, 0.4509804, 0, 1, 1,
0.6678962, -1.23962, 2.037143, 0.4588235, 0, 1, 1,
0.6751307, -1.774628, 4.331757, 0.4627451, 0, 1, 1,
0.6759809, 0.7069802, 0.689694, 0.4705882, 0, 1, 1,
0.6802199, -1.004179, 3.851269, 0.4745098, 0, 1, 1,
0.6831993, -0.7777288, 2.27114, 0.4823529, 0, 1, 1,
0.6852402, 1.337633, -0.2935456, 0.4862745, 0, 1, 1,
0.6923034, -0.07875874, 2.295242, 0.4941176, 0, 1, 1,
0.694082, -0.6053125, 2.084805, 0.5019608, 0, 1, 1,
0.6950761, -1.40395, 3.099312, 0.5058824, 0, 1, 1,
0.7057648, 0.4493276, 1.398891, 0.5137255, 0, 1, 1,
0.7062932, 1.481551, 1.642158, 0.5176471, 0, 1, 1,
0.7138128, -0.8433548, 3.801196, 0.5254902, 0, 1, 1,
0.7148084, -0.07040881, 0.8021364, 0.5294118, 0, 1, 1,
0.7209612, 1.064854, 0.3897654, 0.5372549, 0, 1, 1,
0.7224364, -0.08787362, 3.158217, 0.5411765, 0, 1, 1,
0.7227505, 0.1587761, 0.5054242, 0.5490196, 0, 1, 1,
0.7245628, -1.743065, 3.911631, 0.5529412, 0, 1, 1,
0.7253127, -0.7071266, 2.767426, 0.5607843, 0, 1, 1,
0.7255675, 0.2661083, 0.6633046, 0.5647059, 0, 1, 1,
0.7257352, -0.02659339, 2.161546, 0.572549, 0, 1, 1,
0.7304852, -1.196066, 3.46661, 0.5764706, 0, 1, 1,
0.7377262, 0.31346, 2.317415, 0.5843138, 0, 1, 1,
0.7425234, 1.221259, 1.136627, 0.5882353, 0, 1, 1,
0.7445846, 0.9819798, 2.243277, 0.5960785, 0, 1, 1,
0.7466502, -0.8414278, 2.209521, 0.6039216, 0, 1, 1,
0.7487003, -0.5007711, 4.385283, 0.6078432, 0, 1, 1,
0.7497681, -1.858806, 1.748806, 0.6156863, 0, 1, 1,
0.7526992, -0.3571724, 1.844333, 0.6196079, 0, 1, 1,
0.7614446, 0.4122737, 0.834833, 0.627451, 0, 1, 1,
0.7622231, 0.07015957, 2.122119, 0.6313726, 0, 1, 1,
0.7656187, -1.03235, 4.015593, 0.6392157, 0, 1, 1,
0.7676134, -0.3182072, 1.373651, 0.6431373, 0, 1, 1,
0.7682453, -0.6724371, 2.068066, 0.6509804, 0, 1, 1,
0.77009, -0.6178201, 0.9081311, 0.654902, 0, 1, 1,
0.7709801, -0.05955526, 1.676676, 0.6627451, 0, 1, 1,
0.7724851, -0.2437446, 1.38434, 0.6666667, 0, 1, 1,
0.773437, -1.516921, 4.674781, 0.6745098, 0, 1, 1,
0.7852305, 0.510967, 0.2081249, 0.6784314, 0, 1, 1,
0.7855452, 1.010519, 0.2987371, 0.6862745, 0, 1, 1,
0.7879737, -1.428808, 3.35597, 0.6901961, 0, 1, 1,
0.7906203, -0.3994145, 1.570687, 0.6980392, 0, 1, 1,
0.7907539, -0.6271952, 2.306835, 0.7058824, 0, 1, 1,
0.7977503, 0.5317569, 1.100209, 0.7098039, 0, 1, 1,
0.8036987, -1.196518, 2.527591, 0.7176471, 0, 1, 1,
0.8048852, 0.2848515, 2.461271, 0.7215686, 0, 1, 1,
0.8062435, 0.8442059, 0.6840123, 0.7294118, 0, 1, 1,
0.8117528, -0.0603788, 0.5326663, 0.7333333, 0, 1, 1,
0.8121881, -0.004982187, 2.365846, 0.7411765, 0, 1, 1,
0.813243, -1.476817, 0.3163204, 0.7450981, 0, 1, 1,
0.8135736, 0.5656296, 1.613858, 0.7529412, 0, 1, 1,
0.8218105, -0.5937005, 1.112187, 0.7568628, 0, 1, 1,
0.8339509, -0.4798041, 1.98318, 0.7647059, 0, 1, 1,
0.8345606, -0.4217745, 2.448498, 0.7686275, 0, 1, 1,
0.8348948, 1.359364, -0.1903829, 0.7764706, 0, 1, 1,
0.8358243, 1.038643, 0.4340507, 0.7803922, 0, 1, 1,
0.8383222, 0.8143197, 1.760979, 0.7882353, 0, 1, 1,
0.8387091, 1.402398, -1.429992, 0.7921569, 0, 1, 1,
0.8414374, 0.9433076, 0.2808762, 0.8, 0, 1, 1,
0.8443469, 0.2978475, 1.546704, 0.8078431, 0, 1, 1,
0.8444368, -0.690988, 3.038905, 0.8117647, 0, 1, 1,
0.8451284, 0.1280153, 0.3320156, 0.8196079, 0, 1, 1,
0.8551745, -0.470245, 2.331445, 0.8235294, 0, 1, 1,
0.8653201, 1.661767, -0.7659859, 0.8313726, 0, 1, 1,
0.8678556, 0.7220137, 1.027038, 0.8352941, 0, 1, 1,
0.8688717, -0.487338, 1.417488, 0.8431373, 0, 1, 1,
0.8701357, -0.7083879, 2.168999, 0.8470588, 0, 1, 1,
0.8704889, 1.67322, 1.638399, 0.854902, 0, 1, 1,
0.8724213, -0.7051171, 3.473547, 0.8588235, 0, 1, 1,
0.8758414, -0.01200564, 2.530721, 0.8666667, 0, 1, 1,
0.8826249, -0.9890217, 1.183241, 0.8705882, 0, 1, 1,
0.8902714, -1.316298, 2.708004, 0.8784314, 0, 1, 1,
0.8908092, -0.2163532, 1.058272, 0.8823529, 0, 1, 1,
0.8941856, -0.005060089, 0.1632059, 0.8901961, 0, 1, 1,
0.8998291, 0.4897397, 2.28501, 0.8941177, 0, 1, 1,
0.904819, 1.808979, 1.505015, 0.9019608, 0, 1, 1,
0.919628, -0.92935, 2.218219, 0.9098039, 0, 1, 1,
0.9199582, -0.7374425, 0.867031, 0.9137255, 0, 1, 1,
0.9245465, 0.8797191, 0.7258597, 0.9215686, 0, 1, 1,
0.9246945, -1.014693, 2.224064, 0.9254902, 0, 1, 1,
0.938484, 0.2594263, 1.779048, 0.9333333, 0, 1, 1,
0.9447362, -1.603248, 2.885812, 0.9372549, 0, 1, 1,
0.9466484, -0.5194554, 1.09376, 0.945098, 0, 1, 1,
0.9496039, 1.68278, 0.6433728, 0.9490196, 0, 1, 1,
0.9506233, -1.584593, 4.549819, 0.9568627, 0, 1, 1,
0.9551586, 0.08044115, 0.04298245, 0.9607843, 0, 1, 1,
0.9555265, 0.6158468, -0.01493458, 0.9686275, 0, 1, 1,
0.955689, -1.286479, 2.359932, 0.972549, 0, 1, 1,
0.957227, -0.3189129, 0.8824669, 0.9803922, 0, 1, 1,
0.9588128, 1.021897, 1.324752, 0.9843137, 0, 1, 1,
0.9599001, -0.2316482, 2.182822, 0.9921569, 0, 1, 1,
0.9608361, 0.887886, 1.038309, 0.9960784, 0, 1, 1,
0.9620053, -0.2182618, 1.798527, 1, 0, 0.9960784, 1,
0.9656284, 0.02996804, 1.088482, 1, 0, 0.9882353, 1,
0.9685241, 0.7129554, 1.7534, 1, 0, 0.9843137, 1,
0.9799522, 0.5053893, 1.807364, 1, 0, 0.9764706, 1,
0.9809732, 0.510706, 1.493631, 1, 0, 0.972549, 1,
0.9828387, 2.396917, -1.346301, 1, 0, 0.9647059, 1,
0.9834729, -1.845198, 4.053258, 1, 0, 0.9607843, 1,
0.98558, 0.3655694, 1.220769, 1, 0, 0.9529412, 1,
0.9919056, -0.8482862, 1.655148, 1, 0, 0.9490196, 1,
1.000613, -0.8054019, 2.933097, 1, 0, 0.9411765, 1,
1.006227, 0.3565394, 2.231223, 1, 0, 0.9372549, 1,
1.006937, -0.4870571, 1.954381, 1, 0, 0.9294118, 1,
1.022824, 0.3861369, 1.734559, 1, 0, 0.9254902, 1,
1.023715, -0.4238484, 1.598531, 1, 0, 0.9176471, 1,
1.025187, 0.2372338, 2.440153, 1, 0, 0.9137255, 1,
1.034206, 0.01936766, 0.3421329, 1, 0, 0.9058824, 1,
1.035066, -0.6418153, 3.820471, 1, 0, 0.9019608, 1,
1.035145, -0.2556686, 1.85473, 1, 0, 0.8941177, 1,
1.036044, 0.04617407, 1.171034, 1, 0, 0.8862745, 1,
1.0366, 1.237521, -0.6596671, 1, 0, 0.8823529, 1,
1.04326, 2.321002, -0.2400875, 1, 0, 0.8745098, 1,
1.045899, -1.974716, 3.31169, 1, 0, 0.8705882, 1,
1.048775, -0.5381406, -0.01070355, 1, 0, 0.8627451, 1,
1.050413, 0.2651758, 0.409056, 1, 0, 0.8588235, 1,
1.056028, -0.6116395, 1.447697, 1, 0, 0.8509804, 1,
1.064374, -0.7799343, 0.809873, 1, 0, 0.8470588, 1,
1.067033, 0.5588726, 1.556428, 1, 0, 0.8392157, 1,
1.073273, 1.626756, -0.528636, 1, 0, 0.8352941, 1,
1.074562, 0.9983171, 0.7752289, 1, 0, 0.827451, 1,
1.078177, 0.02958154, 1.121997, 1, 0, 0.8235294, 1,
1.082437, -1.199037, 4.263162, 1, 0, 0.8156863, 1,
1.083037, 0.3478641, 3.266435, 1, 0, 0.8117647, 1,
1.085106, 1.377565, 0.1600347, 1, 0, 0.8039216, 1,
1.089416, 0.1065385, 0.8870418, 1, 0, 0.7960784, 1,
1.095558, -0.3713645, 4.240835, 1, 0, 0.7921569, 1,
1.099641, 0.8492525, 2.516178, 1, 0, 0.7843137, 1,
1.109053, -2.119431, 3.821511, 1, 0, 0.7803922, 1,
1.112807, -0.6517303, 1.645826, 1, 0, 0.772549, 1,
1.113052, 0.8810639, 0.5109774, 1, 0, 0.7686275, 1,
1.114413, -0.3402992, 1.387663, 1, 0, 0.7607843, 1,
1.121928, 0.7220393, 1.429306, 1, 0, 0.7568628, 1,
1.130445, -0.8945196, 1.561789, 1, 0, 0.7490196, 1,
1.132883, 0.03812704, 1.904556, 1, 0, 0.7450981, 1,
1.13296, 1.028788, 1.314466, 1, 0, 0.7372549, 1,
1.14679, -0.06541238, 1.460757, 1, 0, 0.7333333, 1,
1.14779, 1.061141, -0.2927517, 1, 0, 0.7254902, 1,
1.150806, -0.8814524, 0.6394439, 1, 0, 0.7215686, 1,
1.158661, 1.535992, 1.432191, 1, 0, 0.7137255, 1,
1.162189, 0.1305996, 0.3557792, 1, 0, 0.7098039, 1,
1.166446, -0.2715911, 2.086249, 1, 0, 0.7019608, 1,
1.182649, 0.2526971, 0.9740009, 1, 0, 0.6941177, 1,
1.192397, 1.24456, 0.2884187, 1, 0, 0.6901961, 1,
1.19916, 2.148049, -0.04937004, 1, 0, 0.682353, 1,
1.225735, 0.1042713, 0.7487083, 1, 0, 0.6784314, 1,
1.231697, 0.1318718, 1.168528, 1, 0, 0.6705883, 1,
1.236033, 1.069238, 0.1093846, 1, 0, 0.6666667, 1,
1.25026, -0.257022, 2.025593, 1, 0, 0.6588235, 1,
1.253354, -1.51761, 3.90998, 1, 0, 0.654902, 1,
1.259374, -0.08263908, 3.842054, 1, 0, 0.6470588, 1,
1.269732, 0.6897861, -0.534327, 1, 0, 0.6431373, 1,
1.276097, 0.8676546, 1.073041, 1, 0, 0.6352941, 1,
1.29545, -1.704224, 3.486271, 1, 0, 0.6313726, 1,
1.304157, 0.9828878, 1.594314, 1, 0, 0.6235294, 1,
1.316652, 0.1062807, 3.316806, 1, 0, 0.6196079, 1,
1.317567, -1.050596, 3.153297, 1, 0, 0.6117647, 1,
1.326472, -0.66062, 2.304106, 1, 0, 0.6078432, 1,
1.331103, -1.58603, 2.515413, 1, 0, 0.6, 1,
1.344032, 0.3489957, 1.817138, 1, 0, 0.5921569, 1,
1.349244, 0.761615, 0.8927405, 1, 0, 0.5882353, 1,
1.350456, 0.1431545, 1.293614, 1, 0, 0.5803922, 1,
1.351687, -0.1070889, 1.238872, 1, 0, 0.5764706, 1,
1.354096, 0.3096028, 0.9350638, 1, 0, 0.5686275, 1,
1.361684, 2.536588, 0.05630678, 1, 0, 0.5647059, 1,
1.364069, 0.02478165, 1.954957, 1, 0, 0.5568628, 1,
1.365174, 1.896851, 2.277072, 1, 0, 0.5529412, 1,
1.372735, -0.09297266, 1.56098, 1, 0, 0.5450981, 1,
1.374986, -0.448414, 1.592864, 1, 0, 0.5411765, 1,
1.383552, 0.1445301, 3.001328, 1, 0, 0.5333334, 1,
1.384917, 0.7506936, 0.5011893, 1, 0, 0.5294118, 1,
1.386737, 1.045825, 1.501746, 1, 0, 0.5215687, 1,
1.388773, -0.7959111, 0.833994, 1, 0, 0.5176471, 1,
1.396935, -0.6606491, 2.046458, 1, 0, 0.509804, 1,
1.411263, 1.716313, 0.997752, 1, 0, 0.5058824, 1,
1.411676, 0.4220882, 2.340375, 1, 0, 0.4980392, 1,
1.41245, 0.7607402, 1.928092, 1, 0, 0.4901961, 1,
1.435521, -2.514196, 3.050516, 1, 0, 0.4862745, 1,
1.453752, 0.2439879, 1.789088, 1, 0, 0.4784314, 1,
1.459619, 0.4117471, 2.110287, 1, 0, 0.4745098, 1,
1.465645, -1.111853, 1.37678, 1, 0, 0.4666667, 1,
1.473637, -1.851225, 2.450784, 1, 0, 0.4627451, 1,
1.475603, -3.252988, 4.665926, 1, 0, 0.454902, 1,
1.477513, 0.09885572, 1.4606, 1, 0, 0.4509804, 1,
1.480935, -0.9360919, 3.320407, 1, 0, 0.4431373, 1,
1.4909, -0.5920638, 0.185062, 1, 0, 0.4392157, 1,
1.504398, -0.2814372, 2.685406, 1, 0, 0.4313726, 1,
1.508662, 0.3715097, 0.9135063, 1, 0, 0.427451, 1,
1.515491, -0.2050526, 0.7243789, 1, 0, 0.4196078, 1,
1.521976, 1.218278, 2.412732, 1, 0, 0.4156863, 1,
1.554653, -1.23436, 4.749381, 1, 0, 0.4078431, 1,
1.557592, 0.5926708, 0.3479338, 1, 0, 0.4039216, 1,
1.587711, -1.040629, 1.822497, 1, 0, 0.3960784, 1,
1.590056, -0.1226451, 2.190465, 1, 0, 0.3882353, 1,
1.60138, 0.2019628, 1.444122, 1, 0, 0.3843137, 1,
1.60224, 0.5291706, 1.039132, 1, 0, 0.3764706, 1,
1.624665, 0.05466059, 3.360706, 1, 0, 0.372549, 1,
1.630459, -0.3683795, 0.01613823, 1, 0, 0.3647059, 1,
1.631606, -1.015533, 2.705736, 1, 0, 0.3607843, 1,
1.634802, 0.1128109, 1.235945, 1, 0, 0.3529412, 1,
1.64334, -1.413705, 3.403271, 1, 0, 0.3490196, 1,
1.653705, -0.7033406, 3.448025, 1, 0, 0.3411765, 1,
1.660586, -2.95486, 2.452147, 1, 0, 0.3372549, 1,
1.667768, -0.2006615, 2.212646, 1, 0, 0.3294118, 1,
1.673657, 0.1133521, 2.522352, 1, 0, 0.3254902, 1,
1.690336, 1.148804, 0.9434177, 1, 0, 0.3176471, 1,
1.712748, -1.216288, 2.750028, 1, 0, 0.3137255, 1,
1.726158, 1.117509, 0.8527948, 1, 0, 0.3058824, 1,
1.732528, 0.8071429, 2.846325, 1, 0, 0.2980392, 1,
1.744743, -0.5091246, -0.01536027, 1, 0, 0.2941177, 1,
1.777428, 0.5100262, 0.6787837, 1, 0, 0.2862745, 1,
1.78127, -0.1649965, 2.38011, 1, 0, 0.282353, 1,
1.802913, -0.704478, 1.87615, 1, 0, 0.2745098, 1,
1.815785, -0.5217083, 0.3849916, 1, 0, 0.2705882, 1,
1.818387, -0.7730916, 1.593644, 1, 0, 0.2627451, 1,
1.843596, 0.2113675, 2.45704, 1, 0, 0.2588235, 1,
1.846303, 0.4775286, 1.668721, 1, 0, 0.2509804, 1,
1.856103, -0.3572465, 0.3322517, 1, 0, 0.2470588, 1,
1.873561, 0.4324954, 2.422233, 1, 0, 0.2392157, 1,
1.929725, -0.2157588, 0.7745119, 1, 0, 0.2352941, 1,
1.964456, 0.1138182, -0.01477977, 1, 0, 0.227451, 1,
1.975836, -1.634104, 2.348113, 1, 0, 0.2235294, 1,
1.983806, -1.368789, 1.08619, 1, 0, 0.2156863, 1,
2.004439, -0.4537352, -0.003433106, 1, 0, 0.2117647, 1,
2.023986, -1.878975, 3.792899, 1, 0, 0.2039216, 1,
2.025305, -1.201902, 2.076579, 1, 0, 0.1960784, 1,
2.057323, -0.7518275, 1.847788, 1, 0, 0.1921569, 1,
2.10287, 0.6533622, 0.741588, 1, 0, 0.1843137, 1,
2.112198, 1.93656, 0.4494041, 1, 0, 0.1803922, 1,
2.112773, -0.4299842, 2.013602, 1, 0, 0.172549, 1,
2.141919, 0.6683456, 1.583937, 1, 0, 0.1686275, 1,
2.147598, 3.368971, -0.8281611, 1, 0, 0.1607843, 1,
2.169196, 0.6072026, 3.143337, 1, 0, 0.1568628, 1,
2.187718, 0.1625998, 1.301303, 1, 0, 0.1490196, 1,
2.190512, 0.6262779, 0.741512, 1, 0, 0.145098, 1,
2.206798, -0.7494745, 2.42943, 1, 0, 0.1372549, 1,
2.221004, 1.32048, 0.6209809, 1, 0, 0.1333333, 1,
2.253816, 1.608601, 2.179116, 1, 0, 0.1254902, 1,
2.267861, 1.399681, 1.948702, 1, 0, 0.1215686, 1,
2.270105, 0.591512, 1.720669, 1, 0, 0.1137255, 1,
2.281262, -2.60465, 2.943815, 1, 0, 0.1098039, 1,
2.301412, -0.1103436, 0.8571957, 1, 0, 0.1019608, 1,
2.44969, 1.76921, 1.356102, 1, 0, 0.09411765, 1,
2.464278, 1.62678, 2.259093, 1, 0, 0.09019608, 1,
2.490644, 2.135544, 0.2518068, 1, 0, 0.08235294, 1,
2.497572, 0.1193629, 1.372877, 1, 0, 0.07843138, 1,
2.578039, 1.861064, -0.1305798, 1, 0, 0.07058824, 1,
2.604356, 1.788482, -1.21543, 1, 0, 0.06666667, 1,
2.614074, 1.705135, 0.9335637, 1, 0, 0.05882353, 1,
2.631709, -0.7704244, 1.632305, 1, 0, 0.05490196, 1,
2.70498, 2.252396, 0.5378079, 1, 0, 0.04705882, 1,
2.714927, -0.5890242, 3.260996, 1, 0, 0.04313726, 1,
2.735588, -0.7543722, 2.907632, 1, 0, 0.03529412, 1,
2.804114, 0.5528911, 2.508842, 1, 0, 0.03137255, 1,
2.898441, 0.1590989, 1.914236, 1, 0, 0.02352941, 1,
2.985366, -0.8611595, 0.8603216, 1, 0, 0.01960784, 1,
3.599081, 0.6733401, 1.698279, 1, 0, 0.01176471, 1,
3.873324, -0.01842002, 1.446401, 1, 0, 0.007843138, 1
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
0.2475801, -4.37541, -7.28558, 0, -0.5, 0.5, 0.5,
0.2475801, -4.37541, -7.28558, 1, -0.5, 0.5, 0.5,
0.2475801, -4.37541, -7.28558, 1, 1.5, 0.5, 0.5,
0.2475801, -4.37541, -7.28558, 0, 1.5, 0.5, 0.5
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
-4.607291, 0.0579915, -7.28558, 0, -0.5, 0.5, 0.5,
-4.607291, 0.0579915, -7.28558, 1, -0.5, 0.5, 0.5,
-4.607291, 0.0579915, -7.28558, 1, 1.5, 0.5, 0.5,
-4.607291, 0.0579915, -7.28558, 0, 1.5, 0.5, 0.5
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
-4.607291, -4.37541, -0.2251828, 0, -0.5, 0.5, 0.5,
-4.607291, -4.37541, -0.2251828, 1, -0.5, 0.5, 0.5,
-4.607291, -4.37541, -0.2251828, 1, 1.5, 0.5, 0.5,
-4.607291, -4.37541, -0.2251828, 0, 1.5, 0.5, 0.5
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
-2, -3.352318, -5.656257,
2, -3.352318, -5.656257,
-2, -3.352318, -5.656257,
-2, -3.522833, -5.927811,
0, -3.352318, -5.656257,
0, -3.522833, -5.927811,
2, -3.352318, -5.656257,
2, -3.522833, -5.927811
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
-2, -3.863864, -6.470919, 0, -0.5, 0.5, 0.5,
-2, -3.863864, -6.470919, 1, -0.5, 0.5, 0.5,
-2, -3.863864, -6.470919, 1, 1.5, 0.5, 0.5,
-2, -3.863864, -6.470919, 0, 1.5, 0.5, 0.5,
0, -3.863864, -6.470919, 0, -0.5, 0.5, 0.5,
0, -3.863864, -6.470919, 1, -0.5, 0.5, 0.5,
0, -3.863864, -6.470919, 1, 1.5, 0.5, 0.5,
0, -3.863864, -6.470919, 0, 1.5, 0.5, 0.5,
2, -3.863864, -6.470919, 0, -0.5, 0.5, 0.5,
2, -3.863864, -6.470919, 1, -0.5, 0.5, 0.5,
2, -3.863864, -6.470919, 1, 1.5, 0.5, 0.5,
2, -3.863864, -6.470919, 0, 1.5, 0.5, 0.5
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
-3.486936, -3, -5.656257,
-3.486936, 3, -5.656257,
-3.486936, -3, -5.656257,
-3.673662, -3, -5.927811,
-3.486936, -2, -5.656257,
-3.673662, -2, -5.927811,
-3.486936, -1, -5.656257,
-3.673662, -1, -5.927811,
-3.486936, 0, -5.656257,
-3.673662, 0, -5.927811,
-3.486936, 1, -5.656257,
-3.673662, 1, -5.927811,
-3.486936, 2, -5.656257,
-3.673662, 2, -5.927811,
-3.486936, 3, -5.656257,
-3.673662, 3, -5.927811
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
-4.047113, -3, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, -3, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, -3, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, -3, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, -2, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, -2, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, -2, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, -2, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, -1, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, -1, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, -1, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, -1, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, 0, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, 0, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, 0, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, 0, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, 1, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, 1, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, 1, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, 1, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, 2, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, 2, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, 2, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, 2, -6.470919, 0, 1.5, 0.5, 0.5,
-4.047113, 3, -6.470919, 0, -0.5, 0.5, 0.5,
-4.047113, 3, -6.470919, 1, -0.5, 0.5, 0.5,
-4.047113, 3, -6.470919, 1, 1.5, 0.5, 0.5,
-4.047113, 3, -6.470919, 0, 1.5, 0.5, 0.5
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
-3.486936, -3.352318, -4,
-3.486936, -3.352318, 4,
-3.486936, -3.352318, -4,
-3.673662, -3.522833, -4,
-3.486936, -3.352318, -2,
-3.673662, -3.522833, -2,
-3.486936, -3.352318, 0,
-3.673662, -3.522833, 0,
-3.486936, -3.352318, 2,
-3.673662, -3.522833, 2,
-3.486936, -3.352318, 4,
-3.673662, -3.522833, 4
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
-4.047113, -3.863864, -4, 0, -0.5, 0.5, 0.5,
-4.047113, -3.863864, -4, 1, -0.5, 0.5, 0.5,
-4.047113, -3.863864, -4, 1, 1.5, 0.5, 0.5,
-4.047113, -3.863864, -4, 0, 1.5, 0.5, 0.5,
-4.047113, -3.863864, -2, 0, -0.5, 0.5, 0.5,
-4.047113, -3.863864, -2, 1, -0.5, 0.5, 0.5,
-4.047113, -3.863864, -2, 1, 1.5, 0.5, 0.5,
-4.047113, -3.863864, -2, 0, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 0, 0, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 0, 1, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 0, 1, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 0, 0, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 2, 0, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 2, 1, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 2, 1, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 2, 0, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 4, 0, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 4, 1, -0.5, 0.5, 0.5,
-4.047113, -3.863864, 4, 1, 1.5, 0.5, 0.5,
-4.047113, -3.863864, 4, 0, 1.5, 0.5, 0.5
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
-3.486936, -3.352318, -5.656257,
-3.486936, 3.468301, -5.656257,
-3.486936, -3.352318, 5.205892,
-3.486936, 3.468301, 5.205892,
-3.486936, -3.352318, -5.656257,
-3.486936, -3.352318, 5.205892,
-3.486936, 3.468301, -5.656257,
-3.486936, 3.468301, 5.205892,
-3.486936, -3.352318, -5.656257,
3.982096, -3.352318, -5.656257,
-3.486936, -3.352318, 5.205892,
3.982096, -3.352318, 5.205892,
-3.486936, 3.468301, -5.656257,
3.982096, 3.468301, -5.656257,
-3.486936, 3.468301, 5.205892,
3.982096, 3.468301, 5.205892,
3.982096, -3.352318, -5.656257,
3.982096, 3.468301, -5.656257,
3.982096, -3.352318, 5.205892,
3.982096, 3.468301, 5.205892,
3.982096, -3.352318, -5.656257,
3.982096, -3.352318, 5.205892,
3.982096, 3.468301, -5.656257,
3.982096, 3.468301, 5.205892
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
var radius = 7.925494;
var distance = 35.26142;
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
mvMatrix.translate( -0.2475801, -0.0579915, 0.2251828 );
mvMatrix.scale( 1.147297, 1.256367, 0.7889047 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26142);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
3-phenoxybenzenemeth<-read.table("3-phenoxybenzenemeth.xyz")
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
-3.378164, 1.461182, 1.736675, 0, 0, 1, 1, 1,
-2.952285, 0.1193695, -2.85797, 1, 0, 0, 1, 1,
-2.689714, -1.161337, -0.9027723, 1, 0, 0, 1, 1,
-2.392906, -0.618508, -0.465926, 1, 0, 0, 1, 1,
-2.378139, -0.3038957, 0.3151694, 1, 0, 0, 1, 1,
-2.366834, 0.9009081, -2.105196, 1, 0, 0, 1, 1,
-2.302484, 1.54938, -1.206802, 0, 0, 0, 1, 1,
-2.291968, -0.3945642, -2.626976, 0, 0, 0, 1, 1,
-2.289623, -1.501727, -0.9993266, 0, 0, 0, 1, 1,
-2.257134, 2.252572, -0.05286054, 0, 0, 0, 1, 1,
-2.223589, -0.7543063, -2.283824, 0, 0, 0, 1, 1,
-2.210526, -0.6441369, -1.031708, 0, 0, 0, 1, 1,
-2.167692, -0.1051444, -2.589085, 0, 0, 0, 1, 1,
-2.161805, -0.9817674, -1.108929, 1, 1, 1, 1, 1,
-2.159241, 0.6355841, 0.1412693, 1, 1, 1, 1, 1,
-2.152989, 0.1118306, -0.6773135, 1, 1, 1, 1, 1,
-2.133035, 0.2641101, -0.3824618, 1, 1, 1, 1, 1,
-2.132681, 0.1055784, -1.041309, 1, 1, 1, 1, 1,
-2.124677, -1.153947, -0.8332667, 1, 1, 1, 1, 1,
-2.091583, 0.4384416, -0.7616042, 1, 1, 1, 1, 1,
-2.047682, 0.435706, -1.03285, 1, 1, 1, 1, 1,
-2.006051, 0.04909492, -1.584038, 1, 1, 1, 1, 1,
-1.970568, -0.7145413, -0.5636284, 1, 1, 1, 1, 1,
-1.969749, -0.5235024, -0.881417, 1, 1, 1, 1, 1,
-1.967155, 1.558246, -0.3580767, 1, 1, 1, 1, 1,
-1.959687, -1.432321, -1.565748, 1, 1, 1, 1, 1,
-1.958236, -0.8239977, -1.546107, 1, 1, 1, 1, 1,
-1.930487, 0.1007072, -0.9294552, 1, 1, 1, 1, 1,
-1.922898, -0.3607537, -1.69324, 0, 0, 1, 1, 1,
-1.919073, -0.7643948, -1.411568, 1, 0, 0, 1, 1,
-1.896915, 2.82962, -0.2707476, 1, 0, 0, 1, 1,
-1.885762, 0.4421841, -1.17953, 1, 0, 0, 1, 1,
-1.880282, 0.3375272, -1.262081, 1, 0, 0, 1, 1,
-1.858175, 0.3054467, -0.4560556, 1, 0, 0, 1, 1,
-1.855473, 0.3305402, -0.9728816, 0, 0, 0, 1, 1,
-1.796763, 0.1864028, -0.6585901, 0, 0, 0, 1, 1,
-1.7716, -0.7983203, -1.715855, 0, 0, 0, 1, 1,
-1.768433, 1.319669, -2.37906, 0, 0, 0, 1, 1,
-1.734034, -0.5852355, -1.206808, 0, 0, 0, 1, 1,
-1.733284, -1.176793, -3.291497, 0, 0, 0, 1, 1,
-1.723004, -0.6503067, -2.515614, 0, 0, 0, 1, 1,
-1.708904, 0.8644185, -2.711443, 1, 1, 1, 1, 1,
-1.69561, -0.7360356, -0.5031058, 1, 1, 1, 1, 1,
-1.693924, 1.342851, -0.8405689, 1, 1, 1, 1, 1,
-1.691341, -0.265619, -2.281905, 1, 1, 1, 1, 1,
-1.68285, -0.5091873, 0.2783658, 1, 1, 1, 1, 1,
-1.678219, -0.6039949, -2.211957, 1, 1, 1, 1, 1,
-1.663892, -0.3687308, -1.9001, 1, 1, 1, 1, 1,
-1.650804, 0.3264989, -0.04411216, 1, 1, 1, 1, 1,
-1.649548, -0.4505592, -1.626092, 1, 1, 1, 1, 1,
-1.635105, -1.694416, -1.719427, 1, 1, 1, 1, 1,
-1.633061, -2.50037, -3.391203, 1, 1, 1, 1, 1,
-1.632104, -0.3370086, -2.218869, 1, 1, 1, 1, 1,
-1.621065, 0.9076588, -2.253731, 1, 1, 1, 1, 1,
-1.619993, 0.09905706, 0.7385311, 1, 1, 1, 1, 1,
-1.61957, 3.11115, -0.8014555, 1, 1, 1, 1, 1,
-1.612138, 0.4989508, -1.57269, 0, 0, 1, 1, 1,
-1.609501, -0.5756486, -1.999408, 1, 0, 0, 1, 1,
-1.609083, -0.444748, -0.8059602, 1, 0, 0, 1, 1,
-1.596403, -1.334109, -1.843456, 1, 0, 0, 1, 1,
-1.595224, 0.1781507, -0.9114862, 1, 0, 0, 1, 1,
-1.594674, -0.6518677, -1.189228, 1, 0, 0, 1, 1,
-1.593456, -1.121707, -3.094631, 0, 0, 0, 1, 1,
-1.556987, -0.3128287, -2.569921, 0, 0, 0, 1, 1,
-1.533038, 0.9717609, -0.2243297, 0, 0, 0, 1, 1,
-1.526164, 0.2323342, -0.9617895, 0, 0, 0, 1, 1,
-1.518387, 0.06814461, 0.7960882, 0, 0, 0, 1, 1,
-1.493518, 1.114671, -1.121673, 0, 0, 0, 1, 1,
-1.464879, 0.3128795, -1.777772, 0, 0, 0, 1, 1,
-1.458634, -0.5379564, -1.092304, 1, 1, 1, 1, 1,
-1.439111, 0.100023, -1.658268, 1, 1, 1, 1, 1,
-1.433294, 0.04618699, -1.078972, 1, 1, 1, 1, 1,
-1.431482, 0.1370003, -0.524, 1, 1, 1, 1, 1,
-1.428376, 0.3660227, -1.095667, 1, 1, 1, 1, 1,
-1.421324, 0.8075838, -0.8254, 1, 1, 1, 1, 1,
-1.414702, -0.4098239, -2.438659, 1, 1, 1, 1, 1,
-1.410594, -1.473907, -1.723649, 1, 1, 1, 1, 1,
-1.408473, 0.1411254, -2.464337, 1, 1, 1, 1, 1,
-1.39825, -1.28908, -2.681894, 1, 1, 1, 1, 1,
-1.386674, -0.1312745, -0.9319047, 1, 1, 1, 1, 1,
-1.382104, -0.6810147, -1.83294, 1, 1, 1, 1, 1,
-1.373795, -1.737692, -2.98263, 1, 1, 1, 1, 1,
-1.361975, 1.592682, -1.821766, 1, 1, 1, 1, 1,
-1.360635, -1.487222, -2.303669, 1, 1, 1, 1, 1,
-1.35749, -1.24177, -0.9889452, 0, 0, 1, 1, 1,
-1.343783, 1.976882, -0.1689057, 1, 0, 0, 1, 1,
-1.334997, 1.092569, -1.324018, 1, 0, 0, 1, 1,
-1.33445, -1.707105, -2.299066, 1, 0, 0, 1, 1,
-1.331917, 0.6068115, -0.0518323, 1, 0, 0, 1, 1,
-1.330239, -0.4379998, -1.894251, 1, 0, 0, 1, 1,
-1.328359, -0.4408929, -3.156826, 0, 0, 0, 1, 1,
-1.324276, 2.486561, -0.08463339, 0, 0, 0, 1, 1,
-1.306298, 0.2921474, -3.626593, 0, 0, 0, 1, 1,
-1.303487, -0.6911123, -1.389214, 0, 0, 0, 1, 1,
-1.299754, 0.2311864, -0.5883712, 0, 0, 0, 1, 1,
-1.286223, 1.743625, 1.347095, 0, 0, 0, 1, 1,
-1.276737, 1.669443, 0.2556073, 0, 0, 0, 1, 1,
-1.269702, 0.4764915, -0.9589612, 1, 1, 1, 1, 1,
-1.257245, 0.8718954, -1.129973, 1, 1, 1, 1, 1,
-1.257137, -1.714983, -1.621801, 1, 1, 1, 1, 1,
-1.255464, 0.7948307, -0.2807455, 1, 1, 1, 1, 1,
-1.253567, 0.8441625, -0.05245395, 1, 1, 1, 1, 1,
-1.24376, 0.9163688, -2.313596, 1, 1, 1, 1, 1,
-1.239312, -0.1158718, -2.209118, 1, 1, 1, 1, 1,
-1.232974, 0.06080044, -0.8815278, 1, 1, 1, 1, 1,
-1.203232, -0.2374556, -2.389281, 1, 1, 1, 1, 1,
-1.202863, -0.1902362, -0.884014, 1, 1, 1, 1, 1,
-1.202671, -1.450404, -4.303175, 1, 1, 1, 1, 1,
-1.187251, 2.28478, -0.3005904, 1, 1, 1, 1, 1,
-1.175835, 0.8710623, -1.892502, 1, 1, 1, 1, 1,
-1.163301, -0.5329406, -1.589384, 1, 1, 1, 1, 1,
-1.157162, 0.1326684, -2.80811, 1, 1, 1, 1, 1,
-1.152859, 0.1475501, -2.105579, 0, 0, 1, 1, 1,
-1.13655, 1.693586, -0.9382738, 1, 0, 0, 1, 1,
-1.129893, -0.9480945, -2.194067, 1, 0, 0, 1, 1,
-1.128563, 0.1863899, -0.8682448, 1, 0, 0, 1, 1,
-1.126787, 0.4796125, 0.3378597, 1, 0, 0, 1, 1,
-1.126467, -0.7691609, -3.36319, 1, 0, 0, 1, 1,
-1.126295, 1.07939, -1.019353, 0, 0, 0, 1, 1,
-1.125656, -1.282846, -2.037289, 0, 0, 0, 1, 1,
-1.123461, 0.1491245, 0.6981596, 0, 0, 0, 1, 1,
-1.121069, 0.7368944, -2.458547, 0, 0, 0, 1, 1,
-1.11958, 0.03667937, -1.348253, 0, 0, 0, 1, 1,
-1.116218, 0.2664549, -1.585136, 0, 0, 0, 1, 1,
-1.111957, 0.6863458, -2.066139, 0, 0, 0, 1, 1,
-1.106032, 0.7962834, 0.3700219, 1, 1, 1, 1, 1,
-1.101669, 1.008557, -0.04904589, 1, 1, 1, 1, 1,
-1.097422, 0.3028676, -2.962055, 1, 1, 1, 1, 1,
-1.094441, -0.1793015, -0.6038873, 1, 1, 1, 1, 1,
-1.092134, -0.785477, -1.219715, 1, 1, 1, 1, 1,
-1.085202, -0.7764229, -1.360427, 1, 1, 1, 1, 1,
-1.08331, 0.9262739, -0.8620045, 1, 1, 1, 1, 1,
-1.075447, 1.589285, -0.6071854, 1, 1, 1, 1, 1,
-1.075184, -1.49544, -1.597782, 1, 1, 1, 1, 1,
-1.065788, 0.5371493, -1.667288, 1, 1, 1, 1, 1,
-1.063404, -0.01342775, -1.635635, 1, 1, 1, 1, 1,
-1.05908, -0.1161034, -3.438303, 1, 1, 1, 1, 1,
-1.054194, 0.01121822, -1.403364, 1, 1, 1, 1, 1,
-1.044424, -0.4150327, -2.439731, 1, 1, 1, 1, 1,
-1.043406, -0.6249568, -2.582237, 1, 1, 1, 1, 1,
-1.042522, 1.392873, 0.6339253, 0, 0, 1, 1, 1,
-1.036393, -0.7368255, -1.695789, 1, 0, 0, 1, 1,
-1.031202, -1.827147, -2.912044, 1, 0, 0, 1, 1,
-1.028926, -0.08039515, -1.643731, 1, 0, 0, 1, 1,
-1.028852, 0.2765299, -1.332226, 1, 0, 0, 1, 1,
-1.024189, 1.774693, -1.701818, 1, 0, 0, 1, 1,
-1.022811, 1.124249, -2.445668, 0, 0, 0, 1, 1,
-1.022657, -0.809603, -3.888726, 0, 0, 0, 1, 1,
-1.021529, -0.9432297, -1.116744, 0, 0, 0, 1, 1,
-1.018606, -1.096859, -1.104319, 0, 0, 0, 1, 1,
-1.016667, -1.166502, -3.263365, 0, 0, 0, 1, 1,
-1.008944, 2.925656, 0.8031299, 0, 0, 0, 1, 1,
-1.008232, -1.573298, -2.43229, 0, 0, 0, 1, 1,
-1.003094, 0.01551529, -1.811713, 1, 1, 1, 1, 1,
-1.002247, -0.2160013, -0.8741091, 1, 1, 1, 1, 1,
-0.9906209, 1.049779, 1.977485, 1, 1, 1, 1, 1,
-0.9896285, 0.5677957, -1.345553, 1, 1, 1, 1, 1,
-0.9877887, -0.8405727, -3.78017, 1, 1, 1, 1, 1,
-0.9847167, -0.04064723, -2.620977, 1, 1, 1, 1, 1,
-0.9765418, -0.7971873, -1.806201, 1, 1, 1, 1, 1,
-0.9759341, -1.172465, -3.183995, 1, 1, 1, 1, 1,
-0.974736, 0.8166388, 0.6462337, 1, 1, 1, 1, 1,
-0.9735948, 0.023939, -0.6225973, 1, 1, 1, 1, 1,
-0.9725288, -0.2727494, 0.552704, 1, 1, 1, 1, 1,
-0.9725034, 0.613877, -1.25621, 1, 1, 1, 1, 1,
-0.9688665, 0.3605336, 0.0858518, 1, 1, 1, 1, 1,
-0.9626953, -0.288935, -1.955018, 1, 1, 1, 1, 1,
-0.9620983, -0.1096117, -3.284717, 1, 1, 1, 1, 1,
-0.9583375, -2.403327, -1.882774, 0, 0, 1, 1, 1,
-0.9532143, -1.411325, -1.477606, 1, 0, 0, 1, 1,
-0.9516703, 0.8174463, -0.9070226, 1, 0, 0, 1, 1,
-0.9447964, -1.213707, -1.845695, 1, 0, 0, 1, 1,
-0.9365367, 0.6370884, -0.4406644, 1, 0, 0, 1, 1,
-0.9284637, -1.793019, -3.308701, 1, 0, 0, 1, 1,
-0.9096731, 0.2995645, -1.500242, 0, 0, 0, 1, 1,
-0.9036337, -0.9432486, -2.320567, 0, 0, 0, 1, 1,
-0.9023424, 1.712734, -0.07147752, 0, 0, 0, 1, 1,
-0.9000458, 1.030916, -1.268854, 0, 0, 0, 1, 1,
-0.8984845, -0.1983486, -0.9865721, 0, 0, 0, 1, 1,
-0.8982873, 0.5548003, -1.621324, 0, 0, 0, 1, 1,
-0.8975073, -0.5046096, -2.452086, 0, 0, 0, 1, 1,
-0.8934535, -1.241138, -1.73309, 1, 1, 1, 1, 1,
-0.8883423, 0.546226, -0.1937409, 1, 1, 1, 1, 1,
-0.8803402, 0.03024995, 0.3508891, 1, 1, 1, 1, 1,
-0.8589029, 0.6234741, -0.6226872, 1, 1, 1, 1, 1,
-0.8573429, 0.06931176, -1.778351, 1, 1, 1, 1, 1,
-0.8517343, -2.028774, -2.732051, 1, 1, 1, 1, 1,
-0.8440191, -0.7562431, -3.019212, 1, 1, 1, 1, 1,
-0.8393795, 1.347481, -0.3119591, 1, 1, 1, 1, 1,
-0.8344625, 0.4426732, -1.941726, 1, 1, 1, 1, 1,
-0.8311471, 1.253051, -1.318592, 1, 1, 1, 1, 1,
-0.8286352, 0.3510806, -1.016687, 1, 1, 1, 1, 1,
-0.8282517, 1.106025, -2.137859, 1, 1, 1, 1, 1,
-0.8208106, -1.111424, -3.602951, 1, 1, 1, 1, 1,
-0.8205735, 0.4598414, -1.496426, 1, 1, 1, 1, 1,
-0.8152678, -0.4349559, -0.8844144, 1, 1, 1, 1, 1,
-0.8042292, 0.5661324, 1.038331, 0, 0, 1, 1, 1,
-0.8010305, -0.6501578, -0.8735179, 1, 0, 0, 1, 1,
-0.7972196, 1.121704, -1.804284, 1, 0, 0, 1, 1,
-0.7925109, 0.06368015, -2.149376, 1, 0, 0, 1, 1,
-0.7902532, 1.148949, 0.1009644, 1, 0, 0, 1, 1,
-0.7894779, -1.447361, -0.9792842, 1, 0, 0, 1, 1,
-0.7848664, 0.7005237, -0.6509826, 0, 0, 0, 1, 1,
-0.7803311, 1.524742, -0.9120333, 0, 0, 0, 1, 1,
-0.7751024, -0.04231401, -1.834302, 0, 0, 0, 1, 1,
-0.7702553, -0.4309947, -0.03284099, 0, 0, 0, 1, 1,
-0.7668445, -1.734196, -2.373078, 0, 0, 0, 1, 1,
-0.7644196, -1.639774, -4.594543, 0, 0, 0, 1, 1,
-0.7624823, -0.2754402, -2.644839, 0, 0, 0, 1, 1,
-0.75758, 0.1370316, -1.926483, 1, 1, 1, 1, 1,
-0.7568792, -1.008355, -2.175031, 1, 1, 1, 1, 1,
-0.7523673, 0.3706428, -0.3521557, 1, 1, 1, 1, 1,
-0.7484914, -0.2467119, -2.540278, 1, 1, 1, 1, 1,
-0.7480208, 1.359354, -1.112651, 1, 1, 1, 1, 1,
-0.7467212, 0.3100766, -0.7031775, 1, 1, 1, 1, 1,
-0.7395269, 0.6518236, -0.8958262, 1, 1, 1, 1, 1,
-0.7389718, -0.5950516, -2.758957, 1, 1, 1, 1, 1,
-0.7224363, 0.1808023, -2.122851, 1, 1, 1, 1, 1,
-0.7209471, -0.5361731, -2.541538, 1, 1, 1, 1, 1,
-0.7161086, 0.6703846, -0.8016231, 1, 1, 1, 1, 1,
-0.7086354, -2.291862, -3.176822, 1, 1, 1, 1, 1,
-0.7067213, -0.5840288, -1.540764, 1, 1, 1, 1, 1,
-0.7054611, 0.208519, -1.26505, 1, 1, 1, 1, 1,
-0.7052378, 0.6786183, -1.174815, 1, 1, 1, 1, 1,
-0.6973106, -0.9449339, -1.397138, 0, 0, 1, 1, 1,
-0.6939765, -0.01788346, -1.912824, 1, 0, 0, 1, 1,
-0.6919088, 2.102193, 0.8909748, 1, 0, 0, 1, 1,
-0.6900849, 0.4055608, -1.353942, 1, 0, 0, 1, 1,
-0.6843117, -1.322293, -1.266216, 1, 0, 0, 1, 1,
-0.6838001, -0.348258, -2.04027, 1, 0, 0, 1, 1,
-0.6802225, 1.047083, 1.57429, 0, 0, 0, 1, 1,
-0.6799455, 1.725039, -1.511792, 0, 0, 0, 1, 1,
-0.6775085, 0.5150546, 0.7469947, 0, 0, 0, 1, 1,
-0.6743057, -0.4383247, -3.094795, 0, 0, 0, 1, 1,
-0.6721786, 0.9725579, -2.160932, 0, 0, 0, 1, 1,
-0.6718488, 0.2898069, -2.06716, 0, 0, 0, 1, 1,
-0.6668065, -1.330702, -0.9789479, 0, 0, 0, 1, 1,
-0.6502802, -0.6708313, -2.170621, 1, 1, 1, 1, 1,
-0.6494991, -0.8240654, -4.101461, 1, 1, 1, 1, 1,
-0.6480922, 1.814453, -1.509415, 1, 1, 1, 1, 1,
-0.6396105, 0.0670886, -1.452507, 1, 1, 1, 1, 1,
-0.6312323, 0.4353446, -2.406975, 1, 1, 1, 1, 1,
-0.6299426, -0.212057, -1.305054, 1, 1, 1, 1, 1,
-0.6263812, 0.541653, -0.724522, 1, 1, 1, 1, 1,
-0.6255706, -2.605915, -3.713758, 1, 1, 1, 1, 1,
-0.6234723, -0.08822936, -2.592039, 1, 1, 1, 1, 1,
-0.6229888, 0.9765167, -1.285761, 1, 1, 1, 1, 1,
-0.62162, 0.05562431, -2.198994, 1, 1, 1, 1, 1,
-0.6215998, 1.296318, -0.7819929, 1, 1, 1, 1, 1,
-0.6187035, -1.661434, -3.346853, 1, 1, 1, 1, 1,
-0.6181347, 0.6666749, -0.5898767, 1, 1, 1, 1, 1,
-0.6157752, 0.560233, 1.400846, 1, 1, 1, 1, 1,
-0.6157472, 1.814573, -0.8321881, 0, 0, 1, 1, 1,
-0.6116618, -1.774233, -1.801093, 1, 0, 0, 1, 1,
-0.6089963, -0.9540746, -2.381128, 1, 0, 0, 1, 1,
-0.607842, 0.525537, -1.182892, 1, 0, 0, 1, 1,
-0.6025963, -1.656758, -2.12307, 1, 0, 0, 1, 1,
-0.6008853, -1.717378, -0.7475978, 1, 0, 0, 1, 1,
-0.595419, -0.3105467, -2.268506, 0, 0, 0, 1, 1,
-0.5860754, 1.134692, -0.598263, 0, 0, 0, 1, 1,
-0.5847441, 0.3779717, -1.044756, 0, 0, 0, 1, 1,
-0.5823876, -0.7048493, -2.027987, 0, 0, 0, 1, 1,
-0.580224, 0.779355, -1.237147, 0, 0, 0, 1, 1,
-0.569706, -0.2775017, -2.2415, 0, 0, 0, 1, 1,
-0.5687076, 0.05080529, -2.22046, 0, 0, 0, 1, 1,
-0.5609193, 0.402447, -0.7207559, 1, 1, 1, 1, 1,
-0.5572476, -0.7539022, -1.642372, 1, 1, 1, 1, 1,
-0.5548131, -0.4504855, -2.270284, 1, 1, 1, 1, 1,
-0.5541871, -0.4036833, -3.268508, 1, 1, 1, 1, 1,
-0.5489632, 1.372806, -0.4648597, 1, 1, 1, 1, 1,
-0.5473418, 0.3928798, 0.8396093, 1, 1, 1, 1, 1,
-0.5462029, 0.9025845, -1.974728, 1, 1, 1, 1, 1,
-0.5387108, 0.6805941, 0.5823805, 1, 1, 1, 1, 1,
-0.5357445, 0.8286537, 0.7873129, 1, 1, 1, 1, 1,
-0.5301602, -1.4164, -2.488213, 1, 1, 1, 1, 1,
-0.5191894, -1.258969, -3.094295, 1, 1, 1, 1, 1,
-0.5191786, 1.003861, 1.802771, 1, 1, 1, 1, 1,
-0.512058, -0.4887958, -2.565934, 1, 1, 1, 1, 1,
-0.5117042, -2.410519, -2.091302, 1, 1, 1, 1, 1,
-0.5105293, 0.3328773, 0.3085749, 1, 1, 1, 1, 1,
-0.5073251, -0.3553886, -3.170451, 0, 0, 1, 1, 1,
-0.5071773, 2.582044, -1.47537, 1, 0, 0, 1, 1,
-0.4972437, 0.5174982, -1.214654, 1, 0, 0, 1, 1,
-0.4956138, -0.6998889, -2.94117, 1, 0, 0, 1, 1,
-0.4905753, -0.720663, -0.5878317, 1, 0, 0, 1, 1,
-0.4888673, -0.3286033, -3.55638, 1, 0, 0, 1, 1,
-0.4869274, 0.01084869, -0.4681211, 0, 0, 0, 1, 1,
-0.484102, -2.57232, -4.176582, 0, 0, 0, 1, 1,
-0.4840435, -1.712011, -2.256267, 0, 0, 0, 1, 1,
-0.4833133, -0.6197721, -2.620094, 0, 0, 0, 1, 1,
-0.4802654, 0.07785001, -0.5347291, 0, 0, 0, 1, 1,
-0.4755334, 2.230751, -0.2597464, 0, 0, 0, 1, 1,
-0.4724628, -1.662709, -1.176503, 0, 0, 0, 1, 1,
-0.4710528, 0.4297073, -0.7130859, 1, 1, 1, 1, 1,
-0.4695705, -0.06206587, -2.79919, 1, 1, 1, 1, 1,
-0.4684585, 0.6452273, -0.7918291, 1, 1, 1, 1, 1,
-0.4640144, -0.02229155, 0.2138607, 1, 1, 1, 1, 1,
-0.4588076, -0.1810217, -1.890894, 1, 1, 1, 1, 1,
-0.4522725, 0.2908834, -0.0486368, 1, 1, 1, 1, 1,
-0.4486978, 0.7277219, -0.1604663, 1, 1, 1, 1, 1,
-0.4438598, -0.9932232, -3.498007, 1, 1, 1, 1, 1,
-0.4413709, -1.040029, -3.067804, 1, 1, 1, 1, 1,
-0.4406409, 0.5048755, -0.6903173, 1, 1, 1, 1, 1,
-0.4358208, -1.198038, -2.90345, 1, 1, 1, 1, 1,
-0.4350797, 1.401842, -0.941532, 1, 1, 1, 1, 1,
-0.4319574, 0.8134993, -0.1475174, 1, 1, 1, 1, 1,
-0.4251369, -0.5513349, -2.922179, 1, 1, 1, 1, 1,
-0.4238888, -0.8662497, -2.069291, 1, 1, 1, 1, 1,
-0.4165916, 0.1489727, 0.7526547, 0, 0, 1, 1, 1,
-0.411429, -1.691877, -1.027724, 1, 0, 0, 1, 1,
-0.4094922, -0.7355579, -5.272161, 1, 0, 0, 1, 1,
-0.4070848, 0.5951258, 0.397508, 1, 0, 0, 1, 1,
-0.4069034, -0.7805149, -5.010798, 1, 0, 0, 1, 1,
-0.40683, 0.9680901, 0.8789341, 1, 0, 0, 1, 1,
-0.4063728, -0.02164846, -1.769463, 0, 0, 0, 1, 1,
-0.4060835, 0.1998898, -0.9003785, 0, 0, 0, 1, 1,
-0.4049565, 1.362112, -0.4217045, 0, 0, 0, 1, 1,
-0.4003252, 1.720927, 1.792719, 0, 0, 0, 1, 1,
-0.3996064, -0.05320371, -2.505388, 0, 0, 0, 1, 1,
-0.3965864, -1.814438, -3.688273, 0, 0, 0, 1, 1,
-0.3961681, -0.8227193, -3.036161, 0, 0, 0, 1, 1,
-0.3939385, -0.5125422, -1.689738, 1, 1, 1, 1, 1,
-0.3927361, 0.8792687, -0.6330675, 1, 1, 1, 1, 1,
-0.3887434, -1.079153, -3.059938, 1, 1, 1, 1, 1,
-0.3850469, -1.459025, -2.786781, 1, 1, 1, 1, 1,
-0.3804345, 1.905068, -0.6611724, 1, 1, 1, 1, 1,
-0.3781147, -0.6077823, -3.088395, 1, 1, 1, 1, 1,
-0.3754059, -0.4417709, -2.589084, 1, 1, 1, 1, 1,
-0.3739219, -1.036068, -2.358218, 1, 1, 1, 1, 1,
-0.3718561, -1.158681, -2.487256, 1, 1, 1, 1, 1,
-0.3698587, -0.5654205, -1.703912, 1, 1, 1, 1, 1,
-0.3673658, -0.7324368, -1.059177, 1, 1, 1, 1, 1,
-0.3654045, 0.5006754, -0.9110925, 1, 1, 1, 1, 1,
-0.3597165, -1.332943, -3.006751, 1, 1, 1, 1, 1,
-0.358627, -1.14222, -3.600957, 1, 1, 1, 1, 1,
-0.3543793, -1.323677, -2.587918, 1, 1, 1, 1, 1,
-0.3525214, -0.3887293, -0.8556611, 0, 0, 1, 1, 1,
-0.3493239, -0.2749422, -1.677414, 1, 0, 0, 1, 1,
-0.3490648, -1.700183, -4.399549, 1, 0, 0, 1, 1,
-0.3454708, 0.6871364, -2.736421, 1, 0, 0, 1, 1,
-0.3421018, -0.2533632, -2.923934, 1, 0, 0, 1, 1,
-0.3367586, 0.5427976, 0.2838738, 1, 0, 0, 1, 1,
-0.3284622, -1.768128, -3.685861, 0, 0, 0, 1, 1,
-0.3238469, -1.615484, -3.43099, 0, 0, 0, 1, 1,
-0.3165307, -0.108011, -1.060914, 0, 0, 0, 1, 1,
-0.3126008, 0.2161166, 1.087453, 0, 0, 0, 1, 1,
-0.3103409, 0.9282376, -2.074704, 0, 0, 0, 1, 1,
-0.3094489, 1.211858, -0.6309908, 0, 0, 0, 1, 1,
-0.3076071, 0.2449259, 1.880458, 0, 0, 0, 1, 1,
-0.2975963, 0.3841728, -1.532486, 1, 1, 1, 1, 1,
-0.2917098, -0.3082564, -1.70285, 1, 1, 1, 1, 1,
-0.2901759, 0.4885918, 0.2430415, 1, 1, 1, 1, 1,
-0.2882305, 1.148847, -1.034571, 1, 1, 1, 1, 1,
-0.2881415, 0.1449074, -1.72911, 1, 1, 1, 1, 1,
-0.2875617, 1.755615, -0.3978399, 1, 1, 1, 1, 1,
-0.2865894, -1.763677, -3.351636, 1, 1, 1, 1, 1,
-0.2836281, -0.3226097, -1.12982, 1, 1, 1, 1, 1,
-0.2774788, 0.4970312, -1.541255, 1, 1, 1, 1, 1,
-0.2748235, 0.3855486, -0.9808467, 1, 1, 1, 1, 1,
-0.2734796, 0.2595913, 1.49465, 1, 1, 1, 1, 1,
-0.2700121, 0.6621872, -3.642328, 1, 1, 1, 1, 1,
-0.2693315, 1.035212, 0.04099327, 1, 1, 1, 1, 1,
-0.2693067, -0.7751887, -3.555439, 1, 1, 1, 1, 1,
-0.2686484, -2.181902, -4.458387, 1, 1, 1, 1, 1,
-0.2638531, -0.7472373, -2.661548, 0, 0, 1, 1, 1,
-0.2608352, 0.4903648, -0.9047414, 1, 0, 0, 1, 1,
-0.2604671, 0.02520287, -0.6786397, 1, 0, 0, 1, 1,
-0.2585604, -0.5784442, 0.4798938, 1, 0, 0, 1, 1,
-0.2538109, 0.1569806, -2.242536, 1, 0, 0, 1, 1,
-0.251253, 0.1039443, -2.673145, 1, 0, 0, 1, 1,
-0.2419931, 0.1198981, -0.7498226, 0, 0, 0, 1, 1,
-0.2390141, -0.3746665, -2.521732, 0, 0, 0, 1, 1,
-0.2374153, -0.5648015, -2.057901, 0, 0, 0, 1, 1,
-0.2339911, 0.8898594, 1.406174, 0, 0, 0, 1, 1,
-0.2338243, -0.1227927, -2.043165, 0, 0, 0, 1, 1,
-0.2337964, 0.3799081, -0.06194455, 0, 0, 0, 1, 1,
-0.2330817, -1.75947, -5.498071, 0, 0, 0, 1, 1,
-0.2320546, -0.0602532, -1.529156, 1, 1, 1, 1, 1,
-0.2261723, 2.388361, 0.1749516, 1, 1, 1, 1, 1,
-0.2257864, 0.3197269, -0.3744468, 1, 1, 1, 1, 1,
-0.2255931, 0.9303658, -1.393061, 1, 1, 1, 1, 1,
-0.2198673, -0.2714511, -3.77977, 1, 1, 1, 1, 1,
-0.2182733, -0.2527788, -3.110459, 1, 1, 1, 1, 1,
-0.21788, 1.305716, -1.169706, 1, 1, 1, 1, 1,
-0.2174388, 1.650906, -1.584478, 1, 1, 1, 1, 1,
-0.2171787, 0.135665, -1.257747, 1, 1, 1, 1, 1,
-0.2084891, 0.8084372, -1.09057, 1, 1, 1, 1, 1,
-0.2051661, -0.6520491, -1.976062, 1, 1, 1, 1, 1,
-0.2021322, -0.1903534, -4.238863, 1, 1, 1, 1, 1,
-0.2018751, 1.015191, 0.4068108, 1, 1, 1, 1, 1,
-0.1982931, 0.8257342, -1.838014, 1, 1, 1, 1, 1,
-0.1980854, 1.311724, 0.0774098, 1, 1, 1, 1, 1,
-0.1966815, -0.1244234, -2.073935, 0, 0, 1, 1, 1,
-0.1964372, -0.843335, -2.473706, 1, 0, 0, 1, 1,
-0.192359, -0.6564528, -3.581505, 1, 0, 0, 1, 1,
-0.1861107, 1.156341, 0.749786, 1, 0, 0, 1, 1,
-0.180608, 0.8011566, 0.644495, 1, 0, 0, 1, 1,
-0.175792, 0.4140555, -1.154882, 1, 0, 0, 1, 1,
-0.1755016, 0.795123, -1.181744, 0, 0, 0, 1, 1,
-0.1742858, 0.5660754, 0.2460549, 0, 0, 0, 1, 1,
-0.1739366, 0.7920233, -0.7310494, 0, 0, 0, 1, 1,
-0.1688965, -0.1119422, -2.21656, 0, 0, 0, 1, 1,
-0.1634412, -0.426725, -3.332741, 0, 0, 0, 1, 1,
-0.1607293, 0.5078314, -0.2548653, 0, 0, 0, 1, 1,
-0.1550539, -1.777357, -2.969376, 0, 0, 0, 1, 1,
-0.1510519, -0.5532921, -1.726149, 1, 1, 1, 1, 1,
-0.1475778, 1.676874, -0.4325548, 1, 1, 1, 1, 1,
-0.1452328, 1.063427, 0.3149022, 1, 1, 1, 1, 1,
-0.1403442, -0.08674975, -1.73313, 1, 1, 1, 1, 1,
-0.1385967, -0.6583089, -1.397603, 1, 1, 1, 1, 1,
-0.1375985, -0.03246416, -0.6478148, 1, 1, 1, 1, 1,
-0.1375815, 0.1938108, 0.1088512, 1, 1, 1, 1, 1,
-0.1347972, -1.205884, -2.655192, 1, 1, 1, 1, 1,
-0.1327202, -0.8246486, -1.819209, 1, 1, 1, 1, 1,
-0.1287773, 0.185202, 0.3460611, 1, 1, 1, 1, 1,
-0.1275342, 0.106806, -2.764765, 1, 1, 1, 1, 1,
-0.1237566, 0.5678788, 1.474015, 1, 1, 1, 1, 1,
-0.1208502, 1.895851, 0.5238956, 1, 1, 1, 1, 1,
-0.1167009, -0.698912, -4.106768, 1, 1, 1, 1, 1,
-0.110051, 0.6604601, 1.38805, 1, 1, 1, 1, 1,
-0.1080497, 1.128497, -0.9718982, 0, 0, 1, 1, 1,
-0.1080094, -1.080431, -1.695207, 1, 0, 0, 1, 1,
-0.1073781, -0.5177293, -2.875714, 1, 0, 0, 1, 1,
-0.1063152, -0.9209378, -2.878053, 1, 0, 0, 1, 1,
-0.1049025, 0.7051502, 0.0427958, 1, 0, 0, 1, 1,
-0.104824, 0.4736155, -0.7573347, 1, 0, 0, 1, 1,
-0.1044789, 0.1632795, -1.699717, 0, 0, 0, 1, 1,
-0.1034992, 1.648681, 0.3760222, 0, 0, 0, 1, 1,
-0.1030091, 1.065906, -0.4024554, 0, 0, 0, 1, 1,
-0.1023765, 0.1347256, -1.200807, 0, 0, 0, 1, 1,
-0.09742017, -0.08387855, -1.980858, 0, 0, 0, 1, 1,
-0.09381747, 0.7917622, 2.46986, 0, 0, 0, 1, 1,
-0.0898909, 1.509235, -1.94748, 0, 0, 0, 1, 1,
-0.08780318, -0.4872192, -3.904545, 1, 1, 1, 1, 1,
-0.08756471, 0.5949543, -0.307796, 1, 1, 1, 1, 1,
-0.08474898, -1.184368, -2.266109, 1, 1, 1, 1, 1,
-0.07894517, -0.7203567, -4.687528, 1, 1, 1, 1, 1,
-0.07700879, 0.2863945, 1.470196, 1, 1, 1, 1, 1,
-0.07481938, 0.940143, -0.07904613, 1, 1, 1, 1, 1,
-0.07356455, 0.419627, -0.02721731, 1, 1, 1, 1, 1,
-0.07211807, 3.041897, 0.10424, 1, 1, 1, 1, 1,
-0.07023263, 0.8393376, 0.8973608, 1, 1, 1, 1, 1,
-0.06931347, 0.2422417, -0.5369344, 1, 1, 1, 1, 1,
-0.06895156, 0.2416698, -1.675084, 1, 1, 1, 1, 1,
-0.06839787, 1.716335, 0.4328141, 1, 1, 1, 1, 1,
-0.06799744, -0.0161285, -1.092043, 1, 1, 1, 1, 1,
-0.06403988, -0.1553879, 0.007465865, 1, 1, 1, 1, 1,
-0.05986038, -0.9884803, -1.85645, 1, 1, 1, 1, 1,
-0.0532699, -1.458378, -3.089903, 0, 0, 1, 1, 1,
-0.04867135, -1.155214, -2.684632, 1, 0, 0, 1, 1,
-0.04372866, -0.4204705, -1.249049, 1, 0, 0, 1, 1,
-0.03961822, 1.416788, 0.3899355, 1, 0, 0, 1, 1,
-0.03725467, 1.235791, 0.1692399, 1, 0, 0, 1, 1,
-0.03565123, 1.395853, -0.5628565, 1, 0, 0, 1, 1,
-0.02919489, -0.805871, -4.341651, 0, 0, 0, 1, 1,
-0.0277946, 0.5308598, -2.209538, 0, 0, 0, 1, 1,
-0.02444007, 1.452793, 0.09666189, 0, 0, 0, 1, 1,
-0.01908026, 0.1151626, -0.1957562, 0, 0, 0, 1, 1,
-0.01800063, 0.3416051, 0.1427386, 0, 0, 0, 1, 1,
-0.01397186, -0.8011705, -3.277572, 0, 0, 0, 1, 1,
-0.009475518, -0.6815143, -3.619925, 0, 0, 0, 1, 1,
-0.009341273, -0.1285051, -3.683399, 1, 1, 1, 1, 1,
-0.007367512, -0.3855515, -2.603344, 1, 1, 1, 1, 1,
0.002695873, 0.6384675, -0.7128538, 1, 1, 1, 1, 1,
0.003161055, -1.248057, 2.862161, 1, 1, 1, 1, 1,
0.005421232, -0.4849683, 2.482215, 1, 1, 1, 1, 1,
0.00560596, 1.092749, -0.4044714, 1, 1, 1, 1, 1,
0.006913276, 0.7582101, 1.678922, 1, 1, 1, 1, 1,
0.007641281, 0.6501719, 0.4949742, 1, 1, 1, 1, 1,
0.01097849, 0.5609592, 1.461746, 1, 1, 1, 1, 1,
0.0128358, -0.09212483, 3.445012, 1, 1, 1, 1, 1,
0.01301727, -0.5164132, 2.074111, 1, 1, 1, 1, 1,
0.01499947, 0.2595238, 1.449524, 1, 1, 1, 1, 1,
0.01504575, 0.4484601, 0.1789927, 1, 1, 1, 1, 1,
0.01748309, 0.2058523, 0.4413517, 1, 1, 1, 1, 1,
0.0220152, 1.136175, -1.675471, 1, 1, 1, 1, 1,
0.02396324, 0.8617949, 1.730947, 0, 0, 1, 1, 1,
0.02458693, 0.7545464, 0.3450546, 1, 0, 0, 1, 1,
0.02990317, -0.008665774, 2.175388, 1, 0, 0, 1, 1,
0.03032116, 0.07751792, 0.1254567, 1, 0, 0, 1, 1,
0.03423829, 0.908718, 1.704076, 1, 0, 0, 1, 1,
0.03425981, 0.03923069, 1.667218, 1, 0, 0, 1, 1,
0.03783903, -0.7771689, 3.099223, 0, 0, 0, 1, 1,
0.0387654, 1.180122, -0.5185347, 0, 0, 0, 1, 1,
0.04612905, -0.03820878, 1.839299, 0, 0, 0, 1, 1,
0.0473848, -1.554243, 4.919428, 0, 0, 0, 1, 1,
0.0507846, -0.2717393, 3.889806, 0, 0, 0, 1, 1,
0.05158619, 0.5311328, 0.2005295, 0, 0, 0, 1, 1,
0.05177606, 0.6906268, -1.052705, 0, 0, 0, 1, 1,
0.0541623, -0.893536, 3.284681, 1, 1, 1, 1, 1,
0.058277, -1.238331, 3.52593, 1, 1, 1, 1, 1,
0.06246304, -0.7651297, 2.297252, 1, 1, 1, 1, 1,
0.06338501, -2.253459, 3.740733, 1, 1, 1, 1, 1,
0.06405236, 1.24415, -1.374655, 1, 1, 1, 1, 1,
0.06451197, 2.35051, 1.306352, 1, 1, 1, 1, 1,
0.06714768, 0.1225617, -0.5842356, 1, 1, 1, 1, 1,
0.06873178, 1.530941, 1.620901, 1, 1, 1, 1, 1,
0.07017406, -1.096648, 2.472396, 1, 1, 1, 1, 1,
0.07050043, -0.8285975, 4.752129, 1, 1, 1, 1, 1,
0.0709674, -0.8884994, 2.679056, 1, 1, 1, 1, 1,
0.07402392, 0.1364932, 0.06063344, 1, 1, 1, 1, 1,
0.07766186, 0.4093699, 0.2947252, 1, 1, 1, 1, 1,
0.07900416, -0.8388264, 2.674299, 1, 1, 1, 1, 1,
0.08112241, -0.08223484, 3.284294, 1, 1, 1, 1, 1,
0.08482704, 0.1647036, 1.036586, 0, 0, 1, 1, 1,
0.08531339, 0.6234487, 1.000383, 1, 0, 0, 1, 1,
0.08782899, -0.703242, 4.198117, 1, 0, 0, 1, 1,
0.08880351, 0.2617449, 0.7047462, 1, 0, 0, 1, 1,
0.09083539, -0.9701985, 3.769445, 1, 0, 0, 1, 1,
0.09233301, -0.5208796, 3.359308, 1, 0, 0, 1, 1,
0.09358581, 0.9922078, -1.446328, 0, 0, 0, 1, 1,
0.09378881, 1.109183, -1.004376, 0, 0, 0, 1, 1,
0.09639562, 1.232995, 2.080541, 0, 0, 0, 1, 1,
0.09723018, 0.8689359, -0.5488999, 0, 0, 0, 1, 1,
0.1013675, 0.6369307, 0.007863778, 0, 0, 0, 1, 1,
0.1021373, -1.743633, 4.15899, 0, 0, 0, 1, 1,
0.1057649, -0.3196263, 1.749408, 0, 0, 0, 1, 1,
0.1077251, 1.381366, 1.075516, 1, 1, 1, 1, 1,
0.1107794, 0.03377221, 0.9597599, 1, 1, 1, 1, 1,
0.1130993, -0.09658261, 3.125296, 1, 1, 1, 1, 1,
0.1134359, 0.4189971, -0.258548, 1, 1, 1, 1, 1,
0.1170083, -0.8477898, 1.756541, 1, 1, 1, 1, 1,
0.1172696, -0.7161627, 2.228571, 1, 1, 1, 1, 1,
0.1184845, -0.4245049, 2.131144, 1, 1, 1, 1, 1,
0.1209074, 1.709339, -0.03271987, 1, 1, 1, 1, 1,
0.122232, -0.821209, 3.48932, 1, 1, 1, 1, 1,
0.123193, -1.304287, 2.329133, 1, 1, 1, 1, 1,
0.1239807, -1.373273, 2.836791, 1, 1, 1, 1, 1,
0.1284276, -1.176046, 3.536277, 1, 1, 1, 1, 1,
0.1314504, -0.4215643, 5.047705, 1, 1, 1, 1, 1,
0.1376484, 1.260492, -1.089673, 1, 1, 1, 1, 1,
0.1388876, 2.019131, 0.001917021, 1, 1, 1, 1, 1,
0.1455602, 0.281398, 1.250135, 0, 0, 1, 1, 1,
0.1463652, 1.133114, -0.4599458, 1, 0, 0, 1, 1,
0.1489768, -0.2622039, 3.449343, 1, 0, 0, 1, 1,
0.150278, -0.2806169, 2.703568, 1, 0, 0, 1, 1,
0.1543566, 0.9041124, -0.1067012, 1, 0, 0, 1, 1,
0.1546149, 0.2574272, 0.2250265, 1, 0, 0, 1, 1,
0.1603971, 0.5006861, 1.392837, 0, 0, 0, 1, 1,
0.1607043, 2.108682, 0.07519009, 0, 0, 0, 1, 1,
0.1650537, -0.3349277, 1.5402, 0, 0, 0, 1, 1,
0.1667767, -0.1787532, 2.755675, 0, 0, 0, 1, 1,
0.1678746, 1.06008, 1.155958, 0, 0, 0, 1, 1,
0.1695486, -0.5706045, 1.715771, 0, 0, 0, 1, 1,
0.1702197, -0.2140214, 1.160994, 0, 0, 0, 1, 1,
0.1752687, -0.6235728, 3.893383, 1, 1, 1, 1, 1,
0.1760259, -1.762232, 1.834059, 1, 1, 1, 1, 1,
0.17949, -0.1018409, 0.9530182, 1, 1, 1, 1, 1,
0.1801862, 0.7187875, -0.62786, 1, 1, 1, 1, 1,
0.1806547, 0.7306288, 0.4398542, 1, 1, 1, 1, 1,
0.1808166, -0.04171989, 2.923136, 1, 1, 1, 1, 1,
0.1834654, -0.5062598, 0.7295086, 1, 1, 1, 1, 1,
0.1840501, 0.1166407, 1.126183, 1, 1, 1, 1, 1,
0.1855348, 0.606916, 0.8786138, 1, 1, 1, 1, 1,
0.1903386, 1.372108, -2.128602, 1, 1, 1, 1, 1,
0.1905326, -1.811702, 2.483899, 1, 1, 1, 1, 1,
0.1926101, 0.2069074, 2.43942, 1, 1, 1, 1, 1,
0.1935117, 1.920132, -1.25465, 1, 1, 1, 1, 1,
0.19596, 0.02639401, 1.860461, 1, 1, 1, 1, 1,
0.1969599, 1.023716, 0.6978727, 1, 1, 1, 1, 1,
0.1997176, -1.21566, 1.626883, 0, 0, 1, 1, 1,
0.2028885, -1.186494, 2.192752, 1, 0, 0, 1, 1,
0.206765, -0.1617579, 2.243006, 1, 0, 0, 1, 1,
0.2080457, 0.7690558, 0.1776861, 1, 0, 0, 1, 1,
0.2097033, -0.8391345, 2.575692, 1, 0, 0, 1, 1,
0.2129338, -0.3980137, 3.349369, 1, 0, 0, 1, 1,
0.2136808, -0.9145073, 2.592932, 0, 0, 0, 1, 1,
0.215271, -1.485257, 3.686333, 0, 0, 0, 1, 1,
0.2205506, 1.077887, 1.183455, 0, 0, 0, 1, 1,
0.2210983, -0.1660998, 1.502915, 0, 0, 0, 1, 1,
0.221668, 1.063483, 0.5059208, 0, 0, 0, 1, 1,
0.225067, -1.261021, 3.055643, 0, 0, 0, 1, 1,
0.2251121, -0.3747137, 1.911032, 0, 0, 0, 1, 1,
0.2328992, 0.484187, 0.951396, 1, 1, 1, 1, 1,
0.2355206, 1.445928, 1.033234, 1, 1, 1, 1, 1,
0.2376906, 0.5536708, 3.285509, 1, 1, 1, 1, 1,
0.2395165, 0.6877332, 0.9746411, 1, 1, 1, 1, 1,
0.2413226, -1.417137, 2.202214, 1, 1, 1, 1, 1,
0.2426404, 0.3780147, 1.964999, 1, 1, 1, 1, 1,
0.25078, 0.2965441, 0.9103565, 1, 1, 1, 1, 1,
0.2517238, -1.173334, 3.220602, 1, 1, 1, 1, 1,
0.2552655, -0.7871667, 2.037289, 1, 1, 1, 1, 1,
0.2583934, -0.3185633, 2.001924, 1, 1, 1, 1, 1,
0.2611733, 0.2403563, -0.0859182, 1, 1, 1, 1, 1,
0.2640573, 0.06887068, 1.14003, 1, 1, 1, 1, 1,
0.265783, 0.3538981, 1.205159, 1, 1, 1, 1, 1,
0.271744, -0.3048592, 1.274209, 1, 1, 1, 1, 1,
0.2732226, -1.470534, 2.272515, 1, 1, 1, 1, 1,
0.2742476, 1.212838, 1.198713, 0, 0, 1, 1, 1,
0.2750879, -0.8013121, 1.955832, 1, 0, 0, 1, 1,
0.278484, -0.217367, 1.693521, 1, 0, 0, 1, 1,
0.2799511, 0.6897476, 1.644244, 1, 0, 0, 1, 1,
0.2806928, -0.5235443, 2.490789, 1, 0, 0, 1, 1,
0.283387, 0.5992301, -0.2883529, 1, 0, 0, 1, 1,
0.2957469, 2.134789, 0.1919868, 0, 0, 0, 1, 1,
0.2997634, -0.07261098, 2.417229, 0, 0, 0, 1, 1,
0.3010347, 0.9620368, -0.03974229, 0, 0, 0, 1, 1,
0.3091167, 1.307551, -0.2245618, 0, 0, 0, 1, 1,
0.314813, -1.903197, 1.519674, 0, 0, 0, 1, 1,
0.3164564, 0.2154915, 1.550058, 0, 0, 0, 1, 1,
0.3178523, 1.289215, 0.7424986, 0, 0, 0, 1, 1,
0.3209081, 0.3926899, 0.570609, 1, 1, 1, 1, 1,
0.3212755, -1.481597, 3.013261, 1, 1, 1, 1, 1,
0.328342, -0.2877527, 2.155133, 1, 1, 1, 1, 1,
0.3311652, 1.249965, 1.152025, 1, 1, 1, 1, 1,
0.3328812, -0.6973082, 3.346827, 1, 1, 1, 1, 1,
0.3339343, 0.5061111, -1.165546, 1, 1, 1, 1, 1,
0.340032, 0.5876103, 1.398066, 1, 1, 1, 1, 1,
0.3430727, -0.8922206, 4.342944, 1, 1, 1, 1, 1,
0.3437236, -0.6714089, 2.188823, 1, 1, 1, 1, 1,
0.3446658, 1.511337, 0.7188064, 1, 1, 1, 1, 1,
0.3491659, 1.267263, 0.03092549, 1, 1, 1, 1, 1,
0.3496679, -0.04637445, 1.824803, 1, 1, 1, 1, 1,
0.3532747, -0.2797827, 3.089606, 1, 1, 1, 1, 1,
0.3533199, -0.8739259, 3.302529, 1, 1, 1, 1, 1,
0.3544208, 0.2302423, 1.622886, 1, 1, 1, 1, 1,
0.35542, -1.604657, 3.999918, 0, 0, 1, 1, 1,
0.3563057, -0.06870995, 3.014868, 1, 0, 0, 1, 1,
0.358238, -0.9356905, 2.717427, 1, 0, 0, 1, 1,
0.3609646, 0.5145696, -0.4969436, 1, 0, 0, 1, 1,
0.3652186, 0.5166157, 0.714731, 1, 0, 0, 1, 1,
0.3676913, 0.7715118, 1.344483, 1, 0, 0, 1, 1,
0.3693024, -0.6286589, 1.990299, 0, 0, 0, 1, 1,
0.3708986, -0.6567273, 3.72648, 0, 0, 0, 1, 1,
0.3711108, -1.12637, 2.103715, 0, 0, 0, 1, 1,
0.3723399, -0.3315123, 0.4551787, 0, 0, 0, 1, 1,
0.3762397, -0.4927892, 2.023363, 0, 0, 0, 1, 1,
0.3814764, -1.155123, 3.509656, 0, 0, 0, 1, 1,
0.3823915, 0.6486588, 1.689492, 0, 0, 0, 1, 1,
0.3869012, -0.9267375, 3.906088, 1, 1, 1, 1, 1,
0.3900634, -0.5076537, 3.088143, 1, 1, 1, 1, 1,
0.3908235, -0.3455907, 2.309153, 1, 1, 1, 1, 1,
0.391195, -0.1994975, 3.76907, 1, 1, 1, 1, 1,
0.3955691, 0.2464354, -0.5124397, 1, 1, 1, 1, 1,
0.39706, -1.27608, 0.279082, 1, 1, 1, 1, 1,
0.3999641, 0.173206, 1.082746, 1, 1, 1, 1, 1,
0.4032943, -0.2847226, 1.960954, 1, 1, 1, 1, 1,
0.4045945, -1.096588, 3.193017, 1, 1, 1, 1, 1,
0.4049495, -1.786771, 4.799312, 1, 1, 1, 1, 1,
0.4069941, -0.5334023, 1.363609, 1, 1, 1, 1, 1,
0.4139615, 1.399943, 0.4470422, 1, 1, 1, 1, 1,
0.4148271, -0.6481542, 1.774279, 1, 1, 1, 1, 1,
0.4187197, 0.5767885, 1.092395, 1, 1, 1, 1, 1,
0.4201341, -1.062716, 4.602476, 1, 1, 1, 1, 1,
0.4272874, 0.3987821, 2.199731, 0, 0, 1, 1, 1,
0.4283919, -0.1798312, 3.003069, 1, 0, 0, 1, 1,
0.4298374, -0.1114249, 1.431621, 1, 0, 0, 1, 1,
0.4302913, 1.590193, 1.094451, 1, 0, 0, 1, 1,
0.4323353, 0.866406, 0.363451, 1, 0, 0, 1, 1,
0.4344397, -1.025594, 3.498482, 1, 0, 0, 1, 1,
0.4355799, 0.7722885, 1.086385, 0, 0, 0, 1, 1,
0.4374613, -0.3953331, 2.848299, 0, 0, 0, 1, 1,
0.4383221, 0.8049873, 0.4241619, 0, 0, 0, 1, 1,
0.4419857, 1.05288, -0.08310561, 0, 0, 0, 1, 1,
0.4473894, 1.512048, 0.5245342, 0, 0, 0, 1, 1,
0.4519647, 0.5331089, 1.008139, 0, 0, 0, 1, 1,
0.4541959, 0.9377061, 0.6406927, 0, 0, 0, 1, 1,
0.4545426, 1.307504, 1.436134, 1, 1, 1, 1, 1,
0.4575668, 0.1644278, 1.491266, 1, 1, 1, 1, 1,
0.46157, 0.3624375, 1.476247, 1, 1, 1, 1, 1,
0.462764, -0.5984901, 1.692724, 1, 1, 1, 1, 1,
0.4652019, -1.583811, 2.306984, 1, 1, 1, 1, 1,
0.4665659, 0.71824, -1.865321, 1, 1, 1, 1, 1,
0.4716716, 2.219049, 1.091638, 1, 1, 1, 1, 1,
0.4719729, 0.5465025, 0.6870326, 1, 1, 1, 1, 1,
0.4739023, -1.004502, 1.083477, 1, 1, 1, 1, 1,
0.4741665, 1.810929, -0.3910357, 1, 1, 1, 1, 1,
0.4744164, -0.2832071, 0.9623064, 1, 1, 1, 1, 1,
0.4758203, -1.203829, 1.279284, 1, 1, 1, 1, 1,
0.4773516, 1.541359, 0.6876832, 1, 1, 1, 1, 1,
0.479435, -1.596667, 4.459082, 1, 1, 1, 1, 1,
0.4847375, -0.7123473, 2.919043, 1, 1, 1, 1, 1,
0.4855062, 0.3225788, -0.5732341, 0, 0, 1, 1, 1,
0.48673, 0.6699021, 2.962482, 1, 0, 0, 1, 1,
0.4929033, 0.1590835, 1.816644, 1, 0, 0, 1, 1,
0.4940752, -0.8338609, 3.49005, 1, 0, 0, 1, 1,
0.49602, -1.406787, 2.397531, 1, 0, 0, 1, 1,
0.4963361, -1.724261, 1.051306, 1, 0, 0, 1, 1,
0.4971408, -0.9831508, 2.585545, 0, 0, 0, 1, 1,
0.5051182, 0.8919514, 0.1611489, 0, 0, 0, 1, 1,
0.5123702, -0.2353987, 1.241004, 0, 0, 0, 1, 1,
0.5136312, -0.0724893, 1.238958, 0, 0, 0, 1, 1,
0.513834, 1.153411, -1.059938, 0, 0, 0, 1, 1,
0.5138478, 0.4700218, 1.204336, 0, 0, 0, 1, 1,
0.5139806, -0.5307738, 3.102856, 0, 0, 0, 1, 1,
0.5142659, 0.4462331, 0.5024547, 1, 1, 1, 1, 1,
0.5207756, 1.664279, -0.684392, 1, 1, 1, 1, 1,
0.5236081, 0.3012394, 0.42521, 1, 1, 1, 1, 1,
0.5241786, -0.002621591, 1.545833, 1, 1, 1, 1, 1,
0.5261802, -0.7975668, 1.635945, 1, 1, 1, 1, 1,
0.5289297, 0.9695537, 1.187278, 1, 1, 1, 1, 1,
0.5333703, 0.8804021, -0.4017103, 1, 1, 1, 1, 1,
0.5352827, 0.6896958, 0.3507013, 1, 1, 1, 1, 1,
0.5376143, -0.2469958, 1.72499, 1, 1, 1, 1, 1,
0.53843, 0.04723668, 1.995971, 1, 1, 1, 1, 1,
0.5386501, -0.3085685, 2.995048, 1, 1, 1, 1, 1,
0.539813, 0.007020673, 3.046491, 1, 1, 1, 1, 1,
0.5409176, -0.0907908, 2.20609, 1, 1, 1, 1, 1,
0.5435334, 1.731638, -0.01889827, 1, 1, 1, 1, 1,
0.5452607, -0.4843992, 0.9764982, 1, 1, 1, 1, 1,
0.5460571, -0.4646273, 3.010419, 0, 0, 1, 1, 1,
0.5469786, -1.041038, 2.498865, 1, 0, 0, 1, 1,
0.5486212, -0.1991006, 0.8984495, 1, 0, 0, 1, 1,
0.5500814, 0.4334516, 1.578525, 1, 0, 0, 1, 1,
0.551029, 0.4416873, 0.4290532, 1, 0, 0, 1, 1,
0.5526481, -1.271673, 2.799749, 1, 0, 0, 1, 1,
0.5546919, 0.7649714, 0.1884056, 0, 0, 0, 1, 1,
0.5644405, 1.054161, 0.9826714, 0, 0, 0, 1, 1,
0.5646577, -1.870187, 3.070064, 0, 0, 0, 1, 1,
0.5658051, 0.1116365, 1.599756, 0, 0, 0, 1, 1,
0.5671793, 0.1002486, 1.562991, 0, 0, 0, 1, 1,
0.5680926, 1.319022, 0.3366003, 0, 0, 0, 1, 1,
0.5684925, 1.379838, -0.7522575, 0, 0, 0, 1, 1,
0.5799341, 0.3348409, 0.854091, 1, 1, 1, 1, 1,
0.5858134, -1.095587, 4.178421, 1, 1, 1, 1, 1,
0.5887314, 0.7715221, 1.284297, 1, 1, 1, 1, 1,
0.592012, -1.046447, 2.105253, 1, 1, 1, 1, 1,
0.593013, -0.55216, 3.180772, 1, 1, 1, 1, 1,
0.5954339, -0.5376017, 1.810216, 1, 1, 1, 1, 1,
0.5971509, -0.890897, 2.64768, 1, 1, 1, 1, 1,
0.5977314, -0.4495467, 1.074067, 1, 1, 1, 1, 1,
0.6008538, -0.08777621, 2.17602, 1, 1, 1, 1, 1,
0.6029927, -0.6811997, 1.91817, 1, 1, 1, 1, 1,
0.605384, 1.060699, -0.6689214, 1, 1, 1, 1, 1,
0.613261, 2.069134, 0.08543089, 1, 1, 1, 1, 1,
0.6156316, 1.413551, 2.00615, 1, 1, 1, 1, 1,
0.6213227, -1.026342, 3.384989, 1, 1, 1, 1, 1,
0.6226331, 1.82146, -0.6923233, 1, 1, 1, 1, 1,
0.6245462, 0.3576124, 1.332533, 0, 0, 1, 1, 1,
0.628012, 0.2884669, -0.277272, 1, 0, 0, 1, 1,
0.6291179, -0.1597163, 0.6754981, 1, 0, 0, 1, 1,
0.6297555, 0.04332289, 0.6170927, 1, 0, 0, 1, 1,
0.6343902, 1.460617, 0.2936936, 1, 0, 0, 1, 1,
0.6387435, -1.621961, 1.963412, 1, 0, 0, 1, 1,
0.6414216, 0.2802434, -0.9225015, 0, 0, 0, 1, 1,
0.6423707, -1.882665, 2.124657, 0, 0, 0, 1, 1,
0.6449279, 1.478537, -0.4257636, 0, 0, 0, 1, 1,
0.6537024, -1.223872, 2.310918, 0, 0, 0, 1, 1,
0.6580705, 0.8765337, 3.614732, 0, 0, 0, 1, 1,
0.6614144, -0.4090117, 1.708876, 0, 0, 0, 1, 1,
0.6657119, 0.5587969, -0.7199315, 0, 0, 0, 1, 1,
0.6667337, 0.7848994, 0.06801467, 1, 1, 1, 1, 1,
0.6672371, -0.8117437, 2.26387, 1, 1, 1, 1, 1,
0.6678962, -1.23962, 2.037143, 1, 1, 1, 1, 1,
0.6751307, -1.774628, 4.331757, 1, 1, 1, 1, 1,
0.6759809, 0.7069802, 0.689694, 1, 1, 1, 1, 1,
0.6802199, -1.004179, 3.851269, 1, 1, 1, 1, 1,
0.6831993, -0.7777288, 2.27114, 1, 1, 1, 1, 1,
0.6852402, 1.337633, -0.2935456, 1, 1, 1, 1, 1,
0.6923034, -0.07875874, 2.295242, 1, 1, 1, 1, 1,
0.694082, -0.6053125, 2.084805, 1, 1, 1, 1, 1,
0.6950761, -1.40395, 3.099312, 1, 1, 1, 1, 1,
0.7057648, 0.4493276, 1.398891, 1, 1, 1, 1, 1,
0.7062932, 1.481551, 1.642158, 1, 1, 1, 1, 1,
0.7138128, -0.8433548, 3.801196, 1, 1, 1, 1, 1,
0.7148084, -0.07040881, 0.8021364, 1, 1, 1, 1, 1,
0.7209612, 1.064854, 0.3897654, 0, 0, 1, 1, 1,
0.7224364, -0.08787362, 3.158217, 1, 0, 0, 1, 1,
0.7227505, 0.1587761, 0.5054242, 1, 0, 0, 1, 1,
0.7245628, -1.743065, 3.911631, 1, 0, 0, 1, 1,
0.7253127, -0.7071266, 2.767426, 1, 0, 0, 1, 1,
0.7255675, 0.2661083, 0.6633046, 1, 0, 0, 1, 1,
0.7257352, -0.02659339, 2.161546, 0, 0, 0, 1, 1,
0.7304852, -1.196066, 3.46661, 0, 0, 0, 1, 1,
0.7377262, 0.31346, 2.317415, 0, 0, 0, 1, 1,
0.7425234, 1.221259, 1.136627, 0, 0, 0, 1, 1,
0.7445846, 0.9819798, 2.243277, 0, 0, 0, 1, 1,
0.7466502, -0.8414278, 2.209521, 0, 0, 0, 1, 1,
0.7487003, -0.5007711, 4.385283, 0, 0, 0, 1, 1,
0.7497681, -1.858806, 1.748806, 1, 1, 1, 1, 1,
0.7526992, -0.3571724, 1.844333, 1, 1, 1, 1, 1,
0.7614446, 0.4122737, 0.834833, 1, 1, 1, 1, 1,
0.7622231, 0.07015957, 2.122119, 1, 1, 1, 1, 1,
0.7656187, -1.03235, 4.015593, 1, 1, 1, 1, 1,
0.7676134, -0.3182072, 1.373651, 1, 1, 1, 1, 1,
0.7682453, -0.6724371, 2.068066, 1, 1, 1, 1, 1,
0.77009, -0.6178201, 0.9081311, 1, 1, 1, 1, 1,
0.7709801, -0.05955526, 1.676676, 1, 1, 1, 1, 1,
0.7724851, -0.2437446, 1.38434, 1, 1, 1, 1, 1,
0.773437, -1.516921, 4.674781, 1, 1, 1, 1, 1,
0.7852305, 0.510967, 0.2081249, 1, 1, 1, 1, 1,
0.7855452, 1.010519, 0.2987371, 1, 1, 1, 1, 1,
0.7879737, -1.428808, 3.35597, 1, 1, 1, 1, 1,
0.7906203, -0.3994145, 1.570687, 1, 1, 1, 1, 1,
0.7907539, -0.6271952, 2.306835, 0, 0, 1, 1, 1,
0.7977503, 0.5317569, 1.100209, 1, 0, 0, 1, 1,
0.8036987, -1.196518, 2.527591, 1, 0, 0, 1, 1,
0.8048852, 0.2848515, 2.461271, 1, 0, 0, 1, 1,
0.8062435, 0.8442059, 0.6840123, 1, 0, 0, 1, 1,
0.8117528, -0.0603788, 0.5326663, 1, 0, 0, 1, 1,
0.8121881, -0.004982187, 2.365846, 0, 0, 0, 1, 1,
0.813243, -1.476817, 0.3163204, 0, 0, 0, 1, 1,
0.8135736, 0.5656296, 1.613858, 0, 0, 0, 1, 1,
0.8218105, -0.5937005, 1.112187, 0, 0, 0, 1, 1,
0.8339509, -0.4798041, 1.98318, 0, 0, 0, 1, 1,
0.8345606, -0.4217745, 2.448498, 0, 0, 0, 1, 1,
0.8348948, 1.359364, -0.1903829, 0, 0, 0, 1, 1,
0.8358243, 1.038643, 0.4340507, 1, 1, 1, 1, 1,
0.8383222, 0.8143197, 1.760979, 1, 1, 1, 1, 1,
0.8387091, 1.402398, -1.429992, 1, 1, 1, 1, 1,
0.8414374, 0.9433076, 0.2808762, 1, 1, 1, 1, 1,
0.8443469, 0.2978475, 1.546704, 1, 1, 1, 1, 1,
0.8444368, -0.690988, 3.038905, 1, 1, 1, 1, 1,
0.8451284, 0.1280153, 0.3320156, 1, 1, 1, 1, 1,
0.8551745, -0.470245, 2.331445, 1, 1, 1, 1, 1,
0.8653201, 1.661767, -0.7659859, 1, 1, 1, 1, 1,
0.8678556, 0.7220137, 1.027038, 1, 1, 1, 1, 1,
0.8688717, -0.487338, 1.417488, 1, 1, 1, 1, 1,
0.8701357, -0.7083879, 2.168999, 1, 1, 1, 1, 1,
0.8704889, 1.67322, 1.638399, 1, 1, 1, 1, 1,
0.8724213, -0.7051171, 3.473547, 1, 1, 1, 1, 1,
0.8758414, -0.01200564, 2.530721, 1, 1, 1, 1, 1,
0.8826249, -0.9890217, 1.183241, 0, 0, 1, 1, 1,
0.8902714, -1.316298, 2.708004, 1, 0, 0, 1, 1,
0.8908092, -0.2163532, 1.058272, 1, 0, 0, 1, 1,
0.8941856, -0.005060089, 0.1632059, 1, 0, 0, 1, 1,
0.8998291, 0.4897397, 2.28501, 1, 0, 0, 1, 1,
0.904819, 1.808979, 1.505015, 1, 0, 0, 1, 1,
0.919628, -0.92935, 2.218219, 0, 0, 0, 1, 1,
0.9199582, -0.7374425, 0.867031, 0, 0, 0, 1, 1,
0.9245465, 0.8797191, 0.7258597, 0, 0, 0, 1, 1,
0.9246945, -1.014693, 2.224064, 0, 0, 0, 1, 1,
0.938484, 0.2594263, 1.779048, 0, 0, 0, 1, 1,
0.9447362, -1.603248, 2.885812, 0, 0, 0, 1, 1,
0.9466484, -0.5194554, 1.09376, 0, 0, 0, 1, 1,
0.9496039, 1.68278, 0.6433728, 1, 1, 1, 1, 1,
0.9506233, -1.584593, 4.549819, 1, 1, 1, 1, 1,
0.9551586, 0.08044115, 0.04298245, 1, 1, 1, 1, 1,
0.9555265, 0.6158468, -0.01493458, 1, 1, 1, 1, 1,
0.955689, -1.286479, 2.359932, 1, 1, 1, 1, 1,
0.957227, -0.3189129, 0.8824669, 1, 1, 1, 1, 1,
0.9588128, 1.021897, 1.324752, 1, 1, 1, 1, 1,
0.9599001, -0.2316482, 2.182822, 1, 1, 1, 1, 1,
0.9608361, 0.887886, 1.038309, 1, 1, 1, 1, 1,
0.9620053, -0.2182618, 1.798527, 1, 1, 1, 1, 1,
0.9656284, 0.02996804, 1.088482, 1, 1, 1, 1, 1,
0.9685241, 0.7129554, 1.7534, 1, 1, 1, 1, 1,
0.9799522, 0.5053893, 1.807364, 1, 1, 1, 1, 1,
0.9809732, 0.510706, 1.493631, 1, 1, 1, 1, 1,
0.9828387, 2.396917, -1.346301, 1, 1, 1, 1, 1,
0.9834729, -1.845198, 4.053258, 0, 0, 1, 1, 1,
0.98558, 0.3655694, 1.220769, 1, 0, 0, 1, 1,
0.9919056, -0.8482862, 1.655148, 1, 0, 0, 1, 1,
1.000613, -0.8054019, 2.933097, 1, 0, 0, 1, 1,
1.006227, 0.3565394, 2.231223, 1, 0, 0, 1, 1,
1.006937, -0.4870571, 1.954381, 1, 0, 0, 1, 1,
1.022824, 0.3861369, 1.734559, 0, 0, 0, 1, 1,
1.023715, -0.4238484, 1.598531, 0, 0, 0, 1, 1,
1.025187, 0.2372338, 2.440153, 0, 0, 0, 1, 1,
1.034206, 0.01936766, 0.3421329, 0, 0, 0, 1, 1,
1.035066, -0.6418153, 3.820471, 0, 0, 0, 1, 1,
1.035145, -0.2556686, 1.85473, 0, 0, 0, 1, 1,
1.036044, 0.04617407, 1.171034, 0, 0, 0, 1, 1,
1.0366, 1.237521, -0.6596671, 1, 1, 1, 1, 1,
1.04326, 2.321002, -0.2400875, 1, 1, 1, 1, 1,
1.045899, -1.974716, 3.31169, 1, 1, 1, 1, 1,
1.048775, -0.5381406, -0.01070355, 1, 1, 1, 1, 1,
1.050413, 0.2651758, 0.409056, 1, 1, 1, 1, 1,
1.056028, -0.6116395, 1.447697, 1, 1, 1, 1, 1,
1.064374, -0.7799343, 0.809873, 1, 1, 1, 1, 1,
1.067033, 0.5588726, 1.556428, 1, 1, 1, 1, 1,
1.073273, 1.626756, -0.528636, 1, 1, 1, 1, 1,
1.074562, 0.9983171, 0.7752289, 1, 1, 1, 1, 1,
1.078177, 0.02958154, 1.121997, 1, 1, 1, 1, 1,
1.082437, -1.199037, 4.263162, 1, 1, 1, 1, 1,
1.083037, 0.3478641, 3.266435, 1, 1, 1, 1, 1,
1.085106, 1.377565, 0.1600347, 1, 1, 1, 1, 1,
1.089416, 0.1065385, 0.8870418, 1, 1, 1, 1, 1,
1.095558, -0.3713645, 4.240835, 0, 0, 1, 1, 1,
1.099641, 0.8492525, 2.516178, 1, 0, 0, 1, 1,
1.109053, -2.119431, 3.821511, 1, 0, 0, 1, 1,
1.112807, -0.6517303, 1.645826, 1, 0, 0, 1, 1,
1.113052, 0.8810639, 0.5109774, 1, 0, 0, 1, 1,
1.114413, -0.3402992, 1.387663, 1, 0, 0, 1, 1,
1.121928, 0.7220393, 1.429306, 0, 0, 0, 1, 1,
1.130445, -0.8945196, 1.561789, 0, 0, 0, 1, 1,
1.132883, 0.03812704, 1.904556, 0, 0, 0, 1, 1,
1.13296, 1.028788, 1.314466, 0, 0, 0, 1, 1,
1.14679, -0.06541238, 1.460757, 0, 0, 0, 1, 1,
1.14779, 1.061141, -0.2927517, 0, 0, 0, 1, 1,
1.150806, -0.8814524, 0.6394439, 0, 0, 0, 1, 1,
1.158661, 1.535992, 1.432191, 1, 1, 1, 1, 1,
1.162189, 0.1305996, 0.3557792, 1, 1, 1, 1, 1,
1.166446, -0.2715911, 2.086249, 1, 1, 1, 1, 1,
1.182649, 0.2526971, 0.9740009, 1, 1, 1, 1, 1,
1.192397, 1.24456, 0.2884187, 1, 1, 1, 1, 1,
1.19916, 2.148049, -0.04937004, 1, 1, 1, 1, 1,
1.225735, 0.1042713, 0.7487083, 1, 1, 1, 1, 1,
1.231697, 0.1318718, 1.168528, 1, 1, 1, 1, 1,
1.236033, 1.069238, 0.1093846, 1, 1, 1, 1, 1,
1.25026, -0.257022, 2.025593, 1, 1, 1, 1, 1,
1.253354, -1.51761, 3.90998, 1, 1, 1, 1, 1,
1.259374, -0.08263908, 3.842054, 1, 1, 1, 1, 1,
1.269732, 0.6897861, -0.534327, 1, 1, 1, 1, 1,
1.276097, 0.8676546, 1.073041, 1, 1, 1, 1, 1,
1.29545, -1.704224, 3.486271, 1, 1, 1, 1, 1,
1.304157, 0.9828878, 1.594314, 0, 0, 1, 1, 1,
1.316652, 0.1062807, 3.316806, 1, 0, 0, 1, 1,
1.317567, -1.050596, 3.153297, 1, 0, 0, 1, 1,
1.326472, -0.66062, 2.304106, 1, 0, 0, 1, 1,
1.331103, -1.58603, 2.515413, 1, 0, 0, 1, 1,
1.344032, 0.3489957, 1.817138, 1, 0, 0, 1, 1,
1.349244, 0.761615, 0.8927405, 0, 0, 0, 1, 1,
1.350456, 0.1431545, 1.293614, 0, 0, 0, 1, 1,
1.351687, -0.1070889, 1.238872, 0, 0, 0, 1, 1,
1.354096, 0.3096028, 0.9350638, 0, 0, 0, 1, 1,
1.361684, 2.536588, 0.05630678, 0, 0, 0, 1, 1,
1.364069, 0.02478165, 1.954957, 0, 0, 0, 1, 1,
1.365174, 1.896851, 2.277072, 0, 0, 0, 1, 1,
1.372735, -0.09297266, 1.56098, 1, 1, 1, 1, 1,
1.374986, -0.448414, 1.592864, 1, 1, 1, 1, 1,
1.383552, 0.1445301, 3.001328, 1, 1, 1, 1, 1,
1.384917, 0.7506936, 0.5011893, 1, 1, 1, 1, 1,
1.386737, 1.045825, 1.501746, 1, 1, 1, 1, 1,
1.388773, -0.7959111, 0.833994, 1, 1, 1, 1, 1,
1.396935, -0.6606491, 2.046458, 1, 1, 1, 1, 1,
1.411263, 1.716313, 0.997752, 1, 1, 1, 1, 1,
1.411676, 0.4220882, 2.340375, 1, 1, 1, 1, 1,
1.41245, 0.7607402, 1.928092, 1, 1, 1, 1, 1,
1.435521, -2.514196, 3.050516, 1, 1, 1, 1, 1,
1.453752, 0.2439879, 1.789088, 1, 1, 1, 1, 1,
1.459619, 0.4117471, 2.110287, 1, 1, 1, 1, 1,
1.465645, -1.111853, 1.37678, 1, 1, 1, 1, 1,
1.473637, -1.851225, 2.450784, 1, 1, 1, 1, 1,
1.475603, -3.252988, 4.665926, 0, 0, 1, 1, 1,
1.477513, 0.09885572, 1.4606, 1, 0, 0, 1, 1,
1.480935, -0.9360919, 3.320407, 1, 0, 0, 1, 1,
1.4909, -0.5920638, 0.185062, 1, 0, 0, 1, 1,
1.504398, -0.2814372, 2.685406, 1, 0, 0, 1, 1,
1.508662, 0.3715097, 0.9135063, 1, 0, 0, 1, 1,
1.515491, -0.2050526, 0.7243789, 0, 0, 0, 1, 1,
1.521976, 1.218278, 2.412732, 0, 0, 0, 1, 1,
1.554653, -1.23436, 4.749381, 0, 0, 0, 1, 1,
1.557592, 0.5926708, 0.3479338, 0, 0, 0, 1, 1,
1.587711, -1.040629, 1.822497, 0, 0, 0, 1, 1,
1.590056, -0.1226451, 2.190465, 0, 0, 0, 1, 1,
1.60138, 0.2019628, 1.444122, 0, 0, 0, 1, 1,
1.60224, 0.5291706, 1.039132, 1, 1, 1, 1, 1,
1.624665, 0.05466059, 3.360706, 1, 1, 1, 1, 1,
1.630459, -0.3683795, 0.01613823, 1, 1, 1, 1, 1,
1.631606, -1.015533, 2.705736, 1, 1, 1, 1, 1,
1.634802, 0.1128109, 1.235945, 1, 1, 1, 1, 1,
1.64334, -1.413705, 3.403271, 1, 1, 1, 1, 1,
1.653705, -0.7033406, 3.448025, 1, 1, 1, 1, 1,
1.660586, -2.95486, 2.452147, 1, 1, 1, 1, 1,
1.667768, -0.2006615, 2.212646, 1, 1, 1, 1, 1,
1.673657, 0.1133521, 2.522352, 1, 1, 1, 1, 1,
1.690336, 1.148804, 0.9434177, 1, 1, 1, 1, 1,
1.712748, -1.216288, 2.750028, 1, 1, 1, 1, 1,
1.726158, 1.117509, 0.8527948, 1, 1, 1, 1, 1,
1.732528, 0.8071429, 2.846325, 1, 1, 1, 1, 1,
1.744743, -0.5091246, -0.01536027, 1, 1, 1, 1, 1,
1.777428, 0.5100262, 0.6787837, 0, 0, 1, 1, 1,
1.78127, -0.1649965, 2.38011, 1, 0, 0, 1, 1,
1.802913, -0.704478, 1.87615, 1, 0, 0, 1, 1,
1.815785, -0.5217083, 0.3849916, 1, 0, 0, 1, 1,
1.818387, -0.7730916, 1.593644, 1, 0, 0, 1, 1,
1.843596, 0.2113675, 2.45704, 1, 0, 0, 1, 1,
1.846303, 0.4775286, 1.668721, 0, 0, 0, 1, 1,
1.856103, -0.3572465, 0.3322517, 0, 0, 0, 1, 1,
1.873561, 0.4324954, 2.422233, 0, 0, 0, 1, 1,
1.929725, -0.2157588, 0.7745119, 0, 0, 0, 1, 1,
1.964456, 0.1138182, -0.01477977, 0, 0, 0, 1, 1,
1.975836, -1.634104, 2.348113, 0, 0, 0, 1, 1,
1.983806, -1.368789, 1.08619, 0, 0, 0, 1, 1,
2.004439, -0.4537352, -0.003433106, 1, 1, 1, 1, 1,
2.023986, -1.878975, 3.792899, 1, 1, 1, 1, 1,
2.025305, -1.201902, 2.076579, 1, 1, 1, 1, 1,
2.057323, -0.7518275, 1.847788, 1, 1, 1, 1, 1,
2.10287, 0.6533622, 0.741588, 1, 1, 1, 1, 1,
2.112198, 1.93656, 0.4494041, 1, 1, 1, 1, 1,
2.112773, -0.4299842, 2.013602, 1, 1, 1, 1, 1,
2.141919, 0.6683456, 1.583937, 1, 1, 1, 1, 1,
2.147598, 3.368971, -0.8281611, 1, 1, 1, 1, 1,
2.169196, 0.6072026, 3.143337, 1, 1, 1, 1, 1,
2.187718, 0.1625998, 1.301303, 1, 1, 1, 1, 1,
2.190512, 0.6262779, 0.741512, 1, 1, 1, 1, 1,
2.206798, -0.7494745, 2.42943, 1, 1, 1, 1, 1,
2.221004, 1.32048, 0.6209809, 1, 1, 1, 1, 1,
2.253816, 1.608601, 2.179116, 1, 1, 1, 1, 1,
2.267861, 1.399681, 1.948702, 0, 0, 1, 1, 1,
2.270105, 0.591512, 1.720669, 1, 0, 0, 1, 1,
2.281262, -2.60465, 2.943815, 1, 0, 0, 1, 1,
2.301412, -0.1103436, 0.8571957, 1, 0, 0, 1, 1,
2.44969, 1.76921, 1.356102, 1, 0, 0, 1, 1,
2.464278, 1.62678, 2.259093, 1, 0, 0, 1, 1,
2.490644, 2.135544, 0.2518068, 0, 0, 0, 1, 1,
2.497572, 0.1193629, 1.372877, 0, 0, 0, 1, 1,
2.578039, 1.861064, -0.1305798, 0, 0, 0, 1, 1,
2.604356, 1.788482, -1.21543, 0, 0, 0, 1, 1,
2.614074, 1.705135, 0.9335637, 0, 0, 0, 1, 1,
2.631709, -0.7704244, 1.632305, 0, 0, 0, 1, 1,
2.70498, 2.252396, 0.5378079, 0, 0, 0, 1, 1,
2.714927, -0.5890242, 3.260996, 1, 1, 1, 1, 1,
2.735588, -0.7543722, 2.907632, 1, 1, 1, 1, 1,
2.804114, 0.5528911, 2.508842, 1, 1, 1, 1, 1,
2.898441, 0.1590989, 1.914236, 1, 1, 1, 1, 1,
2.985366, -0.8611595, 0.8603216, 1, 1, 1, 1, 1,
3.599081, 0.6733401, 1.698279, 1, 1, 1, 1, 1,
3.873324, -0.01842002, 1.446401, 1, 1, 1, 1, 1
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
var radius = 9.797485;
var distance = 34.41325;
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
mvMatrix.translate( -0.2475801, -0.0579915, 0.2251828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41325);
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
