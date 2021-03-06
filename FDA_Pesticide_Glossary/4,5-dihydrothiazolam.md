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
-3.181591, -0.4513469, -0.8385013, 1, 0, 0, 1,
-3.04233, 0.003907842, -0.4442653, 1, 0.007843138, 0, 1,
-2.877191, -0.6361959, -1.759351, 1, 0.01176471, 0, 1,
-2.820061, 0.3106857, -0.5792098, 1, 0.01960784, 0, 1,
-2.566209, -0.9449536, -0.1067439, 1, 0.02352941, 0, 1,
-2.549841, 0.2981738, -2.777761, 1, 0.03137255, 0, 1,
-2.442343, 1.227724, -1.605951, 1, 0.03529412, 0, 1,
-2.420303, -0.1897962, -0.7767136, 1, 0.04313726, 0, 1,
-2.288497, 0.5793165, 0.01842665, 1, 0.04705882, 0, 1,
-2.267069, 0.8161204, -0.3920629, 1, 0.05490196, 0, 1,
-2.259199, 1.301072, -1.434044, 1, 0.05882353, 0, 1,
-2.23186, -0.8582021, -0.2465412, 1, 0.06666667, 0, 1,
-2.208045, -1.380429, -1.735512, 1, 0.07058824, 0, 1,
-2.200444, 0.1906664, -1.731038, 1, 0.07843138, 0, 1,
-2.162167, 1.015245, -1.149231, 1, 0.08235294, 0, 1,
-2.121614, 0.1583819, -1.959759, 1, 0.09019608, 0, 1,
-2.121593, 1.001792, -0.8864251, 1, 0.09411765, 0, 1,
-2.110277, 0.2818535, -1.800407, 1, 0.1019608, 0, 1,
-2.03512, 0.8639483, -1.405215, 1, 0.1098039, 0, 1,
-2.006432, 0.8822332, -1.596646, 1, 0.1137255, 0, 1,
-1.994819, 0.05598594, -0.8883123, 1, 0.1215686, 0, 1,
-1.950764, 1.393761, 0.08800976, 1, 0.1254902, 0, 1,
-1.948509, 1.594332, -0.868689, 1, 0.1333333, 0, 1,
-1.938599, 0.4903539, -1.547559, 1, 0.1372549, 0, 1,
-1.917828, 1.047965, -2.22731, 1, 0.145098, 0, 1,
-1.917249, 0.1661834, -0.4600233, 1, 0.1490196, 0, 1,
-1.911209, 0.1049476, -1.592717, 1, 0.1568628, 0, 1,
-1.876488, 0.1655944, -1.777583, 1, 0.1607843, 0, 1,
-1.866575, -1.154281, -3.421132, 1, 0.1686275, 0, 1,
-1.863096, -1.097137, -1.901648, 1, 0.172549, 0, 1,
-1.834056, -0.2550244, -2.317016, 1, 0.1803922, 0, 1,
-1.83269, 0.01025909, -1.821311, 1, 0.1843137, 0, 1,
-1.831173, -1.105994, -2.675268, 1, 0.1921569, 0, 1,
-1.817802, -0.1089403, -1.420566, 1, 0.1960784, 0, 1,
-1.812749, -0.6542014, -2.263242, 1, 0.2039216, 0, 1,
-1.812678, 0.9188201, -0.6676847, 1, 0.2117647, 0, 1,
-1.809903, 0.2765368, -1.060006, 1, 0.2156863, 0, 1,
-1.762399, 1.550924, -1.384683, 1, 0.2235294, 0, 1,
-1.757311, 2.669671, -0.2442003, 1, 0.227451, 0, 1,
-1.751404, 0.3314499, -1.93224, 1, 0.2352941, 0, 1,
-1.749817, 0.978165, -1.689016, 1, 0.2392157, 0, 1,
-1.738337, 0.3483673, -0.8766419, 1, 0.2470588, 0, 1,
-1.71965, 0.8175893, -0.6658127, 1, 0.2509804, 0, 1,
-1.717893, 0.6459913, -0.630285, 1, 0.2588235, 0, 1,
-1.717774, -1.152632, -0.95867, 1, 0.2627451, 0, 1,
-1.71758, 1.276477, -2.526644, 1, 0.2705882, 0, 1,
-1.709511, 0.3666239, -1.359186, 1, 0.2745098, 0, 1,
-1.705403, -1.53554, -3.077584, 1, 0.282353, 0, 1,
-1.70373, 1.583136, -0.05425449, 1, 0.2862745, 0, 1,
-1.692765, 0.3524722, -1.703453, 1, 0.2941177, 0, 1,
-1.680521, -1.700071, -4.827657, 1, 0.3019608, 0, 1,
-1.678715, 1.167452, -1.060922, 1, 0.3058824, 0, 1,
-1.672401, -1.887053, -2.025857, 1, 0.3137255, 0, 1,
-1.660693, -0.3001455, -4.327898, 1, 0.3176471, 0, 1,
-1.6541, 1.185386, -0.3194765, 1, 0.3254902, 0, 1,
-1.650514, -0.0484083, -0.328714, 1, 0.3294118, 0, 1,
-1.64749, -0.9007844, -2.745165, 1, 0.3372549, 0, 1,
-1.638446, 0.627776, -0.6673004, 1, 0.3411765, 0, 1,
-1.629637, 1.812463, -0.578681, 1, 0.3490196, 0, 1,
-1.625944, 0.6550726, 0.2695345, 1, 0.3529412, 0, 1,
-1.605597, 0.07940536, 0.6099828, 1, 0.3607843, 0, 1,
-1.600103, -0.713643, -2.463862, 1, 0.3647059, 0, 1,
-1.59859, 0.3326074, 0.6286173, 1, 0.372549, 0, 1,
-1.58885, 0.04395192, -2.408889, 1, 0.3764706, 0, 1,
-1.576543, -0.06415627, -2.42765, 1, 0.3843137, 0, 1,
-1.56902, -0.8063086, -2.2496, 1, 0.3882353, 0, 1,
-1.556744, -0.2229225, -2.553408, 1, 0.3960784, 0, 1,
-1.555447, -0.4844218, -2.207982, 1, 0.4039216, 0, 1,
-1.554813, 1.606639, -0.3257373, 1, 0.4078431, 0, 1,
-1.537216, -1.069476, -2.083894, 1, 0.4156863, 0, 1,
-1.534623, 0.4280805, -1.614946, 1, 0.4196078, 0, 1,
-1.530937, 0.7686403, 0.8491574, 1, 0.427451, 0, 1,
-1.530777, 1.257375, -0.04688885, 1, 0.4313726, 0, 1,
-1.524106, 0.8593507, 0.4437807, 1, 0.4392157, 0, 1,
-1.519104, 0.4165251, -1.136903, 1, 0.4431373, 0, 1,
-1.500564, -0.2322891, -2.885654, 1, 0.4509804, 0, 1,
-1.499614, 1.623131, -1.866525, 1, 0.454902, 0, 1,
-1.493517, -0.2558136, -2.311624, 1, 0.4627451, 0, 1,
-1.49321, 1.153908, 0.08156547, 1, 0.4666667, 0, 1,
-1.487774, -1.662077, -1.281999, 1, 0.4745098, 0, 1,
-1.485045, -1.821585, -4.608424, 1, 0.4784314, 0, 1,
-1.475376, 0.06927484, -0.5838782, 1, 0.4862745, 0, 1,
-1.471134, -0.04515281, -1.227462, 1, 0.4901961, 0, 1,
-1.467151, 0.2792222, -0.3220622, 1, 0.4980392, 0, 1,
-1.462954, -0.3372711, -0.8138898, 1, 0.5058824, 0, 1,
-1.455143, -1.378288, -4.525702, 1, 0.509804, 0, 1,
-1.451481, -0.9583398, -2.155894, 1, 0.5176471, 0, 1,
-1.450331, 0.961463, 0.9081468, 1, 0.5215687, 0, 1,
-1.448727, 0.3829671, -1.472858, 1, 0.5294118, 0, 1,
-1.447949, -0.6774849, -1.557891, 1, 0.5333334, 0, 1,
-1.447635, 1.693952, -0.9988756, 1, 0.5411765, 0, 1,
-1.438119, -0.9407815, -2.453481, 1, 0.5450981, 0, 1,
-1.426051, -0.2577879, -1.509734, 1, 0.5529412, 0, 1,
-1.421568, 1.198937, -0.1351794, 1, 0.5568628, 0, 1,
-1.407818, -0.2482609, -1.339776, 1, 0.5647059, 0, 1,
-1.399076, -0.2700993, -1.599471, 1, 0.5686275, 0, 1,
-1.39438, -1.294005, -0.645249, 1, 0.5764706, 0, 1,
-1.389671, -1.452299, -0.9794533, 1, 0.5803922, 0, 1,
-1.3845, 0.5719042, -0.499698, 1, 0.5882353, 0, 1,
-1.383079, -0.6667878, -0.3717512, 1, 0.5921569, 0, 1,
-1.379447, -0.3557378, -3.499829, 1, 0.6, 0, 1,
-1.371178, -0.09672462, -1.65949, 1, 0.6078432, 0, 1,
-1.367376, 2.104682, 1.019151, 1, 0.6117647, 0, 1,
-1.364971, -0.9073455, -1.075445, 1, 0.6196079, 0, 1,
-1.3625, 1.773215, -0.7663702, 1, 0.6235294, 0, 1,
-1.34695, -0.721646, -3.450876, 1, 0.6313726, 0, 1,
-1.324988, -0.9709383, -1.574501, 1, 0.6352941, 0, 1,
-1.32017, 0.08991385, -1.107851, 1, 0.6431373, 0, 1,
-1.319424, 2.043849, -1.508224, 1, 0.6470588, 0, 1,
-1.316428, 0.8766307, 0.08144789, 1, 0.654902, 0, 1,
-1.310771, -0.8687706, -2.586231, 1, 0.6588235, 0, 1,
-1.304686, -0.4664992, -2.393433, 1, 0.6666667, 0, 1,
-1.30355, 0.6384688, -0.5877191, 1, 0.6705883, 0, 1,
-1.296607, 0.200517, -0.4653562, 1, 0.6784314, 0, 1,
-1.293217, 1.544071, -1.93865, 1, 0.682353, 0, 1,
-1.288406, 0.7710426, -1.076488, 1, 0.6901961, 0, 1,
-1.261449, -0.97705, -2.529613, 1, 0.6941177, 0, 1,
-1.258621, 0.1826679, -1.025314, 1, 0.7019608, 0, 1,
-1.253481, 0.846106, 0.5541549, 1, 0.7098039, 0, 1,
-1.252992, 0.034857, -1.87013, 1, 0.7137255, 0, 1,
-1.251254, -0.6519463, -0.3011871, 1, 0.7215686, 0, 1,
-1.250416, -1.07491, -2.49658, 1, 0.7254902, 0, 1,
-1.250045, 0.396029, 0.1730695, 1, 0.7333333, 0, 1,
-1.22519, 0.6083014, -2.823801, 1, 0.7372549, 0, 1,
-1.221537, -0.4964683, -2.069107, 1, 0.7450981, 0, 1,
-1.217825, 0.5804908, -0.8368461, 1, 0.7490196, 0, 1,
-1.213632, -0.9399505, -2.6022, 1, 0.7568628, 0, 1,
-1.205771, 0.8324292, -2.651749, 1, 0.7607843, 0, 1,
-1.201156, 0.6034128, -0.9641939, 1, 0.7686275, 0, 1,
-1.196957, -1.220478, -0.9959269, 1, 0.772549, 0, 1,
-1.196774, -0.07144579, -0.7673329, 1, 0.7803922, 0, 1,
-1.194157, 0.9633826, -0.5760753, 1, 0.7843137, 0, 1,
-1.183693, -0.6636751, -1.458388, 1, 0.7921569, 0, 1,
-1.170924, 0.6626784, -2.733433, 1, 0.7960784, 0, 1,
-1.163433, -1.347528, -1.776681, 1, 0.8039216, 0, 1,
-1.15744, 0.5741133, -1.791403, 1, 0.8117647, 0, 1,
-1.150719, 1.727351, 0.5017428, 1, 0.8156863, 0, 1,
-1.150282, -1.735184, -3.20121, 1, 0.8235294, 0, 1,
-1.143758, 0.5494237, -1.719485, 1, 0.827451, 0, 1,
-1.14207, -0.7350096, -3.071172, 1, 0.8352941, 0, 1,
-1.138103, -0.4737068, -2.054603, 1, 0.8392157, 0, 1,
-1.134668, -0.2573946, -2.230951, 1, 0.8470588, 0, 1,
-1.134438, -1.295412, -1.89799, 1, 0.8509804, 0, 1,
-1.130281, 0.2262278, -2.449994, 1, 0.8588235, 0, 1,
-1.128128, -0.4190716, -1.881938, 1, 0.8627451, 0, 1,
-1.127845, 0.3876671, -2.685916, 1, 0.8705882, 0, 1,
-1.125267, -2.283364, -1.790476, 1, 0.8745098, 0, 1,
-1.122224, -0.925636, -2.088282, 1, 0.8823529, 0, 1,
-1.120866, 0.1301101, -2.130489, 1, 0.8862745, 0, 1,
-1.119007, -1.685374, -3.87163, 1, 0.8941177, 0, 1,
-1.116671, 1.180267, -1.582992, 1, 0.8980392, 0, 1,
-1.11639, -2.435757, -2.124319, 1, 0.9058824, 0, 1,
-1.116103, 0.4589563, -0.9673672, 1, 0.9137255, 0, 1,
-1.11064, -0.2751712, 0.1642394, 1, 0.9176471, 0, 1,
-1.108736, 0.4947296, -0.6714689, 1, 0.9254902, 0, 1,
-1.105402, -0.7698857, -3.074603, 1, 0.9294118, 0, 1,
-1.102061, 0.5361583, -1.505524, 1, 0.9372549, 0, 1,
-1.098284, 0.5022087, -0.252492, 1, 0.9411765, 0, 1,
-1.089964, 0.4841237, -0.6618803, 1, 0.9490196, 0, 1,
-1.088569, 0.1429596, -1.587293, 1, 0.9529412, 0, 1,
-1.086401, 0.8221742, -0.8012478, 1, 0.9607843, 0, 1,
-1.080313, -1.3642, -1.413056, 1, 0.9647059, 0, 1,
-1.075557, -0.6736739, -2.825687, 1, 0.972549, 0, 1,
-1.072291, 1.150315, 0.584657, 1, 0.9764706, 0, 1,
-1.071059, 0.3997881, -0.6963359, 1, 0.9843137, 0, 1,
-1.062422, 0.4446748, -0.6349766, 1, 0.9882353, 0, 1,
-1.062301, -1.019551, -2.89599, 1, 0.9960784, 0, 1,
-1.055364, 0.305368, -0.5494845, 0.9960784, 1, 0, 1,
-1.052761, 0.1186125, -1.203838, 0.9921569, 1, 0, 1,
-1.051938, -3.018848, -2.466923, 0.9843137, 1, 0, 1,
-1.042442, -1.968153, -3.514202, 0.9803922, 1, 0, 1,
-1.037605, 1.434583, -0.5822653, 0.972549, 1, 0, 1,
-1.029903, -0.2209488, -2.451064, 0.9686275, 1, 0, 1,
-1.027334, 0.4720154, -2.108497, 0.9607843, 1, 0, 1,
-1.027029, -0.1771329, -1.62357, 0.9568627, 1, 0, 1,
-1.023634, -1.353542, -2.597089, 0.9490196, 1, 0, 1,
-1.023352, 0.2876563, -1.18041, 0.945098, 1, 0, 1,
-1.022926, -1.313454, -1.617557, 0.9372549, 1, 0, 1,
-1.020652, 1.909116, -0.329623, 0.9333333, 1, 0, 1,
-1.016178, -0.5469607, -3.056998, 0.9254902, 1, 0, 1,
-1.012618, -0.5945736, -2.934643, 0.9215686, 1, 0, 1,
-1.012015, -1.332709, -2.113621, 0.9137255, 1, 0, 1,
-1.007487, 0.6624482, -2.274398, 0.9098039, 1, 0, 1,
-1.006242, 0.4408428, -0.5438766, 0.9019608, 1, 0, 1,
-1.002034, 1.103952, -0.5445883, 0.8941177, 1, 0, 1,
-0.9995598, 0.6503161, -2.064797, 0.8901961, 1, 0, 1,
-0.9948978, 1.567088, -1.242724, 0.8823529, 1, 0, 1,
-0.9944727, 0.8499081, 0.7538345, 0.8784314, 1, 0, 1,
-0.9929215, 0.01123948, -1.20557, 0.8705882, 1, 0, 1,
-0.9904459, -0.678059, -1.608664, 0.8666667, 1, 0, 1,
-0.9845674, 0.6305311, -1.656104, 0.8588235, 1, 0, 1,
-0.9818416, 1.954665, -0.5890998, 0.854902, 1, 0, 1,
-0.9816809, -0.6738247, -0.816962, 0.8470588, 1, 0, 1,
-0.9720858, -1.117856, -3.401699, 0.8431373, 1, 0, 1,
-0.9718887, 0.0458911, -0.3719543, 0.8352941, 1, 0, 1,
-0.9624715, 0.2937137, -2.585905, 0.8313726, 1, 0, 1,
-0.959277, -0.0643763, -1.671687, 0.8235294, 1, 0, 1,
-0.9526376, -0.7478295, -0.9140661, 0.8196079, 1, 0, 1,
-0.9525748, 1.231197, -0.369208, 0.8117647, 1, 0, 1,
-0.9520239, -0.3129037, -2.410154, 0.8078431, 1, 0, 1,
-0.9484369, 0.4510027, 0.4342618, 0.8, 1, 0, 1,
-0.926979, 0.1999018, -0.8783696, 0.7921569, 1, 0, 1,
-0.9227304, -0.6697281, -3.861379, 0.7882353, 1, 0, 1,
-0.9150736, -1.527283, -4.314826, 0.7803922, 1, 0, 1,
-0.9077352, 1.119009, -0.3515315, 0.7764706, 1, 0, 1,
-0.9052334, 1.123427, -0.7616953, 0.7686275, 1, 0, 1,
-0.9043462, -1.229287, -3.556394, 0.7647059, 1, 0, 1,
-0.9013919, -2.017635, -2.169806, 0.7568628, 1, 0, 1,
-0.8977715, 0.07629849, -0.4381528, 0.7529412, 1, 0, 1,
-0.8935747, 0.7472317, 1.299582, 0.7450981, 1, 0, 1,
-0.8935475, -0.1627683, -0.9238036, 0.7411765, 1, 0, 1,
-0.8932799, -0.4908493, -2.809165, 0.7333333, 1, 0, 1,
-0.8925526, 0.3386247, -2.496332, 0.7294118, 1, 0, 1,
-0.8766411, 1.321477, -0.3148409, 0.7215686, 1, 0, 1,
-0.8758251, 0.5697157, -1.405211, 0.7176471, 1, 0, 1,
-0.8666804, -0.2430362, -2.621868, 0.7098039, 1, 0, 1,
-0.8651535, 0.8746135, -0.161231, 0.7058824, 1, 0, 1,
-0.8646479, 1.437864, -1.244892, 0.6980392, 1, 0, 1,
-0.859361, 0.8454704, -3.37441, 0.6901961, 1, 0, 1,
-0.8576043, 0.6527243, -0.8500713, 0.6862745, 1, 0, 1,
-0.8559375, 1.57024, -0.7641614, 0.6784314, 1, 0, 1,
-0.8539555, -0.412109, -0.124034, 0.6745098, 1, 0, 1,
-0.8479481, -0.2340144, -2.824236, 0.6666667, 1, 0, 1,
-0.846409, 0.9900768, -1.692414, 0.6627451, 1, 0, 1,
-0.8389651, -0.5049465, -1.630704, 0.654902, 1, 0, 1,
-0.8342077, 0.9933662, -1.283456, 0.6509804, 1, 0, 1,
-0.8315116, 1.367801, 1.874883, 0.6431373, 1, 0, 1,
-0.8270866, -1.990276, -2.195781, 0.6392157, 1, 0, 1,
-0.8231338, -1.55267, -1.784245, 0.6313726, 1, 0, 1,
-0.8197848, -0.725238, -2.342842, 0.627451, 1, 0, 1,
-0.8195322, -0.241068, -3.150765, 0.6196079, 1, 0, 1,
-0.8154244, 0.6572385, -0.6067062, 0.6156863, 1, 0, 1,
-0.8151879, 0.4634787, -1.157015, 0.6078432, 1, 0, 1,
-0.8045042, -0.6340584, -1.154275, 0.6039216, 1, 0, 1,
-0.8016391, 0.1523447, -2.886292, 0.5960785, 1, 0, 1,
-0.7993921, -0.7384065, -2.540958, 0.5882353, 1, 0, 1,
-0.7966042, -1.270759, -0.04133792, 0.5843138, 1, 0, 1,
-0.7942759, -1.465798, -2.732424, 0.5764706, 1, 0, 1,
-0.7895221, -1.128547, -1.616549, 0.572549, 1, 0, 1,
-0.7879072, 0.1117415, -0.5331617, 0.5647059, 1, 0, 1,
-0.7874009, -1.375836, -2.965748, 0.5607843, 1, 0, 1,
-0.7870963, -2.229258, -2.247098, 0.5529412, 1, 0, 1,
-0.7811599, 0.2850887, -1.722456, 0.5490196, 1, 0, 1,
-0.7805404, -0.7299994, -1.519146, 0.5411765, 1, 0, 1,
-0.7792176, -0.6907119, -4.032197, 0.5372549, 1, 0, 1,
-0.7774335, -0.6632172, -1.714038, 0.5294118, 1, 0, 1,
-0.7684082, -0.01266901, -2.179744, 0.5254902, 1, 0, 1,
-0.7649114, -1.474536, -2.721113, 0.5176471, 1, 0, 1,
-0.7611136, -0.4571074, -1.664271, 0.5137255, 1, 0, 1,
-0.758539, 1.336349, -2.58797, 0.5058824, 1, 0, 1,
-0.7552672, -0.9844467, -1.351477, 0.5019608, 1, 0, 1,
-0.7530875, -0.3739802, -3.456437, 0.4941176, 1, 0, 1,
-0.7528943, -0.06641007, -1.11251, 0.4862745, 1, 0, 1,
-0.7499977, -0.3072972, -0.581036, 0.4823529, 1, 0, 1,
-0.7392966, -0.0581067, -2.007225, 0.4745098, 1, 0, 1,
-0.7316098, 2.753925, 1.11505, 0.4705882, 1, 0, 1,
-0.718724, 0.1278407, -2.123465, 0.4627451, 1, 0, 1,
-0.7187016, -1.590585, -3.505932, 0.4588235, 1, 0, 1,
-0.7178576, 0.5550394, -2.522223, 0.4509804, 1, 0, 1,
-0.7173612, 0.1305436, -1.291548, 0.4470588, 1, 0, 1,
-0.7166461, 1.201906, -0.2896926, 0.4392157, 1, 0, 1,
-0.7130398, -1.347578, -2.278382, 0.4352941, 1, 0, 1,
-0.707545, -0.620984, -2.525679, 0.427451, 1, 0, 1,
-0.7072147, 1.229899, -0.05654462, 0.4235294, 1, 0, 1,
-0.7070913, -0.2345076, -2.061591, 0.4156863, 1, 0, 1,
-0.7033495, -0.2765209, -2.539344, 0.4117647, 1, 0, 1,
-0.7019193, 0.993759, 1.081971, 0.4039216, 1, 0, 1,
-0.7014122, -0.03257472, -2.227066, 0.3960784, 1, 0, 1,
-0.7003748, 0.9482638, 0.3842581, 0.3921569, 1, 0, 1,
-0.6995692, -0.03590099, -2.714101, 0.3843137, 1, 0, 1,
-0.6988161, 0.946441, -0.3431015, 0.3803922, 1, 0, 1,
-0.6961303, -1.570303, -3.60225, 0.372549, 1, 0, 1,
-0.6937882, -0.6317537, -1.016861, 0.3686275, 1, 0, 1,
-0.6920879, 1.581241, -0.9249403, 0.3607843, 1, 0, 1,
-0.6909122, 1.51867, 2.429937, 0.3568628, 1, 0, 1,
-0.687858, -2.078962, -3.133111, 0.3490196, 1, 0, 1,
-0.6877861, -0.335664, -1.432357, 0.345098, 1, 0, 1,
-0.6870282, 1.204155, -2.296113, 0.3372549, 1, 0, 1,
-0.6808363, -0.8867536, -0.7104805, 0.3333333, 1, 0, 1,
-0.6696975, -0.07538687, -1.893275, 0.3254902, 1, 0, 1,
-0.6683695, 1.1019, -0.4005781, 0.3215686, 1, 0, 1,
-0.6654168, -0.4532951, -1.200537, 0.3137255, 1, 0, 1,
-0.65978, 1.004661, -0.2722505, 0.3098039, 1, 0, 1,
-0.6594496, -0.7000098, -3.655736, 0.3019608, 1, 0, 1,
-0.6542132, -0.09534574, -0.2091694, 0.2941177, 1, 0, 1,
-0.6526911, -1.42109, -4.061366, 0.2901961, 1, 0, 1,
-0.6478105, 0.0689294, -0.813568, 0.282353, 1, 0, 1,
-0.6468042, 0.533632, -1.97979, 0.2784314, 1, 0, 1,
-0.6451743, -1.293686, -2.492164, 0.2705882, 1, 0, 1,
-0.644933, -0.176247, -1.314721, 0.2666667, 1, 0, 1,
-0.6447564, 1.876572, 0.08593547, 0.2588235, 1, 0, 1,
-0.6422182, -1.702751, -1.998779, 0.254902, 1, 0, 1,
-0.6407487, -0.6779962, -2.338084, 0.2470588, 1, 0, 1,
-0.6336176, 0.8934827, -0.1076223, 0.2431373, 1, 0, 1,
-0.6297762, -0.03621714, -1.889888, 0.2352941, 1, 0, 1,
-0.6279452, -2.714335e-05, -2.6058, 0.2313726, 1, 0, 1,
-0.6191835, 0.9366776, -0.501493, 0.2235294, 1, 0, 1,
-0.6141019, -0.8475625, -1.281994, 0.2196078, 1, 0, 1,
-0.6130728, -0.5385201, 0.198354, 0.2117647, 1, 0, 1,
-0.6122165, 0.03270204, -0.976725, 0.2078431, 1, 0, 1,
-0.609104, -0.05012888, -3.538965, 0.2, 1, 0, 1,
-0.6067309, -0.6604396, -1.527357, 0.1921569, 1, 0, 1,
-0.6054849, 0.2094591, -0.9612011, 0.1882353, 1, 0, 1,
-0.6040715, 0.4070654, -2.054279, 0.1803922, 1, 0, 1,
-0.6016786, -0.8716219, -2.850234, 0.1764706, 1, 0, 1,
-0.596755, 0.4472745, -1.017183, 0.1686275, 1, 0, 1,
-0.5938701, -0.3921968, -2.305623, 0.1647059, 1, 0, 1,
-0.5921578, -0.2722519, -1.770859, 0.1568628, 1, 0, 1,
-0.590596, 0.7854607, -2.586599, 0.1529412, 1, 0, 1,
-0.5861329, -1.055311, -2.214965, 0.145098, 1, 0, 1,
-0.5852747, -1.644629, -4.35443, 0.1411765, 1, 0, 1,
-0.5850397, -1.362558, -5.1733, 0.1333333, 1, 0, 1,
-0.5806539, -0.5631436, -2.752711, 0.1294118, 1, 0, 1,
-0.5773442, -0.4325016, -1.347009, 0.1215686, 1, 0, 1,
-0.5743065, -0.5639265, -2.6781, 0.1176471, 1, 0, 1,
-0.5728975, 0.03659054, -3.389468, 0.1098039, 1, 0, 1,
-0.567063, 1.171955, 1.094161, 0.1058824, 1, 0, 1,
-0.5653275, -0.3033384, -2.032264, 0.09803922, 1, 0, 1,
-0.5534008, 0.2880937, -0.9719515, 0.09019608, 1, 0, 1,
-0.5494804, 0.6951857, -1.037219, 0.08627451, 1, 0, 1,
-0.5417538, 0.4838498, 0.722833, 0.07843138, 1, 0, 1,
-0.5408822, 1.395997, 0.8956587, 0.07450981, 1, 0, 1,
-0.5358819, -0.0156937, -2.19609, 0.06666667, 1, 0, 1,
-0.5353861, -0.04173369, -4.167473, 0.0627451, 1, 0, 1,
-0.5353822, -1.858203, -3.937917, 0.05490196, 1, 0, 1,
-0.5349665, -1.490067, -2.896405, 0.05098039, 1, 0, 1,
-0.5335906, -0.06959593, -1.161427, 0.04313726, 1, 0, 1,
-0.5283991, -0.1948135, -2.391334, 0.03921569, 1, 0, 1,
-0.5190347, 1.146549, 1.577588, 0.03137255, 1, 0, 1,
-0.5184084, -0.6839907, -2.165897, 0.02745098, 1, 0, 1,
-0.5154433, -1.708034, -2.438808, 0.01960784, 1, 0, 1,
-0.5139235, -0.3480247, -3.511563, 0.01568628, 1, 0, 1,
-0.5137925, -1.947695, -1.411037, 0.007843138, 1, 0, 1,
-0.5075291, -0.2170453, -1.768043, 0.003921569, 1, 0, 1,
-0.5049044, 0.9360223, -0.539385, 0, 1, 0.003921569, 1,
-0.499408, -1.343698, -2.907104, 0, 1, 0.01176471, 1,
-0.4988783, -1.176626, -3.449364, 0, 1, 0.01568628, 1,
-0.4934121, 0.8543009, -2.906619, 0, 1, 0.02352941, 1,
-0.483927, -0.5957096, -2.824264, 0, 1, 0.02745098, 1,
-0.4826193, 0.3741353, -0.7629085, 0, 1, 0.03529412, 1,
-0.4794552, -0.1496614, -0.3407119, 0, 1, 0.03921569, 1,
-0.478323, -0.8984196, -3.332244, 0, 1, 0.04705882, 1,
-0.4765261, 0.1848306, -0.901495, 0, 1, 0.05098039, 1,
-0.475747, -0.384526, -2.269311, 0, 1, 0.05882353, 1,
-0.4752065, -0.4908856, -3.519828, 0, 1, 0.0627451, 1,
-0.466529, -1.195406, -2.321369, 0, 1, 0.07058824, 1,
-0.4654008, -0.4207729, -1.164294, 0, 1, 0.07450981, 1,
-0.4626877, -1.234017, -2.48237, 0, 1, 0.08235294, 1,
-0.4591491, -0.2326412, -3.355497, 0, 1, 0.08627451, 1,
-0.4578097, 0.007619035, -1.322679, 0, 1, 0.09411765, 1,
-0.4566796, -0.725789, -3.659282, 0, 1, 0.1019608, 1,
-0.4514112, 0.1019005, -1.916803, 0, 1, 0.1058824, 1,
-0.4495349, -1.79779, -2.698861, 0, 1, 0.1137255, 1,
-0.4418678, -0.3874211, -0.7088064, 0, 1, 0.1176471, 1,
-0.4406314, -1.169778, -4.948185, 0, 1, 0.1254902, 1,
-0.4395562, -1.02591, -1.322533, 0, 1, 0.1294118, 1,
-0.4394987, 0.5481666, -1.250653, 0, 1, 0.1372549, 1,
-0.4333417, 0.262758, -2.508679, 0, 1, 0.1411765, 1,
-0.4327721, -0.8258411, -3.22306, 0, 1, 0.1490196, 1,
-0.4324176, 2.217858, -0.5549744, 0, 1, 0.1529412, 1,
-0.4252488, -0.7542077, -2.429101, 0, 1, 0.1607843, 1,
-0.4233396, 0.8066831, -0.3703848, 0, 1, 0.1647059, 1,
-0.4100516, 0.5765951, -0.04669141, 0, 1, 0.172549, 1,
-0.4084899, -0.5094888, -3.15846, 0, 1, 0.1764706, 1,
-0.4082914, 1.743894, -1.042719, 0, 1, 0.1843137, 1,
-0.3991245, -0.9871095, -4.300247, 0, 1, 0.1882353, 1,
-0.3948081, 3.105855, 0.04858367, 0, 1, 0.1960784, 1,
-0.3898942, -1.441344, -3.423964, 0, 1, 0.2039216, 1,
-0.3886152, -0.6848448, -2.913032, 0, 1, 0.2078431, 1,
-0.3873898, -1.822378, -3.211038, 0, 1, 0.2156863, 1,
-0.387207, 0.7364538, -1.148888, 0, 1, 0.2196078, 1,
-0.3865406, -3.011609, -2.922669, 0, 1, 0.227451, 1,
-0.3856148, -1.297008, -2.562489, 0, 1, 0.2313726, 1,
-0.3767287, -0.2715354, -1.472816, 0, 1, 0.2392157, 1,
-0.3604629, -0.9426195, -1.623908, 0, 1, 0.2431373, 1,
-0.3602119, 1.081706, -0.382275, 0, 1, 0.2509804, 1,
-0.3572742, 0.5384747, 0.9879642, 0, 1, 0.254902, 1,
-0.3553861, -0.06687702, -0.2551945, 0, 1, 0.2627451, 1,
-0.3526838, -0.3705909, -1.891215, 0, 1, 0.2666667, 1,
-0.3492837, 0.3612764, -2.178542, 0, 1, 0.2745098, 1,
-0.3484643, -1.186063, -3.442743, 0, 1, 0.2784314, 1,
-0.3480165, 0.2205478, -1.739542, 0, 1, 0.2862745, 1,
-0.3424254, 1.936283, 1.250115, 0, 1, 0.2901961, 1,
-0.3390298, 0.2084471, -0.4741256, 0, 1, 0.2980392, 1,
-0.3382086, 0.4869389, -0.8980525, 0, 1, 0.3058824, 1,
-0.3379066, 0.6532357, -1.067965, 0, 1, 0.3098039, 1,
-0.3373488, 1.352692, 0.01341349, 0, 1, 0.3176471, 1,
-0.3371331, 0.7118661, -0.611442, 0, 1, 0.3215686, 1,
-0.3350948, 1.259336, -1.171188, 0, 1, 0.3294118, 1,
-0.3343861, -0.103231, -0.7625672, 0, 1, 0.3333333, 1,
-0.3325016, -0.7687821, -2.584113, 0, 1, 0.3411765, 1,
-0.327636, 1.070785, -1.197223, 0, 1, 0.345098, 1,
-0.327587, 0.217038, -1.641119, 0, 1, 0.3529412, 1,
-0.3260598, -0.4625552, -3.198766, 0, 1, 0.3568628, 1,
-0.3250139, -2.104457, -3.318595, 0, 1, 0.3647059, 1,
-0.3235458, -0.4761322, -1.787143, 0, 1, 0.3686275, 1,
-0.3197479, -2.445072, -0.9968348, 0, 1, 0.3764706, 1,
-0.3193373, -0.8440337, -0.7762312, 0, 1, 0.3803922, 1,
-0.3045792, -0.1815622, -2.816122, 0, 1, 0.3882353, 1,
-0.3020863, -0.6010338, -0.8537518, 0, 1, 0.3921569, 1,
-0.2986562, 0.8924764, -1.218431, 0, 1, 0.4, 1,
-0.2965649, 0.3808755, -0.2359363, 0, 1, 0.4078431, 1,
-0.2930246, -1.710363, -2.485635, 0, 1, 0.4117647, 1,
-0.2910945, 0.8719567, -1.195709, 0, 1, 0.4196078, 1,
-0.2891923, 1.103984, -1.497907, 0, 1, 0.4235294, 1,
-0.2889279, 0.6075643, 1.330575, 0, 1, 0.4313726, 1,
-0.2876077, -0.3858653, -2.414018, 0, 1, 0.4352941, 1,
-0.287204, 0.6166229, 0.06283915, 0, 1, 0.4431373, 1,
-0.2864104, 1.023658, -0.5424911, 0, 1, 0.4470588, 1,
-0.2855529, 0.9205158, -1.241182, 0, 1, 0.454902, 1,
-0.2832438, -0.1522277, -3.829587, 0, 1, 0.4588235, 1,
-0.2825991, 1.709323, -1.829505, 0, 1, 0.4666667, 1,
-0.2756868, 0.2651885, -0.3318236, 0, 1, 0.4705882, 1,
-0.2748409, -0.8461624, -2.044371, 0, 1, 0.4784314, 1,
-0.2697657, -1.846772, -1.919617, 0, 1, 0.4823529, 1,
-0.268888, -1.338497, -2.455784, 0, 1, 0.4901961, 1,
-0.2647412, -0.3152528, -2.757293, 0, 1, 0.4941176, 1,
-0.2605106, 2.132011, -1.447281, 0, 1, 0.5019608, 1,
-0.2580884, -0.09546295, -2.379565, 0, 1, 0.509804, 1,
-0.2571969, 0.06946588, -2.557241, 0, 1, 0.5137255, 1,
-0.2495994, 1.715796, -0.05158246, 0, 1, 0.5215687, 1,
-0.2485332, -0.2272616, -2.436778, 0, 1, 0.5254902, 1,
-0.2470237, 0.7714902, -0.3100439, 0, 1, 0.5333334, 1,
-0.2469244, 0.4154032, -2.426331, 0, 1, 0.5372549, 1,
-0.244133, -1.032789, -3.455031, 0, 1, 0.5450981, 1,
-0.2398566, 0.3683521, 1.178463, 0, 1, 0.5490196, 1,
-0.2379129, 0.3961126, -0.8735037, 0, 1, 0.5568628, 1,
-0.2326945, 0.2706829, -1.602971, 0, 1, 0.5607843, 1,
-0.2306361, 0.3993698, -2.067446, 0, 1, 0.5686275, 1,
-0.2282326, -0.9896913, -3.231619, 0, 1, 0.572549, 1,
-0.2272733, -0.1002778, -1.349888, 0, 1, 0.5803922, 1,
-0.2255529, 0.4491109, 0.3091169, 0, 1, 0.5843138, 1,
-0.2248085, 0.6659389, -0.002902644, 0, 1, 0.5921569, 1,
-0.222646, -0.3720197, -1.738045, 0, 1, 0.5960785, 1,
-0.2216181, -0.3189784, -3.626458, 0, 1, 0.6039216, 1,
-0.2121053, 0.1074543, -0.5375145, 0, 1, 0.6117647, 1,
-0.2069351, 0.7296709, 1.003891, 0, 1, 0.6156863, 1,
-0.2059287, -1.097376, -4.126511, 0, 1, 0.6235294, 1,
-0.2034172, -0.6190218, -3.011759, 0, 1, 0.627451, 1,
-0.1953782, 0.4897062, -0.188673, 0, 1, 0.6352941, 1,
-0.1945409, 0.3503104, -1.500585, 0, 1, 0.6392157, 1,
-0.1942206, 0.398815, -0.8369251, 0, 1, 0.6470588, 1,
-0.191984, 1.530901, 1.268268, 0, 1, 0.6509804, 1,
-0.1918233, 0.2779284, -2.329725, 0, 1, 0.6588235, 1,
-0.1907542, 0.919158, 0.2586411, 0, 1, 0.6627451, 1,
-0.1889769, -1.676221, -1.45215, 0, 1, 0.6705883, 1,
-0.1874388, 0.8915826, -0.3849094, 0, 1, 0.6745098, 1,
-0.1837733, 1.781708, 0.5685028, 0, 1, 0.682353, 1,
-0.1820131, -0.4907166, -2.398102, 0, 1, 0.6862745, 1,
-0.1793647, -1.035133, -4.317592, 0, 1, 0.6941177, 1,
-0.1778309, -0.868086, -2.366571, 0, 1, 0.7019608, 1,
-0.1713693, -0.6776592, -2.100555, 0, 1, 0.7058824, 1,
-0.1712557, -0.9721421, -3.944351, 0, 1, 0.7137255, 1,
-0.1694039, -0.2427057, -2.109513, 0, 1, 0.7176471, 1,
-0.1684685, 0.8020748, -0.2603864, 0, 1, 0.7254902, 1,
-0.1682091, 0.1846313, -0.1193455, 0, 1, 0.7294118, 1,
-0.1676138, 1.414306, -0.700195, 0, 1, 0.7372549, 1,
-0.1659183, 1.029131, 0.310017, 0, 1, 0.7411765, 1,
-0.1582014, -0.2477053, -2.439201, 0, 1, 0.7490196, 1,
-0.1564665, -0.8393095, -2.947165, 0, 1, 0.7529412, 1,
-0.1501243, -1.069194, -4.387372, 0, 1, 0.7607843, 1,
-0.1488297, -1.367848, -3.950587, 0, 1, 0.7647059, 1,
-0.1473464, -0.1692968, -3.361608, 0, 1, 0.772549, 1,
-0.145513, 2.656735, 0.3161374, 0, 1, 0.7764706, 1,
-0.1380073, 1.413991, -0.122198, 0, 1, 0.7843137, 1,
-0.1369945, 2.000568, -0.7443086, 0, 1, 0.7882353, 1,
-0.1295574, 2.277123, -0.9746362, 0, 1, 0.7960784, 1,
-0.1293625, -0.225189, -1.9861, 0, 1, 0.8039216, 1,
-0.1260646, 1.791661, 0.9846211, 0, 1, 0.8078431, 1,
-0.1233419, 0.236945, -1.095338, 0, 1, 0.8156863, 1,
-0.117095, 1.43468, 1.078145, 0, 1, 0.8196079, 1,
-0.1134252, -0.5275754, -3.136834, 0, 1, 0.827451, 1,
-0.1128532, 0.6966277, 0.6754766, 0, 1, 0.8313726, 1,
-0.1115143, 0.8030357, 0.5059678, 0, 1, 0.8392157, 1,
-0.1081819, 1.002219, -0.2030871, 0, 1, 0.8431373, 1,
-0.1081021, -0.5309311, -2.865576, 0, 1, 0.8509804, 1,
-0.1076077, 0.715569, 1.854936, 0, 1, 0.854902, 1,
-0.1024896, 0.3541012, -1.104524, 0, 1, 0.8627451, 1,
-0.1012129, 0.7326105, 0.06249935, 0, 1, 0.8666667, 1,
-0.1009642, -1.212946, -3.921362, 0, 1, 0.8745098, 1,
-0.09826495, -0.4654773, -2.955868, 0, 1, 0.8784314, 1,
-0.0967856, -0.9064561, -4.442469, 0, 1, 0.8862745, 1,
-0.09586677, 0.7651207, -0.5157732, 0, 1, 0.8901961, 1,
-0.09161451, -0.9668629, -1.943716, 0, 1, 0.8980392, 1,
-0.08585476, 1.153139, 0.1709125, 0, 1, 0.9058824, 1,
-0.07994992, 2.004982, -1.136549, 0, 1, 0.9098039, 1,
-0.07112612, 0.6365043, 0.2564919, 0, 1, 0.9176471, 1,
-0.06459012, 1.903403, 0.836098, 0, 1, 0.9215686, 1,
-0.063788, -0.09699244, -3.820698, 0, 1, 0.9294118, 1,
-0.06269588, -0.9426206, -1.699276, 0, 1, 0.9333333, 1,
-0.05266766, -0.2434606, -2.614095, 0, 1, 0.9411765, 1,
-0.05244832, 0.1091686, -1.578162, 0, 1, 0.945098, 1,
-0.0509282, 0.3750495, 0.815444, 0, 1, 0.9529412, 1,
-0.04886214, -0.4070528, -1.646215, 0, 1, 0.9568627, 1,
-0.04809483, -0.7759783, -4.667463, 0, 1, 0.9647059, 1,
-0.04583128, -0.5365936, -2.869624, 0, 1, 0.9686275, 1,
-0.04023807, 1.674372, -0.8124444, 0, 1, 0.9764706, 1,
-0.03246878, -0.7281232, -1.148876, 0, 1, 0.9803922, 1,
-0.03147085, 0.3201502, -0.8955362, 0, 1, 0.9882353, 1,
-0.02981634, 2.207047, 1.488188, 0, 1, 0.9921569, 1,
-0.02930644, -0.2656027, -3.221609, 0, 1, 1, 1,
-0.0288565, 0.05530505, -1.794054, 0, 0.9921569, 1, 1,
-0.02727444, 1.577874, -0.7099566, 0, 0.9882353, 1, 1,
-0.02488772, 1.305244, 0.8446756, 0, 0.9803922, 1, 1,
-0.02424408, -0.3515936, -1.982661, 0, 0.9764706, 1, 1,
-0.02330502, 1.119964, -2.720237, 0, 0.9686275, 1, 1,
-0.02110626, -0.4399975, -2.343854, 0, 0.9647059, 1, 1,
-0.01661999, 0.8052807, 1.141034, 0, 0.9568627, 1, 1,
-0.01527692, 0.7633056, -0.946761, 0, 0.9529412, 1, 1,
-0.01459584, -0.4683417, -2.813077, 0, 0.945098, 1, 1,
-0.01273731, 0.05288266, -0.5725282, 0, 0.9411765, 1, 1,
-0.00935926, -0.05207337, -2.736398, 0, 0.9333333, 1, 1,
-0.006945782, 0.09935319, 0.5269108, 0, 0.9294118, 1, 1,
-0.003823513, 2.069664, 0.269523, 0, 0.9215686, 1, 1,
0.002961649, -1.140101, 2.668118, 0, 0.9176471, 1, 1,
0.003895082, 0.7788329, -0.8506128, 0, 0.9098039, 1, 1,
0.007486541, -0.1309074, 3.942249, 0, 0.9058824, 1, 1,
0.007512932, 0.1534364, -1.193042, 0, 0.8980392, 1, 1,
0.00973548, -0.1639944, 2.89191, 0, 0.8901961, 1, 1,
0.0152874, 0.6413175, 3.607754, 0, 0.8862745, 1, 1,
0.02276825, 0.1658984, -1.345925, 0, 0.8784314, 1, 1,
0.03171906, -1.110908, 4.209213, 0, 0.8745098, 1, 1,
0.03397016, 1.759946, 0.730568, 0, 0.8666667, 1, 1,
0.03604451, -1.361268, 1.657241, 0, 0.8627451, 1, 1,
0.0464138, 1.139069, 0.1637637, 0, 0.854902, 1, 1,
0.04957831, 0.7618415, 0.7623559, 0, 0.8509804, 1, 1,
0.04992654, 1.488867, -1.326644, 0, 0.8431373, 1, 1,
0.05237962, 0.2123199, -0.3644423, 0, 0.8392157, 1, 1,
0.06033095, 1.82688, 0.6434911, 0, 0.8313726, 1, 1,
0.06359045, -0.9193654, 0.9143828, 0, 0.827451, 1, 1,
0.06400396, 0.8236485, 0.0441116, 0, 0.8196079, 1, 1,
0.07167524, -0.2545594, 1.779942, 0, 0.8156863, 1, 1,
0.07938755, -0.02784931, 1.974687, 0, 0.8078431, 1, 1,
0.08607212, -0.7915579, 2.750234, 0, 0.8039216, 1, 1,
0.08830388, 1.255116, 0.6330876, 0, 0.7960784, 1, 1,
0.09301084, 0.4201272, -0.6701128, 0, 0.7882353, 1, 1,
0.09355512, -0.322648, 3.582829, 0, 0.7843137, 1, 1,
0.09668455, -0.8187873, 3.456922, 0, 0.7764706, 1, 1,
0.0997692, 0.2711753, 0.993573, 0, 0.772549, 1, 1,
0.1021537, 1.491534, -0.2609099, 0, 0.7647059, 1, 1,
0.1027995, 0.3528061, 0.4208716, 0, 0.7607843, 1, 1,
0.104177, 0.7528072, -0.4563595, 0, 0.7529412, 1, 1,
0.1044064, 1.309827, -1.191773, 0, 0.7490196, 1, 1,
0.1082655, -1.095932, 2.96379, 0, 0.7411765, 1, 1,
0.111812, -0.6634803, 1.595114, 0, 0.7372549, 1, 1,
0.1162534, -0.7959697, 3.398754, 0, 0.7294118, 1, 1,
0.1164941, -0.3364111, 2.928266, 0, 0.7254902, 1, 1,
0.1166325, 0.4632035, -0.7207071, 0, 0.7176471, 1, 1,
0.1194376, 0.5701064, -0.06103123, 0, 0.7137255, 1, 1,
0.1205556, 0.8338265, 1.345727, 0, 0.7058824, 1, 1,
0.1267765, -0.2478178, 2.256998, 0, 0.6980392, 1, 1,
0.128288, -0.9945422, 1.972501, 0, 0.6941177, 1, 1,
0.1375159, -0.01138445, 1.526253, 0, 0.6862745, 1, 1,
0.1389976, -0.9118221, 1.755765, 0, 0.682353, 1, 1,
0.1400611, 0.6666145, 1.260678, 0, 0.6745098, 1, 1,
0.1403058, -0.02272352, 1.118953, 0, 0.6705883, 1, 1,
0.1429607, -1.171495, 2.700058, 0, 0.6627451, 1, 1,
0.1431262, 0.6084506, -1.019047, 0, 0.6588235, 1, 1,
0.1452696, -0.3525735, 2.092004, 0, 0.6509804, 1, 1,
0.1456511, 0.1524318, -0.3701857, 0, 0.6470588, 1, 1,
0.1485157, -0.7611289, 3.81704, 0, 0.6392157, 1, 1,
0.1524054, -0.7291684, 3.208192, 0, 0.6352941, 1, 1,
0.1524295, 0.3808158, 1.753415, 0, 0.627451, 1, 1,
0.1536567, 1.426113, 0.2031809, 0, 0.6235294, 1, 1,
0.1539234, -0.1364431, 4.054999, 0, 0.6156863, 1, 1,
0.1570017, -0.8533328, 4.067963, 0, 0.6117647, 1, 1,
0.1578468, 1.035408, 0.3096372, 0, 0.6039216, 1, 1,
0.1590526, -0.69774, 3.078086, 0, 0.5960785, 1, 1,
0.1592416, 0.02794011, 0.912492, 0, 0.5921569, 1, 1,
0.1606491, 0.8366187, 1.182594, 0, 0.5843138, 1, 1,
0.164358, 1.269017, 0.05296616, 0, 0.5803922, 1, 1,
0.165167, 1.592688, -1.115321, 0, 0.572549, 1, 1,
0.1679943, -0.1289589, 3.493318, 0, 0.5686275, 1, 1,
0.1689724, -0.6595093, 3.291044, 0, 0.5607843, 1, 1,
0.1756311, 1.981154, 0.7005819, 0, 0.5568628, 1, 1,
0.1768001, -0.8030598, 2.470984, 0, 0.5490196, 1, 1,
0.1776538, 0.855, 0.002786356, 0, 0.5450981, 1, 1,
0.1777989, 0.9800286, -0.7197857, 0, 0.5372549, 1, 1,
0.1821773, 1.546093, 0.4421719, 0, 0.5333334, 1, 1,
0.1855264, 1.338564, -0.4526109, 0, 0.5254902, 1, 1,
0.1861901, 0.8276759, 1.818394, 0, 0.5215687, 1, 1,
0.1884207, -0.559984, 3.536035, 0, 0.5137255, 1, 1,
0.1885969, 1.038245, 0.8708153, 0, 0.509804, 1, 1,
0.1886825, -0.9484516, 3.039895, 0, 0.5019608, 1, 1,
0.1902844, 0.5052693, -0.3816902, 0, 0.4941176, 1, 1,
0.1954419, -1.249667, 3.921175, 0, 0.4901961, 1, 1,
0.1956304, -1.497284, 3.570527, 0, 0.4823529, 1, 1,
0.2013717, 0.9134933, -1.671265, 0, 0.4784314, 1, 1,
0.2045688, -0.1789053, 2.573174, 0, 0.4705882, 1, 1,
0.2090341, 0.6098801, 1.044882, 0, 0.4666667, 1, 1,
0.2092949, -1.279203, 3.76538, 0, 0.4588235, 1, 1,
0.210084, -0.6131437, 2.661935, 0, 0.454902, 1, 1,
0.2106591, 1.629715, 0.8763036, 0, 0.4470588, 1, 1,
0.2116324, 0.2110929, 1.986391, 0, 0.4431373, 1, 1,
0.2144177, -0.02172171, 2.803469, 0, 0.4352941, 1, 1,
0.2199147, -0.2538796, 2.260647, 0, 0.4313726, 1, 1,
0.2223659, -1.603554, 1.232436, 0, 0.4235294, 1, 1,
0.2264021, -1.010453, 2.154232, 0, 0.4196078, 1, 1,
0.2268801, 1.116418, 1.934538, 0, 0.4117647, 1, 1,
0.2292472, 0.6945304, 0.3291282, 0, 0.4078431, 1, 1,
0.2293184, -1.43033, 3.490912, 0, 0.4, 1, 1,
0.2306256, 0.4311808, -0.9734304, 0, 0.3921569, 1, 1,
0.2313904, -1.399799, 2.63709, 0, 0.3882353, 1, 1,
0.2345965, 0.2591864, 0.6664006, 0, 0.3803922, 1, 1,
0.2349758, -0.7665326, 3.931513, 0, 0.3764706, 1, 1,
0.2351831, 0.8066901, 2.779109, 0, 0.3686275, 1, 1,
0.2372616, 2.526746, -1.359374, 0, 0.3647059, 1, 1,
0.2444767, 0.901792, 1.648966, 0, 0.3568628, 1, 1,
0.2488047, 0.4975345, -0.9814174, 0, 0.3529412, 1, 1,
0.2493012, -0.9598498, 1.563854, 0, 0.345098, 1, 1,
0.2592019, -0.2172467, 1.884402, 0, 0.3411765, 1, 1,
0.259275, -0.9677826, 0.8576673, 0, 0.3333333, 1, 1,
0.2612832, 1.469355, -1.172495, 0, 0.3294118, 1, 1,
0.2613955, 1.055632, -1.369411, 0, 0.3215686, 1, 1,
0.2653595, 1.092757, -0.1674631, 0, 0.3176471, 1, 1,
0.26555, -0.7519706, 5.013218, 0, 0.3098039, 1, 1,
0.2658058, 1.754839, -0.7790684, 0, 0.3058824, 1, 1,
0.2704561, 1.537573, 0.160315, 0, 0.2980392, 1, 1,
0.2708544, 0.08117311, 1.322324, 0, 0.2901961, 1, 1,
0.271903, 0.2597441, -0.0007973167, 0, 0.2862745, 1, 1,
0.2725821, 1.171884, 1.316147, 0, 0.2784314, 1, 1,
0.2728503, -0.1251654, 1.946651, 0, 0.2745098, 1, 1,
0.278286, -1.457027, 2.597414, 0, 0.2666667, 1, 1,
0.2830951, -0.6173366, -0.6118485, 0, 0.2627451, 1, 1,
0.2867775, 1.040497, 0.7858077, 0, 0.254902, 1, 1,
0.2957973, -1.640137, 2.856701, 0, 0.2509804, 1, 1,
0.2969139, -2.447443, 2.351864, 0, 0.2431373, 1, 1,
0.2973203, 0.5477926, -0.5268812, 0, 0.2392157, 1, 1,
0.2988399, -3.110431, 4.575009, 0, 0.2313726, 1, 1,
0.3009036, -0.5948706, 4.780316, 0, 0.227451, 1, 1,
0.3027303, 2.663798, -0.3131494, 0, 0.2196078, 1, 1,
0.3036076, -0.2820606, 2.393322, 0, 0.2156863, 1, 1,
0.3063428, 0.3596579, 1.596562, 0, 0.2078431, 1, 1,
0.3065492, -0.01160049, 1.455965, 0, 0.2039216, 1, 1,
0.3081676, 1.211805, 0.2443314, 0, 0.1960784, 1, 1,
0.3090205, -0.770045, 3.636961, 0, 0.1882353, 1, 1,
0.3094809, -0.4124677, 2.639045, 0, 0.1843137, 1, 1,
0.3235434, 0.1187782, 0.8639262, 0, 0.1764706, 1, 1,
0.3264481, -0.9350142, 3.389194, 0, 0.172549, 1, 1,
0.3278856, 0.5970703, 0.5004244, 0, 0.1647059, 1, 1,
0.3281794, -1.728803, 1.752374, 0, 0.1607843, 1, 1,
0.3309488, 0.9467165, 0.9402272, 0, 0.1529412, 1, 1,
0.3376678, 0.1359859, 2.448668, 0, 0.1490196, 1, 1,
0.3386338, 1.354238, 0.3868413, 0, 0.1411765, 1, 1,
0.3396139, 1.125805, 0.7252908, 0, 0.1372549, 1, 1,
0.3396451, -0.7303988, 2.323567, 0, 0.1294118, 1, 1,
0.3420151, 0.2784899, 0.3248694, 0, 0.1254902, 1, 1,
0.3432922, -0.302324, 2.151655, 0, 0.1176471, 1, 1,
0.344679, 1.259144, 0.5112932, 0, 0.1137255, 1, 1,
0.3451595, 0.4163082, 1.274698, 0, 0.1058824, 1, 1,
0.3492429, 0.2813164, -0.8854255, 0, 0.09803922, 1, 1,
0.3528399, 0.251468, -0.02188941, 0, 0.09411765, 1, 1,
0.3549806, 0.9621814, -1.547256, 0, 0.08627451, 1, 1,
0.3561733, -0.6412106, 2.26671, 0, 0.08235294, 1, 1,
0.3702774, 0.6715288, 0.7307906, 0, 0.07450981, 1, 1,
0.3730688, 0.4351925, -0.1264425, 0, 0.07058824, 1, 1,
0.374048, -0.1075145, 1.396946, 0, 0.0627451, 1, 1,
0.3764344, -1.437337, 1.429963, 0, 0.05882353, 1, 1,
0.3854105, -0.1759756, 1.599181, 0, 0.05098039, 1, 1,
0.3867593, -2.637788, 4.510834, 0, 0.04705882, 1, 1,
0.3872263, -1.143356, 4.787817, 0, 0.03921569, 1, 1,
0.3884601, 0.4104823, 1.827039, 0, 0.03529412, 1, 1,
0.3888202, 0.4303063, 2.478946, 0, 0.02745098, 1, 1,
0.3893768, 1.551224, -0.02684571, 0, 0.02352941, 1, 1,
0.3899817, 1.258721, 0.3182308, 0, 0.01568628, 1, 1,
0.3905954, 0.4121332, 1.689845, 0, 0.01176471, 1, 1,
0.3921363, 1.085907, -2.097195, 0, 0.003921569, 1, 1,
0.3950069, 0.5750511, 0.07667471, 0.003921569, 0, 1, 1,
0.3976822, -1.012491, 1.433776, 0.007843138, 0, 1, 1,
0.4047254, 0.175297, 0.9813217, 0.01568628, 0, 1, 1,
0.4055156, 0.5135657, 1.64263, 0.01960784, 0, 1, 1,
0.4069935, -0.4347083, 1.974541, 0.02745098, 0, 1, 1,
0.407664, 0.6396284, 1.008106, 0.03137255, 0, 1, 1,
0.4080546, -0.6636658, 2.263735, 0.03921569, 0, 1, 1,
0.4087751, 1.961713, -1.7324, 0.04313726, 0, 1, 1,
0.4152412, 1.494946, 0.5606242, 0.05098039, 0, 1, 1,
0.4180207, 1.307003, -0.1255151, 0.05490196, 0, 1, 1,
0.4184506, -1.24844, 2.694552, 0.0627451, 0, 1, 1,
0.420364, 0.4781594, 0.9975361, 0.06666667, 0, 1, 1,
0.4208843, -1.65596, 1.961184, 0.07450981, 0, 1, 1,
0.4297726, 3.218839, 0.08470799, 0.07843138, 0, 1, 1,
0.4299483, -0.648459, 1.569263, 0.08627451, 0, 1, 1,
0.4313062, 1.656933, 0.3317507, 0.09019608, 0, 1, 1,
0.441302, -1.37144, 3.484879, 0.09803922, 0, 1, 1,
0.4433974, -0.8097007, 3.187621, 0.1058824, 0, 1, 1,
0.4452781, -1.196792, 2.177668, 0.1098039, 0, 1, 1,
0.4467934, -0.3273124, 0.6160449, 0.1176471, 0, 1, 1,
0.4493425, 1.740424, -1.455282, 0.1215686, 0, 1, 1,
0.4497437, -1.022945, 1.980858, 0.1294118, 0, 1, 1,
0.4505128, -1.995978, 2.749139, 0.1333333, 0, 1, 1,
0.451002, 0.2621954, 1.362909, 0.1411765, 0, 1, 1,
0.4614983, 0.2242596, 1.499083, 0.145098, 0, 1, 1,
0.4632814, 1.194381, 1.863174, 0.1529412, 0, 1, 1,
0.4662467, 0.1330148, 1.954658, 0.1568628, 0, 1, 1,
0.4704795, 2.507162, -0.2853174, 0.1647059, 0, 1, 1,
0.4725645, -1.026841, 1.331582, 0.1686275, 0, 1, 1,
0.4745222, -0.282956, 0.8634452, 0.1764706, 0, 1, 1,
0.4753734, -1.50408, 3.398662, 0.1803922, 0, 1, 1,
0.4765069, -0.07921835, 1.884416, 0.1882353, 0, 1, 1,
0.4800226, -1.01412, 4.943321, 0.1921569, 0, 1, 1,
0.4826459, 1.894848, 1.855603, 0.2, 0, 1, 1,
0.4827702, -0.1156485, 2.040798, 0.2078431, 0, 1, 1,
0.4856202, 1.668103, 0.03514643, 0.2117647, 0, 1, 1,
0.4875856, 0.0224938, 0.9992985, 0.2196078, 0, 1, 1,
0.4883033, 1.564047, 1.533438, 0.2235294, 0, 1, 1,
0.4900749, 1.901019, 0.5660311, 0.2313726, 0, 1, 1,
0.4932764, -1.179768, 2.410653, 0.2352941, 0, 1, 1,
0.4965766, 1.22108, 1.163647, 0.2431373, 0, 1, 1,
0.4983782, -0.1080736, 1.975673, 0.2470588, 0, 1, 1,
0.4984572, -0.5983953, 2.326824, 0.254902, 0, 1, 1,
0.5066657, -0.8832402, 3.357995, 0.2588235, 0, 1, 1,
0.5127479, -0.3060318, 1.897804, 0.2666667, 0, 1, 1,
0.5173491, -0.03411373, 1.681541, 0.2705882, 0, 1, 1,
0.5185764, 0.5315381, 1.959935, 0.2784314, 0, 1, 1,
0.5193366, 0.5557625, 0.9490401, 0.282353, 0, 1, 1,
0.5226631, 0.0930954, 1.079562, 0.2901961, 0, 1, 1,
0.5337172, 0.3711944, -0.717401, 0.2941177, 0, 1, 1,
0.5348138, 1.438762, 0.6950449, 0.3019608, 0, 1, 1,
0.5419624, -0.1579029, 0.1841232, 0.3098039, 0, 1, 1,
0.5587142, 0.4012224, 1.411791, 0.3137255, 0, 1, 1,
0.5655768, 1.79785, -2.13557, 0.3215686, 0, 1, 1,
0.5673674, -0.5125725, 1.922288, 0.3254902, 0, 1, 1,
0.5679626, 0.124911, 1.49674, 0.3333333, 0, 1, 1,
0.5693654, 1.12533, 0.4146649, 0.3372549, 0, 1, 1,
0.5718805, -0.9811232, 3.211568, 0.345098, 0, 1, 1,
0.5762183, 0.6028461, 0.2409648, 0.3490196, 0, 1, 1,
0.5799054, -1.204579, 0.4313095, 0.3568628, 0, 1, 1,
0.5802937, 0.2645136, 1.483333, 0.3607843, 0, 1, 1,
0.5878594, -1.566306, 1.972615, 0.3686275, 0, 1, 1,
0.5907582, -0.6496382, 3.053684, 0.372549, 0, 1, 1,
0.5924089, -0.1720696, 1.356508, 0.3803922, 0, 1, 1,
0.59331, 1.071992, 0.9994848, 0.3843137, 0, 1, 1,
0.5982282, -0.4376909, 2.572017, 0.3921569, 0, 1, 1,
0.6027973, 1.267229, 2.479529, 0.3960784, 0, 1, 1,
0.6051365, 0.02892992, 2.3416, 0.4039216, 0, 1, 1,
0.6058859, -0.9218377, 2.617521, 0.4117647, 0, 1, 1,
0.6114792, 0.2255115, 1.05069, 0.4156863, 0, 1, 1,
0.6153577, -0.9541744, 3.34894, 0.4235294, 0, 1, 1,
0.6184081, -0.1476325, 1.405702, 0.427451, 0, 1, 1,
0.6225389, 1.969156, 0.7810385, 0.4352941, 0, 1, 1,
0.6269376, -1.529658, 4.078684, 0.4392157, 0, 1, 1,
0.6369882, -0.5172353, 1.769056, 0.4470588, 0, 1, 1,
0.642095, 0.2308373, 2.795924, 0.4509804, 0, 1, 1,
0.6503162, -1.303658, 3.720583, 0.4588235, 0, 1, 1,
0.6507001, -2.626079, 2.265191, 0.4627451, 0, 1, 1,
0.6525427, 1.467537, 0.8985151, 0.4705882, 0, 1, 1,
0.6536289, 0.519484, -1.061764, 0.4745098, 0, 1, 1,
0.6621583, -1.99674, 4.293799, 0.4823529, 0, 1, 1,
0.6674705, -0.148675, 1.86814, 0.4862745, 0, 1, 1,
0.6685841, 0.5534147, 2.025369, 0.4941176, 0, 1, 1,
0.6724215, -0.263996, -0.2334422, 0.5019608, 0, 1, 1,
0.6845629, 0.36572, -0.3457398, 0.5058824, 0, 1, 1,
0.6913176, 2.176314, 0.1642681, 0.5137255, 0, 1, 1,
0.6926871, -0.8064429, 3.789815, 0.5176471, 0, 1, 1,
0.6953697, -1.707228, 2.66167, 0.5254902, 0, 1, 1,
0.6966972, 1.6214, 2.398726, 0.5294118, 0, 1, 1,
0.6969032, -0.1787778, 1.513088, 0.5372549, 0, 1, 1,
0.6971035, 0.4519638, 0.609663, 0.5411765, 0, 1, 1,
0.7008433, 1.063103, -0.04126684, 0.5490196, 0, 1, 1,
0.7021185, 1.147509, -0.9487053, 0.5529412, 0, 1, 1,
0.7053069, 1.480854, 0.08597329, 0.5607843, 0, 1, 1,
0.7068038, 0.4583887, 2.030517, 0.5647059, 0, 1, 1,
0.7150902, -0.7031047, 3.088251, 0.572549, 0, 1, 1,
0.7154018, 0.5564595, 2.56477, 0.5764706, 0, 1, 1,
0.7212187, 0.2446719, 0.8040496, 0.5843138, 0, 1, 1,
0.7250077, -0.8561571, 3.448813, 0.5882353, 0, 1, 1,
0.7299842, 0.1112554, 0.4463892, 0.5960785, 0, 1, 1,
0.7306793, -1.859, 2.451096, 0.6039216, 0, 1, 1,
0.7310421, 0.6807112, 0.4821451, 0.6078432, 0, 1, 1,
0.732069, -1.431289, 3.493471, 0.6156863, 0, 1, 1,
0.7320917, -1.017752, 2.420212, 0.6196079, 0, 1, 1,
0.7381564, 2.113302, 0.6561003, 0.627451, 0, 1, 1,
0.7550825, 1.344108, 0.6362555, 0.6313726, 0, 1, 1,
0.7565191, 2.105567, -0.7201133, 0.6392157, 0, 1, 1,
0.757026, 0.7354169, 2.713345, 0.6431373, 0, 1, 1,
0.7580338, 1.207314, -0.882463, 0.6509804, 0, 1, 1,
0.7603545, 0.2985562, 0.6015093, 0.654902, 0, 1, 1,
0.7612889, -0.27614, 2.323191, 0.6627451, 0, 1, 1,
0.7617795, -0.7657579, 2.532911, 0.6666667, 0, 1, 1,
0.7619545, 0.1488142, 1.29098, 0.6745098, 0, 1, 1,
0.7626551, -0.9816393, 3.697345, 0.6784314, 0, 1, 1,
0.7626736, -1.327013, 4.397274, 0.6862745, 0, 1, 1,
0.7675934, -1.250334, 1.866758, 0.6901961, 0, 1, 1,
0.7732797, -0.271727, 1.903681, 0.6980392, 0, 1, 1,
0.773948, -1.062846, 1.22642, 0.7058824, 0, 1, 1,
0.7740491, -1.365489, 2.704225, 0.7098039, 0, 1, 1,
0.7822404, -0.473858, 1.725173, 0.7176471, 0, 1, 1,
0.7863992, 0.5605542, -0.1346382, 0.7215686, 0, 1, 1,
0.7949778, -0.9978486, 2.225557, 0.7294118, 0, 1, 1,
0.8060905, -0.4113416, 2.220973, 0.7333333, 0, 1, 1,
0.8085034, 1.130322, 2.612662, 0.7411765, 0, 1, 1,
0.8086078, 1.250648, 2.161308, 0.7450981, 0, 1, 1,
0.814745, -0.9405006, 1.635867, 0.7529412, 0, 1, 1,
0.8147465, -0.375598, 1.563372, 0.7568628, 0, 1, 1,
0.828429, 1.608018, -0.5938316, 0.7647059, 0, 1, 1,
0.8287079, 1.030513, 2.487217, 0.7686275, 0, 1, 1,
0.8346214, 0.8005817, 1.345826, 0.7764706, 0, 1, 1,
0.837708, -0.7666706, 1.796887, 0.7803922, 0, 1, 1,
0.8379992, -1.490313, 3.958007, 0.7882353, 0, 1, 1,
0.8421782, 0.6551015, 1.603, 0.7921569, 0, 1, 1,
0.8422152, 1.991688, -0.4735526, 0.8, 0, 1, 1,
0.8453957, -0.6037531, 1.934075, 0.8078431, 0, 1, 1,
0.8468928, 0.9316648, 1.633896, 0.8117647, 0, 1, 1,
0.8508057, -1.480983, 2.106322, 0.8196079, 0, 1, 1,
0.8576587, -0.9414575, 2.890084, 0.8235294, 0, 1, 1,
0.8584746, -2.605727, 3.036085, 0.8313726, 0, 1, 1,
0.8607352, 1.996599, -0.07921842, 0.8352941, 0, 1, 1,
0.8612691, 0.9034141, 0.921361, 0.8431373, 0, 1, 1,
0.8621508, -1.823157, 1.603424, 0.8470588, 0, 1, 1,
0.8649871, 0.3756115, 1.586764, 0.854902, 0, 1, 1,
0.8660847, 1.272511, 0.6639407, 0.8588235, 0, 1, 1,
0.8797818, 1.213216, 1.481678, 0.8666667, 0, 1, 1,
0.8816988, 0.9706331, 2.050584, 0.8705882, 0, 1, 1,
0.8856878, 0.4544854, 2.138072, 0.8784314, 0, 1, 1,
0.8866365, 1.463077, 0.4293737, 0.8823529, 0, 1, 1,
0.896295, -0.4545552, 2.608559, 0.8901961, 0, 1, 1,
0.8966516, 1.270111, 0.8528891, 0.8941177, 0, 1, 1,
0.8998271, -0.27238, 2.619679, 0.9019608, 0, 1, 1,
0.9069063, 0.6429836, 2.34179, 0.9098039, 0, 1, 1,
0.9196331, 0.3400011, -1.020822, 0.9137255, 0, 1, 1,
0.929711, -2.043913, 2.591858, 0.9215686, 0, 1, 1,
0.9478921, 0.7136916, 0.6775193, 0.9254902, 0, 1, 1,
0.9497034, 1.05768, 1.107428, 0.9333333, 0, 1, 1,
0.9503931, -0.5338624, 3.515905, 0.9372549, 0, 1, 1,
0.9540741, -1.046305, 1.675049, 0.945098, 0, 1, 1,
0.9749018, -0.4982201, 2.480008, 0.9490196, 0, 1, 1,
0.9765791, 1.043198, 0.6227227, 0.9568627, 0, 1, 1,
0.9854176, -0.4074281, 2.983305, 0.9607843, 0, 1, 1,
0.9877685, -0.192663, 1.555498, 0.9686275, 0, 1, 1,
0.9887528, -0.7201225, 3.043632, 0.972549, 0, 1, 1,
0.9901696, -1.314657, 1.412062, 0.9803922, 0, 1, 1,
0.9910473, -0.8785954, 2.429115, 0.9843137, 0, 1, 1,
1.002445, 0.5864344, 2.788494, 0.9921569, 0, 1, 1,
1.002945, -0.1909898, 2.209969, 0.9960784, 0, 1, 1,
1.008096, 0.7410794, 1.249587, 1, 0, 0.9960784, 1,
1.010379, 0.2333222, 2.031782, 1, 0, 0.9882353, 1,
1.019976, -0.7603685, 2.971492, 1, 0, 0.9843137, 1,
1.022458, -0.7158204, -0.1457879, 1, 0, 0.9764706, 1,
1.049117, 0.6452813, -0.1055393, 1, 0, 0.972549, 1,
1.052941, -0.9507095, 2.661442, 1, 0, 0.9647059, 1,
1.059545, 0.8603263, 1.266283, 1, 0, 0.9607843, 1,
1.060091, 0.4636792, 1.235791, 1, 0, 0.9529412, 1,
1.06065, -2.240948, 1.347988, 1, 0, 0.9490196, 1,
1.062724, -0.9205185, 1.213792, 1, 0, 0.9411765, 1,
1.064595, 0.2055489, 0.5645798, 1, 0, 0.9372549, 1,
1.066474, 0.2989684, 1.257742, 1, 0, 0.9294118, 1,
1.066515, -1.942351, 4.718724, 1, 0, 0.9254902, 1,
1.071301, 0.204532, 2.297876, 1, 0, 0.9176471, 1,
1.072602, -0.02369085, 0.6515735, 1, 0, 0.9137255, 1,
1.077524, 1.015859, 1.343503, 1, 0, 0.9058824, 1,
1.078511, -0.06080475, 2.382304, 1, 0, 0.9019608, 1,
1.08268, 1.036099, 2.108817, 1, 0, 0.8941177, 1,
1.089963, -1.596701, 2.989067, 1, 0, 0.8862745, 1,
1.090932, 1.087755, 1.743019, 1, 0, 0.8823529, 1,
1.09381, -0.3700385, 3.091795, 1, 0, 0.8745098, 1,
1.094162, -0.3080446, 0.9496238, 1, 0, 0.8705882, 1,
1.097853, -1.003912, 3.024419, 1, 0, 0.8627451, 1,
1.101469, 0.06611841, 1.848566, 1, 0, 0.8588235, 1,
1.11002, 0.224918, 1.256474, 1, 0, 0.8509804, 1,
1.121523, -0.8626727, 0.3916329, 1, 0, 0.8470588, 1,
1.125763, -0.9419906, 2.918718, 1, 0, 0.8392157, 1,
1.131458, -1.538138, 3.254179, 1, 0, 0.8352941, 1,
1.133633, -0.6746613, 1.571579, 1, 0, 0.827451, 1,
1.135235, 1.225308, 1.741693, 1, 0, 0.8235294, 1,
1.141819, 1.265417, 1.895267, 1, 0, 0.8156863, 1,
1.150248, 0.1241801, 0.2571675, 1, 0, 0.8117647, 1,
1.160999, 0.2071783, 1.656323, 1, 0, 0.8039216, 1,
1.164555, -1.600672, 1.682025, 1, 0, 0.7960784, 1,
1.172094, 0.1342948, 2.09462, 1, 0, 0.7921569, 1,
1.176329, 0.01415251, 2.822365, 1, 0, 0.7843137, 1,
1.177301, -1.024526, 2.547834, 1, 0, 0.7803922, 1,
1.180281, -1.399893, 2.772384, 1, 0, 0.772549, 1,
1.182368, -0.5453273, 0.8030575, 1, 0, 0.7686275, 1,
1.183172, 0.6623589, 0.9068892, 1, 0, 0.7607843, 1,
1.183971, -0.6991775, 2.158306, 1, 0, 0.7568628, 1,
1.184568, -1.271797, 2.161434, 1, 0, 0.7490196, 1,
1.189625, -0.5162911, 2.777822, 1, 0, 0.7450981, 1,
1.203408, 0.2973139, -0.2985208, 1, 0, 0.7372549, 1,
1.207774, -0.568237, 3.43751, 1, 0, 0.7333333, 1,
1.211824, 0.2178511, 1.31347, 1, 0, 0.7254902, 1,
1.212852, 1.342815, 1.642736, 1, 0, 0.7215686, 1,
1.21332, 1.33772, 0.847491, 1, 0, 0.7137255, 1,
1.219822, 1.150529, 0.07372784, 1, 0, 0.7098039, 1,
1.231875, 0.1120841, 1.207272, 1, 0, 0.7019608, 1,
1.236852, -0.2260879, 2.799402, 1, 0, 0.6941177, 1,
1.243726, 0.1876118, 3.101936, 1, 0, 0.6901961, 1,
1.252939, 1.077106, 1.072889, 1, 0, 0.682353, 1,
1.253716, -0.6375857, 1.374785, 1, 0, 0.6784314, 1,
1.267244, -0.5137849, 0.6320286, 1, 0, 0.6705883, 1,
1.273961, 1.255519, 0.2798714, 1, 0, 0.6666667, 1,
1.285358, -0.01672745, 0.8438079, 1, 0, 0.6588235, 1,
1.287469, 0.1641988, 2.206573, 1, 0, 0.654902, 1,
1.297363, -0.5580998, 1.550977, 1, 0, 0.6470588, 1,
1.301632, -1.776, 2.668508, 1, 0, 0.6431373, 1,
1.308635, -0.0285903, 2.185461, 1, 0, 0.6352941, 1,
1.310268, -0.339072, 2.754019, 1, 0, 0.6313726, 1,
1.31157, 0.5356054, 2.927266, 1, 0, 0.6235294, 1,
1.320218, 0.2237573, 0.6400627, 1, 0, 0.6196079, 1,
1.324588, -1.67892, 2.027192, 1, 0, 0.6117647, 1,
1.327237, -0.48368, 2.041007, 1, 0, 0.6078432, 1,
1.329571, 1.314575, 1.22484, 1, 0, 0.6, 1,
1.33353, -0.1822003, 3.047706, 1, 0, 0.5921569, 1,
1.336253, -0.6846936, 0.6243793, 1, 0, 0.5882353, 1,
1.353114, 0.485516, 2.162459, 1, 0, 0.5803922, 1,
1.354528, -0.2643643, 3.707628, 1, 0, 0.5764706, 1,
1.368378, -1.591681, 2.435331, 1, 0, 0.5686275, 1,
1.368588, 1.015248, 0.6052059, 1, 0, 0.5647059, 1,
1.386482, -1.796094, 2.188052, 1, 0, 0.5568628, 1,
1.392673, -0.4902549, 1.919998, 1, 0, 0.5529412, 1,
1.392728, 0.5436099, -0.1426664, 1, 0, 0.5450981, 1,
1.397667, 1.050099, 0.2895561, 1, 0, 0.5411765, 1,
1.402604, 0.9115909, 1.079068, 1, 0, 0.5333334, 1,
1.404501, -0.3209977, 2.302237, 1, 0, 0.5294118, 1,
1.416442, 1.476037, 0.4922439, 1, 0, 0.5215687, 1,
1.418159, -0.6334279, 2.31484, 1, 0, 0.5176471, 1,
1.423191, -0.3563579, 1.2164, 1, 0, 0.509804, 1,
1.42653, 1.936975, -0.02366305, 1, 0, 0.5058824, 1,
1.429709, 0.963728, 1.526611, 1, 0, 0.4980392, 1,
1.433809, 0.1749265, 1.185036, 1, 0, 0.4901961, 1,
1.440346, -0.4111554, 0.9399992, 1, 0, 0.4862745, 1,
1.455652, -0.6967561, 0.6844378, 1, 0, 0.4784314, 1,
1.466382, -0.08655529, 1.811732, 1, 0, 0.4745098, 1,
1.469592, -0.883535, 3.244628, 1, 0, 0.4666667, 1,
1.473886, -0.4692237, 2.006651, 1, 0, 0.4627451, 1,
1.480653, -2.221365, 3.706383, 1, 0, 0.454902, 1,
1.493549, 0.3999585, 1.813022, 1, 0, 0.4509804, 1,
1.500483, 0.7217152, 2.206633, 1, 0, 0.4431373, 1,
1.500787, 0.5281906, 1.564734, 1, 0, 0.4392157, 1,
1.504712, -1.909919, 1.724138, 1, 0, 0.4313726, 1,
1.511115, 0.3840862, 3.214954, 1, 0, 0.427451, 1,
1.514263, 1.27761, 2.110911, 1, 0, 0.4196078, 1,
1.535212, -0.8964906, 2.149868, 1, 0, 0.4156863, 1,
1.536592, 0.1677946, -0.1011999, 1, 0, 0.4078431, 1,
1.558028, -0.2708097, 1.956094, 1, 0, 0.4039216, 1,
1.568243, -0.2615312, 1.583741, 1, 0, 0.3960784, 1,
1.569059, -0.1980264, 1.091447, 1, 0, 0.3882353, 1,
1.575033, -1.232035, 0.1749766, 1, 0, 0.3843137, 1,
1.589991, 0.2669852, 0.9004632, 1, 0, 0.3764706, 1,
1.610462, -1.801317, 3.119687, 1, 0, 0.372549, 1,
1.6211, -0.2322118, 0.9018443, 1, 0, 0.3647059, 1,
1.627083, 0.332877, 1.121977, 1, 0, 0.3607843, 1,
1.642119, -1.385571, 1.245692, 1, 0, 0.3529412, 1,
1.655382, -0.7557893, 1.934552, 1, 0, 0.3490196, 1,
1.661052, -0.01217912, 0.4488795, 1, 0, 0.3411765, 1,
1.663064, 0.507325, 1.274411, 1, 0, 0.3372549, 1,
1.668046, 1.39264, 0.4906279, 1, 0, 0.3294118, 1,
1.674793, 2.075312, 1.258937, 1, 0, 0.3254902, 1,
1.678982, 0.6493831, 1.39869, 1, 0, 0.3176471, 1,
1.684196, -0.8063076, 3.153358, 1, 0, 0.3137255, 1,
1.687529, 0.6563178, 1.761477, 1, 0, 0.3058824, 1,
1.692525, 0.9705925, 1.655985, 1, 0, 0.2980392, 1,
1.695144, 0.8277259, 1.206283, 1, 0, 0.2941177, 1,
1.696355, -1.757268, 1.036136, 1, 0, 0.2862745, 1,
1.696579, -0.2213066, 3.501602, 1, 0, 0.282353, 1,
1.729738, 1.579692, 0.9016964, 1, 0, 0.2745098, 1,
1.730953, 2.287124, 0.5084915, 1, 0, 0.2705882, 1,
1.735346, 0.1757823, 1.763538, 1, 0, 0.2627451, 1,
1.741242, -0.6831084, 1.323294, 1, 0, 0.2588235, 1,
1.753234, 1.043277, 0.9586803, 1, 0, 0.2509804, 1,
1.770934, 2.803264, 0.02320188, 1, 0, 0.2470588, 1,
1.77433, 1.197303, 2.350549, 1, 0, 0.2392157, 1,
1.788608, -0.2817678, 2.239213, 1, 0, 0.2352941, 1,
1.792701, -0.3290847, -1.596067, 1, 0, 0.227451, 1,
1.828493, 0.06273364, 1.841704, 1, 0, 0.2235294, 1,
1.841386, 0.4664005, 0.9101189, 1, 0, 0.2156863, 1,
1.884732, -0.9542727, 2.452626, 1, 0, 0.2117647, 1,
1.887182, -1.153235, 0.6669594, 1, 0, 0.2039216, 1,
1.911357, 1.484217, 2.476689, 1, 0, 0.1960784, 1,
1.912756, 1.101841, 0.9356393, 1, 0, 0.1921569, 1,
1.938101, 0.983233, 0.04247424, 1, 0, 0.1843137, 1,
1.977134, -0.5830538, 1.184556, 1, 0, 0.1803922, 1,
1.98722, -1.081476, 3.867238, 1, 0, 0.172549, 1,
1.995333, -0.7646737, 0.4538056, 1, 0, 0.1686275, 1,
2.005771, 1.195636, 0.9227088, 1, 0, 0.1607843, 1,
2.053235, 0.797093, 3.349487, 1, 0, 0.1568628, 1,
2.055753, 1.635188, 0.852464, 1, 0, 0.1490196, 1,
2.069303, 0.2134583, 0.40819, 1, 0, 0.145098, 1,
2.120388, -0.05461594, 1.768097, 1, 0, 0.1372549, 1,
2.132993, 1.87715, 0.5321386, 1, 0, 0.1333333, 1,
2.142681, -1.064491, 1.610033, 1, 0, 0.1254902, 1,
2.157329, -0.4859505, 2.488239, 1, 0, 0.1215686, 1,
2.192351, -0.7007508, 2.4028, 1, 0, 0.1137255, 1,
2.242406, 0.8561628, 1.137015, 1, 0, 0.1098039, 1,
2.282303, -1.075979, 2.420418, 1, 0, 0.1019608, 1,
2.326957, 0.656227, 2.515228, 1, 0, 0.09411765, 1,
2.385955, -0.3986877, 2.27224, 1, 0, 0.09019608, 1,
2.387345, 0.488922, 1.40045, 1, 0, 0.08235294, 1,
2.445057, 0.2555434, 2.44699, 1, 0, 0.07843138, 1,
2.466492, -0.7416081, 2.976974, 1, 0, 0.07058824, 1,
2.477172, -1.00791, 2.592646, 1, 0, 0.06666667, 1,
2.506865, 0.03450487, 0.6011465, 1, 0, 0.05882353, 1,
2.515872, -0.9519369, 0.6329252, 1, 0, 0.05490196, 1,
2.560337, -0.3054384, 2.124952, 1, 0, 0.04705882, 1,
2.604597, -0.2763126, 1.961954, 1, 0, 0.04313726, 1,
2.63234, 0.9923058, 0.9842318, 1, 0, 0.03529412, 1,
2.632724, 0.5110603, 2.518079, 1, 0, 0.03137255, 1,
2.650255, -1.024509, 1.240215, 1, 0, 0.02352941, 1,
2.769417, -1.456005, 1.176698, 1, 0, 0.01960784, 1,
2.898863, 0.616739, 2.588284, 1, 0, 0.01176471, 1,
2.947533, -0.09621706, 2.19843, 1, 0, 0.007843138, 1
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
-0.117029, -4.183242, -6.899915, 0, -0.5, 0.5, 0.5,
-0.117029, -4.183242, -6.899915, 1, -0.5, 0.5, 0.5,
-0.117029, -4.183242, -6.899915, 1, 1.5, 0.5, 0.5,
-0.117029, -4.183242, -6.899915, 0, 1.5, 0.5, 0.5
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
-4.220478, 0.05420387, -6.899915, 0, -0.5, 0.5, 0.5,
-4.220478, 0.05420387, -6.899915, 1, -0.5, 0.5, 0.5,
-4.220478, 0.05420387, -6.899915, 1, 1.5, 0.5, 0.5,
-4.220478, 0.05420387, -6.899915, 0, 1.5, 0.5, 0.5
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
-4.220478, -4.183242, -0.08004069, 0, -0.5, 0.5, 0.5,
-4.220478, -4.183242, -0.08004069, 1, -0.5, 0.5, 0.5,
-4.220478, -4.183242, -0.08004069, 1, 1.5, 0.5, 0.5,
-4.220478, -4.183242, -0.08004069, 0, 1.5, 0.5, 0.5
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
-3, -3.20537, -5.326097,
2, -3.20537, -5.326097,
-3, -3.20537, -5.326097,
-3, -3.368349, -5.5884,
-2, -3.20537, -5.326097,
-2, -3.368349, -5.5884,
-1, -3.20537, -5.326097,
-1, -3.368349, -5.5884,
0, -3.20537, -5.326097,
0, -3.368349, -5.5884,
1, -3.20537, -5.326097,
1, -3.368349, -5.5884,
2, -3.20537, -5.326097,
2, -3.368349, -5.5884
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
-3, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
-3, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
-3, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
-3, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5,
-2, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
-2, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
-2, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
-2, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5,
-1, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
-1, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
-1, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
-1, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5,
0, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
0, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
0, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
0, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5,
1, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
1, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
1, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
1, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5,
2, -3.694306, -6.113006, 0, -0.5, 0.5, 0.5,
2, -3.694306, -6.113006, 1, -0.5, 0.5, 0.5,
2, -3.694306, -6.113006, 1, 1.5, 0.5, 0.5,
2, -3.694306, -6.113006, 0, 1.5, 0.5, 0.5
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
-3.273528, -3, -5.326097,
-3.273528, 3, -5.326097,
-3.273528, -3, -5.326097,
-3.431353, -3, -5.5884,
-3.273528, -2, -5.326097,
-3.431353, -2, -5.5884,
-3.273528, -1, -5.326097,
-3.431353, -1, -5.5884,
-3.273528, 0, -5.326097,
-3.431353, 0, -5.5884,
-3.273528, 1, -5.326097,
-3.431353, 1, -5.5884,
-3.273528, 2, -5.326097,
-3.431353, 2, -5.5884,
-3.273528, 3, -5.326097,
-3.431353, 3, -5.5884
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
-3.747003, -3, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, -3, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, -3, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, -3, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, -2, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, -2, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, -2, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, -2, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, -1, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, -1, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, -1, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, -1, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, 0, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, 0, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, 0, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, 0, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, 1, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, 1, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, 1, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, 1, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, 2, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, 2, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, 2, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, 2, -6.113006, 0, 1.5, 0.5, 0.5,
-3.747003, 3, -6.113006, 0, -0.5, 0.5, 0.5,
-3.747003, 3, -6.113006, 1, -0.5, 0.5, 0.5,
-3.747003, 3, -6.113006, 1, 1.5, 0.5, 0.5,
-3.747003, 3, -6.113006, 0, 1.5, 0.5, 0.5
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
-3.273528, -3.20537, -4,
-3.273528, -3.20537, 4,
-3.273528, -3.20537, -4,
-3.431353, -3.368349, -4,
-3.273528, -3.20537, -2,
-3.431353, -3.368349, -2,
-3.273528, -3.20537, 0,
-3.431353, -3.368349, 0,
-3.273528, -3.20537, 2,
-3.431353, -3.368349, 2,
-3.273528, -3.20537, 4,
-3.431353, -3.368349, 4
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
-3.747003, -3.694306, -4, 0, -0.5, 0.5, 0.5,
-3.747003, -3.694306, -4, 1, -0.5, 0.5, 0.5,
-3.747003, -3.694306, -4, 1, 1.5, 0.5, 0.5,
-3.747003, -3.694306, -4, 0, 1.5, 0.5, 0.5,
-3.747003, -3.694306, -2, 0, -0.5, 0.5, 0.5,
-3.747003, -3.694306, -2, 1, -0.5, 0.5, 0.5,
-3.747003, -3.694306, -2, 1, 1.5, 0.5, 0.5,
-3.747003, -3.694306, -2, 0, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 0, 0, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 0, 1, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 0, 1, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 0, 0, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 2, 0, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 2, 1, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 2, 1, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 2, 0, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 4, 0, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 4, 1, -0.5, 0.5, 0.5,
-3.747003, -3.694306, 4, 1, 1.5, 0.5, 0.5,
-3.747003, -3.694306, 4, 0, 1.5, 0.5, 0.5
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
-3.273528, -3.20537, -5.326097,
-3.273528, 3.313778, -5.326097,
-3.273528, -3.20537, 5.166016,
-3.273528, 3.313778, 5.166016,
-3.273528, -3.20537, -5.326097,
-3.273528, -3.20537, 5.166016,
-3.273528, 3.313778, -5.326097,
-3.273528, 3.313778, 5.166016,
-3.273528, -3.20537, -5.326097,
3.03947, -3.20537, -5.326097,
-3.273528, -3.20537, 5.166016,
3.03947, -3.20537, 5.166016,
-3.273528, 3.313778, -5.326097,
3.03947, 3.313778, -5.326097,
-3.273528, 3.313778, 5.166016,
3.03947, 3.313778, 5.166016,
3.03947, -3.20537, -5.326097,
3.03947, 3.313778, -5.326097,
3.03947, -3.20537, 5.166016,
3.03947, 3.313778, 5.166016,
3.03947, -3.20537, -5.326097,
3.03947, -3.20537, 5.166016,
3.03947, 3.313778, -5.326097,
3.03947, 3.313778, 5.166016
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
var radius = 7.407481;
var distance = 32.95672;
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
mvMatrix.translate( 0.117029, -0.05420387, 0.08004069 );
mvMatrix.scale( 1.26867, 1.228552, 0.763346 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.95672);
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


