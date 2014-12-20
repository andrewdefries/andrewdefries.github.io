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
-4.068288, -0.8518226, -1.429343, 1, 0, 0, 1,
-3.453913, -0.6426651, -1.115397, 1, 0.007843138, 0, 1,
-2.962334, 0.6661882, -1.073968, 1, 0.01176471, 0, 1,
-2.804842, 1.473685, -1.669053, 1, 0.01960784, 0, 1,
-2.700897, 0.1864127, -2.978534, 1, 0.02352941, 0, 1,
-2.64903, -0.08280662, -2.049557, 1, 0.03137255, 0, 1,
-2.569848, 1.032718, -1.43303, 1, 0.03529412, 0, 1,
-2.46362, -0.690751, -3.913288, 1, 0.04313726, 0, 1,
-2.414279, -0.3291828, -3.479775, 1, 0.04705882, 0, 1,
-2.351668, -0.8054428, -1.078802, 1, 0.05490196, 0, 1,
-2.342895, -2.253402, -3.358703, 1, 0.05882353, 0, 1,
-2.325869, -0.424897, -2.582112, 1, 0.06666667, 0, 1,
-2.259844, -0.1092644, -1.697589, 1, 0.07058824, 0, 1,
-2.251528, 1.127342, -1.564021, 1, 0.07843138, 0, 1,
-2.2493, 0.903143, -1.49004, 1, 0.08235294, 0, 1,
-2.193526, -1.268407, -2.39576, 1, 0.09019608, 0, 1,
-2.135559, -0.008628669, -3.042145, 1, 0.09411765, 0, 1,
-2.118889, -1.597265, -1.648293, 1, 0.1019608, 0, 1,
-2.108028, -1.223249, -3.962749, 1, 0.1098039, 0, 1,
-2.087701, 0.7471101, -0.4283174, 1, 0.1137255, 0, 1,
-2.077811, 0.1269883, -0.9527768, 1, 0.1215686, 0, 1,
-2.064535, 0.8168028, -1.81489, 1, 0.1254902, 0, 1,
-2.061704, -0.9573968, -0.9557524, 1, 0.1333333, 0, 1,
-2.055754, 0.3677765, 0.8084005, 1, 0.1372549, 0, 1,
-2.012957, -2.853209, -2.992162, 1, 0.145098, 0, 1,
-2.008974, 0.7271104, -1.058222, 1, 0.1490196, 0, 1,
-1.996502, -0.267306, -1.888531, 1, 0.1568628, 0, 1,
-1.99424, -1.544939, -1.054904, 1, 0.1607843, 0, 1,
-1.984272, -0.2867868, -3.877399, 1, 0.1686275, 0, 1,
-1.97155, 1.447169, -0.1052496, 1, 0.172549, 0, 1,
-1.915775, -0.4468621, -1.290215, 1, 0.1803922, 0, 1,
-1.857236, -1.663519, -2.98594, 1, 0.1843137, 0, 1,
-1.842072, 0.3200372, -1.91407, 1, 0.1921569, 0, 1,
-1.82768, -0.2400346, -2.887477, 1, 0.1960784, 0, 1,
-1.819094, -1.124351, -1.622714, 1, 0.2039216, 0, 1,
-1.813997, 1.475203, -0.8303498, 1, 0.2117647, 0, 1,
-1.800976, 0.5141411, -1.443332, 1, 0.2156863, 0, 1,
-1.785205, 0.1162133, -0.8110588, 1, 0.2235294, 0, 1,
-1.774918, -0.7251192, -2.153869, 1, 0.227451, 0, 1,
-1.756066, 1.049907, -3.870064, 1, 0.2352941, 0, 1,
-1.738785, -0.1171073, -1.006758, 1, 0.2392157, 0, 1,
-1.735728, 0.8630562, -1.195714, 1, 0.2470588, 0, 1,
-1.708303, 2.323211, 0.1666832, 1, 0.2509804, 0, 1,
-1.704432, 0.8871061, -2.693992, 1, 0.2588235, 0, 1,
-1.677089, -0.02557584, -1.938654, 1, 0.2627451, 0, 1,
-1.672598, 1.042598, -0.6593192, 1, 0.2705882, 0, 1,
-1.657609, -0.09417869, -2.528509, 1, 0.2745098, 0, 1,
-1.642197, 0.3953217, 0.05934512, 1, 0.282353, 0, 1,
-1.640206, -0.4083917, -2.655312, 1, 0.2862745, 0, 1,
-1.621773, 1.405645, 0.4776363, 1, 0.2941177, 0, 1,
-1.613719, -0.4776115, -2.978911, 1, 0.3019608, 0, 1,
-1.605592, 0.2312762, -2.703242, 1, 0.3058824, 0, 1,
-1.592181, -0.08628836, -1.251487, 1, 0.3137255, 0, 1,
-1.59181, 0.4978201, -2.555628, 1, 0.3176471, 0, 1,
-1.590797, 2.654805, -0.2913806, 1, 0.3254902, 0, 1,
-1.569417, -0.9849999, -1.552631, 1, 0.3294118, 0, 1,
-1.566306, -1.16953, -1.244112, 1, 0.3372549, 0, 1,
-1.549136, -0.2145168, -2.290129, 1, 0.3411765, 0, 1,
-1.523399, 1.432997, -1.258788, 1, 0.3490196, 0, 1,
-1.51763, 0.8143651, -0.7969601, 1, 0.3529412, 0, 1,
-1.51104, -0.3577403, -2.714129, 1, 0.3607843, 0, 1,
-1.509625, 0.263567, -0.7485486, 1, 0.3647059, 0, 1,
-1.49022, 0.1872942, -0.2080862, 1, 0.372549, 0, 1,
-1.483533, 0.1828995, -1.472785, 1, 0.3764706, 0, 1,
-1.482658, 0.4916315, -0.7186341, 1, 0.3843137, 0, 1,
-1.468445, 0.2900569, -1.693151, 1, 0.3882353, 0, 1,
-1.431073, -1.16476, -1.679111, 1, 0.3960784, 0, 1,
-1.414595, 0.9112133, -2.922368, 1, 0.4039216, 0, 1,
-1.410164, 2.358812, -0.6620378, 1, 0.4078431, 0, 1,
-1.386568, 1.729172, 0.6808957, 1, 0.4156863, 0, 1,
-1.382644, 1.747337, -0.3624104, 1, 0.4196078, 0, 1,
-1.38264, -1.105215, -3.921146, 1, 0.427451, 0, 1,
-1.366721, -0.1742447, -1.696819, 1, 0.4313726, 0, 1,
-1.358092, -0.05559017, -1.078913, 1, 0.4392157, 0, 1,
-1.34416, -0.3900173, -3.041903, 1, 0.4431373, 0, 1,
-1.331099, -1.749192, -3.360918, 1, 0.4509804, 0, 1,
-1.330371, -0.8382808, -2.669967, 1, 0.454902, 0, 1,
-1.321074, -0.2285806, -0.3813932, 1, 0.4627451, 0, 1,
-1.319972, 0.3140593, -1.816258, 1, 0.4666667, 0, 1,
-1.31824, -0.5155891, -3.296986, 1, 0.4745098, 0, 1,
-1.314598, -0.3154183, -1.67532, 1, 0.4784314, 0, 1,
-1.313864, 0.7354388, -1.896649, 1, 0.4862745, 0, 1,
-1.310361, -0.4573983, -0.20511, 1, 0.4901961, 0, 1,
-1.306428, 1.453861, -0.871963, 1, 0.4980392, 0, 1,
-1.302948, 0.04687529, -1.361039, 1, 0.5058824, 0, 1,
-1.300945, 0.6893022, -1.572083, 1, 0.509804, 0, 1,
-1.30072, -0.1982556, -1.843027, 1, 0.5176471, 0, 1,
-1.298501, -0.8944887, -2.323649, 1, 0.5215687, 0, 1,
-1.29524, 2.014653, 0.3373385, 1, 0.5294118, 0, 1,
-1.295205, -0.6099823, -3.745303, 1, 0.5333334, 0, 1,
-1.287988, -0.8588374, -4.110848, 1, 0.5411765, 0, 1,
-1.28793, -1.405179, -0.5821012, 1, 0.5450981, 0, 1,
-1.273107, 0.1215795, -1.51219, 1, 0.5529412, 0, 1,
-1.268526, -0.8271497, -2.58662, 1, 0.5568628, 0, 1,
-1.260206, 1.232377, -0.568689, 1, 0.5647059, 0, 1,
-1.258401, -0.8290998, -1.952895, 1, 0.5686275, 0, 1,
-1.247587, 0.6789203, -0.2885559, 1, 0.5764706, 0, 1,
-1.245413, -0.4655665, -2.043518, 1, 0.5803922, 0, 1,
-1.230083, -0.884679, -2.129729, 1, 0.5882353, 0, 1,
-1.229977, 1.631419, 0.3570338, 1, 0.5921569, 0, 1,
-1.224497, -0.2369341, -2.516727, 1, 0.6, 0, 1,
-1.218423, -0.397201, -0.2532931, 1, 0.6078432, 0, 1,
-1.210596, 1.163037, -0.4831595, 1, 0.6117647, 0, 1,
-1.206845, 0.4968306, -0.723216, 1, 0.6196079, 0, 1,
-1.19641, 1.718644, 0.2214543, 1, 0.6235294, 0, 1,
-1.193976, 0.6723609, -0.1582786, 1, 0.6313726, 0, 1,
-1.18945, -1.778949, -3.286504, 1, 0.6352941, 0, 1,
-1.172714, 0.2811481, -1.51024, 1, 0.6431373, 0, 1,
-1.171241, 0.8182544, 0.1475669, 1, 0.6470588, 0, 1,
-1.166463, -1.155841, -2.703596, 1, 0.654902, 0, 1,
-1.157901, 0.941581, -1.267026, 1, 0.6588235, 0, 1,
-1.149302, -0.5119172, -1.786387, 1, 0.6666667, 0, 1,
-1.13597, -0.1838542, -2.226254, 1, 0.6705883, 0, 1,
-1.132666, 0.9243071, -3.102121, 1, 0.6784314, 0, 1,
-1.130094, -0.867114, 0.1880181, 1, 0.682353, 0, 1,
-1.129397, -0.3681801, -1.079567, 1, 0.6901961, 0, 1,
-1.129046, 0.636434, -2.052169, 1, 0.6941177, 0, 1,
-1.119074, -2.316798, -2.59379, 1, 0.7019608, 0, 1,
-1.116372, -1.316347, -1.92458, 1, 0.7098039, 0, 1,
-1.114765, 0.02458606, -2.758937, 1, 0.7137255, 0, 1,
-1.114391, 0.02215072, -2.247476, 1, 0.7215686, 0, 1,
-1.101894, 0.02045677, -1.0869, 1, 0.7254902, 0, 1,
-1.084145, -0.05462973, -0.970292, 1, 0.7333333, 0, 1,
-1.080043, 0.8922613, -2.640485, 1, 0.7372549, 0, 1,
-1.074443, -0.4172218, -0.8581112, 1, 0.7450981, 0, 1,
-1.071848, 1.451112, 0.1532917, 1, 0.7490196, 0, 1,
-1.07132, -0.7008252, -1.030226, 1, 0.7568628, 0, 1,
-1.042894, -0.5882721, -2.640182, 1, 0.7607843, 0, 1,
-1.038396, -1.971984, -4.099737, 1, 0.7686275, 0, 1,
-1.038146, -0.2372535, -1.965939, 1, 0.772549, 0, 1,
-1.033301, 0.3315683, 0.5038598, 1, 0.7803922, 0, 1,
-1.032892, 0.1019797, -1.836308, 1, 0.7843137, 0, 1,
-1.026046, -1.326455, -3.355282, 1, 0.7921569, 0, 1,
-1.022634, -0.6190985, -2.91037, 1, 0.7960784, 0, 1,
-1.016801, -0.09081435, -2.121069, 1, 0.8039216, 0, 1,
-1.016601, -1.058655, -2.495216, 1, 0.8117647, 0, 1,
-1.015017, -1.2518, -3.491814, 1, 0.8156863, 0, 1,
-1.009947, -0.3619276, -2.506049, 1, 0.8235294, 0, 1,
-1.008622, 1.409009, -0.8964448, 1, 0.827451, 0, 1,
-1.002891, 1.04804, -0.415854, 1, 0.8352941, 0, 1,
-0.9960145, -0.05037391, -1.47648, 1, 0.8392157, 0, 1,
-0.9791906, -1.101192, -3.612763, 1, 0.8470588, 0, 1,
-0.9790686, -1.0255, -3.627387, 1, 0.8509804, 0, 1,
-0.9787115, 0.433228, -0.5019534, 1, 0.8588235, 0, 1,
-0.9770392, -0.4795668, -2.407211, 1, 0.8627451, 0, 1,
-0.976326, -0.8497563, -2.930116, 1, 0.8705882, 0, 1,
-0.9659482, 0.7372239, -1.133016, 1, 0.8745098, 0, 1,
-0.96371, -0.5272036, -4.326241, 1, 0.8823529, 0, 1,
-0.9582412, 1.464562, 0.402576, 1, 0.8862745, 0, 1,
-0.9558475, -0.141244, -1.844349, 1, 0.8941177, 0, 1,
-0.949351, 1.850636, 0.09274735, 1, 0.8980392, 0, 1,
-0.9468394, -0.7817057, -1.93175, 1, 0.9058824, 0, 1,
-0.9467937, 0.0489563, -1.356806, 1, 0.9137255, 0, 1,
-0.9386387, 1.468935, 0.03219477, 1, 0.9176471, 0, 1,
-0.9384131, -0.09376657, -1.503284, 1, 0.9254902, 0, 1,
-0.93455, 1.750899, -0.3482864, 1, 0.9294118, 0, 1,
-0.932991, 0.5300719, -1.267695, 1, 0.9372549, 0, 1,
-0.9305784, -0.4231866, -2.44417, 1, 0.9411765, 0, 1,
-0.9235263, -0.8856326, -1.969375, 1, 0.9490196, 0, 1,
-0.918763, -0.9218853, -0.8782856, 1, 0.9529412, 0, 1,
-0.9162837, 1.745295, -0.3120124, 1, 0.9607843, 0, 1,
-0.9122331, -0.447606, -3.346585, 1, 0.9647059, 0, 1,
-0.9067729, -0.3243702, -1.903431, 1, 0.972549, 0, 1,
-0.9067248, -0.2906308, -2.584798, 1, 0.9764706, 0, 1,
-0.9024132, 1.87924, 1.107043, 1, 0.9843137, 0, 1,
-0.8991616, -1.620073, -3.079016, 1, 0.9882353, 0, 1,
-0.8964437, -0.2825144, -1.835223, 1, 0.9960784, 0, 1,
-0.8960463, 0.5144461, -0.1507944, 0.9960784, 1, 0, 1,
-0.8942182, -0.3210671, -0.8583168, 0.9921569, 1, 0, 1,
-0.8866446, 0.7819546, -2.469551, 0.9843137, 1, 0, 1,
-0.880672, -1.173415, -3.344489, 0.9803922, 1, 0, 1,
-0.8798254, 0.3708303, -1.098246, 0.972549, 1, 0, 1,
-0.8786101, 1.38564, 0.3307252, 0.9686275, 1, 0, 1,
-0.8726303, -0.3299026, -3.119173, 0.9607843, 1, 0, 1,
-0.8690153, 2.581867, -1.385825, 0.9568627, 1, 0, 1,
-0.8643512, -0.5825133, -4.025151, 0.9490196, 1, 0, 1,
-0.8639559, -0.651009, -1.079, 0.945098, 1, 0, 1,
-0.8537792, 0.4234072, -1.071146, 0.9372549, 1, 0, 1,
-0.8515574, -1.781335, -3.451399, 0.9333333, 1, 0, 1,
-0.8448404, -0.6575904, -1.618874, 0.9254902, 1, 0, 1,
-0.844592, 0.727908, -1.833241, 0.9215686, 1, 0, 1,
-0.8444216, -0.3097846, -0.3329722, 0.9137255, 1, 0, 1,
-0.8440659, 1.135243, -0.3399399, 0.9098039, 1, 0, 1,
-0.8404298, -0.0006930195, -1.438435, 0.9019608, 1, 0, 1,
-0.8395981, 0.1169906, -2.740771, 0.8941177, 1, 0, 1,
-0.8353958, 1.009747, -1.087392, 0.8901961, 1, 0, 1,
-0.831899, -1.213389, -2.489512, 0.8823529, 1, 0, 1,
-0.8295445, 0.4890174, -2.75953, 0.8784314, 1, 0, 1,
-0.8266349, -0.7915946, -1.363292, 0.8705882, 1, 0, 1,
-0.8254282, -0.9721609, -2.266173, 0.8666667, 1, 0, 1,
-0.8205683, 0.5278329, 0.1958939, 0.8588235, 1, 0, 1,
-0.8193848, -0.3720248, -2.287788, 0.854902, 1, 0, 1,
-0.8169118, 0.6627153, -1.287272, 0.8470588, 1, 0, 1,
-0.8149967, 0.1210659, -1.256699, 0.8431373, 1, 0, 1,
-0.8055201, -0.0306242, -0.8653459, 0.8352941, 1, 0, 1,
-0.8045571, -0.7306951, -1.647751, 0.8313726, 1, 0, 1,
-0.8015528, -0.5255167, -2.256863, 0.8235294, 1, 0, 1,
-0.8007975, 0.1665089, -2.510726, 0.8196079, 1, 0, 1,
-0.8006465, 0.5517254, -0.5726783, 0.8117647, 1, 0, 1,
-0.7940064, -0.5779, -2.410813, 0.8078431, 1, 0, 1,
-0.7924641, -0.6749713, -2.779805, 0.8, 1, 0, 1,
-0.7904967, 0.6974747, -0.1555786, 0.7921569, 1, 0, 1,
-0.7904485, -0.4835376, -3.611253, 0.7882353, 1, 0, 1,
-0.7897673, -1.88894, -2.898668, 0.7803922, 1, 0, 1,
-0.7885675, -0.7468123, -3.026779, 0.7764706, 1, 0, 1,
-0.7877497, -0.3618289, -1.001113, 0.7686275, 1, 0, 1,
-0.7854633, 1.106178, -0.1978639, 0.7647059, 1, 0, 1,
-0.7837533, 0.5069982, -0.7285411, 0.7568628, 1, 0, 1,
-0.7764359, 0.6739202, -0.3409364, 0.7529412, 1, 0, 1,
-0.7680429, -1.0811, -2.77312, 0.7450981, 1, 0, 1,
-0.7580584, 0.9674636, -1.977921, 0.7411765, 1, 0, 1,
-0.7539486, -1.205675, -2.438024, 0.7333333, 1, 0, 1,
-0.7520531, 1.280105, -0.9824405, 0.7294118, 1, 0, 1,
-0.7463992, -0.0470477, -3.860386, 0.7215686, 1, 0, 1,
-0.7462996, 1.18544, -0.2657066, 0.7176471, 1, 0, 1,
-0.7358406, -0.287634, -1.393233, 0.7098039, 1, 0, 1,
-0.7354861, -0.9151359, -3.306604, 0.7058824, 1, 0, 1,
-0.7324756, -1.095149, -2.270235, 0.6980392, 1, 0, 1,
-0.7320538, -1.081074, -2.593614, 0.6901961, 1, 0, 1,
-0.731276, -0.06979716, -2.509011, 0.6862745, 1, 0, 1,
-0.727998, 0.9638057, 0.258761, 0.6784314, 1, 0, 1,
-0.7267667, -0.4940091, -2.966232, 0.6745098, 1, 0, 1,
-0.7249524, -1.36891, -1.505541, 0.6666667, 1, 0, 1,
-0.7248915, 0.01202933, 0.886703, 0.6627451, 1, 0, 1,
-0.7237874, 0.710236, 0.0419326, 0.654902, 1, 0, 1,
-0.7216569, 0.7254261, -0.8284178, 0.6509804, 1, 0, 1,
-0.7168277, 0.1812881, -1.344429, 0.6431373, 1, 0, 1,
-0.7165112, -1.456188, -2.207506, 0.6392157, 1, 0, 1,
-0.7125732, -0.8316473, -1.357424, 0.6313726, 1, 0, 1,
-0.7080095, -0.6121247, -3.978201, 0.627451, 1, 0, 1,
-0.7043997, -0.1378151, -1.460564, 0.6196079, 1, 0, 1,
-0.7019701, 0.1011634, -1.043828, 0.6156863, 1, 0, 1,
-0.6993329, 0.5875833, -0.009117168, 0.6078432, 1, 0, 1,
-0.6983314, -0.5773581, -1.730576, 0.6039216, 1, 0, 1,
-0.6977918, -1.044339, -2.062329, 0.5960785, 1, 0, 1,
-0.697675, 0.6608493, -1.772026, 0.5882353, 1, 0, 1,
-0.6907941, -1.110538, -4.040675, 0.5843138, 1, 0, 1,
-0.6885913, 0.618325, 0.331768, 0.5764706, 1, 0, 1,
-0.6819468, -1.564545, -4.580104, 0.572549, 1, 0, 1,
-0.6815497, -0.4213645, -2.027796, 0.5647059, 1, 0, 1,
-0.681508, -0.06625801, -2.16799, 0.5607843, 1, 0, 1,
-0.6802869, 0.2799459, -2.450862, 0.5529412, 1, 0, 1,
-0.669177, 0.03311971, -1.745222, 0.5490196, 1, 0, 1,
-0.6647686, -0.6555535, -2.502648, 0.5411765, 1, 0, 1,
-0.6616579, 0.3661424, -0.7146522, 0.5372549, 1, 0, 1,
-0.6574554, 1.219869, 1.184069, 0.5294118, 1, 0, 1,
-0.6561026, 0.6980414, -1.376068, 0.5254902, 1, 0, 1,
-0.6520139, -0.1817085, -1.265446, 0.5176471, 1, 0, 1,
-0.6483997, 0.962342, -0.1989635, 0.5137255, 1, 0, 1,
-0.6483629, 0.2805711, -1.831325, 0.5058824, 1, 0, 1,
-0.6455693, 0.3304695, -2.143261, 0.5019608, 1, 0, 1,
-0.6435484, -1.6702, -2.731003, 0.4941176, 1, 0, 1,
-0.6432998, -0.3109072, -2.693171, 0.4862745, 1, 0, 1,
-0.6339744, -0.7710792, -2.217957, 0.4823529, 1, 0, 1,
-0.6301718, -0.4812837, -2.681759, 0.4745098, 1, 0, 1,
-0.6251627, -1.228814, -3.753388, 0.4705882, 1, 0, 1,
-0.6239096, 0.3763002, -0.419588, 0.4627451, 1, 0, 1,
-0.6229979, 0.5494779, -0.8799378, 0.4588235, 1, 0, 1,
-0.6189616, -1.304066, -4.263919, 0.4509804, 1, 0, 1,
-0.6175486, -0.709594, -2.668144, 0.4470588, 1, 0, 1,
-0.6167412, 0.3120059, 0.714534, 0.4392157, 1, 0, 1,
-0.6156938, 0.1750797, -1.061568, 0.4352941, 1, 0, 1,
-0.6113476, 0.5071007, 0.3282283, 0.427451, 1, 0, 1,
-0.608922, -0.3932559, -2.070092, 0.4235294, 1, 0, 1,
-0.6013849, -0.4183128, -3.683134, 0.4156863, 1, 0, 1,
-0.6000077, -0.4188299, -1.543772, 0.4117647, 1, 0, 1,
-0.5990407, 0.1340024, -1.912086, 0.4039216, 1, 0, 1,
-0.5931811, -0.4075532, -1.820784, 0.3960784, 1, 0, 1,
-0.5921788, -0.3318627, -1.183099, 0.3921569, 1, 0, 1,
-0.5905469, 0.7508128, -0.05429115, 0.3843137, 1, 0, 1,
-0.5866421, 0.742394, -0.3904572, 0.3803922, 1, 0, 1,
-0.5866176, -0.6679322, -2.291851, 0.372549, 1, 0, 1,
-0.5846199, -0.9471952, -2.996999, 0.3686275, 1, 0, 1,
-0.5732773, -1.045309, -1.740399, 0.3607843, 1, 0, 1,
-0.5728197, 0.08211322, -3.833425, 0.3568628, 1, 0, 1,
-0.5647836, -0.9113507, -2.155141, 0.3490196, 1, 0, 1,
-0.5508554, -0.2196619, -2.40337, 0.345098, 1, 0, 1,
-0.5506901, 0.7098497, 0.5787053, 0.3372549, 1, 0, 1,
-0.5492344, -0.8556026, -4.063112, 0.3333333, 1, 0, 1,
-0.5477182, 0.3364971, -1.157839, 0.3254902, 1, 0, 1,
-0.5440649, 0.05850977, -0.8766544, 0.3215686, 1, 0, 1,
-0.5410145, -0.05667878, -3.59978, 0.3137255, 1, 0, 1,
-0.5392126, 0.08485281, -1.15466, 0.3098039, 1, 0, 1,
-0.5378392, -0.9287628, -2.967705, 0.3019608, 1, 0, 1,
-0.5319558, -0.5744654, -1.938233, 0.2941177, 1, 0, 1,
-0.5293206, -1.170402, -0.430617, 0.2901961, 1, 0, 1,
-0.5092497, -1.060686, -6.079304, 0.282353, 1, 0, 1,
-0.5087168, 0.7835203, -1.519415, 0.2784314, 1, 0, 1,
-0.5071858, -1.820745, -2.633456, 0.2705882, 1, 0, 1,
-0.5059785, 0.4531356, -0.1604462, 0.2666667, 1, 0, 1,
-0.5059462, -1.181103, -3.130494, 0.2588235, 1, 0, 1,
-0.5056005, -0.3612718, -1.1088, 0.254902, 1, 0, 1,
-0.5033063, 0.3814647, -0.9132745, 0.2470588, 1, 0, 1,
-0.5023429, 0.421229, 1.900473, 0.2431373, 1, 0, 1,
-0.4970735, -0.02052896, -2.19395, 0.2352941, 1, 0, 1,
-0.490912, 0.5650293, -0.9896621, 0.2313726, 1, 0, 1,
-0.4879132, 1.669065, -0.2363213, 0.2235294, 1, 0, 1,
-0.4875716, 0.2539123, -1.251552, 0.2196078, 1, 0, 1,
-0.4822062, -0.0674758, -3.079516, 0.2117647, 1, 0, 1,
-0.4726893, 0.6568097, 0.05283356, 0.2078431, 1, 0, 1,
-0.4702408, 0.5555181, -0.5600295, 0.2, 1, 0, 1,
-0.45714, -0.5453475, -3.373736, 0.1921569, 1, 0, 1,
-0.4566898, -0.09625673, -2.129829, 0.1882353, 1, 0, 1,
-0.4564584, 0.05780921, -1.356061, 0.1803922, 1, 0, 1,
-0.4538389, -0.02561034, -0.6934029, 0.1764706, 1, 0, 1,
-0.449362, -1.205679, -3.800297, 0.1686275, 1, 0, 1,
-0.4492309, 0.7490107, -2.112173, 0.1647059, 1, 0, 1,
-0.44906, -1.488117, -1.795998, 0.1568628, 1, 0, 1,
-0.4474877, 2.12584, -0.9839947, 0.1529412, 1, 0, 1,
-0.4453257, -1.109252, -2.485221, 0.145098, 1, 0, 1,
-0.4452056, -0.4175169, -3.321093, 0.1411765, 1, 0, 1,
-0.4365076, -0.3207977, -1.379584, 0.1333333, 1, 0, 1,
-0.4297248, 1.432283, 1.163735, 0.1294118, 1, 0, 1,
-0.4259982, 0.9677325, -0.151151, 0.1215686, 1, 0, 1,
-0.4230808, 0.6931641, 0.08618349, 0.1176471, 1, 0, 1,
-0.4223833, 0.1003012, -1.712018, 0.1098039, 1, 0, 1,
-0.4218793, -0.8626214, -2.624548, 0.1058824, 1, 0, 1,
-0.4212912, -0.4814222, -2.443533, 0.09803922, 1, 0, 1,
-0.4196927, -0.4398028, -2.1198, 0.09019608, 1, 0, 1,
-0.4141049, 1.002405, -1.914511, 0.08627451, 1, 0, 1,
-0.4135412, 0.241779, -1.370866, 0.07843138, 1, 0, 1,
-0.4128878, 0.201206, -0.7119384, 0.07450981, 1, 0, 1,
-0.4074486, -1.727178, -4.034246, 0.06666667, 1, 0, 1,
-0.4053759, -0.7874414, -3.059238, 0.0627451, 1, 0, 1,
-0.4037343, 1.319366, -0.1041065, 0.05490196, 1, 0, 1,
-0.4005964, -0.5052673, -3.51742, 0.05098039, 1, 0, 1,
-0.3941878, -0.2401229, -2.832666, 0.04313726, 1, 0, 1,
-0.3929111, -1.39667, -2.052418, 0.03921569, 1, 0, 1,
-0.3893384, -0.4391223, -2.962223, 0.03137255, 1, 0, 1,
-0.3885272, -0.00725018, -0.2370182, 0.02745098, 1, 0, 1,
-0.3861326, 0.2251825, 0.02578958, 0.01960784, 1, 0, 1,
-0.3837514, 1.051226, 0.3746469, 0.01568628, 1, 0, 1,
-0.3829748, 0.3617449, -1.628128, 0.007843138, 1, 0, 1,
-0.3817559, -1.550877, -5.60126, 0.003921569, 1, 0, 1,
-0.373091, -2.126229, -2.276524, 0, 1, 0.003921569, 1,
-0.3727112, 0.5222093, -0.4966781, 0, 1, 0.01176471, 1,
-0.3699624, 0.4395499, -1.719133, 0, 1, 0.01568628, 1,
-0.3689968, 0.1494379, -1.937105, 0, 1, 0.02352941, 1,
-0.3647569, 0.2431912, -2.636677, 0, 1, 0.02745098, 1,
-0.3595831, 0.04713533, -0.8114879, 0, 1, 0.03529412, 1,
-0.3592601, -1.477286, -2.397938, 0, 1, 0.03921569, 1,
-0.3584041, -0.2971487, -0.5575548, 0, 1, 0.04705882, 1,
-0.3574805, 0.06189984, -0.8366551, 0, 1, 0.05098039, 1,
-0.3546491, 3.282234, -0.3544607, 0, 1, 0.05882353, 1,
-0.3542256, 0.2937643, -0.4710449, 0, 1, 0.0627451, 1,
-0.3410351, -0.345594, -3.493518, 0, 1, 0.07058824, 1,
-0.3283001, -2.368451, -2.734248, 0, 1, 0.07450981, 1,
-0.3278464, -1.116014, -1.586442, 0, 1, 0.08235294, 1,
-0.3277889, 0.5593916, -1.14489, 0, 1, 0.08627451, 1,
-0.326862, 0.3130012, -0.7392934, 0, 1, 0.09411765, 1,
-0.3227026, 1.143387, -0.334697, 0, 1, 0.1019608, 1,
-0.3213741, -1.09872, -2.280015, 0, 1, 0.1058824, 1,
-0.3204246, 0.6769493, -0.5226324, 0, 1, 0.1137255, 1,
-0.3129896, -0.6076345, -2.31761, 0, 1, 0.1176471, 1,
-0.3125792, 0.9101169, -1.988921, 0, 1, 0.1254902, 1,
-0.309855, -1.062852, -1.544019, 0, 1, 0.1294118, 1,
-0.309031, -0.09530842, -0.7886546, 0, 1, 0.1372549, 1,
-0.3081241, -1.096732, -2.31701, 0, 1, 0.1411765, 1,
-0.3041579, 0.06207901, -1.541903, 0, 1, 0.1490196, 1,
-0.3040836, 0.2458413, -1.793762, 0, 1, 0.1529412, 1,
-0.3014301, 0.338799, -2.00246, 0, 1, 0.1607843, 1,
-0.3009403, -0.6967428, -2.877141, 0, 1, 0.1647059, 1,
-0.3008648, -0.5207216, -2.079339, 0, 1, 0.172549, 1,
-0.3004124, 1.461089, -0.3399264, 0, 1, 0.1764706, 1,
-0.3001985, 1.630398, -1.948913, 0, 1, 0.1843137, 1,
-0.2962655, -1.470924, -2.525847, 0, 1, 0.1882353, 1,
-0.2936962, 1.381856, -0.3727839, 0, 1, 0.1960784, 1,
-0.2911033, 0.9654837, 0.9701258, 0, 1, 0.2039216, 1,
-0.2901417, 2.344936, -1.196986, 0, 1, 0.2078431, 1,
-0.2884873, 0.9600334, -1.777598, 0, 1, 0.2156863, 1,
-0.287036, -1.605836, -2.470163, 0, 1, 0.2196078, 1,
-0.2866238, -0.1812481, -1.074282, 0, 1, 0.227451, 1,
-0.283817, -0.05235278, -1.876974, 0, 1, 0.2313726, 1,
-0.2835051, 2.703877, 0.3616952, 0, 1, 0.2392157, 1,
-0.2833097, 1.017609, 0.01785411, 0, 1, 0.2431373, 1,
-0.2821045, 0.1619933, -1.486084, 0, 1, 0.2509804, 1,
-0.280776, -1.341794, -3.881687, 0, 1, 0.254902, 1,
-0.2776438, 0.1005506, 0.5715733, 0, 1, 0.2627451, 1,
-0.2747048, 0.1938361, -2.596728, 0, 1, 0.2666667, 1,
-0.2722835, 1.36033, -0.9869644, 0, 1, 0.2745098, 1,
-0.2721761, 0.651423, 0.4063117, 0, 1, 0.2784314, 1,
-0.2617469, -0.3973029, -3.588071, 0, 1, 0.2862745, 1,
-0.2588447, 1.766816, -0.6165175, 0, 1, 0.2901961, 1,
-0.2535329, -0.5243034, -2.982667, 0, 1, 0.2980392, 1,
-0.2507774, 0.4017167, -0.5248512, 0, 1, 0.3058824, 1,
-0.2507173, 0.4003046, -2.002325, 0, 1, 0.3098039, 1,
-0.2460417, 0.9049405, -0.702707, 0, 1, 0.3176471, 1,
-0.2444268, 1.398696, -0.3112367, 0, 1, 0.3215686, 1,
-0.2423297, -0.477951, -4.039659, 0, 1, 0.3294118, 1,
-0.2383718, 2.685725, -0.25142, 0, 1, 0.3333333, 1,
-0.2329436, 0.1559744, -0.1770089, 0, 1, 0.3411765, 1,
-0.2308088, -1.83638, -4.150664, 0, 1, 0.345098, 1,
-0.2302038, 1.333792, -0.6969661, 0, 1, 0.3529412, 1,
-0.2297641, 1.051334, -0.6408124, 0, 1, 0.3568628, 1,
-0.2287093, -0.355634, -2.200183, 0, 1, 0.3647059, 1,
-0.2207587, 0.1172101, -0.7197981, 0, 1, 0.3686275, 1,
-0.2181139, -0.5357016, -1.791347, 0, 1, 0.3764706, 1,
-0.216688, 0.6521996, -1.226781, 0, 1, 0.3803922, 1,
-0.2148347, 0.8036307, 0.3985641, 0, 1, 0.3882353, 1,
-0.2146689, -0.6857331, -4.272836, 0, 1, 0.3921569, 1,
-0.1976125, -0.1470102, -1.78363, 0, 1, 0.4, 1,
-0.1972178, 0.899957, -0.5404767, 0, 1, 0.4078431, 1,
-0.1971622, 2.416652, -0.6864205, 0, 1, 0.4117647, 1,
-0.1965198, -0.1715426, -2.311309, 0, 1, 0.4196078, 1,
-0.1851047, 0.5990949, 1.167972, 0, 1, 0.4235294, 1,
-0.1848989, -0.4824765, -2.365026, 0, 1, 0.4313726, 1,
-0.1823632, -0.961758, -2.390257, 0, 1, 0.4352941, 1,
-0.1800572, 0.2359541, -1.807094, 0, 1, 0.4431373, 1,
-0.1795931, -0.8777876, -3.180078, 0, 1, 0.4470588, 1,
-0.1673582, -0.0741992, -2.638923, 0, 1, 0.454902, 1,
-0.1646649, 0.6757154, -1.398961, 0, 1, 0.4588235, 1,
-0.1638063, 1.10899, 0.6514828, 0, 1, 0.4666667, 1,
-0.1564625, -0.9498335, -3.628996, 0, 1, 0.4705882, 1,
-0.1553888, -1.924317, -2.217848, 0, 1, 0.4784314, 1,
-0.1538654, -0.1136532, -3.859773, 0, 1, 0.4823529, 1,
-0.1492548, -1.086985, -2.478976, 0, 1, 0.4901961, 1,
-0.1483371, 1.16837, 0.04063755, 0, 1, 0.4941176, 1,
-0.1480592, 0.6621916, 0.7771938, 0, 1, 0.5019608, 1,
-0.1470951, 1.444599, -0.6213537, 0, 1, 0.509804, 1,
-0.1468311, 1.432029, -2.008438, 0, 1, 0.5137255, 1,
-0.1456839, -0.2469334, -1.7236, 0, 1, 0.5215687, 1,
-0.1406397, 0.3920456, 0.4928468, 0, 1, 0.5254902, 1,
-0.1402425, -0.3896109, -2.894192, 0, 1, 0.5333334, 1,
-0.1351524, 0.1404526, -0.0604398, 0, 1, 0.5372549, 1,
-0.1284646, 1.647502, -0.4607725, 0, 1, 0.5450981, 1,
-0.1281713, -0.7208444, -2.775772, 0, 1, 0.5490196, 1,
-0.125444, 0.8472377, -0.3387812, 0, 1, 0.5568628, 1,
-0.1244819, 0.3488276, -0.3384174, 0, 1, 0.5607843, 1,
-0.123442, -0.6312854, -2.079909, 0, 1, 0.5686275, 1,
-0.1214253, 0.3368717, -0.1245255, 0, 1, 0.572549, 1,
-0.1214005, 0.2946354, -2.515266, 0, 1, 0.5803922, 1,
-0.1202243, -0.4851301, -0.9129423, 0, 1, 0.5843138, 1,
-0.1194443, 1.137175, 1.07598, 0, 1, 0.5921569, 1,
-0.1184338, 1.276634, -0.6968198, 0, 1, 0.5960785, 1,
-0.1153659, 1.870285, -0.1385933, 0, 1, 0.6039216, 1,
-0.1131117, 0.3188842, 0.07726248, 0, 1, 0.6117647, 1,
-0.1079643, 0.2213531, 0.7067851, 0, 1, 0.6156863, 1,
-0.1032477, -0.08585991, -2.919951, 0, 1, 0.6235294, 1,
-0.1023072, 0.2711907, 0.3884387, 0, 1, 0.627451, 1,
-0.09914498, -1.481908, -3.899262, 0, 1, 0.6352941, 1,
-0.09828534, 2.28056, 1.145706, 0, 1, 0.6392157, 1,
-0.09108237, -1.161787, -3.230812, 0, 1, 0.6470588, 1,
-0.09107678, 0.2863142, 0.9177077, 0, 1, 0.6509804, 1,
-0.0905965, 0.1553758, -0.8588118, 0, 1, 0.6588235, 1,
-0.08765087, -0.1259662, -1.376254, 0, 1, 0.6627451, 1,
-0.08638171, -0.3807017, -3.296489, 0, 1, 0.6705883, 1,
-0.08537661, 0.5947824, -0.4207021, 0, 1, 0.6745098, 1,
-0.08112285, -0.8528423, -1.650599, 0, 1, 0.682353, 1,
-0.07195134, -1.05281, -3.554052, 0, 1, 0.6862745, 1,
-0.07117305, 0.05070154, -0.8731409, 0, 1, 0.6941177, 1,
-0.06976233, 0.2130876, 1.491169, 0, 1, 0.7019608, 1,
-0.06767026, -1.06843, -4.792011, 0, 1, 0.7058824, 1,
-0.06732001, 0.3129049, -0.1019142, 0, 1, 0.7137255, 1,
-0.06626131, -1.064707, -1.311116, 0, 1, 0.7176471, 1,
-0.06466335, -0.2350478, -3.029931, 0, 1, 0.7254902, 1,
-0.0604458, -1.166453, -0.7535505, 0, 1, 0.7294118, 1,
-0.06015598, -0.4144849, -4.511221, 0, 1, 0.7372549, 1,
-0.06004135, -0.5267911, -3.153518, 0, 1, 0.7411765, 1,
-0.05817342, -0.26657, -1.708852, 0, 1, 0.7490196, 1,
-0.05813868, -0.3918754, -3.664166, 0, 1, 0.7529412, 1,
-0.05553335, 0.1792205, -1.237687, 0, 1, 0.7607843, 1,
-0.05452893, -1.439048, -2.905121, 0, 1, 0.7647059, 1,
-0.05391017, 1.580028, -2.256284, 0, 1, 0.772549, 1,
-0.05337235, 0.35715, -0.7017872, 0, 1, 0.7764706, 1,
-0.04856703, -2.4143, -3.0878, 0, 1, 0.7843137, 1,
-0.04636601, -0.6804485, -3.960955, 0, 1, 0.7882353, 1,
-0.04590992, 1.765432, 0.4953133, 0, 1, 0.7960784, 1,
-0.04372922, 0.02516426, -0.6316069, 0, 1, 0.8039216, 1,
-0.04327634, 1.812878, -1.196976, 0, 1, 0.8078431, 1,
-0.04118488, 0.1810733, -1.245008, 0, 1, 0.8156863, 1,
-0.04009574, -1.622024, -2.493214, 0, 1, 0.8196079, 1,
-0.03763472, 1.441485, 0.5650468, 0, 1, 0.827451, 1,
-0.03360508, 0.07640109, -0.375225, 0, 1, 0.8313726, 1,
-0.02722673, -2.32202, -4.85628, 0, 1, 0.8392157, 1,
-0.02688853, 0.276899, 1.170618, 0, 1, 0.8431373, 1,
-0.02663319, 1.821204, 1.940207, 0, 1, 0.8509804, 1,
-0.02505686, 0.7271197, -0.3252807, 0, 1, 0.854902, 1,
-0.02481785, 0.1003561, -1.59328, 0, 1, 0.8627451, 1,
-0.02158625, 0.6080458, -0.2139816, 0, 1, 0.8666667, 1,
-0.02120378, 0.238861, -0.9454765, 0, 1, 0.8745098, 1,
-0.01868419, 0.178087, 0.7011396, 0, 1, 0.8784314, 1,
-0.01840476, 1.10146, -0.1897035, 0, 1, 0.8862745, 1,
-0.01837861, -2.35077, -2.583448, 0, 1, 0.8901961, 1,
-0.00831497, 1.176602, 0.1199052, 0, 1, 0.8980392, 1,
-0.008070053, -0.9506974, -4.020719, 0, 1, 0.9058824, 1,
-0.003971064, 0.2650704, 0.1809258, 0, 1, 0.9098039, 1,
-0.001651726, 0.7705399, -1.148441, 0, 1, 0.9176471, 1,
-0.0002699252, -0.05950341, -3.254954, 0, 1, 0.9215686, 1,
-0.0001692668, -1.697679, -2.192108, 0, 1, 0.9294118, 1,
0.004386662, 0.2098181, -2.030321, 0, 1, 0.9333333, 1,
0.006914515, 0.8850212, 0.2908148, 0, 1, 0.9411765, 1,
0.01168499, 0.7362532, -0.8478032, 0, 1, 0.945098, 1,
0.01462985, 0.09358468, 0.0176577, 0, 1, 0.9529412, 1,
0.01831136, 0.8316082, 0.4894916, 0, 1, 0.9568627, 1,
0.02315257, 1.344917, -0.9573323, 0, 1, 0.9647059, 1,
0.02377915, -1.441136, 3.462022, 0, 1, 0.9686275, 1,
0.02411337, -0.8022521, 2.082189, 0, 1, 0.9764706, 1,
0.02441668, 1.879258, 0.6426551, 0, 1, 0.9803922, 1,
0.02447547, 1.414247, -0.8243933, 0, 1, 0.9882353, 1,
0.02731659, -0.7346435, 4.669623, 0, 1, 0.9921569, 1,
0.02835171, 0.3524332, -0.3511522, 0, 1, 1, 1,
0.02986916, -1.709693, 3.307173, 0, 0.9921569, 1, 1,
0.03324891, 0.5691388, -0.739382, 0, 0.9882353, 1, 1,
0.03359311, -0.1256493, 2.755038, 0, 0.9803922, 1, 1,
0.03916784, -1.145321, 3.389084, 0, 0.9764706, 1, 1,
0.0431991, -0.5448852, 4.406291, 0, 0.9686275, 1, 1,
0.04529147, 1.605177, -0.3319152, 0, 0.9647059, 1, 1,
0.0474229, -1.011564, 3.751834, 0, 0.9568627, 1, 1,
0.05090782, -0.5924836, 1.660988, 0, 0.9529412, 1, 1,
0.05982586, 0.4405295, -0.5433645, 0, 0.945098, 1, 1,
0.06590492, 0.6913903, 0.9580405, 0, 0.9411765, 1, 1,
0.06692982, -0.5838868, 1.987256, 0, 0.9333333, 1, 1,
0.06872932, 0.4128927, -1.712291, 0, 0.9294118, 1, 1,
0.06908923, 1.464097, -1.582829, 0, 0.9215686, 1, 1,
0.06933532, 0.2973628, -0.0572052, 0, 0.9176471, 1, 1,
0.07143576, 1.44329, -0.9621723, 0, 0.9098039, 1, 1,
0.07413974, 0.7916454, -0.6547015, 0, 0.9058824, 1, 1,
0.07530368, 1.003195, 1.163323, 0, 0.8980392, 1, 1,
0.08417176, -0.2538145, 2.99308, 0, 0.8901961, 1, 1,
0.08687797, 1.405386, 0.2088162, 0, 0.8862745, 1, 1,
0.08733899, 0.1821495, 1.215306, 0, 0.8784314, 1, 1,
0.08746308, 0.7748033, -0.3851272, 0, 0.8745098, 1, 1,
0.09042206, -1.048579, 2.021274, 0, 0.8666667, 1, 1,
0.09318721, -0.5320773, 3.342696, 0, 0.8627451, 1, 1,
0.09410324, 2.440743, 1.327955, 0, 0.854902, 1, 1,
0.09533978, -0.7297802, 3.297924, 0, 0.8509804, 1, 1,
0.0968701, 0.4716961, -0.05677766, 0, 0.8431373, 1, 1,
0.1014711, -2.610902, 3.162292, 0, 0.8392157, 1, 1,
0.105639, -0.07940848, 2.473809, 0, 0.8313726, 1, 1,
0.1110012, 1.238656, 0.449253, 0, 0.827451, 1, 1,
0.1134525, 2.548463, 0.8123862, 0, 0.8196079, 1, 1,
0.1141563, -0.468536, 2.243555, 0, 0.8156863, 1, 1,
0.1166276, 1.460139, 1.650182, 0, 0.8078431, 1, 1,
0.1182706, 1.416865, 0.9143725, 0, 0.8039216, 1, 1,
0.122001, 1.623563, 0.1668094, 0, 0.7960784, 1, 1,
0.1222267, 0.3376215, -0.1811432, 0, 0.7882353, 1, 1,
0.1244499, -1.069585, 3.550877, 0, 0.7843137, 1, 1,
0.1265166, 0.2003986, 0.8401715, 0, 0.7764706, 1, 1,
0.133843, 1.342574, -0.2272294, 0, 0.772549, 1, 1,
0.1356573, -1.334128, 3.175925, 0, 0.7647059, 1, 1,
0.1370104, 1.048377, -1.174625, 0, 0.7607843, 1, 1,
0.1374129, 0.7239681, -0.1785801, 0, 0.7529412, 1, 1,
0.138665, 0.981478, 1.952403, 0, 0.7490196, 1, 1,
0.1417449, 1.124775, 0.09241956, 0, 0.7411765, 1, 1,
0.1432705, -0.8579108, 2.804023, 0, 0.7372549, 1, 1,
0.1473717, 1.901023, 0.5695727, 0, 0.7294118, 1, 1,
0.1497114, -0.9526036, 4.746181, 0, 0.7254902, 1, 1,
0.1589364, -1.428979, 2.356956, 0, 0.7176471, 1, 1,
0.1591301, -0.7637208, 4.401143, 0, 0.7137255, 1, 1,
0.1592826, 0.7107365, 0.5720421, 0, 0.7058824, 1, 1,
0.1612721, -0.4521301, 3.534959, 0, 0.6980392, 1, 1,
0.1618054, 0.8948726, 0.0122589, 0, 0.6941177, 1, 1,
0.1643069, 0.5051268, 0.5863556, 0, 0.6862745, 1, 1,
0.164395, 1.095675, 0.2855368, 0, 0.682353, 1, 1,
0.1671806, -0.4180003, 3.845232, 0, 0.6745098, 1, 1,
0.1679974, -0.9172656, 3.985758, 0, 0.6705883, 1, 1,
0.1736613, -1.023609, 2.574134, 0, 0.6627451, 1, 1,
0.1752155, -0.4627398, 1.954002, 0, 0.6588235, 1, 1,
0.1762777, 1.571582, 1.098379, 0, 0.6509804, 1, 1,
0.1767505, 0.01726355, 1.959428, 0, 0.6470588, 1, 1,
0.1783409, 1.576438, -0.8268791, 0, 0.6392157, 1, 1,
0.1818032, 0.2636404, -0.4124795, 0, 0.6352941, 1, 1,
0.1822473, 0.6090806, 1.038485, 0, 0.627451, 1, 1,
0.1824851, 0.05785349, 1.444686, 0, 0.6235294, 1, 1,
0.1849393, 0.8141465, -0.138396, 0, 0.6156863, 1, 1,
0.1884418, -0.05238492, 2.703753, 0, 0.6117647, 1, 1,
0.1906499, -1.768321, 3.161763, 0, 0.6039216, 1, 1,
0.1918537, 0.722073, 1.071795, 0, 0.5960785, 1, 1,
0.1966358, 0.6768612, -0.6913483, 0, 0.5921569, 1, 1,
0.1966996, 0.2983687, 0.1026584, 0, 0.5843138, 1, 1,
0.1970856, -1.388852, 1.679806, 0, 0.5803922, 1, 1,
0.1998182, -1.183252, 2.750283, 0, 0.572549, 1, 1,
0.2045842, 1.24535, 0.03793726, 0, 0.5686275, 1, 1,
0.2078251, -2.116694, 0.7901005, 0, 0.5607843, 1, 1,
0.2087173, 0.04574519, 0.5531641, 0, 0.5568628, 1, 1,
0.2099635, -0.3723875, 2.852903, 0, 0.5490196, 1, 1,
0.2179576, -0.4690351, 1.140128, 0, 0.5450981, 1, 1,
0.2208879, -1.731865, 3.463939, 0, 0.5372549, 1, 1,
0.2229329, 0.6399139, -0.2019239, 0, 0.5333334, 1, 1,
0.2231649, 0.5143147, 1.53404, 0, 0.5254902, 1, 1,
0.2251169, 0.4884306, -0.5990122, 0, 0.5215687, 1, 1,
0.2294467, -1.33599, 2.51169, 0, 0.5137255, 1, 1,
0.229881, 0.3918794, 0.6041784, 0, 0.509804, 1, 1,
0.2299422, -0.2361194, 0.7787343, 0, 0.5019608, 1, 1,
0.236206, 0.3287504, -0.8417159, 0, 0.4941176, 1, 1,
0.2363106, -0.3087253, 2.055863, 0, 0.4901961, 1, 1,
0.237982, 0.086395, 1.107061, 0, 0.4823529, 1, 1,
0.2396092, 0.3785653, -0.6679634, 0, 0.4784314, 1, 1,
0.2430493, -1.25981, 2.784874, 0, 0.4705882, 1, 1,
0.2431754, 1.009769, -2.1079, 0, 0.4666667, 1, 1,
0.2437651, -0.286018, 1.646845, 0, 0.4588235, 1, 1,
0.2461492, -1.395752, 3.102727, 0, 0.454902, 1, 1,
0.2523266, 0.126799, 1.670256, 0, 0.4470588, 1, 1,
0.2549543, 1.115633, 0.8806384, 0, 0.4431373, 1, 1,
0.2606563, 0.4086124, 2.022992, 0, 0.4352941, 1, 1,
0.2608727, -1.264629, 1.548041, 0, 0.4313726, 1, 1,
0.2619243, 0.3325774, -0.5450491, 0, 0.4235294, 1, 1,
0.2634285, -0.4285316, 0.4100258, 0, 0.4196078, 1, 1,
0.2643436, 1.255872, 1.340502, 0, 0.4117647, 1, 1,
0.2646932, -0.466455, 3.477764, 0, 0.4078431, 1, 1,
0.2652725, -0.472532, 3.90513, 0, 0.4, 1, 1,
0.2709096, -0.6913886, 2.239795, 0, 0.3921569, 1, 1,
0.2715578, 1.902707, 0.1371617, 0, 0.3882353, 1, 1,
0.2733421, 0.1822768, 1.934121, 0, 0.3803922, 1, 1,
0.2766177, 0.191958, 0.4271406, 0, 0.3764706, 1, 1,
0.2767713, -0.7274664, 5.091163, 0, 0.3686275, 1, 1,
0.2769309, 1.032579, 0.2426483, 0, 0.3647059, 1, 1,
0.2806228, 0.4365617, -0.7401441, 0, 0.3568628, 1, 1,
0.2808303, -2.795669, 2.233249, 0, 0.3529412, 1, 1,
0.2847004, 1.430378, -0.4435358, 0, 0.345098, 1, 1,
0.2891535, -0.663353, 2.517282, 0, 0.3411765, 1, 1,
0.2905166, 0.0954609, 0.6951578, 0, 0.3333333, 1, 1,
0.2913127, 1.385817, 0.9155597, 0, 0.3294118, 1, 1,
0.2941864, -1.007327, 2.33779, 0, 0.3215686, 1, 1,
0.2953428, 0.3857091, 0.05741695, 0, 0.3176471, 1, 1,
0.3020399, 0.3266899, 0.8305077, 0, 0.3098039, 1, 1,
0.3067675, 0.5806374, -0.4062167, 0, 0.3058824, 1, 1,
0.3076096, 0.5330586, 0.02945267, 0, 0.2980392, 1, 1,
0.309048, -1.143597, 2.92924, 0, 0.2901961, 1, 1,
0.3097779, -0.8555129, 0.6635728, 0, 0.2862745, 1, 1,
0.3128345, -0.04330896, 2.100728, 0, 0.2784314, 1, 1,
0.3145975, 0.9797924, 0.8109699, 0, 0.2745098, 1, 1,
0.3174213, 1.163625, -0.3269556, 0, 0.2666667, 1, 1,
0.3205761, -0.9860041, 1.561813, 0, 0.2627451, 1, 1,
0.3230349, -0.537214, 1.492933, 0, 0.254902, 1, 1,
0.3256564, -1.361924, 2.985773, 0, 0.2509804, 1, 1,
0.3263185, -1.418968, 2.298773, 0, 0.2431373, 1, 1,
0.326869, -0.9822704, 1.289889, 0, 0.2392157, 1, 1,
0.3271456, 2.467307, 0.2226893, 0, 0.2313726, 1, 1,
0.3280486, 0.4788359, 1.288958, 0, 0.227451, 1, 1,
0.3301743, 1.446657, -0.2567222, 0, 0.2196078, 1, 1,
0.3331105, 0.4296101, 0.7385058, 0, 0.2156863, 1, 1,
0.3363441, 0.4122981, 0.7865805, 0, 0.2078431, 1, 1,
0.3405046, -2.167629, 3.004884, 0, 0.2039216, 1, 1,
0.344672, 1.069962, 0.8029801, 0, 0.1960784, 1, 1,
0.3465788, -0.3716052, 2.035805, 0, 0.1882353, 1, 1,
0.3489, -0.7403417, 2.03258, 0, 0.1843137, 1, 1,
0.3571073, 0.6642613, 0.8155276, 0, 0.1764706, 1, 1,
0.3599927, 0.7446604, 2.589648, 0, 0.172549, 1, 1,
0.3638729, 1.668307, 1.664998, 0, 0.1647059, 1, 1,
0.3647721, -0.2168676, 0.8605559, 0, 0.1607843, 1, 1,
0.3671942, 1.181833, -1.915682, 0, 0.1529412, 1, 1,
0.3700849, -0.119394, 1.886384, 0, 0.1490196, 1, 1,
0.3754781, -0.4067679, 2.238882, 0, 0.1411765, 1, 1,
0.381615, 0.3103793, 0.2790845, 0, 0.1372549, 1, 1,
0.3817051, -0.224202, 3.053084, 0, 0.1294118, 1, 1,
0.3818402, -1.230329, 2.381219, 0, 0.1254902, 1, 1,
0.3835355, -1.019248, 4.561516, 0, 0.1176471, 1, 1,
0.3838961, -0.243094, 1.803591, 0, 0.1137255, 1, 1,
0.3844139, 0.8746734, 0.7417627, 0, 0.1058824, 1, 1,
0.384466, -0.6029624, 2.379682, 0, 0.09803922, 1, 1,
0.3860658, 2.097276, 1.783682, 0, 0.09411765, 1, 1,
0.388198, -0.7140498, 2.005731, 0, 0.08627451, 1, 1,
0.3902814, 1.140022, 0.6632571, 0, 0.08235294, 1, 1,
0.3904631, 1.735132, -1.10752, 0, 0.07450981, 1, 1,
0.3950123, 0.532626, 1.289179, 0, 0.07058824, 1, 1,
0.3954612, -0.2030219, 2.074562, 0, 0.0627451, 1, 1,
0.3968337, -0.05284251, 2.16919, 0, 0.05882353, 1, 1,
0.3969663, -0.05662294, 2.164124, 0, 0.05098039, 1, 1,
0.3985569, 0.1061762, 2.460517, 0, 0.04705882, 1, 1,
0.4015767, -0.879534, 2.756, 0, 0.03921569, 1, 1,
0.4051841, 2.334458, 0.4465341, 0, 0.03529412, 1, 1,
0.4077443, 0.8547753, -0.7367539, 0, 0.02745098, 1, 1,
0.4077835, -0.06609162, 0.4858692, 0, 0.02352941, 1, 1,
0.4081598, -0.23888, 0.1092601, 0, 0.01568628, 1, 1,
0.4104975, -0.4005309, 3.320213, 0, 0.01176471, 1, 1,
0.4140916, -1.591825, 1.241533, 0, 0.003921569, 1, 1,
0.4153926, 0.2945992, -1.406469, 0.003921569, 0, 1, 1,
0.4169258, 0.8226685, -1.016982, 0.007843138, 0, 1, 1,
0.4177462, -0.2675474, 2.554773, 0.01568628, 0, 1, 1,
0.4179973, -0.7525204, 5.049496, 0.01960784, 0, 1, 1,
0.4180514, 1.169781, 0.3122917, 0.02745098, 0, 1, 1,
0.4191158, 0.1422756, 0.5593121, 0.03137255, 0, 1, 1,
0.4211436, 0.1038586, 0.563473, 0.03921569, 0, 1, 1,
0.4251704, -0.2121938, 0.8717616, 0.04313726, 0, 1, 1,
0.4263133, -0.1058103, 1.039013, 0.05098039, 0, 1, 1,
0.4290923, 0.509398, 0.3885675, 0.05490196, 0, 1, 1,
0.4313347, -0.1485321, 1.127967, 0.0627451, 0, 1, 1,
0.433726, 0.5772619, 1.123912, 0.06666667, 0, 1, 1,
0.4379885, 1.479676, -1.561952, 0.07450981, 0, 1, 1,
0.4390515, -0.08812511, 3.408421, 0.07843138, 0, 1, 1,
0.4538153, -1.065465, 0.8284668, 0.08627451, 0, 1, 1,
0.4555123, -0.4091342, 3.033373, 0.09019608, 0, 1, 1,
0.4579418, -0.3586402, 2.759952, 0.09803922, 0, 1, 1,
0.4666776, 0.516858, -0.1082233, 0.1058824, 0, 1, 1,
0.4710897, -1.550052, 2.668625, 0.1098039, 0, 1, 1,
0.4782773, 0.217432, 2.315848, 0.1176471, 0, 1, 1,
0.4863328, 1.320139, -0.2968422, 0.1215686, 0, 1, 1,
0.489932, -0.5809951, 1.773619, 0.1294118, 0, 1, 1,
0.4984186, 0.9115892, -0.1414812, 0.1333333, 0, 1, 1,
0.4992326, 0.2918006, 1.111938, 0.1411765, 0, 1, 1,
0.5014263, -0.1539091, 1.418482, 0.145098, 0, 1, 1,
0.5020801, 0.8740699, 0.05022845, 0.1529412, 0, 1, 1,
0.5024403, -0.06749817, 2.732052, 0.1568628, 0, 1, 1,
0.5035589, -1.246791, 2.560748, 0.1647059, 0, 1, 1,
0.5061224, 1.030913, 1.291808, 0.1686275, 0, 1, 1,
0.5067669, -1.283494, 2.798154, 0.1764706, 0, 1, 1,
0.5103943, -0.6473117, 2.328807, 0.1803922, 0, 1, 1,
0.5162821, -2.65011, 2.423986, 0.1882353, 0, 1, 1,
0.5255673, -0.8551686, 1.971419, 0.1921569, 0, 1, 1,
0.5287453, 1.639199, -0.7758597, 0.2, 0, 1, 1,
0.5299168, 0.5912194, 1.005453, 0.2078431, 0, 1, 1,
0.5306573, 0.9613396, 0.007598012, 0.2117647, 0, 1, 1,
0.5332659, -0.5582485, 1.065064, 0.2196078, 0, 1, 1,
0.5422438, 0.5198035, 0.5429482, 0.2235294, 0, 1, 1,
0.5461801, 1.040307, 0.5295472, 0.2313726, 0, 1, 1,
0.5474955, 1.630336, -2.01061, 0.2352941, 0, 1, 1,
0.5491332, 1.062921, 1.096103, 0.2431373, 0, 1, 1,
0.551883, 0.5056317, 0.3561532, 0.2470588, 0, 1, 1,
0.554559, -0.02433995, 0.6753455, 0.254902, 0, 1, 1,
0.5570022, -0.3918477, 2.235618, 0.2588235, 0, 1, 1,
0.5584717, -0.2265277, 2.65592, 0.2666667, 0, 1, 1,
0.5588194, 1.229529, -1.301646, 0.2705882, 0, 1, 1,
0.5606114, -0.7367542, 4.090656, 0.2784314, 0, 1, 1,
0.5633915, 1.66056, 1.29025, 0.282353, 0, 1, 1,
0.5696782, 0.3668916, 2.387546, 0.2901961, 0, 1, 1,
0.5739503, -0.7094874, 3.563048, 0.2941177, 0, 1, 1,
0.5751859, -0.01410564, 2.305569, 0.3019608, 0, 1, 1,
0.576827, 0.4264656, 0.939497, 0.3098039, 0, 1, 1,
0.5844687, 0.476528, 0.2308887, 0.3137255, 0, 1, 1,
0.5880469, 0.7687365, 0.1345889, 0.3215686, 0, 1, 1,
0.5916336, -1.22236, 5.043633, 0.3254902, 0, 1, 1,
0.6022931, 0.342854, 1.008712, 0.3333333, 0, 1, 1,
0.6111231, 0.0271013, 0.6809476, 0.3372549, 0, 1, 1,
0.613664, -0.04881133, 2.490534, 0.345098, 0, 1, 1,
0.6169267, 0.4546302, 0.9169349, 0.3490196, 0, 1, 1,
0.6213455, -1.077786, 3.458997, 0.3568628, 0, 1, 1,
0.6243611, 0.2768116, 1.88823, 0.3607843, 0, 1, 1,
0.6244298, -0.2025965, 1.895212, 0.3686275, 0, 1, 1,
0.6251777, -0.455629, 1.52334, 0.372549, 0, 1, 1,
0.625297, 0.5655829, 0.520762, 0.3803922, 0, 1, 1,
0.6298465, -1.075181, 2.36553, 0.3843137, 0, 1, 1,
0.6331199, -0.5801154, 1.076963, 0.3921569, 0, 1, 1,
0.6343551, -0.9893793, 2.595517, 0.3960784, 0, 1, 1,
0.6344659, 0.9487829, 0.786813, 0.4039216, 0, 1, 1,
0.6397715, -0.7427896, 1.839249, 0.4117647, 0, 1, 1,
0.6401966, -0.8833173, 4.369985, 0.4156863, 0, 1, 1,
0.6483036, 0.1147781, 2.091115, 0.4235294, 0, 1, 1,
0.6494372, 0.9485309, 0.4026951, 0.427451, 0, 1, 1,
0.6554401, 0.04906582, 1.118432, 0.4352941, 0, 1, 1,
0.6562244, -0.9070363, 2.739082, 0.4392157, 0, 1, 1,
0.6610435, -0.5808893, 2.554232, 0.4470588, 0, 1, 1,
0.6650811, -0.4822671, 2.503373, 0.4509804, 0, 1, 1,
0.6700262, -0.1439632, 0.06860159, 0.4588235, 0, 1, 1,
0.6738454, 0.2757743, 1.495181, 0.4627451, 0, 1, 1,
0.6771657, -0.4097964, 3.041356, 0.4705882, 0, 1, 1,
0.6789227, -1.599145, 2.541265, 0.4745098, 0, 1, 1,
0.6794327, -0.06628845, 1.538231, 0.4823529, 0, 1, 1,
0.6799458, 1.429354, -0.1268707, 0.4862745, 0, 1, 1,
0.683907, -0.9773118, 2.445526, 0.4941176, 0, 1, 1,
0.6842784, 1.633733, -1.681749, 0.5019608, 0, 1, 1,
0.6851986, -0.5222765, 1.091237, 0.5058824, 0, 1, 1,
0.6884909, 0.3020571, 1.619223, 0.5137255, 0, 1, 1,
0.6967167, -0.3210309, 4.169378, 0.5176471, 0, 1, 1,
0.6998321, 0.6661297, 0.880877, 0.5254902, 0, 1, 1,
0.7011009, -0.8512514, 1.678368, 0.5294118, 0, 1, 1,
0.7030246, 1.147784, 1.295386, 0.5372549, 0, 1, 1,
0.7040927, 1.418434, -0.1704656, 0.5411765, 0, 1, 1,
0.7046524, -1.262766, 3.128999, 0.5490196, 0, 1, 1,
0.7075039, 1.392515, -0.6467661, 0.5529412, 0, 1, 1,
0.7086935, 0.1295599, 1.876086, 0.5607843, 0, 1, 1,
0.7089067, 0.6202735, -0.06777585, 0.5647059, 0, 1, 1,
0.7102189, -0.9269374, 1.439186, 0.572549, 0, 1, 1,
0.717155, 1.70857, -0.6791855, 0.5764706, 0, 1, 1,
0.7181188, 0.08033327, -0.1948979, 0.5843138, 0, 1, 1,
0.7277122, -0.7232381, 3.737198, 0.5882353, 0, 1, 1,
0.7309129, -0.3321052, -0.6259151, 0.5960785, 0, 1, 1,
0.7312926, 0.04740252, 2.225976, 0.6039216, 0, 1, 1,
0.7315231, 1.448073, -0.4597502, 0.6078432, 0, 1, 1,
0.7430847, -0.349586, 2.392709, 0.6156863, 0, 1, 1,
0.7450228, -1.361537, 2.556045, 0.6196079, 0, 1, 1,
0.753016, 0.2537245, 1.540148, 0.627451, 0, 1, 1,
0.7559779, 0.1408805, 0.7281277, 0.6313726, 0, 1, 1,
0.7569482, -0.5602285, 1.99292, 0.6392157, 0, 1, 1,
0.7590696, 2.275386, -0.2984113, 0.6431373, 0, 1, 1,
0.7600278, -0.3068077, 1.162016, 0.6509804, 0, 1, 1,
0.7611372, 1.579065, -0.8508513, 0.654902, 0, 1, 1,
0.7711085, 2.001073, 0.3976172, 0.6627451, 0, 1, 1,
0.7711689, -1.603943, 0.3512419, 0.6666667, 0, 1, 1,
0.773115, -0.122364, 2.247589, 0.6745098, 0, 1, 1,
0.7779878, -0.04721807, -0.7431868, 0.6784314, 0, 1, 1,
0.7807338, -0.2510923, 2.976333, 0.6862745, 0, 1, 1,
0.7845882, -1.069169, 4.176939, 0.6901961, 0, 1, 1,
0.7849128, 1.835038, 0.5284231, 0.6980392, 0, 1, 1,
0.7889267, -0.293385, 2.5109, 0.7058824, 0, 1, 1,
0.7905573, 1.465134, 1.24409, 0.7098039, 0, 1, 1,
0.7955821, -1.274938, 3.469302, 0.7176471, 0, 1, 1,
0.8011449, 0.4687251, 3.366241, 0.7215686, 0, 1, 1,
0.8070679, 0.0014905, 2.438516, 0.7294118, 0, 1, 1,
0.8076724, 1.229732, 0.9011355, 0.7333333, 0, 1, 1,
0.8132491, 0.1830713, 0.8089377, 0.7411765, 0, 1, 1,
0.8208848, 0.6277187, 0.1148535, 0.7450981, 0, 1, 1,
0.8210406, 0.8155919, -1.05499, 0.7529412, 0, 1, 1,
0.8270397, 1.995378, 0.1598448, 0.7568628, 0, 1, 1,
0.8272656, 0.5091663, -0.7590188, 0.7647059, 0, 1, 1,
0.8279718, 1.335498, -0.8011602, 0.7686275, 0, 1, 1,
0.8297114, 0.8680928, 0.5097969, 0.7764706, 0, 1, 1,
0.8307639, -1.061569, 2.084721, 0.7803922, 0, 1, 1,
0.8358128, -1.124712, 4.311322, 0.7882353, 0, 1, 1,
0.8391488, 1.872718, 2.17847, 0.7921569, 0, 1, 1,
0.8396366, 0.3716727, 0.3704084, 0.8, 0, 1, 1,
0.8447182, 0.2991408, 0.7024282, 0.8078431, 0, 1, 1,
0.855265, -1.23851, 2.820179, 0.8117647, 0, 1, 1,
0.8571013, 1.422991, 0.1806354, 0.8196079, 0, 1, 1,
0.8583401, -1.498013, 1.141408, 0.8235294, 0, 1, 1,
0.8637604, 0.8499779, 1.102108, 0.8313726, 0, 1, 1,
0.8682908, 1.116001, 0.1378847, 0.8352941, 0, 1, 1,
0.8704444, 0.1590763, 1.652962, 0.8431373, 0, 1, 1,
0.8743079, 0.8261652, 0.2042189, 0.8470588, 0, 1, 1,
0.8826404, -0.01993474, 1.58208, 0.854902, 0, 1, 1,
0.8906684, 0.2702053, 0.05776541, 0.8588235, 0, 1, 1,
0.8934039, -0.6183137, 2.604845, 0.8666667, 0, 1, 1,
0.8966416, 0.4694672, 0.4135277, 0.8705882, 0, 1, 1,
0.9092402, -0.6645691, 2.616885, 0.8784314, 0, 1, 1,
0.9111081, -0.6511861, 0.6322636, 0.8823529, 0, 1, 1,
0.9123951, -0.4480942, 3.008029, 0.8901961, 0, 1, 1,
0.9127434, 0.3690913, 2.355221, 0.8941177, 0, 1, 1,
0.9198484, -1.678592, 3.546209, 0.9019608, 0, 1, 1,
0.9246657, -0.7312609, 0.8979716, 0.9098039, 0, 1, 1,
0.9304674, 0.5133325, -0.0976055, 0.9137255, 0, 1, 1,
0.9307563, 0.449241, 2.875618, 0.9215686, 0, 1, 1,
0.9333872, -0.3850156, 1.275904, 0.9254902, 0, 1, 1,
0.9347314, -1.564009, 3.201427, 0.9333333, 0, 1, 1,
0.9392569, -0.4336489, 0.8951396, 0.9372549, 0, 1, 1,
0.9431677, -1.081773, 1.845992, 0.945098, 0, 1, 1,
0.9472942, 0.1944917, 2.219282, 0.9490196, 0, 1, 1,
0.9492281, 1.135236, -2.299168, 0.9568627, 0, 1, 1,
0.9532481, -0.0186716, 2.993812, 0.9607843, 0, 1, 1,
0.9547819, -0.399282, 0.8657713, 0.9686275, 0, 1, 1,
0.9554967, 1.011856, 0.08059987, 0.972549, 0, 1, 1,
0.9557198, -1.650295, 2.844084, 0.9803922, 0, 1, 1,
0.9716364, 1.822954, 2.528232, 0.9843137, 0, 1, 1,
0.973763, 0.7601085, 0.9323694, 0.9921569, 0, 1, 1,
0.9779455, 0.4450279, 2.199671, 0.9960784, 0, 1, 1,
0.978273, -0.6305416, 0.9394916, 1, 0, 0.9960784, 1,
0.9806621, -0.6381791, 2.524976, 1, 0, 0.9882353, 1,
0.989114, -0.1954047, 0.3799609, 1, 0, 0.9843137, 1,
0.9930576, 0.4605254, -0.6895347, 1, 0, 0.9764706, 1,
0.993125, 0.08470088, 1.776166, 1, 0, 0.972549, 1,
0.994879, 1.013093, 0.9051765, 1, 0, 0.9647059, 1,
0.9999323, -0.3721411, 3.087605, 1, 0, 0.9607843, 1,
1.000029, 1.127815, 0.1823299, 1, 0, 0.9529412, 1,
1.0013, 1.069359, 1.602702, 1, 0, 0.9490196, 1,
1.002064, 0.03856374, 1.934704, 1, 0, 0.9411765, 1,
1.010574, -1.100295, 2.792161, 1, 0, 0.9372549, 1,
1.011242, -1.997181, 3.112117, 1, 0, 0.9294118, 1,
1.012797, -0.3727209, 3.038436, 1, 0, 0.9254902, 1,
1.022384, 0.4986688, -0.3949649, 1, 0, 0.9176471, 1,
1.025857, -0.5248166, 0.943908, 1, 0, 0.9137255, 1,
1.027512, 0.3690524, -0.01866758, 1, 0, 0.9058824, 1,
1.028113, -0.1249344, 1.408741, 1, 0, 0.9019608, 1,
1.028777, -0.2284224, 3.737226, 1, 0, 0.8941177, 1,
1.039914, -1.725249, 1.285451, 1, 0, 0.8862745, 1,
1.043344, -1.397299, 2.572634, 1, 0, 0.8823529, 1,
1.044581, -1.70814, 1.675382, 1, 0, 0.8745098, 1,
1.047003, -0.03199819, 1.619474, 1, 0, 0.8705882, 1,
1.055865, -0.6007922, 2.476106, 1, 0, 0.8627451, 1,
1.059451, -1.942684, 3.752377, 1, 0, 0.8588235, 1,
1.06019, 0.1059235, 2.196143, 1, 0, 0.8509804, 1,
1.061061, 0.1795244, 2.964551, 1, 0, 0.8470588, 1,
1.061681, 0.943536, -0.06524891, 1, 0, 0.8392157, 1,
1.061783, 0.2788453, 0.1933221, 1, 0, 0.8352941, 1,
1.062335, 0.454809, 1.341314, 1, 0, 0.827451, 1,
1.068597, -1.430052, 2.838915, 1, 0, 0.8235294, 1,
1.077511, -0.9409712, 1.383472, 1, 0, 0.8156863, 1,
1.077601, 0.8661044, 1.184309, 1, 0, 0.8117647, 1,
1.078468, 1.966397, 0.3028017, 1, 0, 0.8039216, 1,
1.080177, 0.9981021, -0.2509597, 1, 0, 0.7960784, 1,
1.083103, -0.2986585, 2.15117, 1, 0, 0.7921569, 1,
1.085257, -1.853187, 2.732308, 1, 0, 0.7843137, 1,
1.087061, -0.3988462, 2.076081, 1, 0, 0.7803922, 1,
1.0876, -0.1587286, 0.932914, 1, 0, 0.772549, 1,
1.099176, -0.448417, 0.9741076, 1, 0, 0.7686275, 1,
1.105197, 1.842116, 1.541606, 1, 0, 0.7607843, 1,
1.105786, 0.1309716, -0.9007085, 1, 0, 0.7568628, 1,
1.106937, -1.538067, 2.376685, 1, 0, 0.7490196, 1,
1.107316, 1.993355, 0.6134708, 1, 0, 0.7450981, 1,
1.109023, -0.2627026, 1.539528, 1, 0, 0.7372549, 1,
1.114871, 0.02898576, 3.001467, 1, 0, 0.7333333, 1,
1.127318, -0.2702546, 2.929071, 1, 0, 0.7254902, 1,
1.131885, -0.1329451, 1.848247, 1, 0, 0.7215686, 1,
1.136395, -0.6842262, 1.620558, 1, 0, 0.7137255, 1,
1.13943, 1.415613, 1.266082, 1, 0, 0.7098039, 1,
1.14411, 0.2541509, 2.370516, 1, 0, 0.7019608, 1,
1.156315, -0.0360144, 0.3776983, 1, 0, 0.6941177, 1,
1.172526, 1.046184, -0.2575178, 1, 0, 0.6901961, 1,
1.179464, 1.023592, 0.7459072, 1, 0, 0.682353, 1,
1.183085, -0.4512235, 2.562875, 1, 0, 0.6784314, 1,
1.190254, -0.7733913, 3.438231, 1, 0, 0.6705883, 1,
1.195541, -0.5451434, 2.324338, 1, 0, 0.6666667, 1,
1.201176, -0.128047, 1.31275, 1, 0, 0.6588235, 1,
1.201251, 0.7799238, 1.878539, 1, 0, 0.654902, 1,
1.201486, 0.216985, 2.112821, 1, 0, 0.6470588, 1,
1.219042, 0.09124439, 2.310287, 1, 0, 0.6431373, 1,
1.223609, 0.1245313, 1.124915, 1, 0, 0.6352941, 1,
1.223976, -1.174823, 2.315079, 1, 0, 0.6313726, 1,
1.228176, 0.792454, 0.09789383, 1, 0, 0.6235294, 1,
1.237164, -0.9430867, 1.552607, 1, 0, 0.6196079, 1,
1.237763, -0.5050059, 1.038233, 1, 0, 0.6117647, 1,
1.238732, 0.5700829, 1.477996, 1, 0, 0.6078432, 1,
1.244843, 1.246251, 0.04954915, 1, 0, 0.6, 1,
1.248833, -0.8959501, 1.606451, 1, 0, 0.5921569, 1,
1.253599, -1.059849, 3.288874, 1, 0, 0.5882353, 1,
1.255202, 1.03737, 1.58002, 1, 0, 0.5803922, 1,
1.260914, -0.0822995, 2.500239, 1, 0, 0.5764706, 1,
1.263281, 0.06481957, -0.3801676, 1, 0, 0.5686275, 1,
1.271172, -0.0549079, 1.411511, 1, 0, 0.5647059, 1,
1.275685, 0.04320971, 1.235743, 1, 0, 0.5568628, 1,
1.276353, 0.1554218, -0.5241694, 1, 0, 0.5529412, 1,
1.284163, -0.09294694, 2.789731, 1, 0, 0.5450981, 1,
1.286007, -0.07566354, 0.6160167, 1, 0, 0.5411765, 1,
1.28752, 0.6180209, 1.73598, 1, 0, 0.5333334, 1,
1.288163, -2.410383, 3.120968, 1, 0, 0.5294118, 1,
1.291214, -0.5001248, 2.164735, 1, 0, 0.5215687, 1,
1.302324, 0.8248424, 0.5845808, 1, 0, 0.5176471, 1,
1.315982, 0.02243802, 2.500166, 1, 0, 0.509804, 1,
1.318363, 0.75652, 1.29378, 1, 0, 0.5058824, 1,
1.321921, -1.551737, 4.139932, 1, 0, 0.4980392, 1,
1.332884, 0.1897835, 1.133386, 1, 0, 0.4901961, 1,
1.351942, -0.2488169, 2.148099, 1, 0, 0.4862745, 1,
1.361596, -0.4886609, 2.438803, 1, 0, 0.4784314, 1,
1.361776, 1.358319, 0.4751817, 1, 0, 0.4745098, 1,
1.36308, -0.3657404, 0.2975099, 1, 0, 0.4666667, 1,
1.367246, 0.06776955, 1.515246, 1, 0, 0.4627451, 1,
1.368576, 0.05242695, 0.8516656, 1, 0, 0.454902, 1,
1.371092, 0.5928265, 1.541746, 1, 0, 0.4509804, 1,
1.377853, -1.330772, 4.081135, 1, 0, 0.4431373, 1,
1.386515, -1.161962, 3.642917, 1, 0, 0.4392157, 1,
1.396164, 0.8980463, 1.699849, 1, 0, 0.4313726, 1,
1.419577, 0.1306436, 2.16826, 1, 0, 0.427451, 1,
1.421044, -1.804767, 2.869813, 1, 0, 0.4196078, 1,
1.435879, 1.392661, 1.799791, 1, 0, 0.4156863, 1,
1.439442, -0.5414543, 1.40459, 1, 0, 0.4078431, 1,
1.464522, -0.005312993, 2.010535, 1, 0, 0.4039216, 1,
1.470315, -0.2240858, 2.221756, 1, 0, 0.3960784, 1,
1.470366, 0.9442047, 2.24895, 1, 0, 0.3882353, 1,
1.471321, 0.1313786, 3.054184, 1, 0, 0.3843137, 1,
1.481125, -1.225956, 3.146506, 1, 0, 0.3764706, 1,
1.503391, 0.1486891, 1.593321, 1, 0, 0.372549, 1,
1.534122, -0.272576, 1.484328, 1, 0, 0.3647059, 1,
1.537891, -1.093817, 0.8450859, 1, 0, 0.3607843, 1,
1.55067, 0.333572, 1.486064, 1, 0, 0.3529412, 1,
1.568853, -0.05271896, 2.426942, 1, 0, 0.3490196, 1,
1.580901, 0.8500243, 0.2694067, 1, 0, 0.3411765, 1,
1.584993, -0.5398163, 1.905498, 1, 0, 0.3372549, 1,
1.591082, 0.548618, 1.342049, 1, 0, 0.3294118, 1,
1.596319, -1.138558, 3.003571, 1, 0, 0.3254902, 1,
1.599692, 0.05348711, 0.5549421, 1, 0, 0.3176471, 1,
1.61825, -0.8454883, 0.0818489, 1, 0, 0.3137255, 1,
1.626246, 1.078767, 1.990179, 1, 0, 0.3058824, 1,
1.627569, 0.663581, 0.9062333, 1, 0, 0.2980392, 1,
1.637477, 0.07078414, 1.298995, 1, 0, 0.2941177, 1,
1.668722, -0.7247268, 2.153356, 1, 0, 0.2862745, 1,
1.674465, 0.4211389, 0.8159922, 1, 0, 0.282353, 1,
1.677467, 0.7162766, -1.096229, 1, 0, 0.2745098, 1,
1.678586, -2.705135, 2.446411, 1, 0, 0.2705882, 1,
1.693111, -1.114844, 1.798459, 1, 0, 0.2627451, 1,
1.698987, -1.363222, 0.09333379, 1, 0, 0.2588235, 1,
1.699761, -1.949166, 3.214827, 1, 0, 0.2509804, 1,
1.709414, -0.6834694, 0.6675556, 1, 0, 0.2470588, 1,
1.709602, -0.12165, 2.19545, 1, 0, 0.2392157, 1,
1.710651, -2.697667, 3.030599, 1, 0, 0.2352941, 1,
1.710806, 0.1149087, 0.1031044, 1, 0, 0.227451, 1,
1.717919, 0.9222953, -0.0436119, 1, 0, 0.2235294, 1,
1.725539, -1.24752, 1.204509, 1, 0, 0.2156863, 1,
1.763544, 0.6770369, -0.2841755, 1, 0, 0.2117647, 1,
1.79656, 0.5539953, -0.1611371, 1, 0, 0.2039216, 1,
1.803908, 0.8032748, -0.2873926, 1, 0, 0.1960784, 1,
1.810888, 0.551725, 2.595866, 1, 0, 0.1921569, 1,
1.83132, -0.1790891, 2.493305, 1, 0, 0.1843137, 1,
1.957716, -0.8866619, 4.524072, 1, 0, 0.1803922, 1,
1.970372, 0.1951347, 1.241371, 1, 0, 0.172549, 1,
2.041627, 0.605253, 1.719001, 1, 0, 0.1686275, 1,
2.042509, 0.4428727, 0.7529381, 1, 0, 0.1607843, 1,
2.068457, -0.03538986, 2.58528, 1, 0, 0.1568628, 1,
2.076547, 0.3769936, 1.462867, 1, 0, 0.1490196, 1,
2.194636, -0.5674493, 2.28283, 1, 0, 0.145098, 1,
2.212942, -0.6919274, 1.655603, 1, 0, 0.1372549, 1,
2.252946, 0.6044949, 2.97801, 1, 0, 0.1333333, 1,
2.256749, -0.012583, 2.590786, 1, 0, 0.1254902, 1,
2.257073, -0.2442224, 1.340028, 1, 0, 0.1215686, 1,
2.265102, 0.2674866, 0.7960784, 1, 0, 0.1137255, 1,
2.309646, -0.06293384, 0.3019002, 1, 0, 0.1098039, 1,
2.310659, -1.144239, 2.440506, 1, 0, 0.1019608, 1,
2.344862, -0.615541, 2.087185, 1, 0, 0.09411765, 1,
2.354084, -0.1872844, 2.073339, 1, 0, 0.09019608, 1,
2.35997, 0.8337869, -0.5476322, 1, 0, 0.08235294, 1,
2.376614, 1.691039, 2.358249, 1, 0, 0.07843138, 1,
2.383504, -1.348491, 1.198389, 1, 0, 0.07058824, 1,
2.426132, -0.4802278, 1.61346, 1, 0, 0.06666667, 1,
2.438441, -0.02209814, 1.696672, 1, 0, 0.05882353, 1,
2.457893, -1.627699, 1.403419, 1, 0, 0.05490196, 1,
2.462856, -0.3159539, 1.492225, 1, 0, 0.04705882, 1,
2.509591, -0.4722757, 2.588373, 1, 0, 0.04313726, 1,
2.511342, -0.4888296, 2.478678, 1, 0, 0.03529412, 1,
2.515032, 0.4386628, 0.3619088, 1, 0, 0.03137255, 1,
2.617999, -0.353799, 2.497942, 1, 0, 0.02352941, 1,
2.630683, -0.2613112, 2.860715, 1, 0, 0.01960784, 1,
2.810447, 0.7142097, 1.26827, 1, 0, 0.01176471, 1,
2.873883, -0.6344724, 2.417993, 1, 0, 0.007843138, 1
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
-0.5972023, -3.893166, -7.972698, 0, -0.5, 0.5, 0.5,
-0.5972023, -3.893166, -7.972698, 1, -0.5, 0.5, 0.5,
-0.5972023, -3.893166, -7.972698, 1, 1.5, 0.5, 0.5,
-0.5972023, -3.893166, -7.972698, 0, 1.5, 0.5, 0.5
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
-5.244986, 0.2145125, -7.972698, 0, -0.5, 0.5, 0.5,
-5.244986, 0.2145125, -7.972698, 1, -0.5, 0.5, 0.5,
-5.244986, 0.2145125, -7.972698, 1, 1.5, 0.5, 0.5,
-5.244986, 0.2145125, -7.972698, 0, 1.5, 0.5, 0.5
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
-5.244986, -3.893166, -0.4940705, 0, -0.5, 0.5, 0.5,
-5.244986, -3.893166, -0.4940705, 1, -0.5, 0.5, 0.5,
-5.244986, -3.893166, -0.4940705, 1, 1.5, 0.5, 0.5,
-5.244986, -3.893166, -0.4940705, 0, 1.5, 0.5, 0.5
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
-4, -2.94524, -6.246861,
2, -2.94524, -6.246861,
-4, -2.94524, -6.246861,
-4, -3.103228, -6.534501,
-3, -2.94524, -6.246861,
-3, -3.103228, -6.534501,
-2, -2.94524, -6.246861,
-2, -3.103228, -6.534501,
-1, -2.94524, -6.246861,
-1, -3.103228, -6.534501,
0, -2.94524, -6.246861,
0, -3.103228, -6.534501,
1, -2.94524, -6.246861,
1, -3.103228, -6.534501,
2, -2.94524, -6.246861,
2, -3.103228, -6.534501
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
"-4",
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
-4, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
-4, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
-4, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
-4, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
-3, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
-3, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
-3, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
-3, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
-2, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
-2, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
-2, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
-2, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
-1, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
-1, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
-1, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
-1, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
0, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
0, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
0, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
0, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
1, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
1, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
1, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
1, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5,
2, -3.419203, -7.10978, 0, -0.5, 0.5, 0.5,
2, -3.419203, -7.10978, 1, -0.5, 0.5, 0.5,
2, -3.419203, -7.10978, 1, 1.5, 0.5, 0.5,
2, -3.419203, -7.10978, 0, 1.5, 0.5, 0.5
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
-4.172421, -2, -6.246861,
-4.172421, 3, -6.246861,
-4.172421, -2, -6.246861,
-4.351182, -2, -6.534501,
-4.172421, -1, -6.246861,
-4.351182, -1, -6.534501,
-4.172421, 0, -6.246861,
-4.351182, 0, -6.534501,
-4.172421, 1, -6.246861,
-4.351182, 1, -6.534501,
-4.172421, 2, -6.246861,
-4.351182, 2, -6.534501,
-4.172421, 3, -6.246861,
-4.351182, 3, -6.534501
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
-4.708703, -2, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, -2, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, -2, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, -2, -7.10978, 0, 1.5, 0.5, 0.5,
-4.708703, -1, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, -1, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, -1, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, -1, -7.10978, 0, 1.5, 0.5, 0.5,
-4.708703, 0, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, 0, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, 0, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, 0, -7.10978, 0, 1.5, 0.5, 0.5,
-4.708703, 1, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, 1, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, 1, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, 1, -7.10978, 0, 1.5, 0.5, 0.5,
-4.708703, 2, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, 2, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, 2, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, 2, -7.10978, 0, 1.5, 0.5, 0.5,
-4.708703, 3, -7.10978, 0, -0.5, 0.5, 0.5,
-4.708703, 3, -7.10978, 1, -0.5, 0.5, 0.5,
-4.708703, 3, -7.10978, 1, 1.5, 0.5, 0.5,
-4.708703, 3, -7.10978, 0, 1.5, 0.5, 0.5
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
-4.172421, -2.94524, -6,
-4.172421, -2.94524, 4,
-4.172421, -2.94524, -6,
-4.351182, -3.103228, -6,
-4.172421, -2.94524, -4,
-4.351182, -3.103228, -4,
-4.172421, -2.94524, -2,
-4.351182, -3.103228, -2,
-4.172421, -2.94524, 0,
-4.351182, -3.103228, 0,
-4.172421, -2.94524, 2,
-4.351182, -3.103228, 2,
-4.172421, -2.94524, 4,
-4.351182, -3.103228, 4
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
-4.708703, -3.419203, -6, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -6, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -6, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, -6, 0, 1.5, 0.5, 0.5,
-4.708703, -3.419203, -4, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -4, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -4, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, -4, 0, 1.5, 0.5, 0.5,
-4.708703, -3.419203, -2, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -2, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, -2, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, -2, 0, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 0, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 0, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 0, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 0, 0, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 2, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 2, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 2, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 2, 0, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 4, 0, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 4, 1, -0.5, 0.5, 0.5,
-4.708703, -3.419203, 4, 1, 1.5, 0.5, 0.5,
-4.708703, -3.419203, 4, 0, 1.5, 0.5, 0.5
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
-4.172421, -2.94524, -6.246861,
-4.172421, 3.374265, -6.246861,
-4.172421, -2.94524, 5.25872,
-4.172421, 3.374265, 5.25872,
-4.172421, -2.94524, -6.246861,
-4.172421, -2.94524, 5.25872,
-4.172421, 3.374265, -6.246861,
-4.172421, 3.374265, 5.25872,
-4.172421, -2.94524, -6.246861,
2.978016, -2.94524, -6.246861,
-4.172421, -2.94524, 5.25872,
2.978016, -2.94524, 5.25872,
-4.172421, 3.374265, -6.246861,
2.978016, 3.374265, -6.246861,
-4.172421, 3.374265, 5.25872,
2.978016, 3.374265, 5.25872,
2.978016, -2.94524, -6.246861,
2.978016, 3.374265, -6.246861,
2.978016, -2.94524, 5.25872,
2.978016, 3.374265, 5.25872,
2.978016, -2.94524, -6.246861,
2.978016, -2.94524, 5.25872,
2.978016, 3.374265, -6.246861,
2.978016, 3.374265, 5.25872
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
var radius = 7.981952;
var distance = 35.51261;
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
mvMatrix.translate( 0.5972023, -0.2145125, 0.4940705 );
mvMatrix.scale( 1.206953, 1.365652, 0.7500919 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.51261);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
4-amino-5-hydroxymet<-read.table("4-amino-5-hydroxymet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-amino-5-hydroxymet$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
y<-4-amino-5-hydroxymet$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
z<-4-amino-5-hydroxymet$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
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
-4.068288, -0.8518226, -1.429343, 0, 0, 1, 1, 1,
-3.453913, -0.6426651, -1.115397, 1, 0, 0, 1, 1,
-2.962334, 0.6661882, -1.073968, 1, 0, 0, 1, 1,
-2.804842, 1.473685, -1.669053, 1, 0, 0, 1, 1,
-2.700897, 0.1864127, -2.978534, 1, 0, 0, 1, 1,
-2.64903, -0.08280662, -2.049557, 1, 0, 0, 1, 1,
-2.569848, 1.032718, -1.43303, 0, 0, 0, 1, 1,
-2.46362, -0.690751, -3.913288, 0, 0, 0, 1, 1,
-2.414279, -0.3291828, -3.479775, 0, 0, 0, 1, 1,
-2.351668, -0.8054428, -1.078802, 0, 0, 0, 1, 1,
-2.342895, -2.253402, -3.358703, 0, 0, 0, 1, 1,
-2.325869, -0.424897, -2.582112, 0, 0, 0, 1, 1,
-2.259844, -0.1092644, -1.697589, 0, 0, 0, 1, 1,
-2.251528, 1.127342, -1.564021, 1, 1, 1, 1, 1,
-2.2493, 0.903143, -1.49004, 1, 1, 1, 1, 1,
-2.193526, -1.268407, -2.39576, 1, 1, 1, 1, 1,
-2.135559, -0.008628669, -3.042145, 1, 1, 1, 1, 1,
-2.118889, -1.597265, -1.648293, 1, 1, 1, 1, 1,
-2.108028, -1.223249, -3.962749, 1, 1, 1, 1, 1,
-2.087701, 0.7471101, -0.4283174, 1, 1, 1, 1, 1,
-2.077811, 0.1269883, -0.9527768, 1, 1, 1, 1, 1,
-2.064535, 0.8168028, -1.81489, 1, 1, 1, 1, 1,
-2.061704, -0.9573968, -0.9557524, 1, 1, 1, 1, 1,
-2.055754, 0.3677765, 0.8084005, 1, 1, 1, 1, 1,
-2.012957, -2.853209, -2.992162, 1, 1, 1, 1, 1,
-2.008974, 0.7271104, -1.058222, 1, 1, 1, 1, 1,
-1.996502, -0.267306, -1.888531, 1, 1, 1, 1, 1,
-1.99424, -1.544939, -1.054904, 1, 1, 1, 1, 1,
-1.984272, -0.2867868, -3.877399, 0, 0, 1, 1, 1,
-1.97155, 1.447169, -0.1052496, 1, 0, 0, 1, 1,
-1.915775, -0.4468621, -1.290215, 1, 0, 0, 1, 1,
-1.857236, -1.663519, -2.98594, 1, 0, 0, 1, 1,
-1.842072, 0.3200372, -1.91407, 1, 0, 0, 1, 1,
-1.82768, -0.2400346, -2.887477, 1, 0, 0, 1, 1,
-1.819094, -1.124351, -1.622714, 0, 0, 0, 1, 1,
-1.813997, 1.475203, -0.8303498, 0, 0, 0, 1, 1,
-1.800976, 0.5141411, -1.443332, 0, 0, 0, 1, 1,
-1.785205, 0.1162133, -0.8110588, 0, 0, 0, 1, 1,
-1.774918, -0.7251192, -2.153869, 0, 0, 0, 1, 1,
-1.756066, 1.049907, -3.870064, 0, 0, 0, 1, 1,
-1.738785, -0.1171073, -1.006758, 0, 0, 0, 1, 1,
-1.735728, 0.8630562, -1.195714, 1, 1, 1, 1, 1,
-1.708303, 2.323211, 0.1666832, 1, 1, 1, 1, 1,
-1.704432, 0.8871061, -2.693992, 1, 1, 1, 1, 1,
-1.677089, -0.02557584, -1.938654, 1, 1, 1, 1, 1,
-1.672598, 1.042598, -0.6593192, 1, 1, 1, 1, 1,
-1.657609, -0.09417869, -2.528509, 1, 1, 1, 1, 1,
-1.642197, 0.3953217, 0.05934512, 1, 1, 1, 1, 1,
-1.640206, -0.4083917, -2.655312, 1, 1, 1, 1, 1,
-1.621773, 1.405645, 0.4776363, 1, 1, 1, 1, 1,
-1.613719, -0.4776115, -2.978911, 1, 1, 1, 1, 1,
-1.605592, 0.2312762, -2.703242, 1, 1, 1, 1, 1,
-1.592181, -0.08628836, -1.251487, 1, 1, 1, 1, 1,
-1.59181, 0.4978201, -2.555628, 1, 1, 1, 1, 1,
-1.590797, 2.654805, -0.2913806, 1, 1, 1, 1, 1,
-1.569417, -0.9849999, -1.552631, 1, 1, 1, 1, 1,
-1.566306, -1.16953, -1.244112, 0, 0, 1, 1, 1,
-1.549136, -0.2145168, -2.290129, 1, 0, 0, 1, 1,
-1.523399, 1.432997, -1.258788, 1, 0, 0, 1, 1,
-1.51763, 0.8143651, -0.7969601, 1, 0, 0, 1, 1,
-1.51104, -0.3577403, -2.714129, 1, 0, 0, 1, 1,
-1.509625, 0.263567, -0.7485486, 1, 0, 0, 1, 1,
-1.49022, 0.1872942, -0.2080862, 0, 0, 0, 1, 1,
-1.483533, 0.1828995, -1.472785, 0, 0, 0, 1, 1,
-1.482658, 0.4916315, -0.7186341, 0, 0, 0, 1, 1,
-1.468445, 0.2900569, -1.693151, 0, 0, 0, 1, 1,
-1.431073, -1.16476, -1.679111, 0, 0, 0, 1, 1,
-1.414595, 0.9112133, -2.922368, 0, 0, 0, 1, 1,
-1.410164, 2.358812, -0.6620378, 0, 0, 0, 1, 1,
-1.386568, 1.729172, 0.6808957, 1, 1, 1, 1, 1,
-1.382644, 1.747337, -0.3624104, 1, 1, 1, 1, 1,
-1.38264, -1.105215, -3.921146, 1, 1, 1, 1, 1,
-1.366721, -0.1742447, -1.696819, 1, 1, 1, 1, 1,
-1.358092, -0.05559017, -1.078913, 1, 1, 1, 1, 1,
-1.34416, -0.3900173, -3.041903, 1, 1, 1, 1, 1,
-1.331099, -1.749192, -3.360918, 1, 1, 1, 1, 1,
-1.330371, -0.8382808, -2.669967, 1, 1, 1, 1, 1,
-1.321074, -0.2285806, -0.3813932, 1, 1, 1, 1, 1,
-1.319972, 0.3140593, -1.816258, 1, 1, 1, 1, 1,
-1.31824, -0.5155891, -3.296986, 1, 1, 1, 1, 1,
-1.314598, -0.3154183, -1.67532, 1, 1, 1, 1, 1,
-1.313864, 0.7354388, -1.896649, 1, 1, 1, 1, 1,
-1.310361, -0.4573983, -0.20511, 1, 1, 1, 1, 1,
-1.306428, 1.453861, -0.871963, 1, 1, 1, 1, 1,
-1.302948, 0.04687529, -1.361039, 0, 0, 1, 1, 1,
-1.300945, 0.6893022, -1.572083, 1, 0, 0, 1, 1,
-1.30072, -0.1982556, -1.843027, 1, 0, 0, 1, 1,
-1.298501, -0.8944887, -2.323649, 1, 0, 0, 1, 1,
-1.29524, 2.014653, 0.3373385, 1, 0, 0, 1, 1,
-1.295205, -0.6099823, -3.745303, 1, 0, 0, 1, 1,
-1.287988, -0.8588374, -4.110848, 0, 0, 0, 1, 1,
-1.28793, -1.405179, -0.5821012, 0, 0, 0, 1, 1,
-1.273107, 0.1215795, -1.51219, 0, 0, 0, 1, 1,
-1.268526, -0.8271497, -2.58662, 0, 0, 0, 1, 1,
-1.260206, 1.232377, -0.568689, 0, 0, 0, 1, 1,
-1.258401, -0.8290998, -1.952895, 0, 0, 0, 1, 1,
-1.247587, 0.6789203, -0.2885559, 0, 0, 0, 1, 1,
-1.245413, -0.4655665, -2.043518, 1, 1, 1, 1, 1,
-1.230083, -0.884679, -2.129729, 1, 1, 1, 1, 1,
-1.229977, 1.631419, 0.3570338, 1, 1, 1, 1, 1,
-1.224497, -0.2369341, -2.516727, 1, 1, 1, 1, 1,
-1.218423, -0.397201, -0.2532931, 1, 1, 1, 1, 1,
-1.210596, 1.163037, -0.4831595, 1, 1, 1, 1, 1,
-1.206845, 0.4968306, -0.723216, 1, 1, 1, 1, 1,
-1.19641, 1.718644, 0.2214543, 1, 1, 1, 1, 1,
-1.193976, 0.6723609, -0.1582786, 1, 1, 1, 1, 1,
-1.18945, -1.778949, -3.286504, 1, 1, 1, 1, 1,
-1.172714, 0.2811481, -1.51024, 1, 1, 1, 1, 1,
-1.171241, 0.8182544, 0.1475669, 1, 1, 1, 1, 1,
-1.166463, -1.155841, -2.703596, 1, 1, 1, 1, 1,
-1.157901, 0.941581, -1.267026, 1, 1, 1, 1, 1,
-1.149302, -0.5119172, -1.786387, 1, 1, 1, 1, 1,
-1.13597, -0.1838542, -2.226254, 0, 0, 1, 1, 1,
-1.132666, 0.9243071, -3.102121, 1, 0, 0, 1, 1,
-1.130094, -0.867114, 0.1880181, 1, 0, 0, 1, 1,
-1.129397, -0.3681801, -1.079567, 1, 0, 0, 1, 1,
-1.129046, 0.636434, -2.052169, 1, 0, 0, 1, 1,
-1.119074, -2.316798, -2.59379, 1, 0, 0, 1, 1,
-1.116372, -1.316347, -1.92458, 0, 0, 0, 1, 1,
-1.114765, 0.02458606, -2.758937, 0, 0, 0, 1, 1,
-1.114391, 0.02215072, -2.247476, 0, 0, 0, 1, 1,
-1.101894, 0.02045677, -1.0869, 0, 0, 0, 1, 1,
-1.084145, -0.05462973, -0.970292, 0, 0, 0, 1, 1,
-1.080043, 0.8922613, -2.640485, 0, 0, 0, 1, 1,
-1.074443, -0.4172218, -0.8581112, 0, 0, 0, 1, 1,
-1.071848, 1.451112, 0.1532917, 1, 1, 1, 1, 1,
-1.07132, -0.7008252, -1.030226, 1, 1, 1, 1, 1,
-1.042894, -0.5882721, -2.640182, 1, 1, 1, 1, 1,
-1.038396, -1.971984, -4.099737, 1, 1, 1, 1, 1,
-1.038146, -0.2372535, -1.965939, 1, 1, 1, 1, 1,
-1.033301, 0.3315683, 0.5038598, 1, 1, 1, 1, 1,
-1.032892, 0.1019797, -1.836308, 1, 1, 1, 1, 1,
-1.026046, -1.326455, -3.355282, 1, 1, 1, 1, 1,
-1.022634, -0.6190985, -2.91037, 1, 1, 1, 1, 1,
-1.016801, -0.09081435, -2.121069, 1, 1, 1, 1, 1,
-1.016601, -1.058655, -2.495216, 1, 1, 1, 1, 1,
-1.015017, -1.2518, -3.491814, 1, 1, 1, 1, 1,
-1.009947, -0.3619276, -2.506049, 1, 1, 1, 1, 1,
-1.008622, 1.409009, -0.8964448, 1, 1, 1, 1, 1,
-1.002891, 1.04804, -0.415854, 1, 1, 1, 1, 1,
-0.9960145, -0.05037391, -1.47648, 0, 0, 1, 1, 1,
-0.9791906, -1.101192, -3.612763, 1, 0, 0, 1, 1,
-0.9790686, -1.0255, -3.627387, 1, 0, 0, 1, 1,
-0.9787115, 0.433228, -0.5019534, 1, 0, 0, 1, 1,
-0.9770392, -0.4795668, -2.407211, 1, 0, 0, 1, 1,
-0.976326, -0.8497563, -2.930116, 1, 0, 0, 1, 1,
-0.9659482, 0.7372239, -1.133016, 0, 0, 0, 1, 1,
-0.96371, -0.5272036, -4.326241, 0, 0, 0, 1, 1,
-0.9582412, 1.464562, 0.402576, 0, 0, 0, 1, 1,
-0.9558475, -0.141244, -1.844349, 0, 0, 0, 1, 1,
-0.949351, 1.850636, 0.09274735, 0, 0, 0, 1, 1,
-0.9468394, -0.7817057, -1.93175, 0, 0, 0, 1, 1,
-0.9467937, 0.0489563, -1.356806, 0, 0, 0, 1, 1,
-0.9386387, 1.468935, 0.03219477, 1, 1, 1, 1, 1,
-0.9384131, -0.09376657, -1.503284, 1, 1, 1, 1, 1,
-0.93455, 1.750899, -0.3482864, 1, 1, 1, 1, 1,
-0.932991, 0.5300719, -1.267695, 1, 1, 1, 1, 1,
-0.9305784, -0.4231866, -2.44417, 1, 1, 1, 1, 1,
-0.9235263, -0.8856326, -1.969375, 1, 1, 1, 1, 1,
-0.918763, -0.9218853, -0.8782856, 1, 1, 1, 1, 1,
-0.9162837, 1.745295, -0.3120124, 1, 1, 1, 1, 1,
-0.9122331, -0.447606, -3.346585, 1, 1, 1, 1, 1,
-0.9067729, -0.3243702, -1.903431, 1, 1, 1, 1, 1,
-0.9067248, -0.2906308, -2.584798, 1, 1, 1, 1, 1,
-0.9024132, 1.87924, 1.107043, 1, 1, 1, 1, 1,
-0.8991616, -1.620073, -3.079016, 1, 1, 1, 1, 1,
-0.8964437, -0.2825144, -1.835223, 1, 1, 1, 1, 1,
-0.8960463, 0.5144461, -0.1507944, 1, 1, 1, 1, 1,
-0.8942182, -0.3210671, -0.8583168, 0, 0, 1, 1, 1,
-0.8866446, 0.7819546, -2.469551, 1, 0, 0, 1, 1,
-0.880672, -1.173415, -3.344489, 1, 0, 0, 1, 1,
-0.8798254, 0.3708303, -1.098246, 1, 0, 0, 1, 1,
-0.8786101, 1.38564, 0.3307252, 1, 0, 0, 1, 1,
-0.8726303, -0.3299026, -3.119173, 1, 0, 0, 1, 1,
-0.8690153, 2.581867, -1.385825, 0, 0, 0, 1, 1,
-0.8643512, -0.5825133, -4.025151, 0, 0, 0, 1, 1,
-0.8639559, -0.651009, -1.079, 0, 0, 0, 1, 1,
-0.8537792, 0.4234072, -1.071146, 0, 0, 0, 1, 1,
-0.8515574, -1.781335, -3.451399, 0, 0, 0, 1, 1,
-0.8448404, -0.6575904, -1.618874, 0, 0, 0, 1, 1,
-0.844592, 0.727908, -1.833241, 0, 0, 0, 1, 1,
-0.8444216, -0.3097846, -0.3329722, 1, 1, 1, 1, 1,
-0.8440659, 1.135243, -0.3399399, 1, 1, 1, 1, 1,
-0.8404298, -0.0006930195, -1.438435, 1, 1, 1, 1, 1,
-0.8395981, 0.1169906, -2.740771, 1, 1, 1, 1, 1,
-0.8353958, 1.009747, -1.087392, 1, 1, 1, 1, 1,
-0.831899, -1.213389, -2.489512, 1, 1, 1, 1, 1,
-0.8295445, 0.4890174, -2.75953, 1, 1, 1, 1, 1,
-0.8266349, -0.7915946, -1.363292, 1, 1, 1, 1, 1,
-0.8254282, -0.9721609, -2.266173, 1, 1, 1, 1, 1,
-0.8205683, 0.5278329, 0.1958939, 1, 1, 1, 1, 1,
-0.8193848, -0.3720248, -2.287788, 1, 1, 1, 1, 1,
-0.8169118, 0.6627153, -1.287272, 1, 1, 1, 1, 1,
-0.8149967, 0.1210659, -1.256699, 1, 1, 1, 1, 1,
-0.8055201, -0.0306242, -0.8653459, 1, 1, 1, 1, 1,
-0.8045571, -0.7306951, -1.647751, 1, 1, 1, 1, 1,
-0.8015528, -0.5255167, -2.256863, 0, 0, 1, 1, 1,
-0.8007975, 0.1665089, -2.510726, 1, 0, 0, 1, 1,
-0.8006465, 0.5517254, -0.5726783, 1, 0, 0, 1, 1,
-0.7940064, -0.5779, -2.410813, 1, 0, 0, 1, 1,
-0.7924641, -0.6749713, -2.779805, 1, 0, 0, 1, 1,
-0.7904967, 0.6974747, -0.1555786, 1, 0, 0, 1, 1,
-0.7904485, -0.4835376, -3.611253, 0, 0, 0, 1, 1,
-0.7897673, -1.88894, -2.898668, 0, 0, 0, 1, 1,
-0.7885675, -0.7468123, -3.026779, 0, 0, 0, 1, 1,
-0.7877497, -0.3618289, -1.001113, 0, 0, 0, 1, 1,
-0.7854633, 1.106178, -0.1978639, 0, 0, 0, 1, 1,
-0.7837533, 0.5069982, -0.7285411, 0, 0, 0, 1, 1,
-0.7764359, 0.6739202, -0.3409364, 0, 0, 0, 1, 1,
-0.7680429, -1.0811, -2.77312, 1, 1, 1, 1, 1,
-0.7580584, 0.9674636, -1.977921, 1, 1, 1, 1, 1,
-0.7539486, -1.205675, -2.438024, 1, 1, 1, 1, 1,
-0.7520531, 1.280105, -0.9824405, 1, 1, 1, 1, 1,
-0.7463992, -0.0470477, -3.860386, 1, 1, 1, 1, 1,
-0.7462996, 1.18544, -0.2657066, 1, 1, 1, 1, 1,
-0.7358406, -0.287634, -1.393233, 1, 1, 1, 1, 1,
-0.7354861, -0.9151359, -3.306604, 1, 1, 1, 1, 1,
-0.7324756, -1.095149, -2.270235, 1, 1, 1, 1, 1,
-0.7320538, -1.081074, -2.593614, 1, 1, 1, 1, 1,
-0.731276, -0.06979716, -2.509011, 1, 1, 1, 1, 1,
-0.727998, 0.9638057, 0.258761, 1, 1, 1, 1, 1,
-0.7267667, -0.4940091, -2.966232, 1, 1, 1, 1, 1,
-0.7249524, -1.36891, -1.505541, 1, 1, 1, 1, 1,
-0.7248915, 0.01202933, 0.886703, 1, 1, 1, 1, 1,
-0.7237874, 0.710236, 0.0419326, 0, 0, 1, 1, 1,
-0.7216569, 0.7254261, -0.8284178, 1, 0, 0, 1, 1,
-0.7168277, 0.1812881, -1.344429, 1, 0, 0, 1, 1,
-0.7165112, -1.456188, -2.207506, 1, 0, 0, 1, 1,
-0.7125732, -0.8316473, -1.357424, 1, 0, 0, 1, 1,
-0.7080095, -0.6121247, -3.978201, 1, 0, 0, 1, 1,
-0.7043997, -0.1378151, -1.460564, 0, 0, 0, 1, 1,
-0.7019701, 0.1011634, -1.043828, 0, 0, 0, 1, 1,
-0.6993329, 0.5875833, -0.009117168, 0, 0, 0, 1, 1,
-0.6983314, -0.5773581, -1.730576, 0, 0, 0, 1, 1,
-0.6977918, -1.044339, -2.062329, 0, 0, 0, 1, 1,
-0.697675, 0.6608493, -1.772026, 0, 0, 0, 1, 1,
-0.6907941, -1.110538, -4.040675, 0, 0, 0, 1, 1,
-0.6885913, 0.618325, 0.331768, 1, 1, 1, 1, 1,
-0.6819468, -1.564545, -4.580104, 1, 1, 1, 1, 1,
-0.6815497, -0.4213645, -2.027796, 1, 1, 1, 1, 1,
-0.681508, -0.06625801, -2.16799, 1, 1, 1, 1, 1,
-0.6802869, 0.2799459, -2.450862, 1, 1, 1, 1, 1,
-0.669177, 0.03311971, -1.745222, 1, 1, 1, 1, 1,
-0.6647686, -0.6555535, -2.502648, 1, 1, 1, 1, 1,
-0.6616579, 0.3661424, -0.7146522, 1, 1, 1, 1, 1,
-0.6574554, 1.219869, 1.184069, 1, 1, 1, 1, 1,
-0.6561026, 0.6980414, -1.376068, 1, 1, 1, 1, 1,
-0.6520139, -0.1817085, -1.265446, 1, 1, 1, 1, 1,
-0.6483997, 0.962342, -0.1989635, 1, 1, 1, 1, 1,
-0.6483629, 0.2805711, -1.831325, 1, 1, 1, 1, 1,
-0.6455693, 0.3304695, -2.143261, 1, 1, 1, 1, 1,
-0.6435484, -1.6702, -2.731003, 1, 1, 1, 1, 1,
-0.6432998, -0.3109072, -2.693171, 0, 0, 1, 1, 1,
-0.6339744, -0.7710792, -2.217957, 1, 0, 0, 1, 1,
-0.6301718, -0.4812837, -2.681759, 1, 0, 0, 1, 1,
-0.6251627, -1.228814, -3.753388, 1, 0, 0, 1, 1,
-0.6239096, 0.3763002, -0.419588, 1, 0, 0, 1, 1,
-0.6229979, 0.5494779, -0.8799378, 1, 0, 0, 1, 1,
-0.6189616, -1.304066, -4.263919, 0, 0, 0, 1, 1,
-0.6175486, -0.709594, -2.668144, 0, 0, 0, 1, 1,
-0.6167412, 0.3120059, 0.714534, 0, 0, 0, 1, 1,
-0.6156938, 0.1750797, -1.061568, 0, 0, 0, 1, 1,
-0.6113476, 0.5071007, 0.3282283, 0, 0, 0, 1, 1,
-0.608922, -0.3932559, -2.070092, 0, 0, 0, 1, 1,
-0.6013849, -0.4183128, -3.683134, 0, 0, 0, 1, 1,
-0.6000077, -0.4188299, -1.543772, 1, 1, 1, 1, 1,
-0.5990407, 0.1340024, -1.912086, 1, 1, 1, 1, 1,
-0.5931811, -0.4075532, -1.820784, 1, 1, 1, 1, 1,
-0.5921788, -0.3318627, -1.183099, 1, 1, 1, 1, 1,
-0.5905469, 0.7508128, -0.05429115, 1, 1, 1, 1, 1,
-0.5866421, 0.742394, -0.3904572, 1, 1, 1, 1, 1,
-0.5866176, -0.6679322, -2.291851, 1, 1, 1, 1, 1,
-0.5846199, -0.9471952, -2.996999, 1, 1, 1, 1, 1,
-0.5732773, -1.045309, -1.740399, 1, 1, 1, 1, 1,
-0.5728197, 0.08211322, -3.833425, 1, 1, 1, 1, 1,
-0.5647836, -0.9113507, -2.155141, 1, 1, 1, 1, 1,
-0.5508554, -0.2196619, -2.40337, 1, 1, 1, 1, 1,
-0.5506901, 0.7098497, 0.5787053, 1, 1, 1, 1, 1,
-0.5492344, -0.8556026, -4.063112, 1, 1, 1, 1, 1,
-0.5477182, 0.3364971, -1.157839, 1, 1, 1, 1, 1,
-0.5440649, 0.05850977, -0.8766544, 0, 0, 1, 1, 1,
-0.5410145, -0.05667878, -3.59978, 1, 0, 0, 1, 1,
-0.5392126, 0.08485281, -1.15466, 1, 0, 0, 1, 1,
-0.5378392, -0.9287628, -2.967705, 1, 0, 0, 1, 1,
-0.5319558, -0.5744654, -1.938233, 1, 0, 0, 1, 1,
-0.5293206, -1.170402, -0.430617, 1, 0, 0, 1, 1,
-0.5092497, -1.060686, -6.079304, 0, 0, 0, 1, 1,
-0.5087168, 0.7835203, -1.519415, 0, 0, 0, 1, 1,
-0.5071858, -1.820745, -2.633456, 0, 0, 0, 1, 1,
-0.5059785, 0.4531356, -0.1604462, 0, 0, 0, 1, 1,
-0.5059462, -1.181103, -3.130494, 0, 0, 0, 1, 1,
-0.5056005, -0.3612718, -1.1088, 0, 0, 0, 1, 1,
-0.5033063, 0.3814647, -0.9132745, 0, 0, 0, 1, 1,
-0.5023429, 0.421229, 1.900473, 1, 1, 1, 1, 1,
-0.4970735, -0.02052896, -2.19395, 1, 1, 1, 1, 1,
-0.490912, 0.5650293, -0.9896621, 1, 1, 1, 1, 1,
-0.4879132, 1.669065, -0.2363213, 1, 1, 1, 1, 1,
-0.4875716, 0.2539123, -1.251552, 1, 1, 1, 1, 1,
-0.4822062, -0.0674758, -3.079516, 1, 1, 1, 1, 1,
-0.4726893, 0.6568097, 0.05283356, 1, 1, 1, 1, 1,
-0.4702408, 0.5555181, -0.5600295, 1, 1, 1, 1, 1,
-0.45714, -0.5453475, -3.373736, 1, 1, 1, 1, 1,
-0.4566898, -0.09625673, -2.129829, 1, 1, 1, 1, 1,
-0.4564584, 0.05780921, -1.356061, 1, 1, 1, 1, 1,
-0.4538389, -0.02561034, -0.6934029, 1, 1, 1, 1, 1,
-0.449362, -1.205679, -3.800297, 1, 1, 1, 1, 1,
-0.4492309, 0.7490107, -2.112173, 1, 1, 1, 1, 1,
-0.44906, -1.488117, -1.795998, 1, 1, 1, 1, 1,
-0.4474877, 2.12584, -0.9839947, 0, 0, 1, 1, 1,
-0.4453257, -1.109252, -2.485221, 1, 0, 0, 1, 1,
-0.4452056, -0.4175169, -3.321093, 1, 0, 0, 1, 1,
-0.4365076, -0.3207977, -1.379584, 1, 0, 0, 1, 1,
-0.4297248, 1.432283, 1.163735, 1, 0, 0, 1, 1,
-0.4259982, 0.9677325, -0.151151, 1, 0, 0, 1, 1,
-0.4230808, 0.6931641, 0.08618349, 0, 0, 0, 1, 1,
-0.4223833, 0.1003012, -1.712018, 0, 0, 0, 1, 1,
-0.4218793, -0.8626214, -2.624548, 0, 0, 0, 1, 1,
-0.4212912, -0.4814222, -2.443533, 0, 0, 0, 1, 1,
-0.4196927, -0.4398028, -2.1198, 0, 0, 0, 1, 1,
-0.4141049, 1.002405, -1.914511, 0, 0, 0, 1, 1,
-0.4135412, 0.241779, -1.370866, 0, 0, 0, 1, 1,
-0.4128878, 0.201206, -0.7119384, 1, 1, 1, 1, 1,
-0.4074486, -1.727178, -4.034246, 1, 1, 1, 1, 1,
-0.4053759, -0.7874414, -3.059238, 1, 1, 1, 1, 1,
-0.4037343, 1.319366, -0.1041065, 1, 1, 1, 1, 1,
-0.4005964, -0.5052673, -3.51742, 1, 1, 1, 1, 1,
-0.3941878, -0.2401229, -2.832666, 1, 1, 1, 1, 1,
-0.3929111, -1.39667, -2.052418, 1, 1, 1, 1, 1,
-0.3893384, -0.4391223, -2.962223, 1, 1, 1, 1, 1,
-0.3885272, -0.00725018, -0.2370182, 1, 1, 1, 1, 1,
-0.3861326, 0.2251825, 0.02578958, 1, 1, 1, 1, 1,
-0.3837514, 1.051226, 0.3746469, 1, 1, 1, 1, 1,
-0.3829748, 0.3617449, -1.628128, 1, 1, 1, 1, 1,
-0.3817559, -1.550877, -5.60126, 1, 1, 1, 1, 1,
-0.373091, -2.126229, -2.276524, 1, 1, 1, 1, 1,
-0.3727112, 0.5222093, -0.4966781, 1, 1, 1, 1, 1,
-0.3699624, 0.4395499, -1.719133, 0, 0, 1, 1, 1,
-0.3689968, 0.1494379, -1.937105, 1, 0, 0, 1, 1,
-0.3647569, 0.2431912, -2.636677, 1, 0, 0, 1, 1,
-0.3595831, 0.04713533, -0.8114879, 1, 0, 0, 1, 1,
-0.3592601, -1.477286, -2.397938, 1, 0, 0, 1, 1,
-0.3584041, -0.2971487, -0.5575548, 1, 0, 0, 1, 1,
-0.3574805, 0.06189984, -0.8366551, 0, 0, 0, 1, 1,
-0.3546491, 3.282234, -0.3544607, 0, 0, 0, 1, 1,
-0.3542256, 0.2937643, -0.4710449, 0, 0, 0, 1, 1,
-0.3410351, -0.345594, -3.493518, 0, 0, 0, 1, 1,
-0.3283001, -2.368451, -2.734248, 0, 0, 0, 1, 1,
-0.3278464, -1.116014, -1.586442, 0, 0, 0, 1, 1,
-0.3277889, 0.5593916, -1.14489, 0, 0, 0, 1, 1,
-0.326862, 0.3130012, -0.7392934, 1, 1, 1, 1, 1,
-0.3227026, 1.143387, -0.334697, 1, 1, 1, 1, 1,
-0.3213741, -1.09872, -2.280015, 1, 1, 1, 1, 1,
-0.3204246, 0.6769493, -0.5226324, 1, 1, 1, 1, 1,
-0.3129896, -0.6076345, -2.31761, 1, 1, 1, 1, 1,
-0.3125792, 0.9101169, -1.988921, 1, 1, 1, 1, 1,
-0.309855, -1.062852, -1.544019, 1, 1, 1, 1, 1,
-0.309031, -0.09530842, -0.7886546, 1, 1, 1, 1, 1,
-0.3081241, -1.096732, -2.31701, 1, 1, 1, 1, 1,
-0.3041579, 0.06207901, -1.541903, 1, 1, 1, 1, 1,
-0.3040836, 0.2458413, -1.793762, 1, 1, 1, 1, 1,
-0.3014301, 0.338799, -2.00246, 1, 1, 1, 1, 1,
-0.3009403, -0.6967428, -2.877141, 1, 1, 1, 1, 1,
-0.3008648, -0.5207216, -2.079339, 1, 1, 1, 1, 1,
-0.3004124, 1.461089, -0.3399264, 1, 1, 1, 1, 1,
-0.3001985, 1.630398, -1.948913, 0, 0, 1, 1, 1,
-0.2962655, -1.470924, -2.525847, 1, 0, 0, 1, 1,
-0.2936962, 1.381856, -0.3727839, 1, 0, 0, 1, 1,
-0.2911033, 0.9654837, 0.9701258, 1, 0, 0, 1, 1,
-0.2901417, 2.344936, -1.196986, 1, 0, 0, 1, 1,
-0.2884873, 0.9600334, -1.777598, 1, 0, 0, 1, 1,
-0.287036, -1.605836, -2.470163, 0, 0, 0, 1, 1,
-0.2866238, -0.1812481, -1.074282, 0, 0, 0, 1, 1,
-0.283817, -0.05235278, -1.876974, 0, 0, 0, 1, 1,
-0.2835051, 2.703877, 0.3616952, 0, 0, 0, 1, 1,
-0.2833097, 1.017609, 0.01785411, 0, 0, 0, 1, 1,
-0.2821045, 0.1619933, -1.486084, 0, 0, 0, 1, 1,
-0.280776, -1.341794, -3.881687, 0, 0, 0, 1, 1,
-0.2776438, 0.1005506, 0.5715733, 1, 1, 1, 1, 1,
-0.2747048, 0.1938361, -2.596728, 1, 1, 1, 1, 1,
-0.2722835, 1.36033, -0.9869644, 1, 1, 1, 1, 1,
-0.2721761, 0.651423, 0.4063117, 1, 1, 1, 1, 1,
-0.2617469, -0.3973029, -3.588071, 1, 1, 1, 1, 1,
-0.2588447, 1.766816, -0.6165175, 1, 1, 1, 1, 1,
-0.2535329, -0.5243034, -2.982667, 1, 1, 1, 1, 1,
-0.2507774, 0.4017167, -0.5248512, 1, 1, 1, 1, 1,
-0.2507173, 0.4003046, -2.002325, 1, 1, 1, 1, 1,
-0.2460417, 0.9049405, -0.702707, 1, 1, 1, 1, 1,
-0.2444268, 1.398696, -0.3112367, 1, 1, 1, 1, 1,
-0.2423297, -0.477951, -4.039659, 1, 1, 1, 1, 1,
-0.2383718, 2.685725, -0.25142, 1, 1, 1, 1, 1,
-0.2329436, 0.1559744, -0.1770089, 1, 1, 1, 1, 1,
-0.2308088, -1.83638, -4.150664, 1, 1, 1, 1, 1,
-0.2302038, 1.333792, -0.6969661, 0, 0, 1, 1, 1,
-0.2297641, 1.051334, -0.6408124, 1, 0, 0, 1, 1,
-0.2287093, -0.355634, -2.200183, 1, 0, 0, 1, 1,
-0.2207587, 0.1172101, -0.7197981, 1, 0, 0, 1, 1,
-0.2181139, -0.5357016, -1.791347, 1, 0, 0, 1, 1,
-0.216688, 0.6521996, -1.226781, 1, 0, 0, 1, 1,
-0.2148347, 0.8036307, 0.3985641, 0, 0, 0, 1, 1,
-0.2146689, -0.6857331, -4.272836, 0, 0, 0, 1, 1,
-0.1976125, -0.1470102, -1.78363, 0, 0, 0, 1, 1,
-0.1972178, 0.899957, -0.5404767, 0, 0, 0, 1, 1,
-0.1971622, 2.416652, -0.6864205, 0, 0, 0, 1, 1,
-0.1965198, -0.1715426, -2.311309, 0, 0, 0, 1, 1,
-0.1851047, 0.5990949, 1.167972, 0, 0, 0, 1, 1,
-0.1848989, -0.4824765, -2.365026, 1, 1, 1, 1, 1,
-0.1823632, -0.961758, -2.390257, 1, 1, 1, 1, 1,
-0.1800572, 0.2359541, -1.807094, 1, 1, 1, 1, 1,
-0.1795931, -0.8777876, -3.180078, 1, 1, 1, 1, 1,
-0.1673582, -0.0741992, -2.638923, 1, 1, 1, 1, 1,
-0.1646649, 0.6757154, -1.398961, 1, 1, 1, 1, 1,
-0.1638063, 1.10899, 0.6514828, 1, 1, 1, 1, 1,
-0.1564625, -0.9498335, -3.628996, 1, 1, 1, 1, 1,
-0.1553888, -1.924317, -2.217848, 1, 1, 1, 1, 1,
-0.1538654, -0.1136532, -3.859773, 1, 1, 1, 1, 1,
-0.1492548, -1.086985, -2.478976, 1, 1, 1, 1, 1,
-0.1483371, 1.16837, 0.04063755, 1, 1, 1, 1, 1,
-0.1480592, 0.6621916, 0.7771938, 1, 1, 1, 1, 1,
-0.1470951, 1.444599, -0.6213537, 1, 1, 1, 1, 1,
-0.1468311, 1.432029, -2.008438, 1, 1, 1, 1, 1,
-0.1456839, -0.2469334, -1.7236, 0, 0, 1, 1, 1,
-0.1406397, 0.3920456, 0.4928468, 1, 0, 0, 1, 1,
-0.1402425, -0.3896109, -2.894192, 1, 0, 0, 1, 1,
-0.1351524, 0.1404526, -0.0604398, 1, 0, 0, 1, 1,
-0.1284646, 1.647502, -0.4607725, 1, 0, 0, 1, 1,
-0.1281713, -0.7208444, -2.775772, 1, 0, 0, 1, 1,
-0.125444, 0.8472377, -0.3387812, 0, 0, 0, 1, 1,
-0.1244819, 0.3488276, -0.3384174, 0, 0, 0, 1, 1,
-0.123442, -0.6312854, -2.079909, 0, 0, 0, 1, 1,
-0.1214253, 0.3368717, -0.1245255, 0, 0, 0, 1, 1,
-0.1214005, 0.2946354, -2.515266, 0, 0, 0, 1, 1,
-0.1202243, -0.4851301, -0.9129423, 0, 0, 0, 1, 1,
-0.1194443, 1.137175, 1.07598, 0, 0, 0, 1, 1,
-0.1184338, 1.276634, -0.6968198, 1, 1, 1, 1, 1,
-0.1153659, 1.870285, -0.1385933, 1, 1, 1, 1, 1,
-0.1131117, 0.3188842, 0.07726248, 1, 1, 1, 1, 1,
-0.1079643, 0.2213531, 0.7067851, 1, 1, 1, 1, 1,
-0.1032477, -0.08585991, -2.919951, 1, 1, 1, 1, 1,
-0.1023072, 0.2711907, 0.3884387, 1, 1, 1, 1, 1,
-0.09914498, -1.481908, -3.899262, 1, 1, 1, 1, 1,
-0.09828534, 2.28056, 1.145706, 1, 1, 1, 1, 1,
-0.09108237, -1.161787, -3.230812, 1, 1, 1, 1, 1,
-0.09107678, 0.2863142, 0.9177077, 1, 1, 1, 1, 1,
-0.0905965, 0.1553758, -0.8588118, 1, 1, 1, 1, 1,
-0.08765087, -0.1259662, -1.376254, 1, 1, 1, 1, 1,
-0.08638171, -0.3807017, -3.296489, 1, 1, 1, 1, 1,
-0.08537661, 0.5947824, -0.4207021, 1, 1, 1, 1, 1,
-0.08112285, -0.8528423, -1.650599, 1, 1, 1, 1, 1,
-0.07195134, -1.05281, -3.554052, 0, 0, 1, 1, 1,
-0.07117305, 0.05070154, -0.8731409, 1, 0, 0, 1, 1,
-0.06976233, 0.2130876, 1.491169, 1, 0, 0, 1, 1,
-0.06767026, -1.06843, -4.792011, 1, 0, 0, 1, 1,
-0.06732001, 0.3129049, -0.1019142, 1, 0, 0, 1, 1,
-0.06626131, -1.064707, -1.311116, 1, 0, 0, 1, 1,
-0.06466335, -0.2350478, -3.029931, 0, 0, 0, 1, 1,
-0.0604458, -1.166453, -0.7535505, 0, 0, 0, 1, 1,
-0.06015598, -0.4144849, -4.511221, 0, 0, 0, 1, 1,
-0.06004135, -0.5267911, -3.153518, 0, 0, 0, 1, 1,
-0.05817342, -0.26657, -1.708852, 0, 0, 0, 1, 1,
-0.05813868, -0.3918754, -3.664166, 0, 0, 0, 1, 1,
-0.05553335, 0.1792205, -1.237687, 0, 0, 0, 1, 1,
-0.05452893, -1.439048, -2.905121, 1, 1, 1, 1, 1,
-0.05391017, 1.580028, -2.256284, 1, 1, 1, 1, 1,
-0.05337235, 0.35715, -0.7017872, 1, 1, 1, 1, 1,
-0.04856703, -2.4143, -3.0878, 1, 1, 1, 1, 1,
-0.04636601, -0.6804485, -3.960955, 1, 1, 1, 1, 1,
-0.04590992, 1.765432, 0.4953133, 1, 1, 1, 1, 1,
-0.04372922, 0.02516426, -0.6316069, 1, 1, 1, 1, 1,
-0.04327634, 1.812878, -1.196976, 1, 1, 1, 1, 1,
-0.04118488, 0.1810733, -1.245008, 1, 1, 1, 1, 1,
-0.04009574, -1.622024, -2.493214, 1, 1, 1, 1, 1,
-0.03763472, 1.441485, 0.5650468, 1, 1, 1, 1, 1,
-0.03360508, 0.07640109, -0.375225, 1, 1, 1, 1, 1,
-0.02722673, -2.32202, -4.85628, 1, 1, 1, 1, 1,
-0.02688853, 0.276899, 1.170618, 1, 1, 1, 1, 1,
-0.02663319, 1.821204, 1.940207, 1, 1, 1, 1, 1,
-0.02505686, 0.7271197, -0.3252807, 0, 0, 1, 1, 1,
-0.02481785, 0.1003561, -1.59328, 1, 0, 0, 1, 1,
-0.02158625, 0.6080458, -0.2139816, 1, 0, 0, 1, 1,
-0.02120378, 0.238861, -0.9454765, 1, 0, 0, 1, 1,
-0.01868419, 0.178087, 0.7011396, 1, 0, 0, 1, 1,
-0.01840476, 1.10146, -0.1897035, 1, 0, 0, 1, 1,
-0.01837861, -2.35077, -2.583448, 0, 0, 0, 1, 1,
-0.00831497, 1.176602, 0.1199052, 0, 0, 0, 1, 1,
-0.008070053, -0.9506974, -4.020719, 0, 0, 0, 1, 1,
-0.003971064, 0.2650704, 0.1809258, 0, 0, 0, 1, 1,
-0.001651726, 0.7705399, -1.148441, 0, 0, 0, 1, 1,
-0.0002699252, -0.05950341, -3.254954, 0, 0, 0, 1, 1,
-0.0001692668, -1.697679, -2.192108, 0, 0, 0, 1, 1,
0.004386662, 0.2098181, -2.030321, 1, 1, 1, 1, 1,
0.006914515, 0.8850212, 0.2908148, 1, 1, 1, 1, 1,
0.01168499, 0.7362532, -0.8478032, 1, 1, 1, 1, 1,
0.01462985, 0.09358468, 0.0176577, 1, 1, 1, 1, 1,
0.01831136, 0.8316082, 0.4894916, 1, 1, 1, 1, 1,
0.02315257, 1.344917, -0.9573323, 1, 1, 1, 1, 1,
0.02377915, -1.441136, 3.462022, 1, 1, 1, 1, 1,
0.02411337, -0.8022521, 2.082189, 1, 1, 1, 1, 1,
0.02441668, 1.879258, 0.6426551, 1, 1, 1, 1, 1,
0.02447547, 1.414247, -0.8243933, 1, 1, 1, 1, 1,
0.02731659, -0.7346435, 4.669623, 1, 1, 1, 1, 1,
0.02835171, 0.3524332, -0.3511522, 1, 1, 1, 1, 1,
0.02986916, -1.709693, 3.307173, 1, 1, 1, 1, 1,
0.03324891, 0.5691388, -0.739382, 1, 1, 1, 1, 1,
0.03359311, -0.1256493, 2.755038, 1, 1, 1, 1, 1,
0.03916784, -1.145321, 3.389084, 0, 0, 1, 1, 1,
0.0431991, -0.5448852, 4.406291, 1, 0, 0, 1, 1,
0.04529147, 1.605177, -0.3319152, 1, 0, 0, 1, 1,
0.0474229, -1.011564, 3.751834, 1, 0, 0, 1, 1,
0.05090782, -0.5924836, 1.660988, 1, 0, 0, 1, 1,
0.05982586, 0.4405295, -0.5433645, 1, 0, 0, 1, 1,
0.06590492, 0.6913903, 0.9580405, 0, 0, 0, 1, 1,
0.06692982, -0.5838868, 1.987256, 0, 0, 0, 1, 1,
0.06872932, 0.4128927, -1.712291, 0, 0, 0, 1, 1,
0.06908923, 1.464097, -1.582829, 0, 0, 0, 1, 1,
0.06933532, 0.2973628, -0.0572052, 0, 0, 0, 1, 1,
0.07143576, 1.44329, -0.9621723, 0, 0, 0, 1, 1,
0.07413974, 0.7916454, -0.6547015, 0, 0, 0, 1, 1,
0.07530368, 1.003195, 1.163323, 1, 1, 1, 1, 1,
0.08417176, -0.2538145, 2.99308, 1, 1, 1, 1, 1,
0.08687797, 1.405386, 0.2088162, 1, 1, 1, 1, 1,
0.08733899, 0.1821495, 1.215306, 1, 1, 1, 1, 1,
0.08746308, 0.7748033, -0.3851272, 1, 1, 1, 1, 1,
0.09042206, -1.048579, 2.021274, 1, 1, 1, 1, 1,
0.09318721, -0.5320773, 3.342696, 1, 1, 1, 1, 1,
0.09410324, 2.440743, 1.327955, 1, 1, 1, 1, 1,
0.09533978, -0.7297802, 3.297924, 1, 1, 1, 1, 1,
0.0968701, 0.4716961, -0.05677766, 1, 1, 1, 1, 1,
0.1014711, -2.610902, 3.162292, 1, 1, 1, 1, 1,
0.105639, -0.07940848, 2.473809, 1, 1, 1, 1, 1,
0.1110012, 1.238656, 0.449253, 1, 1, 1, 1, 1,
0.1134525, 2.548463, 0.8123862, 1, 1, 1, 1, 1,
0.1141563, -0.468536, 2.243555, 1, 1, 1, 1, 1,
0.1166276, 1.460139, 1.650182, 0, 0, 1, 1, 1,
0.1182706, 1.416865, 0.9143725, 1, 0, 0, 1, 1,
0.122001, 1.623563, 0.1668094, 1, 0, 0, 1, 1,
0.1222267, 0.3376215, -0.1811432, 1, 0, 0, 1, 1,
0.1244499, -1.069585, 3.550877, 1, 0, 0, 1, 1,
0.1265166, 0.2003986, 0.8401715, 1, 0, 0, 1, 1,
0.133843, 1.342574, -0.2272294, 0, 0, 0, 1, 1,
0.1356573, -1.334128, 3.175925, 0, 0, 0, 1, 1,
0.1370104, 1.048377, -1.174625, 0, 0, 0, 1, 1,
0.1374129, 0.7239681, -0.1785801, 0, 0, 0, 1, 1,
0.138665, 0.981478, 1.952403, 0, 0, 0, 1, 1,
0.1417449, 1.124775, 0.09241956, 0, 0, 0, 1, 1,
0.1432705, -0.8579108, 2.804023, 0, 0, 0, 1, 1,
0.1473717, 1.901023, 0.5695727, 1, 1, 1, 1, 1,
0.1497114, -0.9526036, 4.746181, 1, 1, 1, 1, 1,
0.1589364, -1.428979, 2.356956, 1, 1, 1, 1, 1,
0.1591301, -0.7637208, 4.401143, 1, 1, 1, 1, 1,
0.1592826, 0.7107365, 0.5720421, 1, 1, 1, 1, 1,
0.1612721, -0.4521301, 3.534959, 1, 1, 1, 1, 1,
0.1618054, 0.8948726, 0.0122589, 1, 1, 1, 1, 1,
0.1643069, 0.5051268, 0.5863556, 1, 1, 1, 1, 1,
0.164395, 1.095675, 0.2855368, 1, 1, 1, 1, 1,
0.1671806, -0.4180003, 3.845232, 1, 1, 1, 1, 1,
0.1679974, -0.9172656, 3.985758, 1, 1, 1, 1, 1,
0.1736613, -1.023609, 2.574134, 1, 1, 1, 1, 1,
0.1752155, -0.4627398, 1.954002, 1, 1, 1, 1, 1,
0.1762777, 1.571582, 1.098379, 1, 1, 1, 1, 1,
0.1767505, 0.01726355, 1.959428, 1, 1, 1, 1, 1,
0.1783409, 1.576438, -0.8268791, 0, 0, 1, 1, 1,
0.1818032, 0.2636404, -0.4124795, 1, 0, 0, 1, 1,
0.1822473, 0.6090806, 1.038485, 1, 0, 0, 1, 1,
0.1824851, 0.05785349, 1.444686, 1, 0, 0, 1, 1,
0.1849393, 0.8141465, -0.138396, 1, 0, 0, 1, 1,
0.1884418, -0.05238492, 2.703753, 1, 0, 0, 1, 1,
0.1906499, -1.768321, 3.161763, 0, 0, 0, 1, 1,
0.1918537, 0.722073, 1.071795, 0, 0, 0, 1, 1,
0.1966358, 0.6768612, -0.6913483, 0, 0, 0, 1, 1,
0.1966996, 0.2983687, 0.1026584, 0, 0, 0, 1, 1,
0.1970856, -1.388852, 1.679806, 0, 0, 0, 1, 1,
0.1998182, -1.183252, 2.750283, 0, 0, 0, 1, 1,
0.2045842, 1.24535, 0.03793726, 0, 0, 0, 1, 1,
0.2078251, -2.116694, 0.7901005, 1, 1, 1, 1, 1,
0.2087173, 0.04574519, 0.5531641, 1, 1, 1, 1, 1,
0.2099635, -0.3723875, 2.852903, 1, 1, 1, 1, 1,
0.2179576, -0.4690351, 1.140128, 1, 1, 1, 1, 1,
0.2208879, -1.731865, 3.463939, 1, 1, 1, 1, 1,
0.2229329, 0.6399139, -0.2019239, 1, 1, 1, 1, 1,
0.2231649, 0.5143147, 1.53404, 1, 1, 1, 1, 1,
0.2251169, 0.4884306, -0.5990122, 1, 1, 1, 1, 1,
0.2294467, -1.33599, 2.51169, 1, 1, 1, 1, 1,
0.229881, 0.3918794, 0.6041784, 1, 1, 1, 1, 1,
0.2299422, -0.2361194, 0.7787343, 1, 1, 1, 1, 1,
0.236206, 0.3287504, -0.8417159, 1, 1, 1, 1, 1,
0.2363106, -0.3087253, 2.055863, 1, 1, 1, 1, 1,
0.237982, 0.086395, 1.107061, 1, 1, 1, 1, 1,
0.2396092, 0.3785653, -0.6679634, 1, 1, 1, 1, 1,
0.2430493, -1.25981, 2.784874, 0, 0, 1, 1, 1,
0.2431754, 1.009769, -2.1079, 1, 0, 0, 1, 1,
0.2437651, -0.286018, 1.646845, 1, 0, 0, 1, 1,
0.2461492, -1.395752, 3.102727, 1, 0, 0, 1, 1,
0.2523266, 0.126799, 1.670256, 1, 0, 0, 1, 1,
0.2549543, 1.115633, 0.8806384, 1, 0, 0, 1, 1,
0.2606563, 0.4086124, 2.022992, 0, 0, 0, 1, 1,
0.2608727, -1.264629, 1.548041, 0, 0, 0, 1, 1,
0.2619243, 0.3325774, -0.5450491, 0, 0, 0, 1, 1,
0.2634285, -0.4285316, 0.4100258, 0, 0, 0, 1, 1,
0.2643436, 1.255872, 1.340502, 0, 0, 0, 1, 1,
0.2646932, -0.466455, 3.477764, 0, 0, 0, 1, 1,
0.2652725, -0.472532, 3.90513, 0, 0, 0, 1, 1,
0.2709096, -0.6913886, 2.239795, 1, 1, 1, 1, 1,
0.2715578, 1.902707, 0.1371617, 1, 1, 1, 1, 1,
0.2733421, 0.1822768, 1.934121, 1, 1, 1, 1, 1,
0.2766177, 0.191958, 0.4271406, 1, 1, 1, 1, 1,
0.2767713, -0.7274664, 5.091163, 1, 1, 1, 1, 1,
0.2769309, 1.032579, 0.2426483, 1, 1, 1, 1, 1,
0.2806228, 0.4365617, -0.7401441, 1, 1, 1, 1, 1,
0.2808303, -2.795669, 2.233249, 1, 1, 1, 1, 1,
0.2847004, 1.430378, -0.4435358, 1, 1, 1, 1, 1,
0.2891535, -0.663353, 2.517282, 1, 1, 1, 1, 1,
0.2905166, 0.0954609, 0.6951578, 1, 1, 1, 1, 1,
0.2913127, 1.385817, 0.9155597, 1, 1, 1, 1, 1,
0.2941864, -1.007327, 2.33779, 1, 1, 1, 1, 1,
0.2953428, 0.3857091, 0.05741695, 1, 1, 1, 1, 1,
0.3020399, 0.3266899, 0.8305077, 1, 1, 1, 1, 1,
0.3067675, 0.5806374, -0.4062167, 0, 0, 1, 1, 1,
0.3076096, 0.5330586, 0.02945267, 1, 0, 0, 1, 1,
0.309048, -1.143597, 2.92924, 1, 0, 0, 1, 1,
0.3097779, -0.8555129, 0.6635728, 1, 0, 0, 1, 1,
0.3128345, -0.04330896, 2.100728, 1, 0, 0, 1, 1,
0.3145975, 0.9797924, 0.8109699, 1, 0, 0, 1, 1,
0.3174213, 1.163625, -0.3269556, 0, 0, 0, 1, 1,
0.3205761, -0.9860041, 1.561813, 0, 0, 0, 1, 1,
0.3230349, -0.537214, 1.492933, 0, 0, 0, 1, 1,
0.3256564, -1.361924, 2.985773, 0, 0, 0, 1, 1,
0.3263185, -1.418968, 2.298773, 0, 0, 0, 1, 1,
0.326869, -0.9822704, 1.289889, 0, 0, 0, 1, 1,
0.3271456, 2.467307, 0.2226893, 0, 0, 0, 1, 1,
0.3280486, 0.4788359, 1.288958, 1, 1, 1, 1, 1,
0.3301743, 1.446657, -0.2567222, 1, 1, 1, 1, 1,
0.3331105, 0.4296101, 0.7385058, 1, 1, 1, 1, 1,
0.3363441, 0.4122981, 0.7865805, 1, 1, 1, 1, 1,
0.3405046, -2.167629, 3.004884, 1, 1, 1, 1, 1,
0.344672, 1.069962, 0.8029801, 1, 1, 1, 1, 1,
0.3465788, -0.3716052, 2.035805, 1, 1, 1, 1, 1,
0.3489, -0.7403417, 2.03258, 1, 1, 1, 1, 1,
0.3571073, 0.6642613, 0.8155276, 1, 1, 1, 1, 1,
0.3599927, 0.7446604, 2.589648, 1, 1, 1, 1, 1,
0.3638729, 1.668307, 1.664998, 1, 1, 1, 1, 1,
0.3647721, -0.2168676, 0.8605559, 1, 1, 1, 1, 1,
0.3671942, 1.181833, -1.915682, 1, 1, 1, 1, 1,
0.3700849, -0.119394, 1.886384, 1, 1, 1, 1, 1,
0.3754781, -0.4067679, 2.238882, 1, 1, 1, 1, 1,
0.381615, 0.3103793, 0.2790845, 0, 0, 1, 1, 1,
0.3817051, -0.224202, 3.053084, 1, 0, 0, 1, 1,
0.3818402, -1.230329, 2.381219, 1, 0, 0, 1, 1,
0.3835355, -1.019248, 4.561516, 1, 0, 0, 1, 1,
0.3838961, -0.243094, 1.803591, 1, 0, 0, 1, 1,
0.3844139, 0.8746734, 0.7417627, 1, 0, 0, 1, 1,
0.384466, -0.6029624, 2.379682, 0, 0, 0, 1, 1,
0.3860658, 2.097276, 1.783682, 0, 0, 0, 1, 1,
0.388198, -0.7140498, 2.005731, 0, 0, 0, 1, 1,
0.3902814, 1.140022, 0.6632571, 0, 0, 0, 1, 1,
0.3904631, 1.735132, -1.10752, 0, 0, 0, 1, 1,
0.3950123, 0.532626, 1.289179, 0, 0, 0, 1, 1,
0.3954612, -0.2030219, 2.074562, 0, 0, 0, 1, 1,
0.3968337, -0.05284251, 2.16919, 1, 1, 1, 1, 1,
0.3969663, -0.05662294, 2.164124, 1, 1, 1, 1, 1,
0.3985569, 0.1061762, 2.460517, 1, 1, 1, 1, 1,
0.4015767, -0.879534, 2.756, 1, 1, 1, 1, 1,
0.4051841, 2.334458, 0.4465341, 1, 1, 1, 1, 1,
0.4077443, 0.8547753, -0.7367539, 1, 1, 1, 1, 1,
0.4077835, -0.06609162, 0.4858692, 1, 1, 1, 1, 1,
0.4081598, -0.23888, 0.1092601, 1, 1, 1, 1, 1,
0.4104975, -0.4005309, 3.320213, 1, 1, 1, 1, 1,
0.4140916, -1.591825, 1.241533, 1, 1, 1, 1, 1,
0.4153926, 0.2945992, -1.406469, 1, 1, 1, 1, 1,
0.4169258, 0.8226685, -1.016982, 1, 1, 1, 1, 1,
0.4177462, -0.2675474, 2.554773, 1, 1, 1, 1, 1,
0.4179973, -0.7525204, 5.049496, 1, 1, 1, 1, 1,
0.4180514, 1.169781, 0.3122917, 1, 1, 1, 1, 1,
0.4191158, 0.1422756, 0.5593121, 0, 0, 1, 1, 1,
0.4211436, 0.1038586, 0.563473, 1, 0, 0, 1, 1,
0.4251704, -0.2121938, 0.8717616, 1, 0, 0, 1, 1,
0.4263133, -0.1058103, 1.039013, 1, 0, 0, 1, 1,
0.4290923, 0.509398, 0.3885675, 1, 0, 0, 1, 1,
0.4313347, -0.1485321, 1.127967, 1, 0, 0, 1, 1,
0.433726, 0.5772619, 1.123912, 0, 0, 0, 1, 1,
0.4379885, 1.479676, -1.561952, 0, 0, 0, 1, 1,
0.4390515, -0.08812511, 3.408421, 0, 0, 0, 1, 1,
0.4538153, -1.065465, 0.8284668, 0, 0, 0, 1, 1,
0.4555123, -0.4091342, 3.033373, 0, 0, 0, 1, 1,
0.4579418, -0.3586402, 2.759952, 0, 0, 0, 1, 1,
0.4666776, 0.516858, -0.1082233, 0, 0, 0, 1, 1,
0.4710897, -1.550052, 2.668625, 1, 1, 1, 1, 1,
0.4782773, 0.217432, 2.315848, 1, 1, 1, 1, 1,
0.4863328, 1.320139, -0.2968422, 1, 1, 1, 1, 1,
0.489932, -0.5809951, 1.773619, 1, 1, 1, 1, 1,
0.4984186, 0.9115892, -0.1414812, 1, 1, 1, 1, 1,
0.4992326, 0.2918006, 1.111938, 1, 1, 1, 1, 1,
0.5014263, -0.1539091, 1.418482, 1, 1, 1, 1, 1,
0.5020801, 0.8740699, 0.05022845, 1, 1, 1, 1, 1,
0.5024403, -0.06749817, 2.732052, 1, 1, 1, 1, 1,
0.5035589, -1.246791, 2.560748, 1, 1, 1, 1, 1,
0.5061224, 1.030913, 1.291808, 1, 1, 1, 1, 1,
0.5067669, -1.283494, 2.798154, 1, 1, 1, 1, 1,
0.5103943, -0.6473117, 2.328807, 1, 1, 1, 1, 1,
0.5162821, -2.65011, 2.423986, 1, 1, 1, 1, 1,
0.5255673, -0.8551686, 1.971419, 1, 1, 1, 1, 1,
0.5287453, 1.639199, -0.7758597, 0, 0, 1, 1, 1,
0.5299168, 0.5912194, 1.005453, 1, 0, 0, 1, 1,
0.5306573, 0.9613396, 0.007598012, 1, 0, 0, 1, 1,
0.5332659, -0.5582485, 1.065064, 1, 0, 0, 1, 1,
0.5422438, 0.5198035, 0.5429482, 1, 0, 0, 1, 1,
0.5461801, 1.040307, 0.5295472, 1, 0, 0, 1, 1,
0.5474955, 1.630336, -2.01061, 0, 0, 0, 1, 1,
0.5491332, 1.062921, 1.096103, 0, 0, 0, 1, 1,
0.551883, 0.5056317, 0.3561532, 0, 0, 0, 1, 1,
0.554559, -0.02433995, 0.6753455, 0, 0, 0, 1, 1,
0.5570022, -0.3918477, 2.235618, 0, 0, 0, 1, 1,
0.5584717, -0.2265277, 2.65592, 0, 0, 0, 1, 1,
0.5588194, 1.229529, -1.301646, 0, 0, 0, 1, 1,
0.5606114, -0.7367542, 4.090656, 1, 1, 1, 1, 1,
0.5633915, 1.66056, 1.29025, 1, 1, 1, 1, 1,
0.5696782, 0.3668916, 2.387546, 1, 1, 1, 1, 1,
0.5739503, -0.7094874, 3.563048, 1, 1, 1, 1, 1,
0.5751859, -0.01410564, 2.305569, 1, 1, 1, 1, 1,
0.576827, 0.4264656, 0.939497, 1, 1, 1, 1, 1,
0.5844687, 0.476528, 0.2308887, 1, 1, 1, 1, 1,
0.5880469, 0.7687365, 0.1345889, 1, 1, 1, 1, 1,
0.5916336, -1.22236, 5.043633, 1, 1, 1, 1, 1,
0.6022931, 0.342854, 1.008712, 1, 1, 1, 1, 1,
0.6111231, 0.0271013, 0.6809476, 1, 1, 1, 1, 1,
0.613664, -0.04881133, 2.490534, 1, 1, 1, 1, 1,
0.6169267, 0.4546302, 0.9169349, 1, 1, 1, 1, 1,
0.6213455, -1.077786, 3.458997, 1, 1, 1, 1, 1,
0.6243611, 0.2768116, 1.88823, 1, 1, 1, 1, 1,
0.6244298, -0.2025965, 1.895212, 0, 0, 1, 1, 1,
0.6251777, -0.455629, 1.52334, 1, 0, 0, 1, 1,
0.625297, 0.5655829, 0.520762, 1, 0, 0, 1, 1,
0.6298465, -1.075181, 2.36553, 1, 0, 0, 1, 1,
0.6331199, -0.5801154, 1.076963, 1, 0, 0, 1, 1,
0.6343551, -0.9893793, 2.595517, 1, 0, 0, 1, 1,
0.6344659, 0.9487829, 0.786813, 0, 0, 0, 1, 1,
0.6397715, -0.7427896, 1.839249, 0, 0, 0, 1, 1,
0.6401966, -0.8833173, 4.369985, 0, 0, 0, 1, 1,
0.6483036, 0.1147781, 2.091115, 0, 0, 0, 1, 1,
0.6494372, 0.9485309, 0.4026951, 0, 0, 0, 1, 1,
0.6554401, 0.04906582, 1.118432, 0, 0, 0, 1, 1,
0.6562244, -0.9070363, 2.739082, 0, 0, 0, 1, 1,
0.6610435, -0.5808893, 2.554232, 1, 1, 1, 1, 1,
0.6650811, -0.4822671, 2.503373, 1, 1, 1, 1, 1,
0.6700262, -0.1439632, 0.06860159, 1, 1, 1, 1, 1,
0.6738454, 0.2757743, 1.495181, 1, 1, 1, 1, 1,
0.6771657, -0.4097964, 3.041356, 1, 1, 1, 1, 1,
0.6789227, -1.599145, 2.541265, 1, 1, 1, 1, 1,
0.6794327, -0.06628845, 1.538231, 1, 1, 1, 1, 1,
0.6799458, 1.429354, -0.1268707, 1, 1, 1, 1, 1,
0.683907, -0.9773118, 2.445526, 1, 1, 1, 1, 1,
0.6842784, 1.633733, -1.681749, 1, 1, 1, 1, 1,
0.6851986, -0.5222765, 1.091237, 1, 1, 1, 1, 1,
0.6884909, 0.3020571, 1.619223, 1, 1, 1, 1, 1,
0.6967167, -0.3210309, 4.169378, 1, 1, 1, 1, 1,
0.6998321, 0.6661297, 0.880877, 1, 1, 1, 1, 1,
0.7011009, -0.8512514, 1.678368, 1, 1, 1, 1, 1,
0.7030246, 1.147784, 1.295386, 0, 0, 1, 1, 1,
0.7040927, 1.418434, -0.1704656, 1, 0, 0, 1, 1,
0.7046524, -1.262766, 3.128999, 1, 0, 0, 1, 1,
0.7075039, 1.392515, -0.6467661, 1, 0, 0, 1, 1,
0.7086935, 0.1295599, 1.876086, 1, 0, 0, 1, 1,
0.7089067, 0.6202735, -0.06777585, 1, 0, 0, 1, 1,
0.7102189, -0.9269374, 1.439186, 0, 0, 0, 1, 1,
0.717155, 1.70857, -0.6791855, 0, 0, 0, 1, 1,
0.7181188, 0.08033327, -0.1948979, 0, 0, 0, 1, 1,
0.7277122, -0.7232381, 3.737198, 0, 0, 0, 1, 1,
0.7309129, -0.3321052, -0.6259151, 0, 0, 0, 1, 1,
0.7312926, 0.04740252, 2.225976, 0, 0, 0, 1, 1,
0.7315231, 1.448073, -0.4597502, 0, 0, 0, 1, 1,
0.7430847, -0.349586, 2.392709, 1, 1, 1, 1, 1,
0.7450228, -1.361537, 2.556045, 1, 1, 1, 1, 1,
0.753016, 0.2537245, 1.540148, 1, 1, 1, 1, 1,
0.7559779, 0.1408805, 0.7281277, 1, 1, 1, 1, 1,
0.7569482, -0.5602285, 1.99292, 1, 1, 1, 1, 1,
0.7590696, 2.275386, -0.2984113, 1, 1, 1, 1, 1,
0.7600278, -0.3068077, 1.162016, 1, 1, 1, 1, 1,
0.7611372, 1.579065, -0.8508513, 1, 1, 1, 1, 1,
0.7711085, 2.001073, 0.3976172, 1, 1, 1, 1, 1,
0.7711689, -1.603943, 0.3512419, 1, 1, 1, 1, 1,
0.773115, -0.122364, 2.247589, 1, 1, 1, 1, 1,
0.7779878, -0.04721807, -0.7431868, 1, 1, 1, 1, 1,
0.7807338, -0.2510923, 2.976333, 1, 1, 1, 1, 1,
0.7845882, -1.069169, 4.176939, 1, 1, 1, 1, 1,
0.7849128, 1.835038, 0.5284231, 1, 1, 1, 1, 1,
0.7889267, -0.293385, 2.5109, 0, 0, 1, 1, 1,
0.7905573, 1.465134, 1.24409, 1, 0, 0, 1, 1,
0.7955821, -1.274938, 3.469302, 1, 0, 0, 1, 1,
0.8011449, 0.4687251, 3.366241, 1, 0, 0, 1, 1,
0.8070679, 0.0014905, 2.438516, 1, 0, 0, 1, 1,
0.8076724, 1.229732, 0.9011355, 1, 0, 0, 1, 1,
0.8132491, 0.1830713, 0.8089377, 0, 0, 0, 1, 1,
0.8208848, 0.6277187, 0.1148535, 0, 0, 0, 1, 1,
0.8210406, 0.8155919, -1.05499, 0, 0, 0, 1, 1,
0.8270397, 1.995378, 0.1598448, 0, 0, 0, 1, 1,
0.8272656, 0.5091663, -0.7590188, 0, 0, 0, 1, 1,
0.8279718, 1.335498, -0.8011602, 0, 0, 0, 1, 1,
0.8297114, 0.8680928, 0.5097969, 0, 0, 0, 1, 1,
0.8307639, -1.061569, 2.084721, 1, 1, 1, 1, 1,
0.8358128, -1.124712, 4.311322, 1, 1, 1, 1, 1,
0.8391488, 1.872718, 2.17847, 1, 1, 1, 1, 1,
0.8396366, 0.3716727, 0.3704084, 1, 1, 1, 1, 1,
0.8447182, 0.2991408, 0.7024282, 1, 1, 1, 1, 1,
0.855265, -1.23851, 2.820179, 1, 1, 1, 1, 1,
0.8571013, 1.422991, 0.1806354, 1, 1, 1, 1, 1,
0.8583401, -1.498013, 1.141408, 1, 1, 1, 1, 1,
0.8637604, 0.8499779, 1.102108, 1, 1, 1, 1, 1,
0.8682908, 1.116001, 0.1378847, 1, 1, 1, 1, 1,
0.8704444, 0.1590763, 1.652962, 1, 1, 1, 1, 1,
0.8743079, 0.8261652, 0.2042189, 1, 1, 1, 1, 1,
0.8826404, -0.01993474, 1.58208, 1, 1, 1, 1, 1,
0.8906684, 0.2702053, 0.05776541, 1, 1, 1, 1, 1,
0.8934039, -0.6183137, 2.604845, 1, 1, 1, 1, 1,
0.8966416, 0.4694672, 0.4135277, 0, 0, 1, 1, 1,
0.9092402, -0.6645691, 2.616885, 1, 0, 0, 1, 1,
0.9111081, -0.6511861, 0.6322636, 1, 0, 0, 1, 1,
0.9123951, -0.4480942, 3.008029, 1, 0, 0, 1, 1,
0.9127434, 0.3690913, 2.355221, 1, 0, 0, 1, 1,
0.9198484, -1.678592, 3.546209, 1, 0, 0, 1, 1,
0.9246657, -0.7312609, 0.8979716, 0, 0, 0, 1, 1,
0.9304674, 0.5133325, -0.0976055, 0, 0, 0, 1, 1,
0.9307563, 0.449241, 2.875618, 0, 0, 0, 1, 1,
0.9333872, -0.3850156, 1.275904, 0, 0, 0, 1, 1,
0.9347314, -1.564009, 3.201427, 0, 0, 0, 1, 1,
0.9392569, -0.4336489, 0.8951396, 0, 0, 0, 1, 1,
0.9431677, -1.081773, 1.845992, 0, 0, 0, 1, 1,
0.9472942, 0.1944917, 2.219282, 1, 1, 1, 1, 1,
0.9492281, 1.135236, -2.299168, 1, 1, 1, 1, 1,
0.9532481, -0.0186716, 2.993812, 1, 1, 1, 1, 1,
0.9547819, -0.399282, 0.8657713, 1, 1, 1, 1, 1,
0.9554967, 1.011856, 0.08059987, 1, 1, 1, 1, 1,
0.9557198, -1.650295, 2.844084, 1, 1, 1, 1, 1,
0.9716364, 1.822954, 2.528232, 1, 1, 1, 1, 1,
0.973763, 0.7601085, 0.9323694, 1, 1, 1, 1, 1,
0.9779455, 0.4450279, 2.199671, 1, 1, 1, 1, 1,
0.978273, -0.6305416, 0.9394916, 1, 1, 1, 1, 1,
0.9806621, -0.6381791, 2.524976, 1, 1, 1, 1, 1,
0.989114, -0.1954047, 0.3799609, 1, 1, 1, 1, 1,
0.9930576, 0.4605254, -0.6895347, 1, 1, 1, 1, 1,
0.993125, 0.08470088, 1.776166, 1, 1, 1, 1, 1,
0.994879, 1.013093, 0.9051765, 1, 1, 1, 1, 1,
0.9999323, -0.3721411, 3.087605, 0, 0, 1, 1, 1,
1.000029, 1.127815, 0.1823299, 1, 0, 0, 1, 1,
1.0013, 1.069359, 1.602702, 1, 0, 0, 1, 1,
1.002064, 0.03856374, 1.934704, 1, 0, 0, 1, 1,
1.010574, -1.100295, 2.792161, 1, 0, 0, 1, 1,
1.011242, -1.997181, 3.112117, 1, 0, 0, 1, 1,
1.012797, -0.3727209, 3.038436, 0, 0, 0, 1, 1,
1.022384, 0.4986688, -0.3949649, 0, 0, 0, 1, 1,
1.025857, -0.5248166, 0.943908, 0, 0, 0, 1, 1,
1.027512, 0.3690524, -0.01866758, 0, 0, 0, 1, 1,
1.028113, -0.1249344, 1.408741, 0, 0, 0, 1, 1,
1.028777, -0.2284224, 3.737226, 0, 0, 0, 1, 1,
1.039914, -1.725249, 1.285451, 0, 0, 0, 1, 1,
1.043344, -1.397299, 2.572634, 1, 1, 1, 1, 1,
1.044581, -1.70814, 1.675382, 1, 1, 1, 1, 1,
1.047003, -0.03199819, 1.619474, 1, 1, 1, 1, 1,
1.055865, -0.6007922, 2.476106, 1, 1, 1, 1, 1,
1.059451, -1.942684, 3.752377, 1, 1, 1, 1, 1,
1.06019, 0.1059235, 2.196143, 1, 1, 1, 1, 1,
1.061061, 0.1795244, 2.964551, 1, 1, 1, 1, 1,
1.061681, 0.943536, -0.06524891, 1, 1, 1, 1, 1,
1.061783, 0.2788453, 0.1933221, 1, 1, 1, 1, 1,
1.062335, 0.454809, 1.341314, 1, 1, 1, 1, 1,
1.068597, -1.430052, 2.838915, 1, 1, 1, 1, 1,
1.077511, -0.9409712, 1.383472, 1, 1, 1, 1, 1,
1.077601, 0.8661044, 1.184309, 1, 1, 1, 1, 1,
1.078468, 1.966397, 0.3028017, 1, 1, 1, 1, 1,
1.080177, 0.9981021, -0.2509597, 1, 1, 1, 1, 1,
1.083103, -0.2986585, 2.15117, 0, 0, 1, 1, 1,
1.085257, -1.853187, 2.732308, 1, 0, 0, 1, 1,
1.087061, -0.3988462, 2.076081, 1, 0, 0, 1, 1,
1.0876, -0.1587286, 0.932914, 1, 0, 0, 1, 1,
1.099176, -0.448417, 0.9741076, 1, 0, 0, 1, 1,
1.105197, 1.842116, 1.541606, 1, 0, 0, 1, 1,
1.105786, 0.1309716, -0.9007085, 0, 0, 0, 1, 1,
1.106937, -1.538067, 2.376685, 0, 0, 0, 1, 1,
1.107316, 1.993355, 0.6134708, 0, 0, 0, 1, 1,
1.109023, -0.2627026, 1.539528, 0, 0, 0, 1, 1,
1.114871, 0.02898576, 3.001467, 0, 0, 0, 1, 1,
1.127318, -0.2702546, 2.929071, 0, 0, 0, 1, 1,
1.131885, -0.1329451, 1.848247, 0, 0, 0, 1, 1,
1.136395, -0.6842262, 1.620558, 1, 1, 1, 1, 1,
1.13943, 1.415613, 1.266082, 1, 1, 1, 1, 1,
1.14411, 0.2541509, 2.370516, 1, 1, 1, 1, 1,
1.156315, -0.0360144, 0.3776983, 1, 1, 1, 1, 1,
1.172526, 1.046184, -0.2575178, 1, 1, 1, 1, 1,
1.179464, 1.023592, 0.7459072, 1, 1, 1, 1, 1,
1.183085, -0.4512235, 2.562875, 1, 1, 1, 1, 1,
1.190254, -0.7733913, 3.438231, 1, 1, 1, 1, 1,
1.195541, -0.5451434, 2.324338, 1, 1, 1, 1, 1,
1.201176, -0.128047, 1.31275, 1, 1, 1, 1, 1,
1.201251, 0.7799238, 1.878539, 1, 1, 1, 1, 1,
1.201486, 0.216985, 2.112821, 1, 1, 1, 1, 1,
1.219042, 0.09124439, 2.310287, 1, 1, 1, 1, 1,
1.223609, 0.1245313, 1.124915, 1, 1, 1, 1, 1,
1.223976, -1.174823, 2.315079, 1, 1, 1, 1, 1,
1.228176, 0.792454, 0.09789383, 0, 0, 1, 1, 1,
1.237164, -0.9430867, 1.552607, 1, 0, 0, 1, 1,
1.237763, -0.5050059, 1.038233, 1, 0, 0, 1, 1,
1.238732, 0.5700829, 1.477996, 1, 0, 0, 1, 1,
1.244843, 1.246251, 0.04954915, 1, 0, 0, 1, 1,
1.248833, -0.8959501, 1.606451, 1, 0, 0, 1, 1,
1.253599, -1.059849, 3.288874, 0, 0, 0, 1, 1,
1.255202, 1.03737, 1.58002, 0, 0, 0, 1, 1,
1.260914, -0.0822995, 2.500239, 0, 0, 0, 1, 1,
1.263281, 0.06481957, -0.3801676, 0, 0, 0, 1, 1,
1.271172, -0.0549079, 1.411511, 0, 0, 0, 1, 1,
1.275685, 0.04320971, 1.235743, 0, 0, 0, 1, 1,
1.276353, 0.1554218, -0.5241694, 0, 0, 0, 1, 1,
1.284163, -0.09294694, 2.789731, 1, 1, 1, 1, 1,
1.286007, -0.07566354, 0.6160167, 1, 1, 1, 1, 1,
1.28752, 0.6180209, 1.73598, 1, 1, 1, 1, 1,
1.288163, -2.410383, 3.120968, 1, 1, 1, 1, 1,
1.291214, -0.5001248, 2.164735, 1, 1, 1, 1, 1,
1.302324, 0.8248424, 0.5845808, 1, 1, 1, 1, 1,
1.315982, 0.02243802, 2.500166, 1, 1, 1, 1, 1,
1.318363, 0.75652, 1.29378, 1, 1, 1, 1, 1,
1.321921, -1.551737, 4.139932, 1, 1, 1, 1, 1,
1.332884, 0.1897835, 1.133386, 1, 1, 1, 1, 1,
1.351942, -0.2488169, 2.148099, 1, 1, 1, 1, 1,
1.361596, -0.4886609, 2.438803, 1, 1, 1, 1, 1,
1.361776, 1.358319, 0.4751817, 1, 1, 1, 1, 1,
1.36308, -0.3657404, 0.2975099, 1, 1, 1, 1, 1,
1.367246, 0.06776955, 1.515246, 1, 1, 1, 1, 1,
1.368576, 0.05242695, 0.8516656, 0, 0, 1, 1, 1,
1.371092, 0.5928265, 1.541746, 1, 0, 0, 1, 1,
1.377853, -1.330772, 4.081135, 1, 0, 0, 1, 1,
1.386515, -1.161962, 3.642917, 1, 0, 0, 1, 1,
1.396164, 0.8980463, 1.699849, 1, 0, 0, 1, 1,
1.419577, 0.1306436, 2.16826, 1, 0, 0, 1, 1,
1.421044, -1.804767, 2.869813, 0, 0, 0, 1, 1,
1.435879, 1.392661, 1.799791, 0, 0, 0, 1, 1,
1.439442, -0.5414543, 1.40459, 0, 0, 0, 1, 1,
1.464522, -0.005312993, 2.010535, 0, 0, 0, 1, 1,
1.470315, -0.2240858, 2.221756, 0, 0, 0, 1, 1,
1.470366, 0.9442047, 2.24895, 0, 0, 0, 1, 1,
1.471321, 0.1313786, 3.054184, 0, 0, 0, 1, 1,
1.481125, -1.225956, 3.146506, 1, 1, 1, 1, 1,
1.503391, 0.1486891, 1.593321, 1, 1, 1, 1, 1,
1.534122, -0.272576, 1.484328, 1, 1, 1, 1, 1,
1.537891, -1.093817, 0.8450859, 1, 1, 1, 1, 1,
1.55067, 0.333572, 1.486064, 1, 1, 1, 1, 1,
1.568853, -0.05271896, 2.426942, 1, 1, 1, 1, 1,
1.580901, 0.8500243, 0.2694067, 1, 1, 1, 1, 1,
1.584993, -0.5398163, 1.905498, 1, 1, 1, 1, 1,
1.591082, 0.548618, 1.342049, 1, 1, 1, 1, 1,
1.596319, -1.138558, 3.003571, 1, 1, 1, 1, 1,
1.599692, 0.05348711, 0.5549421, 1, 1, 1, 1, 1,
1.61825, -0.8454883, 0.0818489, 1, 1, 1, 1, 1,
1.626246, 1.078767, 1.990179, 1, 1, 1, 1, 1,
1.627569, 0.663581, 0.9062333, 1, 1, 1, 1, 1,
1.637477, 0.07078414, 1.298995, 1, 1, 1, 1, 1,
1.668722, -0.7247268, 2.153356, 0, 0, 1, 1, 1,
1.674465, 0.4211389, 0.8159922, 1, 0, 0, 1, 1,
1.677467, 0.7162766, -1.096229, 1, 0, 0, 1, 1,
1.678586, -2.705135, 2.446411, 1, 0, 0, 1, 1,
1.693111, -1.114844, 1.798459, 1, 0, 0, 1, 1,
1.698987, -1.363222, 0.09333379, 1, 0, 0, 1, 1,
1.699761, -1.949166, 3.214827, 0, 0, 0, 1, 1,
1.709414, -0.6834694, 0.6675556, 0, 0, 0, 1, 1,
1.709602, -0.12165, 2.19545, 0, 0, 0, 1, 1,
1.710651, -2.697667, 3.030599, 0, 0, 0, 1, 1,
1.710806, 0.1149087, 0.1031044, 0, 0, 0, 1, 1,
1.717919, 0.9222953, -0.0436119, 0, 0, 0, 1, 1,
1.725539, -1.24752, 1.204509, 0, 0, 0, 1, 1,
1.763544, 0.6770369, -0.2841755, 1, 1, 1, 1, 1,
1.79656, 0.5539953, -0.1611371, 1, 1, 1, 1, 1,
1.803908, 0.8032748, -0.2873926, 1, 1, 1, 1, 1,
1.810888, 0.551725, 2.595866, 1, 1, 1, 1, 1,
1.83132, -0.1790891, 2.493305, 1, 1, 1, 1, 1,
1.957716, -0.8866619, 4.524072, 1, 1, 1, 1, 1,
1.970372, 0.1951347, 1.241371, 1, 1, 1, 1, 1,
2.041627, 0.605253, 1.719001, 1, 1, 1, 1, 1,
2.042509, 0.4428727, 0.7529381, 1, 1, 1, 1, 1,
2.068457, -0.03538986, 2.58528, 1, 1, 1, 1, 1,
2.076547, 0.3769936, 1.462867, 1, 1, 1, 1, 1,
2.194636, -0.5674493, 2.28283, 1, 1, 1, 1, 1,
2.212942, -0.6919274, 1.655603, 1, 1, 1, 1, 1,
2.252946, 0.6044949, 2.97801, 1, 1, 1, 1, 1,
2.256749, -0.012583, 2.590786, 1, 1, 1, 1, 1,
2.257073, -0.2442224, 1.340028, 0, 0, 1, 1, 1,
2.265102, 0.2674866, 0.7960784, 1, 0, 0, 1, 1,
2.309646, -0.06293384, 0.3019002, 1, 0, 0, 1, 1,
2.310659, -1.144239, 2.440506, 1, 0, 0, 1, 1,
2.344862, -0.615541, 2.087185, 1, 0, 0, 1, 1,
2.354084, -0.1872844, 2.073339, 1, 0, 0, 1, 1,
2.35997, 0.8337869, -0.5476322, 0, 0, 0, 1, 1,
2.376614, 1.691039, 2.358249, 0, 0, 0, 1, 1,
2.383504, -1.348491, 1.198389, 0, 0, 0, 1, 1,
2.426132, -0.4802278, 1.61346, 0, 0, 0, 1, 1,
2.438441, -0.02209814, 1.696672, 0, 0, 0, 1, 1,
2.457893, -1.627699, 1.403419, 0, 0, 0, 1, 1,
2.462856, -0.3159539, 1.492225, 0, 0, 0, 1, 1,
2.509591, -0.4722757, 2.588373, 1, 1, 1, 1, 1,
2.511342, -0.4888296, 2.478678, 1, 1, 1, 1, 1,
2.515032, 0.4386628, 0.3619088, 1, 1, 1, 1, 1,
2.617999, -0.353799, 2.497942, 1, 1, 1, 1, 1,
2.630683, -0.2613112, 2.860715, 1, 1, 1, 1, 1,
2.810447, 0.7142097, 1.26827, 1, 1, 1, 1, 1,
2.873883, -0.6344724, 2.417993, 1, 1, 1, 1, 1
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
var radius = 9.832687;
var distance = 34.5369;
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
mvMatrix.translate( 0.5972023, -0.2145125, 0.4940705 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5369);
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
