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
-3.178415, 0.07072553, 0.112008, 1, 0, 0, 1,
-3.036957, 0.4797968, -1.15933, 1, 0.007843138, 0, 1,
-2.830627, -0.5452094, -5.276181, 1, 0.01176471, 0, 1,
-2.656863, 0.883529, 0.5033424, 1, 0.01960784, 0, 1,
-2.472436, -0.9666679, -1.300663, 1, 0.02352941, 0, 1,
-2.447006, 1.128696, -0.8591549, 1, 0.03137255, 0, 1,
-2.442431, 1.251041, -0.6224617, 1, 0.03529412, 0, 1,
-2.347419, -0.3492863, -0.915208, 1, 0.04313726, 0, 1,
-2.325718, -0.01607898, 0.1643233, 1, 0.04705882, 0, 1,
-2.298454, -0.5937108, -1.806563, 1, 0.05490196, 0, 1,
-2.249324, -0.959263, -3.991233, 1, 0.05882353, 0, 1,
-2.244491, -0.2833265, -0.5161267, 1, 0.06666667, 0, 1,
-2.24325, -0.2367827, -1.952354, 1, 0.07058824, 0, 1,
-2.239807, 2.129351, 0.1692974, 1, 0.07843138, 0, 1,
-2.213504, 2.045069, -1.455242, 1, 0.08235294, 0, 1,
-2.175211, 0.01034709, -1.783442, 1, 0.09019608, 0, 1,
-2.154254, 0.5546832, 0.7163353, 1, 0.09411765, 0, 1,
-2.140035, -1.208974, -2.017393, 1, 0.1019608, 0, 1,
-2.123307, 0.1726109, -1.524047, 1, 0.1098039, 0, 1,
-2.116485, 0.5941371, -1.802648, 1, 0.1137255, 0, 1,
-2.10806, 0.209913, -0.819258, 1, 0.1215686, 0, 1,
-2.107989, 0.6161826, -1.645554, 1, 0.1254902, 0, 1,
-2.049068, -1.099508, -1.700211, 1, 0.1333333, 0, 1,
-2.048929, -1.94955, -2.315619, 1, 0.1372549, 0, 1,
-2.039036, 1.164477, -0.1962338, 1, 0.145098, 0, 1,
-2.002528, 0.8238384, -2.509295, 1, 0.1490196, 0, 1,
-1.999716, -1.066373, -3.003737, 1, 0.1568628, 0, 1,
-1.990508, 0.421804, -1.553615, 1, 0.1607843, 0, 1,
-1.985133, -1.709097, -2.973716, 1, 0.1686275, 0, 1,
-1.983944, 0.1309374, -0.3162324, 1, 0.172549, 0, 1,
-1.954085, 0.7435822, -0.3073555, 1, 0.1803922, 0, 1,
-1.866765, 0.2360241, -2.17896, 1, 0.1843137, 0, 1,
-1.865107, -1.528676, -1.885874, 1, 0.1921569, 0, 1,
-1.843317, 0.2847679, -2.278653, 1, 0.1960784, 0, 1,
-1.836003, -2.282006, -2.585225, 1, 0.2039216, 0, 1,
-1.799303, 0.03734921, -1.449511, 1, 0.2117647, 0, 1,
-1.792327, 0.4655607, -1.203163, 1, 0.2156863, 0, 1,
-1.777377, 1.868438, -1.508203, 1, 0.2235294, 0, 1,
-1.763442, -1.161199, -2.773935, 1, 0.227451, 0, 1,
-1.751414, -1.145197, -1.611769, 1, 0.2352941, 0, 1,
-1.738183, -0.9039026, -0.5848974, 1, 0.2392157, 0, 1,
-1.724376, -0.7995522, -2.940484, 1, 0.2470588, 0, 1,
-1.720741, -0.3274046, -3.100303, 1, 0.2509804, 0, 1,
-1.709421, -2.173506, -4.52738, 1, 0.2588235, 0, 1,
-1.701239, 0.1227297, -1.462582, 1, 0.2627451, 0, 1,
-1.698591, -0.3867586, -1.886002, 1, 0.2705882, 0, 1,
-1.697954, -0.8110198, -2.354743, 1, 0.2745098, 0, 1,
-1.683115, -1.408044, -3.175778, 1, 0.282353, 0, 1,
-1.680156, 1.138828, -0.08214649, 1, 0.2862745, 0, 1,
-1.669975, 2.843686, -1.34705, 1, 0.2941177, 0, 1,
-1.640678, 1.378788, -1.818137, 1, 0.3019608, 0, 1,
-1.605381, 0.1518269, -1.993795, 1, 0.3058824, 0, 1,
-1.600279, 0.8762492, -1.457234, 1, 0.3137255, 0, 1,
-1.593514, -0.3708579, -2.344313, 1, 0.3176471, 0, 1,
-1.575338, 0.8529954, -1.299592, 1, 0.3254902, 0, 1,
-1.574094, -0.09395789, 0.9480574, 1, 0.3294118, 0, 1,
-1.538941, 0.03240968, -1.95332, 1, 0.3372549, 0, 1,
-1.537938, 0.0077078, -1.185414, 1, 0.3411765, 0, 1,
-1.537092, -0.4395882, -0.9234228, 1, 0.3490196, 0, 1,
-1.521496, -0.6070819, -3.136157, 1, 0.3529412, 0, 1,
-1.518898, 2.583429, -0.9201261, 1, 0.3607843, 0, 1,
-1.518101, 0.3228551, -2.332575, 1, 0.3647059, 0, 1,
-1.506886, -0.4146986, -1.79502, 1, 0.372549, 0, 1,
-1.501103, -1.949751, -1.961506, 1, 0.3764706, 0, 1,
-1.499209, 0.0238597, -0.1022166, 1, 0.3843137, 0, 1,
-1.492456, 0.2563515, -1.382119, 1, 0.3882353, 0, 1,
-1.49177, 0.8699536, -1.553061, 1, 0.3960784, 0, 1,
-1.488265, -0.2008829, -2.066509, 1, 0.4039216, 0, 1,
-1.481652, 0.9941165, -1.028517, 1, 0.4078431, 0, 1,
-1.474414, -1.34192, -3.1022, 1, 0.4156863, 0, 1,
-1.472826, -0.8190273, -1.732488, 1, 0.4196078, 0, 1,
-1.460289, 1.052248, -1.427474, 1, 0.427451, 0, 1,
-1.460163, 0.5968173, -2.081611, 1, 0.4313726, 0, 1,
-1.455025, 0.3738175, -0.9039183, 1, 0.4392157, 0, 1,
-1.454372, -0.4206509, -1.640745, 1, 0.4431373, 0, 1,
-1.445126, -0.518439, -0.3363308, 1, 0.4509804, 0, 1,
-1.439405, 0.7861715, -1.66042, 1, 0.454902, 0, 1,
-1.437048, 0.6343404, -2.521832, 1, 0.4627451, 0, 1,
-1.430222, -0.9212617, -2.013284, 1, 0.4666667, 0, 1,
-1.422397, 0.3171369, -0.9795109, 1, 0.4745098, 0, 1,
-1.419683, 1.250413, -0.740252, 1, 0.4784314, 0, 1,
-1.400249, 0.6367632, -3.095227, 1, 0.4862745, 0, 1,
-1.399111, 2.536959, -1.263968, 1, 0.4901961, 0, 1,
-1.389276, 0.5615783, -2.576419, 1, 0.4980392, 0, 1,
-1.386322, 1.169044, -0.7922082, 1, 0.5058824, 0, 1,
-1.385689, -0.9508985, -0.07433415, 1, 0.509804, 0, 1,
-1.382331, 0.5513031, -2.2923, 1, 0.5176471, 0, 1,
-1.381551, -0.3739167, -1.635839, 1, 0.5215687, 0, 1,
-1.373852, -0.104958, -1.300141, 1, 0.5294118, 0, 1,
-1.369955, 0.8098732, 0.5307451, 1, 0.5333334, 0, 1,
-1.366303, -1.502348, -2.743966, 1, 0.5411765, 0, 1,
-1.363787, -0.3317856, -1.236365, 1, 0.5450981, 0, 1,
-1.354125, 0.3383311, -0.8077291, 1, 0.5529412, 0, 1,
-1.353789, 0.5922104, -0.1623967, 1, 0.5568628, 0, 1,
-1.34543, 0.03331219, -1.720758, 1, 0.5647059, 0, 1,
-1.331555, -1.13012, -4.599307, 1, 0.5686275, 0, 1,
-1.32715, 1.300322, 0.263057, 1, 0.5764706, 0, 1,
-1.312068, 0.3736148, -1.294467, 1, 0.5803922, 0, 1,
-1.311822, -0.09462852, -1.773275, 1, 0.5882353, 0, 1,
-1.307967, 1.934835, -1.501004, 1, 0.5921569, 0, 1,
-1.30794, -0.8912338, -1.925694, 1, 0.6, 0, 1,
-1.294964, 0.3328599, -1.113332, 1, 0.6078432, 0, 1,
-1.291528, 0.3673166, -1.890099, 1, 0.6117647, 0, 1,
-1.287524, 0.6955447, -1.342937, 1, 0.6196079, 0, 1,
-1.285744, 0.9141833, 0.2591329, 1, 0.6235294, 0, 1,
-1.278932, 1.794414, -1.557597, 1, 0.6313726, 0, 1,
-1.272318, 0.3460823, -0.3548212, 1, 0.6352941, 0, 1,
-1.246812, -1.11715, -1.813337, 1, 0.6431373, 0, 1,
-1.239556, -0.4092163, -2.201479, 1, 0.6470588, 0, 1,
-1.236824, -0.1304497, -1.841269, 1, 0.654902, 0, 1,
-1.227087, 0.08308943, -2.602298, 1, 0.6588235, 0, 1,
-1.224115, -1.215117, -3.558349, 1, 0.6666667, 0, 1,
-1.214131, -1.063366, -2.649529, 1, 0.6705883, 0, 1,
-1.213115, 0.5912625, -1.124098, 1, 0.6784314, 0, 1,
-1.206242, 1.383736, -0.5521496, 1, 0.682353, 0, 1,
-1.20568, -1.369158, -2.340799, 1, 0.6901961, 0, 1,
-1.191844, 1.878463, 0.2095761, 1, 0.6941177, 0, 1,
-1.186405, -0.6999334, -2.527193, 1, 0.7019608, 0, 1,
-1.184205, 1.773729, -2.1519, 1, 0.7098039, 0, 1,
-1.181742, -0.8072789, -2.115458, 1, 0.7137255, 0, 1,
-1.174891, -0.2509745, -0.7731661, 1, 0.7215686, 0, 1,
-1.172382, 0.487625, -2.139233, 1, 0.7254902, 0, 1,
-1.15671, -1.52698, -1.789421, 1, 0.7333333, 0, 1,
-1.151029, 0.863374, -0.8219064, 1, 0.7372549, 0, 1,
-1.144379, 1.083613, -1.301518, 1, 0.7450981, 0, 1,
-1.136349, -0.2117898, -0.9951586, 1, 0.7490196, 0, 1,
-1.133964, -0.2917614, -1.498625, 1, 0.7568628, 0, 1,
-1.133363, 0.2750274, -3.246315, 1, 0.7607843, 0, 1,
-1.130558, -0.04896008, -2.933473, 1, 0.7686275, 0, 1,
-1.113328, 0.7396923, -1.703979, 1, 0.772549, 0, 1,
-1.110701, -1.848087, -2.161011, 1, 0.7803922, 0, 1,
-1.108901, -1.554158, -1.291368, 1, 0.7843137, 0, 1,
-1.108123, -0.006786703, -0.3021959, 1, 0.7921569, 0, 1,
-1.105155, 0.02634223, 0.4181396, 1, 0.7960784, 0, 1,
-1.096666, -0.1809438, -1.410757, 1, 0.8039216, 0, 1,
-1.094832, 1.468352, -1.556193, 1, 0.8117647, 0, 1,
-1.093897, -0.3422044, -1.59647, 1, 0.8156863, 0, 1,
-1.089062, 1.567982, -0.5857117, 1, 0.8235294, 0, 1,
-1.087774, 0.2511644, -3.779102, 1, 0.827451, 0, 1,
-1.084588, 0.09101622, -0.833535, 1, 0.8352941, 0, 1,
-1.084294, 0.05958749, -2.142504, 1, 0.8392157, 0, 1,
-1.084255, -0.3157038, -2.381263, 1, 0.8470588, 0, 1,
-1.073151, 0.7521597, -2.241873, 1, 0.8509804, 0, 1,
-1.068871, -0.4175512, -2.232737, 1, 0.8588235, 0, 1,
-1.066169, 1.077202, -0.684314, 1, 0.8627451, 0, 1,
-1.065835, -1.155938, -2.406381, 1, 0.8705882, 0, 1,
-1.061067, 0.9942188, -1.837086, 1, 0.8745098, 0, 1,
-1.060895, 0.3945356, -1.870502, 1, 0.8823529, 0, 1,
-1.055673, 0.2926497, -0.4297172, 1, 0.8862745, 0, 1,
-1.05477, 1.544475, -1.130343, 1, 0.8941177, 0, 1,
-1.051853, 0.2684373, -0.7320682, 1, 0.8980392, 0, 1,
-1.039607, -0.7026019, -2.494883, 1, 0.9058824, 0, 1,
-1.036191, 0.01438773, -0.4409165, 1, 0.9137255, 0, 1,
-1.032827, -2.252642, -3.640541, 1, 0.9176471, 0, 1,
-1.0328, 0.4200094, -1.293383, 1, 0.9254902, 0, 1,
-1.019181, -0.5175198, 0.3028075, 1, 0.9294118, 0, 1,
-1.013827, 0.181407, -1.353331, 1, 0.9372549, 0, 1,
-1.012744, 0.9988132, -1.043524, 1, 0.9411765, 0, 1,
-1.010856, 0.5304441, -1.60264, 1, 0.9490196, 0, 1,
-1.008338, 1.63316, 1.263163, 1, 0.9529412, 0, 1,
-0.9987709, 0.2380418, -0.63032, 1, 0.9607843, 0, 1,
-0.9933757, 0.3701763, -0.6387182, 1, 0.9647059, 0, 1,
-0.9921861, 0.5170217, 1.322386, 1, 0.972549, 0, 1,
-0.9833941, 1.541874, -0.2969015, 1, 0.9764706, 0, 1,
-0.9761843, -0.8896835, -1.924952, 1, 0.9843137, 0, 1,
-0.9752008, 0.2390984, -1.036941, 1, 0.9882353, 0, 1,
-0.969718, -0.4395826, -2.18809, 1, 0.9960784, 0, 1,
-0.9685771, 0.3002117, -0.5712456, 0.9960784, 1, 0, 1,
-0.9655573, -0.3576719, -1.643638, 0.9921569, 1, 0, 1,
-0.9583362, -1.561256, -1.799107, 0.9843137, 1, 0, 1,
-0.9563912, 0.09060486, -1.539817, 0.9803922, 1, 0, 1,
-0.950556, 0.05925822, -2.376295, 0.972549, 1, 0, 1,
-0.9497804, 0.1321329, -1.912575, 0.9686275, 1, 0, 1,
-0.9453346, -0.749221, -2.104513, 0.9607843, 1, 0, 1,
-0.9402177, -0.3434901, -2.213567, 0.9568627, 1, 0, 1,
-0.9337163, 0.8476893, -1.002484, 0.9490196, 1, 0, 1,
-0.9335957, -0.3116013, -2.851527, 0.945098, 1, 0, 1,
-0.9269942, -0.3422544, -1.698506, 0.9372549, 1, 0, 1,
-0.924376, 1.810011, -0.2619293, 0.9333333, 1, 0, 1,
-0.9235436, -0.4256548, -2.496188, 0.9254902, 1, 0, 1,
-0.919602, 0.5374789, -1.393593, 0.9215686, 1, 0, 1,
-0.9154321, 2.058861, -0.9859787, 0.9137255, 1, 0, 1,
-0.914575, 1.474024, -0.720583, 0.9098039, 1, 0, 1,
-0.9120191, -2.279366, -1.976894, 0.9019608, 1, 0, 1,
-0.9090074, -0.9936332, -3.119886, 0.8941177, 1, 0, 1,
-0.9087659, 1.0398, -0.650983, 0.8901961, 1, 0, 1,
-0.9034711, -0.9922702, -2.165447, 0.8823529, 1, 0, 1,
-0.902104, -0.8661401, -3.232989, 0.8784314, 1, 0, 1,
-0.8935839, 1.122227, -0.8903208, 0.8705882, 1, 0, 1,
-0.8785596, -1.200213, -1.594514, 0.8666667, 1, 0, 1,
-0.8748014, -0.938579, -2.538214, 0.8588235, 1, 0, 1,
-0.8642814, 2.433928, 0.2873316, 0.854902, 1, 0, 1,
-0.8624631, 0.8003778, -0.744767, 0.8470588, 1, 0, 1,
-0.8563923, -0.8140841, -1.492911, 0.8431373, 1, 0, 1,
-0.8519441, -0.2878713, -2.027638, 0.8352941, 1, 0, 1,
-0.8499842, 2.675678, -0.4919347, 0.8313726, 1, 0, 1,
-0.8473049, 0.5884856, -1.578077, 0.8235294, 1, 0, 1,
-0.8410947, 0.4492183, -2.361895, 0.8196079, 1, 0, 1,
-0.8331188, -0.4410498, -2.204488, 0.8117647, 1, 0, 1,
-0.8303528, 1.198352, -0.8485208, 0.8078431, 1, 0, 1,
-0.8237172, -0.90174, -4.101449, 0.8, 1, 0, 1,
-0.8234039, 0.06148797, -2.841236, 0.7921569, 1, 0, 1,
-0.819676, 1.160833, -0.6579604, 0.7882353, 1, 0, 1,
-0.8187266, 0.2470921, -1.507613, 0.7803922, 1, 0, 1,
-0.8024801, -1.419722, -3.341932, 0.7764706, 1, 0, 1,
-0.8008489, -0.6304544, -1.483608, 0.7686275, 1, 0, 1,
-0.800787, -1.680684, -2.634252, 0.7647059, 1, 0, 1,
-0.7981644, -0.1270711, -1.156847, 0.7568628, 1, 0, 1,
-0.797297, -1.733834, -2.429333, 0.7529412, 1, 0, 1,
-0.795406, 0.7355146, -1.302665, 0.7450981, 1, 0, 1,
-0.794152, -0.0250645, -0.7798594, 0.7411765, 1, 0, 1,
-0.7914053, -2.103334, -1.577015, 0.7333333, 1, 0, 1,
-0.7758058, 0.6838734, -2.373755, 0.7294118, 1, 0, 1,
-0.7723882, -0.8903962, -4.492748, 0.7215686, 1, 0, 1,
-0.7713468, 0.9291737, -0.8200185, 0.7176471, 1, 0, 1,
-0.7698045, -0.4170335, -1.333659, 0.7098039, 1, 0, 1,
-0.766366, 0.1035193, -0.8069871, 0.7058824, 1, 0, 1,
-0.7657853, 0.9985679, -1.930543, 0.6980392, 1, 0, 1,
-0.7585237, 0.3405062, -1.04358, 0.6901961, 1, 0, 1,
-0.7574808, -0.4905587, -2.900598, 0.6862745, 1, 0, 1,
-0.7549831, -0.4221778, -2.539597, 0.6784314, 1, 0, 1,
-0.7532665, -0.5148889, 0.2250327, 0.6745098, 1, 0, 1,
-0.752584, -0.3376541, 0.01055892, 0.6666667, 1, 0, 1,
-0.7507713, 0.255443, 1.087529, 0.6627451, 1, 0, 1,
-0.7488291, -0.9730737, -2.633491, 0.654902, 1, 0, 1,
-0.7486739, -1.184091, -2.52035, 0.6509804, 1, 0, 1,
-0.7484059, -0.4936202, -1.779756, 0.6431373, 1, 0, 1,
-0.74073, 0.0651613, 0.3926857, 0.6392157, 1, 0, 1,
-0.7402163, -0.9486169, -3.272342, 0.6313726, 1, 0, 1,
-0.7341437, 1.296797, 0.4963441, 0.627451, 1, 0, 1,
-0.7337869, -2.476112, -1.251871, 0.6196079, 1, 0, 1,
-0.7329219, 0.2520918, -0.3420508, 0.6156863, 1, 0, 1,
-0.7291499, -0.6325595, -1.331537, 0.6078432, 1, 0, 1,
-0.72914, 0.1893079, -0.5578958, 0.6039216, 1, 0, 1,
-0.7283881, 0.4471726, -1.021855, 0.5960785, 1, 0, 1,
-0.725889, -0.4776048, -2.622231, 0.5882353, 1, 0, 1,
-0.7158499, -0.07079185, -3.028727, 0.5843138, 1, 0, 1,
-0.7109663, 1.640463, -0.5844003, 0.5764706, 1, 0, 1,
-0.7057298, -0.5510461, -2.367034, 0.572549, 1, 0, 1,
-0.6925077, 0.2358848, -1.924806, 0.5647059, 1, 0, 1,
-0.6915462, -0.8073037, -3.121967, 0.5607843, 1, 0, 1,
-0.6889015, -0.375208, -4.291019, 0.5529412, 1, 0, 1,
-0.6864486, -0.388556, -1.979922, 0.5490196, 1, 0, 1,
-0.6835629, 1.56089, -1.365603, 0.5411765, 1, 0, 1,
-0.6811898, 0.6166067, -0.04078644, 0.5372549, 1, 0, 1,
-0.6760975, -1.239885, -2.959827, 0.5294118, 1, 0, 1,
-0.6720994, 0.8696054, -0.7532349, 0.5254902, 1, 0, 1,
-0.6706628, -0.4644243, -3.409952, 0.5176471, 1, 0, 1,
-0.6706491, 0.2731322, -1.785514, 0.5137255, 1, 0, 1,
-0.6677948, 0.4621702, -0.785136, 0.5058824, 1, 0, 1,
-0.666133, 1.08488, -0.2134497, 0.5019608, 1, 0, 1,
-0.6656934, 1.213, -2.144868, 0.4941176, 1, 0, 1,
-0.6591278, 0.5570208, -1.576222, 0.4862745, 1, 0, 1,
-0.6584247, 0.332264, -2.586428, 0.4823529, 1, 0, 1,
-0.6560993, 0.6961686, -2.256765, 0.4745098, 1, 0, 1,
-0.6541076, 0.1409204, -1.531803, 0.4705882, 1, 0, 1,
-0.6489516, 0.7063161, -0.541729, 0.4627451, 1, 0, 1,
-0.642971, -0.2187519, -0.8189155, 0.4588235, 1, 0, 1,
-0.6354097, 0.300378, 0.04654361, 0.4509804, 1, 0, 1,
-0.6315204, 1.085295, 0.1272307, 0.4470588, 1, 0, 1,
-0.6304215, -0.2012314, -4.75915, 0.4392157, 1, 0, 1,
-0.6300728, -2.300771, -4.012642, 0.4352941, 1, 0, 1,
-0.6268693, 0.6184572, -1.854138, 0.427451, 1, 0, 1,
-0.6251079, -0.003812732, -1.011169, 0.4235294, 1, 0, 1,
-0.6238488, 0.05515747, -1.73042, 0.4156863, 1, 0, 1,
-0.623786, -0.4307597, -2.485168, 0.4117647, 1, 0, 1,
-0.618247, 0.1869683, -2.764076, 0.4039216, 1, 0, 1,
-0.6126562, -0.731023, -3.820063, 0.3960784, 1, 0, 1,
-0.6115984, 2.335661, 0.7275332, 0.3921569, 1, 0, 1,
-0.6108385, -0.3027956, -2.436927, 0.3843137, 1, 0, 1,
-0.6012367, -1.339724, -1.676958, 0.3803922, 1, 0, 1,
-0.6010962, 0.8360176, 0.7031426, 0.372549, 1, 0, 1,
-0.596929, 1.275891, -0.3117444, 0.3686275, 1, 0, 1,
-0.5966966, -0.7343854, -1.226744, 0.3607843, 1, 0, 1,
-0.5961343, 0.531073, -0.3991864, 0.3568628, 1, 0, 1,
-0.5958628, -0.152968, -1.909868, 0.3490196, 1, 0, 1,
-0.594252, -0.7653995, -1.254262, 0.345098, 1, 0, 1,
-0.594183, 0.395701, -1.276283, 0.3372549, 1, 0, 1,
-0.5862399, 0.5661235, -1.465627, 0.3333333, 1, 0, 1,
-0.5841885, 0.4093229, -0.6219814, 0.3254902, 1, 0, 1,
-0.5829871, 0.8649384, 0.3240753, 0.3215686, 1, 0, 1,
-0.5803449, 1.457399, -0.2145379, 0.3137255, 1, 0, 1,
-0.5743235, -1.325564, -3.95039, 0.3098039, 1, 0, 1,
-0.5728728, -2.168082, -4.051386, 0.3019608, 1, 0, 1,
-0.5693484, 0.4770829, -1.104162, 0.2941177, 1, 0, 1,
-0.5667371, -0.2334235, -2.353794, 0.2901961, 1, 0, 1,
-0.5621706, -0.7899174, -2.103722, 0.282353, 1, 0, 1,
-0.5617185, -1.204041, -3.678532, 0.2784314, 1, 0, 1,
-0.5568816, 1.901616, -0.08383487, 0.2705882, 1, 0, 1,
-0.5557554, 0.3988852, -1.906255, 0.2666667, 1, 0, 1,
-0.5526419, -0.3482516, -3.88686, 0.2588235, 1, 0, 1,
-0.5491126, 0.06906262, -0.6835951, 0.254902, 1, 0, 1,
-0.5473909, 1.799994, 0.5269548, 0.2470588, 1, 0, 1,
-0.5444575, 0.2748063, -1.672494, 0.2431373, 1, 0, 1,
-0.5416026, 1.258157, -0.6275865, 0.2352941, 1, 0, 1,
-0.5405772, 0.4957114, -0.9408041, 0.2313726, 1, 0, 1,
-0.5386232, -0.7755362, -2.927601, 0.2235294, 1, 0, 1,
-0.5373528, 0.6010743, -0.906895, 0.2196078, 1, 0, 1,
-0.5367736, -0.8421061, -2.555281, 0.2117647, 1, 0, 1,
-0.5358437, 1.960703, -0.8502014, 0.2078431, 1, 0, 1,
-0.5335331, 1.413208, -0.47649, 0.2, 1, 0, 1,
-0.5325354, -0.5899282, -1.880258, 0.1921569, 1, 0, 1,
-0.5290226, -1.192206, -1.125089, 0.1882353, 1, 0, 1,
-0.5232574, 1.879409, 0.3941191, 0.1803922, 1, 0, 1,
-0.5224273, 0.6061921, -0.9864537, 0.1764706, 1, 0, 1,
-0.5193037, -1.217645, -0.88844, 0.1686275, 1, 0, 1,
-0.5178635, 0.7330983, 2.004335, 0.1647059, 1, 0, 1,
-0.5158344, -0.8717493, -4.67065, 0.1568628, 1, 0, 1,
-0.5137767, -0.6989346, -2.002267, 0.1529412, 1, 0, 1,
-0.504357, -0.482466, -3.245687, 0.145098, 1, 0, 1,
-0.5025622, 1.919718, -0.9721633, 0.1411765, 1, 0, 1,
-0.5020521, -0.2091747, -1.38916, 0.1333333, 1, 0, 1,
-0.5001334, 0.4115753, -1.768945, 0.1294118, 1, 0, 1,
-0.4960625, 1.293545, 0.7484936, 0.1215686, 1, 0, 1,
-0.4954526, -0.1128452, -2.171017, 0.1176471, 1, 0, 1,
-0.487362, -0.551253, -3.242776, 0.1098039, 1, 0, 1,
-0.4854987, 0.6617437, -0.9322024, 0.1058824, 1, 0, 1,
-0.4836906, 0.8240961, -0.0504397, 0.09803922, 1, 0, 1,
-0.4831751, 0.4857998, -1.215481, 0.09019608, 1, 0, 1,
-0.4812554, -0.4829169, -1.060375, 0.08627451, 1, 0, 1,
-0.4804817, 1.034724, -0.277417, 0.07843138, 1, 0, 1,
-0.4797596, 0.4338464, -0.1645444, 0.07450981, 1, 0, 1,
-0.4795336, -0.7155144, -4.066188, 0.06666667, 1, 0, 1,
-0.4784269, -2.03967, -2.438038, 0.0627451, 1, 0, 1,
-0.4781813, 0.469533, -0.4044015, 0.05490196, 1, 0, 1,
-0.4761488, -0.5198314, -2.297985, 0.05098039, 1, 0, 1,
-0.4759818, 2.009518, -0.7247972, 0.04313726, 1, 0, 1,
-0.4743755, -0.4482203, -1.449516, 0.03921569, 1, 0, 1,
-0.4738835, -1.131035, -2.969552, 0.03137255, 1, 0, 1,
-0.4717634, 0.2998515, 0.4267954, 0.02745098, 1, 0, 1,
-0.468855, -0.3866177, -1.115914, 0.01960784, 1, 0, 1,
-0.4669168, -1.48459, -2.570223, 0.01568628, 1, 0, 1,
-0.4624957, 1.158717, -0.4563048, 0.007843138, 1, 0, 1,
-0.4615865, 0.7142575, -0.4840465, 0.003921569, 1, 0, 1,
-0.4580774, -1.185068, -2.171237, 0, 1, 0.003921569, 1,
-0.4564485, -1.644113, -1.594592, 0, 1, 0.01176471, 1,
-0.452971, -0.3766388, -1.777858, 0, 1, 0.01568628, 1,
-0.4483894, -0.3678225, -1.684797, 0, 1, 0.02352941, 1,
-0.4447604, -0.3160085, -1.518395, 0, 1, 0.02745098, 1,
-0.442552, -0.7086351, -1.751157, 0, 1, 0.03529412, 1,
-0.4416392, 1.467918, -2.555429, 0, 1, 0.03921569, 1,
-0.4413869, -0.8346486, -3.239918, 0, 1, 0.04705882, 1,
-0.4351647, -0.764643, -2.642541, 0, 1, 0.05098039, 1,
-0.4344365, -0.2958851, -2.505459, 0, 1, 0.05882353, 1,
-0.4282922, 0.5796422, -0.5236918, 0, 1, 0.0627451, 1,
-0.4260614, -0.7672088, -1.35585, 0, 1, 0.07058824, 1,
-0.4259588, 1.898742, -1.186356, 0, 1, 0.07450981, 1,
-0.4257051, 0.06735624, 1.082612, 0, 1, 0.08235294, 1,
-0.4257008, -0.1861594, -1.331596, 0, 1, 0.08627451, 1,
-0.4224175, 0.8642262, 0.1624482, 0, 1, 0.09411765, 1,
-0.4170583, -0.66475, -1.805469, 0, 1, 0.1019608, 1,
-0.4170424, 1.072935, -1.444144, 0, 1, 0.1058824, 1,
-0.4167563, -1.252572, -3.736449, 0, 1, 0.1137255, 1,
-0.4148005, -0.521542, -2.179217, 0, 1, 0.1176471, 1,
-0.4122464, 0.9539036, 0.6816552, 0, 1, 0.1254902, 1,
-0.4095524, 1.220855, 0.8003761, 0, 1, 0.1294118, 1,
-0.4088685, 0.07646901, -0.5881997, 0, 1, 0.1372549, 1,
-0.403914, 0.7353917, 0.5328073, 0, 1, 0.1411765, 1,
-0.4026547, 1.0278, 0.3689803, 0, 1, 0.1490196, 1,
-0.4013337, 0.862715, 0.7941123, 0, 1, 0.1529412, 1,
-0.3998438, 1.297564, 1.060201, 0, 1, 0.1607843, 1,
-0.396583, -0.8446011, -2.258391, 0, 1, 0.1647059, 1,
-0.3912698, 0.9454372, -0.7294184, 0, 1, 0.172549, 1,
-0.387833, -1.231411, -2.423105, 0, 1, 0.1764706, 1,
-0.3838555, -0.9819318, -4.442255, 0, 1, 0.1843137, 1,
-0.383604, -2.019155, -5.045393, 0, 1, 0.1882353, 1,
-0.3835657, 0.4559717, -3.408252, 0, 1, 0.1960784, 1,
-0.3804779, -0.5764629, -2.392724, 0, 1, 0.2039216, 1,
-0.3801571, 0.9383146, -0.3377922, 0, 1, 0.2078431, 1,
-0.3793446, -1.462195, -4.516688, 0, 1, 0.2156863, 1,
-0.3785913, -0.1721647, -1.210379, 0, 1, 0.2196078, 1,
-0.3783355, 0.07705112, -0.5834248, 0, 1, 0.227451, 1,
-0.3763852, -0.7444198, -3.160032, 0, 1, 0.2313726, 1,
-0.3762522, 0.8769015, -0.4715149, 0, 1, 0.2392157, 1,
-0.3755657, 1.817249, -0.6821862, 0, 1, 0.2431373, 1,
-0.3712038, -0.5484358, -1.839061, 0, 1, 0.2509804, 1,
-0.3709029, -0.1892321, -1.299697, 0, 1, 0.254902, 1,
-0.3678088, -1.526755, -2.931351, 0, 1, 0.2627451, 1,
-0.3670856, 0.8514166, 0.7835882, 0, 1, 0.2666667, 1,
-0.3663692, 1.014269, -0.4780345, 0, 1, 0.2745098, 1,
-0.3660496, 0.1209296, -2.400589, 0, 1, 0.2784314, 1,
-0.3609459, 0.6649532, -1.378975, 0, 1, 0.2862745, 1,
-0.3607251, 0.1715165, -1.276721, 0, 1, 0.2901961, 1,
-0.3597759, 1.135123, 0.2546188, 0, 1, 0.2980392, 1,
-0.3596347, -0.9461246, -0.8817793, 0, 1, 0.3058824, 1,
-0.3582448, 0.4216768, 0.1662265, 0, 1, 0.3098039, 1,
-0.3543511, 0.4255071, -0.9500463, 0, 1, 0.3176471, 1,
-0.349758, 1.87631, 0.2012108, 0, 1, 0.3215686, 1,
-0.3491201, -0.3219808, -1.203624, 0, 1, 0.3294118, 1,
-0.3484764, -0.4789695, -3.33746, 0, 1, 0.3333333, 1,
-0.3481686, -1.128701, -2.961214, 0, 1, 0.3411765, 1,
-0.3457367, 1.251622, 0.5931306, 0, 1, 0.345098, 1,
-0.3446212, 1.311006, -0.2288333, 0, 1, 0.3529412, 1,
-0.3429064, -0.06816313, -2.177613, 0, 1, 0.3568628, 1,
-0.3381329, 1.142674, 0.9807418, 0, 1, 0.3647059, 1,
-0.3247776, 0.7811881, -0.7248027, 0, 1, 0.3686275, 1,
-0.3158555, 0.01031289, -3.439777, 0, 1, 0.3764706, 1,
-0.3137553, -1.31966, -4.632339, 0, 1, 0.3803922, 1,
-0.3136032, -1.916268, -3.601628, 0, 1, 0.3882353, 1,
-0.3093971, 0.5326222, -1.791327, 0, 1, 0.3921569, 1,
-0.3068421, -0.4656445, -3.57373, 0, 1, 0.4, 1,
-0.3031943, 0.007294936, -1.572726, 0, 1, 0.4078431, 1,
-0.302755, -0.3519026, -2.814524, 0, 1, 0.4117647, 1,
-0.302662, 0.4973383, 0.9536512, 0, 1, 0.4196078, 1,
-0.2969713, 0.6421037, -2.162428, 0, 1, 0.4235294, 1,
-0.2947885, 1.474076, -1.645073, 0, 1, 0.4313726, 1,
-0.2947882, -0.1984385, -1.352312, 0, 1, 0.4352941, 1,
-0.2892092, -0.2643506, -2.36946, 0, 1, 0.4431373, 1,
-0.2890787, 0.227029, 0.1019702, 0, 1, 0.4470588, 1,
-0.2874673, 0.9696806, -1.760317, 0, 1, 0.454902, 1,
-0.2762745, 1.490261, 1.020581, 0, 1, 0.4588235, 1,
-0.275749, 0.1282768, -0.7913378, 0, 1, 0.4666667, 1,
-0.2747478, -1.0958, -3.017977, 0, 1, 0.4705882, 1,
-0.2725357, 0.4248022, -0.477283, 0, 1, 0.4784314, 1,
-0.2680818, -1.122577, -4.221865, 0, 1, 0.4823529, 1,
-0.2655821, -0.672056, -3.370312, 0, 1, 0.4901961, 1,
-0.265483, 0.5111769, -0.2812541, 0, 1, 0.4941176, 1,
-0.2653071, 0.0006989702, -1.065561, 0, 1, 0.5019608, 1,
-0.2605281, 0.322397, 0.005858307, 0, 1, 0.509804, 1,
-0.2596338, -0.2975667, -1.367038, 0, 1, 0.5137255, 1,
-0.2553797, -0.8431753, -3.026833, 0, 1, 0.5215687, 1,
-0.2546517, -0.3205914, -1.635012, 0, 1, 0.5254902, 1,
-0.2545752, -0.5251294, -2.74672, 0, 1, 0.5333334, 1,
-0.254002, -1.063613, -4.19761, 0, 1, 0.5372549, 1,
-0.2527892, -0.9856127, -3.617299, 0, 1, 0.5450981, 1,
-0.2509344, 0.1984506, -0.6315942, 0, 1, 0.5490196, 1,
-0.2478818, 0.3078426, 0.2029704, 0, 1, 0.5568628, 1,
-0.2474772, 1.093113, 0.03414631, 0, 1, 0.5607843, 1,
-0.2402403, -0.8387993, -2.304815, 0, 1, 0.5686275, 1,
-0.2399516, -0.1673294, -0.7108212, 0, 1, 0.572549, 1,
-0.2356744, 2.119248, 0.6188441, 0, 1, 0.5803922, 1,
-0.232353, 0.5023063, -0.766143, 0, 1, 0.5843138, 1,
-0.2310009, 1.149691, -2.325225, 0, 1, 0.5921569, 1,
-0.2293128, 0.3439788, -0.7644584, 0, 1, 0.5960785, 1,
-0.2265481, -0.734426, -4.225043, 0, 1, 0.6039216, 1,
-0.2259842, -0.4969797, -4.325361, 0, 1, 0.6117647, 1,
-0.2202822, -1.266521, -1.723961, 0, 1, 0.6156863, 1,
-0.2147034, -0.8578147, -2.379342, 0, 1, 0.6235294, 1,
-0.2117437, -0.362717, -2.286804, 0, 1, 0.627451, 1,
-0.2076662, -0.5328577, -2.366402, 0, 1, 0.6352941, 1,
-0.2071596, 0.3739778, -0.852477, 0, 1, 0.6392157, 1,
-0.2065146, 0.3040116, -0.7090704, 0, 1, 0.6470588, 1,
-0.202777, -0.7461283, -3.138431, 0, 1, 0.6509804, 1,
-0.2011842, -1.160091, -2.896369, 0, 1, 0.6588235, 1,
-0.1996066, 0.2082805, -1.845919, 0, 1, 0.6627451, 1,
-0.1952598, 1.743829, 0.395468, 0, 1, 0.6705883, 1,
-0.1931366, -0.8808812, -1.609198, 0, 1, 0.6745098, 1,
-0.1897992, 1.702175, 0.7560851, 0, 1, 0.682353, 1,
-0.1879746, 0.9918656, 0.1041322, 0, 1, 0.6862745, 1,
-0.1868208, -1.452718, -4.009106, 0, 1, 0.6941177, 1,
-0.1858238, 0.2372897, 0.525856, 0, 1, 0.7019608, 1,
-0.1846409, 0.4754741, -0.8367393, 0, 1, 0.7058824, 1,
-0.1838985, 1.997949, -0.6955483, 0, 1, 0.7137255, 1,
-0.1825379, 2.436799, -0.5310439, 0, 1, 0.7176471, 1,
-0.1812254, -0.7501317, -3.369638, 0, 1, 0.7254902, 1,
-0.1716615, -0.4533531, -2.821379, 0, 1, 0.7294118, 1,
-0.1713113, 0.8578361, -1.021698, 0, 1, 0.7372549, 1,
-0.1701902, 1.164594, 0.1702175, 0, 1, 0.7411765, 1,
-0.16935, -2.620326, -2.667074, 0, 1, 0.7490196, 1,
-0.1670028, -0.4620765, -2.419529, 0, 1, 0.7529412, 1,
-0.1668461, 0.5924153, 0.3459179, 0, 1, 0.7607843, 1,
-0.166722, 0.7225529, -0.4153809, 0, 1, 0.7647059, 1,
-0.1662044, -0.3762442, -4.705183, 0, 1, 0.772549, 1,
-0.1656059, -0.6375289, -3.43281, 0, 1, 0.7764706, 1,
-0.1655797, -0.1458679, -2.64059, 0, 1, 0.7843137, 1,
-0.1608428, 0.4975545, 0.4635676, 0, 1, 0.7882353, 1,
-0.1605294, -0.3753921, -4.217911, 0, 1, 0.7960784, 1,
-0.1551439, -0.5895911, -3.380257, 0, 1, 0.8039216, 1,
-0.1528476, 0.2212929, -0.7876952, 0, 1, 0.8078431, 1,
-0.1466804, -0.5286331, -2.458394, 0, 1, 0.8156863, 1,
-0.1455577, -0.8382462, -3.5775, 0, 1, 0.8196079, 1,
-0.1425661, -0.08033999, -2.865598, 0, 1, 0.827451, 1,
-0.1419697, -1.244644, -3.959663, 0, 1, 0.8313726, 1,
-0.1380529, 0.6148657, 0.6589118, 0, 1, 0.8392157, 1,
-0.1360861, 1.67955, -1.556406, 0, 1, 0.8431373, 1,
-0.1343948, 0.5785848, -0.002138177, 0, 1, 0.8509804, 1,
-0.1328964, 0.2602789, 1.420988, 0, 1, 0.854902, 1,
-0.1314705, -0.3834188, -2.715539, 0, 1, 0.8627451, 1,
-0.1301235, 1.75363, -2.008496, 0, 1, 0.8666667, 1,
-0.1267091, 0.9433923, -1.214033, 0, 1, 0.8745098, 1,
-0.1246465, -1.28373, -4.741977, 0, 1, 0.8784314, 1,
-0.1189169, 0.3607628, -1.041314, 0, 1, 0.8862745, 1,
-0.1181273, 1.042064, -1.223571, 0, 1, 0.8901961, 1,
-0.1149854, 0.5503015, 0.8049679, 0, 1, 0.8980392, 1,
-0.1147515, 0.0321301, -0.2671664, 0, 1, 0.9058824, 1,
-0.1113943, 0.4567345, 1.344178, 0, 1, 0.9098039, 1,
-0.1106359, -0.7862006, -3.948708, 0, 1, 0.9176471, 1,
-0.1105088, 0.3867395, 0.1621277, 0, 1, 0.9215686, 1,
-0.1097329, 0.6921342, 1.13782, 0, 1, 0.9294118, 1,
-0.1091821, -0.4478887, -3.10375, 0, 1, 0.9333333, 1,
-0.1078431, -0.9794754, -3.949764, 0, 1, 0.9411765, 1,
-0.1030454, -0.5951333, -2.70678, 0, 1, 0.945098, 1,
-0.1028319, 1.234018, -1.409284, 0, 1, 0.9529412, 1,
-0.1004406, -0.5325008, -2.512969, 0, 1, 0.9568627, 1,
-0.100242, -0.755039, -3.931685, 0, 1, 0.9647059, 1,
-0.09900989, 0.9897638, 0.3306699, 0, 1, 0.9686275, 1,
-0.09547695, 0.4124992, 0.2588054, 0, 1, 0.9764706, 1,
-0.09143084, 1.558439, -1.055167, 0, 1, 0.9803922, 1,
-0.08941215, -0.7800887, -3.215967, 0, 1, 0.9882353, 1,
-0.08533496, 0.06379506, -2.534167, 0, 1, 0.9921569, 1,
-0.0837302, 0.09558635, 1.439501, 0, 1, 1, 1,
-0.07738483, 0.3809385, 0.5773161, 0, 0.9921569, 1, 1,
-0.07515763, -0.2651138, -2.35652, 0, 0.9882353, 1, 1,
-0.07238888, -0.07536283, -1.868992, 0, 0.9803922, 1, 1,
-0.07109695, 0.1913512, 0.001937486, 0, 0.9764706, 1, 1,
-0.06693976, 0.04960261, -0.2872371, 0, 0.9686275, 1, 1,
-0.06509973, -1.569861, -2.485333, 0, 0.9647059, 1, 1,
-0.05643058, 0.4097381, -0.6767648, 0, 0.9568627, 1, 1,
-0.0547562, -0.3794746, -2.203839, 0, 0.9529412, 1, 1,
-0.0486847, -0.08878484, -2.155987, 0, 0.945098, 1, 1,
-0.04835792, -1.224094, -2.601765, 0, 0.9411765, 1, 1,
-0.04743591, -2.289758, -2.595746, 0, 0.9333333, 1, 1,
-0.04459227, -1.177021, -3.019723, 0, 0.9294118, 1, 1,
-0.0427758, 0.1061712, -1.738162, 0, 0.9215686, 1, 1,
-0.04152319, -0.800969, -3.454641, 0, 0.9176471, 1, 1,
-0.04133685, -0.8511386, -2.781817, 0, 0.9098039, 1, 1,
-0.03618298, -1.043552, -3.906067, 0, 0.9058824, 1, 1,
-0.03468763, 0.4161214, -3.145718, 0, 0.8980392, 1, 1,
-0.02882797, -1.190132, -4.052494, 0, 0.8901961, 1, 1,
-0.02851742, 1.753669, -1.223536, 0, 0.8862745, 1, 1,
-0.02815264, -0.116683, -3.142344, 0, 0.8784314, 1, 1,
-0.02793598, 1.91675, -0.3317496, 0, 0.8745098, 1, 1,
-0.02309172, 0.221315, -1.45465, 0, 0.8666667, 1, 1,
-0.02208055, -1.872764, -3.885565, 0, 0.8627451, 1, 1,
-0.01979367, 1.790317, 0.5591464, 0, 0.854902, 1, 1,
-0.01744544, 0.1501778, -0.962566, 0, 0.8509804, 1, 1,
-0.01601945, -0.5791084, -2.328833, 0, 0.8431373, 1, 1,
-0.005164812, -0.2270801, -4.643021, 0, 0.8392157, 1, 1,
-0.002997478, 0.2222962, 2.025584, 0, 0.8313726, 1, 1,
0.002207311, 0.5231487, 0.1606845, 0, 0.827451, 1, 1,
0.00469909, -1.083825, 2.422048, 0, 0.8196079, 1, 1,
0.0053292, 1.442874, 0.5915233, 0, 0.8156863, 1, 1,
0.009295098, 1.465418, -0.4800572, 0, 0.8078431, 1, 1,
0.009839415, 0.3376822, -1.124186, 0, 0.8039216, 1, 1,
0.01340269, -0.3652717, 2.255942, 0, 0.7960784, 1, 1,
0.01367379, -1.186718, 1.667935, 0, 0.7882353, 1, 1,
0.0155083, -0.3616108, 4.483154, 0, 0.7843137, 1, 1,
0.01682412, 0.4447814, -1.685172, 0, 0.7764706, 1, 1,
0.01796457, -0.1717068, 2.99681, 0, 0.772549, 1, 1,
0.0192354, 0.2785681, -0.6620358, 0, 0.7647059, 1, 1,
0.02208238, -0.2245024, 2.068948, 0, 0.7607843, 1, 1,
0.02233198, -0.8102216, 2.102474, 0, 0.7529412, 1, 1,
0.0223856, -0.6167544, 4.083179, 0, 0.7490196, 1, 1,
0.02317212, -1.164138, 2.738315, 0, 0.7411765, 1, 1,
0.02557318, 1.763259, 1.898709, 0, 0.7372549, 1, 1,
0.02995325, -0.3404745, 3.260056, 0, 0.7294118, 1, 1,
0.03281604, 0.3036618, 1.544842, 0, 0.7254902, 1, 1,
0.03287552, -0.9554646, 2.617735, 0, 0.7176471, 1, 1,
0.03709002, 1.602942, 2.061001, 0, 0.7137255, 1, 1,
0.03768513, -0.9520373, 3.612025, 0, 0.7058824, 1, 1,
0.03887304, 0.434786, -1.868453, 0, 0.6980392, 1, 1,
0.0398256, 0.8673988, 0.4240984, 0, 0.6941177, 1, 1,
0.04365556, 0.731, -0.7260554, 0, 0.6862745, 1, 1,
0.04845684, 1.173004, -0.1079898, 0, 0.682353, 1, 1,
0.05097962, -0.09568457, 1.290549, 0, 0.6745098, 1, 1,
0.05581167, -0.1729732, 4.813534, 0, 0.6705883, 1, 1,
0.05722413, -0.6108971, 3.735073, 0, 0.6627451, 1, 1,
0.05810529, -0.7582415, 1.649734, 0, 0.6588235, 1, 1,
0.06108479, -0.3236724, 1.589674, 0, 0.6509804, 1, 1,
0.06110682, 0.5930499, 2.0766, 0, 0.6470588, 1, 1,
0.06390518, -0.3577585, 3.681009, 0, 0.6392157, 1, 1,
0.06937449, -0.9733113, 1.498825, 0, 0.6352941, 1, 1,
0.07104427, -1.083135, 2.261966, 0, 0.627451, 1, 1,
0.07136519, 1.209428, -0.9026551, 0, 0.6235294, 1, 1,
0.07572232, -0.02973579, 2.261446, 0, 0.6156863, 1, 1,
0.07756329, 1.092173, -0.1404127, 0, 0.6117647, 1, 1,
0.08003916, 0.3622014, 1.053996, 0, 0.6039216, 1, 1,
0.08248366, -1.025739, 3.167424, 0, 0.5960785, 1, 1,
0.08495399, 1.820914, -0.6503464, 0, 0.5921569, 1, 1,
0.09086288, 0.4368924, -0.2199635, 0, 0.5843138, 1, 1,
0.09379818, 1.632356, 0.7405809, 0, 0.5803922, 1, 1,
0.09875401, 1.083887, 0.1060671, 0, 0.572549, 1, 1,
0.09980119, -0.9527078, 2.111514, 0, 0.5686275, 1, 1,
0.1018443, 2.205544, 0.295331, 0, 0.5607843, 1, 1,
0.1135499, 0.2076993, 0.3241398, 0, 0.5568628, 1, 1,
0.1158473, 1.628362, -0.8751068, 0, 0.5490196, 1, 1,
0.1186965, -0.1681256, 3.391536, 0, 0.5450981, 1, 1,
0.1200668, -1.153185, 3.614869, 0, 0.5372549, 1, 1,
0.1202563, 0.2149323, -0.1561168, 0, 0.5333334, 1, 1,
0.1217839, 1.028418, 2.04985, 0, 0.5254902, 1, 1,
0.1255323, -0.2502601, 2.96814, 0, 0.5215687, 1, 1,
0.1300068, 0.1095453, 0.5336227, 0, 0.5137255, 1, 1,
0.1320477, 1.624584, 0.6667614, 0, 0.509804, 1, 1,
0.1347675, -0.1589494, 1.740603, 0, 0.5019608, 1, 1,
0.136557, 0.2044299, 2.273217, 0, 0.4941176, 1, 1,
0.1402489, -0.7244698, 2.983929, 0, 0.4901961, 1, 1,
0.1406429, 1.027131, -0.6603254, 0, 0.4823529, 1, 1,
0.1407196, -0.9391766, 2.409471, 0, 0.4784314, 1, 1,
0.1439824, -0.4319638, 2.972624, 0, 0.4705882, 1, 1,
0.1455379, -2.041154, 2.825028, 0, 0.4666667, 1, 1,
0.1502243, 1.267623, 0.6304996, 0, 0.4588235, 1, 1,
0.1520299, -0.7764005, 3.236351, 0, 0.454902, 1, 1,
0.1556562, -0.4327759, 2.583202, 0, 0.4470588, 1, 1,
0.1560644, 0.3162512, -0.6530201, 0, 0.4431373, 1, 1,
0.1561719, 0.1616104, 1.316488, 0, 0.4352941, 1, 1,
0.1576837, 1.587457, 1.382231, 0, 0.4313726, 1, 1,
0.1584568, -0.7507178, 2.196889, 0, 0.4235294, 1, 1,
0.1622516, 0.2147407, 2.329788, 0, 0.4196078, 1, 1,
0.1631508, 0.2270428, 0.1172712, 0, 0.4117647, 1, 1,
0.1652352, 0.00848671, 1.621041, 0, 0.4078431, 1, 1,
0.1685338, 0.9950594, 1.385274, 0, 0.4, 1, 1,
0.1689175, -0.3919514, 2.318718, 0, 0.3921569, 1, 1,
0.1757137, 0.53799, 1.58401, 0, 0.3882353, 1, 1,
0.1784524, -1.371732, 4.809903, 0, 0.3803922, 1, 1,
0.1811255, 1.378363, 1.195419, 0, 0.3764706, 1, 1,
0.1812721, -0.8888893, 1.766632, 0, 0.3686275, 1, 1,
0.1890217, -0.3648072, 2.501133, 0, 0.3647059, 1, 1,
0.1901103, -1.116527, 3.689842, 0, 0.3568628, 1, 1,
0.1902817, 0.8913345, 1.734903, 0, 0.3529412, 1, 1,
0.1910314, 0.1557056, 0.4660977, 0, 0.345098, 1, 1,
0.1911357, -1.630371, 1.958966, 0, 0.3411765, 1, 1,
0.1937525, 0.4795436, 0.1065725, 0, 0.3333333, 1, 1,
0.1981663, -1.101872, 4.750546, 0, 0.3294118, 1, 1,
0.1996202, -0.1163478, 0.6576648, 0, 0.3215686, 1, 1,
0.2037826, 0.03126909, 0.7832934, 0, 0.3176471, 1, 1,
0.2045588, -1.245332, 2.049609, 0, 0.3098039, 1, 1,
0.2061124, 0.7900698, 0.6908366, 0, 0.3058824, 1, 1,
0.2063497, 0.08392683, 0.7349235, 0, 0.2980392, 1, 1,
0.2106271, 2.581181, 0.5924707, 0, 0.2901961, 1, 1,
0.2151109, -0.8755661, 2.0629, 0, 0.2862745, 1, 1,
0.2204503, -0.07996, 1.880609, 0, 0.2784314, 1, 1,
0.2239405, 0.7738553, 1.14958, 0, 0.2745098, 1, 1,
0.2303582, -0.7905931, 3.100826, 0, 0.2666667, 1, 1,
0.2375439, 0.7957637, 2.177807, 0, 0.2627451, 1, 1,
0.2378517, -0.9813437, 4.341654, 0, 0.254902, 1, 1,
0.2440389, 1.283574, 0.2864794, 0, 0.2509804, 1, 1,
0.2449038, -0.3499546, 2.034106, 0, 0.2431373, 1, 1,
0.2450177, -0.1468469, 1.286031, 0, 0.2392157, 1, 1,
0.245516, -0.6930444, 1.965709, 0, 0.2313726, 1, 1,
0.2479507, 1.313168, -0.2702965, 0, 0.227451, 1, 1,
0.2545353, 0.1771848, -0.4830098, 0, 0.2196078, 1, 1,
0.2562611, -0.3532954, 3.99967, 0, 0.2156863, 1, 1,
0.2570718, -0.1479465, 2.715492, 0, 0.2078431, 1, 1,
0.2583254, -0.1943773, 1.383984, 0, 0.2039216, 1, 1,
0.2606808, -1.774089, 5.194926, 0, 0.1960784, 1, 1,
0.2610601, -1.451864, 3.823149, 0, 0.1882353, 1, 1,
0.2644803, 0.3446955, 0.2258332, 0, 0.1843137, 1, 1,
0.2647694, 0.3937062, -0.1563105, 0, 0.1764706, 1, 1,
0.2675051, -1.423632, 1.343725, 0, 0.172549, 1, 1,
0.2714091, 0.09655652, 2.360487, 0, 0.1647059, 1, 1,
0.2735174, -0.1075881, 1.448268, 0, 0.1607843, 1, 1,
0.2767545, -1.085181, 2.273457, 0, 0.1529412, 1, 1,
0.277453, -0.6199825, 1.907688, 0, 0.1490196, 1, 1,
0.2775424, 0.2596092, -0.4856816, 0, 0.1411765, 1, 1,
0.2817764, 1.480498, -0.3168834, 0, 0.1372549, 1, 1,
0.2892489, -1.116813, 4.845191, 0, 0.1294118, 1, 1,
0.2907152, 1.117414, 0.1023637, 0, 0.1254902, 1, 1,
0.3021756, -1.207222, 2.894129, 0, 0.1176471, 1, 1,
0.3073516, -1.13179, 2.90963, 0, 0.1137255, 1, 1,
0.3088095, 0.8736092, -0.1566201, 0, 0.1058824, 1, 1,
0.3124253, 0.1182311, 3.089062, 0, 0.09803922, 1, 1,
0.3197958, 0.1620794, 1.191287, 0, 0.09411765, 1, 1,
0.32032, 0.8251134, 1.801566, 0, 0.08627451, 1, 1,
0.3206279, -0.04574497, 2.396862, 0, 0.08235294, 1, 1,
0.3214909, -1.759558, 3.15268, 0, 0.07450981, 1, 1,
0.3298344, 0.05662511, -0.1650999, 0, 0.07058824, 1, 1,
0.3299651, -0.3551719, 1.818479, 0, 0.0627451, 1, 1,
0.3315902, 0.2003252, 0.1055223, 0, 0.05882353, 1, 1,
0.3340276, 1.847362, 0.7226618, 0, 0.05098039, 1, 1,
0.3371266, -1.727771, 2.509799, 0, 0.04705882, 1, 1,
0.3408163, -0.984446, 2.365385, 0, 0.03921569, 1, 1,
0.3432077, -0.1864718, 2.246762, 0, 0.03529412, 1, 1,
0.3459717, 0.103909, 0.4801308, 0, 0.02745098, 1, 1,
0.3463277, 0.4651064, 2.763817, 0, 0.02352941, 1, 1,
0.3485729, -1.1645, 3.574663, 0, 0.01568628, 1, 1,
0.351171, 0.6629188, 1.773774, 0, 0.01176471, 1, 1,
0.3520775, 0.4376048, 1.636452, 0, 0.003921569, 1, 1,
0.3530374, 0.486032, 0.9102997, 0.003921569, 0, 1, 1,
0.3546774, 0.5804689, 0.3694287, 0.007843138, 0, 1, 1,
0.3553987, 0.5513713, 1.671323, 0.01568628, 0, 1, 1,
0.3653274, -2.002986, 4.00019, 0.01960784, 0, 1, 1,
0.3707703, -0.4467281, 1.51487, 0.02745098, 0, 1, 1,
0.377991, -1.262377, 5.136142, 0.03137255, 0, 1, 1,
0.37908, -0.619203, 2.251239, 0.03921569, 0, 1, 1,
0.3855188, 0.7392232, 0.140782, 0.04313726, 0, 1, 1,
0.3925472, -1.105814, 2.784051, 0.05098039, 0, 1, 1,
0.3980743, 0.9459294, 1.997646, 0.05490196, 0, 1, 1,
0.4053308, 1.191513, -0.2220261, 0.0627451, 0, 1, 1,
0.4060073, -0.2164046, 1.302645, 0.06666667, 0, 1, 1,
0.4099677, 0.9215627, -0.1320382, 0.07450981, 0, 1, 1,
0.410608, 0.05440889, 1.660434, 0.07843138, 0, 1, 1,
0.4141019, -0.0350613, 1.898181, 0.08627451, 0, 1, 1,
0.4187948, -0.3483458, 1.796953, 0.09019608, 0, 1, 1,
0.4194579, 0.01097243, 2.289, 0.09803922, 0, 1, 1,
0.4214809, 1.458918, -1.396613, 0.1058824, 0, 1, 1,
0.4225408, 0.04105389, 2.372825, 0.1098039, 0, 1, 1,
0.4340972, 1.34402, -1.007636, 0.1176471, 0, 1, 1,
0.435239, -0.592858, 2.186961, 0.1215686, 0, 1, 1,
0.4357612, 0.5718507, 0.5462398, 0.1294118, 0, 1, 1,
0.4423838, 0.5538229, 0.5400087, 0.1333333, 0, 1, 1,
0.446968, -1.809029, 0.4892614, 0.1411765, 0, 1, 1,
0.4492867, 0.5000174, 0.9599551, 0.145098, 0, 1, 1,
0.4548514, 0.4137795, 1.896424, 0.1529412, 0, 1, 1,
0.465071, 0.729377, -0.659202, 0.1568628, 0, 1, 1,
0.4691623, 0.5390118, 2.335889, 0.1647059, 0, 1, 1,
0.4733502, -1.136483, 3.167416, 0.1686275, 0, 1, 1,
0.4736651, 1.189473, 0.7767428, 0.1764706, 0, 1, 1,
0.481785, 0.04113542, 1.839822, 0.1803922, 0, 1, 1,
0.4832103, -0.4288761, 2.093109, 0.1882353, 0, 1, 1,
0.4840043, -1.639837, 2.394612, 0.1921569, 0, 1, 1,
0.4865131, -0.12703, 3.534839, 0.2, 0, 1, 1,
0.4869525, 0.0392665, 0.4289045, 0.2078431, 0, 1, 1,
0.4875852, -1.782917, 3.693406, 0.2117647, 0, 1, 1,
0.4944426, 2.216457, 0.4378, 0.2196078, 0, 1, 1,
0.4963105, 0.3771971, 1.223436, 0.2235294, 0, 1, 1,
0.4973031, -0.3850571, 2.407624, 0.2313726, 0, 1, 1,
0.4977381, 0.5756734, 0.08966656, 0.2352941, 0, 1, 1,
0.5100299, 0.1111516, 2.037258, 0.2431373, 0, 1, 1,
0.5160172, -0.05841411, 1.181692, 0.2470588, 0, 1, 1,
0.5163151, -0.05287703, 1.873481, 0.254902, 0, 1, 1,
0.5197138, 1.121138, 0.8108861, 0.2588235, 0, 1, 1,
0.5217189, -3.339944, 1.70744, 0.2666667, 0, 1, 1,
0.5226921, -1.606808, 2.670139, 0.2705882, 0, 1, 1,
0.5233905, 0.2570752, 0.6315202, 0.2784314, 0, 1, 1,
0.5250165, 0.3709853, 0.7739841, 0.282353, 0, 1, 1,
0.5364698, -1.569399, 1.909234, 0.2901961, 0, 1, 1,
0.5371361, -1.209583, 3.15928, 0.2941177, 0, 1, 1,
0.5396569, -0.3064193, 2.290963, 0.3019608, 0, 1, 1,
0.5415327, 0.1029258, 2.438294, 0.3098039, 0, 1, 1,
0.5435602, -0.6615367, 3.513029, 0.3137255, 0, 1, 1,
0.5509846, 0.2105566, 1.887329, 0.3215686, 0, 1, 1,
0.5536351, -2.020092, 2.61671, 0.3254902, 0, 1, 1,
0.5544558, 0.8743225, 1.369801, 0.3333333, 0, 1, 1,
0.5595474, -1.321344, 3.190652, 0.3372549, 0, 1, 1,
0.5597741, 1.771275, 0.2654111, 0.345098, 0, 1, 1,
0.5613202, -0.6452059, 1.629367, 0.3490196, 0, 1, 1,
0.5628853, 1.34758, -0.2692885, 0.3568628, 0, 1, 1,
0.5667756, 0.3205039, 0.3610573, 0.3607843, 0, 1, 1,
0.5673102, 0.3667039, 2.764101, 0.3686275, 0, 1, 1,
0.568768, 0.1309679, 0.9921196, 0.372549, 0, 1, 1,
0.5701539, -0.9603632, 0.8349876, 0.3803922, 0, 1, 1,
0.5710215, -0.7830462, 1.535604, 0.3843137, 0, 1, 1,
0.5745268, 1.187005, 0.1199555, 0.3921569, 0, 1, 1,
0.5804055, 0.5499768, 0.8404835, 0.3960784, 0, 1, 1,
0.5902747, 1.331578, 1.440314, 0.4039216, 0, 1, 1,
0.5914208, 0.7668272, 1.015135, 0.4117647, 0, 1, 1,
0.5920916, 0.138225, 0.8380791, 0.4156863, 0, 1, 1,
0.5959686, 0.4221895, 1.316413, 0.4235294, 0, 1, 1,
0.59694, -2.180502, 2.81277, 0.427451, 0, 1, 1,
0.6025736, -0.5617666, 3.204165, 0.4352941, 0, 1, 1,
0.6100267, 0.5063969, 0.3076215, 0.4392157, 0, 1, 1,
0.6110049, 0.6943779, 0.91104, 0.4470588, 0, 1, 1,
0.6149189, -0.3621908, 1.313112, 0.4509804, 0, 1, 1,
0.6185184, -1.46147, 2.514848, 0.4588235, 0, 1, 1,
0.6251336, -0.5238219, 1.323396, 0.4627451, 0, 1, 1,
0.6355729, 1.021314, 1.831019, 0.4705882, 0, 1, 1,
0.6456711, 1.63971, -1.494496, 0.4745098, 0, 1, 1,
0.6498111, -2.133673, 2.705823, 0.4823529, 0, 1, 1,
0.6584305, 0.7875347, 1.385118, 0.4862745, 0, 1, 1,
0.6601751, -0.4483827, 0.6058618, 0.4941176, 0, 1, 1,
0.6631759, -0.224394, 0.6104577, 0.5019608, 0, 1, 1,
0.6648275, 0.3382963, 1.941522, 0.5058824, 0, 1, 1,
0.6751536, -2.600037, 1.808019, 0.5137255, 0, 1, 1,
0.6776465, -0.371535, 0.2606483, 0.5176471, 0, 1, 1,
0.6882247, -1.764713, 1.867728, 0.5254902, 0, 1, 1,
0.694919, 0.9617528, 0.5383964, 0.5294118, 0, 1, 1,
0.6992586, -1.161564, 1.242885, 0.5372549, 0, 1, 1,
0.6996064, -1.34551, 2.510536, 0.5411765, 0, 1, 1,
0.7010652, -0.6574711, 2.027073, 0.5490196, 0, 1, 1,
0.7058886, 1.320678, 0.569025, 0.5529412, 0, 1, 1,
0.7077938, -0.7218537, 2.040864, 0.5607843, 0, 1, 1,
0.7101078, -0.1389627, 1.98039, 0.5647059, 0, 1, 1,
0.7125832, 0.4860055, 0.9017141, 0.572549, 0, 1, 1,
0.7139925, -0.5256507, 1.317547, 0.5764706, 0, 1, 1,
0.7171444, 1.561511, -0.5978932, 0.5843138, 0, 1, 1,
0.7211617, -1.216725, 3.869375, 0.5882353, 0, 1, 1,
0.7256761, -2.347294, 3.530039, 0.5960785, 0, 1, 1,
0.7292644, -1.345673, 1.724507, 0.6039216, 0, 1, 1,
0.7317635, 0.2006679, 2.502075, 0.6078432, 0, 1, 1,
0.7363251, -0.03459617, 1.088083, 0.6156863, 0, 1, 1,
0.7379138, -2.293199, 3.39496, 0.6196079, 0, 1, 1,
0.7399145, -0.2580939, 2.153894, 0.627451, 0, 1, 1,
0.7401005, 1.24947, -0.8524951, 0.6313726, 0, 1, 1,
0.7455438, -2.338221, 3.003443, 0.6392157, 0, 1, 1,
0.7461511, 1.27629, 0.1304465, 0.6431373, 0, 1, 1,
0.7499022, -1.182446, 1.761163, 0.6509804, 0, 1, 1,
0.7595787, -0.5646687, 2.612866, 0.654902, 0, 1, 1,
0.760331, -1.227599, 2.144374, 0.6627451, 0, 1, 1,
0.7646632, -0.5540352, 3.347478, 0.6666667, 0, 1, 1,
0.7711524, 1.23092, 1.977064, 0.6745098, 0, 1, 1,
0.7783785, 1.671756, 0.2227842, 0.6784314, 0, 1, 1,
0.7821181, -0.5266941, 2.863735, 0.6862745, 0, 1, 1,
0.7838601, -0.1988541, 2.280855, 0.6901961, 0, 1, 1,
0.7840752, -1.403441, 2.305316, 0.6980392, 0, 1, 1,
0.7926433, 1.300999, 1.562323, 0.7058824, 0, 1, 1,
0.7935662, 0.4324882, 1.30737, 0.7098039, 0, 1, 1,
0.8008091, -0.5455085, 1.254604, 0.7176471, 0, 1, 1,
0.8063864, -1.088951, 3.16914, 0.7215686, 0, 1, 1,
0.8092051, 0.01543878, 2.055926, 0.7294118, 0, 1, 1,
0.8280334, 0.0626452, -0.2918157, 0.7333333, 0, 1, 1,
0.8323938, -0.8963771, 2.851056, 0.7411765, 0, 1, 1,
0.8331149, -1.119244, 3.369859, 0.7450981, 0, 1, 1,
0.8390321, 0.3734554, 1.894675, 0.7529412, 0, 1, 1,
0.8393943, -0.9772859, 1.710285, 0.7568628, 0, 1, 1,
0.8422037, 1.960862, -0.4714131, 0.7647059, 0, 1, 1,
0.8556038, 0.9138021, 0.3298669, 0.7686275, 0, 1, 1,
0.8625539, -0.1541574, 2.758284, 0.7764706, 0, 1, 1,
0.863641, 0.857483, 1.187453, 0.7803922, 0, 1, 1,
0.8672287, 0.8790997, 0.4738287, 0.7882353, 0, 1, 1,
0.869249, -0.2095703, 1.30011, 0.7921569, 0, 1, 1,
0.8699586, -0.2672668, 1.346567, 0.8, 0, 1, 1,
0.8831714, 0.01679814, 1.540357, 0.8078431, 0, 1, 1,
0.8838922, -0.8706788, 3.740457, 0.8117647, 0, 1, 1,
0.8841732, 1.206968, 0.5070629, 0.8196079, 0, 1, 1,
0.8845165, 2.783208, -0.8443961, 0.8235294, 0, 1, 1,
0.8862953, -0.9028928, 2.716274, 0.8313726, 0, 1, 1,
0.8943729, -0.6106718, 2.467087, 0.8352941, 0, 1, 1,
0.8991592, -0.4858594, 0.4785589, 0.8431373, 0, 1, 1,
0.9020588, -0.7630724, 2.882484, 0.8470588, 0, 1, 1,
0.9084103, -1.947836, 2.875203, 0.854902, 0, 1, 1,
0.9155889, -0.5941096, 2.678197, 0.8588235, 0, 1, 1,
0.9203697, 0.01172383, 1.99345, 0.8666667, 0, 1, 1,
0.9244649, -0.5958156, 2.237437, 0.8705882, 0, 1, 1,
0.9272899, 0.8703896, 1.204439, 0.8784314, 0, 1, 1,
0.9282179, 0.6206866, 1.503297, 0.8823529, 0, 1, 1,
0.9345995, -0.6235073, 2.613855, 0.8901961, 0, 1, 1,
0.937556, 0.2732155, 2.296365, 0.8941177, 0, 1, 1,
0.9385673, 0.7098132, 2.702362, 0.9019608, 0, 1, 1,
0.9411784, -2.022824, 1.680706, 0.9098039, 0, 1, 1,
0.9420453, -0.1046149, 1.242592, 0.9137255, 0, 1, 1,
0.9436136, -0.146933, 0.2961313, 0.9215686, 0, 1, 1,
0.9458869, -1.890432, 3.464549, 0.9254902, 0, 1, 1,
0.9518705, -0.4514813, 3.408072, 0.9333333, 0, 1, 1,
0.9546348, 2.196393, 1.589023, 0.9372549, 0, 1, 1,
0.969848, -0.1576967, -0.910194, 0.945098, 0, 1, 1,
0.9813363, -0.09876662, -0.1426934, 0.9490196, 0, 1, 1,
0.9817534, 0.6460685, -0.1226261, 0.9568627, 0, 1, 1,
0.982783, -0.4318526, 0.991363, 0.9607843, 0, 1, 1,
0.9829557, 0.3620326, 2.426585, 0.9686275, 0, 1, 1,
0.9837479, -0.7844495, 3.758068, 0.972549, 0, 1, 1,
0.985194, 1.084228, 1.648066, 0.9803922, 0, 1, 1,
0.988298, -0.5449623, 1.986147, 0.9843137, 0, 1, 1,
0.9982119, -0.194019, -0.08617893, 0.9921569, 0, 1, 1,
1.003279, 1.121724, 1.637693, 0.9960784, 0, 1, 1,
1.013792, 1.550114, -0.8463175, 1, 0, 0.9960784, 1,
1.018197, 1.199926, 0.132968, 1, 0, 0.9882353, 1,
1.022993, 0.8188176, -0.06664796, 1, 0, 0.9843137, 1,
1.039164, -0.7018347, 2.94495, 1, 0, 0.9764706, 1,
1.042922, 0.8394791, 0.786597, 1, 0, 0.972549, 1,
1.045628, -0.9763169, 2.773868, 1, 0, 0.9647059, 1,
1.048766, 0.6791983, 1.820832, 1, 0, 0.9607843, 1,
1.069919, -0.1909296, 1.847183, 1, 0, 0.9529412, 1,
1.071925, -0.9816301, 0.6259918, 1, 0, 0.9490196, 1,
1.072328, -2.135231, 2.327729, 1, 0, 0.9411765, 1,
1.072466, -0.4144405, 1.121447, 1, 0, 0.9372549, 1,
1.073491, -0.5734164, 2.274405, 1, 0, 0.9294118, 1,
1.080632, -0.9782594, 2.515447, 1, 0, 0.9254902, 1,
1.082659, -1.50906, 2.322586, 1, 0, 0.9176471, 1,
1.083867, -0.8184596, 2.867834, 1, 0, 0.9137255, 1,
1.096071, -0.7168221, 2.373493, 1, 0, 0.9058824, 1,
1.105165, 0.8834293, -1.287622, 1, 0, 0.9019608, 1,
1.108873, 0.01351178, 2.507249, 1, 0, 0.8941177, 1,
1.112589, -0.07915014, 3.001909, 1, 0, 0.8862745, 1,
1.113901, 2.389313, 0.4939138, 1, 0, 0.8823529, 1,
1.113915, -0.1398271, -0.9896985, 1, 0, 0.8745098, 1,
1.114831, -0.649344, 0.6573654, 1, 0, 0.8705882, 1,
1.116292, -2.649042, 1.502403, 1, 0, 0.8627451, 1,
1.117093, -0.3982157, 1.782022, 1, 0, 0.8588235, 1,
1.145047, -1.412762, 2.273415, 1, 0, 0.8509804, 1,
1.14682, 0.3746746, -1.227974, 1, 0, 0.8470588, 1,
1.152829, -0.1576106, 0.8878209, 1, 0, 0.8392157, 1,
1.153373, -0.3903853, 2.630151, 1, 0, 0.8352941, 1,
1.15769, 0.7380481, -0.02365798, 1, 0, 0.827451, 1,
1.157937, -1.188348, 2.662704, 1, 0, 0.8235294, 1,
1.160413, -0.4851427, 2.514242, 1, 0, 0.8156863, 1,
1.164008, 0.1542828, 1.858284, 1, 0, 0.8117647, 1,
1.166334, -0.3401145, 1.398187, 1, 0, 0.8039216, 1,
1.173077, 0.8396791, -0.01692674, 1, 0, 0.7960784, 1,
1.179459, -0.3166316, 0.9933835, 1, 0, 0.7921569, 1,
1.180619, -0.02350781, 0.02113172, 1, 0, 0.7843137, 1,
1.192732, -0.6617129, 1.451343, 1, 0, 0.7803922, 1,
1.193484, -1.548049, 1.465677, 1, 0, 0.772549, 1,
1.197589, -1.863801, 3.677962, 1, 0, 0.7686275, 1,
1.200226, -0.1914069, 2.048492, 1, 0, 0.7607843, 1,
1.217213, -0.4563045, 3.351008, 1, 0, 0.7568628, 1,
1.227054, -0.420645, 1.624295, 1, 0, 0.7490196, 1,
1.230985, 1.1656, 2.116229, 1, 0, 0.7450981, 1,
1.233399, -0.08133479, -0.4191097, 1, 0, 0.7372549, 1,
1.238031, -0.03040638, 2.7172, 1, 0, 0.7333333, 1,
1.256865, 1.055489, 1.222494, 1, 0, 0.7254902, 1,
1.256949, -0.05877512, 2.256883, 1, 0, 0.7215686, 1,
1.258235, -0.2640205, 2.08673, 1, 0, 0.7137255, 1,
1.269795, -0.5568013, 0.8217327, 1, 0, 0.7098039, 1,
1.271896, -0.5147341, 2.871294, 1, 0, 0.7019608, 1,
1.273325, 0.58205, 2.342332, 1, 0, 0.6941177, 1,
1.274929, -0.7700818, 2.485802, 1, 0, 0.6901961, 1,
1.281408, 0.09135314, 1.765132, 1, 0, 0.682353, 1,
1.291728, 0.9147557, 2.277387, 1, 0, 0.6784314, 1,
1.299895, 0.440682, -0.6015139, 1, 0, 0.6705883, 1,
1.303695, 0.1238532, -0.03538963, 1, 0, 0.6666667, 1,
1.314062, 0.3272296, 1.994553, 1, 0, 0.6588235, 1,
1.314247, 0.0001135551, 2.530056, 1, 0, 0.654902, 1,
1.317449, 2.084545, 1.055733, 1, 0, 0.6470588, 1,
1.320271, 1.67458, -0.6246, 1, 0, 0.6431373, 1,
1.320323, 0.5851553, 1.317367, 1, 0, 0.6352941, 1,
1.320464, -0.02566029, 1.616577, 1, 0, 0.6313726, 1,
1.320998, 1.241171, 1.54411, 1, 0, 0.6235294, 1,
1.32206, -0.8956625, 1.527021, 1, 0, 0.6196079, 1,
1.326679, 0.9880205, -0.1281598, 1, 0, 0.6117647, 1,
1.32697, -0.03773893, 2.072427, 1, 0, 0.6078432, 1,
1.337525, -1.512709, 2.256662, 1, 0, 0.6, 1,
1.341974, -0.9126303, 1.207512, 1, 0, 0.5921569, 1,
1.346859, 0.3465905, 1.927391, 1, 0, 0.5882353, 1,
1.348998, -0.9694524, 2.477007, 1, 0, 0.5803922, 1,
1.34965, 0.1135988, 2.896185, 1, 0, 0.5764706, 1,
1.351213, -1.329026, 3.705921, 1, 0, 0.5686275, 1,
1.351683, -0.4411235, 0.8116074, 1, 0, 0.5647059, 1,
1.353951, -0.1778865, 0.9596104, 1, 0, 0.5568628, 1,
1.354505, -0.4404929, 1.042632, 1, 0, 0.5529412, 1,
1.355475, 0.6199551, -0.1390598, 1, 0, 0.5450981, 1,
1.359297, 0.7759011, -0.7954227, 1, 0, 0.5411765, 1,
1.36248, 0.3114563, -0.4589897, 1, 0, 0.5333334, 1,
1.363781, -1.910087, 2.726054, 1, 0, 0.5294118, 1,
1.369271, -0.5509022, 2.477214, 1, 0, 0.5215687, 1,
1.371281, 1.327065, 0.3692648, 1, 0, 0.5176471, 1,
1.373216, 0.2725562, 2.070074, 1, 0, 0.509804, 1,
1.37792, -2.659587, 2.811463, 1, 0, 0.5058824, 1,
1.378848, -0.3524219, 2.662466, 1, 0, 0.4980392, 1,
1.390507, -0.4291131, 1.642454, 1, 0, 0.4901961, 1,
1.401232, 0.3257735, -1.066929, 1, 0, 0.4862745, 1,
1.411851, 1.463024, -0.1493627, 1, 0, 0.4784314, 1,
1.422089, -0.976333, 1.826133, 1, 0, 0.4745098, 1,
1.423809, -0.4747468, 2.485589, 1, 0, 0.4666667, 1,
1.426606, -0.6940229, 3.57829, 1, 0, 0.4627451, 1,
1.427094, -1.710446, 1.289052, 1, 0, 0.454902, 1,
1.435772, 0.5283097, -0.2497208, 1, 0, 0.4509804, 1,
1.44434, 0.3277581, 2.769669, 1, 0, 0.4431373, 1,
1.446063, -0.4008708, -0.3423345, 1, 0, 0.4392157, 1,
1.461336, -1.661184, 0.7087918, 1, 0, 0.4313726, 1,
1.464619, 1.834922, 1.107522, 1, 0, 0.427451, 1,
1.469215, -1.848919, 2.30053, 1, 0, 0.4196078, 1,
1.491549, -1.327565, 1.090562, 1, 0, 0.4156863, 1,
1.513857, 0.1542871, 1.770887, 1, 0, 0.4078431, 1,
1.515508, 0.5623953, 1.088059, 1, 0, 0.4039216, 1,
1.521011, 1.886094, 0.7017531, 1, 0, 0.3960784, 1,
1.526329, 1.538576, 1.746881, 1, 0, 0.3882353, 1,
1.531071, -0.06594045, 1.627201, 1, 0, 0.3843137, 1,
1.553272, 0.6765054, 2.04547, 1, 0, 0.3764706, 1,
1.571043, 1.418067, 2.767152, 1, 0, 0.372549, 1,
1.576828, 0.422588, 2.44309, 1, 0, 0.3647059, 1,
1.578006, 0.7375731, 0.579213, 1, 0, 0.3607843, 1,
1.590127, -1.180679, 2.343313, 1, 0, 0.3529412, 1,
1.609484, -0.02799763, 1.447005, 1, 0, 0.3490196, 1,
1.609556, 1.167285, 0.9781013, 1, 0, 0.3411765, 1,
1.618115, 0.2709041, 1.48306, 1, 0, 0.3372549, 1,
1.624348, 0.6372118, 1.605538, 1, 0, 0.3294118, 1,
1.629797, -1.431122, 2.800537, 1, 0, 0.3254902, 1,
1.643182, 1.652584, -0.5853274, 1, 0, 0.3176471, 1,
1.652006, 0.03062085, 2.048131, 1, 0, 0.3137255, 1,
1.662641, -0.9715692, 0.08757758, 1, 0, 0.3058824, 1,
1.677853, -0.2194918, 2.902082, 1, 0, 0.2980392, 1,
1.678673, 1.598437, 0.7809263, 1, 0, 0.2941177, 1,
1.70216, 0.6290489, 3.855827, 1, 0, 0.2862745, 1,
1.702427, 1.831889, 0.7424487, 1, 0, 0.282353, 1,
1.717528, 1.059537, 0.3387163, 1, 0, 0.2745098, 1,
1.717669, 0.6430786, 0.1986109, 1, 0, 0.2705882, 1,
1.740786, 0.2176567, 3.414308, 1, 0, 0.2627451, 1,
1.741951, 1.276398, -1.122414, 1, 0, 0.2588235, 1,
1.742664, 3.231972, -0.1909515, 1, 0, 0.2509804, 1,
1.760363, 0.6837698, 2.646218, 1, 0, 0.2470588, 1,
1.768946, -1.442542, 1.293085, 1, 0, 0.2392157, 1,
1.773197, -1.313818, 2.265257, 1, 0, 0.2352941, 1,
1.801605, -1.367751, 3.447803, 1, 0, 0.227451, 1,
1.81679, 0.3870381, 0.7273155, 1, 0, 0.2235294, 1,
1.830486, -1.178945, -0.1163545, 1, 0, 0.2156863, 1,
1.847782, -1.391428, 1.314598, 1, 0, 0.2117647, 1,
1.852036, -0.3141828, 2.161946, 1, 0, 0.2039216, 1,
1.874195, 2.011016, 0.04854223, 1, 0, 0.1960784, 1,
1.89483, -0.8948035, 1.088939, 1, 0, 0.1921569, 1,
1.919147, 0.5553916, 2.127875, 1, 0, 0.1843137, 1,
1.941864, 1.140639, -0.882928, 1, 0, 0.1803922, 1,
1.951481, -0.03378531, 0.3331175, 1, 0, 0.172549, 1,
1.955265, 0.2214706, 1.355451, 1, 0, 0.1686275, 1,
1.955499, -0.2806703, 2.093453, 1, 0, 0.1607843, 1,
1.975565, 0.3362247, 0.2469636, 1, 0, 0.1568628, 1,
1.993097, 0.5537433, 2.547439, 1, 0, 0.1490196, 1,
2.009588, 0.3675252, 2.051182, 1, 0, 0.145098, 1,
2.016293, 0.23162, -0.5729548, 1, 0, 0.1372549, 1,
2.030239, -1.22162, 3.616765, 1, 0, 0.1333333, 1,
2.030441, -0.4779233, -0.1756974, 1, 0, 0.1254902, 1,
2.034765, 0.1552792, 0.9325755, 1, 0, 0.1215686, 1,
2.065779, -0.2563275, 0.8642152, 1, 0, 0.1137255, 1,
2.089578, 0.1227813, 0.719395, 1, 0, 0.1098039, 1,
2.092395, -1.14272, 3.019048, 1, 0, 0.1019608, 1,
2.114036, -0.2878522, 2.598818, 1, 0, 0.09411765, 1,
2.14711, 0.984409, 2.685573, 1, 0, 0.09019608, 1,
2.15277, 0.7522696, 0.7815133, 1, 0, 0.08235294, 1,
2.210094, 1.322064, 1.104138, 1, 0, 0.07843138, 1,
2.23196, -0.4064782, 1.987502, 1, 0, 0.07058824, 1,
2.257962, 0.001961728, 0.07729053, 1, 0, 0.06666667, 1,
2.308136, 0.121198, 0.5914978, 1, 0, 0.05882353, 1,
2.332124, 2.253165, 1.077415, 1, 0, 0.05490196, 1,
2.343134, 1.612169, 3.170078, 1, 0, 0.04705882, 1,
2.435722, 0.8330604, 1.668016, 1, 0, 0.04313726, 1,
2.585607, 0.6162469, 3.648844, 1, 0, 0.03529412, 1,
2.598145, 1.501428, 1.019882, 1, 0, 0.03137255, 1,
2.696584, -0.03678627, 2.623515, 1, 0, 0.02352941, 1,
2.892891, -0.1878743, 2.162904, 1, 0, 0.01960784, 1,
2.923993, -1.076684, 2.171519, 1, 0, 0.01176471, 1,
3.037163, 0.6609571, 0.9656848, 1, 0, 0.007843138, 1
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
-0.0706259, -4.453884, -7.051034, 0, -0.5, 0.5, 0.5,
-0.0706259, -4.453884, -7.051034, 1, -0.5, 0.5, 0.5,
-0.0706259, -4.453884, -7.051034, 1, 1.5, 0.5, 0.5,
-0.0706259, -4.453884, -7.051034, 0, 1.5, 0.5, 0.5
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
-4.231956, -0.05398607, -7.051034, 0, -0.5, 0.5, 0.5,
-4.231956, -0.05398607, -7.051034, 1, -0.5, 0.5, 0.5,
-4.231956, -0.05398607, -7.051034, 1, 1.5, 0.5, 0.5,
-4.231956, -0.05398607, -7.051034, 0, 1.5, 0.5, 0.5
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
-4.231956, -4.453884, -0.04062772, 0, -0.5, 0.5, 0.5,
-4.231956, -4.453884, -0.04062772, 1, -0.5, 0.5, 0.5,
-4.231956, -4.453884, -0.04062772, 1, 1.5, 0.5, 0.5,
-4.231956, -4.453884, -0.04062772, 0, 1.5, 0.5, 0.5
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
-3, -3.438523, -5.433248,
3, -3.438523, -5.433248,
-3, -3.438523, -5.433248,
-3, -3.607749, -5.702879,
-2, -3.438523, -5.433248,
-2, -3.607749, -5.702879,
-1, -3.438523, -5.433248,
-1, -3.607749, -5.702879,
0, -3.438523, -5.433248,
0, -3.607749, -5.702879,
1, -3.438523, -5.433248,
1, -3.607749, -5.702879,
2, -3.438523, -5.433248,
2, -3.607749, -5.702879,
3, -3.438523, -5.433248,
3, -3.607749, -5.702879
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
-3, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
-3, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
-3, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
-3, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
-2, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
-2, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
-2, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
-2, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
-1, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
-1, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
-1, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
-1, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
0, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
0, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
0, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
0, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
1, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
1, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
1, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
1, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
2, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
2, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
2, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
2, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5,
3, -3.946203, -6.242141, 0, -0.5, 0.5, 0.5,
3, -3.946203, -6.242141, 1, -0.5, 0.5, 0.5,
3, -3.946203, -6.242141, 1, 1.5, 0.5, 0.5,
3, -3.946203, -6.242141, 0, 1.5, 0.5, 0.5
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
-3.271649, -3, -5.433248,
-3.271649, 3, -5.433248,
-3.271649, -3, -5.433248,
-3.4317, -3, -5.702879,
-3.271649, -2, -5.433248,
-3.4317, -2, -5.702879,
-3.271649, -1, -5.433248,
-3.4317, -1, -5.702879,
-3.271649, 0, -5.433248,
-3.4317, 0, -5.702879,
-3.271649, 1, -5.433248,
-3.4317, 1, -5.702879,
-3.271649, 2, -5.433248,
-3.4317, 2, -5.702879,
-3.271649, 3, -5.433248,
-3.4317, 3, -5.702879
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
-3.751802, -3, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, -3, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, -3, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, -3, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, -2, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, -2, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, -2, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, -2, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, -1, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, -1, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, -1, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, -1, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, 0, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, 0, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, 0, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, 0, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, 1, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, 1, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, 1, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, 1, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, 2, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, 2, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, 2, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, 2, -6.242141, 0, 1.5, 0.5, 0.5,
-3.751802, 3, -6.242141, 0, -0.5, 0.5, 0.5,
-3.751802, 3, -6.242141, 1, -0.5, 0.5, 0.5,
-3.751802, 3, -6.242141, 1, 1.5, 0.5, 0.5,
-3.751802, 3, -6.242141, 0, 1.5, 0.5, 0.5
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
-3.271649, -3.438523, -4,
-3.271649, -3.438523, 4,
-3.271649, -3.438523, -4,
-3.4317, -3.607749, -4,
-3.271649, -3.438523, -2,
-3.4317, -3.607749, -2,
-3.271649, -3.438523, 0,
-3.4317, -3.607749, 0,
-3.271649, -3.438523, 2,
-3.4317, -3.607749, 2,
-3.271649, -3.438523, 4,
-3.4317, -3.607749, 4
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
-3.751802, -3.946203, -4, 0, -0.5, 0.5, 0.5,
-3.751802, -3.946203, -4, 1, -0.5, 0.5, 0.5,
-3.751802, -3.946203, -4, 1, 1.5, 0.5, 0.5,
-3.751802, -3.946203, -4, 0, 1.5, 0.5, 0.5,
-3.751802, -3.946203, -2, 0, -0.5, 0.5, 0.5,
-3.751802, -3.946203, -2, 1, -0.5, 0.5, 0.5,
-3.751802, -3.946203, -2, 1, 1.5, 0.5, 0.5,
-3.751802, -3.946203, -2, 0, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 0, 0, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 0, 1, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 0, 1, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 0, 0, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 2, 0, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 2, 1, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 2, 1, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 2, 0, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 4, 0, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 4, 1, -0.5, 0.5, 0.5,
-3.751802, -3.946203, 4, 1, 1.5, 0.5, 0.5,
-3.751802, -3.946203, 4, 0, 1.5, 0.5, 0.5
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
-3.271649, -3.438523, -5.433248,
-3.271649, 3.33055, -5.433248,
-3.271649, -3.438523, 5.351993,
-3.271649, 3.33055, 5.351993,
-3.271649, -3.438523, -5.433248,
-3.271649, -3.438523, 5.351993,
-3.271649, 3.33055, -5.433248,
-3.271649, 3.33055, 5.351993,
-3.271649, -3.438523, -5.433248,
3.130397, -3.438523, -5.433248,
-3.271649, -3.438523, 5.351993,
3.130397, -3.438523, 5.351993,
-3.271649, 3.33055, -5.433248,
3.130397, 3.33055, -5.433248,
-3.271649, 3.33055, 5.351993,
3.130397, 3.33055, 5.351993,
3.130397, -3.438523, -5.433248,
3.130397, 3.33055, -5.433248,
3.130397, -3.438523, 5.351993,
3.130397, 3.33055, 5.351993,
3.130397, -3.438523, -5.433248,
3.130397, -3.438523, 5.351993,
3.130397, 3.33055, -5.433248,
3.130397, 3.33055, 5.351993
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
var radius = 7.610449;
var distance = 33.85975;
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
mvMatrix.translate( 0.0706259, 0.05398607, 0.04062772 );
mvMatrix.scale( 1.285303, 1.215612, 0.762947 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85975);
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
4-chloro-6-methoxyin<-read.table("4-chloro-6-methoxyin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-chloro-6-methoxyin$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
y<-4-chloro-6-methoxyin$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
```

```r
z<-4-chloro-6-methoxyin$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloro' not found
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
-3.178415, 0.07072553, 0.112008, 0, 0, 1, 1, 1,
-3.036957, 0.4797968, -1.15933, 1, 0, 0, 1, 1,
-2.830627, -0.5452094, -5.276181, 1, 0, 0, 1, 1,
-2.656863, 0.883529, 0.5033424, 1, 0, 0, 1, 1,
-2.472436, -0.9666679, -1.300663, 1, 0, 0, 1, 1,
-2.447006, 1.128696, -0.8591549, 1, 0, 0, 1, 1,
-2.442431, 1.251041, -0.6224617, 0, 0, 0, 1, 1,
-2.347419, -0.3492863, -0.915208, 0, 0, 0, 1, 1,
-2.325718, -0.01607898, 0.1643233, 0, 0, 0, 1, 1,
-2.298454, -0.5937108, -1.806563, 0, 0, 0, 1, 1,
-2.249324, -0.959263, -3.991233, 0, 0, 0, 1, 1,
-2.244491, -0.2833265, -0.5161267, 0, 0, 0, 1, 1,
-2.24325, -0.2367827, -1.952354, 0, 0, 0, 1, 1,
-2.239807, 2.129351, 0.1692974, 1, 1, 1, 1, 1,
-2.213504, 2.045069, -1.455242, 1, 1, 1, 1, 1,
-2.175211, 0.01034709, -1.783442, 1, 1, 1, 1, 1,
-2.154254, 0.5546832, 0.7163353, 1, 1, 1, 1, 1,
-2.140035, -1.208974, -2.017393, 1, 1, 1, 1, 1,
-2.123307, 0.1726109, -1.524047, 1, 1, 1, 1, 1,
-2.116485, 0.5941371, -1.802648, 1, 1, 1, 1, 1,
-2.10806, 0.209913, -0.819258, 1, 1, 1, 1, 1,
-2.107989, 0.6161826, -1.645554, 1, 1, 1, 1, 1,
-2.049068, -1.099508, -1.700211, 1, 1, 1, 1, 1,
-2.048929, -1.94955, -2.315619, 1, 1, 1, 1, 1,
-2.039036, 1.164477, -0.1962338, 1, 1, 1, 1, 1,
-2.002528, 0.8238384, -2.509295, 1, 1, 1, 1, 1,
-1.999716, -1.066373, -3.003737, 1, 1, 1, 1, 1,
-1.990508, 0.421804, -1.553615, 1, 1, 1, 1, 1,
-1.985133, -1.709097, -2.973716, 0, 0, 1, 1, 1,
-1.983944, 0.1309374, -0.3162324, 1, 0, 0, 1, 1,
-1.954085, 0.7435822, -0.3073555, 1, 0, 0, 1, 1,
-1.866765, 0.2360241, -2.17896, 1, 0, 0, 1, 1,
-1.865107, -1.528676, -1.885874, 1, 0, 0, 1, 1,
-1.843317, 0.2847679, -2.278653, 1, 0, 0, 1, 1,
-1.836003, -2.282006, -2.585225, 0, 0, 0, 1, 1,
-1.799303, 0.03734921, -1.449511, 0, 0, 0, 1, 1,
-1.792327, 0.4655607, -1.203163, 0, 0, 0, 1, 1,
-1.777377, 1.868438, -1.508203, 0, 0, 0, 1, 1,
-1.763442, -1.161199, -2.773935, 0, 0, 0, 1, 1,
-1.751414, -1.145197, -1.611769, 0, 0, 0, 1, 1,
-1.738183, -0.9039026, -0.5848974, 0, 0, 0, 1, 1,
-1.724376, -0.7995522, -2.940484, 1, 1, 1, 1, 1,
-1.720741, -0.3274046, -3.100303, 1, 1, 1, 1, 1,
-1.709421, -2.173506, -4.52738, 1, 1, 1, 1, 1,
-1.701239, 0.1227297, -1.462582, 1, 1, 1, 1, 1,
-1.698591, -0.3867586, -1.886002, 1, 1, 1, 1, 1,
-1.697954, -0.8110198, -2.354743, 1, 1, 1, 1, 1,
-1.683115, -1.408044, -3.175778, 1, 1, 1, 1, 1,
-1.680156, 1.138828, -0.08214649, 1, 1, 1, 1, 1,
-1.669975, 2.843686, -1.34705, 1, 1, 1, 1, 1,
-1.640678, 1.378788, -1.818137, 1, 1, 1, 1, 1,
-1.605381, 0.1518269, -1.993795, 1, 1, 1, 1, 1,
-1.600279, 0.8762492, -1.457234, 1, 1, 1, 1, 1,
-1.593514, -0.3708579, -2.344313, 1, 1, 1, 1, 1,
-1.575338, 0.8529954, -1.299592, 1, 1, 1, 1, 1,
-1.574094, -0.09395789, 0.9480574, 1, 1, 1, 1, 1,
-1.538941, 0.03240968, -1.95332, 0, 0, 1, 1, 1,
-1.537938, 0.0077078, -1.185414, 1, 0, 0, 1, 1,
-1.537092, -0.4395882, -0.9234228, 1, 0, 0, 1, 1,
-1.521496, -0.6070819, -3.136157, 1, 0, 0, 1, 1,
-1.518898, 2.583429, -0.9201261, 1, 0, 0, 1, 1,
-1.518101, 0.3228551, -2.332575, 1, 0, 0, 1, 1,
-1.506886, -0.4146986, -1.79502, 0, 0, 0, 1, 1,
-1.501103, -1.949751, -1.961506, 0, 0, 0, 1, 1,
-1.499209, 0.0238597, -0.1022166, 0, 0, 0, 1, 1,
-1.492456, 0.2563515, -1.382119, 0, 0, 0, 1, 1,
-1.49177, 0.8699536, -1.553061, 0, 0, 0, 1, 1,
-1.488265, -0.2008829, -2.066509, 0, 0, 0, 1, 1,
-1.481652, 0.9941165, -1.028517, 0, 0, 0, 1, 1,
-1.474414, -1.34192, -3.1022, 1, 1, 1, 1, 1,
-1.472826, -0.8190273, -1.732488, 1, 1, 1, 1, 1,
-1.460289, 1.052248, -1.427474, 1, 1, 1, 1, 1,
-1.460163, 0.5968173, -2.081611, 1, 1, 1, 1, 1,
-1.455025, 0.3738175, -0.9039183, 1, 1, 1, 1, 1,
-1.454372, -0.4206509, -1.640745, 1, 1, 1, 1, 1,
-1.445126, -0.518439, -0.3363308, 1, 1, 1, 1, 1,
-1.439405, 0.7861715, -1.66042, 1, 1, 1, 1, 1,
-1.437048, 0.6343404, -2.521832, 1, 1, 1, 1, 1,
-1.430222, -0.9212617, -2.013284, 1, 1, 1, 1, 1,
-1.422397, 0.3171369, -0.9795109, 1, 1, 1, 1, 1,
-1.419683, 1.250413, -0.740252, 1, 1, 1, 1, 1,
-1.400249, 0.6367632, -3.095227, 1, 1, 1, 1, 1,
-1.399111, 2.536959, -1.263968, 1, 1, 1, 1, 1,
-1.389276, 0.5615783, -2.576419, 1, 1, 1, 1, 1,
-1.386322, 1.169044, -0.7922082, 0, 0, 1, 1, 1,
-1.385689, -0.9508985, -0.07433415, 1, 0, 0, 1, 1,
-1.382331, 0.5513031, -2.2923, 1, 0, 0, 1, 1,
-1.381551, -0.3739167, -1.635839, 1, 0, 0, 1, 1,
-1.373852, -0.104958, -1.300141, 1, 0, 0, 1, 1,
-1.369955, 0.8098732, 0.5307451, 1, 0, 0, 1, 1,
-1.366303, -1.502348, -2.743966, 0, 0, 0, 1, 1,
-1.363787, -0.3317856, -1.236365, 0, 0, 0, 1, 1,
-1.354125, 0.3383311, -0.8077291, 0, 0, 0, 1, 1,
-1.353789, 0.5922104, -0.1623967, 0, 0, 0, 1, 1,
-1.34543, 0.03331219, -1.720758, 0, 0, 0, 1, 1,
-1.331555, -1.13012, -4.599307, 0, 0, 0, 1, 1,
-1.32715, 1.300322, 0.263057, 0, 0, 0, 1, 1,
-1.312068, 0.3736148, -1.294467, 1, 1, 1, 1, 1,
-1.311822, -0.09462852, -1.773275, 1, 1, 1, 1, 1,
-1.307967, 1.934835, -1.501004, 1, 1, 1, 1, 1,
-1.30794, -0.8912338, -1.925694, 1, 1, 1, 1, 1,
-1.294964, 0.3328599, -1.113332, 1, 1, 1, 1, 1,
-1.291528, 0.3673166, -1.890099, 1, 1, 1, 1, 1,
-1.287524, 0.6955447, -1.342937, 1, 1, 1, 1, 1,
-1.285744, 0.9141833, 0.2591329, 1, 1, 1, 1, 1,
-1.278932, 1.794414, -1.557597, 1, 1, 1, 1, 1,
-1.272318, 0.3460823, -0.3548212, 1, 1, 1, 1, 1,
-1.246812, -1.11715, -1.813337, 1, 1, 1, 1, 1,
-1.239556, -0.4092163, -2.201479, 1, 1, 1, 1, 1,
-1.236824, -0.1304497, -1.841269, 1, 1, 1, 1, 1,
-1.227087, 0.08308943, -2.602298, 1, 1, 1, 1, 1,
-1.224115, -1.215117, -3.558349, 1, 1, 1, 1, 1,
-1.214131, -1.063366, -2.649529, 0, 0, 1, 1, 1,
-1.213115, 0.5912625, -1.124098, 1, 0, 0, 1, 1,
-1.206242, 1.383736, -0.5521496, 1, 0, 0, 1, 1,
-1.20568, -1.369158, -2.340799, 1, 0, 0, 1, 1,
-1.191844, 1.878463, 0.2095761, 1, 0, 0, 1, 1,
-1.186405, -0.6999334, -2.527193, 1, 0, 0, 1, 1,
-1.184205, 1.773729, -2.1519, 0, 0, 0, 1, 1,
-1.181742, -0.8072789, -2.115458, 0, 0, 0, 1, 1,
-1.174891, -0.2509745, -0.7731661, 0, 0, 0, 1, 1,
-1.172382, 0.487625, -2.139233, 0, 0, 0, 1, 1,
-1.15671, -1.52698, -1.789421, 0, 0, 0, 1, 1,
-1.151029, 0.863374, -0.8219064, 0, 0, 0, 1, 1,
-1.144379, 1.083613, -1.301518, 0, 0, 0, 1, 1,
-1.136349, -0.2117898, -0.9951586, 1, 1, 1, 1, 1,
-1.133964, -0.2917614, -1.498625, 1, 1, 1, 1, 1,
-1.133363, 0.2750274, -3.246315, 1, 1, 1, 1, 1,
-1.130558, -0.04896008, -2.933473, 1, 1, 1, 1, 1,
-1.113328, 0.7396923, -1.703979, 1, 1, 1, 1, 1,
-1.110701, -1.848087, -2.161011, 1, 1, 1, 1, 1,
-1.108901, -1.554158, -1.291368, 1, 1, 1, 1, 1,
-1.108123, -0.006786703, -0.3021959, 1, 1, 1, 1, 1,
-1.105155, 0.02634223, 0.4181396, 1, 1, 1, 1, 1,
-1.096666, -0.1809438, -1.410757, 1, 1, 1, 1, 1,
-1.094832, 1.468352, -1.556193, 1, 1, 1, 1, 1,
-1.093897, -0.3422044, -1.59647, 1, 1, 1, 1, 1,
-1.089062, 1.567982, -0.5857117, 1, 1, 1, 1, 1,
-1.087774, 0.2511644, -3.779102, 1, 1, 1, 1, 1,
-1.084588, 0.09101622, -0.833535, 1, 1, 1, 1, 1,
-1.084294, 0.05958749, -2.142504, 0, 0, 1, 1, 1,
-1.084255, -0.3157038, -2.381263, 1, 0, 0, 1, 1,
-1.073151, 0.7521597, -2.241873, 1, 0, 0, 1, 1,
-1.068871, -0.4175512, -2.232737, 1, 0, 0, 1, 1,
-1.066169, 1.077202, -0.684314, 1, 0, 0, 1, 1,
-1.065835, -1.155938, -2.406381, 1, 0, 0, 1, 1,
-1.061067, 0.9942188, -1.837086, 0, 0, 0, 1, 1,
-1.060895, 0.3945356, -1.870502, 0, 0, 0, 1, 1,
-1.055673, 0.2926497, -0.4297172, 0, 0, 0, 1, 1,
-1.05477, 1.544475, -1.130343, 0, 0, 0, 1, 1,
-1.051853, 0.2684373, -0.7320682, 0, 0, 0, 1, 1,
-1.039607, -0.7026019, -2.494883, 0, 0, 0, 1, 1,
-1.036191, 0.01438773, -0.4409165, 0, 0, 0, 1, 1,
-1.032827, -2.252642, -3.640541, 1, 1, 1, 1, 1,
-1.0328, 0.4200094, -1.293383, 1, 1, 1, 1, 1,
-1.019181, -0.5175198, 0.3028075, 1, 1, 1, 1, 1,
-1.013827, 0.181407, -1.353331, 1, 1, 1, 1, 1,
-1.012744, 0.9988132, -1.043524, 1, 1, 1, 1, 1,
-1.010856, 0.5304441, -1.60264, 1, 1, 1, 1, 1,
-1.008338, 1.63316, 1.263163, 1, 1, 1, 1, 1,
-0.9987709, 0.2380418, -0.63032, 1, 1, 1, 1, 1,
-0.9933757, 0.3701763, -0.6387182, 1, 1, 1, 1, 1,
-0.9921861, 0.5170217, 1.322386, 1, 1, 1, 1, 1,
-0.9833941, 1.541874, -0.2969015, 1, 1, 1, 1, 1,
-0.9761843, -0.8896835, -1.924952, 1, 1, 1, 1, 1,
-0.9752008, 0.2390984, -1.036941, 1, 1, 1, 1, 1,
-0.969718, -0.4395826, -2.18809, 1, 1, 1, 1, 1,
-0.9685771, 0.3002117, -0.5712456, 1, 1, 1, 1, 1,
-0.9655573, -0.3576719, -1.643638, 0, 0, 1, 1, 1,
-0.9583362, -1.561256, -1.799107, 1, 0, 0, 1, 1,
-0.9563912, 0.09060486, -1.539817, 1, 0, 0, 1, 1,
-0.950556, 0.05925822, -2.376295, 1, 0, 0, 1, 1,
-0.9497804, 0.1321329, -1.912575, 1, 0, 0, 1, 1,
-0.9453346, -0.749221, -2.104513, 1, 0, 0, 1, 1,
-0.9402177, -0.3434901, -2.213567, 0, 0, 0, 1, 1,
-0.9337163, 0.8476893, -1.002484, 0, 0, 0, 1, 1,
-0.9335957, -0.3116013, -2.851527, 0, 0, 0, 1, 1,
-0.9269942, -0.3422544, -1.698506, 0, 0, 0, 1, 1,
-0.924376, 1.810011, -0.2619293, 0, 0, 0, 1, 1,
-0.9235436, -0.4256548, -2.496188, 0, 0, 0, 1, 1,
-0.919602, 0.5374789, -1.393593, 0, 0, 0, 1, 1,
-0.9154321, 2.058861, -0.9859787, 1, 1, 1, 1, 1,
-0.914575, 1.474024, -0.720583, 1, 1, 1, 1, 1,
-0.9120191, -2.279366, -1.976894, 1, 1, 1, 1, 1,
-0.9090074, -0.9936332, -3.119886, 1, 1, 1, 1, 1,
-0.9087659, 1.0398, -0.650983, 1, 1, 1, 1, 1,
-0.9034711, -0.9922702, -2.165447, 1, 1, 1, 1, 1,
-0.902104, -0.8661401, -3.232989, 1, 1, 1, 1, 1,
-0.8935839, 1.122227, -0.8903208, 1, 1, 1, 1, 1,
-0.8785596, -1.200213, -1.594514, 1, 1, 1, 1, 1,
-0.8748014, -0.938579, -2.538214, 1, 1, 1, 1, 1,
-0.8642814, 2.433928, 0.2873316, 1, 1, 1, 1, 1,
-0.8624631, 0.8003778, -0.744767, 1, 1, 1, 1, 1,
-0.8563923, -0.8140841, -1.492911, 1, 1, 1, 1, 1,
-0.8519441, -0.2878713, -2.027638, 1, 1, 1, 1, 1,
-0.8499842, 2.675678, -0.4919347, 1, 1, 1, 1, 1,
-0.8473049, 0.5884856, -1.578077, 0, 0, 1, 1, 1,
-0.8410947, 0.4492183, -2.361895, 1, 0, 0, 1, 1,
-0.8331188, -0.4410498, -2.204488, 1, 0, 0, 1, 1,
-0.8303528, 1.198352, -0.8485208, 1, 0, 0, 1, 1,
-0.8237172, -0.90174, -4.101449, 1, 0, 0, 1, 1,
-0.8234039, 0.06148797, -2.841236, 1, 0, 0, 1, 1,
-0.819676, 1.160833, -0.6579604, 0, 0, 0, 1, 1,
-0.8187266, 0.2470921, -1.507613, 0, 0, 0, 1, 1,
-0.8024801, -1.419722, -3.341932, 0, 0, 0, 1, 1,
-0.8008489, -0.6304544, -1.483608, 0, 0, 0, 1, 1,
-0.800787, -1.680684, -2.634252, 0, 0, 0, 1, 1,
-0.7981644, -0.1270711, -1.156847, 0, 0, 0, 1, 1,
-0.797297, -1.733834, -2.429333, 0, 0, 0, 1, 1,
-0.795406, 0.7355146, -1.302665, 1, 1, 1, 1, 1,
-0.794152, -0.0250645, -0.7798594, 1, 1, 1, 1, 1,
-0.7914053, -2.103334, -1.577015, 1, 1, 1, 1, 1,
-0.7758058, 0.6838734, -2.373755, 1, 1, 1, 1, 1,
-0.7723882, -0.8903962, -4.492748, 1, 1, 1, 1, 1,
-0.7713468, 0.9291737, -0.8200185, 1, 1, 1, 1, 1,
-0.7698045, -0.4170335, -1.333659, 1, 1, 1, 1, 1,
-0.766366, 0.1035193, -0.8069871, 1, 1, 1, 1, 1,
-0.7657853, 0.9985679, -1.930543, 1, 1, 1, 1, 1,
-0.7585237, 0.3405062, -1.04358, 1, 1, 1, 1, 1,
-0.7574808, -0.4905587, -2.900598, 1, 1, 1, 1, 1,
-0.7549831, -0.4221778, -2.539597, 1, 1, 1, 1, 1,
-0.7532665, -0.5148889, 0.2250327, 1, 1, 1, 1, 1,
-0.752584, -0.3376541, 0.01055892, 1, 1, 1, 1, 1,
-0.7507713, 0.255443, 1.087529, 1, 1, 1, 1, 1,
-0.7488291, -0.9730737, -2.633491, 0, 0, 1, 1, 1,
-0.7486739, -1.184091, -2.52035, 1, 0, 0, 1, 1,
-0.7484059, -0.4936202, -1.779756, 1, 0, 0, 1, 1,
-0.74073, 0.0651613, 0.3926857, 1, 0, 0, 1, 1,
-0.7402163, -0.9486169, -3.272342, 1, 0, 0, 1, 1,
-0.7341437, 1.296797, 0.4963441, 1, 0, 0, 1, 1,
-0.7337869, -2.476112, -1.251871, 0, 0, 0, 1, 1,
-0.7329219, 0.2520918, -0.3420508, 0, 0, 0, 1, 1,
-0.7291499, -0.6325595, -1.331537, 0, 0, 0, 1, 1,
-0.72914, 0.1893079, -0.5578958, 0, 0, 0, 1, 1,
-0.7283881, 0.4471726, -1.021855, 0, 0, 0, 1, 1,
-0.725889, -0.4776048, -2.622231, 0, 0, 0, 1, 1,
-0.7158499, -0.07079185, -3.028727, 0, 0, 0, 1, 1,
-0.7109663, 1.640463, -0.5844003, 1, 1, 1, 1, 1,
-0.7057298, -0.5510461, -2.367034, 1, 1, 1, 1, 1,
-0.6925077, 0.2358848, -1.924806, 1, 1, 1, 1, 1,
-0.6915462, -0.8073037, -3.121967, 1, 1, 1, 1, 1,
-0.6889015, -0.375208, -4.291019, 1, 1, 1, 1, 1,
-0.6864486, -0.388556, -1.979922, 1, 1, 1, 1, 1,
-0.6835629, 1.56089, -1.365603, 1, 1, 1, 1, 1,
-0.6811898, 0.6166067, -0.04078644, 1, 1, 1, 1, 1,
-0.6760975, -1.239885, -2.959827, 1, 1, 1, 1, 1,
-0.6720994, 0.8696054, -0.7532349, 1, 1, 1, 1, 1,
-0.6706628, -0.4644243, -3.409952, 1, 1, 1, 1, 1,
-0.6706491, 0.2731322, -1.785514, 1, 1, 1, 1, 1,
-0.6677948, 0.4621702, -0.785136, 1, 1, 1, 1, 1,
-0.666133, 1.08488, -0.2134497, 1, 1, 1, 1, 1,
-0.6656934, 1.213, -2.144868, 1, 1, 1, 1, 1,
-0.6591278, 0.5570208, -1.576222, 0, 0, 1, 1, 1,
-0.6584247, 0.332264, -2.586428, 1, 0, 0, 1, 1,
-0.6560993, 0.6961686, -2.256765, 1, 0, 0, 1, 1,
-0.6541076, 0.1409204, -1.531803, 1, 0, 0, 1, 1,
-0.6489516, 0.7063161, -0.541729, 1, 0, 0, 1, 1,
-0.642971, -0.2187519, -0.8189155, 1, 0, 0, 1, 1,
-0.6354097, 0.300378, 0.04654361, 0, 0, 0, 1, 1,
-0.6315204, 1.085295, 0.1272307, 0, 0, 0, 1, 1,
-0.6304215, -0.2012314, -4.75915, 0, 0, 0, 1, 1,
-0.6300728, -2.300771, -4.012642, 0, 0, 0, 1, 1,
-0.6268693, 0.6184572, -1.854138, 0, 0, 0, 1, 1,
-0.6251079, -0.003812732, -1.011169, 0, 0, 0, 1, 1,
-0.6238488, 0.05515747, -1.73042, 0, 0, 0, 1, 1,
-0.623786, -0.4307597, -2.485168, 1, 1, 1, 1, 1,
-0.618247, 0.1869683, -2.764076, 1, 1, 1, 1, 1,
-0.6126562, -0.731023, -3.820063, 1, 1, 1, 1, 1,
-0.6115984, 2.335661, 0.7275332, 1, 1, 1, 1, 1,
-0.6108385, -0.3027956, -2.436927, 1, 1, 1, 1, 1,
-0.6012367, -1.339724, -1.676958, 1, 1, 1, 1, 1,
-0.6010962, 0.8360176, 0.7031426, 1, 1, 1, 1, 1,
-0.596929, 1.275891, -0.3117444, 1, 1, 1, 1, 1,
-0.5966966, -0.7343854, -1.226744, 1, 1, 1, 1, 1,
-0.5961343, 0.531073, -0.3991864, 1, 1, 1, 1, 1,
-0.5958628, -0.152968, -1.909868, 1, 1, 1, 1, 1,
-0.594252, -0.7653995, -1.254262, 1, 1, 1, 1, 1,
-0.594183, 0.395701, -1.276283, 1, 1, 1, 1, 1,
-0.5862399, 0.5661235, -1.465627, 1, 1, 1, 1, 1,
-0.5841885, 0.4093229, -0.6219814, 1, 1, 1, 1, 1,
-0.5829871, 0.8649384, 0.3240753, 0, 0, 1, 1, 1,
-0.5803449, 1.457399, -0.2145379, 1, 0, 0, 1, 1,
-0.5743235, -1.325564, -3.95039, 1, 0, 0, 1, 1,
-0.5728728, -2.168082, -4.051386, 1, 0, 0, 1, 1,
-0.5693484, 0.4770829, -1.104162, 1, 0, 0, 1, 1,
-0.5667371, -0.2334235, -2.353794, 1, 0, 0, 1, 1,
-0.5621706, -0.7899174, -2.103722, 0, 0, 0, 1, 1,
-0.5617185, -1.204041, -3.678532, 0, 0, 0, 1, 1,
-0.5568816, 1.901616, -0.08383487, 0, 0, 0, 1, 1,
-0.5557554, 0.3988852, -1.906255, 0, 0, 0, 1, 1,
-0.5526419, -0.3482516, -3.88686, 0, 0, 0, 1, 1,
-0.5491126, 0.06906262, -0.6835951, 0, 0, 0, 1, 1,
-0.5473909, 1.799994, 0.5269548, 0, 0, 0, 1, 1,
-0.5444575, 0.2748063, -1.672494, 1, 1, 1, 1, 1,
-0.5416026, 1.258157, -0.6275865, 1, 1, 1, 1, 1,
-0.5405772, 0.4957114, -0.9408041, 1, 1, 1, 1, 1,
-0.5386232, -0.7755362, -2.927601, 1, 1, 1, 1, 1,
-0.5373528, 0.6010743, -0.906895, 1, 1, 1, 1, 1,
-0.5367736, -0.8421061, -2.555281, 1, 1, 1, 1, 1,
-0.5358437, 1.960703, -0.8502014, 1, 1, 1, 1, 1,
-0.5335331, 1.413208, -0.47649, 1, 1, 1, 1, 1,
-0.5325354, -0.5899282, -1.880258, 1, 1, 1, 1, 1,
-0.5290226, -1.192206, -1.125089, 1, 1, 1, 1, 1,
-0.5232574, 1.879409, 0.3941191, 1, 1, 1, 1, 1,
-0.5224273, 0.6061921, -0.9864537, 1, 1, 1, 1, 1,
-0.5193037, -1.217645, -0.88844, 1, 1, 1, 1, 1,
-0.5178635, 0.7330983, 2.004335, 1, 1, 1, 1, 1,
-0.5158344, -0.8717493, -4.67065, 1, 1, 1, 1, 1,
-0.5137767, -0.6989346, -2.002267, 0, 0, 1, 1, 1,
-0.504357, -0.482466, -3.245687, 1, 0, 0, 1, 1,
-0.5025622, 1.919718, -0.9721633, 1, 0, 0, 1, 1,
-0.5020521, -0.2091747, -1.38916, 1, 0, 0, 1, 1,
-0.5001334, 0.4115753, -1.768945, 1, 0, 0, 1, 1,
-0.4960625, 1.293545, 0.7484936, 1, 0, 0, 1, 1,
-0.4954526, -0.1128452, -2.171017, 0, 0, 0, 1, 1,
-0.487362, -0.551253, -3.242776, 0, 0, 0, 1, 1,
-0.4854987, 0.6617437, -0.9322024, 0, 0, 0, 1, 1,
-0.4836906, 0.8240961, -0.0504397, 0, 0, 0, 1, 1,
-0.4831751, 0.4857998, -1.215481, 0, 0, 0, 1, 1,
-0.4812554, -0.4829169, -1.060375, 0, 0, 0, 1, 1,
-0.4804817, 1.034724, -0.277417, 0, 0, 0, 1, 1,
-0.4797596, 0.4338464, -0.1645444, 1, 1, 1, 1, 1,
-0.4795336, -0.7155144, -4.066188, 1, 1, 1, 1, 1,
-0.4784269, -2.03967, -2.438038, 1, 1, 1, 1, 1,
-0.4781813, 0.469533, -0.4044015, 1, 1, 1, 1, 1,
-0.4761488, -0.5198314, -2.297985, 1, 1, 1, 1, 1,
-0.4759818, 2.009518, -0.7247972, 1, 1, 1, 1, 1,
-0.4743755, -0.4482203, -1.449516, 1, 1, 1, 1, 1,
-0.4738835, -1.131035, -2.969552, 1, 1, 1, 1, 1,
-0.4717634, 0.2998515, 0.4267954, 1, 1, 1, 1, 1,
-0.468855, -0.3866177, -1.115914, 1, 1, 1, 1, 1,
-0.4669168, -1.48459, -2.570223, 1, 1, 1, 1, 1,
-0.4624957, 1.158717, -0.4563048, 1, 1, 1, 1, 1,
-0.4615865, 0.7142575, -0.4840465, 1, 1, 1, 1, 1,
-0.4580774, -1.185068, -2.171237, 1, 1, 1, 1, 1,
-0.4564485, -1.644113, -1.594592, 1, 1, 1, 1, 1,
-0.452971, -0.3766388, -1.777858, 0, 0, 1, 1, 1,
-0.4483894, -0.3678225, -1.684797, 1, 0, 0, 1, 1,
-0.4447604, -0.3160085, -1.518395, 1, 0, 0, 1, 1,
-0.442552, -0.7086351, -1.751157, 1, 0, 0, 1, 1,
-0.4416392, 1.467918, -2.555429, 1, 0, 0, 1, 1,
-0.4413869, -0.8346486, -3.239918, 1, 0, 0, 1, 1,
-0.4351647, -0.764643, -2.642541, 0, 0, 0, 1, 1,
-0.4344365, -0.2958851, -2.505459, 0, 0, 0, 1, 1,
-0.4282922, 0.5796422, -0.5236918, 0, 0, 0, 1, 1,
-0.4260614, -0.7672088, -1.35585, 0, 0, 0, 1, 1,
-0.4259588, 1.898742, -1.186356, 0, 0, 0, 1, 1,
-0.4257051, 0.06735624, 1.082612, 0, 0, 0, 1, 1,
-0.4257008, -0.1861594, -1.331596, 0, 0, 0, 1, 1,
-0.4224175, 0.8642262, 0.1624482, 1, 1, 1, 1, 1,
-0.4170583, -0.66475, -1.805469, 1, 1, 1, 1, 1,
-0.4170424, 1.072935, -1.444144, 1, 1, 1, 1, 1,
-0.4167563, -1.252572, -3.736449, 1, 1, 1, 1, 1,
-0.4148005, -0.521542, -2.179217, 1, 1, 1, 1, 1,
-0.4122464, 0.9539036, 0.6816552, 1, 1, 1, 1, 1,
-0.4095524, 1.220855, 0.8003761, 1, 1, 1, 1, 1,
-0.4088685, 0.07646901, -0.5881997, 1, 1, 1, 1, 1,
-0.403914, 0.7353917, 0.5328073, 1, 1, 1, 1, 1,
-0.4026547, 1.0278, 0.3689803, 1, 1, 1, 1, 1,
-0.4013337, 0.862715, 0.7941123, 1, 1, 1, 1, 1,
-0.3998438, 1.297564, 1.060201, 1, 1, 1, 1, 1,
-0.396583, -0.8446011, -2.258391, 1, 1, 1, 1, 1,
-0.3912698, 0.9454372, -0.7294184, 1, 1, 1, 1, 1,
-0.387833, -1.231411, -2.423105, 1, 1, 1, 1, 1,
-0.3838555, -0.9819318, -4.442255, 0, 0, 1, 1, 1,
-0.383604, -2.019155, -5.045393, 1, 0, 0, 1, 1,
-0.3835657, 0.4559717, -3.408252, 1, 0, 0, 1, 1,
-0.3804779, -0.5764629, -2.392724, 1, 0, 0, 1, 1,
-0.3801571, 0.9383146, -0.3377922, 1, 0, 0, 1, 1,
-0.3793446, -1.462195, -4.516688, 1, 0, 0, 1, 1,
-0.3785913, -0.1721647, -1.210379, 0, 0, 0, 1, 1,
-0.3783355, 0.07705112, -0.5834248, 0, 0, 0, 1, 1,
-0.3763852, -0.7444198, -3.160032, 0, 0, 0, 1, 1,
-0.3762522, 0.8769015, -0.4715149, 0, 0, 0, 1, 1,
-0.3755657, 1.817249, -0.6821862, 0, 0, 0, 1, 1,
-0.3712038, -0.5484358, -1.839061, 0, 0, 0, 1, 1,
-0.3709029, -0.1892321, -1.299697, 0, 0, 0, 1, 1,
-0.3678088, -1.526755, -2.931351, 1, 1, 1, 1, 1,
-0.3670856, 0.8514166, 0.7835882, 1, 1, 1, 1, 1,
-0.3663692, 1.014269, -0.4780345, 1, 1, 1, 1, 1,
-0.3660496, 0.1209296, -2.400589, 1, 1, 1, 1, 1,
-0.3609459, 0.6649532, -1.378975, 1, 1, 1, 1, 1,
-0.3607251, 0.1715165, -1.276721, 1, 1, 1, 1, 1,
-0.3597759, 1.135123, 0.2546188, 1, 1, 1, 1, 1,
-0.3596347, -0.9461246, -0.8817793, 1, 1, 1, 1, 1,
-0.3582448, 0.4216768, 0.1662265, 1, 1, 1, 1, 1,
-0.3543511, 0.4255071, -0.9500463, 1, 1, 1, 1, 1,
-0.349758, 1.87631, 0.2012108, 1, 1, 1, 1, 1,
-0.3491201, -0.3219808, -1.203624, 1, 1, 1, 1, 1,
-0.3484764, -0.4789695, -3.33746, 1, 1, 1, 1, 1,
-0.3481686, -1.128701, -2.961214, 1, 1, 1, 1, 1,
-0.3457367, 1.251622, 0.5931306, 1, 1, 1, 1, 1,
-0.3446212, 1.311006, -0.2288333, 0, 0, 1, 1, 1,
-0.3429064, -0.06816313, -2.177613, 1, 0, 0, 1, 1,
-0.3381329, 1.142674, 0.9807418, 1, 0, 0, 1, 1,
-0.3247776, 0.7811881, -0.7248027, 1, 0, 0, 1, 1,
-0.3158555, 0.01031289, -3.439777, 1, 0, 0, 1, 1,
-0.3137553, -1.31966, -4.632339, 1, 0, 0, 1, 1,
-0.3136032, -1.916268, -3.601628, 0, 0, 0, 1, 1,
-0.3093971, 0.5326222, -1.791327, 0, 0, 0, 1, 1,
-0.3068421, -0.4656445, -3.57373, 0, 0, 0, 1, 1,
-0.3031943, 0.007294936, -1.572726, 0, 0, 0, 1, 1,
-0.302755, -0.3519026, -2.814524, 0, 0, 0, 1, 1,
-0.302662, 0.4973383, 0.9536512, 0, 0, 0, 1, 1,
-0.2969713, 0.6421037, -2.162428, 0, 0, 0, 1, 1,
-0.2947885, 1.474076, -1.645073, 1, 1, 1, 1, 1,
-0.2947882, -0.1984385, -1.352312, 1, 1, 1, 1, 1,
-0.2892092, -0.2643506, -2.36946, 1, 1, 1, 1, 1,
-0.2890787, 0.227029, 0.1019702, 1, 1, 1, 1, 1,
-0.2874673, 0.9696806, -1.760317, 1, 1, 1, 1, 1,
-0.2762745, 1.490261, 1.020581, 1, 1, 1, 1, 1,
-0.275749, 0.1282768, -0.7913378, 1, 1, 1, 1, 1,
-0.2747478, -1.0958, -3.017977, 1, 1, 1, 1, 1,
-0.2725357, 0.4248022, -0.477283, 1, 1, 1, 1, 1,
-0.2680818, -1.122577, -4.221865, 1, 1, 1, 1, 1,
-0.2655821, -0.672056, -3.370312, 1, 1, 1, 1, 1,
-0.265483, 0.5111769, -0.2812541, 1, 1, 1, 1, 1,
-0.2653071, 0.0006989702, -1.065561, 1, 1, 1, 1, 1,
-0.2605281, 0.322397, 0.005858307, 1, 1, 1, 1, 1,
-0.2596338, -0.2975667, -1.367038, 1, 1, 1, 1, 1,
-0.2553797, -0.8431753, -3.026833, 0, 0, 1, 1, 1,
-0.2546517, -0.3205914, -1.635012, 1, 0, 0, 1, 1,
-0.2545752, -0.5251294, -2.74672, 1, 0, 0, 1, 1,
-0.254002, -1.063613, -4.19761, 1, 0, 0, 1, 1,
-0.2527892, -0.9856127, -3.617299, 1, 0, 0, 1, 1,
-0.2509344, 0.1984506, -0.6315942, 1, 0, 0, 1, 1,
-0.2478818, 0.3078426, 0.2029704, 0, 0, 0, 1, 1,
-0.2474772, 1.093113, 0.03414631, 0, 0, 0, 1, 1,
-0.2402403, -0.8387993, -2.304815, 0, 0, 0, 1, 1,
-0.2399516, -0.1673294, -0.7108212, 0, 0, 0, 1, 1,
-0.2356744, 2.119248, 0.6188441, 0, 0, 0, 1, 1,
-0.232353, 0.5023063, -0.766143, 0, 0, 0, 1, 1,
-0.2310009, 1.149691, -2.325225, 0, 0, 0, 1, 1,
-0.2293128, 0.3439788, -0.7644584, 1, 1, 1, 1, 1,
-0.2265481, -0.734426, -4.225043, 1, 1, 1, 1, 1,
-0.2259842, -0.4969797, -4.325361, 1, 1, 1, 1, 1,
-0.2202822, -1.266521, -1.723961, 1, 1, 1, 1, 1,
-0.2147034, -0.8578147, -2.379342, 1, 1, 1, 1, 1,
-0.2117437, -0.362717, -2.286804, 1, 1, 1, 1, 1,
-0.2076662, -0.5328577, -2.366402, 1, 1, 1, 1, 1,
-0.2071596, 0.3739778, -0.852477, 1, 1, 1, 1, 1,
-0.2065146, 0.3040116, -0.7090704, 1, 1, 1, 1, 1,
-0.202777, -0.7461283, -3.138431, 1, 1, 1, 1, 1,
-0.2011842, -1.160091, -2.896369, 1, 1, 1, 1, 1,
-0.1996066, 0.2082805, -1.845919, 1, 1, 1, 1, 1,
-0.1952598, 1.743829, 0.395468, 1, 1, 1, 1, 1,
-0.1931366, -0.8808812, -1.609198, 1, 1, 1, 1, 1,
-0.1897992, 1.702175, 0.7560851, 1, 1, 1, 1, 1,
-0.1879746, 0.9918656, 0.1041322, 0, 0, 1, 1, 1,
-0.1868208, -1.452718, -4.009106, 1, 0, 0, 1, 1,
-0.1858238, 0.2372897, 0.525856, 1, 0, 0, 1, 1,
-0.1846409, 0.4754741, -0.8367393, 1, 0, 0, 1, 1,
-0.1838985, 1.997949, -0.6955483, 1, 0, 0, 1, 1,
-0.1825379, 2.436799, -0.5310439, 1, 0, 0, 1, 1,
-0.1812254, -0.7501317, -3.369638, 0, 0, 0, 1, 1,
-0.1716615, -0.4533531, -2.821379, 0, 0, 0, 1, 1,
-0.1713113, 0.8578361, -1.021698, 0, 0, 0, 1, 1,
-0.1701902, 1.164594, 0.1702175, 0, 0, 0, 1, 1,
-0.16935, -2.620326, -2.667074, 0, 0, 0, 1, 1,
-0.1670028, -0.4620765, -2.419529, 0, 0, 0, 1, 1,
-0.1668461, 0.5924153, 0.3459179, 0, 0, 0, 1, 1,
-0.166722, 0.7225529, -0.4153809, 1, 1, 1, 1, 1,
-0.1662044, -0.3762442, -4.705183, 1, 1, 1, 1, 1,
-0.1656059, -0.6375289, -3.43281, 1, 1, 1, 1, 1,
-0.1655797, -0.1458679, -2.64059, 1, 1, 1, 1, 1,
-0.1608428, 0.4975545, 0.4635676, 1, 1, 1, 1, 1,
-0.1605294, -0.3753921, -4.217911, 1, 1, 1, 1, 1,
-0.1551439, -0.5895911, -3.380257, 1, 1, 1, 1, 1,
-0.1528476, 0.2212929, -0.7876952, 1, 1, 1, 1, 1,
-0.1466804, -0.5286331, -2.458394, 1, 1, 1, 1, 1,
-0.1455577, -0.8382462, -3.5775, 1, 1, 1, 1, 1,
-0.1425661, -0.08033999, -2.865598, 1, 1, 1, 1, 1,
-0.1419697, -1.244644, -3.959663, 1, 1, 1, 1, 1,
-0.1380529, 0.6148657, 0.6589118, 1, 1, 1, 1, 1,
-0.1360861, 1.67955, -1.556406, 1, 1, 1, 1, 1,
-0.1343948, 0.5785848, -0.002138177, 1, 1, 1, 1, 1,
-0.1328964, 0.2602789, 1.420988, 0, 0, 1, 1, 1,
-0.1314705, -0.3834188, -2.715539, 1, 0, 0, 1, 1,
-0.1301235, 1.75363, -2.008496, 1, 0, 0, 1, 1,
-0.1267091, 0.9433923, -1.214033, 1, 0, 0, 1, 1,
-0.1246465, -1.28373, -4.741977, 1, 0, 0, 1, 1,
-0.1189169, 0.3607628, -1.041314, 1, 0, 0, 1, 1,
-0.1181273, 1.042064, -1.223571, 0, 0, 0, 1, 1,
-0.1149854, 0.5503015, 0.8049679, 0, 0, 0, 1, 1,
-0.1147515, 0.0321301, -0.2671664, 0, 0, 0, 1, 1,
-0.1113943, 0.4567345, 1.344178, 0, 0, 0, 1, 1,
-0.1106359, -0.7862006, -3.948708, 0, 0, 0, 1, 1,
-0.1105088, 0.3867395, 0.1621277, 0, 0, 0, 1, 1,
-0.1097329, 0.6921342, 1.13782, 0, 0, 0, 1, 1,
-0.1091821, -0.4478887, -3.10375, 1, 1, 1, 1, 1,
-0.1078431, -0.9794754, -3.949764, 1, 1, 1, 1, 1,
-0.1030454, -0.5951333, -2.70678, 1, 1, 1, 1, 1,
-0.1028319, 1.234018, -1.409284, 1, 1, 1, 1, 1,
-0.1004406, -0.5325008, -2.512969, 1, 1, 1, 1, 1,
-0.100242, -0.755039, -3.931685, 1, 1, 1, 1, 1,
-0.09900989, 0.9897638, 0.3306699, 1, 1, 1, 1, 1,
-0.09547695, 0.4124992, 0.2588054, 1, 1, 1, 1, 1,
-0.09143084, 1.558439, -1.055167, 1, 1, 1, 1, 1,
-0.08941215, -0.7800887, -3.215967, 1, 1, 1, 1, 1,
-0.08533496, 0.06379506, -2.534167, 1, 1, 1, 1, 1,
-0.0837302, 0.09558635, 1.439501, 1, 1, 1, 1, 1,
-0.07738483, 0.3809385, 0.5773161, 1, 1, 1, 1, 1,
-0.07515763, -0.2651138, -2.35652, 1, 1, 1, 1, 1,
-0.07238888, -0.07536283, -1.868992, 1, 1, 1, 1, 1,
-0.07109695, 0.1913512, 0.001937486, 0, 0, 1, 1, 1,
-0.06693976, 0.04960261, -0.2872371, 1, 0, 0, 1, 1,
-0.06509973, -1.569861, -2.485333, 1, 0, 0, 1, 1,
-0.05643058, 0.4097381, -0.6767648, 1, 0, 0, 1, 1,
-0.0547562, -0.3794746, -2.203839, 1, 0, 0, 1, 1,
-0.0486847, -0.08878484, -2.155987, 1, 0, 0, 1, 1,
-0.04835792, -1.224094, -2.601765, 0, 0, 0, 1, 1,
-0.04743591, -2.289758, -2.595746, 0, 0, 0, 1, 1,
-0.04459227, -1.177021, -3.019723, 0, 0, 0, 1, 1,
-0.0427758, 0.1061712, -1.738162, 0, 0, 0, 1, 1,
-0.04152319, -0.800969, -3.454641, 0, 0, 0, 1, 1,
-0.04133685, -0.8511386, -2.781817, 0, 0, 0, 1, 1,
-0.03618298, -1.043552, -3.906067, 0, 0, 0, 1, 1,
-0.03468763, 0.4161214, -3.145718, 1, 1, 1, 1, 1,
-0.02882797, -1.190132, -4.052494, 1, 1, 1, 1, 1,
-0.02851742, 1.753669, -1.223536, 1, 1, 1, 1, 1,
-0.02815264, -0.116683, -3.142344, 1, 1, 1, 1, 1,
-0.02793598, 1.91675, -0.3317496, 1, 1, 1, 1, 1,
-0.02309172, 0.221315, -1.45465, 1, 1, 1, 1, 1,
-0.02208055, -1.872764, -3.885565, 1, 1, 1, 1, 1,
-0.01979367, 1.790317, 0.5591464, 1, 1, 1, 1, 1,
-0.01744544, 0.1501778, -0.962566, 1, 1, 1, 1, 1,
-0.01601945, -0.5791084, -2.328833, 1, 1, 1, 1, 1,
-0.005164812, -0.2270801, -4.643021, 1, 1, 1, 1, 1,
-0.002997478, 0.2222962, 2.025584, 1, 1, 1, 1, 1,
0.002207311, 0.5231487, 0.1606845, 1, 1, 1, 1, 1,
0.00469909, -1.083825, 2.422048, 1, 1, 1, 1, 1,
0.0053292, 1.442874, 0.5915233, 1, 1, 1, 1, 1,
0.009295098, 1.465418, -0.4800572, 0, 0, 1, 1, 1,
0.009839415, 0.3376822, -1.124186, 1, 0, 0, 1, 1,
0.01340269, -0.3652717, 2.255942, 1, 0, 0, 1, 1,
0.01367379, -1.186718, 1.667935, 1, 0, 0, 1, 1,
0.0155083, -0.3616108, 4.483154, 1, 0, 0, 1, 1,
0.01682412, 0.4447814, -1.685172, 1, 0, 0, 1, 1,
0.01796457, -0.1717068, 2.99681, 0, 0, 0, 1, 1,
0.0192354, 0.2785681, -0.6620358, 0, 0, 0, 1, 1,
0.02208238, -0.2245024, 2.068948, 0, 0, 0, 1, 1,
0.02233198, -0.8102216, 2.102474, 0, 0, 0, 1, 1,
0.0223856, -0.6167544, 4.083179, 0, 0, 0, 1, 1,
0.02317212, -1.164138, 2.738315, 0, 0, 0, 1, 1,
0.02557318, 1.763259, 1.898709, 0, 0, 0, 1, 1,
0.02995325, -0.3404745, 3.260056, 1, 1, 1, 1, 1,
0.03281604, 0.3036618, 1.544842, 1, 1, 1, 1, 1,
0.03287552, -0.9554646, 2.617735, 1, 1, 1, 1, 1,
0.03709002, 1.602942, 2.061001, 1, 1, 1, 1, 1,
0.03768513, -0.9520373, 3.612025, 1, 1, 1, 1, 1,
0.03887304, 0.434786, -1.868453, 1, 1, 1, 1, 1,
0.0398256, 0.8673988, 0.4240984, 1, 1, 1, 1, 1,
0.04365556, 0.731, -0.7260554, 1, 1, 1, 1, 1,
0.04845684, 1.173004, -0.1079898, 1, 1, 1, 1, 1,
0.05097962, -0.09568457, 1.290549, 1, 1, 1, 1, 1,
0.05581167, -0.1729732, 4.813534, 1, 1, 1, 1, 1,
0.05722413, -0.6108971, 3.735073, 1, 1, 1, 1, 1,
0.05810529, -0.7582415, 1.649734, 1, 1, 1, 1, 1,
0.06108479, -0.3236724, 1.589674, 1, 1, 1, 1, 1,
0.06110682, 0.5930499, 2.0766, 1, 1, 1, 1, 1,
0.06390518, -0.3577585, 3.681009, 0, 0, 1, 1, 1,
0.06937449, -0.9733113, 1.498825, 1, 0, 0, 1, 1,
0.07104427, -1.083135, 2.261966, 1, 0, 0, 1, 1,
0.07136519, 1.209428, -0.9026551, 1, 0, 0, 1, 1,
0.07572232, -0.02973579, 2.261446, 1, 0, 0, 1, 1,
0.07756329, 1.092173, -0.1404127, 1, 0, 0, 1, 1,
0.08003916, 0.3622014, 1.053996, 0, 0, 0, 1, 1,
0.08248366, -1.025739, 3.167424, 0, 0, 0, 1, 1,
0.08495399, 1.820914, -0.6503464, 0, 0, 0, 1, 1,
0.09086288, 0.4368924, -0.2199635, 0, 0, 0, 1, 1,
0.09379818, 1.632356, 0.7405809, 0, 0, 0, 1, 1,
0.09875401, 1.083887, 0.1060671, 0, 0, 0, 1, 1,
0.09980119, -0.9527078, 2.111514, 0, 0, 0, 1, 1,
0.1018443, 2.205544, 0.295331, 1, 1, 1, 1, 1,
0.1135499, 0.2076993, 0.3241398, 1, 1, 1, 1, 1,
0.1158473, 1.628362, -0.8751068, 1, 1, 1, 1, 1,
0.1186965, -0.1681256, 3.391536, 1, 1, 1, 1, 1,
0.1200668, -1.153185, 3.614869, 1, 1, 1, 1, 1,
0.1202563, 0.2149323, -0.1561168, 1, 1, 1, 1, 1,
0.1217839, 1.028418, 2.04985, 1, 1, 1, 1, 1,
0.1255323, -0.2502601, 2.96814, 1, 1, 1, 1, 1,
0.1300068, 0.1095453, 0.5336227, 1, 1, 1, 1, 1,
0.1320477, 1.624584, 0.6667614, 1, 1, 1, 1, 1,
0.1347675, -0.1589494, 1.740603, 1, 1, 1, 1, 1,
0.136557, 0.2044299, 2.273217, 1, 1, 1, 1, 1,
0.1402489, -0.7244698, 2.983929, 1, 1, 1, 1, 1,
0.1406429, 1.027131, -0.6603254, 1, 1, 1, 1, 1,
0.1407196, -0.9391766, 2.409471, 1, 1, 1, 1, 1,
0.1439824, -0.4319638, 2.972624, 0, 0, 1, 1, 1,
0.1455379, -2.041154, 2.825028, 1, 0, 0, 1, 1,
0.1502243, 1.267623, 0.6304996, 1, 0, 0, 1, 1,
0.1520299, -0.7764005, 3.236351, 1, 0, 0, 1, 1,
0.1556562, -0.4327759, 2.583202, 1, 0, 0, 1, 1,
0.1560644, 0.3162512, -0.6530201, 1, 0, 0, 1, 1,
0.1561719, 0.1616104, 1.316488, 0, 0, 0, 1, 1,
0.1576837, 1.587457, 1.382231, 0, 0, 0, 1, 1,
0.1584568, -0.7507178, 2.196889, 0, 0, 0, 1, 1,
0.1622516, 0.2147407, 2.329788, 0, 0, 0, 1, 1,
0.1631508, 0.2270428, 0.1172712, 0, 0, 0, 1, 1,
0.1652352, 0.00848671, 1.621041, 0, 0, 0, 1, 1,
0.1685338, 0.9950594, 1.385274, 0, 0, 0, 1, 1,
0.1689175, -0.3919514, 2.318718, 1, 1, 1, 1, 1,
0.1757137, 0.53799, 1.58401, 1, 1, 1, 1, 1,
0.1784524, -1.371732, 4.809903, 1, 1, 1, 1, 1,
0.1811255, 1.378363, 1.195419, 1, 1, 1, 1, 1,
0.1812721, -0.8888893, 1.766632, 1, 1, 1, 1, 1,
0.1890217, -0.3648072, 2.501133, 1, 1, 1, 1, 1,
0.1901103, -1.116527, 3.689842, 1, 1, 1, 1, 1,
0.1902817, 0.8913345, 1.734903, 1, 1, 1, 1, 1,
0.1910314, 0.1557056, 0.4660977, 1, 1, 1, 1, 1,
0.1911357, -1.630371, 1.958966, 1, 1, 1, 1, 1,
0.1937525, 0.4795436, 0.1065725, 1, 1, 1, 1, 1,
0.1981663, -1.101872, 4.750546, 1, 1, 1, 1, 1,
0.1996202, -0.1163478, 0.6576648, 1, 1, 1, 1, 1,
0.2037826, 0.03126909, 0.7832934, 1, 1, 1, 1, 1,
0.2045588, -1.245332, 2.049609, 1, 1, 1, 1, 1,
0.2061124, 0.7900698, 0.6908366, 0, 0, 1, 1, 1,
0.2063497, 0.08392683, 0.7349235, 1, 0, 0, 1, 1,
0.2106271, 2.581181, 0.5924707, 1, 0, 0, 1, 1,
0.2151109, -0.8755661, 2.0629, 1, 0, 0, 1, 1,
0.2204503, -0.07996, 1.880609, 1, 0, 0, 1, 1,
0.2239405, 0.7738553, 1.14958, 1, 0, 0, 1, 1,
0.2303582, -0.7905931, 3.100826, 0, 0, 0, 1, 1,
0.2375439, 0.7957637, 2.177807, 0, 0, 0, 1, 1,
0.2378517, -0.9813437, 4.341654, 0, 0, 0, 1, 1,
0.2440389, 1.283574, 0.2864794, 0, 0, 0, 1, 1,
0.2449038, -0.3499546, 2.034106, 0, 0, 0, 1, 1,
0.2450177, -0.1468469, 1.286031, 0, 0, 0, 1, 1,
0.245516, -0.6930444, 1.965709, 0, 0, 0, 1, 1,
0.2479507, 1.313168, -0.2702965, 1, 1, 1, 1, 1,
0.2545353, 0.1771848, -0.4830098, 1, 1, 1, 1, 1,
0.2562611, -0.3532954, 3.99967, 1, 1, 1, 1, 1,
0.2570718, -0.1479465, 2.715492, 1, 1, 1, 1, 1,
0.2583254, -0.1943773, 1.383984, 1, 1, 1, 1, 1,
0.2606808, -1.774089, 5.194926, 1, 1, 1, 1, 1,
0.2610601, -1.451864, 3.823149, 1, 1, 1, 1, 1,
0.2644803, 0.3446955, 0.2258332, 1, 1, 1, 1, 1,
0.2647694, 0.3937062, -0.1563105, 1, 1, 1, 1, 1,
0.2675051, -1.423632, 1.343725, 1, 1, 1, 1, 1,
0.2714091, 0.09655652, 2.360487, 1, 1, 1, 1, 1,
0.2735174, -0.1075881, 1.448268, 1, 1, 1, 1, 1,
0.2767545, -1.085181, 2.273457, 1, 1, 1, 1, 1,
0.277453, -0.6199825, 1.907688, 1, 1, 1, 1, 1,
0.2775424, 0.2596092, -0.4856816, 1, 1, 1, 1, 1,
0.2817764, 1.480498, -0.3168834, 0, 0, 1, 1, 1,
0.2892489, -1.116813, 4.845191, 1, 0, 0, 1, 1,
0.2907152, 1.117414, 0.1023637, 1, 0, 0, 1, 1,
0.3021756, -1.207222, 2.894129, 1, 0, 0, 1, 1,
0.3073516, -1.13179, 2.90963, 1, 0, 0, 1, 1,
0.3088095, 0.8736092, -0.1566201, 1, 0, 0, 1, 1,
0.3124253, 0.1182311, 3.089062, 0, 0, 0, 1, 1,
0.3197958, 0.1620794, 1.191287, 0, 0, 0, 1, 1,
0.32032, 0.8251134, 1.801566, 0, 0, 0, 1, 1,
0.3206279, -0.04574497, 2.396862, 0, 0, 0, 1, 1,
0.3214909, -1.759558, 3.15268, 0, 0, 0, 1, 1,
0.3298344, 0.05662511, -0.1650999, 0, 0, 0, 1, 1,
0.3299651, -0.3551719, 1.818479, 0, 0, 0, 1, 1,
0.3315902, 0.2003252, 0.1055223, 1, 1, 1, 1, 1,
0.3340276, 1.847362, 0.7226618, 1, 1, 1, 1, 1,
0.3371266, -1.727771, 2.509799, 1, 1, 1, 1, 1,
0.3408163, -0.984446, 2.365385, 1, 1, 1, 1, 1,
0.3432077, -0.1864718, 2.246762, 1, 1, 1, 1, 1,
0.3459717, 0.103909, 0.4801308, 1, 1, 1, 1, 1,
0.3463277, 0.4651064, 2.763817, 1, 1, 1, 1, 1,
0.3485729, -1.1645, 3.574663, 1, 1, 1, 1, 1,
0.351171, 0.6629188, 1.773774, 1, 1, 1, 1, 1,
0.3520775, 0.4376048, 1.636452, 1, 1, 1, 1, 1,
0.3530374, 0.486032, 0.9102997, 1, 1, 1, 1, 1,
0.3546774, 0.5804689, 0.3694287, 1, 1, 1, 1, 1,
0.3553987, 0.5513713, 1.671323, 1, 1, 1, 1, 1,
0.3653274, -2.002986, 4.00019, 1, 1, 1, 1, 1,
0.3707703, -0.4467281, 1.51487, 1, 1, 1, 1, 1,
0.377991, -1.262377, 5.136142, 0, 0, 1, 1, 1,
0.37908, -0.619203, 2.251239, 1, 0, 0, 1, 1,
0.3855188, 0.7392232, 0.140782, 1, 0, 0, 1, 1,
0.3925472, -1.105814, 2.784051, 1, 0, 0, 1, 1,
0.3980743, 0.9459294, 1.997646, 1, 0, 0, 1, 1,
0.4053308, 1.191513, -0.2220261, 1, 0, 0, 1, 1,
0.4060073, -0.2164046, 1.302645, 0, 0, 0, 1, 1,
0.4099677, 0.9215627, -0.1320382, 0, 0, 0, 1, 1,
0.410608, 0.05440889, 1.660434, 0, 0, 0, 1, 1,
0.4141019, -0.0350613, 1.898181, 0, 0, 0, 1, 1,
0.4187948, -0.3483458, 1.796953, 0, 0, 0, 1, 1,
0.4194579, 0.01097243, 2.289, 0, 0, 0, 1, 1,
0.4214809, 1.458918, -1.396613, 0, 0, 0, 1, 1,
0.4225408, 0.04105389, 2.372825, 1, 1, 1, 1, 1,
0.4340972, 1.34402, -1.007636, 1, 1, 1, 1, 1,
0.435239, -0.592858, 2.186961, 1, 1, 1, 1, 1,
0.4357612, 0.5718507, 0.5462398, 1, 1, 1, 1, 1,
0.4423838, 0.5538229, 0.5400087, 1, 1, 1, 1, 1,
0.446968, -1.809029, 0.4892614, 1, 1, 1, 1, 1,
0.4492867, 0.5000174, 0.9599551, 1, 1, 1, 1, 1,
0.4548514, 0.4137795, 1.896424, 1, 1, 1, 1, 1,
0.465071, 0.729377, -0.659202, 1, 1, 1, 1, 1,
0.4691623, 0.5390118, 2.335889, 1, 1, 1, 1, 1,
0.4733502, -1.136483, 3.167416, 1, 1, 1, 1, 1,
0.4736651, 1.189473, 0.7767428, 1, 1, 1, 1, 1,
0.481785, 0.04113542, 1.839822, 1, 1, 1, 1, 1,
0.4832103, -0.4288761, 2.093109, 1, 1, 1, 1, 1,
0.4840043, -1.639837, 2.394612, 1, 1, 1, 1, 1,
0.4865131, -0.12703, 3.534839, 0, 0, 1, 1, 1,
0.4869525, 0.0392665, 0.4289045, 1, 0, 0, 1, 1,
0.4875852, -1.782917, 3.693406, 1, 0, 0, 1, 1,
0.4944426, 2.216457, 0.4378, 1, 0, 0, 1, 1,
0.4963105, 0.3771971, 1.223436, 1, 0, 0, 1, 1,
0.4973031, -0.3850571, 2.407624, 1, 0, 0, 1, 1,
0.4977381, 0.5756734, 0.08966656, 0, 0, 0, 1, 1,
0.5100299, 0.1111516, 2.037258, 0, 0, 0, 1, 1,
0.5160172, -0.05841411, 1.181692, 0, 0, 0, 1, 1,
0.5163151, -0.05287703, 1.873481, 0, 0, 0, 1, 1,
0.5197138, 1.121138, 0.8108861, 0, 0, 0, 1, 1,
0.5217189, -3.339944, 1.70744, 0, 0, 0, 1, 1,
0.5226921, -1.606808, 2.670139, 0, 0, 0, 1, 1,
0.5233905, 0.2570752, 0.6315202, 1, 1, 1, 1, 1,
0.5250165, 0.3709853, 0.7739841, 1, 1, 1, 1, 1,
0.5364698, -1.569399, 1.909234, 1, 1, 1, 1, 1,
0.5371361, -1.209583, 3.15928, 1, 1, 1, 1, 1,
0.5396569, -0.3064193, 2.290963, 1, 1, 1, 1, 1,
0.5415327, 0.1029258, 2.438294, 1, 1, 1, 1, 1,
0.5435602, -0.6615367, 3.513029, 1, 1, 1, 1, 1,
0.5509846, 0.2105566, 1.887329, 1, 1, 1, 1, 1,
0.5536351, -2.020092, 2.61671, 1, 1, 1, 1, 1,
0.5544558, 0.8743225, 1.369801, 1, 1, 1, 1, 1,
0.5595474, -1.321344, 3.190652, 1, 1, 1, 1, 1,
0.5597741, 1.771275, 0.2654111, 1, 1, 1, 1, 1,
0.5613202, -0.6452059, 1.629367, 1, 1, 1, 1, 1,
0.5628853, 1.34758, -0.2692885, 1, 1, 1, 1, 1,
0.5667756, 0.3205039, 0.3610573, 1, 1, 1, 1, 1,
0.5673102, 0.3667039, 2.764101, 0, 0, 1, 1, 1,
0.568768, 0.1309679, 0.9921196, 1, 0, 0, 1, 1,
0.5701539, -0.9603632, 0.8349876, 1, 0, 0, 1, 1,
0.5710215, -0.7830462, 1.535604, 1, 0, 0, 1, 1,
0.5745268, 1.187005, 0.1199555, 1, 0, 0, 1, 1,
0.5804055, 0.5499768, 0.8404835, 1, 0, 0, 1, 1,
0.5902747, 1.331578, 1.440314, 0, 0, 0, 1, 1,
0.5914208, 0.7668272, 1.015135, 0, 0, 0, 1, 1,
0.5920916, 0.138225, 0.8380791, 0, 0, 0, 1, 1,
0.5959686, 0.4221895, 1.316413, 0, 0, 0, 1, 1,
0.59694, -2.180502, 2.81277, 0, 0, 0, 1, 1,
0.6025736, -0.5617666, 3.204165, 0, 0, 0, 1, 1,
0.6100267, 0.5063969, 0.3076215, 0, 0, 0, 1, 1,
0.6110049, 0.6943779, 0.91104, 1, 1, 1, 1, 1,
0.6149189, -0.3621908, 1.313112, 1, 1, 1, 1, 1,
0.6185184, -1.46147, 2.514848, 1, 1, 1, 1, 1,
0.6251336, -0.5238219, 1.323396, 1, 1, 1, 1, 1,
0.6355729, 1.021314, 1.831019, 1, 1, 1, 1, 1,
0.6456711, 1.63971, -1.494496, 1, 1, 1, 1, 1,
0.6498111, -2.133673, 2.705823, 1, 1, 1, 1, 1,
0.6584305, 0.7875347, 1.385118, 1, 1, 1, 1, 1,
0.6601751, -0.4483827, 0.6058618, 1, 1, 1, 1, 1,
0.6631759, -0.224394, 0.6104577, 1, 1, 1, 1, 1,
0.6648275, 0.3382963, 1.941522, 1, 1, 1, 1, 1,
0.6751536, -2.600037, 1.808019, 1, 1, 1, 1, 1,
0.6776465, -0.371535, 0.2606483, 1, 1, 1, 1, 1,
0.6882247, -1.764713, 1.867728, 1, 1, 1, 1, 1,
0.694919, 0.9617528, 0.5383964, 1, 1, 1, 1, 1,
0.6992586, -1.161564, 1.242885, 0, 0, 1, 1, 1,
0.6996064, -1.34551, 2.510536, 1, 0, 0, 1, 1,
0.7010652, -0.6574711, 2.027073, 1, 0, 0, 1, 1,
0.7058886, 1.320678, 0.569025, 1, 0, 0, 1, 1,
0.7077938, -0.7218537, 2.040864, 1, 0, 0, 1, 1,
0.7101078, -0.1389627, 1.98039, 1, 0, 0, 1, 1,
0.7125832, 0.4860055, 0.9017141, 0, 0, 0, 1, 1,
0.7139925, -0.5256507, 1.317547, 0, 0, 0, 1, 1,
0.7171444, 1.561511, -0.5978932, 0, 0, 0, 1, 1,
0.7211617, -1.216725, 3.869375, 0, 0, 0, 1, 1,
0.7256761, -2.347294, 3.530039, 0, 0, 0, 1, 1,
0.7292644, -1.345673, 1.724507, 0, 0, 0, 1, 1,
0.7317635, 0.2006679, 2.502075, 0, 0, 0, 1, 1,
0.7363251, -0.03459617, 1.088083, 1, 1, 1, 1, 1,
0.7379138, -2.293199, 3.39496, 1, 1, 1, 1, 1,
0.7399145, -0.2580939, 2.153894, 1, 1, 1, 1, 1,
0.7401005, 1.24947, -0.8524951, 1, 1, 1, 1, 1,
0.7455438, -2.338221, 3.003443, 1, 1, 1, 1, 1,
0.7461511, 1.27629, 0.1304465, 1, 1, 1, 1, 1,
0.7499022, -1.182446, 1.761163, 1, 1, 1, 1, 1,
0.7595787, -0.5646687, 2.612866, 1, 1, 1, 1, 1,
0.760331, -1.227599, 2.144374, 1, 1, 1, 1, 1,
0.7646632, -0.5540352, 3.347478, 1, 1, 1, 1, 1,
0.7711524, 1.23092, 1.977064, 1, 1, 1, 1, 1,
0.7783785, 1.671756, 0.2227842, 1, 1, 1, 1, 1,
0.7821181, -0.5266941, 2.863735, 1, 1, 1, 1, 1,
0.7838601, -0.1988541, 2.280855, 1, 1, 1, 1, 1,
0.7840752, -1.403441, 2.305316, 1, 1, 1, 1, 1,
0.7926433, 1.300999, 1.562323, 0, 0, 1, 1, 1,
0.7935662, 0.4324882, 1.30737, 1, 0, 0, 1, 1,
0.8008091, -0.5455085, 1.254604, 1, 0, 0, 1, 1,
0.8063864, -1.088951, 3.16914, 1, 0, 0, 1, 1,
0.8092051, 0.01543878, 2.055926, 1, 0, 0, 1, 1,
0.8280334, 0.0626452, -0.2918157, 1, 0, 0, 1, 1,
0.8323938, -0.8963771, 2.851056, 0, 0, 0, 1, 1,
0.8331149, -1.119244, 3.369859, 0, 0, 0, 1, 1,
0.8390321, 0.3734554, 1.894675, 0, 0, 0, 1, 1,
0.8393943, -0.9772859, 1.710285, 0, 0, 0, 1, 1,
0.8422037, 1.960862, -0.4714131, 0, 0, 0, 1, 1,
0.8556038, 0.9138021, 0.3298669, 0, 0, 0, 1, 1,
0.8625539, -0.1541574, 2.758284, 0, 0, 0, 1, 1,
0.863641, 0.857483, 1.187453, 1, 1, 1, 1, 1,
0.8672287, 0.8790997, 0.4738287, 1, 1, 1, 1, 1,
0.869249, -0.2095703, 1.30011, 1, 1, 1, 1, 1,
0.8699586, -0.2672668, 1.346567, 1, 1, 1, 1, 1,
0.8831714, 0.01679814, 1.540357, 1, 1, 1, 1, 1,
0.8838922, -0.8706788, 3.740457, 1, 1, 1, 1, 1,
0.8841732, 1.206968, 0.5070629, 1, 1, 1, 1, 1,
0.8845165, 2.783208, -0.8443961, 1, 1, 1, 1, 1,
0.8862953, -0.9028928, 2.716274, 1, 1, 1, 1, 1,
0.8943729, -0.6106718, 2.467087, 1, 1, 1, 1, 1,
0.8991592, -0.4858594, 0.4785589, 1, 1, 1, 1, 1,
0.9020588, -0.7630724, 2.882484, 1, 1, 1, 1, 1,
0.9084103, -1.947836, 2.875203, 1, 1, 1, 1, 1,
0.9155889, -0.5941096, 2.678197, 1, 1, 1, 1, 1,
0.9203697, 0.01172383, 1.99345, 1, 1, 1, 1, 1,
0.9244649, -0.5958156, 2.237437, 0, 0, 1, 1, 1,
0.9272899, 0.8703896, 1.204439, 1, 0, 0, 1, 1,
0.9282179, 0.6206866, 1.503297, 1, 0, 0, 1, 1,
0.9345995, -0.6235073, 2.613855, 1, 0, 0, 1, 1,
0.937556, 0.2732155, 2.296365, 1, 0, 0, 1, 1,
0.9385673, 0.7098132, 2.702362, 1, 0, 0, 1, 1,
0.9411784, -2.022824, 1.680706, 0, 0, 0, 1, 1,
0.9420453, -0.1046149, 1.242592, 0, 0, 0, 1, 1,
0.9436136, -0.146933, 0.2961313, 0, 0, 0, 1, 1,
0.9458869, -1.890432, 3.464549, 0, 0, 0, 1, 1,
0.9518705, -0.4514813, 3.408072, 0, 0, 0, 1, 1,
0.9546348, 2.196393, 1.589023, 0, 0, 0, 1, 1,
0.969848, -0.1576967, -0.910194, 0, 0, 0, 1, 1,
0.9813363, -0.09876662, -0.1426934, 1, 1, 1, 1, 1,
0.9817534, 0.6460685, -0.1226261, 1, 1, 1, 1, 1,
0.982783, -0.4318526, 0.991363, 1, 1, 1, 1, 1,
0.9829557, 0.3620326, 2.426585, 1, 1, 1, 1, 1,
0.9837479, -0.7844495, 3.758068, 1, 1, 1, 1, 1,
0.985194, 1.084228, 1.648066, 1, 1, 1, 1, 1,
0.988298, -0.5449623, 1.986147, 1, 1, 1, 1, 1,
0.9982119, -0.194019, -0.08617893, 1, 1, 1, 1, 1,
1.003279, 1.121724, 1.637693, 1, 1, 1, 1, 1,
1.013792, 1.550114, -0.8463175, 1, 1, 1, 1, 1,
1.018197, 1.199926, 0.132968, 1, 1, 1, 1, 1,
1.022993, 0.8188176, -0.06664796, 1, 1, 1, 1, 1,
1.039164, -0.7018347, 2.94495, 1, 1, 1, 1, 1,
1.042922, 0.8394791, 0.786597, 1, 1, 1, 1, 1,
1.045628, -0.9763169, 2.773868, 1, 1, 1, 1, 1,
1.048766, 0.6791983, 1.820832, 0, 0, 1, 1, 1,
1.069919, -0.1909296, 1.847183, 1, 0, 0, 1, 1,
1.071925, -0.9816301, 0.6259918, 1, 0, 0, 1, 1,
1.072328, -2.135231, 2.327729, 1, 0, 0, 1, 1,
1.072466, -0.4144405, 1.121447, 1, 0, 0, 1, 1,
1.073491, -0.5734164, 2.274405, 1, 0, 0, 1, 1,
1.080632, -0.9782594, 2.515447, 0, 0, 0, 1, 1,
1.082659, -1.50906, 2.322586, 0, 0, 0, 1, 1,
1.083867, -0.8184596, 2.867834, 0, 0, 0, 1, 1,
1.096071, -0.7168221, 2.373493, 0, 0, 0, 1, 1,
1.105165, 0.8834293, -1.287622, 0, 0, 0, 1, 1,
1.108873, 0.01351178, 2.507249, 0, 0, 0, 1, 1,
1.112589, -0.07915014, 3.001909, 0, 0, 0, 1, 1,
1.113901, 2.389313, 0.4939138, 1, 1, 1, 1, 1,
1.113915, -0.1398271, -0.9896985, 1, 1, 1, 1, 1,
1.114831, -0.649344, 0.6573654, 1, 1, 1, 1, 1,
1.116292, -2.649042, 1.502403, 1, 1, 1, 1, 1,
1.117093, -0.3982157, 1.782022, 1, 1, 1, 1, 1,
1.145047, -1.412762, 2.273415, 1, 1, 1, 1, 1,
1.14682, 0.3746746, -1.227974, 1, 1, 1, 1, 1,
1.152829, -0.1576106, 0.8878209, 1, 1, 1, 1, 1,
1.153373, -0.3903853, 2.630151, 1, 1, 1, 1, 1,
1.15769, 0.7380481, -0.02365798, 1, 1, 1, 1, 1,
1.157937, -1.188348, 2.662704, 1, 1, 1, 1, 1,
1.160413, -0.4851427, 2.514242, 1, 1, 1, 1, 1,
1.164008, 0.1542828, 1.858284, 1, 1, 1, 1, 1,
1.166334, -0.3401145, 1.398187, 1, 1, 1, 1, 1,
1.173077, 0.8396791, -0.01692674, 1, 1, 1, 1, 1,
1.179459, -0.3166316, 0.9933835, 0, 0, 1, 1, 1,
1.180619, -0.02350781, 0.02113172, 1, 0, 0, 1, 1,
1.192732, -0.6617129, 1.451343, 1, 0, 0, 1, 1,
1.193484, -1.548049, 1.465677, 1, 0, 0, 1, 1,
1.197589, -1.863801, 3.677962, 1, 0, 0, 1, 1,
1.200226, -0.1914069, 2.048492, 1, 0, 0, 1, 1,
1.217213, -0.4563045, 3.351008, 0, 0, 0, 1, 1,
1.227054, -0.420645, 1.624295, 0, 0, 0, 1, 1,
1.230985, 1.1656, 2.116229, 0, 0, 0, 1, 1,
1.233399, -0.08133479, -0.4191097, 0, 0, 0, 1, 1,
1.238031, -0.03040638, 2.7172, 0, 0, 0, 1, 1,
1.256865, 1.055489, 1.222494, 0, 0, 0, 1, 1,
1.256949, -0.05877512, 2.256883, 0, 0, 0, 1, 1,
1.258235, -0.2640205, 2.08673, 1, 1, 1, 1, 1,
1.269795, -0.5568013, 0.8217327, 1, 1, 1, 1, 1,
1.271896, -0.5147341, 2.871294, 1, 1, 1, 1, 1,
1.273325, 0.58205, 2.342332, 1, 1, 1, 1, 1,
1.274929, -0.7700818, 2.485802, 1, 1, 1, 1, 1,
1.281408, 0.09135314, 1.765132, 1, 1, 1, 1, 1,
1.291728, 0.9147557, 2.277387, 1, 1, 1, 1, 1,
1.299895, 0.440682, -0.6015139, 1, 1, 1, 1, 1,
1.303695, 0.1238532, -0.03538963, 1, 1, 1, 1, 1,
1.314062, 0.3272296, 1.994553, 1, 1, 1, 1, 1,
1.314247, 0.0001135551, 2.530056, 1, 1, 1, 1, 1,
1.317449, 2.084545, 1.055733, 1, 1, 1, 1, 1,
1.320271, 1.67458, -0.6246, 1, 1, 1, 1, 1,
1.320323, 0.5851553, 1.317367, 1, 1, 1, 1, 1,
1.320464, -0.02566029, 1.616577, 1, 1, 1, 1, 1,
1.320998, 1.241171, 1.54411, 0, 0, 1, 1, 1,
1.32206, -0.8956625, 1.527021, 1, 0, 0, 1, 1,
1.326679, 0.9880205, -0.1281598, 1, 0, 0, 1, 1,
1.32697, -0.03773893, 2.072427, 1, 0, 0, 1, 1,
1.337525, -1.512709, 2.256662, 1, 0, 0, 1, 1,
1.341974, -0.9126303, 1.207512, 1, 0, 0, 1, 1,
1.346859, 0.3465905, 1.927391, 0, 0, 0, 1, 1,
1.348998, -0.9694524, 2.477007, 0, 0, 0, 1, 1,
1.34965, 0.1135988, 2.896185, 0, 0, 0, 1, 1,
1.351213, -1.329026, 3.705921, 0, 0, 0, 1, 1,
1.351683, -0.4411235, 0.8116074, 0, 0, 0, 1, 1,
1.353951, -0.1778865, 0.9596104, 0, 0, 0, 1, 1,
1.354505, -0.4404929, 1.042632, 0, 0, 0, 1, 1,
1.355475, 0.6199551, -0.1390598, 1, 1, 1, 1, 1,
1.359297, 0.7759011, -0.7954227, 1, 1, 1, 1, 1,
1.36248, 0.3114563, -0.4589897, 1, 1, 1, 1, 1,
1.363781, -1.910087, 2.726054, 1, 1, 1, 1, 1,
1.369271, -0.5509022, 2.477214, 1, 1, 1, 1, 1,
1.371281, 1.327065, 0.3692648, 1, 1, 1, 1, 1,
1.373216, 0.2725562, 2.070074, 1, 1, 1, 1, 1,
1.37792, -2.659587, 2.811463, 1, 1, 1, 1, 1,
1.378848, -0.3524219, 2.662466, 1, 1, 1, 1, 1,
1.390507, -0.4291131, 1.642454, 1, 1, 1, 1, 1,
1.401232, 0.3257735, -1.066929, 1, 1, 1, 1, 1,
1.411851, 1.463024, -0.1493627, 1, 1, 1, 1, 1,
1.422089, -0.976333, 1.826133, 1, 1, 1, 1, 1,
1.423809, -0.4747468, 2.485589, 1, 1, 1, 1, 1,
1.426606, -0.6940229, 3.57829, 1, 1, 1, 1, 1,
1.427094, -1.710446, 1.289052, 0, 0, 1, 1, 1,
1.435772, 0.5283097, -0.2497208, 1, 0, 0, 1, 1,
1.44434, 0.3277581, 2.769669, 1, 0, 0, 1, 1,
1.446063, -0.4008708, -0.3423345, 1, 0, 0, 1, 1,
1.461336, -1.661184, 0.7087918, 1, 0, 0, 1, 1,
1.464619, 1.834922, 1.107522, 1, 0, 0, 1, 1,
1.469215, -1.848919, 2.30053, 0, 0, 0, 1, 1,
1.491549, -1.327565, 1.090562, 0, 0, 0, 1, 1,
1.513857, 0.1542871, 1.770887, 0, 0, 0, 1, 1,
1.515508, 0.5623953, 1.088059, 0, 0, 0, 1, 1,
1.521011, 1.886094, 0.7017531, 0, 0, 0, 1, 1,
1.526329, 1.538576, 1.746881, 0, 0, 0, 1, 1,
1.531071, -0.06594045, 1.627201, 0, 0, 0, 1, 1,
1.553272, 0.6765054, 2.04547, 1, 1, 1, 1, 1,
1.571043, 1.418067, 2.767152, 1, 1, 1, 1, 1,
1.576828, 0.422588, 2.44309, 1, 1, 1, 1, 1,
1.578006, 0.7375731, 0.579213, 1, 1, 1, 1, 1,
1.590127, -1.180679, 2.343313, 1, 1, 1, 1, 1,
1.609484, -0.02799763, 1.447005, 1, 1, 1, 1, 1,
1.609556, 1.167285, 0.9781013, 1, 1, 1, 1, 1,
1.618115, 0.2709041, 1.48306, 1, 1, 1, 1, 1,
1.624348, 0.6372118, 1.605538, 1, 1, 1, 1, 1,
1.629797, -1.431122, 2.800537, 1, 1, 1, 1, 1,
1.643182, 1.652584, -0.5853274, 1, 1, 1, 1, 1,
1.652006, 0.03062085, 2.048131, 1, 1, 1, 1, 1,
1.662641, -0.9715692, 0.08757758, 1, 1, 1, 1, 1,
1.677853, -0.2194918, 2.902082, 1, 1, 1, 1, 1,
1.678673, 1.598437, 0.7809263, 1, 1, 1, 1, 1,
1.70216, 0.6290489, 3.855827, 0, 0, 1, 1, 1,
1.702427, 1.831889, 0.7424487, 1, 0, 0, 1, 1,
1.717528, 1.059537, 0.3387163, 1, 0, 0, 1, 1,
1.717669, 0.6430786, 0.1986109, 1, 0, 0, 1, 1,
1.740786, 0.2176567, 3.414308, 1, 0, 0, 1, 1,
1.741951, 1.276398, -1.122414, 1, 0, 0, 1, 1,
1.742664, 3.231972, -0.1909515, 0, 0, 0, 1, 1,
1.760363, 0.6837698, 2.646218, 0, 0, 0, 1, 1,
1.768946, -1.442542, 1.293085, 0, 0, 0, 1, 1,
1.773197, -1.313818, 2.265257, 0, 0, 0, 1, 1,
1.801605, -1.367751, 3.447803, 0, 0, 0, 1, 1,
1.81679, 0.3870381, 0.7273155, 0, 0, 0, 1, 1,
1.830486, -1.178945, -0.1163545, 0, 0, 0, 1, 1,
1.847782, -1.391428, 1.314598, 1, 1, 1, 1, 1,
1.852036, -0.3141828, 2.161946, 1, 1, 1, 1, 1,
1.874195, 2.011016, 0.04854223, 1, 1, 1, 1, 1,
1.89483, -0.8948035, 1.088939, 1, 1, 1, 1, 1,
1.919147, 0.5553916, 2.127875, 1, 1, 1, 1, 1,
1.941864, 1.140639, -0.882928, 1, 1, 1, 1, 1,
1.951481, -0.03378531, 0.3331175, 1, 1, 1, 1, 1,
1.955265, 0.2214706, 1.355451, 1, 1, 1, 1, 1,
1.955499, -0.2806703, 2.093453, 1, 1, 1, 1, 1,
1.975565, 0.3362247, 0.2469636, 1, 1, 1, 1, 1,
1.993097, 0.5537433, 2.547439, 1, 1, 1, 1, 1,
2.009588, 0.3675252, 2.051182, 1, 1, 1, 1, 1,
2.016293, 0.23162, -0.5729548, 1, 1, 1, 1, 1,
2.030239, -1.22162, 3.616765, 1, 1, 1, 1, 1,
2.030441, -0.4779233, -0.1756974, 1, 1, 1, 1, 1,
2.034765, 0.1552792, 0.9325755, 0, 0, 1, 1, 1,
2.065779, -0.2563275, 0.8642152, 1, 0, 0, 1, 1,
2.089578, 0.1227813, 0.719395, 1, 0, 0, 1, 1,
2.092395, -1.14272, 3.019048, 1, 0, 0, 1, 1,
2.114036, -0.2878522, 2.598818, 1, 0, 0, 1, 1,
2.14711, 0.984409, 2.685573, 1, 0, 0, 1, 1,
2.15277, 0.7522696, 0.7815133, 0, 0, 0, 1, 1,
2.210094, 1.322064, 1.104138, 0, 0, 0, 1, 1,
2.23196, -0.4064782, 1.987502, 0, 0, 0, 1, 1,
2.257962, 0.001961728, 0.07729053, 0, 0, 0, 1, 1,
2.308136, 0.121198, 0.5914978, 0, 0, 0, 1, 1,
2.332124, 2.253165, 1.077415, 0, 0, 0, 1, 1,
2.343134, 1.612169, 3.170078, 0, 0, 0, 1, 1,
2.435722, 0.8330604, 1.668016, 1, 1, 1, 1, 1,
2.585607, 0.6162469, 3.648844, 1, 1, 1, 1, 1,
2.598145, 1.501428, 1.019882, 1, 1, 1, 1, 1,
2.696584, -0.03678627, 2.623515, 1, 1, 1, 1, 1,
2.892891, -0.1878743, 2.162904, 1, 1, 1, 1, 1,
2.923993, -1.076684, 2.171519, 1, 1, 1, 1, 1,
3.037163, 0.6609571, 0.9656848, 1, 1, 1, 1, 1
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
var radius = 9.470578;
var distance = 33.265;
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
mvMatrix.translate( 0.07062602, 0.05398607, 0.04062772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.265);
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
