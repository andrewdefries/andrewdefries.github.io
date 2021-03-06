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
-3.278765, -1.282787, -2.01506, 1, 0, 0, 1,
-3.274382, 0.430284, -1.703208, 1, 0.007843138, 0, 1,
-3.175492, 0.3814291, -1.311578, 1, 0.01176471, 0, 1,
-2.929446, 1.115979, 0.721718, 1, 0.01960784, 0, 1,
-2.828298, 2.083019, -1.031265, 1, 0.02352941, 0, 1,
-2.797496, -0.5001448, -1.760865, 1, 0.03137255, 0, 1,
-2.737329, 0.270339, -1.199964, 1, 0.03529412, 0, 1,
-2.666657, -0.6412095, 0.009476395, 1, 0.04313726, 0, 1,
-2.60411, 0.5576649, -2.316917, 1, 0.04705882, 0, 1,
-2.570063, -1.272267, -4.227323, 1, 0.05490196, 0, 1,
-2.393038, -0.5315968, -1.622847, 1, 0.05882353, 0, 1,
-2.351503, -0.8610374, -1.584052, 1, 0.06666667, 0, 1,
-2.311954, 0.07214234, -2.007459, 1, 0.07058824, 0, 1,
-2.239732, 0.9638498, -1.181164, 1, 0.07843138, 0, 1,
-2.232252, 0.8518713, -0.3329386, 1, 0.08235294, 0, 1,
-2.185889, 2.725572, -1.508424, 1, 0.09019608, 0, 1,
-2.173805, -0.3897142, -1.672986, 1, 0.09411765, 0, 1,
-2.146662, -0.03049765, -2.865123, 1, 0.1019608, 0, 1,
-2.133991, 0.2655978, -2.074813, 1, 0.1098039, 0, 1,
-2.118818, 0.4044271, -1.534225, 1, 0.1137255, 0, 1,
-2.117632, 0.3307464, -2.208642, 1, 0.1215686, 0, 1,
-2.096177, -1.023619, -2.53133, 1, 0.1254902, 0, 1,
-2.095253, -0.5196766, -1.396437, 1, 0.1333333, 0, 1,
-2.069122, -0.4010417, -2.347828, 1, 0.1372549, 0, 1,
-2.046248, -0.4843226, -3.011846, 1, 0.145098, 0, 1,
-2.008061, -0.8724473, -1.282612, 1, 0.1490196, 0, 1,
-2.005678, -1.563784, -1.071457, 1, 0.1568628, 0, 1,
-1.988289, 1.849189, 0.2270453, 1, 0.1607843, 0, 1,
-1.938855, -0.4552326, -1.400787, 1, 0.1686275, 0, 1,
-1.929302, 0.1657679, -2.454293, 1, 0.172549, 0, 1,
-1.926649, -0.7570816, -1.801228, 1, 0.1803922, 0, 1,
-1.8932, -2.341642, -1.870983, 1, 0.1843137, 0, 1,
-1.859058, 0.03742142, -0.9460599, 1, 0.1921569, 0, 1,
-1.826823, -0.2016718, -4.230557, 1, 0.1960784, 0, 1,
-1.779204, -1.389858, -1.326522, 1, 0.2039216, 0, 1,
-1.776501, 0.7900504, -0.4324763, 1, 0.2117647, 0, 1,
-1.775732, -0.5294471, -0.5347165, 1, 0.2156863, 0, 1,
-1.768666, 1.209009, -0.6851488, 1, 0.2235294, 0, 1,
-1.756173, -1.692934, -3.030128, 1, 0.227451, 0, 1,
-1.728676, 0.9765236, -1.679179, 1, 0.2352941, 0, 1,
-1.724496, 0.401767, -0.606979, 1, 0.2392157, 0, 1,
-1.720155, -1.078814, -3.817592, 1, 0.2470588, 0, 1,
-1.713238, 0.3451903, -0.5229458, 1, 0.2509804, 0, 1,
-1.708522, 1.840849, -1.225718, 1, 0.2588235, 0, 1,
-1.667603, -2.130197, -3.206249, 1, 0.2627451, 0, 1,
-1.648598, 0.2367246, -0.7825634, 1, 0.2705882, 0, 1,
-1.637757, 0.04478708, -0.3049001, 1, 0.2745098, 0, 1,
-1.612819, -0.5293934, -1.656289, 1, 0.282353, 0, 1,
-1.581905, 1.775512, -1.315406, 1, 0.2862745, 0, 1,
-1.581599, 1.09183, 0.1521771, 1, 0.2941177, 0, 1,
-1.579066, -2.237919, -2.619449, 1, 0.3019608, 0, 1,
-1.577635, -0.6118476, -0.07496589, 1, 0.3058824, 0, 1,
-1.568976, 0.4059618, -1.657275, 1, 0.3137255, 0, 1,
-1.564963, 0.1335851, -1.909694, 1, 0.3176471, 0, 1,
-1.554807, 1.663834, -0.9976066, 1, 0.3254902, 0, 1,
-1.541792, -1.418239, -2.002998, 1, 0.3294118, 0, 1,
-1.537098, 1.553723, -0.6625335, 1, 0.3372549, 0, 1,
-1.535847, 0.3432399, -0.4853115, 1, 0.3411765, 0, 1,
-1.534318, -0.6754424, -3.086044, 1, 0.3490196, 0, 1,
-1.529768, -1.40475, -3.94224, 1, 0.3529412, 0, 1,
-1.529502, 1.863778, -1.77294, 1, 0.3607843, 0, 1,
-1.528245, 1.36107, -1.184267, 1, 0.3647059, 0, 1,
-1.52566, -0.2058493, 0.941559, 1, 0.372549, 0, 1,
-1.523204, 0.6523542, -2.156667, 1, 0.3764706, 0, 1,
-1.51802, 0.1947855, -0.133004, 1, 0.3843137, 0, 1,
-1.505835, -0.9041291, -3.134713, 1, 0.3882353, 0, 1,
-1.505157, -0.1759977, -2.924444, 1, 0.3960784, 0, 1,
-1.504429, 1.067863, -0.4040759, 1, 0.4039216, 0, 1,
-1.502935, 1.966183, 0.8948021, 1, 0.4078431, 0, 1,
-1.495765, 0.5570208, -2.617548, 1, 0.4156863, 0, 1,
-1.473182, 0.6724679, -0.8253159, 1, 0.4196078, 0, 1,
-1.461239, 0.8547376, -0.7263392, 1, 0.427451, 0, 1,
-1.458001, 0.7548122, 0.1783897, 1, 0.4313726, 0, 1,
-1.457335, 1.223613, -0.7105929, 1, 0.4392157, 0, 1,
-1.455392, -1.26947, -2.052242, 1, 0.4431373, 0, 1,
-1.452196, -0.4575341, -1.332118, 1, 0.4509804, 0, 1,
-1.451458, -0.2669373, -1.186456, 1, 0.454902, 0, 1,
-1.44195, -1.01281, -0.1271258, 1, 0.4627451, 0, 1,
-1.436637, 0.5165698, -0.1850089, 1, 0.4666667, 0, 1,
-1.422124, 0.4104883, -0.08077869, 1, 0.4745098, 0, 1,
-1.416118, -1.710777, -0.8744854, 1, 0.4784314, 0, 1,
-1.378381, -1.175311, -2.418895, 1, 0.4862745, 0, 1,
-1.377534, 1.625867, -1.647971, 1, 0.4901961, 0, 1,
-1.372741, -0.9980829, -2.673903, 1, 0.4980392, 0, 1,
-1.366051, -1.178623, -2.039567, 1, 0.5058824, 0, 1,
-1.359252, 0.2683708, -0.1300775, 1, 0.509804, 0, 1,
-1.353923, -0.2511377, -3.385453, 1, 0.5176471, 0, 1,
-1.342183, 0.6843233, -0.3359427, 1, 0.5215687, 0, 1,
-1.337302, -0.9649456, -2.35369, 1, 0.5294118, 0, 1,
-1.318687, 0.05878109, -3.656174, 1, 0.5333334, 0, 1,
-1.316387, -1.455232, -2.175818, 1, 0.5411765, 0, 1,
-1.315548, 0.2519154, -1.878069, 1, 0.5450981, 0, 1,
-1.31068, -0.3647093, -1.727161, 1, 0.5529412, 0, 1,
-1.309725, -0.2188041, -4.630718, 1, 0.5568628, 0, 1,
-1.309173, 1.084513, -0.9644013, 1, 0.5647059, 0, 1,
-1.307407, 0.4798703, -0.3648253, 1, 0.5686275, 0, 1,
-1.30486, 0.7549152, -0.9884123, 1, 0.5764706, 0, 1,
-1.298363, -0.2130265, -1.716456, 1, 0.5803922, 0, 1,
-1.290865, 0.6055955, 0.04073887, 1, 0.5882353, 0, 1,
-1.288118, -0.5794593, -3.414031, 1, 0.5921569, 0, 1,
-1.287126, -0.5349458, -1.698822, 1, 0.6, 0, 1,
-1.284351, 0.525281, 0.4980991, 1, 0.6078432, 0, 1,
-1.273266, -1.105439, -2.773025, 1, 0.6117647, 0, 1,
-1.266896, 0.8305741, -2.204885, 1, 0.6196079, 0, 1,
-1.265868, -1.00805, -2.741471, 1, 0.6235294, 0, 1,
-1.263403, -0.04770587, -2.149913, 1, 0.6313726, 0, 1,
-1.260858, 0.1879136, -1.208258, 1, 0.6352941, 0, 1,
-1.254606, -0.7249545, -0.1372097, 1, 0.6431373, 0, 1,
-1.24873, 1.547217, 0.2586493, 1, 0.6470588, 0, 1,
-1.247773, 1.258675, -1.399021, 1, 0.654902, 0, 1,
-1.245047, -0.5288885, -2.694702, 1, 0.6588235, 0, 1,
-1.228189, -0.5657416, -2.806157, 1, 0.6666667, 0, 1,
-1.227603, -1.102934, -2.569864, 1, 0.6705883, 0, 1,
-1.208576, -0.3024731, -3.798149, 1, 0.6784314, 0, 1,
-1.203027, -0.7348942, -2.719926, 1, 0.682353, 0, 1,
-1.200643, 0.7865734, -1.220036, 1, 0.6901961, 0, 1,
-1.198553, -0.08306475, -2.860713, 1, 0.6941177, 0, 1,
-1.195319, 0.5614663, -0.6394565, 1, 0.7019608, 0, 1,
-1.190358, -0.1472546, -2.218992, 1, 0.7098039, 0, 1,
-1.185408, 1.156415, -0.9929332, 1, 0.7137255, 0, 1,
-1.1648, 0.8297108, 0.3289237, 1, 0.7215686, 0, 1,
-1.164086, -1.203371, -2.445158, 1, 0.7254902, 0, 1,
-1.152492, 0.3054965, -1.34145, 1, 0.7333333, 0, 1,
-1.141943, -1.663458, -1.995933, 1, 0.7372549, 0, 1,
-1.141842, -1.001043, -3.168644, 1, 0.7450981, 0, 1,
-1.141132, -1.472606, -0.3232798, 1, 0.7490196, 0, 1,
-1.136713, 1.311622, -0.1037223, 1, 0.7568628, 0, 1,
-1.114287, 0.05798205, -2.375043, 1, 0.7607843, 0, 1,
-1.106988, 0.4040566, -1.476522, 1, 0.7686275, 0, 1,
-1.103155, -0.5644074, -1.725102, 1, 0.772549, 0, 1,
-1.095967, 2.033385, -2.735819, 1, 0.7803922, 0, 1,
-1.089466, -1.512671, -3.585986, 1, 0.7843137, 0, 1,
-1.086182, -1.674471, -2.391928, 1, 0.7921569, 0, 1,
-1.084926, 0.4212004, -1.728243, 1, 0.7960784, 0, 1,
-1.082857, -1.411566, -2.859892, 1, 0.8039216, 0, 1,
-1.081458, -0.1729479, -2.048796, 1, 0.8117647, 0, 1,
-1.081293, -0.4433911, -1.229458, 1, 0.8156863, 0, 1,
-1.08008, 0.259723, -2.992978, 1, 0.8235294, 0, 1,
-1.078379, 1.096135, -1.492095, 1, 0.827451, 0, 1,
-1.075863, 0.3734544, -1.62034, 1, 0.8352941, 0, 1,
-1.074043, -0.0328238, -1.965631, 1, 0.8392157, 0, 1,
-1.07153, -1.469587, -2.691729, 1, 0.8470588, 0, 1,
-1.070458, 2.235034, -0.2645281, 1, 0.8509804, 0, 1,
-1.068984, 0.1288657, -2.869532, 1, 0.8588235, 0, 1,
-1.061015, 0.560655, -2.304122, 1, 0.8627451, 0, 1,
-1.052035, 0.1779751, -2.188657, 1, 0.8705882, 0, 1,
-1.047936, 0.511808, -2.514232, 1, 0.8745098, 0, 1,
-1.036187, 1.493594, -1.956986, 1, 0.8823529, 0, 1,
-1.034182, 1.107236, -1.29397, 1, 0.8862745, 0, 1,
-1.031564, 0.1970431, -1.158198, 1, 0.8941177, 0, 1,
-1.02791, -1.00284, -1.815112, 1, 0.8980392, 0, 1,
-1.026804, -0.3796142, -2.438806, 1, 0.9058824, 0, 1,
-1.019792, 1.310088, -1.922849, 1, 0.9137255, 0, 1,
-1.003717, 0.571, -1.510766, 1, 0.9176471, 0, 1,
-0.9912454, 1.861728, -0.9971566, 1, 0.9254902, 0, 1,
-0.9861304, 0.892974, -0.8204255, 1, 0.9294118, 0, 1,
-0.9858593, 0.02232194, -0.3997579, 1, 0.9372549, 0, 1,
-0.9847513, 0.8311041, 0.641833, 1, 0.9411765, 0, 1,
-0.984345, 0.08683448, -0.3439417, 1, 0.9490196, 0, 1,
-0.9826795, -0.04194343, -1.051857, 1, 0.9529412, 0, 1,
-0.9759255, 0.7916582, -0.3826226, 1, 0.9607843, 0, 1,
-0.9731466, -1.709414, -3.698287, 1, 0.9647059, 0, 1,
-0.9600092, -0.03974191, -0.978398, 1, 0.972549, 0, 1,
-0.958578, 2.373494, -2.265468, 1, 0.9764706, 0, 1,
-0.956641, -1.677203, -3.636404, 1, 0.9843137, 0, 1,
-0.9524771, -0.419232, -2.399893, 1, 0.9882353, 0, 1,
-0.9508575, 2.776399, -1.908928, 1, 0.9960784, 0, 1,
-0.9504416, -0.2835841, -2.08335, 0.9960784, 1, 0, 1,
-0.9482133, 0.2546433, -0.6305221, 0.9921569, 1, 0, 1,
-0.9475279, -1.356589, -2.396091, 0.9843137, 1, 0, 1,
-0.9418646, 0.2318884, -1.774362, 0.9803922, 1, 0, 1,
-0.9387627, 0.660789, 0.2515562, 0.972549, 1, 0, 1,
-0.937877, -1.787541, -3.358707, 0.9686275, 1, 0, 1,
-0.9372111, 1.980264, -0.8881278, 0.9607843, 1, 0, 1,
-0.9351276, 0.5368125, -1.010285, 0.9568627, 1, 0, 1,
-0.9328757, -0.1399143, -3.329869, 0.9490196, 1, 0, 1,
-0.928829, -1.060171, -1.0438, 0.945098, 1, 0, 1,
-0.9224762, -0.1927437, -4.267369, 0.9372549, 1, 0, 1,
-0.9155331, 1.489371, -1.358233, 0.9333333, 1, 0, 1,
-0.9140333, -0.3957331, -2.152441, 0.9254902, 1, 0, 1,
-0.9123614, 0.4719557, -0.8727171, 0.9215686, 1, 0, 1,
-0.9115462, 1.018914, -1.874872, 0.9137255, 1, 0, 1,
-0.9107378, -1.463689, -4.150255, 0.9098039, 1, 0, 1,
-0.9091472, -0.295338, -2.717943, 0.9019608, 1, 0, 1,
-0.9087682, 0.6286383, -1.548321, 0.8941177, 1, 0, 1,
-0.9024121, 1.221872, -0.2585152, 0.8901961, 1, 0, 1,
-0.9011354, 0.5241884, -2.854741, 0.8823529, 1, 0, 1,
-0.9010357, -0.4431752, -3.718805, 0.8784314, 1, 0, 1,
-0.896909, -0.7672132, -0.7112404, 0.8705882, 1, 0, 1,
-0.896388, -0.7367352, -1.780376, 0.8666667, 1, 0, 1,
-0.8930268, -0.5922679, -2.617393, 0.8588235, 1, 0, 1,
-0.8907332, -1.466515, -3.226951, 0.854902, 1, 0, 1,
-0.8898967, -0.9862748, -3.246625, 0.8470588, 1, 0, 1,
-0.8882721, -0.3606045, -3.095303, 0.8431373, 1, 0, 1,
-0.884854, -0.2637607, -0.8042141, 0.8352941, 1, 0, 1,
-0.8839173, 0.7150961, -1.999113, 0.8313726, 1, 0, 1,
-0.883241, -0.1090424, 0.248607, 0.8235294, 1, 0, 1,
-0.8829143, -0.1108654, -0.876675, 0.8196079, 1, 0, 1,
-0.8815469, 0.1128729, -1.608343, 0.8117647, 1, 0, 1,
-0.879949, 1.647913, 0.5457326, 0.8078431, 1, 0, 1,
-0.8798469, 1.740386, -2.929218, 0.8, 1, 0, 1,
-0.8798218, -0.298256, -2.004808, 0.7921569, 1, 0, 1,
-0.8779776, -0.3473231, -1.625621, 0.7882353, 1, 0, 1,
-0.8746164, -0.8538325, -1.311776, 0.7803922, 1, 0, 1,
-0.8622885, 1.001174, 0.5036444, 0.7764706, 1, 0, 1,
-0.8613613, -1.690022, -1.816844, 0.7686275, 1, 0, 1,
-0.8575252, 0.9232967, -0.6370869, 0.7647059, 1, 0, 1,
-0.8547791, -1.198219, -3.221847, 0.7568628, 1, 0, 1,
-0.8542146, -0.8737369, -3.017982, 0.7529412, 1, 0, 1,
-0.8497807, -1.288119, -1.837585, 0.7450981, 1, 0, 1,
-0.8497312, 0.8934037, -1.156796, 0.7411765, 1, 0, 1,
-0.8492821, -1.657808, -2.492017, 0.7333333, 1, 0, 1,
-0.8480784, 1.977718, -1.279764, 0.7294118, 1, 0, 1,
-0.8429951, 0.6290554, -1.571213, 0.7215686, 1, 0, 1,
-0.8426329, 2.210386, 0.2352432, 0.7176471, 1, 0, 1,
-0.8306252, -0.5599971, -1.714603, 0.7098039, 1, 0, 1,
-0.8233921, -1.752197, -1.308338, 0.7058824, 1, 0, 1,
-0.803615, -1.773746, -3.594511, 0.6980392, 1, 0, 1,
-0.8023117, 0.341406, -1.255852, 0.6901961, 1, 0, 1,
-0.7985037, -0.01457936, -0.6121746, 0.6862745, 1, 0, 1,
-0.7972584, -0.7549338, -3.768272, 0.6784314, 1, 0, 1,
-0.7950654, 0.3816704, 0.9255065, 0.6745098, 1, 0, 1,
-0.7895933, 0.9961181, -1.307668, 0.6666667, 1, 0, 1,
-0.7879032, 0.8622258, -0.5581373, 0.6627451, 1, 0, 1,
-0.7868573, 0.6272726, -3.500412, 0.654902, 1, 0, 1,
-0.7846974, -0.377051, -3.701275, 0.6509804, 1, 0, 1,
-0.783609, -0.3664294, -1.5872, 0.6431373, 1, 0, 1,
-0.7827617, -1.458819, -2.110018, 0.6392157, 1, 0, 1,
-0.7812495, 1.222533, 0.1937337, 0.6313726, 1, 0, 1,
-0.7758542, 0.2132658, -1.634274, 0.627451, 1, 0, 1,
-0.7749603, -1.405424, -1.827682, 0.6196079, 1, 0, 1,
-0.7748498, 2.147853, -0.4728596, 0.6156863, 1, 0, 1,
-0.7631394, -0.1974036, -2.20836, 0.6078432, 1, 0, 1,
-0.7604557, 0.5976659, -2.656776, 0.6039216, 1, 0, 1,
-0.7591803, 1.349028, 0.5253266, 0.5960785, 1, 0, 1,
-0.7524316, 0.2236775, -1.548349, 0.5882353, 1, 0, 1,
-0.7487142, -1.682432, -2.609927, 0.5843138, 1, 0, 1,
-0.7452206, -0.8673564, -3.497845, 0.5764706, 1, 0, 1,
-0.7400905, -0.01838104, -1.526292, 0.572549, 1, 0, 1,
-0.7387257, 0.7748393, -0.5872398, 0.5647059, 1, 0, 1,
-0.7383808, -0.8348771, -2.965404, 0.5607843, 1, 0, 1,
-0.7380537, 1.525674, -0.9324901, 0.5529412, 1, 0, 1,
-0.7360919, 1.022689, -1.485813, 0.5490196, 1, 0, 1,
-0.7237222, 0.5204602, 0.7838166, 0.5411765, 1, 0, 1,
-0.7171034, -0.1998955, 0.6745895, 0.5372549, 1, 0, 1,
-0.7168036, 1.614312, 0.1040776, 0.5294118, 1, 0, 1,
-0.7112905, 0.6209466, 0.6042607, 0.5254902, 1, 0, 1,
-0.6952864, -1.231917, -2.203871, 0.5176471, 1, 0, 1,
-0.6836133, -0.5760943, -3.514425, 0.5137255, 1, 0, 1,
-0.6817474, -1.018822, -3.56496, 0.5058824, 1, 0, 1,
-0.6807769, -1.107344, -4.216508, 0.5019608, 1, 0, 1,
-0.6741859, 0.02240243, -1.664608, 0.4941176, 1, 0, 1,
-0.6669555, -0.8986288, -3.44303, 0.4862745, 1, 0, 1,
-0.6658916, -0.978364, -1.382205, 0.4823529, 1, 0, 1,
-0.6638509, 0.3605927, -0.968752, 0.4745098, 1, 0, 1,
-0.6626614, -0.6343369, -2.768936, 0.4705882, 1, 0, 1,
-0.6576068, 1.170983, -1.883873, 0.4627451, 1, 0, 1,
-0.6549963, -0.6472534, -0.8943784, 0.4588235, 1, 0, 1,
-0.6527306, -1.861009, -1.192846, 0.4509804, 1, 0, 1,
-0.6526098, 0.009129419, -1.196989, 0.4470588, 1, 0, 1,
-0.6417177, -1.549816, -1.770038, 0.4392157, 1, 0, 1,
-0.6413792, -1.546014, -1.959754, 0.4352941, 1, 0, 1,
-0.6400639, -0.005027042, -0.2046731, 0.427451, 1, 0, 1,
-0.6358819, 1.161992, 1.007392, 0.4235294, 1, 0, 1,
-0.6329554, -0.7985088, -1.575752, 0.4156863, 1, 0, 1,
-0.63098, -0.07721772, -1.048838, 0.4117647, 1, 0, 1,
-0.62881, 1.053343, -2.133992, 0.4039216, 1, 0, 1,
-0.6232169, -0.743271, -1.865823, 0.3960784, 1, 0, 1,
-0.6219804, -1.030934, -1.879211, 0.3921569, 1, 0, 1,
-0.6204671, -0.3537545, -2.505478, 0.3843137, 1, 0, 1,
-0.6186189, -1.602027, -2.367316, 0.3803922, 1, 0, 1,
-0.6174809, 0.6586888, -1.358744, 0.372549, 1, 0, 1,
-0.6164835, -1.619978, -3.086092, 0.3686275, 1, 0, 1,
-0.6101143, 0.5264676, 1.147238, 0.3607843, 1, 0, 1,
-0.6091271, 1.218524, -1.390343, 0.3568628, 1, 0, 1,
-0.6059515, 0.05471379, -0.5288631, 0.3490196, 1, 0, 1,
-0.6042901, -0.6461055, -2.997098, 0.345098, 1, 0, 1,
-0.5723219, 1.471895, -1.737482, 0.3372549, 1, 0, 1,
-0.5713684, -1.380852, -2.34032, 0.3333333, 1, 0, 1,
-0.5699615, -0.2385556, -1.69449, 0.3254902, 1, 0, 1,
-0.5673826, 0.6507353, -1.651665, 0.3215686, 1, 0, 1,
-0.5654038, 2.470802, -1.632623, 0.3137255, 1, 0, 1,
-0.5625909, 0.7884775, -0.3549779, 0.3098039, 1, 0, 1,
-0.5568942, 0.0330836, -1.072394, 0.3019608, 1, 0, 1,
-0.554585, -0.5772486, -2.320972, 0.2941177, 1, 0, 1,
-0.5538537, -2.680645, -3.703189, 0.2901961, 1, 0, 1,
-0.5526512, -3.158473, -1.16842, 0.282353, 1, 0, 1,
-0.5517572, -1.199132, -3.249081, 0.2784314, 1, 0, 1,
-0.5495973, 2.318498, -0.4820648, 0.2705882, 1, 0, 1,
-0.5473097, 0.4912339, -1.491957, 0.2666667, 1, 0, 1,
-0.5460982, 2.366546, 0.3527934, 0.2588235, 1, 0, 1,
-0.5450336, 0.1427354, 0.2486166, 0.254902, 1, 0, 1,
-0.5445284, -0.6330616, -1.253399, 0.2470588, 1, 0, 1,
-0.5397407, -0.2772546, -4.651082, 0.2431373, 1, 0, 1,
-0.539547, -0.4239395, -1.313572, 0.2352941, 1, 0, 1,
-0.5357188, 0.9214579, -0.3552505, 0.2313726, 1, 0, 1,
-0.5324003, 0.0285056, -0.5797127, 0.2235294, 1, 0, 1,
-0.5310051, 1.248361, -0.1017116, 0.2196078, 1, 0, 1,
-0.5287696, 0.7314483, -0.6536798, 0.2117647, 1, 0, 1,
-0.5261846, 0.2157406, -1.039142, 0.2078431, 1, 0, 1,
-0.5187691, -0.8014442, -2.927971, 0.2, 1, 0, 1,
-0.5122164, 0.1243886, -0.08172143, 0.1921569, 1, 0, 1,
-0.5010628, -0.05310871, -1.311677, 0.1882353, 1, 0, 1,
-0.4968185, 0.5994299, -0.9214771, 0.1803922, 1, 0, 1,
-0.4951138, 0.2309214, 0.8584672, 0.1764706, 1, 0, 1,
-0.4864506, -1.182224, -2.702148, 0.1686275, 1, 0, 1,
-0.4849525, 0.1845948, -4.274065, 0.1647059, 1, 0, 1,
-0.4748891, -0.4665871, -3.837484, 0.1568628, 1, 0, 1,
-0.473991, 0.8804113, 0.2480935, 0.1529412, 1, 0, 1,
-0.4737227, 0.8745129, 1.376323, 0.145098, 1, 0, 1,
-0.470132, -0.5840544, -3.864594, 0.1411765, 1, 0, 1,
-0.4623218, -0.5682922, -2.760824, 0.1333333, 1, 0, 1,
-0.461446, -2.238075, -3.027824, 0.1294118, 1, 0, 1,
-0.4614441, 1.276112, -0.1748985, 0.1215686, 1, 0, 1,
-0.4590449, -0.5472636, -1.35862, 0.1176471, 1, 0, 1,
-0.4517457, -0.5001805, -2.227464, 0.1098039, 1, 0, 1,
-0.4481789, 0.4529185, 0.3770808, 0.1058824, 1, 0, 1,
-0.4470748, 0.1800401, 0.02662661, 0.09803922, 1, 0, 1,
-0.4467224, -0.7686803, -0.07556923, 0.09019608, 1, 0, 1,
-0.4446957, 0.9772953, -0.3484138, 0.08627451, 1, 0, 1,
-0.4439561, -1.37577, -3.530391, 0.07843138, 1, 0, 1,
-0.4364957, 2.326778, -0.2727914, 0.07450981, 1, 0, 1,
-0.4354244, -0.6263344, -1.939434, 0.06666667, 1, 0, 1,
-0.434039, 1.080715, 0.07825314, 0.0627451, 1, 0, 1,
-0.4337576, -0.5604492, -2.103756, 0.05490196, 1, 0, 1,
-0.4329669, -0.2764663, -2.675072, 0.05098039, 1, 0, 1,
-0.4325382, 0.7447538, -0.9120446, 0.04313726, 1, 0, 1,
-0.4314407, -0.3225313, -2.951165, 0.03921569, 1, 0, 1,
-0.4243563, -0.9372113, -2.960898, 0.03137255, 1, 0, 1,
-0.4237165, -0.1505021, -1.641631, 0.02745098, 1, 0, 1,
-0.4199877, -0.5370746, -1.808428, 0.01960784, 1, 0, 1,
-0.4128633, -0.6957788, -2.194541, 0.01568628, 1, 0, 1,
-0.404816, 0.717543, -2.111464, 0.007843138, 1, 0, 1,
-0.3995898, 1.256088, -0.8284169, 0.003921569, 1, 0, 1,
-0.3992558, -1.426134, -3.740308, 0, 1, 0.003921569, 1,
-0.399209, -0.3238413, -4.174801, 0, 1, 0.01176471, 1,
-0.3965317, 0.02386053, -2.340123, 0, 1, 0.01568628, 1,
-0.3910487, -0.2525116, -2.241421, 0, 1, 0.02352941, 1,
-0.3906717, -0.041113, -0.03455589, 0, 1, 0.02745098, 1,
-0.389838, 2.051329, 0.1895596, 0, 1, 0.03529412, 1,
-0.3889585, 0.7835356, -1.928548, 0, 1, 0.03921569, 1,
-0.3856663, -0.004010947, -0.9671393, 0, 1, 0.04705882, 1,
-0.3836592, 0.2374845, -0.06406744, 0, 1, 0.05098039, 1,
-0.3829094, -0.1817778, -0.5795227, 0, 1, 0.05882353, 1,
-0.3724109, 0.3931834, 0.8991396, 0, 1, 0.0627451, 1,
-0.3702929, -0.3704467, -3.422051, 0, 1, 0.07058824, 1,
-0.3630137, -0.2968417, -1.873264, 0, 1, 0.07450981, 1,
-0.3585093, 0.769107, -0.03178724, 0, 1, 0.08235294, 1,
-0.3584466, -0.8348197, -1.951826, 0, 1, 0.08627451, 1,
-0.3572391, -1.020457, -3.595074, 0, 1, 0.09411765, 1,
-0.3545527, 0.047584, -1.716008, 0, 1, 0.1019608, 1,
-0.3522727, -0.5207279, -4.452266, 0, 1, 0.1058824, 1,
-0.3510909, -0.1621689, -2.700681, 0, 1, 0.1137255, 1,
-0.3487508, 0.354352, 0.2213839, 0, 1, 0.1176471, 1,
-0.347613, -1.252245, -2.216401, 0, 1, 0.1254902, 1,
-0.3470147, 2.072443, -1.850711, 0, 1, 0.1294118, 1,
-0.34611, -0.9793864, 0.5199143, 0, 1, 0.1372549, 1,
-0.3448835, 1.034719, 0.1786913, 0, 1, 0.1411765, 1,
-0.3447922, -0.9781035, -3.967369, 0, 1, 0.1490196, 1,
-0.3405478, -0.4351362, -2.549881, 0, 1, 0.1529412, 1,
-0.3350804, 0.2925222, 0.5151027, 0, 1, 0.1607843, 1,
-0.3346117, -1.735295, -3.42902, 0, 1, 0.1647059, 1,
-0.3345256, -1.635478, -3.07476, 0, 1, 0.172549, 1,
-0.3315312, 1.455135, 0.5906744, 0, 1, 0.1764706, 1,
-0.3272947, -0.5585675, -3.36222, 0, 1, 0.1843137, 1,
-0.3210723, 0.02938578, -1.013317, 0, 1, 0.1882353, 1,
-0.3193981, -1.148162, -3.090428, 0, 1, 0.1960784, 1,
-0.3145899, -1.761705, -3.872538, 0, 1, 0.2039216, 1,
-0.3119781, 0.9521095, 0.8198967, 0, 1, 0.2078431, 1,
-0.3114977, 0.7222689, 0.7551571, 0, 1, 0.2156863, 1,
-0.3103459, 1.09983, 0.9326982, 0, 1, 0.2196078, 1,
-0.3057543, 0.4568123, 0.2105152, 0, 1, 0.227451, 1,
-0.3015177, 0.1231507, 0.6856676, 0, 1, 0.2313726, 1,
-0.3004048, 0.3146325, -1.510888, 0, 1, 0.2392157, 1,
-0.2888419, -0.2744173, -3.167629, 0, 1, 0.2431373, 1,
-0.2888252, -2.235572, -3.589265, 0, 1, 0.2509804, 1,
-0.2872865, 0.1167016, -0.4798827, 0, 1, 0.254902, 1,
-0.2869802, 1.776971, 0.2648008, 0, 1, 0.2627451, 1,
-0.2862579, -0.4802734, -3.540284, 0, 1, 0.2666667, 1,
-0.2855209, -1.695053, -4.01718, 0, 1, 0.2745098, 1,
-0.2848817, -0.3151631, -4.968276, 0, 1, 0.2784314, 1,
-0.2847121, -0.3499205, -2.186206, 0, 1, 0.2862745, 1,
-0.2843374, 0.3918533, 0.8927241, 0, 1, 0.2901961, 1,
-0.278399, -0.9441254, -4.106703, 0, 1, 0.2980392, 1,
-0.2718797, -0.1887897, -0.6422194, 0, 1, 0.3058824, 1,
-0.2705022, -1.490233, -3.41748, 0, 1, 0.3098039, 1,
-0.2682203, -0.2313427, -1.605365, 0, 1, 0.3176471, 1,
-0.2657125, 0.9705253, 0.04281148, 0, 1, 0.3215686, 1,
-0.2636771, 1.078135, 0.07653008, 0, 1, 0.3294118, 1,
-0.2609469, 3.193093, -0.4838869, 0, 1, 0.3333333, 1,
-0.2584161, 1.072099, -1.356738, 0, 1, 0.3411765, 1,
-0.2550026, 1.837449, -0.07134449, 0, 1, 0.345098, 1,
-0.254795, -0.7759648, -2.438025, 0, 1, 0.3529412, 1,
-0.2526364, -1.064301, -2.005568, 0, 1, 0.3568628, 1,
-0.2523716, -1.308169, -1.597839, 0, 1, 0.3647059, 1,
-0.2518456, 0.4912103, -0.7070717, 0, 1, 0.3686275, 1,
-0.2517331, 0.7963744, 1.099089, 0, 1, 0.3764706, 1,
-0.2502127, 0.1950492, 0.442746, 0, 1, 0.3803922, 1,
-0.2472219, -0.8512703, -3.375011, 0, 1, 0.3882353, 1,
-0.2391037, 1.499623, -1.245024, 0, 1, 0.3921569, 1,
-0.237378, 0.1767264, -2.419313, 0, 1, 0.4, 1,
-0.2371885, 2.186461, -1.860226, 0, 1, 0.4078431, 1,
-0.2311559, -0.3235765, -1.380572, 0, 1, 0.4117647, 1,
-0.2299457, -0.2210265, -1.556224, 0, 1, 0.4196078, 1,
-0.228278, 1.465742, -0.1651107, 0, 1, 0.4235294, 1,
-0.2262165, -0.6876184, -3.357207, 0, 1, 0.4313726, 1,
-0.2255978, 0.8169849, -0.4524465, 0, 1, 0.4352941, 1,
-0.2234705, 1.363132, 0.3577779, 0, 1, 0.4431373, 1,
-0.2201485, -0.3333338, -2.024856, 0, 1, 0.4470588, 1,
-0.2166715, -0.2038011, -2.200433, 0, 1, 0.454902, 1,
-0.2157069, -0.4762576, -4.188795, 0, 1, 0.4588235, 1,
-0.2139179, -0.3609344, 0.1332401, 0, 1, 0.4666667, 1,
-0.210082, -1.269708, -2.378783, 0, 1, 0.4705882, 1,
-0.2072304, 0.7117144, -1.702946, 0, 1, 0.4784314, 1,
-0.2038604, -1.559418, -3.537801, 0, 1, 0.4823529, 1,
-0.1992628, 2.176583, -0.333155, 0, 1, 0.4901961, 1,
-0.1990963, -0.4901134, -2.811664, 0, 1, 0.4941176, 1,
-0.1966731, 0.1096757, -0.5236924, 0, 1, 0.5019608, 1,
-0.1954518, 1.625783, -0.1270068, 0, 1, 0.509804, 1,
-0.1947729, 0.6127381, -0.7673122, 0, 1, 0.5137255, 1,
-0.1944921, 2.463333, 0.6579646, 0, 1, 0.5215687, 1,
-0.1843073, -1.212062, -3.557589, 0, 1, 0.5254902, 1,
-0.1835887, 0.7147593, -0.2332824, 0, 1, 0.5333334, 1,
-0.1831237, -0.5324111, -1.811755, 0, 1, 0.5372549, 1,
-0.1828297, 1.019902, -1.259221, 0, 1, 0.5450981, 1,
-0.1819731, -0.1052252, -0.3731568, 0, 1, 0.5490196, 1,
-0.1791515, 1.544504, 1.681926, 0, 1, 0.5568628, 1,
-0.1770122, -1.70309, -4.960142, 0, 1, 0.5607843, 1,
-0.1752729, -0.2793185, -1.297519, 0, 1, 0.5686275, 1,
-0.1696826, -0.5899973, -2.379135, 0, 1, 0.572549, 1,
-0.1659522, 0.4383969, -1.634073, 0, 1, 0.5803922, 1,
-0.1625182, -0.0600098, -2.047763, 0, 1, 0.5843138, 1,
-0.162323, -0.02643613, -0.5055089, 0, 1, 0.5921569, 1,
-0.1617048, 1.724537, -1.344344, 0, 1, 0.5960785, 1,
-0.1616026, 0.7638614, 0.1480576, 0, 1, 0.6039216, 1,
-0.1613577, -0.5681097, -3.655492, 0, 1, 0.6117647, 1,
-0.160161, 0.1700298, -0.9951423, 0, 1, 0.6156863, 1,
-0.1579115, -1.810062, -3.641649, 0, 1, 0.6235294, 1,
-0.1504995, 0.5269607, 0.839767, 0, 1, 0.627451, 1,
-0.1447667, -1.212758, -1.984694, 0, 1, 0.6352941, 1,
-0.1437433, 1.637017, 0.3541067, 0, 1, 0.6392157, 1,
-0.1370919, -1.514887, -2.934533, 0, 1, 0.6470588, 1,
-0.1300125, 1.295406, -1.217014, 0, 1, 0.6509804, 1,
-0.1279195, 0.7764032, 0.2683586, 0, 1, 0.6588235, 1,
-0.1218733, -2.408283, -3.489744, 0, 1, 0.6627451, 1,
-0.1186811, 0.2727765, -0.622915, 0, 1, 0.6705883, 1,
-0.11713, -1.164218, -1.298067, 0, 1, 0.6745098, 1,
-0.1168727, 2.883172, -1.412919, 0, 1, 0.682353, 1,
-0.1162188, 0.7400948, -0.4110356, 0, 1, 0.6862745, 1,
-0.1159985, -0.1665146, -3.04778, 0, 1, 0.6941177, 1,
-0.1148858, -0.8490078, -2.733946, 0, 1, 0.7019608, 1,
-0.1088014, 1.789886, -1.178704, 0, 1, 0.7058824, 1,
-0.1086238, 0.03671114, -0.2355158, 0, 1, 0.7137255, 1,
-0.09960858, 0.4240754, 0.3513682, 0, 1, 0.7176471, 1,
-0.09897455, -1.133196, -3.424767, 0, 1, 0.7254902, 1,
-0.09154378, -0.548542, -2.982063, 0, 1, 0.7294118, 1,
-0.08635589, -1.248652, -2.319375, 0, 1, 0.7372549, 1,
-0.08501834, 2.711214, -1.049917, 0, 1, 0.7411765, 1,
-0.0833929, 1.449982, 0.01217815, 0, 1, 0.7490196, 1,
-0.0829015, 1.491003, 0.07842571, 0, 1, 0.7529412, 1,
-0.08259503, 0.7420305, -0.8501898, 0, 1, 0.7607843, 1,
-0.08050591, 1.966658, 0.211335, 0, 1, 0.7647059, 1,
-0.0770519, 0.3632889, 0.005297207, 0, 1, 0.772549, 1,
-0.07445204, 0.2956478, 0.9073827, 0, 1, 0.7764706, 1,
-0.07404318, -1.466643, -2.911517, 0, 1, 0.7843137, 1,
-0.07350554, -0.036546, -2.42355, 0, 1, 0.7882353, 1,
-0.07078665, -0.08993656, -1.778206, 0, 1, 0.7960784, 1,
-0.06922582, 0.8820994, -0.6432334, 0, 1, 0.8039216, 1,
-0.06621817, 0.8365778, -0.8951262, 0, 1, 0.8078431, 1,
-0.06360123, 0.2637649, -1.250691, 0, 1, 0.8156863, 1,
-0.0632842, -0.96025, -2.999053, 0, 1, 0.8196079, 1,
-0.06032804, -0.6771939, -2.146479, 0, 1, 0.827451, 1,
-0.06023761, -0.2822515, -4.125104, 0, 1, 0.8313726, 1,
-0.05296571, 0.9468382, -0.1661555, 0, 1, 0.8392157, 1,
-0.0521689, 0.5147145, -0.2387799, 0, 1, 0.8431373, 1,
-0.04972887, -0.4451645, -4.324073, 0, 1, 0.8509804, 1,
-0.04715626, -1.39463, -3.407686, 0, 1, 0.854902, 1,
-0.04574806, -0.1240484, -3.174749, 0, 1, 0.8627451, 1,
-0.04496507, -0.2216224, -2.30571, 0, 1, 0.8666667, 1,
-0.0399618, 0.7248968, -0.5573217, 0, 1, 0.8745098, 1,
-0.03706106, 0.7922302, -0.1078274, 0, 1, 0.8784314, 1,
-0.03353443, -0.2788627, -2.172774, 0, 1, 0.8862745, 1,
-0.02952649, 0.6296947, 0.5522044, 0, 1, 0.8901961, 1,
-0.02612363, -1.254048, -3.964653, 0, 1, 0.8980392, 1,
-0.02301653, 0.9056068, 0.6172545, 0, 1, 0.9058824, 1,
-0.02084888, 0.2836103, -1.126844, 0, 1, 0.9098039, 1,
-0.02064101, -0.1570967, -4.101015, 0, 1, 0.9176471, 1,
-0.01969965, -0.2605534, -1.901835, 0, 1, 0.9215686, 1,
-0.01914283, -0.3383561, -3.031256, 0, 1, 0.9294118, 1,
-0.01790437, -0.7296113, -2.556813, 0, 1, 0.9333333, 1,
-0.01660016, -0.2888242, -1.93348, 0, 1, 0.9411765, 1,
-0.01561208, -0.6504173, -3.646374, 0, 1, 0.945098, 1,
-0.01181683, 0.7144586, 0.6642885, 0, 1, 0.9529412, 1,
-0.004386991, 0.9846554, -0.5210991, 0, 1, 0.9568627, 1,
-0.004087535, -0.458293, -3.658017, 0, 1, 0.9647059, 1,
-0.003054251, -1.735708, -2.589401, 0, 1, 0.9686275, 1,
-0.001590924, 2.062449, 1.576513, 0, 1, 0.9764706, 1,
-0.001464577, 0.1691772, 0.3468939, 0, 1, 0.9803922, 1,
0.005541387, 0.3097027, 0.3731433, 0, 1, 0.9882353, 1,
0.007421655, 0.5239065, -1.077312, 0, 1, 0.9921569, 1,
0.007960717, 1.107929, -2.12468, 0, 1, 1, 1,
0.009744186, 0.1489574, 0.8509017, 0, 0.9921569, 1, 1,
0.01302081, 0.1620044, 0.5521779, 0, 0.9882353, 1, 1,
0.01345366, -0.5086927, 2.966875, 0, 0.9803922, 1, 1,
0.01366567, 0.1308343, -1.969827, 0, 0.9764706, 1, 1,
0.01416278, -0.5809445, 3.93632, 0, 0.9686275, 1, 1,
0.01500283, 1.33895, -0.1267241, 0, 0.9647059, 1, 1,
0.01646676, 0.2719117, -0.7380679, 0, 0.9568627, 1, 1,
0.01988066, -1.497698, 5.106912, 0, 0.9529412, 1, 1,
0.02199554, -0.5961468, 4.751801, 0, 0.945098, 1, 1,
0.02493153, 1.441101, 0.3629004, 0, 0.9411765, 1, 1,
0.02680495, 1.262228, 0.1614673, 0, 0.9333333, 1, 1,
0.02836167, -1.157316, 2.352091, 0, 0.9294118, 1, 1,
0.03296853, -0.4874549, 3.182193, 0, 0.9215686, 1, 1,
0.0382364, 0.421186, -0.4393808, 0, 0.9176471, 1, 1,
0.03851669, -1.387771, 3.147965, 0, 0.9098039, 1, 1,
0.03994959, 0.04497369, -0.1144198, 0, 0.9058824, 1, 1,
0.04270113, -1.764245, 3.38039, 0, 0.8980392, 1, 1,
0.04356958, 0.526141, -0.5093653, 0, 0.8901961, 1, 1,
0.04635017, 1.104553, -0.8206666, 0, 0.8862745, 1, 1,
0.04730139, 1.382541, -0.65124, 0, 0.8784314, 1, 1,
0.05197086, -1.234905, 1.670815, 0, 0.8745098, 1, 1,
0.05357872, 0.5151758, 0.9368845, 0, 0.8666667, 1, 1,
0.05895166, 0.2230903, 0.922581, 0, 0.8627451, 1, 1,
0.05995697, 1.375383, 0.2897965, 0, 0.854902, 1, 1,
0.06786735, -1.367563, 3.973159, 0, 0.8509804, 1, 1,
0.07134646, 0.1634619, -0.642451, 0, 0.8431373, 1, 1,
0.07192627, -0.3380142, 3.788699, 0, 0.8392157, 1, 1,
0.07376589, 0.5659162, 0.4018769, 0, 0.8313726, 1, 1,
0.07702689, -0.9440588, 3.082547, 0, 0.827451, 1, 1,
0.0779326, 0.7438761, 1.519886, 0, 0.8196079, 1, 1,
0.08065879, -0.3237437, 4.742225, 0, 0.8156863, 1, 1,
0.0857973, -0.3076946, 6.154843, 0, 0.8078431, 1, 1,
0.08666389, -0.2706152, 1.620743, 0, 0.8039216, 1, 1,
0.09200375, -0.773835, 1.69451, 0, 0.7960784, 1, 1,
0.09257583, 0.7965367, -0.6318874, 0, 0.7882353, 1, 1,
0.0944787, -0.1704776, 2.561699, 0, 0.7843137, 1, 1,
0.09837953, -0.334147, 2.326927, 0, 0.7764706, 1, 1,
0.1019922, 0.9245138, 1.982559, 0, 0.772549, 1, 1,
0.1021564, 0.6633847, -0.9301955, 0, 0.7647059, 1, 1,
0.104472, 2.199471, -1.109446, 0, 0.7607843, 1, 1,
0.1089805, -0.4926476, 4.462921, 0, 0.7529412, 1, 1,
0.1121163, 0.2490896, 0.1257716, 0, 0.7490196, 1, 1,
0.1144638, 0.09679152, 0.06328122, 0, 0.7411765, 1, 1,
0.1180513, -0.323476, 2.385033, 0, 0.7372549, 1, 1,
0.1189054, 0.2366134, -0.2201861, 0, 0.7294118, 1, 1,
0.1219132, 0.0002037746, 2.37805, 0, 0.7254902, 1, 1,
0.1221726, -1.035457, 4.275877, 0, 0.7176471, 1, 1,
0.132928, -0.6720113, 3.233274, 0, 0.7137255, 1, 1,
0.1336081, -0.06639989, 1.645614, 0, 0.7058824, 1, 1,
0.134348, 1.183727, 2.023973, 0, 0.6980392, 1, 1,
0.1398843, 1.976767, 1.225028, 0, 0.6941177, 1, 1,
0.14238, 0.1654364, 1.635514, 0, 0.6862745, 1, 1,
0.145146, 0.8837017, -0.6485763, 0, 0.682353, 1, 1,
0.1465641, 0.2408443, 0.4503755, 0, 0.6745098, 1, 1,
0.1469439, -0.5602961, 2.846168, 0, 0.6705883, 1, 1,
0.1546249, 0.03184156, 0.822013, 0, 0.6627451, 1, 1,
0.1561969, -1.121035, 1.942316, 0, 0.6588235, 1, 1,
0.1574214, -0.576853, 4.202933, 0, 0.6509804, 1, 1,
0.1608425, 0.4634373, -1.866246, 0, 0.6470588, 1, 1,
0.1628968, -0.141896, 2.168834, 0, 0.6392157, 1, 1,
0.1633476, -0.3879902, 2.452812, 0, 0.6352941, 1, 1,
0.164735, 0.3501619, -1.911063, 0, 0.627451, 1, 1,
0.1720171, -0.5549264, 2.764353, 0, 0.6235294, 1, 1,
0.1722191, -1.017326, 4.142739, 0, 0.6156863, 1, 1,
0.1729626, 0.1862563, 2.178672, 0, 0.6117647, 1, 1,
0.1810454, -0.8826234, 3.142529, 0, 0.6039216, 1, 1,
0.1818165, -0.1450816, 2.996504, 0, 0.5960785, 1, 1,
0.182534, -0.8708416, 4.017157, 0, 0.5921569, 1, 1,
0.1876121, 0.08766334, 1.262911, 0, 0.5843138, 1, 1,
0.1987056, -0.5704589, 4.542406, 0, 0.5803922, 1, 1,
0.1988988, -0.5175969, 2.383045, 0, 0.572549, 1, 1,
0.1989626, -0.3467134, 2.809345, 0, 0.5686275, 1, 1,
0.203601, -0.3724741, 2.126697, 0, 0.5607843, 1, 1,
0.2036921, 1.039302, 0.6071954, 0, 0.5568628, 1, 1,
0.2042901, -0.131784, 1.280048, 0, 0.5490196, 1, 1,
0.2056205, 0.09195523, 3.925082, 0, 0.5450981, 1, 1,
0.2068254, -0.2274321, 2.704773, 0, 0.5372549, 1, 1,
0.2070815, 0.3827585, -1.913792, 0, 0.5333334, 1, 1,
0.2108556, 1.678604, -0.6436614, 0, 0.5254902, 1, 1,
0.2126304, -1.865266, 2.546161, 0, 0.5215687, 1, 1,
0.2136032, 0.3744005, 2.928824, 0, 0.5137255, 1, 1,
0.2181477, 0.4836172, -0.4977266, 0, 0.509804, 1, 1,
0.2199844, -0.5848291, 2.584488, 0, 0.5019608, 1, 1,
0.2200119, -1.368824, 2.291202, 0, 0.4941176, 1, 1,
0.2214341, 0.5759912, -0.8749139, 0, 0.4901961, 1, 1,
0.2272022, -0.5176787, 2.433497, 0, 0.4823529, 1, 1,
0.2294433, 1.655182, 1.491701, 0, 0.4784314, 1, 1,
0.2304752, -0.5988248, 3.412265, 0, 0.4705882, 1, 1,
0.2318721, -0.2753626, 1.990889, 0, 0.4666667, 1, 1,
0.2342449, -0.8437483, 2.448635, 0, 0.4588235, 1, 1,
0.2388663, -0.0315727, 2.091404, 0, 0.454902, 1, 1,
0.2417981, 1.216663, 1.166889, 0, 0.4470588, 1, 1,
0.252473, 0.5695741, 0.9698192, 0, 0.4431373, 1, 1,
0.2551203, 1.618182, -2.381199, 0, 0.4352941, 1, 1,
0.2554313, 1.297023, 0.5831795, 0, 0.4313726, 1, 1,
0.2559723, 2.039899, 0.994052, 0, 0.4235294, 1, 1,
0.256876, 1.418329, 0.6883865, 0, 0.4196078, 1, 1,
0.2621099, 1.298268, -1.167244, 0, 0.4117647, 1, 1,
0.2625544, 0.5852834, -0.7772532, 0, 0.4078431, 1, 1,
0.2637421, 0.7140358, 0.3028434, 0, 0.4, 1, 1,
0.2639044, -0.4827697, 1.492407, 0, 0.3921569, 1, 1,
0.2656352, -0.7964912, 2.108846, 0, 0.3882353, 1, 1,
0.2718768, 0.1828093, 1.676852, 0, 0.3803922, 1, 1,
0.2736527, 0.9172176, -0.01255682, 0, 0.3764706, 1, 1,
0.2738726, 0.497612, -0.4167788, 0, 0.3686275, 1, 1,
0.2764417, -0.3451037, 1.797865, 0, 0.3647059, 1, 1,
0.2776327, 0.5540054, -0.09792171, 0, 0.3568628, 1, 1,
0.282808, 1.488755, 1.505238, 0, 0.3529412, 1, 1,
0.2828904, -1.730126, 3.798205, 0, 0.345098, 1, 1,
0.2857182, -1.258419, 3.919441, 0, 0.3411765, 1, 1,
0.2857757, -1.372284, 2.230297, 0, 0.3333333, 1, 1,
0.2875214, -0.7626805, 3.163868, 0, 0.3294118, 1, 1,
0.2910976, -1.619272, 5.099607, 0, 0.3215686, 1, 1,
0.2930642, 0.1767801, -0.1385696, 0, 0.3176471, 1, 1,
0.2972789, 0.905047, 1.496084, 0, 0.3098039, 1, 1,
0.2986826, -0.1347243, 0.4872952, 0, 0.3058824, 1, 1,
0.2996922, -0.2432006, 3.262797, 0, 0.2980392, 1, 1,
0.3015352, 0.05427743, 1.371935, 0, 0.2901961, 1, 1,
0.3021338, -0.8300394, 2.183792, 0, 0.2862745, 1, 1,
0.304158, -0.9271365, 3.292278, 0, 0.2784314, 1, 1,
0.3049713, -0.8773655, 2.317739, 0, 0.2745098, 1, 1,
0.313655, 0.2628688, 1.262642, 0, 0.2666667, 1, 1,
0.3152598, 0.1962081, 0.5363316, 0, 0.2627451, 1, 1,
0.322253, 0.3196845, 0.5388564, 0, 0.254902, 1, 1,
0.3236302, 1.330002, 0.8741167, 0, 0.2509804, 1, 1,
0.3262637, -1.097454, 1.388146, 0, 0.2431373, 1, 1,
0.3350056, -1.646788, 3.047252, 0, 0.2392157, 1, 1,
0.3356788, 1.350499, 1.434933, 0, 0.2313726, 1, 1,
0.3372643, -0.3275004, 2.818875, 0, 0.227451, 1, 1,
0.3381106, 0.1024217, -1.090233, 0, 0.2196078, 1, 1,
0.3437156, -0.08021169, -0.1255594, 0, 0.2156863, 1, 1,
0.3439484, -0.480719, 1.378078, 0, 0.2078431, 1, 1,
0.3447034, -0.1491198, 2.854027, 0, 0.2039216, 1, 1,
0.344954, 0.8126698, 0.6048167, 0, 0.1960784, 1, 1,
0.3490083, 1.079372, 0.6413915, 0, 0.1882353, 1, 1,
0.3569213, -1.444675, 4.593947, 0, 0.1843137, 1, 1,
0.3595578, 0.4218171, 1.032741, 0, 0.1764706, 1, 1,
0.3653852, -0.2416609, 1.407274, 0, 0.172549, 1, 1,
0.3655313, 1.25337, -1.541735, 0, 0.1647059, 1, 1,
0.3747083, -0.7943201, 1.834179, 0, 0.1607843, 1, 1,
0.3799158, -0.07287627, 3.130553, 0, 0.1529412, 1, 1,
0.3802808, 1.078059, -0.4428656, 0, 0.1490196, 1, 1,
0.3846734, 0.3593595, 0.7944133, 0, 0.1411765, 1, 1,
0.3846859, -0.2163434, 0.8082152, 0, 0.1372549, 1, 1,
0.3912776, 1.402624, 0.8807729, 0, 0.1294118, 1, 1,
0.3942477, -0.3345441, 0.6206474, 0, 0.1254902, 1, 1,
0.3947047, 0.06152127, 1.719807, 0, 0.1176471, 1, 1,
0.3968019, 0.0908621, 0.8492577, 0, 0.1137255, 1, 1,
0.4018381, 0.6221003, 0.1299849, 0, 0.1058824, 1, 1,
0.4065719, 0.5864058, 2.222803, 0, 0.09803922, 1, 1,
0.4068528, 0.5506825, 1.064006, 0, 0.09411765, 1, 1,
0.4088769, 0.518099, 0.625254, 0, 0.08627451, 1, 1,
0.4097061, -1.806107, 2.452778, 0, 0.08235294, 1, 1,
0.4098983, 0.1797365, 0.9195994, 0, 0.07450981, 1, 1,
0.4110096, -0.5443429, 3.114416, 0, 0.07058824, 1, 1,
0.4134582, 1.487805, -0.1760301, 0, 0.0627451, 1, 1,
0.4136619, -1.714963, 0.9222096, 0, 0.05882353, 1, 1,
0.4171873, -0.7654691, 1.570971, 0, 0.05098039, 1, 1,
0.4255949, -0.8623026, 3.073647, 0, 0.04705882, 1, 1,
0.4276702, -0.6294772, 3.509975, 0, 0.03921569, 1, 1,
0.4277512, 1.524291, -0.7293274, 0, 0.03529412, 1, 1,
0.4323877, 0.6365065, -0.5811039, 0, 0.02745098, 1, 1,
0.433852, -1.508639, 4.607879, 0, 0.02352941, 1, 1,
0.4350426, -0.8646821, 0.8537945, 0, 0.01568628, 1, 1,
0.4358222, -0.355923, 2.326656, 0, 0.01176471, 1, 1,
0.4387845, 1.141726, -0.7363946, 0, 0.003921569, 1, 1,
0.4391998, -0.813989, 2.050684, 0.003921569, 0, 1, 1,
0.4399163, -2.212541, 3.235658, 0.007843138, 0, 1, 1,
0.4459803, -0.8989558, 3.126718, 0.01568628, 0, 1, 1,
0.4540535, 0.5289264, 0.6668715, 0.01960784, 0, 1, 1,
0.4562574, 1.280383, 0.3709073, 0.02745098, 0, 1, 1,
0.4569513, 1.056912, -0.4655711, 0.03137255, 0, 1, 1,
0.4654524, -2.169186, 3.3778, 0.03921569, 0, 1, 1,
0.4671479, -2.276506, 3.04766, 0.04313726, 0, 1, 1,
0.471433, 0.8599971, -0.01619521, 0.05098039, 0, 1, 1,
0.4720235, 0.8250463, -0.5223709, 0.05490196, 0, 1, 1,
0.4723835, -0.4753744, 0.3465669, 0.0627451, 0, 1, 1,
0.472583, 0.006869376, -0.1597482, 0.06666667, 0, 1, 1,
0.4788213, 1.486469, 0.6764225, 0.07450981, 0, 1, 1,
0.480489, 0.3960834, 1.484543, 0.07843138, 0, 1, 1,
0.4805848, 1.974302, 1.438047, 0.08627451, 0, 1, 1,
0.4808045, 0.1941304, 1.894052, 0.09019608, 0, 1, 1,
0.4825094, -0.9426624, 4.3667, 0.09803922, 0, 1, 1,
0.4837271, 1.099201, 0.04197662, 0.1058824, 0, 1, 1,
0.4849853, 1.153221, 1.612636, 0.1098039, 0, 1, 1,
0.4903603, 0.667526, 2.618279, 0.1176471, 0, 1, 1,
0.4904363, 0.1720558, 0.1374593, 0.1215686, 0, 1, 1,
0.4925681, -0.7132925, 2.841851, 0.1294118, 0, 1, 1,
0.4934884, -0.01554123, 2.084443, 0.1333333, 0, 1, 1,
0.4959832, 0.9911159, 2.779397, 0.1411765, 0, 1, 1,
0.4988588, 0.4567694, 0.7229526, 0.145098, 0, 1, 1,
0.5045692, 0.4342076, 0.8031822, 0.1529412, 0, 1, 1,
0.5085581, 0.3130251, 3.388735, 0.1568628, 0, 1, 1,
0.5095053, -0.8888101, 1.710087, 0.1647059, 0, 1, 1,
0.5152574, 0.6091414, 0.8888138, 0.1686275, 0, 1, 1,
0.5206468, 0.6599909, 0.04896182, 0.1764706, 0, 1, 1,
0.5215834, 1.478279, 1.227771, 0.1803922, 0, 1, 1,
0.5219761, 1.383479, 0.0877418, 0.1882353, 0, 1, 1,
0.5231804, -0.3259924, 2.471478, 0.1921569, 0, 1, 1,
0.533709, 1.55307, 0.5991278, 0.2, 0, 1, 1,
0.5404741, 0.09911632, 2.164058, 0.2078431, 0, 1, 1,
0.5409297, -0.2534566, 1.264829, 0.2117647, 0, 1, 1,
0.5415255, 0.5335223, 0.195116, 0.2196078, 0, 1, 1,
0.5478013, 1.318671, 0.8151355, 0.2235294, 0, 1, 1,
0.5482637, -0.0710847, 3.006393, 0.2313726, 0, 1, 1,
0.5520223, 1.327196, 1.346255, 0.2352941, 0, 1, 1,
0.5523208, -0.3506513, 1.795979, 0.2431373, 0, 1, 1,
0.5603704, 1.222468, 1.991228, 0.2470588, 0, 1, 1,
0.5610609, -0.6932876, 1.373468, 0.254902, 0, 1, 1,
0.5624747, -0.463808, 2.50713, 0.2588235, 0, 1, 1,
0.5681886, -0.818701, 3.259766, 0.2666667, 0, 1, 1,
0.5725051, -0.007645002, 0.5332649, 0.2705882, 0, 1, 1,
0.5801478, 2.030429, 0.9924297, 0.2784314, 0, 1, 1,
0.5833138, -1.508211, 2.835701, 0.282353, 0, 1, 1,
0.5853605, -1.984764, 2.334718, 0.2901961, 0, 1, 1,
0.5956474, 0.931031, 0.2119597, 0.2941177, 0, 1, 1,
0.5961324, -0.5067897, 2.569879, 0.3019608, 0, 1, 1,
0.6014734, 0.1396581, 0.8670706, 0.3098039, 0, 1, 1,
0.6067544, -0.3976984, 1.848067, 0.3137255, 0, 1, 1,
0.6119788, -3.419451, 3.547977, 0.3215686, 0, 1, 1,
0.6181571, 0.06847835, 2.629942, 0.3254902, 0, 1, 1,
0.6181958, 0.2619719, 1.698371, 0.3333333, 0, 1, 1,
0.6220313, 0.7706262, 0.4800996, 0.3372549, 0, 1, 1,
0.6236937, -1.01586, 1.279057, 0.345098, 0, 1, 1,
0.6247427, -1.648934, 1.798814, 0.3490196, 0, 1, 1,
0.6251531, 0.5649708, 1.687834, 0.3568628, 0, 1, 1,
0.6350301, 0.4268412, 2.133649, 0.3607843, 0, 1, 1,
0.6381942, 0.8601673, 1.166166, 0.3686275, 0, 1, 1,
0.6391624, -1.354643, 1.340981, 0.372549, 0, 1, 1,
0.6395963, -0.8328624, 1.300761, 0.3803922, 0, 1, 1,
0.6410673, 0.9344378, 0.6519335, 0.3843137, 0, 1, 1,
0.647652, -0.169745, 1.234644, 0.3921569, 0, 1, 1,
0.6536173, -0.1548771, 0.4707649, 0.3960784, 0, 1, 1,
0.6547945, -0.1304413, 3.50234, 0.4039216, 0, 1, 1,
0.6557741, -0.1355895, 3.007051, 0.4117647, 0, 1, 1,
0.6566074, 0.3373978, 1.19142, 0.4156863, 0, 1, 1,
0.6613711, -0.7035816, 3.558235, 0.4235294, 0, 1, 1,
0.6652624, -0.3997237, 2.728437, 0.427451, 0, 1, 1,
0.6654742, -0.1361792, 0.4851593, 0.4352941, 0, 1, 1,
0.6668649, -0.2771539, 3.777479, 0.4392157, 0, 1, 1,
0.6717701, -0.5624598, 2.88517, 0.4470588, 0, 1, 1,
0.6801475, -0.1071645, 1.363763, 0.4509804, 0, 1, 1,
0.6827382, -0.7207399, 1.975202, 0.4588235, 0, 1, 1,
0.6833606, -0.3618836, 2.220241, 0.4627451, 0, 1, 1,
0.6924041, -0.1622684, 1.279221, 0.4705882, 0, 1, 1,
0.6935804, -0.7114211, 1.012105, 0.4745098, 0, 1, 1,
0.702401, -0.06164722, 0.3303829, 0.4823529, 0, 1, 1,
0.7034806, 0.000691867, 1.622608, 0.4862745, 0, 1, 1,
0.709816, 1.953908, 1.546611, 0.4941176, 0, 1, 1,
0.7113402, 0.9344256, 0.8632084, 0.5019608, 0, 1, 1,
0.7187716, -0.4645443, 1.634314, 0.5058824, 0, 1, 1,
0.7240171, -0.6251834, 2.701137, 0.5137255, 0, 1, 1,
0.7285776, -0.1900489, 1.270211, 0.5176471, 0, 1, 1,
0.737111, -0.4565422, 2.39243, 0.5254902, 0, 1, 1,
0.7458047, -1.56463, 2.76058, 0.5294118, 0, 1, 1,
0.7542052, -0.3053348, 2.552856, 0.5372549, 0, 1, 1,
0.7611676, 0.4205724, -1.219448, 0.5411765, 0, 1, 1,
0.7642203, -0.01593347, 3.742523, 0.5490196, 0, 1, 1,
0.764616, 0.3674486, 0.7652686, 0.5529412, 0, 1, 1,
0.7699383, 0.576054, 0.8473704, 0.5607843, 0, 1, 1,
0.7843073, -0.1663119, -0.5445606, 0.5647059, 0, 1, 1,
0.7846928, 1.817251, 0.778836, 0.572549, 0, 1, 1,
0.7859525, 0.8671294, 1.576388, 0.5764706, 0, 1, 1,
0.7861737, 0.2262384, 2.002254, 0.5843138, 0, 1, 1,
0.7880461, -0.4984071, 1.718704, 0.5882353, 0, 1, 1,
0.795072, 0.1213219, 1.185962, 0.5960785, 0, 1, 1,
0.7980086, -0.2914761, 0.6755838, 0.6039216, 0, 1, 1,
0.801213, -0.3301226, 1.782461, 0.6078432, 0, 1, 1,
0.8044285, 1.117017, 0.9591706, 0.6156863, 0, 1, 1,
0.8050364, -1.501113, 3.020591, 0.6196079, 0, 1, 1,
0.8109612, 0.6850773, 0.5421425, 0.627451, 0, 1, 1,
0.812862, -0.2904403, 3.261048, 0.6313726, 0, 1, 1,
0.8133559, -1.047695, 2.638449, 0.6392157, 0, 1, 1,
0.8187183, 0.4317353, 0.4466397, 0.6431373, 0, 1, 1,
0.8188258, -0.3605231, 0.3540656, 0.6509804, 0, 1, 1,
0.820726, -0.4619468, 1.014775, 0.654902, 0, 1, 1,
0.8240932, -0.1599317, 2.389791, 0.6627451, 0, 1, 1,
0.8272557, -2.309313, 2.321043, 0.6666667, 0, 1, 1,
0.8296379, 0.1583602, 1.457503, 0.6745098, 0, 1, 1,
0.8307394, -0.6926321, 1.612176, 0.6784314, 0, 1, 1,
0.8349855, -1.042583, 3.207146, 0.6862745, 0, 1, 1,
0.8372194, -0.1493554, 0.8909208, 0.6901961, 0, 1, 1,
0.8388674, 0.6858124, 2.791053, 0.6980392, 0, 1, 1,
0.8449365, -2.095962, 2.864936, 0.7058824, 0, 1, 1,
0.8488464, -0.7757505, 4.123209, 0.7098039, 0, 1, 1,
0.8557101, -0.1915154, 2.66327, 0.7176471, 0, 1, 1,
0.8575436, 1.18975, 1.205612, 0.7215686, 0, 1, 1,
0.8576492, -0.2786363, 2.564048, 0.7294118, 0, 1, 1,
0.8592589, 0.7243499, -0.3143028, 0.7333333, 0, 1, 1,
0.8619118, -0.650192, 3.268651, 0.7411765, 0, 1, 1,
0.8625221, 0.8108351, 0.2947963, 0.7450981, 0, 1, 1,
0.866757, 0.9456218, -0.1734898, 0.7529412, 0, 1, 1,
0.8726077, 0.8914993, 1.822121, 0.7568628, 0, 1, 1,
0.8743219, -0.1518613, 2.642093, 0.7647059, 0, 1, 1,
0.876943, 1.63404, 0.117914, 0.7686275, 0, 1, 1,
0.878891, 0.8379826, 0.08214339, 0.7764706, 0, 1, 1,
0.8818405, -1.825125, 2.762943, 0.7803922, 0, 1, 1,
0.8866154, 1.036596, -0.5438759, 0.7882353, 0, 1, 1,
0.8892, 1.235436, 0.6452836, 0.7921569, 0, 1, 1,
0.8929652, -0.3794472, 0.434735, 0.8, 0, 1, 1,
0.8932419, -0.1677631, 1.814653, 0.8078431, 0, 1, 1,
0.8936445, 0.4416506, 1.787494, 0.8117647, 0, 1, 1,
0.8954468, -0.0421759, 0.9018012, 0.8196079, 0, 1, 1,
0.8959857, 0.5100213, 1.090576, 0.8235294, 0, 1, 1,
0.8971782, -0.4255972, 3.158558, 0.8313726, 0, 1, 1,
0.8973425, 0.9109862, 0.08360859, 0.8352941, 0, 1, 1,
0.8985478, -0.09746795, 3.876265, 0.8431373, 0, 1, 1,
0.8988869, 1.164901, 2.062098, 0.8470588, 0, 1, 1,
0.9001117, 0.7824183, 2.873009, 0.854902, 0, 1, 1,
0.9034058, 1.483375, 1.462583, 0.8588235, 0, 1, 1,
0.9153941, 0.03175592, 2.825837, 0.8666667, 0, 1, 1,
0.9179346, -0.6853198, 1.78904, 0.8705882, 0, 1, 1,
0.9245542, 0.648876, 0.7214283, 0.8784314, 0, 1, 1,
0.9316249, 0.9219754, 1.262179, 0.8823529, 0, 1, 1,
0.9350775, -1.146464, 1.473039, 0.8901961, 0, 1, 1,
0.9401966, -0.8102919, 2.475611, 0.8941177, 0, 1, 1,
0.9453859, -0.5063128, 2.26514, 0.9019608, 0, 1, 1,
0.9524481, -0.8192604, 2.29659, 0.9098039, 0, 1, 1,
0.9539685, -0.008599525, 1.655278, 0.9137255, 0, 1, 1,
0.9569373, 1.507322, -0.02807445, 0.9215686, 0, 1, 1,
0.9582288, -0.7918738, 1.728655, 0.9254902, 0, 1, 1,
0.9599903, 0.6633545, -0.4457077, 0.9333333, 0, 1, 1,
0.9619428, -0.2143291, 1.436856, 0.9372549, 0, 1, 1,
0.9621396, -0.1547285, 2.707021, 0.945098, 0, 1, 1,
0.963161, -0.2759985, 0.2470225, 0.9490196, 0, 1, 1,
0.9652864, -0.8092341, 3.001895, 0.9568627, 0, 1, 1,
0.9658317, -0.744166, 2.490678, 0.9607843, 0, 1, 1,
0.9689221, -0.8985711, 2.155196, 0.9686275, 0, 1, 1,
0.9693881, -0.3125642, 2.227501, 0.972549, 0, 1, 1,
0.9699305, -1.815566, 2.065661, 0.9803922, 0, 1, 1,
0.9732609, 0.662986, 1.056249, 0.9843137, 0, 1, 1,
0.9734329, 0.5815883, 1.855949, 0.9921569, 0, 1, 1,
0.9815124, -0.8834964, 0.3751443, 0.9960784, 0, 1, 1,
0.9886678, -1.255977, 3.156031, 1, 0, 0.9960784, 1,
0.9923916, -1.729964, 3.394219, 1, 0, 0.9882353, 1,
0.9959074, -1.360419, 2.420048, 1, 0, 0.9843137, 1,
1.007201, -0.455712, 1.196386, 1, 0, 0.9764706, 1,
1.009111, 0.1665667, 1.484098, 1, 0, 0.972549, 1,
1.010618, -1.229504, 4.095087, 1, 0, 0.9647059, 1,
1.017573, 0.8796562, 0.7767398, 1, 0, 0.9607843, 1,
1.01942, -0.1675913, 2.835471, 1, 0, 0.9529412, 1,
1.019934, -0.4916039, 2.277636, 1, 0, 0.9490196, 1,
1.020116, 0.4359457, 1.377368, 1, 0, 0.9411765, 1,
1.020662, -0.6411506, 2.606325, 1, 0, 0.9372549, 1,
1.035553, -0.200915, -0.7980173, 1, 0, 0.9294118, 1,
1.039347, -0.119653, 2.949313, 1, 0, 0.9254902, 1,
1.041744, 1.030377, -0.1636331, 1, 0, 0.9176471, 1,
1.042569, 0.2534754, 2.797962, 1, 0, 0.9137255, 1,
1.047843, 0.9363896, 0.2430898, 1, 0, 0.9058824, 1,
1.051796, -1.543376, 2.783348, 1, 0, 0.9019608, 1,
1.056147, 0.07487657, 0.05941983, 1, 0, 0.8941177, 1,
1.059291, -0.1957162, 4.150639, 1, 0, 0.8862745, 1,
1.061091, 0.6504524, 2.133487, 1, 0, 0.8823529, 1,
1.066116, -0.01709264, 1.60863, 1, 0, 0.8745098, 1,
1.086169, 0.5023886, 1.975776, 1, 0, 0.8705882, 1,
1.089585, -0.935571, 4.456045, 1, 0, 0.8627451, 1,
1.089784, -1.503279, 2.452631, 1, 0, 0.8588235, 1,
1.094009, -0.2566861, 1.135292, 1, 0, 0.8509804, 1,
1.097686, 3.016877, 2.074126, 1, 0, 0.8470588, 1,
1.0983, -1.400591, 0.8044705, 1, 0, 0.8392157, 1,
1.100316, 0.8960814, 0.1896183, 1, 0, 0.8352941, 1,
1.101485, 0.1421342, 1.146718, 1, 0, 0.827451, 1,
1.102405, 0.6611319, 0.3953256, 1, 0, 0.8235294, 1,
1.110931, 1.058501, -0.2744393, 1, 0, 0.8156863, 1,
1.119807, -1.209641, 0.9036027, 1, 0, 0.8117647, 1,
1.127878, -1.153058, 0.6182152, 1, 0, 0.8039216, 1,
1.130249, -0.7851676, 0.7981117, 1, 0, 0.7960784, 1,
1.149052, 0.2792234, 1.257596, 1, 0, 0.7921569, 1,
1.153191, -0.6050839, 2.877068, 1, 0, 0.7843137, 1,
1.172853, -0.2311728, 3.200502, 1, 0, 0.7803922, 1,
1.174999, 0.287554, 2.053545, 1, 0, 0.772549, 1,
1.176115, -0.6931353, 3.288514, 1, 0, 0.7686275, 1,
1.181912, 0.5629506, 1.713512, 1, 0, 0.7607843, 1,
1.192557, -1.63811, 3.301656, 1, 0, 0.7568628, 1,
1.194439, 0.6065045, 1.257021, 1, 0, 0.7490196, 1,
1.194788, -0.6891205, 3.204915, 1, 0, 0.7450981, 1,
1.200635, -1.542672, 2.930562, 1, 0, 0.7372549, 1,
1.204026, -1.544047, 4.289086, 1, 0, 0.7333333, 1,
1.205559, 1.475088, 1.230126, 1, 0, 0.7254902, 1,
1.207859, -0.9726359, 1.050887, 1, 0, 0.7215686, 1,
1.209749, 0.6152224, 1.294622, 1, 0, 0.7137255, 1,
1.21582, -1.242803, 1.956855, 1, 0, 0.7098039, 1,
1.225279, -1.170641, 2.831842, 1, 0, 0.7019608, 1,
1.23621, -1.842138, 1.919739, 1, 0, 0.6941177, 1,
1.240222, -0.4768817, 0.5240418, 1, 0, 0.6901961, 1,
1.240536, -0.3200137, 1.863423, 1, 0, 0.682353, 1,
1.244874, 0.3265574, 0.9803005, 1, 0, 0.6784314, 1,
1.247182, 0.5614879, 0.9875767, 1, 0, 0.6705883, 1,
1.248017, 0.6874784, 1.850124, 1, 0, 0.6666667, 1,
1.253688, 1.293372, 0.9226003, 1, 0, 0.6588235, 1,
1.254196, -0.6660826, 1.327225, 1, 0, 0.654902, 1,
1.261493, 0.485031, 1.091558, 1, 0, 0.6470588, 1,
1.262004, 0.9830413, 1.780524, 1, 0, 0.6431373, 1,
1.271282, 0.1924179, 1.773036, 1, 0, 0.6352941, 1,
1.273212, 0.6821361, 2.169892, 1, 0, 0.6313726, 1,
1.27377, -0.9698297, 1.959544, 1, 0, 0.6235294, 1,
1.274942, 0.8648345, 0.9021899, 1, 0, 0.6196079, 1,
1.275208, 0.1118606, 1.977853, 1, 0, 0.6117647, 1,
1.275547, -0.5245934, -0.110015, 1, 0, 0.6078432, 1,
1.276441, 1.355552, 1.762274, 1, 0, 0.6, 1,
1.282253, -1.027791, 2.257772, 1, 0, 0.5921569, 1,
1.28292, -1.104459, 1.825387, 1, 0, 0.5882353, 1,
1.283271, -1.242511, 0.188968, 1, 0, 0.5803922, 1,
1.292661, -0.5239982, 2.00533, 1, 0, 0.5764706, 1,
1.298673, -0.03668899, 2.5025, 1, 0, 0.5686275, 1,
1.30372, 1.427558, -0.9126135, 1, 0, 0.5647059, 1,
1.317775, 0.7281199, 3.199787, 1, 0, 0.5568628, 1,
1.318769, -0.5347434, 1.490047, 1, 0, 0.5529412, 1,
1.324145, 1.145684, -0.3497283, 1, 0, 0.5450981, 1,
1.324286, -0.9121274, 1.869661, 1, 0, 0.5411765, 1,
1.351837, 0.009425607, 2.425331, 1, 0, 0.5333334, 1,
1.358521, 2.269247, -0.104623, 1, 0, 0.5294118, 1,
1.370664, 0.3842788, 0.6770952, 1, 0, 0.5215687, 1,
1.373886, -0.3504359, 1.600417, 1, 0, 0.5176471, 1,
1.379632, 0.1502133, -0.1958998, 1, 0, 0.509804, 1,
1.384729, 0.2209737, 1.900059, 1, 0, 0.5058824, 1,
1.38817, -1.613256, 0.9206389, 1, 0, 0.4980392, 1,
1.389232, 0.5098631, 1.769871, 1, 0, 0.4901961, 1,
1.390577, 1.072426, 1.743064, 1, 0, 0.4862745, 1,
1.395712, 0.9894072, -0.4150917, 1, 0, 0.4784314, 1,
1.397732, 1.260868, 1.94585, 1, 0, 0.4745098, 1,
1.399515, 1.021745, 0.3185204, 1, 0, 0.4666667, 1,
1.399537, 0.004417471, -0.4874342, 1, 0, 0.4627451, 1,
1.401508, 0.02423142, 0.8813105, 1, 0, 0.454902, 1,
1.414145, -0.3592958, 4.099539, 1, 0, 0.4509804, 1,
1.416654, 0.2162196, 0.9125906, 1, 0, 0.4431373, 1,
1.418129, -0.8463562, 3.618295, 1, 0, 0.4392157, 1,
1.418858, -0.4545588, 2.357687, 1, 0, 0.4313726, 1,
1.421435, -0.1850992, 2.122182, 1, 0, 0.427451, 1,
1.426475, 0.4354208, 2.590263, 1, 0, 0.4196078, 1,
1.439616, -0.8608143, 0.8065812, 1, 0, 0.4156863, 1,
1.463019, -0.2724611, 1.202221, 1, 0, 0.4078431, 1,
1.469341, 1.051647, 0.4165617, 1, 0, 0.4039216, 1,
1.471008, -0.2283712, 4.035815, 1, 0, 0.3960784, 1,
1.471707, 1.447376, 0.08343901, 1, 0, 0.3882353, 1,
1.4768, -0.3639313, 2.889811, 1, 0, 0.3843137, 1,
1.480889, -0.1839478, 0.5768766, 1, 0, 0.3764706, 1,
1.491206, -1.135008, 0.9806954, 1, 0, 0.372549, 1,
1.492927, 1.41943, 0.8989763, 1, 0, 0.3647059, 1,
1.499239, 0.7754686, 0.291844, 1, 0, 0.3607843, 1,
1.507839, 0.9765649, 1.027061, 1, 0, 0.3529412, 1,
1.50947, -0.2011179, 0.2599622, 1, 0, 0.3490196, 1,
1.511892, 1.981714, 0.1935128, 1, 0, 0.3411765, 1,
1.522781, -0.1783491, 2.265217, 1, 0, 0.3372549, 1,
1.527532, 0.5740597, 2.059151, 1, 0, 0.3294118, 1,
1.53175, -1.772536, 1.930688, 1, 0, 0.3254902, 1,
1.533217, -1.508746, 2.1598, 1, 0, 0.3176471, 1,
1.542515, 0.2151311, 1.465274, 1, 0, 0.3137255, 1,
1.552829, 0.2420997, 1.511345, 1, 0, 0.3058824, 1,
1.559312, 1.559349, -0.01231765, 1, 0, 0.2980392, 1,
1.56175, -1.445453, 1.163925, 1, 0, 0.2941177, 1,
1.571185, -1.600493, 3.806716, 1, 0, 0.2862745, 1,
1.574635, 0.1259507, 2.418853, 1, 0, 0.282353, 1,
1.576424, -0.9925527, 1.798524, 1, 0, 0.2745098, 1,
1.59087, -1.950749, 2.090189, 1, 0, 0.2705882, 1,
1.592808, 0.5693145, 1.303818, 1, 0, 0.2627451, 1,
1.603083, 0.4095259, 2.430683, 1, 0, 0.2588235, 1,
1.61562, -0.324653, 1.995523, 1, 0, 0.2509804, 1,
1.615817, 0.2274761, 0.5937095, 1, 0, 0.2470588, 1,
1.623075, -0.7584571, 2.172645, 1, 0, 0.2392157, 1,
1.628289, 0.3411456, 1.063209, 1, 0, 0.2352941, 1,
1.644506, 0.2709796, 0.8312197, 1, 0, 0.227451, 1,
1.645314, 2.504044, 0.5531018, 1, 0, 0.2235294, 1,
1.648729, 0.5127211, 2.292958, 1, 0, 0.2156863, 1,
1.651715, -1.752601, 2.693666, 1, 0, 0.2117647, 1,
1.652337, -0.3123651, 2.184271, 1, 0, 0.2039216, 1,
1.665172, 0.04594997, 1.643026, 1, 0, 0.1960784, 1,
1.689752, -0.4096977, 2.024529, 1, 0, 0.1921569, 1,
1.692537, 0.3027182, 0.2571797, 1, 0, 0.1843137, 1,
1.69602, 0.5024704, -0.1182802, 1, 0, 0.1803922, 1,
1.703295, -1.294929, 2.499166, 1, 0, 0.172549, 1,
1.708961, -1.792196, 1.870032, 1, 0, 0.1686275, 1,
1.711514, -0.03266476, 0.7947616, 1, 0, 0.1607843, 1,
1.722978, -0.2471823, 1.232633, 1, 0, 0.1568628, 1,
1.731626, 0.1948049, 2.513157, 1, 0, 0.1490196, 1,
1.738263, 1.259555, 1.036264, 1, 0, 0.145098, 1,
1.743346, 0.4715198, 0.3541578, 1, 0, 0.1372549, 1,
1.789192, 0.5453091, 0.946689, 1, 0, 0.1333333, 1,
1.802991, 1.559219, 0.805482, 1, 0, 0.1254902, 1,
1.822447, 1.547509, 0.9586327, 1, 0, 0.1215686, 1,
1.846941, 0.1148035, 1.081589, 1, 0, 0.1137255, 1,
1.853963, 0.5148156, 1.609599, 1, 0, 0.1098039, 1,
1.905385, 0.8718972, 1.87043, 1, 0, 0.1019608, 1,
1.9121, 0.5476985, 0.8019162, 1, 0, 0.09411765, 1,
1.954255, 0.5449735, 1.042261, 1, 0, 0.09019608, 1,
1.959952, 0.5653461, 0.4733117, 1, 0, 0.08235294, 1,
2.020839, -0.8413123, 2.111305, 1, 0, 0.07843138, 1,
2.074654, 0.1697561, 2.241521, 1, 0, 0.07058824, 1,
2.085922, -1.2611, 1.465616, 1, 0, 0.06666667, 1,
2.172975, -0.9282122, 2.384032, 1, 0, 0.05882353, 1,
2.17362, 0.05195636, 1.424048, 1, 0, 0.05490196, 1,
2.193424, -0.3582652, -0.8435715, 1, 0, 0.04705882, 1,
2.274163, -1.364807, 3.073902, 1, 0, 0.04313726, 1,
2.299551, -0.6074207, 3.098161, 1, 0, 0.03529412, 1,
2.463086, 0.4174521, 1.715052, 1, 0, 0.03137255, 1,
2.46805, 1.04687, 1.764584, 1, 0, 0.02352941, 1,
2.54096, 2.084454, 0.4052372, 1, 0, 0.01960784, 1,
2.558084, 0.9719493, 1.657298, 1, 0, 0.01176471, 1,
2.604037, -1.098458, -0.3087638, 1, 0, 0.007843138, 1
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
-0.3373637, -4.540277, -6.853644, 0, -0.5, 0.5, 0.5,
-0.3373637, -4.540277, -6.853644, 1, -0.5, 0.5, 0.5,
-0.3373637, -4.540277, -6.853644, 1, 1.5, 0.5, 0.5,
-0.3373637, -4.540277, -6.853644, 0, 1.5, 0.5, 0.5
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
-4.2759, -0.1131788, -6.853644, 0, -0.5, 0.5, 0.5,
-4.2759, -0.1131788, -6.853644, 1, -0.5, 0.5, 0.5,
-4.2759, -0.1131788, -6.853644, 1, 1.5, 0.5, 0.5,
-4.2759, -0.1131788, -6.853644, 0, 1.5, 0.5, 0.5
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
-4.2759, -4.540277, 0.5932837, 0, -0.5, 0.5, 0.5,
-4.2759, -4.540277, 0.5932837, 1, -0.5, 0.5, 0.5,
-4.2759, -4.540277, 0.5932837, 1, 1.5, 0.5, 0.5,
-4.2759, -4.540277, 0.5932837, 0, 1.5, 0.5, 0.5
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
-3, -3.518639, -5.135122,
2, -3.518639, -5.135122,
-3, -3.518639, -5.135122,
-3, -3.688912, -5.421543,
-2, -3.518639, -5.135122,
-2, -3.688912, -5.421543,
-1, -3.518639, -5.135122,
-1, -3.688912, -5.421543,
0, -3.518639, -5.135122,
0, -3.688912, -5.421543,
1, -3.518639, -5.135122,
1, -3.688912, -5.421543,
2, -3.518639, -5.135122,
2, -3.688912, -5.421543
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
-3, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
-3, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
-3, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
-3, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5,
-2, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
-2, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
-2, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
-2, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5,
-1, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
-1, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
-1, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
-1, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5,
0, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
0, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
0, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
0, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5,
1, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
1, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
1, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
1, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5,
2, -4.029458, -5.994383, 0, -0.5, 0.5, 0.5,
2, -4.029458, -5.994383, 1, -0.5, 0.5, 0.5,
2, -4.029458, -5.994383, 1, 1.5, 0.5, 0.5,
2, -4.029458, -5.994383, 0, 1.5, 0.5, 0.5
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
-3.367007, -3, -5.135122,
-3.367007, 3, -5.135122,
-3.367007, -3, -5.135122,
-3.518489, -3, -5.421543,
-3.367007, -2, -5.135122,
-3.518489, -2, -5.421543,
-3.367007, -1, -5.135122,
-3.518489, -1, -5.421543,
-3.367007, 0, -5.135122,
-3.518489, 0, -5.421543,
-3.367007, 1, -5.135122,
-3.518489, 1, -5.421543,
-3.367007, 2, -5.135122,
-3.518489, 2, -5.421543,
-3.367007, 3, -5.135122,
-3.518489, 3, -5.421543
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
-3.821453, -3, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, -3, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, -3, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, -3, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, -2, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, -2, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, -2, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, -2, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, -1, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, -1, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, -1, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, -1, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, 0, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, 0, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, 0, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, 0, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, 1, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, 1, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, 1, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, 1, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, 2, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, 2, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, 2, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, 2, -5.994383, 0, 1.5, 0.5, 0.5,
-3.821453, 3, -5.994383, 0, -0.5, 0.5, 0.5,
-3.821453, 3, -5.994383, 1, -0.5, 0.5, 0.5,
-3.821453, 3, -5.994383, 1, 1.5, 0.5, 0.5,
-3.821453, 3, -5.994383, 0, 1.5, 0.5, 0.5
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
-3.367007, -3.518639, -4,
-3.367007, -3.518639, 6,
-3.367007, -3.518639, -4,
-3.518489, -3.688912, -4,
-3.367007, -3.518639, -2,
-3.518489, -3.688912, -2,
-3.367007, -3.518639, 0,
-3.518489, -3.688912, 0,
-3.367007, -3.518639, 2,
-3.518489, -3.688912, 2,
-3.367007, -3.518639, 4,
-3.518489, -3.688912, 4,
-3.367007, -3.518639, 6,
-3.518489, -3.688912, 6
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
-3.821453, -4.029458, -4, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, -4, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, -4, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, -4, 0, 1.5, 0.5, 0.5,
-3.821453, -4.029458, -2, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, -2, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, -2, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, -2, 0, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 0, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 0, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 0, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 0, 0, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 2, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 2, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 2, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 2, 0, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 4, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 4, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 4, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 4, 0, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 6, 0, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 6, 1, -0.5, 0.5, 0.5,
-3.821453, -4.029458, 6, 1, 1.5, 0.5, 0.5,
-3.821453, -4.029458, 6, 0, 1.5, 0.5, 0.5
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
-3.367007, -3.518639, -5.135122,
-3.367007, 3.292281, -5.135122,
-3.367007, -3.518639, 6.32169,
-3.367007, 3.292281, 6.32169,
-3.367007, -3.518639, -5.135122,
-3.367007, -3.518639, 6.32169,
-3.367007, 3.292281, -5.135122,
-3.367007, 3.292281, 6.32169,
-3.367007, -3.518639, -5.135122,
2.692279, -3.518639, -5.135122,
-3.367007, -3.518639, 6.32169,
2.692279, -3.518639, 6.32169,
-3.367007, 3.292281, -5.135122,
2.692279, 3.292281, -5.135122,
-3.367007, 3.292281, 6.32169,
2.692279, 3.292281, 6.32169,
2.692279, -3.518639, -5.135122,
2.692279, 3.292281, -5.135122,
2.692279, -3.518639, 6.32169,
2.692279, 3.292281, 6.32169,
2.692279, -3.518639, -5.135122,
2.692279, -3.518639, 6.32169,
2.692279, 3.292281, -5.135122,
2.692279, 3.292281, 6.32169
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
var radius = 7.818069;
var distance = 34.78347;
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
mvMatrix.translate( 0.3373637, 0.1131788, -0.5932837 );
mvMatrix.scale( 1.395057, 1.241102, 0.7378186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.78347);
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
4-chlorobenzoic_acid<-read.table("4-chlorobenzoic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-chlorobenzoic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzoic_acid' not found
```

```r
y<-4-chlorobenzoic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzoic_acid' not found
```

```r
z<-4-chlorobenzoic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorobenzoic_acid' not found
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
-3.278765, -1.282787, -2.01506, 0, 0, 1, 1, 1,
-3.274382, 0.430284, -1.703208, 1, 0, 0, 1, 1,
-3.175492, 0.3814291, -1.311578, 1, 0, 0, 1, 1,
-2.929446, 1.115979, 0.721718, 1, 0, 0, 1, 1,
-2.828298, 2.083019, -1.031265, 1, 0, 0, 1, 1,
-2.797496, -0.5001448, -1.760865, 1, 0, 0, 1, 1,
-2.737329, 0.270339, -1.199964, 0, 0, 0, 1, 1,
-2.666657, -0.6412095, 0.009476395, 0, 0, 0, 1, 1,
-2.60411, 0.5576649, -2.316917, 0, 0, 0, 1, 1,
-2.570063, -1.272267, -4.227323, 0, 0, 0, 1, 1,
-2.393038, -0.5315968, -1.622847, 0, 0, 0, 1, 1,
-2.351503, -0.8610374, -1.584052, 0, 0, 0, 1, 1,
-2.311954, 0.07214234, -2.007459, 0, 0, 0, 1, 1,
-2.239732, 0.9638498, -1.181164, 1, 1, 1, 1, 1,
-2.232252, 0.8518713, -0.3329386, 1, 1, 1, 1, 1,
-2.185889, 2.725572, -1.508424, 1, 1, 1, 1, 1,
-2.173805, -0.3897142, -1.672986, 1, 1, 1, 1, 1,
-2.146662, -0.03049765, -2.865123, 1, 1, 1, 1, 1,
-2.133991, 0.2655978, -2.074813, 1, 1, 1, 1, 1,
-2.118818, 0.4044271, -1.534225, 1, 1, 1, 1, 1,
-2.117632, 0.3307464, -2.208642, 1, 1, 1, 1, 1,
-2.096177, -1.023619, -2.53133, 1, 1, 1, 1, 1,
-2.095253, -0.5196766, -1.396437, 1, 1, 1, 1, 1,
-2.069122, -0.4010417, -2.347828, 1, 1, 1, 1, 1,
-2.046248, -0.4843226, -3.011846, 1, 1, 1, 1, 1,
-2.008061, -0.8724473, -1.282612, 1, 1, 1, 1, 1,
-2.005678, -1.563784, -1.071457, 1, 1, 1, 1, 1,
-1.988289, 1.849189, 0.2270453, 1, 1, 1, 1, 1,
-1.938855, -0.4552326, -1.400787, 0, 0, 1, 1, 1,
-1.929302, 0.1657679, -2.454293, 1, 0, 0, 1, 1,
-1.926649, -0.7570816, -1.801228, 1, 0, 0, 1, 1,
-1.8932, -2.341642, -1.870983, 1, 0, 0, 1, 1,
-1.859058, 0.03742142, -0.9460599, 1, 0, 0, 1, 1,
-1.826823, -0.2016718, -4.230557, 1, 0, 0, 1, 1,
-1.779204, -1.389858, -1.326522, 0, 0, 0, 1, 1,
-1.776501, 0.7900504, -0.4324763, 0, 0, 0, 1, 1,
-1.775732, -0.5294471, -0.5347165, 0, 0, 0, 1, 1,
-1.768666, 1.209009, -0.6851488, 0, 0, 0, 1, 1,
-1.756173, -1.692934, -3.030128, 0, 0, 0, 1, 1,
-1.728676, 0.9765236, -1.679179, 0, 0, 0, 1, 1,
-1.724496, 0.401767, -0.606979, 0, 0, 0, 1, 1,
-1.720155, -1.078814, -3.817592, 1, 1, 1, 1, 1,
-1.713238, 0.3451903, -0.5229458, 1, 1, 1, 1, 1,
-1.708522, 1.840849, -1.225718, 1, 1, 1, 1, 1,
-1.667603, -2.130197, -3.206249, 1, 1, 1, 1, 1,
-1.648598, 0.2367246, -0.7825634, 1, 1, 1, 1, 1,
-1.637757, 0.04478708, -0.3049001, 1, 1, 1, 1, 1,
-1.612819, -0.5293934, -1.656289, 1, 1, 1, 1, 1,
-1.581905, 1.775512, -1.315406, 1, 1, 1, 1, 1,
-1.581599, 1.09183, 0.1521771, 1, 1, 1, 1, 1,
-1.579066, -2.237919, -2.619449, 1, 1, 1, 1, 1,
-1.577635, -0.6118476, -0.07496589, 1, 1, 1, 1, 1,
-1.568976, 0.4059618, -1.657275, 1, 1, 1, 1, 1,
-1.564963, 0.1335851, -1.909694, 1, 1, 1, 1, 1,
-1.554807, 1.663834, -0.9976066, 1, 1, 1, 1, 1,
-1.541792, -1.418239, -2.002998, 1, 1, 1, 1, 1,
-1.537098, 1.553723, -0.6625335, 0, 0, 1, 1, 1,
-1.535847, 0.3432399, -0.4853115, 1, 0, 0, 1, 1,
-1.534318, -0.6754424, -3.086044, 1, 0, 0, 1, 1,
-1.529768, -1.40475, -3.94224, 1, 0, 0, 1, 1,
-1.529502, 1.863778, -1.77294, 1, 0, 0, 1, 1,
-1.528245, 1.36107, -1.184267, 1, 0, 0, 1, 1,
-1.52566, -0.2058493, 0.941559, 0, 0, 0, 1, 1,
-1.523204, 0.6523542, -2.156667, 0, 0, 0, 1, 1,
-1.51802, 0.1947855, -0.133004, 0, 0, 0, 1, 1,
-1.505835, -0.9041291, -3.134713, 0, 0, 0, 1, 1,
-1.505157, -0.1759977, -2.924444, 0, 0, 0, 1, 1,
-1.504429, 1.067863, -0.4040759, 0, 0, 0, 1, 1,
-1.502935, 1.966183, 0.8948021, 0, 0, 0, 1, 1,
-1.495765, 0.5570208, -2.617548, 1, 1, 1, 1, 1,
-1.473182, 0.6724679, -0.8253159, 1, 1, 1, 1, 1,
-1.461239, 0.8547376, -0.7263392, 1, 1, 1, 1, 1,
-1.458001, 0.7548122, 0.1783897, 1, 1, 1, 1, 1,
-1.457335, 1.223613, -0.7105929, 1, 1, 1, 1, 1,
-1.455392, -1.26947, -2.052242, 1, 1, 1, 1, 1,
-1.452196, -0.4575341, -1.332118, 1, 1, 1, 1, 1,
-1.451458, -0.2669373, -1.186456, 1, 1, 1, 1, 1,
-1.44195, -1.01281, -0.1271258, 1, 1, 1, 1, 1,
-1.436637, 0.5165698, -0.1850089, 1, 1, 1, 1, 1,
-1.422124, 0.4104883, -0.08077869, 1, 1, 1, 1, 1,
-1.416118, -1.710777, -0.8744854, 1, 1, 1, 1, 1,
-1.378381, -1.175311, -2.418895, 1, 1, 1, 1, 1,
-1.377534, 1.625867, -1.647971, 1, 1, 1, 1, 1,
-1.372741, -0.9980829, -2.673903, 1, 1, 1, 1, 1,
-1.366051, -1.178623, -2.039567, 0, 0, 1, 1, 1,
-1.359252, 0.2683708, -0.1300775, 1, 0, 0, 1, 1,
-1.353923, -0.2511377, -3.385453, 1, 0, 0, 1, 1,
-1.342183, 0.6843233, -0.3359427, 1, 0, 0, 1, 1,
-1.337302, -0.9649456, -2.35369, 1, 0, 0, 1, 1,
-1.318687, 0.05878109, -3.656174, 1, 0, 0, 1, 1,
-1.316387, -1.455232, -2.175818, 0, 0, 0, 1, 1,
-1.315548, 0.2519154, -1.878069, 0, 0, 0, 1, 1,
-1.31068, -0.3647093, -1.727161, 0, 0, 0, 1, 1,
-1.309725, -0.2188041, -4.630718, 0, 0, 0, 1, 1,
-1.309173, 1.084513, -0.9644013, 0, 0, 0, 1, 1,
-1.307407, 0.4798703, -0.3648253, 0, 0, 0, 1, 1,
-1.30486, 0.7549152, -0.9884123, 0, 0, 0, 1, 1,
-1.298363, -0.2130265, -1.716456, 1, 1, 1, 1, 1,
-1.290865, 0.6055955, 0.04073887, 1, 1, 1, 1, 1,
-1.288118, -0.5794593, -3.414031, 1, 1, 1, 1, 1,
-1.287126, -0.5349458, -1.698822, 1, 1, 1, 1, 1,
-1.284351, 0.525281, 0.4980991, 1, 1, 1, 1, 1,
-1.273266, -1.105439, -2.773025, 1, 1, 1, 1, 1,
-1.266896, 0.8305741, -2.204885, 1, 1, 1, 1, 1,
-1.265868, -1.00805, -2.741471, 1, 1, 1, 1, 1,
-1.263403, -0.04770587, -2.149913, 1, 1, 1, 1, 1,
-1.260858, 0.1879136, -1.208258, 1, 1, 1, 1, 1,
-1.254606, -0.7249545, -0.1372097, 1, 1, 1, 1, 1,
-1.24873, 1.547217, 0.2586493, 1, 1, 1, 1, 1,
-1.247773, 1.258675, -1.399021, 1, 1, 1, 1, 1,
-1.245047, -0.5288885, -2.694702, 1, 1, 1, 1, 1,
-1.228189, -0.5657416, -2.806157, 1, 1, 1, 1, 1,
-1.227603, -1.102934, -2.569864, 0, 0, 1, 1, 1,
-1.208576, -0.3024731, -3.798149, 1, 0, 0, 1, 1,
-1.203027, -0.7348942, -2.719926, 1, 0, 0, 1, 1,
-1.200643, 0.7865734, -1.220036, 1, 0, 0, 1, 1,
-1.198553, -0.08306475, -2.860713, 1, 0, 0, 1, 1,
-1.195319, 0.5614663, -0.6394565, 1, 0, 0, 1, 1,
-1.190358, -0.1472546, -2.218992, 0, 0, 0, 1, 1,
-1.185408, 1.156415, -0.9929332, 0, 0, 0, 1, 1,
-1.1648, 0.8297108, 0.3289237, 0, 0, 0, 1, 1,
-1.164086, -1.203371, -2.445158, 0, 0, 0, 1, 1,
-1.152492, 0.3054965, -1.34145, 0, 0, 0, 1, 1,
-1.141943, -1.663458, -1.995933, 0, 0, 0, 1, 1,
-1.141842, -1.001043, -3.168644, 0, 0, 0, 1, 1,
-1.141132, -1.472606, -0.3232798, 1, 1, 1, 1, 1,
-1.136713, 1.311622, -0.1037223, 1, 1, 1, 1, 1,
-1.114287, 0.05798205, -2.375043, 1, 1, 1, 1, 1,
-1.106988, 0.4040566, -1.476522, 1, 1, 1, 1, 1,
-1.103155, -0.5644074, -1.725102, 1, 1, 1, 1, 1,
-1.095967, 2.033385, -2.735819, 1, 1, 1, 1, 1,
-1.089466, -1.512671, -3.585986, 1, 1, 1, 1, 1,
-1.086182, -1.674471, -2.391928, 1, 1, 1, 1, 1,
-1.084926, 0.4212004, -1.728243, 1, 1, 1, 1, 1,
-1.082857, -1.411566, -2.859892, 1, 1, 1, 1, 1,
-1.081458, -0.1729479, -2.048796, 1, 1, 1, 1, 1,
-1.081293, -0.4433911, -1.229458, 1, 1, 1, 1, 1,
-1.08008, 0.259723, -2.992978, 1, 1, 1, 1, 1,
-1.078379, 1.096135, -1.492095, 1, 1, 1, 1, 1,
-1.075863, 0.3734544, -1.62034, 1, 1, 1, 1, 1,
-1.074043, -0.0328238, -1.965631, 0, 0, 1, 1, 1,
-1.07153, -1.469587, -2.691729, 1, 0, 0, 1, 1,
-1.070458, 2.235034, -0.2645281, 1, 0, 0, 1, 1,
-1.068984, 0.1288657, -2.869532, 1, 0, 0, 1, 1,
-1.061015, 0.560655, -2.304122, 1, 0, 0, 1, 1,
-1.052035, 0.1779751, -2.188657, 1, 0, 0, 1, 1,
-1.047936, 0.511808, -2.514232, 0, 0, 0, 1, 1,
-1.036187, 1.493594, -1.956986, 0, 0, 0, 1, 1,
-1.034182, 1.107236, -1.29397, 0, 0, 0, 1, 1,
-1.031564, 0.1970431, -1.158198, 0, 0, 0, 1, 1,
-1.02791, -1.00284, -1.815112, 0, 0, 0, 1, 1,
-1.026804, -0.3796142, -2.438806, 0, 0, 0, 1, 1,
-1.019792, 1.310088, -1.922849, 0, 0, 0, 1, 1,
-1.003717, 0.571, -1.510766, 1, 1, 1, 1, 1,
-0.9912454, 1.861728, -0.9971566, 1, 1, 1, 1, 1,
-0.9861304, 0.892974, -0.8204255, 1, 1, 1, 1, 1,
-0.9858593, 0.02232194, -0.3997579, 1, 1, 1, 1, 1,
-0.9847513, 0.8311041, 0.641833, 1, 1, 1, 1, 1,
-0.984345, 0.08683448, -0.3439417, 1, 1, 1, 1, 1,
-0.9826795, -0.04194343, -1.051857, 1, 1, 1, 1, 1,
-0.9759255, 0.7916582, -0.3826226, 1, 1, 1, 1, 1,
-0.9731466, -1.709414, -3.698287, 1, 1, 1, 1, 1,
-0.9600092, -0.03974191, -0.978398, 1, 1, 1, 1, 1,
-0.958578, 2.373494, -2.265468, 1, 1, 1, 1, 1,
-0.956641, -1.677203, -3.636404, 1, 1, 1, 1, 1,
-0.9524771, -0.419232, -2.399893, 1, 1, 1, 1, 1,
-0.9508575, 2.776399, -1.908928, 1, 1, 1, 1, 1,
-0.9504416, -0.2835841, -2.08335, 1, 1, 1, 1, 1,
-0.9482133, 0.2546433, -0.6305221, 0, 0, 1, 1, 1,
-0.9475279, -1.356589, -2.396091, 1, 0, 0, 1, 1,
-0.9418646, 0.2318884, -1.774362, 1, 0, 0, 1, 1,
-0.9387627, 0.660789, 0.2515562, 1, 0, 0, 1, 1,
-0.937877, -1.787541, -3.358707, 1, 0, 0, 1, 1,
-0.9372111, 1.980264, -0.8881278, 1, 0, 0, 1, 1,
-0.9351276, 0.5368125, -1.010285, 0, 0, 0, 1, 1,
-0.9328757, -0.1399143, -3.329869, 0, 0, 0, 1, 1,
-0.928829, -1.060171, -1.0438, 0, 0, 0, 1, 1,
-0.9224762, -0.1927437, -4.267369, 0, 0, 0, 1, 1,
-0.9155331, 1.489371, -1.358233, 0, 0, 0, 1, 1,
-0.9140333, -0.3957331, -2.152441, 0, 0, 0, 1, 1,
-0.9123614, 0.4719557, -0.8727171, 0, 0, 0, 1, 1,
-0.9115462, 1.018914, -1.874872, 1, 1, 1, 1, 1,
-0.9107378, -1.463689, -4.150255, 1, 1, 1, 1, 1,
-0.9091472, -0.295338, -2.717943, 1, 1, 1, 1, 1,
-0.9087682, 0.6286383, -1.548321, 1, 1, 1, 1, 1,
-0.9024121, 1.221872, -0.2585152, 1, 1, 1, 1, 1,
-0.9011354, 0.5241884, -2.854741, 1, 1, 1, 1, 1,
-0.9010357, -0.4431752, -3.718805, 1, 1, 1, 1, 1,
-0.896909, -0.7672132, -0.7112404, 1, 1, 1, 1, 1,
-0.896388, -0.7367352, -1.780376, 1, 1, 1, 1, 1,
-0.8930268, -0.5922679, -2.617393, 1, 1, 1, 1, 1,
-0.8907332, -1.466515, -3.226951, 1, 1, 1, 1, 1,
-0.8898967, -0.9862748, -3.246625, 1, 1, 1, 1, 1,
-0.8882721, -0.3606045, -3.095303, 1, 1, 1, 1, 1,
-0.884854, -0.2637607, -0.8042141, 1, 1, 1, 1, 1,
-0.8839173, 0.7150961, -1.999113, 1, 1, 1, 1, 1,
-0.883241, -0.1090424, 0.248607, 0, 0, 1, 1, 1,
-0.8829143, -0.1108654, -0.876675, 1, 0, 0, 1, 1,
-0.8815469, 0.1128729, -1.608343, 1, 0, 0, 1, 1,
-0.879949, 1.647913, 0.5457326, 1, 0, 0, 1, 1,
-0.8798469, 1.740386, -2.929218, 1, 0, 0, 1, 1,
-0.8798218, -0.298256, -2.004808, 1, 0, 0, 1, 1,
-0.8779776, -0.3473231, -1.625621, 0, 0, 0, 1, 1,
-0.8746164, -0.8538325, -1.311776, 0, 0, 0, 1, 1,
-0.8622885, 1.001174, 0.5036444, 0, 0, 0, 1, 1,
-0.8613613, -1.690022, -1.816844, 0, 0, 0, 1, 1,
-0.8575252, 0.9232967, -0.6370869, 0, 0, 0, 1, 1,
-0.8547791, -1.198219, -3.221847, 0, 0, 0, 1, 1,
-0.8542146, -0.8737369, -3.017982, 0, 0, 0, 1, 1,
-0.8497807, -1.288119, -1.837585, 1, 1, 1, 1, 1,
-0.8497312, 0.8934037, -1.156796, 1, 1, 1, 1, 1,
-0.8492821, -1.657808, -2.492017, 1, 1, 1, 1, 1,
-0.8480784, 1.977718, -1.279764, 1, 1, 1, 1, 1,
-0.8429951, 0.6290554, -1.571213, 1, 1, 1, 1, 1,
-0.8426329, 2.210386, 0.2352432, 1, 1, 1, 1, 1,
-0.8306252, -0.5599971, -1.714603, 1, 1, 1, 1, 1,
-0.8233921, -1.752197, -1.308338, 1, 1, 1, 1, 1,
-0.803615, -1.773746, -3.594511, 1, 1, 1, 1, 1,
-0.8023117, 0.341406, -1.255852, 1, 1, 1, 1, 1,
-0.7985037, -0.01457936, -0.6121746, 1, 1, 1, 1, 1,
-0.7972584, -0.7549338, -3.768272, 1, 1, 1, 1, 1,
-0.7950654, 0.3816704, 0.9255065, 1, 1, 1, 1, 1,
-0.7895933, 0.9961181, -1.307668, 1, 1, 1, 1, 1,
-0.7879032, 0.8622258, -0.5581373, 1, 1, 1, 1, 1,
-0.7868573, 0.6272726, -3.500412, 0, 0, 1, 1, 1,
-0.7846974, -0.377051, -3.701275, 1, 0, 0, 1, 1,
-0.783609, -0.3664294, -1.5872, 1, 0, 0, 1, 1,
-0.7827617, -1.458819, -2.110018, 1, 0, 0, 1, 1,
-0.7812495, 1.222533, 0.1937337, 1, 0, 0, 1, 1,
-0.7758542, 0.2132658, -1.634274, 1, 0, 0, 1, 1,
-0.7749603, -1.405424, -1.827682, 0, 0, 0, 1, 1,
-0.7748498, 2.147853, -0.4728596, 0, 0, 0, 1, 1,
-0.7631394, -0.1974036, -2.20836, 0, 0, 0, 1, 1,
-0.7604557, 0.5976659, -2.656776, 0, 0, 0, 1, 1,
-0.7591803, 1.349028, 0.5253266, 0, 0, 0, 1, 1,
-0.7524316, 0.2236775, -1.548349, 0, 0, 0, 1, 1,
-0.7487142, -1.682432, -2.609927, 0, 0, 0, 1, 1,
-0.7452206, -0.8673564, -3.497845, 1, 1, 1, 1, 1,
-0.7400905, -0.01838104, -1.526292, 1, 1, 1, 1, 1,
-0.7387257, 0.7748393, -0.5872398, 1, 1, 1, 1, 1,
-0.7383808, -0.8348771, -2.965404, 1, 1, 1, 1, 1,
-0.7380537, 1.525674, -0.9324901, 1, 1, 1, 1, 1,
-0.7360919, 1.022689, -1.485813, 1, 1, 1, 1, 1,
-0.7237222, 0.5204602, 0.7838166, 1, 1, 1, 1, 1,
-0.7171034, -0.1998955, 0.6745895, 1, 1, 1, 1, 1,
-0.7168036, 1.614312, 0.1040776, 1, 1, 1, 1, 1,
-0.7112905, 0.6209466, 0.6042607, 1, 1, 1, 1, 1,
-0.6952864, -1.231917, -2.203871, 1, 1, 1, 1, 1,
-0.6836133, -0.5760943, -3.514425, 1, 1, 1, 1, 1,
-0.6817474, -1.018822, -3.56496, 1, 1, 1, 1, 1,
-0.6807769, -1.107344, -4.216508, 1, 1, 1, 1, 1,
-0.6741859, 0.02240243, -1.664608, 1, 1, 1, 1, 1,
-0.6669555, -0.8986288, -3.44303, 0, 0, 1, 1, 1,
-0.6658916, -0.978364, -1.382205, 1, 0, 0, 1, 1,
-0.6638509, 0.3605927, -0.968752, 1, 0, 0, 1, 1,
-0.6626614, -0.6343369, -2.768936, 1, 0, 0, 1, 1,
-0.6576068, 1.170983, -1.883873, 1, 0, 0, 1, 1,
-0.6549963, -0.6472534, -0.8943784, 1, 0, 0, 1, 1,
-0.6527306, -1.861009, -1.192846, 0, 0, 0, 1, 1,
-0.6526098, 0.009129419, -1.196989, 0, 0, 0, 1, 1,
-0.6417177, -1.549816, -1.770038, 0, 0, 0, 1, 1,
-0.6413792, -1.546014, -1.959754, 0, 0, 0, 1, 1,
-0.6400639, -0.005027042, -0.2046731, 0, 0, 0, 1, 1,
-0.6358819, 1.161992, 1.007392, 0, 0, 0, 1, 1,
-0.6329554, -0.7985088, -1.575752, 0, 0, 0, 1, 1,
-0.63098, -0.07721772, -1.048838, 1, 1, 1, 1, 1,
-0.62881, 1.053343, -2.133992, 1, 1, 1, 1, 1,
-0.6232169, -0.743271, -1.865823, 1, 1, 1, 1, 1,
-0.6219804, -1.030934, -1.879211, 1, 1, 1, 1, 1,
-0.6204671, -0.3537545, -2.505478, 1, 1, 1, 1, 1,
-0.6186189, -1.602027, -2.367316, 1, 1, 1, 1, 1,
-0.6174809, 0.6586888, -1.358744, 1, 1, 1, 1, 1,
-0.6164835, -1.619978, -3.086092, 1, 1, 1, 1, 1,
-0.6101143, 0.5264676, 1.147238, 1, 1, 1, 1, 1,
-0.6091271, 1.218524, -1.390343, 1, 1, 1, 1, 1,
-0.6059515, 0.05471379, -0.5288631, 1, 1, 1, 1, 1,
-0.6042901, -0.6461055, -2.997098, 1, 1, 1, 1, 1,
-0.5723219, 1.471895, -1.737482, 1, 1, 1, 1, 1,
-0.5713684, -1.380852, -2.34032, 1, 1, 1, 1, 1,
-0.5699615, -0.2385556, -1.69449, 1, 1, 1, 1, 1,
-0.5673826, 0.6507353, -1.651665, 0, 0, 1, 1, 1,
-0.5654038, 2.470802, -1.632623, 1, 0, 0, 1, 1,
-0.5625909, 0.7884775, -0.3549779, 1, 0, 0, 1, 1,
-0.5568942, 0.0330836, -1.072394, 1, 0, 0, 1, 1,
-0.554585, -0.5772486, -2.320972, 1, 0, 0, 1, 1,
-0.5538537, -2.680645, -3.703189, 1, 0, 0, 1, 1,
-0.5526512, -3.158473, -1.16842, 0, 0, 0, 1, 1,
-0.5517572, -1.199132, -3.249081, 0, 0, 0, 1, 1,
-0.5495973, 2.318498, -0.4820648, 0, 0, 0, 1, 1,
-0.5473097, 0.4912339, -1.491957, 0, 0, 0, 1, 1,
-0.5460982, 2.366546, 0.3527934, 0, 0, 0, 1, 1,
-0.5450336, 0.1427354, 0.2486166, 0, 0, 0, 1, 1,
-0.5445284, -0.6330616, -1.253399, 0, 0, 0, 1, 1,
-0.5397407, -0.2772546, -4.651082, 1, 1, 1, 1, 1,
-0.539547, -0.4239395, -1.313572, 1, 1, 1, 1, 1,
-0.5357188, 0.9214579, -0.3552505, 1, 1, 1, 1, 1,
-0.5324003, 0.0285056, -0.5797127, 1, 1, 1, 1, 1,
-0.5310051, 1.248361, -0.1017116, 1, 1, 1, 1, 1,
-0.5287696, 0.7314483, -0.6536798, 1, 1, 1, 1, 1,
-0.5261846, 0.2157406, -1.039142, 1, 1, 1, 1, 1,
-0.5187691, -0.8014442, -2.927971, 1, 1, 1, 1, 1,
-0.5122164, 0.1243886, -0.08172143, 1, 1, 1, 1, 1,
-0.5010628, -0.05310871, -1.311677, 1, 1, 1, 1, 1,
-0.4968185, 0.5994299, -0.9214771, 1, 1, 1, 1, 1,
-0.4951138, 0.2309214, 0.8584672, 1, 1, 1, 1, 1,
-0.4864506, -1.182224, -2.702148, 1, 1, 1, 1, 1,
-0.4849525, 0.1845948, -4.274065, 1, 1, 1, 1, 1,
-0.4748891, -0.4665871, -3.837484, 1, 1, 1, 1, 1,
-0.473991, 0.8804113, 0.2480935, 0, 0, 1, 1, 1,
-0.4737227, 0.8745129, 1.376323, 1, 0, 0, 1, 1,
-0.470132, -0.5840544, -3.864594, 1, 0, 0, 1, 1,
-0.4623218, -0.5682922, -2.760824, 1, 0, 0, 1, 1,
-0.461446, -2.238075, -3.027824, 1, 0, 0, 1, 1,
-0.4614441, 1.276112, -0.1748985, 1, 0, 0, 1, 1,
-0.4590449, -0.5472636, -1.35862, 0, 0, 0, 1, 1,
-0.4517457, -0.5001805, -2.227464, 0, 0, 0, 1, 1,
-0.4481789, 0.4529185, 0.3770808, 0, 0, 0, 1, 1,
-0.4470748, 0.1800401, 0.02662661, 0, 0, 0, 1, 1,
-0.4467224, -0.7686803, -0.07556923, 0, 0, 0, 1, 1,
-0.4446957, 0.9772953, -0.3484138, 0, 0, 0, 1, 1,
-0.4439561, -1.37577, -3.530391, 0, 0, 0, 1, 1,
-0.4364957, 2.326778, -0.2727914, 1, 1, 1, 1, 1,
-0.4354244, -0.6263344, -1.939434, 1, 1, 1, 1, 1,
-0.434039, 1.080715, 0.07825314, 1, 1, 1, 1, 1,
-0.4337576, -0.5604492, -2.103756, 1, 1, 1, 1, 1,
-0.4329669, -0.2764663, -2.675072, 1, 1, 1, 1, 1,
-0.4325382, 0.7447538, -0.9120446, 1, 1, 1, 1, 1,
-0.4314407, -0.3225313, -2.951165, 1, 1, 1, 1, 1,
-0.4243563, -0.9372113, -2.960898, 1, 1, 1, 1, 1,
-0.4237165, -0.1505021, -1.641631, 1, 1, 1, 1, 1,
-0.4199877, -0.5370746, -1.808428, 1, 1, 1, 1, 1,
-0.4128633, -0.6957788, -2.194541, 1, 1, 1, 1, 1,
-0.404816, 0.717543, -2.111464, 1, 1, 1, 1, 1,
-0.3995898, 1.256088, -0.8284169, 1, 1, 1, 1, 1,
-0.3992558, -1.426134, -3.740308, 1, 1, 1, 1, 1,
-0.399209, -0.3238413, -4.174801, 1, 1, 1, 1, 1,
-0.3965317, 0.02386053, -2.340123, 0, 0, 1, 1, 1,
-0.3910487, -0.2525116, -2.241421, 1, 0, 0, 1, 1,
-0.3906717, -0.041113, -0.03455589, 1, 0, 0, 1, 1,
-0.389838, 2.051329, 0.1895596, 1, 0, 0, 1, 1,
-0.3889585, 0.7835356, -1.928548, 1, 0, 0, 1, 1,
-0.3856663, -0.004010947, -0.9671393, 1, 0, 0, 1, 1,
-0.3836592, 0.2374845, -0.06406744, 0, 0, 0, 1, 1,
-0.3829094, -0.1817778, -0.5795227, 0, 0, 0, 1, 1,
-0.3724109, 0.3931834, 0.8991396, 0, 0, 0, 1, 1,
-0.3702929, -0.3704467, -3.422051, 0, 0, 0, 1, 1,
-0.3630137, -0.2968417, -1.873264, 0, 0, 0, 1, 1,
-0.3585093, 0.769107, -0.03178724, 0, 0, 0, 1, 1,
-0.3584466, -0.8348197, -1.951826, 0, 0, 0, 1, 1,
-0.3572391, -1.020457, -3.595074, 1, 1, 1, 1, 1,
-0.3545527, 0.047584, -1.716008, 1, 1, 1, 1, 1,
-0.3522727, -0.5207279, -4.452266, 1, 1, 1, 1, 1,
-0.3510909, -0.1621689, -2.700681, 1, 1, 1, 1, 1,
-0.3487508, 0.354352, 0.2213839, 1, 1, 1, 1, 1,
-0.347613, -1.252245, -2.216401, 1, 1, 1, 1, 1,
-0.3470147, 2.072443, -1.850711, 1, 1, 1, 1, 1,
-0.34611, -0.9793864, 0.5199143, 1, 1, 1, 1, 1,
-0.3448835, 1.034719, 0.1786913, 1, 1, 1, 1, 1,
-0.3447922, -0.9781035, -3.967369, 1, 1, 1, 1, 1,
-0.3405478, -0.4351362, -2.549881, 1, 1, 1, 1, 1,
-0.3350804, 0.2925222, 0.5151027, 1, 1, 1, 1, 1,
-0.3346117, -1.735295, -3.42902, 1, 1, 1, 1, 1,
-0.3345256, -1.635478, -3.07476, 1, 1, 1, 1, 1,
-0.3315312, 1.455135, 0.5906744, 1, 1, 1, 1, 1,
-0.3272947, -0.5585675, -3.36222, 0, 0, 1, 1, 1,
-0.3210723, 0.02938578, -1.013317, 1, 0, 0, 1, 1,
-0.3193981, -1.148162, -3.090428, 1, 0, 0, 1, 1,
-0.3145899, -1.761705, -3.872538, 1, 0, 0, 1, 1,
-0.3119781, 0.9521095, 0.8198967, 1, 0, 0, 1, 1,
-0.3114977, 0.7222689, 0.7551571, 1, 0, 0, 1, 1,
-0.3103459, 1.09983, 0.9326982, 0, 0, 0, 1, 1,
-0.3057543, 0.4568123, 0.2105152, 0, 0, 0, 1, 1,
-0.3015177, 0.1231507, 0.6856676, 0, 0, 0, 1, 1,
-0.3004048, 0.3146325, -1.510888, 0, 0, 0, 1, 1,
-0.2888419, -0.2744173, -3.167629, 0, 0, 0, 1, 1,
-0.2888252, -2.235572, -3.589265, 0, 0, 0, 1, 1,
-0.2872865, 0.1167016, -0.4798827, 0, 0, 0, 1, 1,
-0.2869802, 1.776971, 0.2648008, 1, 1, 1, 1, 1,
-0.2862579, -0.4802734, -3.540284, 1, 1, 1, 1, 1,
-0.2855209, -1.695053, -4.01718, 1, 1, 1, 1, 1,
-0.2848817, -0.3151631, -4.968276, 1, 1, 1, 1, 1,
-0.2847121, -0.3499205, -2.186206, 1, 1, 1, 1, 1,
-0.2843374, 0.3918533, 0.8927241, 1, 1, 1, 1, 1,
-0.278399, -0.9441254, -4.106703, 1, 1, 1, 1, 1,
-0.2718797, -0.1887897, -0.6422194, 1, 1, 1, 1, 1,
-0.2705022, -1.490233, -3.41748, 1, 1, 1, 1, 1,
-0.2682203, -0.2313427, -1.605365, 1, 1, 1, 1, 1,
-0.2657125, 0.9705253, 0.04281148, 1, 1, 1, 1, 1,
-0.2636771, 1.078135, 0.07653008, 1, 1, 1, 1, 1,
-0.2609469, 3.193093, -0.4838869, 1, 1, 1, 1, 1,
-0.2584161, 1.072099, -1.356738, 1, 1, 1, 1, 1,
-0.2550026, 1.837449, -0.07134449, 1, 1, 1, 1, 1,
-0.254795, -0.7759648, -2.438025, 0, 0, 1, 1, 1,
-0.2526364, -1.064301, -2.005568, 1, 0, 0, 1, 1,
-0.2523716, -1.308169, -1.597839, 1, 0, 0, 1, 1,
-0.2518456, 0.4912103, -0.7070717, 1, 0, 0, 1, 1,
-0.2517331, 0.7963744, 1.099089, 1, 0, 0, 1, 1,
-0.2502127, 0.1950492, 0.442746, 1, 0, 0, 1, 1,
-0.2472219, -0.8512703, -3.375011, 0, 0, 0, 1, 1,
-0.2391037, 1.499623, -1.245024, 0, 0, 0, 1, 1,
-0.237378, 0.1767264, -2.419313, 0, 0, 0, 1, 1,
-0.2371885, 2.186461, -1.860226, 0, 0, 0, 1, 1,
-0.2311559, -0.3235765, -1.380572, 0, 0, 0, 1, 1,
-0.2299457, -0.2210265, -1.556224, 0, 0, 0, 1, 1,
-0.228278, 1.465742, -0.1651107, 0, 0, 0, 1, 1,
-0.2262165, -0.6876184, -3.357207, 1, 1, 1, 1, 1,
-0.2255978, 0.8169849, -0.4524465, 1, 1, 1, 1, 1,
-0.2234705, 1.363132, 0.3577779, 1, 1, 1, 1, 1,
-0.2201485, -0.3333338, -2.024856, 1, 1, 1, 1, 1,
-0.2166715, -0.2038011, -2.200433, 1, 1, 1, 1, 1,
-0.2157069, -0.4762576, -4.188795, 1, 1, 1, 1, 1,
-0.2139179, -0.3609344, 0.1332401, 1, 1, 1, 1, 1,
-0.210082, -1.269708, -2.378783, 1, 1, 1, 1, 1,
-0.2072304, 0.7117144, -1.702946, 1, 1, 1, 1, 1,
-0.2038604, -1.559418, -3.537801, 1, 1, 1, 1, 1,
-0.1992628, 2.176583, -0.333155, 1, 1, 1, 1, 1,
-0.1990963, -0.4901134, -2.811664, 1, 1, 1, 1, 1,
-0.1966731, 0.1096757, -0.5236924, 1, 1, 1, 1, 1,
-0.1954518, 1.625783, -0.1270068, 1, 1, 1, 1, 1,
-0.1947729, 0.6127381, -0.7673122, 1, 1, 1, 1, 1,
-0.1944921, 2.463333, 0.6579646, 0, 0, 1, 1, 1,
-0.1843073, -1.212062, -3.557589, 1, 0, 0, 1, 1,
-0.1835887, 0.7147593, -0.2332824, 1, 0, 0, 1, 1,
-0.1831237, -0.5324111, -1.811755, 1, 0, 0, 1, 1,
-0.1828297, 1.019902, -1.259221, 1, 0, 0, 1, 1,
-0.1819731, -0.1052252, -0.3731568, 1, 0, 0, 1, 1,
-0.1791515, 1.544504, 1.681926, 0, 0, 0, 1, 1,
-0.1770122, -1.70309, -4.960142, 0, 0, 0, 1, 1,
-0.1752729, -0.2793185, -1.297519, 0, 0, 0, 1, 1,
-0.1696826, -0.5899973, -2.379135, 0, 0, 0, 1, 1,
-0.1659522, 0.4383969, -1.634073, 0, 0, 0, 1, 1,
-0.1625182, -0.0600098, -2.047763, 0, 0, 0, 1, 1,
-0.162323, -0.02643613, -0.5055089, 0, 0, 0, 1, 1,
-0.1617048, 1.724537, -1.344344, 1, 1, 1, 1, 1,
-0.1616026, 0.7638614, 0.1480576, 1, 1, 1, 1, 1,
-0.1613577, -0.5681097, -3.655492, 1, 1, 1, 1, 1,
-0.160161, 0.1700298, -0.9951423, 1, 1, 1, 1, 1,
-0.1579115, -1.810062, -3.641649, 1, 1, 1, 1, 1,
-0.1504995, 0.5269607, 0.839767, 1, 1, 1, 1, 1,
-0.1447667, -1.212758, -1.984694, 1, 1, 1, 1, 1,
-0.1437433, 1.637017, 0.3541067, 1, 1, 1, 1, 1,
-0.1370919, -1.514887, -2.934533, 1, 1, 1, 1, 1,
-0.1300125, 1.295406, -1.217014, 1, 1, 1, 1, 1,
-0.1279195, 0.7764032, 0.2683586, 1, 1, 1, 1, 1,
-0.1218733, -2.408283, -3.489744, 1, 1, 1, 1, 1,
-0.1186811, 0.2727765, -0.622915, 1, 1, 1, 1, 1,
-0.11713, -1.164218, -1.298067, 1, 1, 1, 1, 1,
-0.1168727, 2.883172, -1.412919, 1, 1, 1, 1, 1,
-0.1162188, 0.7400948, -0.4110356, 0, 0, 1, 1, 1,
-0.1159985, -0.1665146, -3.04778, 1, 0, 0, 1, 1,
-0.1148858, -0.8490078, -2.733946, 1, 0, 0, 1, 1,
-0.1088014, 1.789886, -1.178704, 1, 0, 0, 1, 1,
-0.1086238, 0.03671114, -0.2355158, 1, 0, 0, 1, 1,
-0.09960858, 0.4240754, 0.3513682, 1, 0, 0, 1, 1,
-0.09897455, -1.133196, -3.424767, 0, 0, 0, 1, 1,
-0.09154378, -0.548542, -2.982063, 0, 0, 0, 1, 1,
-0.08635589, -1.248652, -2.319375, 0, 0, 0, 1, 1,
-0.08501834, 2.711214, -1.049917, 0, 0, 0, 1, 1,
-0.0833929, 1.449982, 0.01217815, 0, 0, 0, 1, 1,
-0.0829015, 1.491003, 0.07842571, 0, 0, 0, 1, 1,
-0.08259503, 0.7420305, -0.8501898, 0, 0, 0, 1, 1,
-0.08050591, 1.966658, 0.211335, 1, 1, 1, 1, 1,
-0.0770519, 0.3632889, 0.005297207, 1, 1, 1, 1, 1,
-0.07445204, 0.2956478, 0.9073827, 1, 1, 1, 1, 1,
-0.07404318, -1.466643, -2.911517, 1, 1, 1, 1, 1,
-0.07350554, -0.036546, -2.42355, 1, 1, 1, 1, 1,
-0.07078665, -0.08993656, -1.778206, 1, 1, 1, 1, 1,
-0.06922582, 0.8820994, -0.6432334, 1, 1, 1, 1, 1,
-0.06621817, 0.8365778, -0.8951262, 1, 1, 1, 1, 1,
-0.06360123, 0.2637649, -1.250691, 1, 1, 1, 1, 1,
-0.0632842, -0.96025, -2.999053, 1, 1, 1, 1, 1,
-0.06032804, -0.6771939, -2.146479, 1, 1, 1, 1, 1,
-0.06023761, -0.2822515, -4.125104, 1, 1, 1, 1, 1,
-0.05296571, 0.9468382, -0.1661555, 1, 1, 1, 1, 1,
-0.0521689, 0.5147145, -0.2387799, 1, 1, 1, 1, 1,
-0.04972887, -0.4451645, -4.324073, 1, 1, 1, 1, 1,
-0.04715626, -1.39463, -3.407686, 0, 0, 1, 1, 1,
-0.04574806, -0.1240484, -3.174749, 1, 0, 0, 1, 1,
-0.04496507, -0.2216224, -2.30571, 1, 0, 0, 1, 1,
-0.0399618, 0.7248968, -0.5573217, 1, 0, 0, 1, 1,
-0.03706106, 0.7922302, -0.1078274, 1, 0, 0, 1, 1,
-0.03353443, -0.2788627, -2.172774, 1, 0, 0, 1, 1,
-0.02952649, 0.6296947, 0.5522044, 0, 0, 0, 1, 1,
-0.02612363, -1.254048, -3.964653, 0, 0, 0, 1, 1,
-0.02301653, 0.9056068, 0.6172545, 0, 0, 0, 1, 1,
-0.02084888, 0.2836103, -1.126844, 0, 0, 0, 1, 1,
-0.02064101, -0.1570967, -4.101015, 0, 0, 0, 1, 1,
-0.01969965, -0.2605534, -1.901835, 0, 0, 0, 1, 1,
-0.01914283, -0.3383561, -3.031256, 0, 0, 0, 1, 1,
-0.01790437, -0.7296113, -2.556813, 1, 1, 1, 1, 1,
-0.01660016, -0.2888242, -1.93348, 1, 1, 1, 1, 1,
-0.01561208, -0.6504173, -3.646374, 1, 1, 1, 1, 1,
-0.01181683, 0.7144586, 0.6642885, 1, 1, 1, 1, 1,
-0.004386991, 0.9846554, -0.5210991, 1, 1, 1, 1, 1,
-0.004087535, -0.458293, -3.658017, 1, 1, 1, 1, 1,
-0.003054251, -1.735708, -2.589401, 1, 1, 1, 1, 1,
-0.001590924, 2.062449, 1.576513, 1, 1, 1, 1, 1,
-0.001464577, 0.1691772, 0.3468939, 1, 1, 1, 1, 1,
0.005541387, 0.3097027, 0.3731433, 1, 1, 1, 1, 1,
0.007421655, 0.5239065, -1.077312, 1, 1, 1, 1, 1,
0.007960717, 1.107929, -2.12468, 1, 1, 1, 1, 1,
0.009744186, 0.1489574, 0.8509017, 1, 1, 1, 1, 1,
0.01302081, 0.1620044, 0.5521779, 1, 1, 1, 1, 1,
0.01345366, -0.5086927, 2.966875, 1, 1, 1, 1, 1,
0.01366567, 0.1308343, -1.969827, 0, 0, 1, 1, 1,
0.01416278, -0.5809445, 3.93632, 1, 0, 0, 1, 1,
0.01500283, 1.33895, -0.1267241, 1, 0, 0, 1, 1,
0.01646676, 0.2719117, -0.7380679, 1, 0, 0, 1, 1,
0.01988066, -1.497698, 5.106912, 1, 0, 0, 1, 1,
0.02199554, -0.5961468, 4.751801, 1, 0, 0, 1, 1,
0.02493153, 1.441101, 0.3629004, 0, 0, 0, 1, 1,
0.02680495, 1.262228, 0.1614673, 0, 0, 0, 1, 1,
0.02836167, -1.157316, 2.352091, 0, 0, 0, 1, 1,
0.03296853, -0.4874549, 3.182193, 0, 0, 0, 1, 1,
0.0382364, 0.421186, -0.4393808, 0, 0, 0, 1, 1,
0.03851669, -1.387771, 3.147965, 0, 0, 0, 1, 1,
0.03994959, 0.04497369, -0.1144198, 0, 0, 0, 1, 1,
0.04270113, -1.764245, 3.38039, 1, 1, 1, 1, 1,
0.04356958, 0.526141, -0.5093653, 1, 1, 1, 1, 1,
0.04635017, 1.104553, -0.8206666, 1, 1, 1, 1, 1,
0.04730139, 1.382541, -0.65124, 1, 1, 1, 1, 1,
0.05197086, -1.234905, 1.670815, 1, 1, 1, 1, 1,
0.05357872, 0.5151758, 0.9368845, 1, 1, 1, 1, 1,
0.05895166, 0.2230903, 0.922581, 1, 1, 1, 1, 1,
0.05995697, 1.375383, 0.2897965, 1, 1, 1, 1, 1,
0.06786735, -1.367563, 3.973159, 1, 1, 1, 1, 1,
0.07134646, 0.1634619, -0.642451, 1, 1, 1, 1, 1,
0.07192627, -0.3380142, 3.788699, 1, 1, 1, 1, 1,
0.07376589, 0.5659162, 0.4018769, 1, 1, 1, 1, 1,
0.07702689, -0.9440588, 3.082547, 1, 1, 1, 1, 1,
0.0779326, 0.7438761, 1.519886, 1, 1, 1, 1, 1,
0.08065879, -0.3237437, 4.742225, 1, 1, 1, 1, 1,
0.0857973, -0.3076946, 6.154843, 0, 0, 1, 1, 1,
0.08666389, -0.2706152, 1.620743, 1, 0, 0, 1, 1,
0.09200375, -0.773835, 1.69451, 1, 0, 0, 1, 1,
0.09257583, 0.7965367, -0.6318874, 1, 0, 0, 1, 1,
0.0944787, -0.1704776, 2.561699, 1, 0, 0, 1, 1,
0.09837953, -0.334147, 2.326927, 1, 0, 0, 1, 1,
0.1019922, 0.9245138, 1.982559, 0, 0, 0, 1, 1,
0.1021564, 0.6633847, -0.9301955, 0, 0, 0, 1, 1,
0.104472, 2.199471, -1.109446, 0, 0, 0, 1, 1,
0.1089805, -0.4926476, 4.462921, 0, 0, 0, 1, 1,
0.1121163, 0.2490896, 0.1257716, 0, 0, 0, 1, 1,
0.1144638, 0.09679152, 0.06328122, 0, 0, 0, 1, 1,
0.1180513, -0.323476, 2.385033, 0, 0, 0, 1, 1,
0.1189054, 0.2366134, -0.2201861, 1, 1, 1, 1, 1,
0.1219132, 0.0002037746, 2.37805, 1, 1, 1, 1, 1,
0.1221726, -1.035457, 4.275877, 1, 1, 1, 1, 1,
0.132928, -0.6720113, 3.233274, 1, 1, 1, 1, 1,
0.1336081, -0.06639989, 1.645614, 1, 1, 1, 1, 1,
0.134348, 1.183727, 2.023973, 1, 1, 1, 1, 1,
0.1398843, 1.976767, 1.225028, 1, 1, 1, 1, 1,
0.14238, 0.1654364, 1.635514, 1, 1, 1, 1, 1,
0.145146, 0.8837017, -0.6485763, 1, 1, 1, 1, 1,
0.1465641, 0.2408443, 0.4503755, 1, 1, 1, 1, 1,
0.1469439, -0.5602961, 2.846168, 1, 1, 1, 1, 1,
0.1546249, 0.03184156, 0.822013, 1, 1, 1, 1, 1,
0.1561969, -1.121035, 1.942316, 1, 1, 1, 1, 1,
0.1574214, -0.576853, 4.202933, 1, 1, 1, 1, 1,
0.1608425, 0.4634373, -1.866246, 1, 1, 1, 1, 1,
0.1628968, -0.141896, 2.168834, 0, 0, 1, 1, 1,
0.1633476, -0.3879902, 2.452812, 1, 0, 0, 1, 1,
0.164735, 0.3501619, -1.911063, 1, 0, 0, 1, 1,
0.1720171, -0.5549264, 2.764353, 1, 0, 0, 1, 1,
0.1722191, -1.017326, 4.142739, 1, 0, 0, 1, 1,
0.1729626, 0.1862563, 2.178672, 1, 0, 0, 1, 1,
0.1810454, -0.8826234, 3.142529, 0, 0, 0, 1, 1,
0.1818165, -0.1450816, 2.996504, 0, 0, 0, 1, 1,
0.182534, -0.8708416, 4.017157, 0, 0, 0, 1, 1,
0.1876121, 0.08766334, 1.262911, 0, 0, 0, 1, 1,
0.1987056, -0.5704589, 4.542406, 0, 0, 0, 1, 1,
0.1988988, -0.5175969, 2.383045, 0, 0, 0, 1, 1,
0.1989626, -0.3467134, 2.809345, 0, 0, 0, 1, 1,
0.203601, -0.3724741, 2.126697, 1, 1, 1, 1, 1,
0.2036921, 1.039302, 0.6071954, 1, 1, 1, 1, 1,
0.2042901, -0.131784, 1.280048, 1, 1, 1, 1, 1,
0.2056205, 0.09195523, 3.925082, 1, 1, 1, 1, 1,
0.2068254, -0.2274321, 2.704773, 1, 1, 1, 1, 1,
0.2070815, 0.3827585, -1.913792, 1, 1, 1, 1, 1,
0.2108556, 1.678604, -0.6436614, 1, 1, 1, 1, 1,
0.2126304, -1.865266, 2.546161, 1, 1, 1, 1, 1,
0.2136032, 0.3744005, 2.928824, 1, 1, 1, 1, 1,
0.2181477, 0.4836172, -0.4977266, 1, 1, 1, 1, 1,
0.2199844, -0.5848291, 2.584488, 1, 1, 1, 1, 1,
0.2200119, -1.368824, 2.291202, 1, 1, 1, 1, 1,
0.2214341, 0.5759912, -0.8749139, 1, 1, 1, 1, 1,
0.2272022, -0.5176787, 2.433497, 1, 1, 1, 1, 1,
0.2294433, 1.655182, 1.491701, 1, 1, 1, 1, 1,
0.2304752, -0.5988248, 3.412265, 0, 0, 1, 1, 1,
0.2318721, -0.2753626, 1.990889, 1, 0, 0, 1, 1,
0.2342449, -0.8437483, 2.448635, 1, 0, 0, 1, 1,
0.2388663, -0.0315727, 2.091404, 1, 0, 0, 1, 1,
0.2417981, 1.216663, 1.166889, 1, 0, 0, 1, 1,
0.252473, 0.5695741, 0.9698192, 1, 0, 0, 1, 1,
0.2551203, 1.618182, -2.381199, 0, 0, 0, 1, 1,
0.2554313, 1.297023, 0.5831795, 0, 0, 0, 1, 1,
0.2559723, 2.039899, 0.994052, 0, 0, 0, 1, 1,
0.256876, 1.418329, 0.6883865, 0, 0, 0, 1, 1,
0.2621099, 1.298268, -1.167244, 0, 0, 0, 1, 1,
0.2625544, 0.5852834, -0.7772532, 0, 0, 0, 1, 1,
0.2637421, 0.7140358, 0.3028434, 0, 0, 0, 1, 1,
0.2639044, -0.4827697, 1.492407, 1, 1, 1, 1, 1,
0.2656352, -0.7964912, 2.108846, 1, 1, 1, 1, 1,
0.2718768, 0.1828093, 1.676852, 1, 1, 1, 1, 1,
0.2736527, 0.9172176, -0.01255682, 1, 1, 1, 1, 1,
0.2738726, 0.497612, -0.4167788, 1, 1, 1, 1, 1,
0.2764417, -0.3451037, 1.797865, 1, 1, 1, 1, 1,
0.2776327, 0.5540054, -0.09792171, 1, 1, 1, 1, 1,
0.282808, 1.488755, 1.505238, 1, 1, 1, 1, 1,
0.2828904, -1.730126, 3.798205, 1, 1, 1, 1, 1,
0.2857182, -1.258419, 3.919441, 1, 1, 1, 1, 1,
0.2857757, -1.372284, 2.230297, 1, 1, 1, 1, 1,
0.2875214, -0.7626805, 3.163868, 1, 1, 1, 1, 1,
0.2910976, -1.619272, 5.099607, 1, 1, 1, 1, 1,
0.2930642, 0.1767801, -0.1385696, 1, 1, 1, 1, 1,
0.2972789, 0.905047, 1.496084, 1, 1, 1, 1, 1,
0.2986826, -0.1347243, 0.4872952, 0, 0, 1, 1, 1,
0.2996922, -0.2432006, 3.262797, 1, 0, 0, 1, 1,
0.3015352, 0.05427743, 1.371935, 1, 0, 0, 1, 1,
0.3021338, -0.8300394, 2.183792, 1, 0, 0, 1, 1,
0.304158, -0.9271365, 3.292278, 1, 0, 0, 1, 1,
0.3049713, -0.8773655, 2.317739, 1, 0, 0, 1, 1,
0.313655, 0.2628688, 1.262642, 0, 0, 0, 1, 1,
0.3152598, 0.1962081, 0.5363316, 0, 0, 0, 1, 1,
0.322253, 0.3196845, 0.5388564, 0, 0, 0, 1, 1,
0.3236302, 1.330002, 0.8741167, 0, 0, 0, 1, 1,
0.3262637, -1.097454, 1.388146, 0, 0, 0, 1, 1,
0.3350056, -1.646788, 3.047252, 0, 0, 0, 1, 1,
0.3356788, 1.350499, 1.434933, 0, 0, 0, 1, 1,
0.3372643, -0.3275004, 2.818875, 1, 1, 1, 1, 1,
0.3381106, 0.1024217, -1.090233, 1, 1, 1, 1, 1,
0.3437156, -0.08021169, -0.1255594, 1, 1, 1, 1, 1,
0.3439484, -0.480719, 1.378078, 1, 1, 1, 1, 1,
0.3447034, -0.1491198, 2.854027, 1, 1, 1, 1, 1,
0.344954, 0.8126698, 0.6048167, 1, 1, 1, 1, 1,
0.3490083, 1.079372, 0.6413915, 1, 1, 1, 1, 1,
0.3569213, -1.444675, 4.593947, 1, 1, 1, 1, 1,
0.3595578, 0.4218171, 1.032741, 1, 1, 1, 1, 1,
0.3653852, -0.2416609, 1.407274, 1, 1, 1, 1, 1,
0.3655313, 1.25337, -1.541735, 1, 1, 1, 1, 1,
0.3747083, -0.7943201, 1.834179, 1, 1, 1, 1, 1,
0.3799158, -0.07287627, 3.130553, 1, 1, 1, 1, 1,
0.3802808, 1.078059, -0.4428656, 1, 1, 1, 1, 1,
0.3846734, 0.3593595, 0.7944133, 1, 1, 1, 1, 1,
0.3846859, -0.2163434, 0.8082152, 0, 0, 1, 1, 1,
0.3912776, 1.402624, 0.8807729, 1, 0, 0, 1, 1,
0.3942477, -0.3345441, 0.6206474, 1, 0, 0, 1, 1,
0.3947047, 0.06152127, 1.719807, 1, 0, 0, 1, 1,
0.3968019, 0.0908621, 0.8492577, 1, 0, 0, 1, 1,
0.4018381, 0.6221003, 0.1299849, 1, 0, 0, 1, 1,
0.4065719, 0.5864058, 2.222803, 0, 0, 0, 1, 1,
0.4068528, 0.5506825, 1.064006, 0, 0, 0, 1, 1,
0.4088769, 0.518099, 0.625254, 0, 0, 0, 1, 1,
0.4097061, -1.806107, 2.452778, 0, 0, 0, 1, 1,
0.4098983, 0.1797365, 0.9195994, 0, 0, 0, 1, 1,
0.4110096, -0.5443429, 3.114416, 0, 0, 0, 1, 1,
0.4134582, 1.487805, -0.1760301, 0, 0, 0, 1, 1,
0.4136619, -1.714963, 0.9222096, 1, 1, 1, 1, 1,
0.4171873, -0.7654691, 1.570971, 1, 1, 1, 1, 1,
0.4255949, -0.8623026, 3.073647, 1, 1, 1, 1, 1,
0.4276702, -0.6294772, 3.509975, 1, 1, 1, 1, 1,
0.4277512, 1.524291, -0.7293274, 1, 1, 1, 1, 1,
0.4323877, 0.6365065, -0.5811039, 1, 1, 1, 1, 1,
0.433852, -1.508639, 4.607879, 1, 1, 1, 1, 1,
0.4350426, -0.8646821, 0.8537945, 1, 1, 1, 1, 1,
0.4358222, -0.355923, 2.326656, 1, 1, 1, 1, 1,
0.4387845, 1.141726, -0.7363946, 1, 1, 1, 1, 1,
0.4391998, -0.813989, 2.050684, 1, 1, 1, 1, 1,
0.4399163, -2.212541, 3.235658, 1, 1, 1, 1, 1,
0.4459803, -0.8989558, 3.126718, 1, 1, 1, 1, 1,
0.4540535, 0.5289264, 0.6668715, 1, 1, 1, 1, 1,
0.4562574, 1.280383, 0.3709073, 1, 1, 1, 1, 1,
0.4569513, 1.056912, -0.4655711, 0, 0, 1, 1, 1,
0.4654524, -2.169186, 3.3778, 1, 0, 0, 1, 1,
0.4671479, -2.276506, 3.04766, 1, 0, 0, 1, 1,
0.471433, 0.8599971, -0.01619521, 1, 0, 0, 1, 1,
0.4720235, 0.8250463, -0.5223709, 1, 0, 0, 1, 1,
0.4723835, -0.4753744, 0.3465669, 1, 0, 0, 1, 1,
0.472583, 0.006869376, -0.1597482, 0, 0, 0, 1, 1,
0.4788213, 1.486469, 0.6764225, 0, 0, 0, 1, 1,
0.480489, 0.3960834, 1.484543, 0, 0, 0, 1, 1,
0.4805848, 1.974302, 1.438047, 0, 0, 0, 1, 1,
0.4808045, 0.1941304, 1.894052, 0, 0, 0, 1, 1,
0.4825094, -0.9426624, 4.3667, 0, 0, 0, 1, 1,
0.4837271, 1.099201, 0.04197662, 0, 0, 0, 1, 1,
0.4849853, 1.153221, 1.612636, 1, 1, 1, 1, 1,
0.4903603, 0.667526, 2.618279, 1, 1, 1, 1, 1,
0.4904363, 0.1720558, 0.1374593, 1, 1, 1, 1, 1,
0.4925681, -0.7132925, 2.841851, 1, 1, 1, 1, 1,
0.4934884, -0.01554123, 2.084443, 1, 1, 1, 1, 1,
0.4959832, 0.9911159, 2.779397, 1, 1, 1, 1, 1,
0.4988588, 0.4567694, 0.7229526, 1, 1, 1, 1, 1,
0.5045692, 0.4342076, 0.8031822, 1, 1, 1, 1, 1,
0.5085581, 0.3130251, 3.388735, 1, 1, 1, 1, 1,
0.5095053, -0.8888101, 1.710087, 1, 1, 1, 1, 1,
0.5152574, 0.6091414, 0.8888138, 1, 1, 1, 1, 1,
0.5206468, 0.6599909, 0.04896182, 1, 1, 1, 1, 1,
0.5215834, 1.478279, 1.227771, 1, 1, 1, 1, 1,
0.5219761, 1.383479, 0.0877418, 1, 1, 1, 1, 1,
0.5231804, -0.3259924, 2.471478, 1, 1, 1, 1, 1,
0.533709, 1.55307, 0.5991278, 0, 0, 1, 1, 1,
0.5404741, 0.09911632, 2.164058, 1, 0, 0, 1, 1,
0.5409297, -0.2534566, 1.264829, 1, 0, 0, 1, 1,
0.5415255, 0.5335223, 0.195116, 1, 0, 0, 1, 1,
0.5478013, 1.318671, 0.8151355, 1, 0, 0, 1, 1,
0.5482637, -0.0710847, 3.006393, 1, 0, 0, 1, 1,
0.5520223, 1.327196, 1.346255, 0, 0, 0, 1, 1,
0.5523208, -0.3506513, 1.795979, 0, 0, 0, 1, 1,
0.5603704, 1.222468, 1.991228, 0, 0, 0, 1, 1,
0.5610609, -0.6932876, 1.373468, 0, 0, 0, 1, 1,
0.5624747, -0.463808, 2.50713, 0, 0, 0, 1, 1,
0.5681886, -0.818701, 3.259766, 0, 0, 0, 1, 1,
0.5725051, -0.007645002, 0.5332649, 0, 0, 0, 1, 1,
0.5801478, 2.030429, 0.9924297, 1, 1, 1, 1, 1,
0.5833138, -1.508211, 2.835701, 1, 1, 1, 1, 1,
0.5853605, -1.984764, 2.334718, 1, 1, 1, 1, 1,
0.5956474, 0.931031, 0.2119597, 1, 1, 1, 1, 1,
0.5961324, -0.5067897, 2.569879, 1, 1, 1, 1, 1,
0.6014734, 0.1396581, 0.8670706, 1, 1, 1, 1, 1,
0.6067544, -0.3976984, 1.848067, 1, 1, 1, 1, 1,
0.6119788, -3.419451, 3.547977, 1, 1, 1, 1, 1,
0.6181571, 0.06847835, 2.629942, 1, 1, 1, 1, 1,
0.6181958, 0.2619719, 1.698371, 1, 1, 1, 1, 1,
0.6220313, 0.7706262, 0.4800996, 1, 1, 1, 1, 1,
0.6236937, -1.01586, 1.279057, 1, 1, 1, 1, 1,
0.6247427, -1.648934, 1.798814, 1, 1, 1, 1, 1,
0.6251531, 0.5649708, 1.687834, 1, 1, 1, 1, 1,
0.6350301, 0.4268412, 2.133649, 1, 1, 1, 1, 1,
0.6381942, 0.8601673, 1.166166, 0, 0, 1, 1, 1,
0.6391624, -1.354643, 1.340981, 1, 0, 0, 1, 1,
0.6395963, -0.8328624, 1.300761, 1, 0, 0, 1, 1,
0.6410673, 0.9344378, 0.6519335, 1, 0, 0, 1, 1,
0.647652, -0.169745, 1.234644, 1, 0, 0, 1, 1,
0.6536173, -0.1548771, 0.4707649, 1, 0, 0, 1, 1,
0.6547945, -0.1304413, 3.50234, 0, 0, 0, 1, 1,
0.6557741, -0.1355895, 3.007051, 0, 0, 0, 1, 1,
0.6566074, 0.3373978, 1.19142, 0, 0, 0, 1, 1,
0.6613711, -0.7035816, 3.558235, 0, 0, 0, 1, 1,
0.6652624, -0.3997237, 2.728437, 0, 0, 0, 1, 1,
0.6654742, -0.1361792, 0.4851593, 0, 0, 0, 1, 1,
0.6668649, -0.2771539, 3.777479, 0, 0, 0, 1, 1,
0.6717701, -0.5624598, 2.88517, 1, 1, 1, 1, 1,
0.6801475, -0.1071645, 1.363763, 1, 1, 1, 1, 1,
0.6827382, -0.7207399, 1.975202, 1, 1, 1, 1, 1,
0.6833606, -0.3618836, 2.220241, 1, 1, 1, 1, 1,
0.6924041, -0.1622684, 1.279221, 1, 1, 1, 1, 1,
0.6935804, -0.7114211, 1.012105, 1, 1, 1, 1, 1,
0.702401, -0.06164722, 0.3303829, 1, 1, 1, 1, 1,
0.7034806, 0.000691867, 1.622608, 1, 1, 1, 1, 1,
0.709816, 1.953908, 1.546611, 1, 1, 1, 1, 1,
0.7113402, 0.9344256, 0.8632084, 1, 1, 1, 1, 1,
0.7187716, -0.4645443, 1.634314, 1, 1, 1, 1, 1,
0.7240171, -0.6251834, 2.701137, 1, 1, 1, 1, 1,
0.7285776, -0.1900489, 1.270211, 1, 1, 1, 1, 1,
0.737111, -0.4565422, 2.39243, 1, 1, 1, 1, 1,
0.7458047, -1.56463, 2.76058, 1, 1, 1, 1, 1,
0.7542052, -0.3053348, 2.552856, 0, 0, 1, 1, 1,
0.7611676, 0.4205724, -1.219448, 1, 0, 0, 1, 1,
0.7642203, -0.01593347, 3.742523, 1, 0, 0, 1, 1,
0.764616, 0.3674486, 0.7652686, 1, 0, 0, 1, 1,
0.7699383, 0.576054, 0.8473704, 1, 0, 0, 1, 1,
0.7843073, -0.1663119, -0.5445606, 1, 0, 0, 1, 1,
0.7846928, 1.817251, 0.778836, 0, 0, 0, 1, 1,
0.7859525, 0.8671294, 1.576388, 0, 0, 0, 1, 1,
0.7861737, 0.2262384, 2.002254, 0, 0, 0, 1, 1,
0.7880461, -0.4984071, 1.718704, 0, 0, 0, 1, 1,
0.795072, 0.1213219, 1.185962, 0, 0, 0, 1, 1,
0.7980086, -0.2914761, 0.6755838, 0, 0, 0, 1, 1,
0.801213, -0.3301226, 1.782461, 0, 0, 0, 1, 1,
0.8044285, 1.117017, 0.9591706, 1, 1, 1, 1, 1,
0.8050364, -1.501113, 3.020591, 1, 1, 1, 1, 1,
0.8109612, 0.6850773, 0.5421425, 1, 1, 1, 1, 1,
0.812862, -0.2904403, 3.261048, 1, 1, 1, 1, 1,
0.8133559, -1.047695, 2.638449, 1, 1, 1, 1, 1,
0.8187183, 0.4317353, 0.4466397, 1, 1, 1, 1, 1,
0.8188258, -0.3605231, 0.3540656, 1, 1, 1, 1, 1,
0.820726, -0.4619468, 1.014775, 1, 1, 1, 1, 1,
0.8240932, -0.1599317, 2.389791, 1, 1, 1, 1, 1,
0.8272557, -2.309313, 2.321043, 1, 1, 1, 1, 1,
0.8296379, 0.1583602, 1.457503, 1, 1, 1, 1, 1,
0.8307394, -0.6926321, 1.612176, 1, 1, 1, 1, 1,
0.8349855, -1.042583, 3.207146, 1, 1, 1, 1, 1,
0.8372194, -0.1493554, 0.8909208, 1, 1, 1, 1, 1,
0.8388674, 0.6858124, 2.791053, 1, 1, 1, 1, 1,
0.8449365, -2.095962, 2.864936, 0, 0, 1, 1, 1,
0.8488464, -0.7757505, 4.123209, 1, 0, 0, 1, 1,
0.8557101, -0.1915154, 2.66327, 1, 0, 0, 1, 1,
0.8575436, 1.18975, 1.205612, 1, 0, 0, 1, 1,
0.8576492, -0.2786363, 2.564048, 1, 0, 0, 1, 1,
0.8592589, 0.7243499, -0.3143028, 1, 0, 0, 1, 1,
0.8619118, -0.650192, 3.268651, 0, 0, 0, 1, 1,
0.8625221, 0.8108351, 0.2947963, 0, 0, 0, 1, 1,
0.866757, 0.9456218, -0.1734898, 0, 0, 0, 1, 1,
0.8726077, 0.8914993, 1.822121, 0, 0, 0, 1, 1,
0.8743219, -0.1518613, 2.642093, 0, 0, 0, 1, 1,
0.876943, 1.63404, 0.117914, 0, 0, 0, 1, 1,
0.878891, 0.8379826, 0.08214339, 0, 0, 0, 1, 1,
0.8818405, -1.825125, 2.762943, 1, 1, 1, 1, 1,
0.8866154, 1.036596, -0.5438759, 1, 1, 1, 1, 1,
0.8892, 1.235436, 0.6452836, 1, 1, 1, 1, 1,
0.8929652, -0.3794472, 0.434735, 1, 1, 1, 1, 1,
0.8932419, -0.1677631, 1.814653, 1, 1, 1, 1, 1,
0.8936445, 0.4416506, 1.787494, 1, 1, 1, 1, 1,
0.8954468, -0.0421759, 0.9018012, 1, 1, 1, 1, 1,
0.8959857, 0.5100213, 1.090576, 1, 1, 1, 1, 1,
0.8971782, -0.4255972, 3.158558, 1, 1, 1, 1, 1,
0.8973425, 0.9109862, 0.08360859, 1, 1, 1, 1, 1,
0.8985478, -0.09746795, 3.876265, 1, 1, 1, 1, 1,
0.8988869, 1.164901, 2.062098, 1, 1, 1, 1, 1,
0.9001117, 0.7824183, 2.873009, 1, 1, 1, 1, 1,
0.9034058, 1.483375, 1.462583, 1, 1, 1, 1, 1,
0.9153941, 0.03175592, 2.825837, 1, 1, 1, 1, 1,
0.9179346, -0.6853198, 1.78904, 0, 0, 1, 1, 1,
0.9245542, 0.648876, 0.7214283, 1, 0, 0, 1, 1,
0.9316249, 0.9219754, 1.262179, 1, 0, 0, 1, 1,
0.9350775, -1.146464, 1.473039, 1, 0, 0, 1, 1,
0.9401966, -0.8102919, 2.475611, 1, 0, 0, 1, 1,
0.9453859, -0.5063128, 2.26514, 1, 0, 0, 1, 1,
0.9524481, -0.8192604, 2.29659, 0, 0, 0, 1, 1,
0.9539685, -0.008599525, 1.655278, 0, 0, 0, 1, 1,
0.9569373, 1.507322, -0.02807445, 0, 0, 0, 1, 1,
0.9582288, -0.7918738, 1.728655, 0, 0, 0, 1, 1,
0.9599903, 0.6633545, -0.4457077, 0, 0, 0, 1, 1,
0.9619428, -0.2143291, 1.436856, 0, 0, 0, 1, 1,
0.9621396, -0.1547285, 2.707021, 0, 0, 0, 1, 1,
0.963161, -0.2759985, 0.2470225, 1, 1, 1, 1, 1,
0.9652864, -0.8092341, 3.001895, 1, 1, 1, 1, 1,
0.9658317, -0.744166, 2.490678, 1, 1, 1, 1, 1,
0.9689221, -0.8985711, 2.155196, 1, 1, 1, 1, 1,
0.9693881, -0.3125642, 2.227501, 1, 1, 1, 1, 1,
0.9699305, -1.815566, 2.065661, 1, 1, 1, 1, 1,
0.9732609, 0.662986, 1.056249, 1, 1, 1, 1, 1,
0.9734329, 0.5815883, 1.855949, 1, 1, 1, 1, 1,
0.9815124, -0.8834964, 0.3751443, 1, 1, 1, 1, 1,
0.9886678, -1.255977, 3.156031, 1, 1, 1, 1, 1,
0.9923916, -1.729964, 3.394219, 1, 1, 1, 1, 1,
0.9959074, -1.360419, 2.420048, 1, 1, 1, 1, 1,
1.007201, -0.455712, 1.196386, 1, 1, 1, 1, 1,
1.009111, 0.1665667, 1.484098, 1, 1, 1, 1, 1,
1.010618, -1.229504, 4.095087, 1, 1, 1, 1, 1,
1.017573, 0.8796562, 0.7767398, 0, 0, 1, 1, 1,
1.01942, -0.1675913, 2.835471, 1, 0, 0, 1, 1,
1.019934, -0.4916039, 2.277636, 1, 0, 0, 1, 1,
1.020116, 0.4359457, 1.377368, 1, 0, 0, 1, 1,
1.020662, -0.6411506, 2.606325, 1, 0, 0, 1, 1,
1.035553, -0.200915, -0.7980173, 1, 0, 0, 1, 1,
1.039347, -0.119653, 2.949313, 0, 0, 0, 1, 1,
1.041744, 1.030377, -0.1636331, 0, 0, 0, 1, 1,
1.042569, 0.2534754, 2.797962, 0, 0, 0, 1, 1,
1.047843, 0.9363896, 0.2430898, 0, 0, 0, 1, 1,
1.051796, -1.543376, 2.783348, 0, 0, 0, 1, 1,
1.056147, 0.07487657, 0.05941983, 0, 0, 0, 1, 1,
1.059291, -0.1957162, 4.150639, 0, 0, 0, 1, 1,
1.061091, 0.6504524, 2.133487, 1, 1, 1, 1, 1,
1.066116, -0.01709264, 1.60863, 1, 1, 1, 1, 1,
1.086169, 0.5023886, 1.975776, 1, 1, 1, 1, 1,
1.089585, -0.935571, 4.456045, 1, 1, 1, 1, 1,
1.089784, -1.503279, 2.452631, 1, 1, 1, 1, 1,
1.094009, -0.2566861, 1.135292, 1, 1, 1, 1, 1,
1.097686, 3.016877, 2.074126, 1, 1, 1, 1, 1,
1.0983, -1.400591, 0.8044705, 1, 1, 1, 1, 1,
1.100316, 0.8960814, 0.1896183, 1, 1, 1, 1, 1,
1.101485, 0.1421342, 1.146718, 1, 1, 1, 1, 1,
1.102405, 0.6611319, 0.3953256, 1, 1, 1, 1, 1,
1.110931, 1.058501, -0.2744393, 1, 1, 1, 1, 1,
1.119807, -1.209641, 0.9036027, 1, 1, 1, 1, 1,
1.127878, -1.153058, 0.6182152, 1, 1, 1, 1, 1,
1.130249, -0.7851676, 0.7981117, 1, 1, 1, 1, 1,
1.149052, 0.2792234, 1.257596, 0, 0, 1, 1, 1,
1.153191, -0.6050839, 2.877068, 1, 0, 0, 1, 1,
1.172853, -0.2311728, 3.200502, 1, 0, 0, 1, 1,
1.174999, 0.287554, 2.053545, 1, 0, 0, 1, 1,
1.176115, -0.6931353, 3.288514, 1, 0, 0, 1, 1,
1.181912, 0.5629506, 1.713512, 1, 0, 0, 1, 1,
1.192557, -1.63811, 3.301656, 0, 0, 0, 1, 1,
1.194439, 0.6065045, 1.257021, 0, 0, 0, 1, 1,
1.194788, -0.6891205, 3.204915, 0, 0, 0, 1, 1,
1.200635, -1.542672, 2.930562, 0, 0, 0, 1, 1,
1.204026, -1.544047, 4.289086, 0, 0, 0, 1, 1,
1.205559, 1.475088, 1.230126, 0, 0, 0, 1, 1,
1.207859, -0.9726359, 1.050887, 0, 0, 0, 1, 1,
1.209749, 0.6152224, 1.294622, 1, 1, 1, 1, 1,
1.21582, -1.242803, 1.956855, 1, 1, 1, 1, 1,
1.225279, -1.170641, 2.831842, 1, 1, 1, 1, 1,
1.23621, -1.842138, 1.919739, 1, 1, 1, 1, 1,
1.240222, -0.4768817, 0.5240418, 1, 1, 1, 1, 1,
1.240536, -0.3200137, 1.863423, 1, 1, 1, 1, 1,
1.244874, 0.3265574, 0.9803005, 1, 1, 1, 1, 1,
1.247182, 0.5614879, 0.9875767, 1, 1, 1, 1, 1,
1.248017, 0.6874784, 1.850124, 1, 1, 1, 1, 1,
1.253688, 1.293372, 0.9226003, 1, 1, 1, 1, 1,
1.254196, -0.6660826, 1.327225, 1, 1, 1, 1, 1,
1.261493, 0.485031, 1.091558, 1, 1, 1, 1, 1,
1.262004, 0.9830413, 1.780524, 1, 1, 1, 1, 1,
1.271282, 0.1924179, 1.773036, 1, 1, 1, 1, 1,
1.273212, 0.6821361, 2.169892, 1, 1, 1, 1, 1,
1.27377, -0.9698297, 1.959544, 0, 0, 1, 1, 1,
1.274942, 0.8648345, 0.9021899, 1, 0, 0, 1, 1,
1.275208, 0.1118606, 1.977853, 1, 0, 0, 1, 1,
1.275547, -0.5245934, -0.110015, 1, 0, 0, 1, 1,
1.276441, 1.355552, 1.762274, 1, 0, 0, 1, 1,
1.282253, -1.027791, 2.257772, 1, 0, 0, 1, 1,
1.28292, -1.104459, 1.825387, 0, 0, 0, 1, 1,
1.283271, -1.242511, 0.188968, 0, 0, 0, 1, 1,
1.292661, -0.5239982, 2.00533, 0, 0, 0, 1, 1,
1.298673, -0.03668899, 2.5025, 0, 0, 0, 1, 1,
1.30372, 1.427558, -0.9126135, 0, 0, 0, 1, 1,
1.317775, 0.7281199, 3.199787, 0, 0, 0, 1, 1,
1.318769, -0.5347434, 1.490047, 0, 0, 0, 1, 1,
1.324145, 1.145684, -0.3497283, 1, 1, 1, 1, 1,
1.324286, -0.9121274, 1.869661, 1, 1, 1, 1, 1,
1.351837, 0.009425607, 2.425331, 1, 1, 1, 1, 1,
1.358521, 2.269247, -0.104623, 1, 1, 1, 1, 1,
1.370664, 0.3842788, 0.6770952, 1, 1, 1, 1, 1,
1.373886, -0.3504359, 1.600417, 1, 1, 1, 1, 1,
1.379632, 0.1502133, -0.1958998, 1, 1, 1, 1, 1,
1.384729, 0.2209737, 1.900059, 1, 1, 1, 1, 1,
1.38817, -1.613256, 0.9206389, 1, 1, 1, 1, 1,
1.389232, 0.5098631, 1.769871, 1, 1, 1, 1, 1,
1.390577, 1.072426, 1.743064, 1, 1, 1, 1, 1,
1.395712, 0.9894072, -0.4150917, 1, 1, 1, 1, 1,
1.397732, 1.260868, 1.94585, 1, 1, 1, 1, 1,
1.399515, 1.021745, 0.3185204, 1, 1, 1, 1, 1,
1.399537, 0.004417471, -0.4874342, 1, 1, 1, 1, 1,
1.401508, 0.02423142, 0.8813105, 0, 0, 1, 1, 1,
1.414145, -0.3592958, 4.099539, 1, 0, 0, 1, 1,
1.416654, 0.2162196, 0.9125906, 1, 0, 0, 1, 1,
1.418129, -0.8463562, 3.618295, 1, 0, 0, 1, 1,
1.418858, -0.4545588, 2.357687, 1, 0, 0, 1, 1,
1.421435, -0.1850992, 2.122182, 1, 0, 0, 1, 1,
1.426475, 0.4354208, 2.590263, 0, 0, 0, 1, 1,
1.439616, -0.8608143, 0.8065812, 0, 0, 0, 1, 1,
1.463019, -0.2724611, 1.202221, 0, 0, 0, 1, 1,
1.469341, 1.051647, 0.4165617, 0, 0, 0, 1, 1,
1.471008, -0.2283712, 4.035815, 0, 0, 0, 1, 1,
1.471707, 1.447376, 0.08343901, 0, 0, 0, 1, 1,
1.4768, -0.3639313, 2.889811, 0, 0, 0, 1, 1,
1.480889, -0.1839478, 0.5768766, 1, 1, 1, 1, 1,
1.491206, -1.135008, 0.9806954, 1, 1, 1, 1, 1,
1.492927, 1.41943, 0.8989763, 1, 1, 1, 1, 1,
1.499239, 0.7754686, 0.291844, 1, 1, 1, 1, 1,
1.507839, 0.9765649, 1.027061, 1, 1, 1, 1, 1,
1.50947, -0.2011179, 0.2599622, 1, 1, 1, 1, 1,
1.511892, 1.981714, 0.1935128, 1, 1, 1, 1, 1,
1.522781, -0.1783491, 2.265217, 1, 1, 1, 1, 1,
1.527532, 0.5740597, 2.059151, 1, 1, 1, 1, 1,
1.53175, -1.772536, 1.930688, 1, 1, 1, 1, 1,
1.533217, -1.508746, 2.1598, 1, 1, 1, 1, 1,
1.542515, 0.2151311, 1.465274, 1, 1, 1, 1, 1,
1.552829, 0.2420997, 1.511345, 1, 1, 1, 1, 1,
1.559312, 1.559349, -0.01231765, 1, 1, 1, 1, 1,
1.56175, -1.445453, 1.163925, 1, 1, 1, 1, 1,
1.571185, -1.600493, 3.806716, 0, 0, 1, 1, 1,
1.574635, 0.1259507, 2.418853, 1, 0, 0, 1, 1,
1.576424, -0.9925527, 1.798524, 1, 0, 0, 1, 1,
1.59087, -1.950749, 2.090189, 1, 0, 0, 1, 1,
1.592808, 0.5693145, 1.303818, 1, 0, 0, 1, 1,
1.603083, 0.4095259, 2.430683, 1, 0, 0, 1, 1,
1.61562, -0.324653, 1.995523, 0, 0, 0, 1, 1,
1.615817, 0.2274761, 0.5937095, 0, 0, 0, 1, 1,
1.623075, -0.7584571, 2.172645, 0, 0, 0, 1, 1,
1.628289, 0.3411456, 1.063209, 0, 0, 0, 1, 1,
1.644506, 0.2709796, 0.8312197, 0, 0, 0, 1, 1,
1.645314, 2.504044, 0.5531018, 0, 0, 0, 1, 1,
1.648729, 0.5127211, 2.292958, 0, 0, 0, 1, 1,
1.651715, -1.752601, 2.693666, 1, 1, 1, 1, 1,
1.652337, -0.3123651, 2.184271, 1, 1, 1, 1, 1,
1.665172, 0.04594997, 1.643026, 1, 1, 1, 1, 1,
1.689752, -0.4096977, 2.024529, 1, 1, 1, 1, 1,
1.692537, 0.3027182, 0.2571797, 1, 1, 1, 1, 1,
1.69602, 0.5024704, -0.1182802, 1, 1, 1, 1, 1,
1.703295, -1.294929, 2.499166, 1, 1, 1, 1, 1,
1.708961, -1.792196, 1.870032, 1, 1, 1, 1, 1,
1.711514, -0.03266476, 0.7947616, 1, 1, 1, 1, 1,
1.722978, -0.2471823, 1.232633, 1, 1, 1, 1, 1,
1.731626, 0.1948049, 2.513157, 1, 1, 1, 1, 1,
1.738263, 1.259555, 1.036264, 1, 1, 1, 1, 1,
1.743346, 0.4715198, 0.3541578, 1, 1, 1, 1, 1,
1.789192, 0.5453091, 0.946689, 1, 1, 1, 1, 1,
1.802991, 1.559219, 0.805482, 1, 1, 1, 1, 1,
1.822447, 1.547509, 0.9586327, 0, 0, 1, 1, 1,
1.846941, 0.1148035, 1.081589, 1, 0, 0, 1, 1,
1.853963, 0.5148156, 1.609599, 1, 0, 0, 1, 1,
1.905385, 0.8718972, 1.87043, 1, 0, 0, 1, 1,
1.9121, 0.5476985, 0.8019162, 1, 0, 0, 1, 1,
1.954255, 0.5449735, 1.042261, 1, 0, 0, 1, 1,
1.959952, 0.5653461, 0.4733117, 0, 0, 0, 1, 1,
2.020839, -0.8413123, 2.111305, 0, 0, 0, 1, 1,
2.074654, 0.1697561, 2.241521, 0, 0, 0, 1, 1,
2.085922, -1.2611, 1.465616, 0, 0, 0, 1, 1,
2.172975, -0.9282122, 2.384032, 0, 0, 0, 1, 1,
2.17362, 0.05195636, 1.424048, 0, 0, 0, 1, 1,
2.193424, -0.3582652, -0.8435715, 0, 0, 0, 1, 1,
2.274163, -1.364807, 3.073902, 1, 1, 1, 1, 1,
2.299551, -0.6074207, 3.098161, 1, 1, 1, 1, 1,
2.463086, 0.4174521, 1.715052, 1, 1, 1, 1, 1,
2.46805, 1.04687, 1.764584, 1, 1, 1, 1, 1,
2.54096, 2.084454, 0.4052372, 1, 1, 1, 1, 1,
2.558084, 0.9719493, 1.657298, 1, 1, 1, 1, 1,
2.604037, -1.098458, -0.3087638, 1, 1, 1, 1, 1
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
var radius = 9.660773;
var distance = 33.93306;
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
mvMatrix.translate( 0.3373637, 0.1131787, -0.5932837 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93306);
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
