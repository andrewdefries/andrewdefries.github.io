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
-2.812153, -0.3075341, -2.234174, 1, 0, 0, 1,
-2.703413, 0.7197931, -1.824237, 1, 0.007843138, 0, 1,
-2.588808, 0.9907537, -2.832749, 1, 0.01176471, 0, 1,
-2.387179, -0.7828261, -2.246324, 1, 0.01960784, 0, 1,
-2.329847, 0.3946636, -2.473287, 1, 0.02352941, 0, 1,
-2.299934, 0.1696969, -1.872048, 1, 0.03137255, 0, 1,
-2.293885, 0.3587002, 0.08269441, 1, 0.03529412, 0, 1,
-2.276695, 0.9996942, -2.944869, 1, 0.04313726, 0, 1,
-2.20858, -0.2338209, -1.682619, 1, 0.04705882, 0, 1,
-2.17739, 0.04282872, -2.030938, 1, 0.05490196, 0, 1,
-2.163984, 0.313717, -2.591844, 1, 0.05882353, 0, 1,
-2.156076, 0.3323992, -3.873599, 1, 0.06666667, 0, 1,
-2.153641, 0.7058363, -1.010704, 1, 0.07058824, 0, 1,
-2.135593, 0.9150003, -1.554914, 1, 0.07843138, 0, 1,
-2.130113, 0.7220331, -0.9409925, 1, 0.08235294, 0, 1,
-2.102073, 0.234934, 1.035438, 1, 0.09019608, 0, 1,
-2.039858, 0.2877658, -1.892157, 1, 0.09411765, 0, 1,
-2.005969, -0.7532476, -2.043592, 1, 0.1019608, 0, 1,
-2.00163, 0.8213659, -1.103329, 1, 0.1098039, 0, 1,
-1.98922, 0.9759232, 1.463191, 1, 0.1137255, 0, 1,
-1.962746, -0.8228719, -0.6683143, 1, 0.1215686, 0, 1,
-1.956338, 2.20783, -1.665653, 1, 0.1254902, 0, 1,
-1.942447, 0.06199788, -2.678925, 1, 0.1333333, 0, 1,
-1.933539, -0.987628, -2.625049, 1, 0.1372549, 0, 1,
-1.922373, 0.1545265, 0.1706138, 1, 0.145098, 0, 1,
-1.893927, -1.097593, -1.666602, 1, 0.1490196, 0, 1,
-1.888699, -0.7827094, -1.569415, 1, 0.1568628, 0, 1,
-1.869491, -0.01080892, -2.976796, 1, 0.1607843, 0, 1,
-1.869269, -1.937642, -3.608549, 1, 0.1686275, 0, 1,
-1.832476, 1.04521, -1.375727, 1, 0.172549, 0, 1,
-1.824798, 1.044717, -0.2299605, 1, 0.1803922, 0, 1,
-1.82015, -1.008684, -1.985564, 1, 0.1843137, 0, 1,
-1.811698, -0.6045008, -2.477198, 1, 0.1921569, 0, 1,
-1.804118, -1.823315, -4.355843, 1, 0.1960784, 0, 1,
-1.802867, -2.318597, -3.65511, 1, 0.2039216, 0, 1,
-1.801907, -0.4969392, -2.291921, 1, 0.2117647, 0, 1,
-1.759093, 0.1458097, -0.8198145, 1, 0.2156863, 0, 1,
-1.708249, 0.05397868, -1.02203, 1, 0.2235294, 0, 1,
-1.702492, 0.4374129, -0.8991023, 1, 0.227451, 0, 1,
-1.698232, 0.8042766, 0.1465283, 1, 0.2352941, 0, 1,
-1.685639, 1.902554, -0.2850835, 1, 0.2392157, 0, 1,
-1.666724, 0.9958614, -0.08401034, 1, 0.2470588, 0, 1,
-1.645523, -0.5847627, 0.2977947, 1, 0.2509804, 0, 1,
-1.624936, 0.8622504, -2.103419, 1, 0.2588235, 0, 1,
-1.608603, 0.3254857, -1.13031, 1, 0.2627451, 0, 1,
-1.602215, 0.4320379, -0.8955314, 1, 0.2705882, 0, 1,
-1.591179, 0.7587178, -1.308331, 1, 0.2745098, 0, 1,
-1.586354, -0.1678551, -2.192329, 1, 0.282353, 0, 1,
-1.578486, 0.9229278, -2.941367, 1, 0.2862745, 0, 1,
-1.572326, -2.941293, -3.092237, 1, 0.2941177, 0, 1,
-1.570212, 1.228271, -1.656311, 1, 0.3019608, 0, 1,
-1.569761, 0.2687129, -3.022828, 1, 0.3058824, 0, 1,
-1.567888, 0.8756998, -0.9986387, 1, 0.3137255, 0, 1,
-1.563814, -0.129618, -2.560018, 1, 0.3176471, 0, 1,
-1.55432, 1.044605, -0.4247963, 1, 0.3254902, 0, 1,
-1.554304, -0.2082459, -1.129311, 1, 0.3294118, 0, 1,
-1.552185, -0.7032792, -2.243024, 1, 0.3372549, 0, 1,
-1.537084, -0.5130037, -2.330003, 1, 0.3411765, 0, 1,
-1.518264, -0.342443, -1.312699, 1, 0.3490196, 0, 1,
-1.5142, 0.7376555, -1.024591, 1, 0.3529412, 0, 1,
-1.513254, 0.4159518, -3.250799, 1, 0.3607843, 0, 1,
-1.493227, -0.6135684, -1.47519, 1, 0.3647059, 0, 1,
-1.484906, -2.329567, -2.457976, 1, 0.372549, 0, 1,
-1.484364, -1.783577, -1.246588, 1, 0.3764706, 0, 1,
-1.481672, -1.7665, -2.019001, 1, 0.3843137, 0, 1,
-1.475256, 0.8827622, -0.4130104, 1, 0.3882353, 0, 1,
-1.473207, 0.7518324, -1.076623, 1, 0.3960784, 0, 1,
-1.472546, 0.3015945, -1.879196, 1, 0.4039216, 0, 1,
-1.472382, -0.6251885, -2.669444, 1, 0.4078431, 0, 1,
-1.467307, -0.02610555, -2.268404, 1, 0.4156863, 0, 1,
-1.455434, 2.66261, -2.394173, 1, 0.4196078, 0, 1,
-1.455368, -0.5962602, -2.730537, 1, 0.427451, 0, 1,
-1.451495, 0.5340003, -0.6416264, 1, 0.4313726, 0, 1,
-1.435703, 0.2593109, -1.162862, 1, 0.4392157, 0, 1,
-1.430533, -0.4560137, -2.539169, 1, 0.4431373, 0, 1,
-1.429322, 0.9706333, -0.4231498, 1, 0.4509804, 0, 1,
-1.427406, 0.7371171, -1.460864, 1, 0.454902, 0, 1,
-1.427378, -0.7779938, -1.933717, 1, 0.4627451, 0, 1,
-1.426681, -0.9404718, -1.198407, 1, 0.4666667, 0, 1,
-1.425194, 0.2343825, -2.028204, 1, 0.4745098, 0, 1,
-1.408532, 1.32041, -1.752829, 1, 0.4784314, 0, 1,
-1.408286, -1.456264, -2.048951, 1, 0.4862745, 0, 1,
-1.406284, 0.7818495, -1.292756, 1, 0.4901961, 0, 1,
-1.396917, -1.266352, -3.103004, 1, 0.4980392, 0, 1,
-1.393514, -0.09624168, -0.8475575, 1, 0.5058824, 0, 1,
-1.386455, -1.513567, -2.99127, 1, 0.509804, 0, 1,
-1.367785, -0.1616787, -1.456563, 1, 0.5176471, 0, 1,
-1.366796, 0.6130761, -0.5600747, 1, 0.5215687, 0, 1,
-1.352468, 0.5970717, -0.3177359, 1, 0.5294118, 0, 1,
-1.345663, 0.8561124, -1.01795, 1, 0.5333334, 0, 1,
-1.337119, -1.094234, -2.287601, 1, 0.5411765, 0, 1,
-1.334411, 0.7251824, -1.560092, 1, 0.5450981, 0, 1,
-1.332962, 1.271488, -1.409577, 1, 0.5529412, 0, 1,
-1.33081, -0.1518425, -1.392811, 1, 0.5568628, 0, 1,
-1.330147, 0.9510667, -3.871996, 1, 0.5647059, 0, 1,
-1.324405, -1.223218, -0.8579347, 1, 0.5686275, 0, 1,
-1.291818, -1.448269, -1.419674, 1, 0.5764706, 0, 1,
-1.28939, 0.8262785, -2.292421, 1, 0.5803922, 0, 1,
-1.288551, 2.059901, -1.000638, 1, 0.5882353, 0, 1,
-1.277681, 1.39361, -1.215251, 1, 0.5921569, 0, 1,
-1.267541, 1.05001, -1.951334, 1, 0.6, 0, 1,
-1.263947, -0.9363684, -2.418028, 1, 0.6078432, 0, 1,
-1.248632, -2.434799, -3.064848, 1, 0.6117647, 0, 1,
-1.235865, -1.765591, -3.282192, 1, 0.6196079, 0, 1,
-1.234616, 0.916181, -0.3611815, 1, 0.6235294, 0, 1,
-1.232211, 0.2300966, -1.825487, 1, 0.6313726, 0, 1,
-1.227872, 1.276611, -0.3586793, 1, 0.6352941, 0, 1,
-1.223169, -0.9814677, -1.664869, 1, 0.6431373, 0, 1,
-1.223125, 0.2706585, -2.430394, 1, 0.6470588, 0, 1,
-1.22285, -0.7511961, -2.389927, 1, 0.654902, 0, 1,
-1.217753, 1.629476, -0.1814723, 1, 0.6588235, 0, 1,
-1.212749, 0.1170343, -2.155355, 1, 0.6666667, 0, 1,
-1.209754, -1.471666, -1.605934, 1, 0.6705883, 0, 1,
-1.20343, -0.8678905, -3.163924, 1, 0.6784314, 0, 1,
-1.184596, -0.3734136, -1.629091, 1, 0.682353, 0, 1,
-1.180547, 0.1366232, -2.703078, 1, 0.6901961, 0, 1,
-1.179194, -1.135457, -1.705418, 1, 0.6941177, 0, 1,
-1.17741, -1.019246, -1.83085, 1, 0.7019608, 0, 1,
-1.174768, -0.304252, -2.579207, 1, 0.7098039, 0, 1,
-1.174499, -1.124658, -1.845074, 1, 0.7137255, 0, 1,
-1.17286, -1.557336, -2.333575, 1, 0.7215686, 0, 1,
-1.171836, -0.9792988, -3.651829, 1, 0.7254902, 0, 1,
-1.154046, 0.7293621, 0.1718263, 1, 0.7333333, 0, 1,
-1.1518, 2.222098, -1.870463, 1, 0.7372549, 0, 1,
-1.145033, 0.5272161, -1.484386, 1, 0.7450981, 0, 1,
-1.142901, -1.38673, -1.339293, 1, 0.7490196, 0, 1,
-1.1378, -0.8675803, -1.065102, 1, 0.7568628, 0, 1,
-1.137763, 1.566199, 0.4302389, 1, 0.7607843, 0, 1,
-1.134168, 0.8122528, 0.6777509, 1, 0.7686275, 0, 1,
-1.132212, -0.6108776, -0.6280448, 1, 0.772549, 0, 1,
-1.129843, -0.6410417, -1.700242, 1, 0.7803922, 0, 1,
-1.129437, -0.3479314, -2.04795, 1, 0.7843137, 0, 1,
-1.124715, -0.6726227, -3.092535, 1, 0.7921569, 0, 1,
-1.121364, -0.2551029, -1.20101, 1, 0.7960784, 0, 1,
-1.121016, -1.591461, -2.48258, 1, 0.8039216, 0, 1,
-1.116195, 0.8992053, -0.5280677, 1, 0.8117647, 0, 1,
-1.109745, 0.3702492, -0.8149093, 1, 0.8156863, 0, 1,
-1.102812, 0.0185049, -2.109257, 1, 0.8235294, 0, 1,
-1.101339, -0.3575035, -1.857984, 1, 0.827451, 0, 1,
-1.093276, -1.100102, -1.494275, 1, 0.8352941, 0, 1,
-1.086821, 0.4296423, -1.242379, 1, 0.8392157, 0, 1,
-1.073729, -0.1026916, -1.787272, 1, 0.8470588, 0, 1,
-1.072738, 0.6450608, -0.8811246, 1, 0.8509804, 0, 1,
-1.072017, -0.2733244, -2.126282, 1, 0.8588235, 0, 1,
-1.066953, -0.1188869, -1.876155, 1, 0.8627451, 0, 1,
-1.059867, 1.113849, -1.561699, 1, 0.8705882, 0, 1,
-1.055216, 0.3979102, -0.3491254, 1, 0.8745098, 0, 1,
-1.053228, -0.9961653, -3.268634, 1, 0.8823529, 0, 1,
-1.040456, -0.5981138, -0.6135074, 1, 0.8862745, 0, 1,
-1.030422, 2.095732, -0.2774206, 1, 0.8941177, 0, 1,
-1.026022, -0.4318003, -1.450736, 1, 0.8980392, 0, 1,
-1.022756, -0.7570946, -1.171186, 1, 0.9058824, 0, 1,
-1.022163, -0.5682906, -2.209375, 1, 0.9137255, 0, 1,
-1.008533, 0.715611, -0.3567915, 1, 0.9176471, 0, 1,
-1.006805, -1.186134, -2.84006, 1, 0.9254902, 0, 1,
-1.003717, -0.6885127, -2.432021, 1, 0.9294118, 0, 1,
-1.001579, 0.03490359, -0.5305758, 1, 0.9372549, 0, 1,
-1.000243, -0.2121601, -2.104573, 1, 0.9411765, 0, 1,
-1.000102, 0.93978, -0.9477872, 1, 0.9490196, 0, 1,
-0.9965516, 0.01897571, -4.418573, 1, 0.9529412, 0, 1,
-0.9957228, 0.9136689, -0.8775029, 1, 0.9607843, 0, 1,
-0.9952363, 1.089088, -0.1558235, 1, 0.9647059, 0, 1,
-0.9889373, -1.063379, -3.853767, 1, 0.972549, 0, 1,
-0.9869027, -0.7126798, -2.037032, 1, 0.9764706, 0, 1,
-0.9861997, 0.214617, -0.9498808, 1, 0.9843137, 0, 1,
-0.9847938, 0.5788801, -0.6520491, 1, 0.9882353, 0, 1,
-0.9790664, 1.097116, -0.1617518, 1, 0.9960784, 0, 1,
-0.9742354, -0.7111825, -2.982413, 0.9960784, 1, 0, 1,
-0.9708511, -0.6875665, -2.89392, 0.9921569, 1, 0, 1,
-0.96804, 0.1652722, -0.718703, 0.9843137, 1, 0, 1,
-0.9626684, 0.3024325, -1.229299, 0.9803922, 1, 0, 1,
-0.9565332, -0.3059095, -1.655784, 0.972549, 1, 0, 1,
-0.9536706, -2.44344, -3.114767, 0.9686275, 1, 0, 1,
-0.9489433, 0.6946417, 0.1578085, 0.9607843, 1, 0, 1,
-0.9478476, 0.3181013, -2.34075, 0.9568627, 1, 0, 1,
-0.9368976, -1.99358, -3.779904, 0.9490196, 1, 0, 1,
-0.9330472, 0.364861, -1.817286, 0.945098, 1, 0, 1,
-0.9308112, -0.1079177, -3.865915, 0.9372549, 1, 0, 1,
-0.9227272, -1.022689, -1.788318, 0.9333333, 1, 0, 1,
-0.922212, -1.75976, -3.604232, 0.9254902, 1, 0, 1,
-0.9179153, -0.498705, -2.228791, 0.9215686, 1, 0, 1,
-0.9106013, -2.353283, -3.088423, 0.9137255, 1, 0, 1,
-0.9079564, -0.2111159, -1.103419, 0.9098039, 1, 0, 1,
-0.9071923, 1.587056, 0.3060478, 0.9019608, 1, 0, 1,
-0.9068705, -2.249479, -2.474232, 0.8941177, 1, 0, 1,
-0.8945961, -1.234271, -2.907406, 0.8901961, 1, 0, 1,
-0.8892419, -0.2838069, -2.750144, 0.8823529, 1, 0, 1,
-0.8866305, -0.03207153, -2.109561, 0.8784314, 1, 0, 1,
-0.885478, 1.205778, -0.9755867, 0.8705882, 1, 0, 1,
-0.8803086, 1.137266, -0.8980196, 0.8666667, 1, 0, 1,
-0.877599, -0.6290473, -2.790515, 0.8588235, 1, 0, 1,
-0.8762181, -0.4525995, -2.233293, 0.854902, 1, 0, 1,
-0.8740289, 1.707664, 0.2445208, 0.8470588, 1, 0, 1,
-0.8726369, 1.324899, 2.032109, 0.8431373, 1, 0, 1,
-0.8708921, -1.902072, -2.507887, 0.8352941, 1, 0, 1,
-0.8676375, 0.03231937, -1.182859, 0.8313726, 1, 0, 1,
-0.8641546, 0.1807017, -3.148731, 0.8235294, 1, 0, 1,
-0.861865, 0.3875967, -1.608009, 0.8196079, 1, 0, 1,
-0.8607081, -1.079932, -1.586838, 0.8117647, 1, 0, 1,
-0.8568107, -0.4096357, -1.927356, 0.8078431, 1, 0, 1,
-0.8539019, -0.2002394, -1.322113, 0.8, 1, 0, 1,
-0.8482404, -1.016956, -1.712152, 0.7921569, 1, 0, 1,
-0.845323, 0.05496421, -0.1005935, 0.7882353, 1, 0, 1,
-0.8315452, 1.434394, 0.3269905, 0.7803922, 1, 0, 1,
-0.8273974, 1.101715, 1.553831, 0.7764706, 1, 0, 1,
-0.8250934, 1.301422, 1.637402, 0.7686275, 1, 0, 1,
-0.7865974, 0.6675828, -0.2767297, 0.7647059, 1, 0, 1,
-0.7857594, 0.1149172, -1.903431, 0.7568628, 1, 0, 1,
-0.7820549, -0.7596694, -2.817353, 0.7529412, 1, 0, 1,
-0.7786272, 0.4526561, -1.587894, 0.7450981, 1, 0, 1,
-0.7737677, -0.1243021, -1.372146, 0.7411765, 1, 0, 1,
-0.7657041, 2.686411, -0.1374215, 0.7333333, 1, 0, 1,
-0.7598511, 1.475839, -1.008432, 0.7294118, 1, 0, 1,
-0.7554246, -0.5971618, -2.382431, 0.7215686, 1, 0, 1,
-0.7509485, -0.4920759, -3.098074, 0.7176471, 1, 0, 1,
-0.7501508, 1.648165, -2.20939, 0.7098039, 1, 0, 1,
-0.7464893, -0.392403, -2.642196, 0.7058824, 1, 0, 1,
-0.7420506, 0.1310905, -1.335902, 0.6980392, 1, 0, 1,
-0.7419102, 1.350713, 0.592882, 0.6901961, 1, 0, 1,
-0.7362427, -0.6947693, -2.680297, 0.6862745, 1, 0, 1,
-0.7342678, -0.2873918, -2.867229, 0.6784314, 1, 0, 1,
-0.7339826, 1.437885, 1.075463, 0.6745098, 1, 0, 1,
-0.7299956, -0.5120525, -3.388159, 0.6666667, 1, 0, 1,
-0.7284168, 0.7775165, -1.877388, 0.6627451, 1, 0, 1,
-0.7260951, -0.2471653, -1.107035, 0.654902, 1, 0, 1,
-0.7255216, 0.9622536, -0.1846757, 0.6509804, 1, 0, 1,
-0.7240521, 0.8408281, 0.809294, 0.6431373, 1, 0, 1,
-0.7205325, 0.04612357, -0.5777085, 0.6392157, 1, 0, 1,
-0.7204509, 1.221885, -2.118614, 0.6313726, 1, 0, 1,
-0.7201264, -1.81112, -1.518796, 0.627451, 1, 0, 1,
-0.7138553, -1.998801, -1.525591, 0.6196079, 1, 0, 1,
-0.7106971, 0.7674729, -1.854615, 0.6156863, 1, 0, 1,
-0.7099822, 1.743101, -1.19492, 0.6078432, 1, 0, 1,
-0.7087123, 1.39805, -0.3643277, 0.6039216, 1, 0, 1,
-0.707895, -1.150812, -2.397331, 0.5960785, 1, 0, 1,
-0.7069238, 0.1521489, -0.9312981, 0.5882353, 1, 0, 1,
-0.7053129, -0.3585403, -1.113949, 0.5843138, 1, 0, 1,
-0.6959274, -0.3133686, -2.53685, 0.5764706, 1, 0, 1,
-0.6950189, -0.6607094, -0.3309686, 0.572549, 1, 0, 1,
-0.694954, 1.762663, -0.1499285, 0.5647059, 1, 0, 1,
-0.6924525, 1.485166, 0.5133833, 0.5607843, 1, 0, 1,
-0.6916077, -2.800735, -3.603645, 0.5529412, 1, 0, 1,
-0.6909585, 0.6771302, -1.394804, 0.5490196, 1, 0, 1,
-0.6897396, -0.06635148, -3.665404, 0.5411765, 1, 0, 1,
-0.6893106, -2.001189, -2.254264, 0.5372549, 1, 0, 1,
-0.6866762, -0.6878429, -2.41085, 0.5294118, 1, 0, 1,
-0.6818515, -0.2991354, -2.977419, 0.5254902, 1, 0, 1,
-0.676636, 0.3834388, -2.425067, 0.5176471, 1, 0, 1,
-0.6752157, -1.253617, -2.305703, 0.5137255, 1, 0, 1,
-0.6742407, 0.2419007, -0.03686611, 0.5058824, 1, 0, 1,
-0.6688545, 0.3953257, -1.602028, 0.5019608, 1, 0, 1,
-0.6677942, 0.00621063, -2.296306, 0.4941176, 1, 0, 1,
-0.6673548, 0.2202153, -1.325204, 0.4862745, 1, 0, 1,
-0.6614106, 1.312208, 0.3389503, 0.4823529, 1, 0, 1,
-0.6504083, -0.4885967, -1.509142, 0.4745098, 1, 0, 1,
-0.6469452, -1.501787, -3.210218, 0.4705882, 1, 0, 1,
-0.6405434, -0.2099242, -1.815827, 0.4627451, 1, 0, 1,
-0.6375819, 0.3810377, -1.726188, 0.4588235, 1, 0, 1,
-0.6366465, 0.7587944, -0.416459, 0.4509804, 1, 0, 1,
-0.6326074, -0.4299957, -2.012041, 0.4470588, 1, 0, 1,
-0.6291279, -0.3005597, -1.99682, 0.4392157, 1, 0, 1,
-0.6239683, 1.224207, -1.638237, 0.4352941, 1, 0, 1,
-0.6228979, -0.02510807, -2.118452, 0.427451, 1, 0, 1,
-0.6225705, 0.9121512, -0.08019206, 0.4235294, 1, 0, 1,
-0.6207299, 1.307007, 0.3296528, 0.4156863, 1, 0, 1,
-0.6204802, 0.8028902, -1.470261, 0.4117647, 1, 0, 1,
-0.6186264, -0.1674599, -0.3154241, 0.4039216, 1, 0, 1,
-0.6172187, 2.669491, -0.2511609, 0.3960784, 1, 0, 1,
-0.6169901, 1.325469, -0.3342471, 0.3921569, 1, 0, 1,
-0.5990646, -1.330653, -3.056126, 0.3843137, 1, 0, 1,
-0.5944309, 1.088737, -1.26983, 0.3803922, 1, 0, 1,
-0.5940028, -0.8379692, -1.570809, 0.372549, 1, 0, 1,
-0.5939193, -2.663754, -4.205145, 0.3686275, 1, 0, 1,
-0.5905671, -0.06840604, -1.734608, 0.3607843, 1, 0, 1,
-0.5823522, 0.9516987, 0.1145481, 0.3568628, 1, 0, 1,
-0.5756829, 1.820866, -0.4522597, 0.3490196, 1, 0, 1,
-0.5709487, -0.4483509, -3.295091, 0.345098, 1, 0, 1,
-0.5669264, -0.4234509, -1.350628, 0.3372549, 1, 0, 1,
-0.5615494, -0.1493518, -1.306608, 0.3333333, 1, 0, 1,
-0.560736, 0.1515822, -0.8249927, 0.3254902, 1, 0, 1,
-0.5577208, 1.56714, -0.8448566, 0.3215686, 1, 0, 1,
-0.5529599, 1.6463, -0.419093, 0.3137255, 1, 0, 1,
-0.55058, 0.9443365, -0.253924, 0.3098039, 1, 0, 1,
-0.5500301, -0.2005166, -0.9358474, 0.3019608, 1, 0, 1,
-0.5491714, -1.242803, -3.716424, 0.2941177, 1, 0, 1,
-0.5490007, -1.311794, -2.999854, 0.2901961, 1, 0, 1,
-0.5401996, 0.3826937, -1.18337, 0.282353, 1, 0, 1,
-0.5361564, -0.9005377, -2.304247, 0.2784314, 1, 0, 1,
-0.5332019, -0.7523815, -2.895648, 0.2705882, 1, 0, 1,
-0.5264086, 0.8021043, 0.07860787, 0.2666667, 1, 0, 1,
-0.5260186, -0.7594157, -2.86884, 0.2588235, 1, 0, 1,
-0.5213811, 0.8358691, 1.035291, 0.254902, 1, 0, 1,
-0.5211495, -0.7935541, -0.2891609, 0.2470588, 1, 0, 1,
-0.5145593, -0.6682687, -2.632904, 0.2431373, 1, 0, 1,
-0.5103754, 0.05939253, -1.971279, 0.2352941, 1, 0, 1,
-0.5074179, 0.4878312, -1.402632, 0.2313726, 1, 0, 1,
-0.5005681, 1.71808, -1.2323, 0.2235294, 1, 0, 1,
-0.4972534, -2.555879, -3.907029, 0.2196078, 1, 0, 1,
-0.4923838, 0.2294461, -2.067196, 0.2117647, 1, 0, 1,
-0.4905718, 0.7328365, -2.689834, 0.2078431, 1, 0, 1,
-0.487945, 0.4644582, 0.4034616, 0.2, 1, 0, 1,
-0.4830638, -0.6401699, -2.24667, 0.1921569, 1, 0, 1,
-0.4805422, -1.662785, -1.566708, 0.1882353, 1, 0, 1,
-0.4782533, 0.7753327, 0.8803915, 0.1803922, 1, 0, 1,
-0.4702639, 1.250935, 0.1817082, 0.1764706, 1, 0, 1,
-0.46723, 1.070237, -2.469115, 0.1686275, 1, 0, 1,
-0.4665664, 0.5849364, 0.2653279, 0.1647059, 1, 0, 1,
-0.4662575, -0.9612122, -3.576757, 0.1568628, 1, 0, 1,
-0.4518775, 0.3526264, -1.481126, 0.1529412, 1, 0, 1,
-0.4499928, 0.6219852, 0.5954965, 0.145098, 1, 0, 1,
-0.4456022, -1.290566, -3.983952, 0.1411765, 1, 0, 1,
-0.4432882, 0.8803552, -0.2032741, 0.1333333, 1, 0, 1,
-0.44163, -2.367694, -3.066572, 0.1294118, 1, 0, 1,
-0.4402561, 1.171788, -0.8224858, 0.1215686, 1, 0, 1,
-0.4299143, 0.1732813, -0.1929089, 0.1176471, 1, 0, 1,
-0.4294423, -0.3347409, -0.9418659, 0.1098039, 1, 0, 1,
-0.4288952, 0.8783855, 1.364308, 0.1058824, 1, 0, 1,
-0.4263845, -0.1550973, -1.109576, 0.09803922, 1, 0, 1,
-0.4225706, -1.006057, -3.711323, 0.09019608, 1, 0, 1,
-0.4211183, 0.6914014, -1.533615, 0.08627451, 1, 0, 1,
-0.4204151, -0.2527241, -2.190567, 0.07843138, 1, 0, 1,
-0.4199413, -0.6693459, -3.919801, 0.07450981, 1, 0, 1,
-0.4156618, 0.4273367, -1.227355, 0.06666667, 1, 0, 1,
-0.4152512, 1.442421, -2.141681, 0.0627451, 1, 0, 1,
-0.4145366, 0.7388045, 0.2876495, 0.05490196, 1, 0, 1,
-0.410027, 0.2012355, -0.8891128, 0.05098039, 1, 0, 1,
-0.4099909, 1.177194, -0.21895, 0.04313726, 1, 0, 1,
-0.4075356, 0.212337, -0.2313598, 0.03921569, 1, 0, 1,
-0.4069287, 0.1329569, 0.2868195, 0.03137255, 1, 0, 1,
-0.4011404, -1.114672, -2.917484, 0.02745098, 1, 0, 1,
-0.3930019, -1.542182, -4.477586, 0.01960784, 1, 0, 1,
-0.3921067, -0.5675936, -2.221543, 0.01568628, 1, 0, 1,
-0.3909811, -0.4658612, -4.214049, 0.007843138, 1, 0, 1,
-0.3904118, -0.5862252, -2.509756, 0.003921569, 1, 0, 1,
-0.3840519, 0.09413842, -0.4610129, 0, 1, 0.003921569, 1,
-0.3817046, 0.9260011, -0.750304, 0, 1, 0.01176471, 1,
-0.3802553, -1.039875, -2.669403, 0, 1, 0.01568628, 1,
-0.376757, -2.089209, -2.014309, 0, 1, 0.02352941, 1,
-0.3738861, 0.05294494, -1.111794, 0, 1, 0.02745098, 1,
-0.3726377, 0.6509586, 0.901376, 0, 1, 0.03529412, 1,
-0.3723407, -0.07421419, -1.40474, 0, 1, 0.03921569, 1,
-0.3685569, -0.6075188, -2.774139, 0, 1, 0.04705882, 1,
-0.3675228, -1.016448, -1.854384, 0, 1, 0.05098039, 1,
-0.3670983, -0.4917628, -2.878404, 0, 1, 0.05882353, 1,
-0.36676, 0.8229716, -0.5149127, 0, 1, 0.0627451, 1,
-0.3667368, 0.7862101, -1.629125, 0, 1, 0.07058824, 1,
-0.3654107, -0.233452, -1.950488, 0, 1, 0.07450981, 1,
-0.3613717, 1.103177, 1.454092, 0, 1, 0.08235294, 1,
-0.3593583, 2.550625, 1.245834, 0, 1, 0.08627451, 1,
-0.3534935, -0.08355948, -1.812244, 0, 1, 0.09411765, 1,
-0.3509402, 0.7391085, -1.187419, 0, 1, 0.1019608, 1,
-0.3504811, -1.872649, -3.751248, 0, 1, 0.1058824, 1,
-0.3370402, 0.1706173, -0.5223312, 0, 1, 0.1137255, 1,
-0.334559, 1.652208, -0.06125282, 0, 1, 0.1176471, 1,
-0.3338932, -0.5310434, -2.100598, 0, 1, 0.1254902, 1,
-0.3336196, -0.8555705, -2.124242, 0, 1, 0.1294118, 1,
-0.3309903, -0.2613986, -3.134901, 0, 1, 0.1372549, 1,
-0.3294787, -0.5350859, -2.026793, 0, 1, 0.1411765, 1,
-0.3253235, -1.054283, -1.913755, 0, 1, 0.1490196, 1,
-0.3229769, -0.1205594, -2.302046, 0, 1, 0.1529412, 1,
-0.3204026, -1.623896, -2.507525, 0, 1, 0.1607843, 1,
-0.3203681, -1.019466, -3.837221, 0, 1, 0.1647059, 1,
-0.3179744, 0.3030677, -1.654536, 0, 1, 0.172549, 1,
-0.3146057, 0.6497274, -1.076542, 0, 1, 0.1764706, 1,
-0.3116485, 1.491488, -0.617372, 0, 1, 0.1843137, 1,
-0.3106229, 1.883948, 0.2119458, 0, 1, 0.1882353, 1,
-0.3070484, -0.04229798, -2.269276, 0, 1, 0.1960784, 1,
-0.3066161, -0.26104, -1.582209, 0, 1, 0.2039216, 1,
-0.3049805, -0.07385576, -2.99826, 0, 1, 0.2078431, 1,
-0.2979752, 0.6794251, -0.4620555, 0, 1, 0.2156863, 1,
-0.296873, 0.1451569, -0.386147, 0, 1, 0.2196078, 1,
-0.2960547, -1.481604, -2.944633, 0, 1, 0.227451, 1,
-0.295151, -1.113192, -3.218341, 0, 1, 0.2313726, 1,
-0.2927366, 0.8163655, -0.6219859, 0, 1, 0.2392157, 1,
-0.2851545, 0.7124854, -0.8234604, 0, 1, 0.2431373, 1,
-0.2841403, 0.784655, -1.103815, 0, 1, 0.2509804, 1,
-0.2799802, 0.5033183, 0.001719629, 0, 1, 0.254902, 1,
-0.279588, 0.3037561, -0.7638082, 0, 1, 0.2627451, 1,
-0.2772105, -1.928929, -0.2269357, 0, 1, 0.2666667, 1,
-0.2756607, -1.724091, -2.553142, 0, 1, 0.2745098, 1,
-0.2693043, -0.8835444, -3.414377, 0, 1, 0.2784314, 1,
-0.2605606, -0.901409, -1.747072, 0, 1, 0.2862745, 1,
-0.2576032, 0.9824153, 0.8056226, 0, 1, 0.2901961, 1,
-0.2502853, -0.3048092, -1.680339, 0, 1, 0.2980392, 1,
-0.2486779, -1.268434, -3.171016, 0, 1, 0.3058824, 1,
-0.248132, -0.740346, -2.669755, 0, 1, 0.3098039, 1,
-0.2475637, 0.3415106, -0.1817213, 0, 1, 0.3176471, 1,
-0.2420028, -0.6187797, -3.510636, 0, 1, 0.3215686, 1,
-0.2358193, -0.6977155, -1.550729, 0, 1, 0.3294118, 1,
-0.2351798, 0.07607029, -1.385284, 0, 1, 0.3333333, 1,
-0.2339745, -0.4260521, -2.48187, 0, 1, 0.3411765, 1,
-0.2280058, 0.3044291, 0.4262859, 0, 1, 0.345098, 1,
-0.2269026, 0.3923431, -0.9259058, 0, 1, 0.3529412, 1,
-0.226707, -0.8802225, -3.014192, 0, 1, 0.3568628, 1,
-0.2265563, 1.271888, -0.3677587, 0, 1, 0.3647059, 1,
-0.2253718, 0.1612155, -1.007029, 0, 1, 0.3686275, 1,
-0.2250696, 1.314891, -0.4412704, 0, 1, 0.3764706, 1,
-0.2232187, -0.5070695, -1.89176, 0, 1, 0.3803922, 1,
-0.2214328, -1.85132, -1.239909, 0, 1, 0.3882353, 1,
-0.2206202, 0.4531189, -2.045689, 0, 1, 0.3921569, 1,
-0.2197491, 1.51147, 1.191696, 0, 1, 0.4, 1,
-0.2150032, -2.069186, -2.168629, 0, 1, 0.4078431, 1,
-0.2085784, -0.7492065, -2.974031, 0, 1, 0.4117647, 1,
-0.2048196, -0.7402259, -2.058337, 0, 1, 0.4196078, 1,
-0.2010915, -0.3651609, -1.788216, 0, 1, 0.4235294, 1,
-0.1964222, 0.5246998, -0.1346435, 0, 1, 0.4313726, 1,
-0.1951922, 0.5053654, -1.153089, 0, 1, 0.4352941, 1,
-0.1895963, 0.2426084, -1.293599, 0, 1, 0.4431373, 1,
-0.1863776, 0.3232722, -1.242411, 0, 1, 0.4470588, 1,
-0.1773071, 1.9977, 0.1996418, 0, 1, 0.454902, 1,
-0.1761847, -0.3613038, -2.057301, 0, 1, 0.4588235, 1,
-0.1751671, -1.318835, -2.856238, 0, 1, 0.4666667, 1,
-0.1724411, -0.9586064, -2.91365, 0, 1, 0.4705882, 1,
-0.1665941, 1.498577, -0.07624035, 0, 1, 0.4784314, 1,
-0.1636357, -0.9105461, -4.32735, 0, 1, 0.4823529, 1,
-0.162284, 0.6744374, -0.2867713, 0, 1, 0.4901961, 1,
-0.1594147, 0.4000509, -1.947843, 0, 1, 0.4941176, 1,
-0.1578807, -1.588735, -4.176617, 0, 1, 0.5019608, 1,
-0.1567961, 0.4096657, 0.1019652, 0, 1, 0.509804, 1,
-0.1470589, 0.5513654, 1.030426, 0, 1, 0.5137255, 1,
-0.1466643, 0.6172871, -1.966421, 0, 1, 0.5215687, 1,
-0.1457866, 0.2368313, 0.7805567, 0, 1, 0.5254902, 1,
-0.1424305, -0.08016652, -0.09976586, 0, 1, 0.5333334, 1,
-0.141376, 0.1345577, -1.609514, 0, 1, 0.5372549, 1,
-0.1401668, -0.7727766, -1.689802, 0, 1, 0.5450981, 1,
-0.1397096, 2.014936, 0.2705505, 0, 1, 0.5490196, 1,
-0.139377, -1.043617, -2.172007, 0, 1, 0.5568628, 1,
-0.1307334, 0.1255389, -0.8629814, 0, 1, 0.5607843, 1,
-0.1268165, -1.008216, -2.85022, 0, 1, 0.5686275, 1,
-0.1263973, -0.5364411, -3.389762, 0, 1, 0.572549, 1,
-0.1260663, 1.556307, -0.4062024, 0, 1, 0.5803922, 1,
-0.1260067, -2.238625, -3.703479, 0, 1, 0.5843138, 1,
-0.1256765, 0.862062, -2.399008, 0, 1, 0.5921569, 1,
-0.1256548, -0.09207258, -3.719019, 0, 1, 0.5960785, 1,
-0.125166, -0.9140596, -2.626915, 0, 1, 0.6039216, 1,
-0.1248351, -1.901701, -1.300511, 0, 1, 0.6117647, 1,
-0.1246848, 0.7693411, -0.4647866, 0, 1, 0.6156863, 1,
-0.1216953, 0.9799405, -0.2326784, 0, 1, 0.6235294, 1,
-0.1166081, -0.3741893, -2.914511, 0, 1, 0.627451, 1,
-0.1131565, -0.7931861, -4.549726, 0, 1, 0.6352941, 1,
-0.1123842, 0.1141839, -0.4692978, 0, 1, 0.6392157, 1,
-0.1078298, 0.3237896, -1.411165, 0, 1, 0.6470588, 1,
-0.1000945, -0.2668837, -3.007617, 0, 1, 0.6509804, 1,
-0.09983601, 0.7738974, -0.4915467, 0, 1, 0.6588235, 1,
-0.09657469, 1.215714, 1.081497, 0, 1, 0.6627451, 1,
-0.0959738, -0.3294584, -4.10514, 0, 1, 0.6705883, 1,
-0.09493283, 0.1694693, -2.231253, 0, 1, 0.6745098, 1,
-0.09461585, 1.745276, -1.34288, 0, 1, 0.682353, 1,
-0.0941505, 0.3829342, 0.8250353, 0, 1, 0.6862745, 1,
-0.09306183, -1.937823, -3.164187, 0, 1, 0.6941177, 1,
-0.09011635, -1.255678, -1.401185, 0, 1, 0.7019608, 1,
-0.0887828, -0.2402353, -1.502798, 0, 1, 0.7058824, 1,
-0.07994767, 0.167791, -0.07757498, 0, 1, 0.7137255, 1,
-0.07783046, -2.625108, -1.666726, 0, 1, 0.7176471, 1,
-0.07756791, -1.293704, -3.88915, 0, 1, 0.7254902, 1,
-0.07318718, -0.8630458, -3.016221, 0, 1, 0.7294118, 1,
-0.07288557, 0.5261947, 0.6976293, 0, 1, 0.7372549, 1,
-0.07233346, -1.712533, -4.156522, 0, 1, 0.7411765, 1,
-0.07204939, 0.9448587, -1.524184, 0, 1, 0.7490196, 1,
-0.07182669, 1.100983, 0.08258962, 0, 1, 0.7529412, 1,
-0.06937127, 0.2737067, -1.213978, 0, 1, 0.7607843, 1,
-0.06905793, 1.104729, 0.5556012, 0, 1, 0.7647059, 1,
-0.06902537, 1.60686, 1.774921, 0, 1, 0.772549, 1,
-0.06470449, 0.3039491, -0.8866472, 0, 1, 0.7764706, 1,
-0.058534, -0.3414942, -3.109401, 0, 1, 0.7843137, 1,
-0.05729415, 0.9155703, -1.068848, 0, 1, 0.7882353, 1,
-0.05558508, 0.2661601, -0.3484393, 0, 1, 0.7960784, 1,
-0.05547554, 1.085137, -0.8380679, 0, 1, 0.8039216, 1,
-0.05405254, 1.223278, -0.460055, 0, 1, 0.8078431, 1,
-0.0520065, 0.466333, 0.7175491, 0, 1, 0.8156863, 1,
-0.05139416, 0.5787811, -0.09047479, 0, 1, 0.8196079, 1,
-0.05123769, 0.0155072, -0.9878991, 0, 1, 0.827451, 1,
-0.04778432, -2.300766, -3.228805, 0, 1, 0.8313726, 1,
-0.04509792, 0.7580453, -0.1846361, 0, 1, 0.8392157, 1,
-0.04457022, -0.9121827, -2.891973, 0, 1, 0.8431373, 1,
-0.03609261, 0.1498181, -0.435446, 0, 1, 0.8509804, 1,
-0.03329355, -0.5556848, -0.04703232, 0, 1, 0.854902, 1,
-0.0286966, -0.7516578, -3.953647, 0, 1, 0.8627451, 1,
-0.02854336, -1.103082, -3.207822, 0, 1, 0.8666667, 1,
-0.02449616, -1.342208, -3.359897, 0, 1, 0.8745098, 1,
-0.02319321, 0.9700338, 0.9097859, 0, 1, 0.8784314, 1,
-0.02307889, -1.52711, -4.442289, 0, 1, 0.8862745, 1,
-0.02021102, 0.5941412, 1.514985, 0, 1, 0.8901961, 1,
-0.01698069, -1.651759, -3.248238, 0, 1, 0.8980392, 1,
-0.009956519, -0.1495453, -2.309249, 0, 1, 0.9058824, 1,
-0.004481915, 0.6924077, -0.3684657, 0, 1, 0.9098039, 1,
-0.002137741, -1.543597, -2.543937, 0, 1, 0.9176471, 1,
0.0002720205, -0.4462679, 4.451176, 0, 1, 0.9215686, 1,
0.0003197545, 1.151907, 0.5369024, 0, 1, 0.9294118, 1,
0.005242943, -1.373797, 3.526001, 0, 1, 0.9333333, 1,
0.007888719, 0.6367026, -1.474371, 0, 1, 0.9411765, 1,
0.008003785, -1.599937, 3.702072, 0, 1, 0.945098, 1,
0.008219656, 1.169447, 0.4583508, 0, 1, 0.9529412, 1,
0.01075699, -0.438109, 2.946146, 0, 1, 0.9568627, 1,
0.01282567, -1.243378, 3.231265, 0, 1, 0.9647059, 1,
0.01530754, -1.427726, 3.197481, 0, 1, 0.9686275, 1,
0.01537189, 0.3746768, -0.1836932, 0, 1, 0.9764706, 1,
0.01640607, 1.553375, 0.4490773, 0, 1, 0.9803922, 1,
0.01840823, 1.333176, 0.5153201, 0, 1, 0.9882353, 1,
0.02659079, 0.3494129, 0.05320252, 0, 1, 0.9921569, 1,
0.03242796, 2.085607, -1.861702, 0, 1, 1, 1,
0.03377412, 1.76103, 0.9659582, 0, 0.9921569, 1, 1,
0.03861485, 0.7812434, 0.4591801, 0, 0.9882353, 1, 1,
0.04527709, 0.4807149, -1.124864, 0, 0.9803922, 1, 1,
0.04726915, 1.441615, 0.152337, 0, 0.9764706, 1, 1,
0.04966563, -0.5582549, 4.050378, 0, 0.9686275, 1, 1,
0.05294725, -1.45423, 3.231146, 0, 0.9647059, 1, 1,
0.05922586, 0.4611772, 0.2937018, 0, 0.9568627, 1, 1,
0.06039426, 1.234197, -1.479215, 0, 0.9529412, 1, 1,
0.06082578, -0.5142526, 3.342513, 0, 0.945098, 1, 1,
0.06236171, -1.577873, 3.652609, 0, 0.9411765, 1, 1,
0.06875799, 0.4261974, 0.6085864, 0, 0.9333333, 1, 1,
0.07255374, -0.8513361, 2.13788, 0, 0.9294118, 1, 1,
0.07279544, -0.7733511, 3.945627, 0, 0.9215686, 1, 1,
0.07371759, -0.157328, 3.212557, 0, 0.9176471, 1, 1,
0.0740774, 0.2220435, 2.301368, 0, 0.9098039, 1, 1,
0.07612465, 0.6070041, -0.08924778, 0, 0.9058824, 1, 1,
0.07625531, -0.7097591, 1.880612, 0, 0.8980392, 1, 1,
0.08229883, 0.09525581, -0.1310973, 0, 0.8901961, 1, 1,
0.08347874, 0.9385301, 1.445373, 0, 0.8862745, 1, 1,
0.08357945, 0.4662725, -1.550098, 0, 0.8784314, 1, 1,
0.0876446, -0.7668027, 4.169569, 0, 0.8745098, 1, 1,
0.08823542, -1.223071, 3.167696, 0, 0.8666667, 1, 1,
0.08890658, 2.252224, 0.6143355, 0, 0.8627451, 1, 1,
0.09049173, 0.1661097, -0.2007993, 0, 0.854902, 1, 1,
0.09335129, -0.08399262, 2.555013, 0, 0.8509804, 1, 1,
0.09830234, 0.7595127, 0.5063584, 0, 0.8431373, 1, 1,
0.09874608, 0.5650918, 1.056621, 0, 0.8392157, 1, 1,
0.1002742, 0.3333269, 0.3872642, 0, 0.8313726, 1, 1,
0.1004052, 1.941826, -2.341431, 0, 0.827451, 1, 1,
0.1055512, -1.785045, 1.781634, 0, 0.8196079, 1, 1,
0.1096487, -0.6076867, 1.205149, 0, 0.8156863, 1, 1,
0.113196, -0.9248119, 3.213195, 0, 0.8078431, 1, 1,
0.1145782, 0.130638, 1.924242, 0, 0.8039216, 1, 1,
0.115013, 1.036875, -1.267012, 0, 0.7960784, 1, 1,
0.1173503, -1.318942, 3.44871, 0, 0.7882353, 1, 1,
0.1208937, -0.6766068, 2.18031, 0, 0.7843137, 1, 1,
0.1219917, 1.607753, 1.479387, 0, 0.7764706, 1, 1,
0.1220653, 0.5549129, -0.2089271, 0, 0.772549, 1, 1,
0.1234224, 0.5002266, -0.4881243, 0, 0.7647059, 1, 1,
0.1248235, 0.1907431, 0.9674331, 0, 0.7607843, 1, 1,
0.1251218, 0.8374716, -1.360831, 0, 0.7529412, 1, 1,
0.1273475, 1.027968, -1.348428, 0, 0.7490196, 1, 1,
0.1288764, -0.1513231, 1.583382, 0, 0.7411765, 1, 1,
0.1353143, 1.02759, 1.632669, 0, 0.7372549, 1, 1,
0.1418278, -0.3855686, 0.9758201, 0, 0.7294118, 1, 1,
0.142274, -0.20572, 3.185402, 0, 0.7254902, 1, 1,
0.1469383, -0.2557013, 2.162795, 0, 0.7176471, 1, 1,
0.1573934, -1.731041, 4.105573, 0, 0.7137255, 1, 1,
0.1595054, 0.6269376, 0.3530543, 0, 0.7058824, 1, 1,
0.1622573, 0.7496451, 0.1823386, 0, 0.6980392, 1, 1,
0.1643196, 0.6205361, 1.308649, 0, 0.6941177, 1, 1,
0.164529, -1.635937, 0.367914, 0, 0.6862745, 1, 1,
0.1669719, 0.3198447, 2.231802, 0, 0.682353, 1, 1,
0.167737, -0.05242823, 2.499059, 0, 0.6745098, 1, 1,
0.1686685, 1.268338, -0.4225426, 0, 0.6705883, 1, 1,
0.1691541, 0.1345508, 2.25017, 0, 0.6627451, 1, 1,
0.1769554, 1.264261, 2.053334, 0, 0.6588235, 1, 1,
0.1784995, 0.5080991, -0.1757013, 0, 0.6509804, 1, 1,
0.178996, -0.4099594, 3.926573, 0, 0.6470588, 1, 1,
0.1848319, 1.077513, 0.436542, 0, 0.6392157, 1, 1,
0.1878107, 0.4197834, 0.7403166, 0, 0.6352941, 1, 1,
0.1888519, 0.3745812, -0.04439541, 0, 0.627451, 1, 1,
0.198163, 0.7569218, 1.70275, 0, 0.6235294, 1, 1,
0.1990669, -1.668009, 3.661219, 0, 0.6156863, 1, 1,
0.2053202, 0.9796983, -0.1524162, 0, 0.6117647, 1, 1,
0.205438, 0.1256606, 1.866283, 0, 0.6039216, 1, 1,
0.2073727, 0.1649432, 0.8714664, 0, 0.5960785, 1, 1,
0.2090304, -0.3979721, 2.07495, 0, 0.5921569, 1, 1,
0.2099373, 0.2956271, 0.9191248, 0, 0.5843138, 1, 1,
0.2134673, -1.026336, 2.484501, 0, 0.5803922, 1, 1,
0.2176595, -0.4828878, 2.161888, 0, 0.572549, 1, 1,
0.2176752, 0.8573098, -0.01600139, 0, 0.5686275, 1, 1,
0.2182756, -0.5987111, 2.773376, 0, 0.5607843, 1, 1,
0.2188152, -0.1666693, 1.50615, 0, 0.5568628, 1, 1,
0.2189866, -0.470755, 3.278812, 0, 0.5490196, 1, 1,
0.2207744, 0.5557845, 0.711679, 0, 0.5450981, 1, 1,
0.2211263, 1.117392, -0.5849327, 0, 0.5372549, 1, 1,
0.2227488, -0.7457129, 2.774133, 0, 0.5333334, 1, 1,
0.2233974, -0.2141809, 3.147292, 0, 0.5254902, 1, 1,
0.2300268, 0.1688967, 1.109947, 0, 0.5215687, 1, 1,
0.2311679, -0.1434973, 2.129924, 0, 0.5137255, 1, 1,
0.2338889, 2.203688, -0.2648647, 0, 0.509804, 1, 1,
0.2341162, 1.15606, 0.1620041, 0, 0.5019608, 1, 1,
0.2373741, 0.3087364, 1.628763, 0, 0.4941176, 1, 1,
0.2375293, -1.437331, 1.719453, 0, 0.4901961, 1, 1,
0.237824, -1.058932, 6.148747, 0, 0.4823529, 1, 1,
0.2428379, 0.6604555, 0.6928415, 0, 0.4784314, 1, 1,
0.2433284, 1.418104, -1.903986, 0, 0.4705882, 1, 1,
0.2442345, 1.404856, 2.553869, 0, 0.4666667, 1, 1,
0.2447339, 1.397505, -0.1372584, 0, 0.4588235, 1, 1,
0.2499617, 1.022287, 0.8098393, 0, 0.454902, 1, 1,
0.2562067, 0.5182936, -1.280961, 0, 0.4470588, 1, 1,
0.2627611, 1.280406, 0.283524, 0, 0.4431373, 1, 1,
0.2631116, -0.5821186, 1.840228, 0, 0.4352941, 1, 1,
0.2691561, -0.7267073, 2.7068, 0, 0.4313726, 1, 1,
0.2699467, -1.761444, 3.776741, 0, 0.4235294, 1, 1,
0.2709608, -1.685273, 3.690732, 0, 0.4196078, 1, 1,
0.2731753, 0.309065, 0.4587031, 0, 0.4117647, 1, 1,
0.2735941, 0.6192136, 1.689439, 0, 0.4078431, 1, 1,
0.2746014, 2.026906, 0.7087311, 0, 0.4, 1, 1,
0.2753133, -0.7794964, 2.558917, 0, 0.3921569, 1, 1,
0.2763666, 0.3040085, 0.4980804, 0, 0.3882353, 1, 1,
0.2806343, -0.7360629, 4.038814, 0, 0.3803922, 1, 1,
0.2821018, 1.037023, -1.632508, 0, 0.3764706, 1, 1,
0.2861054, -0.4439846, 0.9915598, 0, 0.3686275, 1, 1,
0.2874128, -1.380665, 1.963355, 0, 0.3647059, 1, 1,
0.288756, 0.5657389, -1.288775, 0, 0.3568628, 1, 1,
0.2915833, -1.568464, 4.973367, 0, 0.3529412, 1, 1,
0.2920286, -1.171327, 2.398488, 0, 0.345098, 1, 1,
0.296006, -1.435743, 3.498877, 0, 0.3411765, 1, 1,
0.2966269, 0.4634764, 1.396178, 0, 0.3333333, 1, 1,
0.2978087, -0.5410692, 1.422327, 0, 0.3294118, 1, 1,
0.298946, -0.5857102, 2.755512, 0, 0.3215686, 1, 1,
0.2990065, -0.7994829, 2.679471, 0, 0.3176471, 1, 1,
0.299014, -0.9518736, 3.001415, 0, 0.3098039, 1, 1,
0.300454, -0.04135676, 3.150149, 0, 0.3058824, 1, 1,
0.3016081, 0.2169092, 1.319882, 0, 0.2980392, 1, 1,
0.3099273, -1.678271, 2.177617, 0, 0.2901961, 1, 1,
0.3119331, 0.5841174, -0.2998252, 0, 0.2862745, 1, 1,
0.3155835, -0.4633632, 3.846424, 0, 0.2784314, 1, 1,
0.3163786, -0.2384593, 2.315852, 0, 0.2745098, 1, 1,
0.3207453, 0.2222103, -0.1253498, 0, 0.2666667, 1, 1,
0.3215185, 0.4114387, 0.9123557, 0, 0.2627451, 1, 1,
0.3258833, 0.2493739, 1.739424, 0, 0.254902, 1, 1,
0.3270391, -0.4933071, 2.034193, 0, 0.2509804, 1, 1,
0.3277209, 0.9219949, -0.08200344, 0, 0.2431373, 1, 1,
0.3286395, 0.7406766, 2.632263, 0, 0.2392157, 1, 1,
0.3309815, 0.2505109, 2.109404, 0, 0.2313726, 1, 1,
0.3327612, -2.566306, 3.981748, 0, 0.227451, 1, 1,
0.3378286, 2.555998, 0.349843, 0, 0.2196078, 1, 1,
0.3389748, 0.2649868, 2.546211, 0, 0.2156863, 1, 1,
0.3393806, -1.31436, 2.018186, 0, 0.2078431, 1, 1,
0.3403459, -0.4673336, 3.593837, 0, 0.2039216, 1, 1,
0.3407863, -1.920938, 1.931404, 0, 0.1960784, 1, 1,
0.3419498, 0.6990609, 0.364105, 0, 0.1882353, 1, 1,
0.3465511, -1.274134, 3.673272, 0, 0.1843137, 1, 1,
0.3482744, -0.4212587, 3.261093, 0, 0.1764706, 1, 1,
0.3501089, 1.604573, 0.2514503, 0, 0.172549, 1, 1,
0.3531434, 0.4139414, -0.286919, 0, 0.1647059, 1, 1,
0.3548668, -0.1707201, 3.163, 0, 0.1607843, 1, 1,
0.3550603, 1.418134, 0.2582741, 0, 0.1529412, 1, 1,
0.3553527, -0.5394312, 2.492988, 0, 0.1490196, 1, 1,
0.355775, -0.6281621, 2.72936, 0, 0.1411765, 1, 1,
0.3564355, -0.4318174, 3.677488, 0, 0.1372549, 1, 1,
0.3564971, -0.0735468, 0.6711522, 0, 0.1294118, 1, 1,
0.3580827, 0.06658025, 2.5753, 0, 0.1254902, 1, 1,
0.362576, 0.4451713, 0.3357742, 0, 0.1176471, 1, 1,
0.363169, -0.01039784, 2.669038, 0, 0.1137255, 1, 1,
0.3687244, 0.2748433, 1.225073, 0, 0.1058824, 1, 1,
0.3703899, 1.737499, -1.08867, 0, 0.09803922, 1, 1,
0.371556, -1.073585, 0.9373002, 0, 0.09411765, 1, 1,
0.3721157, 0.6660326, -0.7026705, 0, 0.08627451, 1, 1,
0.3750435, -0.4005628, 2.482119, 0, 0.08235294, 1, 1,
0.3753568, -1.426439, 3.188118, 0, 0.07450981, 1, 1,
0.3782909, 0.4329526, -2.095392, 0, 0.07058824, 1, 1,
0.3828733, 0.9825096, -0.625694, 0, 0.0627451, 1, 1,
0.3829253, 1.152874, -0.561009, 0, 0.05882353, 1, 1,
0.3834009, -0.08635034, 1.658901, 0, 0.05098039, 1, 1,
0.3851515, -0.6353682, 2.894695, 0, 0.04705882, 1, 1,
0.3873095, 0.3060458, -0.6829758, 0, 0.03921569, 1, 1,
0.3879575, 0.7329158, 0.1359448, 0, 0.03529412, 1, 1,
0.3882483, -0.5745203, 1.985778, 0, 0.02745098, 1, 1,
0.3935284, 0.9148726, 0.2658125, 0, 0.02352941, 1, 1,
0.3949057, 1.19952, -0.4129178, 0, 0.01568628, 1, 1,
0.3955367, 3.45898, -0.7871895, 0, 0.01176471, 1, 1,
0.3974786, 0.4865204, 0.882476, 0, 0.003921569, 1, 1,
0.3984886, 2.568892, 2.003566, 0.003921569, 0, 1, 1,
0.4039244, -2.010855, 2.096973, 0.007843138, 0, 1, 1,
0.4076547, 1.907723, -0.5882182, 0.01568628, 0, 1, 1,
0.4092978, -1.029421, 4.379108, 0.01960784, 0, 1, 1,
0.4110669, 0.2908783, 0.9548564, 0.02745098, 0, 1, 1,
0.4131786, -0.8666229, 1.339662, 0.03137255, 0, 1, 1,
0.4141597, 0.2088668, 1.781761, 0.03921569, 0, 1, 1,
0.4161927, 0.1586358, 1.048631, 0.04313726, 0, 1, 1,
0.4242496, -0.6901059, 3.940588, 0.05098039, 0, 1, 1,
0.4260533, 0.3852876, 1.81631, 0.05490196, 0, 1, 1,
0.4270399, 0.6851236, -0.971231, 0.0627451, 0, 1, 1,
0.4285026, 0.3472447, 0.5157153, 0.06666667, 0, 1, 1,
0.43612, 0.9159017, 1.566998, 0.07450981, 0, 1, 1,
0.4366528, -0.3247172, 2.430844, 0.07843138, 0, 1, 1,
0.4431728, 1.309125, -0.4495635, 0.08627451, 0, 1, 1,
0.4441794, -0.1386446, 2.373671, 0.09019608, 0, 1, 1,
0.4457881, -2.33427, 2.646135, 0.09803922, 0, 1, 1,
0.4511293, 1.209939, -0.4159538, 0.1058824, 0, 1, 1,
0.4587577, -0.7415123, 4.513934, 0.1098039, 0, 1, 1,
0.4603831, -2.232714, 3.072008, 0.1176471, 0, 1, 1,
0.466036, 0.2569951, 0.5163209, 0.1215686, 0, 1, 1,
0.4725143, 1.311247, -0.01659817, 0.1294118, 0, 1, 1,
0.4743148, 0.2899732, 1.643066, 0.1333333, 0, 1, 1,
0.4750244, 1.118954, 1.85137, 0.1411765, 0, 1, 1,
0.4751258, -1.311339, 5.124852, 0.145098, 0, 1, 1,
0.4774402, -0.2931064, 1.825207, 0.1529412, 0, 1, 1,
0.4785627, -0.350485, 1.677065, 0.1568628, 0, 1, 1,
0.4833072, 0.6098986, -0.456502, 0.1647059, 0, 1, 1,
0.483881, 0.6535678, 1.240692, 0.1686275, 0, 1, 1,
0.4943892, -0.5799084, 2.464159, 0.1764706, 0, 1, 1,
0.4988246, 2.196418, 1.074984, 0.1803922, 0, 1, 1,
0.5020914, -0.1504229, 2.946347, 0.1882353, 0, 1, 1,
0.5023407, -0.4875069, 1.764994, 0.1921569, 0, 1, 1,
0.5083478, -1.602172, 4.272868, 0.2, 0, 1, 1,
0.5203099, 1.657988, 1.623313, 0.2078431, 0, 1, 1,
0.5269939, -0.4449047, 0.5570394, 0.2117647, 0, 1, 1,
0.5282049, 0.8933399, 0.1289429, 0.2196078, 0, 1, 1,
0.5294735, 1.61379, -0.2912683, 0.2235294, 0, 1, 1,
0.5296048, 0.5581135, -0.2055091, 0.2313726, 0, 1, 1,
0.5324188, 0.7142925, -0.9950993, 0.2352941, 0, 1, 1,
0.5327883, -1.093332, 3.062767, 0.2431373, 0, 1, 1,
0.533102, 1.866157, 0.5707315, 0.2470588, 0, 1, 1,
0.5361201, 0.4233831, -0.8745005, 0.254902, 0, 1, 1,
0.5384354, 0.9953932, 0.4808528, 0.2588235, 0, 1, 1,
0.5385035, -0.4546774, 0.9355245, 0.2666667, 0, 1, 1,
0.539094, -1.183399, 2.218538, 0.2705882, 0, 1, 1,
0.5426536, -0.07462411, 2.047873, 0.2784314, 0, 1, 1,
0.5432941, 0.4297313, 0.1363694, 0.282353, 0, 1, 1,
0.5474289, -1.535244, 2.71742, 0.2901961, 0, 1, 1,
0.5529488, 0.548005, -0.6691071, 0.2941177, 0, 1, 1,
0.556619, 0.0279999, 0.5397114, 0.3019608, 0, 1, 1,
0.5578501, 0.4358043, -0.2768131, 0.3098039, 0, 1, 1,
0.5585195, 0.08824302, 1.751347, 0.3137255, 0, 1, 1,
0.5602828, -0.0727656, 2.816335, 0.3215686, 0, 1, 1,
0.5608563, -2.106693, 0.9843867, 0.3254902, 0, 1, 1,
0.5620244, 0.3456851, 2.242283, 0.3333333, 0, 1, 1,
0.5630764, -0.3827097, 1.908489, 0.3372549, 0, 1, 1,
0.5639568, -0.01608829, 1.171755, 0.345098, 0, 1, 1,
0.5648772, 1.955189, -1.671963, 0.3490196, 0, 1, 1,
0.5671405, -1.500432, 2.290967, 0.3568628, 0, 1, 1,
0.5719661, -0.0364759, 2.158472, 0.3607843, 0, 1, 1,
0.5725963, 1.009746, -0.6346998, 0.3686275, 0, 1, 1,
0.5806779, -0.139243, 2.756265, 0.372549, 0, 1, 1,
0.5817701, 2.352438, -1.184308, 0.3803922, 0, 1, 1,
0.596541, -0.6030304, 0.5913466, 0.3843137, 0, 1, 1,
0.5967278, -0.7382596, 3.624952, 0.3921569, 0, 1, 1,
0.6128516, 0.611318, -0.4563034, 0.3960784, 0, 1, 1,
0.6152455, 1.708001, 1.624877, 0.4039216, 0, 1, 1,
0.6158828, -0.2795457, 0.7671124, 0.4117647, 0, 1, 1,
0.6197329, 1.630743, 0.3134441, 0.4156863, 0, 1, 1,
0.6202248, 0.03616172, 2.479463, 0.4235294, 0, 1, 1,
0.6281039, -2.060321, 2.116137, 0.427451, 0, 1, 1,
0.6342601, 1.313688, -0.9330941, 0.4352941, 0, 1, 1,
0.6386248, 0.6770787, 1.29828, 0.4392157, 0, 1, 1,
0.6503013, -1.466958, 1.100326, 0.4470588, 0, 1, 1,
0.6511151, 0.1509092, 1.577817, 0.4509804, 0, 1, 1,
0.6512362, -0.9371636, 2.451611, 0.4588235, 0, 1, 1,
0.6526775, 0.4030972, 2.446097, 0.4627451, 0, 1, 1,
0.6560531, -1.177741, 3.490801, 0.4705882, 0, 1, 1,
0.6565503, -0.13081, 4.15639, 0.4745098, 0, 1, 1,
0.656669, 0.520175, 1.502277, 0.4823529, 0, 1, 1,
0.6616686, 0.5690711, 1.31376, 0.4862745, 0, 1, 1,
0.663019, -0.4006167, 0.894502, 0.4941176, 0, 1, 1,
0.6637902, 1.490051, -0.5596638, 0.5019608, 0, 1, 1,
0.6656473, 0.9806018, 0.8349474, 0.5058824, 0, 1, 1,
0.6696547, -1.114975, 1.793071, 0.5137255, 0, 1, 1,
0.6717086, 0.2475715, 1.587834, 0.5176471, 0, 1, 1,
0.6718388, -0.6590809, 1.433391, 0.5254902, 0, 1, 1,
0.6749941, 0.3308403, 1.882912, 0.5294118, 0, 1, 1,
0.6767402, -1.727401, 2.957506, 0.5372549, 0, 1, 1,
0.6773831, 0.06727925, 3.473548, 0.5411765, 0, 1, 1,
0.6789359, -0.04566993, 1.585338, 0.5490196, 0, 1, 1,
0.6859976, -0.9213485, 1.772804, 0.5529412, 0, 1, 1,
0.6867301, 1.795799, -0.07281817, 0.5607843, 0, 1, 1,
0.6939588, -1.288044, 3.347118, 0.5647059, 0, 1, 1,
0.6941445, -0.4233387, 0.5925907, 0.572549, 0, 1, 1,
0.6947551, -0.79505, 3.649633, 0.5764706, 0, 1, 1,
0.6991592, -0.7945834, 3.043795, 0.5843138, 0, 1, 1,
0.700747, -2.983402, 2.791276, 0.5882353, 0, 1, 1,
0.705548, -0.3349139, 2.455463, 0.5960785, 0, 1, 1,
0.7120404, -0.2173956, 0.856601, 0.6039216, 0, 1, 1,
0.716728, 0.877102, 1.017435, 0.6078432, 0, 1, 1,
0.7195331, 0.4682095, 1.394959, 0.6156863, 0, 1, 1,
0.720025, -0.3853656, 1.748113, 0.6196079, 0, 1, 1,
0.7235889, -1.222191, 3.33307, 0.627451, 0, 1, 1,
0.7287245, -0.5909384, 2.28883, 0.6313726, 0, 1, 1,
0.7357897, 0.01289672, 3.10465, 0.6392157, 0, 1, 1,
0.7388205, 0.2258799, 0.7927212, 0.6431373, 0, 1, 1,
0.7423903, -0.4699599, 1.550421, 0.6509804, 0, 1, 1,
0.74264, 0.6314155, 0.7788154, 0.654902, 0, 1, 1,
0.7449117, -0.3124254, 1.041795, 0.6627451, 0, 1, 1,
0.7454371, -0.3305517, 1.128455, 0.6666667, 0, 1, 1,
0.7459678, -0.06715467, 0.3659974, 0.6745098, 0, 1, 1,
0.7480648, -0.03117334, 1.35686, 0.6784314, 0, 1, 1,
0.749386, 0.09078067, 1.641194, 0.6862745, 0, 1, 1,
0.7530447, 1.734208, 0.09128425, 0.6901961, 0, 1, 1,
0.7539364, -0.6244391, 4.594392, 0.6980392, 0, 1, 1,
0.7578042, -1.500388, 2.437419, 0.7058824, 0, 1, 1,
0.7707964, -0.2297897, 0.6799662, 0.7098039, 0, 1, 1,
0.7749366, 0.1352385, 2.805802, 0.7176471, 0, 1, 1,
0.7792807, 0.3080921, 2.103489, 0.7215686, 0, 1, 1,
0.7855919, -0.0185939, 1.946066, 0.7294118, 0, 1, 1,
0.7880638, 1.733757, 0.9983568, 0.7333333, 0, 1, 1,
0.7882468, 0.06613058, -0.3937831, 0.7411765, 0, 1, 1,
0.7900504, 0.6790575, 0.879208, 0.7450981, 0, 1, 1,
0.7930189, 1.102908, 0.03014019, 0.7529412, 0, 1, 1,
0.801468, 0.6837146, 0.01454967, 0.7568628, 0, 1, 1,
0.8107901, 1.305924, -2.190117, 0.7647059, 0, 1, 1,
0.8110154, 0.07292337, 3.298789, 0.7686275, 0, 1, 1,
0.8120103, -1.783695, 3.221436, 0.7764706, 0, 1, 1,
0.8134965, 0.4530419, 2.686933, 0.7803922, 0, 1, 1,
0.816727, 0.3292407, 0.9424804, 0.7882353, 0, 1, 1,
0.8184488, -0.8875018, 2.203927, 0.7921569, 0, 1, 1,
0.819736, 1.773946, 0.3218289, 0.8, 0, 1, 1,
0.8296293, -0.1284766, 0.8920009, 0.8078431, 0, 1, 1,
0.8306702, 1.160727, 1.092458, 0.8117647, 0, 1, 1,
0.8342076, 0.145367, 1.152648, 0.8196079, 0, 1, 1,
0.83806, -0.0140499, 1.199543, 0.8235294, 0, 1, 1,
0.8390338, -1.188974, 2.768801, 0.8313726, 0, 1, 1,
0.8415145, -0.3357246, 0.9023791, 0.8352941, 0, 1, 1,
0.846697, -2.265947, 2.306745, 0.8431373, 0, 1, 1,
0.8476681, -0.7266599, 2.461059, 0.8470588, 0, 1, 1,
0.8522118, -0.6832329, 2.857929, 0.854902, 0, 1, 1,
0.8571963, -0.9520277, 1.682669, 0.8588235, 0, 1, 1,
0.8576171, 1.253739, 1.829126, 0.8666667, 0, 1, 1,
0.8595294, -0.690062, 1.633286, 0.8705882, 0, 1, 1,
0.8646674, 0.7766964, -0.9367382, 0.8784314, 0, 1, 1,
0.8728793, 0.7357064, 2.197218, 0.8823529, 0, 1, 1,
0.8734267, -0.1076914, 2.297033, 0.8901961, 0, 1, 1,
0.8787208, -0.6665178, 3.086864, 0.8941177, 0, 1, 1,
0.8791385, 0.3307574, 2.405959, 0.9019608, 0, 1, 1,
0.8798295, -1.326375, 4.476315, 0.9098039, 0, 1, 1,
0.8905997, 1.889039, -0.2402257, 0.9137255, 0, 1, 1,
0.905794, -2.050533, 4.334055, 0.9215686, 0, 1, 1,
0.9207164, -1.804268, 4.599199, 0.9254902, 0, 1, 1,
0.9259452, 0.4047112, 0.682091, 0.9333333, 0, 1, 1,
0.9310567, -1.207763, 2.573961, 0.9372549, 0, 1, 1,
0.933511, 0.8391088, 1.156558, 0.945098, 0, 1, 1,
0.9335233, -1.287557, 2.576916, 0.9490196, 0, 1, 1,
0.9346815, -0.3842767, 2.941016, 0.9568627, 0, 1, 1,
0.936842, 2.250667, 1.363697, 0.9607843, 0, 1, 1,
0.9382416, 0.5428541, -0.6651149, 0.9686275, 0, 1, 1,
0.9396772, -0.3545702, -0.4580213, 0.972549, 0, 1, 1,
0.9410486, 0.7056675, 1.212904, 0.9803922, 0, 1, 1,
0.9432768, -0.9645575, 2.46896, 0.9843137, 0, 1, 1,
0.9437485, -0.7841412, 3.060683, 0.9921569, 0, 1, 1,
0.9471914, -0.8993545, 2.731483, 0.9960784, 0, 1, 1,
0.9551375, 0.9400228, 1.037034, 1, 0, 0.9960784, 1,
0.9616556, 0.8586481, 2.017551, 1, 0, 0.9882353, 1,
0.9638468, 1.511177, -1.019419, 1, 0, 0.9843137, 1,
0.9670629, 0.3361812, 1.456572, 1, 0, 0.9764706, 1,
0.9687148, -0.02302865, 1.094107, 1, 0, 0.972549, 1,
0.9824558, 1.124203, 1.041701, 1, 0, 0.9647059, 1,
0.9844489, 0.7015723, 1.432209, 1, 0, 0.9607843, 1,
0.9849187, 0.9654097, 1.241893, 1, 0, 0.9529412, 1,
0.9923267, -0.8023767, 2.289474, 1, 0, 0.9490196, 1,
0.9946739, 0.1763701, 2.220628, 1, 0, 0.9411765, 1,
0.9990697, -0.3192744, 2.907601, 1, 0, 0.9372549, 1,
1.000972, 0.4871473, 2.631998, 1, 0, 0.9294118, 1,
1.001104, -0.4076062, 3.558588, 1, 0, 0.9254902, 1,
1.003064, 0.08812312, 1.927069, 1, 0, 0.9176471, 1,
1.007439, 1.259606, -1.296246, 1, 0, 0.9137255, 1,
1.009338, -0.3463957, 2.845882, 1, 0, 0.9058824, 1,
1.027515, -0.5423922, 0.3027227, 1, 0, 0.9019608, 1,
1.032932, 0.7747607, 1.085884, 1, 0, 0.8941177, 1,
1.04001, -1.368875, 2.346015, 1, 0, 0.8862745, 1,
1.054431, 0.2267991, 1.322402, 1, 0, 0.8823529, 1,
1.055261, 0.4072349, 1.818296, 1, 0, 0.8745098, 1,
1.058483, 1.80814, -2.080353, 1, 0, 0.8705882, 1,
1.061171, -0.783017, 0.4100144, 1, 0, 0.8627451, 1,
1.063565, -1.239461, 0.8254513, 1, 0, 0.8588235, 1,
1.071173, -1.349471, 3.979428, 1, 0, 0.8509804, 1,
1.07894, -0.5403978, 2.644594, 1, 0, 0.8470588, 1,
1.080595, 1.066281, 0.4328197, 1, 0, 0.8392157, 1,
1.09506, -1.267963, 3.441667, 1, 0, 0.8352941, 1,
1.100116, -0.8385006, -1.193374, 1, 0, 0.827451, 1,
1.103854, -1.559196, 5.951232, 1, 0, 0.8235294, 1,
1.105595, 0.07701223, 2.427907, 1, 0, 0.8156863, 1,
1.112938, 0.6327042, 2.389717, 1, 0, 0.8117647, 1,
1.119013, 1.077695, 0.1442948, 1, 0, 0.8039216, 1,
1.12162, -0.1995092, 0.6807715, 1, 0, 0.7960784, 1,
1.125157, 0.02597951, 1.396946, 1, 0, 0.7921569, 1,
1.130037, -0.2291888, 3.405864, 1, 0, 0.7843137, 1,
1.14082, -1.658057, 3.230221, 1, 0, 0.7803922, 1,
1.145624, -1.018841, 2.615058, 1, 0, 0.772549, 1,
1.151415, -1.875221, 2.933493, 1, 0, 0.7686275, 1,
1.155553, -0.2717253, 0.963765, 1, 0, 0.7607843, 1,
1.156842, 0.3978621, 0.06274793, 1, 0, 0.7568628, 1,
1.157403, -0.2733723, 3.445231, 1, 0, 0.7490196, 1,
1.161419, 1.0233, 1.020432, 1, 0, 0.7450981, 1,
1.164501, 0.9125416, -1.125178, 1, 0, 0.7372549, 1,
1.16731, 0.7258734, 0.76078, 1, 0, 0.7333333, 1,
1.167336, 0.8528677, 1.459468, 1, 0, 0.7254902, 1,
1.180437, -1.251599, 3.659542, 1, 0, 0.7215686, 1,
1.184272, 0.5236796, 0.9964195, 1, 0, 0.7137255, 1,
1.186093, -0.244637, 2.089889, 1, 0, 0.7098039, 1,
1.191633, -0.3283183, -0.3180381, 1, 0, 0.7019608, 1,
1.196593, -0.9051248, 1.911758, 1, 0, 0.6941177, 1,
1.200659, -0.03352937, 0.4884065, 1, 0, 0.6901961, 1,
1.201577, 1.190833, 0.349563, 1, 0, 0.682353, 1,
1.207009, 0.1431712, 0.6412765, 1, 0, 0.6784314, 1,
1.207754, -0.8234593, 1.757775, 1, 0, 0.6705883, 1,
1.219281, -0.5577179, 0.9031814, 1, 0, 0.6666667, 1,
1.219475, 3.150486, 1.002699, 1, 0, 0.6588235, 1,
1.222564, 1.370104, 0.6013135, 1, 0, 0.654902, 1,
1.224374, 0.2269644, 0.6730293, 1, 0, 0.6470588, 1,
1.228032, 0.843372, 0.7920148, 1, 0, 0.6431373, 1,
1.23842, -0.2933755, 1.547675, 1, 0, 0.6352941, 1,
1.241264, 0.3070422, 1.435406, 1, 0, 0.6313726, 1,
1.247781, -0.1735868, 2.712971, 1, 0, 0.6235294, 1,
1.251288, 0.09221951, 0.9159954, 1, 0, 0.6196079, 1,
1.254442, -1.58851, 2.168092, 1, 0, 0.6117647, 1,
1.259595, 0.4722845, 1.256636, 1, 0, 0.6078432, 1,
1.262861, 0.2174024, 1.211529, 1, 0, 0.6, 1,
1.269941, 1.386027, 1.240755, 1, 0, 0.5921569, 1,
1.270586, -0.02965214, 2.278651, 1, 0, 0.5882353, 1,
1.272037, 0.3967111, 0.8047366, 1, 0, 0.5803922, 1,
1.277718, 1.025887, 2.188585, 1, 0, 0.5764706, 1,
1.279762, -0.4934278, 2.329808, 1, 0, 0.5686275, 1,
1.282528, -1.538564, 3.556064, 1, 0, 0.5647059, 1,
1.2857, -0.3885666, 1.440855, 1, 0, 0.5568628, 1,
1.285865, 0.4414434, 2.010612, 1, 0, 0.5529412, 1,
1.287058, 0.3598906, 1.159192, 1, 0, 0.5450981, 1,
1.315092, 0.661051, 3.622495, 1, 0, 0.5411765, 1,
1.326263, 0.7286502, 1.381092, 1, 0, 0.5333334, 1,
1.336615, -0.2279129, 2.108712, 1, 0, 0.5294118, 1,
1.336619, 2.024451, -0.9118652, 1, 0, 0.5215687, 1,
1.341129, 0.1591283, 2.957088, 1, 0, 0.5176471, 1,
1.361828, 0.6634293, 0.5651242, 1, 0, 0.509804, 1,
1.375399, 1.66205, 0.3964139, 1, 0, 0.5058824, 1,
1.377263, -1.015737, 0.9288962, 1, 0, 0.4980392, 1,
1.378383, 0.6870965, 1.515597, 1, 0, 0.4901961, 1,
1.402961, -0.1588653, 1.410267, 1, 0, 0.4862745, 1,
1.404406, -0.533171, 2.767427, 1, 0, 0.4784314, 1,
1.414021, -0.1381174, 2.767993, 1, 0, 0.4745098, 1,
1.421695, -0.5967048, 1.456856, 1, 0, 0.4666667, 1,
1.424925, -0.8169776, 4.318007, 1, 0, 0.4627451, 1,
1.425931, 1.27464, 0.6862894, 1, 0, 0.454902, 1,
1.432285, -0.2016464, 1.189458, 1, 0, 0.4509804, 1,
1.455065, -2.500357, 1.827159, 1, 0, 0.4431373, 1,
1.456101, -0.8824884, 2.070061, 1, 0, 0.4392157, 1,
1.481223, 0.4031234, 1.089518, 1, 0, 0.4313726, 1,
1.485172, -0.3725943, 1.689903, 1, 0, 0.427451, 1,
1.485482, -0.3584618, 2.372762, 1, 0, 0.4196078, 1,
1.489156, -0.4947305, 2.166645, 1, 0, 0.4156863, 1,
1.498038, -0.8290967, 2.133681, 1, 0, 0.4078431, 1,
1.510369, -0.002104692, 0.3325948, 1, 0, 0.4039216, 1,
1.520513, 1.565355, -0.4068089, 1, 0, 0.3960784, 1,
1.527512, -0.01665143, 1.190513, 1, 0, 0.3882353, 1,
1.541046, -0.1720257, 1.552877, 1, 0, 0.3843137, 1,
1.548337, -0.1808628, 0.7477926, 1, 0, 0.3764706, 1,
1.553456, 0.1953572, 1.451921, 1, 0, 0.372549, 1,
1.58459, -1.759959, 1.806793, 1, 0, 0.3647059, 1,
1.58597, 0.2151935, 1.619981, 1, 0, 0.3607843, 1,
1.593319, 2.359903, -0.4930826, 1, 0, 0.3529412, 1,
1.600634, -1.546841, 2.640396, 1, 0, 0.3490196, 1,
1.602283, 0.8118884, 0.3308557, 1, 0, 0.3411765, 1,
1.621488, -1.2775, 2.261914, 1, 0, 0.3372549, 1,
1.621933, -0.1822327, 0.191609, 1, 0, 0.3294118, 1,
1.622101, -0.9358858, 1.255759, 1, 0, 0.3254902, 1,
1.624648, 1.107961, 2.099715, 1, 0, 0.3176471, 1,
1.62546, -0.2500162, 2.634811, 1, 0, 0.3137255, 1,
1.627976, -1.662246, 2.707647, 1, 0, 0.3058824, 1,
1.634964, -0.3281582, 0.4503858, 1, 0, 0.2980392, 1,
1.648557, -0.2225309, 2.014884, 1, 0, 0.2941177, 1,
1.649947, 1.483134, 0.08847143, 1, 0, 0.2862745, 1,
1.649982, 0.2871198, 1.579608, 1, 0, 0.282353, 1,
1.654465, -0.181972, -0.6298304, 1, 0, 0.2745098, 1,
1.654771, -0.4223948, 1.677564, 1, 0, 0.2705882, 1,
1.655681, -0.4348639, 1.730701, 1, 0, 0.2627451, 1,
1.664822, -2.215705, 4.492252, 1, 0, 0.2588235, 1,
1.692447, 1.093866, 1.220497, 1, 0, 0.2509804, 1,
1.695574, -2.640452, 1.800528, 1, 0, 0.2470588, 1,
1.716344, 0.1305964, -0.8409992, 1, 0, 0.2392157, 1,
1.718084, 0.03834968, 2.281388, 1, 0, 0.2352941, 1,
1.719728, 1.156222, 1.826524, 1, 0, 0.227451, 1,
1.723277, 0.649674, -0.3147469, 1, 0, 0.2235294, 1,
1.731329, -0.04140664, 2.34139, 1, 0, 0.2156863, 1,
1.732065, -1.796928, 2.584557, 1, 0, 0.2117647, 1,
1.739612, 0.6989461, 1.22398, 1, 0, 0.2039216, 1,
1.747971, 1.095195, 1.483435, 1, 0, 0.1960784, 1,
1.748911, 0.533068, 1.117721, 1, 0, 0.1921569, 1,
1.769938, 0.4041412, 1.910056, 1, 0, 0.1843137, 1,
1.775789, -1.154987, 2.885299, 1, 0, 0.1803922, 1,
1.777385, -0.5981831, 2.36616, 1, 0, 0.172549, 1,
1.778454, 0.4467339, 0.6170853, 1, 0, 0.1686275, 1,
1.781105, 0.2263149, 1.027271, 1, 0, 0.1607843, 1,
1.840518, -1.030826, 1.192354, 1, 0, 0.1568628, 1,
1.882029, 0.5167593, 1.048409, 1, 0, 0.1490196, 1,
1.883721, -0.3329131, 0.1116098, 1, 0, 0.145098, 1,
1.901653, 0.8442807, 3.33503, 1, 0, 0.1372549, 1,
1.918417, 1.802018, 1.061388, 1, 0, 0.1333333, 1,
1.929288, -0.5530009, 0.6179115, 1, 0, 0.1254902, 1,
1.980345, -1.766523, 2.499161, 1, 0, 0.1215686, 1,
1.985078, 0.6924103, 3.103306, 1, 0, 0.1137255, 1,
1.998166, -2.301491, 2.007029, 1, 0, 0.1098039, 1,
2.003536, -1.025345, 2.818609, 1, 0, 0.1019608, 1,
2.017138, -0.5827589, 2.876552, 1, 0, 0.09411765, 1,
2.056893, -0.1847767, 1.004698, 1, 0, 0.09019608, 1,
2.094854, 0.7456708, 1.335771, 1, 0, 0.08235294, 1,
2.159156, 0.7689803, 0.7565395, 1, 0, 0.07843138, 1,
2.161049, 2.431588, 1.596553, 1, 0, 0.07058824, 1,
2.175916, 1.408847, 0.3218518, 1, 0, 0.06666667, 1,
2.18801, -0.3384654, 1.227426, 1, 0, 0.05882353, 1,
2.243572, 0.1306105, 2.776372, 1, 0, 0.05490196, 1,
2.26212, 1.166679, 0.2184846, 1, 0, 0.04705882, 1,
2.430128, -0.2278286, 1.039046, 1, 0, 0.04313726, 1,
2.444818, -0.6890485, 1.330275, 1, 0, 0.03529412, 1,
2.60255, -0.7155699, 1.894058, 1, 0, 0.03137255, 1,
2.823143, 1.242885, 2.30833, 1, 0, 0.02352941, 1,
2.903224, -0.8212954, 3.251153, 1, 0, 0.01960784, 1,
2.964374, 0.2827252, 1.219841, 1, 0, 0.01176471, 1,
3.202968, 0.416558, 2.484062, 1, 0, 0.007843138, 1
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
0.1954076, -4.075385, -6.363117, 0, -0.5, 0.5, 0.5,
0.1954076, -4.075385, -6.363117, 1, -0.5, 0.5, 0.5,
0.1954076, -4.075385, -6.363117, 1, 1.5, 0.5, 0.5,
0.1954076, -4.075385, -6.363117, 0, 1.5, 0.5, 0.5
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
-3.831716, 0.2377894, -6.363117, 0, -0.5, 0.5, 0.5,
-3.831716, 0.2377894, -6.363117, 1, -0.5, 0.5, 0.5,
-3.831716, 0.2377894, -6.363117, 1, 1.5, 0.5, 0.5,
-3.831716, 0.2377894, -6.363117, 0, 1.5, 0.5, 0.5
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
-3.831716, -4.075385, 0.7995107, 0, -0.5, 0.5, 0.5,
-3.831716, -4.075385, 0.7995107, 1, -0.5, 0.5, 0.5,
-3.831716, -4.075385, 0.7995107, 1, 1.5, 0.5, 0.5,
-3.831716, -4.075385, 0.7995107, 0, 1.5, 0.5, 0.5
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
-2, -3.080037, -4.710203,
3, -3.080037, -4.710203,
-2, -3.080037, -4.710203,
-2, -3.245929, -4.985688,
-1, -3.080037, -4.710203,
-1, -3.245929, -4.985688,
0, -3.080037, -4.710203,
0, -3.245929, -4.985688,
1, -3.080037, -4.710203,
1, -3.245929, -4.985688,
2, -3.080037, -4.710203,
2, -3.245929, -4.985688,
3, -3.080037, -4.710203,
3, -3.245929, -4.985688
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
-2, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
-2, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
-2, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
-2, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5,
-1, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
-1, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
-1, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
-1, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5,
0, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
0, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
0, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
0, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5,
1, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
1, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
1, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
1, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5,
2, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
2, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
2, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
2, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5,
3, -3.577711, -5.53666, 0, -0.5, 0.5, 0.5,
3, -3.577711, -5.53666, 1, -0.5, 0.5, 0.5,
3, -3.577711, -5.53666, 1, 1.5, 0.5, 0.5,
3, -3.577711, -5.53666, 0, 1.5, 0.5, 0.5
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
-2.90238, -2, -4.710203,
-2.90238, 3, -4.710203,
-2.90238, -2, -4.710203,
-3.057269, -2, -4.985688,
-2.90238, -1, -4.710203,
-3.057269, -1, -4.985688,
-2.90238, 0, -4.710203,
-3.057269, 0, -4.985688,
-2.90238, 1, -4.710203,
-3.057269, 1, -4.985688,
-2.90238, 2, -4.710203,
-3.057269, 2, -4.985688,
-2.90238, 3, -4.710203,
-3.057269, 3, -4.985688
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
-3.367048, -2, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, -2, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, -2, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, -2, -5.53666, 0, 1.5, 0.5, 0.5,
-3.367048, -1, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, -1, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, -1, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, -1, -5.53666, 0, 1.5, 0.5, 0.5,
-3.367048, 0, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, 0, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, 0, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, 0, -5.53666, 0, 1.5, 0.5, 0.5,
-3.367048, 1, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, 1, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, 1, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, 1, -5.53666, 0, 1.5, 0.5, 0.5,
-3.367048, 2, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, 2, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, 2, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, 2, -5.53666, 0, 1.5, 0.5, 0.5,
-3.367048, 3, -5.53666, 0, -0.5, 0.5, 0.5,
-3.367048, 3, -5.53666, 1, -0.5, 0.5, 0.5,
-3.367048, 3, -5.53666, 1, 1.5, 0.5, 0.5,
-3.367048, 3, -5.53666, 0, 1.5, 0.5, 0.5
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
-2.90238, -3.080037, -4,
-2.90238, -3.080037, 6,
-2.90238, -3.080037, -4,
-3.057269, -3.245929, -4,
-2.90238, -3.080037, -2,
-3.057269, -3.245929, -2,
-2.90238, -3.080037, 0,
-3.057269, -3.245929, 0,
-2.90238, -3.080037, 2,
-3.057269, -3.245929, 2,
-2.90238, -3.080037, 4,
-3.057269, -3.245929, 4,
-2.90238, -3.080037, 6,
-3.057269, -3.245929, 6
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
-3.367048, -3.577711, -4, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, -4, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, -4, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, -4, 0, 1.5, 0.5, 0.5,
-3.367048, -3.577711, -2, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, -2, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, -2, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, -2, 0, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 0, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 0, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 0, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 0, 0, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 2, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 2, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 2, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 2, 0, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 4, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 4, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 4, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 4, 0, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 6, 0, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 6, 1, -0.5, 0.5, 0.5,
-3.367048, -3.577711, 6, 1, 1.5, 0.5, 0.5,
-3.367048, -3.577711, 6, 0, 1.5, 0.5, 0.5
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
-2.90238, -3.080037, -4.710203,
-2.90238, 3.555616, -4.710203,
-2.90238, -3.080037, 6.309224,
-2.90238, 3.555616, 6.309224,
-2.90238, -3.080037, -4.710203,
-2.90238, -3.080037, 6.309224,
-2.90238, 3.555616, -4.710203,
-2.90238, 3.555616, 6.309224,
-2.90238, -3.080037, -4.710203,
3.293195, -3.080037, -4.710203,
-2.90238, -3.080037, 6.309224,
3.293195, -3.080037, 6.309224,
-2.90238, 3.555616, -4.710203,
3.293195, 3.555616, -4.710203,
-2.90238, 3.555616, 6.309224,
3.293195, 3.555616, 6.309224,
3.293195, -3.080037, -4.710203,
3.293195, 3.555616, -4.710203,
3.293195, -3.080037, 6.309224,
3.293195, 3.555616, 6.309224,
3.293195, -3.080037, -4.710203,
3.293195, -3.080037, 6.309224,
3.293195, 3.555616, -4.710203,
3.293195, 3.555616, 6.309224
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
var radius = 7.623867;
var distance = 33.91945;
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
mvMatrix.translate( -0.1954076, -0.2377894, -0.7995107 );
mvMatrix.scale( 1.330478, 1.24224, 0.7480493 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91945);
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
4-methylbenzenesulfo<-read.table("4-methylbenzenesulfo.xyz")
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
-2.812153, -0.3075341, -2.234174, 0, 0, 1, 1, 1,
-2.703413, 0.7197931, -1.824237, 1, 0, 0, 1, 1,
-2.588808, 0.9907537, -2.832749, 1, 0, 0, 1, 1,
-2.387179, -0.7828261, -2.246324, 1, 0, 0, 1, 1,
-2.329847, 0.3946636, -2.473287, 1, 0, 0, 1, 1,
-2.299934, 0.1696969, -1.872048, 1, 0, 0, 1, 1,
-2.293885, 0.3587002, 0.08269441, 0, 0, 0, 1, 1,
-2.276695, 0.9996942, -2.944869, 0, 0, 0, 1, 1,
-2.20858, -0.2338209, -1.682619, 0, 0, 0, 1, 1,
-2.17739, 0.04282872, -2.030938, 0, 0, 0, 1, 1,
-2.163984, 0.313717, -2.591844, 0, 0, 0, 1, 1,
-2.156076, 0.3323992, -3.873599, 0, 0, 0, 1, 1,
-2.153641, 0.7058363, -1.010704, 0, 0, 0, 1, 1,
-2.135593, 0.9150003, -1.554914, 1, 1, 1, 1, 1,
-2.130113, 0.7220331, -0.9409925, 1, 1, 1, 1, 1,
-2.102073, 0.234934, 1.035438, 1, 1, 1, 1, 1,
-2.039858, 0.2877658, -1.892157, 1, 1, 1, 1, 1,
-2.005969, -0.7532476, -2.043592, 1, 1, 1, 1, 1,
-2.00163, 0.8213659, -1.103329, 1, 1, 1, 1, 1,
-1.98922, 0.9759232, 1.463191, 1, 1, 1, 1, 1,
-1.962746, -0.8228719, -0.6683143, 1, 1, 1, 1, 1,
-1.956338, 2.20783, -1.665653, 1, 1, 1, 1, 1,
-1.942447, 0.06199788, -2.678925, 1, 1, 1, 1, 1,
-1.933539, -0.987628, -2.625049, 1, 1, 1, 1, 1,
-1.922373, 0.1545265, 0.1706138, 1, 1, 1, 1, 1,
-1.893927, -1.097593, -1.666602, 1, 1, 1, 1, 1,
-1.888699, -0.7827094, -1.569415, 1, 1, 1, 1, 1,
-1.869491, -0.01080892, -2.976796, 1, 1, 1, 1, 1,
-1.869269, -1.937642, -3.608549, 0, 0, 1, 1, 1,
-1.832476, 1.04521, -1.375727, 1, 0, 0, 1, 1,
-1.824798, 1.044717, -0.2299605, 1, 0, 0, 1, 1,
-1.82015, -1.008684, -1.985564, 1, 0, 0, 1, 1,
-1.811698, -0.6045008, -2.477198, 1, 0, 0, 1, 1,
-1.804118, -1.823315, -4.355843, 1, 0, 0, 1, 1,
-1.802867, -2.318597, -3.65511, 0, 0, 0, 1, 1,
-1.801907, -0.4969392, -2.291921, 0, 0, 0, 1, 1,
-1.759093, 0.1458097, -0.8198145, 0, 0, 0, 1, 1,
-1.708249, 0.05397868, -1.02203, 0, 0, 0, 1, 1,
-1.702492, 0.4374129, -0.8991023, 0, 0, 0, 1, 1,
-1.698232, 0.8042766, 0.1465283, 0, 0, 0, 1, 1,
-1.685639, 1.902554, -0.2850835, 0, 0, 0, 1, 1,
-1.666724, 0.9958614, -0.08401034, 1, 1, 1, 1, 1,
-1.645523, -0.5847627, 0.2977947, 1, 1, 1, 1, 1,
-1.624936, 0.8622504, -2.103419, 1, 1, 1, 1, 1,
-1.608603, 0.3254857, -1.13031, 1, 1, 1, 1, 1,
-1.602215, 0.4320379, -0.8955314, 1, 1, 1, 1, 1,
-1.591179, 0.7587178, -1.308331, 1, 1, 1, 1, 1,
-1.586354, -0.1678551, -2.192329, 1, 1, 1, 1, 1,
-1.578486, 0.9229278, -2.941367, 1, 1, 1, 1, 1,
-1.572326, -2.941293, -3.092237, 1, 1, 1, 1, 1,
-1.570212, 1.228271, -1.656311, 1, 1, 1, 1, 1,
-1.569761, 0.2687129, -3.022828, 1, 1, 1, 1, 1,
-1.567888, 0.8756998, -0.9986387, 1, 1, 1, 1, 1,
-1.563814, -0.129618, -2.560018, 1, 1, 1, 1, 1,
-1.55432, 1.044605, -0.4247963, 1, 1, 1, 1, 1,
-1.554304, -0.2082459, -1.129311, 1, 1, 1, 1, 1,
-1.552185, -0.7032792, -2.243024, 0, 0, 1, 1, 1,
-1.537084, -0.5130037, -2.330003, 1, 0, 0, 1, 1,
-1.518264, -0.342443, -1.312699, 1, 0, 0, 1, 1,
-1.5142, 0.7376555, -1.024591, 1, 0, 0, 1, 1,
-1.513254, 0.4159518, -3.250799, 1, 0, 0, 1, 1,
-1.493227, -0.6135684, -1.47519, 1, 0, 0, 1, 1,
-1.484906, -2.329567, -2.457976, 0, 0, 0, 1, 1,
-1.484364, -1.783577, -1.246588, 0, 0, 0, 1, 1,
-1.481672, -1.7665, -2.019001, 0, 0, 0, 1, 1,
-1.475256, 0.8827622, -0.4130104, 0, 0, 0, 1, 1,
-1.473207, 0.7518324, -1.076623, 0, 0, 0, 1, 1,
-1.472546, 0.3015945, -1.879196, 0, 0, 0, 1, 1,
-1.472382, -0.6251885, -2.669444, 0, 0, 0, 1, 1,
-1.467307, -0.02610555, -2.268404, 1, 1, 1, 1, 1,
-1.455434, 2.66261, -2.394173, 1, 1, 1, 1, 1,
-1.455368, -0.5962602, -2.730537, 1, 1, 1, 1, 1,
-1.451495, 0.5340003, -0.6416264, 1, 1, 1, 1, 1,
-1.435703, 0.2593109, -1.162862, 1, 1, 1, 1, 1,
-1.430533, -0.4560137, -2.539169, 1, 1, 1, 1, 1,
-1.429322, 0.9706333, -0.4231498, 1, 1, 1, 1, 1,
-1.427406, 0.7371171, -1.460864, 1, 1, 1, 1, 1,
-1.427378, -0.7779938, -1.933717, 1, 1, 1, 1, 1,
-1.426681, -0.9404718, -1.198407, 1, 1, 1, 1, 1,
-1.425194, 0.2343825, -2.028204, 1, 1, 1, 1, 1,
-1.408532, 1.32041, -1.752829, 1, 1, 1, 1, 1,
-1.408286, -1.456264, -2.048951, 1, 1, 1, 1, 1,
-1.406284, 0.7818495, -1.292756, 1, 1, 1, 1, 1,
-1.396917, -1.266352, -3.103004, 1, 1, 1, 1, 1,
-1.393514, -0.09624168, -0.8475575, 0, 0, 1, 1, 1,
-1.386455, -1.513567, -2.99127, 1, 0, 0, 1, 1,
-1.367785, -0.1616787, -1.456563, 1, 0, 0, 1, 1,
-1.366796, 0.6130761, -0.5600747, 1, 0, 0, 1, 1,
-1.352468, 0.5970717, -0.3177359, 1, 0, 0, 1, 1,
-1.345663, 0.8561124, -1.01795, 1, 0, 0, 1, 1,
-1.337119, -1.094234, -2.287601, 0, 0, 0, 1, 1,
-1.334411, 0.7251824, -1.560092, 0, 0, 0, 1, 1,
-1.332962, 1.271488, -1.409577, 0, 0, 0, 1, 1,
-1.33081, -0.1518425, -1.392811, 0, 0, 0, 1, 1,
-1.330147, 0.9510667, -3.871996, 0, 0, 0, 1, 1,
-1.324405, -1.223218, -0.8579347, 0, 0, 0, 1, 1,
-1.291818, -1.448269, -1.419674, 0, 0, 0, 1, 1,
-1.28939, 0.8262785, -2.292421, 1, 1, 1, 1, 1,
-1.288551, 2.059901, -1.000638, 1, 1, 1, 1, 1,
-1.277681, 1.39361, -1.215251, 1, 1, 1, 1, 1,
-1.267541, 1.05001, -1.951334, 1, 1, 1, 1, 1,
-1.263947, -0.9363684, -2.418028, 1, 1, 1, 1, 1,
-1.248632, -2.434799, -3.064848, 1, 1, 1, 1, 1,
-1.235865, -1.765591, -3.282192, 1, 1, 1, 1, 1,
-1.234616, 0.916181, -0.3611815, 1, 1, 1, 1, 1,
-1.232211, 0.2300966, -1.825487, 1, 1, 1, 1, 1,
-1.227872, 1.276611, -0.3586793, 1, 1, 1, 1, 1,
-1.223169, -0.9814677, -1.664869, 1, 1, 1, 1, 1,
-1.223125, 0.2706585, -2.430394, 1, 1, 1, 1, 1,
-1.22285, -0.7511961, -2.389927, 1, 1, 1, 1, 1,
-1.217753, 1.629476, -0.1814723, 1, 1, 1, 1, 1,
-1.212749, 0.1170343, -2.155355, 1, 1, 1, 1, 1,
-1.209754, -1.471666, -1.605934, 0, 0, 1, 1, 1,
-1.20343, -0.8678905, -3.163924, 1, 0, 0, 1, 1,
-1.184596, -0.3734136, -1.629091, 1, 0, 0, 1, 1,
-1.180547, 0.1366232, -2.703078, 1, 0, 0, 1, 1,
-1.179194, -1.135457, -1.705418, 1, 0, 0, 1, 1,
-1.17741, -1.019246, -1.83085, 1, 0, 0, 1, 1,
-1.174768, -0.304252, -2.579207, 0, 0, 0, 1, 1,
-1.174499, -1.124658, -1.845074, 0, 0, 0, 1, 1,
-1.17286, -1.557336, -2.333575, 0, 0, 0, 1, 1,
-1.171836, -0.9792988, -3.651829, 0, 0, 0, 1, 1,
-1.154046, 0.7293621, 0.1718263, 0, 0, 0, 1, 1,
-1.1518, 2.222098, -1.870463, 0, 0, 0, 1, 1,
-1.145033, 0.5272161, -1.484386, 0, 0, 0, 1, 1,
-1.142901, -1.38673, -1.339293, 1, 1, 1, 1, 1,
-1.1378, -0.8675803, -1.065102, 1, 1, 1, 1, 1,
-1.137763, 1.566199, 0.4302389, 1, 1, 1, 1, 1,
-1.134168, 0.8122528, 0.6777509, 1, 1, 1, 1, 1,
-1.132212, -0.6108776, -0.6280448, 1, 1, 1, 1, 1,
-1.129843, -0.6410417, -1.700242, 1, 1, 1, 1, 1,
-1.129437, -0.3479314, -2.04795, 1, 1, 1, 1, 1,
-1.124715, -0.6726227, -3.092535, 1, 1, 1, 1, 1,
-1.121364, -0.2551029, -1.20101, 1, 1, 1, 1, 1,
-1.121016, -1.591461, -2.48258, 1, 1, 1, 1, 1,
-1.116195, 0.8992053, -0.5280677, 1, 1, 1, 1, 1,
-1.109745, 0.3702492, -0.8149093, 1, 1, 1, 1, 1,
-1.102812, 0.0185049, -2.109257, 1, 1, 1, 1, 1,
-1.101339, -0.3575035, -1.857984, 1, 1, 1, 1, 1,
-1.093276, -1.100102, -1.494275, 1, 1, 1, 1, 1,
-1.086821, 0.4296423, -1.242379, 0, 0, 1, 1, 1,
-1.073729, -0.1026916, -1.787272, 1, 0, 0, 1, 1,
-1.072738, 0.6450608, -0.8811246, 1, 0, 0, 1, 1,
-1.072017, -0.2733244, -2.126282, 1, 0, 0, 1, 1,
-1.066953, -0.1188869, -1.876155, 1, 0, 0, 1, 1,
-1.059867, 1.113849, -1.561699, 1, 0, 0, 1, 1,
-1.055216, 0.3979102, -0.3491254, 0, 0, 0, 1, 1,
-1.053228, -0.9961653, -3.268634, 0, 0, 0, 1, 1,
-1.040456, -0.5981138, -0.6135074, 0, 0, 0, 1, 1,
-1.030422, 2.095732, -0.2774206, 0, 0, 0, 1, 1,
-1.026022, -0.4318003, -1.450736, 0, 0, 0, 1, 1,
-1.022756, -0.7570946, -1.171186, 0, 0, 0, 1, 1,
-1.022163, -0.5682906, -2.209375, 0, 0, 0, 1, 1,
-1.008533, 0.715611, -0.3567915, 1, 1, 1, 1, 1,
-1.006805, -1.186134, -2.84006, 1, 1, 1, 1, 1,
-1.003717, -0.6885127, -2.432021, 1, 1, 1, 1, 1,
-1.001579, 0.03490359, -0.5305758, 1, 1, 1, 1, 1,
-1.000243, -0.2121601, -2.104573, 1, 1, 1, 1, 1,
-1.000102, 0.93978, -0.9477872, 1, 1, 1, 1, 1,
-0.9965516, 0.01897571, -4.418573, 1, 1, 1, 1, 1,
-0.9957228, 0.9136689, -0.8775029, 1, 1, 1, 1, 1,
-0.9952363, 1.089088, -0.1558235, 1, 1, 1, 1, 1,
-0.9889373, -1.063379, -3.853767, 1, 1, 1, 1, 1,
-0.9869027, -0.7126798, -2.037032, 1, 1, 1, 1, 1,
-0.9861997, 0.214617, -0.9498808, 1, 1, 1, 1, 1,
-0.9847938, 0.5788801, -0.6520491, 1, 1, 1, 1, 1,
-0.9790664, 1.097116, -0.1617518, 1, 1, 1, 1, 1,
-0.9742354, -0.7111825, -2.982413, 1, 1, 1, 1, 1,
-0.9708511, -0.6875665, -2.89392, 0, 0, 1, 1, 1,
-0.96804, 0.1652722, -0.718703, 1, 0, 0, 1, 1,
-0.9626684, 0.3024325, -1.229299, 1, 0, 0, 1, 1,
-0.9565332, -0.3059095, -1.655784, 1, 0, 0, 1, 1,
-0.9536706, -2.44344, -3.114767, 1, 0, 0, 1, 1,
-0.9489433, 0.6946417, 0.1578085, 1, 0, 0, 1, 1,
-0.9478476, 0.3181013, -2.34075, 0, 0, 0, 1, 1,
-0.9368976, -1.99358, -3.779904, 0, 0, 0, 1, 1,
-0.9330472, 0.364861, -1.817286, 0, 0, 0, 1, 1,
-0.9308112, -0.1079177, -3.865915, 0, 0, 0, 1, 1,
-0.9227272, -1.022689, -1.788318, 0, 0, 0, 1, 1,
-0.922212, -1.75976, -3.604232, 0, 0, 0, 1, 1,
-0.9179153, -0.498705, -2.228791, 0, 0, 0, 1, 1,
-0.9106013, -2.353283, -3.088423, 1, 1, 1, 1, 1,
-0.9079564, -0.2111159, -1.103419, 1, 1, 1, 1, 1,
-0.9071923, 1.587056, 0.3060478, 1, 1, 1, 1, 1,
-0.9068705, -2.249479, -2.474232, 1, 1, 1, 1, 1,
-0.8945961, -1.234271, -2.907406, 1, 1, 1, 1, 1,
-0.8892419, -0.2838069, -2.750144, 1, 1, 1, 1, 1,
-0.8866305, -0.03207153, -2.109561, 1, 1, 1, 1, 1,
-0.885478, 1.205778, -0.9755867, 1, 1, 1, 1, 1,
-0.8803086, 1.137266, -0.8980196, 1, 1, 1, 1, 1,
-0.877599, -0.6290473, -2.790515, 1, 1, 1, 1, 1,
-0.8762181, -0.4525995, -2.233293, 1, 1, 1, 1, 1,
-0.8740289, 1.707664, 0.2445208, 1, 1, 1, 1, 1,
-0.8726369, 1.324899, 2.032109, 1, 1, 1, 1, 1,
-0.8708921, -1.902072, -2.507887, 1, 1, 1, 1, 1,
-0.8676375, 0.03231937, -1.182859, 1, 1, 1, 1, 1,
-0.8641546, 0.1807017, -3.148731, 0, 0, 1, 1, 1,
-0.861865, 0.3875967, -1.608009, 1, 0, 0, 1, 1,
-0.8607081, -1.079932, -1.586838, 1, 0, 0, 1, 1,
-0.8568107, -0.4096357, -1.927356, 1, 0, 0, 1, 1,
-0.8539019, -0.2002394, -1.322113, 1, 0, 0, 1, 1,
-0.8482404, -1.016956, -1.712152, 1, 0, 0, 1, 1,
-0.845323, 0.05496421, -0.1005935, 0, 0, 0, 1, 1,
-0.8315452, 1.434394, 0.3269905, 0, 0, 0, 1, 1,
-0.8273974, 1.101715, 1.553831, 0, 0, 0, 1, 1,
-0.8250934, 1.301422, 1.637402, 0, 0, 0, 1, 1,
-0.7865974, 0.6675828, -0.2767297, 0, 0, 0, 1, 1,
-0.7857594, 0.1149172, -1.903431, 0, 0, 0, 1, 1,
-0.7820549, -0.7596694, -2.817353, 0, 0, 0, 1, 1,
-0.7786272, 0.4526561, -1.587894, 1, 1, 1, 1, 1,
-0.7737677, -0.1243021, -1.372146, 1, 1, 1, 1, 1,
-0.7657041, 2.686411, -0.1374215, 1, 1, 1, 1, 1,
-0.7598511, 1.475839, -1.008432, 1, 1, 1, 1, 1,
-0.7554246, -0.5971618, -2.382431, 1, 1, 1, 1, 1,
-0.7509485, -0.4920759, -3.098074, 1, 1, 1, 1, 1,
-0.7501508, 1.648165, -2.20939, 1, 1, 1, 1, 1,
-0.7464893, -0.392403, -2.642196, 1, 1, 1, 1, 1,
-0.7420506, 0.1310905, -1.335902, 1, 1, 1, 1, 1,
-0.7419102, 1.350713, 0.592882, 1, 1, 1, 1, 1,
-0.7362427, -0.6947693, -2.680297, 1, 1, 1, 1, 1,
-0.7342678, -0.2873918, -2.867229, 1, 1, 1, 1, 1,
-0.7339826, 1.437885, 1.075463, 1, 1, 1, 1, 1,
-0.7299956, -0.5120525, -3.388159, 1, 1, 1, 1, 1,
-0.7284168, 0.7775165, -1.877388, 1, 1, 1, 1, 1,
-0.7260951, -0.2471653, -1.107035, 0, 0, 1, 1, 1,
-0.7255216, 0.9622536, -0.1846757, 1, 0, 0, 1, 1,
-0.7240521, 0.8408281, 0.809294, 1, 0, 0, 1, 1,
-0.7205325, 0.04612357, -0.5777085, 1, 0, 0, 1, 1,
-0.7204509, 1.221885, -2.118614, 1, 0, 0, 1, 1,
-0.7201264, -1.81112, -1.518796, 1, 0, 0, 1, 1,
-0.7138553, -1.998801, -1.525591, 0, 0, 0, 1, 1,
-0.7106971, 0.7674729, -1.854615, 0, 0, 0, 1, 1,
-0.7099822, 1.743101, -1.19492, 0, 0, 0, 1, 1,
-0.7087123, 1.39805, -0.3643277, 0, 0, 0, 1, 1,
-0.707895, -1.150812, -2.397331, 0, 0, 0, 1, 1,
-0.7069238, 0.1521489, -0.9312981, 0, 0, 0, 1, 1,
-0.7053129, -0.3585403, -1.113949, 0, 0, 0, 1, 1,
-0.6959274, -0.3133686, -2.53685, 1, 1, 1, 1, 1,
-0.6950189, -0.6607094, -0.3309686, 1, 1, 1, 1, 1,
-0.694954, 1.762663, -0.1499285, 1, 1, 1, 1, 1,
-0.6924525, 1.485166, 0.5133833, 1, 1, 1, 1, 1,
-0.6916077, -2.800735, -3.603645, 1, 1, 1, 1, 1,
-0.6909585, 0.6771302, -1.394804, 1, 1, 1, 1, 1,
-0.6897396, -0.06635148, -3.665404, 1, 1, 1, 1, 1,
-0.6893106, -2.001189, -2.254264, 1, 1, 1, 1, 1,
-0.6866762, -0.6878429, -2.41085, 1, 1, 1, 1, 1,
-0.6818515, -0.2991354, -2.977419, 1, 1, 1, 1, 1,
-0.676636, 0.3834388, -2.425067, 1, 1, 1, 1, 1,
-0.6752157, -1.253617, -2.305703, 1, 1, 1, 1, 1,
-0.6742407, 0.2419007, -0.03686611, 1, 1, 1, 1, 1,
-0.6688545, 0.3953257, -1.602028, 1, 1, 1, 1, 1,
-0.6677942, 0.00621063, -2.296306, 1, 1, 1, 1, 1,
-0.6673548, 0.2202153, -1.325204, 0, 0, 1, 1, 1,
-0.6614106, 1.312208, 0.3389503, 1, 0, 0, 1, 1,
-0.6504083, -0.4885967, -1.509142, 1, 0, 0, 1, 1,
-0.6469452, -1.501787, -3.210218, 1, 0, 0, 1, 1,
-0.6405434, -0.2099242, -1.815827, 1, 0, 0, 1, 1,
-0.6375819, 0.3810377, -1.726188, 1, 0, 0, 1, 1,
-0.6366465, 0.7587944, -0.416459, 0, 0, 0, 1, 1,
-0.6326074, -0.4299957, -2.012041, 0, 0, 0, 1, 1,
-0.6291279, -0.3005597, -1.99682, 0, 0, 0, 1, 1,
-0.6239683, 1.224207, -1.638237, 0, 0, 0, 1, 1,
-0.6228979, -0.02510807, -2.118452, 0, 0, 0, 1, 1,
-0.6225705, 0.9121512, -0.08019206, 0, 0, 0, 1, 1,
-0.6207299, 1.307007, 0.3296528, 0, 0, 0, 1, 1,
-0.6204802, 0.8028902, -1.470261, 1, 1, 1, 1, 1,
-0.6186264, -0.1674599, -0.3154241, 1, 1, 1, 1, 1,
-0.6172187, 2.669491, -0.2511609, 1, 1, 1, 1, 1,
-0.6169901, 1.325469, -0.3342471, 1, 1, 1, 1, 1,
-0.5990646, -1.330653, -3.056126, 1, 1, 1, 1, 1,
-0.5944309, 1.088737, -1.26983, 1, 1, 1, 1, 1,
-0.5940028, -0.8379692, -1.570809, 1, 1, 1, 1, 1,
-0.5939193, -2.663754, -4.205145, 1, 1, 1, 1, 1,
-0.5905671, -0.06840604, -1.734608, 1, 1, 1, 1, 1,
-0.5823522, 0.9516987, 0.1145481, 1, 1, 1, 1, 1,
-0.5756829, 1.820866, -0.4522597, 1, 1, 1, 1, 1,
-0.5709487, -0.4483509, -3.295091, 1, 1, 1, 1, 1,
-0.5669264, -0.4234509, -1.350628, 1, 1, 1, 1, 1,
-0.5615494, -0.1493518, -1.306608, 1, 1, 1, 1, 1,
-0.560736, 0.1515822, -0.8249927, 1, 1, 1, 1, 1,
-0.5577208, 1.56714, -0.8448566, 0, 0, 1, 1, 1,
-0.5529599, 1.6463, -0.419093, 1, 0, 0, 1, 1,
-0.55058, 0.9443365, -0.253924, 1, 0, 0, 1, 1,
-0.5500301, -0.2005166, -0.9358474, 1, 0, 0, 1, 1,
-0.5491714, -1.242803, -3.716424, 1, 0, 0, 1, 1,
-0.5490007, -1.311794, -2.999854, 1, 0, 0, 1, 1,
-0.5401996, 0.3826937, -1.18337, 0, 0, 0, 1, 1,
-0.5361564, -0.9005377, -2.304247, 0, 0, 0, 1, 1,
-0.5332019, -0.7523815, -2.895648, 0, 0, 0, 1, 1,
-0.5264086, 0.8021043, 0.07860787, 0, 0, 0, 1, 1,
-0.5260186, -0.7594157, -2.86884, 0, 0, 0, 1, 1,
-0.5213811, 0.8358691, 1.035291, 0, 0, 0, 1, 1,
-0.5211495, -0.7935541, -0.2891609, 0, 0, 0, 1, 1,
-0.5145593, -0.6682687, -2.632904, 1, 1, 1, 1, 1,
-0.5103754, 0.05939253, -1.971279, 1, 1, 1, 1, 1,
-0.5074179, 0.4878312, -1.402632, 1, 1, 1, 1, 1,
-0.5005681, 1.71808, -1.2323, 1, 1, 1, 1, 1,
-0.4972534, -2.555879, -3.907029, 1, 1, 1, 1, 1,
-0.4923838, 0.2294461, -2.067196, 1, 1, 1, 1, 1,
-0.4905718, 0.7328365, -2.689834, 1, 1, 1, 1, 1,
-0.487945, 0.4644582, 0.4034616, 1, 1, 1, 1, 1,
-0.4830638, -0.6401699, -2.24667, 1, 1, 1, 1, 1,
-0.4805422, -1.662785, -1.566708, 1, 1, 1, 1, 1,
-0.4782533, 0.7753327, 0.8803915, 1, 1, 1, 1, 1,
-0.4702639, 1.250935, 0.1817082, 1, 1, 1, 1, 1,
-0.46723, 1.070237, -2.469115, 1, 1, 1, 1, 1,
-0.4665664, 0.5849364, 0.2653279, 1, 1, 1, 1, 1,
-0.4662575, -0.9612122, -3.576757, 1, 1, 1, 1, 1,
-0.4518775, 0.3526264, -1.481126, 0, 0, 1, 1, 1,
-0.4499928, 0.6219852, 0.5954965, 1, 0, 0, 1, 1,
-0.4456022, -1.290566, -3.983952, 1, 0, 0, 1, 1,
-0.4432882, 0.8803552, -0.2032741, 1, 0, 0, 1, 1,
-0.44163, -2.367694, -3.066572, 1, 0, 0, 1, 1,
-0.4402561, 1.171788, -0.8224858, 1, 0, 0, 1, 1,
-0.4299143, 0.1732813, -0.1929089, 0, 0, 0, 1, 1,
-0.4294423, -0.3347409, -0.9418659, 0, 0, 0, 1, 1,
-0.4288952, 0.8783855, 1.364308, 0, 0, 0, 1, 1,
-0.4263845, -0.1550973, -1.109576, 0, 0, 0, 1, 1,
-0.4225706, -1.006057, -3.711323, 0, 0, 0, 1, 1,
-0.4211183, 0.6914014, -1.533615, 0, 0, 0, 1, 1,
-0.4204151, -0.2527241, -2.190567, 0, 0, 0, 1, 1,
-0.4199413, -0.6693459, -3.919801, 1, 1, 1, 1, 1,
-0.4156618, 0.4273367, -1.227355, 1, 1, 1, 1, 1,
-0.4152512, 1.442421, -2.141681, 1, 1, 1, 1, 1,
-0.4145366, 0.7388045, 0.2876495, 1, 1, 1, 1, 1,
-0.410027, 0.2012355, -0.8891128, 1, 1, 1, 1, 1,
-0.4099909, 1.177194, -0.21895, 1, 1, 1, 1, 1,
-0.4075356, 0.212337, -0.2313598, 1, 1, 1, 1, 1,
-0.4069287, 0.1329569, 0.2868195, 1, 1, 1, 1, 1,
-0.4011404, -1.114672, -2.917484, 1, 1, 1, 1, 1,
-0.3930019, -1.542182, -4.477586, 1, 1, 1, 1, 1,
-0.3921067, -0.5675936, -2.221543, 1, 1, 1, 1, 1,
-0.3909811, -0.4658612, -4.214049, 1, 1, 1, 1, 1,
-0.3904118, -0.5862252, -2.509756, 1, 1, 1, 1, 1,
-0.3840519, 0.09413842, -0.4610129, 1, 1, 1, 1, 1,
-0.3817046, 0.9260011, -0.750304, 1, 1, 1, 1, 1,
-0.3802553, -1.039875, -2.669403, 0, 0, 1, 1, 1,
-0.376757, -2.089209, -2.014309, 1, 0, 0, 1, 1,
-0.3738861, 0.05294494, -1.111794, 1, 0, 0, 1, 1,
-0.3726377, 0.6509586, 0.901376, 1, 0, 0, 1, 1,
-0.3723407, -0.07421419, -1.40474, 1, 0, 0, 1, 1,
-0.3685569, -0.6075188, -2.774139, 1, 0, 0, 1, 1,
-0.3675228, -1.016448, -1.854384, 0, 0, 0, 1, 1,
-0.3670983, -0.4917628, -2.878404, 0, 0, 0, 1, 1,
-0.36676, 0.8229716, -0.5149127, 0, 0, 0, 1, 1,
-0.3667368, 0.7862101, -1.629125, 0, 0, 0, 1, 1,
-0.3654107, -0.233452, -1.950488, 0, 0, 0, 1, 1,
-0.3613717, 1.103177, 1.454092, 0, 0, 0, 1, 1,
-0.3593583, 2.550625, 1.245834, 0, 0, 0, 1, 1,
-0.3534935, -0.08355948, -1.812244, 1, 1, 1, 1, 1,
-0.3509402, 0.7391085, -1.187419, 1, 1, 1, 1, 1,
-0.3504811, -1.872649, -3.751248, 1, 1, 1, 1, 1,
-0.3370402, 0.1706173, -0.5223312, 1, 1, 1, 1, 1,
-0.334559, 1.652208, -0.06125282, 1, 1, 1, 1, 1,
-0.3338932, -0.5310434, -2.100598, 1, 1, 1, 1, 1,
-0.3336196, -0.8555705, -2.124242, 1, 1, 1, 1, 1,
-0.3309903, -0.2613986, -3.134901, 1, 1, 1, 1, 1,
-0.3294787, -0.5350859, -2.026793, 1, 1, 1, 1, 1,
-0.3253235, -1.054283, -1.913755, 1, 1, 1, 1, 1,
-0.3229769, -0.1205594, -2.302046, 1, 1, 1, 1, 1,
-0.3204026, -1.623896, -2.507525, 1, 1, 1, 1, 1,
-0.3203681, -1.019466, -3.837221, 1, 1, 1, 1, 1,
-0.3179744, 0.3030677, -1.654536, 1, 1, 1, 1, 1,
-0.3146057, 0.6497274, -1.076542, 1, 1, 1, 1, 1,
-0.3116485, 1.491488, -0.617372, 0, 0, 1, 1, 1,
-0.3106229, 1.883948, 0.2119458, 1, 0, 0, 1, 1,
-0.3070484, -0.04229798, -2.269276, 1, 0, 0, 1, 1,
-0.3066161, -0.26104, -1.582209, 1, 0, 0, 1, 1,
-0.3049805, -0.07385576, -2.99826, 1, 0, 0, 1, 1,
-0.2979752, 0.6794251, -0.4620555, 1, 0, 0, 1, 1,
-0.296873, 0.1451569, -0.386147, 0, 0, 0, 1, 1,
-0.2960547, -1.481604, -2.944633, 0, 0, 0, 1, 1,
-0.295151, -1.113192, -3.218341, 0, 0, 0, 1, 1,
-0.2927366, 0.8163655, -0.6219859, 0, 0, 0, 1, 1,
-0.2851545, 0.7124854, -0.8234604, 0, 0, 0, 1, 1,
-0.2841403, 0.784655, -1.103815, 0, 0, 0, 1, 1,
-0.2799802, 0.5033183, 0.001719629, 0, 0, 0, 1, 1,
-0.279588, 0.3037561, -0.7638082, 1, 1, 1, 1, 1,
-0.2772105, -1.928929, -0.2269357, 1, 1, 1, 1, 1,
-0.2756607, -1.724091, -2.553142, 1, 1, 1, 1, 1,
-0.2693043, -0.8835444, -3.414377, 1, 1, 1, 1, 1,
-0.2605606, -0.901409, -1.747072, 1, 1, 1, 1, 1,
-0.2576032, 0.9824153, 0.8056226, 1, 1, 1, 1, 1,
-0.2502853, -0.3048092, -1.680339, 1, 1, 1, 1, 1,
-0.2486779, -1.268434, -3.171016, 1, 1, 1, 1, 1,
-0.248132, -0.740346, -2.669755, 1, 1, 1, 1, 1,
-0.2475637, 0.3415106, -0.1817213, 1, 1, 1, 1, 1,
-0.2420028, -0.6187797, -3.510636, 1, 1, 1, 1, 1,
-0.2358193, -0.6977155, -1.550729, 1, 1, 1, 1, 1,
-0.2351798, 0.07607029, -1.385284, 1, 1, 1, 1, 1,
-0.2339745, -0.4260521, -2.48187, 1, 1, 1, 1, 1,
-0.2280058, 0.3044291, 0.4262859, 1, 1, 1, 1, 1,
-0.2269026, 0.3923431, -0.9259058, 0, 0, 1, 1, 1,
-0.226707, -0.8802225, -3.014192, 1, 0, 0, 1, 1,
-0.2265563, 1.271888, -0.3677587, 1, 0, 0, 1, 1,
-0.2253718, 0.1612155, -1.007029, 1, 0, 0, 1, 1,
-0.2250696, 1.314891, -0.4412704, 1, 0, 0, 1, 1,
-0.2232187, -0.5070695, -1.89176, 1, 0, 0, 1, 1,
-0.2214328, -1.85132, -1.239909, 0, 0, 0, 1, 1,
-0.2206202, 0.4531189, -2.045689, 0, 0, 0, 1, 1,
-0.2197491, 1.51147, 1.191696, 0, 0, 0, 1, 1,
-0.2150032, -2.069186, -2.168629, 0, 0, 0, 1, 1,
-0.2085784, -0.7492065, -2.974031, 0, 0, 0, 1, 1,
-0.2048196, -0.7402259, -2.058337, 0, 0, 0, 1, 1,
-0.2010915, -0.3651609, -1.788216, 0, 0, 0, 1, 1,
-0.1964222, 0.5246998, -0.1346435, 1, 1, 1, 1, 1,
-0.1951922, 0.5053654, -1.153089, 1, 1, 1, 1, 1,
-0.1895963, 0.2426084, -1.293599, 1, 1, 1, 1, 1,
-0.1863776, 0.3232722, -1.242411, 1, 1, 1, 1, 1,
-0.1773071, 1.9977, 0.1996418, 1, 1, 1, 1, 1,
-0.1761847, -0.3613038, -2.057301, 1, 1, 1, 1, 1,
-0.1751671, -1.318835, -2.856238, 1, 1, 1, 1, 1,
-0.1724411, -0.9586064, -2.91365, 1, 1, 1, 1, 1,
-0.1665941, 1.498577, -0.07624035, 1, 1, 1, 1, 1,
-0.1636357, -0.9105461, -4.32735, 1, 1, 1, 1, 1,
-0.162284, 0.6744374, -0.2867713, 1, 1, 1, 1, 1,
-0.1594147, 0.4000509, -1.947843, 1, 1, 1, 1, 1,
-0.1578807, -1.588735, -4.176617, 1, 1, 1, 1, 1,
-0.1567961, 0.4096657, 0.1019652, 1, 1, 1, 1, 1,
-0.1470589, 0.5513654, 1.030426, 1, 1, 1, 1, 1,
-0.1466643, 0.6172871, -1.966421, 0, 0, 1, 1, 1,
-0.1457866, 0.2368313, 0.7805567, 1, 0, 0, 1, 1,
-0.1424305, -0.08016652, -0.09976586, 1, 0, 0, 1, 1,
-0.141376, 0.1345577, -1.609514, 1, 0, 0, 1, 1,
-0.1401668, -0.7727766, -1.689802, 1, 0, 0, 1, 1,
-0.1397096, 2.014936, 0.2705505, 1, 0, 0, 1, 1,
-0.139377, -1.043617, -2.172007, 0, 0, 0, 1, 1,
-0.1307334, 0.1255389, -0.8629814, 0, 0, 0, 1, 1,
-0.1268165, -1.008216, -2.85022, 0, 0, 0, 1, 1,
-0.1263973, -0.5364411, -3.389762, 0, 0, 0, 1, 1,
-0.1260663, 1.556307, -0.4062024, 0, 0, 0, 1, 1,
-0.1260067, -2.238625, -3.703479, 0, 0, 0, 1, 1,
-0.1256765, 0.862062, -2.399008, 0, 0, 0, 1, 1,
-0.1256548, -0.09207258, -3.719019, 1, 1, 1, 1, 1,
-0.125166, -0.9140596, -2.626915, 1, 1, 1, 1, 1,
-0.1248351, -1.901701, -1.300511, 1, 1, 1, 1, 1,
-0.1246848, 0.7693411, -0.4647866, 1, 1, 1, 1, 1,
-0.1216953, 0.9799405, -0.2326784, 1, 1, 1, 1, 1,
-0.1166081, -0.3741893, -2.914511, 1, 1, 1, 1, 1,
-0.1131565, -0.7931861, -4.549726, 1, 1, 1, 1, 1,
-0.1123842, 0.1141839, -0.4692978, 1, 1, 1, 1, 1,
-0.1078298, 0.3237896, -1.411165, 1, 1, 1, 1, 1,
-0.1000945, -0.2668837, -3.007617, 1, 1, 1, 1, 1,
-0.09983601, 0.7738974, -0.4915467, 1, 1, 1, 1, 1,
-0.09657469, 1.215714, 1.081497, 1, 1, 1, 1, 1,
-0.0959738, -0.3294584, -4.10514, 1, 1, 1, 1, 1,
-0.09493283, 0.1694693, -2.231253, 1, 1, 1, 1, 1,
-0.09461585, 1.745276, -1.34288, 1, 1, 1, 1, 1,
-0.0941505, 0.3829342, 0.8250353, 0, 0, 1, 1, 1,
-0.09306183, -1.937823, -3.164187, 1, 0, 0, 1, 1,
-0.09011635, -1.255678, -1.401185, 1, 0, 0, 1, 1,
-0.0887828, -0.2402353, -1.502798, 1, 0, 0, 1, 1,
-0.07994767, 0.167791, -0.07757498, 1, 0, 0, 1, 1,
-0.07783046, -2.625108, -1.666726, 1, 0, 0, 1, 1,
-0.07756791, -1.293704, -3.88915, 0, 0, 0, 1, 1,
-0.07318718, -0.8630458, -3.016221, 0, 0, 0, 1, 1,
-0.07288557, 0.5261947, 0.6976293, 0, 0, 0, 1, 1,
-0.07233346, -1.712533, -4.156522, 0, 0, 0, 1, 1,
-0.07204939, 0.9448587, -1.524184, 0, 0, 0, 1, 1,
-0.07182669, 1.100983, 0.08258962, 0, 0, 0, 1, 1,
-0.06937127, 0.2737067, -1.213978, 0, 0, 0, 1, 1,
-0.06905793, 1.104729, 0.5556012, 1, 1, 1, 1, 1,
-0.06902537, 1.60686, 1.774921, 1, 1, 1, 1, 1,
-0.06470449, 0.3039491, -0.8866472, 1, 1, 1, 1, 1,
-0.058534, -0.3414942, -3.109401, 1, 1, 1, 1, 1,
-0.05729415, 0.9155703, -1.068848, 1, 1, 1, 1, 1,
-0.05558508, 0.2661601, -0.3484393, 1, 1, 1, 1, 1,
-0.05547554, 1.085137, -0.8380679, 1, 1, 1, 1, 1,
-0.05405254, 1.223278, -0.460055, 1, 1, 1, 1, 1,
-0.0520065, 0.466333, 0.7175491, 1, 1, 1, 1, 1,
-0.05139416, 0.5787811, -0.09047479, 1, 1, 1, 1, 1,
-0.05123769, 0.0155072, -0.9878991, 1, 1, 1, 1, 1,
-0.04778432, -2.300766, -3.228805, 1, 1, 1, 1, 1,
-0.04509792, 0.7580453, -0.1846361, 1, 1, 1, 1, 1,
-0.04457022, -0.9121827, -2.891973, 1, 1, 1, 1, 1,
-0.03609261, 0.1498181, -0.435446, 1, 1, 1, 1, 1,
-0.03329355, -0.5556848, -0.04703232, 0, 0, 1, 1, 1,
-0.0286966, -0.7516578, -3.953647, 1, 0, 0, 1, 1,
-0.02854336, -1.103082, -3.207822, 1, 0, 0, 1, 1,
-0.02449616, -1.342208, -3.359897, 1, 0, 0, 1, 1,
-0.02319321, 0.9700338, 0.9097859, 1, 0, 0, 1, 1,
-0.02307889, -1.52711, -4.442289, 1, 0, 0, 1, 1,
-0.02021102, 0.5941412, 1.514985, 0, 0, 0, 1, 1,
-0.01698069, -1.651759, -3.248238, 0, 0, 0, 1, 1,
-0.009956519, -0.1495453, -2.309249, 0, 0, 0, 1, 1,
-0.004481915, 0.6924077, -0.3684657, 0, 0, 0, 1, 1,
-0.002137741, -1.543597, -2.543937, 0, 0, 0, 1, 1,
0.0002720205, -0.4462679, 4.451176, 0, 0, 0, 1, 1,
0.0003197545, 1.151907, 0.5369024, 0, 0, 0, 1, 1,
0.005242943, -1.373797, 3.526001, 1, 1, 1, 1, 1,
0.007888719, 0.6367026, -1.474371, 1, 1, 1, 1, 1,
0.008003785, -1.599937, 3.702072, 1, 1, 1, 1, 1,
0.008219656, 1.169447, 0.4583508, 1, 1, 1, 1, 1,
0.01075699, -0.438109, 2.946146, 1, 1, 1, 1, 1,
0.01282567, -1.243378, 3.231265, 1, 1, 1, 1, 1,
0.01530754, -1.427726, 3.197481, 1, 1, 1, 1, 1,
0.01537189, 0.3746768, -0.1836932, 1, 1, 1, 1, 1,
0.01640607, 1.553375, 0.4490773, 1, 1, 1, 1, 1,
0.01840823, 1.333176, 0.5153201, 1, 1, 1, 1, 1,
0.02659079, 0.3494129, 0.05320252, 1, 1, 1, 1, 1,
0.03242796, 2.085607, -1.861702, 1, 1, 1, 1, 1,
0.03377412, 1.76103, 0.9659582, 1, 1, 1, 1, 1,
0.03861485, 0.7812434, 0.4591801, 1, 1, 1, 1, 1,
0.04527709, 0.4807149, -1.124864, 1, 1, 1, 1, 1,
0.04726915, 1.441615, 0.152337, 0, 0, 1, 1, 1,
0.04966563, -0.5582549, 4.050378, 1, 0, 0, 1, 1,
0.05294725, -1.45423, 3.231146, 1, 0, 0, 1, 1,
0.05922586, 0.4611772, 0.2937018, 1, 0, 0, 1, 1,
0.06039426, 1.234197, -1.479215, 1, 0, 0, 1, 1,
0.06082578, -0.5142526, 3.342513, 1, 0, 0, 1, 1,
0.06236171, -1.577873, 3.652609, 0, 0, 0, 1, 1,
0.06875799, 0.4261974, 0.6085864, 0, 0, 0, 1, 1,
0.07255374, -0.8513361, 2.13788, 0, 0, 0, 1, 1,
0.07279544, -0.7733511, 3.945627, 0, 0, 0, 1, 1,
0.07371759, -0.157328, 3.212557, 0, 0, 0, 1, 1,
0.0740774, 0.2220435, 2.301368, 0, 0, 0, 1, 1,
0.07612465, 0.6070041, -0.08924778, 0, 0, 0, 1, 1,
0.07625531, -0.7097591, 1.880612, 1, 1, 1, 1, 1,
0.08229883, 0.09525581, -0.1310973, 1, 1, 1, 1, 1,
0.08347874, 0.9385301, 1.445373, 1, 1, 1, 1, 1,
0.08357945, 0.4662725, -1.550098, 1, 1, 1, 1, 1,
0.0876446, -0.7668027, 4.169569, 1, 1, 1, 1, 1,
0.08823542, -1.223071, 3.167696, 1, 1, 1, 1, 1,
0.08890658, 2.252224, 0.6143355, 1, 1, 1, 1, 1,
0.09049173, 0.1661097, -0.2007993, 1, 1, 1, 1, 1,
0.09335129, -0.08399262, 2.555013, 1, 1, 1, 1, 1,
0.09830234, 0.7595127, 0.5063584, 1, 1, 1, 1, 1,
0.09874608, 0.5650918, 1.056621, 1, 1, 1, 1, 1,
0.1002742, 0.3333269, 0.3872642, 1, 1, 1, 1, 1,
0.1004052, 1.941826, -2.341431, 1, 1, 1, 1, 1,
0.1055512, -1.785045, 1.781634, 1, 1, 1, 1, 1,
0.1096487, -0.6076867, 1.205149, 1, 1, 1, 1, 1,
0.113196, -0.9248119, 3.213195, 0, 0, 1, 1, 1,
0.1145782, 0.130638, 1.924242, 1, 0, 0, 1, 1,
0.115013, 1.036875, -1.267012, 1, 0, 0, 1, 1,
0.1173503, -1.318942, 3.44871, 1, 0, 0, 1, 1,
0.1208937, -0.6766068, 2.18031, 1, 0, 0, 1, 1,
0.1219917, 1.607753, 1.479387, 1, 0, 0, 1, 1,
0.1220653, 0.5549129, -0.2089271, 0, 0, 0, 1, 1,
0.1234224, 0.5002266, -0.4881243, 0, 0, 0, 1, 1,
0.1248235, 0.1907431, 0.9674331, 0, 0, 0, 1, 1,
0.1251218, 0.8374716, -1.360831, 0, 0, 0, 1, 1,
0.1273475, 1.027968, -1.348428, 0, 0, 0, 1, 1,
0.1288764, -0.1513231, 1.583382, 0, 0, 0, 1, 1,
0.1353143, 1.02759, 1.632669, 0, 0, 0, 1, 1,
0.1418278, -0.3855686, 0.9758201, 1, 1, 1, 1, 1,
0.142274, -0.20572, 3.185402, 1, 1, 1, 1, 1,
0.1469383, -0.2557013, 2.162795, 1, 1, 1, 1, 1,
0.1573934, -1.731041, 4.105573, 1, 1, 1, 1, 1,
0.1595054, 0.6269376, 0.3530543, 1, 1, 1, 1, 1,
0.1622573, 0.7496451, 0.1823386, 1, 1, 1, 1, 1,
0.1643196, 0.6205361, 1.308649, 1, 1, 1, 1, 1,
0.164529, -1.635937, 0.367914, 1, 1, 1, 1, 1,
0.1669719, 0.3198447, 2.231802, 1, 1, 1, 1, 1,
0.167737, -0.05242823, 2.499059, 1, 1, 1, 1, 1,
0.1686685, 1.268338, -0.4225426, 1, 1, 1, 1, 1,
0.1691541, 0.1345508, 2.25017, 1, 1, 1, 1, 1,
0.1769554, 1.264261, 2.053334, 1, 1, 1, 1, 1,
0.1784995, 0.5080991, -0.1757013, 1, 1, 1, 1, 1,
0.178996, -0.4099594, 3.926573, 1, 1, 1, 1, 1,
0.1848319, 1.077513, 0.436542, 0, 0, 1, 1, 1,
0.1878107, 0.4197834, 0.7403166, 1, 0, 0, 1, 1,
0.1888519, 0.3745812, -0.04439541, 1, 0, 0, 1, 1,
0.198163, 0.7569218, 1.70275, 1, 0, 0, 1, 1,
0.1990669, -1.668009, 3.661219, 1, 0, 0, 1, 1,
0.2053202, 0.9796983, -0.1524162, 1, 0, 0, 1, 1,
0.205438, 0.1256606, 1.866283, 0, 0, 0, 1, 1,
0.2073727, 0.1649432, 0.8714664, 0, 0, 0, 1, 1,
0.2090304, -0.3979721, 2.07495, 0, 0, 0, 1, 1,
0.2099373, 0.2956271, 0.9191248, 0, 0, 0, 1, 1,
0.2134673, -1.026336, 2.484501, 0, 0, 0, 1, 1,
0.2176595, -0.4828878, 2.161888, 0, 0, 0, 1, 1,
0.2176752, 0.8573098, -0.01600139, 0, 0, 0, 1, 1,
0.2182756, -0.5987111, 2.773376, 1, 1, 1, 1, 1,
0.2188152, -0.1666693, 1.50615, 1, 1, 1, 1, 1,
0.2189866, -0.470755, 3.278812, 1, 1, 1, 1, 1,
0.2207744, 0.5557845, 0.711679, 1, 1, 1, 1, 1,
0.2211263, 1.117392, -0.5849327, 1, 1, 1, 1, 1,
0.2227488, -0.7457129, 2.774133, 1, 1, 1, 1, 1,
0.2233974, -0.2141809, 3.147292, 1, 1, 1, 1, 1,
0.2300268, 0.1688967, 1.109947, 1, 1, 1, 1, 1,
0.2311679, -0.1434973, 2.129924, 1, 1, 1, 1, 1,
0.2338889, 2.203688, -0.2648647, 1, 1, 1, 1, 1,
0.2341162, 1.15606, 0.1620041, 1, 1, 1, 1, 1,
0.2373741, 0.3087364, 1.628763, 1, 1, 1, 1, 1,
0.2375293, -1.437331, 1.719453, 1, 1, 1, 1, 1,
0.237824, -1.058932, 6.148747, 1, 1, 1, 1, 1,
0.2428379, 0.6604555, 0.6928415, 1, 1, 1, 1, 1,
0.2433284, 1.418104, -1.903986, 0, 0, 1, 1, 1,
0.2442345, 1.404856, 2.553869, 1, 0, 0, 1, 1,
0.2447339, 1.397505, -0.1372584, 1, 0, 0, 1, 1,
0.2499617, 1.022287, 0.8098393, 1, 0, 0, 1, 1,
0.2562067, 0.5182936, -1.280961, 1, 0, 0, 1, 1,
0.2627611, 1.280406, 0.283524, 1, 0, 0, 1, 1,
0.2631116, -0.5821186, 1.840228, 0, 0, 0, 1, 1,
0.2691561, -0.7267073, 2.7068, 0, 0, 0, 1, 1,
0.2699467, -1.761444, 3.776741, 0, 0, 0, 1, 1,
0.2709608, -1.685273, 3.690732, 0, 0, 0, 1, 1,
0.2731753, 0.309065, 0.4587031, 0, 0, 0, 1, 1,
0.2735941, 0.6192136, 1.689439, 0, 0, 0, 1, 1,
0.2746014, 2.026906, 0.7087311, 0, 0, 0, 1, 1,
0.2753133, -0.7794964, 2.558917, 1, 1, 1, 1, 1,
0.2763666, 0.3040085, 0.4980804, 1, 1, 1, 1, 1,
0.2806343, -0.7360629, 4.038814, 1, 1, 1, 1, 1,
0.2821018, 1.037023, -1.632508, 1, 1, 1, 1, 1,
0.2861054, -0.4439846, 0.9915598, 1, 1, 1, 1, 1,
0.2874128, -1.380665, 1.963355, 1, 1, 1, 1, 1,
0.288756, 0.5657389, -1.288775, 1, 1, 1, 1, 1,
0.2915833, -1.568464, 4.973367, 1, 1, 1, 1, 1,
0.2920286, -1.171327, 2.398488, 1, 1, 1, 1, 1,
0.296006, -1.435743, 3.498877, 1, 1, 1, 1, 1,
0.2966269, 0.4634764, 1.396178, 1, 1, 1, 1, 1,
0.2978087, -0.5410692, 1.422327, 1, 1, 1, 1, 1,
0.298946, -0.5857102, 2.755512, 1, 1, 1, 1, 1,
0.2990065, -0.7994829, 2.679471, 1, 1, 1, 1, 1,
0.299014, -0.9518736, 3.001415, 1, 1, 1, 1, 1,
0.300454, -0.04135676, 3.150149, 0, 0, 1, 1, 1,
0.3016081, 0.2169092, 1.319882, 1, 0, 0, 1, 1,
0.3099273, -1.678271, 2.177617, 1, 0, 0, 1, 1,
0.3119331, 0.5841174, -0.2998252, 1, 0, 0, 1, 1,
0.3155835, -0.4633632, 3.846424, 1, 0, 0, 1, 1,
0.3163786, -0.2384593, 2.315852, 1, 0, 0, 1, 1,
0.3207453, 0.2222103, -0.1253498, 0, 0, 0, 1, 1,
0.3215185, 0.4114387, 0.9123557, 0, 0, 0, 1, 1,
0.3258833, 0.2493739, 1.739424, 0, 0, 0, 1, 1,
0.3270391, -0.4933071, 2.034193, 0, 0, 0, 1, 1,
0.3277209, 0.9219949, -0.08200344, 0, 0, 0, 1, 1,
0.3286395, 0.7406766, 2.632263, 0, 0, 0, 1, 1,
0.3309815, 0.2505109, 2.109404, 0, 0, 0, 1, 1,
0.3327612, -2.566306, 3.981748, 1, 1, 1, 1, 1,
0.3378286, 2.555998, 0.349843, 1, 1, 1, 1, 1,
0.3389748, 0.2649868, 2.546211, 1, 1, 1, 1, 1,
0.3393806, -1.31436, 2.018186, 1, 1, 1, 1, 1,
0.3403459, -0.4673336, 3.593837, 1, 1, 1, 1, 1,
0.3407863, -1.920938, 1.931404, 1, 1, 1, 1, 1,
0.3419498, 0.6990609, 0.364105, 1, 1, 1, 1, 1,
0.3465511, -1.274134, 3.673272, 1, 1, 1, 1, 1,
0.3482744, -0.4212587, 3.261093, 1, 1, 1, 1, 1,
0.3501089, 1.604573, 0.2514503, 1, 1, 1, 1, 1,
0.3531434, 0.4139414, -0.286919, 1, 1, 1, 1, 1,
0.3548668, -0.1707201, 3.163, 1, 1, 1, 1, 1,
0.3550603, 1.418134, 0.2582741, 1, 1, 1, 1, 1,
0.3553527, -0.5394312, 2.492988, 1, 1, 1, 1, 1,
0.355775, -0.6281621, 2.72936, 1, 1, 1, 1, 1,
0.3564355, -0.4318174, 3.677488, 0, 0, 1, 1, 1,
0.3564971, -0.0735468, 0.6711522, 1, 0, 0, 1, 1,
0.3580827, 0.06658025, 2.5753, 1, 0, 0, 1, 1,
0.362576, 0.4451713, 0.3357742, 1, 0, 0, 1, 1,
0.363169, -0.01039784, 2.669038, 1, 0, 0, 1, 1,
0.3687244, 0.2748433, 1.225073, 1, 0, 0, 1, 1,
0.3703899, 1.737499, -1.08867, 0, 0, 0, 1, 1,
0.371556, -1.073585, 0.9373002, 0, 0, 0, 1, 1,
0.3721157, 0.6660326, -0.7026705, 0, 0, 0, 1, 1,
0.3750435, -0.4005628, 2.482119, 0, 0, 0, 1, 1,
0.3753568, -1.426439, 3.188118, 0, 0, 0, 1, 1,
0.3782909, 0.4329526, -2.095392, 0, 0, 0, 1, 1,
0.3828733, 0.9825096, -0.625694, 0, 0, 0, 1, 1,
0.3829253, 1.152874, -0.561009, 1, 1, 1, 1, 1,
0.3834009, -0.08635034, 1.658901, 1, 1, 1, 1, 1,
0.3851515, -0.6353682, 2.894695, 1, 1, 1, 1, 1,
0.3873095, 0.3060458, -0.6829758, 1, 1, 1, 1, 1,
0.3879575, 0.7329158, 0.1359448, 1, 1, 1, 1, 1,
0.3882483, -0.5745203, 1.985778, 1, 1, 1, 1, 1,
0.3935284, 0.9148726, 0.2658125, 1, 1, 1, 1, 1,
0.3949057, 1.19952, -0.4129178, 1, 1, 1, 1, 1,
0.3955367, 3.45898, -0.7871895, 1, 1, 1, 1, 1,
0.3974786, 0.4865204, 0.882476, 1, 1, 1, 1, 1,
0.3984886, 2.568892, 2.003566, 1, 1, 1, 1, 1,
0.4039244, -2.010855, 2.096973, 1, 1, 1, 1, 1,
0.4076547, 1.907723, -0.5882182, 1, 1, 1, 1, 1,
0.4092978, -1.029421, 4.379108, 1, 1, 1, 1, 1,
0.4110669, 0.2908783, 0.9548564, 1, 1, 1, 1, 1,
0.4131786, -0.8666229, 1.339662, 0, 0, 1, 1, 1,
0.4141597, 0.2088668, 1.781761, 1, 0, 0, 1, 1,
0.4161927, 0.1586358, 1.048631, 1, 0, 0, 1, 1,
0.4242496, -0.6901059, 3.940588, 1, 0, 0, 1, 1,
0.4260533, 0.3852876, 1.81631, 1, 0, 0, 1, 1,
0.4270399, 0.6851236, -0.971231, 1, 0, 0, 1, 1,
0.4285026, 0.3472447, 0.5157153, 0, 0, 0, 1, 1,
0.43612, 0.9159017, 1.566998, 0, 0, 0, 1, 1,
0.4366528, -0.3247172, 2.430844, 0, 0, 0, 1, 1,
0.4431728, 1.309125, -0.4495635, 0, 0, 0, 1, 1,
0.4441794, -0.1386446, 2.373671, 0, 0, 0, 1, 1,
0.4457881, -2.33427, 2.646135, 0, 0, 0, 1, 1,
0.4511293, 1.209939, -0.4159538, 0, 0, 0, 1, 1,
0.4587577, -0.7415123, 4.513934, 1, 1, 1, 1, 1,
0.4603831, -2.232714, 3.072008, 1, 1, 1, 1, 1,
0.466036, 0.2569951, 0.5163209, 1, 1, 1, 1, 1,
0.4725143, 1.311247, -0.01659817, 1, 1, 1, 1, 1,
0.4743148, 0.2899732, 1.643066, 1, 1, 1, 1, 1,
0.4750244, 1.118954, 1.85137, 1, 1, 1, 1, 1,
0.4751258, -1.311339, 5.124852, 1, 1, 1, 1, 1,
0.4774402, -0.2931064, 1.825207, 1, 1, 1, 1, 1,
0.4785627, -0.350485, 1.677065, 1, 1, 1, 1, 1,
0.4833072, 0.6098986, -0.456502, 1, 1, 1, 1, 1,
0.483881, 0.6535678, 1.240692, 1, 1, 1, 1, 1,
0.4943892, -0.5799084, 2.464159, 1, 1, 1, 1, 1,
0.4988246, 2.196418, 1.074984, 1, 1, 1, 1, 1,
0.5020914, -0.1504229, 2.946347, 1, 1, 1, 1, 1,
0.5023407, -0.4875069, 1.764994, 1, 1, 1, 1, 1,
0.5083478, -1.602172, 4.272868, 0, 0, 1, 1, 1,
0.5203099, 1.657988, 1.623313, 1, 0, 0, 1, 1,
0.5269939, -0.4449047, 0.5570394, 1, 0, 0, 1, 1,
0.5282049, 0.8933399, 0.1289429, 1, 0, 0, 1, 1,
0.5294735, 1.61379, -0.2912683, 1, 0, 0, 1, 1,
0.5296048, 0.5581135, -0.2055091, 1, 0, 0, 1, 1,
0.5324188, 0.7142925, -0.9950993, 0, 0, 0, 1, 1,
0.5327883, -1.093332, 3.062767, 0, 0, 0, 1, 1,
0.533102, 1.866157, 0.5707315, 0, 0, 0, 1, 1,
0.5361201, 0.4233831, -0.8745005, 0, 0, 0, 1, 1,
0.5384354, 0.9953932, 0.4808528, 0, 0, 0, 1, 1,
0.5385035, -0.4546774, 0.9355245, 0, 0, 0, 1, 1,
0.539094, -1.183399, 2.218538, 0, 0, 0, 1, 1,
0.5426536, -0.07462411, 2.047873, 1, 1, 1, 1, 1,
0.5432941, 0.4297313, 0.1363694, 1, 1, 1, 1, 1,
0.5474289, -1.535244, 2.71742, 1, 1, 1, 1, 1,
0.5529488, 0.548005, -0.6691071, 1, 1, 1, 1, 1,
0.556619, 0.0279999, 0.5397114, 1, 1, 1, 1, 1,
0.5578501, 0.4358043, -0.2768131, 1, 1, 1, 1, 1,
0.5585195, 0.08824302, 1.751347, 1, 1, 1, 1, 1,
0.5602828, -0.0727656, 2.816335, 1, 1, 1, 1, 1,
0.5608563, -2.106693, 0.9843867, 1, 1, 1, 1, 1,
0.5620244, 0.3456851, 2.242283, 1, 1, 1, 1, 1,
0.5630764, -0.3827097, 1.908489, 1, 1, 1, 1, 1,
0.5639568, -0.01608829, 1.171755, 1, 1, 1, 1, 1,
0.5648772, 1.955189, -1.671963, 1, 1, 1, 1, 1,
0.5671405, -1.500432, 2.290967, 1, 1, 1, 1, 1,
0.5719661, -0.0364759, 2.158472, 1, 1, 1, 1, 1,
0.5725963, 1.009746, -0.6346998, 0, 0, 1, 1, 1,
0.5806779, -0.139243, 2.756265, 1, 0, 0, 1, 1,
0.5817701, 2.352438, -1.184308, 1, 0, 0, 1, 1,
0.596541, -0.6030304, 0.5913466, 1, 0, 0, 1, 1,
0.5967278, -0.7382596, 3.624952, 1, 0, 0, 1, 1,
0.6128516, 0.611318, -0.4563034, 1, 0, 0, 1, 1,
0.6152455, 1.708001, 1.624877, 0, 0, 0, 1, 1,
0.6158828, -0.2795457, 0.7671124, 0, 0, 0, 1, 1,
0.6197329, 1.630743, 0.3134441, 0, 0, 0, 1, 1,
0.6202248, 0.03616172, 2.479463, 0, 0, 0, 1, 1,
0.6281039, -2.060321, 2.116137, 0, 0, 0, 1, 1,
0.6342601, 1.313688, -0.9330941, 0, 0, 0, 1, 1,
0.6386248, 0.6770787, 1.29828, 0, 0, 0, 1, 1,
0.6503013, -1.466958, 1.100326, 1, 1, 1, 1, 1,
0.6511151, 0.1509092, 1.577817, 1, 1, 1, 1, 1,
0.6512362, -0.9371636, 2.451611, 1, 1, 1, 1, 1,
0.6526775, 0.4030972, 2.446097, 1, 1, 1, 1, 1,
0.6560531, -1.177741, 3.490801, 1, 1, 1, 1, 1,
0.6565503, -0.13081, 4.15639, 1, 1, 1, 1, 1,
0.656669, 0.520175, 1.502277, 1, 1, 1, 1, 1,
0.6616686, 0.5690711, 1.31376, 1, 1, 1, 1, 1,
0.663019, -0.4006167, 0.894502, 1, 1, 1, 1, 1,
0.6637902, 1.490051, -0.5596638, 1, 1, 1, 1, 1,
0.6656473, 0.9806018, 0.8349474, 1, 1, 1, 1, 1,
0.6696547, -1.114975, 1.793071, 1, 1, 1, 1, 1,
0.6717086, 0.2475715, 1.587834, 1, 1, 1, 1, 1,
0.6718388, -0.6590809, 1.433391, 1, 1, 1, 1, 1,
0.6749941, 0.3308403, 1.882912, 1, 1, 1, 1, 1,
0.6767402, -1.727401, 2.957506, 0, 0, 1, 1, 1,
0.6773831, 0.06727925, 3.473548, 1, 0, 0, 1, 1,
0.6789359, -0.04566993, 1.585338, 1, 0, 0, 1, 1,
0.6859976, -0.9213485, 1.772804, 1, 0, 0, 1, 1,
0.6867301, 1.795799, -0.07281817, 1, 0, 0, 1, 1,
0.6939588, -1.288044, 3.347118, 1, 0, 0, 1, 1,
0.6941445, -0.4233387, 0.5925907, 0, 0, 0, 1, 1,
0.6947551, -0.79505, 3.649633, 0, 0, 0, 1, 1,
0.6991592, -0.7945834, 3.043795, 0, 0, 0, 1, 1,
0.700747, -2.983402, 2.791276, 0, 0, 0, 1, 1,
0.705548, -0.3349139, 2.455463, 0, 0, 0, 1, 1,
0.7120404, -0.2173956, 0.856601, 0, 0, 0, 1, 1,
0.716728, 0.877102, 1.017435, 0, 0, 0, 1, 1,
0.7195331, 0.4682095, 1.394959, 1, 1, 1, 1, 1,
0.720025, -0.3853656, 1.748113, 1, 1, 1, 1, 1,
0.7235889, -1.222191, 3.33307, 1, 1, 1, 1, 1,
0.7287245, -0.5909384, 2.28883, 1, 1, 1, 1, 1,
0.7357897, 0.01289672, 3.10465, 1, 1, 1, 1, 1,
0.7388205, 0.2258799, 0.7927212, 1, 1, 1, 1, 1,
0.7423903, -0.4699599, 1.550421, 1, 1, 1, 1, 1,
0.74264, 0.6314155, 0.7788154, 1, 1, 1, 1, 1,
0.7449117, -0.3124254, 1.041795, 1, 1, 1, 1, 1,
0.7454371, -0.3305517, 1.128455, 1, 1, 1, 1, 1,
0.7459678, -0.06715467, 0.3659974, 1, 1, 1, 1, 1,
0.7480648, -0.03117334, 1.35686, 1, 1, 1, 1, 1,
0.749386, 0.09078067, 1.641194, 1, 1, 1, 1, 1,
0.7530447, 1.734208, 0.09128425, 1, 1, 1, 1, 1,
0.7539364, -0.6244391, 4.594392, 1, 1, 1, 1, 1,
0.7578042, -1.500388, 2.437419, 0, 0, 1, 1, 1,
0.7707964, -0.2297897, 0.6799662, 1, 0, 0, 1, 1,
0.7749366, 0.1352385, 2.805802, 1, 0, 0, 1, 1,
0.7792807, 0.3080921, 2.103489, 1, 0, 0, 1, 1,
0.7855919, -0.0185939, 1.946066, 1, 0, 0, 1, 1,
0.7880638, 1.733757, 0.9983568, 1, 0, 0, 1, 1,
0.7882468, 0.06613058, -0.3937831, 0, 0, 0, 1, 1,
0.7900504, 0.6790575, 0.879208, 0, 0, 0, 1, 1,
0.7930189, 1.102908, 0.03014019, 0, 0, 0, 1, 1,
0.801468, 0.6837146, 0.01454967, 0, 0, 0, 1, 1,
0.8107901, 1.305924, -2.190117, 0, 0, 0, 1, 1,
0.8110154, 0.07292337, 3.298789, 0, 0, 0, 1, 1,
0.8120103, -1.783695, 3.221436, 0, 0, 0, 1, 1,
0.8134965, 0.4530419, 2.686933, 1, 1, 1, 1, 1,
0.816727, 0.3292407, 0.9424804, 1, 1, 1, 1, 1,
0.8184488, -0.8875018, 2.203927, 1, 1, 1, 1, 1,
0.819736, 1.773946, 0.3218289, 1, 1, 1, 1, 1,
0.8296293, -0.1284766, 0.8920009, 1, 1, 1, 1, 1,
0.8306702, 1.160727, 1.092458, 1, 1, 1, 1, 1,
0.8342076, 0.145367, 1.152648, 1, 1, 1, 1, 1,
0.83806, -0.0140499, 1.199543, 1, 1, 1, 1, 1,
0.8390338, -1.188974, 2.768801, 1, 1, 1, 1, 1,
0.8415145, -0.3357246, 0.9023791, 1, 1, 1, 1, 1,
0.846697, -2.265947, 2.306745, 1, 1, 1, 1, 1,
0.8476681, -0.7266599, 2.461059, 1, 1, 1, 1, 1,
0.8522118, -0.6832329, 2.857929, 1, 1, 1, 1, 1,
0.8571963, -0.9520277, 1.682669, 1, 1, 1, 1, 1,
0.8576171, 1.253739, 1.829126, 1, 1, 1, 1, 1,
0.8595294, -0.690062, 1.633286, 0, 0, 1, 1, 1,
0.8646674, 0.7766964, -0.9367382, 1, 0, 0, 1, 1,
0.8728793, 0.7357064, 2.197218, 1, 0, 0, 1, 1,
0.8734267, -0.1076914, 2.297033, 1, 0, 0, 1, 1,
0.8787208, -0.6665178, 3.086864, 1, 0, 0, 1, 1,
0.8791385, 0.3307574, 2.405959, 1, 0, 0, 1, 1,
0.8798295, -1.326375, 4.476315, 0, 0, 0, 1, 1,
0.8905997, 1.889039, -0.2402257, 0, 0, 0, 1, 1,
0.905794, -2.050533, 4.334055, 0, 0, 0, 1, 1,
0.9207164, -1.804268, 4.599199, 0, 0, 0, 1, 1,
0.9259452, 0.4047112, 0.682091, 0, 0, 0, 1, 1,
0.9310567, -1.207763, 2.573961, 0, 0, 0, 1, 1,
0.933511, 0.8391088, 1.156558, 0, 0, 0, 1, 1,
0.9335233, -1.287557, 2.576916, 1, 1, 1, 1, 1,
0.9346815, -0.3842767, 2.941016, 1, 1, 1, 1, 1,
0.936842, 2.250667, 1.363697, 1, 1, 1, 1, 1,
0.9382416, 0.5428541, -0.6651149, 1, 1, 1, 1, 1,
0.9396772, -0.3545702, -0.4580213, 1, 1, 1, 1, 1,
0.9410486, 0.7056675, 1.212904, 1, 1, 1, 1, 1,
0.9432768, -0.9645575, 2.46896, 1, 1, 1, 1, 1,
0.9437485, -0.7841412, 3.060683, 1, 1, 1, 1, 1,
0.9471914, -0.8993545, 2.731483, 1, 1, 1, 1, 1,
0.9551375, 0.9400228, 1.037034, 1, 1, 1, 1, 1,
0.9616556, 0.8586481, 2.017551, 1, 1, 1, 1, 1,
0.9638468, 1.511177, -1.019419, 1, 1, 1, 1, 1,
0.9670629, 0.3361812, 1.456572, 1, 1, 1, 1, 1,
0.9687148, -0.02302865, 1.094107, 1, 1, 1, 1, 1,
0.9824558, 1.124203, 1.041701, 1, 1, 1, 1, 1,
0.9844489, 0.7015723, 1.432209, 0, 0, 1, 1, 1,
0.9849187, 0.9654097, 1.241893, 1, 0, 0, 1, 1,
0.9923267, -0.8023767, 2.289474, 1, 0, 0, 1, 1,
0.9946739, 0.1763701, 2.220628, 1, 0, 0, 1, 1,
0.9990697, -0.3192744, 2.907601, 1, 0, 0, 1, 1,
1.000972, 0.4871473, 2.631998, 1, 0, 0, 1, 1,
1.001104, -0.4076062, 3.558588, 0, 0, 0, 1, 1,
1.003064, 0.08812312, 1.927069, 0, 0, 0, 1, 1,
1.007439, 1.259606, -1.296246, 0, 0, 0, 1, 1,
1.009338, -0.3463957, 2.845882, 0, 0, 0, 1, 1,
1.027515, -0.5423922, 0.3027227, 0, 0, 0, 1, 1,
1.032932, 0.7747607, 1.085884, 0, 0, 0, 1, 1,
1.04001, -1.368875, 2.346015, 0, 0, 0, 1, 1,
1.054431, 0.2267991, 1.322402, 1, 1, 1, 1, 1,
1.055261, 0.4072349, 1.818296, 1, 1, 1, 1, 1,
1.058483, 1.80814, -2.080353, 1, 1, 1, 1, 1,
1.061171, -0.783017, 0.4100144, 1, 1, 1, 1, 1,
1.063565, -1.239461, 0.8254513, 1, 1, 1, 1, 1,
1.071173, -1.349471, 3.979428, 1, 1, 1, 1, 1,
1.07894, -0.5403978, 2.644594, 1, 1, 1, 1, 1,
1.080595, 1.066281, 0.4328197, 1, 1, 1, 1, 1,
1.09506, -1.267963, 3.441667, 1, 1, 1, 1, 1,
1.100116, -0.8385006, -1.193374, 1, 1, 1, 1, 1,
1.103854, -1.559196, 5.951232, 1, 1, 1, 1, 1,
1.105595, 0.07701223, 2.427907, 1, 1, 1, 1, 1,
1.112938, 0.6327042, 2.389717, 1, 1, 1, 1, 1,
1.119013, 1.077695, 0.1442948, 1, 1, 1, 1, 1,
1.12162, -0.1995092, 0.6807715, 1, 1, 1, 1, 1,
1.125157, 0.02597951, 1.396946, 0, 0, 1, 1, 1,
1.130037, -0.2291888, 3.405864, 1, 0, 0, 1, 1,
1.14082, -1.658057, 3.230221, 1, 0, 0, 1, 1,
1.145624, -1.018841, 2.615058, 1, 0, 0, 1, 1,
1.151415, -1.875221, 2.933493, 1, 0, 0, 1, 1,
1.155553, -0.2717253, 0.963765, 1, 0, 0, 1, 1,
1.156842, 0.3978621, 0.06274793, 0, 0, 0, 1, 1,
1.157403, -0.2733723, 3.445231, 0, 0, 0, 1, 1,
1.161419, 1.0233, 1.020432, 0, 0, 0, 1, 1,
1.164501, 0.9125416, -1.125178, 0, 0, 0, 1, 1,
1.16731, 0.7258734, 0.76078, 0, 0, 0, 1, 1,
1.167336, 0.8528677, 1.459468, 0, 0, 0, 1, 1,
1.180437, -1.251599, 3.659542, 0, 0, 0, 1, 1,
1.184272, 0.5236796, 0.9964195, 1, 1, 1, 1, 1,
1.186093, -0.244637, 2.089889, 1, 1, 1, 1, 1,
1.191633, -0.3283183, -0.3180381, 1, 1, 1, 1, 1,
1.196593, -0.9051248, 1.911758, 1, 1, 1, 1, 1,
1.200659, -0.03352937, 0.4884065, 1, 1, 1, 1, 1,
1.201577, 1.190833, 0.349563, 1, 1, 1, 1, 1,
1.207009, 0.1431712, 0.6412765, 1, 1, 1, 1, 1,
1.207754, -0.8234593, 1.757775, 1, 1, 1, 1, 1,
1.219281, -0.5577179, 0.9031814, 1, 1, 1, 1, 1,
1.219475, 3.150486, 1.002699, 1, 1, 1, 1, 1,
1.222564, 1.370104, 0.6013135, 1, 1, 1, 1, 1,
1.224374, 0.2269644, 0.6730293, 1, 1, 1, 1, 1,
1.228032, 0.843372, 0.7920148, 1, 1, 1, 1, 1,
1.23842, -0.2933755, 1.547675, 1, 1, 1, 1, 1,
1.241264, 0.3070422, 1.435406, 1, 1, 1, 1, 1,
1.247781, -0.1735868, 2.712971, 0, 0, 1, 1, 1,
1.251288, 0.09221951, 0.9159954, 1, 0, 0, 1, 1,
1.254442, -1.58851, 2.168092, 1, 0, 0, 1, 1,
1.259595, 0.4722845, 1.256636, 1, 0, 0, 1, 1,
1.262861, 0.2174024, 1.211529, 1, 0, 0, 1, 1,
1.269941, 1.386027, 1.240755, 1, 0, 0, 1, 1,
1.270586, -0.02965214, 2.278651, 0, 0, 0, 1, 1,
1.272037, 0.3967111, 0.8047366, 0, 0, 0, 1, 1,
1.277718, 1.025887, 2.188585, 0, 0, 0, 1, 1,
1.279762, -0.4934278, 2.329808, 0, 0, 0, 1, 1,
1.282528, -1.538564, 3.556064, 0, 0, 0, 1, 1,
1.2857, -0.3885666, 1.440855, 0, 0, 0, 1, 1,
1.285865, 0.4414434, 2.010612, 0, 0, 0, 1, 1,
1.287058, 0.3598906, 1.159192, 1, 1, 1, 1, 1,
1.315092, 0.661051, 3.622495, 1, 1, 1, 1, 1,
1.326263, 0.7286502, 1.381092, 1, 1, 1, 1, 1,
1.336615, -0.2279129, 2.108712, 1, 1, 1, 1, 1,
1.336619, 2.024451, -0.9118652, 1, 1, 1, 1, 1,
1.341129, 0.1591283, 2.957088, 1, 1, 1, 1, 1,
1.361828, 0.6634293, 0.5651242, 1, 1, 1, 1, 1,
1.375399, 1.66205, 0.3964139, 1, 1, 1, 1, 1,
1.377263, -1.015737, 0.9288962, 1, 1, 1, 1, 1,
1.378383, 0.6870965, 1.515597, 1, 1, 1, 1, 1,
1.402961, -0.1588653, 1.410267, 1, 1, 1, 1, 1,
1.404406, -0.533171, 2.767427, 1, 1, 1, 1, 1,
1.414021, -0.1381174, 2.767993, 1, 1, 1, 1, 1,
1.421695, -0.5967048, 1.456856, 1, 1, 1, 1, 1,
1.424925, -0.8169776, 4.318007, 1, 1, 1, 1, 1,
1.425931, 1.27464, 0.6862894, 0, 0, 1, 1, 1,
1.432285, -0.2016464, 1.189458, 1, 0, 0, 1, 1,
1.455065, -2.500357, 1.827159, 1, 0, 0, 1, 1,
1.456101, -0.8824884, 2.070061, 1, 0, 0, 1, 1,
1.481223, 0.4031234, 1.089518, 1, 0, 0, 1, 1,
1.485172, -0.3725943, 1.689903, 1, 0, 0, 1, 1,
1.485482, -0.3584618, 2.372762, 0, 0, 0, 1, 1,
1.489156, -0.4947305, 2.166645, 0, 0, 0, 1, 1,
1.498038, -0.8290967, 2.133681, 0, 0, 0, 1, 1,
1.510369, -0.002104692, 0.3325948, 0, 0, 0, 1, 1,
1.520513, 1.565355, -0.4068089, 0, 0, 0, 1, 1,
1.527512, -0.01665143, 1.190513, 0, 0, 0, 1, 1,
1.541046, -0.1720257, 1.552877, 0, 0, 0, 1, 1,
1.548337, -0.1808628, 0.7477926, 1, 1, 1, 1, 1,
1.553456, 0.1953572, 1.451921, 1, 1, 1, 1, 1,
1.58459, -1.759959, 1.806793, 1, 1, 1, 1, 1,
1.58597, 0.2151935, 1.619981, 1, 1, 1, 1, 1,
1.593319, 2.359903, -0.4930826, 1, 1, 1, 1, 1,
1.600634, -1.546841, 2.640396, 1, 1, 1, 1, 1,
1.602283, 0.8118884, 0.3308557, 1, 1, 1, 1, 1,
1.621488, -1.2775, 2.261914, 1, 1, 1, 1, 1,
1.621933, -0.1822327, 0.191609, 1, 1, 1, 1, 1,
1.622101, -0.9358858, 1.255759, 1, 1, 1, 1, 1,
1.624648, 1.107961, 2.099715, 1, 1, 1, 1, 1,
1.62546, -0.2500162, 2.634811, 1, 1, 1, 1, 1,
1.627976, -1.662246, 2.707647, 1, 1, 1, 1, 1,
1.634964, -0.3281582, 0.4503858, 1, 1, 1, 1, 1,
1.648557, -0.2225309, 2.014884, 1, 1, 1, 1, 1,
1.649947, 1.483134, 0.08847143, 0, 0, 1, 1, 1,
1.649982, 0.2871198, 1.579608, 1, 0, 0, 1, 1,
1.654465, -0.181972, -0.6298304, 1, 0, 0, 1, 1,
1.654771, -0.4223948, 1.677564, 1, 0, 0, 1, 1,
1.655681, -0.4348639, 1.730701, 1, 0, 0, 1, 1,
1.664822, -2.215705, 4.492252, 1, 0, 0, 1, 1,
1.692447, 1.093866, 1.220497, 0, 0, 0, 1, 1,
1.695574, -2.640452, 1.800528, 0, 0, 0, 1, 1,
1.716344, 0.1305964, -0.8409992, 0, 0, 0, 1, 1,
1.718084, 0.03834968, 2.281388, 0, 0, 0, 1, 1,
1.719728, 1.156222, 1.826524, 0, 0, 0, 1, 1,
1.723277, 0.649674, -0.3147469, 0, 0, 0, 1, 1,
1.731329, -0.04140664, 2.34139, 0, 0, 0, 1, 1,
1.732065, -1.796928, 2.584557, 1, 1, 1, 1, 1,
1.739612, 0.6989461, 1.22398, 1, 1, 1, 1, 1,
1.747971, 1.095195, 1.483435, 1, 1, 1, 1, 1,
1.748911, 0.533068, 1.117721, 1, 1, 1, 1, 1,
1.769938, 0.4041412, 1.910056, 1, 1, 1, 1, 1,
1.775789, -1.154987, 2.885299, 1, 1, 1, 1, 1,
1.777385, -0.5981831, 2.36616, 1, 1, 1, 1, 1,
1.778454, 0.4467339, 0.6170853, 1, 1, 1, 1, 1,
1.781105, 0.2263149, 1.027271, 1, 1, 1, 1, 1,
1.840518, -1.030826, 1.192354, 1, 1, 1, 1, 1,
1.882029, 0.5167593, 1.048409, 1, 1, 1, 1, 1,
1.883721, -0.3329131, 0.1116098, 1, 1, 1, 1, 1,
1.901653, 0.8442807, 3.33503, 1, 1, 1, 1, 1,
1.918417, 1.802018, 1.061388, 1, 1, 1, 1, 1,
1.929288, -0.5530009, 0.6179115, 1, 1, 1, 1, 1,
1.980345, -1.766523, 2.499161, 0, 0, 1, 1, 1,
1.985078, 0.6924103, 3.103306, 1, 0, 0, 1, 1,
1.998166, -2.301491, 2.007029, 1, 0, 0, 1, 1,
2.003536, -1.025345, 2.818609, 1, 0, 0, 1, 1,
2.017138, -0.5827589, 2.876552, 1, 0, 0, 1, 1,
2.056893, -0.1847767, 1.004698, 1, 0, 0, 1, 1,
2.094854, 0.7456708, 1.335771, 0, 0, 0, 1, 1,
2.159156, 0.7689803, 0.7565395, 0, 0, 0, 1, 1,
2.161049, 2.431588, 1.596553, 0, 0, 0, 1, 1,
2.175916, 1.408847, 0.3218518, 0, 0, 0, 1, 1,
2.18801, -0.3384654, 1.227426, 0, 0, 0, 1, 1,
2.243572, 0.1306105, 2.776372, 0, 0, 0, 1, 1,
2.26212, 1.166679, 0.2184846, 0, 0, 0, 1, 1,
2.430128, -0.2278286, 1.039046, 1, 1, 1, 1, 1,
2.444818, -0.6890485, 1.330275, 1, 1, 1, 1, 1,
2.60255, -0.7155699, 1.894058, 1, 1, 1, 1, 1,
2.823143, 1.242885, 2.30833, 1, 1, 1, 1, 1,
2.903224, -0.8212954, 3.251153, 1, 1, 1, 1, 1,
2.964374, 0.2827252, 1.219841, 1, 1, 1, 1, 1,
3.202968, 0.416558, 2.484062, 1, 1, 1, 1, 1
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
var radius = 9.474813;
var distance = 33.27988;
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
mvMatrix.translate( -0.1954077, -0.2377895, -0.7995107 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27988);
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
