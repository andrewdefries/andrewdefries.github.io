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
-3.093763, -0.7616602, -2.824697, 1, 0, 0, 1,
-2.828957, -0.4607535, -1.776659, 1, 0.007843138, 0, 1,
-2.644784, -1.90502, -3.553638, 1, 0.01176471, 0, 1,
-2.561344, -1.087766, -2.584476, 1, 0.01960784, 0, 1,
-2.526173, 0.5983127, 0.8114223, 1, 0.02352941, 0, 1,
-2.504258, -0.006648029, -1.046949, 1, 0.03137255, 0, 1,
-2.441552, 0.232038, -1.663432, 1, 0.03529412, 0, 1,
-2.414418, 0.1362323, -2.452802, 1, 0.04313726, 0, 1,
-2.3826, 0.03883918, -2.28525, 1, 0.04705882, 0, 1,
-2.37197, 0.4212798, -1.010729, 1, 0.05490196, 0, 1,
-2.357921, -1.191643, -1.731839, 1, 0.05882353, 0, 1,
-2.350279, -0.04367488, -1.387684, 1, 0.06666667, 0, 1,
-2.291826, -1.013611, -1.208858, 1, 0.07058824, 0, 1,
-2.283989, -2.091839, -2.169344, 1, 0.07843138, 0, 1,
-2.260214, 0.8317639, -1.273046, 1, 0.08235294, 0, 1,
-2.206071, 0.7054288, -1.058761, 1, 0.09019608, 0, 1,
-2.193291, 0.6526246, -1.120311, 1, 0.09411765, 0, 1,
-2.176666, -0.04715613, 0.6752007, 1, 0.1019608, 0, 1,
-2.104386, 2.138048, -1.989831, 1, 0.1098039, 0, 1,
-2.092621, -0.6612235, -1.033158, 1, 0.1137255, 0, 1,
-2.084565, 0.9647433, -1.379357, 1, 0.1215686, 0, 1,
-2.080427, 1.33688, -1.109063, 1, 0.1254902, 0, 1,
-1.996016, 1.78587, -0.4733277, 1, 0.1333333, 0, 1,
-1.982142, -0.5107143, -3.462753, 1, 0.1372549, 0, 1,
-1.975647, -0.08198467, -0.9790553, 1, 0.145098, 0, 1,
-1.945935, 1.698831, -0.7922049, 1, 0.1490196, 0, 1,
-1.909063, 0.4571783, -0.01238796, 1, 0.1568628, 0, 1,
-1.905332, -1.00751, -2.359373, 1, 0.1607843, 0, 1,
-1.878939, -1.007671, -2.379494, 1, 0.1686275, 0, 1,
-1.876153, -0.02013895, -2.393428, 1, 0.172549, 0, 1,
-1.871235, 0.7371911, -2.417245, 1, 0.1803922, 0, 1,
-1.863616, -0.1920121, -0.3600807, 1, 0.1843137, 0, 1,
-1.813975, -1.513397, -3.770031, 1, 0.1921569, 0, 1,
-1.799115, 1.28108, -0.2950658, 1, 0.1960784, 0, 1,
-1.782615, 0.01070174, -1.232952, 1, 0.2039216, 0, 1,
-1.766054, 1.133107, 0.3243092, 1, 0.2117647, 0, 1,
-1.712651, -0.7777847, -3.145664, 1, 0.2156863, 0, 1,
-1.706185, 0.01453495, -1.116153, 1, 0.2235294, 0, 1,
-1.688946, 0.4204963, 0.9062967, 1, 0.227451, 0, 1,
-1.670638, -0.9055228, -1.21838, 1, 0.2352941, 0, 1,
-1.662507, -0.199715, -2.49147, 1, 0.2392157, 0, 1,
-1.653854, 2.242417, -2.225089, 1, 0.2470588, 0, 1,
-1.653451, -0.4013442, -1.264958, 1, 0.2509804, 0, 1,
-1.636613, 1.681767, 0.2284125, 1, 0.2588235, 0, 1,
-1.619955, 0.3413662, -2.917226, 1, 0.2627451, 0, 1,
-1.618078, 0.08980057, -0.1946159, 1, 0.2705882, 0, 1,
-1.60134, 1.017704, -0.6130114, 1, 0.2745098, 0, 1,
-1.597796, 0.174144, -2.62731, 1, 0.282353, 0, 1,
-1.594027, 0.9193681, -2.484363, 1, 0.2862745, 0, 1,
-1.589739, 1.45363, -0.1476958, 1, 0.2941177, 0, 1,
-1.570567, -0.05158617, -1.71378, 1, 0.3019608, 0, 1,
-1.564956, -1.137795, -2.844664, 1, 0.3058824, 0, 1,
-1.558353, -1.146079, -1.910056, 1, 0.3137255, 0, 1,
-1.554777, 0.2947254, -1.505938, 1, 0.3176471, 0, 1,
-1.543977, 1.226195, -0.9876531, 1, 0.3254902, 0, 1,
-1.52152, -0.1409284, -0.240733, 1, 0.3294118, 0, 1,
-1.514319, 1.114977, -0.6328746, 1, 0.3372549, 0, 1,
-1.509977, -1.207342, -3.802597, 1, 0.3411765, 0, 1,
-1.506874, -0.08587834, -0.6654137, 1, 0.3490196, 0, 1,
-1.491554, 0.7734437, -1.036522, 1, 0.3529412, 0, 1,
-1.484492, -0.5496951, -1.99683, 1, 0.3607843, 0, 1,
-1.483045, 3.381273, -1.875641, 1, 0.3647059, 0, 1,
-1.481689, 0.593983, -1.046252, 1, 0.372549, 0, 1,
-1.480523, -0.7445653, -2.784764, 1, 0.3764706, 0, 1,
-1.479891, 2.122541, 0.242697, 1, 0.3843137, 0, 1,
-1.478587, -0.182006, -2.056788, 1, 0.3882353, 0, 1,
-1.470686, 1.235625, -1.50113, 1, 0.3960784, 0, 1,
-1.46949, 0.2043588, -1.016043, 1, 0.4039216, 0, 1,
-1.460785, 1.267685, -2.867544, 1, 0.4078431, 0, 1,
-1.458289, -0.5555489, -2.0524, 1, 0.4156863, 0, 1,
-1.454231, -0.522121, -2.29451, 1, 0.4196078, 0, 1,
-1.44594, 1.282918, -1.355842, 1, 0.427451, 0, 1,
-1.440412, 0.4753849, -0.2816787, 1, 0.4313726, 0, 1,
-1.424089, 1.625531, -1.988837, 1, 0.4392157, 0, 1,
-1.395107, -1.389128, -1.552735, 1, 0.4431373, 0, 1,
-1.387675, -1.155651, -3.069998, 1, 0.4509804, 0, 1,
-1.383836, 0.6155245, -0.5213633, 1, 0.454902, 0, 1,
-1.363997, 0.2297565, -0.6252142, 1, 0.4627451, 0, 1,
-1.363955, 0.575534, -1.140958, 1, 0.4666667, 0, 1,
-1.356413, -0.06221845, -0.8698713, 1, 0.4745098, 0, 1,
-1.34665, 0.5814081, -1.625317, 1, 0.4784314, 0, 1,
-1.342179, -0.4258316, -2.432369, 1, 0.4862745, 0, 1,
-1.337224, -1.241462, -0.982924, 1, 0.4901961, 0, 1,
-1.333813, -2.439809, -3.503186, 1, 0.4980392, 0, 1,
-1.3296, 0.9827362, 1.121165, 1, 0.5058824, 0, 1,
-1.317957, -0.5731421, -1.664319, 1, 0.509804, 0, 1,
-1.312689, -0.09149348, -2.524531, 1, 0.5176471, 0, 1,
-1.310355, -1.089987, -1.76535, 1, 0.5215687, 0, 1,
-1.308685, 1.714849, -1.681772, 1, 0.5294118, 0, 1,
-1.303159, 0.8849862, 1.207661, 1, 0.5333334, 0, 1,
-1.295127, 0.4428918, -1.709551, 1, 0.5411765, 0, 1,
-1.290064, -0.7017282, -2.712318, 1, 0.5450981, 0, 1,
-1.286002, -2.142064, -2.435958, 1, 0.5529412, 0, 1,
-1.285675, 0.7158737, -0.4021895, 1, 0.5568628, 0, 1,
-1.280782, -0.5432423, -0.07611256, 1, 0.5647059, 0, 1,
-1.26891, 0.8836352, -1.093924, 1, 0.5686275, 0, 1,
-1.25962, 0.8934712, -1.439385, 1, 0.5764706, 0, 1,
-1.255069, -0.5092348, -2.959093, 1, 0.5803922, 0, 1,
-1.252738, 0.7319854, -1.450529, 1, 0.5882353, 0, 1,
-1.24788, -1.857545, -3.876437, 1, 0.5921569, 0, 1,
-1.239689, 0.7343313, -1.748099, 1, 0.6, 0, 1,
-1.228021, -0.518387, 0.0007593448, 1, 0.6078432, 0, 1,
-1.223554, -0.1946415, -1.206169, 1, 0.6117647, 0, 1,
-1.21969, -0.9387658, -2.31357, 1, 0.6196079, 0, 1,
-1.203843, 1.340295, -0.6344953, 1, 0.6235294, 0, 1,
-1.198726, -0.9197745, -2.879595, 1, 0.6313726, 0, 1,
-1.198389, 0.08495159, -1.559877, 1, 0.6352941, 0, 1,
-1.195827, 0.03872927, -0.3582984, 1, 0.6431373, 0, 1,
-1.192564, -0.6278774, -2.923412, 1, 0.6470588, 0, 1,
-1.190177, 0.8124135, -1.914515, 1, 0.654902, 0, 1,
-1.189555, 0.5109128, -2.235168, 1, 0.6588235, 0, 1,
-1.183977, 0.6726518, 0.1361071, 1, 0.6666667, 0, 1,
-1.183814, 1.501815, -0.2743989, 1, 0.6705883, 0, 1,
-1.171784, 0.6696956, 1.267523, 1, 0.6784314, 0, 1,
-1.171509, -0.5717509, -2.081706, 1, 0.682353, 0, 1,
-1.170253, -0.8264725, -2.285189, 1, 0.6901961, 0, 1,
-1.167531, -0.6244069, -1.469675, 1, 0.6941177, 0, 1,
-1.165315, -1.071001, -4.311822, 1, 0.7019608, 0, 1,
-1.162339, 1.147446, -0.609158, 1, 0.7098039, 0, 1,
-1.154146, 0.570125, -1.409931, 1, 0.7137255, 0, 1,
-1.144745, 2.015014, 1.101991, 1, 0.7215686, 0, 1,
-1.137358, 0.9279601, -0.3889769, 1, 0.7254902, 0, 1,
-1.131598, 0.9813466, -2.251031, 1, 0.7333333, 0, 1,
-1.131531, -3.624066, -2.791675, 1, 0.7372549, 0, 1,
-1.128039, 0.1818815, 0.1536916, 1, 0.7450981, 0, 1,
-1.127281, -0.06212198, -3.703322, 1, 0.7490196, 0, 1,
-1.121877, -0.5493754, -2.383922, 1, 0.7568628, 0, 1,
-1.118056, 0.4225747, -1.27449, 1, 0.7607843, 0, 1,
-1.111642, -1.783238, -4.27209, 1, 0.7686275, 0, 1,
-1.090926, -0.1685029, -2.146981, 1, 0.772549, 0, 1,
-1.079378, -0.9323063, -3.449362, 1, 0.7803922, 0, 1,
-1.076917, -1.635008, -2.967429, 1, 0.7843137, 0, 1,
-1.074232, 0.7145695, -1.54046, 1, 0.7921569, 0, 1,
-1.073258, -0.9500564, -1.769473, 1, 0.7960784, 0, 1,
-1.065997, -1.489976, -3.096855, 1, 0.8039216, 0, 1,
-1.064171, 0.84316, -1.258317, 1, 0.8117647, 0, 1,
-1.061166, 0.239548, -0.9382908, 1, 0.8156863, 0, 1,
-1.055498, -0.509329, -2.30374, 1, 0.8235294, 0, 1,
-1.049804, -0.2081635, -3.438274, 1, 0.827451, 0, 1,
-1.048336, -0.5734122, 1.850259, 1, 0.8352941, 0, 1,
-1.04544, 0.331976, -0.1094658, 1, 0.8392157, 0, 1,
-1.044351, 0.08705114, 0.3882619, 1, 0.8470588, 0, 1,
-1.043349, -0.2471469, -3.667543, 1, 0.8509804, 0, 1,
-1.041254, -0.6361185, -2.376781, 1, 0.8588235, 0, 1,
-1.030633, -0.7775941, -3.854556, 1, 0.8627451, 0, 1,
-1.020513, -1.751862, -3.540912, 1, 0.8705882, 0, 1,
-1.01955, 1.126828, -0.1028068, 1, 0.8745098, 0, 1,
-1.014644, 1.800709, 1.108436, 1, 0.8823529, 0, 1,
-1.01344, 1.734241, 0.6637394, 1, 0.8862745, 0, 1,
-1.010731, -1.335403, -2.422353, 1, 0.8941177, 0, 1,
-1.007162, 0.5495818, -2.033194, 1, 0.8980392, 0, 1,
-0.9966897, -0.7045375, -3.033552, 1, 0.9058824, 0, 1,
-0.9952812, 0.9015355, -0.4614117, 1, 0.9137255, 0, 1,
-0.9951377, 0.5533857, 0.5133856, 1, 0.9176471, 0, 1,
-0.9935222, 0.8091959, -0.6147233, 1, 0.9254902, 0, 1,
-0.9910443, 0.7556284, -1.604697, 1, 0.9294118, 0, 1,
-0.986329, 0.9426609, -1.50176, 1, 0.9372549, 0, 1,
-0.9767234, 1.22724, -1.003419, 1, 0.9411765, 0, 1,
-0.9751149, 0.1023104, -2.432179, 1, 0.9490196, 0, 1,
-0.9735525, -1.017331, -2.207383, 1, 0.9529412, 0, 1,
-0.959204, 1.418703, -2.000308, 1, 0.9607843, 0, 1,
-0.9585757, -0.284645, -0.5399235, 1, 0.9647059, 0, 1,
-0.9552767, 0.06639943, -1.756492, 1, 0.972549, 0, 1,
-0.9552714, -1.710404, -2.316728, 1, 0.9764706, 0, 1,
-0.9536359, -0.6477566, -2.144739, 1, 0.9843137, 0, 1,
-0.9525504, 0.177708, -1.501802, 1, 0.9882353, 0, 1,
-0.9466346, 0.9614068, 0.2449429, 1, 0.9960784, 0, 1,
-0.9433287, 1.29788, 0.4994344, 0.9960784, 1, 0, 1,
-0.9371402, -0.5696806, -2.673448, 0.9921569, 1, 0, 1,
-0.9330363, 0.5279406, -0.1704856, 0.9843137, 1, 0, 1,
-0.9301993, 0.920692, 1.208203, 0.9803922, 1, 0, 1,
-0.9271725, -0.7444708, -3.658944, 0.972549, 1, 0, 1,
-0.9265883, 0.2509161, -2.133218, 0.9686275, 1, 0, 1,
-0.9252336, -1.164891, -1.532005, 0.9607843, 1, 0, 1,
-0.920751, -0.6216314, -3.97436, 0.9568627, 1, 0, 1,
-0.9155548, 0.2047064, -1.589471, 0.9490196, 1, 0, 1,
-0.9144791, 0.603341, 0.2311165, 0.945098, 1, 0, 1,
-0.9135718, 0.2775284, 2.301157, 0.9372549, 1, 0, 1,
-0.9131011, 0.6661529, -2.119875, 0.9333333, 1, 0, 1,
-0.9102037, -0.03231452, 1.486722, 0.9254902, 1, 0, 1,
-0.9094287, 1.445631, -0.8272238, 0.9215686, 1, 0, 1,
-0.9086236, -0.3990456, -1.189365, 0.9137255, 1, 0, 1,
-0.9011275, -0.5310145, -2.964797, 0.9098039, 1, 0, 1,
-0.900816, -0.7670767, -3.155978, 0.9019608, 1, 0, 1,
-0.9007982, -0.6282762, -3.078564, 0.8941177, 1, 0, 1,
-0.9007691, -0.5678, 0.4326781, 0.8901961, 1, 0, 1,
-0.8995104, 1.623082, -0.4588284, 0.8823529, 1, 0, 1,
-0.8988332, -0.7442525, -3.628849, 0.8784314, 1, 0, 1,
-0.8956599, -1.643631, -1.733181, 0.8705882, 1, 0, 1,
-0.8928829, -0.5024512, -1.752088, 0.8666667, 1, 0, 1,
-0.888495, 0.3453987, -0.5114055, 0.8588235, 1, 0, 1,
-0.8777764, 0.2114262, -0.939402, 0.854902, 1, 0, 1,
-0.8771412, 0.6425816, -1.008451, 0.8470588, 1, 0, 1,
-0.8712838, -0.9740648, -1.601023, 0.8431373, 1, 0, 1,
-0.8601693, -0.1738386, -1.715602, 0.8352941, 1, 0, 1,
-0.8526857, 1.454088, 0.5840449, 0.8313726, 1, 0, 1,
-0.8518378, -0.4801955, -0.7490653, 0.8235294, 1, 0, 1,
-0.8488089, 0.6537141, -1.272552, 0.8196079, 1, 0, 1,
-0.8485239, 2.124222, -0.0568613, 0.8117647, 1, 0, 1,
-0.8473123, 1.385504, 0.8782912, 0.8078431, 1, 0, 1,
-0.8429767, -1.447366, -2.224403, 0.8, 1, 0, 1,
-0.841464, 0.3446521, -1.140118, 0.7921569, 1, 0, 1,
-0.8394894, -1.082391, -3.694116, 0.7882353, 1, 0, 1,
-0.8337069, -0.7193262, -2.588815, 0.7803922, 1, 0, 1,
-0.8310466, -0.08537319, -0.3134434, 0.7764706, 1, 0, 1,
-0.8272601, 0.5029569, 0.3957118, 0.7686275, 1, 0, 1,
-0.8189193, 1.87398, -0.0326712, 0.7647059, 1, 0, 1,
-0.8175037, -0.2044124, -2.128838, 0.7568628, 1, 0, 1,
-0.8173027, -0.1962539, -3.624809, 0.7529412, 1, 0, 1,
-0.8158833, 0.05633899, -3.183917, 0.7450981, 1, 0, 1,
-0.8057955, 0.7242287, 0.100685, 0.7411765, 1, 0, 1,
-0.8055326, 0.3945992, -2.152161, 0.7333333, 1, 0, 1,
-0.8039601, 0.3078696, -0.3292269, 0.7294118, 1, 0, 1,
-0.8036498, 0.9628597, 1.228978, 0.7215686, 1, 0, 1,
-0.8006386, 1.942197, 0.7071137, 0.7176471, 1, 0, 1,
-0.7941832, -1.401426, -3.421703, 0.7098039, 1, 0, 1,
-0.793663, -0.3538435, -1.886526, 0.7058824, 1, 0, 1,
-0.7918667, 0.1016095, -0.6681144, 0.6980392, 1, 0, 1,
-0.7904681, 1.294197, -2.398268, 0.6901961, 1, 0, 1,
-0.7895829, 0.3897696, -2.146934, 0.6862745, 1, 0, 1,
-0.7792637, 0.3621472, -0.1255908, 0.6784314, 1, 0, 1,
-0.7790277, 0.09715139, -1.080349, 0.6745098, 1, 0, 1,
-0.7767307, 0.02438707, -2.604549, 0.6666667, 1, 0, 1,
-0.7722709, 0.7437393, -0.06422418, 0.6627451, 1, 0, 1,
-0.7704338, 0.6030501, 0.2389511, 0.654902, 1, 0, 1,
-0.7700896, 0.6299362, -0.1905927, 0.6509804, 1, 0, 1,
-0.7594806, 0.5200868, -1.232548, 0.6431373, 1, 0, 1,
-0.758262, 0.008864609, -0.8284655, 0.6392157, 1, 0, 1,
-0.7561405, 0.06689604, -1.310922, 0.6313726, 1, 0, 1,
-0.7547433, 0.5629459, -0.4569891, 0.627451, 1, 0, 1,
-0.7502891, 0.8204662, -1.467532, 0.6196079, 1, 0, 1,
-0.7469233, 0.1894112, -0.1974324, 0.6156863, 1, 0, 1,
-0.7454937, 0.7286858, -0.9556165, 0.6078432, 1, 0, 1,
-0.7383639, -0.2524079, -1.944846, 0.6039216, 1, 0, 1,
-0.7367444, 0.5436302, -1.307429, 0.5960785, 1, 0, 1,
-0.7279059, 2.041251, -0.8904377, 0.5882353, 1, 0, 1,
-0.7257321, -1.217446, -1.681055, 0.5843138, 1, 0, 1,
-0.7233837, -1.464183, -3.442046, 0.5764706, 1, 0, 1,
-0.7164682, -0.1573842, -3.39718, 0.572549, 1, 0, 1,
-0.7094055, 0.7661091, 0.1008959, 0.5647059, 1, 0, 1,
-0.7042567, -1.241217, -3.274491, 0.5607843, 1, 0, 1,
-0.7016766, 1.154692, -1.331641, 0.5529412, 1, 0, 1,
-0.6998352, -0.1959484, -2.955125, 0.5490196, 1, 0, 1,
-0.6993807, 0.4945685, 0.3179196, 0.5411765, 1, 0, 1,
-0.6992728, 0.2299956, -0.3983266, 0.5372549, 1, 0, 1,
-0.6981477, -0.4438551, -1.10952, 0.5294118, 1, 0, 1,
-0.6916503, 0.8208122, -1.855644, 0.5254902, 1, 0, 1,
-0.690449, 1.376368, 0.2098534, 0.5176471, 1, 0, 1,
-0.689553, -1.004186, -1.906979, 0.5137255, 1, 0, 1,
-0.6877102, 1.060296, -0.6520496, 0.5058824, 1, 0, 1,
-0.6850409, 0.4523962, -0.6015714, 0.5019608, 1, 0, 1,
-0.6836853, -1.583042, -0.6361135, 0.4941176, 1, 0, 1,
-0.6682201, 1.199208, 1.164918, 0.4862745, 1, 0, 1,
-0.6654645, 0.1358981, -0.6960034, 0.4823529, 1, 0, 1,
-0.662739, -1.717141, -3.454572, 0.4745098, 1, 0, 1,
-0.6604136, 0.107337, -1.030708, 0.4705882, 1, 0, 1,
-0.658523, 0.09197441, 0.7576539, 0.4627451, 1, 0, 1,
-0.655171, -0.6489616, -1.330615, 0.4588235, 1, 0, 1,
-0.6538036, -0.2147371, -3.256753, 0.4509804, 1, 0, 1,
-0.6522997, -0.04765131, -2.040978, 0.4470588, 1, 0, 1,
-0.6439348, 0.1352255, -1.048736, 0.4392157, 1, 0, 1,
-0.6394724, 1.02741, -0.3694587, 0.4352941, 1, 0, 1,
-0.6381002, 0.501982, -0.7933645, 0.427451, 1, 0, 1,
-0.6356604, 0.03558463, -1.057842, 0.4235294, 1, 0, 1,
-0.63191, 0.5358133, -0.3040774, 0.4156863, 1, 0, 1,
-0.63095, -0.9220884, -3.498855, 0.4117647, 1, 0, 1,
-0.6289076, -1.368478, -1.10483, 0.4039216, 1, 0, 1,
-0.6268457, -1.389786, -1.844959, 0.3960784, 1, 0, 1,
-0.6238527, 2.073611, 0.279458, 0.3921569, 1, 0, 1,
-0.6204275, 0.1509124, -2.251388, 0.3843137, 1, 0, 1,
-0.6166449, -1.303671, -3.239054, 0.3803922, 1, 0, 1,
-0.6133298, 1.214986, 0.9266238, 0.372549, 1, 0, 1,
-0.6036749, -0.02116506, -1.210297, 0.3686275, 1, 0, 1,
-0.6035044, -0.2222436, -3.897062, 0.3607843, 1, 0, 1,
-0.6010187, -0.01343214, -2.783565, 0.3568628, 1, 0, 1,
-0.600695, -1.713417, -2.834153, 0.3490196, 1, 0, 1,
-0.6002726, -0.60982, -3.898588, 0.345098, 1, 0, 1,
-0.5997415, -0.612491, -2.31021, 0.3372549, 1, 0, 1,
-0.5993507, -1.443379, -2.88478, 0.3333333, 1, 0, 1,
-0.5955094, -0.2174588, -1.795837, 0.3254902, 1, 0, 1,
-0.5954392, -1.901941, -2.811978, 0.3215686, 1, 0, 1,
-0.5912789, 0.4986315, -2.162586, 0.3137255, 1, 0, 1,
-0.5838311, -0.232339, -2.042826, 0.3098039, 1, 0, 1,
-0.5821295, 1.228224, 0.06392419, 0.3019608, 1, 0, 1,
-0.5805489, -0.8190545, -2.146948, 0.2941177, 1, 0, 1,
-0.5789027, 0.9247497, 0.5647435, 0.2901961, 1, 0, 1,
-0.578162, 1.207563, -0.1967445, 0.282353, 1, 0, 1,
-0.5781363, -0.6051363, -4.477238, 0.2784314, 1, 0, 1,
-0.5775807, -0.07692017, 0.04609631, 0.2705882, 1, 0, 1,
-0.5754979, 0.7135985, -2.578059, 0.2666667, 1, 0, 1,
-0.5704789, 1.16942, -2.105064, 0.2588235, 1, 0, 1,
-0.5701846, -1.619099, -2.200517, 0.254902, 1, 0, 1,
-0.5690014, -1.085566, -1.033587, 0.2470588, 1, 0, 1,
-0.5663251, -0.6105824, -2.068438, 0.2431373, 1, 0, 1,
-0.5662337, -0.1522881, -1.617991, 0.2352941, 1, 0, 1,
-0.5651526, -0.07057979, -1.541955, 0.2313726, 1, 0, 1,
-0.5617127, 0.1685064, -1.147961, 0.2235294, 1, 0, 1,
-0.5607744, -0.6684585, -2.872078, 0.2196078, 1, 0, 1,
-0.5605095, -0.6665515, -2.932143, 0.2117647, 1, 0, 1,
-0.5577345, 0.6519442, -0.5449588, 0.2078431, 1, 0, 1,
-0.5557126, -0.7127923, -4.232862, 0.2, 1, 0, 1,
-0.5510358, -0.6182733, -3.48085, 0.1921569, 1, 0, 1,
-0.5498273, 0.6777829, -0.8644336, 0.1882353, 1, 0, 1,
-0.5454803, 0.2191175, -0.733753, 0.1803922, 1, 0, 1,
-0.5450779, 0.5406456, -1.985629, 0.1764706, 1, 0, 1,
-0.5410921, 0.07599653, -1.093652, 0.1686275, 1, 0, 1,
-0.5396856, -2.620136, -2.916535, 0.1647059, 1, 0, 1,
-0.5384952, -0.805187, -3.022052, 0.1568628, 1, 0, 1,
-0.5383046, 0.886366, 1.350707, 0.1529412, 1, 0, 1,
-0.5381371, -0.1609547, -2.113582, 0.145098, 1, 0, 1,
-0.536294, 0.7932811, -1.234027, 0.1411765, 1, 0, 1,
-0.5352122, -0.4168644, -0.4490026, 0.1333333, 1, 0, 1,
-0.534057, 1.033735, 1.401852, 0.1294118, 1, 0, 1,
-0.533229, 0.6841536, -0.4879915, 0.1215686, 1, 0, 1,
-0.5330856, -0.1448528, -4.03471, 0.1176471, 1, 0, 1,
-0.5322564, -1.329782, -3.200838, 0.1098039, 1, 0, 1,
-0.5247489, -0.6367786, -2.493412, 0.1058824, 1, 0, 1,
-0.5239936, -0.1820475, -2.210113, 0.09803922, 1, 0, 1,
-0.518709, -0.2916653, -2.38779, 0.09019608, 1, 0, 1,
-0.5046625, 0.305375, -2.541935, 0.08627451, 1, 0, 1,
-0.5033767, 0.6557765, -0.08394518, 0.07843138, 1, 0, 1,
-0.4970078, -0.517326, -3.063251, 0.07450981, 1, 0, 1,
-0.4915036, -0.2097874, -0.7765078, 0.06666667, 1, 0, 1,
-0.4914877, -0.8262359, -1.917169, 0.0627451, 1, 0, 1,
-0.4909358, -0.04809977, -0.8111272, 0.05490196, 1, 0, 1,
-0.4858464, 0.2064712, -1.239373, 0.05098039, 1, 0, 1,
-0.4806609, 1.340174, 0.3193456, 0.04313726, 1, 0, 1,
-0.4753629, -0.2105993, -2.064412, 0.03921569, 1, 0, 1,
-0.4746635, -1.069838, -3.822424, 0.03137255, 1, 0, 1,
-0.470902, 1.826383, 1.224024, 0.02745098, 1, 0, 1,
-0.4687034, 0.1644942, -2.577564, 0.01960784, 1, 0, 1,
-0.4678943, -0.197879, -0.4227892, 0.01568628, 1, 0, 1,
-0.464906, 1.650102, -0.3029498, 0.007843138, 1, 0, 1,
-0.46244, 0.9150932, -0.5835967, 0.003921569, 1, 0, 1,
-0.4564677, 0.6046818, -0.02512365, 0, 1, 0.003921569, 1,
-0.455248, 1.591754, -2.253538, 0, 1, 0.01176471, 1,
-0.4480569, -0.9188168, -2.204951, 0, 1, 0.01568628, 1,
-0.4382054, -0.01503156, -1.871691, 0, 1, 0.02352941, 1,
-0.4364618, 0.1756201, -3.843888, 0, 1, 0.02745098, 1,
-0.4352052, 1.362004, -0.701471, 0, 1, 0.03529412, 1,
-0.434424, 1.972951, -0.5206472, 0, 1, 0.03921569, 1,
-0.4340249, -0.2705684, -1.745572, 0, 1, 0.04705882, 1,
-0.4313345, 0.4785242, -0.3874225, 0, 1, 0.05098039, 1,
-0.4271947, 0.2192186, -1.170674, 0, 1, 0.05882353, 1,
-0.4196244, -0.3046687, -0.8972688, 0, 1, 0.0627451, 1,
-0.4157617, 1.278617, -0.2541294, 0, 1, 0.07058824, 1,
-0.4143437, 1.324035, -0.9593235, 0, 1, 0.07450981, 1,
-0.4062181, 2.447805, 0.09118235, 0, 1, 0.08235294, 1,
-0.4058336, 1.775078, 0.3358956, 0, 1, 0.08627451, 1,
-0.4056589, 0.8607675, -0.808823, 0, 1, 0.09411765, 1,
-0.4056529, -2.055763, -3.315195, 0, 1, 0.1019608, 1,
-0.403567, 0.7954524, 1.273605, 0, 1, 0.1058824, 1,
-0.4034896, -2.030257, -3.002894, 0, 1, 0.1137255, 1,
-0.3997982, 0.227353, -2.003667, 0, 1, 0.1176471, 1,
-0.399158, 0.1523849, -1.196011, 0, 1, 0.1254902, 1,
-0.3962819, -0.5505946, -3.055017, 0, 1, 0.1294118, 1,
-0.3944678, 0.6366343, -0.8058816, 0, 1, 0.1372549, 1,
-0.3892326, 1.785846, -1.678858, 0, 1, 0.1411765, 1,
-0.3881179, -0.1021041, -0.2169809, 0, 1, 0.1490196, 1,
-0.3842455, -1.022117, -2.638365, 0, 1, 0.1529412, 1,
-0.3679869, -0.6863351, -1.385943, 0, 1, 0.1607843, 1,
-0.3613398, -0.1846528, -2.346157, 0, 1, 0.1647059, 1,
-0.3607175, 0.2802413, -1.521655, 0, 1, 0.172549, 1,
-0.3576337, 0.2867473, -1.545122, 0, 1, 0.1764706, 1,
-0.3569721, 0.5370296, -1.043221, 0, 1, 0.1843137, 1,
-0.3552303, -0.005982495, -0.5147678, 0, 1, 0.1882353, 1,
-0.3523869, -0.3370314, -2.218048, 0, 1, 0.1960784, 1,
-0.3495839, -0.1059288, -3.165181, 0, 1, 0.2039216, 1,
-0.3472044, -0.9191877, -2.32823, 0, 1, 0.2078431, 1,
-0.3459373, -2.301926, -5.195817, 0, 1, 0.2156863, 1,
-0.3372421, 1.901021, 0.5012956, 0, 1, 0.2196078, 1,
-0.3350554, 0.3390583, 0.2893964, 0, 1, 0.227451, 1,
-0.3346519, -0.3151949, -2.789172, 0, 1, 0.2313726, 1,
-0.3336354, -1.353538, -1.914522, 0, 1, 0.2392157, 1,
-0.3293193, 0.0458286, -1.391552, 0, 1, 0.2431373, 1,
-0.3280879, -0.5759832, -0.4879964, 0, 1, 0.2509804, 1,
-0.3177631, -0.1835413, -2.159742, 0, 1, 0.254902, 1,
-0.3165869, 1.156883, 0.05011971, 0, 1, 0.2627451, 1,
-0.3081112, -0.8613122, -0.834138, 0, 1, 0.2666667, 1,
-0.3021145, 0.4994581, -0.9230602, 0, 1, 0.2745098, 1,
-0.3012226, -1.946749, -3.613735, 0, 1, 0.2784314, 1,
-0.3005979, 1.722591, 0.2275557, 0, 1, 0.2862745, 1,
-0.2966867, -0.1887553, -1.275175, 0, 1, 0.2901961, 1,
-0.2961692, -0.3042102, -2.232857, 0, 1, 0.2980392, 1,
-0.2946408, -0.03480145, -1.780661, 0, 1, 0.3058824, 1,
-0.2945012, 0.1659237, -2.400085, 0, 1, 0.3098039, 1,
-0.2931298, 1.595687, -1.36785, 0, 1, 0.3176471, 1,
-0.2928035, 0.510453, -0.02333378, 0, 1, 0.3215686, 1,
-0.2917602, 2.350131, 1.712092, 0, 1, 0.3294118, 1,
-0.2898616, 0.3713472, -0.5841835, 0, 1, 0.3333333, 1,
-0.2897896, 0.3595914, -0.1471454, 0, 1, 0.3411765, 1,
-0.288085, -1.038058, -3.798248, 0, 1, 0.345098, 1,
-0.2875946, 0.09081291, -1.627531, 0, 1, 0.3529412, 1,
-0.2847576, 1.641384, 0.3044596, 0, 1, 0.3568628, 1,
-0.2844024, -1.82347, -1.09948, 0, 1, 0.3647059, 1,
-0.2836003, -1.422197, -2.414054, 0, 1, 0.3686275, 1,
-0.2807806, 1.293452, 0.584859, 0, 1, 0.3764706, 1,
-0.2806915, -1.127921, -2.749906, 0, 1, 0.3803922, 1,
-0.2794642, -0.1877819, -2.663303, 0, 1, 0.3882353, 1,
-0.2789778, 0.9864087, -0.3489156, 0, 1, 0.3921569, 1,
-0.2779129, 2.007266, -1.481539, 0, 1, 0.4, 1,
-0.2735393, 0.8758246, 2.204134, 0, 1, 0.4078431, 1,
-0.2698773, -0.7392607, -3.13329, 0, 1, 0.4117647, 1,
-0.2646625, -2.346572, -4.149209, 0, 1, 0.4196078, 1,
-0.2619061, -0.828862, -1.521849, 0, 1, 0.4235294, 1,
-0.2616794, -0.3988605, -3.238361, 0, 1, 0.4313726, 1,
-0.2608381, -1.444421, -3.514294, 0, 1, 0.4352941, 1,
-0.2598276, -1.041225, -4.660265, 0, 1, 0.4431373, 1,
-0.2584687, -2.128681, -3.078138, 0, 1, 0.4470588, 1,
-0.2523125, -0.04073217, -3.522893, 0, 1, 0.454902, 1,
-0.2507225, 1.44535, -2.21646, 0, 1, 0.4588235, 1,
-0.2484136, -0.8849671, -3.402075, 0, 1, 0.4666667, 1,
-0.2472233, -1.172721, -4.517115, 0, 1, 0.4705882, 1,
-0.2427107, 0.9667078, 0.945177, 0, 1, 0.4784314, 1,
-0.2397402, -0.004905463, -2.465545, 0, 1, 0.4823529, 1,
-0.2361828, -0.318299, -1.360442, 0, 1, 0.4901961, 1,
-0.2360336, 0.8740114, -1.024066, 0, 1, 0.4941176, 1,
-0.2314343, -0.3975734, -2.964977, 0, 1, 0.5019608, 1,
-0.2267551, -0.9125711, -3.236172, 0, 1, 0.509804, 1,
-0.2205952, -0.2821914, -4.042569, 0, 1, 0.5137255, 1,
-0.2178255, 1.739368, 0.2597155, 0, 1, 0.5215687, 1,
-0.2142844, 0.8076595, -0.9895162, 0, 1, 0.5254902, 1,
-0.2129634, 1.616935, -0.05858864, 0, 1, 0.5333334, 1,
-0.2117754, 0.6517469, 1.031316, 0, 1, 0.5372549, 1,
-0.2092292, 1.960168, 1.332564, 0, 1, 0.5450981, 1,
-0.2072006, 0.8456015, 1.610532, 0, 1, 0.5490196, 1,
-0.2067621, -1.181711, -2.226248, 0, 1, 0.5568628, 1,
-0.2013806, 1.410713, 0.1275697, 0, 1, 0.5607843, 1,
-0.2003627, 0.8535769, 0.7315757, 0, 1, 0.5686275, 1,
-0.1997029, 0.6985415, 0.5950503, 0, 1, 0.572549, 1,
-0.1987025, 0.2217051, -1.257925, 0, 1, 0.5803922, 1,
-0.1982687, 0.878969, -0.2053181, 0, 1, 0.5843138, 1,
-0.1859031, 0.3650298, -0.4753697, 0, 1, 0.5921569, 1,
-0.182324, -1.097437, -2.582319, 0, 1, 0.5960785, 1,
-0.1814112, -0.3550864, -3.059194, 0, 1, 0.6039216, 1,
-0.1812263, -0.8196841, -3.948596, 0, 1, 0.6117647, 1,
-0.1787807, 0.236495, -0.7578535, 0, 1, 0.6156863, 1,
-0.1782715, 2.275044, -0.1052486, 0, 1, 0.6235294, 1,
-0.1732726, 0.2187256, -2.224266, 0, 1, 0.627451, 1,
-0.1729147, -1.143668, -2.97146, 0, 1, 0.6352941, 1,
-0.1722795, -0.3797636, -1.976087, 0, 1, 0.6392157, 1,
-0.1662934, -0.3418681, -0.7967704, 0, 1, 0.6470588, 1,
-0.1580999, 1.028636, -0.64112, 0, 1, 0.6509804, 1,
-0.1572646, 0.945063, 1.277558, 0, 1, 0.6588235, 1,
-0.1484841, 1.18569, -1.424219, 0, 1, 0.6627451, 1,
-0.1446583, 0.8432798, -1.247521, 0, 1, 0.6705883, 1,
-0.1425295, -1.106725, -2.668019, 0, 1, 0.6745098, 1,
-0.1420796, 0.1812585, -0.7699745, 0, 1, 0.682353, 1,
-0.1405808, 1.905814, -0.4822067, 0, 1, 0.6862745, 1,
-0.136751, 0.2103204, -1.15115, 0, 1, 0.6941177, 1,
-0.1345908, 0.01259622, -0.3826795, 0, 1, 0.7019608, 1,
-0.1331603, -0.8291107, -2.87176, 0, 1, 0.7058824, 1,
-0.1331466, -0.0932778, -2.820463, 0, 1, 0.7137255, 1,
-0.1328394, 0.3067203, -1.052824, 0, 1, 0.7176471, 1,
-0.1319544, 0.3181333, 1.476917, 0, 1, 0.7254902, 1,
-0.1309154, -0.6117565, -3.89969, 0, 1, 0.7294118, 1,
-0.125087, 0.5080652, -0.708152, 0, 1, 0.7372549, 1,
-0.1242759, -1.006487, -3.729604, 0, 1, 0.7411765, 1,
-0.1230305, 1.666292, 0.7714387, 0, 1, 0.7490196, 1,
-0.1198504, 0.01623809, -0.503726, 0, 1, 0.7529412, 1,
-0.1193599, -0.3077988, -3.448355, 0, 1, 0.7607843, 1,
-0.1178805, 0.0775132, 0.06649971, 0, 1, 0.7647059, 1,
-0.1063076, -0.990069, -3.252389, 0, 1, 0.772549, 1,
-0.1035198, 0.03063236, -1.574845, 0, 1, 0.7764706, 1,
-0.1030549, -0.2705521, -1.542318, 0, 1, 0.7843137, 1,
-0.086836, -0.8307981, -3.53465, 0, 1, 0.7882353, 1,
-0.08415499, 0.3034144, -0.4235326, 0, 1, 0.7960784, 1,
-0.07939368, -0.8990517, -2.608635, 0, 1, 0.8039216, 1,
-0.07853631, -1.694476, -2.498094, 0, 1, 0.8078431, 1,
-0.07653573, 0.6671475, -0.2067709, 0, 1, 0.8156863, 1,
-0.07362854, -3.075281, -1.877681, 0, 1, 0.8196079, 1,
-0.06891043, 0.3286209, 1.168213, 0, 1, 0.827451, 1,
-0.06813388, 0.2916632, -0.2780924, 0, 1, 0.8313726, 1,
-0.06499372, -1.443989, -3.998446, 0, 1, 0.8392157, 1,
-0.06413255, 0.4932116, -0.5080821, 0, 1, 0.8431373, 1,
-0.05549785, 0.9527153, -1.593975, 0, 1, 0.8509804, 1,
-0.05499325, 0.8495129, 0.1923998, 0, 1, 0.854902, 1,
-0.05406449, -0.295684, -2.223848, 0, 1, 0.8627451, 1,
-0.05205322, -1.602931, -3.266526, 0, 1, 0.8666667, 1,
-0.04987963, 0.9215385, 0.1174589, 0, 1, 0.8745098, 1,
-0.0488189, 0.07627197, -2.243525, 0, 1, 0.8784314, 1,
-0.04076578, -0.7373693, -3.718305, 0, 1, 0.8862745, 1,
-0.0403019, 2.186886, -0.6097658, 0, 1, 0.8901961, 1,
-0.03448632, 0.839792, 0.4823979, 0, 1, 0.8980392, 1,
-0.03397251, 1.674126, 0.4574812, 0, 1, 0.9058824, 1,
-0.03133948, 0.5691836, 0.6690716, 0, 1, 0.9098039, 1,
-0.0303166, 2.030531, -0.4068228, 0, 1, 0.9176471, 1,
-0.02950968, 0.7496274, 1.645926, 0, 1, 0.9215686, 1,
-0.02898116, -0.6900599, -0.5857517, 0, 1, 0.9294118, 1,
-0.02734996, -0.4987569, -2.274171, 0, 1, 0.9333333, 1,
-0.02558997, 1.488073, -0.6014617, 0, 1, 0.9411765, 1,
-0.0229033, 1.115412, 1.723449, 0, 1, 0.945098, 1,
-0.02245697, 0.5793598, -0.7034703, 0, 1, 0.9529412, 1,
-0.02063688, -0.4784808, -4.1079, 0, 1, 0.9568627, 1,
-0.01906097, -1.402905, -2.71361, 0, 1, 0.9647059, 1,
-0.01525535, -0.5527313, -4.506429, 0, 1, 0.9686275, 1,
-0.01388164, 0.09220657, -1.151933, 0, 1, 0.9764706, 1,
-0.007034115, -0.2944665, -3.368672, 0, 1, 0.9803922, 1,
-0.004654424, -0.2917762, -4.025964, 0, 1, 0.9882353, 1,
0.006169486, -1.295191, 2.851458, 0, 1, 0.9921569, 1,
0.006606799, -0.7474114, 3.004593, 0, 1, 1, 1,
0.00682578, -0.4091421, 3.365412, 0, 0.9921569, 1, 1,
0.009401429, 0.2865435, -0.02477291, 0, 0.9882353, 1, 1,
0.009418855, 0.2074189, 0.2193988, 0, 0.9803922, 1, 1,
0.01144109, -2.06951, 3.238713, 0, 0.9764706, 1, 1,
0.01187178, -0.681075, 2.907662, 0, 0.9686275, 1, 1,
0.01340655, -0.6213362, 3.386121, 0, 0.9647059, 1, 1,
0.01489586, -1.541623, 3.33245, 0, 0.9568627, 1, 1,
0.01676106, -1.718993, 2.932298, 0, 0.9529412, 1, 1,
0.01733502, 0.3493548, -0.6872557, 0, 0.945098, 1, 1,
0.01889343, -0.2269247, 4.047811, 0, 0.9411765, 1, 1,
0.01976429, -0.2496968, 4.026143, 0, 0.9333333, 1, 1,
0.02143413, 1.345683, -1.116863, 0, 0.9294118, 1, 1,
0.02295832, 1.265691, -0.5792386, 0, 0.9215686, 1, 1,
0.02318779, -0.6061019, 2.519391, 0, 0.9176471, 1, 1,
0.02734064, -1.360662, 1.549876, 0, 0.9098039, 1, 1,
0.02841362, 1.173213, 1.536903, 0, 0.9058824, 1, 1,
0.03056368, 0.1560481, -0.6548341, 0, 0.8980392, 1, 1,
0.03247036, 0.6391392, -0.9622159, 0, 0.8901961, 1, 1,
0.03272451, 1.963755, -0.3864472, 0, 0.8862745, 1, 1,
0.03343288, -0.3779712, 2.625739, 0, 0.8784314, 1, 1,
0.03388355, 1.196262, -0.003180421, 0, 0.8745098, 1, 1,
0.03406701, 1.208212, -0.8318816, 0, 0.8666667, 1, 1,
0.03676449, -0.4756153, 1.804069, 0, 0.8627451, 1, 1,
0.03794302, -0.4820503, 3.926156, 0, 0.854902, 1, 1,
0.03869705, 0.7847901, -1.39886, 0, 0.8509804, 1, 1,
0.03912336, -0.1317662, 2.824941, 0, 0.8431373, 1, 1,
0.04106, -0.5546383, 2.410298, 0, 0.8392157, 1, 1,
0.04294741, 0.05633942, 1.07984, 0, 0.8313726, 1, 1,
0.04335908, -0.2906867, 4.186196, 0, 0.827451, 1, 1,
0.04639491, -0.7687168, 4.157859, 0, 0.8196079, 1, 1,
0.04643834, 1.647252, 0.493203, 0, 0.8156863, 1, 1,
0.05071215, -0.1113011, 2.31611, 0, 0.8078431, 1, 1,
0.05958706, -1.062041, 2.611742, 0, 0.8039216, 1, 1,
0.0604111, -0.1679736, 1.517216, 0, 0.7960784, 1, 1,
0.06154112, 0.1063996, 0.8130013, 0, 0.7882353, 1, 1,
0.06179006, -1.783517, 1.162239, 0, 0.7843137, 1, 1,
0.06251755, -1.332152, 2.640336, 0, 0.7764706, 1, 1,
0.0634008, -0.5875436, 2.97853, 0, 0.772549, 1, 1,
0.06542709, -0.180877, 1.768555, 0, 0.7647059, 1, 1,
0.0697915, -0.8108317, 3.26909, 0, 0.7607843, 1, 1,
0.07081271, -1.349023, 3.594906, 0, 0.7529412, 1, 1,
0.07107794, 0.581284, 1.800349, 0, 0.7490196, 1, 1,
0.07120986, -0.03317391, 1.666238, 0, 0.7411765, 1, 1,
0.07739154, -0.873071, 3.971785, 0, 0.7372549, 1, 1,
0.07901779, 1.63652, -0.7498165, 0, 0.7294118, 1, 1,
0.07938129, -1.014384, 1.867575, 0, 0.7254902, 1, 1,
0.08254935, -0.3408196, 2.412479, 0, 0.7176471, 1, 1,
0.08266459, -0.2563324, 1.510542, 0, 0.7137255, 1, 1,
0.08337296, 2.989266, -0.6572704, 0, 0.7058824, 1, 1,
0.0850965, -0.9139581, 3.710914, 0, 0.6980392, 1, 1,
0.08545948, -0.4250194, 2.647203, 0, 0.6941177, 1, 1,
0.08646424, 1.041549, 0.01182137, 0, 0.6862745, 1, 1,
0.0883855, 1.474101, 0.8179937, 0, 0.682353, 1, 1,
0.09033398, 0.1393282, 0.2233302, 0, 0.6745098, 1, 1,
0.09295408, -2.243809, 4.111443, 0, 0.6705883, 1, 1,
0.09466869, -0.8774266, 2.652702, 0, 0.6627451, 1, 1,
0.09504815, -0.9466084, 2.245041, 0, 0.6588235, 1, 1,
0.09532083, -0.8474141, 3.531471, 0, 0.6509804, 1, 1,
0.09900857, 1.228215, -0.8302918, 0, 0.6470588, 1, 1,
0.1004453, -0.5863455, 2.900856, 0, 0.6392157, 1, 1,
0.1055824, -0.9546675, 2.506286, 0, 0.6352941, 1, 1,
0.1118717, -2.015924, 3.482612, 0, 0.627451, 1, 1,
0.1126707, -0.5114619, 2.60427, 0, 0.6235294, 1, 1,
0.117127, -0.1846705, 2.254972, 0, 0.6156863, 1, 1,
0.1201586, -0.5622766, 2.289512, 0, 0.6117647, 1, 1,
0.1215399, -0.2741564, 1.701849, 0, 0.6039216, 1, 1,
0.1234779, -1.115652, 2.879936, 0, 0.5960785, 1, 1,
0.1237102, -0.005968771, 0.1279018, 0, 0.5921569, 1, 1,
0.1262385, 0.05436511, 0.295069, 0, 0.5843138, 1, 1,
0.1279305, 2.232315, 1.862553, 0, 0.5803922, 1, 1,
0.1300353, 0.4986943, 0.1628439, 0, 0.572549, 1, 1,
0.1342738, 0.8204064, 1.580945, 0, 0.5686275, 1, 1,
0.1404888, 0.3512787, 1.547126, 0, 0.5607843, 1, 1,
0.1433901, -0.3106593, 1.507721, 0, 0.5568628, 1, 1,
0.1458072, 0.8708882, 2.033009, 0, 0.5490196, 1, 1,
0.1483924, 0.008395629, 1.263618, 0, 0.5450981, 1, 1,
0.1492697, 0.2696745, -0.1801608, 0, 0.5372549, 1, 1,
0.1508481, -0.1360162, 3.830412, 0, 0.5333334, 1, 1,
0.1518544, -0.4999086, 4.809807, 0, 0.5254902, 1, 1,
0.1521667, 0.9128138, -0.3002194, 0, 0.5215687, 1, 1,
0.1552238, -0.5809366, 1.514924, 0, 0.5137255, 1, 1,
0.1588859, -0.9074479, 2.842826, 0, 0.509804, 1, 1,
0.1706584, 0.7505338, 1.109173, 0, 0.5019608, 1, 1,
0.1709605, -0.8295508, 3.081232, 0, 0.4941176, 1, 1,
0.1788419, -1.267216, 3.815446, 0, 0.4901961, 1, 1,
0.1824335, -0.2906308, 3.598844, 0, 0.4823529, 1, 1,
0.1835446, 2.591649, 1.135765, 0, 0.4784314, 1, 1,
0.1865723, 0.7912228, -1.402302, 0, 0.4705882, 1, 1,
0.190762, 0.2403711, 1.94273, 0, 0.4666667, 1, 1,
0.1938248, -0.7156408, 4.147322, 0, 0.4588235, 1, 1,
0.1951171, 0.8230189, 2.153881, 0, 0.454902, 1, 1,
0.195174, -0.1786175, 1.626053, 0, 0.4470588, 1, 1,
0.2042075, -0.3515582, 2.157556, 0, 0.4431373, 1, 1,
0.2044508, 1.854995, -0.3218319, 0, 0.4352941, 1, 1,
0.2064486, -0.2732204, 2.437511, 0, 0.4313726, 1, 1,
0.2090622, 1.892734, 2.09517, 0, 0.4235294, 1, 1,
0.2175747, 0.6653864, 0.6539189, 0, 0.4196078, 1, 1,
0.2200596, -0.9248988, 3.057379, 0, 0.4117647, 1, 1,
0.221816, 0.5178618, 1.737113, 0, 0.4078431, 1, 1,
0.2243544, -0.6223105, 3.549539, 0, 0.4, 1, 1,
0.2248685, -0.363606, 2.06431, 0, 0.3921569, 1, 1,
0.2278357, -0.721081, 1.819959, 0, 0.3882353, 1, 1,
0.235052, -0.3850961, 2.768988, 0, 0.3803922, 1, 1,
0.236998, -0.3192646, 2.205401, 0, 0.3764706, 1, 1,
0.2407337, -0.03507672, 1.497087, 0, 0.3686275, 1, 1,
0.242637, -0.1119848, 3.309438, 0, 0.3647059, 1, 1,
0.2458066, -0.5942408, 2.810104, 0, 0.3568628, 1, 1,
0.2488067, 1.60538, 1.23369, 0, 0.3529412, 1, 1,
0.2567635, 0.03506291, 2.611217, 0, 0.345098, 1, 1,
0.2570548, -0.3722007, 3.05056, 0, 0.3411765, 1, 1,
0.2588646, 1.609609, -0.422277, 0, 0.3333333, 1, 1,
0.2630726, -0.02421516, 2.784399, 0, 0.3294118, 1, 1,
0.264431, -0.5146422, 2.653411, 0, 0.3215686, 1, 1,
0.2648506, -1.106539, 3.409477, 0, 0.3176471, 1, 1,
0.2654881, 0.3865549, 0.3646001, 0, 0.3098039, 1, 1,
0.2673, -0.7006317, 2.257994, 0, 0.3058824, 1, 1,
0.2692767, 0.1012965, 2.535266, 0, 0.2980392, 1, 1,
0.2711128, 2.216667, 0.381051, 0, 0.2901961, 1, 1,
0.2724639, -1.022955, 2.222452, 0, 0.2862745, 1, 1,
0.2727886, -0.3879865, 3.673984, 0, 0.2784314, 1, 1,
0.2781951, -0.8812966, 2.981726, 0, 0.2745098, 1, 1,
0.2835655, -0.6379687, 2.971651, 0, 0.2666667, 1, 1,
0.2844268, 0.2152465, 0.1674616, 0, 0.2627451, 1, 1,
0.2854759, 0.2451053, 0.5321759, 0, 0.254902, 1, 1,
0.2886119, -0.6924183, 4.224417, 0, 0.2509804, 1, 1,
0.2904898, 1.129699, 0.5614652, 0, 0.2431373, 1, 1,
0.2905674, -0.2937228, 3.139872, 0, 0.2392157, 1, 1,
0.2958639, 1.954445, 0.3859881, 0, 0.2313726, 1, 1,
0.296524, 1.959811, -1.257529, 0, 0.227451, 1, 1,
0.299188, 0.4339052, 0.1202874, 0, 0.2196078, 1, 1,
0.3016103, -0.8980379, 4.248824, 0, 0.2156863, 1, 1,
0.3027454, -0.7763036, 2.699405, 0, 0.2078431, 1, 1,
0.3028192, 0.4813653, 1.698703, 0, 0.2039216, 1, 1,
0.3032267, 0.7940383, 1.35688, 0, 0.1960784, 1, 1,
0.3040862, 1.127857, 0.1867709, 0, 0.1882353, 1, 1,
0.3051012, 0.4990118, 0.5323267, 0, 0.1843137, 1, 1,
0.3067179, 0.6309037, -0.4366081, 0, 0.1764706, 1, 1,
0.3084996, -2.165354, 4.256211, 0, 0.172549, 1, 1,
0.3097568, -0.421157, 1.328796, 0, 0.1647059, 1, 1,
0.3110748, -0.07855015, 1.541848, 0, 0.1607843, 1, 1,
0.3143234, -0.5516109, 1.489856, 0, 0.1529412, 1, 1,
0.317938, -0.5622152, 3.933809, 0, 0.1490196, 1, 1,
0.3217853, 0.8390002, 1.540578, 0, 0.1411765, 1, 1,
0.324275, -0.03895362, 1.976794, 0, 0.1372549, 1, 1,
0.3256199, -0.2149493, 3.593666, 0, 0.1294118, 1, 1,
0.3279608, 0.9926155, -1.33951, 0, 0.1254902, 1, 1,
0.330129, 0.260386, -0.1044315, 0, 0.1176471, 1, 1,
0.3319738, -0.1741629, 1.359417, 0, 0.1137255, 1, 1,
0.333313, -0.7071936, 2.672009, 0, 0.1058824, 1, 1,
0.3340096, 0.1522685, -0.02495721, 0, 0.09803922, 1, 1,
0.3345836, -0.07453666, 2.386312, 0, 0.09411765, 1, 1,
0.3363157, -1.471329, 1.2606, 0, 0.08627451, 1, 1,
0.3363225, 0.8118905, -0.6109573, 0, 0.08235294, 1, 1,
0.3385821, -1.402214, 4.55713, 0, 0.07450981, 1, 1,
0.3424832, -1.082203, 2.991695, 0, 0.07058824, 1, 1,
0.3555202, -0.9686957, 2.808465, 0, 0.0627451, 1, 1,
0.3566894, -0.421418, 3.51834, 0, 0.05882353, 1, 1,
0.3594344, -1.280251, 3.653731, 0, 0.05098039, 1, 1,
0.3596012, 0.1914388, -0.5665215, 0, 0.04705882, 1, 1,
0.3627355, -0.6416987, 3.800539, 0, 0.03921569, 1, 1,
0.3684579, 1.009259, -0.009116465, 0, 0.03529412, 1, 1,
0.3711132, -0.3299285, 1.995015, 0, 0.02745098, 1, 1,
0.3724237, 1.879567, 0.2532548, 0, 0.02352941, 1, 1,
0.3743166, 0.5327256, -0.1683653, 0, 0.01568628, 1, 1,
0.3789421, 1.218028, -1.293602, 0, 0.01176471, 1, 1,
0.3803889, 0.3393652, 1.377328, 0, 0.003921569, 1, 1,
0.3808587, -1.404357, 3.103947, 0.003921569, 0, 1, 1,
0.3836529, -1.15451, 2.066924, 0.007843138, 0, 1, 1,
0.3878219, -0.1671742, 2.458783, 0.01568628, 0, 1, 1,
0.3878286, 0.328183, 1.063768, 0.01960784, 0, 1, 1,
0.3902414, 0.3821268, -0.5133907, 0.02745098, 0, 1, 1,
0.3927248, -0.3896532, 2.802911, 0.03137255, 0, 1, 1,
0.3954442, -0.1123332, 2.593464, 0.03921569, 0, 1, 1,
0.3963466, 0.1757264, 1.782296, 0.04313726, 0, 1, 1,
0.3966271, 0.2503168, 2.152723, 0.05098039, 0, 1, 1,
0.397727, 0.8642588, 1.405765, 0.05490196, 0, 1, 1,
0.398359, 0.7321311, 0.9020749, 0.0627451, 0, 1, 1,
0.4041405, -1.081344, 4.05718, 0.06666667, 0, 1, 1,
0.4051917, -1.016181, 2.475093, 0.07450981, 0, 1, 1,
0.4151526, -0.4555509, 0.9663331, 0.07843138, 0, 1, 1,
0.4165739, -1.159683, 2.825668, 0.08627451, 0, 1, 1,
0.4265637, -0.3726431, 3.152564, 0.09019608, 0, 1, 1,
0.4373859, 0.2306853, 0.9171544, 0.09803922, 0, 1, 1,
0.4374032, 1.409451, -0.1992839, 0.1058824, 0, 1, 1,
0.4450683, -0.1717318, 1.644723, 0.1098039, 0, 1, 1,
0.4457456, -0.903133, 2.778049, 0.1176471, 0, 1, 1,
0.4476607, -0.1745781, 3.683289, 0.1215686, 0, 1, 1,
0.4490935, -0.6041416, 2.712534, 0.1294118, 0, 1, 1,
0.44983, 0.1906263, 0.9084932, 0.1333333, 0, 1, 1,
0.4564233, -0.8848248, 3.816682, 0.1411765, 0, 1, 1,
0.4619777, 0.9240895, 1.887626, 0.145098, 0, 1, 1,
0.46507, 0.6549422, -0.4176645, 0.1529412, 0, 1, 1,
0.4653031, 0.09951401, 2.085641, 0.1568628, 0, 1, 1,
0.4670601, 0.7266763, 0.5973617, 0.1647059, 0, 1, 1,
0.4670705, -0.7655537, 3.301809, 0.1686275, 0, 1, 1,
0.4723626, -1.072781, 4.056131, 0.1764706, 0, 1, 1,
0.4741978, -1.38477, 1.850155, 0.1803922, 0, 1, 1,
0.4753505, -1.641655, 2.827297, 0.1882353, 0, 1, 1,
0.4786572, 0.608433, -0.4011565, 0.1921569, 0, 1, 1,
0.4806939, -0.1149066, 3.149355, 0.2, 0, 1, 1,
0.4816122, -0.7905388, 1.947491, 0.2078431, 0, 1, 1,
0.4816134, -0.3466566, 0.5741024, 0.2117647, 0, 1, 1,
0.4828928, 0.7986715, 1.803223, 0.2196078, 0, 1, 1,
0.4873713, -0.2869642, 2.998837, 0.2235294, 0, 1, 1,
0.49053, 0.7876661, 0.2952544, 0.2313726, 0, 1, 1,
0.4956466, 0.09074384, 1.500633, 0.2352941, 0, 1, 1,
0.4964361, -0.6744741, 2.083944, 0.2431373, 0, 1, 1,
0.5028049, -1.085714, 2.435815, 0.2470588, 0, 1, 1,
0.5180876, -0.653829, 1.484699, 0.254902, 0, 1, 1,
0.5182054, 0.0494685, 3.009418, 0.2588235, 0, 1, 1,
0.5276592, -2.213714, 4.512263, 0.2666667, 0, 1, 1,
0.5277731, 0.5905128, 1.594648, 0.2705882, 0, 1, 1,
0.5301735, -0.7528731, 3.391017, 0.2784314, 0, 1, 1,
0.5337862, 2.02366, -0.3987088, 0.282353, 0, 1, 1,
0.5343659, 0.9806584, 1.429404, 0.2901961, 0, 1, 1,
0.5361686, -1.329079, 3.058082, 0.2941177, 0, 1, 1,
0.5379709, -0.6933595, 1.379265, 0.3019608, 0, 1, 1,
0.548274, -0.4816456, 3.124905, 0.3098039, 0, 1, 1,
0.5482924, -0.6817999, 0.3155158, 0.3137255, 0, 1, 1,
0.551466, 1.571823, 0.4941619, 0.3215686, 0, 1, 1,
0.5590398, 0.6473311, 0.002122926, 0.3254902, 0, 1, 1,
0.5610337, 0.2058022, 0.6417218, 0.3333333, 0, 1, 1,
0.5612288, 0.707092, 0.7669544, 0.3372549, 0, 1, 1,
0.5676273, -0.709848, 3.360976, 0.345098, 0, 1, 1,
0.5781664, 0.887015, -0.2309371, 0.3490196, 0, 1, 1,
0.5793812, 0.8223006, -0.4057323, 0.3568628, 0, 1, 1,
0.5855104, 1.988932, 1.926666, 0.3607843, 0, 1, 1,
0.5910158, 0.009793504, -0.03021552, 0.3686275, 0, 1, 1,
0.5913099, -0.5638383, 1.295006, 0.372549, 0, 1, 1,
0.6003068, -1.074894, 2.232913, 0.3803922, 0, 1, 1,
0.6028225, -0.350284, 0.262391, 0.3843137, 0, 1, 1,
0.6031841, -0.06618962, -0.4736769, 0.3921569, 0, 1, 1,
0.605491, -0.07412679, 2.235792, 0.3960784, 0, 1, 1,
0.6058285, 1.076658, 1.755962, 0.4039216, 0, 1, 1,
0.6123726, -0.574394, 3.949093, 0.4117647, 0, 1, 1,
0.6179162, -1.230106, 3.091428, 0.4156863, 0, 1, 1,
0.6244863, -1.474602, 3.719632, 0.4235294, 0, 1, 1,
0.6259584, -0.653563, 1.189951, 0.427451, 0, 1, 1,
0.6268836, -0.2618059, 1.872663, 0.4352941, 0, 1, 1,
0.6371156, -0.4809127, -0.1112422, 0.4392157, 0, 1, 1,
0.637876, 0.139143, 0.630205, 0.4470588, 0, 1, 1,
0.6437247, 0.1774067, 3.084393, 0.4509804, 0, 1, 1,
0.6458573, 1.944185, 0.8723953, 0.4588235, 0, 1, 1,
0.6463627, 1.461266, 0.4957163, 0.4627451, 0, 1, 1,
0.6463734, -0.188717, 1.780584, 0.4705882, 0, 1, 1,
0.6465783, -0.2681306, 2.468011, 0.4745098, 0, 1, 1,
0.6482447, -0.3259082, 3.329858, 0.4823529, 0, 1, 1,
0.6535706, 2.1614, -0.508239, 0.4862745, 0, 1, 1,
0.6601993, -0.05823862, 2.070314, 0.4941176, 0, 1, 1,
0.6605015, 0.9985995, 0.8125146, 0.5019608, 0, 1, 1,
0.6619123, 1.631843, -0.5677125, 0.5058824, 0, 1, 1,
0.666566, 0.7575223, 1.135443, 0.5137255, 0, 1, 1,
0.6679422, 0.1359229, 1.188457, 0.5176471, 0, 1, 1,
0.6701804, 0.6339257, 0.4359001, 0.5254902, 0, 1, 1,
0.6837521, 0.4716488, 1.978742, 0.5294118, 0, 1, 1,
0.6889473, 0.08769337, -0.7767937, 0.5372549, 0, 1, 1,
0.6978896, 0.2560959, 1.008969, 0.5411765, 0, 1, 1,
0.6984807, -0.1559329, 1.986298, 0.5490196, 0, 1, 1,
0.7013006, 0.5816829, 0.8217661, 0.5529412, 0, 1, 1,
0.7013876, -0.9245035, 4.226733, 0.5607843, 0, 1, 1,
0.7034113, 0.8578579, -0.2912285, 0.5647059, 0, 1, 1,
0.7103668, 0.2260045, 1.923587, 0.572549, 0, 1, 1,
0.7122527, 0.9529681, 0.135594, 0.5764706, 0, 1, 1,
0.7195734, 0.3761611, 1.962473, 0.5843138, 0, 1, 1,
0.7253668, -0.1007818, 2.285346, 0.5882353, 0, 1, 1,
0.729095, 1.009447, 1.784746, 0.5960785, 0, 1, 1,
0.7326806, -1.181352, 2.795121, 0.6039216, 0, 1, 1,
0.7327932, 0.1489873, -1.129083, 0.6078432, 0, 1, 1,
0.7393928, 0.9834527, 0.2686745, 0.6156863, 0, 1, 1,
0.7405345, -0.225832, 1.190634, 0.6196079, 0, 1, 1,
0.7421904, -1.256926, 2.313362, 0.627451, 0, 1, 1,
0.7489473, 0.8955475, 1.574008, 0.6313726, 0, 1, 1,
0.7506543, -2.569305, 2.88675, 0.6392157, 0, 1, 1,
0.753511, -0.5373276, 2.096122, 0.6431373, 0, 1, 1,
0.757352, 0.2895443, 3.498561, 0.6509804, 0, 1, 1,
0.7588109, -0.2433402, 0.2508449, 0.654902, 0, 1, 1,
0.7682955, -0.9330038, 3.599923, 0.6627451, 0, 1, 1,
0.7696368, 0.6431174, 1.57899, 0.6666667, 0, 1, 1,
0.7722069, -0.3556978, 3.329095, 0.6745098, 0, 1, 1,
0.7752305, 0.5054591, 0.1088767, 0.6784314, 0, 1, 1,
0.7775922, -1.027372, 3.204721, 0.6862745, 0, 1, 1,
0.7853541, 1.385239, 1.313069, 0.6901961, 0, 1, 1,
0.7862597, -0.8101968, 2.578742, 0.6980392, 0, 1, 1,
0.7900791, 0.3093618, -1.09684, 0.7058824, 0, 1, 1,
0.7983119, -1.920921, 4.987856, 0.7098039, 0, 1, 1,
0.8005677, 0.245641, 1.05731, 0.7176471, 0, 1, 1,
0.8151745, 2.702572, 0.4917085, 0.7215686, 0, 1, 1,
0.8219314, 0.5451704, 1.976839, 0.7294118, 0, 1, 1,
0.8245699, -0.3791616, 0.5526774, 0.7333333, 0, 1, 1,
0.8263878, -0.3325395, 1.075378, 0.7411765, 0, 1, 1,
0.8267355, 1.340665, 0.2485361, 0.7450981, 0, 1, 1,
0.8415965, -1.635972, 2.301542, 0.7529412, 0, 1, 1,
0.8424723, 0.4492674, 1.965796, 0.7568628, 0, 1, 1,
0.8481658, 0.4762717, 0.1860813, 0.7647059, 0, 1, 1,
0.8494211, 0.4016418, 0.9361154, 0.7686275, 0, 1, 1,
0.8499256, -1.222734, 2.280945, 0.7764706, 0, 1, 1,
0.8532379, 0.7076893, 1.814368, 0.7803922, 0, 1, 1,
0.8550777, -0.4800659, 2.193939, 0.7882353, 0, 1, 1,
0.855549, 0.1348249, 2.356323, 0.7921569, 0, 1, 1,
0.8621444, 1.390094, -0.05568763, 0.8, 0, 1, 1,
0.8621741, -0.1183493, 1.977399, 0.8078431, 0, 1, 1,
0.8622588, 0.5555286, 0.9435764, 0.8117647, 0, 1, 1,
0.8627495, -0.9244604, 0.8381468, 0.8196079, 0, 1, 1,
0.8654601, -1.950088, 3.577012, 0.8235294, 0, 1, 1,
0.8662407, -0.9224322, 1.493855, 0.8313726, 0, 1, 1,
0.8671783, -0.01207192, 3.046135, 0.8352941, 0, 1, 1,
0.8713116, 1.10192, -0.1517488, 0.8431373, 0, 1, 1,
0.8726249, -0.7597278, 1.098351, 0.8470588, 0, 1, 1,
0.8726391, 2.269936, 1.150597, 0.854902, 0, 1, 1,
0.8786122, 0.3702485, 1.052972, 0.8588235, 0, 1, 1,
0.8810944, -0.8158671, 3.587495, 0.8666667, 0, 1, 1,
0.8838265, -0.1899735, 1.371329, 0.8705882, 0, 1, 1,
0.884637, -0.7119132, 3.35254, 0.8784314, 0, 1, 1,
0.8846923, 0.0522778, 3.387147, 0.8823529, 0, 1, 1,
0.8894964, 1.26927, 0.6760715, 0.8901961, 0, 1, 1,
0.8895941, 0.08847156, 2.208559, 0.8941177, 0, 1, 1,
0.8897176, -1.096001, 3.013349, 0.9019608, 0, 1, 1,
0.8973635, 0.7287368, 1.256773, 0.9098039, 0, 1, 1,
0.9025385, 0.001621304, 0.6782848, 0.9137255, 0, 1, 1,
0.9071683, -0.1141309, 2.602731, 0.9215686, 0, 1, 1,
0.9132228, -0.8967829, 2.193115, 0.9254902, 0, 1, 1,
0.9190111, 1.580951, -0.4735916, 0.9333333, 0, 1, 1,
0.9278824, 0.4573622, 1.123738, 0.9372549, 0, 1, 1,
0.9375612, 0.6214734, 0.4509856, 0.945098, 0, 1, 1,
0.9381479, 1.570177, 0.09917115, 0.9490196, 0, 1, 1,
0.9412641, -2.732049, 2.559852, 0.9568627, 0, 1, 1,
0.9440337, 1.497652, -1.798433, 0.9607843, 0, 1, 1,
0.9482461, 0.006415767, 1.808436, 0.9686275, 0, 1, 1,
0.9489307, 0.9130121, 1.992928, 0.972549, 0, 1, 1,
0.9535033, 0.4362808, 1.322893, 0.9803922, 0, 1, 1,
0.9642083, 0.8084908, 2.697208, 0.9843137, 0, 1, 1,
0.9648056, 0.3794982, 2.192339, 0.9921569, 0, 1, 1,
0.9648103, 1.198868, 0.5718206, 0.9960784, 0, 1, 1,
0.9772843, 0.8581396, 1.039983, 1, 0, 0.9960784, 1,
0.9785374, 0.6861528, 1.638138, 1, 0, 0.9882353, 1,
0.9869239, 0.8990728, 1.730197, 1, 0, 0.9843137, 1,
0.990328, -1.748806, 2.832029, 1, 0, 0.9764706, 1,
0.9908797, -0.3950221, 2.41036, 1, 0, 0.972549, 1,
0.9912167, 0.4039849, -0.1659379, 1, 0, 0.9647059, 1,
0.9981256, 0.4453002, -0.1566758, 1, 0, 0.9607843, 1,
1.005825, 1.57159, 1.013757, 1, 0, 0.9529412, 1,
1.008362, 1.065313, 1.656218, 1, 0, 0.9490196, 1,
1.014125, -0.2660445, 3.118692, 1, 0, 0.9411765, 1,
1.014391, 1.384637, 0.2993153, 1, 0, 0.9372549, 1,
1.01836, 0.5750654, 1.221378, 1, 0, 0.9294118, 1,
1.02775, -0.8567895, 1.269054, 1, 0, 0.9254902, 1,
1.02804, 1.166304, 0.9349601, 1, 0, 0.9176471, 1,
1.030869, -0.3504971, 2.168154, 1, 0, 0.9137255, 1,
1.032866, 1.716741, -0.1698405, 1, 0, 0.9058824, 1,
1.039697, 0.7835538, 0.1579289, 1, 0, 0.9019608, 1,
1.04161, 1.093586, 0.4252997, 1, 0, 0.8941177, 1,
1.044153, 0.8146108, 1.587779, 1, 0, 0.8862745, 1,
1.044158, -0.1655286, 1.855611, 1, 0, 0.8823529, 1,
1.053097, 1.944955, 0.1743103, 1, 0, 0.8745098, 1,
1.073017, 1.229592, -0.4153487, 1, 0, 0.8705882, 1,
1.078524, 0.7339867, 0.3853419, 1, 0, 0.8627451, 1,
1.079622, -0.4063611, 2.019535, 1, 0, 0.8588235, 1,
1.081468, -0.464022, 1.85758, 1, 0, 0.8509804, 1,
1.082188, 0.3310342, 2.795795, 1, 0, 0.8470588, 1,
1.082984, 2.797552, 1.64544, 1, 0, 0.8392157, 1,
1.0849, -0.1318107, 1.237465, 1, 0, 0.8352941, 1,
1.094966, -0.01310453, 0.9757856, 1, 0, 0.827451, 1,
1.097448, 0.3044304, 0.5660293, 1, 0, 0.8235294, 1,
1.105987, -1.323007, 2.289219, 1, 0, 0.8156863, 1,
1.117959, -0.6162589, 3.370881, 1, 0, 0.8117647, 1,
1.121347, -0.04304967, 0.3248717, 1, 0, 0.8039216, 1,
1.123195, -0.4643057, 1.819595, 1, 0, 0.7960784, 1,
1.12721, 1.700703, -0.7523873, 1, 0, 0.7921569, 1,
1.130936, -2.094669, 1.552377, 1, 0, 0.7843137, 1,
1.133136, 0.6455924, -0.109267, 1, 0, 0.7803922, 1,
1.135343, 0.2568966, 0.6839716, 1, 0, 0.772549, 1,
1.145882, -2.434615, 2.481562, 1, 0, 0.7686275, 1,
1.147014, 0.8450379, 0.9225991, 1, 0, 0.7607843, 1,
1.161019, -0.3858378, 0.7652872, 1, 0, 0.7568628, 1,
1.163438, 1.101171, 1.864507, 1, 0, 0.7490196, 1,
1.164813, 0.03963711, 0.8231508, 1, 0, 0.7450981, 1,
1.167422, -0.5723642, 1.165858, 1, 0, 0.7372549, 1,
1.170458, -0.754481, 1.175517, 1, 0, 0.7333333, 1,
1.172036, 0.1631237, 1.323537, 1, 0, 0.7254902, 1,
1.174827, 0.1554457, 0.7602739, 1, 0, 0.7215686, 1,
1.176409, 0.2074641, 1.949513, 1, 0, 0.7137255, 1,
1.176974, 0.2395342, 0.5003644, 1, 0, 0.7098039, 1,
1.179569, -0.5422106, 1.720228, 1, 0, 0.7019608, 1,
1.194931, -0.1741374, 2.11669, 1, 0, 0.6941177, 1,
1.195934, 0.5298609, 1.141318, 1, 0, 0.6901961, 1,
1.197839, 0.0664863, 0.7637624, 1, 0, 0.682353, 1,
1.201099, 0.8009328, 1.59052, 1, 0, 0.6784314, 1,
1.201439, 0.2707233, 2.685064, 1, 0, 0.6705883, 1,
1.20527, -1.690201, 1.958491, 1, 0, 0.6666667, 1,
1.221681, -1.363942, 3.466677, 1, 0, 0.6588235, 1,
1.226442, -1.30367, 4.301333, 1, 0, 0.654902, 1,
1.229712, -0.2212906, 3.017313, 1, 0, 0.6470588, 1,
1.241988, 1.397321, 0.3946896, 1, 0, 0.6431373, 1,
1.252929, 0.2082677, 1.570246, 1, 0, 0.6352941, 1,
1.259593, -1.295091, 2.156957, 1, 0, 0.6313726, 1,
1.26139, -0.4075295, 2.313881, 1, 0, 0.6235294, 1,
1.261594, 2.088575, 1.362424, 1, 0, 0.6196079, 1,
1.265912, -0.5809623, 1.328813, 1, 0, 0.6117647, 1,
1.268427, -2.161335, 2.305001, 1, 0, 0.6078432, 1,
1.269127, 0.4542438, -0.005944899, 1, 0, 0.6, 1,
1.272747, 1.010416, 1.474252, 1, 0, 0.5921569, 1,
1.280356, 2.014186, 0.6748552, 1, 0, 0.5882353, 1,
1.281259, 0.4941064, 1.727933, 1, 0, 0.5803922, 1,
1.292281, 1.229918, 0.633565, 1, 0, 0.5764706, 1,
1.297275, 1.216292, 1.67297, 1, 0, 0.5686275, 1,
1.298861, -1.020015, 1.279387, 1, 0, 0.5647059, 1,
1.301699, 1.497378, -0.07908703, 1, 0, 0.5568628, 1,
1.307658, -0.9830717, 2.359737, 1, 0, 0.5529412, 1,
1.313859, 0.8722277, 1.058616, 1, 0, 0.5450981, 1,
1.314317, 0.04260198, 0.2326449, 1, 0, 0.5411765, 1,
1.322159, -1.096583, 2.777859, 1, 0, 0.5333334, 1,
1.322313, -1.515023, 2.829484, 1, 0, 0.5294118, 1,
1.325875, 0.690393, 2.407892, 1, 0, 0.5215687, 1,
1.326757, -0.1666588, 3.9659, 1, 0, 0.5176471, 1,
1.329263, -0.2544127, 2.498123, 1, 0, 0.509804, 1,
1.338964, -0.7905049, 2.231418, 1, 0, 0.5058824, 1,
1.359084, -0.3313461, 0.667529, 1, 0, 0.4980392, 1,
1.398044, 0.3284124, 1.817748, 1, 0, 0.4901961, 1,
1.399129, 0.1707638, 1.229832, 1, 0, 0.4862745, 1,
1.402185, 0.8445182, 2.735224, 1, 0, 0.4784314, 1,
1.409267, 1.165571, 1.672221, 1, 0, 0.4745098, 1,
1.414712, 2.529355, 0.9829351, 1, 0, 0.4666667, 1,
1.416387, 0.8941393, 0.9989169, 1, 0, 0.4627451, 1,
1.426949, -0.04544685, 2.002674, 1, 0, 0.454902, 1,
1.427487, 1.201154, 1.916363, 1, 0, 0.4509804, 1,
1.428074, 1.631384, 2.302062, 1, 0, 0.4431373, 1,
1.432802, 0.3837124, 0.4806947, 1, 0, 0.4392157, 1,
1.43962, 0.8463184, 0.824065, 1, 0, 0.4313726, 1,
1.471254, -0.1819126, 0.08342659, 1, 0, 0.427451, 1,
1.478271, -0.3057744, 2.315674, 1, 0, 0.4196078, 1,
1.493513, 0.189613, 1.54863, 1, 0, 0.4156863, 1,
1.505031, 0.6730137, 1.510793, 1, 0, 0.4078431, 1,
1.515171, -1.641376, 2.825576, 1, 0, 0.4039216, 1,
1.523997, -0.899923, 1.873335, 1, 0, 0.3960784, 1,
1.528026, -0.5495617, 2.15732, 1, 0, 0.3882353, 1,
1.531013, -0.7964638, 1.29147, 1, 0, 0.3843137, 1,
1.545702, 1.835488, 0.4618411, 1, 0, 0.3764706, 1,
1.55215, -0.6515964, 2.811614, 1, 0, 0.372549, 1,
1.559452, 0.3654414, 0.5619014, 1, 0, 0.3647059, 1,
1.566595, 0.2543116, 1.596974, 1, 0, 0.3607843, 1,
1.571853, -0.7222914, 2.845237, 1, 0, 0.3529412, 1,
1.575624, 1.439966, 1.119405, 1, 0, 0.3490196, 1,
1.593851, 0.4996766, 1.533058, 1, 0, 0.3411765, 1,
1.597031, -0.01493274, 0.648274, 1, 0, 0.3372549, 1,
1.602605, 0.9194171, -0.138422, 1, 0, 0.3294118, 1,
1.603677, 1.101597, 1.556703, 1, 0, 0.3254902, 1,
1.60758, 0.2354272, -0.2975257, 1, 0, 0.3176471, 1,
1.652725, 1.431334, 0.7223924, 1, 0, 0.3137255, 1,
1.66967, 0.4072747, -1.614532, 1, 0, 0.3058824, 1,
1.679304, 2.248588, 0.7006019, 1, 0, 0.2980392, 1,
1.690237, -0.6920215, 1.538833, 1, 0, 0.2941177, 1,
1.697719, 0.2972641, 1.835717, 1, 0, 0.2862745, 1,
1.710225, 0.01420798, 1.377615, 1, 0, 0.282353, 1,
1.719211, 0.06775083, 0.7740707, 1, 0, 0.2745098, 1,
1.749671, -0.9141389, 2.705539, 1, 0, 0.2705882, 1,
1.754026, -1.70275, 2.082879, 1, 0, 0.2627451, 1,
1.766094, -0.2770512, 1.118292, 1, 0, 0.2588235, 1,
1.766804, -1.43915, 0.4524966, 1, 0, 0.2509804, 1,
1.78578, -1.635655, 2.758835, 1, 0, 0.2470588, 1,
1.788267, 1.140627, 0.2330707, 1, 0, 0.2392157, 1,
1.805071, -0.4707477, 1.874156, 1, 0, 0.2352941, 1,
1.827679, 0.4515206, 1.658921, 1, 0, 0.227451, 1,
1.840782, 1.052393, -0.2940199, 1, 0, 0.2235294, 1,
1.859968, 0.7188742, 1.187446, 1, 0, 0.2156863, 1,
1.860176, 0.2325607, 3.126698, 1, 0, 0.2117647, 1,
1.894787, 0.7484618, 2.523296, 1, 0, 0.2039216, 1,
1.909397, 2.11628, 0.3598769, 1, 0, 0.1960784, 1,
1.932097, 0.542531, 1.876568, 1, 0, 0.1921569, 1,
1.952016, -0.4496829, 2.58929, 1, 0, 0.1843137, 1,
1.954094, -1.540722, 1.840217, 1, 0, 0.1803922, 1,
1.960565, 0.3335976, 1.65214, 1, 0, 0.172549, 1,
1.971038, -0.3484377, 1.476701, 1, 0, 0.1686275, 1,
1.986731, 0.8585899, 1.09628, 1, 0, 0.1607843, 1,
1.999005, -1.583308, 2.786357, 1, 0, 0.1568628, 1,
2.004457, 0.3437698, 2.143474, 1, 0, 0.1490196, 1,
2.020174, 0.5769626, 0.214325, 1, 0, 0.145098, 1,
2.053895, 1.359238, 0.6815959, 1, 0, 0.1372549, 1,
2.078697, 0.401929, 2.029707, 1, 0, 0.1333333, 1,
2.09629, 0.1292892, 2.029916, 1, 0, 0.1254902, 1,
2.104668, 2.926881, 1.806759, 1, 0, 0.1215686, 1,
2.133447, 0.2135271, -0.5943092, 1, 0, 0.1137255, 1,
2.135513, -0.1453753, 1.03982, 1, 0, 0.1098039, 1,
2.161207, 0.5641162, 0.2166287, 1, 0, 0.1019608, 1,
2.195045, 0.3637858, 0.6164371, 1, 0, 0.09411765, 1,
2.212783, 0.1225465, 2.287438, 1, 0, 0.09019608, 1,
2.227097, 0.02965589, 0.1508184, 1, 0, 0.08235294, 1,
2.230164, 0.2254889, -0.7188873, 1, 0, 0.07843138, 1,
2.24615, 1.247887, -1.594377, 1, 0, 0.07058824, 1,
2.403254, 0.3918726, 2.396356, 1, 0, 0.06666667, 1,
2.45563, -1.12951, 1.498519, 1, 0, 0.05882353, 1,
2.472197, -0.4579109, 0.5154679, 1, 0, 0.05490196, 1,
2.477983, 0.3138929, 0.3853095, 1, 0, 0.04705882, 1,
2.527634, 0.2252494, 1.668589, 1, 0, 0.04313726, 1,
2.540931, -0.2643645, 1.872114, 1, 0, 0.03529412, 1,
2.606198, 2.011864, 0.4922391, 1, 0, 0.03137255, 1,
2.83322, 0.5654636, 1.627002, 1, 0, 0.02352941, 1,
2.906643, 0.7276124, -0.5728417, 1, 0, 0.01960784, 1,
2.924502, 0.393086, 1.408961, 1, 0, 0.01176471, 1,
3.035228, 0.03477392, 2.467908, 1, 0, 0.007843138, 1
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
-0.02926779, -4.811471, -6.921949, 0, -0.5, 0.5, 0.5,
-0.02926779, -4.811471, -6.921949, 1, -0.5, 0.5, 0.5,
-0.02926779, -4.811471, -6.921949, 1, 1.5, 0.5, 0.5,
-0.02926779, -4.811471, -6.921949, 0, 1.5, 0.5, 0.5
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
-4.132627, -0.1213963, -6.921949, 0, -0.5, 0.5, 0.5,
-4.132627, -0.1213963, -6.921949, 1, -0.5, 0.5, 0.5,
-4.132627, -0.1213963, -6.921949, 1, 1.5, 0.5, 0.5,
-4.132627, -0.1213963, -6.921949, 0, 1.5, 0.5, 0.5
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
-4.132627, -4.811471, -0.1039805, 0, -0.5, 0.5, 0.5,
-4.132627, -4.811471, -0.1039805, 1, -0.5, 0.5, 0.5,
-4.132627, -4.811471, -0.1039805, 1, 1.5, 0.5, 0.5,
-4.132627, -4.811471, -0.1039805, 0, 1.5, 0.5, 0.5
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
-3, -3.729146, -5.348572,
3, -3.729146, -5.348572,
-3, -3.729146, -5.348572,
-3, -3.909533, -5.610802,
-2, -3.729146, -5.348572,
-2, -3.909533, -5.610802,
-1, -3.729146, -5.348572,
-1, -3.909533, -5.610802,
0, -3.729146, -5.348572,
0, -3.909533, -5.610802,
1, -3.729146, -5.348572,
1, -3.909533, -5.610802,
2, -3.729146, -5.348572,
2, -3.909533, -5.610802,
3, -3.729146, -5.348572,
3, -3.909533, -5.610802
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
-3, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
-3, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
-3, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
-3, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
-2, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
-2, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
-2, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
-2, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
-1, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
-1, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
-1, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
-1, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
0, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
0, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
0, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
0, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
1, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
1, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
1, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
1, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
2, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
2, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
2, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
2, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5,
3, -4.270308, -6.135261, 0, -0.5, 0.5, 0.5,
3, -4.270308, -6.135261, 1, -0.5, 0.5, 0.5,
3, -4.270308, -6.135261, 1, 1.5, 0.5, 0.5,
3, -4.270308, -6.135261, 0, 1.5, 0.5, 0.5
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
-3.185698, -2, -5.348572,
-3.185698, 2, -5.348572,
-3.185698, -2, -5.348572,
-3.34352, -2, -5.610802,
-3.185698, 0, -5.348572,
-3.34352, 0, -5.610802,
-3.185698, 2, -5.348572,
-3.34352, 2, -5.610802
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
-3.659163, -2, -6.135261, 0, -0.5, 0.5, 0.5,
-3.659163, -2, -6.135261, 1, -0.5, 0.5, 0.5,
-3.659163, -2, -6.135261, 1, 1.5, 0.5, 0.5,
-3.659163, -2, -6.135261, 0, 1.5, 0.5, 0.5,
-3.659163, 0, -6.135261, 0, -0.5, 0.5, 0.5,
-3.659163, 0, -6.135261, 1, -0.5, 0.5, 0.5,
-3.659163, 0, -6.135261, 1, 1.5, 0.5, 0.5,
-3.659163, 0, -6.135261, 0, 1.5, 0.5, 0.5,
-3.659163, 2, -6.135261, 0, -0.5, 0.5, 0.5,
-3.659163, 2, -6.135261, 1, -0.5, 0.5, 0.5,
-3.659163, 2, -6.135261, 1, 1.5, 0.5, 0.5,
-3.659163, 2, -6.135261, 0, 1.5, 0.5, 0.5
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
-3.185698, -3.729146, -4,
-3.185698, -3.729146, 4,
-3.185698, -3.729146, -4,
-3.34352, -3.909533, -4,
-3.185698, -3.729146, -2,
-3.34352, -3.909533, -2,
-3.185698, -3.729146, 0,
-3.34352, -3.909533, 0,
-3.185698, -3.729146, 2,
-3.34352, -3.909533, 2,
-3.185698, -3.729146, 4,
-3.34352, -3.909533, 4
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
-3.659163, -4.270308, -4, 0, -0.5, 0.5, 0.5,
-3.659163, -4.270308, -4, 1, -0.5, 0.5, 0.5,
-3.659163, -4.270308, -4, 1, 1.5, 0.5, 0.5,
-3.659163, -4.270308, -4, 0, 1.5, 0.5, 0.5,
-3.659163, -4.270308, -2, 0, -0.5, 0.5, 0.5,
-3.659163, -4.270308, -2, 1, -0.5, 0.5, 0.5,
-3.659163, -4.270308, -2, 1, 1.5, 0.5, 0.5,
-3.659163, -4.270308, -2, 0, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 0, 0, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 0, 1, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 0, 1, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 0, 0, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 2, 0, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 2, 1, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 2, 1, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 2, 0, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 4, 0, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 4, 1, -0.5, 0.5, 0.5,
-3.659163, -4.270308, 4, 1, 1.5, 0.5, 0.5,
-3.659163, -4.270308, 4, 0, 1.5, 0.5, 0.5
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
-3.185698, -3.729146, -5.348572,
-3.185698, 3.486353, -5.348572,
-3.185698, -3.729146, 5.140611,
-3.185698, 3.486353, 5.140611,
-3.185698, -3.729146, -5.348572,
-3.185698, -3.729146, 5.140611,
-3.185698, 3.486353, -5.348572,
-3.185698, 3.486353, 5.140611,
-3.185698, -3.729146, -5.348572,
3.127163, -3.729146, -5.348572,
-3.185698, -3.729146, 5.140611,
3.127163, -3.729146, 5.140611,
-3.185698, 3.486353, -5.348572,
3.127163, 3.486353, -5.348572,
-3.185698, 3.486353, 5.140611,
3.127163, 3.486353, 5.140611,
3.127163, -3.729146, -5.348572,
3.127163, 3.486353, -5.348572,
3.127163, -3.729146, 5.140611,
3.127163, 3.486353, 5.140611,
3.127163, -3.729146, -5.348572,
3.127163, -3.729146, 5.140611,
3.127163, 3.486353, -5.348572,
3.127163, 3.486353, 5.140611
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
var radius = 7.588136;
var distance = 33.76048;
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
mvMatrix.translate( 0.02926779, 0.1213963, 0.1039805 );
mvMatrix.scale( 1.299639, 1.137058, 0.7821812 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76048);
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
4-Aminopyridinen<-read.table("4-Aminopyridinen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-Aminopyridinen$V2
```

```
## Error in eval(expr, envir, enclos): object 'Aminopyridinen' not found
```

```r
y<-4-Aminopyridinen$V3
```

```
## Error in eval(expr, envir, enclos): object 'Aminopyridinen' not found
```

```r
z<-4-Aminopyridinen$V4
```

```
## Error in eval(expr, envir, enclos): object 'Aminopyridinen' not found
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
-3.093763, -0.7616602, -2.824697, 0, 0, 1, 1, 1,
-2.828957, -0.4607535, -1.776659, 1, 0, 0, 1, 1,
-2.644784, -1.90502, -3.553638, 1, 0, 0, 1, 1,
-2.561344, -1.087766, -2.584476, 1, 0, 0, 1, 1,
-2.526173, 0.5983127, 0.8114223, 1, 0, 0, 1, 1,
-2.504258, -0.006648029, -1.046949, 1, 0, 0, 1, 1,
-2.441552, 0.232038, -1.663432, 0, 0, 0, 1, 1,
-2.414418, 0.1362323, -2.452802, 0, 0, 0, 1, 1,
-2.3826, 0.03883918, -2.28525, 0, 0, 0, 1, 1,
-2.37197, 0.4212798, -1.010729, 0, 0, 0, 1, 1,
-2.357921, -1.191643, -1.731839, 0, 0, 0, 1, 1,
-2.350279, -0.04367488, -1.387684, 0, 0, 0, 1, 1,
-2.291826, -1.013611, -1.208858, 0, 0, 0, 1, 1,
-2.283989, -2.091839, -2.169344, 1, 1, 1, 1, 1,
-2.260214, 0.8317639, -1.273046, 1, 1, 1, 1, 1,
-2.206071, 0.7054288, -1.058761, 1, 1, 1, 1, 1,
-2.193291, 0.6526246, -1.120311, 1, 1, 1, 1, 1,
-2.176666, -0.04715613, 0.6752007, 1, 1, 1, 1, 1,
-2.104386, 2.138048, -1.989831, 1, 1, 1, 1, 1,
-2.092621, -0.6612235, -1.033158, 1, 1, 1, 1, 1,
-2.084565, 0.9647433, -1.379357, 1, 1, 1, 1, 1,
-2.080427, 1.33688, -1.109063, 1, 1, 1, 1, 1,
-1.996016, 1.78587, -0.4733277, 1, 1, 1, 1, 1,
-1.982142, -0.5107143, -3.462753, 1, 1, 1, 1, 1,
-1.975647, -0.08198467, -0.9790553, 1, 1, 1, 1, 1,
-1.945935, 1.698831, -0.7922049, 1, 1, 1, 1, 1,
-1.909063, 0.4571783, -0.01238796, 1, 1, 1, 1, 1,
-1.905332, -1.00751, -2.359373, 1, 1, 1, 1, 1,
-1.878939, -1.007671, -2.379494, 0, 0, 1, 1, 1,
-1.876153, -0.02013895, -2.393428, 1, 0, 0, 1, 1,
-1.871235, 0.7371911, -2.417245, 1, 0, 0, 1, 1,
-1.863616, -0.1920121, -0.3600807, 1, 0, 0, 1, 1,
-1.813975, -1.513397, -3.770031, 1, 0, 0, 1, 1,
-1.799115, 1.28108, -0.2950658, 1, 0, 0, 1, 1,
-1.782615, 0.01070174, -1.232952, 0, 0, 0, 1, 1,
-1.766054, 1.133107, 0.3243092, 0, 0, 0, 1, 1,
-1.712651, -0.7777847, -3.145664, 0, 0, 0, 1, 1,
-1.706185, 0.01453495, -1.116153, 0, 0, 0, 1, 1,
-1.688946, 0.4204963, 0.9062967, 0, 0, 0, 1, 1,
-1.670638, -0.9055228, -1.21838, 0, 0, 0, 1, 1,
-1.662507, -0.199715, -2.49147, 0, 0, 0, 1, 1,
-1.653854, 2.242417, -2.225089, 1, 1, 1, 1, 1,
-1.653451, -0.4013442, -1.264958, 1, 1, 1, 1, 1,
-1.636613, 1.681767, 0.2284125, 1, 1, 1, 1, 1,
-1.619955, 0.3413662, -2.917226, 1, 1, 1, 1, 1,
-1.618078, 0.08980057, -0.1946159, 1, 1, 1, 1, 1,
-1.60134, 1.017704, -0.6130114, 1, 1, 1, 1, 1,
-1.597796, 0.174144, -2.62731, 1, 1, 1, 1, 1,
-1.594027, 0.9193681, -2.484363, 1, 1, 1, 1, 1,
-1.589739, 1.45363, -0.1476958, 1, 1, 1, 1, 1,
-1.570567, -0.05158617, -1.71378, 1, 1, 1, 1, 1,
-1.564956, -1.137795, -2.844664, 1, 1, 1, 1, 1,
-1.558353, -1.146079, -1.910056, 1, 1, 1, 1, 1,
-1.554777, 0.2947254, -1.505938, 1, 1, 1, 1, 1,
-1.543977, 1.226195, -0.9876531, 1, 1, 1, 1, 1,
-1.52152, -0.1409284, -0.240733, 1, 1, 1, 1, 1,
-1.514319, 1.114977, -0.6328746, 0, 0, 1, 1, 1,
-1.509977, -1.207342, -3.802597, 1, 0, 0, 1, 1,
-1.506874, -0.08587834, -0.6654137, 1, 0, 0, 1, 1,
-1.491554, 0.7734437, -1.036522, 1, 0, 0, 1, 1,
-1.484492, -0.5496951, -1.99683, 1, 0, 0, 1, 1,
-1.483045, 3.381273, -1.875641, 1, 0, 0, 1, 1,
-1.481689, 0.593983, -1.046252, 0, 0, 0, 1, 1,
-1.480523, -0.7445653, -2.784764, 0, 0, 0, 1, 1,
-1.479891, 2.122541, 0.242697, 0, 0, 0, 1, 1,
-1.478587, -0.182006, -2.056788, 0, 0, 0, 1, 1,
-1.470686, 1.235625, -1.50113, 0, 0, 0, 1, 1,
-1.46949, 0.2043588, -1.016043, 0, 0, 0, 1, 1,
-1.460785, 1.267685, -2.867544, 0, 0, 0, 1, 1,
-1.458289, -0.5555489, -2.0524, 1, 1, 1, 1, 1,
-1.454231, -0.522121, -2.29451, 1, 1, 1, 1, 1,
-1.44594, 1.282918, -1.355842, 1, 1, 1, 1, 1,
-1.440412, 0.4753849, -0.2816787, 1, 1, 1, 1, 1,
-1.424089, 1.625531, -1.988837, 1, 1, 1, 1, 1,
-1.395107, -1.389128, -1.552735, 1, 1, 1, 1, 1,
-1.387675, -1.155651, -3.069998, 1, 1, 1, 1, 1,
-1.383836, 0.6155245, -0.5213633, 1, 1, 1, 1, 1,
-1.363997, 0.2297565, -0.6252142, 1, 1, 1, 1, 1,
-1.363955, 0.575534, -1.140958, 1, 1, 1, 1, 1,
-1.356413, -0.06221845, -0.8698713, 1, 1, 1, 1, 1,
-1.34665, 0.5814081, -1.625317, 1, 1, 1, 1, 1,
-1.342179, -0.4258316, -2.432369, 1, 1, 1, 1, 1,
-1.337224, -1.241462, -0.982924, 1, 1, 1, 1, 1,
-1.333813, -2.439809, -3.503186, 1, 1, 1, 1, 1,
-1.3296, 0.9827362, 1.121165, 0, 0, 1, 1, 1,
-1.317957, -0.5731421, -1.664319, 1, 0, 0, 1, 1,
-1.312689, -0.09149348, -2.524531, 1, 0, 0, 1, 1,
-1.310355, -1.089987, -1.76535, 1, 0, 0, 1, 1,
-1.308685, 1.714849, -1.681772, 1, 0, 0, 1, 1,
-1.303159, 0.8849862, 1.207661, 1, 0, 0, 1, 1,
-1.295127, 0.4428918, -1.709551, 0, 0, 0, 1, 1,
-1.290064, -0.7017282, -2.712318, 0, 0, 0, 1, 1,
-1.286002, -2.142064, -2.435958, 0, 0, 0, 1, 1,
-1.285675, 0.7158737, -0.4021895, 0, 0, 0, 1, 1,
-1.280782, -0.5432423, -0.07611256, 0, 0, 0, 1, 1,
-1.26891, 0.8836352, -1.093924, 0, 0, 0, 1, 1,
-1.25962, 0.8934712, -1.439385, 0, 0, 0, 1, 1,
-1.255069, -0.5092348, -2.959093, 1, 1, 1, 1, 1,
-1.252738, 0.7319854, -1.450529, 1, 1, 1, 1, 1,
-1.24788, -1.857545, -3.876437, 1, 1, 1, 1, 1,
-1.239689, 0.7343313, -1.748099, 1, 1, 1, 1, 1,
-1.228021, -0.518387, 0.0007593448, 1, 1, 1, 1, 1,
-1.223554, -0.1946415, -1.206169, 1, 1, 1, 1, 1,
-1.21969, -0.9387658, -2.31357, 1, 1, 1, 1, 1,
-1.203843, 1.340295, -0.6344953, 1, 1, 1, 1, 1,
-1.198726, -0.9197745, -2.879595, 1, 1, 1, 1, 1,
-1.198389, 0.08495159, -1.559877, 1, 1, 1, 1, 1,
-1.195827, 0.03872927, -0.3582984, 1, 1, 1, 1, 1,
-1.192564, -0.6278774, -2.923412, 1, 1, 1, 1, 1,
-1.190177, 0.8124135, -1.914515, 1, 1, 1, 1, 1,
-1.189555, 0.5109128, -2.235168, 1, 1, 1, 1, 1,
-1.183977, 0.6726518, 0.1361071, 1, 1, 1, 1, 1,
-1.183814, 1.501815, -0.2743989, 0, 0, 1, 1, 1,
-1.171784, 0.6696956, 1.267523, 1, 0, 0, 1, 1,
-1.171509, -0.5717509, -2.081706, 1, 0, 0, 1, 1,
-1.170253, -0.8264725, -2.285189, 1, 0, 0, 1, 1,
-1.167531, -0.6244069, -1.469675, 1, 0, 0, 1, 1,
-1.165315, -1.071001, -4.311822, 1, 0, 0, 1, 1,
-1.162339, 1.147446, -0.609158, 0, 0, 0, 1, 1,
-1.154146, 0.570125, -1.409931, 0, 0, 0, 1, 1,
-1.144745, 2.015014, 1.101991, 0, 0, 0, 1, 1,
-1.137358, 0.9279601, -0.3889769, 0, 0, 0, 1, 1,
-1.131598, 0.9813466, -2.251031, 0, 0, 0, 1, 1,
-1.131531, -3.624066, -2.791675, 0, 0, 0, 1, 1,
-1.128039, 0.1818815, 0.1536916, 0, 0, 0, 1, 1,
-1.127281, -0.06212198, -3.703322, 1, 1, 1, 1, 1,
-1.121877, -0.5493754, -2.383922, 1, 1, 1, 1, 1,
-1.118056, 0.4225747, -1.27449, 1, 1, 1, 1, 1,
-1.111642, -1.783238, -4.27209, 1, 1, 1, 1, 1,
-1.090926, -0.1685029, -2.146981, 1, 1, 1, 1, 1,
-1.079378, -0.9323063, -3.449362, 1, 1, 1, 1, 1,
-1.076917, -1.635008, -2.967429, 1, 1, 1, 1, 1,
-1.074232, 0.7145695, -1.54046, 1, 1, 1, 1, 1,
-1.073258, -0.9500564, -1.769473, 1, 1, 1, 1, 1,
-1.065997, -1.489976, -3.096855, 1, 1, 1, 1, 1,
-1.064171, 0.84316, -1.258317, 1, 1, 1, 1, 1,
-1.061166, 0.239548, -0.9382908, 1, 1, 1, 1, 1,
-1.055498, -0.509329, -2.30374, 1, 1, 1, 1, 1,
-1.049804, -0.2081635, -3.438274, 1, 1, 1, 1, 1,
-1.048336, -0.5734122, 1.850259, 1, 1, 1, 1, 1,
-1.04544, 0.331976, -0.1094658, 0, 0, 1, 1, 1,
-1.044351, 0.08705114, 0.3882619, 1, 0, 0, 1, 1,
-1.043349, -0.2471469, -3.667543, 1, 0, 0, 1, 1,
-1.041254, -0.6361185, -2.376781, 1, 0, 0, 1, 1,
-1.030633, -0.7775941, -3.854556, 1, 0, 0, 1, 1,
-1.020513, -1.751862, -3.540912, 1, 0, 0, 1, 1,
-1.01955, 1.126828, -0.1028068, 0, 0, 0, 1, 1,
-1.014644, 1.800709, 1.108436, 0, 0, 0, 1, 1,
-1.01344, 1.734241, 0.6637394, 0, 0, 0, 1, 1,
-1.010731, -1.335403, -2.422353, 0, 0, 0, 1, 1,
-1.007162, 0.5495818, -2.033194, 0, 0, 0, 1, 1,
-0.9966897, -0.7045375, -3.033552, 0, 0, 0, 1, 1,
-0.9952812, 0.9015355, -0.4614117, 0, 0, 0, 1, 1,
-0.9951377, 0.5533857, 0.5133856, 1, 1, 1, 1, 1,
-0.9935222, 0.8091959, -0.6147233, 1, 1, 1, 1, 1,
-0.9910443, 0.7556284, -1.604697, 1, 1, 1, 1, 1,
-0.986329, 0.9426609, -1.50176, 1, 1, 1, 1, 1,
-0.9767234, 1.22724, -1.003419, 1, 1, 1, 1, 1,
-0.9751149, 0.1023104, -2.432179, 1, 1, 1, 1, 1,
-0.9735525, -1.017331, -2.207383, 1, 1, 1, 1, 1,
-0.959204, 1.418703, -2.000308, 1, 1, 1, 1, 1,
-0.9585757, -0.284645, -0.5399235, 1, 1, 1, 1, 1,
-0.9552767, 0.06639943, -1.756492, 1, 1, 1, 1, 1,
-0.9552714, -1.710404, -2.316728, 1, 1, 1, 1, 1,
-0.9536359, -0.6477566, -2.144739, 1, 1, 1, 1, 1,
-0.9525504, 0.177708, -1.501802, 1, 1, 1, 1, 1,
-0.9466346, 0.9614068, 0.2449429, 1, 1, 1, 1, 1,
-0.9433287, 1.29788, 0.4994344, 1, 1, 1, 1, 1,
-0.9371402, -0.5696806, -2.673448, 0, 0, 1, 1, 1,
-0.9330363, 0.5279406, -0.1704856, 1, 0, 0, 1, 1,
-0.9301993, 0.920692, 1.208203, 1, 0, 0, 1, 1,
-0.9271725, -0.7444708, -3.658944, 1, 0, 0, 1, 1,
-0.9265883, 0.2509161, -2.133218, 1, 0, 0, 1, 1,
-0.9252336, -1.164891, -1.532005, 1, 0, 0, 1, 1,
-0.920751, -0.6216314, -3.97436, 0, 0, 0, 1, 1,
-0.9155548, 0.2047064, -1.589471, 0, 0, 0, 1, 1,
-0.9144791, 0.603341, 0.2311165, 0, 0, 0, 1, 1,
-0.9135718, 0.2775284, 2.301157, 0, 0, 0, 1, 1,
-0.9131011, 0.6661529, -2.119875, 0, 0, 0, 1, 1,
-0.9102037, -0.03231452, 1.486722, 0, 0, 0, 1, 1,
-0.9094287, 1.445631, -0.8272238, 0, 0, 0, 1, 1,
-0.9086236, -0.3990456, -1.189365, 1, 1, 1, 1, 1,
-0.9011275, -0.5310145, -2.964797, 1, 1, 1, 1, 1,
-0.900816, -0.7670767, -3.155978, 1, 1, 1, 1, 1,
-0.9007982, -0.6282762, -3.078564, 1, 1, 1, 1, 1,
-0.9007691, -0.5678, 0.4326781, 1, 1, 1, 1, 1,
-0.8995104, 1.623082, -0.4588284, 1, 1, 1, 1, 1,
-0.8988332, -0.7442525, -3.628849, 1, 1, 1, 1, 1,
-0.8956599, -1.643631, -1.733181, 1, 1, 1, 1, 1,
-0.8928829, -0.5024512, -1.752088, 1, 1, 1, 1, 1,
-0.888495, 0.3453987, -0.5114055, 1, 1, 1, 1, 1,
-0.8777764, 0.2114262, -0.939402, 1, 1, 1, 1, 1,
-0.8771412, 0.6425816, -1.008451, 1, 1, 1, 1, 1,
-0.8712838, -0.9740648, -1.601023, 1, 1, 1, 1, 1,
-0.8601693, -0.1738386, -1.715602, 1, 1, 1, 1, 1,
-0.8526857, 1.454088, 0.5840449, 1, 1, 1, 1, 1,
-0.8518378, -0.4801955, -0.7490653, 0, 0, 1, 1, 1,
-0.8488089, 0.6537141, -1.272552, 1, 0, 0, 1, 1,
-0.8485239, 2.124222, -0.0568613, 1, 0, 0, 1, 1,
-0.8473123, 1.385504, 0.8782912, 1, 0, 0, 1, 1,
-0.8429767, -1.447366, -2.224403, 1, 0, 0, 1, 1,
-0.841464, 0.3446521, -1.140118, 1, 0, 0, 1, 1,
-0.8394894, -1.082391, -3.694116, 0, 0, 0, 1, 1,
-0.8337069, -0.7193262, -2.588815, 0, 0, 0, 1, 1,
-0.8310466, -0.08537319, -0.3134434, 0, 0, 0, 1, 1,
-0.8272601, 0.5029569, 0.3957118, 0, 0, 0, 1, 1,
-0.8189193, 1.87398, -0.0326712, 0, 0, 0, 1, 1,
-0.8175037, -0.2044124, -2.128838, 0, 0, 0, 1, 1,
-0.8173027, -0.1962539, -3.624809, 0, 0, 0, 1, 1,
-0.8158833, 0.05633899, -3.183917, 1, 1, 1, 1, 1,
-0.8057955, 0.7242287, 0.100685, 1, 1, 1, 1, 1,
-0.8055326, 0.3945992, -2.152161, 1, 1, 1, 1, 1,
-0.8039601, 0.3078696, -0.3292269, 1, 1, 1, 1, 1,
-0.8036498, 0.9628597, 1.228978, 1, 1, 1, 1, 1,
-0.8006386, 1.942197, 0.7071137, 1, 1, 1, 1, 1,
-0.7941832, -1.401426, -3.421703, 1, 1, 1, 1, 1,
-0.793663, -0.3538435, -1.886526, 1, 1, 1, 1, 1,
-0.7918667, 0.1016095, -0.6681144, 1, 1, 1, 1, 1,
-0.7904681, 1.294197, -2.398268, 1, 1, 1, 1, 1,
-0.7895829, 0.3897696, -2.146934, 1, 1, 1, 1, 1,
-0.7792637, 0.3621472, -0.1255908, 1, 1, 1, 1, 1,
-0.7790277, 0.09715139, -1.080349, 1, 1, 1, 1, 1,
-0.7767307, 0.02438707, -2.604549, 1, 1, 1, 1, 1,
-0.7722709, 0.7437393, -0.06422418, 1, 1, 1, 1, 1,
-0.7704338, 0.6030501, 0.2389511, 0, 0, 1, 1, 1,
-0.7700896, 0.6299362, -0.1905927, 1, 0, 0, 1, 1,
-0.7594806, 0.5200868, -1.232548, 1, 0, 0, 1, 1,
-0.758262, 0.008864609, -0.8284655, 1, 0, 0, 1, 1,
-0.7561405, 0.06689604, -1.310922, 1, 0, 0, 1, 1,
-0.7547433, 0.5629459, -0.4569891, 1, 0, 0, 1, 1,
-0.7502891, 0.8204662, -1.467532, 0, 0, 0, 1, 1,
-0.7469233, 0.1894112, -0.1974324, 0, 0, 0, 1, 1,
-0.7454937, 0.7286858, -0.9556165, 0, 0, 0, 1, 1,
-0.7383639, -0.2524079, -1.944846, 0, 0, 0, 1, 1,
-0.7367444, 0.5436302, -1.307429, 0, 0, 0, 1, 1,
-0.7279059, 2.041251, -0.8904377, 0, 0, 0, 1, 1,
-0.7257321, -1.217446, -1.681055, 0, 0, 0, 1, 1,
-0.7233837, -1.464183, -3.442046, 1, 1, 1, 1, 1,
-0.7164682, -0.1573842, -3.39718, 1, 1, 1, 1, 1,
-0.7094055, 0.7661091, 0.1008959, 1, 1, 1, 1, 1,
-0.7042567, -1.241217, -3.274491, 1, 1, 1, 1, 1,
-0.7016766, 1.154692, -1.331641, 1, 1, 1, 1, 1,
-0.6998352, -0.1959484, -2.955125, 1, 1, 1, 1, 1,
-0.6993807, 0.4945685, 0.3179196, 1, 1, 1, 1, 1,
-0.6992728, 0.2299956, -0.3983266, 1, 1, 1, 1, 1,
-0.6981477, -0.4438551, -1.10952, 1, 1, 1, 1, 1,
-0.6916503, 0.8208122, -1.855644, 1, 1, 1, 1, 1,
-0.690449, 1.376368, 0.2098534, 1, 1, 1, 1, 1,
-0.689553, -1.004186, -1.906979, 1, 1, 1, 1, 1,
-0.6877102, 1.060296, -0.6520496, 1, 1, 1, 1, 1,
-0.6850409, 0.4523962, -0.6015714, 1, 1, 1, 1, 1,
-0.6836853, -1.583042, -0.6361135, 1, 1, 1, 1, 1,
-0.6682201, 1.199208, 1.164918, 0, 0, 1, 1, 1,
-0.6654645, 0.1358981, -0.6960034, 1, 0, 0, 1, 1,
-0.662739, -1.717141, -3.454572, 1, 0, 0, 1, 1,
-0.6604136, 0.107337, -1.030708, 1, 0, 0, 1, 1,
-0.658523, 0.09197441, 0.7576539, 1, 0, 0, 1, 1,
-0.655171, -0.6489616, -1.330615, 1, 0, 0, 1, 1,
-0.6538036, -0.2147371, -3.256753, 0, 0, 0, 1, 1,
-0.6522997, -0.04765131, -2.040978, 0, 0, 0, 1, 1,
-0.6439348, 0.1352255, -1.048736, 0, 0, 0, 1, 1,
-0.6394724, 1.02741, -0.3694587, 0, 0, 0, 1, 1,
-0.6381002, 0.501982, -0.7933645, 0, 0, 0, 1, 1,
-0.6356604, 0.03558463, -1.057842, 0, 0, 0, 1, 1,
-0.63191, 0.5358133, -0.3040774, 0, 0, 0, 1, 1,
-0.63095, -0.9220884, -3.498855, 1, 1, 1, 1, 1,
-0.6289076, -1.368478, -1.10483, 1, 1, 1, 1, 1,
-0.6268457, -1.389786, -1.844959, 1, 1, 1, 1, 1,
-0.6238527, 2.073611, 0.279458, 1, 1, 1, 1, 1,
-0.6204275, 0.1509124, -2.251388, 1, 1, 1, 1, 1,
-0.6166449, -1.303671, -3.239054, 1, 1, 1, 1, 1,
-0.6133298, 1.214986, 0.9266238, 1, 1, 1, 1, 1,
-0.6036749, -0.02116506, -1.210297, 1, 1, 1, 1, 1,
-0.6035044, -0.2222436, -3.897062, 1, 1, 1, 1, 1,
-0.6010187, -0.01343214, -2.783565, 1, 1, 1, 1, 1,
-0.600695, -1.713417, -2.834153, 1, 1, 1, 1, 1,
-0.6002726, -0.60982, -3.898588, 1, 1, 1, 1, 1,
-0.5997415, -0.612491, -2.31021, 1, 1, 1, 1, 1,
-0.5993507, -1.443379, -2.88478, 1, 1, 1, 1, 1,
-0.5955094, -0.2174588, -1.795837, 1, 1, 1, 1, 1,
-0.5954392, -1.901941, -2.811978, 0, 0, 1, 1, 1,
-0.5912789, 0.4986315, -2.162586, 1, 0, 0, 1, 1,
-0.5838311, -0.232339, -2.042826, 1, 0, 0, 1, 1,
-0.5821295, 1.228224, 0.06392419, 1, 0, 0, 1, 1,
-0.5805489, -0.8190545, -2.146948, 1, 0, 0, 1, 1,
-0.5789027, 0.9247497, 0.5647435, 1, 0, 0, 1, 1,
-0.578162, 1.207563, -0.1967445, 0, 0, 0, 1, 1,
-0.5781363, -0.6051363, -4.477238, 0, 0, 0, 1, 1,
-0.5775807, -0.07692017, 0.04609631, 0, 0, 0, 1, 1,
-0.5754979, 0.7135985, -2.578059, 0, 0, 0, 1, 1,
-0.5704789, 1.16942, -2.105064, 0, 0, 0, 1, 1,
-0.5701846, -1.619099, -2.200517, 0, 0, 0, 1, 1,
-0.5690014, -1.085566, -1.033587, 0, 0, 0, 1, 1,
-0.5663251, -0.6105824, -2.068438, 1, 1, 1, 1, 1,
-0.5662337, -0.1522881, -1.617991, 1, 1, 1, 1, 1,
-0.5651526, -0.07057979, -1.541955, 1, 1, 1, 1, 1,
-0.5617127, 0.1685064, -1.147961, 1, 1, 1, 1, 1,
-0.5607744, -0.6684585, -2.872078, 1, 1, 1, 1, 1,
-0.5605095, -0.6665515, -2.932143, 1, 1, 1, 1, 1,
-0.5577345, 0.6519442, -0.5449588, 1, 1, 1, 1, 1,
-0.5557126, -0.7127923, -4.232862, 1, 1, 1, 1, 1,
-0.5510358, -0.6182733, -3.48085, 1, 1, 1, 1, 1,
-0.5498273, 0.6777829, -0.8644336, 1, 1, 1, 1, 1,
-0.5454803, 0.2191175, -0.733753, 1, 1, 1, 1, 1,
-0.5450779, 0.5406456, -1.985629, 1, 1, 1, 1, 1,
-0.5410921, 0.07599653, -1.093652, 1, 1, 1, 1, 1,
-0.5396856, -2.620136, -2.916535, 1, 1, 1, 1, 1,
-0.5384952, -0.805187, -3.022052, 1, 1, 1, 1, 1,
-0.5383046, 0.886366, 1.350707, 0, 0, 1, 1, 1,
-0.5381371, -0.1609547, -2.113582, 1, 0, 0, 1, 1,
-0.536294, 0.7932811, -1.234027, 1, 0, 0, 1, 1,
-0.5352122, -0.4168644, -0.4490026, 1, 0, 0, 1, 1,
-0.534057, 1.033735, 1.401852, 1, 0, 0, 1, 1,
-0.533229, 0.6841536, -0.4879915, 1, 0, 0, 1, 1,
-0.5330856, -0.1448528, -4.03471, 0, 0, 0, 1, 1,
-0.5322564, -1.329782, -3.200838, 0, 0, 0, 1, 1,
-0.5247489, -0.6367786, -2.493412, 0, 0, 0, 1, 1,
-0.5239936, -0.1820475, -2.210113, 0, 0, 0, 1, 1,
-0.518709, -0.2916653, -2.38779, 0, 0, 0, 1, 1,
-0.5046625, 0.305375, -2.541935, 0, 0, 0, 1, 1,
-0.5033767, 0.6557765, -0.08394518, 0, 0, 0, 1, 1,
-0.4970078, -0.517326, -3.063251, 1, 1, 1, 1, 1,
-0.4915036, -0.2097874, -0.7765078, 1, 1, 1, 1, 1,
-0.4914877, -0.8262359, -1.917169, 1, 1, 1, 1, 1,
-0.4909358, -0.04809977, -0.8111272, 1, 1, 1, 1, 1,
-0.4858464, 0.2064712, -1.239373, 1, 1, 1, 1, 1,
-0.4806609, 1.340174, 0.3193456, 1, 1, 1, 1, 1,
-0.4753629, -0.2105993, -2.064412, 1, 1, 1, 1, 1,
-0.4746635, -1.069838, -3.822424, 1, 1, 1, 1, 1,
-0.470902, 1.826383, 1.224024, 1, 1, 1, 1, 1,
-0.4687034, 0.1644942, -2.577564, 1, 1, 1, 1, 1,
-0.4678943, -0.197879, -0.4227892, 1, 1, 1, 1, 1,
-0.464906, 1.650102, -0.3029498, 1, 1, 1, 1, 1,
-0.46244, 0.9150932, -0.5835967, 1, 1, 1, 1, 1,
-0.4564677, 0.6046818, -0.02512365, 1, 1, 1, 1, 1,
-0.455248, 1.591754, -2.253538, 1, 1, 1, 1, 1,
-0.4480569, -0.9188168, -2.204951, 0, 0, 1, 1, 1,
-0.4382054, -0.01503156, -1.871691, 1, 0, 0, 1, 1,
-0.4364618, 0.1756201, -3.843888, 1, 0, 0, 1, 1,
-0.4352052, 1.362004, -0.701471, 1, 0, 0, 1, 1,
-0.434424, 1.972951, -0.5206472, 1, 0, 0, 1, 1,
-0.4340249, -0.2705684, -1.745572, 1, 0, 0, 1, 1,
-0.4313345, 0.4785242, -0.3874225, 0, 0, 0, 1, 1,
-0.4271947, 0.2192186, -1.170674, 0, 0, 0, 1, 1,
-0.4196244, -0.3046687, -0.8972688, 0, 0, 0, 1, 1,
-0.4157617, 1.278617, -0.2541294, 0, 0, 0, 1, 1,
-0.4143437, 1.324035, -0.9593235, 0, 0, 0, 1, 1,
-0.4062181, 2.447805, 0.09118235, 0, 0, 0, 1, 1,
-0.4058336, 1.775078, 0.3358956, 0, 0, 0, 1, 1,
-0.4056589, 0.8607675, -0.808823, 1, 1, 1, 1, 1,
-0.4056529, -2.055763, -3.315195, 1, 1, 1, 1, 1,
-0.403567, 0.7954524, 1.273605, 1, 1, 1, 1, 1,
-0.4034896, -2.030257, -3.002894, 1, 1, 1, 1, 1,
-0.3997982, 0.227353, -2.003667, 1, 1, 1, 1, 1,
-0.399158, 0.1523849, -1.196011, 1, 1, 1, 1, 1,
-0.3962819, -0.5505946, -3.055017, 1, 1, 1, 1, 1,
-0.3944678, 0.6366343, -0.8058816, 1, 1, 1, 1, 1,
-0.3892326, 1.785846, -1.678858, 1, 1, 1, 1, 1,
-0.3881179, -0.1021041, -0.2169809, 1, 1, 1, 1, 1,
-0.3842455, -1.022117, -2.638365, 1, 1, 1, 1, 1,
-0.3679869, -0.6863351, -1.385943, 1, 1, 1, 1, 1,
-0.3613398, -0.1846528, -2.346157, 1, 1, 1, 1, 1,
-0.3607175, 0.2802413, -1.521655, 1, 1, 1, 1, 1,
-0.3576337, 0.2867473, -1.545122, 1, 1, 1, 1, 1,
-0.3569721, 0.5370296, -1.043221, 0, 0, 1, 1, 1,
-0.3552303, -0.005982495, -0.5147678, 1, 0, 0, 1, 1,
-0.3523869, -0.3370314, -2.218048, 1, 0, 0, 1, 1,
-0.3495839, -0.1059288, -3.165181, 1, 0, 0, 1, 1,
-0.3472044, -0.9191877, -2.32823, 1, 0, 0, 1, 1,
-0.3459373, -2.301926, -5.195817, 1, 0, 0, 1, 1,
-0.3372421, 1.901021, 0.5012956, 0, 0, 0, 1, 1,
-0.3350554, 0.3390583, 0.2893964, 0, 0, 0, 1, 1,
-0.3346519, -0.3151949, -2.789172, 0, 0, 0, 1, 1,
-0.3336354, -1.353538, -1.914522, 0, 0, 0, 1, 1,
-0.3293193, 0.0458286, -1.391552, 0, 0, 0, 1, 1,
-0.3280879, -0.5759832, -0.4879964, 0, 0, 0, 1, 1,
-0.3177631, -0.1835413, -2.159742, 0, 0, 0, 1, 1,
-0.3165869, 1.156883, 0.05011971, 1, 1, 1, 1, 1,
-0.3081112, -0.8613122, -0.834138, 1, 1, 1, 1, 1,
-0.3021145, 0.4994581, -0.9230602, 1, 1, 1, 1, 1,
-0.3012226, -1.946749, -3.613735, 1, 1, 1, 1, 1,
-0.3005979, 1.722591, 0.2275557, 1, 1, 1, 1, 1,
-0.2966867, -0.1887553, -1.275175, 1, 1, 1, 1, 1,
-0.2961692, -0.3042102, -2.232857, 1, 1, 1, 1, 1,
-0.2946408, -0.03480145, -1.780661, 1, 1, 1, 1, 1,
-0.2945012, 0.1659237, -2.400085, 1, 1, 1, 1, 1,
-0.2931298, 1.595687, -1.36785, 1, 1, 1, 1, 1,
-0.2928035, 0.510453, -0.02333378, 1, 1, 1, 1, 1,
-0.2917602, 2.350131, 1.712092, 1, 1, 1, 1, 1,
-0.2898616, 0.3713472, -0.5841835, 1, 1, 1, 1, 1,
-0.2897896, 0.3595914, -0.1471454, 1, 1, 1, 1, 1,
-0.288085, -1.038058, -3.798248, 1, 1, 1, 1, 1,
-0.2875946, 0.09081291, -1.627531, 0, 0, 1, 1, 1,
-0.2847576, 1.641384, 0.3044596, 1, 0, 0, 1, 1,
-0.2844024, -1.82347, -1.09948, 1, 0, 0, 1, 1,
-0.2836003, -1.422197, -2.414054, 1, 0, 0, 1, 1,
-0.2807806, 1.293452, 0.584859, 1, 0, 0, 1, 1,
-0.2806915, -1.127921, -2.749906, 1, 0, 0, 1, 1,
-0.2794642, -0.1877819, -2.663303, 0, 0, 0, 1, 1,
-0.2789778, 0.9864087, -0.3489156, 0, 0, 0, 1, 1,
-0.2779129, 2.007266, -1.481539, 0, 0, 0, 1, 1,
-0.2735393, 0.8758246, 2.204134, 0, 0, 0, 1, 1,
-0.2698773, -0.7392607, -3.13329, 0, 0, 0, 1, 1,
-0.2646625, -2.346572, -4.149209, 0, 0, 0, 1, 1,
-0.2619061, -0.828862, -1.521849, 0, 0, 0, 1, 1,
-0.2616794, -0.3988605, -3.238361, 1, 1, 1, 1, 1,
-0.2608381, -1.444421, -3.514294, 1, 1, 1, 1, 1,
-0.2598276, -1.041225, -4.660265, 1, 1, 1, 1, 1,
-0.2584687, -2.128681, -3.078138, 1, 1, 1, 1, 1,
-0.2523125, -0.04073217, -3.522893, 1, 1, 1, 1, 1,
-0.2507225, 1.44535, -2.21646, 1, 1, 1, 1, 1,
-0.2484136, -0.8849671, -3.402075, 1, 1, 1, 1, 1,
-0.2472233, -1.172721, -4.517115, 1, 1, 1, 1, 1,
-0.2427107, 0.9667078, 0.945177, 1, 1, 1, 1, 1,
-0.2397402, -0.004905463, -2.465545, 1, 1, 1, 1, 1,
-0.2361828, -0.318299, -1.360442, 1, 1, 1, 1, 1,
-0.2360336, 0.8740114, -1.024066, 1, 1, 1, 1, 1,
-0.2314343, -0.3975734, -2.964977, 1, 1, 1, 1, 1,
-0.2267551, -0.9125711, -3.236172, 1, 1, 1, 1, 1,
-0.2205952, -0.2821914, -4.042569, 1, 1, 1, 1, 1,
-0.2178255, 1.739368, 0.2597155, 0, 0, 1, 1, 1,
-0.2142844, 0.8076595, -0.9895162, 1, 0, 0, 1, 1,
-0.2129634, 1.616935, -0.05858864, 1, 0, 0, 1, 1,
-0.2117754, 0.6517469, 1.031316, 1, 0, 0, 1, 1,
-0.2092292, 1.960168, 1.332564, 1, 0, 0, 1, 1,
-0.2072006, 0.8456015, 1.610532, 1, 0, 0, 1, 1,
-0.2067621, -1.181711, -2.226248, 0, 0, 0, 1, 1,
-0.2013806, 1.410713, 0.1275697, 0, 0, 0, 1, 1,
-0.2003627, 0.8535769, 0.7315757, 0, 0, 0, 1, 1,
-0.1997029, 0.6985415, 0.5950503, 0, 0, 0, 1, 1,
-0.1987025, 0.2217051, -1.257925, 0, 0, 0, 1, 1,
-0.1982687, 0.878969, -0.2053181, 0, 0, 0, 1, 1,
-0.1859031, 0.3650298, -0.4753697, 0, 0, 0, 1, 1,
-0.182324, -1.097437, -2.582319, 1, 1, 1, 1, 1,
-0.1814112, -0.3550864, -3.059194, 1, 1, 1, 1, 1,
-0.1812263, -0.8196841, -3.948596, 1, 1, 1, 1, 1,
-0.1787807, 0.236495, -0.7578535, 1, 1, 1, 1, 1,
-0.1782715, 2.275044, -0.1052486, 1, 1, 1, 1, 1,
-0.1732726, 0.2187256, -2.224266, 1, 1, 1, 1, 1,
-0.1729147, -1.143668, -2.97146, 1, 1, 1, 1, 1,
-0.1722795, -0.3797636, -1.976087, 1, 1, 1, 1, 1,
-0.1662934, -0.3418681, -0.7967704, 1, 1, 1, 1, 1,
-0.1580999, 1.028636, -0.64112, 1, 1, 1, 1, 1,
-0.1572646, 0.945063, 1.277558, 1, 1, 1, 1, 1,
-0.1484841, 1.18569, -1.424219, 1, 1, 1, 1, 1,
-0.1446583, 0.8432798, -1.247521, 1, 1, 1, 1, 1,
-0.1425295, -1.106725, -2.668019, 1, 1, 1, 1, 1,
-0.1420796, 0.1812585, -0.7699745, 1, 1, 1, 1, 1,
-0.1405808, 1.905814, -0.4822067, 0, 0, 1, 1, 1,
-0.136751, 0.2103204, -1.15115, 1, 0, 0, 1, 1,
-0.1345908, 0.01259622, -0.3826795, 1, 0, 0, 1, 1,
-0.1331603, -0.8291107, -2.87176, 1, 0, 0, 1, 1,
-0.1331466, -0.0932778, -2.820463, 1, 0, 0, 1, 1,
-0.1328394, 0.3067203, -1.052824, 1, 0, 0, 1, 1,
-0.1319544, 0.3181333, 1.476917, 0, 0, 0, 1, 1,
-0.1309154, -0.6117565, -3.89969, 0, 0, 0, 1, 1,
-0.125087, 0.5080652, -0.708152, 0, 0, 0, 1, 1,
-0.1242759, -1.006487, -3.729604, 0, 0, 0, 1, 1,
-0.1230305, 1.666292, 0.7714387, 0, 0, 0, 1, 1,
-0.1198504, 0.01623809, -0.503726, 0, 0, 0, 1, 1,
-0.1193599, -0.3077988, -3.448355, 0, 0, 0, 1, 1,
-0.1178805, 0.0775132, 0.06649971, 1, 1, 1, 1, 1,
-0.1063076, -0.990069, -3.252389, 1, 1, 1, 1, 1,
-0.1035198, 0.03063236, -1.574845, 1, 1, 1, 1, 1,
-0.1030549, -0.2705521, -1.542318, 1, 1, 1, 1, 1,
-0.086836, -0.8307981, -3.53465, 1, 1, 1, 1, 1,
-0.08415499, 0.3034144, -0.4235326, 1, 1, 1, 1, 1,
-0.07939368, -0.8990517, -2.608635, 1, 1, 1, 1, 1,
-0.07853631, -1.694476, -2.498094, 1, 1, 1, 1, 1,
-0.07653573, 0.6671475, -0.2067709, 1, 1, 1, 1, 1,
-0.07362854, -3.075281, -1.877681, 1, 1, 1, 1, 1,
-0.06891043, 0.3286209, 1.168213, 1, 1, 1, 1, 1,
-0.06813388, 0.2916632, -0.2780924, 1, 1, 1, 1, 1,
-0.06499372, -1.443989, -3.998446, 1, 1, 1, 1, 1,
-0.06413255, 0.4932116, -0.5080821, 1, 1, 1, 1, 1,
-0.05549785, 0.9527153, -1.593975, 1, 1, 1, 1, 1,
-0.05499325, 0.8495129, 0.1923998, 0, 0, 1, 1, 1,
-0.05406449, -0.295684, -2.223848, 1, 0, 0, 1, 1,
-0.05205322, -1.602931, -3.266526, 1, 0, 0, 1, 1,
-0.04987963, 0.9215385, 0.1174589, 1, 0, 0, 1, 1,
-0.0488189, 0.07627197, -2.243525, 1, 0, 0, 1, 1,
-0.04076578, -0.7373693, -3.718305, 1, 0, 0, 1, 1,
-0.0403019, 2.186886, -0.6097658, 0, 0, 0, 1, 1,
-0.03448632, 0.839792, 0.4823979, 0, 0, 0, 1, 1,
-0.03397251, 1.674126, 0.4574812, 0, 0, 0, 1, 1,
-0.03133948, 0.5691836, 0.6690716, 0, 0, 0, 1, 1,
-0.0303166, 2.030531, -0.4068228, 0, 0, 0, 1, 1,
-0.02950968, 0.7496274, 1.645926, 0, 0, 0, 1, 1,
-0.02898116, -0.6900599, -0.5857517, 0, 0, 0, 1, 1,
-0.02734996, -0.4987569, -2.274171, 1, 1, 1, 1, 1,
-0.02558997, 1.488073, -0.6014617, 1, 1, 1, 1, 1,
-0.0229033, 1.115412, 1.723449, 1, 1, 1, 1, 1,
-0.02245697, 0.5793598, -0.7034703, 1, 1, 1, 1, 1,
-0.02063688, -0.4784808, -4.1079, 1, 1, 1, 1, 1,
-0.01906097, -1.402905, -2.71361, 1, 1, 1, 1, 1,
-0.01525535, -0.5527313, -4.506429, 1, 1, 1, 1, 1,
-0.01388164, 0.09220657, -1.151933, 1, 1, 1, 1, 1,
-0.007034115, -0.2944665, -3.368672, 1, 1, 1, 1, 1,
-0.004654424, -0.2917762, -4.025964, 1, 1, 1, 1, 1,
0.006169486, -1.295191, 2.851458, 1, 1, 1, 1, 1,
0.006606799, -0.7474114, 3.004593, 1, 1, 1, 1, 1,
0.00682578, -0.4091421, 3.365412, 1, 1, 1, 1, 1,
0.009401429, 0.2865435, -0.02477291, 1, 1, 1, 1, 1,
0.009418855, 0.2074189, 0.2193988, 1, 1, 1, 1, 1,
0.01144109, -2.06951, 3.238713, 0, 0, 1, 1, 1,
0.01187178, -0.681075, 2.907662, 1, 0, 0, 1, 1,
0.01340655, -0.6213362, 3.386121, 1, 0, 0, 1, 1,
0.01489586, -1.541623, 3.33245, 1, 0, 0, 1, 1,
0.01676106, -1.718993, 2.932298, 1, 0, 0, 1, 1,
0.01733502, 0.3493548, -0.6872557, 1, 0, 0, 1, 1,
0.01889343, -0.2269247, 4.047811, 0, 0, 0, 1, 1,
0.01976429, -0.2496968, 4.026143, 0, 0, 0, 1, 1,
0.02143413, 1.345683, -1.116863, 0, 0, 0, 1, 1,
0.02295832, 1.265691, -0.5792386, 0, 0, 0, 1, 1,
0.02318779, -0.6061019, 2.519391, 0, 0, 0, 1, 1,
0.02734064, -1.360662, 1.549876, 0, 0, 0, 1, 1,
0.02841362, 1.173213, 1.536903, 0, 0, 0, 1, 1,
0.03056368, 0.1560481, -0.6548341, 1, 1, 1, 1, 1,
0.03247036, 0.6391392, -0.9622159, 1, 1, 1, 1, 1,
0.03272451, 1.963755, -0.3864472, 1, 1, 1, 1, 1,
0.03343288, -0.3779712, 2.625739, 1, 1, 1, 1, 1,
0.03388355, 1.196262, -0.003180421, 1, 1, 1, 1, 1,
0.03406701, 1.208212, -0.8318816, 1, 1, 1, 1, 1,
0.03676449, -0.4756153, 1.804069, 1, 1, 1, 1, 1,
0.03794302, -0.4820503, 3.926156, 1, 1, 1, 1, 1,
0.03869705, 0.7847901, -1.39886, 1, 1, 1, 1, 1,
0.03912336, -0.1317662, 2.824941, 1, 1, 1, 1, 1,
0.04106, -0.5546383, 2.410298, 1, 1, 1, 1, 1,
0.04294741, 0.05633942, 1.07984, 1, 1, 1, 1, 1,
0.04335908, -0.2906867, 4.186196, 1, 1, 1, 1, 1,
0.04639491, -0.7687168, 4.157859, 1, 1, 1, 1, 1,
0.04643834, 1.647252, 0.493203, 1, 1, 1, 1, 1,
0.05071215, -0.1113011, 2.31611, 0, 0, 1, 1, 1,
0.05958706, -1.062041, 2.611742, 1, 0, 0, 1, 1,
0.0604111, -0.1679736, 1.517216, 1, 0, 0, 1, 1,
0.06154112, 0.1063996, 0.8130013, 1, 0, 0, 1, 1,
0.06179006, -1.783517, 1.162239, 1, 0, 0, 1, 1,
0.06251755, -1.332152, 2.640336, 1, 0, 0, 1, 1,
0.0634008, -0.5875436, 2.97853, 0, 0, 0, 1, 1,
0.06542709, -0.180877, 1.768555, 0, 0, 0, 1, 1,
0.0697915, -0.8108317, 3.26909, 0, 0, 0, 1, 1,
0.07081271, -1.349023, 3.594906, 0, 0, 0, 1, 1,
0.07107794, 0.581284, 1.800349, 0, 0, 0, 1, 1,
0.07120986, -0.03317391, 1.666238, 0, 0, 0, 1, 1,
0.07739154, -0.873071, 3.971785, 0, 0, 0, 1, 1,
0.07901779, 1.63652, -0.7498165, 1, 1, 1, 1, 1,
0.07938129, -1.014384, 1.867575, 1, 1, 1, 1, 1,
0.08254935, -0.3408196, 2.412479, 1, 1, 1, 1, 1,
0.08266459, -0.2563324, 1.510542, 1, 1, 1, 1, 1,
0.08337296, 2.989266, -0.6572704, 1, 1, 1, 1, 1,
0.0850965, -0.9139581, 3.710914, 1, 1, 1, 1, 1,
0.08545948, -0.4250194, 2.647203, 1, 1, 1, 1, 1,
0.08646424, 1.041549, 0.01182137, 1, 1, 1, 1, 1,
0.0883855, 1.474101, 0.8179937, 1, 1, 1, 1, 1,
0.09033398, 0.1393282, 0.2233302, 1, 1, 1, 1, 1,
0.09295408, -2.243809, 4.111443, 1, 1, 1, 1, 1,
0.09466869, -0.8774266, 2.652702, 1, 1, 1, 1, 1,
0.09504815, -0.9466084, 2.245041, 1, 1, 1, 1, 1,
0.09532083, -0.8474141, 3.531471, 1, 1, 1, 1, 1,
0.09900857, 1.228215, -0.8302918, 1, 1, 1, 1, 1,
0.1004453, -0.5863455, 2.900856, 0, 0, 1, 1, 1,
0.1055824, -0.9546675, 2.506286, 1, 0, 0, 1, 1,
0.1118717, -2.015924, 3.482612, 1, 0, 0, 1, 1,
0.1126707, -0.5114619, 2.60427, 1, 0, 0, 1, 1,
0.117127, -0.1846705, 2.254972, 1, 0, 0, 1, 1,
0.1201586, -0.5622766, 2.289512, 1, 0, 0, 1, 1,
0.1215399, -0.2741564, 1.701849, 0, 0, 0, 1, 1,
0.1234779, -1.115652, 2.879936, 0, 0, 0, 1, 1,
0.1237102, -0.005968771, 0.1279018, 0, 0, 0, 1, 1,
0.1262385, 0.05436511, 0.295069, 0, 0, 0, 1, 1,
0.1279305, 2.232315, 1.862553, 0, 0, 0, 1, 1,
0.1300353, 0.4986943, 0.1628439, 0, 0, 0, 1, 1,
0.1342738, 0.8204064, 1.580945, 0, 0, 0, 1, 1,
0.1404888, 0.3512787, 1.547126, 1, 1, 1, 1, 1,
0.1433901, -0.3106593, 1.507721, 1, 1, 1, 1, 1,
0.1458072, 0.8708882, 2.033009, 1, 1, 1, 1, 1,
0.1483924, 0.008395629, 1.263618, 1, 1, 1, 1, 1,
0.1492697, 0.2696745, -0.1801608, 1, 1, 1, 1, 1,
0.1508481, -0.1360162, 3.830412, 1, 1, 1, 1, 1,
0.1518544, -0.4999086, 4.809807, 1, 1, 1, 1, 1,
0.1521667, 0.9128138, -0.3002194, 1, 1, 1, 1, 1,
0.1552238, -0.5809366, 1.514924, 1, 1, 1, 1, 1,
0.1588859, -0.9074479, 2.842826, 1, 1, 1, 1, 1,
0.1706584, 0.7505338, 1.109173, 1, 1, 1, 1, 1,
0.1709605, -0.8295508, 3.081232, 1, 1, 1, 1, 1,
0.1788419, -1.267216, 3.815446, 1, 1, 1, 1, 1,
0.1824335, -0.2906308, 3.598844, 1, 1, 1, 1, 1,
0.1835446, 2.591649, 1.135765, 1, 1, 1, 1, 1,
0.1865723, 0.7912228, -1.402302, 0, 0, 1, 1, 1,
0.190762, 0.2403711, 1.94273, 1, 0, 0, 1, 1,
0.1938248, -0.7156408, 4.147322, 1, 0, 0, 1, 1,
0.1951171, 0.8230189, 2.153881, 1, 0, 0, 1, 1,
0.195174, -0.1786175, 1.626053, 1, 0, 0, 1, 1,
0.2042075, -0.3515582, 2.157556, 1, 0, 0, 1, 1,
0.2044508, 1.854995, -0.3218319, 0, 0, 0, 1, 1,
0.2064486, -0.2732204, 2.437511, 0, 0, 0, 1, 1,
0.2090622, 1.892734, 2.09517, 0, 0, 0, 1, 1,
0.2175747, 0.6653864, 0.6539189, 0, 0, 0, 1, 1,
0.2200596, -0.9248988, 3.057379, 0, 0, 0, 1, 1,
0.221816, 0.5178618, 1.737113, 0, 0, 0, 1, 1,
0.2243544, -0.6223105, 3.549539, 0, 0, 0, 1, 1,
0.2248685, -0.363606, 2.06431, 1, 1, 1, 1, 1,
0.2278357, -0.721081, 1.819959, 1, 1, 1, 1, 1,
0.235052, -0.3850961, 2.768988, 1, 1, 1, 1, 1,
0.236998, -0.3192646, 2.205401, 1, 1, 1, 1, 1,
0.2407337, -0.03507672, 1.497087, 1, 1, 1, 1, 1,
0.242637, -0.1119848, 3.309438, 1, 1, 1, 1, 1,
0.2458066, -0.5942408, 2.810104, 1, 1, 1, 1, 1,
0.2488067, 1.60538, 1.23369, 1, 1, 1, 1, 1,
0.2567635, 0.03506291, 2.611217, 1, 1, 1, 1, 1,
0.2570548, -0.3722007, 3.05056, 1, 1, 1, 1, 1,
0.2588646, 1.609609, -0.422277, 1, 1, 1, 1, 1,
0.2630726, -0.02421516, 2.784399, 1, 1, 1, 1, 1,
0.264431, -0.5146422, 2.653411, 1, 1, 1, 1, 1,
0.2648506, -1.106539, 3.409477, 1, 1, 1, 1, 1,
0.2654881, 0.3865549, 0.3646001, 1, 1, 1, 1, 1,
0.2673, -0.7006317, 2.257994, 0, 0, 1, 1, 1,
0.2692767, 0.1012965, 2.535266, 1, 0, 0, 1, 1,
0.2711128, 2.216667, 0.381051, 1, 0, 0, 1, 1,
0.2724639, -1.022955, 2.222452, 1, 0, 0, 1, 1,
0.2727886, -0.3879865, 3.673984, 1, 0, 0, 1, 1,
0.2781951, -0.8812966, 2.981726, 1, 0, 0, 1, 1,
0.2835655, -0.6379687, 2.971651, 0, 0, 0, 1, 1,
0.2844268, 0.2152465, 0.1674616, 0, 0, 0, 1, 1,
0.2854759, 0.2451053, 0.5321759, 0, 0, 0, 1, 1,
0.2886119, -0.6924183, 4.224417, 0, 0, 0, 1, 1,
0.2904898, 1.129699, 0.5614652, 0, 0, 0, 1, 1,
0.2905674, -0.2937228, 3.139872, 0, 0, 0, 1, 1,
0.2958639, 1.954445, 0.3859881, 0, 0, 0, 1, 1,
0.296524, 1.959811, -1.257529, 1, 1, 1, 1, 1,
0.299188, 0.4339052, 0.1202874, 1, 1, 1, 1, 1,
0.3016103, -0.8980379, 4.248824, 1, 1, 1, 1, 1,
0.3027454, -0.7763036, 2.699405, 1, 1, 1, 1, 1,
0.3028192, 0.4813653, 1.698703, 1, 1, 1, 1, 1,
0.3032267, 0.7940383, 1.35688, 1, 1, 1, 1, 1,
0.3040862, 1.127857, 0.1867709, 1, 1, 1, 1, 1,
0.3051012, 0.4990118, 0.5323267, 1, 1, 1, 1, 1,
0.3067179, 0.6309037, -0.4366081, 1, 1, 1, 1, 1,
0.3084996, -2.165354, 4.256211, 1, 1, 1, 1, 1,
0.3097568, -0.421157, 1.328796, 1, 1, 1, 1, 1,
0.3110748, -0.07855015, 1.541848, 1, 1, 1, 1, 1,
0.3143234, -0.5516109, 1.489856, 1, 1, 1, 1, 1,
0.317938, -0.5622152, 3.933809, 1, 1, 1, 1, 1,
0.3217853, 0.8390002, 1.540578, 1, 1, 1, 1, 1,
0.324275, -0.03895362, 1.976794, 0, 0, 1, 1, 1,
0.3256199, -0.2149493, 3.593666, 1, 0, 0, 1, 1,
0.3279608, 0.9926155, -1.33951, 1, 0, 0, 1, 1,
0.330129, 0.260386, -0.1044315, 1, 0, 0, 1, 1,
0.3319738, -0.1741629, 1.359417, 1, 0, 0, 1, 1,
0.333313, -0.7071936, 2.672009, 1, 0, 0, 1, 1,
0.3340096, 0.1522685, -0.02495721, 0, 0, 0, 1, 1,
0.3345836, -0.07453666, 2.386312, 0, 0, 0, 1, 1,
0.3363157, -1.471329, 1.2606, 0, 0, 0, 1, 1,
0.3363225, 0.8118905, -0.6109573, 0, 0, 0, 1, 1,
0.3385821, -1.402214, 4.55713, 0, 0, 0, 1, 1,
0.3424832, -1.082203, 2.991695, 0, 0, 0, 1, 1,
0.3555202, -0.9686957, 2.808465, 0, 0, 0, 1, 1,
0.3566894, -0.421418, 3.51834, 1, 1, 1, 1, 1,
0.3594344, -1.280251, 3.653731, 1, 1, 1, 1, 1,
0.3596012, 0.1914388, -0.5665215, 1, 1, 1, 1, 1,
0.3627355, -0.6416987, 3.800539, 1, 1, 1, 1, 1,
0.3684579, 1.009259, -0.009116465, 1, 1, 1, 1, 1,
0.3711132, -0.3299285, 1.995015, 1, 1, 1, 1, 1,
0.3724237, 1.879567, 0.2532548, 1, 1, 1, 1, 1,
0.3743166, 0.5327256, -0.1683653, 1, 1, 1, 1, 1,
0.3789421, 1.218028, -1.293602, 1, 1, 1, 1, 1,
0.3803889, 0.3393652, 1.377328, 1, 1, 1, 1, 1,
0.3808587, -1.404357, 3.103947, 1, 1, 1, 1, 1,
0.3836529, -1.15451, 2.066924, 1, 1, 1, 1, 1,
0.3878219, -0.1671742, 2.458783, 1, 1, 1, 1, 1,
0.3878286, 0.328183, 1.063768, 1, 1, 1, 1, 1,
0.3902414, 0.3821268, -0.5133907, 1, 1, 1, 1, 1,
0.3927248, -0.3896532, 2.802911, 0, 0, 1, 1, 1,
0.3954442, -0.1123332, 2.593464, 1, 0, 0, 1, 1,
0.3963466, 0.1757264, 1.782296, 1, 0, 0, 1, 1,
0.3966271, 0.2503168, 2.152723, 1, 0, 0, 1, 1,
0.397727, 0.8642588, 1.405765, 1, 0, 0, 1, 1,
0.398359, 0.7321311, 0.9020749, 1, 0, 0, 1, 1,
0.4041405, -1.081344, 4.05718, 0, 0, 0, 1, 1,
0.4051917, -1.016181, 2.475093, 0, 0, 0, 1, 1,
0.4151526, -0.4555509, 0.9663331, 0, 0, 0, 1, 1,
0.4165739, -1.159683, 2.825668, 0, 0, 0, 1, 1,
0.4265637, -0.3726431, 3.152564, 0, 0, 0, 1, 1,
0.4373859, 0.2306853, 0.9171544, 0, 0, 0, 1, 1,
0.4374032, 1.409451, -0.1992839, 0, 0, 0, 1, 1,
0.4450683, -0.1717318, 1.644723, 1, 1, 1, 1, 1,
0.4457456, -0.903133, 2.778049, 1, 1, 1, 1, 1,
0.4476607, -0.1745781, 3.683289, 1, 1, 1, 1, 1,
0.4490935, -0.6041416, 2.712534, 1, 1, 1, 1, 1,
0.44983, 0.1906263, 0.9084932, 1, 1, 1, 1, 1,
0.4564233, -0.8848248, 3.816682, 1, 1, 1, 1, 1,
0.4619777, 0.9240895, 1.887626, 1, 1, 1, 1, 1,
0.46507, 0.6549422, -0.4176645, 1, 1, 1, 1, 1,
0.4653031, 0.09951401, 2.085641, 1, 1, 1, 1, 1,
0.4670601, 0.7266763, 0.5973617, 1, 1, 1, 1, 1,
0.4670705, -0.7655537, 3.301809, 1, 1, 1, 1, 1,
0.4723626, -1.072781, 4.056131, 1, 1, 1, 1, 1,
0.4741978, -1.38477, 1.850155, 1, 1, 1, 1, 1,
0.4753505, -1.641655, 2.827297, 1, 1, 1, 1, 1,
0.4786572, 0.608433, -0.4011565, 1, 1, 1, 1, 1,
0.4806939, -0.1149066, 3.149355, 0, 0, 1, 1, 1,
0.4816122, -0.7905388, 1.947491, 1, 0, 0, 1, 1,
0.4816134, -0.3466566, 0.5741024, 1, 0, 0, 1, 1,
0.4828928, 0.7986715, 1.803223, 1, 0, 0, 1, 1,
0.4873713, -0.2869642, 2.998837, 1, 0, 0, 1, 1,
0.49053, 0.7876661, 0.2952544, 1, 0, 0, 1, 1,
0.4956466, 0.09074384, 1.500633, 0, 0, 0, 1, 1,
0.4964361, -0.6744741, 2.083944, 0, 0, 0, 1, 1,
0.5028049, -1.085714, 2.435815, 0, 0, 0, 1, 1,
0.5180876, -0.653829, 1.484699, 0, 0, 0, 1, 1,
0.5182054, 0.0494685, 3.009418, 0, 0, 0, 1, 1,
0.5276592, -2.213714, 4.512263, 0, 0, 0, 1, 1,
0.5277731, 0.5905128, 1.594648, 0, 0, 0, 1, 1,
0.5301735, -0.7528731, 3.391017, 1, 1, 1, 1, 1,
0.5337862, 2.02366, -0.3987088, 1, 1, 1, 1, 1,
0.5343659, 0.9806584, 1.429404, 1, 1, 1, 1, 1,
0.5361686, -1.329079, 3.058082, 1, 1, 1, 1, 1,
0.5379709, -0.6933595, 1.379265, 1, 1, 1, 1, 1,
0.548274, -0.4816456, 3.124905, 1, 1, 1, 1, 1,
0.5482924, -0.6817999, 0.3155158, 1, 1, 1, 1, 1,
0.551466, 1.571823, 0.4941619, 1, 1, 1, 1, 1,
0.5590398, 0.6473311, 0.002122926, 1, 1, 1, 1, 1,
0.5610337, 0.2058022, 0.6417218, 1, 1, 1, 1, 1,
0.5612288, 0.707092, 0.7669544, 1, 1, 1, 1, 1,
0.5676273, -0.709848, 3.360976, 1, 1, 1, 1, 1,
0.5781664, 0.887015, -0.2309371, 1, 1, 1, 1, 1,
0.5793812, 0.8223006, -0.4057323, 1, 1, 1, 1, 1,
0.5855104, 1.988932, 1.926666, 1, 1, 1, 1, 1,
0.5910158, 0.009793504, -0.03021552, 0, 0, 1, 1, 1,
0.5913099, -0.5638383, 1.295006, 1, 0, 0, 1, 1,
0.6003068, -1.074894, 2.232913, 1, 0, 0, 1, 1,
0.6028225, -0.350284, 0.262391, 1, 0, 0, 1, 1,
0.6031841, -0.06618962, -0.4736769, 1, 0, 0, 1, 1,
0.605491, -0.07412679, 2.235792, 1, 0, 0, 1, 1,
0.6058285, 1.076658, 1.755962, 0, 0, 0, 1, 1,
0.6123726, -0.574394, 3.949093, 0, 0, 0, 1, 1,
0.6179162, -1.230106, 3.091428, 0, 0, 0, 1, 1,
0.6244863, -1.474602, 3.719632, 0, 0, 0, 1, 1,
0.6259584, -0.653563, 1.189951, 0, 0, 0, 1, 1,
0.6268836, -0.2618059, 1.872663, 0, 0, 0, 1, 1,
0.6371156, -0.4809127, -0.1112422, 0, 0, 0, 1, 1,
0.637876, 0.139143, 0.630205, 1, 1, 1, 1, 1,
0.6437247, 0.1774067, 3.084393, 1, 1, 1, 1, 1,
0.6458573, 1.944185, 0.8723953, 1, 1, 1, 1, 1,
0.6463627, 1.461266, 0.4957163, 1, 1, 1, 1, 1,
0.6463734, -0.188717, 1.780584, 1, 1, 1, 1, 1,
0.6465783, -0.2681306, 2.468011, 1, 1, 1, 1, 1,
0.6482447, -0.3259082, 3.329858, 1, 1, 1, 1, 1,
0.6535706, 2.1614, -0.508239, 1, 1, 1, 1, 1,
0.6601993, -0.05823862, 2.070314, 1, 1, 1, 1, 1,
0.6605015, 0.9985995, 0.8125146, 1, 1, 1, 1, 1,
0.6619123, 1.631843, -0.5677125, 1, 1, 1, 1, 1,
0.666566, 0.7575223, 1.135443, 1, 1, 1, 1, 1,
0.6679422, 0.1359229, 1.188457, 1, 1, 1, 1, 1,
0.6701804, 0.6339257, 0.4359001, 1, 1, 1, 1, 1,
0.6837521, 0.4716488, 1.978742, 1, 1, 1, 1, 1,
0.6889473, 0.08769337, -0.7767937, 0, 0, 1, 1, 1,
0.6978896, 0.2560959, 1.008969, 1, 0, 0, 1, 1,
0.6984807, -0.1559329, 1.986298, 1, 0, 0, 1, 1,
0.7013006, 0.5816829, 0.8217661, 1, 0, 0, 1, 1,
0.7013876, -0.9245035, 4.226733, 1, 0, 0, 1, 1,
0.7034113, 0.8578579, -0.2912285, 1, 0, 0, 1, 1,
0.7103668, 0.2260045, 1.923587, 0, 0, 0, 1, 1,
0.7122527, 0.9529681, 0.135594, 0, 0, 0, 1, 1,
0.7195734, 0.3761611, 1.962473, 0, 0, 0, 1, 1,
0.7253668, -0.1007818, 2.285346, 0, 0, 0, 1, 1,
0.729095, 1.009447, 1.784746, 0, 0, 0, 1, 1,
0.7326806, -1.181352, 2.795121, 0, 0, 0, 1, 1,
0.7327932, 0.1489873, -1.129083, 0, 0, 0, 1, 1,
0.7393928, 0.9834527, 0.2686745, 1, 1, 1, 1, 1,
0.7405345, -0.225832, 1.190634, 1, 1, 1, 1, 1,
0.7421904, -1.256926, 2.313362, 1, 1, 1, 1, 1,
0.7489473, 0.8955475, 1.574008, 1, 1, 1, 1, 1,
0.7506543, -2.569305, 2.88675, 1, 1, 1, 1, 1,
0.753511, -0.5373276, 2.096122, 1, 1, 1, 1, 1,
0.757352, 0.2895443, 3.498561, 1, 1, 1, 1, 1,
0.7588109, -0.2433402, 0.2508449, 1, 1, 1, 1, 1,
0.7682955, -0.9330038, 3.599923, 1, 1, 1, 1, 1,
0.7696368, 0.6431174, 1.57899, 1, 1, 1, 1, 1,
0.7722069, -0.3556978, 3.329095, 1, 1, 1, 1, 1,
0.7752305, 0.5054591, 0.1088767, 1, 1, 1, 1, 1,
0.7775922, -1.027372, 3.204721, 1, 1, 1, 1, 1,
0.7853541, 1.385239, 1.313069, 1, 1, 1, 1, 1,
0.7862597, -0.8101968, 2.578742, 1, 1, 1, 1, 1,
0.7900791, 0.3093618, -1.09684, 0, 0, 1, 1, 1,
0.7983119, -1.920921, 4.987856, 1, 0, 0, 1, 1,
0.8005677, 0.245641, 1.05731, 1, 0, 0, 1, 1,
0.8151745, 2.702572, 0.4917085, 1, 0, 0, 1, 1,
0.8219314, 0.5451704, 1.976839, 1, 0, 0, 1, 1,
0.8245699, -0.3791616, 0.5526774, 1, 0, 0, 1, 1,
0.8263878, -0.3325395, 1.075378, 0, 0, 0, 1, 1,
0.8267355, 1.340665, 0.2485361, 0, 0, 0, 1, 1,
0.8415965, -1.635972, 2.301542, 0, 0, 0, 1, 1,
0.8424723, 0.4492674, 1.965796, 0, 0, 0, 1, 1,
0.8481658, 0.4762717, 0.1860813, 0, 0, 0, 1, 1,
0.8494211, 0.4016418, 0.9361154, 0, 0, 0, 1, 1,
0.8499256, -1.222734, 2.280945, 0, 0, 0, 1, 1,
0.8532379, 0.7076893, 1.814368, 1, 1, 1, 1, 1,
0.8550777, -0.4800659, 2.193939, 1, 1, 1, 1, 1,
0.855549, 0.1348249, 2.356323, 1, 1, 1, 1, 1,
0.8621444, 1.390094, -0.05568763, 1, 1, 1, 1, 1,
0.8621741, -0.1183493, 1.977399, 1, 1, 1, 1, 1,
0.8622588, 0.5555286, 0.9435764, 1, 1, 1, 1, 1,
0.8627495, -0.9244604, 0.8381468, 1, 1, 1, 1, 1,
0.8654601, -1.950088, 3.577012, 1, 1, 1, 1, 1,
0.8662407, -0.9224322, 1.493855, 1, 1, 1, 1, 1,
0.8671783, -0.01207192, 3.046135, 1, 1, 1, 1, 1,
0.8713116, 1.10192, -0.1517488, 1, 1, 1, 1, 1,
0.8726249, -0.7597278, 1.098351, 1, 1, 1, 1, 1,
0.8726391, 2.269936, 1.150597, 1, 1, 1, 1, 1,
0.8786122, 0.3702485, 1.052972, 1, 1, 1, 1, 1,
0.8810944, -0.8158671, 3.587495, 1, 1, 1, 1, 1,
0.8838265, -0.1899735, 1.371329, 0, 0, 1, 1, 1,
0.884637, -0.7119132, 3.35254, 1, 0, 0, 1, 1,
0.8846923, 0.0522778, 3.387147, 1, 0, 0, 1, 1,
0.8894964, 1.26927, 0.6760715, 1, 0, 0, 1, 1,
0.8895941, 0.08847156, 2.208559, 1, 0, 0, 1, 1,
0.8897176, -1.096001, 3.013349, 1, 0, 0, 1, 1,
0.8973635, 0.7287368, 1.256773, 0, 0, 0, 1, 1,
0.9025385, 0.001621304, 0.6782848, 0, 0, 0, 1, 1,
0.9071683, -0.1141309, 2.602731, 0, 0, 0, 1, 1,
0.9132228, -0.8967829, 2.193115, 0, 0, 0, 1, 1,
0.9190111, 1.580951, -0.4735916, 0, 0, 0, 1, 1,
0.9278824, 0.4573622, 1.123738, 0, 0, 0, 1, 1,
0.9375612, 0.6214734, 0.4509856, 0, 0, 0, 1, 1,
0.9381479, 1.570177, 0.09917115, 1, 1, 1, 1, 1,
0.9412641, -2.732049, 2.559852, 1, 1, 1, 1, 1,
0.9440337, 1.497652, -1.798433, 1, 1, 1, 1, 1,
0.9482461, 0.006415767, 1.808436, 1, 1, 1, 1, 1,
0.9489307, 0.9130121, 1.992928, 1, 1, 1, 1, 1,
0.9535033, 0.4362808, 1.322893, 1, 1, 1, 1, 1,
0.9642083, 0.8084908, 2.697208, 1, 1, 1, 1, 1,
0.9648056, 0.3794982, 2.192339, 1, 1, 1, 1, 1,
0.9648103, 1.198868, 0.5718206, 1, 1, 1, 1, 1,
0.9772843, 0.8581396, 1.039983, 1, 1, 1, 1, 1,
0.9785374, 0.6861528, 1.638138, 1, 1, 1, 1, 1,
0.9869239, 0.8990728, 1.730197, 1, 1, 1, 1, 1,
0.990328, -1.748806, 2.832029, 1, 1, 1, 1, 1,
0.9908797, -0.3950221, 2.41036, 1, 1, 1, 1, 1,
0.9912167, 0.4039849, -0.1659379, 1, 1, 1, 1, 1,
0.9981256, 0.4453002, -0.1566758, 0, 0, 1, 1, 1,
1.005825, 1.57159, 1.013757, 1, 0, 0, 1, 1,
1.008362, 1.065313, 1.656218, 1, 0, 0, 1, 1,
1.014125, -0.2660445, 3.118692, 1, 0, 0, 1, 1,
1.014391, 1.384637, 0.2993153, 1, 0, 0, 1, 1,
1.01836, 0.5750654, 1.221378, 1, 0, 0, 1, 1,
1.02775, -0.8567895, 1.269054, 0, 0, 0, 1, 1,
1.02804, 1.166304, 0.9349601, 0, 0, 0, 1, 1,
1.030869, -0.3504971, 2.168154, 0, 0, 0, 1, 1,
1.032866, 1.716741, -0.1698405, 0, 0, 0, 1, 1,
1.039697, 0.7835538, 0.1579289, 0, 0, 0, 1, 1,
1.04161, 1.093586, 0.4252997, 0, 0, 0, 1, 1,
1.044153, 0.8146108, 1.587779, 0, 0, 0, 1, 1,
1.044158, -0.1655286, 1.855611, 1, 1, 1, 1, 1,
1.053097, 1.944955, 0.1743103, 1, 1, 1, 1, 1,
1.073017, 1.229592, -0.4153487, 1, 1, 1, 1, 1,
1.078524, 0.7339867, 0.3853419, 1, 1, 1, 1, 1,
1.079622, -0.4063611, 2.019535, 1, 1, 1, 1, 1,
1.081468, -0.464022, 1.85758, 1, 1, 1, 1, 1,
1.082188, 0.3310342, 2.795795, 1, 1, 1, 1, 1,
1.082984, 2.797552, 1.64544, 1, 1, 1, 1, 1,
1.0849, -0.1318107, 1.237465, 1, 1, 1, 1, 1,
1.094966, -0.01310453, 0.9757856, 1, 1, 1, 1, 1,
1.097448, 0.3044304, 0.5660293, 1, 1, 1, 1, 1,
1.105987, -1.323007, 2.289219, 1, 1, 1, 1, 1,
1.117959, -0.6162589, 3.370881, 1, 1, 1, 1, 1,
1.121347, -0.04304967, 0.3248717, 1, 1, 1, 1, 1,
1.123195, -0.4643057, 1.819595, 1, 1, 1, 1, 1,
1.12721, 1.700703, -0.7523873, 0, 0, 1, 1, 1,
1.130936, -2.094669, 1.552377, 1, 0, 0, 1, 1,
1.133136, 0.6455924, -0.109267, 1, 0, 0, 1, 1,
1.135343, 0.2568966, 0.6839716, 1, 0, 0, 1, 1,
1.145882, -2.434615, 2.481562, 1, 0, 0, 1, 1,
1.147014, 0.8450379, 0.9225991, 1, 0, 0, 1, 1,
1.161019, -0.3858378, 0.7652872, 0, 0, 0, 1, 1,
1.163438, 1.101171, 1.864507, 0, 0, 0, 1, 1,
1.164813, 0.03963711, 0.8231508, 0, 0, 0, 1, 1,
1.167422, -0.5723642, 1.165858, 0, 0, 0, 1, 1,
1.170458, -0.754481, 1.175517, 0, 0, 0, 1, 1,
1.172036, 0.1631237, 1.323537, 0, 0, 0, 1, 1,
1.174827, 0.1554457, 0.7602739, 0, 0, 0, 1, 1,
1.176409, 0.2074641, 1.949513, 1, 1, 1, 1, 1,
1.176974, 0.2395342, 0.5003644, 1, 1, 1, 1, 1,
1.179569, -0.5422106, 1.720228, 1, 1, 1, 1, 1,
1.194931, -0.1741374, 2.11669, 1, 1, 1, 1, 1,
1.195934, 0.5298609, 1.141318, 1, 1, 1, 1, 1,
1.197839, 0.0664863, 0.7637624, 1, 1, 1, 1, 1,
1.201099, 0.8009328, 1.59052, 1, 1, 1, 1, 1,
1.201439, 0.2707233, 2.685064, 1, 1, 1, 1, 1,
1.20527, -1.690201, 1.958491, 1, 1, 1, 1, 1,
1.221681, -1.363942, 3.466677, 1, 1, 1, 1, 1,
1.226442, -1.30367, 4.301333, 1, 1, 1, 1, 1,
1.229712, -0.2212906, 3.017313, 1, 1, 1, 1, 1,
1.241988, 1.397321, 0.3946896, 1, 1, 1, 1, 1,
1.252929, 0.2082677, 1.570246, 1, 1, 1, 1, 1,
1.259593, -1.295091, 2.156957, 1, 1, 1, 1, 1,
1.26139, -0.4075295, 2.313881, 0, 0, 1, 1, 1,
1.261594, 2.088575, 1.362424, 1, 0, 0, 1, 1,
1.265912, -0.5809623, 1.328813, 1, 0, 0, 1, 1,
1.268427, -2.161335, 2.305001, 1, 0, 0, 1, 1,
1.269127, 0.4542438, -0.005944899, 1, 0, 0, 1, 1,
1.272747, 1.010416, 1.474252, 1, 0, 0, 1, 1,
1.280356, 2.014186, 0.6748552, 0, 0, 0, 1, 1,
1.281259, 0.4941064, 1.727933, 0, 0, 0, 1, 1,
1.292281, 1.229918, 0.633565, 0, 0, 0, 1, 1,
1.297275, 1.216292, 1.67297, 0, 0, 0, 1, 1,
1.298861, -1.020015, 1.279387, 0, 0, 0, 1, 1,
1.301699, 1.497378, -0.07908703, 0, 0, 0, 1, 1,
1.307658, -0.9830717, 2.359737, 0, 0, 0, 1, 1,
1.313859, 0.8722277, 1.058616, 1, 1, 1, 1, 1,
1.314317, 0.04260198, 0.2326449, 1, 1, 1, 1, 1,
1.322159, -1.096583, 2.777859, 1, 1, 1, 1, 1,
1.322313, -1.515023, 2.829484, 1, 1, 1, 1, 1,
1.325875, 0.690393, 2.407892, 1, 1, 1, 1, 1,
1.326757, -0.1666588, 3.9659, 1, 1, 1, 1, 1,
1.329263, -0.2544127, 2.498123, 1, 1, 1, 1, 1,
1.338964, -0.7905049, 2.231418, 1, 1, 1, 1, 1,
1.359084, -0.3313461, 0.667529, 1, 1, 1, 1, 1,
1.398044, 0.3284124, 1.817748, 1, 1, 1, 1, 1,
1.399129, 0.1707638, 1.229832, 1, 1, 1, 1, 1,
1.402185, 0.8445182, 2.735224, 1, 1, 1, 1, 1,
1.409267, 1.165571, 1.672221, 1, 1, 1, 1, 1,
1.414712, 2.529355, 0.9829351, 1, 1, 1, 1, 1,
1.416387, 0.8941393, 0.9989169, 1, 1, 1, 1, 1,
1.426949, -0.04544685, 2.002674, 0, 0, 1, 1, 1,
1.427487, 1.201154, 1.916363, 1, 0, 0, 1, 1,
1.428074, 1.631384, 2.302062, 1, 0, 0, 1, 1,
1.432802, 0.3837124, 0.4806947, 1, 0, 0, 1, 1,
1.43962, 0.8463184, 0.824065, 1, 0, 0, 1, 1,
1.471254, -0.1819126, 0.08342659, 1, 0, 0, 1, 1,
1.478271, -0.3057744, 2.315674, 0, 0, 0, 1, 1,
1.493513, 0.189613, 1.54863, 0, 0, 0, 1, 1,
1.505031, 0.6730137, 1.510793, 0, 0, 0, 1, 1,
1.515171, -1.641376, 2.825576, 0, 0, 0, 1, 1,
1.523997, -0.899923, 1.873335, 0, 0, 0, 1, 1,
1.528026, -0.5495617, 2.15732, 0, 0, 0, 1, 1,
1.531013, -0.7964638, 1.29147, 0, 0, 0, 1, 1,
1.545702, 1.835488, 0.4618411, 1, 1, 1, 1, 1,
1.55215, -0.6515964, 2.811614, 1, 1, 1, 1, 1,
1.559452, 0.3654414, 0.5619014, 1, 1, 1, 1, 1,
1.566595, 0.2543116, 1.596974, 1, 1, 1, 1, 1,
1.571853, -0.7222914, 2.845237, 1, 1, 1, 1, 1,
1.575624, 1.439966, 1.119405, 1, 1, 1, 1, 1,
1.593851, 0.4996766, 1.533058, 1, 1, 1, 1, 1,
1.597031, -0.01493274, 0.648274, 1, 1, 1, 1, 1,
1.602605, 0.9194171, -0.138422, 1, 1, 1, 1, 1,
1.603677, 1.101597, 1.556703, 1, 1, 1, 1, 1,
1.60758, 0.2354272, -0.2975257, 1, 1, 1, 1, 1,
1.652725, 1.431334, 0.7223924, 1, 1, 1, 1, 1,
1.66967, 0.4072747, -1.614532, 1, 1, 1, 1, 1,
1.679304, 2.248588, 0.7006019, 1, 1, 1, 1, 1,
1.690237, -0.6920215, 1.538833, 1, 1, 1, 1, 1,
1.697719, 0.2972641, 1.835717, 0, 0, 1, 1, 1,
1.710225, 0.01420798, 1.377615, 1, 0, 0, 1, 1,
1.719211, 0.06775083, 0.7740707, 1, 0, 0, 1, 1,
1.749671, -0.9141389, 2.705539, 1, 0, 0, 1, 1,
1.754026, -1.70275, 2.082879, 1, 0, 0, 1, 1,
1.766094, -0.2770512, 1.118292, 1, 0, 0, 1, 1,
1.766804, -1.43915, 0.4524966, 0, 0, 0, 1, 1,
1.78578, -1.635655, 2.758835, 0, 0, 0, 1, 1,
1.788267, 1.140627, 0.2330707, 0, 0, 0, 1, 1,
1.805071, -0.4707477, 1.874156, 0, 0, 0, 1, 1,
1.827679, 0.4515206, 1.658921, 0, 0, 0, 1, 1,
1.840782, 1.052393, -0.2940199, 0, 0, 0, 1, 1,
1.859968, 0.7188742, 1.187446, 0, 0, 0, 1, 1,
1.860176, 0.2325607, 3.126698, 1, 1, 1, 1, 1,
1.894787, 0.7484618, 2.523296, 1, 1, 1, 1, 1,
1.909397, 2.11628, 0.3598769, 1, 1, 1, 1, 1,
1.932097, 0.542531, 1.876568, 1, 1, 1, 1, 1,
1.952016, -0.4496829, 2.58929, 1, 1, 1, 1, 1,
1.954094, -1.540722, 1.840217, 1, 1, 1, 1, 1,
1.960565, 0.3335976, 1.65214, 1, 1, 1, 1, 1,
1.971038, -0.3484377, 1.476701, 1, 1, 1, 1, 1,
1.986731, 0.8585899, 1.09628, 1, 1, 1, 1, 1,
1.999005, -1.583308, 2.786357, 1, 1, 1, 1, 1,
2.004457, 0.3437698, 2.143474, 1, 1, 1, 1, 1,
2.020174, 0.5769626, 0.214325, 1, 1, 1, 1, 1,
2.053895, 1.359238, 0.6815959, 1, 1, 1, 1, 1,
2.078697, 0.401929, 2.029707, 1, 1, 1, 1, 1,
2.09629, 0.1292892, 2.029916, 1, 1, 1, 1, 1,
2.104668, 2.926881, 1.806759, 0, 0, 1, 1, 1,
2.133447, 0.2135271, -0.5943092, 1, 0, 0, 1, 1,
2.135513, -0.1453753, 1.03982, 1, 0, 0, 1, 1,
2.161207, 0.5641162, 0.2166287, 1, 0, 0, 1, 1,
2.195045, 0.3637858, 0.6164371, 1, 0, 0, 1, 1,
2.212783, 0.1225465, 2.287438, 1, 0, 0, 1, 1,
2.227097, 0.02965589, 0.1508184, 0, 0, 0, 1, 1,
2.230164, 0.2254889, -0.7188873, 0, 0, 0, 1, 1,
2.24615, 1.247887, -1.594377, 0, 0, 0, 1, 1,
2.403254, 0.3918726, 2.396356, 0, 0, 0, 1, 1,
2.45563, -1.12951, 1.498519, 0, 0, 0, 1, 1,
2.472197, -0.4579109, 0.5154679, 0, 0, 0, 1, 1,
2.477983, 0.3138929, 0.3853095, 0, 0, 0, 1, 1,
2.527634, 0.2252494, 1.668589, 1, 1, 1, 1, 1,
2.540931, -0.2643645, 1.872114, 1, 1, 1, 1, 1,
2.606198, 2.011864, 0.4922391, 1, 1, 1, 1, 1,
2.83322, 0.5654636, 1.627002, 1, 1, 1, 1, 1,
2.906643, 0.7276124, -0.5728417, 1, 1, 1, 1, 1,
2.924502, 0.393086, 1.408961, 1, 1, 1, 1, 1,
3.035228, 0.03477392, 2.467908, 1, 1, 1, 1, 1
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
var radius = 9.456458;
var distance = 33.21541;
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
mvMatrix.translate( 0.02926779, 0.1213961, 0.1039805 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21541);
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
