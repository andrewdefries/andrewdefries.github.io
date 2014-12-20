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
-3.140453, 2.05453, -0.793804, 1, 0, 0, 1,
-2.879396, -1.517113, -2.254955, 1, 0.007843138, 0, 1,
-2.741785, 1.003874, -1.355837, 1, 0.01176471, 0, 1,
-2.680244, 0.2922064, -2.067148, 1, 0.01960784, 0, 1,
-2.675905, -0.3964166, -1.214154, 1, 0.02352941, 0, 1,
-2.67106, 0.9158585, 0.09801833, 1, 0.03137255, 0, 1,
-2.609001, 0.9321585, -1.732169, 1, 0.03529412, 0, 1,
-2.578468, -1.787092, -0.8495988, 1, 0.04313726, 0, 1,
-2.487474, -0.4000165, -2.098491, 1, 0.04705882, 0, 1,
-2.409919, -0.6978993, -1.475175, 1, 0.05490196, 0, 1,
-2.289241, -0.04161775, -0.6648168, 1, 0.05882353, 0, 1,
-2.243394, 0.4635054, -0.4125932, 1, 0.06666667, 0, 1,
-2.213522, -1.439203, -2.907014, 1, 0.07058824, 0, 1,
-2.198173, -1.437979, -0.2199394, 1, 0.07843138, 0, 1,
-2.176344, 1.040127, -2.50514, 1, 0.08235294, 0, 1,
-2.152045, 1.487963, -0.1310539, 1, 0.09019608, 0, 1,
-2.109669, -0.4317566, -2.424382, 1, 0.09411765, 0, 1,
-2.108531, 2.016995, 0.05324544, 1, 0.1019608, 0, 1,
-2.055561, -0.9343358, -2.606831, 1, 0.1098039, 0, 1,
-2.053274, -2.635357, -3.101079, 1, 0.1137255, 0, 1,
-1.996464, 0.168759, -0.8153379, 1, 0.1215686, 0, 1,
-1.976467, 0.6411071, -0.8872228, 1, 0.1254902, 0, 1,
-1.969732, -0.2869736, -2.370099, 1, 0.1333333, 0, 1,
-1.965935, -0.8148733, -3.096153, 1, 0.1372549, 0, 1,
-1.956708, 0.1827066, -0.4711694, 1, 0.145098, 0, 1,
-1.937596, -0.3426431, -1.001076, 1, 0.1490196, 0, 1,
-1.916424, 0.08088923, -2.278342, 1, 0.1568628, 0, 1,
-1.901646, 1.680287, -1.368741, 1, 0.1607843, 0, 1,
-1.898495, 0.3292141, -1.049775, 1, 0.1686275, 0, 1,
-1.898465, -1.27251, -3.936913, 1, 0.172549, 0, 1,
-1.85993, -1.198224, -1.354345, 1, 0.1803922, 0, 1,
-1.856881, -1.429355, -0.3728676, 1, 0.1843137, 0, 1,
-1.856727, 1.112924, -0.2241107, 1, 0.1921569, 0, 1,
-1.852728, -0.369319, 0.1477766, 1, 0.1960784, 0, 1,
-1.842357, -1.083603, -3.143274, 1, 0.2039216, 0, 1,
-1.837555, 0.1830133, 0.6620613, 1, 0.2117647, 0, 1,
-1.83149, -1.022901, -0.6932106, 1, 0.2156863, 0, 1,
-1.815217, 1.571536, -0.3547938, 1, 0.2235294, 0, 1,
-1.778928, -0.6058899, -4.601175, 1, 0.227451, 0, 1,
-1.761873, 1.715008, -0.9862641, 1, 0.2352941, 0, 1,
-1.760971, 0.8864714, -1.384673, 1, 0.2392157, 0, 1,
-1.719499, -0.3972812, 0.1303051, 1, 0.2470588, 0, 1,
-1.716935, 1.106402, -2.714744, 1, 0.2509804, 0, 1,
-1.715093, 0.1603619, -2.500058, 1, 0.2588235, 0, 1,
-1.69964, -0.5769172, -1.521132, 1, 0.2627451, 0, 1,
-1.695737, 1.029771, -2.111997, 1, 0.2705882, 0, 1,
-1.683298, 0.4651352, -1.825969, 1, 0.2745098, 0, 1,
-1.672143, -1.057995, -1.690444, 1, 0.282353, 0, 1,
-1.649032, -0.5721887, -1.70709, 1, 0.2862745, 0, 1,
-1.632883, -0.5696604, -2.437088, 1, 0.2941177, 0, 1,
-1.627568, -0.5705674, -3.019371, 1, 0.3019608, 0, 1,
-1.621313, 0.2197038, -2.031536, 1, 0.3058824, 0, 1,
-1.618418, -0.3347165, 0.2715757, 1, 0.3137255, 0, 1,
-1.616852, 0.4803081, -1.121167, 1, 0.3176471, 0, 1,
-1.601473, 1.790554, -1.069496, 1, 0.3254902, 0, 1,
-1.595416, -1.069221, -2.530442, 1, 0.3294118, 0, 1,
-1.556624, 0.2704596, -0.5113391, 1, 0.3372549, 0, 1,
-1.556477, 0.8699347, -1.584121, 1, 0.3411765, 0, 1,
-1.553801, -2.37704, -1.618676, 1, 0.3490196, 0, 1,
-1.553626, 1.166927, -0.8399278, 1, 0.3529412, 0, 1,
-1.552657, -0.008280886, -1.485142, 1, 0.3607843, 0, 1,
-1.548425, 0.6442274, -1.650097, 1, 0.3647059, 0, 1,
-1.538227, 0.6607977, -1.276633, 1, 0.372549, 0, 1,
-1.537259, -1.369727, -3.022106, 1, 0.3764706, 0, 1,
-1.528082, -0.2640332, -1.604259, 1, 0.3843137, 0, 1,
-1.525007, 1.673393, 1.137218, 1, 0.3882353, 0, 1,
-1.506507, 0.002249668, -1.332174, 1, 0.3960784, 0, 1,
-1.496741, -1.031972, -1.506133, 1, 0.4039216, 0, 1,
-1.483725, -0.4643608, -1.278106, 1, 0.4078431, 0, 1,
-1.479571, 1.207674, -1.11801, 1, 0.4156863, 0, 1,
-1.473659, 1.108353, -0.1168795, 1, 0.4196078, 0, 1,
-1.454599, 0.3577372, -1.751488, 1, 0.427451, 0, 1,
-1.447554, -0.1382181, -2.551782, 1, 0.4313726, 0, 1,
-1.443514, 0.3254907, -2.405521, 1, 0.4392157, 0, 1,
-1.438625, 1.444999, 1.088022, 1, 0.4431373, 0, 1,
-1.415684, -1.086774, -1.129821, 1, 0.4509804, 0, 1,
-1.414132, 0.5986192, -0.5716245, 1, 0.454902, 0, 1,
-1.407103, -1.150131, -3.209491, 1, 0.4627451, 0, 1,
-1.406511, -1.117359, -1.954198, 1, 0.4666667, 0, 1,
-1.405601, 0.5642905, -2.01374, 1, 0.4745098, 0, 1,
-1.396191, 0.3053921, -2.000019, 1, 0.4784314, 0, 1,
-1.392294, -0.8025436, -2.984436, 1, 0.4862745, 0, 1,
-1.389741, 0.04337882, -0.2132162, 1, 0.4901961, 0, 1,
-1.38844, -0.1964314, -2.36815, 1, 0.4980392, 0, 1,
-1.388239, -1.175731, -1.27099, 1, 0.5058824, 0, 1,
-1.386949, 0.826564, 1.079168, 1, 0.509804, 0, 1,
-1.382399, -0.1568745, -2.691106, 1, 0.5176471, 0, 1,
-1.368978, -1.448122, -1.86221, 1, 0.5215687, 0, 1,
-1.368069, 1.017538, -2.322397, 1, 0.5294118, 0, 1,
-1.333131, -0.1622625, -2.349566, 1, 0.5333334, 0, 1,
-1.332775, -1.19368, -1.822945, 1, 0.5411765, 0, 1,
-1.329494, 1.404863, -1.722917, 1, 0.5450981, 0, 1,
-1.327481, 1.240484, -1.362991, 1, 0.5529412, 0, 1,
-1.325706, 1.058107, -0.4694847, 1, 0.5568628, 0, 1,
-1.323946, -2.130311, -2.265144, 1, 0.5647059, 0, 1,
-1.313423, -1.450044, -2.338999, 1, 0.5686275, 0, 1,
-1.302445, 0.7076695, -2.784249, 1, 0.5764706, 0, 1,
-1.297884, 0.3381369, -2.302951, 1, 0.5803922, 0, 1,
-1.296949, -0.3300329, -1.069131, 1, 0.5882353, 0, 1,
-1.29255, -1.479117, -1.033716, 1, 0.5921569, 0, 1,
-1.271948, -1.400665, -2.369069, 1, 0.6, 0, 1,
-1.265197, 0.7765698, 0.776437, 1, 0.6078432, 0, 1,
-1.262669, -0.7081254, -1.918486, 1, 0.6117647, 0, 1,
-1.256438, 1.234214, -1.409908, 1, 0.6196079, 0, 1,
-1.245349, -0.1605884, -0.4924838, 1, 0.6235294, 0, 1,
-1.245258, 1.302769, -1.895961, 1, 0.6313726, 0, 1,
-1.241801, 0.8603353, -1.178223, 1, 0.6352941, 0, 1,
-1.240401, 1.56116, -0.6592662, 1, 0.6431373, 0, 1,
-1.239642, 0.3834527, -0.1964165, 1, 0.6470588, 0, 1,
-1.230967, -0.6722439, -2.255385, 1, 0.654902, 0, 1,
-1.228578, -1.256425, -1.934008, 1, 0.6588235, 0, 1,
-1.22811, -1.442552, -3.511939, 1, 0.6666667, 0, 1,
-1.218042, -1.4493, -3.030719, 1, 0.6705883, 0, 1,
-1.214689, 1.194131, -1.88937, 1, 0.6784314, 0, 1,
-1.210635, 1.073858, -0.3952965, 1, 0.682353, 0, 1,
-1.198631, -0.190043, -3.263729, 1, 0.6901961, 0, 1,
-1.195103, -0.2755232, -2.70445, 1, 0.6941177, 0, 1,
-1.17691, 0.409974, -0.7623841, 1, 0.7019608, 0, 1,
-1.173737, 0.7343459, 0.2214811, 1, 0.7098039, 0, 1,
-1.166137, 1.896202, -0.2441057, 1, 0.7137255, 0, 1,
-1.165587, -0.3327504, -1.815743, 1, 0.7215686, 0, 1,
-1.162343, -0.4536016, -1.971578, 1, 0.7254902, 0, 1,
-1.154153, 1.134083, -0.1404407, 1, 0.7333333, 0, 1,
-1.144734, -1.102752, -2.344922, 1, 0.7372549, 0, 1,
-1.13947, -0.6899707, -2.68853, 1, 0.7450981, 0, 1,
-1.130299, 0.6755715, 0.3607012, 1, 0.7490196, 0, 1,
-1.129952, -0.212391, -2.607738, 1, 0.7568628, 0, 1,
-1.1259, -0.7992971, -1.583581, 1, 0.7607843, 0, 1,
-1.123403, 0.3247849, -1.451058, 1, 0.7686275, 0, 1,
-1.12305, -0.2524494, -2.336864, 1, 0.772549, 0, 1,
-1.122847, 0.7991269, -1.190538, 1, 0.7803922, 0, 1,
-1.116965, 0.1924147, -0.7427002, 1, 0.7843137, 0, 1,
-1.114944, 0.1458992, -1.902905, 1, 0.7921569, 0, 1,
-1.110604, -0.3692803, -4.111267, 1, 0.7960784, 0, 1,
-1.099572, -1.011574, -3.486974, 1, 0.8039216, 0, 1,
-1.098197, -0.5666766, -2.088123, 1, 0.8117647, 0, 1,
-1.087085, -1.577286, -1.538475, 1, 0.8156863, 0, 1,
-1.077137, -0.5550838, -3.477415, 1, 0.8235294, 0, 1,
-1.076145, -0.5879551, -1.437861, 1, 0.827451, 0, 1,
-1.07391, -1.666139, -2.380133, 1, 0.8352941, 0, 1,
-1.07311, 1.044177, 0.09959436, 1, 0.8392157, 0, 1,
-1.070677, -0.3643067, -2.156977, 1, 0.8470588, 0, 1,
-1.069786, 0.06394995, -2.9283, 1, 0.8509804, 0, 1,
-1.064731, -0.1906511, -1.474391, 1, 0.8588235, 0, 1,
-1.060191, 0.6835418, -1.368066, 1, 0.8627451, 0, 1,
-1.06014, -0.9528056, -1.645474, 1, 0.8705882, 0, 1,
-1.048211, 0.7251819, -0.5012547, 1, 0.8745098, 0, 1,
-1.038066, 0.5133124, -0.8491262, 1, 0.8823529, 0, 1,
-1.033358, 1.034405, -1.834704, 1, 0.8862745, 0, 1,
-1.031922, -0.7490388, -2.595873, 1, 0.8941177, 0, 1,
-1.0313, 1.308895, -0.2779928, 1, 0.8980392, 0, 1,
-1.028337, -0.4087854, -1.817845, 1, 0.9058824, 0, 1,
-1.026903, 0.9019251, -1.783056, 1, 0.9137255, 0, 1,
-1.023412, 0.05072715, -1.94509, 1, 0.9176471, 0, 1,
-1.017589, 0.1647435, -2.96843, 1, 0.9254902, 0, 1,
-1.013572, 0.7471179, -0.1313742, 1, 0.9294118, 0, 1,
-1.007916, 1.503958, -1.157817, 1, 0.9372549, 0, 1,
-1.004683, -0.7398341, -1.90793, 1, 0.9411765, 0, 1,
-1.001076, 0.1165422, -1.631061, 1, 0.9490196, 0, 1,
-0.9999723, -1.282333, -2.330822, 1, 0.9529412, 0, 1,
-0.9991633, -0.5872463, -1.982547, 1, 0.9607843, 0, 1,
-0.9964144, 1.953761, -1.965374, 1, 0.9647059, 0, 1,
-0.9956835, 0.4143598, -0.9407576, 1, 0.972549, 0, 1,
-0.9848197, 1.537091, -0.3876788, 1, 0.9764706, 0, 1,
-0.9828815, -1.534026, -2.810194, 1, 0.9843137, 0, 1,
-0.9819918, 1.065751, -1.327209, 1, 0.9882353, 0, 1,
-0.9744827, 0.297093, -0.6328628, 1, 0.9960784, 0, 1,
-0.9720383, -0.1544707, -0.8887358, 0.9960784, 1, 0, 1,
-0.9691269, 0.6928365, 1.130985, 0.9921569, 1, 0, 1,
-0.9644343, -0.3085161, -1.089997, 0.9843137, 1, 0, 1,
-0.963906, 0.9775, -0.8404162, 0.9803922, 1, 0, 1,
-0.9635756, 0.9780001, -1.591217, 0.972549, 1, 0, 1,
-0.9614688, 0.5439591, -0.567988, 0.9686275, 1, 0, 1,
-0.961334, -0.3305798, -1.913561, 0.9607843, 1, 0, 1,
-0.9592738, -2.329827, -3.027402, 0.9568627, 1, 0, 1,
-0.9530669, -0.3208709, -2.239582, 0.9490196, 1, 0, 1,
-0.9464793, -0.2342742, -1.927816, 0.945098, 1, 0, 1,
-0.9458775, -0.912142, -4.157743, 0.9372549, 1, 0, 1,
-0.9440395, 0.4138924, -0.8016726, 0.9333333, 1, 0, 1,
-0.9408948, -0.3050416, -1.941817, 0.9254902, 1, 0, 1,
-0.9378808, 0.9960405, 0.1216303, 0.9215686, 1, 0, 1,
-0.9374256, 0.5392118, -1.815076, 0.9137255, 1, 0, 1,
-0.9335099, 1.131778, -0.1738649, 0.9098039, 1, 0, 1,
-0.9283493, 0.7424726, -0.3484355, 0.9019608, 1, 0, 1,
-0.9202272, 0.4767519, -2.862563, 0.8941177, 1, 0, 1,
-0.9199765, -1.646871, -2.493634, 0.8901961, 1, 0, 1,
-0.9163292, -0.88865, -4.547394, 0.8823529, 1, 0, 1,
-0.9115591, -1.661265, -0.4245882, 0.8784314, 1, 0, 1,
-0.9062851, -1.215922, -2.421116, 0.8705882, 1, 0, 1,
-0.9019976, -2.068204, -1.828256, 0.8666667, 1, 0, 1,
-0.8894159, -1.112504, -2.003045, 0.8588235, 1, 0, 1,
-0.8889447, 1.950621, -0.4541361, 0.854902, 1, 0, 1,
-0.8766534, 0.376962, -1.300722, 0.8470588, 1, 0, 1,
-0.8738925, 0.9057042, 0.5790943, 0.8431373, 1, 0, 1,
-0.8737023, 0.7299777, -1.655522, 0.8352941, 1, 0, 1,
-0.8733196, 0.1479469, -1.191457, 0.8313726, 1, 0, 1,
-0.870242, -0.2911664, -2.22728, 0.8235294, 1, 0, 1,
-0.8682664, -2.211582, -2.492505, 0.8196079, 1, 0, 1,
-0.8670592, 0.7293323, 0.7471182, 0.8117647, 1, 0, 1,
-0.8541235, -0.6386334, -2.989057, 0.8078431, 1, 0, 1,
-0.8538611, 1.050874, 0.1855296, 0.8, 1, 0, 1,
-0.8465683, 1.167251, -2.875382, 0.7921569, 1, 0, 1,
-0.8394511, 0.6215179, 2.536055, 0.7882353, 1, 0, 1,
-0.8393688, -0.0006458383, -0.7904704, 0.7803922, 1, 0, 1,
-0.8351886, 1.467556, -0.8124722, 0.7764706, 1, 0, 1,
-0.8347113, -0.08529287, -2.223276, 0.7686275, 1, 0, 1,
-0.8262745, -1.077343, -2.012424, 0.7647059, 1, 0, 1,
-0.8162183, 0.4519837, -0.6447671, 0.7568628, 1, 0, 1,
-0.812202, -1.146053, -3.086364, 0.7529412, 1, 0, 1,
-0.8059865, 1.10908, 1.960802, 0.7450981, 1, 0, 1,
-0.8052282, 1.170311, -1.179659, 0.7411765, 1, 0, 1,
-0.8033403, 0.5304929, -0.3360628, 0.7333333, 1, 0, 1,
-0.7978013, 1.308498, -1.143071, 0.7294118, 1, 0, 1,
-0.7907671, 2.111875, 0.4839677, 0.7215686, 1, 0, 1,
-0.790646, 0.4373298, -0.9750592, 0.7176471, 1, 0, 1,
-0.7830349, -0.6030737, -2.198004, 0.7098039, 1, 0, 1,
-0.7819698, 0.3973275, -2.491177, 0.7058824, 1, 0, 1,
-0.7812285, -0.9643246, -1.824977, 0.6980392, 1, 0, 1,
-0.7759914, -0.7830075, -2.021531, 0.6901961, 1, 0, 1,
-0.7756463, -0.1407574, -2.222375, 0.6862745, 1, 0, 1,
-0.7741632, -0.9403446, -2.462102, 0.6784314, 1, 0, 1,
-0.7719611, -1.699516, -4.59799, 0.6745098, 1, 0, 1,
-0.7646298, 0.4630668, -2.768967, 0.6666667, 1, 0, 1,
-0.7633221, -0.157369, -0.7709004, 0.6627451, 1, 0, 1,
-0.7564878, -0.7699614, -3.146814, 0.654902, 1, 0, 1,
-0.7547072, 0.08882603, -1.256408, 0.6509804, 1, 0, 1,
-0.7545571, -0.07106792, -3.426242, 0.6431373, 1, 0, 1,
-0.7525367, -0.7401223, -2.01674, 0.6392157, 1, 0, 1,
-0.7500333, 1.363111, 2.152618, 0.6313726, 1, 0, 1,
-0.7421757, -0.174133, -2.91227, 0.627451, 1, 0, 1,
-0.7410479, 0.4247246, -0.7982067, 0.6196079, 1, 0, 1,
-0.7402875, -0.9832082, -1.21345, 0.6156863, 1, 0, 1,
-0.7362019, 0.9903736, -1.701436, 0.6078432, 1, 0, 1,
-0.7357759, 0.08640298, -2.068461, 0.6039216, 1, 0, 1,
-0.7325594, 0.5376397, -3.29554, 0.5960785, 1, 0, 1,
-0.7317711, 0.7137235, -1.13924, 0.5882353, 1, 0, 1,
-0.7317531, -0.8759859, -2.636585, 0.5843138, 1, 0, 1,
-0.7270407, 1.975214, 0.1814343, 0.5764706, 1, 0, 1,
-0.7245322, 1.053022, -1.63463, 0.572549, 1, 0, 1,
-0.7169241, -0.199819, -1.906088, 0.5647059, 1, 0, 1,
-0.7123829, 0.3187052, -0.4200793, 0.5607843, 1, 0, 1,
-0.7115033, -1.643154, -3.130258, 0.5529412, 1, 0, 1,
-0.7105507, -2.183832, -2.118121, 0.5490196, 1, 0, 1,
-0.705751, 0.5644907, -0.972088, 0.5411765, 1, 0, 1,
-0.702592, -1.117016, -3.46147, 0.5372549, 1, 0, 1,
-0.7008675, 0.9649805, -0.4159752, 0.5294118, 1, 0, 1,
-0.6881138, 0.4241066, -0.8949311, 0.5254902, 1, 0, 1,
-0.6769293, 0.1939871, -0.09353841, 0.5176471, 1, 0, 1,
-0.6745768, 1.157374, 1.292161, 0.5137255, 1, 0, 1,
-0.672471, -0.346894, -2.391645, 0.5058824, 1, 0, 1,
-0.6644387, 0.2439548, -1.726154, 0.5019608, 1, 0, 1,
-0.6622637, -1.729688, -2.277197, 0.4941176, 1, 0, 1,
-0.6606557, 0.0935583, -1.775818, 0.4862745, 1, 0, 1,
-0.6606278, -1.753021, -3.932089, 0.4823529, 1, 0, 1,
-0.6600835, -0.8490312, -3.482661, 0.4745098, 1, 0, 1,
-0.656011, -0.8901742, -1.755406, 0.4705882, 1, 0, 1,
-0.6490943, 1.164417, -0.2290646, 0.4627451, 1, 0, 1,
-0.6480743, -1.215365, -1.347357, 0.4588235, 1, 0, 1,
-0.6477793, 0.6056756, -1.218737, 0.4509804, 1, 0, 1,
-0.6431433, 0.05498454, 0.3881667, 0.4470588, 1, 0, 1,
-0.643084, 0.3853734, -1.34445, 0.4392157, 1, 0, 1,
-0.6420285, 1.988731, 0.592945, 0.4352941, 1, 0, 1,
-0.6417674, -1.126337, -2.827149, 0.427451, 1, 0, 1,
-0.6407396, -0.9459811, -2.148595, 0.4235294, 1, 0, 1,
-0.6382548, -0.5484639, -4.832566, 0.4156863, 1, 0, 1,
-0.6304903, 1.0892, -1.23771, 0.4117647, 1, 0, 1,
-0.6246141, -1.880499, -3.293884, 0.4039216, 1, 0, 1,
-0.6215282, -1.485744, -1.488136, 0.3960784, 1, 0, 1,
-0.6194858, 1.700191, 0.1720827, 0.3921569, 1, 0, 1,
-0.6193804, 0.7003238, -1.691616, 0.3843137, 1, 0, 1,
-0.6061476, 0.3934768, -0.8362527, 0.3803922, 1, 0, 1,
-0.5955009, -0.4454671, -2.021246, 0.372549, 1, 0, 1,
-0.5913423, 0.619056, -1.982982, 0.3686275, 1, 0, 1,
-0.5859578, -1.795258, -2.161164, 0.3607843, 1, 0, 1,
-0.5854849, -0.0987498, -1.582841, 0.3568628, 1, 0, 1,
-0.5852727, -0.1320294, -3.326023, 0.3490196, 1, 0, 1,
-0.5829816, 0.8638972, 0.4974214, 0.345098, 1, 0, 1,
-0.5742099, -1.22562, -2.036361, 0.3372549, 1, 0, 1,
-0.574135, -0.1649464, -0.9441789, 0.3333333, 1, 0, 1,
-0.5732567, -0.9974067, -1.670726, 0.3254902, 1, 0, 1,
-0.5728308, -0.7146883, -2.406401, 0.3215686, 1, 0, 1,
-0.5714039, 1.714884, 0.4206017, 0.3137255, 1, 0, 1,
-0.5653845, 0.2780147, -0.9481846, 0.3098039, 1, 0, 1,
-0.5641683, -0.26776, -0.3779441, 0.3019608, 1, 0, 1,
-0.5618429, -1.830905, -1.534032, 0.2941177, 1, 0, 1,
-0.5540193, 0.06525224, -0.6815352, 0.2901961, 1, 0, 1,
-0.5540079, -1.129764, -2.390671, 0.282353, 1, 0, 1,
-0.5521566, 1.687265, -1.023603, 0.2784314, 1, 0, 1,
-0.5471089, 1.504564, -1.467316, 0.2705882, 1, 0, 1,
-0.5436379, -0.6670598, -2.924126, 0.2666667, 1, 0, 1,
-0.5407686, -1.422887, -2.299583, 0.2588235, 1, 0, 1,
-0.5308148, 0.1389057, -1.761145, 0.254902, 1, 0, 1,
-0.5283881, 0.3547312, -1.521209, 0.2470588, 1, 0, 1,
-0.5255969, -0.8013997, -2.757186, 0.2431373, 1, 0, 1,
-0.52421, 1.061593, 0.557066, 0.2352941, 1, 0, 1,
-0.5238667, 1.064906, 1.921097, 0.2313726, 1, 0, 1,
-0.5227078, 0.4497757, -0.02341473, 0.2235294, 1, 0, 1,
-0.520474, 0.2745233, -0.3193234, 0.2196078, 1, 0, 1,
-0.5189736, -0.03968219, -2.445944, 0.2117647, 1, 0, 1,
-0.5186579, -0.2170619, -2.621311, 0.2078431, 1, 0, 1,
-0.5184505, -1.231715, -2.395143, 0.2, 1, 0, 1,
-0.5180957, -2.396496, -2.242885, 0.1921569, 1, 0, 1,
-0.5173272, -0.7487612, -3.140519, 0.1882353, 1, 0, 1,
-0.5166855, 0.2507112, -2.212536, 0.1803922, 1, 0, 1,
-0.5164881, 0.6767501, -1.507106, 0.1764706, 1, 0, 1,
-0.5124794, -0.8717622, -2.855511, 0.1686275, 1, 0, 1,
-0.5112926, -0.3041265, -2.596713, 0.1647059, 1, 0, 1,
-0.5101819, 0.2823956, -2.669143, 0.1568628, 1, 0, 1,
-0.5049291, -1.746393, -2.915653, 0.1529412, 1, 0, 1,
-0.5031634, -0.3791662, -0.8417516, 0.145098, 1, 0, 1,
-0.502137, 0.9837098, 0.8304779, 0.1411765, 1, 0, 1,
-0.5015845, -1.055987, -2.236903, 0.1333333, 1, 0, 1,
-0.5004746, 0.7973476, 0.9007578, 0.1294118, 1, 0, 1,
-0.4935039, 1.409779, -3.637044, 0.1215686, 1, 0, 1,
-0.4932545, -2.489813, -2.701921, 0.1176471, 1, 0, 1,
-0.4905966, -0.09884613, -1.21835, 0.1098039, 1, 0, 1,
-0.4894288, -0.05322297, -1.609759, 0.1058824, 1, 0, 1,
-0.4887277, -0.08628201, -1.845721, 0.09803922, 1, 0, 1,
-0.4881288, 0.1280334, 1.088357, 0.09019608, 1, 0, 1,
-0.4879241, 0.03999549, -0.8423541, 0.08627451, 1, 0, 1,
-0.4859627, -0.8785941, -1.921052, 0.07843138, 1, 0, 1,
-0.4848525, -1.60598, -2.050213, 0.07450981, 1, 0, 1,
-0.4831281, 0.831818, 2.257927, 0.06666667, 1, 0, 1,
-0.4817213, -1.686411, -3.864367, 0.0627451, 1, 0, 1,
-0.4806567, -0.4322751, -2.089083, 0.05490196, 1, 0, 1,
-0.480264, -1.652541, -1.707642, 0.05098039, 1, 0, 1,
-0.4800942, 0.5475674, -1.46552, 0.04313726, 1, 0, 1,
-0.4775179, -0.8930215, -1.799776, 0.03921569, 1, 0, 1,
-0.4758649, 1.186663, -0.5777802, 0.03137255, 1, 0, 1,
-0.4749638, 0.3877485, -1.104172, 0.02745098, 1, 0, 1,
-0.4670798, -2.109458, -3.38962, 0.01960784, 1, 0, 1,
-0.4666959, -0.5782076, -2.338458, 0.01568628, 1, 0, 1,
-0.4629643, 1.065854, 0.2592705, 0.007843138, 1, 0, 1,
-0.4530608, 0.07109936, 0.1650516, 0.003921569, 1, 0, 1,
-0.4467161, -1.115488, -2.534443, 0, 1, 0.003921569, 1,
-0.4453284, -1.040046, -2.61739, 0, 1, 0.01176471, 1,
-0.4383988, 1.09152, -1.450569, 0, 1, 0.01568628, 1,
-0.4381849, 0.5176742, -1.588609, 0, 1, 0.02352941, 1,
-0.4371126, -0.7805525, -2.411654, 0, 1, 0.02745098, 1,
-0.4363118, 0.1528869, 0.6330391, 0, 1, 0.03529412, 1,
-0.4359679, -0.2528096, -1.582759, 0, 1, 0.03921569, 1,
-0.4342001, 0.46152, -1.878676, 0, 1, 0.04705882, 1,
-0.4341688, -0.6900905, -3.761322, 0, 1, 0.05098039, 1,
-0.432894, 0.4860186, -2.261021, 0, 1, 0.05882353, 1,
-0.432546, -1.485774, -2.108342, 0, 1, 0.0627451, 1,
-0.4321713, -0.09820547, -0.8065168, 0, 1, 0.07058824, 1,
-0.4297613, 0.2441655, -1.6059, 0, 1, 0.07450981, 1,
-0.4295648, -2.023426, -2.494347, 0, 1, 0.08235294, 1,
-0.4273526, 0.9584055, -0.2217583, 0, 1, 0.08627451, 1,
-0.4247099, -0.3285383, -4.302305, 0, 1, 0.09411765, 1,
-0.4169053, -0.8522516, -4.083156, 0, 1, 0.1019608, 1,
-0.4104424, -0.3859747, -2.05354, 0, 1, 0.1058824, 1,
-0.4096529, 0.5752183, 0.9730245, 0, 1, 0.1137255, 1,
-0.4092863, -0.3972595, -1.677198, 0, 1, 0.1176471, 1,
-0.4050482, 0.2335972, -0.520876, 0, 1, 0.1254902, 1,
-0.4014541, 0.461864, -1.35209, 0, 1, 0.1294118, 1,
-0.3996746, -2.142696, -1.627093, 0, 1, 0.1372549, 1,
-0.3955236, 0.02598897, -1.728311, 0, 1, 0.1411765, 1,
-0.391834, -1.225866, -3.204762, 0, 1, 0.1490196, 1,
-0.3846094, -0.3240847, -3.281594, 0, 1, 0.1529412, 1,
-0.3835679, 0.9674386, -0.3327952, 0, 1, 0.1607843, 1,
-0.3815875, 0.06413828, -1.78418, 0, 1, 0.1647059, 1,
-0.3802407, -1.431175, -4.407488, 0, 1, 0.172549, 1,
-0.3670723, 1.859868, 0.08479104, 0, 1, 0.1764706, 1,
-0.3636046, -0.8112259, -4.353259, 0, 1, 0.1843137, 1,
-0.3614636, -0.03305571, -2.109947, 0, 1, 0.1882353, 1,
-0.3611373, -0.06981528, -3.512181, 0, 1, 0.1960784, 1,
-0.3608341, 0.4533769, -0.8340779, 0, 1, 0.2039216, 1,
-0.3495144, -0.09475209, -1.715177, 0, 1, 0.2078431, 1,
-0.3480231, -0.2167148, -0.9926182, 0, 1, 0.2156863, 1,
-0.3477063, 1.020243, -0.3968252, 0, 1, 0.2196078, 1,
-0.3467896, 1.185654, -0.2195014, 0, 1, 0.227451, 1,
-0.3448104, -0.06574233, -1.40872, 0, 1, 0.2313726, 1,
-0.3400685, -1.114957, -3.91149, 0, 1, 0.2392157, 1,
-0.3392095, 0.4110833, -2.040009, 0, 1, 0.2431373, 1,
-0.3354762, 0.285232, -1.728237, 0, 1, 0.2509804, 1,
-0.3347553, -0.9871261, -2.387606, 0, 1, 0.254902, 1,
-0.331767, -1.153922, -4.446292, 0, 1, 0.2627451, 1,
-0.330035, -1.484625, -3.481695, 0, 1, 0.2666667, 1,
-0.3259864, 1.347238, -1.34764, 0, 1, 0.2745098, 1,
-0.3247384, 0.03097844, -2.474985, 0, 1, 0.2784314, 1,
-0.3197904, -0.7349523, -2.688966, 0, 1, 0.2862745, 1,
-0.3192345, -0.7597442, -2.693877, 0, 1, 0.2901961, 1,
-0.3186439, -0.5242285, -1.636215, 0, 1, 0.2980392, 1,
-0.3178095, -0.7913857, -2.432359, 0, 1, 0.3058824, 1,
-0.3169196, -1.171594, -2.693707, 0, 1, 0.3098039, 1,
-0.3094351, 0.02647284, -2.338875, 0, 1, 0.3176471, 1,
-0.3052154, 0.4096203, -1.920834, 0, 1, 0.3215686, 1,
-0.3024622, 1.448971, -0.457112, 0, 1, 0.3294118, 1,
-0.2991776, 0.4473504, 0.5340489, 0, 1, 0.3333333, 1,
-0.2986444, -0.2446005, -2.919995, 0, 1, 0.3411765, 1,
-0.2941075, 2.344786, -0.619384, 0, 1, 0.345098, 1,
-0.2891106, -1.740427, -3.861421, 0, 1, 0.3529412, 1,
-0.2799645, 0.2002349, -1.714541, 0, 1, 0.3568628, 1,
-0.2786988, -0.1729931, -1.448332, 0, 1, 0.3647059, 1,
-0.2775841, 1.042657, -0.05437525, 0, 1, 0.3686275, 1,
-0.2774603, -0.6523874, -0.9631119, 0, 1, 0.3764706, 1,
-0.2700114, 0.2205113, -2.423843, 0, 1, 0.3803922, 1,
-0.2663487, -0.2539229, -2.781185, 0, 1, 0.3882353, 1,
-0.2635495, -0.2945437, -3.868071, 0, 1, 0.3921569, 1,
-0.2586482, -0.6638339, -4.393312, 0, 1, 0.4, 1,
-0.2570588, -1.439376, -2.91161, 0, 1, 0.4078431, 1,
-0.2525376, -1.09598, -1.943247, 0, 1, 0.4117647, 1,
-0.2509119, -1.141599, -2.242674, 0, 1, 0.4196078, 1,
-0.2499658, 1.08685, 0.2561557, 0, 1, 0.4235294, 1,
-0.2474275, -1.224605, -2.348991, 0, 1, 0.4313726, 1,
-0.247329, -0.6010208, -3.314049, 0, 1, 0.4352941, 1,
-0.2460931, -0.5549545, -0.9503192, 0, 1, 0.4431373, 1,
-0.2428124, 0.9217345, -0.2254385, 0, 1, 0.4470588, 1,
-0.236547, -0.3699984, -2.643841, 0, 1, 0.454902, 1,
-0.2308826, -1.670225, -1.206499, 0, 1, 0.4588235, 1,
-0.2275516, 1.581084, 0.90133, 0, 1, 0.4666667, 1,
-0.2274628, 0.420508, 1.221294, 0, 1, 0.4705882, 1,
-0.2268235, -0.8104953, -1.980547, 0, 1, 0.4784314, 1,
-0.2259712, -0.4144118, -3.993571, 0, 1, 0.4823529, 1,
-0.2219574, 1.384382, 0.5890636, 0, 1, 0.4901961, 1,
-0.2199849, 1.362251, -0.6512129, 0, 1, 0.4941176, 1,
-0.2136663, 0.5681708, -0.4272309, 0, 1, 0.5019608, 1,
-0.2132742, 1.496242, -1.297246, 0, 1, 0.509804, 1,
-0.2103625, -1.18622, -3.138381, 0, 1, 0.5137255, 1,
-0.2050107, -0.9025334, -1.385656, 0, 1, 0.5215687, 1,
-0.2032232, 1.837661, 0.1282077, 0, 1, 0.5254902, 1,
-0.2019499, 1.549677, -0.920474, 0, 1, 0.5333334, 1,
-0.1997681, -1.428901, -1.917618, 0, 1, 0.5372549, 1,
-0.1979375, 0.8018627, 0.5551102, 0, 1, 0.5450981, 1,
-0.1934663, 0.13044, -0.7454604, 0, 1, 0.5490196, 1,
-0.187808, 1.969489, -0.6797928, 0, 1, 0.5568628, 1,
-0.1835614, 1.247785, 0.5662182, 0, 1, 0.5607843, 1,
-0.1834107, 0.9167995, 0.9478619, 0, 1, 0.5686275, 1,
-0.1831104, 0.7504424, -0.6187984, 0, 1, 0.572549, 1,
-0.1813991, 3.272741, 0.6532148, 0, 1, 0.5803922, 1,
-0.1801082, 0.4175457, 0.4819952, 0, 1, 0.5843138, 1,
-0.1747333, 0.06720319, -1.365909, 0, 1, 0.5921569, 1,
-0.1734014, 0.1922415, -1.591681, 0, 1, 0.5960785, 1,
-0.1705973, -0.9536719, -3.490533, 0, 1, 0.6039216, 1,
-0.1618359, 0.8378805, -0.4151827, 0, 1, 0.6117647, 1,
-0.1576127, 0.5791239, -0.1459699, 0, 1, 0.6156863, 1,
-0.1554496, -1.064829, -3.767803, 0, 1, 0.6235294, 1,
-0.1552137, -0.818969, -1.539984, 0, 1, 0.627451, 1,
-0.1537232, 0.44366, -0.7448623, 0, 1, 0.6352941, 1,
-0.1489612, -2.046639, -4.046449, 0, 1, 0.6392157, 1,
-0.1457359, 1.062777, -0.7767923, 0, 1, 0.6470588, 1,
-0.14517, -0.007354907, -0.6834994, 0, 1, 0.6509804, 1,
-0.1416063, 0.3497082, -0.8746628, 0, 1, 0.6588235, 1,
-0.1391825, 0.9532412, 0.912581, 0, 1, 0.6627451, 1,
-0.1364098, -0.122467, -1.288089, 0, 1, 0.6705883, 1,
-0.133611, -0.7862485, -2.041996, 0, 1, 0.6745098, 1,
-0.1329771, -0.08289599, -0.863992, 0, 1, 0.682353, 1,
-0.1318262, -0.1663104, -1.828042, 0, 1, 0.6862745, 1,
-0.1270668, 1.145578, 1.418997, 0, 1, 0.6941177, 1,
-0.1270416, -0.6108094, -3.634237, 0, 1, 0.7019608, 1,
-0.1244004, -0.9382125, -3.00688, 0, 1, 0.7058824, 1,
-0.12132, 0.1136164, -0.7224401, 0, 1, 0.7137255, 1,
-0.1210409, -0.06601132, -0.9658909, 0, 1, 0.7176471, 1,
-0.120468, 1.133006, -0.7515703, 0, 1, 0.7254902, 1,
-0.1204517, 0.6151827, -1.187047, 0, 1, 0.7294118, 1,
-0.117932, 0.9138466, 1.293122, 0, 1, 0.7372549, 1,
-0.1149752, -0.02197362, -1.819253, 0, 1, 0.7411765, 1,
-0.1119112, 1.645837, -1.14819, 0, 1, 0.7490196, 1,
-0.1010551, 1.170656, 0.8411049, 0, 1, 0.7529412, 1,
-0.1001792, 0.7476859, -1.546285, 0, 1, 0.7607843, 1,
-0.09978706, -3.365298, -2.393111, 0, 1, 0.7647059, 1,
-0.09443339, 3.138616, -0.645542, 0, 1, 0.772549, 1,
-0.09011455, 0.9907538, -1.325282, 0, 1, 0.7764706, 1,
-0.08584392, 0.7431405, 0.3927879, 0, 1, 0.7843137, 1,
-0.08520656, -0.7634563, -4.53622, 0, 1, 0.7882353, 1,
-0.08388442, 1.121331, -1.799735, 0, 1, 0.7960784, 1,
-0.08378632, 1.4399, 0.4195877, 0, 1, 0.8039216, 1,
-0.08034881, -0.01754055, -0.9557224, 0, 1, 0.8078431, 1,
-0.07872201, -0.8857908, -3.14619, 0, 1, 0.8156863, 1,
-0.06928042, 0.7350179, -0.6033622, 0, 1, 0.8196079, 1,
-0.06843814, -0.008363283, -2.024491, 0, 1, 0.827451, 1,
-0.06745043, 0.7524666, -1.377791, 0, 1, 0.8313726, 1,
-0.06218909, 0.03173805, -2.937831, 0, 1, 0.8392157, 1,
-0.06207768, 1.305024, -0.721671, 0, 1, 0.8431373, 1,
-0.05707404, -0.4860099, -2.821704, 0, 1, 0.8509804, 1,
-0.05634582, 0.5127128, 1.100698, 0, 1, 0.854902, 1,
-0.05521737, -0.2258113, -2.216905, 0, 1, 0.8627451, 1,
-0.05079187, 0.3329217, 0.3512031, 0, 1, 0.8666667, 1,
-0.05059106, 1.386564, 0.3393219, 0, 1, 0.8745098, 1,
-0.05046166, 1.386069, 1.183756, 0, 1, 0.8784314, 1,
-0.04875145, -1.778824, -4.364399, 0, 1, 0.8862745, 1,
-0.04597162, -0.01270608, -3.363842, 0, 1, 0.8901961, 1,
-0.04560595, -0.2552647, -1.058796, 0, 1, 0.8980392, 1,
-0.04322749, -0.7485262, -1.905391, 0, 1, 0.9058824, 1,
-0.03997144, -1.471595, -4.004704, 0, 1, 0.9098039, 1,
-0.03923817, -1.416588, -3.939449, 0, 1, 0.9176471, 1,
-0.03788981, 0.009023243, -1.543411, 0, 1, 0.9215686, 1,
-0.03730139, -1.035761, -3.313014, 0, 1, 0.9294118, 1,
-0.037058, -0.03714388, -4.105786, 0, 1, 0.9333333, 1,
-0.03503604, 0.213112, 0.2760431, 0, 1, 0.9411765, 1,
-0.02713554, -0.281164, -1.376523, 0, 1, 0.945098, 1,
-0.0251721, -0.05186516, -1.729287, 0, 1, 0.9529412, 1,
-0.02193618, -0.1556117, -2.089665, 0, 1, 0.9568627, 1,
-0.02151402, 0.3516322, -0.9908762, 0, 1, 0.9647059, 1,
-0.01772554, 0.2442964, -0.5811255, 0, 1, 0.9686275, 1,
-0.01665685, 0.1201635, -0.360438, 0, 1, 0.9764706, 1,
-0.01606204, 0.3907865, -1.101655, 0, 1, 0.9803922, 1,
-0.01570226, 1.919244, 0.2640234, 0, 1, 0.9882353, 1,
-0.004242387, 0.4370261, 2.763794, 0, 1, 0.9921569, 1,
-0.003774721, -0.06448616, -4.302767, 0, 1, 1, 1,
0.000487958, 0.6300734, -1.514301, 0, 0.9921569, 1, 1,
0.006427577, -0.5033561, 2.249539, 0, 0.9882353, 1, 1,
0.006483716, -0.3830152, 3.446413, 0, 0.9803922, 1, 1,
0.007908543, -0.2193987, 2.971126, 0, 0.9764706, 1, 1,
0.008176214, -1.182482, 2.549909, 0, 0.9686275, 1, 1,
0.009492032, -0.8843106, 3.052241, 0, 0.9647059, 1, 1,
0.01166012, -0.6533714, 3.549691, 0, 0.9568627, 1, 1,
0.01500618, 0.2607676, 1.685409, 0, 0.9529412, 1, 1,
0.01509862, 0.9145539, 1.042214, 0, 0.945098, 1, 1,
0.01678346, -0.06061983, 2.02755, 0, 0.9411765, 1, 1,
0.01841392, -0.2835124, 2.449866, 0, 0.9333333, 1, 1,
0.02439619, 0.03926244, 1.026487, 0, 0.9294118, 1, 1,
0.02913222, 0.3912678, -0.4377023, 0, 0.9215686, 1, 1,
0.03186825, 0.5293469, 0.8116013, 0, 0.9176471, 1, 1,
0.03469412, -0.8676819, 2.565419, 0, 0.9098039, 1, 1,
0.03500006, 0.1995353, -0.06195438, 0, 0.9058824, 1, 1,
0.04030678, 0.7852772, 0.02782806, 0, 0.8980392, 1, 1,
0.04220515, 1.915786, 1.339824, 0, 0.8901961, 1, 1,
0.04333656, -0.08718928, 3.592263, 0, 0.8862745, 1, 1,
0.0456287, 0.01022842, 1.389316, 0, 0.8784314, 1, 1,
0.04655047, -0.1264085, 2.527467, 0, 0.8745098, 1, 1,
0.04763456, 1.465335, -0.06972962, 0, 0.8666667, 1, 1,
0.0520798, -0.8048632, 4.037772, 0, 0.8627451, 1, 1,
0.05259914, 0.7249781, -0.2232119, 0, 0.854902, 1, 1,
0.06452478, -0.8872374, 2.259459, 0, 0.8509804, 1, 1,
0.06623798, 0.1671147, 0.1373458, 0, 0.8431373, 1, 1,
0.06739543, 0.1277542, 1.714008, 0, 0.8392157, 1, 1,
0.06857618, 0.982156, 0.6112837, 0, 0.8313726, 1, 1,
0.07005668, -0.5253541, 4.208092, 0, 0.827451, 1, 1,
0.07347304, -1.708364, 2.820668, 0, 0.8196079, 1, 1,
0.07388753, 1.879992, -0.04006613, 0, 0.8156863, 1, 1,
0.07597809, -0.2331709, 3.548944, 0, 0.8078431, 1, 1,
0.08275736, -0.07334331, 1.735651, 0, 0.8039216, 1, 1,
0.08325733, 0.8819493, -1.83771, 0, 0.7960784, 1, 1,
0.08335827, -1.46748, 4.582132, 0, 0.7882353, 1, 1,
0.08392388, 1.034714, 0.02460511, 0, 0.7843137, 1, 1,
0.08732533, -0.1374215, 4.970906, 0, 0.7764706, 1, 1,
0.08789733, -0.3873715, 2.029174, 0, 0.772549, 1, 1,
0.09074257, -1.936616, 3.634115, 0, 0.7647059, 1, 1,
0.09308117, 1.606904, 1.447067, 0, 0.7607843, 1, 1,
0.09368555, -0.002056678, 1.28892, 0, 0.7529412, 1, 1,
0.09453868, 2.082963, -0.5388103, 0, 0.7490196, 1, 1,
0.09477733, 0.6679709, 0.9899266, 0, 0.7411765, 1, 1,
0.09622946, 1.124223, -1.381613, 0, 0.7372549, 1, 1,
0.0979679, 0.5996149, 1.04513, 0, 0.7294118, 1, 1,
0.1055589, -0.7397448, 4.396394, 0, 0.7254902, 1, 1,
0.1081545, 0.9892778, -0.6742482, 0, 0.7176471, 1, 1,
0.1087295, 0.5370715, 0.5668902, 0, 0.7137255, 1, 1,
0.1108081, 2.019696, 0.3478204, 0, 0.7058824, 1, 1,
0.1125382, -1.571607, 3.374529, 0, 0.6980392, 1, 1,
0.1161351, -0.7162538, 3.037369, 0, 0.6941177, 1, 1,
0.1179541, -1.10912, 2.972876, 0, 0.6862745, 1, 1,
0.1199489, -1.765625, 4.345984, 0, 0.682353, 1, 1,
0.1238444, -1.702803, 2.541927, 0, 0.6745098, 1, 1,
0.1243469, 0.7171277, 0.7212955, 0, 0.6705883, 1, 1,
0.1282505, 1.522422, 0.9737161, 0, 0.6627451, 1, 1,
0.1301885, 2.300321, 0.276975, 0, 0.6588235, 1, 1,
0.138643, -0.08112647, 1.365627, 0, 0.6509804, 1, 1,
0.1400541, 1.737801, 0.3454135, 0, 0.6470588, 1, 1,
0.1424147, 0.6636505, 0.04924414, 0, 0.6392157, 1, 1,
0.1456358, 1.136621, -1.754606, 0, 0.6352941, 1, 1,
0.1480209, -0.8502125, 3.451323, 0, 0.627451, 1, 1,
0.1490659, 0.9047104, 1.729303, 0, 0.6235294, 1, 1,
0.1541626, 0.8218238, 0.1143254, 0, 0.6156863, 1, 1,
0.1583469, 1.683803, 0.4568467, 0, 0.6117647, 1, 1,
0.1601975, -1.187044, 1.792587, 0, 0.6039216, 1, 1,
0.1644569, -1.421939, 4.938781, 0, 0.5960785, 1, 1,
0.1661548, 0.871932, 0.2973516, 0, 0.5921569, 1, 1,
0.1661808, 0.9936458, 0.9671645, 0, 0.5843138, 1, 1,
0.1664139, 0.9137397, -0.6667765, 0, 0.5803922, 1, 1,
0.1665241, -1.539065, 2.822463, 0, 0.572549, 1, 1,
0.1667687, -1.963148, 2.585026, 0, 0.5686275, 1, 1,
0.1671703, -0.1847845, 3.103976, 0, 0.5607843, 1, 1,
0.1672926, -0.07235919, 3.198884, 0, 0.5568628, 1, 1,
0.1684072, 0.1718372, 1.74266, 0, 0.5490196, 1, 1,
0.1689954, -1.360791, 4.35014, 0, 0.5450981, 1, 1,
0.1693824, -0.3433765, 3.015876, 0, 0.5372549, 1, 1,
0.1696413, -1.086795, 3.813938, 0, 0.5333334, 1, 1,
0.1702642, 0.580741, 1.9544, 0, 0.5254902, 1, 1,
0.1716449, 1.490975, 0.1973269, 0, 0.5215687, 1, 1,
0.1749884, -1.117275, 2.890976, 0, 0.5137255, 1, 1,
0.1787455, 0.008856279, 1.999449, 0, 0.509804, 1, 1,
0.1794863, -0.03748589, 0.7158522, 0, 0.5019608, 1, 1,
0.1798813, 0.4386439, -1.530173, 0, 0.4941176, 1, 1,
0.1801583, 0.8935914, -0.5487003, 0, 0.4901961, 1, 1,
0.1810386, -0.1706801, 3.95823, 0, 0.4823529, 1, 1,
0.1820269, 0.4111835, -0.7637066, 0, 0.4784314, 1, 1,
0.1834289, 1.581173, 0.2697437, 0, 0.4705882, 1, 1,
0.1848879, -1.430128, 2.482696, 0, 0.4666667, 1, 1,
0.1871996, -0.6743376, 3.865188, 0, 0.4588235, 1, 1,
0.188124, 0.09914745, 2.338231, 0, 0.454902, 1, 1,
0.1894596, 0.6435093, -0.3671747, 0, 0.4470588, 1, 1,
0.1898822, -0.3291523, 5.021054, 0, 0.4431373, 1, 1,
0.1988219, 1.017273, 1.287876, 0, 0.4352941, 1, 1,
0.1994319, 0.9404253, 0.03317035, 0, 0.4313726, 1, 1,
0.2004116, -1.241261, 3.005666, 0, 0.4235294, 1, 1,
0.2009717, 0.9303078, 1.01429, 0, 0.4196078, 1, 1,
0.2009777, -0.3156353, 1.494143, 0, 0.4117647, 1, 1,
0.207384, 0.9948981, -0.9824125, 0, 0.4078431, 1, 1,
0.2078143, 0.05155202, 1.530916, 0, 0.4, 1, 1,
0.2084233, -0.1012995, 1.244124, 0, 0.3921569, 1, 1,
0.2089787, 0.7970158, 0.2077441, 0, 0.3882353, 1, 1,
0.20965, 0.2982425, 1.308335, 0, 0.3803922, 1, 1,
0.2105165, -0.2824932, 3.455199, 0, 0.3764706, 1, 1,
0.2119959, 0.3468595, -1.469559, 0, 0.3686275, 1, 1,
0.2157376, -0.3021009, 0.982816, 0, 0.3647059, 1, 1,
0.2158087, -1.805941, 5.18202, 0, 0.3568628, 1, 1,
0.2163927, -1.624065, 4.058352, 0, 0.3529412, 1, 1,
0.2174464, 0.2526803, 2.385979, 0, 0.345098, 1, 1,
0.2181012, 1.454496, -0.9482449, 0, 0.3411765, 1, 1,
0.2195742, -0.606072, 2.002948, 0, 0.3333333, 1, 1,
0.2256771, -0.293583, 3.923311, 0, 0.3294118, 1, 1,
0.2266998, 0.8340843, -0.0238524, 0, 0.3215686, 1, 1,
0.2306836, 1.227386, 0.8847631, 0, 0.3176471, 1, 1,
0.231872, 0.380593, 1.246532, 0, 0.3098039, 1, 1,
0.2343898, -1.434788, 3.402325, 0, 0.3058824, 1, 1,
0.2388706, -0.9894614, 2.184471, 0, 0.2980392, 1, 1,
0.2390121, 2.275412, 1.578559, 0, 0.2901961, 1, 1,
0.2395921, 0.5691683, 0.8282052, 0, 0.2862745, 1, 1,
0.2416202, 0.289725, 0.8221119, 0, 0.2784314, 1, 1,
0.2418307, 1.250261, 1.352805, 0, 0.2745098, 1, 1,
0.2440284, -0.6534632, 2.201724, 0, 0.2666667, 1, 1,
0.2470343, 0.9713562, -0.3402583, 0, 0.2627451, 1, 1,
0.2490628, -0.865947, 1.58217, 0, 0.254902, 1, 1,
0.249546, -0.1792525, 2.052026, 0, 0.2509804, 1, 1,
0.2507041, 0.936601, -0.711504, 0, 0.2431373, 1, 1,
0.2510184, -0.7816412, 3.357687, 0, 0.2392157, 1, 1,
0.2556573, -0.482129, 4.272395, 0, 0.2313726, 1, 1,
0.2645178, -1.622796, 2.695678, 0, 0.227451, 1, 1,
0.2659575, 0.4955902, -0.4575245, 0, 0.2196078, 1, 1,
0.2661439, -1.136907, 2.433222, 0, 0.2156863, 1, 1,
0.266576, 0.8631395, 0.5772952, 0, 0.2078431, 1, 1,
0.2679976, -0.2683942, 2.456449, 0, 0.2039216, 1, 1,
0.2802475, -0.780166, 3.648079, 0, 0.1960784, 1, 1,
0.2863193, -0.7006862, 1.837219, 0, 0.1882353, 1, 1,
0.2875869, 1.587901, 0.1699022, 0, 0.1843137, 1, 1,
0.2892623, 0.8575175, 1.620648, 0, 0.1764706, 1, 1,
0.2927063, 1.574795, -0.8296041, 0, 0.172549, 1, 1,
0.2927986, 0.3192318, 0.04669524, 0, 0.1647059, 1, 1,
0.2977116, 1.235776, 0.81769, 0, 0.1607843, 1, 1,
0.3018322, -1.975983, 3.88944, 0, 0.1529412, 1, 1,
0.305289, 0.382608, 1.051929, 0, 0.1490196, 1, 1,
0.3258115, 0.7199296, -0.4678758, 0, 0.1411765, 1, 1,
0.329775, 2.089767, 0.4042632, 0, 0.1372549, 1, 1,
0.3300664, -0.01837998, 0.6418331, 0, 0.1294118, 1, 1,
0.3311035, -0.4475349, 2.121011, 0, 0.1254902, 1, 1,
0.332296, -0.0199001, 1.962543, 0, 0.1176471, 1, 1,
0.3341751, 0.0530305, 1.327799, 0, 0.1137255, 1, 1,
0.3358889, 0.366321, 0.1454579, 0, 0.1058824, 1, 1,
0.3408037, -0.7927105, 2.443537, 0, 0.09803922, 1, 1,
0.3434239, -1.053659, 1.606385, 0, 0.09411765, 1, 1,
0.343969, 0.08984821, 1.92984, 0, 0.08627451, 1, 1,
0.3466948, -0.9958739, 2.858433, 0, 0.08235294, 1, 1,
0.3490257, 0.06931782, 0.1589684, 0, 0.07450981, 1, 1,
0.3504977, 0.7558631, 1.291818, 0, 0.07058824, 1, 1,
0.3520406, 0.3813078, 0.1152361, 0, 0.0627451, 1, 1,
0.3542295, 0.9836371, -1.226618, 0, 0.05882353, 1, 1,
0.3549012, -0.4039697, 4.137175, 0, 0.05098039, 1, 1,
0.3582701, 0.7154859, 0.6120362, 0, 0.04705882, 1, 1,
0.358354, -1.125587, 2.595691, 0, 0.03921569, 1, 1,
0.3592355, -0.05832143, 2.781409, 0, 0.03529412, 1, 1,
0.3630694, -0.7874779, 2.574844, 0, 0.02745098, 1, 1,
0.3653847, -0.3938999, 2.299981, 0, 0.02352941, 1, 1,
0.3657859, 1.30625, 1.013815, 0, 0.01568628, 1, 1,
0.3676223, 0.5457752, -0.3302692, 0, 0.01176471, 1, 1,
0.3708635, 0.8425621, 0.7103845, 0, 0.003921569, 1, 1,
0.3727148, -1.704113, 3.223902, 0.003921569, 0, 1, 1,
0.3925635, 0.3712795, 0.9485714, 0.007843138, 0, 1, 1,
0.3983922, 1.655991, 1.161005, 0.01568628, 0, 1, 1,
0.4024956, -1.023155, 1.249705, 0.01960784, 0, 1, 1,
0.4044204, -0.4760995, 1.728276, 0.02745098, 0, 1, 1,
0.4045176, 0.5816143, 0.382038, 0.03137255, 0, 1, 1,
0.4097231, -0.2520182, 2.280115, 0.03921569, 0, 1, 1,
0.4119749, -0.3724015, 2.508925, 0.04313726, 0, 1, 1,
0.4133185, -1.017941, 2.008377, 0.05098039, 0, 1, 1,
0.4162516, -0.7194723, 3.712093, 0.05490196, 0, 1, 1,
0.4205198, 0.8675169, 1.121328, 0.0627451, 0, 1, 1,
0.4207323, 1.451122, -1.511452, 0.06666667, 0, 1, 1,
0.4208494, -0.2138227, 2.416198, 0.07450981, 0, 1, 1,
0.4251637, -0.6535952, 3.269742, 0.07843138, 0, 1, 1,
0.4268384, 2.233802, -0.6211854, 0.08627451, 0, 1, 1,
0.4322426, 0.6944878, -0.02200939, 0.09019608, 0, 1, 1,
0.4326728, -0.5878036, 2.173473, 0.09803922, 0, 1, 1,
0.4351607, -1.424085, 2.384977, 0.1058824, 0, 1, 1,
0.4392423, -0.08553003, 2.491535, 0.1098039, 0, 1, 1,
0.439357, 0.966207, -0.8434162, 0.1176471, 0, 1, 1,
0.4398372, -1.195402, 2.838074, 0.1215686, 0, 1, 1,
0.4430348, -0.4871429, 1.117847, 0.1294118, 0, 1, 1,
0.4443593, 0.2537883, 1.303744, 0.1333333, 0, 1, 1,
0.4498316, -2.306506, 3.873444, 0.1411765, 0, 1, 1,
0.4502677, 0.8520609, -0.4398052, 0.145098, 0, 1, 1,
0.4535231, -0.02935569, 1.800866, 0.1529412, 0, 1, 1,
0.4589127, -0.2682131, 0.02844766, 0.1568628, 0, 1, 1,
0.4634832, -0.7515948, 1.342977, 0.1647059, 0, 1, 1,
0.4652219, -0.8099571, 3.536174, 0.1686275, 0, 1, 1,
0.4706517, 0.03337821, 0.5863163, 0.1764706, 0, 1, 1,
0.4764573, -0.2469271, 4.024596, 0.1803922, 0, 1, 1,
0.47965, -0.05078287, 0.7632238, 0.1882353, 0, 1, 1,
0.4804022, 0.1795089, 2.287753, 0.1921569, 0, 1, 1,
0.4812196, -0.442101, 1.304008, 0.2, 0, 1, 1,
0.4837213, 0.2543396, 1.136217, 0.2078431, 0, 1, 1,
0.4891644, -0.5784766, 3.180933, 0.2117647, 0, 1, 1,
0.4917542, 0.3909437, 0.009776016, 0.2196078, 0, 1, 1,
0.4969836, -0.1099528, 0.1873992, 0.2235294, 0, 1, 1,
0.5009185, -0.2135642, 2.809099, 0.2313726, 0, 1, 1,
0.5043479, -0.405949, 0.6655101, 0.2352941, 0, 1, 1,
0.5050563, -1.125057, 0.2664556, 0.2431373, 0, 1, 1,
0.5093804, -0.4561206, 3.644921, 0.2470588, 0, 1, 1,
0.510119, 1.441892, 0.543748, 0.254902, 0, 1, 1,
0.5103208, 0.5274864, 0.5947624, 0.2588235, 0, 1, 1,
0.5139912, -1.146679, 2.347294, 0.2666667, 0, 1, 1,
0.5181114, -0.4984714, 3.581414, 0.2705882, 0, 1, 1,
0.5222222, 0.7812423, 0.8602116, 0.2784314, 0, 1, 1,
0.5266054, 0.1340175, 0.3106136, 0.282353, 0, 1, 1,
0.5448865, 0.1949045, 2.736198, 0.2901961, 0, 1, 1,
0.546214, -1.044931, 2.321726, 0.2941177, 0, 1, 1,
0.5497416, -0.5821854, 2.485301, 0.3019608, 0, 1, 1,
0.5515475, 0.1750065, 1.199906, 0.3098039, 0, 1, 1,
0.5553378, 0.5467818, 1.301458, 0.3137255, 0, 1, 1,
0.555635, -0.9175612, 4.252057, 0.3215686, 0, 1, 1,
0.5560815, 2.104244, -0.5494473, 0.3254902, 0, 1, 1,
0.5571126, 0.5708699, -0.5353302, 0.3333333, 0, 1, 1,
0.5601862, -1.5209, 4.276315, 0.3372549, 0, 1, 1,
0.5634609, -0.4654231, 1.913946, 0.345098, 0, 1, 1,
0.5658301, 0.1641685, 0.7432424, 0.3490196, 0, 1, 1,
0.5677131, -1.091849, 4.240505, 0.3568628, 0, 1, 1,
0.5689408, 0.05192673, -1.630098, 0.3607843, 0, 1, 1,
0.5691429, -0.4780219, 1.337565, 0.3686275, 0, 1, 1,
0.5821466, -1.345115, 2.756159, 0.372549, 0, 1, 1,
0.5907166, -0.6914281, 0.641039, 0.3803922, 0, 1, 1,
0.6000158, 0.4694505, 1.032967, 0.3843137, 0, 1, 1,
0.6013587, -0.2675182, 2.548136, 0.3921569, 0, 1, 1,
0.6035442, -0.9289679, 1.62183, 0.3960784, 0, 1, 1,
0.6050414, 1.72675, 1.161243, 0.4039216, 0, 1, 1,
0.6105427, -0.4310179, 0.9247971, 0.4117647, 0, 1, 1,
0.616836, -0.7509698, 3.641875, 0.4156863, 0, 1, 1,
0.6188104, -0.6423746, 2.871835, 0.4235294, 0, 1, 1,
0.6273299, 0.2152813, -0.3349887, 0.427451, 0, 1, 1,
0.6302695, -0.5192048, 1.514589, 0.4352941, 0, 1, 1,
0.6339071, -1.064259, 3.10214, 0.4392157, 0, 1, 1,
0.6375049, 0.02253996, -0.4155605, 0.4470588, 0, 1, 1,
0.6392666, 0.4354994, -0.6233091, 0.4509804, 0, 1, 1,
0.6432725, -1.72115, 3.005505, 0.4588235, 0, 1, 1,
0.6434996, 0.5384487, -0.3418356, 0.4627451, 0, 1, 1,
0.6484952, 1.34792, 0.3540438, 0.4705882, 0, 1, 1,
0.6575978, -1.367895, 2.689682, 0.4745098, 0, 1, 1,
0.6622982, -0.9562024, 0.7513009, 0.4823529, 0, 1, 1,
0.6655949, 0.2628157, 1.309846, 0.4862745, 0, 1, 1,
0.6660509, 0.6015467, 0.5271401, 0.4941176, 0, 1, 1,
0.6788124, -0.9069099, 1.809869, 0.5019608, 0, 1, 1,
0.6809244, -0.3861454, 1.502222, 0.5058824, 0, 1, 1,
0.6820551, -1.24475, 3.203901, 0.5137255, 0, 1, 1,
0.6899624, 1.010735, -0.5505254, 0.5176471, 0, 1, 1,
0.6989541, -0.5952157, 1.54155, 0.5254902, 0, 1, 1,
0.7047147, 0.6744751, 1.643264, 0.5294118, 0, 1, 1,
0.706232, 0.5462164, 1.639938, 0.5372549, 0, 1, 1,
0.7066414, -1.203585, 2.823578, 0.5411765, 0, 1, 1,
0.7102245, 1.210574, 1.909507, 0.5490196, 0, 1, 1,
0.7114026, 0.4106063, 0.2759929, 0.5529412, 0, 1, 1,
0.7128652, 2.198598, -0.3446586, 0.5607843, 0, 1, 1,
0.7129967, -0.6756096, 2.462595, 0.5647059, 0, 1, 1,
0.7132058, 0.8032484, 0.6771378, 0.572549, 0, 1, 1,
0.7175507, -0.8287217, 1.494613, 0.5764706, 0, 1, 1,
0.717941, 0.05168569, 1.828882, 0.5843138, 0, 1, 1,
0.7363638, 0.3661892, 2.398735, 0.5882353, 0, 1, 1,
0.7384806, -0.0165924, 1.044107, 0.5960785, 0, 1, 1,
0.7419652, 1.047153, -0.09963084, 0.6039216, 0, 1, 1,
0.7445735, -0.5222725, 2.550812, 0.6078432, 0, 1, 1,
0.7463028, 0.3438387, 1.552757, 0.6156863, 0, 1, 1,
0.7517819, 1.492394, -0.6987259, 0.6196079, 0, 1, 1,
0.7601401, 1.469689, 1.41545, 0.627451, 0, 1, 1,
0.7661961, 0.3776094, 2.025949, 0.6313726, 0, 1, 1,
0.7691575, 0.770571, 1.149711, 0.6392157, 0, 1, 1,
0.769941, 0.9718292, 1.348689, 0.6431373, 0, 1, 1,
0.7715727, 0.2118364, 2.663895, 0.6509804, 0, 1, 1,
0.7771086, -2.583787, 1.931329, 0.654902, 0, 1, 1,
0.7834873, -0.1175173, 0.7742385, 0.6627451, 0, 1, 1,
0.7963023, 0.3035294, 1.223906, 0.6666667, 0, 1, 1,
0.7971705, 0.07020788, 1.017822, 0.6745098, 0, 1, 1,
0.8043247, -0.2547749, 2.158055, 0.6784314, 0, 1, 1,
0.8047677, -1.326363, 3.667861, 0.6862745, 0, 1, 1,
0.8067204, -1.029948, 1.744586, 0.6901961, 0, 1, 1,
0.808497, 0.1375175, 0.2128313, 0.6980392, 0, 1, 1,
0.8093626, 0.382871, 1.26797, 0.7058824, 0, 1, 1,
0.8099756, -0.04419894, 1.73176, 0.7098039, 0, 1, 1,
0.8143272, 0.2208977, 3.126822, 0.7176471, 0, 1, 1,
0.817427, 0.8595423, 1.267077, 0.7215686, 0, 1, 1,
0.8196872, 0.7578487, 1.661622, 0.7294118, 0, 1, 1,
0.81996, 3.422099, 1.748709, 0.7333333, 0, 1, 1,
0.8262213, -0.951546, 2.121995, 0.7411765, 0, 1, 1,
0.8282241, -0.076461, 1.033338, 0.7450981, 0, 1, 1,
0.8347587, 0.9322767, 1.288277, 0.7529412, 0, 1, 1,
0.8368908, 0.4906997, 1.18473, 0.7568628, 0, 1, 1,
0.8371034, -0.01420503, -0.01133364, 0.7647059, 0, 1, 1,
0.8418022, 0.366093, 2.438479, 0.7686275, 0, 1, 1,
0.8431399, -1.154712, -0.5069638, 0.7764706, 0, 1, 1,
0.8526151, -0.3381505, 0.3411142, 0.7803922, 0, 1, 1,
0.8565474, 0.8331198, 1.206796, 0.7882353, 0, 1, 1,
0.8611329, 1.601985, 2.353775, 0.7921569, 0, 1, 1,
0.8672694, 0.8901912, 1.493792, 0.8, 0, 1, 1,
0.8674228, 0.4158878, 2.366114, 0.8078431, 0, 1, 1,
0.8691549, 0.1987786, 2.814782, 0.8117647, 0, 1, 1,
0.8718564, -0.1928102, 0.1109759, 0.8196079, 0, 1, 1,
0.877152, -0.8360763, 2.513653, 0.8235294, 0, 1, 1,
0.8775274, -1.499814, 3.05006, 0.8313726, 0, 1, 1,
0.8807893, 0.781445, -0.1950424, 0.8352941, 0, 1, 1,
0.8829793, -0.2131277, 1.310597, 0.8431373, 0, 1, 1,
0.8848726, 0.001455956, 2.401124, 0.8470588, 0, 1, 1,
0.8852153, -1.24529, 0.863364, 0.854902, 0, 1, 1,
0.8866781, 0.9067382, 1.068469, 0.8588235, 0, 1, 1,
0.886976, 1.617947, 0.5806651, 0.8666667, 0, 1, 1,
0.8970365, 0.2436647, 1.794547, 0.8705882, 0, 1, 1,
0.9133268, 1.568504, 2.777457, 0.8784314, 0, 1, 1,
0.9286066, 0.695483, 1.125982, 0.8823529, 0, 1, 1,
0.9298997, 0.7759278, 0.2683976, 0.8901961, 0, 1, 1,
0.9329837, 0.5650894, 0.6094888, 0.8941177, 0, 1, 1,
0.9340778, 0.5890189, 2.081764, 0.9019608, 0, 1, 1,
0.9345073, -2.384916, 3.439893, 0.9098039, 0, 1, 1,
0.9347823, 1.531725, 1.328155, 0.9137255, 0, 1, 1,
0.9382564, -0.03966101, 1.355466, 0.9215686, 0, 1, 1,
0.9417704, -0.7203475, 1.077585, 0.9254902, 0, 1, 1,
0.9441221, -1.871513, 2.258107, 0.9333333, 0, 1, 1,
0.9470943, 0.3618585, 0.006965515, 0.9372549, 0, 1, 1,
0.947777, 0.2781519, 2.169697, 0.945098, 0, 1, 1,
0.9508895, -1.139398, 2.965983, 0.9490196, 0, 1, 1,
0.9570661, -0.2852523, 1.963451, 0.9568627, 0, 1, 1,
0.9623109, -0.4268435, 2.13785, 0.9607843, 0, 1, 1,
0.9664824, 0.5164151, 0.4909584, 0.9686275, 0, 1, 1,
0.9719278, 0.5447935, 1.205922, 0.972549, 0, 1, 1,
0.9741309, 1.042857, 1.74127, 0.9803922, 0, 1, 1,
0.9776217, -0.476558, -0.3594104, 0.9843137, 0, 1, 1,
0.9863359, -0.2466146, 2.284874, 0.9921569, 0, 1, 1,
0.9910701, -0.3671248, 0.1801669, 0.9960784, 0, 1, 1,
0.9919214, 0.3389726, 1.398897, 1, 0, 0.9960784, 1,
0.9931373, 0.1915317, 3.247207, 1, 0, 0.9882353, 1,
0.9961744, -0.9490113, 3.266811, 1, 0, 0.9843137, 1,
0.9962285, 1.512592, 1.852597, 1, 0, 0.9764706, 1,
1.001107, -0.7563612, 1.257452, 1, 0, 0.972549, 1,
1.001405, -0.122575, 1.465036, 1, 0, 0.9647059, 1,
1.003824, -0.1435596, 2.316177, 1, 0, 0.9607843, 1,
1.006523, -0.6610926, 2.199034, 1, 0, 0.9529412, 1,
1.008871, -0.6066773, 3.345005, 1, 0, 0.9490196, 1,
1.008994, -1.059462, 2.244351, 1, 0, 0.9411765, 1,
1.014173, 0.919527, 1.369663, 1, 0, 0.9372549, 1,
1.015698, 0.03653027, 2.100539, 1, 0, 0.9294118, 1,
1.027549, 1.367154, 1.489923, 1, 0, 0.9254902, 1,
1.027982, -0.3603217, 3.085294, 1, 0, 0.9176471, 1,
1.028791, 0.754878, -0.0141518, 1, 0, 0.9137255, 1,
1.038759, 1.346487, -0.08770183, 1, 0, 0.9058824, 1,
1.04134, -0.4989458, 0.3399748, 1, 0, 0.9019608, 1,
1.041817, -0.9765146, 2.241464, 1, 0, 0.8941177, 1,
1.046426, 0.8594569, 1.148025, 1, 0, 0.8862745, 1,
1.050874, -1.368854, 1.901382, 1, 0, 0.8823529, 1,
1.058389, 1.692547, 1.593613, 1, 0, 0.8745098, 1,
1.059271, -1.021072, 2.462702, 1, 0, 0.8705882, 1,
1.060054, 0.2867516, 1.088376, 1, 0, 0.8627451, 1,
1.062588, -0.4390506, 1.10886, 1, 0, 0.8588235, 1,
1.068848, -0.7814645, 0.9070897, 1, 0, 0.8509804, 1,
1.071489, 0.09473722, 0.8149266, 1, 0, 0.8470588, 1,
1.081509, -0.2058076, 1.214962, 1, 0, 0.8392157, 1,
1.08854, -0.03293642, 1.492652, 1, 0, 0.8352941, 1,
1.090472, 1.903601, 0.3106189, 1, 0, 0.827451, 1,
1.094345, -0.05682756, 1.690831, 1, 0, 0.8235294, 1,
1.106116, -1.041645, 2.677207, 1, 0, 0.8156863, 1,
1.111613, -0.1565539, 1.484468, 1, 0, 0.8117647, 1,
1.112029, -0.2541079, 0.004089611, 1, 0, 0.8039216, 1,
1.119123, 0.07665182, -0.3660411, 1, 0, 0.7960784, 1,
1.120243, 0.9630058, 1.063895, 1, 0, 0.7921569, 1,
1.12246, -0.9235785, 1.836779, 1, 0, 0.7843137, 1,
1.123755, 0.6931052, 0.5764151, 1, 0, 0.7803922, 1,
1.124119, -1.736197, 2.728346, 1, 0, 0.772549, 1,
1.126317, 1.240482, 0.06581528, 1, 0, 0.7686275, 1,
1.127431, 1.365844, 0.7447817, 1, 0, 0.7607843, 1,
1.129426, 0.5650918, 0.5536649, 1, 0, 0.7568628, 1,
1.130297, 0.4999876, 0.553429, 1, 0, 0.7490196, 1,
1.131816, 1.860461, 1.541684, 1, 0, 0.7450981, 1,
1.141493, 0.7159374, 1.177197, 1, 0, 0.7372549, 1,
1.146085, 0.1365042, 0.9397961, 1, 0, 0.7333333, 1,
1.147402, -0.6244113, 1.920505, 1, 0, 0.7254902, 1,
1.148422, -0.9470431, 2.566462, 1, 0, 0.7215686, 1,
1.151279, -0.1150306, 0.169295, 1, 0, 0.7137255, 1,
1.153656, 1.457749, 2.484377, 1, 0, 0.7098039, 1,
1.166831, 0.574698, 0.8814235, 1, 0, 0.7019608, 1,
1.179326, 0.4405265, 1.174896, 1, 0, 0.6941177, 1,
1.179336, 1.430419, -0.6507723, 1, 0, 0.6901961, 1,
1.184912, -1.09754, 2.491641, 1, 0, 0.682353, 1,
1.202179, 1.790388, 1.483868, 1, 0, 0.6784314, 1,
1.207395, 0.8486627, 0.6000328, 1, 0, 0.6705883, 1,
1.212343, -0.5283182, 2.34116, 1, 0, 0.6666667, 1,
1.215312, 0.5064561, 2.2959, 1, 0, 0.6588235, 1,
1.217829, -0.6904724, 1.498099, 1, 0, 0.654902, 1,
1.218568, 0.9461761, 1.210471, 1, 0, 0.6470588, 1,
1.225592, 0.3990923, 2.307861, 1, 0, 0.6431373, 1,
1.227398, -0.4330445, 3.033467, 1, 0, 0.6352941, 1,
1.236897, 0.6560681, -0.3911159, 1, 0, 0.6313726, 1,
1.249304, 0.9671015, 1.476303, 1, 0, 0.6235294, 1,
1.254171, 0.4530727, 2.055511, 1, 0, 0.6196079, 1,
1.261889, -0.3150673, 0.8848849, 1, 0, 0.6117647, 1,
1.26568, 1.051112, 0.6096148, 1, 0, 0.6078432, 1,
1.267785, 0.273643, 1.395859, 1, 0, 0.6, 1,
1.273644, 0.8753541, 2.58551, 1, 0, 0.5921569, 1,
1.274406, -0.7998474, 2.744797, 1, 0, 0.5882353, 1,
1.275763, 1.468417, 0.04139527, 1, 0, 0.5803922, 1,
1.279896, -0.6483927, 0.3405715, 1, 0, 0.5764706, 1,
1.285788, -0.2634768, 2.088834, 1, 0, 0.5686275, 1,
1.288151, -0.237106, 2.329446, 1, 0, 0.5647059, 1,
1.296751, -0.6341017, 1.501702, 1, 0, 0.5568628, 1,
1.307601, -0.09420986, 0.4567776, 1, 0, 0.5529412, 1,
1.318762, -0.5308743, 0.9050874, 1, 0, 0.5450981, 1,
1.320268, 0.3444088, -1.948117, 1, 0, 0.5411765, 1,
1.327083, 0.871796, 0.09836306, 1, 0, 0.5333334, 1,
1.331749, 1.256844, 1.226659, 1, 0, 0.5294118, 1,
1.33655, -1.147087, 4.34831, 1, 0, 0.5215687, 1,
1.336872, -0.7130903, 0.9773148, 1, 0, 0.5176471, 1,
1.344959, -0.530356, 0.01337554, 1, 0, 0.509804, 1,
1.355713, 0.953416, 2.18693, 1, 0, 0.5058824, 1,
1.369136, -0.3403501, 1.644112, 1, 0, 0.4980392, 1,
1.385175, -1.232384, 2.404871, 1, 0, 0.4901961, 1,
1.391137, 0.1458594, 2.760685, 1, 0, 0.4862745, 1,
1.392197, -0.9534854, 1.42034, 1, 0, 0.4784314, 1,
1.392823, 1.48669, 1.693773, 1, 0, 0.4745098, 1,
1.39423, 1.55029, -0.2411423, 1, 0, 0.4666667, 1,
1.401201, 0.8302839, 0.6340037, 1, 0, 0.4627451, 1,
1.402748, 0.4733581, 0.5468715, 1, 0, 0.454902, 1,
1.406361, -0.1281866, 0.2939312, 1, 0, 0.4509804, 1,
1.407992, -0.07334027, 2.588336, 1, 0, 0.4431373, 1,
1.429574, 2.346554, -0.5726875, 1, 0, 0.4392157, 1,
1.430613, -0.07781739, 1.820375, 1, 0, 0.4313726, 1,
1.431575, 0.9585288, 0.7621869, 1, 0, 0.427451, 1,
1.432375, -0.8262287, 0.4022254, 1, 0, 0.4196078, 1,
1.433879, 0.909569, 0.7424299, 1, 0, 0.4156863, 1,
1.434635, -0.3666947, 2.152328, 1, 0, 0.4078431, 1,
1.438501, -0.04315075, 2.19691, 1, 0, 0.4039216, 1,
1.439203, 0.222258, 2.991724, 1, 0, 0.3960784, 1,
1.44887, 2.185236, -0.4988908, 1, 0, 0.3882353, 1,
1.460235, -1.910467, 2.944595, 1, 0, 0.3843137, 1,
1.460257, -0.284418, 1.349971, 1, 0, 0.3764706, 1,
1.46677, 0.9436893, 1.064081, 1, 0, 0.372549, 1,
1.47179, -1.046029, 3.758375, 1, 0, 0.3647059, 1,
1.475847, -0.2579453, 1.786217, 1, 0, 0.3607843, 1,
1.480314, 2.4995, 2.544716, 1, 0, 0.3529412, 1,
1.492342, 1.270778, 0.3184475, 1, 0, 0.3490196, 1,
1.49885, 0.2354795, 2.179996, 1, 0, 0.3411765, 1,
1.504452, -0.9660261, 1.033891, 1, 0, 0.3372549, 1,
1.505384, 0.7342007, 1.173676, 1, 0, 0.3294118, 1,
1.527498, -0.2272889, 1.872419, 1, 0, 0.3254902, 1,
1.529239, 0.4427533, -0.4760561, 1, 0, 0.3176471, 1,
1.536587, 0.6450803, 1.407453, 1, 0, 0.3137255, 1,
1.551591, -0.2743742, 0.8805956, 1, 0, 0.3058824, 1,
1.558819, 1.591018, 0.1053728, 1, 0, 0.2980392, 1,
1.560902, -1.736334, 2.275239, 1, 0, 0.2941177, 1,
1.570818, 1.322489, -0.07119121, 1, 0, 0.2862745, 1,
1.587151, 0.2598523, 2.309695, 1, 0, 0.282353, 1,
1.587629, 0.4681051, 0.511281, 1, 0, 0.2745098, 1,
1.588895, -1.288447, 2.846461, 1, 0, 0.2705882, 1,
1.591524, -1.645129, 2.900879, 1, 0, 0.2627451, 1,
1.600588, -0.3528066, 1.831137, 1, 0, 0.2588235, 1,
1.623385, -0.3966888, 3.126961, 1, 0, 0.2509804, 1,
1.648864, -0.2900805, 0.6025153, 1, 0, 0.2470588, 1,
1.649153, 0.31811, 1.505654, 1, 0, 0.2392157, 1,
1.671655, 1.38174, 1.170606, 1, 0, 0.2352941, 1,
1.677421, -0.6259305, 1.552922, 1, 0, 0.227451, 1,
1.714848, -2.141868, 3.914396, 1, 0, 0.2235294, 1,
1.738929, 0.6987674, 2.717842, 1, 0, 0.2156863, 1,
1.741137, 0.1715455, 1.614436, 1, 0, 0.2117647, 1,
1.768468, -0.1613911, 1.322778, 1, 0, 0.2039216, 1,
1.776463, 0.8744883, 1.010574, 1, 0, 0.1960784, 1,
1.785915, 0.5840199, 2.632181, 1, 0, 0.1921569, 1,
1.794637, 0.9703174, 1.742491, 1, 0, 0.1843137, 1,
1.811927, 2.319476, 0.5603787, 1, 0, 0.1803922, 1,
1.820984, 1.208532, 0.5977932, 1, 0, 0.172549, 1,
1.826569, 0.2294588, 0.4285178, 1, 0, 0.1686275, 1,
1.835009, -0.6802073, 2.968908, 1, 0, 0.1607843, 1,
1.85679, -0.347978, 2.668129, 1, 0, 0.1568628, 1,
1.901543, -0.1088917, 3.046275, 1, 0, 0.1490196, 1,
1.913504, 1.953525, 0.01563107, 1, 0, 0.145098, 1,
1.918393, -0.1820612, 2.955393, 1, 0, 0.1372549, 1,
1.931579, -2.149714, 3.493169, 1, 0, 0.1333333, 1,
1.943618, -1.156831, 2.219446, 1, 0, 0.1254902, 1,
1.959908, -0.3125458, 1.242706, 1, 0, 0.1215686, 1,
1.971816, 1.527686, 0.3049184, 1, 0, 0.1137255, 1,
2.03066, 0.08428492, 1.857198, 1, 0, 0.1098039, 1,
2.056251, 0.07596967, 0.4533433, 1, 0, 0.1019608, 1,
2.09696, -2.726446, 0.3062121, 1, 0, 0.09411765, 1,
2.102829, -0.6579106, 0.6050017, 1, 0, 0.09019608, 1,
2.114789, 0.2352282, 1.473445, 1, 0, 0.08235294, 1,
2.131629, 0.809136, 2.312375, 1, 0, 0.07843138, 1,
2.134619, -0.2026881, 3.469164, 1, 0, 0.07058824, 1,
2.172781, -0.4718097, 0.284598, 1, 0, 0.06666667, 1,
2.208279, 0.2397283, 1.114953, 1, 0, 0.05882353, 1,
2.212683, -1.291528, 2.681617, 1, 0, 0.05490196, 1,
2.242842, 1.72961, 0.6376899, 1, 0, 0.04705882, 1,
2.267926, -0.8396183, 2.312703, 1, 0, 0.04313726, 1,
2.332324, -0.9600857, 1.082571, 1, 0, 0.03529412, 1,
2.338645, 0.6041563, 0.23354, 1, 0, 0.03137255, 1,
2.381506, 0.8055865, 2.140081, 1, 0, 0.02352941, 1,
2.41039, 0.9527049, 3.564184, 1, 0, 0.01960784, 1,
2.543487, 0.3920273, 1.78652, 1, 0, 0.01176471, 1,
2.919122, -1.485978, 3.431315, 1, 0, 0.007843138, 1
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
-0.1106651, -4.515761, -6.530038, 0, -0.5, 0.5, 0.5,
-0.1106651, -4.515761, -6.530038, 1, -0.5, 0.5, 0.5,
-0.1106651, -4.515761, -6.530038, 1, 1.5, 0.5, 0.5,
-0.1106651, -4.515761, -6.530038, 0, 1.5, 0.5, 0.5
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
-4.167551, 0.02840054, -6.530038, 0, -0.5, 0.5, 0.5,
-4.167551, 0.02840054, -6.530038, 1, -0.5, 0.5, 0.5,
-4.167551, 0.02840054, -6.530038, 1, 1.5, 0.5, 0.5,
-4.167551, 0.02840054, -6.530038, 0, 1.5, 0.5, 0.5
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
-4.167551, -4.515761, 0.174727, 0, -0.5, 0.5, 0.5,
-4.167551, -4.515761, 0.174727, 1, -0.5, 0.5, 0.5,
-4.167551, -4.515761, 0.174727, 1, 1.5, 0.5, 0.5,
-4.167551, -4.515761, 0.174727, 0, 1.5, 0.5, 0.5
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
-3, -3.467109, -4.982785,
2, -3.467109, -4.982785,
-3, -3.467109, -4.982785,
-3, -3.641884, -5.24066,
-2, -3.467109, -4.982785,
-2, -3.641884, -5.24066,
-1, -3.467109, -4.982785,
-1, -3.641884, -5.24066,
0, -3.467109, -4.982785,
0, -3.641884, -5.24066,
1, -3.467109, -4.982785,
1, -3.641884, -5.24066,
2, -3.467109, -4.982785,
2, -3.641884, -5.24066
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
-3, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
-3, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
-3, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
-3, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5,
-2, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
-2, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
-2, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
-2, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5,
-1, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
-1, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
-1, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
-1, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5,
0, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
0, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
0, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
0, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5,
1, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
1, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
1, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
1, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5,
2, -3.991435, -5.756411, 0, -0.5, 0.5, 0.5,
2, -3.991435, -5.756411, 1, -0.5, 0.5, 0.5,
2, -3.991435, -5.756411, 1, 1.5, 0.5, 0.5,
2, -3.991435, -5.756411, 0, 1.5, 0.5, 0.5
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
-3.231346, -3, -4.982785,
-3.231346, 3, -4.982785,
-3.231346, -3, -4.982785,
-3.38738, -3, -5.24066,
-3.231346, -2, -4.982785,
-3.38738, -2, -5.24066,
-3.231346, -1, -4.982785,
-3.38738, -1, -5.24066,
-3.231346, 0, -4.982785,
-3.38738, 0, -5.24066,
-3.231346, 1, -4.982785,
-3.38738, 1, -5.24066,
-3.231346, 2, -4.982785,
-3.38738, 2, -5.24066,
-3.231346, 3, -4.982785,
-3.38738, 3, -5.24066
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
-3.699448, -3, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, -3, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, -3, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, -3, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, -2, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, -2, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, -2, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, -2, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, -1, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, -1, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, -1, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, -1, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, 0, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, 0, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, 0, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, 0, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, 1, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, 1, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, 1, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, 1, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, 2, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, 2, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, 2, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, 2, -5.756411, 0, 1.5, 0.5, 0.5,
-3.699448, 3, -5.756411, 0, -0.5, 0.5, 0.5,
-3.699448, 3, -5.756411, 1, -0.5, 0.5, 0.5,
-3.699448, 3, -5.756411, 1, 1.5, 0.5, 0.5,
-3.699448, 3, -5.756411, 0, 1.5, 0.5, 0.5
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
-3.231346, -3.467109, -4,
-3.231346, -3.467109, 4,
-3.231346, -3.467109, -4,
-3.38738, -3.641884, -4,
-3.231346, -3.467109, -2,
-3.38738, -3.641884, -2,
-3.231346, -3.467109, 0,
-3.38738, -3.641884, 0,
-3.231346, -3.467109, 2,
-3.38738, -3.641884, 2,
-3.231346, -3.467109, 4,
-3.38738, -3.641884, 4
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
-3.699448, -3.991435, -4, 0, -0.5, 0.5, 0.5,
-3.699448, -3.991435, -4, 1, -0.5, 0.5, 0.5,
-3.699448, -3.991435, -4, 1, 1.5, 0.5, 0.5,
-3.699448, -3.991435, -4, 0, 1.5, 0.5, 0.5,
-3.699448, -3.991435, -2, 0, -0.5, 0.5, 0.5,
-3.699448, -3.991435, -2, 1, -0.5, 0.5, 0.5,
-3.699448, -3.991435, -2, 1, 1.5, 0.5, 0.5,
-3.699448, -3.991435, -2, 0, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 0, 0, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 0, 1, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 0, 1, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 0, 0, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 2, 0, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 2, 1, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 2, 1, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 2, 0, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 4, 0, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 4, 1, -0.5, 0.5, 0.5,
-3.699448, -3.991435, 4, 1, 1.5, 0.5, 0.5,
-3.699448, -3.991435, 4, 0, 1.5, 0.5, 0.5
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
-3.231346, -3.467109, -4.982785,
-3.231346, 3.52391, -4.982785,
-3.231346, -3.467109, 5.332239,
-3.231346, 3.52391, 5.332239,
-3.231346, -3.467109, -4.982785,
-3.231346, -3.467109, 5.332239,
-3.231346, 3.52391, -4.982785,
-3.231346, 3.52391, 5.332239,
-3.231346, -3.467109, -4.982785,
3.010016, -3.467109, -4.982785,
-3.231346, -3.467109, 5.332239,
3.010016, -3.467109, 5.332239,
-3.231346, 3.52391, -4.982785,
3.010016, 3.52391, -4.982785,
-3.231346, 3.52391, 5.332239,
3.010016, 3.52391, 5.332239,
3.010016, -3.467109, -4.982785,
3.010016, 3.52391, -4.982785,
3.010016, -3.467109, 5.332239,
3.010016, 3.52391, 5.332239,
3.010016, -3.467109, -4.982785,
3.010016, -3.467109, 5.332239,
3.010016, 3.52391, -4.982785,
3.010016, 3.52391, 5.332239
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
var radius = 7.44187;
var distance = 33.10972;
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
mvMatrix.translate( 0.1106651, -0.02840054, -0.174727 );
mvMatrix.scale( 1.289189, 1.150948, 0.7800561 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.10972);
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
4-n-heptyl-4-hydroxy<-read.table("4-n-heptyl-4-hydroxy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-n-heptyl-4-hydroxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'n' not found
```

```r
y<-4-n-heptyl-4-hydroxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'n' not found
```

```r
z<-4-n-heptyl-4-hydroxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'n' not found
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
-3.140453, 2.05453, -0.793804, 0, 0, 1, 1, 1,
-2.879396, -1.517113, -2.254955, 1, 0, 0, 1, 1,
-2.741785, 1.003874, -1.355837, 1, 0, 0, 1, 1,
-2.680244, 0.2922064, -2.067148, 1, 0, 0, 1, 1,
-2.675905, -0.3964166, -1.214154, 1, 0, 0, 1, 1,
-2.67106, 0.9158585, 0.09801833, 1, 0, 0, 1, 1,
-2.609001, 0.9321585, -1.732169, 0, 0, 0, 1, 1,
-2.578468, -1.787092, -0.8495988, 0, 0, 0, 1, 1,
-2.487474, -0.4000165, -2.098491, 0, 0, 0, 1, 1,
-2.409919, -0.6978993, -1.475175, 0, 0, 0, 1, 1,
-2.289241, -0.04161775, -0.6648168, 0, 0, 0, 1, 1,
-2.243394, 0.4635054, -0.4125932, 0, 0, 0, 1, 1,
-2.213522, -1.439203, -2.907014, 0, 0, 0, 1, 1,
-2.198173, -1.437979, -0.2199394, 1, 1, 1, 1, 1,
-2.176344, 1.040127, -2.50514, 1, 1, 1, 1, 1,
-2.152045, 1.487963, -0.1310539, 1, 1, 1, 1, 1,
-2.109669, -0.4317566, -2.424382, 1, 1, 1, 1, 1,
-2.108531, 2.016995, 0.05324544, 1, 1, 1, 1, 1,
-2.055561, -0.9343358, -2.606831, 1, 1, 1, 1, 1,
-2.053274, -2.635357, -3.101079, 1, 1, 1, 1, 1,
-1.996464, 0.168759, -0.8153379, 1, 1, 1, 1, 1,
-1.976467, 0.6411071, -0.8872228, 1, 1, 1, 1, 1,
-1.969732, -0.2869736, -2.370099, 1, 1, 1, 1, 1,
-1.965935, -0.8148733, -3.096153, 1, 1, 1, 1, 1,
-1.956708, 0.1827066, -0.4711694, 1, 1, 1, 1, 1,
-1.937596, -0.3426431, -1.001076, 1, 1, 1, 1, 1,
-1.916424, 0.08088923, -2.278342, 1, 1, 1, 1, 1,
-1.901646, 1.680287, -1.368741, 1, 1, 1, 1, 1,
-1.898495, 0.3292141, -1.049775, 0, 0, 1, 1, 1,
-1.898465, -1.27251, -3.936913, 1, 0, 0, 1, 1,
-1.85993, -1.198224, -1.354345, 1, 0, 0, 1, 1,
-1.856881, -1.429355, -0.3728676, 1, 0, 0, 1, 1,
-1.856727, 1.112924, -0.2241107, 1, 0, 0, 1, 1,
-1.852728, -0.369319, 0.1477766, 1, 0, 0, 1, 1,
-1.842357, -1.083603, -3.143274, 0, 0, 0, 1, 1,
-1.837555, 0.1830133, 0.6620613, 0, 0, 0, 1, 1,
-1.83149, -1.022901, -0.6932106, 0, 0, 0, 1, 1,
-1.815217, 1.571536, -0.3547938, 0, 0, 0, 1, 1,
-1.778928, -0.6058899, -4.601175, 0, 0, 0, 1, 1,
-1.761873, 1.715008, -0.9862641, 0, 0, 0, 1, 1,
-1.760971, 0.8864714, -1.384673, 0, 0, 0, 1, 1,
-1.719499, -0.3972812, 0.1303051, 1, 1, 1, 1, 1,
-1.716935, 1.106402, -2.714744, 1, 1, 1, 1, 1,
-1.715093, 0.1603619, -2.500058, 1, 1, 1, 1, 1,
-1.69964, -0.5769172, -1.521132, 1, 1, 1, 1, 1,
-1.695737, 1.029771, -2.111997, 1, 1, 1, 1, 1,
-1.683298, 0.4651352, -1.825969, 1, 1, 1, 1, 1,
-1.672143, -1.057995, -1.690444, 1, 1, 1, 1, 1,
-1.649032, -0.5721887, -1.70709, 1, 1, 1, 1, 1,
-1.632883, -0.5696604, -2.437088, 1, 1, 1, 1, 1,
-1.627568, -0.5705674, -3.019371, 1, 1, 1, 1, 1,
-1.621313, 0.2197038, -2.031536, 1, 1, 1, 1, 1,
-1.618418, -0.3347165, 0.2715757, 1, 1, 1, 1, 1,
-1.616852, 0.4803081, -1.121167, 1, 1, 1, 1, 1,
-1.601473, 1.790554, -1.069496, 1, 1, 1, 1, 1,
-1.595416, -1.069221, -2.530442, 1, 1, 1, 1, 1,
-1.556624, 0.2704596, -0.5113391, 0, 0, 1, 1, 1,
-1.556477, 0.8699347, -1.584121, 1, 0, 0, 1, 1,
-1.553801, -2.37704, -1.618676, 1, 0, 0, 1, 1,
-1.553626, 1.166927, -0.8399278, 1, 0, 0, 1, 1,
-1.552657, -0.008280886, -1.485142, 1, 0, 0, 1, 1,
-1.548425, 0.6442274, -1.650097, 1, 0, 0, 1, 1,
-1.538227, 0.6607977, -1.276633, 0, 0, 0, 1, 1,
-1.537259, -1.369727, -3.022106, 0, 0, 0, 1, 1,
-1.528082, -0.2640332, -1.604259, 0, 0, 0, 1, 1,
-1.525007, 1.673393, 1.137218, 0, 0, 0, 1, 1,
-1.506507, 0.002249668, -1.332174, 0, 0, 0, 1, 1,
-1.496741, -1.031972, -1.506133, 0, 0, 0, 1, 1,
-1.483725, -0.4643608, -1.278106, 0, 0, 0, 1, 1,
-1.479571, 1.207674, -1.11801, 1, 1, 1, 1, 1,
-1.473659, 1.108353, -0.1168795, 1, 1, 1, 1, 1,
-1.454599, 0.3577372, -1.751488, 1, 1, 1, 1, 1,
-1.447554, -0.1382181, -2.551782, 1, 1, 1, 1, 1,
-1.443514, 0.3254907, -2.405521, 1, 1, 1, 1, 1,
-1.438625, 1.444999, 1.088022, 1, 1, 1, 1, 1,
-1.415684, -1.086774, -1.129821, 1, 1, 1, 1, 1,
-1.414132, 0.5986192, -0.5716245, 1, 1, 1, 1, 1,
-1.407103, -1.150131, -3.209491, 1, 1, 1, 1, 1,
-1.406511, -1.117359, -1.954198, 1, 1, 1, 1, 1,
-1.405601, 0.5642905, -2.01374, 1, 1, 1, 1, 1,
-1.396191, 0.3053921, -2.000019, 1, 1, 1, 1, 1,
-1.392294, -0.8025436, -2.984436, 1, 1, 1, 1, 1,
-1.389741, 0.04337882, -0.2132162, 1, 1, 1, 1, 1,
-1.38844, -0.1964314, -2.36815, 1, 1, 1, 1, 1,
-1.388239, -1.175731, -1.27099, 0, 0, 1, 1, 1,
-1.386949, 0.826564, 1.079168, 1, 0, 0, 1, 1,
-1.382399, -0.1568745, -2.691106, 1, 0, 0, 1, 1,
-1.368978, -1.448122, -1.86221, 1, 0, 0, 1, 1,
-1.368069, 1.017538, -2.322397, 1, 0, 0, 1, 1,
-1.333131, -0.1622625, -2.349566, 1, 0, 0, 1, 1,
-1.332775, -1.19368, -1.822945, 0, 0, 0, 1, 1,
-1.329494, 1.404863, -1.722917, 0, 0, 0, 1, 1,
-1.327481, 1.240484, -1.362991, 0, 0, 0, 1, 1,
-1.325706, 1.058107, -0.4694847, 0, 0, 0, 1, 1,
-1.323946, -2.130311, -2.265144, 0, 0, 0, 1, 1,
-1.313423, -1.450044, -2.338999, 0, 0, 0, 1, 1,
-1.302445, 0.7076695, -2.784249, 0, 0, 0, 1, 1,
-1.297884, 0.3381369, -2.302951, 1, 1, 1, 1, 1,
-1.296949, -0.3300329, -1.069131, 1, 1, 1, 1, 1,
-1.29255, -1.479117, -1.033716, 1, 1, 1, 1, 1,
-1.271948, -1.400665, -2.369069, 1, 1, 1, 1, 1,
-1.265197, 0.7765698, 0.776437, 1, 1, 1, 1, 1,
-1.262669, -0.7081254, -1.918486, 1, 1, 1, 1, 1,
-1.256438, 1.234214, -1.409908, 1, 1, 1, 1, 1,
-1.245349, -0.1605884, -0.4924838, 1, 1, 1, 1, 1,
-1.245258, 1.302769, -1.895961, 1, 1, 1, 1, 1,
-1.241801, 0.8603353, -1.178223, 1, 1, 1, 1, 1,
-1.240401, 1.56116, -0.6592662, 1, 1, 1, 1, 1,
-1.239642, 0.3834527, -0.1964165, 1, 1, 1, 1, 1,
-1.230967, -0.6722439, -2.255385, 1, 1, 1, 1, 1,
-1.228578, -1.256425, -1.934008, 1, 1, 1, 1, 1,
-1.22811, -1.442552, -3.511939, 1, 1, 1, 1, 1,
-1.218042, -1.4493, -3.030719, 0, 0, 1, 1, 1,
-1.214689, 1.194131, -1.88937, 1, 0, 0, 1, 1,
-1.210635, 1.073858, -0.3952965, 1, 0, 0, 1, 1,
-1.198631, -0.190043, -3.263729, 1, 0, 0, 1, 1,
-1.195103, -0.2755232, -2.70445, 1, 0, 0, 1, 1,
-1.17691, 0.409974, -0.7623841, 1, 0, 0, 1, 1,
-1.173737, 0.7343459, 0.2214811, 0, 0, 0, 1, 1,
-1.166137, 1.896202, -0.2441057, 0, 0, 0, 1, 1,
-1.165587, -0.3327504, -1.815743, 0, 0, 0, 1, 1,
-1.162343, -0.4536016, -1.971578, 0, 0, 0, 1, 1,
-1.154153, 1.134083, -0.1404407, 0, 0, 0, 1, 1,
-1.144734, -1.102752, -2.344922, 0, 0, 0, 1, 1,
-1.13947, -0.6899707, -2.68853, 0, 0, 0, 1, 1,
-1.130299, 0.6755715, 0.3607012, 1, 1, 1, 1, 1,
-1.129952, -0.212391, -2.607738, 1, 1, 1, 1, 1,
-1.1259, -0.7992971, -1.583581, 1, 1, 1, 1, 1,
-1.123403, 0.3247849, -1.451058, 1, 1, 1, 1, 1,
-1.12305, -0.2524494, -2.336864, 1, 1, 1, 1, 1,
-1.122847, 0.7991269, -1.190538, 1, 1, 1, 1, 1,
-1.116965, 0.1924147, -0.7427002, 1, 1, 1, 1, 1,
-1.114944, 0.1458992, -1.902905, 1, 1, 1, 1, 1,
-1.110604, -0.3692803, -4.111267, 1, 1, 1, 1, 1,
-1.099572, -1.011574, -3.486974, 1, 1, 1, 1, 1,
-1.098197, -0.5666766, -2.088123, 1, 1, 1, 1, 1,
-1.087085, -1.577286, -1.538475, 1, 1, 1, 1, 1,
-1.077137, -0.5550838, -3.477415, 1, 1, 1, 1, 1,
-1.076145, -0.5879551, -1.437861, 1, 1, 1, 1, 1,
-1.07391, -1.666139, -2.380133, 1, 1, 1, 1, 1,
-1.07311, 1.044177, 0.09959436, 0, 0, 1, 1, 1,
-1.070677, -0.3643067, -2.156977, 1, 0, 0, 1, 1,
-1.069786, 0.06394995, -2.9283, 1, 0, 0, 1, 1,
-1.064731, -0.1906511, -1.474391, 1, 0, 0, 1, 1,
-1.060191, 0.6835418, -1.368066, 1, 0, 0, 1, 1,
-1.06014, -0.9528056, -1.645474, 1, 0, 0, 1, 1,
-1.048211, 0.7251819, -0.5012547, 0, 0, 0, 1, 1,
-1.038066, 0.5133124, -0.8491262, 0, 0, 0, 1, 1,
-1.033358, 1.034405, -1.834704, 0, 0, 0, 1, 1,
-1.031922, -0.7490388, -2.595873, 0, 0, 0, 1, 1,
-1.0313, 1.308895, -0.2779928, 0, 0, 0, 1, 1,
-1.028337, -0.4087854, -1.817845, 0, 0, 0, 1, 1,
-1.026903, 0.9019251, -1.783056, 0, 0, 0, 1, 1,
-1.023412, 0.05072715, -1.94509, 1, 1, 1, 1, 1,
-1.017589, 0.1647435, -2.96843, 1, 1, 1, 1, 1,
-1.013572, 0.7471179, -0.1313742, 1, 1, 1, 1, 1,
-1.007916, 1.503958, -1.157817, 1, 1, 1, 1, 1,
-1.004683, -0.7398341, -1.90793, 1, 1, 1, 1, 1,
-1.001076, 0.1165422, -1.631061, 1, 1, 1, 1, 1,
-0.9999723, -1.282333, -2.330822, 1, 1, 1, 1, 1,
-0.9991633, -0.5872463, -1.982547, 1, 1, 1, 1, 1,
-0.9964144, 1.953761, -1.965374, 1, 1, 1, 1, 1,
-0.9956835, 0.4143598, -0.9407576, 1, 1, 1, 1, 1,
-0.9848197, 1.537091, -0.3876788, 1, 1, 1, 1, 1,
-0.9828815, -1.534026, -2.810194, 1, 1, 1, 1, 1,
-0.9819918, 1.065751, -1.327209, 1, 1, 1, 1, 1,
-0.9744827, 0.297093, -0.6328628, 1, 1, 1, 1, 1,
-0.9720383, -0.1544707, -0.8887358, 1, 1, 1, 1, 1,
-0.9691269, 0.6928365, 1.130985, 0, 0, 1, 1, 1,
-0.9644343, -0.3085161, -1.089997, 1, 0, 0, 1, 1,
-0.963906, 0.9775, -0.8404162, 1, 0, 0, 1, 1,
-0.9635756, 0.9780001, -1.591217, 1, 0, 0, 1, 1,
-0.9614688, 0.5439591, -0.567988, 1, 0, 0, 1, 1,
-0.961334, -0.3305798, -1.913561, 1, 0, 0, 1, 1,
-0.9592738, -2.329827, -3.027402, 0, 0, 0, 1, 1,
-0.9530669, -0.3208709, -2.239582, 0, 0, 0, 1, 1,
-0.9464793, -0.2342742, -1.927816, 0, 0, 0, 1, 1,
-0.9458775, -0.912142, -4.157743, 0, 0, 0, 1, 1,
-0.9440395, 0.4138924, -0.8016726, 0, 0, 0, 1, 1,
-0.9408948, -0.3050416, -1.941817, 0, 0, 0, 1, 1,
-0.9378808, 0.9960405, 0.1216303, 0, 0, 0, 1, 1,
-0.9374256, 0.5392118, -1.815076, 1, 1, 1, 1, 1,
-0.9335099, 1.131778, -0.1738649, 1, 1, 1, 1, 1,
-0.9283493, 0.7424726, -0.3484355, 1, 1, 1, 1, 1,
-0.9202272, 0.4767519, -2.862563, 1, 1, 1, 1, 1,
-0.9199765, -1.646871, -2.493634, 1, 1, 1, 1, 1,
-0.9163292, -0.88865, -4.547394, 1, 1, 1, 1, 1,
-0.9115591, -1.661265, -0.4245882, 1, 1, 1, 1, 1,
-0.9062851, -1.215922, -2.421116, 1, 1, 1, 1, 1,
-0.9019976, -2.068204, -1.828256, 1, 1, 1, 1, 1,
-0.8894159, -1.112504, -2.003045, 1, 1, 1, 1, 1,
-0.8889447, 1.950621, -0.4541361, 1, 1, 1, 1, 1,
-0.8766534, 0.376962, -1.300722, 1, 1, 1, 1, 1,
-0.8738925, 0.9057042, 0.5790943, 1, 1, 1, 1, 1,
-0.8737023, 0.7299777, -1.655522, 1, 1, 1, 1, 1,
-0.8733196, 0.1479469, -1.191457, 1, 1, 1, 1, 1,
-0.870242, -0.2911664, -2.22728, 0, 0, 1, 1, 1,
-0.8682664, -2.211582, -2.492505, 1, 0, 0, 1, 1,
-0.8670592, 0.7293323, 0.7471182, 1, 0, 0, 1, 1,
-0.8541235, -0.6386334, -2.989057, 1, 0, 0, 1, 1,
-0.8538611, 1.050874, 0.1855296, 1, 0, 0, 1, 1,
-0.8465683, 1.167251, -2.875382, 1, 0, 0, 1, 1,
-0.8394511, 0.6215179, 2.536055, 0, 0, 0, 1, 1,
-0.8393688, -0.0006458383, -0.7904704, 0, 0, 0, 1, 1,
-0.8351886, 1.467556, -0.8124722, 0, 0, 0, 1, 1,
-0.8347113, -0.08529287, -2.223276, 0, 0, 0, 1, 1,
-0.8262745, -1.077343, -2.012424, 0, 0, 0, 1, 1,
-0.8162183, 0.4519837, -0.6447671, 0, 0, 0, 1, 1,
-0.812202, -1.146053, -3.086364, 0, 0, 0, 1, 1,
-0.8059865, 1.10908, 1.960802, 1, 1, 1, 1, 1,
-0.8052282, 1.170311, -1.179659, 1, 1, 1, 1, 1,
-0.8033403, 0.5304929, -0.3360628, 1, 1, 1, 1, 1,
-0.7978013, 1.308498, -1.143071, 1, 1, 1, 1, 1,
-0.7907671, 2.111875, 0.4839677, 1, 1, 1, 1, 1,
-0.790646, 0.4373298, -0.9750592, 1, 1, 1, 1, 1,
-0.7830349, -0.6030737, -2.198004, 1, 1, 1, 1, 1,
-0.7819698, 0.3973275, -2.491177, 1, 1, 1, 1, 1,
-0.7812285, -0.9643246, -1.824977, 1, 1, 1, 1, 1,
-0.7759914, -0.7830075, -2.021531, 1, 1, 1, 1, 1,
-0.7756463, -0.1407574, -2.222375, 1, 1, 1, 1, 1,
-0.7741632, -0.9403446, -2.462102, 1, 1, 1, 1, 1,
-0.7719611, -1.699516, -4.59799, 1, 1, 1, 1, 1,
-0.7646298, 0.4630668, -2.768967, 1, 1, 1, 1, 1,
-0.7633221, -0.157369, -0.7709004, 1, 1, 1, 1, 1,
-0.7564878, -0.7699614, -3.146814, 0, 0, 1, 1, 1,
-0.7547072, 0.08882603, -1.256408, 1, 0, 0, 1, 1,
-0.7545571, -0.07106792, -3.426242, 1, 0, 0, 1, 1,
-0.7525367, -0.7401223, -2.01674, 1, 0, 0, 1, 1,
-0.7500333, 1.363111, 2.152618, 1, 0, 0, 1, 1,
-0.7421757, -0.174133, -2.91227, 1, 0, 0, 1, 1,
-0.7410479, 0.4247246, -0.7982067, 0, 0, 0, 1, 1,
-0.7402875, -0.9832082, -1.21345, 0, 0, 0, 1, 1,
-0.7362019, 0.9903736, -1.701436, 0, 0, 0, 1, 1,
-0.7357759, 0.08640298, -2.068461, 0, 0, 0, 1, 1,
-0.7325594, 0.5376397, -3.29554, 0, 0, 0, 1, 1,
-0.7317711, 0.7137235, -1.13924, 0, 0, 0, 1, 1,
-0.7317531, -0.8759859, -2.636585, 0, 0, 0, 1, 1,
-0.7270407, 1.975214, 0.1814343, 1, 1, 1, 1, 1,
-0.7245322, 1.053022, -1.63463, 1, 1, 1, 1, 1,
-0.7169241, -0.199819, -1.906088, 1, 1, 1, 1, 1,
-0.7123829, 0.3187052, -0.4200793, 1, 1, 1, 1, 1,
-0.7115033, -1.643154, -3.130258, 1, 1, 1, 1, 1,
-0.7105507, -2.183832, -2.118121, 1, 1, 1, 1, 1,
-0.705751, 0.5644907, -0.972088, 1, 1, 1, 1, 1,
-0.702592, -1.117016, -3.46147, 1, 1, 1, 1, 1,
-0.7008675, 0.9649805, -0.4159752, 1, 1, 1, 1, 1,
-0.6881138, 0.4241066, -0.8949311, 1, 1, 1, 1, 1,
-0.6769293, 0.1939871, -0.09353841, 1, 1, 1, 1, 1,
-0.6745768, 1.157374, 1.292161, 1, 1, 1, 1, 1,
-0.672471, -0.346894, -2.391645, 1, 1, 1, 1, 1,
-0.6644387, 0.2439548, -1.726154, 1, 1, 1, 1, 1,
-0.6622637, -1.729688, -2.277197, 1, 1, 1, 1, 1,
-0.6606557, 0.0935583, -1.775818, 0, 0, 1, 1, 1,
-0.6606278, -1.753021, -3.932089, 1, 0, 0, 1, 1,
-0.6600835, -0.8490312, -3.482661, 1, 0, 0, 1, 1,
-0.656011, -0.8901742, -1.755406, 1, 0, 0, 1, 1,
-0.6490943, 1.164417, -0.2290646, 1, 0, 0, 1, 1,
-0.6480743, -1.215365, -1.347357, 1, 0, 0, 1, 1,
-0.6477793, 0.6056756, -1.218737, 0, 0, 0, 1, 1,
-0.6431433, 0.05498454, 0.3881667, 0, 0, 0, 1, 1,
-0.643084, 0.3853734, -1.34445, 0, 0, 0, 1, 1,
-0.6420285, 1.988731, 0.592945, 0, 0, 0, 1, 1,
-0.6417674, -1.126337, -2.827149, 0, 0, 0, 1, 1,
-0.6407396, -0.9459811, -2.148595, 0, 0, 0, 1, 1,
-0.6382548, -0.5484639, -4.832566, 0, 0, 0, 1, 1,
-0.6304903, 1.0892, -1.23771, 1, 1, 1, 1, 1,
-0.6246141, -1.880499, -3.293884, 1, 1, 1, 1, 1,
-0.6215282, -1.485744, -1.488136, 1, 1, 1, 1, 1,
-0.6194858, 1.700191, 0.1720827, 1, 1, 1, 1, 1,
-0.6193804, 0.7003238, -1.691616, 1, 1, 1, 1, 1,
-0.6061476, 0.3934768, -0.8362527, 1, 1, 1, 1, 1,
-0.5955009, -0.4454671, -2.021246, 1, 1, 1, 1, 1,
-0.5913423, 0.619056, -1.982982, 1, 1, 1, 1, 1,
-0.5859578, -1.795258, -2.161164, 1, 1, 1, 1, 1,
-0.5854849, -0.0987498, -1.582841, 1, 1, 1, 1, 1,
-0.5852727, -0.1320294, -3.326023, 1, 1, 1, 1, 1,
-0.5829816, 0.8638972, 0.4974214, 1, 1, 1, 1, 1,
-0.5742099, -1.22562, -2.036361, 1, 1, 1, 1, 1,
-0.574135, -0.1649464, -0.9441789, 1, 1, 1, 1, 1,
-0.5732567, -0.9974067, -1.670726, 1, 1, 1, 1, 1,
-0.5728308, -0.7146883, -2.406401, 0, 0, 1, 1, 1,
-0.5714039, 1.714884, 0.4206017, 1, 0, 0, 1, 1,
-0.5653845, 0.2780147, -0.9481846, 1, 0, 0, 1, 1,
-0.5641683, -0.26776, -0.3779441, 1, 0, 0, 1, 1,
-0.5618429, -1.830905, -1.534032, 1, 0, 0, 1, 1,
-0.5540193, 0.06525224, -0.6815352, 1, 0, 0, 1, 1,
-0.5540079, -1.129764, -2.390671, 0, 0, 0, 1, 1,
-0.5521566, 1.687265, -1.023603, 0, 0, 0, 1, 1,
-0.5471089, 1.504564, -1.467316, 0, 0, 0, 1, 1,
-0.5436379, -0.6670598, -2.924126, 0, 0, 0, 1, 1,
-0.5407686, -1.422887, -2.299583, 0, 0, 0, 1, 1,
-0.5308148, 0.1389057, -1.761145, 0, 0, 0, 1, 1,
-0.5283881, 0.3547312, -1.521209, 0, 0, 0, 1, 1,
-0.5255969, -0.8013997, -2.757186, 1, 1, 1, 1, 1,
-0.52421, 1.061593, 0.557066, 1, 1, 1, 1, 1,
-0.5238667, 1.064906, 1.921097, 1, 1, 1, 1, 1,
-0.5227078, 0.4497757, -0.02341473, 1, 1, 1, 1, 1,
-0.520474, 0.2745233, -0.3193234, 1, 1, 1, 1, 1,
-0.5189736, -0.03968219, -2.445944, 1, 1, 1, 1, 1,
-0.5186579, -0.2170619, -2.621311, 1, 1, 1, 1, 1,
-0.5184505, -1.231715, -2.395143, 1, 1, 1, 1, 1,
-0.5180957, -2.396496, -2.242885, 1, 1, 1, 1, 1,
-0.5173272, -0.7487612, -3.140519, 1, 1, 1, 1, 1,
-0.5166855, 0.2507112, -2.212536, 1, 1, 1, 1, 1,
-0.5164881, 0.6767501, -1.507106, 1, 1, 1, 1, 1,
-0.5124794, -0.8717622, -2.855511, 1, 1, 1, 1, 1,
-0.5112926, -0.3041265, -2.596713, 1, 1, 1, 1, 1,
-0.5101819, 0.2823956, -2.669143, 1, 1, 1, 1, 1,
-0.5049291, -1.746393, -2.915653, 0, 0, 1, 1, 1,
-0.5031634, -0.3791662, -0.8417516, 1, 0, 0, 1, 1,
-0.502137, 0.9837098, 0.8304779, 1, 0, 0, 1, 1,
-0.5015845, -1.055987, -2.236903, 1, 0, 0, 1, 1,
-0.5004746, 0.7973476, 0.9007578, 1, 0, 0, 1, 1,
-0.4935039, 1.409779, -3.637044, 1, 0, 0, 1, 1,
-0.4932545, -2.489813, -2.701921, 0, 0, 0, 1, 1,
-0.4905966, -0.09884613, -1.21835, 0, 0, 0, 1, 1,
-0.4894288, -0.05322297, -1.609759, 0, 0, 0, 1, 1,
-0.4887277, -0.08628201, -1.845721, 0, 0, 0, 1, 1,
-0.4881288, 0.1280334, 1.088357, 0, 0, 0, 1, 1,
-0.4879241, 0.03999549, -0.8423541, 0, 0, 0, 1, 1,
-0.4859627, -0.8785941, -1.921052, 0, 0, 0, 1, 1,
-0.4848525, -1.60598, -2.050213, 1, 1, 1, 1, 1,
-0.4831281, 0.831818, 2.257927, 1, 1, 1, 1, 1,
-0.4817213, -1.686411, -3.864367, 1, 1, 1, 1, 1,
-0.4806567, -0.4322751, -2.089083, 1, 1, 1, 1, 1,
-0.480264, -1.652541, -1.707642, 1, 1, 1, 1, 1,
-0.4800942, 0.5475674, -1.46552, 1, 1, 1, 1, 1,
-0.4775179, -0.8930215, -1.799776, 1, 1, 1, 1, 1,
-0.4758649, 1.186663, -0.5777802, 1, 1, 1, 1, 1,
-0.4749638, 0.3877485, -1.104172, 1, 1, 1, 1, 1,
-0.4670798, -2.109458, -3.38962, 1, 1, 1, 1, 1,
-0.4666959, -0.5782076, -2.338458, 1, 1, 1, 1, 1,
-0.4629643, 1.065854, 0.2592705, 1, 1, 1, 1, 1,
-0.4530608, 0.07109936, 0.1650516, 1, 1, 1, 1, 1,
-0.4467161, -1.115488, -2.534443, 1, 1, 1, 1, 1,
-0.4453284, -1.040046, -2.61739, 1, 1, 1, 1, 1,
-0.4383988, 1.09152, -1.450569, 0, 0, 1, 1, 1,
-0.4381849, 0.5176742, -1.588609, 1, 0, 0, 1, 1,
-0.4371126, -0.7805525, -2.411654, 1, 0, 0, 1, 1,
-0.4363118, 0.1528869, 0.6330391, 1, 0, 0, 1, 1,
-0.4359679, -0.2528096, -1.582759, 1, 0, 0, 1, 1,
-0.4342001, 0.46152, -1.878676, 1, 0, 0, 1, 1,
-0.4341688, -0.6900905, -3.761322, 0, 0, 0, 1, 1,
-0.432894, 0.4860186, -2.261021, 0, 0, 0, 1, 1,
-0.432546, -1.485774, -2.108342, 0, 0, 0, 1, 1,
-0.4321713, -0.09820547, -0.8065168, 0, 0, 0, 1, 1,
-0.4297613, 0.2441655, -1.6059, 0, 0, 0, 1, 1,
-0.4295648, -2.023426, -2.494347, 0, 0, 0, 1, 1,
-0.4273526, 0.9584055, -0.2217583, 0, 0, 0, 1, 1,
-0.4247099, -0.3285383, -4.302305, 1, 1, 1, 1, 1,
-0.4169053, -0.8522516, -4.083156, 1, 1, 1, 1, 1,
-0.4104424, -0.3859747, -2.05354, 1, 1, 1, 1, 1,
-0.4096529, 0.5752183, 0.9730245, 1, 1, 1, 1, 1,
-0.4092863, -0.3972595, -1.677198, 1, 1, 1, 1, 1,
-0.4050482, 0.2335972, -0.520876, 1, 1, 1, 1, 1,
-0.4014541, 0.461864, -1.35209, 1, 1, 1, 1, 1,
-0.3996746, -2.142696, -1.627093, 1, 1, 1, 1, 1,
-0.3955236, 0.02598897, -1.728311, 1, 1, 1, 1, 1,
-0.391834, -1.225866, -3.204762, 1, 1, 1, 1, 1,
-0.3846094, -0.3240847, -3.281594, 1, 1, 1, 1, 1,
-0.3835679, 0.9674386, -0.3327952, 1, 1, 1, 1, 1,
-0.3815875, 0.06413828, -1.78418, 1, 1, 1, 1, 1,
-0.3802407, -1.431175, -4.407488, 1, 1, 1, 1, 1,
-0.3670723, 1.859868, 0.08479104, 1, 1, 1, 1, 1,
-0.3636046, -0.8112259, -4.353259, 0, 0, 1, 1, 1,
-0.3614636, -0.03305571, -2.109947, 1, 0, 0, 1, 1,
-0.3611373, -0.06981528, -3.512181, 1, 0, 0, 1, 1,
-0.3608341, 0.4533769, -0.8340779, 1, 0, 0, 1, 1,
-0.3495144, -0.09475209, -1.715177, 1, 0, 0, 1, 1,
-0.3480231, -0.2167148, -0.9926182, 1, 0, 0, 1, 1,
-0.3477063, 1.020243, -0.3968252, 0, 0, 0, 1, 1,
-0.3467896, 1.185654, -0.2195014, 0, 0, 0, 1, 1,
-0.3448104, -0.06574233, -1.40872, 0, 0, 0, 1, 1,
-0.3400685, -1.114957, -3.91149, 0, 0, 0, 1, 1,
-0.3392095, 0.4110833, -2.040009, 0, 0, 0, 1, 1,
-0.3354762, 0.285232, -1.728237, 0, 0, 0, 1, 1,
-0.3347553, -0.9871261, -2.387606, 0, 0, 0, 1, 1,
-0.331767, -1.153922, -4.446292, 1, 1, 1, 1, 1,
-0.330035, -1.484625, -3.481695, 1, 1, 1, 1, 1,
-0.3259864, 1.347238, -1.34764, 1, 1, 1, 1, 1,
-0.3247384, 0.03097844, -2.474985, 1, 1, 1, 1, 1,
-0.3197904, -0.7349523, -2.688966, 1, 1, 1, 1, 1,
-0.3192345, -0.7597442, -2.693877, 1, 1, 1, 1, 1,
-0.3186439, -0.5242285, -1.636215, 1, 1, 1, 1, 1,
-0.3178095, -0.7913857, -2.432359, 1, 1, 1, 1, 1,
-0.3169196, -1.171594, -2.693707, 1, 1, 1, 1, 1,
-0.3094351, 0.02647284, -2.338875, 1, 1, 1, 1, 1,
-0.3052154, 0.4096203, -1.920834, 1, 1, 1, 1, 1,
-0.3024622, 1.448971, -0.457112, 1, 1, 1, 1, 1,
-0.2991776, 0.4473504, 0.5340489, 1, 1, 1, 1, 1,
-0.2986444, -0.2446005, -2.919995, 1, 1, 1, 1, 1,
-0.2941075, 2.344786, -0.619384, 1, 1, 1, 1, 1,
-0.2891106, -1.740427, -3.861421, 0, 0, 1, 1, 1,
-0.2799645, 0.2002349, -1.714541, 1, 0, 0, 1, 1,
-0.2786988, -0.1729931, -1.448332, 1, 0, 0, 1, 1,
-0.2775841, 1.042657, -0.05437525, 1, 0, 0, 1, 1,
-0.2774603, -0.6523874, -0.9631119, 1, 0, 0, 1, 1,
-0.2700114, 0.2205113, -2.423843, 1, 0, 0, 1, 1,
-0.2663487, -0.2539229, -2.781185, 0, 0, 0, 1, 1,
-0.2635495, -0.2945437, -3.868071, 0, 0, 0, 1, 1,
-0.2586482, -0.6638339, -4.393312, 0, 0, 0, 1, 1,
-0.2570588, -1.439376, -2.91161, 0, 0, 0, 1, 1,
-0.2525376, -1.09598, -1.943247, 0, 0, 0, 1, 1,
-0.2509119, -1.141599, -2.242674, 0, 0, 0, 1, 1,
-0.2499658, 1.08685, 0.2561557, 0, 0, 0, 1, 1,
-0.2474275, -1.224605, -2.348991, 1, 1, 1, 1, 1,
-0.247329, -0.6010208, -3.314049, 1, 1, 1, 1, 1,
-0.2460931, -0.5549545, -0.9503192, 1, 1, 1, 1, 1,
-0.2428124, 0.9217345, -0.2254385, 1, 1, 1, 1, 1,
-0.236547, -0.3699984, -2.643841, 1, 1, 1, 1, 1,
-0.2308826, -1.670225, -1.206499, 1, 1, 1, 1, 1,
-0.2275516, 1.581084, 0.90133, 1, 1, 1, 1, 1,
-0.2274628, 0.420508, 1.221294, 1, 1, 1, 1, 1,
-0.2268235, -0.8104953, -1.980547, 1, 1, 1, 1, 1,
-0.2259712, -0.4144118, -3.993571, 1, 1, 1, 1, 1,
-0.2219574, 1.384382, 0.5890636, 1, 1, 1, 1, 1,
-0.2199849, 1.362251, -0.6512129, 1, 1, 1, 1, 1,
-0.2136663, 0.5681708, -0.4272309, 1, 1, 1, 1, 1,
-0.2132742, 1.496242, -1.297246, 1, 1, 1, 1, 1,
-0.2103625, -1.18622, -3.138381, 1, 1, 1, 1, 1,
-0.2050107, -0.9025334, -1.385656, 0, 0, 1, 1, 1,
-0.2032232, 1.837661, 0.1282077, 1, 0, 0, 1, 1,
-0.2019499, 1.549677, -0.920474, 1, 0, 0, 1, 1,
-0.1997681, -1.428901, -1.917618, 1, 0, 0, 1, 1,
-0.1979375, 0.8018627, 0.5551102, 1, 0, 0, 1, 1,
-0.1934663, 0.13044, -0.7454604, 1, 0, 0, 1, 1,
-0.187808, 1.969489, -0.6797928, 0, 0, 0, 1, 1,
-0.1835614, 1.247785, 0.5662182, 0, 0, 0, 1, 1,
-0.1834107, 0.9167995, 0.9478619, 0, 0, 0, 1, 1,
-0.1831104, 0.7504424, -0.6187984, 0, 0, 0, 1, 1,
-0.1813991, 3.272741, 0.6532148, 0, 0, 0, 1, 1,
-0.1801082, 0.4175457, 0.4819952, 0, 0, 0, 1, 1,
-0.1747333, 0.06720319, -1.365909, 0, 0, 0, 1, 1,
-0.1734014, 0.1922415, -1.591681, 1, 1, 1, 1, 1,
-0.1705973, -0.9536719, -3.490533, 1, 1, 1, 1, 1,
-0.1618359, 0.8378805, -0.4151827, 1, 1, 1, 1, 1,
-0.1576127, 0.5791239, -0.1459699, 1, 1, 1, 1, 1,
-0.1554496, -1.064829, -3.767803, 1, 1, 1, 1, 1,
-0.1552137, -0.818969, -1.539984, 1, 1, 1, 1, 1,
-0.1537232, 0.44366, -0.7448623, 1, 1, 1, 1, 1,
-0.1489612, -2.046639, -4.046449, 1, 1, 1, 1, 1,
-0.1457359, 1.062777, -0.7767923, 1, 1, 1, 1, 1,
-0.14517, -0.007354907, -0.6834994, 1, 1, 1, 1, 1,
-0.1416063, 0.3497082, -0.8746628, 1, 1, 1, 1, 1,
-0.1391825, 0.9532412, 0.912581, 1, 1, 1, 1, 1,
-0.1364098, -0.122467, -1.288089, 1, 1, 1, 1, 1,
-0.133611, -0.7862485, -2.041996, 1, 1, 1, 1, 1,
-0.1329771, -0.08289599, -0.863992, 1, 1, 1, 1, 1,
-0.1318262, -0.1663104, -1.828042, 0, 0, 1, 1, 1,
-0.1270668, 1.145578, 1.418997, 1, 0, 0, 1, 1,
-0.1270416, -0.6108094, -3.634237, 1, 0, 0, 1, 1,
-0.1244004, -0.9382125, -3.00688, 1, 0, 0, 1, 1,
-0.12132, 0.1136164, -0.7224401, 1, 0, 0, 1, 1,
-0.1210409, -0.06601132, -0.9658909, 1, 0, 0, 1, 1,
-0.120468, 1.133006, -0.7515703, 0, 0, 0, 1, 1,
-0.1204517, 0.6151827, -1.187047, 0, 0, 0, 1, 1,
-0.117932, 0.9138466, 1.293122, 0, 0, 0, 1, 1,
-0.1149752, -0.02197362, -1.819253, 0, 0, 0, 1, 1,
-0.1119112, 1.645837, -1.14819, 0, 0, 0, 1, 1,
-0.1010551, 1.170656, 0.8411049, 0, 0, 0, 1, 1,
-0.1001792, 0.7476859, -1.546285, 0, 0, 0, 1, 1,
-0.09978706, -3.365298, -2.393111, 1, 1, 1, 1, 1,
-0.09443339, 3.138616, -0.645542, 1, 1, 1, 1, 1,
-0.09011455, 0.9907538, -1.325282, 1, 1, 1, 1, 1,
-0.08584392, 0.7431405, 0.3927879, 1, 1, 1, 1, 1,
-0.08520656, -0.7634563, -4.53622, 1, 1, 1, 1, 1,
-0.08388442, 1.121331, -1.799735, 1, 1, 1, 1, 1,
-0.08378632, 1.4399, 0.4195877, 1, 1, 1, 1, 1,
-0.08034881, -0.01754055, -0.9557224, 1, 1, 1, 1, 1,
-0.07872201, -0.8857908, -3.14619, 1, 1, 1, 1, 1,
-0.06928042, 0.7350179, -0.6033622, 1, 1, 1, 1, 1,
-0.06843814, -0.008363283, -2.024491, 1, 1, 1, 1, 1,
-0.06745043, 0.7524666, -1.377791, 1, 1, 1, 1, 1,
-0.06218909, 0.03173805, -2.937831, 1, 1, 1, 1, 1,
-0.06207768, 1.305024, -0.721671, 1, 1, 1, 1, 1,
-0.05707404, -0.4860099, -2.821704, 1, 1, 1, 1, 1,
-0.05634582, 0.5127128, 1.100698, 0, 0, 1, 1, 1,
-0.05521737, -0.2258113, -2.216905, 1, 0, 0, 1, 1,
-0.05079187, 0.3329217, 0.3512031, 1, 0, 0, 1, 1,
-0.05059106, 1.386564, 0.3393219, 1, 0, 0, 1, 1,
-0.05046166, 1.386069, 1.183756, 1, 0, 0, 1, 1,
-0.04875145, -1.778824, -4.364399, 1, 0, 0, 1, 1,
-0.04597162, -0.01270608, -3.363842, 0, 0, 0, 1, 1,
-0.04560595, -0.2552647, -1.058796, 0, 0, 0, 1, 1,
-0.04322749, -0.7485262, -1.905391, 0, 0, 0, 1, 1,
-0.03997144, -1.471595, -4.004704, 0, 0, 0, 1, 1,
-0.03923817, -1.416588, -3.939449, 0, 0, 0, 1, 1,
-0.03788981, 0.009023243, -1.543411, 0, 0, 0, 1, 1,
-0.03730139, -1.035761, -3.313014, 0, 0, 0, 1, 1,
-0.037058, -0.03714388, -4.105786, 1, 1, 1, 1, 1,
-0.03503604, 0.213112, 0.2760431, 1, 1, 1, 1, 1,
-0.02713554, -0.281164, -1.376523, 1, 1, 1, 1, 1,
-0.0251721, -0.05186516, -1.729287, 1, 1, 1, 1, 1,
-0.02193618, -0.1556117, -2.089665, 1, 1, 1, 1, 1,
-0.02151402, 0.3516322, -0.9908762, 1, 1, 1, 1, 1,
-0.01772554, 0.2442964, -0.5811255, 1, 1, 1, 1, 1,
-0.01665685, 0.1201635, -0.360438, 1, 1, 1, 1, 1,
-0.01606204, 0.3907865, -1.101655, 1, 1, 1, 1, 1,
-0.01570226, 1.919244, 0.2640234, 1, 1, 1, 1, 1,
-0.004242387, 0.4370261, 2.763794, 1, 1, 1, 1, 1,
-0.003774721, -0.06448616, -4.302767, 1, 1, 1, 1, 1,
0.000487958, 0.6300734, -1.514301, 1, 1, 1, 1, 1,
0.006427577, -0.5033561, 2.249539, 1, 1, 1, 1, 1,
0.006483716, -0.3830152, 3.446413, 1, 1, 1, 1, 1,
0.007908543, -0.2193987, 2.971126, 0, 0, 1, 1, 1,
0.008176214, -1.182482, 2.549909, 1, 0, 0, 1, 1,
0.009492032, -0.8843106, 3.052241, 1, 0, 0, 1, 1,
0.01166012, -0.6533714, 3.549691, 1, 0, 0, 1, 1,
0.01500618, 0.2607676, 1.685409, 1, 0, 0, 1, 1,
0.01509862, 0.9145539, 1.042214, 1, 0, 0, 1, 1,
0.01678346, -0.06061983, 2.02755, 0, 0, 0, 1, 1,
0.01841392, -0.2835124, 2.449866, 0, 0, 0, 1, 1,
0.02439619, 0.03926244, 1.026487, 0, 0, 0, 1, 1,
0.02913222, 0.3912678, -0.4377023, 0, 0, 0, 1, 1,
0.03186825, 0.5293469, 0.8116013, 0, 0, 0, 1, 1,
0.03469412, -0.8676819, 2.565419, 0, 0, 0, 1, 1,
0.03500006, 0.1995353, -0.06195438, 0, 0, 0, 1, 1,
0.04030678, 0.7852772, 0.02782806, 1, 1, 1, 1, 1,
0.04220515, 1.915786, 1.339824, 1, 1, 1, 1, 1,
0.04333656, -0.08718928, 3.592263, 1, 1, 1, 1, 1,
0.0456287, 0.01022842, 1.389316, 1, 1, 1, 1, 1,
0.04655047, -0.1264085, 2.527467, 1, 1, 1, 1, 1,
0.04763456, 1.465335, -0.06972962, 1, 1, 1, 1, 1,
0.0520798, -0.8048632, 4.037772, 1, 1, 1, 1, 1,
0.05259914, 0.7249781, -0.2232119, 1, 1, 1, 1, 1,
0.06452478, -0.8872374, 2.259459, 1, 1, 1, 1, 1,
0.06623798, 0.1671147, 0.1373458, 1, 1, 1, 1, 1,
0.06739543, 0.1277542, 1.714008, 1, 1, 1, 1, 1,
0.06857618, 0.982156, 0.6112837, 1, 1, 1, 1, 1,
0.07005668, -0.5253541, 4.208092, 1, 1, 1, 1, 1,
0.07347304, -1.708364, 2.820668, 1, 1, 1, 1, 1,
0.07388753, 1.879992, -0.04006613, 1, 1, 1, 1, 1,
0.07597809, -0.2331709, 3.548944, 0, 0, 1, 1, 1,
0.08275736, -0.07334331, 1.735651, 1, 0, 0, 1, 1,
0.08325733, 0.8819493, -1.83771, 1, 0, 0, 1, 1,
0.08335827, -1.46748, 4.582132, 1, 0, 0, 1, 1,
0.08392388, 1.034714, 0.02460511, 1, 0, 0, 1, 1,
0.08732533, -0.1374215, 4.970906, 1, 0, 0, 1, 1,
0.08789733, -0.3873715, 2.029174, 0, 0, 0, 1, 1,
0.09074257, -1.936616, 3.634115, 0, 0, 0, 1, 1,
0.09308117, 1.606904, 1.447067, 0, 0, 0, 1, 1,
0.09368555, -0.002056678, 1.28892, 0, 0, 0, 1, 1,
0.09453868, 2.082963, -0.5388103, 0, 0, 0, 1, 1,
0.09477733, 0.6679709, 0.9899266, 0, 0, 0, 1, 1,
0.09622946, 1.124223, -1.381613, 0, 0, 0, 1, 1,
0.0979679, 0.5996149, 1.04513, 1, 1, 1, 1, 1,
0.1055589, -0.7397448, 4.396394, 1, 1, 1, 1, 1,
0.1081545, 0.9892778, -0.6742482, 1, 1, 1, 1, 1,
0.1087295, 0.5370715, 0.5668902, 1, 1, 1, 1, 1,
0.1108081, 2.019696, 0.3478204, 1, 1, 1, 1, 1,
0.1125382, -1.571607, 3.374529, 1, 1, 1, 1, 1,
0.1161351, -0.7162538, 3.037369, 1, 1, 1, 1, 1,
0.1179541, -1.10912, 2.972876, 1, 1, 1, 1, 1,
0.1199489, -1.765625, 4.345984, 1, 1, 1, 1, 1,
0.1238444, -1.702803, 2.541927, 1, 1, 1, 1, 1,
0.1243469, 0.7171277, 0.7212955, 1, 1, 1, 1, 1,
0.1282505, 1.522422, 0.9737161, 1, 1, 1, 1, 1,
0.1301885, 2.300321, 0.276975, 1, 1, 1, 1, 1,
0.138643, -0.08112647, 1.365627, 1, 1, 1, 1, 1,
0.1400541, 1.737801, 0.3454135, 1, 1, 1, 1, 1,
0.1424147, 0.6636505, 0.04924414, 0, 0, 1, 1, 1,
0.1456358, 1.136621, -1.754606, 1, 0, 0, 1, 1,
0.1480209, -0.8502125, 3.451323, 1, 0, 0, 1, 1,
0.1490659, 0.9047104, 1.729303, 1, 0, 0, 1, 1,
0.1541626, 0.8218238, 0.1143254, 1, 0, 0, 1, 1,
0.1583469, 1.683803, 0.4568467, 1, 0, 0, 1, 1,
0.1601975, -1.187044, 1.792587, 0, 0, 0, 1, 1,
0.1644569, -1.421939, 4.938781, 0, 0, 0, 1, 1,
0.1661548, 0.871932, 0.2973516, 0, 0, 0, 1, 1,
0.1661808, 0.9936458, 0.9671645, 0, 0, 0, 1, 1,
0.1664139, 0.9137397, -0.6667765, 0, 0, 0, 1, 1,
0.1665241, -1.539065, 2.822463, 0, 0, 0, 1, 1,
0.1667687, -1.963148, 2.585026, 0, 0, 0, 1, 1,
0.1671703, -0.1847845, 3.103976, 1, 1, 1, 1, 1,
0.1672926, -0.07235919, 3.198884, 1, 1, 1, 1, 1,
0.1684072, 0.1718372, 1.74266, 1, 1, 1, 1, 1,
0.1689954, -1.360791, 4.35014, 1, 1, 1, 1, 1,
0.1693824, -0.3433765, 3.015876, 1, 1, 1, 1, 1,
0.1696413, -1.086795, 3.813938, 1, 1, 1, 1, 1,
0.1702642, 0.580741, 1.9544, 1, 1, 1, 1, 1,
0.1716449, 1.490975, 0.1973269, 1, 1, 1, 1, 1,
0.1749884, -1.117275, 2.890976, 1, 1, 1, 1, 1,
0.1787455, 0.008856279, 1.999449, 1, 1, 1, 1, 1,
0.1794863, -0.03748589, 0.7158522, 1, 1, 1, 1, 1,
0.1798813, 0.4386439, -1.530173, 1, 1, 1, 1, 1,
0.1801583, 0.8935914, -0.5487003, 1, 1, 1, 1, 1,
0.1810386, -0.1706801, 3.95823, 1, 1, 1, 1, 1,
0.1820269, 0.4111835, -0.7637066, 1, 1, 1, 1, 1,
0.1834289, 1.581173, 0.2697437, 0, 0, 1, 1, 1,
0.1848879, -1.430128, 2.482696, 1, 0, 0, 1, 1,
0.1871996, -0.6743376, 3.865188, 1, 0, 0, 1, 1,
0.188124, 0.09914745, 2.338231, 1, 0, 0, 1, 1,
0.1894596, 0.6435093, -0.3671747, 1, 0, 0, 1, 1,
0.1898822, -0.3291523, 5.021054, 1, 0, 0, 1, 1,
0.1988219, 1.017273, 1.287876, 0, 0, 0, 1, 1,
0.1994319, 0.9404253, 0.03317035, 0, 0, 0, 1, 1,
0.2004116, -1.241261, 3.005666, 0, 0, 0, 1, 1,
0.2009717, 0.9303078, 1.01429, 0, 0, 0, 1, 1,
0.2009777, -0.3156353, 1.494143, 0, 0, 0, 1, 1,
0.207384, 0.9948981, -0.9824125, 0, 0, 0, 1, 1,
0.2078143, 0.05155202, 1.530916, 0, 0, 0, 1, 1,
0.2084233, -0.1012995, 1.244124, 1, 1, 1, 1, 1,
0.2089787, 0.7970158, 0.2077441, 1, 1, 1, 1, 1,
0.20965, 0.2982425, 1.308335, 1, 1, 1, 1, 1,
0.2105165, -0.2824932, 3.455199, 1, 1, 1, 1, 1,
0.2119959, 0.3468595, -1.469559, 1, 1, 1, 1, 1,
0.2157376, -0.3021009, 0.982816, 1, 1, 1, 1, 1,
0.2158087, -1.805941, 5.18202, 1, 1, 1, 1, 1,
0.2163927, -1.624065, 4.058352, 1, 1, 1, 1, 1,
0.2174464, 0.2526803, 2.385979, 1, 1, 1, 1, 1,
0.2181012, 1.454496, -0.9482449, 1, 1, 1, 1, 1,
0.2195742, -0.606072, 2.002948, 1, 1, 1, 1, 1,
0.2256771, -0.293583, 3.923311, 1, 1, 1, 1, 1,
0.2266998, 0.8340843, -0.0238524, 1, 1, 1, 1, 1,
0.2306836, 1.227386, 0.8847631, 1, 1, 1, 1, 1,
0.231872, 0.380593, 1.246532, 1, 1, 1, 1, 1,
0.2343898, -1.434788, 3.402325, 0, 0, 1, 1, 1,
0.2388706, -0.9894614, 2.184471, 1, 0, 0, 1, 1,
0.2390121, 2.275412, 1.578559, 1, 0, 0, 1, 1,
0.2395921, 0.5691683, 0.8282052, 1, 0, 0, 1, 1,
0.2416202, 0.289725, 0.8221119, 1, 0, 0, 1, 1,
0.2418307, 1.250261, 1.352805, 1, 0, 0, 1, 1,
0.2440284, -0.6534632, 2.201724, 0, 0, 0, 1, 1,
0.2470343, 0.9713562, -0.3402583, 0, 0, 0, 1, 1,
0.2490628, -0.865947, 1.58217, 0, 0, 0, 1, 1,
0.249546, -0.1792525, 2.052026, 0, 0, 0, 1, 1,
0.2507041, 0.936601, -0.711504, 0, 0, 0, 1, 1,
0.2510184, -0.7816412, 3.357687, 0, 0, 0, 1, 1,
0.2556573, -0.482129, 4.272395, 0, 0, 0, 1, 1,
0.2645178, -1.622796, 2.695678, 1, 1, 1, 1, 1,
0.2659575, 0.4955902, -0.4575245, 1, 1, 1, 1, 1,
0.2661439, -1.136907, 2.433222, 1, 1, 1, 1, 1,
0.266576, 0.8631395, 0.5772952, 1, 1, 1, 1, 1,
0.2679976, -0.2683942, 2.456449, 1, 1, 1, 1, 1,
0.2802475, -0.780166, 3.648079, 1, 1, 1, 1, 1,
0.2863193, -0.7006862, 1.837219, 1, 1, 1, 1, 1,
0.2875869, 1.587901, 0.1699022, 1, 1, 1, 1, 1,
0.2892623, 0.8575175, 1.620648, 1, 1, 1, 1, 1,
0.2927063, 1.574795, -0.8296041, 1, 1, 1, 1, 1,
0.2927986, 0.3192318, 0.04669524, 1, 1, 1, 1, 1,
0.2977116, 1.235776, 0.81769, 1, 1, 1, 1, 1,
0.3018322, -1.975983, 3.88944, 1, 1, 1, 1, 1,
0.305289, 0.382608, 1.051929, 1, 1, 1, 1, 1,
0.3258115, 0.7199296, -0.4678758, 1, 1, 1, 1, 1,
0.329775, 2.089767, 0.4042632, 0, 0, 1, 1, 1,
0.3300664, -0.01837998, 0.6418331, 1, 0, 0, 1, 1,
0.3311035, -0.4475349, 2.121011, 1, 0, 0, 1, 1,
0.332296, -0.0199001, 1.962543, 1, 0, 0, 1, 1,
0.3341751, 0.0530305, 1.327799, 1, 0, 0, 1, 1,
0.3358889, 0.366321, 0.1454579, 1, 0, 0, 1, 1,
0.3408037, -0.7927105, 2.443537, 0, 0, 0, 1, 1,
0.3434239, -1.053659, 1.606385, 0, 0, 0, 1, 1,
0.343969, 0.08984821, 1.92984, 0, 0, 0, 1, 1,
0.3466948, -0.9958739, 2.858433, 0, 0, 0, 1, 1,
0.3490257, 0.06931782, 0.1589684, 0, 0, 0, 1, 1,
0.3504977, 0.7558631, 1.291818, 0, 0, 0, 1, 1,
0.3520406, 0.3813078, 0.1152361, 0, 0, 0, 1, 1,
0.3542295, 0.9836371, -1.226618, 1, 1, 1, 1, 1,
0.3549012, -0.4039697, 4.137175, 1, 1, 1, 1, 1,
0.3582701, 0.7154859, 0.6120362, 1, 1, 1, 1, 1,
0.358354, -1.125587, 2.595691, 1, 1, 1, 1, 1,
0.3592355, -0.05832143, 2.781409, 1, 1, 1, 1, 1,
0.3630694, -0.7874779, 2.574844, 1, 1, 1, 1, 1,
0.3653847, -0.3938999, 2.299981, 1, 1, 1, 1, 1,
0.3657859, 1.30625, 1.013815, 1, 1, 1, 1, 1,
0.3676223, 0.5457752, -0.3302692, 1, 1, 1, 1, 1,
0.3708635, 0.8425621, 0.7103845, 1, 1, 1, 1, 1,
0.3727148, -1.704113, 3.223902, 1, 1, 1, 1, 1,
0.3925635, 0.3712795, 0.9485714, 1, 1, 1, 1, 1,
0.3983922, 1.655991, 1.161005, 1, 1, 1, 1, 1,
0.4024956, -1.023155, 1.249705, 1, 1, 1, 1, 1,
0.4044204, -0.4760995, 1.728276, 1, 1, 1, 1, 1,
0.4045176, 0.5816143, 0.382038, 0, 0, 1, 1, 1,
0.4097231, -0.2520182, 2.280115, 1, 0, 0, 1, 1,
0.4119749, -0.3724015, 2.508925, 1, 0, 0, 1, 1,
0.4133185, -1.017941, 2.008377, 1, 0, 0, 1, 1,
0.4162516, -0.7194723, 3.712093, 1, 0, 0, 1, 1,
0.4205198, 0.8675169, 1.121328, 1, 0, 0, 1, 1,
0.4207323, 1.451122, -1.511452, 0, 0, 0, 1, 1,
0.4208494, -0.2138227, 2.416198, 0, 0, 0, 1, 1,
0.4251637, -0.6535952, 3.269742, 0, 0, 0, 1, 1,
0.4268384, 2.233802, -0.6211854, 0, 0, 0, 1, 1,
0.4322426, 0.6944878, -0.02200939, 0, 0, 0, 1, 1,
0.4326728, -0.5878036, 2.173473, 0, 0, 0, 1, 1,
0.4351607, -1.424085, 2.384977, 0, 0, 0, 1, 1,
0.4392423, -0.08553003, 2.491535, 1, 1, 1, 1, 1,
0.439357, 0.966207, -0.8434162, 1, 1, 1, 1, 1,
0.4398372, -1.195402, 2.838074, 1, 1, 1, 1, 1,
0.4430348, -0.4871429, 1.117847, 1, 1, 1, 1, 1,
0.4443593, 0.2537883, 1.303744, 1, 1, 1, 1, 1,
0.4498316, -2.306506, 3.873444, 1, 1, 1, 1, 1,
0.4502677, 0.8520609, -0.4398052, 1, 1, 1, 1, 1,
0.4535231, -0.02935569, 1.800866, 1, 1, 1, 1, 1,
0.4589127, -0.2682131, 0.02844766, 1, 1, 1, 1, 1,
0.4634832, -0.7515948, 1.342977, 1, 1, 1, 1, 1,
0.4652219, -0.8099571, 3.536174, 1, 1, 1, 1, 1,
0.4706517, 0.03337821, 0.5863163, 1, 1, 1, 1, 1,
0.4764573, -0.2469271, 4.024596, 1, 1, 1, 1, 1,
0.47965, -0.05078287, 0.7632238, 1, 1, 1, 1, 1,
0.4804022, 0.1795089, 2.287753, 1, 1, 1, 1, 1,
0.4812196, -0.442101, 1.304008, 0, 0, 1, 1, 1,
0.4837213, 0.2543396, 1.136217, 1, 0, 0, 1, 1,
0.4891644, -0.5784766, 3.180933, 1, 0, 0, 1, 1,
0.4917542, 0.3909437, 0.009776016, 1, 0, 0, 1, 1,
0.4969836, -0.1099528, 0.1873992, 1, 0, 0, 1, 1,
0.5009185, -0.2135642, 2.809099, 1, 0, 0, 1, 1,
0.5043479, -0.405949, 0.6655101, 0, 0, 0, 1, 1,
0.5050563, -1.125057, 0.2664556, 0, 0, 0, 1, 1,
0.5093804, -0.4561206, 3.644921, 0, 0, 0, 1, 1,
0.510119, 1.441892, 0.543748, 0, 0, 0, 1, 1,
0.5103208, 0.5274864, 0.5947624, 0, 0, 0, 1, 1,
0.5139912, -1.146679, 2.347294, 0, 0, 0, 1, 1,
0.5181114, -0.4984714, 3.581414, 0, 0, 0, 1, 1,
0.5222222, 0.7812423, 0.8602116, 1, 1, 1, 1, 1,
0.5266054, 0.1340175, 0.3106136, 1, 1, 1, 1, 1,
0.5448865, 0.1949045, 2.736198, 1, 1, 1, 1, 1,
0.546214, -1.044931, 2.321726, 1, 1, 1, 1, 1,
0.5497416, -0.5821854, 2.485301, 1, 1, 1, 1, 1,
0.5515475, 0.1750065, 1.199906, 1, 1, 1, 1, 1,
0.5553378, 0.5467818, 1.301458, 1, 1, 1, 1, 1,
0.555635, -0.9175612, 4.252057, 1, 1, 1, 1, 1,
0.5560815, 2.104244, -0.5494473, 1, 1, 1, 1, 1,
0.5571126, 0.5708699, -0.5353302, 1, 1, 1, 1, 1,
0.5601862, -1.5209, 4.276315, 1, 1, 1, 1, 1,
0.5634609, -0.4654231, 1.913946, 1, 1, 1, 1, 1,
0.5658301, 0.1641685, 0.7432424, 1, 1, 1, 1, 1,
0.5677131, -1.091849, 4.240505, 1, 1, 1, 1, 1,
0.5689408, 0.05192673, -1.630098, 1, 1, 1, 1, 1,
0.5691429, -0.4780219, 1.337565, 0, 0, 1, 1, 1,
0.5821466, -1.345115, 2.756159, 1, 0, 0, 1, 1,
0.5907166, -0.6914281, 0.641039, 1, 0, 0, 1, 1,
0.6000158, 0.4694505, 1.032967, 1, 0, 0, 1, 1,
0.6013587, -0.2675182, 2.548136, 1, 0, 0, 1, 1,
0.6035442, -0.9289679, 1.62183, 1, 0, 0, 1, 1,
0.6050414, 1.72675, 1.161243, 0, 0, 0, 1, 1,
0.6105427, -0.4310179, 0.9247971, 0, 0, 0, 1, 1,
0.616836, -0.7509698, 3.641875, 0, 0, 0, 1, 1,
0.6188104, -0.6423746, 2.871835, 0, 0, 0, 1, 1,
0.6273299, 0.2152813, -0.3349887, 0, 0, 0, 1, 1,
0.6302695, -0.5192048, 1.514589, 0, 0, 0, 1, 1,
0.6339071, -1.064259, 3.10214, 0, 0, 0, 1, 1,
0.6375049, 0.02253996, -0.4155605, 1, 1, 1, 1, 1,
0.6392666, 0.4354994, -0.6233091, 1, 1, 1, 1, 1,
0.6432725, -1.72115, 3.005505, 1, 1, 1, 1, 1,
0.6434996, 0.5384487, -0.3418356, 1, 1, 1, 1, 1,
0.6484952, 1.34792, 0.3540438, 1, 1, 1, 1, 1,
0.6575978, -1.367895, 2.689682, 1, 1, 1, 1, 1,
0.6622982, -0.9562024, 0.7513009, 1, 1, 1, 1, 1,
0.6655949, 0.2628157, 1.309846, 1, 1, 1, 1, 1,
0.6660509, 0.6015467, 0.5271401, 1, 1, 1, 1, 1,
0.6788124, -0.9069099, 1.809869, 1, 1, 1, 1, 1,
0.6809244, -0.3861454, 1.502222, 1, 1, 1, 1, 1,
0.6820551, -1.24475, 3.203901, 1, 1, 1, 1, 1,
0.6899624, 1.010735, -0.5505254, 1, 1, 1, 1, 1,
0.6989541, -0.5952157, 1.54155, 1, 1, 1, 1, 1,
0.7047147, 0.6744751, 1.643264, 1, 1, 1, 1, 1,
0.706232, 0.5462164, 1.639938, 0, 0, 1, 1, 1,
0.7066414, -1.203585, 2.823578, 1, 0, 0, 1, 1,
0.7102245, 1.210574, 1.909507, 1, 0, 0, 1, 1,
0.7114026, 0.4106063, 0.2759929, 1, 0, 0, 1, 1,
0.7128652, 2.198598, -0.3446586, 1, 0, 0, 1, 1,
0.7129967, -0.6756096, 2.462595, 1, 0, 0, 1, 1,
0.7132058, 0.8032484, 0.6771378, 0, 0, 0, 1, 1,
0.7175507, -0.8287217, 1.494613, 0, 0, 0, 1, 1,
0.717941, 0.05168569, 1.828882, 0, 0, 0, 1, 1,
0.7363638, 0.3661892, 2.398735, 0, 0, 0, 1, 1,
0.7384806, -0.0165924, 1.044107, 0, 0, 0, 1, 1,
0.7419652, 1.047153, -0.09963084, 0, 0, 0, 1, 1,
0.7445735, -0.5222725, 2.550812, 0, 0, 0, 1, 1,
0.7463028, 0.3438387, 1.552757, 1, 1, 1, 1, 1,
0.7517819, 1.492394, -0.6987259, 1, 1, 1, 1, 1,
0.7601401, 1.469689, 1.41545, 1, 1, 1, 1, 1,
0.7661961, 0.3776094, 2.025949, 1, 1, 1, 1, 1,
0.7691575, 0.770571, 1.149711, 1, 1, 1, 1, 1,
0.769941, 0.9718292, 1.348689, 1, 1, 1, 1, 1,
0.7715727, 0.2118364, 2.663895, 1, 1, 1, 1, 1,
0.7771086, -2.583787, 1.931329, 1, 1, 1, 1, 1,
0.7834873, -0.1175173, 0.7742385, 1, 1, 1, 1, 1,
0.7963023, 0.3035294, 1.223906, 1, 1, 1, 1, 1,
0.7971705, 0.07020788, 1.017822, 1, 1, 1, 1, 1,
0.8043247, -0.2547749, 2.158055, 1, 1, 1, 1, 1,
0.8047677, -1.326363, 3.667861, 1, 1, 1, 1, 1,
0.8067204, -1.029948, 1.744586, 1, 1, 1, 1, 1,
0.808497, 0.1375175, 0.2128313, 1, 1, 1, 1, 1,
0.8093626, 0.382871, 1.26797, 0, 0, 1, 1, 1,
0.8099756, -0.04419894, 1.73176, 1, 0, 0, 1, 1,
0.8143272, 0.2208977, 3.126822, 1, 0, 0, 1, 1,
0.817427, 0.8595423, 1.267077, 1, 0, 0, 1, 1,
0.8196872, 0.7578487, 1.661622, 1, 0, 0, 1, 1,
0.81996, 3.422099, 1.748709, 1, 0, 0, 1, 1,
0.8262213, -0.951546, 2.121995, 0, 0, 0, 1, 1,
0.8282241, -0.076461, 1.033338, 0, 0, 0, 1, 1,
0.8347587, 0.9322767, 1.288277, 0, 0, 0, 1, 1,
0.8368908, 0.4906997, 1.18473, 0, 0, 0, 1, 1,
0.8371034, -0.01420503, -0.01133364, 0, 0, 0, 1, 1,
0.8418022, 0.366093, 2.438479, 0, 0, 0, 1, 1,
0.8431399, -1.154712, -0.5069638, 0, 0, 0, 1, 1,
0.8526151, -0.3381505, 0.3411142, 1, 1, 1, 1, 1,
0.8565474, 0.8331198, 1.206796, 1, 1, 1, 1, 1,
0.8611329, 1.601985, 2.353775, 1, 1, 1, 1, 1,
0.8672694, 0.8901912, 1.493792, 1, 1, 1, 1, 1,
0.8674228, 0.4158878, 2.366114, 1, 1, 1, 1, 1,
0.8691549, 0.1987786, 2.814782, 1, 1, 1, 1, 1,
0.8718564, -0.1928102, 0.1109759, 1, 1, 1, 1, 1,
0.877152, -0.8360763, 2.513653, 1, 1, 1, 1, 1,
0.8775274, -1.499814, 3.05006, 1, 1, 1, 1, 1,
0.8807893, 0.781445, -0.1950424, 1, 1, 1, 1, 1,
0.8829793, -0.2131277, 1.310597, 1, 1, 1, 1, 1,
0.8848726, 0.001455956, 2.401124, 1, 1, 1, 1, 1,
0.8852153, -1.24529, 0.863364, 1, 1, 1, 1, 1,
0.8866781, 0.9067382, 1.068469, 1, 1, 1, 1, 1,
0.886976, 1.617947, 0.5806651, 1, 1, 1, 1, 1,
0.8970365, 0.2436647, 1.794547, 0, 0, 1, 1, 1,
0.9133268, 1.568504, 2.777457, 1, 0, 0, 1, 1,
0.9286066, 0.695483, 1.125982, 1, 0, 0, 1, 1,
0.9298997, 0.7759278, 0.2683976, 1, 0, 0, 1, 1,
0.9329837, 0.5650894, 0.6094888, 1, 0, 0, 1, 1,
0.9340778, 0.5890189, 2.081764, 1, 0, 0, 1, 1,
0.9345073, -2.384916, 3.439893, 0, 0, 0, 1, 1,
0.9347823, 1.531725, 1.328155, 0, 0, 0, 1, 1,
0.9382564, -0.03966101, 1.355466, 0, 0, 0, 1, 1,
0.9417704, -0.7203475, 1.077585, 0, 0, 0, 1, 1,
0.9441221, -1.871513, 2.258107, 0, 0, 0, 1, 1,
0.9470943, 0.3618585, 0.006965515, 0, 0, 0, 1, 1,
0.947777, 0.2781519, 2.169697, 0, 0, 0, 1, 1,
0.9508895, -1.139398, 2.965983, 1, 1, 1, 1, 1,
0.9570661, -0.2852523, 1.963451, 1, 1, 1, 1, 1,
0.9623109, -0.4268435, 2.13785, 1, 1, 1, 1, 1,
0.9664824, 0.5164151, 0.4909584, 1, 1, 1, 1, 1,
0.9719278, 0.5447935, 1.205922, 1, 1, 1, 1, 1,
0.9741309, 1.042857, 1.74127, 1, 1, 1, 1, 1,
0.9776217, -0.476558, -0.3594104, 1, 1, 1, 1, 1,
0.9863359, -0.2466146, 2.284874, 1, 1, 1, 1, 1,
0.9910701, -0.3671248, 0.1801669, 1, 1, 1, 1, 1,
0.9919214, 0.3389726, 1.398897, 1, 1, 1, 1, 1,
0.9931373, 0.1915317, 3.247207, 1, 1, 1, 1, 1,
0.9961744, -0.9490113, 3.266811, 1, 1, 1, 1, 1,
0.9962285, 1.512592, 1.852597, 1, 1, 1, 1, 1,
1.001107, -0.7563612, 1.257452, 1, 1, 1, 1, 1,
1.001405, -0.122575, 1.465036, 1, 1, 1, 1, 1,
1.003824, -0.1435596, 2.316177, 0, 0, 1, 1, 1,
1.006523, -0.6610926, 2.199034, 1, 0, 0, 1, 1,
1.008871, -0.6066773, 3.345005, 1, 0, 0, 1, 1,
1.008994, -1.059462, 2.244351, 1, 0, 0, 1, 1,
1.014173, 0.919527, 1.369663, 1, 0, 0, 1, 1,
1.015698, 0.03653027, 2.100539, 1, 0, 0, 1, 1,
1.027549, 1.367154, 1.489923, 0, 0, 0, 1, 1,
1.027982, -0.3603217, 3.085294, 0, 0, 0, 1, 1,
1.028791, 0.754878, -0.0141518, 0, 0, 0, 1, 1,
1.038759, 1.346487, -0.08770183, 0, 0, 0, 1, 1,
1.04134, -0.4989458, 0.3399748, 0, 0, 0, 1, 1,
1.041817, -0.9765146, 2.241464, 0, 0, 0, 1, 1,
1.046426, 0.8594569, 1.148025, 0, 0, 0, 1, 1,
1.050874, -1.368854, 1.901382, 1, 1, 1, 1, 1,
1.058389, 1.692547, 1.593613, 1, 1, 1, 1, 1,
1.059271, -1.021072, 2.462702, 1, 1, 1, 1, 1,
1.060054, 0.2867516, 1.088376, 1, 1, 1, 1, 1,
1.062588, -0.4390506, 1.10886, 1, 1, 1, 1, 1,
1.068848, -0.7814645, 0.9070897, 1, 1, 1, 1, 1,
1.071489, 0.09473722, 0.8149266, 1, 1, 1, 1, 1,
1.081509, -0.2058076, 1.214962, 1, 1, 1, 1, 1,
1.08854, -0.03293642, 1.492652, 1, 1, 1, 1, 1,
1.090472, 1.903601, 0.3106189, 1, 1, 1, 1, 1,
1.094345, -0.05682756, 1.690831, 1, 1, 1, 1, 1,
1.106116, -1.041645, 2.677207, 1, 1, 1, 1, 1,
1.111613, -0.1565539, 1.484468, 1, 1, 1, 1, 1,
1.112029, -0.2541079, 0.004089611, 1, 1, 1, 1, 1,
1.119123, 0.07665182, -0.3660411, 1, 1, 1, 1, 1,
1.120243, 0.9630058, 1.063895, 0, 0, 1, 1, 1,
1.12246, -0.9235785, 1.836779, 1, 0, 0, 1, 1,
1.123755, 0.6931052, 0.5764151, 1, 0, 0, 1, 1,
1.124119, -1.736197, 2.728346, 1, 0, 0, 1, 1,
1.126317, 1.240482, 0.06581528, 1, 0, 0, 1, 1,
1.127431, 1.365844, 0.7447817, 1, 0, 0, 1, 1,
1.129426, 0.5650918, 0.5536649, 0, 0, 0, 1, 1,
1.130297, 0.4999876, 0.553429, 0, 0, 0, 1, 1,
1.131816, 1.860461, 1.541684, 0, 0, 0, 1, 1,
1.141493, 0.7159374, 1.177197, 0, 0, 0, 1, 1,
1.146085, 0.1365042, 0.9397961, 0, 0, 0, 1, 1,
1.147402, -0.6244113, 1.920505, 0, 0, 0, 1, 1,
1.148422, -0.9470431, 2.566462, 0, 0, 0, 1, 1,
1.151279, -0.1150306, 0.169295, 1, 1, 1, 1, 1,
1.153656, 1.457749, 2.484377, 1, 1, 1, 1, 1,
1.166831, 0.574698, 0.8814235, 1, 1, 1, 1, 1,
1.179326, 0.4405265, 1.174896, 1, 1, 1, 1, 1,
1.179336, 1.430419, -0.6507723, 1, 1, 1, 1, 1,
1.184912, -1.09754, 2.491641, 1, 1, 1, 1, 1,
1.202179, 1.790388, 1.483868, 1, 1, 1, 1, 1,
1.207395, 0.8486627, 0.6000328, 1, 1, 1, 1, 1,
1.212343, -0.5283182, 2.34116, 1, 1, 1, 1, 1,
1.215312, 0.5064561, 2.2959, 1, 1, 1, 1, 1,
1.217829, -0.6904724, 1.498099, 1, 1, 1, 1, 1,
1.218568, 0.9461761, 1.210471, 1, 1, 1, 1, 1,
1.225592, 0.3990923, 2.307861, 1, 1, 1, 1, 1,
1.227398, -0.4330445, 3.033467, 1, 1, 1, 1, 1,
1.236897, 0.6560681, -0.3911159, 1, 1, 1, 1, 1,
1.249304, 0.9671015, 1.476303, 0, 0, 1, 1, 1,
1.254171, 0.4530727, 2.055511, 1, 0, 0, 1, 1,
1.261889, -0.3150673, 0.8848849, 1, 0, 0, 1, 1,
1.26568, 1.051112, 0.6096148, 1, 0, 0, 1, 1,
1.267785, 0.273643, 1.395859, 1, 0, 0, 1, 1,
1.273644, 0.8753541, 2.58551, 1, 0, 0, 1, 1,
1.274406, -0.7998474, 2.744797, 0, 0, 0, 1, 1,
1.275763, 1.468417, 0.04139527, 0, 0, 0, 1, 1,
1.279896, -0.6483927, 0.3405715, 0, 0, 0, 1, 1,
1.285788, -0.2634768, 2.088834, 0, 0, 0, 1, 1,
1.288151, -0.237106, 2.329446, 0, 0, 0, 1, 1,
1.296751, -0.6341017, 1.501702, 0, 0, 0, 1, 1,
1.307601, -0.09420986, 0.4567776, 0, 0, 0, 1, 1,
1.318762, -0.5308743, 0.9050874, 1, 1, 1, 1, 1,
1.320268, 0.3444088, -1.948117, 1, 1, 1, 1, 1,
1.327083, 0.871796, 0.09836306, 1, 1, 1, 1, 1,
1.331749, 1.256844, 1.226659, 1, 1, 1, 1, 1,
1.33655, -1.147087, 4.34831, 1, 1, 1, 1, 1,
1.336872, -0.7130903, 0.9773148, 1, 1, 1, 1, 1,
1.344959, -0.530356, 0.01337554, 1, 1, 1, 1, 1,
1.355713, 0.953416, 2.18693, 1, 1, 1, 1, 1,
1.369136, -0.3403501, 1.644112, 1, 1, 1, 1, 1,
1.385175, -1.232384, 2.404871, 1, 1, 1, 1, 1,
1.391137, 0.1458594, 2.760685, 1, 1, 1, 1, 1,
1.392197, -0.9534854, 1.42034, 1, 1, 1, 1, 1,
1.392823, 1.48669, 1.693773, 1, 1, 1, 1, 1,
1.39423, 1.55029, -0.2411423, 1, 1, 1, 1, 1,
1.401201, 0.8302839, 0.6340037, 1, 1, 1, 1, 1,
1.402748, 0.4733581, 0.5468715, 0, 0, 1, 1, 1,
1.406361, -0.1281866, 0.2939312, 1, 0, 0, 1, 1,
1.407992, -0.07334027, 2.588336, 1, 0, 0, 1, 1,
1.429574, 2.346554, -0.5726875, 1, 0, 0, 1, 1,
1.430613, -0.07781739, 1.820375, 1, 0, 0, 1, 1,
1.431575, 0.9585288, 0.7621869, 1, 0, 0, 1, 1,
1.432375, -0.8262287, 0.4022254, 0, 0, 0, 1, 1,
1.433879, 0.909569, 0.7424299, 0, 0, 0, 1, 1,
1.434635, -0.3666947, 2.152328, 0, 0, 0, 1, 1,
1.438501, -0.04315075, 2.19691, 0, 0, 0, 1, 1,
1.439203, 0.222258, 2.991724, 0, 0, 0, 1, 1,
1.44887, 2.185236, -0.4988908, 0, 0, 0, 1, 1,
1.460235, -1.910467, 2.944595, 0, 0, 0, 1, 1,
1.460257, -0.284418, 1.349971, 1, 1, 1, 1, 1,
1.46677, 0.9436893, 1.064081, 1, 1, 1, 1, 1,
1.47179, -1.046029, 3.758375, 1, 1, 1, 1, 1,
1.475847, -0.2579453, 1.786217, 1, 1, 1, 1, 1,
1.480314, 2.4995, 2.544716, 1, 1, 1, 1, 1,
1.492342, 1.270778, 0.3184475, 1, 1, 1, 1, 1,
1.49885, 0.2354795, 2.179996, 1, 1, 1, 1, 1,
1.504452, -0.9660261, 1.033891, 1, 1, 1, 1, 1,
1.505384, 0.7342007, 1.173676, 1, 1, 1, 1, 1,
1.527498, -0.2272889, 1.872419, 1, 1, 1, 1, 1,
1.529239, 0.4427533, -0.4760561, 1, 1, 1, 1, 1,
1.536587, 0.6450803, 1.407453, 1, 1, 1, 1, 1,
1.551591, -0.2743742, 0.8805956, 1, 1, 1, 1, 1,
1.558819, 1.591018, 0.1053728, 1, 1, 1, 1, 1,
1.560902, -1.736334, 2.275239, 1, 1, 1, 1, 1,
1.570818, 1.322489, -0.07119121, 0, 0, 1, 1, 1,
1.587151, 0.2598523, 2.309695, 1, 0, 0, 1, 1,
1.587629, 0.4681051, 0.511281, 1, 0, 0, 1, 1,
1.588895, -1.288447, 2.846461, 1, 0, 0, 1, 1,
1.591524, -1.645129, 2.900879, 1, 0, 0, 1, 1,
1.600588, -0.3528066, 1.831137, 1, 0, 0, 1, 1,
1.623385, -0.3966888, 3.126961, 0, 0, 0, 1, 1,
1.648864, -0.2900805, 0.6025153, 0, 0, 0, 1, 1,
1.649153, 0.31811, 1.505654, 0, 0, 0, 1, 1,
1.671655, 1.38174, 1.170606, 0, 0, 0, 1, 1,
1.677421, -0.6259305, 1.552922, 0, 0, 0, 1, 1,
1.714848, -2.141868, 3.914396, 0, 0, 0, 1, 1,
1.738929, 0.6987674, 2.717842, 0, 0, 0, 1, 1,
1.741137, 0.1715455, 1.614436, 1, 1, 1, 1, 1,
1.768468, -0.1613911, 1.322778, 1, 1, 1, 1, 1,
1.776463, 0.8744883, 1.010574, 1, 1, 1, 1, 1,
1.785915, 0.5840199, 2.632181, 1, 1, 1, 1, 1,
1.794637, 0.9703174, 1.742491, 1, 1, 1, 1, 1,
1.811927, 2.319476, 0.5603787, 1, 1, 1, 1, 1,
1.820984, 1.208532, 0.5977932, 1, 1, 1, 1, 1,
1.826569, 0.2294588, 0.4285178, 1, 1, 1, 1, 1,
1.835009, -0.6802073, 2.968908, 1, 1, 1, 1, 1,
1.85679, -0.347978, 2.668129, 1, 1, 1, 1, 1,
1.901543, -0.1088917, 3.046275, 1, 1, 1, 1, 1,
1.913504, 1.953525, 0.01563107, 1, 1, 1, 1, 1,
1.918393, -0.1820612, 2.955393, 1, 1, 1, 1, 1,
1.931579, -2.149714, 3.493169, 1, 1, 1, 1, 1,
1.943618, -1.156831, 2.219446, 1, 1, 1, 1, 1,
1.959908, -0.3125458, 1.242706, 0, 0, 1, 1, 1,
1.971816, 1.527686, 0.3049184, 1, 0, 0, 1, 1,
2.03066, 0.08428492, 1.857198, 1, 0, 0, 1, 1,
2.056251, 0.07596967, 0.4533433, 1, 0, 0, 1, 1,
2.09696, -2.726446, 0.3062121, 1, 0, 0, 1, 1,
2.102829, -0.6579106, 0.6050017, 1, 0, 0, 1, 1,
2.114789, 0.2352282, 1.473445, 0, 0, 0, 1, 1,
2.131629, 0.809136, 2.312375, 0, 0, 0, 1, 1,
2.134619, -0.2026881, 3.469164, 0, 0, 0, 1, 1,
2.172781, -0.4718097, 0.284598, 0, 0, 0, 1, 1,
2.208279, 0.2397283, 1.114953, 0, 0, 0, 1, 1,
2.212683, -1.291528, 2.681617, 0, 0, 0, 1, 1,
2.242842, 1.72961, 0.6376899, 0, 0, 0, 1, 1,
2.267926, -0.8396183, 2.312703, 1, 1, 1, 1, 1,
2.332324, -0.9600857, 1.082571, 1, 1, 1, 1, 1,
2.338645, 0.6041563, 0.23354, 1, 1, 1, 1, 1,
2.381506, 0.8055865, 2.140081, 1, 1, 1, 1, 1,
2.41039, 0.9527049, 3.564184, 1, 1, 1, 1, 1,
2.543487, 0.3920273, 1.78652, 1, 1, 1, 1, 1,
2.919122, -1.485978, 3.431315, 1, 1, 1, 1, 1
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
var radius = 9.309883;
var distance = 32.70057;
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
mvMatrix.translate( 0.110665, -0.02840066, -0.174727 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.70057);
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
