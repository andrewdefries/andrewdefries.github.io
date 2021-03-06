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
-3.202115, -0.1337945, -1.391039, 1, 0, 0, 1,
-2.790603, -0.7189471, -1.060621, 1, 0.007843138, 0, 1,
-2.682451, -0.3182791, -3.009117, 1, 0.01176471, 0, 1,
-2.494289, 1.881848, -0.6747929, 1, 0.01960784, 0, 1,
-2.418834, -0.06657469, -2.087776, 1, 0.02352941, 0, 1,
-2.365179, 1.57719, -1.854354, 1, 0.03137255, 0, 1,
-2.340778, 0.4803655, -1.824407, 1, 0.03529412, 0, 1,
-2.303626, -0.3208936, -1.005769, 1, 0.04313726, 0, 1,
-2.297199, 0.7378088, 0.2741996, 1, 0.04705882, 0, 1,
-2.287616, 0.1710092, -2.615434, 1, 0.05490196, 0, 1,
-2.267973, -0.08814261, -2.757653, 1, 0.05882353, 0, 1,
-2.267658, -0.425576, -0.7802711, 1, 0.06666667, 0, 1,
-2.256438, -1.255637, -0.7409027, 1, 0.07058824, 0, 1,
-2.21613, -0.4495957, -0.7030103, 1, 0.07843138, 0, 1,
-2.159345, 0.2101988, -0.6596577, 1, 0.08235294, 0, 1,
-2.151736, 0.1562742, -1.427141, 1, 0.09019608, 0, 1,
-2.149901, 0.7273484, 0.6361274, 1, 0.09411765, 0, 1,
-2.142006, 0.4288828, -0.6664767, 1, 0.1019608, 0, 1,
-2.121087, -1.037342, -1.101587, 1, 0.1098039, 0, 1,
-2.060358, 0.0334774, -0.9601329, 1, 0.1137255, 0, 1,
-2.023007, -0.5484168, -1.656796, 1, 0.1215686, 0, 1,
-2.012976, 0.6131167, -1.239253, 1, 0.1254902, 0, 1,
-1.91626, -0.122771, -2.673538, 1, 0.1333333, 0, 1,
-1.903631, 0.2918731, -0.6110213, 1, 0.1372549, 0, 1,
-1.885643, 0.9931672, -1.192642, 1, 0.145098, 0, 1,
-1.875547, 0.5759923, -0.3137985, 1, 0.1490196, 0, 1,
-1.868558, 0.6285586, -1.096909, 1, 0.1568628, 0, 1,
-1.865829, -0.05377895, -1.243716, 1, 0.1607843, 0, 1,
-1.862031, 0.4017057, -0.9876438, 1, 0.1686275, 0, 1,
-1.861557, -1.277137, -3.168809, 1, 0.172549, 0, 1,
-1.859954, 1.078365, -1.076416, 1, 0.1803922, 0, 1,
-1.846453, 0.2812742, -2.941025, 1, 0.1843137, 0, 1,
-1.844293, 0.4742727, -1.469398, 1, 0.1921569, 0, 1,
-1.84352, 0.659586, -1.736541, 1, 0.1960784, 0, 1,
-1.823435, -0.1391457, -0.5702916, 1, 0.2039216, 0, 1,
-1.804751, 0.450978, -2.543162, 1, 0.2117647, 0, 1,
-1.801655, -0.1201776, -2.414269, 1, 0.2156863, 0, 1,
-1.800007, 0.2012212, -1.621101, 1, 0.2235294, 0, 1,
-1.769964, -0.1482481, -1.230611, 1, 0.227451, 0, 1,
-1.766213, -1.164258, -2.076747, 1, 0.2352941, 0, 1,
-1.758608, 0.9800895, -0.8306681, 1, 0.2392157, 0, 1,
-1.733378, -1.140612, -1.824913, 1, 0.2470588, 0, 1,
-1.726925, -0.4778324, -0.4980745, 1, 0.2509804, 0, 1,
-1.720681, 0.001972697, -1.134146, 1, 0.2588235, 0, 1,
-1.718654, 0.6262001, -1.423328, 1, 0.2627451, 0, 1,
-1.714884, -1.325103, -3.732052, 1, 0.2705882, 0, 1,
-1.705075, 1.30375, -0.008909227, 1, 0.2745098, 0, 1,
-1.688702, 0.4332348, -1.229206, 1, 0.282353, 0, 1,
-1.658444, 1.094137, -2.285381, 1, 0.2862745, 0, 1,
-1.602276, 1.524436, -1.109361, 1, 0.2941177, 0, 1,
-1.599812, 1.159218, 0.03779842, 1, 0.3019608, 0, 1,
-1.596756, -1.076547, -3.165346, 1, 0.3058824, 0, 1,
-1.582927, -1.075346, -1.837278, 1, 0.3137255, 0, 1,
-1.579455, 0.3888468, -3.143597, 1, 0.3176471, 0, 1,
-1.57823, 2.175735, -0.1202809, 1, 0.3254902, 0, 1,
-1.570677, -0.3504941, -2.301502, 1, 0.3294118, 0, 1,
-1.555137, -1.31463, -0.9313458, 1, 0.3372549, 0, 1,
-1.535604, 1.427065, -1.570278, 1, 0.3411765, 0, 1,
-1.532607, 1.088834, -1.058854, 1, 0.3490196, 0, 1,
-1.530005, -0.9580315, -1.363099, 1, 0.3529412, 0, 1,
-1.516146, 0.2940011, -1.872356, 1, 0.3607843, 0, 1,
-1.50113, -0.09552714, -1.604495, 1, 0.3647059, 0, 1,
-1.490919, 0.08154415, 0.1120176, 1, 0.372549, 0, 1,
-1.478179, 1.112877, -2.193238, 1, 0.3764706, 0, 1,
-1.47455, -0.05526196, -3.557992, 1, 0.3843137, 0, 1,
-1.456761, 0.3029162, -0.6757027, 1, 0.3882353, 0, 1,
-1.439578, -2.899153, -2.389164, 1, 0.3960784, 0, 1,
-1.438557, 1.059253, 0.3232643, 1, 0.4039216, 0, 1,
-1.43688, -1.443045, -2.229919, 1, 0.4078431, 0, 1,
-1.436662, 1.293598, -0.346862, 1, 0.4156863, 0, 1,
-1.435693, 0.688709, -1.952176, 1, 0.4196078, 0, 1,
-1.417688, -0.02410459, -1.228858, 1, 0.427451, 0, 1,
-1.415128, -0.2468461, -1.348899, 1, 0.4313726, 0, 1,
-1.402834, -0.07981463, -2.345264, 1, 0.4392157, 0, 1,
-1.40123, -0.1030914, -0.5862383, 1, 0.4431373, 0, 1,
-1.394591, 1.817863, -0.1032565, 1, 0.4509804, 0, 1,
-1.389038, -1.085974, -2.249041, 1, 0.454902, 0, 1,
-1.388851, -0.05573998, -2.879738, 1, 0.4627451, 0, 1,
-1.381429, 0.9737613, -1.263342, 1, 0.4666667, 0, 1,
-1.378061, -0.2790253, -0.3689559, 1, 0.4745098, 0, 1,
-1.375396, 1.006925, -1.939395, 1, 0.4784314, 0, 1,
-1.370621, 0.1360288, -2.014294, 1, 0.4862745, 0, 1,
-1.370292, 0.05788013, -3.613052, 1, 0.4901961, 0, 1,
-1.366733, 0.6636301, -1.864597, 1, 0.4980392, 0, 1,
-1.365502, -0.4764815, -0.8027678, 1, 0.5058824, 0, 1,
-1.36434, -1.429619, -3.359475, 1, 0.509804, 0, 1,
-1.363775, -0.3976337, -1.754125, 1, 0.5176471, 0, 1,
-1.361812, -1.466906, -0.6916304, 1, 0.5215687, 0, 1,
-1.357977, 0.5865268, -1.46893, 1, 0.5294118, 0, 1,
-1.357926, -0.1182995, -1.199508, 1, 0.5333334, 0, 1,
-1.357503, -0.1446767, -1.861921, 1, 0.5411765, 0, 1,
-1.340867, 0.2311977, -1.79192, 1, 0.5450981, 0, 1,
-1.334306, -0.5309754, -3.259628, 1, 0.5529412, 0, 1,
-1.329184, 0.1096245, -0.5116741, 1, 0.5568628, 0, 1,
-1.312929, -0.9840955, -1.689141, 1, 0.5647059, 0, 1,
-1.307222, 0.4667537, 0.2523575, 1, 0.5686275, 0, 1,
-1.30188, 0.3974983, -0.7123013, 1, 0.5764706, 0, 1,
-1.299368, -1.106899, -2.281957, 1, 0.5803922, 0, 1,
-1.295624, 0.2346238, -3.420755, 1, 0.5882353, 0, 1,
-1.29235, 1.331544, -0.1358711, 1, 0.5921569, 0, 1,
-1.288427, -0.9180133, -1.35318, 1, 0.6, 0, 1,
-1.283608, 0.6048175, -1.39385, 1, 0.6078432, 0, 1,
-1.282009, -0.480482, -3.803604, 1, 0.6117647, 0, 1,
-1.272563, -1.477242, -2.930407, 1, 0.6196079, 0, 1,
-1.261951, -0.0720112, -0.7184359, 1, 0.6235294, 0, 1,
-1.261378, -0.5062866, -2.019182, 1, 0.6313726, 0, 1,
-1.258679, 0.118795, -1.416567, 1, 0.6352941, 0, 1,
-1.235316, -0.9234467, -1.68522, 1, 0.6431373, 0, 1,
-1.233174, -0.1000404, -0.8299304, 1, 0.6470588, 0, 1,
-1.226917, -0.124982, -2.900187, 1, 0.654902, 0, 1,
-1.226064, 1.008605, -1.067847, 1, 0.6588235, 0, 1,
-1.207976, 0.005479851, -0.1392573, 1, 0.6666667, 0, 1,
-1.207711, 1.805467, -1.011717, 1, 0.6705883, 0, 1,
-1.204115, 0.05277142, -1.230173, 1, 0.6784314, 0, 1,
-1.190055, -0.4842314, -2.39, 1, 0.682353, 0, 1,
-1.181914, -0.0682491, -0.523064, 1, 0.6901961, 0, 1,
-1.17737, 0.2827386, 0.8172687, 1, 0.6941177, 0, 1,
-1.176016, -0.2351355, -0.5654802, 1, 0.7019608, 0, 1,
-1.173165, 1.233469, -1.720357, 1, 0.7098039, 0, 1,
-1.166266, -1.294833, -2.550863, 1, 0.7137255, 0, 1,
-1.165333, 0.5359828, -3.376258, 1, 0.7215686, 0, 1,
-1.153049, 0.4903469, 0.553463, 1, 0.7254902, 0, 1,
-1.151456, -0.5821812, -4.232807, 1, 0.7333333, 0, 1,
-1.150503, -0.9126069, -3.408897, 1, 0.7372549, 0, 1,
-1.150061, 1.486163, -1.187452, 1, 0.7450981, 0, 1,
-1.147894, -1.018646, -2.464222, 1, 0.7490196, 0, 1,
-1.145568, -0.1018378, -3.055738, 1, 0.7568628, 0, 1,
-1.141448, -0.4166676, -1.840037, 1, 0.7607843, 0, 1,
-1.132929, 0.1767834, -0.1149587, 1, 0.7686275, 0, 1,
-1.132656, 0.3594017, -2.252744, 1, 0.772549, 0, 1,
-1.129519, -2.84713, -2.678556, 1, 0.7803922, 0, 1,
-1.127991, 0.2724151, -0.5969751, 1, 0.7843137, 0, 1,
-1.125093, -1.280527, -2.150669, 1, 0.7921569, 0, 1,
-1.118983, 0.3462467, -0.4095145, 1, 0.7960784, 0, 1,
-1.118066, 0.3237529, -2.764951, 1, 0.8039216, 0, 1,
-1.116991, 1.020508, -2.515304, 1, 0.8117647, 0, 1,
-1.112529, -2.273714, -4.258811, 1, 0.8156863, 0, 1,
-1.107607, 0.1725778, -0.296414, 1, 0.8235294, 0, 1,
-1.096411, 0.4797048, -0.3751049, 1, 0.827451, 0, 1,
-1.084936, 0.0471296, -2.891266, 1, 0.8352941, 0, 1,
-1.082995, -0.6228305, -0.4334627, 1, 0.8392157, 0, 1,
-1.080589, 1.199397, -0.7709158, 1, 0.8470588, 0, 1,
-1.060443, -0.2318298, -1.014732, 1, 0.8509804, 0, 1,
-1.059228, 1.675554, -1.59503, 1, 0.8588235, 0, 1,
-1.045624, 0.4866545, -1.449036, 1, 0.8627451, 0, 1,
-1.044682, -1.938828, -3.870042, 1, 0.8705882, 0, 1,
-1.041252, -1.719369, -3.643176, 1, 0.8745098, 0, 1,
-1.032166, 0.2080183, 0.4756344, 1, 0.8823529, 0, 1,
-1.028655, -0.159969, -0.894489, 1, 0.8862745, 0, 1,
-1.0272, 0.02750541, -0.7956716, 1, 0.8941177, 0, 1,
-1.022593, 1.840492, -0.5149471, 1, 0.8980392, 0, 1,
-1.020244, 0.9909933, 0.4285109, 1, 0.9058824, 0, 1,
-1.018068, 0.1656413, -0.4772428, 1, 0.9137255, 0, 1,
-1.013562, 0.06944855, -2.354525, 1, 0.9176471, 0, 1,
-1.013283, 1.020765, -1.129969, 1, 0.9254902, 0, 1,
-1.011286, 0.216185, -0.2346356, 1, 0.9294118, 0, 1,
-1.007151, -0.4591845, -2.325452, 1, 0.9372549, 0, 1,
-1.006973, 0.1179773, -1.049652, 1, 0.9411765, 0, 1,
-1.006649, -0.6618403, -1.694733, 1, 0.9490196, 0, 1,
-1.004826, -0.6486369, -3.614725, 1, 0.9529412, 0, 1,
-1.000389, -0.7051238, -2.945371, 1, 0.9607843, 0, 1,
-0.9980366, -1.493158, -3.009648, 1, 0.9647059, 0, 1,
-0.9942196, 0.2207322, 0.5899956, 1, 0.972549, 0, 1,
-0.9941399, 0.7436755, -1.189373, 1, 0.9764706, 0, 1,
-0.990981, 0.6219867, -2.148767, 1, 0.9843137, 0, 1,
-0.9879452, -0.4816775, -2.758004, 1, 0.9882353, 0, 1,
-0.9863072, -1.136596, -2.97879, 1, 0.9960784, 0, 1,
-0.9784073, -0.1427919, -1.897254, 0.9960784, 1, 0, 1,
-0.9620224, -0.4754399, -1.830614, 0.9921569, 1, 0, 1,
-0.9604558, -0.1178416, -3.743756, 0.9843137, 1, 0, 1,
-0.9577395, -0.3851868, -2.393831, 0.9803922, 1, 0, 1,
-0.9562911, 0.1099279, -0.9379267, 0.972549, 1, 0, 1,
-0.9499782, -0.2835684, -1.602619, 0.9686275, 1, 0, 1,
-0.9394664, 0.8769827, -0.0469116, 0.9607843, 1, 0, 1,
-0.9327451, 0.6575859, -0.8429501, 0.9568627, 1, 0, 1,
-0.9294934, -0.2014771, -2.538941, 0.9490196, 1, 0, 1,
-0.9262496, -1.338636, -2.819427, 0.945098, 1, 0, 1,
-0.9253516, 0.2109889, 0.0984028, 0.9372549, 1, 0, 1,
-0.9229904, -1.575962, -3.480508, 0.9333333, 1, 0, 1,
-0.9187046, -1.345177, -1.560387, 0.9254902, 1, 0, 1,
-0.9186612, 1.054406, 0.09789402, 0.9215686, 1, 0, 1,
-0.9155458, 1.837372, 0.555059, 0.9137255, 1, 0, 1,
-0.9097711, -0.8291196, -2.737307, 0.9098039, 1, 0, 1,
-0.9094654, 0.4993065, -0.192515, 0.9019608, 1, 0, 1,
-0.9040039, -0.4799862, -1.285947, 0.8941177, 1, 0, 1,
-0.9031776, -0.6377563, -1.990053, 0.8901961, 1, 0, 1,
-0.9005005, -1.400762, -2.930057, 0.8823529, 1, 0, 1,
-0.8972011, -0.8895586, -1.037862, 0.8784314, 1, 0, 1,
-0.8961631, -1.378399, -3.533348, 0.8705882, 1, 0, 1,
-0.8958681, -0.1789783, -2.779146, 0.8666667, 1, 0, 1,
-0.8909687, 0.5902729, -2.12571, 0.8588235, 1, 0, 1,
-0.8903821, 0.1330747, -0.7718981, 0.854902, 1, 0, 1,
-0.8801982, 0.4716369, -0.1411878, 0.8470588, 1, 0, 1,
-0.8786275, -0.6349794, -1.820157, 0.8431373, 1, 0, 1,
-0.8771156, 0.8646702, -1.173494, 0.8352941, 1, 0, 1,
-0.8695561, -0.4328824, -1.768004, 0.8313726, 1, 0, 1,
-0.8644012, -0.2949147, -0.5480576, 0.8235294, 1, 0, 1,
-0.8625604, -0.2020791, -0.7275881, 0.8196079, 1, 0, 1,
-0.8617608, 0.4253384, -1.08254, 0.8117647, 1, 0, 1,
-0.8612778, -0.143411, -2.522105, 0.8078431, 1, 0, 1,
-0.8405197, -1.207699, -0.109987, 0.8, 1, 0, 1,
-0.8401259, -0.9625348, -3.517571, 0.7921569, 1, 0, 1,
-0.8363605, -0.02820492, -1.850055, 0.7882353, 1, 0, 1,
-0.8332245, -0.3211303, -0.3838938, 0.7803922, 1, 0, 1,
-0.8321682, -0.4104797, -2.629549, 0.7764706, 1, 0, 1,
-0.8264008, 0.5633057, -0.715273, 0.7686275, 1, 0, 1,
-0.8230111, 0.1294472, -0.498714, 0.7647059, 1, 0, 1,
-0.8210129, -0.6070116, -1.025102, 0.7568628, 1, 0, 1,
-0.8200648, 1.33205, -1.394894, 0.7529412, 1, 0, 1,
-0.8196999, -1.085589, -2.187728, 0.7450981, 1, 0, 1,
-0.8133885, 1.033802, -0.3873571, 0.7411765, 1, 0, 1,
-0.811466, -1.117034, -3.676334, 0.7333333, 1, 0, 1,
-0.810762, 0.1835857, -2.984086, 0.7294118, 1, 0, 1,
-0.8091893, -1.205249, -1.050515, 0.7215686, 1, 0, 1,
-0.806767, 1.475589, -1.203892, 0.7176471, 1, 0, 1,
-0.8027993, -1.108444, -2.964086, 0.7098039, 1, 0, 1,
-0.7989137, -1.411093, -2.346304, 0.7058824, 1, 0, 1,
-0.7954267, 0.4008661, -1.901602, 0.6980392, 1, 0, 1,
-0.7942217, 1.031155, 0.2431381, 0.6901961, 1, 0, 1,
-0.7901599, 1.418042, -0.1894474, 0.6862745, 1, 0, 1,
-0.7891512, 2.000534, -0.7929174, 0.6784314, 1, 0, 1,
-0.7883134, -0.9178926, -0.8634382, 0.6745098, 1, 0, 1,
-0.7862584, 0.2383488, -1.971629, 0.6666667, 1, 0, 1,
-0.784729, -0.1822588, -2.436231, 0.6627451, 1, 0, 1,
-0.7846213, 0.7193915, -2.7129, 0.654902, 1, 0, 1,
-0.7814004, -0.3715508, -0.934144, 0.6509804, 1, 0, 1,
-0.7786874, 0.6188514, -0.2643599, 0.6431373, 1, 0, 1,
-0.774553, -0.04939039, -1.346646, 0.6392157, 1, 0, 1,
-0.7701309, 1.151245, -1.02717, 0.6313726, 1, 0, 1,
-0.76767, 0.7770157, 0.02390716, 0.627451, 1, 0, 1,
-0.7659757, 0.2651416, -1.387035, 0.6196079, 1, 0, 1,
-0.764906, 0.3557105, 0.01549356, 0.6156863, 1, 0, 1,
-0.7641882, 0.03945997, -2.73285, 0.6078432, 1, 0, 1,
-0.7634233, 0.07879967, -2.810341, 0.6039216, 1, 0, 1,
-0.7627496, -0.994136, -3.274084, 0.5960785, 1, 0, 1,
-0.7619557, 0.8785195, 1.302947, 0.5882353, 1, 0, 1,
-0.7606843, -0.3681948, -1.432394, 0.5843138, 1, 0, 1,
-0.7465287, 1.190136, -0.1978063, 0.5764706, 1, 0, 1,
-0.7459754, -2.480402, -3.13283, 0.572549, 1, 0, 1,
-0.7410498, 0.7896646, -1.066736, 0.5647059, 1, 0, 1,
-0.7396464, -0.8229035, -3.723205, 0.5607843, 1, 0, 1,
-0.7387875, 0.1380726, -1.24662, 0.5529412, 1, 0, 1,
-0.7337658, -0.7979744, -0.2890501, 0.5490196, 1, 0, 1,
-0.7330426, 1.278167, -1.134701, 0.5411765, 1, 0, 1,
-0.7266722, 0.2329662, -0.4829823, 0.5372549, 1, 0, 1,
-0.7209668, 1.712196, -1.023526, 0.5294118, 1, 0, 1,
-0.7196097, 1.051765, -1.397898, 0.5254902, 1, 0, 1,
-0.7184279, -0.4344482, -1.41977, 0.5176471, 1, 0, 1,
-0.715569, 0.9627671, -1.21247, 0.5137255, 1, 0, 1,
-0.7153577, -1.222845, -3.748555, 0.5058824, 1, 0, 1,
-0.7096603, -0.1534643, -2.366759, 0.5019608, 1, 0, 1,
-0.6868799, 0.4205168, 0.1336569, 0.4941176, 1, 0, 1,
-0.6841332, 0.1069222, -0.7496541, 0.4862745, 1, 0, 1,
-0.6832259, -1.126928, -2.272439, 0.4823529, 1, 0, 1,
-0.6740038, -0.06173065, -2.405948, 0.4745098, 1, 0, 1,
-0.6734153, 1.789953, -0.3177462, 0.4705882, 1, 0, 1,
-0.6716804, -0.605092, -2.498091, 0.4627451, 1, 0, 1,
-0.6644179, 0.06601281, -0.7840503, 0.4588235, 1, 0, 1,
-0.6603593, -1.258821, -1.14888, 0.4509804, 1, 0, 1,
-0.6568195, -0.6014141, -3.614221, 0.4470588, 1, 0, 1,
-0.6568012, -1.761127, -4.141294, 0.4392157, 1, 0, 1,
-0.6545544, -0.6305493, -3.006143, 0.4352941, 1, 0, 1,
-0.6461834, 1.445219, -2.878986, 0.427451, 1, 0, 1,
-0.6406348, -0.0822389, -1.076135, 0.4235294, 1, 0, 1,
-0.6404895, 1.372104, -1.392458, 0.4156863, 1, 0, 1,
-0.6403912, -1.265078, -1.449483, 0.4117647, 1, 0, 1,
-0.6401061, -0.5765669, -2.180923, 0.4039216, 1, 0, 1,
-0.6398202, 3.260806, -0.1004277, 0.3960784, 1, 0, 1,
-0.6370968, -1.441512, -3.155066, 0.3921569, 1, 0, 1,
-0.6318305, -0.06684115, -3.260865, 0.3843137, 1, 0, 1,
-0.6307769, -1.24516, -1.474319, 0.3803922, 1, 0, 1,
-0.6169767, -1.544718, -3.266195, 0.372549, 1, 0, 1,
-0.6142565, -0.2166002, -1.011676, 0.3686275, 1, 0, 1,
-0.6108347, -1.883143, -0.7220066, 0.3607843, 1, 0, 1,
-0.6066544, 1.229699, -0.7986423, 0.3568628, 1, 0, 1,
-0.603803, 0.6562529, -3.387172, 0.3490196, 1, 0, 1,
-0.6032777, -0.3965056, -1.871745, 0.345098, 1, 0, 1,
-0.6025304, -1.705343, -2.387529, 0.3372549, 1, 0, 1,
-0.600537, -2.033237, -2.228687, 0.3333333, 1, 0, 1,
-0.5981352, 1.011131, -1.299025, 0.3254902, 1, 0, 1,
-0.5980662, 0.4984179, -0.6442099, 0.3215686, 1, 0, 1,
-0.5889143, -1.61307, -3.823884, 0.3137255, 1, 0, 1,
-0.5872292, -0.6629824, -2.439069, 0.3098039, 1, 0, 1,
-0.5830704, -0.1568902, -1.549903, 0.3019608, 1, 0, 1,
-0.5830054, -0.1475529, -2.981867, 0.2941177, 1, 0, 1,
-0.581108, 1.014098, -2.465027, 0.2901961, 1, 0, 1,
-0.5779474, 0.4096556, 0.4274953, 0.282353, 1, 0, 1,
-0.5751128, -1.022047, -1.977213, 0.2784314, 1, 0, 1,
-0.5702146, 1.159553, -1.617815, 0.2705882, 1, 0, 1,
-0.5671574, -0.1925075, -1.507969, 0.2666667, 1, 0, 1,
-0.5642703, 1.66292, 0.9866714, 0.2588235, 1, 0, 1,
-0.5631591, 1.15264, -1.575525, 0.254902, 1, 0, 1,
-0.5626377, -0.1346284, -1.02264, 0.2470588, 1, 0, 1,
-0.5593259, 1.171112, -1.420619, 0.2431373, 1, 0, 1,
-0.558517, 0.8660367, -0.4858791, 0.2352941, 1, 0, 1,
-0.5556689, 0.2984207, -0.5949314, 0.2313726, 1, 0, 1,
-0.5484444, 0.3548576, -0.8354784, 0.2235294, 1, 0, 1,
-0.5455027, 0.8167188, -0.4155041, 0.2196078, 1, 0, 1,
-0.5449341, 0.7918474, -0.6667182, 0.2117647, 1, 0, 1,
-0.5399055, 1.665259, 0.382257, 0.2078431, 1, 0, 1,
-0.5397367, -1.399989, -2.788177, 0.2, 1, 0, 1,
-0.5394433, 1.036462, -2.222091, 0.1921569, 1, 0, 1,
-0.5326898, -0.1806531, -4.104057, 0.1882353, 1, 0, 1,
-0.5299606, -0.1770564, -3.16199, 0.1803922, 1, 0, 1,
-0.5243165, 0.2479555, -3.256785, 0.1764706, 1, 0, 1,
-0.5219122, 0.9413621, -0.2104244, 0.1686275, 1, 0, 1,
-0.5183981, 0.2755682, -3.318577, 0.1647059, 1, 0, 1,
-0.5081677, 0.3251668, -0.4440736, 0.1568628, 1, 0, 1,
-0.5059723, -1.12285, -2.156265, 0.1529412, 1, 0, 1,
-0.503744, 1.019133, -0.4644284, 0.145098, 1, 0, 1,
-0.5022795, -1.112114, -1.3329, 0.1411765, 1, 0, 1,
-0.5013242, -0.1696003, -1.119852, 0.1333333, 1, 0, 1,
-0.4984671, 0.7734021, 1.267924, 0.1294118, 1, 0, 1,
-0.4982741, 0.5730271, -0.01445194, 0.1215686, 1, 0, 1,
-0.4960178, 0.9450776, -2.293828, 0.1176471, 1, 0, 1,
-0.4950058, -1.61664, -3.238417, 0.1098039, 1, 0, 1,
-0.4909042, -0.02920957, 0.8704613, 0.1058824, 1, 0, 1,
-0.490581, 1.00316, 0.4599867, 0.09803922, 1, 0, 1,
-0.490328, -0.5323677, -2.159941, 0.09019608, 1, 0, 1,
-0.4856534, -0.3248555, -3.564893, 0.08627451, 1, 0, 1,
-0.4802044, -0.8467593, -3.149757, 0.07843138, 1, 0, 1,
-0.4791342, -0.836652, -2.030163, 0.07450981, 1, 0, 1,
-0.4782273, 0.6931372, 1.507999, 0.06666667, 1, 0, 1,
-0.4767137, -1.074247, -2.382837, 0.0627451, 1, 0, 1,
-0.4724068, -1.387451, -1.427129, 0.05490196, 1, 0, 1,
-0.4654517, 1.724227, 0.7758268, 0.05098039, 1, 0, 1,
-0.4651492, -0.3386537, -1.763288, 0.04313726, 1, 0, 1,
-0.4645871, 1.952524, -0.1024861, 0.03921569, 1, 0, 1,
-0.4574206, 0.8843234, -2.402281, 0.03137255, 1, 0, 1,
-0.4558824, -2.726565, -1.739513, 0.02745098, 1, 0, 1,
-0.4538696, 0.3515983, -0.8211815, 0.01960784, 1, 0, 1,
-0.4475525, 0.8514735, -1.053529, 0.01568628, 1, 0, 1,
-0.4423139, 0.5687795, -0.4949349, 0.007843138, 1, 0, 1,
-0.4402792, 0.9605557, -0.3483445, 0.003921569, 1, 0, 1,
-0.4396703, -1.334305, -2.02349, 0, 1, 0.003921569, 1,
-0.4386304, -1.624554, -2.220258, 0, 1, 0.01176471, 1,
-0.4359594, 0.8434736, 0.2396425, 0, 1, 0.01568628, 1,
-0.4320387, -1.503092, -2.660956, 0, 1, 0.02352941, 1,
-0.431344, -0.1586816, -2.83814, 0, 1, 0.02745098, 1,
-0.4274578, -0.3081273, -1.640089, 0, 1, 0.03529412, 1,
-0.4234891, -0.02941344, -0.5868971, 0, 1, 0.03921569, 1,
-0.4174039, 1.242846, -0.4227272, 0, 1, 0.04705882, 1,
-0.4167086, -1.233284, -2.857924, 0, 1, 0.05098039, 1,
-0.4129061, -0.8458881, -0.4765276, 0, 1, 0.05882353, 1,
-0.410499, -0.7565687, -4.436461, 0, 1, 0.0627451, 1,
-0.4012436, 0.2683261, -1.653109, 0, 1, 0.07058824, 1,
-0.4001045, 0.1319275, -0.9370279, 0, 1, 0.07450981, 1,
-0.3999821, -0.7106754, -1.961368, 0, 1, 0.08235294, 1,
-0.3860582, -0.1467203, -2.762694, 0, 1, 0.08627451, 1,
-0.3858353, 0.7839364, -0.8161903, 0, 1, 0.09411765, 1,
-0.3811794, -1.280002, -2.611995, 0, 1, 0.1019608, 1,
-0.3784001, -0.9742761, -3.072814, 0, 1, 0.1058824, 1,
-0.3767661, -0.9291415, -1.746256, 0, 1, 0.1137255, 1,
-0.3750344, 0.7718065, 1.781946, 0, 1, 0.1176471, 1,
-0.3737023, -2.193656, -1.479325, 0, 1, 0.1254902, 1,
-0.3733851, 0.0843882, -0.9263354, 0, 1, 0.1294118, 1,
-0.3676326, -0.8650941, -0.8655725, 0, 1, 0.1372549, 1,
-0.365139, -0.04041867, -2.17753, 0, 1, 0.1411765, 1,
-0.3642888, -0.5097215, -1.572178, 0, 1, 0.1490196, 1,
-0.3569887, 1.838545, 1.086138, 0, 1, 0.1529412, 1,
-0.3569063, -0.4937837, -2.56532, 0, 1, 0.1607843, 1,
-0.3541131, 0.9827718, -1.566278, 0, 1, 0.1647059, 1,
-0.3522963, -0.04109848, -2.255131, 0, 1, 0.172549, 1,
-0.3478675, 1.537374, 0.9839419, 0, 1, 0.1764706, 1,
-0.3460743, 0.4817418, 0.08225235, 0, 1, 0.1843137, 1,
-0.3452906, 0.424547, -0.3642711, 0, 1, 0.1882353, 1,
-0.3418201, -1.651031, -2.742512, 0, 1, 0.1960784, 1,
-0.3413571, 0.7562827, -0.1824685, 0, 1, 0.2039216, 1,
-0.3391554, 0.8968402, -1.447444, 0, 1, 0.2078431, 1,
-0.3350055, -1.20945, -1.946949, 0, 1, 0.2156863, 1,
-0.3326009, 0.7730997, 0.2285048, 0, 1, 0.2196078, 1,
-0.3285209, -0.2969331, -2.398412, 0, 1, 0.227451, 1,
-0.3277288, -1.804379, -3.612833, 0, 1, 0.2313726, 1,
-0.3266821, 1.645104, 0.8201944, 0, 1, 0.2392157, 1,
-0.3264335, -0.5971514, 0.2738727, 0, 1, 0.2431373, 1,
-0.3263083, 0.5797166, 0.3331083, 0, 1, 0.2509804, 1,
-0.3245779, -0.2468507, -1.354786, 0, 1, 0.254902, 1,
-0.3245751, -0.3237444, -0.9954441, 0, 1, 0.2627451, 1,
-0.3168989, 1.013799, -0.720165, 0, 1, 0.2666667, 1,
-0.3166661, -1.231103, -2.325851, 0, 1, 0.2745098, 1,
-0.313498, 1.025463, -3.040151, 0, 1, 0.2784314, 1,
-0.3081802, -0.5248916, -2.450197, 0, 1, 0.2862745, 1,
-0.3064388, 1.408964, -1.173089, 0, 1, 0.2901961, 1,
-0.3060102, 0.6349514, 0.604811, 0, 1, 0.2980392, 1,
-0.3040544, 0.2993212, 1.225736, 0, 1, 0.3058824, 1,
-0.3039908, 0.317869, -1.027255, 0, 1, 0.3098039, 1,
-0.3012407, 0.8258046, 0.3463331, 0, 1, 0.3176471, 1,
-0.299199, 0.312289, -1.741401, 0, 1, 0.3215686, 1,
-0.2987465, 0.9461153, 0.7813002, 0, 1, 0.3294118, 1,
-0.2932056, 2.613644, 0.965297, 0, 1, 0.3333333, 1,
-0.2899158, 0.1832074, -2.313144, 0, 1, 0.3411765, 1,
-0.2787637, -2.226509, -3.675913, 0, 1, 0.345098, 1,
-0.2744437, -0.06246822, -1.895883, 0, 1, 0.3529412, 1,
-0.2714029, -0.1458969, -2.098273, 0, 1, 0.3568628, 1,
-0.27118, -1.071029, -4.224934, 0, 1, 0.3647059, 1,
-0.2709896, -1.257069, -3.329318, 0, 1, 0.3686275, 1,
-0.2697396, -0.1503966, -2.66123, 0, 1, 0.3764706, 1,
-0.2653787, -0.8338671, -3.405107, 0, 1, 0.3803922, 1,
-0.262748, 1.648059, -0.6465544, 0, 1, 0.3882353, 1,
-0.2613402, -1.336734, -2.368427, 0, 1, 0.3921569, 1,
-0.2576466, 0.2332495, -0.3737027, 0, 1, 0.4, 1,
-0.2571746, 1.916049, -1.052583, 0, 1, 0.4078431, 1,
-0.2538479, -1.204587, -1.890526, 0, 1, 0.4117647, 1,
-0.2534291, 1.043715, -2.107092, 0, 1, 0.4196078, 1,
-0.2444474, -0.4860001, -2.463186, 0, 1, 0.4235294, 1,
-0.2394413, -0.6964948, -3.812353, 0, 1, 0.4313726, 1,
-0.2373208, -1.119674, -3.731503, 0, 1, 0.4352941, 1,
-0.2363841, 0.4810942, -1.078797, 0, 1, 0.4431373, 1,
-0.2353205, 0.6483513, 0.4863075, 0, 1, 0.4470588, 1,
-0.229785, 0.5962903, -1.110133, 0, 1, 0.454902, 1,
-0.2279403, 0.3800545, -0.8438324, 0, 1, 0.4588235, 1,
-0.224756, 1.042835, 0.1934794, 0, 1, 0.4666667, 1,
-0.220514, 1.572254, -0.3135067, 0, 1, 0.4705882, 1,
-0.2204958, 1.426433, 0.1150267, 0, 1, 0.4784314, 1,
-0.2191629, 0.3636533, 0.4396586, 0, 1, 0.4823529, 1,
-0.2124156, -1.542957, -3.828588, 0, 1, 0.4901961, 1,
-0.2031433, -1.11896, -1.536081, 0, 1, 0.4941176, 1,
-0.2023246, -0.1442077, -0.4223357, 0, 1, 0.5019608, 1,
-0.2015728, 0.4104186, -0.8647533, 0, 1, 0.509804, 1,
-0.1998484, 0.8631318, 0.1195373, 0, 1, 0.5137255, 1,
-0.1971899, 0.1911303, 1.119715, 0, 1, 0.5215687, 1,
-0.1958584, -1.559444, -2.668259, 0, 1, 0.5254902, 1,
-0.1952831, 1.233285, -0.2325018, 0, 1, 0.5333334, 1,
-0.1898394, -0.2180237, -2.381254, 0, 1, 0.5372549, 1,
-0.1849023, 0.1630607, -1.339183, 0, 1, 0.5450981, 1,
-0.184178, -1.241391, -2.8686, 0, 1, 0.5490196, 1,
-0.1838516, -0.6561389, -2.33299, 0, 1, 0.5568628, 1,
-0.1799818, 2.529954, -0.6359386, 0, 1, 0.5607843, 1,
-0.1789105, -0.7341201, -1.928009, 0, 1, 0.5686275, 1,
-0.1783106, -0.5887811, -1.374857, 0, 1, 0.572549, 1,
-0.1735793, -1.668403, -1.343738, 0, 1, 0.5803922, 1,
-0.1721591, 0.08793253, -0.07098199, 0, 1, 0.5843138, 1,
-0.1688015, 1.07197, 1.013838, 0, 1, 0.5921569, 1,
-0.1681066, -0.1220982, -2.928328, 0, 1, 0.5960785, 1,
-0.1679855, 0.284988, 1.248801, 0, 1, 0.6039216, 1,
-0.1679133, 1.313647, 0.4335487, 0, 1, 0.6117647, 1,
-0.1652523, 1.611392, -0.1655467, 0, 1, 0.6156863, 1,
-0.1640173, -0.2010008, -2.340015, 0, 1, 0.6235294, 1,
-0.1621047, -1.075969, -3.731192, 0, 1, 0.627451, 1,
-0.1578342, -0.7501148, -2.110306, 0, 1, 0.6352941, 1,
-0.1570376, -0.1823356, -2.176737, 0, 1, 0.6392157, 1,
-0.1553438, -0.4912107, -2.143309, 0, 1, 0.6470588, 1,
-0.1500258, -0.2104412, -3.996397, 0, 1, 0.6509804, 1,
-0.1383546, 1.367401, 0.2934369, 0, 1, 0.6588235, 1,
-0.1330271, 0.4847503, 0.66001, 0, 1, 0.6627451, 1,
-0.1328155, -1.615852, -3.856937, 0, 1, 0.6705883, 1,
-0.1316654, -0.01232307, -1.61248, 0, 1, 0.6745098, 1,
-0.1269753, -0.4690256, -1.390965, 0, 1, 0.682353, 1,
-0.1263671, 0.1005663, -3.236324, 0, 1, 0.6862745, 1,
-0.1249595, -1.579129, -3.242342, 0, 1, 0.6941177, 1,
-0.1245079, -0.9335344, -3.605215, 0, 1, 0.7019608, 1,
-0.1238696, 0.2827447, 0.6405055, 0, 1, 0.7058824, 1,
-0.1234189, 0.03536671, 0.01688955, 0, 1, 0.7137255, 1,
-0.1214846, 0.7410329, 0.1333525, 0, 1, 0.7176471, 1,
-0.1194149, -0.4190338, -3.77308, 0, 1, 0.7254902, 1,
-0.1178866, 0.2651868, -1.750813, 0, 1, 0.7294118, 1,
-0.1168894, 0.8452696, -1.122649, 0, 1, 0.7372549, 1,
-0.116794, -1.558163, -4.81281, 0, 1, 0.7411765, 1,
-0.1156629, -0.1651168, -0.8815722, 0, 1, 0.7490196, 1,
-0.1135171, -1.379465, -3.818684, 0, 1, 0.7529412, 1,
-0.1132918, 1.258388, -1.13242, 0, 1, 0.7607843, 1,
-0.112512, -1.351065, -3.510906, 0, 1, 0.7647059, 1,
-0.1111606, -1.27401, -4.516465, 0, 1, 0.772549, 1,
-0.1077239, 1.145269, -1.335622, 0, 1, 0.7764706, 1,
-0.1060864, 0.09871308, -2.046631, 0, 1, 0.7843137, 1,
-0.1053079, 0.8187515, 0.2501056, 0, 1, 0.7882353, 1,
-0.1034275, -0.6271851, -2.919811, 0, 1, 0.7960784, 1,
-0.1023538, -0.1400515, -3.827417, 0, 1, 0.8039216, 1,
-0.1021821, 0.3108078, 0.9605705, 0, 1, 0.8078431, 1,
-0.1012335, -0.7198001, -2.929066, 0, 1, 0.8156863, 1,
-0.1008664, 0.5183368, 0.2505919, 0, 1, 0.8196079, 1,
-0.1007172, 1.031883, -0.9490207, 0, 1, 0.827451, 1,
-0.1003671, 0.6195817, -0.9897012, 0, 1, 0.8313726, 1,
-0.09054965, -0.5485941, -4.534177, 0, 1, 0.8392157, 1,
-0.08851882, 1.286798, 0.4466144, 0, 1, 0.8431373, 1,
-0.07701943, -1.488893, -3.915151, 0, 1, 0.8509804, 1,
-0.07412205, 0.8422201, 0.2675592, 0, 1, 0.854902, 1,
-0.0701105, 1.888834, -0.1368947, 0, 1, 0.8627451, 1,
-0.06943366, 0.6030308, -0.9101518, 0, 1, 0.8666667, 1,
-0.06355118, 1.72746, 1.07883, 0, 1, 0.8745098, 1,
-0.06193772, 0.1280944, -1.423684, 0, 1, 0.8784314, 1,
-0.06082908, 1.632669, 1.419665, 0, 1, 0.8862745, 1,
-0.05996925, -0.7322872, -4.056491, 0, 1, 0.8901961, 1,
-0.05373041, 0.1879425, 0.8699133, 0, 1, 0.8980392, 1,
-0.0510981, -0.1229928, -3.289291, 0, 1, 0.9058824, 1,
-0.04325514, 0.3226278, -1.439296, 0, 1, 0.9098039, 1,
-0.04313058, -0.02936568, -3.694188, 0, 1, 0.9176471, 1,
-0.02789899, 0.6753505, 1.321627, 0, 1, 0.9215686, 1,
-0.02757528, -0.009182164, -1.798734, 0, 1, 0.9294118, 1,
-0.02748176, -0.5767673, -1.43452, 0, 1, 0.9333333, 1,
-0.02726082, 0.2847359, -1.246866, 0, 1, 0.9411765, 1,
-0.02280731, -0.147631, -3.427182, 0, 1, 0.945098, 1,
-0.01803927, -1.004223, -2.907625, 0, 1, 0.9529412, 1,
-0.01773978, -1.889615, -4.358263, 0, 1, 0.9568627, 1,
-0.01143062, -0.8998557, -4.01849, 0, 1, 0.9647059, 1,
-0.01125625, -1.685437, -4.041211, 0, 1, 0.9686275, 1,
-0.007833856, -0.7785071, -3.548709, 0, 1, 0.9764706, 1,
-0.003366619, -1.931226, -5.047133, 0, 1, 0.9803922, 1,
-0.002860237, 0.1247929, 0.4890759, 0, 1, 0.9882353, 1,
-0.002825269, 0.4135898, -0.5814961, 0, 1, 0.9921569, 1,
-0.001428654, -0.6191424, -4.048667, 0, 1, 1, 1,
-0.001179857, -1.49005, -2.319631, 0, 0.9921569, 1, 1,
-0.0002905879, -0.474027, -2.919793, 0, 0.9882353, 1, 1,
0.0006146498, 0.09599236, -0.04075504, 0, 0.9803922, 1, 1,
0.001243154, -0.07171998, 2.855886, 0, 0.9764706, 1, 1,
0.001763977, -0.1933444, 3.494701, 0, 0.9686275, 1, 1,
0.002232382, 0.5273142, -1.014696, 0, 0.9647059, 1, 1,
0.003421733, 0.6231806, 0.4390803, 0, 0.9568627, 1, 1,
0.004817653, 0.7959967, 0.55018, 0, 0.9529412, 1, 1,
0.004990524, 0.9502749, -0.9907649, 0, 0.945098, 1, 1,
0.005190744, -2.125607, 3.778523, 0, 0.9411765, 1, 1,
0.005501871, -0.5824663, 4.025835, 0, 0.9333333, 1, 1,
0.007358029, 1.364269, -0.6914408, 0, 0.9294118, 1, 1,
0.008784091, 1.162055, 1.135653, 0, 0.9215686, 1, 1,
0.01001977, -0.6521361, 2.370615, 0, 0.9176471, 1, 1,
0.01696768, 0.763449, -0.5372124, 0, 0.9098039, 1, 1,
0.01868516, -0.5779764, 3.925226, 0, 0.9058824, 1, 1,
0.01961013, 1.233787, -0.5443615, 0, 0.8980392, 1, 1,
0.02026635, 0.9575619, 0.8042623, 0, 0.8901961, 1, 1,
0.02553248, 1.223182, -0.9501262, 0, 0.8862745, 1, 1,
0.02809095, 1.099713, -1.040517, 0, 0.8784314, 1, 1,
0.0284536, -0.9385114, 3.368286, 0, 0.8745098, 1, 1,
0.03052637, -0.6204183, 2.368389, 0, 0.8666667, 1, 1,
0.03063577, -1.394115, 2.826326, 0, 0.8627451, 1, 1,
0.03758087, -1.131675, 2.979641, 0, 0.854902, 1, 1,
0.0391261, -0.8907467, 1.64189, 0, 0.8509804, 1, 1,
0.04357497, 0.5856543, 0.5926136, 0, 0.8431373, 1, 1,
0.05379104, -0.0645196, 2.580538, 0, 0.8392157, 1, 1,
0.05423608, 0.5313249, 0.5302246, 0, 0.8313726, 1, 1,
0.0618546, 0.7199555, 1.475063, 0, 0.827451, 1, 1,
0.06301474, -0.2501234, 3.080033, 0, 0.8196079, 1, 1,
0.07013685, 1.165699, -1.208164, 0, 0.8156863, 1, 1,
0.07436232, -0.9447138, 3.169035, 0, 0.8078431, 1, 1,
0.07575195, 0.2153699, -0.5875397, 0, 0.8039216, 1, 1,
0.07937104, 1.49754, 0.09180752, 0, 0.7960784, 1, 1,
0.07997443, -1.267242, 2.685489, 0, 0.7882353, 1, 1,
0.08419589, -1.791841, 2.38444, 0, 0.7843137, 1, 1,
0.09344498, -0.1539724, 3.257352, 0, 0.7764706, 1, 1,
0.09613476, 0.9252707, 1.312963, 0, 0.772549, 1, 1,
0.09687113, 0.8785127, -0.5799358, 0, 0.7647059, 1, 1,
0.1015536, -0.639342, 3.419782, 0, 0.7607843, 1, 1,
0.1023337, 2.076433, 1.827728, 0, 0.7529412, 1, 1,
0.1035929, 0.6220657, 0.3991648, 0, 0.7490196, 1, 1,
0.1048191, -0.3326885, 4.952116, 0, 0.7411765, 1, 1,
0.1079968, 1.641393, 0.1167597, 0, 0.7372549, 1, 1,
0.1085915, -0.6289303, 4.123901, 0, 0.7294118, 1, 1,
0.1093442, 0.615389, 3.456494, 0, 0.7254902, 1, 1,
0.1129977, 0.4735671, 0.4522859, 0, 0.7176471, 1, 1,
0.1155197, 0.7310889, 0.05601333, 0, 0.7137255, 1, 1,
0.1161188, 1.002114, 0.3255107, 0, 0.7058824, 1, 1,
0.1162205, -0.8244838, 1.684135, 0, 0.6980392, 1, 1,
0.1193677, 1.895161, -0.6934564, 0, 0.6941177, 1, 1,
0.1197495, -0.8602448, 3.442569, 0, 0.6862745, 1, 1,
0.1198078, 1.865858, 0.07251745, 0, 0.682353, 1, 1,
0.1221323, 1.159985, -0.6356878, 0, 0.6745098, 1, 1,
0.1231532, -0.5863404, 2.12757, 0, 0.6705883, 1, 1,
0.125607, -1.898436, 2.707669, 0, 0.6627451, 1, 1,
0.1280042, -1.040609, 1.735183, 0, 0.6588235, 1, 1,
0.1317928, 0.2948443, 1.413274, 0, 0.6509804, 1, 1,
0.1326904, 0.6140358, -0.82249, 0, 0.6470588, 1, 1,
0.1329529, 0.4608569, 0.718464, 0, 0.6392157, 1, 1,
0.1366258, 0.4252836, -0.8401003, 0, 0.6352941, 1, 1,
0.1408983, 1.174894, 1.381682, 0, 0.627451, 1, 1,
0.1426259, 1.412468, -0.5959462, 0, 0.6235294, 1, 1,
0.1450735, 1.072583, 0.9666205, 0, 0.6156863, 1, 1,
0.1470741, -0.6008508, 2.476562, 0, 0.6117647, 1, 1,
0.1477675, -0.3246961, 3.185058, 0, 0.6039216, 1, 1,
0.1488495, -1.504251, 2.895525, 0, 0.5960785, 1, 1,
0.1493305, -0.6281322, 3.243561, 0, 0.5921569, 1, 1,
0.1504777, -0.4486638, 0.7310172, 0, 0.5843138, 1, 1,
0.1507163, -0.5827722, 4.607883, 0, 0.5803922, 1, 1,
0.1538193, 1.091614, 1.105615, 0, 0.572549, 1, 1,
0.154885, 0.8757185, -1.900584, 0, 0.5686275, 1, 1,
0.156258, -0.06465621, 1.212552, 0, 0.5607843, 1, 1,
0.1563018, 1.216832, 1.150807, 0, 0.5568628, 1, 1,
0.1564387, -0.8844043, 5.380237, 0, 0.5490196, 1, 1,
0.158502, 0.3327261, 1.94302, 0, 0.5450981, 1, 1,
0.1598413, -0.523616, 3.395911, 0, 0.5372549, 1, 1,
0.1612772, 0.7709437, 0.2467984, 0, 0.5333334, 1, 1,
0.1632295, 1.175879, 1.803863, 0, 0.5254902, 1, 1,
0.1639692, -0.5653269, 0.7304373, 0, 0.5215687, 1, 1,
0.1643866, -2.158015, 4.314794, 0, 0.5137255, 1, 1,
0.1648844, -0.01723028, 2.656461, 0, 0.509804, 1, 1,
0.1649313, 0.909874, -1.363982, 0, 0.5019608, 1, 1,
0.1668561, -0.5898736, 2.243538, 0, 0.4941176, 1, 1,
0.1689199, -2.58931, 1.772922, 0, 0.4901961, 1, 1,
0.1698515, 1.269554, 2.458066, 0, 0.4823529, 1, 1,
0.1734474, -0.4752294, 1.344086, 0, 0.4784314, 1, 1,
0.174096, 0.1113422, 2.790441, 0, 0.4705882, 1, 1,
0.1757918, -0.6226836, 3.953017, 0, 0.4666667, 1, 1,
0.1795152, -0.2524771, 2.027556, 0, 0.4588235, 1, 1,
0.1854439, 1.830319, 0.7915391, 0, 0.454902, 1, 1,
0.186987, -0.9871085, 4.426319, 0, 0.4470588, 1, 1,
0.1930411, -1.260586, 5.126168, 0, 0.4431373, 1, 1,
0.1938187, 0.003769093, 1.778159, 0, 0.4352941, 1, 1,
0.1955051, 2.02875, 0.3826187, 0, 0.4313726, 1, 1,
0.1961034, 1.115061, 0.03190639, 0, 0.4235294, 1, 1,
0.1965046, 0.3559074, -1.770224, 0, 0.4196078, 1, 1,
0.2024214, 0.2584797, 0.5961409, 0, 0.4117647, 1, 1,
0.205295, -1.018572, 4.227729, 0, 0.4078431, 1, 1,
0.2068131, 0.3305846, -0.1035386, 0, 0.4, 1, 1,
0.2092416, -0.5836197, 2.802643, 0, 0.3921569, 1, 1,
0.2108381, -0.3535466, 4.448147, 0, 0.3882353, 1, 1,
0.2141856, -0.02066773, -0.003976806, 0, 0.3803922, 1, 1,
0.2152912, -0.2706686, 3.208633, 0, 0.3764706, 1, 1,
0.2197621, 2.348929, 1.042793, 0, 0.3686275, 1, 1,
0.2197757, -0.1083539, 0.9819489, 0, 0.3647059, 1, 1,
0.2214222, 0.05308691, 1.229493, 0, 0.3568628, 1, 1,
0.2341259, -0.3389215, 2.452359, 0, 0.3529412, 1, 1,
0.2373389, 0.1392959, 2.273539, 0, 0.345098, 1, 1,
0.2374512, -1.357771, 3.46817, 0, 0.3411765, 1, 1,
0.2387269, -1.34721, 4.187131, 0, 0.3333333, 1, 1,
0.2391409, 0.6700919, 0.1864037, 0, 0.3294118, 1, 1,
0.2410274, 0.1835352, 1.001172, 0, 0.3215686, 1, 1,
0.2417028, 0.847136, 0.1030544, 0, 0.3176471, 1, 1,
0.2424895, 1.196334, 0.3755647, 0, 0.3098039, 1, 1,
0.2507653, 0.004465566, 2.01702, 0, 0.3058824, 1, 1,
0.2533699, 0.4711436, -0.5311472, 0, 0.2980392, 1, 1,
0.2541853, -1.025443, 4.533538, 0, 0.2901961, 1, 1,
0.254461, 1.180706, 0.7458517, 0, 0.2862745, 1, 1,
0.2573297, -0.6347562, 3.572539, 0, 0.2784314, 1, 1,
0.2583403, 0.6220654, 0.4604867, 0, 0.2745098, 1, 1,
0.2625675, -0.9614486, 4.010515, 0, 0.2666667, 1, 1,
0.2742815, 0.6855806, -0.6678973, 0, 0.2627451, 1, 1,
0.2756485, -1.948335, 3.847935, 0, 0.254902, 1, 1,
0.2775007, -0.2808594, 1.540824, 0, 0.2509804, 1, 1,
0.2793484, -0.8401142, 1.997388, 0, 0.2431373, 1, 1,
0.2806713, -1.396898, 4.311175, 0, 0.2392157, 1, 1,
0.2834046, -0.1924447, 2.768441, 0, 0.2313726, 1, 1,
0.28792, -1.279918, 1.877007, 0, 0.227451, 1, 1,
0.2915744, -1.459617, 2.291993, 0, 0.2196078, 1, 1,
0.2919536, -0.2075464, 3.350486, 0, 0.2156863, 1, 1,
0.2925406, -1.661337, 3.939096, 0, 0.2078431, 1, 1,
0.2936655, 1.999433, 0.5597922, 0, 0.2039216, 1, 1,
0.2949856, -0.8067101, 2.46368, 0, 0.1960784, 1, 1,
0.2976353, -1.822692, 4.003836, 0, 0.1882353, 1, 1,
0.3052433, -0.1877319, 2.003502, 0, 0.1843137, 1, 1,
0.3092544, -0.9763846, 4.320163, 0, 0.1764706, 1, 1,
0.3139142, -0.1520086, 2.946232, 0, 0.172549, 1, 1,
0.3145056, -0.5183285, 2.607497, 0, 0.1647059, 1, 1,
0.3172915, -0.4968208, 3.34686, 0, 0.1607843, 1, 1,
0.3220463, -0.198384, 2.071177, 0, 0.1529412, 1, 1,
0.329254, 0.693602, 0.1166817, 0, 0.1490196, 1, 1,
0.3318176, -1.583658, 3.978549, 0, 0.1411765, 1, 1,
0.3353271, -0.3603908, 1.229264, 0, 0.1372549, 1, 1,
0.3414993, 0.1939698, 0.668785, 0, 0.1294118, 1, 1,
0.3434973, 0.5129824, 0.5830702, 0, 0.1254902, 1, 1,
0.3443221, 2.141273, -0.7097583, 0, 0.1176471, 1, 1,
0.3450982, -0.967179, 1.878661, 0, 0.1137255, 1, 1,
0.3456205, -0.8057016, 1.859709, 0, 0.1058824, 1, 1,
0.3475457, 0.4377864, 2.49622, 0, 0.09803922, 1, 1,
0.3475867, 0.6209782, -2.235089, 0, 0.09411765, 1, 1,
0.3482601, -0.2249352, 1.355206, 0, 0.08627451, 1, 1,
0.3489827, -0.2758888, 2.870456, 0, 0.08235294, 1, 1,
0.3499644, 0.04719524, 0.7435876, 0, 0.07450981, 1, 1,
0.3554476, -0.6987438, 0.7167517, 0, 0.07058824, 1, 1,
0.3555866, -0.4616663, 3.269266, 0, 0.0627451, 1, 1,
0.3563475, -0.4214304, 1.568087, 0, 0.05882353, 1, 1,
0.3573197, -0.6448014, 4.137478, 0, 0.05098039, 1, 1,
0.3616566, -0.3601442, 2.946374, 0, 0.04705882, 1, 1,
0.3624496, -1.182742, 3.481072, 0, 0.03921569, 1, 1,
0.3644519, -0.07902567, 0.701782, 0, 0.03529412, 1, 1,
0.3654954, 0.4075226, 2.038184, 0, 0.02745098, 1, 1,
0.3669336, -0.5535264, 1.78029, 0, 0.02352941, 1, 1,
0.3670998, -0.08023866, 1.599022, 0, 0.01568628, 1, 1,
0.3681583, -1.57008, 2.83427, 0, 0.01176471, 1, 1,
0.3693795, 0.428014, 1.221731, 0, 0.003921569, 1, 1,
0.3705708, 0.4605067, 0.756724, 0.003921569, 0, 1, 1,
0.3738943, 1.24999, 0.4316425, 0.007843138, 0, 1, 1,
0.3753691, -0.4256786, 1.971871, 0.01568628, 0, 1, 1,
0.3811405, 1.315285, -1.191682, 0.01960784, 0, 1, 1,
0.3867332, 0.1020691, 2.391874, 0.02745098, 0, 1, 1,
0.390403, -1.764782, 3.527957, 0.03137255, 0, 1, 1,
0.3906992, 0.3336936, 1.334747, 0.03921569, 0, 1, 1,
0.3929933, 0.5529928, 0.6402027, 0.04313726, 0, 1, 1,
0.3942225, 0.2125, 1.298614, 0.05098039, 0, 1, 1,
0.3954694, 1.331788, -0.5449058, 0.05490196, 0, 1, 1,
0.3965216, 0.8856866, -0.4674481, 0.0627451, 0, 1, 1,
0.3995001, -1.125879, 3.084594, 0.06666667, 0, 1, 1,
0.4000013, 1.22924, -0.8330396, 0.07450981, 0, 1, 1,
0.4002909, -0.8555958, 4.085248, 0.07843138, 0, 1, 1,
0.4005682, 0.447352, 0.9338763, 0.08627451, 0, 1, 1,
0.4013561, -0.03188175, 2.2848, 0.09019608, 0, 1, 1,
0.4018602, 0.271663, 0.5642808, 0.09803922, 0, 1, 1,
0.4021149, 0.6302187, 1.062762, 0.1058824, 0, 1, 1,
0.4050425, -1.634823, 2.613043, 0.1098039, 0, 1, 1,
0.4058771, 0.7190766, 1.041359, 0.1176471, 0, 1, 1,
0.4068011, 0.9397532, 0.4236403, 0.1215686, 0, 1, 1,
0.4083194, 0.5758526, 2.154135, 0.1294118, 0, 1, 1,
0.4142192, -0.04172552, 2.071303, 0.1333333, 0, 1, 1,
0.4153256, 0.7008477, -0.4975497, 0.1411765, 0, 1, 1,
0.4171558, -1.20679, 3.914692, 0.145098, 0, 1, 1,
0.4177559, 0.1394473, 1.357588, 0.1529412, 0, 1, 1,
0.418149, -0.7249594, 1.485435, 0.1568628, 0, 1, 1,
0.4186757, 1.046708, 1.188196, 0.1647059, 0, 1, 1,
0.4253809, -0.08388718, 2.871679, 0.1686275, 0, 1, 1,
0.4255762, -1.107495, 2.921169, 0.1764706, 0, 1, 1,
0.4280768, -0.6599412, 1.557029, 0.1803922, 0, 1, 1,
0.4319282, 0.02067403, 1.93713, 0.1882353, 0, 1, 1,
0.4319562, 0.5913585, -0.0608811, 0.1921569, 0, 1, 1,
0.4381035, -1.768233, 1.055226, 0.2, 0, 1, 1,
0.4428098, -1.763515, 2.047292, 0.2078431, 0, 1, 1,
0.4471192, 1.585595, -0.5680056, 0.2117647, 0, 1, 1,
0.4511419, -1.271234, 2.063754, 0.2196078, 0, 1, 1,
0.4619282, -1.315232, 3.580884, 0.2235294, 0, 1, 1,
0.462163, 1.395493, 0.4258672, 0.2313726, 0, 1, 1,
0.462497, -0.8741502, 3.264692, 0.2352941, 0, 1, 1,
0.4643726, 0.7437054, 0.3760759, 0.2431373, 0, 1, 1,
0.4718964, -0.6589498, 1.632439, 0.2470588, 0, 1, 1,
0.4763515, -0.49652, 1.865349, 0.254902, 0, 1, 1,
0.4790826, 1.157006, 1.404574, 0.2588235, 0, 1, 1,
0.4791774, 0.5207765, 0.05181135, 0.2666667, 0, 1, 1,
0.4797395, -1.389162, 2.972629, 0.2705882, 0, 1, 1,
0.482822, 0.731369, 1.568744, 0.2784314, 0, 1, 1,
0.4900765, 1.104175, 1.203987, 0.282353, 0, 1, 1,
0.4982789, -2.225684, 2.293114, 0.2901961, 0, 1, 1,
0.4991613, -0.4459258, 1.184062, 0.2941177, 0, 1, 1,
0.5014638, 0.4006704, 0.8009819, 0.3019608, 0, 1, 1,
0.5034028, -2.084339, 4.384237, 0.3098039, 0, 1, 1,
0.5047926, 0.7148266, 1.456524, 0.3137255, 0, 1, 1,
0.5056129, 1.706148, -0.2801141, 0.3215686, 0, 1, 1,
0.5082214, -1.820206, 4.393684, 0.3254902, 0, 1, 1,
0.5151425, 0.09167269, 2.170893, 0.3333333, 0, 1, 1,
0.5160087, -0.515817, 2.102354, 0.3372549, 0, 1, 1,
0.5162391, -0.886358, 2.656176, 0.345098, 0, 1, 1,
0.5168011, -0.8264353, 2.300884, 0.3490196, 0, 1, 1,
0.5201786, -1.502173, 2.532545, 0.3568628, 0, 1, 1,
0.5240394, 1.509867, -1.944691, 0.3607843, 0, 1, 1,
0.5283964, -1.061616, 2.097467, 0.3686275, 0, 1, 1,
0.5305861, -0.2354387, 1.587465, 0.372549, 0, 1, 1,
0.5317625, 1.479113, 1.394518, 0.3803922, 0, 1, 1,
0.5354998, -0.2925377, 2.274188, 0.3843137, 0, 1, 1,
0.5380305, -0.566718, 4.619759, 0.3921569, 0, 1, 1,
0.538044, 0.4437478, 0.5373926, 0.3960784, 0, 1, 1,
0.5381886, 1.264189, 0.85254, 0.4039216, 0, 1, 1,
0.542795, 2.23991, 1.597961, 0.4117647, 0, 1, 1,
0.5436163, 2.979609, -0.4827555, 0.4156863, 0, 1, 1,
0.5440135, -0.6843872, 2.710342, 0.4235294, 0, 1, 1,
0.5443576, 0.6900402, 1.022602, 0.427451, 0, 1, 1,
0.5456302, 1.51203, -0.9508629, 0.4352941, 0, 1, 1,
0.5460793, 1.735948, 0.8714536, 0.4392157, 0, 1, 1,
0.5481299, -0.2454713, 1.129522, 0.4470588, 0, 1, 1,
0.5549828, -0.0662384, 3.620889, 0.4509804, 0, 1, 1,
0.5644332, -0.1269209, 1.058734, 0.4588235, 0, 1, 1,
0.564812, -2.539282, 3.284561, 0.4627451, 0, 1, 1,
0.568568, 0.4023387, 0.8196299, 0.4705882, 0, 1, 1,
0.5749841, -0.00852157, 1.288128, 0.4745098, 0, 1, 1,
0.5871217, -0.1235251, 0.5958889, 0.4823529, 0, 1, 1,
0.5943838, -0.9707949, 0.8138623, 0.4862745, 0, 1, 1,
0.594776, 0.02370214, 0.6202953, 0.4941176, 0, 1, 1,
0.5977442, 0.7738186, -0.03968207, 0.5019608, 0, 1, 1,
0.6024932, -0.3535206, 3.279869, 0.5058824, 0, 1, 1,
0.6160557, 1.48745, 1.886931, 0.5137255, 0, 1, 1,
0.6172374, 0.9950567, 2.109564, 0.5176471, 0, 1, 1,
0.6282431, -0.6281325, 2.487827, 0.5254902, 0, 1, 1,
0.6324018, 1.324809, 0.7154294, 0.5294118, 0, 1, 1,
0.639128, -0.4657964, 2.393586, 0.5372549, 0, 1, 1,
0.6441002, 0.355146, 0.7706627, 0.5411765, 0, 1, 1,
0.6454525, -1.735433, 3.080786, 0.5490196, 0, 1, 1,
0.6482078, 0.4276975, 2.060789, 0.5529412, 0, 1, 1,
0.6516011, 2.108335, -0.03274066, 0.5607843, 0, 1, 1,
0.6537533, -0.302224, 0.7957079, 0.5647059, 0, 1, 1,
0.6538745, 1.110192, -0.7692633, 0.572549, 0, 1, 1,
0.6544424, 0.1545809, 0.1911108, 0.5764706, 0, 1, 1,
0.6595433, -0.9230379, 3.057435, 0.5843138, 0, 1, 1,
0.6698209, 1.666741, -0.79835, 0.5882353, 0, 1, 1,
0.6699882, -0.3216246, 2.986523, 0.5960785, 0, 1, 1,
0.6763999, 0.3978687, 0.8778226, 0.6039216, 0, 1, 1,
0.6836568, -1.705656, 3.483104, 0.6078432, 0, 1, 1,
0.6845806, 0.626551, 0.4623456, 0.6156863, 0, 1, 1,
0.6920811, -0.003459202, 1.277274, 0.6196079, 0, 1, 1,
0.6946213, 2.275745, -0.7158521, 0.627451, 0, 1, 1,
0.6948535, -0.1785443, 1.599889, 0.6313726, 0, 1, 1,
0.6983386, 1.08204, 0.3515385, 0.6392157, 0, 1, 1,
0.7007177, -0.08641943, 4.72628, 0.6431373, 0, 1, 1,
0.7058189, 0.8439571, 2.036387, 0.6509804, 0, 1, 1,
0.7065104, -0.4376977, 1.606336, 0.654902, 0, 1, 1,
0.7078022, -0.2211069, 0.6549445, 0.6627451, 0, 1, 1,
0.7137633, 0.7076824, 0.7034433, 0.6666667, 0, 1, 1,
0.7147076, 0.699908, 0.5517123, 0.6745098, 0, 1, 1,
0.7196017, -0.2968599, 2.616403, 0.6784314, 0, 1, 1,
0.7236071, -1.960706, 3.021038, 0.6862745, 0, 1, 1,
0.7303529, -0.4137574, 3.114875, 0.6901961, 0, 1, 1,
0.7354394, 0.3597887, 1.550823, 0.6980392, 0, 1, 1,
0.7371495, 0.3787493, 3.739288, 0.7058824, 0, 1, 1,
0.7416113, -1.10718, 2.295382, 0.7098039, 0, 1, 1,
0.7418817, -0.4747191, 2.028812, 0.7176471, 0, 1, 1,
0.7510315, -1.048369, 2.347731, 0.7215686, 0, 1, 1,
0.7528396, -0.1476432, 0.3692164, 0.7294118, 0, 1, 1,
0.7567055, -1.736841, 2.71711, 0.7333333, 0, 1, 1,
0.7601851, -0.2990532, 1.617139, 0.7411765, 0, 1, 1,
0.7625892, 0.5935988, 0.08455136, 0.7450981, 0, 1, 1,
0.7638872, 0.634219, 0.2955852, 0.7529412, 0, 1, 1,
0.7674085, 0.4778548, 0.8850837, 0.7568628, 0, 1, 1,
0.7706287, 0.04505019, 2.033418, 0.7647059, 0, 1, 1,
0.7749365, 0.2075217, 1.08508, 0.7686275, 0, 1, 1,
0.778777, 0.6108978, 0.5832815, 0.7764706, 0, 1, 1,
0.7802666, -2.911954, 3.950479, 0.7803922, 0, 1, 1,
0.7805646, 0.05156621, 1.848137, 0.7882353, 0, 1, 1,
0.7847955, 1.295274, 0.9965709, 0.7921569, 0, 1, 1,
0.7861312, 0.8156394, 0.8874012, 0.8, 0, 1, 1,
0.7912104, -0.5733202, 2.10613, 0.8078431, 0, 1, 1,
0.8000641, 1.627226, 0.2114005, 0.8117647, 0, 1, 1,
0.8025761, -2.478542, 3.725298, 0.8196079, 0, 1, 1,
0.8031462, 0.5957691, -0.04207296, 0.8235294, 0, 1, 1,
0.8054108, -0.1100575, 2.284573, 0.8313726, 0, 1, 1,
0.8075546, -2.051048, 4.349529, 0.8352941, 0, 1, 1,
0.8075878, 0.6349787, 0.007588501, 0.8431373, 0, 1, 1,
0.8110685, -1.244752, 4.019662, 0.8470588, 0, 1, 1,
0.8282165, 0.2014632, -0.2217519, 0.854902, 0, 1, 1,
0.8300874, 0.3375537, 1.109213, 0.8588235, 0, 1, 1,
0.8306469, -1.790951, 0.9102268, 0.8666667, 0, 1, 1,
0.8307366, -0.9827245, 3.50323, 0.8705882, 0, 1, 1,
0.840249, 0.03307883, 0.3367294, 0.8784314, 0, 1, 1,
0.841643, 1.36939, -0.815362, 0.8823529, 0, 1, 1,
0.8430973, 0.1165533, 3.037538, 0.8901961, 0, 1, 1,
0.847008, -1.197427, 2.18868, 0.8941177, 0, 1, 1,
0.8562391, 0.8918299, 0.1972608, 0.9019608, 0, 1, 1,
0.8598517, 0.6124071, -0.1082443, 0.9098039, 0, 1, 1,
0.8602038, -2.141388, 0.796842, 0.9137255, 0, 1, 1,
0.862321, 1.468792, 1.107644, 0.9215686, 0, 1, 1,
0.8666703, -1.259023, 3.545838, 0.9254902, 0, 1, 1,
0.8750374, -0.9704894, 4.370438, 0.9333333, 0, 1, 1,
0.8751443, -0.5185799, 1.036885, 0.9372549, 0, 1, 1,
0.8817176, -0.4530928, 2.415491, 0.945098, 0, 1, 1,
0.882724, -0.05335747, 2.279659, 0.9490196, 0, 1, 1,
0.8829564, 0.9365148, 2.080053, 0.9568627, 0, 1, 1,
0.8877647, -1.01724, 2.054977, 0.9607843, 0, 1, 1,
0.8891064, -0.1399652, -1.239269, 0.9686275, 0, 1, 1,
0.9009882, 0.0924744, 2.359646, 0.972549, 0, 1, 1,
0.902294, -0.03042904, -0.5194451, 0.9803922, 0, 1, 1,
0.9111594, -0.7264236, 3.155945, 0.9843137, 0, 1, 1,
0.9127632, -0.1167316, 1.182648, 0.9921569, 0, 1, 1,
0.9178363, 0.2425123, 1.822256, 0.9960784, 0, 1, 1,
0.9201112, -0.3636555, 1.405719, 1, 0, 0.9960784, 1,
0.9221667, -0.3235648, 0.281653, 1, 0, 0.9882353, 1,
0.9407361, 0.1441897, 1.09109, 1, 0, 0.9843137, 1,
0.9429524, 1.309933, 0.9371045, 1, 0, 0.9764706, 1,
0.9441977, 0.2069155, 0.009106942, 1, 0, 0.972549, 1,
0.9481789, 1.733043, 0.8616908, 1, 0, 0.9647059, 1,
0.949167, -0.2179025, 1.283809, 1, 0, 0.9607843, 1,
0.9509761, -0.1976468, 0.5682424, 1, 0, 0.9529412, 1,
0.9540259, -1.494935, 2.311432, 1, 0, 0.9490196, 1,
0.9593188, -0.1287993, 0.6807504, 1, 0, 0.9411765, 1,
0.9644423, 0.7281484, 2.487932, 1, 0, 0.9372549, 1,
0.964515, -0.2225109, 0.6902775, 1, 0, 0.9294118, 1,
0.9687329, -0.05427182, 2.412773, 1, 0, 0.9254902, 1,
0.9707608, -0.7202178, 1.807649, 1, 0, 0.9176471, 1,
0.9715305, 0.6546626, -1.232604, 1, 0, 0.9137255, 1,
0.9739291, 0.8160776, -1.295976, 1, 0, 0.9058824, 1,
0.9761948, -1.393001, 4.671063, 1, 0, 0.9019608, 1,
0.9774354, -1.407381, 1.078468, 1, 0, 0.8941177, 1,
0.9777529, 0.4992195, 1.503176, 1, 0, 0.8862745, 1,
0.9824753, -0.0759791, 0.74141, 1, 0, 0.8823529, 1,
0.9908749, -0.8186991, 3.219231, 1, 0, 0.8745098, 1,
0.9926944, 0.8967598, -0.6277443, 1, 0, 0.8705882, 1,
0.9970047, -0.7227434, 3.060608, 1, 0, 0.8627451, 1,
0.9984483, -0.04419305, 1.997153, 1, 0, 0.8588235, 1,
1.004548, 1.316127, 0.8795182, 1, 0, 0.8509804, 1,
1.006277, -1.215039, 1.780022, 1, 0, 0.8470588, 1,
1.007123, 0.2925968, 2.609009, 1, 0, 0.8392157, 1,
1.014623, 0.9478437, 0.5482817, 1, 0, 0.8352941, 1,
1.015464, -0.06622531, 2.880292, 1, 0, 0.827451, 1,
1.022028, -1.49702, 3.283413, 1, 0, 0.8235294, 1,
1.023619, -1.658543, 3.185545, 1, 0, 0.8156863, 1,
1.030449, -0.5066325, 0.400997, 1, 0, 0.8117647, 1,
1.030486, -0.1356227, 2.234221, 1, 0, 0.8039216, 1,
1.036855, 1.566467, 2.283332, 1, 0, 0.7960784, 1,
1.053289, -0.5515121, 2.091193, 1, 0, 0.7921569, 1,
1.055797, 1.780373, 0.06562707, 1, 0, 0.7843137, 1,
1.058808, -1.289812, 2.078543, 1, 0, 0.7803922, 1,
1.068369, -0.2787441, 1.774323, 1, 0, 0.772549, 1,
1.08237, 1.099177, 1.767273, 1, 0, 0.7686275, 1,
1.098607, 1.153965, 1.717176, 1, 0, 0.7607843, 1,
1.116931, -1.152433, 4.135889, 1, 0, 0.7568628, 1,
1.119646, 2.159584, 0.9342209, 1, 0, 0.7490196, 1,
1.121902, -0.03311067, 1.980308, 1, 0, 0.7450981, 1,
1.123155, 0.2452557, 0.8351331, 1, 0, 0.7372549, 1,
1.126603, 1.402769, 1.96901, 1, 0, 0.7333333, 1,
1.127713, -1.419912, 0.6934803, 1, 0, 0.7254902, 1,
1.131639, -2.871463, 3.778546, 1, 0, 0.7215686, 1,
1.134628, 1.859495, 0.9342138, 1, 0, 0.7137255, 1,
1.146024, 1.540231, 0.6229107, 1, 0, 0.7098039, 1,
1.149407, -1.801922, 2.452364, 1, 0, 0.7019608, 1,
1.155204, 0.9562986, 1.00123, 1, 0, 0.6941177, 1,
1.156745, 1.273434, 0.06514084, 1, 0, 0.6901961, 1,
1.161176, -0.6397964, 3.062996, 1, 0, 0.682353, 1,
1.168674, -1.250839, 3.665769, 1, 0, 0.6784314, 1,
1.171287, 1.339995, 2.635973, 1, 0, 0.6705883, 1,
1.177851, 1.038094, -0.2622672, 1, 0, 0.6666667, 1,
1.197691, 0.4876686, 1.914779, 1, 0, 0.6588235, 1,
1.207486, 2.185738, 2.295159, 1, 0, 0.654902, 1,
1.207876, -0.3460874, 0.9371102, 1, 0, 0.6470588, 1,
1.218074, -0.8764417, 2.608051, 1, 0, 0.6431373, 1,
1.218744, 1.069888, 1.420843, 1, 0, 0.6352941, 1,
1.226359, -0.456993, 2.548756, 1, 0, 0.6313726, 1,
1.233586, 1.061876, 1.166832, 1, 0, 0.6235294, 1,
1.235275, -0.7039706, 1.747434, 1, 0, 0.6196079, 1,
1.236942, -1.469181, 1.68787, 1, 0, 0.6117647, 1,
1.240277, -0.1683964, 0.9508322, 1, 0, 0.6078432, 1,
1.246369, 0.4535297, 1.960592, 1, 0, 0.6, 1,
1.25422, 0.6075187, 2.009757, 1, 0, 0.5921569, 1,
1.264595, 1.206897, 0.2426311, 1, 0, 0.5882353, 1,
1.269198, -0.3087187, 3.654868, 1, 0, 0.5803922, 1,
1.270579, 0.1354955, 2.051735, 1, 0, 0.5764706, 1,
1.270772, -0.02979231, 2.021135, 1, 0, 0.5686275, 1,
1.271829, 0.5351339, 1.934744, 1, 0, 0.5647059, 1,
1.278423, -0.1812777, 1.772121, 1, 0, 0.5568628, 1,
1.281391, 0.3156311, 1.757916, 1, 0, 0.5529412, 1,
1.281912, -1.8871, 3.086492, 1, 0, 0.5450981, 1,
1.303604, 0.2598177, 0.8695862, 1, 0, 0.5411765, 1,
1.306257, -1.460521, 1.897504, 1, 0, 0.5333334, 1,
1.30687, -1.54924, 1.87742, 1, 0, 0.5294118, 1,
1.308661, 1.262629, 0.7587124, 1, 0, 0.5215687, 1,
1.309162, 0.430849, 0.8979564, 1, 0, 0.5176471, 1,
1.309591, -0.2432684, 1.355206, 1, 0, 0.509804, 1,
1.312935, -1.720651, 1.736439, 1, 0, 0.5058824, 1,
1.319725, 0.6020297, -0.7469391, 1, 0, 0.4980392, 1,
1.335173, 0.5550737, 1.630582, 1, 0, 0.4901961, 1,
1.338498, -1.54175, 2.439046, 1, 0, 0.4862745, 1,
1.34974, 2.117182, 1.981835, 1, 0, 0.4784314, 1,
1.379913, 1.260309, -0.5216398, 1, 0, 0.4745098, 1,
1.383811, 0.5283256, -0.147754, 1, 0, 0.4666667, 1,
1.395065, 1.252787, 1.327538, 1, 0, 0.4627451, 1,
1.397058, 1.914214, -0.334761, 1, 0, 0.454902, 1,
1.397663, 0.758922, 0.7739991, 1, 0, 0.4509804, 1,
1.401396, 2.040734, 2.506172, 1, 0, 0.4431373, 1,
1.401845, -0.1521645, 1.452818, 1, 0, 0.4392157, 1,
1.405518, 0.9079877, 1.141468, 1, 0, 0.4313726, 1,
1.406219, 0.6212723, 0.4338258, 1, 0, 0.427451, 1,
1.421223, 0.5161902, 0.9260672, 1, 0, 0.4196078, 1,
1.429808, -0.4003999, 1.764738, 1, 0, 0.4156863, 1,
1.438646, -1.578689, 2.905305, 1, 0, 0.4078431, 1,
1.448181, -1.536716, 2.757551, 1, 0, 0.4039216, 1,
1.452949, -0.4472765, 1.887723, 1, 0, 0.3960784, 1,
1.456811, -1.00596, 1.659225, 1, 0, 0.3882353, 1,
1.457385, -0.03233453, 1.247107, 1, 0, 0.3843137, 1,
1.459807, 0.1536641, 0.09737196, 1, 0, 0.3764706, 1,
1.466928, -1.22833, 3.115775, 1, 0, 0.372549, 1,
1.468809, 1.066548, -0.6613807, 1, 0, 0.3647059, 1,
1.473161, -1.439959, 1.59172, 1, 0, 0.3607843, 1,
1.476573, -0.764706, 2.225968, 1, 0, 0.3529412, 1,
1.482913, -0.008155455, 3.32489, 1, 0, 0.3490196, 1,
1.498249, -1.82596, 2.286512, 1, 0, 0.3411765, 1,
1.502168, -1.112344, 2.800252, 1, 0, 0.3372549, 1,
1.510514, -0.7233281, 1.916778, 1, 0, 0.3294118, 1,
1.53402, -0.8894365, 3.350919, 1, 0, 0.3254902, 1,
1.536809, -0.7052632, 1.211111, 1, 0, 0.3176471, 1,
1.550539, 0.4694954, 2.434334, 1, 0, 0.3137255, 1,
1.575767, 1.011644, -0.2411869, 1, 0, 0.3058824, 1,
1.606386, -0.6941534, 1.249577, 1, 0, 0.2980392, 1,
1.63252, -0.8011979, 1.77114, 1, 0, 0.2941177, 1,
1.63333, -0.459482, 0.2199304, 1, 0, 0.2862745, 1,
1.637088, -1.00537, 2.091444, 1, 0, 0.282353, 1,
1.637889, 2.101809, 1.226887, 1, 0, 0.2745098, 1,
1.639573, 0.2974509, -0.437002, 1, 0, 0.2705882, 1,
1.646634, -1.550045, -0.4716617, 1, 0, 0.2627451, 1,
1.65091, 0.1027107, 2.091926, 1, 0, 0.2588235, 1,
1.668835, 1.911428, -0.767893, 1, 0, 0.2509804, 1,
1.740667, -0.7665526, 3.06601, 1, 0, 0.2470588, 1,
1.755185, -0.5868427, 2.329004, 1, 0, 0.2392157, 1,
1.763062, -0.08935345, 2.357084, 1, 0, 0.2352941, 1,
1.765442, -0.7444534, 3.205084, 1, 0, 0.227451, 1,
1.769251, 0.1175644, 0.09159393, 1, 0, 0.2235294, 1,
1.789745, -0.8188838, 1.536749, 1, 0, 0.2156863, 1,
1.790544, -0.0650076, 4.300808, 1, 0, 0.2117647, 1,
1.7991, -0.207658, -0.2113552, 1, 0, 0.2039216, 1,
1.805744, 1.578282, 1.05385, 1, 0, 0.1960784, 1,
1.80686, 0.412669, 1.19971, 1, 0, 0.1921569, 1,
1.80772, -0.4721564, 2.031777, 1, 0, 0.1843137, 1,
1.815359, 0.3183794, 0.09375045, 1, 0, 0.1803922, 1,
1.82456, -1.784632, 3.405586, 1, 0, 0.172549, 1,
1.841364, -0.5200753, 0.7166993, 1, 0, 0.1686275, 1,
1.876243, 0.8857617, 1.76869, 1, 0, 0.1607843, 1,
1.88962, -1.806823, 2.458109, 1, 0, 0.1568628, 1,
1.913611, -1.052689, 2.478875, 1, 0, 0.1490196, 1,
1.943376, 0.7202743, 0.7480829, 1, 0, 0.145098, 1,
2.028435, -0.5153405, 2.176095, 1, 0, 0.1372549, 1,
2.04235, 1.197934, 2.406169, 1, 0, 0.1333333, 1,
2.081362, -0.4201912, 2.572257, 1, 0, 0.1254902, 1,
2.10975, 0.8524682, 1.514706, 1, 0, 0.1215686, 1,
2.115829, -1.480849, 1.899895, 1, 0, 0.1137255, 1,
2.190789, -0.8777664, 2.084476, 1, 0, 0.1098039, 1,
2.201787, -0.6598911, 2.19805, 1, 0, 0.1019608, 1,
2.252859, -0.3040814, 1.276487, 1, 0, 0.09411765, 1,
2.260247, -1.329946, 2.271201, 1, 0, 0.09019608, 1,
2.286947, -0.3277769, 2.623091, 1, 0, 0.08235294, 1,
2.306502, 0.9111062, 1.29157, 1, 0, 0.07843138, 1,
2.381603, -1.272915, 0.7527404, 1, 0, 0.07058824, 1,
2.474782, -0.341215, 1.417502, 1, 0, 0.06666667, 1,
2.507518, 1.149992, 2.13944, 1, 0, 0.05882353, 1,
2.592, -0.8834451, 1.049287, 1, 0, 0.05490196, 1,
2.620183, -0.4718428, 2.960865, 1, 0, 0.04705882, 1,
2.783915, 1.006196, 2.347426, 1, 0, 0.04313726, 1,
2.823908, -0.3603658, 3.112815, 1, 0, 0.03529412, 1,
2.866467, 1.12928, 2.32042, 1, 0, 0.03137255, 1,
2.881437, -1.230515, 2.775727, 1, 0, 0.02352941, 1,
2.957727, 0.3713981, 2.058049, 1, 0, 0.01960784, 1,
3.077738, 1.60426, 2.364505, 1, 0, 0.01176471, 1,
3.484328, 0.7511788, 3.08765, 1, 0, 0.007843138, 1
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
0.1411065, -3.958237, -6.814573, 0, -0.5, 0.5, 0.5,
0.1411065, -3.958237, -6.814573, 1, -0.5, 0.5, 0.5,
0.1411065, -3.958237, -6.814573, 1, 1.5, 0.5, 0.5,
0.1411065, -3.958237, -6.814573, 0, 1.5, 0.5, 0.5
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
-4.335467, 0.174426, -6.814573, 0, -0.5, 0.5, 0.5,
-4.335467, 0.174426, -6.814573, 1, -0.5, 0.5, 0.5,
-4.335467, 0.174426, -6.814573, 1, 1.5, 0.5, 0.5,
-4.335467, 0.174426, -6.814573, 0, 1.5, 0.5, 0.5
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
-4.335467, -3.958237, 0.1665518, 0, -0.5, 0.5, 0.5,
-4.335467, -3.958237, 0.1665518, 1, -0.5, 0.5, 0.5,
-4.335467, -3.958237, 0.1665518, 1, 1.5, 0.5, 0.5,
-4.335467, -3.958237, 0.1665518, 0, 1.5, 0.5, 0.5
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
-3, -3.004545, -5.203544,
3, -3.004545, -5.203544,
-3, -3.004545, -5.203544,
-3, -3.163494, -5.472049,
-2, -3.004545, -5.203544,
-2, -3.163494, -5.472049,
-1, -3.004545, -5.203544,
-1, -3.163494, -5.472049,
0, -3.004545, -5.203544,
0, -3.163494, -5.472049,
1, -3.004545, -5.203544,
1, -3.163494, -5.472049,
2, -3.004545, -5.203544,
2, -3.163494, -5.472049,
3, -3.004545, -5.203544,
3, -3.163494, -5.472049
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
-3, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
-3, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
-3, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
-3, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
-2, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
-2, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
-2, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
-2, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
-1, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
-1, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
-1, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
-1, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
0, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
0, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
0, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
0, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
1, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
1, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
1, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
1, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
2, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
2, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
2, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
2, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5,
3, -3.481391, -6.009058, 0, -0.5, 0.5, 0.5,
3, -3.481391, -6.009058, 1, -0.5, 0.5, 0.5,
3, -3.481391, -6.009058, 1, 1.5, 0.5, 0.5,
3, -3.481391, -6.009058, 0, 1.5, 0.5, 0.5
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
-3.302412, -2, -5.203544,
-3.302412, 3, -5.203544,
-3.302412, -2, -5.203544,
-3.474588, -2, -5.472049,
-3.302412, -1, -5.203544,
-3.474588, -1, -5.472049,
-3.302412, 0, -5.203544,
-3.474588, 0, -5.472049,
-3.302412, 1, -5.203544,
-3.474588, 1, -5.472049,
-3.302412, 2, -5.203544,
-3.474588, 2, -5.472049,
-3.302412, 3, -5.203544,
-3.474588, 3, -5.472049
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
-3.81894, -2, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, -2, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, -2, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, -2, -6.009058, 0, 1.5, 0.5, 0.5,
-3.81894, -1, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, -1, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, -1, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, -1, -6.009058, 0, 1.5, 0.5, 0.5,
-3.81894, 0, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, 0, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, 0, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, 0, -6.009058, 0, 1.5, 0.5, 0.5,
-3.81894, 1, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, 1, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, 1, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, 1, -6.009058, 0, 1.5, 0.5, 0.5,
-3.81894, 2, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, 2, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, 2, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, 2, -6.009058, 0, 1.5, 0.5, 0.5,
-3.81894, 3, -6.009058, 0, -0.5, 0.5, 0.5,
-3.81894, 3, -6.009058, 1, -0.5, 0.5, 0.5,
-3.81894, 3, -6.009058, 1, 1.5, 0.5, 0.5,
-3.81894, 3, -6.009058, 0, 1.5, 0.5, 0.5
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
-3.302412, -3.004545, -4,
-3.302412, -3.004545, 4,
-3.302412, -3.004545, -4,
-3.474588, -3.163494, -4,
-3.302412, -3.004545, -2,
-3.474588, -3.163494, -2,
-3.302412, -3.004545, 0,
-3.474588, -3.163494, 0,
-3.302412, -3.004545, 2,
-3.474588, -3.163494, 2,
-3.302412, -3.004545, 4,
-3.474588, -3.163494, 4
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
-3.81894, -3.481391, -4, 0, -0.5, 0.5, 0.5,
-3.81894, -3.481391, -4, 1, -0.5, 0.5, 0.5,
-3.81894, -3.481391, -4, 1, 1.5, 0.5, 0.5,
-3.81894, -3.481391, -4, 0, 1.5, 0.5, 0.5,
-3.81894, -3.481391, -2, 0, -0.5, 0.5, 0.5,
-3.81894, -3.481391, -2, 1, -0.5, 0.5, 0.5,
-3.81894, -3.481391, -2, 1, 1.5, 0.5, 0.5,
-3.81894, -3.481391, -2, 0, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 0, 0, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 0, 1, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 0, 1, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 0, 0, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 2, 0, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 2, 1, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 2, 1, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 2, 0, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 4, 0, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 4, 1, -0.5, 0.5, 0.5,
-3.81894, -3.481391, 4, 1, 1.5, 0.5, 0.5,
-3.81894, -3.481391, 4, 0, 1.5, 0.5, 0.5
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
-3.302412, -3.004545, -5.203544,
-3.302412, 3.353397, -5.203544,
-3.302412, -3.004545, 5.536648,
-3.302412, 3.353397, 5.536648,
-3.302412, -3.004545, -5.203544,
-3.302412, -3.004545, 5.536648,
-3.302412, 3.353397, -5.203544,
-3.302412, 3.353397, 5.536648,
-3.302412, -3.004545, -5.203544,
3.584625, -3.004545, -5.203544,
-3.302412, -3.004545, 5.536648,
3.584625, -3.004545, 5.536648,
-3.302412, 3.353397, -5.203544,
3.584625, 3.353397, -5.203544,
-3.302412, 3.353397, 5.536648,
3.584625, 3.353397, 5.536648,
3.584625, -3.004545, -5.203544,
3.584625, 3.353397, -5.203544,
3.584625, -3.004545, 5.536648,
3.584625, 3.353397, 5.536648,
3.584625, -3.004545, -5.203544,
3.584625, -3.004545, 5.536648,
3.584625, 3.353397, -5.203544,
3.584625, 3.353397, 5.536648
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
var radius = 7.611919;
var distance = 33.86629;
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
mvMatrix.translate( -0.1411065, -0.174426, -0.1665518 );
mvMatrix.scale( 1.195021, 1.294468, 0.7662951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86629);
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
4-dichloroacetyl-1-o<-read.table("4-dichloroacetyl-1-o.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.202115, -0.1337945, -1.391039, 0, 0, 1, 1, 1,
-2.790603, -0.7189471, -1.060621, 1, 0, 0, 1, 1,
-2.682451, -0.3182791, -3.009117, 1, 0, 0, 1, 1,
-2.494289, 1.881848, -0.6747929, 1, 0, 0, 1, 1,
-2.418834, -0.06657469, -2.087776, 1, 0, 0, 1, 1,
-2.365179, 1.57719, -1.854354, 1, 0, 0, 1, 1,
-2.340778, 0.4803655, -1.824407, 0, 0, 0, 1, 1,
-2.303626, -0.3208936, -1.005769, 0, 0, 0, 1, 1,
-2.297199, 0.7378088, 0.2741996, 0, 0, 0, 1, 1,
-2.287616, 0.1710092, -2.615434, 0, 0, 0, 1, 1,
-2.267973, -0.08814261, -2.757653, 0, 0, 0, 1, 1,
-2.267658, -0.425576, -0.7802711, 0, 0, 0, 1, 1,
-2.256438, -1.255637, -0.7409027, 0, 0, 0, 1, 1,
-2.21613, -0.4495957, -0.7030103, 1, 1, 1, 1, 1,
-2.159345, 0.2101988, -0.6596577, 1, 1, 1, 1, 1,
-2.151736, 0.1562742, -1.427141, 1, 1, 1, 1, 1,
-2.149901, 0.7273484, 0.6361274, 1, 1, 1, 1, 1,
-2.142006, 0.4288828, -0.6664767, 1, 1, 1, 1, 1,
-2.121087, -1.037342, -1.101587, 1, 1, 1, 1, 1,
-2.060358, 0.0334774, -0.9601329, 1, 1, 1, 1, 1,
-2.023007, -0.5484168, -1.656796, 1, 1, 1, 1, 1,
-2.012976, 0.6131167, -1.239253, 1, 1, 1, 1, 1,
-1.91626, -0.122771, -2.673538, 1, 1, 1, 1, 1,
-1.903631, 0.2918731, -0.6110213, 1, 1, 1, 1, 1,
-1.885643, 0.9931672, -1.192642, 1, 1, 1, 1, 1,
-1.875547, 0.5759923, -0.3137985, 1, 1, 1, 1, 1,
-1.868558, 0.6285586, -1.096909, 1, 1, 1, 1, 1,
-1.865829, -0.05377895, -1.243716, 1, 1, 1, 1, 1,
-1.862031, 0.4017057, -0.9876438, 0, 0, 1, 1, 1,
-1.861557, -1.277137, -3.168809, 1, 0, 0, 1, 1,
-1.859954, 1.078365, -1.076416, 1, 0, 0, 1, 1,
-1.846453, 0.2812742, -2.941025, 1, 0, 0, 1, 1,
-1.844293, 0.4742727, -1.469398, 1, 0, 0, 1, 1,
-1.84352, 0.659586, -1.736541, 1, 0, 0, 1, 1,
-1.823435, -0.1391457, -0.5702916, 0, 0, 0, 1, 1,
-1.804751, 0.450978, -2.543162, 0, 0, 0, 1, 1,
-1.801655, -0.1201776, -2.414269, 0, 0, 0, 1, 1,
-1.800007, 0.2012212, -1.621101, 0, 0, 0, 1, 1,
-1.769964, -0.1482481, -1.230611, 0, 0, 0, 1, 1,
-1.766213, -1.164258, -2.076747, 0, 0, 0, 1, 1,
-1.758608, 0.9800895, -0.8306681, 0, 0, 0, 1, 1,
-1.733378, -1.140612, -1.824913, 1, 1, 1, 1, 1,
-1.726925, -0.4778324, -0.4980745, 1, 1, 1, 1, 1,
-1.720681, 0.001972697, -1.134146, 1, 1, 1, 1, 1,
-1.718654, 0.6262001, -1.423328, 1, 1, 1, 1, 1,
-1.714884, -1.325103, -3.732052, 1, 1, 1, 1, 1,
-1.705075, 1.30375, -0.008909227, 1, 1, 1, 1, 1,
-1.688702, 0.4332348, -1.229206, 1, 1, 1, 1, 1,
-1.658444, 1.094137, -2.285381, 1, 1, 1, 1, 1,
-1.602276, 1.524436, -1.109361, 1, 1, 1, 1, 1,
-1.599812, 1.159218, 0.03779842, 1, 1, 1, 1, 1,
-1.596756, -1.076547, -3.165346, 1, 1, 1, 1, 1,
-1.582927, -1.075346, -1.837278, 1, 1, 1, 1, 1,
-1.579455, 0.3888468, -3.143597, 1, 1, 1, 1, 1,
-1.57823, 2.175735, -0.1202809, 1, 1, 1, 1, 1,
-1.570677, -0.3504941, -2.301502, 1, 1, 1, 1, 1,
-1.555137, -1.31463, -0.9313458, 0, 0, 1, 1, 1,
-1.535604, 1.427065, -1.570278, 1, 0, 0, 1, 1,
-1.532607, 1.088834, -1.058854, 1, 0, 0, 1, 1,
-1.530005, -0.9580315, -1.363099, 1, 0, 0, 1, 1,
-1.516146, 0.2940011, -1.872356, 1, 0, 0, 1, 1,
-1.50113, -0.09552714, -1.604495, 1, 0, 0, 1, 1,
-1.490919, 0.08154415, 0.1120176, 0, 0, 0, 1, 1,
-1.478179, 1.112877, -2.193238, 0, 0, 0, 1, 1,
-1.47455, -0.05526196, -3.557992, 0, 0, 0, 1, 1,
-1.456761, 0.3029162, -0.6757027, 0, 0, 0, 1, 1,
-1.439578, -2.899153, -2.389164, 0, 0, 0, 1, 1,
-1.438557, 1.059253, 0.3232643, 0, 0, 0, 1, 1,
-1.43688, -1.443045, -2.229919, 0, 0, 0, 1, 1,
-1.436662, 1.293598, -0.346862, 1, 1, 1, 1, 1,
-1.435693, 0.688709, -1.952176, 1, 1, 1, 1, 1,
-1.417688, -0.02410459, -1.228858, 1, 1, 1, 1, 1,
-1.415128, -0.2468461, -1.348899, 1, 1, 1, 1, 1,
-1.402834, -0.07981463, -2.345264, 1, 1, 1, 1, 1,
-1.40123, -0.1030914, -0.5862383, 1, 1, 1, 1, 1,
-1.394591, 1.817863, -0.1032565, 1, 1, 1, 1, 1,
-1.389038, -1.085974, -2.249041, 1, 1, 1, 1, 1,
-1.388851, -0.05573998, -2.879738, 1, 1, 1, 1, 1,
-1.381429, 0.9737613, -1.263342, 1, 1, 1, 1, 1,
-1.378061, -0.2790253, -0.3689559, 1, 1, 1, 1, 1,
-1.375396, 1.006925, -1.939395, 1, 1, 1, 1, 1,
-1.370621, 0.1360288, -2.014294, 1, 1, 1, 1, 1,
-1.370292, 0.05788013, -3.613052, 1, 1, 1, 1, 1,
-1.366733, 0.6636301, -1.864597, 1, 1, 1, 1, 1,
-1.365502, -0.4764815, -0.8027678, 0, 0, 1, 1, 1,
-1.36434, -1.429619, -3.359475, 1, 0, 0, 1, 1,
-1.363775, -0.3976337, -1.754125, 1, 0, 0, 1, 1,
-1.361812, -1.466906, -0.6916304, 1, 0, 0, 1, 1,
-1.357977, 0.5865268, -1.46893, 1, 0, 0, 1, 1,
-1.357926, -0.1182995, -1.199508, 1, 0, 0, 1, 1,
-1.357503, -0.1446767, -1.861921, 0, 0, 0, 1, 1,
-1.340867, 0.2311977, -1.79192, 0, 0, 0, 1, 1,
-1.334306, -0.5309754, -3.259628, 0, 0, 0, 1, 1,
-1.329184, 0.1096245, -0.5116741, 0, 0, 0, 1, 1,
-1.312929, -0.9840955, -1.689141, 0, 0, 0, 1, 1,
-1.307222, 0.4667537, 0.2523575, 0, 0, 0, 1, 1,
-1.30188, 0.3974983, -0.7123013, 0, 0, 0, 1, 1,
-1.299368, -1.106899, -2.281957, 1, 1, 1, 1, 1,
-1.295624, 0.2346238, -3.420755, 1, 1, 1, 1, 1,
-1.29235, 1.331544, -0.1358711, 1, 1, 1, 1, 1,
-1.288427, -0.9180133, -1.35318, 1, 1, 1, 1, 1,
-1.283608, 0.6048175, -1.39385, 1, 1, 1, 1, 1,
-1.282009, -0.480482, -3.803604, 1, 1, 1, 1, 1,
-1.272563, -1.477242, -2.930407, 1, 1, 1, 1, 1,
-1.261951, -0.0720112, -0.7184359, 1, 1, 1, 1, 1,
-1.261378, -0.5062866, -2.019182, 1, 1, 1, 1, 1,
-1.258679, 0.118795, -1.416567, 1, 1, 1, 1, 1,
-1.235316, -0.9234467, -1.68522, 1, 1, 1, 1, 1,
-1.233174, -0.1000404, -0.8299304, 1, 1, 1, 1, 1,
-1.226917, -0.124982, -2.900187, 1, 1, 1, 1, 1,
-1.226064, 1.008605, -1.067847, 1, 1, 1, 1, 1,
-1.207976, 0.005479851, -0.1392573, 1, 1, 1, 1, 1,
-1.207711, 1.805467, -1.011717, 0, 0, 1, 1, 1,
-1.204115, 0.05277142, -1.230173, 1, 0, 0, 1, 1,
-1.190055, -0.4842314, -2.39, 1, 0, 0, 1, 1,
-1.181914, -0.0682491, -0.523064, 1, 0, 0, 1, 1,
-1.17737, 0.2827386, 0.8172687, 1, 0, 0, 1, 1,
-1.176016, -0.2351355, -0.5654802, 1, 0, 0, 1, 1,
-1.173165, 1.233469, -1.720357, 0, 0, 0, 1, 1,
-1.166266, -1.294833, -2.550863, 0, 0, 0, 1, 1,
-1.165333, 0.5359828, -3.376258, 0, 0, 0, 1, 1,
-1.153049, 0.4903469, 0.553463, 0, 0, 0, 1, 1,
-1.151456, -0.5821812, -4.232807, 0, 0, 0, 1, 1,
-1.150503, -0.9126069, -3.408897, 0, 0, 0, 1, 1,
-1.150061, 1.486163, -1.187452, 0, 0, 0, 1, 1,
-1.147894, -1.018646, -2.464222, 1, 1, 1, 1, 1,
-1.145568, -0.1018378, -3.055738, 1, 1, 1, 1, 1,
-1.141448, -0.4166676, -1.840037, 1, 1, 1, 1, 1,
-1.132929, 0.1767834, -0.1149587, 1, 1, 1, 1, 1,
-1.132656, 0.3594017, -2.252744, 1, 1, 1, 1, 1,
-1.129519, -2.84713, -2.678556, 1, 1, 1, 1, 1,
-1.127991, 0.2724151, -0.5969751, 1, 1, 1, 1, 1,
-1.125093, -1.280527, -2.150669, 1, 1, 1, 1, 1,
-1.118983, 0.3462467, -0.4095145, 1, 1, 1, 1, 1,
-1.118066, 0.3237529, -2.764951, 1, 1, 1, 1, 1,
-1.116991, 1.020508, -2.515304, 1, 1, 1, 1, 1,
-1.112529, -2.273714, -4.258811, 1, 1, 1, 1, 1,
-1.107607, 0.1725778, -0.296414, 1, 1, 1, 1, 1,
-1.096411, 0.4797048, -0.3751049, 1, 1, 1, 1, 1,
-1.084936, 0.0471296, -2.891266, 1, 1, 1, 1, 1,
-1.082995, -0.6228305, -0.4334627, 0, 0, 1, 1, 1,
-1.080589, 1.199397, -0.7709158, 1, 0, 0, 1, 1,
-1.060443, -0.2318298, -1.014732, 1, 0, 0, 1, 1,
-1.059228, 1.675554, -1.59503, 1, 0, 0, 1, 1,
-1.045624, 0.4866545, -1.449036, 1, 0, 0, 1, 1,
-1.044682, -1.938828, -3.870042, 1, 0, 0, 1, 1,
-1.041252, -1.719369, -3.643176, 0, 0, 0, 1, 1,
-1.032166, 0.2080183, 0.4756344, 0, 0, 0, 1, 1,
-1.028655, -0.159969, -0.894489, 0, 0, 0, 1, 1,
-1.0272, 0.02750541, -0.7956716, 0, 0, 0, 1, 1,
-1.022593, 1.840492, -0.5149471, 0, 0, 0, 1, 1,
-1.020244, 0.9909933, 0.4285109, 0, 0, 0, 1, 1,
-1.018068, 0.1656413, -0.4772428, 0, 0, 0, 1, 1,
-1.013562, 0.06944855, -2.354525, 1, 1, 1, 1, 1,
-1.013283, 1.020765, -1.129969, 1, 1, 1, 1, 1,
-1.011286, 0.216185, -0.2346356, 1, 1, 1, 1, 1,
-1.007151, -0.4591845, -2.325452, 1, 1, 1, 1, 1,
-1.006973, 0.1179773, -1.049652, 1, 1, 1, 1, 1,
-1.006649, -0.6618403, -1.694733, 1, 1, 1, 1, 1,
-1.004826, -0.6486369, -3.614725, 1, 1, 1, 1, 1,
-1.000389, -0.7051238, -2.945371, 1, 1, 1, 1, 1,
-0.9980366, -1.493158, -3.009648, 1, 1, 1, 1, 1,
-0.9942196, 0.2207322, 0.5899956, 1, 1, 1, 1, 1,
-0.9941399, 0.7436755, -1.189373, 1, 1, 1, 1, 1,
-0.990981, 0.6219867, -2.148767, 1, 1, 1, 1, 1,
-0.9879452, -0.4816775, -2.758004, 1, 1, 1, 1, 1,
-0.9863072, -1.136596, -2.97879, 1, 1, 1, 1, 1,
-0.9784073, -0.1427919, -1.897254, 1, 1, 1, 1, 1,
-0.9620224, -0.4754399, -1.830614, 0, 0, 1, 1, 1,
-0.9604558, -0.1178416, -3.743756, 1, 0, 0, 1, 1,
-0.9577395, -0.3851868, -2.393831, 1, 0, 0, 1, 1,
-0.9562911, 0.1099279, -0.9379267, 1, 0, 0, 1, 1,
-0.9499782, -0.2835684, -1.602619, 1, 0, 0, 1, 1,
-0.9394664, 0.8769827, -0.0469116, 1, 0, 0, 1, 1,
-0.9327451, 0.6575859, -0.8429501, 0, 0, 0, 1, 1,
-0.9294934, -0.2014771, -2.538941, 0, 0, 0, 1, 1,
-0.9262496, -1.338636, -2.819427, 0, 0, 0, 1, 1,
-0.9253516, 0.2109889, 0.0984028, 0, 0, 0, 1, 1,
-0.9229904, -1.575962, -3.480508, 0, 0, 0, 1, 1,
-0.9187046, -1.345177, -1.560387, 0, 0, 0, 1, 1,
-0.9186612, 1.054406, 0.09789402, 0, 0, 0, 1, 1,
-0.9155458, 1.837372, 0.555059, 1, 1, 1, 1, 1,
-0.9097711, -0.8291196, -2.737307, 1, 1, 1, 1, 1,
-0.9094654, 0.4993065, -0.192515, 1, 1, 1, 1, 1,
-0.9040039, -0.4799862, -1.285947, 1, 1, 1, 1, 1,
-0.9031776, -0.6377563, -1.990053, 1, 1, 1, 1, 1,
-0.9005005, -1.400762, -2.930057, 1, 1, 1, 1, 1,
-0.8972011, -0.8895586, -1.037862, 1, 1, 1, 1, 1,
-0.8961631, -1.378399, -3.533348, 1, 1, 1, 1, 1,
-0.8958681, -0.1789783, -2.779146, 1, 1, 1, 1, 1,
-0.8909687, 0.5902729, -2.12571, 1, 1, 1, 1, 1,
-0.8903821, 0.1330747, -0.7718981, 1, 1, 1, 1, 1,
-0.8801982, 0.4716369, -0.1411878, 1, 1, 1, 1, 1,
-0.8786275, -0.6349794, -1.820157, 1, 1, 1, 1, 1,
-0.8771156, 0.8646702, -1.173494, 1, 1, 1, 1, 1,
-0.8695561, -0.4328824, -1.768004, 1, 1, 1, 1, 1,
-0.8644012, -0.2949147, -0.5480576, 0, 0, 1, 1, 1,
-0.8625604, -0.2020791, -0.7275881, 1, 0, 0, 1, 1,
-0.8617608, 0.4253384, -1.08254, 1, 0, 0, 1, 1,
-0.8612778, -0.143411, -2.522105, 1, 0, 0, 1, 1,
-0.8405197, -1.207699, -0.109987, 1, 0, 0, 1, 1,
-0.8401259, -0.9625348, -3.517571, 1, 0, 0, 1, 1,
-0.8363605, -0.02820492, -1.850055, 0, 0, 0, 1, 1,
-0.8332245, -0.3211303, -0.3838938, 0, 0, 0, 1, 1,
-0.8321682, -0.4104797, -2.629549, 0, 0, 0, 1, 1,
-0.8264008, 0.5633057, -0.715273, 0, 0, 0, 1, 1,
-0.8230111, 0.1294472, -0.498714, 0, 0, 0, 1, 1,
-0.8210129, -0.6070116, -1.025102, 0, 0, 0, 1, 1,
-0.8200648, 1.33205, -1.394894, 0, 0, 0, 1, 1,
-0.8196999, -1.085589, -2.187728, 1, 1, 1, 1, 1,
-0.8133885, 1.033802, -0.3873571, 1, 1, 1, 1, 1,
-0.811466, -1.117034, -3.676334, 1, 1, 1, 1, 1,
-0.810762, 0.1835857, -2.984086, 1, 1, 1, 1, 1,
-0.8091893, -1.205249, -1.050515, 1, 1, 1, 1, 1,
-0.806767, 1.475589, -1.203892, 1, 1, 1, 1, 1,
-0.8027993, -1.108444, -2.964086, 1, 1, 1, 1, 1,
-0.7989137, -1.411093, -2.346304, 1, 1, 1, 1, 1,
-0.7954267, 0.4008661, -1.901602, 1, 1, 1, 1, 1,
-0.7942217, 1.031155, 0.2431381, 1, 1, 1, 1, 1,
-0.7901599, 1.418042, -0.1894474, 1, 1, 1, 1, 1,
-0.7891512, 2.000534, -0.7929174, 1, 1, 1, 1, 1,
-0.7883134, -0.9178926, -0.8634382, 1, 1, 1, 1, 1,
-0.7862584, 0.2383488, -1.971629, 1, 1, 1, 1, 1,
-0.784729, -0.1822588, -2.436231, 1, 1, 1, 1, 1,
-0.7846213, 0.7193915, -2.7129, 0, 0, 1, 1, 1,
-0.7814004, -0.3715508, -0.934144, 1, 0, 0, 1, 1,
-0.7786874, 0.6188514, -0.2643599, 1, 0, 0, 1, 1,
-0.774553, -0.04939039, -1.346646, 1, 0, 0, 1, 1,
-0.7701309, 1.151245, -1.02717, 1, 0, 0, 1, 1,
-0.76767, 0.7770157, 0.02390716, 1, 0, 0, 1, 1,
-0.7659757, 0.2651416, -1.387035, 0, 0, 0, 1, 1,
-0.764906, 0.3557105, 0.01549356, 0, 0, 0, 1, 1,
-0.7641882, 0.03945997, -2.73285, 0, 0, 0, 1, 1,
-0.7634233, 0.07879967, -2.810341, 0, 0, 0, 1, 1,
-0.7627496, -0.994136, -3.274084, 0, 0, 0, 1, 1,
-0.7619557, 0.8785195, 1.302947, 0, 0, 0, 1, 1,
-0.7606843, -0.3681948, -1.432394, 0, 0, 0, 1, 1,
-0.7465287, 1.190136, -0.1978063, 1, 1, 1, 1, 1,
-0.7459754, -2.480402, -3.13283, 1, 1, 1, 1, 1,
-0.7410498, 0.7896646, -1.066736, 1, 1, 1, 1, 1,
-0.7396464, -0.8229035, -3.723205, 1, 1, 1, 1, 1,
-0.7387875, 0.1380726, -1.24662, 1, 1, 1, 1, 1,
-0.7337658, -0.7979744, -0.2890501, 1, 1, 1, 1, 1,
-0.7330426, 1.278167, -1.134701, 1, 1, 1, 1, 1,
-0.7266722, 0.2329662, -0.4829823, 1, 1, 1, 1, 1,
-0.7209668, 1.712196, -1.023526, 1, 1, 1, 1, 1,
-0.7196097, 1.051765, -1.397898, 1, 1, 1, 1, 1,
-0.7184279, -0.4344482, -1.41977, 1, 1, 1, 1, 1,
-0.715569, 0.9627671, -1.21247, 1, 1, 1, 1, 1,
-0.7153577, -1.222845, -3.748555, 1, 1, 1, 1, 1,
-0.7096603, -0.1534643, -2.366759, 1, 1, 1, 1, 1,
-0.6868799, 0.4205168, 0.1336569, 1, 1, 1, 1, 1,
-0.6841332, 0.1069222, -0.7496541, 0, 0, 1, 1, 1,
-0.6832259, -1.126928, -2.272439, 1, 0, 0, 1, 1,
-0.6740038, -0.06173065, -2.405948, 1, 0, 0, 1, 1,
-0.6734153, 1.789953, -0.3177462, 1, 0, 0, 1, 1,
-0.6716804, -0.605092, -2.498091, 1, 0, 0, 1, 1,
-0.6644179, 0.06601281, -0.7840503, 1, 0, 0, 1, 1,
-0.6603593, -1.258821, -1.14888, 0, 0, 0, 1, 1,
-0.6568195, -0.6014141, -3.614221, 0, 0, 0, 1, 1,
-0.6568012, -1.761127, -4.141294, 0, 0, 0, 1, 1,
-0.6545544, -0.6305493, -3.006143, 0, 0, 0, 1, 1,
-0.6461834, 1.445219, -2.878986, 0, 0, 0, 1, 1,
-0.6406348, -0.0822389, -1.076135, 0, 0, 0, 1, 1,
-0.6404895, 1.372104, -1.392458, 0, 0, 0, 1, 1,
-0.6403912, -1.265078, -1.449483, 1, 1, 1, 1, 1,
-0.6401061, -0.5765669, -2.180923, 1, 1, 1, 1, 1,
-0.6398202, 3.260806, -0.1004277, 1, 1, 1, 1, 1,
-0.6370968, -1.441512, -3.155066, 1, 1, 1, 1, 1,
-0.6318305, -0.06684115, -3.260865, 1, 1, 1, 1, 1,
-0.6307769, -1.24516, -1.474319, 1, 1, 1, 1, 1,
-0.6169767, -1.544718, -3.266195, 1, 1, 1, 1, 1,
-0.6142565, -0.2166002, -1.011676, 1, 1, 1, 1, 1,
-0.6108347, -1.883143, -0.7220066, 1, 1, 1, 1, 1,
-0.6066544, 1.229699, -0.7986423, 1, 1, 1, 1, 1,
-0.603803, 0.6562529, -3.387172, 1, 1, 1, 1, 1,
-0.6032777, -0.3965056, -1.871745, 1, 1, 1, 1, 1,
-0.6025304, -1.705343, -2.387529, 1, 1, 1, 1, 1,
-0.600537, -2.033237, -2.228687, 1, 1, 1, 1, 1,
-0.5981352, 1.011131, -1.299025, 1, 1, 1, 1, 1,
-0.5980662, 0.4984179, -0.6442099, 0, 0, 1, 1, 1,
-0.5889143, -1.61307, -3.823884, 1, 0, 0, 1, 1,
-0.5872292, -0.6629824, -2.439069, 1, 0, 0, 1, 1,
-0.5830704, -0.1568902, -1.549903, 1, 0, 0, 1, 1,
-0.5830054, -0.1475529, -2.981867, 1, 0, 0, 1, 1,
-0.581108, 1.014098, -2.465027, 1, 0, 0, 1, 1,
-0.5779474, 0.4096556, 0.4274953, 0, 0, 0, 1, 1,
-0.5751128, -1.022047, -1.977213, 0, 0, 0, 1, 1,
-0.5702146, 1.159553, -1.617815, 0, 0, 0, 1, 1,
-0.5671574, -0.1925075, -1.507969, 0, 0, 0, 1, 1,
-0.5642703, 1.66292, 0.9866714, 0, 0, 0, 1, 1,
-0.5631591, 1.15264, -1.575525, 0, 0, 0, 1, 1,
-0.5626377, -0.1346284, -1.02264, 0, 0, 0, 1, 1,
-0.5593259, 1.171112, -1.420619, 1, 1, 1, 1, 1,
-0.558517, 0.8660367, -0.4858791, 1, 1, 1, 1, 1,
-0.5556689, 0.2984207, -0.5949314, 1, 1, 1, 1, 1,
-0.5484444, 0.3548576, -0.8354784, 1, 1, 1, 1, 1,
-0.5455027, 0.8167188, -0.4155041, 1, 1, 1, 1, 1,
-0.5449341, 0.7918474, -0.6667182, 1, 1, 1, 1, 1,
-0.5399055, 1.665259, 0.382257, 1, 1, 1, 1, 1,
-0.5397367, -1.399989, -2.788177, 1, 1, 1, 1, 1,
-0.5394433, 1.036462, -2.222091, 1, 1, 1, 1, 1,
-0.5326898, -0.1806531, -4.104057, 1, 1, 1, 1, 1,
-0.5299606, -0.1770564, -3.16199, 1, 1, 1, 1, 1,
-0.5243165, 0.2479555, -3.256785, 1, 1, 1, 1, 1,
-0.5219122, 0.9413621, -0.2104244, 1, 1, 1, 1, 1,
-0.5183981, 0.2755682, -3.318577, 1, 1, 1, 1, 1,
-0.5081677, 0.3251668, -0.4440736, 1, 1, 1, 1, 1,
-0.5059723, -1.12285, -2.156265, 0, 0, 1, 1, 1,
-0.503744, 1.019133, -0.4644284, 1, 0, 0, 1, 1,
-0.5022795, -1.112114, -1.3329, 1, 0, 0, 1, 1,
-0.5013242, -0.1696003, -1.119852, 1, 0, 0, 1, 1,
-0.4984671, 0.7734021, 1.267924, 1, 0, 0, 1, 1,
-0.4982741, 0.5730271, -0.01445194, 1, 0, 0, 1, 1,
-0.4960178, 0.9450776, -2.293828, 0, 0, 0, 1, 1,
-0.4950058, -1.61664, -3.238417, 0, 0, 0, 1, 1,
-0.4909042, -0.02920957, 0.8704613, 0, 0, 0, 1, 1,
-0.490581, 1.00316, 0.4599867, 0, 0, 0, 1, 1,
-0.490328, -0.5323677, -2.159941, 0, 0, 0, 1, 1,
-0.4856534, -0.3248555, -3.564893, 0, 0, 0, 1, 1,
-0.4802044, -0.8467593, -3.149757, 0, 0, 0, 1, 1,
-0.4791342, -0.836652, -2.030163, 1, 1, 1, 1, 1,
-0.4782273, 0.6931372, 1.507999, 1, 1, 1, 1, 1,
-0.4767137, -1.074247, -2.382837, 1, 1, 1, 1, 1,
-0.4724068, -1.387451, -1.427129, 1, 1, 1, 1, 1,
-0.4654517, 1.724227, 0.7758268, 1, 1, 1, 1, 1,
-0.4651492, -0.3386537, -1.763288, 1, 1, 1, 1, 1,
-0.4645871, 1.952524, -0.1024861, 1, 1, 1, 1, 1,
-0.4574206, 0.8843234, -2.402281, 1, 1, 1, 1, 1,
-0.4558824, -2.726565, -1.739513, 1, 1, 1, 1, 1,
-0.4538696, 0.3515983, -0.8211815, 1, 1, 1, 1, 1,
-0.4475525, 0.8514735, -1.053529, 1, 1, 1, 1, 1,
-0.4423139, 0.5687795, -0.4949349, 1, 1, 1, 1, 1,
-0.4402792, 0.9605557, -0.3483445, 1, 1, 1, 1, 1,
-0.4396703, -1.334305, -2.02349, 1, 1, 1, 1, 1,
-0.4386304, -1.624554, -2.220258, 1, 1, 1, 1, 1,
-0.4359594, 0.8434736, 0.2396425, 0, 0, 1, 1, 1,
-0.4320387, -1.503092, -2.660956, 1, 0, 0, 1, 1,
-0.431344, -0.1586816, -2.83814, 1, 0, 0, 1, 1,
-0.4274578, -0.3081273, -1.640089, 1, 0, 0, 1, 1,
-0.4234891, -0.02941344, -0.5868971, 1, 0, 0, 1, 1,
-0.4174039, 1.242846, -0.4227272, 1, 0, 0, 1, 1,
-0.4167086, -1.233284, -2.857924, 0, 0, 0, 1, 1,
-0.4129061, -0.8458881, -0.4765276, 0, 0, 0, 1, 1,
-0.410499, -0.7565687, -4.436461, 0, 0, 0, 1, 1,
-0.4012436, 0.2683261, -1.653109, 0, 0, 0, 1, 1,
-0.4001045, 0.1319275, -0.9370279, 0, 0, 0, 1, 1,
-0.3999821, -0.7106754, -1.961368, 0, 0, 0, 1, 1,
-0.3860582, -0.1467203, -2.762694, 0, 0, 0, 1, 1,
-0.3858353, 0.7839364, -0.8161903, 1, 1, 1, 1, 1,
-0.3811794, -1.280002, -2.611995, 1, 1, 1, 1, 1,
-0.3784001, -0.9742761, -3.072814, 1, 1, 1, 1, 1,
-0.3767661, -0.9291415, -1.746256, 1, 1, 1, 1, 1,
-0.3750344, 0.7718065, 1.781946, 1, 1, 1, 1, 1,
-0.3737023, -2.193656, -1.479325, 1, 1, 1, 1, 1,
-0.3733851, 0.0843882, -0.9263354, 1, 1, 1, 1, 1,
-0.3676326, -0.8650941, -0.8655725, 1, 1, 1, 1, 1,
-0.365139, -0.04041867, -2.17753, 1, 1, 1, 1, 1,
-0.3642888, -0.5097215, -1.572178, 1, 1, 1, 1, 1,
-0.3569887, 1.838545, 1.086138, 1, 1, 1, 1, 1,
-0.3569063, -0.4937837, -2.56532, 1, 1, 1, 1, 1,
-0.3541131, 0.9827718, -1.566278, 1, 1, 1, 1, 1,
-0.3522963, -0.04109848, -2.255131, 1, 1, 1, 1, 1,
-0.3478675, 1.537374, 0.9839419, 1, 1, 1, 1, 1,
-0.3460743, 0.4817418, 0.08225235, 0, 0, 1, 1, 1,
-0.3452906, 0.424547, -0.3642711, 1, 0, 0, 1, 1,
-0.3418201, -1.651031, -2.742512, 1, 0, 0, 1, 1,
-0.3413571, 0.7562827, -0.1824685, 1, 0, 0, 1, 1,
-0.3391554, 0.8968402, -1.447444, 1, 0, 0, 1, 1,
-0.3350055, -1.20945, -1.946949, 1, 0, 0, 1, 1,
-0.3326009, 0.7730997, 0.2285048, 0, 0, 0, 1, 1,
-0.3285209, -0.2969331, -2.398412, 0, 0, 0, 1, 1,
-0.3277288, -1.804379, -3.612833, 0, 0, 0, 1, 1,
-0.3266821, 1.645104, 0.8201944, 0, 0, 0, 1, 1,
-0.3264335, -0.5971514, 0.2738727, 0, 0, 0, 1, 1,
-0.3263083, 0.5797166, 0.3331083, 0, 0, 0, 1, 1,
-0.3245779, -0.2468507, -1.354786, 0, 0, 0, 1, 1,
-0.3245751, -0.3237444, -0.9954441, 1, 1, 1, 1, 1,
-0.3168989, 1.013799, -0.720165, 1, 1, 1, 1, 1,
-0.3166661, -1.231103, -2.325851, 1, 1, 1, 1, 1,
-0.313498, 1.025463, -3.040151, 1, 1, 1, 1, 1,
-0.3081802, -0.5248916, -2.450197, 1, 1, 1, 1, 1,
-0.3064388, 1.408964, -1.173089, 1, 1, 1, 1, 1,
-0.3060102, 0.6349514, 0.604811, 1, 1, 1, 1, 1,
-0.3040544, 0.2993212, 1.225736, 1, 1, 1, 1, 1,
-0.3039908, 0.317869, -1.027255, 1, 1, 1, 1, 1,
-0.3012407, 0.8258046, 0.3463331, 1, 1, 1, 1, 1,
-0.299199, 0.312289, -1.741401, 1, 1, 1, 1, 1,
-0.2987465, 0.9461153, 0.7813002, 1, 1, 1, 1, 1,
-0.2932056, 2.613644, 0.965297, 1, 1, 1, 1, 1,
-0.2899158, 0.1832074, -2.313144, 1, 1, 1, 1, 1,
-0.2787637, -2.226509, -3.675913, 1, 1, 1, 1, 1,
-0.2744437, -0.06246822, -1.895883, 0, 0, 1, 1, 1,
-0.2714029, -0.1458969, -2.098273, 1, 0, 0, 1, 1,
-0.27118, -1.071029, -4.224934, 1, 0, 0, 1, 1,
-0.2709896, -1.257069, -3.329318, 1, 0, 0, 1, 1,
-0.2697396, -0.1503966, -2.66123, 1, 0, 0, 1, 1,
-0.2653787, -0.8338671, -3.405107, 1, 0, 0, 1, 1,
-0.262748, 1.648059, -0.6465544, 0, 0, 0, 1, 1,
-0.2613402, -1.336734, -2.368427, 0, 0, 0, 1, 1,
-0.2576466, 0.2332495, -0.3737027, 0, 0, 0, 1, 1,
-0.2571746, 1.916049, -1.052583, 0, 0, 0, 1, 1,
-0.2538479, -1.204587, -1.890526, 0, 0, 0, 1, 1,
-0.2534291, 1.043715, -2.107092, 0, 0, 0, 1, 1,
-0.2444474, -0.4860001, -2.463186, 0, 0, 0, 1, 1,
-0.2394413, -0.6964948, -3.812353, 1, 1, 1, 1, 1,
-0.2373208, -1.119674, -3.731503, 1, 1, 1, 1, 1,
-0.2363841, 0.4810942, -1.078797, 1, 1, 1, 1, 1,
-0.2353205, 0.6483513, 0.4863075, 1, 1, 1, 1, 1,
-0.229785, 0.5962903, -1.110133, 1, 1, 1, 1, 1,
-0.2279403, 0.3800545, -0.8438324, 1, 1, 1, 1, 1,
-0.224756, 1.042835, 0.1934794, 1, 1, 1, 1, 1,
-0.220514, 1.572254, -0.3135067, 1, 1, 1, 1, 1,
-0.2204958, 1.426433, 0.1150267, 1, 1, 1, 1, 1,
-0.2191629, 0.3636533, 0.4396586, 1, 1, 1, 1, 1,
-0.2124156, -1.542957, -3.828588, 1, 1, 1, 1, 1,
-0.2031433, -1.11896, -1.536081, 1, 1, 1, 1, 1,
-0.2023246, -0.1442077, -0.4223357, 1, 1, 1, 1, 1,
-0.2015728, 0.4104186, -0.8647533, 1, 1, 1, 1, 1,
-0.1998484, 0.8631318, 0.1195373, 1, 1, 1, 1, 1,
-0.1971899, 0.1911303, 1.119715, 0, 0, 1, 1, 1,
-0.1958584, -1.559444, -2.668259, 1, 0, 0, 1, 1,
-0.1952831, 1.233285, -0.2325018, 1, 0, 0, 1, 1,
-0.1898394, -0.2180237, -2.381254, 1, 0, 0, 1, 1,
-0.1849023, 0.1630607, -1.339183, 1, 0, 0, 1, 1,
-0.184178, -1.241391, -2.8686, 1, 0, 0, 1, 1,
-0.1838516, -0.6561389, -2.33299, 0, 0, 0, 1, 1,
-0.1799818, 2.529954, -0.6359386, 0, 0, 0, 1, 1,
-0.1789105, -0.7341201, -1.928009, 0, 0, 0, 1, 1,
-0.1783106, -0.5887811, -1.374857, 0, 0, 0, 1, 1,
-0.1735793, -1.668403, -1.343738, 0, 0, 0, 1, 1,
-0.1721591, 0.08793253, -0.07098199, 0, 0, 0, 1, 1,
-0.1688015, 1.07197, 1.013838, 0, 0, 0, 1, 1,
-0.1681066, -0.1220982, -2.928328, 1, 1, 1, 1, 1,
-0.1679855, 0.284988, 1.248801, 1, 1, 1, 1, 1,
-0.1679133, 1.313647, 0.4335487, 1, 1, 1, 1, 1,
-0.1652523, 1.611392, -0.1655467, 1, 1, 1, 1, 1,
-0.1640173, -0.2010008, -2.340015, 1, 1, 1, 1, 1,
-0.1621047, -1.075969, -3.731192, 1, 1, 1, 1, 1,
-0.1578342, -0.7501148, -2.110306, 1, 1, 1, 1, 1,
-0.1570376, -0.1823356, -2.176737, 1, 1, 1, 1, 1,
-0.1553438, -0.4912107, -2.143309, 1, 1, 1, 1, 1,
-0.1500258, -0.2104412, -3.996397, 1, 1, 1, 1, 1,
-0.1383546, 1.367401, 0.2934369, 1, 1, 1, 1, 1,
-0.1330271, 0.4847503, 0.66001, 1, 1, 1, 1, 1,
-0.1328155, -1.615852, -3.856937, 1, 1, 1, 1, 1,
-0.1316654, -0.01232307, -1.61248, 1, 1, 1, 1, 1,
-0.1269753, -0.4690256, -1.390965, 1, 1, 1, 1, 1,
-0.1263671, 0.1005663, -3.236324, 0, 0, 1, 1, 1,
-0.1249595, -1.579129, -3.242342, 1, 0, 0, 1, 1,
-0.1245079, -0.9335344, -3.605215, 1, 0, 0, 1, 1,
-0.1238696, 0.2827447, 0.6405055, 1, 0, 0, 1, 1,
-0.1234189, 0.03536671, 0.01688955, 1, 0, 0, 1, 1,
-0.1214846, 0.7410329, 0.1333525, 1, 0, 0, 1, 1,
-0.1194149, -0.4190338, -3.77308, 0, 0, 0, 1, 1,
-0.1178866, 0.2651868, -1.750813, 0, 0, 0, 1, 1,
-0.1168894, 0.8452696, -1.122649, 0, 0, 0, 1, 1,
-0.116794, -1.558163, -4.81281, 0, 0, 0, 1, 1,
-0.1156629, -0.1651168, -0.8815722, 0, 0, 0, 1, 1,
-0.1135171, -1.379465, -3.818684, 0, 0, 0, 1, 1,
-0.1132918, 1.258388, -1.13242, 0, 0, 0, 1, 1,
-0.112512, -1.351065, -3.510906, 1, 1, 1, 1, 1,
-0.1111606, -1.27401, -4.516465, 1, 1, 1, 1, 1,
-0.1077239, 1.145269, -1.335622, 1, 1, 1, 1, 1,
-0.1060864, 0.09871308, -2.046631, 1, 1, 1, 1, 1,
-0.1053079, 0.8187515, 0.2501056, 1, 1, 1, 1, 1,
-0.1034275, -0.6271851, -2.919811, 1, 1, 1, 1, 1,
-0.1023538, -0.1400515, -3.827417, 1, 1, 1, 1, 1,
-0.1021821, 0.3108078, 0.9605705, 1, 1, 1, 1, 1,
-0.1012335, -0.7198001, -2.929066, 1, 1, 1, 1, 1,
-0.1008664, 0.5183368, 0.2505919, 1, 1, 1, 1, 1,
-0.1007172, 1.031883, -0.9490207, 1, 1, 1, 1, 1,
-0.1003671, 0.6195817, -0.9897012, 1, 1, 1, 1, 1,
-0.09054965, -0.5485941, -4.534177, 1, 1, 1, 1, 1,
-0.08851882, 1.286798, 0.4466144, 1, 1, 1, 1, 1,
-0.07701943, -1.488893, -3.915151, 1, 1, 1, 1, 1,
-0.07412205, 0.8422201, 0.2675592, 0, 0, 1, 1, 1,
-0.0701105, 1.888834, -0.1368947, 1, 0, 0, 1, 1,
-0.06943366, 0.6030308, -0.9101518, 1, 0, 0, 1, 1,
-0.06355118, 1.72746, 1.07883, 1, 0, 0, 1, 1,
-0.06193772, 0.1280944, -1.423684, 1, 0, 0, 1, 1,
-0.06082908, 1.632669, 1.419665, 1, 0, 0, 1, 1,
-0.05996925, -0.7322872, -4.056491, 0, 0, 0, 1, 1,
-0.05373041, 0.1879425, 0.8699133, 0, 0, 0, 1, 1,
-0.0510981, -0.1229928, -3.289291, 0, 0, 0, 1, 1,
-0.04325514, 0.3226278, -1.439296, 0, 0, 0, 1, 1,
-0.04313058, -0.02936568, -3.694188, 0, 0, 0, 1, 1,
-0.02789899, 0.6753505, 1.321627, 0, 0, 0, 1, 1,
-0.02757528, -0.009182164, -1.798734, 0, 0, 0, 1, 1,
-0.02748176, -0.5767673, -1.43452, 1, 1, 1, 1, 1,
-0.02726082, 0.2847359, -1.246866, 1, 1, 1, 1, 1,
-0.02280731, -0.147631, -3.427182, 1, 1, 1, 1, 1,
-0.01803927, -1.004223, -2.907625, 1, 1, 1, 1, 1,
-0.01773978, -1.889615, -4.358263, 1, 1, 1, 1, 1,
-0.01143062, -0.8998557, -4.01849, 1, 1, 1, 1, 1,
-0.01125625, -1.685437, -4.041211, 1, 1, 1, 1, 1,
-0.007833856, -0.7785071, -3.548709, 1, 1, 1, 1, 1,
-0.003366619, -1.931226, -5.047133, 1, 1, 1, 1, 1,
-0.002860237, 0.1247929, 0.4890759, 1, 1, 1, 1, 1,
-0.002825269, 0.4135898, -0.5814961, 1, 1, 1, 1, 1,
-0.001428654, -0.6191424, -4.048667, 1, 1, 1, 1, 1,
-0.001179857, -1.49005, -2.319631, 1, 1, 1, 1, 1,
-0.0002905879, -0.474027, -2.919793, 1, 1, 1, 1, 1,
0.0006146498, 0.09599236, -0.04075504, 1, 1, 1, 1, 1,
0.001243154, -0.07171998, 2.855886, 0, 0, 1, 1, 1,
0.001763977, -0.1933444, 3.494701, 1, 0, 0, 1, 1,
0.002232382, 0.5273142, -1.014696, 1, 0, 0, 1, 1,
0.003421733, 0.6231806, 0.4390803, 1, 0, 0, 1, 1,
0.004817653, 0.7959967, 0.55018, 1, 0, 0, 1, 1,
0.004990524, 0.9502749, -0.9907649, 1, 0, 0, 1, 1,
0.005190744, -2.125607, 3.778523, 0, 0, 0, 1, 1,
0.005501871, -0.5824663, 4.025835, 0, 0, 0, 1, 1,
0.007358029, 1.364269, -0.6914408, 0, 0, 0, 1, 1,
0.008784091, 1.162055, 1.135653, 0, 0, 0, 1, 1,
0.01001977, -0.6521361, 2.370615, 0, 0, 0, 1, 1,
0.01696768, 0.763449, -0.5372124, 0, 0, 0, 1, 1,
0.01868516, -0.5779764, 3.925226, 0, 0, 0, 1, 1,
0.01961013, 1.233787, -0.5443615, 1, 1, 1, 1, 1,
0.02026635, 0.9575619, 0.8042623, 1, 1, 1, 1, 1,
0.02553248, 1.223182, -0.9501262, 1, 1, 1, 1, 1,
0.02809095, 1.099713, -1.040517, 1, 1, 1, 1, 1,
0.0284536, -0.9385114, 3.368286, 1, 1, 1, 1, 1,
0.03052637, -0.6204183, 2.368389, 1, 1, 1, 1, 1,
0.03063577, -1.394115, 2.826326, 1, 1, 1, 1, 1,
0.03758087, -1.131675, 2.979641, 1, 1, 1, 1, 1,
0.0391261, -0.8907467, 1.64189, 1, 1, 1, 1, 1,
0.04357497, 0.5856543, 0.5926136, 1, 1, 1, 1, 1,
0.05379104, -0.0645196, 2.580538, 1, 1, 1, 1, 1,
0.05423608, 0.5313249, 0.5302246, 1, 1, 1, 1, 1,
0.0618546, 0.7199555, 1.475063, 1, 1, 1, 1, 1,
0.06301474, -0.2501234, 3.080033, 1, 1, 1, 1, 1,
0.07013685, 1.165699, -1.208164, 1, 1, 1, 1, 1,
0.07436232, -0.9447138, 3.169035, 0, 0, 1, 1, 1,
0.07575195, 0.2153699, -0.5875397, 1, 0, 0, 1, 1,
0.07937104, 1.49754, 0.09180752, 1, 0, 0, 1, 1,
0.07997443, -1.267242, 2.685489, 1, 0, 0, 1, 1,
0.08419589, -1.791841, 2.38444, 1, 0, 0, 1, 1,
0.09344498, -0.1539724, 3.257352, 1, 0, 0, 1, 1,
0.09613476, 0.9252707, 1.312963, 0, 0, 0, 1, 1,
0.09687113, 0.8785127, -0.5799358, 0, 0, 0, 1, 1,
0.1015536, -0.639342, 3.419782, 0, 0, 0, 1, 1,
0.1023337, 2.076433, 1.827728, 0, 0, 0, 1, 1,
0.1035929, 0.6220657, 0.3991648, 0, 0, 0, 1, 1,
0.1048191, -0.3326885, 4.952116, 0, 0, 0, 1, 1,
0.1079968, 1.641393, 0.1167597, 0, 0, 0, 1, 1,
0.1085915, -0.6289303, 4.123901, 1, 1, 1, 1, 1,
0.1093442, 0.615389, 3.456494, 1, 1, 1, 1, 1,
0.1129977, 0.4735671, 0.4522859, 1, 1, 1, 1, 1,
0.1155197, 0.7310889, 0.05601333, 1, 1, 1, 1, 1,
0.1161188, 1.002114, 0.3255107, 1, 1, 1, 1, 1,
0.1162205, -0.8244838, 1.684135, 1, 1, 1, 1, 1,
0.1193677, 1.895161, -0.6934564, 1, 1, 1, 1, 1,
0.1197495, -0.8602448, 3.442569, 1, 1, 1, 1, 1,
0.1198078, 1.865858, 0.07251745, 1, 1, 1, 1, 1,
0.1221323, 1.159985, -0.6356878, 1, 1, 1, 1, 1,
0.1231532, -0.5863404, 2.12757, 1, 1, 1, 1, 1,
0.125607, -1.898436, 2.707669, 1, 1, 1, 1, 1,
0.1280042, -1.040609, 1.735183, 1, 1, 1, 1, 1,
0.1317928, 0.2948443, 1.413274, 1, 1, 1, 1, 1,
0.1326904, 0.6140358, -0.82249, 1, 1, 1, 1, 1,
0.1329529, 0.4608569, 0.718464, 0, 0, 1, 1, 1,
0.1366258, 0.4252836, -0.8401003, 1, 0, 0, 1, 1,
0.1408983, 1.174894, 1.381682, 1, 0, 0, 1, 1,
0.1426259, 1.412468, -0.5959462, 1, 0, 0, 1, 1,
0.1450735, 1.072583, 0.9666205, 1, 0, 0, 1, 1,
0.1470741, -0.6008508, 2.476562, 1, 0, 0, 1, 1,
0.1477675, -0.3246961, 3.185058, 0, 0, 0, 1, 1,
0.1488495, -1.504251, 2.895525, 0, 0, 0, 1, 1,
0.1493305, -0.6281322, 3.243561, 0, 0, 0, 1, 1,
0.1504777, -0.4486638, 0.7310172, 0, 0, 0, 1, 1,
0.1507163, -0.5827722, 4.607883, 0, 0, 0, 1, 1,
0.1538193, 1.091614, 1.105615, 0, 0, 0, 1, 1,
0.154885, 0.8757185, -1.900584, 0, 0, 0, 1, 1,
0.156258, -0.06465621, 1.212552, 1, 1, 1, 1, 1,
0.1563018, 1.216832, 1.150807, 1, 1, 1, 1, 1,
0.1564387, -0.8844043, 5.380237, 1, 1, 1, 1, 1,
0.158502, 0.3327261, 1.94302, 1, 1, 1, 1, 1,
0.1598413, -0.523616, 3.395911, 1, 1, 1, 1, 1,
0.1612772, 0.7709437, 0.2467984, 1, 1, 1, 1, 1,
0.1632295, 1.175879, 1.803863, 1, 1, 1, 1, 1,
0.1639692, -0.5653269, 0.7304373, 1, 1, 1, 1, 1,
0.1643866, -2.158015, 4.314794, 1, 1, 1, 1, 1,
0.1648844, -0.01723028, 2.656461, 1, 1, 1, 1, 1,
0.1649313, 0.909874, -1.363982, 1, 1, 1, 1, 1,
0.1668561, -0.5898736, 2.243538, 1, 1, 1, 1, 1,
0.1689199, -2.58931, 1.772922, 1, 1, 1, 1, 1,
0.1698515, 1.269554, 2.458066, 1, 1, 1, 1, 1,
0.1734474, -0.4752294, 1.344086, 1, 1, 1, 1, 1,
0.174096, 0.1113422, 2.790441, 0, 0, 1, 1, 1,
0.1757918, -0.6226836, 3.953017, 1, 0, 0, 1, 1,
0.1795152, -0.2524771, 2.027556, 1, 0, 0, 1, 1,
0.1854439, 1.830319, 0.7915391, 1, 0, 0, 1, 1,
0.186987, -0.9871085, 4.426319, 1, 0, 0, 1, 1,
0.1930411, -1.260586, 5.126168, 1, 0, 0, 1, 1,
0.1938187, 0.003769093, 1.778159, 0, 0, 0, 1, 1,
0.1955051, 2.02875, 0.3826187, 0, 0, 0, 1, 1,
0.1961034, 1.115061, 0.03190639, 0, 0, 0, 1, 1,
0.1965046, 0.3559074, -1.770224, 0, 0, 0, 1, 1,
0.2024214, 0.2584797, 0.5961409, 0, 0, 0, 1, 1,
0.205295, -1.018572, 4.227729, 0, 0, 0, 1, 1,
0.2068131, 0.3305846, -0.1035386, 0, 0, 0, 1, 1,
0.2092416, -0.5836197, 2.802643, 1, 1, 1, 1, 1,
0.2108381, -0.3535466, 4.448147, 1, 1, 1, 1, 1,
0.2141856, -0.02066773, -0.003976806, 1, 1, 1, 1, 1,
0.2152912, -0.2706686, 3.208633, 1, 1, 1, 1, 1,
0.2197621, 2.348929, 1.042793, 1, 1, 1, 1, 1,
0.2197757, -0.1083539, 0.9819489, 1, 1, 1, 1, 1,
0.2214222, 0.05308691, 1.229493, 1, 1, 1, 1, 1,
0.2341259, -0.3389215, 2.452359, 1, 1, 1, 1, 1,
0.2373389, 0.1392959, 2.273539, 1, 1, 1, 1, 1,
0.2374512, -1.357771, 3.46817, 1, 1, 1, 1, 1,
0.2387269, -1.34721, 4.187131, 1, 1, 1, 1, 1,
0.2391409, 0.6700919, 0.1864037, 1, 1, 1, 1, 1,
0.2410274, 0.1835352, 1.001172, 1, 1, 1, 1, 1,
0.2417028, 0.847136, 0.1030544, 1, 1, 1, 1, 1,
0.2424895, 1.196334, 0.3755647, 1, 1, 1, 1, 1,
0.2507653, 0.004465566, 2.01702, 0, 0, 1, 1, 1,
0.2533699, 0.4711436, -0.5311472, 1, 0, 0, 1, 1,
0.2541853, -1.025443, 4.533538, 1, 0, 0, 1, 1,
0.254461, 1.180706, 0.7458517, 1, 0, 0, 1, 1,
0.2573297, -0.6347562, 3.572539, 1, 0, 0, 1, 1,
0.2583403, 0.6220654, 0.4604867, 1, 0, 0, 1, 1,
0.2625675, -0.9614486, 4.010515, 0, 0, 0, 1, 1,
0.2742815, 0.6855806, -0.6678973, 0, 0, 0, 1, 1,
0.2756485, -1.948335, 3.847935, 0, 0, 0, 1, 1,
0.2775007, -0.2808594, 1.540824, 0, 0, 0, 1, 1,
0.2793484, -0.8401142, 1.997388, 0, 0, 0, 1, 1,
0.2806713, -1.396898, 4.311175, 0, 0, 0, 1, 1,
0.2834046, -0.1924447, 2.768441, 0, 0, 0, 1, 1,
0.28792, -1.279918, 1.877007, 1, 1, 1, 1, 1,
0.2915744, -1.459617, 2.291993, 1, 1, 1, 1, 1,
0.2919536, -0.2075464, 3.350486, 1, 1, 1, 1, 1,
0.2925406, -1.661337, 3.939096, 1, 1, 1, 1, 1,
0.2936655, 1.999433, 0.5597922, 1, 1, 1, 1, 1,
0.2949856, -0.8067101, 2.46368, 1, 1, 1, 1, 1,
0.2976353, -1.822692, 4.003836, 1, 1, 1, 1, 1,
0.3052433, -0.1877319, 2.003502, 1, 1, 1, 1, 1,
0.3092544, -0.9763846, 4.320163, 1, 1, 1, 1, 1,
0.3139142, -0.1520086, 2.946232, 1, 1, 1, 1, 1,
0.3145056, -0.5183285, 2.607497, 1, 1, 1, 1, 1,
0.3172915, -0.4968208, 3.34686, 1, 1, 1, 1, 1,
0.3220463, -0.198384, 2.071177, 1, 1, 1, 1, 1,
0.329254, 0.693602, 0.1166817, 1, 1, 1, 1, 1,
0.3318176, -1.583658, 3.978549, 1, 1, 1, 1, 1,
0.3353271, -0.3603908, 1.229264, 0, 0, 1, 1, 1,
0.3414993, 0.1939698, 0.668785, 1, 0, 0, 1, 1,
0.3434973, 0.5129824, 0.5830702, 1, 0, 0, 1, 1,
0.3443221, 2.141273, -0.7097583, 1, 0, 0, 1, 1,
0.3450982, -0.967179, 1.878661, 1, 0, 0, 1, 1,
0.3456205, -0.8057016, 1.859709, 1, 0, 0, 1, 1,
0.3475457, 0.4377864, 2.49622, 0, 0, 0, 1, 1,
0.3475867, 0.6209782, -2.235089, 0, 0, 0, 1, 1,
0.3482601, -0.2249352, 1.355206, 0, 0, 0, 1, 1,
0.3489827, -0.2758888, 2.870456, 0, 0, 0, 1, 1,
0.3499644, 0.04719524, 0.7435876, 0, 0, 0, 1, 1,
0.3554476, -0.6987438, 0.7167517, 0, 0, 0, 1, 1,
0.3555866, -0.4616663, 3.269266, 0, 0, 0, 1, 1,
0.3563475, -0.4214304, 1.568087, 1, 1, 1, 1, 1,
0.3573197, -0.6448014, 4.137478, 1, 1, 1, 1, 1,
0.3616566, -0.3601442, 2.946374, 1, 1, 1, 1, 1,
0.3624496, -1.182742, 3.481072, 1, 1, 1, 1, 1,
0.3644519, -0.07902567, 0.701782, 1, 1, 1, 1, 1,
0.3654954, 0.4075226, 2.038184, 1, 1, 1, 1, 1,
0.3669336, -0.5535264, 1.78029, 1, 1, 1, 1, 1,
0.3670998, -0.08023866, 1.599022, 1, 1, 1, 1, 1,
0.3681583, -1.57008, 2.83427, 1, 1, 1, 1, 1,
0.3693795, 0.428014, 1.221731, 1, 1, 1, 1, 1,
0.3705708, 0.4605067, 0.756724, 1, 1, 1, 1, 1,
0.3738943, 1.24999, 0.4316425, 1, 1, 1, 1, 1,
0.3753691, -0.4256786, 1.971871, 1, 1, 1, 1, 1,
0.3811405, 1.315285, -1.191682, 1, 1, 1, 1, 1,
0.3867332, 0.1020691, 2.391874, 1, 1, 1, 1, 1,
0.390403, -1.764782, 3.527957, 0, 0, 1, 1, 1,
0.3906992, 0.3336936, 1.334747, 1, 0, 0, 1, 1,
0.3929933, 0.5529928, 0.6402027, 1, 0, 0, 1, 1,
0.3942225, 0.2125, 1.298614, 1, 0, 0, 1, 1,
0.3954694, 1.331788, -0.5449058, 1, 0, 0, 1, 1,
0.3965216, 0.8856866, -0.4674481, 1, 0, 0, 1, 1,
0.3995001, -1.125879, 3.084594, 0, 0, 0, 1, 1,
0.4000013, 1.22924, -0.8330396, 0, 0, 0, 1, 1,
0.4002909, -0.8555958, 4.085248, 0, 0, 0, 1, 1,
0.4005682, 0.447352, 0.9338763, 0, 0, 0, 1, 1,
0.4013561, -0.03188175, 2.2848, 0, 0, 0, 1, 1,
0.4018602, 0.271663, 0.5642808, 0, 0, 0, 1, 1,
0.4021149, 0.6302187, 1.062762, 0, 0, 0, 1, 1,
0.4050425, -1.634823, 2.613043, 1, 1, 1, 1, 1,
0.4058771, 0.7190766, 1.041359, 1, 1, 1, 1, 1,
0.4068011, 0.9397532, 0.4236403, 1, 1, 1, 1, 1,
0.4083194, 0.5758526, 2.154135, 1, 1, 1, 1, 1,
0.4142192, -0.04172552, 2.071303, 1, 1, 1, 1, 1,
0.4153256, 0.7008477, -0.4975497, 1, 1, 1, 1, 1,
0.4171558, -1.20679, 3.914692, 1, 1, 1, 1, 1,
0.4177559, 0.1394473, 1.357588, 1, 1, 1, 1, 1,
0.418149, -0.7249594, 1.485435, 1, 1, 1, 1, 1,
0.4186757, 1.046708, 1.188196, 1, 1, 1, 1, 1,
0.4253809, -0.08388718, 2.871679, 1, 1, 1, 1, 1,
0.4255762, -1.107495, 2.921169, 1, 1, 1, 1, 1,
0.4280768, -0.6599412, 1.557029, 1, 1, 1, 1, 1,
0.4319282, 0.02067403, 1.93713, 1, 1, 1, 1, 1,
0.4319562, 0.5913585, -0.0608811, 1, 1, 1, 1, 1,
0.4381035, -1.768233, 1.055226, 0, 0, 1, 1, 1,
0.4428098, -1.763515, 2.047292, 1, 0, 0, 1, 1,
0.4471192, 1.585595, -0.5680056, 1, 0, 0, 1, 1,
0.4511419, -1.271234, 2.063754, 1, 0, 0, 1, 1,
0.4619282, -1.315232, 3.580884, 1, 0, 0, 1, 1,
0.462163, 1.395493, 0.4258672, 1, 0, 0, 1, 1,
0.462497, -0.8741502, 3.264692, 0, 0, 0, 1, 1,
0.4643726, 0.7437054, 0.3760759, 0, 0, 0, 1, 1,
0.4718964, -0.6589498, 1.632439, 0, 0, 0, 1, 1,
0.4763515, -0.49652, 1.865349, 0, 0, 0, 1, 1,
0.4790826, 1.157006, 1.404574, 0, 0, 0, 1, 1,
0.4791774, 0.5207765, 0.05181135, 0, 0, 0, 1, 1,
0.4797395, -1.389162, 2.972629, 0, 0, 0, 1, 1,
0.482822, 0.731369, 1.568744, 1, 1, 1, 1, 1,
0.4900765, 1.104175, 1.203987, 1, 1, 1, 1, 1,
0.4982789, -2.225684, 2.293114, 1, 1, 1, 1, 1,
0.4991613, -0.4459258, 1.184062, 1, 1, 1, 1, 1,
0.5014638, 0.4006704, 0.8009819, 1, 1, 1, 1, 1,
0.5034028, -2.084339, 4.384237, 1, 1, 1, 1, 1,
0.5047926, 0.7148266, 1.456524, 1, 1, 1, 1, 1,
0.5056129, 1.706148, -0.2801141, 1, 1, 1, 1, 1,
0.5082214, -1.820206, 4.393684, 1, 1, 1, 1, 1,
0.5151425, 0.09167269, 2.170893, 1, 1, 1, 1, 1,
0.5160087, -0.515817, 2.102354, 1, 1, 1, 1, 1,
0.5162391, -0.886358, 2.656176, 1, 1, 1, 1, 1,
0.5168011, -0.8264353, 2.300884, 1, 1, 1, 1, 1,
0.5201786, -1.502173, 2.532545, 1, 1, 1, 1, 1,
0.5240394, 1.509867, -1.944691, 1, 1, 1, 1, 1,
0.5283964, -1.061616, 2.097467, 0, 0, 1, 1, 1,
0.5305861, -0.2354387, 1.587465, 1, 0, 0, 1, 1,
0.5317625, 1.479113, 1.394518, 1, 0, 0, 1, 1,
0.5354998, -0.2925377, 2.274188, 1, 0, 0, 1, 1,
0.5380305, -0.566718, 4.619759, 1, 0, 0, 1, 1,
0.538044, 0.4437478, 0.5373926, 1, 0, 0, 1, 1,
0.5381886, 1.264189, 0.85254, 0, 0, 0, 1, 1,
0.542795, 2.23991, 1.597961, 0, 0, 0, 1, 1,
0.5436163, 2.979609, -0.4827555, 0, 0, 0, 1, 1,
0.5440135, -0.6843872, 2.710342, 0, 0, 0, 1, 1,
0.5443576, 0.6900402, 1.022602, 0, 0, 0, 1, 1,
0.5456302, 1.51203, -0.9508629, 0, 0, 0, 1, 1,
0.5460793, 1.735948, 0.8714536, 0, 0, 0, 1, 1,
0.5481299, -0.2454713, 1.129522, 1, 1, 1, 1, 1,
0.5549828, -0.0662384, 3.620889, 1, 1, 1, 1, 1,
0.5644332, -0.1269209, 1.058734, 1, 1, 1, 1, 1,
0.564812, -2.539282, 3.284561, 1, 1, 1, 1, 1,
0.568568, 0.4023387, 0.8196299, 1, 1, 1, 1, 1,
0.5749841, -0.00852157, 1.288128, 1, 1, 1, 1, 1,
0.5871217, -0.1235251, 0.5958889, 1, 1, 1, 1, 1,
0.5943838, -0.9707949, 0.8138623, 1, 1, 1, 1, 1,
0.594776, 0.02370214, 0.6202953, 1, 1, 1, 1, 1,
0.5977442, 0.7738186, -0.03968207, 1, 1, 1, 1, 1,
0.6024932, -0.3535206, 3.279869, 1, 1, 1, 1, 1,
0.6160557, 1.48745, 1.886931, 1, 1, 1, 1, 1,
0.6172374, 0.9950567, 2.109564, 1, 1, 1, 1, 1,
0.6282431, -0.6281325, 2.487827, 1, 1, 1, 1, 1,
0.6324018, 1.324809, 0.7154294, 1, 1, 1, 1, 1,
0.639128, -0.4657964, 2.393586, 0, 0, 1, 1, 1,
0.6441002, 0.355146, 0.7706627, 1, 0, 0, 1, 1,
0.6454525, -1.735433, 3.080786, 1, 0, 0, 1, 1,
0.6482078, 0.4276975, 2.060789, 1, 0, 0, 1, 1,
0.6516011, 2.108335, -0.03274066, 1, 0, 0, 1, 1,
0.6537533, -0.302224, 0.7957079, 1, 0, 0, 1, 1,
0.6538745, 1.110192, -0.7692633, 0, 0, 0, 1, 1,
0.6544424, 0.1545809, 0.1911108, 0, 0, 0, 1, 1,
0.6595433, -0.9230379, 3.057435, 0, 0, 0, 1, 1,
0.6698209, 1.666741, -0.79835, 0, 0, 0, 1, 1,
0.6699882, -0.3216246, 2.986523, 0, 0, 0, 1, 1,
0.6763999, 0.3978687, 0.8778226, 0, 0, 0, 1, 1,
0.6836568, -1.705656, 3.483104, 0, 0, 0, 1, 1,
0.6845806, 0.626551, 0.4623456, 1, 1, 1, 1, 1,
0.6920811, -0.003459202, 1.277274, 1, 1, 1, 1, 1,
0.6946213, 2.275745, -0.7158521, 1, 1, 1, 1, 1,
0.6948535, -0.1785443, 1.599889, 1, 1, 1, 1, 1,
0.6983386, 1.08204, 0.3515385, 1, 1, 1, 1, 1,
0.7007177, -0.08641943, 4.72628, 1, 1, 1, 1, 1,
0.7058189, 0.8439571, 2.036387, 1, 1, 1, 1, 1,
0.7065104, -0.4376977, 1.606336, 1, 1, 1, 1, 1,
0.7078022, -0.2211069, 0.6549445, 1, 1, 1, 1, 1,
0.7137633, 0.7076824, 0.7034433, 1, 1, 1, 1, 1,
0.7147076, 0.699908, 0.5517123, 1, 1, 1, 1, 1,
0.7196017, -0.2968599, 2.616403, 1, 1, 1, 1, 1,
0.7236071, -1.960706, 3.021038, 1, 1, 1, 1, 1,
0.7303529, -0.4137574, 3.114875, 1, 1, 1, 1, 1,
0.7354394, 0.3597887, 1.550823, 1, 1, 1, 1, 1,
0.7371495, 0.3787493, 3.739288, 0, 0, 1, 1, 1,
0.7416113, -1.10718, 2.295382, 1, 0, 0, 1, 1,
0.7418817, -0.4747191, 2.028812, 1, 0, 0, 1, 1,
0.7510315, -1.048369, 2.347731, 1, 0, 0, 1, 1,
0.7528396, -0.1476432, 0.3692164, 1, 0, 0, 1, 1,
0.7567055, -1.736841, 2.71711, 1, 0, 0, 1, 1,
0.7601851, -0.2990532, 1.617139, 0, 0, 0, 1, 1,
0.7625892, 0.5935988, 0.08455136, 0, 0, 0, 1, 1,
0.7638872, 0.634219, 0.2955852, 0, 0, 0, 1, 1,
0.7674085, 0.4778548, 0.8850837, 0, 0, 0, 1, 1,
0.7706287, 0.04505019, 2.033418, 0, 0, 0, 1, 1,
0.7749365, 0.2075217, 1.08508, 0, 0, 0, 1, 1,
0.778777, 0.6108978, 0.5832815, 0, 0, 0, 1, 1,
0.7802666, -2.911954, 3.950479, 1, 1, 1, 1, 1,
0.7805646, 0.05156621, 1.848137, 1, 1, 1, 1, 1,
0.7847955, 1.295274, 0.9965709, 1, 1, 1, 1, 1,
0.7861312, 0.8156394, 0.8874012, 1, 1, 1, 1, 1,
0.7912104, -0.5733202, 2.10613, 1, 1, 1, 1, 1,
0.8000641, 1.627226, 0.2114005, 1, 1, 1, 1, 1,
0.8025761, -2.478542, 3.725298, 1, 1, 1, 1, 1,
0.8031462, 0.5957691, -0.04207296, 1, 1, 1, 1, 1,
0.8054108, -0.1100575, 2.284573, 1, 1, 1, 1, 1,
0.8075546, -2.051048, 4.349529, 1, 1, 1, 1, 1,
0.8075878, 0.6349787, 0.007588501, 1, 1, 1, 1, 1,
0.8110685, -1.244752, 4.019662, 1, 1, 1, 1, 1,
0.8282165, 0.2014632, -0.2217519, 1, 1, 1, 1, 1,
0.8300874, 0.3375537, 1.109213, 1, 1, 1, 1, 1,
0.8306469, -1.790951, 0.9102268, 1, 1, 1, 1, 1,
0.8307366, -0.9827245, 3.50323, 0, 0, 1, 1, 1,
0.840249, 0.03307883, 0.3367294, 1, 0, 0, 1, 1,
0.841643, 1.36939, -0.815362, 1, 0, 0, 1, 1,
0.8430973, 0.1165533, 3.037538, 1, 0, 0, 1, 1,
0.847008, -1.197427, 2.18868, 1, 0, 0, 1, 1,
0.8562391, 0.8918299, 0.1972608, 1, 0, 0, 1, 1,
0.8598517, 0.6124071, -0.1082443, 0, 0, 0, 1, 1,
0.8602038, -2.141388, 0.796842, 0, 0, 0, 1, 1,
0.862321, 1.468792, 1.107644, 0, 0, 0, 1, 1,
0.8666703, -1.259023, 3.545838, 0, 0, 0, 1, 1,
0.8750374, -0.9704894, 4.370438, 0, 0, 0, 1, 1,
0.8751443, -0.5185799, 1.036885, 0, 0, 0, 1, 1,
0.8817176, -0.4530928, 2.415491, 0, 0, 0, 1, 1,
0.882724, -0.05335747, 2.279659, 1, 1, 1, 1, 1,
0.8829564, 0.9365148, 2.080053, 1, 1, 1, 1, 1,
0.8877647, -1.01724, 2.054977, 1, 1, 1, 1, 1,
0.8891064, -0.1399652, -1.239269, 1, 1, 1, 1, 1,
0.9009882, 0.0924744, 2.359646, 1, 1, 1, 1, 1,
0.902294, -0.03042904, -0.5194451, 1, 1, 1, 1, 1,
0.9111594, -0.7264236, 3.155945, 1, 1, 1, 1, 1,
0.9127632, -0.1167316, 1.182648, 1, 1, 1, 1, 1,
0.9178363, 0.2425123, 1.822256, 1, 1, 1, 1, 1,
0.9201112, -0.3636555, 1.405719, 1, 1, 1, 1, 1,
0.9221667, -0.3235648, 0.281653, 1, 1, 1, 1, 1,
0.9407361, 0.1441897, 1.09109, 1, 1, 1, 1, 1,
0.9429524, 1.309933, 0.9371045, 1, 1, 1, 1, 1,
0.9441977, 0.2069155, 0.009106942, 1, 1, 1, 1, 1,
0.9481789, 1.733043, 0.8616908, 1, 1, 1, 1, 1,
0.949167, -0.2179025, 1.283809, 0, 0, 1, 1, 1,
0.9509761, -0.1976468, 0.5682424, 1, 0, 0, 1, 1,
0.9540259, -1.494935, 2.311432, 1, 0, 0, 1, 1,
0.9593188, -0.1287993, 0.6807504, 1, 0, 0, 1, 1,
0.9644423, 0.7281484, 2.487932, 1, 0, 0, 1, 1,
0.964515, -0.2225109, 0.6902775, 1, 0, 0, 1, 1,
0.9687329, -0.05427182, 2.412773, 0, 0, 0, 1, 1,
0.9707608, -0.7202178, 1.807649, 0, 0, 0, 1, 1,
0.9715305, 0.6546626, -1.232604, 0, 0, 0, 1, 1,
0.9739291, 0.8160776, -1.295976, 0, 0, 0, 1, 1,
0.9761948, -1.393001, 4.671063, 0, 0, 0, 1, 1,
0.9774354, -1.407381, 1.078468, 0, 0, 0, 1, 1,
0.9777529, 0.4992195, 1.503176, 0, 0, 0, 1, 1,
0.9824753, -0.0759791, 0.74141, 1, 1, 1, 1, 1,
0.9908749, -0.8186991, 3.219231, 1, 1, 1, 1, 1,
0.9926944, 0.8967598, -0.6277443, 1, 1, 1, 1, 1,
0.9970047, -0.7227434, 3.060608, 1, 1, 1, 1, 1,
0.9984483, -0.04419305, 1.997153, 1, 1, 1, 1, 1,
1.004548, 1.316127, 0.8795182, 1, 1, 1, 1, 1,
1.006277, -1.215039, 1.780022, 1, 1, 1, 1, 1,
1.007123, 0.2925968, 2.609009, 1, 1, 1, 1, 1,
1.014623, 0.9478437, 0.5482817, 1, 1, 1, 1, 1,
1.015464, -0.06622531, 2.880292, 1, 1, 1, 1, 1,
1.022028, -1.49702, 3.283413, 1, 1, 1, 1, 1,
1.023619, -1.658543, 3.185545, 1, 1, 1, 1, 1,
1.030449, -0.5066325, 0.400997, 1, 1, 1, 1, 1,
1.030486, -0.1356227, 2.234221, 1, 1, 1, 1, 1,
1.036855, 1.566467, 2.283332, 1, 1, 1, 1, 1,
1.053289, -0.5515121, 2.091193, 0, 0, 1, 1, 1,
1.055797, 1.780373, 0.06562707, 1, 0, 0, 1, 1,
1.058808, -1.289812, 2.078543, 1, 0, 0, 1, 1,
1.068369, -0.2787441, 1.774323, 1, 0, 0, 1, 1,
1.08237, 1.099177, 1.767273, 1, 0, 0, 1, 1,
1.098607, 1.153965, 1.717176, 1, 0, 0, 1, 1,
1.116931, -1.152433, 4.135889, 0, 0, 0, 1, 1,
1.119646, 2.159584, 0.9342209, 0, 0, 0, 1, 1,
1.121902, -0.03311067, 1.980308, 0, 0, 0, 1, 1,
1.123155, 0.2452557, 0.8351331, 0, 0, 0, 1, 1,
1.126603, 1.402769, 1.96901, 0, 0, 0, 1, 1,
1.127713, -1.419912, 0.6934803, 0, 0, 0, 1, 1,
1.131639, -2.871463, 3.778546, 0, 0, 0, 1, 1,
1.134628, 1.859495, 0.9342138, 1, 1, 1, 1, 1,
1.146024, 1.540231, 0.6229107, 1, 1, 1, 1, 1,
1.149407, -1.801922, 2.452364, 1, 1, 1, 1, 1,
1.155204, 0.9562986, 1.00123, 1, 1, 1, 1, 1,
1.156745, 1.273434, 0.06514084, 1, 1, 1, 1, 1,
1.161176, -0.6397964, 3.062996, 1, 1, 1, 1, 1,
1.168674, -1.250839, 3.665769, 1, 1, 1, 1, 1,
1.171287, 1.339995, 2.635973, 1, 1, 1, 1, 1,
1.177851, 1.038094, -0.2622672, 1, 1, 1, 1, 1,
1.197691, 0.4876686, 1.914779, 1, 1, 1, 1, 1,
1.207486, 2.185738, 2.295159, 1, 1, 1, 1, 1,
1.207876, -0.3460874, 0.9371102, 1, 1, 1, 1, 1,
1.218074, -0.8764417, 2.608051, 1, 1, 1, 1, 1,
1.218744, 1.069888, 1.420843, 1, 1, 1, 1, 1,
1.226359, -0.456993, 2.548756, 1, 1, 1, 1, 1,
1.233586, 1.061876, 1.166832, 0, 0, 1, 1, 1,
1.235275, -0.7039706, 1.747434, 1, 0, 0, 1, 1,
1.236942, -1.469181, 1.68787, 1, 0, 0, 1, 1,
1.240277, -0.1683964, 0.9508322, 1, 0, 0, 1, 1,
1.246369, 0.4535297, 1.960592, 1, 0, 0, 1, 1,
1.25422, 0.6075187, 2.009757, 1, 0, 0, 1, 1,
1.264595, 1.206897, 0.2426311, 0, 0, 0, 1, 1,
1.269198, -0.3087187, 3.654868, 0, 0, 0, 1, 1,
1.270579, 0.1354955, 2.051735, 0, 0, 0, 1, 1,
1.270772, -0.02979231, 2.021135, 0, 0, 0, 1, 1,
1.271829, 0.5351339, 1.934744, 0, 0, 0, 1, 1,
1.278423, -0.1812777, 1.772121, 0, 0, 0, 1, 1,
1.281391, 0.3156311, 1.757916, 0, 0, 0, 1, 1,
1.281912, -1.8871, 3.086492, 1, 1, 1, 1, 1,
1.303604, 0.2598177, 0.8695862, 1, 1, 1, 1, 1,
1.306257, -1.460521, 1.897504, 1, 1, 1, 1, 1,
1.30687, -1.54924, 1.87742, 1, 1, 1, 1, 1,
1.308661, 1.262629, 0.7587124, 1, 1, 1, 1, 1,
1.309162, 0.430849, 0.8979564, 1, 1, 1, 1, 1,
1.309591, -0.2432684, 1.355206, 1, 1, 1, 1, 1,
1.312935, -1.720651, 1.736439, 1, 1, 1, 1, 1,
1.319725, 0.6020297, -0.7469391, 1, 1, 1, 1, 1,
1.335173, 0.5550737, 1.630582, 1, 1, 1, 1, 1,
1.338498, -1.54175, 2.439046, 1, 1, 1, 1, 1,
1.34974, 2.117182, 1.981835, 1, 1, 1, 1, 1,
1.379913, 1.260309, -0.5216398, 1, 1, 1, 1, 1,
1.383811, 0.5283256, -0.147754, 1, 1, 1, 1, 1,
1.395065, 1.252787, 1.327538, 1, 1, 1, 1, 1,
1.397058, 1.914214, -0.334761, 0, 0, 1, 1, 1,
1.397663, 0.758922, 0.7739991, 1, 0, 0, 1, 1,
1.401396, 2.040734, 2.506172, 1, 0, 0, 1, 1,
1.401845, -0.1521645, 1.452818, 1, 0, 0, 1, 1,
1.405518, 0.9079877, 1.141468, 1, 0, 0, 1, 1,
1.406219, 0.6212723, 0.4338258, 1, 0, 0, 1, 1,
1.421223, 0.5161902, 0.9260672, 0, 0, 0, 1, 1,
1.429808, -0.4003999, 1.764738, 0, 0, 0, 1, 1,
1.438646, -1.578689, 2.905305, 0, 0, 0, 1, 1,
1.448181, -1.536716, 2.757551, 0, 0, 0, 1, 1,
1.452949, -0.4472765, 1.887723, 0, 0, 0, 1, 1,
1.456811, -1.00596, 1.659225, 0, 0, 0, 1, 1,
1.457385, -0.03233453, 1.247107, 0, 0, 0, 1, 1,
1.459807, 0.1536641, 0.09737196, 1, 1, 1, 1, 1,
1.466928, -1.22833, 3.115775, 1, 1, 1, 1, 1,
1.468809, 1.066548, -0.6613807, 1, 1, 1, 1, 1,
1.473161, -1.439959, 1.59172, 1, 1, 1, 1, 1,
1.476573, -0.764706, 2.225968, 1, 1, 1, 1, 1,
1.482913, -0.008155455, 3.32489, 1, 1, 1, 1, 1,
1.498249, -1.82596, 2.286512, 1, 1, 1, 1, 1,
1.502168, -1.112344, 2.800252, 1, 1, 1, 1, 1,
1.510514, -0.7233281, 1.916778, 1, 1, 1, 1, 1,
1.53402, -0.8894365, 3.350919, 1, 1, 1, 1, 1,
1.536809, -0.7052632, 1.211111, 1, 1, 1, 1, 1,
1.550539, 0.4694954, 2.434334, 1, 1, 1, 1, 1,
1.575767, 1.011644, -0.2411869, 1, 1, 1, 1, 1,
1.606386, -0.6941534, 1.249577, 1, 1, 1, 1, 1,
1.63252, -0.8011979, 1.77114, 1, 1, 1, 1, 1,
1.63333, -0.459482, 0.2199304, 0, 0, 1, 1, 1,
1.637088, -1.00537, 2.091444, 1, 0, 0, 1, 1,
1.637889, 2.101809, 1.226887, 1, 0, 0, 1, 1,
1.639573, 0.2974509, -0.437002, 1, 0, 0, 1, 1,
1.646634, -1.550045, -0.4716617, 1, 0, 0, 1, 1,
1.65091, 0.1027107, 2.091926, 1, 0, 0, 1, 1,
1.668835, 1.911428, -0.767893, 0, 0, 0, 1, 1,
1.740667, -0.7665526, 3.06601, 0, 0, 0, 1, 1,
1.755185, -0.5868427, 2.329004, 0, 0, 0, 1, 1,
1.763062, -0.08935345, 2.357084, 0, 0, 0, 1, 1,
1.765442, -0.7444534, 3.205084, 0, 0, 0, 1, 1,
1.769251, 0.1175644, 0.09159393, 0, 0, 0, 1, 1,
1.789745, -0.8188838, 1.536749, 0, 0, 0, 1, 1,
1.790544, -0.0650076, 4.300808, 1, 1, 1, 1, 1,
1.7991, -0.207658, -0.2113552, 1, 1, 1, 1, 1,
1.805744, 1.578282, 1.05385, 1, 1, 1, 1, 1,
1.80686, 0.412669, 1.19971, 1, 1, 1, 1, 1,
1.80772, -0.4721564, 2.031777, 1, 1, 1, 1, 1,
1.815359, 0.3183794, 0.09375045, 1, 1, 1, 1, 1,
1.82456, -1.784632, 3.405586, 1, 1, 1, 1, 1,
1.841364, -0.5200753, 0.7166993, 1, 1, 1, 1, 1,
1.876243, 0.8857617, 1.76869, 1, 1, 1, 1, 1,
1.88962, -1.806823, 2.458109, 1, 1, 1, 1, 1,
1.913611, -1.052689, 2.478875, 1, 1, 1, 1, 1,
1.943376, 0.7202743, 0.7480829, 1, 1, 1, 1, 1,
2.028435, -0.5153405, 2.176095, 1, 1, 1, 1, 1,
2.04235, 1.197934, 2.406169, 1, 1, 1, 1, 1,
2.081362, -0.4201912, 2.572257, 1, 1, 1, 1, 1,
2.10975, 0.8524682, 1.514706, 0, 0, 1, 1, 1,
2.115829, -1.480849, 1.899895, 1, 0, 0, 1, 1,
2.190789, -0.8777664, 2.084476, 1, 0, 0, 1, 1,
2.201787, -0.6598911, 2.19805, 1, 0, 0, 1, 1,
2.252859, -0.3040814, 1.276487, 1, 0, 0, 1, 1,
2.260247, -1.329946, 2.271201, 1, 0, 0, 1, 1,
2.286947, -0.3277769, 2.623091, 0, 0, 0, 1, 1,
2.306502, 0.9111062, 1.29157, 0, 0, 0, 1, 1,
2.381603, -1.272915, 0.7527404, 0, 0, 0, 1, 1,
2.474782, -0.341215, 1.417502, 0, 0, 0, 1, 1,
2.507518, 1.149992, 2.13944, 0, 0, 0, 1, 1,
2.592, -0.8834451, 1.049287, 0, 0, 0, 1, 1,
2.620183, -0.4718428, 2.960865, 0, 0, 0, 1, 1,
2.783915, 1.006196, 2.347426, 1, 1, 1, 1, 1,
2.823908, -0.3603658, 3.112815, 1, 1, 1, 1, 1,
2.866467, 1.12928, 2.32042, 1, 1, 1, 1, 1,
2.881437, -1.230515, 2.775727, 1, 1, 1, 1, 1,
2.957727, 0.3713981, 2.058049, 1, 1, 1, 1, 1,
3.077738, 1.60426, 2.364505, 1, 1, 1, 1, 1,
3.484328, 0.7511788, 3.08765, 1, 1, 1, 1, 1
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
var radius = 9.473546;
var distance = 33.27543;
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
mvMatrix.translate( -0.1411066, -0.174426, -0.1665518 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27543);
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
