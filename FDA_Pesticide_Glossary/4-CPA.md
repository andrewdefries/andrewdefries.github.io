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
-2.947806, 1.798722, -0.01094773, 1, 0, 0, 1,
-2.818238, 0.786725, -0.592548, 1, 0.007843138, 0, 1,
-2.691695, -0.7804676, -1.25276, 1, 0.01176471, 0, 1,
-2.629966, 0.370743, -1.957837, 1, 0.01960784, 0, 1,
-2.576943, 0.2293446, -1.862983, 1, 0.02352941, 0, 1,
-2.559196, -0.8104205, -2.200211, 1, 0.03137255, 0, 1,
-2.483145, 0.4547353, -1.513566, 1, 0.03529412, 0, 1,
-2.423457, 0.8328553, -1.49925, 1, 0.04313726, 0, 1,
-2.353755, -0.3691848, -1.63798, 1, 0.04705882, 0, 1,
-2.343288, 2.047502, -0.5727091, 1, 0.05490196, 0, 1,
-2.331548, 0.4621695, -0.5417721, 1, 0.05882353, 0, 1,
-2.32642, 0.4246723, -0.5523649, 1, 0.06666667, 0, 1,
-2.313728, -0.1531815, -0.8834992, 1, 0.07058824, 0, 1,
-2.308136, -0.5117552, -0.4894337, 1, 0.07843138, 0, 1,
-2.255704, 2.394499, -1.445262, 1, 0.08235294, 0, 1,
-2.225805, -0.4270216, -0.8294342, 1, 0.09019608, 0, 1,
-2.21734, 0.4737153, -0.2228224, 1, 0.09411765, 0, 1,
-2.171596, -0.5618683, -2.131393, 1, 0.1019608, 0, 1,
-2.126727, 1.55144, -2.377966, 1, 0.1098039, 0, 1,
-2.115165, -0.3689841, -2.098681, 1, 0.1137255, 0, 1,
-2.109711, -1.290213, -1.340523, 1, 0.1215686, 0, 1,
-2.075231, -1.461219, -0.6746999, 1, 0.1254902, 0, 1,
-2.073047, 0.1098584, -0.8438272, 1, 0.1333333, 0, 1,
-2.024215, -0.5185833, -0.3879563, 1, 0.1372549, 0, 1,
-1.997399, 2.026109, -0.5604529, 1, 0.145098, 0, 1,
-1.993178, 0.9408875, -0.1951759, 1, 0.1490196, 0, 1,
-1.979926, 1.780263, -1.414723, 1, 0.1568628, 0, 1,
-1.976498, -1.100118, -1.840717, 1, 0.1607843, 0, 1,
-1.951876, 2.234341, -0.7669948, 1, 0.1686275, 0, 1,
-1.928759, 0.1733717, -2.058724, 1, 0.172549, 0, 1,
-1.923426, 0.08318612, -2.172051, 1, 0.1803922, 0, 1,
-1.920637, -3.538089, -4.736216, 1, 0.1843137, 0, 1,
-1.890517, -0.4910572, -2.525157, 1, 0.1921569, 0, 1,
-1.8796, 1.440684, -1.413301, 1, 0.1960784, 0, 1,
-1.866956, 0.3758333, -1.528252, 1, 0.2039216, 0, 1,
-1.803108, 0.05743515, -1.415962, 1, 0.2117647, 0, 1,
-1.798974, 0.3010764, -2.708635, 1, 0.2156863, 0, 1,
-1.782722, 0.1032374, -1.392361, 1, 0.2235294, 0, 1,
-1.781554, 0.9516426, -0.1673427, 1, 0.227451, 0, 1,
-1.759723, 0.8170146, -1.793241, 1, 0.2352941, 0, 1,
-1.756507, 0.4087738, -1.968136, 1, 0.2392157, 0, 1,
-1.756445, 0.7887558, -2.104542, 1, 0.2470588, 0, 1,
-1.750332, -0.474661, -1.936882, 1, 0.2509804, 0, 1,
-1.745995, 0.6720746, -0.869017, 1, 0.2588235, 0, 1,
-1.740239, 0.1258636, -0.654215, 1, 0.2627451, 0, 1,
-1.728547, -1.295847, -2.167767, 1, 0.2705882, 0, 1,
-1.726968, 0.01917866, -1.648739, 1, 0.2745098, 0, 1,
-1.713401, -0.9655656, -1.739938, 1, 0.282353, 0, 1,
-1.712232, 1.013305, -1.173219, 1, 0.2862745, 0, 1,
-1.711686, 1.282396, -1.186971, 1, 0.2941177, 0, 1,
-1.708864, 0.2414874, -0.04760146, 1, 0.3019608, 0, 1,
-1.692998, -1.705444, -2.333868, 1, 0.3058824, 0, 1,
-1.65949, -1.089795, -2.197676, 1, 0.3137255, 0, 1,
-1.659165, -0.06144162, -3.278259, 1, 0.3176471, 0, 1,
-1.626651, 1.015108, 0.1212827, 1, 0.3254902, 0, 1,
-1.619826, -0.8157382, -2.021641, 1, 0.3294118, 0, 1,
-1.618402, 0.09694209, -1.066103, 1, 0.3372549, 0, 1,
-1.616646, 0.2386497, -0.8293007, 1, 0.3411765, 0, 1,
-1.61274, 0.1441094, -0.8012483, 1, 0.3490196, 0, 1,
-1.608101, -0.4559407, -3.958901, 1, 0.3529412, 0, 1,
-1.605226, -1.44135, -0.7915514, 1, 0.3607843, 0, 1,
-1.601097, -0.7858255, -4.153751, 1, 0.3647059, 0, 1,
-1.600238, -0.8214884, -2.059412, 1, 0.372549, 0, 1,
-1.600116, -1.742119, -2.673913, 1, 0.3764706, 0, 1,
-1.596912, 1.105206, -1.408853, 1, 0.3843137, 0, 1,
-1.594873, 0.7083096, -1.968309, 1, 0.3882353, 0, 1,
-1.588994, 0.156403, 0.2606775, 1, 0.3960784, 0, 1,
-1.581244, -2.272634, -2.277995, 1, 0.4039216, 0, 1,
-1.580849, 0.8220922, -1.002754, 1, 0.4078431, 0, 1,
-1.572857, -0.983845, -2.104417, 1, 0.4156863, 0, 1,
-1.550455, 1.327457, -2.45906, 1, 0.4196078, 0, 1,
-1.546854, -1.276086, -3.255779, 1, 0.427451, 0, 1,
-1.544521, -1.091806, -2.074599, 1, 0.4313726, 0, 1,
-1.539961, -1.476499, -2.003701, 1, 0.4392157, 0, 1,
-1.53576, -0.2620288, -0.4214672, 1, 0.4431373, 0, 1,
-1.535729, 0.700793, -1.193369, 1, 0.4509804, 0, 1,
-1.533272, 2.63237, -1.128383, 1, 0.454902, 0, 1,
-1.532255, 0.7948757, -2.259585, 1, 0.4627451, 0, 1,
-1.522698, 0.6192209, -1.854337, 1, 0.4666667, 0, 1,
-1.516631, -0.01420752, -2.761938, 1, 0.4745098, 0, 1,
-1.511531, -0.4315446, -1.694525, 1, 0.4784314, 0, 1,
-1.50753, -1.189917, -3.051526, 1, 0.4862745, 0, 1,
-1.504829, -0.7207521, -2.499204, 1, 0.4901961, 0, 1,
-1.492489, 1.001255, -2.141903, 1, 0.4980392, 0, 1,
-1.491555, 1.235458, -1.583877, 1, 0.5058824, 0, 1,
-1.481712, 0.7092319, -1.793397, 1, 0.509804, 0, 1,
-1.476872, -2.440815, -0.5395436, 1, 0.5176471, 0, 1,
-1.472269, 0.6142217, -0.2597559, 1, 0.5215687, 0, 1,
-1.46745, -0.69723, -2.866593, 1, 0.5294118, 0, 1,
-1.452565, 0.9084525, -1.927237, 1, 0.5333334, 0, 1,
-1.448005, 1.561474, 0.8018321, 1, 0.5411765, 0, 1,
-1.44378, -0.9560132, -0.2762945, 1, 0.5450981, 0, 1,
-1.441301, -1.241463, -2.176914, 1, 0.5529412, 0, 1,
-1.42388, 1.482965, -2.314463, 1, 0.5568628, 0, 1,
-1.420112, -1.183967, -3.027989, 1, 0.5647059, 0, 1,
-1.418114, -0.8166188, -3.902736, 1, 0.5686275, 0, 1,
-1.417756, -0.5177937, -1.598654, 1, 0.5764706, 0, 1,
-1.403165, -0.7563435, -1.918255, 1, 0.5803922, 0, 1,
-1.395658, 0.7424104, 0.5705032, 1, 0.5882353, 0, 1,
-1.39193, 0.3669239, -1.782403, 1, 0.5921569, 0, 1,
-1.38641, 0.7642657, -1.76512, 1, 0.6, 0, 1,
-1.375424, -0.519108, -2.307338, 1, 0.6078432, 0, 1,
-1.373825, -0.1389191, -2.413337, 1, 0.6117647, 0, 1,
-1.372315, 0.4499511, -0.3097444, 1, 0.6196079, 0, 1,
-1.365452, 0.89806, -0.2434079, 1, 0.6235294, 0, 1,
-1.353711, 2.274238, -1.014794, 1, 0.6313726, 0, 1,
-1.339179, -2.453105, -2.091402, 1, 0.6352941, 0, 1,
-1.331988, 1.784408, 0.295169, 1, 0.6431373, 0, 1,
-1.326723, 0.3838447, -0.9010335, 1, 0.6470588, 0, 1,
-1.321515, 0.1671007, -1.179061, 1, 0.654902, 0, 1,
-1.310064, -0.6121081, -1.743837, 1, 0.6588235, 0, 1,
-1.306097, -0.4791841, -1.781564, 1, 0.6666667, 0, 1,
-1.302629, -0.4395612, -2.814045, 1, 0.6705883, 0, 1,
-1.29728, -1.17782, -4.286909, 1, 0.6784314, 0, 1,
-1.29437, -2.402673, -1.813545, 1, 0.682353, 0, 1,
-1.292884, 1.048189, -1.377015, 1, 0.6901961, 0, 1,
-1.290747, -0.1387819, 0.7094162, 1, 0.6941177, 0, 1,
-1.286611, -0.8272815, -2.948503, 1, 0.7019608, 0, 1,
-1.285342, 3.178916, -2.407482, 1, 0.7098039, 0, 1,
-1.272869, 0.9683157, 0.861022, 1, 0.7137255, 0, 1,
-1.262035, -1.397117, -2.560847, 1, 0.7215686, 0, 1,
-1.260964, -1.535654, -4.556792, 1, 0.7254902, 0, 1,
-1.253246, 0.5918835, -1.347277, 1, 0.7333333, 0, 1,
-1.25072, -0.07142808, -2.365473, 1, 0.7372549, 0, 1,
-1.249971, 0.0530755, -3.445677, 1, 0.7450981, 0, 1,
-1.246482, -0.9706399, -1.335938, 1, 0.7490196, 0, 1,
-1.232819, 1.822633, -0.9510995, 1, 0.7568628, 0, 1,
-1.232232, -1.888716, -3.584476, 1, 0.7607843, 0, 1,
-1.2308, 0.4364761, -0.7736531, 1, 0.7686275, 0, 1,
-1.229194, 0.5595395, -0.4354849, 1, 0.772549, 0, 1,
-1.228537, 0.2812158, 0.1383387, 1, 0.7803922, 0, 1,
-1.221003, -1.59375, -2.736724, 1, 0.7843137, 0, 1,
-1.218517, -0.3565316, -2.903454, 1, 0.7921569, 0, 1,
-1.214395, 0.6984246, -1.996631, 1, 0.7960784, 0, 1,
-1.21162, 1.010478, -0.8368576, 1, 0.8039216, 0, 1,
-1.210094, -0.8096616, -1.262941, 1, 0.8117647, 0, 1,
-1.20881, 0.1290505, -0.1968601, 1, 0.8156863, 0, 1,
-1.202271, 1.654323, -0.5585768, 1, 0.8235294, 0, 1,
-1.196895, -0.2388502, -1.096888, 1, 0.827451, 0, 1,
-1.194808, 2.460849, -0.7282333, 1, 0.8352941, 0, 1,
-1.186813, 1.561455, 1.212568, 1, 0.8392157, 0, 1,
-1.182151, -0.8283027, -0.6140794, 1, 0.8470588, 0, 1,
-1.175276, 1.348307, 0.4384061, 1, 0.8509804, 0, 1,
-1.172039, -2.075022, -3.087837, 1, 0.8588235, 0, 1,
-1.171814, 0.02968805, -1.378426, 1, 0.8627451, 0, 1,
-1.168314, -0.2731302, -1.535253, 1, 0.8705882, 0, 1,
-1.156102, -0.7868026, -1.736409, 1, 0.8745098, 0, 1,
-1.14867, -0.7937416, -3.646128, 1, 0.8823529, 0, 1,
-1.145755, 0.3624151, -2.845804, 1, 0.8862745, 0, 1,
-1.144464, 0.2892306, -1.246257, 1, 0.8941177, 0, 1,
-1.1381, -2.056243, -3.671674, 1, 0.8980392, 0, 1,
-1.136118, 0.8472667, -1.380203, 1, 0.9058824, 0, 1,
-1.133089, 1.578616, -1.334957, 1, 0.9137255, 0, 1,
-1.12814, 0.5128903, -1.159388, 1, 0.9176471, 0, 1,
-1.125597, -0.3869534, -0.1466832, 1, 0.9254902, 0, 1,
-1.124564, 0.1591064, -1.817856, 1, 0.9294118, 0, 1,
-1.116658, 1.668913, -0.1682515, 1, 0.9372549, 0, 1,
-1.116293, 0.44356, -0.689333, 1, 0.9411765, 0, 1,
-1.112898, -2.002371, -2.267958, 1, 0.9490196, 0, 1,
-1.107497, -0.7530085, -2.037561, 1, 0.9529412, 0, 1,
-1.105126, 1.670727, -0.431603, 1, 0.9607843, 0, 1,
-1.098255, 1.014287, -2.353356, 1, 0.9647059, 0, 1,
-1.096566, -1.333428, -1.325321, 1, 0.972549, 0, 1,
-1.095955, -0.1832623, -2.706554, 1, 0.9764706, 0, 1,
-1.089205, 0.1908912, -2.941225, 1, 0.9843137, 0, 1,
-1.085244, 0.8934203, -1.862838, 1, 0.9882353, 0, 1,
-1.080994, 0.7419279, -1.892107, 1, 0.9960784, 0, 1,
-1.069995, -1.246816, -3.36446, 0.9960784, 1, 0, 1,
-1.06697, -0.3413411, -1.602888, 0.9921569, 1, 0, 1,
-1.061664, -1.152141, -2.862309, 0.9843137, 1, 0, 1,
-1.042171, -0.7454665, -1.577756, 0.9803922, 1, 0, 1,
-1.03337, -0.7781613, -0.9258026, 0.972549, 1, 0, 1,
-1.033104, -0.3173854, -1.377988, 0.9686275, 1, 0, 1,
-1.031988, 1.291722, -2.316991, 0.9607843, 1, 0, 1,
-1.029332, -1.148989, -1.378541, 0.9568627, 1, 0, 1,
-1.028223, -0.2594947, -1.40581, 0.9490196, 1, 0, 1,
-1.02105, 1.107825, -0.9174646, 0.945098, 1, 0, 1,
-1.019062, -0.09943746, -1.796308, 0.9372549, 1, 0, 1,
-1.015195, -0.01653985, -1.784805, 0.9333333, 1, 0, 1,
-1.007126, 0.7722986, -0.4483362, 0.9254902, 1, 0, 1,
-1.003622, 1.429654, -0.6680996, 0.9215686, 1, 0, 1,
-0.9963843, -1.434542, -2.554797, 0.9137255, 1, 0, 1,
-0.9899865, 2.715303, -0.8798939, 0.9098039, 1, 0, 1,
-0.9894267, -1.378182, -1.38724, 0.9019608, 1, 0, 1,
-0.9882129, -0.4447786, -0.400368, 0.8941177, 1, 0, 1,
-0.9845198, 0.6276957, -0.6536025, 0.8901961, 1, 0, 1,
-0.9749906, 0.3559844, -2.679573, 0.8823529, 1, 0, 1,
-0.9634761, 0.7549166, -0.1051189, 0.8784314, 1, 0, 1,
-0.9584649, -0.3598675, -2.490325, 0.8705882, 1, 0, 1,
-0.9541956, -0.9849369, -2.209473, 0.8666667, 1, 0, 1,
-0.9533666, 0.1584674, 0.8232759, 0.8588235, 1, 0, 1,
-0.946713, 0.8932039, 1.426243, 0.854902, 1, 0, 1,
-0.9414056, 0.2124395, -2.223784, 0.8470588, 1, 0, 1,
-0.938989, 0.5279824, -2.175507, 0.8431373, 1, 0, 1,
-0.9382315, 1.449324, -1.245414, 0.8352941, 1, 0, 1,
-0.9372272, 1.799672, -1.230349, 0.8313726, 1, 0, 1,
-0.9344633, 0.6400374, -0.2604962, 0.8235294, 1, 0, 1,
-0.9311199, 0.1333132, -1.697523, 0.8196079, 1, 0, 1,
-0.9293762, -0.7859104, -1.13372, 0.8117647, 1, 0, 1,
-0.9291723, -0.6083977, -0.6239455, 0.8078431, 1, 0, 1,
-0.9286098, 0.8277715, -0.9907718, 0.8, 1, 0, 1,
-0.9249548, 1.240243, -0.7618355, 0.7921569, 1, 0, 1,
-0.9225655, -0.09461805, -2.542497, 0.7882353, 1, 0, 1,
-0.9224188, -1.438352, -3.130222, 0.7803922, 1, 0, 1,
-0.9197695, 0.5347104, -1.697949, 0.7764706, 1, 0, 1,
-0.9194972, 0.6202273, -1.038619, 0.7686275, 1, 0, 1,
-0.9166681, 0.383721, 0.02306687, 0.7647059, 1, 0, 1,
-0.9143221, 0.08265995, 0.3289856, 0.7568628, 1, 0, 1,
-0.9097495, 0.6763707, 0.5503173, 0.7529412, 1, 0, 1,
-0.9043114, -0.6057519, -1.746163, 0.7450981, 1, 0, 1,
-0.9008776, 0.7194396, 0.07437343, 0.7411765, 1, 0, 1,
-0.8962719, 1.170931, -1.70617, 0.7333333, 1, 0, 1,
-0.8956431, 1.872349, -1.9375, 0.7294118, 1, 0, 1,
-0.8954329, 0.9376487, -0.5124116, 0.7215686, 1, 0, 1,
-0.8912339, 0.3727196, -1.403612, 0.7176471, 1, 0, 1,
-0.8829076, 0.2877941, -1.821141, 0.7098039, 1, 0, 1,
-0.8791919, 0.9272707, -2.823767, 0.7058824, 1, 0, 1,
-0.8752626, 1.809488, 0.8190366, 0.6980392, 1, 0, 1,
-0.8700684, -0.5158951, -1.833847, 0.6901961, 1, 0, 1,
-0.8674959, 0.1028702, -2.25633, 0.6862745, 1, 0, 1,
-0.8648053, 1.663134, 0.8382444, 0.6784314, 1, 0, 1,
-0.8589239, -1.54179, -1.797667, 0.6745098, 1, 0, 1,
-0.8561149, 0.4260908, -2.205425, 0.6666667, 1, 0, 1,
-0.8539194, 0.4831995, -0.7333664, 0.6627451, 1, 0, 1,
-0.8505161, -0.5592201, -0.3905491, 0.654902, 1, 0, 1,
-0.8496798, 0.5298064, 0.2623346, 0.6509804, 1, 0, 1,
-0.8455783, -1.074014, -1.873855, 0.6431373, 1, 0, 1,
-0.841819, -0.4022264, -0.1061885, 0.6392157, 1, 0, 1,
-0.8326312, -0.1523316, -2.099104, 0.6313726, 1, 0, 1,
-0.8265494, 0.663865, -2.691156, 0.627451, 1, 0, 1,
-0.8252499, -0.3691958, -1.370272, 0.6196079, 1, 0, 1,
-0.8133202, -0.2264702, -1.974549, 0.6156863, 1, 0, 1,
-0.8111523, -0.9295818, -0.9320635, 0.6078432, 1, 0, 1,
-0.8077194, -0.6695097, -1.717624, 0.6039216, 1, 0, 1,
-0.8075562, -0.5372999, -3.372323, 0.5960785, 1, 0, 1,
-0.8033383, -1.001631, -4.756128, 0.5882353, 1, 0, 1,
-0.8023733, -0.4194948, -2.272609, 0.5843138, 1, 0, 1,
-0.7998438, 0.8559949, -0.5300731, 0.5764706, 1, 0, 1,
-0.7925135, -0.8447294, -3.73899, 0.572549, 1, 0, 1,
-0.7889313, 0.3457823, -0.9393071, 0.5647059, 1, 0, 1,
-0.7833013, -1.044368, -2.071707, 0.5607843, 1, 0, 1,
-0.7776769, -0.04087379, -1.706166, 0.5529412, 1, 0, 1,
-0.7772264, 1.269374, -1.583574, 0.5490196, 1, 0, 1,
-0.7755334, 0.5506244, -0.1325247, 0.5411765, 1, 0, 1,
-0.7697724, -0.4814523, -1.740392, 0.5372549, 1, 0, 1,
-0.7672905, -0.3258484, -0.858678, 0.5294118, 1, 0, 1,
-0.7623101, -1.019495, -3.432229, 0.5254902, 1, 0, 1,
-0.7621033, 0.7180952, -3.17202, 0.5176471, 1, 0, 1,
-0.7615399, 0.7357501, -0.2033185, 0.5137255, 1, 0, 1,
-0.7549216, -0.1276277, -0.2264931, 0.5058824, 1, 0, 1,
-0.7544569, 0.462335, -0.9375937, 0.5019608, 1, 0, 1,
-0.754312, -0.7004321, -2.382648, 0.4941176, 1, 0, 1,
-0.7526423, -0.1740799, -2.666886, 0.4862745, 1, 0, 1,
-0.7453696, 0.8110529, -1.906321, 0.4823529, 1, 0, 1,
-0.7436398, -0.1028203, -0.9164509, 0.4745098, 1, 0, 1,
-0.7320087, -0.2663613, -1.918303, 0.4705882, 1, 0, 1,
-0.7302276, 0.2157218, -0.3030036, 0.4627451, 1, 0, 1,
-0.728944, -0.4366392, -1.346149, 0.4588235, 1, 0, 1,
-0.7286332, -0.4855361, -3.666609, 0.4509804, 1, 0, 1,
-0.7219844, -0.2893861, -3.146896, 0.4470588, 1, 0, 1,
-0.7163131, -0.4350215, -1.86057, 0.4392157, 1, 0, 1,
-0.7158946, -1.323842, -1.303177, 0.4352941, 1, 0, 1,
-0.7155777, 0.7607892, -1.244496, 0.427451, 1, 0, 1,
-0.7133058, -0.5386358, -1.714432, 0.4235294, 1, 0, 1,
-0.7124766, -0.901422, -3.586848, 0.4156863, 1, 0, 1,
-0.7068549, -0.4325793, -2.426807, 0.4117647, 1, 0, 1,
-0.7047538, -0.08613179, -0.2900386, 0.4039216, 1, 0, 1,
-0.7038847, 0.5641499, 1.632369, 0.3960784, 1, 0, 1,
-0.7024502, 0.1442855, -1.314458, 0.3921569, 1, 0, 1,
-0.6941259, 0.01255953, -0.8436851, 0.3843137, 1, 0, 1,
-0.6929909, -2.335289, -4.676159, 0.3803922, 1, 0, 1,
-0.6915487, -0.7435703, -1.37326, 0.372549, 1, 0, 1,
-0.6894326, 0.5199451, -2.12368, 0.3686275, 1, 0, 1,
-0.6877137, -1.680693, -3.87582, 0.3607843, 1, 0, 1,
-0.6843763, -0.2458836, -1.616358, 0.3568628, 1, 0, 1,
-0.675771, 1.608647, -0.4238954, 0.3490196, 1, 0, 1,
-0.6751555, -0.003733912, -3.172161, 0.345098, 1, 0, 1,
-0.6726932, -0.7077999, -1.974748, 0.3372549, 1, 0, 1,
-0.6690854, -1.107392, -1.838271, 0.3333333, 1, 0, 1,
-0.661104, 0.04588401, -0.4428467, 0.3254902, 1, 0, 1,
-0.6545325, 0.2852216, -1.004078, 0.3215686, 1, 0, 1,
-0.6418566, 0.8114009, -2.466137, 0.3137255, 1, 0, 1,
-0.6416659, 1.286177, -0.1543483, 0.3098039, 1, 0, 1,
-0.6415395, -1.638168, -4.409287, 0.3019608, 1, 0, 1,
-0.6383603, 0.2188334, -1.619308, 0.2941177, 1, 0, 1,
-0.6383237, -0.5918534, -2.073741, 0.2901961, 1, 0, 1,
-0.6323081, -0.06948683, -1.992118, 0.282353, 1, 0, 1,
-0.6308606, 0.3677959, -0.05355215, 0.2784314, 1, 0, 1,
-0.6187828, 0.4124745, -2.772506, 0.2705882, 1, 0, 1,
-0.618562, 1.365107, 2.733771, 0.2666667, 1, 0, 1,
-0.618233, -1.733361, -3.483016, 0.2588235, 1, 0, 1,
-0.6126608, -0.4660043, -2.560073, 0.254902, 1, 0, 1,
-0.6056629, 0.6323578, -1.646089, 0.2470588, 1, 0, 1,
-0.6050467, 0.8063338, 0.05540193, 0.2431373, 1, 0, 1,
-0.5961851, 0.1666586, -1.145766, 0.2352941, 1, 0, 1,
-0.5954433, -0.07278015, -1.889279, 0.2313726, 1, 0, 1,
-0.5945134, -1.227502, -1.382451, 0.2235294, 1, 0, 1,
-0.5873027, -0.4924017, -3.244135, 0.2196078, 1, 0, 1,
-0.5856405, -0.9110941, -3.197443, 0.2117647, 1, 0, 1,
-0.5834736, 0.2110588, -1.661473, 0.2078431, 1, 0, 1,
-0.5788557, 0.8803248, -0.2238276, 0.2, 1, 0, 1,
-0.5745978, 0.9723058, -1.684995, 0.1921569, 1, 0, 1,
-0.573528, 0.3020659, -1.180961, 0.1882353, 1, 0, 1,
-0.5689254, 1.158855, -0.7035179, 0.1803922, 1, 0, 1,
-0.5655406, 0.3602618, -1.817768, 0.1764706, 1, 0, 1,
-0.5589332, 0.6846547, -0.04059745, 0.1686275, 1, 0, 1,
-0.5515119, 2.050916, -0.01363492, 0.1647059, 1, 0, 1,
-0.5496531, -2.270747, -2.095246, 0.1568628, 1, 0, 1,
-0.5454966, 0.2314116, -2.136519, 0.1529412, 1, 0, 1,
-0.5430497, 0.2223798, -0.9756267, 0.145098, 1, 0, 1,
-0.5344148, 0.4508558, -0.5704817, 0.1411765, 1, 0, 1,
-0.5328811, -0.2367978, 0.1759244, 0.1333333, 1, 0, 1,
-0.5222602, 1.596286, -0.2671467, 0.1294118, 1, 0, 1,
-0.5219857, -0.251154, -1.506723, 0.1215686, 1, 0, 1,
-0.5207831, -2.071234, -1.84645, 0.1176471, 1, 0, 1,
-0.5169814, 0.2486192, -1.438905, 0.1098039, 1, 0, 1,
-0.5140182, 0.2706221, -2.012642, 0.1058824, 1, 0, 1,
-0.5134565, 1.542247, -1.080991, 0.09803922, 1, 0, 1,
-0.5077656, -1.28401, -3.021576, 0.09019608, 1, 0, 1,
-0.5065906, -0.8565636, -3.662701, 0.08627451, 1, 0, 1,
-0.5060606, 0.211404, -0.9001346, 0.07843138, 1, 0, 1,
-0.4994493, 0.9252324, -1.069481, 0.07450981, 1, 0, 1,
-0.4968724, -0.3675895, -1.624713, 0.06666667, 1, 0, 1,
-0.4958031, 0.2700015, 0.004983769, 0.0627451, 1, 0, 1,
-0.4923823, 2.409231, 0.5730456, 0.05490196, 1, 0, 1,
-0.4919259, -1.268402, -3.400906, 0.05098039, 1, 0, 1,
-0.4916903, 0.9419304, -0.1909031, 0.04313726, 1, 0, 1,
-0.4890872, 1.835335, 0.490933, 0.03921569, 1, 0, 1,
-0.4886488, 0.2208426, -1.465357, 0.03137255, 1, 0, 1,
-0.4853294, -0.2481682, -2.502223, 0.02745098, 1, 0, 1,
-0.4818042, -0.2009221, -2.223439, 0.01960784, 1, 0, 1,
-0.4815673, -0.7401316, -3.994387, 0.01568628, 1, 0, 1,
-0.4788814, -2.496431, -3.600619, 0.007843138, 1, 0, 1,
-0.4782987, 1.921576, -0.02952015, 0.003921569, 1, 0, 1,
-0.4751171, -0.5810511, -1.635536, 0, 1, 0.003921569, 1,
-0.4718944, 0.5545993, -0.1336598, 0, 1, 0.01176471, 1,
-0.4716636, 0.8620626, 0.3905386, 0, 1, 0.01568628, 1,
-0.4702338, -1.349958, -3.525321, 0, 1, 0.02352941, 1,
-0.4701852, -0.155627, -3.561337, 0, 1, 0.02745098, 1,
-0.4603907, -0.5344003, -3.364994, 0, 1, 0.03529412, 1,
-0.451211, 0.2357748, 0.0239818, 0, 1, 0.03921569, 1,
-0.4491542, -1.635258, -1.551509, 0, 1, 0.04705882, 1,
-0.4472976, 0.7491605, 0.1410691, 0, 1, 0.05098039, 1,
-0.4466639, -0.1241904, -2.665923, 0, 1, 0.05882353, 1,
-0.4387628, 0.007365472, -3.339936, 0, 1, 0.0627451, 1,
-0.4306256, 2.27068, -0.3350035, 0, 1, 0.07058824, 1,
-0.4276954, 0.5560138, 0.4866521, 0, 1, 0.07450981, 1,
-0.4259826, 2.306415, -1.157097, 0, 1, 0.08235294, 1,
-0.4243844, 0.6740273, -0.09074428, 0, 1, 0.08627451, 1,
-0.422597, 0.04432977, -1.829002, 0, 1, 0.09411765, 1,
-0.4206553, -1.154415, -5.105259, 0, 1, 0.1019608, 1,
-0.4198691, 0.2081373, 0.6623992, 0, 1, 0.1058824, 1,
-0.4168431, -0.4925843, -1.134776, 0, 1, 0.1137255, 1,
-0.4148807, 1.456258, -0.04925093, 0, 1, 0.1176471, 1,
-0.4134426, -1.408959, -2.52889, 0, 1, 0.1254902, 1,
-0.4079539, 0.6577588, -0.9341257, 0, 1, 0.1294118, 1,
-0.4072178, 1.522161, 0.285326, 0, 1, 0.1372549, 1,
-0.4016511, 1.464442, -0.5930778, 0, 1, 0.1411765, 1,
-0.4015272, 1.420131, 1.862564, 0, 1, 0.1490196, 1,
-0.4002892, -1.181074, -1.604499, 0, 1, 0.1529412, 1,
-0.3944763, -2.924439, -2.850521, 0, 1, 0.1607843, 1,
-0.3941609, 1.295443, -2.038898, 0, 1, 0.1647059, 1,
-0.3882948, -2.346096, -4.614804, 0, 1, 0.172549, 1,
-0.387688, -0.1515737, 0.1352564, 0, 1, 0.1764706, 1,
-0.3858113, -0.4146969, -2.603717, 0, 1, 0.1843137, 1,
-0.3825536, -2.465635, -4.333749, 0, 1, 0.1882353, 1,
-0.3792136, 0.1959885, -0.2617178, 0, 1, 0.1960784, 1,
-0.378141, -0.6494052, -2.053706, 0, 1, 0.2039216, 1,
-0.3751265, 1.746246, -0.01551994, 0, 1, 0.2078431, 1,
-0.3748459, -1.277234, -4.472699, 0, 1, 0.2156863, 1,
-0.3742987, 2.162862, -0.5704037, 0, 1, 0.2196078, 1,
-0.3730572, -0.3773864, -1.608561, 0, 1, 0.227451, 1,
-0.3599142, 0.562395, -1.771474, 0, 1, 0.2313726, 1,
-0.3580973, -2.413548, -1.621622, 0, 1, 0.2392157, 1,
-0.357771, 1.275204, -0.9467459, 0, 1, 0.2431373, 1,
-0.3541883, 0.2812907, -0.8571231, 0, 1, 0.2509804, 1,
-0.3531491, -2.490276, -1.711496, 0, 1, 0.254902, 1,
-0.3513728, 0.2497609, -0.9761224, 0, 1, 0.2627451, 1,
-0.3513181, -0.9084071, -3.994772, 0, 1, 0.2666667, 1,
-0.3506384, 0.2967978, -0.9693386, 0, 1, 0.2745098, 1,
-0.349955, -0.5803868, -2.45017, 0, 1, 0.2784314, 1,
-0.3485851, 0.4887201, -0.3689531, 0, 1, 0.2862745, 1,
-0.3471712, -0.7753425, -3.790235, 0, 1, 0.2901961, 1,
-0.3451223, -0.9660386, -2.345779, 0, 1, 0.2980392, 1,
-0.3446451, 0.5742554, 1.208744, 0, 1, 0.3058824, 1,
-0.3429033, -0.06526319, -2.086916, 0, 1, 0.3098039, 1,
-0.342722, 0.8462628, -0.5952278, 0, 1, 0.3176471, 1,
-0.341058, 0.5414672, 0.3324085, 0, 1, 0.3215686, 1,
-0.3391705, 0.01653407, -2.125179, 0, 1, 0.3294118, 1,
-0.3384751, 0.03957598, -2.476814, 0, 1, 0.3333333, 1,
-0.3305852, -0.1401349, -1.178941, 0, 1, 0.3411765, 1,
-0.3304078, -0.4224263, -2.075137, 0, 1, 0.345098, 1,
-0.325489, -0.02620341, -1.537342, 0, 1, 0.3529412, 1,
-0.3253938, 1.676403, 1.696843, 0, 1, 0.3568628, 1,
-0.3224829, 0.7107474, 0.5892022, 0, 1, 0.3647059, 1,
-0.3200138, -0.3313279, -1.8411, 0, 1, 0.3686275, 1,
-0.3175543, -1.181531, -3.888936, 0, 1, 0.3764706, 1,
-0.3146023, 0.5316437, 0.6680089, 0, 1, 0.3803922, 1,
-0.313086, -0.005945746, -0.4140323, 0, 1, 0.3882353, 1,
-0.3124483, 1.023195, -0.2401512, 0, 1, 0.3921569, 1,
-0.3077404, -0.5017021, -2.029108, 0, 1, 0.4, 1,
-0.3046177, 1.428362, 0.04134001, 0, 1, 0.4078431, 1,
-0.3014909, 1.700456, -0.7263885, 0, 1, 0.4117647, 1,
-0.2965977, -0.2091719, -1.641851, 0, 1, 0.4196078, 1,
-0.2930661, -1.490586, -2.287071, 0, 1, 0.4235294, 1,
-0.2877976, 1.089473, -0.620576, 0, 1, 0.4313726, 1,
-0.2874608, 0.5746425, -0.462373, 0, 1, 0.4352941, 1,
-0.285161, -0.573487, -4.360448, 0, 1, 0.4431373, 1,
-0.2825286, -0.6695972, -2.3221, 0, 1, 0.4470588, 1,
-0.2776249, 0.8963879, 0.08104988, 0, 1, 0.454902, 1,
-0.2759468, 1.335263, -1.857342, 0, 1, 0.4588235, 1,
-0.2680866, 1.092815, -0.3699779, 0, 1, 0.4666667, 1,
-0.2675636, 1.304384, 1.713777, 0, 1, 0.4705882, 1,
-0.263654, -0.753664, -2.875337, 0, 1, 0.4784314, 1,
-0.2633286, -1.769298, -4.27229, 0, 1, 0.4823529, 1,
-0.2593364, -2.481669, -4.060318, 0, 1, 0.4901961, 1,
-0.2593328, 0.01698504, -1.50977, 0, 1, 0.4941176, 1,
-0.2585575, -1.933008, -3.204976, 0, 1, 0.5019608, 1,
-0.2547003, 0.7154503, -0.4872044, 0, 1, 0.509804, 1,
-0.2539648, -0.4334382, -3.768963, 0, 1, 0.5137255, 1,
-0.2518093, -0.07520333, -3.097484, 0, 1, 0.5215687, 1,
-0.2489119, 0.946412, 1.005329, 0, 1, 0.5254902, 1,
-0.2481053, -0.8720238, -4.491651, 0, 1, 0.5333334, 1,
-0.2370312, 0.04489601, -1.154866, 0, 1, 0.5372549, 1,
-0.2361134, 0.5958772, -0.2265644, 0, 1, 0.5450981, 1,
-0.2357969, 0.8453132, -1.427296, 0, 1, 0.5490196, 1,
-0.2305694, -0.3696681, -1.814204, 0, 1, 0.5568628, 1,
-0.2245954, 0.3076475, -0.7212592, 0, 1, 0.5607843, 1,
-0.2235498, -1.050897, -0.9762396, 0, 1, 0.5686275, 1,
-0.2218235, 0.7475438, -0.9505423, 0, 1, 0.572549, 1,
-0.2212935, -0.5717521, -1.645681, 0, 1, 0.5803922, 1,
-0.2207259, -0.261763, -3.395448, 0, 1, 0.5843138, 1,
-0.2173096, 0.7990493, -1.555255, 0, 1, 0.5921569, 1,
-0.2131696, 0.2972254, 0.5643908, 0, 1, 0.5960785, 1,
-0.2125212, 0.9313005, -0.970867, 0, 1, 0.6039216, 1,
-0.2107963, 0.8072839, 0.2758786, 0, 1, 0.6117647, 1,
-0.2094602, 1.703696, -0.04316619, 0, 1, 0.6156863, 1,
-0.208816, -0.584086, -2.342865, 0, 1, 0.6235294, 1,
-0.2077094, -0.9725986, -4.085184, 0, 1, 0.627451, 1,
-0.2076448, -1.694484, -4.322202, 0, 1, 0.6352941, 1,
-0.2025757, 0.2638669, -0.01960656, 0, 1, 0.6392157, 1,
-0.2023491, 2.086441, 0.0284924, 0, 1, 0.6470588, 1,
-0.1965846, -1.457102, -2.646238, 0, 1, 0.6509804, 1,
-0.1956492, -1.22711, -2.259311, 0, 1, 0.6588235, 1,
-0.1956216, -0.683185, -1.943128, 0, 1, 0.6627451, 1,
-0.1904714, 2.115077, 1.389311, 0, 1, 0.6705883, 1,
-0.188264, -1.399832, -3.425912, 0, 1, 0.6745098, 1,
-0.1875282, 0.6813782, -1.664207, 0, 1, 0.682353, 1,
-0.1834069, 1.085655, -1.3845, 0, 1, 0.6862745, 1,
-0.1832772, 0.3895558, -0.3018006, 0, 1, 0.6941177, 1,
-0.1776416, 1.817412, -0.0005430827, 0, 1, 0.7019608, 1,
-0.176483, 0.5553318, 0.8883811, 0, 1, 0.7058824, 1,
-0.17451, -1.459547, -2.661209, 0, 1, 0.7137255, 1,
-0.1736666, 1.030814, 0.960493, 0, 1, 0.7176471, 1,
-0.1723654, 0.966488, 0.9864373, 0, 1, 0.7254902, 1,
-0.1692579, -2.708159, -3.446723, 0, 1, 0.7294118, 1,
-0.1669088, 0.4299384, -0.08317403, 0, 1, 0.7372549, 1,
-0.1610678, 1.092574, -0.7137077, 0, 1, 0.7411765, 1,
-0.1576206, -0.2712536, -2.671225, 0, 1, 0.7490196, 1,
-0.1561011, -1.147795, -1.895901, 0, 1, 0.7529412, 1,
-0.1560933, 0.4126408, -1.49165, 0, 1, 0.7607843, 1,
-0.1480203, 0.8840574, -1.178783, 0, 1, 0.7647059, 1,
-0.1447345, -0.5888522, -2.57291, 0, 1, 0.772549, 1,
-0.1401565, -1.064412, -2.099249, 0, 1, 0.7764706, 1,
-0.1354734, 1.557027, 1.854672, 0, 1, 0.7843137, 1,
-0.1338681, 2.04328, -1.173825, 0, 1, 0.7882353, 1,
-0.1307872, -1.330534, -2.49669, 0, 1, 0.7960784, 1,
-0.1260591, -0.3807344, -3.125527, 0, 1, 0.8039216, 1,
-0.1258319, -0.1657524, -2.057036, 0, 1, 0.8078431, 1,
-0.1241757, -0.2839431, -4.024303, 0, 1, 0.8156863, 1,
-0.1241546, 1.172727, -0.3123044, 0, 1, 0.8196079, 1,
-0.1239901, -1.326268, -3.16074, 0, 1, 0.827451, 1,
-0.1222714, -1.449304, -1.946314, 0, 1, 0.8313726, 1,
-0.1208745, -1.215926, -3.592279, 0, 1, 0.8392157, 1,
-0.1149049, -0.007553063, -2.936073, 0, 1, 0.8431373, 1,
-0.1141777, 0.3435053, 0.4133422, 0, 1, 0.8509804, 1,
-0.1106015, 1.848923, -1.365618, 0, 1, 0.854902, 1,
-0.1102912, 0.1347864, -0.8948631, 0, 1, 0.8627451, 1,
-0.1099218, 0.6164559, 0.3691355, 0, 1, 0.8666667, 1,
-0.1079137, -0.2728254, -2.092745, 0, 1, 0.8745098, 1,
-0.1047082, 1.002476, -0.95525, 0, 1, 0.8784314, 1,
-0.1032273, -0.1964335, -2.201367, 0, 1, 0.8862745, 1,
-0.1018761, -0.2003969, -2.334534, 0, 1, 0.8901961, 1,
-0.1005341, -1.769403, -2.108786, 0, 1, 0.8980392, 1,
-0.1004781, -0.8635425, -5.02316, 0, 1, 0.9058824, 1,
-0.09983413, -0.6814267, -3.77478, 0, 1, 0.9098039, 1,
-0.09797224, -0.1445487, -2.962712, 0, 1, 0.9176471, 1,
-0.09699079, -0.5675174, -3.91157, 0, 1, 0.9215686, 1,
-0.09653109, -0.5813735, -3.624325, 0, 1, 0.9294118, 1,
-0.09554671, 0.1530199, -1.193287, 0, 1, 0.9333333, 1,
-0.09380095, -1.020095, -2.778383, 0, 1, 0.9411765, 1,
-0.0932845, 0.09632602, -0.1051076, 0, 1, 0.945098, 1,
-0.09062463, -1.501905, -3.065347, 0, 1, 0.9529412, 1,
-0.09026215, -1.207296, -2.757843, 0, 1, 0.9568627, 1,
-0.08493552, -1.474752, -4.165941, 0, 1, 0.9647059, 1,
-0.07906231, 0.504036, 2.272244, 0, 1, 0.9686275, 1,
-0.07834379, 0.3050414, -2.261302, 0, 1, 0.9764706, 1,
-0.07711846, -0.7515349, -3.491353, 0, 1, 0.9803922, 1,
-0.07643086, -0.3990319, -4.623724, 0, 1, 0.9882353, 1,
-0.07637145, -0.5317785, -4.059779, 0, 1, 0.9921569, 1,
-0.06920265, -1.046204, -3.826459, 0, 1, 1, 1,
-0.06661993, -0.3812632, -3.790098, 0, 0.9921569, 1, 1,
-0.06475938, 0.2259785, -0.1542216, 0, 0.9882353, 1, 1,
-0.0632186, -1.383813, -2.596837, 0, 0.9803922, 1, 1,
-0.06056821, 0.9274919, -1.706577, 0, 0.9764706, 1, 1,
-0.0588146, 0.8517008, -0.7190541, 0, 0.9686275, 1, 1,
-0.05755468, -2.439178, -2.882161, 0, 0.9647059, 1, 1,
-0.05706557, 0.35389, 0.847754, 0, 0.9568627, 1, 1,
-0.04764254, 0.4267611, 0.6845722, 0, 0.9529412, 1, 1,
-0.04638582, -0.8968011, -2.523404, 0, 0.945098, 1, 1,
-0.04555551, 0.2546601, -0.7396259, 0, 0.9411765, 1, 1,
-0.04470865, 0.9558277, 2.338265, 0, 0.9333333, 1, 1,
-0.03941192, 0.4539861, 1.366632, 0, 0.9294118, 1, 1,
-0.03880851, 0.2842216, -0.9793816, 0, 0.9215686, 1, 1,
-0.02106605, -0.09883805, -2.40319, 0, 0.9176471, 1, 1,
-0.02066352, -0.6381776, -4.371943, 0, 0.9098039, 1, 1,
-0.01861219, -1.717617, -2.729758, 0, 0.9058824, 1, 1,
-0.01269976, -1.084294, -3.816309, 0, 0.8980392, 1, 1,
-0.01031563, -0.3898418, -2.397774, 0, 0.8901961, 1, 1,
-0.008550475, -0.3517688, -3.008271, 0, 0.8862745, 1, 1,
-0.007749015, 0.6012418, 1.634559, 0, 0.8784314, 1, 1,
-0.007566457, -0.3118904, -2.887764, 0, 0.8745098, 1, 1,
-0.007086056, 0.3681554, -0.825878, 0, 0.8666667, 1, 1,
-0.006313708, -1.673172, -4.694087, 0, 0.8627451, 1, 1,
-0.004754458, -0.1139818, -2.777262, 0, 0.854902, 1, 1,
-0.003809205, -0.6350659, -1.197966, 0, 0.8509804, 1, 1,
-0.001492579, -0.06581881, -2.643431, 0, 0.8431373, 1, 1,
-7.44756e-05, -0.9252226, -1.709791, 0, 0.8392157, 1, 1,
0.001073166, 2.815488, -1.343336, 0, 0.8313726, 1, 1,
0.006247536, 0.269065, 1.492551, 0, 0.827451, 1, 1,
0.009656265, -0.2159555, 4.046434, 0, 0.8196079, 1, 1,
0.01132459, -0.9880045, 4.648332, 0, 0.8156863, 1, 1,
0.01425554, -0.3528304, 2.280118, 0, 0.8078431, 1, 1,
0.01961081, -0.2541174, 2.428721, 0, 0.8039216, 1, 1,
0.01983982, -1.135697, 3.869519, 0, 0.7960784, 1, 1,
0.02063907, 0.614297, 0.4425499, 0, 0.7882353, 1, 1,
0.02456917, -1.730589, 2.831612, 0, 0.7843137, 1, 1,
0.02470316, 0.5598675, -0.8866565, 0, 0.7764706, 1, 1,
0.02509514, 0.6927219, -0.7943335, 0, 0.772549, 1, 1,
0.02577482, -0.4354396, 2.853163, 0, 0.7647059, 1, 1,
0.0297801, -2.567912, 4.875947, 0, 0.7607843, 1, 1,
0.02979981, -0.2080621, 3.527758, 0, 0.7529412, 1, 1,
0.03017517, 0.4613404, 1.112615, 0, 0.7490196, 1, 1,
0.03236256, -0.3133441, 3.318952, 0, 0.7411765, 1, 1,
0.03374941, 1.110924, -0.5993149, 0, 0.7372549, 1, 1,
0.03959079, -1.330072, 2.863074, 0, 0.7294118, 1, 1,
0.04060115, -0.7331081, 2.162878, 0, 0.7254902, 1, 1,
0.0409462, 0.4184493, -1.232286, 0, 0.7176471, 1, 1,
0.04156498, -0.5488805, 2.206605, 0, 0.7137255, 1, 1,
0.0427479, -1.662733, 4.471828, 0, 0.7058824, 1, 1,
0.04285184, -0.5366472, 4.207752, 0, 0.6980392, 1, 1,
0.04298534, 0.2353349, -0.04136894, 0, 0.6941177, 1, 1,
0.05210707, 0.8390091, -0.2417664, 0, 0.6862745, 1, 1,
0.05299686, -0.1197216, 3.218096, 0, 0.682353, 1, 1,
0.05363693, -0.1184979, 1.337613, 0, 0.6745098, 1, 1,
0.05862144, 1.433007, 1.133043, 0, 0.6705883, 1, 1,
0.05930722, 0.1473484, 1.434664, 0, 0.6627451, 1, 1,
0.06448536, 1.132298, 0.1206269, 0, 0.6588235, 1, 1,
0.06495974, -0.7290156, 2.666453, 0, 0.6509804, 1, 1,
0.06648804, -2.418839, 3.718794, 0, 0.6470588, 1, 1,
0.06672031, -1.442557, 4.570503, 0, 0.6392157, 1, 1,
0.06682522, -0.1640727, 2.637352, 0, 0.6352941, 1, 1,
0.06791881, 1.129411, -0.5092734, 0, 0.627451, 1, 1,
0.07313094, 0.4144295, 1.746735, 0, 0.6235294, 1, 1,
0.07507399, -2.367718, 3.586195, 0, 0.6156863, 1, 1,
0.0795651, 0.2442758, 1.841937, 0, 0.6117647, 1, 1,
0.08021205, 1.723389, -0.03090085, 0, 0.6039216, 1, 1,
0.08065985, -0.6048131, 2.935137, 0, 0.5960785, 1, 1,
0.08287283, -0.6897768, 0.8277665, 0, 0.5921569, 1, 1,
0.08511082, -0.490874, 2.961579, 0, 0.5843138, 1, 1,
0.08542207, 1.076042, -1.11669, 0, 0.5803922, 1, 1,
0.08653353, -0.6729754, 3.462762, 0, 0.572549, 1, 1,
0.09760517, 0.165434, 0.8620459, 0, 0.5686275, 1, 1,
0.0979883, -0.2464297, 2.150237, 0, 0.5607843, 1, 1,
0.1011625, -0.4918325, 3.797941, 0, 0.5568628, 1, 1,
0.103789, -0.1224367, 1.768336, 0, 0.5490196, 1, 1,
0.1077956, -0.7026848, 2.702685, 0, 0.5450981, 1, 1,
0.1090657, 0.2914398, 1.833877, 0, 0.5372549, 1, 1,
0.1139358, 1.79976, 1.169972, 0, 0.5333334, 1, 1,
0.1168796, -2.125334, 2.936239, 0, 0.5254902, 1, 1,
0.1169879, -0.02764811, 3.086164, 0, 0.5215687, 1, 1,
0.1182061, 0.3312117, 2.292593, 0, 0.5137255, 1, 1,
0.1182311, -0.6646912, 3.386285, 0, 0.509804, 1, 1,
0.1210457, 2.272046, 0.8785596, 0, 0.5019608, 1, 1,
0.1262365, 2.249254, -0.9217172, 0, 0.4941176, 1, 1,
0.1323198, -0.1402369, 1.84893, 0, 0.4901961, 1, 1,
0.1371564, 1.045174, -0.3933119, 0, 0.4823529, 1, 1,
0.1393156, -2.254644, 3.202332, 0, 0.4784314, 1, 1,
0.1457943, -0.9623991, 2.795733, 0, 0.4705882, 1, 1,
0.1467091, -0.1337429, 1.709748, 0, 0.4666667, 1, 1,
0.1537, 1.02503, 0.6192242, 0, 0.4588235, 1, 1,
0.1562046, 0.8498219, 0.7521988, 0, 0.454902, 1, 1,
0.1589276, 0.1019645, 0.6516366, 0, 0.4470588, 1, 1,
0.1593783, -0.8630288, 3.055781, 0, 0.4431373, 1, 1,
0.1635493, -0.3788887, 3.292648, 0, 0.4352941, 1, 1,
0.1699788, 1.366456, 1.936369, 0, 0.4313726, 1, 1,
0.1720314, -0.8192523, 1.41765, 0, 0.4235294, 1, 1,
0.1729512, -1.225905, 2.044448, 0, 0.4196078, 1, 1,
0.1736576, -0.5442368, 2.801909, 0, 0.4117647, 1, 1,
0.1813333, 1.721232, -0.5561187, 0, 0.4078431, 1, 1,
0.1813645, -1.833699, 2.695786, 0, 0.4, 1, 1,
0.1839484, 0.0816959, 1.930283, 0, 0.3921569, 1, 1,
0.1899255, -2.058052, 2.443637, 0, 0.3882353, 1, 1,
0.1902897, -0.07725085, 3.449923, 0, 0.3803922, 1, 1,
0.1903261, 0.1467197, 0.4533266, 0, 0.3764706, 1, 1,
0.1953224, -1.615251, 1.805657, 0, 0.3686275, 1, 1,
0.1979241, -0.3024783, 2.32576, 0, 0.3647059, 1, 1,
0.1989474, -0.8740857, 1.944368, 0, 0.3568628, 1, 1,
0.2036407, -0.7858099, 2.471944, 0, 0.3529412, 1, 1,
0.2073885, 0.4451898, 2.193271, 0, 0.345098, 1, 1,
0.2079191, -3.052063, 3.035371, 0, 0.3411765, 1, 1,
0.2085494, -0.4738699, 3.530859, 0, 0.3333333, 1, 1,
0.2088449, -1.815192, 1.292897, 0, 0.3294118, 1, 1,
0.2102491, 0.7201706, -1.343754, 0, 0.3215686, 1, 1,
0.2122361, -0.6200121, 2.597217, 0, 0.3176471, 1, 1,
0.2145861, 0.08386198, 2.596587, 0, 0.3098039, 1, 1,
0.2153206, -0.7841879, 1.457398, 0, 0.3058824, 1, 1,
0.2177999, 0.7648776, 0.07708096, 0, 0.2980392, 1, 1,
0.2180506, -0.9391996, 2.796626, 0, 0.2901961, 1, 1,
0.2223042, 0.595129, -0.2892139, 0, 0.2862745, 1, 1,
0.2240842, 0.5945126, 0.517437, 0, 0.2784314, 1, 1,
0.2259984, 0.4534445, 2.478347, 0, 0.2745098, 1, 1,
0.2265736, 1.253567, -1.674173, 0, 0.2666667, 1, 1,
0.2265947, 1.335425, -1.951356, 0, 0.2627451, 1, 1,
0.2304567, -0.8154836, 1.815359, 0, 0.254902, 1, 1,
0.2344075, 0.6872978, -1.389116, 0, 0.2509804, 1, 1,
0.2345048, 1.949235, 0.4719192, 0, 0.2431373, 1, 1,
0.2426261, -1.028504, 2.540394, 0, 0.2392157, 1, 1,
0.2440218, 0.1149631, -1.403714, 0, 0.2313726, 1, 1,
0.245469, -0.6873835, 3.014085, 0, 0.227451, 1, 1,
0.2468847, 0.1528835, 1.319484, 0, 0.2196078, 1, 1,
0.2482172, 0.3406303, -0.4669467, 0, 0.2156863, 1, 1,
0.2492088, 1.419606, 0.8198591, 0, 0.2078431, 1, 1,
0.2528655, 0.5363743, -1.009987, 0, 0.2039216, 1, 1,
0.2549699, 0.8136162, -0.115147, 0, 0.1960784, 1, 1,
0.2550955, 0.3301898, 0.2066957, 0, 0.1882353, 1, 1,
0.2584228, -0.7234049, 3.10845, 0, 0.1843137, 1, 1,
0.258947, 0.428138, 2.423472, 0, 0.1764706, 1, 1,
0.2612285, 0.7877262, -0.5885293, 0, 0.172549, 1, 1,
0.2633216, 0.8090435, 1.32447, 0, 0.1647059, 1, 1,
0.2658508, -1.943265, 1.431559, 0, 0.1607843, 1, 1,
0.2666913, 1.005543, 1.90818, 0, 0.1529412, 1, 1,
0.2696909, 0.7182732, -1.377349, 0, 0.1490196, 1, 1,
0.2701778, 1.205671, 0.6001897, 0, 0.1411765, 1, 1,
0.2726956, -0.2626566, 1.105998, 0, 0.1372549, 1, 1,
0.2766442, -0.560748, 3.008672, 0, 0.1294118, 1, 1,
0.2792239, -0.5655596, 3.154984, 0, 0.1254902, 1, 1,
0.2869917, 0.2053879, -0.1946864, 0, 0.1176471, 1, 1,
0.289788, -0.131861, 1.507218, 0, 0.1137255, 1, 1,
0.2918518, -0.5107325, 3.456789, 0, 0.1058824, 1, 1,
0.2923366, -0.09909673, 3.235569, 0, 0.09803922, 1, 1,
0.2965609, -0.241398, 1.835661, 0, 0.09411765, 1, 1,
0.2966199, 0.6743202, 0.4916553, 0, 0.08627451, 1, 1,
0.297826, -0.6561435, 2.621091, 0, 0.08235294, 1, 1,
0.2984209, -0.4200591, 4.577086, 0, 0.07450981, 1, 1,
0.3016769, 0.5293432, -0.274478, 0, 0.07058824, 1, 1,
0.3032674, 1.318547, -0.271181, 0, 0.0627451, 1, 1,
0.3045146, -0.9392964, 1.450975, 0, 0.05882353, 1, 1,
0.3111414, 1.14387, -0.4572286, 0, 0.05098039, 1, 1,
0.3146582, 0.7057849, -0.8012598, 0, 0.04705882, 1, 1,
0.3156479, -0.8085074, 2.486573, 0, 0.03921569, 1, 1,
0.315712, 0.3097038, 0.9670215, 0, 0.03529412, 1, 1,
0.3166047, 1.785051, 0.4911132, 0, 0.02745098, 1, 1,
0.323141, 0.4729702, 0.05874719, 0, 0.02352941, 1, 1,
0.3235649, -1.732045, 3.046656, 0, 0.01568628, 1, 1,
0.3252716, -1.040582, 4.436433, 0, 0.01176471, 1, 1,
0.3263329, -0.3667006, 5.359818, 0, 0.003921569, 1, 1,
0.3293788, -0.2477402, 3.164216, 0.003921569, 0, 1, 1,
0.3307292, 1.846811, 0.8506526, 0.007843138, 0, 1, 1,
0.3310864, 0.9108509, 0.2773347, 0.01568628, 0, 1, 1,
0.3345774, 1.053694, 0.2185558, 0.01960784, 0, 1, 1,
0.3363062, -0.6802341, 3.029995, 0.02745098, 0, 1, 1,
0.3371965, -1.21373, 1.313133, 0.03137255, 0, 1, 1,
0.3436741, -0.4841087, 3.866735, 0.03921569, 0, 1, 1,
0.3471276, -2.151756, 3.126726, 0.04313726, 0, 1, 1,
0.3490409, -0.05014197, 4.186306, 0.05098039, 0, 1, 1,
0.3601734, -0.4266028, 2.487933, 0.05490196, 0, 1, 1,
0.3619273, -0.1312305, 2.495963, 0.0627451, 0, 1, 1,
0.3620423, -0.7403895, 1.822296, 0.06666667, 0, 1, 1,
0.3681013, -1.016455, 1.873588, 0.07450981, 0, 1, 1,
0.3758452, 0.8276126, 0.08633949, 0.07843138, 0, 1, 1,
0.3810702, -0.9683909, 2.947857, 0.08627451, 0, 1, 1,
0.3899928, -1.924811, 1.471658, 0.09019608, 0, 1, 1,
0.3913476, 1.353314, -1.757447, 0.09803922, 0, 1, 1,
0.3958591, -0.772686, 2.183172, 0.1058824, 0, 1, 1,
0.3974187, 1.014176, -0.6951695, 0.1098039, 0, 1, 1,
0.3978522, -0.9212081, 3.661633, 0.1176471, 0, 1, 1,
0.399694, 1.066496, -0.2918582, 0.1215686, 0, 1, 1,
0.4023675, -0.8536918, 1.363746, 0.1294118, 0, 1, 1,
0.4029392, 1.254443, 0.5239756, 0.1333333, 0, 1, 1,
0.4091429, -0.2682513, 0.6419249, 0.1411765, 0, 1, 1,
0.4111671, -1.078388, 0.9410653, 0.145098, 0, 1, 1,
0.4117104, 0.8978298, 0.4089867, 0.1529412, 0, 1, 1,
0.4206057, -0.6466855, 1.984341, 0.1568628, 0, 1, 1,
0.4226264, -2.378977, 1.467229, 0.1647059, 0, 1, 1,
0.4269117, -2.955563, 4.018092, 0.1686275, 0, 1, 1,
0.4270895, 0.8163107, 1.652084, 0.1764706, 0, 1, 1,
0.4272635, 1.351898, -0.5238771, 0.1803922, 0, 1, 1,
0.428093, 1.484073, 1.71697, 0.1882353, 0, 1, 1,
0.4292649, -0.1445378, 0.8478282, 0.1921569, 0, 1, 1,
0.4294479, -0.2680139, 2.229386, 0.2, 0, 1, 1,
0.430765, 1.2502, -0.04884968, 0.2078431, 0, 1, 1,
0.4319761, -0.6770426, 2.154497, 0.2117647, 0, 1, 1,
0.4335529, -1.592058, 2.089128, 0.2196078, 0, 1, 1,
0.4363121, 0.4744754, 0.8241192, 0.2235294, 0, 1, 1,
0.4364662, 0.4850194, 1.43334, 0.2313726, 0, 1, 1,
0.4396441, 0.006789898, 1.686101, 0.2352941, 0, 1, 1,
0.4433576, 0.007268155, 2.204787, 0.2431373, 0, 1, 1,
0.4434747, 0.2875175, -0.2768601, 0.2470588, 0, 1, 1,
0.4470255, -0.9656034, 2.7251, 0.254902, 0, 1, 1,
0.4487305, -0.07841729, 0.6733102, 0.2588235, 0, 1, 1,
0.4630381, -1.363497, 2.273436, 0.2666667, 0, 1, 1,
0.4647889, -0.2020539, 2.686667, 0.2705882, 0, 1, 1,
0.4669423, 0.7985831, 0.5195186, 0.2784314, 0, 1, 1,
0.4692071, -0.7795487, 3.649558, 0.282353, 0, 1, 1,
0.4765822, 0.3987026, -1.058827, 0.2901961, 0, 1, 1,
0.4781018, 0.1733501, 1.039982, 0.2941177, 0, 1, 1,
0.479738, -0.3866441, 2.017905, 0.3019608, 0, 1, 1,
0.4818559, -0.9855266, 0.7483053, 0.3098039, 0, 1, 1,
0.4838286, 2.244301, -0.2399915, 0.3137255, 0, 1, 1,
0.4912966, 0.5220233, 1.182332, 0.3215686, 0, 1, 1,
0.5002815, 0.7981498, 1.330858, 0.3254902, 0, 1, 1,
0.5026349, -0.3038449, 4.172744, 0.3333333, 0, 1, 1,
0.5034786, 0.1104538, 1.718226, 0.3372549, 0, 1, 1,
0.5061044, 0.4249985, -0.05526666, 0.345098, 0, 1, 1,
0.5087305, 0.378514, -0.2327702, 0.3490196, 0, 1, 1,
0.5120968, -0.1788036, 3.295228, 0.3568628, 0, 1, 1,
0.5172098, 0.02162545, 1.907629, 0.3607843, 0, 1, 1,
0.5195785, -0.4209724, 0.5478974, 0.3686275, 0, 1, 1,
0.5265608, 0.3004862, 0.1269711, 0.372549, 0, 1, 1,
0.5310216, 1.425139, -0.1644114, 0.3803922, 0, 1, 1,
0.5320286, 0.1223088, 1.680403, 0.3843137, 0, 1, 1,
0.5328532, 0.5657952, -1.71264, 0.3921569, 0, 1, 1,
0.5375736, -0.6906688, 2.336275, 0.3960784, 0, 1, 1,
0.5400524, -2.083598, 4.73513, 0.4039216, 0, 1, 1,
0.5408961, 2.383847, 0.7929723, 0.4117647, 0, 1, 1,
0.5428661, 0.6112605, -1.268199, 0.4156863, 0, 1, 1,
0.5486839, 1.244189, 2.147409, 0.4235294, 0, 1, 1,
0.5527244, 0.7851882, 1.350984, 0.427451, 0, 1, 1,
0.5555323, -0.4358061, 0.7182526, 0.4352941, 0, 1, 1,
0.5584509, 0.422117, 2.968697, 0.4392157, 0, 1, 1,
0.5619142, 0.8222141, 2.206557, 0.4470588, 0, 1, 1,
0.569654, 0.5852035, 0.594007, 0.4509804, 0, 1, 1,
0.5726949, 0.08569186, 1.371127, 0.4588235, 0, 1, 1,
0.5739918, 0.4592027, -0.5502678, 0.4627451, 0, 1, 1,
0.5826646, -1.150495, 1.008107, 0.4705882, 0, 1, 1,
0.5900007, 0.2361723, 1.385785, 0.4745098, 0, 1, 1,
0.594619, 0.1654925, 1.654383, 0.4823529, 0, 1, 1,
0.5948582, 0.7000697, 2.254129, 0.4862745, 0, 1, 1,
0.6003031, -0.2909654, 3.776677, 0.4941176, 0, 1, 1,
0.6006803, 0.7636966, 0.3195593, 0.5019608, 0, 1, 1,
0.6013049, 0.914165, 1.491958, 0.5058824, 0, 1, 1,
0.6053105, 0.5362656, 2.58941, 0.5137255, 0, 1, 1,
0.6059318, -1.973283, 4.218244, 0.5176471, 0, 1, 1,
0.611933, 1.193901, 0.5255846, 0.5254902, 0, 1, 1,
0.6202654, -1.348641, 2.605729, 0.5294118, 0, 1, 1,
0.6210585, -0.8205267, 3.044888, 0.5372549, 0, 1, 1,
0.6215886, -1.112303, 3.395834, 0.5411765, 0, 1, 1,
0.6253935, -0.2461363, 2.389054, 0.5490196, 0, 1, 1,
0.6306487, 0.03672928, 1.557616, 0.5529412, 0, 1, 1,
0.6315208, -0.1408535, 2.849833, 0.5607843, 0, 1, 1,
0.6346304, -0.9932677, 4.299376, 0.5647059, 0, 1, 1,
0.6482111, -0.2938368, 1.53704, 0.572549, 0, 1, 1,
0.6491755, 0.1328696, 0.6568121, 0.5764706, 0, 1, 1,
0.6503454, -0.2468332, 2.694148, 0.5843138, 0, 1, 1,
0.6529242, 0.3370105, -0.4654107, 0.5882353, 0, 1, 1,
0.654568, 0.1883968, 4.073757, 0.5960785, 0, 1, 1,
0.660077, 0.2941539, 0.6475641, 0.6039216, 0, 1, 1,
0.6657689, 1.543887, 0.830339, 0.6078432, 0, 1, 1,
0.6683484, -0.3784436, 3.421859, 0.6156863, 0, 1, 1,
0.673721, 0.230848, 0.5811566, 0.6196079, 0, 1, 1,
0.6945896, 1.070141, -0.6002761, 0.627451, 0, 1, 1,
0.7015412, -1.577338, 2.728752, 0.6313726, 0, 1, 1,
0.7096433, 0.5169667, 0.06919471, 0.6392157, 0, 1, 1,
0.7105857, -1.636757, 1.110303, 0.6431373, 0, 1, 1,
0.7130527, -0.8637931, 2.774906, 0.6509804, 0, 1, 1,
0.7183243, -0.6731381, 1.67449, 0.654902, 0, 1, 1,
0.7257065, 0.9862695, -0.2109758, 0.6627451, 0, 1, 1,
0.7283813, 0.5986374, 0.2396181, 0.6666667, 0, 1, 1,
0.7289714, 1.522336, 1.706305, 0.6745098, 0, 1, 1,
0.7295687, 2.098105, -0.6391863, 0.6784314, 0, 1, 1,
0.7336615, 1.473138, -1.56979, 0.6862745, 0, 1, 1,
0.7438313, -1.059667, 1.200765, 0.6901961, 0, 1, 1,
0.7477276, 0.6217949, -0.877131, 0.6980392, 0, 1, 1,
0.7521893, 1.078247, 1.304297, 0.7058824, 0, 1, 1,
0.761615, 0.9815232, 1.063573, 0.7098039, 0, 1, 1,
0.7620688, -0.1114586, 1.618665, 0.7176471, 0, 1, 1,
0.7628427, -1.08473, 2.513075, 0.7215686, 0, 1, 1,
0.7663861, -0.1567234, 2.299761, 0.7294118, 0, 1, 1,
0.7692801, -2.493906, 2.925722, 0.7333333, 0, 1, 1,
0.7752844, -0.4054928, 1.731657, 0.7411765, 0, 1, 1,
0.7817979, -2.117763, 2.095808, 0.7450981, 0, 1, 1,
0.787235, -0.5888758, 2.180479, 0.7529412, 0, 1, 1,
0.7899063, 1.89249, -0.1941817, 0.7568628, 0, 1, 1,
0.7924882, -0.3924228, 1.938249, 0.7647059, 0, 1, 1,
0.7943428, 0.1746906, 1.850247, 0.7686275, 0, 1, 1,
0.7988498, -0.3367509, 2.189169, 0.7764706, 0, 1, 1,
0.8034341, 1.787176, 0.7347681, 0.7803922, 0, 1, 1,
0.8044714, -1.607285, 1.338762, 0.7882353, 0, 1, 1,
0.8108395, -1.086661, 1.475379, 0.7921569, 0, 1, 1,
0.812472, -0.8614746, 2.455774, 0.8, 0, 1, 1,
0.818112, -0.3058251, 1.435307, 0.8078431, 0, 1, 1,
0.8274938, 1.329646, 0.7663707, 0.8117647, 0, 1, 1,
0.8309433, -0.4453797, 2.140272, 0.8196079, 0, 1, 1,
0.8335751, 0.8419493, 1.009676, 0.8235294, 0, 1, 1,
0.838146, 1.879196, -0.8171009, 0.8313726, 0, 1, 1,
0.8417409, 0.3800831, -0.2652805, 0.8352941, 0, 1, 1,
0.8444372, -0.06211578, 1.141536, 0.8431373, 0, 1, 1,
0.8510056, -0.5266212, 2.69624, 0.8470588, 0, 1, 1,
0.8535357, 0.001084918, 1.785429, 0.854902, 0, 1, 1,
0.8538154, 0.5331103, 1.55092, 0.8588235, 0, 1, 1,
0.8568982, 0.7670646, 1.762609, 0.8666667, 0, 1, 1,
0.8572235, 1.400792, 1.943542, 0.8705882, 0, 1, 1,
0.8582812, -0.9435205, 1.627313, 0.8784314, 0, 1, 1,
0.8607283, 1.460574, 0.4216695, 0.8823529, 0, 1, 1,
0.8632247, -0.0128055, 0.8026698, 0.8901961, 0, 1, 1,
0.8664705, -0.0327321, 2.034252, 0.8941177, 0, 1, 1,
0.8665459, -0.5320007, 1.418311, 0.9019608, 0, 1, 1,
0.8735231, -0.3079439, 2.481898, 0.9098039, 0, 1, 1,
0.8815749, -0.4906681, 1.914947, 0.9137255, 0, 1, 1,
0.8824943, 0.09787385, 0.2621831, 0.9215686, 0, 1, 1,
0.8826551, 0.739994, 0.4906796, 0.9254902, 0, 1, 1,
0.8842461, -0.4376604, 0.8592201, 0.9333333, 0, 1, 1,
0.8893827, 1.807462, 1.066337, 0.9372549, 0, 1, 1,
0.8901364, -0.3757832, 2.920862, 0.945098, 0, 1, 1,
0.8941509, -1.653262, 3.148036, 0.9490196, 0, 1, 1,
0.8968673, -0.1255799, 1.245286, 0.9568627, 0, 1, 1,
0.8974952, -0.3646704, 2.11445, 0.9607843, 0, 1, 1,
0.8980843, -0.8433481, 2.243633, 0.9686275, 0, 1, 1,
0.8983585, 2.140386, 0.7225617, 0.972549, 0, 1, 1,
0.9025576, 1.782166, 0.27108, 0.9803922, 0, 1, 1,
0.9040804, 0.7594489, 1.316028, 0.9843137, 0, 1, 1,
0.9043181, 1.579791, -0.5979474, 0.9921569, 0, 1, 1,
0.9144523, -2.531618, 2.580198, 0.9960784, 0, 1, 1,
0.9203995, -0.1071005, 1.350852, 1, 0, 0.9960784, 1,
0.9206142, 0.5936843, 0.08418518, 1, 0, 0.9882353, 1,
0.9313116, -1.029245, 2.116273, 1, 0, 0.9843137, 1,
0.9313995, -0.01687697, 0.9306532, 1, 0, 0.9764706, 1,
0.9382909, 0.5982707, 0.9633153, 1, 0, 0.972549, 1,
0.93899, 0.3807689, 2.489839, 1, 0, 0.9647059, 1,
0.951537, 0.7596318, 1.03666, 1, 0, 0.9607843, 1,
0.9516857, -0.431013, 1.853361, 1, 0, 0.9529412, 1,
0.9521754, 1.294683, -0.2076819, 1, 0, 0.9490196, 1,
0.9610634, 1.418289, 1.645666, 1, 0, 0.9411765, 1,
0.9642475, -0.6142785, 2.995572, 1, 0, 0.9372549, 1,
0.9654028, 0.0607176, 1.152777, 1, 0, 0.9294118, 1,
0.9662367, 0.4087829, 3.214196, 1, 0, 0.9254902, 1,
0.96777, -2.011492, 2.392379, 1, 0, 0.9176471, 1,
0.9685183, 0.8229225, 0.1556845, 1, 0, 0.9137255, 1,
0.9790566, 0.8026933, 0.1949357, 1, 0, 0.9058824, 1,
0.981112, 0.9808556, 1.272557, 1, 0, 0.9019608, 1,
0.9860378, 0.7411021, -0.8318893, 1, 0, 0.8941177, 1,
1.004625, -1.678627, 3.636674, 1, 0, 0.8862745, 1,
1.011773, 1.029857, 1.454527, 1, 0, 0.8823529, 1,
1.014812, 0.14172, 0.243442, 1, 0, 0.8745098, 1,
1.015681, -0.6431099, 2.114295, 1, 0, 0.8705882, 1,
1.028856, -0.5875377, 1.993031, 1, 0, 0.8627451, 1,
1.0329, 0.07323857, 1.118345, 1, 0, 0.8588235, 1,
1.0351, -1.239584, 3.019691, 1, 0, 0.8509804, 1,
1.036459, -0.3919934, 2.446568, 1, 0, 0.8470588, 1,
1.040858, -1.378245, 4.399547, 1, 0, 0.8392157, 1,
1.046656, 0.7312563, 0.714353, 1, 0, 0.8352941, 1,
1.052649, -2.022517, 3.161228, 1, 0, 0.827451, 1,
1.060163, 0.1903811, 0.2967492, 1, 0, 0.8235294, 1,
1.066318, 1.004392, -0.4636786, 1, 0, 0.8156863, 1,
1.068189, -0.6427716, 1.805557, 1, 0, 0.8117647, 1,
1.071814, -1.262242, 1.797957, 1, 0, 0.8039216, 1,
1.073885, 2.028791, 0.8629037, 1, 0, 0.7960784, 1,
1.093027, 0.8222545, -0.08012372, 1, 0, 0.7921569, 1,
1.095999, 1.082098, -0.7709138, 1, 0, 0.7843137, 1,
1.096247, 1.846366, 0.7785398, 1, 0, 0.7803922, 1,
1.109994, 1.971107, 1.396092, 1, 0, 0.772549, 1,
1.112965, 0.8593635, 1.527895, 1, 0, 0.7686275, 1,
1.124799, -1.126798, 2.889202, 1, 0, 0.7607843, 1,
1.125749, 0.3920414, 2.120355, 1, 0, 0.7568628, 1,
1.134333, -1.142851, 1.978977, 1, 0, 0.7490196, 1,
1.13883, -0.5021428, 1.932711, 1, 0, 0.7450981, 1,
1.13937, -0.9046268, 2.294809, 1, 0, 0.7372549, 1,
1.146217, 1.049159, 1.385284, 1, 0, 0.7333333, 1,
1.152207, 0.032402, 1.37278, 1, 0, 0.7254902, 1,
1.156437, 0.4691266, 2.103124, 1, 0, 0.7215686, 1,
1.161617, -0.3197482, 2.35944, 1, 0, 0.7137255, 1,
1.16405, 1.030987, -0.7647911, 1, 0, 0.7098039, 1,
1.165633, 0.9465798, 0.4341686, 1, 0, 0.7019608, 1,
1.167604, 1.577158, 0.4966338, 1, 0, 0.6941177, 1,
1.17216, 0.5570803, 1.557615, 1, 0, 0.6901961, 1,
1.175084, -0.7379548, 1.194652, 1, 0, 0.682353, 1,
1.178385, 0.3134303, 0.942593, 1, 0, 0.6784314, 1,
1.178734, 0.685258, 0.005461117, 1, 0, 0.6705883, 1,
1.185169, -0.7722778, 3.584118, 1, 0, 0.6666667, 1,
1.187002, 0.02206586, 1.707598, 1, 0, 0.6588235, 1,
1.191683, -0.1144224, 1.843298, 1, 0, 0.654902, 1,
1.192581, -0.8907811, 2.052262, 1, 0, 0.6470588, 1,
1.197893, -0.9473341, 5.743512, 1, 0, 0.6431373, 1,
1.200774, 2.189062, -2.06029, 1, 0, 0.6352941, 1,
1.203232, 1.558557, 0.4491583, 1, 0, 0.6313726, 1,
1.203989, -0.142607, 1.033525, 1, 0, 0.6235294, 1,
1.216847, 1.398097, 0.1989525, 1, 0, 0.6196079, 1,
1.217904, -0.3199764, 4.386075, 1, 0, 0.6117647, 1,
1.224204, -0.4083261, 0.5961385, 1, 0, 0.6078432, 1,
1.226834, 1.809553, 0.3435083, 1, 0, 0.6, 1,
1.228638, 0.3738939, 2.969831, 1, 0, 0.5921569, 1,
1.235572, -0.6774935, 1.836771, 1, 0, 0.5882353, 1,
1.250707, -0.9837933, 1.961801, 1, 0, 0.5803922, 1,
1.253162, -0.7184711, 1.526977, 1, 0, 0.5764706, 1,
1.272053, 0.003888092, 1.898916, 1, 0, 0.5686275, 1,
1.278665, -0.7562586, 2.901035, 1, 0, 0.5647059, 1,
1.288778, -0.4157794, 1.938465, 1, 0, 0.5568628, 1,
1.297162, -1.118955, 0.9751778, 1, 0, 0.5529412, 1,
1.300907, -2.31031, 1.225412, 1, 0, 0.5450981, 1,
1.301677, -0.6912562, 2.126625, 1, 0, 0.5411765, 1,
1.301828, 2.969231, -0.9177244, 1, 0, 0.5333334, 1,
1.302586, -0.8097097, 1.742324, 1, 0, 0.5294118, 1,
1.306465, 0.1384545, 0.8731824, 1, 0, 0.5215687, 1,
1.308873, 0.7656001, 2.044832, 1, 0, 0.5176471, 1,
1.31014, 1.36261, -0.4380528, 1, 0, 0.509804, 1,
1.328527, 0.5310334, 1.668952, 1, 0, 0.5058824, 1,
1.329452, -0.4273645, 1.552679, 1, 0, 0.4980392, 1,
1.329777, 1.097238, -0.2038084, 1, 0, 0.4901961, 1,
1.339281, -1.041095, 0.9616921, 1, 0, 0.4862745, 1,
1.342332, -0.1189904, 3.052845, 1, 0, 0.4784314, 1,
1.343291, 0.3078774, 1.715428, 1, 0, 0.4745098, 1,
1.343884, -0.6092573, 1.531403, 1, 0, 0.4666667, 1,
1.359112, -0.918974, 0.9797069, 1, 0, 0.4627451, 1,
1.394872, 0.4320624, 1.992124, 1, 0, 0.454902, 1,
1.40397, 0.3936382, 3.546101, 1, 0, 0.4509804, 1,
1.408524, 0.1131422, 1.42647, 1, 0, 0.4431373, 1,
1.408676, -1.066411, 3.352247, 1, 0, 0.4392157, 1,
1.410446, 0.7766109, 0.8760192, 1, 0, 0.4313726, 1,
1.419778, -0.5677505, 0.6803008, 1, 0, 0.427451, 1,
1.422022, 0.8716028, 0.9075363, 1, 0, 0.4196078, 1,
1.423985, -0.3841767, 0.5808045, 1, 0, 0.4156863, 1,
1.426509, 0.1721184, 1.583858, 1, 0, 0.4078431, 1,
1.463691, 0.2643926, 0.7527531, 1, 0, 0.4039216, 1,
1.464854, 0.4945401, 1.503412, 1, 0, 0.3960784, 1,
1.467781, 0.5880181, 3.279583, 1, 0, 0.3882353, 1,
1.471646, 1.081671, 1.681107, 1, 0, 0.3843137, 1,
1.474119, 1.016859, 1.468645, 1, 0, 0.3764706, 1,
1.49198, 1.167037, 2.149557, 1, 0, 0.372549, 1,
1.495884, 0.4697683, 1.073689, 1, 0, 0.3647059, 1,
1.505383, 0.2608244, 2.097119, 1, 0, 0.3607843, 1,
1.513289, 0.9728038, -0.5762525, 1, 0, 0.3529412, 1,
1.513629, 1.07778, 2.765062, 1, 0, 0.3490196, 1,
1.515134, 1.211466, 0.03871713, 1, 0, 0.3411765, 1,
1.516842, -0.9554279, 1.811493, 1, 0, 0.3372549, 1,
1.519209, 0.241392, 0.7456154, 1, 0, 0.3294118, 1,
1.534312, -0.7540803, 2.645233, 1, 0, 0.3254902, 1,
1.535956, 0.7186465, 3.17225, 1, 0, 0.3176471, 1,
1.544275, 0.1844192, 2.632904, 1, 0, 0.3137255, 1,
1.561576, -0.1512442, 0.5304402, 1, 0, 0.3058824, 1,
1.562434, 1.419857, 1.656181, 1, 0, 0.2980392, 1,
1.581809, 0.4764736, 0.2791952, 1, 0, 0.2941177, 1,
1.590145, -1.260589, 1.39256, 1, 0, 0.2862745, 1,
1.591242, 0.7050381, 1.006687, 1, 0, 0.282353, 1,
1.600147, -1.502504, 2.257358, 1, 0, 0.2745098, 1,
1.635652, 0.143751, 0.6406174, 1, 0, 0.2705882, 1,
1.638225, 1.481814, -1.03557, 1, 0, 0.2627451, 1,
1.643316, -1.181587, 1.456442, 1, 0, 0.2588235, 1,
1.654612, -0.3010178, 2.367133, 1, 0, 0.2509804, 1,
1.665507, -1.310819, 3.272679, 1, 0, 0.2470588, 1,
1.687134, -0.6169314, 0.7164517, 1, 0, 0.2392157, 1,
1.701031, -0.2987111, 1.86375, 1, 0, 0.2352941, 1,
1.719965, 0.8210015, 0.4503411, 1, 0, 0.227451, 1,
1.72666, -1.440566, 1.534614, 1, 0, 0.2235294, 1,
1.735593, 0.09500023, 0.6770229, 1, 0, 0.2156863, 1,
1.742882, -0.3379015, 2.18945, 1, 0, 0.2117647, 1,
1.751819, 0.7840744, 1.35284, 1, 0, 0.2039216, 1,
1.75305, 2.178132, 0.5109531, 1, 0, 0.1960784, 1,
1.759533, 2.366575, 0.5906607, 1, 0, 0.1921569, 1,
1.78619, -0.9668311, 1.560674, 1, 0, 0.1843137, 1,
1.813456, 0.299552, 1.362798, 1, 0, 0.1803922, 1,
1.815584, 2.66, 0.4030366, 1, 0, 0.172549, 1,
1.816306, 0.9062912, 0.9911693, 1, 0, 0.1686275, 1,
1.822512, 0.1418599, 1.058248, 1, 0, 0.1607843, 1,
1.849416, 1.247679, 1.871714, 1, 0, 0.1568628, 1,
1.852125, -0.2270742, 1.37725, 1, 0, 0.1490196, 1,
1.853549, -0.8076459, 1.680646, 1, 0, 0.145098, 1,
1.868338, 1.443704, 1.742889, 1, 0, 0.1372549, 1,
1.876043, -0.676626, 1.868004, 1, 0, 0.1333333, 1,
1.882946, -0.6043217, 1.898965, 1, 0, 0.1254902, 1,
1.885558, -1.186985, 0.295889, 1, 0, 0.1215686, 1,
1.886069, 0.05636609, 2.862214, 1, 0, 0.1137255, 1,
1.913731, 0.2528424, 2.675645, 1, 0, 0.1098039, 1,
1.918681, -0.9635962, 2.493785, 1, 0, 0.1019608, 1,
1.940268, -1.453548, 2.451907, 1, 0, 0.09411765, 1,
1.969378, 1.345679, 0.2382015, 1, 0, 0.09019608, 1,
2.051819, 0.6193901, -0.3477678, 1, 0, 0.08235294, 1,
2.089972, -0.4087947, 0.9819812, 1, 0, 0.07843138, 1,
2.1438, -1.456182, 3.13155, 1, 0, 0.07058824, 1,
2.203305, 1.008598, 0.1606564, 1, 0, 0.06666667, 1,
2.206879, -1.376688, 2.741901, 1, 0, 0.05882353, 1,
2.359651, -0.910278, 2.673172, 1, 0, 0.05490196, 1,
2.443085, 0.2059763, 2.800019, 1, 0, 0.04705882, 1,
2.516541, 0.6563444, 3.13189, 1, 0, 0.04313726, 1,
2.56869, -0.2683385, 1.589176, 1, 0, 0.03529412, 1,
2.570207, -0.3689438, 1.606008, 1, 0, 0.03137255, 1,
2.801307, -0.6552638, 0.9354669, 1, 0, 0.02352941, 1,
2.949368, -0.3516082, 0.3560138, 1, 0, 0.01960784, 1,
3.111185, -0.9880219, 0.6305262, 1, 0, 0.01176471, 1,
3.173421, -0.1479542, 2.082672, 1, 0, 0.007843138, 1
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
0.1128074, -4.676621, -6.944126, 0, -0.5, 0.5, 0.5,
0.1128074, -4.676621, -6.944126, 1, -0.5, 0.5, 0.5,
0.1128074, -4.676621, -6.944126, 1, 1.5, 0.5, 0.5,
0.1128074, -4.676621, -6.944126, 0, 1.5, 0.5, 0.5
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
-3.985354, -0.1795864, -6.944126, 0, -0.5, 0.5, 0.5,
-3.985354, -0.1795864, -6.944126, 1, -0.5, 0.5, 0.5,
-3.985354, -0.1795864, -6.944126, 1, 1.5, 0.5, 0.5,
-3.985354, -0.1795864, -6.944126, 0, 1.5, 0.5, 0.5
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
-3.985354, -4.676621, 0.3191261, 0, -0.5, 0.5, 0.5,
-3.985354, -4.676621, 0.3191261, 1, -0.5, 0.5, 0.5,
-3.985354, -4.676621, 0.3191261, 1, 1.5, 0.5, 0.5,
-3.985354, -4.676621, 0.3191261, 0, 1.5, 0.5, 0.5
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
-2, -3.638844, -5.267991,
3, -3.638844, -5.267991,
-2, -3.638844, -5.267991,
-2, -3.811807, -5.547347,
-1, -3.638844, -5.267991,
-1, -3.811807, -5.547347,
0, -3.638844, -5.267991,
0, -3.811807, -5.547347,
1, -3.638844, -5.267991,
1, -3.811807, -5.547347,
2, -3.638844, -5.267991,
2, -3.811807, -5.547347,
3, -3.638844, -5.267991,
3, -3.811807, -5.547347
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
-2, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
-2, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
-2, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
-2, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5,
-1, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
-1, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
-1, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
-1, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5,
0, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
0, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
0, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
0, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5,
1, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
1, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
1, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
1, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5,
2, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
2, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
2, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
2, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5,
3, -4.157732, -6.106059, 0, -0.5, 0.5, 0.5,
3, -4.157732, -6.106059, 1, -0.5, 0.5, 0.5,
3, -4.157732, -6.106059, 1, 1.5, 0.5, 0.5,
3, -4.157732, -6.106059, 0, 1.5, 0.5, 0.5
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
-3.039625, -3, -5.267991,
-3.039625, 3, -5.267991,
-3.039625, -3, -5.267991,
-3.197246, -3, -5.547347,
-3.039625, -2, -5.267991,
-3.197246, -2, -5.547347,
-3.039625, -1, -5.267991,
-3.197246, -1, -5.547347,
-3.039625, 0, -5.267991,
-3.197246, 0, -5.547347,
-3.039625, 1, -5.267991,
-3.197246, 1, -5.547347,
-3.039625, 2, -5.267991,
-3.197246, 2, -5.547347,
-3.039625, 3, -5.267991,
-3.197246, 3, -5.547347
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
-3.51249, -3, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, -3, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, -3, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, -3, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, -2, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, -2, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, -2, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, -2, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, -1, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, -1, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, -1, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, -1, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, 0, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, 0, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, 0, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, 0, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, 1, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, 1, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, 1, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, 1, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, 2, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, 2, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, 2, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, 2, -6.106059, 0, 1.5, 0.5, 0.5,
-3.51249, 3, -6.106059, 0, -0.5, 0.5, 0.5,
-3.51249, 3, -6.106059, 1, -0.5, 0.5, 0.5,
-3.51249, 3, -6.106059, 1, 1.5, 0.5, 0.5,
-3.51249, 3, -6.106059, 0, 1.5, 0.5, 0.5
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
-3.039625, -3.638844, -4,
-3.039625, -3.638844, 4,
-3.039625, -3.638844, -4,
-3.197246, -3.811807, -4,
-3.039625, -3.638844, -2,
-3.197246, -3.811807, -2,
-3.039625, -3.638844, 0,
-3.197246, -3.811807, 0,
-3.039625, -3.638844, 2,
-3.197246, -3.811807, 2,
-3.039625, -3.638844, 4,
-3.197246, -3.811807, 4
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
-3.51249, -4.157732, -4, 0, -0.5, 0.5, 0.5,
-3.51249, -4.157732, -4, 1, -0.5, 0.5, 0.5,
-3.51249, -4.157732, -4, 1, 1.5, 0.5, 0.5,
-3.51249, -4.157732, -4, 0, 1.5, 0.5, 0.5,
-3.51249, -4.157732, -2, 0, -0.5, 0.5, 0.5,
-3.51249, -4.157732, -2, 1, -0.5, 0.5, 0.5,
-3.51249, -4.157732, -2, 1, 1.5, 0.5, 0.5,
-3.51249, -4.157732, -2, 0, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 0, 0, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 0, 1, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 0, 1, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 0, 0, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 2, 0, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 2, 1, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 2, 1, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 2, 0, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 4, 0, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 4, 1, -0.5, 0.5, 0.5,
-3.51249, -4.157732, 4, 1, 1.5, 0.5, 0.5,
-3.51249, -4.157732, 4, 0, 1.5, 0.5, 0.5
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
-3.039625, -3.638844, -5.267991,
-3.039625, 3.279671, -5.267991,
-3.039625, -3.638844, 5.906243,
-3.039625, 3.279671, 5.906243,
-3.039625, -3.638844, -5.267991,
-3.039625, -3.638844, 5.906243,
-3.039625, 3.279671, -5.267991,
-3.039625, 3.279671, 5.906243,
-3.039625, -3.638844, -5.267991,
3.265239, -3.638844, -5.267991,
-3.039625, -3.638844, 5.906243,
3.265239, -3.638844, 5.906243,
-3.039625, 3.279671, -5.267991,
3.265239, 3.279671, -5.267991,
-3.039625, 3.279671, 5.906243,
3.265239, 3.279671, 5.906243,
3.265239, -3.638844, -5.267991,
3.265239, 3.279671, -5.267991,
3.265239, -3.638844, 5.906243,
3.265239, 3.279671, 5.906243,
3.265239, -3.638844, -5.267991,
3.265239, -3.638844, 5.906243,
3.265239, 3.279671, -5.267991,
3.265239, 3.279671, 5.906243
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
var radius = 7.783684;
var distance = 34.63049;
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
mvMatrix.translate( -0.1128074, 0.1795864, -0.3191261 );
mvMatrix.scale( 1.334822, 1.216427, 0.7531497 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63049);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
4-CPA<-read.table("4-CPA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-CPA$V2
```

```
## Error in eval(expr, envir, enclos): object 'CPA' not found
```

```r
y<-4-CPA$V3
```

```
## Error in eval(expr, envir, enclos): object 'CPA' not found
```

```r
z<-4-CPA$V4
```

```
## Error in eval(expr, envir, enclos): object 'CPA' not found
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
-2.947806, 1.798722, -0.01094773, 0, 0, 1, 1, 1,
-2.818238, 0.786725, -0.592548, 1, 0, 0, 1, 1,
-2.691695, -0.7804676, -1.25276, 1, 0, 0, 1, 1,
-2.629966, 0.370743, -1.957837, 1, 0, 0, 1, 1,
-2.576943, 0.2293446, -1.862983, 1, 0, 0, 1, 1,
-2.559196, -0.8104205, -2.200211, 1, 0, 0, 1, 1,
-2.483145, 0.4547353, -1.513566, 0, 0, 0, 1, 1,
-2.423457, 0.8328553, -1.49925, 0, 0, 0, 1, 1,
-2.353755, -0.3691848, -1.63798, 0, 0, 0, 1, 1,
-2.343288, 2.047502, -0.5727091, 0, 0, 0, 1, 1,
-2.331548, 0.4621695, -0.5417721, 0, 0, 0, 1, 1,
-2.32642, 0.4246723, -0.5523649, 0, 0, 0, 1, 1,
-2.313728, -0.1531815, -0.8834992, 0, 0, 0, 1, 1,
-2.308136, -0.5117552, -0.4894337, 1, 1, 1, 1, 1,
-2.255704, 2.394499, -1.445262, 1, 1, 1, 1, 1,
-2.225805, -0.4270216, -0.8294342, 1, 1, 1, 1, 1,
-2.21734, 0.4737153, -0.2228224, 1, 1, 1, 1, 1,
-2.171596, -0.5618683, -2.131393, 1, 1, 1, 1, 1,
-2.126727, 1.55144, -2.377966, 1, 1, 1, 1, 1,
-2.115165, -0.3689841, -2.098681, 1, 1, 1, 1, 1,
-2.109711, -1.290213, -1.340523, 1, 1, 1, 1, 1,
-2.075231, -1.461219, -0.6746999, 1, 1, 1, 1, 1,
-2.073047, 0.1098584, -0.8438272, 1, 1, 1, 1, 1,
-2.024215, -0.5185833, -0.3879563, 1, 1, 1, 1, 1,
-1.997399, 2.026109, -0.5604529, 1, 1, 1, 1, 1,
-1.993178, 0.9408875, -0.1951759, 1, 1, 1, 1, 1,
-1.979926, 1.780263, -1.414723, 1, 1, 1, 1, 1,
-1.976498, -1.100118, -1.840717, 1, 1, 1, 1, 1,
-1.951876, 2.234341, -0.7669948, 0, 0, 1, 1, 1,
-1.928759, 0.1733717, -2.058724, 1, 0, 0, 1, 1,
-1.923426, 0.08318612, -2.172051, 1, 0, 0, 1, 1,
-1.920637, -3.538089, -4.736216, 1, 0, 0, 1, 1,
-1.890517, -0.4910572, -2.525157, 1, 0, 0, 1, 1,
-1.8796, 1.440684, -1.413301, 1, 0, 0, 1, 1,
-1.866956, 0.3758333, -1.528252, 0, 0, 0, 1, 1,
-1.803108, 0.05743515, -1.415962, 0, 0, 0, 1, 1,
-1.798974, 0.3010764, -2.708635, 0, 0, 0, 1, 1,
-1.782722, 0.1032374, -1.392361, 0, 0, 0, 1, 1,
-1.781554, 0.9516426, -0.1673427, 0, 0, 0, 1, 1,
-1.759723, 0.8170146, -1.793241, 0, 0, 0, 1, 1,
-1.756507, 0.4087738, -1.968136, 0, 0, 0, 1, 1,
-1.756445, 0.7887558, -2.104542, 1, 1, 1, 1, 1,
-1.750332, -0.474661, -1.936882, 1, 1, 1, 1, 1,
-1.745995, 0.6720746, -0.869017, 1, 1, 1, 1, 1,
-1.740239, 0.1258636, -0.654215, 1, 1, 1, 1, 1,
-1.728547, -1.295847, -2.167767, 1, 1, 1, 1, 1,
-1.726968, 0.01917866, -1.648739, 1, 1, 1, 1, 1,
-1.713401, -0.9655656, -1.739938, 1, 1, 1, 1, 1,
-1.712232, 1.013305, -1.173219, 1, 1, 1, 1, 1,
-1.711686, 1.282396, -1.186971, 1, 1, 1, 1, 1,
-1.708864, 0.2414874, -0.04760146, 1, 1, 1, 1, 1,
-1.692998, -1.705444, -2.333868, 1, 1, 1, 1, 1,
-1.65949, -1.089795, -2.197676, 1, 1, 1, 1, 1,
-1.659165, -0.06144162, -3.278259, 1, 1, 1, 1, 1,
-1.626651, 1.015108, 0.1212827, 1, 1, 1, 1, 1,
-1.619826, -0.8157382, -2.021641, 1, 1, 1, 1, 1,
-1.618402, 0.09694209, -1.066103, 0, 0, 1, 1, 1,
-1.616646, 0.2386497, -0.8293007, 1, 0, 0, 1, 1,
-1.61274, 0.1441094, -0.8012483, 1, 0, 0, 1, 1,
-1.608101, -0.4559407, -3.958901, 1, 0, 0, 1, 1,
-1.605226, -1.44135, -0.7915514, 1, 0, 0, 1, 1,
-1.601097, -0.7858255, -4.153751, 1, 0, 0, 1, 1,
-1.600238, -0.8214884, -2.059412, 0, 0, 0, 1, 1,
-1.600116, -1.742119, -2.673913, 0, 0, 0, 1, 1,
-1.596912, 1.105206, -1.408853, 0, 0, 0, 1, 1,
-1.594873, 0.7083096, -1.968309, 0, 0, 0, 1, 1,
-1.588994, 0.156403, 0.2606775, 0, 0, 0, 1, 1,
-1.581244, -2.272634, -2.277995, 0, 0, 0, 1, 1,
-1.580849, 0.8220922, -1.002754, 0, 0, 0, 1, 1,
-1.572857, -0.983845, -2.104417, 1, 1, 1, 1, 1,
-1.550455, 1.327457, -2.45906, 1, 1, 1, 1, 1,
-1.546854, -1.276086, -3.255779, 1, 1, 1, 1, 1,
-1.544521, -1.091806, -2.074599, 1, 1, 1, 1, 1,
-1.539961, -1.476499, -2.003701, 1, 1, 1, 1, 1,
-1.53576, -0.2620288, -0.4214672, 1, 1, 1, 1, 1,
-1.535729, 0.700793, -1.193369, 1, 1, 1, 1, 1,
-1.533272, 2.63237, -1.128383, 1, 1, 1, 1, 1,
-1.532255, 0.7948757, -2.259585, 1, 1, 1, 1, 1,
-1.522698, 0.6192209, -1.854337, 1, 1, 1, 1, 1,
-1.516631, -0.01420752, -2.761938, 1, 1, 1, 1, 1,
-1.511531, -0.4315446, -1.694525, 1, 1, 1, 1, 1,
-1.50753, -1.189917, -3.051526, 1, 1, 1, 1, 1,
-1.504829, -0.7207521, -2.499204, 1, 1, 1, 1, 1,
-1.492489, 1.001255, -2.141903, 1, 1, 1, 1, 1,
-1.491555, 1.235458, -1.583877, 0, 0, 1, 1, 1,
-1.481712, 0.7092319, -1.793397, 1, 0, 0, 1, 1,
-1.476872, -2.440815, -0.5395436, 1, 0, 0, 1, 1,
-1.472269, 0.6142217, -0.2597559, 1, 0, 0, 1, 1,
-1.46745, -0.69723, -2.866593, 1, 0, 0, 1, 1,
-1.452565, 0.9084525, -1.927237, 1, 0, 0, 1, 1,
-1.448005, 1.561474, 0.8018321, 0, 0, 0, 1, 1,
-1.44378, -0.9560132, -0.2762945, 0, 0, 0, 1, 1,
-1.441301, -1.241463, -2.176914, 0, 0, 0, 1, 1,
-1.42388, 1.482965, -2.314463, 0, 0, 0, 1, 1,
-1.420112, -1.183967, -3.027989, 0, 0, 0, 1, 1,
-1.418114, -0.8166188, -3.902736, 0, 0, 0, 1, 1,
-1.417756, -0.5177937, -1.598654, 0, 0, 0, 1, 1,
-1.403165, -0.7563435, -1.918255, 1, 1, 1, 1, 1,
-1.395658, 0.7424104, 0.5705032, 1, 1, 1, 1, 1,
-1.39193, 0.3669239, -1.782403, 1, 1, 1, 1, 1,
-1.38641, 0.7642657, -1.76512, 1, 1, 1, 1, 1,
-1.375424, -0.519108, -2.307338, 1, 1, 1, 1, 1,
-1.373825, -0.1389191, -2.413337, 1, 1, 1, 1, 1,
-1.372315, 0.4499511, -0.3097444, 1, 1, 1, 1, 1,
-1.365452, 0.89806, -0.2434079, 1, 1, 1, 1, 1,
-1.353711, 2.274238, -1.014794, 1, 1, 1, 1, 1,
-1.339179, -2.453105, -2.091402, 1, 1, 1, 1, 1,
-1.331988, 1.784408, 0.295169, 1, 1, 1, 1, 1,
-1.326723, 0.3838447, -0.9010335, 1, 1, 1, 1, 1,
-1.321515, 0.1671007, -1.179061, 1, 1, 1, 1, 1,
-1.310064, -0.6121081, -1.743837, 1, 1, 1, 1, 1,
-1.306097, -0.4791841, -1.781564, 1, 1, 1, 1, 1,
-1.302629, -0.4395612, -2.814045, 0, 0, 1, 1, 1,
-1.29728, -1.17782, -4.286909, 1, 0, 0, 1, 1,
-1.29437, -2.402673, -1.813545, 1, 0, 0, 1, 1,
-1.292884, 1.048189, -1.377015, 1, 0, 0, 1, 1,
-1.290747, -0.1387819, 0.7094162, 1, 0, 0, 1, 1,
-1.286611, -0.8272815, -2.948503, 1, 0, 0, 1, 1,
-1.285342, 3.178916, -2.407482, 0, 0, 0, 1, 1,
-1.272869, 0.9683157, 0.861022, 0, 0, 0, 1, 1,
-1.262035, -1.397117, -2.560847, 0, 0, 0, 1, 1,
-1.260964, -1.535654, -4.556792, 0, 0, 0, 1, 1,
-1.253246, 0.5918835, -1.347277, 0, 0, 0, 1, 1,
-1.25072, -0.07142808, -2.365473, 0, 0, 0, 1, 1,
-1.249971, 0.0530755, -3.445677, 0, 0, 0, 1, 1,
-1.246482, -0.9706399, -1.335938, 1, 1, 1, 1, 1,
-1.232819, 1.822633, -0.9510995, 1, 1, 1, 1, 1,
-1.232232, -1.888716, -3.584476, 1, 1, 1, 1, 1,
-1.2308, 0.4364761, -0.7736531, 1, 1, 1, 1, 1,
-1.229194, 0.5595395, -0.4354849, 1, 1, 1, 1, 1,
-1.228537, 0.2812158, 0.1383387, 1, 1, 1, 1, 1,
-1.221003, -1.59375, -2.736724, 1, 1, 1, 1, 1,
-1.218517, -0.3565316, -2.903454, 1, 1, 1, 1, 1,
-1.214395, 0.6984246, -1.996631, 1, 1, 1, 1, 1,
-1.21162, 1.010478, -0.8368576, 1, 1, 1, 1, 1,
-1.210094, -0.8096616, -1.262941, 1, 1, 1, 1, 1,
-1.20881, 0.1290505, -0.1968601, 1, 1, 1, 1, 1,
-1.202271, 1.654323, -0.5585768, 1, 1, 1, 1, 1,
-1.196895, -0.2388502, -1.096888, 1, 1, 1, 1, 1,
-1.194808, 2.460849, -0.7282333, 1, 1, 1, 1, 1,
-1.186813, 1.561455, 1.212568, 0, 0, 1, 1, 1,
-1.182151, -0.8283027, -0.6140794, 1, 0, 0, 1, 1,
-1.175276, 1.348307, 0.4384061, 1, 0, 0, 1, 1,
-1.172039, -2.075022, -3.087837, 1, 0, 0, 1, 1,
-1.171814, 0.02968805, -1.378426, 1, 0, 0, 1, 1,
-1.168314, -0.2731302, -1.535253, 1, 0, 0, 1, 1,
-1.156102, -0.7868026, -1.736409, 0, 0, 0, 1, 1,
-1.14867, -0.7937416, -3.646128, 0, 0, 0, 1, 1,
-1.145755, 0.3624151, -2.845804, 0, 0, 0, 1, 1,
-1.144464, 0.2892306, -1.246257, 0, 0, 0, 1, 1,
-1.1381, -2.056243, -3.671674, 0, 0, 0, 1, 1,
-1.136118, 0.8472667, -1.380203, 0, 0, 0, 1, 1,
-1.133089, 1.578616, -1.334957, 0, 0, 0, 1, 1,
-1.12814, 0.5128903, -1.159388, 1, 1, 1, 1, 1,
-1.125597, -0.3869534, -0.1466832, 1, 1, 1, 1, 1,
-1.124564, 0.1591064, -1.817856, 1, 1, 1, 1, 1,
-1.116658, 1.668913, -0.1682515, 1, 1, 1, 1, 1,
-1.116293, 0.44356, -0.689333, 1, 1, 1, 1, 1,
-1.112898, -2.002371, -2.267958, 1, 1, 1, 1, 1,
-1.107497, -0.7530085, -2.037561, 1, 1, 1, 1, 1,
-1.105126, 1.670727, -0.431603, 1, 1, 1, 1, 1,
-1.098255, 1.014287, -2.353356, 1, 1, 1, 1, 1,
-1.096566, -1.333428, -1.325321, 1, 1, 1, 1, 1,
-1.095955, -0.1832623, -2.706554, 1, 1, 1, 1, 1,
-1.089205, 0.1908912, -2.941225, 1, 1, 1, 1, 1,
-1.085244, 0.8934203, -1.862838, 1, 1, 1, 1, 1,
-1.080994, 0.7419279, -1.892107, 1, 1, 1, 1, 1,
-1.069995, -1.246816, -3.36446, 1, 1, 1, 1, 1,
-1.06697, -0.3413411, -1.602888, 0, 0, 1, 1, 1,
-1.061664, -1.152141, -2.862309, 1, 0, 0, 1, 1,
-1.042171, -0.7454665, -1.577756, 1, 0, 0, 1, 1,
-1.03337, -0.7781613, -0.9258026, 1, 0, 0, 1, 1,
-1.033104, -0.3173854, -1.377988, 1, 0, 0, 1, 1,
-1.031988, 1.291722, -2.316991, 1, 0, 0, 1, 1,
-1.029332, -1.148989, -1.378541, 0, 0, 0, 1, 1,
-1.028223, -0.2594947, -1.40581, 0, 0, 0, 1, 1,
-1.02105, 1.107825, -0.9174646, 0, 0, 0, 1, 1,
-1.019062, -0.09943746, -1.796308, 0, 0, 0, 1, 1,
-1.015195, -0.01653985, -1.784805, 0, 0, 0, 1, 1,
-1.007126, 0.7722986, -0.4483362, 0, 0, 0, 1, 1,
-1.003622, 1.429654, -0.6680996, 0, 0, 0, 1, 1,
-0.9963843, -1.434542, -2.554797, 1, 1, 1, 1, 1,
-0.9899865, 2.715303, -0.8798939, 1, 1, 1, 1, 1,
-0.9894267, -1.378182, -1.38724, 1, 1, 1, 1, 1,
-0.9882129, -0.4447786, -0.400368, 1, 1, 1, 1, 1,
-0.9845198, 0.6276957, -0.6536025, 1, 1, 1, 1, 1,
-0.9749906, 0.3559844, -2.679573, 1, 1, 1, 1, 1,
-0.9634761, 0.7549166, -0.1051189, 1, 1, 1, 1, 1,
-0.9584649, -0.3598675, -2.490325, 1, 1, 1, 1, 1,
-0.9541956, -0.9849369, -2.209473, 1, 1, 1, 1, 1,
-0.9533666, 0.1584674, 0.8232759, 1, 1, 1, 1, 1,
-0.946713, 0.8932039, 1.426243, 1, 1, 1, 1, 1,
-0.9414056, 0.2124395, -2.223784, 1, 1, 1, 1, 1,
-0.938989, 0.5279824, -2.175507, 1, 1, 1, 1, 1,
-0.9382315, 1.449324, -1.245414, 1, 1, 1, 1, 1,
-0.9372272, 1.799672, -1.230349, 1, 1, 1, 1, 1,
-0.9344633, 0.6400374, -0.2604962, 0, 0, 1, 1, 1,
-0.9311199, 0.1333132, -1.697523, 1, 0, 0, 1, 1,
-0.9293762, -0.7859104, -1.13372, 1, 0, 0, 1, 1,
-0.9291723, -0.6083977, -0.6239455, 1, 0, 0, 1, 1,
-0.9286098, 0.8277715, -0.9907718, 1, 0, 0, 1, 1,
-0.9249548, 1.240243, -0.7618355, 1, 0, 0, 1, 1,
-0.9225655, -0.09461805, -2.542497, 0, 0, 0, 1, 1,
-0.9224188, -1.438352, -3.130222, 0, 0, 0, 1, 1,
-0.9197695, 0.5347104, -1.697949, 0, 0, 0, 1, 1,
-0.9194972, 0.6202273, -1.038619, 0, 0, 0, 1, 1,
-0.9166681, 0.383721, 0.02306687, 0, 0, 0, 1, 1,
-0.9143221, 0.08265995, 0.3289856, 0, 0, 0, 1, 1,
-0.9097495, 0.6763707, 0.5503173, 0, 0, 0, 1, 1,
-0.9043114, -0.6057519, -1.746163, 1, 1, 1, 1, 1,
-0.9008776, 0.7194396, 0.07437343, 1, 1, 1, 1, 1,
-0.8962719, 1.170931, -1.70617, 1, 1, 1, 1, 1,
-0.8956431, 1.872349, -1.9375, 1, 1, 1, 1, 1,
-0.8954329, 0.9376487, -0.5124116, 1, 1, 1, 1, 1,
-0.8912339, 0.3727196, -1.403612, 1, 1, 1, 1, 1,
-0.8829076, 0.2877941, -1.821141, 1, 1, 1, 1, 1,
-0.8791919, 0.9272707, -2.823767, 1, 1, 1, 1, 1,
-0.8752626, 1.809488, 0.8190366, 1, 1, 1, 1, 1,
-0.8700684, -0.5158951, -1.833847, 1, 1, 1, 1, 1,
-0.8674959, 0.1028702, -2.25633, 1, 1, 1, 1, 1,
-0.8648053, 1.663134, 0.8382444, 1, 1, 1, 1, 1,
-0.8589239, -1.54179, -1.797667, 1, 1, 1, 1, 1,
-0.8561149, 0.4260908, -2.205425, 1, 1, 1, 1, 1,
-0.8539194, 0.4831995, -0.7333664, 1, 1, 1, 1, 1,
-0.8505161, -0.5592201, -0.3905491, 0, 0, 1, 1, 1,
-0.8496798, 0.5298064, 0.2623346, 1, 0, 0, 1, 1,
-0.8455783, -1.074014, -1.873855, 1, 0, 0, 1, 1,
-0.841819, -0.4022264, -0.1061885, 1, 0, 0, 1, 1,
-0.8326312, -0.1523316, -2.099104, 1, 0, 0, 1, 1,
-0.8265494, 0.663865, -2.691156, 1, 0, 0, 1, 1,
-0.8252499, -0.3691958, -1.370272, 0, 0, 0, 1, 1,
-0.8133202, -0.2264702, -1.974549, 0, 0, 0, 1, 1,
-0.8111523, -0.9295818, -0.9320635, 0, 0, 0, 1, 1,
-0.8077194, -0.6695097, -1.717624, 0, 0, 0, 1, 1,
-0.8075562, -0.5372999, -3.372323, 0, 0, 0, 1, 1,
-0.8033383, -1.001631, -4.756128, 0, 0, 0, 1, 1,
-0.8023733, -0.4194948, -2.272609, 0, 0, 0, 1, 1,
-0.7998438, 0.8559949, -0.5300731, 1, 1, 1, 1, 1,
-0.7925135, -0.8447294, -3.73899, 1, 1, 1, 1, 1,
-0.7889313, 0.3457823, -0.9393071, 1, 1, 1, 1, 1,
-0.7833013, -1.044368, -2.071707, 1, 1, 1, 1, 1,
-0.7776769, -0.04087379, -1.706166, 1, 1, 1, 1, 1,
-0.7772264, 1.269374, -1.583574, 1, 1, 1, 1, 1,
-0.7755334, 0.5506244, -0.1325247, 1, 1, 1, 1, 1,
-0.7697724, -0.4814523, -1.740392, 1, 1, 1, 1, 1,
-0.7672905, -0.3258484, -0.858678, 1, 1, 1, 1, 1,
-0.7623101, -1.019495, -3.432229, 1, 1, 1, 1, 1,
-0.7621033, 0.7180952, -3.17202, 1, 1, 1, 1, 1,
-0.7615399, 0.7357501, -0.2033185, 1, 1, 1, 1, 1,
-0.7549216, -0.1276277, -0.2264931, 1, 1, 1, 1, 1,
-0.7544569, 0.462335, -0.9375937, 1, 1, 1, 1, 1,
-0.754312, -0.7004321, -2.382648, 1, 1, 1, 1, 1,
-0.7526423, -0.1740799, -2.666886, 0, 0, 1, 1, 1,
-0.7453696, 0.8110529, -1.906321, 1, 0, 0, 1, 1,
-0.7436398, -0.1028203, -0.9164509, 1, 0, 0, 1, 1,
-0.7320087, -0.2663613, -1.918303, 1, 0, 0, 1, 1,
-0.7302276, 0.2157218, -0.3030036, 1, 0, 0, 1, 1,
-0.728944, -0.4366392, -1.346149, 1, 0, 0, 1, 1,
-0.7286332, -0.4855361, -3.666609, 0, 0, 0, 1, 1,
-0.7219844, -0.2893861, -3.146896, 0, 0, 0, 1, 1,
-0.7163131, -0.4350215, -1.86057, 0, 0, 0, 1, 1,
-0.7158946, -1.323842, -1.303177, 0, 0, 0, 1, 1,
-0.7155777, 0.7607892, -1.244496, 0, 0, 0, 1, 1,
-0.7133058, -0.5386358, -1.714432, 0, 0, 0, 1, 1,
-0.7124766, -0.901422, -3.586848, 0, 0, 0, 1, 1,
-0.7068549, -0.4325793, -2.426807, 1, 1, 1, 1, 1,
-0.7047538, -0.08613179, -0.2900386, 1, 1, 1, 1, 1,
-0.7038847, 0.5641499, 1.632369, 1, 1, 1, 1, 1,
-0.7024502, 0.1442855, -1.314458, 1, 1, 1, 1, 1,
-0.6941259, 0.01255953, -0.8436851, 1, 1, 1, 1, 1,
-0.6929909, -2.335289, -4.676159, 1, 1, 1, 1, 1,
-0.6915487, -0.7435703, -1.37326, 1, 1, 1, 1, 1,
-0.6894326, 0.5199451, -2.12368, 1, 1, 1, 1, 1,
-0.6877137, -1.680693, -3.87582, 1, 1, 1, 1, 1,
-0.6843763, -0.2458836, -1.616358, 1, 1, 1, 1, 1,
-0.675771, 1.608647, -0.4238954, 1, 1, 1, 1, 1,
-0.6751555, -0.003733912, -3.172161, 1, 1, 1, 1, 1,
-0.6726932, -0.7077999, -1.974748, 1, 1, 1, 1, 1,
-0.6690854, -1.107392, -1.838271, 1, 1, 1, 1, 1,
-0.661104, 0.04588401, -0.4428467, 1, 1, 1, 1, 1,
-0.6545325, 0.2852216, -1.004078, 0, 0, 1, 1, 1,
-0.6418566, 0.8114009, -2.466137, 1, 0, 0, 1, 1,
-0.6416659, 1.286177, -0.1543483, 1, 0, 0, 1, 1,
-0.6415395, -1.638168, -4.409287, 1, 0, 0, 1, 1,
-0.6383603, 0.2188334, -1.619308, 1, 0, 0, 1, 1,
-0.6383237, -0.5918534, -2.073741, 1, 0, 0, 1, 1,
-0.6323081, -0.06948683, -1.992118, 0, 0, 0, 1, 1,
-0.6308606, 0.3677959, -0.05355215, 0, 0, 0, 1, 1,
-0.6187828, 0.4124745, -2.772506, 0, 0, 0, 1, 1,
-0.618562, 1.365107, 2.733771, 0, 0, 0, 1, 1,
-0.618233, -1.733361, -3.483016, 0, 0, 0, 1, 1,
-0.6126608, -0.4660043, -2.560073, 0, 0, 0, 1, 1,
-0.6056629, 0.6323578, -1.646089, 0, 0, 0, 1, 1,
-0.6050467, 0.8063338, 0.05540193, 1, 1, 1, 1, 1,
-0.5961851, 0.1666586, -1.145766, 1, 1, 1, 1, 1,
-0.5954433, -0.07278015, -1.889279, 1, 1, 1, 1, 1,
-0.5945134, -1.227502, -1.382451, 1, 1, 1, 1, 1,
-0.5873027, -0.4924017, -3.244135, 1, 1, 1, 1, 1,
-0.5856405, -0.9110941, -3.197443, 1, 1, 1, 1, 1,
-0.5834736, 0.2110588, -1.661473, 1, 1, 1, 1, 1,
-0.5788557, 0.8803248, -0.2238276, 1, 1, 1, 1, 1,
-0.5745978, 0.9723058, -1.684995, 1, 1, 1, 1, 1,
-0.573528, 0.3020659, -1.180961, 1, 1, 1, 1, 1,
-0.5689254, 1.158855, -0.7035179, 1, 1, 1, 1, 1,
-0.5655406, 0.3602618, -1.817768, 1, 1, 1, 1, 1,
-0.5589332, 0.6846547, -0.04059745, 1, 1, 1, 1, 1,
-0.5515119, 2.050916, -0.01363492, 1, 1, 1, 1, 1,
-0.5496531, -2.270747, -2.095246, 1, 1, 1, 1, 1,
-0.5454966, 0.2314116, -2.136519, 0, 0, 1, 1, 1,
-0.5430497, 0.2223798, -0.9756267, 1, 0, 0, 1, 1,
-0.5344148, 0.4508558, -0.5704817, 1, 0, 0, 1, 1,
-0.5328811, -0.2367978, 0.1759244, 1, 0, 0, 1, 1,
-0.5222602, 1.596286, -0.2671467, 1, 0, 0, 1, 1,
-0.5219857, -0.251154, -1.506723, 1, 0, 0, 1, 1,
-0.5207831, -2.071234, -1.84645, 0, 0, 0, 1, 1,
-0.5169814, 0.2486192, -1.438905, 0, 0, 0, 1, 1,
-0.5140182, 0.2706221, -2.012642, 0, 0, 0, 1, 1,
-0.5134565, 1.542247, -1.080991, 0, 0, 0, 1, 1,
-0.5077656, -1.28401, -3.021576, 0, 0, 0, 1, 1,
-0.5065906, -0.8565636, -3.662701, 0, 0, 0, 1, 1,
-0.5060606, 0.211404, -0.9001346, 0, 0, 0, 1, 1,
-0.4994493, 0.9252324, -1.069481, 1, 1, 1, 1, 1,
-0.4968724, -0.3675895, -1.624713, 1, 1, 1, 1, 1,
-0.4958031, 0.2700015, 0.004983769, 1, 1, 1, 1, 1,
-0.4923823, 2.409231, 0.5730456, 1, 1, 1, 1, 1,
-0.4919259, -1.268402, -3.400906, 1, 1, 1, 1, 1,
-0.4916903, 0.9419304, -0.1909031, 1, 1, 1, 1, 1,
-0.4890872, 1.835335, 0.490933, 1, 1, 1, 1, 1,
-0.4886488, 0.2208426, -1.465357, 1, 1, 1, 1, 1,
-0.4853294, -0.2481682, -2.502223, 1, 1, 1, 1, 1,
-0.4818042, -0.2009221, -2.223439, 1, 1, 1, 1, 1,
-0.4815673, -0.7401316, -3.994387, 1, 1, 1, 1, 1,
-0.4788814, -2.496431, -3.600619, 1, 1, 1, 1, 1,
-0.4782987, 1.921576, -0.02952015, 1, 1, 1, 1, 1,
-0.4751171, -0.5810511, -1.635536, 1, 1, 1, 1, 1,
-0.4718944, 0.5545993, -0.1336598, 1, 1, 1, 1, 1,
-0.4716636, 0.8620626, 0.3905386, 0, 0, 1, 1, 1,
-0.4702338, -1.349958, -3.525321, 1, 0, 0, 1, 1,
-0.4701852, -0.155627, -3.561337, 1, 0, 0, 1, 1,
-0.4603907, -0.5344003, -3.364994, 1, 0, 0, 1, 1,
-0.451211, 0.2357748, 0.0239818, 1, 0, 0, 1, 1,
-0.4491542, -1.635258, -1.551509, 1, 0, 0, 1, 1,
-0.4472976, 0.7491605, 0.1410691, 0, 0, 0, 1, 1,
-0.4466639, -0.1241904, -2.665923, 0, 0, 0, 1, 1,
-0.4387628, 0.007365472, -3.339936, 0, 0, 0, 1, 1,
-0.4306256, 2.27068, -0.3350035, 0, 0, 0, 1, 1,
-0.4276954, 0.5560138, 0.4866521, 0, 0, 0, 1, 1,
-0.4259826, 2.306415, -1.157097, 0, 0, 0, 1, 1,
-0.4243844, 0.6740273, -0.09074428, 0, 0, 0, 1, 1,
-0.422597, 0.04432977, -1.829002, 1, 1, 1, 1, 1,
-0.4206553, -1.154415, -5.105259, 1, 1, 1, 1, 1,
-0.4198691, 0.2081373, 0.6623992, 1, 1, 1, 1, 1,
-0.4168431, -0.4925843, -1.134776, 1, 1, 1, 1, 1,
-0.4148807, 1.456258, -0.04925093, 1, 1, 1, 1, 1,
-0.4134426, -1.408959, -2.52889, 1, 1, 1, 1, 1,
-0.4079539, 0.6577588, -0.9341257, 1, 1, 1, 1, 1,
-0.4072178, 1.522161, 0.285326, 1, 1, 1, 1, 1,
-0.4016511, 1.464442, -0.5930778, 1, 1, 1, 1, 1,
-0.4015272, 1.420131, 1.862564, 1, 1, 1, 1, 1,
-0.4002892, -1.181074, -1.604499, 1, 1, 1, 1, 1,
-0.3944763, -2.924439, -2.850521, 1, 1, 1, 1, 1,
-0.3941609, 1.295443, -2.038898, 1, 1, 1, 1, 1,
-0.3882948, -2.346096, -4.614804, 1, 1, 1, 1, 1,
-0.387688, -0.1515737, 0.1352564, 1, 1, 1, 1, 1,
-0.3858113, -0.4146969, -2.603717, 0, 0, 1, 1, 1,
-0.3825536, -2.465635, -4.333749, 1, 0, 0, 1, 1,
-0.3792136, 0.1959885, -0.2617178, 1, 0, 0, 1, 1,
-0.378141, -0.6494052, -2.053706, 1, 0, 0, 1, 1,
-0.3751265, 1.746246, -0.01551994, 1, 0, 0, 1, 1,
-0.3748459, -1.277234, -4.472699, 1, 0, 0, 1, 1,
-0.3742987, 2.162862, -0.5704037, 0, 0, 0, 1, 1,
-0.3730572, -0.3773864, -1.608561, 0, 0, 0, 1, 1,
-0.3599142, 0.562395, -1.771474, 0, 0, 0, 1, 1,
-0.3580973, -2.413548, -1.621622, 0, 0, 0, 1, 1,
-0.357771, 1.275204, -0.9467459, 0, 0, 0, 1, 1,
-0.3541883, 0.2812907, -0.8571231, 0, 0, 0, 1, 1,
-0.3531491, -2.490276, -1.711496, 0, 0, 0, 1, 1,
-0.3513728, 0.2497609, -0.9761224, 1, 1, 1, 1, 1,
-0.3513181, -0.9084071, -3.994772, 1, 1, 1, 1, 1,
-0.3506384, 0.2967978, -0.9693386, 1, 1, 1, 1, 1,
-0.349955, -0.5803868, -2.45017, 1, 1, 1, 1, 1,
-0.3485851, 0.4887201, -0.3689531, 1, 1, 1, 1, 1,
-0.3471712, -0.7753425, -3.790235, 1, 1, 1, 1, 1,
-0.3451223, -0.9660386, -2.345779, 1, 1, 1, 1, 1,
-0.3446451, 0.5742554, 1.208744, 1, 1, 1, 1, 1,
-0.3429033, -0.06526319, -2.086916, 1, 1, 1, 1, 1,
-0.342722, 0.8462628, -0.5952278, 1, 1, 1, 1, 1,
-0.341058, 0.5414672, 0.3324085, 1, 1, 1, 1, 1,
-0.3391705, 0.01653407, -2.125179, 1, 1, 1, 1, 1,
-0.3384751, 0.03957598, -2.476814, 1, 1, 1, 1, 1,
-0.3305852, -0.1401349, -1.178941, 1, 1, 1, 1, 1,
-0.3304078, -0.4224263, -2.075137, 1, 1, 1, 1, 1,
-0.325489, -0.02620341, -1.537342, 0, 0, 1, 1, 1,
-0.3253938, 1.676403, 1.696843, 1, 0, 0, 1, 1,
-0.3224829, 0.7107474, 0.5892022, 1, 0, 0, 1, 1,
-0.3200138, -0.3313279, -1.8411, 1, 0, 0, 1, 1,
-0.3175543, -1.181531, -3.888936, 1, 0, 0, 1, 1,
-0.3146023, 0.5316437, 0.6680089, 1, 0, 0, 1, 1,
-0.313086, -0.005945746, -0.4140323, 0, 0, 0, 1, 1,
-0.3124483, 1.023195, -0.2401512, 0, 0, 0, 1, 1,
-0.3077404, -0.5017021, -2.029108, 0, 0, 0, 1, 1,
-0.3046177, 1.428362, 0.04134001, 0, 0, 0, 1, 1,
-0.3014909, 1.700456, -0.7263885, 0, 0, 0, 1, 1,
-0.2965977, -0.2091719, -1.641851, 0, 0, 0, 1, 1,
-0.2930661, -1.490586, -2.287071, 0, 0, 0, 1, 1,
-0.2877976, 1.089473, -0.620576, 1, 1, 1, 1, 1,
-0.2874608, 0.5746425, -0.462373, 1, 1, 1, 1, 1,
-0.285161, -0.573487, -4.360448, 1, 1, 1, 1, 1,
-0.2825286, -0.6695972, -2.3221, 1, 1, 1, 1, 1,
-0.2776249, 0.8963879, 0.08104988, 1, 1, 1, 1, 1,
-0.2759468, 1.335263, -1.857342, 1, 1, 1, 1, 1,
-0.2680866, 1.092815, -0.3699779, 1, 1, 1, 1, 1,
-0.2675636, 1.304384, 1.713777, 1, 1, 1, 1, 1,
-0.263654, -0.753664, -2.875337, 1, 1, 1, 1, 1,
-0.2633286, -1.769298, -4.27229, 1, 1, 1, 1, 1,
-0.2593364, -2.481669, -4.060318, 1, 1, 1, 1, 1,
-0.2593328, 0.01698504, -1.50977, 1, 1, 1, 1, 1,
-0.2585575, -1.933008, -3.204976, 1, 1, 1, 1, 1,
-0.2547003, 0.7154503, -0.4872044, 1, 1, 1, 1, 1,
-0.2539648, -0.4334382, -3.768963, 1, 1, 1, 1, 1,
-0.2518093, -0.07520333, -3.097484, 0, 0, 1, 1, 1,
-0.2489119, 0.946412, 1.005329, 1, 0, 0, 1, 1,
-0.2481053, -0.8720238, -4.491651, 1, 0, 0, 1, 1,
-0.2370312, 0.04489601, -1.154866, 1, 0, 0, 1, 1,
-0.2361134, 0.5958772, -0.2265644, 1, 0, 0, 1, 1,
-0.2357969, 0.8453132, -1.427296, 1, 0, 0, 1, 1,
-0.2305694, -0.3696681, -1.814204, 0, 0, 0, 1, 1,
-0.2245954, 0.3076475, -0.7212592, 0, 0, 0, 1, 1,
-0.2235498, -1.050897, -0.9762396, 0, 0, 0, 1, 1,
-0.2218235, 0.7475438, -0.9505423, 0, 0, 0, 1, 1,
-0.2212935, -0.5717521, -1.645681, 0, 0, 0, 1, 1,
-0.2207259, -0.261763, -3.395448, 0, 0, 0, 1, 1,
-0.2173096, 0.7990493, -1.555255, 0, 0, 0, 1, 1,
-0.2131696, 0.2972254, 0.5643908, 1, 1, 1, 1, 1,
-0.2125212, 0.9313005, -0.970867, 1, 1, 1, 1, 1,
-0.2107963, 0.8072839, 0.2758786, 1, 1, 1, 1, 1,
-0.2094602, 1.703696, -0.04316619, 1, 1, 1, 1, 1,
-0.208816, -0.584086, -2.342865, 1, 1, 1, 1, 1,
-0.2077094, -0.9725986, -4.085184, 1, 1, 1, 1, 1,
-0.2076448, -1.694484, -4.322202, 1, 1, 1, 1, 1,
-0.2025757, 0.2638669, -0.01960656, 1, 1, 1, 1, 1,
-0.2023491, 2.086441, 0.0284924, 1, 1, 1, 1, 1,
-0.1965846, -1.457102, -2.646238, 1, 1, 1, 1, 1,
-0.1956492, -1.22711, -2.259311, 1, 1, 1, 1, 1,
-0.1956216, -0.683185, -1.943128, 1, 1, 1, 1, 1,
-0.1904714, 2.115077, 1.389311, 1, 1, 1, 1, 1,
-0.188264, -1.399832, -3.425912, 1, 1, 1, 1, 1,
-0.1875282, 0.6813782, -1.664207, 1, 1, 1, 1, 1,
-0.1834069, 1.085655, -1.3845, 0, 0, 1, 1, 1,
-0.1832772, 0.3895558, -0.3018006, 1, 0, 0, 1, 1,
-0.1776416, 1.817412, -0.0005430827, 1, 0, 0, 1, 1,
-0.176483, 0.5553318, 0.8883811, 1, 0, 0, 1, 1,
-0.17451, -1.459547, -2.661209, 1, 0, 0, 1, 1,
-0.1736666, 1.030814, 0.960493, 1, 0, 0, 1, 1,
-0.1723654, 0.966488, 0.9864373, 0, 0, 0, 1, 1,
-0.1692579, -2.708159, -3.446723, 0, 0, 0, 1, 1,
-0.1669088, 0.4299384, -0.08317403, 0, 0, 0, 1, 1,
-0.1610678, 1.092574, -0.7137077, 0, 0, 0, 1, 1,
-0.1576206, -0.2712536, -2.671225, 0, 0, 0, 1, 1,
-0.1561011, -1.147795, -1.895901, 0, 0, 0, 1, 1,
-0.1560933, 0.4126408, -1.49165, 0, 0, 0, 1, 1,
-0.1480203, 0.8840574, -1.178783, 1, 1, 1, 1, 1,
-0.1447345, -0.5888522, -2.57291, 1, 1, 1, 1, 1,
-0.1401565, -1.064412, -2.099249, 1, 1, 1, 1, 1,
-0.1354734, 1.557027, 1.854672, 1, 1, 1, 1, 1,
-0.1338681, 2.04328, -1.173825, 1, 1, 1, 1, 1,
-0.1307872, -1.330534, -2.49669, 1, 1, 1, 1, 1,
-0.1260591, -0.3807344, -3.125527, 1, 1, 1, 1, 1,
-0.1258319, -0.1657524, -2.057036, 1, 1, 1, 1, 1,
-0.1241757, -0.2839431, -4.024303, 1, 1, 1, 1, 1,
-0.1241546, 1.172727, -0.3123044, 1, 1, 1, 1, 1,
-0.1239901, -1.326268, -3.16074, 1, 1, 1, 1, 1,
-0.1222714, -1.449304, -1.946314, 1, 1, 1, 1, 1,
-0.1208745, -1.215926, -3.592279, 1, 1, 1, 1, 1,
-0.1149049, -0.007553063, -2.936073, 1, 1, 1, 1, 1,
-0.1141777, 0.3435053, 0.4133422, 1, 1, 1, 1, 1,
-0.1106015, 1.848923, -1.365618, 0, 0, 1, 1, 1,
-0.1102912, 0.1347864, -0.8948631, 1, 0, 0, 1, 1,
-0.1099218, 0.6164559, 0.3691355, 1, 0, 0, 1, 1,
-0.1079137, -0.2728254, -2.092745, 1, 0, 0, 1, 1,
-0.1047082, 1.002476, -0.95525, 1, 0, 0, 1, 1,
-0.1032273, -0.1964335, -2.201367, 1, 0, 0, 1, 1,
-0.1018761, -0.2003969, -2.334534, 0, 0, 0, 1, 1,
-0.1005341, -1.769403, -2.108786, 0, 0, 0, 1, 1,
-0.1004781, -0.8635425, -5.02316, 0, 0, 0, 1, 1,
-0.09983413, -0.6814267, -3.77478, 0, 0, 0, 1, 1,
-0.09797224, -0.1445487, -2.962712, 0, 0, 0, 1, 1,
-0.09699079, -0.5675174, -3.91157, 0, 0, 0, 1, 1,
-0.09653109, -0.5813735, -3.624325, 0, 0, 0, 1, 1,
-0.09554671, 0.1530199, -1.193287, 1, 1, 1, 1, 1,
-0.09380095, -1.020095, -2.778383, 1, 1, 1, 1, 1,
-0.0932845, 0.09632602, -0.1051076, 1, 1, 1, 1, 1,
-0.09062463, -1.501905, -3.065347, 1, 1, 1, 1, 1,
-0.09026215, -1.207296, -2.757843, 1, 1, 1, 1, 1,
-0.08493552, -1.474752, -4.165941, 1, 1, 1, 1, 1,
-0.07906231, 0.504036, 2.272244, 1, 1, 1, 1, 1,
-0.07834379, 0.3050414, -2.261302, 1, 1, 1, 1, 1,
-0.07711846, -0.7515349, -3.491353, 1, 1, 1, 1, 1,
-0.07643086, -0.3990319, -4.623724, 1, 1, 1, 1, 1,
-0.07637145, -0.5317785, -4.059779, 1, 1, 1, 1, 1,
-0.06920265, -1.046204, -3.826459, 1, 1, 1, 1, 1,
-0.06661993, -0.3812632, -3.790098, 1, 1, 1, 1, 1,
-0.06475938, 0.2259785, -0.1542216, 1, 1, 1, 1, 1,
-0.0632186, -1.383813, -2.596837, 1, 1, 1, 1, 1,
-0.06056821, 0.9274919, -1.706577, 0, 0, 1, 1, 1,
-0.0588146, 0.8517008, -0.7190541, 1, 0, 0, 1, 1,
-0.05755468, -2.439178, -2.882161, 1, 0, 0, 1, 1,
-0.05706557, 0.35389, 0.847754, 1, 0, 0, 1, 1,
-0.04764254, 0.4267611, 0.6845722, 1, 0, 0, 1, 1,
-0.04638582, -0.8968011, -2.523404, 1, 0, 0, 1, 1,
-0.04555551, 0.2546601, -0.7396259, 0, 0, 0, 1, 1,
-0.04470865, 0.9558277, 2.338265, 0, 0, 0, 1, 1,
-0.03941192, 0.4539861, 1.366632, 0, 0, 0, 1, 1,
-0.03880851, 0.2842216, -0.9793816, 0, 0, 0, 1, 1,
-0.02106605, -0.09883805, -2.40319, 0, 0, 0, 1, 1,
-0.02066352, -0.6381776, -4.371943, 0, 0, 0, 1, 1,
-0.01861219, -1.717617, -2.729758, 0, 0, 0, 1, 1,
-0.01269976, -1.084294, -3.816309, 1, 1, 1, 1, 1,
-0.01031563, -0.3898418, -2.397774, 1, 1, 1, 1, 1,
-0.008550475, -0.3517688, -3.008271, 1, 1, 1, 1, 1,
-0.007749015, 0.6012418, 1.634559, 1, 1, 1, 1, 1,
-0.007566457, -0.3118904, -2.887764, 1, 1, 1, 1, 1,
-0.007086056, 0.3681554, -0.825878, 1, 1, 1, 1, 1,
-0.006313708, -1.673172, -4.694087, 1, 1, 1, 1, 1,
-0.004754458, -0.1139818, -2.777262, 1, 1, 1, 1, 1,
-0.003809205, -0.6350659, -1.197966, 1, 1, 1, 1, 1,
-0.001492579, -0.06581881, -2.643431, 1, 1, 1, 1, 1,
-7.44756e-05, -0.9252226, -1.709791, 1, 1, 1, 1, 1,
0.001073166, 2.815488, -1.343336, 1, 1, 1, 1, 1,
0.006247536, 0.269065, 1.492551, 1, 1, 1, 1, 1,
0.009656265, -0.2159555, 4.046434, 1, 1, 1, 1, 1,
0.01132459, -0.9880045, 4.648332, 1, 1, 1, 1, 1,
0.01425554, -0.3528304, 2.280118, 0, 0, 1, 1, 1,
0.01961081, -0.2541174, 2.428721, 1, 0, 0, 1, 1,
0.01983982, -1.135697, 3.869519, 1, 0, 0, 1, 1,
0.02063907, 0.614297, 0.4425499, 1, 0, 0, 1, 1,
0.02456917, -1.730589, 2.831612, 1, 0, 0, 1, 1,
0.02470316, 0.5598675, -0.8866565, 1, 0, 0, 1, 1,
0.02509514, 0.6927219, -0.7943335, 0, 0, 0, 1, 1,
0.02577482, -0.4354396, 2.853163, 0, 0, 0, 1, 1,
0.0297801, -2.567912, 4.875947, 0, 0, 0, 1, 1,
0.02979981, -0.2080621, 3.527758, 0, 0, 0, 1, 1,
0.03017517, 0.4613404, 1.112615, 0, 0, 0, 1, 1,
0.03236256, -0.3133441, 3.318952, 0, 0, 0, 1, 1,
0.03374941, 1.110924, -0.5993149, 0, 0, 0, 1, 1,
0.03959079, -1.330072, 2.863074, 1, 1, 1, 1, 1,
0.04060115, -0.7331081, 2.162878, 1, 1, 1, 1, 1,
0.0409462, 0.4184493, -1.232286, 1, 1, 1, 1, 1,
0.04156498, -0.5488805, 2.206605, 1, 1, 1, 1, 1,
0.0427479, -1.662733, 4.471828, 1, 1, 1, 1, 1,
0.04285184, -0.5366472, 4.207752, 1, 1, 1, 1, 1,
0.04298534, 0.2353349, -0.04136894, 1, 1, 1, 1, 1,
0.05210707, 0.8390091, -0.2417664, 1, 1, 1, 1, 1,
0.05299686, -0.1197216, 3.218096, 1, 1, 1, 1, 1,
0.05363693, -0.1184979, 1.337613, 1, 1, 1, 1, 1,
0.05862144, 1.433007, 1.133043, 1, 1, 1, 1, 1,
0.05930722, 0.1473484, 1.434664, 1, 1, 1, 1, 1,
0.06448536, 1.132298, 0.1206269, 1, 1, 1, 1, 1,
0.06495974, -0.7290156, 2.666453, 1, 1, 1, 1, 1,
0.06648804, -2.418839, 3.718794, 1, 1, 1, 1, 1,
0.06672031, -1.442557, 4.570503, 0, 0, 1, 1, 1,
0.06682522, -0.1640727, 2.637352, 1, 0, 0, 1, 1,
0.06791881, 1.129411, -0.5092734, 1, 0, 0, 1, 1,
0.07313094, 0.4144295, 1.746735, 1, 0, 0, 1, 1,
0.07507399, -2.367718, 3.586195, 1, 0, 0, 1, 1,
0.0795651, 0.2442758, 1.841937, 1, 0, 0, 1, 1,
0.08021205, 1.723389, -0.03090085, 0, 0, 0, 1, 1,
0.08065985, -0.6048131, 2.935137, 0, 0, 0, 1, 1,
0.08287283, -0.6897768, 0.8277665, 0, 0, 0, 1, 1,
0.08511082, -0.490874, 2.961579, 0, 0, 0, 1, 1,
0.08542207, 1.076042, -1.11669, 0, 0, 0, 1, 1,
0.08653353, -0.6729754, 3.462762, 0, 0, 0, 1, 1,
0.09760517, 0.165434, 0.8620459, 0, 0, 0, 1, 1,
0.0979883, -0.2464297, 2.150237, 1, 1, 1, 1, 1,
0.1011625, -0.4918325, 3.797941, 1, 1, 1, 1, 1,
0.103789, -0.1224367, 1.768336, 1, 1, 1, 1, 1,
0.1077956, -0.7026848, 2.702685, 1, 1, 1, 1, 1,
0.1090657, 0.2914398, 1.833877, 1, 1, 1, 1, 1,
0.1139358, 1.79976, 1.169972, 1, 1, 1, 1, 1,
0.1168796, -2.125334, 2.936239, 1, 1, 1, 1, 1,
0.1169879, -0.02764811, 3.086164, 1, 1, 1, 1, 1,
0.1182061, 0.3312117, 2.292593, 1, 1, 1, 1, 1,
0.1182311, -0.6646912, 3.386285, 1, 1, 1, 1, 1,
0.1210457, 2.272046, 0.8785596, 1, 1, 1, 1, 1,
0.1262365, 2.249254, -0.9217172, 1, 1, 1, 1, 1,
0.1323198, -0.1402369, 1.84893, 1, 1, 1, 1, 1,
0.1371564, 1.045174, -0.3933119, 1, 1, 1, 1, 1,
0.1393156, -2.254644, 3.202332, 1, 1, 1, 1, 1,
0.1457943, -0.9623991, 2.795733, 0, 0, 1, 1, 1,
0.1467091, -0.1337429, 1.709748, 1, 0, 0, 1, 1,
0.1537, 1.02503, 0.6192242, 1, 0, 0, 1, 1,
0.1562046, 0.8498219, 0.7521988, 1, 0, 0, 1, 1,
0.1589276, 0.1019645, 0.6516366, 1, 0, 0, 1, 1,
0.1593783, -0.8630288, 3.055781, 1, 0, 0, 1, 1,
0.1635493, -0.3788887, 3.292648, 0, 0, 0, 1, 1,
0.1699788, 1.366456, 1.936369, 0, 0, 0, 1, 1,
0.1720314, -0.8192523, 1.41765, 0, 0, 0, 1, 1,
0.1729512, -1.225905, 2.044448, 0, 0, 0, 1, 1,
0.1736576, -0.5442368, 2.801909, 0, 0, 0, 1, 1,
0.1813333, 1.721232, -0.5561187, 0, 0, 0, 1, 1,
0.1813645, -1.833699, 2.695786, 0, 0, 0, 1, 1,
0.1839484, 0.0816959, 1.930283, 1, 1, 1, 1, 1,
0.1899255, -2.058052, 2.443637, 1, 1, 1, 1, 1,
0.1902897, -0.07725085, 3.449923, 1, 1, 1, 1, 1,
0.1903261, 0.1467197, 0.4533266, 1, 1, 1, 1, 1,
0.1953224, -1.615251, 1.805657, 1, 1, 1, 1, 1,
0.1979241, -0.3024783, 2.32576, 1, 1, 1, 1, 1,
0.1989474, -0.8740857, 1.944368, 1, 1, 1, 1, 1,
0.2036407, -0.7858099, 2.471944, 1, 1, 1, 1, 1,
0.2073885, 0.4451898, 2.193271, 1, 1, 1, 1, 1,
0.2079191, -3.052063, 3.035371, 1, 1, 1, 1, 1,
0.2085494, -0.4738699, 3.530859, 1, 1, 1, 1, 1,
0.2088449, -1.815192, 1.292897, 1, 1, 1, 1, 1,
0.2102491, 0.7201706, -1.343754, 1, 1, 1, 1, 1,
0.2122361, -0.6200121, 2.597217, 1, 1, 1, 1, 1,
0.2145861, 0.08386198, 2.596587, 1, 1, 1, 1, 1,
0.2153206, -0.7841879, 1.457398, 0, 0, 1, 1, 1,
0.2177999, 0.7648776, 0.07708096, 1, 0, 0, 1, 1,
0.2180506, -0.9391996, 2.796626, 1, 0, 0, 1, 1,
0.2223042, 0.595129, -0.2892139, 1, 0, 0, 1, 1,
0.2240842, 0.5945126, 0.517437, 1, 0, 0, 1, 1,
0.2259984, 0.4534445, 2.478347, 1, 0, 0, 1, 1,
0.2265736, 1.253567, -1.674173, 0, 0, 0, 1, 1,
0.2265947, 1.335425, -1.951356, 0, 0, 0, 1, 1,
0.2304567, -0.8154836, 1.815359, 0, 0, 0, 1, 1,
0.2344075, 0.6872978, -1.389116, 0, 0, 0, 1, 1,
0.2345048, 1.949235, 0.4719192, 0, 0, 0, 1, 1,
0.2426261, -1.028504, 2.540394, 0, 0, 0, 1, 1,
0.2440218, 0.1149631, -1.403714, 0, 0, 0, 1, 1,
0.245469, -0.6873835, 3.014085, 1, 1, 1, 1, 1,
0.2468847, 0.1528835, 1.319484, 1, 1, 1, 1, 1,
0.2482172, 0.3406303, -0.4669467, 1, 1, 1, 1, 1,
0.2492088, 1.419606, 0.8198591, 1, 1, 1, 1, 1,
0.2528655, 0.5363743, -1.009987, 1, 1, 1, 1, 1,
0.2549699, 0.8136162, -0.115147, 1, 1, 1, 1, 1,
0.2550955, 0.3301898, 0.2066957, 1, 1, 1, 1, 1,
0.2584228, -0.7234049, 3.10845, 1, 1, 1, 1, 1,
0.258947, 0.428138, 2.423472, 1, 1, 1, 1, 1,
0.2612285, 0.7877262, -0.5885293, 1, 1, 1, 1, 1,
0.2633216, 0.8090435, 1.32447, 1, 1, 1, 1, 1,
0.2658508, -1.943265, 1.431559, 1, 1, 1, 1, 1,
0.2666913, 1.005543, 1.90818, 1, 1, 1, 1, 1,
0.2696909, 0.7182732, -1.377349, 1, 1, 1, 1, 1,
0.2701778, 1.205671, 0.6001897, 1, 1, 1, 1, 1,
0.2726956, -0.2626566, 1.105998, 0, 0, 1, 1, 1,
0.2766442, -0.560748, 3.008672, 1, 0, 0, 1, 1,
0.2792239, -0.5655596, 3.154984, 1, 0, 0, 1, 1,
0.2869917, 0.2053879, -0.1946864, 1, 0, 0, 1, 1,
0.289788, -0.131861, 1.507218, 1, 0, 0, 1, 1,
0.2918518, -0.5107325, 3.456789, 1, 0, 0, 1, 1,
0.2923366, -0.09909673, 3.235569, 0, 0, 0, 1, 1,
0.2965609, -0.241398, 1.835661, 0, 0, 0, 1, 1,
0.2966199, 0.6743202, 0.4916553, 0, 0, 0, 1, 1,
0.297826, -0.6561435, 2.621091, 0, 0, 0, 1, 1,
0.2984209, -0.4200591, 4.577086, 0, 0, 0, 1, 1,
0.3016769, 0.5293432, -0.274478, 0, 0, 0, 1, 1,
0.3032674, 1.318547, -0.271181, 0, 0, 0, 1, 1,
0.3045146, -0.9392964, 1.450975, 1, 1, 1, 1, 1,
0.3111414, 1.14387, -0.4572286, 1, 1, 1, 1, 1,
0.3146582, 0.7057849, -0.8012598, 1, 1, 1, 1, 1,
0.3156479, -0.8085074, 2.486573, 1, 1, 1, 1, 1,
0.315712, 0.3097038, 0.9670215, 1, 1, 1, 1, 1,
0.3166047, 1.785051, 0.4911132, 1, 1, 1, 1, 1,
0.323141, 0.4729702, 0.05874719, 1, 1, 1, 1, 1,
0.3235649, -1.732045, 3.046656, 1, 1, 1, 1, 1,
0.3252716, -1.040582, 4.436433, 1, 1, 1, 1, 1,
0.3263329, -0.3667006, 5.359818, 1, 1, 1, 1, 1,
0.3293788, -0.2477402, 3.164216, 1, 1, 1, 1, 1,
0.3307292, 1.846811, 0.8506526, 1, 1, 1, 1, 1,
0.3310864, 0.9108509, 0.2773347, 1, 1, 1, 1, 1,
0.3345774, 1.053694, 0.2185558, 1, 1, 1, 1, 1,
0.3363062, -0.6802341, 3.029995, 1, 1, 1, 1, 1,
0.3371965, -1.21373, 1.313133, 0, 0, 1, 1, 1,
0.3436741, -0.4841087, 3.866735, 1, 0, 0, 1, 1,
0.3471276, -2.151756, 3.126726, 1, 0, 0, 1, 1,
0.3490409, -0.05014197, 4.186306, 1, 0, 0, 1, 1,
0.3601734, -0.4266028, 2.487933, 1, 0, 0, 1, 1,
0.3619273, -0.1312305, 2.495963, 1, 0, 0, 1, 1,
0.3620423, -0.7403895, 1.822296, 0, 0, 0, 1, 1,
0.3681013, -1.016455, 1.873588, 0, 0, 0, 1, 1,
0.3758452, 0.8276126, 0.08633949, 0, 0, 0, 1, 1,
0.3810702, -0.9683909, 2.947857, 0, 0, 0, 1, 1,
0.3899928, -1.924811, 1.471658, 0, 0, 0, 1, 1,
0.3913476, 1.353314, -1.757447, 0, 0, 0, 1, 1,
0.3958591, -0.772686, 2.183172, 0, 0, 0, 1, 1,
0.3974187, 1.014176, -0.6951695, 1, 1, 1, 1, 1,
0.3978522, -0.9212081, 3.661633, 1, 1, 1, 1, 1,
0.399694, 1.066496, -0.2918582, 1, 1, 1, 1, 1,
0.4023675, -0.8536918, 1.363746, 1, 1, 1, 1, 1,
0.4029392, 1.254443, 0.5239756, 1, 1, 1, 1, 1,
0.4091429, -0.2682513, 0.6419249, 1, 1, 1, 1, 1,
0.4111671, -1.078388, 0.9410653, 1, 1, 1, 1, 1,
0.4117104, 0.8978298, 0.4089867, 1, 1, 1, 1, 1,
0.4206057, -0.6466855, 1.984341, 1, 1, 1, 1, 1,
0.4226264, -2.378977, 1.467229, 1, 1, 1, 1, 1,
0.4269117, -2.955563, 4.018092, 1, 1, 1, 1, 1,
0.4270895, 0.8163107, 1.652084, 1, 1, 1, 1, 1,
0.4272635, 1.351898, -0.5238771, 1, 1, 1, 1, 1,
0.428093, 1.484073, 1.71697, 1, 1, 1, 1, 1,
0.4292649, -0.1445378, 0.8478282, 1, 1, 1, 1, 1,
0.4294479, -0.2680139, 2.229386, 0, 0, 1, 1, 1,
0.430765, 1.2502, -0.04884968, 1, 0, 0, 1, 1,
0.4319761, -0.6770426, 2.154497, 1, 0, 0, 1, 1,
0.4335529, -1.592058, 2.089128, 1, 0, 0, 1, 1,
0.4363121, 0.4744754, 0.8241192, 1, 0, 0, 1, 1,
0.4364662, 0.4850194, 1.43334, 1, 0, 0, 1, 1,
0.4396441, 0.006789898, 1.686101, 0, 0, 0, 1, 1,
0.4433576, 0.007268155, 2.204787, 0, 0, 0, 1, 1,
0.4434747, 0.2875175, -0.2768601, 0, 0, 0, 1, 1,
0.4470255, -0.9656034, 2.7251, 0, 0, 0, 1, 1,
0.4487305, -0.07841729, 0.6733102, 0, 0, 0, 1, 1,
0.4630381, -1.363497, 2.273436, 0, 0, 0, 1, 1,
0.4647889, -0.2020539, 2.686667, 0, 0, 0, 1, 1,
0.4669423, 0.7985831, 0.5195186, 1, 1, 1, 1, 1,
0.4692071, -0.7795487, 3.649558, 1, 1, 1, 1, 1,
0.4765822, 0.3987026, -1.058827, 1, 1, 1, 1, 1,
0.4781018, 0.1733501, 1.039982, 1, 1, 1, 1, 1,
0.479738, -0.3866441, 2.017905, 1, 1, 1, 1, 1,
0.4818559, -0.9855266, 0.7483053, 1, 1, 1, 1, 1,
0.4838286, 2.244301, -0.2399915, 1, 1, 1, 1, 1,
0.4912966, 0.5220233, 1.182332, 1, 1, 1, 1, 1,
0.5002815, 0.7981498, 1.330858, 1, 1, 1, 1, 1,
0.5026349, -0.3038449, 4.172744, 1, 1, 1, 1, 1,
0.5034786, 0.1104538, 1.718226, 1, 1, 1, 1, 1,
0.5061044, 0.4249985, -0.05526666, 1, 1, 1, 1, 1,
0.5087305, 0.378514, -0.2327702, 1, 1, 1, 1, 1,
0.5120968, -0.1788036, 3.295228, 1, 1, 1, 1, 1,
0.5172098, 0.02162545, 1.907629, 1, 1, 1, 1, 1,
0.5195785, -0.4209724, 0.5478974, 0, 0, 1, 1, 1,
0.5265608, 0.3004862, 0.1269711, 1, 0, 0, 1, 1,
0.5310216, 1.425139, -0.1644114, 1, 0, 0, 1, 1,
0.5320286, 0.1223088, 1.680403, 1, 0, 0, 1, 1,
0.5328532, 0.5657952, -1.71264, 1, 0, 0, 1, 1,
0.5375736, -0.6906688, 2.336275, 1, 0, 0, 1, 1,
0.5400524, -2.083598, 4.73513, 0, 0, 0, 1, 1,
0.5408961, 2.383847, 0.7929723, 0, 0, 0, 1, 1,
0.5428661, 0.6112605, -1.268199, 0, 0, 0, 1, 1,
0.5486839, 1.244189, 2.147409, 0, 0, 0, 1, 1,
0.5527244, 0.7851882, 1.350984, 0, 0, 0, 1, 1,
0.5555323, -0.4358061, 0.7182526, 0, 0, 0, 1, 1,
0.5584509, 0.422117, 2.968697, 0, 0, 0, 1, 1,
0.5619142, 0.8222141, 2.206557, 1, 1, 1, 1, 1,
0.569654, 0.5852035, 0.594007, 1, 1, 1, 1, 1,
0.5726949, 0.08569186, 1.371127, 1, 1, 1, 1, 1,
0.5739918, 0.4592027, -0.5502678, 1, 1, 1, 1, 1,
0.5826646, -1.150495, 1.008107, 1, 1, 1, 1, 1,
0.5900007, 0.2361723, 1.385785, 1, 1, 1, 1, 1,
0.594619, 0.1654925, 1.654383, 1, 1, 1, 1, 1,
0.5948582, 0.7000697, 2.254129, 1, 1, 1, 1, 1,
0.6003031, -0.2909654, 3.776677, 1, 1, 1, 1, 1,
0.6006803, 0.7636966, 0.3195593, 1, 1, 1, 1, 1,
0.6013049, 0.914165, 1.491958, 1, 1, 1, 1, 1,
0.6053105, 0.5362656, 2.58941, 1, 1, 1, 1, 1,
0.6059318, -1.973283, 4.218244, 1, 1, 1, 1, 1,
0.611933, 1.193901, 0.5255846, 1, 1, 1, 1, 1,
0.6202654, -1.348641, 2.605729, 1, 1, 1, 1, 1,
0.6210585, -0.8205267, 3.044888, 0, 0, 1, 1, 1,
0.6215886, -1.112303, 3.395834, 1, 0, 0, 1, 1,
0.6253935, -0.2461363, 2.389054, 1, 0, 0, 1, 1,
0.6306487, 0.03672928, 1.557616, 1, 0, 0, 1, 1,
0.6315208, -0.1408535, 2.849833, 1, 0, 0, 1, 1,
0.6346304, -0.9932677, 4.299376, 1, 0, 0, 1, 1,
0.6482111, -0.2938368, 1.53704, 0, 0, 0, 1, 1,
0.6491755, 0.1328696, 0.6568121, 0, 0, 0, 1, 1,
0.6503454, -0.2468332, 2.694148, 0, 0, 0, 1, 1,
0.6529242, 0.3370105, -0.4654107, 0, 0, 0, 1, 1,
0.654568, 0.1883968, 4.073757, 0, 0, 0, 1, 1,
0.660077, 0.2941539, 0.6475641, 0, 0, 0, 1, 1,
0.6657689, 1.543887, 0.830339, 0, 0, 0, 1, 1,
0.6683484, -0.3784436, 3.421859, 1, 1, 1, 1, 1,
0.673721, 0.230848, 0.5811566, 1, 1, 1, 1, 1,
0.6945896, 1.070141, -0.6002761, 1, 1, 1, 1, 1,
0.7015412, -1.577338, 2.728752, 1, 1, 1, 1, 1,
0.7096433, 0.5169667, 0.06919471, 1, 1, 1, 1, 1,
0.7105857, -1.636757, 1.110303, 1, 1, 1, 1, 1,
0.7130527, -0.8637931, 2.774906, 1, 1, 1, 1, 1,
0.7183243, -0.6731381, 1.67449, 1, 1, 1, 1, 1,
0.7257065, 0.9862695, -0.2109758, 1, 1, 1, 1, 1,
0.7283813, 0.5986374, 0.2396181, 1, 1, 1, 1, 1,
0.7289714, 1.522336, 1.706305, 1, 1, 1, 1, 1,
0.7295687, 2.098105, -0.6391863, 1, 1, 1, 1, 1,
0.7336615, 1.473138, -1.56979, 1, 1, 1, 1, 1,
0.7438313, -1.059667, 1.200765, 1, 1, 1, 1, 1,
0.7477276, 0.6217949, -0.877131, 1, 1, 1, 1, 1,
0.7521893, 1.078247, 1.304297, 0, 0, 1, 1, 1,
0.761615, 0.9815232, 1.063573, 1, 0, 0, 1, 1,
0.7620688, -0.1114586, 1.618665, 1, 0, 0, 1, 1,
0.7628427, -1.08473, 2.513075, 1, 0, 0, 1, 1,
0.7663861, -0.1567234, 2.299761, 1, 0, 0, 1, 1,
0.7692801, -2.493906, 2.925722, 1, 0, 0, 1, 1,
0.7752844, -0.4054928, 1.731657, 0, 0, 0, 1, 1,
0.7817979, -2.117763, 2.095808, 0, 0, 0, 1, 1,
0.787235, -0.5888758, 2.180479, 0, 0, 0, 1, 1,
0.7899063, 1.89249, -0.1941817, 0, 0, 0, 1, 1,
0.7924882, -0.3924228, 1.938249, 0, 0, 0, 1, 1,
0.7943428, 0.1746906, 1.850247, 0, 0, 0, 1, 1,
0.7988498, -0.3367509, 2.189169, 0, 0, 0, 1, 1,
0.8034341, 1.787176, 0.7347681, 1, 1, 1, 1, 1,
0.8044714, -1.607285, 1.338762, 1, 1, 1, 1, 1,
0.8108395, -1.086661, 1.475379, 1, 1, 1, 1, 1,
0.812472, -0.8614746, 2.455774, 1, 1, 1, 1, 1,
0.818112, -0.3058251, 1.435307, 1, 1, 1, 1, 1,
0.8274938, 1.329646, 0.7663707, 1, 1, 1, 1, 1,
0.8309433, -0.4453797, 2.140272, 1, 1, 1, 1, 1,
0.8335751, 0.8419493, 1.009676, 1, 1, 1, 1, 1,
0.838146, 1.879196, -0.8171009, 1, 1, 1, 1, 1,
0.8417409, 0.3800831, -0.2652805, 1, 1, 1, 1, 1,
0.8444372, -0.06211578, 1.141536, 1, 1, 1, 1, 1,
0.8510056, -0.5266212, 2.69624, 1, 1, 1, 1, 1,
0.8535357, 0.001084918, 1.785429, 1, 1, 1, 1, 1,
0.8538154, 0.5331103, 1.55092, 1, 1, 1, 1, 1,
0.8568982, 0.7670646, 1.762609, 1, 1, 1, 1, 1,
0.8572235, 1.400792, 1.943542, 0, 0, 1, 1, 1,
0.8582812, -0.9435205, 1.627313, 1, 0, 0, 1, 1,
0.8607283, 1.460574, 0.4216695, 1, 0, 0, 1, 1,
0.8632247, -0.0128055, 0.8026698, 1, 0, 0, 1, 1,
0.8664705, -0.0327321, 2.034252, 1, 0, 0, 1, 1,
0.8665459, -0.5320007, 1.418311, 1, 0, 0, 1, 1,
0.8735231, -0.3079439, 2.481898, 0, 0, 0, 1, 1,
0.8815749, -0.4906681, 1.914947, 0, 0, 0, 1, 1,
0.8824943, 0.09787385, 0.2621831, 0, 0, 0, 1, 1,
0.8826551, 0.739994, 0.4906796, 0, 0, 0, 1, 1,
0.8842461, -0.4376604, 0.8592201, 0, 0, 0, 1, 1,
0.8893827, 1.807462, 1.066337, 0, 0, 0, 1, 1,
0.8901364, -0.3757832, 2.920862, 0, 0, 0, 1, 1,
0.8941509, -1.653262, 3.148036, 1, 1, 1, 1, 1,
0.8968673, -0.1255799, 1.245286, 1, 1, 1, 1, 1,
0.8974952, -0.3646704, 2.11445, 1, 1, 1, 1, 1,
0.8980843, -0.8433481, 2.243633, 1, 1, 1, 1, 1,
0.8983585, 2.140386, 0.7225617, 1, 1, 1, 1, 1,
0.9025576, 1.782166, 0.27108, 1, 1, 1, 1, 1,
0.9040804, 0.7594489, 1.316028, 1, 1, 1, 1, 1,
0.9043181, 1.579791, -0.5979474, 1, 1, 1, 1, 1,
0.9144523, -2.531618, 2.580198, 1, 1, 1, 1, 1,
0.9203995, -0.1071005, 1.350852, 1, 1, 1, 1, 1,
0.9206142, 0.5936843, 0.08418518, 1, 1, 1, 1, 1,
0.9313116, -1.029245, 2.116273, 1, 1, 1, 1, 1,
0.9313995, -0.01687697, 0.9306532, 1, 1, 1, 1, 1,
0.9382909, 0.5982707, 0.9633153, 1, 1, 1, 1, 1,
0.93899, 0.3807689, 2.489839, 1, 1, 1, 1, 1,
0.951537, 0.7596318, 1.03666, 0, 0, 1, 1, 1,
0.9516857, -0.431013, 1.853361, 1, 0, 0, 1, 1,
0.9521754, 1.294683, -0.2076819, 1, 0, 0, 1, 1,
0.9610634, 1.418289, 1.645666, 1, 0, 0, 1, 1,
0.9642475, -0.6142785, 2.995572, 1, 0, 0, 1, 1,
0.9654028, 0.0607176, 1.152777, 1, 0, 0, 1, 1,
0.9662367, 0.4087829, 3.214196, 0, 0, 0, 1, 1,
0.96777, -2.011492, 2.392379, 0, 0, 0, 1, 1,
0.9685183, 0.8229225, 0.1556845, 0, 0, 0, 1, 1,
0.9790566, 0.8026933, 0.1949357, 0, 0, 0, 1, 1,
0.981112, 0.9808556, 1.272557, 0, 0, 0, 1, 1,
0.9860378, 0.7411021, -0.8318893, 0, 0, 0, 1, 1,
1.004625, -1.678627, 3.636674, 0, 0, 0, 1, 1,
1.011773, 1.029857, 1.454527, 1, 1, 1, 1, 1,
1.014812, 0.14172, 0.243442, 1, 1, 1, 1, 1,
1.015681, -0.6431099, 2.114295, 1, 1, 1, 1, 1,
1.028856, -0.5875377, 1.993031, 1, 1, 1, 1, 1,
1.0329, 0.07323857, 1.118345, 1, 1, 1, 1, 1,
1.0351, -1.239584, 3.019691, 1, 1, 1, 1, 1,
1.036459, -0.3919934, 2.446568, 1, 1, 1, 1, 1,
1.040858, -1.378245, 4.399547, 1, 1, 1, 1, 1,
1.046656, 0.7312563, 0.714353, 1, 1, 1, 1, 1,
1.052649, -2.022517, 3.161228, 1, 1, 1, 1, 1,
1.060163, 0.1903811, 0.2967492, 1, 1, 1, 1, 1,
1.066318, 1.004392, -0.4636786, 1, 1, 1, 1, 1,
1.068189, -0.6427716, 1.805557, 1, 1, 1, 1, 1,
1.071814, -1.262242, 1.797957, 1, 1, 1, 1, 1,
1.073885, 2.028791, 0.8629037, 1, 1, 1, 1, 1,
1.093027, 0.8222545, -0.08012372, 0, 0, 1, 1, 1,
1.095999, 1.082098, -0.7709138, 1, 0, 0, 1, 1,
1.096247, 1.846366, 0.7785398, 1, 0, 0, 1, 1,
1.109994, 1.971107, 1.396092, 1, 0, 0, 1, 1,
1.112965, 0.8593635, 1.527895, 1, 0, 0, 1, 1,
1.124799, -1.126798, 2.889202, 1, 0, 0, 1, 1,
1.125749, 0.3920414, 2.120355, 0, 0, 0, 1, 1,
1.134333, -1.142851, 1.978977, 0, 0, 0, 1, 1,
1.13883, -0.5021428, 1.932711, 0, 0, 0, 1, 1,
1.13937, -0.9046268, 2.294809, 0, 0, 0, 1, 1,
1.146217, 1.049159, 1.385284, 0, 0, 0, 1, 1,
1.152207, 0.032402, 1.37278, 0, 0, 0, 1, 1,
1.156437, 0.4691266, 2.103124, 0, 0, 0, 1, 1,
1.161617, -0.3197482, 2.35944, 1, 1, 1, 1, 1,
1.16405, 1.030987, -0.7647911, 1, 1, 1, 1, 1,
1.165633, 0.9465798, 0.4341686, 1, 1, 1, 1, 1,
1.167604, 1.577158, 0.4966338, 1, 1, 1, 1, 1,
1.17216, 0.5570803, 1.557615, 1, 1, 1, 1, 1,
1.175084, -0.7379548, 1.194652, 1, 1, 1, 1, 1,
1.178385, 0.3134303, 0.942593, 1, 1, 1, 1, 1,
1.178734, 0.685258, 0.005461117, 1, 1, 1, 1, 1,
1.185169, -0.7722778, 3.584118, 1, 1, 1, 1, 1,
1.187002, 0.02206586, 1.707598, 1, 1, 1, 1, 1,
1.191683, -0.1144224, 1.843298, 1, 1, 1, 1, 1,
1.192581, -0.8907811, 2.052262, 1, 1, 1, 1, 1,
1.197893, -0.9473341, 5.743512, 1, 1, 1, 1, 1,
1.200774, 2.189062, -2.06029, 1, 1, 1, 1, 1,
1.203232, 1.558557, 0.4491583, 1, 1, 1, 1, 1,
1.203989, -0.142607, 1.033525, 0, 0, 1, 1, 1,
1.216847, 1.398097, 0.1989525, 1, 0, 0, 1, 1,
1.217904, -0.3199764, 4.386075, 1, 0, 0, 1, 1,
1.224204, -0.4083261, 0.5961385, 1, 0, 0, 1, 1,
1.226834, 1.809553, 0.3435083, 1, 0, 0, 1, 1,
1.228638, 0.3738939, 2.969831, 1, 0, 0, 1, 1,
1.235572, -0.6774935, 1.836771, 0, 0, 0, 1, 1,
1.250707, -0.9837933, 1.961801, 0, 0, 0, 1, 1,
1.253162, -0.7184711, 1.526977, 0, 0, 0, 1, 1,
1.272053, 0.003888092, 1.898916, 0, 0, 0, 1, 1,
1.278665, -0.7562586, 2.901035, 0, 0, 0, 1, 1,
1.288778, -0.4157794, 1.938465, 0, 0, 0, 1, 1,
1.297162, -1.118955, 0.9751778, 0, 0, 0, 1, 1,
1.300907, -2.31031, 1.225412, 1, 1, 1, 1, 1,
1.301677, -0.6912562, 2.126625, 1, 1, 1, 1, 1,
1.301828, 2.969231, -0.9177244, 1, 1, 1, 1, 1,
1.302586, -0.8097097, 1.742324, 1, 1, 1, 1, 1,
1.306465, 0.1384545, 0.8731824, 1, 1, 1, 1, 1,
1.308873, 0.7656001, 2.044832, 1, 1, 1, 1, 1,
1.31014, 1.36261, -0.4380528, 1, 1, 1, 1, 1,
1.328527, 0.5310334, 1.668952, 1, 1, 1, 1, 1,
1.329452, -0.4273645, 1.552679, 1, 1, 1, 1, 1,
1.329777, 1.097238, -0.2038084, 1, 1, 1, 1, 1,
1.339281, -1.041095, 0.9616921, 1, 1, 1, 1, 1,
1.342332, -0.1189904, 3.052845, 1, 1, 1, 1, 1,
1.343291, 0.3078774, 1.715428, 1, 1, 1, 1, 1,
1.343884, -0.6092573, 1.531403, 1, 1, 1, 1, 1,
1.359112, -0.918974, 0.9797069, 1, 1, 1, 1, 1,
1.394872, 0.4320624, 1.992124, 0, 0, 1, 1, 1,
1.40397, 0.3936382, 3.546101, 1, 0, 0, 1, 1,
1.408524, 0.1131422, 1.42647, 1, 0, 0, 1, 1,
1.408676, -1.066411, 3.352247, 1, 0, 0, 1, 1,
1.410446, 0.7766109, 0.8760192, 1, 0, 0, 1, 1,
1.419778, -0.5677505, 0.6803008, 1, 0, 0, 1, 1,
1.422022, 0.8716028, 0.9075363, 0, 0, 0, 1, 1,
1.423985, -0.3841767, 0.5808045, 0, 0, 0, 1, 1,
1.426509, 0.1721184, 1.583858, 0, 0, 0, 1, 1,
1.463691, 0.2643926, 0.7527531, 0, 0, 0, 1, 1,
1.464854, 0.4945401, 1.503412, 0, 0, 0, 1, 1,
1.467781, 0.5880181, 3.279583, 0, 0, 0, 1, 1,
1.471646, 1.081671, 1.681107, 0, 0, 0, 1, 1,
1.474119, 1.016859, 1.468645, 1, 1, 1, 1, 1,
1.49198, 1.167037, 2.149557, 1, 1, 1, 1, 1,
1.495884, 0.4697683, 1.073689, 1, 1, 1, 1, 1,
1.505383, 0.2608244, 2.097119, 1, 1, 1, 1, 1,
1.513289, 0.9728038, -0.5762525, 1, 1, 1, 1, 1,
1.513629, 1.07778, 2.765062, 1, 1, 1, 1, 1,
1.515134, 1.211466, 0.03871713, 1, 1, 1, 1, 1,
1.516842, -0.9554279, 1.811493, 1, 1, 1, 1, 1,
1.519209, 0.241392, 0.7456154, 1, 1, 1, 1, 1,
1.534312, -0.7540803, 2.645233, 1, 1, 1, 1, 1,
1.535956, 0.7186465, 3.17225, 1, 1, 1, 1, 1,
1.544275, 0.1844192, 2.632904, 1, 1, 1, 1, 1,
1.561576, -0.1512442, 0.5304402, 1, 1, 1, 1, 1,
1.562434, 1.419857, 1.656181, 1, 1, 1, 1, 1,
1.581809, 0.4764736, 0.2791952, 1, 1, 1, 1, 1,
1.590145, -1.260589, 1.39256, 0, 0, 1, 1, 1,
1.591242, 0.7050381, 1.006687, 1, 0, 0, 1, 1,
1.600147, -1.502504, 2.257358, 1, 0, 0, 1, 1,
1.635652, 0.143751, 0.6406174, 1, 0, 0, 1, 1,
1.638225, 1.481814, -1.03557, 1, 0, 0, 1, 1,
1.643316, -1.181587, 1.456442, 1, 0, 0, 1, 1,
1.654612, -0.3010178, 2.367133, 0, 0, 0, 1, 1,
1.665507, -1.310819, 3.272679, 0, 0, 0, 1, 1,
1.687134, -0.6169314, 0.7164517, 0, 0, 0, 1, 1,
1.701031, -0.2987111, 1.86375, 0, 0, 0, 1, 1,
1.719965, 0.8210015, 0.4503411, 0, 0, 0, 1, 1,
1.72666, -1.440566, 1.534614, 0, 0, 0, 1, 1,
1.735593, 0.09500023, 0.6770229, 0, 0, 0, 1, 1,
1.742882, -0.3379015, 2.18945, 1, 1, 1, 1, 1,
1.751819, 0.7840744, 1.35284, 1, 1, 1, 1, 1,
1.75305, 2.178132, 0.5109531, 1, 1, 1, 1, 1,
1.759533, 2.366575, 0.5906607, 1, 1, 1, 1, 1,
1.78619, -0.9668311, 1.560674, 1, 1, 1, 1, 1,
1.813456, 0.299552, 1.362798, 1, 1, 1, 1, 1,
1.815584, 2.66, 0.4030366, 1, 1, 1, 1, 1,
1.816306, 0.9062912, 0.9911693, 1, 1, 1, 1, 1,
1.822512, 0.1418599, 1.058248, 1, 1, 1, 1, 1,
1.849416, 1.247679, 1.871714, 1, 1, 1, 1, 1,
1.852125, -0.2270742, 1.37725, 1, 1, 1, 1, 1,
1.853549, -0.8076459, 1.680646, 1, 1, 1, 1, 1,
1.868338, 1.443704, 1.742889, 1, 1, 1, 1, 1,
1.876043, -0.676626, 1.868004, 1, 1, 1, 1, 1,
1.882946, -0.6043217, 1.898965, 1, 1, 1, 1, 1,
1.885558, -1.186985, 0.295889, 0, 0, 1, 1, 1,
1.886069, 0.05636609, 2.862214, 1, 0, 0, 1, 1,
1.913731, 0.2528424, 2.675645, 1, 0, 0, 1, 1,
1.918681, -0.9635962, 2.493785, 1, 0, 0, 1, 1,
1.940268, -1.453548, 2.451907, 1, 0, 0, 1, 1,
1.969378, 1.345679, 0.2382015, 1, 0, 0, 1, 1,
2.051819, 0.6193901, -0.3477678, 0, 0, 0, 1, 1,
2.089972, -0.4087947, 0.9819812, 0, 0, 0, 1, 1,
2.1438, -1.456182, 3.13155, 0, 0, 0, 1, 1,
2.203305, 1.008598, 0.1606564, 0, 0, 0, 1, 1,
2.206879, -1.376688, 2.741901, 0, 0, 0, 1, 1,
2.359651, -0.910278, 2.673172, 0, 0, 0, 1, 1,
2.443085, 0.2059763, 2.800019, 0, 0, 0, 1, 1,
2.516541, 0.6563444, 3.13189, 1, 1, 1, 1, 1,
2.56869, -0.2683385, 1.589176, 1, 1, 1, 1, 1,
2.570207, -0.3689438, 1.606008, 1, 1, 1, 1, 1,
2.801307, -0.6552638, 0.9354669, 1, 1, 1, 1, 1,
2.949368, -0.3516082, 0.3560138, 1, 1, 1, 1, 1,
3.111185, -0.9880219, 0.6305262, 1, 1, 1, 1, 1,
3.173421, -0.1479542, 2.082672, 1, 1, 1, 1, 1
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
var radius = 9.637272;
var distance = 33.85051;
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
mvMatrix.translate( -0.1128073, 0.1795864, -0.3191261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.85051);
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
