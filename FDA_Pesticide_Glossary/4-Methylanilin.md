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
-3.361838, -0.2784423, -0.08382798, 1, 0, 0, 1,
-3.204501, -0.3703856, -3.319912, 1, 0.007843138, 0, 1,
-3.191165, 0.3399105, -1.171711, 1, 0.01176471, 0, 1,
-2.938755, 0.8061491, -2.901118, 1, 0.01960784, 0, 1,
-2.61207, -0.9188358, -1.604028, 1, 0.02352941, 0, 1,
-2.595095, -0.9875491, -2.775783, 1, 0.03137255, 0, 1,
-2.576933, 0.1303921, -0.5658475, 1, 0.03529412, 0, 1,
-2.570382, -1.607966, -0.3221468, 1, 0.04313726, 0, 1,
-2.468338, 0.2949988, -1.45902, 1, 0.04705882, 0, 1,
-2.464677, -0.8502122, -0.9121999, 1, 0.05490196, 0, 1,
-2.45702, -0.1083229, -2.508946, 1, 0.05882353, 0, 1,
-2.435735, 0.2444711, -1.410645, 1, 0.06666667, 0, 1,
-2.35958, -0.08935783, -2.898108, 1, 0.07058824, 0, 1,
-2.349733, 0.6288205, -1.728009, 1, 0.07843138, 0, 1,
-2.315765, 1.156166, -2.609253, 1, 0.08235294, 0, 1,
-2.305358, -0.6813395, -1.645953, 1, 0.09019608, 0, 1,
-2.265574, 0.0818039, -1.091634, 1, 0.09411765, 0, 1,
-2.070603, 1.066619, -1.470002, 1, 0.1019608, 0, 1,
-2.055236, -0.2732852, -1.044496, 1, 0.1098039, 0, 1,
-2.016341, 2.473867, -0.5663515, 1, 0.1137255, 0, 1,
-2.014646, 1.036439, -0.8645802, 1, 0.1215686, 0, 1,
-1.979036, 0.2694999, -0.869509, 1, 0.1254902, 0, 1,
-1.969936, 0.6969703, 0.3059432, 1, 0.1333333, 0, 1,
-1.961183, -0.2691163, -2.606504, 1, 0.1372549, 0, 1,
-1.949749, -1.313698, -2.620064, 1, 0.145098, 0, 1,
-1.943062, -0.03791163, -0.6456794, 1, 0.1490196, 0, 1,
-1.942762, 0.5106182, -0.7350552, 1, 0.1568628, 0, 1,
-1.923011, -0.007747511, -1.104686, 1, 0.1607843, 0, 1,
-1.906369, 0.9112682, -0.2930346, 1, 0.1686275, 0, 1,
-1.899086, -1.120234, -2.194719, 1, 0.172549, 0, 1,
-1.88, 1.629677, -0.01541708, 1, 0.1803922, 0, 1,
-1.864922, -1.497851, -2.264162, 1, 0.1843137, 0, 1,
-1.85672, 1.504435, -1.257645, 1, 0.1921569, 0, 1,
-1.838455, -0.3429506, -3.668618, 1, 0.1960784, 0, 1,
-1.834021, -0.01593277, -1.809144, 1, 0.2039216, 0, 1,
-1.813754, 1.787279, -1.345748, 1, 0.2117647, 0, 1,
-1.81084, 0.04027304, -1.721242, 1, 0.2156863, 0, 1,
-1.809561, 0.1827179, -1.799744, 1, 0.2235294, 0, 1,
-1.788511, 2.086152, -0.8714752, 1, 0.227451, 0, 1,
-1.77944, -1.008037, -1.953678, 1, 0.2352941, 0, 1,
-1.778347, 2.041094, -2.34628, 1, 0.2392157, 0, 1,
-1.76876, 0.2098911, -2.576854, 1, 0.2470588, 0, 1,
-1.766765, 0.05804802, -1.389556, 1, 0.2509804, 0, 1,
-1.749001, -0.8268771, -2.83013, 1, 0.2588235, 0, 1,
-1.734747, -0.798986, -1.016508, 1, 0.2627451, 0, 1,
-1.730196, 0.3625521, -1.511191, 1, 0.2705882, 0, 1,
-1.721244, -0.474351, -1.363486, 1, 0.2745098, 0, 1,
-1.707279, -1.455899, -1.919464, 1, 0.282353, 0, 1,
-1.705631, -1.379495, -1.139413, 1, 0.2862745, 0, 1,
-1.703118, -0.7510784, -1.233181, 1, 0.2941177, 0, 1,
-1.696527, -2.298379, -1.759822, 1, 0.3019608, 0, 1,
-1.690756, 1.162902, -1.047849, 1, 0.3058824, 0, 1,
-1.681579, -0.03631195, -1.930251, 1, 0.3137255, 0, 1,
-1.676563, -0.5820671, -4.033859, 1, 0.3176471, 0, 1,
-1.674893, -0.5086775, -2.860577, 1, 0.3254902, 0, 1,
-1.667419, -0.6362957, -2.384245, 1, 0.3294118, 0, 1,
-1.665022, -2.269458, -2.803562, 1, 0.3372549, 0, 1,
-1.646958, -0.9480687, -1.568128, 1, 0.3411765, 0, 1,
-1.646114, 0.5785742, 0.001948665, 1, 0.3490196, 0, 1,
-1.613198, -1.042425, -1.499256, 1, 0.3529412, 0, 1,
-1.604327, 0.09294705, -1.741244, 1, 0.3607843, 0, 1,
-1.579629, -0.1034746, 0.5282469, 1, 0.3647059, 0, 1,
-1.575512, 0.8860077, 0.9950581, 1, 0.372549, 0, 1,
-1.568324, 1.518025, -1.768107, 1, 0.3764706, 0, 1,
-1.552266, 0.6101044, -0.9768517, 1, 0.3843137, 0, 1,
-1.543619, -0.04767873, -2.585269, 1, 0.3882353, 0, 1,
-1.542777, 0.5221529, -0.260429, 1, 0.3960784, 0, 1,
-1.537931, -0.5702863, -2.946058, 1, 0.4039216, 0, 1,
-1.528593, -0.115272, -2.354779, 1, 0.4078431, 0, 1,
-1.528084, -1.349845, -3.192876, 1, 0.4156863, 0, 1,
-1.523685, 0.3146457, -0.7191011, 1, 0.4196078, 0, 1,
-1.517379, -0.3361717, -2.791537, 1, 0.427451, 0, 1,
-1.513375, 0.3815126, -1.60162, 1, 0.4313726, 0, 1,
-1.507422, -0.8170418, -1.002153, 1, 0.4392157, 0, 1,
-1.493495, -0.7011052, -2.323485, 1, 0.4431373, 0, 1,
-1.486067, -0.2799025, -2.950457, 1, 0.4509804, 0, 1,
-1.475303, -0.5880055, -3.628376, 1, 0.454902, 0, 1,
-1.471146, -0.07239614, -1.056319, 1, 0.4627451, 0, 1,
-1.463061, 0.1293, -1.21454, 1, 0.4666667, 0, 1,
-1.452154, -0.9786839, -1.180832, 1, 0.4745098, 0, 1,
-1.447496, -0.6338949, -2.007269, 1, 0.4784314, 0, 1,
-1.441332, -2.329345, -1.05076, 1, 0.4862745, 0, 1,
-1.439904, -0.09341805, -1.803223, 1, 0.4901961, 0, 1,
-1.415024, -0.8248883, -1.43508, 1, 0.4980392, 0, 1,
-1.407062, -1.679546, -3.424582, 1, 0.5058824, 0, 1,
-1.403299, 0.1392933, -2.157371, 1, 0.509804, 0, 1,
-1.395144, -0.4802176, -2.836651, 1, 0.5176471, 0, 1,
-1.387207, -1.023308, -2.889169, 1, 0.5215687, 0, 1,
-1.372727, 1.242635, -1.995372, 1, 0.5294118, 0, 1,
-1.365558, -0.3785522, -0.8070805, 1, 0.5333334, 0, 1,
-1.360366, 0.0532145, -1.633829, 1, 0.5411765, 0, 1,
-1.349836, -0.04340519, -1.393873, 1, 0.5450981, 0, 1,
-1.345705, -0.8474046, -2.47516, 1, 0.5529412, 0, 1,
-1.343888, -0.6592142, -3.378025, 1, 0.5568628, 0, 1,
-1.32992, 0.01081072, -3.721973, 1, 0.5647059, 0, 1,
-1.324548, -1.83814, -2.149855, 1, 0.5686275, 0, 1,
-1.315607, 0.4985028, -0.9852425, 1, 0.5764706, 0, 1,
-1.310477, -0.925998, -1.792957, 1, 0.5803922, 0, 1,
-1.310403, -0.02624756, -2.215122, 1, 0.5882353, 0, 1,
-1.30739, -0.9959118, -3.011838, 1, 0.5921569, 0, 1,
-1.303733, 0.6157275, -2.188249, 1, 0.6, 0, 1,
-1.300608, -0.9194589, -2.239317, 1, 0.6078432, 0, 1,
-1.298961, 0.9740875, -1.915671, 1, 0.6117647, 0, 1,
-1.295844, 1.219576, -1.040224, 1, 0.6196079, 0, 1,
-1.294894, 1.093252, -1.707832, 1, 0.6235294, 0, 1,
-1.2908, -0.3831037, -1.335333, 1, 0.6313726, 0, 1,
-1.258345, -0.08054215, -1.735386, 1, 0.6352941, 0, 1,
-1.252805, 0.8089821, -2.921591, 1, 0.6431373, 0, 1,
-1.242781, 1.835828, -1.216807, 1, 0.6470588, 0, 1,
-1.239596, -0.4755687, -1.511698, 1, 0.654902, 0, 1,
-1.237668, 0.6964909, -0.193239, 1, 0.6588235, 0, 1,
-1.237436, 0.02830455, -1.264119, 1, 0.6666667, 0, 1,
-1.23112, -0.6016701, 0.2036714, 1, 0.6705883, 0, 1,
-1.227862, -0.04522616, -0.3927819, 1, 0.6784314, 0, 1,
-1.223092, -0.6645244, -0.9890777, 1, 0.682353, 0, 1,
-1.219389, 0.5029991, -1.886295, 1, 0.6901961, 0, 1,
-1.218581, 0.4618454, -1.55823, 1, 0.6941177, 0, 1,
-1.193861, 0.8313775, 0.1866962, 1, 0.7019608, 0, 1,
-1.189989, 0.2948573, -3.24369, 1, 0.7098039, 0, 1,
-1.18802, 0.3473421, -0.3216855, 1, 0.7137255, 0, 1,
-1.183187, 0.7476303, -1.728058, 1, 0.7215686, 0, 1,
-1.178272, 0.2601853, -0.4262254, 1, 0.7254902, 0, 1,
-1.178172, 0.09680448, -2.354562, 1, 0.7333333, 0, 1,
-1.172647, -0.4641864, -3.585191, 1, 0.7372549, 0, 1,
-1.15224, -1.660993, -1.233529, 1, 0.7450981, 0, 1,
-1.14737, 0.7503982, -0.5691302, 1, 0.7490196, 0, 1,
-1.146658, -1.637318, -2.152174, 1, 0.7568628, 0, 1,
-1.144662, 2.012511, -0.9156751, 1, 0.7607843, 0, 1,
-1.128432, 1.930054, -0.1653885, 1, 0.7686275, 0, 1,
-1.118071, 1.64322, -1.566058, 1, 0.772549, 0, 1,
-1.11058, -0.4600459, -3.501305, 1, 0.7803922, 0, 1,
-1.109316, 0.3586838, 0.3798056, 1, 0.7843137, 0, 1,
-1.101548, 0.0889148, -1.400932, 1, 0.7921569, 0, 1,
-1.086187, -1.145302, -1.957354, 1, 0.7960784, 0, 1,
-1.08043, -0.108284, -0.6395875, 1, 0.8039216, 0, 1,
-1.080139, 1.539272, 2.803912, 1, 0.8117647, 0, 1,
-1.078957, -0.3643321, -0.3064992, 1, 0.8156863, 0, 1,
-1.078203, -1.467474, -1.076755, 1, 0.8235294, 0, 1,
-1.077122, -0.5271848, -1.628045, 1, 0.827451, 0, 1,
-1.076303, 0.1713643, -0.3929519, 1, 0.8352941, 0, 1,
-1.071632, -1.975098, -1.644467, 1, 0.8392157, 0, 1,
-1.068208, 1.447885, -1.062589, 1, 0.8470588, 0, 1,
-1.066239, 0.5336387, -0.7368626, 1, 0.8509804, 0, 1,
-1.06076, -0.2343913, -1.996522, 1, 0.8588235, 0, 1,
-1.056074, -1.091608, -3.706824, 1, 0.8627451, 0, 1,
-1.053592, 0.405091, -1.162643, 1, 0.8705882, 0, 1,
-1.053235, 0.7291318, -1.473328, 1, 0.8745098, 0, 1,
-1.051665, 0.2899246, -1.735461, 1, 0.8823529, 0, 1,
-1.049046, 0.1470869, -1.843249, 1, 0.8862745, 0, 1,
-1.045466, 1.029155, -0.150088, 1, 0.8941177, 0, 1,
-1.043237, -2.27388, -4.624693, 1, 0.8980392, 0, 1,
-1.038593, -1.062788, -1.336313, 1, 0.9058824, 0, 1,
-1.035388, -1.038589, -0.5967698, 1, 0.9137255, 0, 1,
-1.034226, 0.2063059, -0.5768524, 1, 0.9176471, 0, 1,
-1.030784, -0.2595345, -1.033939, 1, 0.9254902, 0, 1,
-1.027383, 0.2917517, -0.491998, 1, 0.9294118, 0, 1,
-1.023878, 1.688787, 0.3359804, 1, 0.9372549, 0, 1,
-1.017077, 1.457731, -1.335321, 1, 0.9411765, 0, 1,
-1.017014, -0.1620543, -2.633836, 1, 0.9490196, 0, 1,
-1.015887, -0.04224848, -1.767742, 1, 0.9529412, 0, 1,
-1.009894, 1.060399, -0.1335056, 1, 0.9607843, 0, 1,
-1.008935, -0.8245451, -1.733468, 1, 0.9647059, 0, 1,
-1.008441, 1.399994, -1.435467, 1, 0.972549, 0, 1,
-1.003466, 0.6802216, -2.599004, 1, 0.9764706, 0, 1,
-1.00321, 1.74872, -1.406839, 1, 0.9843137, 0, 1,
-1.00178, -0.03828578, -0.02075509, 1, 0.9882353, 0, 1,
-1.001086, 1.828797, -1.114718, 1, 0.9960784, 0, 1,
-0.9930555, -1.12318, -3.385546, 0.9960784, 1, 0, 1,
-0.9905471, 2.173443, 0.7693124, 0.9921569, 1, 0, 1,
-0.985401, -1.869519, -1.880632, 0.9843137, 1, 0, 1,
-0.9853595, -0.6025059, -2.98311, 0.9803922, 1, 0, 1,
-0.984091, 1.947291, -1.243361, 0.972549, 1, 0, 1,
-0.979328, -0.8709944, 1.397805, 0.9686275, 1, 0, 1,
-0.9699759, -0.4614767, -3.481493, 0.9607843, 1, 0, 1,
-0.9649311, -1.525563, -3.649053, 0.9568627, 1, 0, 1,
-0.9614055, 1.748911, -0.1155209, 0.9490196, 1, 0, 1,
-0.9573601, 0.5165148, -1.89013, 0.945098, 1, 0, 1,
-0.9564334, -0.4343139, -1.909134, 0.9372549, 1, 0, 1,
-0.9420375, -1.14617, -2.411355, 0.9333333, 1, 0, 1,
-0.9391935, 0.2704829, -1.346655, 0.9254902, 1, 0, 1,
-0.9388801, -2.425197, -1.076472, 0.9215686, 1, 0, 1,
-0.9377158, 1.657177, -0.03029016, 0.9137255, 1, 0, 1,
-0.9259484, 0.974529, -2.555192, 0.9098039, 1, 0, 1,
-0.9226275, -0.9537587, -1.90469, 0.9019608, 1, 0, 1,
-0.919229, -1.38975, -3.384506, 0.8941177, 1, 0, 1,
-0.9172885, 0.8960041, -2.360461, 0.8901961, 1, 0, 1,
-0.9150821, 0.2323173, -0.112853, 0.8823529, 1, 0, 1,
-0.9118637, 1.544967, -0.7962204, 0.8784314, 1, 0, 1,
-0.9107622, -0.6903797, -1.053187, 0.8705882, 1, 0, 1,
-0.910706, -0.07765316, -1.063747, 0.8666667, 1, 0, 1,
-0.9079766, -0.09690367, -1.025764, 0.8588235, 1, 0, 1,
-0.9079673, 0.9010928, -1.728764, 0.854902, 1, 0, 1,
-0.9018993, -0.2904299, -3.210526, 0.8470588, 1, 0, 1,
-0.8942056, 0.08455504, -1.308731, 0.8431373, 1, 0, 1,
-0.8898381, 1.031655, 0.1008419, 0.8352941, 1, 0, 1,
-0.885037, -0.05688448, -0.2714187, 0.8313726, 1, 0, 1,
-0.8802726, 0.6304745, -0.7101024, 0.8235294, 1, 0, 1,
-0.8790401, 0.1953088, -1.494506, 0.8196079, 1, 0, 1,
-0.8783283, 0.7351641, -0.03024025, 0.8117647, 1, 0, 1,
-0.8748593, -1.166187, -2.668575, 0.8078431, 1, 0, 1,
-0.8739856, 0.60704, -1.639383, 0.8, 1, 0, 1,
-0.8722208, 0.5226598, -0.5587165, 0.7921569, 1, 0, 1,
-0.871331, 1.845793, -0.1622318, 0.7882353, 1, 0, 1,
-0.8690856, -0.4683882, -3.59833, 0.7803922, 1, 0, 1,
-0.8671443, 0.5708184, -1.851382, 0.7764706, 1, 0, 1,
-0.8554572, 0.2830008, 0.8451164, 0.7686275, 1, 0, 1,
-0.8530153, 0.3412795, -1.70832, 0.7647059, 1, 0, 1,
-0.8511167, 0.1611383, -0.3067277, 0.7568628, 1, 0, 1,
-0.8413674, -1.367804, -1.135524, 0.7529412, 1, 0, 1,
-0.8412836, -0.8571601, -1.765872, 0.7450981, 1, 0, 1,
-0.8367007, 0.2519529, -2.248005, 0.7411765, 1, 0, 1,
-0.8298646, 0.3653332, 0.7792704, 0.7333333, 1, 0, 1,
-0.8213648, -1.834067, -3.192686, 0.7294118, 1, 0, 1,
-0.8185707, -0.8400204, -3.883422, 0.7215686, 1, 0, 1,
-0.8165283, -1.208926, -2.231881, 0.7176471, 1, 0, 1,
-0.8133914, 1.918372, -1.61323, 0.7098039, 1, 0, 1,
-0.813351, -0.3149336, -1.984836, 0.7058824, 1, 0, 1,
-0.8055534, -1.232556, -2.231226, 0.6980392, 1, 0, 1,
-0.8046173, 0.1177503, -0.8374736, 0.6901961, 1, 0, 1,
-0.8025888, -1.83081, -3.683531, 0.6862745, 1, 0, 1,
-0.7951773, 0.4363658, -1.859072, 0.6784314, 1, 0, 1,
-0.791199, 1.442407, 0.5078172, 0.6745098, 1, 0, 1,
-0.790579, -1.349867, -2.269286, 0.6666667, 1, 0, 1,
-0.7864964, 0.6840851, 0.1283486, 0.6627451, 1, 0, 1,
-0.7834471, -0.4454121, -0.8387944, 0.654902, 1, 0, 1,
-0.7809642, 1.469037, -0.8632683, 0.6509804, 1, 0, 1,
-0.7755359, -1.062312, -4.975626, 0.6431373, 1, 0, 1,
-0.7749484, -1.176827, -3.134239, 0.6392157, 1, 0, 1,
-0.7709346, -1.877067, -3.222078, 0.6313726, 1, 0, 1,
-0.7707448, 0.09170809, -1.377019, 0.627451, 1, 0, 1,
-0.7701029, 0.04487325, -2.18167, 0.6196079, 1, 0, 1,
-0.7696924, 0.03880543, -0.4340472, 0.6156863, 1, 0, 1,
-0.7695404, 1.504807, -1.068339, 0.6078432, 1, 0, 1,
-0.7669914, 2.265649, -0.05688898, 0.6039216, 1, 0, 1,
-0.7664778, 0.2730775, -0.1539476, 0.5960785, 1, 0, 1,
-0.7663487, 0.4791534, -0.09750161, 0.5882353, 1, 0, 1,
-0.7569246, 1.497414, -0.08695343, 0.5843138, 1, 0, 1,
-0.7509615, 1.697839, 0.5033736, 0.5764706, 1, 0, 1,
-0.7501715, -0.1468437, -2.887145, 0.572549, 1, 0, 1,
-0.7475357, -1.484806, -3.934701, 0.5647059, 1, 0, 1,
-0.7427129, 0.4466958, -2.255308, 0.5607843, 1, 0, 1,
-0.7314283, -0.316851, -0.9141686, 0.5529412, 1, 0, 1,
-0.7190221, -0.8164608, -3.604783, 0.5490196, 1, 0, 1,
-0.7149256, 0.5338099, -2.199921, 0.5411765, 1, 0, 1,
-0.7131962, -0.1889684, -2.766087, 0.5372549, 1, 0, 1,
-0.7015793, 0.3120544, 0.0657518, 0.5294118, 1, 0, 1,
-0.6985867, 0.5797117, -0.2585739, 0.5254902, 1, 0, 1,
-0.6916077, 0.1411547, -1.060296, 0.5176471, 1, 0, 1,
-0.6875254, 0.6558894, 0.7942063, 0.5137255, 1, 0, 1,
-0.6862047, -0.1745017, -2.095238, 0.5058824, 1, 0, 1,
-0.6815336, -1.331223, -2.267993, 0.5019608, 1, 0, 1,
-0.6791207, -1.20236, -2.481106, 0.4941176, 1, 0, 1,
-0.6777969, -0.6233251, -1.576066, 0.4862745, 1, 0, 1,
-0.6776773, -1.472534, -4.72532, 0.4823529, 1, 0, 1,
-0.6757049, 0.2696444, -2.956281, 0.4745098, 1, 0, 1,
-0.6748545, -0.7890516, -2.158358, 0.4705882, 1, 0, 1,
-0.6661456, -0.385211, -1.537871, 0.4627451, 1, 0, 1,
-0.6660278, 1.400554, -0.1171186, 0.4588235, 1, 0, 1,
-0.6629161, -1.288212, -1.419914, 0.4509804, 1, 0, 1,
-0.6602496, 0.5610804, 0.3210103, 0.4470588, 1, 0, 1,
-0.6589348, 0.648243, -1.942371, 0.4392157, 1, 0, 1,
-0.6585166, -0.2988323, -4.359335, 0.4352941, 1, 0, 1,
-0.6584808, 0.5972175, -1.985521, 0.427451, 1, 0, 1,
-0.6580557, -0.6961837, -2.366202, 0.4235294, 1, 0, 1,
-0.6550565, 1.631424, 1.370875, 0.4156863, 1, 0, 1,
-0.6537597, -0.1709304, -2.346419, 0.4117647, 1, 0, 1,
-0.6534223, -0.4801364, 0.3768255, 0.4039216, 1, 0, 1,
-0.6490837, 1.643878, 0.2041376, 0.3960784, 1, 0, 1,
-0.637395, 0.341247, -2.107053, 0.3921569, 1, 0, 1,
-0.6367675, 0.5733052, -0.03580238, 0.3843137, 1, 0, 1,
-0.6335722, 1.963503, -1.199418, 0.3803922, 1, 0, 1,
-0.6321069, 1.297684, -0.1721004, 0.372549, 1, 0, 1,
-0.6231611, 0.8088048, 0.810529, 0.3686275, 1, 0, 1,
-0.6164544, -0.244866, -0.6585606, 0.3607843, 1, 0, 1,
-0.6141575, 0.9775727, 0.01670679, 0.3568628, 1, 0, 1,
-0.6138145, 2.643584, -0.3274221, 0.3490196, 1, 0, 1,
-0.6110243, 0.1964872, -0.7070158, 0.345098, 1, 0, 1,
-0.6098757, -0.8124893, -4.306439, 0.3372549, 1, 0, 1,
-0.6094112, -1.326777, -1.483865, 0.3333333, 1, 0, 1,
-0.6028363, 0.1234564, -3.910305, 0.3254902, 1, 0, 1,
-0.6018459, -0.1449208, -0.5085097, 0.3215686, 1, 0, 1,
-0.5967001, -0.06574874, -3.127924, 0.3137255, 1, 0, 1,
-0.595008, -0.9302123, -2.296369, 0.3098039, 1, 0, 1,
-0.5926337, 0.2577985, -1.160081, 0.3019608, 1, 0, 1,
-0.5904434, 0.3149312, 0.9830046, 0.2941177, 1, 0, 1,
-0.579199, 0.1408872, -1.23395, 0.2901961, 1, 0, 1,
-0.5768993, 0.2597873, -1.430285, 0.282353, 1, 0, 1,
-0.5758458, -1.225673, -2.29314, 0.2784314, 1, 0, 1,
-0.5692366, 0.3091972, -0.6441078, 0.2705882, 1, 0, 1,
-0.5635685, 0.3849392, 0.5630149, 0.2666667, 1, 0, 1,
-0.5598853, -1.621944, -4.438255, 0.2588235, 1, 0, 1,
-0.5582821, -0.531035, -2.409145, 0.254902, 1, 0, 1,
-0.5577047, 0.843549, -1.065197, 0.2470588, 1, 0, 1,
-0.5469041, 1.004099, 0.8316925, 0.2431373, 1, 0, 1,
-0.5394895, -1.010115, -3.172371, 0.2352941, 1, 0, 1,
-0.5336292, 0.3601983, -0.9933863, 0.2313726, 1, 0, 1,
-0.5330897, 0.3239665, -2.043789, 0.2235294, 1, 0, 1,
-0.5319085, -0.1167956, -2.307334, 0.2196078, 1, 0, 1,
-0.530971, 0.3034591, -0.2556497, 0.2117647, 1, 0, 1,
-0.529944, -0.8067875, -2.899344, 0.2078431, 1, 0, 1,
-0.5293479, -1.181509, -1.785744, 0.2, 1, 0, 1,
-0.5201719, -0.6506858, -1.848583, 0.1921569, 1, 0, 1,
-0.5177901, -0.9757757, -1.42856, 0.1882353, 1, 0, 1,
-0.5175676, 0.8081143, -0.08672404, 0.1803922, 1, 0, 1,
-0.5163224, 0.185468, 0.5113412, 0.1764706, 1, 0, 1,
-0.5144567, 0.4841262, -2.3313, 0.1686275, 1, 0, 1,
-0.5117565, 0.6461698, -0.7859005, 0.1647059, 1, 0, 1,
-0.5066208, 0.6190937, -1.206729, 0.1568628, 1, 0, 1,
-0.5063968, 0.1977224, -0.008242688, 0.1529412, 1, 0, 1,
-0.502117, 1.352244, -1.07163, 0.145098, 1, 0, 1,
-0.4972761, 2.237405, 0.4648528, 0.1411765, 1, 0, 1,
-0.4966083, 0.8106485, -0.9956854, 0.1333333, 1, 0, 1,
-0.4963459, 1.687504, -0.3026613, 0.1294118, 1, 0, 1,
-0.4958569, 1.741571, -1.048832, 0.1215686, 1, 0, 1,
-0.4955806, -1.365344, -3.007186, 0.1176471, 1, 0, 1,
-0.491313, 1.085498, -2.19322, 0.1098039, 1, 0, 1,
-0.4822879, -0.7721511, -1.501034, 0.1058824, 1, 0, 1,
-0.4777525, 1.013424, -2.170451, 0.09803922, 1, 0, 1,
-0.4769911, -0.2511426, -0.5080377, 0.09019608, 1, 0, 1,
-0.4744819, -0.0231953, -0.6659998, 0.08627451, 1, 0, 1,
-0.4735381, 0.2860267, -1.200871, 0.07843138, 1, 0, 1,
-0.4725763, -0.3591612, -1.85742, 0.07450981, 1, 0, 1,
-0.4676396, -0.4022965, -2.93291, 0.06666667, 1, 0, 1,
-0.4671564, 0.8032734, -1.090755, 0.0627451, 1, 0, 1,
-0.4665051, 0.4531038, -0.339834, 0.05490196, 1, 0, 1,
-0.4635418, 1.313002, -0.5454772, 0.05098039, 1, 0, 1,
-0.4634177, -0.2089604, -1.108472, 0.04313726, 1, 0, 1,
-0.4627023, -0.7785661, -0.3556401, 0.03921569, 1, 0, 1,
-0.4626685, 0.7763798, -0.5097258, 0.03137255, 1, 0, 1,
-0.4616098, -0.5369074, -1.842904, 0.02745098, 1, 0, 1,
-0.4528815, 0.310091, -2.085938, 0.01960784, 1, 0, 1,
-0.44988, -0.965476, -2.35225, 0.01568628, 1, 0, 1,
-0.4488955, 0.4814151, 0.1614082, 0.007843138, 1, 0, 1,
-0.4464964, -0.2943807, -3.459773, 0.003921569, 1, 0, 1,
-0.4446985, -1.974017, -2.421261, 0, 1, 0.003921569, 1,
-0.4374352, 1.239264, 0.4573847, 0, 1, 0.01176471, 1,
-0.4329376, 0.6805561, -0.2168033, 0, 1, 0.01568628, 1,
-0.4281721, 0.2133435, -2.298847, 0, 1, 0.02352941, 1,
-0.4263477, 2.702349, 0.7383921, 0, 1, 0.02745098, 1,
-0.4234206, 0.55138, -0.8991261, 0, 1, 0.03529412, 1,
-0.4209265, 0.6135085, -0.45216, 0, 1, 0.03921569, 1,
-0.4179718, 0.380536, -2.235639, 0, 1, 0.04705882, 1,
-0.4128266, -1.198533, -3.426089, 0, 1, 0.05098039, 1,
-0.4126101, 0.6866849, -0.4044471, 0, 1, 0.05882353, 1,
-0.4089783, -0.3189251, -1.246565, 0, 1, 0.0627451, 1,
-0.4053997, 0.680742, -1.100517, 0, 1, 0.07058824, 1,
-0.4006184, 0.2189877, -2.484561, 0, 1, 0.07450981, 1,
-0.4005262, -0.6650393, -2.729212, 0, 1, 0.08235294, 1,
-0.399049, 2.018498, 0.5803331, 0, 1, 0.08627451, 1,
-0.3969063, -0.6336355, -4.029638, 0, 1, 0.09411765, 1,
-0.3956908, -1.479218, -3.453052, 0, 1, 0.1019608, 1,
-0.389065, 1.516294, 1.197063, 0, 1, 0.1058824, 1,
-0.3869457, -0.649591, -2.004006, 0, 1, 0.1137255, 1,
-0.3867103, -0.6835942, -2.057596, 0, 1, 0.1176471, 1,
-0.3799648, -0.6933055, -2.455524, 0, 1, 0.1254902, 1,
-0.3748313, -1.22942, -3.272509, 0, 1, 0.1294118, 1,
-0.3715965, -0.6099951, -3.03809, 0, 1, 0.1372549, 1,
-0.3709355, -1.112736, -0.5369693, 0, 1, 0.1411765, 1,
-0.3694072, 0.7900646, -0.5650569, 0, 1, 0.1490196, 1,
-0.3682317, 0.8657521, -1.479432, 0, 1, 0.1529412, 1,
-0.3669729, -0.2020761, -1.83712, 0, 1, 0.1607843, 1,
-0.3668461, 1.041866, -2.92561, 0, 1, 0.1647059, 1,
-0.3658516, 0.8331981, -1.905858, 0, 1, 0.172549, 1,
-0.3645774, 1.362831, -2.643982, 0, 1, 0.1764706, 1,
-0.3618512, -0.5182734, -2.097695, 0, 1, 0.1843137, 1,
-0.3562863, 0.1934156, -0.7374887, 0, 1, 0.1882353, 1,
-0.3556291, 1.020633, -0.6630818, 0, 1, 0.1960784, 1,
-0.3534648, 0.3389733, -1.307349, 0, 1, 0.2039216, 1,
-0.3513103, 2.342022, -0.5966028, 0, 1, 0.2078431, 1,
-0.345165, -0.8848037, -0.8213636, 0, 1, 0.2156863, 1,
-0.3312682, -0.4125229, -1.954, 0, 1, 0.2196078, 1,
-0.3311608, 0.5228339, -1.308388, 0, 1, 0.227451, 1,
-0.3266478, 0.377263, -4.01027, 0, 1, 0.2313726, 1,
-0.3247276, 1.737422, 0.9956207, 0, 1, 0.2392157, 1,
-0.321428, 0.3217334, -0.5664957, 0, 1, 0.2431373, 1,
-0.3195228, -0.6021927, -2.467568, 0, 1, 0.2509804, 1,
-0.3194785, -0.7515044, -1.797966, 0, 1, 0.254902, 1,
-0.3192243, 0.005175456, -2.271325, 0, 1, 0.2627451, 1,
-0.3173697, 0.0141801, -0.06970809, 0, 1, 0.2666667, 1,
-0.314692, 0.3968459, 1.574293, 0, 1, 0.2745098, 1,
-0.3134113, 1.614622, -0.1284917, 0, 1, 0.2784314, 1,
-0.3058795, -0.4529626, -1.464016, 0, 1, 0.2862745, 1,
-0.305379, 0.2061319, -1.516833, 0, 1, 0.2901961, 1,
-0.304608, -0.09158356, -0.8881074, 0, 1, 0.2980392, 1,
-0.3022194, 1.539954, 0.8873354, 0, 1, 0.3058824, 1,
-0.2998222, -1.262449, -3.548745, 0, 1, 0.3098039, 1,
-0.2953537, 1.892985, -1.987451, 0, 1, 0.3176471, 1,
-0.2911007, -0.6854166, -2.790347, 0, 1, 0.3215686, 1,
-0.2906595, 0.860693, -2.001246, 0, 1, 0.3294118, 1,
-0.2901961, -0.1307301, -2.518392, 0, 1, 0.3333333, 1,
-0.2891808, -1.206892, -3.630558, 0, 1, 0.3411765, 1,
-0.2882446, 0.8350899, -0.2317438, 0, 1, 0.345098, 1,
-0.2861082, 1.530687, 0.05934811, 0, 1, 0.3529412, 1,
-0.286046, -0.07500534, -0.4249255, 0, 1, 0.3568628, 1,
-0.2808905, -2.034915, -1.329154, 0, 1, 0.3647059, 1,
-0.2804832, -0.06429854, -0.1706674, 0, 1, 0.3686275, 1,
-0.2783906, 1.7065, -0.8420801, 0, 1, 0.3764706, 1,
-0.276702, 0.1965377, -1.353773, 0, 1, 0.3803922, 1,
-0.2759623, -0.5577515, -2.169892, 0, 1, 0.3882353, 1,
-0.2712694, 0.3538845, 1.419074, 0, 1, 0.3921569, 1,
-0.2704746, -0.3342546, -2.021091, 0, 1, 0.4, 1,
-0.2642232, 1.475333, -2.35197, 0, 1, 0.4078431, 1,
-0.2640564, -0.3739547, -3.584499, 0, 1, 0.4117647, 1,
-0.2611378, -0.0653377, -2.098193, 0, 1, 0.4196078, 1,
-0.2608162, -0.1232809, -2.046265, 0, 1, 0.4235294, 1,
-0.2553411, -1.973858, -1.215672, 0, 1, 0.4313726, 1,
-0.2533387, 0.2549022, -1.302327, 0, 1, 0.4352941, 1,
-0.2517498, -0.3964254, -3.362726, 0, 1, 0.4431373, 1,
-0.251095, -1.710245, -4.565228, 0, 1, 0.4470588, 1,
-0.2486683, -0.01186404, -2.803084, 0, 1, 0.454902, 1,
-0.2477602, 0.5097035, -1.702814, 0, 1, 0.4588235, 1,
-0.2404161, -0.7729864, -4.8184, 0, 1, 0.4666667, 1,
-0.2354836, 0.6495225, -1.763321, 0, 1, 0.4705882, 1,
-0.2307755, -0.4703332, -1.131057, 0, 1, 0.4784314, 1,
-0.2279948, -0.08064952, -3.031368, 0, 1, 0.4823529, 1,
-0.2246689, -0.3579759, -2.57214, 0, 1, 0.4901961, 1,
-0.2241635, -1.86104, -2.107737, 0, 1, 0.4941176, 1,
-0.2229969, 0.8485255, -1.311355, 0, 1, 0.5019608, 1,
-0.2191586, -1.866673, -2.088359, 0, 1, 0.509804, 1,
-0.218704, 1.949374, -0.592478, 0, 1, 0.5137255, 1,
-0.2160632, -0.3863652, -4.026022, 0, 1, 0.5215687, 1,
-0.2136266, 0.8499828, -0.5108805, 0, 1, 0.5254902, 1,
-0.2118396, 0.1577719, -1.894982, 0, 1, 0.5333334, 1,
-0.2111129, 1.08887, 0.2122983, 0, 1, 0.5372549, 1,
-0.2107838, 0.7440789, -2.303559, 0, 1, 0.5450981, 1,
-0.209535, 1.260848, -0.492995, 0, 1, 0.5490196, 1,
-0.2080785, 0.07103699, -1.584157, 0, 1, 0.5568628, 1,
-0.2073215, 0.4417657, 0.688862, 0, 1, 0.5607843, 1,
-0.2069961, 1.423084, 0.02274428, 0, 1, 0.5686275, 1,
-0.2056206, 0.3665942, 0.1406918, 0, 1, 0.572549, 1,
-0.2036935, -1.388496, -1.101766, 0, 1, 0.5803922, 1,
-0.2018616, 0.09018648, -1.348132, 0, 1, 0.5843138, 1,
-0.1995009, 0.2153894, -0.04446387, 0, 1, 0.5921569, 1,
-0.1990266, -0.1801861, -3.922743, 0, 1, 0.5960785, 1,
-0.1935894, 1.463117, 0.4475263, 0, 1, 0.6039216, 1,
-0.189225, -0.09353503, -1.708992, 0, 1, 0.6117647, 1,
-0.1845804, -0.6703523, -2.828768, 0, 1, 0.6156863, 1,
-0.1815179, 1.853828, 1.72135, 0, 1, 0.6235294, 1,
-0.1803895, 0.9650059, 1.648996, 0, 1, 0.627451, 1,
-0.1801464, -1.031236, -3.349632, 0, 1, 0.6352941, 1,
-0.1799678, -1.296735, -2.148427, 0, 1, 0.6392157, 1,
-0.1776925, 0.7116978, 0.2604385, 0, 1, 0.6470588, 1,
-0.1744953, 0.0127095, -3.295074, 0, 1, 0.6509804, 1,
-0.1731746, 0.3871531, 0.9584625, 0, 1, 0.6588235, 1,
-0.172185, -1.422615, -4.140996, 0, 1, 0.6627451, 1,
-0.1720526, -1.980408, -3.234859, 0, 1, 0.6705883, 1,
-0.1707813, 0.9966077, -2.13222, 0, 1, 0.6745098, 1,
-0.1694754, -0.05688037, -1.438219, 0, 1, 0.682353, 1,
-0.168318, 0.4562757, -1.167197, 0, 1, 0.6862745, 1,
-0.1669727, -1.067558, -2.292828, 0, 1, 0.6941177, 1,
-0.1665075, 1.390882, 0.5383382, 0, 1, 0.7019608, 1,
-0.1648899, -0.339879, -3.755029, 0, 1, 0.7058824, 1,
-0.1591647, -0.6596186, -2.369995, 0, 1, 0.7137255, 1,
-0.1539744, -0.1977268, -1.098388, 0, 1, 0.7176471, 1,
-0.1538606, 0.7652546, -1.422608, 0, 1, 0.7254902, 1,
-0.1525731, 0.3144283, 0.655947, 0, 1, 0.7294118, 1,
-0.1503319, 0.04907379, -0.5529251, 0, 1, 0.7372549, 1,
-0.1472621, -0.4222328, -3.153286, 0, 1, 0.7411765, 1,
-0.1467732, -1.219456, -5.021746, 0, 1, 0.7490196, 1,
-0.1457625, 1.09583, -0.8771616, 0, 1, 0.7529412, 1,
-0.1445555, -0.5218148, -3.121377, 0, 1, 0.7607843, 1,
-0.1426153, -0.3562589, -2.621635, 0, 1, 0.7647059, 1,
-0.1410504, 0.05283263, -1.03066, 0, 1, 0.772549, 1,
-0.1383833, 1.151184, -1.322723, 0, 1, 0.7764706, 1,
-0.138131, 0.5058454, 0.161481, 0, 1, 0.7843137, 1,
-0.1353956, 0.1007946, -0.3782275, 0, 1, 0.7882353, 1,
-0.1348657, -2.175804, -2.308684, 0, 1, 0.7960784, 1,
-0.1280046, 0.1329263, -0.8055775, 0, 1, 0.8039216, 1,
-0.1257424, -0.812436, -3.458889, 0, 1, 0.8078431, 1,
-0.1246828, -0.005826142, -0.939923, 0, 1, 0.8156863, 1,
-0.1215687, 0.1565621, -0.9601674, 0, 1, 0.8196079, 1,
-0.1214707, 0.2714566, 0.8058279, 0, 1, 0.827451, 1,
-0.1195474, -0.5944918, -3.341143, 0, 1, 0.8313726, 1,
-0.117961, -0.1856244, -2.731833, 0, 1, 0.8392157, 1,
-0.1151465, 0.6197545, -0.7626642, 0, 1, 0.8431373, 1,
-0.1136135, -1.408878, -3.291514, 0, 1, 0.8509804, 1,
-0.1076539, 0.1160166, -1.560188, 0, 1, 0.854902, 1,
-0.1045717, -0.4759065, -3.791924, 0, 1, 0.8627451, 1,
-0.1035697, -1.02334, -2.182061, 0, 1, 0.8666667, 1,
-0.1031145, 0.2388869, -0.1157371, 0, 1, 0.8745098, 1,
-0.09931617, 0.7080827, -0.2595432, 0, 1, 0.8784314, 1,
-0.09909174, 2.640364, 0.2149613, 0, 1, 0.8862745, 1,
-0.09880675, 1.442994, -0.4466705, 0, 1, 0.8901961, 1,
-0.09873032, -0.01525279, -2.535174, 0, 1, 0.8980392, 1,
-0.09594288, 0.7374053, -0.1675052, 0, 1, 0.9058824, 1,
-0.0912461, 1.724378, 1.351181, 0, 1, 0.9098039, 1,
-0.0907982, -0.2199225, -1.848038, 0, 1, 0.9176471, 1,
-0.0877023, 0.7929609, -0.2847534, 0, 1, 0.9215686, 1,
-0.08269519, 1.325744, 1.182913, 0, 1, 0.9294118, 1,
-0.08195885, 0.3059551, -0.8586468, 0, 1, 0.9333333, 1,
-0.08070295, 0.1520341, -0.9165409, 0, 1, 0.9411765, 1,
-0.07598247, -1.063759, -4.487271, 0, 1, 0.945098, 1,
-0.07323217, -0.3647806, -4.44944, 0, 1, 0.9529412, 1,
-0.07150909, 0.0817144, -0.6511422, 0, 1, 0.9568627, 1,
-0.0702967, -0.1282273, -3.035659, 0, 1, 0.9647059, 1,
-0.06594977, 1.270362, 1.078224, 0, 1, 0.9686275, 1,
-0.06033514, -0.9318389, -3.347858, 0, 1, 0.9764706, 1,
-0.05889931, -1.155117, -3.199385, 0, 1, 0.9803922, 1,
-0.05752924, 0.9173733, -1.289202, 0, 1, 0.9882353, 1,
-0.05420886, -0.0796183, -3.1603, 0, 1, 0.9921569, 1,
-0.05353305, 1.284447, 0.3169852, 0, 1, 1, 1,
-0.05261905, -0.2028301, -2.976, 0, 0.9921569, 1, 1,
-0.05232597, 0.4146353, -0.4346907, 0, 0.9882353, 1, 1,
-0.04871129, -0.7180064, -3.387729, 0, 0.9803922, 1, 1,
-0.04514851, 0.4445641, 1.551441, 0, 0.9764706, 1, 1,
-0.04464485, 0.9343369, 1.20965, 0, 0.9686275, 1, 1,
-0.04358243, 0.06515485, -1.87818, 0, 0.9647059, 1, 1,
-0.03868797, -0.2497842, -3.357638, 0, 0.9568627, 1, 1,
-0.03771204, -0.1140551, -2.435777, 0, 0.9529412, 1, 1,
-0.03360172, -0.7529165, -4.345051, 0, 0.945098, 1, 1,
-0.03258013, -1.933357, -3.548629, 0, 0.9411765, 1, 1,
-0.03161307, 0.320668, -1.137695, 0, 0.9333333, 1, 1,
-0.02987311, 0.7836024, 1.43223, 0, 0.9294118, 1, 1,
-0.02905428, 1.315522, -0.9855465, 0, 0.9215686, 1, 1,
-0.0230071, 1.027023, -1.25118, 0, 0.9176471, 1, 1,
-0.0126611, -2.06206, -1.447371, 0, 0.9098039, 1, 1,
-0.01232788, -1.35971, -1.537724, 0, 0.9058824, 1, 1,
-0.008124002, -1.338531, -2.229373, 0, 0.8980392, 1, 1,
-0.005071036, 0.08173295, 0.2947182, 0, 0.8901961, 1, 1,
-0.003368916, 0.3568681, -1.29188, 0, 0.8862745, 1, 1,
0.008249944, -0.3725395, 3.063167, 0, 0.8784314, 1, 1,
0.008275201, -0.4522536, 3.14045, 0, 0.8745098, 1, 1,
0.01041927, -1.066082, 2.084087, 0, 0.8666667, 1, 1,
0.01265177, -1.072277, 2.985733, 0, 0.8627451, 1, 1,
0.0141172, -0.06051437, 2.209315, 0, 0.854902, 1, 1,
0.01810892, -0.593987, 5.13881, 0, 0.8509804, 1, 1,
0.0183279, -0.6234626, 3.512662, 0, 0.8431373, 1, 1,
0.024286, 0.7339845, 1.4985, 0, 0.8392157, 1, 1,
0.02431029, 2.297914, 0.09257209, 0, 0.8313726, 1, 1,
0.02569483, -1.388019, 1.080017, 0, 0.827451, 1, 1,
0.02713618, -0.01318044, 2.643567, 0, 0.8196079, 1, 1,
0.02800491, -0.9752949, 4.838452, 0, 0.8156863, 1, 1,
0.0285218, 1.0231, 0.2514102, 0, 0.8078431, 1, 1,
0.0291897, -0.246347, 2.001565, 0, 0.8039216, 1, 1,
0.02980097, -0.2548136, 2.911835, 0, 0.7960784, 1, 1,
0.03070974, -0.7708831, 1.597636, 0, 0.7882353, 1, 1,
0.03526465, -0.7269389, 0.7654196, 0, 0.7843137, 1, 1,
0.03783458, 0.5036567, 1.503374, 0, 0.7764706, 1, 1,
0.03877923, -0.08079168, 2.256681, 0, 0.772549, 1, 1,
0.03886474, -0.1844117, 4.188688, 0, 0.7647059, 1, 1,
0.04134785, -1.815586, 2.977783, 0, 0.7607843, 1, 1,
0.04311935, 1.13646, -1.462923, 0, 0.7529412, 1, 1,
0.04433417, -0.884288, 3.279144, 0, 0.7490196, 1, 1,
0.0482951, -0.961855, 2.431813, 0, 0.7411765, 1, 1,
0.04960443, 1.253073, -0.6420564, 0, 0.7372549, 1, 1,
0.05335953, -1.274716, 3.829026, 0, 0.7294118, 1, 1,
0.05446024, -0.9027977, 3.716497, 0, 0.7254902, 1, 1,
0.05781379, -0.1783778, 0.9831492, 0, 0.7176471, 1, 1,
0.06166349, 0.01862706, 1.406193, 0, 0.7137255, 1, 1,
0.07027253, -0.5461394, 3.818939, 0, 0.7058824, 1, 1,
0.07297639, 0.6379974, -0.7548081, 0, 0.6980392, 1, 1,
0.07379822, -0.2512737, 4.016848, 0, 0.6941177, 1, 1,
0.0759496, 0.2044638, 1.560823, 0, 0.6862745, 1, 1,
0.0788235, 1.670564, -0.2720345, 0, 0.682353, 1, 1,
0.08256937, -0.6096408, 5.737123, 0, 0.6745098, 1, 1,
0.08377231, -0.3683417, 3.556957, 0, 0.6705883, 1, 1,
0.08512065, -1.138143, 3.53847, 0, 0.6627451, 1, 1,
0.08924451, -1.466663, 2.101574, 0, 0.6588235, 1, 1,
0.09013534, 0.3906899, -0.1364955, 0, 0.6509804, 1, 1,
0.09140436, 0.5399757, -0.5463547, 0, 0.6470588, 1, 1,
0.09579372, 2.212376, 0.02231347, 0, 0.6392157, 1, 1,
0.1048129, -0.3225352, 3.16752, 0, 0.6352941, 1, 1,
0.1058223, 0.7332189, 0.1310418, 0, 0.627451, 1, 1,
0.1059852, -1.17132, 1.770246, 0, 0.6235294, 1, 1,
0.1106055, 0.4457861, -1.093957, 0, 0.6156863, 1, 1,
0.1123436, -1.173327, 2.865339, 0, 0.6117647, 1, 1,
0.1172154, 1.653521, -0.5536153, 0, 0.6039216, 1, 1,
0.1179959, 0.4393999, -0.2540743, 0, 0.5960785, 1, 1,
0.1211723, -0.7149162, 2.264034, 0, 0.5921569, 1, 1,
0.1231546, 0.481137, -0.3651521, 0, 0.5843138, 1, 1,
0.1301166, 0.01037288, 2.37948, 0, 0.5803922, 1, 1,
0.1312456, 0.7216887, 0.7693122, 0, 0.572549, 1, 1,
0.1312844, -1.690258, 2.526303, 0, 0.5686275, 1, 1,
0.1340784, 0.4445951, -0.9886307, 0, 0.5607843, 1, 1,
0.1341682, 0.8479277, -0.4158885, 0, 0.5568628, 1, 1,
0.1378487, 1.716538, -0.08868211, 0, 0.5490196, 1, 1,
0.1407227, 0.4437834, 0.1365286, 0, 0.5450981, 1, 1,
0.1410483, -0.5754887, 1.789026, 0, 0.5372549, 1, 1,
0.1491346, 0.4872247, 0.835964, 0, 0.5333334, 1, 1,
0.1549798, -0.9865894, 3.723547, 0, 0.5254902, 1, 1,
0.155914, 1.508686, -1.873654, 0, 0.5215687, 1, 1,
0.1636339, -0.1226682, 1.602122, 0, 0.5137255, 1, 1,
0.1647236, 0.7329302, -0.2914974, 0, 0.509804, 1, 1,
0.166301, -2.367482, 4.446992, 0, 0.5019608, 1, 1,
0.1729617, -0.3556845, 3.666907, 0, 0.4941176, 1, 1,
0.1804176, 1.145836, -1.068536, 0, 0.4901961, 1, 1,
0.1838007, 1.318524, 1.167707, 0, 0.4823529, 1, 1,
0.1854342, 0.4871372, 0.9862944, 0, 0.4784314, 1, 1,
0.1861447, 1.017537, 0.0228041, 0, 0.4705882, 1, 1,
0.1894198, -1.281938, 4.985561, 0, 0.4666667, 1, 1,
0.1951806, -1.768276, 2.400081, 0, 0.4588235, 1, 1,
0.1965436, -0.7713125, 2.600817, 0, 0.454902, 1, 1,
0.2006349, 0.9543356, 0.7295163, 0, 0.4470588, 1, 1,
0.2033335, -0.7290398, 2.248281, 0, 0.4431373, 1, 1,
0.2044555, 0.4826888, 1.032757, 0, 0.4352941, 1, 1,
0.2058015, 0.7550793, -0.7841809, 0, 0.4313726, 1, 1,
0.2094593, 0.02232676, 0.7271058, 0, 0.4235294, 1, 1,
0.2098223, -1.118943, 2.601545, 0, 0.4196078, 1, 1,
0.2100357, -1.664061, 2.719914, 0, 0.4117647, 1, 1,
0.2112761, 0.6559302, 0.9851963, 0, 0.4078431, 1, 1,
0.2133474, 0.3437574, -1.495888, 0, 0.4, 1, 1,
0.2166806, -1.658051, 4.360939, 0, 0.3921569, 1, 1,
0.2210493, 1.86862, -0.8192757, 0, 0.3882353, 1, 1,
0.2220088, -0.5526241, 3.236105, 0, 0.3803922, 1, 1,
0.2273701, -1.042223, 2.953513, 0, 0.3764706, 1, 1,
0.2275584, 0.6563217, 1.15357, 0, 0.3686275, 1, 1,
0.2332583, -0.872382, 2.581872, 0, 0.3647059, 1, 1,
0.2367406, -0.7615672, 1.25924, 0, 0.3568628, 1, 1,
0.2417607, -0.5506114, 3.167538, 0, 0.3529412, 1, 1,
0.2508819, 0.225458, -0.2079094, 0, 0.345098, 1, 1,
0.2522567, 1.587862, -0.5503713, 0, 0.3411765, 1, 1,
0.2525515, -0.1625751, 1.928445, 0, 0.3333333, 1, 1,
0.2539133, 0.2284398, -0.09191408, 0, 0.3294118, 1, 1,
0.254938, 0.6468256, -0.7249981, 0, 0.3215686, 1, 1,
0.2550784, 0.2797401, -0.5451845, 0, 0.3176471, 1, 1,
0.255991, -0.7539545, 4.180678, 0, 0.3098039, 1, 1,
0.2569267, -1.468814, 3.165496, 0, 0.3058824, 1, 1,
0.257641, -0.4205793, 4.909915, 0, 0.2980392, 1, 1,
0.2593474, 1.668421, -0.9079689, 0, 0.2901961, 1, 1,
0.2603467, 1.051088, -1.162144, 0, 0.2862745, 1, 1,
0.2647739, 1.13731, -1.162638, 0, 0.2784314, 1, 1,
0.26676, 0.1827493, 0.06584699, 0, 0.2745098, 1, 1,
0.2695015, -0.6482517, 2.973387, 0, 0.2666667, 1, 1,
0.2771686, -1.941579, 4.614657, 0, 0.2627451, 1, 1,
0.2776753, -0.5957477, 4.251258, 0, 0.254902, 1, 1,
0.2791597, -0.00228976, 2.104846, 0, 0.2509804, 1, 1,
0.2793082, 0.9943218, 1.093673, 0, 0.2431373, 1, 1,
0.2811394, 0.9202704, -1.674058, 0, 0.2392157, 1, 1,
0.2871, 0.904856, -1.495438, 0, 0.2313726, 1, 1,
0.3013768, 0.2491746, 1.391591, 0, 0.227451, 1, 1,
0.3093038, -0.3289844, 1.865207, 0, 0.2196078, 1, 1,
0.3170922, -2.718745, 3.745482, 0, 0.2156863, 1, 1,
0.3194998, 1.323738, 0.03658481, 0, 0.2078431, 1, 1,
0.3201213, 0.7410319, -0.309682, 0, 0.2039216, 1, 1,
0.3217005, -0.9231007, 3.516188, 0, 0.1960784, 1, 1,
0.3234477, -0.03457507, 0.6422009, 0, 0.1882353, 1, 1,
0.3275656, -0.05908702, 1.940145, 0, 0.1843137, 1, 1,
0.3334754, 0.3870899, 2.775359, 0, 0.1764706, 1, 1,
0.3335139, 1.787925, 0.0129793, 0, 0.172549, 1, 1,
0.3354865, -1.110458, 2.225626, 0, 0.1647059, 1, 1,
0.3400952, 1.805052, -1.224878, 0, 0.1607843, 1, 1,
0.341201, 0.1218626, 0.1079733, 0, 0.1529412, 1, 1,
0.3471499, 0.7999925, -0.334985, 0, 0.1490196, 1, 1,
0.3510142, 0.3061642, -0.6502615, 0, 0.1411765, 1, 1,
0.3576878, 1.120435, -1.522748, 0, 0.1372549, 1, 1,
0.3646687, -0.4639342, 2.377398, 0, 0.1294118, 1, 1,
0.3670522, -0.9795422, 2.007928, 0, 0.1254902, 1, 1,
0.3728341, 0.2178918, 0.3676687, 0, 0.1176471, 1, 1,
0.3735155, -0.4283188, 0.288503, 0, 0.1137255, 1, 1,
0.3745891, 1.250277, 1.312249, 0, 0.1058824, 1, 1,
0.3763773, 0.120064, 1.581066, 0, 0.09803922, 1, 1,
0.3772545, -0.6139908, 2.474813, 0, 0.09411765, 1, 1,
0.3878329, -0.09779525, 2.925731, 0, 0.08627451, 1, 1,
0.3879933, -0.6601024, 2.786691, 0, 0.08235294, 1, 1,
0.4006678, -0.251882, 1.876281, 0, 0.07450981, 1, 1,
0.402898, 1.17329, -0.8799509, 0, 0.07058824, 1, 1,
0.4076628, 1.460036, 1.025473, 0, 0.0627451, 1, 1,
0.4110638, 1.103982, -1.295449, 0, 0.05882353, 1, 1,
0.4157034, 1.408381, 1.18006, 0, 0.05098039, 1, 1,
0.4176295, 0.7951593, -0.3505595, 0, 0.04705882, 1, 1,
0.420873, 0.02379878, 1.26757, 0, 0.03921569, 1, 1,
0.4212883, 1.217289, -1.318567, 0, 0.03529412, 1, 1,
0.4213433, -1.25706, 1.530011, 0, 0.02745098, 1, 1,
0.4222351, -0.358094, 2.133356, 0, 0.02352941, 1, 1,
0.4224501, 0.02053086, 3.578008, 0, 0.01568628, 1, 1,
0.4264622, -0.2420146, 1.64454, 0, 0.01176471, 1, 1,
0.4275528, -0.7229854, 1.257084, 0, 0.003921569, 1, 1,
0.4279327, -0.3645134, 3.681372, 0.003921569, 0, 1, 1,
0.4291908, -0.6601552, 2.037028, 0.007843138, 0, 1, 1,
0.4295717, 0.8183141, 0.358504, 0.01568628, 0, 1, 1,
0.4416153, -0.6909969, 3.16634, 0.01960784, 0, 1, 1,
0.4457476, -0.3517914, 1.842882, 0.02745098, 0, 1, 1,
0.4462599, -0.6199078, 3.149547, 0.03137255, 0, 1, 1,
0.4472247, -0.7283881, 4.203418, 0.03921569, 0, 1, 1,
0.4556188, 1.395632, -0.2950509, 0.04313726, 0, 1, 1,
0.4566202, -1.267466, 3.747842, 0.05098039, 0, 1, 1,
0.4586227, 0.1486623, 1.661846, 0.05490196, 0, 1, 1,
0.4609209, -0.3811515, 2.177117, 0.0627451, 0, 1, 1,
0.4637526, 1.218187, 0.3332296, 0.06666667, 0, 1, 1,
0.4654329, -0.09470323, 1.465436, 0.07450981, 0, 1, 1,
0.4663409, -1.353759, 4.670927, 0.07843138, 0, 1, 1,
0.4666767, 0.3647931, 1.165432, 0.08627451, 0, 1, 1,
0.4689938, 0.950057, 1.333287, 0.09019608, 0, 1, 1,
0.4708862, -0.1312416, 2.686661, 0.09803922, 0, 1, 1,
0.4742752, -0.4533449, 1.31927, 0.1058824, 0, 1, 1,
0.4752394, -1.007043, 2.33767, 0.1098039, 0, 1, 1,
0.4820425, 0.3604542, 1.930604, 0.1176471, 0, 1, 1,
0.4865636, -0.2024295, -0.6630391, 0.1215686, 0, 1, 1,
0.4874204, -0.6522498, 3.082678, 0.1294118, 0, 1, 1,
0.489034, -0.880623, 2.511493, 0.1333333, 0, 1, 1,
0.4900146, -0.6844909, 1.621824, 0.1411765, 0, 1, 1,
0.4902571, -0.3848903, 1.390646, 0.145098, 0, 1, 1,
0.4912441, 0.9652384, -0.2272035, 0.1529412, 0, 1, 1,
0.4917699, -0.9286699, 3.556668, 0.1568628, 0, 1, 1,
0.4924351, -0.8903834, 2.469013, 0.1647059, 0, 1, 1,
0.4934295, -0.992073, 2.014646, 0.1686275, 0, 1, 1,
0.4942736, 1.185133, 0.8026659, 0.1764706, 0, 1, 1,
0.4969172, -0.2246552, 1.645324, 0.1803922, 0, 1, 1,
0.5050656, 1.817839, 1.403704, 0.1882353, 0, 1, 1,
0.506212, 0.08319134, -0.5311154, 0.1921569, 0, 1, 1,
0.5074899, 1.147287, 1.723857, 0.2, 0, 1, 1,
0.5123551, -0.2454479, 1.313992, 0.2078431, 0, 1, 1,
0.5148665, 0.8355991, 0.1456571, 0.2117647, 0, 1, 1,
0.5162958, 0.6793842, 1.464749, 0.2196078, 0, 1, 1,
0.5170227, -0.004240929, 1.440209, 0.2235294, 0, 1, 1,
0.5174677, 0.4521496, 0.6624922, 0.2313726, 0, 1, 1,
0.5177011, 1.533848, 0.4830062, 0.2352941, 0, 1, 1,
0.5224213, 1.020325, 0.8997914, 0.2431373, 0, 1, 1,
0.5242216, -0.6452414, 3.453655, 0.2470588, 0, 1, 1,
0.5251622, -0.6041534, 2.367036, 0.254902, 0, 1, 1,
0.5257671, -1.391869, 2.307853, 0.2588235, 0, 1, 1,
0.5361232, 0.3779392, -0.06885818, 0.2666667, 0, 1, 1,
0.5395251, -0.5419218, 1.990044, 0.2705882, 0, 1, 1,
0.5408511, -0.3056083, 1.997863, 0.2784314, 0, 1, 1,
0.5424349, -0.3504913, 2.068635, 0.282353, 0, 1, 1,
0.5456381, 1.060681, 0.1008304, 0.2901961, 0, 1, 1,
0.5550702, 0.2895688, 1.648538, 0.2941177, 0, 1, 1,
0.5578341, -0.02626355, 1.808016, 0.3019608, 0, 1, 1,
0.5587832, -2.042818, 1.765844, 0.3098039, 0, 1, 1,
0.5704671, -0.4336928, 2.413363, 0.3137255, 0, 1, 1,
0.5711357, 0.330983, 1.649707, 0.3215686, 0, 1, 1,
0.5720589, 0.2637116, 2.365505, 0.3254902, 0, 1, 1,
0.5729319, -0.07172825, 1.10355, 0.3333333, 0, 1, 1,
0.5825185, -0.6577752, 4.464617, 0.3372549, 0, 1, 1,
0.5867453, -0.2960793, 2.249739, 0.345098, 0, 1, 1,
0.5878714, 2.029325, -0.9883723, 0.3490196, 0, 1, 1,
0.5942015, -0.7919532, 0.81844, 0.3568628, 0, 1, 1,
0.5971648, -0.09294882, 2.077533, 0.3607843, 0, 1, 1,
0.5988509, 0.8427134, -0.2150053, 0.3686275, 0, 1, 1,
0.5995366, -0.8593916, 4.090683, 0.372549, 0, 1, 1,
0.606447, 0.6653424, -0.3504198, 0.3803922, 0, 1, 1,
0.6093954, 0.9974635, 0.3185437, 0.3843137, 0, 1, 1,
0.6120698, -0.4271637, 4.089911, 0.3921569, 0, 1, 1,
0.6122394, 0.7058285, 0.1217255, 0.3960784, 0, 1, 1,
0.6125603, -1.811398, 3.937648, 0.4039216, 0, 1, 1,
0.61901, -1.044889, 1.36994, 0.4117647, 0, 1, 1,
0.6191589, -1.657588, 3.204353, 0.4156863, 0, 1, 1,
0.6205788, -0.5975114, 2.406756, 0.4235294, 0, 1, 1,
0.6210359, -1.506608, 3.547941, 0.427451, 0, 1, 1,
0.6221611, -1.983144, 2.02036, 0.4352941, 0, 1, 1,
0.6250119, -0.1986777, 1.228135, 0.4392157, 0, 1, 1,
0.6337415, -0.9202551, 1.807721, 0.4470588, 0, 1, 1,
0.642793, 0.3623178, -0.4864973, 0.4509804, 0, 1, 1,
0.644812, -1.390262, 1.797994, 0.4588235, 0, 1, 1,
0.6557509, -0.004912174, 1.77811, 0.4627451, 0, 1, 1,
0.6575201, -1.174825, 3.727002, 0.4705882, 0, 1, 1,
0.6645788, 1.475243, 1.086204, 0.4745098, 0, 1, 1,
0.6658604, -0.9374788, 4.348786, 0.4823529, 0, 1, 1,
0.6665202, -0.3177992, 2.700518, 0.4862745, 0, 1, 1,
0.6723406, 0.629953, 0.378823, 0.4941176, 0, 1, 1,
0.6753889, 1.561432, 1.820394, 0.5019608, 0, 1, 1,
0.6758373, 1.033506, 0.1090017, 0.5058824, 0, 1, 1,
0.6848922, 1.253859, 1.076658, 0.5137255, 0, 1, 1,
0.6871825, -1.001273, 0.8909178, 0.5176471, 0, 1, 1,
0.6891494, 0.9650782, 0.2695463, 0.5254902, 0, 1, 1,
0.6923403, 0.8495277, 2.061016, 0.5294118, 0, 1, 1,
0.6942136, 0.3609655, 1.028953, 0.5372549, 0, 1, 1,
0.6943166, -1.484145, 4.627378, 0.5411765, 0, 1, 1,
0.6959634, -0.03715152, 1.606462, 0.5490196, 0, 1, 1,
0.7004401, -1.645474, 3.359522, 0.5529412, 0, 1, 1,
0.7043229, 1.05669, 2.517379, 0.5607843, 0, 1, 1,
0.7168791, 0.7396484, 0.1766912, 0.5647059, 0, 1, 1,
0.7171392, -0.1278587, 2.710484, 0.572549, 0, 1, 1,
0.7186583, 0.05474043, 2.600689, 0.5764706, 0, 1, 1,
0.7215266, -1.719281, 2.788264, 0.5843138, 0, 1, 1,
0.7260948, -0.7007906, 2.727511, 0.5882353, 0, 1, 1,
0.7327114, -0.1433689, 1.82137, 0.5960785, 0, 1, 1,
0.7356631, 1.858806, -0.4545994, 0.6039216, 0, 1, 1,
0.7367576, 0.1434637, 1.306535, 0.6078432, 0, 1, 1,
0.7387821, -0.06950471, 2.338872, 0.6156863, 0, 1, 1,
0.741266, -0.2767642, -0.544164, 0.6196079, 0, 1, 1,
0.7426749, -0.3197861, 2.199458, 0.627451, 0, 1, 1,
0.7429286, -0.449252, 5.382918, 0.6313726, 0, 1, 1,
0.747506, 0.07707931, 0.2945647, 0.6392157, 0, 1, 1,
0.7512607, 0.4033125, 1.825747, 0.6431373, 0, 1, 1,
0.7554815, -0.2130738, 1.263105, 0.6509804, 0, 1, 1,
0.7623358, -2.23698, 3.280256, 0.654902, 0, 1, 1,
0.7677678, -0.4303937, 2.713408, 0.6627451, 0, 1, 1,
0.7694888, -0.1033007, 0.7416995, 0.6666667, 0, 1, 1,
0.7825987, -0.158648, 2.362906, 0.6745098, 0, 1, 1,
0.7854233, -0.7218987, 1.729971, 0.6784314, 0, 1, 1,
0.7864767, -0.7547742, 3.69282, 0.6862745, 0, 1, 1,
0.7900835, 0.7712777, -0.05956519, 0.6901961, 0, 1, 1,
0.7941763, 1.968145, 1.838775, 0.6980392, 0, 1, 1,
0.7974432, -1.156054, 1.531703, 0.7058824, 0, 1, 1,
0.8063194, -0.6785426, 0.05788644, 0.7098039, 0, 1, 1,
0.8118646, 0.5745195, 0.1060789, 0.7176471, 0, 1, 1,
0.8140099, 0.5877081, -0.612409, 0.7215686, 0, 1, 1,
0.8194059, 1.34236, -0.7989231, 0.7294118, 0, 1, 1,
0.8272237, -1.060213, 3.02383, 0.7333333, 0, 1, 1,
0.8339874, 0.1533531, 2.119481, 0.7411765, 0, 1, 1,
0.8363101, 0.7289761, -0.6794938, 0.7450981, 0, 1, 1,
0.8422333, -0.1907205, 1.145751, 0.7529412, 0, 1, 1,
0.8508602, 0.5027304, 1.063677, 0.7568628, 0, 1, 1,
0.8538715, -0.2806224, 2.525974, 0.7647059, 0, 1, 1,
0.8543009, 1.384496, 0.535692, 0.7686275, 0, 1, 1,
0.8544966, 0.1488477, 2.64665, 0.7764706, 0, 1, 1,
0.8589229, 0.9376848, 1.136121, 0.7803922, 0, 1, 1,
0.860314, 0.1055476, 0.9660005, 0.7882353, 0, 1, 1,
0.8633734, 0.4124158, 0.7903832, 0.7921569, 0, 1, 1,
0.8633882, -0.15736, 2.447486, 0.8, 0, 1, 1,
0.8650374, 1.368519, 0.4544198, 0.8078431, 0, 1, 1,
0.8667803, 0.5658015, 4.150297, 0.8117647, 0, 1, 1,
0.8672364, -0.1754962, 1.917596, 0.8196079, 0, 1, 1,
0.8679896, -0.499263, 3.035636, 0.8235294, 0, 1, 1,
0.8728878, -0.9494193, 1.858241, 0.8313726, 0, 1, 1,
0.8821731, -1.061019, 1.357081, 0.8352941, 0, 1, 1,
0.8832788, -0.9333369, 3.0827, 0.8431373, 0, 1, 1,
0.8839124, -0.09144685, 0.3653313, 0.8470588, 0, 1, 1,
0.8942364, 1.866222, 0.3771335, 0.854902, 0, 1, 1,
0.896607, -0.4984117, 2.543948, 0.8588235, 0, 1, 1,
0.8969778, 1.61179, 0.5381219, 0.8666667, 0, 1, 1,
0.8975984, 0.4487032, 2.523147, 0.8705882, 0, 1, 1,
0.8994486, -0.08895857, 2.477457, 0.8784314, 0, 1, 1,
0.9125009, 0.6020818, 0.6751353, 0.8823529, 0, 1, 1,
0.9185159, 0.6592318, 2.059372, 0.8901961, 0, 1, 1,
0.9188884, 2.651973, 2.083554, 0.8941177, 0, 1, 1,
0.920922, -0.8031572, 1.600565, 0.9019608, 0, 1, 1,
0.9365923, 0.5604533, -0.4149419, 0.9098039, 0, 1, 1,
0.9380233, 1.377609, 2.232058, 0.9137255, 0, 1, 1,
0.9394355, -0.1453277, -0.7682662, 0.9215686, 0, 1, 1,
0.9419815, 0.5578128, 2.053241, 0.9254902, 0, 1, 1,
0.9430116, 0.6193572, -0.2388337, 0.9333333, 0, 1, 1,
0.9440584, -0.8034518, 2.497679, 0.9372549, 0, 1, 1,
0.9513205, -1.544747, 4.448626, 0.945098, 0, 1, 1,
0.9565884, 1.078868, 1.537203, 0.9490196, 0, 1, 1,
0.9566118, -0.515624, 2.214034, 0.9568627, 0, 1, 1,
0.9576079, 0.6090478, -0.199435, 0.9607843, 0, 1, 1,
0.9601057, 0.3604151, 1.316182, 0.9686275, 0, 1, 1,
0.9703693, -0.5051659, 2.9893, 0.972549, 0, 1, 1,
0.979252, 0.1301078, 1.013328, 0.9803922, 0, 1, 1,
0.9793531, 1.199281, -0.01646059, 0.9843137, 0, 1, 1,
0.9796058, 0.4392499, 2.128997, 0.9921569, 0, 1, 1,
0.9821389, 0.8508931, 0.2024792, 0.9960784, 0, 1, 1,
0.985438, 1.298287, 1.05145, 1, 0, 0.9960784, 1,
0.9868488, 1.098898, 0.9976449, 1, 0, 0.9882353, 1,
0.9887203, -1.313077, 3.539105, 1, 0, 0.9843137, 1,
0.9915036, 1.771324, 1.204831, 1, 0, 0.9764706, 1,
0.9930028, 1.241788, 0.2598402, 1, 0, 0.972549, 1,
0.9967967, 0.2168181, 1.874008, 1, 0, 0.9647059, 1,
1.001912, -0.4323221, 3.349214, 1, 0, 0.9607843, 1,
1.015914, -0.5406446, 3.894227, 1, 0, 0.9529412, 1,
1.021525, 1.04643, 1.141809, 1, 0, 0.9490196, 1,
1.029692, -0.8714949, 1.925572, 1, 0, 0.9411765, 1,
1.031022, -1.375856, 3.041363, 1, 0, 0.9372549, 1,
1.035213, -1.096772, 2.686075, 1, 0, 0.9294118, 1,
1.045461, 0.8335122, 1.142587, 1, 0, 0.9254902, 1,
1.058627, 1.203728, -2.294261, 1, 0, 0.9176471, 1,
1.059743, -0.8289564, 1.827235, 1, 0, 0.9137255, 1,
1.060771, 1.998678, -0.09477647, 1, 0, 0.9058824, 1,
1.061721, 1.199523, 0.2135215, 1, 0, 0.9019608, 1,
1.064183, 1.641356, 0.8237938, 1, 0, 0.8941177, 1,
1.070382, 0.4383721, 0.6533826, 1, 0, 0.8862745, 1,
1.071998, -0.3251107, 1.079495, 1, 0, 0.8823529, 1,
1.082045, 0.4941243, 1.863753, 1, 0, 0.8745098, 1,
1.084797, 0.2696076, -0.02504287, 1, 0, 0.8705882, 1,
1.088758, 0.8548867, 0.5696765, 1, 0, 0.8627451, 1,
1.092523, -0.04206115, 2.517523, 1, 0, 0.8588235, 1,
1.09626, 0.8668525, 0.784436, 1, 0, 0.8509804, 1,
1.099492, -0.3955786, 1.101236, 1, 0, 0.8470588, 1,
1.107807, -0.9231828, 1.895355, 1, 0, 0.8392157, 1,
1.110834, -1.698792, 2.372448, 1, 0, 0.8352941, 1,
1.123731, 0.7704475, 1.840822, 1, 0, 0.827451, 1,
1.12574, 0.2498301, 1.801257, 1, 0, 0.8235294, 1,
1.130602, 0.08523555, 2.79211, 1, 0, 0.8156863, 1,
1.156073, 0.8481174, 1.030581, 1, 0, 0.8117647, 1,
1.164075, -0.8839152, 2.475072, 1, 0, 0.8039216, 1,
1.169641, -0.07420111, 2.258977, 1, 0, 0.7960784, 1,
1.172504, 0.7256819, 1.209769, 1, 0, 0.7921569, 1,
1.173654, -1.497955, 3.131939, 1, 0, 0.7843137, 1,
1.173903, -0.496932, 2.5488, 1, 0, 0.7803922, 1,
1.175325, -0.7980588, 2.717432, 1, 0, 0.772549, 1,
1.183205, 1.664754, 1.361064, 1, 0, 0.7686275, 1,
1.184585, -0.7322143, 3.332478, 1, 0, 0.7607843, 1,
1.18605, -0.3673454, 0.8945078, 1, 0, 0.7568628, 1,
1.18834, -0.9147717, 1.404041, 1, 0, 0.7490196, 1,
1.189503, -0.04273416, 0.5797124, 1, 0, 0.7450981, 1,
1.200622, -1.130545, 2.776458, 1, 0, 0.7372549, 1,
1.202451, -0.6785277, 2.222264, 1, 0, 0.7333333, 1,
1.203223, 0.2148189, -0.04451121, 1, 0, 0.7254902, 1,
1.208239, 0.8085467, 3.163503, 1, 0, 0.7215686, 1,
1.210716, -0.9396342, 1.725866, 1, 0, 0.7137255, 1,
1.214607, 1.248783, 1.805652, 1, 0, 0.7098039, 1,
1.222674, -0.7168835, 2.812038, 1, 0, 0.7019608, 1,
1.225467, 0.8623918, 0.9809492, 1, 0, 0.6941177, 1,
1.230325, 1.112517, 0.9381146, 1, 0, 0.6901961, 1,
1.231001, 0.5397369, 1.834893, 1, 0, 0.682353, 1,
1.23173, 1.360728, 3.155564, 1, 0, 0.6784314, 1,
1.233428, -1.20822, 2.554601, 1, 0, 0.6705883, 1,
1.247573, -1.34367, 3.79343, 1, 0, 0.6666667, 1,
1.265247, 1.646108, 0.4434105, 1, 0, 0.6588235, 1,
1.267915, 0.02747576, 1.394429, 1, 0, 0.654902, 1,
1.268138, -0.7132957, 3.035467, 1, 0, 0.6470588, 1,
1.271526, -0.7695878, 1.613965, 1, 0, 0.6431373, 1,
1.27448, -0.5772566, 2.44447, 1, 0, 0.6352941, 1,
1.276923, 1.160491, 0.959595, 1, 0, 0.6313726, 1,
1.279449, 0.03526992, 1.622262, 1, 0, 0.6235294, 1,
1.279471, -1.705193, 2.576737, 1, 0, 0.6196079, 1,
1.292761, -0.5046592, 2.682855, 1, 0, 0.6117647, 1,
1.305787, -0.2492175, 2.055056, 1, 0, 0.6078432, 1,
1.30837, 0.2410323, 0.2023888, 1, 0, 0.6, 1,
1.309941, 2.339109, 0.2913485, 1, 0, 0.5921569, 1,
1.318822, -0.7587376, 1.232452, 1, 0, 0.5882353, 1,
1.32746, 0.8970996, -0.961656, 1, 0, 0.5803922, 1,
1.328232, -1.132522, 2.612009, 1, 0, 0.5764706, 1,
1.329829, -0.6503524, 3.745925, 1, 0, 0.5686275, 1,
1.331702, -1.872771, 0.7579322, 1, 0, 0.5647059, 1,
1.347277, 0.3515866, 0.7573462, 1, 0, 0.5568628, 1,
1.353189, 0.9909995, 1.9776, 1, 0, 0.5529412, 1,
1.359548, -0.2829081, 2.893517, 1, 0, 0.5450981, 1,
1.362273, 1.048665, 1.151922, 1, 0, 0.5411765, 1,
1.363998, 0.6371617, 0.5773891, 1, 0, 0.5333334, 1,
1.364391, 0.6677799, 0.818519, 1, 0, 0.5294118, 1,
1.373294, 1.377527, -0.6677093, 1, 0, 0.5215687, 1,
1.383232, -0.5015272, 1.258415, 1, 0, 0.5176471, 1,
1.384226, -0.2511212, 1.558867, 1, 0, 0.509804, 1,
1.384786, -0.7110912, 1.015084, 1, 0, 0.5058824, 1,
1.39481, -1.130061, 2.530612, 1, 0, 0.4980392, 1,
1.395529, -0.721462, 1.956958, 1, 0, 0.4901961, 1,
1.396508, -1.745663, 1.178142, 1, 0, 0.4862745, 1,
1.410446, -0.6010275, 2.635372, 1, 0, 0.4784314, 1,
1.411896, -0.1957718, 2.99888, 1, 0, 0.4745098, 1,
1.415177, -0.2731528, 3.101282, 1, 0, 0.4666667, 1,
1.418859, -0.443499, 2.068685, 1, 0, 0.4627451, 1,
1.419132, 0.003888798, 3.109125, 1, 0, 0.454902, 1,
1.419431, -2.72768, 4.278047, 1, 0, 0.4509804, 1,
1.424869, -2.732597, 3.260052, 1, 0, 0.4431373, 1,
1.428107, -0.06039272, 1.849723, 1, 0, 0.4392157, 1,
1.428591, -1.005341, 1.995752, 1, 0, 0.4313726, 1,
1.446454, -1.363261, 1.776108, 1, 0, 0.427451, 1,
1.446639, 0.6564265, -0.2294321, 1, 0, 0.4196078, 1,
1.450131, -0.3463621, 3.131506, 1, 0, 0.4156863, 1,
1.457359, 0.6260486, 0.06435294, 1, 0, 0.4078431, 1,
1.458348, -1.489086, 2.16816, 1, 0, 0.4039216, 1,
1.461151, -0.3469247, 2.576445, 1, 0, 0.3960784, 1,
1.469678, -0.1655, 0.2836114, 1, 0, 0.3882353, 1,
1.480604, 1.036559, 1.843584, 1, 0, 0.3843137, 1,
1.487431, 0.378112, 1.770541, 1, 0, 0.3764706, 1,
1.495513, 0.4992504, -0.123613, 1, 0, 0.372549, 1,
1.511752, -0.9231625, 0.9043446, 1, 0, 0.3647059, 1,
1.530369, 0.9152882, 1.931049, 1, 0, 0.3607843, 1,
1.542889, -0.1847956, 2.961111, 1, 0, 0.3529412, 1,
1.552773, -0.9153265, 1.214533, 1, 0, 0.3490196, 1,
1.579023, -0.6401597, 1.684805, 1, 0, 0.3411765, 1,
1.587193, 0.8180145, 0.3789877, 1, 0, 0.3372549, 1,
1.596321, -0.8547781, 0.7852904, 1, 0, 0.3294118, 1,
1.618564, 0.816084, 1.62075, 1, 0, 0.3254902, 1,
1.630589, 0.9920272, 2.035778, 1, 0, 0.3176471, 1,
1.644485, -1.069657, 1.735052, 1, 0, 0.3137255, 1,
1.661475, -2.187403, 1.531108, 1, 0, 0.3058824, 1,
1.679043, 0.2096857, 0.9899183, 1, 0, 0.2980392, 1,
1.699587, 0.4133662, 0.8569978, 1, 0, 0.2941177, 1,
1.705216, -0.5504408, 1.501016, 1, 0, 0.2862745, 1,
1.723621, 0.6384794, 2.528877, 1, 0, 0.282353, 1,
1.7249, -0.7370178, 1.268098, 1, 0, 0.2745098, 1,
1.742803, -1.008154, 1.625579, 1, 0, 0.2705882, 1,
1.747816, -1.316754, 3.720802, 1, 0, 0.2627451, 1,
1.761136, 0.1270063, -0.5749199, 1, 0, 0.2588235, 1,
1.771921, -0.7440815, 2.582196, 1, 0, 0.2509804, 1,
1.783083, 0.5194232, 1.397487, 1, 0, 0.2470588, 1,
1.803101, -2.040607, 2.444241, 1, 0, 0.2392157, 1,
1.80762, 0.6461934, 2.816508, 1, 0, 0.2352941, 1,
1.808125, -0.2969975, 0.10073, 1, 0, 0.227451, 1,
1.853196, -0.07454882, 2.214266, 1, 0, 0.2235294, 1,
1.879736, 1.37626, 1.638036, 1, 0, 0.2156863, 1,
1.887666, 0.7214336, 3.438773, 1, 0, 0.2117647, 1,
1.900764, -1.448024, 2.112099, 1, 0, 0.2039216, 1,
1.935596, -0.9152961, 1.483856, 1, 0, 0.1960784, 1,
1.959978, -0.9030662, 2.390021, 1, 0, 0.1921569, 1,
2.039262, -0.3742056, 1.30753, 1, 0, 0.1843137, 1,
2.085422, 0.7523105, 1.157472, 1, 0, 0.1803922, 1,
2.088401, 0.1964837, 2.560904, 1, 0, 0.172549, 1,
2.149236, 1.19199, 0.3466315, 1, 0, 0.1686275, 1,
2.172877, 0.633841, 1.741679, 1, 0, 0.1607843, 1,
2.17438, -0.2355779, 2.862116, 1, 0, 0.1568628, 1,
2.234598, -0.07880196, 0.9684939, 1, 0, 0.1490196, 1,
2.257869, 0.4633344, 2.498402, 1, 0, 0.145098, 1,
2.261679, -0.5326915, 1.226018, 1, 0, 0.1372549, 1,
2.280035, -0.5328082, 2.425182, 1, 0, 0.1333333, 1,
2.281703, -0.2061195, 2.211526, 1, 0, 0.1254902, 1,
2.305381, 1.32286, 0.5270609, 1, 0, 0.1215686, 1,
2.310615, -0.07600449, 1.180652, 1, 0, 0.1137255, 1,
2.409985, 2.140255, 2.186423, 1, 0, 0.1098039, 1,
2.450922, -0.1776507, 1.893533, 1, 0, 0.1019608, 1,
2.45587, -0.9062068, -0.08218325, 1, 0, 0.09411765, 1,
2.462276, 0.8078809, 2.403564, 1, 0, 0.09019608, 1,
2.513079, -0.9374924, 1.756006, 1, 0, 0.08235294, 1,
2.514505, 0.621896, 2.098815, 1, 0, 0.07843138, 1,
2.53143, -0.1567908, 1.55002, 1, 0, 0.07058824, 1,
2.571593, 0.008541597, 0.6683561, 1, 0, 0.06666667, 1,
2.594891, -2.190021, 2.810881, 1, 0, 0.05882353, 1,
2.605937, -0.6567747, 2.60759, 1, 0, 0.05490196, 1,
2.610279, -0.6302278, 2.761939, 1, 0, 0.04705882, 1,
2.633934, 0.21134, 0.512718, 1, 0, 0.04313726, 1,
2.69879, 1.054801, 1.626056, 1, 0, 0.03529412, 1,
2.72946, 0.4981889, 1.440421, 1, 0, 0.03137255, 1,
2.780647, 0.9528529, 1.521513, 1, 0, 0.02352941, 1,
2.841051, -0.09877656, 1.169813, 1, 0, 0.01960784, 1,
2.856292, 1.782554, 1.283242, 1, 0, 0.01176471, 1,
3.019509, 0.6513792, 2.405154, 1, 0, 0.007843138, 1
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
-0.1711646, -3.65382, -6.845375, 0, -0.5, 0.5, 0.5,
-0.1711646, -3.65382, -6.845375, 1, -0.5, 0.5, 0.5,
-0.1711646, -3.65382, -6.845375, 1, 1.5, 0.5, 0.5,
-0.1711646, -3.65382, -6.845375, 0, 1.5, 0.5, 0.5
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
-4.443476, -0.01512361, -6.845375, 0, -0.5, 0.5, 0.5,
-4.443476, -0.01512361, -6.845375, 1, -0.5, 0.5, 0.5,
-4.443476, -0.01512361, -6.845375, 1, 1.5, 0.5, 0.5,
-4.443476, -0.01512361, -6.845375, 0, 1.5, 0.5, 0.5
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
-4.443476, -3.65382, 0.3576887, 0, -0.5, 0.5, 0.5,
-4.443476, -3.65382, 0.3576887, 1, -0.5, 0.5, 0.5,
-4.443476, -3.65382, 0.3576887, 1, 1.5, 0.5, 0.5,
-4.443476, -3.65382, 0.3576887, 0, 1.5, 0.5, 0.5
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
-3, -2.814121, -5.183129,
3, -2.814121, -5.183129,
-3, -2.814121, -5.183129,
-3, -2.954071, -5.46017,
-2, -2.814121, -5.183129,
-2, -2.954071, -5.46017,
-1, -2.814121, -5.183129,
-1, -2.954071, -5.46017,
0, -2.814121, -5.183129,
0, -2.954071, -5.46017,
1, -2.814121, -5.183129,
1, -2.954071, -5.46017,
2, -2.814121, -5.183129,
2, -2.954071, -5.46017,
3, -2.814121, -5.183129,
3, -2.954071, -5.46017
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
-3, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
-3, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
-3, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
-3, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
-2, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
-2, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
-2, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
-2, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
-1, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
-1, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
-1, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
-1, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
0, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
0, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
0, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
0, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
1, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
1, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
1, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
1, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
2, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
2, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
2, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
2, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5,
3, -3.23397, -6.014252, 0, -0.5, 0.5, 0.5,
3, -3.23397, -6.014252, 1, -0.5, 0.5, 0.5,
3, -3.23397, -6.014252, 1, 1.5, 0.5, 0.5,
3, -3.23397, -6.014252, 0, 1.5, 0.5, 0.5
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
-3.457558, -2, -5.183129,
-3.457558, 2, -5.183129,
-3.457558, -2, -5.183129,
-3.621878, -2, -5.46017,
-3.457558, -1, -5.183129,
-3.621878, -1, -5.46017,
-3.457558, 0, -5.183129,
-3.621878, 0, -5.46017,
-3.457558, 1, -5.183129,
-3.621878, 1, -5.46017,
-3.457558, 2, -5.183129,
-3.621878, 2, -5.46017
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
-3.950517, -2, -6.014252, 0, -0.5, 0.5, 0.5,
-3.950517, -2, -6.014252, 1, -0.5, 0.5, 0.5,
-3.950517, -2, -6.014252, 1, 1.5, 0.5, 0.5,
-3.950517, -2, -6.014252, 0, 1.5, 0.5, 0.5,
-3.950517, -1, -6.014252, 0, -0.5, 0.5, 0.5,
-3.950517, -1, -6.014252, 1, -0.5, 0.5, 0.5,
-3.950517, -1, -6.014252, 1, 1.5, 0.5, 0.5,
-3.950517, -1, -6.014252, 0, 1.5, 0.5, 0.5,
-3.950517, 0, -6.014252, 0, -0.5, 0.5, 0.5,
-3.950517, 0, -6.014252, 1, -0.5, 0.5, 0.5,
-3.950517, 0, -6.014252, 1, 1.5, 0.5, 0.5,
-3.950517, 0, -6.014252, 0, 1.5, 0.5, 0.5,
-3.950517, 1, -6.014252, 0, -0.5, 0.5, 0.5,
-3.950517, 1, -6.014252, 1, -0.5, 0.5, 0.5,
-3.950517, 1, -6.014252, 1, 1.5, 0.5, 0.5,
-3.950517, 1, -6.014252, 0, 1.5, 0.5, 0.5,
-3.950517, 2, -6.014252, 0, -0.5, 0.5, 0.5,
-3.950517, 2, -6.014252, 1, -0.5, 0.5, 0.5,
-3.950517, 2, -6.014252, 1, 1.5, 0.5, 0.5,
-3.950517, 2, -6.014252, 0, 1.5, 0.5, 0.5
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
-3.457558, -2.814121, -4,
-3.457558, -2.814121, 4,
-3.457558, -2.814121, -4,
-3.621878, -2.954071, -4,
-3.457558, -2.814121, -2,
-3.621878, -2.954071, -2,
-3.457558, -2.814121, 0,
-3.621878, -2.954071, 0,
-3.457558, -2.814121, 2,
-3.621878, -2.954071, 2,
-3.457558, -2.814121, 4,
-3.621878, -2.954071, 4
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
-3.950517, -3.23397, -4, 0, -0.5, 0.5, 0.5,
-3.950517, -3.23397, -4, 1, -0.5, 0.5, 0.5,
-3.950517, -3.23397, -4, 1, 1.5, 0.5, 0.5,
-3.950517, -3.23397, -4, 0, 1.5, 0.5, 0.5,
-3.950517, -3.23397, -2, 0, -0.5, 0.5, 0.5,
-3.950517, -3.23397, -2, 1, -0.5, 0.5, 0.5,
-3.950517, -3.23397, -2, 1, 1.5, 0.5, 0.5,
-3.950517, -3.23397, -2, 0, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 0, 0, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 0, 1, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 0, 1, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 0, 0, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 2, 0, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 2, 1, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 2, 1, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 2, 0, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 4, 0, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 4, 1, -0.5, 0.5, 0.5,
-3.950517, -3.23397, 4, 1, 1.5, 0.5, 0.5,
-3.950517, -3.23397, 4, 0, 1.5, 0.5, 0.5
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
-3.457558, -2.814121, -5.183129,
-3.457558, 2.783874, -5.183129,
-3.457558, -2.814121, 5.898507,
-3.457558, 2.783874, 5.898507,
-3.457558, -2.814121, -5.183129,
-3.457558, -2.814121, 5.898507,
-3.457558, 2.783874, -5.183129,
-3.457558, 2.783874, 5.898507,
-3.457558, -2.814121, -5.183129,
3.115229, -2.814121, -5.183129,
-3.457558, -2.814121, 5.898507,
3.115229, -2.814121, 5.898507,
-3.457558, 2.783874, -5.183129,
3.115229, 2.783874, -5.183129,
-3.457558, 2.783874, 5.898507,
3.115229, 2.783874, 5.898507,
3.115229, -2.814121, -5.183129,
3.115229, 2.783874, -5.183129,
3.115229, -2.814121, 5.898507,
3.115229, 2.783874, 5.898507,
3.115229, -2.814121, -5.183129,
3.115229, -2.814121, 5.898507,
3.115229, 2.783874, -5.183129,
3.115229, 2.783874, 5.898507
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
var radius = 7.501272;
var distance = 33.374;
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
mvMatrix.translate( 0.1711646, 0.01512361, -0.3576887 );
mvMatrix.scale( 1.233955, 1.448826, 0.7318886 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.374);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
4-Methylanilin<-read.table("4-Methylanilin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-Methylanilin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
```

```r
y<-4-Methylanilin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
```

```r
z<-4-Methylanilin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methylanilin' not found
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
-3.361838, -0.2784423, -0.08382798, 0, 0, 1, 1, 1,
-3.204501, -0.3703856, -3.319912, 1, 0, 0, 1, 1,
-3.191165, 0.3399105, -1.171711, 1, 0, 0, 1, 1,
-2.938755, 0.8061491, -2.901118, 1, 0, 0, 1, 1,
-2.61207, -0.9188358, -1.604028, 1, 0, 0, 1, 1,
-2.595095, -0.9875491, -2.775783, 1, 0, 0, 1, 1,
-2.576933, 0.1303921, -0.5658475, 0, 0, 0, 1, 1,
-2.570382, -1.607966, -0.3221468, 0, 0, 0, 1, 1,
-2.468338, 0.2949988, -1.45902, 0, 0, 0, 1, 1,
-2.464677, -0.8502122, -0.9121999, 0, 0, 0, 1, 1,
-2.45702, -0.1083229, -2.508946, 0, 0, 0, 1, 1,
-2.435735, 0.2444711, -1.410645, 0, 0, 0, 1, 1,
-2.35958, -0.08935783, -2.898108, 0, 0, 0, 1, 1,
-2.349733, 0.6288205, -1.728009, 1, 1, 1, 1, 1,
-2.315765, 1.156166, -2.609253, 1, 1, 1, 1, 1,
-2.305358, -0.6813395, -1.645953, 1, 1, 1, 1, 1,
-2.265574, 0.0818039, -1.091634, 1, 1, 1, 1, 1,
-2.070603, 1.066619, -1.470002, 1, 1, 1, 1, 1,
-2.055236, -0.2732852, -1.044496, 1, 1, 1, 1, 1,
-2.016341, 2.473867, -0.5663515, 1, 1, 1, 1, 1,
-2.014646, 1.036439, -0.8645802, 1, 1, 1, 1, 1,
-1.979036, 0.2694999, -0.869509, 1, 1, 1, 1, 1,
-1.969936, 0.6969703, 0.3059432, 1, 1, 1, 1, 1,
-1.961183, -0.2691163, -2.606504, 1, 1, 1, 1, 1,
-1.949749, -1.313698, -2.620064, 1, 1, 1, 1, 1,
-1.943062, -0.03791163, -0.6456794, 1, 1, 1, 1, 1,
-1.942762, 0.5106182, -0.7350552, 1, 1, 1, 1, 1,
-1.923011, -0.007747511, -1.104686, 1, 1, 1, 1, 1,
-1.906369, 0.9112682, -0.2930346, 0, 0, 1, 1, 1,
-1.899086, -1.120234, -2.194719, 1, 0, 0, 1, 1,
-1.88, 1.629677, -0.01541708, 1, 0, 0, 1, 1,
-1.864922, -1.497851, -2.264162, 1, 0, 0, 1, 1,
-1.85672, 1.504435, -1.257645, 1, 0, 0, 1, 1,
-1.838455, -0.3429506, -3.668618, 1, 0, 0, 1, 1,
-1.834021, -0.01593277, -1.809144, 0, 0, 0, 1, 1,
-1.813754, 1.787279, -1.345748, 0, 0, 0, 1, 1,
-1.81084, 0.04027304, -1.721242, 0, 0, 0, 1, 1,
-1.809561, 0.1827179, -1.799744, 0, 0, 0, 1, 1,
-1.788511, 2.086152, -0.8714752, 0, 0, 0, 1, 1,
-1.77944, -1.008037, -1.953678, 0, 0, 0, 1, 1,
-1.778347, 2.041094, -2.34628, 0, 0, 0, 1, 1,
-1.76876, 0.2098911, -2.576854, 1, 1, 1, 1, 1,
-1.766765, 0.05804802, -1.389556, 1, 1, 1, 1, 1,
-1.749001, -0.8268771, -2.83013, 1, 1, 1, 1, 1,
-1.734747, -0.798986, -1.016508, 1, 1, 1, 1, 1,
-1.730196, 0.3625521, -1.511191, 1, 1, 1, 1, 1,
-1.721244, -0.474351, -1.363486, 1, 1, 1, 1, 1,
-1.707279, -1.455899, -1.919464, 1, 1, 1, 1, 1,
-1.705631, -1.379495, -1.139413, 1, 1, 1, 1, 1,
-1.703118, -0.7510784, -1.233181, 1, 1, 1, 1, 1,
-1.696527, -2.298379, -1.759822, 1, 1, 1, 1, 1,
-1.690756, 1.162902, -1.047849, 1, 1, 1, 1, 1,
-1.681579, -0.03631195, -1.930251, 1, 1, 1, 1, 1,
-1.676563, -0.5820671, -4.033859, 1, 1, 1, 1, 1,
-1.674893, -0.5086775, -2.860577, 1, 1, 1, 1, 1,
-1.667419, -0.6362957, -2.384245, 1, 1, 1, 1, 1,
-1.665022, -2.269458, -2.803562, 0, 0, 1, 1, 1,
-1.646958, -0.9480687, -1.568128, 1, 0, 0, 1, 1,
-1.646114, 0.5785742, 0.001948665, 1, 0, 0, 1, 1,
-1.613198, -1.042425, -1.499256, 1, 0, 0, 1, 1,
-1.604327, 0.09294705, -1.741244, 1, 0, 0, 1, 1,
-1.579629, -0.1034746, 0.5282469, 1, 0, 0, 1, 1,
-1.575512, 0.8860077, 0.9950581, 0, 0, 0, 1, 1,
-1.568324, 1.518025, -1.768107, 0, 0, 0, 1, 1,
-1.552266, 0.6101044, -0.9768517, 0, 0, 0, 1, 1,
-1.543619, -0.04767873, -2.585269, 0, 0, 0, 1, 1,
-1.542777, 0.5221529, -0.260429, 0, 0, 0, 1, 1,
-1.537931, -0.5702863, -2.946058, 0, 0, 0, 1, 1,
-1.528593, -0.115272, -2.354779, 0, 0, 0, 1, 1,
-1.528084, -1.349845, -3.192876, 1, 1, 1, 1, 1,
-1.523685, 0.3146457, -0.7191011, 1, 1, 1, 1, 1,
-1.517379, -0.3361717, -2.791537, 1, 1, 1, 1, 1,
-1.513375, 0.3815126, -1.60162, 1, 1, 1, 1, 1,
-1.507422, -0.8170418, -1.002153, 1, 1, 1, 1, 1,
-1.493495, -0.7011052, -2.323485, 1, 1, 1, 1, 1,
-1.486067, -0.2799025, -2.950457, 1, 1, 1, 1, 1,
-1.475303, -0.5880055, -3.628376, 1, 1, 1, 1, 1,
-1.471146, -0.07239614, -1.056319, 1, 1, 1, 1, 1,
-1.463061, 0.1293, -1.21454, 1, 1, 1, 1, 1,
-1.452154, -0.9786839, -1.180832, 1, 1, 1, 1, 1,
-1.447496, -0.6338949, -2.007269, 1, 1, 1, 1, 1,
-1.441332, -2.329345, -1.05076, 1, 1, 1, 1, 1,
-1.439904, -0.09341805, -1.803223, 1, 1, 1, 1, 1,
-1.415024, -0.8248883, -1.43508, 1, 1, 1, 1, 1,
-1.407062, -1.679546, -3.424582, 0, 0, 1, 1, 1,
-1.403299, 0.1392933, -2.157371, 1, 0, 0, 1, 1,
-1.395144, -0.4802176, -2.836651, 1, 0, 0, 1, 1,
-1.387207, -1.023308, -2.889169, 1, 0, 0, 1, 1,
-1.372727, 1.242635, -1.995372, 1, 0, 0, 1, 1,
-1.365558, -0.3785522, -0.8070805, 1, 0, 0, 1, 1,
-1.360366, 0.0532145, -1.633829, 0, 0, 0, 1, 1,
-1.349836, -0.04340519, -1.393873, 0, 0, 0, 1, 1,
-1.345705, -0.8474046, -2.47516, 0, 0, 0, 1, 1,
-1.343888, -0.6592142, -3.378025, 0, 0, 0, 1, 1,
-1.32992, 0.01081072, -3.721973, 0, 0, 0, 1, 1,
-1.324548, -1.83814, -2.149855, 0, 0, 0, 1, 1,
-1.315607, 0.4985028, -0.9852425, 0, 0, 0, 1, 1,
-1.310477, -0.925998, -1.792957, 1, 1, 1, 1, 1,
-1.310403, -0.02624756, -2.215122, 1, 1, 1, 1, 1,
-1.30739, -0.9959118, -3.011838, 1, 1, 1, 1, 1,
-1.303733, 0.6157275, -2.188249, 1, 1, 1, 1, 1,
-1.300608, -0.9194589, -2.239317, 1, 1, 1, 1, 1,
-1.298961, 0.9740875, -1.915671, 1, 1, 1, 1, 1,
-1.295844, 1.219576, -1.040224, 1, 1, 1, 1, 1,
-1.294894, 1.093252, -1.707832, 1, 1, 1, 1, 1,
-1.2908, -0.3831037, -1.335333, 1, 1, 1, 1, 1,
-1.258345, -0.08054215, -1.735386, 1, 1, 1, 1, 1,
-1.252805, 0.8089821, -2.921591, 1, 1, 1, 1, 1,
-1.242781, 1.835828, -1.216807, 1, 1, 1, 1, 1,
-1.239596, -0.4755687, -1.511698, 1, 1, 1, 1, 1,
-1.237668, 0.6964909, -0.193239, 1, 1, 1, 1, 1,
-1.237436, 0.02830455, -1.264119, 1, 1, 1, 1, 1,
-1.23112, -0.6016701, 0.2036714, 0, 0, 1, 1, 1,
-1.227862, -0.04522616, -0.3927819, 1, 0, 0, 1, 1,
-1.223092, -0.6645244, -0.9890777, 1, 0, 0, 1, 1,
-1.219389, 0.5029991, -1.886295, 1, 0, 0, 1, 1,
-1.218581, 0.4618454, -1.55823, 1, 0, 0, 1, 1,
-1.193861, 0.8313775, 0.1866962, 1, 0, 0, 1, 1,
-1.189989, 0.2948573, -3.24369, 0, 0, 0, 1, 1,
-1.18802, 0.3473421, -0.3216855, 0, 0, 0, 1, 1,
-1.183187, 0.7476303, -1.728058, 0, 0, 0, 1, 1,
-1.178272, 0.2601853, -0.4262254, 0, 0, 0, 1, 1,
-1.178172, 0.09680448, -2.354562, 0, 0, 0, 1, 1,
-1.172647, -0.4641864, -3.585191, 0, 0, 0, 1, 1,
-1.15224, -1.660993, -1.233529, 0, 0, 0, 1, 1,
-1.14737, 0.7503982, -0.5691302, 1, 1, 1, 1, 1,
-1.146658, -1.637318, -2.152174, 1, 1, 1, 1, 1,
-1.144662, 2.012511, -0.9156751, 1, 1, 1, 1, 1,
-1.128432, 1.930054, -0.1653885, 1, 1, 1, 1, 1,
-1.118071, 1.64322, -1.566058, 1, 1, 1, 1, 1,
-1.11058, -0.4600459, -3.501305, 1, 1, 1, 1, 1,
-1.109316, 0.3586838, 0.3798056, 1, 1, 1, 1, 1,
-1.101548, 0.0889148, -1.400932, 1, 1, 1, 1, 1,
-1.086187, -1.145302, -1.957354, 1, 1, 1, 1, 1,
-1.08043, -0.108284, -0.6395875, 1, 1, 1, 1, 1,
-1.080139, 1.539272, 2.803912, 1, 1, 1, 1, 1,
-1.078957, -0.3643321, -0.3064992, 1, 1, 1, 1, 1,
-1.078203, -1.467474, -1.076755, 1, 1, 1, 1, 1,
-1.077122, -0.5271848, -1.628045, 1, 1, 1, 1, 1,
-1.076303, 0.1713643, -0.3929519, 1, 1, 1, 1, 1,
-1.071632, -1.975098, -1.644467, 0, 0, 1, 1, 1,
-1.068208, 1.447885, -1.062589, 1, 0, 0, 1, 1,
-1.066239, 0.5336387, -0.7368626, 1, 0, 0, 1, 1,
-1.06076, -0.2343913, -1.996522, 1, 0, 0, 1, 1,
-1.056074, -1.091608, -3.706824, 1, 0, 0, 1, 1,
-1.053592, 0.405091, -1.162643, 1, 0, 0, 1, 1,
-1.053235, 0.7291318, -1.473328, 0, 0, 0, 1, 1,
-1.051665, 0.2899246, -1.735461, 0, 0, 0, 1, 1,
-1.049046, 0.1470869, -1.843249, 0, 0, 0, 1, 1,
-1.045466, 1.029155, -0.150088, 0, 0, 0, 1, 1,
-1.043237, -2.27388, -4.624693, 0, 0, 0, 1, 1,
-1.038593, -1.062788, -1.336313, 0, 0, 0, 1, 1,
-1.035388, -1.038589, -0.5967698, 0, 0, 0, 1, 1,
-1.034226, 0.2063059, -0.5768524, 1, 1, 1, 1, 1,
-1.030784, -0.2595345, -1.033939, 1, 1, 1, 1, 1,
-1.027383, 0.2917517, -0.491998, 1, 1, 1, 1, 1,
-1.023878, 1.688787, 0.3359804, 1, 1, 1, 1, 1,
-1.017077, 1.457731, -1.335321, 1, 1, 1, 1, 1,
-1.017014, -0.1620543, -2.633836, 1, 1, 1, 1, 1,
-1.015887, -0.04224848, -1.767742, 1, 1, 1, 1, 1,
-1.009894, 1.060399, -0.1335056, 1, 1, 1, 1, 1,
-1.008935, -0.8245451, -1.733468, 1, 1, 1, 1, 1,
-1.008441, 1.399994, -1.435467, 1, 1, 1, 1, 1,
-1.003466, 0.6802216, -2.599004, 1, 1, 1, 1, 1,
-1.00321, 1.74872, -1.406839, 1, 1, 1, 1, 1,
-1.00178, -0.03828578, -0.02075509, 1, 1, 1, 1, 1,
-1.001086, 1.828797, -1.114718, 1, 1, 1, 1, 1,
-0.9930555, -1.12318, -3.385546, 1, 1, 1, 1, 1,
-0.9905471, 2.173443, 0.7693124, 0, 0, 1, 1, 1,
-0.985401, -1.869519, -1.880632, 1, 0, 0, 1, 1,
-0.9853595, -0.6025059, -2.98311, 1, 0, 0, 1, 1,
-0.984091, 1.947291, -1.243361, 1, 0, 0, 1, 1,
-0.979328, -0.8709944, 1.397805, 1, 0, 0, 1, 1,
-0.9699759, -0.4614767, -3.481493, 1, 0, 0, 1, 1,
-0.9649311, -1.525563, -3.649053, 0, 0, 0, 1, 1,
-0.9614055, 1.748911, -0.1155209, 0, 0, 0, 1, 1,
-0.9573601, 0.5165148, -1.89013, 0, 0, 0, 1, 1,
-0.9564334, -0.4343139, -1.909134, 0, 0, 0, 1, 1,
-0.9420375, -1.14617, -2.411355, 0, 0, 0, 1, 1,
-0.9391935, 0.2704829, -1.346655, 0, 0, 0, 1, 1,
-0.9388801, -2.425197, -1.076472, 0, 0, 0, 1, 1,
-0.9377158, 1.657177, -0.03029016, 1, 1, 1, 1, 1,
-0.9259484, 0.974529, -2.555192, 1, 1, 1, 1, 1,
-0.9226275, -0.9537587, -1.90469, 1, 1, 1, 1, 1,
-0.919229, -1.38975, -3.384506, 1, 1, 1, 1, 1,
-0.9172885, 0.8960041, -2.360461, 1, 1, 1, 1, 1,
-0.9150821, 0.2323173, -0.112853, 1, 1, 1, 1, 1,
-0.9118637, 1.544967, -0.7962204, 1, 1, 1, 1, 1,
-0.9107622, -0.6903797, -1.053187, 1, 1, 1, 1, 1,
-0.910706, -0.07765316, -1.063747, 1, 1, 1, 1, 1,
-0.9079766, -0.09690367, -1.025764, 1, 1, 1, 1, 1,
-0.9079673, 0.9010928, -1.728764, 1, 1, 1, 1, 1,
-0.9018993, -0.2904299, -3.210526, 1, 1, 1, 1, 1,
-0.8942056, 0.08455504, -1.308731, 1, 1, 1, 1, 1,
-0.8898381, 1.031655, 0.1008419, 1, 1, 1, 1, 1,
-0.885037, -0.05688448, -0.2714187, 1, 1, 1, 1, 1,
-0.8802726, 0.6304745, -0.7101024, 0, 0, 1, 1, 1,
-0.8790401, 0.1953088, -1.494506, 1, 0, 0, 1, 1,
-0.8783283, 0.7351641, -0.03024025, 1, 0, 0, 1, 1,
-0.8748593, -1.166187, -2.668575, 1, 0, 0, 1, 1,
-0.8739856, 0.60704, -1.639383, 1, 0, 0, 1, 1,
-0.8722208, 0.5226598, -0.5587165, 1, 0, 0, 1, 1,
-0.871331, 1.845793, -0.1622318, 0, 0, 0, 1, 1,
-0.8690856, -0.4683882, -3.59833, 0, 0, 0, 1, 1,
-0.8671443, 0.5708184, -1.851382, 0, 0, 0, 1, 1,
-0.8554572, 0.2830008, 0.8451164, 0, 0, 0, 1, 1,
-0.8530153, 0.3412795, -1.70832, 0, 0, 0, 1, 1,
-0.8511167, 0.1611383, -0.3067277, 0, 0, 0, 1, 1,
-0.8413674, -1.367804, -1.135524, 0, 0, 0, 1, 1,
-0.8412836, -0.8571601, -1.765872, 1, 1, 1, 1, 1,
-0.8367007, 0.2519529, -2.248005, 1, 1, 1, 1, 1,
-0.8298646, 0.3653332, 0.7792704, 1, 1, 1, 1, 1,
-0.8213648, -1.834067, -3.192686, 1, 1, 1, 1, 1,
-0.8185707, -0.8400204, -3.883422, 1, 1, 1, 1, 1,
-0.8165283, -1.208926, -2.231881, 1, 1, 1, 1, 1,
-0.8133914, 1.918372, -1.61323, 1, 1, 1, 1, 1,
-0.813351, -0.3149336, -1.984836, 1, 1, 1, 1, 1,
-0.8055534, -1.232556, -2.231226, 1, 1, 1, 1, 1,
-0.8046173, 0.1177503, -0.8374736, 1, 1, 1, 1, 1,
-0.8025888, -1.83081, -3.683531, 1, 1, 1, 1, 1,
-0.7951773, 0.4363658, -1.859072, 1, 1, 1, 1, 1,
-0.791199, 1.442407, 0.5078172, 1, 1, 1, 1, 1,
-0.790579, -1.349867, -2.269286, 1, 1, 1, 1, 1,
-0.7864964, 0.6840851, 0.1283486, 1, 1, 1, 1, 1,
-0.7834471, -0.4454121, -0.8387944, 0, 0, 1, 1, 1,
-0.7809642, 1.469037, -0.8632683, 1, 0, 0, 1, 1,
-0.7755359, -1.062312, -4.975626, 1, 0, 0, 1, 1,
-0.7749484, -1.176827, -3.134239, 1, 0, 0, 1, 1,
-0.7709346, -1.877067, -3.222078, 1, 0, 0, 1, 1,
-0.7707448, 0.09170809, -1.377019, 1, 0, 0, 1, 1,
-0.7701029, 0.04487325, -2.18167, 0, 0, 0, 1, 1,
-0.7696924, 0.03880543, -0.4340472, 0, 0, 0, 1, 1,
-0.7695404, 1.504807, -1.068339, 0, 0, 0, 1, 1,
-0.7669914, 2.265649, -0.05688898, 0, 0, 0, 1, 1,
-0.7664778, 0.2730775, -0.1539476, 0, 0, 0, 1, 1,
-0.7663487, 0.4791534, -0.09750161, 0, 0, 0, 1, 1,
-0.7569246, 1.497414, -0.08695343, 0, 0, 0, 1, 1,
-0.7509615, 1.697839, 0.5033736, 1, 1, 1, 1, 1,
-0.7501715, -0.1468437, -2.887145, 1, 1, 1, 1, 1,
-0.7475357, -1.484806, -3.934701, 1, 1, 1, 1, 1,
-0.7427129, 0.4466958, -2.255308, 1, 1, 1, 1, 1,
-0.7314283, -0.316851, -0.9141686, 1, 1, 1, 1, 1,
-0.7190221, -0.8164608, -3.604783, 1, 1, 1, 1, 1,
-0.7149256, 0.5338099, -2.199921, 1, 1, 1, 1, 1,
-0.7131962, -0.1889684, -2.766087, 1, 1, 1, 1, 1,
-0.7015793, 0.3120544, 0.0657518, 1, 1, 1, 1, 1,
-0.6985867, 0.5797117, -0.2585739, 1, 1, 1, 1, 1,
-0.6916077, 0.1411547, -1.060296, 1, 1, 1, 1, 1,
-0.6875254, 0.6558894, 0.7942063, 1, 1, 1, 1, 1,
-0.6862047, -0.1745017, -2.095238, 1, 1, 1, 1, 1,
-0.6815336, -1.331223, -2.267993, 1, 1, 1, 1, 1,
-0.6791207, -1.20236, -2.481106, 1, 1, 1, 1, 1,
-0.6777969, -0.6233251, -1.576066, 0, 0, 1, 1, 1,
-0.6776773, -1.472534, -4.72532, 1, 0, 0, 1, 1,
-0.6757049, 0.2696444, -2.956281, 1, 0, 0, 1, 1,
-0.6748545, -0.7890516, -2.158358, 1, 0, 0, 1, 1,
-0.6661456, -0.385211, -1.537871, 1, 0, 0, 1, 1,
-0.6660278, 1.400554, -0.1171186, 1, 0, 0, 1, 1,
-0.6629161, -1.288212, -1.419914, 0, 0, 0, 1, 1,
-0.6602496, 0.5610804, 0.3210103, 0, 0, 0, 1, 1,
-0.6589348, 0.648243, -1.942371, 0, 0, 0, 1, 1,
-0.6585166, -0.2988323, -4.359335, 0, 0, 0, 1, 1,
-0.6584808, 0.5972175, -1.985521, 0, 0, 0, 1, 1,
-0.6580557, -0.6961837, -2.366202, 0, 0, 0, 1, 1,
-0.6550565, 1.631424, 1.370875, 0, 0, 0, 1, 1,
-0.6537597, -0.1709304, -2.346419, 1, 1, 1, 1, 1,
-0.6534223, -0.4801364, 0.3768255, 1, 1, 1, 1, 1,
-0.6490837, 1.643878, 0.2041376, 1, 1, 1, 1, 1,
-0.637395, 0.341247, -2.107053, 1, 1, 1, 1, 1,
-0.6367675, 0.5733052, -0.03580238, 1, 1, 1, 1, 1,
-0.6335722, 1.963503, -1.199418, 1, 1, 1, 1, 1,
-0.6321069, 1.297684, -0.1721004, 1, 1, 1, 1, 1,
-0.6231611, 0.8088048, 0.810529, 1, 1, 1, 1, 1,
-0.6164544, -0.244866, -0.6585606, 1, 1, 1, 1, 1,
-0.6141575, 0.9775727, 0.01670679, 1, 1, 1, 1, 1,
-0.6138145, 2.643584, -0.3274221, 1, 1, 1, 1, 1,
-0.6110243, 0.1964872, -0.7070158, 1, 1, 1, 1, 1,
-0.6098757, -0.8124893, -4.306439, 1, 1, 1, 1, 1,
-0.6094112, -1.326777, -1.483865, 1, 1, 1, 1, 1,
-0.6028363, 0.1234564, -3.910305, 1, 1, 1, 1, 1,
-0.6018459, -0.1449208, -0.5085097, 0, 0, 1, 1, 1,
-0.5967001, -0.06574874, -3.127924, 1, 0, 0, 1, 1,
-0.595008, -0.9302123, -2.296369, 1, 0, 0, 1, 1,
-0.5926337, 0.2577985, -1.160081, 1, 0, 0, 1, 1,
-0.5904434, 0.3149312, 0.9830046, 1, 0, 0, 1, 1,
-0.579199, 0.1408872, -1.23395, 1, 0, 0, 1, 1,
-0.5768993, 0.2597873, -1.430285, 0, 0, 0, 1, 1,
-0.5758458, -1.225673, -2.29314, 0, 0, 0, 1, 1,
-0.5692366, 0.3091972, -0.6441078, 0, 0, 0, 1, 1,
-0.5635685, 0.3849392, 0.5630149, 0, 0, 0, 1, 1,
-0.5598853, -1.621944, -4.438255, 0, 0, 0, 1, 1,
-0.5582821, -0.531035, -2.409145, 0, 0, 0, 1, 1,
-0.5577047, 0.843549, -1.065197, 0, 0, 0, 1, 1,
-0.5469041, 1.004099, 0.8316925, 1, 1, 1, 1, 1,
-0.5394895, -1.010115, -3.172371, 1, 1, 1, 1, 1,
-0.5336292, 0.3601983, -0.9933863, 1, 1, 1, 1, 1,
-0.5330897, 0.3239665, -2.043789, 1, 1, 1, 1, 1,
-0.5319085, -0.1167956, -2.307334, 1, 1, 1, 1, 1,
-0.530971, 0.3034591, -0.2556497, 1, 1, 1, 1, 1,
-0.529944, -0.8067875, -2.899344, 1, 1, 1, 1, 1,
-0.5293479, -1.181509, -1.785744, 1, 1, 1, 1, 1,
-0.5201719, -0.6506858, -1.848583, 1, 1, 1, 1, 1,
-0.5177901, -0.9757757, -1.42856, 1, 1, 1, 1, 1,
-0.5175676, 0.8081143, -0.08672404, 1, 1, 1, 1, 1,
-0.5163224, 0.185468, 0.5113412, 1, 1, 1, 1, 1,
-0.5144567, 0.4841262, -2.3313, 1, 1, 1, 1, 1,
-0.5117565, 0.6461698, -0.7859005, 1, 1, 1, 1, 1,
-0.5066208, 0.6190937, -1.206729, 1, 1, 1, 1, 1,
-0.5063968, 0.1977224, -0.008242688, 0, 0, 1, 1, 1,
-0.502117, 1.352244, -1.07163, 1, 0, 0, 1, 1,
-0.4972761, 2.237405, 0.4648528, 1, 0, 0, 1, 1,
-0.4966083, 0.8106485, -0.9956854, 1, 0, 0, 1, 1,
-0.4963459, 1.687504, -0.3026613, 1, 0, 0, 1, 1,
-0.4958569, 1.741571, -1.048832, 1, 0, 0, 1, 1,
-0.4955806, -1.365344, -3.007186, 0, 0, 0, 1, 1,
-0.491313, 1.085498, -2.19322, 0, 0, 0, 1, 1,
-0.4822879, -0.7721511, -1.501034, 0, 0, 0, 1, 1,
-0.4777525, 1.013424, -2.170451, 0, 0, 0, 1, 1,
-0.4769911, -0.2511426, -0.5080377, 0, 0, 0, 1, 1,
-0.4744819, -0.0231953, -0.6659998, 0, 0, 0, 1, 1,
-0.4735381, 0.2860267, -1.200871, 0, 0, 0, 1, 1,
-0.4725763, -0.3591612, -1.85742, 1, 1, 1, 1, 1,
-0.4676396, -0.4022965, -2.93291, 1, 1, 1, 1, 1,
-0.4671564, 0.8032734, -1.090755, 1, 1, 1, 1, 1,
-0.4665051, 0.4531038, -0.339834, 1, 1, 1, 1, 1,
-0.4635418, 1.313002, -0.5454772, 1, 1, 1, 1, 1,
-0.4634177, -0.2089604, -1.108472, 1, 1, 1, 1, 1,
-0.4627023, -0.7785661, -0.3556401, 1, 1, 1, 1, 1,
-0.4626685, 0.7763798, -0.5097258, 1, 1, 1, 1, 1,
-0.4616098, -0.5369074, -1.842904, 1, 1, 1, 1, 1,
-0.4528815, 0.310091, -2.085938, 1, 1, 1, 1, 1,
-0.44988, -0.965476, -2.35225, 1, 1, 1, 1, 1,
-0.4488955, 0.4814151, 0.1614082, 1, 1, 1, 1, 1,
-0.4464964, -0.2943807, -3.459773, 1, 1, 1, 1, 1,
-0.4446985, -1.974017, -2.421261, 1, 1, 1, 1, 1,
-0.4374352, 1.239264, 0.4573847, 1, 1, 1, 1, 1,
-0.4329376, 0.6805561, -0.2168033, 0, 0, 1, 1, 1,
-0.4281721, 0.2133435, -2.298847, 1, 0, 0, 1, 1,
-0.4263477, 2.702349, 0.7383921, 1, 0, 0, 1, 1,
-0.4234206, 0.55138, -0.8991261, 1, 0, 0, 1, 1,
-0.4209265, 0.6135085, -0.45216, 1, 0, 0, 1, 1,
-0.4179718, 0.380536, -2.235639, 1, 0, 0, 1, 1,
-0.4128266, -1.198533, -3.426089, 0, 0, 0, 1, 1,
-0.4126101, 0.6866849, -0.4044471, 0, 0, 0, 1, 1,
-0.4089783, -0.3189251, -1.246565, 0, 0, 0, 1, 1,
-0.4053997, 0.680742, -1.100517, 0, 0, 0, 1, 1,
-0.4006184, 0.2189877, -2.484561, 0, 0, 0, 1, 1,
-0.4005262, -0.6650393, -2.729212, 0, 0, 0, 1, 1,
-0.399049, 2.018498, 0.5803331, 0, 0, 0, 1, 1,
-0.3969063, -0.6336355, -4.029638, 1, 1, 1, 1, 1,
-0.3956908, -1.479218, -3.453052, 1, 1, 1, 1, 1,
-0.389065, 1.516294, 1.197063, 1, 1, 1, 1, 1,
-0.3869457, -0.649591, -2.004006, 1, 1, 1, 1, 1,
-0.3867103, -0.6835942, -2.057596, 1, 1, 1, 1, 1,
-0.3799648, -0.6933055, -2.455524, 1, 1, 1, 1, 1,
-0.3748313, -1.22942, -3.272509, 1, 1, 1, 1, 1,
-0.3715965, -0.6099951, -3.03809, 1, 1, 1, 1, 1,
-0.3709355, -1.112736, -0.5369693, 1, 1, 1, 1, 1,
-0.3694072, 0.7900646, -0.5650569, 1, 1, 1, 1, 1,
-0.3682317, 0.8657521, -1.479432, 1, 1, 1, 1, 1,
-0.3669729, -0.2020761, -1.83712, 1, 1, 1, 1, 1,
-0.3668461, 1.041866, -2.92561, 1, 1, 1, 1, 1,
-0.3658516, 0.8331981, -1.905858, 1, 1, 1, 1, 1,
-0.3645774, 1.362831, -2.643982, 1, 1, 1, 1, 1,
-0.3618512, -0.5182734, -2.097695, 0, 0, 1, 1, 1,
-0.3562863, 0.1934156, -0.7374887, 1, 0, 0, 1, 1,
-0.3556291, 1.020633, -0.6630818, 1, 0, 0, 1, 1,
-0.3534648, 0.3389733, -1.307349, 1, 0, 0, 1, 1,
-0.3513103, 2.342022, -0.5966028, 1, 0, 0, 1, 1,
-0.345165, -0.8848037, -0.8213636, 1, 0, 0, 1, 1,
-0.3312682, -0.4125229, -1.954, 0, 0, 0, 1, 1,
-0.3311608, 0.5228339, -1.308388, 0, 0, 0, 1, 1,
-0.3266478, 0.377263, -4.01027, 0, 0, 0, 1, 1,
-0.3247276, 1.737422, 0.9956207, 0, 0, 0, 1, 1,
-0.321428, 0.3217334, -0.5664957, 0, 0, 0, 1, 1,
-0.3195228, -0.6021927, -2.467568, 0, 0, 0, 1, 1,
-0.3194785, -0.7515044, -1.797966, 0, 0, 0, 1, 1,
-0.3192243, 0.005175456, -2.271325, 1, 1, 1, 1, 1,
-0.3173697, 0.0141801, -0.06970809, 1, 1, 1, 1, 1,
-0.314692, 0.3968459, 1.574293, 1, 1, 1, 1, 1,
-0.3134113, 1.614622, -0.1284917, 1, 1, 1, 1, 1,
-0.3058795, -0.4529626, -1.464016, 1, 1, 1, 1, 1,
-0.305379, 0.2061319, -1.516833, 1, 1, 1, 1, 1,
-0.304608, -0.09158356, -0.8881074, 1, 1, 1, 1, 1,
-0.3022194, 1.539954, 0.8873354, 1, 1, 1, 1, 1,
-0.2998222, -1.262449, -3.548745, 1, 1, 1, 1, 1,
-0.2953537, 1.892985, -1.987451, 1, 1, 1, 1, 1,
-0.2911007, -0.6854166, -2.790347, 1, 1, 1, 1, 1,
-0.2906595, 0.860693, -2.001246, 1, 1, 1, 1, 1,
-0.2901961, -0.1307301, -2.518392, 1, 1, 1, 1, 1,
-0.2891808, -1.206892, -3.630558, 1, 1, 1, 1, 1,
-0.2882446, 0.8350899, -0.2317438, 1, 1, 1, 1, 1,
-0.2861082, 1.530687, 0.05934811, 0, 0, 1, 1, 1,
-0.286046, -0.07500534, -0.4249255, 1, 0, 0, 1, 1,
-0.2808905, -2.034915, -1.329154, 1, 0, 0, 1, 1,
-0.2804832, -0.06429854, -0.1706674, 1, 0, 0, 1, 1,
-0.2783906, 1.7065, -0.8420801, 1, 0, 0, 1, 1,
-0.276702, 0.1965377, -1.353773, 1, 0, 0, 1, 1,
-0.2759623, -0.5577515, -2.169892, 0, 0, 0, 1, 1,
-0.2712694, 0.3538845, 1.419074, 0, 0, 0, 1, 1,
-0.2704746, -0.3342546, -2.021091, 0, 0, 0, 1, 1,
-0.2642232, 1.475333, -2.35197, 0, 0, 0, 1, 1,
-0.2640564, -0.3739547, -3.584499, 0, 0, 0, 1, 1,
-0.2611378, -0.0653377, -2.098193, 0, 0, 0, 1, 1,
-0.2608162, -0.1232809, -2.046265, 0, 0, 0, 1, 1,
-0.2553411, -1.973858, -1.215672, 1, 1, 1, 1, 1,
-0.2533387, 0.2549022, -1.302327, 1, 1, 1, 1, 1,
-0.2517498, -0.3964254, -3.362726, 1, 1, 1, 1, 1,
-0.251095, -1.710245, -4.565228, 1, 1, 1, 1, 1,
-0.2486683, -0.01186404, -2.803084, 1, 1, 1, 1, 1,
-0.2477602, 0.5097035, -1.702814, 1, 1, 1, 1, 1,
-0.2404161, -0.7729864, -4.8184, 1, 1, 1, 1, 1,
-0.2354836, 0.6495225, -1.763321, 1, 1, 1, 1, 1,
-0.2307755, -0.4703332, -1.131057, 1, 1, 1, 1, 1,
-0.2279948, -0.08064952, -3.031368, 1, 1, 1, 1, 1,
-0.2246689, -0.3579759, -2.57214, 1, 1, 1, 1, 1,
-0.2241635, -1.86104, -2.107737, 1, 1, 1, 1, 1,
-0.2229969, 0.8485255, -1.311355, 1, 1, 1, 1, 1,
-0.2191586, -1.866673, -2.088359, 1, 1, 1, 1, 1,
-0.218704, 1.949374, -0.592478, 1, 1, 1, 1, 1,
-0.2160632, -0.3863652, -4.026022, 0, 0, 1, 1, 1,
-0.2136266, 0.8499828, -0.5108805, 1, 0, 0, 1, 1,
-0.2118396, 0.1577719, -1.894982, 1, 0, 0, 1, 1,
-0.2111129, 1.08887, 0.2122983, 1, 0, 0, 1, 1,
-0.2107838, 0.7440789, -2.303559, 1, 0, 0, 1, 1,
-0.209535, 1.260848, -0.492995, 1, 0, 0, 1, 1,
-0.2080785, 0.07103699, -1.584157, 0, 0, 0, 1, 1,
-0.2073215, 0.4417657, 0.688862, 0, 0, 0, 1, 1,
-0.2069961, 1.423084, 0.02274428, 0, 0, 0, 1, 1,
-0.2056206, 0.3665942, 0.1406918, 0, 0, 0, 1, 1,
-0.2036935, -1.388496, -1.101766, 0, 0, 0, 1, 1,
-0.2018616, 0.09018648, -1.348132, 0, 0, 0, 1, 1,
-0.1995009, 0.2153894, -0.04446387, 0, 0, 0, 1, 1,
-0.1990266, -0.1801861, -3.922743, 1, 1, 1, 1, 1,
-0.1935894, 1.463117, 0.4475263, 1, 1, 1, 1, 1,
-0.189225, -0.09353503, -1.708992, 1, 1, 1, 1, 1,
-0.1845804, -0.6703523, -2.828768, 1, 1, 1, 1, 1,
-0.1815179, 1.853828, 1.72135, 1, 1, 1, 1, 1,
-0.1803895, 0.9650059, 1.648996, 1, 1, 1, 1, 1,
-0.1801464, -1.031236, -3.349632, 1, 1, 1, 1, 1,
-0.1799678, -1.296735, -2.148427, 1, 1, 1, 1, 1,
-0.1776925, 0.7116978, 0.2604385, 1, 1, 1, 1, 1,
-0.1744953, 0.0127095, -3.295074, 1, 1, 1, 1, 1,
-0.1731746, 0.3871531, 0.9584625, 1, 1, 1, 1, 1,
-0.172185, -1.422615, -4.140996, 1, 1, 1, 1, 1,
-0.1720526, -1.980408, -3.234859, 1, 1, 1, 1, 1,
-0.1707813, 0.9966077, -2.13222, 1, 1, 1, 1, 1,
-0.1694754, -0.05688037, -1.438219, 1, 1, 1, 1, 1,
-0.168318, 0.4562757, -1.167197, 0, 0, 1, 1, 1,
-0.1669727, -1.067558, -2.292828, 1, 0, 0, 1, 1,
-0.1665075, 1.390882, 0.5383382, 1, 0, 0, 1, 1,
-0.1648899, -0.339879, -3.755029, 1, 0, 0, 1, 1,
-0.1591647, -0.6596186, -2.369995, 1, 0, 0, 1, 1,
-0.1539744, -0.1977268, -1.098388, 1, 0, 0, 1, 1,
-0.1538606, 0.7652546, -1.422608, 0, 0, 0, 1, 1,
-0.1525731, 0.3144283, 0.655947, 0, 0, 0, 1, 1,
-0.1503319, 0.04907379, -0.5529251, 0, 0, 0, 1, 1,
-0.1472621, -0.4222328, -3.153286, 0, 0, 0, 1, 1,
-0.1467732, -1.219456, -5.021746, 0, 0, 0, 1, 1,
-0.1457625, 1.09583, -0.8771616, 0, 0, 0, 1, 1,
-0.1445555, -0.5218148, -3.121377, 0, 0, 0, 1, 1,
-0.1426153, -0.3562589, -2.621635, 1, 1, 1, 1, 1,
-0.1410504, 0.05283263, -1.03066, 1, 1, 1, 1, 1,
-0.1383833, 1.151184, -1.322723, 1, 1, 1, 1, 1,
-0.138131, 0.5058454, 0.161481, 1, 1, 1, 1, 1,
-0.1353956, 0.1007946, -0.3782275, 1, 1, 1, 1, 1,
-0.1348657, -2.175804, -2.308684, 1, 1, 1, 1, 1,
-0.1280046, 0.1329263, -0.8055775, 1, 1, 1, 1, 1,
-0.1257424, -0.812436, -3.458889, 1, 1, 1, 1, 1,
-0.1246828, -0.005826142, -0.939923, 1, 1, 1, 1, 1,
-0.1215687, 0.1565621, -0.9601674, 1, 1, 1, 1, 1,
-0.1214707, 0.2714566, 0.8058279, 1, 1, 1, 1, 1,
-0.1195474, -0.5944918, -3.341143, 1, 1, 1, 1, 1,
-0.117961, -0.1856244, -2.731833, 1, 1, 1, 1, 1,
-0.1151465, 0.6197545, -0.7626642, 1, 1, 1, 1, 1,
-0.1136135, -1.408878, -3.291514, 1, 1, 1, 1, 1,
-0.1076539, 0.1160166, -1.560188, 0, 0, 1, 1, 1,
-0.1045717, -0.4759065, -3.791924, 1, 0, 0, 1, 1,
-0.1035697, -1.02334, -2.182061, 1, 0, 0, 1, 1,
-0.1031145, 0.2388869, -0.1157371, 1, 0, 0, 1, 1,
-0.09931617, 0.7080827, -0.2595432, 1, 0, 0, 1, 1,
-0.09909174, 2.640364, 0.2149613, 1, 0, 0, 1, 1,
-0.09880675, 1.442994, -0.4466705, 0, 0, 0, 1, 1,
-0.09873032, -0.01525279, -2.535174, 0, 0, 0, 1, 1,
-0.09594288, 0.7374053, -0.1675052, 0, 0, 0, 1, 1,
-0.0912461, 1.724378, 1.351181, 0, 0, 0, 1, 1,
-0.0907982, -0.2199225, -1.848038, 0, 0, 0, 1, 1,
-0.0877023, 0.7929609, -0.2847534, 0, 0, 0, 1, 1,
-0.08269519, 1.325744, 1.182913, 0, 0, 0, 1, 1,
-0.08195885, 0.3059551, -0.8586468, 1, 1, 1, 1, 1,
-0.08070295, 0.1520341, -0.9165409, 1, 1, 1, 1, 1,
-0.07598247, -1.063759, -4.487271, 1, 1, 1, 1, 1,
-0.07323217, -0.3647806, -4.44944, 1, 1, 1, 1, 1,
-0.07150909, 0.0817144, -0.6511422, 1, 1, 1, 1, 1,
-0.0702967, -0.1282273, -3.035659, 1, 1, 1, 1, 1,
-0.06594977, 1.270362, 1.078224, 1, 1, 1, 1, 1,
-0.06033514, -0.9318389, -3.347858, 1, 1, 1, 1, 1,
-0.05889931, -1.155117, -3.199385, 1, 1, 1, 1, 1,
-0.05752924, 0.9173733, -1.289202, 1, 1, 1, 1, 1,
-0.05420886, -0.0796183, -3.1603, 1, 1, 1, 1, 1,
-0.05353305, 1.284447, 0.3169852, 1, 1, 1, 1, 1,
-0.05261905, -0.2028301, -2.976, 1, 1, 1, 1, 1,
-0.05232597, 0.4146353, -0.4346907, 1, 1, 1, 1, 1,
-0.04871129, -0.7180064, -3.387729, 1, 1, 1, 1, 1,
-0.04514851, 0.4445641, 1.551441, 0, 0, 1, 1, 1,
-0.04464485, 0.9343369, 1.20965, 1, 0, 0, 1, 1,
-0.04358243, 0.06515485, -1.87818, 1, 0, 0, 1, 1,
-0.03868797, -0.2497842, -3.357638, 1, 0, 0, 1, 1,
-0.03771204, -0.1140551, -2.435777, 1, 0, 0, 1, 1,
-0.03360172, -0.7529165, -4.345051, 1, 0, 0, 1, 1,
-0.03258013, -1.933357, -3.548629, 0, 0, 0, 1, 1,
-0.03161307, 0.320668, -1.137695, 0, 0, 0, 1, 1,
-0.02987311, 0.7836024, 1.43223, 0, 0, 0, 1, 1,
-0.02905428, 1.315522, -0.9855465, 0, 0, 0, 1, 1,
-0.0230071, 1.027023, -1.25118, 0, 0, 0, 1, 1,
-0.0126611, -2.06206, -1.447371, 0, 0, 0, 1, 1,
-0.01232788, -1.35971, -1.537724, 0, 0, 0, 1, 1,
-0.008124002, -1.338531, -2.229373, 1, 1, 1, 1, 1,
-0.005071036, 0.08173295, 0.2947182, 1, 1, 1, 1, 1,
-0.003368916, 0.3568681, -1.29188, 1, 1, 1, 1, 1,
0.008249944, -0.3725395, 3.063167, 1, 1, 1, 1, 1,
0.008275201, -0.4522536, 3.14045, 1, 1, 1, 1, 1,
0.01041927, -1.066082, 2.084087, 1, 1, 1, 1, 1,
0.01265177, -1.072277, 2.985733, 1, 1, 1, 1, 1,
0.0141172, -0.06051437, 2.209315, 1, 1, 1, 1, 1,
0.01810892, -0.593987, 5.13881, 1, 1, 1, 1, 1,
0.0183279, -0.6234626, 3.512662, 1, 1, 1, 1, 1,
0.024286, 0.7339845, 1.4985, 1, 1, 1, 1, 1,
0.02431029, 2.297914, 0.09257209, 1, 1, 1, 1, 1,
0.02569483, -1.388019, 1.080017, 1, 1, 1, 1, 1,
0.02713618, -0.01318044, 2.643567, 1, 1, 1, 1, 1,
0.02800491, -0.9752949, 4.838452, 1, 1, 1, 1, 1,
0.0285218, 1.0231, 0.2514102, 0, 0, 1, 1, 1,
0.0291897, -0.246347, 2.001565, 1, 0, 0, 1, 1,
0.02980097, -0.2548136, 2.911835, 1, 0, 0, 1, 1,
0.03070974, -0.7708831, 1.597636, 1, 0, 0, 1, 1,
0.03526465, -0.7269389, 0.7654196, 1, 0, 0, 1, 1,
0.03783458, 0.5036567, 1.503374, 1, 0, 0, 1, 1,
0.03877923, -0.08079168, 2.256681, 0, 0, 0, 1, 1,
0.03886474, -0.1844117, 4.188688, 0, 0, 0, 1, 1,
0.04134785, -1.815586, 2.977783, 0, 0, 0, 1, 1,
0.04311935, 1.13646, -1.462923, 0, 0, 0, 1, 1,
0.04433417, -0.884288, 3.279144, 0, 0, 0, 1, 1,
0.0482951, -0.961855, 2.431813, 0, 0, 0, 1, 1,
0.04960443, 1.253073, -0.6420564, 0, 0, 0, 1, 1,
0.05335953, -1.274716, 3.829026, 1, 1, 1, 1, 1,
0.05446024, -0.9027977, 3.716497, 1, 1, 1, 1, 1,
0.05781379, -0.1783778, 0.9831492, 1, 1, 1, 1, 1,
0.06166349, 0.01862706, 1.406193, 1, 1, 1, 1, 1,
0.07027253, -0.5461394, 3.818939, 1, 1, 1, 1, 1,
0.07297639, 0.6379974, -0.7548081, 1, 1, 1, 1, 1,
0.07379822, -0.2512737, 4.016848, 1, 1, 1, 1, 1,
0.0759496, 0.2044638, 1.560823, 1, 1, 1, 1, 1,
0.0788235, 1.670564, -0.2720345, 1, 1, 1, 1, 1,
0.08256937, -0.6096408, 5.737123, 1, 1, 1, 1, 1,
0.08377231, -0.3683417, 3.556957, 1, 1, 1, 1, 1,
0.08512065, -1.138143, 3.53847, 1, 1, 1, 1, 1,
0.08924451, -1.466663, 2.101574, 1, 1, 1, 1, 1,
0.09013534, 0.3906899, -0.1364955, 1, 1, 1, 1, 1,
0.09140436, 0.5399757, -0.5463547, 1, 1, 1, 1, 1,
0.09579372, 2.212376, 0.02231347, 0, 0, 1, 1, 1,
0.1048129, -0.3225352, 3.16752, 1, 0, 0, 1, 1,
0.1058223, 0.7332189, 0.1310418, 1, 0, 0, 1, 1,
0.1059852, -1.17132, 1.770246, 1, 0, 0, 1, 1,
0.1106055, 0.4457861, -1.093957, 1, 0, 0, 1, 1,
0.1123436, -1.173327, 2.865339, 1, 0, 0, 1, 1,
0.1172154, 1.653521, -0.5536153, 0, 0, 0, 1, 1,
0.1179959, 0.4393999, -0.2540743, 0, 0, 0, 1, 1,
0.1211723, -0.7149162, 2.264034, 0, 0, 0, 1, 1,
0.1231546, 0.481137, -0.3651521, 0, 0, 0, 1, 1,
0.1301166, 0.01037288, 2.37948, 0, 0, 0, 1, 1,
0.1312456, 0.7216887, 0.7693122, 0, 0, 0, 1, 1,
0.1312844, -1.690258, 2.526303, 0, 0, 0, 1, 1,
0.1340784, 0.4445951, -0.9886307, 1, 1, 1, 1, 1,
0.1341682, 0.8479277, -0.4158885, 1, 1, 1, 1, 1,
0.1378487, 1.716538, -0.08868211, 1, 1, 1, 1, 1,
0.1407227, 0.4437834, 0.1365286, 1, 1, 1, 1, 1,
0.1410483, -0.5754887, 1.789026, 1, 1, 1, 1, 1,
0.1491346, 0.4872247, 0.835964, 1, 1, 1, 1, 1,
0.1549798, -0.9865894, 3.723547, 1, 1, 1, 1, 1,
0.155914, 1.508686, -1.873654, 1, 1, 1, 1, 1,
0.1636339, -0.1226682, 1.602122, 1, 1, 1, 1, 1,
0.1647236, 0.7329302, -0.2914974, 1, 1, 1, 1, 1,
0.166301, -2.367482, 4.446992, 1, 1, 1, 1, 1,
0.1729617, -0.3556845, 3.666907, 1, 1, 1, 1, 1,
0.1804176, 1.145836, -1.068536, 1, 1, 1, 1, 1,
0.1838007, 1.318524, 1.167707, 1, 1, 1, 1, 1,
0.1854342, 0.4871372, 0.9862944, 1, 1, 1, 1, 1,
0.1861447, 1.017537, 0.0228041, 0, 0, 1, 1, 1,
0.1894198, -1.281938, 4.985561, 1, 0, 0, 1, 1,
0.1951806, -1.768276, 2.400081, 1, 0, 0, 1, 1,
0.1965436, -0.7713125, 2.600817, 1, 0, 0, 1, 1,
0.2006349, 0.9543356, 0.7295163, 1, 0, 0, 1, 1,
0.2033335, -0.7290398, 2.248281, 1, 0, 0, 1, 1,
0.2044555, 0.4826888, 1.032757, 0, 0, 0, 1, 1,
0.2058015, 0.7550793, -0.7841809, 0, 0, 0, 1, 1,
0.2094593, 0.02232676, 0.7271058, 0, 0, 0, 1, 1,
0.2098223, -1.118943, 2.601545, 0, 0, 0, 1, 1,
0.2100357, -1.664061, 2.719914, 0, 0, 0, 1, 1,
0.2112761, 0.6559302, 0.9851963, 0, 0, 0, 1, 1,
0.2133474, 0.3437574, -1.495888, 0, 0, 0, 1, 1,
0.2166806, -1.658051, 4.360939, 1, 1, 1, 1, 1,
0.2210493, 1.86862, -0.8192757, 1, 1, 1, 1, 1,
0.2220088, -0.5526241, 3.236105, 1, 1, 1, 1, 1,
0.2273701, -1.042223, 2.953513, 1, 1, 1, 1, 1,
0.2275584, 0.6563217, 1.15357, 1, 1, 1, 1, 1,
0.2332583, -0.872382, 2.581872, 1, 1, 1, 1, 1,
0.2367406, -0.7615672, 1.25924, 1, 1, 1, 1, 1,
0.2417607, -0.5506114, 3.167538, 1, 1, 1, 1, 1,
0.2508819, 0.225458, -0.2079094, 1, 1, 1, 1, 1,
0.2522567, 1.587862, -0.5503713, 1, 1, 1, 1, 1,
0.2525515, -0.1625751, 1.928445, 1, 1, 1, 1, 1,
0.2539133, 0.2284398, -0.09191408, 1, 1, 1, 1, 1,
0.254938, 0.6468256, -0.7249981, 1, 1, 1, 1, 1,
0.2550784, 0.2797401, -0.5451845, 1, 1, 1, 1, 1,
0.255991, -0.7539545, 4.180678, 1, 1, 1, 1, 1,
0.2569267, -1.468814, 3.165496, 0, 0, 1, 1, 1,
0.257641, -0.4205793, 4.909915, 1, 0, 0, 1, 1,
0.2593474, 1.668421, -0.9079689, 1, 0, 0, 1, 1,
0.2603467, 1.051088, -1.162144, 1, 0, 0, 1, 1,
0.2647739, 1.13731, -1.162638, 1, 0, 0, 1, 1,
0.26676, 0.1827493, 0.06584699, 1, 0, 0, 1, 1,
0.2695015, -0.6482517, 2.973387, 0, 0, 0, 1, 1,
0.2771686, -1.941579, 4.614657, 0, 0, 0, 1, 1,
0.2776753, -0.5957477, 4.251258, 0, 0, 0, 1, 1,
0.2791597, -0.00228976, 2.104846, 0, 0, 0, 1, 1,
0.2793082, 0.9943218, 1.093673, 0, 0, 0, 1, 1,
0.2811394, 0.9202704, -1.674058, 0, 0, 0, 1, 1,
0.2871, 0.904856, -1.495438, 0, 0, 0, 1, 1,
0.3013768, 0.2491746, 1.391591, 1, 1, 1, 1, 1,
0.3093038, -0.3289844, 1.865207, 1, 1, 1, 1, 1,
0.3170922, -2.718745, 3.745482, 1, 1, 1, 1, 1,
0.3194998, 1.323738, 0.03658481, 1, 1, 1, 1, 1,
0.3201213, 0.7410319, -0.309682, 1, 1, 1, 1, 1,
0.3217005, -0.9231007, 3.516188, 1, 1, 1, 1, 1,
0.3234477, -0.03457507, 0.6422009, 1, 1, 1, 1, 1,
0.3275656, -0.05908702, 1.940145, 1, 1, 1, 1, 1,
0.3334754, 0.3870899, 2.775359, 1, 1, 1, 1, 1,
0.3335139, 1.787925, 0.0129793, 1, 1, 1, 1, 1,
0.3354865, -1.110458, 2.225626, 1, 1, 1, 1, 1,
0.3400952, 1.805052, -1.224878, 1, 1, 1, 1, 1,
0.341201, 0.1218626, 0.1079733, 1, 1, 1, 1, 1,
0.3471499, 0.7999925, -0.334985, 1, 1, 1, 1, 1,
0.3510142, 0.3061642, -0.6502615, 1, 1, 1, 1, 1,
0.3576878, 1.120435, -1.522748, 0, 0, 1, 1, 1,
0.3646687, -0.4639342, 2.377398, 1, 0, 0, 1, 1,
0.3670522, -0.9795422, 2.007928, 1, 0, 0, 1, 1,
0.3728341, 0.2178918, 0.3676687, 1, 0, 0, 1, 1,
0.3735155, -0.4283188, 0.288503, 1, 0, 0, 1, 1,
0.3745891, 1.250277, 1.312249, 1, 0, 0, 1, 1,
0.3763773, 0.120064, 1.581066, 0, 0, 0, 1, 1,
0.3772545, -0.6139908, 2.474813, 0, 0, 0, 1, 1,
0.3878329, -0.09779525, 2.925731, 0, 0, 0, 1, 1,
0.3879933, -0.6601024, 2.786691, 0, 0, 0, 1, 1,
0.4006678, -0.251882, 1.876281, 0, 0, 0, 1, 1,
0.402898, 1.17329, -0.8799509, 0, 0, 0, 1, 1,
0.4076628, 1.460036, 1.025473, 0, 0, 0, 1, 1,
0.4110638, 1.103982, -1.295449, 1, 1, 1, 1, 1,
0.4157034, 1.408381, 1.18006, 1, 1, 1, 1, 1,
0.4176295, 0.7951593, -0.3505595, 1, 1, 1, 1, 1,
0.420873, 0.02379878, 1.26757, 1, 1, 1, 1, 1,
0.4212883, 1.217289, -1.318567, 1, 1, 1, 1, 1,
0.4213433, -1.25706, 1.530011, 1, 1, 1, 1, 1,
0.4222351, -0.358094, 2.133356, 1, 1, 1, 1, 1,
0.4224501, 0.02053086, 3.578008, 1, 1, 1, 1, 1,
0.4264622, -0.2420146, 1.64454, 1, 1, 1, 1, 1,
0.4275528, -0.7229854, 1.257084, 1, 1, 1, 1, 1,
0.4279327, -0.3645134, 3.681372, 1, 1, 1, 1, 1,
0.4291908, -0.6601552, 2.037028, 1, 1, 1, 1, 1,
0.4295717, 0.8183141, 0.358504, 1, 1, 1, 1, 1,
0.4416153, -0.6909969, 3.16634, 1, 1, 1, 1, 1,
0.4457476, -0.3517914, 1.842882, 1, 1, 1, 1, 1,
0.4462599, -0.6199078, 3.149547, 0, 0, 1, 1, 1,
0.4472247, -0.7283881, 4.203418, 1, 0, 0, 1, 1,
0.4556188, 1.395632, -0.2950509, 1, 0, 0, 1, 1,
0.4566202, -1.267466, 3.747842, 1, 0, 0, 1, 1,
0.4586227, 0.1486623, 1.661846, 1, 0, 0, 1, 1,
0.4609209, -0.3811515, 2.177117, 1, 0, 0, 1, 1,
0.4637526, 1.218187, 0.3332296, 0, 0, 0, 1, 1,
0.4654329, -0.09470323, 1.465436, 0, 0, 0, 1, 1,
0.4663409, -1.353759, 4.670927, 0, 0, 0, 1, 1,
0.4666767, 0.3647931, 1.165432, 0, 0, 0, 1, 1,
0.4689938, 0.950057, 1.333287, 0, 0, 0, 1, 1,
0.4708862, -0.1312416, 2.686661, 0, 0, 0, 1, 1,
0.4742752, -0.4533449, 1.31927, 0, 0, 0, 1, 1,
0.4752394, -1.007043, 2.33767, 1, 1, 1, 1, 1,
0.4820425, 0.3604542, 1.930604, 1, 1, 1, 1, 1,
0.4865636, -0.2024295, -0.6630391, 1, 1, 1, 1, 1,
0.4874204, -0.6522498, 3.082678, 1, 1, 1, 1, 1,
0.489034, -0.880623, 2.511493, 1, 1, 1, 1, 1,
0.4900146, -0.6844909, 1.621824, 1, 1, 1, 1, 1,
0.4902571, -0.3848903, 1.390646, 1, 1, 1, 1, 1,
0.4912441, 0.9652384, -0.2272035, 1, 1, 1, 1, 1,
0.4917699, -0.9286699, 3.556668, 1, 1, 1, 1, 1,
0.4924351, -0.8903834, 2.469013, 1, 1, 1, 1, 1,
0.4934295, -0.992073, 2.014646, 1, 1, 1, 1, 1,
0.4942736, 1.185133, 0.8026659, 1, 1, 1, 1, 1,
0.4969172, -0.2246552, 1.645324, 1, 1, 1, 1, 1,
0.5050656, 1.817839, 1.403704, 1, 1, 1, 1, 1,
0.506212, 0.08319134, -0.5311154, 1, 1, 1, 1, 1,
0.5074899, 1.147287, 1.723857, 0, 0, 1, 1, 1,
0.5123551, -0.2454479, 1.313992, 1, 0, 0, 1, 1,
0.5148665, 0.8355991, 0.1456571, 1, 0, 0, 1, 1,
0.5162958, 0.6793842, 1.464749, 1, 0, 0, 1, 1,
0.5170227, -0.004240929, 1.440209, 1, 0, 0, 1, 1,
0.5174677, 0.4521496, 0.6624922, 1, 0, 0, 1, 1,
0.5177011, 1.533848, 0.4830062, 0, 0, 0, 1, 1,
0.5224213, 1.020325, 0.8997914, 0, 0, 0, 1, 1,
0.5242216, -0.6452414, 3.453655, 0, 0, 0, 1, 1,
0.5251622, -0.6041534, 2.367036, 0, 0, 0, 1, 1,
0.5257671, -1.391869, 2.307853, 0, 0, 0, 1, 1,
0.5361232, 0.3779392, -0.06885818, 0, 0, 0, 1, 1,
0.5395251, -0.5419218, 1.990044, 0, 0, 0, 1, 1,
0.5408511, -0.3056083, 1.997863, 1, 1, 1, 1, 1,
0.5424349, -0.3504913, 2.068635, 1, 1, 1, 1, 1,
0.5456381, 1.060681, 0.1008304, 1, 1, 1, 1, 1,
0.5550702, 0.2895688, 1.648538, 1, 1, 1, 1, 1,
0.5578341, -0.02626355, 1.808016, 1, 1, 1, 1, 1,
0.5587832, -2.042818, 1.765844, 1, 1, 1, 1, 1,
0.5704671, -0.4336928, 2.413363, 1, 1, 1, 1, 1,
0.5711357, 0.330983, 1.649707, 1, 1, 1, 1, 1,
0.5720589, 0.2637116, 2.365505, 1, 1, 1, 1, 1,
0.5729319, -0.07172825, 1.10355, 1, 1, 1, 1, 1,
0.5825185, -0.6577752, 4.464617, 1, 1, 1, 1, 1,
0.5867453, -0.2960793, 2.249739, 1, 1, 1, 1, 1,
0.5878714, 2.029325, -0.9883723, 1, 1, 1, 1, 1,
0.5942015, -0.7919532, 0.81844, 1, 1, 1, 1, 1,
0.5971648, -0.09294882, 2.077533, 1, 1, 1, 1, 1,
0.5988509, 0.8427134, -0.2150053, 0, 0, 1, 1, 1,
0.5995366, -0.8593916, 4.090683, 1, 0, 0, 1, 1,
0.606447, 0.6653424, -0.3504198, 1, 0, 0, 1, 1,
0.6093954, 0.9974635, 0.3185437, 1, 0, 0, 1, 1,
0.6120698, -0.4271637, 4.089911, 1, 0, 0, 1, 1,
0.6122394, 0.7058285, 0.1217255, 1, 0, 0, 1, 1,
0.6125603, -1.811398, 3.937648, 0, 0, 0, 1, 1,
0.61901, -1.044889, 1.36994, 0, 0, 0, 1, 1,
0.6191589, -1.657588, 3.204353, 0, 0, 0, 1, 1,
0.6205788, -0.5975114, 2.406756, 0, 0, 0, 1, 1,
0.6210359, -1.506608, 3.547941, 0, 0, 0, 1, 1,
0.6221611, -1.983144, 2.02036, 0, 0, 0, 1, 1,
0.6250119, -0.1986777, 1.228135, 0, 0, 0, 1, 1,
0.6337415, -0.9202551, 1.807721, 1, 1, 1, 1, 1,
0.642793, 0.3623178, -0.4864973, 1, 1, 1, 1, 1,
0.644812, -1.390262, 1.797994, 1, 1, 1, 1, 1,
0.6557509, -0.004912174, 1.77811, 1, 1, 1, 1, 1,
0.6575201, -1.174825, 3.727002, 1, 1, 1, 1, 1,
0.6645788, 1.475243, 1.086204, 1, 1, 1, 1, 1,
0.6658604, -0.9374788, 4.348786, 1, 1, 1, 1, 1,
0.6665202, -0.3177992, 2.700518, 1, 1, 1, 1, 1,
0.6723406, 0.629953, 0.378823, 1, 1, 1, 1, 1,
0.6753889, 1.561432, 1.820394, 1, 1, 1, 1, 1,
0.6758373, 1.033506, 0.1090017, 1, 1, 1, 1, 1,
0.6848922, 1.253859, 1.076658, 1, 1, 1, 1, 1,
0.6871825, -1.001273, 0.8909178, 1, 1, 1, 1, 1,
0.6891494, 0.9650782, 0.2695463, 1, 1, 1, 1, 1,
0.6923403, 0.8495277, 2.061016, 1, 1, 1, 1, 1,
0.6942136, 0.3609655, 1.028953, 0, 0, 1, 1, 1,
0.6943166, -1.484145, 4.627378, 1, 0, 0, 1, 1,
0.6959634, -0.03715152, 1.606462, 1, 0, 0, 1, 1,
0.7004401, -1.645474, 3.359522, 1, 0, 0, 1, 1,
0.7043229, 1.05669, 2.517379, 1, 0, 0, 1, 1,
0.7168791, 0.7396484, 0.1766912, 1, 0, 0, 1, 1,
0.7171392, -0.1278587, 2.710484, 0, 0, 0, 1, 1,
0.7186583, 0.05474043, 2.600689, 0, 0, 0, 1, 1,
0.7215266, -1.719281, 2.788264, 0, 0, 0, 1, 1,
0.7260948, -0.7007906, 2.727511, 0, 0, 0, 1, 1,
0.7327114, -0.1433689, 1.82137, 0, 0, 0, 1, 1,
0.7356631, 1.858806, -0.4545994, 0, 0, 0, 1, 1,
0.7367576, 0.1434637, 1.306535, 0, 0, 0, 1, 1,
0.7387821, -0.06950471, 2.338872, 1, 1, 1, 1, 1,
0.741266, -0.2767642, -0.544164, 1, 1, 1, 1, 1,
0.7426749, -0.3197861, 2.199458, 1, 1, 1, 1, 1,
0.7429286, -0.449252, 5.382918, 1, 1, 1, 1, 1,
0.747506, 0.07707931, 0.2945647, 1, 1, 1, 1, 1,
0.7512607, 0.4033125, 1.825747, 1, 1, 1, 1, 1,
0.7554815, -0.2130738, 1.263105, 1, 1, 1, 1, 1,
0.7623358, -2.23698, 3.280256, 1, 1, 1, 1, 1,
0.7677678, -0.4303937, 2.713408, 1, 1, 1, 1, 1,
0.7694888, -0.1033007, 0.7416995, 1, 1, 1, 1, 1,
0.7825987, -0.158648, 2.362906, 1, 1, 1, 1, 1,
0.7854233, -0.7218987, 1.729971, 1, 1, 1, 1, 1,
0.7864767, -0.7547742, 3.69282, 1, 1, 1, 1, 1,
0.7900835, 0.7712777, -0.05956519, 1, 1, 1, 1, 1,
0.7941763, 1.968145, 1.838775, 1, 1, 1, 1, 1,
0.7974432, -1.156054, 1.531703, 0, 0, 1, 1, 1,
0.8063194, -0.6785426, 0.05788644, 1, 0, 0, 1, 1,
0.8118646, 0.5745195, 0.1060789, 1, 0, 0, 1, 1,
0.8140099, 0.5877081, -0.612409, 1, 0, 0, 1, 1,
0.8194059, 1.34236, -0.7989231, 1, 0, 0, 1, 1,
0.8272237, -1.060213, 3.02383, 1, 0, 0, 1, 1,
0.8339874, 0.1533531, 2.119481, 0, 0, 0, 1, 1,
0.8363101, 0.7289761, -0.6794938, 0, 0, 0, 1, 1,
0.8422333, -0.1907205, 1.145751, 0, 0, 0, 1, 1,
0.8508602, 0.5027304, 1.063677, 0, 0, 0, 1, 1,
0.8538715, -0.2806224, 2.525974, 0, 0, 0, 1, 1,
0.8543009, 1.384496, 0.535692, 0, 0, 0, 1, 1,
0.8544966, 0.1488477, 2.64665, 0, 0, 0, 1, 1,
0.8589229, 0.9376848, 1.136121, 1, 1, 1, 1, 1,
0.860314, 0.1055476, 0.9660005, 1, 1, 1, 1, 1,
0.8633734, 0.4124158, 0.7903832, 1, 1, 1, 1, 1,
0.8633882, -0.15736, 2.447486, 1, 1, 1, 1, 1,
0.8650374, 1.368519, 0.4544198, 1, 1, 1, 1, 1,
0.8667803, 0.5658015, 4.150297, 1, 1, 1, 1, 1,
0.8672364, -0.1754962, 1.917596, 1, 1, 1, 1, 1,
0.8679896, -0.499263, 3.035636, 1, 1, 1, 1, 1,
0.8728878, -0.9494193, 1.858241, 1, 1, 1, 1, 1,
0.8821731, -1.061019, 1.357081, 1, 1, 1, 1, 1,
0.8832788, -0.9333369, 3.0827, 1, 1, 1, 1, 1,
0.8839124, -0.09144685, 0.3653313, 1, 1, 1, 1, 1,
0.8942364, 1.866222, 0.3771335, 1, 1, 1, 1, 1,
0.896607, -0.4984117, 2.543948, 1, 1, 1, 1, 1,
0.8969778, 1.61179, 0.5381219, 1, 1, 1, 1, 1,
0.8975984, 0.4487032, 2.523147, 0, 0, 1, 1, 1,
0.8994486, -0.08895857, 2.477457, 1, 0, 0, 1, 1,
0.9125009, 0.6020818, 0.6751353, 1, 0, 0, 1, 1,
0.9185159, 0.6592318, 2.059372, 1, 0, 0, 1, 1,
0.9188884, 2.651973, 2.083554, 1, 0, 0, 1, 1,
0.920922, -0.8031572, 1.600565, 1, 0, 0, 1, 1,
0.9365923, 0.5604533, -0.4149419, 0, 0, 0, 1, 1,
0.9380233, 1.377609, 2.232058, 0, 0, 0, 1, 1,
0.9394355, -0.1453277, -0.7682662, 0, 0, 0, 1, 1,
0.9419815, 0.5578128, 2.053241, 0, 0, 0, 1, 1,
0.9430116, 0.6193572, -0.2388337, 0, 0, 0, 1, 1,
0.9440584, -0.8034518, 2.497679, 0, 0, 0, 1, 1,
0.9513205, -1.544747, 4.448626, 0, 0, 0, 1, 1,
0.9565884, 1.078868, 1.537203, 1, 1, 1, 1, 1,
0.9566118, -0.515624, 2.214034, 1, 1, 1, 1, 1,
0.9576079, 0.6090478, -0.199435, 1, 1, 1, 1, 1,
0.9601057, 0.3604151, 1.316182, 1, 1, 1, 1, 1,
0.9703693, -0.5051659, 2.9893, 1, 1, 1, 1, 1,
0.979252, 0.1301078, 1.013328, 1, 1, 1, 1, 1,
0.9793531, 1.199281, -0.01646059, 1, 1, 1, 1, 1,
0.9796058, 0.4392499, 2.128997, 1, 1, 1, 1, 1,
0.9821389, 0.8508931, 0.2024792, 1, 1, 1, 1, 1,
0.985438, 1.298287, 1.05145, 1, 1, 1, 1, 1,
0.9868488, 1.098898, 0.9976449, 1, 1, 1, 1, 1,
0.9887203, -1.313077, 3.539105, 1, 1, 1, 1, 1,
0.9915036, 1.771324, 1.204831, 1, 1, 1, 1, 1,
0.9930028, 1.241788, 0.2598402, 1, 1, 1, 1, 1,
0.9967967, 0.2168181, 1.874008, 1, 1, 1, 1, 1,
1.001912, -0.4323221, 3.349214, 0, 0, 1, 1, 1,
1.015914, -0.5406446, 3.894227, 1, 0, 0, 1, 1,
1.021525, 1.04643, 1.141809, 1, 0, 0, 1, 1,
1.029692, -0.8714949, 1.925572, 1, 0, 0, 1, 1,
1.031022, -1.375856, 3.041363, 1, 0, 0, 1, 1,
1.035213, -1.096772, 2.686075, 1, 0, 0, 1, 1,
1.045461, 0.8335122, 1.142587, 0, 0, 0, 1, 1,
1.058627, 1.203728, -2.294261, 0, 0, 0, 1, 1,
1.059743, -0.8289564, 1.827235, 0, 0, 0, 1, 1,
1.060771, 1.998678, -0.09477647, 0, 0, 0, 1, 1,
1.061721, 1.199523, 0.2135215, 0, 0, 0, 1, 1,
1.064183, 1.641356, 0.8237938, 0, 0, 0, 1, 1,
1.070382, 0.4383721, 0.6533826, 0, 0, 0, 1, 1,
1.071998, -0.3251107, 1.079495, 1, 1, 1, 1, 1,
1.082045, 0.4941243, 1.863753, 1, 1, 1, 1, 1,
1.084797, 0.2696076, -0.02504287, 1, 1, 1, 1, 1,
1.088758, 0.8548867, 0.5696765, 1, 1, 1, 1, 1,
1.092523, -0.04206115, 2.517523, 1, 1, 1, 1, 1,
1.09626, 0.8668525, 0.784436, 1, 1, 1, 1, 1,
1.099492, -0.3955786, 1.101236, 1, 1, 1, 1, 1,
1.107807, -0.9231828, 1.895355, 1, 1, 1, 1, 1,
1.110834, -1.698792, 2.372448, 1, 1, 1, 1, 1,
1.123731, 0.7704475, 1.840822, 1, 1, 1, 1, 1,
1.12574, 0.2498301, 1.801257, 1, 1, 1, 1, 1,
1.130602, 0.08523555, 2.79211, 1, 1, 1, 1, 1,
1.156073, 0.8481174, 1.030581, 1, 1, 1, 1, 1,
1.164075, -0.8839152, 2.475072, 1, 1, 1, 1, 1,
1.169641, -0.07420111, 2.258977, 1, 1, 1, 1, 1,
1.172504, 0.7256819, 1.209769, 0, 0, 1, 1, 1,
1.173654, -1.497955, 3.131939, 1, 0, 0, 1, 1,
1.173903, -0.496932, 2.5488, 1, 0, 0, 1, 1,
1.175325, -0.7980588, 2.717432, 1, 0, 0, 1, 1,
1.183205, 1.664754, 1.361064, 1, 0, 0, 1, 1,
1.184585, -0.7322143, 3.332478, 1, 0, 0, 1, 1,
1.18605, -0.3673454, 0.8945078, 0, 0, 0, 1, 1,
1.18834, -0.9147717, 1.404041, 0, 0, 0, 1, 1,
1.189503, -0.04273416, 0.5797124, 0, 0, 0, 1, 1,
1.200622, -1.130545, 2.776458, 0, 0, 0, 1, 1,
1.202451, -0.6785277, 2.222264, 0, 0, 0, 1, 1,
1.203223, 0.2148189, -0.04451121, 0, 0, 0, 1, 1,
1.208239, 0.8085467, 3.163503, 0, 0, 0, 1, 1,
1.210716, -0.9396342, 1.725866, 1, 1, 1, 1, 1,
1.214607, 1.248783, 1.805652, 1, 1, 1, 1, 1,
1.222674, -0.7168835, 2.812038, 1, 1, 1, 1, 1,
1.225467, 0.8623918, 0.9809492, 1, 1, 1, 1, 1,
1.230325, 1.112517, 0.9381146, 1, 1, 1, 1, 1,
1.231001, 0.5397369, 1.834893, 1, 1, 1, 1, 1,
1.23173, 1.360728, 3.155564, 1, 1, 1, 1, 1,
1.233428, -1.20822, 2.554601, 1, 1, 1, 1, 1,
1.247573, -1.34367, 3.79343, 1, 1, 1, 1, 1,
1.265247, 1.646108, 0.4434105, 1, 1, 1, 1, 1,
1.267915, 0.02747576, 1.394429, 1, 1, 1, 1, 1,
1.268138, -0.7132957, 3.035467, 1, 1, 1, 1, 1,
1.271526, -0.7695878, 1.613965, 1, 1, 1, 1, 1,
1.27448, -0.5772566, 2.44447, 1, 1, 1, 1, 1,
1.276923, 1.160491, 0.959595, 1, 1, 1, 1, 1,
1.279449, 0.03526992, 1.622262, 0, 0, 1, 1, 1,
1.279471, -1.705193, 2.576737, 1, 0, 0, 1, 1,
1.292761, -0.5046592, 2.682855, 1, 0, 0, 1, 1,
1.305787, -0.2492175, 2.055056, 1, 0, 0, 1, 1,
1.30837, 0.2410323, 0.2023888, 1, 0, 0, 1, 1,
1.309941, 2.339109, 0.2913485, 1, 0, 0, 1, 1,
1.318822, -0.7587376, 1.232452, 0, 0, 0, 1, 1,
1.32746, 0.8970996, -0.961656, 0, 0, 0, 1, 1,
1.328232, -1.132522, 2.612009, 0, 0, 0, 1, 1,
1.329829, -0.6503524, 3.745925, 0, 0, 0, 1, 1,
1.331702, -1.872771, 0.7579322, 0, 0, 0, 1, 1,
1.347277, 0.3515866, 0.7573462, 0, 0, 0, 1, 1,
1.353189, 0.9909995, 1.9776, 0, 0, 0, 1, 1,
1.359548, -0.2829081, 2.893517, 1, 1, 1, 1, 1,
1.362273, 1.048665, 1.151922, 1, 1, 1, 1, 1,
1.363998, 0.6371617, 0.5773891, 1, 1, 1, 1, 1,
1.364391, 0.6677799, 0.818519, 1, 1, 1, 1, 1,
1.373294, 1.377527, -0.6677093, 1, 1, 1, 1, 1,
1.383232, -0.5015272, 1.258415, 1, 1, 1, 1, 1,
1.384226, -0.2511212, 1.558867, 1, 1, 1, 1, 1,
1.384786, -0.7110912, 1.015084, 1, 1, 1, 1, 1,
1.39481, -1.130061, 2.530612, 1, 1, 1, 1, 1,
1.395529, -0.721462, 1.956958, 1, 1, 1, 1, 1,
1.396508, -1.745663, 1.178142, 1, 1, 1, 1, 1,
1.410446, -0.6010275, 2.635372, 1, 1, 1, 1, 1,
1.411896, -0.1957718, 2.99888, 1, 1, 1, 1, 1,
1.415177, -0.2731528, 3.101282, 1, 1, 1, 1, 1,
1.418859, -0.443499, 2.068685, 1, 1, 1, 1, 1,
1.419132, 0.003888798, 3.109125, 0, 0, 1, 1, 1,
1.419431, -2.72768, 4.278047, 1, 0, 0, 1, 1,
1.424869, -2.732597, 3.260052, 1, 0, 0, 1, 1,
1.428107, -0.06039272, 1.849723, 1, 0, 0, 1, 1,
1.428591, -1.005341, 1.995752, 1, 0, 0, 1, 1,
1.446454, -1.363261, 1.776108, 1, 0, 0, 1, 1,
1.446639, 0.6564265, -0.2294321, 0, 0, 0, 1, 1,
1.450131, -0.3463621, 3.131506, 0, 0, 0, 1, 1,
1.457359, 0.6260486, 0.06435294, 0, 0, 0, 1, 1,
1.458348, -1.489086, 2.16816, 0, 0, 0, 1, 1,
1.461151, -0.3469247, 2.576445, 0, 0, 0, 1, 1,
1.469678, -0.1655, 0.2836114, 0, 0, 0, 1, 1,
1.480604, 1.036559, 1.843584, 0, 0, 0, 1, 1,
1.487431, 0.378112, 1.770541, 1, 1, 1, 1, 1,
1.495513, 0.4992504, -0.123613, 1, 1, 1, 1, 1,
1.511752, -0.9231625, 0.9043446, 1, 1, 1, 1, 1,
1.530369, 0.9152882, 1.931049, 1, 1, 1, 1, 1,
1.542889, -0.1847956, 2.961111, 1, 1, 1, 1, 1,
1.552773, -0.9153265, 1.214533, 1, 1, 1, 1, 1,
1.579023, -0.6401597, 1.684805, 1, 1, 1, 1, 1,
1.587193, 0.8180145, 0.3789877, 1, 1, 1, 1, 1,
1.596321, -0.8547781, 0.7852904, 1, 1, 1, 1, 1,
1.618564, 0.816084, 1.62075, 1, 1, 1, 1, 1,
1.630589, 0.9920272, 2.035778, 1, 1, 1, 1, 1,
1.644485, -1.069657, 1.735052, 1, 1, 1, 1, 1,
1.661475, -2.187403, 1.531108, 1, 1, 1, 1, 1,
1.679043, 0.2096857, 0.9899183, 1, 1, 1, 1, 1,
1.699587, 0.4133662, 0.8569978, 1, 1, 1, 1, 1,
1.705216, -0.5504408, 1.501016, 0, 0, 1, 1, 1,
1.723621, 0.6384794, 2.528877, 1, 0, 0, 1, 1,
1.7249, -0.7370178, 1.268098, 1, 0, 0, 1, 1,
1.742803, -1.008154, 1.625579, 1, 0, 0, 1, 1,
1.747816, -1.316754, 3.720802, 1, 0, 0, 1, 1,
1.761136, 0.1270063, -0.5749199, 1, 0, 0, 1, 1,
1.771921, -0.7440815, 2.582196, 0, 0, 0, 1, 1,
1.783083, 0.5194232, 1.397487, 0, 0, 0, 1, 1,
1.803101, -2.040607, 2.444241, 0, 0, 0, 1, 1,
1.80762, 0.6461934, 2.816508, 0, 0, 0, 1, 1,
1.808125, -0.2969975, 0.10073, 0, 0, 0, 1, 1,
1.853196, -0.07454882, 2.214266, 0, 0, 0, 1, 1,
1.879736, 1.37626, 1.638036, 0, 0, 0, 1, 1,
1.887666, 0.7214336, 3.438773, 1, 1, 1, 1, 1,
1.900764, -1.448024, 2.112099, 1, 1, 1, 1, 1,
1.935596, -0.9152961, 1.483856, 1, 1, 1, 1, 1,
1.959978, -0.9030662, 2.390021, 1, 1, 1, 1, 1,
2.039262, -0.3742056, 1.30753, 1, 1, 1, 1, 1,
2.085422, 0.7523105, 1.157472, 1, 1, 1, 1, 1,
2.088401, 0.1964837, 2.560904, 1, 1, 1, 1, 1,
2.149236, 1.19199, 0.3466315, 1, 1, 1, 1, 1,
2.172877, 0.633841, 1.741679, 1, 1, 1, 1, 1,
2.17438, -0.2355779, 2.862116, 1, 1, 1, 1, 1,
2.234598, -0.07880196, 0.9684939, 1, 1, 1, 1, 1,
2.257869, 0.4633344, 2.498402, 1, 1, 1, 1, 1,
2.261679, -0.5326915, 1.226018, 1, 1, 1, 1, 1,
2.280035, -0.5328082, 2.425182, 1, 1, 1, 1, 1,
2.281703, -0.2061195, 2.211526, 1, 1, 1, 1, 1,
2.305381, 1.32286, 0.5270609, 0, 0, 1, 1, 1,
2.310615, -0.07600449, 1.180652, 1, 0, 0, 1, 1,
2.409985, 2.140255, 2.186423, 1, 0, 0, 1, 1,
2.450922, -0.1776507, 1.893533, 1, 0, 0, 1, 1,
2.45587, -0.9062068, -0.08218325, 1, 0, 0, 1, 1,
2.462276, 0.8078809, 2.403564, 1, 0, 0, 1, 1,
2.513079, -0.9374924, 1.756006, 0, 0, 0, 1, 1,
2.514505, 0.621896, 2.098815, 0, 0, 0, 1, 1,
2.53143, -0.1567908, 1.55002, 0, 0, 0, 1, 1,
2.571593, 0.008541597, 0.6683561, 0, 0, 0, 1, 1,
2.594891, -2.190021, 2.810881, 0, 0, 0, 1, 1,
2.605937, -0.6567747, 2.60759, 0, 0, 0, 1, 1,
2.610279, -0.6302278, 2.761939, 0, 0, 0, 1, 1,
2.633934, 0.21134, 0.512718, 1, 1, 1, 1, 1,
2.69879, 1.054801, 1.626056, 1, 1, 1, 1, 1,
2.72946, 0.4981889, 1.440421, 1, 1, 1, 1, 1,
2.780647, 0.9528529, 1.521513, 1, 1, 1, 1, 1,
2.841051, -0.09877656, 1.169813, 1, 1, 1, 1, 1,
2.856292, 1.782554, 1.283242, 1, 1, 1, 1, 1,
3.019509, 0.6513792, 2.405154, 1, 1, 1, 1, 1
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
var radius = 9.338899;
var distance = 32.80249;
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
mvMatrix.translate( 0.1711648, 0.01512361, -0.3576887 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80249);
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
