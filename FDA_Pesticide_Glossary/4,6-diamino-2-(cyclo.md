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
-3.579703, -1.97935, -2.999053, 1, 0, 0, 1,
-2.996381, 1.324106, -1.727403, 1, 0.007843138, 0, 1,
-2.810124, -0.4777428, -1.187005, 1, 0.01176471, 0, 1,
-2.681839, 0.4812236, -1.52016, 1, 0.01960784, 0, 1,
-2.681595, 0.9480889, -1.836867, 1, 0.02352941, 0, 1,
-2.662397, 0.2420856, -0.9406151, 1, 0.03137255, 0, 1,
-2.487657, 0.5765794, -0.5792134, 1, 0.03529412, 0, 1,
-2.477495, 2.070363, -0.3212138, 1, 0.04313726, 0, 1,
-2.447646, -1.236352, -0.1374183, 1, 0.04705882, 0, 1,
-2.422739, 1.376955, -0.835282, 1, 0.05490196, 0, 1,
-2.419402, -0.1673704, -1.398718, 1, 0.05882353, 0, 1,
-2.417467, 0.964376, -1.571246, 1, 0.06666667, 0, 1,
-2.40808, -0.05727079, -1.264549, 1, 0.07058824, 0, 1,
-2.385268, 0.2583837, -2.254515, 1, 0.07843138, 0, 1,
-2.369474, 0.1111165, -3.722419, 1, 0.08235294, 0, 1,
-2.335244, 0.08982494, -2.117449, 1, 0.09019608, 0, 1,
-2.311729, -1.573031, -1.246328, 1, 0.09411765, 0, 1,
-2.236599, 0.9328479, -1.341157, 1, 0.1019608, 0, 1,
-2.18927, 0.3427108, -0.1441008, 1, 0.1098039, 0, 1,
-2.143522, 0.5371085, -1.037319, 1, 0.1137255, 0, 1,
-2.12748, -0.9807721, -2.506896, 1, 0.1215686, 0, 1,
-2.127098, -0.2662446, -2.538015, 1, 0.1254902, 0, 1,
-2.088118, 0.1312368, -1.905212, 1, 0.1333333, 0, 1,
-2.086738, 1.664457, -1.947919, 1, 0.1372549, 0, 1,
-2.030676, 1.223884, -1.175154, 1, 0.145098, 0, 1,
-2.007445, 0.2635286, -1.456285, 1, 0.1490196, 0, 1,
-2.007242, 1.851485, -0.03750096, 1, 0.1568628, 0, 1,
-1.99288, 1.861458, -1.088309, 1, 0.1607843, 0, 1,
-1.966251, 1.180276, -0.9741507, 1, 0.1686275, 0, 1,
-1.925889, -0.7412081, -3.440385, 1, 0.172549, 0, 1,
-1.901257, -0.9378306, -2.618707, 1, 0.1803922, 0, 1,
-1.886801, 0.7940263, -0.6521951, 1, 0.1843137, 0, 1,
-1.871727, 0.8053891, -1.074714, 1, 0.1921569, 0, 1,
-1.816113, -1.913701, -4.427975, 1, 0.1960784, 0, 1,
-1.814841, 1.161286, -2.048857, 1, 0.2039216, 0, 1,
-1.813575, 1.11052, -0.518345, 1, 0.2117647, 0, 1,
-1.808871, -2.579293, -1.116657, 1, 0.2156863, 0, 1,
-1.800504, -0.06450637, 0.119091, 1, 0.2235294, 0, 1,
-1.784704, 0.2060391, -1.413846, 1, 0.227451, 0, 1,
-1.774166, -1.848377, -2.397707, 1, 0.2352941, 0, 1,
-1.772485, -0.2137315, 0.08424363, 1, 0.2392157, 0, 1,
-1.768049, 0.4796557, -1.271441, 1, 0.2470588, 0, 1,
-1.765482, 0.6413801, -0.7112849, 1, 0.2509804, 0, 1,
-1.748566, 0.1861905, -1.193897, 1, 0.2588235, 0, 1,
-1.748319, 1.564234, -0.9786301, 1, 0.2627451, 0, 1,
-1.741602, -1.509574, -1.758332, 1, 0.2705882, 0, 1,
-1.738592, -0.3970285, -2.417607, 1, 0.2745098, 0, 1,
-1.702782, -1.766625, -2.73092, 1, 0.282353, 0, 1,
-1.702178, -1.758577, -2.640433, 1, 0.2862745, 0, 1,
-1.693107, -0.3191493, -2.33211, 1, 0.2941177, 0, 1,
-1.690129, 0.09623817, -1.489457, 1, 0.3019608, 0, 1,
-1.658859, 1.103711, -0.538389, 1, 0.3058824, 0, 1,
-1.609602, -0.7787871, -1.220653, 1, 0.3137255, 0, 1,
-1.606415, 0.149463, -3.055825, 1, 0.3176471, 0, 1,
-1.602033, 0.01346345, -0.7992665, 1, 0.3254902, 0, 1,
-1.583384, -0.302177, -2.97532, 1, 0.3294118, 0, 1,
-1.564869, -0.5830147, -1.864207, 1, 0.3372549, 0, 1,
-1.564806, 1.806558, 0.1508439, 1, 0.3411765, 0, 1,
-1.564294, -0.05406135, -0.9726406, 1, 0.3490196, 0, 1,
-1.562373, -1.305222, -1.379121, 1, 0.3529412, 0, 1,
-1.557923, -0.4711899, -1.978218, 1, 0.3607843, 0, 1,
-1.539612, 0.1558165, -1.159602, 1, 0.3647059, 0, 1,
-1.521637, 2.174183, 0.8697997, 1, 0.372549, 0, 1,
-1.519757, -1.511378, -3.597644, 1, 0.3764706, 0, 1,
-1.518435, -0.8652473, -3.595672, 1, 0.3843137, 0, 1,
-1.513025, 0.2266628, -2.354579, 1, 0.3882353, 0, 1,
-1.508638, 0.2317324, -1.495309, 1, 0.3960784, 0, 1,
-1.504181, -0.1187446, -1.723259, 1, 0.4039216, 0, 1,
-1.491288, 1.684033, -2.117299, 1, 0.4078431, 0, 1,
-1.485306, -0.1012924, -2.886202, 1, 0.4156863, 0, 1,
-1.482891, -1.119808, -1.887008, 1, 0.4196078, 0, 1,
-1.470599, 2.314976, -0.7902949, 1, 0.427451, 0, 1,
-1.468452, 0.1923482, 0.4931266, 1, 0.4313726, 0, 1,
-1.463122, 1.036073, -1.530914, 1, 0.4392157, 0, 1,
-1.458347, -1.913161, -3.663281, 1, 0.4431373, 0, 1,
-1.454979, 0.6163465, -1.099323, 1, 0.4509804, 0, 1,
-1.444004, 0.5346371, -0.6281439, 1, 0.454902, 0, 1,
-1.439172, -0.7643692, -2.235826, 1, 0.4627451, 0, 1,
-1.436135, 0.2983451, -0.9613965, 1, 0.4666667, 0, 1,
-1.430142, 1.294042, 0.3673765, 1, 0.4745098, 0, 1,
-1.430118, 0.6928332, -0.7956224, 1, 0.4784314, 0, 1,
-1.422244, -0.1485163, -2.169249, 1, 0.4862745, 0, 1,
-1.420277, 1.832158, -0.9475465, 1, 0.4901961, 0, 1,
-1.402103, 1.056859, -0.2948254, 1, 0.4980392, 0, 1,
-1.391659, -0.2878456, -2.202374, 1, 0.5058824, 0, 1,
-1.38993, -1.289167, -2.742321, 1, 0.509804, 0, 1,
-1.378832, -0.795576, -1.685906, 1, 0.5176471, 0, 1,
-1.373, -0.6041244, -2.339246, 1, 0.5215687, 0, 1,
-1.371771, 0.5517563, -1.272064, 1, 0.5294118, 0, 1,
-1.366651, 0.7295249, -2.112398, 1, 0.5333334, 0, 1,
-1.360683, 0.2642784, -0.3377199, 1, 0.5411765, 0, 1,
-1.359321, 0.5011535, -0.3668245, 1, 0.5450981, 0, 1,
-1.354158, -1.352225, -2.588857, 1, 0.5529412, 0, 1,
-1.343687, 1.071275, -1.065645, 1, 0.5568628, 0, 1,
-1.339453, -0.6154651, -2.085071, 1, 0.5647059, 0, 1,
-1.329719, -0.9831634, -3.101245, 1, 0.5686275, 0, 1,
-1.325677, 0.1584266, -3.358842, 1, 0.5764706, 0, 1,
-1.319932, 1.208544, -1.908334, 1, 0.5803922, 0, 1,
-1.309566, 0.4753969, -1.348662, 1, 0.5882353, 0, 1,
-1.308369, -0.6588445, -2.886888, 1, 0.5921569, 0, 1,
-1.294992, 0.6986466, 0.1474674, 1, 0.6, 0, 1,
-1.290734, -0.7338451, -2.227904, 1, 0.6078432, 0, 1,
-1.284126, 0.6171848, -0.4849473, 1, 0.6117647, 0, 1,
-1.282751, 0.4601806, -0.7530742, 1, 0.6196079, 0, 1,
-1.276843, -1.627027, -3.880665, 1, 0.6235294, 0, 1,
-1.268739, 0.5188322, -1.207583, 1, 0.6313726, 0, 1,
-1.262613, -0.8892539, -3.811547, 1, 0.6352941, 0, 1,
-1.260743, 0.6078121, -3.408103, 1, 0.6431373, 0, 1,
-1.249033, 0.2177591, -1.3956, 1, 0.6470588, 0, 1,
-1.243635, -1.957168, -2.03915, 1, 0.654902, 0, 1,
-1.213544, -1.18711, -3.531271, 1, 0.6588235, 0, 1,
-1.209682, -0.1008295, -1.635756, 1, 0.6666667, 0, 1,
-1.191373, 1.121926, -0.3198346, 1, 0.6705883, 0, 1,
-1.183053, 0.9882841, -2.767049, 1, 0.6784314, 0, 1,
-1.1788, -2.509296, -1.345761, 1, 0.682353, 0, 1,
-1.176002, 0.329462, 0.09354568, 1, 0.6901961, 0, 1,
-1.173885, -1.388888, -1.806167, 1, 0.6941177, 0, 1,
-1.173468, -0.1168783, 0.1933231, 1, 0.7019608, 0, 1,
-1.170677, -0.7661191, -2.543579, 1, 0.7098039, 0, 1,
-1.156619, -1.90385, -3.548413, 1, 0.7137255, 0, 1,
-1.156141, -0.9860677, -1.579393, 1, 0.7215686, 0, 1,
-1.149789, -0.8271146, -3.131495, 1, 0.7254902, 0, 1,
-1.145871, 0.1928358, -0.5693309, 1, 0.7333333, 0, 1,
-1.144217, -0.2330323, -3.664391, 1, 0.7372549, 0, 1,
-1.125483, -0.1846035, -3.032695, 1, 0.7450981, 0, 1,
-1.122833, -1.291316, -2.574649, 1, 0.7490196, 0, 1,
-1.116345, 0.6651932, -0.8548149, 1, 0.7568628, 0, 1,
-1.115807, 0.8829572, -1.014298, 1, 0.7607843, 0, 1,
-1.111184, -1.69496, -1.219714, 1, 0.7686275, 0, 1,
-1.108948, -0.4460224, -1.416677, 1, 0.772549, 0, 1,
-1.100019, 1.04283, -0.7874036, 1, 0.7803922, 0, 1,
-1.099143, -0.6063846, -1.474414, 1, 0.7843137, 0, 1,
-1.097036, -1.111966, -3.133269, 1, 0.7921569, 0, 1,
-1.09453, -1.105834, -2.63088, 1, 0.7960784, 0, 1,
-1.091492, 1.428396, -0.3306743, 1, 0.8039216, 0, 1,
-1.082256, 0.9083273, -0.6077067, 1, 0.8117647, 0, 1,
-1.079109, -0.356641, -3.024882, 1, 0.8156863, 0, 1,
-1.065543, -0.1837552, -0.7828159, 1, 0.8235294, 0, 1,
-1.061594, -0.5213711, -1.530121, 1, 0.827451, 0, 1,
-1.058226, 0.0160413, -3.503532, 1, 0.8352941, 0, 1,
-1.057749, 1.758733, -0.3585563, 1, 0.8392157, 0, 1,
-1.055083, -1.221185, -2.336153, 1, 0.8470588, 0, 1,
-1.053336, -0.2844661, -2.478665, 1, 0.8509804, 0, 1,
-1.048329, 0.4573207, -2.471125, 1, 0.8588235, 0, 1,
-1.039526, 0.1301873, -2.337614, 1, 0.8627451, 0, 1,
-1.032038, 0.8859239, -0.4596072, 1, 0.8705882, 0, 1,
-1.030664, 2.659513, 0.876669, 1, 0.8745098, 0, 1,
-1.026738, 0.01466982, -0.3653291, 1, 0.8823529, 0, 1,
-1.020788, -0.329213, -0.9207792, 1, 0.8862745, 0, 1,
-1.016072, 2.249002, 0.3129172, 1, 0.8941177, 0, 1,
-1.005565, 1.357855, 0.8130889, 1, 0.8980392, 0, 1,
-1.002218, 0.2354041, 0.010472, 1, 0.9058824, 0, 1,
-0.9988248, -0.1087386, -1.317181, 1, 0.9137255, 0, 1,
-0.9878592, -0.5635626, -2.475861, 1, 0.9176471, 0, 1,
-0.9858695, 1.051634, -0.9726741, 1, 0.9254902, 0, 1,
-0.9822994, -1.127342, -2.498747, 1, 0.9294118, 0, 1,
-0.9731736, 0.8424332, -0.6223333, 1, 0.9372549, 0, 1,
-0.9503087, 0.1894295, -2.553903, 1, 0.9411765, 0, 1,
-0.946192, 1.498639, -0.2273357, 1, 0.9490196, 0, 1,
-0.9445607, -0.3097286, -1.35898, 1, 0.9529412, 0, 1,
-0.9345164, 2.263162, -1.992189, 1, 0.9607843, 0, 1,
-0.931931, -0.2788026, -3.290034, 1, 0.9647059, 0, 1,
-0.929513, -0.4458808, -1.484644, 1, 0.972549, 0, 1,
-0.9188545, -0.6547582, -1.018418, 1, 0.9764706, 0, 1,
-0.9146009, 0.2915606, 0.2002061, 1, 0.9843137, 0, 1,
-0.9145848, -0.832182, -2.357246, 1, 0.9882353, 0, 1,
-0.9117821, 0.1472649, -1.615371, 1, 0.9960784, 0, 1,
-0.9008052, -0.1274057, -2.217324, 0.9960784, 1, 0, 1,
-0.8991611, 1.095487, 2.122353, 0.9921569, 1, 0, 1,
-0.8929535, -1.63375, -1.777652, 0.9843137, 1, 0, 1,
-0.8921134, 1.074425, -1.314593, 0.9803922, 1, 0, 1,
-0.8771213, -1.557668, -2.044203, 0.972549, 1, 0, 1,
-0.8755345, -0.7153592, -1.277676, 0.9686275, 1, 0, 1,
-0.8746341, 2.551102, -0.8338868, 0.9607843, 1, 0, 1,
-0.873733, -0.3956135, -4.895382, 0.9568627, 1, 0, 1,
-0.8716244, -0.2528598, -0.7420751, 0.9490196, 1, 0, 1,
-0.8702128, 2.882558, 0.5038757, 0.945098, 1, 0, 1,
-0.8692009, 0.2771906, -2.351866, 0.9372549, 1, 0, 1,
-0.8685477, -0.3639365, -2.691858, 0.9333333, 1, 0, 1,
-0.8674205, 1.402007, -0.5474693, 0.9254902, 1, 0, 1,
-0.8625504, 1.018521, -2.447083, 0.9215686, 1, 0, 1,
-0.8607441, -2.289746, -4.679906, 0.9137255, 1, 0, 1,
-0.8575085, 0.7206799, 0.1846785, 0.9098039, 1, 0, 1,
-0.8551304, 0.536541, -2.362338, 0.9019608, 1, 0, 1,
-0.8501248, -0.8536165, -2.390981, 0.8941177, 1, 0, 1,
-0.8493821, 0.5114388, -0.3465352, 0.8901961, 1, 0, 1,
-0.8397251, 0.5083523, -0.9218307, 0.8823529, 1, 0, 1,
-0.8361493, -1.438234, -2.361038, 0.8784314, 1, 0, 1,
-0.8337181, -1.373138, -3.586142, 0.8705882, 1, 0, 1,
-0.8310726, 0.5299037, -1.754567, 0.8666667, 1, 0, 1,
-0.8307145, 0.4691875, -2.142887, 0.8588235, 1, 0, 1,
-0.828365, -0.5376592, -1.277492, 0.854902, 1, 0, 1,
-0.8235763, 0.55773, 0.1365944, 0.8470588, 1, 0, 1,
-0.8226573, -0.7560439, -2.835685, 0.8431373, 1, 0, 1,
-0.8170065, 1.2565, -0.2264905, 0.8352941, 1, 0, 1,
-0.8166277, 1.253498, -0.1516736, 0.8313726, 1, 0, 1,
-0.8084773, -0.1475415, -1.06712, 0.8235294, 1, 0, 1,
-0.8055311, 0.9187906, -0.6847094, 0.8196079, 1, 0, 1,
-0.8054349, -0.2148076, -1.36111, 0.8117647, 1, 0, 1,
-0.8052039, 0.7653314, -1.276074, 0.8078431, 1, 0, 1,
-0.8005647, -0.5298288, -3.00861, 0.8, 1, 0, 1,
-0.7959287, 0.8099323, -0.8593823, 0.7921569, 1, 0, 1,
-0.7948354, -1.955956, -6.167168, 0.7882353, 1, 0, 1,
-0.7896532, 0.01535496, -1.896457, 0.7803922, 1, 0, 1,
-0.7860293, 0.5657688, -0.9171782, 0.7764706, 1, 0, 1,
-0.7847559, -0.2680705, -2.242449, 0.7686275, 1, 0, 1,
-0.7847241, 0.7811121, 0.9495802, 0.7647059, 1, 0, 1,
-0.7821004, 1.117558, -0.4175011, 0.7568628, 1, 0, 1,
-0.7778525, 1.344822, 0.1066261, 0.7529412, 1, 0, 1,
-0.777478, 0.02431465, -2.201779, 0.7450981, 1, 0, 1,
-0.7774374, -1.373676, -2.960578, 0.7411765, 1, 0, 1,
-0.7773576, -1.034953, -3.478237, 0.7333333, 1, 0, 1,
-0.7711473, 0.5760623, -1.443182, 0.7294118, 1, 0, 1,
-0.7552234, 0.8914425, -1.860349, 0.7215686, 1, 0, 1,
-0.7542018, 0.2737148, -0.8854382, 0.7176471, 1, 0, 1,
-0.7536827, 1.4442, -2.130658, 0.7098039, 1, 0, 1,
-0.7532232, -0.5504659, -2.295931, 0.7058824, 1, 0, 1,
-0.7497262, -0.6515832, -3.231256, 0.6980392, 1, 0, 1,
-0.7424589, -0.8245562, -1.416486, 0.6901961, 1, 0, 1,
-0.7330216, 0.5857815, -0.5420828, 0.6862745, 1, 0, 1,
-0.7326735, 0.2652147, 0.02494132, 0.6784314, 1, 0, 1,
-0.720706, -0.9082267, -3.965742, 0.6745098, 1, 0, 1,
-0.7196448, 1.45943, 1.335229, 0.6666667, 1, 0, 1,
-0.7141235, -1.105075, -3.246805, 0.6627451, 1, 0, 1,
-0.707433, -0.1259676, -2.056022, 0.654902, 1, 0, 1,
-0.6958305, 0.5011492, -1.321573, 0.6509804, 1, 0, 1,
-0.6942979, 0.3994928, -2.092359, 0.6431373, 1, 0, 1,
-0.6941345, 0.06168733, -0.4076303, 0.6392157, 1, 0, 1,
-0.6921123, -0.7085834, -3.693076, 0.6313726, 1, 0, 1,
-0.6857721, -0.9766598, -2.971434, 0.627451, 1, 0, 1,
-0.6847419, 0.9451334, -0.6149228, 0.6196079, 1, 0, 1,
-0.6789543, 0.1641317, -0.9846308, 0.6156863, 1, 0, 1,
-0.6777267, -0.5493755, -2.408141, 0.6078432, 1, 0, 1,
-0.6767998, 0.5954382, -0.9483004, 0.6039216, 1, 0, 1,
-0.6714391, -1.155774, -0.9065803, 0.5960785, 1, 0, 1,
-0.6684417, -1.309127, -4.284425, 0.5882353, 1, 0, 1,
-0.6656004, 0.7760382, 0.5703366, 0.5843138, 1, 0, 1,
-0.664378, -0.3331766, -0.9931046, 0.5764706, 1, 0, 1,
-0.659771, -0.4990565, -2.78163, 0.572549, 1, 0, 1,
-0.6595703, -1.573126, -1.701, 0.5647059, 1, 0, 1,
-0.657897, -0.1016739, 0.7592533, 0.5607843, 1, 0, 1,
-0.6561618, 1.380797, 0.6531204, 0.5529412, 1, 0, 1,
-0.6553044, -0.468048, -3.084956, 0.5490196, 1, 0, 1,
-0.6501579, -1.522562, -1.948725, 0.5411765, 1, 0, 1,
-0.6471033, 0.3539508, 0.5796497, 0.5372549, 1, 0, 1,
-0.6462912, 0.8989277, -0.3306043, 0.5294118, 1, 0, 1,
-0.6455647, 0.1926499, -2.019375, 0.5254902, 1, 0, 1,
-0.6449993, -0.4124218, -0.7157769, 0.5176471, 1, 0, 1,
-0.6426744, 0.439937, -1.096888, 0.5137255, 1, 0, 1,
-0.6399811, -0.7662962, -4.010507, 0.5058824, 1, 0, 1,
-0.6355725, -0.1417817, -2.2734, 0.5019608, 1, 0, 1,
-0.6325727, -0.8610755, -1.580363, 0.4941176, 1, 0, 1,
-0.6318283, 0.1238882, -2.050122, 0.4862745, 1, 0, 1,
-0.6311303, 0.8453946, -0.9850416, 0.4823529, 1, 0, 1,
-0.6271552, -0.2012541, -1.730312, 0.4745098, 1, 0, 1,
-0.627116, -0.5327159, -3.528787, 0.4705882, 1, 0, 1,
-0.6262009, 0.7205789, 0.5963169, 0.4627451, 1, 0, 1,
-0.6259588, 2.177801, -1.864139, 0.4588235, 1, 0, 1,
-0.6251442, -1.363703, -4.02181, 0.4509804, 1, 0, 1,
-0.6222883, -0.7765436, -2.443599, 0.4470588, 1, 0, 1,
-0.6191808, -1.250564, -2.462627, 0.4392157, 1, 0, 1,
-0.6136801, -0.4180208, -0.3916752, 0.4352941, 1, 0, 1,
-0.6103389, -0.09926499, -2.117419, 0.427451, 1, 0, 1,
-0.610316, -0.7439449, -2.879131, 0.4235294, 1, 0, 1,
-0.6063421, 0.8297384, -1.173972, 0.4156863, 1, 0, 1,
-0.6039036, 0.2054157, -0.9101185, 0.4117647, 1, 0, 1,
-0.6011417, 0.5845648, -0.06447696, 0.4039216, 1, 0, 1,
-0.5981361, -1.14187, -2.476651, 0.3960784, 1, 0, 1,
-0.5951714, -0.27255, -1.146373, 0.3921569, 1, 0, 1,
-0.5926654, 0.3625661, -3.606701, 0.3843137, 1, 0, 1,
-0.5895773, 0.6956031, -0.2355899, 0.3803922, 1, 0, 1,
-0.5894768, 0.1213209, -0.6949713, 0.372549, 1, 0, 1,
-0.5877178, 0.3400075, -2.279882, 0.3686275, 1, 0, 1,
-0.5831813, 1.628148, -0.4040667, 0.3607843, 1, 0, 1,
-0.5784546, -0.02388347, -1.176451, 0.3568628, 1, 0, 1,
-0.5759326, 0.7402964, -1.109025, 0.3490196, 1, 0, 1,
-0.574819, 0.1955775, -1.531945, 0.345098, 1, 0, 1,
-0.5745328, 0.5370988, -2.406687, 0.3372549, 1, 0, 1,
-0.5727988, 1.027285, 0.5216212, 0.3333333, 1, 0, 1,
-0.5716168, -0.9420433, -2.270945, 0.3254902, 1, 0, 1,
-0.5658411, 0.8370243, -0.6809317, 0.3215686, 1, 0, 1,
-0.5606009, 0.3244444, -1.962026, 0.3137255, 1, 0, 1,
-0.5605171, -0.05883937, -1.62393, 0.3098039, 1, 0, 1,
-0.559105, -0.7679799, -2.564368, 0.3019608, 1, 0, 1,
-0.5586969, -1.817534, -1.656511, 0.2941177, 1, 0, 1,
-0.5541034, 0.4363475, -0.4644015, 0.2901961, 1, 0, 1,
-0.5528921, 0.03720094, -2.634721, 0.282353, 1, 0, 1,
-0.5260773, 0.4057509, -0.5020991, 0.2784314, 1, 0, 1,
-0.525807, 0.8509649, -0.4714135, 0.2705882, 1, 0, 1,
-0.5217581, -0.4534563, -1.678596, 0.2666667, 1, 0, 1,
-0.5206143, -0.5767726, -2.302518, 0.2588235, 1, 0, 1,
-0.5206134, -0.8660557, -2.087758, 0.254902, 1, 0, 1,
-0.5194274, -1.075427, -3.464166, 0.2470588, 1, 0, 1,
-0.5167633, 1.512703, -0.6358504, 0.2431373, 1, 0, 1,
-0.5156893, 0.9560323, -0.3854889, 0.2352941, 1, 0, 1,
-0.5151536, -0.1128414, -2.409497, 0.2313726, 1, 0, 1,
-0.5127849, 2.188371, -0.6628716, 0.2235294, 1, 0, 1,
-0.5108118, 0.511788, 0.009458763, 0.2196078, 1, 0, 1,
-0.508831, -0.953625, -3.258032, 0.2117647, 1, 0, 1,
-0.507386, 0.1200467, -2.288392, 0.2078431, 1, 0, 1,
-0.502656, 1.506359, -0.2153792, 0.2, 1, 0, 1,
-0.4969653, -0.8389211, -2.85216, 0.1921569, 1, 0, 1,
-0.4888862, 0.6132288, -0.2256532, 0.1882353, 1, 0, 1,
-0.4880805, -0.7827952, -2.991301, 0.1803922, 1, 0, 1,
-0.4877514, -0.983772, -0.4176126, 0.1764706, 1, 0, 1,
-0.4867428, 0.2674127, -1.476318, 0.1686275, 1, 0, 1,
-0.4862706, -0.1219181, -1.387828, 0.1647059, 1, 0, 1,
-0.482805, 0.1946519, -2.320863, 0.1568628, 1, 0, 1,
-0.4767542, -1.406744, -0.3516182, 0.1529412, 1, 0, 1,
-0.4755715, 0.2730191, -1.586597, 0.145098, 1, 0, 1,
-0.4718022, 0.5749645, -1.903018, 0.1411765, 1, 0, 1,
-0.4612189, -0.4206531, -2.265086, 0.1333333, 1, 0, 1,
-0.4603336, -0.7368693, -2.49059, 0.1294118, 1, 0, 1,
-0.4558258, -2.085856, -2.100078, 0.1215686, 1, 0, 1,
-0.4555437, -0.7521518, -3.583655, 0.1176471, 1, 0, 1,
-0.4516407, 0.5402464, 0.1314311, 0.1098039, 1, 0, 1,
-0.4503492, 1.692842, 0.7990096, 0.1058824, 1, 0, 1,
-0.450156, -0.0230935, -1.704314, 0.09803922, 1, 0, 1,
-0.4500248, -0.2342021, -0.08602912, 0.09019608, 1, 0, 1,
-0.4498297, -1.19679, -2.126451, 0.08627451, 1, 0, 1,
-0.449519, -0.7414792, -3.363693, 0.07843138, 1, 0, 1,
-0.4468233, -0.8137885, -3.477483, 0.07450981, 1, 0, 1,
-0.4463169, 0.03346517, -1.941834, 0.06666667, 1, 0, 1,
-0.4456209, 0.7347745, -0.4791031, 0.0627451, 1, 0, 1,
-0.4442867, -2.048593, -3.097265, 0.05490196, 1, 0, 1,
-0.4427702, 1.325956, 1.25978, 0.05098039, 1, 0, 1,
-0.4410184, 0.08563299, -2.239605, 0.04313726, 1, 0, 1,
-0.4384957, -0.7500339, -4.394167, 0.03921569, 1, 0, 1,
-0.4349849, -0.4652104, -1.914478, 0.03137255, 1, 0, 1,
-0.4314371, 1.019134, -0.991501, 0.02745098, 1, 0, 1,
-0.4279738, 1.896134, 0.3672535, 0.01960784, 1, 0, 1,
-0.4229698, -1.466129, -3.350562, 0.01568628, 1, 0, 1,
-0.4212056, -0.3812336, -2.746263, 0.007843138, 1, 0, 1,
-0.4190966, -0.388798, -2.623122, 0.003921569, 1, 0, 1,
-0.4172453, -0.483422, -2.068575, 0, 1, 0.003921569, 1,
-0.4136905, -0.02365991, -1.619385, 0, 1, 0.01176471, 1,
-0.412517, 0.2096589, -1.006021, 0, 1, 0.01568628, 1,
-0.4108388, -0.2020595, -2.21864, 0, 1, 0.02352941, 1,
-0.4090261, 0.57688, -0.6639603, 0, 1, 0.02745098, 1,
-0.3975546, -1.468992, -3.812771, 0, 1, 0.03529412, 1,
-0.3968782, -1.210735, -3.402146, 0, 1, 0.03921569, 1,
-0.3957535, -1.666224, -3.326013, 0, 1, 0.04705882, 1,
-0.3950519, -1.331574, -3.555688, 0, 1, 0.05098039, 1,
-0.3948064, -0.5324836, -2.379083, 0, 1, 0.05882353, 1,
-0.39289, -0.9695805, -1.416271, 0, 1, 0.0627451, 1,
-0.3904049, -1.617303, -1.470592, 0, 1, 0.07058824, 1,
-0.3887776, 0.917647, -0.7921449, 0, 1, 0.07450981, 1,
-0.3872677, -0.01882277, -2.132798, 0, 1, 0.08235294, 1,
-0.3868814, 1.253042, 0.2443169, 0, 1, 0.08627451, 1,
-0.3832992, -0.8121472, -3.465951, 0, 1, 0.09411765, 1,
-0.3829456, -0.05194622, 0.2442342, 0, 1, 0.1019608, 1,
-0.3807756, 1.043004, -1.233584, 0, 1, 0.1058824, 1,
-0.3806197, 0.1593798, -2.965344, 0, 1, 0.1137255, 1,
-0.3779368, 3.088575, -0.1335579, 0, 1, 0.1176471, 1,
-0.3776275, -0.4524612, -4.571477, 0, 1, 0.1254902, 1,
-0.377228, -0.2399885, -2.081377, 0, 1, 0.1294118, 1,
-0.3771376, 1.201779, -0.1703468, 0, 1, 0.1372549, 1,
-0.3763266, -0.3855374, -3.290229, 0, 1, 0.1411765, 1,
-0.3758551, -0.1648766, 0.226475, 0, 1, 0.1490196, 1,
-0.3709999, 1.624405, -1.514694, 0, 1, 0.1529412, 1,
-0.3652934, 0.7545819, 0.2912171, 0, 1, 0.1607843, 1,
-0.3645373, -0.4785216, -2.222733, 0, 1, 0.1647059, 1,
-0.3641109, 0.8529072, -0.1337733, 0, 1, 0.172549, 1,
-0.3625245, 0.2026201, -1.063338, 0, 1, 0.1764706, 1,
-0.3524359, -0.475742, -3.280658, 0, 1, 0.1843137, 1,
-0.3499194, -2.207526, -3.612353, 0, 1, 0.1882353, 1,
-0.3493716, -0.1275945, -3.337866, 0, 1, 0.1960784, 1,
-0.3479974, -1.399422, -4.216488, 0, 1, 0.2039216, 1,
-0.3448212, 0.5052317, -0.1694738, 0, 1, 0.2078431, 1,
-0.3425246, 0.24428, -2.568577, 0, 1, 0.2156863, 1,
-0.341525, -0.1460474, -2.013021, 0, 1, 0.2196078, 1,
-0.3407462, 1.004201, 0.1287049, 0, 1, 0.227451, 1,
-0.3394864, -0.1646592, -2.677133, 0, 1, 0.2313726, 1,
-0.3376731, 0.3814341, -1.678734, 0, 1, 0.2392157, 1,
-0.3368418, -0.6862804, -3.200165, 0, 1, 0.2431373, 1,
-0.3352828, 1.138494, -0.5895074, 0, 1, 0.2509804, 1,
-0.3329848, 2.017671, -0.4221052, 0, 1, 0.254902, 1,
-0.3315572, 0.9141555, -0.5024588, 0, 1, 0.2627451, 1,
-0.3300475, -1.181379, -1.782593, 0, 1, 0.2666667, 1,
-0.3285933, 1.438148, 0.02724027, 0, 1, 0.2745098, 1,
-0.3284462, 0.7625137, -0.1218369, 0, 1, 0.2784314, 1,
-0.3260986, -0.7827643, -3.157763, 0, 1, 0.2862745, 1,
-0.320101, -0.1215185, -2.860619, 0, 1, 0.2901961, 1,
-0.3149475, -0.6601191, -4.018589, 0, 1, 0.2980392, 1,
-0.3050372, -0.2514622, -2.909752, 0, 1, 0.3058824, 1,
-0.3047619, -0.1300018, -2.48197, 0, 1, 0.3098039, 1,
-0.3029552, 0.6911552, 0.2123824, 0, 1, 0.3176471, 1,
-0.301928, -1.92494, -4.084699, 0, 1, 0.3215686, 1,
-0.2984163, -0.7726468, -1.54984, 0, 1, 0.3294118, 1,
-0.2883876, 0.5168498, -1.188282, 0, 1, 0.3333333, 1,
-0.2879772, -0.7835476, -1.36556, 0, 1, 0.3411765, 1,
-0.2867112, -1.390799, -3.622687, 0, 1, 0.345098, 1,
-0.2848971, -1.075887, -2.535311, 0, 1, 0.3529412, 1,
-0.2815532, 1.613229, 0.8715176, 0, 1, 0.3568628, 1,
-0.2793305, -0.6971816, -2.741479, 0, 1, 0.3647059, 1,
-0.2778133, -1.180389, -1.339517, 0, 1, 0.3686275, 1,
-0.2763747, 1.15198, -0.2521553, 0, 1, 0.3764706, 1,
-0.2734605, 0.4962549, -0.4480819, 0, 1, 0.3803922, 1,
-0.2681082, 0.1986462, -1.28231, 0, 1, 0.3882353, 1,
-0.2662289, -0.6162956, -2.452943, 0, 1, 0.3921569, 1,
-0.2652854, -0.7486765, -3.48763, 0, 1, 0.4, 1,
-0.2612061, 0.1418709, -1.530127, 0, 1, 0.4078431, 1,
-0.2608811, 0.5424908, 1.286828, 0, 1, 0.4117647, 1,
-0.2605299, -0.234925, -2.495886, 0, 1, 0.4196078, 1,
-0.2589381, 0.8978011, -1.903061, 0, 1, 0.4235294, 1,
-0.2569232, -0.1335263, -2.031362, 0, 1, 0.4313726, 1,
-0.2554793, 1.002426, -0.7897105, 0, 1, 0.4352941, 1,
-0.2540244, 0.9102718, -0.4469209, 0, 1, 0.4431373, 1,
-0.2537259, 0.7005957, -0.7860616, 0, 1, 0.4470588, 1,
-0.2531714, -0.5615677, -2.367936, 0, 1, 0.454902, 1,
-0.250296, -0.06614102, -1.579491, 0, 1, 0.4588235, 1,
-0.2496084, -1.221074, -3.669389, 0, 1, 0.4666667, 1,
-0.2493905, -0.1084581, -2.083169, 0, 1, 0.4705882, 1,
-0.2473098, 0.598766, 0.2454003, 0, 1, 0.4784314, 1,
-0.2454214, 0.7358344, -1.755645, 0, 1, 0.4823529, 1,
-0.2445607, -1.214969, -1.317767, 0, 1, 0.4901961, 1,
-0.2441144, -2.847377, -3.067612, 0, 1, 0.4941176, 1,
-0.2427766, -0.8008738, -4.665897, 0, 1, 0.5019608, 1,
-0.2403282, 0.03957525, -0.5081193, 0, 1, 0.509804, 1,
-0.2385597, -0.4002474, -2.996008, 0, 1, 0.5137255, 1,
-0.2375178, -0.1950219, -2.867323, 0, 1, 0.5215687, 1,
-0.2367299, 2.127423, -0.4072298, 0, 1, 0.5254902, 1,
-0.2366847, -1.227543, -2.997387, 0, 1, 0.5333334, 1,
-0.236225, 0.8483863, -0.01405966, 0, 1, 0.5372549, 1,
-0.235795, 0.5157639, 0.2698056, 0, 1, 0.5450981, 1,
-0.2353188, 0.1480022, 0.1225769, 0, 1, 0.5490196, 1,
-0.2317641, 2.080582, -0.2774031, 0, 1, 0.5568628, 1,
-0.2296365, -0.02600486, -2.791309, 0, 1, 0.5607843, 1,
-0.228784, -0.07332128, -1.3056, 0, 1, 0.5686275, 1,
-0.2246792, -1.13444, -3.289375, 0, 1, 0.572549, 1,
-0.2239138, 0.9725408, 0.1113838, 0, 1, 0.5803922, 1,
-0.2225118, -1.981534, -2.721165, 0, 1, 0.5843138, 1,
-0.2224323, 0.531458, -1.15421, 0, 1, 0.5921569, 1,
-0.2198438, 0.2542778, 0.1909903, 0, 1, 0.5960785, 1,
-0.2174999, -0.3755973, -3.759291, 0, 1, 0.6039216, 1,
-0.2142053, -0.07281607, -2.088879, 0, 1, 0.6117647, 1,
-0.2126823, -1.670162, -3.366916, 0, 1, 0.6156863, 1,
-0.2077811, -0.9209284, -4.396379, 0, 1, 0.6235294, 1,
-0.2070274, 0.8604726, -0.01181823, 0, 1, 0.627451, 1,
-0.2066248, 0.2166384, -1.166393, 0, 1, 0.6352941, 1,
-0.2049592, -0.5341072, -3.592473, 0, 1, 0.6392157, 1,
-0.2027115, -0.9010649, -3.176569, 0, 1, 0.6470588, 1,
-0.1983625, 0.6613769, -1.2238, 0, 1, 0.6509804, 1,
-0.1960002, 0.8024016, 0.219437, 0, 1, 0.6588235, 1,
-0.1943956, 0.5205789, 0.1209254, 0, 1, 0.6627451, 1,
-0.1856504, -0.253455, -1.653308, 0, 1, 0.6705883, 1,
-0.1832923, 0.6621771, -0.2476502, 0, 1, 0.6745098, 1,
-0.1808831, 1.758669, 0.01024012, 0, 1, 0.682353, 1,
-0.1783654, 0.9747745, 0.8152632, 0, 1, 0.6862745, 1,
-0.1720383, 1.615087, 1.196776, 0, 1, 0.6941177, 1,
-0.1713672, 0.08764821, -1.760711, 0, 1, 0.7019608, 1,
-0.1699607, -0.2690738, -2.591815, 0, 1, 0.7058824, 1,
-0.1697443, 0.07315375, -1.291054, 0, 1, 0.7137255, 1,
-0.168039, 1.552122, 0.2898483, 0, 1, 0.7176471, 1,
-0.1636185, -0.6453732, -3.463042, 0, 1, 0.7254902, 1,
-0.1621447, -1.900298, -3.582213, 0, 1, 0.7294118, 1,
-0.1607179, 0.6522884, 0.2609203, 0, 1, 0.7372549, 1,
-0.1478638, -1.920218, -3.533335, 0, 1, 0.7411765, 1,
-0.1444817, -0.6325168, -2.882436, 0, 1, 0.7490196, 1,
-0.1354787, -0.105016, -0.7485918, 0, 1, 0.7529412, 1,
-0.1317933, 1.032065, 0.2250592, 0, 1, 0.7607843, 1,
-0.1171583, -0.4601312, -1.124754, 0, 1, 0.7647059, 1,
-0.1146018, -0.5119641, -2.036027, 0, 1, 0.772549, 1,
-0.1135916, 0.2319236, -2.222571, 0, 1, 0.7764706, 1,
-0.1078871, -0.9699479, -1.736349, 0, 1, 0.7843137, 1,
-0.1063999, 0.752504, 0.3453399, 0, 1, 0.7882353, 1,
-0.1005099, 0.1245452, -1.047301, 0, 1, 0.7960784, 1,
-0.09485955, -0.1770936, -1.531413, 0, 1, 0.8039216, 1,
-0.09455889, -0.9740722, -2.401057, 0, 1, 0.8078431, 1,
-0.09185939, 0.2376686, 0.6623805, 0, 1, 0.8156863, 1,
-0.09057672, 0.1503797, -0.7294827, 0, 1, 0.8196079, 1,
-0.08713313, -0.1696896, -1.979928, 0, 1, 0.827451, 1,
-0.08645099, 0.04327752, -1.962243, 0, 1, 0.8313726, 1,
-0.08521366, -1.423703, -2.970087, 0, 1, 0.8392157, 1,
-0.08387984, -2.516922, -1.350604, 0, 1, 0.8431373, 1,
-0.07928521, -1.891496, -2.701516, 0, 1, 0.8509804, 1,
-0.07881555, 0.5239519, -0.6003174, 0, 1, 0.854902, 1,
-0.07743191, -1.053984, -2.442157, 0, 1, 0.8627451, 1,
-0.07710109, -0.02638618, -1.084734, 0, 1, 0.8666667, 1,
-0.06552123, -0.3435275, -1.440149, 0, 1, 0.8745098, 1,
-0.06498536, -0.2959707, -2.964586, 0, 1, 0.8784314, 1,
-0.06099515, -0.7472068, -2.974763, 0, 1, 0.8862745, 1,
-0.05883056, -0.06865011, -2.108845, 0, 1, 0.8901961, 1,
-0.05540526, 0.3407044, -1.030892, 0, 1, 0.8980392, 1,
-0.05277189, -1.045099, -2.711075, 0, 1, 0.9058824, 1,
-0.0516885, 0.8262693, 2.079601, 0, 1, 0.9098039, 1,
-0.0508193, 0.2033056, -1.632564, 0, 1, 0.9176471, 1,
-0.05057139, 0.9082662, 0.9965134, 0, 1, 0.9215686, 1,
-0.04943143, 0.7790034, 1.466797, 0, 1, 0.9294118, 1,
-0.04809842, -0.0007013731, 0.3839886, 0, 1, 0.9333333, 1,
-0.04715019, 1.481356, 1.056073, 0, 1, 0.9411765, 1,
-0.04468614, -1.001418, -2.530948, 0, 1, 0.945098, 1,
-0.04432844, 1.315256, 0.3520163, 0, 1, 0.9529412, 1,
-0.0382226, -1.615281, -3.997343, 0, 1, 0.9568627, 1,
-0.03618571, -0.4693712, -4.57742, 0, 1, 0.9647059, 1,
-0.02418088, 0.2164612, 0.3686033, 0, 1, 0.9686275, 1,
-0.002027078, -0.3017102, -5.022829, 0, 1, 0.9764706, 1,
-0.001402715, -0.4768081, -3.663928, 0, 1, 0.9803922, 1,
-0.0001984598, -1.442542, -4.063113, 0, 1, 0.9882353, 1,
0.001842512, -0.1622766, 3.108133, 0, 1, 0.9921569, 1,
0.004191244, 0.5787327, -0.3985546, 0, 1, 1, 1,
0.005238554, -2.39729, 3.83761, 0, 0.9921569, 1, 1,
0.01324652, 0.2621025, -1.634023, 0, 0.9882353, 1, 1,
0.0165564, -0.349571, 4.574833, 0, 0.9803922, 1, 1,
0.02115979, 1.008087, -0.3564905, 0, 0.9764706, 1, 1,
0.02285046, -0.3836449, 3.466895, 0, 0.9686275, 1, 1,
0.02457488, 1.041651, -0.7161726, 0, 0.9647059, 1, 1,
0.02538495, 0.2485665, 0.3165697, 0, 0.9568627, 1, 1,
0.02589448, 1.790124, -0.2807204, 0, 0.9529412, 1, 1,
0.02732064, 0.3328405, 0.4926188, 0, 0.945098, 1, 1,
0.0324868, -0.65983, 2.364819, 0, 0.9411765, 1, 1,
0.04121846, -0.04474676, 2.709947, 0, 0.9333333, 1, 1,
0.04127881, -0.4827593, 2.696512, 0, 0.9294118, 1, 1,
0.04720056, 0.7932984, -0.3081547, 0, 0.9215686, 1, 1,
0.0534138, -0.5858253, 4.266692, 0, 0.9176471, 1, 1,
0.05519431, 0.7523623, -1.197116, 0, 0.9098039, 1, 1,
0.05531759, 0.6103798, -0.1274275, 0, 0.9058824, 1, 1,
0.05670206, -0.1877294, 1.582515, 0, 0.8980392, 1, 1,
0.05920144, -2.190059, 2.638236, 0, 0.8901961, 1, 1,
0.06009101, -0.8768982, 2.251916, 0, 0.8862745, 1, 1,
0.06074537, 1.467795, -1.863934, 0, 0.8784314, 1, 1,
0.06112077, -0.4923801, 3.332067, 0, 0.8745098, 1, 1,
0.06689224, -0.4097936, 5.070913, 0, 0.8666667, 1, 1,
0.06711605, -1.457428, 1.817643, 0, 0.8627451, 1, 1,
0.0686098, -0.3338766, 4.206409, 0, 0.854902, 1, 1,
0.07642898, -1.516826, 2.968482, 0, 0.8509804, 1, 1,
0.07824747, 1.185349, -0.8154957, 0, 0.8431373, 1, 1,
0.08081988, -0.3381503, 3.911729, 0, 0.8392157, 1, 1,
0.08268125, -0.3490546, 3.560702, 0, 0.8313726, 1, 1,
0.08403121, 0.4310907, -0.5481058, 0, 0.827451, 1, 1,
0.0852506, -1.804511, 2.151708, 0, 0.8196079, 1, 1,
0.09283058, 0.4529104, -0.3339244, 0, 0.8156863, 1, 1,
0.09508301, -0.6273484, 3.590839, 0, 0.8078431, 1, 1,
0.09523066, 0.6215416, -1.803859, 0, 0.8039216, 1, 1,
0.09526219, -0.4316258, 3.44081, 0, 0.7960784, 1, 1,
0.09576093, 0.872373, -0.2638342, 0, 0.7882353, 1, 1,
0.09693013, -0.09543572, 2.746073, 0, 0.7843137, 1, 1,
0.1001627, 0.7335283, -0.3781939, 0, 0.7764706, 1, 1,
0.1080224, -0.2397676, 2.888492, 0, 0.772549, 1, 1,
0.108583, 1.416725, 0.5242819, 0, 0.7647059, 1, 1,
0.1086785, 0.2387625, 0.034186, 0, 0.7607843, 1, 1,
0.1103405, -0.9672258, 1.292324, 0, 0.7529412, 1, 1,
0.1126355, -1.954988, 1.523152, 0, 0.7490196, 1, 1,
0.1126864, -0.6933385, 2.407554, 0, 0.7411765, 1, 1,
0.1180297, -1.406261, 3.1982, 0, 0.7372549, 1, 1,
0.1207088, -0.09642443, 2.645722, 0, 0.7294118, 1, 1,
0.1233555, -1.180291, 3.844439, 0, 0.7254902, 1, 1,
0.1243911, 0.9252136, 0.8069438, 0, 0.7176471, 1, 1,
0.1250507, 0.2544682, 3.067726, 0, 0.7137255, 1, 1,
0.127054, 0.0704606, 1.635335, 0, 0.7058824, 1, 1,
0.1298723, 2.31482, -2.340889, 0, 0.6980392, 1, 1,
0.1364074, 0.9024864, 0.1077878, 0, 0.6941177, 1, 1,
0.1378381, -0.06499729, 1.944961, 0, 0.6862745, 1, 1,
0.1444458, 0.3886397, 2.608895, 0, 0.682353, 1, 1,
0.1463878, 1.23913, 1.104392, 0, 0.6745098, 1, 1,
0.1496443, -1.132732, 1.153947, 0, 0.6705883, 1, 1,
0.1524567, 0.1675174, 1.483253, 0, 0.6627451, 1, 1,
0.1542469, -0.1635265, 1.587732, 0, 0.6588235, 1, 1,
0.1545445, 1.236166, 0.9095472, 0, 0.6509804, 1, 1,
0.1604862, 1.786396, -1.090134, 0, 0.6470588, 1, 1,
0.1636863, 0.9576768, -0.3218873, 0, 0.6392157, 1, 1,
0.1652103, 0.3284242, 0.05683251, 0, 0.6352941, 1, 1,
0.1659043, 2.296902, 0.7068668, 0, 0.627451, 1, 1,
0.1664456, 0.8992535, 0.8333737, 0, 0.6235294, 1, 1,
0.1668536, -0.7113206, 1.893009, 0, 0.6156863, 1, 1,
0.1680402, 1.494458, 0.5241421, 0, 0.6117647, 1, 1,
0.16919, 0.2291669, 2.709063, 0, 0.6039216, 1, 1,
0.1710231, 0.987646, 0.1875325, 0, 0.5960785, 1, 1,
0.1713589, -0.00926936, 0.1251179, 0, 0.5921569, 1, 1,
0.1727193, -2.180526, 4.736058, 0, 0.5843138, 1, 1,
0.1775604, 0.5612297, 1.158277, 0, 0.5803922, 1, 1,
0.1788218, -0.2978501, 4.293115, 0, 0.572549, 1, 1,
0.1808002, 0.388534, 0.6939029, 0, 0.5686275, 1, 1,
0.1810991, -0.6368696, 2.445101, 0, 0.5607843, 1, 1,
0.1874669, 0.001723513, 3.016727, 0, 0.5568628, 1, 1,
0.193439, -0.5943179, 4.05266, 0, 0.5490196, 1, 1,
0.1936887, -0.7608579, 4.639521, 0, 0.5450981, 1, 1,
0.1954967, 1.59951, -1.389402, 0, 0.5372549, 1, 1,
0.1965351, -0.1253282, 2.145065, 0, 0.5333334, 1, 1,
0.1988579, 0.7131149, -0.1868786, 0, 0.5254902, 1, 1,
0.2000054, -0.3582983, 2.489222, 0, 0.5215687, 1, 1,
0.2025212, -0.5649249, 3.756069, 0, 0.5137255, 1, 1,
0.2032024, 0.990307, -0.4940092, 0, 0.509804, 1, 1,
0.2038467, -1.459222, 2.665757, 0, 0.5019608, 1, 1,
0.207596, 0.3632363, -0.7507154, 0, 0.4941176, 1, 1,
0.2092979, -1.237411, 0.5599945, 0, 0.4901961, 1, 1,
0.2110078, -0.01493894, 2.144169, 0, 0.4823529, 1, 1,
0.2115495, 1.105983, 1.148391, 0, 0.4784314, 1, 1,
0.2147827, 2.143931, -1.048577, 0, 0.4705882, 1, 1,
0.2204148, 0.1087332, -1.081559, 0, 0.4666667, 1, 1,
0.2204548, 1.558035, -0.4583488, 0, 0.4588235, 1, 1,
0.2220125, 0.5178773, 0.046921, 0, 0.454902, 1, 1,
0.2229308, 0.9526223, -1.305552, 0, 0.4470588, 1, 1,
0.2251054, -0.2511846, 2.251451, 0, 0.4431373, 1, 1,
0.2270652, -1.023865, 2.592833, 0, 0.4352941, 1, 1,
0.2283117, 0.02313098, -0.5327251, 0, 0.4313726, 1, 1,
0.2295952, -0.9507861, 3.502295, 0, 0.4235294, 1, 1,
0.2312294, -2.430392, 3.079864, 0, 0.4196078, 1, 1,
0.2326694, -0.2897377, 3.007433, 0, 0.4117647, 1, 1,
0.2333163, -0.6277786, 1.689667, 0, 0.4078431, 1, 1,
0.2344352, 0.09398613, 0.5273604, 0, 0.4, 1, 1,
0.2350219, 1.552445, -0.3653142, 0, 0.3921569, 1, 1,
0.2356189, 0.7417123, 0.9001664, 0, 0.3882353, 1, 1,
0.2382454, 0.4331284, 0.7200493, 0, 0.3803922, 1, 1,
0.2387875, 1.209013, -1.218271, 0, 0.3764706, 1, 1,
0.2389068, -2.575086, 2.377814, 0, 0.3686275, 1, 1,
0.2404897, -0.570116, 2.767977, 0, 0.3647059, 1, 1,
0.2411918, -0.4900454, 2.09376, 0, 0.3568628, 1, 1,
0.2421764, 1.566576, 0.505729, 0, 0.3529412, 1, 1,
0.2440718, -0.1700997, 1.507483, 0, 0.345098, 1, 1,
0.245555, -1.87443, 2.626487, 0, 0.3411765, 1, 1,
0.2610607, 1.140347, -0.5355818, 0, 0.3333333, 1, 1,
0.2612341, 0.5631397, -0.7056775, 0, 0.3294118, 1, 1,
0.2642577, -0.6128153, 2.018468, 0, 0.3215686, 1, 1,
0.2662369, -0.72899, 2.765372, 0, 0.3176471, 1, 1,
0.2692461, -0.156621, 1.325787, 0, 0.3098039, 1, 1,
0.2724563, 0.2779754, 2.999793, 0, 0.3058824, 1, 1,
0.275768, -0.1764519, 2.837103, 0, 0.2980392, 1, 1,
0.2803434, 0.3472302, -0.4345289, 0, 0.2901961, 1, 1,
0.2821957, -2.038388, 3.813574, 0, 0.2862745, 1, 1,
0.2866639, 1.509832, 2.463296, 0, 0.2784314, 1, 1,
0.2918092, -0.627477, 1.932738, 0, 0.2745098, 1, 1,
0.2953293, -0.2078659, 1.958162, 0, 0.2666667, 1, 1,
0.2967311, 1.045589, 1.087645, 0, 0.2627451, 1, 1,
0.2979735, -0.4144321, 2.678538, 0, 0.254902, 1, 1,
0.3046743, 1.723295, 2.23675, 0, 0.2509804, 1, 1,
0.3100375, 1.615278, 1.376112, 0, 0.2431373, 1, 1,
0.3165478, 1.206899, -1.287707, 0, 0.2392157, 1, 1,
0.316624, -0.3933023, 2.142987, 0, 0.2313726, 1, 1,
0.3200415, 0.7758036, -0.5036767, 0, 0.227451, 1, 1,
0.3201183, -0.983063, 1.772653, 0, 0.2196078, 1, 1,
0.3210081, 0.5217998, -0.6477144, 0, 0.2156863, 1, 1,
0.3221858, -0.9929608, 1.040798, 0, 0.2078431, 1, 1,
0.3245178, -0.1579931, 0.4453954, 0, 0.2039216, 1, 1,
0.3298487, -0.1454674, 2.231731, 0, 0.1960784, 1, 1,
0.3309598, -0.183578, 2.927937, 0, 0.1882353, 1, 1,
0.3321201, 0.3731066, 2.574832, 0, 0.1843137, 1, 1,
0.3355528, -1.397921, 3.773216, 0, 0.1764706, 1, 1,
0.3378588, 0.4250028, -0.044935, 0, 0.172549, 1, 1,
0.3392141, -1.291241, 3.13352, 0, 0.1647059, 1, 1,
0.3400005, 0.1171501, 0.2569908, 0, 0.1607843, 1, 1,
0.3410495, -2.303975, 3.813427, 0, 0.1529412, 1, 1,
0.3437861, -0.2592913, 3.151339, 0, 0.1490196, 1, 1,
0.3512315, -0.01738824, 2.626334, 0, 0.1411765, 1, 1,
0.351951, -0.3311456, 1.437491, 0, 0.1372549, 1, 1,
0.3520499, 0.6240389, 1.797222, 0, 0.1294118, 1, 1,
0.3546236, -1.013028, 3.439999, 0, 0.1254902, 1, 1,
0.3575773, 0.4520104, 1.785984, 0, 0.1176471, 1, 1,
0.3601618, 0.4177719, 1.216362, 0, 0.1137255, 1, 1,
0.3607864, -0.4332678, 3.717085, 0, 0.1058824, 1, 1,
0.365693, 1.811386, 0.518029, 0, 0.09803922, 1, 1,
0.3658797, 0.862602, 0.06096656, 0, 0.09411765, 1, 1,
0.3659825, 0.8334109, 1.561802, 0, 0.08627451, 1, 1,
0.3671316, 0.8976764, -0.5379343, 0, 0.08235294, 1, 1,
0.3691804, -0.5087904, 2.243593, 0, 0.07450981, 1, 1,
0.3694545, -0.8326185, 1.927755, 0, 0.07058824, 1, 1,
0.3712332, 0.7706754, 0.6179616, 0, 0.0627451, 1, 1,
0.37609, 0.5757211, 0.697152, 0, 0.05882353, 1, 1,
0.3846123, 0.8606661, 0.9625322, 0, 0.05098039, 1, 1,
0.3895065, 1.314113, 0.6053874, 0, 0.04705882, 1, 1,
0.3921457, -1.418409, 3.178981, 0, 0.03921569, 1, 1,
0.393792, -0.7160468, 4.745274, 0, 0.03529412, 1, 1,
0.4026254, 1.529703, 0.8965722, 0, 0.02745098, 1, 1,
0.4052114, -1.707641, 1.894608, 0, 0.02352941, 1, 1,
0.405231, 2.016162, -0.6928242, 0, 0.01568628, 1, 1,
0.4059594, 0.9923196, -1.787641, 0, 0.01176471, 1, 1,
0.4104489, -0.4952144, 0.9251584, 0, 0.003921569, 1, 1,
0.412481, 0.3237789, 2.898028, 0.003921569, 0, 1, 1,
0.4133327, -1.071221, 0.690565, 0.007843138, 0, 1, 1,
0.4147255, 0.3993162, 0.3929864, 0.01568628, 0, 1, 1,
0.4183437, -0.2852156, 1.720722, 0.01960784, 0, 1, 1,
0.4206185, -0.1330556, 3.365167, 0.02745098, 0, 1, 1,
0.4274734, 0.4745821, -0.6937723, 0.03137255, 0, 1, 1,
0.4298341, 0.4868963, -0.1294624, 0.03921569, 0, 1, 1,
0.4416279, -0.9040368, 1.395476, 0.04313726, 0, 1, 1,
0.4420294, 0.4632795, -0.4173687, 0.05098039, 0, 1, 1,
0.4422574, -1.015919, 2.261194, 0.05490196, 0, 1, 1,
0.4432329, 1.764166, -0.2504124, 0.0627451, 0, 1, 1,
0.446733, 1.16032, 0.4897166, 0.06666667, 0, 1, 1,
0.4591045, 1.855514, -1.230153, 0.07450981, 0, 1, 1,
0.4601297, 0.6190938, 1.363068, 0.07843138, 0, 1, 1,
0.4628065, 1.21654, 2.585719, 0.08627451, 0, 1, 1,
0.4718744, -0.1380572, 1.879344, 0.09019608, 0, 1, 1,
0.4725253, 0.7413262, 1.78552, 0.09803922, 0, 1, 1,
0.4738916, -0.4512307, 0.274492, 0.1058824, 0, 1, 1,
0.4877649, 0.7635556, 0.2688195, 0.1098039, 0, 1, 1,
0.4901553, 0.8933795, -0.08803052, 0.1176471, 0, 1, 1,
0.4910528, -0.0549694, 0.4809114, 0.1215686, 0, 1, 1,
0.4956458, -0.4823089, 3.379845, 0.1294118, 0, 1, 1,
0.4979331, 0.3299201, 0.8679204, 0.1333333, 0, 1, 1,
0.5022434, -0.9357511, -1.181778, 0.1411765, 0, 1, 1,
0.506146, 0.146054, 1.967252, 0.145098, 0, 1, 1,
0.5074106, -1.275138, 3.237379, 0.1529412, 0, 1, 1,
0.507951, -0.1761991, 1.969292, 0.1568628, 0, 1, 1,
0.5107194, -1.593428, 1.169752, 0.1647059, 0, 1, 1,
0.514514, 0.3864851, 2.241342, 0.1686275, 0, 1, 1,
0.5159183, -0.8275865, 2.839365, 0.1764706, 0, 1, 1,
0.5227605, -0.1352129, 1.812289, 0.1803922, 0, 1, 1,
0.52295, 1.0422, -0.03768825, 0.1882353, 0, 1, 1,
0.523318, -1.061121, 3.333202, 0.1921569, 0, 1, 1,
0.5245196, 1.020899, 0.7019033, 0.2, 0, 1, 1,
0.5262178, -1.121681, 0.7951803, 0.2078431, 0, 1, 1,
0.527637, 0.4099463, -0.4744672, 0.2117647, 0, 1, 1,
0.5357138, -0.02104077, 2.303352, 0.2196078, 0, 1, 1,
0.5388045, 1.190077, -0.7121482, 0.2235294, 0, 1, 1,
0.5438328, 0.07475644, 0.4320019, 0.2313726, 0, 1, 1,
0.5455865, 1.346903, -0.04438564, 0.2352941, 0, 1, 1,
0.5466574, 0.04948542, 1.713339, 0.2431373, 0, 1, 1,
0.5506673, -0.2442923, 3.27618, 0.2470588, 0, 1, 1,
0.5512318, -1.098404, 2.783195, 0.254902, 0, 1, 1,
0.5530003, -0.1115072, 3.339881, 0.2588235, 0, 1, 1,
0.565823, -0.3635254, 2.423709, 0.2666667, 0, 1, 1,
0.5697171, 1.73984, -0.6141423, 0.2705882, 0, 1, 1,
0.5701795, 0.3902908, -0.1484139, 0.2784314, 0, 1, 1,
0.5707287, 1.063817, -0.133753, 0.282353, 0, 1, 1,
0.5770612, -1.153893, 1.378953, 0.2901961, 0, 1, 1,
0.579239, -0.2677077, 1.400737, 0.2941177, 0, 1, 1,
0.5869524, -1.350919, 1.486717, 0.3019608, 0, 1, 1,
0.5924381, -1.506719, 3.173884, 0.3098039, 0, 1, 1,
0.6020041, -1.378747, 1.652719, 0.3137255, 0, 1, 1,
0.6057958, 0.1294124, 3.351266, 0.3215686, 0, 1, 1,
0.6070083, 0.4104143, 0.6979957, 0.3254902, 0, 1, 1,
0.6098799, 0.1199512, -0.5255496, 0.3333333, 0, 1, 1,
0.6118743, 0.3201131, 0.7053969, 0.3372549, 0, 1, 1,
0.6186087, 0.1786737, 1.968361, 0.345098, 0, 1, 1,
0.621441, -0.1711163, 2.209274, 0.3490196, 0, 1, 1,
0.6215532, -0.01792186, 2.347441, 0.3568628, 0, 1, 1,
0.6215694, 1.330733, 0.4754331, 0.3607843, 0, 1, 1,
0.6226841, 0.9744378, 0.3416656, 0.3686275, 0, 1, 1,
0.6296077, -0.4428658, 1.775832, 0.372549, 0, 1, 1,
0.6301817, -1.090646, 1.756227, 0.3803922, 0, 1, 1,
0.6314469, 1.563454, -0.389971, 0.3843137, 0, 1, 1,
0.6320776, -1.115484, 3.300247, 0.3921569, 0, 1, 1,
0.636166, 0.05505534, 0.8373574, 0.3960784, 0, 1, 1,
0.6412653, 2.059819, 1.004466, 0.4039216, 0, 1, 1,
0.6412771, 1.363362, -0.1031967, 0.4117647, 0, 1, 1,
0.6416457, -0.3880466, 1.377539, 0.4156863, 0, 1, 1,
0.6433049, -1.096156, 1.583327, 0.4235294, 0, 1, 1,
0.6433322, -0.8600091, 0.6635785, 0.427451, 0, 1, 1,
0.6442112, -0.5481912, 1.630664, 0.4352941, 0, 1, 1,
0.647048, -1.866346, 2.780518, 0.4392157, 0, 1, 1,
0.6484097, -0.1605521, 1.596788, 0.4470588, 0, 1, 1,
0.6503246, 1.579947, -0.06728209, 0.4509804, 0, 1, 1,
0.6561842, -0.8475888, 3.098528, 0.4588235, 0, 1, 1,
0.6575584, 1.146739, 0.4293476, 0.4627451, 0, 1, 1,
0.6609728, 0.523856, -0.6419011, 0.4705882, 0, 1, 1,
0.6611725, 1.081794, 0.8908022, 0.4745098, 0, 1, 1,
0.6656799, 0.4048234, 1.231922, 0.4823529, 0, 1, 1,
0.6730484, -0.3756405, 4.426022, 0.4862745, 0, 1, 1,
0.675617, -0.3583935, 3.561508, 0.4941176, 0, 1, 1,
0.689805, -0.2360054, 0.3831303, 0.5019608, 0, 1, 1,
0.6902565, 0.7786775, 1.718455, 0.5058824, 0, 1, 1,
0.697062, 1.374193, -1.569126, 0.5137255, 0, 1, 1,
0.7049897, -0.816148, 2.118837, 0.5176471, 0, 1, 1,
0.711189, 1.092557, 1.006338, 0.5254902, 0, 1, 1,
0.7136298, -0.01855496, 0.8315174, 0.5294118, 0, 1, 1,
0.7205309, -0.6477395, 2.704702, 0.5372549, 0, 1, 1,
0.7249997, -0.417014, 2.076453, 0.5411765, 0, 1, 1,
0.7276967, 0.3253933, 0.6172696, 0.5490196, 0, 1, 1,
0.7316695, -0.1690448, 2.543625, 0.5529412, 0, 1, 1,
0.7339244, -1.125684, 3.551006, 0.5607843, 0, 1, 1,
0.7387807, -0.6074069, 0.3914841, 0.5647059, 0, 1, 1,
0.7431124, 0.3304998, 0.4262506, 0.572549, 0, 1, 1,
0.7453154, 0.4670722, 1.984679, 0.5764706, 0, 1, 1,
0.7490541, -0.04373716, 2.555427, 0.5843138, 0, 1, 1,
0.7501913, 0.4256899, -0.1430687, 0.5882353, 0, 1, 1,
0.7502033, 0.9535292, 2.184448, 0.5960785, 0, 1, 1,
0.7502164, -0.1501267, 0.4060326, 0.6039216, 0, 1, 1,
0.7549184, 0.6893619, 1.612535, 0.6078432, 0, 1, 1,
0.7558519, -0.5625491, 2.136681, 0.6156863, 0, 1, 1,
0.759302, 0.02135928, 1.634091, 0.6196079, 0, 1, 1,
0.7640719, 1.217533, -1.421724, 0.627451, 0, 1, 1,
0.7645167, 1.041691, 0.8312054, 0.6313726, 0, 1, 1,
0.7650524, -0.7049814, 2.576105, 0.6392157, 0, 1, 1,
0.766629, 0.3009766, 0.253347, 0.6431373, 0, 1, 1,
0.77265, 0.5473331, 2.439063, 0.6509804, 0, 1, 1,
0.7736011, -2.236164, 4.167069, 0.654902, 0, 1, 1,
0.7783816, 0.2407827, 0.9831034, 0.6627451, 0, 1, 1,
0.7825722, -0.1242552, 2.506674, 0.6666667, 0, 1, 1,
0.7853481, 0.6050102, 0.9962723, 0.6745098, 0, 1, 1,
0.7875648, -0.9218485, 1.491821, 0.6784314, 0, 1, 1,
0.7877102, -0.05682718, 1.998556, 0.6862745, 0, 1, 1,
0.7937483, 0.3773383, -1.014982, 0.6901961, 0, 1, 1,
0.8026812, -0.7306139, 1.970059, 0.6980392, 0, 1, 1,
0.8054077, 0.4818982, -1.059082, 0.7058824, 0, 1, 1,
0.8066351, 0.5651221, 0.9533159, 0.7098039, 0, 1, 1,
0.8101227, -0.208587, 1.461412, 0.7176471, 0, 1, 1,
0.810879, -1.108911, 4.378162, 0.7215686, 0, 1, 1,
0.811779, -0.204704, 2.170174, 0.7294118, 0, 1, 1,
0.8162758, 0.6605456, 1.855876, 0.7333333, 0, 1, 1,
0.8219424, 0.07495296, 1.003327, 0.7411765, 0, 1, 1,
0.8228498, 2.197607, 0.02489807, 0.7450981, 0, 1, 1,
0.8263658, -1.723039, 2.394685, 0.7529412, 0, 1, 1,
0.8309751, 1.931806, 0.2493655, 0.7568628, 0, 1, 1,
0.8342274, 0.2191978, 1.499549, 0.7647059, 0, 1, 1,
0.8359344, -0.6814032, 2.392342, 0.7686275, 0, 1, 1,
0.8394604, -0.591517, 1.463499, 0.7764706, 0, 1, 1,
0.843105, -1.466329, 3.715375, 0.7803922, 0, 1, 1,
0.8459901, -1.438399, 0.8957882, 0.7882353, 0, 1, 1,
0.8506014, -0.04654247, 2.136982, 0.7921569, 0, 1, 1,
0.8515934, 0.3284198, 0.9523548, 0.8, 0, 1, 1,
0.853397, -1.927662, 2.568543, 0.8078431, 0, 1, 1,
0.8550355, 1.331829, 0.5570681, 0.8117647, 0, 1, 1,
0.8639127, 0.8277836, 0.2719077, 0.8196079, 0, 1, 1,
0.8658952, -0.3784165, 2.254611, 0.8235294, 0, 1, 1,
0.8688682, 3.171859, 0.6747005, 0.8313726, 0, 1, 1,
0.8729403, -1.037964, 1.587344, 0.8352941, 0, 1, 1,
0.87483, 0.4194838, 1.159886, 0.8431373, 0, 1, 1,
0.8756288, 0.3597807, 0.9710566, 0.8470588, 0, 1, 1,
0.8809653, -0.8585981, 1.530618, 0.854902, 0, 1, 1,
0.8847148, 1.727718, 1.530954, 0.8588235, 0, 1, 1,
0.8886882, 0.5072432, -0.9249266, 0.8666667, 0, 1, 1,
0.8897331, -0.5622241, 0.8979051, 0.8705882, 0, 1, 1,
0.8962531, 1.363956, -0.1765325, 0.8784314, 0, 1, 1,
0.90024, -0.8132378, 1.334185, 0.8823529, 0, 1, 1,
0.903067, 2.619283, 0.8605672, 0.8901961, 0, 1, 1,
0.9048226, 0.9520884, 0.6967836, 0.8941177, 0, 1, 1,
0.9121279, 0.02738415, -0.5560267, 0.9019608, 0, 1, 1,
0.9146549, -0.2011953, 0.8038015, 0.9098039, 0, 1, 1,
0.9151381, 2.303472, 0.890999, 0.9137255, 0, 1, 1,
0.9170565, 0.3470708, 3.343745, 0.9215686, 0, 1, 1,
0.9267417, 1.846021, -0.2474829, 0.9254902, 0, 1, 1,
0.9303992, -1.523789, 1.061046, 0.9333333, 0, 1, 1,
0.9332864, -0.779705, 1.464483, 0.9372549, 0, 1, 1,
0.9379725, 0.2126403, 1.123281, 0.945098, 0, 1, 1,
0.9383793, 0.3063471, 2.724486, 0.9490196, 0, 1, 1,
0.9452279, 0.3823528, 1.187026, 0.9568627, 0, 1, 1,
0.9471259, -1.630591, 5.070417, 0.9607843, 0, 1, 1,
0.9497148, -2.291737, 2.699224, 0.9686275, 0, 1, 1,
0.95996, -0.3940528, 2.060599, 0.972549, 0, 1, 1,
0.9709056, 1.073459, 1.49728, 0.9803922, 0, 1, 1,
0.9737344, -1.232891, 1.948813, 0.9843137, 0, 1, 1,
0.9756381, 0.03697096, 2.391061, 0.9921569, 0, 1, 1,
0.9997649, -0.6832318, 3.027551, 0.9960784, 0, 1, 1,
1.000377, 0.1396647, 3.174772, 1, 0, 0.9960784, 1,
1.001125, 0.8247003, -0.4027119, 1, 0, 0.9882353, 1,
1.004084, 0.148383, 0.9344164, 1, 0, 0.9843137, 1,
1.008531, 0.5496994, 1.849728, 1, 0, 0.9764706, 1,
1.010522, 0.8884062, 2.209195, 1, 0, 0.972549, 1,
1.012782, 2.671968, 0.1552491, 1, 0, 0.9647059, 1,
1.020709, -0.008538708, 1.633535, 1, 0, 0.9607843, 1,
1.021588, 2.187964, 0.6640348, 1, 0, 0.9529412, 1,
1.028826, -0.2087879, 0.4138689, 1, 0, 0.9490196, 1,
1.030511, 0.4388778, 1.844364, 1, 0, 0.9411765, 1,
1.032509, 1.318508, 0.570769, 1, 0, 0.9372549, 1,
1.032619, 0.8861476, 0.9531347, 1, 0, 0.9294118, 1,
1.035962, -0.6316645, 4.072194, 1, 0, 0.9254902, 1,
1.036839, -1.290903, 1.087827, 1, 0, 0.9176471, 1,
1.039195, -0.6815575, 3.241703, 1, 0, 0.9137255, 1,
1.040295, 0.5211187, 1.53441, 1, 0, 0.9058824, 1,
1.043829, -0.6689847, 2.335712, 1, 0, 0.9019608, 1,
1.048661, -1.75122, 2.610691, 1, 0, 0.8941177, 1,
1.049818, 0.3555833, -0.2395862, 1, 0, 0.8862745, 1,
1.054727, 0.7636832, 2.307428, 1, 0, 0.8823529, 1,
1.058689, 1.341665, 0.9709936, 1, 0, 0.8745098, 1,
1.06162, -0.5475978, 2.870138, 1, 0, 0.8705882, 1,
1.073883, -1.499058, 3.862583, 1, 0, 0.8627451, 1,
1.073949, 0.4642299, 0.9095642, 1, 0, 0.8588235, 1,
1.074874, 0.8309548, 2.353758, 1, 0, 0.8509804, 1,
1.081429, 1.089624, -0.04730291, 1, 0, 0.8470588, 1,
1.086842, -0.533001, 0.9951637, 1, 0, 0.8392157, 1,
1.097936, 0.2354291, 0.7366116, 1, 0, 0.8352941, 1,
1.099631, 0.5368043, 1.13644, 1, 0, 0.827451, 1,
1.102696, -0.5005117, 0.8068438, 1, 0, 0.8235294, 1,
1.107733, -1.822511, 2.057275, 1, 0, 0.8156863, 1,
1.115146, -1.899943, 2.508519, 1, 0, 0.8117647, 1,
1.117376, 0.9789349, 0.3882383, 1, 0, 0.8039216, 1,
1.121923, 0.1136375, 2.306004, 1, 0, 0.7960784, 1,
1.125402, -0.5674737, 2.765212, 1, 0, 0.7921569, 1,
1.12612, 0.6733871, 0.9225978, 1, 0, 0.7843137, 1,
1.126734, -0.970803, 1.26921, 1, 0, 0.7803922, 1,
1.136655, -0.3384924, 1.156141, 1, 0, 0.772549, 1,
1.141336, 1.20548, 0.9092568, 1, 0, 0.7686275, 1,
1.14441, 2.071261, -0.3456922, 1, 0, 0.7607843, 1,
1.147251, 0.4203226, 1.785809, 1, 0, 0.7568628, 1,
1.148857, 1.628747, 1.628529, 1, 0, 0.7490196, 1,
1.152028, 0.06570065, 0.3647195, 1, 0, 0.7450981, 1,
1.152319, 0.02922404, 1.476718, 1, 0, 0.7372549, 1,
1.153385, 0.9730741, 2.896803, 1, 0, 0.7333333, 1,
1.157516, 0.265659, -0.02998437, 1, 0, 0.7254902, 1,
1.157623, -1.319879, 1.78559, 1, 0, 0.7215686, 1,
1.16103, 1.331968, -1.644016, 1, 0, 0.7137255, 1,
1.162989, -0.6829093, 2.122831, 1, 0, 0.7098039, 1,
1.163162, -0.04474996, 0.08306584, 1, 0, 0.7019608, 1,
1.164829, -0.5970311, 1.217288, 1, 0, 0.6941177, 1,
1.166994, 0.3867697, 1.31847, 1, 0, 0.6901961, 1,
1.176206, -0.6875923, 1.721057, 1, 0, 0.682353, 1,
1.186158, -0.5104304, 2.113626, 1, 0, 0.6784314, 1,
1.189724, 1.379521, -0.001193743, 1, 0, 0.6705883, 1,
1.191814, 1.566688, 0.2233926, 1, 0, 0.6666667, 1,
1.202563, -0.07661963, 0.7466041, 1, 0, 0.6588235, 1,
1.203775, -0.3189855, 2.367532, 1, 0, 0.654902, 1,
1.206125, -1.794505, 1.524126, 1, 0, 0.6470588, 1,
1.207651, -0.005855156, 0.4692097, 1, 0, 0.6431373, 1,
1.213008, -1.039085, 3.603865, 1, 0, 0.6352941, 1,
1.222107, 0.8598974, 0.4208328, 1, 0, 0.6313726, 1,
1.226096, 0.3945299, 0.4948798, 1, 0, 0.6235294, 1,
1.232148, -1.540506, 4.081664, 1, 0, 0.6196079, 1,
1.234294, 0.2005578, -0.3941812, 1, 0, 0.6117647, 1,
1.239435, -2.060935, 3.406926, 1, 0, 0.6078432, 1,
1.243924, -0.0957642, 2.671984, 1, 0, 0.6, 1,
1.246601, 1.350518, 2.140651, 1, 0, 0.5921569, 1,
1.252863, -1.116686, 0.7976505, 1, 0, 0.5882353, 1,
1.254107, 2.541458, 0.3750839, 1, 0, 0.5803922, 1,
1.257009, 1.432537, 0.04387093, 1, 0, 0.5764706, 1,
1.289043, 1.028903, 2.714912, 1, 0, 0.5686275, 1,
1.295872, -0.3217612, 0.7136219, 1, 0, 0.5647059, 1,
1.307824, 0.4020537, 0.563513, 1, 0, 0.5568628, 1,
1.316526, -0.1324527, 0.2302581, 1, 0, 0.5529412, 1,
1.320211, -0.5868962, 1.904858, 1, 0, 0.5450981, 1,
1.322789, 0.4999966, 3.274293, 1, 0, 0.5411765, 1,
1.324304, 2.139021, 1.050907, 1, 0, 0.5333334, 1,
1.331677, 0.3814333, 0.2614924, 1, 0, 0.5294118, 1,
1.33245, -2.370368, 2.442841, 1, 0, 0.5215687, 1,
1.332844, -0.7862868, 1.907662, 1, 0, 0.5176471, 1,
1.33583, -0.6902654, 1.707923, 1, 0, 0.509804, 1,
1.337121, -1.381553, 1.677073, 1, 0, 0.5058824, 1,
1.349745, 1.897142, 0.9775358, 1, 0, 0.4980392, 1,
1.352806, 0.1957757, 2.115191, 1, 0, 0.4901961, 1,
1.353338, -1.483336, 3.799207, 1, 0, 0.4862745, 1,
1.355413, -0.5896869, 3.3388, 1, 0, 0.4784314, 1,
1.37387, 0.187756, 1.353033, 1, 0, 0.4745098, 1,
1.379292, 0.8459548, 1.798506, 1, 0, 0.4666667, 1,
1.380022, 0.6544867, 0.2121354, 1, 0, 0.4627451, 1,
1.384163, -0.9546129, 0.2725258, 1, 0, 0.454902, 1,
1.394226, 0.6148742, -0.5753462, 1, 0, 0.4509804, 1,
1.396205, -0.4566158, 2.110271, 1, 0, 0.4431373, 1,
1.40385, -0.5095856, 1.843109, 1, 0, 0.4392157, 1,
1.415197, -0.9587718, 3.291885, 1, 0, 0.4313726, 1,
1.421395, 0.5788774, -1.088619, 1, 0, 0.427451, 1,
1.432307, 0.112409, 1.654667, 1, 0, 0.4196078, 1,
1.436398, 0.758447, 0.6793067, 1, 0, 0.4156863, 1,
1.454783, -0.1871794, 1.93716, 1, 0, 0.4078431, 1,
1.463828, -1.325095, 1.812739, 1, 0, 0.4039216, 1,
1.467113, -0.496198, 4.056252, 1, 0, 0.3960784, 1,
1.475233, 0.005808992, 1.803158, 1, 0, 0.3882353, 1,
1.484665, 1.446509, 0.09447982, 1, 0, 0.3843137, 1,
1.488062, -0.01809899, 2.153514, 1, 0, 0.3764706, 1,
1.489712, -2.572938, 1.322038, 1, 0, 0.372549, 1,
1.503672, 0.4574564, -0.3481185, 1, 0, 0.3647059, 1,
1.503854, -2.001959, 3.137596, 1, 0, 0.3607843, 1,
1.515656, 0.8837687, 1.487824, 1, 0, 0.3529412, 1,
1.520345, 1.036066, 0.7697283, 1, 0, 0.3490196, 1,
1.523788, 0.8702895, 1.549217, 1, 0, 0.3411765, 1,
1.524084, 0.4111744, 1.756031, 1, 0, 0.3372549, 1,
1.537033, 0.4801023, 0.8463815, 1, 0, 0.3294118, 1,
1.537859, 0.5647267, 0.783289, 1, 0, 0.3254902, 1,
1.555727, 0.190806, 1.293291, 1, 0, 0.3176471, 1,
1.559427, 0.2455007, 0.2854007, 1, 0, 0.3137255, 1,
1.570847, 1.063618, 2.148473, 1, 0, 0.3058824, 1,
1.57113, 1.164052, 0.5656769, 1, 0, 0.2980392, 1,
1.578587, 0.4845926, 0.8374473, 1, 0, 0.2941177, 1,
1.582689, 0.6994392, 1.388492, 1, 0, 0.2862745, 1,
1.595376, 0.3173444, -0.04973728, 1, 0, 0.282353, 1,
1.599781, 1.932234, 3.308191, 1, 0, 0.2745098, 1,
1.625288, 1.67267, 2.367366, 1, 0, 0.2705882, 1,
1.633785, -1.649157, 2.866658, 1, 0, 0.2627451, 1,
1.637514, -0.2826489, 2.444038, 1, 0, 0.2588235, 1,
1.644322, 0.1525855, 1.505522, 1, 0, 0.2509804, 1,
1.657354, -0.07343563, 0.2745056, 1, 0, 0.2470588, 1,
1.663654, 0.231326, 1.590265, 1, 0, 0.2392157, 1,
1.674379, -1.866093, 0.964216, 1, 0, 0.2352941, 1,
1.683855, 0.4825491, 0.5108466, 1, 0, 0.227451, 1,
1.686556, -1.568074, 1.47526, 1, 0, 0.2235294, 1,
1.697443, -0.3313735, 1.989867, 1, 0, 0.2156863, 1,
1.711677, 0.1077309, 1.71349, 1, 0, 0.2117647, 1,
1.714934, -0.9358475, 1.196563, 1, 0, 0.2039216, 1,
1.734594, -0.1657401, 2.637632, 1, 0, 0.1960784, 1,
1.747391, 0.5516189, 1.590572, 1, 0, 0.1921569, 1,
1.748948, -0.04804529, 1.560321, 1, 0, 0.1843137, 1,
1.772231, 0.6188973, 1.263966, 1, 0, 0.1803922, 1,
1.815703, -0.04923474, 1.116352, 1, 0, 0.172549, 1,
1.840866, 1.154471, 0.3103035, 1, 0, 0.1686275, 1,
1.855889, -0.9598044, 2.758238, 1, 0, 0.1607843, 1,
1.859004, -2.483077, 0.2916463, 1, 0, 0.1568628, 1,
1.885122, -2.302833, 2.140979, 1, 0, 0.1490196, 1,
1.920156, 0.3160503, 0.7691198, 1, 0, 0.145098, 1,
1.923757, -0.01890224, 2.46204, 1, 0, 0.1372549, 1,
1.942758, -0.7722184, 0.7730078, 1, 0, 0.1333333, 1,
1.943839, 2.018963, 2.225018, 1, 0, 0.1254902, 1,
1.953404, 1.006631, 2.089815, 1, 0, 0.1215686, 1,
1.996194, 1.08477, 0.9491075, 1, 0, 0.1137255, 1,
2.000021, -0.7099075, 1.828675, 1, 0, 0.1098039, 1,
2.012661, -0.1654277, 1.393721, 1, 0, 0.1019608, 1,
2.033944, 0.2551814, 0.9713659, 1, 0, 0.09411765, 1,
2.082597, -0.5224224, 3.088091, 1, 0, 0.09019608, 1,
2.085721, 0.8210517, 1.423971, 1, 0, 0.08235294, 1,
2.100573, -3.008998, 4.103298, 1, 0, 0.07843138, 1,
2.124685, 0.06000081, 2.375899, 1, 0, 0.07058824, 1,
2.153299, 0.5131125, 1.721422, 1, 0, 0.06666667, 1,
2.181592, 0.4793735, 2.053685, 1, 0, 0.05882353, 1,
2.226227, 0.175068, 2.300833, 1, 0, 0.05490196, 1,
2.232927, -0.44724, 2.837215, 1, 0, 0.04705882, 1,
2.302919, 1.831578, 1.356247, 1, 0, 0.04313726, 1,
2.303332, 0.4909042, 1.349991, 1, 0, 0.03529412, 1,
2.572935, 0.3854475, 0.62053, 1, 0, 0.03137255, 1,
2.629013, 0.281995, 0.4722188, 1, 0, 0.02352941, 1,
2.672413, -1.54459, 1.984519, 1, 0, 0.01960784, 1,
2.722165, 1.361909, 0.9978588, 1, 0, 0.01176471, 1,
3.895838, -0.4777064, 1.511385, 1, 0, 0.007843138, 1
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
0.1580677, -4.056653, -8.072022, 0, -0.5, 0.5, 0.5,
0.1580677, -4.056653, -8.072022, 1, -0.5, 0.5, 0.5,
0.1580677, -4.056653, -8.072022, 1, 1.5, 0.5, 0.5,
0.1580677, -4.056653, -8.072022, 0, 1.5, 0.5, 0.5
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
-4.846807, 0.08143067, -8.072022, 0, -0.5, 0.5, 0.5,
-4.846807, 0.08143067, -8.072022, 1, -0.5, 0.5, 0.5,
-4.846807, 0.08143067, -8.072022, 1, 1.5, 0.5, 0.5,
-4.846807, 0.08143067, -8.072022, 0, 1.5, 0.5, 0.5
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
-4.846807, -4.056653, -0.5481272, 0, -0.5, 0.5, 0.5,
-4.846807, -4.056653, -0.5481272, 1, -0.5, 0.5, 0.5,
-4.846807, -4.056653, -0.5481272, 1, 1.5, 0.5, 0.5,
-4.846807, -4.056653, -0.5481272, 0, 1.5, 0.5, 0.5
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
-2, -3.101711, -6.335739,
2, -3.101711, -6.335739,
-2, -3.101711, -6.335739,
-2, -3.260868, -6.62512,
0, -3.101711, -6.335739,
0, -3.260868, -6.62512,
2, -3.101711, -6.335739,
2, -3.260868, -6.62512
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
-2, -3.579182, -7.203881, 0, -0.5, 0.5, 0.5,
-2, -3.579182, -7.203881, 1, -0.5, 0.5, 0.5,
-2, -3.579182, -7.203881, 1, 1.5, 0.5, 0.5,
-2, -3.579182, -7.203881, 0, 1.5, 0.5, 0.5,
0, -3.579182, -7.203881, 0, -0.5, 0.5, 0.5,
0, -3.579182, -7.203881, 1, -0.5, 0.5, 0.5,
0, -3.579182, -7.203881, 1, 1.5, 0.5, 0.5,
0, -3.579182, -7.203881, 0, 1.5, 0.5, 0.5,
2, -3.579182, -7.203881, 0, -0.5, 0.5, 0.5,
2, -3.579182, -7.203881, 1, -0.5, 0.5, 0.5,
2, -3.579182, -7.203881, 1, 1.5, 0.5, 0.5,
2, -3.579182, -7.203881, 0, 1.5, 0.5, 0.5
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
-3.691836, -3, -6.335739,
-3.691836, 3, -6.335739,
-3.691836, -3, -6.335739,
-3.884331, -3, -6.62512,
-3.691836, -2, -6.335739,
-3.884331, -2, -6.62512,
-3.691836, -1, -6.335739,
-3.884331, -1, -6.62512,
-3.691836, 0, -6.335739,
-3.884331, 0, -6.62512,
-3.691836, 1, -6.335739,
-3.884331, 1, -6.62512,
-3.691836, 2, -6.335739,
-3.884331, 2, -6.62512,
-3.691836, 3, -6.335739,
-3.884331, 3, -6.62512
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
-4.269322, -3, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, -3, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, -3, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, -3, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, -2, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, -2, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, -2, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, -2, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, -1, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, -1, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, -1, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, -1, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, 0, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, 0, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, 0, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, 0, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, 1, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, 1, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, 1, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, 1, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, 2, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, 2, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, 2, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, 2, -7.203881, 0, 1.5, 0.5, 0.5,
-4.269322, 3, -7.203881, 0, -0.5, 0.5, 0.5,
-4.269322, 3, -7.203881, 1, -0.5, 0.5, 0.5,
-4.269322, 3, -7.203881, 1, 1.5, 0.5, 0.5,
-4.269322, 3, -7.203881, 0, 1.5, 0.5, 0.5
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
-3.691836, -3.101711, -6,
-3.691836, -3.101711, 4,
-3.691836, -3.101711, -6,
-3.884331, -3.260868, -6,
-3.691836, -3.101711, -4,
-3.884331, -3.260868, -4,
-3.691836, -3.101711, -2,
-3.884331, -3.260868, -2,
-3.691836, -3.101711, 0,
-3.884331, -3.260868, 0,
-3.691836, -3.101711, 2,
-3.884331, -3.260868, 2,
-3.691836, -3.101711, 4,
-3.884331, -3.260868, 4
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
-4.269322, -3.579182, -6, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -6, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -6, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, -6, 0, 1.5, 0.5, 0.5,
-4.269322, -3.579182, -4, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -4, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -4, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, -4, 0, 1.5, 0.5, 0.5,
-4.269322, -3.579182, -2, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -2, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, -2, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, -2, 0, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 0, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 0, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 0, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 0, 0, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 2, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 2, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 2, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 2, 0, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 4, 0, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 4, 1, -0.5, 0.5, 0.5,
-4.269322, -3.579182, 4, 1, 1.5, 0.5, 0.5,
-4.269322, -3.579182, 4, 0, 1.5, 0.5, 0.5
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
-3.691836, -3.101711, -6.335739,
-3.691836, 3.264572, -6.335739,
-3.691836, -3.101711, 5.239484,
-3.691836, 3.264572, 5.239484,
-3.691836, -3.101711, -6.335739,
-3.691836, -3.101711, 5.239484,
-3.691836, 3.264572, -6.335739,
-3.691836, 3.264572, 5.239484,
-3.691836, -3.101711, -6.335739,
4.007972, -3.101711, -6.335739,
-3.691836, -3.101711, 5.239484,
4.007972, -3.101711, 5.239484,
-3.691836, 3.264572, -6.335739,
4.007972, 3.264572, -6.335739,
-3.691836, 3.264572, 5.239484,
4.007972, 3.264572, 5.239484,
4.007972, -3.101711, -6.335739,
4.007972, 3.264572, -6.335739,
4.007972, -3.101711, 5.239484,
4.007972, 3.264572, 5.239484,
4.007972, -3.101711, -6.335739,
4.007972, -3.101711, 5.239484,
4.007972, 3.264572, -6.335739,
4.007972, 3.264572, 5.239484
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
var radius = 8.164883;
var distance = 36.32648;
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
mvMatrix.translate( -0.1580677, -0.08143067, 0.5481272 );
mvMatrix.scale( 1.146526, 1.386685, 0.7626662 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.32648);
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

