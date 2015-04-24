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
-3.036245, -0.1006011, -0.9034074, 1, 0, 0, 1,
-2.993132, 0.0178267, 0.05062299, 1, 0.007843138, 0, 1,
-2.94794, 2.491479, -1.763711, 1, 0.01176471, 0, 1,
-2.82757, 0.7186381, 0.1099934, 1, 0.01960784, 0, 1,
-2.662513, -0.8882326, -0.3644085, 1, 0.02352941, 0, 1,
-2.454536, 0.3588098, -1.193146, 1, 0.03137255, 0, 1,
-2.398088, -0.08996414, -1.841149, 1, 0.03529412, 0, 1,
-2.33722, 0.5486478, -1.362786, 1, 0.04313726, 0, 1,
-2.330136, 0.9646974, -2.626743, 1, 0.04705882, 0, 1,
-2.259188, -0.1657505, -1.025948, 1, 0.05490196, 0, 1,
-2.243385, -1.034459, -1.396867, 1, 0.05882353, 0, 1,
-2.154699, -1.624102, -4.302261, 1, 0.06666667, 0, 1,
-2.138611, -1.940272, -1.971269, 1, 0.07058824, 0, 1,
-2.069883, 0.4417332, -1.768637, 1, 0.07843138, 0, 1,
-2.06713, -0.7139366, -1.735746, 1, 0.08235294, 0, 1,
-2.034282, 0.322793, -2.738092, 1, 0.09019608, 0, 1,
-2.023716, -1.222306, -2.202956, 1, 0.09411765, 0, 1,
-1.989815, 0.03815018, -1.161747, 1, 0.1019608, 0, 1,
-1.95933, 0.2619701, -1.533227, 1, 0.1098039, 0, 1,
-1.94434, -0.4719647, -0.2555235, 1, 0.1137255, 0, 1,
-1.943001, 0.2880914, -1.109376, 1, 0.1215686, 0, 1,
-1.930344, 0.3652795, -1.336582, 1, 0.1254902, 0, 1,
-1.907986, -0.5296252, -2.15508, 1, 0.1333333, 0, 1,
-1.895329, 0.8908579, -1.460111, 1, 0.1372549, 0, 1,
-1.881845, 0.04132488, -1.173696, 1, 0.145098, 0, 1,
-1.870907, 0.65658, 0.2378478, 1, 0.1490196, 0, 1,
-1.83892, 1.160706, 0.316957, 1, 0.1568628, 0, 1,
-1.831887, -1.683385, -1.422177, 1, 0.1607843, 0, 1,
-1.826604, 0.1866104, -0.08494323, 1, 0.1686275, 0, 1,
-1.81387, 1.167715, 0.1807416, 1, 0.172549, 0, 1,
-1.806268, 0.8001292, -1.058022, 1, 0.1803922, 0, 1,
-1.803652, 0.1638919, -1.545635, 1, 0.1843137, 0, 1,
-1.796369, -1.468929, -2.508618, 1, 0.1921569, 0, 1,
-1.782966, -2.486134, -1.652851, 1, 0.1960784, 0, 1,
-1.75619, 1.223884, -0.7257719, 1, 0.2039216, 0, 1,
-1.742284, -1.367501, -3.243135, 1, 0.2117647, 0, 1,
-1.732322, -0.03474034, -2.273907, 1, 0.2156863, 0, 1,
-1.730203, 1.403967, -0.3800579, 1, 0.2235294, 0, 1,
-1.728356, -0.627791, -1.47122, 1, 0.227451, 0, 1,
-1.724597, 1.399523, -0.3547844, 1, 0.2352941, 0, 1,
-1.723647, -1.230095, -2.80459, 1, 0.2392157, 0, 1,
-1.720792, -0.1179017, -0.6777226, 1, 0.2470588, 0, 1,
-1.690922, 0.9549038, -1.312858, 1, 0.2509804, 0, 1,
-1.667652, 1.260784, -1.351988, 1, 0.2588235, 0, 1,
-1.664531, 1.25306, -0.1493057, 1, 0.2627451, 0, 1,
-1.663013, 1.078152, -1.646738, 1, 0.2705882, 0, 1,
-1.660372, 0.008079312, -2.677689, 1, 0.2745098, 0, 1,
-1.644407, -0.6369686, -2.584659, 1, 0.282353, 0, 1,
-1.644277, -0.007778742, -1.790375, 1, 0.2862745, 0, 1,
-1.632561, 0.3924098, -2.879393, 1, 0.2941177, 0, 1,
-1.59681, 0.9807158, -0.8945037, 1, 0.3019608, 0, 1,
-1.576573, -0.3846658, -1.184695, 1, 0.3058824, 0, 1,
-1.574119, -1.767174, -2.892745, 1, 0.3137255, 0, 1,
-1.573247, -0.1152095, -3.578285, 1, 0.3176471, 0, 1,
-1.562557, 0.5059952, -0.6635411, 1, 0.3254902, 0, 1,
-1.555739, -0.2239435, -0.9613218, 1, 0.3294118, 0, 1,
-1.555214, 0.2379251, -1.876164, 1, 0.3372549, 0, 1,
-1.551488, 0.9214438, -0.2099808, 1, 0.3411765, 0, 1,
-1.541414, 0.4963205, -1.850878, 1, 0.3490196, 0, 1,
-1.539838, 1.786179, -0.6995831, 1, 0.3529412, 0, 1,
-1.533713, 0.3668894, -1.928084, 1, 0.3607843, 0, 1,
-1.529568, -0.8487228, -1.952754, 1, 0.3647059, 0, 1,
-1.524377, -0.2944684, -3.005316, 1, 0.372549, 0, 1,
-1.516965, -0.7640193, -0.1498904, 1, 0.3764706, 0, 1,
-1.515411, 0.2278545, -1.879185, 1, 0.3843137, 0, 1,
-1.514478, 0.5594417, -2.506339, 1, 0.3882353, 0, 1,
-1.490914, -1.310228, -1.701213, 1, 0.3960784, 0, 1,
-1.486901, -0.0443777, -2.528083, 1, 0.4039216, 0, 1,
-1.48507, -0.8916062, -1.092321, 1, 0.4078431, 0, 1,
-1.484412, 1.588744, 0.9549756, 1, 0.4156863, 0, 1,
-1.474573, 0.8513542, -1.495151, 1, 0.4196078, 0, 1,
-1.471506, 0.9342184, -0.6971418, 1, 0.427451, 0, 1,
-1.448675, -0.6436828, -4.926078, 1, 0.4313726, 0, 1,
-1.444024, 0.6627054, -1.794018, 1, 0.4392157, 0, 1,
-1.415792, 0.4620813, -1.450909, 1, 0.4431373, 0, 1,
-1.414257, 0.5902265, -1.189809, 1, 0.4509804, 0, 1,
-1.40594, 0.4993367, 0.01739911, 1, 0.454902, 0, 1,
-1.392612, -0.4241149, -2.188165, 1, 0.4627451, 0, 1,
-1.385703, 0.09274809, -0.8795608, 1, 0.4666667, 0, 1,
-1.384426, 0.4542629, -2.010345, 1, 0.4745098, 0, 1,
-1.38265, -1.40661, -1.849414, 1, 0.4784314, 0, 1,
-1.380333, -0.7985731, -3.133651, 1, 0.4862745, 0, 1,
-1.380315, -0.942994, 0.05430786, 1, 0.4901961, 0, 1,
-1.379517, -0.04853607, -2.273002, 1, 0.4980392, 0, 1,
-1.375831, -0.7153768, -0.8056623, 1, 0.5058824, 0, 1,
-1.372292, -0.2855489, -2.83031, 1, 0.509804, 0, 1,
-1.371254, -0.9819883, -1.20336, 1, 0.5176471, 0, 1,
-1.365998, 0.8396559, -2.495847, 1, 0.5215687, 0, 1,
-1.360362, -0.1915005, -1.383228, 1, 0.5294118, 0, 1,
-1.359505, -0.3793549, -2.445339, 1, 0.5333334, 0, 1,
-1.339056, 1.027269, -1.549436, 1, 0.5411765, 0, 1,
-1.336107, 2.630675, -0.6067373, 1, 0.5450981, 0, 1,
-1.330065, -1.912336, -4.932619, 1, 0.5529412, 0, 1,
-1.326987, -1.405303, -0.4618852, 1, 0.5568628, 0, 1,
-1.323227, -2.125905, -4.688897, 1, 0.5647059, 0, 1,
-1.320032, -0.4591295, 0.4234816, 1, 0.5686275, 0, 1,
-1.310137, -0.3047532, -1.912696, 1, 0.5764706, 0, 1,
-1.307525, -1.983432, -1.180444, 1, 0.5803922, 0, 1,
-1.300799, -1.136664, -1.441632, 1, 0.5882353, 0, 1,
-1.297557, -0.09600567, -0.5461315, 1, 0.5921569, 0, 1,
-1.284043, 0.9763322, -2.060634, 1, 0.6, 0, 1,
-1.270806, 1.045078, 0.05042416, 1, 0.6078432, 0, 1,
-1.264562, -1.2759, -4.729684, 1, 0.6117647, 0, 1,
-1.263228, 0.2387317, 1.250011, 1, 0.6196079, 0, 1,
-1.262424, 0.8966521, 0.6845224, 1, 0.6235294, 0, 1,
-1.261584, -0.4955567, -2.433943, 1, 0.6313726, 0, 1,
-1.246162, 0.3020777, -1.02519, 1, 0.6352941, 0, 1,
-1.24472, -0.3605557, -1.621092, 1, 0.6431373, 0, 1,
-1.241364, -0.5901439, -2.011406, 1, 0.6470588, 0, 1,
-1.232105, -0.02873234, -4.208551, 1, 0.654902, 0, 1,
-1.231807, -0.1087399, -3.72336, 1, 0.6588235, 0, 1,
-1.21781, -2.355196, -1.035401, 1, 0.6666667, 0, 1,
-1.209229, 1.583651, 0.03346799, 1, 0.6705883, 0, 1,
-1.206836, 0.5983139, 0.481725, 1, 0.6784314, 0, 1,
-1.202246, -0.1486386, -2.1685, 1, 0.682353, 0, 1,
-1.198089, 1.261146, 0.001090333, 1, 0.6901961, 0, 1,
-1.197467, 0.183462, -2.326738, 1, 0.6941177, 0, 1,
-1.193586, -0.6597338, -2.388452, 1, 0.7019608, 0, 1,
-1.193228, -0.5534166, -0.8133176, 1, 0.7098039, 0, 1,
-1.190129, 2.487129, -0.7973845, 1, 0.7137255, 0, 1,
-1.188478, 0.7479622, -0.2537168, 1, 0.7215686, 0, 1,
-1.171243, 1.635921, -1.308414, 1, 0.7254902, 0, 1,
-1.170302, -0.005939646, -1.40371, 1, 0.7333333, 0, 1,
-1.162701, -0.3647853, -0.640956, 1, 0.7372549, 0, 1,
-1.161439, 0.3308031, -0.2649902, 1, 0.7450981, 0, 1,
-1.155012, 0.190023, -1.868948, 1, 0.7490196, 0, 1,
-1.1471, -1.235967, -3.419173, 1, 0.7568628, 0, 1,
-1.14676, -0.7147091, -2.674205, 1, 0.7607843, 0, 1,
-1.141386, -0.8706496, -1.194421, 1, 0.7686275, 0, 1,
-1.140284, 0.3860746, -2.142309, 1, 0.772549, 0, 1,
-1.136621, 0.6979122, -1.34726, 1, 0.7803922, 0, 1,
-1.134608, 0.3172279, -0.1496903, 1, 0.7843137, 0, 1,
-1.13416, -0.8782871, -2.396245, 1, 0.7921569, 0, 1,
-1.130238, -1.239468, -2.055505, 1, 0.7960784, 0, 1,
-1.130033, -0.4260745, -3.039187, 1, 0.8039216, 0, 1,
-1.123201, -1.354797, -3.950591, 1, 0.8117647, 0, 1,
-1.113157, 1.736847, -0.3196747, 1, 0.8156863, 0, 1,
-1.111066, 1.147471, -2.401352, 1, 0.8235294, 0, 1,
-1.11104, 1.11594, -0.3632664, 1, 0.827451, 0, 1,
-1.100032, -0.04614409, -0.7749149, 1, 0.8352941, 0, 1,
-1.099219, -0.3815494, -2.101912, 1, 0.8392157, 0, 1,
-1.0961, -1.529014, -2.151614, 1, 0.8470588, 0, 1,
-1.0909, -0.2639118, -3.604137, 1, 0.8509804, 0, 1,
-1.090177, 0.9754845, -0.5149802, 1, 0.8588235, 0, 1,
-1.083199, -0.8032478, -2.846472, 1, 0.8627451, 0, 1,
-1.082107, 1.148636, -0.6619977, 1, 0.8705882, 0, 1,
-1.079885, 0.05174931, 0.4443431, 1, 0.8745098, 0, 1,
-1.077945, -1.079018, -2.444809, 1, 0.8823529, 0, 1,
-1.074311, 0.5918868, -2.450961, 1, 0.8862745, 0, 1,
-1.072988, -0.7121658, -3.804013, 1, 0.8941177, 0, 1,
-1.069341, -0.5496824, -1.398507, 1, 0.8980392, 0, 1,
-1.067922, -0.03722624, -2.410505, 1, 0.9058824, 0, 1,
-1.067861, 0.1722811, -0.7699826, 1, 0.9137255, 0, 1,
-1.067583, -0.3555726, -1.26748, 1, 0.9176471, 0, 1,
-1.061604, 1.322416, -0.281993, 1, 0.9254902, 0, 1,
-1.052596, -0.3402178, -2.462534, 1, 0.9294118, 0, 1,
-1.052336, -0.6056103, -2.126889, 1, 0.9372549, 0, 1,
-1.051091, -1.180393, -1.576244, 1, 0.9411765, 0, 1,
-1.047075, -0.1623185, -1.860732, 1, 0.9490196, 0, 1,
-1.043995, 0.06685086, -2.489175, 1, 0.9529412, 0, 1,
-1.034687, 0.6580479, -1.160469, 1, 0.9607843, 0, 1,
-1.030784, 1.409061, 1.012023, 1, 0.9647059, 0, 1,
-1.021471, -1.851955, -2.034952, 1, 0.972549, 0, 1,
-1.01671, -1.475109, -3.781262, 1, 0.9764706, 0, 1,
-1.013159, -0.2033618, -1.63626, 1, 0.9843137, 0, 1,
-1.009013, 0.9060965, 0.1946899, 1, 0.9882353, 0, 1,
-1.007391, -1.179001, -1.194279, 1, 0.9960784, 0, 1,
-1.005977, -1.044165, -2.529485, 0.9960784, 1, 0, 1,
-1.005697, 1.485926, -0.8046175, 0.9921569, 1, 0, 1,
-0.9965082, 1.135316, -0.6033782, 0.9843137, 1, 0, 1,
-0.9898846, -1.682525, -2.745983, 0.9803922, 1, 0, 1,
-0.9893706, 0.5786062, -1.385071, 0.972549, 1, 0, 1,
-0.9822223, 1.228956, -1.823022, 0.9686275, 1, 0, 1,
-0.9781964, -0.1225192, -2.02314, 0.9607843, 1, 0, 1,
-0.9661085, -1.113714, -4.221499, 0.9568627, 1, 0, 1,
-0.9607398, 0.03316519, -3.495864, 0.9490196, 1, 0, 1,
-0.9556616, -1.291287, -3.709125, 0.945098, 1, 0, 1,
-0.9507331, -0.3080881, -3.279857, 0.9372549, 1, 0, 1,
-0.9465178, -1.047718, -3.092511, 0.9333333, 1, 0, 1,
-0.9375322, -2.203409, -3.917315, 0.9254902, 1, 0, 1,
-0.926276, 0.4606401, -0.2900226, 0.9215686, 1, 0, 1,
-0.9261096, 0.964865, -2.250696, 0.9137255, 1, 0, 1,
-0.9260944, 0.2092662, -1.172318, 0.9098039, 1, 0, 1,
-0.9252864, 0.7343287, -0.5421676, 0.9019608, 1, 0, 1,
-0.9212385, 0.08534124, -2.264578, 0.8941177, 1, 0, 1,
-0.9183642, -1.614268, -1.169731, 0.8901961, 1, 0, 1,
-0.9140973, -1.714862, -2.993468, 0.8823529, 1, 0, 1,
-0.9131179, 1.128379, -1.020817, 0.8784314, 1, 0, 1,
-0.9031423, 2.053353, 2.18589, 0.8705882, 1, 0, 1,
-0.9015327, -0.6158169, -1.641578, 0.8666667, 1, 0, 1,
-0.8955535, -1.363059, -2.481738, 0.8588235, 1, 0, 1,
-0.891721, -0.8068537, -2.192674, 0.854902, 1, 0, 1,
-0.8911324, -0.01069779, -0.8878672, 0.8470588, 1, 0, 1,
-0.8897045, -0.7943058, -1.968261, 0.8431373, 1, 0, 1,
-0.8806524, 0.5982856, -0.465169, 0.8352941, 1, 0, 1,
-0.8781185, 0.3184781, -0.1957046, 0.8313726, 1, 0, 1,
-0.8744056, -0.5124854, -2.734221, 0.8235294, 1, 0, 1,
-0.8722873, 1.008122, 0.02873182, 0.8196079, 1, 0, 1,
-0.8667978, -0.6720105, -2.942903, 0.8117647, 1, 0, 1,
-0.8665149, -0.2247996, -1.368719, 0.8078431, 1, 0, 1,
-0.8644296, 0.3194631, -3.424282, 0.8, 1, 0, 1,
-0.8638709, 0.2200251, 0.1604993, 0.7921569, 1, 0, 1,
-0.8613347, -0.7945655, -1.679908, 0.7882353, 1, 0, 1,
-0.858799, -0.1184094, -1.568761, 0.7803922, 1, 0, 1,
-0.8533137, -0.5499851, -2.11587, 0.7764706, 1, 0, 1,
-0.8508217, -1.092488, -3.664877, 0.7686275, 1, 0, 1,
-0.849452, -0.4748997, -3.035675, 0.7647059, 1, 0, 1,
-0.8491196, -1.212947, -1.965568, 0.7568628, 1, 0, 1,
-0.846243, 1.772356, 0.1171029, 0.7529412, 1, 0, 1,
-0.8452867, -1.141944, -4.765066, 0.7450981, 1, 0, 1,
-0.8444894, -0.4208821, -0.8249063, 0.7411765, 1, 0, 1,
-0.8441568, -1.017244, -1.978742, 0.7333333, 1, 0, 1,
-0.8417506, -1.679977, -1.826167, 0.7294118, 1, 0, 1,
-0.8342062, 0.3967814, -1.732752, 0.7215686, 1, 0, 1,
-0.8304956, 1.759602, -0.1001724, 0.7176471, 1, 0, 1,
-0.8281885, 0.2177398, -0.6001503, 0.7098039, 1, 0, 1,
-0.8271751, 0.8576189, -2.115045, 0.7058824, 1, 0, 1,
-0.8262764, 0.7140398, -1.285003, 0.6980392, 1, 0, 1,
-0.821497, 1.534203, -0.9364873, 0.6901961, 1, 0, 1,
-0.8098526, 1.210441, -1.140909, 0.6862745, 1, 0, 1,
-0.8090832, -0.5183834, -0.7138052, 0.6784314, 1, 0, 1,
-0.8064395, 0.1686151, -0.1955288, 0.6745098, 1, 0, 1,
-0.805397, -0.6990719, -0.9212711, 0.6666667, 1, 0, 1,
-0.8021771, -0.08141039, -0.8694761, 0.6627451, 1, 0, 1,
-0.8013026, 0.374424, -1.58518, 0.654902, 1, 0, 1,
-0.7923458, 1.210465, -1.532526, 0.6509804, 1, 0, 1,
-0.7857589, -0.3985308, -2.055486, 0.6431373, 1, 0, 1,
-0.7847987, -1.162493, -0.308088, 0.6392157, 1, 0, 1,
-0.7844105, 0.8521728, -1.975068, 0.6313726, 1, 0, 1,
-0.7802061, -0.4870327, -2.834167, 0.627451, 1, 0, 1,
-0.7752147, 1.437993, -2.305296, 0.6196079, 1, 0, 1,
-0.7728602, -0.08660561, -1.722943, 0.6156863, 1, 0, 1,
-0.7709911, 0.6853126, -1.546621, 0.6078432, 1, 0, 1,
-0.7644247, -0.7053508, -3.536603, 0.6039216, 1, 0, 1,
-0.7600819, 1.223078, -2.324496, 0.5960785, 1, 0, 1,
-0.7573421, -0.891194, -2.30783, 0.5882353, 1, 0, 1,
-0.7434859, 0.3701738, -0.2014523, 0.5843138, 1, 0, 1,
-0.7415001, 0.9547591, -0.1189023, 0.5764706, 1, 0, 1,
-0.7407441, 0.7003489, -0.3107584, 0.572549, 1, 0, 1,
-0.7402822, 1.185417, -1.537835, 0.5647059, 1, 0, 1,
-0.7385421, -1.052826, -2.809802, 0.5607843, 1, 0, 1,
-0.7363513, -0.5198871, -2.466537, 0.5529412, 1, 0, 1,
-0.7315779, 0.7905846, 0.6522918, 0.5490196, 1, 0, 1,
-0.7303128, -0.2344922, -2.537606, 0.5411765, 1, 0, 1,
-0.7282888, 0.3627836, -1.097577, 0.5372549, 1, 0, 1,
-0.7272844, -0.8423707, -1.189826, 0.5294118, 1, 0, 1,
-0.7248178, 1.536025, 0.1838788, 0.5254902, 1, 0, 1,
-0.7239226, 0.4012238, -0.3665249, 0.5176471, 1, 0, 1,
-0.7205192, -0.7762114, -3.80014, 0.5137255, 1, 0, 1,
-0.7145364, 0.3515527, -1.628295, 0.5058824, 1, 0, 1,
-0.7131608, 0.6319832, 0.5286078, 0.5019608, 1, 0, 1,
-0.7072092, -0.9169746, -2.881178, 0.4941176, 1, 0, 1,
-0.7042605, -0.9088059, -3.195303, 0.4862745, 1, 0, 1,
-0.703499, 0.4550444, -1.505318, 0.4823529, 1, 0, 1,
-0.7008737, -0.5261287, -1.880456, 0.4745098, 1, 0, 1,
-0.700642, -0.4613309, -3.670635, 0.4705882, 1, 0, 1,
-0.6981277, 0.3665706, -0.36803, 0.4627451, 1, 0, 1,
-0.696375, -1.781783, -3.342229, 0.4588235, 1, 0, 1,
-0.6947741, -1.000641, -1.048909, 0.4509804, 1, 0, 1,
-0.6947216, 0.1982944, -2.49547, 0.4470588, 1, 0, 1,
-0.6938195, 0.178572, -0.2528598, 0.4392157, 1, 0, 1,
-0.6908002, 2.10509, 1.505933, 0.4352941, 1, 0, 1,
-0.6889198, 1.433938, -0.1212061, 0.427451, 1, 0, 1,
-0.688884, 0.5222477, 0.1276758, 0.4235294, 1, 0, 1,
-0.6879044, -0.0494824, -3.224286, 0.4156863, 1, 0, 1,
-0.6716498, -0.7407044, -0.9080592, 0.4117647, 1, 0, 1,
-0.6715089, -1.094, -1.661566, 0.4039216, 1, 0, 1,
-0.6624961, -0.6090764, -2.094561, 0.3960784, 1, 0, 1,
-0.6573787, -0.5669848, -1.760824, 0.3921569, 1, 0, 1,
-0.6572544, 0.4777122, 1.542764, 0.3843137, 1, 0, 1,
-0.6553345, 0.2042584, -0.2691672, 0.3803922, 1, 0, 1,
-0.6489652, -1.158047, -2.172152, 0.372549, 1, 0, 1,
-0.636829, 2.028838, 0.2297711, 0.3686275, 1, 0, 1,
-0.621084, -1.079173, -0.8283601, 0.3607843, 1, 0, 1,
-0.6178719, 0.2389735, -0.8902614, 0.3568628, 1, 0, 1,
-0.6161607, -0.8388045, -2.079794, 0.3490196, 1, 0, 1,
-0.6156898, -0.8826113, -2.877126, 0.345098, 1, 0, 1,
-0.6089029, 0.3032477, -1.812151, 0.3372549, 1, 0, 1,
-0.6073999, 0.5063031, -1.721431, 0.3333333, 1, 0, 1,
-0.6060031, -0.05247541, -2.688471, 0.3254902, 1, 0, 1,
-0.6023178, 0.2850156, -2.296775, 0.3215686, 1, 0, 1,
-0.6018893, 1.584692, -0.5737213, 0.3137255, 1, 0, 1,
-0.5949287, -0.6609442, -3.344865, 0.3098039, 1, 0, 1,
-0.5923655, 2.069318, -0.1657885, 0.3019608, 1, 0, 1,
-0.5846412, 0.3236393, -1.853173, 0.2941177, 1, 0, 1,
-0.58006, -1.044073, -0.2850132, 0.2901961, 1, 0, 1,
-0.5766569, 0.9292395, -1.194329, 0.282353, 1, 0, 1,
-0.5731368, -0.2154175, -1.248678, 0.2784314, 1, 0, 1,
-0.5705417, 0.7188977, -1.166694, 0.2705882, 1, 0, 1,
-0.5648476, 0.6484469, -0.594629, 0.2666667, 1, 0, 1,
-0.5645953, -0.2783094, -1.08946, 0.2588235, 1, 0, 1,
-0.5645275, 0.6503798, -1.198329, 0.254902, 1, 0, 1,
-0.5636846, 0.8358827, 1.586775, 0.2470588, 1, 0, 1,
-0.5627124, -0.6760392, -3.479687, 0.2431373, 1, 0, 1,
-0.5576447, -0.3229066, -1.080817, 0.2352941, 1, 0, 1,
-0.5575637, 1.030208, -2.071335, 0.2313726, 1, 0, 1,
-0.554379, -0.1927059, -0.8810136, 0.2235294, 1, 0, 1,
-0.5528724, 0.2905234, 0.08058484, 0.2196078, 1, 0, 1,
-0.5526254, -0.09947892, -2.493125, 0.2117647, 1, 0, 1,
-0.5520005, 0.3429756, 0.6987281, 0.2078431, 1, 0, 1,
-0.5486287, 0.4547547, -0.0432785, 0.2, 1, 0, 1,
-0.547051, 0.8494025, 0.0821091, 0.1921569, 1, 0, 1,
-0.545771, -1.29397, -2.360944, 0.1882353, 1, 0, 1,
-0.5407317, -0.7034873, -2.571589, 0.1803922, 1, 0, 1,
-0.5407137, -0.4925164, -1.342725, 0.1764706, 1, 0, 1,
-0.5396719, 0.00481922, -1.084578, 0.1686275, 1, 0, 1,
-0.5308393, 1.421098, -0.9030831, 0.1647059, 1, 0, 1,
-0.5281744, -0.2920118, -1.512763, 0.1568628, 1, 0, 1,
-0.524303, -2.333856, -1.939247, 0.1529412, 1, 0, 1,
-0.5205947, -1.103107, -1.300479, 0.145098, 1, 0, 1,
-0.5196674, 0.7072604, -1.837137, 0.1411765, 1, 0, 1,
-0.5167208, -0.4690561, -2.810145, 0.1333333, 1, 0, 1,
-0.5097229, -1.063615, -3.730453, 0.1294118, 1, 0, 1,
-0.5090091, 0.4062622, -1.812287, 0.1215686, 1, 0, 1,
-0.5079072, -1.115783, -2.160013, 0.1176471, 1, 0, 1,
-0.5066058, -2.412306, -3.12686, 0.1098039, 1, 0, 1,
-0.5050547, 0.1326894, -0.1622912, 0.1058824, 1, 0, 1,
-0.5049725, -0.8087651, -1.93796, 0.09803922, 1, 0, 1,
-0.5021357, -1.235679, -3.442979, 0.09019608, 1, 0, 1,
-0.4995477, -0.3300137, -3.332971, 0.08627451, 1, 0, 1,
-0.4969757, 0.5407947, -0.2070507, 0.07843138, 1, 0, 1,
-0.4866542, -1.191355, -1.394711, 0.07450981, 1, 0, 1,
-0.4806165, 0.9273382, -1.018387, 0.06666667, 1, 0, 1,
-0.4770042, -0.9265294, -2.281235, 0.0627451, 1, 0, 1,
-0.4700849, -0.6972975, -2.12848, 0.05490196, 1, 0, 1,
-0.4689313, -0.9933463, -3.162604, 0.05098039, 1, 0, 1,
-0.4683246, 2.298593, -0.0002777082, 0.04313726, 1, 0, 1,
-0.4672673, 1.166938, 0.1404574, 0.03921569, 1, 0, 1,
-0.4651943, 0.5384334, -0.9391459, 0.03137255, 1, 0, 1,
-0.4629081, -0.2702974, -1.106482, 0.02745098, 1, 0, 1,
-0.4624599, -0.3694281, -3.114024, 0.01960784, 1, 0, 1,
-0.4603423, -1.642366, -2.5698, 0.01568628, 1, 0, 1,
-0.4571532, -0.6193975, -2.841356, 0.007843138, 1, 0, 1,
-0.4570027, 0.1573482, -1.679374, 0.003921569, 1, 0, 1,
-0.4523853, 1.0277, -0.549023, 0, 1, 0.003921569, 1,
-0.4485783, 0.8016436, -0.2579297, 0, 1, 0.01176471, 1,
-0.4471931, 0.273189, -0.7060727, 0, 1, 0.01568628, 1,
-0.4414322, 0.8540031, -1.702073, 0, 1, 0.02352941, 1,
-0.4394872, 1.983742, -0.6060053, 0, 1, 0.02745098, 1,
-0.4391075, 0.9711921, -3.249285, 0, 1, 0.03529412, 1,
-0.438676, -0.3457028, -0.301209, 0, 1, 0.03921569, 1,
-0.4382458, 0.5822408, -0.02417595, 0, 1, 0.04705882, 1,
-0.4354365, -0.3200265, -0.4110734, 0, 1, 0.05098039, 1,
-0.4292505, -0.05130008, -2.610247, 0, 1, 0.05882353, 1,
-0.4290002, -0.8278537, -2.224281, 0, 1, 0.0627451, 1,
-0.4185748, -0.1593664, -2.856005, 0, 1, 0.07058824, 1,
-0.4185186, 0.8618723, 1.89048, 0, 1, 0.07450981, 1,
-0.4104013, -0.2373997, -1.754269, 0, 1, 0.08235294, 1,
-0.4102931, -0.6933077, -2.523075, 0, 1, 0.08627451, 1,
-0.4092639, -0.182838, -3.168823, 0, 1, 0.09411765, 1,
-0.4090392, -1.621752, -4.85169, 0, 1, 0.1019608, 1,
-0.4069519, 1.564915, 0.7881069, 0, 1, 0.1058824, 1,
-0.4066425, 0.6501349, 0.3685227, 0, 1, 0.1137255, 1,
-0.4010528, -0.1392632, -2.303347, 0, 1, 0.1176471, 1,
-0.3986884, 1.67214, -0.1196266, 0, 1, 0.1254902, 1,
-0.3966363, -1.000298, -3.016824, 0, 1, 0.1294118, 1,
-0.3960471, 0.1211942, -0.2293635, 0, 1, 0.1372549, 1,
-0.3946303, 1.949389, 1.187312, 0, 1, 0.1411765, 1,
-0.3943095, -1.039161, -0.6149023, 0, 1, 0.1490196, 1,
-0.3937866, 2.698207, 0.9095151, 0, 1, 0.1529412, 1,
-0.3931455, -0.2869357, -3.658489, 0, 1, 0.1607843, 1,
-0.3897923, -1.417959, -2.827118, 0, 1, 0.1647059, 1,
-0.3887199, 0.4636634, 1.13847, 0, 1, 0.172549, 1,
-0.3833822, -1.385586, -4.496026, 0, 1, 0.1764706, 1,
-0.3826232, -0.211627, -0.6067207, 0, 1, 0.1843137, 1,
-0.3812543, 0.1425609, -4.556969, 0, 1, 0.1882353, 1,
-0.3794313, 0.906258, -2.574143, 0, 1, 0.1960784, 1,
-0.3782773, -0.8504858, -1.441198, 0, 1, 0.2039216, 1,
-0.368695, 0.1415679, -1.2399, 0, 1, 0.2078431, 1,
-0.3622456, 1.536098, -1.283604, 0, 1, 0.2156863, 1,
-0.3606198, 0.8704766, 0.1432586, 0, 1, 0.2196078, 1,
-0.3536286, -0.7400072, -1.265608, 0, 1, 0.227451, 1,
-0.351812, 0.6370857, 0.3600656, 0, 1, 0.2313726, 1,
-0.3462036, 0.7022091, -0.08740572, 0, 1, 0.2392157, 1,
-0.3459604, 0.08865026, -1.692363, 0, 1, 0.2431373, 1,
-0.3457916, 0.03009977, 0.01492054, 0, 1, 0.2509804, 1,
-0.3442666, 1.611591, 0.1298306, 0, 1, 0.254902, 1,
-0.3440822, -0.04714619, -1.418234, 0, 1, 0.2627451, 1,
-0.3432584, -0.7424498, -4.339065, 0, 1, 0.2666667, 1,
-0.343206, -1.301182, -2.653242, 0, 1, 0.2745098, 1,
-0.3418164, 2.652284, -2.503464, 0, 1, 0.2784314, 1,
-0.3400968, 0.5584008, -0.5613943, 0, 1, 0.2862745, 1,
-0.3381536, 0.2657386, -0.08647574, 0, 1, 0.2901961, 1,
-0.3374506, 0.5261616, 0.67388, 0, 1, 0.2980392, 1,
-0.3355804, 0.9772757, 3.10664, 0, 1, 0.3058824, 1,
-0.3346896, 0.7799155, -0.2272158, 0, 1, 0.3098039, 1,
-0.326497, 0.5076019, -1.337847, 0, 1, 0.3176471, 1,
-0.3239371, 0.626938, -0.02617252, 0, 1, 0.3215686, 1,
-0.3217962, -2.453365, -3.778702, 0, 1, 0.3294118, 1,
-0.3180612, 0.2668895, 0.3378715, 0, 1, 0.3333333, 1,
-0.316245, -0.3283352, -2.732684, 0, 1, 0.3411765, 1,
-0.3161277, 0.9246829, -0.4544385, 0, 1, 0.345098, 1,
-0.3140593, 1.504721, 0.8721824, 0, 1, 0.3529412, 1,
-0.3049664, 1.175843, -0.666898, 0, 1, 0.3568628, 1,
-0.2978004, 0.5088509, -1.190074, 0, 1, 0.3647059, 1,
-0.2967507, 0.0763819, -1.450799, 0, 1, 0.3686275, 1,
-0.296125, 0.4275171, -1.310935, 0, 1, 0.3764706, 1,
-0.2942182, 0.02946449, -2.156113, 0, 1, 0.3803922, 1,
-0.2914969, -0.1280237, -2.543433, 0, 1, 0.3882353, 1,
-0.2887794, 0.7731967, -0.8869891, 0, 1, 0.3921569, 1,
-0.2856624, -0.281561, -1.798871, 0, 1, 0.4, 1,
-0.2829787, 0.1804616, -0.2522771, 0, 1, 0.4078431, 1,
-0.2787586, -0.8096619, -3.159417, 0, 1, 0.4117647, 1,
-0.2747993, 0.4387059, 0.5934381, 0, 1, 0.4196078, 1,
-0.2739213, 1.128367, -1.084849, 0, 1, 0.4235294, 1,
-0.2724739, -1.801478, -1.553678, 0, 1, 0.4313726, 1,
-0.2671259, 0.04669707, -0.09262379, 0, 1, 0.4352941, 1,
-0.2670319, 0.26087, -0.7653115, 0, 1, 0.4431373, 1,
-0.2609099, 0.6820026, 0.6340241, 0, 1, 0.4470588, 1,
-0.2570721, 0.3413945, -0.1883495, 0, 1, 0.454902, 1,
-0.2463773, 0.654407, 1.08194, 0, 1, 0.4588235, 1,
-0.2422262, -0.218982, -3.766238, 0, 1, 0.4666667, 1,
-0.2409332, -0.9165758, -2.872457, 0, 1, 0.4705882, 1,
-0.2386657, -0.1830556, -2.782279, 0, 1, 0.4784314, 1,
-0.2382898, -2.163543, -1.941603, 0, 1, 0.4823529, 1,
-0.2326891, -0.3250208, -2.661424, 0, 1, 0.4901961, 1,
-0.231288, 0.668534, -0.8354474, 0, 1, 0.4941176, 1,
-0.2291403, -0.690684, -0.3926229, 0, 1, 0.5019608, 1,
-0.2225612, -0.9960526, -4.019718, 0, 1, 0.509804, 1,
-0.2205166, -0.2478219, -1.743832, 0, 1, 0.5137255, 1,
-0.2197744, -0.9128939, -2.19106, 0, 1, 0.5215687, 1,
-0.2193055, -0.694007, -2.253976, 0, 1, 0.5254902, 1,
-0.2141233, 0.5119804, -1.069149, 0, 1, 0.5333334, 1,
-0.2088219, 0.3500267, -0.2996013, 0, 1, 0.5372549, 1,
-0.2084894, -0.6354759, -5.050624, 0, 1, 0.5450981, 1,
-0.2021314, 1.345303, -1.557314, 0, 1, 0.5490196, 1,
-0.1997788, 0.7979324, -0.3485768, 0, 1, 0.5568628, 1,
-0.1989285, -0.7487164, -1.534303, 0, 1, 0.5607843, 1,
-0.1984914, 0.1494748, -2.007435, 0, 1, 0.5686275, 1,
-0.1957386, 0.5633664, -1.16498, 0, 1, 0.572549, 1,
-0.1886494, 1.017454, 0.5920704, 0, 1, 0.5803922, 1,
-0.1875506, -0.6893072, -1.474953, 0, 1, 0.5843138, 1,
-0.1869847, 0.5974056, 0.8848737, 0, 1, 0.5921569, 1,
-0.1858487, -0.5897001, -2.941401, 0, 1, 0.5960785, 1,
-0.1838815, 0.002641136, -0.0893626, 0, 1, 0.6039216, 1,
-0.1833206, 0.8556173, 1.558325, 0, 1, 0.6117647, 1,
-0.1825681, -1.322389, -4.07533, 0, 1, 0.6156863, 1,
-0.1794079, -0.3042657, -1.434215, 0, 1, 0.6235294, 1,
-0.1792849, -0.3716086, -2.718416, 0, 1, 0.627451, 1,
-0.1702042, 0.05384415, -1.194719, 0, 1, 0.6352941, 1,
-0.1682534, 2.024404, 0.5288351, 0, 1, 0.6392157, 1,
-0.1668802, -0.1168406, -0.1827406, 0, 1, 0.6470588, 1,
-0.166492, -0.9134577, 0.410626, 0, 1, 0.6509804, 1,
-0.1653582, 0.6357959, 0.9074519, 0, 1, 0.6588235, 1,
-0.1647923, -0.665861, -3.556298, 0, 1, 0.6627451, 1,
-0.1619153, 0.7292842, -0.6361819, 0, 1, 0.6705883, 1,
-0.1543059, 0.1663923, -2.410149, 0, 1, 0.6745098, 1,
-0.1524369, -0.06900433, -1.62509, 0, 1, 0.682353, 1,
-0.1514613, -0.235238, -3.651305, 0, 1, 0.6862745, 1,
-0.1487111, -0.2686036, -2.173043, 0, 1, 0.6941177, 1,
-0.1424005, 0.7157488, -0.243231, 0, 1, 0.7019608, 1,
-0.1379825, -0.4342037, -3.149079, 0, 1, 0.7058824, 1,
-0.1352569, -1.521244, -4.320868, 0, 1, 0.7137255, 1,
-0.134521, 0.1454987, -0.966059, 0, 1, 0.7176471, 1,
-0.1273049, -0.1517091, -1.945319, 0, 1, 0.7254902, 1,
-0.1247494, -1.168895, -3.839241, 0, 1, 0.7294118, 1,
-0.1241599, 0.4178477, 0.8968104, 0, 1, 0.7372549, 1,
-0.1237191, -0.6795943, -3.672936, 0, 1, 0.7411765, 1,
-0.1172025, -0.07359906, -1.562847, 0, 1, 0.7490196, 1,
-0.1171843, 0.3482815, 0.5096981, 0, 1, 0.7529412, 1,
-0.1090187, 1.487839, 0.6867075, 0, 1, 0.7607843, 1,
-0.1065274, 0.2026715, 0.6636909, 0, 1, 0.7647059, 1,
-0.1050411, 0.7539204, -0.5298826, 0, 1, 0.772549, 1,
-0.1024261, -0.3649262, -4.641212, 0, 1, 0.7764706, 1,
-0.09981237, -0.8276705, -2.306644, 0, 1, 0.7843137, 1,
-0.0906534, -1.088066, -2.614336, 0, 1, 0.7882353, 1,
-0.08857647, 1.059404, 0.4979272, 0, 1, 0.7960784, 1,
-0.08487752, -0.7558403, -3.06582, 0, 1, 0.8039216, 1,
-0.07763325, -1.894531, -3.309071, 0, 1, 0.8078431, 1,
-0.07136843, 0.2617716, -1.30117, 0, 1, 0.8156863, 1,
-0.06308451, 1.08848, -0.7104291, 0, 1, 0.8196079, 1,
-0.05937654, -0.6106762, -3.724508, 0, 1, 0.827451, 1,
-0.05828642, 1.167467, -1.743646, 0, 1, 0.8313726, 1,
-0.04914973, 0.3929567, 1.39478, 0, 1, 0.8392157, 1,
-0.04887084, -0.445702, -2.180522, 0, 1, 0.8431373, 1,
-0.0473451, -0.378594, -2.193071, 0, 1, 0.8509804, 1,
-0.04689785, 1.14456, 1.113461, 0, 1, 0.854902, 1,
-0.04568204, -0.6004405, -4.246233, 0, 1, 0.8627451, 1,
-0.04454078, 0.1771453, -1.578783, 0, 1, 0.8666667, 1,
-0.04428413, 0.5772832, -1.102631, 0, 1, 0.8745098, 1,
-0.03842579, 0.6821922, -0.7166875, 0, 1, 0.8784314, 1,
-0.03728037, -0.664577, -4.561632, 0, 1, 0.8862745, 1,
-0.03663092, -0.01845763, -1.965806, 0, 1, 0.8901961, 1,
-0.03099757, 1.153025, -1.242185, 0, 1, 0.8980392, 1,
-0.02484409, 0.5738689, 1.311188, 0, 1, 0.9058824, 1,
-0.02376779, -2.565419, -3.030851, 0, 1, 0.9098039, 1,
-0.02187736, 0.2769022, -0.6137567, 0, 1, 0.9176471, 1,
-0.02099174, 1.277297, 0.04031614, 0, 1, 0.9215686, 1,
-0.01930914, -2.78052, -2.43509, 0, 1, 0.9294118, 1,
-0.0109934, -2.036165, -1.704972, 0, 1, 0.9333333, 1,
-0.01065393, -1.387852, -4.759848, 0, 1, 0.9411765, 1,
-0.007552685, -0.01270812, -1.617632, 0, 1, 0.945098, 1,
-0.007047396, -1.229409, -2.848652, 0, 1, 0.9529412, 1,
-0.004920871, 1.957438, -0.7735103, 0, 1, 0.9568627, 1,
-0.003058686, -0.6393332, -1.132915, 0, 1, 0.9647059, 1,
-0.0008757751, 0.5874041, 0.125881, 0, 1, 0.9686275, 1,
0.000355297, 1.096501, 0.1662332, 0, 1, 0.9764706, 1,
0.002718279, 0.8518686, 0.2228105, 0, 1, 0.9803922, 1,
0.008795564, -1.172803, 4.201406, 0, 1, 0.9882353, 1,
0.009456437, -1.133603, 2.876969, 0, 1, 0.9921569, 1,
0.0108965, 0.1027101, 0.6023273, 0, 1, 1, 1,
0.01108645, 1.382761, -0.1449164, 0, 0.9921569, 1, 1,
0.01133447, -0.9287387, 4.5889, 0, 0.9882353, 1, 1,
0.01214554, 2.164642, 0.9772176, 0, 0.9803922, 1, 1,
0.0151563, -0.2187986, 2.845536, 0, 0.9764706, 1, 1,
0.01750988, 1.811014, 1.535941, 0, 0.9686275, 1, 1,
0.01803624, 0.1388406, 0.264645, 0, 0.9647059, 1, 1,
0.01879635, -0.5092685, 3.889352, 0, 0.9568627, 1, 1,
0.02054925, -0.05106421, 3.243147, 0, 0.9529412, 1, 1,
0.02175179, -0.7778062, 4.323715, 0, 0.945098, 1, 1,
0.02257046, 0.1650426, -1.368263, 0, 0.9411765, 1, 1,
0.02395347, 0.1249115, 0.9989808, 0, 0.9333333, 1, 1,
0.02502204, -0.6398708, 5.926401, 0, 0.9294118, 1, 1,
0.03198354, -1.13333, 1.424828, 0, 0.9215686, 1, 1,
0.03411429, 0.3232411, 1.459718, 0, 0.9176471, 1, 1,
0.03432139, 1.075102, 0.03717071, 0, 0.9098039, 1, 1,
0.03840916, -0.8199935, 2.741271, 0, 0.9058824, 1, 1,
0.04340389, 0.04690648, -0.3863229, 0, 0.8980392, 1, 1,
0.04733175, -0.007929648, 4.008342, 0, 0.8901961, 1, 1,
0.04999925, 0.1625734, 0.4433928, 0, 0.8862745, 1, 1,
0.05161407, -0.4980069, 3.475152, 0, 0.8784314, 1, 1,
0.05453992, 0.782638, 0.2213599, 0, 0.8745098, 1, 1,
0.05749457, 2.93254, 2.366379, 0, 0.8666667, 1, 1,
0.05770736, 0.2706277, 0.9286142, 0, 0.8627451, 1, 1,
0.05977489, 0.1116261, 1.217873, 0, 0.854902, 1, 1,
0.06040755, 1.359399, -1.232523, 0, 0.8509804, 1, 1,
0.0605766, -0.5116463, 3.546236, 0, 0.8431373, 1, 1,
0.06185776, 0.2194125, -1.075034, 0, 0.8392157, 1, 1,
0.063827, -0.5045062, 2.374566, 0, 0.8313726, 1, 1,
0.06962405, 0.5924666, -1.354476, 0, 0.827451, 1, 1,
0.07313131, 2.401305, 1.747472, 0, 0.8196079, 1, 1,
0.07439465, 1.572587, -0.642967, 0, 0.8156863, 1, 1,
0.08636706, 0.1543808, -0.513032, 0, 0.8078431, 1, 1,
0.08783373, -0.2186005, 3.303444, 0, 0.8039216, 1, 1,
0.09364433, 0.2888092, 2.393139, 0, 0.7960784, 1, 1,
0.09600279, -0.2608582, 0.4674414, 0, 0.7882353, 1, 1,
0.09704434, 0.4801957, -0.1688911, 0, 0.7843137, 1, 1,
0.09974729, -0.0785252, 2.230778, 0, 0.7764706, 1, 1,
0.101038, 0.8930453, -0.1801918, 0, 0.772549, 1, 1,
0.1070283, 0.4695016, 0.1021125, 0, 0.7647059, 1, 1,
0.1072318, -0.6328641, 2.596166, 0, 0.7607843, 1, 1,
0.1091519, 0.1748071, -0.1444835, 0, 0.7529412, 1, 1,
0.1113087, -0.01239905, 2.102811, 0, 0.7490196, 1, 1,
0.1123898, 0.9849707, -0.7252786, 0, 0.7411765, 1, 1,
0.1143382, -0.5663419, 3.118626, 0, 0.7372549, 1, 1,
0.1178543, 0.9186952, -0.2290731, 0, 0.7294118, 1, 1,
0.1210384, 1.036512, 0.5994027, 0, 0.7254902, 1, 1,
0.1216601, 0.7094142, 2.100039, 0, 0.7176471, 1, 1,
0.1219806, 0.04080304, 0.8300664, 0, 0.7137255, 1, 1,
0.1243211, 2.081073, -1.084267, 0, 0.7058824, 1, 1,
0.12606, -0.7344148, 2.9708, 0, 0.6980392, 1, 1,
0.1309635, 1.559425, 1.036924, 0, 0.6941177, 1, 1,
0.1325037, -0.426054, 3.130142, 0, 0.6862745, 1, 1,
0.1332249, -0.5509908, 2.992018, 0, 0.682353, 1, 1,
0.1366908, 0.1009501, -0.9955856, 0, 0.6745098, 1, 1,
0.1375602, 0.252557, -0.08877763, 0, 0.6705883, 1, 1,
0.1380731, 1.159379, -0.1965689, 0, 0.6627451, 1, 1,
0.1466205, 0.5410694, -1.03241, 0, 0.6588235, 1, 1,
0.1486625, 0.5386198, 2.695151, 0, 0.6509804, 1, 1,
0.1495802, 0.3898998, 0.05623638, 0, 0.6470588, 1, 1,
0.1533599, -0.2486016, 3.966013, 0, 0.6392157, 1, 1,
0.1547334, 0.9303945, 0.7407454, 0, 0.6352941, 1, 1,
0.1561076, -0.572199, 2.768471, 0, 0.627451, 1, 1,
0.1566325, 0.0780312, 1.003986, 0, 0.6235294, 1, 1,
0.1612863, 0.443774, 0.3665779, 0, 0.6156863, 1, 1,
0.1628815, 0.3790272, -0.759841, 0, 0.6117647, 1, 1,
0.1686231, -0.1015717, 0.898111, 0, 0.6039216, 1, 1,
0.1700232, -0.6716036, 3.653171, 0, 0.5960785, 1, 1,
0.1745859, -0.4034034, 2.145664, 0, 0.5921569, 1, 1,
0.176, -0.7113277, 4.094676, 0, 0.5843138, 1, 1,
0.1760317, 0.4984175, 0.9643926, 0, 0.5803922, 1, 1,
0.1794407, 0.7557494, -0.516548, 0, 0.572549, 1, 1,
0.1806742, 0.3982821, 0.8709939, 0, 0.5686275, 1, 1,
0.1828453, 0.5618993, -0.1235925, 0, 0.5607843, 1, 1,
0.184029, 1.09817, 1.954108, 0, 0.5568628, 1, 1,
0.1913767, 0.01998171, 0.1453294, 0, 0.5490196, 1, 1,
0.1963146, 0.2112873, -0.5459294, 0, 0.5450981, 1, 1,
0.1987139, 0.4973561, 0.9508078, 0, 0.5372549, 1, 1,
0.1990469, 0.05641617, 1.724649, 0, 0.5333334, 1, 1,
0.2028912, 0.5957239, 1.088023, 0, 0.5254902, 1, 1,
0.2035647, -1.266221, 3.572323, 0, 0.5215687, 1, 1,
0.2159122, 3.344793, 0.2264237, 0, 0.5137255, 1, 1,
0.2161899, -0.1360585, 1.759899, 0, 0.509804, 1, 1,
0.2178906, 1.898663, -0.888708, 0, 0.5019608, 1, 1,
0.2212961, -0.2237718, 1.9958, 0, 0.4941176, 1, 1,
0.2224736, 0.9225438, 1.964031, 0, 0.4901961, 1, 1,
0.2274701, -2.447721, 3.838061, 0, 0.4823529, 1, 1,
0.22892, -0.03422961, 3.005039, 0, 0.4784314, 1, 1,
0.2323793, -0.3770686, 1.394866, 0, 0.4705882, 1, 1,
0.2356576, 1.601427, 0.722946, 0, 0.4666667, 1, 1,
0.23592, 0.2586837, 1.551435, 0, 0.4588235, 1, 1,
0.2398888, 1.578059, -0.965166, 0, 0.454902, 1, 1,
0.2400504, 0.1078676, 0.1807591, 0, 0.4470588, 1, 1,
0.2471283, -0.1454221, 4.519574, 0, 0.4431373, 1, 1,
0.2530177, -0.3236584, 3.155765, 0, 0.4352941, 1, 1,
0.2548555, -0.02455609, 0.8226555, 0, 0.4313726, 1, 1,
0.2578698, -0.1466977, 2.042915, 0, 0.4235294, 1, 1,
0.2595418, 0.7567763, 0.7663268, 0, 0.4196078, 1, 1,
0.2611264, -0.8738906, 1.845374, 0, 0.4117647, 1, 1,
0.26516, 0.3006766, -0.5047863, 0, 0.4078431, 1, 1,
0.2672727, -1.580091, 1.459323, 0, 0.4, 1, 1,
0.26871, -0.3850782, 2.749347, 0, 0.3921569, 1, 1,
0.2688105, 0.6009768, 1.394554, 0, 0.3882353, 1, 1,
0.2689235, 0.4869342, -0.02152736, 0, 0.3803922, 1, 1,
0.2711456, -1.625796, 3.76448, 0, 0.3764706, 1, 1,
0.2780488, -0.3644289, 3.406709, 0, 0.3686275, 1, 1,
0.2781663, -0.8574991, 2.947355, 0, 0.3647059, 1, 1,
0.2783357, -0.8997836, 2.867174, 0, 0.3568628, 1, 1,
0.2837474, -0.5661644, 2.355122, 0, 0.3529412, 1, 1,
0.2866593, 0.1010315, 0.9856483, 0, 0.345098, 1, 1,
0.2884878, -1.115514, 3.840972, 0, 0.3411765, 1, 1,
0.2886314, 1.001056, -1.492278, 0, 0.3333333, 1, 1,
0.2926457, -0.05343401, 2.66757, 0, 0.3294118, 1, 1,
0.2948616, -1.43531, 2.871422, 0, 0.3215686, 1, 1,
0.2949131, 0.9266661, 0.679658, 0, 0.3176471, 1, 1,
0.300712, 1.434553, -0.3919961, 0, 0.3098039, 1, 1,
0.3015322, 0.8964478, -0.01313094, 0, 0.3058824, 1, 1,
0.3066913, 1.321124, -0.9722199, 0, 0.2980392, 1, 1,
0.3119681, 0.2573273, -0.07962225, 0, 0.2901961, 1, 1,
0.3164512, -2.261359, 3.413626, 0, 0.2862745, 1, 1,
0.3175796, 1.673204, 0.8282323, 0, 0.2784314, 1, 1,
0.3194483, 1.298888, 0.0933505, 0, 0.2745098, 1, 1,
0.3228684, 2.06324, 0.8314211, 0, 0.2666667, 1, 1,
0.3232449, 0.2069268, -1.591743, 0, 0.2627451, 1, 1,
0.3243146, 1.024006, 0.608128, 0, 0.254902, 1, 1,
0.3261756, -1.117437, 2.456551, 0, 0.2509804, 1, 1,
0.3281894, -0.6424451, 3.840563, 0, 0.2431373, 1, 1,
0.3282241, -0.2759772, 1.802394, 0, 0.2392157, 1, 1,
0.3332599, 1.817295, 0.909309, 0, 0.2313726, 1, 1,
0.3354728, -2.323559, 2.863266, 0, 0.227451, 1, 1,
0.3366903, 1.958345, 0.6290171, 0, 0.2196078, 1, 1,
0.3384151, -1.087883, 1.768348, 0, 0.2156863, 1, 1,
0.3433729, -0.5565003, 2.009948, 0, 0.2078431, 1, 1,
0.3442758, -0.05124118, 2.986389, 0, 0.2039216, 1, 1,
0.3477842, 0.176158, 1.758853, 0, 0.1960784, 1, 1,
0.3483256, 0.3237574, 0.8810159, 0, 0.1882353, 1, 1,
0.3483758, -0.8493696, 4.257482, 0, 0.1843137, 1, 1,
0.3521727, -2.043699, 1.791841, 0, 0.1764706, 1, 1,
0.3533128, 0.02153882, 2.837682, 0, 0.172549, 1, 1,
0.3533196, 0.7796466, 2.161101, 0, 0.1647059, 1, 1,
0.3593897, -0.4740019, 2.138989, 0, 0.1607843, 1, 1,
0.3602244, -0.5679252, 2.464684, 0, 0.1529412, 1, 1,
0.3602425, 0.7511671, -0.7243248, 0, 0.1490196, 1, 1,
0.360739, -1.782575, 3.250835, 0, 0.1411765, 1, 1,
0.3615977, 1.135024, 2.008752, 0, 0.1372549, 1, 1,
0.3635542, 0.2585411, 0.6737808, 0, 0.1294118, 1, 1,
0.3639335, -0.2527905, 3.243073, 0, 0.1254902, 1, 1,
0.3660277, 1.533901, -0.1731968, 0, 0.1176471, 1, 1,
0.3718845, 0.4557279, -0.9570347, 0, 0.1137255, 1, 1,
0.3734164, 1.048621, -0.2953734, 0, 0.1058824, 1, 1,
0.3760383, -0.380432, 3.083977, 0, 0.09803922, 1, 1,
0.3789207, -1.267202, 1.257665, 0, 0.09411765, 1, 1,
0.3805863, -0.8319132, 2.887503, 0, 0.08627451, 1, 1,
0.3821849, 1.267221, -1.721805, 0, 0.08235294, 1, 1,
0.387179, -0.4531246, 2.177098, 0, 0.07450981, 1, 1,
0.3876646, -0.3555359, 3.466537, 0, 0.07058824, 1, 1,
0.3887053, 0.3670609, 0.2512952, 0, 0.0627451, 1, 1,
0.3887463, 1.084925, 2.242574, 0, 0.05882353, 1, 1,
0.3887565, -0.641466, 2.757219, 0, 0.05098039, 1, 1,
0.3905176, 0.05817747, 1.252876, 0, 0.04705882, 1, 1,
0.3974414, -0.7604919, 3.305973, 0, 0.03921569, 1, 1,
0.3975601, -1.576782, 1.100788, 0, 0.03529412, 1, 1,
0.4063468, 0.1659991, 2.349082, 0, 0.02745098, 1, 1,
0.4132085, 1.813936, -0.5820482, 0, 0.02352941, 1, 1,
0.4152318, 1.216112, 0.8895165, 0, 0.01568628, 1, 1,
0.4210974, -1.853256, 2.722124, 0, 0.01176471, 1, 1,
0.4252529, 0.3627547, 0.8441287, 0, 0.003921569, 1, 1,
0.4255329, 2.022133, -1.098371, 0.003921569, 0, 1, 1,
0.4258665, 0.2576813, 1.139563, 0.007843138, 0, 1, 1,
0.4261795, 0.6527818, -1.297853, 0.01568628, 0, 1, 1,
0.4269403, -1.184049, 2.170702, 0.01960784, 0, 1, 1,
0.4273018, -0.4677191, 2.799053, 0.02745098, 0, 1, 1,
0.4277506, 1.181926, 0.779784, 0.03137255, 0, 1, 1,
0.42808, -0.1726447, 2.38248, 0.03921569, 0, 1, 1,
0.4302998, 1.179811, 1.823518, 0.04313726, 0, 1, 1,
0.4322313, 0.8506863, 0.1254641, 0.05098039, 0, 1, 1,
0.4359132, 0.165792, 2.782097, 0.05490196, 0, 1, 1,
0.4395898, -0.3009953, 0.6830138, 0.0627451, 0, 1, 1,
0.4483784, -0.7386476, 3.705459, 0.06666667, 0, 1, 1,
0.449349, -0.2419431, 1.862619, 0.07450981, 0, 1, 1,
0.4506392, 0.07297553, 0.2132802, 0.07843138, 0, 1, 1,
0.451551, 0.08892624, 0.4618474, 0.08627451, 0, 1, 1,
0.452558, 0.2797076, 0.6221718, 0.09019608, 0, 1, 1,
0.4570366, 0.7019091, 1.975202, 0.09803922, 0, 1, 1,
0.4577117, 1.176769, 1.123923, 0.1058824, 0, 1, 1,
0.46477, -0.8398319, 2.67765, 0.1098039, 0, 1, 1,
0.467388, -0.7980897, 3.11632, 0.1176471, 0, 1, 1,
0.470375, -1.580256, 4.065506, 0.1215686, 0, 1, 1,
0.4768116, 0.8137013, -0.182069, 0.1294118, 0, 1, 1,
0.4776597, -2.112361, 4.042808, 0.1333333, 0, 1, 1,
0.4811335, -0.1319934, 2.683943, 0.1411765, 0, 1, 1,
0.4871378, -0.6852862, 3.443269, 0.145098, 0, 1, 1,
0.4881335, -0.7065535, 3.016945, 0.1529412, 0, 1, 1,
0.4944188, -0.7826838, 1.465438, 0.1568628, 0, 1, 1,
0.4992655, -1.301521, 2.198527, 0.1647059, 0, 1, 1,
0.4994146, -0.130642, 0.9912378, 0.1686275, 0, 1, 1,
0.5008911, -0.6649072, 3.013909, 0.1764706, 0, 1, 1,
0.5069206, -1.39876, 2.402374, 0.1803922, 0, 1, 1,
0.5106905, -0.3609535, 1.803784, 0.1882353, 0, 1, 1,
0.5111018, 1.456159, -0.09808473, 0.1921569, 0, 1, 1,
0.5118424, -1.463041, 3.194864, 0.2, 0, 1, 1,
0.513971, 0.4925106, 1.568804, 0.2078431, 0, 1, 1,
0.5150333, 0.9214494, -0.7754017, 0.2117647, 0, 1, 1,
0.5152377, 0.6982357, -0.1701893, 0.2196078, 0, 1, 1,
0.5175333, -0.4911144, 2.042593, 0.2235294, 0, 1, 1,
0.5180723, -0.5819996, 2.488707, 0.2313726, 0, 1, 1,
0.5188348, 0.3839945, 0.5146337, 0.2352941, 0, 1, 1,
0.5198187, -1.78009, 2.088362, 0.2431373, 0, 1, 1,
0.5219327, 0.4066566, 2.143563, 0.2470588, 0, 1, 1,
0.5252728, 0.2329846, -0.06584781, 0.254902, 0, 1, 1,
0.5263741, 1.182358, -0.1992751, 0.2588235, 0, 1, 1,
0.5267309, -0.5150124, 3.18158, 0.2666667, 0, 1, 1,
0.5276581, 0.4479874, 2.179679, 0.2705882, 0, 1, 1,
0.5303871, 1.211374, 0.3087697, 0.2784314, 0, 1, 1,
0.5307436, -0.1613926, 3.483427, 0.282353, 0, 1, 1,
0.5318735, -1.460327, 3.106667, 0.2901961, 0, 1, 1,
0.5349468, 0.6351522, 0.2176693, 0.2941177, 0, 1, 1,
0.5378342, -1.653774, 2.166308, 0.3019608, 0, 1, 1,
0.5430303, -0.5440022, 2.284235, 0.3098039, 0, 1, 1,
0.5458359, 1.165229, 0.1442155, 0.3137255, 0, 1, 1,
0.5558654, 0.961498, -2.331155, 0.3215686, 0, 1, 1,
0.5563458, 0.6220061, 1.47382, 0.3254902, 0, 1, 1,
0.5603329, -0.8994367, 4.3648, 0.3333333, 0, 1, 1,
0.5613643, 0.5310001, 1.472282, 0.3372549, 0, 1, 1,
0.566104, -1.162107, 2.347064, 0.345098, 0, 1, 1,
0.570566, 0.2535307, 1.679883, 0.3490196, 0, 1, 1,
0.5723036, -0.8214629, 1.899822, 0.3568628, 0, 1, 1,
0.5761289, -0.5349542, 2.181985, 0.3607843, 0, 1, 1,
0.5774087, -0.4347581, 3.880687, 0.3686275, 0, 1, 1,
0.5783572, 0.6266121, -0.02416877, 0.372549, 0, 1, 1,
0.5818095, 0.07135176, 2.496588, 0.3803922, 0, 1, 1,
0.5870652, -1.717759, 6.276508, 0.3843137, 0, 1, 1,
0.5907053, 1.862841, 0.6267421, 0.3921569, 0, 1, 1,
0.5924816, 1.403921, 0.1071545, 0.3960784, 0, 1, 1,
0.596522, 0.3626199, -0.4918005, 0.4039216, 0, 1, 1,
0.6047472, 1.625564, 1.796382, 0.4117647, 0, 1, 1,
0.6059556, 1.462843, 0.5339882, 0.4156863, 0, 1, 1,
0.6088679, -1.626043, 4.374592, 0.4235294, 0, 1, 1,
0.6157845, -0.7549734, 2.854815, 0.427451, 0, 1, 1,
0.6162589, 2.053777, 0.3932202, 0.4352941, 0, 1, 1,
0.6164085, -1.14073, 3.050829, 0.4392157, 0, 1, 1,
0.6186309, -0.2090942, 2.647292, 0.4470588, 0, 1, 1,
0.6205105, -3.139096, 2.510016, 0.4509804, 0, 1, 1,
0.621699, -0.003749361, 2.295868, 0.4588235, 0, 1, 1,
0.6251774, -0.1582204, 1.669871, 0.4627451, 0, 1, 1,
0.6345924, 0.8766172, 0.5745227, 0.4705882, 0, 1, 1,
0.6354457, 0.2913929, 1.409534, 0.4745098, 0, 1, 1,
0.6379363, -0.4047729, 0.439942, 0.4823529, 0, 1, 1,
0.6387994, 0.8617616, -0.3191713, 0.4862745, 0, 1, 1,
0.6454322, -0.3432952, 2.132734, 0.4941176, 0, 1, 1,
0.6468258, -1.306754, 2.800396, 0.5019608, 0, 1, 1,
0.6471012, -2.3095, 2.082027, 0.5058824, 0, 1, 1,
0.6511039, -0.3911435, 2.46953, 0.5137255, 0, 1, 1,
0.6575539, -0.1483389, -0.8214846, 0.5176471, 0, 1, 1,
0.658649, -0.8753987, 2.879199, 0.5254902, 0, 1, 1,
0.6603845, 1.047726, 1.819407, 0.5294118, 0, 1, 1,
0.6633639, 0.4484054, 1.579775, 0.5372549, 0, 1, 1,
0.6638436, 0.9935423, 1.97931, 0.5411765, 0, 1, 1,
0.6696705, 2.309646, 1.282906, 0.5490196, 0, 1, 1,
0.6746309, 1.809409, 0.8361868, 0.5529412, 0, 1, 1,
0.6788241, -0.1042107, 0.6155128, 0.5607843, 0, 1, 1,
0.6808364, 0.8244852, 1.200662, 0.5647059, 0, 1, 1,
0.680838, -0.03531652, 1.891739, 0.572549, 0, 1, 1,
0.6814772, -0.8108279, 2.358081, 0.5764706, 0, 1, 1,
0.6861376, 0.06849439, 1.906807, 0.5843138, 0, 1, 1,
0.689678, 1.50089, 0.5111801, 0.5882353, 0, 1, 1,
0.6897542, -0.02213279, 1.077681, 0.5960785, 0, 1, 1,
0.6917533, -1.183536, 3.875724, 0.6039216, 0, 1, 1,
0.6924007, -0.8654892, 1.482866, 0.6078432, 0, 1, 1,
0.6941962, -0.1723208, 1.567205, 0.6156863, 0, 1, 1,
0.6942325, 0.8092006, 0.3040466, 0.6196079, 0, 1, 1,
0.7033199, -0.5928717, 2.435176, 0.627451, 0, 1, 1,
0.7044142, 1.237303, 0.9625843, 0.6313726, 0, 1, 1,
0.7122539, -1.843563, 4.746177, 0.6392157, 0, 1, 1,
0.7125015, -0.888056, 1.869258, 0.6431373, 0, 1, 1,
0.7220709, -0.07033164, 1.221152, 0.6509804, 0, 1, 1,
0.7241313, 1.465994, 1.396953, 0.654902, 0, 1, 1,
0.7303173, 0.4027128, 0.494265, 0.6627451, 0, 1, 1,
0.732571, -0.922931, 2.837583, 0.6666667, 0, 1, 1,
0.7328788, -0.04298331, -0.07505447, 0.6745098, 0, 1, 1,
0.736318, 0.06615767, 3.097297, 0.6784314, 0, 1, 1,
0.7365761, 1.095176, 0.06795169, 0.6862745, 0, 1, 1,
0.7467044, 0.01792883, 1.340092, 0.6901961, 0, 1, 1,
0.7468473, -0.1148092, 2.305066, 0.6980392, 0, 1, 1,
0.7476075, -0.632425, 0.8817168, 0.7058824, 0, 1, 1,
0.7488256, -1.705473, 2.157292, 0.7098039, 0, 1, 1,
0.7498001, -1.604614, 2.926575, 0.7176471, 0, 1, 1,
0.7515522, 0.5934125, 1.124128, 0.7215686, 0, 1, 1,
0.7557346, 1.416411, -0.2808254, 0.7294118, 0, 1, 1,
0.7569263, 2.277901, 1.189356, 0.7333333, 0, 1, 1,
0.7619975, 0.3081226, 0.4793508, 0.7411765, 0, 1, 1,
0.7623543, -0.9453966, 3.238388, 0.7450981, 0, 1, 1,
0.7638794, -1.100925, 2.553812, 0.7529412, 0, 1, 1,
0.7747708, 1.079378, 0.3931327, 0.7568628, 0, 1, 1,
0.7883242, 0.3029886, 1.160231, 0.7647059, 0, 1, 1,
0.7887788, -1.093104, 2.472519, 0.7686275, 0, 1, 1,
0.794613, -0.009179052, 0.2487595, 0.7764706, 0, 1, 1,
0.7970129, 1.137893, 0.8179504, 0.7803922, 0, 1, 1,
0.7977979, -0.7294632, 2.492228, 0.7882353, 0, 1, 1,
0.7979525, -0.6171886, 3.453047, 0.7921569, 0, 1, 1,
0.8020742, -0.5487495, 0.7021937, 0.8, 0, 1, 1,
0.8074198, 0.1423411, 1.370641, 0.8078431, 0, 1, 1,
0.8075387, 0.6243546, 2.060881, 0.8117647, 0, 1, 1,
0.8119618, 1.300098, -0.04576769, 0.8196079, 0, 1, 1,
0.8128417, 2.785136, -0.957104, 0.8235294, 0, 1, 1,
0.8160092, -1.155222, 2.592864, 0.8313726, 0, 1, 1,
0.8200708, 0.6523444, 0.5066293, 0.8352941, 0, 1, 1,
0.8235306, -0.7349451, 3.017207, 0.8431373, 0, 1, 1,
0.8281653, 0.07788119, 2.699881, 0.8470588, 0, 1, 1,
0.828679, 1.960096, 1.815961, 0.854902, 0, 1, 1,
0.8302367, 0.003096943, 1.389146, 0.8588235, 0, 1, 1,
0.8315956, -1.139692, 3.838054, 0.8666667, 0, 1, 1,
0.8325049, 0.03187447, 1.275397, 0.8705882, 0, 1, 1,
0.8343191, -0.6163404, 2.683131, 0.8784314, 0, 1, 1,
0.8387676, 0.6345085, -1.757855, 0.8823529, 0, 1, 1,
0.8408257, 0.2903348, 1.998334, 0.8901961, 0, 1, 1,
0.8454328, -0.3084309, 2.351253, 0.8941177, 0, 1, 1,
0.849983, -0.3303582, 2.624403, 0.9019608, 0, 1, 1,
0.8518651, -0.7480611, 3.677785, 0.9098039, 0, 1, 1,
0.8544336, -0.7585108, 1.108106, 0.9137255, 0, 1, 1,
0.8560922, 0.6624517, 0.1812131, 0.9215686, 0, 1, 1,
0.8621668, 0.4438446, 0.04308554, 0.9254902, 0, 1, 1,
0.8657173, 0.1818461, 0.7752755, 0.9333333, 0, 1, 1,
0.8726804, -0.2915072, 2.352282, 0.9372549, 0, 1, 1,
0.874284, 0.2771297, 1.438953, 0.945098, 0, 1, 1,
0.8906879, -0.3035009, 2.627407, 0.9490196, 0, 1, 1,
0.8913531, 0.2937385, -0.5218592, 0.9568627, 0, 1, 1,
0.8969766, 0.143148, 0.9401779, 0.9607843, 0, 1, 1,
0.9036084, 0.4331765, 2.664474, 0.9686275, 0, 1, 1,
0.9043927, -0.4141933, 2.287457, 0.972549, 0, 1, 1,
0.9083534, 0.4668051, 0.5470687, 0.9803922, 0, 1, 1,
0.9172558, 0.0234856, 1.605686, 0.9843137, 0, 1, 1,
0.9196426, 1.29967, 0.7820495, 0.9921569, 0, 1, 1,
0.9232044, -1.313892, 3.364539, 0.9960784, 0, 1, 1,
0.9255636, 2.061287, 0.9389073, 1, 0, 0.9960784, 1,
0.9269294, 1.259924, 0.1833615, 1, 0, 0.9882353, 1,
0.9279487, -0.9188802, 0.8030334, 1, 0, 0.9843137, 1,
0.9286326, 0.5295084, 0.5622351, 1, 0, 0.9764706, 1,
0.9294024, 0.07179678, 0.3933535, 1, 0, 0.972549, 1,
0.9380478, 0.8839527, 2.406089, 1, 0, 0.9647059, 1,
0.9416893, -0.03135882, 0.6867487, 1, 0, 0.9607843, 1,
0.9511112, 0.9382826, 1.185106, 1, 0, 0.9529412, 1,
0.9514812, 0.5811511, 1.082151, 1, 0, 0.9490196, 1,
0.9520289, 2.570493, 0.6422307, 1, 0, 0.9411765, 1,
0.9544333, -1.255541, 1.748115, 1, 0, 0.9372549, 1,
0.9742688, -1.43916, 1.324578, 1, 0, 0.9294118, 1,
0.978025, 0.01208717, 1.734468, 1, 0, 0.9254902, 1,
0.9835344, 0.2386671, 1.172632, 1, 0, 0.9176471, 1,
0.9857199, 1.009833, 0.7695818, 1, 0, 0.9137255, 1,
0.9892336, 0.2227478, 0.4782493, 1, 0, 0.9058824, 1,
0.9952913, 0.1733569, 2.112206, 1, 0, 0.9019608, 1,
0.9979178, -0.1349697, 1.209434, 1, 0, 0.8941177, 1,
0.998408, 1.656485, 1.172189, 1, 0, 0.8862745, 1,
1.002417, -1.495637, 1.63692, 1, 0, 0.8823529, 1,
1.006088, -0.1155407, 2.025563, 1, 0, 0.8745098, 1,
1.029724, -0.1824069, 1.355081, 1, 0, 0.8705882, 1,
1.032066, 0.3908097, 0.4980963, 1, 0, 0.8627451, 1,
1.032868, -2.470746, 3.148059, 1, 0, 0.8588235, 1,
1.032961, 0.7741486, 0.6613261, 1, 0, 0.8509804, 1,
1.036766, 0.5806627, 2.025568, 1, 0, 0.8470588, 1,
1.039228, -1.031492, 4.625376, 1, 0, 0.8392157, 1,
1.047902, -0.423274, 1.037261, 1, 0, 0.8352941, 1,
1.047913, -0.2148521, 2.205997, 1, 0, 0.827451, 1,
1.052209, -2.143292, 4.037072, 1, 0, 0.8235294, 1,
1.057634, 0.07895549, 2.094027, 1, 0, 0.8156863, 1,
1.072237, 1.010501, 0.9028258, 1, 0, 0.8117647, 1,
1.076206, 1.031205, 0.7053071, 1, 0, 0.8039216, 1,
1.078634, 0.1588795, 1.041572, 1, 0, 0.7960784, 1,
1.093935, 0.9599891, 0.2843426, 1, 0, 0.7921569, 1,
1.10681, -1.151004, 2.201913, 1, 0, 0.7843137, 1,
1.115739, 0.06987499, 1.251532, 1, 0, 0.7803922, 1,
1.116163, -0.5605931, 3.465292, 1, 0, 0.772549, 1,
1.127638, -0.09596626, 0.5562916, 1, 0, 0.7686275, 1,
1.12816, 0.4599209, 1.122238, 1, 0, 0.7607843, 1,
1.129279, 0.6206764, 1.599314, 1, 0, 0.7568628, 1,
1.15189, -0.8621839, 1.721496, 1, 0, 0.7490196, 1,
1.166114, 0.4835114, 0.9297339, 1, 0, 0.7450981, 1,
1.171004, 0.1838805, 2.473481, 1, 0, 0.7372549, 1,
1.174228, -0.52463, -0.9599506, 1, 0, 0.7333333, 1,
1.197439, 0.04624368, 3.312131, 1, 0, 0.7254902, 1,
1.201573, -0.2037192, 1.325574, 1, 0, 0.7215686, 1,
1.203017, 0.06943128, 1.116862, 1, 0, 0.7137255, 1,
1.20365, 1.204723, 0.9345015, 1, 0, 0.7098039, 1,
1.214992, -1.391262, 1.09266, 1, 0, 0.7019608, 1,
1.216045, -1.903343, 3.180537, 1, 0, 0.6941177, 1,
1.226254, 1.393254, -0.268117, 1, 0, 0.6901961, 1,
1.230339, 0.2937657, 1.007332, 1, 0, 0.682353, 1,
1.233186, -0.3262348, 0.7449216, 1, 0, 0.6784314, 1,
1.235216, 0.2068738, 0.3202901, 1, 0, 0.6705883, 1,
1.251639, 0.5516133, -0.2840407, 1, 0, 0.6666667, 1,
1.281568, -0.8727292, 3.441803, 1, 0, 0.6588235, 1,
1.291811, -1.342193, 0.8005507, 1, 0, 0.654902, 1,
1.296351, -0.6422952, 1.448097, 1, 0, 0.6470588, 1,
1.307676, 0.8845627, 0.1242758, 1, 0, 0.6431373, 1,
1.311097, -1.223067, 3.199465, 1, 0, 0.6352941, 1,
1.31237, 0.8963605, 0.5590723, 1, 0, 0.6313726, 1,
1.313144, 0.7529083, 3.219005, 1, 0, 0.6235294, 1,
1.319759, 0.8587795, 0.8489316, 1, 0, 0.6196079, 1,
1.320533, 1.863896, 0.7423847, 1, 0, 0.6117647, 1,
1.32331, 1.009917, 1.631098, 1, 0, 0.6078432, 1,
1.346011, -1.59254, 1.871228, 1, 0, 0.6, 1,
1.364931, -0.4357229, 3.158567, 1, 0, 0.5921569, 1,
1.368555, 1.303473, 1.271748, 1, 0, 0.5882353, 1,
1.37684, -2.917262, 1.564303, 1, 0, 0.5803922, 1,
1.380087, -1.356787, 2.576634, 1, 0, 0.5764706, 1,
1.384475, 1.500388, -2.055763, 1, 0, 0.5686275, 1,
1.39769, 2.283926, -1.695482, 1, 0, 0.5647059, 1,
1.410458, 1.505719, 1.094237, 1, 0, 0.5568628, 1,
1.416613, -1.832835, 0.8718101, 1, 0, 0.5529412, 1,
1.428391, -0.7043018, 1.726323, 1, 0, 0.5450981, 1,
1.43046, 0.4704837, -0.5676894, 1, 0, 0.5411765, 1,
1.439481, -0.02408893, 0.32601, 1, 0, 0.5333334, 1,
1.441764, -2.21543, 3.673895, 1, 0, 0.5294118, 1,
1.452626, -2.304404, 1.749092, 1, 0, 0.5215687, 1,
1.453655, 0.8763917, 1.264897, 1, 0, 0.5176471, 1,
1.471016, 2.037495, 0.7790149, 1, 0, 0.509804, 1,
1.481932, 0.7307585, 0.7991775, 1, 0, 0.5058824, 1,
1.484714, -1.306895, 1.169008, 1, 0, 0.4980392, 1,
1.484751, -0.2530986, 1.874803, 1, 0, 0.4901961, 1,
1.486868, 0.3593696, 1.180641, 1, 0, 0.4862745, 1,
1.488745, 1.21, 4.039671, 1, 0, 0.4784314, 1,
1.493945, -0.5076315, 0.8311298, 1, 0, 0.4745098, 1,
1.502747, -0.4662485, 2.448739, 1, 0, 0.4666667, 1,
1.502826, 1.373177, 0.8620648, 1, 0, 0.4627451, 1,
1.512452, -2.441016, 1.949546, 1, 0, 0.454902, 1,
1.521412, 0.776877, 0.7485791, 1, 0, 0.4509804, 1,
1.543858, 0.6948307, 0.001991706, 1, 0, 0.4431373, 1,
1.548805, -0.3393096, 3.339056, 1, 0, 0.4392157, 1,
1.551216, 1.354599, 1.152601, 1, 0, 0.4313726, 1,
1.555316, 0.9590915, 0.4970911, 1, 0, 0.427451, 1,
1.560289, -0.174073, 1.295585, 1, 0, 0.4196078, 1,
1.567429, 0.5158809, 1.848986, 1, 0, 0.4156863, 1,
1.567961, 0.5244961, 2.081265, 1, 0, 0.4078431, 1,
1.570336, 0.676124, 0.9344097, 1, 0, 0.4039216, 1,
1.578291, -1.493967, 3.149651, 1, 0, 0.3960784, 1,
1.587296, -1.429901, 2.021601, 1, 0, 0.3882353, 1,
1.591028, 0.4461764, 1.128768, 1, 0, 0.3843137, 1,
1.607996, 0.7305589, 0.8677236, 1, 0, 0.3764706, 1,
1.611648, -0.3197092, 2.427778, 1, 0, 0.372549, 1,
1.647942, 0.5675796, -0.1736733, 1, 0, 0.3647059, 1,
1.64925, 0.2953457, 0.8463754, 1, 0, 0.3607843, 1,
1.65369, 1.698729, 0.3396531, 1, 0, 0.3529412, 1,
1.653829, 0.2641753, 2.400278, 1, 0, 0.3490196, 1,
1.673368, -1.144944, 3.906059, 1, 0, 0.3411765, 1,
1.691086, -0.8832783, 2.832875, 1, 0, 0.3372549, 1,
1.695345, 0.7540912, 0.5353745, 1, 0, 0.3294118, 1,
1.697135, -0.2618088, 2.713438, 1, 0, 0.3254902, 1,
1.713125, -0.06758781, 3.476207, 1, 0, 0.3176471, 1,
1.735389, 0.5364964, 1.168503, 1, 0, 0.3137255, 1,
1.740212, 0.8096552, 1.177358, 1, 0, 0.3058824, 1,
1.744653, -0.189539, 1.441231, 1, 0, 0.2980392, 1,
1.745326, -0.6389682, 0.4208884, 1, 0, 0.2941177, 1,
1.748296, 2.121621, 1.215218, 1, 0, 0.2862745, 1,
1.771059, 2.040133, 1.13448, 1, 0, 0.282353, 1,
1.77346, 1.189494, 0.7687756, 1, 0, 0.2745098, 1,
1.789104, -0.326373, 0.6075153, 1, 0, 0.2705882, 1,
1.78923, -1.467762, 2.159399, 1, 0, 0.2627451, 1,
1.793151, 0.1914122, 2.476052, 1, 0, 0.2588235, 1,
1.799285, 0.1653017, 0.5073265, 1, 0, 0.2509804, 1,
1.83809, -0.6084052, 2.167204, 1, 0, 0.2470588, 1,
1.838154, 2.049839, -0.004435041, 1, 0, 0.2392157, 1,
1.842679, 0.8987023, -0.003135725, 1, 0, 0.2352941, 1,
1.844283, 1.532432, -0.1881908, 1, 0, 0.227451, 1,
1.872557, -0.05385694, 2.118079, 1, 0, 0.2235294, 1,
1.877537, 0.003686431, 0.7458221, 1, 0, 0.2156863, 1,
1.887778, 0.5427486, 2.041039, 1, 0, 0.2117647, 1,
1.891971, 0.7979826, 1.360919, 1, 0, 0.2039216, 1,
1.89779, 0.4464802, -0.2334488, 1, 0, 0.1960784, 1,
1.942042, -0.71207, 0.8675226, 1, 0, 0.1921569, 1,
1.945126, 0.2955905, 0.7334668, 1, 0, 0.1843137, 1,
1.953028, -0.5469476, 2.464923, 1, 0, 0.1803922, 1,
1.975287, -1.160435, 2.939791, 1, 0, 0.172549, 1,
1.976106, -1.630153, 2.916826, 1, 0, 0.1686275, 1,
2.012413, 0.2962031, 1.377783, 1, 0, 0.1607843, 1,
2.037568, 0.9364033, 0.6302583, 1, 0, 0.1568628, 1,
2.091919, -0.7660879, 3.176313, 1, 0, 0.1490196, 1,
2.136309, -0.1741594, 0.9119071, 1, 0, 0.145098, 1,
2.141406, 1.90724, 0.8816757, 1, 0, 0.1372549, 1,
2.167107, -0.9563627, 2.460581, 1, 0, 0.1333333, 1,
2.170907, -2.272705, 1.275846, 1, 0, 0.1254902, 1,
2.173887, -0.4982638, 1.173939, 1, 0, 0.1215686, 1,
2.183421, 1.331372, 2.143411, 1, 0, 0.1137255, 1,
2.209602, -0.7939556, 3.697221, 1, 0, 0.1098039, 1,
2.24101, 0.1788099, 0.3303902, 1, 0, 0.1019608, 1,
2.263118, -1.239935, 2.607316, 1, 0, 0.09411765, 1,
2.277235, -1.636341, 3.766988, 1, 0, 0.09019608, 1,
2.279329, 1.853613, -0.2838604, 1, 0, 0.08235294, 1,
2.28766, -0.2855773, 0.2727972, 1, 0, 0.07843138, 1,
2.35153, 0.1335874, 1.54668, 1, 0, 0.07058824, 1,
2.378093, -1.280059, 2.790116, 1, 0, 0.06666667, 1,
2.415194, -0.01415647, -0.2905934, 1, 0, 0.05882353, 1,
2.46022, -0.3322233, 3.120706, 1, 0, 0.05490196, 1,
2.556616, -0.5622274, 1.061891, 1, 0, 0.04705882, 1,
2.591073, -0.9473197, 2.766292, 1, 0, 0.04313726, 1,
2.59766, -0.5086638, 2.816653, 1, 0, 0.03529412, 1,
2.617063, 1.122754, 1.526211, 1, 0, 0.03137255, 1,
2.810551, -0.1013625, 1.761699, 1, 0, 0.02352941, 1,
2.940768, -1.023964, 0.2404895, 1, 0, 0.01960784, 1,
3.007505, -1.114291, 1.560706, 1, 0, 0.01176471, 1,
3.435625, 1.276662, 1.651197, 1, 0, 0.007843138, 1
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
0.19969, -4.238115, -6.970573, 0, -0.5, 0.5, 0.5,
0.19969, -4.238115, -6.970573, 1, -0.5, 0.5, 0.5,
0.19969, -4.238115, -6.970573, 1, 1.5, 0.5, 0.5,
0.19969, -4.238115, -6.970573, 0, 1.5, 0.5, 0.5
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
-4.133227, 0.1028483, -6.970573, 0, -0.5, 0.5, 0.5,
-4.133227, 0.1028483, -6.970573, 1, -0.5, 0.5, 0.5,
-4.133227, 0.1028483, -6.970573, 1, 1.5, 0.5, 0.5,
-4.133227, 0.1028483, -6.970573, 0, 1.5, 0.5, 0.5
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
-4.133227, -4.238115, 0.6129422, 0, -0.5, 0.5, 0.5,
-4.133227, -4.238115, 0.6129422, 1, -0.5, 0.5, 0.5,
-4.133227, -4.238115, 0.6129422, 1, 1.5, 0.5, 0.5,
-4.133227, -4.238115, 0.6129422, 0, 1.5, 0.5, 0.5
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
-3, -3.236355, -5.220531,
3, -3.236355, -5.220531,
-3, -3.236355, -5.220531,
-3, -3.403315, -5.512205,
-2, -3.236355, -5.220531,
-2, -3.403315, -5.512205,
-1, -3.236355, -5.220531,
-1, -3.403315, -5.512205,
0, -3.236355, -5.220531,
0, -3.403315, -5.512205,
1, -3.236355, -5.220531,
1, -3.403315, -5.512205,
2, -3.236355, -5.220531,
2, -3.403315, -5.512205,
3, -3.236355, -5.220531,
3, -3.403315, -5.512205
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
-3, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
-3, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
-3, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
-3, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
-2, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
-2, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
-2, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
-2, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
-1, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
-1, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
-1, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
-1, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
0, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
0, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
0, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
0, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
1, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
1, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
1, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
1, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
2, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
2, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
2, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
2, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5,
3, -3.737235, -6.095552, 0, -0.5, 0.5, 0.5,
3, -3.737235, -6.095552, 1, -0.5, 0.5, 0.5,
3, -3.737235, -6.095552, 1, 1.5, 0.5, 0.5,
3, -3.737235, -6.095552, 0, 1.5, 0.5, 0.5
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
-3.133323, -3, -5.220531,
-3.133323, 3, -5.220531,
-3.133323, -3, -5.220531,
-3.299974, -3, -5.512205,
-3.133323, -2, -5.220531,
-3.299974, -2, -5.512205,
-3.133323, -1, -5.220531,
-3.299974, -1, -5.512205,
-3.133323, 0, -5.220531,
-3.299974, 0, -5.512205,
-3.133323, 1, -5.220531,
-3.299974, 1, -5.512205,
-3.133323, 2, -5.220531,
-3.299974, 2, -5.512205,
-3.133323, 3, -5.220531,
-3.299974, 3, -5.512205
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
-3.633276, -3, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, -3, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, -3, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, -3, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, -2, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, -2, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, -2, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, -2, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, -1, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, -1, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, -1, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, -1, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, 0, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, 0, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, 0, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, 0, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, 1, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, 1, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, 1, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, 1, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, 2, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, 2, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, 2, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, 2, -6.095552, 0, 1.5, 0.5, 0.5,
-3.633276, 3, -6.095552, 0, -0.5, 0.5, 0.5,
-3.633276, 3, -6.095552, 1, -0.5, 0.5, 0.5,
-3.633276, 3, -6.095552, 1, 1.5, 0.5, 0.5,
-3.633276, 3, -6.095552, 0, 1.5, 0.5, 0.5
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
-3.133323, -3.236355, -4,
-3.133323, -3.236355, 6,
-3.133323, -3.236355, -4,
-3.299974, -3.403315, -4,
-3.133323, -3.236355, -2,
-3.299974, -3.403315, -2,
-3.133323, -3.236355, 0,
-3.299974, -3.403315, 0,
-3.133323, -3.236355, 2,
-3.299974, -3.403315, 2,
-3.133323, -3.236355, 4,
-3.299974, -3.403315, 4,
-3.133323, -3.236355, 6,
-3.299974, -3.403315, 6
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
"4",
"6"
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
-3.633276, -3.737235, -4, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, -4, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, -4, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, -4, 0, 1.5, 0.5, 0.5,
-3.633276, -3.737235, -2, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, -2, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, -2, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, -2, 0, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 0, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 0, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 0, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 0, 0, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 2, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 2, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 2, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 2, 0, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 4, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 4, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 4, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 4, 0, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 6, 0, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 6, 1, -0.5, 0.5, 0.5,
-3.633276, -3.737235, 6, 1, 1.5, 0.5, 0.5,
-3.633276, -3.737235, 6, 0, 1.5, 0.5, 0.5
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
-3.133323, -3.236355, -5.220531,
-3.133323, 3.442051, -5.220531,
-3.133323, -3.236355, 6.446415,
-3.133323, 3.442051, 6.446415,
-3.133323, -3.236355, -5.220531,
-3.133323, -3.236355, 6.446415,
-3.133323, 3.442051, -5.220531,
-3.133323, 3.442051, 6.446415,
-3.133323, -3.236355, -5.220531,
3.532703, -3.236355, -5.220531,
-3.133323, -3.236355, 6.446415,
3.532703, -3.236355, 6.446415,
-3.133323, 3.442051, -5.220531,
3.532703, 3.442051, -5.220531,
-3.133323, 3.442051, 6.446415,
3.532703, 3.442051, 6.446415,
3.532703, -3.236355, -5.220531,
3.532703, 3.442051, -5.220531,
3.532703, -3.236355, 6.446415,
3.532703, 3.442051, 6.446415,
3.532703, -3.236355, -5.220531,
3.532703, -3.236355, 6.446415,
3.532703, 3.442051, -5.220531,
3.532703, 3.442051, 6.446415
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
var radius = 8.012461;
var distance = 35.64835;
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
mvMatrix.translate( -0.19969, -0.1028483, -0.6129422 );
mvMatrix.scale( 1.299609, 1.2972, 0.7425448 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.64835);
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
3-phenoxybenzoic_aci<-read.table("3-phenoxybenzoic_aci.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-3-phenoxybenzoic_aci$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzoic_aci' not found
```

```r
y<-3-phenoxybenzoic_aci$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzoic_aci' not found
```

```r
z<-3-phenoxybenzoic_aci$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenoxybenzoic_aci' not found
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
-3.036245, -0.1006011, -0.9034074, 0, 0, 1, 1, 1,
-2.993132, 0.0178267, 0.05062299, 1, 0, 0, 1, 1,
-2.94794, 2.491479, -1.763711, 1, 0, 0, 1, 1,
-2.82757, 0.7186381, 0.1099934, 1, 0, 0, 1, 1,
-2.662513, -0.8882326, -0.3644085, 1, 0, 0, 1, 1,
-2.454536, 0.3588098, -1.193146, 1, 0, 0, 1, 1,
-2.398088, -0.08996414, -1.841149, 0, 0, 0, 1, 1,
-2.33722, 0.5486478, -1.362786, 0, 0, 0, 1, 1,
-2.330136, 0.9646974, -2.626743, 0, 0, 0, 1, 1,
-2.259188, -0.1657505, -1.025948, 0, 0, 0, 1, 1,
-2.243385, -1.034459, -1.396867, 0, 0, 0, 1, 1,
-2.154699, -1.624102, -4.302261, 0, 0, 0, 1, 1,
-2.138611, -1.940272, -1.971269, 0, 0, 0, 1, 1,
-2.069883, 0.4417332, -1.768637, 1, 1, 1, 1, 1,
-2.06713, -0.7139366, -1.735746, 1, 1, 1, 1, 1,
-2.034282, 0.322793, -2.738092, 1, 1, 1, 1, 1,
-2.023716, -1.222306, -2.202956, 1, 1, 1, 1, 1,
-1.989815, 0.03815018, -1.161747, 1, 1, 1, 1, 1,
-1.95933, 0.2619701, -1.533227, 1, 1, 1, 1, 1,
-1.94434, -0.4719647, -0.2555235, 1, 1, 1, 1, 1,
-1.943001, 0.2880914, -1.109376, 1, 1, 1, 1, 1,
-1.930344, 0.3652795, -1.336582, 1, 1, 1, 1, 1,
-1.907986, -0.5296252, -2.15508, 1, 1, 1, 1, 1,
-1.895329, 0.8908579, -1.460111, 1, 1, 1, 1, 1,
-1.881845, 0.04132488, -1.173696, 1, 1, 1, 1, 1,
-1.870907, 0.65658, 0.2378478, 1, 1, 1, 1, 1,
-1.83892, 1.160706, 0.316957, 1, 1, 1, 1, 1,
-1.831887, -1.683385, -1.422177, 1, 1, 1, 1, 1,
-1.826604, 0.1866104, -0.08494323, 0, 0, 1, 1, 1,
-1.81387, 1.167715, 0.1807416, 1, 0, 0, 1, 1,
-1.806268, 0.8001292, -1.058022, 1, 0, 0, 1, 1,
-1.803652, 0.1638919, -1.545635, 1, 0, 0, 1, 1,
-1.796369, -1.468929, -2.508618, 1, 0, 0, 1, 1,
-1.782966, -2.486134, -1.652851, 1, 0, 0, 1, 1,
-1.75619, 1.223884, -0.7257719, 0, 0, 0, 1, 1,
-1.742284, -1.367501, -3.243135, 0, 0, 0, 1, 1,
-1.732322, -0.03474034, -2.273907, 0, 0, 0, 1, 1,
-1.730203, 1.403967, -0.3800579, 0, 0, 0, 1, 1,
-1.728356, -0.627791, -1.47122, 0, 0, 0, 1, 1,
-1.724597, 1.399523, -0.3547844, 0, 0, 0, 1, 1,
-1.723647, -1.230095, -2.80459, 0, 0, 0, 1, 1,
-1.720792, -0.1179017, -0.6777226, 1, 1, 1, 1, 1,
-1.690922, 0.9549038, -1.312858, 1, 1, 1, 1, 1,
-1.667652, 1.260784, -1.351988, 1, 1, 1, 1, 1,
-1.664531, 1.25306, -0.1493057, 1, 1, 1, 1, 1,
-1.663013, 1.078152, -1.646738, 1, 1, 1, 1, 1,
-1.660372, 0.008079312, -2.677689, 1, 1, 1, 1, 1,
-1.644407, -0.6369686, -2.584659, 1, 1, 1, 1, 1,
-1.644277, -0.007778742, -1.790375, 1, 1, 1, 1, 1,
-1.632561, 0.3924098, -2.879393, 1, 1, 1, 1, 1,
-1.59681, 0.9807158, -0.8945037, 1, 1, 1, 1, 1,
-1.576573, -0.3846658, -1.184695, 1, 1, 1, 1, 1,
-1.574119, -1.767174, -2.892745, 1, 1, 1, 1, 1,
-1.573247, -0.1152095, -3.578285, 1, 1, 1, 1, 1,
-1.562557, 0.5059952, -0.6635411, 1, 1, 1, 1, 1,
-1.555739, -0.2239435, -0.9613218, 1, 1, 1, 1, 1,
-1.555214, 0.2379251, -1.876164, 0, 0, 1, 1, 1,
-1.551488, 0.9214438, -0.2099808, 1, 0, 0, 1, 1,
-1.541414, 0.4963205, -1.850878, 1, 0, 0, 1, 1,
-1.539838, 1.786179, -0.6995831, 1, 0, 0, 1, 1,
-1.533713, 0.3668894, -1.928084, 1, 0, 0, 1, 1,
-1.529568, -0.8487228, -1.952754, 1, 0, 0, 1, 1,
-1.524377, -0.2944684, -3.005316, 0, 0, 0, 1, 1,
-1.516965, -0.7640193, -0.1498904, 0, 0, 0, 1, 1,
-1.515411, 0.2278545, -1.879185, 0, 0, 0, 1, 1,
-1.514478, 0.5594417, -2.506339, 0, 0, 0, 1, 1,
-1.490914, -1.310228, -1.701213, 0, 0, 0, 1, 1,
-1.486901, -0.0443777, -2.528083, 0, 0, 0, 1, 1,
-1.48507, -0.8916062, -1.092321, 0, 0, 0, 1, 1,
-1.484412, 1.588744, 0.9549756, 1, 1, 1, 1, 1,
-1.474573, 0.8513542, -1.495151, 1, 1, 1, 1, 1,
-1.471506, 0.9342184, -0.6971418, 1, 1, 1, 1, 1,
-1.448675, -0.6436828, -4.926078, 1, 1, 1, 1, 1,
-1.444024, 0.6627054, -1.794018, 1, 1, 1, 1, 1,
-1.415792, 0.4620813, -1.450909, 1, 1, 1, 1, 1,
-1.414257, 0.5902265, -1.189809, 1, 1, 1, 1, 1,
-1.40594, 0.4993367, 0.01739911, 1, 1, 1, 1, 1,
-1.392612, -0.4241149, -2.188165, 1, 1, 1, 1, 1,
-1.385703, 0.09274809, -0.8795608, 1, 1, 1, 1, 1,
-1.384426, 0.4542629, -2.010345, 1, 1, 1, 1, 1,
-1.38265, -1.40661, -1.849414, 1, 1, 1, 1, 1,
-1.380333, -0.7985731, -3.133651, 1, 1, 1, 1, 1,
-1.380315, -0.942994, 0.05430786, 1, 1, 1, 1, 1,
-1.379517, -0.04853607, -2.273002, 1, 1, 1, 1, 1,
-1.375831, -0.7153768, -0.8056623, 0, 0, 1, 1, 1,
-1.372292, -0.2855489, -2.83031, 1, 0, 0, 1, 1,
-1.371254, -0.9819883, -1.20336, 1, 0, 0, 1, 1,
-1.365998, 0.8396559, -2.495847, 1, 0, 0, 1, 1,
-1.360362, -0.1915005, -1.383228, 1, 0, 0, 1, 1,
-1.359505, -0.3793549, -2.445339, 1, 0, 0, 1, 1,
-1.339056, 1.027269, -1.549436, 0, 0, 0, 1, 1,
-1.336107, 2.630675, -0.6067373, 0, 0, 0, 1, 1,
-1.330065, -1.912336, -4.932619, 0, 0, 0, 1, 1,
-1.326987, -1.405303, -0.4618852, 0, 0, 0, 1, 1,
-1.323227, -2.125905, -4.688897, 0, 0, 0, 1, 1,
-1.320032, -0.4591295, 0.4234816, 0, 0, 0, 1, 1,
-1.310137, -0.3047532, -1.912696, 0, 0, 0, 1, 1,
-1.307525, -1.983432, -1.180444, 1, 1, 1, 1, 1,
-1.300799, -1.136664, -1.441632, 1, 1, 1, 1, 1,
-1.297557, -0.09600567, -0.5461315, 1, 1, 1, 1, 1,
-1.284043, 0.9763322, -2.060634, 1, 1, 1, 1, 1,
-1.270806, 1.045078, 0.05042416, 1, 1, 1, 1, 1,
-1.264562, -1.2759, -4.729684, 1, 1, 1, 1, 1,
-1.263228, 0.2387317, 1.250011, 1, 1, 1, 1, 1,
-1.262424, 0.8966521, 0.6845224, 1, 1, 1, 1, 1,
-1.261584, -0.4955567, -2.433943, 1, 1, 1, 1, 1,
-1.246162, 0.3020777, -1.02519, 1, 1, 1, 1, 1,
-1.24472, -0.3605557, -1.621092, 1, 1, 1, 1, 1,
-1.241364, -0.5901439, -2.011406, 1, 1, 1, 1, 1,
-1.232105, -0.02873234, -4.208551, 1, 1, 1, 1, 1,
-1.231807, -0.1087399, -3.72336, 1, 1, 1, 1, 1,
-1.21781, -2.355196, -1.035401, 1, 1, 1, 1, 1,
-1.209229, 1.583651, 0.03346799, 0, 0, 1, 1, 1,
-1.206836, 0.5983139, 0.481725, 1, 0, 0, 1, 1,
-1.202246, -0.1486386, -2.1685, 1, 0, 0, 1, 1,
-1.198089, 1.261146, 0.001090333, 1, 0, 0, 1, 1,
-1.197467, 0.183462, -2.326738, 1, 0, 0, 1, 1,
-1.193586, -0.6597338, -2.388452, 1, 0, 0, 1, 1,
-1.193228, -0.5534166, -0.8133176, 0, 0, 0, 1, 1,
-1.190129, 2.487129, -0.7973845, 0, 0, 0, 1, 1,
-1.188478, 0.7479622, -0.2537168, 0, 0, 0, 1, 1,
-1.171243, 1.635921, -1.308414, 0, 0, 0, 1, 1,
-1.170302, -0.005939646, -1.40371, 0, 0, 0, 1, 1,
-1.162701, -0.3647853, -0.640956, 0, 0, 0, 1, 1,
-1.161439, 0.3308031, -0.2649902, 0, 0, 0, 1, 1,
-1.155012, 0.190023, -1.868948, 1, 1, 1, 1, 1,
-1.1471, -1.235967, -3.419173, 1, 1, 1, 1, 1,
-1.14676, -0.7147091, -2.674205, 1, 1, 1, 1, 1,
-1.141386, -0.8706496, -1.194421, 1, 1, 1, 1, 1,
-1.140284, 0.3860746, -2.142309, 1, 1, 1, 1, 1,
-1.136621, 0.6979122, -1.34726, 1, 1, 1, 1, 1,
-1.134608, 0.3172279, -0.1496903, 1, 1, 1, 1, 1,
-1.13416, -0.8782871, -2.396245, 1, 1, 1, 1, 1,
-1.130238, -1.239468, -2.055505, 1, 1, 1, 1, 1,
-1.130033, -0.4260745, -3.039187, 1, 1, 1, 1, 1,
-1.123201, -1.354797, -3.950591, 1, 1, 1, 1, 1,
-1.113157, 1.736847, -0.3196747, 1, 1, 1, 1, 1,
-1.111066, 1.147471, -2.401352, 1, 1, 1, 1, 1,
-1.11104, 1.11594, -0.3632664, 1, 1, 1, 1, 1,
-1.100032, -0.04614409, -0.7749149, 1, 1, 1, 1, 1,
-1.099219, -0.3815494, -2.101912, 0, 0, 1, 1, 1,
-1.0961, -1.529014, -2.151614, 1, 0, 0, 1, 1,
-1.0909, -0.2639118, -3.604137, 1, 0, 0, 1, 1,
-1.090177, 0.9754845, -0.5149802, 1, 0, 0, 1, 1,
-1.083199, -0.8032478, -2.846472, 1, 0, 0, 1, 1,
-1.082107, 1.148636, -0.6619977, 1, 0, 0, 1, 1,
-1.079885, 0.05174931, 0.4443431, 0, 0, 0, 1, 1,
-1.077945, -1.079018, -2.444809, 0, 0, 0, 1, 1,
-1.074311, 0.5918868, -2.450961, 0, 0, 0, 1, 1,
-1.072988, -0.7121658, -3.804013, 0, 0, 0, 1, 1,
-1.069341, -0.5496824, -1.398507, 0, 0, 0, 1, 1,
-1.067922, -0.03722624, -2.410505, 0, 0, 0, 1, 1,
-1.067861, 0.1722811, -0.7699826, 0, 0, 0, 1, 1,
-1.067583, -0.3555726, -1.26748, 1, 1, 1, 1, 1,
-1.061604, 1.322416, -0.281993, 1, 1, 1, 1, 1,
-1.052596, -0.3402178, -2.462534, 1, 1, 1, 1, 1,
-1.052336, -0.6056103, -2.126889, 1, 1, 1, 1, 1,
-1.051091, -1.180393, -1.576244, 1, 1, 1, 1, 1,
-1.047075, -0.1623185, -1.860732, 1, 1, 1, 1, 1,
-1.043995, 0.06685086, -2.489175, 1, 1, 1, 1, 1,
-1.034687, 0.6580479, -1.160469, 1, 1, 1, 1, 1,
-1.030784, 1.409061, 1.012023, 1, 1, 1, 1, 1,
-1.021471, -1.851955, -2.034952, 1, 1, 1, 1, 1,
-1.01671, -1.475109, -3.781262, 1, 1, 1, 1, 1,
-1.013159, -0.2033618, -1.63626, 1, 1, 1, 1, 1,
-1.009013, 0.9060965, 0.1946899, 1, 1, 1, 1, 1,
-1.007391, -1.179001, -1.194279, 1, 1, 1, 1, 1,
-1.005977, -1.044165, -2.529485, 1, 1, 1, 1, 1,
-1.005697, 1.485926, -0.8046175, 0, 0, 1, 1, 1,
-0.9965082, 1.135316, -0.6033782, 1, 0, 0, 1, 1,
-0.9898846, -1.682525, -2.745983, 1, 0, 0, 1, 1,
-0.9893706, 0.5786062, -1.385071, 1, 0, 0, 1, 1,
-0.9822223, 1.228956, -1.823022, 1, 0, 0, 1, 1,
-0.9781964, -0.1225192, -2.02314, 1, 0, 0, 1, 1,
-0.9661085, -1.113714, -4.221499, 0, 0, 0, 1, 1,
-0.9607398, 0.03316519, -3.495864, 0, 0, 0, 1, 1,
-0.9556616, -1.291287, -3.709125, 0, 0, 0, 1, 1,
-0.9507331, -0.3080881, -3.279857, 0, 0, 0, 1, 1,
-0.9465178, -1.047718, -3.092511, 0, 0, 0, 1, 1,
-0.9375322, -2.203409, -3.917315, 0, 0, 0, 1, 1,
-0.926276, 0.4606401, -0.2900226, 0, 0, 0, 1, 1,
-0.9261096, 0.964865, -2.250696, 1, 1, 1, 1, 1,
-0.9260944, 0.2092662, -1.172318, 1, 1, 1, 1, 1,
-0.9252864, 0.7343287, -0.5421676, 1, 1, 1, 1, 1,
-0.9212385, 0.08534124, -2.264578, 1, 1, 1, 1, 1,
-0.9183642, -1.614268, -1.169731, 1, 1, 1, 1, 1,
-0.9140973, -1.714862, -2.993468, 1, 1, 1, 1, 1,
-0.9131179, 1.128379, -1.020817, 1, 1, 1, 1, 1,
-0.9031423, 2.053353, 2.18589, 1, 1, 1, 1, 1,
-0.9015327, -0.6158169, -1.641578, 1, 1, 1, 1, 1,
-0.8955535, -1.363059, -2.481738, 1, 1, 1, 1, 1,
-0.891721, -0.8068537, -2.192674, 1, 1, 1, 1, 1,
-0.8911324, -0.01069779, -0.8878672, 1, 1, 1, 1, 1,
-0.8897045, -0.7943058, -1.968261, 1, 1, 1, 1, 1,
-0.8806524, 0.5982856, -0.465169, 1, 1, 1, 1, 1,
-0.8781185, 0.3184781, -0.1957046, 1, 1, 1, 1, 1,
-0.8744056, -0.5124854, -2.734221, 0, 0, 1, 1, 1,
-0.8722873, 1.008122, 0.02873182, 1, 0, 0, 1, 1,
-0.8667978, -0.6720105, -2.942903, 1, 0, 0, 1, 1,
-0.8665149, -0.2247996, -1.368719, 1, 0, 0, 1, 1,
-0.8644296, 0.3194631, -3.424282, 1, 0, 0, 1, 1,
-0.8638709, 0.2200251, 0.1604993, 1, 0, 0, 1, 1,
-0.8613347, -0.7945655, -1.679908, 0, 0, 0, 1, 1,
-0.858799, -0.1184094, -1.568761, 0, 0, 0, 1, 1,
-0.8533137, -0.5499851, -2.11587, 0, 0, 0, 1, 1,
-0.8508217, -1.092488, -3.664877, 0, 0, 0, 1, 1,
-0.849452, -0.4748997, -3.035675, 0, 0, 0, 1, 1,
-0.8491196, -1.212947, -1.965568, 0, 0, 0, 1, 1,
-0.846243, 1.772356, 0.1171029, 0, 0, 0, 1, 1,
-0.8452867, -1.141944, -4.765066, 1, 1, 1, 1, 1,
-0.8444894, -0.4208821, -0.8249063, 1, 1, 1, 1, 1,
-0.8441568, -1.017244, -1.978742, 1, 1, 1, 1, 1,
-0.8417506, -1.679977, -1.826167, 1, 1, 1, 1, 1,
-0.8342062, 0.3967814, -1.732752, 1, 1, 1, 1, 1,
-0.8304956, 1.759602, -0.1001724, 1, 1, 1, 1, 1,
-0.8281885, 0.2177398, -0.6001503, 1, 1, 1, 1, 1,
-0.8271751, 0.8576189, -2.115045, 1, 1, 1, 1, 1,
-0.8262764, 0.7140398, -1.285003, 1, 1, 1, 1, 1,
-0.821497, 1.534203, -0.9364873, 1, 1, 1, 1, 1,
-0.8098526, 1.210441, -1.140909, 1, 1, 1, 1, 1,
-0.8090832, -0.5183834, -0.7138052, 1, 1, 1, 1, 1,
-0.8064395, 0.1686151, -0.1955288, 1, 1, 1, 1, 1,
-0.805397, -0.6990719, -0.9212711, 1, 1, 1, 1, 1,
-0.8021771, -0.08141039, -0.8694761, 1, 1, 1, 1, 1,
-0.8013026, 0.374424, -1.58518, 0, 0, 1, 1, 1,
-0.7923458, 1.210465, -1.532526, 1, 0, 0, 1, 1,
-0.7857589, -0.3985308, -2.055486, 1, 0, 0, 1, 1,
-0.7847987, -1.162493, -0.308088, 1, 0, 0, 1, 1,
-0.7844105, 0.8521728, -1.975068, 1, 0, 0, 1, 1,
-0.7802061, -0.4870327, -2.834167, 1, 0, 0, 1, 1,
-0.7752147, 1.437993, -2.305296, 0, 0, 0, 1, 1,
-0.7728602, -0.08660561, -1.722943, 0, 0, 0, 1, 1,
-0.7709911, 0.6853126, -1.546621, 0, 0, 0, 1, 1,
-0.7644247, -0.7053508, -3.536603, 0, 0, 0, 1, 1,
-0.7600819, 1.223078, -2.324496, 0, 0, 0, 1, 1,
-0.7573421, -0.891194, -2.30783, 0, 0, 0, 1, 1,
-0.7434859, 0.3701738, -0.2014523, 0, 0, 0, 1, 1,
-0.7415001, 0.9547591, -0.1189023, 1, 1, 1, 1, 1,
-0.7407441, 0.7003489, -0.3107584, 1, 1, 1, 1, 1,
-0.7402822, 1.185417, -1.537835, 1, 1, 1, 1, 1,
-0.7385421, -1.052826, -2.809802, 1, 1, 1, 1, 1,
-0.7363513, -0.5198871, -2.466537, 1, 1, 1, 1, 1,
-0.7315779, 0.7905846, 0.6522918, 1, 1, 1, 1, 1,
-0.7303128, -0.2344922, -2.537606, 1, 1, 1, 1, 1,
-0.7282888, 0.3627836, -1.097577, 1, 1, 1, 1, 1,
-0.7272844, -0.8423707, -1.189826, 1, 1, 1, 1, 1,
-0.7248178, 1.536025, 0.1838788, 1, 1, 1, 1, 1,
-0.7239226, 0.4012238, -0.3665249, 1, 1, 1, 1, 1,
-0.7205192, -0.7762114, -3.80014, 1, 1, 1, 1, 1,
-0.7145364, 0.3515527, -1.628295, 1, 1, 1, 1, 1,
-0.7131608, 0.6319832, 0.5286078, 1, 1, 1, 1, 1,
-0.7072092, -0.9169746, -2.881178, 1, 1, 1, 1, 1,
-0.7042605, -0.9088059, -3.195303, 0, 0, 1, 1, 1,
-0.703499, 0.4550444, -1.505318, 1, 0, 0, 1, 1,
-0.7008737, -0.5261287, -1.880456, 1, 0, 0, 1, 1,
-0.700642, -0.4613309, -3.670635, 1, 0, 0, 1, 1,
-0.6981277, 0.3665706, -0.36803, 1, 0, 0, 1, 1,
-0.696375, -1.781783, -3.342229, 1, 0, 0, 1, 1,
-0.6947741, -1.000641, -1.048909, 0, 0, 0, 1, 1,
-0.6947216, 0.1982944, -2.49547, 0, 0, 0, 1, 1,
-0.6938195, 0.178572, -0.2528598, 0, 0, 0, 1, 1,
-0.6908002, 2.10509, 1.505933, 0, 0, 0, 1, 1,
-0.6889198, 1.433938, -0.1212061, 0, 0, 0, 1, 1,
-0.688884, 0.5222477, 0.1276758, 0, 0, 0, 1, 1,
-0.6879044, -0.0494824, -3.224286, 0, 0, 0, 1, 1,
-0.6716498, -0.7407044, -0.9080592, 1, 1, 1, 1, 1,
-0.6715089, -1.094, -1.661566, 1, 1, 1, 1, 1,
-0.6624961, -0.6090764, -2.094561, 1, 1, 1, 1, 1,
-0.6573787, -0.5669848, -1.760824, 1, 1, 1, 1, 1,
-0.6572544, 0.4777122, 1.542764, 1, 1, 1, 1, 1,
-0.6553345, 0.2042584, -0.2691672, 1, 1, 1, 1, 1,
-0.6489652, -1.158047, -2.172152, 1, 1, 1, 1, 1,
-0.636829, 2.028838, 0.2297711, 1, 1, 1, 1, 1,
-0.621084, -1.079173, -0.8283601, 1, 1, 1, 1, 1,
-0.6178719, 0.2389735, -0.8902614, 1, 1, 1, 1, 1,
-0.6161607, -0.8388045, -2.079794, 1, 1, 1, 1, 1,
-0.6156898, -0.8826113, -2.877126, 1, 1, 1, 1, 1,
-0.6089029, 0.3032477, -1.812151, 1, 1, 1, 1, 1,
-0.6073999, 0.5063031, -1.721431, 1, 1, 1, 1, 1,
-0.6060031, -0.05247541, -2.688471, 1, 1, 1, 1, 1,
-0.6023178, 0.2850156, -2.296775, 0, 0, 1, 1, 1,
-0.6018893, 1.584692, -0.5737213, 1, 0, 0, 1, 1,
-0.5949287, -0.6609442, -3.344865, 1, 0, 0, 1, 1,
-0.5923655, 2.069318, -0.1657885, 1, 0, 0, 1, 1,
-0.5846412, 0.3236393, -1.853173, 1, 0, 0, 1, 1,
-0.58006, -1.044073, -0.2850132, 1, 0, 0, 1, 1,
-0.5766569, 0.9292395, -1.194329, 0, 0, 0, 1, 1,
-0.5731368, -0.2154175, -1.248678, 0, 0, 0, 1, 1,
-0.5705417, 0.7188977, -1.166694, 0, 0, 0, 1, 1,
-0.5648476, 0.6484469, -0.594629, 0, 0, 0, 1, 1,
-0.5645953, -0.2783094, -1.08946, 0, 0, 0, 1, 1,
-0.5645275, 0.6503798, -1.198329, 0, 0, 0, 1, 1,
-0.5636846, 0.8358827, 1.586775, 0, 0, 0, 1, 1,
-0.5627124, -0.6760392, -3.479687, 1, 1, 1, 1, 1,
-0.5576447, -0.3229066, -1.080817, 1, 1, 1, 1, 1,
-0.5575637, 1.030208, -2.071335, 1, 1, 1, 1, 1,
-0.554379, -0.1927059, -0.8810136, 1, 1, 1, 1, 1,
-0.5528724, 0.2905234, 0.08058484, 1, 1, 1, 1, 1,
-0.5526254, -0.09947892, -2.493125, 1, 1, 1, 1, 1,
-0.5520005, 0.3429756, 0.6987281, 1, 1, 1, 1, 1,
-0.5486287, 0.4547547, -0.0432785, 1, 1, 1, 1, 1,
-0.547051, 0.8494025, 0.0821091, 1, 1, 1, 1, 1,
-0.545771, -1.29397, -2.360944, 1, 1, 1, 1, 1,
-0.5407317, -0.7034873, -2.571589, 1, 1, 1, 1, 1,
-0.5407137, -0.4925164, -1.342725, 1, 1, 1, 1, 1,
-0.5396719, 0.00481922, -1.084578, 1, 1, 1, 1, 1,
-0.5308393, 1.421098, -0.9030831, 1, 1, 1, 1, 1,
-0.5281744, -0.2920118, -1.512763, 1, 1, 1, 1, 1,
-0.524303, -2.333856, -1.939247, 0, 0, 1, 1, 1,
-0.5205947, -1.103107, -1.300479, 1, 0, 0, 1, 1,
-0.5196674, 0.7072604, -1.837137, 1, 0, 0, 1, 1,
-0.5167208, -0.4690561, -2.810145, 1, 0, 0, 1, 1,
-0.5097229, -1.063615, -3.730453, 1, 0, 0, 1, 1,
-0.5090091, 0.4062622, -1.812287, 1, 0, 0, 1, 1,
-0.5079072, -1.115783, -2.160013, 0, 0, 0, 1, 1,
-0.5066058, -2.412306, -3.12686, 0, 0, 0, 1, 1,
-0.5050547, 0.1326894, -0.1622912, 0, 0, 0, 1, 1,
-0.5049725, -0.8087651, -1.93796, 0, 0, 0, 1, 1,
-0.5021357, -1.235679, -3.442979, 0, 0, 0, 1, 1,
-0.4995477, -0.3300137, -3.332971, 0, 0, 0, 1, 1,
-0.4969757, 0.5407947, -0.2070507, 0, 0, 0, 1, 1,
-0.4866542, -1.191355, -1.394711, 1, 1, 1, 1, 1,
-0.4806165, 0.9273382, -1.018387, 1, 1, 1, 1, 1,
-0.4770042, -0.9265294, -2.281235, 1, 1, 1, 1, 1,
-0.4700849, -0.6972975, -2.12848, 1, 1, 1, 1, 1,
-0.4689313, -0.9933463, -3.162604, 1, 1, 1, 1, 1,
-0.4683246, 2.298593, -0.0002777082, 1, 1, 1, 1, 1,
-0.4672673, 1.166938, 0.1404574, 1, 1, 1, 1, 1,
-0.4651943, 0.5384334, -0.9391459, 1, 1, 1, 1, 1,
-0.4629081, -0.2702974, -1.106482, 1, 1, 1, 1, 1,
-0.4624599, -0.3694281, -3.114024, 1, 1, 1, 1, 1,
-0.4603423, -1.642366, -2.5698, 1, 1, 1, 1, 1,
-0.4571532, -0.6193975, -2.841356, 1, 1, 1, 1, 1,
-0.4570027, 0.1573482, -1.679374, 1, 1, 1, 1, 1,
-0.4523853, 1.0277, -0.549023, 1, 1, 1, 1, 1,
-0.4485783, 0.8016436, -0.2579297, 1, 1, 1, 1, 1,
-0.4471931, 0.273189, -0.7060727, 0, 0, 1, 1, 1,
-0.4414322, 0.8540031, -1.702073, 1, 0, 0, 1, 1,
-0.4394872, 1.983742, -0.6060053, 1, 0, 0, 1, 1,
-0.4391075, 0.9711921, -3.249285, 1, 0, 0, 1, 1,
-0.438676, -0.3457028, -0.301209, 1, 0, 0, 1, 1,
-0.4382458, 0.5822408, -0.02417595, 1, 0, 0, 1, 1,
-0.4354365, -0.3200265, -0.4110734, 0, 0, 0, 1, 1,
-0.4292505, -0.05130008, -2.610247, 0, 0, 0, 1, 1,
-0.4290002, -0.8278537, -2.224281, 0, 0, 0, 1, 1,
-0.4185748, -0.1593664, -2.856005, 0, 0, 0, 1, 1,
-0.4185186, 0.8618723, 1.89048, 0, 0, 0, 1, 1,
-0.4104013, -0.2373997, -1.754269, 0, 0, 0, 1, 1,
-0.4102931, -0.6933077, -2.523075, 0, 0, 0, 1, 1,
-0.4092639, -0.182838, -3.168823, 1, 1, 1, 1, 1,
-0.4090392, -1.621752, -4.85169, 1, 1, 1, 1, 1,
-0.4069519, 1.564915, 0.7881069, 1, 1, 1, 1, 1,
-0.4066425, 0.6501349, 0.3685227, 1, 1, 1, 1, 1,
-0.4010528, -0.1392632, -2.303347, 1, 1, 1, 1, 1,
-0.3986884, 1.67214, -0.1196266, 1, 1, 1, 1, 1,
-0.3966363, -1.000298, -3.016824, 1, 1, 1, 1, 1,
-0.3960471, 0.1211942, -0.2293635, 1, 1, 1, 1, 1,
-0.3946303, 1.949389, 1.187312, 1, 1, 1, 1, 1,
-0.3943095, -1.039161, -0.6149023, 1, 1, 1, 1, 1,
-0.3937866, 2.698207, 0.9095151, 1, 1, 1, 1, 1,
-0.3931455, -0.2869357, -3.658489, 1, 1, 1, 1, 1,
-0.3897923, -1.417959, -2.827118, 1, 1, 1, 1, 1,
-0.3887199, 0.4636634, 1.13847, 1, 1, 1, 1, 1,
-0.3833822, -1.385586, -4.496026, 1, 1, 1, 1, 1,
-0.3826232, -0.211627, -0.6067207, 0, 0, 1, 1, 1,
-0.3812543, 0.1425609, -4.556969, 1, 0, 0, 1, 1,
-0.3794313, 0.906258, -2.574143, 1, 0, 0, 1, 1,
-0.3782773, -0.8504858, -1.441198, 1, 0, 0, 1, 1,
-0.368695, 0.1415679, -1.2399, 1, 0, 0, 1, 1,
-0.3622456, 1.536098, -1.283604, 1, 0, 0, 1, 1,
-0.3606198, 0.8704766, 0.1432586, 0, 0, 0, 1, 1,
-0.3536286, -0.7400072, -1.265608, 0, 0, 0, 1, 1,
-0.351812, 0.6370857, 0.3600656, 0, 0, 0, 1, 1,
-0.3462036, 0.7022091, -0.08740572, 0, 0, 0, 1, 1,
-0.3459604, 0.08865026, -1.692363, 0, 0, 0, 1, 1,
-0.3457916, 0.03009977, 0.01492054, 0, 0, 0, 1, 1,
-0.3442666, 1.611591, 0.1298306, 0, 0, 0, 1, 1,
-0.3440822, -0.04714619, -1.418234, 1, 1, 1, 1, 1,
-0.3432584, -0.7424498, -4.339065, 1, 1, 1, 1, 1,
-0.343206, -1.301182, -2.653242, 1, 1, 1, 1, 1,
-0.3418164, 2.652284, -2.503464, 1, 1, 1, 1, 1,
-0.3400968, 0.5584008, -0.5613943, 1, 1, 1, 1, 1,
-0.3381536, 0.2657386, -0.08647574, 1, 1, 1, 1, 1,
-0.3374506, 0.5261616, 0.67388, 1, 1, 1, 1, 1,
-0.3355804, 0.9772757, 3.10664, 1, 1, 1, 1, 1,
-0.3346896, 0.7799155, -0.2272158, 1, 1, 1, 1, 1,
-0.326497, 0.5076019, -1.337847, 1, 1, 1, 1, 1,
-0.3239371, 0.626938, -0.02617252, 1, 1, 1, 1, 1,
-0.3217962, -2.453365, -3.778702, 1, 1, 1, 1, 1,
-0.3180612, 0.2668895, 0.3378715, 1, 1, 1, 1, 1,
-0.316245, -0.3283352, -2.732684, 1, 1, 1, 1, 1,
-0.3161277, 0.9246829, -0.4544385, 1, 1, 1, 1, 1,
-0.3140593, 1.504721, 0.8721824, 0, 0, 1, 1, 1,
-0.3049664, 1.175843, -0.666898, 1, 0, 0, 1, 1,
-0.2978004, 0.5088509, -1.190074, 1, 0, 0, 1, 1,
-0.2967507, 0.0763819, -1.450799, 1, 0, 0, 1, 1,
-0.296125, 0.4275171, -1.310935, 1, 0, 0, 1, 1,
-0.2942182, 0.02946449, -2.156113, 1, 0, 0, 1, 1,
-0.2914969, -0.1280237, -2.543433, 0, 0, 0, 1, 1,
-0.2887794, 0.7731967, -0.8869891, 0, 0, 0, 1, 1,
-0.2856624, -0.281561, -1.798871, 0, 0, 0, 1, 1,
-0.2829787, 0.1804616, -0.2522771, 0, 0, 0, 1, 1,
-0.2787586, -0.8096619, -3.159417, 0, 0, 0, 1, 1,
-0.2747993, 0.4387059, 0.5934381, 0, 0, 0, 1, 1,
-0.2739213, 1.128367, -1.084849, 0, 0, 0, 1, 1,
-0.2724739, -1.801478, -1.553678, 1, 1, 1, 1, 1,
-0.2671259, 0.04669707, -0.09262379, 1, 1, 1, 1, 1,
-0.2670319, 0.26087, -0.7653115, 1, 1, 1, 1, 1,
-0.2609099, 0.6820026, 0.6340241, 1, 1, 1, 1, 1,
-0.2570721, 0.3413945, -0.1883495, 1, 1, 1, 1, 1,
-0.2463773, 0.654407, 1.08194, 1, 1, 1, 1, 1,
-0.2422262, -0.218982, -3.766238, 1, 1, 1, 1, 1,
-0.2409332, -0.9165758, -2.872457, 1, 1, 1, 1, 1,
-0.2386657, -0.1830556, -2.782279, 1, 1, 1, 1, 1,
-0.2382898, -2.163543, -1.941603, 1, 1, 1, 1, 1,
-0.2326891, -0.3250208, -2.661424, 1, 1, 1, 1, 1,
-0.231288, 0.668534, -0.8354474, 1, 1, 1, 1, 1,
-0.2291403, -0.690684, -0.3926229, 1, 1, 1, 1, 1,
-0.2225612, -0.9960526, -4.019718, 1, 1, 1, 1, 1,
-0.2205166, -0.2478219, -1.743832, 1, 1, 1, 1, 1,
-0.2197744, -0.9128939, -2.19106, 0, 0, 1, 1, 1,
-0.2193055, -0.694007, -2.253976, 1, 0, 0, 1, 1,
-0.2141233, 0.5119804, -1.069149, 1, 0, 0, 1, 1,
-0.2088219, 0.3500267, -0.2996013, 1, 0, 0, 1, 1,
-0.2084894, -0.6354759, -5.050624, 1, 0, 0, 1, 1,
-0.2021314, 1.345303, -1.557314, 1, 0, 0, 1, 1,
-0.1997788, 0.7979324, -0.3485768, 0, 0, 0, 1, 1,
-0.1989285, -0.7487164, -1.534303, 0, 0, 0, 1, 1,
-0.1984914, 0.1494748, -2.007435, 0, 0, 0, 1, 1,
-0.1957386, 0.5633664, -1.16498, 0, 0, 0, 1, 1,
-0.1886494, 1.017454, 0.5920704, 0, 0, 0, 1, 1,
-0.1875506, -0.6893072, -1.474953, 0, 0, 0, 1, 1,
-0.1869847, 0.5974056, 0.8848737, 0, 0, 0, 1, 1,
-0.1858487, -0.5897001, -2.941401, 1, 1, 1, 1, 1,
-0.1838815, 0.002641136, -0.0893626, 1, 1, 1, 1, 1,
-0.1833206, 0.8556173, 1.558325, 1, 1, 1, 1, 1,
-0.1825681, -1.322389, -4.07533, 1, 1, 1, 1, 1,
-0.1794079, -0.3042657, -1.434215, 1, 1, 1, 1, 1,
-0.1792849, -0.3716086, -2.718416, 1, 1, 1, 1, 1,
-0.1702042, 0.05384415, -1.194719, 1, 1, 1, 1, 1,
-0.1682534, 2.024404, 0.5288351, 1, 1, 1, 1, 1,
-0.1668802, -0.1168406, -0.1827406, 1, 1, 1, 1, 1,
-0.166492, -0.9134577, 0.410626, 1, 1, 1, 1, 1,
-0.1653582, 0.6357959, 0.9074519, 1, 1, 1, 1, 1,
-0.1647923, -0.665861, -3.556298, 1, 1, 1, 1, 1,
-0.1619153, 0.7292842, -0.6361819, 1, 1, 1, 1, 1,
-0.1543059, 0.1663923, -2.410149, 1, 1, 1, 1, 1,
-0.1524369, -0.06900433, -1.62509, 1, 1, 1, 1, 1,
-0.1514613, -0.235238, -3.651305, 0, 0, 1, 1, 1,
-0.1487111, -0.2686036, -2.173043, 1, 0, 0, 1, 1,
-0.1424005, 0.7157488, -0.243231, 1, 0, 0, 1, 1,
-0.1379825, -0.4342037, -3.149079, 1, 0, 0, 1, 1,
-0.1352569, -1.521244, -4.320868, 1, 0, 0, 1, 1,
-0.134521, 0.1454987, -0.966059, 1, 0, 0, 1, 1,
-0.1273049, -0.1517091, -1.945319, 0, 0, 0, 1, 1,
-0.1247494, -1.168895, -3.839241, 0, 0, 0, 1, 1,
-0.1241599, 0.4178477, 0.8968104, 0, 0, 0, 1, 1,
-0.1237191, -0.6795943, -3.672936, 0, 0, 0, 1, 1,
-0.1172025, -0.07359906, -1.562847, 0, 0, 0, 1, 1,
-0.1171843, 0.3482815, 0.5096981, 0, 0, 0, 1, 1,
-0.1090187, 1.487839, 0.6867075, 0, 0, 0, 1, 1,
-0.1065274, 0.2026715, 0.6636909, 1, 1, 1, 1, 1,
-0.1050411, 0.7539204, -0.5298826, 1, 1, 1, 1, 1,
-0.1024261, -0.3649262, -4.641212, 1, 1, 1, 1, 1,
-0.09981237, -0.8276705, -2.306644, 1, 1, 1, 1, 1,
-0.0906534, -1.088066, -2.614336, 1, 1, 1, 1, 1,
-0.08857647, 1.059404, 0.4979272, 1, 1, 1, 1, 1,
-0.08487752, -0.7558403, -3.06582, 1, 1, 1, 1, 1,
-0.07763325, -1.894531, -3.309071, 1, 1, 1, 1, 1,
-0.07136843, 0.2617716, -1.30117, 1, 1, 1, 1, 1,
-0.06308451, 1.08848, -0.7104291, 1, 1, 1, 1, 1,
-0.05937654, -0.6106762, -3.724508, 1, 1, 1, 1, 1,
-0.05828642, 1.167467, -1.743646, 1, 1, 1, 1, 1,
-0.04914973, 0.3929567, 1.39478, 1, 1, 1, 1, 1,
-0.04887084, -0.445702, -2.180522, 1, 1, 1, 1, 1,
-0.0473451, -0.378594, -2.193071, 1, 1, 1, 1, 1,
-0.04689785, 1.14456, 1.113461, 0, 0, 1, 1, 1,
-0.04568204, -0.6004405, -4.246233, 1, 0, 0, 1, 1,
-0.04454078, 0.1771453, -1.578783, 1, 0, 0, 1, 1,
-0.04428413, 0.5772832, -1.102631, 1, 0, 0, 1, 1,
-0.03842579, 0.6821922, -0.7166875, 1, 0, 0, 1, 1,
-0.03728037, -0.664577, -4.561632, 1, 0, 0, 1, 1,
-0.03663092, -0.01845763, -1.965806, 0, 0, 0, 1, 1,
-0.03099757, 1.153025, -1.242185, 0, 0, 0, 1, 1,
-0.02484409, 0.5738689, 1.311188, 0, 0, 0, 1, 1,
-0.02376779, -2.565419, -3.030851, 0, 0, 0, 1, 1,
-0.02187736, 0.2769022, -0.6137567, 0, 0, 0, 1, 1,
-0.02099174, 1.277297, 0.04031614, 0, 0, 0, 1, 1,
-0.01930914, -2.78052, -2.43509, 0, 0, 0, 1, 1,
-0.0109934, -2.036165, -1.704972, 1, 1, 1, 1, 1,
-0.01065393, -1.387852, -4.759848, 1, 1, 1, 1, 1,
-0.007552685, -0.01270812, -1.617632, 1, 1, 1, 1, 1,
-0.007047396, -1.229409, -2.848652, 1, 1, 1, 1, 1,
-0.004920871, 1.957438, -0.7735103, 1, 1, 1, 1, 1,
-0.003058686, -0.6393332, -1.132915, 1, 1, 1, 1, 1,
-0.0008757751, 0.5874041, 0.125881, 1, 1, 1, 1, 1,
0.000355297, 1.096501, 0.1662332, 1, 1, 1, 1, 1,
0.002718279, 0.8518686, 0.2228105, 1, 1, 1, 1, 1,
0.008795564, -1.172803, 4.201406, 1, 1, 1, 1, 1,
0.009456437, -1.133603, 2.876969, 1, 1, 1, 1, 1,
0.0108965, 0.1027101, 0.6023273, 1, 1, 1, 1, 1,
0.01108645, 1.382761, -0.1449164, 1, 1, 1, 1, 1,
0.01133447, -0.9287387, 4.5889, 1, 1, 1, 1, 1,
0.01214554, 2.164642, 0.9772176, 1, 1, 1, 1, 1,
0.0151563, -0.2187986, 2.845536, 0, 0, 1, 1, 1,
0.01750988, 1.811014, 1.535941, 1, 0, 0, 1, 1,
0.01803624, 0.1388406, 0.264645, 1, 0, 0, 1, 1,
0.01879635, -0.5092685, 3.889352, 1, 0, 0, 1, 1,
0.02054925, -0.05106421, 3.243147, 1, 0, 0, 1, 1,
0.02175179, -0.7778062, 4.323715, 1, 0, 0, 1, 1,
0.02257046, 0.1650426, -1.368263, 0, 0, 0, 1, 1,
0.02395347, 0.1249115, 0.9989808, 0, 0, 0, 1, 1,
0.02502204, -0.6398708, 5.926401, 0, 0, 0, 1, 1,
0.03198354, -1.13333, 1.424828, 0, 0, 0, 1, 1,
0.03411429, 0.3232411, 1.459718, 0, 0, 0, 1, 1,
0.03432139, 1.075102, 0.03717071, 0, 0, 0, 1, 1,
0.03840916, -0.8199935, 2.741271, 0, 0, 0, 1, 1,
0.04340389, 0.04690648, -0.3863229, 1, 1, 1, 1, 1,
0.04733175, -0.007929648, 4.008342, 1, 1, 1, 1, 1,
0.04999925, 0.1625734, 0.4433928, 1, 1, 1, 1, 1,
0.05161407, -0.4980069, 3.475152, 1, 1, 1, 1, 1,
0.05453992, 0.782638, 0.2213599, 1, 1, 1, 1, 1,
0.05749457, 2.93254, 2.366379, 1, 1, 1, 1, 1,
0.05770736, 0.2706277, 0.9286142, 1, 1, 1, 1, 1,
0.05977489, 0.1116261, 1.217873, 1, 1, 1, 1, 1,
0.06040755, 1.359399, -1.232523, 1, 1, 1, 1, 1,
0.0605766, -0.5116463, 3.546236, 1, 1, 1, 1, 1,
0.06185776, 0.2194125, -1.075034, 1, 1, 1, 1, 1,
0.063827, -0.5045062, 2.374566, 1, 1, 1, 1, 1,
0.06962405, 0.5924666, -1.354476, 1, 1, 1, 1, 1,
0.07313131, 2.401305, 1.747472, 1, 1, 1, 1, 1,
0.07439465, 1.572587, -0.642967, 1, 1, 1, 1, 1,
0.08636706, 0.1543808, -0.513032, 0, 0, 1, 1, 1,
0.08783373, -0.2186005, 3.303444, 1, 0, 0, 1, 1,
0.09364433, 0.2888092, 2.393139, 1, 0, 0, 1, 1,
0.09600279, -0.2608582, 0.4674414, 1, 0, 0, 1, 1,
0.09704434, 0.4801957, -0.1688911, 1, 0, 0, 1, 1,
0.09974729, -0.0785252, 2.230778, 1, 0, 0, 1, 1,
0.101038, 0.8930453, -0.1801918, 0, 0, 0, 1, 1,
0.1070283, 0.4695016, 0.1021125, 0, 0, 0, 1, 1,
0.1072318, -0.6328641, 2.596166, 0, 0, 0, 1, 1,
0.1091519, 0.1748071, -0.1444835, 0, 0, 0, 1, 1,
0.1113087, -0.01239905, 2.102811, 0, 0, 0, 1, 1,
0.1123898, 0.9849707, -0.7252786, 0, 0, 0, 1, 1,
0.1143382, -0.5663419, 3.118626, 0, 0, 0, 1, 1,
0.1178543, 0.9186952, -0.2290731, 1, 1, 1, 1, 1,
0.1210384, 1.036512, 0.5994027, 1, 1, 1, 1, 1,
0.1216601, 0.7094142, 2.100039, 1, 1, 1, 1, 1,
0.1219806, 0.04080304, 0.8300664, 1, 1, 1, 1, 1,
0.1243211, 2.081073, -1.084267, 1, 1, 1, 1, 1,
0.12606, -0.7344148, 2.9708, 1, 1, 1, 1, 1,
0.1309635, 1.559425, 1.036924, 1, 1, 1, 1, 1,
0.1325037, -0.426054, 3.130142, 1, 1, 1, 1, 1,
0.1332249, -0.5509908, 2.992018, 1, 1, 1, 1, 1,
0.1366908, 0.1009501, -0.9955856, 1, 1, 1, 1, 1,
0.1375602, 0.252557, -0.08877763, 1, 1, 1, 1, 1,
0.1380731, 1.159379, -0.1965689, 1, 1, 1, 1, 1,
0.1466205, 0.5410694, -1.03241, 1, 1, 1, 1, 1,
0.1486625, 0.5386198, 2.695151, 1, 1, 1, 1, 1,
0.1495802, 0.3898998, 0.05623638, 1, 1, 1, 1, 1,
0.1533599, -0.2486016, 3.966013, 0, 0, 1, 1, 1,
0.1547334, 0.9303945, 0.7407454, 1, 0, 0, 1, 1,
0.1561076, -0.572199, 2.768471, 1, 0, 0, 1, 1,
0.1566325, 0.0780312, 1.003986, 1, 0, 0, 1, 1,
0.1612863, 0.443774, 0.3665779, 1, 0, 0, 1, 1,
0.1628815, 0.3790272, -0.759841, 1, 0, 0, 1, 1,
0.1686231, -0.1015717, 0.898111, 0, 0, 0, 1, 1,
0.1700232, -0.6716036, 3.653171, 0, 0, 0, 1, 1,
0.1745859, -0.4034034, 2.145664, 0, 0, 0, 1, 1,
0.176, -0.7113277, 4.094676, 0, 0, 0, 1, 1,
0.1760317, 0.4984175, 0.9643926, 0, 0, 0, 1, 1,
0.1794407, 0.7557494, -0.516548, 0, 0, 0, 1, 1,
0.1806742, 0.3982821, 0.8709939, 0, 0, 0, 1, 1,
0.1828453, 0.5618993, -0.1235925, 1, 1, 1, 1, 1,
0.184029, 1.09817, 1.954108, 1, 1, 1, 1, 1,
0.1913767, 0.01998171, 0.1453294, 1, 1, 1, 1, 1,
0.1963146, 0.2112873, -0.5459294, 1, 1, 1, 1, 1,
0.1987139, 0.4973561, 0.9508078, 1, 1, 1, 1, 1,
0.1990469, 0.05641617, 1.724649, 1, 1, 1, 1, 1,
0.2028912, 0.5957239, 1.088023, 1, 1, 1, 1, 1,
0.2035647, -1.266221, 3.572323, 1, 1, 1, 1, 1,
0.2159122, 3.344793, 0.2264237, 1, 1, 1, 1, 1,
0.2161899, -0.1360585, 1.759899, 1, 1, 1, 1, 1,
0.2178906, 1.898663, -0.888708, 1, 1, 1, 1, 1,
0.2212961, -0.2237718, 1.9958, 1, 1, 1, 1, 1,
0.2224736, 0.9225438, 1.964031, 1, 1, 1, 1, 1,
0.2274701, -2.447721, 3.838061, 1, 1, 1, 1, 1,
0.22892, -0.03422961, 3.005039, 1, 1, 1, 1, 1,
0.2323793, -0.3770686, 1.394866, 0, 0, 1, 1, 1,
0.2356576, 1.601427, 0.722946, 1, 0, 0, 1, 1,
0.23592, 0.2586837, 1.551435, 1, 0, 0, 1, 1,
0.2398888, 1.578059, -0.965166, 1, 0, 0, 1, 1,
0.2400504, 0.1078676, 0.1807591, 1, 0, 0, 1, 1,
0.2471283, -0.1454221, 4.519574, 1, 0, 0, 1, 1,
0.2530177, -0.3236584, 3.155765, 0, 0, 0, 1, 1,
0.2548555, -0.02455609, 0.8226555, 0, 0, 0, 1, 1,
0.2578698, -0.1466977, 2.042915, 0, 0, 0, 1, 1,
0.2595418, 0.7567763, 0.7663268, 0, 0, 0, 1, 1,
0.2611264, -0.8738906, 1.845374, 0, 0, 0, 1, 1,
0.26516, 0.3006766, -0.5047863, 0, 0, 0, 1, 1,
0.2672727, -1.580091, 1.459323, 0, 0, 0, 1, 1,
0.26871, -0.3850782, 2.749347, 1, 1, 1, 1, 1,
0.2688105, 0.6009768, 1.394554, 1, 1, 1, 1, 1,
0.2689235, 0.4869342, -0.02152736, 1, 1, 1, 1, 1,
0.2711456, -1.625796, 3.76448, 1, 1, 1, 1, 1,
0.2780488, -0.3644289, 3.406709, 1, 1, 1, 1, 1,
0.2781663, -0.8574991, 2.947355, 1, 1, 1, 1, 1,
0.2783357, -0.8997836, 2.867174, 1, 1, 1, 1, 1,
0.2837474, -0.5661644, 2.355122, 1, 1, 1, 1, 1,
0.2866593, 0.1010315, 0.9856483, 1, 1, 1, 1, 1,
0.2884878, -1.115514, 3.840972, 1, 1, 1, 1, 1,
0.2886314, 1.001056, -1.492278, 1, 1, 1, 1, 1,
0.2926457, -0.05343401, 2.66757, 1, 1, 1, 1, 1,
0.2948616, -1.43531, 2.871422, 1, 1, 1, 1, 1,
0.2949131, 0.9266661, 0.679658, 1, 1, 1, 1, 1,
0.300712, 1.434553, -0.3919961, 1, 1, 1, 1, 1,
0.3015322, 0.8964478, -0.01313094, 0, 0, 1, 1, 1,
0.3066913, 1.321124, -0.9722199, 1, 0, 0, 1, 1,
0.3119681, 0.2573273, -0.07962225, 1, 0, 0, 1, 1,
0.3164512, -2.261359, 3.413626, 1, 0, 0, 1, 1,
0.3175796, 1.673204, 0.8282323, 1, 0, 0, 1, 1,
0.3194483, 1.298888, 0.0933505, 1, 0, 0, 1, 1,
0.3228684, 2.06324, 0.8314211, 0, 0, 0, 1, 1,
0.3232449, 0.2069268, -1.591743, 0, 0, 0, 1, 1,
0.3243146, 1.024006, 0.608128, 0, 0, 0, 1, 1,
0.3261756, -1.117437, 2.456551, 0, 0, 0, 1, 1,
0.3281894, -0.6424451, 3.840563, 0, 0, 0, 1, 1,
0.3282241, -0.2759772, 1.802394, 0, 0, 0, 1, 1,
0.3332599, 1.817295, 0.909309, 0, 0, 0, 1, 1,
0.3354728, -2.323559, 2.863266, 1, 1, 1, 1, 1,
0.3366903, 1.958345, 0.6290171, 1, 1, 1, 1, 1,
0.3384151, -1.087883, 1.768348, 1, 1, 1, 1, 1,
0.3433729, -0.5565003, 2.009948, 1, 1, 1, 1, 1,
0.3442758, -0.05124118, 2.986389, 1, 1, 1, 1, 1,
0.3477842, 0.176158, 1.758853, 1, 1, 1, 1, 1,
0.3483256, 0.3237574, 0.8810159, 1, 1, 1, 1, 1,
0.3483758, -0.8493696, 4.257482, 1, 1, 1, 1, 1,
0.3521727, -2.043699, 1.791841, 1, 1, 1, 1, 1,
0.3533128, 0.02153882, 2.837682, 1, 1, 1, 1, 1,
0.3533196, 0.7796466, 2.161101, 1, 1, 1, 1, 1,
0.3593897, -0.4740019, 2.138989, 1, 1, 1, 1, 1,
0.3602244, -0.5679252, 2.464684, 1, 1, 1, 1, 1,
0.3602425, 0.7511671, -0.7243248, 1, 1, 1, 1, 1,
0.360739, -1.782575, 3.250835, 1, 1, 1, 1, 1,
0.3615977, 1.135024, 2.008752, 0, 0, 1, 1, 1,
0.3635542, 0.2585411, 0.6737808, 1, 0, 0, 1, 1,
0.3639335, -0.2527905, 3.243073, 1, 0, 0, 1, 1,
0.3660277, 1.533901, -0.1731968, 1, 0, 0, 1, 1,
0.3718845, 0.4557279, -0.9570347, 1, 0, 0, 1, 1,
0.3734164, 1.048621, -0.2953734, 1, 0, 0, 1, 1,
0.3760383, -0.380432, 3.083977, 0, 0, 0, 1, 1,
0.3789207, -1.267202, 1.257665, 0, 0, 0, 1, 1,
0.3805863, -0.8319132, 2.887503, 0, 0, 0, 1, 1,
0.3821849, 1.267221, -1.721805, 0, 0, 0, 1, 1,
0.387179, -0.4531246, 2.177098, 0, 0, 0, 1, 1,
0.3876646, -0.3555359, 3.466537, 0, 0, 0, 1, 1,
0.3887053, 0.3670609, 0.2512952, 0, 0, 0, 1, 1,
0.3887463, 1.084925, 2.242574, 1, 1, 1, 1, 1,
0.3887565, -0.641466, 2.757219, 1, 1, 1, 1, 1,
0.3905176, 0.05817747, 1.252876, 1, 1, 1, 1, 1,
0.3974414, -0.7604919, 3.305973, 1, 1, 1, 1, 1,
0.3975601, -1.576782, 1.100788, 1, 1, 1, 1, 1,
0.4063468, 0.1659991, 2.349082, 1, 1, 1, 1, 1,
0.4132085, 1.813936, -0.5820482, 1, 1, 1, 1, 1,
0.4152318, 1.216112, 0.8895165, 1, 1, 1, 1, 1,
0.4210974, -1.853256, 2.722124, 1, 1, 1, 1, 1,
0.4252529, 0.3627547, 0.8441287, 1, 1, 1, 1, 1,
0.4255329, 2.022133, -1.098371, 1, 1, 1, 1, 1,
0.4258665, 0.2576813, 1.139563, 1, 1, 1, 1, 1,
0.4261795, 0.6527818, -1.297853, 1, 1, 1, 1, 1,
0.4269403, -1.184049, 2.170702, 1, 1, 1, 1, 1,
0.4273018, -0.4677191, 2.799053, 1, 1, 1, 1, 1,
0.4277506, 1.181926, 0.779784, 0, 0, 1, 1, 1,
0.42808, -0.1726447, 2.38248, 1, 0, 0, 1, 1,
0.4302998, 1.179811, 1.823518, 1, 0, 0, 1, 1,
0.4322313, 0.8506863, 0.1254641, 1, 0, 0, 1, 1,
0.4359132, 0.165792, 2.782097, 1, 0, 0, 1, 1,
0.4395898, -0.3009953, 0.6830138, 1, 0, 0, 1, 1,
0.4483784, -0.7386476, 3.705459, 0, 0, 0, 1, 1,
0.449349, -0.2419431, 1.862619, 0, 0, 0, 1, 1,
0.4506392, 0.07297553, 0.2132802, 0, 0, 0, 1, 1,
0.451551, 0.08892624, 0.4618474, 0, 0, 0, 1, 1,
0.452558, 0.2797076, 0.6221718, 0, 0, 0, 1, 1,
0.4570366, 0.7019091, 1.975202, 0, 0, 0, 1, 1,
0.4577117, 1.176769, 1.123923, 0, 0, 0, 1, 1,
0.46477, -0.8398319, 2.67765, 1, 1, 1, 1, 1,
0.467388, -0.7980897, 3.11632, 1, 1, 1, 1, 1,
0.470375, -1.580256, 4.065506, 1, 1, 1, 1, 1,
0.4768116, 0.8137013, -0.182069, 1, 1, 1, 1, 1,
0.4776597, -2.112361, 4.042808, 1, 1, 1, 1, 1,
0.4811335, -0.1319934, 2.683943, 1, 1, 1, 1, 1,
0.4871378, -0.6852862, 3.443269, 1, 1, 1, 1, 1,
0.4881335, -0.7065535, 3.016945, 1, 1, 1, 1, 1,
0.4944188, -0.7826838, 1.465438, 1, 1, 1, 1, 1,
0.4992655, -1.301521, 2.198527, 1, 1, 1, 1, 1,
0.4994146, -0.130642, 0.9912378, 1, 1, 1, 1, 1,
0.5008911, -0.6649072, 3.013909, 1, 1, 1, 1, 1,
0.5069206, -1.39876, 2.402374, 1, 1, 1, 1, 1,
0.5106905, -0.3609535, 1.803784, 1, 1, 1, 1, 1,
0.5111018, 1.456159, -0.09808473, 1, 1, 1, 1, 1,
0.5118424, -1.463041, 3.194864, 0, 0, 1, 1, 1,
0.513971, 0.4925106, 1.568804, 1, 0, 0, 1, 1,
0.5150333, 0.9214494, -0.7754017, 1, 0, 0, 1, 1,
0.5152377, 0.6982357, -0.1701893, 1, 0, 0, 1, 1,
0.5175333, -0.4911144, 2.042593, 1, 0, 0, 1, 1,
0.5180723, -0.5819996, 2.488707, 1, 0, 0, 1, 1,
0.5188348, 0.3839945, 0.5146337, 0, 0, 0, 1, 1,
0.5198187, -1.78009, 2.088362, 0, 0, 0, 1, 1,
0.5219327, 0.4066566, 2.143563, 0, 0, 0, 1, 1,
0.5252728, 0.2329846, -0.06584781, 0, 0, 0, 1, 1,
0.5263741, 1.182358, -0.1992751, 0, 0, 0, 1, 1,
0.5267309, -0.5150124, 3.18158, 0, 0, 0, 1, 1,
0.5276581, 0.4479874, 2.179679, 0, 0, 0, 1, 1,
0.5303871, 1.211374, 0.3087697, 1, 1, 1, 1, 1,
0.5307436, -0.1613926, 3.483427, 1, 1, 1, 1, 1,
0.5318735, -1.460327, 3.106667, 1, 1, 1, 1, 1,
0.5349468, 0.6351522, 0.2176693, 1, 1, 1, 1, 1,
0.5378342, -1.653774, 2.166308, 1, 1, 1, 1, 1,
0.5430303, -0.5440022, 2.284235, 1, 1, 1, 1, 1,
0.5458359, 1.165229, 0.1442155, 1, 1, 1, 1, 1,
0.5558654, 0.961498, -2.331155, 1, 1, 1, 1, 1,
0.5563458, 0.6220061, 1.47382, 1, 1, 1, 1, 1,
0.5603329, -0.8994367, 4.3648, 1, 1, 1, 1, 1,
0.5613643, 0.5310001, 1.472282, 1, 1, 1, 1, 1,
0.566104, -1.162107, 2.347064, 1, 1, 1, 1, 1,
0.570566, 0.2535307, 1.679883, 1, 1, 1, 1, 1,
0.5723036, -0.8214629, 1.899822, 1, 1, 1, 1, 1,
0.5761289, -0.5349542, 2.181985, 1, 1, 1, 1, 1,
0.5774087, -0.4347581, 3.880687, 0, 0, 1, 1, 1,
0.5783572, 0.6266121, -0.02416877, 1, 0, 0, 1, 1,
0.5818095, 0.07135176, 2.496588, 1, 0, 0, 1, 1,
0.5870652, -1.717759, 6.276508, 1, 0, 0, 1, 1,
0.5907053, 1.862841, 0.6267421, 1, 0, 0, 1, 1,
0.5924816, 1.403921, 0.1071545, 1, 0, 0, 1, 1,
0.596522, 0.3626199, -0.4918005, 0, 0, 0, 1, 1,
0.6047472, 1.625564, 1.796382, 0, 0, 0, 1, 1,
0.6059556, 1.462843, 0.5339882, 0, 0, 0, 1, 1,
0.6088679, -1.626043, 4.374592, 0, 0, 0, 1, 1,
0.6157845, -0.7549734, 2.854815, 0, 0, 0, 1, 1,
0.6162589, 2.053777, 0.3932202, 0, 0, 0, 1, 1,
0.6164085, -1.14073, 3.050829, 0, 0, 0, 1, 1,
0.6186309, -0.2090942, 2.647292, 1, 1, 1, 1, 1,
0.6205105, -3.139096, 2.510016, 1, 1, 1, 1, 1,
0.621699, -0.003749361, 2.295868, 1, 1, 1, 1, 1,
0.6251774, -0.1582204, 1.669871, 1, 1, 1, 1, 1,
0.6345924, 0.8766172, 0.5745227, 1, 1, 1, 1, 1,
0.6354457, 0.2913929, 1.409534, 1, 1, 1, 1, 1,
0.6379363, -0.4047729, 0.439942, 1, 1, 1, 1, 1,
0.6387994, 0.8617616, -0.3191713, 1, 1, 1, 1, 1,
0.6454322, -0.3432952, 2.132734, 1, 1, 1, 1, 1,
0.6468258, -1.306754, 2.800396, 1, 1, 1, 1, 1,
0.6471012, -2.3095, 2.082027, 1, 1, 1, 1, 1,
0.6511039, -0.3911435, 2.46953, 1, 1, 1, 1, 1,
0.6575539, -0.1483389, -0.8214846, 1, 1, 1, 1, 1,
0.658649, -0.8753987, 2.879199, 1, 1, 1, 1, 1,
0.6603845, 1.047726, 1.819407, 1, 1, 1, 1, 1,
0.6633639, 0.4484054, 1.579775, 0, 0, 1, 1, 1,
0.6638436, 0.9935423, 1.97931, 1, 0, 0, 1, 1,
0.6696705, 2.309646, 1.282906, 1, 0, 0, 1, 1,
0.6746309, 1.809409, 0.8361868, 1, 0, 0, 1, 1,
0.6788241, -0.1042107, 0.6155128, 1, 0, 0, 1, 1,
0.6808364, 0.8244852, 1.200662, 1, 0, 0, 1, 1,
0.680838, -0.03531652, 1.891739, 0, 0, 0, 1, 1,
0.6814772, -0.8108279, 2.358081, 0, 0, 0, 1, 1,
0.6861376, 0.06849439, 1.906807, 0, 0, 0, 1, 1,
0.689678, 1.50089, 0.5111801, 0, 0, 0, 1, 1,
0.6897542, -0.02213279, 1.077681, 0, 0, 0, 1, 1,
0.6917533, -1.183536, 3.875724, 0, 0, 0, 1, 1,
0.6924007, -0.8654892, 1.482866, 0, 0, 0, 1, 1,
0.6941962, -0.1723208, 1.567205, 1, 1, 1, 1, 1,
0.6942325, 0.8092006, 0.3040466, 1, 1, 1, 1, 1,
0.7033199, -0.5928717, 2.435176, 1, 1, 1, 1, 1,
0.7044142, 1.237303, 0.9625843, 1, 1, 1, 1, 1,
0.7122539, -1.843563, 4.746177, 1, 1, 1, 1, 1,
0.7125015, -0.888056, 1.869258, 1, 1, 1, 1, 1,
0.7220709, -0.07033164, 1.221152, 1, 1, 1, 1, 1,
0.7241313, 1.465994, 1.396953, 1, 1, 1, 1, 1,
0.7303173, 0.4027128, 0.494265, 1, 1, 1, 1, 1,
0.732571, -0.922931, 2.837583, 1, 1, 1, 1, 1,
0.7328788, -0.04298331, -0.07505447, 1, 1, 1, 1, 1,
0.736318, 0.06615767, 3.097297, 1, 1, 1, 1, 1,
0.7365761, 1.095176, 0.06795169, 1, 1, 1, 1, 1,
0.7467044, 0.01792883, 1.340092, 1, 1, 1, 1, 1,
0.7468473, -0.1148092, 2.305066, 1, 1, 1, 1, 1,
0.7476075, -0.632425, 0.8817168, 0, 0, 1, 1, 1,
0.7488256, -1.705473, 2.157292, 1, 0, 0, 1, 1,
0.7498001, -1.604614, 2.926575, 1, 0, 0, 1, 1,
0.7515522, 0.5934125, 1.124128, 1, 0, 0, 1, 1,
0.7557346, 1.416411, -0.2808254, 1, 0, 0, 1, 1,
0.7569263, 2.277901, 1.189356, 1, 0, 0, 1, 1,
0.7619975, 0.3081226, 0.4793508, 0, 0, 0, 1, 1,
0.7623543, -0.9453966, 3.238388, 0, 0, 0, 1, 1,
0.7638794, -1.100925, 2.553812, 0, 0, 0, 1, 1,
0.7747708, 1.079378, 0.3931327, 0, 0, 0, 1, 1,
0.7883242, 0.3029886, 1.160231, 0, 0, 0, 1, 1,
0.7887788, -1.093104, 2.472519, 0, 0, 0, 1, 1,
0.794613, -0.009179052, 0.2487595, 0, 0, 0, 1, 1,
0.7970129, 1.137893, 0.8179504, 1, 1, 1, 1, 1,
0.7977979, -0.7294632, 2.492228, 1, 1, 1, 1, 1,
0.7979525, -0.6171886, 3.453047, 1, 1, 1, 1, 1,
0.8020742, -0.5487495, 0.7021937, 1, 1, 1, 1, 1,
0.8074198, 0.1423411, 1.370641, 1, 1, 1, 1, 1,
0.8075387, 0.6243546, 2.060881, 1, 1, 1, 1, 1,
0.8119618, 1.300098, -0.04576769, 1, 1, 1, 1, 1,
0.8128417, 2.785136, -0.957104, 1, 1, 1, 1, 1,
0.8160092, -1.155222, 2.592864, 1, 1, 1, 1, 1,
0.8200708, 0.6523444, 0.5066293, 1, 1, 1, 1, 1,
0.8235306, -0.7349451, 3.017207, 1, 1, 1, 1, 1,
0.8281653, 0.07788119, 2.699881, 1, 1, 1, 1, 1,
0.828679, 1.960096, 1.815961, 1, 1, 1, 1, 1,
0.8302367, 0.003096943, 1.389146, 1, 1, 1, 1, 1,
0.8315956, -1.139692, 3.838054, 1, 1, 1, 1, 1,
0.8325049, 0.03187447, 1.275397, 0, 0, 1, 1, 1,
0.8343191, -0.6163404, 2.683131, 1, 0, 0, 1, 1,
0.8387676, 0.6345085, -1.757855, 1, 0, 0, 1, 1,
0.8408257, 0.2903348, 1.998334, 1, 0, 0, 1, 1,
0.8454328, -0.3084309, 2.351253, 1, 0, 0, 1, 1,
0.849983, -0.3303582, 2.624403, 1, 0, 0, 1, 1,
0.8518651, -0.7480611, 3.677785, 0, 0, 0, 1, 1,
0.8544336, -0.7585108, 1.108106, 0, 0, 0, 1, 1,
0.8560922, 0.6624517, 0.1812131, 0, 0, 0, 1, 1,
0.8621668, 0.4438446, 0.04308554, 0, 0, 0, 1, 1,
0.8657173, 0.1818461, 0.7752755, 0, 0, 0, 1, 1,
0.8726804, -0.2915072, 2.352282, 0, 0, 0, 1, 1,
0.874284, 0.2771297, 1.438953, 0, 0, 0, 1, 1,
0.8906879, -0.3035009, 2.627407, 1, 1, 1, 1, 1,
0.8913531, 0.2937385, -0.5218592, 1, 1, 1, 1, 1,
0.8969766, 0.143148, 0.9401779, 1, 1, 1, 1, 1,
0.9036084, 0.4331765, 2.664474, 1, 1, 1, 1, 1,
0.9043927, -0.4141933, 2.287457, 1, 1, 1, 1, 1,
0.9083534, 0.4668051, 0.5470687, 1, 1, 1, 1, 1,
0.9172558, 0.0234856, 1.605686, 1, 1, 1, 1, 1,
0.9196426, 1.29967, 0.7820495, 1, 1, 1, 1, 1,
0.9232044, -1.313892, 3.364539, 1, 1, 1, 1, 1,
0.9255636, 2.061287, 0.9389073, 1, 1, 1, 1, 1,
0.9269294, 1.259924, 0.1833615, 1, 1, 1, 1, 1,
0.9279487, -0.9188802, 0.8030334, 1, 1, 1, 1, 1,
0.9286326, 0.5295084, 0.5622351, 1, 1, 1, 1, 1,
0.9294024, 0.07179678, 0.3933535, 1, 1, 1, 1, 1,
0.9380478, 0.8839527, 2.406089, 1, 1, 1, 1, 1,
0.9416893, -0.03135882, 0.6867487, 0, 0, 1, 1, 1,
0.9511112, 0.9382826, 1.185106, 1, 0, 0, 1, 1,
0.9514812, 0.5811511, 1.082151, 1, 0, 0, 1, 1,
0.9520289, 2.570493, 0.6422307, 1, 0, 0, 1, 1,
0.9544333, -1.255541, 1.748115, 1, 0, 0, 1, 1,
0.9742688, -1.43916, 1.324578, 1, 0, 0, 1, 1,
0.978025, 0.01208717, 1.734468, 0, 0, 0, 1, 1,
0.9835344, 0.2386671, 1.172632, 0, 0, 0, 1, 1,
0.9857199, 1.009833, 0.7695818, 0, 0, 0, 1, 1,
0.9892336, 0.2227478, 0.4782493, 0, 0, 0, 1, 1,
0.9952913, 0.1733569, 2.112206, 0, 0, 0, 1, 1,
0.9979178, -0.1349697, 1.209434, 0, 0, 0, 1, 1,
0.998408, 1.656485, 1.172189, 0, 0, 0, 1, 1,
1.002417, -1.495637, 1.63692, 1, 1, 1, 1, 1,
1.006088, -0.1155407, 2.025563, 1, 1, 1, 1, 1,
1.029724, -0.1824069, 1.355081, 1, 1, 1, 1, 1,
1.032066, 0.3908097, 0.4980963, 1, 1, 1, 1, 1,
1.032868, -2.470746, 3.148059, 1, 1, 1, 1, 1,
1.032961, 0.7741486, 0.6613261, 1, 1, 1, 1, 1,
1.036766, 0.5806627, 2.025568, 1, 1, 1, 1, 1,
1.039228, -1.031492, 4.625376, 1, 1, 1, 1, 1,
1.047902, -0.423274, 1.037261, 1, 1, 1, 1, 1,
1.047913, -0.2148521, 2.205997, 1, 1, 1, 1, 1,
1.052209, -2.143292, 4.037072, 1, 1, 1, 1, 1,
1.057634, 0.07895549, 2.094027, 1, 1, 1, 1, 1,
1.072237, 1.010501, 0.9028258, 1, 1, 1, 1, 1,
1.076206, 1.031205, 0.7053071, 1, 1, 1, 1, 1,
1.078634, 0.1588795, 1.041572, 1, 1, 1, 1, 1,
1.093935, 0.9599891, 0.2843426, 0, 0, 1, 1, 1,
1.10681, -1.151004, 2.201913, 1, 0, 0, 1, 1,
1.115739, 0.06987499, 1.251532, 1, 0, 0, 1, 1,
1.116163, -0.5605931, 3.465292, 1, 0, 0, 1, 1,
1.127638, -0.09596626, 0.5562916, 1, 0, 0, 1, 1,
1.12816, 0.4599209, 1.122238, 1, 0, 0, 1, 1,
1.129279, 0.6206764, 1.599314, 0, 0, 0, 1, 1,
1.15189, -0.8621839, 1.721496, 0, 0, 0, 1, 1,
1.166114, 0.4835114, 0.9297339, 0, 0, 0, 1, 1,
1.171004, 0.1838805, 2.473481, 0, 0, 0, 1, 1,
1.174228, -0.52463, -0.9599506, 0, 0, 0, 1, 1,
1.197439, 0.04624368, 3.312131, 0, 0, 0, 1, 1,
1.201573, -0.2037192, 1.325574, 0, 0, 0, 1, 1,
1.203017, 0.06943128, 1.116862, 1, 1, 1, 1, 1,
1.20365, 1.204723, 0.9345015, 1, 1, 1, 1, 1,
1.214992, -1.391262, 1.09266, 1, 1, 1, 1, 1,
1.216045, -1.903343, 3.180537, 1, 1, 1, 1, 1,
1.226254, 1.393254, -0.268117, 1, 1, 1, 1, 1,
1.230339, 0.2937657, 1.007332, 1, 1, 1, 1, 1,
1.233186, -0.3262348, 0.7449216, 1, 1, 1, 1, 1,
1.235216, 0.2068738, 0.3202901, 1, 1, 1, 1, 1,
1.251639, 0.5516133, -0.2840407, 1, 1, 1, 1, 1,
1.281568, -0.8727292, 3.441803, 1, 1, 1, 1, 1,
1.291811, -1.342193, 0.8005507, 1, 1, 1, 1, 1,
1.296351, -0.6422952, 1.448097, 1, 1, 1, 1, 1,
1.307676, 0.8845627, 0.1242758, 1, 1, 1, 1, 1,
1.311097, -1.223067, 3.199465, 1, 1, 1, 1, 1,
1.31237, 0.8963605, 0.5590723, 1, 1, 1, 1, 1,
1.313144, 0.7529083, 3.219005, 0, 0, 1, 1, 1,
1.319759, 0.8587795, 0.8489316, 1, 0, 0, 1, 1,
1.320533, 1.863896, 0.7423847, 1, 0, 0, 1, 1,
1.32331, 1.009917, 1.631098, 1, 0, 0, 1, 1,
1.346011, -1.59254, 1.871228, 1, 0, 0, 1, 1,
1.364931, -0.4357229, 3.158567, 1, 0, 0, 1, 1,
1.368555, 1.303473, 1.271748, 0, 0, 0, 1, 1,
1.37684, -2.917262, 1.564303, 0, 0, 0, 1, 1,
1.380087, -1.356787, 2.576634, 0, 0, 0, 1, 1,
1.384475, 1.500388, -2.055763, 0, 0, 0, 1, 1,
1.39769, 2.283926, -1.695482, 0, 0, 0, 1, 1,
1.410458, 1.505719, 1.094237, 0, 0, 0, 1, 1,
1.416613, -1.832835, 0.8718101, 0, 0, 0, 1, 1,
1.428391, -0.7043018, 1.726323, 1, 1, 1, 1, 1,
1.43046, 0.4704837, -0.5676894, 1, 1, 1, 1, 1,
1.439481, -0.02408893, 0.32601, 1, 1, 1, 1, 1,
1.441764, -2.21543, 3.673895, 1, 1, 1, 1, 1,
1.452626, -2.304404, 1.749092, 1, 1, 1, 1, 1,
1.453655, 0.8763917, 1.264897, 1, 1, 1, 1, 1,
1.471016, 2.037495, 0.7790149, 1, 1, 1, 1, 1,
1.481932, 0.7307585, 0.7991775, 1, 1, 1, 1, 1,
1.484714, -1.306895, 1.169008, 1, 1, 1, 1, 1,
1.484751, -0.2530986, 1.874803, 1, 1, 1, 1, 1,
1.486868, 0.3593696, 1.180641, 1, 1, 1, 1, 1,
1.488745, 1.21, 4.039671, 1, 1, 1, 1, 1,
1.493945, -0.5076315, 0.8311298, 1, 1, 1, 1, 1,
1.502747, -0.4662485, 2.448739, 1, 1, 1, 1, 1,
1.502826, 1.373177, 0.8620648, 1, 1, 1, 1, 1,
1.512452, -2.441016, 1.949546, 0, 0, 1, 1, 1,
1.521412, 0.776877, 0.7485791, 1, 0, 0, 1, 1,
1.543858, 0.6948307, 0.001991706, 1, 0, 0, 1, 1,
1.548805, -0.3393096, 3.339056, 1, 0, 0, 1, 1,
1.551216, 1.354599, 1.152601, 1, 0, 0, 1, 1,
1.555316, 0.9590915, 0.4970911, 1, 0, 0, 1, 1,
1.560289, -0.174073, 1.295585, 0, 0, 0, 1, 1,
1.567429, 0.5158809, 1.848986, 0, 0, 0, 1, 1,
1.567961, 0.5244961, 2.081265, 0, 0, 0, 1, 1,
1.570336, 0.676124, 0.9344097, 0, 0, 0, 1, 1,
1.578291, -1.493967, 3.149651, 0, 0, 0, 1, 1,
1.587296, -1.429901, 2.021601, 0, 0, 0, 1, 1,
1.591028, 0.4461764, 1.128768, 0, 0, 0, 1, 1,
1.607996, 0.7305589, 0.8677236, 1, 1, 1, 1, 1,
1.611648, -0.3197092, 2.427778, 1, 1, 1, 1, 1,
1.647942, 0.5675796, -0.1736733, 1, 1, 1, 1, 1,
1.64925, 0.2953457, 0.8463754, 1, 1, 1, 1, 1,
1.65369, 1.698729, 0.3396531, 1, 1, 1, 1, 1,
1.653829, 0.2641753, 2.400278, 1, 1, 1, 1, 1,
1.673368, -1.144944, 3.906059, 1, 1, 1, 1, 1,
1.691086, -0.8832783, 2.832875, 1, 1, 1, 1, 1,
1.695345, 0.7540912, 0.5353745, 1, 1, 1, 1, 1,
1.697135, -0.2618088, 2.713438, 1, 1, 1, 1, 1,
1.713125, -0.06758781, 3.476207, 1, 1, 1, 1, 1,
1.735389, 0.5364964, 1.168503, 1, 1, 1, 1, 1,
1.740212, 0.8096552, 1.177358, 1, 1, 1, 1, 1,
1.744653, -0.189539, 1.441231, 1, 1, 1, 1, 1,
1.745326, -0.6389682, 0.4208884, 1, 1, 1, 1, 1,
1.748296, 2.121621, 1.215218, 0, 0, 1, 1, 1,
1.771059, 2.040133, 1.13448, 1, 0, 0, 1, 1,
1.77346, 1.189494, 0.7687756, 1, 0, 0, 1, 1,
1.789104, -0.326373, 0.6075153, 1, 0, 0, 1, 1,
1.78923, -1.467762, 2.159399, 1, 0, 0, 1, 1,
1.793151, 0.1914122, 2.476052, 1, 0, 0, 1, 1,
1.799285, 0.1653017, 0.5073265, 0, 0, 0, 1, 1,
1.83809, -0.6084052, 2.167204, 0, 0, 0, 1, 1,
1.838154, 2.049839, -0.004435041, 0, 0, 0, 1, 1,
1.842679, 0.8987023, -0.003135725, 0, 0, 0, 1, 1,
1.844283, 1.532432, -0.1881908, 0, 0, 0, 1, 1,
1.872557, -0.05385694, 2.118079, 0, 0, 0, 1, 1,
1.877537, 0.003686431, 0.7458221, 0, 0, 0, 1, 1,
1.887778, 0.5427486, 2.041039, 1, 1, 1, 1, 1,
1.891971, 0.7979826, 1.360919, 1, 1, 1, 1, 1,
1.89779, 0.4464802, -0.2334488, 1, 1, 1, 1, 1,
1.942042, -0.71207, 0.8675226, 1, 1, 1, 1, 1,
1.945126, 0.2955905, 0.7334668, 1, 1, 1, 1, 1,
1.953028, -0.5469476, 2.464923, 1, 1, 1, 1, 1,
1.975287, -1.160435, 2.939791, 1, 1, 1, 1, 1,
1.976106, -1.630153, 2.916826, 1, 1, 1, 1, 1,
2.012413, 0.2962031, 1.377783, 1, 1, 1, 1, 1,
2.037568, 0.9364033, 0.6302583, 1, 1, 1, 1, 1,
2.091919, -0.7660879, 3.176313, 1, 1, 1, 1, 1,
2.136309, -0.1741594, 0.9119071, 1, 1, 1, 1, 1,
2.141406, 1.90724, 0.8816757, 1, 1, 1, 1, 1,
2.167107, -0.9563627, 2.460581, 1, 1, 1, 1, 1,
2.170907, -2.272705, 1.275846, 1, 1, 1, 1, 1,
2.173887, -0.4982638, 1.173939, 0, 0, 1, 1, 1,
2.183421, 1.331372, 2.143411, 1, 0, 0, 1, 1,
2.209602, -0.7939556, 3.697221, 1, 0, 0, 1, 1,
2.24101, 0.1788099, 0.3303902, 1, 0, 0, 1, 1,
2.263118, -1.239935, 2.607316, 1, 0, 0, 1, 1,
2.277235, -1.636341, 3.766988, 1, 0, 0, 1, 1,
2.279329, 1.853613, -0.2838604, 0, 0, 0, 1, 1,
2.28766, -0.2855773, 0.2727972, 0, 0, 0, 1, 1,
2.35153, 0.1335874, 1.54668, 0, 0, 0, 1, 1,
2.378093, -1.280059, 2.790116, 0, 0, 0, 1, 1,
2.415194, -0.01415647, -0.2905934, 0, 0, 0, 1, 1,
2.46022, -0.3322233, 3.120706, 0, 0, 0, 1, 1,
2.556616, -0.5622274, 1.061891, 0, 0, 0, 1, 1,
2.591073, -0.9473197, 2.766292, 1, 1, 1, 1, 1,
2.59766, -0.5086638, 2.816653, 1, 1, 1, 1, 1,
2.617063, 1.122754, 1.526211, 1, 1, 1, 1, 1,
2.810551, -0.1013625, 1.761699, 1, 1, 1, 1, 1,
2.940768, -1.023964, 0.2404895, 1, 1, 1, 1, 1,
3.007505, -1.114291, 1.560706, 1, 1, 1, 1, 1,
3.435625, 1.276662, 1.651197, 1, 1, 1, 1, 1
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
var radius = 9.859606;
var distance = 34.63145;
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
mvMatrix.translate( -0.1996899, -0.1028483, -0.6129422 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63145);
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