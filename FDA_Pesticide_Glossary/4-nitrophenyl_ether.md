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
-3.337591, -1.995312, -1.951865, 1, 0, 0, 1,
-3.110539, 0.4225788, -0.5493707, 1, 0.007843138, 0, 1,
-2.864636, -0.6509733, -2.907866, 1, 0.01176471, 0, 1,
-2.742332, 1.239499, -0.6405489, 1, 0.01960784, 0, 1,
-2.46017, -0.6987665, -2.344413, 1, 0.02352941, 0, 1,
-2.427667, 0.3916847, -3.644734, 1, 0.03137255, 0, 1,
-2.290256, -0.5042351, -1.11763, 1, 0.03529412, 0, 1,
-2.265972, -1.78891, -1.228185, 1, 0.04313726, 0, 1,
-2.170522, 0.7183596, 0.5955465, 1, 0.04705882, 0, 1,
-2.157853, -0.2784257, -1.810734, 1, 0.05490196, 0, 1,
-2.084979, -0.4934088, -0.9364633, 1, 0.05882353, 0, 1,
-2.055476, 0.9067275, -2.110561, 1, 0.06666667, 0, 1,
-2.02546, -0.8512778, -3.381907, 1, 0.07058824, 0, 1,
-1.991269, -0.2902146, -0.7858671, 1, 0.07843138, 0, 1,
-1.99008, 0.4804542, -0.8016855, 1, 0.08235294, 0, 1,
-1.954227, -0.5132173, -0.9330658, 1, 0.09019608, 0, 1,
-1.943187, -0.44512, -2.501508, 1, 0.09411765, 0, 1,
-1.941407, 0.05272773, -1.624999, 1, 0.1019608, 0, 1,
-1.930742, -0.6698903, -1.346713, 1, 0.1098039, 0, 1,
-1.928416, 0.2850626, -1.691797, 1, 0.1137255, 0, 1,
-1.912685, -2.052934, -2.121333, 1, 0.1215686, 0, 1,
-1.907682, 0.8206854, -0.9031152, 1, 0.1254902, 0, 1,
-1.907547, 2.002974, -0.5629291, 1, 0.1333333, 0, 1,
-1.898063, -1.878338, -5.017219, 1, 0.1372549, 0, 1,
-1.885088, -0.1191093, -0.9867095, 1, 0.145098, 0, 1,
-1.869864, 0.2134424, -1.566026, 1, 0.1490196, 0, 1,
-1.864357, -1.583301, -3.257209, 1, 0.1568628, 0, 1,
-1.859625, -0.8094718, -0.5504525, 1, 0.1607843, 0, 1,
-1.853453, -0.3551963, -0.8829546, 1, 0.1686275, 0, 1,
-1.832238, 1.026103, -1.809312, 1, 0.172549, 0, 1,
-1.826962, 1.91766, -0.7251367, 1, 0.1803922, 0, 1,
-1.810295, -0.308698, -2.934036, 1, 0.1843137, 0, 1,
-1.792331, 0.2470433, -0.8640516, 1, 0.1921569, 0, 1,
-1.790561, 0.8515035, -0.9046495, 1, 0.1960784, 0, 1,
-1.784974, 0.7252824, -0.6061641, 1, 0.2039216, 0, 1,
-1.758718, 0.4637324, -2.821373, 1, 0.2117647, 0, 1,
-1.757143, 1.220591, -0.6609432, 1, 0.2156863, 0, 1,
-1.735044, -0.2171041, -2.242116, 1, 0.2235294, 0, 1,
-1.732405, -0.773917, -2.236023, 1, 0.227451, 0, 1,
-1.725773, -0.9379243, -1.852183, 1, 0.2352941, 0, 1,
-1.712237, 0.2547548, -0.08522996, 1, 0.2392157, 0, 1,
-1.698375, 0.3909467, -1.480452, 1, 0.2470588, 0, 1,
-1.697066, 0.950007, -1.358834, 1, 0.2509804, 0, 1,
-1.689476, -0.2396408, -1.144689, 1, 0.2588235, 0, 1,
-1.655337, 0.234207, -3.044518, 1, 0.2627451, 0, 1,
-1.651185, -1.390999, -3.001546, 1, 0.2705882, 0, 1,
-1.632809, -0.6481294, 0.1335321, 1, 0.2745098, 0, 1,
-1.628174, 1.982936, -1.244145, 1, 0.282353, 0, 1,
-1.622887, -0.03399016, -0.3443579, 1, 0.2862745, 0, 1,
-1.572747, 0.3334729, 0.09898369, 1, 0.2941177, 0, 1,
-1.564881, 0.8191049, -1.263978, 1, 0.3019608, 0, 1,
-1.556292, 1.394258, -0.1022342, 1, 0.3058824, 0, 1,
-1.53384, -0.3895411, 0.05898815, 1, 0.3137255, 0, 1,
-1.525646, -0.3659585, -3.227099, 1, 0.3176471, 0, 1,
-1.515287, -1.291601, -2.391897, 1, 0.3254902, 0, 1,
-1.512595, 0.841916, -2.374372, 1, 0.3294118, 0, 1,
-1.486208, 1.390014, -0.5021492, 1, 0.3372549, 0, 1,
-1.474801, 0.07623342, 0.9174709, 1, 0.3411765, 0, 1,
-1.466228, 0.6939608, -2.32898, 1, 0.3490196, 0, 1,
-1.452198, 0.3849137, -3.783198, 1, 0.3529412, 0, 1,
-1.449109, -0.5267103, -2.210748, 1, 0.3607843, 0, 1,
-1.444689, 0.1532034, -1.828709, 1, 0.3647059, 0, 1,
-1.442225, -0.8586279, -1.441975, 1, 0.372549, 0, 1,
-1.42697, 1.143243, -0.2819703, 1, 0.3764706, 0, 1,
-1.419093, -0.7183447, -1.762729, 1, 0.3843137, 0, 1,
-1.418796, 1.520566, 0.6205258, 1, 0.3882353, 0, 1,
-1.40839, 0.3804863, -1.840454, 1, 0.3960784, 0, 1,
-1.406602, 1.215527, 0.1519192, 1, 0.4039216, 0, 1,
-1.396009, 0.4699625, -2.710876, 1, 0.4078431, 0, 1,
-1.394366, 1.865574, -0.4823802, 1, 0.4156863, 0, 1,
-1.393937, -0.5995587, -0.1351941, 1, 0.4196078, 0, 1,
-1.387994, 0.9863827, -0.9554217, 1, 0.427451, 0, 1,
-1.382987, -0.03326306, -1.36735, 1, 0.4313726, 0, 1,
-1.370188, 1.466797, 0.1530488, 1, 0.4392157, 0, 1,
-1.35512, -1.469342, -2.778735, 1, 0.4431373, 0, 1,
-1.34478, -1.863666, -0.7969498, 1, 0.4509804, 0, 1,
-1.342549, 1.119469, 0.6298601, 1, 0.454902, 0, 1,
-1.336164, -1.603927, -3.675793, 1, 0.4627451, 0, 1,
-1.333962, 0.2217312, -1.000322, 1, 0.4666667, 0, 1,
-1.333574, -0.8205461, -1.584013, 1, 0.4745098, 0, 1,
-1.329361, 0.376395, -2.250742, 1, 0.4784314, 0, 1,
-1.328856, -0.9107848, -3.085015, 1, 0.4862745, 0, 1,
-1.324288, -0.3268467, -1.897997, 1, 0.4901961, 0, 1,
-1.32148, 0.5260677, -3.045317, 1, 0.4980392, 0, 1,
-1.316824, -0.8178633, -2.95652, 1, 0.5058824, 0, 1,
-1.301309, -1.504687, -2.540192, 1, 0.509804, 0, 1,
-1.299115, 0.03879276, -2.087752, 1, 0.5176471, 0, 1,
-1.290244, 1.920321, -1.385276, 1, 0.5215687, 0, 1,
-1.280723, -1.110911, -0.5796456, 1, 0.5294118, 0, 1,
-1.270535, -0.2162715, -1.754291, 1, 0.5333334, 0, 1,
-1.270285, 0.09320464, -2.100556, 1, 0.5411765, 0, 1,
-1.266337, 0.2370663, -1.723774, 1, 0.5450981, 0, 1,
-1.266336, 0.7111896, -1.686397, 1, 0.5529412, 0, 1,
-1.263077, 1.369494, -0.3871413, 1, 0.5568628, 0, 1,
-1.255727, 1.556106, -2.351175, 1, 0.5647059, 0, 1,
-1.245896, -1.724417, -3.161588, 1, 0.5686275, 0, 1,
-1.231592, -1.525329, -2.378871, 1, 0.5764706, 0, 1,
-1.2183, 1.36479, 0.4729017, 1, 0.5803922, 0, 1,
-1.215016, -0.3362771, -0.979089, 1, 0.5882353, 0, 1,
-1.213693, -0.2452691, -0.7805964, 1, 0.5921569, 0, 1,
-1.201959, 1.790124, 0.7011601, 1, 0.6, 0, 1,
-1.196563, 0.5045826, -0.04972594, 1, 0.6078432, 0, 1,
-1.196391, -1.698837, -2.034564, 1, 0.6117647, 0, 1,
-1.195453, -1.490831, -2.46677, 1, 0.6196079, 0, 1,
-1.180781, -1.054021, -2.274257, 1, 0.6235294, 0, 1,
-1.165875, -1.318778, -2.981033, 1, 0.6313726, 0, 1,
-1.165322, -0.8195364, -1.724191, 1, 0.6352941, 0, 1,
-1.164262, -1.160067, -1.820746, 1, 0.6431373, 0, 1,
-1.163315, 0.1505343, -1.608548, 1, 0.6470588, 0, 1,
-1.15857, 1.354077, -0.2426787, 1, 0.654902, 0, 1,
-1.152077, 1.361708, -3.238897, 1, 0.6588235, 0, 1,
-1.148574, 1.182856, -2.49107, 1, 0.6666667, 0, 1,
-1.141307, 0.05284846, -0.6886151, 1, 0.6705883, 0, 1,
-1.139884, -0.2868971, -3.077166, 1, 0.6784314, 0, 1,
-1.134628, -1.593739, -2.783747, 1, 0.682353, 0, 1,
-1.128159, -0.5278634, -2.467791, 1, 0.6901961, 0, 1,
-1.126424, -0.00700432, -0.7008317, 1, 0.6941177, 0, 1,
-1.124125, -0.9248214, -1.487529, 1, 0.7019608, 0, 1,
-1.117303, 0.9081646, -1.637785, 1, 0.7098039, 0, 1,
-1.11413, 0.1357295, 0.1976756, 1, 0.7137255, 0, 1,
-1.095696, 0.05445876, -1.773419, 1, 0.7215686, 0, 1,
-1.090122, 0.3034424, -0.4620805, 1, 0.7254902, 0, 1,
-1.089003, 0.3137789, 1.31896, 1, 0.7333333, 0, 1,
-1.085863, 0.2659113, -2.12092, 1, 0.7372549, 0, 1,
-1.084544, -0.94828, -2.850554, 1, 0.7450981, 0, 1,
-1.082648, 0.06944654, -0.1012592, 1, 0.7490196, 0, 1,
-1.080735, -0.3663388, 0.08324806, 1, 0.7568628, 0, 1,
-1.078553, -1.073785, -3.860166, 1, 0.7607843, 0, 1,
-1.075696, 0.7394457, -0.2880507, 1, 0.7686275, 0, 1,
-1.069275, -0.949559, -2.690644, 1, 0.772549, 0, 1,
-1.060958, 0.8343316, -0.360904, 1, 0.7803922, 0, 1,
-1.059827, -1.030355, -3.322525, 1, 0.7843137, 0, 1,
-1.050586, 0.7445896, -0.4983948, 1, 0.7921569, 0, 1,
-1.042342, 1.827315, -0.8274707, 1, 0.7960784, 0, 1,
-1.039455, -1.147706, -4.243992, 1, 0.8039216, 0, 1,
-1.03689, -1.431068, -3.505466, 1, 0.8117647, 0, 1,
-1.033158, 0.6397548, 0.3850316, 1, 0.8156863, 0, 1,
-1.023615, -0.3346314, -2.077188, 1, 0.8235294, 0, 1,
-1.019203, 0.7934132, -1.745587, 1, 0.827451, 0, 1,
-1.005874, -0.06782, -1.751651, 1, 0.8352941, 0, 1,
-0.995658, -0.3177457, -2.516423, 1, 0.8392157, 0, 1,
-0.9943126, -1.101402, -3.686985, 1, 0.8470588, 0, 1,
-0.988448, -0.7879559, -1.725165, 1, 0.8509804, 0, 1,
-0.9860456, 1.279457, -0.03380746, 1, 0.8588235, 0, 1,
-0.9858056, -0.9122614, -1.032734, 1, 0.8627451, 0, 1,
-0.9814216, 3.032253, -1.159485, 1, 0.8705882, 0, 1,
-0.977159, 1.621024, -0.9977224, 1, 0.8745098, 0, 1,
-0.9475638, -1.070508, -2.663869, 1, 0.8823529, 0, 1,
-0.9437137, 0.6488255, -0.1726817, 1, 0.8862745, 0, 1,
-0.9436812, -1.815994, -1.436621, 1, 0.8941177, 0, 1,
-0.9392903, -0.3684591, -1.789213, 1, 0.8980392, 0, 1,
-0.9386199, -0.9359386, -3.039921, 1, 0.9058824, 0, 1,
-0.9383128, 1.804136, -0.5997581, 1, 0.9137255, 0, 1,
-0.9377962, 0.1280084, -1.156086, 1, 0.9176471, 0, 1,
-0.9214664, 0.3570673, 0.7796547, 1, 0.9254902, 0, 1,
-0.9182874, -0.1415858, 0.280268, 1, 0.9294118, 0, 1,
-0.9171916, 1.139727, -1.269601, 1, 0.9372549, 0, 1,
-0.9164354, -1.478207, -1.114263, 1, 0.9411765, 0, 1,
-0.9131028, -2.049621, -2.083355, 1, 0.9490196, 0, 1,
-0.9084827, -0.110186, -1.829624, 1, 0.9529412, 0, 1,
-0.9081996, 0.5317138, -1.430656, 1, 0.9607843, 0, 1,
-0.9033353, -1.065925, -1.420251, 1, 0.9647059, 0, 1,
-0.9018641, 1.458712, -2.191363, 1, 0.972549, 0, 1,
-0.8996728, 0.4901353, -1.949028, 1, 0.9764706, 0, 1,
-0.8954574, 0.9469248, -1.104641, 1, 0.9843137, 0, 1,
-0.8914342, -0.1701651, -0.62145, 1, 0.9882353, 0, 1,
-0.8868888, -1.381104, -2.009175, 1, 0.9960784, 0, 1,
-0.8861668, -0.3483979, -1.050821, 0.9960784, 1, 0, 1,
-0.8723477, 0.006657176, 0.460253, 0.9921569, 1, 0, 1,
-0.870608, 0.7373634, -2.089315, 0.9843137, 1, 0, 1,
-0.864609, 1.696314, -1.091151, 0.9803922, 1, 0, 1,
-0.8630439, -1.420539, -1.824256, 0.972549, 1, 0, 1,
-0.8599183, 0.3018512, -0.8206517, 0.9686275, 1, 0, 1,
-0.8594177, 0.9741149, -0.3313928, 0.9607843, 1, 0, 1,
-0.8580427, 0.4189081, 0.3759169, 0.9568627, 1, 0, 1,
-0.8522177, -1.080146, -0.9193051, 0.9490196, 1, 0, 1,
-0.8482386, 0.9603043, 1.206008, 0.945098, 1, 0, 1,
-0.8447527, 1.07938, 0.5206329, 0.9372549, 1, 0, 1,
-0.8397615, -1.098363, -3.144153, 0.9333333, 1, 0, 1,
-0.8336416, 1.234144, 0.00818426, 0.9254902, 1, 0, 1,
-0.8323023, 0.9250054, -1.180063, 0.9215686, 1, 0, 1,
-0.8279314, 0.2555724, 0.1163442, 0.9137255, 1, 0, 1,
-0.826257, -0.7605008, -2.619066, 0.9098039, 1, 0, 1,
-0.8259126, -1.260628, -3.570709, 0.9019608, 1, 0, 1,
-0.8240511, 0.253986, -1.826297, 0.8941177, 1, 0, 1,
-0.8234951, -0.518951, -2.782989, 0.8901961, 1, 0, 1,
-0.823075, -1.121482, -2.217721, 0.8823529, 1, 0, 1,
-0.8220465, -0.09261189, -0.7305601, 0.8784314, 1, 0, 1,
-0.8196069, 1.150293, -0.001551005, 0.8705882, 1, 0, 1,
-0.816484, 0.4708662, 0.3763132, 0.8666667, 1, 0, 1,
-0.8163796, -2.070836, -3.776899, 0.8588235, 1, 0, 1,
-0.8052323, 1.010649, -1.524722, 0.854902, 1, 0, 1,
-0.8021945, 0.4930168, 0.507341, 0.8470588, 1, 0, 1,
-0.7962878, -0.02055652, -0.7308073, 0.8431373, 1, 0, 1,
-0.7903665, 0.5896819, -0.573571, 0.8352941, 1, 0, 1,
-0.7874455, 0.1850807, -1.123837, 0.8313726, 1, 0, 1,
-0.7803538, 3.328567, 0.1029032, 0.8235294, 1, 0, 1,
-0.7797155, 0.266109, -0.1962506, 0.8196079, 1, 0, 1,
-0.779369, -0.7307723, -0.253949, 0.8117647, 1, 0, 1,
-0.7719088, 1.177131, 1.974459, 0.8078431, 1, 0, 1,
-0.7715583, 0.7656783, -1.870258, 0.8, 1, 0, 1,
-0.7699929, -1.202593, -3.666017, 0.7921569, 1, 0, 1,
-0.766941, 0.6266592, -1.572016, 0.7882353, 1, 0, 1,
-0.762004, -1.542394, -3.866626, 0.7803922, 1, 0, 1,
-0.7599943, -1.492826, -3.177992, 0.7764706, 1, 0, 1,
-0.7568477, -1.150235, -3.422434, 0.7686275, 1, 0, 1,
-0.756036, 0.1888729, 0.3426744, 0.7647059, 1, 0, 1,
-0.7469012, -0.2778171, -2.104527, 0.7568628, 1, 0, 1,
-0.746537, -0.4107086, -2.119385, 0.7529412, 1, 0, 1,
-0.7312361, -0.7649121, -1.782562, 0.7450981, 1, 0, 1,
-0.7289642, -0.7077486, -3.494451, 0.7411765, 1, 0, 1,
-0.7229276, 1.001346, -0.4530203, 0.7333333, 1, 0, 1,
-0.7161439, 0.6407435, 0.7684333, 0.7294118, 1, 0, 1,
-0.7150691, -0.7849194, -1.825043, 0.7215686, 1, 0, 1,
-0.7092273, 0.4370866, 0.4705544, 0.7176471, 1, 0, 1,
-0.7056657, 1.613384, -1.338755, 0.7098039, 1, 0, 1,
-0.7054764, -0.5629992, -2.29656, 0.7058824, 1, 0, 1,
-0.7039595, -0.1799912, -1.246237, 0.6980392, 1, 0, 1,
-0.7018994, -1.360828, -3.577341, 0.6901961, 1, 0, 1,
-0.6977559, 0.3614933, 0.7736103, 0.6862745, 1, 0, 1,
-0.6975126, 1.484669, 1.475019, 0.6784314, 1, 0, 1,
-0.6947274, 0.4048942, -1.354223, 0.6745098, 1, 0, 1,
-0.6915106, -1.211427, -5.375382, 0.6666667, 1, 0, 1,
-0.6902294, 0.8264692, -0.5762658, 0.6627451, 1, 0, 1,
-0.6890582, 0.4757914, -1.376992, 0.654902, 1, 0, 1,
-0.6834676, -0.6044875, -0.8847401, 0.6509804, 1, 0, 1,
-0.6806533, 0.6692062, 1.090319, 0.6431373, 1, 0, 1,
-0.678918, -0.07615475, -1.49535, 0.6392157, 1, 0, 1,
-0.6733403, 0.9980027, 0.02102183, 0.6313726, 1, 0, 1,
-0.6729724, 0.9445279, -0.8857417, 0.627451, 1, 0, 1,
-0.6726216, 0.7423069, -1.511404, 0.6196079, 1, 0, 1,
-0.6725928, -0.1167443, -0.5873591, 0.6156863, 1, 0, 1,
-0.67185, -0.8199459, -0.8155478, 0.6078432, 1, 0, 1,
-0.6708447, 0.5786119, -1.006352, 0.6039216, 1, 0, 1,
-0.6669148, 0.5640599, -0.1305992, 0.5960785, 1, 0, 1,
-0.6666254, 0.4198848, -2.405345, 0.5882353, 1, 0, 1,
-0.6662434, 0.5576202, 0.2389821, 0.5843138, 1, 0, 1,
-0.6621891, -1.725249, -4.431364, 0.5764706, 1, 0, 1,
-0.6613115, -1.308038, -1.825155, 0.572549, 1, 0, 1,
-0.6547325, 0.6095906, -2.939188, 0.5647059, 1, 0, 1,
-0.6523581, -0.2855739, -3.760616, 0.5607843, 1, 0, 1,
-0.65137, -0.9191138, -3.428121, 0.5529412, 1, 0, 1,
-0.6467475, 1.090328, 0.09192989, 0.5490196, 1, 0, 1,
-0.6453595, 0.3648748, 0.2883768, 0.5411765, 1, 0, 1,
-0.6435667, -1.606527, -3.117057, 0.5372549, 1, 0, 1,
-0.642617, -0.6980204, -1.877667, 0.5294118, 1, 0, 1,
-0.6404198, 0.3564302, -1.471305, 0.5254902, 1, 0, 1,
-0.6379851, -0.5423654, -2.53487, 0.5176471, 1, 0, 1,
-0.6350038, 1.256141, -0.3439161, 0.5137255, 1, 0, 1,
-0.6337015, 1.025369, -1.586217, 0.5058824, 1, 0, 1,
-0.6272526, -1.714487, -2.329977, 0.5019608, 1, 0, 1,
-0.6247926, 0.7061737, -0.927731, 0.4941176, 1, 0, 1,
-0.6236078, -1.274496, -5.32198, 0.4862745, 1, 0, 1,
-0.6173424, 0.6338441, -1.528235, 0.4823529, 1, 0, 1,
-0.6121212, 1.195509, -0.1499934, 0.4745098, 1, 0, 1,
-0.6100519, -0.9801571, -1.407524, 0.4705882, 1, 0, 1,
-0.607344, 1.874685, -0.5805326, 0.4627451, 1, 0, 1,
-0.6051576, -0.5654256, -2.780224, 0.4588235, 1, 0, 1,
-0.604032, 0.165489, 0.1204722, 0.4509804, 1, 0, 1,
-0.5987307, 0.4920859, 0.1121781, 0.4470588, 1, 0, 1,
-0.5983841, 0.6212871, -0.525099, 0.4392157, 1, 0, 1,
-0.5979395, 2.087233, -0.1455242, 0.4352941, 1, 0, 1,
-0.5969283, -0.2643629, -2.816793, 0.427451, 1, 0, 1,
-0.58851, -0.9957766, -3.21068, 0.4235294, 1, 0, 1,
-0.5881177, -0.8241534, -4.088344, 0.4156863, 1, 0, 1,
-0.5870157, -0.8014114, -2.576753, 0.4117647, 1, 0, 1,
-0.5868536, -0.01421103, -0.8499312, 0.4039216, 1, 0, 1,
-0.5867853, 0.9743512, 0.8374101, 0.3960784, 1, 0, 1,
-0.5803976, 0.4778216, -0.5256124, 0.3921569, 1, 0, 1,
-0.5796998, -0.3056987, -1.399925, 0.3843137, 1, 0, 1,
-0.5783089, -0.8556778, -2.395364, 0.3803922, 1, 0, 1,
-0.5751653, -0.4425308, -3.339429, 0.372549, 1, 0, 1,
-0.5662969, 2.083216, -0.4888418, 0.3686275, 1, 0, 1,
-0.5649511, 0.5551411, -0.198528, 0.3607843, 1, 0, 1,
-0.5643778, -0.8549188, -3.632646, 0.3568628, 1, 0, 1,
-0.5624966, 1.03743, -0.7038897, 0.3490196, 1, 0, 1,
-0.560261, 1.8589, -0.1631127, 0.345098, 1, 0, 1,
-0.5582762, -0.3171893, -1.546194, 0.3372549, 1, 0, 1,
-0.5573614, -0.3241746, -2.282374, 0.3333333, 1, 0, 1,
-0.557075, -1.072242, -2.71028, 0.3254902, 1, 0, 1,
-0.5545144, 0.770924, 1.289772, 0.3215686, 1, 0, 1,
-0.5540418, -0.7640091, -1.077144, 0.3137255, 1, 0, 1,
-0.5515983, 0.9005108, -0.4273293, 0.3098039, 1, 0, 1,
-0.5504194, 0.1961275, -0.6530192, 0.3019608, 1, 0, 1,
-0.5471879, -1.395027, -0.794722, 0.2941177, 1, 0, 1,
-0.547137, 1.587581, 0.4178201, 0.2901961, 1, 0, 1,
-0.5467614, 0.06485244, 0.1469197, 0.282353, 1, 0, 1,
-0.5425327, 1.871644, -1.13889, 0.2784314, 1, 0, 1,
-0.5423447, -0.5542544, -2.946396, 0.2705882, 1, 0, 1,
-0.542192, -0.9533203, -2.741725, 0.2666667, 1, 0, 1,
-0.5403013, -1.80108, -3.44396, 0.2588235, 1, 0, 1,
-0.5380573, -3.31818, -1.81551, 0.254902, 1, 0, 1,
-0.5354111, -0.7500275, -2.894177, 0.2470588, 1, 0, 1,
-0.5345859, -0.7351156, -2.344106, 0.2431373, 1, 0, 1,
-0.5335845, 0.6287894, -0.8714569, 0.2352941, 1, 0, 1,
-0.5288386, -1.767919, -1.454042, 0.2313726, 1, 0, 1,
-0.5215342, -0.09218308, -2.520671, 0.2235294, 1, 0, 1,
-0.5151346, -0.4088613, -1.16776, 0.2196078, 1, 0, 1,
-0.5134705, 0.8572447, 0.1828195, 0.2117647, 1, 0, 1,
-0.513451, -0.2913766, -2.238759, 0.2078431, 1, 0, 1,
-0.5085993, 0.2176676, -1.443262, 0.2, 1, 0, 1,
-0.5077101, -0.4439893, -3.709783, 0.1921569, 1, 0, 1,
-0.5075171, 0.6456246, -1.641147, 0.1882353, 1, 0, 1,
-0.5072438, 1.646984, -0.8765992, 0.1803922, 1, 0, 1,
-0.506521, 0.4118304, -0.2028682, 0.1764706, 1, 0, 1,
-0.5016757, 0.1677056, -3.980958, 0.1686275, 1, 0, 1,
-0.4975947, 1.005905, -2.719262, 0.1647059, 1, 0, 1,
-0.492279, 0.05058883, -1.388592, 0.1568628, 1, 0, 1,
-0.4840605, 1.602777, -0.6378301, 0.1529412, 1, 0, 1,
-0.4785564, 0.07825267, -1.835418, 0.145098, 1, 0, 1,
-0.4734205, -0.6785384, -2.543466, 0.1411765, 1, 0, 1,
-0.4703234, -0.5325893, -0.548469, 0.1333333, 1, 0, 1,
-0.4699721, 1.139027, -1.554322, 0.1294118, 1, 0, 1,
-0.4694032, 2.039402, 0.106777, 0.1215686, 1, 0, 1,
-0.468272, 1.322261, -1.860397, 0.1176471, 1, 0, 1,
-0.4678018, -2.334714, -4.256006, 0.1098039, 1, 0, 1,
-0.4675712, -1.091812, -1.37955, 0.1058824, 1, 0, 1,
-0.4634157, -0.3505335, -2.537859, 0.09803922, 1, 0, 1,
-0.4627212, 2.302162, -0.1895708, 0.09019608, 1, 0, 1,
-0.4532443, -0.9284456, -1.799702, 0.08627451, 1, 0, 1,
-0.4502875, -0.1058748, -1.121465, 0.07843138, 1, 0, 1,
-0.4481739, -2.662109, -3.563532, 0.07450981, 1, 0, 1,
-0.4465518, -2.253012, -2.198276, 0.06666667, 1, 0, 1,
-0.4450347, -0.453169, -2.612663, 0.0627451, 1, 0, 1,
-0.4417133, -3.240609, -1.19493, 0.05490196, 1, 0, 1,
-0.4339455, -0.2788287, -2.161849, 0.05098039, 1, 0, 1,
-0.4310444, -1.544444, -2.918291, 0.04313726, 1, 0, 1,
-0.43091, 0.71153, 0.02191189, 0.03921569, 1, 0, 1,
-0.4239592, -1.32824, -3.343793, 0.03137255, 1, 0, 1,
-0.4237169, 0.2891096, -3.018678, 0.02745098, 1, 0, 1,
-0.4232418, 0.2229473, -1.652342, 0.01960784, 1, 0, 1,
-0.4204496, -0.5025108, -2.937153, 0.01568628, 1, 0, 1,
-0.410767, 0.4238837, -0.09504417, 0.007843138, 1, 0, 1,
-0.40784, -1.266228, -1.969501, 0.003921569, 1, 0, 1,
-0.4015391, 0.5462118, -3.642434, 0, 1, 0.003921569, 1,
-0.3998365, -0.2392556, -1.802627, 0, 1, 0.01176471, 1,
-0.3987347, -1.302732, -0.8440715, 0, 1, 0.01568628, 1,
-0.3962485, -0.8475034, -1.928057, 0, 1, 0.02352941, 1,
-0.3926451, 0.4464718, -1.114881, 0, 1, 0.02745098, 1,
-0.3841679, -1.26401, -2.497141, 0, 1, 0.03529412, 1,
-0.3840853, 1.065268, -0.657139, 0, 1, 0.03921569, 1,
-0.3827948, -0.658465, -2.268931, 0, 1, 0.04705882, 1,
-0.3803592, -1.463875, -3.341315, 0, 1, 0.05098039, 1,
-0.3782109, -0.5859734, -4.575687, 0, 1, 0.05882353, 1,
-0.3720395, 1.145935, -0.3939044, 0, 1, 0.0627451, 1,
-0.3681916, -0.3857551, -2.900298, 0, 1, 0.07058824, 1,
-0.3654369, 1.298247, 0.3530683, 0, 1, 0.07450981, 1,
-0.3616961, 0.9390037, -0.876282, 0, 1, 0.08235294, 1,
-0.3599744, 0.164866, -0.7392957, 0, 1, 0.08627451, 1,
-0.3576472, -0.4564259, -3.633307, 0, 1, 0.09411765, 1,
-0.3552005, 1.395095, -0.468362, 0, 1, 0.1019608, 1,
-0.3533289, 0.9186766, -2.086928, 0, 1, 0.1058824, 1,
-0.3525084, 2.424255, -0.4770909, 0, 1, 0.1137255, 1,
-0.3505836, 1.5198, -0.8448169, 0, 1, 0.1176471, 1,
-0.3484912, -0.2847043, -3.566647, 0, 1, 0.1254902, 1,
-0.3474177, 0.7841833, -0.5511355, 0, 1, 0.1294118, 1,
-0.3425923, 2.913656, 0.1521949, 0, 1, 0.1372549, 1,
-0.3419352, -0.3986966, -2.704584, 0, 1, 0.1411765, 1,
-0.3405595, -2.474143, -3.216172, 0, 1, 0.1490196, 1,
-0.3403111, 0.5161428, -0.08489701, 0, 1, 0.1529412, 1,
-0.3354329, 1.038545, -0.1964789, 0, 1, 0.1607843, 1,
-0.334585, 1.21175, -1.112795, 0, 1, 0.1647059, 1,
-0.3313327, 0.4545355, -1.831448, 0, 1, 0.172549, 1,
-0.3277373, 1.110037, -1.012206, 0, 1, 0.1764706, 1,
-0.327022, -1.362388, -2.387, 0, 1, 0.1843137, 1,
-0.3253643, 1.479606, 1.075236, 0, 1, 0.1882353, 1,
-0.3236352, -1.568427, -2.851031, 0, 1, 0.1960784, 1,
-0.321978, -0.2593956, -2.321795, 0, 1, 0.2039216, 1,
-0.3219143, 0.1494774, -2.339749, 0, 1, 0.2078431, 1,
-0.3197936, 0.6744986, -1.750925, 0, 1, 0.2156863, 1,
-0.3180598, 0.6236869, -1.703957, 0, 1, 0.2196078, 1,
-0.316825, 0.6073799, -1.057696, 0, 1, 0.227451, 1,
-0.3124736, 1.106226, -1.441255, 0, 1, 0.2313726, 1,
-0.3071018, -0.6901708, -0.7559973, 0, 1, 0.2392157, 1,
-0.3058378, 0.4408931, 0.450427, 0, 1, 0.2431373, 1,
-0.3056929, -0.1365711, -1.678163, 0, 1, 0.2509804, 1,
-0.3021609, 0.247514, -1.869826, 0, 1, 0.254902, 1,
-0.301837, 0.2347843, -0.8862196, 0, 1, 0.2627451, 1,
-0.297632, 0.1818395, 0.0100234, 0, 1, 0.2666667, 1,
-0.2976061, -0.4124227, -1.910375, 0, 1, 0.2745098, 1,
-0.2964492, -0.1981422, -1.072333, 0, 1, 0.2784314, 1,
-0.2941557, -0.2568561, -5.209223, 0, 1, 0.2862745, 1,
-0.2938057, 0.8371226, 0.01556152, 0, 1, 0.2901961, 1,
-0.2864431, -0.9403535, -2.526759, 0, 1, 0.2980392, 1,
-0.2826594, -0.2770994, -1.14335, 0, 1, 0.3058824, 1,
-0.2796678, 0.04629793, -1.08388, 0, 1, 0.3098039, 1,
-0.278625, -0.7178062, -2.587765, 0, 1, 0.3176471, 1,
-0.2669137, -0.005634621, -0.7185094, 0, 1, 0.3215686, 1,
-0.265692, -1.006574, -3.436117, 0, 1, 0.3294118, 1,
-0.2642595, -0.5844837, -3.44457, 0, 1, 0.3333333, 1,
-0.2635151, 1.642453, -0.7775172, 0, 1, 0.3411765, 1,
-0.2610448, -0.8916341, -2.985994, 0, 1, 0.345098, 1,
-0.2593, -0.8866875, -3.700325, 0, 1, 0.3529412, 1,
-0.2575186, 0.06431316, 0.1393024, 0, 1, 0.3568628, 1,
-0.2557376, 0.3967153, 0.7747385, 0, 1, 0.3647059, 1,
-0.2549699, -1.543923, -2.967305, 0, 1, 0.3686275, 1,
-0.250502, 0.9779186, -0.8930187, 0, 1, 0.3764706, 1,
-0.2477096, 0.8846405, 0.589725, 0, 1, 0.3803922, 1,
-0.2459032, -1.092117, -2.510489, 0, 1, 0.3882353, 1,
-0.2435522, 1.155437, 0.08536724, 0, 1, 0.3921569, 1,
-0.2432921, -0.6185346, -2.354878, 0, 1, 0.4, 1,
-0.2383126, 0.7242399, -0.253003, 0, 1, 0.4078431, 1,
-0.2357541, 1.764111, -0.2707857, 0, 1, 0.4117647, 1,
-0.2352098, 0.34308, 0.38877, 0, 1, 0.4196078, 1,
-0.2312802, 0.6542752, -0.5773193, 0, 1, 0.4235294, 1,
-0.2261462, 0.7102811, -1.037298, 0, 1, 0.4313726, 1,
-0.2238586, -0.3975296, -3.034374, 0, 1, 0.4352941, 1,
-0.2229974, -0.7828366, -3.570541, 0, 1, 0.4431373, 1,
-0.2223393, 1.700893, -2.307979, 0, 1, 0.4470588, 1,
-0.2202172, 0.8442636, -1.501614, 0, 1, 0.454902, 1,
-0.2199432, -0.5333713, -3.517424, 0, 1, 0.4588235, 1,
-0.2165426, -0.9710567, -2.190485, 0, 1, 0.4666667, 1,
-0.2055794, 2.724348, 1.559527, 0, 1, 0.4705882, 1,
-0.2035247, 0.8333909, 0.3458153, 0, 1, 0.4784314, 1,
-0.20293, 0.5273709, 0.3081167, 0, 1, 0.4823529, 1,
-0.20017, 0.743596, 1.968033, 0, 1, 0.4901961, 1,
-0.1925446, -1.110506, -4.332612, 0, 1, 0.4941176, 1,
-0.191313, -0.8969342, -3.800172, 0, 1, 0.5019608, 1,
-0.1892718, 0.06235998, -0.3310336, 0, 1, 0.509804, 1,
-0.1809574, -0.06013491, -1.777621, 0, 1, 0.5137255, 1,
-0.1803261, -0.5571851, -3.317077, 0, 1, 0.5215687, 1,
-0.17318, -1.052965, -2.856504, 0, 1, 0.5254902, 1,
-0.1648837, -0.1967412, -3.30237, 0, 1, 0.5333334, 1,
-0.1631925, 1.102004, 0.3350195, 0, 1, 0.5372549, 1,
-0.1626712, 0.02277303, -0.5374067, 0, 1, 0.5450981, 1,
-0.1611023, -1.237588, -2.524768, 0, 1, 0.5490196, 1,
-0.1592175, 2.926205, -1.412121, 0, 1, 0.5568628, 1,
-0.153482, -1.582156, -1.713183, 0, 1, 0.5607843, 1,
-0.1513694, -1.1473, -1.127649, 0, 1, 0.5686275, 1,
-0.1479555, -0.7661939, -1.561058, 0, 1, 0.572549, 1,
-0.1468314, 0.612555, -0.4734725, 0, 1, 0.5803922, 1,
-0.1376553, -0.0001413214, -2.473522, 0, 1, 0.5843138, 1,
-0.1372939, -0.868717, -4.522108, 0, 1, 0.5921569, 1,
-0.1369548, 1.592524, 0.325776, 0, 1, 0.5960785, 1,
-0.1363979, -1.532783, -3.188434, 0, 1, 0.6039216, 1,
-0.134424, -0.3711369, -3.130376, 0, 1, 0.6117647, 1,
-0.132729, 0.721011, -1.177828, 0, 1, 0.6156863, 1,
-0.1312811, -0.7836162, -3.346591, 0, 1, 0.6235294, 1,
-0.1308188, -1.030004, -3.836126, 0, 1, 0.627451, 1,
-0.1291134, -0.7934459, -3.471713, 0, 1, 0.6352941, 1,
-0.1277319, 0.9289648, 1.363166, 0, 1, 0.6392157, 1,
-0.1249547, -1.323103, -2.632962, 0, 1, 0.6470588, 1,
-0.1217424, 1.498773, 0.5560167, 0, 1, 0.6509804, 1,
-0.1208801, 0.4180392, -0.4298572, 0, 1, 0.6588235, 1,
-0.1190061, -0.6028754, -3.329641, 0, 1, 0.6627451, 1,
-0.116694, 0.6846164, 0.2593152, 0, 1, 0.6705883, 1,
-0.1165211, 1.010519, -0.408074, 0, 1, 0.6745098, 1,
-0.1157846, 0.3407123, 1.249089, 0, 1, 0.682353, 1,
-0.1151596, -0.5024012, -3.602829, 0, 1, 0.6862745, 1,
-0.1150686, 0.9973096, -1.019252, 0, 1, 0.6941177, 1,
-0.114863, -0.182525, -2.781183, 0, 1, 0.7019608, 1,
-0.1136759, -0.3511088, -3.384558, 0, 1, 0.7058824, 1,
-0.1088985, -0.8816966, -4.735401, 0, 1, 0.7137255, 1,
-0.1088762, 0.2892007, -0.04187239, 0, 1, 0.7176471, 1,
-0.1071748, -0.6282597, -2.918262, 0, 1, 0.7254902, 1,
-0.09500647, -0.1622692, -1.629153, 0, 1, 0.7294118, 1,
-0.087893, -1.098349, -3.611578, 0, 1, 0.7372549, 1,
-0.08784847, 1.025797, 0.8563887, 0, 1, 0.7411765, 1,
-0.08632012, 0.304757, 0.4543044, 0, 1, 0.7490196, 1,
-0.08573361, -0.0651867, -1.007787, 0, 1, 0.7529412, 1,
-0.08556937, -0.3737328, -3.24891, 0, 1, 0.7607843, 1,
-0.08313715, -1.573171, -3.043149, 0, 1, 0.7647059, 1,
-0.0820275, 0.2098056, 0.5491396, 0, 1, 0.772549, 1,
-0.07298059, -1.713252, -2.584064, 0, 1, 0.7764706, 1,
-0.07052343, -0.9991019, -2.994362, 0, 1, 0.7843137, 1,
-0.07000428, -0.8413572, -2.442349, 0, 1, 0.7882353, 1,
-0.06996645, 0.3976721, 0.5598947, 0, 1, 0.7960784, 1,
-0.06840698, 2.148947, -0.2758132, 0, 1, 0.8039216, 1,
-0.06027846, -0.7440612, -3.442063, 0, 1, 0.8078431, 1,
-0.05880756, 1.306668, 0.884064, 0, 1, 0.8156863, 1,
-0.05184785, -0.3784159, -1.934451, 0, 1, 0.8196079, 1,
-0.05144085, 0.816404, 0.6833299, 0, 1, 0.827451, 1,
-0.04894323, -1.105767, -3.108169, 0, 1, 0.8313726, 1,
-0.04853598, -0.08451446, -3.185941, 0, 1, 0.8392157, 1,
-0.04546935, -0.09025791, -2.639322, 0, 1, 0.8431373, 1,
-0.0398902, -1.079094, -2.1379, 0, 1, 0.8509804, 1,
-0.03869131, 0.5088072, 1.207262, 0, 1, 0.854902, 1,
-0.03832193, 0.02482375, -1.053182, 0, 1, 0.8627451, 1,
-0.03689376, -1.71254, -4.758132, 0, 1, 0.8666667, 1,
-0.03446088, -2.320032, -3.356593, 0, 1, 0.8745098, 1,
-0.03111032, 1.459554, 1.187992, 0, 1, 0.8784314, 1,
-0.02012743, 0.3123693, -0.5015373, 0, 1, 0.8862745, 1,
-0.01956078, 0.6758742, -1.478104, 0, 1, 0.8901961, 1,
-0.01845011, -1.951553, -3.569572, 0, 1, 0.8980392, 1,
-0.01349275, -1.342287, -3.431202, 0, 1, 0.9058824, 1,
-0.0101449, -2.987893, -4.602129, 0, 1, 0.9098039, 1,
-0.008153479, 1.197506, -0.6236826, 0, 1, 0.9176471, 1,
-0.006564195, -0.4561161, -2.42305, 0, 1, 0.9215686, 1,
-0.001224051, -0.6572923, -5.23924, 0, 1, 0.9294118, 1,
0.002920071, 0.493598, 1.398943, 0, 1, 0.9333333, 1,
0.00484411, 1.133101, 0.7263231, 0, 1, 0.9411765, 1,
0.00759801, 0.7015609, 0.5489163, 0, 1, 0.945098, 1,
0.0113592, 0.7709965, 1.553932, 0, 1, 0.9529412, 1,
0.0143166, 1.051068, 0.838004, 0, 1, 0.9568627, 1,
0.0252986, -0.7722397, 3.078826, 0, 1, 0.9647059, 1,
0.02560186, -0.3754511, 2.049388, 0, 1, 0.9686275, 1,
0.0309474, 1.179509, -0.9195549, 0, 1, 0.9764706, 1,
0.03236145, -0.2744934, 4.018318, 0, 1, 0.9803922, 1,
0.03361592, -0.06768418, 3.575791, 0, 1, 0.9882353, 1,
0.03439604, -0.08813362, 1.902957, 0, 1, 0.9921569, 1,
0.03453861, -1.507406, 2.933101, 0, 1, 1, 1,
0.03631758, -0.03488564, 2.772035, 0, 0.9921569, 1, 1,
0.03966053, 1.645678, -1.366625, 0, 0.9882353, 1, 1,
0.04472275, 0.1769135, 0.2758073, 0, 0.9803922, 1, 1,
0.04534124, -0.3366631, 3.139956, 0, 0.9764706, 1, 1,
0.04699164, -1.351725, 2.961648, 0, 0.9686275, 1, 1,
0.04825986, 1.22238, 0.3451406, 0, 0.9647059, 1, 1,
0.04857016, 0.557852, 1.22673, 0, 0.9568627, 1, 1,
0.0519747, 1.248918, -0.420915, 0, 0.9529412, 1, 1,
0.05275067, -1.284501, 4.910285, 0, 0.945098, 1, 1,
0.05330541, -0.3010411, 3.62709, 0, 0.9411765, 1, 1,
0.05369662, 1.700214, 0.3717432, 0, 0.9333333, 1, 1,
0.0540216, -0.6947257, 4.305081, 0, 0.9294118, 1, 1,
0.05548029, -0.1165937, 2.919465, 0, 0.9215686, 1, 1,
0.05610357, -0.007245372, 0.4088914, 0, 0.9176471, 1, 1,
0.06258804, 0.3563908, -0.134088, 0, 0.9098039, 1, 1,
0.06368527, -0.7419895, 1.455125, 0, 0.9058824, 1, 1,
0.06444316, 1.26491, -0.8323742, 0, 0.8980392, 1, 1,
0.06670985, 0.006713235, -0.4412127, 0, 0.8901961, 1, 1,
0.06883358, 0.3710707, 0.333726, 0, 0.8862745, 1, 1,
0.06939789, -1.591565, 2.760503, 0, 0.8784314, 1, 1,
0.06992187, -1.560074, 2.322405, 0, 0.8745098, 1, 1,
0.0710572, -0.09254718, 3.04636, 0, 0.8666667, 1, 1,
0.07369015, 0.25033, -1.276777, 0, 0.8627451, 1, 1,
0.07503121, -0.2723903, 3.56829, 0, 0.854902, 1, 1,
0.07866306, 1.088718, 0.8483904, 0, 0.8509804, 1, 1,
0.08680932, 0.0774783, 0.8678344, 0, 0.8431373, 1, 1,
0.08720192, 1.032324, -0.2191838, 0, 0.8392157, 1, 1,
0.08756099, -1.387838, 4.447334, 0, 0.8313726, 1, 1,
0.08852701, 1.56048, -0.3175314, 0, 0.827451, 1, 1,
0.09124283, 0.3139711, -1.577719, 0, 0.8196079, 1, 1,
0.09418016, 0.05460438, -1.219214, 0, 0.8156863, 1, 1,
0.09861654, -1.72073, 3.26842, 0, 0.8078431, 1, 1,
0.1000001, -0.08612653, 3.920305, 0, 0.8039216, 1, 1,
0.1022635, 0.5019413, 0.8967894, 0, 0.7960784, 1, 1,
0.1056648, 0.1306246, 1.697331, 0, 0.7882353, 1, 1,
0.1113199, -1.642519, 0.9714136, 0, 0.7843137, 1, 1,
0.1119416, -0.8711917, 2.016556, 0, 0.7764706, 1, 1,
0.1185093, 0.5449792, -2.049726, 0, 0.772549, 1, 1,
0.1202723, -0.2264025, 2.827317, 0, 0.7647059, 1, 1,
0.1238429, 1.670857, -0.5159883, 0, 0.7607843, 1, 1,
0.1238651, -1.272867, 4.313513, 0, 0.7529412, 1, 1,
0.1304996, -0.5678734, 4.926034, 0, 0.7490196, 1, 1,
0.1350268, 0.1802749, 0.977324, 0, 0.7411765, 1, 1,
0.1352158, -0.4073412, 3.899447, 0, 0.7372549, 1, 1,
0.1366193, -1.401039, 2.666696, 0, 0.7294118, 1, 1,
0.1385574, -2.069366, 2.60355, 0, 0.7254902, 1, 1,
0.1447752, 1.086947, -0.6175199, 0, 0.7176471, 1, 1,
0.1487954, 0.9208924, -0.08084977, 0, 0.7137255, 1, 1,
0.1496895, 0.8375263, 1.164559, 0, 0.7058824, 1, 1,
0.1516021, 0.2475608, 0.07666267, 0, 0.6980392, 1, 1,
0.1550598, -1.526344, 2.154994, 0, 0.6941177, 1, 1,
0.1555393, -0.7239373, 1.472454, 0, 0.6862745, 1, 1,
0.1582507, -0.03580793, 0.06193223, 0, 0.682353, 1, 1,
0.1613874, 1.854975, 0.3686561, 0, 0.6745098, 1, 1,
0.1635764, -0.2342644, 2.744471, 0, 0.6705883, 1, 1,
0.164434, 0.1423799, 1.716846, 0, 0.6627451, 1, 1,
0.1647694, 0.7623621, -0.3672068, 0, 0.6588235, 1, 1,
0.164805, 0.8312061, -2.310959, 0, 0.6509804, 1, 1,
0.1749886, 0.3700707, 0.5393795, 0, 0.6470588, 1, 1,
0.1753983, -0.8888823, 2.363274, 0, 0.6392157, 1, 1,
0.1767161, -0.7313926, 3.084661, 0, 0.6352941, 1, 1,
0.1777393, 0.6929412, 2.168306, 0, 0.627451, 1, 1,
0.1810626, -1.004267, 3.720063, 0, 0.6235294, 1, 1,
0.1855437, 0.5751411, 1.279336, 0, 0.6156863, 1, 1,
0.1862814, -0.02285578, 2.359477, 0, 0.6117647, 1, 1,
0.1956178, 0.2497393, 1.333558, 0, 0.6039216, 1, 1,
0.2003172, -2.260059, 5.267664, 0, 0.5960785, 1, 1,
0.2020586, 0.7828138, 1.057802, 0, 0.5921569, 1, 1,
0.2024661, 1.01064, 1.176515, 0, 0.5843138, 1, 1,
0.2067656, -0.6107811, 5.07884, 0, 0.5803922, 1, 1,
0.209588, 0.07398321, 1.66877, 0, 0.572549, 1, 1,
0.2110991, 0.6628039, -0.4047663, 0, 0.5686275, 1, 1,
0.2171549, -1.060844, 3.564709, 0, 0.5607843, 1, 1,
0.2199782, -0.4097919, 0.9225649, 0, 0.5568628, 1, 1,
0.2199787, -0.6173775, 2.910341, 0, 0.5490196, 1, 1,
0.220531, -0.8310553, 1.986616, 0, 0.5450981, 1, 1,
0.2338893, 0.3336768, 1.813131, 0, 0.5372549, 1, 1,
0.2338969, -0.1310669, 3.628527, 0, 0.5333334, 1, 1,
0.2356369, -0.5549479, 2.112492, 0, 0.5254902, 1, 1,
0.2409066, 0.09896444, 1.187693, 0, 0.5215687, 1, 1,
0.2418772, -0.09911145, 1.045619, 0, 0.5137255, 1, 1,
0.2434944, -0.09845819, 0.4543735, 0, 0.509804, 1, 1,
0.2463377, 0.8007092, -0.8735789, 0, 0.5019608, 1, 1,
0.2487441, -1.514822, 2.390105, 0, 0.4941176, 1, 1,
0.2525449, 1.202584, -0.9743156, 0, 0.4901961, 1, 1,
0.2537079, 0.4952948, -0.88787, 0, 0.4823529, 1, 1,
0.257302, 0.8689543, -0.9837438, 0, 0.4784314, 1, 1,
0.2587598, -1.078047, 2.18206, 0, 0.4705882, 1, 1,
0.2604281, 1.733993, -1.403171, 0, 0.4666667, 1, 1,
0.2606681, -1.05871, 3.043863, 0, 0.4588235, 1, 1,
0.2622319, 1.088189, -0.3456494, 0, 0.454902, 1, 1,
0.2681233, -0.3442824, 4.670897, 0, 0.4470588, 1, 1,
0.2714509, -0.227253, 3.809613, 0, 0.4431373, 1, 1,
0.2720471, -0.4436853, 3.560555, 0, 0.4352941, 1, 1,
0.2729433, 0.3874152, 0.5611739, 0, 0.4313726, 1, 1,
0.2741382, -0.109537, 1.204226, 0, 0.4235294, 1, 1,
0.2752104, 2.31922, 1.687576, 0, 0.4196078, 1, 1,
0.282567, -1.56076, 1.582057, 0, 0.4117647, 1, 1,
0.2838162, 0.5190865, -1.753217, 0, 0.4078431, 1, 1,
0.2855696, 1.599593, 1.244433, 0, 0.4, 1, 1,
0.2881194, 1.492884, 0.99115, 0, 0.3921569, 1, 1,
0.2887563, 0.2407297, 0.545451, 0, 0.3882353, 1, 1,
0.2941392, 1.518611, -1.08905, 0, 0.3803922, 1, 1,
0.2997066, -1.758237, 2.999669, 0, 0.3764706, 1, 1,
0.3008049, 0.5368172, 0.1853535, 0, 0.3686275, 1, 1,
0.3022993, -1.243006, 3.71584, 0, 0.3647059, 1, 1,
0.3098054, -1.86923, 1.936896, 0, 0.3568628, 1, 1,
0.3112617, -0.01699894, 1.076682, 0, 0.3529412, 1, 1,
0.3117994, -0.3500483, 2.460426, 0, 0.345098, 1, 1,
0.312525, -0.5577133, 3.345408, 0, 0.3411765, 1, 1,
0.315045, 1.047315, 0.9306914, 0, 0.3333333, 1, 1,
0.3173129, -0.05205331, -0.4914094, 0, 0.3294118, 1, 1,
0.3174259, -0.9803042, 2.17459, 0, 0.3215686, 1, 1,
0.3175164, 1.935805, 0.04781545, 0, 0.3176471, 1, 1,
0.3180324, 0.6230738, 0.4749107, 0, 0.3098039, 1, 1,
0.3199913, -0.8499407, 2.92818, 0, 0.3058824, 1, 1,
0.3233438, 0.02810286, 2.06975, 0, 0.2980392, 1, 1,
0.3235946, -0.9920772, 4.690786, 0, 0.2901961, 1, 1,
0.326033, 0.1528437, 2.102683, 0, 0.2862745, 1, 1,
0.32926, 1.458054, 0.5011758, 0, 0.2784314, 1, 1,
0.3310854, -0.3032733, 2.151672, 0, 0.2745098, 1, 1,
0.3332254, 0.6985394, -0.01935141, 0, 0.2666667, 1, 1,
0.3361031, 1.443438, -0.8547395, 0, 0.2627451, 1, 1,
0.338394, 0.3404633, 1.377959, 0, 0.254902, 1, 1,
0.3397506, 0.7201235, -1.646114, 0, 0.2509804, 1, 1,
0.3410357, -0.3021754, 3.545031, 0, 0.2431373, 1, 1,
0.3442804, 0.5572737, 0.513355, 0, 0.2392157, 1, 1,
0.3470107, -0.8741582, 3.161626, 0, 0.2313726, 1, 1,
0.3482395, 1.190274, 0.4167608, 0, 0.227451, 1, 1,
0.3510597, -0.3059924, 0.4674902, 0, 0.2196078, 1, 1,
0.3534242, -1.087988, 2.565448, 0, 0.2156863, 1, 1,
0.3539588, 0.3534833, 1.161979, 0, 0.2078431, 1, 1,
0.3554322, 0.7246961, -0.357188, 0, 0.2039216, 1, 1,
0.3555121, 0.3970717, 1.237303, 0, 0.1960784, 1, 1,
0.3587026, -0.6345628, 4.509719, 0, 0.1882353, 1, 1,
0.3612081, 0.9214965, 0.03385597, 0, 0.1843137, 1, 1,
0.3657889, 0.4404074, -0.4784473, 0, 0.1764706, 1, 1,
0.3662486, -0.1390335, 2.09536, 0, 0.172549, 1, 1,
0.3680935, 0.3089547, 2.24248, 0, 0.1647059, 1, 1,
0.3724024, 0.4638283, 0.1775285, 0, 0.1607843, 1, 1,
0.375455, 1.445523, 0.1178916, 0, 0.1529412, 1, 1,
0.3755344, -0.3896867, 2.169327, 0, 0.1490196, 1, 1,
0.3776339, -0.6982862, 2.015839, 0, 0.1411765, 1, 1,
0.380421, -1.128798, 3.943212, 0, 0.1372549, 1, 1,
0.3814587, -0.3986939, 2.268542, 0, 0.1294118, 1, 1,
0.3855721, 2.486314, 0.4618084, 0, 0.1254902, 1, 1,
0.3878289, 0.4057831, 0.4261717, 0, 0.1176471, 1, 1,
0.3918667, -0.2707421, 1.118225, 0, 0.1137255, 1, 1,
0.3943845, 1.915645, 1.63853, 0, 0.1058824, 1, 1,
0.396882, 2.043157, -0.4428651, 0, 0.09803922, 1, 1,
0.397787, -1.414637, 1.804526, 0, 0.09411765, 1, 1,
0.4011661, 1.129936, 0.1906858, 0, 0.08627451, 1, 1,
0.4061597, 0.4234366, 2.352323, 0, 0.08235294, 1, 1,
0.4063508, -2.071176, 1.167497, 0, 0.07450981, 1, 1,
0.4083806, -0.596326, 3.055624, 0, 0.07058824, 1, 1,
0.4085067, 0.4442267, 0.2789752, 0, 0.0627451, 1, 1,
0.4163355, -0.5608403, 2.494699, 0, 0.05882353, 1, 1,
0.4180001, 0.1562896, 0.3788229, 0, 0.05098039, 1, 1,
0.4209808, 0.5342774, 0.2327468, 0, 0.04705882, 1, 1,
0.4274503, -0.9699714, 2.94103, 0, 0.03921569, 1, 1,
0.4341083, 0.6475191, 0.7544227, 0, 0.03529412, 1, 1,
0.4342681, -1.138863, 0.9305174, 0, 0.02745098, 1, 1,
0.4343494, 0.9699529, 0.4205016, 0, 0.02352941, 1, 1,
0.4356026, -0.2595388, 2.069302, 0, 0.01568628, 1, 1,
0.4364578, 0.8619145, 1.194903, 0, 0.01176471, 1, 1,
0.4468761, -0.686896, 3.686403, 0, 0.003921569, 1, 1,
0.4477856, -0.4495671, 1.069749, 0.003921569, 0, 1, 1,
0.4525931, -0.2619601, 1.582688, 0.007843138, 0, 1, 1,
0.4556057, -0.6373152, 2.22603, 0.01568628, 0, 1, 1,
0.4665127, 0.9680685, 1.5176, 0.01960784, 0, 1, 1,
0.4694637, -0.9279695, 1.979071, 0.02745098, 0, 1, 1,
0.469655, -0.6316971, 2.023642, 0.03137255, 0, 1, 1,
0.4741565, -0.7805371, 2.437077, 0.03921569, 0, 1, 1,
0.4754981, -1.323952, 2.731388, 0.04313726, 0, 1, 1,
0.4756008, 0.4132357, -0.1368661, 0.05098039, 0, 1, 1,
0.4784846, 0.02682406, 0.6588737, 0.05490196, 0, 1, 1,
0.4788739, -0.8525506, 2.217743, 0.0627451, 0, 1, 1,
0.4835568, 0.4518466, 2.948962, 0.06666667, 0, 1, 1,
0.4862294, -0.3050894, 2.769868, 0.07450981, 0, 1, 1,
0.492048, 0.9367579, 1.115841, 0.07843138, 0, 1, 1,
0.493313, -0.3495799, 1.481249, 0.08627451, 0, 1, 1,
0.4939544, 1.055868, 1.083129, 0.09019608, 0, 1, 1,
0.4979019, -0.9770936, 2.160053, 0.09803922, 0, 1, 1,
0.4988473, -1.329703, 3.223429, 0.1058824, 0, 1, 1,
0.5052106, -1.619717, 2.881226, 0.1098039, 0, 1, 1,
0.5093316, -0.148477, 2.643439, 0.1176471, 0, 1, 1,
0.515287, -1.082823, 2.515604, 0.1215686, 0, 1, 1,
0.5275211, -1.04461, 2.758703, 0.1294118, 0, 1, 1,
0.528859, 2.504817, 1.389665, 0.1333333, 0, 1, 1,
0.5315977, 1.050285, 1.623333, 0.1411765, 0, 1, 1,
0.5329761, 0.08693097, 1.592478, 0.145098, 0, 1, 1,
0.5355974, 0.8211622, 1.615489, 0.1529412, 0, 1, 1,
0.5385151, -0.0783096, 1.747263, 0.1568628, 0, 1, 1,
0.5393786, -1.953181, 3.357605, 0.1647059, 0, 1, 1,
0.5398958, 0.1070216, 1.769501, 0.1686275, 0, 1, 1,
0.5404588, -1.190745, 3.013634, 0.1764706, 0, 1, 1,
0.5426357, -0.7999777, 0.4935976, 0.1803922, 0, 1, 1,
0.5432913, 0.2696631, 0.7744554, 0.1882353, 0, 1, 1,
0.5490177, -0.9839106, 2.036106, 0.1921569, 0, 1, 1,
0.5512611, -1.212101, 1.018932, 0.2, 0, 1, 1,
0.5513745, 0.4126127, 0.4418712, 0.2078431, 0, 1, 1,
0.5518576, 0.6851166, -0.1841118, 0.2117647, 0, 1, 1,
0.5530462, -1.679482, 3.498158, 0.2196078, 0, 1, 1,
0.5601761, 0.1291263, 0.9316345, 0.2235294, 0, 1, 1,
0.561891, 0.8457878, -0.9221679, 0.2313726, 0, 1, 1,
0.5625707, -0.1498259, 3.729317, 0.2352941, 0, 1, 1,
0.5756022, -0.9026445, 2.646868, 0.2431373, 0, 1, 1,
0.580013, 1.074101, -0.1529127, 0.2470588, 0, 1, 1,
0.5836551, -0.6280304, 0.8818972, 0.254902, 0, 1, 1,
0.5847517, -0.2893863, 1.210305, 0.2588235, 0, 1, 1,
0.5855255, -0.1586699, 1.498419, 0.2666667, 0, 1, 1,
0.591989, -0.146792, 2.219692, 0.2705882, 0, 1, 1,
0.5935752, -0.1959588, 1.774818, 0.2784314, 0, 1, 1,
0.5964893, -0.002185996, 0.8417137, 0.282353, 0, 1, 1,
0.5993372, 1.25735, 0.0273852, 0.2901961, 0, 1, 1,
0.6007102, 0.05361148, 2.387645, 0.2941177, 0, 1, 1,
0.6033704, -1.022967, 5.176681, 0.3019608, 0, 1, 1,
0.6035222, -0.5408562, 3.238952, 0.3098039, 0, 1, 1,
0.6037403, 0.03737781, 0.8788866, 0.3137255, 0, 1, 1,
0.6075118, 2.067572, 1.638549, 0.3215686, 0, 1, 1,
0.6104283, -0.1004692, 1.902043, 0.3254902, 0, 1, 1,
0.6112051, -0.09505887, 2.666642, 0.3333333, 0, 1, 1,
0.6152717, 0.8519892, 1.157206, 0.3372549, 0, 1, 1,
0.6212245, 0.2863898, 1.445886, 0.345098, 0, 1, 1,
0.6288019, -0.2607748, 0.9585003, 0.3490196, 0, 1, 1,
0.6376094, -1.066537, 2.387423, 0.3568628, 0, 1, 1,
0.6384477, 1.066337, 0.426136, 0.3607843, 0, 1, 1,
0.638482, -0.9205379, 3.493489, 0.3686275, 0, 1, 1,
0.6398094, -0.4555202, 1.048309, 0.372549, 0, 1, 1,
0.6490794, -0.1341013, 1.694674, 0.3803922, 0, 1, 1,
0.650463, 1.432258, 1.19709, 0.3843137, 0, 1, 1,
0.6549237, -1.812385, 3.734481, 0.3921569, 0, 1, 1,
0.6560671, 0.1890502, -0.3444109, 0.3960784, 0, 1, 1,
0.6561261, -0.8152813, 2.343835, 0.4039216, 0, 1, 1,
0.6574782, -1.157604, 3.69323, 0.4117647, 0, 1, 1,
0.6593883, 1.214038, 0.312235, 0.4156863, 0, 1, 1,
0.6606296, 0.8567302, 2.037804, 0.4235294, 0, 1, 1,
0.6674358, -1.141611, 2.346067, 0.427451, 0, 1, 1,
0.6695698, 0.173186, 1.006093, 0.4352941, 0, 1, 1,
0.6708925, 2.113143, 0.3946327, 0.4392157, 0, 1, 1,
0.6718081, -0.6687005, 2.135844, 0.4470588, 0, 1, 1,
0.6724371, -1.406515, 1.312161, 0.4509804, 0, 1, 1,
0.6759185, -1.131914, 1.216424, 0.4588235, 0, 1, 1,
0.6881003, 0.4323873, 0.7311896, 0.4627451, 0, 1, 1,
0.6894273, 0.0335049, 2.538577, 0.4705882, 0, 1, 1,
0.691727, 1.845301, 0.1763965, 0.4745098, 0, 1, 1,
0.7087088, -0.9112467, 5.158299, 0.4823529, 0, 1, 1,
0.7142676, 0.09890912, 2.881576, 0.4862745, 0, 1, 1,
0.7155533, -1.960322, 2.067482, 0.4941176, 0, 1, 1,
0.7182996, 1.520595, -0.03853853, 0.5019608, 0, 1, 1,
0.720416, 1.730445, -1.048701, 0.5058824, 0, 1, 1,
0.7242573, 1.251665, 0.5830373, 0.5137255, 0, 1, 1,
0.7302582, 1.403018, 0.01085734, 0.5176471, 0, 1, 1,
0.7303177, 1.325211, 1.233008, 0.5254902, 0, 1, 1,
0.7313355, -0.907446, 1.329219, 0.5294118, 0, 1, 1,
0.7349789, 0.0568093, -0.1601621, 0.5372549, 0, 1, 1,
0.7369381, -0.008732432, 2.262563, 0.5411765, 0, 1, 1,
0.7406946, -1.471141, 5.673514, 0.5490196, 0, 1, 1,
0.7409167, 0.4528151, 1.496976, 0.5529412, 0, 1, 1,
0.7434741, -0.3558679, 2.724281, 0.5607843, 0, 1, 1,
0.7486035, -0.6491826, 3.578781, 0.5647059, 0, 1, 1,
0.7518148, -0.5803556, 2.011686, 0.572549, 0, 1, 1,
0.7550859, -0.4547772, 0.2299414, 0.5764706, 0, 1, 1,
0.7666839, -0.7542034, 1.181106, 0.5843138, 0, 1, 1,
0.7696691, 0.8821634, 1.295812, 0.5882353, 0, 1, 1,
0.7755894, -0.8899406, 1.987242, 0.5960785, 0, 1, 1,
0.7775298, 0.376361, 0.9011388, 0.6039216, 0, 1, 1,
0.7803928, -0.1451201, -0.1123497, 0.6078432, 0, 1, 1,
0.7813269, 0.6517888, 1.600375, 0.6156863, 0, 1, 1,
0.7858142, -0.01934556, -0.2516784, 0.6196079, 0, 1, 1,
0.7862931, 0.7728141, 1.045446, 0.627451, 0, 1, 1,
0.7930888, -0.9761652, 3.941162, 0.6313726, 0, 1, 1,
0.7944263, 2.407036, -0.180786, 0.6392157, 0, 1, 1,
0.7964315, -0.06380391, 1.101149, 0.6431373, 0, 1, 1,
0.7977728, -0.8039344, 0.1955832, 0.6509804, 0, 1, 1,
0.7995885, -0.9635133, 2.855379, 0.654902, 0, 1, 1,
0.801623, -1.232801, 1.694694, 0.6627451, 0, 1, 1,
0.8028218, 0.7027121, 0.400472, 0.6666667, 0, 1, 1,
0.8032597, -0.2345182, 4.248178, 0.6745098, 0, 1, 1,
0.8060913, 0.9338003, -0.07046968, 0.6784314, 0, 1, 1,
0.8065185, 1.438999, -0.02183605, 0.6862745, 0, 1, 1,
0.8098493, -2.249698, 3.077668, 0.6901961, 0, 1, 1,
0.819537, -0.5986154, 0.5820853, 0.6980392, 0, 1, 1,
0.8203401, -0.6768033, 2.258029, 0.7058824, 0, 1, 1,
0.8261575, -0.3868804, 2.689794, 0.7098039, 0, 1, 1,
0.8283245, 0.2648968, -0.0001369834, 0.7176471, 0, 1, 1,
0.8300964, -0.3059299, 1.502876, 0.7215686, 0, 1, 1,
0.8302175, -1.62319, 0.3388978, 0.7294118, 0, 1, 1,
0.8330586, -1.661134, 2.074867, 0.7333333, 0, 1, 1,
0.8378465, 0.9340735, 1.506591, 0.7411765, 0, 1, 1,
0.8424648, 0.9378516, 1.095945, 0.7450981, 0, 1, 1,
0.8486584, 0.5473316, 1.114329, 0.7529412, 0, 1, 1,
0.8506669, -0.5277666, 2.633654, 0.7568628, 0, 1, 1,
0.8533414, 0.4409059, 0.6232469, 0.7647059, 0, 1, 1,
0.8561723, -0.6314121, 0.913392, 0.7686275, 0, 1, 1,
0.8563739, 0.524352, 0.6549158, 0.7764706, 0, 1, 1,
0.8577593, -0.1563113, 2.62643, 0.7803922, 0, 1, 1,
0.8596421, -0.9421499, 1.776051, 0.7882353, 0, 1, 1,
0.8602865, 0.8083181, 1.377257, 0.7921569, 0, 1, 1,
0.8615458, 0.4643622, -0.1723228, 0.8, 0, 1, 1,
0.8658862, 1.134849, 0.09003031, 0.8078431, 0, 1, 1,
0.8661434, 0.6792435, -0.5827059, 0.8117647, 0, 1, 1,
0.8668276, -1.38859, 1.586441, 0.8196079, 0, 1, 1,
0.870043, -1.389542, 2.433156, 0.8235294, 0, 1, 1,
0.8707905, -0.2070543, 2.116639, 0.8313726, 0, 1, 1,
0.8746483, -0.5014811, 2.008713, 0.8352941, 0, 1, 1,
0.8765041, -1.074923, -0.1194717, 0.8431373, 0, 1, 1,
0.8765449, -0.09030658, 1.466394, 0.8470588, 0, 1, 1,
0.8786722, -1.597934, 2.798034, 0.854902, 0, 1, 1,
0.8810189, 1.109013, 2.600389, 0.8588235, 0, 1, 1,
0.8823692, 1.388739, 1.378392, 0.8666667, 0, 1, 1,
0.8826323, -0.216534, 0.01781365, 0.8705882, 0, 1, 1,
0.8863381, -1.003443, 1.707409, 0.8784314, 0, 1, 1,
0.8877519, -0.3537751, 2.472834, 0.8823529, 0, 1, 1,
0.8884544, -0.2750322, 1.327587, 0.8901961, 0, 1, 1,
0.8914647, -1.398273, 4.475916, 0.8941177, 0, 1, 1,
0.8989829, 0.07526413, -0.2275615, 0.9019608, 0, 1, 1,
0.914183, 0.6888346, 1.679639, 0.9098039, 0, 1, 1,
0.9186916, 1.767576, 1.386158, 0.9137255, 0, 1, 1,
0.9224759, -0.08566591, 1.70935, 0.9215686, 0, 1, 1,
0.9242967, 0.8107248, 2.874954, 0.9254902, 0, 1, 1,
0.9311558, -1.949547, 3.373719, 0.9333333, 0, 1, 1,
0.9344462, -0.9217167, 1.787373, 0.9372549, 0, 1, 1,
0.9354553, 0.5204137, 0.9370856, 0.945098, 0, 1, 1,
0.9372873, 0.2185218, 1.082617, 0.9490196, 0, 1, 1,
0.9375004, 0.1893477, 2.828649, 0.9568627, 0, 1, 1,
0.9377916, -0.8379723, 2.561222, 0.9607843, 0, 1, 1,
0.9400021, -0.6242633, 0.9745684, 0.9686275, 0, 1, 1,
0.9510188, 0.5308785, 0.115123, 0.972549, 0, 1, 1,
0.951994, -0.8831212, 2.84826, 0.9803922, 0, 1, 1,
0.9598137, -0.5115598, 2.374777, 0.9843137, 0, 1, 1,
0.9672989, 0.6248791, 2.128905, 0.9921569, 0, 1, 1,
0.9715834, 0.7814265, 2.185795, 0.9960784, 0, 1, 1,
0.9740645, -0.3764494, 2.375984, 1, 0, 0.9960784, 1,
0.9761538, 1.525363, 0.5223597, 1, 0, 0.9882353, 1,
0.9776374, 2.009545, -0.006631684, 1, 0, 0.9843137, 1,
0.9796435, -0.09350758, 3.440545, 1, 0, 0.9764706, 1,
0.9828444, 0.5489568, 1.839338, 1, 0, 0.972549, 1,
0.9894593, 0.4183971, 0.6618811, 1, 0, 0.9647059, 1,
0.9895008, 2.776963, 0.1262066, 1, 0, 0.9607843, 1,
0.9904901, 0.9763321, 1.368737, 1, 0, 0.9529412, 1,
0.9909643, 0.9015223, -1.837666, 1, 0, 0.9490196, 1,
0.9920626, -0.5069582, 2.714137, 1, 0, 0.9411765, 1,
0.9950484, -0.4704228, 2.660626, 1, 0, 0.9372549, 1,
0.9997466, 1.410497, -0.457155, 1, 0, 0.9294118, 1,
1.004042, 1.570072, 2.055719, 1, 0, 0.9254902, 1,
1.011046, 0.8139248, 0.7526085, 1, 0, 0.9176471, 1,
1.013533, 0.5319675, -0.1636636, 1, 0, 0.9137255, 1,
1.02784, -0.005286723, 3.474231, 1, 0, 0.9058824, 1,
1.029737, -0.7194675, 2.903855, 1, 0, 0.9019608, 1,
1.029898, 0.9953707, 0.9591763, 1, 0, 0.8941177, 1,
1.033066, -0.242213, 2.322409, 1, 0, 0.8862745, 1,
1.038519, -1.127764, 1.398444, 1, 0, 0.8823529, 1,
1.050748, -1.098817, 2.080517, 1, 0, 0.8745098, 1,
1.065098, -2.381464, 2.836112, 1, 0, 0.8705882, 1,
1.073315, 0.3675503, -2.165124, 1, 0, 0.8627451, 1,
1.077938, 0.5949722, -0.07688598, 1, 0, 0.8588235, 1,
1.07972, 0.1583052, 0.7827292, 1, 0, 0.8509804, 1,
1.082839, 1.262778, 1.189041, 1, 0, 0.8470588, 1,
1.105318, 0.5073922, -0.04423943, 1, 0, 0.8392157, 1,
1.110209, 0.7232738, 1.001243, 1, 0, 0.8352941, 1,
1.110702, -0.9810314, 0.7603315, 1, 0, 0.827451, 1,
1.112376, 1.57939, -1.735046, 1, 0, 0.8235294, 1,
1.116816, -0.1721062, 0.831062, 1, 0, 0.8156863, 1,
1.119027, 0.4159139, 1.077838, 1, 0, 0.8117647, 1,
1.121986, 0.728061, 1.349413, 1, 0, 0.8039216, 1,
1.122175, -0.01605064, 1.823233, 1, 0, 0.7960784, 1,
1.125243, 1.822883, 0.1077636, 1, 0, 0.7921569, 1,
1.127934, -0.3028847, 1.976929, 1, 0, 0.7843137, 1,
1.130118, -0.3256422, 0.4227761, 1, 0, 0.7803922, 1,
1.131021, -0.3481144, 2.453805, 1, 0, 0.772549, 1,
1.136494, 0.8389934, -0.262379, 1, 0, 0.7686275, 1,
1.136511, -1.666262, 3.854306, 1, 0, 0.7607843, 1,
1.137655, 0.7923811, 1.523075, 1, 0, 0.7568628, 1,
1.139701, -0.3620219, 2.769996, 1, 0, 0.7490196, 1,
1.148036, 0.7325565, 1.688633, 1, 0, 0.7450981, 1,
1.152298, 0.06485915, 2.847758, 1, 0, 0.7372549, 1,
1.155234, 0.4636707, 1.498128, 1, 0, 0.7333333, 1,
1.155456, 1.584611, 0.7835451, 1, 0, 0.7254902, 1,
1.156875, -0.4704271, 2.014097, 1, 0, 0.7215686, 1,
1.157923, -0.6760524, 1.070105, 1, 0, 0.7137255, 1,
1.169505, 0.6627177, 1.231158, 1, 0, 0.7098039, 1,
1.179273, -0.3852002, 1.461034, 1, 0, 0.7019608, 1,
1.189376, -1.720931, 3.181428, 1, 0, 0.6941177, 1,
1.189956, 0.7720777, 1.061813, 1, 0, 0.6901961, 1,
1.193686, -0.3144722, 3.186531, 1, 0, 0.682353, 1,
1.200266, 0.4462298, 0.5256345, 1, 0, 0.6784314, 1,
1.200561, -1.580902, 3.060982, 1, 0, 0.6705883, 1,
1.203676, 2.151656, 0.4139188, 1, 0, 0.6666667, 1,
1.208109, 0.02768264, 2.289372, 1, 0, 0.6588235, 1,
1.209566, 1.23406, 0.8913648, 1, 0, 0.654902, 1,
1.216311, -1.060309, 2.798417, 1, 0, 0.6470588, 1,
1.219308, 1.214201, 0.2580038, 1, 0, 0.6431373, 1,
1.220903, -0.7678524, 3.261428, 1, 0, 0.6352941, 1,
1.223845, 0.1742574, 1.165634, 1, 0, 0.6313726, 1,
1.231806, 0.3923283, 2.302273, 1, 0, 0.6235294, 1,
1.234014, 0.6621583, 1.599042, 1, 0, 0.6196079, 1,
1.241594, 0.3944127, 1.095439, 1, 0, 0.6117647, 1,
1.251156, -0.5525739, 4.941449, 1, 0, 0.6078432, 1,
1.253825, -0.6051221, 1.702929, 1, 0, 0.6, 1,
1.271636, -1.488732, 3.260375, 1, 0, 0.5921569, 1,
1.272012, -0.428669, 4.039041, 1, 0, 0.5882353, 1,
1.300048, -0.7161917, 3.240723, 1, 0, 0.5803922, 1,
1.304676, -2.087733, 3.030653, 1, 0, 0.5764706, 1,
1.309083, -0.4812948, 2.611451, 1, 0, 0.5686275, 1,
1.310276, -0.6162221, 2.894835, 1, 0, 0.5647059, 1,
1.310422, -0.1967394, 2.645864, 1, 0, 0.5568628, 1,
1.313662, -0.8872063, 2.033727, 1, 0, 0.5529412, 1,
1.326842, -0.2150525, 1.302002, 1, 0, 0.5450981, 1,
1.328711, 1.001973, 0.02502968, 1, 0, 0.5411765, 1,
1.329199, 0.7961914, 0.4086238, 1, 0, 0.5333334, 1,
1.341179, 0.1942773, 0.9394369, 1, 0, 0.5294118, 1,
1.350075, 1.2173, 2.110285, 1, 0, 0.5215687, 1,
1.353019, 1.220873, 1.190558, 1, 0, 0.5176471, 1,
1.355962, 1.226443, 1.531542, 1, 0, 0.509804, 1,
1.357322, -0.5085224, 2.075521, 1, 0, 0.5058824, 1,
1.36234, 0.4311621, 1.884324, 1, 0, 0.4980392, 1,
1.371272, -0.5353099, 3.132295, 1, 0, 0.4901961, 1,
1.374448, 1.901836, -0.8120882, 1, 0, 0.4862745, 1,
1.375674, -1.089063, 1.08937, 1, 0, 0.4784314, 1,
1.379903, -1.816824, 2.553624, 1, 0, 0.4745098, 1,
1.392235, -2.153488, 2.872535, 1, 0, 0.4666667, 1,
1.40619, 0.4592823, 1.005654, 1, 0, 0.4627451, 1,
1.415319, -2.130424, 3.979466, 1, 0, 0.454902, 1,
1.420194, 0.4616401, 2.633585, 1, 0, 0.4509804, 1,
1.423873, -0.7273796, 0.3403542, 1, 0, 0.4431373, 1,
1.429615, -2.132797, 3.605349, 1, 0, 0.4392157, 1,
1.430973, 1.210025, 1.38927, 1, 0, 0.4313726, 1,
1.430977, 0.7161976, -0.2042285, 1, 0, 0.427451, 1,
1.432617, -0.4008053, 1.882009, 1, 0, 0.4196078, 1,
1.436727, 0.6120535, 2.13623, 1, 0, 0.4156863, 1,
1.442575, 0.7309533, 1.941456, 1, 0, 0.4078431, 1,
1.46341, -1.084903, 1.535509, 1, 0, 0.4039216, 1,
1.471245, 1.124017, 1.023834, 1, 0, 0.3960784, 1,
1.490225, 1.641461, 1.524631, 1, 0, 0.3882353, 1,
1.502627, 0.04706973, 3.074297, 1, 0, 0.3843137, 1,
1.508806, 0.3117613, 1.210028, 1, 0, 0.3764706, 1,
1.510596, 1.842547, -1.925753, 1, 0, 0.372549, 1,
1.511829, -1.328072, 3.369819, 1, 0, 0.3647059, 1,
1.512929, -0.7699052, 0.6793952, 1, 0, 0.3607843, 1,
1.516921, -0.6493953, 1.495087, 1, 0, 0.3529412, 1,
1.521249, 1.043756, 1.696789, 1, 0, 0.3490196, 1,
1.526611, 0.7153236, 0.5170201, 1, 0, 0.3411765, 1,
1.53497, -0.2653646, 1.776693, 1, 0, 0.3372549, 1,
1.556165, 0.4596156, 0.8214002, 1, 0, 0.3294118, 1,
1.572961, -0.5939347, 0.9086661, 1, 0, 0.3254902, 1,
1.592658, 1.527735, 1.661784, 1, 0, 0.3176471, 1,
1.602875, -1.689748, 2.430702, 1, 0, 0.3137255, 1,
1.607839, -0.1559862, 1.00347, 1, 0, 0.3058824, 1,
1.612496, -0.0375808, 2.156353, 1, 0, 0.2980392, 1,
1.654336, 0.6616991, 2.754608, 1, 0, 0.2941177, 1,
1.658875, 0.4746285, 1.961233, 1, 0, 0.2862745, 1,
1.675754, 0.9265367, 2.035161, 1, 0, 0.282353, 1,
1.694657, -0.821322, 3.14758, 1, 0, 0.2745098, 1,
1.699698, 0.104678, 1.024053, 1, 0, 0.2705882, 1,
1.721091, -0.02350306, 3.290758, 1, 0, 0.2627451, 1,
1.72412, -0.5381693, 3.795838, 1, 0, 0.2588235, 1,
1.725647, 0.2456928, 2.772173, 1, 0, 0.2509804, 1,
1.743647, -2.128225, 1.43815, 1, 0, 0.2470588, 1,
1.748856, 0.4785059, 0.8010103, 1, 0, 0.2392157, 1,
1.754676, 0.6544219, 0.724614, 1, 0, 0.2352941, 1,
1.755443, -0.1436772, 0.5498415, 1, 0, 0.227451, 1,
1.772526, 0.2017723, 1.828155, 1, 0, 0.2235294, 1,
1.814016, 0.6659826, 1.035936, 1, 0, 0.2156863, 1,
1.823428, -1.500363, 3.542746, 1, 0, 0.2117647, 1,
1.846482, -0.3465277, 3.400184, 1, 0, 0.2039216, 1,
1.862041, 0.8025165, 2.062758, 1, 0, 0.1960784, 1,
1.880408, -1.573906, 3.356993, 1, 0, 0.1921569, 1,
1.88832, -0.8071617, 2.955226, 1, 0, 0.1843137, 1,
1.89201, -0.479467, 3.253344, 1, 0, 0.1803922, 1,
1.895099, 0.1519801, 0.3116378, 1, 0, 0.172549, 1,
1.901765, -2.966466, 2.463288, 1, 0, 0.1686275, 1,
1.932119, -1.253024, 3.202091, 1, 0, 0.1607843, 1,
2.011841, -0.3997031, 0.7755931, 1, 0, 0.1568628, 1,
2.012228, -1.664179, 2.280641, 1, 0, 0.1490196, 1,
2.021641, 0.2818529, 0.7384441, 1, 0, 0.145098, 1,
2.021719, -1.342298, 2.06888, 1, 0, 0.1372549, 1,
2.051807, -1.251502, 1.006157, 1, 0, 0.1333333, 1,
2.067727, 1.188537, 0.116278, 1, 0, 0.1254902, 1,
2.08646, -1.441009, 2.867698, 1, 0, 0.1215686, 1,
2.154859, -0.2664535, 1.561188, 1, 0, 0.1137255, 1,
2.218879, -0.5203424, 2.015093, 1, 0, 0.1098039, 1,
2.22597, -0.3803656, 2.09497, 1, 0, 0.1019608, 1,
2.262348, -0.3666592, 1.512777, 1, 0, 0.09411765, 1,
2.273576, 0.06022543, 1.007128, 1, 0, 0.09019608, 1,
2.28773, -2.64215, 1.105922, 1, 0, 0.08235294, 1,
2.311963, 1.76542, 0.02531403, 1, 0, 0.07843138, 1,
2.343851, -0.07779113, 0.2083896, 1, 0, 0.07058824, 1,
2.398443, -0.9115175, 2.43191, 1, 0, 0.06666667, 1,
2.408106, 0.3934688, 1.499773, 1, 0, 0.05882353, 1,
2.409915, -0.9903982, 3.105097, 1, 0, 0.05490196, 1,
2.417484, 0.5614681, 1.778681, 1, 0, 0.04705882, 1,
2.458349, 0.03713506, 1.561321, 1, 0, 0.04313726, 1,
2.558452, -0.8271462, -0.5558108, 1, 0, 0.03529412, 1,
2.606896, -0.3665579, 3.591509, 1, 0, 0.03137255, 1,
2.648343, 2.125898, 1.061245, 1, 0, 0.02352941, 1,
2.67253, 2.746468, 2.753146, 1, 0, 0.01960784, 1,
2.849107, 1.648734, 1.765865, 1, 0, 0.01176471, 1,
2.92964, 0.9337087, 0.2718882, 1, 0, 0.007843138, 1
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
-0.2039759, -4.444803, -7.24817, 0, -0.5, 0.5, 0.5,
-0.2039759, -4.444803, -7.24817, 1, -0.5, 0.5, 0.5,
-0.2039759, -4.444803, -7.24817, 1, 1.5, 0.5, 0.5,
-0.2039759, -4.444803, -7.24817, 0, 1.5, 0.5, 0.5
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
-4.399887, 0.00519383, -7.24817, 0, -0.5, 0.5, 0.5,
-4.399887, 0.00519383, -7.24817, 1, -0.5, 0.5, 0.5,
-4.399887, 0.00519383, -7.24817, 1, 1.5, 0.5, 0.5,
-4.399887, 0.00519383, -7.24817, 0, 1.5, 0.5, 0.5
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
-4.399887, -4.444803, 0.1490657, 0, -0.5, 0.5, 0.5,
-4.399887, -4.444803, 0.1490657, 1, -0.5, 0.5, 0.5,
-4.399887, -4.444803, 0.1490657, 1, 1.5, 0.5, 0.5,
-4.399887, -4.444803, 0.1490657, 0, 1.5, 0.5, 0.5
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
-3, -3.417881, -5.541116,
2, -3.417881, -5.541116,
-3, -3.417881, -5.541116,
-3, -3.589035, -5.825625,
-2, -3.417881, -5.541116,
-2, -3.589035, -5.825625,
-1, -3.417881, -5.541116,
-1, -3.589035, -5.825625,
0, -3.417881, -5.541116,
0, -3.589035, -5.825625,
1, -3.417881, -5.541116,
1, -3.589035, -5.825625,
2, -3.417881, -5.541116,
2, -3.589035, -5.825625
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
-3, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
-3, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
-3, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
-3, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5,
-2, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
-2, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
-2, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
-2, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5,
-1, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
-1, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
-1, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
-1, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5,
0, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
0, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
0, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
0, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5,
1, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
1, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
1, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
1, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5,
2, -3.931342, -6.394643, 0, -0.5, 0.5, 0.5,
2, -3.931342, -6.394643, 1, -0.5, 0.5, 0.5,
2, -3.931342, -6.394643, 1, 1.5, 0.5, 0.5,
2, -3.931342, -6.394643, 0, 1.5, 0.5, 0.5
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
-3.4316, -3, -5.541116,
-3.4316, 3, -5.541116,
-3.4316, -3, -5.541116,
-3.592981, -3, -5.825625,
-3.4316, -2, -5.541116,
-3.592981, -2, -5.825625,
-3.4316, -1, -5.541116,
-3.592981, -1, -5.825625,
-3.4316, 0, -5.541116,
-3.592981, 0, -5.825625,
-3.4316, 1, -5.541116,
-3.592981, 1, -5.825625,
-3.4316, 2, -5.541116,
-3.592981, 2, -5.825625,
-3.4316, 3, -5.541116,
-3.592981, 3, -5.825625
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
-3.915743, -3, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, -3, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, -3, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, -3, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, -2, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, -2, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, -2, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, -2, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, -1, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, -1, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, -1, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, -1, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, 0, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, 0, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, 0, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, 0, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, 1, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, 1, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, 1, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, 1, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, 2, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, 2, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, 2, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, 2, -6.394643, 0, 1.5, 0.5, 0.5,
-3.915743, 3, -6.394643, 0, -0.5, 0.5, 0.5,
-3.915743, 3, -6.394643, 1, -0.5, 0.5, 0.5,
-3.915743, 3, -6.394643, 1, 1.5, 0.5, 0.5,
-3.915743, 3, -6.394643, 0, 1.5, 0.5, 0.5
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
-3.4316, -3.417881, -4,
-3.4316, -3.417881, 4,
-3.4316, -3.417881, -4,
-3.592981, -3.589035, -4,
-3.4316, -3.417881, -2,
-3.592981, -3.589035, -2,
-3.4316, -3.417881, 0,
-3.592981, -3.589035, 0,
-3.4316, -3.417881, 2,
-3.592981, -3.589035, 2,
-3.4316, -3.417881, 4,
-3.592981, -3.589035, 4
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
-3.915743, -3.931342, -4, 0, -0.5, 0.5, 0.5,
-3.915743, -3.931342, -4, 1, -0.5, 0.5, 0.5,
-3.915743, -3.931342, -4, 1, 1.5, 0.5, 0.5,
-3.915743, -3.931342, -4, 0, 1.5, 0.5, 0.5,
-3.915743, -3.931342, -2, 0, -0.5, 0.5, 0.5,
-3.915743, -3.931342, -2, 1, -0.5, 0.5, 0.5,
-3.915743, -3.931342, -2, 1, 1.5, 0.5, 0.5,
-3.915743, -3.931342, -2, 0, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 0, 0, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 0, 1, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 0, 1, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 0, 0, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 2, 0, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 2, 1, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 2, 1, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 2, 0, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 4, 0, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 4, 1, -0.5, 0.5, 0.5,
-3.915743, -3.931342, 4, 1, 1.5, 0.5, 0.5,
-3.915743, -3.931342, 4, 0, 1.5, 0.5, 0.5
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
-3.4316, -3.417881, -5.541116,
-3.4316, 3.428268, -5.541116,
-3.4316, -3.417881, 5.839247,
-3.4316, 3.428268, 5.839247,
-3.4316, -3.417881, -5.541116,
-3.4316, -3.417881, 5.839247,
-3.4316, 3.428268, -5.541116,
-3.4316, 3.428268, 5.839247,
-3.4316, -3.417881, -5.541116,
3.023648, -3.417881, -5.541116,
-3.4316, -3.417881, 5.839247,
3.023648, -3.417881, 5.839247,
-3.4316, 3.428268, -5.541116,
3.023648, 3.428268, -5.541116,
-3.4316, 3.428268, 5.839247,
3.023648, 3.428268, 5.839247,
3.023648, -3.417881, -5.541116,
3.023648, 3.428268, -5.541116,
3.023648, -3.417881, 5.839247,
3.023648, 3.428268, 5.839247,
3.023648, -3.417881, -5.541116,
3.023648, -3.417881, 5.839247,
3.023648, 3.428268, -5.541116,
3.023648, 3.428268, 5.839247
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
var radius = 7.885081;
var distance = 35.08162;
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
mvMatrix.translate( 0.2039759, -0.00519383, -0.1490657 );
mvMatrix.scale( 1.320709, 1.245299, 0.7491416 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08162);
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
4-nitrophenyl_ether<-read.table("4-nitrophenyl_ether.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-4-nitrophenyl_ether$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrophenyl_ether' not found
```

```r
y<-4-nitrophenyl_ether$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrophenyl_ether' not found
```

```r
z<-4-nitrophenyl_ether$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrophenyl_ether' not found
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
-3.337591, -1.995312, -1.951865, 0, 0, 1, 1, 1,
-3.110539, 0.4225788, -0.5493707, 1, 0, 0, 1, 1,
-2.864636, -0.6509733, -2.907866, 1, 0, 0, 1, 1,
-2.742332, 1.239499, -0.6405489, 1, 0, 0, 1, 1,
-2.46017, -0.6987665, -2.344413, 1, 0, 0, 1, 1,
-2.427667, 0.3916847, -3.644734, 1, 0, 0, 1, 1,
-2.290256, -0.5042351, -1.11763, 0, 0, 0, 1, 1,
-2.265972, -1.78891, -1.228185, 0, 0, 0, 1, 1,
-2.170522, 0.7183596, 0.5955465, 0, 0, 0, 1, 1,
-2.157853, -0.2784257, -1.810734, 0, 0, 0, 1, 1,
-2.084979, -0.4934088, -0.9364633, 0, 0, 0, 1, 1,
-2.055476, 0.9067275, -2.110561, 0, 0, 0, 1, 1,
-2.02546, -0.8512778, -3.381907, 0, 0, 0, 1, 1,
-1.991269, -0.2902146, -0.7858671, 1, 1, 1, 1, 1,
-1.99008, 0.4804542, -0.8016855, 1, 1, 1, 1, 1,
-1.954227, -0.5132173, -0.9330658, 1, 1, 1, 1, 1,
-1.943187, -0.44512, -2.501508, 1, 1, 1, 1, 1,
-1.941407, 0.05272773, -1.624999, 1, 1, 1, 1, 1,
-1.930742, -0.6698903, -1.346713, 1, 1, 1, 1, 1,
-1.928416, 0.2850626, -1.691797, 1, 1, 1, 1, 1,
-1.912685, -2.052934, -2.121333, 1, 1, 1, 1, 1,
-1.907682, 0.8206854, -0.9031152, 1, 1, 1, 1, 1,
-1.907547, 2.002974, -0.5629291, 1, 1, 1, 1, 1,
-1.898063, -1.878338, -5.017219, 1, 1, 1, 1, 1,
-1.885088, -0.1191093, -0.9867095, 1, 1, 1, 1, 1,
-1.869864, 0.2134424, -1.566026, 1, 1, 1, 1, 1,
-1.864357, -1.583301, -3.257209, 1, 1, 1, 1, 1,
-1.859625, -0.8094718, -0.5504525, 1, 1, 1, 1, 1,
-1.853453, -0.3551963, -0.8829546, 0, 0, 1, 1, 1,
-1.832238, 1.026103, -1.809312, 1, 0, 0, 1, 1,
-1.826962, 1.91766, -0.7251367, 1, 0, 0, 1, 1,
-1.810295, -0.308698, -2.934036, 1, 0, 0, 1, 1,
-1.792331, 0.2470433, -0.8640516, 1, 0, 0, 1, 1,
-1.790561, 0.8515035, -0.9046495, 1, 0, 0, 1, 1,
-1.784974, 0.7252824, -0.6061641, 0, 0, 0, 1, 1,
-1.758718, 0.4637324, -2.821373, 0, 0, 0, 1, 1,
-1.757143, 1.220591, -0.6609432, 0, 0, 0, 1, 1,
-1.735044, -0.2171041, -2.242116, 0, 0, 0, 1, 1,
-1.732405, -0.773917, -2.236023, 0, 0, 0, 1, 1,
-1.725773, -0.9379243, -1.852183, 0, 0, 0, 1, 1,
-1.712237, 0.2547548, -0.08522996, 0, 0, 0, 1, 1,
-1.698375, 0.3909467, -1.480452, 1, 1, 1, 1, 1,
-1.697066, 0.950007, -1.358834, 1, 1, 1, 1, 1,
-1.689476, -0.2396408, -1.144689, 1, 1, 1, 1, 1,
-1.655337, 0.234207, -3.044518, 1, 1, 1, 1, 1,
-1.651185, -1.390999, -3.001546, 1, 1, 1, 1, 1,
-1.632809, -0.6481294, 0.1335321, 1, 1, 1, 1, 1,
-1.628174, 1.982936, -1.244145, 1, 1, 1, 1, 1,
-1.622887, -0.03399016, -0.3443579, 1, 1, 1, 1, 1,
-1.572747, 0.3334729, 0.09898369, 1, 1, 1, 1, 1,
-1.564881, 0.8191049, -1.263978, 1, 1, 1, 1, 1,
-1.556292, 1.394258, -0.1022342, 1, 1, 1, 1, 1,
-1.53384, -0.3895411, 0.05898815, 1, 1, 1, 1, 1,
-1.525646, -0.3659585, -3.227099, 1, 1, 1, 1, 1,
-1.515287, -1.291601, -2.391897, 1, 1, 1, 1, 1,
-1.512595, 0.841916, -2.374372, 1, 1, 1, 1, 1,
-1.486208, 1.390014, -0.5021492, 0, 0, 1, 1, 1,
-1.474801, 0.07623342, 0.9174709, 1, 0, 0, 1, 1,
-1.466228, 0.6939608, -2.32898, 1, 0, 0, 1, 1,
-1.452198, 0.3849137, -3.783198, 1, 0, 0, 1, 1,
-1.449109, -0.5267103, -2.210748, 1, 0, 0, 1, 1,
-1.444689, 0.1532034, -1.828709, 1, 0, 0, 1, 1,
-1.442225, -0.8586279, -1.441975, 0, 0, 0, 1, 1,
-1.42697, 1.143243, -0.2819703, 0, 0, 0, 1, 1,
-1.419093, -0.7183447, -1.762729, 0, 0, 0, 1, 1,
-1.418796, 1.520566, 0.6205258, 0, 0, 0, 1, 1,
-1.40839, 0.3804863, -1.840454, 0, 0, 0, 1, 1,
-1.406602, 1.215527, 0.1519192, 0, 0, 0, 1, 1,
-1.396009, 0.4699625, -2.710876, 0, 0, 0, 1, 1,
-1.394366, 1.865574, -0.4823802, 1, 1, 1, 1, 1,
-1.393937, -0.5995587, -0.1351941, 1, 1, 1, 1, 1,
-1.387994, 0.9863827, -0.9554217, 1, 1, 1, 1, 1,
-1.382987, -0.03326306, -1.36735, 1, 1, 1, 1, 1,
-1.370188, 1.466797, 0.1530488, 1, 1, 1, 1, 1,
-1.35512, -1.469342, -2.778735, 1, 1, 1, 1, 1,
-1.34478, -1.863666, -0.7969498, 1, 1, 1, 1, 1,
-1.342549, 1.119469, 0.6298601, 1, 1, 1, 1, 1,
-1.336164, -1.603927, -3.675793, 1, 1, 1, 1, 1,
-1.333962, 0.2217312, -1.000322, 1, 1, 1, 1, 1,
-1.333574, -0.8205461, -1.584013, 1, 1, 1, 1, 1,
-1.329361, 0.376395, -2.250742, 1, 1, 1, 1, 1,
-1.328856, -0.9107848, -3.085015, 1, 1, 1, 1, 1,
-1.324288, -0.3268467, -1.897997, 1, 1, 1, 1, 1,
-1.32148, 0.5260677, -3.045317, 1, 1, 1, 1, 1,
-1.316824, -0.8178633, -2.95652, 0, 0, 1, 1, 1,
-1.301309, -1.504687, -2.540192, 1, 0, 0, 1, 1,
-1.299115, 0.03879276, -2.087752, 1, 0, 0, 1, 1,
-1.290244, 1.920321, -1.385276, 1, 0, 0, 1, 1,
-1.280723, -1.110911, -0.5796456, 1, 0, 0, 1, 1,
-1.270535, -0.2162715, -1.754291, 1, 0, 0, 1, 1,
-1.270285, 0.09320464, -2.100556, 0, 0, 0, 1, 1,
-1.266337, 0.2370663, -1.723774, 0, 0, 0, 1, 1,
-1.266336, 0.7111896, -1.686397, 0, 0, 0, 1, 1,
-1.263077, 1.369494, -0.3871413, 0, 0, 0, 1, 1,
-1.255727, 1.556106, -2.351175, 0, 0, 0, 1, 1,
-1.245896, -1.724417, -3.161588, 0, 0, 0, 1, 1,
-1.231592, -1.525329, -2.378871, 0, 0, 0, 1, 1,
-1.2183, 1.36479, 0.4729017, 1, 1, 1, 1, 1,
-1.215016, -0.3362771, -0.979089, 1, 1, 1, 1, 1,
-1.213693, -0.2452691, -0.7805964, 1, 1, 1, 1, 1,
-1.201959, 1.790124, 0.7011601, 1, 1, 1, 1, 1,
-1.196563, 0.5045826, -0.04972594, 1, 1, 1, 1, 1,
-1.196391, -1.698837, -2.034564, 1, 1, 1, 1, 1,
-1.195453, -1.490831, -2.46677, 1, 1, 1, 1, 1,
-1.180781, -1.054021, -2.274257, 1, 1, 1, 1, 1,
-1.165875, -1.318778, -2.981033, 1, 1, 1, 1, 1,
-1.165322, -0.8195364, -1.724191, 1, 1, 1, 1, 1,
-1.164262, -1.160067, -1.820746, 1, 1, 1, 1, 1,
-1.163315, 0.1505343, -1.608548, 1, 1, 1, 1, 1,
-1.15857, 1.354077, -0.2426787, 1, 1, 1, 1, 1,
-1.152077, 1.361708, -3.238897, 1, 1, 1, 1, 1,
-1.148574, 1.182856, -2.49107, 1, 1, 1, 1, 1,
-1.141307, 0.05284846, -0.6886151, 0, 0, 1, 1, 1,
-1.139884, -0.2868971, -3.077166, 1, 0, 0, 1, 1,
-1.134628, -1.593739, -2.783747, 1, 0, 0, 1, 1,
-1.128159, -0.5278634, -2.467791, 1, 0, 0, 1, 1,
-1.126424, -0.00700432, -0.7008317, 1, 0, 0, 1, 1,
-1.124125, -0.9248214, -1.487529, 1, 0, 0, 1, 1,
-1.117303, 0.9081646, -1.637785, 0, 0, 0, 1, 1,
-1.11413, 0.1357295, 0.1976756, 0, 0, 0, 1, 1,
-1.095696, 0.05445876, -1.773419, 0, 0, 0, 1, 1,
-1.090122, 0.3034424, -0.4620805, 0, 0, 0, 1, 1,
-1.089003, 0.3137789, 1.31896, 0, 0, 0, 1, 1,
-1.085863, 0.2659113, -2.12092, 0, 0, 0, 1, 1,
-1.084544, -0.94828, -2.850554, 0, 0, 0, 1, 1,
-1.082648, 0.06944654, -0.1012592, 1, 1, 1, 1, 1,
-1.080735, -0.3663388, 0.08324806, 1, 1, 1, 1, 1,
-1.078553, -1.073785, -3.860166, 1, 1, 1, 1, 1,
-1.075696, 0.7394457, -0.2880507, 1, 1, 1, 1, 1,
-1.069275, -0.949559, -2.690644, 1, 1, 1, 1, 1,
-1.060958, 0.8343316, -0.360904, 1, 1, 1, 1, 1,
-1.059827, -1.030355, -3.322525, 1, 1, 1, 1, 1,
-1.050586, 0.7445896, -0.4983948, 1, 1, 1, 1, 1,
-1.042342, 1.827315, -0.8274707, 1, 1, 1, 1, 1,
-1.039455, -1.147706, -4.243992, 1, 1, 1, 1, 1,
-1.03689, -1.431068, -3.505466, 1, 1, 1, 1, 1,
-1.033158, 0.6397548, 0.3850316, 1, 1, 1, 1, 1,
-1.023615, -0.3346314, -2.077188, 1, 1, 1, 1, 1,
-1.019203, 0.7934132, -1.745587, 1, 1, 1, 1, 1,
-1.005874, -0.06782, -1.751651, 1, 1, 1, 1, 1,
-0.995658, -0.3177457, -2.516423, 0, 0, 1, 1, 1,
-0.9943126, -1.101402, -3.686985, 1, 0, 0, 1, 1,
-0.988448, -0.7879559, -1.725165, 1, 0, 0, 1, 1,
-0.9860456, 1.279457, -0.03380746, 1, 0, 0, 1, 1,
-0.9858056, -0.9122614, -1.032734, 1, 0, 0, 1, 1,
-0.9814216, 3.032253, -1.159485, 1, 0, 0, 1, 1,
-0.977159, 1.621024, -0.9977224, 0, 0, 0, 1, 1,
-0.9475638, -1.070508, -2.663869, 0, 0, 0, 1, 1,
-0.9437137, 0.6488255, -0.1726817, 0, 0, 0, 1, 1,
-0.9436812, -1.815994, -1.436621, 0, 0, 0, 1, 1,
-0.9392903, -0.3684591, -1.789213, 0, 0, 0, 1, 1,
-0.9386199, -0.9359386, -3.039921, 0, 0, 0, 1, 1,
-0.9383128, 1.804136, -0.5997581, 0, 0, 0, 1, 1,
-0.9377962, 0.1280084, -1.156086, 1, 1, 1, 1, 1,
-0.9214664, 0.3570673, 0.7796547, 1, 1, 1, 1, 1,
-0.9182874, -0.1415858, 0.280268, 1, 1, 1, 1, 1,
-0.9171916, 1.139727, -1.269601, 1, 1, 1, 1, 1,
-0.9164354, -1.478207, -1.114263, 1, 1, 1, 1, 1,
-0.9131028, -2.049621, -2.083355, 1, 1, 1, 1, 1,
-0.9084827, -0.110186, -1.829624, 1, 1, 1, 1, 1,
-0.9081996, 0.5317138, -1.430656, 1, 1, 1, 1, 1,
-0.9033353, -1.065925, -1.420251, 1, 1, 1, 1, 1,
-0.9018641, 1.458712, -2.191363, 1, 1, 1, 1, 1,
-0.8996728, 0.4901353, -1.949028, 1, 1, 1, 1, 1,
-0.8954574, 0.9469248, -1.104641, 1, 1, 1, 1, 1,
-0.8914342, -0.1701651, -0.62145, 1, 1, 1, 1, 1,
-0.8868888, -1.381104, -2.009175, 1, 1, 1, 1, 1,
-0.8861668, -0.3483979, -1.050821, 1, 1, 1, 1, 1,
-0.8723477, 0.006657176, 0.460253, 0, 0, 1, 1, 1,
-0.870608, 0.7373634, -2.089315, 1, 0, 0, 1, 1,
-0.864609, 1.696314, -1.091151, 1, 0, 0, 1, 1,
-0.8630439, -1.420539, -1.824256, 1, 0, 0, 1, 1,
-0.8599183, 0.3018512, -0.8206517, 1, 0, 0, 1, 1,
-0.8594177, 0.9741149, -0.3313928, 1, 0, 0, 1, 1,
-0.8580427, 0.4189081, 0.3759169, 0, 0, 0, 1, 1,
-0.8522177, -1.080146, -0.9193051, 0, 0, 0, 1, 1,
-0.8482386, 0.9603043, 1.206008, 0, 0, 0, 1, 1,
-0.8447527, 1.07938, 0.5206329, 0, 0, 0, 1, 1,
-0.8397615, -1.098363, -3.144153, 0, 0, 0, 1, 1,
-0.8336416, 1.234144, 0.00818426, 0, 0, 0, 1, 1,
-0.8323023, 0.9250054, -1.180063, 0, 0, 0, 1, 1,
-0.8279314, 0.2555724, 0.1163442, 1, 1, 1, 1, 1,
-0.826257, -0.7605008, -2.619066, 1, 1, 1, 1, 1,
-0.8259126, -1.260628, -3.570709, 1, 1, 1, 1, 1,
-0.8240511, 0.253986, -1.826297, 1, 1, 1, 1, 1,
-0.8234951, -0.518951, -2.782989, 1, 1, 1, 1, 1,
-0.823075, -1.121482, -2.217721, 1, 1, 1, 1, 1,
-0.8220465, -0.09261189, -0.7305601, 1, 1, 1, 1, 1,
-0.8196069, 1.150293, -0.001551005, 1, 1, 1, 1, 1,
-0.816484, 0.4708662, 0.3763132, 1, 1, 1, 1, 1,
-0.8163796, -2.070836, -3.776899, 1, 1, 1, 1, 1,
-0.8052323, 1.010649, -1.524722, 1, 1, 1, 1, 1,
-0.8021945, 0.4930168, 0.507341, 1, 1, 1, 1, 1,
-0.7962878, -0.02055652, -0.7308073, 1, 1, 1, 1, 1,
-0.7903665, 0.5896819, -0.573571, 1, 1, 1, 1, 1,
-0.7874455, 0.1850807, -1.123837, 1, 1, 1, 1, 1,
-0.7803538, 3.328567, 0.1029032, 0, 0, 1, 1, 1,
-0.7797155, 0.266109, -0.1962506, 1, 0, 0, 1, 1,
-0.779369, -0.7307723, -0.253949, 1, 0, 0, 1, 1,
-0.7719088, 1.177131, 1.974459, 1, 0, 0, 1, 1,
-0.7715583, 0.7656783, -1.870258, 1, 0, 0, 1, 1,
-0.7699929, -1.202593, -3.666017, 1, 0, 0, 1, 1,
-0.766941, 0.6266592, -1.572016, 0, 0, 0, 1, 1,
-0.762004, -1.542394, -3.866626, 0, 0, 0, 1, 1,
-0.7599943, -1.492826, -3.177992, 0, 0, 0, 1, 1,
-0.7568477, -1.150235, -3.422434, 0, 0, 0, 1, 1,
-0.756036, 0.1888729, 0.3426744, 0, 0, 0, 1, 1,
-0.7469012, -0.2778171, -2.104527, 0, 0, 0, 1, 1,
-0.746537, -0.4107086, -2.119385, 0, 0, 0, 1, 1,
-0.7312361, -0.7649121, -1.782562, 1, 1, 1, 1, 1,
-0.7289642, -0.7077486, -3.494451, 1, 1, 1, 1, 1,
-0.7229276, 1.001346, -0.4530203, 1, 1, 1, 1, 1,
-0.7161439, 0.6407435, 0.7684333, 1, 1, 1, 1, 1,
-0.7150691, -0.7849194, -1.825043, 1, 1, 1, 1, 1,
-0.7092273, 0.4370866, 0.4705544, 1, 1, 1, 1, 1,
-0.7056657, 1.613384, -1.338755, 1, 1, 1, 1, 1,
-0.7054764, -0.5629992, -2.29656, 1, 1, 1, 1, 1,
-0.7039595, -0.1799912, -1.246237, 1, 1, 1, 1, 1,
-0.7018994, -1.360828, -3.577341, 1, 1, 1, 1, 1,
-0.6977559, 0.3614933, 0.7736103, 1, 1, 1, 1, 1,
-0.6975126, 1.484669, 1.475019, 1, 1, 1, 1, 1,
-0.6947274, 0.4048942, -1.354223, 1, 1, 1, 1, 1,
-0.6915106, -1.211427, -5.375382, 1, 1, 1, 1, 1,
-0.6902294, 0.8264692, -0.5762658, 1, 1, 1, 1, 1,
-0.6890582, 0.4757914, -1.376992, 0, 0, 1, 1, 1,
-0.6834676, -0.6044875, -0.8847401, 1, 0, 0, 1, 1,
-0.6806533, 0.6692062, 1.090319, 1, 0, 0, 1, 1,
-0.678918, -0.07615475, -1.49535, 1, 0, 0, 1, 1,
-0.6733403, 0.9980027, 0.02102183, 1, 0, 0, 1, 1,
-0.6729724, 0.9445279, -0.8857417, 1, 0, 0, 1, 1,
-0.6726216, 0.7423069, -1.511404, 0, 0, 0, 1, 1,
-0.6725928, -0.1167443, -0.5873591, 0, 0, 0, 1, 1,
-0.67185, -0.8199459, -0.8155478, 0, 0, 0, 1, 1,
-0.6708447, 0.5786119, -1.006352, 0, 0, 0, 1, 1,
-0.6669148, 0.5640599, -0.1305992, 0, 0, 0, 1, 1,
-0.6666254, 0.4198848, -2.405345, 0, 0, 0, 1, 1,
-0.6662434, 0.5576202, 0.2389821, 0, 0, 0, 1, 1,
-0.6621891, -1.725249, -4.431364, 1, 1, 1, 1, 1,
-0.6613115, -1.308038, -1.825155, 1, 1, 1, 1, 1,
-0.6547325, 0.6095906, -2.939188, 1, 1, 1, 1, 1,
-0.6523581, -0.2855739, -3.760616, 1, 1, 1, 1, 1,
-0.65137, -0.9191138, -3.428121, 1, 1, 1, 1, 1,
-0.6467475, 1.090328, 0.09192989, 1, 1, 1, 1, 1,
-0.6453595, 0.3648748, 0.2883768, 1, 1, 1, 1, 1,
-0.6435667, -1.606527, -3.117057, 1, 1, 1, 1, 1,
-0.642617, -0.6980204, -1.877667, 1, 1, 1, 1, 1,
-0.6404198, 0.3564302, -1.471305, 1, 1, 1, 1, 1,
-0.6379851, -0.5423654, -2.53487, 1, 1, 1, 1, 1,
-0.6350038, 1.256141, -0.3439161, 1, 1, 1, 1, 1,
-0.6337015, 1.025369, -1.586217, 1, 1, 1, 1, 1,
-0.6272526, -1.714487, -2.329977, 1, 1, 1, 1, 1,
-0.6247926, 0.7061737, -0.927731, 1, 1, 1, 1, 1,
-0.6236078, -1.274496, -5.32198, 0, 0, 1, 1, 1,
-0.6173424, 0.6338441, -1.528235, 1, 0, 0, 1, 1,
-0.6121212, 1.195509, -0.1499934, 1, 0, 0, 1, 1,
-0.6100519, -0.9801571, -1.407524, 1, 0, 0, 1, 1,
-0.607344, 1.874685, -0.5805326, 1, 0, 0, 1, 1,
-0.6051576, -0.5654256, -2.780224, 1, 0, 0, 1, 1,
-0.604032, 0.165489, 0.1204722, 0, 0, 0, 1, 1,
-0.5987307, 0.4920859, 0.1121781, 0, 0, 0, 1, 1,
-0.5983841, 0.6212871, -0.525099, 0, 0, 0, 1, 1,
-0.5979395, 2.087233, -0.1455242, 0, 0, 0, 1, 1,
-0.5969283, -0.2643629, -2.816793, 0, 0, 0, 1, 1,
-0.58851, -0.9957766, -3.21068, 0, 0, 0, 1, 1,
-0.5881177, -0.8241534, -4.088344, 0, 0, 0, 1, 1,
-0.5870157, -0.8014114, -2.576753, 1, 1, 1, 1, 1,
-0.5868536, -0.01421103, -0.8499312, 1, 1, 1, 1, 1,
-0.5867853, 0.9743512, 0.8374101, 1, 1, 1, 1, 1,
-0.5803976, 0.4778216, -0.5256124, 1, 1, 1, 1, 1,
-0.5796998, -0.3056987, -1.399925, 1, 1, 1, 1, 1,
-0.5783089, -0.8556778, -2.395364, 1, 1, 1, 1, 1,
-0.5751653, -0.4425308, -3.339429, 1, 1, 1, 1, 1,
-0.5662969, 2.083216, -0.4888418, 1, 1, 1, 1, 1,
-0.5649511, 0.5551411, -0.198528, 1, 1, 1, 1, 1,
-0.5643778, -0.8549188, -3.632646, 1, 1, 1, 1, 1,
-0.5624966, 1.03743, -0.7038897, 1, 1, 1, 1, 1,
-0.560261, 1.8589, -0.1631127, 1, 1, 1, 1, 1,
-0.5582762, -0.3171893, -1.546194, 1, 1, 1, 1, 1,
-0.5573614, -0.3241746, -2.282374, 1, 1, 1, 1, 1,
-0.557075, -1.072242, -2.71028, 1, 1, 1, 1, 1,
-0.5545144, 0.770924, 1.289772, 0, 0, 1, 1, 1,
-0.5540418, -0.7640091, -1.077144, 1, 0, 0, 1, 1,
-0.5515983, 0.9005108, -0.4273293, 1, 0, 0, 1, 1,
-0.5504194, 0.1961275, -0.6530192, 1, 0, 0, 1, 1,
-0.5471879, -1.395027, -0.794722, 1, 0, 0, 1, 1,
-0.547137, 1.587581, 0.4178201, 1, 0, 0, 1, 1,
-0.5467614, 0.06485244, 0.1469197, 0, 0, 0, 1, 1,
-0.5425327, 1.871644, -1.13889, 0, 0, 0, 1, 1,
-0.5423447, -0.5542544, -2.946396, 0, 0, 0, 1, 1,
-0.542192, -0.9533203, -2.741725, 0, 0, 0, 1, 1,
-0.5403013, -1.80108, -3.44396, 0, 0, 0, 1, 1,
-0.5380573, -3.31818, -1.81551, 0, 0, 0, 1, 1,
-0.5354111, -0.7500275, -2.894177, 0, 0, 0, 1, 1,
-0.5345859, -0.7351156, -2.344106, 1, 1, 1, 1, 1,
-0.5335845, 0.6287894, -0.8714569, 1, 1, 1, 1, 1,
-0.5288386, -1.767919, -1.454042, 1, 1, 1, 1, 1,
-0.5215342, -0.09218308, -2.520671, 1, 1, 1, 1, 1,
-0.5151346, -0.4088613, -1.16776, 1, 1, 1, 1, 1,
-0.5134705, 0.8572447, 0.1828195, 1, 1, 1, 1, 1,
-0.513451, -0.2913766, -2.238759, 1, 1, 1, 1, 1,
-0.5085993, 0.2176676, -1.443262, 1, 1, 1, 1, 1,
-0.5077101, -0.4439893, -3.709783, 1, 1, 1, 1, 1,
-0.5075171, 0.6456246, -1.641147, 1, 1, 1, 1, 1,
-0.5072438, 1.646984, -0.8765992, 1, 1, 1, 1, 1,
-0.506521, 0.4118304, -0.2028682, 1, 1, 1, 1, 1,
-0.5016757, 0.1677056, -3.980958, 1, 1, 1, 1, 1,
-0.4975947, 1.005905, -2.719262, 1, 1, 1, 1, 1,
-0.492279, 0.05058883, -1.388592, 1, 1, 1, 1, 1,
-0.4840605, 1.602777, -0.6378301, 0, 0, 1, 1, 1,
-0.4785564, 0.07825267, -1.835418, 1, 0, 0, 1, 1,
-0.4734205, -0.6785384, -2.543466, 1, 0, 0, 1, 1,
-0.4703234, -0.5325893, -0.548469, 1, 0, 0, 1, 1,
-0.4699721, 1.139027, -1.554322, 1, 0, 0, 1, 1,
-0.4694032, 2.039402, 0.106777, 1, 0, 0, 1, 1,
-0.468272, 1.322261, -1.860397, 0, 0, 0, 1, 1,
-0.4678018, -2.334714, -4.256006, 0, 0, 0, 1, 1,
-0.4675712, -1.091812, -1.37955, 0, 0, 0, 1, 1,
-0.4634157, -0.3505335, -2.537859, 0, 0, 0, 1, 1,
-0.4627212, 2.302162, -0.1895708, 0, 0, 0, 1, 1,
-0.4532443, -0.9284456, -1.799702, 0, 0, 0, 1, 1,
-0.4502875, -0.1058748, -1.121465, 0, 0, 0, 1, 1,
-0.4481739, -2.662109, -3.563532, 1, 1, 1, 1, 1,
-0.4465518, -2.253012, -2.198276, 1, 1, 1, 1, 1,
-0.4450347, -0.453169, -2.612663, 1, 1, 1, 1, 1,
-0.4417133, -3.240609, -1.19493, 1, 1, 1, 1, 1,
-0.4339455, -0.2788287, -2.161849, 1, 1, 1, 1, 1,
-0.4310444, -1.544444, -2.918291, 1, 1, 1, 1, 1,
-0.43091, 0.71153, 0.02191189, 1, 1, 1, 1, 1,
-0.4239592, -1.32824, -3.343793, 1, 1, 1, 1, 1,
-0.4237169, 0.2891096, -3.018678, 1, 1, 1, 1, 1,
-0.4232418, 0.2229473, -1.652342, 1, 1, 1, 1, 1,
-0.4204496, -0.5025108, -2.937153, 1, 1, 1, 1, 1,
-0.410767, 0.4238837, -0.09504417, 1, 1, 1, 1, 1,
-0.40784, -1.266228, -1.969501, 1, 1, 1, 1, 1,
-0.4015391, 0.5462118, -3.642434, 1, 1, 1, 1, 1,
-0.3998365, -0.2392556, -1.802627, 1, 1, 1, 1, 1,
-0.3987347, -1.302732, -0.8440715, 0, 0, 1, 1, 1,
-0.3962485, -0.8475034, -1.928057, 1, 0, 0, 1, 1,
-0.3926451, 0.4464718, -1.114881, 1, 0, 0, 1, 1,
-0.3841679, -1.26401, -2.497141, 1, 0, 0, 1, 1,
-0.3840853, 1.065268, -0.657139, 1, 0, 0, 1, 1,
-0.3827948, -0.658465, -2.268931, 1, 0, 0, 1, 1,
-0.3803592, -1.463875, -3.341315, 0, 0, 0, 1, 1,
-0.3782109, -0.5859734, -4.575687, 0, 0, 0, 1, 1,
-0.3720395, 1.145935, -0.3939044, 0, 0, 0, 1, 1,
-0.3681916, -0.3857551, -2.900298, 0, 0, 0, 1, 1,
-0.3654369, 1.298247, 0.3530683, 0, 0, 0, 1, 1,
-0.3616961, 0.9390037, -0.876282, 0, 0, 0, 1, 1,
-0.3599744, 0.164866, -0.7392957, 0, 0, 0, 1, 1,
-0.3576472, -0.4564259, -3.633307, 1, 1, 1, 1, 1,
-0.3552005, 1.395095, -0.468362, 1, 1, 1, 1, 1,
-0.3533289, 0.9186766, -2.086928, 1, 1, 1, 1, 1,
-0.3525084, 2.424255, -0.4770909, 1, 1, 1, 1, 1,
-0.3505836, 1.5198, -0.8448169, 1, 1, 1, 1, 1,
-0.3484912, -0.2847043, -3.566647, 1, 1, 1, 1, 1,
-0.3474177, 0.7841833, -0.5511355, 1, 1, 1, 1, 1,
-0.3425923, 2.913656, 0.1521949, 1, 1, 1, 1, 1,
-0.3419352, -0.3986966, -2.704584, 1, 1, 1, 1, 1,
-0.3405595, -2.474143, -3.216172, 1, 1, 1, 1, 1,
-0.3403111, 0.5161428, -0.08489701, 1, 1, 1, 1, 1,
-0.3354329, 1.038545, -0.1964789, 1, 1, 1, 1, 1,
-0.334585, 1.21175, -1.112795, 1, 1, 1, 1, 1,
-0.3313327, 0.4545355, -1.831448, 1, 1, 1, 1, 1,
-0.3277373, 1.110037, -1.012206, 1, 1, 1, 1, 1,
-0.327022, -1.362388, -2.387, 0, 0, 1, 1, 1,
-0.3253643, 1.479606, 1.075236, 1, 0, 0, 1, 1,
-0.3236352, -1.568427, -2.851031, 1, 0, 0, 1, 1,
-0.321978, -0.2593956, -2.321795, 1, 0, 0, 1, 1,
-0.3219143, 0.1494774, -2.339749, 1, 0, 0, 1, 1,
-0.3197936, 0.6744986, -1.750925, 1, 0, 0, 1, 1,
-0.3180598, 0.6236869, -1.703957, 0, 0, 0, 1, 1,
-0.316825, 0.6073799, -1.057696, 0, 0, 0, 1, 1,
-0.3124736, 1.106226, -1.441255, 0, 0, 0, 1, 1,
-0.3071018, -0.6901708, -0.7559973, 0, 0, 0, 1, 1,
-0.3058378, 0.4408931, 0.450427, 0, 0, 0, 1, 1,
-0.3056929, -0.1365711, -1.678163, 0, 0, 0, 1, 1,
-0.3021609, 0.247514, -1.869826, 0, 0, 0, 1, 1,
-0.301837, 0.2347843, -0.8862196, 1, 1, 1, 1, 1,
-0.297632, 0.1818395, 0.0100234, 1, 1, 1, 1, 1,
-0.2976061, -0.4124227, -1.910375, 1, 1, 1, 1, 1,
-0.2964492, -0.1981422, -1.072333, 1, 1, 1, 1, 1,
-0.2941557, -0.2568561, -5.209223, 1, 1, 1, 1, 1,
-0.2938057, 0.8371226, 0.01556152, 1, 1, 1, 1, 1,
-0.2864431, -0.9403535, -2.526759, 1, 1, 1, 1, 1,
-0.2826594, -0.2770994, -1.14335, 1, 1, 1, 1, 1,
-0.2796678, 0.04629793, -1.08388, 1, 1, 1, 1, 1,
-0.278625, -0.7178062, -2.587765, 1, 1, 1, 1, 1,
-0.2669137, -0.005634621, -0.7185094, 1, 1, 1, 1, 1,
-0.265692, -1.006574, -3.436117, 1, 1, 1, 1, 1,
-0.2642595, -0.5844837, -3.44457, 1, 1, 1, 1, 1,
-0.2635151, 1.642453, -0.7775172, 1, 1, 1, 1, 1,
-0.2610448, -0.8916341, -2.985994, 1, 1, 1, 1, 1,
-0.2593, -0.8866875, -3.700325, 0, 0, 1, 1, 1,
-0.2575186, 0.06431316, 0.1393024, 1, 0, 0, 1, 1,
-0.2557376, 0.3967153, 0.7747385, 1, 0, 0, 1, 1,
-0.2549699, -1.543923, -2.967305, 1, 0, 0, 1, 1,
-0.250502, 0.9779186, -0.8930187, 1, 0, 0, 1, 1,
-0.2477096, 0.8846405, 0.589725, 1, 0, 0, 1, 1,
-0.2459032, -1.092117, -2.510489, 0, 0, 0, 1, 1,
-0.2435522, 1.155437, 0.08536724, 0, 0, 0, 1, 1,
-0.2432921, -0.6185346, -2.354878, 0, 0, 0, 1, 1,
-0.2383126, 0.7242399, -0.253003, 0, 0, 0, 1, 1,
-0.2357541, 1.764111, -0.2707857, 0, 0, 0, 1, 1,
-0.2352098, 0.34308, 0.38877, 0, 0, 0, 1, 1,
-0.2312802, 0.6542752, -0.5773193, 0, 0, 0, 1, 1,
-0.2261462, 0.7102811, -1.037298, 1, 1, 1, 1, 1,
-0.2238586, -0.3975296, -3.034374, 1, 1, 1, 1, 1,
-0.2229974, -0.7828366, -3.570541, 1, 1, 1, 1, 1,
-0.2223393, 1.700893, -2.307979, 1, 1, 1, 1, 1,
-0.2202172, 0.8442636, -1.501614, 1, 1, 1, 1, 1,
-0.2199432, -0.5333713, -3.517424, 1, 1, 1, 1, 1,
-0.2165426, -0.9710567, -2.190485, 1, 1, 1, 1, 1,
-0.2055794, 2.724348, 1.559527, 1, 1, 1, 1, 1,
-0.2035247, 0.8333909, 0.3458153, 1, 1, 1, 1, 1,
-0.20293, 0.5273709, 0.3081167, 1, 1, 1, 1, 1,
-0.20017, 0.743596, 1.968033, 1, 1, 1, 1, 1,
-0.1925446, -1.110506, -4.332612, 1, 1, 1, 1, 1,
-0.191313, -0.8969342, -3.800172, 1, 1, 1, 1, 1,
-0.1892718, 0.06235998, -0.3310336, 1, 1, 1, 1, 1,
-0.1809574, -0.06013491, -1.777621, 1, 1, 1, 1, 1,
-0.1803261, -0.5571851, -3.317077, 0, 0, 1, 1, 1,
-0.17318, -1.052965, -2.856504, 1, 0, 0, 1, 1,
-0.1648837, -0.1967412, -3.30237, 1, 0, 0, 1, 1,
-0.1631925, 1.102004, 0.3350195, 1, 0, 0, 1, 1,
-0.1626712, 0.02277303, -0.5374067, 1, 0, 0, 1, 1,
-0.1611023, -1.237588, -2.524768, 1, 0, 0, 1, 1,
-0.1592175, 2.926205, -1.412121, 0, 0, 0, 1, 1,
-0.153482, -1.582156, -1.713183, 0, 0, 0, 1, 1,
-0.1513694, -1.1473, -1.127649, 0, 0, 0, 1, 1,
-0.1479555, -0.7661939, -1.561058, 0, 0, 0, 1, 1,
-0.1468314, 0.612555, -0.4734725, 0, 0, 0, 1, 1,
-0.1376553, -0.0001413214, -2.473522, 0, 0, 0, 1, 1,
-0.1372939, -0.868717, -4.522108, 0, 0, 0, 1, 1,
-0.1369548, 1.592524, 0.325776, 1, 1, 1, 1, 1,
-0.1363979, -1.532783, -3.188434, 1, 1, 1, 1, 1,
-0.134424, -0.3711369, -3.130376, 1, 1, 1, 1, 1,
-0.132729, 0.721011, -1.177828, 1, 1, 1, 1, 1,
-0.1312811, -0.7836162, -3.346591, 1, 1, 1, 1, 1,
-0.1308188, -1.030004, -3.836126, 1, 1, 1, 1, 1,
-0.1291134, -0.7934459, -3.471713, 1, 1, 1, 1, 1,
-0.1277319, 0.9289648, 1.363166, 1, 1, 1, 1, 1,
-0.1249547, -1.323103, -2.632962, 1, 1, 1, 1, 1,
-0.1217424, 1.498773, 0.5560167, 1, 1, 1, 1, 1,
-0.1208801, 0.4180392, -0.4298572, 1, 1, 1, 1, 1,
-0.1190061, -0.6028754, -3.329641, 1, 1, 1, 1, 1,
-0.116694, 0.6846164, 0.2593152, 1, 1, 1, 1, 1,
-0.1165211, 1.010519, -0.408074, 1, 1, 1, 1, 1,
-0.1157846, 0.3407123, 1.249089, 1, 1, 1, 1, 1,
-0.1151596, -0.5024012, -3.602829, 0, 0, 1, 1, 1,
-0.1150686, 0.9973096, -1.019252, 1, 0, 0, 1, 1,
-0.114863, -0.182525, -2.781183, 1, 0, 0, 1, 1,
-0.1136759, -0.3511088, -3.384558, 1, 0, 0, 1, 1,
-0.1088985, -0.8816966, -4.735401, 1, 0, 0, 1, 1,
-0.1088762, 0.2892007, -0.04187239, 1, 0, 0, 1, 1,
-0.1071748, -0.6282597, -2.918262, 0, 0, 0, 1, 1,
-0.09500647, -0.1622692, -1.629153, 0, 0, 0, 1, 1,
-0.087893, -1.098349, -3.611578, 0, 0, 0, 1, 1,
-0.08784847, 1.025797, 0.8563887, 0, 0, 0, 1, 1,
-0.08632012, 0.304757, 0.4543044, 0, 0, 0, 1, 1,
-0.08573361, -0.0651867, -1.007787, 0, 0, 0, 1, 1,
-0.08556937, -0.3737328, -3.24891, 0, 0, 0, 1, 1,
-0.08313715, -1.573171, -3.043149, 1, 1, 1, 1, 1,
-0.0820275, 0.2098056, 0.5491396, 1, 1, 1, 1, 1,
-0.07298059, -1.713252, -2.584064, 1, 1, 1, 1, 1,
-0.07052343, -0.9991019, -2.994362, 1, 1, 1, 1, 1,
-0.07000428, -0.8413572, -2.442349, 1, 1, 1, 1, 1,
-0.06996645, 0.3976721, 0.5598947, 1, 1, 1, 1, 1,
-0.06840698, 2.148947, -0.2758132, 1, 1, 1, 1, 1,
-0.06027846, -0.7440612, -3.442063, 1, 1, 1, 1, 1,
-0.05880756, 1.306668, 0.884064, 1, 1, 1, 1, 1,
-0.05184785, -0.3784159, -1.934451, 1, 1, 1, 1, 1,
-0.05144085, 0.816404, 0.6833299, 1, 1, 1, 1, 1,
-0.04894323, -1.105767, -3.108169, 1, 1, 1, 1, 1,
-0.04853598, -0.08451446, -3.185941, 1, 1, 1, 1, 1,
-0.04546935, -0.09025791, -2.639322, 1, 1, 1, 1, 1,
-0.0398902, -1.079094, -2.1379, 1, 1, 1, 1, 1,
-0.03869131, 0.5088072, 1.207262, 0, 0, 1, 1, 1,
-0.03832193, 0.02482375, -1.053182, 1, 0, 0, 1, 1,
-0.03689376, -1.71254, -4.758132, 1, 0, 0, 1, 1,
-0.03446088, -2.320032, -3.356593, 1, 0, 0, 1, 1,
-0.03111032, 1.459554, 1.187992, 1, 0, 0, 1, 1,
-0.02012743, 0.3123693, -0.5015373, 1, 0, 0, 1, 1,
-0.01956078, 0.6758742, -1.478104, 0, 0, 0, 1, 1,
-0.01845011, -1.951553, -3.569572, 0, 0, 0, 1, 1,
-0.01349275, -1.342287, -3.431202, 0, 0, 0, 1, 1,
-0.0101449, -2.987893, -4.602129, 0, 0, 0, 1, 1,
-0.008153479, 1.197506, -0.6236826, 0, 0, 0, 1, 1,
-0.006564195, -0.4561161, -2.42305, 0, 0, 0, 1, 1,
-0.001224051, -0.6572923, -5.23924, 0, 0, 0, 1, 1,
0.002920071, 0.493598, 1.398943, 1, 1, 1, 1, 1,
0.00484411, 1.133101, 0.7263231, 1, 1, 1, 1, 1,
0.00759801, 0.7015609, 0.5489163, 1, 1, 1, 1, 1,
0.0113592, 0.7709965, 1.553932, 1, 1, 1, 1, 1,
0.0143166, 1.051068, 0.838004, 1, 1, 1, 1, 1,
0.0252986, -0.7722397, 3.078826, 1, 1, 1, 1, 1,
0.02560186, -0.3754511, 2.049388, 1, 1, 1, 1, 1,
0.0309474, 1.179509, -0.9195549, 1, 1, 1, 1, 1,
0.03236145, -0.2744934, 4.018318, 1, 1, 1, 1, 1,
0.03361592, -0.06768418, 3.575791, 1, 1, 1, 1, 1,
0.03439604, -0.08813362, 1.902957, 1, 1, 1, 1, 1,
0.03453861, -1.507406, 2.933101, 1, 1, 1, 1, 1,
0.03631758, -0.03488564, 2.772035, 1, 1, 1, 1, 1,
0.03966053, 1.645678, -1.366625, 1, 1, 1, 1, 1,
0.04472275, 0.1769135, 0.2758073, 1, 1, 1, 1, 1,
0.04534124, -0.3366631, 3.139956, 0, 0, 1, 1, 1,
0.04699164, -1.351725, 2.961648, 1, 0, 0, 1, 1,
0.04825986, 1.22238, 0.3451406, 1, 0, 0, 1, 1,
0.04857016, 0.557852, 1.22673, 1, 0, 0, 1, 1,
0.0519747, 1.248918, -0.420915, 1, 0, 0, 1, 1,
0.05275067, -1.284501, 4.910285, 1, 0, 0, 1, 1,
0.05330541, -0.3010411, 3.62709, 0, 0, 0, 1, 1,
0.05369662, 1.700214, 0.3717432, 0, 0, 0, 1, 1,
0.0540216, -0.6947257, 4.305081, 0, 0, 0, 1, 1,
0.05548029, -0.1165937, 2.919465, 0, 0, 0, 1, 1,
0.05610357, -0.007245372, 0.4088914, 0, 0, 0, 1, 1,
0.06258804, 0.3563908, -0.134088, 0, 0, 0, 1, 1,
0.06368527, -0.7419895, 1.455125, 0, 0, 0, 1, 1,
0.06444316, 1.26491, -0.8323742, 1, 1, 1, 1, 1,
0.06670985, 0.006713235, -0.4412127, 1, 1, 1, 1, 1,
0.06883358, 0.3710707, 0.333726, 1, 1, 1, 1, 1,
0.06939789, -1.591565, 2.760503, 1, 1, 1, 1, 1,
0.06992187, -1.560074, 2.322405, 1, 1, 1, 1, 1,
0.0710572, -0.09254718, 3.04636, 1, 1, 1, 1, 1,
0.07369015, 0.25033, -1.276777, 1, 1, 1, 1, 1,
0.07503121, -0.2723903, 3.56829, 1, 1, 1, 1, 1,
0.07866306, 1.088718, 0.8483904, 1, 1, 1, 1, 1,
0.08680932, 0.0774783, 0.8678344, 1, 1, 1, 1, 1,
0.08720192, 1.032324, -0.2191838, 1, 1, 1, 1, 1,
0.08756099, -1.387838, 4.447334, 1, 1, 1, 1, 1,
0.08852701, 1.56048, -0.3175314, 1, 1, 1, 1, 1,
0.09124283, 0.3139711, -1.577719, 1, 1, 1, 1, 1,
0.09418016, 0.05460438, -1.219214, 1, 1, 1, 1, 1,
0.09861654, -1.72073, 3.26842, 0, 0, 1, 1, 1,
0.1000001, -0.08612653, 3.920305, 1, 0, 0, 1, 1,
0.1022635, 0.5019413, 0.8967894, 1, 0, 0, 1, 1,
0.1056648, 0.1306246, 1.697331, 1, 0, 0, 1, 1,
0.1113199, -1.642519, 0.9714136, 1, 0, 0, 1, 1,
0.1119416, -0.8711917, 2.016556, 1, 0, 0, 1, 1,
0.1185093, 0.5449792, -2.049726, 0, 0, 0, 1, 1,
0.1202723, -0.2264025, 2.827317, 0, 0, 0, 1, 1,
0.1238429, 1.670857, -0.5159883, 0, 0, 0, 1, 1,
0.1238651, -1.272867, 4.313513, 0, 0, 0, 1, 1,
0.1304996, -0.5678734, 4.926034, 0, 0, 0, 1, 1,
0.1350268, 0.1802749, 0.977324, 0, 0, 0, 1, 1,
0.1352158, -0.4073412, 3.899447, 0, 0, 0, 1, 1,
0.1366193, -1.401039, 2.666696, 1, 1, 1, 1, 1,
0.1385574, -2.069366, 2.60355, 1, 1, 1, 1, 1,
0.1447752, 1.086947, -0.6175199, 1, 1, 1, 1, 1,
0.1487954, 0.9208924, -0.08084977, 1, 1, 1, 1, 1,
0.1496895, 0.8375263, 1.164559, 1, 1, 1, 1, 1,
0.1516021, 0.2475608, 0.07666267, 1, 1, 1, 1, 1,
0.1550598, -1.526344, 2.154994, 1, 1, 1, 1, 1,
0.1555393, -0.7239373, 1.472454, 1, 1, 1, 1, 1,
0.1582507, -0.03580793, 0.06193223, 1, 1, 1, 1, 1,
0.1613874, 1.854975, 0.3686561, 1, 1, 1, 1, 1,
0.1635764, -0.2342644, 2.744471, 1, 1, 1, 1, 1,
0.164434, 0.1423799, 1.716846, 1, 1, 1, 1, 1,
0.1647694, 0.7623621, -0.3672068, 1, 1, 1, 1, 1,
0.164805, 0.8312061, -2.310959, 1, 1, 1, 1, 1,
0.1749886, 0.3700707, 0.5393795, 1, 1, 1, 1, 1,
0.1753983, -0.8888823, 2.363274, 0, 0, 1, 1, 1,
0.1767161, -0.7313926, 3.084661, 1, 0, 0, 1, 1,
0.1777393, 0.6929412, 2.168306, 1, 0, 0, 1, 1,
0.1810626, -1.004267, 3.720063, 1, 0, 0, 1, 1,
0.1855437, 0.5751411, 1.279336, 1, 0, 0, 1, 1,
0.1862814, -0.02285578, 2.359477, 1, 0, 0, 1, 1,
0.1956178, 0.2497393, 1.333558, 0, 0, 0, 1, 1,
0.2003172, -2.260059, 5.267664, 0, 0, 0, 1, 1,
0.2020586, 0.7828138, 1.057802, 0, 0, 0, 1, 1,
0.2024661, 1.01064, 1.176515, 0, 0, 0, 1, 1,
0.2067656, -0.6107811, 5.07884, 0, 0, 0, 1, 1,
0.209588, 0.07398321, 1.66877, 0, 0, 0, 1, 1,
0.2110991, 0.6628039, -0.4047663, 0, 0, 0, 1, 1,
0.2171549, -1.060844, 3.564709, 1, 1, 1, 1, 1,
0.2199782, -0.4097919, 0.9225649, 1, 1, 1, 1, 1,
0.2199787, -0.6173775, 2.910341, 1, 1, 1, 1, 1,
0.220531, -0.8310553, 1.986616, 1, 1, 1, 1, 1,
0.2338893, 0.3336768, 1.813131, 1, 1, 1, 1, 1,
0.2338969, -0.1310669, 3.628527, 1, 1, 1, 1, 1,
0.2356369, -0.5549479, 2.112492, 1, 1, 1, 1, 1,
0.2409066, 0.09896444, 1.187693, 1, 1, 1, 1, 1,
0.2418772, -0.09911145, 1.045619, 1, 1, 1, 1, 1,
0.2434944, -0.09845819, 0.4543735, 1, 1, 1, 1, 1,
0.2463377, 0.8007092, -0.8735789, 1, 1, 1, 1, 1,
0.2487441, -1.514822, 2.390105, 1, 1, 1, 1, 1,
0.2525449, 1.202584, -0.9743156, 1, 1, 1, 1, 1,
0.2537079, 0.4952948, -0.88787, 1, 1, 1, 1, 1,
0.257302, 0.8689543, -0.9837438, 1, 1, 1, 1, 1,
0.2587598, -1.078047, 2.18206, 0, 0, 1, 1, 1,
0.2604281, 1.733993, -1.403171, 1, 0, 0, 1, 1,
0.2606681, -1.05871, 3.043863, 1, 0, 0, 1, 1,
0.2622319, 1.088189, -0.3456494, 1, 0, 0, 1, 1,
0.2681233, -0.3442824, 4.670897, 1, 0, 0, 1, 1,
0.2714509, -0.227253, 3.809613, 1, 0, 0, 1, 1,
0.2720471, -0.4436853, 3.560555, 0, 0, 0, 1, 1,
0.2729433, 0.3874152, 0.5611739, 0, 0, 0, 1, 1,
0.2741382, -0.109537, 1.204226, 0, 0, 0, 1, 1,
0.2752104, 2.31922, 1.687576, 0, 0, 0, 1, 1,
0.282567, -1.56076, 1.582057, 0, 0, 0, 1, 1,
0.2838162, 0.5190865, -1.753217, 0, 0, 0, 1, 1,
0.2855696, 1.599593, 1.244433, 0, 0, 0, 1, 1,
0.2881194, 1.492884, 0.99115, 1, 1, 1, 1, 1,
0.2887563, 0.2407297, 0.545451, 1, 1, 1, 1, 1,
0.2941392, 1.518611, -1.08905, 1, 1, 1, 1, 1,
0.2997066, -1.758237, 2.999669, 1, 1, 1, 1, 1,
0.3008049, 0.5368172, 0.1853535, 1, 1, 1, 1, 1,
0.3022993, -1.243006, 3.71584, 1, 1, 1, 1, 1,
0.3098054, -1.86923, 1.936896, 1, 1, 1, 1, 1,
0.3112617, -0.01699894, 1.076682, 1, 1, 1, 1, 1,
0.3117994, -0.3500483, 2.460426, 1, 1, 1, 1, 1,
0.312525, -0.5577133, 3.345408, 1, 1, 1, 1, 1,
0.315045, 1.047315, 0.9306914, 1, 1, 1, 1, 1,
0.3173129, -0.05205331, -0.4914094, 1, 1, 1, 1, 1,
0.3174259, -0.9803042, 2.17459, 1, 1, 1, 1, 1,
0.3175164, 1.935805, 0.04781545, 1, 1, 1, 1, 1,
0.3180324, 0.6230738, 0.4749107, 1, 1, 1, 1, 1,
0.3199913, -0.8499407, 2.92818, 0, 0, 1, 1, 1,
0.3233438, 0.02810286, 2.06975, 1, 0, 0, 1, 1,
0.3235946, -0.9920772, 4.690786, 1, 0, 0, 1, 1,
0.326033, 0.1528437, 2.102683, 1, 0, 0, 1, 1,
0.32926, 1.458054, 0.5011758, 1, 0, 0, 1, 1,
0.3310854, -0.3032733, 2.151672, 1, 0, 0, 1, 1,
0.3332254, 0.6985394, -0.01935141, 0, 0, 0, 1, 1,
0.3361031, 1.443438, -0.8547395, 0, 0, 0, 1, 1,
0.338394, 0.3404633, 1.377959, 0, 0, 0, 1, 1,
0.3397506, 0.7201235, -1.646114, 0, 0, 0, 1, 1,
0.3410357, -0.3021754, 3.545031, 0, 0, 0, 1, 1,
0.3442804, 0.5572737, 0.513355, 0, 0, 0, 1, 1,
0.3470107, -0.8741582, 3.161626, 0, 0, 0, 1, 1,
0.3482395, 1.190274, 0.4167608, 1, 1, 1, 1, 1,
0.3510597, -0.3059924, 0.4674902, 1, 1, 1, 1, 1,
0.3534242, -1.087988, 2.565448, 1, 1, 1, 1, 1,
0.3539588, 0.3534833, 1.161979, 1, 1, 1, 1, 1,
0.3554322, 0.7246961, -0.357188, 1, 1, 1, 1, 1,
0.3555121, 0.3970717, 1.237303, 1, 1, 1, 1, 1,
0.3587026, -0.6345628, 4.509719, 1, 1, 1, 1, 1,
0.3612081, 0.9214965, 0.03385597, 1, 1, 1, 1, 1,
0.3657889, 0.4404074, -0.4784473, 1, 1, 1, 1, 1,
0.3662486, -0.1390335, 2.09536, 1, 1, 1, 1, 1,
0.3680935, 0.3089547, 2.24248, 1, 1, 1, 1, 1,
0.3724024, 0.4638283, 0.1775285, 1, 1, 1, 1, 1,
0.375455, 1.445523, 0.1178916, 1, 1, 1, 1, 1,
0.3755344, -0.3896867, 2.169327, 1, 1, 1, 1, 1,
0.3776339, -0.6982862, 2.015839, 1, 1, 1, 1, 1,
0.380421, -1.128798, 3.943212, 0, 0, 1, 1, 1,
0.3814587, -0.3986939, 2.268542, 1, 0, 0, 1, 1,
0.3855721, 2.486314, 0.4618084, 1, 0, 0, 1, 1,
0.3878289, 0.4057831, 0.4261717, 1, 0, 0, 1, 1,
0.3918667, -0.2707421, 1.118225, 1, 0, 0, 1, 1,
0.3943845, 1.915645, 1.63853, 1, 0, 0, 1, 1,
0.396882, 2.043157, -0.4428651, 0, 0, 0, 1, 1,
0.397787, -1.414637, 1.804526, 0, 0, 0, 1, 1,
0.4011661, 1.129936, 0.1906858, 0, 0, 0, 1, 1,
0.4061597, 0.4234366, 2.352323, 0, 0, 0, 1, 1,
0.4063508, -2.071176, 1.167497, 0, 0, 0, 1, 1,
0.4083806, -0.596326, 3.055624, 0, 0, 0, 1, 1,
0.4085067, 0.4442267, 0.2789752, 0, 0, 0, 1, 1,
0.4163355, -0.5608403, 2.494699, 1, 1, 1, 1, 1,
0.4180001, 0.1562896, 0.3788229, 1, 1, 1, 1, 1,
0.4209808, 0.5342774, 0.2327468, 1, 1, 1, 1, 1,
0.4274503, -0.9699714, 2.94103, 1, 1, 1, 1, 1,
0.4341083, 0.6475191, 0.7544227, 1, 1, 1, 1, 1,
0.4342681, -1.138863, 0.9305174, 1, 1, 1, 1, 1,
0.4343494, 0.9699529, 0.4205016, 1, 1, 1, 1, 1,
0.4356026, -0.2595388, 2.069302, 1, 1, 1, 1, 1,
0.4364578, 0.8619145, 1.194903, 1, 1, 1, 1, 1,
0.4468761, -0.686896, 3.686403, 1, 1, 1, 1, 1,
0.4477856, -0.4495671, 1.069749, 1, 1, 1, 1, 1,
0.4525931, -0.2619601, 1.582688, 1, 1, 1, 1, 1,
0.4556057, -0.6373152, 2.22603, 1, 1, 1, 1, 1,
0.4665127, 0.9680685, 1.5176, 1, 1, 1, 1, 1,
0.4694637, -0.9279695, 1.979071, 1, 1, 1, 1, 1,
0.469655, -0.6316971, 2.023642, 0, 0, 1, 1, 1,
0.4741565, -0.7805371, 2.437077, 1, 0, 0, 1, 1,
0.4754981, -1.323952, 2.731388, 1, 0, 0, 1, 1,
0.4756008, 0.4132357, -0.1368661, 1, 0, 0, 1, 1,
0.4784846, 0.02682406, 0.6588737, 1, 0, 0, 1, 1,
0.4788739, -0.8525506, 2.217743, 1, 0, 0, 1, 1,
0.4835568, 0.4518466, 2.948962, 0, 0, 0, 1, 1,
0.4862294, -0.3050894, 2.769868, 0, 0, 0, 1, 1,
0.492048, 0.9367579, 1.115841, 0, 0, 0, 1, 1,
0.493313, -0.3495799, 1.481249, 0, 0, 0, 1, 1,
0.4939544, 1.055868, 1.083129, 0, 0, 0, 1, 1,
0.4979019, -0.9770936, 2.160053, 0, 0, 0, 1, 1,
0.4988473, -1.329703, 3.223429, 0, 0, 0, 1, 1,
0.5052106, -1.619717, 2.881226, 1, 1, 1, 1, 1,
0.5093316, -0.148477, 2.643439, 1, 1, 1, 1, 1,
0.515287, -1.082823, 2.515604, 1, 1, 1, 1, 1,
0.5275211, -1.04461, 2.758703, 1, 1, 1, 1, 1,
0.528859, 2.504817, 1.389665, 1, 1, 1, 1, 1,
0.5315977, 1.050285, 1.623333, 1, 1, 1, 1, 1,
0.5329761, 0.08693097, 1.592478, 1, 1, 1, 1, 1,
0.5355974, 0.8211622, 1.615489, 1, 1, 1, 1, 1,
0.5385151, -0.0783096, 1.747263, 1, 1, 1, 1, 1,
0.5393786, -1.953181, 3.357605, 1, 1, 1, 1, 1,
0.5398958, 0.1070216, 1.769501, 1, 1, 1, 1, 1,
0.5404588, -1.190745, 3.013634, 1, 1, 1, 1, 1,
0.5426357, -0.7999777, 0.4935976, 1, 1, 1, 1, 1,
0.5432913, 0.2696631, 0.7744554, 1, 1, 1, 1, 1,
0.5490177, -0.9839106, 2.036106, 1, 1, 1, 1, 1,
0.5512611, -1.212101, 1.018932, 0, 0, 1, 1, 1,
0.5513745, 0.4126127, 0.4418712, 1, 0, 0, 1, 1,
0.5518576, 0.6851166, -0.1841118, 1, 0, 0, 1, 1,
0.5530462, -1.679482, 3.498158, 1, 0, 0, 1, 1,
0.5601761, 0.1291263, 0.9316345, 1, 0, 0, 1, 1,
0.561891, 0.8457878, -0.9221679, 1, 0, 0, 1, 1,
0.5625707, -0.1498259, 3.729317, 0, 0, 0, 1, 1,
0.5756022, -0.9026445, 2.646868, 0, 0, 0, 1, 1,
0.580013, 1.074101, -0.1529127, 0, 0, 0, 1, 1,
0.5836551, -0.6280304, 0.8818972, 0, 0, 0, 1, 1,
0.5847517, -0.2893863, 1.210305, 0, 0, 0, 1, 1,
0.5855255, -0.1586699, 1.498419, 0, 0, 0, 1, 1,
0.591989, -0.146792, 2.219692, 0, 0, 0, 1, 1,
0.5935752, -0.1959588, 1.774818, 1, 1, 1, 1, 1,
0.5964893, -0.002185996, 0.8417137, 1, 1, 1, 1, 1,
0.5993372, 1.25735, 0.0273852, 1, 1, 1, 1, 1,
0.6007102, 0.05361148, 2.387645, 1, 1, 1, 1, 1,
0.6033704, -1.022967, 5.176681, 1, 1, 1, 1, 1,
0.6035222, -0.5408562, 3.238952, 1, 1, 1, 1, 1,
0.6037403, 0.03737781, 0.8788866, 1, 1, 1, 1, 1,
0.6075118, 2.067572, 1.638549, 1, 1, 1, 1, 1,
0.6104283, -0.1004692, 1.902043, 1, 1, 1, 1, 1,
0.6112051, -0.09505887, 2.666642, 1, 1, 1, 1, 1,
0.6152717, 0.8519892, 1.157206, 1, 1, 1, 1, 1,
0.6212245, 0.2863898, 1.445886, 1, 1, 1, 1, 1,
0.6288019, -0.2607748, 0.9585003, 1, 1, 1, 1, 1,
0.6376094, -1.066537, 2.387423, 1, 1, 1, 1, 1,
0.6384477, 1.066337, 0.426136, 1, 1, 1, 1, 1,
0.638482, -0.9205379, 3.493489, 0, 0, 1, 1, 1,
0.6398094, -0.4555202, 1.048309, 1, 0, 0, 1, 1,
0.6490794, -0.1341013, 1.694674, 1, 0, 0, 1, 1,
0.650463, 1.432258, 1.19709, 1, 0, 0, 1, 1,
0.6549237, -1.812385, 3.734481, 1, 0, 0, 1, 1,
0.6560671, 0.1890502, -0.3444109, 1, 0, 0, 1, 1,
0.6561261, -0.8152813, 2.343835, 0, 0, 0, 1, 1,
0.6574782, -1.157604, 3.69323, 0, 0, 0, 1, 1,
0.6593883, 1.214038, 0.312235, 0, 0, 0, 1, 1,
0.6606296, 0.8567302, 2.037804, 0, 0, 0, 1, 1,
0.6674358, -1.141611, 2.346067, 0, 0, 0, 1, 1,
0.6695698, 0.173186, 1.006093, 0, 0, 0, 1, 1,
0.6708925, 2.113143, 0.3946327, 0, 0, 0, 1, 1,
0.6718081, -0.6687005, 2.135844, 1, 1, 1, 1, 1,
0.6724371, -1.406515, 1.312161, 1, 1, 1, 1, 1,
0.6759185, -1.131914, 1.216424, 1, 1, 1, 1, 1,
0.6881003, 0.4323873, 0.7311896, 1, 1, 1, 1, 1,
0.6894273, 0.0335049, 2.538577, 1, 1, 1, 1, 1,
0.691727, 1.845301, 0.1763965, 1, 1, 1, 1, 1,
0.7087088, -0.9112467, 5.158299, 1, 1, 1, 1, 1,
0.7142676, 0.09890912, 2.881576, 1, 1, 1, 1, 1,
0.7155533, -1.960322, 2.067482, 1, 1, 1, 1, 1,
0.7182996, 1.520595, -0.03853853, 1, 1, 1, 1, 1,
0.720416, 1.730445, -1.048701, 1, 1, 1, 1, 1,
0.7242573, 1.251665, 0.5830373, 1, 1, 1, 1, 1,
0.7302582, 1.403018, 0.01085734, 1, 1, 1, 1, 1,
0.7303177, 1.325211, 1.233008, 1, 1, 1, 1, 1,
0.7313355, -0.907446, 1.329219, 1, 1, 1, 1, 1,
0.7349789, 0.0568093, -0.1601621, 0, 0, 1, 1, 1,
0.7369381, -0.008732432, 2.262563, 1, 0, 0, 1, 1,
0.7406946, -1.471141, 5.673514, 1, 0, 0, 1, 1,
0.7409167, 0.4528151, 1.496976, 1, 0, 0, 1, 1,
0.7434741, -0.3558679, 2.724281, 1, 0, 0, 1, 1,
0.7486035, -0.6491826, 3.578781, 1, 0, 0, 1, 1,
0.7518148, -0.5803556, 2.011686, 0, 0, 0, 1, 1,
0.7550859, -0.4547772, 0.2299414, 0, 0, 0, 1, 1,
0.7666839, -0.7542034, 1.181106, 0, 0, 0, 1, 1,
0.7696691, 0.8821634, 1.295812, 0, 0, 0, 1, 1,
0.7755894, -0.8899406, 1.987242, 0, 0, 0, 1, 1,
0.7775298, 0.376361, 0.9011388, 0, 0, 0, 1, 1,
0.7803928, -0.1451201, -0.1123497, 0, 0, 0, 1, 1,
0.7813269, 0.6517888, 1.600375, 1, 1, 1, 1, 1,
0.7858142, -0.01934556, -0.2516784, 1, 1, 1, 1, 1,
0.7862931, 0.7728141, 1.045446, 1, 1, 1, 1, 1,
0.7930888, -0.9761652, 3.941162, 1, 1, 1, 1, 1,
0.7944263, 2.407036, -0.180786, 1, 1, 1, 1, 1,
0.7964315, -0.06380391, 1.101149, 1, 1, 1, 1, 1,
0.7977728, -0.8039344, 0.1955832, 1, 1, 1, 1, 1,
0.7995885, -0.9635133, 2.855379, 1, 1, 1, 1, 1,
0.801623, -1.232801, 1.694694, 1, 1, 1, 1, 1,
0.8028218, 0.7027121, 0.400472, 1, 1, 1, 1, 1,
0.8032597, -0.2345182, 4.248178, 1, 1, 1, 1, 1,
0.8060913, 0.9338003, -0.07046968, 1, 1, 1, 1, 1,
0.8065185, 1.438999, -0.02183605, 1, 1, 1, 1, 1,
0.8098493, -2.249698, 3.077668, 1, 1, 1, 1, 1,
0.819537, -0.5986154, 0.5820853, 1, 1, 1, 1, 1,
0.8203401, -0.6768033, 2.258029, 0, 0, 1, 1, 1,
0.8261575, -0.3868804, 2.689794, 1, 0, 0, 1, 1,
0.8283245, 0.2648968, -0.0001369834, 1, 0, 0, 1, 1,
0.8300964, -0.3059299, 1.502876, 1, 0, 0, 1, 1,
0.8302175, -1.62319, 0.3388978, 1, 0, 0, 1, 1,
0.8330586, -1.661134, 2.074867, 1, 0, 0, 1, 1,
0.8378465, 0.9340735, 1.506591, 0, 0, 0, 1, 1,
0.8424648, 0.9378516, 1.095945, 0, 0, 0, 1, 1,
0.8486584, 0.5473316, 1.114329, 0, 0, 0, 1, 1,
0.8506669, -0.5277666, 2.633654, 0, 0, 0, 1, 1,
0.8533414, 0.4409059, 0.6232469, 0, 0, 0, 1, 1,
0.8561723, -0.6314121, 0.913392, 0, 0, 0, 1, 1,
0.8563739, 0.524352, 0.6549158, 0, 0, 0, 1, 1,
0.8577593, -0.1563113, 2.62643, 1, 1, 1, 1, 1,
0.8596421, -0.9421499, 1.776051, 1, 1, 1, 1, 1,
0.8602865, 0.8083181, 1.377257, 1, 1, 1, 1, 1,
0.8615458, 0.4643622, -0.1723228, 1, 1, 1, 1, 1,
0.8658862, 1.134849, 0.09003031, 1, 1, 1, 1, 1,
0.8661434, 0.6792435, -0.5827059, 1, 1, 1, 1, 1,
0.8668276, -1.38859, 1.586441, 1, 1, 1, 1, 1,
0.870043, -1.389542, 2.433156, 1, 1, 1, 1, 1,
0.8707905, -0.2070543, 2.116639, 1, 1, 1, 1, 1,
0.8746483, -0.5014811, 2.008713, 1, 1, 1, 1, 1,
0.8765041, -1.074923, -0.1194717, 1, 1, 1, 1, 1,
0.8765449, -0.09030658, 1.466394, 1, 1, 1, 1, 1,
0.8786722, -1.597934, 2.798034, 1, 1, 1, 1, 1,
0.8810189, 1.109013, 2.600389, 1, 1, 1, 1, 1,
0.8823692, 1.388739, 1.378392, 1, 1, 1, 1, 1,
0.8826323, -0.216534, 0.01781365, 0, 0, 1, 1, 1,
0.8863381, -1.003443, 1.707409, 1, 0, 0, 1, 1,
0.8877519, -0.3537751, 2.472834, 1, 0, 0, 1, 1,
0.8884544, -0.2750322, 1.327587, 1, 0, 0, 1, 1,
0.8914647, -1.398273, 4.475916, 1, 0, 0, 1, 1,
0.8989829, 0.07526413, -0.2275615, 1, 0, 0, 1, 1,
0.914183, 0.6888346, 1.679639, 0, 0, 0, 1, 1,
0.9186916, 1.767576, 1.386158, 0, 0, 0, 1, 1,
0.9224759, -0.08566591, 1.70935, 0, 0, 0, 1, 1,
0.9242967, 0.8107248, 2.874954, 0, 0, 0, 1, 1,
0.9311558, -1.949547, 3.373719, 0, 0, 0, 1, 1,
0.9344462, -0.9217167, 1.787373, 0, 0, 0, 1, 1,
0.9354553, 0.5204137, 0.9370856, 0, 0, 0, 1, 1,
0.9372873, 0.2185218, 1.082617, 1, 1, 1, 1, 1,
0.9375004, 0.1893477, 2.828649, 1, 1, 1, 1, 1,
0.9377916, -0.8379723, 2.561222, 1, 1, 1, 1, 1,
0.9400021, -0.6242633, 0.9745684, 1, 1, 1, 1, 1,
0.9510188, 0.5308785, 0.115123, 1, 1, 1, 1, 1,
0.951994, -0.8831212, 2.84826, 1, 1, 1, 1, 1,
0.9598137, -0.5115598, 2.374777, 1, 1, 1, 1, 1,
0.9672989, 0.6248791, 2.128905, 1, 1, 1, 1, 1,
0.9715834, 0.7814265, 2.185795, 1, 1, 1, 1, 1,
0.9740645, -0.3764494, 2.375984, 1, 1, 1, 1, 1,
0.9761538, 1.525363, 0.5223597, 1, 1, 1, 1, 1,
0.9776374, 2.009545, -0.006631684, 1, 1, 1, 1, 1,
0.9796435, -0.09350758, 3.440545, 1, 1, 1, 1, 1,
0.9828444, 0.5489568, 1.839338, 1, 1, 1, 1, 1,
0.9894593, 0.4183971, 0.6618811, 1, 1, 1, 1, 1,
0.9895008, 2.776963, 0.1262066, 0, 0, 1, 1, 1,
0.9904901, 0.9763321, 1.368737, 1, 0, 0, 1, 1,
0.9909643, 0.9015223, -1.837666, 1, 0, 0, 1, 1,
0.9920626, -0.5069582, 2.714137, 1, 0, 0, 1, 1,
0.9950484, -0.4704228, 2.660626, 1, 0, 0, 1, 1,
0.9997466, 1.410497, -0.457155, 1, 0, 0, 1, 1,
1.004042, 1.570072, 2.055719, 0, 0, 0, 1, 1,
1.011046, 0.8139248, 0.7526085, 0, 0, 0, 1, 1,
1.013533, 0.5319675, -0.1636636, 0, 0, 0, 1, 1,
1.02784, -0.005286723, 3.474231, 0, 0, 0, 1, 1,
1.029737, -0.7194675, 2.903855, 0, 0, 0, 1, 1,
1.029898, 0.9953707, 0.9591763, 0, 0, 0, 1, 1,
1.033066, -0.242213, 2.322409, 0, 0, 0, 1, 1,
1.038519, -1.127764, 1.398444, 1, 1, 1, 1, 1,
1.050748, -1.098817, 2.080517, 1, 1, 1, 1, 1,
1.065098, -2.381464, 2.836112, 1, 1, 1, 1, 1,
1.073315, 0.3675503, -2.165124, 1, 1, 1, 1, 1,
1.077938, 0.5949722, -0.07688598, 1, 1, 1, 1, 1,
1.07972, 0.1583052, 0.7827292, 1, 1, 1, 1, 1,
1.082839, 1.262778, 1.189041, 1, 1, 1, 1, 1,
1.105318, 0.5073922, -0.04423943, 1, 1, 1, 1, 1,
1.110209, 0.7232738, 1.001243, 1, 1, 1, 1, 1,
1.110702, -0.9810314, 0.7603315, 1, 1, 1, 1, 1,
1.112376, 1.57939, -1.735046, 1, 1, 1, 1, 1,
1.116816, -0.1721062, 0.831062, 1, 1, 1, 1, 1,
1.119027, 0.4159139, 1.077838, 1, 1, 1, 1, 1,
1.121986, 0.728061, 1.349413, 1, 1, 1, 1, 1,
1.122175, -0.01605064, 1.823233, 1, 1, 1, 1, 1,
1.125243, 1.822883, 0.1077636, 0, 0, 1, 1, 1,
1.127934, -0.3028847, 1.976929, 1, 0, 0, 1, 1,
1.130118, -0.3256422, 0.4227761, 1, 0, 0, 1, 1,
1.131021, -0.3481144, 2.453805, 1, 0, 0, 1, 1,
1.136494, 0.8389934, -0.262379, 1, 0, 0, 1, 1,
1.136511, -1.666262, 3.854306, 1, 0, 0, 1, 1,
1.137655, 0.7923811, 1.523075, 0, 0, 0, 1, 1,
1.139701, -0.3620219, 2.769996, 0, 0, 0, 1, 1,
1.148036, 0.7325565, 1.688633, 0, 0, 0, 1, 1,
1.152298, 0.06485915, 2.847758, 0, 0, 0, 1, 1,
1.155234, 0.4636707, 1.498128, 0, 0, 0, 1, 1,
1.155456, 1.584611, 0.7835451, 0, 0, 0, 1, 1,
1.156875, -0.4704271, 2.014097, 0, 0, 0, 1, 1,
1.157923, -0.6760524, 1.070105, 1, 1, 1, 1, 1,
1.169505, 0.6627177, 1.231158, 1, 1, 1, 1, 1,
1.179273, -0.3852002, 1.461034, 1, 1, 1, 1, 1,
1.189376, -1.720931, 3.181428, 1, 1, 1, 1, 1,
1.189956, 0.7720777, 1.061813, 1, 1, 1, 1, 1,
1.193686, -0.3144722, 3.186531, 1, 1, 1, 1, 1,
1.200266, 0.4462298, 0.5256345, 1, 1, 1, 1, 1,
1.200561, -1.580902, 3.060982, 1, 1, 1, 1, 1,
1.203676, 2.151656, 0.4139188, 1, 1, 1, 1, 1,
1.208109, 0.02768264, 2.289372, 1, 1, 1, 1, 1,
1.209566, 1.23406, 0.8913648, 1, 1, 1, 1, 1,
1.216311, -1.060309, 2.798417, 1, 1, 1, 1, 1,
1.219308, 1.214201, 0.2580038, 1, 1, 1, 1, 1,
1.220903, -0.7678524, 3.261428, 1, 1, 1, 1, 1,
1.223845, 0.1742574, 1.165634, 1, 1, 1, 1, 1,
1.231806, 0.3923283, 2.302273, 0, 0, 1, 1, 1,
1.234014, 0.6621583, 1.599042, 1, 0, 0, 1, 1,
1.241594, 0.3944127, 1.095439, 1, 0, 0, 1, 1,
1.251156, -0.5525739, 4.941449, 1, 0, 0, 1, 1,
1.253825, -0.6051221, 1.702929, 1, 0, 0, 1, 1,
1.271636, -1.488732, 3.260375, 1, 0, 0, 1, 1,
1.272012, -0.428669, 4.039041, 0, 0, 0, 1, 1,
1.300048, -0.7161917, 3.240723, 0, 0, 0, 1, 1,
1.304676, -2.087733, 3.030653, 0, 0, 0, 1, 1,
1.309083, -0.4812948, 2.611451, 0, 0, 0, 1, 1,
1.310276, -0.6162221, 2.894835, 0, 0, 0, 1, 1,
1.310422, -0.1967394, 2.645864, 0, 0, 0, 1, 1,
1.313662, -0.8872063, 2.033727, 0, 0, 0, 1, 1,
1.326842, -0.2150525, 1.302002, 1, 1, 1, 1, 1,
1.328711, 1.001973, 0.02502968, 1, 1, 1, 1, 1,
1.329199, 0.7961914, 0.4086238, 1, 1, 1, 1, 1,
1.341179, 0.1942773, 0.9394369, 1, 1, 1, 1, 1,
1.350075, 1.2173, 2.110285, 1, 1, 1, 1, 1,
1.353019, 1.220873, 1.190558, 1, 1, 1, 1, 1,
1.355962, 1.226443, 1.531542, 1, 1, 1, 1, 1,
1.357322, -0.5085224, 2.075521, 1, 1, 1, 1, 1,
1.36234, 0.4311621, 1.884324, 1, 1, 1, 1, 1,
1.371272, -0.5353099, 3.132295, 1, 1, 1, 1, 1,
1.374448, 1.901836, -0.8120882, 1, 1, 1, 1, 1,
1.375674, -1.089063, 1.08937, 1, 1, 1, 1, 1,
1.379903, -1.816824, 2.553624, 1, 1, 1, 1, 1,
1.392235, -2.153488, 2.872535, 1, 1, 1, 1, 1,
1.40619, 0.4592823, 1.005654, 1, 1, 1, 1, 1,
1.415319, -2.130424, 3.979466, 0, 0, 1, 1, 1,
1.420194, 0.4616401, 2.633585, 1, 0, 0, 1, 1,
1.423873, -0.7273796, 0.3403542, 1, 0, 0, 1, 1,
1.429615, -2.132797, 3.605349, 1, 0, 0, 1, 1,
1.430973, 1.210025, 1.38927, 1, 0, 0, 1, 1,
1.430977, 0.7161976, -0.2042285, 1, 0, 0, 1, 1,
1.432617, -0.4008053, 1.882009, 0, 0, 0, 1, 1,
1.436727, 0.6120535, 2.13623, 0, 0, 0, 1, 1,
1.442575, 0.7309533, 1.941456, 0, 0, 0, 1, 1,
1.46341, -1.084903, 1.535509, 0, 0, 0, 1, 1,
1.471245, 1.124017, 1.023834, 0, 0, 0, 1, 1,
1.490225, 1.641461, 1.524631, 0, 0, 0, 1, 1,
1.502627, 0.04706973, 3.074297, 0, 0, 0, 1, 1,
1.508806, 0.3117613, 1.210028, 1, 1, 1, 1, 1,
1.510596, 1.842547, -1.925753, 1, 1, 1, 1, 1,
1.511829, -1.328072, 3.369819, 1, 1, 1, 1, 1,
1.512929, -0.7699052, 0.6793952, 1, 1, 1, 1, 1,
1.516921, -0.6493953, 1.495087, 1, 1, 1, 1, 1,
1.521249, 1.043756, 1.696789, 1, 1, 1, 1, 1,
1.526611, 0.7153236, 0.5170201, 1, 1, 1, 1, 1,
1.53497, -0.2653646, 1.776693, 1, 1, 1, 1, 1,
1.556165, 0.4596156, 0.8214002, 1, 1, 1, 1, 1,
1.572961, -0.5939347, 0.9086661, 1, 1, 1, 1, 1,
1.592658, 1.527735, 1.661784, 1, 1, 1, 1, 1,
1.602875, -1.689748, 2.430702, 1, 1, 1, 1, 1,
1.607839, -0.1559862, 1.00347, 1, 1, 1, 1, 1,
1.612496, -0.0375808, 2.156353, 1, 1, 1, 1, 1,
1.654336, 0.6616991, 2.754608, 1, 1, 1, 1, 1,
1.658875, 0.4746285, 1.961233, 0, 0, 1, 1, 1,
1.675754, 0.9265367, 2.035161, 1, 0, 0, 1, 1,
1.694657, -0.821322, 3.14758, 1, 0, 0, 1, 1,
1.699698, 0.104678, 1.024053, 1, 0, 0, 1, 1,
1.721091, -0.02350306, 3.290758, 1, 0, 0, 1, 1,
1.72412, -0.5381693, 3.795838, 1, 0, 0, 1, 1,
1.725647, 0.2456928, 2.772173, 0, 0, 0, 1, 1,
1.743647, -2.128225, 1.43815, 0, 0, 0, 1, 1,
1.748856, 0.4785059, 0.8010103, 0, 0, 0, 1, 1,
1.754676, 0.6544219, 0.724614, 0, 0, 0, 1, 1,
1.755443, -0.1436772, 0.5498415, 0, 0, 0, 1, 1,
1.772526, 0.2017723, 1.828155, 0, 0, 0, 1, 1,
1.814016, 0.6659826, 1.035936, 0, 0, 0, 1, 1,
1.823428, -1.500363, 3.542746, 1, 1, 1, 1, 1,
1.846482, -0.3465277, 3.400184, 1, 1, 1, 1, 1,
1.862041, 0.8025165, 2.062758, 1, 1, 1, 1, 1,
1.880408, -1.573906, 3.356993, 1, 1, 1, 1, 1,
1.88832, -0.8071617, 2.955226, 1, 1, 1, 1, 1,
1.89201, -0.479467, 3.253344, 1, 1, 1, 1, 1,
1.895099, 0.1519801, 0.3116378, 1, 1, 1, 1, 1,
1.901765, -2.966466, 2.463288, 1, 1, 1, 1, 1,
1.932119, -1.253024, 3.202091, 1, 1, 1, 1, 1,
2.011841, -0.3997031, 0.7755931, 1, 1, 1, 1, 1,
2.012228, -1.664179, 2.280641, 1, 1, 1, 1, 1,
2.021641, 0.2818529, 0.7384441, 1, 1, 1, 1, 1,
2.021719, -1.342298, 2.06888, 1, 1, 1, 1, 1,
2.051807, -1.251502, 1.006157, 1, 1, 1, 1, 1,
2.067727, 1.188537, 0.116278, 1, 1, 1, 1, 1,
2.08646, -1.441009, 2.867698, 0, 0, 1, 1, 1,
2.154859, -0.2664535, 1.561188, 1, 0, 0, 1, 1,
2.218879, -0.5203424, 2.015093, 1, 0, 0, 1, 1,
2.22597, -0.3803656, 2.09497, 1, 0, 0, 1, 1,
2.262348, -0.3666592, 1.512777, 1, 0, 0, 1, 1,
2.273576, 0.06022543, 1.007128, 1, 0, 0, 1, 1,
2.28773, -2.64215, 1.105922, 0, 0, 0, 1, 1,
2.311963, 1.76542, 0.02531403, 0, 0, 0, 1, 1,
2.343851, -0.07779113, 0.2083896, 0, 0, 0, 1, 1,
2.398443, -0.9115175, 2.43191, 0, 0, 0, 1, 1,
2.408106, 0.3934688, 1.499773, 0, 0, 0, 1, 1,
2.409915, -0.9903982, 3.105097, 0, 0, 0, 1, 1,
2.417484, 0.5614681, 1.778681, 0, 0, 0, 1, 1,
2.458349, 0.03713506, 1.561321, 1, 1, 1, 1, 1,
2.558452, -0.8271462, -0.5558108, 1, 1, 1, 1, 1,
2.606896, -0.3665579, 3.591509, 1, 1, 1, 1, 1,
2.648343, 2.125898, 1.061245, 1, 1, 1, 1, 1,
2.67253, 2.746468, 2.753146, 1, 1, 1, 1, 1,
2.849107, 1.648734, 1.765865, 1, 1, 1, 1, 1,
2.92964, 0.9337087, 0.2718882, 1, 1, 1, 1, 1
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
var radius = 9.736507;
var distance = 34.19907;
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
mvMatrix.translate( 0.2039758, -0.005193949, -0.1490657 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19907);
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