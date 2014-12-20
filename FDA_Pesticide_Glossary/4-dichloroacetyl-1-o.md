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
-2.950236, -1.275919, -1.511167, 1, 0, 0, 1,
-2.697982, -0.7838398, -3.6847, 1, 0.007843138, 0, 1,
-2.681479, -0.3715585, -0.3216386, 1, 0.01176471, 0, 1,
-2.643311, 0.4164019, 0.2205185, 1, 0.01960784, 0, 1,
-2.605876, -1.814938, -3.34431, 1, 0.02352941, 0, 1,
-2.602668, 0.1312354, -2.29258, 1, 0.03137255, 0, 1,
-2.576298, -0.5868309, -2.792089, 1, 0.03529412, 0, 1,
-2.477069, -0.3190946, -0.7737904, 1, 0.04313726, 0, 1,
-2.428018, 2.238168, 0.1476704, 1, 0.04705882, 0, 1,
-2.38141, -0.7768254, -1.942658, 1, 0.05490196, 0, 1,
-2.378639, -0.9546139, -3.435466, 1, 0.05882353, 0, 1,
-2.262139, 0.4152533, -2.803698, 1, 0.06666667, 0, 1,
-2.244586, -0.6583794, -1.543589, 1, 0.07058824, 0, 1,
-2.222795, -0.001903396, 0.1983993, 1, 0.07843138, 0, 1,
-2.211335, -0.1729544, -0.9732756, 1, 0.08235294, 0, 1,
-2.199949, -1.024809, -2.35079, 1, 0.09019608, 0, 1,
-2.176902, 0.3593085, -0.142499, 1, 0.09411765, 0, 1,
-2.17638, -0.1346577, -3.266387, 1, 0.1019608, 0, 1,
-2.160711, 1.504216, 0.164863, 1, 0.1098039, 0, 1,
-2.117483, 0.9383022, -1.970102, 1, 0.1137255, 0, 1,
-1.941833, 0.2763288, -1.935415, 1, 0.1215686, 0, 1,
-1.937755, 0.6127666, -1.143813, 1, 0.1254902, 0, 1,
-1.934689, -1.70481, -2.470295, 1, 0.1333333, 0, 1,
-1.932501, -0.1249781, -1.699628, 1, 0.1372549, 0, 1,
-1.885512, -1.208678, -4.529292, 1, 0.145098, 0, 1,
-1.846056, 1.449133, -1.606273, 1, 0.1490196, 0, 1,
-1.813456, 0.2012494, -2.318173, 1, 0.1568628, 0, 1,
-1.810328, -0.01452235, -3.071693, 1, 0.1607843, 0, 1,
-1.800323, -0.7143886, -0.006927138, 1, 0.1686275, 0, 1,
-1.799972, -1.766821, -1.232754, 1, 0.172549, 0, 1,
-1.73052, 1.742275, 0.5512931, 1, 0.1803922, 0, 1,
-1.722815, -0.6879173, -1.862071, 1, 0.1843137, 0, 1,
-1.715524, -0.8809472, -1.15254, 1, 0.1921569, 0, 1,
-1.707437, -0.8458325, -0.4882025, 1, 0.1960784, 0, 1,
-1.686588, 0.6243611, -2.392303, 1, 0.2039216, 0, 1,
-1.667693, -0.4761938, -2.187839, 1, 0.2117647, 0, 1,
-1.660778, -1.488321, -1.94206, 1, 0.2156863, 0, 1,
-1.660308, 1.275443, 0.5545408, 1, 0.2235294, 0, 1,
-1.642939, 0.3718971, -2.265802, 1, 0.227451, 0, 1,
-1.608455, -2.068624, -3.459018, 1, 0.2352941, 0, 1,
-1.601692, -0.2319917, -2.924862, 1, 0.2392157, 0, 1,
-1.597941, -1.109715, -2.572322, 1, 0.2470588, 0, 1,
-1.571996, -0.826956, -1.216955, 1, 0.2509804, 0, 1,
-1.565504, -0.5481293, -1.981516, 1, 0.2588235, 0, 1,
-1.565194, -0.6146113, -0.7388306, 1, 0.2627451, 0, 1,
-1.561229, -0.1900236, -2.46255, 1, 0.2705882, 0, 1,
-1.560694, 1.425462, -1.172757, 1, 0.2745098, 0, 1,
-1.535708, -0.2545616, -0.3122658, 1, 0.282353, 0, 1,
-1.534284, -2.10453, -2.525418, 1, 0.2862745, 0, 1,
-1.526739, -0.6623802, 0.4164413, 1, 0.2941177, 0, 1,
-1.524363, -0.6318812, -1.552779, 1, 0.3019608, 0, 1,
-1.52244, -1.646204, -2.989306, 1, 0.3058824, 0, 1,
-1.519171, 0.2787715, -1.009604, 1, 0.3137255, 0, 1,
-1.511945, 1.275141, -1.055836, 1, 0.3176471, 0, 1,
-1.507487, -1.013905, -2.40818, 1, 0.3254902, 0, 1,
-1.50321, -1.239401, -0.8448963, 1, 0.3294118, 0, 1,
-1.483121, -1.225442, -1.509668, 1, 0.3372549, 0, 1,
-1.482937, 0.7863019, -2.385893, 1, 0.3411765, 0, 1,
-1.479012, -0.8247364, -0.2979624, 1, 0.3490196, 0, 1,
-1.475122, 1.34007, 0.8379754, 1, 0.3529412, 0, 1,
-1.474126, -0.3763932, -0.7154757, 1, 0.3607843, 0, 1,
-1.471741, -2.298923, -1.268206, 1, 0.3647059, 0, 1,
-1.471391, -1.81506, -1.044603, 1, 0.372549, 0, 1,
-1.469169, -0.5132951, -2.739176, 1, 0.3764706, 0, 1,
-1.440486, -0.4845798, -1.055726, 1, 0.3843137, 0, 1,
-1.438172, 0.9646311, -1.004531, 1, 0.3882353, 0, 1,
-1.435671, 0.6044718, -0.9679878, 1, 0.3960784, 0, 1,
-1.418849, 0.1729535, -1.272931, 1, 0.4039216, 0, 1,
-1.393931, 1.557313, -2.242598, 1, 0.4078431, 0, 1,
-1.392062, -1.615439, -1.467083, 1, 0.4156863, 0, 1,
-1.389828, -1.542346, -3.329647, 1, 0.4196078, 0, 1,
-1.385545, 0.04830718, -2.408264, 1, 0.427451, 0, 1,
-1.379258, 0.007458244, -0.8414234, 1, 0.4313726, 0, 1,
-1.352434, -2.433633, -3.034428, 1, 0.4392157, 0, 1,
-1.346145, 1.777648, 0.1474528, 1, 0.4431373, 0, 1,
-1.33701, -2.12571, -3.185925, 1, 0.4509804, 0, 1,
-1.330271, 0.05750415, -1.085452, 1, 0.454902, 0, 1,
-1.323021, -1.129997, -1.748832, 1, 0.4627451, 0, 1,
-1.322898, -0.3200558, -1.082688, 1, 0.4666667, 0, 1,
-1.307536, 0.7621292, -1.390431, 1, 0.4745098, 0, 1,
-1.303902, -0.1338311, -1.099492, 1, 0.4784314, 0, 1,
-1.285738, 0.9639941, -1.405668, 1, 0.4862745, 0, 1,
-1.282875, 0.919037, -0.5855297, 1, 0.4901961, 0, 1,
-1.279586, -1.056665, -3.416687, 1, 0.4980392, 0, 1,
-1.275319, 0.561779, -2.894488, 1, 0.5058824, 0, 1,
-1.275218, -0.4705274, -1.517277, 1, 0.509804, 0, 1,
-1.265068, 0.6562442, -1.023947, 1, 0.5176471, 0, 1,
-1.262063, -0.2923833, 0.3924933, 1, 0.5215687, 0, 1,
-1.260421, -1.117923, -1.264771, 1, 0.5294118, 0, 1,
-1.247936, 0.5293654, -1.290424, 1, 0.5333334, 0, 1,
-1.231932, 0.7827929, -0.4783534, 1, 0.5411765, 0, 1,
-1.224211, 2.026623, -2.152764, 1, 0.5450981, 0, 1,
-1.21989, -0.2258112, -0.5317879, 1, 0.5529412, 0, 1,
-1.218679, -0.577372, -2.982898, 1, 0.5568628, 0, 1,
-1.217824, 0.51138, 0.749844, 1, 0.5647059, 0, 1,
-1.216534, -0.3564324, -0.5441201, 1, 0.5686275, 0, 1,
-1.207717, 0.5675399, 1.779058, 1, 0.5764706, 0, 1,
-1.206775, -2.088135, -4.024496, 1, 0.5803922, 0, 1,
-1.204638, 1.334555, -1.546976, 1, 0.5882353, 0, 1,
-1.195049, -0.7614547, -1.725422, 1, 0.5921569, 0, 1,
-1.190543, 2.968888, 0.942082, 1, 0.6, 0, 1,
-1.173938, -1.670402, -1.955171, 1, 0.6078432, 0, 1,
-1.169544, -1.454386, -2.629766, 1, 0.6117647, 0, 1,
-1.14904, 0.6488025, -1.766235, 1, 0.6196079, 0, 1,
-1.137996, -0.8062281, -2.257915, 1, 0.6235294, 0, 1,
-1.13529, 0.4957139, -0.9935295, 1, 0.6313726, 0, 1,
-1.130961, -0.5469565, -1.078909, 1, 0.6352941, 0, 1,
-1.119719, -0.6929661, -3.41865, 1, 0.6431373, 0, 1,
-1.119345, 2.227077, 0.0982011, 1, 0.6470588, 0, 1,
-1.112698, -1.097791, -3.342453, 1, 0.654902, 0, 1,
-1.111243, 0.2187672, -2.362142, 1, 0.6588235, 0, 1,
-1.089452, -0.7328424, -1.148661, 1, 0.6666667, 0, 1,
-1.082403, 1.144557, -3.006591, 1, 0.6705883, 0, 1,
-1.080249, 0.5072708, -1.351572, 1, 0.6784314, 0, 1,
-1.076279, 1.256037, -0.9851049, 1, 0.682353, 0, 1,
-1.069108, -0.2355588, -4.167846, 1, 0.6901961, 0, 1,
-1.060243, 1.061663, -1.365317, 1, 0.6941177, 0, 1,
-1.053956, 0.9404803, -1.116321, 1, 0.7019608, 0, 1,
-1.053358, -1.269767, -3.216758, 1, 0.7098039, 0, 1,
-1.050977, 1.707445, -0.4598393, 1, 0.7137255, 0, 1,
-1.030436, -0.6722587, -0.8120526, 1, 0.7215686, 0, 1,
-1.030205, 1.944063, 0.5379715, 1, 0.7254902, 0, 1,
-1.025682, 0.05677213, -2.132874, 1, 0.7333333, 0, 1,
-1.023294, -0.858333, 0.4016543, 1, 0.7372549, 0, 1,
-1.017545, -1.189925, -1.615888, 1, 0.7450981, 0, 1,
-1.014571, 0.09822372, -1.992912, 1, 0.7490196, 0, 1,
-1.014462, -0.7189428, -3.819738, 1, 0.7568628, 0, 1,
-1.012574, 0.06840716, -0.07851962, 1, 0.7607843, 0, 1,
-1.011642, -1.946398, -2.014362, 1, 0.7686275, 0, 1,
-1.010515, 0.8191385, -1.123722, 1, 0.772549, 0, 1,
-0.9992717, 1.137116, -1.15358, 1, 0.7803922, 0, 1,
-0.9948393, 1.246446, -1.406759, 1, 0.7843137, 0, 1,
-0.9945188, 1.849357, -1.235017, 1, 0.7921569, 0, 1,
-0.9930755, 1.028262, -0.4790773, 1, 0.7960784, 0, 1,
-0.9910172, -0.9280394, -1.872811, 1, 0.8039216, 0, 1,
-0.9905684, 1.56335, 0.3037651, 1, 0.8117647, 0, 1,
-0.9899622, 0.6451555, -0.6307611, 1, 0.8156863, 0, 1,
-0.9878716, 1.491851, 0.3826503, 1, 0.8235294, 0, 1,
-0.9873722, 0.1355591, -2.550176, 1, 0.827451, 0, 1,
-0.9856694, -1.274446, -1.664644, 1, 0.8352941, 0, 1,
-0.9831936, -0.1193056, -1.440217, 1, 0.8392157, 0, 1,
-0.9748667, 2.447735, -1.131485, 1, 0.8470588, 0, 1,
-0.9712754, -0.2324286, 0.08210573, 1, 0.8509804, 0, 1,
-0.9695442, -0.3534168, -3.177659, 1, 0.8588235, 0, 1,
-0.9666299, -1.592858, -2.674335, 1, 0.8627451, 0, 1,
-0.9650761, 1.53919, -2.649168, 1, 0.8705882, 0, 1,
-0.9649457, 0.4335198, -0.6018533, 1, 0.8745098, 0, 1,
-0.9646333, -0.03198556, -1.177524, 1, 0.8823529, 0, 1,
-0.9643115, -0.34679, -3.820546, 1, 0.8862745, 0, 1,
-0.9640906, -3.688029, -2.256616, 1, 0.8941177, 0, 1,
-0.9531179, -2.650449, -2.954933, 1, 0.8980392, 0, 1,
-0.9519685, 0.6300689, 0.2929831, 1, 0.9058824, 0, 1,
-0.9448749, -0.7546778, -3.170291, 1, 0.9137255, 0, 1,
-0.9427772, -0.6817923, -2.153155, 1, 0.9176471, 0, 1,
-0.9392089, -1.223729, -0.9432186, 1, 0.9254902, 0, 1,
-0.9195752, -0.2944361, -2.754, 1, 0.9294118, 0, 1,
-0.9156766, -0.6986886, -4.919469, 1, 0.9372549, 0, 1,
-0.9127794, 0.1670884, -0.8278143, 1, 0.9411765, 0, 1,
-0.9105533, -0.1816717, -1.331688, 1, 0.9490196, 0, 1,
-0.9062059, -0.09184524, -3.176174, 1, 0.9529412, 0, 1,
-0.8825356, -0.6513087, -0.5944119, 1, 0.9607843, 0, 1,
-0.8806316, -0.6924457, -0.1769612, 1, 0.9647059, 0, 1,
-0.8787004, 0.4690644, -0.2842631, 1, 0.972549, 0, 1,
-0.8646135, 2.227739, 0.6573542, 1, 0.9764706, 0, 1,
-0.8630657, 0.1336192, -0.418898, 1, 0.9843137, 0, 1,
-0.8539067, -0.8201998, -2.331872, 1, 0.9882353, 0, 1,
-0.8510136, -1.679562, -2.277959, 1, 0.9960784, 0, 1,
-0.849673, 0.07086365, -1.408406, 0.9960784, 1, 0, 1,
-0.8410925, -0.6577988, -1.424926, 0.9921569, 1, 0, 1,
-0.8400131, 0.8259655, -1.798148, 0.9843137, 1, 0, 1,
-0.8359307, 1.525333, -1.231073, 0.9803922, 1, 0, 1,
-0.8260862, 0.08344885, -0.9462679, 0.972549, 1, 0, 1,
-0.8220351, 0.7508522, 0.3895836, 0.9686275, 1, 0, 1,
-0.814675, -0.1967015, -3.584917, 0.9607843, 1, 0, 1,
-0.8123527, 0.8015959, 0.7023568, 0.9568627, 1, 0, 1,
-0.8123119, 0.4863641, -1.571756, 0.9490196, 1, 0, 1,
-0.8096527, -1.157403, -1.583019, 0.945098, 1, 0, 1,
-0.8081579, -0.2757934, 0.2172136, 0.9372549, 1, 0, 1,
-0.8054045, 1.710533, -1.996636, 0.9333333, 1, 0, 1,
-0.8001514, -0.07483382, -2.164106, 0.9254902, 1, 0, 1,
-0.7967418, -0.6918948, -1.433882, 0.9215686, 1, 0, 1,
-0.7954818, -0.5499617, -3.668251, 0.9137255, 1, 0, 1,
-0.794461, 1.093288, 0.1612548, 0.9098039, 1, 0, 1,
-0.7842504, -0.3924165, -2.328166, 0.9019608, 1, 0, 1,
-0.7820334, 1.549579, 1.928554, 0.8941177, 1, 0, 1,
-0.778518, -0.2877845, -1.514733, 0.8901961, 1, 0, 1,
-0.7779141, 1.868125, 0.3678395, 0.8823529, 1, 0, 1,
-0.7777095, -1.034436, -3.618554, 0.8784314, 1, 0, 1,
-0.7771563, 0.7606352, -2.936589, 0.8705882, 1, 0, 1,
-0.7760933, -1.582951, -4.008875, 0.8666667, 1, 0, 1,
-0.7740915, 0.518328, -2.248445, 0.8588235, 1, 0, 1,
-0.7635524, -0.1822768, -0.7881843, 0.854902, 1, 0, 1,
-0.7613672, -0.4395968, 0.5715149, 0.8470588, 1, 0, 1,
-0.7607117, -3.192985, -4.051939, 0.8431373, 1, 0, 1,
-0.7537426, -0.4357435, -3.466088, 0.8352941, 1, 0, 1,
-0.7479023, 0.01377477, -2.71219, 0.8313726, 1, 0, 1,
-0.7429007, -0.9586013, -1.851502, 0.8235294, 1, 0, 1,
-0.7397615, -0.3366749, -3.722354, 0.8196079, 1, 0, 1,
-0.7304221, -0.07247512, -2.550019, 0.8117647, 1, 0, 1,
-0.7269941, -1.405634, -2.517775, 0.8078431, 1, 0, 1,
-0.723568, -0.599322, -1.9377, 0.8, 1, 0, 1,
-0.7139969, -2.307192, -2.901642, 0.7921569, 1, 0, 1,
-0.7069075, 0.9033838, -0.2703125, 0.7882353, 1, 0, 1,
-0.7064897, 0.5304394, -0.725651, 0.7803922, 1, 0, 1,
-0.6992404, -1.637994, -3.39926, 0.7764706, 1, 0, 1,
-0.6980813, 1.066683, -2.375671, 0.7686275, 1, 0, 1,
-0.6974304, 0.7153507, -0.4848371, 0.7647059, 1, 0, 1,
-0.6969942, -0.4502423, -1.925956, 0.7568628, 1, 0, 1,
-0.6948648, 0.4237328, -0.2943618, 0.7529412, 1, 0, 1,
-0.693154, -1.336989, -3.754307, 0.7450981, 1, 0, 1,
-0.6930324, -0.7412391, -3.389108, 0.7411765, 1, 0, 1,
-0.6920989, -0.9124456, -1.669941, 0.7333333, 1, 0, 1,
-0.6909464, 0.261496, -2.784769, 0.7294118, 1, 0, 1,
-0.6898535, 0.9719905, -0.7259636, 0.7215686, 1, 0, 1,
-0.6860862, 2.114649, 1.251839, 0.7176471, 1, 0, 1,
-0.6825733, -0.6527406, -0.224302, 0.7098039, 1, 0, 1,
-0.6714418, -1.557949, -3.606707, 0.7058824, 1, 0, 1,
-0.6710837, -0.07001299, -1.610499, 0.6980392, 1, 0, 1,
-0.6703671, -0.6419973, -1.670486, 0.6901961, 1, 0, 1,
-0.6685048, -0.3338447, -2.244199, 0.6862745, 1, 0, 1,
-0.66544, -1.021412, -2.20873, 0.6784314, 1, 0, 1,
-0.6633807, -0.1814704, -2.240684, 0.6745098, 1, 0, 1,
-0.6606594, -0.2339475, -3.502769, 0.6666667, 1, 0, 1,
-0.6597938, 0.1301207, -0.1865002, 0.6627451, 1, 0, 1,
-0.6585596, -0.4151079, -1.568448, 0.654902, 1, 0, 1,
-0.6565606, 1.208079, -0.7039123, 0.6509804, 1, 0, 1,
-0.6551923, 1.043946, -0.934974, 0.6431373, 1, 0, 1,
-0.6528754, 0.9837998, -0.9357439, 0.6392157, 1, 0, 1,
-0.6506717, 0.6748016, -0.5029071, 0.6313726, 1, 0, 1,
-0.643222, -0.3160802, -1.689716, 0.627451, 1, 0, 1,
-0.6371676, 0.9896021, 0.5191025, 0.6196079, 1, 0, 1,
-0.636986, -1.238339, -2.754419, 0.6156863, 1, 0, 1,
-0.6340641, 0.4975899, -0.7858576, 0.6078432, 1, 0, 1,
-0.633726, -0.5662041, -1.69945, 0.6039216, 1, 0, 1,
-0.6287595, 1.386331, -1.994718, 0.5960785, 1, 0, 1,
-0.6281033, 0.8073783, -0.06686128, 0.5882353, 1, 0, 1,
-0.6251033, 1.050399, -2.054259, 0.5843138, 1, 0, 1,
-0.6220527, -0.6127325, -1.559059, 0.5764706, 1, 0, 1,
-0.6217172, -0.7803564, -3.266388, 0.572549, 1, 0, 1,
-0.6212296, -0.4447078, -0.3254045, 0.5647059, 1, 0, 1,
-0.6169408, 0.8858019, 0.4024025, 0.5607843, 1, 0, 1,
-0.6166495, -0.1823783, -1.998301, 0.5529412, 1, 0, 1,
-0.616393, -1.846447, -2.260834, 0.5490196, 1, 0, 1,
-0.6131232, 0.2087662, -3.148717, 0.5411765, 1, 0, 1,
-0.6124765, -0.9976048, -1.116668, 0.5372549, 1, 0, 1,
-0.6104331, -1.167752, -2.655515, 0.5294118, 1, 0, 1,
-0.6015927, 1.23356, 0.04699273, 0.5254902, 1, 0, 1,
-0.588194, -1.154948, -3.109047, 0.5176471, 1, 0, 1,
-0.586477, -0.7751581, -0.7071182, 0.5137255, 1, 0, 1,
-0.5863463, -0.9767398, -2.999664, 0.5058824, 1, 0, 1,
-0.5837787, -1.341269, -2.141584, 0.5019608, 1, 0, 1,
-0.5812618, 0.03065723, -1.990574, 0.4941176, 1, 0, 1,
-0.5795632, -0.01412109, -2.603632, 0.4862745, 1, 0, 1,
-0.5752988, 0.2149252, -0.4519138, 0.4823529, 1, 0, 1,
-0.5746417, 0.3872056, -1.067841, 0.4745098, 1, 0, 1,
-0.5728938, 2.044473, 0.6967559, 0.4705882, 1, 0, 1,
-0.5688121, -0.05559529, -1.463741, 0.4627451, 1, 0, 1,
-0.5681233, 0.1100126, -2.07919, 0.4588235, 1, 0, 1,
-0.5629439, -0.3028908, -1.222962, 0.4509804, 1, 0, 1,
-0.5566831, 2.123575, -1.1903, 0.4470588, 1, 0, 1,
-0.554342, -0.5408181, -3.180023, 0.4392157, 1, 0, 1,
-0.5508605, 0.2569498, -1.835809, 0.4352941, 1, 0, 1,
-0.5461565, 1.508752, -0.8278536, 0.427451, 1, 0, 1,
-0.5386854, -0.8499321, -3.835873, 0.4235294, 1, 0, 1,
-0.53313, 0.06688016, -0.751002, 0.4156863, 1, 0, 1,
-0.5305275, -1.167087, -2.392097, 0.4117647, 1, 0, 1,
-0.5253148, 1.228301, 0.5969408, 0.4039216, 1, 0, 1,
-0.5250223, -0.4765432, -1.155494, 0.3960784, 1, 0, 1,
-0.517993, 0.8275114, -1.98027, 0.3921569, 1, 0, 1,
-0.5023046, 0.5390762, -2.050404, 0.3843137, 1, 0, 1,
-0.5016997, -1.411145, -4.664203, 0.3803922, 1, 0, 1,
-0.5004658, 0.2525086, -0.2168027, 0.372549, 1, 0, 1,
-0.4941123, -0.9074915, -1.316294, 0.3686275, 1, 0, 1,
-0.4904702, 1.198216, -1.552763, 0.3607843, 1, 0, 1,
-0.4860739, 1.706496, -0.2622715, 0.3568628, 1, 0, 1,
-0.4830074, -0.3601658, -2.076674, 0.3490196, 1, 0, 1,
-0.4748214, 0.2833723, -0.6098232, 0.345098, 1, 0, 1,
-0.4705273, -0.384361, -1.035596, 0.3372549, 1, 0, 1,
-0.4678621, -0.7960642, -2.967521, 0.3333333, 1, 0, 1,
-0.4675955, -1.391424, -2.104303, 0.3254902, 1, 0, 1,
-0.4644625, 0.1045269, -2.472277, 0.3215686, 1, 0, 1,
-0.4597263, -0.6021544, -2.604462, 0.3137255, 1, 0, 1,
-0.4583024, -0.01923167, -2.453307, 0.3098039, 1, 0, 1,
-0.4571584, 0.03928101, -1.621793, 0.3019608, 1, 0, 1,
-0.4547399, 0.4578509, -0.04945629, 0.2941177, 1, 0, 1,
-0.447898, -0.607546, -2.545646, 0.2901961, 1, 0, 1,
-0.4440142, -0.4216384, -2.200681, 0.282353, 1, 0, 1,
-0.4421856, 1.646275, 1.04169, 0.2784314, 1, 0, 1,
-0.4379807, 0.6353993, -0.2354037, 0.2705882, 1, 0, 1,
-0.4347168, 0.1002683, 0.2634766, 0.2666667, 1, 0, 1,
-0.433943, -0.5212228, -3.615049, 0.2588235, 1, 0, 1,
-0.4320306, -0.9351971, -2.643152, 0.254902, 1, 0, 1,
-0.4227274, 0.03166627, -2.273626, 0.2470588, 1, 0, 1,
-0.4179066, -0.4420419, -3.791547, 0.2431373, 1, 0, 1,
-0.4178795, 1.009659, -2.252993, 0.2352941, 1, 0, 1,
-0.4178175, 0.7665764, 1.058237, 0.2313726, 1, 0, 1,
-0.4159498, 0.440702, -0.6333784, 0.2235294, 1, 0, 1,
-0.4147269, -2.223204, -3.738543, 0.2196078, 1, 0, 1,
-0.4140176, -1.145187, -2.103545, 0.2117647, 1, 0, 1,
-0.4124725, -0.7843516, -3.724775, 0.2078431, 1, 0, 1,
-0.4093011, -0.2067576, -2.702398, 0.2, 1, 0, 1,
-0.4090602, -0.1040401, -1.937672, 0.1921569, 1, 0, 1,
-0.3962772, 1.7591, 1.836713, 0.1882353, 1, 0, 1,
-0.3960516, 0.1019173, -2.912995, 0.1803922, 1, 0, 1,
-0.3943391, -2.068636, -5.340398, 0.1764706, 1, 0, 1,
-0.3919993, -1.48998, -3.423412, 0.1686275, 1, 0, 1,
-0.391092, 1.411309, -0.4739545, 0.1647059, 1, 0, 1,
-0.3876606, 0.04790045, 0.3325835, 0.1568628, 1, 0, 1,
-0.3859126, -1.333248, -3.684489, 0.1529412, 1, 0, 1,
-0.3820015, -0.9366632, -2.056378, 0.145098, 1, 0, 1,
-0.3792813, 1.236751, 0.9454873, 0.1411765, 1, 0, 1,
-0.3785441, 0.4227966, -1.425473, 0.1333333, 1, 0, 1,
-0.378293, -0.2946359, -2.728143, 0.1294118, 1, 0, 1,
-0.3740991, -1.443504, -0.2941583, 0.1215686, 1, 0, 1,
-0.3709777, -0.8816867, -2.741774, 0.1176471, 1, 0, 1,
-0.3675749, -0.01299451, -1.974061, 0.1098039, 1, 0, 1,
-0.3611573, -0.9297501, -1.692722, 0.1058824, 1, 0, 1,
-0.3578631, 0.2517096, -2.00613, 0.09803922, 1, 0, 1,
-0.3572177, -0.9329675, -3.346029, 0.09019608, 1, 0, 1,
-0.357154, 2.19958, -0.03826853, 0.08627451, 1, 0, 1,
-0.3562757, 0.9785426, -0.1588828, 0.07843138, 1, 0, 1,
-0.3558728, -0.3559746, -3.185467, 0.07450981, 1, 0, 1,
-0.3522628, -1.205121, -3.749126, 0.06666667, 1, 0, 1,
-0.3519563, -1.396856, -3.592655, 0.0627451, 1, 0, 1,
-0.3482248, 0.6485276, 0.4565017, 0.05490196, 1, 0, 1,
-0.348216, 1.299325, 0.9755077, 0.05098039, 1, 0, 1,
-0.3428896, 0.3323658, 0.0909328, 0.04313726, 1, 0, 1,
-0.3411663, 0.2124375, -0.854512, 0.03921569, 1, 0, 1,
-0.3394911, -0.3838547, -2.93425, 0.03137255, 1, 0, 1,
-0.3375658, -1.12407, -2.899722, 0.02745098, 1, 0, 1,
-0.3308693, -0.4612824, -3.088747, 0.01960784, 1, 0, 1,
-0.3290386, 0.3505042, 0.02619745, 0.01568628, 1, 0, 1,
-0.3270063, 1.933765, 0.4755026, 0.007843138, 1, 0, 1,
-0.325812, -0.08691126, -2.195037, 0.003921569, 1, 0, 1,
-0.3256163, 0.3078218, -2.445793, 0, 1, 0.003921569, 1,
-0.3250041, -0.3253585, -2.057187, 0, 1, 0.01176471, 1,
-0.3242131, 0.4954748, -1.305449, 0, 1, 0.01568628, 1,
-0.3238749, 1.09019, -0.9865535, 0, 1, 0.02352941, 1,
-0.3237672, -0.7737613, -3.112381, 0, 1, 0.02745098, 1,
-0.319309, -0.2977639, -0.6128829, 0, 1, 0.03529412, 1,
-0.3172494, 1.129874, 0.2729636, 0, 1, 0.03921569, 1,
-0.3160883, 0.7791373, -1.205282, 0, 1, 0.04705882, 1,
-0.3150046, -0.1688507, -1.748645, 0, 1, 0.05098039, 1,
-0.3146567, -0.2008747, -4.484613, 0, 1, 0.05882353, 1,
-0.3124263, 0.3240963, 0.1451795, 0, 1, 0.0627451, 1,
-0.311496, -1.336122, -3.542465, 0, 1, 0.07058824, 1,
-0.3090142, -1.517293, -3.493084, 0, 1, 0.07450981, 1,
-0.304781, -1.064163, -2.78803, 0, 1, 0.08235294, 1,
-0.2968911, 1.137586, 1.192859, 0, 1, 0.08627451, 1,
-0.2945834, 0.6201854, 1.231387, 0, 1, 0.09411765, 1,
-0.2929853, 0.17661, -1.282368, 0, 1, 0.1019608, 1,
-0.2922855, -1.477145, -5.386618, 0, 1, 0.1058824, 1,
-0.2904632, 2.516176, 1.020115, 0, 1, 0.1137255, 1,
-0.2903726, 0.9978636, -0.9978309, 0, 1, 0.1176471, 1,
-0.2862846, 0.1361495, 0.7867022, 0, 1, 0.1254902, 1,
-0.279456, -0.7395177, -3.230877, 0, 1, 0.1294118, 1,
-0.2786087, 0.3953903, -0.5178047, 0, 1, 0.1372549, 1,
-0.276386, -0.2018932, -2.520833, 0, 1, 0.1411765, 1,
-0.2736258, -1.39362, -3.416547, 0, 1, 0.1490196, 1,
-0.2690336, -0.9631889, -2.227975, 0, 1, 0.1529412, 1,
-0.2646645, -0.7838089, -3.721864, 0, 1, 0.1607843, 1,
-0.2639746, -1.441981, -2.679775, 0, 1, 0.1647059, 1,
-0.2635141, -1.611088, -4.755706, 0, 1, 0.172549, 1,
-0.2625028, -1.084985, -1.906614, 0, 1, 0.1764706, 1,
-0.2604082, 0.7133762, -0.42928, 0, 1, 0.1843137, 1,
-0.2603183, 1.332106, -0.7383922, 0, 1, 0.1882353, 1,
-0.2541274, 2.641123, 1.529131, 0, 1, 0.1960784, 1,
-0.2502553, -0.8055993, -3.273541, 0, 1, 0.2039216, 1,
-0.2492539, 1.736329, 1.398565, 0, 1, 0.2078431, 1,
-0.2452165, 0.8975467, 0.1530991, 0, 1, 0.2156863, 1,
-0.2416023, -0.3157642, -1.64811, 0, 1, 0.2196078, 1,
-0.2407597, -0.7191355, -3.322106, 0, 1, 0.227451, 1,
-0.2402239, 0.7267249, -0.3498415, 0, 1, 0.2313726, 1,
-0.2389036, -0.9746992, -2.376539, 0, 1, 0.2392157, 1,
-0.236218, 0.3238112, -0.4970837, 0, 1, 0.2431373, 1,
-0.2360659, -0.3268603, -3.208359, 0, 1, 0.2509804, 1,
-0.2294391, 0.5745749, 0.7903873, 0, 1, 0.254902, 1,
-0.2281188, -0.5304672, -4.185001, 0, 1, 0.2627451, 1,
-0.2276159, 1.082238, -0.8161151, 0, 1, 0.2666667, 1,
-0.2225241, -0.8418469, -3.804678, 0, 1, 0.2745098, 1,
-0.2225099, -1.363472, -3.423114, 0, 1, 0.2784314, 1,
-0.2218965, -0.487654, -1.970026, 0, 1, 0.2862745, 1,
-0.2213464, -0.5096925, -2.77487, 0, 1, 0.2901961, 1,
-0.2168976, 0.1331645, -1.615715, 0, 1, 0.2980392, 1,
-0.2149695, -0.05271444, -1.659653, 0, 1, 0.3058824, 1,
-0.2146822, 0.2179882, 0.908454, 0, 1, 0.3098039, 1,
-0.2124957, -0.04184367, -1.998547, 0, 1, 0.3176471, 1,
-0.2079852, 0.8027093, -0.6533929, 0, 1, 0.3215686, 1,
-0.2060873, -0.6573678, -4.929168, 0, 1, 0.3294118, 1,
-0.2028146, -1.594864, -4.89991, 0, 1, 0.3333333, 1,
-0.193221, 0.858449, -1.290465, 0, 1, 0.3411765, 1,
-0.1898326, 0.2058875, 0.09765347, 0, 1, 0.345098, 1,
-0.1876579, -0.06173643, -1.268999, 0, 1, 0.3529412, 1,
-0.18451, -0.5041438, -3.166359, 0, 1, 0.3568628, 1,
-0.1780614, 0.4040463, -1.20009, 0, 1, 0.3647059, 1,
-0.1751945, 0.1503396, -2.49421, 0, 1, 0.3686275, 1,
-0.1734979, 1.511485, 0.5088625, 0, 1, 0.3764706, 1,
-0.1714936, 0.02897652, -1.965581, 0, 1, 0.3803922, 1,
-0.16869, 1.652959, -1.155, 0, 1, 0.3882353, 1,
-0.1680496, -0.2001768, -3.432637, 0, 1, 0.3921569, 1,
-0.165812, -0.9351639, -2.390603, 0, 1, 0.4, 1,
-0.1644541, -0.8234118, -2.855056, 0, 1, 0.4078431, 1,
-0.1641306, -0.2590018, -2.266571, 0, 1, 0.4117647, 1,
-0.1607956, -0.772836, -2.128412, 0, 1, 0.4196078, 1,
-0.1557955, 0.07230912, 0.3143339, 0, 1, 0.4235294, 1,
-0.155449, -0.699333, -4.240899, 0, 1, 0.4313726, 1,
-0.1467398, -1.168787, -2.920783, 0, 1, 0.4352941, 1,
-0.1426573, 0.1387616, -1.303036, 0, 1, 0.4431373, 1,
-0.1375591, -0.7476187, -3.85658, 0, 1, 0.4470588, 1,
-0.1366785, 0.2299708, 0.05032883, 0, 1, 0.454902, 1,
-0.1361358, 1.325552, 0.003231563, 0, 1, 0.4588235, 1,
-0.1356356, -0.8808645, -4.025421, 0, 1, 0.4666667, 1,
-0.1347575, 1.64745, 0.8204809, 0, 1, 0.4705882, 1,
-0.1296869, -0.9344282, -1.995003, 0, 1, 0.4784314, 1,
-0.1291501, -0.4845193, -3.093386, 0, 1, 0.4823529, 1,
-0.1276993, 0.2976148, -0.9115663, 0, 1, 0.4901961, 1,
-0.126091, -0.0743847, -2.273193, 0, 1, 0.4941176, 1,
-0.1208487, -0.4278679, -1.521839, 0, 1, 0.5019608, 1,
-0.1201896, 0.03995198, 0.4899411, 0, 1, 0.509804, 1,
-0.1196868, -1.130274, -2.396445, 0, 1, 0.5137255, 1,
-0.1174524, 1.548297, -0.8830052, 0, 1, 0.5215687, 1,
-0.1090309, 2.194131, -0.419281, 0, 1, 0.5254902, 1,
-0.1037925, 0.4603592, 0.01628331, 0, 1, 0.5333334, 1,
-0.1033475, 1.903362, -0.7687026, 0, 1, 0.5372549, 1,
-0.1018841, -0.4967336, -2.627405, 0, 1, 0.5450981, 1,
-0.1014062, -0.9486814, -5.157478, 0, 1, 0.5490196, 1,
-0.09880581, 0.5996771, -0.3663574, 0, 1, 0.5568628, 1,
-0.09154214, 0.008458738, -0.6144835, 0, 1, 0.5607843, 1,
-0.09118324, 0.5357778, -0.3831881, 0, 1, 0.5686275, 1,
-0.08566967, -1.555762, -3.818183, 0, 1, 0.572549, 1,
-0.08379429, 0.3880497, -0.9498282, 0, 1, 0.5803922, 1,
-0.07241624, -0.5457193, -3.473265, 0, 1, 0.5843138, 1,
-0.07127687, 0.005942867, -2.180279, 0, 1, 0.5921569, 1,
-0.0678689, 0.390828, 0.07555507, 0, 1, 0.5960785, 1,
-0.06212597, -1.872211, -2.404883, 0, 1, 0.6039216, 1,
-0.05818747, -0.4928491, -4.346638, 0, 1, 0.6117647, 1,
-0.05725332, 2.440815, -0.4309273, 0, 1, 0.6156863, 1,
-0.05247155, 1.061928, 0.8017542, 0, 1, 0.6235294, 1,
-0.05128618, 0.870515, -1.176263, 0, 1, 0.627451, 1,
-0.04759831, -1.060387, -5.250598, 0, 1, 0.6352941, 1,
-0.04710883, 0.1903743, -0.6738483, 0, 1, 0.6392157, 1,
-0.04619997, 0.3046635, 0.8045259, 0, 1, 0.6470588, 1,
-0.04480403, -0.6781512, -3.189877, 0, 1, 0.6509804, 1,
-0.04069661, -1.044954, -2.811458, 0, 1, 0.6588235, 1,
-0.03806758, -0.5740628, -1.922032, 0, 1, 0.6627451, 1,
-0.03314701, 0.2352723, 1.049574, 0, 1, 0.6705883, 1,
-0.0317401, 0.7187858, 0.4352563, 0, 1, 0.6745098, 1,
-0.03112537, 1.066656, 1.088887, 0, 1, 0.682353, 1,
-0.02565965, 0.3989719, -0.3105828, 0, 1, 0.6862745, 1,
-0.02426738, -1.070698, -3.011969, 0, 1, 0.6941177, 1,
-0.02426049, 0.07120445, 1.29495, 0, 1, 0.7019608, 1,
-0.02390183, -1.278641, -4.779055, 0, 1, 0.7058824, 1,
-0.02132708, -0.7966532, -2.287237, 0, 1, 0.7137255, 1,
-0.01896879, -0.1487431, -2.54679, 0, 1, 0.7176471, 1,
-0.01558767, 0.7909438, 0.3958994, 0, 1, 0.7254902, 1,
-0.01303008, 1.460884, 0.600082, 0, 1, 0.7294118, 1,
-0.01251636, 1.671604, 1.311516, 0, 1, 0.7372549, 1,
-0.0121079, -0.2665114, -2.213487, 0, 1, 0.7411765, 1,
-0.009929405, -1.897559, -4.011836, 0, 1, 0.7490196, 1,
-0.009928407, -0.4964792, -2.736341, 0, 1, 0.7529412, 1,
-0.008957541, 0.4219256, 1.111163, 0, 1, 0.7607843, 1,
-0.007627884, 0.6049914, -1.177796, 0, 1, 0.7647059, 1,
-0.004413076, 1.946502, 1.271061, 0, 1, 0.772549, 1,
-0.001896334, -0.4715102, -3.610119, 0, 1, 0.7764706, 1,
0.00246573, 0.6858152, 1.537312, 0, 1, 0.7843137, 1,
0.004133841, 0.7356452, -0.4925835, 0, 1, 0.7882353, 1,
0.00705004, 1.866107, -0.335386, 0, 1, 0.7960784, 1,
0.01398403, 1.226593, 1.718621, 0, 1, 0.8039216, 1,
0.01896801, -1.021502, 3.348417, 0, 1, 0.8078431, 1,
0.01954388, 1.129003, -0.2443619, 0, 1, 0.8156863, 1,
0.0197025, 1.146155, -1.170979, 0, 1, 0.8196079, 1,
0.02176041, 0.05564378, 0.3827087, 0, 1, 0.827451, 1,
0.02225952, 0.1129721, 1.325044, 0, 1, 0.8313726, 1,
0.02329398, 0.2552878, -0.8335453, 0, 1, 0.8392157, 1,
0.02822072, -0.1156511, 3.121528, 0, 1, 0.8431373, 1,
0.02839759, 1.807551, 0.6513836, 0, 1, 0.8509804, 1,
0.02894602, -0.3539629, 3.074812, 0, 1, 0.854902, 1,
0.03091636, -1.516714, 3.684619, 0, 1, 0.8627451, 1,
0.03277902, -0.9767848, 3.910959, 0, 1, 0.8666667, 1,
0.03995446, 0.1228814, 1.189268, 0, 1, 0.8745098, 1,
0.04241294, 0.6304768, 1.330372, 0, 1, 0.8784314, 1,
0.0445142, -1.118973, 3.803128, 0, 1, 0.8862745, 1,
0.04480183, -1.934168, 1.643727, 0, 1, 0.8901961, 1,
0.04709278, -0.2351124, 4.959629, 0, 1, 0.8980392, 1,
0.04712272, 0.4758745, 0.3212667, 0, 1, 0.9058824, 1,
0.04914816, 0.5406523, -1.788277, 0, 1, 0.9098039, 1,
0.05081159, -0.3709289, 3.91354, 0, 1, 0.9176471, 1,
0.05296248, 0.03944345, 0.5963389, 0, 1, 0.9215686, 1,
0.05489555, 0.2422748, 1.598369, 0, 1, 0.9294118, 1,
0.05549592, -0.5562416, 2.617196, 0, 1, 0.9333333, 1,
0.05672434, 1.032223, -0.8484178, 0, 1, 0.9411765, 1,
0.06279138, 0.1421253, 1.023519, 0, 1, 0.945098, 1,
0.06628458, 1.367791, 1.503319, 0, 1, 0.9529412, 1,
0.06734291, -0.3018349, 3.301784, 0, 1, 0.9568627, 1,
0.0684596, 0.8248172, -0.1684975, 0, 1, 0.9647059, 1,
0.07022181, 0.2110577, 0.2266715, 0, 1, 0.9686275, 1,
0.07029588, 0.8708352, 0.05449938, 0, 1, 0.9764706, 1,
0.07175283, 0.9857815, -0.4965806, 0, 1, 0.9803922, 1,
0.07256324, 0.8188146, -0.08465159, 0, 1, 0.9882353, 1,
0.07833243, 0.05019195, 0.2508231, 0, 1, 0.9921569, 1,
0.09290314, -0.00452126, 2.734129, 0, 1, 1, 1,
0.09293465, -0.3627655, 3.553084, 0, 0.9921569, 1, 1,
0.0937183, -1.370448, 4.043201, 0, 0.9882353, 1, 1,
0.09376708, -0.7490516, 2.839097, 0, 0.9803922, 1, 1,
0.09515452, 0.4490092, -0.7427845, 0, 0.9764706, 1, 1,
0.09578454, -1.425548, 2.681442, 0, 0.9686275, 1, 1,
0.09586085, -1.69205, 3.682807, 0, 0.9647059, 1, 1,
0.09776741, 0.4331911, 0.7073038, 0, 0.9568627, 1, 1,
0.09897152, 2.317169, -1.011837, 0, 0.9529412, 1, 1,
0.1032981, -0.5548397, 4.614222, 0, 0.945098, 1, 1,
0.1055866, 0.5180305, 0.8544602, 0, 0.9411765, 1, 1,
0.1129108, 1.463228, 0.06618346, 0, 0.9333333, 1, 1,
0.1133941, -0.02217419, 1.294716, 0, 0.9294118, 1, 1,
0.1142444, -0.01371392, -0.04541873, 0, 0.9215686, 1, 1,
0.1187438, 1.018259, 0.8298212, 0, 0.9176471, 1, 1,
0.1188717, -0.2444322, 1.579817, 0, 0.9098039, 1, 1,
0.1198662, 0.5032358, 0.8863708, 0, 0.9058824, 1, 1,
0.1210331, -0.5191897, 0.4893432, 0, 0.8980392, 1, 1,
0.1292106, 1.336579, 0.8444673, 0, 0.8901961, 1, 1,
0.1305009, 0.01784117, 2.670203, 0, 0.8862745, 1, 1,
0.1309719, -1.801599, 2.958558, 0, 0.8784314, 1, 1,
0.132081, 0.8252416, 2.334361, 0, 0.8745098, 1, 1,
0.1323248, 0.1730432, 2.141658, 0, 0.8666667, 1, 1,
0.1325493, -1.217148, 2.124613, 0, 0.8627451, 1, 1,
0.1328359, 1.130368, 0.6382657, 0, 0.854902, 1, 1,
0.1331246, 0.734535, 1.721946, 0, 0.8509804, 1, 1,
0.1366088, -0.3510891, 1.053193, 0, 0.8431373, 1, 1,
0.138346, -0.5784382, 2.197856, 0, 0.8392157, 1, 1,
0.1390451, -0.2571726, 1.852141, 0, 0.8313726, 1, 1,
0.1429235, -0.4473563, 1.439245, 0, 0.827451, 1, 1,
0.1447949, -0.4117557, 3.180368, 0, 0.8196079, 1, 1,
0.1488498, 0.2488567, 0.4140593, 0, 0.8156863, 1, 1,
0.149297, 0.1605162, 0.5199919, 0, 0.8078431, 1, 1,
0.1520377, -0.6190239, 2.431287, 0, 0.8039216, 1, 1,
0.1548746, -1.104601, 4.423739, 0, 0.7960784, 1, 1,
0.1577533, 1.850995, 0.0002733404, 0, 0.7882353, 1, 1,
0.1585566, -0.6251976, 2.52734, 0, 0.7843137, 1, 1,
0.1640587, -2.808203, 3.186054, 0, 0.7764706, 1, 1,
0.1655298, 0.1624896, -0.743329, 0, 0.772549, 1, 1,
0.1669676, 0.3219253, 1.727432, 0, 0.7647059, 1, 1,
0.1732859, 0.4733549, -1.624912, 0, 0.7607843, 1, 1,
0.1837022, 0.2261839, 1.053642, 0, 0.7529412, 1, 1,
0.186594, -0.4751995, 3.197691, 0, 0.7490196, 1, 1,
0.1866554, 0.9411547, 1.887322, 0, 0.7411765, 1, 1,
0.1868452, 0.05253214, 1.639959, 0, 0.7372549, 1, 1,
0.1878477, 0.06214144, 0.9235761, 0, 0.7294118, 1, 1,
0.1891321, 1.355835, -0.6909773, 0, 0.7254902, 1, 1,
0.1891728, -1.953763, 3.359127, 0, 0.7176471, 1, 1,
0.1966714, 2.166395, -0.5735672, 0, 0.7137255, 1, 1,
0.1997289, 0.8452961, -1.030739, 0, 0.7058824, 1, 1,
0.200412, 0.2796944, 0.7921959, 0, 0.6980392, 1, 1,
0.2004175, -1.058834, 1.881502, 0, 0.6941177, 1, 1,
0.2148196, 0.6346169, 1.558762, 0, 0.6862745, 1, 1,
0.2172105, 1.443806, 1.873586, 0, 0.682353, 1, 1,
0.2222786, 1.521981, 0.7520004, 0, 0.6745098, 1, 1,
0.224703, 0.2012397, 0.8892617, 0, 0.6705883, 1, 1,
0.2254289, 0.04796642, 2.146228, 0, 0.6627451, 1, 1,
0.225877, 0.4548257, 2.887404, 0, 0.6588235, 1, 1,
0.2316105, -0.6570272, 0.8172114, 0, 0.6509804, 1, 1,
0.2346373, -0.5854364, 4.114407, 0, 0.6470588, 1, 1,
0.2375001, 1.324954, -1.014631, 0, 0.6392157, 1, 1,
0.2382444, 0.3007487, -0.2375728, 0, 0.6352941, 1, 1,
0.2398954, -0.04200733, 2.512885, 0, 0.627451, 1, 1,
0.2409702, 0.3942307, 0.7268336, 0, 0.6235294, 1, 1,
0.2440765, -1.364341, 3.212146, 0, 0.6156863, 1, 1,
0.2499678, 0.4968696, -0.01689068, 0, 0.6117647, 1, 1,
0.2553794, -0.6325399, 2.406927, 0, 0.6039216, 1, 1,
0.2558423, 2.508501, 0.8953772, 0, 0.5960785, 1, 1,
0.2559915, -0.3647796, 1.81998, 0, 0.5921569, 1, 1,
0.2584089, -1.244092, 2.531099, 0, 0.5843138, 1, 1,
0.2624687, 0.9428473, -0.6742586, 0, 0.5803922, 1, 1,
0.265403, 2.689785, -0.9735447, 0, 0.572549, 1, 1,
0.2663313, -1.907007, 2.998609, 0, 0.5686275, 1, 1,
0.2665042, -1.575556, 3.413584, 0, 0.5607843, 1, 1,
0.274875, 0.3907834, 0.5780678, 0, 0.5568628, 1, 1,
0.2809041, -0.2285368, 2.077799, 0, 0.5490196, 1, 1,
0.2858798, 2.96062, 0.08173119, 0, 0.5450981, 1, 1,
0.288744, -0.1048656, 1.241153, 0, 0.5372549, 1, 1,
0.2914724, 0.5325426, 0.05855295, 0, 0.5333334, 1, 1,
0.2923786, 0.7165325, 1.038755, 0, 0.5254902, 1, 1,
0.2926568, 0.2625344, 0.2813569, 0, 0.5215687, 1, 1,
0.3022039, 0.4602713, 0.3666124, 0, 0.5137255, 1, 1,
0.3023553, 2.299079, -0.1675156, 0, 0.509804, 1, 1,
0.3052275, 0.3264448, 1.711503, 0, 0.5019608, 1, 1,
0.3064775, 1.17564, 0.09010436, 0, 0.4941176, 1, 1,
0.3066555, -0.7289342, 2.84482, 0, 0.4901961, 1, 1,
0.3086458, -0.1441614, 1.511697, 0, 0.4823529, 1, 1,
0.3131882, 0.8573859, -1.275732, 0, 0.4784314, 1, 1,
0.3159478, -0.049014, 1.531172, 0, 0.4705882, 1, 1,
0.3161927, 1.071592, -0.5611869, 0, 0.4666667, 1, 1,
0.3185041, 1.837599, -2.271278, 0, 0.4588235, 1, 1,
0.3193762, 0.3982641, 1.381165, 0, 0.454902, 1, 1,
0.3202216, 0.5619127, 1.397909, 0, 0.4470588, 1, 1,
0.3209192, 0.6192395, -0.1105042, 0, 0.4431373, 1, 1,
0.3233089, -0.7409748, 3.212987, 0, 0.4352941, 1, 1,
0.3263526, -0.8080125, 3.149714, 0, 0.4313726, 1, 1,
0.3278315, -0.4890713, 2.961773, 0, 0.4235294, 1, 1,
0.3335896, -2.456965, 3.108596, 0, 0.4196078, 1, 1,
0.3336199, 1.054748, -0.2991108, 0, 0.4117647, 1, 1,
0.3337501, -1.282548, 2.990497, 0, 0.4078431, 1, 1,
0.3362252, 1.183092, -1.09211, 0, 0.4, 1, 1,
0.337676, 0.01450517, 0.9741288, 0, 0.3921569, 1, 1,
0.3408307, -0.2802154, 3.347349, 0, 0.3882353, 1, 1,
0.3427868, 0.341706, -0.6167289, 0, 0.3803922, 1, 1,
0.346573, 0.6909727, 1.188939, 0, 0.3764706, 1, 1,
0.3474799, 1.26874, 2.023355, 0, 0.3686275, 1, 1,
0.349187, 1.86277, 0.6289813, 0, 0.3647059, 1, 1,
0.3491996, -0.340307, 2.482285, 0, 0.3568628, 1, 1,
0.3504374, -1.806584, 4.537806, 0, 0.3529412, 1, 1,
0.3512284, -0.2308002, 0.8766167, 0, 0.345098, 1, 1,
0.3538901, -0.2176298, 2.374605, 0, 0.3411765, 1, 1,
0.3539899, -1.59919, 3.255691, 0, 0.3333333, 1, 1,
0.3546912, 0.8316745, 1.238524, 0, 0.3294118, 1, 1,
0.3571093, -0.6466752, 3.032574, 0, 0.3215686, 1, 1,
0.3593014, 0.1461926, 1.492325, 0, 0.3176471, 1, 1,
0.3599448, 0.1536772, 1.022333, 0, 0.3098039, 1, 1,
0.3600533, 2.314414, -0.9437121, 0, 0.3058824, 1, 1,
0.3676547, 1.941427, -0.7681716, 0, 0.2980392, 1, 1,
0.3731355, -0.7836997, 3.999782, 0, 0.2901961, 1, 1,
0.3769976, -0.5029652, 1.665427, 0, 0.2862745, 1, 1,
0.3780001, -0.9775173, 4.583224, 0, 0.2784314, 1, 1,
0.380323, 0.5172811, 0.8263444, 0, 0.2745098, 1, 1,
0.3820691, -0.370515, 3.08989, 0, 0.2666667, 1, 1,
0.3824907, 0.6520526, 0.7242256, 0, 0.2627451, 1, 1,
0.3834362, 1.666556, 1.160472, 0, 0.254902, 1, 1,
0.3881276, 1.661618, -0.8482422, 0, 0.2509804, 1, 1,
0.3899704, -0.465512, 2.429049, 0, 0.2431373, 1, 1,
0.3959474, 0.3600276, 0.7588084, 0, 0.2392157, 1, 1,
0.3974653, -0.789331, 2.540851, 0, 0.2313726, 1, 1,
0.3978009, 0.7631992, 1.184787, 0, 0.227451, 1, 1,
0.3997647, 2.562765, 0.4093933, 0, 0.2196078, 1, 1,
0.4017977, -0.6552912, 2.239948, 0, 0.2156863, 1, 1,
0.4034081, 1.367348, 1.325684, 0, 0.2078431, 1, 1,
0.4037615, 0.03334604, 1.45688, 0, 0.2039216, 1, 1,
0.4065716, 0.3787907, 0.09970869, 0, 0.1960784, 1, 1,
0.4085104, 0.8948249, 2.938425, 0, 0.1882353, 1, 1,
0.4109365, -0.4187927, 2.523362, 0, 0.1843137, 1, 1,
0.414222, -0.754718, 1.359387, 0, 0.1764706, 1, 1,
0.4190577, 1.402158, 0.2632083, 0, 0.172549, 1, 1,
0.4211996, -1.330381, 3.1664, 0, 0.1647059, 1, 1,
0.4280828, 0.1722014, -0.1747278, 0, 0.1607843, 1, 1,
0.4282768, 0.5455377, 0.1261422, 0, 0.1529412, 1, 1,
0.4303789, -0.9209853, 3.443589, 0, 0.1490196, 1, 1,
0.4307901, -0.2344842, 1.197802, 0, 0.1411765, 1, 1,
0.4317667, 0.4869346, 0.984882, 0, 0.1372549, 1, 1,
0.4346679, -2.251045, 0.4981137, 0, 0.1294118, 1, 1,
0.4354246, 0.2234028, 1.540046, 0, 0.1254902, 1, 1,
0.437187, 1.36323, -0.4953261, 0, 0.1176471, 1, 1,
0.4391299, 2.416156, -0.2939523, 0, 0.1137255, 1, 1,
0.4393726, -1.297232, 2.902369, 0, 0.1058824, 1, 1,
0.4428032, 0.6206851, 0.9454402, 0, 0.09803922, 1, 1,
0.4437671, 2.569001, 1.083391, 0, 0.09411765, 1, 1,
0.4452554, 0.07880948, 2.478007, 0, 0.08627451, 1, 1,
0.4531834, -1.089649, 3.288599, 0, 0.08235294, 1, 1,
0.455171, 0.2836229, 1.610854, 0, 0.07450981, 1, 1,
0.4582403, 0.6999217, 1.081096, 0, 0.07058824, 1, 1,
0.4629601, -1.431574, 1.785154, 0, 0.0627451, 1, 1,
0.4722118, 0.01921615, 0.09838655, 0, 0.05882353, 1, 1,
0.4738817, 0.3406008, -1.144257, 0, 0.05098039, 1, 1,
0.4740136, 0.3951365, 1.377631, 0, 0.04705882, 1, 1,
0.4759619, -0.3404481, 1.358454, 0, 0.03921569, 1, 1,
0.4775328, -0.004939373, 2.691307, 0, 0.03529412, 1, 1,
0.4802646, -2.019038, 2.900785, 0, 0.02745098, 1, 1,
0.4806126, -1.516397, 3.299548, 0, 0.02352941, 1, 1,
0.4828261, -0.4302804, 1.891364, 0, 0.01568628, 1, 1,
0.4851824, 0.1191964, 0.7850278, 0, 0.01176471, 1, 1,
0.4858554, 1.218704, 1.910423, 0, 0.003921569, 1, 1,
0.4867039, -0.01534034, 1.084554, 0.003921569, 0, 1, 1,
0.4886822, -0.5240551, 2.485925, 0.007843138, 0, 1, 1,
0.5054908, -0.6656501, 4.127684, 0.01568628, 0, 1, 1,
0.5103186, -1.064539, 1.709398, 0.01960784, 0, 1, 1,
0.510418, 0.238057, 1.4866, 0.02745098, 0, 1, 1,
0.5131981, -0.3346153, 1.346513, 0.03137255, 0, 1, 1,
0.5148554, 0.7996907, -0.09267364, 0.03921569, 0, 1, 1,
0.5159235, -0.9504609, 2.656316, 0.04313726, 0, 1, 1,
0.5201054, -0.7006127, 4.008111, 0.05098039, 0, 1, 1,
0.5232695, 0.2030005, 1.770064, 0.05490196, 0, 1, 1,
0.5242957, -0.2462958, 0.5858614, 0.0627451, 0, 1, 1,
0.5249822, 0.9430862, 0.3819946, 0.06666667, 0, 1, 1,
0.5268248, 0.8410532, 2.423291, 0.07450981, 0, 1, 1,
0.5304934, -1.979177, 4.284235, 0.07843138, 0, 1, 1,
0.5331426, -0.3073835, 2.408469, 0.08627451, 0, 1, 1,
0.5448186, -0.8897348, 4.575544, 0.09019608, 0, 1, 1,
0.5453956, 0.269824, 2.297636, 0.09803922, 0, 1, 1,
0.5454331, 0.8159096, 0.7970164, 0.1058824, 0, 1, 1,
0.5456688, 0.430079, 3.186916, 0.1098039, 0, 1, 1,
0.5553135, 0.5793969, 1.005675, 0.1176471, 0, 1, 1,
0.5553703, -0.6666267, 0.9272873, 0.1215686, 0, 1, 1,
0.5570322, 0.6290034, -1.548056, 0.1294118, 0, 1, 1,
0.5573512, -0.2227238, 2.892108, 0.1333333, 0, 1, 1,
0.5733705, 0.198326, 0.9089038, 0.1411765, 0, 1, 1,
0.5737037, 0.1682647, 1.645689, 0.145098, 0, 1, 1,
0.5747371, -1.971065, 3.782953, 0.1529412, 0, 1, 1,
0.5825951, -1.23939, 0.004155442, 0.1568628, 0, 1, 1,
0.5834933, 1.501063, 1.176315, 0.1647059, 0, 1, 1,
0.5857244, -2.247821, 2.565525, 0.1686275, 0, 1, 1,
0.5872443, 1.340782, 0.01861707, 0.1764706, 0, 1, 1,
0.592751, 1.070169, 0.8745666, 0.1803922, 0, 1, 1,
0.5930344, -1.15079, 4.112846, 0.1882353, 0, 1, 1,
0.5930769, -1.152003, 3.877896, 0.1921569, 0, 1, 1,
0.5997528, 1.286911, 0.3180228, 0.2, 0, 1, 1,
0.6013095, 0.05242608, 0.6301718, 0.2078431, 0, 1, 1,
0.6020395, -1.102108, 1.330587, 0.2117647, 0, 1, 1,
0.6026197, 1.503716, -0.3385818, 0.2196078, 0, 1, 1,
0.6063291, 1.320116, 0.260734, 0.2235294, 0, 1, 1,
0.6075558, 0.09398022, 1.224195, 0.2313726, 0, 1, 1,
0.6083787, 0.0458236, 2.074821, 0.2352941, 0, 1, 1,
0.6119118, 0.277994, 1.062961, 0.2431373, 0, 1, 1,
0.6121345, 0.2873562, 0.4043245, 0.2470588, 0, 1, 1,
0.6147406, 0.2030067, 1.831607, 0.254902, 0, 1, 1,
0.6172901, -0.4169775, 1.094137, 0.2588235, 0, 1, 1,
0.6215387, 1.075434, 0.7889556, 0.2666667, 0, 1, 1,
0.6249043, 0.505338, 2.995838, 0.2705882, 0, 1, 1,
0.6256395, -1.393959, 2.303968, 0.2784314, 0, 1, 1,
0.6289995, 0.4334314, 2.63523, 0.282353, 0, 1, 1,
0.6356863, 0.4498414, 1.817432, 0.2901961, 0, 1, 1,
0.6381336, 0.01849972, 2.663971, 0.2941177, 0, 1, 1,
0.6390309, -1.161122, 1.98555, 0.3019608, 0, 1, 1,
0.6426178, 1.22588, 1.529406, 0.3098039, 0, 1, 1,
0.6438382, -0.07177487, 1.972329, 0.3137255, 0, 1, 1,
0.6439103, -0.1660326, 2.849902, 0.3215686, 0, 1, 1,
0.6470363, 1.054318, 0.2706501, 0.3254902, 0, 1, 1,
0.6532531, -0.1593048, 3.113927, 0.3333333, 0, 1, 1,
0.6552737, -0.6564322, 2.062439, 0.3372549, 0, 1, 1,
0.6564354, -1.456024, 0.354715, 0.345098, 0, 1, 1,
0.6604608, -0.2947144, 3.172652, 0.3490196, 0, 1, 1,
0.6616166, 1.00048, 2.025256, 0.3568628, 0, 1, 1,
0.6625995, -1.563563, 2.899018, 0.3607843, 0, 1, 1,
0.6640661, 0.2526395, -0.6785007, 0.3686275, 0, 1, 1,
0.6660306, -0.9484393, 3.636611, 0.372549, 0, 1, 1,
0.6668633, 0.8887148, 2.087041, 0.3803922, 0, 1, 1,
0.671627, 1.455939, 0.09625087, 0.3843137, 0, 1, 1,
0.6738855, 2.692572, -0.3288435, 0.3921569, 0, 1, 1,
0.6748169, -0.505944, 2.666501, 0.3960784, 0, 1, 1,
0.6816234, -1.73973, 1.902991, 0.4039216, 0, 1, 1,
0.6825689, 2.135206, 1.370351, 0.4117647, 0, 1, 1,
0.698972, 0.7544747, 0.3704544, 0.4156863, 0, 1, 1,
0.708721, -1.308343, 2.939121, 0.4235294, 0, 1, 1,
0.7116125, 0.724817, 0.7805615, 0.427451, 0, 1, 1,
0.7160817, 0.2903399, -0.2376065, 0.4352941, 0, 1, 1,
0.7174913, -1.498298, 1.535997, 0.4392157, 0, 1, 1,
0.7221759, 1.313816, -1.476757, 0.4470588, 0, 1, 1,
0.7224894, -0.1007185, 3.977536, 0.4509804, 0, 1, 1,
0.7234611, -0.2416432, 2.949724, 0.4588235, 0, 1, 1,
0.7250537, 0.7123915, 0.6159815, 0.4627451, 0, 1, 1,
0.7266645, -0.9176086, 1.364787, 0.4705882, 0, 1, 1,
0.7273085, 0.332919, -0.5797921, 0.4745098, 0, 1, 1,
0.7350048, 0.2616467, 0.5218147, 0.4823529, 0, 1, 1,
0.7410591, 1.008911, 0.7263942, 0.4862745, 0, 1, 1,
0.742411, 0.1126049, 1.084878, 0.4941176, 0, 1, 1,
0.7444114, -0.2890085, 1.444786, 0.5019608, 0, 1, 1,
0.7454339, -0.4146405, 2.551072, 0.5058824, 0, 1, 1,
0.7454951, -1.96134, 3.979451, 0.5137255, 0, 1, 1,
0.7492188, 0.6667805, 0.3744736, 0.5176471, 0, 1, 1,
0.7517791, -1.313423, 3.936819, 0.5254902, 0, 1, 1,
0.7584652, -0.03503613, 2.960758, 0.5294118, 0, 1, 1,
0.758789, -0.4972912, 1.70573, 0.5372549, 0, 1, 1,
0.7593968, 0.5947626, 0.975286, 0.5411765, 0, 1, 1,
0.7608505, -1.20994, 3.26305, 0.5490196, 0, 1, 1,
0.761497, 0.4368905, 0.6642873, 0.5529412, 0, 1, 1,
0.7643596, -0.2885629, 2.127933, 0.5607843, 0, 1, 1,
0.7698465, 0.3702631, -0.8887076, 0.5647059, 0, 1, 1,
0.7739592, -0.8201012, 1.784013, 0.572549, 0, 1, 1,
0.7788533, 0.2555295, 1.944047, 0.5764706, 0, 1, 1,
0.7834886, -0.7724317, 2.766576, 0.5843138, 0, 1, 1,
0.7890299, 0.8838465, 1.357525, 0.5882353, 0, 1, 1,
0.7934938, 1.536726, 1.445433, 0.5960785, 0, 1, 1,
0.7937788, 0.4930787, 1.190537, 0.6039216, 0, 1, 1,
0.7987512, 1.035211, -0.2966369, 0.6078432, 0, 1, 1,
0.8019427, -1.195272, 6.032171, 0.6156863, 0, 1, 1,
0.803044, 1.456685, -0.8692582, 0.6196079, 0, 1, 1,
0.8038933, 1.330901, -0.6665509, 0.627451, 0, 1, 1,
0.8049932, 0.3766627, 0.3929974, 0.6313726, 0, 1, 1,
0.809115, 0.4736602, 1.102926, 0.6392157, 0, 1, 1,
0.8098615, 0.1962865, 2.981327, 0.6431373, 0, 1, 1,
0.817673, 0.7384523, 0.2979536, 0.6509804, 0, 1, 1,
0.8238257, 0.5809138, 0.7005044, 0.654902, 0, 1, 1,
0.8273413, 0.4498468, 1.836552, 0.6627451, 0, 1, 1,
0.8303554, 0.8012769, -0.4473434, 0.6666667, 0, 1, 1,
0.8311078, 0.1182071, 1.989874, 0.6745098, 0, 1, 1,
0.8352093, 0.4621507, 2.416794, 0.6784314, 0, 1, 1,
0.8352478, -1.627602, 2.986459, 0.6862745, 0, 1, 1,
0.8361399, 0.009300044, 0.2487294, 0.6901961, 0, 1, 1,
0.8457661, -1.065794, 1.75702, 0.6980392, 0, 1, 1,
0.8494173, 0.8707662, 1.295801, 0.7058824, 0, 1, 1,
0.8509282, -0.05475046, 0.7437993, 0.7098039, 0, 1, 1,
0.8521214, -0.148028, 2.931036, 0.7176471, 0, 1, 1,
0.853257, 0.1742118, 1.815583, 0.7215686, 0, 1, 1,
0.8539433, 0.6023128, 1.192921, 0.7294118, 0, 1, 1,
0.8547135, 0.7810856, 0.3780922, 0.7333333, 0, 1, 1,
0.8575257, 1.116345, 0.3628726, 0.7411765, 0, 1, 1,
0.860563, -0.5475377, 2.817855, 0.7450981, 0, 1, 1,
0.8622714, 1.314651, 0.5368497, 0.7529412, 0, 1, 1,
0.8675932, 0.5096077, 1.462636, 0.7568628, 0, 1, 1,
0.8844643, -0.3515482, 1.949723, 0.7647059, 0, 1, 1,
0.8884835, 0.3413075, 1.061977, 0.7686275, 0, 1, 1,
0.8943188, 0.8515479, 0.3099425, 0.7764706, 0, 1, 1,
0.9019436, -0.3194608, 0.3150678, 0.7803922, 0, 1, 1,
0.9075949, 0.2128152, 0.9004092, 0.7882353, 0, 1, 1,
0.9099909, 2.423409, 0.1328817, 0.7921569, 0, 1, 1,
0.9116539, -1.604917, 3.278437, 0.8, 0, 1, 1,
0.9121231, 0.8236681, 0.9878277, 0.8078431, 0, 1, 1,
0.9146173, 0.2769689, 0.4348471, 0.8117647, 0, 1, 1,
0.9243448, 1.11621, 0.325615, 0.8196079, 0, 1, 1,
0.9258272, 0.1498795, -0.1003392, 0.8235294, 0, 1, 1,
0.9309121, -1.254296, 1.415527, 0.8313726, 0, 1, 1,
0.932681, 0.4452085, 0.7056056, 0.8352941, 0, 1, 1,
0.9345549, -0.1015374, 2.416116, 0.8431373, 0, 1, 1,
0.9407231, -0.1399593, 3.869952, 0.8470588, 0, 1, 1,
0.942918, 0.7968693, 1.790969, 0.854902, 0, 1, 1,
0.9538262, -0.9618618, 0.5155227, 0.8588235, 0, 1, 1,
0.9550348, 1.333542, -0.3985389, 0.8666667, 0, 1, 1,
0.9555162, 0.6186848, 1.443925, 0.8705882, 0, 1, 1,
0.9565466, 1.491561, 1.508397, 0.8784314, 0, 1, 1,
0.9581366, 0.3745597, 0.7609621, 0.8823529, 0, 1, 1,
0.9630176, 2.023549, 1.420034, 0.8901961, 0, 1, 1,
0.9645148, 0.7449959, 2.109922, 0.8941177, 0, 1, 1,
0.9651503, -1.498583, 1.482773, 0.9019608, 0, 1, 1,
0.9687807, -0.1276366, 1.02459, 0.9098039, 0, 1, 1,
0.9760891, -0.4133312, 2.003271, 0.9137255, 0, 1, 1,
0.9806089, 1.115638, 0.433795, 0.9215686, 0, 1, 1,
0.9907519, -1.277994, 2.269221, 0.9254902, 0, 1, 1,
0.99678, 1.282075, 1.355644, 0.9333333, 0, 1, 1,
1.002082, 0.6888828, 1.234756, 0.9372549, 0, 1, 1,
1.00987, -0.7636358, 1.324947, 0.945098, 0, 1, 1,
1.011737, 0.1891333, -0.3443277, 0.9490196, 0, 1, 1,
1.012741, -2.013059, 2.937191, 0.9568627, 0, 1, 1,
1.014339, -0.6760128, 1.758674, 0.9607843, 0, 1, 1,
1.016275, -0.02418903, 1.059471, 0.9686275, 0, 1, 1,
1.017142, 0.4597972, 0.4602551, 0.972549, 0, 1, 1,
1.018175, -1.084796, 4.220077, 0.9803922, 0, 1, 1,
1.028892, 0.3393376, 1.286066, 0.9843137, 0, 1, 1,
1.03448, -1.22153, 3.947099, 0.9921569, 0, 1, 1,
1.04031, -1.176999, 3.967876, 0.9960784, 0, 1, 1,
1.041033, -0.3067861, 1.403695, 1, 0, 0.9960784, 1,
1.043574, -1.276001, 2.682907, 1, 0, 0.9882353, 1,
1.050015, -0.3125731, 1.1567, 1, 0, 0.9843137, 1,
1.053554, 0.4158155, 0.5270498, 1, 0, 0.9764706, 1,
1.059958, -0.2165984, 0.6636949, 1, 0, 0.972549, 1,
1.060929, -0.6808434, 4.003689, 1, 0, 0.9647059, 1,
1.074734, 0.5545731, 2.050319, 1, 0, 0.9607843, 1,
1.075593, -1.776515, 2.895488, 1, 0, 0.9529412, 1,
1.083434, 0.5560784, -0.0255863, 1, 0, 0.9490196, 1,
1.096759, 1.34624, -0.8179038, 1, 0, 0.9411765, 1,
1.100143, 0.4564994, 0.08229523, 1, 0, 0.9372549, 1,
1.101212, -0.7540925, 2.538774, 1, 0, 0.9294118, 1,
1.112195, 0.3108635, 0.3570405, 1, 0, 0.9254902, 1,
1.115038, 0.9757072, 0.8759416, 1, 0, 0.9176471, 1,
1.118675, 1.331617, 1.919621, 1, 0, 0.9137255, 1,
1.127619, -0.01783581, 2.470087, 1, 0, 0.9058824, 1,
1.12928, 0.6672657, 0.9670006, 1, 0, 0.9019608, 1,
1.130891, 0.9702308, 0.4506351, 1, 0, 0.8941177, 1,
1.132468, -0.1356452, 1.304342, 1, 0, 0.8862745, 1,
1.13764, -0.3794011, 2.72939, 1, 0, 0.8823529, 1,
1.138205, -0.2079299, 2.840512, 1, 0, 0.8745098, 1,
1.139171, 1.370196, 0.8138351, 1, 0, 0.8705882, 1,
1.139705, -0.1081577, 0.5352232, 1, 0, 0.8627451, 1,
1.148298, -0.3791297, 2.335825, 1, 0, 0.8588235, 1,
1.165039, 1.93738, 0.863803, 1, 0, 0.8509804, 1,
1.165042, 0.2588667, 1.266792, 1, 0, 0.8470588, 1,
1.180887, -1.62934, 2.879758, 1, 0, 0.8392157, 1,
1.184631, -2.034328, 2.335829, 1, 0, 0.8352941, 1,
1.184918, 0.2567698, 0.83116, 1, 0, 0.827451, 1,
1.187196, 0.2652425, 3.374295, 1, 0, 0.8235294, 1,
1.19248, -0.2649513, 1.279458, 1, 0, 0.8156863, 1,
1.199399, 0.1030197, 0.1907112, 1, 0, 0.8117647, 1,
1.205688, -1.475281, 1.397328, 1, 0, 0.8039216, 1,
1.228129, -1.132585, 2.644406, 1, 0, 0.7960784, 1,
1.23158, -0.9557471, 3.893992, 1, 0, 0.7921569, 1,
1.239641, 0.7869571, 0.06861306, 1, 0, 0.7843137, 1,
1.240417, 0.2029517, 2.552613, 1, 0, 0.7803922, 1,
1.240526, -0.6567422, 3.129582, 1, 0, 0.772549, 1,
1.243202, -0.7845063, 2.448652, 1, 0, 0.7686275, 1,
1.25533, -0.2647766, 1.065811, 1, 0, 0.7607843, 1,
1.25879, 0.4940789, 1.762258, 1, 0, 0.7568628, 1,
1.26904, 1.67027, -0.2523194, 1, 0, 0.7490196, 1,
1.270699, 1.594969, 0.8655001, 1, 0, 0.7450981, 1,
1.272812, 0.5550058, 0.6046981, 1, 0, 0.7372549, 1,
1.27385, -0.6941873, 2.125746, 1, 0, 0.7333333, 1,
1.279986, 1.403328, 2.147918, 1, 0, 0.7254902, 1,
1.280369, -0.3041479, 2.950115, 1, 0, 0.7215686, 1,
1.286128, -0.8417183, 1.465528, 1, 0, 0.7137255, 1,
1.289837, 0.6357314, 0.2093291, 1, 0, 0.7098039, 1,
1.309952, -0.1190899, 3.075892, 1, 0, 0.7019608, 1,
1.314826, 2.045014, 1.374017, 1, 0, 0.6941177, 1,
1.319578, 2.215909, 0.1896329, 1, 0, 0.6901961, 1,
1.329672, 0.2365207, 2.284042, 1, 0, 0.682353, 1,
1.331442, -1.442659, 2.29851, 1, 0, 0.6784314, 1,
1.350915, -0.0954354, 0.8528097, 1, 0, 0.6705883, 1,
1.353698, -1.448511, 2.840718, 1, 0, 0.6666667, 1,
1.367141, -1.196432, 2.258101, 1, 0, 0.6588235, 1,
1.372789, 0.1364243, 0.4293497, 1, 0, 0.654902, 1,
1.377554, -0.7219732, 1.827151, 1, 0, 0.6470588, 1,
1.381671, -2.257715, 4.048715, 1, 0, 0.6431373, 1,
1.387974, 0.5121881, 1.981717, 1, 0, 0.6352941, 1,
1.397245, -0.4361345, 2.033217, 1, 0, 0.6313726, 1,
1.401934, 0.9629742, -0.7098034, 1, 0, 0.6235294, 1,
1.403049, -0.8496484, 1.875084, 1, 0, 0.6196079, 1,
1.412438, 1.490637, 0.5855604, 1, 0, 0.6117647, 1,
1.41846, -0.4557983, 3.52552, 1, 0, 0.6078432, 1,
1.421061, 0.9491857, 1.635316, 1, 0, 0.6, 1,
1.423401, -0.4029629, 0.7166543, 1, 0, 0.5921569, 1,
1.425971, 1.488953, 2.739419, 1, 0, 0.5882353, 1,
1.43403, -0.1579424, 2.919575, 1, 0, 0.5803922, 1,
1.436863, -0.6976097, 1.946827, 1, 0, 0.5764706, 1,
1.440159, 0.09441023, 2.082467, 1, 0, 0.5686275, 1,
1.440199, -1.544441, 3.828566, 1, 0, 0.5647059, 1,
1.441653, -0.8792579, 1.981384, 1, 0, 0.5568628, 1,
1.44733, -0.5882984, 1.561672, 1, 0, 0.5529412, 1,
1.451023, 0.5212035, 2.381629, 1, 0, 0.5450981, 1,
1.455666, 0.8484399, 1.481209, 1, 0, 0.5411765, 1,
1.466233, -1.011392, 1.724388, 1, 0, 0.5333334, 1,
1.472273, -0.2025806, 3.612544, 1, 0, 0.5294118, 1,
1.474998, -1.218278, 1.305386, 1, 0, 0.5215687, 1,
1.475087, -0.3743657, 2.532527, 1, 0, 0.5176471, 1,
1.477843, 1.332414, 1.473361, 1, 0, 0.509804, 1,
1.484294, 2.17798, 0.1911658, 1, 0, 0.5058824, 1,
1.488676, 1.297109, 1.203463, 1, 0, 0.4980392, 1,
1.491231, 0.3963743, 0.7735335, 1, 0, 0.4901961, 1,
1.491375, 0.4985652, 1.498029, 1, 0, 0.4862745, 1,
1.495073, 1.268812, 0.6575056, 1, 0, 0.4784314, 1,
1.496605, 2.617263, 0.8860939, 1, 0, 0.4745098, 1,
1.49725, -0.9850214, 1.358683, 1, 0, 0.4666667, 1,
1.502282, 0.3980402, 1.129009, 1, 0, 0.4627451, 1,
1.508992, 0.009752819, 2.18129, 1, 0, 0.454902, 1,
1.529686, 1.095955, -0.2548747, 1, 0, 0.4509804, 1,
1.530476, -0.07203919, 2.067327, 1, 0, 0.4431373, 1,
1.535747, 1.180042, -1.160133, 1, 0, 0.4392157, 1,
1.542156, -0.4241717, 1.834441, 1, 0, 0.4313726, 1,
1.563932, 0.7939643, 0.1837386, 1, 0, 0.427451, 1,
1.565403, -0.8835444, 2.420331, 1, 0, 0.4196078, 1,
1.569942, -1.187338, 3.776158, 1, 0, 0.4156863, 1,
1.572593, -0.2600287, 1.855415, 1, 0, 0.4078431, 1,
1.574004, -0.5600469, 1.862073, 1, 0, 0.4039216, 1,
1.579785, 1.4413, 0.491267, 1, 0, 0.3960784, 1,
1.61406, -0.2806285, 2.695377, 1, 0, 0.3882353, 1,
1.622444, 0.01689669, 0.9755928, 1, 0, 0.3843137, 1,
1.625641, -0.1636545, 1.54761, 1, 0, 0.3764706, 1,
1.632396, 0.5618717, -1.301704, 1, 0, 0.372549, 1,
1.632529, -0.7216345, 2.928828, 1, 0, 0.3647059, 1,
1.641147, -1.457508, 1.644076, 1, 0, 0.3607843, 1,
1.647522, 1.490917, 1.68626, 1, 0, 0.3529412, 1,
1.649644, 0.7820978, 2.352715, 1, 0, 0.3490196, 1,
1.658231, -0.8722221, 0.8682231, 1, 0, 0.3411765, 1,
1.661588, 0.5485752, 2.397756, 1, 0, 0.3372549, 1,
1.669035, -0.8146853, 1.40108, 1, 0, 0.3294118, 1,
1.669824, -1.913985, 2.186048, 1, 0, 0.3254902, 1,
1.673829, 0.2714907, 1.504638, 1, 0, 0.3176471, 1,
1.693265, 0.677582, 0.4582031, 1, 0, 0.3137255, 1,
1.698492, -1.634333, 0.9684194, 1, 0, 0.3058824, 1,
1.704417, 0.001926086, 2.106723, 1, 0, 0.2980392, 1,
1.714315, 0.06482634, 0.1539913, 1, 0, 0.2941177, 1,
1.723165, 0.7439008, -0.07697968, 1, 0, 0.2862745, 1,
1.741487, -0.5518659, 3.080094, 1, 0, 0.282353, 1,
1.744289, 1.795538, 1.4747, 1, 0, 0.2745098, 1,
1.744965, -0.4622589, 0.5913128, 1, 0, 0.2705882, 1,
1.765903, -0.2686709, 0.6928441, 1, 0, 0.2627451, 1,
1.777573, 1.449278, -0.2382266, 1, 0, 0.2588235, 1,
1.779472, 1.375624, 1.33569, 1, 0, 0.2509804, 1,
1.79628, 0.3096883, 2.04071, 1, 0, 0.2470588, 1,
1.796918, 0.1518164, 1.522132, 1, 0, 0.2392157, 1,
1.823373, -2.63602, 2.153825, 1, 0, 0.2352941, 1,
1.83528, 0.3603763, 0.6787004, 1, 0, 0.227451, 1,
1.841415, -0.09931389, 1.370388, 1, 0, 0.2235294, 1,
1.843843, -0.02524956, 2.842894, 1, 0, 0.2156863, 1,
1.848854, 1.242035, 0.4000688, 1, 0, 0.2117647, 1,
1.879157, -0.2960329, 2.014873, 1, 0, 0.2039216, 1,
1.885738, -0.4321318, 2.387372, 1, 0, 0.1960784, 1,
1.898876, 0.4645403, 2.453221, 1, 0, 0.1921569, 1,
1.911337, -0.2402828, 2.095111, 1, 0, 0.1843137, 1,
1.927813, -0.5584925, 2.233744, 1, 0, 0.1803922, 1,
1.963893, 1.678019, 1.659857, 1, 0, 0.172549, 1,
1.965713, -0.1703026, 1.093704, 1, 0, 0.1686275, 1,
2.03272, -0.6064177, 2.991591, 1, 0, 0.1607843, 1,
2.057518, 1.457256, 1.152856, 1, 0, 0.1568628, 1,
2.084477, 0.117042, 0.5941429, 1, 0, 0.1490196, 1,
2.115786, -1.375464, 1.717157, 1, 0, 0.145098, 1,
2.123832, -0.7330783, -0.1244033, 1, 0, 0.1372549, 1,
2.124994, 1.486725, 0.7470641, 1, 0, 0.1333333, 1,
2.130367, 0.1035135, 1.091921, 1, 0, 0.1254902, 1,
2.144371, -2.241664, 3.605976, 1, 0, 0.1215686, 1,
2.149938, 0.008665042, 1.801352, 1, 0, 0.1137255, 1,
2.162581, 0.4804016, 1.039645, 1, 0, 0.1098039, 1,
2.197608, 1.264152, 0.7677888, 1, 0, 0.1019608, 1,
2.216006, -1.065939, -0.09602872, 1, 0, 0.09411765, 1,
2.241591, -0.02748805, 0.59824, 1, 0, 0.09019608, 1,
2.300952, -1.987862, 3.125223, 1, 0, 0.08235294, 1,
2.34067, -0.5622895, 3.465548, 1, 0, 0.07843138, 1,
2.348397, -0.08294383, 3.033068, 1, 0, 0.07058824, 1,
2.349652, 0.9770792, -0.2892361, 1, 0, 0.06666667, 1,
2.374974, 0.9179989, 0.07090657, 1, 0, 0.05882353, 1,
2.403517, 0.240514, 1.557833, 1, 0, 0.05490196, 1,
2.458769, 1.183524, 2.364824, 1, 0, 0.04705882, 1,
2.504094, 0.7026922, 3.003948, 1, 0, 0.04313726, 1,
2.519808, 1.39267, 1.122977, 1, 0, 0.03529412, 1,
2.532949, 1.382371, 0.7897791, 1, 0, 0.03137255, 1,
2.576832, -0.9542205, 2.267822, 1, 0, 0.02352941, 1,
2.591546, 0.651141, 0.8348188, 1, 0, 0.01960784, 1,
2.681547, 0.395026, -0.2593331, 1, 0, 0.01176471, 1,
3.462929, -0.9986848, 0.8435219, 1, 0, 0.007843138, 1
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
0.2563462, -4.816376, -7.322103, 0, -0.5, 0.5, 0.5,
0.2563462, -4.816376, -7.322103, 1, -0.5, 0.5, 0.5,
0.2563462, -4.816376, -7.322103, 1, 1.5, 0.5, 0.5,
0.2563462, -4.816376, -7.322103, 0, 1.5, 0.5, 0.5
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
-4.037268, -0.3595705, -7.322103, 0, -0.5, 0.5, 0.5,
-4.037268, -0.3595705, -7.322103, 1, -0.5, 0.5, 0.5,
-4.037268, -0.3595705, -7.322103, 1, 1.5, 0.5, 0.5,
-4.037268, -0.3595705, -7.322103, 0, 1.5, 0.5, 0.5
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
-4.037268, -4.816376, 0.3227768, 0, -0.5, 0.5, 0.5,
-4.037268, -4.816376, 0.3227768, 1, -0.5, 0.5, 0.5,
-4.037268, -4.816376, 0.3227768, 1, 1.5, 0.5, 0.5,
-4.037268, -4.816376, 0.3227768, 0, 1.5, 0.5, 0.5
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
-2, -3.787882, -5.557899,
3, -3.787882, -5.557899,
-2, -3.787882, -5.557899,
-2, -3.959298, -5.851933,
-1, -3.787882, -5.557899,
-1, -3.959298, -5.851933,
0, -3.787882, -5.557899,
0, -3.959298, -5.851933,
1, -3.787882, -5.557899,
1, -3.959298, -5.851933,
2, -3.787882, -5.557899,
2, -3.959298, -5.851933,
3, -3.787882, -5.557899,
3, -3.959298, -5.851933
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
-2, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
-2, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
-2, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
-2, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5,
-1, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
-1, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
-1, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
-1, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5,
0, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
0, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
0, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
0, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5,
1, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
1, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
1, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
1, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5,
2, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
2, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
2, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
2, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5,
3, -4.302129, -6.440001, 0, -0.5, 0.5, 0.5,
3, -4.302129, -6.440001, 1, -0.5, 0.5, 0.5,
3, -4.302129, -6.440001, 1, 1.5, 0.5, 0.5,
3, -4.302129, -6.440001, 0, 1.5, 0.5, 0.5
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
-3.046434, -3, -5.557899,
-3.046434, 2, -5.557899,
-3.046434, -3, -5.557899,
-3.211573, -3, -5.851933,
-3.046434, -2, -5.557899,
-3.211573, -2, -5.851933,
-3.046434, -1, -5.557899,
-3.211573, -1, -5.851933,
-3.046434, 0, -5.557899,
-3.211573, 0, -5.851933,
-3.046434, 1, -5.557899,
-3.211573, 1, -5.851933,
-3.046434, 2, -5.557899,
-3.211573, 2, -5.851933
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
-3.541851, -3, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, -3, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, -3, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, -3, -6.440001, 0, 1.5, 0.5, 0.5,
-3.541851, -2, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, -2, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, -2, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, -2, -6.440001, 0, 1.5, 0.5, 0.5,
-3.541851, -1, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, -1, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, -1, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, -1, -6.440001, 0, 1.5, 0.5, 0.5,
-3.541851, 0, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, 0, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, 0, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, 0, -6.440001, 0, 1.5, 0.5, 0.5,
-3.541851, 1, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, 1, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, 1, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, 1, -6.440001, 0, 1.5, 0.5, 0.5,
-3.541851, 2, -6.440001, 0, -0.5, 0.5, 0.5,
-3.541851, 2, -6.440001, 1, -0.5, 0.5, 0.5,
-3.541851, 2, -6.440001, 1, 1.5, 0.5, 0.5,
-3.541851, 2, -6.440001, 0, 1.5, 0.5, 0.5
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
-3.046434, -3.787882, -4,
-3.046434, -3.787882, 6,
-3.046434, -3.787882, -4,
-3.211573, -3.959298, -4,
-3.046434, -3.787882, -2,
-3.211573, -3.959298, -2,
-3.046434, -3.787882, 0,
-3.211573, -3.959298, 0,
-3.046434, -3.787882, 2,
-3.211573, -3.959298, 2,
-3.046434, -3.787882, 4,
-3.211573, -3.959298, 4,
-3.046434, -3.787882, 6,
-3.211573, -3.959298, 6
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
-3.541851, -4.302129, -4, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, -4, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, -4, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, -4, 0, 1.5, 0.5, 0.5,
-3.541851, -4.302129, -2, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, -2, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, -2, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, -2, 0, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 0, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 0, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 0, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 0, 0, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 2, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 2, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 2, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 2, 0, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 4, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 4, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 4, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 4, 0, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 6, 0, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 6, 1, -0.5, 0.5, 0.5,
-3.541851, -4.302129, 6, 1, 1.5, 0.5, 0.5,
-3.541851, -4.302129, 6, 0, 1.5, 0.5, 0.5
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
-3.046434, -3.787882, -5.557899,
-3.046434, 3.068741, -5.557899,
-3.046434, -3.787882, 6.203453,
-3.046434, 3.068741, 6.203453,
-3.046434, -3.787882, -5.557899,
-3.046434, -3.787882, 6.203453,
-3.046434, 3.068741, -5.557899,
-3.046434, 3.068741, 6.203453,
-3.046434, -3.787882, -5.557899,
3.559126, -3.787882, -5.557899,
-3.046434, -3.787882, 6.203453,
3.559126, -3.787882, 6.203453,
-3.046434, 3.068741, -5.557899,
3.559126, 3.068741, -5.557899,
-3.046434, 3.068741, 6.203453,
3.559126, 3.068741, 6.203453,
3.559126, -3.787882, -5.557899,
3.559126, 3.068741, -5.557899,
3.559126, -3.787882, 6.203453,
3.559126, 3.068741, 6.203453,
3.559126, -3.787882, -5.557899,
3.559126, -3.787882, 6.203453,
3.559126, 3.068741, -5.557899,
3.559126, 3.068741, 6.203453
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
var radius = 8.080171;
var distance = 35.94959;
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
mvMatrix.translate( -0.2563462, 0.3595705, -0.3227768 );
mvMatrix.scale( 1.322589, 1.274161, 0.7428091 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94959);
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
4-dichloroacetyl-1-o<-read.table("4-dichloroacetyl-1-o.xyz")
```

```
## Error in read.table("4-dichloroacetyl-1-o.xyz"): no lines available in input
```

```r
x<-4-dichloroacetyl-1-o$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloroacetyl' not found
```

```r
y<-4-dichloroacetyl-1-o$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloroacetyl' not found
```

```r
z<-4-dichloroacetyl-1-o$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloroacetyl' not found
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
-2.950236, -1.275919, -1.511167, 0, 0, 1, 1, 1,
-2.697982, -0.7838398, -3.6847, 1, 0, 0, 1, 1,
-2.681479, -0.3715585, -0.3216386, 1, 0, 0, 1, 1,
-2.643311, 0.4164019, 0.2205185, 1, 0, 0, 1, 1,
-2.605876, -1.814938, -3.34431, 1, 0, 0, 1, 1,
-2.602668, 0.1312354, -2.29258, 1, 0, 0, 1, 1,
-2.576298, -0.5868309, -2.792089, 0, 0, 0, 1, 1,
-2.477069, -0.3190946, -0.7737904, 0, 0, 0, 1, 1,
-2.428018, 2.238168, 0.1476704, 0, 0, 0, 1, 1,
-2.38141, -0.7768254, -1.942658, 0, 0, 0, 1, 1,
-2.378639, -0.9546139, -3.435466, 0, 0, 0, 1, 1,
-2.262139, 0.4152533, -2.803698, 0, 0, 0, 1, 1,
-2.244586, -0.6583794, -1.543589, 0, 0, 0, 1, 1,
-2.222795, -0.001903396, 0.1983993, 1, 1, 1, 1, 1,
-2.211335, -0.1729544, -0.9732756, 1, 1, 1, 1, 1,
-2.199949, -1.024809, -2.35079, 1, 1, 1, 1, 1,
-2.176902, 0.3593085, -0.142499, 1, 1, 1, 1, 1,
-2.17638, -0.1346577, -3.266387, 1, 1, 1, 1, 1,
-2.160711, 1.504216, 0.164863, 1, 1, 1, 1, 1,
-2.117483, 0.9383022, -1.970102, 1, 1, 1, 1, 1,
-1.941833, 0.2763288, -1.935415, 1, 1, 1, 1, 1,
-1.937755, 0.6127666, -1.143813, 1, 1, 1, 1, 1,
-1.934689, -1.70481, -2.470295, 1, 1, 1, 1, 1,
-1.932501, -0.1249781, -1.699628, 1, 1, 1, 1, 1,
-1.885512, -1.208678, -4.529292, 1, 1, 1, 1, 1,
-1.846056, 1.449133, -1.606273, 1, 1, 1, 1, 1,
-1.813456, 0.2012494, -2.318173, 1, 1, 1, 1, 1,
-1.810328, -0.01452235, -3.071693, 1, 1, 1, 1, 1,
-1.800323, -0.7143886, -0.006927138, 0, 0, 1, 1, 1,
-1.799972, -1.766821, -1.232754, 1, 0, 0, 1, 1,
-1.73052, 1.742275, 0.5512931, 1, 0, 0, 1, 1,
-1.722815, -0.6879173, -1.862071, 1, 0, 0, 1, 1,
-1.715524, -0.8809472, -1.15254, 1, 0, 0, 1, 1,
-1.707437, -0.8458325, -0.4882025, 1, 0, 0, 1, 1,
-1.686588, 0.6243611, -2.392303, 0, 0, 0, 1, 1,
-1.667693, -0.4761938, -2.187839, 0, 0, 0, 1, 1,
-1.660778, -1.488321, -1.94206, 0, 0, 0, 1, 1,
-1.660308, 1.275443, 0.5545408, 0, 0, 0, 1, 1,
-1.642939, 0.3718971, -2.265802, 0, 0, 0, 1, 1,
-1.608455, -2.068624, -3.459018, 0, 0, 0, 1, 1,
-1.601692, -0.2319917, -2.924862, 0, 0, 0, 1, 1,
-1.597941, -1.109715, -2.572322, 1, 1, 1, 1, 1,
-1.571996, -0.826956, -1.216955, 1, 1, 1, 1, 1,
-1.565504, -0.5481293, -1.981516, 1, 1, 1, 1, 1,
-1.565194, -0.6146113, -0.7388306, 1, 1, 1, 1, 1,
-1.561229, -0.1900236, -2.46255, 1, 1, 1, 1, 1,
-1.560694, 1.425462, -1.172757, 1, 1, 1, 1, 1,
-1.535708, -0.2545616, -0.3122658, 1, 1, 1, 1, 1,
-1.534284, -2.10453, -2.525418, 1, 1, 1, 1, 1,
-1.526739, -0.6623802, 0.4164413, 1, 1, 1, 1, 1,
-1.524363, -0.6318812, -1.552779, 1, 1, 1, 1, 1,
-1.52244, -1.646204, -2.989306, 1, 1, 1, 1, 1,
-1.519171, 0.2787715, -1.009604, 1, 1, 1, 1, 1,
-1.511945, 1.275141, -1.055836, 1, 1, 1, 1, 1,
-1.507487, -1.013905, -2.40818, 1, 1, 1, 1, 1,
-1.50321, -1.239401, -0.8448963, 1, 1, 1, 1, 1,
-1.483121, -1.225442, -1.509668, 0, 0, 1, 1, 1,
-1.482937, 0.7863019, -2.385893, 1, 0, 0, 1, 1,
-1.479012, -0.8247364, -0.2979624, 1, 0, 0, 1, 1,
-1.475122, 1.34007, 0.8379754, 1, 0, 0, 1, 1,
-1.474126, -0.3763932, -0.7154757, 1, 0, 0, 1, 1,
-1.471741, -2.298923, -1.268206, 1, 0, 0, 1, 1,
-1.471391, -1.81506, -1.044603, 0, 0, 0, 1, 1,
-1.469169, -0.5132951, -2.739176, 0, 0, 0, 1, 1,
-1.440486, -0.4845798, -1.055726, 0, 0, 0, 1, 1,
-1.438172, 0.9646311, -1.004531, 0, 0, 0, 1, 1,
-1.435671, 0.6044718, -0.9679878, 0, 0, 0, 1, 1,
-1.418849, 0.1729535, -1.272931, 0, 0, 0, 1, 1,
-1.393931, 1.557313, -2.242598, 0, 0, 0, 1, 1,
-1.392062, -1.615439, -1.467083, 1, 1, 1, 1, 1,
-1.389828, -1.542346, -3.329647, 1, 1, 1, 1, 1,
-1.385545, 0.04830718, -2.408264, 1, 1, 1, 1, 1,
-1.379258, 0.007458244, -0.8414234, 1, 1, 1, 1, 1,
-1.352434, -2.433633, -3.034428, 1, 1, 1, 1, 1,
-1.346145, 1.777648, 0.1474528, 1, 1, 1, 1, 1,
-1.33701, -2.12571, -3.185925, 1, 1, 1, 1, 1,
-1.330271, 0.05750415, -1.085452, 1, 1, 1, 1, 1,
-1.323021, -1.129997, -1.748832, 1, 1, 1, 1, 1,
-1.322898, -0.3200558, -1.082688, 1, 1, 1, 1, 1,
-1.307536, 0.7621292, -1.390431, 1, 1, 1, 1, 1,
-1.303902, -0.1338311, -1.099492, 1, 1, 1, 1, 1,
-1.285738, 0.9639941, -1.405668, 1, 1, 1, 1, 1,
-1.282875, 0.919037, -0.5855297, 1, 1, 1, 1, 1,
-1.279586, -1.056665, -3.416687, 1, 1, 1, 1, 1,
-1.275319, 0.561779, -2.894488, 0, 0, 1, 1, 1,
-1.275218, -0.4705274, -1.517277, 1, 0, 0, 1, 1,
-1.265068, 0.6562442, -1.023947, 1, 0, 0, 1, 1,
-1.262063, -0.2923833, 0.3924933, 1, 0, 0, 1, 1,
-1.260421, -1.117923, -1.264771, 1, 0, 0, 1, 1,
-1.247936, 0.5293654, -1.290424, 1, 0, 0, 1, 1,
-1.231932, 0.7827929, -0.4783534, 0, 0, 0, 1, 1,
-1.224211, 2.026623, -2.152764, 0, 0, 0, 1, 1,
-1.21989, -0.2258112, -0.5317879, 0, 0, 0, 1, 1,
-1.218679, -0.577372, -2.982898, 0, 0, 0, 1, 1,
-1.217824, 0.51138, 0.749844, 0, 0, 0, 1, 1,
-1.216534, -0.3564324, -0.5441201, 0, 0, 0, 1, 1,
-1.207717, 0.5675399, 1.779058, 0, 0, 0, 1, 1,
-1.206775, -2.088135, -4.024496, 1, 1, 1, 1, 1,
-1.204638, 1.334555, -1.546976, 1, 1, 1, 1, 1,
-1.195049, -0.7614547, -1.725422, 1, 1, 1, 1, 1,
-1.190543, 2.968888, 0.942082, 1, 1, 1, 1, 1,
-1.173938, -1.670402, -1.955171, 1, 1, 1, 1, 1,
-1.169544, -1.454386, -2.629766, 1, 1, 1, 1, 1,
-1.14904, 0.6488025, -1.766235, 1, 1, 1, 1, 1,
-1.137996, -0.8062281, -2.257915, 1, 1, 1, 1, 1,
-1.13529, 0.4957139, -0.9935295, 1, 1, 1, 1, 1,
-1.130961, -0.5469565, -1.078909, 1, 1, 1, 1, 1,
-1.119719, -0.6929661, -3.41865, 1, 1, 1, 1, 1,
-1.119345, 2.227077, 0.0982011, 1, 1, 1, 1, 1,
-1.112698, -1.097791, -3.342453, 1, 1, 1, 1, 1,
-1.111243, 0.2187672, -2.362142, 1, 1, 1, 1, 1,
-1.089452, -0.7328424, -1.148661, 1, 1, 1, 1, 1,
-1.082403, 1.144557, -3.006591, 0, 0, 1, 1, 1,
-1.080249, 0.5072708, -1.351572, 1, 0, 0, 1, 1,
-1.076279, 1.256037, -0.9851049, 1, 0, 0, 1, 1,
-1.069108, -0.2355588, -4.167846, 1, 0, 0, 1, 1,
-1.060243, 1.061663, -1.365317, 1, 0, 0, 1, 1,
-1.053956, 0.9404803, -1.116321, 1, 0, 0, 1, 1,
-1.053358, -1.269767, -3.216758, 0, 0, 0, 1, 1,
-1.050977, 1.707445, -0.4598393, 0, 0, 0, 1, 1,
-1.030436, -0.6722587, -0.8120526, 0, 0, 0, 1, 1,
-1.030205, 1.944063, 0.5379715, 0, 0, 0, 1, 1,
-1.025682, 0.05677213, -2.132874, 0, 0, 0, 1, 1,
-1.023294, -0.858333, 0.4016543, 0, 0, 0, 1, 1,
-1.017545, -1.189925, -1.615888, 0, 0, 0, 1, 1,
-1.014571, 0.09822372, -1.992912, 1, 1, 1, 1, 1,
-1.014462, -0.7189428, -3.819738, 1, 1, 1, 1, 1,
-1.012574, 0.06840716, -0.07851962, 1, 1, 1, 1, 1,
-1.011642, -1.946398, -2.014362, 1, 1, 1, 1, 1,
-1.010515, 0.8191385, -1.123722, 1, 1, 1, 1, 1,
-0.9992717, 1.137116, -1.15358, 1, 1, 1, 1, 1,
-0.9948393, 1.246446, -1.406759, 1, 1, 1, 1, 1,
-0.9945188, 1.849357, -1.235017, 1, 1, 1, 1, 1,
-0.9930755, 1.028262, -0.4790773, 1, 1, 1, 1, 1,
-0.9910172, -0.9280394, -1.872811, 1, 1, 1, 1, 1,
-0.9905684, 1.56335, 0.3037651, 1, 1, 1, 1, 1,
-0.9899622, 0.6451555, -0.6307611, 1, 1, 1, 1, 1,
-0.9878716, 1.491851, 0.3826503, 1, 1, 1, 1, 1,
-0.9873722, 0.1355591, -2.550176, 1, 1, 1, 1, 1,
-0.9856694, -1.274446, -1.664644, 1, 1, 1, 1, 1,
-0.9831936, -0.1193056, -1.440217, 0, 0, 1, 1, 1,
-0.9748667, 2.447735, -1.131485, 1, 0, 0, 1, 1,
-0.9712754, -0.2324286, 0.08210573, 1, 0, 0, 1, 1,
-0.9695442, -0.3534168, -3.177659, 1, 0, 0, 1, 1,
-0.9666299, -1.592858, -2.674335, 1, 0, 0, 1, 1,
-0.9650761, 1.53919, -2.649168, 1, 0, 0, 1, 1,
-0.9649457, 0.4335198, -0.6018533, 0, 0, 0, 1, 1,
-0.9646333, -0.03198556, -1.177524, 0, 0, 0, 1, 1,
-0.9643115, -0.34679, -3.820546, 0, 0, 0, 1, 1,
-0.9640906, -3.688029, -2.256616, 0, 0, 0, 1, 1,
-0.9531179, -2.650449, -2.954933, 0, 0, 0, 1, 1,
-0.9519685, 0.6300689, 0.2929831, 0, 0, 0, 1, 1,
-0.9448749, -0.7546778, -3.170291, 0, 0, 0, 1, 1,
-0.9427772, -0.6817923, -2.153155, 1, 1, 1, 1, 1,
-0.9392089, -1.223729, -0.9432186, 1, 1, 1, 1, 1,
-0.9195752, -0.2944361, -2.754, 1, 1, 1, 1, 1,
-0.9156766, -0.6986886, -4.919469, 1, 1, 1, 1, 1,
-0.9127794, 0.1670884, -0.8278143, 1, 1, 1, 1, 1,
-0.9105533, -0.1816717, -1.331688, 1, 1, 1, 1, 1,
-0.9062059, -0.09184524, -3.176174, 1, 1, 1, 1, 1,
-0.8825356, -0.6513087, -0.5944119, 1, 1, 1, 1, 1,
-0.8806316, -0.6924457, -0.1769612, 1, 1, 1, 1, 1,
-0.8787004, 0.4690644, -0.2842631, 1, 1, 1, 1, 1,
-0.8646135, 2.227739, 0.6573542, 1, 1, 1, 1, 1,
-0.8630657, 0.1336192, -0.418898, 1, 1, 1, 1, 1,
-0.8539067, -0.8201998, -2.331872, 1, 1, 1, 1, 1,
-0.8510136, -1.679562, -2.277959, 1, 1, 1, 1, 1,
-0.849673, 0.07086365, -1.408406, 1, 1, 1, 1, 1,
-0.8410925, -0.6577988, -1.424926, 0, 0, 1, 1, 1,
-0.8400131, 0.8259655, -1.798148, 1, 0, 0, 1, 1,
-0.8359307, 1.525333, -1.231073, 1, 0, 0, 1, 1,
-0.8260862, 0.08344885, -0.9462679, 1, 0, 0, 1, 1,
-0.8220351, 0.7508522, 0.3895836, 1, 0, 0, 1, 1,
-0.814675, -0.1967015, -3.584917, 1, 0, 0, 1, 1,
-0.8123527, 0.8015959, 0.7023568, 0, 0, 0, 1, 1,
-0.8123119, 0.4863641, -1.571756, 0, 0, 0, 1, 1,
-0.8096527, -1.157403, -1.583019, 0, 0, 0, 1, 1,
-0.8081579, -0.2757934, 0.2172136, 0, 0, 0, 1, 1,
-0.8054045, 1.710533, -1.996636, 0, 0, 0, 1, 1,
-0.8001514, -0.07483382, -2.164106, 0, 0, 0, 1, 1,
-0.7967418, -0.6918948, -1.433882, 0, 0, 0, 1, 1,
-0.7954818, -0.5499617, -3.668251, 1, 1, 1, 1, 1,
-0.794461, 1.093288, 0.1612548, 1, 1, 1, 1, 1,
-0.7842504, -0.3924165, -2.328166, 1, 1, 1, 1, 1,
-0.7820334, 1.549579, 1.928554, 1, 1, 1, 1, 1,
-0.778518, -0.2877845, -1.514733, 1, 1, 1, 1, 1,
-0.7779141, 1.868125, 0.3678395, 1, 1, 1, 1, 1,
-0.7777095, -1.034436, -3.618554, 1, 1, 1, 1, 1,
-0.7771563, 0.7606352, -2.936589, 1, 1, 1, 1, 1,
-0.7760933, -1.582951, -4.008875, 1, 1, 1, 1, 1,
-0.7740915, 0.518328, -2.248445, 1, 1, 1, 1, 1,
-0.7635524, -0.1822768, -0.7881843, 1, 1, 1, 1, 1,
-0.7613672, -0.4395968, 0.5715149, 1, 1, 1, 1, 1,
-0.7607117, -3.192985, -4.051939, 1, 1, 1, 1, 1,
-0.7537426, -0.4357435, -3.466088, 1, 1, 1, 1, 1,
-0.7479023, 0.01377477, -2.71219, 1, 1, 1, 1, 1,
-0.7429007, -0.9586013, -1.851502, 0, 0, 1, 1, 1,
-0.7397615, -0.3366749, -3.722354, 1, 0, 0, 1, 1,
-0.7304221, -0.07247512, -2.550019, 1, 0, 0, 1, 1,
-0.7269941, -1.405634, -2.517775, 1, 0, 0, 1, 1,
-0.723568, -0.599322, -1.9377, 1, 0, 0, 1, 1,
-0.7139969, -2.307192, -2.901642, 1, 0, 0, 1, 1,
-0.7069075, 0.9033838, -0.2703125, 0, 0, 0, 1, 1,
-0.7064897, 0.5304394, -0.725651, 0, 0, 0, 1, 1,
-0.6992404, -1.637994, -3.39926, 0, 0, 0, 1, 1,
-0.6980813, 1.066683, -2.375671, 0, 0, 0, 1, 1,
-0.6974304, 0.7153507, -0.4848371, 0, 0, 0, 1, 1,
-0.6969942, -0.4502423, -1.925956, 0, 0, 0, 1, 1,
-0.6948648, 0.4237328, -0.2943618, 0, 0, 0, 1, 1,
-0.693154, -1.336989, -3.754307, 1, 1, 1, 1, 1,
-0.6930324, -0.7412391, -3.389108, 1, 1, 1, 1, 1,
-0.6920989, -0.9124456, -1.669941, 1, 1, 1, 1, 1,
-0.6909464, 0.261496, -2.784769, 1, 1, 1, 1, 1,
-0.6898535, 0.9719905, -0.7259636, 1, 1, 1, 1, 1,
-0.6860862, 2.114649, 1.251839, 1, 1, 1, 1, 1,
-0.6825733, -0.6527406, -0.224302, 1, 1, 1, 1, 1,
-0.6714418, -1.557949, -3.606707, 1, 1, 1, 1, 1,
-0.6710837, -0.07001299, -1.610499, 1, 1, 1, 1, 1,
-0.6703671, -0.6419973, -1.670486, 1, 1, 1, 1, 1,
-0.6685048, -0.3338447, -2.244199, 1, 1, 1, 1, 1,
-0.66544, -1.021412, -2.20873, 1, 1, 1, 1, 1,
-0.6633807, -0.1814704, -2.240684, 1, 1, 1, 1, 1,
-0.6606594, -0.2339475, -3.502769, 1, 1, 1, 1, 1,
-0.6597938, 0.1301207, -0.1865002, 1, 1, 1, 1, 1,
-0.6585596, -0.4151079, -1.568448, 0, 0, 1, 1, 1,
-0.6565606, 1.208079, -0.7039123, 1, 0, 0, 1, 1,
-0.6551923, 1.043946, -0.934974, 1, 0, 0, 1, 1,
-0.6528754, 0.9837998, -0.9357439, 1, 0, 0, 1, 1,
-0.6506717, 0.6748016, -0.5029071, 1, 0, 0, 1, 1,
-0.643222, -0.3160802, -1.689716, 1, 0, 0, 1, 1,
-0.6371676, 0.9896021, 0.5191025, 0, 0, 0, 1, 1,
-0.636986, -1.238339, -2.754419, 0, 0, 0, 1, 1,
-0.6340641, 0.4975899, -0.7858576, 0, 0, 0, 1, 1,
-0.633726, -0.5662041, -1.69945, 0, 0, 0, 1, 1,
-0.6287595, 1.386331, -1.994718, 0, 0, 0, 1, 1,
-0.6281033, 0.8073783, -0.06686128, 0, 0, 0, 1, 1,
-0.6251033, 1.050399, -2.054259, 0, 0, 0, 1, 1,
-0.6220527, -0.6127325, -1.559059, 1, 1, 1, 1, 1,
-0.6217172, -0.7803564, -3.266388, 1, 1, 1, 1, 1,
-0.6212296, -0.4447078, -0.3254045, 1, 1, 1, 1, 1,
-0.6169408, 0.8858019, 0.4024025, 1, 1, 1, 1, 1,
-0.6166495, -0.1823783, -1.998301, 1, 1, 1, 1, 1,
-0.616393, -1.846447, -2.260834, 1, 1, 1, 1, 1,
-0.6131232, 0.2087662, -3.148717, 1, 1, 1, 1, 1,
-0.6124765, -0.9976048, -1.116668, 1, 1, 1, 1, 1,
-0.6104331, -1.167752, -2.655515, 1, 1, 1, 1, 1,
-0.6015927, 1.23356, 0.04699273, 1, 1, 1, 1, 1,
-0.588194, -1.154948, -3.109047, 1, 1, 1, 1, 1,
-0.586477, -0.7751581, -0.7071182, 1, 1, 1, 1, 1,
-0.5863463, -0.9767398, -2.999664, 1, 1, 1, 1, 1,
-0.5837787, -1.341269, -2.141584, 1, 1, 1, 1, 1,
-0.5812618, 0.03065723, -1.990574, 1, 1, 1, 1, 1,
-0.5795632, -0.01412109, -2.603632, 0, 0, 1, 1, 1,
-0.5752988, 0.2149252, -0.4519138, 1, 0, 0, 1, 1,
-0.5746417, 0.3872056, -1.067841, 1, 0, 0, 1, 1,
-0.5728938, 2.044473, 0.6967559, 1, 0, 0, 1, 1,
-0.5688121, -0.05559529, -1.463741, 1, 0, 0, 1, 1,
-0.5681233, 0.1100126, -2.07919, 1, 0, 0, 1, 1,
-0.5629439, -0.3028908, -1.222962, 0, 0, 0, 1, 1,
-0.5566831, 2.123575, -1.1903, 0, 0, 0, 1, 1,
-0.554342, -0.5408181, -3.180023, 0, 0, 0, 1, 1,
-0.5508605, 0.2569498, -1.835809, 0, 0, 0, 1, 1,
-0.5461565, 1.508752, -0.8278536, 0, 0, 0, 1, 1,
-0.5386854, -0.8499321, -3.835873, 0, 0, 0, 1, 1,
-0.53313, 0.06688016, -0.751002, 0, 0, 0, 1, 1,
-0.5305275, -1.167087, -2.392097, 1, 1, 1, 1, 1,
-0.5253148, 1.228301, 0.5969408, 1, 1, 1, 1, 1,
-0.5250223, -0.4765432, -1.155494, 1, 1, 1, 1, 1,
-0.517993, 0.8275114, -1.98027, 1, 1, 1, 1, 1,
-0.5023046, 0.5390762, -2.050404, 1, 1, 1, 1, 1,
-0.5016997, -1.411145, -4.664203, 1, 1, 1, 1, 1,
-0.5004658, 0.2525086, -0.2168027, 1, 1, 1, 1, 1,
-0.4941123, -0.9074915, -1.316294, 1, 1, 1, 1, 1,
-0.4904702, 1.198216, -1.552763, 1, 1, 1, 1, 1,
-0.4860739, 1.706496, -0.2622715, 1, 1, 1, 1, 1,
-0.4830074, -0.3601658, -2.076674, 1, 1, 1, 1, 1,
-0.4748214, 0.2833723, -0.6098232, 1, 1, 1, 1, 1,
-0.4705273, -0.384361, -1.035596, 1, 1, 1, 1, 1,
-0.4678621, -0.7960642, -2.967521, 1, 1, 1, 1, 1,
-0.4675955, -1.391424, -2.104303, 1, 1, 1, 1, 1,
-0.4644625, 0.1045269, -2.472277, 0, 0, 1, 1, 1,
-0.4597263, -0.6021544, -2.604462, 1, 0, 0, 1, 1,
-0.4583024, -0.01923167, -2.453307, 1, 0, 0, 1, 1,
-0.4571584, 0.03928101, -1.621793, 1, 0, 0, 1, 1,
-0.4547399, 0.4578509, -0.04945629, 1, 0, 0, 1, 1,
-0.447898, -0.607546, -2.545646, 1, 0, 0, 1, 1,
-0.4440142, -0.4216384, -2.200681, 0, 0, 0, 1, 1,
-0.4421856, 1.646275, 1.04169, 0, 0, 0, 1, 1,
-0.4379807, 0.6353993, -0.2354037, 0, 0, 0, 1, 1,
-0.4347168, 0.1002683, 0.2634766, 0, 0, 0, 1, 1,
-0.433943, -0.5212228, -3.615049, 0, 0, 0, 1, 1,
-0.4320306, -0.9351971, -2.643152, 0, 0, 0, 1, 1,
-0.4227274, 0.03166627, -2.273626, 0, 0, 0, 1, 1,
-0.4179066, -0.4420419, -3.791547, 1, 1, 1, 1, 1,
-0.4178795, 1.009659, -2.252993, 1, 1, 1, 1, 1,
-0.4178175, 0.7665764, 1.058237, 1, 1, 1, 1, 1,
-0.4159498, 0.440702, -0.6333784, 1, 1, 1, 1, 1,
-0.4147269, -2.223204, -3.738543, 1, 1, 1, 1, 1,
-0.4140176, -1.145187, -2.103545, 1, 1, 1, 1, 1,
-0.4124725, -0.7843516, -3.724775, 1, 1, 1, 1, 1,
-0.4093011, -0.2067576, -2.702398, 1, 1, 1, 1, 1,
-0.4090602, -0.1040401, -1.937672, 1, 1, 1, 1, 1,
-0.3962772, 1.7591, 1.836713, 1, 1, 1, 1, 1,
-0.3960516, 0.1019173, -2.912995, 1, 1, 1, 1, 1,
-0.3943391, -2.068636, -5.340398, 1, 1, 1, 1, 1,
-0.3919993, -1.48998, -3.423412, 1, 1, 1, 1, 1,
-0.391092, 1.411309, -0.4739545, 1, 1, 1, 1, 1,
-0.3876606, 0.04790045, 0.3325835, 1, 1, 1, 1, 1,
-0.3859126, -1.333248, -3.684489, 0, 0, 1, 1, 1,
-0.3820015, -0.9366632, -2.056378, 1, 0, 0, 1, 1,
-0.3792813, 1.236751, 0.9454873, 1, 0, 0, 1, 1,
-0.3785441, 0.4227966, -1.425473, 1, 0, 0, 1, 1,
-0.378293, -0.2946359, -2.728143, 1, 0, 0, 1, 1,
-0.3740991, -1.443504, -0.2941583, 1, 0, 0, 1, 1,
-0.3709777, -0.8816867, -2.741774, 0, 0, 0, 1, 1,
-0.3675749, -0.01299451, -1.974061, 0, 0, 0, 1, 1,
-0.3611573, -0.9297501, -1.692722, 0, 0, 0, 1, 1,
-0.3578631, 0.2517096, -2.00613, 0, 0, 0, 1, 1,
-0.3572177, -0.9329675, -3.346029, 0, 0, 0, 1, 1,
-0.357154, 2.19958, -0.03826853, 0, 0, 0, 1, 1,
-0.3562757, 0.9785426, -0.1588828, 0, 0, 0, 1, 1,
-0.3558728, -0.3559746, -3.185467, 1, 1, 1, 1, 1,
-0.3522628, -1.205121, -3.749126, 1, 1, 1, 1, 1,
-0.3519563, -1.396856, -3.592655, 1, 1, 1, 1, 1,
-0.3482248, 0.6485276, 0.4565017, 1, 1, 1, 1, 1,
-0.348216, 1.299325, 0.9755077, 1, 1, 1, 1, 1,
-0.3428896, 0.3323658, 0.0909328, 1, 1, 1, 1, 1,
-0.3411663, 0.2124375, -0.854512, 1, 1, 1, 1, 1,
-0.3394911, -0.3838547, -2.93425, 1, 1, 1, 1, 1,
-0.3375658, -1.12407, -2.899722, 1, 1, 1, 1, 1,
-0.3308693, -0.4612824, -3.088747, 1, 1, 1, 1, 1,
-0.3290386, 0.3505042, 0.02619745, 1, 1, 1, 1, 1,
-0.3270063, 1.933765, 0.4755026, 1, 1, 1, 1, 1,
-0.325812, -0.08691126, -2.195037, 1, 1, 1, 1, 1,
-0.3256163, 0.3078218, -2.445793, 1, 1, 1, 1, 1,
-0.3250041, -0.3253585, -2.057187, 1, 1, 1, 1, 1,
-0.3242131, 0.4954748, -1.305449, 0, 0, 1, 1, 1,
-0.3238749, 1.09019, -0.9865535, 1, 0, 0, 1, 1,
-0.3237672, -0.7737613, -3.112381, 1, 0, 0, 1, 1,
-0.319309, -0.2977639, -0.6128829, 1, 0, 0, 1, 1,
-0.3172494, 1.129874, 0.2729636, 1, 0, 0, 1, 1,
-0.3160883, 0.7791373, -1.205282, 1, 0, 0, 1, 1,
-0.3150046, -0.1688507, -1.748645, 0, 0, 0, 1, 1,
-0.3146567, -0.2008747, -4.484613, 0, 0, 0, 1, 1,
-0.3124263, 0.3240963, 0.1451795, 0, 0, 0, 1, 1,
-0.311496, -1.336122, -3.542465, 0, 0, 0, 1, 1,
-0.3090142, -1.517293, -3.493084, 0, 0, 0, 1, 1,
-0.304781, -1.064163, -2.78803, 0, 0, 0, 1, 1,
-0.2968911, 1.137586, 1.192859, 0, 0, 0, 1, 1,
-0.2945834, 0.6201854, 1.231387, 1, 1, 1, 1, 1,
-0.2929853, 0.17661, -1.282368, 1, 1, 1, 1, 1,
-0.2922855, -1.477145, -5.386618, 1, 1, 1, 1, 1,
-0.2904632, 2.516176, 1.020115, 1, 1, 1, 1, 1,
-0.2903726, 0.9978636, -0.9978309, 1, 1, 1, 1, 1,
-0.2862846, 0.1361495, 0.7867022, 1, 1, 1, 1, 1,
-0.279456, -0.7395177, -3.230877, 1, 1, 1, 1, 1,
-0.2786087, 0.3953903, -0.5178047, 1, 1, 1, 1, 1,
-0.276386, -0.2018932, -2.520833, 1, 1, 1, 1, 1,
-0.2736258, -1.39362, -3.416547, 1, 1, 1, 1, 1,
-0.2690336, -0.9631889, -2.227975, 1, 1, 1, 1, 1,
-0.2646645, -0.7838089, -3.721864, 1, 1, 1, 1, 1,
-0.2639746, -1.441981, -2.679775, 1, 1, 1, 1, 1,
-0.2635141, -1.611088, -4.755706, 1, 1, 1, 1, 1,
-0.2625028, -1.084985, -1.906614, 1, 1, 1, 1, 1,
-0.2604082, 0.7133762, -0.42928, 0, 0, 1, 1, 1,
-0.2603183, 1.332106, -0.7383922, 1, 0, 0, 1, 1,
-0.2541274, 2.641123, 1.529131, 1, 0, 0, 1, 1,
-0.2502553, -0.8055993, -3.273541, 1, 0, 0, 1, 1,
-0.2492539, 1.736329, 1.398565, 1, 0, 0, 1, 1,
-0.2452165, 0.8975467, 0.1530991, 1, 0, 0, 1, 1,
-0.2416023, -0.3157642, -1.64811, 0, 0, 0, 1, 1,
-0.2407597, -0.7191355, -3.322106, 0, 0, 0, 1, 1,
-0.2402239, 0.7267249, -0.3498415, 0, 0, 0, 1, 1,
-0.2389036, -0.9746992, -2.376539, 0, 0, 0, 1, 1,
-0.236218, 0.3238112, -0.4970837, 0, 0, 0, 1, 1,
-0.2360659, -0.3268603, -3.208359, 0, 0, 0, 1, 1,
-0.2294391, 0.5745749, 0.7903873, 0, 0, 0, 1, 1,
-0.2281188, -0.5304672, -4.185001, 1, 1, 1, 1, 1,
-0.2276159, 1.082238, -0.8161151, 1, 1, 1, 1, 1,
-0.2225241, -0.8418469, -3.804678, 1, 1, 1, 1, 1,
-0.2225099, -1.363472, -3.423114, 1, 1, 1, 1, 1,
-0.2218965, -0.487654, -1.970026, 1, 1, 1, 1, 1,
-0.2213464, -0.5096925, -2.77487, 1, 1, 1, 1, 1,
-0.2168976, 0.1331645, -1.615715, 1, 1, 1, 1, 1,
-0.2149695, -0.05271444, -1.659653, 1, 1, 1, 1, 1,
-0.2146822, 0.2179882, 0.908454, 1, 1, 1, 1, 1,
-0.2124957, -0.04184367, -1.998547, 1, 1, 1, 1, 1,
-0.2079852, 0.8027093, -0.6533929, 1, 1, 1, 1, 1,
-0.2060873, -0.6573678, -4.929168, 1, 1, 1, 1, 1,
-0.2028146, -1.594864, -4.89991, 1, 1, 1, 1, 1,
-0.193221, 0.858449, -1.290465, 1, 1, 1, 1, 1,
-0.1898326, 0.2058875, 0.09765347, 1, 1, 1, 1, 1,
-0.1876579, -0.06173643, -1.268999, 0, 0, 1, 1, 1,
-0.18451, -0.5041438, -3.166359, 1, 0, 0, 1, 1,
-0.1780614, 0.4040463, -1.20009, 1, 0, 0, 1, 1,
-0.1751945, 0.1503396, -2.49421, 1, 0, 0, 1, 1,
-0.1734979, 1.511485, 0.5088625, 1, 0, 0, 1, 1,
-0.1714936, 0.02897652, -1.965581, 1, 0, 0, 1, 1,
-0.16869, 1.652959, -1.155, 0, 0, 0, 1, 1,
-0.1680496, -0.2001768, -3.432637, 0, 0, 0, 1, 1,
-0.165812, -0.9351639, -2.390603, 0, 0, 0, 1, 1,
-0.1644541, -0.8234118, -2.855056, 0, 0, 0, 1, 1,
-0.1641306, -0.2590018, -2.266571, 0, 0, 0, 1, 1,
-0.1607956, -0.772836, -2.128412, 0, 0, 0, 1, 1,
-0.1557955, 0.07230912, 0.3143339, 0, 0, 0, 1, 1,
-0.155449, -0.699333, -4.240899, 1, 1, 1, 1, 1,
-0.1467398, -1.168787, -2.920783, 1, 1, 1, 1, 1,
-0.1426573, 0.1387616, -1.303036, 1, 1, 1, 1, 1,
-0.1375591, -0.7476187, -3.85658, 1, 1, 1, 1, 1,
-0.1366785, 0.2299708, 0.05032883, 1, 1, 1, 1, 1,
-0.1361358, 1.325552, 0.003231563, 1, 1, 1, 1, 1,
-0.1356356, -0.8808645, -4.025421, 1, 1, 1, 1, 1,
-0.1347575, 1.64745, 0.8204809, 1, 1, 1, 1, 1,
-0.1296869, -0.9344282, -1.995003, 1, 1, 1, 1, 1,
-0.1291501, -0.4845193, -3.093386, 1, 1, 1, 1, 1,
-0.1276993, 0.2976148, -0.9115663, 1, 1, 1, 1, 1,
-0.126091, -0.0743847, -2.273193, 1, 1, 1, 1, 1,
-0.1208487, -0.4278679, -1.521839, 1, 1, 1, 1, 1,
-0.1201896, 0.03995198, 0.4899411, 1, 1, 1, 1, 1,
-0.1196868, -1.130274, -2.396445, 1, 1, 1, 1, 1,
-0.1174524, 1.548297, -0.8830052, 0, 0, 1, 1, 1,
-0.1090309, 2.194131, -0.419281, 1, 0, 0, 1, 1,
-0.1037925, 0.4603592, 0.01628331, 1, 0, 0, 1, 1,
-0.1033475, 1.903362, -0.7687026, 1, 0, 0, 1, 1,
-0.1018841, -0.4967336, -2.627405, 1, 0, 0, 1, 1,
-0.1014062, -0.9486814, -5.157478, 1, 0, 0, 1, 1,
-0.09880581, 0.5996771, -0.3663574, 0, 0, 0, 1, 1,
-0.09154214, 0.008458738, -0.6144835, 0, 0, 0, 1, 1,
-0.09118324, 0.5357778, -0.3831881, 0, 0, 0, 1, 1,
-0.08566967, -1.555762, -3.818183, 0, 0, 0, 1, 1,
-0.08379429, 0.3880497, -0.9498282, 0, 0, 0, 1, 1,
-0.07241624, -0.5457193, -3.473265, 0, 0, 0, 1, 1,
-0.07127687, 0.005942867, -2.180279, 0, 0, 0, 1, 1,
-0.0678689, 0.390828, 0.07555507, 1, 1, 1, 1, 1,
-0.06212597, -1.872211, -2.404883, 1, 1, 1, 1, 1,
-0.05818747, -0.4928491, -4.346638, 1, 1, 1, 1, 1,
-0.05725332, 2.440815, -0.4309273, 1, 1, 1, 1, 1,
-0.05247155, 1.061928, 0.8017542, 1, 1, 1, 1, 1,
-0.05128618, 0.870515, -1.176263, 1, 1, 1, 1, 1,
-0.04759831, -1.060387, -5.250598, 1, 1, 1, 1, 1,
-0.04710883, 0.1903743, -0.6738483, 1, 1, 1, 1, 1,
-0.04619997, 0.3046635, 0.8045259, 1, 1, 1, 1, 1,
-0.04480403, -0.6781512, -3.189877, 1, 1, 1, 1, 1,
-0.04069661, -1.044954, -2.811458, 1, 1, 1, 1, 1,
-0.03806758, -0.5740628, -1.922032, 1, 1, 1, 1, 1,
-0.03314701, 0.2352723, 1.049574, 1, 1, 1, 1, 1,
-0.0317401, 0.7187858, 0.4352563, 1, 1, 1, 1, 1,
-0.03112537, 1.066656, 1.088887, 1, 1, 1, 1, 1,
-0.02565965, 0.3989719, -0.3105828, 0, 0, 1, 1, 1,
-0.02426738, -1.070698, -3.011969, 1, 0, 0, 1, 1,
-0.02426049, 0.07120445, 1.29495, 1, 0, 0, 1, 1,
-0.02390183, -1.278641, -4.779055, 1, 0, 0, 1, 1,
-0.02132708, -0.7966532, -2.287237, 1, 0, 0, 1, 1,
-0.01896879, -0.1487431, -2.54679, 1, 0, 0, 1, 1,
-0.01558767, 0.7909438, 0.3958994, 0, 0, 0, 1, 1,
-0.01303008, 1.460884, 0.600082, 0, 0, 0, 1, 1,
-0.01251636, 1.671604, 1.311516, 0, 0, 0, 1, 1,
-0.0121079, -0.2665114, -2.213487, 0, 0, 0, 1, 1,
-0.009929405, -1.897559, -4.011836, 0, 0, 0, 1, 1,
-0.009928407, -0.4964792, -2.736341, 0, 0, 0, 1, 1,
-0.008957541, 0.4219256, 1.111163, 0, 0, 0, 1, 1,
-0.007627884, 0.6049914, -1.177796, 1, 1, 1, 1, 1,
-0.004413076, 1.946502, 1.271061, 1, 1, 1, 1, 1,
-0.001896334, -0.4715102, -3.610119, 1, 1, 1, 1, 1,
0.00246573, 0.6858152, 1.537312, 1, 1, 1, 1, 1,
0.004133841, 0.7356452, -0.4925835, 1, 1, 1, 1, 1,
0.00705004, 1.866107, -0.335386, 1, 1, 1, 1, 1,
0.01398403, 1.226593, 1.718621, 1, 1, 1, 1, 1,
0.01896801, -1.021502, 3.348417, 1, 1, 1, 1, 1,
0.01954388, 1.129003, -0.2443619, 1, 1, 1, 1, 1,
0.0197025, 1.146155, -1.170979, 1, 1, 1, 1, 1,
0.02176041, 0.05564378, 0.3827087, 1, 1, 1, 1, 1,
0.02225952, 0.1129721, 1.325044, 1, 1, 1, 1, 1,
0.02329398, 0.2552878, -0.8335453, 1, 1, 1, 1, 1,
0.02822072, -0.1156511, 3.121528, 1, 1, 1, 1, 1,
0.02839759, 1.807551, 0.6513836, 1, 1, 1, 1, 1,
0.02894602, -0.3539629, 3.074812, 0, 0, 1, 1, 1,
0.03091636, -1.516714, 3.684619, 1, 0, 0, 1, 1,
0.03277902, -0.9767848, 3.910959, 1, 0, 0, 1, 1,
0.03995446, 0.1228814, 1.189268, 1, 0, 0, 1, 1,
0.04241294, 0.6304768, 1.330372, 1, 0, 0, 1, 1,
0.0445142, -1.118973, 3.803128, 1, 0, 0, 1, 1,
0.04480183, -1.934168, 1.643727, 0, 0, 0, 1, 1,
0.04709278, -0.2351124, 4.959629, 0, 0, 0, 1, 1,
0.04712272, 0.4758745, 0.3212667, 0, 0, 0, 1, 1,
0.04914816, 0.5406523, -1.788277, 0, 0, 0, 1, 1,
0.05081159, -0.3709289, 3.91354, 0, 0, 0, 1, 1,
0.05296248, 0.03944345, 0.5963389, 0, 0, 0, 1, 1,
0.05489555, 0.2422748, 1.598369, 0, 0, 0, 1, 1,
0.05549592, -0.5562416, 2.617196, 1, 1, 1, 1, 1,
0.05672434, 1.032223, -0.8484178, 1, 1, 1, 1, 1,
0.06279138, 0.1421253, 1.023519, 1, 1, 1, 1, 1,
0.06628458, 1.367791, 1.503319, 1, 1, 1, 1, 1,
0.06734291, -0.3018349, 3.301784, 1, 1, 1, 1, 1,
0.0684596, 0.8248172, -0.1684975, 1, 1, 1, 1, 1,
0.07022181, 0.2110577, 0.2266715, 1, 1, 1, 1, 1,
0.07029588, 0.8708352, 0.05449938, 1, 1, 1, 1, 1,
0.07175283, 0.9857815, -0.4965806, 1, 1, 1, 1, 1,
0.07256324, 0.8188146, -0.08465159, 1, 1, 1, 1, 1,
0.07833243, 0.05019195, 0.2508231, 1, 1, 1, 1, 1,
0.09290314, -0.00452126, 2.734129, 1, 1, 1, 1, 1,
0.09293465, -0.3627655, 3.553084, 1, 1, 1, 1, 1,
0.0937183, -1.370448, 4.043201, 1, 1, 1, 1, 1,
0.09376708, -0.7490516, 2.839097, 1, 1, 1, 1, 1,
0.09515452, 0.4490092, -0.7427845, 0, 0, 1, 1, 1,
0.09578454, -1.425548, 2.681442, 1, 0, 0, 1, 1,
0.09586085, -1.69205, 3.682807, 1, 0, 0, 1, 1,
0.09776741, 0.4331911, 0.7073038, 1, 0, 0, 1, 1,
0.09897152, 2.317169, -1.011837, 1, 0, 0, 1, 1,
0.1032981, -0.5548397, 4.614222, 1, 0, 0, 1, 1,
0.1055866, 0.5180305, 0.8544602, 0, 0, 0, 1, 1,
0.1129108, 1.463228, 0.06618346, 0, 0, 0, 1, 1,
0.1133941, -0.02217419, 1.294716, 0, 0, 0, 1, 1,
0.1142444, -0.01371392, -0.04541873, 0, 0, 0, 1, 1,
0.1187438, 1.018259, 0.8298212, 0, 0, 0, 1, 1,
0.1188717, -0.2444322, 1.579817, 0, 0, 0, 1, 1,
0.1198662, 0.5032358, 0.8863708, 0, 0, 0, 1, 1,
0.1210331, -0.5191897, 0.4893432, 1, 1, 1, 1, 1,
0.1292106, 1.336579, 0.8444673, 1, 1, 1, 1, 1,
0.1305009, 0.01784117, 2.670203, 1, 1, 1, 1, 1,
0.1309719, -1.801599, 2.958558, 1, 1, 1, 1, 1,
0.132081, 0.8252416, 2.334361, 1, 1, 1, 1, 1,
0.1323248, 0.1730432, 2.141658, 1, 1, 1, 1, 1,
0.1325493, -1.217148, 2.124613, 1, 1, 1, 1, 1,
0.1328359, 1.130368, 0.6382657, 1, 1, 1, 1, 1,
0.1331246, 0.734535, 1.721946, 1, 1, 1, 1, 1,
0.1366088, -0.3510891, 1.053193, 1, 1, 1, 1, 1,
0.138346, -0.5784382, 2.197856, 1, 1, 1, 1, 1,
0.1390451, -0.2571726, 1.852141, 1, 1, 1, 1, 1,
0.1429235, -0.4473563, 1.439245, 1, 1, 1, 1, 1,
0.1447949, -0.4117557, 3.180368, 1, 1, 1, 1, 1,
0.1488498, 0.2488567, 0.4140593, 1, 1, 1, 1, 1,
0.149297, 0.1605162, 0.5199919, 0, 0, 1, 1, 1,
0.1520377, -0.6190239, 2.431287, 1, 0, 0, 1, 1,
0.1548746, -1.104601, 4.423739, 1, 0, 0, 1, 1,
0.1577533, 1.850995, 0.0002733404, 1, 0, 0, 1, 1,
0.1585566, -0.6251976, 2.52734, 1, 0, 0, 1, 1,
0.1640587, -2.808203, 3.186054, 1, 0, 0, 1, 1,
0.1655298, 0.1624896, -0.743329, 0, 0, 0, 1, 1,
0.1669676, 0.3219253, 1.727432, 0, 0, 0, 1, 1,
0.1732859, 0.4733549, -1.624912, 0, 0, 0, 1, 1,
0.1837022, 0.2261839, 1.053642, 0, 0, 0, 1, 1,
0.186594, -0.4751995, 3.197691, 0, 0, 0, 1, 1,
0.1866554, 0.9411547, 1.887322, 0, 0, 0, 1, 1,
0.1868452, 0.05253214, 1.639959, 0, 0, 0, 1, 1,
0.1878477, 0.06214144, 0.9235761, 1, 1, 1, 1, 1,
0.1891321, 1.355835, -0.6909773, 1, 1, 1, 1, 1,
0.1891728, -1.953763, 3.359127, 1, 1, 1, 1, 1,
0.1966714, 2.166395, -0.5735672, 1, 1, 1, 1, 1,
0.1997289, 0.8452961, -1.030739, 1, 1, 1, 1, 1,
0.200412, 0.2796944, 0.7921959, 1, 1, 1, 1, 1,
0.2004175, -1.058834, 1.881502, 1, 1, 1, 1, 1,
0.2148196, 0.6346169, 1.558762, 1, 1, 1, 1, 1,
0.2172105, 1.443806, 1.873586, 1, 1, 1, 1, 1,
0.2222786, 1.521981, 0.7520004, 1, 1, 1, 1, 1,
0.224703, 0.2012397, 0.8892617, 1, 1, 1, 1, 1,
0.2254289, 0.04796642, 2.146228, 1, 1, 1, 1, 1,
0.225877, 0.4548257, 2.887404, 1, 1, 1, 1, 1,
0.2316105, -0.6570272, 0.8172114, 1, 1, 1, 1, 1,
0.2346373, -0.5854364, 4.114407, 1, 1, 1, 1, 1,
0.2375001, 1.324954, -1.014631, 0, 0, 1, 1, 1,
0.2382444, 0.3007487, -0.2375728, 1, 0, 0, 1, 1,
0.2398954, -0.04200733, 2.512885, 1, 0, 0, 1, 1,
0.2409702, 0.3942307, 0.7268336, 1, 0, 0, 1, 1,
0.2440765, -1.364341, 3.212146, 1, 0, 0, 1, 1,
0.2499678, 0.4968696, -0.01689068, 1, 0, 0, 1, 1,
0.2553794, -0.6325399, 2.406927, 0, 0, 0, 1, 1,
0.2558423, 2.508501, 0.8953772, 0, 0, 0, 1, 1,
0.2559915, -0.3647796, 1.81998, 0, 0, 0, 1, 1,
0.2584089, -1.244092, 2.531099, 0, 0, 0, 1, 1,
0.2624687, 0.9428473, -0.6742586, 0, 0, 0, 1, 1,
0.265403, 2.689785, -0.9735447, 0, 0, 0, 1, 1,
0.2663313, -1.907007, 2.998609, 0, 0, 0, 1, 1,
0.2665042, -1.575556, 3.413584, 1, 1, 1, 1, 1,
0.274875, 0.3907834, 0.5780678, 1, 1, 1, 1, 1,
0.2809041, -0.2285368, 2.077799, 1, 1, 1, 1, 1,
0.2858798, 2.96062, 0.08173119, 1, 1, 1, 1, 1,
0.288744, -0.1048656, 1.241153, 1, 1, 1, 1, 1,
0.2914724, 0.5325426, 0.05855295, 1, 1, 1, 1, 1,
0.2923786, 0.7165325, 1.038755, 1, 1, 1, 1, 1,
0.2926568, 0.2625344, 0.2813569, 1, 1, 1, 1, 1,
0.3022039, 0.4602713, 0.3666124, 1, 1, 1, 1, 1,
0.3023553, 2.299079, -0.1675156, 1, 1, 1, 1, 1,
0.3052275, 0.3264448, 1.711503, 1, 1, 1, 1, 1,
0.3064775, 1.17564, 0.09010436, 1, 1, 1, 1, 1,
0.3066555, -0.7289342, 2.84482, 1, 1, 1, 1, 1,
0.3086458, -0.1441614, 1.511697, 1, 1, 1, 1, 1,
0.3131882, 0.8573859, -1.275732, 1, 1, 1, 1, 1,
0.3159478, -0.049014, 1.531172, 0, 0, 1, 1, 1,
0.3161927, 1.071592, -0.5611869, 1, 0, 0, 1, 1,
0.3185041, 1.837599, -2.271278, 1, 0, 0, 1, 1,
0.3193762, 0.3982641, 1.381165, 1, 0, 0, 1, 1,
0.3202216, 0.5619127, 1.397909, 1, 0, 0, 1, 1,
0.3209192, 0.6192395, -0.1105042, 1, 0, 0, 1, 1,
0.3233089, -0.7409748, 3.212987, 0, 0, 0, 1, 1,
0.3263526, -0.8080125, 3.149714, 0, 0, 0, 1, 1,
0.3278315, -0.4890713, 2.961773, 0, 0, 0, 1, 1,
0.3335896, -2.456965, 3.108596, 0, 0, 0, 1, 1,
0.3336199, 1.054748, -0.2991108, 0, 0, 0, 1, 1,
0.3337501, -1.282548, 2.990497, 0, 0, 0, 1, 1,
0.3362252, 1.183092, -1.09211, 0, 0, 0, 1, 1,
0.337676, 0.01450517, 0.9741288, 1, 1, 1, 1, 1,
0.3408307, -0.2802154, 3.347349, 1, 1, 1, 1, 1,
0.3427868, 0.341706, -0.6167289, 1, 1, 1, 1, 1,
0.346573, 0.6909727, 1.188939, 1, 1, 1, 1, 1,
0.3474799, 1.26874, 2.023355, 1, 1, 1, 1, 1,
0.349187, 1.86277, 0.6289813, 1, 1, 1, 1, 1,
0.3491996, -0.340307, 2.482285, 1, 1, 1, 1, 1,
0.3504374, -1.806584, 4.537806, 1, 1, 1, 1, 1,
0.3512284, -0.2308002, 0.8766167, 1, 1, 1, 1, 1,
0.3538901, -0.2176298, 2.374605, 1, 1, 1, 1, 1,
0.3539899, -1.59919, 3.255691, 1, 1, 1, 1, 1,
0.3546912, 0.8316745, 1.238524, 1, 1, 1, 1, 1,
0.3571093, -0.6466752, 3.032574, 1, 1, 1, 1, 1,
0.3593014, 0.1461926, 1.492325, 1, 1, 1, 1, 1,
0.3599448, 0.1536772, 1.022333, 1, 1, 1, 1, 1,
0.3600533, 2.314414, -0.9437121, 0, 0, 1, 1, 1,
0.3676547, 1.941427, -0.7681716, 1, 0, 0, 1, 1,
0.3731355, -0.7836997, 3.999782, 1, 0, 0, 1, 1,
0.3769976, -0.5029652, 1.665427, 1, 0, 0, 1, 1,
0.3780001, -0.9775173, 4.583224, 1, 0, 0, 1, 1,
0.380323, 0.5172811, 0.8263444, 1, 0, 0, 1, 1,
0.3820691, -0.370515, 3.08989, 0, 0, 0, 1, 1,
0.3824907, 0.6520526, 0.7242256, 0, 0, 0, 1, 1,
0.3834362, 1.666556, 1.160472, 0, 0, 0, 1, 1,
0.3881276, 1.661618, -0.8482422, 0, 0, 0, 1, 1,
0.3899704, -0.465512, 2.429049, 0, 0, 0, 1, 1,
0.3959474, 0.3600276, 0.7588084, 0, 0, 0, 1, 1,
0.3974653, -0.789331, 2.540851, 0, 0, 0, 1, 1,
0.3978009, 0.7631992, 1.184787, 1, 1, 1, 1, 1,
0.3997647, 2.562765, 0.4093933, 1, 1, 1, 1, 1,
0.4017977, -0.6552912, 2.239948, 1, 1, 1, 1, 1,
0.4034081, 1.367348, 1.325684, 1, 1, 1, 1, 1,
0.4037615, 0.03334604, 1.45688, 1, 1, 1, 1, 1,
0.4065716, 0.3787907, 0.09970869, 1, 1, 1, 1, 1,
0.4085104, 0.8948249, 2.938425, 1, 1, 1, 1, 1,
0.4109365, -0.4187927, 2.523362, 1, 1, 1, 1, 1,
0.414222, -0.754718, 1.359387, 1, 1, 1, 1, 1,
0.4190577, 1.402158, 0.2632083, 1, 1, 1, 1, 1,
0.4211996, -1.330381, 3.1664, 1, 1, 1, 1, 1,
0.4280828, 0.1722014, -0.1747278, 1, 1, 1, 1, 1,
0.4282768, 0.5455377, 0.1261422, 1, 1, 1, 1, 1,
0.4303789, -0.9209853, 3.443589, 1, 1, 1, 1, 1,
0.4307901, -0.2344842, 1.197802, 1, 1, 1, 1, 1,
0.4317667, 0.4869346, 0.984882, 0, 0, 1, 1, 1,
0.4346679, -2.251045, 0.4981137, 1, 0, 0, 1, 1,
0.4354246, 0.2234028, 1.540046, 1, 0, 0, 1, 1,
0.437187, 1.36323, -0.4953261, 1, 0, 0, 1, 1,
0.4391299, 2.416156, -0.2939523, 1, 0, 0, 1, 1,
0.4393726, -1.297232, 2.902369, 1, 0, 0, 1, 1,
0.4428032, 0.6206851, 0.9454402, 0, 0, 0, 1, 1,
0.4437671, 2.569001, 1.083391, 0, 0, 0, 1, 1,
0.4452554, 0.07880948, 2.478007, 0, 0, 0, 1, 1,
0.4531834, -1.089649, 3.288599, 0, 0, 0, 1, 1,
0.455171, 0.2836229, 1.610854, 0, 0, 0, 1, 1,
0.4582403, 0.6999217, 1.081096, 0, 0, 0, 1, 1,
0.4629601, -1.431574, 1.785154, 0, 0, 0, 1, 1,
0.4722118, 0.01921615, 0.09838655, 1, 1, 1, 1, 1,
0.4738817, 0.3406008, -1.144257, 1, 1, 1, 1, 1,
0.4740136, 0.3951365, 1.377631, 1, 1, 1, 1, 1,
0.4759619, -0.3404481, 1.358454, 1, 1, 1, 1, 1,
0.4775328, -0.004939373, 2.691307, 1, 1, 1, 1, 1,
0.4802646, -2.019038, 2.900785, 1, 1, 1, 1, 1,
0.4806126, -1.516397, 3.299548, 1, 1, 1, 1, 1,
0.4828261, -0.4302804, 1.891364, 1, 1, 1, 1, 1,
0.4851824, 0.1191964, 0.7850278, 1, 1, 1, 1, 1,
0.4858554, 1.218704, 1.910423, 1, 1, 1, 1, 1,
0.4867039, -0.01534034, 1.084554, 1, 1, 1, 1, 1,
0.4886822, -0.5240551, 2.485925, 1, 1, 1, 1, 1,
0.5054908, -0.6656501, 4.127684, 1, 1, 1, 1, 1,
0.5103186, -1.064539, 1.709398, 1, 1, 1, 1, 1,
0.510418, 0.238057, 1.4866, 1, 1, 1, 1, 1,
0.5131981, -0.3346153, 1.346513, 0, 0, 1, 1, 1,
0.5148554, 0.7996907, -0.09267364, 1, 0, 0, 1, 1,
0.5159235, -0.9504609, 2.656316, 1, 0, 0, 1, 1,
0.5201054, -0.7006127, 4.008111, 1, 0, 0, 1, 1,
0.5232695, 0.2030005, 1.770064, 1, 0, 0, 1, 1,
0.5242957, -0.2462958, 0.5858614, 1, 0, 0, 1, 1,
0.5249822, 0.9430862, 0.3819946, 0, 0, 0, 1, 1,
0.5268248, 0.8410532, 2.423291, 0, 0, 0, 1, 1,
0.5304934, -1.979177, 4.284235, 0, 0, 0, 1, 1,
0.5331426, -0.3073835, 2.408469, 0, 0, 0, 1, 1,
0.5448186, -0.8897348, 4.575544, 0, 0, 0, 1, 1,
0.5453956, 0.269824, 2.297636, 0, 0, 0, 1, 1,
0.5454331, 0.8159096, 0.7970164, 0, 0, 0, 1, 1,
0.5456688, 0.430079, 3.186916, 1, 1, 1, 1, 1,
0.5553135, 0.5793969, 1.005675, 1, 1, 1, 1, 1,
0.5553703, -0.6666267, 0.9272873, 1, 1, 1, 1, 1,
0.5570322, 0.6290034, -1.548056, 1, 1, 1, 1, 1,
0.5573512, -0.2227238, 2.892108, 1, 1, 1, 1, 1,
0.5733705, 0.198326, 0.9089038, 1, 1, 1, 1, 1,
0.5737037, 0.1682647, 1.645689, 1, 1, 1, 1, 1,
0.5747371, -1.971065, 3.782953, 1, 1, 1, 1, 1,
0.5825951, -1.23939, 0.004155442, 1, 1, 1, 1, 1,
0.5834933, 1.501063, 1.176315, 1, 1, 1, 1, 1,
0.5857244, -2.247821, 2.565525, 1, 1, 1, 1, 1,
0.5872443, 1.340782, 0.01861707, 1, 1, 1, 1, 1,
0.592751, 1.070169, 0.8745666, 1, 1, 1, 1, 1,
0.5930344, -1.15079, 4.112846, 1, 1, 1, 1, 1,
0.5930769, -1.152003, 3.877896, 1, 1, 1, 1, 1,
0.5997528, 1.286911, 0.3180228, 0, 0, 1, 1, 1,
0.6013095, 0.05242608, 0.6301718, 1, 0, 0, 1, 1,
0.6020395, -1.102108, 1.330587, 1, 0, 0, 1, 1,
0.6026197, 1.503716, -0.3385818, 1, 0, 0, 1, 1,
0.6063291, 1.320116, 0.260734, 1, 0, 0, 1, 1,
0.6075558, 0.09398022, 1.224195, 1, 0, 0, 1, 1,
0.6083787, 0.0458236, 2.074821, 0, 0, 0, 1, 1,
0.6119118, 0.277994, 1.062961, 0, 0, 0, 1, 1,
0.6121345, 0.2873562, 0.4043245, 0, 0, 0, 1, 1,
0.6147406, 0.2030067, 1.831607, 0, 0, 0, 1, 1,
0.6172901, -0.4169775, 1.094137, 0, 0, 0, 1, 1,
0.6215387, 1.075434, 0.7889556, 0, 0, 0, 1, 1,
0.6249043, 0.505338, 2.995838, 0, 0, 0, 1, 1,
0.6256395, -1.393959, 2.303968, 1, 1, 1, 1, 1,
0.6289995, 0.4334314, 2.63523, 1, 1, 1, 1, 1,
0.6356863, 0.4498414, 1.817432, 1, 1, 1, 1, 1,
0.6381336, 0.01849972, 2.663971, 1, 1, 1, 1, 1,
0.6390309, -1.161122, 1.98555, 1, 1, 1, 1, 1,
0.6426178, 1.22588, 1.529406, 1, 1, 1, 1, 1,
0.6438382, -0.07177487, 1.972329, 1, 1, 1, 1, 1,
0.6439103, -0.1660326, 2.849902, 1, 1, 1, 1, 1,
0.6470363, 1.054318, 0.2706501, 1, 1, 1, 1, 1,
0.6532531, -0.1593048, 3.113927, 1, 1, 1, 1, 1,
0.6552737, -0.6564322, 2.062439, 1, 1, 1, 1, 1,
0.6564354, -1.456024, 0.354715, 1, 1, 1, 1, 1,
0.6604608, -0.2947144, 3.172652, 1, 1, 1, 1, 1,
0.6616166, 1.00048, 2.025256, 1, 1, 1, 1, 1,
0.6625995, -1.563563, 2.899018, 1, 1, 1, 1, 1,
0.6640661, 0.2526395, -0.6785007, 0, 0, 1, 1, 1,
0.6660306, -0.9484393, 3.636611, 1, 0, 0, 1, 1,
0.6668633, 0.8887148, 2.087041, 1, 0, 0, 1, 1,
0.671627, 1.455939, 0.09625087, 1, 0, 0, 1, 1,
0.6738855, 2.692572, -0.3288435, 1, 0, 0, 1, 1,
0.6748169, -0.505944, 2.666501, 1, 0, 0, 1, 1,
0.6816234, -1.73973, 1.902991, 0, 0, 0, 1, 1,
0.6825689, 2.135206, 1.370351, 0, 0, 0, 1, 1,
0.698972, 0.7544747, 0.3704544, 0, 0, 0, 1, 1,
0.708721, -1.308343, 2.939121, 0, 0, 0, 1, 1,
0.7116125, 0.724817, 0.7805615, 0, 0, 0, 1, 1,
0.7160817, 0.2903399, -0.2376065, 0, 0, 0, 1, 1,
0.7174913, -1.498298, 1.535997, 0, 0, 0, 1, 1,
0.7221759, 1.313816, -1.476757, 1, 1, 1, 1, 1,
0.7224894, -0.1007185, 3.977536, 1, 1, 1, 1, 1,
0.7234611, -0.2416432, 2.949724, 1, 1, 1, 1, 1,
0.7250537, 0.7123915, 0.6159815, 1, 1, 1, 1, 1,
0.7266645, -0.9176086, 1.364787, 1, 1, 1, 1, 1,
0.7273085, 0.332919, -0.5797921, 1, 1, 1, 1, 1,
0.7350048, 0.2616467, 0.5218147, 1, 1, 1, 1, 1,
0.7410591, 1.008911, 0.7263942, 1, 1, 1, 1, 1,
0.742411, 0.1126049, 1.084878, 1, 1, 1, 1, 1,
0.7444114, -0.2890085, 1.444786, 1, 1, 1, 1, 1,
0.7454339, -0.4146405, 2.551072, 1, 1, 1, 1, 1,
0.7454951, -1.96134, 3.979451, 1, 1, 1, 1, 1,
0.7492188, 0.6667805, 0.3744736, 1, 1, 1, 1, 1,
0.7517791, -1.313423, 3.936819, 1, 1, 1, 1, 1,
0.7584652, -0.03503613, 2.960758, 1, 1, 1, 1, 1,
0.758789, -0.4972912, 1.70573, 0, 0, 1, 1, 1,
0.7593968, 0.5947626, 0.975286, 1, 0, 0, 1, 1,
0.7608505, -1.20994, 3.26305, 1, 0, 0, 1, 1,
0.761497, 0.4368905, 0.6642873, 1, 0, 0, 1, 1,
0.7643596, -0.2885629, 2.127933, 1, 0, 0, 1, 1,
0.7698465, 0.3702631, -0.8887076, 1, 0, 0, 1, 1,
0.7739592, -0.8201012, 1.784013, 0, 0, 0, 1, 1,
0.7788533, 0.2555295, 1.944047, 0, 0, 0, 1, 1,
0.7834886, -0.7724317, 2.766576, 0, 0, 0, 1, 1,
0.7890299, 0.8838465, 1.357525, 0, 0, 0, 1, 1,
0.7934938, 1.536726, 1.445433, 0, 0, 0, 1, 1,
0.7937788, 0.4930787, 1.190537, 0, 0, 0, 1, 1,
0.7987512, 1.035211, -0.2966369, 0, 0, 0, 1, 1,
0.8019427, -1.195272, 6.032171, 1, 1, 1, 1, 1,
0.803044, 1.456685, -0.8692582, 1, 1, 1, 1, 1,
0.8038933, 1.330901, -0.6665509, 1, 1, 1, 1, 1,
0.8049932, 0.3766627, 0.3929974, 1, 1, 1, 1, 1,
0.809115, 0.4736602, 1.102926, 1, 1, 1, 1, 1,
0.8098615, 0.1962865, 2.981327, 1, 1, 1, 1, 1,
0.817673, 0.7384523, 0.2979536, 1, 1, 1, 1, 1,
0.8238257, 0.5809138, 0.7005044, 1, 1, 1, 1, 1,
0.8273413, 0.4498468, 1.836552, 1, 1, 1, 1, 1,
0.8303554, 0.8012769, -0.4473434, 1, 1, 1, 1, 1,
0.8311078, 0.1182071, 1.989874, 1, 1, 1, 1, 1,
0.8352093, 0.4621507, 2.416794, 1, 1, 1, 1, 1,
0.8352478, -1.627602, 2.986459, 1, 1, 1, 1, 1,
0.8361399, 0.009300044, 0.2487294, 1, 1, 1, 1, 1,
0.8457661, -1.065794, 1.75702, 1, 1, 1, 1, 1,
0.8494173, 0.8707662, 1.295801, 0, 0, 1, 1, 1,
0.8509282, -0.05475046, 0.7437993, 1, 0, 0, 1, 1,
0.8521214, -0.148028, 2.931036, 1, 0, 0, 1, 1,
0.853257, 0.1742118, 1.815583, 1, 0, 0, 1, 1,
0.8539433, 0.6023128, 1.192921, 1, 0, 0, 1, 1,
0.8547135, 0.7810856, 0.3780922, 1, 0, 0, 1, 1,
0.8575257, 1.116345, 0.3628726, 0, 0, 0, 1, 1,
0.860563, -0.5475377, 2.817855, 0, 0, 0, 1, 1,
0.8622714, 1.314651, 0.5368497, 0, 0, 0, 1, 1,
0.8675932, 0.5096077, 1.462636, 0, 0, 0, 1, 1,
0.8844643, -0.3515482, 1.949723, 0, 0, 0, 1, 1,
0.8884835, 0.3413075, 1.061977, 0, 0, 0, 1, 1,
0.8943188, 0.8515479, 0.3099425, 0, 0, 0, 1, 1,
0.9019436, -0.3194608, 0.3150678, 1, 1, 1, 1, 1,
0.9075949, 0.2128152, 0.9004092, 1, 1, 1, 1, 1,
0.9099909, 2.423409, 0.1328817, 1, 1, 1, 1, 1,
0.9116539, -1.604917, 3.278437, 1, 1, 1, 1, 1,
0.9121231, 0.8236681, 0.9878277, 1, 1, 1, 1, 1,
0.9146173, 0.2769689, 0.4348471, 1, 1, 1, 1, 1,
0.9243448, 1.11621, 0.325615, 1, 1, 1, 1, 1,
0.9258272, 0.1498795, -0.1003392, 1, 1, 1, 1, 1,
0.9309121, -1.254296, 1.415527, 1, 1, 1, 1, 1,
0.932681, 0.4452085, 0.7056056, 1, 1, 1, 1, 1,
0.9345549, -0.1015374, 2.416116, 1, 1, 1, 1, 1,
0.9407231, -0.1399593, 3.869952, 1, 1, 1, 1, 1,
0.942918, 0.7968693, 1.790969, 1, 1, 1, 1, 1,
0.9538262, -0.9618618, 0.5155227, 1, 1, 1, 1, 1,
0.9550348, 1.333542, -0.3985389, 1, 1, 1, 1, 1,
0.9555162, 0.6186848, 1.443925, 0, 0, 1, 1, 1,
0.9565466, 1.491561, 1.508397, 1, 0, 0, 1, 1,
0.9581366, 0.3745597, 0.7609621, 1, 0, 0, 1, 1,
0.9630176, 2.023549, 1.420034, 1, 0, 0, 1, 1,
0.9645148, 0.7449959, 2.109922, 1, 0, 0, 1, 1,
0.9651503, -1.498583, 1.482773, 1, 0, 0, 1, 1,
0.9687807, -0.1276366, 1.02459, 0, 0, 0, 1, 1,
0.9760891, -0.4133312, 2.003271, 0, 0, 0, 1, 1,
0.9806089, 1.115638, 0.433795, 0, 0, 0, 1, 1,
0.9907519, -1.277994, 2.269221, 0, 0, 0, 1, 1,
0.99678, 1.282075, 1.355644, 0, 0, 0, 1, 1,
1.002082, 0.6888828, 1.234756, 0, 0, 0, 1, 1,
1.00987, -0.7636358, 1.324947, 0, 0, 0, 1, 1,
1.011737, 0.1891333, -0.3443277, 1, 1, 1, 1, 1,
1.012741, -2.013059, 2.937191, 1, 1, 1, 1, 1,
1.014339, -0.6760128, 1.758674, 1, 1, 1, 1, 1,
1.016275, -0.02418903, 1.059471, 1, 1, 1, 1, 1,
1.017142, 0.4597972, 0.4602551, 1, 1, 1, 1, 1,
1.018175, -1.084796, 4.220077, 1, 1, 1, 1, 1,
1.028892, 0.3393376, 1.286066, 1, 1, 1, 1, 1,
1.03448, -1.22153, 3.947099, 1, 1, 1, 1, 1,
1.04031, -1.176999, 3.967876, 1, 1, 1, 1, 1,
1.041033, -0.3067861, 1.403695, 1, 1, 1, 1, 1,
1.043574, -1.276001, 2.682907, 1, 1, 1, 1, 1,
1.050015, -0.3125731, 1.1567, 1, 1, 1, 1, 1,
1.053554, 0.4158155, 0.5270498, 1, 1, 1, 1, 1,
1.059958, -0.2165984, 0.6636949, 1, 1, 1, 1, 1,
1.060929, -0.6808434, 4.003689, 1, 1, 1, 1, 1,
1.074734, 0.5545731, 2.050319, 0, 0, 1, 1, 1,
1.075593, -1.776515, 2.895488, 1, 0, 0, 1, 1,
1.083434, 0.5560784, -0.0255863, 1, 0, 0, 1, 1,
1.096759, 1.34624, -0.8179038, 1, 0, 0, 1, 1,
1.100143, 0.4564994, 0.08229523, 1, 0, 0, 1, 1,
1.101212, -0.7540925, 2.538774, 1, 0, 0, 1, 1,
1.112195, 0.3108635, 0.3570405, 0, 0, 0, 1, 1,
1.115038, 0.9757072, 0.8759416, 0, 0, 0, 1, 1,
1.118675, 1.331617, 1.919621, 0, 0, 0, 1, 1,
1.127619, -0.01783581, 2.470087, 0, 0, 0, 1, 1,
1.12928, 0.6672657, 0.9670006, 0, 0, 0, 1, 1,
1.130891, 0.9702308, 0.4506351, 0, 0, 0, 1, 1,
1.132468, -0.1356452, 1.304342, 0, 0, 0, 1, 1,
1.13764, -0.3794011, 2.72939, 1, 1, 1, 1, 1,
1.138205, -0.2079299, 2.840512, 1, 1, 1, 1, 1,
1.139171, 1.370196, 0.8138351, 1, 1, 1, 1, 1,
1.139705, -0.1081577, 0.5352232, 1, 1, 1, 1, 1,
1.148298, -0.3791297, 2.335825, 1, 1, 1, 1, 1,
1.165039, 1.93738, 0.863803, 1, 1, 1, 1, 1,
1.165042, 0.2588667, 1.266792, 1, 1, 1, 1, 1,
1.180887, -1.62934, 2.879758, 1, 1, 1, 1, 1,
1.184631, -2.034328, 2.335829, 1, 1, 1, 1, 1,
1.184918, 0.2567698, 0.83116, 1, 1, 1, 1, 1,
1.187196, 0.2652425, 3.374295, 1, 1, 1, 1, 1,
1.19248, -0.2649513, 1.279458, 1, 1, 1, 1, 1,
1.199399, 0.1030197, 0.1907112, 1, 1, 1, 1, 1,
1.205688, -1.475281, 1.397328, 1, 1, 1, 1, 1,
1.228129, -1.132585, 2.644406, 1, 1, 1, 1, 1,
1.23158, -0.9557471, 3.893992, 0, 0, 1, 1, 1,
1.239641, 0.7869571, 0.06861306, 1, 0, 0, 1, 1,
1.240417, 0.2029517, 2.552613, 1, 0, 0, 1, 1,
1.240526, -0.6567422, 3.129582, 1, 0, 0, 1, 1,
1.243202, -0.7845063, 2.448652, 1, 0, 0, 1, 1,
1.25533, -0.2647766, 1.065811, 1, 0, 0, 1, 1,
1.25879, 0.4940789, 1.762258, 0, 0, 0, 1, 1,
1.26904, 1.67027, -0.2523194, 0, 0, 0, 1, 1,
1.270699, 1.594969, 0.8655001, 0, 0, 0, 1, 1,
1.272812, 0.5550058, 0.6046981, 0, 0, 0, 1, 1,
1.27385, -0.6941873, 2.125746, 0, 0, 0, 1, 1,
1.279986, 1.403328, 2.147918, 0, 0, 0, 1, 1,
1.280369, -0.3041479, 2.950115, 0, 0, 0, 1, 1,
1.286128, -0.8417183, 1.465528, 1, 1, 1, 1, 1,
1.289837, 0.6357314, 0.2093291, 1, 1, 1, 1, 1,
1.309952, -0.1190899, 3.075892, 1, 1, 1, 1, 1,
1.314826, 2.045014, 1.374017, 1, 1, 1, 1, 1,
1.319578, 2.215909, 0.1896329, 1, 1, 1, 1, 1,
1.329672, 0.2365207, 2.284042, 1, 1, 1, 1, 1,
1.331442, -1.442659, 2.29851, 1, 1, 1, 1, 1,
1.350915, -0.0954354, 0.8528097, 1, 1, 1, 1, 1,
1.353698, -1.448511, 2.840718, 1, 1, 1, 1, 1,
1.367141, -1.196432, 2.258101, 1, 1, 1, 1, 1,
1.372789, 0.1364243, 0.4293497, 1, 1, 1, 1, 1,
1.377554, -0.7219732, 1.827151, 1, 1, 1, 1, 1,
1.381671, -2.257715, 4.048715, 1, 1, 1, 1, 1,
1.387974, 0.5121881, 1.981717, 1, 1, 1, 1, 1,
1.397245, -0.4361345, 2.033217, 1, 1, 1, 1, 1,
1.401934, 0.9629742, -0.7098034, 0, 0, 1, 1, 1,
1.403049, -0.8496484, 1.875084, 1, 0, 0, 1, 1,
1.412438, 1.490637, 0.5855604, 1, 0, 0, 1, 1,
1.41846, -0.4557983, 3.52552, 1, 0, 0, 1, 1,
1.421061, 0.9491857, 1.635316, 1, 0, 0, 1, 1,
1.423401, -0.4029629, 0.7166543, 1, 0, 0, 1, 1,
1.425971, 1.488953, 2.739419, 0, 0, 0, 1, 1,
1.43403, -0.1579424, 2.919575, 0, 0, 0, 1, 1,
1.436863, -0.6976097, 1.946827, 0, 0, 0, 1, 1,
1.440159, 0.09441023, 2.082467, 0, 0, 0, 1, 1,
1.440199, -1.544441, 3.828566, 0, 0, 0, 1, 1,
1.441653, -0.8792579, 1.981384, 0, 0, 0, 1, 1,
1.44733, -0.5882984, 1.561672, 0, 0, 0, 1, 1,
1.451023, 0.5212035, 2.381629, 1, 1, 1, 1, 1,
1.455666, 0.8484399, 1.481209, 1, 1, 1, 1, 1,
1.466233, -1.011392, 1.724388, 1, 1, 1, 1, 1,
1.472273, -0.2025806, 3.612544, 1, 1, 1, 1, 1,
1.474998, -1.218278, 1.305386, 1, 1, 1, 1, 1,
1.475087, -0.3743657, 2.532527, 1, 1, 1, 1, 1,
1.477843, 1.332414, 1.473361, 1, 1, 1, 1, 1,
1.484294, 2.17798, 0.1911658, 1, 1, 1, 1, 1,
1.488676, 1.297109, 1.203463, 1, 1, 1, 1, 1,
1.491231, 0.3963743, 0.7735335, 1, 1, 1, 1, 1,
1.491375, 0.4985652, 1.498029, 1, 1, 1, 1, 1,
1.495073, 1.268812, 0.6575056, 1, 1, 1, 1, 1,
1.496605, 2.617263, 0.8860939, 1, 1, 1, 1, 1,
1.49725, -0.9850214, 1.358683, 1, 1, 1, 1, 1,
1.502282, 0.3980402, 1.129009, 1, 1, 1, 1, 1,
1.508992, 0.009752819, 2.18129, 0, 0, 1, 1, 1,
1.529686, 1.095955, -0.2548747, 1, 0, 0, 1, 1,
1.530476, -0.07203919, 2.067327, 1, 0, 0, 1, 1,
1.535747, 1.180042, -1.160133, 1, 0, 0, 1, 1,
1.542156, -0.4241717, 1.834441, 1, 0, 0, 1, 1,
1.563932, 0.7939643, 0.1837386, 1, 0, 0, 1, 1,
1.565403, -0.8835444, 2.420331, 0, 0, 0, 1, 1,
1.569942, -1.187338, 3.776158, 0, 0, 0, 1, 1,
1.572593, -0.2600287, 1.855415, 0, 0, 0, 1, 1,
1.574004, -0.5600469, 1.862073, 0, 0, 0, 1, 1,
1.579785, 1.4413, 0.491267, 0, 0, 0, 1, 1,
1.61406, -0.2806285, 2.695377, 0, 0, 0, 1, 1,
1.622444, 0.01689669, 0.9755928, 0, 0, 0, 1, 1,
1.625641, -0.1636545, 1.54761, 1, 1, 1, 1, 1,
1.632396, 0.5618717, -1.301704, 1, 1, 1, 1, 1,
1.632529, -0.7216345, 2.928828, 1, 1, 1, 1, 1,
1.641147, -1.457508, 1.644076, 1, 1, 1, 1, 1,
1.647522, 1.490917, 1.68626, 1, 1, 1, 1, 1,
1.649644, 0.7820978, 2.352715, 1, 1, 1, 1, 1,
1.658231, -0.8722221, 0.8682231, 1, 1, 1, 1, 1,
1.661588, 0.5485752, 2.397756, 1, 1, 1, 1, 1,
1.669035, -0.8146853, 1.40108, 1, 1, 1, 1, 1,
1.669824, -1.913985, 2.186048, 1, 1, 1, 1, 1,
1.673829, 0.2714907, 1.504638, 1, 1, 1, 1, 1,
1.693265, 0.677582, 0.4582031, 1, 1, 1, 1, 1,
1.698492, -1.634333, 0.9684194, 1, 1, 1, 1, 1,
1.704417, 0.001926086, 2.106723, 1, 1, 1, 1, 1,
1.714315, 0.06482634, 0.1539913, 1, 1, 1, 1, 1,
1.723165, 0.7439008, -0.07697968, 0, 0, 1, 1, 1,
1.741487, -0.5518659, 3.080094, 1, 0, 0, 1, 1,
1.744289, 1.795538, 1.4747, 1, 0, 0, 1, 1,
1.744965, -0.4622589, 0.5913128, 1, 0, 0, 1, 1,
1.765903, -0.2686709, 0.6928441, 1, 0, 0, 1, 1,
1.777573, 1.449278, -0.2382266, 1, 0, 0, 1, 1,
1.779472, 1.375624, 1.33569, 0, 0, 0, 1, 1,
1.79628, 0.3096883, 2.04071, 0, 0, 0, 1, 1,
1.796918, 0.1518164, 1.522132, 0, 0, 0, 1, 1,
1.823373, -2.63602, 2.153825, 0, 0, 0, 1, 1,
1.83528, 0.3603763, 0.6787004, 0, 0, 0, 1, 1,
1.841415, -0.09931389, 1.370388, 0, 0, 0, 1, 1,
1.843843, -0.02524956, 2.842894, 0, 0, 0, 1, 1,
1.848854, 1.242035, 0.4000688, 1, 1, 1, 1, 1,
1.879157, -0.2960329, 2.014873, 1, 1, 1, 1, 1,
1.885738, -0.4321318, 2.387372, 1, 1, 1, 1, 1,
1.898876, 0.4645403, 2.453221, 1, 1, 1, 1, 1,
1.911337, -0.2402828, 2.095111, 1, 1, 1, 1, 1,
1.927813, -0.5584925, 2.233744, 1, 1, 1, 1, 1,
1.963893, 1.678019, 1.659857, 1, 1, 1, 1, 1,
1.965713, -0.1703026, 1.093704, 1, 1, 1, 1, 1,
2.03272, -0.6064177, 2.991591, 1, 1, 1, 1, 1,
2.057518, 1.457256, 1.152856, 1, 1, 1, 1, 1,
2.084477, 0.117042, 0.5941429, 1, 1, 1, 1, 1,
2.115786, -1.375464, 1.717157, 1, 1, 1, 1, 1,
2.123832, -0.7330783, -0.1244033, 1, 1, 1, 1, 1,
2.124994, 1.486725, 0.7470641, 1, 1, 1, 1, 1,
2.130367, 0.1035135, 1.091921, 1, 1, 1, 1, 1,
2.144371, -2.241664, 3.605976, 0, 0, 1, 1, 1,
2.149938, 0.008665042, 1.801352, 1, 0, 0, 1, 1,
2.162581, 0.4804016, 1.039645, 1, 0, 0, 1, 1,
2.197608, 1.264152, 0.7677888, 1, 0, 0, 1, 1,
2.216006, -1.065939, -0.09602872, 1, 0, 0, 1, 1,
2.241591, -0.02748805, 0.59824, 1, 0, 0, 1, 1,
2.300952, -1.987862, 3.125223, 0, 0, 0, 1, 1,
2.34067, -0.5622895, 3.465548, 0, 0, 0, 1, 1,
2.348397, -0.08294383, 3.033068, 0, 0, 0, 1, 1,
2.349652, 0.9770792, -0.2892361, 0, 0, 0, 1, 1,
2.374974, 0.9179989, 0.07090657, 0, 0, 0, 1, 1,
2.403517, 0.240514, 1.557833, 0, 0, 0, 1, 1,
2.458769, 1.183524, 2.364824, 0, 0, 0, 1, 1,
2.504094, 0.7026922, 3.003948, 1, 1, 1, 1, 1,
2.519808, 1.39267, 1.122977, 1, 1, 1, 1, 1,
2.532949, 1.382371, 0.7897791, 1, 1, 1, 1, 1,
2.576832, -0.9542205, 2.267822, 1, 1, 1, 1, 1,
2.591546, 0.651141, 0.8348188, 1, 1, 1, 1, 1,
2.681547, 0.395026, -0.2593331, 1, 1, 1, 1, 1,
3.462929, -0.9986848, 0.8435219, 1, 1, 1, 1, 1
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
var radius = 9.92727;
var distance = 34.86911;
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
mvMatrix.translate( -0.2563462, 0.3595704, -0.3227768 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.86911);
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
