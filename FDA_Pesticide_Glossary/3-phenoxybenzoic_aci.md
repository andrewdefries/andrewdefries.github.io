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
-3.055324, -1.0732, -2.608268, 1, 0, 0, 1,
-2.953459, 1.147718, -0.8165725, 1, 0.007843138, 0, 1,
-2.602376, -0.6891868, -1.058874, 1, 0.01176471, 0, 1,
-2.590151, 1.217219, -1.170868, 1, 0.01960784, 0, 1,
-2.535319, 0.8453425, -2.225197, 1, 0.02352941, 0, 1,
-2.370302, -0.8970852, -0.6907933, 1, 0.03137255, 0, 1,
-2.35759, -1.909795, -3.866081, 1, 0.03529412, 0, 1,
-2.326577, -0.4205121, -0.7044995, 1, 0.04313726, 0, 1,
-2.312495, -0.365511, -1.697603, 1, 0.04705882, 0, 1,
-2.303461, -0.1274702, -3.609306, 1, 0.05490196, 0, 1,
-2.302705, -1.267215, -1.248742, 1, 0.05882353, 0, 1,
-2.240036, -0.1869429, -3.916181, 1, 0.06666667, 0, 1,
-2.235996, 0.2131962, -1.159884, 1, 0.07058824, 0, 1,
-2.233912, 1.034898, -1.034572, 1, 0.07843138, 0, 1,
-2.135145, -0.2386951, 1.409905, 1, 0.08235294, 0, 1,
-2.125875, 0.3373067, -0.1827885, 1, 0.09019608, 0, 1,
-2.118091, -2.200862, -2.616099, 1, 0.09411765, 0, 1,
-2.108447, 2.116687, 0.0405258, 1, 0.1019608, 0, 1,
-2.106301, -0.1020597, -1.127516, 1, 0.1098039, 0, 1,
-2.105046, 0.2077397, -0.8110632, 1, 0.1137255, 0, 1,
-2.103462, 1.866014, -0.2045387, 1, 0.1215686, 0, 1,
-2.096685, 0.190157, -1.730841, 1, 0.1254902, 0, 1,
-2.094197, 0.8712649, -1.90929, 1, 0.1333333, 0, 1,
-2.044115, 0.7708649, -1.173889, 1, 0.1372549, 0, 1,
-2.030279, 1.12875, -1.702369, 1, 0.145098, 0, 1,
-2.019742, -0.7857471, -0.7005414, 1, 0.1490196, 0, 1,
-2.002392, -1.872721, -1.031201, 1, 0.1568628, 0, 1,
-2.001113, -1.037492, -1.88506, 1, 0.1607843, 0, 1,
-1.994187, -0.7697918, -2.470465, 1, 0.1686275, 0, 1,
-1.993359, -0.1301535, -1.662581, 1, 0.172549, 0, 1,
-1.972241, 0.1091831, -1.695974, 1, 0.1803922, 0, 1,
-1.957087, 0.4972786, 0.4930493, 1, 0.1843137, 0, 1,
-1.94653, 1.989499, 0.7059096, 1, 0.1921569, 0, 1,
-1.943297, 0.8737814, -1.113104, 1, 0.1960784, 0, 1,
-1.939285, -0.761893, 0.5638157, 1, 0.2039216, 0, 1,
-1.916943, -1.150986, -1.934037, 1, 0.2117647, 0, 1,
-1.904089, -0.6140812, -1.826075, 1, 0.2156863, 0, 1,
-1.890775, 0.839365, -2.537058, 1, 0.2235294, 0, 1,
-1.876223, 1.599916, -0.4235719, 1, 0.227451, 0, 1,
-1.867105, -0.04961536, -1.961031, 1, 0.2352941, 0, 1,
-1.85506, -0.322238, -0.8913748, 1, 0.2392157, 0, 1,
-1.850421, -1.291835, -1.601838, 1, 0.2470588, 0, 1,
-1.83971, 0.6702023, -1.547244, 1, 0.2509804, 0, 1,
-1.839579, 0.6192525, -0.2442314, 1, 0.2588235, 0, 1,
-1.819763, 0.3537167, -3.382195, 1, 0.2627451, 0, 1,
-1.815098, 0.2343382, -2.503909, 1, 0.2705882, 0, 1,
-1.80935, 0.6541448, -0.8763247, 1, 0.2745098, 0, 1,
-1.808314, 1.581159, -2.604561, 1, 0.282353, 0, 1,
-1.798358, 0.4464654, -1.811856, 1, 0.2862745, 0, 1,
-1.792038, -1.373411, -2.541563, 1, 0.2941177, 0, 1,
-1.747177, -2.881087, -4.367313, 1, 0.3019608, 0, 1,
-1.739812, -0.8292063, -0.007294665, 1, 0.3058824, 0, 1,
-1.727737, -0.08114925, -1.817438, 1, 0.3137255, 0, 1,
-1.722585, 0.7947962, -3.623526, 1, 0.3176471, 0, 1,
-1.716874, 0.4568756, -2.970477, 1, 0.3254902, 0, 1,
-1.709775, 0.5309665, -1.272411, 1, 0.3294118, 0, 1,
-1.676046, -0.3843871, -1.858291, 1, 0.3372549, 0, 1,
-1.673523, 0.3957452, -0.9463221, 1, 0.3411765, 0, 1,
-1.65396, 0.01163299, -0.460645, 1, 0.3490196, 0, 1,
-1.597269, 0.09747149, -2.114374, 1, 0.3529412, 0, 1,
-1.575399, -0.1610329, -2.420226, 1, 0.3607843, 0, 1,
-1.570926, -0.5461513, -1.963787, 1, 0.3647059, 0, 1,
-1.569227, 0.3342032, -0.7459991, 1, 0.372549, 0, 1,
-1.566358, -0.5083147, -3.617469, 1, 0.3764706, 0, 1,
-1.565985, -0.5286958, -3.04833, 1, 0.3843137, 0, 1,
-1.549669, -0.2647783, -0.2698406, 1, 0.3882353, 0, 1,
-1.543802, 1.104638, -0.08254591, 1, 0.3960784, 0, 1,
-1.529053, 0.7009841, -0.1468476, 1, 0.4039216, 0, 1,
-1.525202, -0.2980788, -1.761024, 1, 0.4078431, 0, 1,
-1.523486, -0.9689832, -1.468678, 1, 0.4156863, 0, 1,
-1.523235, -0.4532721, -2.070049, 1, 0.4196078, 0, 1,
-1.518959, -0.4872065, -2.550098, 1, 0.427451, 0, 1,
-1.509052, -0.88991, -1.673747, 1, 0.4313726, 0, 1,
-1.500973, 1.164472, -2.361493, 1, 0.4392157, 0, 1,
-1.494585, 1.88043, -0.8583327, 1, 0.4431373, 0, 1,
-1.482974, -0.3102117, -2.056464, 1, 0.4509804, 0, 1,
-1.482572, 0.03980879, 0.01083686, 1, 0.454902, 0, 1,
-1.45838, 0.09858532, -2.28238, 1, 0.4627451, 0, 1,
-1.451917, -2.549361, -1.811985, 1, 0.4666667, 0, 1,
-1.450537, -0.4458601, -2.215822, 1, 0.4745098, 0, 1,
-1.445527, 0.8249844, -1.084338, 1, 0.4784314, 0, 1,
-1.43659, -1.345802, -1.268428, 1, 0.4862745, 0, 1,
-1.432716, 0.06215483, -4.343885, 1, 0.4901961, 0, 1,
-1.430516, -0.9370315, -1.24798, 1, 0.4980392, 0, 1,
-1.419416, -0.7370877, -3.306632, 1, 0.5058824, 0, 1,
-1.418427, -0.644843, -0.8432536, 1, 0.509804, 0, 1,
-1.418343, 0.5183648, -0.7076563, 1, 0.5176471, 0, 1,
-1.390654, -0.6929796, -1.823696, 1, 0.5215687, 0, 1,
-1.385082, -1.78891, -4.41503, 1, 0.5294118, 0, 1,
-1.385062, -0.2026504, -4.054356, 1, 0.5333334, 0, 1,
-1.378135, -0.306597, -3.303164, 1, 0.5411765, 0, 1,
-1.374183, 0.537311, -0.7424967, 1, 0.5450981, 0, 1,
-1.361342, 0.1989964, -0.998634, 1, 0.5529412, 0, 1,
-1.361038, 1.296535, -0.2417847, 1, 0.5568628, 0, 1,
-1.357609, -0.4619408, -3.808481, 1, 0.5647059, 0, 1,
-1.35529, 0.4120904, -0.9098316, 1, 0.5686275, 0, 1,
-1.348529, 0.7173693, -2.200917, 1, 0.5764706, 0, 1,
-1.340961, 1.464364, -0.9912179, 1, 0.5803922, 0, 1,
-1.322212, -0.6428615, -2.857955, 1, 0.5882353, 0, 1,
-1.320956, 0.8960132, -0.7445657, 1, 0.5921569, 0, 1,
-1.320471, 0.4155196, -1.501951, 1, 0.6, 0, 1,
-1.300157, -1.594351, -2.256622, 1, 0.6078432, 0, 1,
-1.295948, 0.6086344, -1.463447, 1, 0.6117647, 0, 1,
-1.278602, 0.479056, -2.776389, 1, 0.6196079, 0, 1,
-1.27685, 0.06558079, 0.3197283, 1, 0.6235294, 0, 1,
-1.266516, -1.48735, -2.798169, 1, 0.6313726, 0, 1,
-1.264178, -1.334625, -4.104497, 1, 0.6352941, 0, 1,
-1.254133, -0.1329403, -2.097783, 1, 0.6431373, 0, 1,
-1.247948, 0.2378327, 0.3544729, 1, 0.6470588, 0, 1,
-1.246373, 1.177535, -0.6331434, 1, 0.654902, 0, 1,
-1.245923, -1.366625, -1.52351, 1, 0.6588235, 0, 1,
-1.237242, -0.6268466, -2.423607, 1, 0.6666667, 0, 1,
-1.2347, 0.5038195, -1.596762, 1, 0.6705883, 0, 1,
-1.226687, -1.722872, -2.013422, 1, 0.6784314, 0, 1,
-1.224798, 0.1377392, -1.976683, 1, 0.682353, 0, 1,
-1.217943, -0.4287997, -1.115787, 1, 0.6901961, 0, 1,
-1.216755, -0.2582976, -1.204384, 1, 0.6941177, 0, 1,
-1.216281, 1.301372, -0.02787175, 1, 0.7019608, 0, 1,
-1.195331, 0.5160294, 0.02877397, 1, 0.7098039, 0, 1,
-1.193194, -0.311016, -1.21957, 1, 0.7137255, 0, 1,
-1.190549, -0.7766405, -0.4316652, 1, 0.7215686, 0, 1,
-1.186913, 1.03315, -2.699628, 1, 0.7254902, 0, 1,
-1.182988, 0.008010245, -0.8101728, 1, 0.7333333, 0, 1,
-1.17775, -0.9364587, -2.260683, 1, 0.7372549, 0, 1,
-1.172388, -1.286317, -1.198168, 1, 0.7450981, 0, 1,
-1.171007, 2.18744, -0.9824381, 1, 0.7490196, 0, 1,
-1.168797, -0.2079058, -0.5985605, 1, 0.7568628, 0, 1,
-1.166404, -0.333939, -1.324332, 1, 0.7607843, 0, 1,
-1.164016, -1.933485, -2.669878, 1, 0.7686275, 0, 1,
-1.160985, -0.4532783, -2.228773, 1, 0.772549, 0, 1,
-1.160012, 0.5669952, -1.83357, 1, 0.7803922, 0, 1,
-1.152167, -0.4933919, -1.680591, 1, 0.7843137, 0, 1,
-1.147307, -1.005832, -0.8111983, 1, 0.7921569, 0, 1,
-1.135567, -0.8886945, -2.363527, 1, 0.7960784, 0, 1,
-1.134989, 0.3090972, -0.7998019, 1, 0.8039216, 0, 1,
-1.132968, -0.4044904, -1.923302, 1, 0.8117647, 0, 1,
-1.128375, -0.3248599, -2.094922, 1, 0.8156863, 0, 1,
-1.127196, 0.3102747, -0.9139776, 1, 0.8235294, 0, 1,
-1.122703, 2.377552, -0.0004079046, 1, 0.827451, 0, 1,
-1.122241, -0.3343995, -1.324665, 1, 0.8352941, 0, 1,
-1.122236, -0.466544, -3.017756, 1, 0.8392157, 0, 1,
-1.119453, -0.1949699, -0.6439085, 1, 0.8470588, 0, 1,
-1.118262, 0.07250661, -0.4991829, 1, 0.8509804, 0, 1,
-1.10815, -0.4068296, -0.7138408, 1, 0.8588235, 0, 1,
-1.096548, -0.1046187, -2.665811, 1, 0.8627451, 0, 1,
-1.093255, 0.5995166, -1.904357, 1, 0.8705882, 0, 1,
-1.091853, 1.420003, -1.133272, 1, 0.8745098, 0, 1,
-1.091381, 0.629734, 0.899986, 1, 0.8823529, 0, 1,
-1.091087, 0.8011654, 0.6107918, 1, 0.8862745, 0, 1,
-1.090212, -0.638686, -3.0729, 1, 0.8941177, 0, 1,
-1.089927, -0.1356433, -1.395988, 1, 0.8980392, 0, 1,
-1.087393, -0.09080529, -1.261238, 1, 0.9058824, 0, 1,
-1.083512, -0.4818155, -0.9383528, 1, 0.9137255, 0, 1,
-1.083406, 1.617808, -1.417415, 1, 0.9176471, 0, 1,
-1.081351, -0.3986703, -4.872772, 1, 0.9254902, 0, 1,
-1.080717, -0.6010846, -2.037499, 1, 0.9294118, 0, 1,
-1.077587, 0.9632526, 0.01573245, 1, 0.9372549, 0, 1,
-1.069717, 0.170105, -0.9894046, 1, 0.9411765, 0, 1,
-1.068499, 0.06447598, -1.645404, 1, 0.9490196, 0, 1,
-1.045543, -0.135473, -2.818437, 1, 0.9529412, 0, 1,
-1.043669, -0.3598431, -2.534211, 1, 0.9607843, 0, 1,
-1.04269, -0.5608678, -2.653503, 1, 0.9647059, 0, 1,
-1.039457, -0.3191776, -1.966949, 1, 0.972549, 0, 1,
-1.032133, -0.1209046, -1.551936, 1, 0.9764706, 0, 1,
-1.031412, 0.4540818, -0.699588, 1, 0.9843137, 0, 1,
-1.02534, -0.9816995, 0.09851038, 1, 0.9882353, 0, 1,
-1.022605, -0.3613446, -1.103857, 1, 0.9960784, 0, 1,
-1.016382, 0.7929033, -1.572374, 0.9960784, 1, 0, 1,
-1.014335, 1.055191, -0.6135654, 0.9921569, 1, 0, 1,
-1.013606, 0.7798967, -0.4447034, 0.9843137, 1, 0, 1,
-1.007824, 1.538082, -0.3964543, 0.9803922, 1, 0, 1,
-1.00692, 0.1294419, -2.770139, 0.972549, 1, 0, 1,
-1.004013, -2.223512, -3.691737, 0.9686275, 1, 0, 1,
-1.002195, 1.183819, -1.370486, 0.9607843, 1, 0, 1,
-0.9949111, -0.2414326, -1.323977, 0.9568627, 1, 0, 1,
-0.9937696, -0.2617177, -1.229732, 0.9490196, 1, 0, 1,
-0.9871722, -1.502525, -5.255506, 0.945098, 1, 0, 1,
-0.9863126, -0.8848609, -0.9334208, 0.9372549, 1, 0, 1,
-0.9846219, 0.5081564, 0.6302075, 0.9333333, 1, 0, 1,
-0.9701114, -1.236772, -2.619466, 0.9254902, 1, 0, 1,
-0.9604011, -1.773252, -3.522302, 0.9215686, 1, 0, 1,
-0.9580093, 1.021968, -1.124888, 0.9137255, 1, 0, 1,
-0.9579238, 0.5038042, -1.504022, 0.9098039, 1, 0, 1,
-0.9576966, -0.9311919, -2.625168, 0.9019608, 1, 0, 1,
-0.9576492, 0.3081312, -1.860493, 0.8941177, 1, 0, 1,
-0.9525289, 0.3907322, -1.218444, 0.8901961, 1, 0, 1,
-0.9477327, 0.04039083, -2.577602, 0.8823529, 1, 0, 1,
-0.9466634, 1.601559, -1.227451, 0.8784314, 1, 0, 1,
-0.9441348, -1.408318, -3.418883, 0.8705882, 1, 0, 1,
-0.9396535, 0.7118227, -0.4768797, 0.8666667, 1, 0, 1,
-0.9387196, 0.9735408, -0.1547152, 0.8588235, 1, 0, 1,
-0.9370887, -0.1658541, -0.9192463, 0.854902, 1, 0, 1,
-0.9366404, -0.1439452, -2.11681, 0.8470588, 1, 0, 1,
-0.9346375, 0.8950681, -0.786009, 0.8431373, 1, 0, 1,
-0.9338659, 0.4662201, -0.7275227, 0.8352941, 1, 0, 1,
-0.9329249, -0.1998912, -0.2911287, 0.8313726, 1, 0, 1,
-0.925377, -1.193989, -3.514991, 0.8235294, 1, 0, 1,
-0.9208547, 0.5588521, -1.714077, 0.8196079, 1, 0, 1,
-0.9194999, 0.2329808, -1.359104, 0.8117647, 1, 0, 1,
-0.916977, -1.3503, -3.346451, 0.8078431, 1, 0, 1,
-0.9125668, -0.7479676, -2.215149, 0.8, 1, 0, 1,
-0.9108192, -1.293931, -2.352455, 0.7921569, 1, 0, 1,
-0.9044588, 0.04037032, -3.005116, 0.7882353, 1, 0, 1,
-0.9033796, 1.068112, -1.426073, 0.7803922, 1, 0, 1,
-0.9005746, 0.7483602, -0.8194422, 0.7764706, 1, 0, 1,
-0.8895564, 0.9994161, 0.1598469, 0.7686275, 1, 0, 1,
-0.8889864, 0.7931471, -1.05559, 0.7647059, 1, 0, 1,
-0.8845747, 0.5729265, -1.513538, 0.7568628, 1, 0, 1,
-0.8829377, 2.177986, 1.838337, 0.7529412, 1, 0, 1,
-0.8811873, 0.1511788, 0.8292392, 0.7450981, 1, 0, 1,
-0.8802285, 0.03313076, -2.715319, 0.7411765, 1, 0, 1,
-0.8756281, -0.9875186, -2.851159, 0.7333333, 1, 0, 1,
-0.8706035, -0.2855428, -0.220174, 0.7294118, 1, 0, 1,
-0.8691055, -0.4838103, -2.237306, 0.7215686, 1, 0, 1,
-0.8650967, 2.180301, -0.4970285, 0.7176471, 1, 0, 1,
-0.8555936, -1.662251, -2.489171, 0.7098039, 1, 0, 1,
-0.8529957, 0.9987797, -0.2003634, 0.7058824, 1, 0, 1,
-0.8474323, -0.1591632, -1.766456, 0.6980392, 1, 0, 1,
-0.840149, -1.714322, -2.865672, 0.6901961, 1, 0, 1,
-0.8378534, 0.8532135, -0.3247773, 0.6862745, 1, 0, 1,
-0.8305215, -0.8095325, -3.961682, 0.6784314, 1, 0, 1,
-0.8283268, -1.652764, -1.668965, 0.6745098, 1, 0, 1,
-0.8204578, 0.8528044, 0.6415353, 0.6666667, 1, 0, 1,
-0.8189415, 0.4812465, 0.9977254, 0.6627451, 1, 0, 1,
-0.8120708, -0.2725659, -0.9282053, 0.654902, 1, 0, 1,
-0.8111087, -1.200783, -4.235785, 0.6509804, 1, 0, 1,
-0.7958476, 0.1777019, -2.36678, 0.6431373, 1, 0, 1,
-0.7957917, 0.8609182, -1.776833, 0.6392157, 1, 0, 1,
-0.7863799, 0.1296849, -1.275784, 0.6313726, 1, 0, 1,
-0.782537, 0.4320318, -0.656091, 0.627451, 1, 0, 1,
-0.7796448, 0.4110105, -1.563641, 0.6196079, 1, 0, 1,
-0.7752332, 0.648846, -1.447721, 0.6156863, 1, 0, 1,
-0.7684487, 0.3383921, 0.6559747, 0.6078432, 1, 0, 1,
-0.762853, 0.8134536, -0.5450641, 0.6039216, 1, 0, 1,
-0.7595759, 0.153846, -2.650998, 0.5960785, 1, 0, 1,
-0.759111, 0.01007951, -3.224863, 0.5882353, 1, 0, 1,
-0.7577307, -0.8931494, -3.370216, 0.5843138, 1, 0, 1,
-0.7574378, 0.3966517, -1.345239, 0.5764706, 1, 0, 1,
-0.7510787, -0.3866318, -2.295042, 0.572549, 1, 0, 1,
-0.7462061, -0.3315224, -0.7089351, 0.5647059, 1, 0, 1,
-0.742919, -0.7729583, -1.557681, 0.5607843, 1, 0, 1,
-0.7424939, -0.7570558, -4.74764, 0.5529412, 1, 0, 1,
-0.7339445, -1.384997, -2.243441, 0.5490196, 1, 0, 1,
-0.7311186, -0.1026424, -2.287509, 0.5411765, 1, 0, 1,
-0.7210889, -1.801996, -3.972725, 0.5372549, 1, 0, 1,
-0.7204037, -0.328728, -2.05481, 0.5294118, 1, 0, 1,
-0.7194059, -0.676028, -2.07479, 0.5254902, 1, 0, 1,
-0.7153657, 0.0488253, -2.96818, 0.5176471, 1, 0, 1,
-0.7126058, -0.5624629, -1.922362, 0.5137255, 1, 0, 1,
-0.7083019, 3.668119, -1.220539, 0.5058824, 1, 0, 1,
-0.7073069, -0.8455933, -2.437158, 0.5019608, 1, 0, 1,
-0.7009465, 0.02451135, -1.483605, 0.4941176, 1, 0, 1,
-0.6981951, 0.1624104, -2.714859, 0.4862745, 1, 0, 1,
-0.696356, 1.732744, 0.8695961, 0.4823529, 1, 0, 1,
-0.6925621, 1.35234, 0.4699371, 0.4745098, 1, 0, 1,
-0.6865217, -0.4564674, -0.5668637, 0.4705882, 1, 0, 1,
-0.6840553, -0.1322058, -2.538134, 0.4627451, 1, 0, 1,
-0.6827825, 1.399543, 0.06005381, 0.4588235, 1, 0, 1,
-0.6821549, -0.3230703, -1.637195, 0.4509804, 1, 0, 1,
-0.6758661, 1.191001, -0.2488718, 0.4470588, 1, 0, 1,
-0.6734822, -0.07047216, -2.214556, 0.4392157, 1, 0, 1,
-0.6729102, 1.374118, 0.09073199, 0.4352941, 1, 0, 1,
-0.6710328, -2.128391, -3.090787, 0.427451, 1, 0, 1,
-0.6647516, 0.3537096, -0.5688562, 0.4235294, 1, 0, 1,
-0.6625788, -0.1536392, -2.198477, 0.4156863, 1, 0, 1,
-0.6592021, 0.5072821, -0.09692004, 0.4117647, 1, 0, 1,
-0.6565884, 1.231966, -0.5268005, 0.4039216, 1, 0, 1,
-0.6546173, 0.1122406, -3.302231, 0.3960784, 1, 0, 1,
-0.6541246, -0.1458649, -0.8534078, 0.3921569, 1, 0, 1,
-0.6524763, 0.1704288, -3.615155, 0.3843137, 1, 0, 1,
-0.6403397, 0.8062214, -0.2638982, 0.3803922, 1, 0, 1,
-0.6396106, -1.238084, -2.516986, 0.372549, 1, 0, 1,
-0.632122, 0.04275849, -0.8053534, 0.3686275, 1, 0, 1,
-0.6319609, 1.421717, 0.3062922, 0.3607843, 1, 0, 1,
-0.6295161, 0.7956629, -0.765231, 0.3568628, 1, 0, 1,
-0.6255797, -1.051244, -2.598382, 0.3490196, 1, 0, 1,
-0.615525, -0.1441402, -2.703856, 0.345098, 1, 0, 1,
-0.6120976, -0.8409163, -1.073029, 0.3372549, 1, 0, 1,
-0.6101259, -1.011706, -3.544718, 0.3333333, 1, 0, 1,
-0.6074986, 1.042524, -2.434127, 0.3254902, 1, 0, 1,
-0.604396, -1.602572, -3.031767, 0.3215686, 1, 0, 1,
-0.6037007, 1.584503, -0.9788505, 0.3137255, 1, 0, 1,
-0.6022694, 0.703472, 0.7022755, 0.3098039, 1, 0, 1,
-0.5987703, 0.5723379, -1.689179, 0.3019608, 1, 0, 1,
-0.5967735, 1.653612, -2.456289, 0.2941177, 1, 0, 1,
-0.5964748, 0.763245, -0.5129629, 0.2901961, 1, 0, 1,
-0.5952424, 0.7690151, 0.1476206, 0.282353, 1, 0, 1,
-0.5936199, -0.6460561, -1.024816, 0.2784314, 1, 0, 1,
-0.593496, 0.3356147, -2.263694, 0.2705882, 1, 0, 1,
-0.5895669, -0.6057001, -2.109693, 0.2666667, 1, 0, 1,
-0.5877141, -1.329196, -2.786557, 0.2588235, 1, 0, 1,
-0.5866933, -0.0850537, -0.948116, 0.254902, 1, 0, 1,
-0.5865471, 0.07224385, -1.546391, 0.2470588, 1, 0, 1,
-0.5857868, 1.206326, -1.561629, 0.2431373, 1, 0, 1,
-0.5843272, -0.6921749, -1.170668, 0.2352941, 1, 0, 1,
-0.5830399, -1.020161, -4.304949, 0.2313726, 1, 0, 1,
-0.5827216, 1.951556, -0.8001955, 0.2235294, 1, 0, 1,
-0.5825958, 0.6658584, -1.882975, 0.2196078, 1, 0, 1,
-0.5765335, -0.9935595, -2.009315, 0.2117647, 1, 0, 1,
-0.5684584, 0.3920443, -1.396486, 0.2078431, 1, 0, 1,
-0.5651669, -2.018352, -3.636779, 0.2, 1, 0, 1,
-0.5595502, -1.684031, -2.375214, 0.1921569, 1, 0, 1,
-0.5545266, 3.027401, 0.5322344, 0.1882353, 1, 0, 1,
-0.5519935, 0.6587772, -0.8219244, 0.1803922, 1, 0, 1,
-0.5507452, -0.6585268, -1.826478, 0.1764706, 1, 0, 1,
-0.5495422, -0.7440324, -1.42489, 0.1686275, 1, 0, 1,
-0.5492089, 0.284603, -0.4561987, 0.1647059, 1, 0, 1,
-0.5467577, -0.93563, -2.578813, 0.1568628, 1, 0, 1,
-0.5370591, -0.5068854, -1.936251, 0.1529412, 1, 0, 1,
-0.5356629, 1.143586, -0.4899085, 0.145098, 1, 0, 1,
-0.5324056, 1.128904, -0.7879165, 0.1411765, 1, 0, 1,
-0.5308311, -0.1203795, -3.000844, 0.1333333, 1, 0, 1,
-0.5246195, 1.513542, -1.527764, 0.1294118, 1, 0, 1,
-0.5168971, -0.8599154, -4.02109, 0.1215686, 1, 0, 1,
-0.5166778, 0.3257699, -1.167355, 0.1176471, 1, 0, 1,
-0.5134335, -0.2041737, -1.395526, 0.1098039, 1, 0, 1,
-0.5016206, 0.8569401, -1.091275, 0.1058824, 1, 0, 1,
-0.5015805, 0.2335618, -2.45049, 0.09803922, 1, 0, 1,
-0.4993665, 0.1637327, -2.853283, 0.09019608, 1, 0, 1,
-0.4990264, 0.02341921, -2.025533, 0.08627451, 1, 0, 1,
-0.4987856, -0.6021411, -3.036643, 0.07843138, 1, 0, 1,
-0.4977311, 0.4412419, -1.619834, 0.07450981, 1, 0, 1,
-0.494901, -0.3461756, -0.5795731, 0.06666667, 1, 0, 1,
-0.4933632, 0.06264947, -0.9792185, 0.0627451, 1, 0, 1,
-0.4836717, 0.8980733, -0.4971001, 0.05490196, 1, 0, 1,
-0.4797087, -1.297978, -3.009185, 0.05098039, 1, 0, 1,
-0.4790595, -1.126065, -2.076011, 0.04313726, 1, 0, 1,
-0.4779744, -0.6047715, -2.688665, 0.03921569, 1, 0, 1,
-0.4745332, 0.08242399, -1.150106, 0.03137255, 1, 0, 1,
-0.4716991, 0.9018365, -0.4937473, 0.02745098, 1, 0, 1,
-0.4685907, -0.4041554, -3.389204, 0.01960784, 1, 0, 1,
-0.4682401, 0.1484935, -1.346434, 0.01568628, 1, 0, 1,
-0.4674197, 1.705297, 0.9281136, 0.007843138, 1, 0, 1,
-0.4642557, 1.316559, -1.74585, 0.003921569, 1, 0, 1,
-0.4635813, -1.178319, -1.530399, 0, 1, 0.003921569, 1,
-0.461775, 1.054653, -0.2888132, 0, 1, 0.01176471, 1,
-0.4611208, 0.4154804, -0.2588484, 0, 1, 0.01568628, 1,
-0.4604112, 0.9716002, -0.5290338, 0, 1, 0.02352941, 1,
-0.4602627, -0.430544, -2.068264, 0, 1, 0.02745098, 1,
-0.4560253, -1.009134, -1.788958, 0, 1, 0.03529412, 1,
-0.4529981, 0.2576226, -2.038729, 0, 1, 0.03921569, 1,
-0.4507858, -0.6148068, -1.264624, 0, 1, 0.04705882, 1,
-0.4479606, 0.7993602, -1.025946, 0, 1, 0.05098039, 1,
-0.4469982, 1.06521, -2.290447, 0, 1, 0.05882353, 1,
-0.4433931, -2.072589, -2.018835, 0, 1, 0.0627451, 1,
-0.4332716, 0.0496379, -1.829362, 0, 1, 0.07058824, 1,
-0.432785, 1.419523, -0.8467962, 0, 1, 0.07450981, 1,
-0.4321148, 0.2618264, -0.6546957, 0, 1, 0.08235294, 1,
-0.4301624, -0.05107709, -0.7356238, 0, 1, 0.08627451, 1,
-0.4293751, -0.4860184, -3.239098, 0, 1, 0.09411765, 1,
-0.4254954, -0.2704248, -2.478991, 0, 1, 0.1019608, 1,
-0.4248315, 1.072931, 0.6690743, 0, 1, 0.1058824, 1,
-0.4203637, -1.308027, -2.235483, 0, 1, 0.1137255, 1,
-0.4115614, 0.9433178, -2.162326, 0, 1, 0.1176471, 1,
-0.4110152, 0.04173992, -3.640127, 0, 1, 0.1254902, 1,
-0.4090383, 0.897072, -1.888198, 0, 1, 0.1294118, 1,
-0.4076469, -1.026644, -3.535717, 0, 1, 0.1372549, 1,
-0.4063024, 0.4130383, 0.3877386, 0, 1, 0.1411765, 1,
-0.4061179, 1.095448, 0.8411036, 0, 1, 0.1490196, 1,
-0.4054884, 1.053038, 0.2940742, 0, 1, 0.1529412, 1,
-0.4040841, 0.616416, -0.07306007, 0, 1, 0.1607843, 1,
-0.4013725, -1.336971, -2.531883, 0, 1, 0.1647059, 1,
-0.400142, -2.200224, -3.662099, 0, 1, 0.172549, 1,
-0.3990365, 1.636806, -0.4965458, 0, 1, 0.1764706, 1,
-0.3971078, 0.4385314, -1.947821, 0, 1, 0.1843137, 1,
-0.3931743, 0.2593586, -1.159271, 0, 1, 0.1882353, 1,
-0.3910967, -0.1635012, -2.121784, 0, 1, 0.1960784, 1,
-0.3883351, -1.695785, -2.929922, 0, 1, 0.2039216, 1,
-0.3834803, -0.1144915, 1.124781, 0, 1, 0.2078431, 1,
-0.3789637, -0.3584659, -2.374974, 0, 1, 0.2156863, 1,
-0.378958, 1.563967, -1.212432, 0, 1, 0.2196078, 1,
-0.3776592, -0.7186852, -1.820076, 0, 1, 0.227451, 1,
-0.3706316, 0.9234362, -2.584048, 0, 1, 0.2313726, 1,
-0.3690113, -1.542271, -2.851298, 0, 1, 0.2392157, 1,
-0.3687795, 1.114288, -1.292578, 0, 1, 0.2431373, 1,
-0.368142, -0.9853958, -2.328741, 0, 1, 0.2509804, 1,
-0.3677435, 0.5331916, -2.63298, 0, 1, 0.254902, 1,
-0.3668487, -0.7351884, -1.617002, 0, 1, 0.2627451, 1,
-0.3651755, -0.9958246, -2.445068, 0, 1, 0.2666667, 1,
-0.3606754, 1.424158, 1.192464, 0, 1, 0.2745098, 1,
-0.3554137, 0.1314679, -0.8271185, 0, 1, 0.2784314, 1,
-0.3539932, 2.552518, 0.6098344, 0, 1, 0.2862745, 1,
-0.3536397, -0.156963, -1.305261, 0, 1, 0.2901961, 1,
-0.3533005, -0.2455283, -3.287408, 0, 1, 0.2980392, 1,
-0.3423466, -0.2379726, -2.598487, 0, 1, 0.3058824, 1,
-0.3366801, -0.1642704, -1.297894, 0, 1, 0.3098039, 1,
-0.3361263, -0.6524472, -4.454667, 0, 1, 0.3176471, 1,
-0.3359502, 0.6085494, -1.043346, 0, 1, 0.3215686, 1,
-0.3347671, -1.158366, -2.715144, 0, 1, 0.3294118, 1,
-0.3343187, 0.7911746, 0.5591412, 0, 1, 0.3333333, 1,
-0.3313318, 0.4418516, -2.863602, 0, 1, 0.3411765, 1,
-0.329712, -0.2149994, -3.624759, 0, 1, 0.345098, 1,
-0.325058, 0.8737774, -0.765345, 0, 1, 0.3529412, 1,
-0.3225369, -0.2370798, -1.930525, 0, 1, 0.3568628, 1,
-0.3221855, 1.347577, -0.5202892, 0, 1, 0.3647059, 1,
-0.3192145, 1.544464, -0.7119384, 0, 1, 0.3686275, 1,
-0.3145926, -2.259713, -1.879454, 0, 1, 0.3764706, 1,
-0.3071784, -0.06097296, -3.052836, 0, 1, 0.3803922, 1,
-0.3068135, -0.2594582, -1.85491, 0, 1, 0.3882353, 1,
-0.3023851, 0.431789, 0.8710783, 0, 1, 0.3921569, 1,
-0.2991292, -0.5415766, -3.838133, 0, 1, 0.4, 1,
-0.2942689, 2.094858, -1.806015, 0, 1, 0.4078431, 1,
-0.2926967, -0.8144201, -3.420619, 0, 1, 0.4117647, 1,
-0.2926542, -0.8077243, -2.873762, 0, 1, 0.4196078, 1,
-0.2912393, -0.2171879, -2.293844, 0, 1, 0.4235294, 1,
-0.2903064, -1.527347, -3.34052, 0, 1, 0.4313726, 1,
-0.2889447, -1.060179, -2.88676, 0, 1, 0.4352941, 1,
-0.2840085, 0.3722239, -0.3889726, 0, 1, 0.4431373, 1,
-0.2836767, -0.834415, -2.906055, 0, 1, 0.4470588, 1,
-0.2815064, 0.1518593, -1.29512, 0, 1, 0.454902, 1,
-0.2801343, -1.669412, -3.381768, 0, 1, 0.4588235, 1,
-0.2754679, -0.7209575, -3.686163, 0, 1, 0.4666667, 1,
-0.2737269, -1.125333, -4.228925, 0, 1, 0.4705882, 1,
-0.2737149, -1.851354, -3.047595, 0, 1, 0.4784314, 1,
-0.2659458, 0.2962783, 1.928992, 0, 1, 0.4823529, 1,
-0.2455841, 0.3924691, -0.8224543, 0, 1, 0.4901961, 1,
-0.2387273, 0.5115329, -0.6647578, 0, 1, 0.4941176, 1,
-0.2380802, 0.07486402, -2.053668, 0, 1, 0.5019608, 1,
-0.2376727, 0.0358438, -1.117049, 0, 1, 0.509804, 1,
-0.2369066, 0.7996296, -0.3268921, 0, 1, 0.5137255, 1,
-0.2336935, -1.825074, -3.547004, 0, 1, 0.5215687, 1,
-0.232986, -0.9886512, -2.514378, 0, 1, 0.5254902, 1,
-0.231645, -0.1283457, -2.637032, 0, 1, 0.5333334, 1,
-0.2296431, 1.529109, -0.8966349, 0, 1, 0.5372549, 1,
-0.2283579, -0.2277799, -3.759, 0, 1, 0.5450981, 1,
-0.2282233, -1.141476, -3.797207, 0, 1, 0.5490196, 1,
-0.2274392, -1.047581, -1.648504, 0, 1, 0.5568628, 1,
-0.2244831, -1.134845, -2.845597, 0, 1, 0.5607843, 1,
-0.2218698, 0.709819, -1.691281, 0, 1, 0.5686275, 1,
-0.2204915, -0.3498727, -1.82174, 0, 1, 0.572549, 1,
-0.213978, -0.2689473, -1.921912, 0, 1, 0.5803922, 1,
-0.2079987, -0.04155399, -2.58697, 0, 1, 0.5843138, 1,
-0.2015381, -0.5445309, -3.047409, 0, 1, 0.5921569, 1,
-0.2006295, -0.352181, -2.376228, 0, 1, 0.5960785, 1,
-0.1955337, -0.5546153, -4.39182, 0, 1, 0.6039216, 1,
-0.1929721, -1.891732, -5.160979, 0, 1, 0.6117647, 1,
-0.1792511, -1.699837, -4.533422, 0, 1, 0.6156863, 1,
-0.1760377, 0.1985088, -0.4329869, 0, 1, 0.6235294, 1,
-0.1760262, -1.100155, -4.324589, 0, 1, 0.627451, 1,
-0.1703178, 1.481159, -0.249699, 0, 1, 0.6352941, 1,
-0.1669227, -0.9306043, -2.282859, 0, 1, 0.6392157, 1,
-0.1663522, 0.8279254, 1.276134, 0, 1, 0.6470588, 1,
-0.1658295, -0.4397994, -3.397409, 0, 1, 0.6509804, 1,
-0.1652538, 0.5290397, -0.3591644, 0, 1, 0.6588235, 1,
-0.1631254, -0.5206802, -2.163132, 0, 1, 0.6627451, 1,
-0.1602442, -2.286257, -3.542974, 0, 1, 0.6705883, 1,
-0.1596894, 0.2442904, -1.386259, 0, 1, 0.6745098, 1,
-0.1534794, -1.601326, -4.603684, 0, 1, 0.682353, 1,
-0.1500711, 0.3839591, -1.130695, 0, 1, 0.6862745, 1,
-0.1491324, -0.3783938, -3.477264, 0, 1, 0.6941177, 1,
-0.1466371, 0.2244273, -0.1631886, 0, 1, 0.7019608, 1,
-0.1454588, 0.5672566, -0.04691541, 0, 1, 0.7058824, 1,
-0.144944, -0.8323731, -2.095101, 0, 1, 0.7137255, 1,
-0.1363233, 2.005728, 0.4501654, 0, 1, 0.7176471, 1,
-0.1340694, -0.1604983, -2.14627, 0, 1, 0.7254902, 1,
-0.1336362, 0.8688251, 0.6142682, 0, 1, 0.7294118, 1,
-0.1308869, 1.473806, -0.5226741, 0, 1, 0.7372549, 1,
-0.129511, -0.8783743, -3.028869, 0, 1, 0.7411765, 1,
-0.1276626, -0.5876301, -3.686256, 0, 1, 0.7490196, 1,
-0.1260147, 1.433504, 0.5909626, 0, 1, 0.7529412, 1,
-0.1253229, 1.450698, -0.0551469, 0, 1, 0.7607843, 1,
-0.1239917, 0.03598047, 1.248137, 0, 1, 0.7647059, 1,
-0.1177939, 1.21839, -0.652122, 0, 1, 0.772549, 1,
-0.1117442, -0.1037293, -1.993473, 0, 1, 0.7764706, 1,
-0.1053579, -0.540086, -3.779918, 0, 1, 0.7843137, 1,
-0.1041114, -1.159709, -2.207426, 0, 1, 0.7882353, 1,
-0.1029012, 0.1836871, 0.2388011, 0, 1, 0.7960784, 1,
-0.09914902, 1.370779, -0.9219763, 0, 1, 0.8039216, 1,
-0.09837624, -1.000682, -2.880447, 0, 1, 0.8078431, 1,
-0.09641183, -0.6481381, -2.173022, 0, 1, 0.8156863, 1,
-0.09465529, -0.4014944, -2.647282, 0, 1, 0.8196079, 1,
-0.08868965, 0.2806671, 0.4706045, 0, 1, 0.827451, 1,
-0.08396823, 0.6099906, 2.335459, 0, 1, 0.8313726, 1,
-0.07374056, 1.03584, 0.6012175, 0, 1, 0.8392157, 1,
-0.06778429, -0.03112971, -2.726084, 0, 1, 0.8431373, 1,
-0.06293351, -0.8105758, -3.106757, 0, 1, 0.8509804, 1,
-0.05964585, 2.72485, -1.310209, 0, 1, 0.854902, 1,
-0.05632356, -0.7916275, -2.755762, 0, 1, 0.8627451, 1,
-0.05551413, -0.3247816, -3.317896, 0, 1, 0.8666667, 1,
-0.05211543, 1.184621, -0.1251293, 0, 1, 0.8745098, 1,
-0.04623706, -0.8103448, -3.048026, 0, 1, 0.8784314, 1,
-0.04430035, -0.03532267, -2.922808, 0, 1, 0.8862745, 1,
-0.04385202, -1.537405, -0.9540989, 0, 1, 0.8901961, 1,
-0.04380122, 0.248709, -0.6216946, 0, 1, 0.8980392, 1,
-0.04317688, 1.550274, 2.591604, 0, 1, 0.9058824, 1,
-0.04282915, -1.003012, -3.731889, 0, 1, 0.9098039, 1,
-0.03923592, -0.5317871, -1.988788, 0, 1, 0.9176471, 1,
-0.03689963, -2.070356, -2.845103, 0, 1, 0.9215686, 1,
-0.03611577, 1.813181, 0.7232425, 0, 1, 0.9294118, 1,
-0.03542701, 0.2439863, -2.117365, 0, 1, 0.9333333, 1,
-0.03326691, 2.404198, 0.5732899, 0, 1, 0.9411765, 1,
-0.0321225, 1.362502, 0.4266083, 0, 1, 0.945098, 1,
-0.02895437, 0.9379985, -0.5847121, 0, 1, 0.9529412, 1,
-0.02889284, -0.5470464, -1.846382, 0, 1, 0.9568627, 1,
-0.02683426, 0.8097488, 2.499597, 0, 1, 0.9647059, 1,
-0.02301285, 0.4507579, 0.06676531, 0, 1, 0.9686275, 1,
-0.02101159, -0.537737, -3.988006, 0, 1, 0.9764706, 1,
-0.01936393, -0.2993688, -2.187258, 0, 1, 0.9803922, 1,
-0.009332446, 2.269128, -1.622677, 0, 1, 0.9882353, 1,
-0.009087775, 0.814546, 1.674291, 0, 1, 0.9921569, 1,
-0.008897386, 0.6929738, -0.0433051, 0, 1, 1, 1,
-0.00766471, 0.9175968, 1.291111, 0, 0.9921569, 1, 1,
-0.007375743, -0.470346, -2.894814, 0, 0.9882353, 1, 1,
-0.006187877, 0.5845525, 0.0855168, 0, 0.9803922, 1, 1,
-0.005514249, -0.1833648, -2.336941, 0, 0.9764706, 1, 1,
-0.005064899, 0.7942489, -0.2647778, 0, 0.9686275, 1, 1,
0.007197651, 1.013864, -0.1692894, 0, 0.9647059, 1, 1,
0.01935431, -0.3482942, 4.397174, 0, 0.9568627, 1, 1,
0.02145849, -1.300641, 4.108871, 0, 0.9529412, 1, 1,
0.02243543, -0.6537813, 3.334391, 0, 0.945098, 1, 1,
0.02388487, 0.1306016, -0.4147752, 0, 0.9411765, 1, 1,
0.02624611, -1.363443, 3.907739, 0, 0.9333333, 1, 1,
0.02990698, 0.7644103, -0.9639995, 0, 0.9294118, 1, 1,
0.03005977, 2.06397, 0.7565367, 0, 0.9215686, 1, 1,
0.03657705, -0.4587223, 2.523424, 0, 0.9176471, 1, 1,
0.03734372, 0.1654726, -1.786597, 0, 0.9098039, 1, 1,
0.03873665, -1.806317, 2.223218, 0, 0.9058824, 1, 1,
0.0390448, 0.00899301, 2.455202, 0, 0.8980392, 1, 1,
0.04069237, 0.5762286, -0.007915938, 0, 0.8901961, 1, 1,
0.04302782, -1.082573, 3.671894, 0, 0.8862745, 1, 1,
0.04407893, -1.109037, 4.758946, 0, 0.8784314, 1, 1,
0.05328121, -0.1429868, 1.5154, 0, 0.8745098, 1, 1,
0.05495459, 0.6197819, -3.299894, 0, 0.8666667, 1, 1,
0.05881611, -2.416354, 2.445237, 0, 0.8627451, 1, 1,
0.05937979, -1.196894, 4.172841, 0, 0.854902, 1, 1,
0.06698424, -0.7386874, 4.017311, 0, 0.8509804, 1, 1,
0.06743661, -0.4154525, 2.627234, 0, 0.8431373, 1, 1,
0.06825375, 0.1694024, 1.395056, 0, 0.8392157, 1, 1,
0.07099399, -1.90402, 1.798977, 0, 0.8313726, 1, 1,
0.07185045, 0.4846091, -0.4507962, 0, 0.827451, 1, 1,
0.07327317, -0.7648041, 5.279359, 0, 0.8196079, 1, 1,
0.07352234, -1.633129, 3.468109, 0, 0.8156863, 1, 1,
0.07678367, 1.817341, 0.4050305, 0, 0.8078431, 1, 1,
0.07867923, -1.444184, 2.82188, 0, 0.8039216, 1, 1,
0.07948726, -0.08737355, 3.153561, 0, 0.7960784, 1, 1,
0.0822883, 1.703837, 0.7419854, 0, 0.7882353, 1, 1,
0.08245806, 0.8695716, -1.917001, 0, 0.7843137, 1, 1,
0.08287811, -0.7010117, 3.644623, 0, 0.7764706, 1, 1,
0.0832845, 1.393688, -0.316245, 0, 0.772549, 1, 1,
0.08536159, -0.8222541, 2.173434, 0, 0.7647059, 1, 1,
0.08885706, -1.564125, 4.377688, 0, 0.7607843, 1, 1,
0.09239169, -1.747258, 2.26096, 0, 0.7529412, 1, 1,
0.09339193, -0.1938864, 1.919054, 0, 0.7490196, 1, 1,
0.09423902, -0.2790974, 2.978421, 0, 0.7411765, 1, 1,
0.09830739, -0.9827513, 3.312809, 0, 0.7372549, 1, 1,
0.09851959, 0.5679997, -0.9522779, 0, 0.7294118, 1, 1,
0.101446, 0.3280829, -1.052861, 0, 0.7254902, 1, 1,
0.1018464, -1.923985, 1.509993, 0, 0.7176471, 1, 1,
0.1035629, 1.404511, 1.161693, 0, 0.7137255, 1, 1,
0.1083206, 1.263481, -0.5191408, 0, 0.7058824, 1, 1,
0.1099859, -1.753766, 3.269338, 0, 0.6980392, 1, 1,
0.1105284, 0.4030829, -0.08610645, 0, 0.6941177, 1, 1,
0.1105668, 0.6552823, -1.014657, 0, 0.6862745, 1, 1,
0.1116566, 0.2629251, 0.03323651, 0, 0.682353, 1, 1,
0.1126294, 1.665705, -0.6532918, 0, 0.6745098, 1, 1,
0.1152788, -0.5103388, 2.509561, 0, 0.6705883, 1, 1,
0.1162007, -0.735534, 1.174309, 0, 0.6627451, 1, 1,
0.1176082, -1.160494, 3.267542, 0, 0.6588235, 1, 1,
0.129624, -0.4406826, 3.392505, 0, 0.6509804, 1, 1,
0.130234, -0.721972, 2.682308, 0, 0.6470588, 1, 1,
0.1362576, 0.1184717, 0.1474153, 0, 0.6392157, 1, 1,
0.1367177, -1.191053, 1.482151, 0, 0.6352941, 1, 1,
0.137868, -0.7337304, 4.067573, 0, 0.627451, 1, 1,
0.1379698, 0.09929175, 0.3471219, 0, 0.6235294, 1, 1,
0.1382686, 0.7767079, 0.1817758, 0, 0.6156863, 1, 1,
0.138997, 0.2706391, 0.2704326, 0, 0.6117647, 1, 1,
0.1419459, -0.4554612, 3.236648, 0, 0.6039216, 1, 1,
0.1420359, 0.5473455, -1.443318, 0, 0.5960785, 1, 1,
0.1438146, 1.466904, -0.4944652, 0, 0.5921569, 1, 1,
0.1440666, -0.960435, 3.4053, 0, 0.5843138, 1, 1,
0.1450709, -3.206861, 2.247309, 0, 0.5803922, 1, 1,
0.1567234, 0.2834409, 0.5198869, 0, 0.572549, 1, 1,
0.1568809, 0.7551835, 0.4443189, 0, 0.5686275, 1, 1,
0.1576748, 0.02831007, 2.999071, 0, 0.5607843, 1, 1,
0.1584059, 1.274432, 0.9461154, 0, 0.5568628, 1, 1,
0.1593593, 0.0003453444, 1.808214, 0, 0.5490196, 1, 1,
0.1598301, -0.216454, 2.95107, 0, 0.5450981, 1, 1,
0.1604856, -1.723934, 3.333452, 0, 0.5372549, 1, 1,
0.1642478, -1.330451, 1.946275, 0, 0.5333334, 1, 1,
0.1646996, 0.3499497, 0.7325313, 0, 0.5254902, 1, 1,
0.1647948, 0.09085184, 1.479515, 0, 0.5215687, 1, 1,
0.1659153, -1.387333, 3.722728, 0, 0.5137255, 1, 1,
0.1716373, 0.7220127, -1.184061, 0, 0.509804, 1, 1,
0.171865, -0.2043265, 3.094178, 0, 0.5019608, 1, 1,
0.1721691, 1.195159, 1.254473, 0, 0.4941176, 1, 1,
0.1772174, 0.8385919, 0.9836456, 0, 0.4901961, 1, 1,
0.1781141, 0.5482144, 0.4233444, 0, 0.4823529, 1, 1,
0.1813564, 0.1000121, 0.5105801, 0, 0.4784314, 1, 1,
0.1837951, -1.513888, 4.645219, 0, 0.4705882, 1, 1,
0.1921453, -0.4535424, 4.104447, 0, 0.4666667, 1, 1,
0.1938505, 1.201776, -0.03932444, 0, 0.4588235, 1, 1,
0.1938897, -1.913294, 3.424383, 0, 0.454902, 1, 1,
0.1947159, 0.5341505, 0.2734408, 0, 0.4470588, 1, 1,
0.1968352, 1.081315, -1.234647, 0, 0.4431373, 1, 1,
0.2035759, -0.9770089, 3.158326, 0, 0.4352941, 1, 1,
0.2079246, -0.4590912, 2.244711, 0, 0.4313726, 1, 1,
0.2101141, 0.2228566, 1.041695, 0, 0.4235294, 1, 1,
0.2113592, 0.4398829, 0.7263131, 0, 0.4196078, 1, 1,
0.2150331, 0.04287339, 1.866331, 0, 0.4117647, 1, 1,
0.2152423, 1.247068, -0.4363443, 0, 0.4078431, 1, 1,
0.2175863, 0.003982521, 0.1584184, 0, 0.4, 1, 1,
0.217893, 0.3185274, 0.2599317, 0, 0.3921569, 1, 1,
0.2180633, -0.1264514, -0.448887, 0, 0.3882353, 1, 1,
0.219781, 1.233829, 0.609314, 0, 0.3803922, 1, 1,
0.2198997, -0.1205633, 0.6935959, 0, 0.3764706, 1, 1,
0.2226056, -1.165915, 1.912894, 0, 0.3686275, 1, 1,
0.2233046, 0.07392298, -0.6217331, 0, 0.3647059, 1, 1,
0.2247302, 1.561273, -7.470554e-05, 0, 0.3568628, 1, 1,
0.2352263, -1.770882, 2.8281, 0, 0.3529412, 1, 1,
0.2393737, -0.7314263, 3.733476, 0, 0.345098, 1, 1,
0.2470419, -0.7348416, 2.522519, 0, 0.3411765, 1, 1,
0.2475767, 0.5588163, -0.400695, 0, 0.3333333, 1, 1,
0.2548961, 0.01042814, 1.179949, 0, 0.3294118, 1, 1,
0.2558457, -3.434228, 3.152022, 0, 0.3215686, 1, 1,
0.2561469, -0.5138829, 3.739115, 0, 0.3176471, 1, 1,
0.2593331, 1.208192, 0.9480289, 0, 0.3098039, 1, 1,
0.2617512, -0.09487726, 1.553268, 0, 0.3058824, 1, 1,
0.2680399, -0.4692435, 2.268766, 0, 0.2980392, 1, 1,
0.2697894, -0.968744, 3.408733, 0, 0.2901961, 1, 1,
0.2700065, -1.093455, 3.426838, 0, 0.2862745, 1, 1,
0.2749023, -0.9403669, 3.371827, 0, 0.2784314, 1, 1,
0.2815281, -1.167308, 2.652766, 0, 0.2745098, 1, 1,
0.283305, -1.075984, 3.130005, 0, 0.2666667, 1, 1,
0.2839009, -1.574378, 3.551413, 0, 0.2627451, 1, 1,
0.2850316, 1.132554, -0.3513848, 0, 0.254902, 1, 1,
0.2853865, -0.9065879, 2.982705, 0, 0.2509804, 1, 1,
0.2871753, 0.1937666, 1.288135, 0, 0.2431373, 1, 1,
0.2896299, 0.3728384, 0.5045292, 0, 0.2392157, 1, 1,
0.2967414, -0.05629464, 1.352714, 0, 0.2313726, 1, 1,
0.2980064, 0.3279901, 0.9036147, 0, 0.227451, 1, 1,
0.3003875, -0.2902755, 2.76169, 0, 0.2196078, 1, 1,
0.3007873, 0.2809659, 0.02082802, 0, 0.2156863, 1, 1,
0.3016814, -0.8425091, 2.997946, 0, 0.2078431, 1, 1,
0.3074663, -0.4640331, 2.319851, 0, 0.2039216, 1, 1,
0.3079965, -0.937129, 1.644862, 0, 0.1960784, 1, 1,
0.310916, 0.562685, 0.3017738, 0, 0.1882353, 1, 1,
0.3123552, -0.3959002, 1.860593, 0, 0.1843137, 1, 1,
0.3163843, 1.764478, 0.3947077, 0, 0.1764706, 1, 1,
0.3176513, -0.9725682, 3.663563, 0, 0.172549, 1, 1,
0.3196225, 0.2028828, 2.130251, 0, 0.1647059, 1, 1,
0.3249866, 0.8900297, 1.34794, 0, 0.1607843, 1, 1,
0.3253796, -0.3283769, 1.895543, 0, 0.1529412, 1, 1,
0.3270722, -0.9427996, 2.743135, 0, 0.1490196, 1, 1,
0.3289244, 0.4305528, 0.8495207, 0, 0.1411765, 1, 1,
0.336525, 0.6213859, 0.7819728, 0, 0.1372549, 1, 1,
0.3374026, -0.3721277, 2.808957, 0, 0.1294118, 1, 1,
0.3377794, 1.008818, -1.449535, 0, 0.1254902, 1, 1,
0.3414631, 1.151012, -1.01724, 0, 0.1176471, 1, 1,
0.3448454, 1.51588, -0.4627591, 0, 0.1137255, 1, 1,
0.348519, 0.190969, 0.9400445, 0, 0.1058824, 1, 1,
0.348711, -0.5413254, 1.354231, 0, 0.09803922, 1, 1,
0.3528539, 0.6064228, 1.147986, 0, 0.09411765, 1, 1,
0.3592389, -0.5802124, 3.122837, 0, 0.08627451, 1, 1,
0.3616075, -0.2293851, 1.484458, 0, 0.08235294, 1, 1,
0.3663913, -0.637529, 3.188037, 0, 0.07450981, 1, 1,
0.3689483, 1.799007, -0.4927807, 0, 0.07058824, 1, 1,
0.3700859, -0.1507319, 0.06161396, 0, 0.0627451, 1, 1,
0.3758688, -1.378038, 2.673432, 0, 0.05882353, 1, 1,
0.3780613, 1.035038, -0.1333077, 0, 0.05098039, 1, 1,
0.3788438, 0.224248, 0.02336444, 0, 0.04705882, 1, 1,
0.3825427, 0.3258164, 1.866454, 0, 0.03921569, 1, 1,
0.3966765, 0.3947602, 2.158348, 0, 0.03529412, 1, 1,
0.3977811, -0.9006919, 3.365402, 0, 0.02745098, 1, 1,
0.4003803, -0.807003, 3.833412, 0, 0.02352941, 1, 1,
0.400397, -0.8403618, 1.808268, 0, 0.01568628, 1, 1,
0.40113, -0.2872935, 3.141036, 0, 0.01176471, 1, 1,
0.4027143, 0.05795779, 2.387629, 0, 0.003921569, 1, 1,
0.4041952, 2.160007, 1.795994, 0.003921569, 0, 1, 1,
0.4091342, 0.5551254, 1.310101, 0.007843138, 0, 1, 1,
0.4120182, -0.3672793, 1.963246, 0.01568628, 0, 1, 1,
0.412418, 0.6738603, 1.22709, 0.01960784, 0, 1, 1,
0.4141591, 0.4256083, 0.02276577, 0.02745098, 0, 1, 1,
0.420487, -1.503172, 3.051332, 0.03137255, 0, 1, 1,
0.4348082, 0.4959213, 1.133023, 0.03921569, 0, 1, 1,
0.4364913, -0.8640419, 2.651371, 0.04313726, 0, 1, 1,
0.4391456, 2.466138, 0.985459, 0.05098039, 0, 1, 1,
0.4399061, -0.1489794, 3.214412, 0.05490196, 0, 1, 1,
0.4414946, -2.853059, 3.831381, 0.0627451, 0, 1, 1,
0.441903, 0.01273693, 1.09878, 0.06666667, 0, 1, 1,
0.442257, 0.3045749, 1.536699, 0.07450981, 0, 1, 1,
0.4423026, 1.967111, -0.04903419, 0.07843138, 0, 1, 1,
0.4433601, -1.288424, 2.33463, 0.08627451, 0, 1, 1,
0.4497142, -1.181896, 2.594348, 0.09019608, 0, 1, 1,
0.4629041, -0.1381526, 0.644007, 0.09803922, 0, 1, 1,
0.465509, 0.4657648, 0.8659591, 0.1058824, 0, 1, 1,
0.4658623, 1.827963, 2.66853, 0.1098039, 0, 1, 1,
0.4674333, -1.028137, 3.537343, 0.1176471, 0, 1, 1,
0.4705232, -0.2762438, 2.891218, 0.1215686, 0, 1, 1,
0.4730811, 0.8660474, 1.014798, 0.1294118, 0, 1, 1,
0.475029, 0.3048262, 1.844863, 0.1333333, 0, 1, 1,
0.4782606, 0.1406065, 0.2148627, 0.1411765, 0, 1, 1,
0.4849819, -0.7200374, 1.62197, 0.145098, 0, 1, 1,
0.4852595, -0.3068849, 2.815453, 0.1529412, 0, 1, 1,
0.488726, 0.9475064, -0.4926812, 0.1568628, 0, 1, 1,
0.4923253, 0.0460747, 2.094722, 0.1647059, 0, 1, 1,
0.4930217, 0.3994064, -0.2453385, 0.1686275, 0, 1, 1,
0.4951046, 0.810436, 1.111411, 0.1764706, 0, 1, 1,
0.4956771, 0.3375941, 0.6611483, 0.1803922, 0, 1, 1,
0.5087482, -1.217504, 2.6379, 0.1882353, 0, 1, 1,
0.5094592, 0.08612391, 0.8621914, 0.1921569, 0, 1, 1,
0.5096047, -0.4622995, 0.7840554, 0.2, 0, 1, 1,
0.5101011, 0.3332361, 1.3592, 0.2078431, 0, 1, 1,
0.5101978, 1.018322, 0.4920403, 0.2117647, 0, 1, 1,
0.510736, 0.1671135, 1.203985, 0.2196078, 0, 1, 1,
0.5130948, -1.200841, 3.081654, 0.2235294, 0, 1, 1,
0.5199262, 0.5203631, 0.3661375, 0.2313726, 0, 1, 1,
0.5225544, 1.78885, 0.9109865, 0.2352941, 0, 1, 1,
0.524053, 1.490872, -0.1939631, 0.2431373, 0, 1, 1,
0.5263244, -0.7516094, 2.228872, 0.2470588, 0, 1, 1,
0.5269158, 0.3811223, -0.08146231, 0.254902, 0, 1, 1,
0.5291137, -1.074671, 2.519327, 0.2588235, 0, 1, 1,
0.5294923, -0.09393713, 1.996868, 0.2666667, 0, 1, 1,
0.5378477, 0.4693185, 1.575327, 0.2705882, 0, 1, 1,
0.5382237, -0.4555117, 2.982435, 0.2784314, 0, 1, 1,
0.5394042, 0.4670933, -0.4672873, 0.282353, 0, 1, 1,
0.5413373, 0.1057559, -0.5833587, 0.2901961, 0, 1, 1,
0.5460787, 2.147695, -0.4232852, 0.2941177, 0, 1, 1,
0.5466896, 0.7610804, -0.5623474, 0.3019608, 0, 1, 1,
0.5526872, -0.01584991, 1.944952, 0.3098039, 0, 1, 1,
0.5579208, -1.524882, 3.332145, 0.3137255, 0, 1, 1,
0.5611947, -0.3435296, 1.739722, 0.3215686, 0, 1, 1,
0.5626181, 0.1913211, 3.074361, 0.3254902, 0, 1, 1,
0.5652469, 1.922146, -0.01113206, 0.3333333, 0, 1, 1,
0.5668358, 1.037018, 1.44555, 0.3372549, 0, 1, 1,
0.5681805, -0.4569659, 2.592683, 0.345098, 0, 1, 1,
0.5700188, 1.077407, 0.01662357, 0.3490196, 0, 1, 1,
0.5737349, -2.225912, 4.139951, 0.3568628, 0, 1, 1,
0.5761846, 0.3792987, 0.07711189, 0.3607843, 0, 1, 1,
0.5778989, 0.3955277, 0.418954, 0.3686275, 0, 1, 1,
0.5847418, -1.301309, 2.348656, 0.372549, 0, 1, 1,
0.589054, 0.3388442, 0.7252918, 0.3803922, 0, 1, 1,
0.5918878, -1.050359, 2.963196, 0.3843137, 0, 1, 1,
0.5933654, 0.4348553, 0.7358907, 0.3921569, 0, 1, 1,
0.5940868, -0.1612537, 1.494912, 0.3960784, 0, 1, 1,
0.5946337, -0.2179849, 0.8929923, 0.4039216, 0, 1, 1,
0.6045969, -0.5378874, 3.6772, 0.4117647, 0, 1, 1,
0.6056597, 0.1266587, 1.790269, 0.4156863, 0, 1, 1,
0.6087126, -1.411582, 3.539906, 0.4235294, 0, 1, 1,
0.612111, -0.1265656, 0.9418966, 0.427451, 0, 1, 1,
0.6131509, 1.057954, 0.7014703, 0.4352941, 0, 1, 1,
0.6135811, -1.903395, 2.350214, 0.4392157, 0, 1, 1,
0.6158566, 0.9171191, 1.911815, 0.4470588, 0, 1, 1,
0.6162474, 2.576643, -1.371334, 0.4509804, 0, 1, 1,
0.6230098, -0.6447149, 4.717868, 0.4588235, 0, 1, 1,
0.6237091, 1.299024, 0.09639629, 0.4627451, 0, 1, 1,
0.6273497, -0.7712018, 1.469595, 0.4705882, 0, 1, 1,
0.6417574, -0.5817038, 1.719629, 0.4745098, 0, 1, 1,
0.643212, -0.837764, 0.4222943, 0.4823529, 0, 1, 1,
0.6446652, 0.5267166, -1.515689, 0.4862745, 0, 1, 1,
0.6480355, 0.0439194, 1.143134, 0.4941176, 0, 1, 1,
0.65598, 1.265849, -0.2170466, 0.5019608, 0, 1, 1,
0.6560559, 0.3999976, 0.5308147, 0.5058824, 0, 1, 1,
0.6607776, -0.04233188, 2.132828, 0.5137255, 0, 1, 1,
0.6619006, 0.2741881, 0.8801819, 0.5176471, 0, 1, 1,
0.6636581, -0.7597508, 2.153223, 0.5254902, 0, 1, 1,
0.6644579, -0.06309485, 3.516876, 0.5294118, 0, 1, 1,
0.6723664, 0.2896982, 1.452108, 0.5372549, 0, 1, 1,
0.6726961, -0.2843007, 1.058477, 0.5411765, 0, 1, 1,
0.674117, -0.3461416, 3.554439, 0.5490196, 0, 1, 1,
0.6800021, 1.598105, -0.3557632, 0.5529412, 0, 1, 1,
0.6803135, 0.825241, 2.572771, 0.5607843, 0, 1, 1,
0.6915507, -0.1247354, -0.453187, 0.5647059, 0, 1, 1,
0.6916775, 0.9020805, -0.9403787, 0.572549, 0, 1, 1,
0.691966, -0.5642644, 2.917161, 0.5764706, 0, 1, 1,
0.6926911, -0.05941388, 1.944296, 0.5843138, 0, 1, 1,
0.6946399, -0.6978816, 1.716512, 0.5882353, 0, 1, 1,
0.6951816, -0.08706538, 2.045811, 0.5960785, 0, 1, 1,
0.7006189, 0.518684, 1.08114, 0.6039216, 0, 1, 1,
0.7020887, 0.4174576, 0.4962893, 0.6078432, 0, 1, 1,
0.7120936, 1.650715, 0.6145722, 0.6156863, 0, 1, 1,
0.7180867, 0.8599754, 1.688606, 0.6196079, 0, 1, 1,
0.7194403, 0.1962057, -0.1816536, 0.627451, 0, 1, 1,
0.7213025, 2.030185, 0.3281657, 0.6313726, 0, 1, 1,
0.7220989, 0.7478289, 0.3125194, 0.6392157, 0, 1, 1,
0.7227895, -0.08192811, 2.96003, 0.6431373, 0, 1, 1,
0.7229603, 0.421822, 0.6380372, 0.6509804, 0, 1, 1,
0.7257274, 1.465134, 0.2433932, 0.654902, 0, 1, 1,
0.7286448, 0.4347789, 0.5261452, 0.6627451, 0, 1, 1,
0.7366695, -0.2337406, 1.943199, 0.6666667, 0, 1, 1,
0.7388908, 0.3806739, 1.429282, 0.6745098, 0, 1, 1,
0.7433481, 0.4390042, 0.899747, 0.6784314, 0, 1, 1,
0.7467716, -0.9994943, 3.365408, 0.6862745, 0, 1, 1,
0.7506416, -0.4242628, 2.357985, 0.6901961, 0, 1, 1,
0.7569112, -0.2018652, 0.3056485, 0.6980392, 0, 1, 1,
0.7587929, -2.851985, 1.663163, 0.7058824, 0, 1, 1,
0.758964, -0.4853673, 2.751904, 0.7098039, 0, 1, 1,
0.759344, 0.2092775, 1.548225, 0.7176471, 0, 1, 1,
0.7747191, -0.5703869, 0.334092, 0.7215686, 0, 1, 1,
0.7755268, -0.2221721, 3.607632, 0.7294118, 0, 1, 1,
0.7786837, 0.01099366, 1.563614, 0.7333333, 0, 1, 1,
0.7845402, -2.232752, 4.750353, 0.7411765, 0, 1, 1,
0.786043, -0.7127718, 0.5415298, 0.7450981, 0, 1, 1,
0.7862641, -1.060426, 3.943557, 0.7529412, 0, 1, 1,
0.7933882, -0.4876018, 1.586811, 0.7568628, 0, 1, 1,
0.797507, -0.4239827, 1.807623, 0.7647059, 0, 1, 1,
0.7978761, 0.9405675, 0.3452992, 0.7686275, 0, 1, 1,
0.8004159, -0.7784607, 3.397394, 0.7764706, 0, 1, 1,
0.8057199, -0.7517862, 2.106146, 0.7803922, 0, 1, 1,
0.8106461, -1.839335, 2.163741, 0.7882353, 0, 1, 1,
0.8125257, -0.01271549, 1.839574, 0.7921569, 0, 1, 1,
0.8158278, 0.5300092, 1.577357, 0.8, 0, 1, 1,
0.8161458, -1.268317, 2.748582, 0.8078431, 0, 1, 1,
0.8191429, 0.4248598, 0.6458684, 0.8117647, 0, 1, 1,
0.8208535, 0.7735342, 2.262036, 0.8196079, 0, 1, 1,
0.8235955, -1.637328, 2.902575, 0.8235294, 0, 1, 1,
0.8265817, -0.4140567, 3.116452, 0.8313726, 0, 1, 1,
0.8268917, 1.382934, 0.2443379, 0.8352941, 0, 1, 1,
0.8278744, -0.871567, 1.945433, 0.8431373, 0, 1, 1,
0.8313254, -0.7242194, 3.145791, 0.8470588, 0, 1, 1,
0.8349975, -0.04453032, 0.7023809, 0.854902, 0, 1, 1,
0.8375682, 0.07366012, 1.920826, 0.8588235, 0, 1, 1,
0.8434702, 1.850487, -0.2719708, 0.8666667, 0, 1, 1,
0.8443831, 0.8580427, 1.372624, 0.8705882, 0, 1, 1,
0.8510765, -0.2507522, 3.662228, 0.8784314, 0, 1, 1,
0.8636993, -0.661073, 3.890477, 0.8823529, 0, 1, 1,
0.867338, 1.31901, 1.739751, 0.8901961, 0, 1, 1,
0.8705046, -0.9121565, 2.18536, 0.8941177, 0, 1, 1,
0.8717312, 0.1991304, 1.573698, 0.9019608, 0, 1, 1,
0.8736796, 0.1011078, 0.7103302, 0.9098039, 0, 1, 1,
0.8785406, -1.164559, 1.845071, 0.9137255, 0, 1, 1,
0.893775, -1.012168, 3.382619, 0.9215686, 0, 1, 1,
0.8946415, 0.8588385, 1.035197, 0.9254902, 0, 1, 1,
0.8981707, -0.256301, 2.16539, 0.9333333, 0, 1, 1,
0.9024971, 1.486584, 0.07316186, 0.9372549, 0, 1, 1,
0.9043483, 0.2817971, 1.225269, 0.945098, 0, 1, 1,
0.9080803, 0.6037005, 0.5483103, 0.9490196, 0, 1, 1,
0.908949, 1.512107, -0.692301, 0.9568627, 0, 1, 1,
0.9149474, -0.5799033, 3.119826, 0.9607843, 0, 1, 1,
0.9174483, 1.33173, 0.9955921, 0.9686275, 0, 1, 1,
0.9200115, -0.3718577, 1.584899, 0.972549, 0, 1, 1,
0.9228864, 0.8507788, 0.1815174, 0.9803922, 0, 1, 1,
0.9268888, -1.394628, 4.857554, 0.9843137, 0, 1, 1,
0.9347421, 0.3534625, 0.5495806, 0.9921569, 0, 1, 1,
0.9363175, -0.7170498, 5.110063, 0.9960784, 0, 1, 1,
0.9374251, 0.2124758, 0.1049324, 1, 0, 0.9960784, 1,
0.9417697, -0.4947431, 4.162612, 1, 0, 0.9882353, 1,
0.9475883, 2.141467, 0.3447828, 1, 0, 0.9843137, 1,
0.9489945, -0.0757068, 2.499929, 1, 0, 0.9764706, 1,
0.9498137, 1.35122, -0.1512982, 1, 0, 0.972549, 1,
0.9570362, 0.426597, 3.218525, 1, 0, 0.9647059, 1,
0.9590734, 0.1626403, 0.567477, 1, 0, 0.9607843, 1,
0.9625947, -0.03708872, 2.182053, 1, 0, 0.9529412, 1,
0.9633352, -1.675374, 2.140773, 1, 0, 0.9490196, 1,
0.9735425, 1.109875, 0.9133042, 1, 0, 0.9411765, 1,
0.983052, -0.2480051, 2.070196, 1, 0, 0.9372549, 1,
0.9830598, 1.066538, -0.8620691, 1, 0, 0.9294118, 1,
0.9854319, -0.4539309, 1.068893, 1, 0, 0.9254902, 1,
0.9895595, 0.2751093, 1.179101, 1, 0, 0.9176471, 1,
0.9898421, 0.7809948, 0.1749682, 1, 0, 0.9137255, 1,
0.9899374, -0.3326903, 1.221886, 1, 0, 0.9058824, 1,
0.9918692, 2.225163, 1.660657, 1, 0, 0.9019608, 1,
0.9945027, 0.1375381, 0.8015988, 1, 0, 0.8941177, 1,
1.00015, -0.621048, 2.867853, 1, 0, 0.8862745, 1,
1.003885, 0.5147699, 1.413805, 1, 0, 0.8823529, 1,
1.012739, 1.5934, 0.5267973, 1, 0, 0.8745098, 1,
1.015645, -2.314731, 2.950495, 1, 0, 0.8705882, 1,
1.020334, 0.7141573, 0.9448422, 1, 0, 0.8627451, 1,
1.024281, -0.08700915, 0.8813993, 1, 0, 0.8588235, 1,
1.025132, -0.8508478, 3.783287, 1, 0, 0.8509804, 1,
1.031361, -1.965321, 2.562575, 1, 0, 0.8470588, 1,
1.034126, 0.5432856, -1.407637, 1, 0, 0.8392157, 1,
1.039406, -1.339217, 0.8242751, 1, 0, 0.8352941, 1,
1.041229, 0.2959949, -0.363317, 1, 0, 0.827451, 1,
1.044292, -0.3718763, 3.270471, 1, 0, 0.8235294, 1,
1.04753, -3.097303, 2.690556, 1, 0, 0.8156863, 1,
1.050149, 0.9062234, 0.2731333, 1, 0, 0.8117647, 1,
1.051294, 0.5691825, 3.01972, 1, 0, 0.8039216, 1,
1.058718, -0.4806575, 2.311313, 1, 0, 0.7960784, 1,
1.060232, 1.012456, 2.072001, 1, 0, 0.7921569, 1,
1.065337, 0.007782012, 1.693706, 1, 0, 0.7843137, 1,
1.067112, 0.4633535, -0.9324679, 1, 0, 0.7803922, 1,
1.07263, -1.413734, 0.6135734, 1, 0, 0.772549, 1,
1.077701, 0.1307184, 2.592497, 1, 0, 0.7686275, 1,
1.080681, -0.5661104, 0.3417532, 1, 0, 0.7607843, 1,
1.094709, -0.358951, 3.162674, 1, 0, 0.7568628, 1,
1.096728, 0.9313187, 1.184492, 1, 0, 0.7490196, 1,
1.099743, 1.809226, 1.062649, 1, 0, 0.7450981, 1,
1.104202, 1.889388, 1.488055, 1, 0, 0.7372549, 1,
1.112954, 0.7183551, 1.58287, 1, 0, 0.7333333, 1,
1.113915, -1.164603, 1.874215, 1, 0, 0.7254902, 1,
1.118373, 0.2531267, 1.438874, 1, 0, 0.7215686, 1,
1.123036, 0.02114123, 1.586223, 1, 0, 0.7137255, 1,
1.124343, -0.6553264, 1.247213, 1, 0, 0.7098039, 1,
1.125238, -0.08233992, -0.4485109, 1, 0, 0.7019608, 1,
1.12574, -0.1549401, 0.405608, 1, 0, 0.6941177, 1,
1.127845, -2.055431, 2.423589, 1, 0, 0.6901961, 1,
1.128371, 0.4731807, 0.3350852, 1, 0, 0.682353, 1,
1.132837, 0.5522358, 0.8955579, 1, 0, 0.6784314, 1,
1.147895, 0.8222724, -0.7358422, 1, 0, 0.6705883, 1,
1.149965, 0.7864057, 1.006649, 1, 0, 0.6666667, 1,
1.159669, -0.08245966, 0.04651899, 1, 0, 0.6588235, 1,
1.159682, 0.1183386, 0.5454695, 1, 0, 0.654902, 1,
1.163019, 0.497307, 1.917362, 1, 0, 0.6470588, 1,
1.164255, -0.7774205, 2.237123, 1, 0, 0.6431373, 1,
1.173856, -0.5206915, 1.868088, 1, 0, 0.6352941, 1,
1.175898, -0.1423468, 2.414737, 1, 0, 0.6313726, 1,
1.176671, -1.38332, 1.068207, 1, 0, 0.6235294, 1,
1.1773, 1.400881, 0.382677, 1, 0, 0.6196079, 1,
1.177764, -0.6610772, 1.551009, 1, 0, 0.6117647, 1,
1.204149, 0.6739858, 1.047325, 1, 0, 0.6078432, 1,
1.216075, -0.1365835, 2.355242, 1, 0, 0.6, 1,
1.226421, 2.512575, -1.313273, 1, 0, 0.5921569, 1,
1.228416, -0.3817931, 3.377859, 1, 0, 0.5882353, 1,
1.238772, -1.379482, 2.723046, 1, 0, 0.5803922, 1,
1.239371, 1.21115, 0.6402898, 1, 0, 0.5764706, 1,
1.24092, 0.2138887, 1.436821, 1, 0, 0.5686275, 1,
1.250737, 0.3811555, 1.169969, 1, 0, 0.5647059, 1,
1.282496, -0.02533228, 1.507155, 1, 0, 0.5568628, 1,
1.284292, 1.285652, 1.65433, 1, 0, 0.5529412, 1,
1.292117, -0.2327386, 1.184242, 1, 0, 0.5450981, 1,
1.292225, 1.746387, 0.08230276, 1, 0, 0.5411765, 1,
1.296054, -1.225134, 2.507043, 1, 0, 0.5333334, 1,
1.297248, 0.6385841, -0.01616462, 1, 0, 0.5294118, 1,
1.302363, 0.1530446, 1.376588, 1, 0, 0.5215687, 1,
1.308108, 0.5458152, 0.6432523, 1, 0, 0.5176471, 1,
1.315877, -0.3634214, 2.398195, 1, 0, 0.509804, 1,
1.316224, 1.897798, 0.8811497, 1, 0, 0.5058824, 1,
1.32367, -1.43831, 0.7333277, 1, 0, 0.4980392, 1,
1.327279, 0.517758, 0.7465246, 1, 0, 0.4901961, 1,
1.330239, 0.6940213, 2.47693, 1, 0, 0.4862745, 1,
1.333887, -0.8255644, 2.717082, 1, 0, 0.4784314, 1,
1.337808, 0.1360801, 1.56626, 1, 0, 0.4745098, 1,
1.348844, 0.501585, 0.8780312, 1, 0, 0.4666667, 1,
1.353054, -0.6157531, 2.615897, 1, 0, 0.4627451, 1,
1.354766, 0.9849159, -0.3058984, 1, 0, 0.454902, 1,
1.357494, -0.9159117, 2.854881, 1, 0, 0.4509804, 1,
1.375236, 0.9322705, 1.683552, 1, 0, 0.4431373, 1,
1.385642, 1.985571, 0.9512827, 1, 0, 0.4392157, 1,
1.391352, -1.037113, 2.051292, 1, 0, 0.4313726, 1,
1.395331, -0.08595673, 2.145077, 1, 0, 0.427451, 1,
1.40016, 1.065775, -1.311749, 1, 0, 0.4196078, 1,
1.407272, 0.6396083, 1.946922, 1, 0, 0.4156863, 1,
1.434497, -0.7597411, 1.569704, 1, 0, 0.4078431, 1,
1.456235, 2.662325, 0.3760957, 1, 0, 0.4039216, 1,
1.460366, 1.080062, -1.237387, 1, 0, 0.3960784, 1,
1.461319, 1.898105, 0.5645119, 1, 0, 0.3882353, 1,
1.480519, -1.183592, 0.6170998, 1, 0, 0.3843137, 1,
1.493018, -0.5300813, 1.43688, 1, 0, 0.3764706, 1,
1.499103, -0.2386188, 1.154058, 1, 0, 0.372549, 1,
1.500765, -0.2496669, 2.586408, 1, 0, 0.3647059, 1,
1.510817, -1.362596, 2.295521, 1, 0, 0.3607843, 1,
1.515073, -0.2693401, 2.056435, 1, 0, 0.3529412, 1,
1.518363, 0.5626684, 1.154673, 1, 0, 0.3490196, 1,
1.527702, 0.6947697, 1.510812, 1, 0, 0.3411765, 1,
1.535246, 0.5857021, 1.451195, 1, 0, 0.3372549, 1,
1.536231, 0.8341093, 0.66074, 1, 0, 0.3294118, 1,
1.53861, 0.416334, 1.417997, 1, 0, 0.3254902, 1,
1.541866, 0.649442, 0.821577, 1, 0, 0.3176471, 1,
1.546121, 2.003719, 0.5205352, 1, 0, 0.3137255, 1,
1.57177, -0.8008947, 1.660611, 1, 0, 0.3058824, 1,
1.578707, -0.572744, 2.710417, 1, 0, 0.2980392, 1,
1.582602, 1.092726, 1.946818, 1, 0, 0.2941177, 1,
1.585521, -0.3593735, 0.958743, 1, 0, 0.2862745, 1,
1.593036, 1.314787, 0.2566924, 1, 0, 0.282353, 1,
1.595623, -0.8311378, 2.76241, 1, 0, 0.2745098, 1,
1.60053, 0.5057895, 0.1425701, 1, 0, 0.2705882, 1,
1.604127, -0.2283638, 2.916799, 1, 0, 0.2627451, 1,
1.61723, -0.4495352, 1.230643, 1, 0, 0.2588235, 1,
1.630794, 0.8728399, -0.3853403, 1, 0, 0.2509804, 1,
1.642432, -0.7806506, 3.767744, 1, 0, 0.2470588, 1,
1.647093, 0.546639, 0.294512, 1, 0, 0.2392157, 1,
1.647876, 1.953661, 0.6751284, 1, 0, 0.2352941, 1,
1.650917, -0.0911535, 4.10006, 1, 0, 0.227451, 1,
1.670561, -0.7209166, 2.374974, 1, 0, 0.2235294, 1,
1.681789, -1.669691, 2.493216, 1, 0, 0.2156863, 1,
1.689257, -1.180922, 0.6701475, 1, 0, 0.2117647, 1,
1.699779, -2.103888, 1.659301, 1, 0, 0.2039216, 1,
1.706035, -0.6181428, 1.338795, 1, 0, 0.1960784, 1,
1.711049, 0.2136671, 2.067594, 1, 0, 0.1921569, 1,
1.716386, -0.1183192, 1.967423, 1, 0, 0.1843137, 1,
1.716514, -1.736292, 2.728697, 1, 0, 0.1803922, 1,
1.717329, 0.4537217, 0.9049454, 1, 0, 0.172549, 1,
1.718926, -0.04649981, 0.02142621, 1, 0, 0.1686275, 1,
1.723567, -0.2780266, 2.274267, 1, 0, 0.1607843, 1,
1.733274, 0.1031857, 1.085759, 1, 0, 0.1568628, 1,
1.743354, 0.2457351, 2.257129, 1, 0, 0.1490196, 1,
1.76318, 0.619165, 1.924131, 1, 0, 0.145098, 1,
1.779601, 0.2359674, 1.539234, 1, 0, 0.1372549, 1,
1.780316, 1.479657, 1.042972, 1, 0, 0.1333333, 1,
1.794324, -0.3682473, 0.1258763, 1, 0, 0.1254902, 1,
1.797137, -1.053261, 1.688994, 1, 0, 0.1215686, 1,
1.809809, 0.8518306, 1.627025, 1, 0, 0.1137255, 1,
1.811275, -0.4465653, 1.881058, 1, 0, 0.1098039, 1,
1.811423, 0.6738905, 0.3981181, 1, 0, 0.1019608, 1,
1.869599, -1.091763, 3.208563, 1, 0, 0.09411765, 1,
1.930158, -0.4540153, 0.8398146, 1, 0, 0.09019608, 1,
1.930334, 1.557348, 1.199664, 1, 0, 0.08235294, 1,
2.040241, 0.2281802, 4.163002, 1, 0, 0.07843138, 1,
2.050853, -0.5804414, 1.877943, 1, 0, 0.07058824, 1,
2.059461, -1.311361, 2.203085, 1, 0, 0.06666667, 1,
2.075601, 0.1265581, 0.01820605, 1, 0, 0.05882353, 1,
2.157293, -0.1973391, 0.3693079, 1, 0, 0.05490196, 1,
2.204829, 0.03103911, 1.703372, 1, 0, 0.04705882, 1,
2.262982, 0.5284753, 3.133193, 1, 0, 0.04313726, 1,
2.276056, -0.3591471, 1.199955, 1, 0, 0.03529412, 1,
2.307533, 0.4212922, 1.221207, 1, 0, 0.03137255, 1,
2.3515, 1.095838, -0.06274697, 1, 0, 0.02352941, 1,
2.502626, 0.1284342, 1.367445, 1, 0, 0.01960784, 1,
2.607916, -0.2624645, 0.9852503, 1, 0, 0.01176471, 1,
2.925658, 1.373061, 2.287065, 1, 0, 0.007843138, 1
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
-0.0648334, -4.638076, -7.041165, 0, -0.5, 0.5, 0.5,
-0.0648334, -4.638076, -7.041165, 1, -0.5, 0.5, 0.5,
-0.0648334, -4.638076, -7.041165, 1, 1.5, 0.5, 0.5,
-0.0648334, -4.638076, -7.041165, 0, 1.5, 0.5, 0.5
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
-4.069101, 0.1169455, -7.041165, 0, -0.5, 0.5, 0.5,
-4.069101, 0.1169455, -7.041165, 1, -0.5, 0.5, 0.5,
-4.069101, 0.1169455, -7.041165, 1, 1.5, 0.5, 0.5,
-4.069101, 0.1169455, -7.041165, 0, 1.5, 0.5, 0.5
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
-4.069101, -4.638076, 0.01192689, 0, -0.5, 0.5, 0.5,
-4.069101, -4.638076, 0.01192689, 1, -0.5, 0.5, 0.5,
-4.069101, -4.638076, 0.01192689, 1, 1.5, 0.5, 0.5,
-4.069101, -4.638076, 0.01192689, 0, 1.5, 0.5, 0.5
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
-3, -3.540764, -5.413528,
2, -3.540764, -5.413528,
-3, -3.540764, -5.413528,
-3, -3.723649, -5.684801,
-2, -3.540764, -5.413528,
-2, -3.723649, -5.684801,
-1, -3.540764, -5.413528,
-1, -3.723649, -5.684801,
0, -3.540764, -5.413528,
0, -3.723649, -5.684801,
1, -3.540764, -5.413528,
1, -3.723649, -5.684801,
2, -3.540764, -5.413528,
2, -3.723649, -5.684801
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
-3, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
-3, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
-3, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
-3, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5,
-2, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
-2, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
-2, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
-2, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5,
-1, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
-1, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
-1, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
-1, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5,
0, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
0, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
0, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
0, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5,
1, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
1, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
1, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
1, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5,
2, -4.08942, -6.227347, 0, -0.5, 0.5, 0.5,
2, -4.08942, -6.227347, 1, -0.5, 0.5, 0.5,
2, -4.08942, -6.227347, 1, 1.5, 0.5, 0.5,
2, -4.08942, -6.227347, 0, 1.5, 0.5, 0.5
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
-3.145039, -2, -5.413528,
-3.145039, 2, -5.413528,
-3.145039, -2, -5.413528,
-3.299049, -2, -5.684801,
-3.145039, 0, -5.413528,
-3.299049, 0, -5.684801,
-3.145039, 2, -5.413528,
-3.299049, 2, -5.684801
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
-3.60707, -2, -6.227347, 0, -0.5, 0.5, 0.5,
-3.60707, -2, -6.227347, 1, -0.5, 0.5, 0.5,
-3.60707, -2, -6.227347, 1, 1.5, 0.5, 0.5,
-3.60707, -2, -6.227347, 0, 1.5, 0.5, 0.5,
-3.60707, 0, -6.227347, 0, -0.5, 0.5, 0.5,
-3.60707, 0, -6.227347, 1, -0.5, 0.5, 0.5,
-3.60707, 0, -6.227347, 1, 1.5, 0.5, 0.5,
-3.60707, 0, -6.227347, 0, 1.5, 0.5, 0.5,
-3.60707, 2, -6.227347, 0, -0.5, 0.5, 0.5,
-3.60707, 2, -6.227347, 1, -0.5, 0.5, 0.5,
-3.60707, 2, -6.227347, 1, 1.5, 0.5, 0.5,
-3.60707, 2, -6.227347, 0, 1.5, 0.5, 0.5
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
-3.145039, -3.540764, -4,
-3.145039, -3.540764, 4,
-3.145039, -3.540764, -4,
-3.299049, -3.723649, -4,
-3.145039, -3.540764, -2,
-3.299049, -3.723649, -2,
-3.145039, -3.540764, 0,
-3.299049, -3.723649, 0,
-3.145039, -3.540764, 2,
-3.299049, -3.723649, 2,
-3.145039, -3.540764, 4,
-3.299049, -3.723649, 4
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
-3.60707, -4.08942, -4, 0, -0.5, 0.5, 0.5,
-3.60707, -4.08942, -4, 1, -0.5, 0.5, 0.5,
-3.60707, -4.08942, -4, 1, 1.5, 0.5, 0.5,
-3.60707, -4.08942, -4, 0, 1.5, 0.5, 0.5,
-3.60707, -4.08942, -2, 0, -0.5, 0.5, 0.5,
-3.60707, -4.08942, -2, 1, -0.5, 0.5, 0.5,
-3.60707, -4.08942, -2, 1, 1.5, 0.5, 0.5,
-3.60707, -4.08942, -2, 0, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 0, 0, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 0, 1, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 0, 1, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 0, 0, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 2, 0, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 2, 1, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 2, 1, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 2, 0, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 4, 0, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 4, 1, -0.5, 0.5, 0.5,
-3.60707, -4.08942, 4, 1, 1.5, 0.5, 0.5,
-3.60707, -4.08942, 4, 0, 1.5, 0.5, 0.5
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
-3.145039, -3.540764, -5.413528,
-3.145039, 3.774655, -5.413528,
-3.145039, -3.540764, 5.437382,
-3.145039, 3.774655, 5.437382,
-3.145039, -3.540764, -5.413528,
-3.145039, -3.540764, 5.437382,
-3.145039, 3.774655, -5.413528,
-3.145039, 3.774655, 5.437382,
-3.145039, -3.540764, -5.413528,
3.015372, -3.540764, -5.413528,
-3.145039, -3.540764, 5.437382,
3.015372, -3.540764, 5.437382,
-3.145039, 3.774655, -5.413528,
3.015372, 3.774655, -5.413528,
-3.145039, 3.774655, 5.437382,
3.015372, 3.774655, 5.437382,
3.015372, -3.540764, -5.413528,
3.015372, 3.774655, -5.413528,
3.015372, -3.540764, 5.437382,
3.015372, 3.774655, 5.437382,
3.015372, -3.540764, -5.413528,
3.015372, -3.540764, 5.437382,
3.015372, 3.774655, -5.413528,
3.015372, 3.774655, 5.437382
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
var radius = 7.723514;
var distance = 34.36278;
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
mvMatrix.translate( 0.0648334, -0.1169455, -0.01192689 );
mvMatrix.scale( 1.355561, 1.141536, 0.7695957 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36278);
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
3-phenoxybenzoic_aci<-read.table("3-phenoxybenzoic_aci.xyz")
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
-3.055324, -1.0732, -2.608268, 0, 0, 1, 1, 1,
-2.953459, 1.147718, -0.8165725, 1, 0, 0, 1, 1,
-2.602376, -0.6891868, -1.058874, 1, 0, 0, 1, 1,
-2.590151, 1.217219, -1.170868, 1, 0, 0, 1, 1,
-2.535319, 0.8453425, -2.225197, 1, 0, 0, 1, 1,
-2.370302, -0.8970852, -0.6907933, 1, 0, 0, 1, 1,
-2.35759, -1.909795, -3.866081, 0, 0, 0, 1, 1,
-2.326577, -0.4205121, -0.7044995, 0, 0, 0, 1, 1,
-2.312495, -0.365511, -1.697603, 0, 0, 0, 1, 1,
-2.303461, -0.1274702, -3.609306, 0, 0, 0, 1, 1,
-2.302705, -1.267215, -1.248742, 0, 0, 0, 1, 1,
-2.240036, -0.1869429, -3.916181, 0, 0, 0, 1, 1,
-2.235996, 0.2131962, -1.159884, 0, 0, 0, 1, 1,
-2.233912, 1.034898, -1.034572, 1, 1, 1, 1, 1,
-2.135145, -0.2386951, 1.409905, 1, 1, 1, 1, 1,
-2.125875, 0.3373067, -0.1827885, 1, 1, 1, 1, 1,
-2.118091, -2.200862, -2.616099, 1, 1, 1, 1, 1,
-2.108447, 2.116687, 0.0405258, 1, 1, 1, 1, 1,
-2.106301, -0.1020597, -1.127516, 1, 1, 1, 1, 1,
-2.105046, 0.2077397, -0.8110632, 1, 1, 1, 1, 1,
-2.103462, 1.866014, -0.2045387, 1, 1, 1, 1, 1,
-2.096685, 0.190157, -1.730841, 1, 1, 1, 1, 1,
-2.094197, 0.8712649, -1.90929, 1, 1, 1, 1, 1,
-2.044115, 0.7708649, -1.173889, 1, 1, 1, 1, 1,
-2.030279, 1.12875, -1.702369, 1, 1, 1, 1, 1,
-2.019742, -0.7857471, -0.7005414, 1, 1, 1, 1, 1,
-2.002392, -1.872721, -1.031201, 1, 1, 1, 1, 1,
-2.001113, -1.037492, -1.88506, 1, 1, 1, 1, 1,
-1.994187, -0.7697918, -2.470465, 0, 0, 1, 1, 1,
-1.993359, -0.1301535, -1.662581, 1, 0, 0, 1, 1,
-1.972241, 0.1091831, -1.695974, 1, 0, 0, 1, 1,
-1.957087, 0.4972786, 0.4930493, 1, 0, 0, 1, 1,
-1.94653, 1.989499, 0.7059096, 1, 0, 0, 1, 1,
-1.943297, 0.8737814, -1.113104, 1, 0, 0, 1, 1,
-1.939285, -0.761893, 0.5638157, 0, 0, 0, 1, 1,
-1.916943, -1.150986, -1.934037, 0, 0, 0, 1, 1,
-1.904089, -0.6140812, -1.826075, 0, 0, 0, 1, 1,
-1.890775, 0.839365, -2.537058, 0, 0, 0, 1, 1,
-1.876223, 1.599916, -0.4235719, 0, 0, 0, 1, 1,
-1.867105, -0.04961536, -1.961031, 0, 0, 0, 1, 1,
-1.85506, -0.322238, -0.8913748, 0, 0, 0, 1, 1,
-1.850421, -1.291835, -1.601838, 1, 1, 1, 1, 1,
-1.83971, 0.6702023, -1.547244, 1, 1, 1, 1, 1,
-1.839579, 0.6192525, -0.2442314, 1, 1, 1, 1, 1,
-1.819763, 0.3537167, -3.382195, 1, 1, 1, 1, 1,
-1.815098, 0.2343382, -2.503909, 1, 1, 1, 1, 1,
-1.80935, 0.6541448, -0.8763247, 1, 1, 1, 1, 1,
-1.808314, 1.581159, -2.604561, 1, 1, 1, 1, 1,
-1.798358, 0.4464654, -1.811856, 1, 1, 1, 1, 1,
-1.792038, -1.373411, -2.541563, 1, 1, 1, 1, 1,
-1.747177, -2.881087, -4.367313, 1, 1, 1, 1, 1,
-1.739812, -0.8292063, -0.007294665, 1, 1, 1, 1, 1,
-1.727737, -0.08114925, -1.817438, 1, 1, 1, 1, 1,
-1.722585, 0.7947962, -3.623526, 1, 1, 1, 1, 1,
-1.716874, 0.4568756, -2.970477, 1, 1, 1, 1, 1,
-1.709775, 0.5309665, -1.272411, 1, 1, 1, 1, 1,
-1.676046, -0.3843871, -1.858291, 0, 0, 1, 1, 1,
-1.673523, 0.3957452, -0.9463221, 1, 0, 0, 1, 1,
-1.65396, 0.01163299, -0.460645, 1, 0, 0, 1, 1,
-1.597269, 0.09747149, -2.114374, 1, 0, 0, 1, 1,
-1.575399, -0.1610329, -2.420226, 1, 0, 0, 1, 1,
-1.570926, -0.5461513, -1.963787, 1, 0, 0, 1, 1,
-1.569227, 0.3342032, -0.7459991, 0, 0, 0, 1, 1,
-1.566358, -0.5083147, -3.617469, 0, 0, 0, 1, 1,
-1.565985, -0.5286958, -3.04833, 0, 0, 0, 1, 1,
-1.549669, -0.2647783, -0.2698406, 0, 0, 0, 1, 1,
-1.543802, 1.104638, -0.08254591, 0, 0, 0, 1, 1,
-1.529053, 0.7009841, -0.1468476, 0, 0, 0, 1, 1,
-1.525202, -0.2980788, -1.761024, 0, 0, 0, 1, 1,
-1.523486, -0.9689832, -1.468678, 1, 1, 1, 1, 1,
-1.523235, -0.4532721, -2.070049, 1, 1, 1, 1, 1,
-1.518959, -0.4872065, -2.550098, 1, 1, 1, 1, 1,
-1.509052, -0.88991, -1.673747, 1, 1, 1, 1, 1,
-1.500973, 1.164472, -2.361493, 1, 1, 1, 1, 1,
-1.494585, 1.88043, -0.8583327, 1, 1, 1, 1, 1,
-1.482974, -0.3102117, -2.056464, 1, 1, 1, 1, 1,
-1.482572, 0.03980879, 0.01083686, 1, 1, 1, 1, 1,
-1.45838, 0.09858532, -2.28238, 1, 1, 1, 1, 1,
-1.451917, -2.549361, -1.811985, 1, 1, 1, 1, 1,
-1.450537, -0.4458601, -2.215822, 1, 1, 1, 1, 1,
-1.445527, 0.8249844, -1.084338, 1, 1, 1, 1, 1,
-1.43659, -1.345802, -1.268428, 1, 1, 1, 1, 1,
-1.432716, 0.06215483, -4.343885, 1, 1, 1, 1, 1,
-1.430516, -0.9370315, -1.24798, 1, 1, 1, 1, 1,
-1.419416, -0.7370877, -3.306632, 0, 0, 1, 1, 1,
-1.418427, -0.644843, -0.8432536, 1, 0, 0, 1, 1,
-1.418343, 0.5183648, -0.7076563, 1, 0, 0, 1, 1,
-1.390654, -0.6929796, -1.823696, 1, 0, 0, 1, 1,
-1.385082, -1.78891, -4.41503, 1, 0, 0, 1, 1,
-1.385062, -0.2026504, -4.054356, 1, 0, 0, 1, 1,
-1.378135, -0.306597, -3.303164, 0, 0, 0, 1, 1,
-1.374183, 0.537311, -0.7424967, 0, 0, 0, 1, 1,
-1.361342, 0.1989964, -0.998634, 0, 0, 0, 1, 1,
-1.361038, 1.296535, -0.2417847, 0, 0, 0, 1, 1,
-1.357609, -0.4619408, -3.808481, 0, 0, 0, 1, 1,
-1.35529, 0.4120904, -0.9098316, 0, 0, 0, 1, 1,
-1.348529, 0.7173693, -2.200917, 0, 0, 0, 1, 1,
-1.340961, 1.464364, -0.9912179, 1, 1, 1, 1, 1,
-1.322212, -0.6428615, -2.857955, 1, 1, 1, 1, 1,
-1.320956, 0.8960132, -0.7445657, 1, 1, 1, 1, 1,
-1.320471, 0.4155196, -1.501951, 1, 1, 1, 1, 1,
-1.300157, -1.594351, -2.256622, 1, 1, 1, 1, 1,
-1.295948, 0.6086344, -1.463447, 1, 1, 1, 1, 1,
-1.278602, 0.479056, -2.776389, 1, 1, 1, 1, 1,
-1.27685, 0.06558079, 0.3197283, 1, 1, 1, 1, 1,
-1.266516, -1.48735, -2.798169, 1, 1, 1, 1, 1,
-1.264178, -1.334625, -4.104497, 1, 1, 1, 1, 1,
-1.254133, -0.1329403, -2.097783, 1, 1, 1, 1, 1,
-1.247948, 0.2378327, 0.3544729, 1, 1, 1, 1, 1,
-1.246373, 1.177535, -0.6331434, 1, 1, 1, 1, 1,
-1.245923, -1.366625, -1.52351, 1, 1, 1, 1, 1,
-1.237242, -0.6268466, -2.423607, 1, 1, 1, 1, 1,
-1.2347, 0.5038195, -1.596762, 0, 0, 1, 1, 1,
-1.226687, -1.722872, -2.013422, 1, 0, 0, 1, 1,
-1.224798, 0.1377392, -1.976683, 1, 0, 0, 1, 1,
-1.217943, -0.4287997, -1.115787, 1, 0, 0, 1, 1,
-1.216755, -0.2582976, -1.204384, 1, 0, 0, 1, 1,
-1.216281, 1.301372, -0.02787175, 1, 0, 0, 1, 1,
-1.195331, 0.5160294, 0.02877397, 0, 0, 0, 1, 1,
-1.193194, -0.311016, -1.21957, 0, 0, 0, 1, 1,
-1.190549, -0.7766405, -0.4316652, 0, 0, 0, 1, 1,
-1.186913, 1.03315, -2.699628, 0, 0, 0, 1, 1,
-1.182988, 0.008010245, -0.8101728, 0, 0, 0, 1, 1,
-1.17775, -0.9364587, -2.260683, 0, 0, 0, 1, 1,
-1.172388, -1.286317, -1.198168, 0, 0, 0, 1, 1,
-1.171007, 2.18744, -0.9824381, 1, 1, 1, 1, 1,
-1.168797, -0.2079058, -0.5985605, 1, 1, 1, 1, 1,
-1.166404, -0.333939, -1.324332, 1, 1, 1, 1, 1,
-1.164016, -1.933485, -2.669878, 1, 1, 1, 1, 1,
-1.160985, -0.4532783, -2.228773, 1, 1, 1, 1, 1,
-1.160012, 0.5669952, -1.83357, 1, 1, 1, 1, 1,
-1.152167, -0.4933919, -1.680591, 1, 1, 1, 1, 1,
-1.147307, -1.005832, -0.8111983, 1, 1, 1, 1, 1,
-1.135567, -0.8886945, -2.363527, 1, 1, 1, 1, 1,
-1.134989, 0.3090972, -0.7998019, 1, 1, 1, 1, 1,
-1.132968, -0.4044904, -1.923302, 1, 1, 1, 1, 1,
-1.128375, -0.3248599, -2.094922, 1, 1, 1, 1, 1,
-1.127196, 0.3102747, -0.9139776, 1, 1, 1, 1, 1,
-1.122703, 2.377552, -0.0004079046, 1, 1, 1, 1, 1,
-1.122241, -0.3343995, -1.324665, 1, 1, 1, 1, 1,
-1.122236, -0.466544, -3.017756, 0, 0, 1, 1, 1,
-1.119453, -0.1949699, -0.6439085, 1, 0, 0, 1, 1,
-1.118262, 0.07250661, -0.4991829, 1, 0, 0, 1, 1,
-1.10815, -0.4068296, -0.7138408, 1, 0, 0, 1, 1,
-1.096548, -0.1046187, -2.665811, 1, 0, 0, 1, 1,
-1.093255, 0.5995166, -1.904357, 1, 0, 0, 1, 1,
-1.091853, 1.420003, -1.133272, 0, 0, 0, 1, 1,
-1.091381, 0.629734, 0.899986, 0, 0, 0, 1, 1,
-1.091087, 0.8011654, 0.6107918, 0, 0, 0, 1, 1,
-1.090212, -0.638686, -3.0729, 0, 0, 0, 1, 1,
-1.089927, -0.1356433, -1.395988, 0, 0, 0, 1, 1,
-1.087393, -0.09080529, -1.261238, 0, 0, 0, 1, 1,
-1.083512, -0.4818155, -0.9383528, 0, 0, 0, 1, 1,
-1.083406, 1.617808, -1.417415, 1, 1, 1, 1, 1,
-1.081351, -0.3986703, -4.872772, 1, 1, 1, 1, 1,
-1.080717, -0.6010846, -2.037499, 1, 1, 1, 1, 1,
-1.077587, 0.9632526, 0.01573245, 1, 1, 1, 1, 1,
-1.069717, 0.170105, -0.9894046, 1, 1, 1, 1, 1,
-1.068499, 0.06447598, -1.645404, 1, 1, 1, 1, 1,
-1.045543, -0.135473, -2.818437, 1, 1, 1, 1, 1,
-1.043669, -0.3598431, -2.534211, 1, 1, 1, 1, 1,
-1.04269, -0.5608678, -2.653503, 1, 1, 1, 1, 1,
-1.039457, -0.3191776, -1.966949, 1, 1, 1, 1, 1,
-1.032133, -0.1209046, -1.551936, 1, 1, 1, 1, 1,
-1.031412, 0.4540818, -0.699588, 1, 1, 1, 1, 1,
-1.02534, -0.9816995, 0.09851038, 1, 1, 1, 1, 1,
-1.022605, -0.3613446, -1.103857, 1, 1, 1, 1, 1,
-1.016382, 0.7929033, -1.572374, 1, 1, 1, 1, 1,
-1.014335, 1.055191, -0.6135654, 0, 0, 1, 1, 1,
-1.013606, 0.7798967, -0.4447034, 1, 0, 0, 1, 1,
-1.007824, 1.538082, -0.3964543, 1, 0, 0, 1, 1,
-1.00692, 0.1294419, -2.770139, 1, 0, 0, 1, 1,
-1.004013, -2.223512, -3.691737, 1, 0, 0, 1, 1,
-1.002195, 1.183819, -1.370486, 1, 0, 0, 1, 1,
-0.9949111, -0.2414326, -1.323977, 0, 0, 0, 1, 1,
-0.9937696, -0.2617177, -1.229732, 0, 0, 0, 1, 1,
-0.9871722, -1.502525, -5.255506, 0, 0, 0, 1, 1,
-0.9863126, -0.8848609, -0.9334208, 0, 0, 0, 1, 1,
-0.9846219, 0.5081564, 0.6302075, 0, 0, 0, 1, 1,
-0.9701114, -1.236772, -2.619466, 0, 0, 0, 1, 1,
-0.9604011, -1.773252, -3.522302, 0, 0, 0, 1, 1,
-0.9580093, 1.021968, -1.124888, 1, 1, 1, 1, 1,
-0.9579238, 0.5038042, -1.504022, 1, 1, 1, 1, 1,
-0.9576966, -0.9311919, -2.625168, 1, 1, 1, 1, 1,
-0.9576492, 0.3081312, -1.860493, 1, 1, 1, 1, 1,
-0.9525289, 0.3907322, -1.218444, 1, 1, 1, 1, 1,
-0.9477327, 0.04039083, -2.577602, 1, 1, 1, 1, 1,
-0.9466634, 1.601559, -1.227451, 1, 1, 1, 1, 1,
-0.9441348, -1.408318, -3.418883, 1, 1, 1, 1, 1,
-0.9396535, 0.7118227, -0.4768797, 1, 1, 1, 1, 1,
-0.9387196, 0.9735408, -0.1547152, 1, 1, 1, 1, 1,
-0.9370887, -0.1658541, -0.9192463, 1, 1, 1, 1, 1,
-0.9366404, -0.1439452, -2.11681, 1, 1, 1, 1, 1,
-0.9346375, 0.8950681, -0.786009, 1, 1, 1, 1, 1,
-0.9338659, 0.4662201, -0.7275227, 1, 1, 1, 1, 1,
-0.9329249, -0.1998912, -0.2911287, 1, 1, 1, 1, 1,
-0.925377, -1.193989, -3.514991, 0, 0, 1, 1, 1,
-0.9208547, 0.5588521, -1.714077, 1, 0, 0, 1, 1,
-0.9194999, 0.2329808, -1.359104, 1, 0, 0, 1, 1,
-0.916977, -1.3503, -3.346451, 1, 0, 0, 1, 1,
-0.9125668, -0.7479676, -2.215149, 1, 0, 0, 1, 1,
-0.9108192, -1.293931, -2.352455, 1, 0, 0, 1, 1,
-0.9044588, 0.04037032, -3.005116, 0, 0, 0, 1, 1,
-0.9033796, 1.068112, -1.426073, 0, 0, 0, 1, 1,
-0.9005746, 0.7483602, -0.8194422, 0, 0, 0, 1, 1,
-0.8895564, 0.9994161, 0.1598469, 0, 0, 0, 1, 1,
-0.8889864, 0.7931471, -1.05559, 0, 0, 0, 1, 1,
-0.8845747, 0.5729265, -1.513538, 0, 0, 0, 1, 1,
-0.8829377, 2.177986, 1.838337, 0, 0, 0, 1, 1,
-0.8811873, 0.1511788, 0.8292392, 1, 1, 1, 1, 1,
-0.8802285, 0.03313076, -2.715319, 1, 1, 1, 1, 1,
-0.8756281, -0.9875186, -2.851159, 1, 1, 1, 1, 1,
-0.8706035, -0.2855428, -0.220174, 1, 1, 1, 1, 1,
-0.8691055, -0.4838103, -2.237306, 1, 1, 1, 1, 1,
-0.8650967, 2.180301, -0.4970285, 1, 1, 1, 1, 1,
-0.8555936, -1.662251, -2.489171, 1, 1, 1, 1, 1,
-0.8529957, 0.9987797, -0.2003634, 1, 1, 1, 1, 1,
-0.8474323, -0.1591632, -1.766456, 1, 1, 1, 1, 1,
-0.840149, -1.714322, -2.865672, 1, 1, 1, 1, 1,
-0.8378534, 0.8532135, -0.3247773, 1, 1, 1, 1, 1,
-0.8305215, -0.8095325, -3.961682, 1, 1, 1, 1, 1,
-0.8283268, -1.652764, -1.668965, 1, 1, 1, 1, 1,
-0.8204578, 0.8528044, 0.6415353, 1, 1, 1, 1, 1,
-0.8189415, 0.4812465, 0.9977254, 1, 1, 1, 1, 1,
-0.8120708, -0.2725659, -0.9282053, 0, 0, 1, 1, 1,
-0.8111087, -1.200783, -4.235785, 1, 0, 0, 1, 1,
-0.7958476, 0.1777019, -2.36678, 1, 0, 0, 1, 1,
-0.7957917, 0.8609182, -1.776833, 1, 0, 0, 1, 1,
-0.7863799, 0.1296849, -1.275784, 1, 0, 0, 1, 1,
-0.782537, 0.4320318, -0.656091, 1, 0, 0, 1, 1,
-0.7796448, 0.4110105, -1.563641, 0, 0, 0, 1, 1,
-0.7752332, 0.648846, -1.447721, 0, 0, 0, 1, 1,
-0.7684487, 0.3383921, 0.6559747, 0, 0, 0, 1, 1,
-0.762853, 0.8134536, -0.5450641, 0, 0, 0, 1, 1,
-0.7595759, 0.153846, -2.650998, 0, 0, 0, 1, 1,
-0.759111, 0.01007951, -3.224863, 0, 0, 0, 1, 1,
-0.7577307, -0.8931494, -3.370216, 0, 0, 0, 1, 1,
-0.7574378, 0.3966517, -1.345239, 1, 1, 1, 1, 1,
-0.7510787, -0.3866318, -2.295042, 1, 1, 1, 1, 1,
-0.7462061, -0.3315224, -0.7089351, 1, 1, 1, 1, 1,
-0.742919, -0.7729583, -1.557681, 1, 1, 1, 1, 1,
-0.7424939, -0.7570558, -4.74764, 1, 1, 1, 1, 1,
-0.7339445, -1.384997, -2.243441, 1, 1, 1, 1, 1,
-0.7311186, -0.1026424, -2.287509, 1, 1, 1, 1, 1,
-0.7210889, -1.801996, -3.972725, 1, 1, 1, 1, 1,
-0.7204037, -0.328728, -2.05481, 1, 1, 1, 1, 1,
-0.7194059, -0.676028, -2.07479, 1, 1, 1, 1, 1,
-0.7153657, 0.0488253, -2.96818, 1, 1, 1, 1, 1,
-0.7126058, -0.5624629, -1.922362, 1, 1, 1, 1, 1,
-0.7083019, 3.668119, -1.220539, 1, 1, 1, 1, 1,
-0.7073069, -0.8455933, -2.437158, 1, 1, 1, 1, 1,
-0.7009465, 0.02451135, -1.483605, 1, 1, 1, 1, 1,
-0.6981951, 0.1624104, -2.714859, 0, 0, 1, 1, 1,
-0.696356, 1.732744, 0.8695961, 1, 0, 0, 1, 1,
-0.6925621, 1.35234, 0.4699371, 1, 0, 0, 1, 1,
-0.6865217, -0.4564674, -0.5668637, 1, 0, 0, 1, 1,
-0.6840553, -0.1322058, -2.538134, 1, 0, 0, 1, 1,
-0.6827825, 1.399543, 0.06005381, 1, 0, 0, 1, 1,
-0.6821549, -0.3230703, -1.637195, 0, 0, 0, 1, 1,
-0.6758661, 1.191001, -0.2488718, 0, 0, 0, 1, 1,
-0.6734822, -0.07047216, -2.214556, 0, 0, 0, 1, 1,
-0.6729102, 1.374118, 0.09073199, 0, 0, 0, 1, 1,
-0.6710328, -2.128391, -3.090787, 0, 0, 0, 1, 1,
-0.6647516, 0.3537096, -0.5688562, 0, 0, 0, 1, 1,
-0.6625788, -0.1536392, -2.198477, 0, 0, 0, 1, 1,
-0.6592021, 0.5072821, -0.09692004, 1, 1, 1, 1, 1,
-0.6565884, 1.231966, -0.5268005, 1, 1, 1, 1, 1,
-0.6546173, 0.1122406, -3.302231, 1, 1, 1, 1, 1,
-0.6541246, -0.1458649, -0.8534078, 1, 1, 1, 1, 1,
-0.6524763, 0.1704288, -3.615155, 1, 1, 1, 1, 1,
-0.6403397, 0.8062214, -0.2638982, 1, 1, 1, 1, 1,
-0.6396106, -1.238084, -2.516986, 1, 1, 1, 1, 1,
-0.632122, 0.04275849, -0.8053534, 1, 1, 1, 1, 1,
-0.6319609, 1.421717, 0.3062922, 1, 1, 1, 1, 1,
-0.6295161, 0.7956629, -0.765231, 1, 1, 1, 1, 1,
-0.6255797, -1.051244, -2.598382, 1, 1, 1, 1, 1,
-0.615525, -0.1441402, -2.703856, 1, 1, 1, 1, 1,
-0.6120976, -0.8409163, -1.073029, 1, 1, 1, 1, 1,
-0.6101259, -1.011706, -3.544718, 1, 1, 1, 1, 1,
-0.6074986, 1.042524, -2.434127, 1, 1, 1, 1, 1,
-0.604396, -1.602572, -3.031767, 0, 0, 1, 1, 1,
-0.6037007, 1.584503, -0.9788505, 1, 0, 0, 1, 1,
-0.6022694, 0.703472, 0.7022755, 1, 0, 0, 1, 1,
-0.5987703, 0.5723379, -1.689179, 1, 0, 0, 1, 1,
-0.5967735, 1.653612, -2.456289, 1, 0, 0, 1, 1,
-0.5964748, 0.763245, -0.5129629, 1, 0, 0, 1, 1,
-0.5952424, 0.7690151, 0.1476206, 0, 0, 0, 1, 1,
-0.5936199, -0.6460561, -1.024816, 0, 0, 0, 1, 1,
-0.593496, 0.3356147, -2.263694, 0, 0, 0, 1, 1,
-0.5895669, -0.6057001, -2.109693, 0, 0, 0, 1, 1,
-0.5877141, -1.329196, -2.786557, 0, 0, 0, 1, 1,
-0.5866933, -0.0850537, -0.948116, 0, 0, 0, 1, 1,
-0.5865471, 0.07224385, -1.546391, 0, 0, 0, 1, 1,
-0.5857868, 1.206326, -1.561629, 1, 1, 1, 1, 1,
-0.5843272, -0.6921749, -1.170668, 1, 1, 1, 1, 1,
-0.5830399, -1.020161, -4.304949, 1, 1, 1, 1, 1,
-0.5827216, 1.951556, -0.8001955, 1, 1, 1, 1, 1,
-0.5825958, 0.6658584, -1.882975, 1, 1, 1, 1, 1,
-0.5765335, -0.9935595, -2.009315, 1, 1, 1, 1, 1,
-0.5684584, 0.3920443, -1.396486, 1, 1, 1, 1, 1,
-0.5651669, -2.018352, -3.636779, 1, 1, 1, 1, 1,
-0.5595502, -1.684031, -2.375214, 1, 1, 1, 1, 1,
-0.5545266, 3.027401, 0.5322344, 1, 1, 1, 1, 1,
-0.5519935, 0.6587772, -0.8219244, 1, 1, 1, 1, 1,
-0.5507452, -0.6585268, -1.826478, 1, 1, 1, 1, 1,
-0.5495422, -0.7440324, -1.42489, 1, 1, 1, 1, 1,
-0.5492089, 0.284603, -0.4561987, 1, 1, 1, 1, 1,
-0.5467577, -0.93563, -2.578813, 1, 1, 1, 1, 1,
-0.5370591, -0.5068854, -1.936251, 0, 0, 1, 1, 1,
-0.5356629, 1.143586, -0.4899085, 1, 0, 0, 1, 1,
-0.5324056, 1.128904, -0.7879165, 1, 0, 0, 1, 1,
-0.5308311, -0.1203795, -3.000844, 1, 0, 0, 1, 1,
-0.5246195, 1.513542, -1.527764, 1, 0, 0, 1, 1,
-0.5168971, -0.8599154, -4.02109, 1, 0, 0, 1, 1,
-0.5166778, 0.3257699, -1.167355, 0, 0, 0, 1, 1,
-0.5134335, -0.2041737, -1.395526, 0, 0, 0, 1, 1,
-0.5016206, 0.8569401, -1.091275, 0, 0, 0, 1, 1,
-0.5015805, 0.2335618, -2.45049, 0, 0, 0, 1, 1,
-0.4993665, 0.1637327, -2.853283, 0, 0, 0, 1, 1,
-0.4990264, 0.02341921, -2.025533, 0, 0, 0, 1, 1,
-0.4987856, -0.6021411, -3.036643, 0, 0, 0, 1, 1,
-0.4977311, 0.4412419, -1.619834, 1, 1, 1, 1, 1,
-0.494901, -0.3461756, -0.5795731, 1, 1, 1, 1, 1,
-0.4933632, 0.06264947, -0.9792185, 1, 1, 1, 1, 1,
-0.4836717, 0.8980733, -0.4971001, 1, 1, 1, 1, 1,
-0.4797087, -1.297978, -3.009185, 1, 1, 1, 1, 1,
-0.4790595, -1.126065, -2.076011, 1, 1, 1, 1, 1,
-0.4779744, -0.6047715, -2.688665, 1, 1, 1, 1, 1,
-0.4745332, 0.08242399, -1.150106, 1, 1, 1, 1, 1,
-0.4716991, 0.9018365, -0.4937473, 1, 1, 1, 1, 1,
-0.4685907, -0.4041554, -3.389204, 1, 1, 1, 1, 1,
-0.4682401, 0.1484935, -1.346434, 1, 1, 1, 1, 1,
-0.4674197, 1.705297, 0.9281136, 1, 1, 1, 1, 1,
-0.4642557, 1.316559, -1.74585, 1, 1, 1, 1, 1,
-0.4635813, -1.178319, -1.530399, 1, 1, 1, 1, 1,
-0.461775, 1.054653, -0.2888132, 1, 1, 1, 1, 1,
-0.4611208, 0.4154804, -0.2588484, 0, 0, 1, 1, 1,
-0.4604112, 0.9716002, -0.5290338, 1, 0, 0, 1, 1,
-0.4602627, -0.430544, -2.068264, 1, 0, 0, 1, 1,
-0.4560253, -1.009134, -1.788958, 1, 0, 0, 1, 1,
-0.4529981, 0.2576226, -2.038729, 1, 0, 0, 1, 1,
-0.4507858, -0.6148068, -1.264624, 1, 0, 0, 1, 1,
-0.4479606, 0.7993602, -1.025946, 0, 0, 0, 1, 1,
-0.4469982, 1.06521, -2.290447, 0, 0, 0, 1, 1,
-0.4433931, -2.072589, -2.018835, 0, 0, 0, 1, 1,
-0.4332716, 0.0496379, -1.829362, 0, 0, 0, 1, 1,
-0.432785, 1.419523, -0.8467962, 0, 0, 0, 1, 1,
-0.4321148, 0.2618264, -0.6546957, 0, 0, 0, 1, 1,
-0.4301624, -0.05107709, -0.7356238, 0, 0, 0, 1, 1,
-0.4293751, -0.4860184, -3.239098, 1, 1, 1, 1, 1,
-0.4254954, -0.2704248, -2.478991, 1, 1, 1, 1, 1,
-0.4248315, 1.072931, 0.6690743, 1, 1, 1, 1, 1,
-0.4203637, -1.308027, -2.235483, 1, 1, 1, 1, 1,
-0.4115614, 0.9433178, -2.162326, 1, 1, 1, 1, 1,
-0.4110152, 0.04173992, -3.640127, 1, 1, 1, 1, 1,
-0.4090383, 0.897072, -1.888198, 1, 1, 1, 1, 1,
-0.4076469, -1.026644, -3.535717, 1, 1, 1, 1, 1,
-0.4063024, 0.4130383, 0.3877386, 1, 1, 1, 1, 1,
-0.4061179, 1.095448, 0.8411036, 1, 1, 1, 1, 1,
-0.4054884, 1.053038, 0.2940742, 1, 1, 1, 1, 1,
-0.4040841, 0.616416, -0.07306007, 1, 1, 1, 1, 1,
-0.4013725, -1.336971, -2.531883, 1, 1, 1, 1, 1,
-0.400142, -2.200224, -3.662099, 1, 1, 1, 1, 1,
-0.3990365, 1.636806, -0.4965458, 1, 1, 1, 1, 1,
-0.3971078, 0.4385314, -1.947821, 0, 0, 1, 1, 1,
-0.3931743, 0.2593586, -1.159271, 1, 0, 0, 1, 1,
-0.3910967, -0.1635012, -2.121784, 1, 0, 0, 1, 1,
-0.3883351, -1.695785, -2.929922, 1, 0, 0, 1, 1,
-0.3834803, -0.1144915, 1.124781, 1, 0, 0, 1, 1,
-0.3789637, -0.3584659, -2.374974, 1, 0, 0, 1, 1,
-0.378958, 1.563967, -1.212432, 0, 0, 0, 1, 1,
-0.3776592, -0.7186852, -1.820076, 0, 0, 0, 1, 1,
-0.3706316, 0.9234362, -2.584048, 0, 0, 0, 1, 1,
-0.3690113, -1.542271, -2.851298, 0, 0, 0, 1, 1,
-0.3687795, 1.114288, -1.292578, 0, 0, 0, 1, 1,
-0.368142, -0.9853958, -2.328741, 0, 0, 0, 1, 1,
-0.3677435, 0.5331916, -2.63298, 0, 0, 0, 1, 1,
-0.3668487, -0.7351884, -1.617002, 1, 1, 1, 1, 1,
-0.3651755, -0.9958246, -2.445068, 1, 1, 1, 1, 1,
-0.3606754, 1.424158, 1.192464, 1, 1, 1, 1, 1,
-0.3554137, 0.1314679, -0.8271185, 1, 1, 1, 1, 1,
-0.3539932, 2.552518, 0.6098344, 1, 1, 1, 1, 1,
-0.3536397, -0.156963, -1.305261, 1, 1, 1, 1, 1,
-0.3533005, -0.2455283, -3.287408, 1, 1, 1, 1, 1,
-0.3423466, -0.2379726, -2.598487, 1, 1, 1, 1, 1,
-0.3366801, -0.1642704, -1.297894, 1, 1, 1, 1, 1,
-0.3361263, -0.6524472, -4.454667, 1, 1, 1, 1, 1,
-0.3359502, 0.6085494, -1.043346, 1, 1, 1, 1, 1,
-0.3347671, -1.158366, -2.715144, 1, 1, 1, 1, 1,
-0.3343187, 0.7911746, 0.5591412, 1, 1, 1, 1, 1,
-0.3313318, 0.4418516, -2.863602, 1, 1, 1, 1, 1,
-0.329712, -0.2149994, -3.624759, 1, 1, 1, 1, 1,
-0.325058, 0.8737774, -0.765345, 0, 0, 1, 1, 1,
-0.3225369, -0.2370798, -1.930525, 1, 0, 0, 1, 1,
-0.3221855, 1.347577, -0.5202892, 1, 0, 0, 1, 1,
-0.3192145, 1.544464, -0.7119384, 1, 0, 0, 1, 1,
-0.3145926, -2.259713, -1.879454, 1, 0, 0, 1, 1,
-0.3071784, -0.06097296, -3.052836, 1, 0, 0, 1, 1,
-0.3068135, -0.2594582, -1.85491, 0, 0, 0, 1, 1,
-0.3023851, 0.431789, 0.8710783, 0, 0, 0, 1, 1,
-0.2991292, -0.5415766, -3.838133, 0, 0, 0, 1, 1,
-0.2942689, 2.094858, -1.806015, 0, 0, 0, 1, 1,
-0.2926967, -0.8144201, -3.420619, 0, 0, 0, 1, 1,
-0.2926542, -0.8077243, -2.873762, 0, 0, 0, 1, 1,
-0.2912393, -0.2171879, -2.293844, 0, 0, 0, 1, 1,
-0.2903064, -1.527347, -3.34052, 1, 1, 1, 1, 1,
-0.2889447, -1.060179, -2.88676, 1, 1, 1, 1, 1,
-0.2840085, 0.3722239, -0.3889726, 1, 1, 1, 1, 1,
-0.2836767, -0.834415, -2.906055, 1, 1, 1, 1, 1,
-0.2815064, 0.1518593, -1.29512, 1, 1, 1, 1, 1,
-0.2801343, -1.669412, -3.381768, 1, 1, 1, 1, 1,
-0.2754679, -0.7209575, -3.686163, 1, 1, 1, 1, 1,
-0.2737269, -1.125333, -4.228925, 1, 1, 1, 1, 1,
-0.2737149, -1.851354, -3.047595, 1, 1, 1, 1, 1,
-0.2659458, 0.2962783, 1.928992, 1, 1, 1, 1, 1,
-0.2455841, 0.3924691, -0.8224543, 1, 1, 1, 1, 1,
-0.2387273, 0.5115329, -0.6647578, 1, 1, 1, 1, 1,
-0.2380802, 0.07486402, -2.053668, 1, 1, 1, 1, 1,
-0.2376727, 0.0358438, -1.117049, 1, 1, 1, 1, 1,
-0.2369066, 0.7996296, -0.3268921, 1, 1, 1, 1, 1,
-0.2336935, -1.825074, -3.547004, 0, 0, 1, 1, 1,
-0.232986, -0.9886512, -2.514378, 1, 0, 0, 1, 1,
-0.231645, -0.1283457, -2.637032, 1, 0, 0, 1, 1,
-0.2296431, 1.529109, -0.8966349, 1, 0, 0, 1, 1,
-0.2283579, -0.2277799, -3.759, 1, 0, 0, 1, 1,
-0.2282233, -1.141476, -3.797207, 1, 0, 0, 1, 1,
-0.2274392, -1.047581, -1.648504, 0, 0, 0, 1, 1,
-0.2244831, -1.134845, -2.845597, 0, 0, 0, 1, 1,
-0.2218698, 0.709819, -1.691281, 0, 0, 0, 1, 1,
-0.2204915, -0.3498727, -1.82174, 0, 0, 0, 1, 1,
-0.213978, -0.2689473, -1.921912, 0, 0, 0, 1, 1,
-0.2079987, -0.04155399, -2.58697, 0, 0, 0, 1, 1,
-0.2015381, -0.5445309, -3.047409, 0, 0, 0, 1, 1,
-0.2006295, -0.352181, -2.376228, 1, 1, 1, 1, 1,
-0.1955337, -0.5546153, -4.39182, 1, 1, 1, 1, 1,
-0.1929721, -1.891732, -5.160979, 1, 1, 1, 1, 1,
-0.1792511, -1.699837, -4.533422, 1, 1, 1, 1, 1,
-0.1760377, 0.1985088, -0.4329869, 1, 1, 1, 1, 1,
-0.1760262, -1.100155, -4.324589, 1, 1, 1, 1, 1,
-0.1703178, 1.481159, -0.249699, 1, 1, 1, 1, 1,
-0.1669227, -0.9306043, -2.282859, 1, 1, 1, 1, 1,
-0.1663522, 0.8279254, 1.276134, 1, 1, 1, 1, 1,
-0.1658295, -0.4397994, -3.397409, 1, 1, 1, 1, 1,
-0.1652538, 0.5290397, -0.3591644, 1, 1, 1, 1, 1,
-0.1631254, -0.5206802, -2.163132, 1, 1, 1, 1, 1,
-0.1602442, -2.286257, -3.542974, 1, 1, 1, 1, 1,
-0.1596894, 0.2442904, -1.386259, 1, 1, 1, 1, 1,
-0.1534794, -1.601326, -4.603684, 1, 1, 1, 1, 1,
-0.1500711, 0.3839591, -1.130695, 0, 0, 1, 1, 1,
-0.1491324, -0.3783938, -3.477264, 1, 0, 0, 1, 1,
-0.1466371, 0.2244273, -0.1631886, 1, 0, 0, 1, 1,
-0.1454588, 0.5672566, -0.04691541, 1, 0, 0, 1, 1,
-0.144944, -0.8323731, -2.095101, 1, 0, 0, 1, 1,
-0.1363233, 2.005728, 0.4501654, 1, 0, 0, 1, 1,
-0.1340694, -0.1604983, -2.14627, 0, 0, 0, 1, 1,
-0.1336362, 0.8688251, 0.6142682, 0, 0, 0, 1, 1,
-0.1308869, 1.473806, -0.5226741, 0, 0, 0, 1, 1,
-0.129511, -0.8783743, -3.028869, 0, 0, 0, 1, 1,
-0.1276626, -0.5876301, -3.686256, 0, 0, 0, 1, 1,
-0.1260147, 1.433504, 0.5909626, 0, 0, 0, 1, 1,
-0.1253229, 1.450698, -0.0551469, 0, 0, 0, 1, 1,
-0.1239917, 0.03598047, 1.248137, 1, 1, 1, 1, 1,
-0.1177939, 1.21839, -0.652122, 1, 1, 1, 1, 1,
-0.1117442, -0.1037293, -1.993473, 1, 1, 1, 1, 1,
-0.1053579, -0.540086, -3.779918, 1, 1, 1, 1, 1,
-0.1041114, -1.159709, -2.207426, 1, 1, 1, 1, 1,
-0.1029012, 0.1836871, 0.2388011, 1, 1, 1, 1, 1,
-0.09914902, 1.370779, -0.9219763, 1, 1, 1, 1, 1,
-0.09837624, -1.000682, -2.880447, 1, 1, 1, 1, 1,
-0.09641183, -0.6481381, -2.173022, 1, 1, 1, 1, 1,
-0.09465529, -0.4014944, -2.647282, 1, 1, 1, 1, 1,
-0.08868965, 0.2806671, 0.4706045, 1, 1, 1, 1, 1,
-0.08396823, 0.6099906, 2.335459, 1, 1, 1, 1, 1,
-0.07374056, 1.03584, 0.6012175, 1, 1, 1, 1, 1,
-0.06778429, -0.03112971, -2.726084, 1, 1, 1, 1, 1,
-0.06293351, -0.8105758, -3.106757, 1, 1, 1, 1, 1,
-0.05964585, 2.72485, -1.310209, 0, 0, 1, 1, 1,
-0.05632356, -0.7916275, -2.755762, 1, 0, 0, 1, 1,
-0.05551413, -0.3247816, -3.317896, 1, 0, 0, 1, 1,
-0.05211543, 1.184621, -0.1251293, 1, 0, 0, 1, 1,
-0.04623706, -0.8103448, -3.048026, 1, 0, 0, 1, 1,
-0.04430035, -0.03532267, -2.922808, 1, 0, 0, 1, 1,
-0.04385202, -1.537405, -0.9540989, 0, 0, 0, 1, 1,
-0.04380122, 0.248709, -0.6216946, 0, 0, 0, 1, 1,
-0.04317688, 1.550274, 2.591604, 0, 0, 0, 1, 1,
-0.04282915, -1.003012, -3.731889, 0, 0, 0, 1, 1,
-0.03923592, -0.5317871, -1.988788, 0, 0, 0, 1, 1,
-0.03689963, -2.070356, -2.845103, 0, 0, 0, 1, 1,
-0.03611577, 1.813181, 0.7232425, 0, 0, 0, 1, 1,
-0.03542701, 0.2439863, -2.117365, 1, 1, 1, 1, 1,
-0.03326691, 2.404198, 0.5732899, 1, 1, 1, 1, 1,
-0.0321225, 1.362502, 0.4266083, 1, 1, 1, 1, 1,
-0.02895437, 0.9379985, -0.5847121, 1, 1, 1, 1, 1,
-0.02889284, -0.5470464, -1.846382, 1, 1, 1, 1, 1,
-0.02683426, 0.8097488, 2.499597, 1, 1, 1, 1, 1,
-0.02301285, 0.4507579, 0.06676531, 1, 1, 1, 1, 1,
-0.02101159, -0.537737, -3.988006, 1, 1, 1, 1, 1,
-0.01936393, -0.2993688, -2.187258, 1, 1, 1, 1, 1,
-0.009332446, 2.269128, -1.622677, 1, 1, 1, 1, 1,
-0.009087775, 0.814546, 1.674291, 1, 1, 1, 1, 1,
-0.008897386, 0.6929738, -0.0433051, 1, 1, 1, 1, 1,
-0.00766471, 0.9175968, 1.291111, 1, 1, 1, 1, 1,
-0.007375743, -0.470346, -2.894814, 1, 1, 1, 1, 1,
-0.006187877, 0.5845525, 0.0855168, 1, 1, 1, 1, 1,
-0.005514249, -0.1833648, -2.336941, 0, 0, 1, 1, 1,
-0.005064899, 0.7942489, -0.2647778, 1, 0, 0, 1, 1,
0.007197651, 1.013864, -0.1692894, 1, 0, 0, 1, 1,
0.01935431, -0.3482942, 4.397174, 1, 0, 0, 1, 1,
0.02145849, -1.300641, 4.108871, 1, 0, 0, 1, 1,
0.02243543, -0.6537813, 3.334391, 1, 0, 0, 1, 1,
0.02388487, 0.1306016, -0.4147752, 0, 0, 0, 1, 1,
0.02624611, -1.363443, 3.907739, 0, 0, 0, 1, 1,
0.02990698, 0.7644103, -0.9639995, 0, 0, 0, 1, 1,
0.03005977, 2.06397, 0.7565367, 0, 0, 0, 1, 1,
0.03657705, -0.4587223, 2.523424, 0, 0, 0, 1, 1,
0.03734372, 0.1654726, -1.786597, 0, 0, 0, 1, 1,
0.03873665, -1.806317, 2.223218, 0, 0, 0, 1, 1,
0.0390448, 0.00899301, 2.455202, 1, 1, 1, 1, 1,
0.04069237, 0.5762286, -0.007915938, 1, 1, 1, 1, 1,
0.04302782, -1.082573, 3.671894, 1, 1, 1, 1, 1,
0.04407893, -1.109037, 4.758946, 1, 1, 1, 1, 1,
0.05328121, -0.1429868, 1.5154, 1, 1, 1, 1, 1,
0.05495459, 0.6197819, -3.299894, 1, 1, 1, 1, 1,
0.05881611, -2.416354, 2.445237, 1, 1, 1, 1, 1,
0.05937979, -1.196894, 4.172841, 1, 1, 1, 1, 1,
0.06698424, -0.7386874, 4.017311, 1, 1, 1, 1, 1,
0.06743661, -0.4154525, 2.627234, 1, 1, 1, 1, 1,
0.06825375, 0.1694024, 1.395056, 1, 1, 1, 1, 1,
0.07099399, -1.90402, 1.798977, 1, 1, 1, 1, 1,
0.07185045, 0.4846091, -0.4507962, 1, 1, 1, 1, 1,
0.07327317, -0.7648041, 5.279359, 1, 1, 1, 1, 1,
0.07352234, -1.633129, 3.468109, 1, 1, 1, 1, 1,
0.07678367, 1.817341, 0.4050305, 0, 0, 1, 1, 1,
0.07867923, -1.444184, 2.82188, 1, 0, 0, 1, 1,
0.07948726, -0.08737355, 3.153561, 1, 0, 0, 1, 1,
0.0822883, 1.703837, 0.7419854, 1, 0, 0, 1, 1,
0.08245806, 0.8695716, -1.917001, 1, 0, 0, 1, 1,
0.08287811, -0.7010117, 3.644623, 1, 0, 0, 1, 1,
0.0832845, 1.393688, -0.316245, 0, 0, 0, 1, 1,
0.08536159, -0.8222541, 2.173434, 0, 0, 0, 1, 1,
0.08885706, -1.564125, 4.377688, 0, 0, 0, 1, 1,
0.09239169, -1.747258, 2.26096, 0, 0, 0, 1, 1,
0.09339193, -0.1938864, 1.919054, 0, 0, 0, 1, 1,
0.09423902, -0.2790974, 2.978421, 0, 0, 0, 1, 1,
0.09830739, -0.9827513, 3.312809, 0, 0, 0, 1, 1,
0.09851959, 0.5679997, -0.9522779, 1, 1, 1, 1, 1,
0.101446, 0.3280829, -1.052861, 1, 1, 1, 1, 1,
0.1018464, -1.923985, 1.509993, 1, 1, 1, 1, 1,
0.1035629, 1.404511, 1.161693, 1, 1, 1, 1, 1,
0.1083206, 1.263481, -0.5191408, 1, 1, 1, 1, 1,
0.1099859, -1.753766, 3.269338, 1, 1, 1, 1, 1,
0.1105284, 0.4030829, -0.08610645, 1, 1, 1, 1, 1,
0.1105668, 0.6552823, -1.014657, 1, 1, 1, 1, 1,
0.1116566, 0.2629251, 0.03323651, 1, 1, 1, 1, 1,
0.1126294, 1.665705, -0.6532918, 1, 1, 1, 1, 1,
0.1152788, -0.5103388, 2.509561, 1, 1, 1, 1, 1,
0.1162007, -0.735534, 1.174309, 1, 1, 1, 1, 1,
0.1176082, -1.160494, 3.267542, 1, 1, 1, 1, 1,
0.129624, -0.4406826, 3.392505, 1, 1, 1, 1, 1,
0.130234, -0.721972, 2.682308, 1, 1, 1, 1, 1,
0.1362576, 0.1184717, 0.1474153, 0, 0, 1, 1, 1,
0.1367177, -1.191053, 1.482151, 1, 0, 0, 1, 1,
0.137868, -0.7337304, 4.067573, 1, 0, 0, 1, 1,
0.1379698, 0.09929175, 0.3471219, 1, 0, 0, 1, 1,
0.1382686, 0.7767079, 0.1817758, 1, 0, 0, 1, 1,
0.138997, 0.2706391, 0.2704326, 1, 0, 0, 1, 1,
0.1419459, -0.4554612, 3.236648, 0, 0, 0, 1, 1,
0.1420359, 0.5473455, -1.443318, 0, 0, 0, 1, 1,
0.1438146, 1.466904, -0.4944652, 0, 0, 0, 1, 1,
0.1440666, -0.960435, 3.4053, 0, 0, 0, 1, 1,
0.1450709, -3.206861, 2.247309, 0, 0, 0, 1, 1,
0.1567234, 0.2834409, 0.5198869, 0, 0, 0, 1, 1,
0.1568809, 0.7551835, 0.4443189, 0, 0, 0, 1, 1,
0.1576748, 0.02831007, 2.999071, 1, 1, 1, 1, 1,
0.1584059, 1.274432, 0.9461154, 1, 1, 1, 1, 1,
0.1593593, 0.0003453444, 1.808214, 1, 1, 1, 1, 1,
0.1598301, -0.216454, 2.95107, 1, 1, 1, 1, 1,
0.1604856, -1.723934, 3.333452, 1, 1, 1, 1, 1,
0.1642478, -1.330451, 1.946275, 1, 1, 1, 1, 1,
0.1646996, 0.3499497, 0.7325313, 1, 1, 1, 1, 1,
0.1647948, 0.09085184, 1.479515, 1, 1, 1, 1, 1,
0.1659153, -1.387333, 3.722728, 1, 1, 1, 1, 1,
0.1716373, 0.7220127, -1.184061, 1, 1, 1, 1, 1,
0.171865, -0.2043265, 3.094178, 1, 1, 1, 1, 1,
0.1721691, 1.195159, 1.254473, 1, 1, 1, 1, 1,
0.1772174, 0.8385919, 0.9836456, 1, 1, 1, 1, 1,
0.1781141, 0.5482144, 0.4233444, 1, 1, 1, 1, 1,
0.1813564, 0.1000121, 0.5105801, 1, 1, 1, 1, 1,
0.1837951, -1.513888, 4.645219, 0, 0, 1, 1, 1,
0.1921453, -0.4535424, 4.104447, 1, 0, 0, 1, 1,
0.1938505, 1.201776, -0.03932444, 1, 0, 0, 1, 1,
0.1938897, -1.913294, 3.424383, 1, 0, 0, 1, 1,
0.1947159, 0.5341505, 0.2734408, 1, 0, 0, 1, 1,
0.1968352, 1.081315, -1.234647, 1, 0, 0, 1, 1,
0.2035759, -0.9770089, 3.158326, 0, 0, 0, 1, 1,
0.2079246, -0.4590912, 2.244711, 0, 0, 0, 1, 1,
0.2101141, 0.2228566, 1.041695, 0, 0, 0, 1, 1,
0.2113592, 0.4398829, 0.7263131, 0, 0, 0, 1, 1,
0.2150331, 0.04287339, 1.866331, 0, 0, 0, 1, 1,
0.2152423, 1.247068, -0.4363443, 0, 0, 0, 1, 1,
0.2175863, 0.003982521, 0.1584184, 0, 0, 0, 1, 1,
0.217893, 0.3185274, 0.2599317, 1, 1, 1, 1, 1,
0.2180633, -0.1264514, -0.448887, 1, 1, 1, 1, 1,
0.219781, 1.233829, 0.609314, 1, 1, 1, 1, 1,
0.2198997, -0.1205633, 0.6935959, 1, 1, 1, 1, 1,
0.2226056, -1.165915, 1.912894, 1, 1, 1, 1, 1,
0.2233046, 0.07392298, -0.6217331, 1, 1, 1, 1, 1,
0.2247302, 1.561273, -7.470554e-05, 1, 1, 1, 1, 1,
0.2352263, -1.770882, 2.8281, 1, 1, 1, 1, 1,
0.2393737, -0.7314263, 3.733476, 1, 1, 1, 1, 1,
0.2470419, -0.7348416, 2.522519, 1, 1, 1, 1, 1,
0.2475767, 0.5588163, -0.400695, 1, 1, 1, 1, 1,
0.2548961, 0.01042814, 1.179949, 1, 1, 1, 1, 1,
0.2558457, -3.434228, 3.152022, 1, 1, 1, 1, 1,
0.2561469, -0.5138829, 3.739115, 1, 1, 1, 1, 1,
0.2593331, 1.208192, 0.9480289, 1, 1, 1, 1, 1,
0.2617512, -0.09487726, 1.553268, 0, 0, 1, 1, 1,
0.2680399, -0.4692435, 2.268766, 1, 0, 0, 1, 1,
0.2697894, -0.968744, 3.408733, 1, 0, 0, 1, 1,
0.2700065, -1.093455, 3.426838, 1, 0, 0, 1, 1,
0.2749023, -0.9403669, 3.371827, 1, 0, 0, 1, 1,
0.2815281, -1.167308, 2.652766, 1, 0, 0, 1, 1,
0.283305, -1.075984, 3.130005, 0, 0, 0, 1, 1,
0.2839009, -1.574378, 3.551413, 0, 0, 0, 1, 1,
0.2850316, 1.132554, -0.3513848, 0, 0, 0, 1, 1,
0.2853865, -0.9065879, 2.982705, 0, 0, 0, 1, 1,
0.2871753, 0.1937666, 1.288135, 0, 0, 0, 1, 1,
0.2896299, 0.3728384, 0.5045292, 0, 0, 0, 1, 1,
0.2967414, -0.05629464, 1.352714, 0, 0, 0, 1, 1,
0.2980064, 0.3279901, 0.9036147, 1, 1, 1, 1, 1,
0.3003875, -0.2902755, 2.76169, 1, 1, 1, 1, 1,
0.3007873, 0.2809659, 0.02082802, 1, 1, 1, 1, 1,
0.3016814, -0.8425091, 2.997946, 1, 1, 1, 1, 1,
0.3074663, -0.4640331, 2.319851, 1, 1, 1, 1, 1,
0.3079965, -0.937129, 1.644862, 1, 1, 1, 1, 1,
0.310916, 0.562685, 0.3017738, 1, 1, 1, 1, 1,
0.3123552, -0.3959002, 1.860593, 1, 1, 1, 1, 1,
0.3163843, 1.764478, 0.3947077, 1, 1, 1, 1, 1,
0.3176513, -0.9725682, 3.663563, 1, 1, 1, 1, 1,
0.3196225, 0.2028828, 2.130251, 1, 1, 1, 1, 1,
0.3249866, 0.8900297, 1.34794, 1, 1, 1, 1, 1,
0.3253796, -0.3283769, 1.895543, 1, 1, 1, 1, 1,
0.3270722, -0.9427996, 2.743135, 1, 1, 1, 1, 1,
0.3289244, 0.4305528, 0.8495207, 1, 1, 1, 1, 1,
0.336525, 0.6213859, 0.7819728, 0, 0, 1, 1, 1,
0.3374026, -0.3721277, 2.808957, 1, 0, 0, 1, 1,
0.3377794, 1.008818, -1.449535, 1, 0, 0, 1, 1,
0.3414631, 1.151012, -1.01724, 1, 0, 0, 1, 1,
0.3448454, 1.51588, -0.4627591, 1, 0, 0, 1, 1,
0.348519, 0.190969, 0.9400445, 1, 0, 0, 1, 1,
0.348711, -0.5413254, 1.354231, 0, 0, 0, 1, 1,
0.3528539, 0.6064228, 1.147986, 0, 0, 0, 1, 1,
0.3592389, -0.5802124, 3.122837, 0, 0, 0, 1, 1,
0.3616075, -0.2293851, 1.484458, 0, 0, 0, 1, 1,
0.3663913, -0.637529, 3.188037, 0, 0, 0, 1, 1,
0.3689483, 1.799007, -0.4927807, 0, 0, 0, 1, 1,
0.3700859, -0.1507319, 0.06161396, 0, 0, 0, 1, 1,
0.3758688, -1.378038, 2.673432, 1, 1, 1, 1, 1,
0.3780613, 1.035038, -0.1333077, 1, 1, 1, 1, 1,
0.3788438, 0.224248, 0.02336444, 1, 1, 1, 1, 1,
0.3825427, 0.3258164, 1.866454, 1, 1, 1, 1, 1,
0.3966765, 0.3947602, 2.158348, 1, 1, 1, 1, 1,
0.3977811, -0.9006919, 3.365402, 1, 1, 1, 1, 1,
0.4003803, -0.807003, 3.833412, 1, 1, 1, 1, 1,
0.400397, -0.8403618, 1.808268, 1, 1, 1, 1, 1,
0.40113, -0.2872935, 3.141036, 1, 1, 1, 1, 1,
0.4027143, 0.05795779, 2.387629, 1, 1, 1, 1, 1,
0.4041952, 2.160007, 1.795994, 1, 1, 1, 1, 1,
0.4091342, 0.5551254, 1.310101, 1, 1, 1, 1, 1,
0.4120182, -0.3672793, 1.963246, 1, 1, 1, 1, 1,
0.412418, 0.6738603, 1.22709, 1, 1, 1, 1, 1,
0.4141591, 0.4256083, 0.02276577, 1, 1, 1, 1, 1,
0.420487, -1.503172, 3.051332, 0, 0, 1, 1, 1,
0.4348082, 0.4959213, 1.133023, 1, 0, 0, 1, 1,
0.4364913, -0.8640419, 2.651371, 1, 0, 0, 1, 1,
0.4391456, 2.466138, 0.985459, 1, 0, 0, 1, 1,
0.4399061, -0.1489794, 3.214412, 1, 0, 0, 1, 1,
0.4414946, -2.853059, 3.831381, 1, 0, 0, 1, 1,
0.441903, 0.01273693, 1.09878, 0, 0, 0, 1, 1,
0.442257, 0.3045749, 1.536699, 0, 0, 0, 1, 1,
0.4423026, 1.967111, -0.04903419, 0, 0, 0, 1, 1,
0.4433601, -1.288424, 2.33463, 0, 0, 0, 1, 1,
0.4497142, -1.181896, 2.594348, 0, 0, 0, 1, 1,
0.4629041, -0.1381526, 0.644007, 0, 0, 0, 1, 1,
0.465509, 0.4657648, 0.8659591, 0, 0, 0, 1, 1,
0.4658623, 1.827963, 2.66853, 1, 1, 1, 1, 1,
0.4674333, -1.028137, 3.537343, 1, 1, 1, 1, 1,
0.4705232, -0.2762438, 2.891218, 1, 1, 1, 1, 1,
0.4730811, 0.8660474, 1.014798, 1, 1, 1, 1, 1,
0.475029, 0.3048262, 1.844863, 1, 1, 1, 1, 1,
0.4782606, 0.1406065, 0.2148627, 1, 1, 1, 1, 1,
0.4849819, -0.7200374, 1.62197, 1, 1, 1, 1, 1,
0.4852595, -0.3068849, 2.815453, 1, 1, 1, 1, 1,
0.488726, 0.9475064, -0.4926812, 1, 1, 1, 1, 1,
0.4923253, 0.0460747, 2.094722, 1, 1, 1, 1, 1,
0.4930217, 0.3994064, -0.2453385, 1, 1, 1, 1, 1,
0.4951046, 0.810436, 1.111411, 1, 1, 1, 1, 1,
0.4956771, 0.3375941, 0.6611483, 1, 1, 1, 1, 1,
0.5087482, -1.217504, 2.6379, 1, 1, 1, 1, 1,
0.5094592, 0.08612391, 0.8621914, 1, 1, 1, 1, 1,
0.5096047, -0.4622995, 0.7840554, 0, 0, 1, 1, 1,
0.5101011, 0.3332361, 1.3592, 1, 0, 0, 1, 1,
0.5101978, 1.018322, 0.4920403, 1, 0, 0, 1, 1,
0.510736, 0.1671135, 1.203985, 1, 0, 0, 1, 1,
0.5130948, -1.200841, 3.081654, 1, 0, 0, 1, 1,
0.5199262, 0.5203631, 0.3661375, 1, 0, 0, 1, 1,
0.5225544, 1.78885, 0.9109865, 0, 0, 0, 1, 1,
0.524053, 1.490872, -0.1939631, 0, 0, 0, 1, 1,
0.5263244, -0.7516094, 2.228872, 0, 0, 0, 1, 1,
0.5269158, 0.3811223, -0.08146231, 0, 0, 0, 1, 1,
0.5291137, -1.074671, 2.519327, 0, 0, 0, 1, 1,
0.5294923, -0.09393713, 1.996868, 0, 0, 0, 1, 1,
0.5378477, 0.4693185, 1.575327, 0, 0, 0, 1, 1,
0.5382237, -0.4555117, 2.982435, 1, 1, 1, 1, 1,
0.5394042, 0.4670933, -0.4672873, 1, 1, 1, 1, 1,
0.5413373, 0.1057559, -0.5833587, 1, 1, 1, 1, 1,
0.5460787, 2.147695, -0.4232852, 1, 1, 1, 1, 1,
0.5466896, 0.7610804, -0.5623474, 1, 1, 1, 1, 1,
0.5526872, -0.01584991, 1.944952, 1, 1, 1, 1, 1,
0.5579208, -1.524882, 3.332145, 1, 1, 1, 1, 1,
0.5611947, -0.3435296, 1.739722, 1, 1, 1, 1, 1,
0.5626181, 0.1913211, 3.074361, 1, 1, 1, 1, 1,
0.5652469, 1.922146, -0.01113206, 1, 1, 1, 1, 1,
0.5668358, 1.037018, 1.44555, 1, 1, 1, 1, 1,
0.5681805, -0.4569659, 2.592683, 1, 1, 1, 1, 1,
0.5700188, 1.077407, 0.01662357, 1, 1, 1, 1, 1,
0.5737349, -2.225912, 4.139951, 1, 1, 1, 1, 1,
0.5761846, 0.3792987, 0.07711189, 1, 1, 1, 1, 1,
0.5778989, 0.3955277, 0.418954, 0, 0, 1, 1, 1,
0.5847418, -1.301309, 2.348656, 1, 0, 0, 1, 1,
0.589054, 0.3388442, 0.7252918, 1, 0, 0, 1, 1,
0.5918878, -1.050359, 2.963196, 1, 0, 0, 1, 1,
0.5933654, 0.4348553, 0.7358907, 1, 0, 0, 1, 1,
0.5940868, -0.1612537, 1.494912, 1, 0, 0, 1, 1,
0.5946337, -0.2179849, 0.8929923, 0, 0, 0, 1, 1,
0.6045969, -0.5378874, 3.6772, 0, 0, 0, 1, 1,
0.6056597, 0.1266587, 1.790269, 0, 0, 0, 1, 1,
0.6087126, -1.411582, 3.539906, 0, 0, 0, 1, 1,
0.612111, -0.1265656, 0.9418966, 0, 0, 0, 1, 1,
0.6131509, 1.057954, 0.7014703, 0, 0, 0, 1, 1,
0.6135811, -1.903395, 2.350214, 0, 0, 0, 1, 1,
0.6158566, 0.9171191, 1.911815, 1, 1, 1, 1, 1,
0.6162474, 2.576643, -1.371334, 1, 1, 1, 1, 1,
0.6230098, -0.6447149, 4.717868, 1, 1, 1, 1, 1,
0.6237091, 1.299024, 0.09639629, 1, 1, 1, 1, 1,
0.6273497, -0.7712018, 1.469595, 1, 1, 1, 1, 1,
0.6417574, -0.5817038, 1.719629, 1, 1, 1, 1, 1,
0.643212, -0.837764, 0.4222943, 1, 1, 1, 1, 1,
0.6446652, 0.5267166, -1.515689, 1, 1, 1, 1, 1,
0.6480355, 0.0439194, 1.143134, 1, 1, 1, 1, 1,
0.65598, 1.265849, -0.2170466, 1, 1, 1, 1, 1,
0.6560559, 0.3999976, 0.5308147, 1, 1, 1, 1, 1,
0.6607776, -0.04233188, 2.132828, 1, 1, 1, 1, 1,
0.6619006, 0.2741881, 0.8801819, 1, 1, 1, 1, 1,
0.6636581, -0.7597508, 2.153223, 1, 1, 1, 1, 1,
0.6644579, -0.06309485, 3.516876, 1, 1, 1, 1, 1,
0.6723664, 0.2896982, 1.452108, 0, 0, 1, 1, 1,
0.6726961, -0.2843007, 1.058477, 1, 0, 0, 1, 1,
0.674117, -0.3461416, 3.554439, 1, 0, 0, 1, 1,
0.6800021, 1.598105, -0.3557632, 1, 0, 0, 1, 1,
0.6803135, 0.825241, 2.572771, 1, 0, 0, 1, 1,
0.6915507, -0.1247354, -0.453187, 1, 0, 0, 1, 1,
0.6916775, 0.9020805, -0.9403787, 0, 0, 0, 1, 1,
0.691966, -0.5642644, 2.917161, 0, 0, 0, 1, 1,
0.6926911, -0.05941388, 1.944296, 0, 0, 0, 1, 1,
0.6946399, -0.6978816, 1.716512, 0, 0, 0, 1, 1,
0.6951816, -0.08706538, 2.045811, 0, 0, 0, 1, 1,
0.7006189, 0.518684, 1.08114, 0, 0, 0, 1, 1,
0.7020887, 0.4174576, 0.4962893, 0, 0, 0, 1, 1,
0.7120936, 1.650715, 0.6145722, 1, 1, 1, 1, 1,
0.7180867, 0.8599754, 1.688606, 1, 1, 1, 1, 1,
0.7194403, 0.1962057, -0.1816536, 1, 1, 1, 1, 1,
0.7213025, 2.030185, 0.3281657, 1, 1, 1, 1, 1,
0.7220989, 0.7478289, 0.3125194, 1, 1, 1, 1, 1,
0.7227895, -0.08192811, 2.96003, 1, 1, 1, 1, 1,
0.7229603, 0.421822, 0.6380372, 1, 1, 1, 1, 1,
0.7257274, 1.465134, 0.2433932, 1, 1, 1, 1, 1,
0.7286448, 0.4347789, 0.5261452, 1, 1, 1, 1, 1,
0.7366695, -0.2337406, 1.943199, 1, 1, 1, 1, 1,
0.7388908, 0.3806739, 1.429282, 1, 1, 1, 1, 1,
0.7433481, 0.4390042, 0.899747, 1, 1, 1, 1, 1,
0.7467716, -0.9994943, 3.365408, 1, 1, 1, 1, 1,
0.7506416, -0.4242628, 2.357985, 1, 1, 1, 1, 1,
0.7569112, -0.2018652, 0.3056485, 1, 1, 1, 1, 1,
0.7587929, -2.851985, 1.663163, 0, 0, 1, 1, 1,
0.758964, -0.4853673, 2.751904, 1, 0, 0, 1, 1,
0.759344, 0.2092775, 1.548225, 1, 0, 0, 1, 1,
0.7747191, -0.5703869, 0.334092, 1, 0, 0, 1, 1,
0.7755268, -0.2221721, 3.607632, 1, 0, 0, 1, 1,
0.7786837, 0.01099366, 1.563614, 1, 0, 0, 1, 1,
0.7845402, -2.232752, 4.750353, 0, 0, 0, 1, 1,
0.786043, -0.7127718, 0.5415298, 0, 0, 0, 1, 1,
0.7862641, -1.060426, 3.943557, 0, 0, 0, 1, 1,
0.7933882, -0.4876018, 1.586811, 0, 0, 0, 1, 1,
0.797507, -0.4239827, 1.807623, 0, 0, 0, 1, 1,
0.7978761, 0.9405675, 0.3452992, 0, 0, 0, 1, 1,
0.8004159, -0.7784607, 3.397394, 0, 0, 0, 1, 1,
0.8057199, -0.7517862, 2.106146, 1, 1, 1, 1, 1,
0.8106461, -1.839335, 2.163741, 1, 1, 1, 1, 1,
0.8125257, -0.01271549, 1.839574, 1, 1, 1, 1, 1,
0.8158278, 0.5300092, 1.577357, 1, 1, 1, 1, 1,
0.8161458, -1.268317, 2.748582, 1, 1, 1, 1, 1,
0.8191429, 0.4248598, 0.6458684, 1, 1, 1, 1, 1,
0.8208535, 0.7735342, 2.262036, 1, 1, 1, 1, 1,
0.8235955, -1.637328, 2.902575, 1, 1, 1, 1, 1,
0.8265817, -0.4140567, 3.116452, 1, 1, 1, 1, 1,
0.8268917, 1.382934, 0.2443379, 1, 1, 1, 1, 1,
0.8278744, -0.871567, 1.945433, 1, 1, 1, 1, 1,
0.8313254, -0.7242194, 3.145791, 1, 1, 1, 1, 1,
0.8349975, -0.04453032, 0.7023809, 1, 1, 1, 1, 1,
0.8375682, 0.07366012, 1.920826, 1, 1, 1, 1, 1,
0.8434702, 1.850487, -0.2719708, 1, 1, 1, 1, 1,
0.8443831, 0.8580427, 1.372624, 0, 0, 1, 1, 1,
0.8510765, -0.2507522, 3.662228, 1, 0, 0, 1, 1,
0.8636993, -0.661073, 3.890477, 1, 0, 0, 1, 1,
0.867338, 1.31901, 1.739751, 1, 0, 0, 1, 1,
0.8705046, -0.9121565, 2.18536, 1, 0, 0, 1, 1,
0.8717312, 0.1991304, 1.573698, 1, 0, 0, 1, 1,
0.8736796, 0.1011078, 0.7103302, 0, 0, 0, 1, 1,
0.8785406, -1.164559, 1.845071, 0, 0, 0, 1, 1,
0.893775, -1.012168, 3.382619, 0, 0, 0, 1, 1,
0.8946415, 0.8588385, 1.035197, 0, 0, 0, 1, 1,
0.8981707, -0.256301, 2.16539, 0, 0, 0, 1, 1,
0.9024971, 1.486584, 0.07316186, 0, 0, 0, 1, 1,
0.9043483, 0.2817971, 1.225269, 0, 0, 0, 1, 1,
0.9080803, 0.6037005, 0.5483103, 1, 1, 1, 1, 1,
0.908949, 1.512107, -0.692301, 1, 1, 1, 1, 1,
0.9149474, -0.5799033, 3.119826, 1, 1, 1, 1, 1,
0.9174483, 1.33173, 0.9955921, 1, 1, 1, 1, 1,
0.9200115, -0.3718577, 1.584899, 1, 1, 1, 1, 1,
0.9228864, 0.8507788, 0.1815174, 1, 1, 1, 1, 1,
0.9268888, -1.394628, 4.857554, 1, 1, 1, 1, 1,
0.9347421, 0.3534625, 0.5495806, 1, 1, 1, 1, 1,
0.9363175, -0.7170498, 5.110063, 1, 1, 1, 1, 1,
0.9374251, 0.2124758, 0.1049324, 1, 1, 1, 1, 1,
0.9417697, -0.4947431, 4.162612, 1, 1, 1, 1, 1,
0.9475883, 2.141467, 0.3447828, 1, 1, 1, 1, 1,
0.9489945, -0.0757068, 2.499929, 1, 1, 1, 1, 1,
0.9498137, 1.35122, -0.1512982, 1, 1, 1, 1, 1,
0.9570362, 0.426597, 3.218525, 1, 1, 1, 1, 1,
0.9590734, 0.1626403, 0.567477, 0, 0, 1, 1, 1,
0.9625947, -0.03708872, 2.182053, 1, 0, 0, 1, 1,
0.9633352, -1.675374, 2.140773, 1, 0, 0, 1, 1,
0.9735425, 1.109875, 0.9133042, 1, 0, 0, 1, 1,
0.983052, -0.2480051, 2.070196, 1, 0, 0, 1, 1,
0.9830598, 1.066538, -0.8620691, 1, 0, 0, 1, 1,
0.9854319, -0.4539309, 1.068893, 0, 0, 0, 1, 1,
0.9895595, 0.2751093, 1.179101, 0, 0, 0, 1, 1,
0.9898421, 0.7809948, 0.1749682, 0, 0, 0, 1, 1,
0.9899374, -0.3326903, 1.221886, 0, 0, 0, 1, 1,
0.9918692, 2.225163, 1.660657, 0, 0, 0, 1, 1,
0.9945027, 0.1375381, 0.8015988, 0, 0, 0, 1, 1,
1.00015, -0.621048, 2.867853, 0, 0, 0, 1, 1,
1.003885, 0.5147699, 1.413805, 1, 1, 1, 1, 1,
1.012739, 1.5934, 0.5267973, 1, 1, 1, 1, 1,
1.015645, -2.314731, 2.950495, 1, 1, 1, 1, 1,
1.020334, 0.7141573, 0.9448422, 1, 1, 1, 1, 1,
1.024281, -0.08700915, 0.8813993, 1, 1, 1, 1, 1,
1.025132, -0.8508478, 3.783287, 1, 1, 1, 1, 1,
1.031361, -1.965321, 2.562575, 1, 1, 1, 1, 1,
1.034126, 0.5432856, -1.407637, 1, 1, 1, 1, 1,
1.039406, -1.339217, 0.8242751, 1, 1, 1, 1, 1,
1.041229, 0.2959949, -0.363317, 1, 1, 1, 1, 1,
1.044292, -0.3718763, 3.270471, 1, 1, 1, 1, 1,
1.04753, -3.097303, 2.690556, 1, 1, 1, 1, 1,
1.050149, 0.9062234, 0.2731333, 1, 1, 1, 1, 1,
1.051294, 0.5691825, 3.01972, 1, 1, 1, 1, 1,
1.058718, -0.4806575, 2.311313, 1, 1, 1, 1, 1,
1.060232, 1.012456, 2.072001, 0, 0, 1, 1, 1,
1.065337, 0.007782012, 1.693706, 1, 0, 0, 1, 1,
1.067112, 0.4633535, -0.9324679, 1, 0, 0, 1, 1,
1.07263, -1.413734, 0.6135734, 1, 0, 0, 1, 1,
1.077701, 0.1307184, 2.592497, 1, 0, 0, 1, 1,
1.080681, -0.5661104, 0.3417532, 1, 0, 0, 1, 1,
1.094709, -0.358951, 3.162674, 0, 0, 0, 1, 1,
1.096728, 0.9313187, 1.184492, 0, 0, 0, 1, 1,
1.099743, 1.809226, 1.062649, 0, 0, 0, 1, 1,
1.104202, 1.889388, 1.488055, 0, 0, 0, 1, 1,
1.112954, 0.7183551, 1.58287, 0, 0, 0, 1, 1,
1.113915, -1.164603, 1.874215, 0, 0, 0, 1, 1,
1.118373, 0.2531267, 1.438874, 0, 0, 0, 1, 1,
1.123036, 0.02114123, 1.586223, 1, 1, 1, 1, 1,
1.124343, -0.6553264, 1.247213, 1, 1, 1, 1, 1,
1.125238, -0.08233992, -0.4485109, 1, 1, 1, 1, 1,
1.12574, -0.1549401, 0.405608, 1, 1, 1, 1, 1,
1.127845, -2.055431, 2.423589, 1, 1, 1, 1, 1,
1.128371, 0.4731807, 0.3350852, 1, 1, 1, 1, 1,
1.132837, 0.5522358, 0.8955579, 1, 1, 1, 1, 1,
1.147895, 0.8222724, -0.7358422, 1, 1, 1, 1, 1,
1.149965, 0.7864057, 1.006649, 1, 1, 1, 1, 1,
1.159669, -0.08245966, 0.04651899, 1, 1, 1, 1, 1,
1.159682, 0.1183386, 0.5454695, 1, 1, 1, 1, 1,
1.163019, 0.497307, 1.917362, 1, 1, 1, 1, 1,
1.164255, -0.7774205, 2.237123, 1, 1, 1, 1, 1,
1.173856, -0.5206915, 1.868088, 1, 1, 1, 1, 1,
1.175898, -0.1423468, 2.414737, 1, 1, 1, 1, 1,
1.176671, -1.38332, 1.068207, 0, 0, 1, 1, 1,
1.1773, 1.400881, 0.382677, 1, 0, 0, 1, 1,
1.177764, -0.6610772, 1.551009, 1, 0, 0, 1, 1,
1.204149, 0.6739858, 1.047325, 1, 0, 0, 1, 1,
1.216075, -0.1365835, 2.355242, 1, 0, 0, 1, 1,
1.226421, 2.512575, -1.313273, 1, 0, 0, 1, 1,
1.228416, -0.3817931, 3.377859, 0, 0, 0, 1, 1,
1.238772, -1.379482, 2.723046, 0, 0, 0, 1, 1,
1.239371, 1.21115, 0.6402898, 0, 0, 0, 1, 1,
1.24092, 0.2138887, 1.436821, 0, 0, 0, 1, 1,
1.250737, 0.3811555, 1.169969, 0, 0, 0, 1, 1,
1.282496, -0.02533228, 1.507155, 0, 0, 0, 1, 1,
1.284292, 1.285652, 1.65433, 0, 0, 0, 1, 1,
1.292117, -0.2327386, 1.184242, 1, 1, 1, 1, 1,
1.292225, 1.746387, 0.08230276, 1, 1, 1, 1, 1,
1.296054, -1.225134, 2.507043, 1, 1, 1, 1, 1,
1.297248, 0.6385841, -0.01616462, 1, 1, 1, 1, 1,
1.302363, 0.1530446, 1.376588, 1, 1, 1, 1, 1,
1.308108, 0.5458152, 0.6432523, 1, 1, 1, 1, 1,
1.315877, -0.3634214, 2.398195, 1, 1, 1, 1, 1,
1.316224, 1.897798, 0.8811497, 1, 1, 1, 1, 1,
1.32367, -1.43831, 0.7333277, 1, 1, 1, 1, 1,
1.327279, 0.517758, 0.7465246, 1, 1, 1, 1, 1,
1.330239, 0.6940213, 2.47693, 1, 1, 1, 1, 1,
1.333887, -0.8255644, 2.717082, 1, 1, 1, 1, 1,
1.337808, 0.1360801, 1.56626, 1, 1, 1, 1, 1,
1.348844, 0.501585, 0.8780312, 1, 1, 1, 1, 1,
1.353054, -0.6157531, 2.615897, 1, 1, 1, 1, 1,
1.354766, 0.9849159, -0.3058984, 0, 0, 1, 1, 1,
1.357494, -0.9159117, 2.854881, 1, 0, 0, 1, 1,
1.375236, 0.9322705, 1.683552, 1, 0, 0, 1, 1,
1.385642, 1.985571, 0.9512827, 1, 0, 0, 1, 1,
1.391352, -1.037113, 2.051292, 1, 0, 0, 1, 1,
1.395331, -0.08595673, 2.145077, 1, 0, 0, 1, 1,
1.40016, 1.065775, -1.311749, 0, 0, 0, 1, 1,
1.407272, 0.6396083, 1.946922, 0, 0, 0, 1, 1,
1.434497, -0.7597411, 1.569704, 0, 0, 0, 1, 1,
1.456235, 2.662325, 0.3760957, 0, 0, 0, 1, 1,
1.460366, 1.080062, -1.237387, 0, 0, 0, 1, 1,
1.461319, 1.898105, 0.5645119, 0, 0, 0, 1, 1,
1.480519, -1.183592, 0.6170998, 0, 0, 0, 1, 1,
1.493018, -0.5300813, 1.43688, 1, 1, 1, 1, 1,
1.499103, -0.2386188, 1.154058, 1, 1, 1, 1, 1,
1.500765, -0.2496669, 2.586408, 1, 1, 1, 1, 1,
1.510817, -1.362596, 2.295521, 1, 1, 1, 1, 1,
1.515073, -0.2693401, 2.056435, 1, 1, 1, 1, 1,
1.518363, 0.5626684, 1.154673, 1, 1, 1, 1, 1,
1.527702, 0.6947697, 1.510812, 1, 1, 1, 1, 1,
1.535246, 0.5857021, 1.451195, 1, 1, 1, 1, 1,
1.536231, 0.8341093, 0.66074, 1, 1, 1, 1, 1,
1.53861, 0.416334, 1.417997, 1, 1, 1, 1, 1,
1.541866, 0.649442, 0.821577, 1, 1, 1, 1, 1,
1.546121, 2.003719, 0.5205352, 1, 1, 1, 1, 1,
1.57177, -0.8008947, 1.660611, 1, 1, 1, 1, 1,
1.578707, -0.572744, 2.710417, 1, 1, 1, 1, 1,
1.582602, 1.092726, 1.946818, 1, 1, 1, 1, 1,
1.585521, -0.3593735, 0.958743, 0, 0, 1, 1, 1,
1.593036, 1.314787, 0.2566924, 1, 0, 0, 1, 1,
1.595623, -0.8311378, 2.76241, 1, 0, 0, 1, 1,
1.60053, 0.5057895, 0.1425701, 1, 0, 0, 1, 1,
1.604127, -0.2283638, 2.916799, 1, 0, 0, 1, 1,
1.61723, -0.4495352, 1.230643, 1, 0, 0, 1, 1,
1.630794, 0.8728399, -0.3853403, 0, 0, 0, 1, 1,
1.642432, -0.7806506, 3.767744, 0, 0, 0, 1, 1,
1.647093, 0.546639, 0.294512, 0, 0, 0, 1, 1,
1.647876, 1.953661, 0.6751284, 0, 0, 0, 1, 1,
1.650917, -0.0911535, 4.10006, 0, 0, 0, 1, 1,
1.670561, -0.7209166, 2.374974, 0, 0, 0, 1, 1,
1.681789, -1.669691, 2.493216, 0, 0, 0, 1, 1,
1.689257, -1.180922, 0.6701475, 1, 1, 1, 1, 1,
1.699779, -2.103888, 1.659301, 1, 1, 1, 1, 1,
1.706035, -0.6181428, 1.338795, 1, 1, 1, 1, 1,
1.711049, 0.2136671, 2.067594, 1, 1, 1, 1, 1,
1.716386, -0.1183192, 1.967423, 1, 1, 1, 1, 1,
1.716514, -1.736292, 2.728697, 1, 1, 1, 1, 1,
1.717329, 0.4537217, 0.9049454, 1, 1, 1, 1, 1,
1.718926, -0.04649981, 0.02142621, 1, 1, 1, 1, 1,
1.723567, -0.2780266, 2.274267, 1, 1, 1, 1, 1,
1.733274, 0.1031857, 1.085759, 1, 1, 1, 1, 1,
1.743354, 0.2457351, 2.257129, 1, 1, 1, 1, 1,
1.76318, 0.619165, 1.924131, 1, 1, 1, 1, 1,
1.779601, 0.2359674, 1.539234, 1, 1, 1, 1, 1,
1.780316, 1.479657, 1.042972, 1, 1, 1, 1, 1,
1.794324, -0.3682473, 0.1258763, 1, 1, 1, 1, 1,
1.797137, -1.053261, 1.688994, 0, 0, 1, 1, 1,
1.809809, 0.8518306, 1.627025, 1, 0, 0, 1, 1,
1.811275, -0.4465653, 1.881058, 1, 0, 0, 1, 1,
1.811423, 0.6738905, 0.3981181, 1, 0, 0, 1, 1,
1.869599, -1.091763, 3.208563, 1, 0, 0, 1, 1,
1.930158, -0.4540153, 0.8398146, 1, 0, 0, 1, 1,
1.930334, 1.557348, 1.199664, 0, 0, 0, 1, 1,
2.040241, 0.2281802, 4.163002, 0, 0, 0, 1, 1,
2.050853, -0.5804414, 1.877943, 0, 0, 0, 1, 1,
2.059461, -1.311361, 2.203085, 0, 0, 0, 1, 1,
2.075601, 0.1265581, 0.01820605, 0, 0, 0, 1, 1,
2.157293, -0.1973391, 0.3693079, 0, 0, 0, 1, 1,
2.204829, 0.03103911, 1.703372, 0, 0, 0, 1, 1,
2.262982, 0.5284753, 3.133193, 1, 1, 1, 1, 1,
2.276056, -0.3591471, 1.199955, 1, 1, 1, 1, 1,
2.307533, 0.4212922, 1.221207, 1, 1, 1, 1, 1,
2.3515, 1.095838, -0.06274697, 1, 1, 1, 1, 1,
2.502626, 0.1284342, 1.367445, 1, 1, 1, 1, 1,
2.607916, -0.2624645, 0.9852503, 1, 1, 1, 1, 1,
2.925658, 1.373061, 2.287065, 1, 1, 1, 1, 1
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
var radius = 9.584397;
var distance = 33.66479;
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
mvMatrix.translate( 0.06483352, -0.1169455, -0.01192689 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66479);
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
