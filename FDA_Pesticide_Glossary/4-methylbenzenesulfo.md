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
-4.366004, 0.1063672, -1.372653, 1, 0, 0, 1,
-3.254953, 1.45883, -1.974869, 1, 0.007843138, 0, 1,
-2.958951, -0.1598268, -0.03559302, 1, 0.01176471, 0, 1,
-2.749904, 0.7893708, -1.866867, 1, 0.01960784, 0, 1,
-2.746792, 1.233281, 0.8337004, 1, 0.02352941, 0, 1,
-2.713652, -0.6864884, -2.763976, 1, 0.03137255, 0, 1,
-2.667379, -1.351881, -1.936724, 1, 0.03529412, 0, 1,
-2.437696, -0.1921606, -2.158534, 1, 0.04313726, 0, 1,
-2.376428, 0.489231, -0.9885211, 1, 0.04705882, 0, 1,
-2.328113, -0.9738268, -2.249315, 1, 0.05490196, 0, 1,
-2.326525, -0.2364919, -1.279087, 1, 0.05882353, 0, 1,
-2.304754, -0.1165579, -0.7426854, 1, 0.06666667, 0, 1,
-2.303488, -1.557055, -1.990482, 1, 0.07058824, 0, 1,
-2.272693, -2.081048, -2.325694, 1, 0.07843138, 0, 1,
-2.220101, 0.1010533, -2.800907, 1, 0.08235294, 0, 1,
-2.146068, 0.8386673, -1.338671, 1, 0.09019608, 0, 1,
-2.142699, 0.2767367, -1.104088, 1, 0.09411765, 0, 1,
-2.142417, -1.257349, -1.616446, 1, 0.1019608, 0, 1,
-2.140835, -0.5416484, -1.004073, 1, 0.1098039, 0, 1,
-2.100572, 0.8841057, -0.4283415, 1, 0.1137255, 0, 1,
-2.095645, 0.344647, -1.42666, 1, 0.1215686, 0, 1,
-2.080547, 0.3456937, -0.2949022, 1, 0.1254902, 0, 1,
-2.076117, -0.124805, -2.82527, 1, 0.1333333, 0, 1,
-2.061734, 0.1017147, -1.878759, 1, 0.1372549, 0, 1,
-2.052583, -2.039192, -0.9617345, 1, 0.145098, 0, 1,
-1.998651, -0.8525491, -1.582478, 1, 0.1490196, 0, 1,
-1.995811, 0.1677355, -1.250692, 1, 0.1568628, 0, 1,
-1.990105, 0.7868575, -1.369051, 1, 0.1607843, 0, 1,
-1.979979, 1.347159, -2.214219, 1, 0.1686275, 0, 1,
-1.971596, -0.8472901, -2.523858, 1, 0.172549, 0, 1,
-1.903486, -1.774726, -3.911275, 1, 0.1803922, 0, 1,
-1.897756, -0.02070068, -2.99079, 1, 0.1843137, 0, 1,
-1.87832, -0.1657298, -0.7606524, 1, 0.1921569, 0, 1,
-1.846779, -0.9571515, -1.300593, 1, 0.1960784, 0, 1,
-1.843848, -1.523359, -2.328335, 1, 0.2039216, 0, 1,
-1.841551, -0.7256545, -0.3750621, 1, 0.2117647, 0, 1,
-1.840911, 0.5692955, -1.661924, 1, 0.2156863, 0, 1,
-1.770288, 1.092842, -1.500149, 1, 0.2235294, 0, 1,
-1.731099, 1.71147, 0.1260922, 1, 0.227451, 0, 1,
-1.720662, 0.1100632, -3.921463, 1, 0.2352941, 0, 1,
-1.715132, 0.3048424, -0.7199819, 1, 0.2392157, 0, 1,
-1.69929, -0.5577611, -2.736461, 1, 0.2470588, 0, 1,
-1.695976, -0.3766687, -0.5327044, 1, 0.2509804, 0, 1,
-1.69218, -0.4422795, -1.612499, 1, 0.2588235, 0, 1,
-1.679376, -0.4820724, -1.159346, 1, 0.2627451, 0, 1,
-1.675386, -0.8750681, 1.029236, 1, 0.2705882, 0, 1,
-1.669348, -0.1045299, -1.521911, 1, 0.2745098, 0, 1,
-1.657429, -0.5297172, -2.848276, 1, 0.282353, 0, 1,
-1.654552, 2.368626, -0.3292192, 1, 0.2862745, 0, 1,
-1.634939, 0.4737472, -1.44326, 1, 0.2941177, 0, 1,
-1.63447, 1.275327, -2.086499, 1, 0.3019608, 0, 1,
-1.625529, 0.4009577, -1.442495, 1, 0.3058824, 0, 1,
-1.623927, 0.4910308, -1.794265, 1, 0.3137255, 0, 1,
-1.622445, -0.6821221, -0.8827422, 1, 0.3176471, 0, 1,
-1.610518, -0.1361394, -1.683941, 1, 0.3254902, 0, 1,
-1.589082, 0.4024788, -1.58163, 1, 0.3294118, 0, 1,
-1.583901, -0.3351941, -0.9614054, 1, 0.3372549, 0, 1,
-1.56962, 0.06682467, -2.787157, 1, 0.3411765, 0, 1,
-1.569202, 0.2751171, -0.3842231, 1, 0.3490196, 0, 1,
-1.563821, -0.6760668, -2.79696, 1, 0.3529412, 0, 1,
-1.561368, 0.3083654, -2.703027, 1, 0.3607843, 0, 1,
-1.555959, 0.746164, 0.6310034, 1, 0.3647059, 0, 1,
-1.552748, -0.6051684, -1.693654, 1, 0.372549, 0, 1,
-1.550496, -1.803542, -2.277807, 1, 0.3764706, 0, 1,
-1.546332, -0.7427714, -1.644854, 1, 0.3843137, 0, 1,
-1.538974, -0.3651177, -0.5000412, 1, 0.3882353, 0, 1,
-1.537003, 1.294086, 0.1429341, 1, 0.3960784, 0, 1,
-1.53153, -1.138623, -2.470811, 1, 0.4039216, 0, 1,
-1.52701, -0.3595825, -1.985395, 1, 0.4078431, 0, 1,
-1.523687, -1.520487, -2.058323, 1, 0.4156863, 0, 1,
-1.498957, -0.01894419, -1.904173, 1, 0.4196078, 0, 1,
-1.494523, 1.450516, -1.954111, 1, 0.427451, 0, 1,
-1.490999, -0.7868329, -4.248322, 1, 0.4313726, 0, 1,
-1.490963, 0.1271783, -0.6360036, 1, 0.4392157, 0, 1,
-1.474269, 1.208408, -0.6569412, 1, 0.4431373, 0, 1,
-1.458917, 0.2407886, -0.8186301, 1, 0.4509804, 0, 1,
-1.453641, 2.073111, 0.5425262, 1, 0.454902, 0, 1,
-1.449223, 1.861004, -0.3030323, 1, 0.4627451, 0, 1,
-1.447577, -0.1809413, 0.004339079, 1, 0.4666667, 0, 1,
-1.442798, 0.3187825, -0.4165918, 1, 0.4745098, 0, 1,
-1.437602, -0.8732328, -1.017739, 1, 0.4784314, 0, 1,
-1.435526, 0.7992238, -1.204558, 1, 0.4862745, 0, 1,
-1.434047, -1.767229, -4.081491, 1, 0.4901961, 0, 1,
-1.430446, -0.6696435, -2.781937, 1, 0.4980392, 0, 1,
-1.428281, 0.1806011, -1.492165, 1, 0.5058824, 0, 1,
-1.421631, 0.06982143, -2.695979, 1, 0.509804, 0, 1,
-1.406355, 0.9199744, -0.7994549, 1, 0.5176471, 0, 1,
-1.400678, -1.917271, -4.522753, 1, 0.5215687, 0, 1,
-1.400647, -0.3715521, -0.1246117, 1, 0.5294118, 0, 1,
-1.386848, -0.7308846, -1.483427, 1, 0.5333334, 0, 1,
-1.384665, -1.414953, -1.54139, 1, 0.5411765, 0, 1,
-1.367838, 0.3215029, -0.3761321, 1, 0.5450981, 0, 1,
-1.355865, -0.7091771, -1.83066, 1, 0.5529412, 0, 1,
-1.349213, -0.8055844, -2.211607, 1, 0.5568628, 0, 1,
-1.346323, 0.7615193, -2.497352, 1, 0.5647059, 0, 1,
-1.345226, 1.902394, -0.9103283, 1, 0.5686275, 0, 1,
-1.338152, 0.9196247, -2.285895, 1, 0.5764706, 0, 1,
-1.337469, -0.3448519, -1.857011, 1, 0.5803922, 0, 1,
-1.333498, -0.93266, -1.700583, 1, 0.5882353, 0, 1,
-1.325566, -0.3435127, -1.416624, 1, 0.5921569, 0, 1,
-1.3088, -0.1564177, -2.423119, 1, 0.6, 0, 1,
-1.304149, -0.591323, -2.226178, 1, 0.6078432, 0, 1,
-1.294376, 1.924112, -0.7156902, 1, 0.6117647, 0, 1,
-1.288757, 1.982282, -0.3588088, 1, 0.6196079, 0, 1,
-1.282898, 0.3367888, -0.2868287, 1, 0.6235294, 0, 1,
-1.280136, -0.2968317, -2.119181, 1, 0.6313726, 0, 1,
-1.264544, -1.037889, -2.407122, 1, 0.6352941, 0, 1,
-1.260295, 0.3179696, -1.037406, 1, 0.6431373, 0, 1,
-1.257468, 2.321245, -0.7496127, 1, 0.6470588, 0, 1,
-1.253208, 0.1808198, -1.400564, 1, 0.654902, 0, 1,
-1.246771, -0.8368163, -2.093551, 1, 0.6588235, 0, 1,
-1.233147, -0.9257236, -1.073225, 1, 0.6666667, 0, 1,
-1.207579, -0.9355114, -3.607962, 1, 0.6705883, 0, 1,
-1.206931, 1.329388, 0.113294, 1, 0.6784314, 0, 1,
-1.20393, 0.1180754, -2.913942, 1, 0.682353, 0, 1,
-1.199797, 0.8185924, -1.08724, 1, 0.6901961, 0, 1,
-1.197718, 1.301653, -0.8166871, 1, 0.6941177, 0, 1,
-1.193136, -1.357686, -3.326796, 1, 0.7019608, 0, 1,
-1.188845, 0.4682654, -2.82137, 1, 0.7098039, 0, 1,
-1.17263, -1.112137, -1.522161, 1, 0.7137255, 0, 1,
-1.171573, 0.004943329, -2.129532, 1, 0.7215686, 0, 1,
-1.162356, 1.575759, -1.070226, 1, 0.7254902, 0, 1,
-1.157423, 1.52676, 1.183553, 1, 0.7333333, 0, 1,
-1.15472, -0.549585, -1.27387, 1, 0.7372549, 0, 1,
-1.150998, 1.11169, 0.7172381, 1, 0.7450981, 0, 1,
-1.143069, -0.5918236, -1.342083, 1, 0.7490196, 0, 1,
-1.141921, 0.6963663, -1.111839, 1, 0.7568628, 0, 1,
-1.141766, -1.412071, -1.905578, 1, 0.7607843, 0, 1,
-1.139008, 0.2608501, -1.602904, 1, 0.7686275, 0, 1,
-1.132996, 0.0359526, -0.7696569, 1, 0.772549, 0, 1,
-1.127214, 0.1174391, -1.315072, 1, 0.7803922, 0, 1,
-1.121795, -1.590528, -2.383007, 1, 0.7843137, 0, 1,
-1.119108, 0.4330045, -1.231795, 1, 0.7921569, 0, 1,
-1.116392, -2.194277, -1.860655, 1, 0.7960784, 0, 1,
-1.111963, -1.80814, -0.8041468, 1, 0.8039216, 0, 1,
-1.098957, 0.5151103, -1.969987, 1, 0.8117647, 0, 1,
-1.093735, 0.2605349, -3.019962, 1, 0.8156863, 0, 1,
-1.087999, 0.2786689, -1.39314, 1, 0.8235294, 0, 1,
-1.082983, -0.5044664, -1.588287, 1, 0.827451, 0, 1,
-1.078349, 1.037611, -1.432331, 1, 0.8352941, 0, 1,
-1.074725, -0.5822368, -1.818522, 1, 0.8392157, 0, 1,
-1.072106, 0.222163, -1.73307, 1, 0.8470588, 0, 1,
-1.068642, 0.536521, -1.175297, 1, 0.8509804, 0, 1,
-1.06752, -0.7567539, -1.935945, 1, 0.8588235, 0, 1,
-1.066384, 0.2761688, -1.619115, 1, 0.8627451, 0, 1,
-1.065812, 1.365356, 0.5634843, 1, 0.8705882, 0, 1,
-1.065168, -1.92012, -3.986189, 1, 0.8745098, 0, 1,
-1.063739, -1.062379, -3.168801, 1, 0.8823529, 0, 1,
-1.063056, -2.169856, -2.466664, 1, 0.8862745, 0, 1,
-1.061669, 0.3042139, -2.325191, 1, 0.8941177, 0, 1,
-1.060488, -1.069249, -2.596387, 1, 0.8980392, 0, 1,
-1.047436, -0.1998981, 1.580422, 1, 0.9058824, 0, 1,
-1.044905, 1.373444, 0.1076849, 1, 0.9137255, 0, 1,
-1.038778, -1.695806, -1.879737, 1, 0.9176471, 0, 1,
-1.031797, -2.201492, -1.723923, 1, 0.9254902, 0, 1,
-1.02823, 0.6688699, 0.3158823, 1, 0.9294118, 0, 1,
-1.02539, -0.220803, -1.725454, 1, 0.9372549, 0, 1,
-1.019314, 0.01112738, -2.905991, 1, 0.9411765, 0, 1,
-1.014939, -0.01764641, -2.209684, 1, 0.9490196, 0, 1,
-1.011543, -0.1297177, -0.6143477, 1, 0.9529412, 0, 1,
-1.004523, -1.741112, -1.881568, 1, 0.9607843, 0, 1,
-1.004304, -0.053923, -2.363065, 1, 0.9647059, 0, 1,
-0.9996361, -0.8302756, -1.80998, 1, 0.972549, 0, 1,
-0.9968628, 1.405118, -0.9478386, 1, 0.9764706, 0, 1,
-0.9958687, 2.134835, -1.338517, 1, 0.9843137, 0, 1,
-0.9885114, -1.602106, -1.714308, 1, 0.9882353, 0, 1,
-0.9872312, -0.1342335, -3.295604, 1, 0.9960784, 0, 1,
-0.986931, -1.354074, -2.816162, 0.9960784, 1, 0, 1,
-0.9829701, 0.345575, -2.214606, 0.9921569, 1, 0, 1,
-0.9784271, 0.4036912, -1.189071, 0.9843137, 1, 0, 1,
-0.9726602, -1.577633, -1.385023, 0.9803922, 1, 0, 1,
-0.9721776, -1.053382, 0.2479756, 0.972549, 1, 0, 1,
-0.9698861, -0.5796791, -1.457106, 0.9686275, 1, 0, 1,
-0.9677792, 1.651206, 0.5267929, 0.9607843, 1, 0, 1,
-0.96128, -0.4456609, -1.458396, 0.9568627, 1, 0, 1,
-0.9574488, 0.4646542, 0.05686848, 0.9490196, 1, 0, 1,
-0.9567176, -0.1930887, -1.798001, 0.945098, 1, 0, 1,
-0.9508837, -1.136691, -2.432041, 0.9372549, 1, 0, 1,
-0.9438238, -0.3552899, -1.400676, 0.9333333, 1, 0, 1,
-0.9382174, -0.3639553, -1.435983, 0.9254902, 1, 0, 1,
-0.9311354, -0.1272778, -1.913128, 0.9215686, 1, 0, 1,
-0.9302578, 0.8126297, -1.359514, 0.9137255, 1, 0, 1,
-0.9284745, -1.178319, -3.342171, 0.9098039, 1, 0, 1,
-0.9284738, -0.7551458, -1.494562, 0.9019608, 1, 0, 1,
-0.9276245, -0.3374125, -2.735563, 0.8941177, 1, 0, 1,
-0.9263297, -0.9888369, -0.7997123, 0.8901961, 1, 0, 1,
-0.9245525, -1.69485, -1.775858, 0.8823529, 1, 0, 1,
-0.9177085, 0.4535929, -1.031122, 0.8784314, 1, 0, 1,
-0.91424, 0.8196371, -2.346266, 0.8705882, 1, 0, 1,
-0.9130212, 0.6431308, -2.219482, 0.8666667, 1, 0, 1,
-0.9080338, 0.1869465, -2.729039, 0.8588235, 1, 0, 1,
-0.8954552, -0.5334507, -1.099345, 0.854902, 1, 0, 1,
-0.8900108, -0.0855717, -4.047284, 0.8470588, 1, 0, 1,
-0.8879177, -0.02327666, -2.547047, 0.8431373, 1, 0, 1,
-0.8863912, 1.435039, -1.982665, 0.8352941, 1, 0, 1,
-0.8841456, 0.6867093, -0.7497567, 0.8313726, 1, 0, 1,
-0.8838982, 1.501236, -0.8808341, 0.8235294, 1, 0, 1,
-0.8783083, -1.391472, -1.867415, 0.8196079, 1, 0, 1,
-0.8759866, 0.7819021, -0.5540026, 0.8117647, 1, 0, 1,
-0.8743103, -0.1651917, -2.542705, 0.8078431, 1, 0, 1,
-0.8661952, 0.07004023, -1.004994, 0.8, 1, 0, 1,
-0.8582633, 0.6178576, -1.452974, 0.7921569, 1, 0, 1,
-0.8575115, -1.609091, -2.345128, 0.7882353, 1, 0, 1,
-0.8575113, 0.3454252, -0.04623544, 0.7803922, 1, 0, 1,
-0.8522559, 0.4215109, -1.738943, 0.7764706, 1, 0, 1,
-0.8489137, -0.5047317, -1.548029, 0.7686275, 1, 0, 1,
-0.8458458, 0.07378868, -0.769588, 0.7647059, 1, 0, 1,
-0.8441028, -0.6076899, -1.111771, 0.7568628, 1, 0, 1,
-0.8412898, 0.363845, -0.3021591, 0.7529412, 1, 0, 1,
-0.8386042, -0.1294055, -2.894608, 0.7450981, 1, 0, 1,
-0.8370791, 0.5741822, -1.379178, 0.7411765, 1, 0, 1,
-0.819513, 0.628926, -1.292395, 0.7333333, 1, 0, 1,
-0.8179118, -0.2485296, -1.176616, 0.7294118, 1, 0, 1,
-0.8176786, 0.9851948, -0.5129445, 0.7215686, 1, 0, 1,
-0.8171057, -0.4196446, -0.9746898, 0.7176471, 1, 0, 1,
-0.8163267, 0.7195315, -0.3314067, 0.7098039, 1, 0, 1,
-0.8124794, -0.07680818, -2.934974, 0.7058824, 1, 0, 1,
-0.8053041, -0.361167, -2.112393, 0.6980392, 1, 0, 1,
-0.8022265, -0.3467802, -0.442382, 0.6901961, 1, 0, 1,
-0.8001902, 0.2321679, -1.594478, 0.6862745, 1, 0, 1,
-0.796289, -0.6959786, -3.023913, 0.6784314, 1, 0, 1,
-0.7954345, 0.7777454, 0.394069, 0.6745098, 1, 0, 1,
-0.7923621, 0.6942158, -0.4868148, 0.6666667, 1, 0, 1,
-0.785453, 0.2556198, -1.668537, 0.6627451, 1, 0, 1,
-0.785307, 0.9401828, -1.287311, 0.654902, 1, 0, 1,
-0.7831742, 0.7012762, -0.6756585, 0.6509804, 1, 0, 1,
-0.782002, 0.1565852, -0.7217247, 0.6431373, 1, 0, 1,
-0.7808764, 0.7194191, -0.3646295, 0.6392157, 1, 0, 1,
-0.7690275, -1.296468, -3.613916, 0.6313726, 1, 0, 1,
-0.7685111, -0.4789076, -2.828313, 0.627451, 1, 0, 1,
-0.7665173, -0.9383309, -3.06225, 0.6196079, 1, 0, 1,
-0.7608282, 0.6843572, 0.9130309, 0.6156863, 1, 0, 1,
-0.7598221, -2.623729, -2.215316, 0.6078432, 1, 0, 1,
-0.7568906, 0.8331712, 0.2685231, 0.6039216, 1, 0, 1,
-0.7553501, -1.543623, -1.809824, 0.5960785, 1, 0, 1,
-0.7495143, 0.2970589, -0.04571594, 0.5882353, 1, 0, 1,
-0.739237, -0.09409586, -1.39957, 0.5843138, 1, 0, 1,
-0.7341009, -1.176095, -2.035275, 0.5764706, 1, 0, 1,
-0.7334539, 2.007532, 0.3300371, 0.572549, 1, 0, 1,
-0.733408, -0.4466255, 0.07914399, 0.5647059, 1, 0, 1,
-0.7300495, -1.570228, -3.220011, 0.5607843, 1, 0, 1,
-0.716855, -0.8028756, -2.2458, 0.5529412, 1, 0, 1,
-0.7155448, -0.5556088, -1.773186, 0.5490196, 1, 0, 1,
-0.7081295, 0.5125242, -2.943231, 0.5411765, 1, 0, 1,
-0.7011139, -0.30645, -3.473825, 0.5372549, 1, 0, 1,
-0.7009589, 0.683894, 1.114561, 0.5294118, 1, 0, 1,
-0.6992628, -0.6012491, -2.323715, 0.5254902, 1, 0, 1,
-0.6964999, 0.9118271, -1.109414, 0.5176471, 1, 0, 1,
-0.6951962, -0.0514175, -3.118932, 0.5137255, 1, 0, 1,
-0.694775, 0.1745211, -0.7885042, 0.5058824, 1, 0, 1,
-0.6932023, -0.3658028, -2.891672, 0.5019608, 1, 0, 1,
-0.687398, -0.08250213, -2.113516, 0.4941176, 1, 0, 1,
-0.6784889, 1.87532, 0.8151769, 0.4862745, 1, 0, 1,
-0.6714447, 0.9179999, 1.079802, 0.4823529, 1, 0, 1,
-0.6677363, -0.2562949, -3.429195, 0.4745098, 1, 0, 1,
-0.6604242, 0.4982786, -1.301444, 0.4705882, 1, 0, 1,
-0.6552301, -1.4732, -2.431074, 0.4627451, 1, 0, 1,
-0.6500822, -0.06397516, -1.133481, 0.4588235, 1, 0, 1,
-0.6457503, 1.015912, 0.3624986, 0.4509804, 1, 0, 1,
-0.6436258, -0.631656, -1.423296, 0.4470588, 1, 0, 1,
-0.6429056, -0.1386742, -0.4333983, 0.4392157, 1, 0, 1,
-0.6405624, 0.7460026, -0.3468002, 0.4352941, 1, 0, 1,
-0.6397617, -0.1214864, -2.739328, 0.427451, 1, 0, 1,
-0.6390635, 1.62081, 0.600126, 0.4235294, 1, 0, 1,
-0.6373808, 1.739036, -1.941583, 0.4156863, 1, 0, 1,
-0.6324778, 0.7020058, 1.716825, 0.4117647, 1, 0, 1,
-0.6217443, -0.2164874, -0.887458, 0.4039216, 1, 0, 1,
-0.6203161, 0.7322419, -1.066282, 0.3960784, 1, 0, 1,
-0.6198521, 1.745792, 1.553036, 0.3921569, 1, 0, 1,
-0.6170083, -1.050435, -1.979662, 0.3843137, 1, 0, 1,
-0.6128126, 0.2379882, -1.884179, 0.3803922, 1, 0, 1,
-0.6117321, 1.295226, -0.5713651, 0.372549, 1, 0, 1,
-0.6097475, -0.2336625, -1.733741, 0.3686275, 1, 0, 1,
-0.6083339, 0.9451331, 0.3342718, 0.3607843, 1, 0, 1,
-0.6077058, 2.389971, -0.02126063, 0.3568628, 1, 0, 1,
-0.5981997, -1.136745, 0.581432, 0.3490196, 1, 0, 1,
-0.5963065, -0.3397199, -1.976324, 0.345098, 1, 0, 1,
-0.5956635, 0.5642269, -1.107468, 0.3372549, 1, 0, 1,
-0.5955175, 1.049822, -1.369357, 0.3333333, 1, 0, 1,
-0.5913272, -1.488084, -1.907126, 0.3254902, 1, 0, 1,
-0.589515, 0.2020683, -2.344438, 0.3215686, 1, 0, 1,
-0.5879418, -0.1914172, -0.6001925, 0.3137255, 1, 0, 1,
-0.5867102, -1.753879, -1.742407, 0.3098039, 1, 0, 1,
-0.574065, 0.06131878, -1.860302, 0.3019608, 1, 0, 1,
-0.5738541, 0.2196822, -1.581345, 0.2941177, 1, 0, 1,
-0.5690802, -1.628183, -3.431608, 0.2901961, 1, 0, 1,
-0.5607396, -0.6441504, -3.180075, 0.282353, 1, 0, 1,
-0.5600131, 0.2499359, -1.028537, 0.2784314, 1, 0, 1,
-0.5580117, 0.6464102, -0.02182562, 0.2705882, 1, 0, 1,
-0.5561905, -0.3587154, -2.680054, 0.2666667, 1, 0, 1,
-0.5536704, -1.816154, -1.860052, 0.2588235, 1, 0, 1,
-0.5507727, 0.4339721, -0.04723013, 0.254902, 1, 0, 1,
-0.5488852, -1.365924, -2.224259, 0.2470588, 1, 0, 1,
-0.5486971, 1.092167, 0.2576202, 0.2431373, 1, 0, 1,
-0.5465705, 0.03353285, -1.291135, 0.2352941, 1, 0, 1,
-0.5451787, -1.371917, -1.73682, 0.2313726, 1, 0, 1,
-0.5451322, 0.1013981, -1.737772, 0.2235294, 1, 0, 1,
-0.5391656, -2.374186, -3.255375, 0.2196078, 1, 0, 1,
-0.5355961, -2.140871, -1.570919, 0.2117647, 1, 0, 1,
-0.5318124, -0.1426893, -2.339839, 0.2078431, 1, 0, 1,
-0.530497, -0.6198878, -2.988086, 0.2, 1, 0, 1,
-0.5288953, -1.014063, -2.610638, 0.1921569, 1, 0, 1,
-0.5271039, -1.506755, -3.587011, 0.1882353, 1, 0, 1,
-0.5257795, 1.043055, -0.2966099, 0.1803922, 1, 0, 1,
-0.5241896, 0.3821954, -1.58425, 0.1764706, 1, 0, 1,
-0.518719, 0.8719238, 1.77089, 0.1686275, 1, 0, 1,
-0.5186998, 0.2942294, -0.449354, 0.1647059, 1, 0, 1,
-0.517513, 0.2179154, -3.24011, 0.1568628, 1, 0, 1,
-0.5172037, -0.4738235, -2.060363, 0.1529412, 1, 0, 1,
-0.5164247, 0.2418958, -2.95739, 0.145098, 1, 0, 1,
-0.5160018, -1.452106, -2.411487, 0.1411765, 1, 0, 1,
-0.5154232, -0.2302325, -3.755324, 0.1333333, 1, 0, 1,
-0.5149821, -1.067048, -3.309532, 0.1294118, 1, 0, 1,
-0.5145071, 2.423105, -1.647396, 0.1215686, 1, 0, 1,
-0.5133042, -0.935214, -0.9574043, 0.1176471, 1, 0, 1,
-0.5107791, 0.7945126, -0.2756965, 0.1098039, 1, 0, 1,
-0.5085722, 0.03014472, -0.7371867, 0.1058824, 1, 0, 1,
-0.5049876, 0.7645332, -0.7260218, 0.09803922, 1, 0, 1,
-0.5039108, -0.6847449, -1.095752, 0.09019608, 1, 0, 1,
-0.5010036, 0.5442078, -0.4713627, 0.08627451, 1, 0, 1,
-0.5003533, 0.8660805, 1.089194, 0.07843138, 1, 0, 1,
-0.4951841, 1.188218, 0.745868, 0.07450981, 1, 0, 1,
-0.4941375, 0.1923131, -1.37884, 0.06666667, 1, 0, 1,
-0.4892837, -0.2481418, -1.126245, 0.0627451, 1, 0, 1,
-0.4829086, 0.4863728, -0.3176833, 0.05490196, 1, 0, 1,
-0.4795591, -0.6470759, -1.346837, 0.05098039, 1, 0, 1,
-0.4790089, 1.549572, 0.9066404, 0.04313726, 1, 0, 1,
-0.4766262, 0.2754952, -0.8234605, 0.03921569, 1, 0, 1,
-0.474167, 0.2900841, -0.8859382, 0.03137255, 1, 0, 1,
-0.4736821, -0.6027243, -3.088546, 0.02745098, 1, 0, 1,
-0.4724898, -0.02260325, -1.231729, 0.01960784, 1, 0, 1,
-0.4702189, -1.357272, -3.505555, 0.01568628, 1, 0, 1,
-0.467307, -0.3433207, -1.640903, 0.007843138, 1, 0, 1,
-0.4669888, 0.2994241, -1.994755, 0.003921569, 1, 0, 1,
-0.4601202, -1.481392, -2.420832, 0, 1, 0.003921569, 1,
-0.4567182, 0.9822662, -2.443336, 0, 1, 0.01176471, 1,
-0.4524635, -1.191685, -0.6471684, 0, 1, 0.01568628, 1,
-0.4499553, -0.2102939, -1.766321, 0, 1, 0.02352941, 1,
-0.448673, 0.3138477, -1.158711, 0, 1, 0.02745098, 1,
-0.4467328, -0.5380484, -4.554268, 0, 1, 0.03529412, 1,
-0.4424559, 0.6815051, -2.124939, 0, 1, 0.03921569, 1,
-0.4412812, -1.122388, -3.953187, 0, 1, 0.04705882, 1,
-0.4354248, -0.4134676, -1.375267, 0, 1, 0.05098039, 1,
-0.4324685, -0.911101, -0.7792383, 0, 1, 0.05882353, 1,
-0.4293457, 0.04569763, -1.044612, 0, 1, 0.0627451, 1,
-0.4272507, -0.3248477, -1.827089, 0, 1, 0.07058824, 1,
-0.4260363, 3.13486, -1.353484, 0, 1, 0.07450981, 1,
-0.4222562, -1.08528, -3.687358, 0, 1, 0.08235294, 1,
-0.4168983, 0.421104, -1.786815, 0, 1, 0.08627451, 1,
-0.4146332, 0.04454219, -1.25445, 0, 1, 0.09411765, 1,
-0.4115099, -1.108118, -1.666184, 0, 1, 0.1019608, 1,
-0.4112873, 1.16336, -0.3692499, 0, 1, 0.1058824, 1,
-0.4059416, -1.102899, -3.654959, 0, 1, 0.1137255, 1,
-0.4058491, -1.319797, -1.629043, 0, 1, 0.1176471, 1,
-0.4058375, 1.674149, 0.8336881, 0, 1, 0.1254902, 1,
-0.4051335, 0.5163863, 0.1088136, 0, 1, 0.1294118, 1,
-0.4032314, 1.406707, 0.706691, 0, 1, 0.1372549, 1,
-0.4019689, -0.1298986, -2.35083, 0, 1, 0.1411765, 1,
-0.3998878, -2.252434, -2.789709, 0, 1, 0.1490196, 1,
-0.395581, -0.5366282, -2.732838, 0, 1, 0.1529412, 1,
-0.3949867, 1.140735, 1.233304, 0, 1, 0.1607843, 1,
-0.3947549, 0.3195779, -2.281853, 0, 1, 0.1647059, 1,
-0.391167, 1.980489, 0.618477, 0, 1, 0.172549, 1,
-0.3875644, -1.103526, -0.6895006, 0, 1, 0.1764706, 1,
-0.3800306, 1.11413, -0.9937841, 0, 1, 0.1843137, 1,
-0.3784447, 0.06884412, -0.5285591, 0, 1, 0.1882353, 1,
-0.3775052, 0.530233, -1.879086, 0, 1, 0.1960784, 1,
-0.3741569, 0.8131294, -0.1174215, 0, 1, 0.2039216, 1,
-0.3684466, -0.4195692, -2.220361, 0, 1, 0.2078431, 1,
-0.3668069, -1.644879, -3.810223, 0, 1, 0.2156863, 1,
-0.3634724, 1.557814, -0.7191992, 0, 1, 0.2196078, 1,
-0.3563501, 0.18238, -2.483144, 0, 1, 0.227451, 1,
-0.3524535, 0.3444634, -1.643131, 0, 1, 0.2313726, 1,
-0.3516209, 0.770237, 1.220361, 0, 1, 0.2392157, 1,
-0.3514251, -2.259269, -4.653664, 0, 1, 0.2431373, 1,
-0.3476637, -0.4013518, -2.478241, 0, 1, 0.2509804, 1,
-0.3459939, 0.7907814, -0.4186239, 0, 1, 0.254902, 1,
-0.3408889, 0.08042526, -1.013988, 0, 1, 0.2627451, 1,
-0.3408128, 0.1183015, -0.08736145, 0, 1, 0.2666667, 1,
-0.340212, 0.5731903, 0.2729522, 0, 1, 0.2745098, 1,
-0.3373147, 0.9045964, -1.159721, 0, 1, 0.2784314, 1,
-0.3331509, 1.556965, -0.4342552, 0, 1, 0.2862745, 1,
-0.3329931, 0.9740089, -0.3098543, 0, 1, 0.2901961, 1,
-0.3307632, -1.480606, -1.495, 0, 1, 0.2980392, 1,
-0.3296947, -0.4712585, -1.341275, 0, 1, 0.3058824, 1,
-0.3273286, -1.738995, -4.046782, 0, 1, 0.3098039, 1,
-0.3261506, 1.411177, -0.7427831, 0, 1, 0.3176471, 1,
-0.3254103, 2.204061, 0.2337941, 0, 1, 0.3215686, 1,
-0.3198525, -0.5225333, -2.200682, 0, 1, 0.3294118, 1,
-0.3166438, 0.2862749, -2.226933, 0, 1, 0.3333333, 1,
-0.3149883, 0.2938207, 1.072804, 0, 1, 0.3411765, 1,
-0.3076819, -0.7016987, -2.326287, 0, 1, 0.345098, 1,
-0.3024285, -0.05492831, -2.701017, 0, 1, 0.3529412, 1,
-0.2967967, 1.538853, -0.5926324, 0, 1, 0.3568628, 1,
-0.2934581, 0.136274, -1.841566, 0, 1, 0.3647059, 1,
-0.2917457, 0.02887996, -2.933538, 0, 1, 0.3686275, 1,
-0.2915629, 1.600828, 0.5598587, 0, 1, 0.3764706, 1,
-0.2912237, 0.5193862, -0.8296777, 0, 1, 0.3803922, 1,
-0.2904797, 1.289298, -0.06490035, 0, 1, 0.3882353, 1,
-0.2897833, -0.7785814, -1.085322, 0, 1, 0.3921569, 1,
-0.2888067, -0.5655865, -3.607189, 0, 1, 0.4, 1,
-0.2748111, 0.976832, 0.08335181, 0, 1, 0.4078431, 1,
-0.273037, -0.00944869, -0.4417677, 0, 1, 0.4117647, 1,
-0.2727206, -1.765204, -4.124334, 0, 1, 0.4196078, 1,
-0.2716768, -0.2389864, -3.375561, 0, 1, 0.4235294, 1,
-0.2683652, -0.9336005, -2.728, 0, 1, 0.4313726, 1,
-0.2682553, -1.59817, -3.537099, 0, 1, 0.4352941, 1,
-0.2652344, 0.3461419, -0.8127955, 0, 1, 0.4431373, 1,
-0.2617298, -0.07695826, -2.707269, 0, 1, 0.4470588, 1,
-0.2580776, 0.3831362, 0.6781458, 0, 1, 0.454902, 1,
-0.2578068, 0.1719127, -2.216796, 0, 1, 0.4588235, 1,
-0.2542985, -1.182215, -4.430701, 0, 1, 0.4666667, 1,
-0.2452713, 0.2437643, -0.2807789, 0, 1, 0.4705882, 1,
-0.2437602, -0.1639125, -2.126975, 0, 1, 0.4784314, 1,
-0.2422422, -1.239339, -3.041613, 0, 1, 0.4823529, 1,
-0.2407068, 1.858817, -1.095371, 0, 1, 0.4901961, 1,
-0.2396636, 1.550856, 1.139425, 0, 1, 0.4941176, 1,
-0.2375612, 1.504602, -0.563547, 0, 1, 0.5019608, 1,
-0.235168, -0.00954342, -1.332326, 0, 1, 0.509804, 1,
-0.2350256, 0.2151289, -0.8209916, 0, 1, 0.5137255, 1,
-0.2300423, -1.250641, -2.814731, 0, 1, 0.5215687, 1,
-0.2275912, -0.09158743, -2.820135, 0, 1, 0.5254902, 1,
-0.2261624, 1.56344, -0.7191954, 0, 1, 0.5333334, 1,
-0.2246338, -1.267567, -3.424179, 0, 1, 0.5372549, 1,
-0.2245774, -0.8040007, -3.828904, 0, 1, 0.5450981, 1,
-0.2235191, -0.9823782, -2.447871, 0, 1, 0.5490196, 1,
-0.2222487, 0.6899976, -0.6925868, 0, 1, 0.5568628, 1,
-0.2194097, 0.5643794, -0.7441789, 0, 1, 0.5607843, 1,
-0.2164959, -0.5010777, -4.292427, 0, 1, 0.5686275, 1,
-0.216043, -0.4137489, -3.646464, 0, 1, 0.572549, 1,
-0.2144473, 1.664134, -0.1050274, 0, 1, 0.5803922, 1,
-0.2107253, -0.3640422, -3.392513, 0, 1, 0.5843138, 1,
-0.2092847, 0.874011, -1.265414, 0, 1, 0.5921569, 1,
-0.205385, 0.5713658, -0.08115698, 0, 1, 0.5960785, 1,
-0.1980501, 1.770543, 1.556929, 0, 1, 0.6039216, 1,
-0.1959067, -1.218602, -1.147163, 0, 1, 0.6117647, 1,
-0.1901959, -0.900699, -2.268883, 0, 1, 0.6156863, 1,
-0.1889494, 1.041145, -0.324193, 0, 1, 0.6235294, 1,
-0.1884867, 1.531935, -0.5583739, 0, 1, 0.627451, 1,
-0.1868302, -1.116481, -4.586549, 0, 1, 0.6352941, 1,
-0.185952, -0.8835366, -3.177434, 0, 1, 0.6392157, 1,
-0.1858452, -0.02716434, 0.9410257, 0, 1, 0.6470588, 1,
-0.1829718, -1.840034, -2.899876, 0, 1, 0.6509804, 1,
-0.1807864, -1.0292, -1.860018, 0, 1, 0.6588235, 1,
-0.1775937, -0.5427693, -2.862049, 0, 1, 0.6627451, 1,
-0.1769597, -1.79961, -3.899552, 0, 1, 0.6705883, 1,
-0.1538568, 1.134842, 1.038223, 0, 1, 0.6745098, 1,
-0.1509983, -1.721877, -3.244699, 0, 1, 0.682353, 1,
-0.1509798, 0.3044308, -0.8063868, 0, 1, 0.6862745, 1,
-0.1501139, -0.2474013, -0.9601888, 0, 1, 0.6941177, 1,
-0.1460816, -1.326703, -4.989936, 0, 1, 0.7019608, 1,
-0.145024, -0.9430445, -3.432905, 0, 1, 0.7058824, 1,
-0.1441814, -0.4954946, -2.767723, 0, 1, 0.7137255, 1,
-0.1418221, 0.1545282, -1.0431, 0, 1, 0.7176471, 1,
-0.1397414, -0.5483413, -4.179558, 0, 1, 0.7254902, 1,
-0.1352046, -1.402466, -3.068963, 0, 1, 0.7294118, 1,
-0.1348724, -0.7797176, -3.64317, 0, 1, 0.7372549, 1,
-0.1343067, 0.8367416, 0.6003746, 0, 1, 0.7411765, 1,
-0.1334005, -0.1790498, -2.576829, 0, 1, 0.7490196, 1,
-0.1299536, -1.930757, -2.983784, 0, 1, 0.7529412, 1,
-0.1284987, -0.09872494, -1.739484, 0, 1, 0.7607843, 1,
-0.1245318, 1.263465, -1.495446, 0, 1, 0.7647059, 1,
-0.1235085, -0.2462195, -3.798321, 0, 1, 0.772549, 1,
-0.1224658, -0.7952751, -1.931432, 0, 1, 0.7764706, 1,
-0.121502, -0.7365061, -3.289492, 0, 1, 0.7843137, 1,
-0.1214462, -0.05232543, -2.085733, 0, 1, 0.7882353, 1,
-0.1174368, 0.4864263, -0.06629283, 0, 1, 0.7960784, 1,
-0.1158202, -1.229645, -2.714007, 0, 1, 0.8039216, 1,
-0.1135512, 1.562213, 2.174034, 0, 1, 0.8078431, 1,
-0.1108491, -0.09644563, -2.824009, 0, 1, 0.8156863, 1,
-0.1085558, -0.6336462, -3.886184, 0, 1, 0.8196079, 1,
-0.1083774, -0.9597399, -3.507841, 0, 1, 0.827451, 1,
-0.09464668, -1.200765, -2.683834, 0, 1, 0.8313726, 1,
-0.09416519, 0.5930033, -0.05607404, 0, 1, 0.8392157, 1,
-0.09062152, -1.251912, -3.221734, 0, 1, 0.8431373, 1,
-0.09024745, -0.3878241, -3.69576, 0, 1, 0.8509804, 1,
-0.09016373, -0.1521832, -2.461395, 0, 1, 0.854902, 1,
-0.07942417, 0.6591307, 0.3764343, 0, 1, 0.8627451, 1,
-0.07185074, -0.4969121, -3.715495, 0, 1, 0.8666667, 1,
-0.07179338, -0.5846936, -2.618333, 0, 1, 0.8745098, 1,
-0.06972572, -0.4550013, -3.209278, 0, 1, 0.8784314, 1,
-0.06822672, 0.1134311, 0.02159702, 0, 1, 0.8862745, 1,
-0.06470688, -0.7261006, -3.286618, 0, 1, 0.8901961, 1,
-0.06020138, 0.295739, -1.232657, 0, 1, 0.8980392, 1,
-0.05821245, -0.1699684, -3.203472, 0, 1, 0.9058824, 1,
-0.05750439, 0.08623446, 0.2130725, 0, 1, 0.9098039, 1,
-0.05623678, 1.070961, 0.1860329, 0, 1, 0.9176471, 1,
-0.05298104, -0.6863953, -3.991384, 0, 1, 0.9215686, 1,
-0.05068377, -1.450586, -3.150045, 0, 1, 0.9294118, 1,
-0.05064078, -1.054982, -1.870659, 0, 1, 0.9333333, 1,
-0.04796187, 1.340659, 0.3373753, 0, 1, 0.9411765, 1,
-0.04223254, 0.1961614, 0.7912657, 0, 1, 0.945098, 1,
-0.03134735, 1.027573, 0.463356, 0, 1, 0.9529412, 1,
-0.02782912, 0.9305778, -0.296196, 0, 1, 0.9568627, 1,
-0.02681746, -1.151803, -2.52844, 0, 1, 0.9647059, 1,
-0.02623716, -0.7663105, -4.028074, 0, 1, 0.9686275, 1,
-0.02468859, -1.52952, -1.65781, 0, 1, 0.9764706, 1,
-0.02381728, -2.457719, -5.351728, 0, 1, 0.9803922, 1,
-0.0237044, -0.1751964, -3.39856, 0, 1, 0.9882353, 1,
-0.02329591, -0.4649884, -4.786808, 0, 1, 0.9921569, 1,
-0.0217995, -2.941971, -1.552134, 0, 1, 1, 1,
-0.02137878, -1.004037, -3.444623, 0, 0.9921569, 1, 1,
-0.01973722, -0.3437416, -1.21044, 0, 0.9882353, 1, 1,
-0.01756353, 1.022728, 1.670391, 0, 0.9803922, 1, 1,
-0.01643922, -0.3699461, -3.192041, 0, 0.9764706, 1, 1,
-0.01429652, 0.7449046, -0.7994029, 0, 0.9686275, 1, 1,
-0.01014339, -1.28121, -2.645678, 0, 0.9647059, 1, 1,
-0.009497391, -0.6005915, -3.497153, 0, 0.9568627, 1, 1,
-0.005928063, -0.3553974, -3.297157, 0, 0.9529412, 1, 1,
-0.002967828, -1.17045, -3.600107, 0, 0.945098, 1, 1,
0.002680373, -1.800679, 3.8567, 0, 0.9411765, 1, 1,
0.004362258, 0.7580563, 1.340644, 0, 0.9333333, 1, 1,
0.007961294, -0.5512678, 1.850169, 0, 0.9294118, 1, 1,
0.01230095, 0.935648, 0.7610371, 0, 0.9215686, 1, 1,
0.01530988, 1.259386, 0.6091861, 0, 0.9176471, 1, 1,
0.01693242, -0.3468352, 3.605054, 0, 0.9098039, 1, 1,
0.01779373, 0.2465701, -0.428174, 0, 0.9058824, 1, 1,
0.01958764, -0.528836, 3.349558, 0, 0.8980392, 1, 1,
0.02411873, -0.1605685, 4.710761, 0, 0.8901961, 1, 1,
0.02619481, 1.061832, 1.124291, 0, 0.8862745, 1, 1,
0.02634906, -0.02620124, 3.351752, 0, 0.8784314, 1, 1,
0.02673531, 0.9358492, 0.6725835, 0, 0.8745098, 1, 1,
0.02681192, 0.05385948, 0.2213475, 0, 0.8666667, 1, 1,
0.02724607, -2.382116, 0.9834642, 0, 0.8627451, 1, 1,
0.02891201, -1.535119, 5.338219, 0, 0.854902, 1, 1,
0.02948513, -0.1924383, 3.881301, 0, 0.8509804, 1, 1,
0.0339495, 0.2331053, 0.7597266, 0, 0.8431373, 1, 1,
0.03992385, -2.370852, 2.447624, 0, 0.8392157, 1, 1,
0.04131015, 0.9276743, 0.1616715, 0, 0.8313726, 1, 1,
0.04345107, 0.7784429, 1.422255, 0, 0.827451, 1, 1,
0.04622456, 0.01803684, 0.1268082, 0, 0.8196079, 1, 1,
0.04661271, 1.271943, 0.3328246, 0, 0.8156863, 1, 1,
0.04765426, 0.3351277, -0.1025559, 0, 0.8078431, 1, 1,
0.05132617, -1.970416, 2.590781, 0, 0.8039216, 1, 1,
0.05580696, 1.0269, 0.30991, 0, 0.7960784, 1, 1,
0.05939355, -1.794846, 4.51749, 0, 0.7882353, 1, 1,
0.06019526, -0.843156, 3.140087, 0, 0.7843137, 1, 1,
0.06337022, 0.6490014, -0.05347894, 0, 0.7764706, 1, 1,
0.06489933, -0.02152349, 1.418201, 0, 0.772549, 1, 1,
0.06612545, -1.367908, 3.573979, 0, 0.7647059, 1, 1,
0.06632016, 0.2380192, 0.06660911, 0, 0.7607843, 1, 1,
0.06660321, 0.7768596, -0.3975374, 0, 0.7529412, 1, 1,
0.06745075, 0.2054123, 0.4604329, 0, 0.7490196, 1, 1,
0.06867243, 0.1233937, 1.083132, 0, 0.7411765, 1, 1,
0.07640129, 0.903652, 0.6342955, 0, 0.7372549, 1, 1,
0.0782265, 0.5391887, -0.5741987, 0, 0.7294118, 1, 1,
0.07896292, -0.2744032, 3.863889, 0, 0.7254902, 1, 1,
0.08120581, -0.5167587, 2.479506, 0, 0.7176471, 1, 1,
0.08393367, 0.3852616, 0.3396463, 0, 0.7137255, 1, 1,
0.08849412, 2.075806, 0.4033673, 0, 0.7058824, 1, 1,
0.08868184, 1.112317, 0.3752869, 0, 0.6980392, 1, 1,
0.09274918, 1.613239, 0.6470275, 0, 0.6941177, 1, 1,
0.09406625, 0.3549454, 0.6245754, 0, 0.6862745, 1, 1,
0.094697, -0.02795958, 0.9174446, 0, 0.682353, 1, 1,
0.09554848, -0.3395391, 2.798124, 0, 0.6745098, 1, 1,
0.09687682, 0.4963476, 0.1730855, 0, 0.6705883, 1, 1,
0.09982827, 0.7483287, 1.908928, 0, 0.6627451, 1, 1,
0.09993352, -0.7913927, 3.766628, 0, 0.6588235, 1, 1,
0.1038144, 0.1717144, 0.6408381, 0, 0.6509804, 1, 1,
0.1043754, -1.274547, 3.849639, 0, 0.6470588, 1, 1,
0.1045628, 0.49991, -0.2877348, 0, 0.6392157, 1, 1,
0.1048371, -0.6167657, 4.817813, 0, 0.6352941, 1, 1,
0.1052382, -1.374676, 3.282306, 0, 0.627451, 1, 1,
0.1070217, -1.263207, 2.10183, 0, 0.6235294, 1, 1,
0.1144023, 0.1944758, 2.213949, 0, 0.6156863, 1, 1,
0.1153623, -0.7473468, 2.913492, 0, 0.6117647, 1, 1,
0.1177155, 0.4874701, -0.9161053, 0, 0.6039216, 1, 1,
0.1181369, 0.1511725, 2.624416, 0, 0.5960785, 1, 1,
0.1219704, 0.2830709, 0.7691592, 0, 0.5921569, 1, 1,
0.1230874, 1.027571, 0.2675323, 0, 0.5843138, 1, 1,
0.1255342, 1.008022, 2.162526, 0, 0.5803922, 1, 1,
0.1280025, 3.130005, 0.4222894, 0, 0.572549, 1, 1,
0.1282249, 0.808431, 1.104378, 0, 0.5686275, 1, 1,
0.1292534, -0.6779959, 2.230334, 0, 0.5607843, 1, 1,
0.1321163, -0.1933542, 3.284165, 0, 0.5568628, 1, 1,
0.1325843, -0.6218214, 1.192449, 0, 0.5490196, 1, 1,
0.1360094, -0.293923, 1.72482, 0, 0.5450981, 1, 1,
0.1385519, -0.4693788, 3.429321, 0, 0.5372549, 1, 1,
0.1415726, -0.6658259, 3.129012, 0, 0.5333334, 1, 1,
0.1423402, 0.3551273, 0.8108645, 0, 0.5254902, 1, 1,
0.142501, 0.1991773, 0.9161956, 0, 0.5215687, 1, 1,
0.1430639, 0.2805525, 0.5587279, 0, 0.5137255, 1, 1,
0.1446505, -0.3132373, 2.10295, 0, 0.509804, 1, 1,
0.1488026, 0.6303309, -0.5493531, 0, 0.5019608, 1, 1,
0.1498783, 0.3415259, 0.8206349, 0, 0.4941176, 1, 1,
0.1519907, 1.215623, -1.163253, 0, 0.4901961, 1, 1,
0.157634, 0.2945226, 0.4885497, 0, 0.4823529, 1, 1,
0.1638377, -1.006302, 2.89542, 0, 0.4784314, 1, 1,
0.1664523, 0.9581941, 0.290439, 0, 0.4705882, 1, 1,
0.1671483, 0.1167181, -1.311268, 0, 0.4666667, 1, 1,
0.1692204, 0.8433982, -1.597135, 0, 0.4588235, 1, 1,
0.1734945, 2.057515, 0.2933587, 0, 0.454902, 1, 1,
0.1775696, 0.3831175, 1.362998, 0, 0.4470588, 1, 1,
0.177808, 1.366224, 0.7336573, 0, 0.4431373, 1, 1,
0.1791864, 0.6743716, 0.06471029, 0, 0.4352941, 1, 1,
0.1816777, 0.877116, -0.2228459, 0, 0.4313726, 1, 1,
0.181678, -0.1777368, 1.667406, 0, 0.4235294, 1, 1,
0.1842875, 0.2053376, 1.14089, 0, 0.4196078, 1, 1,
0.1856837, 2.576008, 0.7196953, 0, 0.4117647, 1, 1,
0.1941323, 1.532266, 0.1295884, 0, 0.4078431, 1, 1,
0.1981295, -0.8316112, 1.833977, 0, 0.4, 1, 1,
0.20163, 0.787027, 0.8189046, 0, 0.3921569, 1, 1,
0.2028082, 1.095362, -1.36858, 0, 0.3882353, 1, 1,
0.2058406, -0.3617199, 1.534014, 0, 0.3803922, 1, 1,
0.2086737, -1.101192, 0.153073, 0, 0.3764706, 1, 1,
0.2102055, -0.6743887, 0.9993678, 0, 0.3686275, 1, 1,
0.2223226, -0.9864719, 3.684803, 0, 0.3647059, 1, 1,
0.2254314, -0.3270267, 3.113799, 0, 0.3568628, 1, 1,
0.2278679, 0.524393, -1.385359, 0, 0.3529412, 1, 1,
0.2282188, 0.6681144, -2.230835, 0, 0.345098, 1, 1,
0.2289754, 1.922152, 1.271799, 0, 0.3411765, 1, 1,
0.2315235, 1.087543, 0.2269792, 0, 0.3333333, 1, 1,
0.2321723, 1.943907, 0.385524, 0, 0.3294118, 1, 1,
0.2329809, -1.197568, 4.7854, 0, 0.3215686, 1, 1,
0.2337915, 2.058304, 0.4563933, 0, 0.3176471, 1, 1,
0.2398224, -0.6079612, 2.037585, 0, 0.3098039, 1, 1,
0.2441083, 0.5620894, -0.1316432, 0, 0.3058824, 1, 1,
0.2511297, -0.7157499, 1.44223, 0, 0.2980392, 1, 1,
0.2519934, 2.131274, -1.496239, 0, 0.2901961, 1, 1,
0.2561022, -0.3376105, 1.093128, 0, 0.2862745, 1, 1,
0.2562259, 1.500842, -0.6066002, 0, 0.2784314, 1, 1,
0.2627515, 0.6622006, 1.464419, 0, 0.2745098, 1, 1,
0.2673952, -0.4783845, 3.053637, 0, 0.2666667, 1, 1,
0.2684452, -0.1718152, 2.250904, 0, 0.2627451, 1, 1,
0.2697967, 0.05098083, 2.631734, 0, 0.254902, 1, 1,
0.2703835, -0.4363331, 2.728132, 0, 0.2509804, 1, 1,
0.275214, 1.815369, 0.4397259, 0, 0.2431373, 1, 1,
0.2782402, 0.6584961, -1.019112, 0, 0.2392157, 1, 1,
0.2782834, 1.142083, 0.01350923, 0, 0.2313726, 1, 1,
0.2803048, 0.4965347, 1.362218, 0, 0.227451, 1, 1,
0.2829879, -0.7412094, 4.500482, 0, 0.2196078, 1, 1,
0.2878403, -0.2010754, 2.922272, 0, 0.2156863, 1, 1,
0.2882407, 1.297279, -0.9132541, 0, 0.2078431, 1, 1,
0.2919396, 0.2179988, 0.2309661, 0, 0.2039216, 1, 1,
0.2932365, 0.1364984, 0.3878395, 0, 0.1960784, 1, 1,
0.2941047, -0.8532593, 1.294112, 0, 0.1882353, 1, 1,
0.2977121, -0.129257, 1.819924, 0, 0.1843137, 1, 1,
0.3056134, -0.8692783, 2.301399, 0, 0.1764706, 1, 1,
0.3062908, -1.718421, 4.238806, 0, 0.172549, 1, 1,
0.310795, -1.134973, 3.286913, 0, 0.1647059, 1, 1,
0.3113351, -1.851409, 3.926924, 0, 0.1607843, 1, 1,
0.3139105, -1.491902, 2.569743, 0, 0.1529412, 1, 1,
0.3148473, 1.304521, 1.199175, 0, 0.1490196, 1, 1,
0.3185194, -0.8053017, 3.352033, 0, 0.1411765, 1, 1,
0.3190455, 1.585729, 0.8254986, 0, 0.1372549, 1, 1,
0.3220941, 0.7619383, 1.070455, 0, 0.1294118, 1, 1,
0.3267543, -0.7329444, 2.548608, 0, 0.1254902, 1, 1,
0.330207, 0.294311, 0.9354432, 0, 0.1176471, 1, 1,
0.3341923, -2.991435, 4.246646, 0, 0.1137255, 1, 1,
0.3405178, 1.412947, -1.192563, 0, 0.1058824, 1, 1,
0.3407567, -0.5782288, 2.851932, 0, 0.09803922, 1, 1,
0.3427814, 1.107975, -0.2746659, 0, 0.09411765, 1, 1,
0.3442304, 1.402365, 0.6474816, 0, 0.08627451, 1, 1,
0.3496744, -1.448119, 3.956389, 0, 0.08235294, 1, 1,
0.354832, -0.6843091, 1.232997, 0, 0.07450981, 1, 1,
0.3554862, 0.5964515, -0.1969328, 0, 0.07058824, 1, 1,
0.3555565, -0.6368635, 3.98869, 0, 0.0627451, 1, 1,
0.356269, -0.5675414, 3.383567, 0, 0.05882353, 1, 1,
0.3589295, 0.1851231, 1.935041, 0, 0.05098039, 1, 1,
0.3595433, -2.320616, 2.65581, 0, 0.04705882, 1, 1,
0.3599507, 0.8644004, 1.09629, 0, 0.03921569, 1, 1,
0.3633143, 1.6146, 0.4236175, 0, 0.03529412, 1, 1,
0.3647088, 0.004370053, 1.986693, 0, 0.02745098, 1, 1,
0.3661525, -0.1481528, 3.34527, 0, 0.02352941, 1, 1,
0.3756742, 1.772367, 0.6597015, 0, 0.01568628, 1, 1,
0.3802043, -1.078506, 2.646985, 0, 0.01176471, 1, 1,
0.3814981, 1.859336, 0.529065, 0, 0.003921569, 1, 1,
0.3818465, 0.7697207, 1.211355, 0.003921569, 0, 1, 1,
0.3852643, 1.125286, -0.7856401, 0.007843138, 0, 1, 1,
0.3926372, 0.7199845, 1.201237, 0.01568628, 0, 1, 1,
0.3959596, -3.479258, 3.826502, 0.01960784, 0, 1, 1,
0.3989634, -1.647729, 2.475078, 0.02745098, 0, 1, 1,
0.4014781, 0.1118149, 2.309967, 0.03137255, 0, 1, 1,
0.4040563, 1.756333, -1.509703, 0.03921569, 0, 1, 1,
0.4095453, -0.1261156, 3.97504, 0.04313726, 0, 1, 1,
0.4125564, -1.705736, 2.740207, 0.05098039, 0, 1, 1,
0.4143373, 0.05161606, 2.647409, 0.05490196, 0, 1, 1,
0.4206261, 0.2679424, 1.484724, 0.0627451, 0, 1, 1,
0.4207655, -0.4438089, 2.799727, 0.06666667, 0, 1, 1,
0.4276958, -0.0435759, 1.561727, 0.07450981, 0, 1, 1,
0.4281306, -0.246775, 1.669071, 0.07843138, 0, 1, 1,
0.4325384, 0.4835681, 2.88016, 0.08627451, 0, 1, 1,
0.4371844, 0.157114, 1.127635, 0.09019608, 0, 1, 1,
0.4376027, -0.3789364, 2.268084, 0.09803922, 0, 1, 1,
0.439454, -0.8043021, 1.859122, 0.1058824, 0, 1, 1,
0.443655, 0.608792, 0.0552457, 0.1098039, 0, 1, 1,
0.444066, -0.3089523, 2.672008, 0.1176471, 0, 1, 1,
0.4456484, -0.1994882, 3.339442, 0.1215686, 0, 1, 1,
0.455517, 1.170968, -1.638599, 0.1294118, 0, 1, 1,
0.4590671, 0.2482796, 0.7300549, 0.1333333, 0, 1, 1,
0.4627384, -1.448333, 2.691846, 0.1411765, 0, 1, 1,
0.4628104, -2.079072, 1.923909, 0.145098, 0, 1, 1,
0.4641409, 1.134039, -0.6919875, 0.1529412, 0, 1, 1,
0.4699597, 1.377877, 1.112133, 0.1568628, 0, 1, 1,
0.4709988, 1.74049, -0.12848, 0.1647059, 0, 1, 1,
0.4829857, 0.855863, 0.6398875, 0.1686275, 0, 1, 1,
0.4883693, -1.589296, 1.934931, 0.1764706, 0, 1, 1,
0.4886422, 1.555386, 0.4586029, 0.1803922, 0, 1, 1,
0.4893728, 0.9345528, -1.426451, 0.1882353, 0, 1, 1,
0.4896132, 0.07007971, 1.777885, 0.1921569, 0, 1, 1,
0.4902586, -1.24223, 1.853147, 0.2, 0, 1, 1,
0.4971446, -0.5602496, 1.704975, 0.2078431, 0, 1, 1,
0.4991199, -0.4657594, 2.507958, 0.2117647, 0, 1, 1,
0.5017304, 0.7848616, -0.1045984, 0.2196078, 0, 1, 1,
0.5020697, -2.095412, 3.835587, 0.2235294, 0, 1, 1,
0.5137484, -0.4853185, 1.51572, 0.2313726, 0, 1, 1,
0.516056, 0.5860592, 2.759819, 0.2352941, 0, 1, 1,
0.5168549, -0.4588125, 1.806695, 0.2431373, 0, 1, 1,
0.5224992, 0.285671, 0.1412608, 0.2470588, 0, 1, 1,
0.5236959, -1.565195, 3.355244, 0.254902, 0, 1, 1,
0.5258756, -0.2460295, 1.721843, 0.2588235, 0, 1, 1,
0.5260699, 0.505848, -0.6946784, 0.2666667, 0, 1, 1,
0.5281567, -0.886784, 1.651994, 0.2705882, 0, 1, 1,
0.5325565, -0.1752212, 3.074886, 0.2784314, 0, 1, 1,
0.5327435, -0.132485, 3.343289, 0.282353, 0, 1, 1,
0.5339895, 1.088783, -1.192983, 0.2901961, 0, 1, 1,
0.5401193, 0.9314657, 2.867891, 0.2941177, 0, 1, 1,
0.5497479, -0.3461235, 1.403686, 0.3019608, 0, 1, 1,
0.5616031, 1.392765, 1.336319, 0.3098039, 0, 1, 1,
0.5641201, 0.3067656, -0.1207555, 0.3137255, 0, 1, 1,
0.5653094, 1.036379, 0.4050241, 0.3215686, 0, 1, 1,
0.5682579, 0.6198207, -1.628438, 0.3254902, 0, 1, 1,
0.5701169, 0.8993822, -0.786541, 0.3333333, 0, 1, 1,
0.5720167, -0.1267024, 2.51363, 0.3372549, 0, 1, 1,
0.5807898, -0.07025272, 2.007618, 0.345098, 0, 1, 1,
0.5833485, 1.405356, 0.1797177, 0.3490196, 0, 1, 1,
0.5838886, -0.8311719, 3.700429, 0.3568628, 0, 1, 1,
0.5877646, -0.3731024, 1.006471, 0.3607843, 0, 1, 1,
0.5900476, -0.771089, 1.567261, 0.3686275, 0, 1, 1,
0.59447, 0.05592115, 2.115064, 0.372549, 0, 1, 1,
0.5949156, -0.5228735, 2.818704, 0.3803922, 0, 1, 1,
0.5965645, 0.1797504, 1.759408, 0.3843137, 0, 1, 1,
0.5992255, 0.505172, 2.327697, 0.3921569, 0, 1, 1,
0.6000985, 0.3259835, 1.058855, 0.3960784, 0, 1, 1,
0.6008432, 1.33878, -1.156181, 0.4039216, 0, 1, 1,
0.6030107, 0.2477466, 0.62341, 0.4117647, 0, 1, 1,
0.611295, 1.922012, -0.9310347, 0.4156863, 0, 1, 1,
0.6175083, -1.213539, 3.852763, 0.4235294, 0, 1, 1,
0.6179392, 0.4559662, 2.344456, 0.427451, 0, 1, 1,
0.6211917, 0.0747922, 1.801008, 0.4352941, 0, 1, 1,
0.6213099, -1.910284, 2.390692, 0.4392157, 0, 1, 1,
0.6284969, -1.020765, 3.198043, 0.4470588, 0, 1, 1,
0.6312827, 0.06745685, 1.829587, 0.4509804, 0, 1, 1,
0.6318678, -0.22545, 2.31777, 0.4588235, 0, 1, 1,
0.6460501, -1.620744, 3.840276, 0.4627451, 0, 1, 1,
0.6491312, 0.2214675, 1.202935, 0.4705882, 0, 1, 1,
0.6504201, -0.2109684, 2.922834, 0.4745098, 0, 1, 1,
0.6550296, -0.5843358, 3.483026, 0.4823529, 0, 1, 1,
0.6594958, -0.2976306, 1.626749, 0.4862745, 0, 1, 1,
0.6651886, 0.07433533, 0.4493182, 0.4941176, 0, 1, 1,
0.6674178, 0.4375675, 0.4356744, 0.5019608, 0, 1, 1,
0.6682977, -0.5241075, 3.661837, 0.5058824, 0, 1, 1,
0.6695101, 1.290776, -0.5090503, 0.5137255, 0, 1, 1,
0.669943, -0.2602924, 1.937526, 0.5176471, 0, 1, 1,
0.6721593, -0.5692692, 2.380434, 0.5254902, 0, 1, 1,
0.6756939, 0.5467498, 1.064744, 0.5294118, 0, 1, 1,
0.6840877, 0.2152635, 2.042768, 0.5372549, 0, 1, 1,
0.6855954, 1.109288, 1.259709, 0.5411765, 0, 1, 1,
0.6870272, -0.9591488, 2.470142, 0.5490196, 0, 1, 1,
0.6871346, 0.6276898, -0.669613, 0.5529412, 0, 1, 1,
0.6941733, 1.924571, -1.755388, 0.5607843, 0, 1, 1,
0.6953657, 1.364347, 0.6493185, 0.5647059, 0, 1, 1,
0.7059479, -0.756289, 1.161875, 0.572549, 0, 1, 1,
0.7094211, 0.1306976, 0.9605229, 0.5764706, 0, 1, 1,
0.7108324, 1.68586, 0.6013015, 0.5843138, 0, 1, 1,
0.7111174, 0.0295873, 1.803051, 0.5882353, 0, 1, 1,
0.7184581, -0.4927759, 1.456087, 0.5960785, 0, 1, 1,
0.7252157, -0.1017623, 1.891742, 0.6039216, 0, 1, 1,
0.7403388, -0.04698419, 1.169866, 0.6078432, 0, 1, 1,
0.7412141, 1.173925, -0.6805583, 0.6156863, 0, 1, 1,
0.7415115, -0.0783991, 2.669069, 0.6196079, 0, 1, 1,
0.7430137, -0.2787612, 1.242968, 0.627451, 0, 1, 1,
0.7432599, -1.686784, 2.768015, 0.6313726, 0, 1, 1,
0.7543716, -1.454136, 2.598644, 0.6392157, 0, 1, 1,
0.7563372, -1.042048, 0.9971499, 0.6431373, 0, 1, 1,
0.7575571, -0.4822746, 2.157718, 0.6509804, 0, 1, 1,
0.7581356, 2.666514, 0.3422336, 0.654902, 0, 1, 1,
0.763743, -0.1471833, 1.67167, 0.6627451, 0, 1, 1,
0.7642906, -1.873751, 3.049752, 0.6666667, 0, 1, 1,
0.7718576, -1.173861, 3.108152, 0.6745098, 0, 1, 1,
0.7724046, 0.4737189, 2.42207, 0.6784314, 0, 1, 1,
0.7793558, -0.9218209, 2.60098, 0.6862745, 0, 1, 1,
0.7824404, -0.02637022, 2.760326, 0.6901961, 0, 1, 1,
0.7831798, -0.4372807, 3.573041, 0.6980392, 0, 1, 1,
0.7888341, 0.5741037, 0.6027528, 0.7058824, 0, 1, 1,
0.7904253, 0.8671165, 1.065841, 0.7098039, 0, 1, 1,
0.796074, 1.472547, 1.647261, 0.7176471, 0, 1, 1,
0.8008679, -0.2524259, 0.8212281, 0.7215686, 0, 1, 1,
0.8023721, 0.2925038, 1.352521, 0.7294118, 0, 1, 1,
0.8036034, 1.694518, -1.705258, 0.7333333, 0, 1, 1,
0.8037558, 1.504178, 1.18951, 0.7411765, 0, 1, 1,
0.8080117, 0.2684179, 0.2586652, 0.7450981, 0, 1, 1,
0.8096117, 0.1629536, 1.982321, 0.7529412, 0, 1, 1,
0.8115328, -2.035433, 4.504711, 0.7568628, 0, 1, 1,
0.8117086, -0.294919, 3.317991, 0.7647059, 0, 1, 1,
0.8128943, 0.4335195, 2.436536, 0.7686275, 0, 1, 1,
0.8151034, 1.354336, 0.3354284, 0.7764706, 0, 1, 1,
0.8175501, -0.4845628, 0.7544717, 0.7803922, 0, 1, 1,
0.8284603, -0.7944221, 1.550299, 0.7882353, 0, 1, 1,
0.8304518, -1.182321, 3.534428, 0.7921569, 0, 1, 1,
0.8347, -0.5362149, 2.108057, 0.8, 0, 1, 1,
0.8355159, 0.7692996, 1.398764, 0.8078431, 0, 1, 1,
0.8478282, -1.679877, 4.772691, 0.8117647, 0, 1, 1,
0.8486711, -0.4617948, 1.886627, 0.8196079, 0, 1, 1,
0.8527977, 1.506588, -0.2300104, 0.8235294, 0, 1, 1,
0.8546564, -0.8155347, 1.09646, 0.8313726, 0, 1, 1,
0.8630776, 0.1540488, 0.7230441, 0.8352941, 0, 1, 1,
0.8634448, 0.2193485, 0.4560575, 0.8431373, 0, 1, 1,
0.8649825, 1.35362, 1.307654, 0.8470588, 0, 1, 1,
0.8697389, -1.212451, 1.885434, 0.854902, 0, 1, 1,
0.8762092, -0.8205349, 3.297361, 0.8588235, 0, 1, 1,
0.8765732, -0.3128104, 2.166667, 0.8666667, 0, 1, 1,
0.8871382, 0.1523711, 1.350309, 0.8705882, 0, 1, 1,
0.8911149, 0.05856099, 3.44806, 0.8784314, 0, 1, 1,
0.8945549, -1.787519, 1.045022, 0.8823529, 0, 1, 1,
0.896185, 0.5026936, 0.2449648, 0.8901961, 0, 1, 1,
0.9030026, 1.845593, -0.585485, 0.8941177, 0, 1, 1,
0.923184, -0.33477, 1.989555, 0.9019608, 0, 1, 1,
0.9356416, -0.5273526, 1.253374, 0.9098039, 0, 1, 1,
0.9379524, 2.262128, 1.589367, 0.9137255, 0, 1, 1,
0.9436288, 1.772745, 2.471234, 0.9215686, 0, 1, 1,
0.944023, -0.3031004, 0.9325167, 0.9254902, 0, 1, 1,
0.9443932, -0.09676406, 1.533788, 0.9333333, 0, 1, 1,
0.9458985, 0.6677077, 0.5309553, 0.9372549, 0, 1, 1,
0.9475206, -0.1802127, 2.222914, 0.945098, 0, 1, 1,
0.9517317, 1.362744, 0.1589705, 0.9490196, 0, 1, 1,
0.9546806, 0.4453077, -0.5360224, 0.9568627, 0, 1, 1,
0.9563614, 0.9408245, -1.14407, 0.9607843, 0, 1, 1,
0.9570107, 1.107269, -0.8825077, 0.9686275, 0, 1, 1,
0.9590183, 1.541109, -0.5205824, 0.972549, 0, 1, 1,
0.9604805, -0.3213993, 2.52528, 0.9803922, 0, 1, 1,
0.9631718, -0.7831213, 3.579503, 0.9843137, 0, 1, 1,
0.9700881, 0.4306209, 1.527091, 0.9921569, 0, 1, 1,
0.9804563, 1.357331, 0.6001306, 0.9960784, 0, 1, 1,
0.9807613, 0.8796374, -0.5205383, 1, 0, 0.9960784, 1,
0.9824883, 0.6636469, 1.658477, 1, 0, 0.9882353, 1,
0.9869028, 1.422949, -0.6222167, 1, 0, 0.9843137, 1,
0.9972035, 1.234996, 0.3749871, 1, 0, 0.9764706, 1,
0.9992183, 0.3642978, 3.265096, 1, 0, 0.972549, 1,
1.004889, -0.4020812, 1.415417, 1, 0, 0.9647059, 1,
1.015939, -1.436936, 2.30341, 1, 0, 0.9607843, 1,
1.018559, -2.134849, 3.046077, 1, 0, 0.9529412, 1,
1.023682, -1.368671, 2.965317, 1, 0, 0.9490196, 1,
1.025311, -1.327498, 1.526797, 1, 0, 0.9411765, 1,
1.026764, 0.8284904, 1.505192, 1, 0, 0.9372549, 1,
1.028554, 1.198476, 0.09837856, 1, 0, 0.9294118, 1,
1.031196, -0.478269, 2.878471, 1, 0, 0.9254902, 1,
1.047603, -0.5290871, 2.919176, 1, 0, 0.9176471, 1,
1.054301, -0.5115507, 0.6072995, 1, 0, 0.9137255, 1,
1.05885, 0.1516632, 1.229026, 1, 0, 0.9058824, 1,
1.058974, 1.636021, -0.06640242, 1, 0, 0.9019608, 1,
1.063345, -0.04882289, 3.077795, 1, 0, 0.8941177, 1,
1.064261, 0.3410807, 1.109681, 1, 0, 0.8862745, 1,
1.065214, 0.1063323, 0.247007, 1, 0, 0.8823529, 1,
1.072179, 0.0727184, 1.646247, 1, 0, 0.8745098, 1,
1.077328, -0.9427956, 2.581343, 1, 0, 0.8705882, 1,
1.080148, -1.530828, 1.438372, 1, 0, 0.8627451, 1,
1.085396, -0.8252843, 3.084169, 1, 0, 0.8588235, 1,
1.086743, -0.4204405, 2.299858, 1, 0, 0.8509804, 1,
1.088886, -0.009052583, 2.325862, 1, 0, 0.8470588, 1,
1.090815, 0.3804982, 1.788184, 1, 0, 0.8392157, 1,
1.096509, 0.03315372, 1.476555, 1, 0, 0.8352941, 1,
1.096796, 1.009081, -1.08403, 1, 0, 0.827451, 1,
1.101918, 0.1182495, 1.135392, 1, 0, 0.8235294, 1,
1.105046, 0.1678028, 1.82923, 1, 0, 0.8156863, 1,
1.110162, -0.7634609, 1.583337, 1, 0, 0.8117647, 1,
1.112282, -0.896844, 1.961691, 1, 0, 0.8039216, 1,
1.116472, 0.2680815, -0.5793885, 1, 0, 0.7960784, 1,
1.119228, -0.4361929, 1.760701, 1, 0, 0.7921569, 1,
1.1229, -2.191305, 2.66871, 1, 0, 0.7843137, 1,
1.126748, -1.767464, 1.82897, 1, 0, 0.7803922, 1,
1.133616, 0.1695691, 1.677887, 1, 0, 0.772549, 1,
1.139508, -1.138549, 1.700218, 1, 0, 0.7686275, 1,
1.139859, 1.135417, 1.818006, 1, 0, 0.7607843, 1,
1.144766, -2.877519, 3.036288, 1, 0, 0.7568628, 1,
1.147007, -0.4449633, 1.432578, 1, 0, 0.7490196, 1,
1.147591, 0.8337288, -0.002950308, 1, 0, 0.7450981, 1,
1.154821, -0.1943479, 0.4318731, 1, 0, 0.7372549, 1,
1.158028, 0.2295078, 1.503023, 1, 0, 0.7333333, 1,
1.163835, -0.4025167, 1.772244, 1, 0, 0.7254902, 1,
1.168284, -0.6294907, 2.961304, 1, 0, 0.7215686, 1,
1.172825, -0.2623552, 0.8002402, 1, 0, 0.7137255, 1,
1.175089, 0.03065453, 0.3742522, 1, 0, 0.7098039, 1,
1.179244, -0.856355, 2.994275, 1, 0, 0.7019608, 1,
1.19481, 0.5372654, 0.8445793, 1, 0, 0.6941177, 1,
1.195809, -0.238939, 0.4033939, 1, 0, 0.6901961, 1,
1.206648, -0.2928093, 1.616276, 1, 0, 0.682353, 1,
1.21155, -0.5157167, 0.42306, 1, 0, 0.6784314, 1,
1.219373, 0.2394526, 1.844394, 1, 0, 0.6705883, 1,
1.22193, -1.218189, 2.296289, 1, 0, 0.6666667, 1,
1.227986, 0.1324757, 1.716574, 1, 0, 0.6588235, 1,
1.22938, -0.8211144, 3.138276, 1, 0, 0.654902, 1,
1.236767, -0.7779307, 1.011577, 1, 0, 0.6470588, 1,
1.241236, -0.5685116, 2.209682, 1, 0, 0.6431373, 1,
1.24158, -1.563676, 3.155589, 1, 0, 0.6352941, 1,
1.244947, 0.6906485, 1.846398, 1, 0, 0.6313726, 1,
1.2519, -0.6663059, 1.054267, 1, 0, 0.6235294, 1,
1.252201, 0.05437616, 1.145029, 1, 0, 0.6196079, 1,
1.261104, -1.357042, 2.320266, 1, 0, 0.6117647, 1,
1.26534, -1.012892, 1.974262, 1, 0, 0.6078432, 1,
1.265401, 0.7746822, 1.386209, 1, 0, 0.6, 1,
1.267579, -0.5054361, 2.25882, 1, 0, 0.5921569, 1,
1.2798, -0.08866087, 1.517262, 1, 0, 0.5882353, 1,
1.282289, 1.018078, 2.14562, 1, 0, 0.5803922, 1,
1.284258, 0.7268922, 0.9764178, 1, 0, 0.5764706, 1,
1.284428, 0.07450272, 0.7050839, 1, 0, 0.5686275, 1,
1.285724, -0.4290189, 2.223803, 1, 0, 0.5647059, 1,
1.295507, -0.7214199, 4.082381, 1, 0, 0.5568628, 1,
1.301344, 1.132637, 2.170925, 1, 0, 0.5529412, 1,
1.303936, -1.192525, 1.81266, 1, 0, 0.5450981, 1,
1.315446, -2.152307, 3.930697, 1, 0, 0.5411765, 1,
1.326183, -0.9108862, 1.246232, 1, 0, 0.5333334, 1,
1.331612, -1.101923, 2.522224, 1, 0, 0.5294118, 1,
1.333685, 1.176078, 0.9472112, 1, 0, 0.5215687, 1,
1.362787, 0.4369752, -1.20159, 1, 0, 0.5176471, 1,
1.369185, 0.4633611, -0.3710111, 1, 0, 0.509804, 1,
1.369753, 0.09624916, 1.22485, 1, 0, 0.5058824, 1,
1.37246, -0.7094468, 1.807781, 1, 0, 0.4980392, 1,
1.38895, 0.8100873, -0.0579882, 1, 0, 0.4901961, 1,
1.417751, 0.4329804, -0.2413416, 1, 0, 0.4862745, 1,
1.422542, -0.8948709, 2.301692, 1, 0, 0.4784314, 1,
1.424414, 1.644063, 1.835884, 1, 0, 0.4745098, 1,
1.426867, 0.3635495, 0.9514283, 1, 0, 0.4666667, 1,
1.434941, 2.486993, 0.5952524, 1, 0, 0.4627451, 1,
1.436378, -0.59873, 2.300743, 1, 0, 0.454902, 1,
1.440885, 0.1343482, 1.992097, 1, 0, 0.4509804, 1,
1.448516, -0.269536, 2.515958, 1, 0, 0.4431373, 1,
1.453328, 1.036848, -0.57675, 1, 0, 0.4392157, 1,
1.457812, -0.4184526, 1.749747, 1, 0, 0.4313726, 1,
1.501893, -0.1915371, 3.210143, 1, 0, 0.427451, 1,
1.505899, -1.694511, 1.373143, 1, 0, 0.4196078, 1,
1.511762, -0.2407932, 0.504498, 1, 0, 0.4156863, 1,
1.515317, -1.504838, 0.9434447, 1, 0, 0.4078431, 1,
1.522925, 0.7122712, 0.9623478, 1, 0, 0.4039216, 1,
1.523683, 0.2559025, 2.099981, 1, 0, 0.3960784, 1,
1.54638, -1.534408, 1.675346, 1, 0, 0.3882353, 1,
1.546774, 0.3865384, 1.164297, 1, 0, 0.3843137, 1,
1.549151, 0.3344528, 2.29316, 1, 0, 0.3764706, 1,
1.549552, -0.9628413, 3.379535, 1, 0, 0.372549, 1,
1.557009, -0.2669562, 3.267715, 1, 0, 0.3647059, 1,
1.561334, -0.1361895, 1.567659, 1, 0, 0.3607843, 1,
1.570194, -0.540364, 0.9400371, 1, 0, 0.3529412, 1,
1.576266, -1.087463, 3.354935, 1, 0, 0.3490196, 1,
1.582847, -2.468372, 2.182004, 1, 0, 0.3411765, 1,
1.586532, 0.6068938, 0.5816996, 1, 0, 0.3372549, 1,
1.588335, 0.2715412, 1.273436, 1, 0, 0.3294118, 1,
1.588758, 0.2424429, 2.000014, 1, 0, 0.3254902, 1,
1.607604, -0.6001973, 1.028232, 1, 0, 0.3176471, 1,
1.610482, -0.3103452, 2.253626, 1, 0, 0.3137255, 1,
1.620276, -0.01402649, 1.891523, 1, 0, 0.3058824, 1,
1.625141, -1.496059, 3.987456, 1, 0, 0.2980392, 1,
1.643659, 1.479073, 0.6671809, 1, 0, 0.2941177, 1,
1.670107, -0.5345013, 2.152996, 1, 0, 0.2862745, 1,
1.671537, -0.4868343, 1.389406, 1, 0, 0.282353, 1,
1.671547, -0.848097, 2.90889, 1, 0, 0.2745098, 1,
1.674831, 0.3673277, 1.529515, 1, 0, 0.2705882, 1,
1.67494, 0.34412, 2.489721, 1, 0, 0.2627451, 1,
1.682233, -0.8032487, 3.7268, 1, 0, 0.2588235, 1,
1.691602, -0.3526248, 3.721215, 1, 0, 0.2509804, 1,
1.701267, 0.1524137, -0.1162922, 1, 0, 0.2470588, 1,
1.722548, -1.852009, 2.680288, 1, 0, 0.2392157, 1,
1.753123, -0.0621018, 2.695862, 1, 0, 0.2352941, 1,
1.774692, -0.4617063, 2.636796, 1, 0, 0.227451, 1,
1.782154, 0.6786506, 1.457686, 1, 0, 0.2235294, 1,
1.785335, -0.4873647, 2.95877, 1, 0, 0.2156863, 1,
1.800869, 1.239351, 1.844601, 1, 0, 0.2117647, 1,
1.82967, -0.5699756, 1.597197, 1, 0, 0.2039216, 1,
1.835376, 2.214722, 0.8111834, 1, 0, 0.1960784, 1,
1.835414, -0.0291248, 2.280134, 1, 0, 0.1921569, 1,
1.836683, 1.124976, -0.05420692, 1, 0, 0.1843137, 1,
1.878, 1.156239, 0.8470098, 1, 0, 0.1803922, 1,
1.912962, -0.1890668, 2.183235, 1, 0, 0.172549, 1,
1.982924, 0.3306274, 0.5776868, 1, 0, 0.1686275, 1,
1.992838, 1.141905, 0.8203094, 1, 0, 0.1607843, 1,
1.995261, -1.855626, 2.370725, 1, 0, 0.1568628, 1,
2.000431, 0.2692363, 0.7803575, 1, 0, 0.1490196, 1,
2.026952, 0.7514952, 1.413111, 1, 0, 0.145098, 1,
2.039706, -0.6977302, 2.040077, 1, 0, 0.1372549, 1,
2.053232, -0.6114087, 1.759191, 1, 0, 0.1333333, 1,
2.087171, 1.093914, 2.592917, 1, 0, 0.1254902, 1,
2.116466, 0.2786787, 1.493109, 1, 0, 0.1215686, 1,
2.120158, -1.187487, 2.415303, 1, 0, 0.1137255, 1,
2.121828, -0.9091594, 1.373571, 1, 0, 0.1098039, 1,
2.124231, 0.2996642, -0.1900035, 1, 0, 0.1019608, 1,
2.126934, 0.5298155, 1.848061, 1, 0, 0.09411765, 1,
2.143227, 1.544246, 0.3244551, 1, 0, 0.09019608, 1,
2.154878, 0.2620623, 1.986614, 1, 0, 0.08235294, 1,
2.160362, -1.183213, 1.020967, 1, 0, 0.07843138, 1,
2.170959, -1.314377, 3.751993, 1, 0, 0.07058824, 1,
2.177513, 0.7218925, 0.6638753, 1, 0, 0.06666667, 1,
2.215644, 0.8783105, 0.4695272, 1, 0, 0.05882353, 1,
2.299213, 0.762721, 2.347024, 1, 0, 0.05490196, 1,
2.30202, 1.304306, 0.4197144, 1, 0, 0.04705882, 1,
2.302272, -0.1713105, 1.090641, 1, 0, 0.04313726, 1,
2.405293, 1.196994, -0.3692502, 1, 0, 0.03529412, 1,
2.491792, -1.407954, 2.535362, 1, 0, 0.03137255, 1,
2.499885, -0.3701545, -0.538953, 1, 0, 0.02352941, 1,
2.723564, 0.2266213, 0.7824598, 1, 0, 0.01960784, 1,
2.859748, -0.6002988, 1.514337, 1, 0, 0.01176471, 1,
3.529635, 0.8424357, 1.631667, 1, 0, 0.007843138, 1
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
-0.4181843, -4.600351, -7.163674, 0, -0.5, 0.5, 0.5,
-0.4181843, -4.600351, -7.163674, 1, -0.5, 0.5, 0.5,
-0.4181843, -4.600351, -7.163674, 1, 1.5, 0.5, 0.5,
-0.4181843, -4.600351, -7.163674, 0, 1.5, 0.5, 0.5
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
-5.704314, -0.1721994, -7.163674, 0, -0.5, 0.5, 0.5,
-5.704314, -0.1721994, -7.163674, 1, -0.5, 0.5, 0.5,
-5.704314, -0.1721994, -7.163674, 1, 1.5, 0.5, 0.5,
-5.704314, -0.1721994, -7.163674, 0, 1.5, 0.5, 0.5
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
-5.704314, -4.600351, -0.006754637, 0, -0.5, 0.5, 0.5,
-5.704314, -4.600351, -0.006754637, 1, -0.5, 0.5, 0.5,
-5.704314, -4.600351, -0.006754637, 1, 1.5, 0.5, 0.5,
-5.704314, -4.600351, -0.006754637, 0, 1.5, 0.5, 0.5
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
-4, -3.57847, -5.512077,
2, -3.57847, -5.512077,
-4, -3.57847, -5.512077,
-4, -3.748784, -5.787344,
-2, -3.57847, -5.512077,
-2, -3.748784, -5.787344,
0, -3.57847, -5.512077,
0, -3.748784, -5.787344,
2, -3.57847, -5.512077,
2, -3.748784, -5.787344
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
-4, -4.089411, -6.337875, 0, -0.5, 0.5, 0.5,
-4, -4.089411, -6.337875, 1, -0.5, 0.5, 0.5,
-4, -4.089411, -6.337875, 1, 1.5, 0.5, 0.5,
-4, -4.089411, -6.337875, 0, 1.5, 0.5, 0.5,
-2, -4.089411, -6.337875, 0, -0.5, 0.5, 0.5,
-2, -4.089411, -6.337875, 1, -0.5, 0.5, 0.5,
-2, -4.089411, -6.337875, 1, 1.5, 0.5, 0.5,
-2, -4.089411, -6.337875, 0, 1.5, 0.5, 0.5,
0, -4.089411, -6.337875, 0, -0.5, 0.5, 0.5,
0, -4.089411, -6.337875, 1, -0.5, 0.5, 0.5,
0, -4.089411, -6.337875, 1, 1.5, 0.5, 0.5,
0, -4.089411, -6.337875, 0, 1.5, 0.5, 0.5,
2, -4.089411, -6.337875, 0, -0.5, 0.5, 0.5,
2, -4.089411, -6.337875, 1, -0.5, 0.5, 0.5,
2, -4.089411, -6.337875, 1, 1.5, 0.5, 0.5,
2, -4.089411, -6.337875, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.484438, -3, -5.512077,
-4.484438, 3, -5.512077,
-4.484438, -3, -5.512077,
-4.687751, -3, -5.787344,
-4.484438, -2, -5.512077,
-4.687751, -2, -5.787344,
-4.484438, -1, -5.512077,
-4.687751, -1, -5.787344,
-4.484438, 0, -5.512077,
-4.687751, 0, -5.787344,
-4.484438, 1, -5.512077,
-4.687751, 1, -5.787344,
-4.484438, 2, -5.512077,
-4.687751, 2, -5.787344,
-4.484438, 3, -5.512077,
-4.687751, 3, -5.787344
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
-5.094376, -3, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, -3, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, -3, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, -3, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, -2, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, -2, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, -2, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, -2, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, -1, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, -1, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, -1, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, -1, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, 0, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, 0, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, 0, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, 0, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, 1, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, 1, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, 1, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, 1, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, 2, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, 2, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, 2, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, 2, -6.337875, 0, 1.5, 0.5, 0.5,
-5.094376, 3, -6.337875, 0, -0.5, 0.5, 0.5,
-5.094376, 3, -6.337875, 1, -0.5, 0.5, 0.5,
-5.094376, 3, -6.337875, 1, 1.5, 0.5, 0.5,
-5.094376, 3, -6.337875, 0, 1.5, 0.5, 0.5
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
-4.484438, -3.57847, -4,
-4.484438, -3.57847, 4,
-4.484438, -3.57847, -4,
-4.687751, -3.748784, -4,
-4.484438, -3.57847, -2,
-4.687751, -3.748784, -2,
-4.484438, -3.57847, 0,
-4.687751, -3.748784, 0,
-4.484438, -3.57847, 2,
-4.687751, -3.748784, 2,
-4.484438, -3.57847, 4,
-4.687751, -3.748784, 4
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
-5.094376, -4.089411, -4, 0, -0.5, 0.5, 0.5,
-5.094376, -4.089411, -4, 1, -0.5, 0.5, 0.5,
-5.094376, -4.089411, -4, 1, 1.5, 0.5, 0.5,
-5.094376, -4.089411, -4, 0, 1.5, 0.5, 0.5,
-5.094376, -4.089411, -2, 0, -0.5, 0.5, 0.5,
-5.094376, -4.089411, -2, 1, -0.5, 0.5, 0.5,
-5.094376, -4.089411, -2, 1, 1.5, 0.5, 0.5,
-5.094376, -4.089411, -2, 0, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 0, 0, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 0, 1, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 0, 1, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 0, 0, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 2, 0, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 2, 1, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 2, 1, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 2, 0, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 4, 0, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 4, 1, -0.5, 0.5, 0.5,
-5.094376, -4.089411, 4, 1, 1.5, 0.5, 0.5,
-5.094376, -4.089411, 4, 0, 1.5, 0.5, 0.5
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
-4.484438, -3.57847, -5.512077,
-4.484438, 3.234071, -5.512077,
-4.484438, -3.57847, 5.498568,
-4.484438, 3.234071, 5.498568,
-4.484438, -3.57847, -5.512077,
-4.484438, -3.57847, 5.498568,
-4.484438, 3.234071, -5.512077,
-4.484438, 3.234071, 5.498568,
-4.484438, -3.57847, -5.512077,
3.64807, -3.57847, -5.512077,
-4.484438, -3.57847, 5.498568,
3.64807, -3.57847, 5.498568,
-4.484438, 3.234071, -5.512077,
3.64807, 3.234071, -5.512077,
-4.484438, 3.234071, 5.498568,
3.64807, 3.234071, 5.498568,
3.64807, -3.57847, -5.512077,
3.64807, 3.234071, -5.512077,
3.64807, -3.57847, 5.498568,
3.64807, 3.234071, 5.498568,
3.64807, -3.57847, -5.512077,
3.64807, -3.57847, 5.498568,
3.64807, 3.234071, -5.512077,
3.64807, 3.234071, 5.498568
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
var radius = 8.164539;
var distance = 36.32495;
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
mvMatrix.translate( 0.4181843, 0.1721994, 0.006754637 );
mvMatrix.scale( 1.085478, 1.295795, 0.8017386 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.32495);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
4-methylbenzenesulfo<-read.table("4-methylbenzenesulfo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-methylbenzenesulfo$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzenesulfo' not found
```

```r
y<-4-methylbenzenesulfo$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzenesulfo' not found
```

```r
z<-4-methylbenzenesulfo$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzenesulfo' not found
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
-4.366004, 0.1063672, -1.372653, 0, 0, 1, 1, 1,
-3.254953, 1.45883, -1.974869, 1, 0, 0, 1, 1,
-2.958951, -0.1598268, -0.03559302, 1, 0, 0, 1, 1,
-2.749904, 0.7893708, -1.866867, 1, 0, 0, 1, 1,
-2.746792, 1.233281, 0.8337004, 1, 0, 0, 1, 1,
-2.713652, -0.6864884, -2.763976, 1, 0, 0, 1, 1,
-2.667379, -1.351881, -1.936724, 0, 0, 0, 1, 1,
-2.437696, -0.1921606, -2.158534, 0, 0, 0, 1, 1,
-2.376428, 0.489231, -0.9885211, 0, 0, 0, 1, 1,
-2.328113, -0.9738268, -2.249315, 0, 0, 0, 1, 1,
-2.326525, -0.2364919, -1.279087, 0, 0, 0, 1, 1,
-2.304754, -0.1165579, -0.7426854, 0, 0, 0, 1, 1,
-2.303488, -1.557055, -1.990482, 0, 0, 0, 1, 1,
-2.272693, -2.081048, -2.325694, 1, 1, 1, 1, 1,
-2.220101, 0.1010533, -2.800907, 1, 1, 1, 1, 1,
-2.146068, 0.8386673, -1.338671, 1, 1, 1, 1, 1,
-2.142699, 0.2767367, -1.104088, 1, 1, 1, 1, 1,
-2.142417, -1.257349, -1.616446, 1, 1, 1, 1, 1,
-2.140835, -0.5416484, -1.004073, 1, 1, 1, 1, 1,
-2.100572, 0.8841057, -0.4283415, 1, 1, 1, 1, 1,
-2.095645, 0.344647, -1.42666, 1, 1, 1, 1, 1,
-2.080547, 0.3456937, -0.2949022, 1, 1, 1, 1, 1,
-2.076117, -0.124805, -2.82527, 1, 1, 1, 1, 1,
-2.061734, 0.1017147, -1.878759, 1, 1, 1, 1, 1,
-2.052583, -2.039192, -0.9617345, 1, 1, 1, 1, 1,
-1.998651, -0.8525491, -1.582478, 1, 1, 1, 1, 1,
-1.995811, 0.1677355, -1.250692, 1, 1, 1, 1, 1,
-1.990105, 0.7868575, -1.369051, 1, 1, 1, 1, 1,
-1.979979, 1.347159, -2.214219, 0, 0, 1, 1, 1,
-1.971596, -0.8472901, -2.523858, 1, 0, 0, 1, 1,
-1.903486, -1.774726, -3.911275, 1, 0, 0, 1, 1,
-1.897756, -0.02070068, -2.99079, 1, 0, 0, 1, 1,
-1.87832, -0.1657298, -0.7606524, 1, 0, 0, 1, 1,
-1.846779, -0.9571515, -1.300593, 1, 0, 0, 1, 1,
-1.843848, -1.523359, -2.328335, 0, 0, 0, 1, 1,
-1.841551, -0.7256545, -0.3750621, 0, 0, 0, 1, 1,
-1.840911, 0.5692955, -1.661924, 0, 0, 0, 1, 1,
-1.770288, 1.092842, -1.500149, 0, 0, 0, 1, 1,
-1.731099, 1.71147, 0.1260922, 0, 0, 0, 1, 1,
-1.720662, 0.1100632, -3.921463, 0, 0, 0, 1, 1,
-1.715132, 0.3048424, -0.7199819, 0, 0, 0, 1, 1,
-1.69929, -0.5577611, -2.736461, 1, 1, 1, 1, 1,
-1.695976, -0.3766687, -0.5327044, 1, 1, 1, 1, 1,
-1.69218, -0.4422795, -1.612499, 1, 1, 1, 1, 1,
-1.679376, -0.4820724, -1.159346, 1, 1, 1, 1, 1,
-1.675386, -0.8750681, 1.029236, 1, 1, 1, 1, 1,
-1.669348, -0.1045299, -1.521911, 1, 1, 1, 1, 1,
-1.657429, -0.5297172, -2.848276, 1, 1, 1, 1, 1,
-1.654552, 2.368626, -0.3292192, 1, 1, 1, 1, 1,
-1.634939, 0.4737472, -1.44326, 1, 1, 1, 1, 1,
-1.63447, 1.275327, -2.086499, 1, 1, 1, 1, 1,
-1.625529, 0.4009577, -1.442495, 1, 1, 1, 1, 1,
-1.623927, 0.4910308, -1.794265, 1, 1, 1, 1, 1,
-1.622445, -0.6821221, -0.8827422, 1, 1, 1, 1, 1,
-1.610518, -0.1361394, -1.683941, 1, 1, 1, 1, 1,
-1.589082, 0.4024788, -1.58163, 1, 1, 1, 1, 1,
-1.583901, -0.3351941, -0.9614054, 0, 0, 1, 1, 1,
-1.56962, 0.06682467, -2.787157, 1, 0, 0, 1, 1,
-1.569202, 0.2751171, -0.3842231, 1, 0, 0, 1, 1,
-1.563821, -0.6760668, -2.79696, 1, 0, 0, 1, 1,
-1.561368, 0.3083654, -2.703027, 1, 0, 0, 1, 1,
-1.555959, 0.746164, 0.6310034, 1, 0, 0, 1, 1,
-1.552748, -0.6051684, -1.693654, 0, 0, 0, 1, 1,
-1.550496, -1.803542, -2.277807, 0, 0, 0, 1, 1,
-1.546332, -0.7427714, -1.644854, 0, 0, 0, 1, 1,
-1.538974, -0.3651177, -0.5000412, 0, 0, 0, 1, 1,
-1.537003, 1.294086, 0.1429341, 0, 0, 0, 1, 1,
-1.53153, -1.138623, -2.470811, 0, 0, 0, 1, 1,
-1.52701, -0.3595825, -1.985395, 0, 0, 0, 1, 1,
-1.523687, -1.520487, -2.058323, 1, 1, 1, 1, 1,
-1.498957, -0.01894419, -1.904173, 1, 1, 1, 1, 1,
-1.494523, 1.450516, -1.954111, 1, 1, 1, 1, 1,
-1.490999, -0.7868329, -4.248322, 1, 1, 1, 1, 1,
-1.490963, 0.1271783, -0.6360036, 1, 1, 1, 1, 1,
-1.474269, 1.208408, -0.6569412, 1, 1, 1, 1, 1,
-1.458917, 0.2407886, -0.8186301, 1, 1, 1, 1, 1,
-1.453641, 2.073111, 0.5425262, 1, 1, 1, 1, 1,
-1.449223, 1.861004, -0.3030323, 1, 1, 1, 1, 1,
-1.447577, -0.1809413, 0.004339079, 1, 1, 1, 1, 1,
-1.442798, 0.3187825, -0.4165918, 1, 1, 1, 1, 1,
-1.437602, -0.8732328, -1.017739, 1, 1, 1, 1, 1,
-1.435526, 0.7992238, -1.204558, 1, 1, 1, 1, 1,
-1.434047, -1.767229, -4.081491, 1, 1, 1, 1, 1,
-1.430446, -0.6696435, -2.781937, 1, 1, 1, 1, 1,
-1.428281, 0.1806011, -1.492165, 0, 0, 1, 1, 1,
-1.421631, 0.06982143, -2.695979, 1, 0, 0, 1, 1,
-1.406355, 0.9199744, -0.7994549, 1, 0, 0, 1, 1,
-1.400678, -1.917271, -4.522753, 1, 0, 0, 1, 1,
-1.400647, -0.3715521, -0.1246117, 1, 0, 0, 1, 1,
-1.386848, -0.7308846, -1.483427, 1, 0, 0, 1, 1,
-1.384665, -1.414953, -1.54139, 0, 0, 0, 1, 1,
-1.367838, 0.3215029, -0.3761321, 0, 0, 0, 1, 1,
-1.355865, -0.7091771, -1.83066, 0, 0, 0, 1, 1,
-1.349213, -0.8055844, -2.211607, 0, 0, 0, 1, 1,
-1.346323, 0.7615193, -2.497352, 0, 0, 0, 1, 1,
-1.345226, 1.902394, -0.9103283, 0, 0, 0, 1, 1,
-1.338152, 0.9196247, -2.285895, 0, 0, 0, 1, 1,
-1.337469, -0.3448519, -1.857011, 1, 1, 1, 1, 1,
-1.333498, -0.93266, -1.700583, 1, 1, 1, 1, 1,
-1.325566, -0.3435127, -1.416624, 1, 1, 1, 1, 1,
-1.3088, -0.1564177, -2.423119, 1, 1, 1, 1, 1,
-1.304149, -0.591323, -2.226178, 1, 1, 1, 1, 1,
-1.294376, 1.924112, -0.7156902, 1, 1, 1, 1, 1,
-1.288757, 1.982282, -0.3588088, 1, 1, 1, 1, 1,
-1.282898, 0.3367888, -0.2868287, 1, 1, 1, 1, 1,
-1.280136, -0.2968317, -2.119181, 1, 1, 1, 1, 1,
-1.264544, -1.037889, -2.407122, 1, 1, 1, 1, 1,
-1.260295, 0.3179696, -1.037406, 1, 1, 1, 1, 1,
-1.257468, 2.321245, -0.7496127, 1, 1, 1, 1, 1,
-1.253208, 0.1808198, -1.400564, 1, 1, 1, 1, 1,
-1.246771, -0.8368163, -2.093551, 1, 1, 1, 1, 1,
-1.233147, -0.9257236, -1.073225, 1, 1, 1, 1, 1,
-1.207579, -0.9355114, -3.607962, 0, 0, 1, 1, 1,
-1.206931, 1.329388, 0.113294, 1, 0, 0, 1, 1,
-1.20393, 0.1180754, -2.913942, 1, 0, 0, 1, 1,
-1.199797, 0.8185924, -1.08724, 1, 0, 0, 1, 1,
-1.197718, 1.301653, -0.8166871, 1, 0, 0, 1, 1,
-1.193136, -1.357686, -3.326796, 1, 0, 0, 1, 1,
-1.188845, 0.4682654, -2.82137, 0, 0, 0, 1, 1,
-1.17263, -1.112137, -1.522161, 0, 0, 0, 1, 1,
-1.171573, 0.004943329, -2.129532, 0, 0, 0, 1, 1,
-1.162356, 1.575759, -1.070226, 0, 0, 0, 1, 1,
-1.157423, 1.52676, 1.183553, 0, 0, 0, 1, 1,
-1.15472, -0.549585, -1.27387, 0, 0, 0, 1, 1,
-1.150998, 1.11169, 0.7172381, 0, 0, 0, 1, 1,
-1.143069, -0.5918236, -1.342083, 1, 1, 1, 1, 1,
-1.141921, 0.6963663, -1.111839, 1, 1, 1, 1, 1,
-1.141766, -1.412071, -1.905578, 1, 1, 1, 1, 1,
-1.139008, 0.2608501, -1.602904, 1, 1, 1, 1, 1,
-1.132996, 0.0359526, -0.7696569, 1, 1, 1, 1, 1,
-1.127214, 0.1174391, -1.315072, 1, 1, 1, 1, 1,
-1.121795, -1.590528, -2.383007, 1, 1, 1, 1, 1,
-1.119108, 0.4330045, -1.231795, 1, 1, 1, 1, 1,
-1.116392, -2.194277, -1.860655, 1, 1, 1, 1, 1,
-1.111963, -1.80814, -0.8041468, 1, 1, 1, 1, 1,
-1.098957, 0.5151103, -1.969987, 1, 1, 1, 1, 1,
-1.093735, 0.2605349, -3.019962, 1, 1, 1, 1, 1,
-1.087999, 0.2786689, -1.39314, 1, 1, 1, 1, 1,
-1.082983, -0.5044664, -1.588287, 1, 1, 1, 1, 1,
-1.078349, 1.037611, -1.432331, 1, 1, 1, 1, 1,
-1.074725, -0.5822368, -1.818522, 0, 0, 1, 1, 1,
-1.072106, 0.222163, -1.73307, 1, 0, 0, 1, 1,
-1.068642, 0.536521, -1.175297, 1, 0, 0, 1, 1,
-1.06752, -0.7567539, -1.935945, 1, 0, 0, 1, 1,
-1.066384, 0.2761688, -1.619115, 1, 0, 0, 1, 1,
-1.065812, 1.365356, 0.5634843, 1, 0, 0, 1, 1,
-1.065168, -1.92012, -3.986189, 0, 0, 0, 1, 1,
-1.063739, -1.062379, -3.168801, 0, 0, 0, 1, 1,
-1.063056, -2.169856, -2.466664, 0, 0, 0, 1, 1,
-1.061669, 0.3042139, -2.325191, 0, 0, 0, 1, 1,
-1.060488, -1.069249, -2.596387, 0, 0, 0, 1, 1,
-1.047436, -0.1998981, 1.580422, 0, 0, 0, 1, 1,
-1.044905, 1.373444, 0.1076849, 0, 0, 0, 1, 1,
-1.038778, -1.695806, -1.879737, 1, 1, 1, 1, 1,
-1.031797, -2.201492, -1.723923, 1, 1, 1, 1, 1,
-1.02823, 0.6688699, 0.3158823, 1, 1, 1, 1, 1,
-1.02539, -0.220803, -1.725454, 1, 1, 1, 1, 1,
-1.019314, 0.01112738, -2.905991, 1, 1, 1, 1, 1,
-1.014939, -0.01764641, -2.209684, 1, 1, 1, 1, 1,
-1.011543, -0.1297177, -0.6143477, 1, 1, 1, 1, 1,
-1.004523, -1.741112, -1.881568, 1, 1, 1, 1, 1,
-1.004304, -0.053923, -2.363065, 1, 1, 1, 1, 1,
-0.9996361, -0.8302756, -1.80998, 1, 1, 1, 1, 1,
-0.9968628, 1.405118, -0.9478386, 1, 1, 1, 1, 1,
-0.9958687, 2.134835, -1.338517, 1, 1, 1, 1, 1,
-0.9885114, -1.602106, -1.714308, 1, 1, 1, 1, 1,
-0.9872312, -0.1342335, -3.295604, 1, 1, 1, 1, 1,
-0.986931, -1.354074, -2.816162, 1, 1, 1, 1, 1,
-0.9829701, 0.345575, -2.214606, 0, 0, 1, 1, 1,
-0.9784271, 0.4036912, -1.189071, 1, 0, 0, 1, 1,
-0.9726602, -1.577633, -1.385023, 1, 0, 0, 1, 1,
-0.9721776, -1.053382, 0.2479756, 1, 0, 0, 1, 1,
-0.9698861, -0.5796791, -1.457106, 1, 0, 0, 1, 1,
-0.9677792, 1.651206, 0.5267929, 1, 0, 0, 1, 1,
-0.96128, -0.4456609, -1.458396, 0, 0, 0, 1, 1,
-0.9574488, 0.4646542, 0.05686848, 0, 0, 0, 1, 1,
-0.9567176, -0.1930887, -1.798001, 0, 0, 0, 1, 1,
-0.9508837, -1.136691, -2.432041, 0, 0, 0, 1, 1,
-0.9438238, -0.3552899, -1.400676, 0, 0, 0, 1, 1,
-0.9382174, -0.3639553, -1.435983, 0, 0, 0, 1, 1,
-0.9311354, -0.1272778, -1.913128, 0, 0, 0, 1, 1,
-0.9302578, 0.8126297, -1.359514, 1, 1, 1, 1, 1,
-0.9284745, -1.178319, -3.342171, 1, 1, 1, 1, 1,
-0.9284738, -0.7551458, -1.494562, 1, 1, 1, 1, 1,
-0.9276245, -0.3374125, -2.735563, 1, 1, 1, 1, 1,
-0.9263297, -0.9888369, -0.7997123, 1, 1, 1, 1, 1,
-0.9245525, -1.69485, -1.775858, 1, 1, 1, 1, 1,
-0.9177085, 0.4535929, -1.031122, 1, 1, 1, 1, 1,
-0.91424, 0.8196371, -2.346266, 1, 1, 1, 1, 1,
-0.9130212, 0.6431308, -2.219482, 1, 1, 1, 1, 1,
-0.9080338, 0.1869465, -2.729039, 1, 1, 1, 1, 1,
-0.8954552, -0.5334507, -1.099345, 1, 1, 1, 1, 1,
-0.8900108, -0.0855717, -4.047284, 1, 1, 1, 1, 1,
-0.8879177, -0.02327666, -2.547047, 1, 1, 1, 1, 1,
-0.8863912, 1.435039, -1.982665, 1, 1, 1, 1, 1,
-0.8841456, 0.6867093, -0.7497567, 1, 1, 1, 1, 1,
-0.8838982, 1.501236, -0.8808341, 0, 0, 1, 1, 1,
-0.8783083, -1.391472, -1.867415, 1, 0, 0, 1, 1,
-0.8759866, 0.7819021, -0.5540026, 1, 0, 0, 1, 1,
-0.8743103, -0.1651917, -2.542705, 1, 0, 0, 1, 1,
-0.8661952, 0.07004023, -1.004994, 1, 0, 0, 1, 1,
-0.8582633, 0.6178576, -1.452974, 1, 0, 0, 1, 1,
-0.8575115, -1.609091, -2.345128, 0, 0, 0, 1, 1,
-0.8575113, 0.3454252, -0.04623544, 0, 0, 0, 1, 1,
-0.8522559, 0.4215109, -1.738943, 0, 0, 0, 1, 1,
-0.8489137, -0.5047317, -1.548029, 0, 0, 0, 1, 1,
-0.8458458, 0.07378868, -0.769588, 0, 0, 0, 1, 1,
-0.8441028, -0.6076899, -1.111771, 0, 0, 0, 1, 1,
-0.8412898, 0.363845, -0.3021591, 0, 0, 0, 1, 1,
-0.8386042, -0.1294055, -2.894608, 1, 1, 1, 1, 1,
-0.8370791, 0.5741822, -1.379178, 1, 1, 1, 1, 1,
-0.819513, 0.628926, -1.292395, 1, 1, 1, 1, 1,
-0.8179118, -0.2485296, -1.176616, 1, 1, 1, 1, 1,
-0.8176786, 0.9851948, -0.5129445, 1, 1, 1, 1, 1,
-0.8171057, -0.4196446, -0.9746898, 1, 1, 1, 1, 1,
-0.8163267, 0.7195315, -0.3314067, 1, 1, 1, 1, 1,
-0.8124794, -0.07680818, -2.934974, 1, 1, 1, 1, 1,
-0.8053041, -0.361167, -2.112393, 1, 1, 1, 1, 1,
-0.8022265, -0.3467802, -0.442382, 1, 1, 1, 1, 1,
-0.8001902, 0.2321679, -1.594478, 1, 1, 1, 1, 1,
-0.796289, -0.6959786, -3.023913, 1, 1, 1, 1, 1,
-0.7954345, 0.7777454, 0.394069, 1, 1, 1, 1, 1,
-0.7923621, 0.6942158, -0.4868148, 1, 1, 1, 1, 1,
-0.785453, 0.2556198, -1.668537, 1, 1, 1, 1, 1,
-0.785307, 0.9401828, -1.287311, 0, 0, 1, 1, 1,
-0.7831742, 0.7012762, -0.6756585, 1, 0, 0, 1, 1,
-0.782002, 0.1565852, -0.7217247, 1, 0, 0, 1, 1,
-0.7808764, 0.7194191, -0.3646295, 1, 0, 0, 1, 1,
-0.7690275, -1.296468, -3.613916, 1, 0, 0, 1, 1,
-0.7685111, -0.4789076, -2.828313, 1, 0, 0, 1, 1,
-0.7665173, -0.9383309, -3.06225, 0, 0, 0, 1, 1,
-0.7608282, 0.6843572, 0.9130309, 0, 0, 0, 1, 1,
-0.7598221, -2.623729, -2.215316, 0, 0, 0, 1, 1,
-0.7568906, 0.8331712, 0.2685231, 0, 0, 0, 1, 1,
-0.7553501, -1.543623, -1.809824, 0, 0, 0, 1, 1,
-0.7495143, 0.2970589, -0.04571594, 0, 0, 0, 1, 1,
-0.739237, -0.09409586, -1.39957, 0, 0, 0, 1, 1,
-0.7341009, -1.176095, -2.035275, 1, 1, 1, 1, 1,
-0.7334539, 2.007532, 0.3300371, 1, 1, 1, 1, 1,
-0.733408, -0.4466255, 0.07914399, 1, 1, 1, 1, 1,
-0.7300495, -1.570228, -3.220011, 1, 1, 1, 1, 1,
-0.716855, -0.8028756, -2.2458, 1, 1, 1, 1, 1,
-0.7155448, -0.5556088, -1.773186, 1, 1, 1, 1, 1,
-0.7081295, 0.5125242, -2.943231, 1, 1, 1, 1, 1,
-0.7011139, -0.30645, -3.473825, 1, 1, 1, 1, 1,
-0.7009589, 0.683894, 1.114561, 1, 1, 1, 1, 1,
-0.6992628, -0.6012491, -2.323715, 1, 1, 1, 1, 1,
-0.6964999, 0.9118271, -1.109414, 1, 1, 1, 1, 1,
-0.6951962, -0.0514175, -3.118932, 1, 1, 1, 1, 1,
-0.694775, 0.1745211, -0.7885042, 1, 1, 1, 1, 1,
-0.6932023, -0.3658028, -2.891672, 1, 1, 1, 1, 1,
-0.687398, -0.08250213, -2.113516, 1, 1, 1, 1, 1,
-0.6784889, 1.87532, 0.8151769, 0, 0, 1, 1, 1,
-0.6714447, 0.9179999, 1.079802, 1, 0, 0, 1, 1,
-0.6677363, -0.2562949, -3.429195, 1, 0, 0, 1, 1,
-0.6604242, 0.4982786, -1.301444, 1, 0, 0, 1, 1,
-0.6552301, -1.4732, -2.431074, 1, 0, 0, 1, 1,
-0.6500822, -0.06397516, -1.133481, 1, 0, 0, 1, 1,
-0.6457503, 1.015912, 0.3624986, 0, 0, 0, 1, 1,
-0.6436258, -0.631656, -1.423296, 0, 0, 0, 1, 1,
-0.6429056, -0.1386742, -0.4333983, 0, 0, 0, 1, 1,
-0.6405624, 0.7460026, -0.3468002, 0, 0, 0, 1, 1,
-0.6397617, -0.1214864, -2.739328, 0, 0, 0, 1, 1,
-0.6390635, 1.62081, 0.600126, 0, 0, 0, 1, 1,
-0.6373808, 1.739036, -1.941583, 0, 0, 0, 1, 1,
-0.6324778, 0.7020058, 1.716825, 1, 1, 1, 1, 1,
-0.6217443, -0.2164874, -0.887458, 1, 1, 1, 1, 1,
-0.6203161, 0.7322419, -1.066282, 1, 1, 1, 1, 1,
-0.6198521, 1.745792, 1.553036, 1, 1, 1, 1, 1,
-0.6170083, -1.050435, -1.979662, 1, 1, 1, 1, 1,
-0.6128126, 0.2379882, -1.884179, 1, 1, 1, 1, 1,
-0.6117321, 1.295226, -0.5713651, 1, 1, 1, 1, 1,
-0.6097475, -0.2336625, -1.733741, 1, 1, 1, 1, 1,
-0.6083339, 0.9451331, 0.3342718, 1, 1, 1, 1, 1,
-0.6077058, 2.389971, -0.02126063, 1, 1, 1, 1, 1,
-0.5981997, -1.136745, 0.581432, 1, 1, 1, 1, 1,
-0.5963065, -0.3397199, -1.976324, 1, 1, 1, 1, 1,
-0.5956635, 0.5642269, -1.107468, 1, 1, 1, 1, 1,
-0.5955175, 1.049822, -1.369357, 1, 1, 1, 1, 1,
-0.5913272, -1.488084, -1.907126, 1, 1, 1, 1, 1,
-0.589515, 0.2020683, -2.344438, 0, 0, 1, 1, 1,
-0.5879418, -0.1914172, -0.6001925, 1, 0, 0, 1, 1,
-0.5867102, -1.753879, -1.742407, 1, 0, 0, 1, 1,
-0.574065, 0.06131878, -1.860302, 1, 0, 0, 1, 1,
-0.5738541, 0.2196822, -1.581345, 1, 0, 0, 1, 1,
-0.5690802, -1.628183, -3.431608, 1, 0, 0, 1, 1,
-0.5607396, -0.6441504, -3.180075, 0, 0, 0, 1, 1,
-0.5600131, 0.2499359, -1.028537, 0, 0, 0, 1, 1,
-0.5580117, 0.6464102, -0.02182562, 0, 0, 0, 1, 1,
-0.5561905, -0.3587154, -2.680054, 0, 0, 0, 1, 1,
-0.5536704, -1.816154, -1.860052, 0, 0, 0, 1, 1,
-0.5507727, 0.4339721, -0.04723013, 0, 0, 0, 1, 1,
-0.5488852, -1.365924, -2.224259, 0, 0, 0, 1, 1,
-0.5486971, 1.092167, 0.2576202, 1, 1, 1, 1, 1,
-0.5465705, 0.03353285, -1.291135, 1, 1, 1, 1, 1,
-0.5451787, -1.371917, -1.73682, 1, 1, 1, 1, 1,
-0.5451322, 0.1013981, -1.737772, 1, 1, 1, 1, 1,
-0.5391656, -2.374186, -3.255375, 1, 1, 1, 1, 1,
-0.5355961, -2.140871, -1.570919, 1, 1, 1, 1, 1,
-0.5318124, -0.1426893, -2.339839, 1, 1, 1, 1, 1,
-0.530497, -0.6198878, -2.988086, 1, 1, 1, 1, 1,
-0.5288953, -1.014063, -2.610638, 1, 1, 1, 1, 1,
-0.5271039, -1.506755, -3.587011, 1, 1, 1, 1, 1,
-0.5257795, 1.043055, -0.2966099, 1, 1, 1, 1, 1,
-0.5241896, 0.3821954, -1.58425, 1, 1, 1, 1, 1,
-0.518719, 0.8719238, 1.77089, 1, 1, 1, 1, 1,
-0.5186998, 0.2942294, -0.449354, 1, 1, 1, 1, 1,
-0.517513, 0.2179154, -3.24011, 1, 1, 1, 1, 1,
-0.5172037, -0.4738235, -2.060363, 0, 0, 1, 1, 1,
-0.5164247, 0.2418958, -2.95739, 1, 0, 0, 1, 1,
-0.5160018, -1.452106, -2.411487, 1, 0, 0, 1, 1,
-0.5154232, -0.2302325, -3.755324, 1, 0, 0, 1, 1,
-0.5149821, -1.067048, -3.309532, 1, 0, 0, 1, 1,
-0.5145071, 2.423105, -1.647396, 1, 0, 0, 1, 1,
-0.5133042, -0.935214, -0.9574043, 0, 0, 0, 1, 1,
-0.5107791, 0.7945126, -0.2756965, 0, 0, 0, 1, 1,
-0.5085722, 0.03014472, -0.7371867, 0, 0, 0, 1, 1,
-0.5049876, 0.7645332, -0.7260218, 0, 0, 0, 1, 1,
-0.5039108, -0.6847449, -1.095752, 0, 0, 0, 1, 1,
-0.5010036, 0.5442078, -0.4713627, 0, 0, 0, 1, 1,
-0.5003533, 0.8660805, 1.089194, 0, 0, 0, 1, 1,
-0.4951841, 1.188218, 0.745868, 1, 1, 1, 1, 1,
-0.4941375, 0.1923131, -1.37884, 1, 1, 1, 1, 1,
-0.4892837, -0.2481418, -1.126245, 1, 1, 1, 1, 1,
-0.4829086, 0.4863728, -0.3176833, 1, 1, 1, 1, 1,
-0.4795591, -0.6470759, -1.346837, 1, 1, 1, 1, 1,
-0.4790089, 1.549572, 0.9066404, 1, 1, 1, 1, 1,
-0.4766262, 0.2754952, -0.8234605, 1, 1, 1, 1, 1,
-0.474167, 0.2900841, -0.8859382, 1, 1, 1, 1, 1,
-0.4736821, -0.6027243, -3.088546, 1, 1, 1, 1, 1,
-0.4724898, -0.02260325, -1.231729, 1, 1, 1, 1, 1,
-0.4702189, -1.357272, -3.505555, 1, 1, 1, 1, 1,
-0.467307, -0.3433207, -1.640903, 1, 1, 1, 1, 1,
-0.4669888, 0.2994241, -1.994755, 1, 1, 1, 1, 1,
-0.4601202, -1.481392, -2.420832, 1, 1, 1, 1, 1,
-0.4567182, 0.9822662, -2.443336, 1, 1, 1, 1, 1,
-0.4524635, -1.191685, -0.6471684, 0, 0, 1, 1, 1,
-0.4499553, -0.2102939, -1.766321, 1, 0, 0, 1, 1,
-0.448673, 0.3138477, -1.158711, 1, 0, 0, 1, 1,
-0.4467328, -0.5380484, -4.554268, 1, 0, 0, 1, 1,
-0.4424559, 0.6815051, -2.124939, 1, 0, 0, 1, 1,
-0.4412812, -1.122388, -3.953187, 1, 0, 0, 1, 1,
-0.4354248, -0.4134676, -1.375267, 0, 0, 0, 1, 1,
-0.4324685, -0.911101, -0.7792383, 0, 0, 0, 1, 1,
-0.4293457, 0.04569763, -1.044612, 0, 0, 0, 1, 1,
-0.4272507, -0.3248477, -1.827089, 0, 0, 0, 1, 1,
-0.4260363, 3.13486, -1.353484, 0, 0, 0, 1, 1,
-0.4222562, -1.08528, -3.687358, 0, 0, 0, 1, 1,
-0.4168983, 0.421104, -1.786815, 0, 0, 0, 1, 1,
-0.4146332, 0.04454219, -1.25445, 1, 1, 1, 1, 1,
-0.4115099, -1.108118, -1.666184, 1, 1, 1, 1, 1,
-0.4112873, 1.16336, -0.3692499, 1, 1, 1, 1, 1,
-0.4059416, -1.102899, -3.654959, 1, 1, 1, 1, 1,
-0.4058491, -1.319797, -1.629043, 1, 1, 1, 1, 1,
-0.4058375, 1.674149, 0.8336881, 1, 1, 1, 1, 1,
-0.4051335, 0.5163863, 0.1088136, 1, 1, 1, 1, 1,
-0.4032314, 1.406707, 0.706691, 1, 1, 1, 1, 1,
-0.4019689, -0.1298986, -2.35083, 1, 1, 1, 1, 1,
-0.3998878, -2.252434, -2.789709, 1, 1, 1, 1, 1,
-0.395581, -0.5366282, -2.732838, 1, 1, 1, 1, 1,
-0.3949867, 1.140735, 1.233304, 1, 1, 1, 1, 1,
-0.3947549, 0.3195779, -2.281853, 1, 1, 1, 1, 1,
-0.391167, 1.980489, 0.618477, 1, 1, 1, 1, 1,
-0.3875644, -1.103526, -0.6895006, 1, 1, 1, 1, 1,
-0.3800306, 1.11413, -0.9937841, 0, 0, 1, 1, 1,
-0.3784447, 0.06884412, -0.5285591, 1, 0, 0, 1, 1,
-0.3775052, 0.530233, -1.879086, 1, 0, 0, 1, 1,
-0.3741569, 0.8131294, -0.1174215, 1, 0, 0, 1, 1,
-0.3684466, -0.4195692, -2.220361, 1, 0, 0, 1, 1,
-0.3668069, -1.644879, -3.810223, 1, 0, 0, 1, 1,
-0.3634724, 1.557814, -0.7191992, 0, 0, 0, 1, 1,
-0.3563501, 0.18238, -2.483144, 0, 0, 0, 1, 1,
-0.3524535, 0.3444634, -1.643131, 0, 0, 0, 1, 1,
-0.3516209, 0.770237, 1.220361, 0, 0, 0, 1, 1,
-0.3514251, -2.259269, -4.653664, 0, 0, 0, 1, 1,
-0.3476637, -0.4013518, -2.478241, 0, 0, 0, 1, 1,
-0.3459939, 0.7907814, -0.4186239, 0, 0, 0, 1, 1,
-0.3408889, 0.08042526, -1.013988, 1, 1, 1, 1, 1,
-0.3408128, 0.1183015, -0.08736145, 1, 1, 1, 1, 1,
-0.340212, 0.5731903, 0.2729522, 1, 1, 1, 1, 1,
-0.3373147, 0.9045964, -1.159721, 1, 1, 1, 1, 1,
-0.3331509, 1.556965, -0.4342552, 1, 1, 1, 1, 1,
-0.3329931, 0.9740089, -0.3098543, 1, 1, 1, 1, 1,
-0.3307632, -1.480606, -1.495, 1, 1, 1, 1, 1,
-0.3296947, -0.4712585, -1.341275, 1, 1, 1, 1, 1,
-0.3273286, -1.738995, -4.046782, 1, 1, 1, 1, 1,
-0.3261506, 1.411177, -0.7427831, 1, 1, 1, 1, 1,
-0.3254103, 2.204061, 0.2337941, 1, 1, 1, 1, 1,
-0.3198525, -0.5225333, -2.200682, 1, 1, 1, 1, 1,
-0.3166438, 0.2862749, -2.226933, 1, 1, 1, 1, 1,
-0.3149883, 0.2938207, 1.072804, 1, 1, 1, 1, 1,
-0.3076819, -0.7016987, -2.326287, 1, 1, 1, 1, 1,
-0.3024285, -0.05492831, -2.701017, 0, 0, 1, 1, 1,
-0.2967967, 1.538853, -0.5926324, 1, 0, 0, 1, 1,
-0.2934581, 0.136274, -1.841566, 1, 0, 0, 1, 1,
-0.2917457, 0.02887996, -2.933538, 1, 0, 0, 1, 1,
-0.2915629, 1.600828, 0.5598587, 1, 0, 0, 1, 1,
-0.2912237, 0.5193862, -0.8296777, 1, 0, 0, 1, 1,
-0.2904797, 1.289298, -0.06490035, 0, 0, 0, 1, 1,
-0.2897833, -0.7785814, -1.085322, 0, 0, 0, 1, 1,
-0.2888067, -0.5655865, -3.607189, 0, 0, 0, 1, 1,
-0.2748111, 0.976832, 0.08335181, 0, 0, 0, 1, 1,
-0.273037, -0.00944869, -0.4417677, 0, 0, 0, 1, 1,
-0.2727206, -1.765204, -4.124334, 0, 0, 0, 1, 1,
-0.2716768, -0.2389864, -3.375561, 0, 0, 0, 1, 1,
-0.2683652, -0.9336005, -2.728, 1, 1, 1, 1, 1,
-0.2682553, -1.59817, -3.537099, 1, 1, 1, 1, 1,
-0.2652344, 0.3461419, -0.8127955, 1, 1, 1, 1, 1,
-0.2617298, -0.07695826, -2.707269, 1, 1, 1, 1, 1,
-0.2580776, 0.3831362, 0.6781458, 1, 1, 1, 1, 1,
-0.2578068, 0.1719127, -2.216796, 1, 1, 1, 1, 1,
-0.2542985, -1.182215, -4.430701, 1, 1, 1, 1, 1,
-0.2452713, 0.2437643, -0.2807789, 1, 1, 1, 1, 1,
-0.2437602, -0.1639125, -2.126975, 1, 1, 1, 1, 1,
-0.2422422, -1.239339, -3.041613, 1, 1, 1, 1, 1,
-0.2407068, 1.858817, -1.095371, 1, 1, 1, 1, 1,
-0.2396636, 1.550856, 1.139425, 1, 1, 1, 1, 1,
-0.2375612, 1.504602, -0.563547, 1, 1, 1, 1, 1,
-0.235168, -0.00954342, -1.332326, 1, 1, 1, 1, 1,
-0.2350256, 0.2151289, -0.8209916, 1, 1, 1, 1, 1,
-0.2300423, -1.250641, -2.814731, 0, 0, 1, 1, 1,
-0.2275912, -0.09158743, -2.820135, 1, 0, 0, 1, 1,
-0.2261624, 1.56344, -0.7191954, 1, 0, 0, 1, 1,
-0.2246338, -1.267567, -3.424179, 1, 0, 0, 1, 1,
-0.2245774, -0.8040007, -3.828904, 1, 0, 0, 1, 1,
-0.2235191, -0.9823782, -2.447871, 1, 0, 0, 1, 1,
-0.2222487, 0.6899976, -0.6925868, 0, 0, 0, 1, 1,
-0.2194097, 0.5643794, -0.7441789, 0, 0, 0, 1, 1,
-0.2164959, -0.5010777, -4.292427, 0, 0, 0, 1, 1,
-0.216043, -0.4137489, -3.646464, 0, 0, 0, 1, 1,
-0.2144473, 1.664134, -0.1050274, 0, 0, 0, 1, 1,
-0.2107253, -0.3640422, -3.392513, 0, 0, 0, 1, 1,
-0.2092847, 0.874011, -1.265414, 0, 0, 0, 1, 1,
-0.205385, 0.5713658, -0.08115698, 1, 1, 1, 1, 1,
-0.1980501, 1.770543, 1.556929, 1, 1, 1, 1, 1,
-0.1959067, -1.218602, -1.147163, 1, 1, 1, 1, 1,
-0.1901959, -0.900699, -2.268883, 1, 1, 1, 1, 1,
-0.1889494, 1.041145, -0.324193, 1, 1, 1, 1, 1,
-0.1884867, 1.531935, -0.5583739, 1, 1, 1, 1, 1,
-0.1868302, -1.116481, -4.586549, 1, 1, 1, 1, 1,
-0.185952, -0.8835366, -3.177434, 1, 1, 1, 1, 1,
-0.1858452, -0.02716434, 0.9410257, 1, 1, 1, 1, 1,
-0.1829718, -1.840034, -2.899876, 1, 1, 1, 1, 1,
-0.1807864, -1.0292, -1.860018, 1, 1, 1, 1, 1,
-0.1775937, -0.5427693, -2.862049, 1, 1, 1, 1, 1,
-0.1769597, -1.79961, -3.899552, 1, 1, 1, 1, 1,
-0.1538568, 1.134842, 1.038223, 1, 1, 1, 1, 1,
-0.1509983, -1.721877, -3.244699, 1, 1, 1, 1, 1,
-0.1509798, 0.3044308, -0.8063868, 0, 0, 1, 1, 1,
-0.1501139, -0.2474013, -0.9601888, 1, 0, 0, 1, 1,
-0.1460816, -1.326703, -4.989936, 1, 0, 0, 1, 1,
-0.145024, -0.9430445, -3.432905, 1, 0, 0, 1, 1,
-0.1441814, -0.4954946, -2.767723, 1, 0, 0, 1, 1,
-0.1418221, 0.1545282, -1.0431, 1, 0, 0, 1, 1,
-0.1397414, -0.5483413, -4.179558, 0, 0, 0, 1, 1,
-0.1352046, -1.402466, -3.068963, 0, 0, 0, 1, 1,
-0.1348724, -0.7797176, -3.64317, 0, 0, 0, 1, 1,
-0.1343067, 0.8367416, 0.6003746, 0, 0, 0, 1, 1,
-0.1334005, -0.1790498, -2.576829, 0, 0, 0, 1, 1,
-0.1299536, -1.930757, -2.983784, 0, 0, 0, 1, 1,
-0.1284987, -0.09872494, -1.739484, 0, 0, 0, 1, 1,
-0.1245318, 1.263465, -1.495446, 1, 1, 1, 1, 1,
-0.1235085, -0.2462195, -3.798321, 1, 1, 1, 1, 1,
-0.1224658, -0.7952751, -1.931432, 1, 1, 1, 1, 1,
-0.121502, -0.7365061, -3.289492, 1, 1, 1, 1, 1,
-0.1214462, -0.05232543, -2.085733, 1, 1, 1, 1, 1,
-0.1174368, 0.4864263, -0.06629283, 1, 1, 1, 1, 1,
-0.1158202, -1.229645, -2.714007, 1, 1, 1, 1, 1,
-0.1135512, 1.562213, 2.174034, 1, 1, 1, 1, 1,
-0.1108491, -0.09644563, -2.824009, 1, 1, 1, 1, 1,
-0.1085558, -0.6336462, -3.886184, 1, 1, 1, 1, 1,
-0.1083774, -0.9597399, -3.507841, 1, 1, 1, 1, 1,
-0.09464668, -1.200765, -2.683834, 1, 1, 1, 1, 1,
-0.09416519, 0.5930033, -0.05607404, 1, 1, 1, 1, 1,
-0.09062152, -1.251912, -3.221734, 1, 1, 1, 1, 1,
-0.09024745, -0.3878241, -3.69576, 1, 1, 1, 1, 1,
-0.09016373, -0.1521832, -2.461395, 0, 0, 1, 1, 1,
-0.07942417, 0.6591307, 0.3764343, 1, 0, 0, 1, 1,
-0.07185074, -0.4969121, -3.715495, 1, 0, 0, 1, 1,
-0.07179338, -0.5846936, -2.618333, 1, 0, 0, 1, 1,
-0.06972572, -0.4550013, -3.209278, 1, 0, 0, 1, 1,
-0.06822672, 0.1134311, 0.02159702, 1, 0, 0, 1, 1,
-0.06470688, -0.7261006, -3.286618, 0, 0, 0, 1, 1,
-0.06020138, 0.295739, -1.232657, 0, 0, 0, 1, 1,
-0.05821245, -0.1699684, -3.203472, 0, 0, 0, 1, 1,
-0.05750439, 0.08623446, 0.2130725, 0, 0, 0, 1, 1,
-0.05623678, 1.070961, 0.1860329, 0, 0, 0, 1, 1,
-0.05298104, -0.6863953, -3.991384, 0, 0, 0, 1, 1,
-0.05068377, -1.450586, -3.150045, 0, 0, 0, 1, 1,
-0.05064078, -1.054982, -1.870659, 1, 1, 1, 1, 1,
-0.04796187, 1.340659, 0.3373753, 1, 1, 1, 1, 1,
-0.04223254, 0.1961614, 0.7912657, 1, 1, 1, 1, 1,
-0.03134735, 1.027573, 0.463356, 1, 1, 1, 1, 1,
-0.02782912, 0.9305778, -0.296196, 1, 1, 1, 1, 1,
-0.02681746, -1.151803, -2.52844, 1, 1, 1, 1, 1,
-0.02623716, -0.7663105, -4.028074, 1, 1, 1, 1, 1,
-0.02468859, -1.52952, -1.65781, 1, 1, 1, 1, 1,
-0.02381728, -2.457719, -5.351728, 1, 1, 1, 1, 1,
-0.0237044, -0.1751964, -3.39856, 1, 1, 1, 1, 1,
-0.02329591, -0.4649884, -4.786808, 1, 1, 1, 1, 1,
-0.0217995, -2.941971, -1.552134, 1, 1, 1, 1, 1,
-0.02137878, -1.004037, -3.444623, 1, 1, 1, 1, 1,
-0.01973722, -0.3437416, -1.21044, 1, 1, 1, 1, 1,
-0.01756353, 1.022728, 1.670391, 1, 1, 1, 1, 1,
-0.01643922, -0.3699461, -3.192041, 0, 0, 1, 1, 1,
-0.01429652, 0.7449046, -0.7994029, 1, 0, 0, 1, 1,
-0.01014339, -1.28121, -2.645678, 1, 0, 0, 1, 1,
-0.009497391, -0.6005915, -3.497153, 1, 0, 0, 1, 1,
-0.005928063, -0.3553974, -3.297157, 1, 0, 0, 1, 1,
-0.002967828, -1.17045, -3.600107, 1, 0, 0, 1, 1,
0.002680373, -1.800679, 3.8567, 0, 0, 0, 1, 1,
0.004362258, 0.7580563, 1.340644, 0, 0, 0, 1, 1,
0.007961294, -0.5512678, 1.850169, 0, 0, 0, 1, 1,
0.01230095, 0.935648, 0.7610371, 0, 0, 0, 1, 1,
0.01530988, 1.259386, 0.6091861, 0, 0, 0, 1, 1,
0.01693242, -0.3468352, 3.605054, 0, 0, 0, 1, 1,
0.01779373, 0.2465701, -0.428174, 0, 0, 0, 1, 1,
0.01958764, -0.528836, 3.349558, 1, 1, 1, 1, 1,
0.02411873, -0.1605685, 4.710761, 1, 1, 1, 1, 1,
0.02619481, 1.061832, 1.124291, 1, 1, 1, 1, 1,
0.02634906, -0.02620124, 3.351752, 1, 1, 1, 1, 1,
0.02673531, 0.9358492, 0.6725835, 1, 1, 1, 1, 1,
0.02681192, 0.05385948, 0.2213475, 1, 1, 1, 1, 1,
0.02724607, -2.382116, 0.9834642, 1, 1, 1, 1, 1,
0.02891201, -1.535119, 5.338219, 1, 1, 1, 1, 1,
0.02948513, -0.1924383, 3.881301, 1, 1, 1, 1, 1,
0.0339495, 0.2331053, 0.7597266, 1, 1, 1, 1, 1,
0.03992385, -2.370852, 2.447624, 1, 1, 1, 1, 1,
0.04131015, 0.9276743, 0.1616715, 1, 1, 1, 1, 1,
0.04345107, 0.7784429, 1.422255, 1, 1, 1, 1, 1,
0.04622456, 0.01803684, 0.1268082, 1, 1, 1, 1, 1,
0.04661271, 1.271943, 0.3328246, 1, 1, 1, 1, 1,
0.04765426, 0.3351277, -0.1025559, 0, 0, 1, 1, 1,
0.05132617, -1.970416, 2.590781, 1, 0, 0, 1, 1,
0.05580696, 1.0269, 0.30991, 1, 0, 0, 1, 1,
0.05939355, -1.794846, 4.51749, 1, 0, 0, 1, 1,
0.06019526, -0.843156, 3.140087, 1, 0, 0, 1, 1,
0.06337022, 0.6490014, -0.05347894, 1, 0, 0, 1, 1,
0.06489933, -0.02152349, 1.418201, 0, 0, 0, 1, 1,
0.06612545, -1.367908, 3.573979, 0, 0, 0, 1, 1,
0.06632016, 0.2380192, 0.06660911, 0, 0, 0, 1, 1,
0.06660321, 0.7768596, -0.3975374, 0, 0, 0, 1, 1,
0.06745075, 0.2054123, 0.4604329, 0, 0, 0, 1, 1,
0.06867243, 0.1233937, 1.083132, 0, 0, 0, 1, 1,
0.07640129, 0.903652, 0.6342955, 0, 0, 0, 1, 1,
0.0782265, 0.5391887, -0.5741987, 1, 1, 1, 1, 1,
0.07896292, -0.2744032, 3.863889, 1, 1, 1, 1, 1,
0.08120581, -0.5167587, 2.479506, 1, 1, 1, 1, 1,
0.08393367, 0.3852616, 0.3396463, 1, 1, 1, 1, 1,
0.08849412, 2.075806, 0.4033673, 1, 1, 1, 1, 1,
0.08868184, 1.112317, 0.3752869, 1, 1, 1, 1, 1,
0.09274918, 1.613239, 0.6470275, 1, 1, 1, 1, 1,
0.09406625, 0.3549454, 0.6245754, 1, 1, 1, 1, 1,
0.094697, -0.02795958, 0.9174446, 1, 1, 1, 1, 1,
0.09554848, -0.3395391, 2.798124, 1, 1, 1, 1, 1,
0.09687682, 0.4963476, 0.1730855, 1, 1, 1, 1, 1,
0.09982827, 0.7483287, 1.908928, 1, 1, 1, 1, 1,
0.09993352, -0.7913927, 3.766628, 1, 1, 1, 1, 1,
0.1038144, 0.1717144, 0.6408381, 1, 1, 1, 1, 1,
0.1043754, -1.274547, 3.849639, 1, 1, 1, 1, 1,
0.1045628, 0.49991, -0.2877348, 0, 0, 1, 1, 1,
0.1048371, -0.6167657, 4.817813, 1, 0, 0, 1, 1,
0.1052382, -1.374676, 3.282306, 1, 0, 0, 1, 1,
0.1070217, -1.263207, 2.10183, 1, 0, 0, 1, 1,
0.1144023, 0.1944758, 2.213949, 1, 0, 0, 1, 1,
0.1153623, -0.7473468, 2.913492, 1, 0, 0, 1, 1,
0.1177155, 0.4874701, -0.9161053, 0, 0, 0, 1, 1,
0.1181369, 0.1511725, 2.624416, 0, 0, 0, 1, 1,
0.1219704, 0.2830709, 0.7691592, 0, 0, 0, 1, 1,
0.1230874, 1.027571, 0.2675323, 0, 0, 0, 1, 1,
0.1255342, 1.008022, 2.162526, 0, 0, 0, 1, 1,
0.1280025, 3.130005, 0.4222894, 0, 0, 0, 1, 1,
0.1282249, 0.808431, 1.104378, 0, 0, 0, 1, 1,
0.1292534, -0.6779959, 2.230334, 1, 1, 1, 1, 1,
0.1321163, -0.1933542, 3.284165, 1, 1, 1, 1, 1,
0.1325843, -0.6218214, 1.192449, 1, 1, 1, 1, 1,
0.1360094, -0.293923, 1.72482, 1, 1, 1, 1, 1,
0.1385519, -0.4693788, 3.429321, 1, 1, 1, 1, 1,
0.1415726, -0.6658259, 3.129012, 1, 1, 1, 1, 1,
0.1423402, 0.3551273, 0.8108645, 1, 1, 1, 1, 1,
0.142501, 0.1991773, 0.9161956, 1, 1, 1, 1, 1,
0.1430639, 0.2805525, 0.5587279, 1, 1, 1, 1, 1,
0.1446505, -0.3132373, 2.10295, 1, 1, 1, 1, 1,
0.1488026, 0.6303309, -0.5493531, 1, 1, 1, 1, 1,
0.1498783, 0.3415259, 0.8206349, 1, 1, 1, 1, 1,
0.1519907, 1.215623, -1.163253, 1, 1, 1, 1, 1,
0.157634, 0.2945226, 0.4885497, 1, 1, 1, 1, 1,
0.1638377, -1.006302, 2.89542, 1, 1, 1, 1, 1,
0.1664523, 0.9581941, 0.290439, 0, 0, 1, 1, 1,
0.1671483, 0.1167181, -1.311268, 1, 0, 0, 1, 1,
0.1692204, 0.8433982, -1.597135, 1, 0, 0, 1, 1,
0.1734945, 2.057515, 0.2933587, 1, 0, 0, 1, 1,
0.1775696, 0.3831175, 1.362998, 1, 0, 0, 1, 1,
0.177808, 1.366224, 0.7336573, 1, 0, 0, 1, 1,
0.1791864, 0.6743716, 0.06471029, 0, 0, 0, 1, 1,
0.1816777, 0.877116, -0.2228459, 0, 0, 0, 1, 1,
0.181678, -0.1777368, 1.667406, 0, 0, 0, 1, 1,
0.1842875, 0.2053376, 1.14089, 0, 0, 0, 1, 1,
0.1856837, 2.576008, 0.7196953, 0, 0, 0, 1, 1,
0.1941323, 1.532266, 0.1295884, 0, 0, 0, 1, 1,
0.1981295, -0.8316112, 1.833977, 0, 0, 0, 1, 1,
0.20163, 0.787027, 0.8189046, 1, 1, 1, 1, 1,
0.2028082, 1.095362, -1.36858, 1, 1, 1, 1, 1,
0.2058406, -0.3617199, 1.534014, 1, 1, 1, 1, 1,
0.2086737, -1.101192, 0.153073, 1, 1, 1, 1, 1,
0.2102055, -0.6743887, 0.9993678, 1, 1, 1, 1, 1,
0.2223226, -0.9864719, 3.684803, 1, 1, 1, 1, 1,
0.2254314, -0.3270267, 3.113799, 1, 1, 1, 1, 1,
0.2278679, 0.524393, -1.385359, 1, 1, 1, 1, 1,
0.2282188, 0.6681144, -2.230835, 1, 1, 1, 1, 1,
0.2289754, 1.922152, 1.271799, 1, 1, 1, 1, 1,
0.2315235, 1.087543, 0.2269792, 1, 1, 1, 1, 1,
0.2321723, 1.943907, 0.385524, 1, 1, 1, 1, 1,
0.2329809, -1.197568, 4.7854, 1, 1, 1, 1, 1,
0.2337915, 2.058304, 0.4563933, 1, 1, 1, 1, 1,
0.2398224, -0.6079612, 2.037585, 1, 1, 1, 1, 1,
0.2441083, 0.5620894, -0.1316432, 0, 0, 1, 1, 1,
0.2511297, -0.7157499, 1.44223, 1, 0, 0, 1, 1,
0.2519934, 2.131274, -1.496239, 1, 0, 0, 1, 1,
0.2561022, -0.3376105, 1.093128, 1, 0, 0, 1, 1,
0.2562259, 1.500842, -0.6066002, 1, 0, 0, 1, 1,
0.2627515, 0.6622006, 1.464419, 1, 0, 0, 1, 1,
0.2673952, -0.4783845, 3.053637, 0, 0, 0, 1, 1,
0.2684452, -0.1718152, 2.250904, 0, 0, 0, 1, 1,
0.2697967, 0.05098083, 2.631734, 0, 0, 0, 1, 1,
0.2703835, -0.4363331, 2.728132, 0, 0, 0, 1, 1,
0.275214, 1.815369, 0.4397259, 0, 0, 0, 1, 1,
0.2782402, 0.6584961, -1.019112, 0, 0, 0, 1, 1,
0.2782834, 1.142083, 0.01350923, 0, 0, 0, 1, 1,
0.2803048, 0.4965347, 1.362218, 1, 1, 1, 1, 1,
0.2829879, -0.7412094, 4.500482, 1, 1, 1, 1, 1,
0.2878403, -0.2010754, 2.922272, 1, 1, 1, 1, 1,
0.2882407, 1.297279, -0.9132541, 1, 1, 1, 1, 1,
0.2919396, 0.2179988, 0.2309661, 1, 1, 1, 1, 1,
0.2932365, 0.1364984, 0.3878395, 1, 1, 1, 1, 1,
0.2941047, -0.8532593, 1.294112, 1, 1, 1, 1, 1,
0.2977121, -0.129257, 1.819924, 1, 1, 1, 1, 1,
0.3056134, -0.8692783, 2.301399, 1, 1, 1, 1, 1,
0.3062908, -1.718421, 4.238806, 1, 1, 1, 1, 1,
0.310795, -1.134973, 3.286913, 1, 1, 1, 1, 1,
0.3113351, -1.851409, 3.926924, 1, 1, 1, 1, 1,
0.3139105, -1.491902, 2.569743, 1, 1, 1, 1, 1,
0.3148473, 1.304521, 1.199175, 1, 1, 1, 1, 1,
0.3185194, -0.8053017, 3.352033, 1, 1, 1, 1, 1,
0.3190455, 1.585729, 0.8254986, 0, 0, 1, 1, 1,
0.3220941, 0.7619383, 1.070455, 1, 0, 0, 1, 1,
0.3267543, -0.7329444, 2.548608, 1, 0, 0, 1, 1,
0.330207, 0.294311, 0.9354432, 1, 0, 0, 1, 1,
0.3341923, -2.991435, 4.246646, 1, 0, 0, 1, 1,
0.3405178, 1.412947, -1.192563, 1, 0, 0, 1, 1,
0.3407567, -0.5782288, 2.851932, 0, 0, 0, 1, 1,
0.3427814, 1.107975, -0.2746659, 0, 0, 0, 1, 1,
0.3442304, 1.402365, 0.6474816, 0, 0, 0, 1, 1,
0.3496744, -1.448119, 3.956389, 0, 0, 0, 1, 1,
0.354832, -0.6843091, 1.232997, 0, 0, 0, 1, 1,
0.3554862, 0.5964515, -0.1969328, 0, 0, 0, 1, 1,
0.3555565, -0.6368635, 3.98869, 0, 0, 0, 1, 1,
0.356269, -0.5675414, 3.383567, 1, 1, 1, 1, 1,
0.3589295, 0.1851231, 1.935041, 1, 1, 1, 1, 1,
0.3595433, -2.320616, 2.65581, 1, 1, 1, 1, 1,
0.3599507, 0.8644004, 1.09629, 1, 1, 1, 1, 1,
0.3633143, 1.6146, 0.4236175, 1, 1, 1, 1, 1,
0.3647088, 0.004370053, 1.986693, 1, 1, 1, 1, 1,
0.3661525, -0.1481528, 3.34527, 1, 1, 1, 1, 1,
0.3756742, 1.772367, 0.6597015, 1, 1, 1, 1, 1,
0.3802043, -1.078506, 2.646985, 1, 1, 1, 1, 1,
0.3814981, 1.859336, 0.529065, 1, 1, 1, 1, 1,
0.3818465, 0.7697207, 1.211355, 1, 1, 1, 1, 1,
0.3852643, 1.125286, -0.7856401, 1, 1, 1, 1, 1,
0.3926372, 0.7199845, 1.201237, 1, 1, 1, 1, 1,
0.3959596, -3.479258, 3.826502, 1, 1, 1, 1, 1,
0.3989634, -1.647729, 2.475078, 1, 1, 1, 1, 1,
0.4014781, 0.1118149, 2.309967, 0, 0, 1, 1, 1,
0.4040563, 1.756333, -1.509703, 1, 0, 0, 1, 1,
0.4095453, -0.1261156, 3.97504, 1, 0, 0, 1, 1,
0.4125564, -1.705736, 2.740207, 1, 0, 0, 1, 1,
0.4143373, 0.05161606, 2.647409, 1, 0, 0, 1, 1,
0.4206261, 0.2679424, 1.484724, 1, 0, 0, 1, 1,
0.4207655, -0.4438089, 2.799727, 0, 0, 0, 1, 1,
0.4276958, -0.0435759, 1.561727, 0, 0, 0, 1, 1,
0.4281306, -0.246775, 1.669071, 0, 0, 0, 1, 1,
0.4325384, 0.4835681, 2.88016, 0, 0, 0, 1, 1,
0.4371844, 0.157114, 1.127635, 0, 0, 0, 1, 1,
0.4376027, -0.3789364, 2.268084, 0, 0, 0, 1, 1,
0.439454, -0.8043021, 1.859122, 0, 0, 0, 1, 1,
0.443655, 0.608792, 0.0552457, 1, 1, 1, 1, 1,
0.444066, -0.3089523, 2.672008, 1, 1, 1, 1, 1,
0.4456484, -0.1994882, 3.339442, 1, 1, 1, 1, 1,
0.455517, 1.170968, -1.638599, 1, 1, 1, 1, 1,
0.4590671, 0.2482796, 0.7300549, 1, 1, 1, 1, 1,
0.4627384, -1.448333, 2.691846, 1, 1, 1, 1, 1,
0.4628104, -2.079072, 1.923909, 1, 1, 1, 1, 1,
0.4641409, 1.134039, -0.6919875, 1, 1, 1, 1, 1,
0.4699597, 1.377877, 1.112133, 1, 1, 1, 1, 1,
0.4709988, 1.74049, -0.12848, 1, 1, 1, 1, 1,
0.4829857, 0.855863, 0.6398875, 1, 1, 1, 1, 1,
0.4883693, -1.589296, 1.934931, 1, 1, 1, 1, 1,
0.4886422, 1.555386, 0.4586029, 1, 1, 1, 1, 1,
0.4893728, 0.9345528, -1.426451, 1, 1, 1, 1, 1,
0.4896132, 0.07007971, 1.777885, 1, 1, 1, 1, 1,
0.4902586, -1.24223, 1.853147, 0, 0, 1, 1, 1,
0.4971446, -0.5602496, 1.704975, 1, 0, 0, 1, 1,
0.4991199, -0.4657594, 2.507958, 1, 0, 0, 1, 1,
0.5017304, 0.7848616, -0.1045984, 1, 0, 0, 1, 1,
0.5020697, -2.095412, 3.835587, 1, 0, 0, 1, 1,
0.5137484, -0.4853185, 1.51572, 1, 0, 0, 1, 1,
0.516056, 0.5860592, 2.759819, 0, 0, 0, 1, 1,
0.5168549, -0.4588125, 1.806695, 0, 0, 0, 1, 1,
0.5224992, 0.285671, 0.1412608, 0, 0, 0, 1, 1,
0.5236959, -1.565195, 3.355244, 0, 0, 0, 1, 1,
0.5258756, -0.2460295, 1.721843, 0, 0, 0, 1, 1,
0.5260699, 0.505848, -0.6946784, 0, 0, 0, 1, 1,
0.5281567, -0.886784, 1.651994, 0, 0, 0, 1, 1,
0.5325565, -0.1752212, 3.074886, 1, 1, 1, 1, 1,
0.5327435, -0.132485, 3.343289, 1, 1, 1, 1, 1,
0.5339895, 1.088783, -1.192983, 1, 1, 1, 1, 1,
0.5401193, 0.9314657, 2.867891, 1, 1, 1, 1, 1,
0.5497479, -0.3461235, 1.403686, 1, 1, 1, 1, 1,
0.5616031, 1.392765, 1.336319, 1, 1, 1, 1, 1,
0.5641201, 0.3067656, -0.1207555, 1, 1, 1, 1, 1,
0.5653094, 1.036379, 0.4050241, 1, 1, 1, 1, 1,
0.5682579, 0.6198207, -1.628438, 1, 1, 1, 1, 1,
0.5701169, 0.8993822, -0.786541, 1, 1, 1, 1, 1,
0.5720167, -0.1267024, 2.51363, 1, 1, 1, 1, 1,
0.5807898, -0.07025272, 2.007618, 1, 1, 1, 1, 1,
0.5833485, 1.405356, 0.1797177, 1, 1, 1, 1, 1,
0.5838886, -0.8311719, 3.700429, 1, 1, 1, 1, 1,
0.5877646, -0.3731024, 1.006471, 1, 1, 1, 1, 1,
0.5900476, -0.771089, 1.567261, 0, 0, 1, 1, 1,
0.59447, 0.05592115, 2.115064, 1, 0, 0, 1, 1,
0.5949156, -0.5228735, 2.818704, 1, 0, 0, 1, 1,
0.5965645, 0.1797504, 1.759408, 1, 0, 0, 1, 1,
0.5992255, 0.505172, 2.327697, 1, 0, 0, 1, 1,
0.6000985, 0.3259835, 1.058855, 1, 0, 0, 1, 1,
0.6008432, 1.33878, -1.156181, 0, 0, 0, 1, 1,
0.6030107, 0.2477466, 0.62341, 0, 0, 0, 1, 1,
0.611295, 1.922012, -0.9310347, 0, 0, 0, 1, 1,
0.6175083, -1.213539, 3.852763, 0, 0, 0, 1, 1,
0.6179392, 0.4559662, 2.344456, 0, 0, 0, 1, 1,
0.6211917, 0.0747922, 1.801008, 0, 0, 0, 1, 1,
0.6213099, -1.910284, 2.390692, 0, 0, 0, 1, 1,
0.6284969, -1.020765, 3.198043, 1, 1, 1, 1, 1,
0.6312827, 0.06745685, 1.829587, 1, 1, 1, 1, 1,
0.6318678, -0.22545, 2.31777, 1, 1, 1, 1, 1,
0.6460501, -1.620744, 3.840276, 1, 1, 1, 1, 1,
0.6491312, 0.2214675, 1.202935, 1, 1, 1, 1, 1,
0.6504201, -0.2109684, 2.922834, 1, 1, 1, 1, 1,
0.6550296, -0.5843358, 3.483026, 1, 1, 1, 1, 1,
0.6594958, -0.2976306, 1.626749, 1, 1, 1, 1, 1,
0.6651886, 0.07433533, 0.4493182, 1, 1, 1, 1, 1,
0.6674178, 0.4375675, 0.4356744, 1, 1, 1, 1, 1,
0.6682977, -0.5241075, 3.661837, 1, 1, 1, 1, 1,
0.6695101, 1.290776, -0.5090503, 1, 1, 1, 1, 1,
0.669943, -0.2602924, 1.937526, 1, 1, 1, 1, 1,
0.6721593, -0.5692692, 2.380434, 1, 1, 1, 1, 1,
0.6756939, 0.5467498, 1.064744, 1, 1, 1, 1, 1,
0.6840877, 0.2152635, 2.042768, 0, 0, 1, 1, 1,
0.6855954, 1.109288, 1.259709, 1, 0, 0, 1, 1,
0.6870272, -0.9591488, 2.470142, 1, 0, 0, 1, 1,
0.6871346, 0.6276898, -0.669613, 1, 0, 0, 1, 1,
0.6941733, 1.924571, -1.755388, 1, 0, 0, 1, 1,
0.6953657, 1.364347, 0.6493185, 1, 0, 0, 1, 1,
0.7059479, -0.756289, 1.161875, 0, 0, 0, 1, 1,
0.7094211, 0.1306976, 0.9605229, 0, 0, 0, 1, 1,
0.7108324, 1.68586, 0.6013015, 0, 0, 0, 1, 1,
0.7111174, 0.0295873, 1.803051, 0, 0, 0, 1, 1,
0.7184581, -0.4927759, 1.456087, 0, 0, 0, 1, 1,
0.7252157, -0.1017623, 1.891742, 0, 0, 0, 1, 1,
0.7403388, -0.04698419, 1.169866, 0, 0, 0, 1, 1,
0.7412141, 1.173925, -0.6805583, 1, 1, 1, 1, 1,
0.7415115, -0.0783991, 2.669069, 1, 1, 1, 1, 1,
0.7430137, -0.2787612, 1.242968, 1, 1, 1, 1, 1,
0.7432599, -1.686784, 2.768015, 1, 1, 1, 1, 1,
0.7543716, -1.454136, 2.598644, 1, 1, 1, 1, 1,
0.7563372, -1.042048, 0.9971499, 1, 1, 1, 1, 1,
0.7575571, -0.4822746, 2.157718, 1, 1, 1, 1, 1,
0.7581356, 2.666514, 0.3422336, 1, 1, 1, 1, 1,
0.763743, -0.1471833, 1.67167, 1, 1, 1, 1, 1,
0.7642906, -1.873751, 3.049752, 1, 1, 1, 1, 1,
0.7718576, -1.173861, 3.108152, 1, 1, 1, 1, 1,
0.7724046, 0.4737189, 2.42207, 1, 1, 1, 1, 1,
0.7793558, -0.9218209, 2.60098, 1, 1, 1, 1, 1,
0.7824404, -0.02637022, 2.760326, 1, 1, 1, 1, 1,
0.7831798, -0.4372807, 3.573041, 1, 1, 1, 1, 1,
0.7888341, 0.5741037, 0.6027528, 0, 0, 1, 1, 1,
0.7904253, 0.8671165, 1.065841, 1, 0, 0, 1, 1,
0.796074, 1.472547, 1.647261, 1, 0, 0, 1, 1,
0.8008679, -0.2524259, 0.8212281, 1, 0, 0, 1, 1,
0.8023721, 0.2925038, 1.352521, 1, 0, 0, 1, 1,
0.8036034, 1.694518, -1.705258, 1, 0, 0, 1, 1,
0.8037558, 1.504178, 1.18951, 0, 0, 0, 1, 1,
0.8080117, 0.2684179, 0.2586652, 0, 0, 0, 1, 1,
0.8096117, 0.1629536, 1.982321, 0, 0, 0, 1, 1,
0.8115328, -2.035433, 4.504711, 0, 0, 0, 1, 1,
0.8117086, -0.294919, 3.317991, 0, 0, 0, 1, 1,
0.8128943, 0.4335195, 2.436536, 0, 0, 0, 1, 1,
0.8151034, 1.354336, 0.3354284, 0, 0, 0, 1, 1,
0.8175501, -0.4845628, 0.7544717, 1, 1, 1, 1, 1,
0.8284603, -0.7944221, 1.550299, 1, 1, 1, 1, 1,
0.8304518, -1.182321, 3.534428, 1, 1, 1, 1, 1,
0.8347, -0.5362149, 2.108057, 1, 1, 1, 1, 1,
0.8355159, 0.7692996, 1.398764, 1, 1, 1, 1, 1,
0.8478282, -1.679877, 4.772691, 1, 1, 1, 1, 1,
0.8486711, -0.4617948, 1.886627, 1, 1, 1, 1, 1,
0.8527977, 1.506588, -0.2300104, 1, 1, 1, 1, 1,
0.8546564, -0.8155347, 1.09646, 1, 1, 1, 1, 1,
0.8630776, 0.1540488, 0.7230441, 1, 1, 1, 1, 1,
0.8634448, 0.2193485, 0.4560575, 1, 1, 1, 1, 1,
0.8649825, 1.35362, 1.307654, 1, 1, 1, 1, 1,
0.8697389, -1.212451, 1.885434, 1, 1, 1, 1, 1,
0.8762092, -0.8205349, 3.297361, 1, 1, 1, 1, 1,
0.8765732, -0.3128104, 2.166667, 1, 1, 1, 1, 1,
0.8871382, 0.1523711, 1.350309, 0, 0, 1, 1, 1,
0.8911149, 0.05856099, 3.44806, 1, 0, 0, 1, 1,
0.8945549, -1.787519, 1.045022, 1, 0, 0, 1, 1,
0.896185, 0.5026936, 0.2449648, 1, 0, 0, 1, 1,
0.9030026, 1.845593, -0.585485, 1, 0, 0, 1, 1,
0.923184, -0.33477, 1.989555, 1, 0, 0, 1, 1,
0.9356416, -0.5273526, 1.253374, 0, 0, 0, 1, 1,
0.9379524, 2.262128, 1.589367, 0, 0, 0, 1, 1,
0.9436288, 1.772745, 2.471234, 0, 0, 0, 1, 1,
0.944023, -0.3031004, 0.9325167, 0, 0, 0, 1, 1,
0.9443932, -0.09676406, 1.533788, 0, 0, 0, 1, 1,
0.9458985, 0.6677077, 0.5309553, 0, 0, 0, 1, 1,
0.9475206, -0.1802127, 2.222914, 0, 0, 0, 1, 1,
0.9517317, 1.362744, 0.1589705, 1, 1, 1, 1, 1,
0.9546806, 0.4453077, -0.5360224, 1, 1, 1, 1, 1,
0.9563614, 0.9408245, -1.14407, 1, 1, 1, 1, 1,
0.9570107, 1.107269, -0.8825077, 1, 1, 1, 1, 1,
0.9590183, 1.541109, -0.5205824, 1, 1, 1, 1, 1,
0.9604805, -0.3213993, 2.52528, 1, 1, 1, 1, 1,
0.9631718, -0.7831213, 3.579503, 1, 1, 1, 1, 1,
0.9700881, 0.4306209, 1.527091, 1, 1, 1, 1, 1,
0.9804563, 1.357331, 0.6001306, 1, 1, 1, 1, 1,
0.9807613, 0.8796374, -0.5205383, 1, 1, 1, 1, 1,
0.9824883, 0.6636469, 1.658477, 1, 1, 1, 1, 1,
0.9869028, 1.422949, -0.6222167, 1, 1, 1, 1, 1,
0.9972035, 1.234996, 0.3749871, 1, 1, 1, 1, 1,
0.9992183, 0.3642978, 3.265096, 1, 1, 1, 1, 1,
1.004889, -0.4020812, 1.415417, 1, 1, 1, 1, 1,
1.015939, -1.436936, 2.30341, 0, 0, 1, 1, 1,
1.018559, -2.134849, 3.046077, 1, 0, 0, 1, 1,
1.023682, -1.368671, 2.965317, 1, 0, 0, 1, 1,
1.025311, -1.327498, 1.526797, 1, 0, 0, 1, 1,
1.026764, 0.8284904, 1.505192, 1, 0, 0, 1, 1,
1.028554, 1.198476, 0.09837856, 1, 0, 0, 1, 1,
1.031196, -0.478269, 2.878471, 0, 0, 0, 1, 1,
1.047603, -0.5290871, 2.919176, 0, 0, 0, 1, 1,
1.054301, -0.5115507, 0.6072995, 0, 0, 0, 1, 1,
1.05885, 0.1516632, 1.229026, 0, 0, 0, 1, 1,
1.058974, 1.636021, -0.06640242, 0, 0, 0, 1, 1,
1.063345, -0.04882289, 3.077795, 0, 0, 0, 1, 1,
1.064261, 0.3410807, 1.109681, 0, 0, 0, 1, 1,
1.065214, 0.1063323, 0.247007, 1, 1, 1, 1, 1,
1.072179, 0.0727184, 1.646247, 1, 1, 1, 1, 1,
1.077328, -0.9427956, 2.581343, 1, 1, 1, 1, 1,
1.080148, -1.530828, 1.438372, 1, 1, 1, 1, 1,
1.085396, -0.8252843, 3.084169, 1, 1, 1, 1, 1,
1.086743, -0.4204405, 2.299858, 1, 1, 1, 1, 1,
1.088886, -0.009052583, 2.325862, 1, 1, 1, 1, 1,
1.090815, 0.3804982, 1.788184, 1, 1, 1, 1, 1,
1.096509, 0.03315372, 1.476555, 1, 1, 1, 1, 1,
1.096796, 1.009081, -1.08403, 1, 1, 1, 1, 1,
1.101918, 0.1182495, 1.135392, 1, 1, 1, 1, 1,
1.105046, 0.1678028, 1.82923, 1, 1, 1, 1, 1,
1.110162, -0.7634609, 1.583337, 1, 1, 1, 1, 1,
1.112282, -0.896844, 1.961691, 1, 1, 1, 1, 1,
1.116472, 0.2680815, -0.5793885, 1, 1, 1, 1, 1,
1.119228, -0.4361929, 1.760701, 0, 0, 1, 1, 1,
1.1229, -2.191305, 2.66871, 1, 0, 0, 1, 1,
1.126748, -1.767464, 1.82897, 1, 0, 0, 1, 1,
1.133616, 0.1695691, 1.677887, 1, 0, 0, 1, 1,
1.139508, -1.138549, 1.700218, 1, 0, 0, 1, 1,
1.139859, 1.135417, 1.818006, 1, 0, 0, 1, 1,
1.144766, -2.877519, 3.036288, 0, 0, 0, 1, 1,
1.147007, -0.4449633, 1.432578, 0, 0, 0, 1, 1,
1.147591, 0.8337288, -0.002950308, 0, 0, 0, 1, 1,
1.154821, -0.1943479, 0.4318731, 0, 0, 0, 1, 1,
1.158028, 0.2295078, 1.503023, 0, 0, 0, 1, 1,
1.163835, -0.4025167, 1.772244, 0, 0, 0, 1, 1,
1.168284, -0.6294907, 2.961304, 0, 0, 0, 1, 1,
1.172825, -0.2623552, 0.8002402, 1, 1, 1, 1, 1,
1.175089, 0.03065453, 0.3742522, 1, 1, 1, 1, 1,
1.179244, -0.856355, 2.994275, 1, 1, 1, 1, 1,
1.19481, 0.5372654, 0.8445793, 1, 1, 1, 1, 1,
1.195809, -0.238939, 0.4033939, 1, 1, 1, 1, 1,
1.206648, -0.2928093, 1.616276, 1, 1, 1, 1, 1,
1.21155, -0.5157167, 0.42306, 1, 1, 1, 1, 1,
1.219373, 0.2394526, 1.844394, 1, 1, 1, 1, 1,
1.22193, -1.218189, 2.296289, 1, 1, 1, 1, 1,
1.227986, 0.1324757, 1.716574, 1, 1, 1, 1, 1,
1.22938, -0.8211144, 3.138276, 1, 1, 1, 1, 1,
1.236767, -0.7779307, 1.011577, 1, 1, 1, 1, 1,
1.241236, -0.5685116, 2.209682, 1, 1, 1, 1, 1,
1.24158, -1.563676, 3.155589, 1, 1, 1, 1, 1,
1.244947, 0.6906485, 1.846398, 1, 1, 1, 1, 1,
1.2519, -0.6663059, 1.054267, 0, 0, 1, 1, 1,
1.252201, 0.05437616, 1.145029, 1, 0, 0, 1, 1,
1.261104, -1.357042, 2.320266, 1, 0, 0, 1, 1,
1.26534, -1.012892, 1.974262, 1, 0, 0, 1, 1,
1.265401, 0.7746822, 1.386209, 1, 0, 0, 1, 1,
1.267579, -0.5054361, 2.25882, 1, 0, 0, 1, 1,
1.2798, -0.08866087, 1.517262, 0, 0, 0, 1, 1,
1.282289, 1.018078, 2.14562, 0, 0, 0, 1, 1,
1.284258, 0.7268922, 0.9764178, 0, 0, 0, 1, 1,
1.284428, 0.07450272, 0.7050839, 0, 0, 0, 1, 1,
1.285724, -0.4290189, 2.223803, 0, 0, 0, 1, 1,
1.295507, -0.7214199, 4.082381, 0, 0, 0, 1, 1,
1.301344, 1.132637, 2.170925, 0, 0, 0, 1, 1,
1.303936, -1.192525, 1.81266, 1, 1, 1, 1, 1,
1.315446, -2.152307, 3.930697, 1, 1, 1, 1, 1,
1.326183, -0.9108862, 1.246232, 1, 1, 1, 1, 1,
1.331612, -1.101923, 2.522224, 1, 1, 1, 1, 1,
1.333685, 1.176078, 0.9472112, 1, 1, 1, 1, 1,
1.362787, 0.4369752, -1.20159, 1, 1, 1, 1, 1,
1.369185, 0.4633611, -0.3710111, 1, 1, 1, 1, 1,
1.369753, 0.09624916, 1.22485, 1, 1, 1, 1, 1,
1.37246, -0.7094468, 1.807781, 1, 1, 1, 1, 1,
1.38895, 0.8100873, -0.0579882, 1, 1, 1, 1, 1,
1.417751, 0.4329804, -0.2413416, 1, 1, 1, 1, 1,
1.422542, -0.8948709, 2.301692, 1, 1, 1, 1, 1,
1.424414, 1.644063, 1.835884, 1, 1, 1, 1, 1,
1.426867, 0.3635495, 0.9514283, 1, 1, 1, 1, 1,
1.434941, 2.486993, 0.5952524, 1, 1, 1, 1, 1,
1.436378, -0.59873, 2.300743, 0, 0, 1, 1, 1,
1.440885, 0.1343482, 1.992097, 1, 0, 0, 1, 1,
1.448516, -0.269536, 2.515958, 1, 0, 0, 1, 1,
1.453328, 1.036848, -0.57675, 1, 0, 0, 1, 1,
1.457812, -0.4184526, 1.749747, 1, 0, 0, 1, 1,
1.501893, -0.1915371, 3.210143, 1, 0, 0, 1, 1,
1.505899, -1.694511, 1.373143, 0, 0, 0, 1, 1,
1.511762, -0.2407932, 0.504498, 0, 0, 0, 1, 1,
1.515317, -1.504838, 0.9434447, 0, 0, 0, 1, 1,
1.522925, 0.7122712, 0.9623478, 0, 0, 0, 1, 1,
1.523683, 0.2559025, 2.099981, 0, 0, 0, 1, 1,
1.54638, -1.534408, 1.675346, 0, 0, 0, 1, 1,
1.546774, 0.3865384, 1.164297, 0, 0, 0, 1, 1,
1.549151, 0.3344528, 2.29316, 1, 1, 1, 1, 1,
1.549552, -0.9628413, 3.379535, 1, 1, 1, 1, 1,
1.557009, -0.2669562, 3.267715, 1, 1, 1, 1, 1,
1.561334, -0.1361895, 1.567659, 1, 1, 1, 1, 1,
1.570194, -0.540364, 0.9400371, 1, 1, 1, 1, 1,
1.576266, -1.087463, 3.354935, 1, 1, 1, 1, 1,
1.582847, -2.468372, 2.182004, 1, 1, 1, 1, 1,
1.586532, 0.6068938, 0.5816996, 1, 1, 1, 1, 1,
1.588335, 0.2715412, 1.273436, 1, 1, 1, 1, 1,
1.588758, 0.2424429, 2.000014, 1, 1, 1, 1, 1,
1.607604, -0.6001973, 1.028232, 1, 1, 1, 1, 1,
1.610482, -0.3103452, 2.253626, 1, 1, 1, 1, 1,
1.620276, -0.01402649, 1.891523, 1, 1, 1, 1, 1,
1.625141, -1.496059, 3.987456, 1, 1, 1, 1, 1,
1.643659, 1.479073, 0.6671809, 1, 1, 1, 1, 1,
1.670107, -0.5345013, 2.152996, 0, 0, 1, 1, 1,
1.671537, -0.4868343, 1.389406, 1, 0, 0, 1, 1,
1.671547, -0.848097, 2.90889, 1, 0, 0, 1, 1,
1.674831, 0.3673277, 1.529515, 1, 0, 0, 1, 1,
1.67494, 0.34412, 2.489721, 1, 0, 0, 1, 1,
1.682233, -0.8032487, 3.7268, 1, 0, 0, 1, 1,
1.691602, -0.3526248, 3.721215, 0, 0, 0, 1, 1,
1.701267, 0.1524137, -0.1162922, 0, 0, 0, 1, 1,
1.722548, -1.852009, 2.680288, 0, 0, 0, 1, 1,
1.753123, -0.0621018, 2.695862, 0, 0, 0, 1, 1,
1.774692, -0.4617063, 2.636796, 0, 0, 0, 1, 1,
1.782154, 0.6786506, 1.457686, 0, 0, 0, 1, 1,
1.785335, -0.4873647, 2.95877, 0, 0, 0, 1, 1,
1.800869, 1.239351, 1.844601, 1, 1, 1, 1, 1,
1.82967, -0.5699756, 1.597197, 1, 1, 1, 1, 1,
1.835376, 2.214722, 0.8111834, 1, 1, 1, 1, 1,
1.835414, -0.0291248, 2.280134, 1, 1, 1, 1, 1,
1.836683, 1.124976, -0.05420692, 1, 1, 1, 1, 1,
1.878, 1.156239, 0.8470098, 1, 1, 1, 1, 1,
1.912962, -0.1890668, 2.183235, 1, 1, 1, 1, 1,
1.982924, 0.3306274, 0.5776868, 1, 1, 1, 1, 1,
1.992838, 1.141905, 0.8203094, 1, 1, 1, 1, 1,
1.995261, -1.855626, 2.370725, 1, 1, 1, 1, 1,
2.000431, 0.2692363, 0.7803575, 1, 1, 1, 1, 1,
2.026952, 0.7514952, 1.413111, 1, 1, 1, 1, 1,
2.039706, -0.6977302, 2.040077, 1, 1, 1, 1, 1,
2.053232, -0.6114087, 1.759191, 1, 1, 1, 1, 1,
2.087171, 1.093914, 2.592917, 1, 1, 1, 1, 1,
2.116466, 0.2786787, 1.493109, 0, 0, 1, 1, 1,
2.120158, -1.187487, 2.415303, 1, 0, 0, 1, 1,
2.121828, -0.9091594, 1.373571, 1, 0, 0, 1, 1,
2.124231, 0.2996642, -0.1900035, 1, 0, 0, 1, 1,
2.126934, 0.5298155, 1.848061, 1, 0, 0, 1, 1,
2.143227, 1.544246, 0.3244551, 1, 0, 0, 1, 1,
2.154878, 0.2620623, 1.986614, 0, 0, 0, 1, 1,
2.160362, -1.183213, 1.020967, 0, 0, 0, 1, 1,
2.170959, -1.314377, 3.751993, 0, 0, 0, 1, 1,
2.177513, 0.7218925, 0.6638753, 0, 0, 0, 1, 1,
2.215644, 0.8783105, 0.4695272, 0, 0, 0, 1, 1,
2.299213, 0.762721, 2.347024, 0, 0, 0, 1, 1,
2.30202, 1.304306, 0.4197144, 0, 0, 0, 1, 1,
2.302272, -0.1713105, 1.090641, 1, 1, 1, 1, 1,
2.405293, 1.196994, -0.3692502, 1, 1, 1, 1, 1,
2.491792, -1.407954, 2.535362, 1, 1, 1, 1, 1,
2.499885, -0.3701545, -0.538953, 1, 1, 1, 1, 1,
2.723564, 0.2266213, 0.7824598, 1, 1, 1, 1, 1,
2.859748, -0.6002988, 1.514337, 1, 1, 1, 1, 1,
3.529635, 0.8424357, 1.631667, 1, 1, 1, 1, 1
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
var radius = 10.03899;
var distance = 35.26153;
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
mvMatrix.translate( 0.4181843, 0.1721995, 0.006754637 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26153);
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