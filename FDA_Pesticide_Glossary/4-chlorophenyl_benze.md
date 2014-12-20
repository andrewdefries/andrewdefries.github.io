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
-2.980406, -1.795542, -3.217159, 1, 0, 0, 1,
-2.751123, 0.1386582, -1.552528, 1, 0.007843138, 0, 1,
-2.74553, -0.9855143, -4.038953, 1, 0.01176471, 0, 1,
-2.690967, 1.141657, 0.2970503, 1, 0.01960784, 0, 1,
-2.581242, -0.8028069, -0.8237876, 1, 0.02352941, 0, 1,
-2.570651, 1.308725, -0.4978263, 1, 0.03137255, 0, 1,
-2.523505, -0.6987824, -3.192361, 1, 0.03529412, 0, 1,
-2.510896, -0.05201776, -3.223354, 1, 0.04313726, 0, 1,
-2.492133, 1.045886, -0.1969736, 1, 0.04705882, 0, 1,
-2.431512, -0.5152734, -2.03076, 1, 0.05490196, 0, 1,
-2.425252, 1.289611, 0.1325098, 1, 0.05882353, 0, 1,
-2.369116, 0.3423443, -0.1616613, 1, 0.06666667, 0, 1,
-2.345565, 0.8300852, -1.851881, 1, 0.07058824, 0, 1,
-2.320235, 1.439266, -0.5054261, 1, 0.07843138, 0, 1,
-2.266316, -0.8860576, -3.156709, 1, 0.08235294, 0, 1,
-2.265291, -0.3415065, -1.39724, 1, 0.09019608, 0, 1,
-2.24435, 0.8103935, -2.008281, 1, 0.09411765, 0, 1,
-2.189743, -0.1752796, -1.420645, 1, 0.1019608, 0, 1,
-2.168097, 0.6153978, 0.6006684, 1, 0.1098039, 0, 1,
-2.156426, -1.353921, -1.266655, 1, 0.1137255, 0, 1,
-2.153606, 1.403918, -2.16943, 1, 0.1215686, 0, 1,
-2.138855, 0.3244815, -1.537275, 1, 0.1254902, 0, 1,
-1.991893, -2.164836, -3.556237, 1, 0.1333333, 0, 1,
-1.966201, 0.5512249, -1.184458, 1, 0.1372549, 0, 1,
-1.958306, -0.1901929, -0.4637195, 1, 0.145098, 0, 1,
-1.919443, -0.2205829, -2.743174, 1, 0.1490196, 0, 1,
-1.8981, -0.6749846, -2.957288, 1, 0.1568628, 0, 1,
-1.886503, 1.248436, -1.074349, 1, 0.1607843, 0, 1,
-1.88606, -0.3136947, -1.490064, 1, 0.1686275, 0, 1,
-1.880246, 2.748013, 0.4362961, 1, 0.172549, 0, 1,
-1.873675, -0.4283508, 0.6249844, 1, 0.1803922, 0, 1,
-1.857064, -0.1319107, -0.5689042, 1, 0.1843137, 0, 1,
-1.836336, 1.342418, -1.134731, 1, 0.1921569, 0, 1,
-1.807069, 1.586615, -0.5842156, 1, 0.1960784, 0, 1,
-1.768393, 0.1377964, -0.6084336, 1, 0.2039216, 0, 1,
-1.754283, 1.12459, -1.916168, 1, 0.2117647, 0, 1,
-1.753334, 0.2679033, -1.151896, 1, 0.2156863, 0, 1,
-1.741378, -0.5226393, -3.119125, 1, 0.2235294, 0, 1,
-1.713095, -0.4920726, -3.294394, 1, 0.227451, 0, 1,
-1.712154, -0.8544846, -1.049819, 1, 0.2352941, 0, 1,
-1.701472, -0.3837973, -2.111951, 1, 0.2392157, 0, 1,
-1.678087, -0.6498532, -2.474128, 1, 0.2470588, 0, 1,
-1.662186, -0.3349578, -2.735368, 1, 0.2509804, 0, 1,
-1.65705, -1.963643, -2.861894, 1, 0.2588235, 0, 1,
-1.649175, 0.3663234, -0.6680354, 1, 0.2627451, 0, 1,
-1.634447, 0.05077922, -2.603469, 1, 0.2705882, 0, 1,
-1.632132, 1.718195, -0.3649659, 1, 0.2745098, 0, 1,
-1.628678, -0.03656017, -1.527249, 1, 0.282353, 0, 1,
-1.619909, 1.496685, 1.37729, 1, 0.2862745, 0, 1,
-1.618416, 1.295196, -2.286713, 1, 0.2941177, 0, 1,
-1.585376, 0.6868697, -2.394503, 1, 0.3019608, 0, 1,
-1.570978, -0.0184973, -1.526064, 1, 0.3058824, 0, 1,
-1.544144, 0.4240187, -2.21115, 1, 0.3137255, 0, 1,
-1.543943, -1.382347, -2.890844, 1, 0.3176471, 0, 1,
-1.536276, -0.1929238, -0.6679606, 1, 0.3254902, 0, 1,
-1.526947, 0.9987534, -3.048897, 1, 0.3294118, 0, 1,
-1.526126, 0.5975816, -1.148412, 1, 0.3372549, 0, 1,
-1.51972, 0.004707783, -4.87437, 1, 0.3411765, 0, 1,
-1.517072, -1.36827, -1.503396, 1, 0.3490196, 0, 1,
-1.502062, -1.889962, -2.201281, 1, 0.3529412, 0, 1,
-1.499003, 0.5823029, -1.566655, 1, 0.3607843, 0, 1,
-1.49608, 0.014698, -1.537603, 1, 0.3647059, 0, 1,
-1.484409, 1.133788, -0.9580152, 1, 0.372549, 0, 1,
-1.481968, 1.558555, -1.669306, 1, 0.3764706, 0, 1,
-1.472882, -1.148884, 0.1532036, 1, 0.3843137, 0, 1,
-1.46887, 1.917893, -1.264785, 1, 0.3882353, 0, 1,
-1.468058, -0.3546711, -2.100322, 1, 0.3960784, 0, 1,
-1.463103, -0.00344105, -1.635552, 1, 0.4039216, 0, 1,
-1.452524, 0.3065516, -0.5258483, 1, 0.4078431, 0, 1,
-1.445257, -0.3988814, -0.7678642, 1, 0.4156863, 0, 1,
-1.440166, -0.4007307, -2.616203, 1, 0.4196078, 0, 1,
-1.432041, 0.5450792, 0.06235994, 1, 0.427451, 0, 1,
-1.43051, -0.6279199, -1.87546, 1, 0.4313726, 0, 1,
-1.428723, 1.061627, -0.5220148, 1, 0.4392157, 0, 1,
-1.426029, -1.027595, -2.574514, 1, 0.4431373, 0, 1,
-1.417766, 1.135588, -0.1520026, 1, 0.4509804, 0, 1,
-1.40834, 0.8036877, -0.45904, 1, 0.454902, 0, 1,
-1.407364, 0.4094357, -0.6256673, 1, 0.4627451, 0, 1,
-1.392957, -0.1886316, -1.506998, 1, 0.4666667, 0, 1,
-1.387148, 0.6470693, -1.521278, 1, 0.4745098, 0, 1,
-1.385995, 0.287686, -2.128525, 1, 0.4784314, 0, 1,
-1.379256, 0.6637325, -1.850208, 1, 0.4862745, 0, 1,
-1.377955, -0.7829894, -2.653787, 1, 0.4901961, 0, 1,
-1.368556, -0.4850468, -0.5056708, 1, 0.4980392, 0, 1,
-1.358881, 1.472845, -1.09183, 1, 0.5058824, 0, 1,
-1.347792, -0.3675008, -1.733131, 1, 0.509804, 0, 1,
-1.347456, 0.1173537, -2.030617, 1, 0.5176471, 0, 1,
-1.346469, -0.8227088, -2.563112, 1, 0.5215687, 0, 1,
-1.334893, -0.9198083, -2.191462, 1, 0.5294118, 0, 1,
-1.316842, 0.7760856, -1.036575, 1, 0.5333334, 0, 1,
-1.31262, -1.166439, -2.010313, 1, 0.5411765, 0, 1,
-1.310818, 1.750091, -0.6607208, 1, 0.5450981, 0, 1,
-1.307122, 0.2276347, -3.389045, 1, 0.5529412, 0, 1,
-1.288801, 1.508775, -2.046537, 1, 0.5568628, 0, 1,
-1.288076, 1.142713, 1.803571, 1, 0.5647059, 0, 1,
-1.280226, 1.155805, -0.7492218, 1, 0.5686275, 0, 1,
-1.278087, 0.2222134, -1.405238, 1, 0.5764706, 0, 1,
-1.274252, 0.7518217, -1.705546, 1, 0.5803922, 0, 1,
-1.269668, 0.8944485, -2.027269, 1, 0.5882353, 0, 1,
-1.265999, -0.5189906, -1.14934, 1, 0.5921569, 0, 1,
-1.264761, -0.01680769, -2.390647, 1, 0.6, 0, 1,
-1.261404, 0.5491717, -1.621906, 1, 0.6078432, 0, 1,
-1.258489, -0.8887466, -1.331277, 1, 0.6117647, 0, 1,
-1.258221, 0.5729359, -1.344329, 1, 0.6196079, 0, 1,
-1.257836, -0.2121748, -1.394684, 1, 0.6235294, 0, 1,
-1.253955, -0.4869969, -1.198169, 1, 0.6313726, 0, 1,
-1.251777, 0.053413, -1.500751, 1, 0.6352941, 0, 1,
-1.250894, -1.571503, -0.5422277, 1, 0.6431373, 0, 1,
-1.246119, -1.192533, -1.491299, 1, 0.6470588, 0, 1,
-1.234011, -0.5712227, -2.655025, 1, 0.654902, 0, 1,
-1.233391, -0.6730343, -2.620099, 1, 0.6588235, 0, 1,
-1.228698, 1.217724, -0.3167155, 1, 0.6666667, 0, 1,
-1.220699, -1.898974, -3.543517, 1, 0.6705883, 0, 1,
-1.21475, 0.8298599, -0.6824598, 1, 0.6784314, 0, 1,
-1.212801, -1.75975, -2.124229, 1, 0.682353, 0, 1,
-1.211133, 0.02506958, -1.113947, 1, 0.6901961, 0, 1,
-1.207168, -0.1027187, -0.2096394, 1, 0.6941177, 0, 1,
-1.194725, -1.433828, -1.712915, 1, 0.7019608, 0, 1,
-1.194107, 0.1168695, -1.80838, 1, 0.7098039, 0, 1,
-1.190114, -0.494654, -3.686701, 1, 0.7137255, 0, 1,
-1.17563, -0.002312861, -1.336031, 1, 0.7215686, 0, 1,
-1.174219, 0.1557565, -2.48328, 1, 0.7254902, 0, 1,
-1.172583, -1.176862, -2.801969, 1, 0.7333333, 0, 1,
-1.170594, -1.071316, -2.893586, 1, 0.7372549, 0, 1,
-1.16766, -0.4729919, -3.020141, 1, 0.7450981, 0, 1,
-1.165442, -1.024968, -3.26308, 1, 0.7490196, 0, 1,
-1.164812, -0.3258233, -0.593685, 1, 0.7568628, 0, 1,
-1.154873, -0.6141937, -1.138669, 1, 0.7607843, 0, 1,
-1.148389, 0.1625149, -0.4838288, 1, 0.7686275, 0, 1,
-1.143216, 0.1116147, -2.334431, 1, 0.772549, 0, 1,
-1.142182, 0.4702514, -1.302723, 1, 0.7803922, 0, 1,
-1.128721, -0.6893324, -1.354368, 1, 0.7843137, 0, 1,
-1.126599, -0.3716596, -2.031392, 1, 0.7921569, 0, 1,
-1.102927, 0.3610654, -1.521202, 1, 0.7960784, 0, 1,
-1.094699, 0.8024495, -1.325826, 1, 0.8039216, 0, 1,
-1.092917, -0.8145193, -2.255482, 1, 0.8117647, 0, 1,
-1.0858, -0.8565156, -1.734316, 1, 0.8156863, 0, 1,
-1.084079, -1.84155, -2.542301, 1, 0.8235294, 0, 1,
-1.080817, 1.113551, -2.429397, 1, 0.827451, 0, 1,
-1.079213, -0.5869616, -0.4884737, 1, 0.8352941, 0, 1,
-1.078336, -0.6491278, -2.993175, 1, 0.8392157, 0, 1,
-1.072587, 0.342353, -0.5330542, 1, 0.8470588, 0, 1,
-1.06996, -0.05415714, -1.749559, 1, 0.8509804, 0, 1,
-1.063003, -0.6779845, -2.874878, 1, 0.8588235, 0, 1,
-1.054465, -1.179931, -3.230212, 1, 0.8627451, 0, 1,
-1.044527, -0.2295465, -1.925623, 1, 0.8705882, 0, 1,
-1.037939, -1.758987, -3.027523, 1, 0.8745098, 0, 1,
-1.035152, 0.6143243, -1.075619, 1, 0.8823529, 0, 1,
-1.034742, 0.5571303, -0.50076, 1, 0.8862745, 0, 1,
-1.018783, 0.5510334, 0.7719243, 1, 0.8941177, 0, 1,
-1.017161, -1.146814, -3.434161, 1, 0.8980392, 0, 1,
-1.016312, 0.7432893, 0.3031498, 1, 0.9058824, 0, 1,
-1.01559, -0.8385747, -3.62881, 1, 0.9137255, 0, 1,
-1.01414, -0.5221703, -1.406073, 1, 0.9176471, 0, 1,
-1.011975, -0.3232968, -1.699235, 1, 0.9254902, 0, 1,
-1.011313, -2.776308, -3.761017, 1, 0.9294118, 0, 1,
-1.01098, 1.172612, 1.618877, 1, 0.9372549, 0, 1,
-1.007984, 0.4714155, -0.757707, 1, 0.9411765, 0, 1,
-1.005819, -0.02319574, -0.6104675, 1, 0.9490196, 0, 1,
-1.005653, -0.232032, -1.787883, 1, 0.9529412, 0, 1,
-0.9975011, -0.7304771, -3.679967, 1, 0.9607843, 0, 1,
-0.9950905, -0.2055669, -2.679789, 1, 0.9647059, 0, 1,
-0.9915416, -2.385676, -0.5593162, 1, 0.972549, 0, 1,
-0.9900305, 0.7909972, 0.02870925, 1, 0.9764706, 0, 1,
-0.984966, -0.3289212, -3.265441, 1, 0.9843137, 0, 1,
-0.9810619, 0.2524957, -2.460241, 1, 0.9882353, 0, 1,
-0.9792471, -0.5998999, -1.289082, 1, 0.9960784, 0, 1,
-0.975094, -0.5444372, -1.439657, 0.9960784, 1, 0, 1,
-0.9731339, 1.507348, -0.3248774, 0.9921569, 1, 0, 1,
-0.9714823, 0.1264746, -1.640666, 0.9843137, 1, 0, 1,
-0.9702986, 0.1385028, -0.7391914, 0.9803922, 1, 0, 1,
-0.9668841, -0.2857796, -2.664574, 0.972549, 1, 0, 1,
-0.9650817, 0.5133263, -1.131048, 0.9686275, 1, 0, 1,
-0.963427, 0.2660507, -1.973787, 0.9607843, 1, 0, 1,
-0.962478, 1.280561, -1.924693, 0.9568627, 1, 0, 1,
-0.9599705, 2.326219, 0.4997218, 0.9490196, 1, 0, 1,
-0.9594079, -0.3899635, -1.333734, 0.945098, 1, 0, 1,
-0.9592288, -1.056413, -1.891377, 0.9372549, 1, 0, 1,
-0.9554976, 0.9651751, 0.624482, 0.9333333, 1, 0, 1,
-0.9539939, 0.6924091, -2.190757, 0.9254902, 1, 0, 1,
-0.9432544, 0.4463389, -3.204183, 0.9215686, 1, 0, 1,
-0.9400317, 1.145071, -0.8905959, 0.9137255, 1, 0, 1,
-0.9387029, 0.1447813, 0.3904339, 0.9098039, 1, 0, 1,
-0.9371718, 1.518038, -1.990647, 0.9019608, 1, 0, 1,
-0.9344822, -1.28231, -3.03827, 0.8941177, 1, 0, 1,
-0.9339471, 0.4835542, -1.870802, 0.8901961, 1, 0, 1,
-0.9317909, -0.7818829, -0.6779581, 0.8823529, 1, 0, 1,
-0.9315107, -0.6866249, -3.476888, 0.8784314, 1, 0, 1,
-0.9260256, -0.6069072, -2.196728, 0.8705882, 1, 0, 1,
-0.9259216, -1.200094, -2.092154, 0.8666667, 1, 0, 1,
-0.9183424, 0.6814716, 1.162296, 0.8588235, 1, 0, 1,
-0.9124089, 0.864252, -0.754239, 0.854902, 1, 0, 1,
-0.9063703, -0.5577598, -1.991876, 0.8470588, 1, 0, 1,
-0.9045196, 0.1946996, -1.398362, 0.8431373, 1, 0, 1,
-0.9034888, 0.8475167, -0.7068161, 0.8352941, 1, 0, 1,
-0.9006397, 0.8859846, 0.781011, 0.8313726, 1, 0, 1,
-0.8996935, 0.2358051, 0.3461737, 0.8235294, 1, 0, 1,
-0.8987369, -1.458798, -2.902993, 0.8196079, 1, 0, 1,
-0.8973112, 0.07130972, -1.280898, 0.8117647, 1, 0, 1,
-0.8900293, -1.100635, -1.77844, 0.8078431, 1, 0, 1,
-0.8871855, -1.136046, -0.6468677, 0.8, 1, 0, 1,
-0.884762, -2.155118, -4.629978, 0.7921569, 1, 0, 1,
-0.8812035, -0.5132712, -1.32082, 0.7882353, 1, 0, 1,
-0.8805001, -0.05087352, -1.838386, 0.7803922, 1, 0, 1,
-0.87664, 2.05697, -0.004841127, 0.7764706, 1, 0, 1,
-0.8760353, -0.149017, -2.210795, 0.7686275, 1, 0, 1,
-0.8724282, 1.373993, 1.831174, 0.7647059, 1, 0, 1,
-0.8620604, 0.7689539, -1.254077, 0.7568628, 1, 0, 1,
-0.8597357, 0.716597, -1.050324, 0.7529412, 1, 0, 1,
-0.8434039, -2.2199, -2.893714, 0.7450981, 1, 0, 1,
-0.841958, 0.5262567, 0.1024363, 0.7411765, 1, 0, 1,
-0.8409233, -0.3741876, -2.659599, 0.7333333, 1, 0, 1,
-0.8393816, 0.8138658, -1.224972, 0.7294118, 1, 0, 1,
-0.838537, 1.584928, 0.1642633, 0.7215686, 1, 0, 1,
-0.8367097, -0.9486987, -2.286485, 0.7176471, 1, 0, 1,
-0.8362075, 0.357303, -1.965869, 0.7098039, 1, 0, 1,
-0.8307636, 0.3663772, -0.8381537, 0.7058824, 1, 0, 1,
-0.8304605, -0.06233172, -0.8825494, 0.6980392, 1, 0, 1,
-0.8256316, 0.07802431, -0.7868835, 0.6901961, 1, 0, 1,
-0.8213139, 0.7740355, -1.20972, 0.6862745, 1, 0, 1,
-0.8185859, -0.2870572, -1.506376, 0.6784314, 1, 0, 1,
-0.8185228, 1.010942, -1.423746, 0.6745098, 1, 0, 1,
-0.8168254, -1.003064, -2.543929, 0.6666667, 1, 0, 1,
-0.8152313, -0.8773516, -2.675263, 0.6627451, 1, 0, 1,
-0.8073443, -2.526857, -1.793453, 0.654902, 1, 0, 1,
-0.803511, -0.9894475, -2.449182, 0.6509804, 1, 0, 1,
-0.7933727, 1.271529, 1.258874, 0.6431373, 1, 0, 1,
-0.7930983, 1.274524, -0.07477322, 0.6392157, 1, 0, 1,
-0.7923468, -1.036484, -2.497864, 0.6313726, 1, 0, 1,
-0.7920049, 2.316754, 0.7292534, 0.627451, 1, 0, 1,
-0.7918083, -1.487228, -3.579404, 0.6196079, 1, 0, 1,
-0.7910841, -1.745645, -2.795242, 0.6156863, 1, 0, 1,
-0.7910442, 1.539176, -0.6784459, 0.6078432, 1, 0, 1,
-0.7889624, 0.2524001, -3.074625, 0.6039216, 1, 0, 1,
-0.7839133, -0.5922559, -2.368357, 0.5960785, 1, 0, 1,
-0.7823523, 0.1096605, -1.620442, 0.5882353, 1, 0, 1,
-0.7763128, 0.7352338, -1.078461, 0.5843138, 1, 0, 1,
-0.7753823, 1.101328, -0.3720488, 0.5764706, 1, 0, 1,
-0.7738374, -0.1556635, -2.046176, 0.572549, 1, 0, 1,
-0.7668527, 0.4452804, -0.8188417, 0.5647059, 1, 0, 1,
-0.7640974, 1.410883, -0.9316403, 0.5607843, 1, 0, 1,
-0.7621602, -2.534494, -2.451347, 0.5529412, 1, 0, 1,
-0.7619892, -0.5920098, -2.91189, 0.5490196, 1, 0, 1,
-0.760157, -0.637907, -2.633991, 0.5411765, 1, 0, 1,
-0.7600946, -0.3139317, -2.430663, 0.5372549, 1, 0, 1,
-0.7575063, -1.99938, -2.089242, 0.5294118, 1, 0, 1,
-0.7555527, -0.7188556, -3.127911, 0.5254902, 1, 0, 1,
-0.7475052, 0.9514507, 1.005639, 0.5176471, 1, 0, 1,
-0.744101, 0.8248591, -0.9745881, 0.5137255, 1, 0, 1,
-0.7408181, 0.1596149, -1.625016, 0.5058824, 1, 0, 1,
-0.7373952, 0.81471, -1.886789, 0.5019608, 1, 0, 1,
-0.7337285, 4.026119, -0.2506894, 0.4941176, 1, 0, 1,
-0.7298042, 1.480476, -1.082197, 0.4862745, 1, 0, 1,
-0.7286264, -2.843872, -2.718649, 0.4823529, 1, 0, 1,
-0.7264495, -0.2949181, -0.4933756, 0.4745098, 1, 0, 1,
-0.7173272, 1.246191, -0.1632739, 0.4705882, 1, 0, 1,
-0.7164642, -1.720635, -3.973799, 0.4627451, 1, 0, 1,
-0.7128121, -1.528145, -3.460053, 0.4588235, 1, 0, 1,
-0.7126737, 1.511604, -0.1350709, 0.4509804, 1, 0, 1,
-0.7117314, 0.9187774, -1.488307, 0.4470588, 1, 0, 1,
-0.7099679, -1.184067, -4.303875, 0.4392157, 1, 0, 1,
-0.7086837, -1.44828, -3.503106, 0.4352941, 1, 0, 1,
-0.7086265, -0.08046053, -1.231833, 0.427451, 1, 0, 1,
-0.7074956, 0.5318683, -0.6466525, 0.4235294, 1, 0, 1,
-0.7069655, 0.3029529, -1.974928, 0.4156863, 1, 0, 1,
-0.7019703, -1.092344, -2.108445, 0.4117647, 1, 0, 1,
-0.695251, -0.8571339, -2.321893, 0.4039216, 1, 0, 1,
-0.6938456, -0.797757, -2.719149, 0.3960784, 1, 0, 1,
-0.6869088, 2.194695, 0.02211626, 0.3921569, 1, 0, 1,
-0.6814057, 0.2289677, -1.829556, 0.3843137, 1, 0, 1,
-0.6774511, 0.1146308, -0.4218056, 0.3803922, 1, 0, 1,
-0.6754322, 0.4991082, 0.1446922, 0.372549, 1, 0, 1,
-0.6754064, -0.8574706, -0.6124799, 0.3686275, 1, 0, 1,
-0.6740293, -0.1705512, -1.269301, 0.3607843, 1, 0, 1,
-0.6710554, -0.3762311, -1.576888, 0.3568628, 1, 0, 1,
-0.6690271, 1.692844, 0.5163118, 0.3490196, 1, 0, 1,
-0.665699, -0.2970123, -1.901273, 0.345098, 1, 0, 1,
-0.6575418, -0.5981056, -4.639285, 0.3372549, 1, 0, 1,
-0.657276, -1.514392, -3.508443, 0.3333333, 1, 0, 1,
-0.6549134, 0.4819697, -1.097396, 0.3254902, 1, 0, 1,
-0.6522274, 0.1084993, -1.005584, 0.3215686, 1, 0, 1,
-0.6490096, 0.6469856, -1.080028, 0.3137255, 1, 0, 1,
-0.6480688, 0.9319106, -2.655918, 0.3098039, 1, 0, 1,
-0.6477861, -0.01279695, -1.724816, 0.3019608, 1, 0, 1,
-0.6454912, 1.740236, -1.561847, 0.2941177, 1, 0, 1,
-0.6449283, -0.5575284, -2.644162, 0.2901961, 1, 0, 1,
-0.6439703, -2.183693, -2.971023, 0.282353, 1, 0, 1,
-0.6438338, 0.3861345, -0.2762303, 0.2784314, 1, 0, 1,
-0.6389001, -0.9883995, -2.810009, 0.2705882, 1, 0, 1,
-0.6360394, -1.277496, -2.195097, 0.2666667, 1, 0, 1,
-0.6359651, -0.04805795, -0.6003942, 0.2588235, 1, 0, 1,
-0.6272708, 1.075641, -1.267725, 0.254902, 1, 0, 1,
-0.6211076, -1.378872, -1.778623, 0.2470588, 1, 0, 1,
-0.6180798, -0.8803043, -1.940055, 0.2431373, 1, 0, 1,
-0.612501, 0.7303041, 0.954559, 0.2352941, 1, 0, 1,
-0.6124607, 0.562506, 0.5677719, 0.2313726, 1, 0, 1,
-0.6116101, 0.3825873, -0.957473, 0.2235294, 1, 0, 1,
-0.6114302, 1.567943, 0.7536261, 0.2196078, 1, 0, 1,
-0.6092963, 1.054543, -0.5119265, 0.2117647, 1, 0, 1,
-0.6041524, 0.7629596, -2.015886, 0.2078431, 1, 0, 1,
-0.5980829, -0.2089441, -0.7891285, 0.2, 1, 0, 1,
-0.5971401, -0.4304493, -1.794329, 0.1921569, 1, 0, 1,
-0.5908533, 0.8185267, -1.541929, 0.1882353, 1, 0, 1,
-0.5847635, -0.07089533, -3.684887, 0.1803922, 1, 0, 1,
-0.5816735, -0.06660282, -2.177183, 0.1764706, 1, 0, 1,
-0.5746156, 0.4939149, -2.229268, 0.1686275, 1, 0, 1,
-0.5740041, -0.4850768, -2.040509, 0.1647059, 1, 0, 1,
-0.566515, -0.3172353, -4.116226, 0.1568628, 1, 0, 1,
-0.566462, 0.2102598, -2.59463, 0.1529412, 1, 0, 1,
-0.5649189, 0.5375398, -0.8903064, 0.145098, 1, 0, 1,
-0.562003, -0.5932127, -0.9414799, 0.1411765, 1, 0, 1,
-0.5606563, 0.3382764, -0.250535, 0.1333333, 1, 0, 1,
-0.5575113, -0.03735166, -1.200923, 0.1294118, 1, 0, 1,
-0.557285, -1.556877, -0.761558, 0.1215686, 1, 0, 1,
-0.5534114, -0.1829801, -0.5758582, 0.1176471, 1, 0, 1,
-0.551545, -2.143082, -2.781098, 0.1098039, 1, 0, 1,
-0.5473214, 0.7122009, -1.676603, 0.1058824, 1, 0, 1,
-0.5472872, 0.6835043, -0.8583166, 0.09803922, 1, 0, 1,
-0.5457125, -0.6133705, -2.640686, 0.09019608, 1, 0, 1,
-0.5445756, -0.130583, -1.441659, 0.08627451, 1, 0, 1,
-0.5434652, 0.4893615, -0.8383951, 0.07843138, 1, 0, 1,
-0.5424866, 0.4509246, 0.4095567, 0.07450981, 1, 0, 1,
-0.5381442, 0.5194411, 0.3304377, 0.06666667, 1, 0, 1,
-0.5365152, 0.7377399, 0.6677859, 0.0627451, 1, 0, 1,
-0.5349133, 0.1091179, -2.341185, 0.05490196, 1, 0, 1,
-0.5273585, -1.684675, -4.654242, 0.05098039, 1, 0, 1,
-0.5246708, 0.6458985, 0.5244808, 0.04313726, 1, 0, 1,
-0.5243978, 0.3575962, -1.541041, 0.03921569, 1, 0, 1,
-0.5241262, -0.09276427, -3.444239, 0.03137255, 1, 0, 1,
-0.5209478, -0.2469866, -1.966254, 0.02745098, 1, 0, 1,
-0.5207313, -0.9273143, -3.301278, 0.01960784, 1, 0, 1,
-0.5187189, -1.576533, -2.154712, 0.01568628, 1, 0, 1,
-0.5163424, 1.418228, -1.18212, 0.007843138, 1, 0, 1,
-0.5117807, 1.40793, 0.4737248, 0.003921569, 1, 0, 1,
-0.5053922, 0.1192212, -0.7815032, 0, 1, 0.003921569, 1,
-0.5051458, -1.178705, -2.069584, 0, 1, 0.01176471, 1,
-0.4943196, -0.01841807, -1.232818, 0, 1, 0.01568628, 1,
-0.4928475, -0.8662369, -0.9395674, 0, 1, 0.02352941, 1,
-0.4917729, -1.117476, -1.535197, 0, 1, 0.02745098, 1,
-0.4874445, -1.608653, -3.467435, 0, 1, 0.03529412, 1,
-0.4853114, -0.9477326, -1.344957, 0, 1, 0.03921569, 1,
-0.4852555, 0.08771276, -2.797659, 0, 1, 0.04705882, 1,
-0.4835206, 1.100006, 1.109905, 0, 1, 0.05098039, 1,
-0.4778872, -0.9998563, -1.64458, 0, 1, 0.05882353, 1,
-0.4713466, 1.001216, -1.238096, 0, 1, 0.0627451, 1,
-0.4684136, -0.9361498, -1.24487, 0, 1, 0.07058824, 1,
-0.461525, 0.3708643, -3.453133, 0, 1, 0.07450981, 1,
-0.4587069, -0.6655624, -0.5914568, 0, 1, 0.08235294, 1,
-0.4567307, 1.187144, -1.285778, 0, 1, 0.08627451, 1,
-0.452362, -2.904805, -1.874082, 0, 1, 0.09411765, 1,
-0.4509849, 0.5458928, -2.184016, 0, 1, 0.1019608, 1,
-0.4508495, -0.1874807, -2.702525, 0, 1, 0.1058824, 1,
-0.4500707, -0.7121975, -3.339821, 0, 1, 0.1137255, 1,
-0.4458229, -0.5395597, -2.856818, 0, 1, 0.1176471, 1,
-0.4440741, -1.122251, -3.169907, 0, 1, 0.1254902, 1,
-0.4429969, -0.6887683, -2.481476, 0, 1, 0.1294118, 1,
-0.4361854, 0.4130526, -0.6820832, 0, 1, 0.1372549, 1,
-0.4337701, -0.03922082, -0.291963, 0, 1, 0.1411765, 1,
-0.4284533, 1.039669, -0.09182794, 0, 1, 0.1490196, 1,
-0.4279284, 0.7338363, -1.460513, 0, 1, 0.1529412, 1,
-0.426338, -0.8493277, -1.780856, 0, 1, 0.1607843, 1,
-0.426152, 1.039798, -0.1907415, 0, 1, 0.1647059, 1,
-0.4250681, 1.244827, 0.3590157, 0, 1, 0.172549, 1,
-0.4150111, -1.652927, -1.335078, 0, 1, 0.1764706, 1,
-0.4137921, -1.57373, -3.879172, 0, 1, 0.1843137, 1,
-0.4104444, 0.4396636, -1.531824, 0, 1, 0.1882353, 1,
-0.4076809, -0.245435, -1.5716, 0, 1, 0.1960784, 1,
-0.3889519, -1.211157, -2.239192, 0, 1, 0.2039216, 1,
-0.3775532, 0.9712111, -0.2959812, 0, 1, 0.2078431, 1,
-0.376405, 0.02407441, -2.244175, 0, 1, 0.2156863, 1,
-0.3750429, -1.503012, -2.491734, 0, 1, 0.2196078, 1,
-0.370932, -1.2151, -3.885535, 0, 1, 0.227451, 1,
-0.370776, -1.745378, -4.068227, 0, 1, 0.2313726, 1,
-0.3682818, -0.7246407, -4.390759, 0, 1, 0.2392157, 1,
-0.3644803, -0.4626094, -3.973155, 0, 1, 0.2431373, 1,
-0.3642573, 0.5696381, -1.163698, 0, 1, 0.2509804, 1,
-0.3615598, -0.6815758, -3.311574, 0, 1, 0.254902, 1,
-0.3610806, -0.4952249, -3.895513, 0, 1, 0.2627451, 1,
-0.3552851, -0.7767431, -3.675427, 0, 1, 0.2666667, 1,
-0.3522242, 0.5658661, -0.3830803, 0, 1, 0.2745098, 1,
-0.3501488, 0.4642488, -1.823814, 0, 1, 0.2784314, 1,
-0.3476875, -0.2835791, -1.612478, 0, 1, 0.2862745, 1,
-0.3465733, 2.150101, 0.2045059, 0, 1, 0.2901961, 1,
-0.3441063, 1.039128, -0.613655, 0, 1, 0.2980392, 1,
-0.3426671, 0.5729194, 0.9504293, 0, 1, 0.3058824, 1,
-0.3401858, 1.912614, -1.723345, 0, 1, 0.3098039, 1,
-0.3363513, 1.337567, 1.050921, 0, 1, 0.3176471, 1,
-0.3360932, 0.08133658, -2.07761, 0, 1, 0.3215686, 1,
-0.3312038, 0.09094688, -0.05606006, 0, 1, 0.3294118, 1,
-0.325009, -1.366055, -2.304016, 0, 1, 0.3333333, 1,
-0.3226952, -0.2888052, -0.1869577, 0, 1, 0.3411765, 1,
-0.3214367, 0.3029647, 0.734067, 0, 1, 0.345098, 1,
-0.3206404, 1.774482, 1.274867, 0, 1, 0.3529412, 1,
-0.319125, -1.130994, -2.368981, 0, 1, 0.3568628, 1,
-0.3167058, 0.1904341, -0.4887551, 0, 1, 0.3647059, 1,
-0.3164757, 0.1873305, -0.8619593, 0, 1, 0.3686275, 1,
-0.3149959, 1.372557, 0.09352206, 0, 1, 0.3764706, 1,
-0.3105166, 0.4331773, -1.087062, 0, 1, 0.3803922, 1,
-0.3099351, 1.202639, -2.321238, 0, 1, 0.3882353, 1,
-0.3072493, -0.5998719, -3.681958, 0, 1, 0.3921569, 1,
-0.3045226, 0.8439389, -0.3738806, 0, 1, 0.4, 1,
-0.2987993, -1.885327, -2.823995, 0, 1, 0.4078431, 1,
-0.2982836, 0.1031554, -0.8223507, 0, 1, 0.4117647, 1,
-0.2982379, -0.08035616, -1.876737, 0, 1, 0.4196078, 1,
-0.2973842, -0.1490284, -2.858195, 0, 1, 0.4235294, 1,
-0.2950197, -1.121025, -3.707644, 0, 1, 0.4313726, 1,
-0.2934257, 0.8538745, -0.2403935, 0, 1, 0.4352941, 1,
-0.2914992, 0.7827466, -1.638149, 0, 1, 0.4431373, 1,
-0.2869644, -1.513558, -4.170571, 0, 1, 0.4470588, 1,
-0.2822359, -0.1783927, -2.168366, 0, 1, 0.454902, 1,
-0.2814766, 1.78168, -1.517028, 0, 1, 0.4588235, 1,
-0.2785466, 0.4263558, -0.2786895, 0, 1, 0.4666667, 1,
-0.2727859, 0.1733952, -0.6658208, 0, 1, 0.4705882, 1,
-0.267314, 0.2075891, -2.310658, 0, 1, 0.4784314, 1,
-0.2667713, 1.490259, 1.213726, 0, 1, 0.4823529, 1,
-0.2664249, 2.357516, 0.2323841, 0, 1, 0.4901961, 1,
-0.2661541, 0.3845274, 0.8529204, 0, 1, 0.4941176, 1,
-0.2629346, 1.075462, -1.318729, 0, 1, 0.5019608, 1,
-0.2529919, -1.070372, -3.944801, 0, 1, 0.509804, 1,
-0.2424911, -0.7067419, -4.55499, 0, 1, 0.5137255, 1,
-0.2379862, 0.9685637, -1.022286, 0, 1, 0.5215687, 1,
-0.2376413, -0.346632, -2.823414, 0, 1, 0.5254902, 1,
-0.2368677, -1.113744, -2.150067, 0, 1, 0.5333334, 1,
-0.2296271, 1.121279, 1.203172, 0, 1, 0.5372549, 1,
-0.2280324, 0.6952431, -0.363302, 0, 1, 0.5450981, 1,
-0.2271975, 0.5940363, 0.7290079, 0, 1, 0.5490196, 1,
-0.2260391, 0.1009738, -1.713483, 0, 1, 0.5568628, 1,
-0.2250636, 0.0860787, -0.2955123, 0, 1, 0.5607843, 1,
-0.2241489, -0.755202, -4.090062, 0, 1, 0.5686275, 1,
-0.2206228, 1.092396, 1.622643, 0, 1, 0.572549, 1,
-0.212306, -1.113058, -3.071944, 0, 1, 0.5803922, 1,
-0.2047648, -0.6437287, -2.183175, 0, 1, 0.5843138, 1,
-0.2019891, 1.411729, -0.1916952, 0, 1, 0.5921569, 1,
-0.1962983, 0.1863325, -1.553589, 0, 1, 0.5960785, 1,
-0.19617, -0.5647013, -2.221212, 0, 1, 0.6039216, 1,
-0.1958665, -0.196591, -4.62184, 0, 1, 0.6117647, 1,
-0.1948301, -0.1019022, -3.657856, 0, 1, 0.6156863, 1,
-0.1931977, 0.5436835, -0.7428606, 0, 1, 0.6235294, 1,
-0.1927316, -0.6883144, -2.356591, 0, 1, 0.627451, 1,
-0.1921157, -1.038258, -2.107024, 0, 1, 0.6352941, 1,
-0.1920543, 0.1373826, -0.3634195, 0, 1, 0.6392157, 1,
-0.1910187, 0.04869313, -0.4896458, 0, 1, 0.6470588, 1,
-0.1873523, 0.8849369, 0.8234176, 0, 1, 0.6509804, 1,
-0.1862565, 1.35593, 0.08294622, 0, 1, 0.6588235, 1,
-0.185809, 0.0229193, -2.675739, 0, 1, 0.6627451, 1,
-0.1855558, 1.233781, -0.6106645, 0, 1, 0.6705883, 1,
-0.1823296, -0.8325412, -3.088212, 0, 1, 0.6745098, 1,
-0.1813712, -0.4918599, -1.667345, 0, 1, 0.682353, 1,
-0.1788828, 0.3072401, 0.7839335, 0, 1, 0.6862745, 1,
-0.1739399, -0.7663598, -2.06149, 0, 1, 0.6941177, 1,
-0.1726562, -1.088342, -4.241952, 0, 1, 0.7019608, 1,
-0.165206, 2.410237, -0.4722255, 0, 1, 0.7058824, 1,
-0.1621426, 0.6052529, 0.6619939, 0, 1, 0.7137255, 1,
-0.1616368, 0.8170192, -0.6245614, 0, 1, 0.7176471, 1,
-0.1578433, -1.213845, -2.353112, 0, 1, 0.7254902, 1,
-0.1564371, -1.313535, -3.619105, 0, 1, 0.7294118, 1,
-0.1562261, 0.3045599, -0.3696319, 0, 1, 0.7372549, 1,
-0.1560631, 1.173067, -1.402667, 0, 1, 0.7411765, 1,
-0.1552209, 1.868162, -0.1949765, 0, 1, 0.7490196, 1,
-0.1535187, -0.3054383, -3.75593, 0, 1, 0.7529412, 1,
-0.1528044, -0.7976226, -4.06389, 0, 1, 0.7607843, 1,
-0.1476164, 0.8773015, -2.064029, 0, 1, 0.7647059, 1,
-0.147187, 1.360138, -0.7286479, 0, 1, 0.772549, 1,
-0.1468098, 1.593011, -1.405101, 0, 1, 0.7764706, 1,
-0.1458687, -0.07610869, -3.570037, 0, 1, 0.7843137, 1,
-0.142534, -0.4868398, -1.861421, 0, 1, 0.7882353, 1,
-0.1403639, -0.7496816, -3.299293, 0, 1, 0.7960784, 1,
-0.1377546, 0.2484544, -0.4158523, 0, 1, 0.8039216, 1,
-0.1360884, -2.513963, -2.326148, 0, 1, 0.8078431, 1,
-0.1358749, -1.527385, -3.168551, 0, 1, 0.8156863, 1,
-0.1354284, 0.8236328, -2.143242, 0, 1, 0.8196079, 1,
-0.133675, -1.201375, -3.580212, 0, 1, 0.827451, 1,
-0.1275044, -0.5089443, -1.793831, 0, 1, 0.8313726, 1,
-0.1166069, -0.3402674, -3.082868, 0, 1, 0.8392157, 1,
-0.1100031, -0.5646985, -4.462494, 0, 1, 0.8431373, 1,
-0.1056167, -0.5557037, -3.072875, 0, 1, 0.8509804, 1,
-0.1054374, 1.41317, 0.4958341, 0, 1, 0.854902, 1,
-0.1044888, -1.114371, -0.6630642, 0, 1, 0.8627451, 1,
-0.1036975, 1.280495, 0.02553339, 0, 1, 0.8666667, 1,
-0.1034645, 0.5137424, 0.1587901, 0, 1, 0.8745098, 1,
-0.1013143, 1.515765, -0.1843462, 0, 1, 0.8784314, 1,
-0.09856257, 0.9950579, -0.1416823, 0, 1, 0.8862745, 1,
-0.09814906, -0.01555424, -2.610465, 0, 1, 0.8901961, 1,
-0.09750208, 0.8693283, 0.2953849, 0, 1, 0.8980392, 1,
-0.09625709, -0.3148942, -3.955177, 0, 1, 0.9058824, 1,
-0.08470555, -0.4214883, -3.007408, 0, 1, 0.9098039, 1,
-0.08281603, 0.8595284, -0.6267595, 0, 1, 0.9176471, 1,
-0.07963709, -0.4423297, -2.80955, 0, 1, 0.9215686, 1,
-0.07663156, -1.453398, -3.277528, 0, 1, 0.9294118, 1,
-0.07450392, -0.4085719, -1.710271, 0, 1, 0.9333333, 1,
-0.07448576, 0.2042835, 0.3049361, 0, 1, 0.9411765, 1,
-0.06708407, -1.442181, -3.24691, 0, 1, 0.945098, 1,
-0.05358679, -0.1015392, -1.37013, 0, 1, 0.9529412, 1,
-0.05313132, -0.4238124, -1.755435, 0, 1, 0.9568627, 1,
-0.04846396, 1.219204, -0.6025749, 0, 1, 0.9647059, 1,
-0.04787936, 0.06886424, -0.4650093, 0, 1, 0.9686275, 1,
-0.0467365, -0.3475854, -2.19678, 0, 1, 0.9764706, 1,
-0.04559145, -0.7186669, -3.097711, 0, 1, 0.9803922, 1,
-0.04250878, 0.2792598, -1.155428, 0, 1, 0.9882353, 1,
-0.03283202, 1.287694, 0.7091657, 0, 1, 0.9921569, 1,
-0.02881826, 0.3143517, -0.02063612, 0, 1, 1, 1,
-0.02546188, 1.208688, 0.358587, 0, 0.9921569, 1, 1,
-0.02320136, 0.6677931, -0.1704067, 0, 0.9882353, 1, 1,
-0.01891333, 1.097165, -1.411116, 0, 0.9803922, 1, 1,
-0.01761546, -0.234379, -3.506951, 0, 0.9764706, 1, 1,
-0.01759461, 0.3042777, 0.7136605, 0, 0.9686275, 1, 1,
-0.01744441, -1.668297, -2.838289, 0, 0.9647059, 1, 1,
-0.01495944, 0.4963111, -0.504106, 0, 0.9568627, 1, 1,
-0.01271798, 1.238563, 0.6444974, 0, 0.9529412, 1, 1,
-0.01046693, 0.7604691, 0.9389005, 0, 0.945098, 1, 1,
-0.004603237, -0.8469613, -3.382221, 0, 0.9411765, 1, 1,
-0.001803801, -0.8374514, -1.784277, 0, 0.9333333, 1, 1,
-0.001782064, -0.2694735, -3.718049, 0, 0.9294118, 1, 1,
0.001925066, 0.7234415, 0.2423044, 0, 0.9215686, 1, 1,
0.004062972, 0.2765194, -0.8192972, 0, 0.9176471, 1, 1,
0.004629815, -0.3261772, 1.335277, 0, 0.9098039, 1, 1,
0.006624185, 0.1646713, -0.08316705, 0, 0.9058824, 1, 1,
0.007351382, 1.768281, 0.6199125, 0, 0.8980392, 1, 1,
0.01320401, -0.5528579, 3.90195, 0, 0.8901961, 1, 1,
0.01996079, -2.556273, 2.114203, 0, 0.8862745, 1, 1,
0.02191158, -0.4421481, 3.048332, 0, 0.8784314, 1, 1,
0.02368117, 0.6141633, -1.082826, 0, 0.8745098, 1, 1,
0.02447904, -0.2154797, 2.349351, 0, 0.8666667, 1, 1,
0.02489213, 1.768953, 0.8289964, 0, 0.8627451, 1, 1,
0.02855776, -0.3785209, 1.143102, 0, 0.854902, 1, 1,
0.03201388, -0.3721537, 3.819797, 0, 0.8509804, 1, 1,
0.04027896, -1.115096, 3.680592, 0, 0.8431373, 1, 1,
0.04980838, 0.03536374, 0.6488394, 0, 0.8392157, 1, 1,
0.0541396, -0.2986835, 2.786715, 0, 0.8313726, 1, 1,
0.05536562, -0.2498615, 3.252237, 0, 0.827451, 1, 1,
0.05554482, 1.375104, 0.469105, 0, 0.8196079, 1, 1,
0.05822563, 0.1234509, -0.30624, 0, 0.8156863, 1, 1,
0.0589871, 1.328681, 2.072454, 0, 0.8078431, 1, 1,
0.06711856, -0.5743636, 3.211015, 0, 0.8039216, 1, 1,
0.07415283, -0.3311745, 2.830808, 0, 0.7960784, 1, 1,
0.07487475, 0.001171267, 2.651093, 0, 0.7882353, 1, 1,
0.07501883, -1.18746, 2.49718, 0, 0.7843137, 1, 1,
0.07932965, 1.446747, 1.242967, 0, 0.7764706, 1, 1,
0.08035909, -0.3443449, 3.438452, 0, 0.772549, 1, 1,
0.08071786, 0.0569664, 1.255572, 0, 0.7647059, 1, 1,
0.08206831, 0.04221611, 1.533165, 0, 0.7607843, 1, 1,
0.08580031, 0.4834089, 0.4158438, 0, 0.7529412, 1, 1,
0.08846942, 1.724221, 2.514172, 0, 0.7490196, 1, 1,
0.08930636, -0.3563048, 1.819573, 0, 0.7411765, 1, 1,
0.08985884, -1.17865, 2.889471, 0, 0.7372549, 1, 1,
0.09214067, -0.09306277, 2.485072, 0, 0.7294118, 1, 1,
0.09534451, 1.505957, -0.3010547, 0, 0.7254902, 1, 1,
0.09892676, -0.7594773, 2.340164, 0, 0.7176471, 1, 1,
0.100868, 0.06122043, 1.006865, 0, 0.7137255, 1, 1,
0.1020511, -0.706163, 3.013758, 0, 0.7058824, 1, 1,
0.1097374, 0.7448803, 0.2602873, 0, 0.6980392, 1, 1,
0.1148326, -1.288715, 2.893546, 0, 0.6941177, 1, 1,
0.1251648, -0.2750561, 3.334361, 0, 0.6862745, 1, 1,
0.1276512, -1.258574, 3.435865, 0, 0.682353, 1, 1,
0.128722, 0.1787452, 0.9319186, 0, 0.6745098, 1, 1,
0.1298302, -0.7724182, 2.829736, 0, 0.6705883, 1, 1,
0.1307967, 0.3124534, 1.583209, 0, 0.6627451, 1, 1,
0.1320424, 0.5937125, -1.444093, 0, 0.6588235, 1, 1,
0.1327851, 0.1373897, 0.04542958, 0, 0.6509804, 1, 1,
0.1353267, 1.223767, -1.362671, 0, 0.6470588, 1, 1,
0.1368111, -0.7047755, 4.073637, 0, 0.6392157, 1, 1,
0.1421363, -0.6543021, 2.527701, 0, 0.6352941, 1, 1,
0.1424137, 1.460111, -0.2501753, 0, 0.627451, 1, 1,
0.1430475, 0.9061091, -0.6681163, 0, 0.6235294, 1, 1,
0.1445205, 1.163366, 0.3109166, 0, 0.6156863, 1, 1,
0.1483972, -1.759478, 3.132472, 0, 0.6117647, 1, 1,
0.1523634, -1.97748, 3.126472, 0, 0.6039216, 1, 1,
0.1530498, 3.100583, 1.017034, 0, 0.5960785, 1, 1,
0.1543185, -1.536873, 3.674175, 0, 0.5921569, 1, 1,
0.1572523, 0.3125148, 0.382557, 0, 0.5843138, 1, 1,
0.1598693, 0.2151341, 0.8599413, 0, 0.5803922, 1, 1,
0.1630157, 1.480757, -0.552674, 0, 0.572549, 1, 1,
0.163714, -0.7224504, 4.108088, 0, 0.5686275, 1, 1,
0.1680513, -0.2849587, 1.449053, 0, 0.5607843, 1, 1,
0.1770098, 1.382086, 0.8948572, 0, 0.5568628, 1, 1,
0.1774499, 0.7181981, -2.515259, 0, 0.5490196, 1, 1,
0.1785162, 0.0962465, 0.6771784, 0, 0.5450981, 1, 1,
0.1830241, -0.852975, 4.299774, 0, 0.5372549, 1, 1,
0.1830477, -0.4202231, 0.6532221, 0, 0.5333334, 1, 1,
0.1857131, 0.1787505, 1.734423, 0, 0.5254902, 1, 1,
0.186392, -0.09090971, 0.508728, 0, 0.5215687, 1, 1,
0.1875836, 0.3150754, 0.1316686, 0, 0.5137255, 1, 1,
0.1900999, 0.7746879, -0.7159927, 0, 0.509804, 1, 1,
0.1922329, -1.153474, 3.634992, 0, 0.5019608, 1, 1,
0.1998669, -0.1194145, 2.574461, 0, 0.4941176, 1, 1,
0.2044596, 1.531975, 0.5328991, 0, 0.4901961, 1, 1,
0.2069248, 1.389557, 0.4947404, 0, 0.4823529, 1, 1,
0.2078786, -0.2294318, 4.46716, 0, 0.4784314, 1, 1,
0.215946, 0.5438243, 0.4313784, 0, 0.4705882, 1, 1,
0.2260388, 0.521585, 0.9983337, 0, 0.4666667, 1, 1,
0.2293493, 1.182096, 0.1822461, 0, 0.4588235, 1, 1,
0.229495, 0.449708, -0.03022286, 0, 0.454902, 1, 1,
0.2300158, -0.311771, 1.678748, 0, 0.4470588, 1, 1,
0.2374596, -0.5412264, 1.996883, 0, 0.4431373, 1, 1,
0.2383794, -0.06087377, 3.220008, 0, 0.4352941, 1, 1,
0.2397336, 1.244665, 1.83524, 0, 0.4313726, 1, 1,
0.2476023, -1.247228, 2.774082, 0, 0.4235294, 1, 1,
0.2478615, 0.5584158, 0.04839395, 0, 0.4196078, 1, 1,
0.2479882, 0.3416119, 0.6880741, 0, 0.4117647, 1, 1,
0.2489944, 0.9598134, 0.9955907, 0, 0.4078431, 1, 1,
0.2506553, 1.221869, 2.136153, 0, 0.4, 1, 1,
0.2511657, -0.1045151, 4.405457, 0, 0.3921569, 1, 1,
0.2525317, -0.2243248, 3.102629, 0, 0.3882353, 1, 1,
0.2525701, -1.922265, 3.320677, 0, 0.3803922, 1, 1,
0.258682, -0.04980681, 0.3161151, 0, 0.3764706, 1, 1,
0.2605524, 0.8519254, 0.8109968, 0, 0.3686275, 1, 1,
0.2616592, 1.143605, 0.3349345, 0, 0.3647059, 1, 1,
0.2624079, 0.2245316, -0.4143141, 0, 0.3568628, 1, 1,
0.2661208, 0.1205638, 0.5209677, 0, 0.3529412, 1, 1,
0.2671123, 1.042421, 1.582009, 0, 0.345098, 1, 1,
0.2677827, -0.4714864, 2.955936, 0, 0.3411765, 1, 1,
0.2708867, 1.268786, 0.1531048, 0, 0.3333333, 1, 1,
0.2730401, -1.480093, 3.405229, 0, 0.3294118, 1, 1,
0.2748053, 1.362626, 0.6818735, 0, 0.3215686, 1, 1,
0.2773801, -0.6852146, 1.903795, 0, 0.3176471, 1, 1,
0.2807236, -0.196678, 1.480232, 0, 0.3098039, 1, 1,
0.2858044, 0.4177155, 1.09088, 0, 0.3058824, 1, 1,
0.2864545, -1.178517, 3.06705, 0, 0.2980392, 1, 1,
0.288861, 0.8199977, 0.08981024, 0, 0.2901961, 1, 1,
0.2927134, 0.8471368, -0.4215062, 0, 0.2862745, 1, 1,
0.2985999, 1.551849, -0.5756789, 0, 0.2784314, 1, 1,
0.3199982, 1.122716, -1.313595, 0, 0.2745098, 1, 1,
0.3206247, -0.0799709, -0.2031318, 0, 0.2666667, 1, 1,
0.3207507, -0.2668419, 1.643053, 0, 0.2627451, 1, 1,
0.329178, 0.5587492, 0.04250548, 0, 0.254902, 1, 1,
0.3301754, -1.054469, 2.292807, 0, 0.2509804, 1, 1,
0.3306354, 1.523595, 1.720895, 0, 0.2431373, 1, 1,
0.3324092, -0.2537349, 0.8458396, 0, 0.2392157, 1, 1,
0.3334649, 2.260272, -0.9280221, 0, 0.2313726, 1, 1,
0.3340499, 0.0188459, 1.331719, 0, 0.227451, 1, 1,
0.3469071, 1.489372, 1.290071, 0, 0.2196078, 1, 1,
0.3496128, 0.4076148, 0.5064176, 0, 0.2156863, 1, 1,
0.3513435, 0.7545262, -0.143941, 0, 0.2078431, 1, 1,
0.3518982, -0.1102361, 0.4665137, 0, 0.2039216, 1, 1,
0.3531996, 0.04135593, 2.070147, 0, 0.1960784, 1, 1,
0.3536325, -1.823676, 2.274563, 0, 0.1882353, 1, 1,
0.355106, -0.8510263, 2.88997, 0, 0.1843137, 1, 1,
0.3562068, 0.2935167, 1.497355, 0, 0.1764706, 1, 1,
0.3582132, -0.3361064, 1.664144, 0, 0.172549, 1, 1,
0.3588833, 1.470135, 2.786419, 0, 0.1647059, 1, 1,
0.3597928, -0.2193598, 1.646503, 0, 0.1607843, 1, 1,
0.3616756, 0.581131, -0.5501328, 0, 0.1529412, 1, 1,
0.3625536, 1.396308, 0.678591, 0, 0.1490196, 1, 1,
0.3637571, 0.1498452, 0.6347408, 0, 0.1411765, 1, 1,
0.3685107, 0.2619187, 0.7054481, 0, 0.1372549, 1, 1,
0.3698758, -0.4181765, 3.533924, 0, 0.1294118, 1, 1,
0.3708524, 0.3278196, 1.185918, 0, 0.1254902, 1, 1,
0.3714755, 0.03057803, 1.52156, 0, 0.1176471, 1, 1,
0.3717188, -0.3473024, 0.07865738, 0, 0.1137255, 1, 1,
0.3753313, 0.5989366, 1.617037, 0, 0.1058824, 1, 1,
0.3782989, -1.209098, 1.867975, 0, 0.09803922, 1, 1,
0.3849225, -1.21345, 2.241549, 0, 0.09411765, 1, 1,
0.3850564, -0.5391479, 2.663676, 0, 0.08627451, 1, 1,
0.3854496, -0.5701936, 1.809446, 0, 0.08235294, 1, 1,
0.3861053, 0.2508898, 0.9232497, 0, 0.07450981, 1, 1,
0.38735, 1.425704, 0.1574232, 0, 0.07058824, 1, 1,
0.3884059, -0.8961243, 2.881335, 0, 0.0627451, 1, 1,
0.393582, -1.911466, 2.631901, 0, 0.05882353, 1, 1,
0.3983131, -0.9130441, 4.351176, 0, 0.05098039, 1, 1,
0.4061968, 0.3165744, 3.170374, 0, 0.04705882, 1, 1,
0.4082367, 1.592842, -0.09148485, 0, 0.03921569, 1, 1,
0.4155067, -1.156692, 2.080979, 0, 0.03529412, 1, 1,
0.4227727, -1.935579, 2.601385, 0, 0.02745098, 1, 1,
0.4244887, -0.6338117, 2.407215, 0, 0.02352941, 1, 1,
0.425456, 0.1040328, 0.6975813, 0, 0.01568628, 1, 1,
0.4260161, -0.6864414, 3.40117, 0, 0.01176471, 1, 1,
0.4264396, 0.1361222, 1.024682, 0, 0.003921569, 1, 1,
0.4275717, -1.74288, 1.594782, 0.003921569, 0, 1, 1,
0.4309454, 1.560758, -0.7019039, 0.007843138, 0, 1, 1,
0.4364416, 0.9480585, 0.7033354, 0.01568628, 0, 1, 1,
0.4373553, -0.1479853, 0.03554115, 0.01960784, 0, 1, 1,
0.4391066, 1.204551, 1.535573, 0.02745098, 0, 1, 1,
0.4445826, 0.4283062, 1.03996, 0.03137255, 0, 1, 1,
0.4459531, 0.9390666, 1.539039, 0.03921569, 0, 1, 1,
0.4469638, 0.2308123, 1.190976, 0.04313726, 0, 1, 1,
0.449871, -1.819337, 2.049922, 0.05098039, 0, 1, 1,
0.4512308, 1.557337, -0.4674957, 0.05490196, 0, 1, 1,
0.4581659, -0.200694, 2.34696, 0.0627451, 0, 1, 1,
0.461475, -0.7411716, 3.837942, 0.06666667, 0, 1, 1,
0.4615781, 0.5174665, 0.3477085, 0.07450981, 0, 1, 1,
0.4620937, 0.2869751, 2.158843, 0.07843138, 0, 1, 1,
0.4636877, -1.109306, 2.812353, 0.08627451, 0, 1, 1,
0.4672727, -0.335967, 1.567016, 0.09019608, 0, 1, 1,
0.4693553, 0.5580842, 1.740417, 0.09803922, 0, 1, 1,
0.4727115, 0.5524654, -0.9856407, 0.1058824, 0, 1, 1,
0.4752436, -0.9153637, 3.006244, 0.1098039, 0, 1, 1,
0.4822617, 0.4822792, -0.1313088, 0.1176471, 0, 1, 1,
0.4848035, -0.4797389, 2.694337, 0.1215686, 0, 1, 1,
0.488256, -0.8715079, 3.041017, 0.1294118, 0, 1, 1,
0.4910563, 0.8067262, -2.19122, 0.1333333, 0, 1, 1,
0.4944319, 1.375607, 2.275877, 0.1411765, 0, 1, 1,
0.5002806, -1.362272, 2.014771, 0.145098, 0, 1, 1,
0.5005181, 0.09525003, 1.587201, 0.1529412, 0, 1, 1,
0.5009392, -0.3713794, 1.701692, 0.1568628, 0, 1, 1,
0.5069223, -0.476511, 0.3185948, 0.1647059, 0, 1, 1,
0.509077, 0.4409892, -0.9512408, 0.1686275, 0, 1, 1,
0.509824, 0.6502742, 0.7102602, 0.1764706, 0, 1, 1,
0.5105397, 0.9265577, 0.3524605, 0.1803922, 0, 1, 1,
0.5118962, 0.001180223, 2.625893, 0.1882353, 0, 1, 1,
0.5126021, -0.8452881, 1.808989, 0.1921569, 0, 1, 1,
0.5173359, -0.2075449, 3.481213, 0.2, 0, 1, 1,
0.5184915, 0.3749475, 0.8841205, 0.2078431, 0, 1, 1,
0.5186518, 0.3709819, 1.10913, 0.2117647, 0, 1, 1,
0.5287995, 0.08526485, 2.071469, 0.2196078, 0, 1, 1,
0.5311838, -0.6675352, 4.030549, 0.2235294, 0, 1, 1,
0.5337059, -1.090055, 2.812322, 0.2313726, 0, 1, 1,
0.5355433, -0.2390632, 2.738764, 0.2352941, 0, 1, 1,
0.5361394, -0.292843, 3.481408, 0.2431373, 0, 1, 1,
0.5398784, 0.6382493, 0.798371, 0.2470588, 0, 1, 1,
0.5435004, -0.663004, 2.364863, 0.254902, 0, 1, 1,
0.5440507, 0.5030971, 0.7974072, 0.2588235, 0, 1, 1,
0.5467535, -0.6275545, 2.951226, 0.2666667, 0, 1, 1,
0.5564209, -1.478159, 3.245399, 0.2705882, 0, 1, 1,
0.5634342, -0.3205697, 1.68357, 0.2784314, 0, 1, 1,
0.5647509, -0.3569688, 2.802083, 0.282353, 0, 1, 1,
0.5653492, -0.4661263, 3.049324, 0.2901961, 0, 1, 1,
0.5685716, 1.840076, -0.21664, 0.2941177, 0, 1, 1,
0.5694515, 0.7259536, 0.9316427, 0.3019608, 0, 1, 1,
0.5726317, 0.4803723, 1.347572, 0.3098039, 0, 1, 1,
0.5737681, -0.3620564, 2.824194, 0.3137255, 0, 1, 1,
0.5751325, 0.3326984, 0.8868668, 0.3215686, 0, 1, 1,
0.5783883, -0.906381, 1.425792, 0.3254902, 0, 1, 1,
0.5805545, 0.6823769, 2.262839, 0.3333333, 0, 1, 1,
0.5835657, -1.449435, 4.855421, 0.3372549, 0, 1, 1,
0.5852092, 1.016772, -0.005146041, 0.345098, 0, 1, 1,
0.5856693, 1.057167, 0.5998981, 0.3490196, 0, 1, 1,
0.586028, 1.395065, 0.8379938, 0.3568628, 0, 1, 1,
0.5865033, 1.237017, 1.853497, 0.3607843, 0, 1, 1,
0.5896608, 0.8361588, 0.8618144, 0.3686275, 0, 1, 1,
0.5937117, 0.06293575, 0.8763373, 0.372549, 0, 1, 1,
0.5963549, 1.454558, -0.3443113, 0.3803922, 0, 1, 1,
0.5974032, -0.2375591, 1.652938, 0.3843137, 0, 1, 1,
0.5977711, -1.30709, 3.088191, 0.3921569, 0, 1, 1,
0.5993727, 0.1115588, 1.667714, 0.3960784, 0, 1, 1,
0.5997081, 0.244763, 1.221635, 0.4039216, 0, 1, 1,
0.6006547, -1.074315, 2.570182, 0.4117647, 0, 1, 1,
0.6062141, -0.01389115, 2.282367, 0.4156863, 0, 1, 1,
0.6067146, -0.4429963, 1.468313, 0.4235294, 0, 1, 1,
0.608348, -0.3969238, 0.8384444, 0.427451, 0, 1, 1,
0.610878, -0.2932312, 3.708512, 0.4352941, 0, 1, 1,
0.6116887, 0.5172246, 0.3702568, 0.4392157, 0, 1, 1,
0.612211, -0.08875483, 1.607837, 0.4470588, 0, 1, 1,
0.6130186, 1.39867, -0.1857169, 0.4509804, 0, 1, 1,
0.6174437, 0.2496828, 0.8118632, 0.4588235, 0, 1, 1,
0.6176687, -0.02386415, 0.9187565, 0.4627451, 0, 1, 1,
0.618841, -0.7467, 3.420473, 0.4705882, 0, 1, 1,
0.6212073, 1.045227, 1.22794, 0.4745098, 0, 1, 1,
0.6289155, -0.9940524, 2.629064, 0.4823529, 0, 1, 1,
0.6311069, 1.084664, 0.8831453, 0.4862745, 0, 1, 1,
0.6403928, 0.005865429, 1.790991, 0.4941176, 0, 1, 1,
0.6438159, -1.38809, 2.544919, 0.5019608, 0, 1, 1,
0.6443567, 0.2136816, 1.390576, 0.5058824, 0, 1, 1,
0.6449253, 0.4393696, 1.253013, 0.5137255, 0, 1, 1,
0.6476424, 0.7580024, 1.279758, 0.5176471, 0, 1, 1,
0.6527213, -0.4840061, 0.4532156, 0.5254902, 0, 1, 1,
0.6533085, 0.4278606, 0.1865616, 0.5294118, 0, 1, 1,
0.6568205, 0.8665376, 1.429205, 0.5372549, 0, 1, 1,
0.662029, -0.08671799, 4.133505, 0.5411765, 0, 1, 1,
0.6708463, -0.7401409, 0.8295392, 0.5490196, 0, 1, 1,
0.6713985, -0.6517523, 2.56157, 0.5529412, 0, 1, 1,
0.6725589, 0.1436956, 2.000103, 0.5607843, 0, 1, 1,
0.6822672, 1.148546, 1.040091, 0.5647059, 0, 1, 1,
0.6871072, 0.6057829, -1.135644, 0.572549, 0, 1, 1,
0.6874437, 0.6901416, 0.9324881, 0.5764706, 0, 1, 1,
0.6897849, 0.1447266, 2.146185, 0.5843138, 0, 1, 1,
0.6911589, -0.998407, 3.821108, 0.5882353, 0, 1, 1,
0.6946443, 0.6665296, 1.486443, 0.5960785, 0, 1, 1,
0.6995916, 1.464748, -1.960858, 0.6039216, 0, 1, 1,
0.7057732, 0.6182624, 0.6937961, 0.6078432, 0, 1, 1,
0.7075765, -0.5224723, 1.906226, 0.6156863, 0, 1, 1,
0.7085209, 0.4809965, 0.02068789, 0.6196079, 0, 1, 1,
0.7160847, -0.4855194, 2.989143, 0.627451, 0, 1, 1,
0.7187083, 0.3716327, 0.3548681, 0.6313726, 0, 1, 1,
0.7224002, 2.885977, -0.1275168, 0.6392157, 0, 1, 1,
0.7299215, 1.492873, 0.6496058, 0.6431373, 0, 1, 1,
0.7409366, -1.219777, 0.3204445, 0.6509804, 0, 1, 1,
0.7444289, 0.1185648, 0.6214544, 0.654902, 0, 1, 1,
0.7454631, 1.159315, -0.3909157, 0.6627451, 0, 1, 1,
0.7464648, 0.764851, -0.4465505, 0.6666667, 0, 1, 1,
0.7482319, -0.5597698, 3.74329, 0.6745098, 0, 1, 1,
0.7498539, 0.8945133, 0.6350841, 0.6784314, 0, 1, 1,
0.7507903, -0.6059673, 2.288295, 0.6862745, 0, 1, 1,
0.7515569, 2.189469, 1.349041, 0.6901961, 0, 1, 1,
0.7516161, -0.8263074, 2.278744, 0.6980392, 0, 1, 1,
0.7538764, -0.2760201, 0.6297553, 0.7058824, 0, 1, 1,
0.7564541, 1.059204, -0.2213259, 0.7098039, 0, 1, 1,
0.7569093, -0.3571898, 1.47237, 0.7176471, 0, 1, 1,
0.7584304, 1.411952, 0.4278919, 0.7215686, 0, 1, 1,
0.7678984, 1.610223, 0.1959856, 0.7294118, 0, 1, 1,
0.7706358, 0.3425954, 1.014177, 0.7333333, 0, 1, 1,
0.7713596, -0.7426488, 3.236364, 0.7411765, 0, 1, 1,
0.7750553, 0.09817591, 1.598258, 0.7450981, 0, 1, 1,
0.7754906, 1.076244, 1.426661, 0.7529412, 0, 1, 1,
0.7768923, 0.04780738, 3.089052, 0.7568628, 0, 1, 1,
0.7789552, -1.378103, 3.690588, 0.7647059, 0, 1, 1,
0.7799678, 0.1395974, 0.09532108, 0.7686275, 0, 1, 1,
0.7837644, 0.1953253, 3.722158, 0.7764706, 0, 1, 1,
0.7846619, 0.2277834, 0.9274666, 0.7803922, 0, 1, 1,
0.7891683, 0.2086894, 0.0373371, 0.7882353, 0, 1, 1,
0.789471, 0.7799431, 1.496753, 0.7921569, 0, 1, 1,
0.7920672, 0.1180854, 1.141567, 0.8, 0, 1, 1,
0.7974487, 0.06857308, 1.461191, 0.8078431, 0, 1, 1,
0.7995178, -0.6996875, 4.448951, 0.8117647, 0, 1, 1,
0.8012078, -2.053711, 2.173026, 0.8196079, 0, 1, 1,
0.8034517, -2.411374, 2.359251, 0.8235294, 0, 1, 1,
0.8098862, 0.9996029, 0.7449017, 0.8313726, 0, 1, 1,
0.8106747, -0.7020123, 2.493088, 0.8352941, 0, 1, 1,
0.8117645, 0.9935744, 2.054914, 0.8431373, 0, 1, 1,
0.8128254, -0.3762198, 1.348679, 0.8470588, 0, 1, 1,
0.8159045, 0.3268827, 2.439883, 0.854902, 0, 1, 1,
0.816942, -0.9404856, 4.43727, 0.8588235, 0, 1, 1,
0.8297675, -0.2846088, 2.031749, 0.8666667, 0, 1, 1,
0.8305616, -0.8991798, 3.717956, 0.8705882, 0, 1, 1,
0.8309405, 1.573097, 1.686295, 0.8784314, 0, 1, 1,
0.8490954, 0.1006426, -1.191189, 0.8823529, 0, 1, 1,
0.8494995, 0.6920423, 0.3891839, 0.8901961, 0, 1, 1,
0.8542265, 0.918358, 0.7096511, 0.8941177, 0, 1, 1,
0.8548757, -0.2762702, 3.856231, 0.9019608, 0, 1, 1,
0.8592185, -0.3805618, 3.275627, 0.9098039, 0, 1, 1,
0.8618651, 1.859265, -1.204772, 0.9137255, 0, 1, 1,
0.8635884, 2.099252, 0.2267692, 0.9215686, 0, 1, 1,
0.8657085, 0.3638419, 1.867371, 0.9254902, 0, 1, 1,
0.8894903, 1.011501, 1.9985, 0.9333333, 0, 1, 1,
0.8917429, 1.741593, 0.8529949, 0.9372549, 0, 1, 1,
0.8949778, -0.589835, 3.494334, 0.945098, 0, 1, 1,
0.8973945, -0.6583984, 1.70355, 0.9490196, 0, 1, 1,
0.8995988, -0.9494098, 2.99105, 0.9568627, 0, 1, 1,
0.9022626, 0.2432304, 1.992719, 0.9607843, 0, 1, 1,
0.9025678, 0.4827973, 2.574995, 0.9686275, 0, 1, 1,
0.9084294, -0.05426506, 1.89612, 0.972549, 0, 1, 1,
0.9087046, 0.432234, 0.9512, 0.9803922, 0, 1, 1,
0.9126729, -0.4228221, 2.428717, 0.9843137, 0, 1, 1,
0.9135439, -1.33081, 2.023712, 0.9921569, 0, 1, 1,
0.9164384, -0.5680933, 1.586102, 0.9960784, 0, 1, 1,
0.9278788, -0.07975156, 0.5829334, 1, 0, 0.9960784, 1,
0.9289823, -0.2655529, 1.932338, 1, 0, 0.9882353, 1,
0.9337706, -1.049848, 2.360589, 1, 0, 0.9843137, 1,
0.9363286, -1.454441, 3.140508, 1, 0, 0.9764706, 1,
0.9429371, -2.19018, 2.523844, 1, 0, 0.972549, 1,
0.9439487, -0.154884, 3.700154, 1, 0, 0.9647059, 1,
0.9444687, 0.1866916, 0.8117317, 1, 0, 0.9607843, 1,
0.9460623, 0.4182536, 1.948927, 1, 0, 0.9529412, 1,
0.9490231, -1.342474, 1.942569, 1, 0, 0.9490196, 1,
0.9576495, 0.2983268, 0.0697016, 1, 0, 0.9411765, 1,
0.9617479, -1.808116, 0.5455084, 1, 0, 0.9372549, 1,
0.9678112, 0.2278378, 0.4501642, 1, 0, 0.9294118, 1,
0.9691933, 1.093406, 0.5236865, 1, 0, 0.9254902, 1,
0.9798813, -1.58461, 2.322483, 1, 0, 0.9176471, 1,
0.9842249, -0.4204985, -0.4287318, 1, 0, 0.9137255, 1,
0.9849561, -0.7278541, 3.01149, 1, 0, 0.9058824, 1,
0.9863808, -1.728521, 3.539955, 1, 0, 0.9019608, 1,
0.9882665, 0.2405277, 2.126243, 1, 0, 0.8941177, 1,
0.9912209, -0.7794083, 2.451748, 1, 0, 0.8862745, 1,
0.9915385, -1.422183, 3.296175, 1, 0, 0.8823529, 1,
0.9932343, 0.1621977, 1.927259, 1, 0, 0.8745098, 1,
0.9988544, 0.8642092, 0.3767946, 1, 0, 0.8705882, 1,
1.005463, 0.1684754, 2.010103, 1, 0, 0.8627451, 1,
1.007207, 0.4926268, 0.7512215, 1, 0, 0.8588235, 1,
1.008546, -0.7965709, 1.987925, 1, 0, 0.8509804, 1,
1.019587, 0.3545144, 1.866316, 1, 0, 0.8470588, 1,
1.021519, -0.06794748, 1.934645, 1, 0, 0.8392157, 1,
1.022415, 0.660229, 0.1414403, 1, 0, 0.8352941, 1,
1.036015, 0.2663966, 0.2120097, 1, 0, 0.827451, 1,
1.044394, 0.6734391, 1.079848, 1, 0, 0.8235294, 1,
1.058648, 1.674913, 0.9853671, 1, 0, 0.8156863, 1,
1.061555, -0.4898365, 2.251899, 1, 0, 0.8117647, 1,
1.065395, -0.4657407, 1.983498, 1, 0, 0.8039216, 1,
1.071868, -0.0271895, 1.389786, 1, 0, 0.7960784, 1,
1.077391, 0.5484598, 1.1731, 1, 0, 0.7921569, 1,
1.078157, 0.163577, 2.003827, 1, 0, 0.7843137, 1,
1.083263, 1.734046, 1.239885, 1, 0, 0.7803922, 1,
1.084451, -0.3448233, 1.587145, 1, 0, 0.772549, 1,
1.092084, 0.4059794, 0.4982611, 1, 0, 0.7686275, 1,
1.093709, 0.2272455, 2.005606, 1, 0, 0.7607843, 1,
1.10973, -0.6530497, 2.617051, 1, 0, 0.7568628, 1,
1.110054, -0.3197981, 1.578734, 1, 0, 0.7490196, 1,
1.111717, -1.121264, 1.968395, 1, 0, 0.7450981, 1,
1.129432, -1.109861, 4.55853, 1, 0, 0.7372549, 1,
1.141896, 0.04334877, 1.453503, 1, 0, 0.7333333, 1,
1.149591, 0.9742707, 0.9878769, 1, 0, 0.7254902, 1,
1.150562, -1.531708, 1.537329, 1, 0, 0.7215686, 1,
1.154824, 0.7834995, -0.5730277, 1, 0, 0.7137255, 1,
1.170725, 0.2345766, 2.141153, 1, 0, 0.7098039, 1,
1.171883, 0.9873999, 0.5225958, 1, 0, 0.7019608, 1,
1.188324, 0.3121142, 0.9890618, 1, 0, 0.6941177, 1,
1.190341, -1.595587, 1.397891, 1, 0, 0.6901961, 1,
1.192644, -1.107756, 1.89099, 1, 0, 0.682353, 1,
1.199261, 1.019302, 1.633907, 1, 0, 0.6784314, 1,
1.201619, 0.7031412, 0.2480274, 1, 0, 0.6705883, 1,
1.202178, -0.5686541, 3.870457, 1, 0, 0.6666667, 1,
1.20526, -0.3642008, 1.607139, 1, 0, 0.6588235, 1,
1.206235, -1.274365, 2.384465, 1, 0, 0.654902, 1,
1.21082, -0.168004, -0.5374572, 1, 0, 0.6470588, 1,
1.212276, -0.5805783, 4.159193, 1, 0, 0.6431373, 1,
1.222614, -2.431073, 1.276127, 1, 0, 0.6352941, 1,
1.2228, -0.7960119, 3.434589, 1, 0, 0.6313726, 1,
1.229884, -0.4244769, 1.122007, 1, 0, 0.6235294, 1,
1.23911, 0.7782928, 0.3192627, 1, 0, 0.6196079, 1,
1.241089, 0.06584381, 1.56286, 1, 0, 0.6117647, 1,
1.242896, -0.06727967, -0.1702406, 1, 0, 0.6078432, 1,
1.265667, -1.425718, 2.617167, 1, 0, 0.6, 1,
1.276777, 0.09971374, 2.426511, 1, 0, 0.5921569, 1,
1.280053, 0.3886907, -1.387001, 1, 0, 0.5882353, 1,
1.283003, -0.08587804, 3.018459, 1, 0, 0.5803922, 1,
1.288502, 0.8419234, 1.040904, 1, 0, 0.5764706, 1,
1.293491, -0.1614282, 2.660134, 1, 0, 0.5686275, 1,
1.298346, 0.494354, 0.4726671, 1, 0, 0.5647059, 1,
1.304527, -0.5157537, 2.03725, 1, 0, 0.5568628, 1,
1.305849, 0.7838531, 0.659127, 1, 0, 0.5529412, 1,
1.314868, 0.4260081, 1.39257, 1, 0, 0.5450981, 1,
1.317054, -0.4709779, 3.100389, 1, 0, 0.5411765, 1,
1.320851, -1.107352, 3.481787, 1, 0, 0.5333334, 1,
1.323153, -1.953178, 2.577929, 1, 0, 0.5294118, 1,
1.330763, -0.877723, 1.054612, 1, 0, 0.5215687, 1,
1.331226, 0.6941018, 1.846196, 1, 0, 0.5176471, 1,
1.346086, -0.9620125, 2.034536, 1, 0, 0.509804, 1,
1.349102, 0.9590806, 1.904442, 1, 0, 0.5058824, 1,
1.360672, 0.130116, 1.323158, 1, 0, 0.4980392, 1,
1.362608, -1.408388, 2.71321, 1, 0, 0.4901961, 1,
1.362622, 0.2043525, 2.179609, 1, 0, 0.4862745, 1,
1.371994, 0.6947196, 1.111961, 1, 0, 0.4784314, 1,
1.373282, -0.3038226, 3.79747, 1, 0, 0.4745098, 1,
1.376981, 0.009005422, 1.503316, 1, 0, 0.4666667, 1,
1.390299, 0.1357733, 1.955323, 1, 0, 0.4627451, 1,
1.394401, 0.02105249, 0.06106908, 1, 0, 0.454902, 1,
1.395976, -0.3639638, 3.06814, 1, 0, 0.4509804, 1,
1.39982, -0.09538648, 1.522697, 1, 0, 0.4431373, 1,
1.420494, -0.2306175, 2.155202, 1, 0, 0.4392157, 1,
1.422739, 1.058641, 2.115505, 1, 0, 0.4313726, 1,
1.424935, -0.1372365, 1.252207, 1, 0, 0.427451, 1,
1.440578, 0.6753054, 0.4062507, 1, 0, 0.4196078, 1,
1.467371, -0.9542386, 2.493903, 1, 0, 0.4156863, 1,
1.46994, -0.1094689, 3.650753, 1, 0, 0.4078431, 1,
1.470721, -1.148143, 1.956578, 1, 0, 0.4039216, 1,
1.482996, 0.8746459, -0.5425244, 1, 0, 0.3960784, 1,
1.484453, 1.312999, 1.359926, 1, 0, 0.3882353, 1,
1.509069, -0.1741792, 1.874384, 1, 0, 0.3843137, 1,
1.515576, 1.578999, 2.050396, 1, 0, 0.3764706, 1,
1.544988, -2.245333, 3.128842, 1, 0, 0.372549, 1,
1.556059, 0.6336832, 0.8296874, 1, 0, 0.3647059, 1,
1.564211, -0.2913495, 3.082633, 1, 0, 0.3607843, 1,
1.57406, -0.1515662, 3.321607, 1, 0, 0.3529412, 1,
1.576747, -1.335158, 2.665977, 1, 0, 0.3490196, 1,
1.577717, -1.279301, 0.5491481, 1, 0, 0.3411765, 1,
1.589832, -0.8211444, 2.072293, 1, 0, 0.3372549, 1,
1.640644, 0.08749226, 0.4850398, 1, 0, 0.3294118, 1,
1.649121, -1.949243, 1.931478, 1, 0, 0.3254902, 1,
1.65736, 1.188719, 0.8349743, 1, 0, 0.3176471, 1,
1.659765, -1.148918, 1.823808, 1, 0, 0.3137255, 1,
1.661473, 0.3348167, 2.292623, 1, 0, 0.3058824, 1,
1.662791, 0.1039046, 2.888658, 1, 0, 0.2980392, 1,
1.668173, -1.153177, 2.12306, 1, 0, 0.2941177, 1,
1.674305, 1.190828, 3.601453, 1, 0, 0.2862745, 1,
1.695566, 0.5798671, 1.947813, 1, 0, 0.282353, 1,
1.710848, -0.410505, 3.991217, 1, 0, 0.2745098, 1,
1.730838, 1.204851, -1.330173, 1, 0, 0.2705882, 1,
1.747751, 0.2751627, 2.71282, 1, 0, 0.2627451, 1,
1.760715, 0.5408121, -0.729434, 1, 0, 0.2588235, 1,
1.767115, 0.1228224, 0.004869302, 1, 0, 0.2509804, 1,
1.778412, -0.02181658, 1.667575, 1, 0, 0.2470588, 1,
1.812905, -1.048061, 3.661195, 1, 0, 0.2392157, 1,
1.826173, -1.186777, 2.887261, 1, 0, 0.2352941, 1,
1.855675, -1.903762, 2.758371, 1, 0, 0.227451, 1,
1.882267, 0.09973992, 0.71448, 1, 0, 0.2235294, 1,
1.896239, -0.8918002, 0.520186, 1, 0, 0.2156863, 1,
1.906879, -1.899799, 2.427528, 1, 0, 0.2117647, 1,
1.936882, -0.5975682, 2.237496, 1, 0, 0.2039216, 1,
1.957875, -0.4932007, 1.645615, 1, 0, 0.1960784, 1,
1.979158, -0.9100069, 0.1785624, 1, 0, 0.1921569, 1,
1.986541, 0.5438042, 1.89399, 1, 0, 0.1843137, 1,
1.996723, -0.6543432, 2.591157, 1, 0, 0.1803922, 1,
2.035761, 1.250942, -0.06447281, 1, 0, 0.172549, 1,
2.036206, 0.6297354, 0.4899368, 1, 0, 0.1686275, 1,
2.037493, -0.8924079, 2.863132, 1, 0, 0.1607843, 1,
2.050888, 1.48132, 0.839756, 1, 0, 0.1568628, 1,
2.071856, 0.2211365, -0.4693049, 1, 0, 0.1490196, 1,
2.103062, 3.104983, 0.4994045, 1, 0, 0.145098, 1,
2.149478, 0.8036741, 1.096681, 1, 0, 0.1372549, 1,
2.161303, -0.4103178, 2.417616, 1, 0, 0.1333333, 1,
2.169125, 0.4532985, 1.14697, 1, 0, 0.1254902, 1,
2.172324, 0.08433552, 1.693352, 1, 0, 0.1215686, 1,
2.186109, -1.30114, 3.588449, 1, 0, 0.1137255, 1,
2.191954, -1.759088, 2.909846, 1, 0, 0.1098039, 1,
2.213753, 0.05951634, 0.04218554, 1, 0, 0.1019608, 1,
2.238898, -0.8969841, 0.8732125, 1, 0, 0.09411765, 1,
2.241161, 0.1420901, 2.127216, 1, 0, 0.09019608, 1,
2.283733, -0.223012, 0.8776339, 1, 0, 0.08235294, 1,
2.288059, 0.2453769, 1.930446, 1, 0, 0.07843138, 1,
2.299663, -2.031829, 2.413816, 1, 0, 0.07058824, 1,
2.301661, -1.422932, 2.715678, 1, 0, 0.06666667, 1,
2.305489, -0.9317635, 1.752467, 1, 0, 0.05882353, 1,
2.322898, 0.8318715, 2.210223, 1, 0, 0.05490196, 1,
2.330543, 1.656905, 0.9779657, 1, 0, 0.04705882, 1,
2.383022, 1.596705, -0.317723, 1, 0, 0.04313726, 1,
2.59852, -1.225407, 2.791787, 1, 0, 0.03529412, 1,
2.604068, 0.08819159, 0.2623714, 1, 0, 0.03137255, 1,
2.615149, 1.448852, 1.162376, 1, 0, 0.02352941, 1,
2.821254, 0.4910229, 2.732574, 1, 0, 0.01960784, 1,
3.064855, 1.526681, 0.7213778, 1, 0, 0.01176471, 1,
3.474171, -1.401266, 1.197464, 1, 0, 0.007843138, 1
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
0.2468826, -4.079597, -6.52357, 0, -0.5, 0.5, 0.5,
0.2468826, -4.079597, -6.52357, 1, -0.5, 0.5, 0.5,
0.2468826, -4.079597, -6.52357, 1, 1.5, 0.5, 0.5,
0.2468826, -4.079597, -6.52357, 0, 1.5, 0.5, 0.5
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
-4.074457, 0.560657, -6.52357, 0, -0.5, 0.5, 0.5,
-4.074457, 0.560657, -6.52357, 1, -0.5, 0.5, 0.5,
-4.074457, 0.560657, -6.52357, 1, 1.5, 0.5, 0.5,
-4.074457, 0.560657, -6.52357, 0, 1.5, 0.5, 0.5
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
-4.074457, -4.079597, -0.009474754, 0, -0.5, 0.5, 0.5,
-4.074457, -4.079597, -0.009474754, 1, -0.5, 0.5, 0.5,
-4.074457, -4.079597, -0.009474754, 1, 1.5, 0.5, 0.5,
-4.074457, -4.079597, -0.009474754, 0, 1.5, 0.5, 0.5
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
-2, -3.008769, -5.020317,
3, -3.008769, -5.020317,
-2, -3.008769, -5.020317,
-2, -3.18724, -5.270859,
-1, -3.008769, -5.020317,
-1, -3.18724, -5.270859,
0, -3.008769, -5.020317,
0, -3.18724, -5.270859,
1, -3.008769, -5.020317,
1, -3.18724, -5.270859,
2, -3.008769, -5.020317,
2, -3.18724, -5.270859,
3, -3.008769, -5.020317,
3, -3.18724, -5.270859
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
-2, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
-2, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
-2, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
-2, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5,
-1, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
-1, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
-1, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
-1, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5,
0, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
0, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
0, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
0, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5,
1, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
1, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
1, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
1, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5,
2, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
2, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
2, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
2, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5,
3, -3.544183, -5.771943, 0, -0.5, 0.5, 0.5,
3, -3.544183, -5.771943, 1, -0.5, 0.5, 0.5,
3, -3.544183, -5.771943, 1, 1.5, 0.5, 0.5,
3, -3.544183, -5.771943, 0, 1.5, 0.5, 0.5
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
-3.077225, -2, -5.020317,
-3.077225, 4, -5.020317,
-3.077225, -2, -5.020317,
-3.24343, -2, -5.270859,
-3.077225, -1, -5.020317,
-3.24343, -1, -5.270859,
-3.077225, 0, -5.020317,
-3.24343, 0, -5.270859,
-3.077225, 1, -5.020317,
-3.24343, 1, -5.270859,
-3.077225, 2, -5.020317,
-3.24343, 2, -5.270859,
-3.077225, 3, -5.020317,
-3.24343, 3, -5.270859,
-3.077225, 4, -5.020317,
-3.24343, 4, -5.270859
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
"3",
"4"
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
-3.575841, -2, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, -2, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, -2, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, -2, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, -1, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, -1, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, -1, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, -1, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, 0, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, 0, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, 0, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, 0, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, 1, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, 1, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, 1, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, 1, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, 2, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, 2, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, 2, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, 2, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, 3, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, 3, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, 3, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, 3, -5.771943, 0, 1.5, 0.5, 0.5,
-3.575841, 4, -5.771943, 0, -0.5, 0.5, 0.5,
-3.575841, 4, -5.771943, 1, -0.5, 0.5, 0.5,
-3.575841, 4, -5.771943, 1, 1.5, 0.5, 0.5,
-3.575841, 4, -5.771943, 0, 1.5, 0.5, 0.5
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
-3.077225, -3.008769, -4,
-3.077225, -3.008769, 4,
-3.077225, -3.008769, -4,
-3.24343, -3.18724, -4,
-3.077225, -3.008769, -2,
-3.24343, -3.18724, -2,
-3.077225, -3.008769, 0,
-3.24343, -3.18724, 0,
-3.077225, -3.008769, 2,
-3.24343, -3.18724, 2,
-3.077225, -3.008769, 4,
-3.24343, -3.18724, 4
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
-3.575841, -3.544183, -4, 0, -0.5, 0.5, 0.5,
-3.575841, -3.544183, -4, 1, -0.5, 0.5, 0.5,
-3.575841, -3.544183, -4, 1, 1.5, 0.5, 0.5,
-3.575841, -3.544183, -4, 0, 1.5, 0.5, 0.5,
-3.575841, -3.544183, -2, 0, -0.5, 0.5, 0.5,
-3.575841, -3.544183, -2, 1, -0.5, 0.5, 0.5,
-3.575841, -3.544183, -2, 1, 1.5, 0.5, 0.5,
-3.575841, -3.544183, -2, 0, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 0, 0, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 0, 1, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 0, 1, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 0, 0, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 2, 0, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 2, 1, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 2, 1, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 2, 0, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 4, 0, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 4, 1, -0.5, 0.5, 0.5,
-3.575841, -3.544183, 4, 1, 1.5, 0.5, 0.5,
-3.575841, -3.544183, 4, 0, 1.5, 0.5, 0.5
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
-3.077225, -3.008769, -5.020317,
-3.077225, 4.130083, -5.020317,
-3.077225, -3.008769, 5.001368,
-3.077225, 4.130083, 5.001368,
-3.077225, -3.008769, -5.020317,
-3.077225, -3.008769, 5.001368,
-3.077225, 4.130083, -5.020317,
-3.077225, 4.130083, 5.001368,
-3.077225, -3.008769, -5.020317,
3.57099, -3.008769, -5.020317,
-3.077225, -3.008769, 5.001368,
3.57099, -3.008769, 5.001368,
-3.077225, 4.130083, -5.020317,
3.57099, 4.130083, -5.020317,
-3.077225, 4.130083, 5.001368,
3.57099, 4.130083, 5.001368,
3.57099, -3.008769, -5.020317,
3.57099, 4.130083, -5.020317,
3.57099, -3.008769, 5.001368,
3.57099, 4.130083, 5.001368,
3.57099, -3.008769, -5.020317,
3.57099, -3.008769, 5.001368,
3.57099, 4.130083, -5.020317,
3.57099, 4.130083, 5.001368
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
var radius = 7.468022;
var distance = 33.22607;
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
mvMatrix.translate( -0.2468826, -0.560657, 0.009474754 );
mvMatrix.scale( 1.214547, 1.131074, 0.8057101 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.22607);
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
4-chlorophenyl_benze<-read.table("4-chlorophenyl_benze.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-chlorophenyl_benze$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl_benze' not found
```

```r
y<-4-chlorophenyl_benze$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl_benze' not found
```

```r
z<-4-chlorophenyl_benze$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl_benze' not found
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
-2.980406, -1.795542, -3.217159, 0, 0, 1, 1, 1,
-2.751123, 0.1386582, -1.552528, 1, 0, 0, 1, 1,
-2.74553, -0.9855143, -4.038953, 1, 0, 0, 1, 1,
-2.690967, 1.141657, 0.2970503, 1, 0, 0, 1, 1,
-2.581242, -0.8028069, -0.8237876, 1, 0, 0, 1, 1,
-2.570651, 1.308725, -0.4978263, 1, 0, 0, 1, 1,
-2.523505, -0.6987824, -3.192361, 0, 0, 0, 1, 1,
-2.510896, -0.05201776, -3.223354, 0, 0, 0, 1, 1,
-2.492133, 1.045886, -0.1969736, 0, 0, 0, 1, 1,
-2.431512, -0.5152734, -2.03076, 0, 0, 0, 1, 1,
-2.425252, 1.289611, 0.1325098, 0, 0, 0, 1, 1,
-2.369116, 0.3423443, -0.1616613, 0, 0, 0, 1, 1,
-2.345565, 0.8300852, -1.851881, 0, 0, 0, 1, 1,
-2.320235, 1.439266, -0.5054261, 1, 1, 1, 1, 1,
-2.266316, -0.8860576, -3.156709, 1, 1, 1, 1, 1,
-2.265291, -0.3415065, -1.39724, 1, 1, 1, 1, 1,
-2.24435, 0.8103935, -2.008281, 1, 1, 1, 1, 1,
-2.189743, -0.1752796, -1.420645, 1, 1, 1, 1, 1,
-2.168097, 0.6153978, 0.6006684, 1, 1, 1, 1, 1,
-2.156426, -1.353921, -1.266655, 1, 1, 1, 1, 1,
-2.153606, 1.403918, -2.16943, 1, 1, 1, 1, 1,
-2.138855, 0.3244815, -1.537275, 1, 1, 1, 1, 1,
-1.991893, -2.164836, -3.556237, 1, 1, 1, 1, 1,
-1.966201, 0.5512249, -1.184458, 1, 1, 1, 1, 1,
-1.958306, -0.1901929, -0.4637195, 1, 1, 1, 1, 1,
-1.919443, -0.2205829, -2.743174, 1, 1, 1, 1, 1,
-1.8981, -0.6749846, -2.957288, 1, 1, 1, 1, 1,
-1.886503, 1.248436, -1.074349, 1, 1, 1, 1, 1,
-1.88606, -0.3136947, -1.490064, 0, 0, 1, 1, 1,
-1.880246, 2.748013, 0.4362961, 1, 0, 0, 1, 1,
-1.873675, -0.4283508, 0.6249844, 1, 0, 0, 1, 1,
-1.857064, -0.1319107, -0.5689042, 1, 0, 0, 1, 1,
-1.836336, 1.342418, -1.134731, 1, 0, 0, 1, 1,
-1.807069, 1.586615, -0.5842156, 1, 0, 0, 1, 1,
-1.768393, 0.1377964, -0.6084336, 0, 0, 0, 1, 1,
-1.754283, 1.12459, -1.916168, 0, 0, 0, 1, 1,
-1.753334, 0.2679033, -1.151896, 0, 0, 0, 1, 1,
-1.741378, -0.5226393, -3.119125, 0, 0, 0, 1, 1,
-1.713095, -0.4920726, -3.294394, 0, 0, 0, 1, 1,
-1.712154, -0.8544846, -1.049819, 0, 0, 0, 1, 1,
-1.701472, -0.3837973, -2.111951, 0, 0, 0, 1, 1,
-1.678087, -0.6498532, -2.474128, 1, 1, 1, 1, 1,
-1.662186, -0.3349578, -2.735368, 1, 1, 1, 1, 1,
-1.65705, -1.963643, -2.861894, 1, 1, 1, 1, 1,
-1.649175, 0.3663234, -0.6680354, 1, 1, 1, 1, 1,
-1.634447, 0.05077922, -2.603469, 1, 1, 1, 1, 1,
-1.632132, 1.718195, -0.3649659, 1, 1, 1, 1, 1,
-1.628678, -0.03656017, -1.527249, 1, 1, 1, 1, 1,
-1.619909, 1.496685, 1.37729, 1, 1, 1, 1, 1,
-1.618416, 1.295196, -2.286713, 1, 1, 1, 1, 1,
-1.585376, 0.6868697, -2.394503, 1, 1, 1, 1, 1,
-1.570978, -0.0184973, -1.526064, 1, 1, 1, 1, 1,
-1.544144, 0.4240187, -2.21115, 1, 1, 1, 1, 1,
-1.543943, -1.382347, -2.890844, 1, 1, 1, 1, 1,
-1.536276, -0.1929238, -0.6679606, 1, 1, 1, 1, 1,
-1.526947, 0.9987534, -3.048897, 1, 1, 1, 1, 1,
-1.526126, 0.5975816, -1.148412, 0, 0, 1, 1, 1,
-1.51972, 0.004707783, -4.87437, 1, 0, 0, 1, 1,
-1.517072, -1.36827, -1.503396, 1, 0, 0, 1, 1,
-1.502062, -1.889962, -2.201281, 1, 0, 0, 1, 1,
-1.499003, 0.5823029, -1.566655, 1, 0, 0, 1, 1,
-1.49608, 0.014698, -1.537603, 1, 0, 0, 1, 1,
-1.484409, 1.133788, -0.9580152, 0, 0, 0, 1, 1,
-1.481968, 1.558555, -1.669306, 0, 0, 0, 1, 1,
-1.472882, -1.148884, 0.1532036, 0, 0, 0, 1, 1,
-1.46887, 1.917893, -1.264785, 0, 0, 0, 1, 1,
-1.468058, -0.3546711, -2.100322, 0, 0, 0, 1, 1,
-1.463103, -0.00344105, -1.635552, 0, 0, 0, 1, 1,
-1.452524, 0.3065516, -0.5258483, 0, 0, 0, 1, 1,
-1.445257, -0.3988814, -0.7678642, 1, 1, 1, 1, 1,
-1.440166, -0.4007307, -2.616203, 1, 1, 1, 1, 1,
-1.432041, 0.5450792, 0.06235994, 1, 1, 1, 1, 1,
-1.43051, -0.6279199, -1.87546, 1, 1, 1, 1, 1,
-1.428723, 1.061627, -0.5220148, 1, 1, 1, 1, 1,
-1.426029, -1.027595, -2.574514, 1, 1, 1, 1, 1,
-1.417766, 1.135588, -0.1520026, 1, 1, 1, 1, 1,
-1.40834, 0.8036877, -0.45904, 1, 1, 1, 1, 1,
-1.407364, 0.4094357, -0.6256673, 1, 1, 1, 1, 1,
-1.392957, -0.1886316, -1.506998, 1, 1, 1, 1, 1,
-1.387148, 0.6470693, -1.521278, 1, 1, 1, 1, 1,
-1.385995, 0.287686, -2.128525, 1, 1, 1, 1, 1,
-1.379256, 0.6637325, -1.850208, 1, 1, 1, 1, 1,
-1.377955, -0.7829894, -2.653787, 1, 1, 1, 1, 1,
-1.368556, -0.4850468, -0.5056708, 1, 1, 1, 1, 1,
-1.358881, 1.472845, -1.09183, 0, 0, 1, 1, 1,
-1.347792, -0.3675008, -1.733131, 1, 0, 0, 1, 1,
-1.347456, 0.1173537, -2.030617, 1, 0, 0, 1, 1,
-1.346469, -0.8227088, -2.563112, 1, 0, 0, 1, 1,
-1.334893, -0.9198083, -2.191462, 1, 0, 0, 1, 1,
-1.316842, 0.7760856, -1.036575, 1, 0, 0, 1, 1,
-1.31262, -1.166439, -2.010313, 0, 0, 0, 1, 1,
-1.310818, 1.750091, -0.6607208, 0, 0, 0, 1, 1,
-1.307122, 0.2276347, -3.389045, 0, 0, 0, 1, 1,
-1.288801, 1.508775, -2.046537, 0, 0, 0, 1, 1,
-1.288076, 1.142713, 1.803571, 0, 0, 0, 1, 1,
-1.280226, 1.155805, -0.7492218, 0, 0, 0, 1, 1,
-1.278087, 0.2222134, -1.405238, 0, 0, 0, 1, 1,
-1.274252, 0.7518217, -1.705546, 1, 1, 1, 1, 1,
-1.269668, 0.8944485, -2.027269, 1, 1, 1, 1, 1,
-1.265999, -0.5189906, -1.14934, 1, 1, 1, 1, 1,
-1.264761, -0.01680769, -2.390647, 1, 1, 1, 1, 1,
-1.261404, 0.5491717, -1.621906, 1, 1, 1, 1, 1,
-1.258489, -0.8887466, -1.331277, 1, 1, 1, 1, 1,
-1.258221, 0.5729359, -1.344329, 1, 1, 1, 1, 1,
-1.257836, -0.2121748, -1.394684, 1, 1, 1, 1, 1,
-1.253955, -0.4869969, -1.198169, 1, 1, 1, 1, 1,
-1.251777, 0.053413, -1.500751, 1, 1, 1, 1, 1,
-1.250894, -1.571503, -0.5422277, 1, 1, 1, 1, 1,
-1.246119, -1.192533, -1.491299, 1, 1, 1, 1, 1,
-1.234011, -0.5712227, -2.655025, 1, 1, 1, 1, 1,
-1.233391, -0.6730343, -2.620099, 1, 1, 1, 1, 1,
-1.228698, 1.217724, -0.3167155, 1, 1, 1, 1, 1,
-1.220699, -1.898974, -3.543517, 0, 0, 1, 1, 1,
-1.21475, 0.8298599, -0.6824598, 1, 0, 0, 1, 1,
-1.212801, -1.75975, -2.124229, 1, 0, 0, 1, 1,
-1.211133, 0.02506958, -1.113947, 1, 0, 0, 1, 1,
-1.207168, -0.1027187, -0.2096394, 1, 0, 0, 1, 1,
-1.194725, -1.433828, -1.712915, 1, 0, 0, 1, 1,
-1.194107, 0.1168695, -1.80838, 0, 0, 0, 1, 1,
-1.190114, -0.494654, -3.686701, 0, 0, 0, 1, 1,
-1.17563, -0.002312861, -1.336031, 0, 0, 0, 1, 1,
-1.174219, 0.1557565, -2.48328, 0, 0, 0, 1, 1,
-1.172583, -1.176862, -2.801969, 0, 0, 0, 1, 1,
-1.170594, -1.071316, -2.893586, 0, 0, 0, 1, 1,
-1.16766, -0.4729919, -3.020141, 0, 0, 0, 1, 1,
-1.165442, -1.024968, -3.26308, 1, 1, 1, 1, 1,
-1.164812, -0.3258233, -0.593685, 1, 1, 1, 1, 1,
-1.154873, -0.6141937, -1.138669, 1, 1, 1, 1, 1,
-1.148389, 0.1625149, -0.4838288, 1, 1, 1, 1, 1,
-1.143216, 0.1116147, -2.334431, 1, 1, 1, 1, 1,
-1.142182, 0.4702514, -1.302723, 1, 1, 1, 1, 1,
-1.128721, -0.6893324, -1.354368, 1, 1, 1, 1, 1,
-1.126599, -0.3716596, -2.031392, 1, 1, 1, 1, 1,
-1.102927, 0.3610654, -1.521202, 1, 1, 1, 1, 1,
-1.094699, 0.8024495, -1.325826, 1, 1, 1, 1, 1,
-1.092917, -0.8145193, -2.255482, 1, 1, 1, 1, 1,
-1.0858, -0.8565156, -1.734316, 1, 1, 1, 1, 1,
-1.084079, -1.84155, -2.542301, 1, 1, 1, 1, 1,
-1.080817, 1.113551, -2.429397, 1, 1, 1, 1, 1,
-1.079213, -0.5869616, -0.4884737, 1, 1, 1, 1, 1,
-1.078336, -0.6491278, -2.993175, 0, 0, 1, 1, 1,
-1.072587, 0.342353, -0.5330542, 1, 0, 0, 1, 1,
-1.06996, -0.05415714, -1.749559, 1, 0, 0, 1, 1,
-1.063003, -0.6779845, -2.874878, 1, 0, 0, 1, 1,
-1.054465, -1.179931, -3.230212, 1, 0, 0, 1, 1,
-1.044527, -0.2295465, -1.925623, 1, 0, 0, 1, 1,
-1.037939, -1.758987, -3.027523, 0, 0, 0, 1, 1,
-1.035152, 0.6143243, -1.075619, 0, 0, 0, 1, 1,
-1.034742, 0.5571303, -0.50076, 0, 0, 0, 1, 1,
-1.018783, 0.5510334, 0.7719243, 0, 0, 0, 1, 1,
-1.017161, -1.146814, -3.434161, 0, 0, 0, 1, 1,
-1.016312, 0.7432893, 0.3031498, 0, 0, 0, 1, 1,
-1.01559, -0.8385747, -3.62881, 0, 0, 0, 1, 1,
-1.01414, -0.5221703, -1.406073, 1, 1, 1, 1, 1,
-1.011975, -0.3232968, -1.699235, 1, 1, 1, 1, 1,
-1.011313, -2.776308, -3.761017, 1, 1, 1, 1, 1,
-1.01098, 1.172612, 1.618877, 1, 1, 1, 1, 1,
-1.007984, 0.4714155, -0.757707, 1, 1, 1, 1, 1,
-1.005819, -0.02319574, -0.6104675, 1, 1, 1, 1, 1,
-1.005653, -0.232032, -1.787883, 1, 1, 1, 1, 1,
-0.9975011, -0.7304771, -3.679967, 1, 1, 1, 1, 1,
-0.9950905, -0.2055669, -2.679789, 1, 1, 1, 1, 1,
-0.9915416, -2.385676, -0.5593162, 1, 1, 1, 1, 1,
-0.9900305, 0.7909972, 0.02870925, 1, 1, 1, 1, 1,
-0.984966, -0.3289212, -3.265441, 1, 1, 1, 1, 1,
-0.9810619, 0.2524957, -2.460241, 1, 1, 1, 1, 1,
-0.9792471, -0.5998999, -1.289082, 1, 1, 1, 1, 1,
-0.975094, -0.5444372, -1.439657, 1, 1, 1, 1, 1,
-0.9731339, 1.507348, -0.3248774, 0, 0, 1, 1, 1,
-0.9714823, 0.1264746, -1.640666, 1, 0, 0, 1, 1,
-0.9702986, 0.1385028, -0.7391914, 1, 0, 0, 1, 1,
-0.9668841, -0.2857796, -2.664574, 1, 0, 0, 1, 1,
-0.9650817, 0.5133263, -1.131048, 1, 0, 0, 1, 1,
-0.963427, 0.2660507, -1.973787, 1, 0, 0, 1, 1,
-0.962478, 1.280561, -1.924693, 0, 0, 0, 1, 1,
-0.9599705, 2.326219, 0.4997218, 0, 0, 0, 1, 1,
-0.9594079, -0.3899635, -1.333734, 0, 0, 0, 1, 1,
-0.9592288, -1.056413, -1.891377, 0, 0, 0, 1, 1,
-0.9554976, 0.9651751, 0.624482, 0, 0, 0, 1, 1,
-0.9539939, 0.6924091, -2.190757, 0, 0, 0, 1, 1,
-0.9432544, 0.4463389, -3.204183, 0, 0, 0, 1, 1,
-0.9400317, 1.145071, -0.8905959, 1, 1, 1, 1, 1,
-0.9387029, 0.1447813, 0.3904339, 1, 1, 1, 1, 1,
-0.9371718, 1.518038, -1.990647, 1, 1, 1, 1, 1,
-0.9344822, -1.28231, -3.03827, 1, 1, 1, 1, 1,
-0.9339471, 0.4835542, -1.870802, 1, 1, 1, 1, 1,
-0.9317909, -0.7818829, -0.6779581, 1, 1, 1, 1, 1,
-0.9315107, -0.6866249, -3.476888, 1, 1, 1, 1, 1,
-0.9260256, -0.6069072, -2.196728, 1, 1, 1, 1, 1,
-0.9259216, -1.200094, -2.092154, 1, 1, 1, 1, 1,
-0.9183424, 0.6814716, 1.162296, 1, 1, 1, 1, 1,
-0.9124089, 0.864252, -0.754239, 1, 1, 1, 1, 1,
-0.9063703, -0.5577598, -1.991876, 1, 1, 1, 1, 1,
-0.9045196, 0.1946996, -1.398362, 1, 1, 1, 1, 1,
-0.9034888, 0.8475167, -0.7068161, 1, 1, 1, 1, 1,
-0.9006397, 0.8859846, 0.781011, 1, 1, 1, 1, 1,
-0.8996935, 0.2358051, 0.3461737, 0, 0, 1, 1, 1,
-0.8987369, -1.458798, -2.902993, 1, 0, 0, 1, 1,
-0.8973112, 0.07130972, -1.280898, 1, 0, 0, 1, 1,
-0.8900293, -1.100635, -1.77844, 1, 0, 0, 1, 1,
-0.8871855, -1.136046, -0.6468677, 1, 0, 0, 1, 1,
-0.884762, -2.155118, -4.629978, 1, 0, 0, 1, 1,
-0.8812035, -0.5132712, -1.32082, 0, 0, 0, 1, 1,
-0.8805001, -0.05087352, -1.838386, 0, 0, 0, 1, 1,
-0.87664, 2.05697, -0.004841127, 0, 0, 0, 1, 1,
-0.8760353, -0.149017, -2.210795, 0, 0, 0, 1, 1,
-0.8724282, 1.373993, 1.831174, 0, 0, 0, 1, 1,
-0.8620604, 0.7689539, -1.254077, 0, 0, 0, 1, 1,
-0.8597357, 0.716597, -1.050324, 0, 0, 0, 1, 1,
-0.8434039, -2.2199, -2.893714, 1, 1, 1, 1, 1,
-0.841958, 0.5262567, 0.1024363, 1, 1, 1, 1, 1,
-0.8409233, -0.3741876, -2.659599, 1, 1, 1, 1, 1,
-0.8393816, 0.8138658, -1.224972, 1, 1, 1, 1, 1,
-0.838537, 1.584928, 0.1642633, 1, 1, 1, 1, 1,
-0.8367097, -0.9486987, -2.286485, 1, 1, 1, 1, 1,
-0.8362075, 0.357303, -1.965869, 1, 1, 1, 1, 1,
-0.8307636, 0.3663772, -0.8381537, 1, 1, 1, 1, 1,
-0.8304605, -0.06233172, -0.8825494, 1, 1, 1, 1, 1,
-0.8256316, 0.07802431, -0.7868835, 1, 1, 1, 1, 1,
-0.8213139, 0.7740355, -1.20972, 1, 1, 1, 1, 1,
-0.8185859, -0.2870572, -1.506376, 1, 1, 1, 1, 1,
-0.8185228, 1.010942, -1.423746, 1, 1, 1, 1, 1,
-0.8168254, -1.003064, -2.543929, 1, 1, 1, 1, 1,
-0.8152313, -0.8773516, -2.675263, 1, 1, 1, 1, 1,
-0.8073443, -2.526857, -1.793453, 0, 0, 1, 1, 1,
-0.803511, -0.9894475, -2.449182, 1, 0, 0, 1, 1,
-0.7933727, 1.271529, 1.258874, 1, 0, 0, 1, 1,
-0.7930983, 1.274524, -0.07477322, 1, 0, 0, 1, 1,
-0.7923468, -1.036484, -2.497864, 1, 0, 0, 1, 1,
-0.7920049, 2.316754, 0.7292534, 1, 0, 0, 1, 1,
-0.7918083, -1.487228, -3.579404, 0, 0, 0, 1, 1,
-0.7910841, -1.745645, -2.795242, 0, 0, 0, 1, 1,
-0.7910442, 1.539176, -0.6784459, 0, 0, 0, 1, 1,
-0.7889624, 0.2524001, -3.074625, 0, 0, 0, 1, 1,
-0.7839133, -0.5922559, -2.368357, 0, 0, 0, 1, 1,
-0.7823523, 0.1096605, -1.620442, 0, 0, 0, 1, 1,
-0.7763128, 0.7352338, -1.078461, 0, 0, 0, 1, 1,
-0.7753823, 1.101328, -0.3720488, 1, 1, 1, 1, 1,
-0.7738374, -0.1556635, -2.046176, 1, 1, 1, 1, 1,
-0.7668527, 0.4452804, -0.8188417, 1, 1, 1, 1, 1,
-0.7640974, 1.410883, -0.9316403, 1, 1, 1, 1, 1,
-0.7621602, -2.534494, -2.451347, 1, 1, 1, 1, 1,
-0.7619892, -0.5920098, -2.91189, 1, 1, 1, 1, 1,
-0.760157, -0.637907, -2.633991, 1, 1, 1, 1, 1,
-0.7600946, -0.3139317, -2.430663, 1, 1, 1, 1, 1,
-0.7575063, -1.99938, -2.089242, 1, 1, 1, 1, 1,
-0.7555527, -0.7188556, -3.127911, 1, 1, 1, 1, 1,
-0.7475052, 0.9514507, 1.005639, 1, 1, 1, 1, 1,
-0.744101, 0.8248591, -0.9745881, 1, 1, 1, 1, 1,
-0.7408181, 0.1596149, -1.625016, 1, 1, 1, 1, 1,
-0.7373952, 0.81471, -1.886789, 1, 1, 1, 1, 1,
-0.7337285, 4.026119, -0.2506894, 1, 1, 1, 1, 1,
-0.7298042, 1.480476, -1.082197, 0, 0, 1, 1, 1,
-0.7286264, -2.843872, -2.718649, 1, 0, 0, 1, 1,
-0.7264495, -0.2949181, -0.4933756, 1, 0, 0, 1, 1,
-0.7173272, 1.246191, -0.1632739, 1, 0, 0, 1, 1,
-0.7164642, -1.720635, -3.973799, 1, 0, 0, 1, 1,
-0.7128121, -1.528145, -3.460053, 1, 0, 0, 1, 1,
-0.7126737, 1.511604, -0.1350709, 0, 0, 0, 1, 1,
-0.7117314, 0.9187774, -1.488307, 0, 0, 0, 1, 1,
-0.7099679, -1.184067, -4.303875, 0, 0, 0, 1, 1,
-0.7086837, -1.44828, -3.503106, 0, 0, 0, 1, 1,
-0.7086265, -0.08046053, -1.231833, 0, 0, 0, 1, 1,
-0.7074956, 0.5318683, -0.6466525, 0, 0, 0, 1, 1,
-0.7069655, 0.3029529, -1.974928, 0, 0, 0, 1, 1,
-0.7019703, -1.092344, -2.108445, 1, 1, 1, 1, 1,
-0.695251, -0.8571339, -2.321893, 1, 1, 1, 1, 1,
-0.6938456, -0.797757, -2.719149, 1, 1, 1, 1, 1,
-0.6869088, 2.194695, 0.02211626, 1, 1, 1, 1, 1,
-0.6814057, 0.2289677, -1.829556, 1, 1, 1, 1, 1,
-0.6774511, 0.1146308, -0.4218056, 1, 1, 1, 1, 1,
-0.6754322, 0.4991082, 0.1446922, 1, 1, 1, 1, 1,
-0.6754064, -0.8574706, -0.6124799, 1, 1, 1, 1, 1,
-0.6740293, -0.1705512, -1.269301, 1, 1, 1, 1, 1,
-0.6710554, -0.3762311, -1.576888, 1, 1, 1, 1, 1,
-0.6690271, 1.692844, 0.5163118, 1, 1, 1, 1, 1,
-0.665699, -0.2970123, -1.901273, 1, 1, 1, 1, 1,
-0.6575418, -0.5981056, -4.639285, 1, 1, 1, 1, 1,
-0.657276, -1.514392, -3.508443, 1, 1, 1, 1, 1,
-0.6549134, 0.4819697, -1.097396, 1, 1, 1, 1, 1,
-0.6522274, 0.1084993, -1.005584, 0, 0, 1, 1, 1,
-0.6490096, 0.6469856, -1.080028, 1, 0, 0, 1, 1,
-0.6480688, 0.9319106, -2.655918, 1, 0, 0, 1, 1,
-0.6477861, -0.01279695, -1.724816, 1, 0, 0, 1, 1,
-0.6454912, 1.740236, -1.561847, 1, 0, 0, 1, 1,
-0.6449283, -0.5575284, -2.644162, 1, 0, 0, 1, 1,
-0.6439703, -2.183693, -2.971023, 0, 0, 0, 1, 1,
-0.6438338, 0.3861345, -0.2762303, 0, 0, 0, 1, 1,
-0.6389001, -0.9883995, -2.810009, 0, 0, 0, 1, 1,
-0.6360394, -1.277496, -2.195097, 0, 0, 0, 1, 1,
-0.6359651, -0.04805795, -0.6003942, 0, 0, 0, 1, 1,
-0.6272708, 1.075641, -1.267725, 0, 0, 0, 1, 1,
-0.6211076, -1.378872, -1.778623, 0, 0, 0, 1, 1,
-0.6180798, -0.8803043, -1.940055, 1, 1, 1, 1, 1,
-0.612501, 0.7303041, 0.954559, 1, 1, 1, 1, 1,
-0.6124607, 0.562506, 0.5677719, 1, 1, 1, 1, 1,
-0.6116101, 0.3825873, -0.957473, 1, 1, 1, 1, 1,
-0.6114302, 1.567943, 0.7536261, 1, 1, 1, 1, 1,
-0.6092963, 1.054543, -0.5119265, 1, 1, 1, 1, 1,
-0.6041524, 0.7629596, -2.015886, 1, 1, 1, 1, 1,
-0.5980829, -0.2089441, -0.7891285, 1, 1, 1, 1, 1,
-0.5971401, -0.4304493, -1.794329, 1, 1, 1, 1, 1,
-0.5908533, 0.8185267, -1.541929, 1, 1, 1, 1, 1,
-0.5847635, -0.07089533, -3.684887, 1, 1, 1, 1, 1,
-0.5816735, -0.06660282, -2.177183, 1, 1, 1, 1, 1,
-0.5746156, 0.4939149, -2.229268, 1, 1, 1, 1, 1,
-0.5740041, -0.4850768, -2.040509, 1, 1, 1, 1, 1,
-0.566515, -0.3172353, -4.116226, 1, 1, 1, 1, 1,
-0.566462, 0.2102598, -2.59463, 0, 0, 1, 1, 1,
-0.5649189, 0.5375398, -0.8903064, 1, 0, 0, 1, 1,
-0.562003, -0.5932127, -0.9414799, 1, 0, 0, 1, 1,
-0.5606563, 0.3382764, -0.250535, 1, 0, 0, 1, 1,
-0.5575113, -0.03735166, -1.200923, 1, 0, 0, 1, 1,
-0.557285, -1.556877, -0.761558, 1, 0, 0, 1, 1,
-0.5534114, -0.1829801, -0.5758582, 0, 0, 0, 1, 1,
-0.551545, -2.143082, -2.781098, 0, 0, 0, 1, 1,
-0.5473214, 0.7122009, -1.676603, 0, 0, 0, 1, 1,
-0.5472872, 0.6835043, -0.8583166, 0, 0, 0, 1, 1,
-0.5457125, -0.6133705, -2.640686, 0, 0, 0, 1, 1,
-0.5445756, -0.130583, -1.441659, 0, 0, 0, 1, 1,
-0.5434652, 0.4893615, -0.8383951, 0, 0, 0, 1, 1,
-0.5424866, 0.4509246, 0.4095567, 1, 1, 1, 1, 1,
-0.5381442, 0.5194411, 0.3304377, 1, 1, 1, 1, 1,
-0.5365152, 0.7377399, 0.6677859, 1, 1, 1, 1, 1,
-0.5349133, 0.1091179, -2.341185, 1, 1, 1, 1, 1,
-0.5273585, -1.684675, -4.654242, 1, 1, 1, 1, 1,
-0.5246708, 0.6458985, 0.5244808, 1, 1, 1, 1, 1,
-0.5243978, 0.3575962, -1.541041, 1, 1, 1, 1, 1,
-0.5241262, -0.09276427, -3.444239, 1, 1, 1, 1, 1,
-0.5209478, -0.2469866, -1.966254, 1, 1, 1, 1, 1,
-0.5207313, -0.9273143, -3.301278, 1, 1, 1, 1, 1,
-0.5187189, -1.576533, -2.154712, 1, 1, 1, 1, 1,
-0.5163424, 1.418228, -1.18212, 1, 1, 1, 1, 1,
-0.5117807, 1.40793, 0.4737248, 1, 1, 1, 1, 1,
-0.5053922, 0.1192212, -0.7815032, 1, 1, 1, 1, 1,
-0.5051458, -1.178705, -2.069584, 1, 1, 1, 1, 1,
-0.4943196, -0.01841807, -1.232818, 0, 0, 1, 1, 1,
-0.4928475, -0.8662369, -0.9395674, 1, 0, 0, 1, 1,
-0.4917729, -1.117476, -1.535197, 1, 0, 0, 1, 1,
-0.4874445, -1.608653, -3.467435, 1, 0, 0, 1, 1,
-0.4853114, -0.9477326, -1.344957, 1, 0, 0, 1, 1,
-0.4852555, 0.08771276, -2.797659, 1, 0, 0, 1, 1,
-0.4835206, 1.100006, 1.109905, 0, 0, 0, 1, 1,
-0.4778872, -0.9998563, -1.64458, 0, 0, 0, 1, 1,
-0.4713466, 1.001216, -1.238096, 0, 0, 0, 1, 1,
-0.4684136, -0.9361498, -1.24487, 0, 0, 0, 1, 1,
-0.461525, 0.3708643, -3.453133, 0, 0, 0, 1, 1,
-0.4587069, -0.6655624, -0.5914568, 0, 0, 0, 1, 1,
-0.4567307, 1.187144, -1.285778, 0, 0, 0, 1, 1,
-0.452362, -2.904805, -1.874082, 1, 1, 1, 1, 1,
-0.4509849, 0.5458928, -2.184016, 1, 1, 1, 1, 1,
-0.4508495, -0.1874807, -2.702525, 1, 1, 1, 1, 1,
-0.4500707, -0.7121975, -3.339821, 1, 1, 1, 1, 1,
-0.4458229, -0.5395597, -2.856818, 1, 1, 1, 1, 1,
-0.4440741, -1.122251, -3.169907, 1, 1, 1, 1, 1,
-0.4429969, -0.6887683, -2.481476, 1, 1, 1, 1, 1,
-0.4361854, 0.4130526, -0.6820832, 1, 1, 1, 1, 1,
-0.4337701, -0.03922082, -0.291963, 1, 1, 1, 1, 1,
-0.4284533, 1.039669, -0.09182794, 1, 1, 1, 1, 1,
-0.4279284, 0.7338363, -1.460513, 1, 1, 1, 1, 1,
-0.426338, -0.8493277, -1.780856, 1, 1, 1, 1, 1,
-0.426152, 1.039798, -0.1907415, 1, 1, 1, 1, 1,
-0.4250681, 1.244827, 0.3590157, 1, 1, 1, 1, 1,
-0.4150111, -1.652927, -1.335078, 1, 1, 1, 1, 1,
-0.4137921, -1.57373, -3.879172, 0, 0, 1, 1, 1,
-0.4104444, 0.4396636, -1.531824, 1, 0, 0, 1, 1,
-0.4076809, -0.245435, -1.5716, 1, 0, 0, 1, 1,
-0.3889519, -1.211157, -2.239192, 1, 0, 0, 1, 1,
-0.3775532, 0.9712111, -0.2959812, 1, 0, 0, 1, 1,
-0.376405, 0.02407441, -2.244175, 1, 0, 0, 1, 1,
-0.3750429, -1.503012, -2.491734, 0, 0, 0, 1, 1,
-0.370932, -1.2151, -3.885535, 0, 0, 0, 1, 1,
-0.370776, -1.745378, -4.068227, 0, 0, 0, 1, 1,
-0.3682818, -0.7246407, -4.390759, 0, 0, 0, 1, 1,
-0.3644803, -0.4626094, -3.973155, 0, 0, 0, 1, 1,
-0.3642573, 0.5696381, -1.163698, 0, 0, 0, 1, 1,
-0.3615598, -0.6815758, -3.311574, 0, 0, 0, 1, 1,
-0.3610806, -0.4952249, -3.895513, 1, 1, 1, 1, 1,
-0.3552851, -0.7767431, -3.675427, 1, 1, 1, 1, 1,
-0.3522242, 0.5658661, -0.3830803, 1, 1, 1, 1, 1,
-0.3501488, 0.4642488, -1.823814, 1, 1, 1, 1, 1,
-0.3476875, -0.2835791, -1.612478, 1, 1, 1, 1, 1,
-0.3465733, 2.150101, 0.2045059, 1, 1, 1, 1, 1,
-0.3441063, 1.039128, -0.613655, 1, 1, 1, 1, 1,
-0.3426671, 0.5729194, 0.9504293, 1, 1, 1, 1, 1,
-0.3401858, 1.912614, -1.723345, 1, 1, 1, 1, 1,
-0.3363513, 1.337567, 1.050921, 1, 1, 1, 1, 1,
-0.3360932, 0.08133658, -2.07761, 1, 1, 1, 1, 1,
-0.3312038, 0.09094688, -0.05606006, 1, 1, 1, 1, 1,
-0.325009, -1.366055, -2.304016, 1, 1, 1, 1, 1,
-0.3226952, -0.2888052, -0.1869577, 1, 1, 1, 1, 1,
-0.3214367, 0.3029647, 0.734067, 1, 1, 1, 1, 1,
-0.3206404, 1.774482, 1.274867, 0, 0, 1, 1, 1,
-0.319125, -1.130994, -2.368981, 1, 0, 0, 1, 1,
-0.3167058, 0.1904341, -0.4887551, 1, 0, 0, 1, 1,
-0.3164757, 0.1873305, -0.8619593, 1, 0, 0, 1, 1,
-0.3149959, 1.372557, 0.09352206, 1, 0, 0, 1, 1,
-0.3105166, 0.4331773, -1.087062, 1, 0, 0, 1, 1,
-0.3099351, 1.202639, -2.321238, 0, 0, 0, 1, 1,
-0.3072493, -0.5998719, -3.681958, 0, 0, 0, 1, 1,
-0.3045226, 0.8439389, -0.3738806, 0, 0, 0, 1, 1,
-0.2987993, -1.885327, -2.823995, 0, 0, 0, 1, 1,
-0.2982836, 0.1031554, -0.8223507, 0, 0, 0, 1, 1,
-0.2982379, -0.08035616, -1.876737, 0, 0, 0, 1, 1,
-0.2973842, -0.1490284, -2.858195, 0, 0, 0, 1, 1,
-0.2950197, -1.121025, -3.707644, 1, 1, 1, 1, 1,
-0.2934257, 0.8538745, -0.2403935, 1, 1, 1, 1, 1,
-0.2914992, 0.7827466, -1.638149, 1, 1, 1, 1, 1,
-0.2869644, -1.513558, -4.170571, 1, 1, 1, 1, 1,
-0.2822359, -0.1783927, -2.168366, 1, 1, 1, 1, 1,
-0.2814766, 1.78168, -1.517028, 1, 1, 1, 1, 1,
-0.2785466, 0.4263558, -0.2786895, 1, 1, 1, 1, 1,
-0.2727859, 0.1733952, -0.6658208, 1, 1, 1, 1, 1,
-0.267314, 0.2075891, -2.310658, 1, 1, 1, 1, 1,
-0.2667713, 1.490259, 1.213726, 1, 1, 1, 1, 1,
-0.2664249, 2.357516, 0.2323841, 1, 1, 1, 1, 1,
-0.2661541, 0.3845274, 0.8529204, 1, 1, 1, 1, 1,
-0.2629346, 1.075462, -1.318729, 1, 1, 1, 1, 1,
-0.2529919, -1.070372, -3.944801, 1, 1, 1, 1, 1,
-0.2424911, -0.7067419, -4.55499, 1, 1, 1, 1, 1,
-0.2379862, 0.9685637, -1.022286, 0, 0, 1, 1, 1,
-0.2376413, -0.346632, -2.823414, 1, 0, 0, 1, 1,
-0.2368677, -1.113744, -2.150067, 1, 0, 0, 1, 1,
-0.2296271, 1.121279, 1.203172, 1, 0, 0, 1, 1,
-0.2280324, 0.6952431, -0.363302, 1, 0, 0, 1, 1,
-0.2271975, 0.5940363, 0.7290079, 1, 0, 0, 1, 1,
-0.2260391, 0.1009738, -1.713483, 0, 0, 0, 1, 1,
-0.2250636, 0.0860787, -0.2955123, 0, 0, 0, 1, 1,
-0.2241489, -0.755202, -4.090062, 0, 0, 0, 1, 1,
-0.2206228, 1.092396, 1.622643, 0, 0, 0, 1, 1,
-0.212306, -1.113058, -3.071944, 0, 0, 0, 1, 1,
-0.2047648, -0.6437287, -2.183175, 0, 0, 0, 1, 1,
-0.2019891, 1.411729, -0.1916952, 0, 0, 0, 1, 1,
-0.1962983, 0.1863325, -1.553589, 1, 1, 1, 1, 1,
-0.19617, -0.5647013, -2.221212, 1, 1, 1, 1, 1,
-0.1958665, -0.196591, -4.62184, 1, 1, 1, 1, 1,
-0.1948301, -0.1019022, -3.657856, 1, 1, 1, 1, 1,
-0.1931977, 0.5436835, -0.7428606, 1, 1, 1, 1, 1,
-0.1927316, -0.6883144, -2.356591, 1, 1, 1, 1, 1,
-0.1921157, -1.038258, -2.107024, 1, 1, 1, 1, 1,
-0.1920543, 0.1373826, -0.3634195, 1, 1, 1, 1, 1,
-0.1910187, 0.04869313, -0.4896458, 1, 1, 1, 1, 1,
-0.1873523, 0.8849369, 0.8234176, 1, 1, 1, 1, 1,
-0.1862565, 1.35593, 0.08294622, 1, 1, 1, 1, 1,
-0.185809, 0.0229193, -2.675739, 1, 1, 1, 1, 1,
-0.1855558, 1.233781, -0.6106645, 1, 1, 1, 1, 1,
-0.1823296, -0.8325412, -3.088212, 1, 1, 1, 1, 1,
-0.1813712, -0.4918599, -1.667345, 1, 1, 1, 1, 1,
-0.1788828, 0.3072401, 0.7839335, 0, 0, 1, 1, 1,
-0.1739399, -0.7663598, -2.06149, 1, 0, 0, 1, 1,
-0.1726562, -1.088342, -4.241952, 1, 0, 0, 1, 1,
-0.165206, 2.410237, -0.4722255, 1, 0, 0, 1, 1,
-0.1621426, 0.6052529, 0.6619939, 1, 0, 0, 1, 1,
-0.1616368, 0.8170192, -0.6245614, 1, 0, 0, 1, 1,
-0.1578433, -1.213845, -2.353112, 0, 0, 0, 1, 1,
-0.1564371, -1.313535, -3.619105, 0, 0, 0, 1, 1,
-0.1562261, 0.3045599, -0.3696319, 0, 0, 0, 1, 1,
-0.1560631, 1.173067, -1.402667, 0, 0, 0, 1, 1,
-0.1552209, 1.868162, -0.1949765, 0, 0, 0, 1, 1,
-0.1535187, -0.3054383, -3.75593, 0, 0, 0, 1, 1,
-0.1528044, -0.7976226, -4.06389, 0, 0, 0, 1, 1,
-0.1476164, 0.8773015, -2.064029, 1, 1, 1, 1, 1,
-0.147187, 1.360138, -0.7286479, 1, 1, 1, 1, 1,
-0.1468098, 1.593011, -1.405101, 1, 1, 1, 1, 1,
-0.1458687, -0.07610869, -3.570037, 1, 1, 1, 1, 1,
-0.142534, -0.4868398, -1.861421, 1, 1, 1, 1, 1,
-0.1403639, -0.7496816, -3.299293, 1, 1, 1, 1, 1,
-0.1377546, 0.2484544, -0.4158523, 1, 1, 1, 1, 1,
-0.1360884, -2.513963, -2.326148, 1, 1, 1, 1, 1,
-0.1358749, -1.527385, -3.168551, 1, 1, 1, 1, 1,
-0.1354284, 0.8236328, -2.143242, 1, 1, 1, 1, 1,
-0.133675, -1.201375, -3.580212, 1, 1, 1, 1, 1,
-0.1275044, -0.5089443, -1.793831, 1, 1, 1, 1, 1,
-0.1166069, -0.3402674, -3.082868, 1, 1, 1, 1, 1,
-0.1100031, -0.5646985, -4.462494, 1, 1, 1, 1, 1,
-0.1056167, -0.5557037, -3.072875, 1, 1, 1, 1, 1,
-0.1054374, 1.41317, 0.4958341, 0, 0, 1, 1, 1,
-0.1044888, -1.114371, -0.6630642, 1, 0, 0, 1, 1,
-0.1036975, 1.280495, 0.02553339, 1, 0, 0, 1, 1,
-0.1034645, 0.5137424, 0.1587901, 1, 0, 0, 1, 1,
-0.1013143, 1.515765, -0.1843462, 1, 0, 0, 1, 1,
-0.09856257, 0.9950579, -0.1416823, 1, 0, 0, 1, 1,
-0.09814906, -0.01555424, -2.610465, 0, 0, 0, 1, 1,
-0.09750208, 0.8693283, 0.2953849, 0, 0, 0, 1, 1,
-0.09625709, -0.3148942, -3.955177, 0, 0, 0, 1, 1,
-0.08470555, -0.4214883, -3.007408, 0, 0, 0, 1, 1,
-0.08281603, 0.8595284, -0.6267595, 0, 0, 0, 1, 1,
-0.07963709, -0.4423297, -2.80955, 0, 0, 0, 1, 1,
-0.07663156, -1.453398, -3.277528, 0, 0, 0, 1, 1,
-0.07450392, -0.4085719, -1.710271, 1, 1, 1, 1, 1,
-0.07448576, 0.2042835, 0.3049361, 1, 1, 1, 1, 1,
-0.06708407, -1.442181, -3.24691, 1, 1, 1, 1, 1,
-0.05358679, -0.1015392, -1.37013, 1, 1, 1, 1, 1,
-0.05313132, -0.4238124, -1.755435, 1, 1, 1, 1, 1,
-0.04846396, 1.219204, -0.6025749, 1, 1, 1, 1, 1,
-0.04787936, 0.06886424, -0.4650093, 1, 1, 1, 1, 1,
-0.0467365, -0.3475854, -2.19678, 1, 1, 1, 1, 1,
-0.04559145, -0.7186669, -3.097711, 1, 1, 1, 1, 1,
-0.04250878, 0.2792598, -1.155428, 1, 1, 1, 1, 1,
-0.03283202, 1.287694, 0.7091657, 1, 1, 1, 1, 1,
-0.02881826, 0.3143517, -0.02063612, 1, 1, 1, 1, 1,
-0.02546188, 1.208688, 0.358587, 1, 1, 1, 1, 1,
-0.02320136, 0.6677931, -0.1704067, 1, 1, 1, 1, 1,
-0.01891333, 1.097165, -1.411116, 1, 1, 1, 1, 1,
-0.01761546, -0.234379, -3.506951, 0, 0, 1, 1, 1,
-0.01759461, 0.3042777, 0.7136605, 1, 0, 0, 1, 1,
-0.01744441, -1.668297, -2.838289, 1, 0, 0, 1, 1,
-0.01495944, 0.4963111, -0.504106, 1, 0, 0, 1, 1,
-0.01271798, 1.238563, 0.6444974, 1, 0, 0, 1, 1,
-0.01046693, 0.7604691, 0.9389005, 1, 0, 0, 1, 1,
-0.004603237, -0.8469613, -3.382221, 0, 0, 0, 1, 1,
-0.001803801, -0.8374514, -1.784277, 0, 0, 0, 1, 1,
-0.001782064, -0.2694735, -3.718049, 0, 0, 0, 1, 1,
0.001925066, 0.7234415, 0.2423044, 0, 0, 0, 1, 1,
0.004062972, 0.2765194, -0.8192972, 0, 0, 0, 1, 1,
0.004629815, -0.3261772, 1.335277, 0, 0, 0, 1, 1,
0.006624185, 0.1646713, -0.08316705, 0, 0, 0, 1, 1,
0.007351382, 1.768281, 0.6199125, 1, 1, 1, 1, 1,
0.01320401, -0.5528579, 3.90195, 1, 1, 1, 1, 1,
0.01996079, -2.556273, 2.114203, 1, 1, 1, 1, 1,
0.02191158, -0.4421481, 3.048332, 1, 1, 1, 1, 1,
0.02368117, 0.6141633, -1.082826, 1, 1, 1, 1, 1,
0.02447904, -0.2154797, 2.349351, 1, 1, 1, 1, 1,
0.02489213, 1.768953, 0.8289964, 1, 1, 1, 1, 1,
0.02855776, -0.3785209, 1.143102, 1, 1, 1, 1, 1,
0.03201388, -0.3721537, 3.819797, 1, 1, 1, 1, 1,
0.04027896, -1.115096, 3.680592, 1, 1, 1, 1, 1,
0.04980838, 0.03536374, 0.6488394, 1, 1, 1, 1, 1,
0.0541396, -0.2986835, 2.786715, 1, 1, 1, 1, 1,
0.05536562, -0.2498615, 3.252237, 1, 1, 1, 1, 1,
0.05554482, 1.375104, 0.469105, 1, 1, 1, 1, 1,
0.05822563, 0.1234509, -0.30624, 1, 1, 1, 1, 1,
0.0589871, 1.328681, 2.072454, 0, 0, 1, 1, 1,
0.06711856, -0.5743636, 3.211015, 1, 0, 0, 1, 1,
0.07415283, -0.3311745, 2.830808, 1, 0, 0, 1, 1,
0.07487475, 0.001171267, 2.651093, 1, 0, 0, 1, 1,
0.07501883, -1.18746, 2.49718, 1, 0, 0, 1, 1,
0.07932965, 1.446747, 1.242967, 1, 0, 0, 1, 1,
0.08035909, -0.3443449, 3.438452, 0, 0, 0, 1, 1,
0.08071786, 0.0569664, 1.255572, 0, 0, 0, 1, 1,
0.08206831, 0.04221611, 1.533165, 0, 0, 0, 1, 1,
0.08580031, 0.4834089, 0.4158438, 0, 0, 0, 1, 1,
0.08846942, 1.724221, 2.514172, 0, 0, 0, 1, 1,
0.08930636, -0.3563048, 1.819573, 0, 0, 0, 1, 1,
0.08985884, -1.17865, 2.889471, 0, 0, 0, 1, 1,
0.09214067, -0.09306277, 2.485072, 1, 1, 1, 1, 1,
0.09534451, 1.505957, -0.3010547, 1, 1, 1, 1, 1,
0.09892676, -0.7594773, 2.340164, 1, 1, 1, 1, 1,
0.100868, 0.06122043, 1.006865, 1, 1, 1, 1, 1,
0.1020511, -0.706163, 3.013758, 1, 1, 1, 1, 1,
0.1097374, 0.7448803, 0.2602873, 1, 1, 1, 1, 1,
0.1148326, -1.288715, 2.893546, 1, 1, 1, 1, 1,
0.1251648, -0.2750561, 3.334361, 1, 1, 1, 1, 1,
0.1276512, -1.258574, 3.435865, 1, 1, 1, 1, 1,
0.128722, 0.1787452, 0.9319186, 1, 1, 1, 1, 1,
0.1298302, -0.7724182, 2.829736, 1, 1, 1, 1, 1,
0.1307967, 0.3124534, 1.583209, 1, 1, 1, 1, 1,
0.1320424, 0.5937125, -1.444093, 1, 1, 1, 1, 1,
0.1327851, 0.1373897, 0.04542958, 1, 1, 1, 1, 1,
0.1353267, 1.223767, -1.362671, 1, 1, 1, 1, 1,
0.1368111, -0.7047755, 4.073637, 0, 0, 1, 1, 1,
0.1421363, -0.6543021, 2.527701, 1, 0, 0, 1, 1,
0.1424137, 1.460111, -0.2501753, 1, 0, 0, 1, 1,
0.1430475, 0.9061091, -0.6681163, 1, 0, 0, 1, 1,
0.1445205, 1.163366, 0.3109166, 1, 0, 0, 1, 1,
0.1483972, -1.759478, 3.132472, 1, 0, 0, 1, 1,
0.1523634, -1.97748, 3.126472, 0, 0, 0, 1, 1,
0.1530498, 3.100583, 1.017034, 0, 0, 0, 1, 1,
0.1543185, -1.536873, 3.674175, 0, 0, 0, 1, 1,
0.1572523, 0.3125148, 0.382557, 0, 0, 0, 1, 1,
0.1598693, 0.2151341, 0.8599413, 0, 0, 0, 1, 1,
0.1630157, 1.480757, -0.552674, 0, 0, 0, 1, 1,
0.163714, -0.7224504, 4.108088, 0, 0, 0, 1, 1,
0.1680513, -0.2849587, 1.449053, 1, 1, 1, 1, 1,
0.1770098, 1.382086, 0.8948572, 1, 1, 1, 1, 1,
0.1774499, 0.7181981, -2.515259, 1, 1, 1, 1, 1,
0.1785162, 0.0962465, 0.6771784, 1, 1, 1, 1, 1,
0.1830241, -0.852975, 4.299774, 1, 1, 1, 1, 1,
0.1830477, -0.4202231, 0.6532221, 1, 1, 1, 1, 1,
0.1857131, 0.1787505, 1.734423, 1, 1, 1, 1, 1,
0.186392, -0.09090971, 0.508728, 1, 1, 1, 1, 1,
0.1875836, 0.3150754, 0.1316686, 1, 1, 1, 1, 1,
0.1900999, 0.7746879, -0.7159927, 1, 1, 1, 1, 1,
0.1922329, -1.153474, 3.634992, 1, 1, 1, 1, 1,
0.1998669, -0.1194145, 2.574461, 1, 1, 1, 1, 1,
0.2044596, 1.531975, 0.5328991, 1, 1, 1, 1, 1,
0.2069248, 1.389557, 0.4947404, 1, 1, 1, 1, 1,
0.2078786, -0.2294318, 4.46716, 1, 1, 1, 1, 1,
0.215946, 0.5438243, 0.4313784, 0, 0, 1, 1, 1,
0.2260388, 0.521585, 0.9983337, 1, 0, 0, 1, 1,
0.2293493, 1.182096, 0.1822461, 1, 0, 0, 1, 1,
0.229495, 0.449708, -0.03022286, 1, 0, 0, 1, 1,
0.2300158, -0.311771, 1.678748, 1, 0, 0, 1, 1,
0.2374596, -0.5412264, 1.996883, 1, 0, 0, 1, 1,
0.2383794, -0.06087377, 3.220008, 0, 0, 0, 1, 1,
0.2397336, 1.244665, 1.83524, 0, 0, 0, 1, 1,
0.2476023, -1.247228, 2.774082, 0, 0, 0, 1, 1,
0.2478615, 0.5584158, 0.04839395, 0, 0, 0, 1, 1,
0.2479882, 0.3416119, 0.6880741, 0, 0, 0, 1, 1,
0.2489944, 0.9598134, 0.9955907, 0, 0, 0, 1, 1,
0.2506553, 1.221869, 2.136153, 0, 0, 0, 1, 1,
0.2511657, -0.1045151, 4.405457, 1, 1, 1, 1, 1,
0.2525317, -0.2243248, 3.102629, 1, 1, 1, 1, 1,
0.2525701, -1.922265, 3.320677, 1, 1, 1, 1, 1,
0.258682, -0.04980681, 0.3161151, 1, 1, 1, 1, 1,
0.2605524, 0.8519254, 0.8109968, 1, 1, 1, 1, 1,
0.2616592, 1.143605, 0.3349345, 1, 1, 1, 1, 1,
0.2624079, 0.2245316, -0.4143141, 1, 1, 1, 1, 1,
0.2661208, 0.1205638, 0.5209677, 1, 1, 1, 1, 1,
0.2671123, 1.042421, 1.582009, 1, 1, 1, 1, 1,
0.2677827, -0.4714864, 2.955936, 1, 1, 1, 1, 1,
0.2708867, 1.268786, 0.1531048, 1, 1, 1, 1, 1,
0.2730401, -1.480093, 3.405229, 1, 1, 1, 1, 1,
0.2748053, 1.362626, 0.6818735, 1, 1, 1, 1, 1,
0.2773801, -0.6852146, 1.903795, 1, 1, 1, 1, 1,
0.2807236, -0.196678, 1.480232, 1, 1, 1, 1, 1,
0.2858044, 0.4177155, 1.09088, 0, 0, 1, 1, 1,
0.2864545, -1.178517, 3.06705, 1, 0, 0, 1, 1,
0.288861, 0.8199977, 0.08981024, 1, 0, 0, 1, 1,
0.2927134, 0.8471368, -0.4215062, 1, 0, 0, 1, 1,
0.2985999, 1.551849, -0.5756789, 1, 0, 0, 1, 1,
0.3199982, 1.122716, -1.313595, 1, 0, 0, 1, 1,
0.3206247, -0.0799709, -0.2031318, 0, 0, 0, 1, 1,
0.3207507, -0.2668419, 1.643053, 0, 0, 0, 1, 1,
0.329178, 0.5587492, 0.04250548, 0, 0, 0, 1, 1,
0.3301754, -1.054469, 2.292807, 0, 0, 0, 1, 1,
0.3306354, 1.523595, 1.720895, 0, 0, 0, 1, 1,
0.3324092, -0.2537349, 0.8458396, 0, 0, 0, 1, 1,
0.3334649, 2.260272, -0.9280221, 0, 0, 0, 1, 1,
0.3340499, 0.0188459, 1.331719, 1, 1, 1, 1, 1,
0.3469071, 1.489372, 1.290071, 1, 1, 1, 1, 1,
0.3496128, 0.4076148, 0.5064176, 1, 1, 1, 1, 1,
0.3513435, 0.7545262, -0.143941, 1, 1, 1, 1, 1,
0.3518982, -0.1102361, 0.4665137, 1, 1, 1, 1, 1,
0.3531996, 0.04135593, 2.070147, 1, 1, 1, 1, 1,
0.3536325, -1.823676, 2.274563, 1, 1, 1, 1, 1,
0.355106, -0.8510263, 2.88997, 1, 1, 1, 1, 1,
0.3562068, 0.2935167, 1.497355, 1, 1, 1, 1, 1,
0.3582132, -0.3361064, 1.664144, 1, 1, 1, 1, 1,
0.3588833, 1.470135, 2.786419, 1, 1, 1, 1, 1,
0.3597928, -0.2193598, 1.646503, 1, 1, 1, 1, 1,
0.3616756, 0.581131, -0.5501328, 1, 1, 1, 1, 1,
0.3625536, 1.396308, 0.678591, 1, 1, 1, 1, 1,
0.3637571, 0.1498452, 0.6347408, 1, 1, 1, 1, 1,
0.3685107, 0.2619187, 0.7054481, 0, 0, 1, 1, 1,
0.3698758, -0.4181765, 3.533924, 1, 0, 0, 1, 1,
0.3708524, 0.3278196, 1.185918, 1, 0, 0, 1, 1,
0.3714755, 0.03057803, 1.52156, 1, 0, 0, 1, 1,
0.3717188, -0.3473024, 0.07865738, 1, 0, 0, 1, 1,
0.3753313, 0.5989366, 1.617037, 1, 0, 0, 1, 1,
0.3782989, -1.209098, 1.867975, 0, 0, 0, 1, 1,
0.3849225, -1.21345, 2.241549, 0, 0, 0, 1, 1,
0.3850564, -0.5391479, 2.663676, 0, 0, 0, 1, 1,
0.3854496, -0.5701936, 1.809446, 0, 0, 0, 1, 1,
0.3861053, 0.2508898, 0.9232497, 0, 0, 0, 1, 1,
0.38735, 1.425704, 0.1574232, 0, 0, 0, 1, 1,
0.3884059, -0.8961243, 2.881335, 0, 0, 0, 1, 1,
0.393582, -1.911466, 2.631901, 1, 1, 1, 1, 1,
0.3983131, -0.9130441, 4.351176, 1, 1, 1, 1, 1,
0.4061968, 0.3165744, 3.170374, 1, 1, 1, 1, 1,
0.4082367, 1.592842, -0.09148485, 1, 1, 1, 1, 1,
0.4155067, -1.156692, 2.080979, 1, 1, 1, 1, 1,
0.4227727, -1.935579, 2.601385, 1, 1, 1, 1, 1,
0.4244887, -0.6338117, 2.407215, 1, 1, 1, 1, 1,
0.425456, 0.1040328, 0.6975813, 1, 1, 1, 1, 1,
0.4260161, -0.6864414, 3.40117, 1, 1, 1, 1, 1,
0.4264396, 0.1361222, 1.024682, 1, 1, 1, 1, 1,
0.4275717, -1.74288, 1.594782, 1, 1, 1, 1, 1,
0.4309454, 1.560758, -0.7019039, 1, 1, 1, 1, 1,
0.4364416, 0.9480585, 0.7033354, 1, 1, 1, 1, 1,
0.4373553, -0.1479853, 0.03554115, 1, 1, 1, 1, 1,
0.4391066, 1.204551, 1.535573, 1, 1, 1, 1, 1,
0.4445826, 0.4283062, 1.03996, 0, 0, 1, 1, 1,
0.4459531, 0.9390666, 1.539039, 1, 0, 0, 1, 1,
0.4469638, 0.2308123, 1.190976, 1, 0, 0, 1, 1,
0.449871, -1.819337, 2.049922, 1, 0, 0, 1, 1,
0.4512308, 1.557337, -0.4674957, 1, 0, 0, 1, 1,
0.4581659, -0.200694, 2.34696, 1, 0, 0, 1, 1,
0.461475, -0.7411716, 3.837942, 0, 0, 0, 1, 1,
0.4615781, 0.5174665, 0.3477085, 0, 0, 0, 1, 1,
0.4620937, 0.2869751, 2.158843, 0, 0, 0, 1, 1,
0.4636877, -1.109306, 2.812353, 0, 0, 0, 1, 1,
0.4672727, -0.335967, 1.567016, 0, 0, 0, 1, 1,
0.4693553, 0.5580842, 1.740417, 0, 0, 0, 1, 1,
0.4727115, 0.5524654, -0.9856407, 0, 0, 0, 1, 1,
0.4752436, -0.9153637, 3.006244, 1, 1, 1, 1, 1,
0.4822617, 0.4822792, -0.1313088, 1, 1, 1, 1, 1,
0.4848035, -0.4797389, 2.694337, 1, 1, 1, 1, 1,
0.488256, -0.8715079, 3.041017, 1, 1, 1, 1, 1,
0.4910563, 0.8067262, -2.19122, 1, 1, 1, 1, 1,
0.4944319, 1.375607, 2.275877, 1, 1, 1, 1, 1,
0.5002806, -1.362272, 2.014771, 1, 1, 1, 1, 1,
0.5005181, 0.09525003, 1.587201, 1, 1, 1, 1, 1,
0.5009392, -0.3713794, 1.701692, 1, 1, 1, 1, 1,
0.5069223, -0.476511, 0.3185948, 1, 1, 1, 1, 1,
0.509077, 0.4409892, -0.9512408, 1, 1, 1, 1, 1,
0.509824, 0.6502742, 0.7102602, 1, 1, 1, 1, 1,
0.5105397, 0.9265577, 0.3524605, 1, 1, 1, 1, 1,
0.5118962, 0.001180223, 2.625893, 1, 1, 1, 1, 1,
0.5126021, -0.8452881, 1.808989, 1, 1, 1, 1, 1,
0.5173359, -0.2075449, 3.481213, 0, 0, 1, 1, 1,
0.5184915, 0.3749475, 0.8841205, 1, 0, 0, 1, 1,
0.5186518, 0.3709819, 1.10913, 1, 0, 0, 1, 1,
0.5287995, 0.08526485, 2.071469, 1, 0, 0, 1, 1,
0.5311838, -0.6675352, 4.030549, 1, 0, 0, 1, 1,
0.5337059, -1.090055, 2.812322, 1, 0, 0, 1, 1,
0.5355433, -0.2390632, 2.738764, 0, 0, 0, 1, 1,
0.5361394, -0.292843, 3.481408, 0, 0, 0, 1, 1,
0.5398784, 0.6382493, 0.798371, 0, 0, 0, 1, 1,
0.5435004, -0.663004, 2.364863, 0, 0, 0, 1, 1,
0.5440507, 0.5030971, 0.7974072, 0, 0, 0, 1, 1,
0.5467535, -0.6275545, 2.951226, 0, 0, 0, 1, 1,
0.5564209, -1.478159, 3.245399, 0, 0, 0, 1, 1,
0.5634342, -0.3205697, 1.68357, 1, 1, 1, 1, 1,
0.5647509, -0.3569688, 2.802083, 1, 1, 1, 1, 1,
0.5653492, -0.4661263, 3.049324, 1, 1, 1, 1, 1,
0.5685716, 1.840076, -0.21664, 1, 1, 1, 1, 1,
0.5694515, 0.7259536, 0.9316427, 1, 1, 1, 1, 1,
0.5726317, 0.4803723, 1.347572, 1, 1, 1, 1, 1,
0.5737681, -0.3620564, 2.824194, 1, 1, 1, 1, 1,
0.5751325, 0.3326984, 0.8868668, 1, 1, 1, 1, 1,
0.5783883, -0.906381, 1.425792, 1, 1, 1, 1, 1,
0.5805545, 0.6823769, 2.262839, 1, 1, 1, 1, 1,
0.5835657, -1.449435, 4.855421, 1, 1, 1, 1, 1,
0.5852092, 1.016772, -0.005146041, 1, 1, 1, 1, 1,
0.5856693, 1.057167, 0.5998981, 1, 1, 1, 1, 1,
0.586028, 1.395065, 0.8379938, 1, 1, 1, 1, 1,
0.5865033, 1.237017, 1.853497, 1, 1, 1, 1, 1,
0.5896608, 0.8361588, 0.8618144, 0, 0, 1, 1, 1,
0.5937117, 0.06293575, 0.8763373, 1, 0, 0, 1, 1,
0.5963549, 1.454558, -0.3443113, 1, 0, 0, 1, 1,
0.5974032, -0.2375591, 1.652938, 1, 0, 0, 1, 1,
0.5977711, -1.30709, 3.088191, 1, 0, 0, 1, 1,
0.5993727, 0.1115588, 1.667714, 1, 0, 0, 1, 1,
0.5997081, 0.244763, 1.221635, 0, 0, 0, 1, 1,
0.6006547, -1.074315, 2.570182, 0, 0, 0, 1, 1,
0.6062141, -0.01389115, 2.282367, 0, 0, 0, 1, 1,
0.6067146, -0.4429963, 1.468313, 0, 0, 0, 1, 1,
0.608348, -0.3969238, 0.8384444, 0, 0, 0, 1, 1,
0.610878, -0.2932312, 3.708512, 0, 0, 0, 1, 1,
0.6116887, 0.5172246, 0.3702568, 0, 0, 0, 1, 1,
0.612211, -0.08875483, 1.607837, 1, 1, 1, 1, 1,
0.6130186, 1.39867, -0.1857169, 1, 1, 1, 1, 1,
0.6174437, 0.2496828, 0.8118632, 1, 1, 1, 1, 1,
0.6176687, -0.02386415, 0.9187565, 1, 1, 1, 1, 1,
0.618841, -0.7467, 3.420473, 1, 1, 1, 1, 1,
0.6212073, 1.045227, 1.22794, 1, 1, 1, 1, 1,
0.6289155, -0.9940524, 2.629064, 1, 1, 1, 1, 1,
0.6311069, 1.084664, 0.8831453, 1, 1, 1, 1, 1,
0.6403928, 0.005865429, 1.790991, 1, 1, 1, 1, 1,
0.6438159, -1.38809, 2.544919, 1, 1, 1, 1, 1,
0.6443567, 0.2136816, 1.390576, 1, 1, 1, 1, 1,
0.6449253, 0.4393696, 1.253013, 1, 1, 1, 1, 1,
0.6476424, 0.7580024, 1.279758, 1, 1, 1, 1, 1,
0.6527213, -0.4840061, 0.4532156, 1, 1, 1, 1, 1,
0.6533085, 0.4278606, 0.1865616, 1, 1, 1, 1, 1,
0.6568205, 0.8665376, 1.429205, 0, 0, 1, 1, 1,
0.662029, -0.08671799, 4.133505, 1, 0, 0, 1, 1,
0.6708463, -0.7401409, 0.8295392, 1, 0, 0, 1, 1,
0.6713985, -0.6517523, 2.56157, 1, 0, 0, 1, 1,
0.6725589, 0.1436956, 2.000103, 1, 0, 0, 1, 1,
0.6822672, 1.148546, 1.040091, 1, 0, 0, 1, 1,
0.6871072, 0.6057829, -1.135644, 0, 0, 0, 1, 1,
0.6874437, 0.6901416, 0.9324881, 0, 0, 0, 1, 1,
0.6897849, 0.1447266, 2.146185, 0, 0, 0, 1, 1,
0.6911589, -0.998407, 3.821108, 0, 0, 0, 1, 1,
0.6946443, 0.6665296, 1.486443, 0, 0, 0, 1, 1,
0.6995916, 1.464748, -1.960858, 0, 0, 0, 1, 1,
0.7057732, 0.6182624, 0.6937961, 0, 0, 0, 1, 1,
0.7075765, -0.5224723, 1.906226, 1, 1, 1, 1, 1,
0.7085209, 0.4809965, 0.02068789, 1, 1, 1, 1, 1,
0.7160847, -0.4855194, 2.989143, 1, 1, 1, 1, 1,
0.7187083, 0.3716327, 0.3548681, 1, 1, 1, 1, 1,
0.7224002, 2.885977, -0.1275168, 1, 1, 1, 1, 1,
0.7299215, 1.492873, 0.6496058, 1, 1, 1, 1, 1,
0.7409366, -1.219777, 0.3204445, 1, 1, 1, 1, 1,
0.7444289, 0.1185648, 0.6214544, 1, 1, 1, 1, 1,
0.7454631, 1.159315, -0.3909157, 1, 1, 1, 1, 1,
0.7464648, 0.764851, -0.4465505, 1, 1, 1, 1, 1,
0.7482319, -0.5597698, 3.74329, 1, 1, 1, 1, 1,
0.7498539, 0.8945133, 0.6350841, 1, 1, 1, 1, 1,
0.7507903, -0.6059673, 2.288295, 1, 1, 1, 1, 1,
0.7515569, 2.189469, 1.349041, 1, 1, 1, 1, 1,
0.7516161, -0.8263074, 2.278744, 1, 1, 1, 1, 1,
0.7538764, -0.2760201, 0.6297553, 0, 0, 1, 1, 1,
0.7564541, 1.059204, -0.2213259, 1, 0, 0, 1, 1,
0.7569093, -0.3571898, 1.47237, 1, 0, 0, 1, 1,
0.7584304, 1.411952, 0.4278919, 1, 0, 0, 1, 1,
0.7678984, 1.610223, 0.1959856, 1, 0, 0, 1, 1,
0.7706358, 0.3425954, 1.014177, 1, 0, 0, 1, 1,
0.7713596, -0.7426488, 3.236364, 0, 0, 0, 1, 1,
0.7750553, 0.09817591, 1.598258, 0, 0, 0, 1, 1,
0.7754906, 1.076244, 1.426661, 0, 0, 0, 1, 1,
0.7768923, 0.04780738, 3.089052, 0, 0, 0, 1, 1,
0.7789552, -1.378103, 3.690588, 0, 0, 0, 1, 1,
0.7799678, 0.1395974, 0.09532108, 0, 0, 0, 1, 1,
0.7837644, 0.1953253, 3.722158, 0, 0, 0, 1, 1,
0.7846619, 0.2277834, 0.9274666, 1, 1, 1, 1, 1,
0.7891683, 0.2086894, 0.0373371, 1, 1, 1, 1, 1,
0.789471, 0.7799431, 1.496753, 1, 1, 1, 1, 1,
0.7920672, 0.1180854, 1.141567, 1, 1, 1, 1, 1,
0.7974487, 0.06857308, 1.461191, 1, 1, 1, 1, 1,
0.7995178, -0.6996875, 4.448951, 1, 1, 1, 1, 1,
0.8012078, -2.053711, 2.173026, 1, 1, 1, 1, 1,
0.8034517, -2.411374, 2.359251, 1, 1, 1, 1, 1,
0.8098862, 0.9996029, 0.7449017, 1, 1, 1, 1, 1,
0.8106747, -0.7020123, 2.493088, 1, 1, 1, 1, 1,
0.8117645, 0.9935744, 2.054914, 1, 1, 1, 1, 1,
0.8128254, -0.3762198, 1.348679, 1, 1, 1, 1, 1,
0.8159045, 0.3268827, 2.439883, 1, 1, 1, 1, 1,
0.816942, -0.9404856, 4.43727, 1, 1, 1, 1, 1,
0.8297675, -0.2846088, 2.031749, 1, 1, 1, 1, 1,
0.8305616, -0.8991798, 3.717956, 0, 0, 1, 1, 1,
0.8309405, 1.573097, 1.686295, 1, 0, 0, 1, 1,
0.8490954, 0.1006426, -1.191189, 1, 0, 0, 1, 1,
0.8494995, 0.6920423, 0.3891839, 1, 0, 0, 1, 1,
0.8542265, 0.918358, 0.7096511, 1, 0, 0, 1, 1,
0.8548757, -0.2762702, 3.856231, 1, 0, 0, 1, 1,
0.8592185, -0.3805618, 3.275627, 0, 0, 0, 1, 1,
0.8618651, 1.859265, -1.204772, 0, 0, 0, 1, 1,
0.8635884, 2.099252, 0.2267692, 0, 0, 0, 1, 1,
0.8657085, 0.3638419, 1.867371, 0, 0, 0, 1, 1,
0.8894903, 1.011501, 1.9985, 0, 0, 0, 1, 1,
0.8917429, 1.741593, 0.8529949, 0, 0, 0, 1, 1,
0.8949778, -0.589835, 3.494334, 0, 0, 0, 1, 1,
0.8973945, -0.6583984, 1.70355, 1, 1, 1, 1, 1,
0.8995988, -0.9494098, 2.99105, 1, 1, 1, 1, 1,
0.9022626, 0.2432304, 1.992719, 1, 1, 1, 1, 1,
0.9025678, 0.4827973, 2.574995, 1, 1, 1, 1, 1,
0.9084294, -0.05426506, 1.89612, 1, 1, 1, 1, 1,
0.9087046, 0.432234, 0.9512, 1, 1, 1, 1, 1,
0.9126729, -0.4228221, 2.428717, 1, 1, 1, 1, 1,
0.9135439, -1.33081, 2.023712, 1, 1, 1, 1, 1,
0.9164384, -0.5680933, 1.586102, 1, 1, 1, 1, 1,
0.9278788, -0.07975156, 0.5829334, 1, 1, 1, 1, 1,
0.9289823, -0.2655529, 1.932338, 1, 1, 1, 1, 1,
0.9337706, -1.049848, 2.360589, 1, 1, 1, 1, 1,
0.9363286, -1.454441, 3.140508, 1, 1, 1, 1, 1,
0.9429371, -2.19018, 2.523844, 1, 1, 1, 1, 1,
0.9439487, -0.154884, 3.700154, 1, 1, 1, 1, 1,
0.9444687, 0.1866916, 0.8117317, 0, 0, 1, 1, 1,
0.9460623, 0.4182536, 1.948927, 1, 0, 0, 1, 1,
0.9490231, -1.342474, 1.942569, 1, 0, 0, 1, 1,
0.9576495, 0.2983268, 0.0697016, 1, 0, 0, 1, 1,
0.9617479, -1.808116, 0.5455084, 1, 0, 0, 1, 1,
0.9678112, 0.2278378, 0.4501642, 1, 0, 0, 1, 1,
0.9691933, 1.093406, 0.5236865, 0, 0, 0, 1, 1,
0.9798813, -1.58461, 2.322483, 0, 0, 0, 1, 1,
0.9842249, -0.4204985, -0.4287318, 0, 0, 0, 1, 1,
0.9849561, -0.7278541, 3.01149, 0, 0, 0, 1, 1,
0.9863808, -1.728521, 3.539955, 0, 0, 0, 1, 1,
0.9882665, 0.2405277, 2.126243, 0, 0, 0, 1, 1,
0.9912209, -0.7794083, 2.451748, 0, 0, 0, 1, 1,
0.9915385, -1.422183, 3.296175, 1, 1, 1, 1, 1,
0.9932343, 0.1621977, 1.927259, 1, 1, 1, 1, 1,
0.9988544, 0.8642092, 0.3767946, 1, 1, 1, 1, 1,
1.005463, 0.1684754, 2.010103, 1, 1, 1, 1, 1,
1.007207, 0.4926268, 0.7512215, 1, 1, 1, 1, 1,
1.008546, -0.7965709, 1.987925, 1, 1, 1, 1, 1,
1.019587, 0.3545144, 1.866316, 1, 1, 1, 1, 1,
1.021519, -0.06794748, 1.934645, 1, 1, 1, 1, 1,
1.022415, 0.660229, 0.1414403, 1, 1, 1, 1, 1,
1.036015, 0.2663966, 0.2120097, 1, 1, 1, 1, 1,
1.044394, 0.6734391, 1.079848, 1, 1, 1, 1, 1,
1.058648, 1.674913, 0.9853671, 1, 1, 1, 1, 1,
1.061555, -0.4898365, 2.251899, 1, 1, 1, 1, 1,
1.065395, -0.4657407, 1.983498, 1, 1, 1, 1, 1,
1.071868, -0.0271895, 1.389786, 1, 1, 1, 1, 1,
1.077391, 0.5484598, 1.1731, 0, 0, 1, 1, 1,
1.078157, 0.163577, 2.003827, 1, 0, 0, 1, 1,
1.083263, 1.734046, 1.239885, 1, 0, 0, 1, 1,
1.084451, -0.3448233, 1.587145, 1, 0, 0, 1, 1,
1.092084, 0.4059794, 0.4982611, 1, 0, 0, 1, 1,
1.093709, 0.2272455, 2.005606, 1, 0, 0, 1, 1,
1.10973, -0.6530497, 2.617051, 0, 0, 0, 1, 1,
1.110054, -0.3197981, 1.578734, 0, 0, 0, 1, 1,
1.111717, -1.121264, 1.968395, 0, 0, 0, 1, 1,
1.129432, -1.109861, 4.55853, 0, 0, 0, 1, 1,
1.141896, 0.04334877, 1.453503, 0, 0, 0, 1, 1,
1.149591, 0.9742707, 0.9878769, 0, 0, 0, 1, 1,
1.150562, -1.531708, 1.537329, 0, 0, 0, 1, 1,
1.154824, 0.7834995, -0.5730277, 1, 1, 1, 1, 1,
1.170725, 0.2345766, 2.141153, 1, 1, 1, 1, 1,
1.171883, 0.9873999, 0.5225958, 1, 1, 1, 1, 1,
1.188324, 0.3121142, 0.9890618, 1, 1, 1, 1, 1,
1.190341, -1.595587, 1.397891, 1, 1, 1, 1, 1,
1.192644, -1.107756, 1.89099, 1, 1, 1, 1, 1,
1.199261, 1.019302, 1.633907, 1, 1, 1, 1, 1,
1.201619, 0.7031412, 0.2480274, 1, 1, 1, 1, 1,
1.202178, -0.5686541, 3.870457, 1, 1, 1, 1, 1,
1.20526, -0.3642008, 1.607139, 1, 1, 1, 1, 1,
1.206235, -1.274365, 2.384465, 1, 1, 1, 1, 1,
1.21082, -0.168004, -0.5374572, 1, 1, 1, 1, 1,
1.212276, -0.5805783, 4.159193, 1, 1, 1, 1, 1,
1.222614, -2.431073, 1.276127, 1, 1, 1, 1, 1,
1.2228, -0.7960119, 3.434589, 1, 1, 1, 1, 1,
1.229884, -0.4244769, 1.122007, 0, 0, 1, 1, 1,
1.23911, 0.7782928, 0.3192627, 1, 0, 0, 1, 1,
1.241089, 0.06584381, 1.56286, 1, 0, 0, 1, 1,
1.242896, -0.06727967, -0.1702406, 1, 0, 0, 1, 1,
1.265667, -1.425718, 2.617167, 1, 0, 0, 1, 1,
1.276777, 0.09971374, 2.426511, 1, 0, 0, 1, 1,
1.280053, 0.3886907, -1.387001, 0, 0, 0, 1, 1,
1.283003, -0.08587804, 3.018459, 0, 0, 0, 1, 1,
1.288502, 0.8419234, 1.040904, 0, 0, 0, 1, 1,
1.293491, -0.1614282, 2.660134, 0, 0, 0, 1, 1,
1.298346, 0.494354, 0.4726671, 0, 0, 0, 1, 1,
1.304527, -0.5157537, 2.03725, 0, 0, 0, 1, 1,
1.305849, 0.7838531, 0.659127, 0, 0, 0, 1, 1,
1.314868, 0.4260081, 1.39257, 1, 1, 1, 1, 1,
1.317054, -0.4709779, 3.100389, 1, 1, 1, 1, 1,
1.320851, -1.107352, 3.481787, 1, 1, 1, 1, 1,
1.323153, -1.953178, 2.577929, 1, 1, 1, 1, 1,
1.330763, -0.877723, 1.054612, 1, 1, 1, 1, 1,
1.331226, 0.6941018, 1.846196, 1, 1, 1, 1, 1,
1.346086, -0.9620125, 2.034536, 1, 1, 1, 1, 1,
1.349102, 0.9590806, 1.904442, 1, 1, 1, 1, 1,
1.360672, 0.130116, 1.323158, 1, 1, 1, 1, 1,
1.362608, -1.408388, 2.71321, 1, 1, 1, 1, 1,
1.362622, 0.2043525, 2.179609, 1, 1, 1, 1, 1,
1.371994, 0.6947196, 1.111961, 1, 1, 1, 1, 1,
1.373282, -0.3038226, 3.79747, 1, 1, 1, 1, 1,
1.376981, 0.009005422, 1.503316, 1, 1, 1, 1, 1,
1.390299, 0.1357733, 1.955323, 1, 1, 1, 1, 1,
1.394401, 0.02105249, 0.06106908, 0, 0, 1, 1, 1,
1.395976, -0.3639638, 3.06814, 1, 0, 0, 1, 1,
1.39982, -0.09538648, 1.522697, 1, 0, 0, 1, 1,
1.420494, -0.2306175, 2.155202, 1, 0, 0, 1, 1,
1.422739, 1.058641, 2.115505, 1, 0, 0, 1, 1,
1.424935, -0.1372365, 1.252207, 1, 0, 0, 1, 1,
1.440578, 0.6753054, 0.4062507, 0, 0, 0, 1, 1,
1.467371, -0.9542386, 2.493903, 0, 0, 0, 1, 1,
1.46994, -0.1094689, 3.650753, 0, 0, 0, 1, 1,
1.470721, -1.148143, 1.956578, 0, 0, 0, 1, 1,
1.482996, 0.8746459, -0.5425244, 0, 0, 0, 1, 1,
1.484453, 1.312999, 1.359926, 0, 0, 0, 1, 1,
1.509069, -0.1741792, 1.874384, 0, 0, 0, 1, 1,
1.515576, 1.578999, 2.050396, 1, 1, 1, 1, 1,
1.544988, -2.245333, 3.128842, 1, 1, 1, 1, 1,
1.556059, 0.6336832, 0.8296874, 1, 1, 1, 1, 1,
1.564211, -0.2913495, 3.082633, 1, 1, 1, 1, 1,
1.57406, -0.1515662, 3.321607, 1, 1, 1, 1, 1,
1.576747, -1.335158, 2.665977, 1, 1, 1, 1, 1,
1.577717, -1.279301, 0.5491481, 1, 1, 1, 1, 1,
1.589832, -0.8211444, 2.072293, 1, 1, 1, 1, 1,
1.640644, 0.08749226, 0.4850398, 1, 1, 1, 1, 1,
1.649121, -1.949243, 1.931478, 1, 1, 1, 1, 1,
1.65736, 1.188719, 0.8349743, 1, 1, 1, 1, 1,
1.659765, -1.148918, 1.823808, 1, 1, 1, 1, 1,
1.661473, 0.3348167, 2.292623, 1, 1, 1, 1, 1,
1.662791, 0.1039046, 2.888658, 1, 1, 1, 1, 1,
1.668173, -1.153177, 2.12306, 1, 1, 1, 1, 1,
1.674305, 1.190828, 3.601453, 0, 0, 1, 1, 1,
1.695566, 0.5798671, 1.947813, 1, 0, 0, 1, 1,
1.710848, -0.410505, 3.991217, 1, 0, 0, 1, 1,
1.730838, 1.204851, -1.330173, 1, 0, 0, 1, 1,
1.747751, 0.2751627, 2.71282, 1, 0, 0, 1, 1,
1.760715, 0.5408121, -0.729434, 1, 0, 0, 1, 1,
1.767115, 0.1228224, 0.004869302, 0, 0, 0, 1, 1,
1.778412, -0.02181658, 1.667575, 0, 0, 0, 1, 1,
1.812905, -1.048061, 3.661195, 0, 0, 0, 1, 1,
1.826173, -1.186777, 2.887261, 0, 0, 0, 1, 1,
1.855675, -1.903762, 2.758371, 0, 0, 0, 1, 1,
1.882267, 0.09973992, 0.71448, 0, 0, 0, 1, 1,
1.896239, -0.8918002, 0.520186, 0, 0, 0, 1, 1,
1.906879, -1.899799, 2.427528, 1, 1, 1, 1, 1,
1.936882, -0.5975682, 2.237496, 1, 1, 1, 1, 1,
1.957875, -0.4932007, 1.645615, 1, 1, 1, 1, 1,
1.979158, -0.9100069, 0.1785624, 1, 1, 1, 1, 1,
1.986541, 0.5438042, 1.89399, 1, 1, 1, 1, 1,
1.996723, -0.6543432, 2.591157, 1, 1, 1, 1, 1,
2.035761, 1.250942, -0.06447281, 1, 1, 1, 1, 1,
2.036206, 0.6297354, 0.4899368, 1, 1, 1, 1, 1,
2.037493, -0.8924079, 2.863132, 1, 1, 1, 1, 1,
2.050888, 1.48132, 0.839756, 1, 1, 1, 1, 1,
2.071856, 0.2211365, -0.4693049, 1, 1, 1, 1, 1,
2.103062, 3.104983, 0.4994045, 1, 1, 1, 1, 1,
2.149478, 0.8036741, 1.096681, 1, 1, 1, 1, 1,
2.161303, -0.4103178, 2.417616, 1, 1, 1, 1, 1,
2.169125, 0.4532985, 1.14697, 1, 1, 1, 1, 1,
2.172324, 0.08433552, 1.693352, 0, 0, 1, 1, 1,
2.186109, -1.30114, 3.588449, 1, 0, 0, 1, 1,
2.191954, -1.759088, 2.909846, 1, 0, 0, 1, 1,
2.213753, 0.05951634, 0.04218554, 1, 0, 0, 1, 1,
2.238898, -0.8969841, 0.8732125, 1, 0, 0, 1, 1,
2.241161, 0.1420901, 2.127216, 1, 0, 0, 1, 1,
2.283733, -0.223012, 0.8776339, 0, 0, 0, 1, 1,
2.288059, 0.2453769, 1.930446, 0, 0, 0, 1, 1,
2.299663, -2.031829, 2.413816, 0, 0, 0, 1, 1,
2.301661, -1.422932, 2.715678, 0, 0, 0, 1, 1,
2.305489, -0.9317635, 1.752467, 0, 0, 0, 1, 1,
2.322898, 0.8318715, 2.210223, 0, 0, 0, 1, 1,
2.330543, 1.656905, 0.9779657, 0, 0, 0, 1, 1,
2.383022, 1.596705, -0.317723, 1, 1, 1, 1, 1,
2.59852, -1.225407, 2.791787, 1, 1, 1, 1, 1,
2.604068, 0.08819159, 0.2623714, 1, 1, 1, 1, 1,
2.615149, 1.448852, 1.162376, 1, 1, 1, 1, 1,
2.821254, 0.4910229, 2.732574, 1, 1, 1, 1, 1,
3.064855, 1.526681, 0.7213778, 1, 1, 1, 1, 1,
3.474171, -1.401266, 1.197464, 1, 1, 1, 1, 1
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
var radius = 9.347238;
var distance = 32.83178;
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
mvMatrix.translate( -0.2468827, -0.560657, 0.009474754 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.83178);
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
