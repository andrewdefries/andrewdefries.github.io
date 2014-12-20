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
-3.948762, -1.158054, -1.850528, 1, 0, 0, 1,
-2.742383, -0.4854823, -2.144567, 1, 0.007843138, 0, 1,
-2.689018, -1.003831, -1.166647, 1, 0.01176471, 0, 1,
-2.656338, 0.1570492, -1.695209, 1, 0.01960784, 0, 1,
-2.650944, 0.6842992, -0.3872599, 1, 0.02352941, 0, 1,
-2.536119, -0.04228546, -0.4460811, 1, 0.03137255, 0, 1,
-2.501503, 1.563009, -0.3144101, 1, 0.03529412, 0, 1,
-2.465249, -0.2653736, -0.6076128, 1, 0.04313726, 0, 1,
-2.334474, 0.8911698, -1.613289, 1, 0.04705882, 0, 1,
-2.324445, 0.1803947, -2.390487, 1, 0.05490196, 0, 1,
-2.296883, 0.05641869, -3.545129, 1, 0.05882353, 0, 1,
-2.251499, 1.014713, -0.7122062, 1, 0.06666667, 0, 1,
-2.24165, -0.2101454, -1.105605, 1, 0.07058824, 0, 1,
-2.235794, 1.076399, -1.532795, 1, 0.07843138, 0, 1,
-2.230164, -0.5343001, -0.471244, 1, 0.08235294, 0, 1,
-2.229841, 0.890098, -1.03586, 1, 0.09019608, 0, 1,
-2.163178, -2.42539, -1.939382, 1, 0.09411765, 0, 1,
-2.084938, 0.2755922, -2.179721, 1, 0.1019608, 0, 1,
-2.043859, -0.6548358, -2.833549, 1, 0.1098039, 0, 1,
-2.007218, 1.461376, -1.765914, 1, 0.1137255, 0, 1,
-1.926483, 0.2212834, -1.109818, 1, 0.1215686, 0, 1,
-1.918868, -0.1956956, -2.307263, 1, 0.1254902, 0, 1,
-1.89912, -0.1281137, -1.608166, 1, 0.1333333, 0, 1,
-1.869577, -1.281373, -2.754157, 1, 0.1372549, 0, 1,
-1.831843, -1.597746, -1.642408, 1, 0.145098, 0, 1,
-1.818521, -0.6295165, 0.07620604, 1, 0.1490196, 0, 1,
-1.817461, -2.252946, -3.316447, 1, 0.1568628, 0, 1,
-1.806608, 0.9503433, -2.083886, 1, 0.1607843, 0, 1,
-1.800445, -0.8021179, -3.057808, 1, 0.1686275, 0, 1,
-1.799559, 0.1501289, -0.709184, 1, 0.172549, 0, 1,
-1.780387, 0.8728483, -0.2216454, 1, 0.1803922, 0, 1,
-1.760235, 1.223568, -1.481585, 1, 0.1843137, 0, 1,
-1.759682, 0.3004914, -1.131021, 1, 0.1921569, 0, 1,
-1.724968, -1.685118, -2.061157, 1, 0.1960784, 0, 1,
-1.708718, -1.708001, -2.603202, 1, 0.2039216, 0, 1,
-1.697197, 1.196874, -3.033602, 1, 0.2117647, 0, 1,
-1.677536, -0.3384624, -0.4821563, 1, 0.2156863, 0, 1,
-1.671632, 0.9058518, -1.391628, 1, 0.2235294, 0, 1,
-1.651307, 0.5726056, -1.660467, 1, 0.227451, 0, 1,
-1.649352, 0.4492274, -2.175877, 1, 0.2352941, 0, 1,
-1.646805, 1.208397, -2.161493, 1, 0.2392157, 0, 1,
-1.64336, 0.6277332, -1.705136, 1, 0.2470588, 0, 1,
-1.637939, 0.02331212, -0.4782352, 1, 0.2509804, 0, 1,
-1.632982, -0.6979992, -1.685114, 1, 0.2588235, 0, 1,
-1.629777, 0.8260224, -2.076352, 1, 0.2627451, 0, 1,
-1.626886, 0.8163157, -3.17305, 1, 0.2705882, 0, 1,
-1.622619, -0.6393314, -2.607937, 1, 0.2745098, 0, 1,
-1.59464, 0.8070293, -2.064941, 1, 0.282353, 0, 1,
-1.591861, -0.1161122, -2.42349, 1, 0.2862745, 0, 1,
-1.588074, 0.8871828, 0.1709222, 1, 0.2941177, 0, 1,
-1.586784, -1.125514, -3.093839, 1, 0.3019608, 0, 1,
-1.585028, -1.108727, -1.573892, 1, 0.3058824, 0, 1,
-1.579322, -0.3660972, -2.200185, 1, 0.3137255, 0, 1,
-1.57689, 0.1974727, -1.566519, 1, 0.3176471, 0, 1,
-1.564295, -0.0462711, -2.251425, 1, 0.3254902, 0, 1,
-1.554774, -0.5802301, 0.1436234, 1, 0.3294118, 0, 1,
-1.543564, 0.6797671, -2.678612, 1, 0.3372549, 0, 1,
-1.54012, 0.001779116, -2.620978, 1, 0.3411765, 0, 1,
-1.535372, -0.07276794, -1.717155, 1, 0.3490196, 0, 1,
-1.534712, -0.002245429, -1.72935, 1, 0.3529412, 0, 1,
-1.533356, -2.478188, -2.299474, 1, 0.3607843, 0, 1,
-1.531252, 0.4897081, -0.9238763, 1, 0.3647059, 0, 1,
-1.52571, 0.21104, -1.498196, 1, 0.372549, 0, 1,
-1.522511, -0.3003166, 0.2349926, 1, 0.3764706, 0, 1,
-1.512128, -1.2174, -1.627122, 1, 0.3843137, 0, 1,
-1.500896, -0.304013, -1.040551, 1, 0.3882353, 0, 1,
-1.492662, 0.5715792, -1.413798, 1, 0.3960784, 0, 1,
-1.492325, 1.752187, -1.084507, 1, 0.4039216, 0, 1,
-1.472455, 0.7608029, -0.09444334, 1, 0.4078431, 0, 1,
-1.471252, 1.985131, -0.154768, 1, 0.4156863, 0, 1,
-1.451851, -1.508609, -0.8430716, 1, 0.4196078, 0, 1,
-1.445849, -0.5506451, -1.475166, 1, 0.427451, 0, 1,
-1.444998, 1.399678, -0.5296679, 1, 0.4313726, 0, 1,
-1.423771, 0.5745773, -0.6756625, 1, 0.4392157, 0, 1,
-1.421098, -0.2161738, -2.986096, 1, 0.4431373, 0, 1,
-1.409771, -1.112745, -2.141654, 1, 0.4509804, 0, 1,
-1.393531, 1.554784, -0.1862769, 1, 0.454902, 0, 1,
-1.389869, 0.1844117, -1.129979, 1, 0.4627451, 0, 1,
-1.387569, -1.822925, -0.5910811, 1, 0.4666667, 0, 1,
-1.380485, 0.5918955, 0.4588996, 1, 0.4745098, 0, 1,
-1.376968, -1.004266, -2.245092, 1, 0.4784314, 0, 1,
-1.360067, -1.117871, -2.330507, 1, 0.4862745, 0, 1,
-1.353446, 1.062143, 0.4342417, 1, 0.4901961, 0, 1,
-1.349905, 0.9211734, -2.417958, 1, 0.4980392, 0, 1,
-1.347464, -1.584336, -2.552328, 1, 0.5058824, 0, 1,
-1.34407, 1.4092, -1.672046, 1, 0.509804, 0, 1,
-1.336538, -1.724949, -1.467933, 1, 0.5176471, 0, 1,
-1.328446, 0.06595406, -1.06222, 1, 0.5215687, 0, 1,
-1.326101, 1.70308, -1.579019, 1, 0.5294118, 0, 1,
-1.323282, 1.282058, -0.5780785, 1, 0.5333334, 0, 1,
-1.322378, 1.506203, -0.9035888, 1, 0.5411765, 0, 1,
-1.321014, 0.9112896, -1.192397, 1, 0.5450981, 0, 1,
-1.306729, 0.3486848, -2.0334, 1, 0.5529412, 0, 1,
-1.304146, -0.4548607, -0.683524, 1, 0.5568628, 0, 1,
-1.29884, 1.422414, -2.145998, 1, 0.5647059, 0, 1,
-1.280942, 0.6467553, -1.656875, 1, 0.5686275, 0, 1,
-1.275069, -0.08654786, -2.468765, 1, 0.5764706, 0, 1,
-1.262806, 0.478043, -1.569529, 1, 0.5803922, 0, 1,
-1.260762, 0.3705691, -1.853008, 1, 0.5882353, 0, 1,
-1.250593, -0.1250184, 0.2076332, 1, 0.5921569, 0, 1,
-1.247723, -0.9590392, -3.188903, 1, 0.6, 0, 1,
-1.24082, -1.32484, -1.893585, 1, 0.6078432, 0, 1,
-1.229911, 0.298365, -1.567814, 1, 0.6117647, 0, 1,
-1.226313, 1.698233, 0.08258402, 1, 0.6196079, 0, 1,
-1.197112, 0.4056152, -0.1797148, 1, 0.6235294, 0, 1,
-1.187571, -0.4630478, -2.143946, 1, 0.6313726, 0, 1,
-1.180757, 0.620901, -0.4504601, 1, 0.6352941, 0, 1,
-1.145726, -1.707765, -2.333362, 1, 0.6431373, 0, 1,
-1.144962, 1.099083, -2.368232, 1, 0.6470588, 0, 1,
-1.138885, 0.1192869, -1.957458, 1, 0.654902, 0, 1,
-1.136555, -1.28915, -2.066836, 1, 0.6588235, 0, 1,
-1.126482, -0.8701223, -2.391139, 1, 0.6666667, 0, 1,
-1.119692, -2.176541, -2.054939, 1, 0.6705883, 0, 1,
-1.117318, -1.156799, -1.623855, 1, 0.6784314, 0, 1,
-1.109402, -2.703088, -0.7592945, 1, 0.682353, 0, 1,
-1.103631, 0.9942445, 0.8371956, 1, 0.6901961, 0, 1,
-1.103135, -0.3588422, -2.166228, 1, 0.6941177, 0, 1,
-1.101524, -0.7511986, -2.912873, 1, 0.7019608, 0, 1,
-1.101383, -0.4794882, -2.79751, 1, 0.7098039, 0, 1,
-1.094015, -0.202781, -2.181332, 1, 0.7137255, 0, 1,
-1.093643, 0.7435981, -0.5201519, 1, 0.7215686, 0, 1,
-1.087333, 0.5337672, -1.296562, 1, 0.7254902, 0, 1,
-1.078595, 0.9845005, -0.7449331, 1, 0.7333333, 0, 1,
-1.071335, -1.958621, -1.781053, 1, 0.7372549, 0, 1,
-1.06917, -0.5238132, -1.548658, 1, 0.7450981, 0, 1,
-1.067325, -0.1789424, -2.909018, 1, 0.7490196, 0, 1,
-1.067272, 0.07538783, -2.748497, 1, 0.7568628, 0, 1,
-1.066831, -3.245542, -1.272591, 1, 0.7607843, 0, 1,
-1.06264, -0.4612907, 0.1183288, 1, 0.7686275, 0, 1,
-1.057735, -0.5618926, -2.384856, 1, 0.772549, 0, 1,
-1.052439, -0.5997801, -1.883851, 1, 0.7803922, 0, 1,
-1.05208, -0.6401546, -4.125072, 1, 0.7843137, 0, 1,
-1.04378, 0.5368731, -1.87857, 1, 0.7921569, 0, 1,
-1.042909, 0.5455017, 1.018379, 1, 0.7960784, 0, 1,
-1.041973, 0.9451255, -0.6443648, 1, 0.8039216, 0, 1,
-1.037915, -0.2060265, -0.6807788, 1, 0.8117647, 0, 1,
-1.037274, 0.2103661, -1.354673, 1, 0.8156863, 0, 1,
-1.034508, 0.8862444, -3.237908, 1, 0.8235294, 0, 1,
-1.031102, -0.4791125, -1.626712, 1, 0.827451, 0, 1,
-1.030848, 0.2738285, -2.066695, 1, 0.8352941, 0, 1,
-1.030682, -1.658105, -2.348158, 1, 0.8392157, 0, 1,
-1.02741, -0.633064, -1.147921, 1, 0.8470588, 0, 1,
-1.022659, -0.6541414, -2.716059, 1, 0.8509804, 0, 1,
-1.017, -0.02576461, -3.145077, 1, 0.8588235, 0, 1,
-1.014551, -0.3487286, -0.9534383, 1, 0.8627451, 0, 1,
-1.01431, -1.207039, -1.858244, 1, 0.8705882, 0, 1,
-1.011972, -0.835489, -1.872831, 1, 0.8745098, 0, 1,
-1.006722, 0.400782, -0.4045859, 1, 0.8823529, 0, 1,
-1.003853, -0.5404415, -2.013767, 1, 0.8862745, 0, 1,
-1.003226, 0.01631325, -2.939418, 1, 0.8941177, 0, 1,
-1.002251, -0.910044, -2.552884, 1, 0.8980392, 0, 1,
-1.000834, 1.42304, 0.8857908, 1, 0.9058824, 0, 1,
-0.9983234, -0.9272314, -1.673884, 1, 0.9137255, 0, 1,
-0.9950773, 1.486887, -0.8496434, 1, 0.9176471, 0, 1,
-0.9888225, 0.2281317, -0.4187365, 1, 0.9254902, 0, 1,
-0.9881724, 1.240869, 0.05627327, 1, 0.9294118, 0, 1,
-0.9800063, -1.080558, -4.420607, 1, 0.9372549, 0, 1,
-0.9772167, -1.208015, -1.386902, 1, 0.9411765, 0, 1,
-0.9749857, -1.164096, -3.148885, 1, 0.9490196, 0, 1,
-0.9718591, 1.973512, 0.0378737, 1, 0.9529412, 0, 1,
-0.9716166, 0.77464, -1.290272, 1, 0.9607843, 0, 1,
-0.9704925, 0.1613448, -0.2381222, 1, 0.9647059, 0, 1,
-0.9666491, 0.3330208, -2.435251, 1, 0.972549, 0, 1,
-0.9648023, 1.98647, 0.4142153, 1, 0.9764706, 0, 1,
-0.9617726, 0.9271303, -1.145199, 1, 0.9843137, 0, 1,
-0.9587702, -2.106865, -2.401405, 1, 0.9882353, 0, 1,
-0.9551601, -1.29659, -1.105862, 1, 0.9960784, 0, 1,
-0.950101, 0.05874264, -1.512606, 0.9960784, 1, 0, 1,
-0.9485348, 1.688926, 0.87229, 0.9921569, 1, 0, 1,
-0.9478835, -0.5604022, -0.3658748, 0.9843137, 1, 0, 1,
-0.9467559, -0.621267, -1.426073, 0.9803922, 1, 0, 1,
-0.9417441, 1.263693, -1.667526, 0.972549, 1, 0, 1,
-0.9334719, -0.140157, -1.673222, 0.9686275, 1, 0, 1,
-0.9197565, 0.09565237, -0.8790061, 0.9607843, 1, 0, 1,
-0.9142034, 0.2127609, -1.731988, 0.9568627, 1, 0, 1,
-0.9139017, -0.5870655, -1.41368, 0.9490196, 1, 0, 1,
-0.9127725, 1.638743, -0.3316861, 0.945098, 1, 0, 1,
-0.8979746, 0.3919429, -2.229151, 0.9372549, 1, 0, 1,
-0.8974317, -1.875138, -2.865729, 0.9333333, 1, 0, 1,
-0.8855637, -0.4522013, -1.393697, 0.9254902, 1, 0, 1,
-0.8853782, -1.405346, -3.014321, 0.9215686, 1, 0, 1,
-0.8846745, 0.4286464, -2.06381, 0.9137255, 1, 0, 1,
-0.883836, 0.2614165, -1.270488, 0.9098039, 1, 0, 1,
-0.8825635, -0.1329974, -0.8652077, 0.9019608, 1, 0, 1,
-0.8775684, 0.2521774, 0.7762485, 0.8941177, 1, 0, 1,
-0.8708865, 0.2242308, -2.144922, 0.8901961, 1, 0, 1,
-0.8674949, 0.1248147, -1.082835, 0.8823529, 1, 0, 1,
-0.8569359, -0.8209525, -1.163498, 0.8784314, 1, 0, 1,
-0.8539859, -0.0230849, -2.682715, 0.8705882, 1, 0, 1,
-0.8522373, 0.02635175, -0.5008409, 0.8666667, 1, 0, 1,
-0.8493273, -0.4636001, -2.113823, 0.8588235, 1, 0, 1,
-0.8466625, 0.9699501, 1.018442, 0.854902, 1, 0, 1,
-0.8384879, 1.390983, 0.3082077, 0.8470588, 1, 0, 1,
-0.8359425, 2.199847, 0.7343662, 0.8431373, 1, 0, 1,
-0.8304688, 0.7263088, -2.502686, 0.8352941, 1, 0, 1,
-0.8278647, 0.7207601, -0.4003015, 0.8313726, 1, 0, 1,
-0.8277397, 0.1821303, -1.592302, 0.8235294, 1, 0, 1,
-0.8251441, 0.784852, -1.483536, 0.8196079, 1, 0, 1,
-0.8188999, -0.4955463, -1.908687, 0.8117647, 1, 0, 1,
-0.8014993, 0.1889976, -1.512408, 0.8078431, 1, 0, 1,
-0.797199, -1.846201, -3.460866, 0.8, 1, 0, 1,
-0.796617, -0.4315399, -1.587132, 0.7921569, 1, 0, 1,
-0.782872, 0.6095117, 0.08340276, 0.7882353, 1, 0, 1,
-0.7748321, 1.17243, 2.385716, 0.7803922, 1, 0, 1,
-0.7744002, 0.6037322, -1.199728, 0.7764706, 1, 0, 1,
-0.7738806, 0.3943936, -1.176359, 0.7686275, 1, 0, 1,
-0.7730204, 1.238304, -0.06878021, 0.7647059, 1, 0, 1,
-0.7700251, -0.1786714, -2.104327, 0.7568628, 1, 0, 1,
-0.7588325, -0.1276063, -1.299866, 0.7529412, 1, 0, 1,
-0.754254, 0.9495102, 0.4446622, 0.7450981, 1, 0, 1,
-0.7540027, 0.5811802, -1.924803, 0.7411765, 1, 0, 1,
-0.7509281, -0.3956385, -1.588811, 0.7333333, 1, 0, 1,
-0.7504894, -0.5502948, -2.186748, 0.7294118, 1, 0, 1,
-0.7484168, 0.6660911, -2.21881, 0.7215686, 1, 0, 1,
-0.7482817, -0.1869699, -1.733549, 0.7176471, 1, 0, 1,
-0.7458324, -1.52281, -2.120924, 0.7098039, 1, 0, 1,
-0.7397459, -0.005899517, -0.4783153, 0.7058824, 1, 0, 1,
-0.7352044, 0.004760384, -0.2805686, 0.6980392, 1, 0, 1,
-0.7316115, -1.562543, -5.197586, 0.6901961, 1, 0, 1,
-0.7270057, -0.576388, -2.070898, 0.6862745, 1, 0, 1,
-0.7248235, -1.155955, -1.255957, 0.6784314, 1, 0, 1,
-0.7212653, -1.723874, -2.200537, 0.6745098, 1, 0, 1,
-0.7104845, -0.2451009, -2.036193, 0.6666667, 1, 0, 1,
-0.7064713, -0.5482192, -3.659798, 0.6627451, 1, 0, 1,
-0.7030298, -0.0600228, -1.769334, 0.654902, 1, 0, 1,
-0.7003433, 0.2418315, -1.192279, 0.6509804, 1, 0, 1,
-0.6983695, 0.3587212, 0.003206283, 0.6431373, 1, 0, 1,
-0.6983414, 2.063426, -1.300164, 0.6392157, 1, 0, 1,
-0.6952247, 0.9992229, 0.3868237, 0.6313726, 1, 0, 1,
-0.6944195, -2.200651, -2.96207, 0.627451, 1, 0, 1,
-0.6801006, 1.232421, -0.3850863, 0.6196079, 1, 0, 1,
-0.6800004, -0.4066592, -3.557092, 0.6156863, 1, 0, 1,
-0.6790589, 0.7296219, -2.059433, 0.6078432, 1, 0, 1,
-0.6780336, 0.4998305, 0.1702407, 0.6039216, 1, 0, 1,
-0.6699569, -0.2158671, -4.531769, 0.5960785, 1, 0, 1,
-0.6660081, 0.3036716, -0.5055643, 0.5882353, 1, 0, 1,
-0.6590497, 0.4563122, -0.9917669, 0.5843138, 1, 0, 1,
-0.6574571, -1.075114, -1.532221, 0.5764706, 1, 0, 1,
-0.6550601, 0.08638459, -1.367627, 0.572549, 1, 0, 1,
-0.6526374, 0.2614101, -2.13319, 0.5647059, 1, 0, 1,
-0.6520196, 0.3762114, -1.945622, 0.5607843, 1, 0, 1,
-0.6492769, -2.479515, -2.180449, 0.5529412, 1, 0, 1,
-0.6491383, -1.290222, -1.525941, 0.5490196, 1, 0, 1,
-0.6478258, -1.658278, -2.448475, 0.5411765, 1, 0, 1,
-0.6449763, 0.2036865, -1.087865, 0.5372549, 1, 0, 1,
-0.6445224, -0.9918225, -1.301609, 0.5294118, 1, 0, 1,
-0.6391042, -1.74814, -2.880271, 0.5254902, 1, 0, 1,
-0.6367469, -0.5122718, -2.140737, 0.5176471, 1, 0, 1,
-0.6351148, -0.5508336, -2.101557, 0.5137255, 1, 0, 1,
-0.633969, 1.822409, 0.7478133, 0.5058824, 1, 0, 1,
-0.6326062, -1.08922, -3.599854, 0.5019608, 1, 0, 1,
-0.6310116, -0.6499154, -0.4311444, 0.4941176, 1, 0, 1,
-0.6271687, 0.02688836, -1.006592, 0.4862745, 1, 0, 1,
-0.6271287, -0.5980177, -1.615637, 0.4823529, 1, 0, 1,
-0.6259105, 0.6828622, -1.113866, 0.4745098, 1, 0, 1,
-0.625594, 1.251726, -0.8779554, 0.4705882, 1, 0, 1,
-0.6213593, 0.6001037, -0.2381312, 0.4627451, 1, 0, 1,
-0.6207199, 0.2174193, -0.5986739, 0.4588235, 1, 0, 1,
-0.6183546, -0.8102068, -2.663781, 0.4509804, 1, 0, 1,
-0.6147094, 2.549281, -1.257281, 0.4470588, 1, 0, 1,
-0.6135152, -1.388631, -2.19624, 0.4392157, 1, 0, 1,
-0.6134407, 0.3800791, -0.2407507, 0.4352941, 1, 0, 1,
-0.611917, 2.352175, 0.7808371, 0.427451, 1, 0, 1,
-0.6094612, 1.826725, -0.8724261, 0.4235294, 1, 0, 1,
-0.6090875, 0.7875473, -1.20535, 0.4156863, 1, 0, 1,
-0.6080511, 1.118413, -0.7330222, 0.4117647, 1, 0, 1,
-0.6002416, 0.8622572, -0.6122258, 0.4039216, 1, 0, 1,
-0.6001631, 3.393872, 0.3992348, 0.3960784, 1, 0, 1,
-0.5935162, -0.6390079, -2.167605, 0.3921569, 1, 0, 1,
-0.5853376, -0.8102902, -3.682867, 0.3843137, 1, 0, 1,
-0.5755833, 1.207152, -0.7537135, 0.3803922, 1, 0, 1,
-0.5752306, 0.09509254, -1.804155, 0.372549, 1, 0, 1,
-0.5725384, 1.069447, -0.7394147, 0.3686275, 1, 0, 1,
-0.5718702, 0.1935007, -1.372171, 0.3607843, 1, 0, 1,
-0.5705842, 1.455419, -0.08575124, 0.3568628, 1, 0, 1,
-0.5695885, 1.411459, -0.7415672, 0.3490196, 1, 0, 1,
-0.5671887, -0.3995803, -2.679327, 0.345098, 1, 0, 1,
-0.5647655, -0.528321, -2.405921, 0.3372549, 1, 0, 1,
-0.5637868, 1.506543, 1.857541, 0.3333333, 1, 0, 1,
-0.5558671, 0.2341954, -0.152551, 0.3254902, 1, 0, 1,
-0.5547588, 0.6389717, 0.6623115, 0.3215686, 1, 0, 1,
-0.5458506, -0.08676516, -1.843487, 0.3137255, 1, 0, 1,
-0.54536, -0.5877154, -3.478876, 0.3098039, 1, 0, 1,
-0.5396157, 1.494824, -0.4313899, 0.3019608, 1, 0, 1,
-0.5390546, 0.8845595, -0.9599399, 0.2941177, 1, 0, 1,
-0.5349393, -0.5483738, -0.2686459, 0.2901961, 1, 0, 1,
-0.5326185, 0.04915362, -1.725925, 0.282353, 1, 0, 1,
-0.5309318, -0.718531, -2.383514, 0.2784314, 1, 0, 1,
-0.5298401, -0.657841, -4.828852, 0.2705882, 1, 0, 1,
-0.5260817, -0.1315461, -2.866379, 0.2666667, 1, 0, 1,
-0.5259206, 1.533733, -1.305647, 0.2588235, 1, 0, 1,
-0.5194554, -2.252665, -4.360095, 0.254902, 1, 0, 1,
-0.5157301, 0.5346963, 0.2654105, 0.2470588, 1, 0, 1,
-0.5142166, -0.8337215, -1.709015, 0.2431373, 1, 0, 1,
-0.5121244, -1.26679, -2.844207, 0.2352941, 1, 0, 1,
-0.5085317, -0.2618221, -1.646933, 0.2313726, 1, 0, 1,
-0.5079343, -0.401939, -1.831126, 0.2235294, 1, 0, 1,
-0.5061762, 0.2282239, -1.902358, 0.2196078, 1, 0, 1,
-0.5050589, -0.1510334, -2.108218, 0.2117647, 1, 0, 1,
-0.5023518, 0.6190301, 0.3884233, 0.2078431, 1, 0, 1,
-0.4937183, -1.209945, -2.537429, 0.2, 1, 0, 1,
-0.4933138, -1.286848, -2.68944, 0.1921569, 1, 0, 1,
-0.492897, -0.2998996, -1.95849, 0.1882353, 1, 0, 1,
-0.4909582, 1.3862, 0.05034239, 0.1803922, 1, 0, 1,
-0.4860872, -1.498014, -2.676738, 0.1764706, 1, 0, 1,
-0.4797461, 0.3081032, -0.6201112, 0.1686275, 1, 0, 1,
-0.4795658, -1.014091, -1.327458, 0.1647059, 1, 0, 1,
-0.4777117, 0.8439931, -0.2373697, 0.1568628, 1, 0, 1,
-0.4704717, 0.3101245, -1.111343, 0.1529412, 1, 0, 1,
-0.4690018, 0.1905657, -1.576254, 0.145098, 1, 0, 1,
-0.4679318, -0.09986784, -2.923202, 0.1411765, 1, 0, 1,
-0.4642226, 0.9669832, 0.05702909, 0.1333333, 1, 0, 1,
-0.4639031, -1.245861, -1.294424, 0.1294118, 1, 0, 1,
-0.4612702, 0.2443445, -1.83067, 0.1215686, 1, 0, 1,
-0.4605544, -0.2824887, -2.498568, 0.1176471, 1, 0, 1,
-0.452516, -0.3588894, -1.705941, 0.1098039, 1, 0, 1,
-0.4524602, 0.2670006, -2.47571, 0.1058824, 1, 0, 1,
-0.4520194, -1.006907, -2.705, 0.09803922, 1, 0, 1,
-0.4457458, 1.954179, -0.6027639, 0.09019608, 1, 0, 1,
-0.4385371, 1.340605, -0.8042501, 0.08627451, 1, 0, 1,
-0.4362614, -0.5302057, -1.880177, 0.07843138, 1, 0, 1,
-0.4343452, -2.03655, -2.307678, 0.07450981, 1, 0, 1,
-0.4256819, -1.162813, -3.572001, 0.06666667, 1, 0, 1,
-0.422271, 0.01500533, -1.318718, 0.0627451, 1, 0, 1,
-0.4220185, -0.8209603, -1.928724, 0.05490196, 1, 0, 1,
-0.4212387, 1.058684, -1.595575, 0.05098039, 1, 0, 1,
-0.4124638, -0.8538709, -1.869923, 0.04313726, 1, 0, 1,
-0.4119656, -0.1954921, 0.09392986, 0.03921569, 1, 0, 1,
-0.4112762, 0.9283503, -0.1472431, 0.03137255, 1, 0, 1,
-0.4094636, -0.910385, -2.126287, 0.02745098, 1, 0, 1,
-0.4089898, -1.510837, -2.318323, 0.01960784, 1, 0, 1,
-0.4074031, -0.5794598, -2.201421, 0.01568628, 1, 0, 1,
-0.4026048, -2.363684, -1.524295, 0.007843138, 1, 0, 1,
-0.4008715, 1.055812, -1.543154, 0.003921569, 1, 0, 1,
-0.3993022, 1.228895, 0.5230064, 0, 1, 0.003921569, 1,
-0.3983648, -0.6148776, -2.750748, 0, 1, 0.01176471, 1,
-0.3962816, 1.692673, 0.4436266, 0, 1, 0.01568628, 1,
-0.3944417, 0.8047598, -1.195314, 0, 1, 0.02352941, 1,
-0.3930632, 0.2329251, 0.5936624, 0, 1, 0.02745098, 1,
-0.3890607, -0.1416907, -2.493082, 0, 1, 0.03529412, 1,
-0.3870889, -1.2539, -2.895058, 0, 1, 0.03921569, 1,
-0.3845348, 1.608137, -0.5697238, 0, 1, 0.04705882, 1,
-0.3797886, 2.442472, -1.15145, 0, 1, 0.05098039, 1,
-0.3791422, -0.02255719, -1.022519, 0, 1, 0.05882353, 1,
-0.3779186, -0.4283067, -1.707793, 0, 1, 0.0627451, 1,
-0.3698327, 1.412783, -0.368562, 0, 1, 0.07058824, 1,
-0.3629323, 0.4105447, -0.9128412, 0, 1, 0.07450981, 1,
-0.3605493, -0.6892664, -2.414478, 0, 1, 0.08235294, 1,
-0.3517471, 0.8690393, 0.3286835, 0, 1, 0.08627451, 1,
-0.3515097, -0.1685852, -2.106116, 0, 1, 0.09411765, 1,
-0.3393226, 0.5145194, -0.4163658, 0, 1, 0.1019608, 1,
-0.3365826, 0.8384702, 1.072671, 0, 1, 0.1058824, 1,
-0.3345045, 0.3620986, -0.7776921, 0, 1, 0.1137255, 1,
-0.3326527, -0.06600772, -1.983312, 0, 1, 0.1176471, 1,
-0.3293574, 0.7682666, 0.8996192, 0, 1, 0.1254902, 1,
-0.3276987, 1.862688, -0.1736255, 0, 1, 0.1294118, 1,
-0.3269494, -0.657843, -3.563714, 0, 1, 0.1372549, 1,
-0.3242561, -2.764865, -2.352409, 0, 1, 0.1411765, 1,
-0.3079399, -1.453769, -2.96209, 0, 1, 0.1490196, 1,
-0.306861, 0.9793988, -1.069792, 0, 1, 0.1529412, 1,
-0.3058697, -0.5323986, -2.109206, 0, 1, 0.1607843, 1,
-0.3018869, 0.03863369, -0.5928266, 0, 1, 0.1647059, 1,
-0.296428, -0.5768772, -2.679839, 0, 1, 0.172549, 1,
-0.2939643, 0.1835129, 0.1477664, 0, 1, 0.1764706, 1,
-0.2933319, -0.4903923, -2.606767, 0, 1, 0.1843137, 1,
-0.292978, 1.895881, -0.03330603, 0, 1, 0.1882353, 1,
-0.2908933, -1.374598, -3.622473, 0, 1, 0.1960784, 1,
-0.2830329, 1.241009, 1.18526, 0, 1, 0.2039216, 1,
-0.2823118, 0.1857107, -2.537688, 0, 1, 0.2078431, 1,
-0.2808678, 0.7280545, -1.374224, 0, 1, 0.2156863, 1,
-0.2719421, -2.549214, -3.685677, 0, 1, 0.2196078, 1,
-0.2686499, -1.245886, -1.855517, 0, 1, 0.227451, 1,
-0.2685334, 0.3429683, -2.209548, 0, 1, 0.2313726, 1,
-0.2678245, -0.3655283, -2.042162, 0, 1, 0.2392157, 1,
-0.2666356, -0.3210768, -2.067913, 0, 1, 0.2431373, 1,
-0.2649844, -0.3694299, -2.741699, 0, 1, 0.2509804, 1,
-0.2626211, -0.08933547, -2.866833, 0, 1, 0.254902, 1,
-0.2581632, -0.6649815, -3.955093, 0, 1, 0.2627451, 1,
-0.2564871, 1.264081, 0.1778116, 0, 1, 0.2666667, 1,
-0.2549414, 0.6256059, -0.4927117, 0, 1, 0.2745098, 1,
-0.2530783, -0.126, -3.974748, 0, 1, 0.2784314, 1,
-0.251052, -0.7872335, -2.129195, 0, 1, 0.2862745, 1,
-0.2510113, -0.4584348, -2.681412, 0, 1, 0.2901961, 1,
-0.2478694, 0.863266, 0.5540415, 0, 1, 0.2980392, 1,
-0.2425378, 1.020443, -0.01588615, 0, 1, 0.3058824, 1,
-0.2421839, -0.5854691, -3.493525, 0, 1, 0.3098039, 1,
-0.2321099, 1.594485, 0.925163, 0, 1, 0.3176471, 1,
-0.2316181, -1.083698, -3.31401, 0, 1, 0.3215686, 1,
-0.2229592, -0.993314, -2.690859, 0, 1, 0.3294118, 1,
-0.2224778, -0.2999955, -3.121501, 0, 1, 0.3333333, 1,
-0.219967, 0.986718, -2.057702, 0, 1, 0.3411765, 1,
-0.2193684, -0.8940471, -2.059862, 0, 1, 0.345098, 1,
-0.2187213, 0.1334211, -2.509646, 0, 1, 0.3529412, 1,
-0.2185301, -1.014118, -2.820825, 0, 1, 0.3568628, 1,
-0.2155206, -0.9841994, -3.635796, 0, 1, 0.3647059, 1,
-0.2124068, 0.2307988, -0.5199819, 0, 1, 0.3686275, 1,
-0.2105234, 0.09438872, -2.829495, 0, 1, 0.3764706, 1,
-0.2096484, 0.3619294, -0.6542535, 0, 1, 0.3803922, 1,
-0.2093706, -0.7627519, -3.752789, 0, 1, 0.3882353, 1,
-0.2092935, 0.2237868, -0.2450249, 0, 1, 0.3921569, 1,
-0.2040282, 1.185068, 0.05879583, 0, 1, 0.4, 1,
-0.2037357, -0.2917071, -1.300091, 0, 1, 0.4078431, 1,
-0.2002301, -1.288095, -3.719564, 0, 1, 0.4117647, 1,
-0.1971649, 0.1206458, -2.064791, 0, 1, 0.4196078, 1,
-0.1968878, 0.2012554, -1.466842, 0, 1, 0.4235294, 1,
-0.1967566, 0.3877862, 0.9858464, 0, 1, 0.4313726, 1,
-0.1963704, 0.6795459, 0.3837812, 0, 1, 0.4352941, 1,
-0.1958993, 0.6554874, 0.1766431, 0, 1, 0.4431373, 1,
-0.1836782, 1.452116, 0.2869331, 0, 1, 0.4470588, 1,
-0.1824576, 0.4410312, -1.612375, 0, 1, 0.454902, 1,
-0.179766, -0.2186291, -3.973698, 0, 1, 0.4588235, 1,
-0.1787682, 1.278552, -0.1387848, 0, 1, 0.4666667, 1,
-0.1744371, -0.112252, -1.075721, 0, 1, 0.4705882, 1,
-0.1730389, -0.4044355, -2.046921, 0, 1, 0.4784314, 1,
-0.1692971, 1.593233, 0.6148365, 0, 1, 0.4823529, 1,
-0.1678928, -1.258501, -2.858974, 0, 1, 0.4901961, 1,
-0.163601, 1.193707, -1.071767, 0, 1, 0.4941176, 1,
-0.1631994, -0.8888561, -3.455853, 0, 1, 0.5019608, 1,
-0.1581069, -1.790093, -3.830834, 0, 1, 0.509804, 1,
-0.156733, 0.753624, 0.1128582, 0, 1, 0.5137255, 1,
-0.1562355, 0.5334856, -0.2441342, 0, 1, 0.5215687, 1,
-0.1557937, -0.7377926, -1.655861, 0, 1, 0.5254902, 1,
-0.1544542, 0.6168513, -1.260704, 0, 1, 0.5333334, 1,
-0.1511717, -2.286275, -2.556969, 0, 1, 0.5372549, 1,
-0.1456164, 0.2289471, -1.437555, 0, 1, 0.5450981, 1,
-0.1454483, 0.4106309, -1.20085, 0, 1, 0.5490196, 1,
-0.1434899, -0.1351398, -3.912598, 0, 1, 0.5568628, 1,
-0.1431482, 0.1628845, -0.9339681, 0, 1, 0.5607843, 1,
-0.1431032, 0.7090841, -0.3517155, 0, 1, 0.5686275, 1,
-0.1422453, -0.7131822, -2.03777, 0, 1, 0.572549, 1,
-0.1405817, -0.6683469, -4.371683, 0, 1, 0.5803922, 1,
-0.1383643, -0.4543054, -1.936373, 0, 1, 0.5843138, 1,
-0.1338192, -1.515439, -3.270665, 0, 1, 0.5921569, 1,
-0.1324364, 0.7866839, -1.012466, 0, 1, 0.5960785, 1,
-0.1320658, 1.64796, -2.179308, 0, 1, 0.6039216, 1,
-0.1307758, -1.032325, -4.50751, 0, 1, 0.6117647, 1,
-0.1307741, 0.7023705, 0.7029089, 0, 1, 0.6156863, 1,
-0.1297556, 0.8865446, -0.3337258, 0, 1, 0.6235294, 1,
-0.1261396, 1.590562, -0.06686985, 0, 1, 0.627451, 1,
-0.1251769, 2.107919, 0.02189367, 0, 1, 0.6352941, 1,
-0.1192718, 0.6230067, -0.5764703, 0, 1, 0.6392157, 1,
-0.1190759, -0.2447718, -2.812627, 0, 1, 0.6470588, 1,
-0.1128505, -1.284336, -1.78638, 0, 1, 0.6509804, 1,
-0.1117573, -1.043586, -3.838342, 0, 1, 0.6588235, 1,
-0.1101733, 1.508686, -0.8343225, 0, 1, 0.6627451, 1,
-0.1042483, 1.426559, 0.3916775, 0, 1, 0.6705883, 1,
-0.1016781, 0.06602126, -0.507206, 0, 1, 0.6745098, 1,
-0.09993982, -0.2747384, -0.6439952, 0, 1, 0.682353, 1,
-0.09897083, -1.384952, -3.097625, 0, 1, 0.6862745, 1,
-0.09567915, 0.4233049, 0.7515063, 0, 1, 0.6941177, 1,
-0.0917236, 1.214915, 0.4944403, 0, 1, 0.7019608, 1,
-0.08660641, 0.09653016, 0.9777039, 0, 1, 0.7058824, 1,
-0.08550357, -0.3526611, -1.923972, 0, 1, 0.7137255, 1,
-0.0820723, -1.218021, -2.518465, 0, 1, 0.7176471, 1,
-0.08068973, -0.1729238, -1.984806, 0, 1, 0.7254902, 1,
-0.07603617, 0.5416799, 0.7012741, 0, 1, 0.7294118, 1,
-0.07364306, 0.1468363, -1.450483, 0, 1, 0.7372549, 1,
-0.06682927, 1.501412, -0.7640767, 0, 1, 0.7411765, 1,
-0.0661995, 0.4122497, 0.3341285, 0, 1, 0.7490196, 1,
-0.06387815, 0.004165689, -1.259222, 0, 1, 0.7529412, 1,
-0.0630305, -0.5627748, -3.368404, 0, 1, 0.7607843, 1,
-0.06211504, -0.4362046, -2.607643, 0, 1, 0.7647059, 1,
-0.05281439, -0.9416927, -5.078432, 0, 1, 0.772549, 1,
-0.04823072, -1.782438, -1.508161, 0, 1, 0.7764706, 1,
-0.04790505, -1.558803, -2.785893, 0, 1, 0.7843137, 1,
-0.04543021, 0.8845941, -0.1055585, 0, 1, 0.7882353, 1,
-0.03866669, -0.1059778, -3.577806, 0, 1, 0.7960784, 1,
-0.03222958, -0.4647688, -4.624084, 0, 1, 0.8039216, 1,
-0.02902063, 0.3217722, 0.3608318, 0, 1, 0.8078431, 1,
-0.02848861, -0.5437457, -2.178903, 0, 1, 0.8156863, 1,
-0.02622806, 0.01955684, -0.1727178, 0, 1, 0.8196079, 1,
-0.02187063, 0.3470524, -0.2774582, 0, 1, 0.827451, 1,
-0.01994788, 0.4716531, -0.7547228, 0, 1, 0.8313726, 1,
-0.01328974, 0.1183232, -0.1828403, 0, 1, 0.8392157, 1,
-0.01273909, -0.1187866, -1.013142, 0, 1, 0.8431373, 1,
-0.009589125, -1.22558, -4.416549, 0, 1, 0.8509804, 1,
-0.007315778, -0.6341386, -3.702566, 0, 1, 0.854902, 1,
8.57871e-05, -1.072827, 2.845555, 0, 1, 0.8627451, 1,
0.003718766, -0.8061099, 2.581419, 0, 1, 0.8666667, 1,
0.004171039, -0.3798308, 2.283654, 0, 1, 0.8745098, 1,
0.005405663, 1.779886, 0.06734113, 0, 1, 0.8784314, 1,
0.008726903, 0.4929643, -0.184958, 0, 1, 0.8862745, 1,
0.009235119, -1.303608, 3.996173, 0, 1, 0.8901961, 1,
0.01109212, -0.35398, 2.662276, 0, 1, 0.8980392, 1,
0.01227218, 2.219569, -0.1901951, 0, 1, 0.9058824, 1,
0.01397624, -0.7486261, 2.815017, 0, 1, 0.9098039, 1,
0.01412496, 0.8449798, -0.5950258, 0, 1, 0.9176471, 1,
0.01619377, 0.7120305, -1.662354, 0, 1, 0.9215686, 1,
0.01942441, -0.274626, 4.258458, 0, 1, 0.9294118, 1,
0.02171322, -1.085141, 3.13291, 0, 1, 0.9333333, 1,
0.02269744, 0.3738563, 0.5263154, 0, 1, 0.9411765, 1,
0.02515318, 2.240361, -0.8582597, 0, 1, 0.945098, 1,
0.02865475, -0.4889356, 4.731606, 0, 1, 0.9529412, 1,
0.0296541, -0.142568, 3.212708, 0, 1, 0.9568627, 1,
0.0357995, -1.206444, 1.624466, 0, 1, 0.9647059, 1,
0.04026246, -0.9566564, 4.074591, 0, 1, 0.9686275, 1,
0.04200316, 0.09416038, 0.561753, 0, 1, 0.9764706, 1,
0.0421836, -1.44036, 4.121125, 0, 1, 0.9803922, 1,
0.04326304, -0.7814168, 3.11697, 0, 1, 0.9882353, 1,
0.04595424, -0.5280243, 4.604507, 0, 1, 0.9921569, 1,
0.04685398, 0.2192592, 1.360527, 0, 1, 1, 1,
0.04689571, -1.407095, 3.722294, 0, 0.9921569, 1, 1,
0.04940298, 0.5472307, -0.6355881, 0, 0.9882353, 1, 1,
0.05150886, 0.3961142, 1.027787, 0, 0.9803922, 1, 1,
0.05304708, 0.9480239, -0.4737639, 0, 0.9764706, 1, 1,
0.05353497, 1.56615, -2.329941, 0, 0.9686275, 1, 1,
0.0582, 0.5882773, -0.7759969, 0, 0.9647059, 1, 1,
0.06183973, -1.046972, 2.382766, 0, 0.9568627, 1, 1,
0.06231988, 1.620147, 1.158661, 0, 0.9529412, 1, 1,
0.06789648, 0.02058447, 0.8527647, 0, 0.945098, 1, 1,
0.07699352, 0.2008479, 0.9805829, 0, 0.9411765, 1, 1,
0.07911251, 0.3067482, -2.900427, 0, 0.9333333, 1, 1,
0.07955305, 0.9845899, 0.5410149, 0, 0.9294118, 1, 1,
0.08147241, -0.4893669, 2.296261, 0, 0.9215686, 1, 1,
0.08229264, 0.9419938, -1.11937, 0, 0.9176471, 1, 1,
0.08346351, -0.2659601, 4.120921, 0, 0.9098039, 1, 1,
0.08440119, -0.8905593, 2.550219, 0, 0.9058824, 1, 1,
0.08647601, -1.12272, 4.172143, 0, 0.8980392, 1, 1,
0.08939779, -0.3340985, 2.310695, 0, 0.8901961, 1, 1,
0.08985268, -0.5055935, 3.102546, 0, 0.8862745, 1, 1,
0.09228751, -0.1669769, 1.977903, 0, 0.8784314, 1, 1,
0.09284941, 0.5794596, -1.260967, 0, 0.8745098, 1, 1,
0.1028309, 0.5290577, -1.520167, 0, 0.8666667, 1, 1,
0.1039427, -0.7271779, 4.220372, 0, 0.8627451, 1, 1,
0.1051016, 1.285142, -0.8306994, 0, 0.854902, 1, 1,
0.1053732, -0.8803025, 1.667674, 0, 0.8509804, 1, 1,
0.1060345, -0.6180817, 2.461708, 0, 0.8431373, 1, 1,
0.1066351, -0.4637729, 1.391207, 0, 0.8392157, 1, 1,
0.1073265, -1.377386, 4.278921, 0, 0.8313726, 1, 1,
0.1077569, 1.281509, 3.084619, 0, 0.827451, 1, 1,
0.1138267, -2.489796, 1.0654, 0, 0.8196079, 1, 1,
0.1145217, 0.9222268, -0.9220247, 0, 0.8156863, 1, 1,
0.1148083, -0.1144614, 1.354043, 0, 0.8078431, 1, 1,
0.1155061, -0.8994834, 0.9373092, 0, 0.8039216, 1, 1,
0.1199038, 0.8341475, 0.3861198, 0, 0.7960784, 1, 1,
0.1205333, 1.243438, -0.9632291, 0, 0.7882353, 1, 1,
0.123607, 1.346815, 0.8005238, 0, 0.7843137, 1, 1,
0.125925, -1.284796, 3.536548, 0, 0.7764706, 1, 1,
0.1277629, -0.6273575, 1.911383, 0, 0.772549, 1, 1,
0.1324914, 1.129122, -0.02157929, 0, 0.7647059, 1, 1,
0.1344969, -0.8958208, 1.765708, 0, 0.7607843, 1, 1,
0.1400761, 0.2630034, 1.006072, 0, 0.7529412, 1, 1,
0.1403886, 0.4505166, -0.1433106, 0, 0.7490196, 1, 1,
0.1404179, 1.743517, -0.3168128, 0, 0.7411765, 1, 1,
0.1412246, 1.076917, 0.2885141, 0, 0.7372549, 1, 1,
0.1412746, -0.8422121, 4.161805, 0, 0.7294118, 1, 1,
0.1448707, -0.1710726, 1.656056, 0, 0.7254902, 1, 1,
0.1452361, 0.9926849, -0.4601461, 0, 0.7176471, 1, 1,
0.1456427, 0.7931331, 1.484037, 0, 0.7137255, 1, 1,
0.1469467, -0.4097969, 3.489109, 0, 0.7058824, 1, 1,
0.1474837, -0.4056819, 1.889648, 0, 0.6980392, 1, 1,
0.1492418, 0.1897337, 0.9084897, 0, 0.6941177, 1, 1,
0.1497034, -2.179488, 3.999057, 0, 0.6862745, 1, 1,
0.151669, 1.021895, -0.1658581, 0, 0.682353, 1, 1,
0.1548106, 0.06261633, 1.779765, 0, 0.6745098, 1, 1,
0.1601131, 0.5100037, -0.7275787, 0, 0.6705883, 1, 1,
0.1627891, -0.02589065, 1.312265, 0, 0.6627451, 1, 1,
0.1633108, -0.4106801, 2.773429, 0, 0.6588235, 1, 1,
0.1680271, 0.457485, 1.029346, 0, 0.6509804, 1, 1,
0.1696356, -0.4771887, 4.127662, 0, 0.6470588, 1, 1,
0.1708812, -0.6989184, 3.070598, 0, 0.6392157, 1, 1,
0.1712624, 0.04521982, -0.1703535, 0, 0.6352941, 1, 1,
0.1716365, -1.842811, 2.616347, 0, 0.627451, 1, 1,
0.1731202, -0.5390831, 1.702736, 0, 0.6235294, 1, 1,
0.1747112, -1.963522, 3.691194, 0, 0.6156863, 1, 1,
0.1774124, -1.453201, 3.543393, 0, 0.6117647, 1, 1,
0.1774939, -1.953278, 2.698689, 0, 0.6039216, 1, 1,
0.1784431, 1.334941, -0.5542051, 0, 0.5960785, 1, 1,
0.1785282, 0.4850664, 0.1002469, 0, 0.5921569, 1, 1,
0.1785505, -0.3142358, 3.694041, 0, 0.5843138, 1, 1,
0.1832634, 0.8772177, 1.46121, 0, 0.5803922, 1, 1,
0.1852921, 0.3124158, 1.441109, 0, 0.572549, 1, 1,
0.1904558, 0.4220279, 1.205277, 0, 0.5686275, 1, 1,
0.1942629, 0.7827601, 1.177367, 0, 0.5607843, 1, 1,
0.1951229, 1.627941, -0.4890025, 0, 0.5568628, 1, 1,
0.197379, 0.7465994, -0.1193121, 0, 0.5490196, 1, 1,
0.1978557, 1.541337, 0.6691748, 0, 0.5450981, 1, 1,
0.1985261, -0.09914885, 3.036646, 0, 0.5372549, 1, 1,
0.2015103, 0.58481, -0.7745129, 0, 0.5333334, 1, 1,
0.2059775, 1.553923, 0.9445012, 0, 0.5254902, 1, 1,
0.2062934, 0.6883255, 0.402352, 0, 0.5215687, 1, 1,
0.2117517, 1.268454, 0.3082529, 0, 0.5137255, 1, 1,
0.2124208, -2.459666, 2.498998, 0, 0.509804, 1, 1,
0.2137038, -0.6989844, 2.588849, 0, 0.5019608, 1, 1,
0.2157289, -0.3262309, 1.44753, 0, 0.4941176, 1, 1,
0.2184665, -0.693259, 2.738303, 0, 0.4901961, 1, 1,
0.2188123, 1.083693, 1.57771, 0, 0.4823529, 1, 1,
0.219115, 0.9216707, -0.8739302, 0, 0.4784314, 1, 1,
0.2216916, 0.3192299, 1.860285, 0, 0.4705882, 1, 1,
0.2251474, -0.3897633, 3.913703, 0, 0.4666667, 1, 1,
0.2335885, 0.598527, 0.01832554, 0, 0.4588235, 1, 1,
0.2388708, 0.9023305, -0.0214923, 0, 0.454902, 1, 1,
0.2461385, 0.7024719, 0.4920743, 0, 0.4470588, 1, 1,
0.2473075, -0.7013156, 5.019519, 0, 0.4431373, 1, 1,
0.247741, -1.353038, 2.573675, 0, 0.4352941, 1, 1,
0.2525971, -0.8687531, 3.245562, 0, 0.4313726, 1, 1,
0.2596098, 0.04816953, 0.3020017, 0, 0.4235294, 1, 1,
0.2618737, -0.7769303, 3.628284, 0, 0.4196078, 1, 1,
0.2639599, 0.540012, -0.0266419, 0, 0.4117647, 1, 1,
0.2640505, 0.7390252, -1.505785, 0, 0.4078431, 1, 1,
0.2664197, 0.5299319, 0.01973162, 0, 0.4, 1, 1,
0.267967, 0.4564025, 0.6496083, 0, 0.3921569, 1, 1,
0.2697807, -1.046681, 5.171904, 0, 0.3882353, 1, 1,
0.2729802, -0.7621663, 3.05756, 0, 0.3803922, 1, 1,
0.2730106, -1.195258, 2.682201, 0, 0.3764706, 1, 1,
0.2731676, -1.983349, 4.071551, 0, 0.3686275, 1, 1,
0.2743135, 0.6096342, 0.2738681, 0, 0.3647059, 1, 1,
0.2759059, 0.4408699, 0.1794922, 0, 0.3568628, 1, 1,
0.2760669, 0.3895838, 1.579387, 0, 0.3529412, 1, 1,
0.2778974, 0.5061797, 0.7935028, 0, 0.345098, 1, 1,
0.2781278, 0.9607659, 1.052146, 0, 0.3411765, 1, 1,
0.2814154, 0.2739303, 0.8212869, 0, 0.3333333, 1, 1,
0.2848213, 0.7000243, 1.250311, 0, 0.3294118, 1, 1,
0.2862827, -0.2447713, 1.835699, 0, 0.3215686, 1, 1,
0.2898045, -0.5818441, 2.147439, 0, 0.3176471, 1, 1,
0.2924158, 0.6195608, 0.6495566, 0, 0.3098039, 1, 1,
0.2924595, -0.1634351, 2.241818, 0, 0.3058824, 1, 1,
0.2953982, -0.1347335, 2.623828, 0, 0.2980392, 1, 1,
0.2971434, -0.2730728, 1.513277, 0, 0.2901961, 1, 1,
0.2975262, -0.05991706, 1.881738, 0, 0.2862745, 1, 1,
0.307929, 0.3077493, -0.0742446, 0, 0.2784314, 1, 1,
0.3087704, 0.1355667, 1.114064, 0, 0.2745098, 1, 1,
0.3130771, 0.655489, 0.4295071, 0, 0.2666667, 1, 1,
0.3138383, -0.2081121, 3.787564, 0, 0.2627451, 1, 1,
0.3161599, -0.1048912, 0.4615887, 0, 0.254902, 1, 1,
0.317638, -1.160189, 3.063106, 0, 0.2509804, 1, 1,
0.3228803, 1.295526, 0.1806649, 0, 0.2431373, 1, 1,
0.3255082, -0.1460311, 2.22048, 0, 0.2392157, 1, 1,
0.3256887, 1.009217, -0.5116432, 0, 0.2313726, 1, 1,
0.3271323, -0.2799527, 0.9446679, 0, 0.227451, 1, 1,
0.3283058, 0.6080278, 0.114862, 0, 0.2196078, 1, 1,
0.3328735, 0.3738662, 0.8354238, 0, 0.2156863, 1, 1,
0.3373858, -0.1615447, 1.277085, 0, 0.2078431, 1, 1,
0.3399711, 0.8460752, -0.2544487, 0, 0.2039216, 1, 1,
0.341181, 1.346542, 0.03598356, 0, 0.1960784, 1, 1,
0.3416974, -0.6870335, 2.260288, 0, 0.1882353, 1, 1,
0.3421148, -1.441094, 2.286036, 0, 0.1843137, 1, 1,
0.3462884, -1.015161, 2.5568, 0, 0.1764706, 1, 1,
0.3466494, 0.9784466, -1.383695, 0, 0.172549, 1, 1,
0.3482961, 0.8182465, 0.7227468, 0, 0.1647059, 1, 1,
0.3488283, -0.8737031, 2.767433, 0, 0.1607843, 1, 1,
0.3573131, 0.9166224, 0.8610373, 0, 0.1529412, 1, 1,
0.3597989, -1.430186, 2.044343, 0, 0.1490196, 1, 1,
0.3601186, -0.6923939, 3.484317, 0, 0.1411765, 1, 1,
0.3644671, -1.575893, 2.653305, 0, 0.1372549, 1, 1,
0.3683605, 0.6857065, 0.1025728, 0, 0.1294118, 1, 1,
0.3702146, 0.1051866, 0.9733123, 0, 0.1254902, 1, 1,
0.3728698, 0.1223968, 1.995025, 0, 0.1176471, 1, 1,
0.3730355, -1.67622, 2.268439, 0, 0.1137255, 1, 1,
0.3757958, 1.04441, -2.41536, 0, 0.1058824, 1, 1,
0.3758087, -0.1755512, 3.504161, 0, 0.09803922, 1, 1,
0.3817406, -3.021469, 4.30552, 0, 0.09411765, 1, 1,
0.3842598, -0.7207468, 2.724933, 0, 0.08627451, 1, 1,
0.3851634, -1.063376, 2.900954, 0, 0.08235294, 1, 1,
0.385473, -0.6323218, 3.235551, 0, 0.07450981, 1, 1,
0.3873231, 0.4059041, 1.603398, 0, 0.07058824, 1, 1,
0.3875793, -1.023027, 3.29302, 0, 0.0627451, 1, 1,
0.3919533, 1.270737, 0.4112294, 0, 0.05882353, 1, 1,
0.3919623, 0.9829648, -1.526332, 0, 0.05098039, 1, 1,
0.3985653, -0.3335601, 0.9009191, 0, 0.04705882, 1, 1,
0.4030321, 0.8067546, 0.03694194, 0, 0.03921569, 1, 1,
0.4037688, 0.2642565, 0.9243276, 0, 0.03529412, 1, 1,
0.4063621, 0.5997712, 1.267753, 0, 0.02745098, 1, 1,
0.4070229, 0.2593673, 0.4000095, 0, 0.02352941, 1, 1,
0.4256134, 0.1488131, 1.994726, 0, 0.01568628, 1, 1,
0.4269376, -0.3021578, 2.587947, 0, 0.01176471, 1, 1,
0.4319485, 1.057649, 0.2488895, 0, 0.003921569, 1, 1,
0.4353333, 0.1748504, 2.378301, 0.003921569, 0, 1, 1,
0.436213, 1.291848, 0.7619807, 0.007843138, 0, 1, 1,
0.4366642, 0.1800608, -0.6244774, 0.01568628, 0, 1, 1,
0.4376697, -0.2604818, 1.756449, 0.01960784, 0, 1, 1,
0.4389389, 0.8506036, -0.2825064, 0.02745098, 0, 1, 1,
0.4399985, -1.589606, 3.738528, 0.03137255, 0, 1, 1,
0.4486916, -0.07405084, 2.242733, 0.03921569, 0, 1, 1,
0.4503354, 1.046194, 1.327899, 0.04313726, 0, 1, 1,
0.4513814, -1.747042, 3.737886, 0.05098039, 0, 1, 1,
0.4564815, 1.323154, 0.675743, 0.05490196, 0, 1, 1,
0.4579573, 1.530603, 1.013173, 0.0627451, 0, 1, 1,
0.4636473, -1.43669, 2.473249, 0.06666667, 0, 1, 1,
0.467492, -0.9393834, 2.712273, 0.07450981, 0, 1, 1,
0.4678404, 1.547219, 2.080802, 0.07843138, 0, 1, 1,
0.4701935, 0.5152503, -0.5851863, 0.08627451, 0, 1, 1,
0.4704138, -0.05288851, 2.062431, 0.09019608, 0, 1, 1,
0.4716507, 0.04658936, 2.541477, 0.09803922, 0, 1, 1,
0.4717229, -0.4753122, 1.988966, 0.1058824, 0, 1, 1,
0.4757333, 0.5466669, 0.4918235, 0.1098039, 0, 1, 1,
0.4807086, -0.6411304, 4.334177, 0.1176471, 0, 1, 1,
0.4850638, 1.569566, 0.341308, 0.1215686, 0, 1, 1,
0.4872265, -0.003043242, 1.90828, 0.1294118, 0, 1, 1,
0.4892361, 1.982612, 0.07990716, 0.1333333, 0, 1, 1,
0.4899903, 0.5321268, -0.7467413, 0.1411765, 0, 1, 1,
0.4901243, 1.419889, -0.581876, 0.145098, 0, 1, 1,
0.4911073, 0.02437995, 2.581937, 0.1529412, 0, 1, 1,
0.4917981, 1.651174, 2.182715, 0.1568628, 0, 1, 1,
0.4936984, -0.4116769, 4.432724, 0.1647059, 0, 1, 1,
0.4983509, 0.540381, -0.929237, 0.1686275, 0, 1, 1,
0.5019546, 0.9933492, -0.3453887, 0.1764706, 0, 1, 1,
0.5031963, 0.515404, 1.247981, 0.1803922, 0, 1, 1,
0.5056034, -1.426214, 2.271818, 0.1882353, 0, 1, 1,
0.5076149, 0.8695112, 0.3425694, 0.1921569, 0, 1, 1,
0.5094674, -0.709496, 3.482569, 0.2, 0, 1, 1,
0.5109857, -2.260166, 1.408098, 0.2078431, 0, 1, 1,
0.5129966, 3.097617, 0.8956683, 0.2117647, 0, 1, 1,
0.5209749, -0.9865479, 2.812327, 0.2196078, 0, 1, 1,
0.5221148, 0.4276549, -0.6027123, 0.2235294, 0, 1, 1,
0.523554, -0.2417798, 1.675492, 0.2313726, 0, 1, 1,
0.5257916, 0.3192157, 0.8689063, 0.2352941, 0, 1, 1,
0.5295839, 1.135573, -0.2281849, 0.2431373, 0, 1, 1,
0.5304691, -0.03370424, 3.230259, 0.2470588, 0, 1, 1,
0.5314626, 0.3640747, 0.5211484, 0.254902, 0, 1, 1,
0.5316627, 0.101662, 0.009430354, 0.2588235, 0, 1, 1,
0.5361009, 0.05221738, 2.296715, 0.2666667, 0, 1, 1,
0.5370005, -0.536113, 3.312063, 0.2705882, 0, 1, 1,
0.5378616, -0.3856457, 1.777902, 0.2784314, 0, 1, 1,
0.5446903, 1.230657, -1.401294, 0.282353, 0, 1, 1,
0.5456378, -1.274727, 3.294087, 0.2901961, 0, 1, 1,
0.5490332, -1.777342, 2.170175, 0.2941177, 0, 1, 1,
0.5519449, -1.078204, 4.064802, 0.3019608, 0, 1, 1,
0.5542045, 1.786779, 1.475136, 0.3098039, 0, 1, 1,
0.5547834, 0.6958556, 0.06413125, 0.3137255, 0, 1, 1,
0.5552676, -2.266034, 2.801349, 0.3215686, 0, 1, 1,
0.5573454, -1.110156, 3.179206, 0.3254902, 0, 1, 1,
0.5594074, -0.4507886, 1.339821, 0.3333333, 0, 1, 1,
0.5604315, -1.627603, 3.579556, 0.3372549, 0, 1, 1,
0.5689047, 0.2185533, 1.436053, 0.345098, 0, 1, 1,
0.5708702, -1.841861, 1.052281, 0.3490196, 0, 1, 1,
0.5710579, 0.5601015, -1.292168, 0.3568628, 0, 1, 1,
0.576112, 0.3799951, 1.829624, 0.3607843, 0, 1, 1,
0.5872583, -0.563977, 3.514214, 0.3686275, 0, 1, 1,
0.5901162, -0.4623089, 1.622665, 0.372549, 0, 1, 1,
0.6043763, 0.7536154, 0.8656101, 0.3803922, 0, 1, 1,
0.6085178, 0.7159393, 1.130102, 0.3843137, 0, 1, 1,
0.6105442, -0.03409956, 3.690741, 0.3921569, 0, 1, 1,
0.6108491, -0.7760998, 4.890449, 0.3960784, 0, 1, 1,
0.611725, 0.1683749, 0.8783327, 0.4039216, 0, 1, 1,
0.6149352, 1.112077, -0.4424729, 0.4117647, 0, 1, 1,
0.6205652, 1.815459, 1.566072, 0.4156863, 0, 1, 1,
0.6233258, -0.3332333, 2.935885, 0.4235294, 0, 1, 1,
0.6260212, -1.913434, 1.632665, 0.427451, 0, 1, 1,
0.6268093, 0.51144, -0.07435539, 0.4352941, 0, 1, 1,
0.6283122, -1.978966, 3.056607, 0.4392157, 0, 1, 1,
0.6285242, 1.151292, 1.702368, 0.4470588, 0, 1, 1,
0.6291075, -0.4850696, 2.445973, 0.4509804, 0, 1, 1,
0.6369588, -0.1343122, 1.511667, 0.4588235, 0, 1, 1,
0.6370036, 0.5322229, 2.426452, 0.4627451, 0, 1, 1,
0.6394866, 0.299533, 0.6677757, 0.4705882, 0, 1, 1,
0.6396633, -1.096691, 2.235489, 0.4745098, 0, 1, 1,
0.6426648, -0.5851548, 0.4549181, 0.4823529, 0, 1, 1,
0.6454186, 0.2747163, 1.373242, 0.4862745, 0, 1, 1,
0.6482887, -0.2675932, -0.4036826, 0.4941176, 0, 1, 1,
0.6506778, -0.2778417, 3.279718, 0.5019608, 0, 1, 1,
0.6560317, 0.505808, 0.5857866, 0.5058824, 0, 1, 1,
0.6580819, 1.4636, -1.292197, 0.5137255, 0, 1, 1,
0.6590072, -0.652769, 4.517279, 0.5176471, 0, 1, 1,
0.6658541, 0.2152268, 1.845852, 0.5254902, 0, 1, 1,
0.6669858, -0.01784421, 0.5578213, 0.5294118, 0, 1, 1,
0.6722908, 1.2556, 0.3163499, 0.5372549, 0, 1, 1,
0.6746343, -0.4302023, 1.83971, 0.5411765, 0, 1, 1,
0.6824201, 0.8552392, 0.6250418, 0.5490196, 0, 1, 1,
0.6837959, 0.3995962, 1.768557, 0.5529412, 0, 1, 1,
0.6839885, 1.272634, 0.5664201, 0.5607843, 0, 1, 1,
0.685597, -0.5556693, 1.766673, 0.5647059, 0, 1, 1,
0.6865553, 0.2289945, 2.372024, 0.572549, 0, 1, 1,
0.6883838, -1.472533, 1.778172, 0.5764706, 0, 1, 1,
0.6904179, 0.5211945, 1.458419, 0.5843138, 0, 1, 1,
0.7041624, 0.7041016, 1.268963, 0.5882353, 0, 1, 1,
0.7042059, 0.4187557, 0.4190854, 0.5960785, 0, 1, 1,
0.7099126, -0.7820338, 1.963391, 0.6039216, 0, 1, 1,
0.7122486, -1.990709, 2.199841, 0.6078432, 0, 1, 1,
0.7284597, -1.287077, 4.366127, 0.6156863, 0, 1, 1,
0.7295679, 3.047936, 1.422276, 0.6196079, 0, 1, 1,
0.7336494, -1.328968, 0.8215541, 0.627451, 0, 1, 1,
0.7337805, 0.2522541, 2.277085, 0.6313726, 0, 1, 1,
0.7353589, -1.196029, 1.104381, 0.6392157, 0, 1, 1,
0.736213, 0.1475714, 1.415158, 0.6431373, 0, 1, 1,
0.7368262, -1.066537, 2.278615, 0.6509804, 0, 1, 1,
0.746752, 0.8069362, 1.133729, 0.654902, 0, 1, 1,
0.7484399, -1.427895, 3.983588, 0.6627451, 0, 1, 1,
0.7595159, 1.130267, -1.015585, 0.6666667, 0, 1, 1,
0.7609675, -0.8615518, 2.159456, 0.6745098, 0, 1, 1,
0.7651223, -1.292941, 3.056364, 0.6784314, 0, 1, 1,
0.7672378, -0.9685034, 3.90407, 0.6862745, 0, 1, 1,
0.7684032, 1.939044, 1.049275, 0.6901961, 0, 1, 1,
0.7693978, 0.3540011, 1.260693, 0.6980392, 0, 1, 1,
0.7780955, 0.1182194, 1.502534, 0.7058824, 0, 1, 1,
0.7815955, -0.2915705, 1.625303, 0.7098039, 0, 1, 1,
0.7832305, 0.7592986, -0.5691902, 0.7176471, 0, 1, 1,
0.7845995, -1.336879, 1.648528, 0.7215686, 0, 1, 1,
0.7867517, -0.7515393, 2.042128, 0.7294118, 0, 1, 1,
0.7914322, 1.042249, -0.4422332, 0.7333333, 0, 1, 1,
0.7914945, 0.0685944, -0.1344361, 0.7411765, 0, 1, 1,
0.7919472, 0.1245659, 2.962003, 0.7450981, 0, 1, 1,
0.79319, 0.7209283, -0.5079871, 0.7529412, 0, 1, 1,
0.7935771, -0.6854229, 2.619705, 0.7568628, 0, 1, 1,
0.8009414, 0.2219174, 1.031544, 0.7647059, 0, 1, 1,
0.8038918, -1.465331, 3.964148, 0.7686275, 0, 1, 1,
0.8056853, -0.0687283, 2.029193, 0.7764706, 0, 1, 1,
0.8094535, 0.5561678, 0.7959501, 0.7803922, 0, 1, 1,
0.8144467, 0.1489892, 0.7701215, 0.7882353, 0, 1, 1,
0.8148862, 0.9048944, 0.2623138, 0.7921569, 0, 1, 1,
0.8179954, -0.6609446, 3.350569, 0.8, 0, 1, 1,
0.8395028, -1.285527, 2.595924, 0.8078431, 0, 1, 1,
0.8421319, -0.1443049, 2.088471, 0.8117647, 0, 1, 1,
0.854148, 0.9108682, 2.409422, 0.8196079, 0, 1, 1,
0.8741477, 0.4042104, 0.574985, 0.8235294, 0, 1, 1,
0.8780423, -0.2991886, 4.33839, 0.8313726, 0, 1, 1,
0.8780733, 1.502814, 1.769957, 0.8352941, 0, 1, 1,
0.8851268, -0.5597778, 4.036062, 0.8431373, 0, 1, 1,
0.8916151, 0.07482676, 1.353361, 0.8470588, 0, 1, 1,
0.8919537, -1.0831, 2.492846, 0.854902, 0, 1, 1,
0.8930381, -3.080831, 4.214461, 0.8588235, 0, 1, 1,
0.8960047, -0.1545968, 2.332561, 0.8666667, 0, 1, 1,
0.8982154, -0.4626428, 1.419316, 0.8705882, 0, 1, 1,
0.902346, -0.05283458, 0.4853883, 0.8784314, 0, 1, 1,
0.9069595, -0.9770701, 2.086692, 0.8823529, 0, 1, 1,
0.9083881, -0.02885125, 1.605969, 0.8901961, 0, 1, 1,
0.9173253, -0.6273671, 0.09970257, 0.8941177, 0, 1, 1,
0.920121, -1.143286, 2.93866, 0.9019608, 0, 1, 1,
0.9218535, 1.819135, 1.189518, 0.9098039, 0, 1, 1,
0.924527, 0.08576418, -0.3220378, 0.9137255, 0, 1, 1,
0.9333333, 0.1987952, 1.258548, 0.9215686, 0, 1, 1,
0.9415633, -1.298581, 1.490083, 0.9254902, 0, 1, 1,
0.9436036, 0.9129757, -0.6723016, 0.9333333, 0, 1, 1,
0.9536964, -0.2433507, 1.240961, 0.9372549, 0, 1, 1,
0.9537853, -0.6736929, 1.786078, 0.945098, 0, 1, 1,
0.9545001, 0.1467894, 2.692124, 0.9490196, 0, 1, 1,
0.9600909, -0.110883, 0.9300911, 0.9568627, 0, 1, 1,
0.9611502, -2.438513, 1.882353, 0.9607843, 0, 1, 1,
0.96183, 0.4933971, 1.271424, 0.9686275, 0, 1, 1,
0.986681, -0.5928699, -0.3690201, 0.972549, 0, 1, 1,
0.9907238, 1.870106, 0.04294263, 0.9803922, 0, 1, 1,
0.9916793, 0.4105432, -0.1491775, 0.9843137, 0, 1, 1,
0.9993346, 0.9266512, 1.470427, 0.9921569, 0, 1, 1,
1.002074, -0.06591483, 2.480888, 0.9960784, 0, 1, 1,
1.003875, -0.4989036, 2.277641, 1, 0, 0.9960784, 1,
1.008412, -0.4692746, 1.907499, 1, 0, 0.9882353, 1,
1.013249, -0.8671271, 2.678432, 1, 0, 0.9843137, 1,
1.020755, 0.314867, 2.129973, 1, 0, 0.9764706, 1,
1.025879, -0.797271, 2.106111, 1, 0, 0.972549, 1,
1.02696, 1.052119, 0.9170337, 1, 0, 0.9647059, 1,
1.030678, -0.8620501, 2.866136, 1, 0, 0.9607843, 1,
1.032717, -0.4692492, 2.726837, 1, 0, 0.9529412, 1,
1.034335, -0.07005179, 3.529525, 1, 0, 0.9490196, 1,
1.035371, -2.208194, 3.055214, 1, 0, 0.9411765, 1,
1.036592, 0.240977, 0.5950967, 1, 0, 0.9372549, 1,
1.052395, -1.341389, 2.809867, 1, 0, 0.9294118, 1,
1.05949, 0.4209852, -0.2000265, 1, 0, 0.9254902, 1,
1.065251, 1.552245, 1.333339, 1, 0, 0.9176471, 1,
1.083238, -0.3388815, 2.681743, 1, 0, 0.9137255, 1,
1.089477, -0.9581211, 3.70198, 1, 0, 0.9058824, 1,
1.100731, -0.01473429, 0.8065005, 1, 0, 0.9019608, 1,
1.103011, -1.153306, 2.345905, 1, 0, 0.8941177, 1,
1.105914, 0.4944993, 1.194246, 1, 0, 0.8862745, 1,
1.111278, -0.1437963, 1.556738, 1, 0, 0.8823529, 1,
1.113573, -0.9078453, 3.43071, 1, 0, 0.8745098, 1,
1.119133, -1.997434, 2.050232, 1, 0, 0.8705882, 1,
1.138053, 1.266179, -0.137034, 1, 0, 0.8627451, 1,
1.138827, 1.159878, 1.045893, 1, 0, 0.8588235, 1,
1.139796, 0.729966, 0.1521306, 1, 0, 0.8509804, 1,
1.141582, -0.2375046, 0.9540397, 1, 0, 0.8470588, 1,
1.142785, -0.4019931, 2.2657, 1, 0, 0.8392157, 1,
1.148017, -0.3683437, 2.349197, 1, 0, 0.8352941, 1,
1.158646, -0.1913941, 1.645061, 1, 0, 0.827451, 1,
1.161813, -0.571423, 3.508887, 1, 0, 0.8235294, 1,
1.162225, 1.68228, 1.975599, 1, 0, 0.8156863, 1,
1.166986, -1.920851, 2.084161, 1, 0, 0.8117647, 1,
1.171061, 1.209493, -0.003776326, 1, 0, 0.8039216, 1,
1.172454, 0.7550905, 0.25043, 1, 0, 0.7960784, 1,
1.175714, 0.1514664, 0.2967206, 1, 0, 0.7921569, 1,
1.182387, -0.6527165, 2.849322, 1, 0, 0.7843137, 1,
1.187428, -0.4724104, 3.967756, 1, 0, 0.7803922, 1,
1.193621, -0.01719028, 0.9815228, 1, 0, 0.772549, 1,
1.194092, 0.840001, 1.070438, 1, 0, 0.7686275, 1,
1.194604, -0.7932839, 3.670355, 1, 0, 0.7607843, 1,
1.204821, 1.182972, -0.5188019, 1, 0, 0.7568628, 1,
1.21011, 0.7600829, 0.8354265, 1, 0, 0.7490196, 1,
1.223083, 0.02732237, 2.101555, 1, 0, 0.7450981, 1,
1.226307, -0.09333289, 2.202307, 1, 0, 0.7372549, 1,
1.233517, 0.2669031, 2.400316, 1, 0, 0.7333333, 1,
1.247086, -0.6839487, 1.447006, 1, 0, 0.7254902, 1,
1.253939, -1.448572, 3.518086, 1, 0, 0.7215686, 1,
1.262284, -0.3746515, 3.092765, 1, 0, 0.7137255, 1,
1.262581, -0.9082559, 3.614586, 1, 0, 0.7098039, 1,
1.264693, -0.8692567, 3.045401, 1, 0, 0.7019608, 1,
1.280467, -1.328056, 1.40675, 1, 0, 0.6941177, 1,
1.281694, 0.6698742, 1.251702, 1, 0, 0.6901961, 1,
1.306221, 0.484179, 0.9353206, 1, 0, 0.682353, 1,
1.316198, 0.2044999, 0.0408149, 1, 0, 0.6784314, 1,
1.318846, -0.7113805, 0.7759027, 1, 0, 0.6705883, 1,
1.328349, 0.7227553, 0.3499763, 1, 0, 0.6666667, 1,
1.335546, 1.545004, -0.9706652, 1, 0, 0.6588235, 1,
1.336072, 0.2922314, 1.079568, 1, 0, 0.654902, 1,
1.339873, -0.08571942, 1.422032, 1, 0, 0.6470588, 1,
1.339981, -1.439686, 0.9149605, 1, 0, 0.6431373, 1,
1.346882, 1.024011, -0.408898, 1, 0, 0.6352941, 1,
1.348082, 2.120682, 1.45017, 1, 0, 0.6313726, 1,
1.351292, 1.119315, -0.2752936, 1, 0, 0.6235294, 1,
1.355814, -0.04551948, 0.1139183, 1, 0, 0.6196079, 1,
1.36031, 0.07099598, 1.26278, 1, 0, 0.6117647, 1,
1.373536, -0.2661007, 3.476559, 1, 0, 0.6078432, 1,
1.37474, 1.350511, 1.671287, 1, 0, 0.6, 1,
1.378126, 1.404505, 0.8226724, 1, 0, 0.5921569, 1,
1.382807, -1.095113, 1.966948, 1, 0, 0.5882353, 1,
1.385122, -0.4063508, 2.4427, 1, 0, 0.5803922, 1,
1.385696, 0.5084292, 1.553726, 1, 0, 0.5764706, 1,
1.38691, 1.323159, -0.2616938, 1, 0, 0.5686275, 1,
1.390421, 0.6699826, 1.811928, 1, 0, 0.5647059, 1,
1.392238, -1.209302, 2.003327, 1, 0, 0.5568628, 1,
1.39744, -0.006405029, 1.930861, 1, 0, 0.5529412, 1,
1.402818, 0.242084, 1.844677, 1, 0, 0.5450981, 1,
1.415702, 0.4742821, 1.21857, 1, 0, 0.5411765, 1,
1.426955, -0.4862335, 2.330294, 1, 0, 0.5333334, 1,
1.435886, -0.3530674, 2.643473, 1, 0, 0.5294118, 1,
1.436793, -0.6947935, 2.739298, 1, 0, 0.5215687, 1,
1.438139, 0.5187531, 0.5195678, 1, 0, 0.5176471, 1,
1.457694, 1.370768, 1.652151, 1, 0, 0.509804, 1,
1.463677, -1.256617, 2.960258, 1, 0, 0.5058824, 1,
1.463684, 1.331378, 0.6694136, 1, 0, 0.4980392, 1,
1.468717, 1.109257, 1.348716, 1, 0, 0.4901961, 1,
1.472247, 0.6593879, 0.009684234, 1, 0, 0.4862745, 1,
1.493823, 0.08121798, 1.746501, 1, 0, 0.4784314, 1,
1.50258, 0.6978256, 0.3621282, 1, 0, 0.4745098, 1,
1.503892, -0.8827183, 2.579991, 1, 0, 0.4666667, 1,
1.504966, 0.09193657, 1.533346, 1, 0, 0.4627451, 1,
1.509086, -0.3777973, 3.519996, 1, 0, 0.454902, 1,
1.513309, -0.5864092, 3.349911, 1, 0, 0.4509804, 1,
1.518975, -1.163146, 2.062928, 1, 0, 0.4431373, 1,
1.523516, -0.6059296, 3.416821, 1, 0, 0.4392157, 1,
1.538011, -0.351274, 2.072862, 1, 0, 0.4313726, 1,
1.546309, -0.1186429, 1.802568, 1, 0, 0.427451, 1,
1.547409, -1.502995, 1.760632, 1, 0, 0.4196078, 1,
1.556538, -0.2448174, 1.650167, 1, 0, 0.4156863, 1,
1.5567, 0.9114028, 0.4815048, 1, 0, 0.4078431, 1,
1.572528, -0.954194, 1.493703, 1, 0, 0.4039216, 1,
1.572978, 1.890586, 2.10588, 1, 0, 0.3960784, 1,
1.576116, -1.442388, 1.583571, 1, 0, 0.3882353, 1,
1.578998, -1.254997, 1.979891, 1, 0, 0.3843137, 1,
1.580444, -1.373453, 2.030506, 1, 0, 0.3764706, 1,
1.585762, -0.5460432, 4.616756, 1, 0, 0.372549, 1,
1.586171, 0.5401204, 1.335731, 1, 0, 0.3647059, 1,
1.591823, -0.7745274, 3.055936, 1, 0, 0.3607843, 1,
1.592023, -0.03533994, 0.3107773, 1, 0, 0.3529412, 1,
1.595444, 0.4917097, 1.289828, 1, 0, 0.3490196, 1,
1.596379, 0.2944248, -0.4178465, 1, 0, 0.3411765, 1,
1.60261, 0.06337587, 0.7775287, 1, 0, 0.3372549, 1,
1.607584, -0.513912, 0.04825838, 1, 0, 0.3294118, 1,
1.608284, 0.2501133, -0.6947633, 1, 0, 0.3254902, 1,
1.625615, 0.5347083, 1.876033, 1, 0, 0.3176471, 1,
1.641093, 0.1123233, 1.856697, 1, 0, 0.3137255, 1,
1.6486, -1.480148, 1.050418, 1, 0, 0.3058824, 1,
1.651421, -1.495034, 1.738338, 1, 0, 0.2980392, 1,
1.67255, -0.6934303, 1.666979, 1, 0, 0.2941177, 1,
1.674805, -0.6780633, 2.05106, 1, 0, 0.2862745, 1,
1.678089, 0.5162236, 3.018303, 1, 0, 0.282353, 1,
1.687378, -0.7313706, 2.046933, 1, 0, 0.2745098, 1,
1.69635, 0.1650226, 0.142368, 1, 0, 0.2705882, 1,
1.708288, 0.851342, 1.912503, 1, 0, 0.2627451, 1,
1.708776, 1.415294, 0.5850161, 1, 0, 0.2588235, 1,
1.711701, -0.1157784, 1.186026, 1, 0, 0.2509804, 1,
1.749711, 1.038736, -0.03964719, 1, 0, 0.2470588, 1,
1.75739, -1.945469, 2.403846, 1, 0, 0.2392157, 1,
1.762597, -0.3883716, 2.089574, 1, 0, 0.2352941, 1,
1.801901, 0.3273938, 1.76054, 1, 0, 0.227451, 1,
1.806491, -0.136546, 4.330597, 1, 0, 0.2235294, 1,
1.809095, 1.08448, 2.098574, 1, 0, 0.2156863, 1,
1.822116, -0.08011325, 1.842966, 1, 0, 0.2117647, 1,
1.826235, 1.594626, 0.9946724, 1, 0, 0.2039216, 1,
1.8278, -0.6427801, 2.995209, 1, 0, 0.1960784, 1,
1.834954, 0.4319384, 1.631465, 1, 0, 0.1921569, 1,
1.848557, -0.008577744, 0.9824207, 1, 0, 0.1843137, 1,
1.854867, -0.06643704, 1.156631, 1, 0, 0.1803922, 1,
1.85851, -0.5961915, 2.9217, 1, 0, 0.172549, 1,
1.864703, -0.09060368, 2.662758, 1, 0, 0.1686275, 1,
1.904395, 0.005609742, 1.574621, 1, 0, 0.1607843, 1,
1.920005, -0.469762, 2.613607, 1, 0, 0.1568628, 1,
1.935871, -0.7897648, 1.670153, 1, 0, 0.1490196, 1,
1.954263, -0.432888, 2.430229, 1, 0, 0.145098, 1,
1.968294, -0.7142438, 4.231603, 1, 0, 0.1372549, 1,
1.984964, 0.6688274, 2.012858, 1, 0, 0.1333333, 1,
2.022804, -0.9581469, -0.3403795, 1, 0, 0.1254902, 1,
2.023644, -1.29048, 2.733654, 1, 0, 0.1215686, 1,
2.039169, 0.660091, 1.722017, 1, 0, 0.1137255, 1,
2.068353, 0.06208976, 2.097616, 1, 0, 0.1098039, 1,
2.074047, -2.452248, 2.552693, 1, 0, 0.1019608, 1,
2.075714, -0.09545077, 1.366123, 1, 0, 0.09411765, 1,
2.100462, -0.2795303, 1.731842, 1, 0, 0.09019608, 1,
2.103611, -1.151883, 3.290735, 1, 0, 0.08235294, 1,
2.104438, -0.6320897, 1.270942, 1, 0, 0.07843138, 1,
2.113643, 1.05941, 1.433445, 1, 0, 0.07058824, 1,
2.128394, 1.340394, 1.162079, 1, 0, 0.06666667, 1,
2.149601, 0.1893866, 1.64581, 1, 0, 0.05882353, 1,
2.22933, -1.662331, 2.490562, 1, 0, 0.05490196, 1,
2.247499, -1.264976, -0.2248478, 1, 0, 0.04705882, 1,
2.3208, 0.1388562, 2.00001, 1, 0, 0.04313726, 1,
2.33916, 0.6612298, 1.777777, 1, 0, 0.03529412, 1,
2.379194, -0.3041983, 3.217423, 1, 0, 0.03137255, 1,
2.604614, 1.642683, 2.04102, 1, 0, 0.02352941, 1,
2.611234, -0.7221003, 1.529531, 1, 0, 0.01960784, 1,
2.74198, -0.08441688, 2.482939, 1, 0, 0.01176471, 1,
3.257015, 0.213238, 1.565873, 1, 0, 0.007843138, 1
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
-0.3458737, -4.370923, -6.955215, 0, -0.5, 0.5, 0.5,
-0.3458737, -4.370923, -6.955215, 1, -0.5, 0.5, 0.5,
-0.3458737, -4.370923, -6.955215, 1, 1.5, 0.5, 0.5,
-0.3458737, -4.370923, -6.955215, 0, 1.5, 0.5, 0.5
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
-5.170141, 0.07416475, -6.955215, 0, -0.5, 0.5, 0.5,
-5.170141, 0.07416475, -6.955215, 1, -0.5, 0.5, 0.5,
-5.170141, 0.07416475, -6.955215, 1, 1.5, 0.5, 0.5,
-5.170141, 0.07416475, -6.955215, 0, 1.5, 0.5, 0.5
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
-5.170141, -4.370923, -0.01284122, 0, -0.5, 0.5, 0.5,
-5.170141, -4.370923, -0.01284122, 1, -0.5, 0.5, 0.5,
-5.170141, -4.370923, -0.01284122, 1, 1.5, 0.5, 0.5,
-5.170141, -4.370923, -0.01284122, 0, 1.5, 0.5, 0.5
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
-2, -3.345133, -5.353128,
2, -3.345133, -5.353128,
-2, -3.345133, -5.353128,
-2, -3.516098, -5.620143,
0, -3.345133, -5.353128,
0, -3.516098, -5.620143,
2, -3.345133, -5.353128,
2, -3.516098, -5.620143
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
-2, -3.858028, -6.154171, 0, -0.5, 0.5, 0.5,
-2, -3.858028, -6.154171, 1, -0.5, 0.5, 0.5,
-2, -3.858028, -6.154171, 1, 1.5, 0.5, 0.5,
-2, -3.858028, -6.154171, 0, 1.5, 0.5, 0.5,
0, -3.858028, -6.154171, 0, -0.5, 0.5, 0.5,
0, -3.858028, -6.154171, 1, -0.5, 0.5, 0.5,
0, -3.858028, -6.154171, 1, 1.5, 0.5, 0.5,
0, -3.858028, -6.154171, 0, 1.5, 0.5, 0.5,
2, -3.858028, -6.154171, 0, -0.5, 0.5, 0.5,
2, -3.858028, -6.154171, 1, -0.5, 0.5, 0.5,
2, -3.858028, -6.154171, 1, 1.5, 0.5, 0.5,
2, -3.858028, -6.154171, 0, 1.5, 0.5, 0.5
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
-4.056849, -3, -5.353128,
-4.056849, 3, -5.353128,
-4.056849, -3, -5.353128,
-4.242398, -3, -5.620143,
-4.056849, -2, -5.353128,
-4.242398, -2, -5.620143,
-4.056849, -1, -5.353128,
-4.242398, -1, -5.620143,
-4.056849, 0, -5.353128,
-4.242398, 0, -5.620143,
-4.056849, 1, -5.353128,
-4.242398, 1, -5.620143,
-4.056849, 2, -5.353128,
-4.242398, 2, -5.620143,
-4.056849, 3, -5.353128,
-4.242398, 3, -5.620143
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
-4.613495, -3, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, -3, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, -3, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, -3, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, -2, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, -2, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, -2, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, -2, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, -1, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, -1, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, -1, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, -1, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, 0, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, 0, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, 0, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, 0, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, 1, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, 1, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, 1, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, 1, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, 2, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, 2, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, 2, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, 2, -6.154171, 0, 1.5, 0.5, 0.5,
-4.613495, 3, -6.154171, 0, -0.5, 0.5, 0.5,
-4.613495, 3, -6.154171, 1, -0.5, 0.5, 0.5,
-4.613495, 3, -6.154171, 1, 1.5, 0.5, 0.5,
-4.613495, 3, -6.154171, 0, 1.5, 0.5, 0.5
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
-4.056849, -3.345133, -4,
-4.056849, -3.345133, 4,
-4.056849, -3.345133, -4,
-4.242398, -3.516098, -4,
-4.056849, -3.345133, -2,
-4.242398, -3.516098, -2,
-4.056849, -3.345133, 0,
-4.242398, -3.516098, 0,
-4.056849, -3.345133, 2,
-4.242398, -3.516098, 2,
-4.056849, -3.345133, 4,
-4.242398, -3.516098, 4
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
-4.613495, -3.858028, -4, 0, -0.5, 0.5, 0.5,
-4.613495, -3.858028, -4, 1, -0.5, 0.5, 0.5,
-4.613495, -3.858028, -4, 1, 1.5, 0.5, 0.5,
-4.613495, -3.858028, -4, 0, 1.5, 0.5, 0.5,
-4.613495, -3.858028, -2, 0, -0.5, 0.5, 0.5,
-4.613495, -3.858028, -2, 1, -0.5, 0.5, 0.5,
-4.613495, -3.858028, -2, 1, 1.5, 0.5, 0.5,
-4.613495, -3.858028, -2, 0, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 0, 0, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 0, 1, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 0, 1, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 0, 0, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 2, 0, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 2, 1, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 2, 1, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 2, 0, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 4, 0, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 4, 1, -0.5, 0.5, 0.5,
-4.613495, -3.858028, 4, 1, 1.5, 0.5, 0.5,
-4.613495, -3.858028, 4, 0, 1.5, 0.5, 0.5
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
-4.056849, -3.345133, -5.353128,
-4.056849, 3.493463, -5.353128,
-4.056849, -3.345133, 5.327446,
-4.056849, 3.493463, 5.327446,
-4.056849, -3.345133, -5.353128,
-4.056849, -3.345133, 5.327446,
-4.056849, 3.493463, -5.353128,
-4.056849, 3.493463, 5.327446,
-4.056849, -3.345133, -5.353128,
3.365101, -3.345133, -5.353128,
-4.056849, -3.345133, 5.327446,
3.365101, -3.345133, 5.327446,
-4.056849, 3.493463, -5.353128,
3.365101, 3.493463, -5.353128,
-4.056849, 3.493463, 5.327446,
3.365101, 3.493463, 5.327446,
3.365101, -3.345133, -5.353128,
3.365101, 3.493463, -5.353128,
3.365101, -3.345133, 5.327446,
3.365101, 3.493463, 5.327446,
3.365101, -3.345133, -5.353128,
3.365101, -3.345133, 5.327446,
3.365101, 3.493463, -5.353128,
3.365101, 3.493463, 5.327446
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
var radius = 7.846543;
var distance = 34.91016;
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
mvMatrix.translate( 0.3458737, -0.07416475, 0.01284122 );
mvMatrix.scale( 1.143074, 1.240582, 0.7943239 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91016);
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


