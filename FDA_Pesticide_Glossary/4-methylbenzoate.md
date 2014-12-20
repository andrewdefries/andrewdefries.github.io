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
-2.882153, 1.007258, -1.551568, 1, 0, 0, 1,
-2.790895, 1.241768, -0.4817436, 1, 0.007843138, 0, 1,
-2.678375, 1.511357, -1.464706, 1, 0.01176471, 0, 1,
-2.62447, -1.402013, -3.998883, 1, 0.01960784, 0, 1,
-2.604948, 0.4798087, -0.7157591, 1, 0.02352941, 0, 1,
-2.595288, 0.2483153, -2.496105, 1, 0.03137255, 0, 1,
-2.507341, 0.9620602, -1.022964, 1, 0.03529412, 0, 1,
-2.458309, -1.516956, -3.228737, 1, 0.04313726, 0, 1,
-2.321192, 0.5318843, -1.839711, 1, 0.04705882, 0, 1,
-2.299586, 1.020063, -2.323255, 1, 0.05490196, 0, 1,
-2.288288, -0.9085838, -1.62345, 1, 0.05882353, 0, 1,
-2.287416, 2.096399, 0.2306859, 1, 0.06666667, 0, 1,
-2.248421, 0.770177, -1.351738, 1, 0.07058824, 0, 1,
-2.222535, 0.1140171, -0.3335131, 1, 0.07843138, 0, 1,
-2.219883, -0.6790029, -0.4233499, 1, 0.08235294, 0, 1,
-2.19108, 0.0391174, -0.960092, 1, 0.09019608, 0, 1,
-2.184094, -2.821178, -1.834022, 1, 0.09411765, 0, 1,
-2.16628, 0.6651355, -0.9454975, 1, 0.1019608, 0, 1,
-2.120013, -0.030337, -2.553113, 1, 0.1098039, 0, 1,
-2.119358, -0.2881428, -1.429098, 1, 0.1137255, 0, 1,
-2.096498, -0.7111301, -2.469974, 1, 0.1215686, 0, 1,
-2.067498, 1.684185, -0.002312579, 1, 0.1254902, 0, 1,
-2.062384, 0.5583445, -1.420339, 1, 0.1333333, 0, 1,
-2.033912, 0.3547169, -1.209906, 1, 0.1372549, 0, 1,
-2.02313, -0.7253084, -2.612638, 1, 0.145098, 0, 1,
-2.013402, -0.1331601, -3.186044, 1, 0.1490196, 0, 1,
-2.006999, -2.236804, -2.315176, 1, 0.1568628, 0, 1,
-1.939125, -0.6792162, -1.500424, 1, 0.1607843, 0, 1,
-1.906973, -0.8331872, -2.031967, 1, 0.1686275, 0, 1,
-1.887174, 0.9943839, 0.3628405, 1, 0.172549, 0, 1,
-1.886656, 0.5222709, -2.463854, 1, 0.1803922, 0, 1,
-1.880073, 0.04414019, -0.6719398, 1, 0.1843137, 0, 1,
-1.86597, -0.7193856, -1.893284, 1, 0.1921569, 0, 1,
-1.853876, 0.9766704, -1.369033, 1, 0.1960784, 0, 1,
-1.829588, 0.3417749, 1.058388, 1, 0.2039216, 0, 1,
-1.808251, -1.169949, -2.663378, 1, 0.2117647, 0, 1,
-1.778976, 0.09730949, -1.537047, 1, 0.2156863, 0, 1,
-1.773072, -2.105613, -2.703988, 1, 0.2235294, 0, 1,
-1.762649, 0.6442322, -0.189873, 1, 0.227451, 0, 1,
-1.753966, -0.5238545, -3.059108, 1, 0.2352941, 0, 1,
-1.72862, -1.546134, -0.851174, 1, 0.2392157, 0, 1,
-1.723446, 1.629127, -0.8020244, 1, 0.2470588, 0, 1,
-1.71882, 0.3721985, -3.993299, 1, 0.2509804, 0, 1,
-1.712049, 0.1980925, -0.09846684, 1, 0.2588235, 0, 1,
-1.71043, 0.8906326, -1.994167, 1, 0.2627451, 0, 1,
-1.704554, 0.8874506, -1.041782, 1, 0.2705882, 0, 1,
-1.702501, -1.61953, -1.997382, 1, 0.2745098, 0, 1,
-1.698797, 1.323681, 0.6460691, 1, 0.282353, 0, 1,
-1.691308, -1.199152, -3.645185, 1, 0.2862745, 0, 1,
-1.683373, 1.561309, -1.680519, 1, 0.2941177, 0, 1,
-1.600983, 0.585171, 0.9155949, 1, 0.3019608, 0, 1,
-1.575748, -0.1731669, -2.982744, 1, 0.3058824, 0, 1,
-1.57411, 0.3814304, 0.3917536, 1, 0.3137255, 0, 1,
-1.56205, -1.648432, -3.237548, 1, 0.3176471, 0, 1,
-1.553099, 0.7199613, -1.04137, 1, 0.3254902, 0, 1,
-1.547141, -0.7201911, -1.663053, 1, 0.3294118, 0, 1,
-1.538146, -1.226953, -3.834934, 1, 0.3372549, 0, 1,
-1.525664, -0.2957287, 0.5668749, 1, 0.3411765, 0, 1,
-1.525236, 0.9843203, -1.405578, 1, 0.3490196, 0, 1,
-1.505818, 0.1555332, -3.461952, 1, 0.3529412, 0, 1,
-1.466004, -0.5706148, -2.473569, 1, 0.3607843, 0, 1,
-1.462434, 1.513242, -1.17591, 1, 0.3647059, 0, 1,
-1.461118, -1.265138, -2.758692, 1, 0.372549, 0, 1,
-1.439368, 0.4746773, 0.1868583, 1, 0.3764706, 0, 1,
-1.422046, -0.3177626, -0.248716, 1, 0.3843137, 0, 1,
-1.417037, 0.694156, -0.4361628, 1, 0.3882353, 0, 1,
-1.401715, -0.01945124, -1.380197, 1, 0.3960784, 0, 1,
-1.397874, 0.2967492, -1.256585, 1, 0.4039216, 0, 1,
-1.392377, -0.6119416, -3.64857, 1, 0.4078431, 0, 1,
-1.37554, -1.153721, -2.00253, 1, 0.4156863, 0, 1,
-1.372833, 0.2671667, -2.945749, 1, 0.4196078, 0, 1,
-1.368172, 0.8568584, -0.06231512, 1, 0.427451, 0, 1,
-1.365834, -0.2556138, -0.475092, 1, 0.4313726, 0, 1,
-1.365055, 0.9079003, -0.4731307, 1, 0.4392157, 0, 1,
-1.359655, -0.6681063, -2.590708, 1, 0.4431373, 0, 1,
-1.356319, 0.1472771, -2.725189, 1, 0.4509804, 0, 1,
-1.350905, -0.1131547, -3.000067, 1, 0.454902, 0, 1,
-1.350647, -0.02700095, -2.747447, 1, 0.4627451, 0, 1,
-1.348753, -0.6412895, -3.350796, 1, 0.4666667, 0, 1,
-1.34192, 0.398697, -1.228159, 1, 0.4745098, 0, 1,
-1.341709, 0.1463366, 0.3594471, 1, 0.4784314, 0, 1,
-1.330836, -1.2582, -2.621867, 1, 0.4862745, 0, 1,
-1.329592, -2.053154, -3.587294, 1, 0.4901961, 0, 1,
-1.323457, 0.1086027, 0.4555863, 1, 0.4980392, 0, 1,
-1.319809, 0.4762705, -1.50132, 1, 0.5058824, 0, 1,
-1.319183, -0.3208409, -1.136132, 1, 0.509804, 0, 1,
-1.318281, -0.5648778, -3.007526, 1, 0.5176471, 0, 1,
-1.304064, -0.3950265, -2.951182, 1, 0.5215687, 0, 1,
-1.302857, 1.580705, -0.7294593, 1, 0.5294118, 0, 1,
-1.301794, 0.4077074, -2.408362, 1, 0.5333334, 0, 1,
-1.291797, -0.05060268, -3.076834, 1, 0.5411765, 0, 1,
-1.284518, -0.124665, -2.158975, 1, 0.5450981, 0, 1,
-1.28052, -1.787136, -1.687152, 1, 0.5529412, 0, 1,
-1.279784, -0.1528447, -1.559238, 1, 0.5568628, 0, 1,
-1.275947, -0.5354103, -1.664924, 1, 0.5647059, 0, 1,
-1.272484, 0.7489718, -0.8757946, 1, 0.5686275, 0, 1,
-1.25492, 0.5310308, -1.061882, 1, 0.5764706, 0, 1,
-1.25068, -0.438835, -1.458729, 1, 0.5803922, 0, 1,
-1.250202, -2.520823, -3.225175, 1, 0.5882353, 0, 1,
-1.244107, -0.3491309, -1.691511, 1, 0.5921569, 0, 1,
-1.24171, -1.060727, -3.319739, 1, 0.6, 0, 1,
-1.24124, 1.249501, -2.017061, 1, 0.6078432, 0, 1,
-1.240759, -0.5639293, -3.224793, 1, 0.6117647, 0, 1,
-1.2371, -0.4218957, -0.2710014, 1, 0.6196079, 0, 1,
-1.235566, 0.694453, 0.3291416, 1, 0.6235294, 0, 1,
-1.231983, -1.221946, -3.142809, 1, 0.6313726, 0, 1,
-1.219614, -0.4073731, -3.574611, 1, 0.6352941, 0, 1,
-1.216905, 1.343017, -0.5829902, 1, 0.6431373, 0, 1,
-1.21481, 1.910265, -0.6911584, 1, 0.6470588, 0, 1,
-1.211897, 2.858341, -0.4599172, 1, 0.654902, 0, 1,
-1.211342, -0.5938861, -1.479784, 1, 0.6588235, 0, 1,
-1.208933, -0.8998033, -3.952513, 1, 0.6666667, 0, 1,
-1.198677, 0.9611896, -0.1547343, 1, 0.6705883, 0, 1,
-1.180488, 0.00377979, -1.271806, 1, 0.6784314, 0, 1,
-1.177518, 0.217817, -0.95342, 1, 0.682353, 0, 1,
-1.175387, 0.4148318, -2.64823, 1, 0.6901961, 0, 1,
-1.175, 2.011027, -0.05910187, 1, 0.6941177, 0, 1,
-1.173323, -0.977349, -1.656424, 1, 0.7019608, 0, 1,
-1.17314, -0.4705291, -1.812655, 1, 0.7098039, 0, 1,
-1.15818, -0.8066166, -1.617204, 1, 0.7137255, 0, 1,
-1.157255, 0.1152947, -2.068628, 1, 0.7215686, 0, 1,
-1.156016, 1.440285, 0.04896213, 1, 0.7254902, 0, 1,
-1.152695, -0.4213589, -1.738554, 1, 0.7333333, 0, 1,
-1.141654, 0.6407366, -2.767852, 1, 0.7372549, 0, 1,
-1.141395, 0.07767969, -2.632502, 1, 0.7450981, 0, 1,
-1.136533, 1.456531, -1.751355, 1, 0.7490196, 0, 1,
-1.128021, -0.1255679, -2.20761, 1, 0.7568628, 0, 1,
-1.126343, -1.213644, -1.984344, 1, 0.7607843, 0, 1,
-1.122295, -0.9138129, -4.052225, 1, 0.7686275, 0, 1,
-1.121889, -2.356241, -3.356336, 1, 0.772549, 0, 1,
-1.12003, 1.279289, -0.1820769, 1, 0.7803922, 0, 1,
-1.115874, -1.296782, -2.246177, 1, 0.7843137, 0, 1,
-1.111703, 0.8186859, -2.051096, 1, 0.7921569, 0, 1,
-1.107484, 0.05291275, -1.36752, 1, 0.7960784, 0, 1,
-1.105689, 0.9822688, 0.04246025, 1, 0.8039216, 0, 1,
-1.105459, -1.183159, -3.799241, 1, 0.8117647, 0, 1,
-1.093698, -0.4731746, -2.030195, 1, 0.8156863, 0, 1,
-1.092872, 0.310309, -2.628885, 1, 0.8235294, 0, 1,
-1.079899, 2.052592, -0.9909354, 1, 0.827451, 0, 1,
-1.071074, 0.5841918, -0.4841349, 1, 0.8352941, 0, 1,
-1.067649, 0.09743152, -1.544715, 1, 0.8392157, 0, 1,
-1.053238, -0.6178938, -3.421551, 1, 0.8470588, 0, 1,
-1.046162, 0.3540928, -1.531947, 1, 0.8509804, 0, 1,
-1.040311, 1.9, 0.9409022, 1, 0.8588235, 0, 1,
-1.039503, -0.4088984, -3.479672, 1, 0.8627451, 0, 1,
-1.03729, 0.5949987, 0.07076256, 1, 0.8705882, 0, 1,
-1.032835, -0.05424172, -0.7086477, 1, 0.8745098, 0, 1,
-1.027334, -0.8403447, -3.42204, 1, 0.8823529, 0, 1,
-1.023861, -0.02796978, -2.286362, 1, 0.8862745, 0, 1,
-1.022038, -1.552396, -2.752018, 1, 0.8941177, 0, 1,
-1.015413, -0.8758575, -1.654696, 1, 0.8980392, 0, 1,
-1.013909, 0.3685561, -2.685287, 1, 0.9058824, 0, 1,
-1.007114, 0.9939204, -0.4116075, 1, 0.9137255, 0, 1,
-1.00057, -0.4123957, -2.370245, 1, 0.9176471, 0, 1,
-0.9990057, 0.08197263, -2.312958, 1, 0.9254902, 0, 1,
-0.9750788, -2.031867, -1.166626, 1, 0.9294118, 0, 1,
-0.971167, 0.07859343, -1.478209, 1, 0.9372549, 0, 1,
-0.9687884, -1.885542, -2.819718, 1, 0.9411765, 0, 1,
-0.9468377, -0.9434416, -4.429331, 1, 0.9490196, 0, 1,
-0.9443718, -1.051374, -4.336945, 1, 0.9529412, 0, 1,
-0.9409365, -1.635707, -3.678135, 1, 0.9607843, 0, 1,
-0.940912, 0.04767083, -1.601405, 1, 0.9647059, 0, 1,
-0.9343421, 1.125544, -2.257653, 1, 0.972549, 0, 1,
-0.9289459, -0.07624948, -2.419713, 1, 0.9764706, 0, 1,
-0.9250175, -0.3234939, -3.021667, 1, 0.9843137, 0, 1,
-0.9241865, -0.9956967, -1.751496, 1, 0.9882353, 0, 1,
-0.9236023, -1.296376, -2.71067, 1, 0.9960784, 0, 1,
-0.9155527, -1.01379, -0.3244034, 0.9960784, 1, 0, 1,
-0.9117513, -1.798828, -2.731667, 0.9921569, 1, 0, 1,
-0.9097119, 0.5592802, -0.7995554, 0.9843137, 1, 0, 1,
-0.9072513, 0.3662, -2.122881, 0.9803922, 1, 0, 1,
-0.9054325, -1.719304, -3.165618, 0.972549, 1, 0, 1,
-0.9028754, 0.3400325, -4.037923, 0.9686275, 1, 0, 1,
-0.9000999, -0.7060905, -3.948852, 0.9607843, 1, 0, 1,
-0.8981915, 0.589285, -0.5566871, 0.9568627, 1, 0, 1,
-0.8976685, 0.1501638, -1.58626, 0.9490196, 1, 0, 1,
-0.8953151, 0.8773555, -1.984908, 0.945098, 1, 0, 1,
-0.8935804, 0.7487397, -3.885126, 0.9372549, 1, 0, 1,
-0.8927612, 0.06595106, -1.493839, 0.9333333, 1, 0, 1,
-0.8853867, 0.1174753, -2.660602, 0.9254902, 1, 0, 1,
-0.861489, 0.7839621, -2.097668, 0.9215686, 1, 0, 1,
-0.8570616, 0.8300326, -0.03629167, 0.9137255, 1, 0, 1,
-0.8544444, -1.212822, -2.670168, 0.9098039, 1, 0, 1,
-0.8529084, 1.08845, -1.17405, 0.9019608, 1, 0, 1,
-0.8493854, 1.70382, -1.182397, 0.8941177, 1, 0, 1,
-0.8441856, 0.6308774, 0.3091955, 0.8901961, 1, 0, 1,
-0.8431216, 0.6221494, -2.669342, 0.8823529, 1, 0, 1,
-0.8409944, -3.021667, -4.644826, 0.8784314, 1, 0, 1,
-0.8359855, -0.1386002, -2.816711, 0.8705882, 1, 0, 1,
-0.8346415, 0.8295355, -0.1717432, 0.8666667, 1, 0, 1,
-0.8263577, -0.2921185, -1.52293, 0.8588235, 1, 0, 1,
-0.8248604, 1.68724, -1.22108, 0.854902, 1, 0, 1,
-0.8248303, -0.7451231, -2.948788, 0.8470588, 1, 0, 1,
-0.8232468, -0.3797332, -1.292971, 0.8431373, 1, 0, 1,
-0.8217432, 0.7687226, 0.0307122, 0.8352941, 1, 0, 1,
-0.8154257, -0.8799361, -1.315179, 0.8313726, 1, 0, 1,
-0.813776, 0.3275944, -2.153238, 0.8235294, 1, 0, 1,
-0.8136555, 0.272635, -1.957335, 0.8196079, 1, 0, 1,
-0.8107468, 1.04292, -0.5642108, 0.8117647, 1, 0, 1,
-0.8093825, 2.328585, -0.6645409, 0.8078431, 1, 0, 1,
-0.8061454, 0.3668576, 0.1030512, 0.8, 1, 0, 1,
-0.8042603, -0.3594937, -0.01352521, 0.7921569, 1, 0, 1,
-0.7975429, -1.654001, -2.322646, 0.7882353, 1, 0, 1,
-0.7956928, 1.252131, -0.1801257, 0.7803922, 1, 0, 1,
-0.7927358, 0.4520992, -2.635789, 0.7764706, 1, 0, 1,
-0.7883156, -0.07019438, -2.353986, 0.7686275, 1, 0, 1,
-0.7877122, -1.056434, -2.567749, 0.7647059, 1, 0, 1,
-0.7874615, -0.4730849, -2.685973, 0.7568628, 1, 0, 1,
-0.7732984, 0.4011933, -2.200437, 0.7529412, 1, 0, 1,
-0.7711133, -1.105749, -2.470095, 0.7450981, 1, 0, 1,
-0.7705501, 0.6472434, -0.0759813, 0.7411765, 1, 0, 1,
-0.762967, -0.087662, -2.353161, 0.7333333, 1, 0, 1,
-0.7615378, 0.169493, -1.187878, 0.7294118, 1, 0, 1,
-0.7588607, 1.032257, -0.1257536, 0.7215686, 1, 0, 1,
-0.7568343, -0.2710047, -1.034272, 0.7176471, 1, 0, 1,
-0.7523501, -0.1534242, -1.616046, 0.7098039, 1, 0, 1,
-0.7496262, -1.016896, -3.882826, 0.7058824, 1, 0, 1,
-0.7459478, -0.6878367, -4.615501, 0.6980392, 1, 0, 1,
-0.7459186, -0.1299214, -2.627446, 0.6901961, 1, 0, 1,
-0.7453603, -1.588775, -3.347294, 0.6862745, 1, 0, 1,
-0.7439087, -0.8613205, -0.7475554, 0.6784314, 1, 0, 1,
-0.7409127, 0.3470711, -1.074612, 0.6745098, 1, 0, 1,
-0.7383357, 0.2833082, -0.8545929, 0.6666667, 1, 0, 1,
-0.736149, -1.439557, -1.607734, 0.6627451, 1, 0, 1,
-0.7345526, -0.496981, -0.8020985, 0.654902, 1, 0, 1,
-0.7313522, 0.708483, 0.66911, 0.6509804, 1, 0, 1,
-0.7303472, -0.6174762, -2.386563, 0.6431373, 1, 0, 1,
-0.7279532, 0.574431, 2.774432, 0.6392157, 1, 0, 1,
-0.7257052, -1.444365, -1.40311, 0.6313726, 1, 0, 1,
-0.7256631, -0.7249889, -2.047129, 0.627451, 1, 0, 1,
-0.7198863, 0.4405368, -1.977645, 0.6196079, 1, 0, 1,
-0.7101668, -0.8854591, -4.537354, 0.6156863, 1, 0, 1,
-0.7020245, -0.5343201, -3.307646, 0.6078432, 1, 0, 1,
-0.7014057, -0.9351296, -1.53251, 0.6039216, 1, 0, 1,
-0.6963407, 0.7051954, -1.783893, 0.5960785, 1, 0, 1,
-0.6961526, -0.1838386, -2.298166, 0.5882353, 1, 0, 1,
-0.6955597, 1.507067, -1.025635, 0.5843138, 1, 0, 1,
-0.6946539, 0.6153741, -0.830904, 0.5764706, 1, 0, 1,
-0.691669, 0.8403779, -2.983794, 0.572549, 1, 0, 1,
-0.6898399, -0.5532904, -1.009706, 0.5647059, 1, 0, 1,
-0.6865437, 1.453011, 0.04576314, 0.5607843, 1, 0, 1,
-0.6857497, -1.402939, -3.159, 0.5529412, 1, 0, 1,
-0.6772319, -0.7591426, -3.192641, 0.5490196, 1, 0, 1,
-0.6765598, 0.4530804, -0.3166245, 0.5411765, 1, 0, 1,
-0.6727734, 0.2017158, 0.6862919, 0.5372549, 1, 0, 1,
-0.6704317, 0.6071941, -0.2650507, 0.5294118, 1, 0, 1,
-0.664413, -0.3126772, -2.22416, 0.5254902, 1, 0, 1,
-0.6623009, -2.629697, -1.159834, 0.5176471, 1, 0, 1,
-0.6613122, 0.1505354, -1.748286, 0.5137255, 1, 0, 1,
-0.6610759, 0.4308194, -2.055364, 0.5058824, 1, 0, 1,
-0.6574888, 0.002023179, -1.147876, 0.5019608, 1, 0, 1,
-0.6566714, 0.5206648, 0.9616377, 0.4941176, 1, 0, 1,
-0.6478027, -0.5775341, -4.188701, 0.4862745, 1, 0, 1,
-0.6451156, 1.509424, 0.35047, 0.4823529, 1, 0, 1,
-0.6440343, 1.448642, -1.033101, 0.4745098, 1, 0, 1,
-0.6440139, 0.4803022, -0.7615252, 0.4705882, 1, 0, 1,
-0.643895, -1.105635, -2.128128, 0.4627451, 1, 0, 1,
-0.6356817, -1.565418, -4.187482, 0.4588235, 1, 0, 1,
-0.6274186, 0.3825519, -2.200471, 0.4509804, 1, 0, 1,
-0.6234549, -0.3012204, -0.9378428, 0.4470588, 1, 0, 1,
-0.6208628, 1.882611, 0.629632, 0.4392157, 1, 0, 1,
-0.6163778, 1.004398, 0.7180037, 0.4352941, 1, 0, 1,
-0.6142997, 1.173049, -0.8682806, 0.427451, 1, 0, 1,
-0.6122134, 0.1416286, -0.7992865, 0.4235294, 1, 0, 1,
-0.6115122, 1.357343, -0.8814734, 0.4156863, 1, 0, 1,
-0.6105085, 0.577871, -0.7759205, 0.4117647, 1, 0, 1,
-0.6076535, -1.459176, -3.633193, 0.4039216, 1, 0, 1,
-0.6070467, 0.3477073, -2.787192, 0.3960784, 1, 0, 1,
-0.6069736, 0.08204359, -0.7458799, 0.3921569, 1, 0, 1,
-0.6066252, 1.114953, -0.3816432, 0.3843137, 1, 0, 1,
-0.6062331, -0.1303714, -1.540183, 0.3803922, 1, 0, 1,
-0.6003401, -1.357262, -4.372079, 0.372549, 1, 0, 1,
-0.5827978, -0.4322259, -2.396485, 0.3686275, 1, 0, 1,
-0.5786318, 0.3383133, -1.832514, 0.3607843, 1, 0, 1,
-0.5765777, -1.298964, -2.620572, 0.3568628, 1, 0, 1,
-0.5759782, -0.4995785, -0.7687073, 0.3490196, 1, 0, 1,
-0.5734522, -1.262374, -4.14428, 0.345098, 1, 0, 1,
-0.5658423, 0.7907335, -0.6732336, 0.3372549, 1, 0, 1,
-0.5610432, 1.442194, -1.932031, 0.3333333, 1, 0, 1,
-0.556178, 0.5344149, -2.250929, 0.3254902, 1, 0, 1,
-0.5519712, -0.8006642, -1.309212, 0.3215686, 1, 0, 1,
-0.5504717, -0.07371149, -0.83929, 0.3137255, 1, 0, 1,
-0.549915, 0.6847526, -0.5386113, 0.3098039, 1, 0, 1,
-0.547523, 1.067921, 0.7153894, 0.3019608, 1, 0, 1,
-0.5442067, 0.3439744, -2.060651, 0.2941177, 1, 0, 1,
-0.5437089, 0.5674701, -0.6759539, 0.2901961, 1, 0, 1,
-0.5404985, -1.004022, -2.991033, 0.282353, 1, 0, 1,
-0.5370929, -0.4763051, -3.373244, 0.2784314, 1, 0, 1,
-0.533366, 0.8045133, -1.594674, 0.2705882, 1, 0, 1,
-0.53215, -0.7763352, -0.8924136, 0.2666667, 1, 0, 1,
-0.5313646, 0.8729131, -0.8818359, 0.2588235, 1, 0, 1,
-0.5308649, -1.299656, -2.428351, 0.254902, 1, 0, 1,
-0.5286447, 2.060504, 0.6381047, 0.2470588, 1, 0, 1,
-0.5266156, -0.3321283, -2.575087, 0.2431373, 1, 0, 1,
-0.5252713, -0.9725921, -1.787396, 0.2352941, 1, 0, 1,
-0.5249797, 0.4560465, -1.192057, 0.2313726, 1, 0, 1,
-0.5241567, 0.7521322, -1.119698, 0.2235294, 1, 0, 1,
-0.5234609, -0.2612799, -2.883015, 0.2196078, 1, 0, 1,
-0.5228979, -0.8915778, -2.73107, 0.2117647, 1, 0, 1,
-0.5197394, 0.224888, -0.7343883, 0.2078431, 1, 0, 1,
-0.5182803, -0.001018759, -2.495265, 0.2, 1, 0, 1,
-0.5113241, 0.1619986, -1.48962, 0.1921569, 1, 0, 1,
-0.5098681, 1.651851, -0.1489192, 0.1882353, 1, 0, 1,
-0.5091321, 0.6285159, -1.560333, 0.1803922, 1, 0, 1,
-0.5059425, -0.6612321, -1.324862, 0.1764706, 1, 0, 1,
-0.5002945, 0.8149416, -0.5840284, 0.1686275, 1, 0, 1,
-0.4915631, 0.3321628, -1.059344, 0.1647059, 1, 0, 1,
-0.48735, 0.3213728, -2.926957, 0.1568628, 1, 0, 1,
-0.485234, 0.4608088, 0.07439476, 0.1529412, 1, 0, 1,
-0.484276, 1.588434, -1.698053, 0.145098, 1, 0, 1,
-0.4829823, 0.6161463, -1.602687, 0.1411765, 1, 0, 1,
-0.4826872, 0.139917, -0.5035904, 0.1333333, 1, 0, 1,
-0.4820121, 0.8940097, 0.7390771, 0.1294118, 1, 0, 1,
-0.4802164, 0.8898655, -0.9279979, 0.1215686, 1, 0, 1,
-0.4758861, -0.837871, -4.805717, 0.1176471, 1, 0, 1,
-0.4722691, 0.6882113, -2.77508, 0.1098039, 1, 0, 1,
-0.4684044, 0.6201043, -2.627827, 0.1058824, 1, 0, 1,
-0.4681951, 0.5257099, -0.6520114, 0.09803922, 1, 0, 1,
-0.4623149, -0.4422413, -3.258012, 0.09019608, 1, 0, 1,
-0.4611889, 0.2153859, -2.315978, 0.08627451, 1, 0, 1,
-0.4579048, -1.075523, -1.68102, 0.07843138, 1, 0, 1,
-0.4535991, 0.3748217, -1.319697, 0.07450981, 1, 0, 1,
-0.4493821, 1.163327, 0.7835016, 0.06666667, 1, 0, 1,
-0.4484121, 0.6958858, -0.2695743, 0.0627451, 1, 0, 1,
-0.4370634, 0.8035037, -2.545545, 0.05490196, 1, 0, 1,
-0.4328778, -1.166475, -3.499204, 0.05098039, 1, 0, 1,
-0.4318989, 0.3215111, -0.7563836, 0.04313726, 1, 0, 1,
-0.4284903, -0.3157929, -0.981663, 0.03921569, 1, 0, 1,
-0.4203676, -0.08287187, -0.8670185, 0.03137255, 1, 0, 1,
-0.4194925, -0.7117826, -0.1322156, 0.02745098, 1, 0, 1,
-0.4161792, -0.1179451, -2.795759, 0.01960784, 1, 0, 1,
-0.4156196, 2.166259, 0.1720935, 0.01568628, 1, 0, 1,
-0.4145636, 1.843503, -0.03250882, 0.007843138, 1, 0, 1,
-0.4132772, -1.117228, -0.3929407, 0.003921569, 1, 0, 1,
-0.4102526, 0.1871982, -1.644289, 0, 1, 0.003921569, 1,
-0.4102282, -0.4066775, -3.202693, 0, 1, 0.01176471, 1,
-0.4044348, -1.325106, -4.529187, 0, 1, 0.01568628, 1,
-0.3998328, 0.639922, 0.4604757, 0, 1, 0.02352941, 1,
-0.3974801, 1.004528, 0.1586656, 0, 1, 0.02745098, 1,
-0.3934777, 0.9146239, -0.7884604, 0, 1, 0.03529412, 1,
-0.3829501, 0.06302707, -0.2104244, 0, 1, 0.03921569, 1,
-0.3758404, 1.867391, 0.1900764, 0, 1, 0.04705882, 1,
-0.3749107, 0.4278956, -1.133039, 0, 1, 0.05098039, 1,
-0.3748827, -0.4013921, -1.816957, 0, 1, 0.05882353, 1,
-0.3655853, -0.9154757, -4.700137, 0, 1, 0.0627451, 1,
-0.3650748, 0.4788747, -1.336509, 0, 1, 0.07058824, 1,
-0.3649631, 2.114693, -0.7165261, 0, 1, 0.07450981, 1,
-0.3646035, 0.6886466, -0.07356352, 0, 1, 0.08235294, 1,
-0.3587019, 1.012811, -1.863651, 0, 1, 0.08627451, 1,
-0.3581054, 1.296281, 0.06351671, 0, 1, 0.09411765, 1,
-0.3573144, -1.05764, -3.866374, 0, 1, 0.1019608, 1,
-0.3550973, 0.6372911, -1.285385, 0, 1, 0.1058824, 1,
-0.3502486, 0.08098833, 0.2269202, 0, 1, 0.1137255, 1,
-0.349789, 0.3349569, -0.1298425, 0, 1, 0.1176471, 1,
-0.3478597, 0.9263478, -0.3382858, 0, 1, 0.1254902, 1,
-0.3474669, 0.6528999, -2.214433, 0, 1, 0.1294118, 1,
-0.346449, -0.2993146, -3.189561, 0, 1, 0.1372549, 1,
-0.3455624, 1.117784, -0.8792986, 0, 1, 0.1411765, 1,
-0.3438395, 0.9364743, -0.9376999, 0, 1, 0.1490196, 1,
-0.3427116, -1.889548, -2.524475, 0, 1, 0.1529412, 1,
-0.3398601, 1.35474, 0.7020779, 0, 1, 0.1607843, 1,
-0.3385275, -0.03059792, -2.301789, 0, 1, 0.1647059, 1,
-0.334032, 0.4982514, -1.239075, 0, 1, 0.172549, 1,
-0.3312988, 0.5869046, -1.825793, 0, 1, 0.1764706, 1,
-0.3312615, -0.008238624, -0.7013654, 0, 1, 0.1843137, 1,
-0.3302555, 0.8351573, 0.1603169, 0, 1, 0.1882353, 1,
-0.3280671, -1.4753, -3.475116, 0, 1, 0.1960784, 1,
-0.3262909, -1.968607, -3.443818, 0, 1, 0.2039216, 1,
-0.3233247, -1.077929, -1.513551, 0, 1, 0.2078431, 1,
-0.3218627, -0.5755112, -2.446594, 0, 1, 0.2156863, 1,
-0.3215336, -0.6065029, -4.709917, 0, 1, 0.2196078, 1,
-0.3196616, 2.376233, 0.5516598, 0, 1, 0.227451, 1,
-0.3192002, 1.756831, -1.422415, 0, 1, 0.2313726, 1,
-0.3177938, -1.753519, -1.956354, 0, 1, 0.2392157, 1,
-0.3167171, 0.6664866, 1.786236, 0, 1, 0.2431373, 1,
-0.3126327, -0.4137734, -2.011251, 0, 1, 0.2509804, 1,
-0.3125628, -1.183485, -4.393796, 0, 1, 0.254902, 1,
-0.3120305, 1.286386, 0.31262, 0, 1, 0.2627451, 1,
-0.3107012, -2.546856, -3.575001, 0, 1, 0.2666667, 1,
-0.3094873, 0.6158251, -2.395231, 0, 1, 0.2745098, 1,
-0.3093575, -1.6597, -2.758117, 0, 1, 0.2784314, 1,
-0.3084338, 1.172212, -0.6528385, 0, 1, 0.2862745, 1,
-0.3074287, 1.753131, 1.324477, 0, 1, 0.2901961, 1,
-0.3049563, -0.6483305, -2.260863, 0, 1, 0.2980392, 1,
-0.3011017, 0.4787515, -0.8932149, 0, 1, 0.3058824, 1,
-0.2978136, 0.08588845, -1.415639, 0, 1, 0.3098039, 1,
-0.2951244, -0.3887967, -1.60582, 0, 1, 0.3176471, 1,
-0.2916291, 0.6579117, -0.1204491, 0, 1, 0.3215686, 1,
-0.283627, -0.1687873, -0.448264, 0, 1, 0.3294118, 1,
-0.2801546, 0.6725308, 0.4626267, 0, 1, 0.3333333, 1,
-0.2769716, 0.8687552, 0.3583769, 0, 1, 0.3411765, 1,
-0.2683263, -1.052773, -1.502569, 0, 1, 0.345098, 1,
-0.2682126, -0.3066032, -1.857935, 0, 1, 0.3529412, 1,
-0.2619724, -1.584414, -3.797437, 0, 1, 0.3568628, 1,
-0.2596812, -0.3494544, -2.928367, 0, 1, 0.3647059, 1,
-0.2591192, -0.5420762, -2.563557, 0, 1, 0.3686275, 1,
-0.2382534, -0.3414707, -2.472321, 0, 1, 0.3764706, 1,
-0.2339953, 0.8400811, 0.5558689, 0, 1, 0.3803922, 1,
-0.2331888, -1.494047, -3.684118, 0, 1, 0.3882353, 1,
-0.2311473, 0.7095068, -0.6977792, 0, 1, 0.3921569, 1,
-0.2274502, 0.3204772, -2.281263, 0, 1, 0.4, 1,
-0.2263608, 0.2065451, -1.195927, 0, 1, 0.4078431, 1,
-0.2238898, -0.6571065, -4.419542, 0, 1, 0.4117647, 1,
-0.2219393, -1.867402, -3.345993, 0, 1, 0.4196078, 1,
-0.2183259, -0.4067244, -2.349883, 0, 1, 0.4235294, 1,
-0.216929, 0.4728694, 0.3119449, 0, 1, 0.4313726, 1,
-0.2097817, 1.380317, 2.016011, 0, 1, 0.4352941, 1,
-0.2090094, 0.140598, -1.319944, 0, 1, 0.4431373, 1,
-0.1999163, -0.04686301, -1.272608, 0, 1, 0.4470588, 1,
-0.1988839, -0.4587524, -2.416912, 0, 1, 0.454902, 1,
-0.1985651, 1.012422, -0.6732134, 0, 1, 0.4588235, 1,
-0.1983485, 0.1572456, -2.692258, 0, 1, 0.4666667, 1,
-0.1941872, 0.6026999, -0.437699, 0, 1, 0.4705882, 1,
-0.1919815, -1.062602, -2.930885, 0, 1, 0.4784314, 1,
-0.1916744, -1.971095, -2.962134, 0, 1, 0.4823529, 1,
-0.1911378, -1.225144, -3.601942, 0, 1, 0.4901961, 1,
-0.1844082, -0.5526727, -2.500075, 0, 1, 0.4941176, 1,
-0.1832796, 0.8395885, -0.3271382, 0, 1, 0.5019608, 1,
-0.1816743, 1.497728, 1.337718, 0, 1, 0.509804, 1,
-0.1813475, 1.699531, 0.6724876, 0, 1, 0.5137255, 1,
-0.1812445, 0.9730919, 1.069463, 0, 1, 0.5215687, 1,
-0.1811176, -1.081433, -1.803467, 0, 1, 0.5254902, 1,
-0.1764968, 0.7078903, 1.020373, 0, 1, 0.5333334, 1,
-0.1762764, -1.063642, -3.612023, 0, 1, 0.5372549, 1,
-0.1751674, -0.280125, -1.256387, 0, 1, 0.5450981, 1,
-0.1734088, -0.3338448, -2.545181, 0, 1, 0.5490196, 1,
-0.1721448, -0.874772, -2.325759, 0, 1, 0.5568628, 1,
-0.1683886, -0.7442592, -2.467663, 0, 1, 0.5607843, 1,
-0.1654878, -0.1298499, -2.997922, 0, 1, 0.5686275, 1,
-0.1645249, 1.601704, -0.4254881, 0, 1, 0.572549, 1,
-0.1610296, -0.4419769, -2.594283, 0, 1, 0.5803922, 1,
-0.1586609, 0.05253005, -1.17373, 0, 1, 0.5843138, 1,
-0.158024, -1.783472, -3.363168, 0, 1, 0.5921569, 1,
-0.1569459, 0.1774924, -0.6046663, 0, 1, 0.5960785, 1,
-0.1551538, 0.1616528, -1.835981, 0, 1, 0.6039216, 1,
-0.1530893, 0.4516672, -2.000109, 0, 1, 0.6117647, 1,
-0.1475263, -0.4543136, -2.882353, 0, 1, 0.6156863, 1,
-0.1430178, 1.175565, 1.418415, 0, 1, 0.6235294, 1,
-0.1413586, 1.339149, 1.082644, 0, 1, 0.627451, 1,
-0.1393569, -0.4542086, -1.523082, 0, 1, 0.6352941, 1,
-0.1388749, 0.7420289, 0.4732536, 0, 1, 0.6392157, 1,
-0.1366625, 0.6032078, -0.8217946, 0, 1, 0.6470588, 1,
-0.1295242, 0.630793, 1.1721, 0, 1, 0.6509804, 1,
-0.1287474, 0.0924615, -2.018065, 0, 1, 0.6588235, 1,
-0.1231816, 0.6966816, -0.7869048, 0, 1, 0.6627451, 1,
-0.1207012, 0.2727919, 0.4776857, 0, 1, 0.6705883, 1,
-0.1181662, -1.291036, -4.448919, 0, 1, 0.6745098, 1,
-0.1174877, 1.85346, -0.8625713, 0, 1, 0.682353, 1,
-0.1155813, -0.09648125, -4.543841, 0, 1, 0.6862745, 1,
-0.1126998, -0.1648579, -2.144981, 0, 1, 0.6941177, 1,
-0.1097633, 0.7282764, 0.1498674, 0, 1, 0.7019608, 1,
-0.1050379, 0.54696, -0.8642002, 0, 1, 0.7058824, 1,
-0.1018449, -0.05086201, -1.747807, 0, 1, 0.7137255, 1,
-0.1014089, 1.650347, -1.170489, 0, 1, 0.7176471, 1,
-0.09886773, 1.521422, 0.3839185, 0, 1, 0.7254902, 1,
-0.09809578, 1.013218, -0.9993175, 0, 1, 0.7294118, 1,
-0.09756961, 0.5516664, -0.05355548, 0, 1, 0.7372549, 1,
-0.09418038, -0.1235592, -2.288002, 0, 1, 0.7411765, 1,
-0.09287345, 0.7290189, 0.3116411, 0, 1, 0.7490196, 1,
-0.08857064, 0.9444184, -0.6568487, 0, 1, 0.7529412, 1,
-0.08787118, 1.443593, -1.882558, 0, 1, 0.7607843, 1,
-0.08708752, -0.6803152, -2.483761, 0, 1, 0.7647059, 1,
-0.08495653, 0.9054012, -1.135461, 0, 1, 0.772549, 1,
-0.08367938, 1.121827, -0.09449324, 0, 1, 0.7764706, 1,
-0.07795205, 0.5257512, -0.922429, 0, 1, 0.7843137, 1,
-0.07718316, 1.509751, -0.588988, 0, 1, 0.7882353, 1,
-0.0767571, -0.2288526, -2.569369, 0, 1, 0.7960784, 1,
-0.07639594, -0.1174943, -2.224759, 0, 1, 0.8039216, 1,
-0.073851, 1.539622, -0.2675214, 0, 1, 0.8078431, 1,
-0.07305876, 0.9260027, -0.1279864, 0, 1, 0.8156863, 1,
-0.07301336, 0.5575362, 1.36168, 0, 1, 0.8196079, 1,
-0.07005624, -1.153716, -3.82025, 0, 1, 0.827451, 1,
-0.06487909, -0.3218019, -1.721815, 0, 1, 0.8313726, 1,
-0.06366876, 0.7661247, -0.5535159, 0, 1, 0.8392157, 1,
-0.06331639, -0.2359531, -4.944396, 0, 1, 0.8431373, 1,
-0.06139303, 0.2281007, -0.01335019, 0, 1, 0.8509804, 1,
-0.06052143, -0.06505565, -2.957079, 0, 1, 0.854902, 1,
-0.05706857, -0.6892735, -3.94674, 0, 1, 0.8627451, 1,
-0.05630117, -0.3581762, -2.090502, 0, 1, 0.8666667, 1,
-0.05290864, 2.468546, 1.791082, 0, 1, 0.8745098, 1,
-0.0527929, -0.7698587, -2.887805, 0, 1, 0.8784314, 1,
-0.05154396, 0.9244085, -1.111657, 0, 1, 0.8862745, 1,
-0.05015338, -0.5785969, -3.300218, 0, 1, 0.8901961, 1,
-0.04820165, -0.3572778, -4.253527, 0, 1, 0.8980392, 1,
-0.04574031, 0.1820873, -1.112013, 0, 1, 0.9058824, 1,
-0.03917656, 2.277097, -0.818745, 0, 1, 0.9098039, 1,
-0.03139506, 0.9123394, 1.312503, 0, 1, 0.9176471, 1,
-0.02770156, -0.8534611, -3.198686, 0, 1, 0.9215686, 1,
-0.02072017, -1.669167, -4.307152, 0, 1, 0.9294118, 1,
-0.02056942, -0.004126262, -2.509423, 0, 1, 0.9333333, 1,
-0.01740992, 0.04741648, -0.2044723, 0, 1, 0.9411765, 1,
-0.0114739, -0.5094309, -2.356001, 0, 1, 0.945098, 1,
-0.0107252, 2.336906, 0.06882899, 0, 1, 0.9529412, 1,
-0.008047787, 0.6397243, -0.7368463, 0, 1, 0.9568627, 1,
-0.005201234, 1.062343, 0.1315162, 0, 1, 0.9647059, 1,
-0.004249525, 0.420252, 1.475353, 0, 1, 0.9686275, 1,
-0.0007342044, 0.08101188, -1.967061, 0, 1, 0.9764706, 1,
0.003073552, 0.900449, 0.4947373, 0, 1, 0.9803922, 1,
0.004493981, -0.1108875, 4.372497, 0, 1, 0.9882353, 1,
0.004877294, -2.244756, 2.431679, 0, 1, 0.9921569, 1,
0.01239893, -0.5615193, 0.1866102, 0, 1, 1, 1,
0.01349391, 0.5062639, 1.051733, 0, 0.9921569, 1, 1,
0.01387173, 1.245399, 0.4703688, 0, 0.9882353, 1, 1,
0.01707081, -0.1537233, 4.219217, 0, 0.9803922, 1, 1,
0.01975876, 1.690049, 1.480425, 0, 0.9764706, 1, 1,
0.0220359, -0.7788953, 3.212902, 0, 0.9686275, 1, 1,
0.02227173, 0.2787448, -0.1612539, 0, 0.9647059, 1, 1,
0.02445694, 0.1929817, 2.389826, 0, 0.9568627, 1, 1,
0.02841641, -0.09797554, 2.419586, 0, 0.9529412, 1, 1,
0.03247475, 0.7051859, -0.2853157, 0, 0.945098, 1, 1,
0.03318698, 2.448559, -0.8859112, 0, 0.9411765, 1, 1,
0.03331409, 0.3537913, -1.484493, 0, 0.9333333, 1, 1,
0.03705183, -0.4525802, 3.401414, 0, 0.9294118, 1, 1,
0.03858609, -0.5130709, 2.833583, 0, 0.9215686, 1, 1,
0.03893058, -0.9622627, 2.280342, 0, 0.9176471, 1, 1,
0.04228052, 0.1740347, -0.6636823, 0, 0.9098039, 1, 1,
0.0430584, 0.7656917, -0.5143858, 0, 0.9058824, 1, 1,
0.04410251, -0.5840665, 2.376245, 0, 0.8980392, 1, 1,
0.04685824, -0.761677, 3.086585, 0, 0.8901961, 1, 1,
0.05694311, -0.4258676, 3.564492, 0, 0.8862745, 1, 1,
0.05980633, 0.3716829, -2.110564, 0, 0.8784314, 1, 1,
0.06346802, -0.155909, 1.296136, 0, 0.8745098, 1, 1,
0.06458019, 1.811362, -0.5160615, 0, 0.8666667, 1, 1,
0.06469773, -0.7729588, 1.892855, 0, 0.8627451, 1, 1,
0.07706504, -0.07936212, 0.7849393, 0, 0.854902, 1, 1,
0.07823459, 0.1330488, 0.04567223, 0, 0.8509804, 1, 1,
0.0791946, 0.3335281, 0.267821, 0, 0.8431373, 1, 1,
0.07972101, 1.047872, -2.015893, 0, 0.8392157, 1, 1,
0.08096148, -0.6180389, 3.440116, 0, 0.8313726, 1, 1,
0.08927826, 1.215106, -1.645513, 0, 0.827451, 1, 1,
0.09696254, -0.3947859, 2.700929, 0, 0.8196079, 1, 1,
0.101789, -0.7173889, 2.422324, 0, 0.8156863, 1, 1,
0.1018634, 0.4685982, -0.145592, 0, 0.8078431, 1, 1,
0.1026311, -0.4310683, 2.406053, 0, 0.8039216, 1, 1,
0.1042644, -0.3581463, 3.07617, 0, 0.7960784, 1, 1,
0.1073764, -0.2292731, 2.347421, 0, 0.7882353, 1, 1,
0.1091097, -0.4310861, 1.922753, 0, 0.7843137, 1, 1,
0.1142466, 1.428881, 1.759502, 0, 0.7764706, 1, 1,
0.1142562, -1.197506, 2.87683, 0, 0.772549, 1, 1,
0.1169249, -0.1709494, 0.3276569, 0, 0.7647059, 1, 1,
0.1197978, 1.613899, -0.3402479, 0, 0.7607843, 1, 1,
0.120827, -1.268437, 3.589327, 0, 0.7529412, 1, 1,
0.1219058, 0.9274117, 2.341583, 0, 0.7490196, 1, 1,
0.1250774, -0.0592048, 1.2322, 0, 0.7411765, 1, 1,
0.135735, -0.8451587, 2.303456, 0, 0.7372549, 1, 1,
0.136107, -0.351591, 2.122241, 0, 0.7294118, 1, 1,
0.1404866, 2.437349, 0.6911515, 0, 0.7254902, 1, 1,
0.1421149, -1.950306, 2.221375, 0, 0.7176471, 1, 1,
0.1442137, 0.9117607, 0.9265675, 0, 0.7137255, 1, 1,
0.1486725, 0.4039294, 1.198679, 0, 0.7058824, 1, 1,
0.1523153, -0.3730455, 2.41777, 0, 0.6980392, 1, 1,
0.1557078, 1.137622, 0.2243723, 0, 0.6941177, 1, 1,
0.1582064, -1.057174, 3.450962, 0, 0.6862745, 1, 1,
0.1598533, -1.083584, 2.506335, 0, 0.682353, 1, 1,
0.1629261, -0.5778536, 2.737206, 0, 0.6745098, 1, 1,
0.1635204, -1.039204, 3.260917, 0, 0.6705883, 1, 1,
0.1655961, 0.6320794, 1.131, 0, 0.6627451, 1, 1,
0.1696282, -1.058898, 1.447124, 0, 0.6588235, 1, 1,
0.1702244, -1.454666, 1.762296, 0, 0.6509804, 1, 1,
0.1723722, -1.267517, 5.863354, 0, 0.6470588, 1, 1,
0.1757505, 1.660112, -2.678829, 0, 0.6392157, 1, 1,
0.1765875, -0.6075866, 2.99879, 0, 0.6352941, 1, 1,
0.1774923, 0.7398232, -0.1691516, 0, 0.627451, 1, 1,
0.1800097, -1.701991, 3.242699, 0, 0.6235294, 1, 1,
0.1875888, 0.5149685, 1.083898, 0, 0.6156863, 1, 1,
0.191543, -0.4640018, 1.40026, 0, 0.6117647, 1, 1,
0.1923742, -0.4710824, 3.417531, 0, 0.6039216, 1, 1,
0.1930366, 0.002830365, 1.217545, 0, 0.5960785, 1, 1,
0.1937137, 0.4316248, 1.862, 0, 0.5921569, 1, 1,
0.1974608, -1.772799, 1.638631, 0, 0.5843138, 1, 1,
0.1979752, 0.8228914, -0.2037475, 0, 0.5803922, 1, 1,
0.1980932, 1.777405, 0.4233192, 0, 0.572549, 1, 1,
0.2007313, 0.382618, 1.659127, 0, 0.5686275, 1, 1,
0.201818, -0.1495789, 1.327527, 0, 0.5607843, 1, 1,
0.2071456, -0.06064319, 3.664664, 0, 0.5568628, 1, 1,
0.2088201, -1.483941, 3.87929, 0, 0.5490196, 1, 1,
0.2089554, -1.740127, 2.012151, 0, 0.5450981, 1, 1,
0.2134858, -0.321403, 3.414265, 0, 0.5372549, 1, 1,
0.213655, 0.9147412, 0.750684, 0, 0.5333334, 1, 1,
0.2174003, -0.2117201, 1.510191, 0, 0.5254902, 1, 1,
0.2188131, 1.812268, 0.3899103, 0, 0.5215687, 1, 1,
0.2195326, -1.896042, 3.313697, 0, 0.5137255, 1, 1,
0.2218687, -1.06794, 3.453743, 0, 0.509804, 1, 1,
0.2224358, 1.799495, 0.6856098, 0, 0.5019608, 1, 1,
0.2228224, 0.3250572, 1.462887, 0, 0.4941176, 1, 1,
0.2249718, 0.4508979, 1.150458, 0, 0.4901961, 1, 1,
0.2256083, 0.1041835, 2.303581, 0, 0.4823529, 1, 1,
0.2285313, 0.3856256, 1.462378, 0, 0.4784314, 1, 1,
0.2320718, 0.4103409, -1.135463, 0, 0.4705882, 1, 1,
0.232127, 0.2908458, 2.085257, 0, 0.4666667, 1, 1,
0.2325169, -0.7859259, 3.532055, 0, 0.4588235, 1, 1,
0.2328681, -0.3598935, 3.000519, 0, 0.454902, 1, 1,
0.2333999, 0.4523156, 2.366639, 0, 0.4470588, 1, 1,
0.2350085, -0.8034179, 0.9696488, 0, 0.4431373, 1, 1,
0.2362523, 0.4801079, -0.9654883, 0, 0.4352941, 1, 1,
0.2365666, -0.08824409, 2.795646, 0, 0.4313726, 1, 1,
0.2368288, -0.3241908, 3.378282, 0, 0.4235294, 1, 1,
0.2394988, 0.07127925, 0.8706177, 0, 0.4196078, 1, 1,
0.2416258, 0.7484972, -1.435223, 0, 0.4117647, 1, 1,
0.2440994, -2.423051, 3.869618, 0, 0.4078431, 1, 1,
0.2472317, -0.2542002, 2.460963, 0, 0.4, 1, 1,
0.2499878, 2.250901, -2.480988, 0, 0.3921569, 1, 1,
0.2541807, -0.2288258, 2.146106, 0, 0.3882353, 1, 1,
0.2618831, -0.4634756, 3.067844, 0, 0.3803922, 1, 1,
0.2672681, 0.7933546, 1.70133, 0, 0.3764706, 1, 1,
0.2689158, 0.464308, 1.106215, 0, 0.3686275, 1, 1,
0.2692852, -1.800744, 3.734532, 0, 0.3647059, 1, 1,
0.2701027, 0.9621783, 0.1036128, 0, 0.3568628, 1, 1,
0.2708758, 0.6802695, 2.352557, 0, 0.3529412, 1, 1,
0.2752454, -1.020962, 0.834134, 0, 0.345098, 1, 1,
0.2753705, 1.627068, 0.4563272, 0, 0.3411765, 1, 1,
0.2789838, -0.2873272, 1.770827, 0, 0.3333333, 1, 1,
0.288813, -0.8725143, 0.3894864, 0, 0.3294118, 1, 1,
0.2933592, 0.005586257, 0.8710675, 0, 0.3215686, 1, 1,
0.2938173, -1.182387, 2.260768, 0, 0.3176471, 1, 1,
0.2959503, -0.6485026, 3.708678, 0, 0.3098039, 1, 1,
0.3037821, 0.08671376, 1.063323, 0, 0.3058824, 1, 1,
0.3051667, 1.371196, 1.426537, 0, 0.2980392, 1, 1,
0.3058969, 0.9451609, 0.860647, 0, 0.2901961, 1, 1,
0.3085118, -0.2969985, 1.531842, 0, 0.2862745, 1, 1,
0.309355, 0.8423448, 1.104874, 0, 0.2784314, 1, 1,
0.3116233, -0.3650275, 2.644919, 0, 0.2745098, 1, 1,
0.3147225, -0.532023, 2.532683, 0, 0.2666667, 1, 1,
0.3252012, 1.241765, 0.9347895, 0, 0.2627451, 1, 1,
0.3256727, -1.402375, 4.248179, 0, 0.254902, 1, 1,
0.3258556, 0.6818416, -0.7778966, 0, 0.2509804, 1, 1,
0.3322183, 0.1562799, 2.621235, 0, 0.2431373, 1, 1,
0.3339413, -0.4089943, 4.498672, 0, 0.2392157, 1, 1,
0.3396754, 0.2142369, -1.107055, 0, 0.2313726, 1, 1,
0.3412897, 0.4831489, -0.4230085, 0, 0.227451, 1, 1,
0.3438682, 0.4406437, 0.2600567, 0, 0.2196078, 1, 1,
0.3530207, -0.0187243, 1.495405, 0, 0.2156863, 1, 1,
0.3589048, -0.9870898, 3.173929, 0, 0.2078431, 1, 1,
0.3610398, -1.192167, 3.907709, 0, 0.2039216, 1, 1,
0.3634014, 0.3525343, 1.358078, 0, 0.1960784, 1, 1,
0.3644327, 1.890527, 0.6402003, 0, 0.1882353, 1, 1,
0.36791, -1.326989, 3.255862, 0, 0.1843137, 1, 1,
0.3693384, 0.1887887, 0.2853146, 0, 0.1764706, 1, 1,
0.3725611, 2.071251, 0.801762, 0, 0.172549, 1, 1,
0.3751129, -0.2662818, 2.414899, 0, 0.1647059, 1, 1,
0.3785725, 1.222104, 0.9557695, 0, 0.1607843, 1, 1,
0.3813471, 0.8058547, -0.2543655, 0, 0.1529412, 1, 1,
0.383217, -0.503351, 3.181133, 0, 0.1490196, 1, 1,
0.3904836, 0.8061072, 1.092832, 0, 0.1411765, 1, 1,
0.3911869, -0.5636237, 1.948335, 0, 0.1372549, 1, 1,
0.3919846, 0.2066767, 0.9024518, 0, 0.1294118, 1, 1,
0.3919921, 0.01896167, 1.804422, 0, 0.1254902, 1, 1,
0.4042268, -0.391881, 3.478799, 0, 0.1176471, 1, 1,
0.4076716, -0.8628884, 3.261252, 0, 0.1137255, 1, 1,
0.4099708, 0.0001579074, 1.711369, 0, 0.1058824, 1, 1,
0.4101253, 1.161286, 0.4882861, 0, 0.09803922, 1, 1,
0.4118495, -0.03034203, 2.947607, 0, 0.09411765, 1, 1,
0.4119823, -2.208286, 2.275675, 0, 0.08627451, 1, 1,
0.4123161, 0.9765341, 0.1425349, 0, 0.08235294, 1, 1,
0.4136084, 1.199573, -1.1377, 0, 0.07450981, 1, 1,
0.4144675, 0.9257342, 1.153867, 0, 0.07058824, 1, 1,
0.4193163, 0.3461488, 0.4243108, 0, 0.0627451, 1, 1,
0.4210106, -0.8902379, 2.093555, 0, 0.05882353, 1, 1,
0.4399619, 0.5204638, 1.454144, 0, 0.05098039, 1, 1,
0.4422922, -0.8604567, 3.301301, 0, 0.04705882, 1, 1,
0.4432072, 0.2722839, 2.49936, 0, 0.03921569, 1, 1,
0.4456295, 0.2712764, 1.072824, 0, 0.03529412, 1, 1,
0.4459645, 1.416343, -0.4419583, 0, 0.02745098, 1, 1,
0.4499054, 0.05289766, 2.248501, 0, 0.02352941, 1, 1,
0.451908, -0.180607, 0.3832484, 0, 0.01568628, 1, 1,
0.4521016, -1.20989, 1.038196, 0, 0.01176471, 1, 1,
0.4522096, -0.01891512, 1.92003, 0, 0.003921569, 1, 1,
0.4566203, 0.1455373, 2.8346, 0.003921569, 0, 1, 1,
0.4595836, 0.5977492, -0.4949711, 0.007843138, 0, 1, 1,
0.4624783, -1.654409, 2.649621, 0.01568628, 0, 1, 1,
0.4625351, 0.884547, -0.2049227, 0.01960784, 0, 1, 1,
0.4650745, 0.5723244, -0.3426457, 0.02745098, 0, 1, 1,
0.4651124, -0.3228616, 1.943795, 0.03137255, 0, 1, 1,
0.4727628, -0.4858834, 2.064308, 0.03921569, 0, 1, 1,
0.4727805, -0.3510964, 0.6745294, 0.04313726, 0, 1, 1,
0.475884, 0.001095615, 1.449045, 0.05098039, 0, 1, 1,
0.4781928, 0.04559732, 0.9130347, 0.05490196, 0, 1, 1,
0.479863, 1.53895, -0.7981609, 0.0627451, 0, 1, 1,
0.481817, 0.03481052, 2.46431, 0.06666667, 0, 1, 1,
0.4842632, -0.1915069, 3.522639, 0.07450981, 0, 1, 1,
0.4856502, 0.321547, 0.8941135, 0.07843138, 0, 1, 1,
0.4860568, -2.039695, 3.738016, 0.08627451, 0, 1, 1,
0.4895502, 0.3667622, 1.332837, 0.09019608, 0, 1, 1,
0.4984976, 1.408049, 0.2503618, 0.09803922, 0, 1, 1,
0.5052623, -1.33307, 3.792398, 0.1058824, 0, 1, 1,
0.5059579, 1.188635, 0.9888355, 0.1098039, 0, 1, 1,
0.5060813, -0.5710467, 2.777455, 0.1176471, 0, 1, 1,
0.5062383, -0.5370354, 1.405269, 0.1215686, 0, 1, 1,
0.5081359, 0.1993667, 0.5403665, 0.1294118, 0, 1, 1,
0.5091919, -0.1886386, 1.602234, 0.1333333, 0, 1, 1,
0.5124972, -1.12424, 2.546086, 0.1411765, 0, 1, 1,
0.5182067, 1.545935, -0.4980278, 0.145098, 0, 1, 1,
0.5195271, -1.029631, 4.19971, 0.1529412, 0, 1, 1,
0.5209975, -0.5918999, 1.666576, 0.1568628, 0, 1, 1,
0.5212647, 1.090469, 2.206992, 0.1647059, 0, 1, 1,
0.5213378, -0.4699823, 3.401276, 0.1686275, 0, 1, 1,
0.5230494, 0.525003, -1.049516, 0.1764706, 0, 1, 1,
0.5241379, 0.8918929, 1.432627, 0.1803922, 0, 1, 1,
0.5304779, 0.09889545, 0.4896235, 0.1882353, 0, 1, 1,
0.5346904, -2.55315, 3.425207, 0.1921569, 0, 1, 1,
0.5404283, 0.2417127, 1.239377, 0.2, 0, 1, 1,
0.5446289, -1.265849, 1.383035, 0.2078431, 0, 1, 1,
0.5523448, -0.2380183, 1.912379, 0.2117647, 0, 1, 1,
0.5544866, -1.633353, 4.116998, 0.2196078, 0, 1, 1,
0.5548527, 0.0768919, -0.2718368, 0.2235294, 0, 1, 1,
0.5595646, 1.315031, 1.469491, 0.2313726, 0, 1, 1,
0.5605687, 1.537544, -0.2091227, 0.2352941, 0, 1, 1,
0.5610662, 0.08759903, 0.6144831, 0.2431373, 0, 1, 1,
0.5615109, -1.611462, 2.501857, 0.2470588, 0, 1, 1,
0.5615712, -0.6732743, 1.925042, 0.254902, 0, 1, 1,
0.5624366, 0.1479952, 1.495542, 0.2588235, 0, 1, 1,
0.5647256, -0.5817836, 3.683526, 0.2666667, 0, 1, 1,
0.5673209, -1.715447, 1.474491, 0.2705882, 0, 1, 1,
0.5733995, 0.5492103, 0.8718911, 0.2784314, 0, 1, 1,
0.5777475, -0.9361464, 2.425731, 0.282353, 0, 1, 1,
0.5781891, 0.5869435, 1.665325, 0.2901961, 0, 1, 1,
0.5796081, 0.9753645, 0.4820177, 0.2941177, 0, 1, 1,
0.581428, 1.264002, 1.476563, 0.3019608, 0, 1, 1,
0.5846869, 0.7066199, 0.407902, 0.3098039, 0, 1, 1,
0.5883719, -0.7461074, 4.500134, 0.3137255, 0, 1, 1,
0.5901838, 1.665861, 2.165024, 0.3215686, 0, 1, 1,
0.6005781, 0.1906144, 1.803382, 0.3254902, 0, 1, 1,
0.6042854, -0.2951831, 1.934156, 0.3333333, 0, 1, 1,
0.6051401, -0.08559189, 1.544367, 0.3372549, 0, 1, 1,
0.6055852, -1.283108, 2.706593, 0.345098, 0, 1, 1,
0.6099041, -0.1219817, 1.509081, 0.3490196, 0, 1, 1,
0.6116569, -0.456962, 1.811837, 0.3568628, 0, 1, 1,
0.6284233, 0.7533904, 1.591275, 0.3607843, 0, 1, 1,
0.6360208, 0.1289512, 1.062949, 0.3686275, 0, 1, 1,
0.6360725, -0.5569324, 1.659347, 0.372549, 0, 1, 1,
0.6381758, 0.03089761, 0.4579114, 0.3803922, 0, 1, 1,
0.6419741, -0.2761259, 1.574143, 0.3843137, 0, 1, 1,
0.6464567, -0.3108726, 2.611104, 0.3921569, 0, 1, 1,
0.6466655, 0.1675913, 0.9264476, 0.3960784, 0, 1, 1,
0.6511892, -1.585667, 1.489646, 0.4039216, 0, 1, 1,
0.6519094, 0.0383837, 1.642628, 0.4117647, 0, 1, 1,
0.6575042, 0.9428005, 2.293402, 0.4156863, 0, 1, 1,
0.6576679, 1.516171, 0.08663299, 0.4235294, 0, 1, 1,
0.6606804, 0.8955063, 1.147391, 0.427451, 0, 1, 1,
0.6613923, 1.424893, 2.121301, 0.4352941, 0, 1, 1,
0.6635525, 0.8530768, -0.01683183, 0.4392157, 0, 1, 1,
0.6665161, -0.1914634, 2.505693, 0.4470588, 0, 1, 1,
0.6707997, 0.5851234, -0.3061222, 0.4509804, 0, 1, 1,
0.6717255, 0.04096127, 0.6054577, 0.4588235, 0, 1, 1,
0.6721959, -0.4030817, 0.4383959, 0.4627451, 0, 1, 1,
0.6752136, -1.067905, 1.499037, 0.4705882, 0, 1, 1,
0.6829293, 0.7084437, 1.227749, 0.4745098, 0, 1, 1,
0.6829619, -1.213952, 1.834722, 0.4823529, 0, 1, 1,
0.683621, -0.4039079, 1.606399, 0.4862745, 0, 1, 1,
0.6841285, 0.9815488, 0.01756838, 0.4941176, 0, 1, 1,
0.6865028, 0.6231747, 0.908346, 0.5019608, 0, 1, 1,
0.6869223, 0.1465064, 1.762715, 0.5058824, 0, 1, 1,
0.6948902, -1.408658, 3.346367, 0.5137255, 0, 1, 1,
0.6967052, 0.9224861, 1.077229, 0.5176471, 0, 1, 1,
0.7007864, -0.7742035, 3.345848, 0.5254902, 0, 1, 1,
0.7019293, 0.619871, 1.708449, 0.5294118, 0, 1, 1,
0.7033364, 0.6661893, 1.503041, 0.5372549, 0, 1, 1,
0.7036766, 0.3308573, 0.8171031, 0.5411765, 0, 1, 1,
0.7050826, 0.1289617, 1.39409, 0.5490196, 0, 1, 1,
0.7054138, -0.09457894, 2.469614, 0.5529412, 0, 1, 1,
0.706441, 0.2763174, 1.37152, 0.5607843, 0, 1, 1,
0.7097456, -0.9255492, 1.639041, 0.5647059, 0, 1, 1,
0.7109473, 0.05563062, 2.00379, 0.572549, 0, 1, 1,
0.715376, -0.4011199, 2.068875, 0.5764706, 0, 1, 1,
0.7161624, -1.144389, 4.018521, 0.5843138, 0, 1, 1,
0.7178091, -0.5412731, 1.135294, 0.5882353, 0, 1, 1,
0.7191097, 1.025692, 1.628511, 0.5960785, 0, 1, 1,
0.7217208, 1.754041, 0.8158317, 0.6039216, 0, 1, 1,
0.7233214, 1.245118, -0.7824339, 0.6078432, 0, 1, 1,
0.7236798, -1.163023, 4.872088, 0.6156863, 0, 1, 1,
0.7286956, 1.258674, -0.001798912, 0.6196079, 0, 1, 1,
0.7320564, -1.240433, 2.854144, 0.627451, 0, 1, 1,
0.7325701, -0.6526711, 1.216014, 0.6313726, 0, 1, 1,
0.7366721, 0.01567951, -1.100508, 0.6392157, 0, 1, 1,
0.7398213, 3.444666, -0.3622701, 0.6431373, 0, 1, 1,
0.746896, 0.3618684, 2.882303, 0.6509804, 0, 1, 1,
0.7475117, 1.613926, 1.445618, 0.654902, 0, 1, 1,
0.748552, -0.1596271, 3.079037, 0.6627451, 0, 1, 1,
0.7503281, -0.6433929, 1.933171, 0.6666667, 0, 1, 1,
0.7508118, -1.746521, 0.9991672, 0.6745098, 0, 1, 1,
0.7532192, 0.08765057, 1.999355, 0.6784314, 0, 1, 1,
0.7546996, 0.479214, 0.7953457, 0.6862745, 0, 1, 1,
0.7549323, 0.7027169, 0.3868466, 0.6901961, 0, 1, 1,
0.7581238, -0.5356844, 3.252241, 0.6980392, 0, 1, 1,
0.7603022, 0.4050088, 1.194416, 0.7058824, 0, 1, 1,
0.7729818, -1.601747, 2.809381, 0.7098039, 0, 1, 1,
0.773727, 0.3075776, 1.187694, 0.7176471, 0, 1, 1,
0.7741401, -1.467548, 0.8087419, 0.7215686, 0, 1, 1,
0.7856153, 0.3184713, 0.2744342, 0.7294118, 0, 1, 1,
0.7858765, -0.3543732, 2.434341, 0.7333333, 0, 1, 1,
0.7862237, -0.6655382, 1.882441, 0.7411765, 0, 1, 1,
0.7879598, 0.5928584, 0.9586783, 0.7450981, 0, 1, 1,
0.7923802, -1.495799, 1.922991, 0.7529412, 0, 1, 1,
0.7965744, 1.44698, 0.4988156, 0.7568628, 0, 1, 1,
0.8039602, 0.1337172, 2.816486, 0.7647059, 0, 1, 1,
0.8052473, 0.507219, -1.207844, 0.7686275, 0, 1, 1,
0.8066048, 0.5533777, 1.339716, 0.7764706, 0, 1, 1,
0.8098045, -1.180721, 1.906974, 0.7803922, 0, 1, 1,
0.8099082, -0.5485489, 1.699799, 0.7882353, 0, 1, 1,
0.8128573, -0.4543205, 3.007374, 0.7921569, 0, 1, 1,
0.8150954, 0.6154794, 3.774652, 0.8, 0, 1, 1,
0.8159406, -0.215359, 0.9052944, 0.8078431, 0, 1, 1,
0.8184691, 1.049226, 0.5316767, 0.8117647, 0, 1, 1,
0.820026, -0.7827722, 1.795446, 0.8196079, 0, 1, 1,
0.8200839, 0.3092658, 2.53843, 0.8235294, 0, 1, 1,
0.8379418, 0.8507621, 1.221784, 0.8313726, 0, 1, 1,
0.8388674, 0.7132487, 0.65206, 0.8352941, 0, 1, 1,
0.8442507, -1.527596, 1.415716, 0.8431373, 0, 1, 1,
0.8469632, 0.4533599, 0.552062, 0.8470588, 0, 1, 1,
0.8491784, -1.200644, 3.203591, 0.854902, 0, 1, 1,
0.8523204, -0.3641391, 1.03589, 0.8588235, 0, 1, 1,
0.8576297, -0.6455472, 0.8821362, 0.8666667, 0, 1, 1,
0.8591731, -1.220784, 2.698219, 0.8705882, 0, 1, 1,
0.8648538, 1.519678, -0.1373397, 0.8784314, 0, 1, 1,
0.8721577, 0.9797618, 2.971023, 0.8823529, 0, 1, 1,
0.8780206, 0.1863066, 3.891324, 0.8901961, 0, 1, 1,
0.8801717, -1.232023, 2.238231, 0.8941177, 0, 1, 1,
0.884875, 0.1443341, 0.8963041, 0.9019608, 0, 1, 1,
0.8852626, -0.02105105, 0.6598091, 0.9098039, 0, 1, 1,
0.8863212, -0.6738174, 2.293736, 0.9137255, 0, 1, 1,
0.8915619, 0.3650455, 1.054575, 0.9215686, 0, 1, 1,
0.8931653, 0.9093861, 2.159129, 0.9254902, 0, 1, 1,
0.8965895, 0.2210738, 1.254801, 0.9333333, 0, 1, 1,
0.8972985, 1.090864, -1.477113, 0.9372549, 0, 1, 1,
0.8989609, 0.7284701, 2.459705, 0.945098, 0, 1, 1,
0.8990854, -0.3662805, 1.978937, 0.9490196, 0, 1, 1,
0.8999915, 0.9687335, 1.300014, 0.9568627, 0, 1, 1,
0.9035829, -1.472824, 1.664359, 0.9607843, 0, 1, 1,
0.90681, 1.520704, -0.7390935, 0.9686275, 0, 1, 1,
0.9077754, 1.351798, 0.7767393, 0.972549, 0, 1, 1,
0.9090809, -0.6980333, 1.047866, 0.9803922, 0, 1, 1,
0.9182662, -1.267338, 1.249896, 0.9843137, 0, 1, 1,
0.9204935, 1.281789, 0.9568853, 0.9921569, 0, 1, 1,
0.9207409, -1.497713, 1.819636, 0.9960784, 0, 1, 1,
0.9210109, 0.4977082, 2.728169, 1, 0, 0.9960784, 1,
0.9278546, 1.213679, 0.4883876, 1, 0, 0.9882353, 1,
0.9314615, 0.8682526, 1.930597, 1, 0, 0.9843137, 1,
0.9360637, 0.1848194, 2.099361, 1, 0, 0.9764706, 1,
0.9393049, -0.2743555, 2.643533, 1, 0, 0.972549, 1,
0.9407697, -0.2752315, 1.004778, 1, 0, 0.9647059, 1,
0.9421474, -1.176903, 2.554192, 1, 0, 0.9607843, 1,
0.9498332, -1.203294, 3.817635, 1, 0, 0.9529412, 1,
0.9521232, 0.1418856, 2.088507, 1, 0, 0.9490196, 1,
0.9533751, 0.01421917, 2.545824, 1, 0, 0.9411765, 1,
0.9596097, 1.432282, 1.072909, 1, 0, 0.9372549, 1,
0.9617181, -0.2062883, 1.181906, 1, 0, 0.9294118, 1,
0.9620945, -1.998115, 3.703059, 1, 0, 0.9254902, 1,
0.9661367, 0.752363, 0.5746987, 1, 0, 0.9176471, 1,
0.9742237, 0.6536066, 0.8372372, 1, 0, 0.9137255, 1,
0.9743068, 1.09725, -0.9401037, 1, 0, 0.9058824, 1,
0.9753656, -0.4218689, 1.312858, 1, 0, 0.9019608, 1,
0.9758279, 0.4224522, 2.174372, 1, 0, 0.8941177, 1,
0.9765385, -1.347644, 2.081359, 1, 0, 0.8862745, 1,
0.9830499, -0.6727657, 4.369889, 1, 0, 0.8823529, 1,
0.9861991, 0.4830242, 0.9619057, 1, 0, 0.8745098, 1,
0.9996793, 1.421981, -0.4228049, 1, 0, 0.8705882, 1,
1.010788, -1.684912, 1.424162, 1, 0, 0.8627451, 1,
1.012887, -0.3947878, 2.166086, 1, 0, 0.8588235, 1,
1.035479, 1.123331, 1.596027, 1, 0, 0.8509804, 1,
1.036841, 0.09415363, 0.01310709, 1, 0, 0.8470588, 1,
1.043546, 1.360852, -0.4927292, 1, 0, 0.8392157, 1,
1.048064, -0.3785072, 3.045216, 1, 0, 0.8352941, 1,
1.05007, -0.8951433, 2.729706, 1, 0, 0.827451, 1,
1.059935, -1.209786, 2.13432, 1, 0, 0.8235294, 1,
1.065887, -1.568497, 2.006603, 1, 0, 0.8156863, 1,
1.066428, 0.0572219, 0.9605047, 1, 0, 0.8117647, 1,
1.074079, 1.450687, 0.6830423, 1, 0, 0.8039216, 1,
1.088376, -0.4012518, 2.514744, 1, 0, 0.7960784, 1,
1.090801, -0.8521121, 2.368306, 1, 0, 0.7921569, 1,
1.099848, 0.3738658, 1.091944, 1, 0, 0.7843137, 1,
1.102229, 0.8668956, 0.1748964, 1, 0, 0.7803922, 1,
1.102443, -0.522568, 2.36789, 1, 0, 0.772549, 1,
1.104984, -1.059636, 1.053672, 1, 0, 0.7686275, 1,
1.10551, -1.04005, 2.557884, 1, 0, 0.7607843, 1,
1.108553, 0.1490034, 0.4164952, 1, 0, 0.7568628, 1,
1.109608, 1.560849, 1.14307, 1, 0, 0.7490196, 1,
1.113419, 0.3037237, 0.207494, 1, 0, 0.7450981, 1,
1.113986, 0.1663477, 0.2515702, 1, 0, 0.7372549, 1,
1.118544, 0.9554129, 2.04007, 1, 0, 0.7333333, 1,
1.120909, -0.1468952, 3.409424, 1, 0, 0.7254902, 1,
1.135356, -1.506195, 3.160656, 1, 0, 0.7215686, 1,
1.135717, 1.604512, -0.7275938, 1, 0, 0.7137255, 1,
1.135956, -1.468107, 3.326701, 1, 0, 0.7098039, 1,
1.138826, -0.4119462, -0.02892959, 1, 0, 0.7019608, 1,
1.143975, -1.14575, 0.8857836, 1, 0, 0.6941177, 1,
1.144339, 0.9134413, -0.5031614, 1, 0, 0.6901961, 1,
1.151736, -0.5200741, 3.447264, 1, 0, 0.682353, 1,
1.152231, -0.6306603, 1.342132, 1, 0, 0.6784314, 1,
1.152518, -0.9028387, 3.731677, 1, 0, 0.6705883, 1,
1.159261, 0.4930585, 0.7486454, 1, 0, 0.6666667, 1,
1.162611, -0.2342785, 1.34345, 1, 0, 0.6588235, 1,
1.16638, 0.4600555, 2.999123, 1, 0, 0.654902, 1,
1.177244, 0.5832545, 3.079079, 1, 0, 0.6470588, 1,
1.180532, 0.04102405, 1.138101, 1, 0, 0.6431373, 1,
1.183532, -0.1594218, 0.835707, 1, 0, 0.6352941, 1,
1.184344, -0.6438064, 3.311269, 1, 0, 0.6313726, 1,
1.185881, 0.5026497, 1.043938, 1, 0, 0.6235294, 1,
1.186187, 0.8333294, 1.466165, 1, 0, 0.6196079, 1,
1.192375, 1.368611, 1.213055, 1, 0, 0.6117647, 1,
1.195429, -1.516905, 1.542534, 1, 0, 0.6078432, 1,
1.198861, -0.3315985, 0.05638598, 1, 0, 0.6, 1,
1.218151, -0.07708032, 0.5849875, 1, 0, 0.5921569, 1,
1.220149, 0.8982432, 0.6971493, 1, 0, 0.5882353, 1,
1.22725, 0.3689196, 1.204754, 1, 0, 0.5803922, 1,
1.227892, 0.001937258, 1.724635, 1, 0, 0.5764706, 1,
1.232105, 2.550029, 0.6693229, 1, 0, 0.5686275, 1,
1.232551, 1.299746, -1.203829, 1, 0, 0.5647059, 1,
1.237628, 0.9772055, 0.6897135, 1, 0, 0.5568628, 1,
1.246093, 2.05612, -0.374414, 1, 0, 0.5529412, 1,
1.2658, -0.6758774, 2.161871, 1, 0, 0.5450981, 1,
1.278704, -0.6173218, 3.065641, 1, 0, 0.5411765, 1,
1.283826, -0.4374913, 0.6136757, 1, 0, 0.5333334, 1,
1.287578, -2.657207, 2.855219, 1, 0, 0.5294118, 1,
1.291142, 0.3592038, 1.086624, 1, 0, 0.5215687, 1,
1.302279, -0.1953491, 3.657729, 1, 0, 0.5176471, 1,
1.319605, -1.309517, 3.185398, 1, 0, 0.509804, 1,
1.32586, -1.852026, 1.287854, 1, 0, 0.5058824, 1,
1.326761, 0.2389509, -1.143865, 1, 0, 0.4980392, 1,
1.339869, -0.5058496, 2.795405, 1, 0, 0.4901961, 1,
1.351408, 0.3921594, 1.146041, 1, 0, 0.4862745, 1,
1.359436, 0.4601423, 1.2354, 1, 0, 0.4784314, 1,
1.36501, 0.0574457, -0.659354, 1, 0, 0.4745098, 1,
1.365205, 0.5163358, 1.777597, 1, 0, 0.4666667, 1,
1.365644, 1.213915, 0.7561806, 1, 0, 0.4627451, 1,
1.367426, -0.0660837, 0.3561471, 1, 0, 0.454902, 1,
1.378409, -0.8884508, -0.07602773, 1, 0, 0.4509804, 1,
1.382296, 0.3893997, 0.9462678, 1, 0, 0.4431373, 1,
1.388901, 0.344777, 2.235952, 1, 0, 0.4392157, 1,
1.389777, -0.4678648, 0.9874915, 1, 0, 0.4313726, 1,
1.393977, -0.6293918, 2.148569, 1, 0, 0.427451, 1,
1.398598, 0.3817873, 1.443153, 1, 0, 0.4196078, 1,
1.412256, 0.4786042, 1.360758, 1, 0, 0.4156863, 1,
1.412526, 1.375169, -0.03872172, 1, 0, 0.4078431, 1,
1.419232, -1.374259, 2.433054, 1, 0, 0.4039216, 1,
1.437915, 0.7834123, 0.1437043, 1, 0, 0.3960784, 1,
1.446728, -0.6574104, 1.039476, 1, 0, 0.3882353, 1,
1.454888, -0.4670076, 1.890063, 1, 0, 0.3843137, 1,
1.45903, 0.06395815, -0.7108647, 1, 0, 0.3764706, 1,
1.466576, 1.229882, 1.532039, 1, 0, 0.372549, 1,
1.474331, 0.9227999, 1.105773, 1, 0, 0.3647059, 1,
1.477769, 0.9992276, 2.086236, 1, 0, 0.3607843, 1,
1.490931, 2.001212, 1.512715, 1, 0, 0.3529412, 1,
1.500417, -0.3571147, 1.187955, 1, 0, 0.3490196, 1,
1.506755, 0.4830374, 0.4389045, 1, 0, 0.3411765, 1,
1.511014, -0.6077799, 2.558821, 1, 0, 0.3372549, 1,
1.511901, 1.285176, 2.167821, 1, 0, 0.3294118, 1,
1.519084, 0.1951119, 3.471835, 1, 0, 0.3254902, 1,
1.531395, 1.216588, 1.856182, 1, 0, 0.3176471, 1,
1.537456, 0.9447846, 1.61744, 1, 0, 0.3137255, 1,
1.559274, 0.7986628, 0.9729144, 1, 0, 0.3058824, 1,
1.562956, 1.258929, -0.4457155, 1, 0, 0.2980392, 1,
1.571562, 0.1309386, 0.4294577, 1, 0, 0.2941177, 1,
1.576268, 1.215007, -0.1500275, 1, 0, 0.2862745, 1,
1.588789, 0.3391993, 0.316227, 1, 0, 0.282353, 1,
1.589124, 1.236391, 0.34165, 1, 0, 0.2745098, 1,
1.600858, -1.125984, 2.302257, 1, 0, 0.2705882, 1,
1.62011, -1.677695, 2.189864, 1, 0, 0.2627451, 1,
1.65064, 0.3239503, 2.387298, 1, 0, 0.2588235, 1,
1.654596, -0.6017331, 0.9742609, 1, 0, 0.2509804, 1,
1.677098, -0.1481275, 3.60386, 1, 0, 0.2470588, 1,
1.677334, -0.8603874, 2.071021, 1, 0, 0.2392157, 1,
1.686222, 1.92746, 0.9554098, 1, 0, 0.2352941, 1,
1.706471, -0.1395678, 1.748305, 1, 0, 0.227451, 1,
1.717823, -1.574341, 2.19019, 1, 0, 0.2235294, 1,
1.72386, 0.2164239, 0.8417239, 1, 0, 0.2156863, 1,
1.730499, -0.6921924, 1.240106, 1, 0, 0.2117647, 1,
1.753895, 2.181382, 0.331858, 1, 0, 0.2039216, 1,
1.767397, -0.1020032, 0.1880604, 1, 0, 0.1960784, 1,
1.767929, -1.166085, 4.764843, 1, 0, 0.1921569, 1,
1.781185, 0.2872972, 2.191425, 1, 0, 0.1843137, 1,
1.781343, -0.8945368, 0.771725, 1, 0, 0.1803922, 1,
1.785385, 0.4596966, 1.242467, 1, 0, 0.172549, 1,
1.801591, 0.06338069, 2.162332, 1, 0, 0.1686275, 1,
1.814254, -0.06779272, 2.196913, 1, 0, 0.1607843, 1,
1.823235, -0.7656221, 1.950252, 1, 0, 0.1568628, 1,
1.829949, 0.5823652, 2.398561, 1, 0, 0.1490196, 1,
1.857182, -0.7506473, 2.11686, 1, 0, 0.145098, 1,
1.921356, -1.084996, 0.6633521, 1, 0, 0.1372549, 1,
2.001544, 1.352332, 2.05894, 1, 0, 0.1333333, 1,
2.006031, -0.7994055, 3.431691, 1, 0, 0.1254902, 1,
2.009903, -0.5931106, 3.444944, 1, 0, 0.1215686, 1,
2.012056, 0.5473772, 0.6025753, 1, 0, 0.1137255, 1,
2.047736, 1.265631, 0.1939143, 1, 0, 0.1098039, 1,
2.056062, -0.465916, 1.757774, 1, 0, 0.1019608, 1,
2.057978, -0.8709932, 1.678637, 1, 0, 0.09411765, 1,
2.091895, -0.379817, 1.562018, 1, 0, 0.09019608, 1,
2.094101, -0.304441, 2.201057, 1, 0, 0.08235294, 1,
2.131219, -0.1205927, 2.026105, 1, 0, 0.07843138, 1,
2.142111, 0.363611, 2.160136, 1, 0, 0.07058824, 1,
2.182925, 0.6508958, 1.006498, 1, 0, 0.06666667, 1,
2.356478, 0.8351559, 1.788751, 1, 0, 0.05882353, 1,
2.359516, 1.212344, 2.211622, 1, 0, 0.05490196, 1,
2.365648, 0.2464922, 3.408227, 1, 0, 0.04705882, 1,
2.370103, -2.513652, 4.021251, 1, 0, 0.04313726, 1,
2.384784, 0.4369238, 1.371791, 1, 0, 0.03529412, 1,
2.447359, 1.539142, -0.2329973, 1, 0, 0.03137255, 1,
2.614707, -1.10585, 1.37723, 1, 0, 0.02352941, 1,
2.618535, -0.2814008, -0.592092, 1, 0, 0.01960784, 1,
2.637739, 0.9943056, 3.614977, 1, 0, 0.01176471, 1,
2.665502, 0.4408791, 0.6002021, 1, 0, 0.007843138, 1
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
-0.1083256, -4.117711, -6.77631, 0, -0.5, 0.5, 0.5,
-0.1083256, -4.117711, -6.77631, 1, -0.5, 0.5, 0.5,
-0.1083256, -4.117711, -6.77631, 1, 1.5, 0.5, 0.5,
-0.1083256, -4.117711, -6.77631, 0, 1.5, 0.5, 0.5
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
-3.82248, 0.2114996, -6.77631, 0, -0.5, 0.5, 0.5,
-3.82248, 0.2114996, -6.77631, 1, -0.5, 0.5, 0.5,
-3.82248, 0.2114996, -6.77631, 1, 1.5, 0.5, 0.5,
-3.82248, 0.2114996, -6.77631, 0, 1.5, 0.5, 0.5
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
-3.82248, -4.117711, 0.4594789, 0, -0.5, 0.5, 0.5,
-3.82248, -4.117711, 0.4594789, 1, -0.5, 0.5, 0.5,
-3.82248, -4.117711, 0.4594789, 1, 1.5, 0.5, 0.5,
-3.82248, -4.117711, 0.4594789, 0, 1.5, 0.5, 0.5
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
-2, -3.118662, -5.106513,
2, -3.118662, -5.106513,
-2, -3.118662, -5.106513,
-2, -3.28517, -5.384812,
-1, -3.118662, -5.106513,
-1, -3.28517, -5.384812,
0, -3.118662, -5.106513,
0, -3.28517, -5.384812,
1, -3.118662, -5.106513,
1, -3.28517, -5.384812,
2, -3.118662, -5.106513,
2, -3.28517, -5.384812
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
-2, -3.618186, -5.941411, 0, -0.5, 0.5, 0.5,
-2, -3.618186, -5.941411, 1, -0.5, 0.5, 0.5,
-2, -3.618186, -5.941411, 1, 1.5, 0.5, 0.5,
-2, -3.618186, -5.941411, 0, 1.5, 0.5, 0.5,
-1, -3.618186, -5.941411, 0, -0.5, 0.5, 0.5,
-1, -3.618186, -5.941411, 1, -0.5, 0.5, 0.5,
-1, -3.618186, -5.941411, 1, 1.5, 0.5, 0.5,
-1, -3.618186, -5.941411, 0, 1.5, 0.5, 0.5,
0, -3.618186, -5.941411, 0, -0.5, 0.5, 0.5,
0, -3.618186, -5.941411, 1, -0.5, 0.5, 0.5,
0, -3.618186, -5.941411, 1, 1.5, 0.5, 0.5,
0, -3.618186, -5.941411, 0, 1.5, 0.5, 0.5,
1, -3.618186, -5.941411, 0, -0.5, 0.5, 0.5,
1, -3.618186, -5.941411, 1, -0.5, 0.5, 0.5,
1, -3.618186, -5.941411, 1, 1.5, 0.5, 0.5,
1, -3.618186, -5.941411, 0, 1.5, 0.5, 0.5,
2, -3.618186, -5.941411, 0, -0.5, 0.5, 0.5,
2, -3.618186, -5.941411, 1, -0.5, 0.5, 0.5,
2, -3.618186, -5.941411, 1, 1.5, 0.5, 0.5,
2, -3.618186, -5.941411, 0, 1.5, 0.5, 0.5
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
-2.965368, -3, -5.106513,
-2.965368, 3, -5.106513,
-2.965368, -3, -5.106513,
-3.10822, -3, -5.384812,
-2.965368, -2, -5.106513,
-3.10822, -2, -5.384812,
-2.965368, -1, -5.106513,
-3.10822, -1, -5.384812,
-2.965368, 0, -5.106513,
-3.10822, 0, -5.384812,
-2.965368, 1, -5.106513,
-3.10822, 1, -5.384812,
-2.965368, 2, -5.106513,
-3.10822, 2, -5.384812,
-2.965368, 3, -5.106513,
-3.10822, 3, -5.384812
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
-3.393924, -3, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, -3, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, -3, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, -3, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, -2, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, -2, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, -2, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, -2, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, -1, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, -1, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, -1, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, -1, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, 0, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, 0, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, 0, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, 0, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, 1, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, 1, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, 1, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, 1, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, 2, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, 2, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, 2, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, 2, -5.941411, 0, 1.5, 0.5, 0.5,
-3.393924, 3, -5.941411, 0, -0.5, 0.5, 0.5,
-3.393924, 3, -5.941411, 1, -0.5, 0.5, 0.5,
-3.393924, 3, -5.941411, 1, 1.5, 0.5, 0.5,
-3.393924, 3, -5.941411, 0, 1.5, 0.5, 0.5
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
-2.965368, -3.118662, -4,
-2.965368, -3.118662, 4,
-2.965368, -3.118662, -4,
-3.10822, -3.28517, -4,
-2.965368, -3.118662, -2,
-3.10822, -3.28517, -2,
-2.965368, -3.118662, 0,
-3.10822, -3.28517, 0,
-2.965368, -3.118662, 2,
-3.10822, -3.28517, 2,
-2.965368, -3.118662, 4,
-3.10822, -3.28517, 4
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
-3.393924, -3.618186, -4, 0, -0.5, 0.5, 0.5,
-3.393924, -3.618186, -4, 1, -0.5, 0.5, 0.5,
-3.393924, -3.618186, -4, 1, 1.5, 0.5, 0.5,
-3.393924, -3.618186, -4, 0, 1.5, 0.5, 0.5,
-3.393924, -3.618186, -2, 0, -0.5, 0.5, 0.5,
-3.393924, -3.618186, -2, 1, -0.5, 0.5, 0.5,
-3.393924, -3.618186, -2, 1, 1.5, 0.5, 0.5,
-3.393924, -3.618186, -2, 0, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 0, 0, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 0, 1, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 0, 1, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 0, 0, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 2, 0, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 2, 1, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 2, 1, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 2, 0, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 4, 0, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 4, 1, -0.5, 0.5, 0.5,
-3.393924, -3.618186, 4, 1, 1.5, 0.5, 0.5,
-3.393924, -3.618186, 4, 0, 1.5, 0.5, 0.5
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
-2.965368, -3.118662, -5.106513,
-2.965368, 3.541662, -5.106513,
-2.965368, -3.118662, 6.02547,
-2.965368, 3.541662, 6.02547,
-2.965368, -3.118662, -5.106513,
-2.965368, -3.118662, 6.02547,
-2.965368, 3.541662, -5.106513,
-2.965368, 3.541662, 6.02547,
-2.965368, -3.118662, -5.106513,
2.748716, -3.118662, -5.106513,
-2.965368, -3.118662, 6.02547,
2.748716, -3.118662, 6.02547,
-2.965368, 3.541662, -5.106513,
2.748716, 3.541662, -5.106513,
-2.965368, 3.541662, 6.02547,
2.748716, 3.541662, 6.02547,
2.748716, -3.118662, -5.106513,
2.748716, 3.541662, -5.106513,
2.748716, -3.118662, 6.02547,
2.748716, 3.541662, 6.02547,
2.748716, -3.118662, -5.106513,
2.748716, -3.118662, 6.02547,
2.748716, 3.541662, -5.106513,
2.748716, 3.541662, 6.02547
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
var radius = 7.569195;
var distance = 33.6762;
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
mvMatrix.translate( 0.1083256, -0.2114996, -0.4594789 );
mvMatrix.scale( 1.432244, 1.228763, 0.7351756 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6762);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
4-methylbenzoate<-read.table("4-methylbenzoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-methylbenzoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzoate' not found
```

```r
y<-4-methylbenzoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzoate' not found
```

```r
z<-4-methylbenzoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylbenzoate' not found
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
-2.882153, 1.007258, -1.551568, 0, 0, 1, 1, 1,
-2.790895, 1.241768, -0.4817436, 1, 0, 0, 1, 1,
-2.678375, 1.511357, -1.464706, 1, 0, 0, 1, 1,
-2.62447, -1.402013, -3.998883, 1, 0, 0, 1, 1,
-2.604948, 0.4798087, -0.7157591, 1, 0, 0, 1, 1,
-2.595288, 0.2483153, -2.496105, 1, 0, 0, 1, 1,
-2.507341, 0.9620602, -1.022964, 0, 0, 0, 1, 1,
-2.458309, -1.516956, -3.228737, 0, 0, 0, 1, 1,
-2.321192, 0.5318843, -1.839711, 0, 0, 0, 1, 1,
-2.299586, 1.020063, -2.323255, 0, 0, 0, 1, 1,
-2.288288, -0.9085838, -1.62345, 0, 0, 0, 1, 1,
-2.287416, 2.096399, 0.2306859, 0, 0, 0, 1, 1,
-2.248421, 0.770177, -1.351738, 0, 0, 0, 1, 1,
-2.222535, 0.1140171, -0.3335131, 1, 1, 1, 1, 1,
-2.219883, -0.6790029, -0.4233499, 1, 1, 1, 1, 1,
-2.19108, 0.0391174, -0.960092, 1, 1, 1, 1, 1,
-2.184094, -2.821178, -1.834022, 1, 1, 1, 1, 1,
-2.16628, 0.6651355, -0.9454975, 1, 1, 1, 1, 1,
-2.120013, -0.030337, -2.553113, 1, 1, 1, 1, 1,
-2.119358, -0.2881428, -1.429098, 1, 1, 1, 1, 1,
-2.096498, -0.7111301, -2.469974, 1, 1, 1, 1, 1,
-2.067498, 1.684185, -0.002312579, 1, 1, 1, 1, 1,
-2.062384, 0.5583445, -1.420339, 1, 1, 1, 1, 1,
-2.033912, 0.3547169, -1.209906, 1, 1, 1, 1, 1,
-2.02313, -0.7253084, -2.612638, 1, 1, 1, 1, 1,
-2.013402, -0.1331601, -3.186044, 1, 1, 1, 1, 1,
-2.006999, -2.236804, -2.315176, 1, 1, 1, 1, 1,
-1.939125, -0.6792162, -1.500424, 1, 1, 1, 1, 1,
-1.906973, -0.8331872, -2.031967, 0, 0, 1, 1, 1,
-1.887174, 0.9943839, 0.3628405, 1, 0, 0, 1, 1,
-1.886656, 0.5222709, -2.463854, 1, 0, 0, 1, 1,
-1.880073, 0.04414019, -0.6719398, 1, 0, 0, 1, 1,
-1.86597, -0.7193856, -1.893284, 1, 0, 0, 1, 1,
-1.853876, 0.9766704, -1.369033, 1, 0, 0, 1, 1,
-1.829588, 0.3417749, 1.058388, 0, 0, 0, 1, 1,
-1.808251, -1.169949, -2.663378, 0, 0, 0, 1, 1,
-1.778976, 0.09730949, -1.537047, 0, 0, 0, 1, 1,
-1.773072, -2.105613, -2.703988, 0, 0, 0, 1, 1,
-1.762649, 0.6442322, -0.189873, 0, 0, 0, 1, 1,
-1.753966, -0.5238545, -3.059108, 0, 0, 0, 1, 1,
-1.72862, -1.546134, -0.851174, 0, 0, 0, 1, 1,
-1.723446, 1.629127, -0.8020244, 1, 1, 1, 1, 1,
-1.71882, 0.3721985, -3.993299, 1, 1, 1, 1, 1,
-1.712049, 0.1980925, -0.09846684, 1, 1, 1, 1, 1,
-1.71043, 0.8906326, -1.994167, 1, 1, 1, 1, 1,
-1.704554, 0.8874506, -1.041782, 1, 1, 1, 1, 1,
-1.702501, -1.61953, -1.997382, 1, 1, 1, 1, 1,
-1.698797, 1.323681, 0.6460691, 1, 1, 1, 1, 1,
-1.691308, -1.199152, -3.645185, 1, 1, 1, 1, 1,
-1.683373, 1.561309, -1.680519, 1, 1, 1, 1, 1,
-1.600983, 0.585171, 0.9155949, 1, 1, 1, 1, 1,
-1.575748, -0.1731669, -2.982744, 1, 1, 1, 1, 1,
-1.57411, 0.3814304, 0.3917536, 1, 1, 1, 1, 1,
-1.56205, -1.648432, -3.237548, 1, 1, 1, 1, 1,
-1.553099, 0.7199613, -1.04137, 1, 1, 1, 1, 1,
-1.547141, -0.7201911, -1.663053, 1, 1, 1, 1, 1,
-1.538146, -1.226953, -3.834934, 0, 0, 1, 1, 1,
-1.525664, -0.2957287, 0.5668749, 1, 0, 0, 1, 1,
-1.525236, 0.9843203, -1.405578, 1, 0, 0, 1, 1,
-1.505818, 0.1555332, -3.461952, 1, 0, 0, 1, 1,
-1.466004, -0.5706148, -2.473569, 1, 0, 0, 1, 1,
-1.462434, 1.513242, -1.17591, 1, 0, 0, 1, 1,
-1.461118, -1.265138, -2.758692, 0, 0, 0, 1, 1,
-1.439368, 0.4746773, 0.1868583, 0, 0, 0, 1, 1,
-1.422046, -0.3177626, -0.248716, 0, 0, 0, 1, 1,
-1.417037, 0.694156, -0.4361628, 0, 0, 0, 1, 1,
-1.401715, -0.01945124, -1.380197, 0, 0, 0, 1, 1,
-1.397874, 0.2967492, -1.256585, 0, 0, 0, 1, 1,
-1.392377, -0.6119416, -3.64857, 0, 0, 0, 1, 1,
-1.37554, -1.153721, -2.00253, 1, 1, 1, 1, 1,
-1.372833, 0.2671667, -2.945749, 1, 1, 1, 1, 1,
-1.368172, 0.8568584, -0.06231512, 1, 1, 1, 1, 1,
-1.365834, -0.2556138, -0.475092, 1, 1, 1, 1, 1,
-1.365055, 0.9079003, -0.4731307, 1, 1, 1, 1, 1,
-1.359655, -0.6681063, -2.590708, 1, 1, 1, 1, 1,
-1.356319, 0.1472771, -2.725189, 1, 1, 1, 1, 1,
-1.350905, -0.1131547, -3.000067, 1, 1, 1, 1, 1,
-1.350647, -0.02700095, -2.747447, 1, 1, 1, 1, 1,
-1.348753, -0.6412895, -3.350796, 1, 1, 1, 1, 1,
-1.34192, 0.398697, -1.228159, 1, 1, 1, 1, 1,
-1.341709, 0.1463366, 0.3594471, 1, 1, 1, 1, 1,
-1.330836, -1.2582, -2.621867, 1, 1, 1, 1, 1,
-1.329592, -2.053154, -3.587294, 1, 1, 1, 1, 1,
-1.323457, 0.1086027, 0.4555863, 1, 1, 1, 1, 1,
-1.319809, 0.4762705, -1.50132, 0, 0, 1, 1, 1,
-1.319183, -0.3208409, -1.136132, 1, 0, 0, 1, 1,
-1.318281, -0.5648778, -3.007526, 1, 0, 0, 1, 1,
-1.304064, -0.3950265, -2.951182, 1, 0, 0, 1, 1,
-1.302857, 1.580705, -0.7294593, 1, 0, 0, 1, 1,
-1.301794, 0.4077074, -2.408362, 1, 0, 0, 1, 1,
-1.291797, -0.05060268, -3.076834, 0, 0, 0, 1, 1,
-1.284518, -0.124665, -2.158975, 0, 0, 0, 1, 1,
-1.28052, -1.787136, -1.687152, 0, 0, 0, 1, 1,
-1.279784, -0.1528447, -1.559238, 0, 0, 0, 1, 1,
-1.275947, -0.5354103, -1.664924, 0, 0, 0, 1, 1,
-1.272484, 0.7489718, -0.8757946, 0, 0, 0, 1, 1,
-1.25492, 0.5310308, -1.061882, 0, 0, 0, 1, 1,
-1.25068, -0.438835, -1.458729, 1, 1, 1, 1, 1,
-1.250202, -2.520823, -3.225175, 1, 1, 1, 1, 1,
-1.244107, -0.3491309, -1.691511, 1, 1, 1, 1, 1,
-1.24171, -1.060727, -3.319739, 1, 1, 1, 1, 1,
-1.24124, 1.249501, -2.017061, 1, 1, 1, 1, 1,
-1.240759, -0.5639293, -3.224793, 1, 1, 1, 1, 1,
-1.2371, -0.4218957, -0.2710014, 1, 1, 1, 1, 1,
-1.235566, 0.694453, 0.3291416, 1, 1, 1, 1, 1,
-1.231983, -1.221946, -3.142809, 1, 1, 1, 1, 1,
-1.219614, -0.4073731, -3.574611, 1, 1, 1, 1, 1,
-1.216905, 1.343017, -0.5829902, 1, 1, 1, 1, 1,
-1.21481, 1.910265, -0.6911584, 1, 1, 1, 1, 1,
-1.211897, 2.858341, -0.4599172, 1, 1, 1, 1, 1,
-1.211342, -0.5938861, -1.479784, 1, 1, 1, 1, 1,
-1.208933, -0.8998033, -3.952513, 1, 1, 1, 1, 1,
-1.198677, 0.9611896, -0.1547343, 0, 0, 1, 1, 1,
-1.180488, 0.00377979, -1.271806, 1, 0, 0, 1, 1,
-1.177518, 0.217817, -0.95342, 1, 0, 0, 1, 1,
-1.175387, 0.4148318, -2.64823, 1, 0, 0, 1, 1,
-1.175, 2.011027, -0.05910187, 1, 0, 0, 1, 1,
-1.173323, -0.977349, -1.656424, 1, 0, 0, 1, 1,
-1.17314, -0.4705291, -1.812655, 0, 0, 0, 1, 1,
-1.15818, -0.8066166, -1.617204, 0, 0, 0, 1, 1,
-1.157255, 0.1152947, -2.068628, 0, 0, 0, 1, 1,
-1.156016, 1.440285, 0.04896213, 0, 0, 0, 1, 1,
-1.152695, -0.4213589, -1.738554, 0, 0, 0, 1, 1,
-1.141654, 0.6407366, -2.767852, 0, 0, 0, 1, 1,
-1.141395, 0.07767969, -2.632502, 0, 0, 0, 1, 1,
-1.136533, 1.456531, -1.751355, 1, 1, 1, 1, 1,
-1.128021, -0.1255679, -2.20761, 1, 1, 1, 1, 1,
-1.126343, -1.213644, -1.984344, 1, 1, 1, 1, 1,
-1.122295, -0.9138129, -4.052225, 1, 1, 1, 1, 1,
-1.121889, -2.356241, -3.356336, 1, 1, 1, 1, 1,
-1.12003, 1.279289, -0.1820769, 1, 1, 1, 1, 1,
-1.115874, -1.296782, -2.246177, 1, 1, 1, 1, 1,
-1.111703, 0.8186859, -2.051096, 1, 1, 1, 1, 1,
-1.107484, 0.05291275, -1.36752, 1, 1, 1, 1, 1,
-1.105689, 0.9822688, 0.04246025, 1, 1, 1, 1, 1,
-1.105459, -1.183159, -3.799241, 1, 1, 1, 1, 1,
-1.093698, -0.4731746, -2.030195, 1, 1, 1, 1, 1,
-1.092872, 0.310309, -2.628885, 1, 1, 1, 1, 1,
-1.079899, 2.052592, -0.9909354, 1, 1, 1, 1, 1,
-1.071074, 0.5841918, -0.4841349, 1, 1, 1, 1, 1,
-1.067649, 0.09743152, -1.544715, 0, 0, 1, 1, 1,
-1.053238, -0.6178938, -3.421551, 1, 0, 0, 1, 1,
-1.046162, 0.3540928, -1.531947, 1, 0, 0, 1, 1,
-1.040311, 1.9, 0.9409022, 1, 0, 0, 1, 1,
-1.039503, -0.4088984, -3.479672, 1, 0, 0, 1, 1,
-1.03729, 0.5949987, 0.07076256, 1, 0, 0, 1, 1,
-1.032835, -0.05424172, -0.7086477, 0, 0, 0, 1, 1,
-1.027334, -0.8403447, -3.42204, 0, 0, 0, 1, 1,
-1.023861, -0.02796978, -2.286362, 0, 0, 0, 1, 1,
-1.022038, -1.552396, -2.752018, 0, 0, 0, 1, 1,
-1.015413, -0.8758575, -1.654696, 0, 0, 0, 1, 1,
-1.013909, 0.3685561, -2.685287, 0, 0, 0, 1, 1,
-1.007114, 0.9939204, -0.4116075, 0, 0, 0, 1, 1,
-1.00057, -0.4123957, -2.370245, 1, 1, 1, 1, 1,
-0.9990057, 0.08197263, -2.312958, 1, 1, 1, 1, 1,
-0.9750788, -2.031867, -1.166626, 1, 1, 1, 1, 1,
-0.971167, 0.07859343, -1.478209, 1, 1, 1, 1, 1,
-0.9687884, -1.885542, -2.819718, 1, 1, 1, 1, 1,
-0.9468377, -0.9434416, -4.429331, 1, 1, 1, 1, 1,
-0.9443718, -1.051374, -4.336945, 1, 1, 1, 1, 1,
-0.9409365, -1.635707, -3.678135, 1, 1, 1, 1, 1,
-0.940912, 0.04767083, -1.601405, 1, 1, 1, 1, 1,
-0.9343421, 1.125544, -2.257653, 1, 1, 1, 1, 1,
-0.9289459, -0.07624948, -2.419713, 1, 1, 1, 1, 1,
-0.9250175, -0.3234939, -3.021667, 1, 1, 1, 1, 1,
-0.9241865, -0.9956967, -1.751496, 1, 1, 1, 1, 1,
-0.9236023, -1.296376, -2.71067, 1, 1, 1, 1, 1,
-0.9155527, -1.01379, -0.3244034, 1, 1, 1, 1, 1,
-0.9117513, -1.798828, -2.731667, 0, 0, 1, 1, 1,
-0.9097119, 0.5592802, -0.7995554, 1, 0, 0, 1, 1,
-0.9072513, 0.3662, -2.122881, 1, 0, 0, 1, 1,
-0.9054325, -1.719304, -3.165618, 1, 0, 0, 1, 1,
-0.9028754, 0.3400325, -4.037923, 1, 0, 0, 1, 1,
-0.9000999, -0.7060905, -3.948852, 1, 0, 0, 1, 1,
-0.8981915, 0.589285, -0.5566871, 0, 0, 0, 1, 1,
-0.8976685, 0.1501638, -1.58626, 0, 0, 0, 1, 1,
-0.8953151, 0.8773555, -1.984908, 0, 0, 0, 1, 1,
-0.8935804, 0.7487397, -3.885126, 0, 0, 0, 1, 1,
-0.8927612, 0.06595106, -1.493839, 0, 0, 0, 1, 1,
-0.8853867, 0.1174753, -2.660602, 0, 0, 0, 1, 1,
-0.861489, 0.7839621, -2.097668, 0, 0, 0, 1, 1,
-0.8570616, 0.8300326, -0.03629167, 1, 1, 1, 1, 1,
-0.8544444, -1.212822, -2.670168, 1, 1, 1, 1, 1,
-0.8529084, 1.08845, -1.17405, 1, 1, 1, 1, 1,
-0.8493854, 1.70382, -1.182397, 1, 1, 1, 1, 1,
-0.8441856, 0.6308774, 0.3091955, 1, 1, 1, 1, 1,
-0.8431216, 0.6221494, -2.669342, 1, 1, 1, 1, 1,
-0.8409944, -3.021667, -4.644826, 1, 1, 1, 1, 1,
-0.8359855, -0.1386002, -2.816711, 1, 1, 1, 1, 1,
-0.8346415, 0.8295355, -0.1717432, 1, 1, 1, 1, 1,
-0.8263577, -0.2921185, -1.52293, 1, 1, 1, 1, 1,
-0.8248604, 1.68724, -1.22108, 1, 1, 1, 1, 1,
-0.8248303, -0.7451231, -2.948788, 1, 1, 1, 1, 1,
-0.8232468, -0.3797332, -1.292971, 1, 1, 1, 1, 1,
-0.8217432, 0.7687226, 0.0307122, 1, 1, 1, 1, 1,
-0.8154257, -0.8799361, -1.315179, 1, 1, 1, 1, 1,
-0.813776, 0.3275944, -2.153238, 0, 0, 1, 1, 1,
-0.8136555, 0.272635, -1.957335, 1, 0, 0, 1, 1,
-0.8107468, 1.04292, -0.5642108, 1, 0, 0, 1, 1,
-0.8093825, 2.328585, -0.6645409, 1, 0, 0, 1, 1,
-0.8061454, 0.3668576, 0.1030512, 1, 0, 0, 1, 1,
-0.8042603, -0.3594937, -0.01352521, 1, 0, 0, 1, 1,
-0.7975429, -1.654001, -2.322646, 0, 0, 0, 1, 1,
-0.7956928, 1.252131, -0.1801257, 0, 0, 0, 1, 1,
-0.7927358, 0.4520992, -2.635789, 0, 0, 0, 1, 1,
-0.7883156, -0.07019438, -2.353986, 0, 0, 0, 1, 1,
-0.7877122, -1.056434, -2.567749, 0, 0, 0, 1, 1,
-0.7874615, -0.4730849, -2.685973, 0, 0, 0, 1, 1,
-0.7732984, 0.4011933, -2.200437, 0, 0, 0, 1, 1,
-0.7711133, -1.105749, -2.470095, 1, 1, 1, 1, 1,
-0.7705501, 0.6472434, -0.0759813, 1, 1, 1, 1, 1,
-0.762967, -0.087662, -2.353161, 1, 1, 1, 1, 1,
-0.7615378, 0.169493, -1.187878, 1, 1, 1, 1, 1,
-0.7588607, 1.032257, -0.1257536, 1, 1, 1, 1, 1,
-0.7568343, -0.2710047, -1.034272, 1, 1, 1, 1, 1,
-0.7523501, -0.1534242, -1.616046, 1, 1, 1, 1, 1,
-0.7496262, -1.016896, -3.882826, 1, 1, 1, 1, 1,
-0.7459478, -0.6878367, -4.615501, 1, 1, 1, 1, 1,
-0.7459186, -0.1299214, -2.627446, 1, 1, 1, 1, 1,
-0.7453603, -1.588775, -3.347294, 1, 1, 1, 1, 1,
-0.7439087, -0.8613205, -0.7475554, 1, 1, 1, 1, 1,
-0.7409127, 0.3470711, -1.074612, 1, 1, 1, 1, 1,
-0.7383357, 0.2833082, -0.8545929, 1, 1, 1, 1, 1,
-0.736149, -1.439557, -1.607734, 1, 1, 1, 1, 1,
-0.7345526, -0.496981, -0.8020985, 0, 0, 1, 1, 1,
-0.7313522, 0.708483, 0.66911, 1, 0, 0, 1, 1,
-0.7303472, -0.6174762, -2.386563, 1, 0, 0, 1, 1,
-0.7279532, 0.574431, 2.774432, 1, 0, 0, 1, 1,
-0.7257052, -1.444365, -1.40311, 1, 0, 0, 1, 1,
-0.7256631, -0.7249889, -2.047129, 1, 0, 0, 1, 1,
-0.7198863, 0.4405368, -1.977645, 0, 0, 0, 1, 1,
-0.7101668, -0.8854591, -4.537354, 0, 0, 0, 1, 1,
-0.7020245, -0.5343201, -3.307646, 0, 0, 0, 1, 1,
-0.7014057, -0.9351296, -1.53251, 0, 0, 0, 1, 1,
-0.6963407, 0.7051954, -1.783893, 0, 0, 0, 1, 1,
-0.6961526, -0.1838386, -2.298166, 0, 0, 0, 1, 1,
-0.6955597, 1.507067, -1.025635, 0, 0, 0, 1, 1,
-0.6946539, 0.6153741, -0.830904, 1, 1, 1, 1, 1,
-0.691669, 0.8403779, -2.983794, 1, 1, 1, 1, 1,
-0.6898399, -0.5532904, -1.009706, 1, 1, 1, 1, 1,
-0.6865437, 1.453011, 0.04576314, 1, 1, 1, 1, 1,
-0.6857497, -1.402939, -3.159, 1, 1, 1, 1, 1,
-0.6772319, -0.7591426, -3.192641, 1, 1, 1, 1, 1,
-0.6765598, 0.4530804, -0.3166245, 1, 1, 1, 1, 1,
-0.6727734, 0.2017158, 0.6862919, 1, 1, 1, 1, 1,
-0.6704317, 0.6071941, -0.2650507, 1, 1, 1, 1, 1,
-0.664413, -0.3126772, -2.22416, 1, 1, 1, 1, 1,
-0.6623009, -2.629697, -1.159834, 1, 1, 1, 1, 1,
-0.6613122, 0.1505354, -1.748286, 1, 1, 1, 1, 1,
-0.6610759, 0.4308194, -2.055364, 1, 1, 1, 1, 1,
-0.6574888, 0.002023179, -1.147876, 1, 1, 1, 1, 1,
-0.6566714, 0.5206648, 0.9616377, 1, 1, 1, 1, 1,
-0.6478027, -0.5775341, -4.188701, 0, 0, 1, 1, 1,
-0.6451156, 1.509424, 0.35047, 1, 0, 0, 1, 1,
-0.6440343, 1.448642, -1.033101, 1, 0, 0, 1, 1,
-0.6440139, 0.4803022, -0.7615252, 1, 0, 0, 1, 1,
-0.643895, -1.105635, -2.128128, 1, 0, 0, 1, 1,
-0.6356817, -1.565418, -4.187482, 1, 0, 0, 1, 1,
-0.6274186, 0.3825519, -2.200471, 0, 0, 0, 1, 1,
-0.6234549, -0.3012204, -0.9378428, 0, 0, 0, 1, 1,
-0.6208628, 1.882611, 0.629632, 0, 0, 0, 1, 1,
-0.6163778, 1.004398, 0.7180037, 0, 0, 0, 1, 1,
-0.6142997, 1.173049, -0.8682806, 0, 0, 0, 1, 1,
-0.6122134, 0.1416286, -0.7992865, 0, 0, 0, 1, 1,
-0.6115122, 1.357343, -0.8814734, 0, 0, 0, 1, 1,
-0.6105085, 0.577871, -0.7759205, 1, 1, 1, 1, 1,
-0.6076535, -1.459176, -3.633193, 1, 1, 1, 1, 1,
-0.6070467, 0.3477073, -2.787192, 1, 1, 1, 1, 1,
-0.6069736, 0.08204359, -0.7458799, 1, 1, 1, 1, 1,
-0.6066252, 1.114953, -0.3816432, 1, 1, 1, 1, 1,
-0.6062331, -0.1303714, -1.540183, 1, 1, 1, 1, 1,
-0.6003401, -1.357262, -4.372079, 1, 1, 1, 1, 1,
-0.5827978, -0.4322259, -2.396485, 1, 1, 1, 1, 1,
-0.5786318, 0.3383133, -1.832514, 1, 1, 1, 1, 1,
-0.5765777, -1.298964, -2.620572, 1, 1, 1, 1, 1,
-0.5759782, -0.4995785, -0.7687073, 1, 1, 1, 1, 1,
-0.5734522, -1.262374, -4.14428, 1, 1, 1, 1, 1,
-0.5658423, 0.7907335, -0.6732336, 1, 1, 1, 1, 1,
-0.5610432, 1.442194, -1.932031, 1, 1, 1, 1, 1,
-0.556178, 0.5344149, -2.250929, 1, 1, 1, 1, 1,
-0.5519712, -0.8006642, -1.309212, 0, 0, 1, 1, 1,
-0.5504717, -0.07371149, -0.83929, 1, 0, 0, 1, 1,
-0.549915, 0.6847526, -0.5386113, 1, 0, 0, 1, 1,
-0.547523, 1.067921, 0.7153894, 1, 0, 0, 1, 1,
-0.5442067, 0.3439744, -2.060651, 1, 0, 0, 1, 1,
-0.5437089, 0.5674701, -0.6759539, 1, 0, 0, 1, 1,
-0.5404985, -1.004022, -2.991033, 0, 0, 0, 1, 1,
-0.5370929, -0.4763051, -3.373244, 0, 0, 0, 1, 1,
-0.533366, 0.8045133, -1.594674, 0, 0, 0, 1, 1,
-0.53215, -0.7763352, -0.8924136, 0, 0, 0, 1, 1,
-0.5313646, 0.8729131, -0.8818359, 0, 0, 0, 1, 1,
-0.5308649, -1.299656, -2.428351, 0, 0, 0, 1, 1,
-0.5286447, 2.060504, 0.6381047, 0, 0, 0, 1, 1,
-0.5266156, -0.3321283, -2.575087, 1, 1, 1, 1, 1,
-0.5252713, -0.9725921, -1.787396, 1, 1, 1, 1, 1,
-0.5249797, 0.4560465, -1.192057, 1, 1, 1, 1, 1,
-0.5241567, 0.7521322, -1.119698, 1, 1, 1, 1, 1,
-0.5234609, -0.2612799, -2.883015, 1, 1, 1, 1, 1,
-0.5228979, -0.8915778, -2.73107, 1, 1, 1, 1, 1,
-0.5197394, 0.224888, -0.7343883, 1, 1, 1, 1, 1,
-0.5182803, -0.001018759, -2.495265, 1, 1, 1, 1, 1,
-0.5113241, 0.1619986, -1.48962, 1, 1, 1, 1, 1,
-0.5098681, 1.651851, -0.1489192, 1, 1, 1, 1, 1,
-0.5091321, 0.6285159, -1.560333, 1, 1, 1, 1, 1,
-0.5059425, -0.6612321, -1.324862, 1, 1, 1, 1, 1,
-0.5002945, 0.8149416, -0.5840284, 1, 1, 1, 1, 1,
-0.4915631, 0.3321628, -1.059344, 1, 1, 1, 1, 1,
-0.48735, 0.3213728, -2.926957, 1, 1, 1, 1, 1,
-0.485234, 0.4608088, 0.07439476, 0, 0, 1, 1, 1,
-0.484276, 1.588434, -1.698053, 1, 0, 0, 1, 1,
-0.4829823, 0.6161463, -1.602687, 1, 0, 0, 1, 1,
-0.4826872, 0.139917, -0.5035904, 1, 0, 0, 1, 1,
-0.4820121, 0.8940097, 0.7390771, 1, 0, 0, 1, 1,
-0.4802164, 0.8898655, -0.9279979, 1, 0, 0, 1, 1,
-0.4758861, -0.837871, -4.805717, 0, 0, 0, 1, 1,
-0.4722691, 0.6882113, -2.77508, 0, 0, 0, 1, 1,
-0.4684044, 0.6201043, -2.627827, 0, 0, 0, 1, 1,
-0.4681951, 0.5257099, -0.6520114, 0, 0, 0, 1, 1,
-0.4623149, -0.4422413, -3.258012, 0, 0, 0, 1, 1,
-0.4611889, 0.2153859, -2.315978, 0, 0, 0, 1, 1,
-0.4579048, -1.075523, -1.68102, 0, 0, 0, 1, 1,
-0.4535991, 0.3748217, -1.319697, 1, 1, 1, 1, 1,
-0.4493821, 1.163327, 0.7835016, 1, 1, 1, 1, 1,
-0.4484121, 0.6958858, -0.2695743, 1, 1, 1, 1, 1,
-0.4370634, 0.8035037, -2.545545, 1, 1, 1, 1, 1,
-0.4328778, -1.166475, -3.499204, 1, 1, 1, 1, 1,
-0.4318989, 0.3215111, -0.7563836, 1, 1, 1, 1, 1,
-0.4284903, -0.3157929, -0.981663, 1, 1, 1, 1, 1,
-0.4203676, -0.08287187, -0.8670185, 1, 1, 1, 1, 1,
-0.4194925, -0.7117826, -0.1322156, 1, 1, 1, 1, 1,
-0.4161792, -0.1179451, -2.795759, 1, 1, 1, 1, 1,
-0.4156196, 2.166259, 0.1720935, 1, 1, 1, 1, 1,
-0.4145636, 1.843503, -0.03250882, 1, 1, 1, 1, 1,
-0.4132772, -1.117228, -0.3929407, 1, 1, 1, 1, 1,
-0.4102526, 0.1871982, -1.644289, 1, 1, 1, 1, 1,
-0.4102282, -0.4066775, -3.202693, 1, 1, 1, 1, 1,
-0.4044348, -1.325106, -4.529187, 0, 0, 1, 1, 1,
-0.3998328, 0.639922, 0.4604757, 1, 0, 0, 1, 1,
-0.3974801, 1.004528, 0.1586656, 1, 0, 0, 1, 1,
-0.3934777, 0.9146239, -0.7884604, 1, 0, 0, 1, 1,
-0.3829501, 0.06302707, -0.2104244, 1, 0, 0, 1, 1,
-0.3758404, 1.867391, 0.1900764, 1, 0, 0, 1, 1,
-0.3749107, 0.4278956, -1.133039, 0, 0, 0, 1, 1,
-0.3748827, -0.4013921, -1.816957, 0, 0, 0, 1, 1,
-0.3655853, -0.9154757, -4.700137, 0, 0, 0, 1, 1,
-0.3650748, 0.4788747, -1.336509, 0, 0, 0, 1, 1,
-0.3649631, 2.114693, -0.7165261, 0, 0, 0, 1, 1,
-0.3646035, 0.6886466, -0.07356352, 0, 0, 0, 1, 1,
-0.3587019, 1.012811, -1.863651, 0, 0, 0, 1, 1,
-0.3581054, 1.296281, 0.06351671, 1, 1, 1, 1, 1,
-0.3573144, -1.05764, -3.866374, 1, 1, 1, 1, 1,
-0.3550973, 0.6372911, -1.285385, 1, 1, 1, 1, 1,
-0.3502486, 0.08098833, 0.2269202, 1, 1, 1, 1, 1,
-0.349789, 0.3349569, -0.1298425, 1, 1, 1, 1, 1,
-0.3478597, 0.9263478, -0.3382858, 1, 1, 1, 1, 1,
-0.3474669, 0.6528999, -2.214433, 1, 1, 1, 1, 1,
-0.346449, -0.2993146, -3.189561, 1, 1, 1, 1, 1,
-0.3455624, 1.117784, -0.8792986, 1, 1, 1, 1, 1,
-0.3438395, 0.9364743, -0.9376999, 1, 1, 1, 1, 1,
-0.3427116, -1.889548, -2.524475, 1, 1, 1, 1, 1,
-0.3398601, 1.35474, 0.7020779, 1, 1, 1, 1, 1,
-0.3385275, -0.03059792, -2.301789, 1, 1, 1, 1, 1,
-0.334032, 0.4982514, -1.239075, 1, 1, 1, 1, 1,
-0.3312988, 0.5869046, -1.825793, 1, 1, 1, 1, 1,
-0.3312615, -0.008238624, -0.7013654, 0, 0, 1, 1, 1,
-0.3302555, 0.8351573, 0.1603169, 1, 0, 0, 1, 1,
-0.3280671, -1.4753, -3.475116, 1, 0, 0, 1, 1,
-0.3262909, -1.968607, -3.443818, 1, 0, 0, 1, 1,
-0.3233247, -1.077929, -1.513551, 1, 0, 0, 1, 1,
-0.3218627, -0.5755112, -2.446594, 1, 0, 0, 1, 1,
-0.3215336, -0.6065029, -4.709917, 0, 0, 0, 1, 1,
-0.3196616, 2.376233, 0.5516598, 0, 0, 0, 1, 1,
-0.3192002, 1.756831, -1.422415, 0, 0, 0, 1, 1,
-0.3177938, -1.753519, -1.956354, 0, 0, 0, 1, 1,
-0.3167171, 0.6664866, 1.786236, 0, 0, 0, 1, 1,
-0.3126327, -0.4137734, -2.011251, 0, 0, 0, 1, 1,
-0.3125628, -1.183485, -4.393796, 0, 0, 0, 1, 1,
-0.3120305, 1.286386, 0.31262, 1, 1, 1, 1, 1,
-0.3107012, -2.546856, -3.575001, 1, 1, 1, 1, 1,
-0.3094873, 0.6158251, -2.395231, 1, 1, 1, 1, 1,
-0.3093575, -1.6597, -2.758117, 1, 1, 1, 1, 1,
-0.3084338, 1.172212, -0.6528385, 1, 1, 1, 1, 1,
-0.3074287, 1.753131, 1.324477, 1, 1, 1, 1, 1,
-0.3049563, -0.6483305, -2.260863, 1, 1, 1, 1, 1,
-0.3011017, 0.4787515, -0.8932149, 1, 1, 1, 1, 1,
-0.2978136, 0.08588845, -1.415639, 1, 1, 1, 1, 1,
-0.2951244, -0.3887967, -1.60582, 1, 1, 1, 1, 1,
-0.2916291, 0.6579117, -0.1204491, 1, 1, 1, 1, 1,
-0.283627, -0.1687873, -0.448264, 1, 1, 1, 1, 1,
-0.2801546, 0.6725308, 0.4626267, 1, 1, 1, 1, 1,
-0.2769716, 0.8687552, 0.3583769, 1, 1, 1, 1, 1,
-0.2683263, -1.052773, -1.502569, 1, 1, 1, 1, 1,
-0.2682126, -0.3066032, -1.857935, 0, 0, 1, 1, 1,
-0.2619724, -1.584414, -3.797437, 1, 0, 0, 1, 1,
-0.2596812, -0.3494544, -2.928367, 1, 0, 0, 1, 1,
-0.2591192, -0.5420762, -2.563557, 1, 0, 0, 1, 1,
-0.2382534, -0.3414707, -2.472321, 1, 0, 0, 1, 1,
-0.2339953, 0.8400811, 0.5558689, 1, 0, 0, 1, 1,
-0.2331888, -1.494047, -3.684118, 0, 0, 0, 1, 1,
-0.2311473, 0.7095068, -0.6977792, 0, 0, 0, 1, 1,
-0.2274502, 0.3204772, -2.281263, 0, 0, 0, 1, 1,
-0.2263608, 0.2065451, -1.195927, 0, 0, 0, 1, 1,
-0.2238898, -0.6571065, -4.419542, 0, 0, 0, 1, 1,
-0.2219393, -1.867402, -3.345993, 0, 0, 0, 1, 1,
-0.2183259, -0.4067244, -2.349883, 0, 0, 0, 1, 1,
-0.216929, 0.4728694, 0.3119449, 1, 1, 1, 1, 1,
-0.2097817, 1.380317, 2.016011, 1, 1, 1, 1, 1,
-0.2090094, 0.140598, -1.319944, 1, 1, 1, 1, 1,
-0.1999163, -0.04686301, -1.272608, 1, 1, 1, 1, 1,
-0.1988839, -0.4587524, -2.416912, 1, 1, 1, 1, 1,
-0.1985651, 1.012422, -0.6732134, 1, 1, 1, 1, 1,
-0.1983485, 0.1572456, -2.692258, 1, 1, 1, 1, 1,
-0.1941872, 0.6026999, -0.437699, 1, 1, 1, 1, 1,
-0.1919815, -1.062602, -2.930885, 1, 1, 1, 1, 1,
-0.1916744, -1.971095, -2.962134, 1, 1, 1, 1, 1,
-0.1911378, -1.225144, -3.601942, 1, 1, 1, 1, 1,
-0.1844082, -0.5526727, -2.500075, 1, 1, 1, 1, 1,
-0.1832796, 0.8395885, -0.3271382, 1, 1, 1, 1, 1,
-0.1816743, 1.497728, 1.337718, 1, 1, 1, 1, 1,
-0.1813475, 1.699531, 0.6724876, 1, 1, 1, 1, 1,
-0.1812445, 0.9730919, 1.069463, 0, 0, 1, 1, 1,
-0.1811176, -1.081433, -1.803467, 1, 0, 0, 1, 1,
-0.1764968, 0.7078903, 1.020373, 1, 0, 0, 1, 1,
-0.1762764, -1.063642, -3.612023, 1, 0, 0, 1, 1,
-0.1751674, -0.280125, -1.256387, 1, 0, 0, 1, 1,
-0.1734088, -0.3338448, -2.545181, 1, 0, 0, 1, 1,
-0.1721448, -0.874772, -2.325759, 0, 0, 0, 1, 1,
-0.1683886, -0.7442592, -2.467663, 0, 0, 0, 1, 1,
-0.1654878, -0.1298499, -2.997922, 0, 0, 0, 1, 1,
-0.1645249, 1.601704, -0.4254881, 0, 0, 0, 1, 1,
-0.1610296, -0.4419769, -2.594283, 0, 0, 0, 1, 1,
-0.1586609, 0.05253005, -1.17373, 0, 0, 0, 1, 1,
-0.158024, -1.783472, -3.363168, 0, 0, 0, 1, 1,
-0.1569459, 0.1774924, -0.6046663, 1, 1, 1, 1, 1,
-0.1551538, 0.1616528, -1.835981, 1, 1, 1, 1, 1,
-0.1530893, 0.4516672, -2.000109, 1, 1, 1, 1, 1,
-0.1475263, -0.4543136, -2.882353, 1, 1, 1, 1, 1,
-0.1430178, 1.175565, 1.418415, 1, 1, 1, 1, 1,
-0.1413586, 1.339149, 1.082644, 1, 1, 1, 1, 1,
-0.1393569, -0.4542086, -1.523082, 1, 1, 1, 1, 1,
-0.1388749, 0.7420289, 0.4732536, 1, 1, 1, 1, 1,
-0.1366625, 0.6032078, -0.8217946, 1, 1, 1, 1, 1,
-0.1295242, 0.630793, 1.1721, 1, 1, 1, 1, 1,
-0.1287474, 0.0924615, -2.018065, 1, 1, 1, 1, 1,
-0.1231816, 0.6966816, -0.7869048, 1, 1, 1, 1, 1,
-0.1207012, 0.2727919, 0.4776857, 1, 1, 1, 1, 1,
-0.1181662, -1.291036, -4.448919, 1, 1, 1, 1, 1,
-0.1174877, 1.85346, -0.8625713, 1, 1, 1, 1, 1,
-0.1155813, -0.09648125, -4.543841, 0, 0, 1, 1, 1,
-0.1126998, -0.1648579, -2.144981, 1, 0, 0, 1, 1,
-0.1097633, 0.7282764, 0.1498674, 1, 0, 0, 1, 1,
-0.1050379, 0.54696, -0.8642002, 1, 0, 0, 1, 1,
-0.1018449, -0.05086201, -1.747807, 1, 0, 0, 1, 1,
-0.1014089, 1.650347, -1.170489, 1, 0, 0, 1, 1,
-0.09886773, 1.521422, 0.3839185, 0, 0, 0, 1, 1,
-0.09809578, 1.013218, -0.9993175, 0, 0, 0, 1, 1,
-0.09756961, 0.5516664, -0.05355548, 0, 0, 0, 1, 1,
-0.09418038, -0.1235592, -2.288002, 0, 0, 0, 1, 1,
-0.09287345, 0.7290189, 0.3116411, 0, 0, 0, 1, 1,
-0.08857064, 0.9444184, -0.6568487, 0, 0, 0, 1, 1,
-0.08787118, 1.443593, -1.882558, 0, 0, 0, 1, 1,
-0.08708752, -0.6803152, -2.483761, 1, 1, 1, 1, 1,
-0.08495653, 0.9054012, -1.135461, 1, 1, 1, 1, 1,
-0.08367938, 1.121827, -0.09449324, 1, 1, 1, 1, 1,
-0.07795205, 0.5257512, -0.922429, 1, 1, 1, 1, 1,
-0.07718316, 1.509751, -0.588988, 1, 1, 1, 1, 1,
-0.0767571, -0.2288526, -2.569369, 1, 1, 1, 1, 1,
-0.07639594, -0.1174943, -2.224759, 1, 1, 1, 1, 1,
-0.073851, 1.539622, -0.2675214, 1, 1, 1, 1, 1,
-0.07305876, 0.9260027, -0.1279864, 1, 1, 1, 1, 1,
-0.07301336, 0.5575362, 1.36168, 1, 1, 1, 1, 1,
-0.07005624, -1.153716, -3.82025, 1, 1, 1, 1, 1,
-0.06487909, -0.3218019, -1.721815, 1, 1, 1, 1, 1,
-0.06366876, 0.7661247, -0.5535159, 1, 1, 1, 1, 1,
-0.06331639, -0.2359531, -4.944396, 1, 1, 1, 1, 1,
-0.06139303, 0.2281007, -0.01335019, 1, 1, 1, 1, 1,
-0.06052143, -0.06505565, -2.957079, 0, 0, 1, 1, 1,
-0.05706857, -0.6892735, -3.94674, 1, 0, 0, 1, 1,
-0.05630117, -0.3581762, -2.090502, 1, 0, 0, 1, 1,
-0.05290864, 2.468546, 1.791082, 1, 0, 0, 1, 1,
-0.0527929, -0.7698587, -2.887805, 1, 0, 0, 1, 1,
-0.05154396, 0.9244085, -1.111657, 1, 0, 0, 1, 1,
-0.05015338, -0.5785969, -3.300218, 0, 0, 0, 1, 1,
-0.04820165, -0.3572778, -4.253527, 0, 0, 0, 1, 1,
-0.04574031, 0.1820873, -1.112013, 0, 0, 0, 1, 1,
-0.03917656, 2.277097, -0.818745, 0, 0, 0, 1, 1,
-0.03139506, 0.9123394, 1.312503, 0, 0, 0, 1, 1,
-0.02770156, -0.8534611, -3.198686, 0, 0, 0, 1, 1,
-0.02072017, -1.669167, -4.307152, 0, 0, 0, 1, 1,
-0.02056942, -0.004126262, -2.509423, 1, 1, 1, 1, 1,
-0.01740992, 0.04741648, -0.2044723, 1, 1, 1, 1, 1,
-0.0114739, -0.5094309, -2.356001, 1, 1, 1, 1, 1,
-0.0107252, 2.336906, 0.06882899, 1, 1, 1, 1, 1,
-0.008047787, 0.6397243, -0.7368463, 1, 1, 1, 1, 1,
-0.005201234, 1.062343, 0.1315162, 1, 1, 1, 1, 1,
-0.004249525, 0.420252, 1.475353, 1, 1, 1, 1, 1,
-0.0007342044, 0.08101188, -1.967061, 1, 1, 1, 1, 1,
0.003073552, 0.900449, 0.4947373, 1, 1, 1, 1, 1,
0.004493981, -0.1108875, 4.372497, 1, 1, 1, 1, 1,
0.004877294, -2.244756, 2.431679, 1, 1, 1, 1, 1,
0.01239893, -0.5615193, 0.1866102, 1, 1, 1, 1, 1,
0.01349391, 0.5062639, 1.051733, 1, 1, 1, 1, 1,
0.01387173, 1.245399, 0.4703688, 1, 1, 1, 1, 1,
0.01707081, -0.1537233, 4.219217, 1, 1, 1, 1, 1,
0.01975876, 1.690049, 1.480425, 0, 0, 1, 1, 1,
0.0220359, -0.7788953, 3.212902, 1, 0, 0, 1, 1,
0.02227173, 0.2787448, -0.1612539, 1, 0, 0, 1, 1,
0.02445694, 0.1929817, 2.389826, 1, 0, 0, 1, 1,
0.02841641, -0.09797554, 2.419586, 1, 0, 0, 1, 1,
0.03247475, 0.7051859, -0.2853157, 1, 0, 0, 1, 1,
0.03318698, 2.448559, -0.8859112, 0, 0, 0, 1, 1,
0.03331409, 0.3537913, -1.484493, 0, 0, 0, 1, 1,
0.03705183, -0.4525802, 3.401414, 0, 0, 0, 1, 1,
0.03858609, -0.5130709, 2.833583, 0, 0, 0, 1, 1,
0.03893058, -0.9622627, 2.280342, 0, 0, 0, 1, 1,
0.04228052, 0.1740347, -0.6636823, 0, 0, 0, 1, 1,
0.0430584, 0.7656917, -0.5143858, 0, 0, 0, 1, 1,
0.04410251, -0.5840665, 2.376245, 1, 1, 1, 1, 1,
0.04685824, -0.761677, 3.086585, 1, 1, 1, 1, 1,
0.05694311, -0.4258676, 3.564492, 1, 1, 1, 1, 1,
0.05980633, 0.3716829, -2.110564, 1, 1, 1, 1, 1,
0.06346802, -0.155909, 1.296136, 1, 1, 1, 1, 1,
0.06458019, 1.811362, -0.5160615, 1, 1, 1, 1, 1,
0.06469773, -0.7729588, 1.892855, 1, 1, 1, 1, 1,
0.07706504, -0.07936212, 0.7849393, 1, 1, 1, 1, 1,
0.07823459, 0.1330488, 0.04567223, 1, 1, 1, 1, 1,
0.0791946, 0.3335281, 0.267821, 1, 1, 1, 1, 1,
0.07972101, 1.047872, -2.015893, 1, 1, 1, 1, 1,
0.08096148, -0.6180389, 3.440116, 1, 1, 1, 1, 1,
0.08927826, 1.215106, -1.645513, 1, 1, 1, 1, 1,
0.09696254, -0.3947859, 2.700929, 1, 1, 1, 1, 1,
0.101789, -0.7173889, 2.422324, 1, 1, 1, 1, 1,
0.1018634, 0.4685982, -0.145592, 0, 0, 1, 1, 1,
0.1026311, -0.4310683, 2.406053, 1, 0, 0, 1, 1,
0.1042644, -0.3581463, 3.07617, 1, 0, 0, 1, 1,
0.1073764, -0.2292731, 2.347421, 1, 0, 0, 1, 1,
0.1091097, -0.4310861, 1.922753, 1, 0, 0, 1, 1,
0.1142466, 1.428881, 1.759502, 1, 0, 0, 1, 1,
0.1142562, -1.197506, 2.87683, 0, 0, 0, 1, 1,
0.1169249, -0.1709494, 0.3276569, 0, 0, 0, 1, 1,
0.1197978, 1.613899, -0.3402479, 0, 0, 0, 1, 1,
0.120827, -1.268437, 3.589327, 0, 0, 0, 1, 1,
0.1219058, 0.9274117, 2.341583, 0, 0, 0, 1, 1,
0.1250774, -0.0592048, 1.2322, 0, 0, 0, 1, 1,
0.135735, -0.8451587, 2.303456, 0, 0, 0, 1, 1,
0.136107, -0.351591, 2.122241, 1, 1, 1, 1, 1,
0.1404866, 2.437349, 0.6911515, 1, 1, 1, 1, 1,
0.1421149, -1.950306, 2.221375, 1, 1, 1, 1, 1,
0.1442137, 0.9117607, 0.9265675, 1, 1, 1, 1, 1,
0.1486725, 0.4039294, 1.198679, 1, 1, 1, 1, 1,
0.1523153, -0.3730455, 2.41777, 1, 1, 1, 1, 1,
0.1557078, 1.137622, 0.2243723, 1, 1, 1, 1, 1,
0.1582064, -1.057174, 3.450962, 1, 1, 1, 1, 1,
0.1598533, -1.083584, 2.506335, 1, 1, 1, 1, 1,
0.1629261, -0.5778536, 2.737206, 1, 1, 1, 1, 1,
0.1635204, -1.039204, 3.260917, 1, 1, 1, 1, 1,
0.1655961, 0.6320794, 1.131, 1, 1, 1, 1, 1,
0.1696282, -1.058898, 1.447124, 1, 1, 1, 1, 1,
0.1702244, -1.454666, 1.762296, 1, 1, 1, 1, 1,
0.1723722, -1.267517, 5.863354, 1, 1, 1, 1, 1,
0.1757505, 1.660112, -2.678829, 0, 0, 1, 1, 1,
0.1765875, -0.6075866, 2.99879, 1, 0, 0, 1, 1,
0.1774923, 0.7398232, -0.1691516, 1, 0, 0, 1, 1,
0.1800097, -1.701991, 3.242699, 1, 0, 0, 1, 1,
0.1875888, 0.5149685, 1.083898, 1, 0, 0, 1, 1,
0.191543, -0.4640018, 1.40026, 1, 0, 0, 1, 1,
0.1923742, -0.4710824, 3.417531, 0, 0, 0, 1, 1,
0.1930366, 0.002830365, 1.217545, 0, 0, 0, 1, 1,
0.1937137, 0.4316248, 1.862, 0, 0, 0, 1, 1,
0.1974608, -1.772799, 1.638631, 0, 0, 0, 1, 1,
0.1979752, 0.8228914, -0.2037475, 0, 0, 0, 1, 1,
0.1980932, 1.777405, 0.4233192, 0, 0, 0, 1, 1,
0.2007313, 0.382618, 1.659127, 0, 0, 0, 1, 1,
0.201818, -0.1495789, 1.327527, 1, 1, 1, 1, 1,
0.2071456, -0.06064319, 3.664664, 1, 1, 1, 1, 1,
0.2088201, -1.483941, 3.87929, 1, 1, 1, 1, 1,
0.2089554, -1.740127, 2.012151, 1, 1, 1, 1, 1,
0.2134858, -0.321403, 3.414265, 1, 1, 1, 1, 1,
0.213655, 0.9147412, 0.750684, 1, 1, 1, 1, 1,
0.2174003, -0.2117201, 1.510191, 1, 1, 1, 1, 1,
0.2188131, 1.812268, 0.3899103, 1, 1, 1, 1, 1,
0.2195326, -1.896042, 3.313697, 1, 1, 1, 1, 1,
0.2218687, -1.06794, 3.453743, 1, 1, 1, 1, 1,
0.2224358, 1.799495, 0.6856098, 1, 1, 1, 1, 1,
0.2228224, 0.3250572, 1.462887, 1, 1, 1, 1, 1,
0.2249718, 0.4508979, 1.150458, 1, 1, 1, 1, 1,
0.2256083, 0.1041835, 2.303581, 1, 1, 1, 1, 1,
0.2285313, 0.3856256, 1.462378, 1, 1, 1, 1, 1,
0.2320718, 0.4103409, -1.135463, 0, 0, 1, 1, 1,
0.232127, 0.2908458, 2.085257, 1, 0, 0, 1, 1,
0.2325169, -0.7859259, 3.532055, 1, 0, 0, 1, 1,
0.2328681, -0.3598935, 3.000519, 1, 0, 0, 1, 1,
0.2333999, 0.4523156, 2.366639, 1, 0, 0, 1, 1,
0.2350085, -0.8034179, 0.9696488, 1, 0, 0, 1, 1,
0.2362523, 0.4801079, -0.9654883, 0, 0, 0, 1, 1,
0.2365666, -0.08824409, 2.795646, 0, 0, 0, 1, 1,
0.2368288, -0.3241908, 3.378282, 0, 0, 0, 1, 1,
0.2394988, 0.07127925, 0.8706177, 0, 0, 0, 1, 1,
0.2416258, 0.7484972, -1.435223, 0, 0, 0, 1, 1,
0.2440994, -2.423051, 3.869618, 0, 0, 0, 1, 1,
0.2472317, -0.2542002, 2.460963, 0, 0, 0, 1, 1,
0.2499878, 2.250901, -2.480988, 1, 1, 1, 1, 1,
0.2541807, -0.2288258, 2.146106, 1, 1, 1, 1, 1,
0.2618831, -0.4634756, 3.067844, 1, 1, 1, 1, 1,
0.2672681, 0.7933546, 1.70133, 1, 1, 1, 1, 1,
0.2689158, 0.464308, 1.106215, 1, 1, 1, 1, 1,
0.2692852, -1.800744, 3.734532, 1, 1, 1, 1, 1,
0.2701027, 0.9621783, 0.1036128, 1, 1, 1, 1, 1,
0.2708758, 0.6802695, 2.352557, 1, 1, 1, 1, 1,
0.2752454, -1.020962, 0.834134, 1, 1, 1, 1, 1,
0.2753705, 1.627068, 0.4563272, 1, 1, 1, 1, 1,
0.2789838, -0.2873272, 1.770827, 1, 1, 1, 1, 1,
0.288813, -0.8725143, 0.3894864, 1, 1, 1, 1, 1,
0.2933592, 0.005586257, 0.8710675, 1, 1, 1, 1, 1,
0.2938173, -1.182387, 2.260768, 1, 1, 1, 1, 1,
0.2959503, -0.6485026, 3.708678, 1, 1, 1, 1, 1,
0.3037821, 0.08671376, 1.063323, 0, 0, 1, 1, 1,
0.3051667, 1.371196, 1.426537, 1, 0, 0, 1, 1,
0.3058969, 0.9451609, 0.860647, 1, 0, 0, 1, 1,
0.3085118, -0.2969985, 1.531842, 1, 0, 0, 1, 1,
0.309355, 0.8423448, 1.104874, 1, 0, 0, 1, 1,
0.3116233, -0.3650275, 2.644919, 1, 0, 0, 1, 1,
0.3147225, -0.532023, 2.532683, 0, 0, 0, 1, 1,
0.3252012, 1.241765, 0.9347895, 0, 0, 0, 1, 1,
0.3256727, -1.402375, 4.248179, 0, 0, 0, 1, 1,
0.3258556, 0.6818416, -0.7778966, 0, 0, 0, 1, 1,
0.3322183, 0.1562799, 2.621235, 0, 0, 0, 1, 1,
0.3339413, -0.4089943, 4.498672, 0, 0, 0, 1, 1,
0.3396754, 0.2142369, -1.107055, 0, 0, 0, 1, 1,
0.3412897, 0.4831489, -0.4230085, 1, 1, 1, 1, 1,
0.3438682, 0.4406437, 0.2600567, 1, 1, 1, 1, 1,
0.3530207, -0.0187243, 1.495405, 1, 1, 1, 1, 1,
0.3589048, -0.9870898, 3.173929, 1, 1, 1, 1, 1,
0.3610398, -1.192167, 3.907709, 1, 1, 1, 1, 1,
0.3634014, 0.3525343, 1.358078, 1, 1, 1, 1, 1,
0.3644327, 1.890527, 0.6402003, 1, 1, 1, 1, 1,
0.36791, -1.326989, 3.255862, 1, 1, 1, 1, 1,
0.3693384, 0.1887887, 0.2853146, 1, 1, 1, 1, 1,
0.3725611, 2.071251, 0.801762, 1, 1, 1, 1, 1,
0.3751129, -0.2662818, 2.414899, 1, 1, 1, 1, 1,
0.3785725, 1.222104, 0.9557695, 1, 1, 1, 1, 1,
0.3813471, 0.8058547, -0.2543655, 1, 1, 1, 1, 1,
0.383217, -0.503351, 3.181133, 1, 1, 1, 1, 1,
0.3904836, 0.8061072, 1.092832, 1, 1, 1, 1, 1,
0.3911869, -0.5636237, 1.948335, 0, 0, 1, 1, 1,
0.3919846, 0.2066767, 0.9024518, 1, 0, 0, 1, 1,
0.3919921, 0.01896167, 1.804422, 1, 0, 0, 1, 1,
0.4042268, -0.391881, 3.478799, 1, 0, 0, 1, 1,
0.4076716, -0.8628884, 3.261252, 1, 0, 0, 1, 1,
0.4099708, 0.0001579074, 1.711369, 1, 0, 0, 1, 1,
0.4101253, 1.161286, 0.4882861, 0, 0, 0, 1, 1,
0.4118495, -0.03034203, 2.947607, 0, 0, 0, 1, 1,
0.4119823, -2.208286, 2.275675, 0, 0, 0, 1, 1,
0.4123161, 0.9765341, 0.1425349, 0, 0, 0, 1, 1,
0.4136084, 1.199573, -1.1377, 0, 0, 0, 1, 1,
0.4144675, 0.9257342, 1.153867, 0, 0, 0, 1, 1,
0.4193163, 0.3461488, 0.4243108, 0, 0, 0, 1, 1,
0.4210106, -0.8902379, 2.093555, 1, 1, 1, 1, 1,
0.4399619, 0.5204638, 1.454144, 1, 1, 1, 1, 1,
0.4422922, -0.8604567, 3.301301, 1, 1, 1, 1, 1,
0.4432072, 0.2722839, 2.49936, 1, 1, 1, 1, 1,
0.4456295, 0.2712764, 1.072824, 1, 1, 1, 1, 1,
0.4459645, 1.416343, -0.4419583, 1, 1, 1, 1, 1,
0.4499054, 0.05289766, 2.248501, 1, 1, 1, 1, 1,
0.451908, -0.180607, 0.3832484, 1, 1, 1, 1, 1,
0.4521016, -1.20989, 1.038196, 1, 1, 1, 1, 1,
0.4522096, -0.01891512, 1.92003, 1, 1, 1, 1, 1,
0.4566203, 0.1455373, 2.8346, 1, 1, 1, 1, 1,
0.4595836, 0.5977492, -0.4949711, 1, 1, 1, 1, 1,
0.4624783, -1.654409, 2.649621, 1, 1, 1, 1, 1,
0.4625351, 0.884547, -0.2049227, 1, 1, 1, 1, 1,
0.4650745, 0.5723244, -0.3426457, 1, 1, 1, 1, 1,
0.4651124, -0.3228616, 1.943795, 0, 0, 1, 1, 1,
0.4727628, -0.4858834, 2.064308, 1, 0, 0, 1, 1,
0.4727805, -0.3510964, 0.6745294, 1, 0, 0, 1, 1,
0.475884, 0.001095615, 1.449045, 1, 0, 0, 1, 1,
0.4781928, 0.04559732, 0.9130347, 1, 0, 0, 1, 1,
0.479863, 1.53895, -0.7981609, 1, 0, 0, 1, 1,
0.481817, 0.03481052, 2.46431, 0, 0, 0, 1, 1,
0.4842632, -0.1915069, 3.522639, 0, 0, 0, 1, 1,
0.4856502, 0.321547, 0.8941135, 0, 0, 0, 1, 1,
0.4860568, -2.039695, 3.738016, 0, 0, 0, 1, 1,
0.4895502, 0.3667622, 1.332837, 0, 0, 0, 1, 1,
0.4984976, 1.408049, 0.2503618, 0, 0, 0, 1, 1,
0.5052623, -1.33307, 3.792398, 0, 0, 0, 1, 1,
0.5059579, 1.188635, 0.9888355, 1, 1, 1, 1, 1,
0.5060813, -0.5710467, 2.777455, 1, 1, 1, 1, 1,
0.5062383, -0.5370354, 1.405269, 1, 1, 1, 1, 1,
0.5081359, 0.1993667, 0.5403665, 1, 1, 1, 1, 1,
0.5091919, -0.1886386, 1.602234, 1, 1, 1, 1, 1,
0.5124972, -1.12424, 2.546086, 1, 1, 1, 1, 1,
0.5182067, 1.545935, -0.4980278, 1, 1, 1, 1, 1,
0.5195271, -1.029631, 4.19971, 1, 1, 1, 1, 1,
0.5209975, -0.5918999, 1.666576, 1, 1, 1, 1, 1,
0.5212647, 1.090469, 2.206992, 1, 1, 1, 1, 1,
0.5213378, -0.4699823, 3.401276, 1, 1, 1, 1, 1,
0.5230494, 0.525003, -1.049516, 1, 1, 1, 1, 1,
0.5241379, 0.8918929, 1.432627, 1, 1, 1, 1, 1,
0.5304779, 0.09889545, 0.4896235, 1, 1, 1, 1, 1,
0.5346904, -2.55315, 3.425207, 1, 1, 1, 1, 1,
0.5404283, 0.2417127, 1.239377, 0, 0, 1, 1, 1,
0.5446289, -1.265849, 1.383035, 1, 0, 0, 1, 1,
0.5523448, -0.2380183, 1.912379, 1, 0, 0, 1, 1,
0.5544866, -1.633353, 4.116998, 1, 0, 0, 1, 1,
0.5548527, 0.0768919, -0.2718368, 1, 0, 0, 1, 1,
0.5595646, 1.315031, 1.469491, 1, 0, 0, 1, 1,
0.5605687, 1.537544, -0.2091227, 0, 0, 0, 1, 1,
0.5610662, 0.08759903, 0.6144831, 0, 0, 0, 1, 1,
0.5615109, -1.611462, 2.501857, 0, 0, 0, 1, 1,
0.5615712, -0.6732743, 1.925042, 0, 0, 0, 1, 1,
0.5624366, 0.1479952, 1.495542, 0, 0, 0, 1, 1,
0.5647256, -0.5817836, 3.683526, 0, 0, 0, 1, 1,
0.5673209, -1.715447, 1.474491, 0, 0, 0, 1, 1,
0.5733995, 0.5492103, 0.8718911, 1, 1, 1, 1, 1,
0.5777475, -0.9361464, 2.425731, 1, 1, 1, 1, 1,
0.5781891, 0.5869435, 1.665325, 1, 1, 1, 1, 1,
0.5796081, 0.9753645, 0.4820177, 1, 1, 1, 1, 1,
0.581428, 1.264002, 1.476563, 1, 1, 1, 1, 1,
0.5846869, 0.7066199, 0.407902, 1, 1, 1, 1, 1,
0.5883719, -0.7461074, 4.500134, 1, 1, 1, 1, 1,
0.5901838, 1.665861, 2.165024, 1, 1, 1, 1, 1,
0.6005781, 0.1906144, 1.803382, 1, 1, 1, 1, 1,
0.6042854, -0.2951831, 1.934156, 1, 1, 1, 1, 1,
0.6051401, -0.08559189, 1.544367, 1, 1, 1, 1, 1,
0.6055852, -1.283108, 2.706593, 1, 1, 1, 1, 1,
0.6099041, -0.1219817, 1.509081, 1, 1, 1, 1, 1,
0.6116569, -0.456962, 1.811837, 1, 1, 1, 1, 1,
0.6284233, 0.7533904, 1.591275, 1, 1, 1, 1, 1,
0.6360208, 0.1289512, 1.062949, 0, 0, 1, 1, 1,
0.6360725, -0.5569324, 1.659347, 1, 0, 0, 1, 1,
0.6381758, 0.03089761, 0.4579114, 1, 0, 0, 1, 1,
0.6419741, -0.2761259, 1.574143, 1, 0, 0, 1, 1,
0.6464567, -0.3108726, 2.611104, 1, 0, 0, 1, 1,
0.6466655, 0.1675913, 0.9264476, 1, 0, 0, 1, 1,
0.6511892, -1.585667, 1.489646, 0, 0, 0, 1, 1,
0.6519094, 0.0383837, 1.642628, 0, 0, 0, 1, 1,
0.6575042, 0.9428005, 2.293402, 0, 0, 0, 1, 1,
0.6576679, 1.516171, 0.08663299, 0, 0, 0, 1, 1,
0.6606804, 0.8955063, 1.147391, 0, 0, 0, 1, 1,
0.6613923, 1.424893, 2.121301, 0, 0, 0, 1, 1,
0.6635525, 0.8530768, -0.01683183, 0, 0, 0, 1, 1,
0.6665161, -0.1914634, 2.505693, 1, 1, 1, 1, 1,
0.6707997, 0.5851234, -0.3061222, 1, 1, 1, 1, 1,
0.6717255, 0.04096127, 0.6054577, 1, 1, 1, 1, 1,
0.6721959, -0.4030817, 0.4383959, 1, 1, 1, 1, 1,
0.6752136, -1.067905, 1.499037, 1, 1, 1, 1, 1,
0.6829293, 0.7084437, 1.227749, 1, 1, 1, 1, 1,
0.6829619, -1.213952, 1.834722, 1, 1, 1, 1, 1,
0.683621, -0.4039079, 1.606399, 1, 1, 1, 1, 1,
0.6841285, 0.9815488, 0.01756838, 1, 1, 1, 1, 1,
0.6865028, 0.6231747, 0.908346, 1, 1, 1, 1, 1,
0.6869223, 0.1465064, 1.762715, 1, 1, 1, 1, 1,
0.6948902, -1.408658, 3.346367, 1, 1, 1, 1, 1,
0.6967052, 0.9224861, 1.077229, 1, 1, 1, 1, 1,
0.7007864, -0.7742035, 3.345848, 1, 1, 1, 1, 1,
0.7019293, 0.619871, 1.708449, 1, 1, 1, 1, 1,
0.7033364, 0.6661893, 1.503041, 0, 0, 1, 1, 1,
0.7036766, 0.3308573, 0.8171031, 1, 0, 0, 1, 1,
0.7050826, 0.1289617, 1.39409, 1, 0, 0, 1, 1,
0.7054138, -0.09457894, 2.469614, 1, 0, 0, 1, 1,
0.706441, 0.2763174, 1.37152, 1, 0, 0, 1, 1,
0.7097456, -0.9255492, 1.639041, 1, 0, 0, 1, 1,
0.7109473, 0.05563062, 2.00379, 0, 0, 0, 1, 1,
0.715376, -0.4011199, 2.068875, 0, 0, 0, 1, 1,
0.7161624, -1.144389, 4.018521, 0, 0, 0, 1, 1,
0.7178091, -0.5412731, 1.135294, 0, 0, 0, 1, 1,
0.7191097, 1.025692, 1.628511, 0, 0, 0, 1, 1,
0.7217208, 1.754041, 0.8158317, 0, 0, 0, 1, 1,
0.7233214, 1.245118, -0.7824339, 0, 0, 0, 1, 1,
0.7236798, -1.163023, 4.872088, 1, 1, 1, 1, 1,
0.7286956, 1.258674, -0.001798912, 1, 1, 1, 1, 1,
0.7320564, -1.240433, 2.854144, 1, 1, 1, 1, 1,
0.7325701, -0.6526711, 1.216014, 1, 1, 1, 1, 1,
0.7366721, 0.01567951, -1.100508, 1, 1, 1, 1, 1,
0.7398213, 3.444666, -0.3622701, 1, 1, 1, 1, 1,
0.746896, 0.3618684, 2.882303, 1, 1, 1, 1, 1,
0.7475117, 1.613926, 1.445618, 1, 1, 1, 1, 1,
0.748552, -0.1596271, 3.079037, 1, 1, 1, 1, 1,
0.7503281, -0.6433929, 1.933171, 1, 1, 1, 1, 1,
0.7508118, -1.746521, 0.9991672, 1, 1, 1, 1, 1,
0.7532192, 0.08765057, 1.999355, 1, 1, 1, 1, 1,
0.7546996, 0.479214, 0.7953457, 1, 1, 1, 1, 1,
0.7549323, 0.7027169, 0.3868466, 1, 1, 1, 1, 1,
0.7581238, -0.5356844, 3.252241, 1, 1, 1, 1, 1,
0.7603022, 0.4050088, 1.194416, 0, 0, 1, 1, 1,
0.7729818, -1.601747, 2.809381, 1, 0, 0, 1, 1,
0.773727, 0.3075776, 1.187694, 1, 0, 0, 1, 1,
0.7741401, -1.467548, 0.8087419, 1, 0, 0, 1, 1,
0.7856153, 0.3184713, 0.2744342, 1, 0, 0, 1, 1,
0.7858765, -0.3543732, 2.434341, 1, 0, 0, 1, 1,
0.7862237, -0.6655382, 1.882441, 0, 0, 0, 1, 1,
0.7879598, 0.5928584, 0.9586783, 0, 0, 0, 1, 1,
0.7923802, -1.495799, 1.922991, 0, 0, 0, 1, 1,
0.7965744, 1.44698, 0.4988156, 0, 0, 0, 1, 1,
0.8039602, 0.1337172, 2.816486, 0, 0, 0, 1, 1,
0.8052473, 0.507219, -1.207844, 0, 0, 0, 1, 1,
0.8066048, 0.5533777, 1.339716, 0, 0, 0, 1, 1,
0.8098045, -1.180721, 1.906974, 1, 1, 1, 1, 1,
0.8099082, -0.5485489, 1.699799, 1, 1, 1, 1, 1,
0.8128573, -0.4543205, 3.007374, 1, 1, 1, 1, 1,
0.8150954, 0.6154794, 3.774652, 1, 1, 1, 1, 1,
0.8159406, -0.215359, 0.9052944, 1, 1, 1, 1, 1,
0.8184691, 1.049226, 0.5316767, 1, 1, 1, 1, 1,
0.820026, -0.7827722, 1.795446, 1, 1, 1, 1, 1,
0.8200839, 0.3092658, 2.53843, 1, 1, 1, 1, 1,
0.8379418, 0.8507621, 1.221784, 1, 1, 1, 1, 1,
0.8388674, 0.7132487, 0.65206, 1, 1, 1, 1, 1,
0.8442507, -1.527596, 1.415716, 1, 1, 1, 1, 1,
0.8469632, 0.4533599, 0.552062, 1, 1, 1, 1, 1,
0.8491784, -1.200644, 3.203591, 1, 1, 1, 1, 1,
0.8523204, -0.3641391, 1.03589, 1, 1, 1, 1, 1,
0.8576297, -0.6455472, 0.8821362, 1, 1, 1, 1, 1,
0.8591731, -1.220784, 2.698219, 0, 0, 1, 1, 1,
0.8648538, 1.519678, -0.1373397, 1, 0, 0, 1, 1,
0.8721577, 0.9797618, 2.971023, 1, 0, 0, 1, 1,
0.8780206, 0.1863066, 3.891324, 1, 0, 0, 1, 1,
0.8801717, -1.232023, 2.238231, 1, 0, 0, 1, 1,
0.884875, 0.1443341, 0.8963041, 1, 0, 0, 1, 1,
0.8852626, -0.02105105, 0.6598091, 0, 0, 0, 1, 1,
0.8863212, -0.6738174, 2.293736, 0, 0, 0, 1, 1,
0.8915619, 0.3650455, 1.054575, 0, 0, 0, 1, 1,
0.8931653, 0.9093861, 2.159129, 0, 0, 0, 1, 1,
0.8965895, 0.2210738, 1.254801, 0, 0, 0, 1, 1,
0.8972985, 1.090864, -1.477113, 0, 0, 0, 1, 1,
0.8989609, 0.7284701, 2.459705, 0, 0, 0, 1, 1,
0.8990854, -0.3662805, 1.978937, 1, 1, 1, 1, 1,
0.8999915, 0.9687335, 1.300014, 1, 1, 1, 1, 1,
0.9035829, -1.472824, 1.664359, 1, 1, 1, 1, 1,
0.90681, 1.520704, -0.7390935, 1, 1, 1, 1, 1,
0.9077754, 1.351798, 0.7767393, 1, 1, 1, 1, 1,
0.9090809, -0.6980333, 1.047866, 1, 1, 1, 1, 1,
0.9182662, -1.267338, 1.249896, 1, 1, 1, 1, 1,
0.9204935, 1.281789, 0.9568853, 1, 1, 1, 1, 1,
0.9207409, -1.497713, 1.819636, 1, 1, 1, 1, 1,
0.9210109, 0.4977082, 2.728169, 1, 1, 1, 1, 1,
0.9278546, 1.213679, 0.4883876, 1, 1, 1, 1, 1,
0.9314615, 0.8682526, 1.930597, 1, 1, 1, 1, 1,
0.9360637, 0.1848194, 2.099361, 1, 1, 1, 1, 1,
0.9393049, -0.2743555, 2.643533, 1, 1, 1, 1, 1,
0.9407697, -0.2752315, 1.004778, 1, 1, 1, 1, 1,
0.9421474, -1.176903, 2.554192, 0, 0, 1, 1, 1,
0.9498332, -1.203294, 3.817635, 1, 0, 0, 1, 1,
0.9521232, 0.1418856, 2.088507, 1, 0, 0, 1, 1,
0.9533751, 0.01421917, 2.545824, 1, 0, 0, 1, 1,
0.9596097, 1.432282, 1.072909, 1, 0, 0, 1, 1,
0.9617181, -0.2062883, 1.181906, 1, 0, 0, 1, 1,
0.9620945, -1.998115, 3.703059, 0, 0, 0, 1, 1,
0.9661367, 0.752363, 0.5746987, 0, 0, 0, 1, 1,
0.9742237, 0.6536066, 0.8372372, 0, 0, 0, 1, 1,
0.9743068, 1.09725, -0.9401037, 0, 0, 0, 1, 1,
0.9753656, -0.4218689, 1.312858, 0, 0, 0, 1, 1,
0.9758279, 0.4224522, 2.174372, 0, 0, 0, 1, 1,
0.9765385, -1.347644, 2.081359, 0, 0, 0, 1, 1,
0.9830499, -0.6727657, 4.369889, 1, 1, 1, 1, 1,
0.9861991, 0.4830242, 0.9619057, 1, 1, 1, 1, 1,
0.9996793, 1.421981, -0.4228049, 1, 1, 1, 1, 1,
1.010788, -1.684912, 1.424162, 1, 1, 1, 1, 1,
1.012887, -0.3947878, 2.166086, 1, 1, 1, 1, 1,
1.035479, 1.123331, 1.596027, 1, 1, 1, 1, 1,
1.036841, 0.09415363, 0.01310709, 1, 1, 1, 1, 1,
1.043546, 1.360852, -0.4927292, 1, 1, 1, 1, 1,
1.048064, -0.3785072, 3.045216, 1, 1, 1, 1, 1,
1.05007, -0.8951433, 2.729706, 1, 1, 1, 1, 1,
1.059935, -1.209786, 2.13432, 1, 1, 1, 1, 1,
1.065887, -1.568497, 2.006603, 1, 1, 1, 1, 1,
1.066428, 0.0572219, 0.9605047, 1, 1, 1, 1, 1,
1.074079, 1.450687, 0.6830423, 1, 1, 1, 1, 1,
1.088376, -0.4012518, 2.514744, 1, 1, 1, 1, 1,
1.090801, -0.8521121, 2.368306, 0, 0, 1, 1, 1,
1.099848, 0.3738658, 1.091944, 1, 0, 0, 1, 1,
1.102229, 0.8668956, 0.1748964, 1, 0, 0, 1, 1,
1.102443, -0.522568, 2.36789, 1, 0, 0, 1, 1,
1.104984, -1.059636, 1.053672, 1, 0, 0, 1, 1,
1.10551, -1.04005, 2.557884, 1, 0, 0, 1, 1,
1.108553, 0.1490034, 0.4164952, 0, 0, 0, 1, 1,
1.109608, 1.560849, 1.14307, 0, 0, 0, 1, 1,
1.113419, 0.3037237, 0.207494, 0, 0, 0, 1, 1,
1.113986, 0.1663477, 0.2515702, 0, 0, 0, 1, 1,
1.118544, 0.9554129, 2.04007, 0, 0, 0, 1, 1,
1.120909, -0.1468952, 3.409424, 0, 0, 0, 1, 1,
1.135356, -1.506195, 3.160656, 0, 0, 0, 1, 1,
1.135717, 1.604512, -0.7275938, 1, 1, 1, 1, 1,
1.135956, -1.468107, 3.326701, 1, 1, 1, 1, 1,
1.138826, -0.4119462, -0.02892959, 1, 1, 1, 1, 1,
1.143975, -1.14575, 0.8857836, 1, 1, 1, 1, 1,
1.144339, 0.9134413, -0.5031614, 1, 1, 1, 1, 1,
1.151736, -0.5200741, 3.447264, 1, 1, 1, 1, 1,
1.152231, -0.6306603, 1.342132, 1, 1, 1, 1, 1,
1.152518, -0.9028387, 3.731677, 1, 1, 1, 1, 1,
1.159261, 0.4930585, 0.7486454, 1, 1, 1, 1, 1,
1.162611, -0.2342785, 1.34345, 1, 1, 1, 1, 1,
1.16638, 0.4600555, 2.999123, 1, 1, 1, 1, 1,
1.177244, 0.5832545, 3.079079, 1, 1, 1, 1, 1,
1.180532, 0.04102405, 1.138101, 1, 1, 1, 1, 1,
1.183532, -0.1594218, 0.835707, 1, 1, 1, 1, 1,
1.184344, -0.6438064, 3.311269, 1, 1, 1, 1, 1,
1.185881, 0.5026497, 1.043938, 0, 0, 1, 1, 1,
1.186187, 0.8333294, 1.466165, 1, 0, 0, 1, 1,
1.192375, 1.368611, 1.213055, 1, 0, 0, 1, 1,
1.195429, -1.516905, 1.542534, 1, 0, 0, 1, 1,
1.198861, -0.3315985, 0.05638598, 1, 0, 0, 1, 1,
1.218151, -0.07708032, 0.5849875, 1, 0, 0, 1, 1,
1.220149, 0.8982432, 0.6971493, 0, 0, 0, 1, 1,
1.22725, 0.3689196, 1.204754, 0, 0, 0, 1, 1,
1.227892, 0.001937258, 1.724635, 0, 0, 0, 1, 1,
1.232105, 2.550029, 0.6693229, 0, 0, 0, 1, 1,
1.232551, 1.299746, -1.203829, 0, 0, 0, 1, 1,
1.237628, 0.9772055, 0.6897135, 0, 0, 0, 1, 1,
1.246093, 2.05612, -0.374414, 0, 0, 0, 1, 1,
1.2658, -0.6758774, 2.161871, 1, 1, 1, 1, 1,
1.278704, -0.6173218, 3.065641, 1, 1, 1, 1, 1,
1.283826, -0.4374913, 0.6136757, 1, 1, 1, 1, 1,
1.287578, -2.657207, 2.855219, 1, 1, 1, 1, 1,
1.291142, 0.3592038, 1.086624, 1, 1, 1, 1, 1,
1.302279, -0.1953491, 3.657729, 1, 1, 1, 1, 1,
1.319605, -1.309517, 3.185398, 1, 1, 1, 1, 1,
1.32586, -1.852026, 1.287854, 1, 1, 1, 1, 1,
1.326761, 0.2389509, -1.143865, 1, 1, 1, 1, 1,
1.339869, -0.5058496, 2.795405, 1, 1, 1, 1, 1,
1.351408, 0.3921594, 1.146041, 1, 1, 1, 1, 1,
1.359436, 0.4601423, 1.2354, 1, 1, 1, 1, 1,
1.36501, 0.0574457, -0.659354, 1, 1, 1, 1, 1,
1.365205, 0.5163358, 1.777597, 1, 1, 1, 1, 1,
1.365644, 1.213915, 0.7561806, 1, 1, 1, 1, 1,
1.367426, -0.0660837, 0.3561471, 0, 0, 1, 1, 1,
1.378409, -0.8884508, -0.07602773, 1, 0, 0, 1, 1,
1.382296, 0.3893997, 0.9462678, 1, 0, 0, 1, 1,
1.388901, 0.344777, 2.235952, 1, 0, 0, 1, 1,
1.389777, -0.4678648, 0.9874915, 1, 0, 0, 1, 1,
1.393977, -0.6293918, 2.148569, 1, 0, 0, 1, 1,
1.398598, 0.3817873, 1.443153, 0, 0, 0, 1, 1,
1.412256, 0.4786042, 1.360758, 0, 0, 0, 1, 1,
1.412526, 1.375169, -0.03872172, 0, 0, 0, 1, 1,
1.419232, -1.374259, 2.433054, 0, 0, 0, 1, 1,
1.437915, 0.7834123, 0.1437043, 0, 0, 0, 1, 1,
1.446728, -0.6574104, 1.039476, 0, 0, 0, 1, 1,
1.454888, -0.4670076, 1.890063, 0, 0, 0, 1, 1,
1.45903, 0.06395815, -0.7108647, 1, 1, 1, 1, 1,
1.466576, 1.229882, 1.532039, 1, 1, 1, 1, 1,
1.474331, 0.9227999, 1.105773, 1, 1, 1, 1, 1,
1.477769, 0.9992276, 2.086236, 1, 1, 1, 1, 1,
1.490931, 2.001212, 1.512715, 1, 1, 1, 1, 1,
1.500417, -0.3571147, 1.187955, 1, 1, 1, 1, 1,
1.506755, 0.4830374, 0.4389045, 1, 1, 1, 1, 1,
1.511014, -0.6077799, 2.558821, 1, 1, 1, 1, 1,
1.511901, 1.285176, 2.167821, 1, 1, 1, 1, 1,
1.519084, 0.1951119, 3.471835, 1, 1, 1, 1, 1,
1.531395, 1.216588, 1.856182, 1, 1, 1, 1, 1,
1.537456, 0.9447846, 1.61744, 1, 1, 1, 1, 1,
1.559274, 0.7986628, 0.9729144, 1, 1, 1, 1, 1,
1.562956, 1.258929, -0.4457155, 1, 1, 1, 1, 1,
1.571562, 0.1309386, 0.4294577, 1, 1, 1, 1, 1,
1.576268, 1.215007, -0.1500275, 0, 0, 1, 1, 1,
1.588789, 0.3391993, 0.316227, 1, 0, 0, 1, 1,
1.589124, 1.236391, 0.34165, 1, 0, 0, 1, 1,
1.600858, -1.125984, 2.302257, 1, 0, 0, 1, 1,
1.62011, -1.677695, 2.189864, 1, 0, 0, 1, 1,
1.65064, 0.3239503, 2.387298, 1, 0, 0, 1, 1,
1.654596, -0.6017331, 0.9742609, 0, 0, 0, 1, 1,
1.677098, -0.1481275, 3.60386, 0, 0, 0, 1, 1,
1.677334, -0.8603874, 2.071021, 0, 0, 0, 1, 1,
1.686222, 1.92746, 0.9554098, 0, 0, 0, 1, 1,
1.706471, -0.1395678, 1.748305, 0, 0, 0, 1, 1,
1.717823, -1.574341, 2.19019, 0, 0, 0, 1, 1,
1.72386, 0.2164239, 0.8417239, 0, 0, 0, 1, 1,
1.730499, -0.6921924, 1.240106, 1, 1, 1, 1, 1,
1.753895, 2.181382, 0.331858, 1, 1, 1, 1, 1,
1.767397, -0.1020032, 0.1880604, 1, 1, 1, 1, 1,
1.767929, -1.166085, 4.764843, 1, 1, 1, 1, 1,
1.781185, 0.2872972, 2.191425, 1, 1, 1, 1, 1,
1.781343, -0.8945368, 0.771725, 1, 1, 1, 1, 1,
1.785385, 0.4596966, 1.242467, 1, 1, 1, 1, 1,
1.801591, 0.06338069, 2.162332, 1, 1, 1, 1, 1,
1.814254, -0.06779272, 2.196913, 1, 1, 1, 1, 1,
1.823235, -0.7656221, 1.950252, 1, 1, 1, 1, 1,
1.829949, 0.5823652, 2.398561, 1, 1, 1, 1, 1,
1.857182, -0.7506473, 2.11686, 1, 1, 1, 1, 1,
1.921356, -1.084996, 0.6633521, 1, 1, 1, 1, 1,
2.001544, 1.352332, 2.05894, 1, 1, 1, 1, 1,
2.006031, -0.7994055, 3.431691, 1, 1, 1, 1, 1,
2.009903, -0.5931106, 3.444944, 0, 0, 1, 1, 1,
2.012056, 0.5473772, 0.6025753, 1, 0, 0, 1, 1,
2.047736, 1.265631, 0.1939143, 1, 0, 0, 1, 1,
2.056062, -0.465916, 1.757774, 1, 0, 0, 1, 1,
2.057978, -0.8709932, 1.678637, 1, 0, 0, 1, 1,
2.091895, -0.379817, 1.562018, 1, 0, 0, 1, 1,
2.094101, -0.304441, 2.201057, 0, 0, 0, 1, 1,
2.131219, -0.1205927, 2.026105, 0, 0, 0, 1, 1,
2.142111, 0.363611, 2.160136, 0, 0, 0, 1, 1,
2.182925, 0.6508958, 1.006498, 0, 0, 0, 1, 1,
2.356478, 0.8351559, 1.788751, 0, 0, 0, 1, 1,
2.359516, 1.212344, 2.211622, 0, 0, 0, 1, 1,
2.365648, 0.2464922, 3.408227, 0, 0, 0, 1, 1,
2.370103, -2.513652, 4.021251, 1, 1, 1, 1, 1,
2.384784, 0.4369238, 1.371791, 1, 1, 1, 1, 1,
2.447359, 1.539142, -0.2329973, 1, 1, 1, 1, 1,
2.614707, -1.10585, 1.37723, 1, 1, 1, 1, 1,
2.618535, -0.2814008, -0.592092, 1, 1, 1, 1, 1,
2.637739, 0.9943056, 3.614977, 1, 1, 1, 1, 1,
2.665502, 0.4408791, 0.6002021, 1, 1, 1, 1, 1
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
var radius = 9.409411;
var distance = 33.05016;
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
mvMatrix.translate( 0.1083256, -0.2114995, -0.4594789 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05016);
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
