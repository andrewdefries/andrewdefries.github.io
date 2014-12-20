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
-3.233346, -1.051378, -3.346709, 1, 0, 0, 1,
-2.867914, 0.3856793, -1.408491, 1, 0.007843138, 0, 1,
-2.773296, -0.5485801, -1.644221, 1, 0.01176471, 0, 1,
-2.770029, 1.651247, -1.678915, 1, 0.01960784, 0, 1,
-2.751379, -1.687303, -1.69015, 1, 0.02352941, 0, 1,
-2.710665, 0.1300293, -0.2410744, 1, 0.03137255, 0, 1,
-2.705403, -1.090489, -2.380456, 1, 0.03529412, 0, 1,
-2.697057, -1.044623, -1.808174, 1, 0.04313726, 0, 1,
-2.615636, 1.141025, -0.6801562, 1, 0.04705882, 0, 1,
-2.582161, 0.9533809, -0.8564294, 1, 0.05490196, 0, 1,
-2.562203, 0.9359768, -0.8081157, 1, 0.05882353, 0, 1,
-2.499942, -0.5445263, -1.591581, 1, 0.06666667, 0, 1,
-2.49557, -0.834883, -1.575639, 1, 0.07058824, 0, 1,
-2.486609, 0.5132719, -2.018951, 1, 0.07843138, 0, 1,
-2.41475, 0.1386117, -4.30041, 1, 0.08235294, 0, 1,
-2.339298, 1.376677, -1.452107, 1, 0.09019608, 0, 1,
-2.274928, -0.5290231, -1.79795, 1, 0.09411765, 0, 1,
-2.241903, -0.2452215, -2.685714, 1, 0.1019608, 0, 1,
-2.213654, -0.6639504, -0.501399, 1, 0.1098039, 0, 1,
-2.19318, 0.4500548, -1.443941, 1, 0.1137255, 0, 1,
-2.125604, -0.5650767, -2.189106, 1, 0.1215686, 0, 1,
-2.089421, 0.3395219, -3.393304, 1, 0.1254902, 0, 1,
-2.036139, 0.2143182, -1.015504, 1, 0.1333333, 0, 1,
-2.030564, 0.5415753, -3.052155, 1, 0.1372549, 0, 1,
-2.016317, -0.09322347, -2.308282, 1, 0.145098, 0, 1,
-1.978905, -0.3847086, -2.447413, 1, 0.1490196, 0, 1,
-1.971584, -0.4409241, -2.851881, 1, 0.1568628, 0, 1,
-1.969845, 0.02609471, -1.961303, 1, 0.1607843, 0, 1,
-1.965681, 1.262673, -0.5194587, 1, 0.1686275, 0, 1,
-1.96427, -0.3924031, -2.615929, 1, 0.172549, 0, 1,
-1.935776, 2.34598, -0.2105752, 1, 0.1803922, 0, 1,
-1.933431, 0.3270264, -0.8410057, 1, 0.1843137, 0, 1,
-1.928961, 1.134372, -0.4377773, 1, 0.1921569, 0, 1,
-1.899616, -0.4454795, 0.01773372, 1, 0.1960784, 0, 1,
-1.88664, 0.4989545, -0.4868127, 1, 0.2039216, 0, 1,
-1.864925, 1.330623, -1.496134, 1, 0.2117647, 0, 1,
-1.831746, -1.253766, -1.89692, 1, 0.2156863, 0, 1,
-1.82474, -2.028894, -1.692943, 1, 0.2235294, 0, 1,
-1.81394, -2.447954, -4.343627, 1, 0.227451, 0, 1,
-1.805437, 1.249769, 0.6062102, 1, 0.2352941, 0, 1,
-1.80024, -0.1491117, -1.67084, 1, 0.2392157, 0, 1,
-1.794799, -0.2028131, -0.9268624, 1, 0.2470588, 0, 1,
-1.772295, 0.5788342, -1.911493, 1, 0.2509804, 0, 1,
-1.771079, -0.1589765, -1.960855, 1, 0.2588235, 0, 1,
-1.760269, -1.620613, -2.271048, 1, 0.2627451, 0, 1,
-1.754167, 0.8450516, -1.763589, 1, 0.2705882, 0, 1,
-1.74386, -0.492175, -2.601906, 1, 0.2745098, 0, 1,
-1.723245, 0.1263094, -1.202451, 1, 0.282353, 0, 1,
-1.721233, 0.5766048, -0.9817635, 1, 0.2862745, 0, 1,
-1.720943, -1.194808, -3.293391, 1, 0.2941177, 0, 1,
-1.700607, 1.533101, -0.4591127, 1, 0.3019608, 0, 1,
-1.688511, 1.011739, -1.340097, 1, 0.3058824, 0, 1,
-1.682039, 0.3780539, -0.6866013, 1, 0.3137255, 0, 1,
-1.678787, -1.288987, -2.620871, 1, 0.3176471, 0, 1,
-1.675608, -0.7846206, -2.932932, 1, 0.3254902, 0, 1,
-1.672274, -1.203017, -3.714178, 1, 0.3294118, 0, 1,
-1.670776, 1.068112, 0.9426581, 1, 0.3372549, 0, 1,
-1.66535, -0.2405778, -0.9981257, 1, 0.3411765, 0, 1,
-1.623297, -0.1666494, -2.534538, 1, 0.3490196, 0, 1,
-1.62223, -1.296749, -2.340924, 1, 0.3529412, 0, 1,
-1.61617, 0.8250479, -1.324968, 1, 0.3607843, 0, 1,
-1.61572, -0.5200577, -2.545689, 1, 0.3647059, 0, 1,
-1.585649, -1.979792, -2.460323, 1, 0.372549, 0, 1,
-1.584275, 1.964713, -1.018297, 1, 0.3764706, 0, 1,
-1.581482, 0.6362294, -0.8484426, 1, 0.3843137, 0, 1,
-1.568899, -1.597894, -3.687615, 1, 0.3882353, 0, 1,
-1.509905, -0.1503407, -0.2157793, 1, 0.3960784, 0, 1,
-1.505991, -0.1208411, -0.6781638, 1, 0.4039216, 0, 1,
-1.498593, 2.074203, -0.164185, 1, 0.4078431, 0, 1,
-1.488912, -1.524302, -1.797055, 1, 0.4156863, 0, 1,
-1.481656, -0.6860356, -0.6052617, 1, 0.4196078, 0, 1,
-1.478174, -0.1406949, -2.951629, 1, 0.427451, 0, 1,
-1.474552, 0.3708001, -2.826232, 1, 0.4313726, 0, 1,
-1.470152, 0.367548, 0.5744844, 1, 0.4392157, 0, 1,
-1.458435, 1.144863, 0.3502676, 1, 0.4431373, 0, 1,
-1.451398, -0.6933008, -2.940044, 1, 0.4509804, 0, 1,
-1.447221, -0.4166142, -3.146402, 1, 0.454902, 0, 1,
-1.42011, 0.6749097, -1.28273, 1, 0.4627451, 0, 1,
-1.419588, 1.816724, -2.356889, 1, 0.4666667, 0, 1,
-1.403983, 0.5515105, -1.892795, 1, 0.4745098, 0, 1,
-1.40394, -0.2607192, -2.315839, 1, 0.4784314, 0, 1,
-1.395679, -1.812559, -1.68122, 1, 0.4862745, 0, 1,
-1.393838, -0.4481646, -1.45064, 1, 0.4901961, 0, 1,
-1.388341, -1.109482, -2.003785, 1, 0.4980392, 0, 1,
-1.387417, 0.3940462, -2.305856, 1, 0.5058824, 0, 1,
-1.386627, -0.2908559, -2.149465, 1, 0.509804, 0, 1,
-1.362019, 0.4082749, -1.588528, 1, 0.5176471, 0, 1,
-1.350691, -0.9038365, -1.304161, 1, 0.5215687, 0, 1,
-1.346108, 0.02155656, -1.449637, 1, 0.5294118, 0, 1,
-1.33225, 1.111475, -1.616872, 1, 0.5333334, 0, 1,
-1.331023, 0.1390975, -1.873341, 1, 0.5411765, 0, 1,
-1.325603, -0.9582394, -1.753384, 1, 0.5450981, 0, 1,
-1.315988, -0.5882505, -1.328354, 1, 0.5529412, 0, 1,
-1.309235, -0.7008346, -2.968261, 1, 0.5568628, 0, 1,
-1.303742, 1.583796, -0.7138693, 1, 0.5647059, 0, 1,
-1.298283, -0.02598318, -2.028755, 1, 0.5686275, 0, 1,
-1.294869, -0.9858266, -1.763647, 1, 0.5764706, 0, 1,
-1.288453, -0.7079548, -2.137729, 1, 0.5803922, 0, 1,
-1.2862, -1.443604, -1.882317, 1, 0.5882353, 0, 1,
-1.282988, 0.3324243, -0.59606, 1, 0.5921569, 0, 1,
-1.265246, -1.808283, -4.285846, 1, 0.6, 0, 1,
-1.262168, 0.198664, -0.9484597, 1, 0.6078432, 0, 1,
-1.237867, -0.7766933, -2.268351, 1, 0.6117647, 0, 1,
-1.234894, -1.038903, -2.46385, 1, 0.6196079, 0, 1,
-1.231233, -0.3356577, -1.463564, 1, 0.6235294, 0, 1,
-1.227871, 0.4640076, -2.814135, 1, 0.6313726, 0, 1,
-1.227331, -0.475023, -0.4292176, 1, 0.6352941, 0, 1,
-1.218376, -0.2060457, -2.570358, 1, 0.6431373, 0, 1,
-1.215765, 0.8813866, -0.2962991, 1, 0.6470588, 0, 1,
-1.214604, 0.8862328, -1.134838, 1, 0.654902, 0, 1,
-1.181975, 1.19053, -2.161166, 1, 0.6588235, 0, 1,
-1.177754, 0.7441111, -0.7295092, 1, 0.6666667, 0, 1,
-1.172643, 0.1081189, -0.3753311, 1, 0.6705883, 0, 1,
-1.172354, -0.765981, -2.421359, 1, 0.6784314, 0, 1,
-1.162895, 0.2353954, -3.21693, 1, 0.682353, 0, 1,
-1.152213, 0.1706186, 0.3415753, 1, 0.6901961, 0, 1,
-1.142677, -0.03279686, -0.2404473, 1, 0.6941177, 0, 1,
-1.130493, 0.9057152, -2.054799, 1, 0.7019608, 0, 1,
-1.129959, 0.1858152, -0.3147377, 1, 0.7098039, 0, 1,
-1.126953, -0.1308108, -1.643387, 1, 0.7137255, 0, 1,
-1.121057, -1.116688, 1.401519, 1, 0.7215686, 0, 1,
-1.119228, -0.03266424, -0.1359579, 1, 0.7254902, 0, 1,
-1.115619, 0.8603639, -2.384549, 1, 0.7333333, 0, 1,
-1.111412, -0.06780212, -1.377201, 1, 0.7372549, 0, 1,
-1.110662, 0.1850242, -2.686247, 1, 0.7450981, 0, 1,
-1.108803, -0.6205162, -1.478857, 1, 0.7490196, 0, 1,
-1.105746, -0.5019614, -1.29008, 1, 0.7568628, 0, 1,
-1.103998, -0.4134106, -1.238785, 1, 0.7607843, 0, 1,
-1.098073, 0.976818, -1.470261, 1, 0.7686275, 0, 1,
-1.097461, -0.9457424, -2.874217, 1, 0.772549, 0, 1,
-1.095277, 0.1381854, -1.744189, 1, 0.7803922, 0, 1,
-1.091047, -1.066618, -1.859122, 1, 0.7843137, 0, 1,
-1.089882, -0.832947, -3.063452, 1, 0.7921569, 0, 1,
-1.086834, 1.792246, -1.037828, 1, 0.7960784, 0, 1,
-1.076494, -0.5366507, -2.796272, 1, 0.8039216, 0, 1,
-1.071873, 0.5571371, -0.5725713, 1, 0.8117647, 0, 1,
-1.071252, 1.641387, -1.164537, 1, 0.8156863, 0, 1,
-1.069352, -0.4453504, -2.083811, 1, 0.8235294, 0, 1,
-1.061633, -1.063536, -1.732396, 1, 0.827451, 0, 1,
-1.061106, -0.7246934, -3.318977, 1, 0.8352941, 0, 1,
-1.059887, 0.819409, -1.585557, 1, 0.8392157, 0, 1,
-1.054197, -0.9215772, -0.9380612, 1, 0.8470588, 0, 1,
-1.053798, -0.2662016, -0.6929125, 1, 0.8509804, 0, 1,
-1.053501, -0.6401072, -2.4306, 1, 0.8588235, 0, 1,
-1.052303, -1.017231, -1.523637, 1, 0.8627451, 0, 1,
-1.046464, -0.2309538, -3.114768, 1, 0.8705882, 0, 1,
-1.034635, -0.1954935, -2.522965, 1, 0.8745098, 0, 1,
-1.034573, 0.03513912, -1.40309, 1, 0.8823529, 0, 1,
-1.02881, -0.757895, -2.742404, 1, 0.8862745, 0, 1,
-1.027696, 0.6529396, -1.947326, 1, 0.8941177, 0, 1,
-1.027513, 0.04890072, -2.804292, 1, 0.8980392, 0, 1,
-1.018327, -0.9076253, -1.777294, 1, 0.9058824, 0, 1,
-1.00519, -1.24312, -1.612806, 1, 0.9137255, 0, 1,
-0.9982004, 2.107523, -1.762551, 1, 0.9176471, 0, 1,
-0.9916672, -0.4718534, -0.2334322, 1, 0.9254902, 0, 1,
-0.9843015, 1.445214, 0.3965949, 1, 0.9294118, 0, 1,
-0.9832008, -0.8222564, -2.675929, 1, 0.9372549, 0, 1,
-0.9822815, -0.5221598, -1.747252, 1, 0.9411765, 0, 1,
-0.9818408, -1.08347, -2.271834, 1, 0.9490196, 0, 1,
-0.9767517, -0.5430586, -2.581159, 1, 0.9529412, 0, 1,
-0.9716589, -0.3652928, -1.685148, 1, 0.9607843, 0, 1,
-0.9661687, -0.3550934, -2.309919, 1, 0.9647059, 0, 1,
-0.9651933, -0.5351465, -1.048407, 1, 0.972549, 0, 1,
-0.964062, -1.047904, -3.779765, 1, 0.9764706, 0, 1,
-0.9575973, -2.470277, -2.621143, 1, 0.9843137, 0, 1,
-0.9493982, 1.371272, -1.011932, 1, 0.9882353, 0, 1,
-0.9363396, 0.08817142, -1.277623, 1, 0.9960784, 0, 1,
-0.9336419, 0.6443409, -2.55324, 0.9960784, 1, 0, 1,
-0.9286941, -1.550214, -2.533607, 0.9921569, 1, 0, 1,
-0.9280437, 1.568322, -1.341969, 0.9843137, 1, 0, 1,
-0.9258182, 1.301734, -0.9065648, 0.9803922, 1, 0, 1,
-0.9234238, -0.7868967, -1.69986, 0.972549, 1, 0, 1,
-0.9224623, 0.6259848, -1.79989, 0.9686275, 1, 0, 1,
-0.9211712, -1.504849, -3.842993, 0.9607843, 1, 0, 1,
-0.9068584, 2.245461, -1.654677, 0.9568627, 1, 0, 1,
-0.9004897, 1.10445, -0.7311149, 0.9490196, 1, 0, 1,
-0.8976477, 0.6037064, -0.752959, 0.945098, 1, 0, 1,
-0.8922411, 0.6553875, 2.055857, 0.9372549, 1, 0, 1,
-0.8812423, -1.838292, -1.234516, 0.9333333, 1, 0, 1,
-0.8723771, 0.2038727, 1.306698, 0.9254902, 1, 0, 1,
-0.8706586, -0.9332188, -3.900418, 0.9215686, 1, 0, 1,
-0.870457, -0.897957, -2.501573, 0.9137255, 1, 0, 1,
-0.8681481, 0.9651827, 0.4343093, 0.9098039, 1, 0, 1,
-0.8630739, 0.3433346, -1.610623, 0.9019608, 1, 0, 1,
-0.8616993, -1.865398, -3.785513, 0.8941177, 1, 0, 1,
-0.8560411, 0.3045525, -1.44099, 0.8901961, 1, 0, 1,
-0.8554375, 0.1502181, -1.941374, 0.8823529, 1, 0, 1,
-0.8553171, -0.3101427, -2.593274, 0.8784314, 1, 0, 1,
-0.846058, 0.4107926, -0.6958287, 0.8705882, 1, 0, 1,
-0.8446965, 0.8713133, -1.242178, 0.8666667, 1, 0, 1,
-0.8336685, 1.252996, 1.637527, 0.8588235, 1, 0, 1,
-0.8334042, 0.4959722, 0.7983518, 0.854902, 1, 0, 1,
-0.8301129, -0.2209857, -2.30442, 0.8470588, 1, 0, 1,
-0.8273916, -1.300918, -1.79179, 0.8431373, 1, 0, 1,
-0.8255998, 0.1479669, -1.902651, 0.8352941, 1, 0, 1,
-0.8237118, -1.144536, -1.179042, 0.8313726, 1, 0, 1,
-0.823221, -0.8018354, -1.975741, 0.8235294, 1, 0, 1,
-0.8176072, -1.906735, -1.648807, 0.8196079, 1, 0, 1,
-0.8044453, -0.9681003, -3.5389, 0.8117647, 1, 0, 1,
-0.8013784, -0.6738589, -1.763755, 0.8078431, 1, 0, 1,
-0.796887, 1.692723, -1.649826, 0.8, 1, 0, 1,
-0.795254, 1.762925, -0.09277555, 0.7921569, 1, 0, 1,
-0.7952539, -0.2767468, -2.614424, 0.7882353, 1, 0, 1,
-0.7898553, -2.281227, -3.060099, 0.7803922, 1, 0, 1,
-0.7868156, 1.108522, -0.7384661, 0.7764706, 1, 0, 1,
-0.7843832, -0.2049084, -3.296687, 0.7686275, 1, 0, 1,
-0.7785593, -0.8765203, -3.853411, 0.7647059, 1, 0, 1,
-0.7775371, 0.4157628, -0.6895231, 0.7568628, 1, 0, 1,
-0.7705885, 0.6064447, 0.04147711, 0.7529412, 1, 0, 1,
-0.770469, -1.615038, -2.908918, 0.7450981, 1, 0, 1,
-0.766925, -0.7015276, -1.052708, 0.7411765, 1, 0, 1,
-0.7600703, 0.7695751, -1.081633, 0.7333333, 1, 0, 1,
-0.7578682, -2.256608, -3.30429, 0.7294118, 1, 0, 1,
-0.7544197, -0.6245854, -0.7648849, 0.7215686, 1, 0, 1,
-0.7440933, 1.118535, -1.606174, 0.7176471, 1, 0, 1,
-0.7434174, 0.1572649, 0.7603919, 0.7098039, 1, 0, 1,
-0.7397989, -0.9190094, -3.392781, 0.7058824, 1, 0, 1,
-0.7343099, 0.4484223, -1.21215, 0.6980392, 1, 0, 1,
-0.7330644, 0.02864972, -2.142906, 0.6901961, 1, 0, 1,
-0.7320811, -0.5780554, -2.667995, 0.6862745, 1, 0, 1,
-0.7318436, -0.2585568, -1.16398, 0.6784314, 1, 0, 1,
-0.7313179, -0.2924699, -2.964572, 0.6745098, 1, 0, 1,
-0.7300421, -0.01924423, -1.1409, 0.6666667, 1, 0, 1,
-0.7299175, -0.109047, -3.472514, 0.6627451, 1, 0, 1,
-0.7225016, -0.08185999, -1.437499, 0.654902, 1, 0, 1,
-0.7218944, -1.340385, -3.639158, 0.6509804, 1, 0, 1,
-0.7072837, -1.870648, -3.496376, 0.6431373, 1, 0, 1,
-0.6955255, 0.2664478, -0.8640189, 0.6392157, 1, 0, 1,
-0.6925662, -2.155564, -3.480866, 0.6313726, 1, 0, 1,
-0.690984, -0.5070097, -1.73275, 0.627451, 1, 0, 1,
-0.6909689, 0.7227345, 0.8494599, 0.6196079, 1, 0, 1,
-0.6828095, -0.9390259, -1.520053, 0.6156863, 1, 0, 1,
-0.6820894, -0.6880966, -4.176017, 0.6078432, 1, 0, 1,
-0.6793733, 0.4850679, -0.1538223, 0.6039216, 1, 0, 1,
-0.6785745, 1.896316, -0.873354, 0.5960785, 1, 0, 1,
-0.6781688, -0.05493667, -1.104803, 0.5882353, 1, 0, 1,
-0.6780319, -0.5494277, -2.876763, 0.5843138, 1, 0, 1,
-0.6710714, 0.4508314, 0.6467609, 0.5764706, 1, 0, 1,
-0.6676468, 0.3032193, -0.8734438, 0.572549, 1, 0, 1,
-0.6671718, 1.432634, -0.6536908, 0.5647059, 1, 0, 1,
-0.6633852, -0.08999835, -1.998484, 0.5607843, 1, 0, 1,
-0.6632319, 0.3451448, 0.872286, 0.5529412, 1, 0, 1,
-0.6575316, -0.2510821, -2.690856, 0.5490196, 1, 0, 1,
-0.6528624, 0.2276092, -1.377371, 0.5411765, 1, 0, 1,
-0.6502456, -1.663487, -3.59682, 0.5372549, 1, 0, 1,
-0.6496781, 1.235658, -0.9918575, 0.5294118, 1, 0, 1,
-0.6460766, 0.6651219, -1.503672, 0.5254902, 1, 0, 1,
-0.6448535, -0.922802, -1.711462, 0.5176471, 1, 0, 1,
-0.6398177, 0.5692644, 0.220345, 0.5137255, 1, 0, 1,
-0.6388369, 1.072973, -0.3080427, 0.5058824, 1, 0, 1,
-0.6370669, 0.1079632, -1.145167, 0.5019608, 1, 0, 1,
-0.6303301, 0.3909686, -1.857068, 0.4941176, 1, 0, 1,
-0.6299142, 0.1447405, 0.06856453, 0.4862745, 1, 0, 1,
-0.6266663, 0.1062233, -2.532413, 0.4823529, 1, 0, 1,
-0.6176151, -0.7526657, -1.079227, 0.4745098, 1, 0, 1,
-0.6163931, 2.421415, 0.9103704, 0.4705882, 1, 0, 1,
-0.6145741, -1.182375, -2.381925, 0.4627451, 1, 0, 1,
-0.6138558, 0.3251846, 0.1243159, 0.4588235, 1, 0, 1,
-0.6077864, -1.279712, -1.175138, 0.4509804, 1, 0, 1,
-0.6043128, 1.462299, -1.073944, 0.4470588, 1, 0, 1,
-0.6036557, 1.262852, -0.314844, 0.4392157, 1, 0, 1,
-0.6022227, 0.9802196, -0.2588012, 0.4352941, 1, 0, 1,
-0.6002188, -2.22308, -0.7032758, 0.427451, 1, 0, 1,
-0.5938398, 0.4654996, -0.3403425, 0.4235294, 1, 0, 1,
-0.5903767, 0.5481282, -0.6290415, 0.4156863, 1, 0, 1,
-0.5899033, -1.501422, -2.346376, 0.4117647, 1, 0, 1,
-0.5845808, -0.612821, -1.626664, 0.4039216, 1, 0, 1,
-0.5838086, -1.988722, -1.268549, 0.3960784, 1, 0, 1,
-0.5784803, -1.232176, -1.910755, 0.3921569, 1, 0, 1,
-0.5779836, -0.7228017, -3.98367, 0.3843137, 1, 0, 1,
-0.5768645, -1.118689, -3.372757, 0.3803922, 1, 0, 1,
-0.5763887, -0.5368336, -2.265966, 0.372549, 1, 0, 1,
-0.5574483, -0.8992777, -2.646286, 0.3686275, 1, 0, 1,
-0.5537373, -1.008908, -3.681109, 0.3607843, 1, 0, 1,
-0.5474576, 0.5939565, -0.5771849, 0.3568628, 1, 0, 1,
-0.5412817, -0.5687594, -3.350796, 0.3490196, 1, 0, 1,
-0.536051, -0.2311405, -1.840765, 0.345098, 1, 0, 1,
-0.5358578, -0.1119075, -3.265018, 0.3372549, 1, 0, 1,
-0.5329028, -0.2824138, -1.978777, 0.3333333, 1, 0, 1,
-0.5303223, 0.1496152, -0.9155244, 0.3254902, 1, 0, 1,
-0.5261844, 0.06167275, -2.875894, 0.3215686, 1, 0, 1,
-0.5249236, 0.09437358, -1.522859, 0.3137255, 1, 0, 1,
-0.5231435, 0.8005899, 0.7697384, 0.3098039, 1, 0, 1,
-0.5225468, -0.029535, -0.193753, 0.3019608, 1, 0, 1,
-0.5220976, 0.2169552, 0.1993026, 0.2941177, 1, 0, 1,
-0.5129795, -1.172653, -2.516166, 0.2901961, 1, 0, 1,
-0.5113681, -1.11346, -2.57088, 0.282353, 1, 0, 1,
-0.5068753, -0.1293927, -0.8268564, 0.2784314, 1, 0, 1,
-0.5059587, 0.5659575, -0.795149, 0.2705882, 1, 0, 1,
-0.5034415, -0.04821224, -2.353842, 0.2666667, 1, 0, 1,
-0.496282, 0.6742198, -1.621825, 0.2588235, 1, 0, 1,
-0.4956416, 1.795251, -0.5617484, 0.254902, 1, 0, 1,
-0.4951093, -0.8636466, -1.334955, 0.2470588, 1, 0, 1,
-0.4835236, 2.060511, -0.1066778, 0.2431373, 1, 0, 1,
-0.4825447, 1.023302, -0.7692491, 0.2352941, 1, 0, 1,
-0.4788564, 0.545898, -0.8391119, 0.2313726, 1, 0, 1,
-0.4782725, -0.7464428, -3.521807, 0.2235294, 1, 0, 1,
-0.4781761, 0.4288635, 0.2543995, 0.2196078, 1, 0, 1,
-0.4774076, 0.09534153, -0.8972993, 0.2117647, 1, 0, 1,
-0.4745036, -0.3679935, -1.210162, 0.2078431, 1, 0, 1,
-0.4657849, -1.653463, -3.432802, 0.2, 1, 0, 1,
-0.4652444, 2.133816, 0.3879084, 0.1921569, 1, 0, 1,
-0.4606174, 0.6275955, -1.113602, 0.1882353, 1, 0, 1,
-0.460446, -0.8947454, -2.512604, 0.1803922, 1, 0, 1,
-0.4595642, 0.7968546, -0.4345689, 0.1764706, 1, 0, 1,
-0.456736, 0.8888429, -1.354453, 0.1686275, 1, 0, 1,
-0.4565189, -0.5177126, -2.392962, 0.1647059, 1, 0, 1,
-0.4546291, -1.897517, -2.02181, 0.1568628, 1, 0, 1,
-0.4508124, -0.9799235, -2.349103, 0.1529412, 1, 0, 1,
-0.4468273, 0.7117899, 0.7255305, 0.145098, 1, 0, 1,
-0.436373, -0.7295209, -1.749758, 0.1411765, 1, 0, 1,
-0.4339543, 1.270607, -0.4081043, 0.1333333, 1, 0, 1,
-0.4330058, -0.4699144, -2.358034, 0.1294118, 1, 0, 1,
-0.4284364, -1.309628, -3.276645, 0.1215686, 1, 0, 1,
-0.428264, 1.750937, -0.6989918, 0.1176471, 1, 0, 1,
-0.4270789, -0.8567836, -3.21497, 0.1098039, 1, 0, 1,
-0.4265144, 0.8622225, -1.331594, 0.1058824, 1, 0, 1,
-0.4249747, 1.554436, -0.5310636, 0.09803922, 1, 0, 1,
-0.4202663, -1.213374, -4.258597, 0.09019608, 1, 0, 1,
-0.4179791, 0.8842535, -0.9290463, 0.08627451, 1, 0, 1,
-0.4166807, -0.1143591, -2.330872, 0.07843138, 1, 0, 1,
-0.4142925, 0.332857, -0.5980381, 0.07450981, 1, 0, 1,
-0.4121523, 0.04180588, -2.684309, 0.06666667, 1, 0, 1,
-0.4079393, -1.370473, -3.582286, 0.0627451, 1, 0, 1,
-0.4077857, -0.5846401, -3.779357, 0.05490196, 1, 0, 1,
-0.4062906, 0.2718979, -1.619714, 0.05098039, 1, 0, 1,
-0.4042471, 1.174481, -0.6413423, 0.04313726, 1, 0, 1,
-0.3988593, 0.3368695, -1.099103, 0.03921569, 1, 0, 1,
-0.3971589, 1.846966, -0.1213164, 0.03137255, 1, 0, 1,
-0.3968635, -0.9770793, -2.238481, 0.02745098, 1, 0, 1,
-0.3954008, -1.764862, -3.62805, 0.01960784, 1, 0, 1,
-0.3879902, 0.8995743, 0.6498786, 0.01568628, 1, 0, 1,
-0.3874879, -0.5599743, -3.003076, 0.007843138, 1, 0, 1,
-0.3841412, -0.851527, -4.081789, 0.003921569, 1, 0, 1,
-0.3838357, -0.4046387, -1.687252, 0, 1, 0.003921569, 1,
-0.3838231, 0.1473607, -1.133869, 0, 1, 0.01176471, 1,
-0.3801498, -2.168053, -2.524697, 0, 1, 0.01568628, 1,
-0.3784846, -2.784501, -3.456628, 0, 1, 0.02352941, 1,
-0.3744256, -0.4629028, -2.750167, 0, 1, 0.02745098, 1,
-0.3686578, 1.073843, -0.0995722, 0, 1, 0.03529412, 1,
-0.3662195, -0.379568, -2.564238, 0, 1, 0.03921569, 1,
-0.3645457, -2.502251, -0.03683982, 0, 1, 0.04705882, 1,
-0.3607819, -0.5318512, -2.52202, 0, 1, 0.05098039, 1,
-0.3549099, -0.4948272, -1.62676, 0, 1, 0.05882353, 1,
-0.3436516, 0.1969341, -1.565761, 0, 1, 0.0627451, 1,
-0.3432921, 1.186307, -0.9682304, 0, 1, 0.07058824, 1,
-0.3423967, 0.4254811, 1.835852, 0, 1, 0.07450981, 1,
-0.3404137, 0.006775861, -2.321892, 0, 1, 0.08235294, 1,
-0.3386456, -0.2313067, -1.809959, 0, 1, 0.08627451, 1,
-0.3306647, -0.06199519, -2.211218, 0, 1, 0.09411765, 1,
-0.323551, -0.10278, -0.3821295, 0, 1, 0.1019608, 1,
-0.3216334, 1.732602, 0.9843771, 0, 1, 0.1058824, 1,
-0.3207873, -0.9780136, -2.347571, 0, 1, 0.1137255, 1,
-0.3179175, -0.02265486, -1.766069, 0, 1, 0.1176471, 1,
-0.3138481, -1.917351, -2.261407, 0, 1, 0.1254902, 1,
-0.3096789, 1.089404, -0.8787112, 0, 1, 0.1294118, 1,
-0.3076726, -0.3261233, -3.381489, 0, 1, 0.1372549, 1,
-0.3050869, -0.1956433, -0.2195458, 0, 1, 0.1411765, 1,
-0.3038892, -0.8118407, -2.589078, 0, 1, 0.1490196, 1,
-0.3034969, 0.5722147, -1.557151, 0, 1, 0.1529412, 1,
-0.3034324, -0.6719952, -4.190707, 0, 1, 0.1607843, 1,
-0.3015859, -1.513381, -3.115575, 0, 1, 0.1647059, 1,
-0.3014717, -0.1534074, -1.073007, 0, 1, 0.172549, 1,
-0.298902, -0.9406465, -2.360146, 0, 1, 0.1764706, 1,
-0.297476, -0.307431, -3.294522, 0, 1, 0.1843137, 1,
-0.2886234, -0.3362018, -3.548052, 0, 1, 0.1882353, 1,
-0.2886181, 0.1501243, -1.283394, 0, 1, 0.1960784, 1,
-0.2878869, 1.510806, 0.394547, 0, 1, 0.2039216, 1,
-0.2874744, 0.8129839, -2.234101, 0, 1, 0.2078431, 1,
-0.2836707, -0.6407095, -3.758004, 0, 1, 0.2156863, 1,
-0.2830881, 0.5730474, 1.847945, 0, 1, 0.2196078, 1,
-0.2826459, 0.8573903, -0.03150749, 0, 1, 0.227451, 1,
-0.2780853, -0.1072284, -1.642373, 0, 1, 0.2313726, 1,
-0.276877, 0.6221639, -1.830145, 0, 1, 0.2392157, 1,
-0.2746108, 0.1425026, -1.83441, 0, 1, 0.2431373, 1,
-0.2745949, 1.277158, -2.179166, 0, 1, 0.2509804, 1,
-0.262738, 1.136793, -1.869912, 0, 1, 0.254902, 1,
-0.2605918, 0.9861144, -0.1926224, 0, 1, 0.2627451, 1,
-0.251705, -0.1979966, -3.969594, 0, 1, 0.2666667, 1,
-0.2510782, 1.354935, -0.7888922, 0, 1, 0.2745098, 1,
-0.2491221, -0.2749949, -0.8837988, 0, 1, 0.2784314, 1,
-0.2475836, -0.2053827, -3.131352, 0, 1, 0.2862745, 1,
-0.2464244, -0.2302458, -3.125962, 0, 1, 0.2901961, 1,
-0.2461759, 0.2402603, -0.2445755, 0, 1, 0.2980392, 1,
-0.2450567, -0.2280683, -2.66286, 0, 1, 0.3058824, 1,
-0.2442959, 1.194547, -0.344916, 0, 1, 0.3098039, 1,
-0.2410674, -1.01263, -3.207829, 0, 1, 0.3176471, 1,
-0.2313546, 0.6187377, -0.1501183, 0, 1, 0.3215686, 1,
-0.2298416, 2.022548, 0.4723039, 0, 1, 0.3294118, 1,
-0.2260589, 0.5212215, -1.021212, 0, 1, 0.3333333, 1,
-0.2240224, 0.9661114, -0.8764477, 0, 1, 0.3411765, 1,
-0.2210353, -0.008360309, -2.326982, 0, 1, 0.345098, 1,
-0.2205164, 0.4751442, 1.773175, 0, 1, 0.3529412, 1,
-0.2166539, -1.738662, -3.768132, 0, 1, 0.3568628, 1,
-0.2162052, -0.3621779, -2.570951, 0, 1, 0.3647059, 1,
-0.214039, -0.6940071, -3.374368, 0, 1, 0.3686275, 1,
-0.2124383, 0.29362, -0.6863836, 0, 1, 0.3764706, 1,
-0.2118847, 0.9471797, 0.7417505, 0, 1, 0.3803922, 1,
-0.2096573, -0.2642466, -1.325017, 0, 1, 0.3882353, 1,
-0.2085434, -0.7453466, -0.4715188, 0, 1, 0.3921569, 1,
-0.2083938, -0.9571323, -3.799021, 0, 1, 0.4, 1,
-0.2029737, -0.006979189, -2.36992, 0, 1, 0.4078431, 1,
-0.202921, 1.806428, -2.149974, 0, 1, 0.4117647, 1,
-0.2020111, -0.7345443, -4.185043, 0, 1, 0.4196078, 1,
-0.201764, 1.536347, 2.135024, 0, 1, 0.4235294, 1,
-0.2010351, -2.877584, -2.854384, 0, 1, 0.4313726, 1,
-0.200755, -0.4077319, -2.649162, 0, 1, 0.4352941, 1,
-0.2005516, -1.505197, -2.267021, 0, 1, 0.4431373, 1,
-0.1999962, 0.0943913, -1.638398, 0, 1, 0.4470588, 1,
-0.1910502, -0.106832, -4.231143, 0, 1, 0.454902, 1,
-0.1886189, -0.3501905, -0.997089, 0, 1, 0.4588235, 1,
-0.1879255, 0.5379797, -1.893947, 0, 1, 0.4666667, 1,
-0.1831491, 0.1514295, -2.076927, 0, 1, 0.4705882, 1,
-0.1818062, 1.492754, -1.201991, 0, 1, 0.4784314, 1,
-0.1813231, 0.6062198, 0.3154309, 0, 1, 0.4823529, 1,
-0.1812392, 0.7931637, -3.080546, 0, 1, 0.4901961, 1,
-0.1808556, 0.02861681, -1.374557, 0, 1, 0.4941176, 1,
-0.1805398, 0.5462297, -0.1917984, 0, 1, 0.5019608, 1,
-0.1799661, -1.337521, -2.284877, 0, 1, 0.509804, 1,
-0.1716234, 0.24868, -2.937999, 0, 1, 0.5137255, 1,
-0.1715032, -0.4852272, -2.173031, 0, 1, 0.5215687, 1,
-0.1704018, -0.302633, -4.902923, 0, 1, 0.5254902, 1,
-0.1701495, -0.3390676, -2.99278, 0, 1, 0.5333334, 1,
-0.1684614, -0.7524143, -1.669115, 0, 1, 0.5372549, 1,
-0.1637039, -1.15215, -4.107017, 0, 1, 0.5450981, 1,
-0.1604845, -0.5221672, -3.159673, 0, 1, 0.5490196, 1,
-0.1572776, -1.29838, -0.7642082, 0, 1, 0.5568628, 1,
-0.1548421, 0.4842059, -0.5366089, 0, 1, 0.5607843, 1,
-0.1545859, 0.2814842, 0.3880041, 0, 1, 0.5686275, 1,
-0.1530245, -0.3790264, -3.917876, 0, 1, 0.572549, 1,
-0.152919, -1.585115, -3.587694, 0, 1, 0.5803922, 1,
-0.151587, -0.6258857, -2.854352, 0, 1, 0.5843138, 1,
-0.1495871, -0.1764207, -2.319821, 0, 1, 0.5921569, 1,
-0.144577, 1.480524, -1.404772, 0, 1, 0.5960785, 1,
-0.144457, -1.616213, -2.708127, 0, 1, 0.6039216, 1,
-0.1437432, 1.236836, 1.690115, 0, 1, 0.6117647, 1,
-0.1373654, 1.60339, 0.1302222, 0, 1, 0.6156863, 1,
-0.1371113, -0.2941071, -1.814911, 0, 1, 0.6235294, 1,
-0.1368306, -1.379763, -2.41776, 0, 1, 0.627451, 1,
-0.1257169, -0.6120389, -3.435008, 0, 1, 0.6352941, 1,
-0.1251463, -1.654408, -3.949055, 0, 1, 0.6392157, 1,
-0.1247678, 0.3301141, 0.7899966, 0, 1, 0.6470588, 1,
-0.1216273, 1.70643, 1.287305, 0, 1, 0.6509804, 1,
-0.1187217, 1.476928, 0.8264523, 0, 1, 0.6588235, 1,
-0.1177434, -0.119751, -0.4451053, 0, 1, 0.6627451, 1,
-0.117396, 0.2114155, -0.29057, 0, 1, 0.6705883, 1,
-0.1166289, -0.4167827, -2.695188, 0, 1, 0.6745098, 1,
-0.1141017, 0.5416537, 0.2298209, 0, 1, 0.682353, 1,
-0.1137753, -0.0009240181, -2.671104, 0, 1, 0.6862745, 1,
-0.1107414, 1.6945, 0.4114708, 0, 1, 0.6941177, 1,
-0.1088406, -1.489867, -2.230518, 0, 1, 0.7019608, 1,
-0.108256, 2.571846, -0.956661, 0, 1, 0.7058824, 1,
-0.1048782, 1.44248, -0.4953076, 0, 1, 0.7137255, 1,
-0.1034207, -1.900707, -2.497558, 0, 1, 0.7176471, 1,
-0.1000878, 0.0181997, 1.402133, 0, 1, 0.7254902, 1,
-0.097012, 0.6720316, 0.1226232, 0, 1, 0.7294118, 1,
-0.09212063, -0.1103613, -1.691693, 0, 1, 0.7372549, 1,
-0.09183758, 1.433555, -1.267515, 0, 1, 0.7411765, 1,
-0.0913559, 0.3279328, -0.3924497, 0, 1, 0.7490196, 1,
-0.08430477, -1.35548, -2.250264, 0, 1, 0.7529412, 1,
-0.08353131, -0.7477726, -4.580205, 0, 1, 0.7607843, 1,
-0.08037656, 0.9098234, -0.8879187, 0, 1, 0.7647059, 1,
-0.07357521, 0.2005346, -0.03600924, 0, 1, 0.772549, 1,
-0.07311503, 0.5875139, -0.4625439, 0, 1, 0.7764706, 1,
-0.07105774, -1.903778, -5.059906, 0, 1, 0.7843137, 1,
-0.06440555, 0.0457559, -0.1006143, 0, 1, 0.7882353, 1,
-0.06268706, -0.3855769, -3.600471, 0, 1, 0.7960784, 1,
-0.05870966, 0.02582246, -0.6016393, 0, 1, 0.8039216, 1,
-0.05172766, -0.7646721, -2.299365, 0, 1, 0.8078431, 1,
-0.05162188, -0.826399, -4.307686, 0, 1, 0.8156863, 1,
-0.05003115, 0.5702246, -0.1404621, 0, 1, 0.8196079, 1,
-0.04322748, 0.5893675, 0.4751887, 0, 1, 0.827451, 1,
-0.04054949, -1.101738, -2.191132, 0, 1, 0.8313726, 1,
-0.04041056, -1.181206, -3.388711, 0, 1, 0.8392157, 1,
-0.03962298, -0.3919398, -5.435431, 0, 1, 0.8431373, 1,
-0.0381657, 1.210655, -1.81773, 0, 1, 0.8509804, 1,
-0.03663254, -1.135331, -3.201401, 0, 1, 0.854902, 1,
-0.03395042, -0.9018695, -2.056255, 0, 1, 0.8627451, 1,
-0.03329619, 0.6121737, -0.6931378, 0, 1, 0.8666667, 1,
-0.02776486, -0.6728694, -1.790484, 0, 1, 0.8745098, 1,
-0.02468098, -0.8236743, 0.1502626, 0, 1, 0.8784314, 1,
-0.01628077, 2.099038, 0.7050496, 0, 1, 0.8862745, 1,
-0.0142335, 0.6819463, -0.3550208, 0, 1, 0.8901961, 1,
-0.0100203, 1.723896, 0.6785455, 0, 1, 0.8980392, 1,
-0.009523275, -0.3953776, -1.999731, 0, 1, 0.9058824, 1,
-0.004480411, -1.446268, -3.054099, 0, 1, 0.9098039, 1,
-0.002477108, -2.881641, -4.248792, 0, 1, 0.9176471, 1,
-0.002085143, -1.284729, -3.856516, 0, 1, 0.9215686, 1,
0.001472975, 1.088388, -0.1302827, 0, 1, 0.9294118, 1,
0.004850453, 0.4549024, 1.122109, 0, 1, 0.9333333, 1,
0.007778232, -0.6710891, 3.32693, 0, 1, 0.9411765, 1,
0.01003993, 1.079906, -0.9942963, 0, 1, 0.945098, 1,
0.01090604, -1.117677, 2.977199, 0, 1, 0.9529412, 1,
0.01099101, 0.1050543, -0.1616126, 0, 1, 0.9568627, 1,
0.01106615, -0.04238923, 1.603002, 0, 1, 0.9647059, 1,
0.01232085, 0.7151279, -0.4419743, 0, 1, 0.9686275, 1,
0.01283126, -0.9662535, 4.810705, 0, 1, 0.9764706, 1,
0.01424724, -0.3896579, 3.334381, 0, 1, 0.9803922, 1,
0.01574274, 0.1249004, 1.952815, 0, 1, 0.9882353, 1,
0.01786144, -0.7159362, 2.637097, 0, 1, 0.9921569, 1,
0.01801883, 1.026695, 1.341166, 0, 1, 1, 1,
0.02257793, 0.1609168, 0.1728968, 0, 0.9921569, 1, 1,
0.02408715, 1.470036, 0.1291272, 0, 0.9882353, 1, 1,
0.02427028, 0.8070621, -0.6977171, 0, 0.9803922, 1, 1,
0.02732113, 0.8016631, -0.5652462, 0, 0.9764706, 1, 1,
0.02753041, -0.2649285, 2.673894, 0, 0.9686275, 1, 1,
0.03964568, 0.03628441, 1.662106, 0, 0.9647059, 1, 1,
0.03996638, -0.2937046, 2.949382, 0, 0.9568627, 1, 1,
0.0428021, 0.07184832, -0.8633586, 0, 0.9529412, 1, 1,
0.04297277, -1.489307, 3.256591, 0, 0.945098, 1, 1,
0.04419756, 2.191519, 0.009508147, 0, 0.9411765, 1, 1,
0.04795201, 1.630981, 1.151046, 0, 0.9333333, 1, 1,
0.05482889, -0.2847151, 3.039213, 0, 0.9294118, 1, 1,
0.05494029, -1.45632, 2.9433, 0, 0.9215686, 1, 1,
0.05580712, -0.938003, 3.983408, 0, 0.9176471, 1, 1,
0.0565048, 0.1611112, -0.3580959, 0, 0.9098039, 1, 1,
0.05732017, -1.613067, 3.077609, 0, 0.9058824, 1, 1,
0.05916502, 1.022724, -0.3762861, 0, 0.8980392, 1, 1,
0.06303322, 1.349783, 0.1639945, 0, 0.8901961, 1, 1,
0.06471877, -0.3907837, 3.046438, 0, 0.8862745, 1, 1,
0.06548063, 0.01949527, -0.2546488, 0, 0.8784314, 1, 1,
0.06566074, 0.1051264, 0.9878221, 0, 0.8745098, 1, 1,
0.06590682, 0.9319375, 0.9143537, 0, 0.8666667, 1, 1,
0.06729759, 1.769149, -0.1791694, 0, 0.8627451, 1, 1,
0.0687231, -1.198723, 2.870204, 0, 0.854902, 1, 1,
0.07283837, -0.6764474, 3.832898, 0, 0.8509804, 1, 1,
0.0753055, -0.2831315, 2.641086, 0, 0.8431373, 1, 1,
0.07590064, -1.036222, 2.048324, 0, 0.8392157, 1, 1,
0.07668658, -1.072121, 2.092112, 0, 0.8313726, 1, 1,
0.07776117, -0.8173118, 1.762881, 0, 0.827451, 1, 1,
0.08504594, 1.40445, -0.7190788, 0, 0.8196079, 1, 1,
0.08794328, 0.5959186, -0.3628154, 0, 0.8156863, 1, 1,
0.090805, -0.2829434, 4.811784, 0, 0.8078431, 1, 1,
0.102129, -0.3674649, 3.465686, 0, 0.8039216, 1, 1,
0.1022648, 0.5539094, 0.2578598, 0, 0.7960784, 1, 1,
0.1049401, -1.141792, 3.008414, 0, 0.7882353, 1, 1,
0.1078501, -0.365418, 3.537497, 0, 0.7843137, 1, 1,
0.1105823, 1.189583, 0.2947403, 0, 0.7764706, 1, 1,
0.1146156, -0.2742738, 3.746784, 0, 0.772549, 1, 1,
0.1159486, 0.3417106, 0.7032207, 0, 0.7647059, 1, 1,
0.1188939, -1.94311, 1.637891, 0, 0.7607843, 1, 1,
0.1205839, -1.67739, 3.744725, 0, 0.7529412, 1, 1,
0.1290189, 1.455169, 1.465058, 0, 0.7490196, 1, 1,
0.1300251, 0.7349972, 0.04356506, 0, 0.7411765, 1, 1,
0.133615, 0.215236, 0.2967903, 0, 0.7372549, 1, 1,
0.1357052, 0.9411199, -0.7804473, 0, 0.7294118, 1, 1,
0.1385391, -1.543346, 2.769462, 0, 0.7254902, 1, 1,
0.1447087, -0.6364825, 2.559485, 0, 0.7176471, 1, 1,
0.1450749, 0.9039399, -0.1176357, 0, 0.7137255, 1, 1,
0.1452065, -0.5076138, 1.847397, 0, 0.7058824, 1, 1,
0.1459107, -0.6713476, 2.908518, 0, 0.6980392, 1, 1,
0.146422, 2.344845, -0.6434521, 0, 0.6941177, 1, 1,
0.1560877, -0.2011979, 1.661932, 0, 0.6862745, 1, 1,
0.1569847, -0.1007911, 1.194169, 0, 0.682353, 1, 1,
0.158368, -0.4021523, 3.053111, 0, 0.6745098, 1, 1,
0.1584841, -0.3876669, 1.831329, 0, 0.6705883, 1, 1,
0.1604406, -0.3860149, 3.358731, 0, 0.6627451, 1, 1,
0.1616984, -1.288671, 3.493124, 0, 0.6588235, 1, 1,
0.1655981, -0.2118926, 3.432394, 0, 0.6509804, 1, 1,
0.1680516, 0.44478, 1.711634, 0, 0.6470588, 1, 1,
0.1781261, -0.7174554, 3.129171, 0, 0.6392157, 1, 1,
0.1809434, -0.5854625, 2.70154, 0, 0.6352941, 1, 1,
0.1818935, -0.6229965, 3.5836, 0, 0.627451, 1, 1,
0.1825115, 1.237635, -0.5392528, 0, 0.6235294, 1, 1,
0.1896321, -1.270683, 2.344935, 0, 0.6156863, 1, 1,
0.1967917, -2.569048, 1.362356, 0, 0.6117647, 1, 1,
0.1990309, -0.2008515, 4.346709, 0, 0.6039216, 1, 1,
0.1993492, 1.571729, 0.6555659, 0, 0.5960785, 1, 1,
0.2025687, -0.3904937, 2.940978, 0, 0.5921569, 1, 1,
0.2026082, -1.028465, 2.284483, 0, 0.5843138, 1, 1,
0.2072117, 0.9122514, 0.5568675, 0, 0.5803922, 1, 1,
0.2077955, -0.531129, 4.437222, 0, 0.572549, 1, 1,
0.2090076, 0.1169478, 1.48467, 0, 0.5686275, 1, 1,
0.209768, -1.766732, 4.986429, 0, 0.5607843, 1, 1,
0.2105097, 0.2799852, 1.329188, 0, 0.5568628, 1, 1,
0.2109085, 0.5356521, 1.258502, 0, 0.5490196, 1, 1,
0.2123352, -0.4772601, 2.486509, 0, 0.5450981, 1, 1,
0.2150352, 0.7399316, 0.01643845, 0, 0.5372549, 1, 1,
0.2193484, 1.91183, 1.474666, 0, 0.5333334, 1, 1,
0.2224937, -0.09580217, 0.302106, 0, 0.5254902, 1, 1,
0.2229991, 0.5408023, -0.2646224, 0, 0.5215687, 1, 1,
0.2263002, -0.4406885, 1.244662, 0, 0.5137255, 1, 1,
0.2291061, 0.8791103, -2.325114, 0, 0.509804, 1, 1,
0.2294467, -0.311113, 3.435489, 0, 0.5019608, 1, 1,
0.2295307, 1.165902, -0.8433073, 0, 0.4941176, 1, 1,
0.2371264, -0.6255723, 1.188015, 0, 0.4901961, 1, 1,
0.2387404, -1.437078, 2.216503, 0, 0.4823529, 1, 1,
0.2411535, -0.05653626, 1.905782, 0, 0.4784314, 1, 1,
0.2426899, -0.7812783, 3.106076, 0, 0.4705882, 1, 1,
0.2442828, 0.4735201, 1.695685, 0, 0.4666667, 1, 1,
0.2445633, -0.6033287, 3.656199, 0, 0.4588235, 1, 1,
0.2500552, 2.262778, 0.466759, 0, 0.454902, 1, 1,
0.2520976, -0.6448044, 2.931312, 0, 0.4470588, 1, 1,
0.2552007, -0.8195816, 5.058924, 0, 0.4431373, 1, 1,
0.2556092, 0.9958127, 0.6451538, 0, 0.4352941, 1, 1,
0.2602683, -0.04610613, 0.665477, 0, 0.4313726, 1, 1,
0.2623883, -0.6262404, 3.156142, 0, 0.4235294, 1, 1,
0.2646707, -0.9599369, 2.495517, 0, 0.4196078, 1, 1,
0.2647808, 1.604718, -0.05924208, 0, 0.4117647, 1, 1,
0.2662542, -0.719273, 2.042023, 0, 0.4078431, 1, 1,
0.2668386, -1.079682, 3.263292, 0, 0.4, 1, 1,
0.2671899, 0.9540234, -0.3525536, 0, 0.3921569, 1, 1,
0.2708273, -0.6541211, 3.720292, 0, 0.3882353, 1, 1,
0.2713185, -0.4042434, 1.501017, 0, 0.3803922, 1, 1,
0.2725058, -0.5352699, 1.322745, 0, 0.3764706, 1, 1,
0.2737256, -0.0466073, 1.587276, 0, 0.3686275, 1, 1,
0.2763366, 0.05815076, 0.3212053, 0, 0.3647059, 1, 1,
0.2827215, 0.6766273, 0.892224, 0, 0.3568628, 1, 1,
0.2854445, 0.8880917, -1.051557, 0, 0.3529412, 1, 1,
0.288009, 0.5607222, 0.6249892, 0, 0.345098, 1, 1,
0.2928264, 0.07690533, 1.384404, 0, 0.3411765, 1, 1,
0.2963431, 0.9708339, 0.05936337, 0, 0.3333333, 1, 1,
0.2985037, -0.9278715, 4.679539, 0, 0.3294118, 1, 1,
0.299884, -1.101304, 4.418804, 0, 0.3215686, 1, 1,
0.2999525, -1.001252, 1.883584, 0, 0.3176471, 1, 1,
0.3031661, 0.1615284, 1.490032, 0, 0.3098039, 1, 1,
0.304062, 0.4575506, -0.3954016, 0, 0.3058824, 1, 1,
0.3089096, 0.6029164, 1.586944, 0, 0.2980392, 1, 1,
0.3104738, -0.289896, 2.554155, 0, 0.2901961, 1, 1,
0.311179, -0.7247396, 1.284052, 0, 0.2862745, 1, 1,
0.3123877, -0.5967313, 2.269922, 0, 0.2784314, 1, 1,
0.3152731, 0.5576392, 1.364578, 0, 0.2745098, 1, 1,
0.3242295, 0.7586825, 0.5934568, 0, 0.2666667, 1, 1,
0.3293172, 0.3804344, 2.374943, 0, 0.2627451, 1, 1,
0.3346218, -0.5501862, 1.745115, 0, 0.254902, 1, 1,
0.337864, -1.582363, 4.301829, 0, 0.2509804, 1, 1,
0.3440876, -0.5496214, 1.114767, 0, 0.2431373, 1, 1,
0.3474497, -1.313372, 5.213257, 0, 0.2392157, 1, 1,
0.3492, -1.685156, 1.597043, 0, 0.2313726, 1, 1,
0.3640604, -0.8955771, 2.22269, 0, 0.227451, 1, 1,
0.3641806, -1.61745, 1.544047, 0, 0.2196078, 1, 1,
0.3674625, -1.006943, 1.941782, 0, 0.2156863, 1, 1,
0.3688222, -0.7014472, 1.780544, 0, 0.2078431, 1, 1,
0.3696771, -1.324648, 3.397837, 0, 0.2039216, 1, 1,
0.3753606, -0.7109604, 3.611378, 0, 0.1960784, 1, 1,
0.3759105, -0.2585652, -0.3684529, 0, 0.1882353, 1, 1,
0.3793073, 1.09187, 0.8292083, 0, 0.1843137, 1, 1,
0.3833518, -1.919186, 2.833587, 0, 0.1764706, 1, 1,
0.383945, 1.024969, -0.4641836, 0, 0.172549, 1, 1,
0.3987112, -1.191627, 2.876642, 0, 0.1647059, 1, 1,
0.4052023, 0.08791918, -0.1230748, 0, 0.1607843, 1, 1,
0.408236, 1.896403, -1.5018, 0, 0.1529412, 1, 1,
0.4128506, -0.1357444, 1.572239, 0, 0.1490196, 1, 1,
0.4149516, -1.072933, 4.079601, 0, 0.1411765, 1, 1,
0.4175355, -1.014374, 1.788068, 0, 0.1372549, 1, 1,
0.4239878, 0.7507671, 1.238338, 0, 0.1294118, 1, 1,
0.4282758, 0.3451287, 0.05699615, 0, 0.1254902, 1, 1,
0.4295847, 0.1827108, 0.5273824, 0, 0.1176471, 1, 1,
0.4331448, 0.8916482, 2.643755, 0, 0.1137255, 1, 1,
0.4333753, 1.033212, -0.8467125, 0, 0.1058824, 1, 1,
0.4382235, 0.7010348, 0.03356432, 0, 0.09803922, 1, 1,
0.4405722, 1.12826, 0.9489886, 0, 0.09411765, 1, 1,
0.4435106, 0.6587978, -0.2359427, 0, 0.08627451, 1, 1,
0.4440207, -0.04738062, 1.883438, 0, 0.08235294, 1, 1,
0.4443696, 0.2195878, 1.054123, 0, 0.07450981, 1, 1,
0.4443708, -0.5750081, 3.927402, 0, 0.07058824, 1, 1,
0.4451953, -0.6242766, 1.592957, 0, 0.0627451, 1, 1,
0.4523361, 0.8463026, -0.7496014, 0, 0.05882353, 1, 1,
0.4539498, -1.759191, 1.80421, 0, 0.05098039, 1, 1,
0.4566391, 0.832013, -0.5028042, 0, 0.04705882, 1, 1,
0.4575276, 0.954931, 0.9023869, 0, 0.03921569, 1, 1,
0.4576015, 0.9377566, 3.809336, 0, 0.03529412, 1, 1,
0.4591862, 1.468459, -0.7066884, 0, 0.02745098, 1, 1,
0.4705582, -0.6693239, 3.289093, 0, 0.02352941, 1, 1,
0.4721938, 0.9194987, 0.2560967, 0, 0.01568628, 1, 1,
0.4734607, -0.7624326, 3.130558, 0, 0.01176471, 1, 1,
0.4768893, 1.231793, 2.086268, 0, 0.003921569, 1, 1,
0.4775926, 1.484793, 4.883257, 0.003921569, 0, 1, 1,
0.4797523, -1.654859, 2.960666, 0.007843138, 0, 1, 1,
0.4820787, 0.740123, 1.579461, 0.01568628, 0, 1, 1,
0.4831644, -0.4963332, 2.167567, 0.01960784, 0, 1, 1,
0.4906656, 1.367165, 0.3499428, 0.02745098, 0, 1, 1,
0.4912834, -0.4705004, 1.765865, 0.03137255, 0, 1, 1,
0.4913119, 1.477361, 2.251633, 0.03921569, 0, 1, 1,
0.4989247, -0.7625933, 3.296671, 0.04313726, 0, 1, 1,
0.5013754, -0.1685648, 2.421414, 0.05098039, 0, 1, 1,
0.5062767, -1.060419, 3.061234, 0.05490196, 0, 1, 1,
0.5074791, -0.326654, 2.845709, 0.0627451, 0, 1, 1,
0.507648, -0.5012701, 2.01106, 0.06666667, 0, 1, 1,
0.5094707, 1.782341, -0.1990377, 0.07450981, 0, 1, 1,
0.5107692, -0.8895184, 1.688821, 0.07843138, 0, 1, 1,
0.5115284, -0.7294467, 3.824456, 0.08627451, 0, 1, 1,
0.5120343, 0.02310929, 0.7984299, 0.09019608, 0, 1, 1,
0.5120615, -1.792916, 3.278484, 0.09803922, 0, 1, 1,
0.5148714, -0.1874555, 3.998605, 0.1058824, 0, 1, 1,
0.5184774, -0.9097229, 4.597817, 0.1098039, 0, 1, 1,
0.5189396, -0.7481553, 3.782936, 0.1176471, 0, 1, 1,
0.5196512, 1.156997, -0.1501746, 0.1215686, 0, 1, 1,
0.5207029, 0.4716869, 1.966813, 0.1294118, 0, 1, 1,
0.5207261, 0.3668021, -0.2793188, 0.1333333, 0, 1, 1,
0.5230334, 0.4002837, 3.386619, 0.1411765, 0, 1, 1,
0.5238599, 0.6262752, -0.7511679, 0.145098, 0, 1, 1,
0.524819, 0.3657627, 0.9787174, 0.1529412, 0, 1, 1,
0.525653, -0.01945149, 1.893183, 0.1568628, 0, 1, 1,
0.5312914, 0.9816048, 0.4456166, 0.1647059, 0, 1, 1,
0.5314516, 1.059783, 1.442478, 0.1686275, 0, 1, 1,
0.5325209, -1.564997, 3.011454, 0.1764706, 0, 1, 1,
0.5387167, -1.402239, 3.001455, 0.1803922, 0, 1, 1,
0.5392051, -1.563073, 3.221756, 0.1882353, 0, 1, 1,
0.5413728, 0.1359843, 0.3049603, 0.1921569, 0, 1, 1,
0.5453424, 2.089312, 0.8364003, 0.2, 0, 1, 1,
0.5461491, -0.820433, 2.591, 0.2078431, 0, 1, 1,
0.546186, 0.2325172, 1.165969, 0.2117647, 0, 1, 1,
0.5465885, 0.7018048, 0.667776, 0.2196078, 0, 1, 1,
0.5476187, -0.4600055, 0.9800849, 0.2235294, 0, 1, 1,
0.5499384, 0.2975283, 0.5509462, 0.2313726, 0, 1, 1,
0.5501654, -0.1128973, 3.025372, 0.2352941, 0, 1, 1,
0.5504014, 0.3359196, 1.398377, 0.2431373, 0, 1, 1,
0.5506992, -0.3683838, 2.730792, 0.2470588, 0, 1, 1,
0.5533018, -0.04917528, 1.141668, 0.254902, 0, 1, 1,
0.5595044, 0.7161788, 2.090077, 0.2588235, 0, 1, 1,
0.5596982, -0.3234112, 2.153253, 0.2666667, 0, 1, 1,
0.5658417, 1.98191, -0.3089608, 0.2705882, 0, 1, 1,
0.5660943, 0.3590796, 1.427252, 0.2784314, 0, 1, 1,
0.5708607, -0.2257106, 2.200611, 0.282353, 0, 1, 1,
0.5732576, -1.008115, 3.095154, 0.2901961, 0, 1, 1,
0.5855951, -0.612231, -0.371741, 0.2941177, 0, 1, 1,
0.5861362, 0.5583617, 2.01932, 0.3019608, 0, 1, 1,
0.589527, 1.153492, 0.9475897, 0.3098039, 0, 1, 1,
0.5937988, 2.764224, -1.174036, 0.3137255, 0, 1, 1,
0.5940334, -1.523829, 2.515664, 0.3215686, 0, 1, 1,
0.5943939, -1.13414, 1.656521, 0.3254902, 0, 1, 1,
0.5952395, 0.1696262, 1.300439, 0.3333333, 0, 1, 1,
0.5963166, 0.07624435, 1.941278, 0.3372549, 0, 1, 1,
0.5985677, -0.2430602, 1.861008, 0.345098, 0, 1, 1,
0.605185, -0.6261788, 2.920086, 0.3490196, 0, 1, 1,
0.6055276, 0.06672975, -0.607868, 0.3568628, 0, 1, 1,
0.6056512, -1.134921, 2.611007, 0.3607843, 0, 1, 1,
0.606642, -0.9665743, 1.205583, 0.3686275, 0, 1, 1,
0.611676, -0.7353398, 1.133918, 0.372549, 0, 1, 1,
0.6129011, -0.5666788, 1.152801, 0.3803922, 0, 1, 1,
0.6170871, -0.6864566, 3.259743, 0.3843137, 0, 1, 1,
0.6195244, 0.6358341, 3.612493, 0.3921569, 0, 1, 1,
0.6200236, 0.6872833, 0.8741727, 0.3960784, 0, 1, 1,
0.6204087, 1.403515, 0.3347926, 0.4039216, 0, 1, 1,
0.6231391, -0.2554095, 1.556774, 0.4117647, 0, 1, 1,
0.6264207, 0.4300811, 0.7515419, 0.4156863, 0, 1, 1,
0.6271459, 0.3694083, 1.650433, 0.4235294, 0, 1, 1,
0.6303242, 0.2665795, 1.99995, 0.427451, 0, 1, 1,
0.6363094, -0.7143533, 2.976782, 0.4352941, 0, 1, 1,
0.6390442, -0.7159776, 3.043536, 0.4392157, 0, 1, 1,
0.6393939, 0.4328728, 1.455445, 0.4470588, 0, 1, 1,
0.6403031, 0.02404975, 1.41128, 0.4509804, 0, 1, 1,
0.6408575, -0.1674398, 2.154948, 0.4588235, 0, 1, 1,
0.6413292, 0.1040494, 3.31179, 0.4627451, 0, 1, 1,
0.6507833, 0.04690889, 0.7838079, 0.4705882, 0, 1, 1,
0.6520648, 0.1463043, 1.156305, 0.4745098, 0, 1, 1,
0.6527736, 0.01937936, 1.249839, 0.4823529, 0, 1, 1,
0.6550878, 0.9037311, -0.4068524, 0.4862745, 0, 1, 1,
0.6590338, 0.05889216, 2.481897, 0.4941176, 0, 1, 1,
0.659808, -1.112943, 2.931674, 0.5019608, 0, 1, 1,
0.662575, -2.708573, 3.871323, 0.5058824, 0, 1, 1,
0.6637132, -1.864631, 2.131096, 0.5137255, 0, 1, 1,
0.6655486, 1.678806, -0.9527102, 0.5176471, 0, 1, 1,
0.6660721, -0.3110074, 2.583847, 0.5254902, 0, 1, 1,
0.6692168, 0.03370139, 2.965593, 0.5294118, 0, 1, 1,
0.673796, 2.296311, 0.1567975, 0.5372549, 0, 1, 1,
0.675332, 0.6767805, -1.15437, 0.5411765, 0, 1, 1,
0.6771595, -0.9347779, 3.598193, 0.5490196, 0, 1, 1,
0.6798356, 0.3188761, 0.7812142, 0.5529412, 0, 1, 1,
0.6814227, -0.07699521, 3.322801, 0.5607843, 0, 1, 1,
0.6818598, 1.614313, -0.3971783, 0.5647059, 0, 1, 1,
0.6824384, 0.2860058, 3.661371, 0.572549, 0, 1, 1,
0.6851804, -1.002275, 2.610538, 0.5764706, 0, 1, 1,
0.6911684, -0.8995454, 1.435762, 0.5843138, 0, 1, 1,
0.6913579, 1.344501, 0.2570897, 0.5882353, 0, 1, 1,
0.6937808, 0.8944249, 0.1255936, 0.5960785, 0, 1, 1,
0.694723, -0.9070102, 1.92962, 0.6039216, 0, 1, 1,
0.6996378, -0.5259902, 2.304364, 0.6078432, 0, 1, 1,
0.7013186, 0.8395725, 0.4288412, 0.6156863, 0, 1, 1,
0.7035959, -1.041362, 1.822902, 0.6196079, 0, 1, 1,
0.7040283, 0.1752702, -0.03411867, 0.627451, 0, 1, 1,
0.7043837, 0.7661272, 0.4088475, 0.6313726, 0, 1, 1,
0.7049798, 0.2108795, 1.754605, 0.6392157, 0, 1, 1,
0.7078103, -0.4860947, 0.3349527, 0.6431373, 0, 1, 1,
0.7176014, 0.3589748, -0.7026296, 0.6509804, 0, 1, 1,
0.7223858, -0.1984442, 2.446611, 0.654902, 0, 1, 1,
0.7228034, 0.8440555, -1.537776, 0.6627451, 0, 1, 1,
0.7249112, -0.08709583, 1.135497, 0.6666667, 0, 1, 1,
0.728046, 0.5276328, -0.2357455, 0.6745098, 0, 1, 1,
0.7289007, 0.7781456, 1.854323, 0.6784314, 0, 1, 1,
0.7377105, -0.7214449, 3.523135, 0.6862745, 0, 1, 1,
0.7401949, 1.411602, 0.5331877, 0.6901961, 0, 1, 1,
0.7403734, 1.314436, 0.9494159, 0.6980392, 0, 1, 1,
0.7465788, -0.24498, 0.677957, 0.7058824, 0, 1, 1,
0.7505488, -0.3849712, 2.271299, 0.7098039, 0, 1, 1,
0.7519287, 1.753847, 0.7408404, 0.7176471, 0, 1, 1,
0.7541095, -2.058071, 2.819888, 0.7215686, 0, 1, 1,
0.7580959, -0.2915944, 0.01585648, 0.7294118, 0, 1, 1,
0.7604089, 0.6621681, 1.943895, 0.7333333, 0, 1, 1,
0.7608103, -1.866621, 1.519362, 0.7411765, 0, 1, 1,
0.762147, 1.51072, -0.008702167, 0.7450981, 0, 1, 1,
0.7640797, -0.3212104, 1.445268, 0.7529412, 0, 1, 1,
0.7715271, -1.229234, 2.135384, 0.7568628, 0, 1, 1,
0.7802718, 0.6656086, 0.6988013, 0.7647059, 0, 1, 1,
0.7839922, 0.08972506, 0.8958902, 0.7686275, 0, 1, 1,
0.7863757, 0.9526528, 0.0006283026, 0.7764706, 0, 1, 1,
0.7941391, 0.3476975, -0.1143721, 0.7803922, 0, 1, 1,
0.7957083, 0.8966513, 1.285293, 0.7882353, 0, 1, 1,
0.7984792, 0.09556969, 0.7358513, 0.7921569, 0, 1, 1,
0.8066971, -1.322634, 3.175542, 0.8, 0, 1, 1,
0.8069892, 1.211903, 1.049268, 0.8078431, 0, 1, 1,
0.813378, 3.131296, 1.673003, 0.8117647, 0, 1, 1,
0.8134983, -1.271937, 2.938528, 0.8196079, 0, 1, 1,
0.8160472, -0.9091602, 1.680624, 0.8235294, 0, 1, 1,
0.8287749, -1.393543, 1.366421, 0.8313726, 0, 1, 1,
0.8296879, 0.9554366, 0.03496869, 0.8352941, 0, 1, 1,
0.8312352, 0.01735565, 1.450109, 0.8431373, 0, 1, 1,
0.8390169, -0.1974811, 3.161102, 0.8470588, 0, 1, 1,
0.8412189, 1.433283, -0.07595783, 0.854902, 0, 1, 1,
0.8435802, -1.322606, 0.7421775, 0.8588235, 0, 1, 1,
0.8447512, 1.065059, -0.6552153, 0.8666667, 0, 1, 1,
0.846799, 0.3129616, 0.8489926, 0.8705882, 0, 1, 1,
0.8521549, -0.819069, 0.1540297, 0.8784314, 0, 1, 1,
0.852729, -0.6248376, 3.745422, 0.8823529, 0, 1, 1,
0.8574414, -0.4711353, 2.400004, 0.8901961, 0, 1, 1,
0.8582847, -0.2037555, -0.04937924, 0.8941177, 0, 1, 1,
0.8597562, 0.3329502, 2.805673, 0.9019608, 0, 1, 1,
0.8597995, -0.9618429, 2.649661, 0.9098039, 0, 1, 1,
0.8626248, -1.81122, 4.452162, 0.9137255, 0, 1, 1,
0.8637613, -0.6349289, 2.07729, 0.9215686, 0, 1, 1,
0.8656047, -0.09640041, 3.085556, 0.9254902, 0, 1, 1,
0.8665388, -0.5489757, 3.83942, 0.9333333, 0, 1, 1,
0.867105, -0.3947655, 2.800847, 0.9372549, 0, 1, 1,
0.8708802, 0.9591693, 0.3985411, 0.945098, 0, 1, 1,
0.8801103, -0.5032222, 1.321843, 0.9490196, 0, 1, 1,
0.8833875, 0.8972961, 2.602296, 0.9568627, 0, 1, 1,
0.8903624, 0.3131293, 0.915612, 0.9607843, 0, 1, 1,
0.8947902, 0.2137284, 1.93424, 0.9686275, 0, 1, 1,
0.8975948, 1.030728, 0.3581036, 0.972549, 0, 1, 1,
0.8990301, -0.5256704, 2.92582, 0.9803922, 0, 1, 1,
0.904332, -0.6119431, 1.038118, 0.9843137, 0, 1, 1,
0.9064466, 0.622955, 0.3789916, 0.9921569, 0, 1, 1,
0.9211797, 1.134995, -0.4749265, 0.9960784, 0, 1, 1,
0.921984, -1.657718, 2.515334, 1, 0, 0.9960784, 1,
0.9229237, -1.515412, 2.188797, 1, 0, 0.9882353, 1,
0.932663, 0.0163969, 1.275977, 1, 0, 0.9843137, 1,
0.9329645, 0.05580815, 0.4295312, 1, 0, 0.9764706, 1,
0.936817, 0.3890841, 0.3486702, 1, 0, 0.972549, 1,
0.9380093, -2.341501, 2.865333, 1, 0, 0.9647059, 1,
0.9502204, -0.601173, 1.650045, 1, 0, 0.9607843, 1,
0.950829, -0.4519089, 1.915299, 1, 0, 0.9529412, 1,
0.9783303, -0.4299448, 1.087776, 1, 0, 0.9490196, 1,
0.9968123, -1.140854, 2.643202, 1, 0, 0.9411765, 1,
1.007478, -0.3850617, 1.672705, 1, 0, 0.9372549, 1,
1.009397, 0.9386042, -1.501751, 1, 0, 0.9294118, 1,
1.0173, -1.39479, 3.278385, 1, 0, 0.9254902, 1,
1.022166, 0.7380707, 2.300818, 1, 0, 0.9176471, 1,
1.023257, -1.170617, 2.78744, 1, 0, 0.9137255, 1,
1.024197, -0.7632598, 4.375849, 1, 0, 0.9058824, 1,
1.025538, 0.04926641, 1.463356, 1, 0, 0.9019608, 1,
1.028244, -0.8447579, 2.608239, 1, 0, 0.8941177, 1,
1.031827, 1.090961, 0.9684641, 1, 0, 0.8862745, 1,
1.033261, -0.04533117, 2.689912, 1, 0, 0.8823529, 1,
1.034616, -0.381873, 0.7022092, 1, 0, 0.8745098, 1,
1.039525, -2.220367, 0.5890412, 1, 0, 0.8705882, 1,
1.04907, 0.9848161, 1.340235, 1, 0, 0.8627451, 1,
1.051707, 2.137083, 3.130178, 1, 0, 0.8588235, 1,
1.05223, 1.419709, 1.801065, 1, 0, 0.8509804, 1,
1.066166, -0.9095209, 4.600899, 1, 0, 0.8470588, 1,
1.066755, 0.4882845, 1.955581, 1, 0, 0.8392157, 1,
1.073587, -0.2873195, 1.61419, 1, 0, 0.8352941, 1,
1.074389, -0.6790293, 1.816692, 1, 0, 0.827451, 1,
1.078943, -0.1141952, 0.4848585, 1, 0, 0.8235294, 1,
1.079798, -0.7414878, 1.647393, 1, 0, 0.8156863, 1,
1.086629, 0.752032, 0.2612095, 1, 0, 0.8117647, 1,
1.096825, -0.9690525, 1.926566, 1, 0, 0.8039216, 1,
1.099835, -0.4721451, 1.552481, 1, 0, 0.7960784, 1,
1.102296, 0.5164188, 2.448871, 1, 0, 0.7921569, 1,
1.103758, 0.2491683, 0.02571207, 1, 0, 0.7843137, 1,
1.103776, 0.520145, 1.452144, 1, 0, 0.7803922, 1,
1.108569, 0.1125003, -0.399325, 1, 0, 0.772549, 1,
1.116053, -0.5237295, 1.129582, 1, 0, 0.7686275, 1,
1.118356, -0.5538833, 2.335084, 1, 0, 0.7607843, 1,
1.119901, 0.4670748, 2.146405, 1, 0, 0.7568628, 1,
1.125202, -2.354011, 3.210449, 1, 0, 0.7490196, 1,
1.128339, -0.3313026, 1.101582, 1, 0, 0.7450981, 1,
1.137086, 0.641794, 1.955028, 1, 0, 0.7372549, 1,
1.137283, -0.6321228, 1.8103, 1, 0, 0.7333333, 1,
1.137737, 1.319708, 0.5139648, 1, 0, 0.7254902, 1,
1.141997, -1.306996, 2.71316, 1, 0, 0.7215686, 1,
1.142392, -0.1744683, 1.520438, 1, 0, 0.7137255, 1,
1.146902, 0.1268945, 1.000359, 1, 0, 0.7098039, 1,
1.149541, -0.9660057, 1.200561, 1, 0, 0.7019608, 1,
1.152686, 0.146203, 3.354595, 1, 0, 0.6941177, 1,
1.154023, -0.4751478, 2.092602, 1, 0, 0.6901961, 1,
1.163005, -1.215913, 0.3210201, 1, 0, 0.682353, 1,
1.180022, 1.285515, 0.3874019, 1, 0, 0.6784314, 1,
1.182982, 0.4396625, 0.8350918, 1, 0, 0.6705883, 1,
1.184523, 1.205414, 1.770302, 1, 0, 0.6666667, 1,
1.194927, 0.3146974, 2.028113, 1, 0, 0.6588235, 1,
1.201051, -0.07205635, 0.4221649, 1, 0, 0.654902, 1,
1.208534, -0.5999162, 1.274017, 1, 0, 0.6470588, 1,
1.20951, 0.1586091, 3.299656, 1, 0, 0.6431373, 1,
1.215852, -1.014948, 1.639373, 1, 0, 0.6352941, 1,
1.217865, 1.094489, 0.6015453, 1, 0, 0.6313726, 1,
1.220121, -0.08911075, 2.574735, 1, 0, 0.6235294, 1,
1.226041, 0.8375383, -0.8545808, 1, 0, 0.6196079, 1,
1.227273, -1.373067, 1.596655, 1, 0, 0.6117647, 1,
1.231488, -0.3140901, 2.25907, 1, 0, 0.6078432, 1,
1.25044, -0.8316783, 2.227362, 1, 0, 0.6, 1,
1.257616, -0.9455743, 3.285905, 1, 0, 0.5921569, 1,
1.257941, -0.9316825, 2.076096, 1, 0, 0.5882353, 1,
1.259786, 0.3857918, 0.2641018, 1, 0, 0.5803922, 1,
1.266885, -0.10538, 1.829412, 1, 0, 0.5764706, 1,
1.279219, 0.4168474, 1.48587, 1, 0, 0.5686275, 1,
1.279329, -0.6168332, 2.430565, 1, 0, 0.5647059, 1,
1.289784, -0.6825715, 2.832994, 1, 0, 0.5568628, 1,
1.297577, 0.9435762, 2.031506, 1, 0, 0.5529412, 1,
1.306743, -0.1762848, 2.273675, 1, 0, 0.5450981, 1,
1.315354, -0.1306812, 1.161501, 1, 0, 0.5411765, 1,
1.317058, -0.6293526, 1.965816, 1, 0, 0.5333334, 1,
1.31956, 0.1957363, 1.794384, 1, 0, 0.5294118, 1,
1.339752, -0.04055587, 2.093194, 1, 0, 0.5215687, 1,
1.361561, -0.9040365, 2.032584, 1, 0, 0.5176471, 1,
1.383047, -1.164371, 1.498535, 1, 0, 0.509804, 1,
1.3875, 0.4268925, 0.7901333, 1, 0, 0.5058824, 1,
1.396255, -0.1182668, 0.6074, 1, 0, 0.4980392, 1,
1.397579, -0.8951706, 1.53474, 1, 0, 0.4901961, 1,
1.402873, 0.2387508, 0.217724, 1, 0, 0.4862745, 1,
1.414388, 3.079369, -0.07146018, 1, 0, 0.4784314, 1,
1.424931, 0.7498109, -0.2016585, 1, 0, 0.4745098, 1,
1.430035, -0.6826854, 3.011684, 1, 0, 0.4666667, 1,
1.430545, -0.05257736, 0.9287434, 1, 0, 0.4627451, 1,
1.437049, 1.328604, -0.6818772, 1, 0, 0.454902, 1,
1.43927, -1.439013, 1.302378, 1, 0, 0.4509804, 1,
1.451256, 1.06733, 0.6948004, 1, 0, 0.4431373, 1,
1.454169, -0.3049174, 1.58173, 1, 0, 0.4392157, 1,
1.455576, 0.7258928, 1.590387, 1, 0, 0.4313726, 1,
1.462311, -0.05289431, 1.586329, 1, 0, 0.427451, 1,
1.467646, 1.86461, -0.03846276, 1, 0, 0.4196078, 1,
1.469507, -1.255145, 2.751024, 1, 0, 0.4156863, 1,
1.476086, 0.8076569, 2.427423, 1, 0, 0.4078431, 1,
1.498017, 0.3707958, -0.3854114, 1, 0, 0.4039216, 1,
1.499759, 0.4156136, 0.9710598, 1, 0, 0.3960784, 1,
1.502331, 0.6708096, 0.009105671, 1, 0, 0.3882353, 1,
1.508942, 0.2392082, 2.222585, 1, 0, 0.3843137, 1,
1.518077, 1.262975, 3.18863, 1, 0, 0.3764706, 1,
1.520979, -0.7700178, 0.2004226, 1, 0, 0.372549, 1,
1.523623, 0.5967632, 2.252549, 1, 0, 0.3647059, 1,
1.559003, 0.6976018, -0.02642293, 1, 0, 0.3607843, 1,
1.568765, -1.481743, 3.041515, 1, 0, 0.3529412, 1,
1.568837, 0.2787032, 0.9336502, 1, 0, 0.3490196, 1,
1.574465, 0.8261496, 2.323442, 1, 0, 0.3411765, 1,
1.577807, 0.9037903, 0.6732233, 1, 0, 0.3372549, 1,
1.591695, 2.200481, 0.414694, 1, 0, 0.3294118, 1,
1.618603, -0.1919448, 3.564981, 1, 0, 0.3254902, 1,
1.619761, -0.8466105, 1.552971, 1, 0, 0.3176471, 1,
1.629781, 1.891479, 1.709728, 1, 0, 0.3137255, 1,
1.65987, 0.1138017, 1.471306, 1, 0, 0.3058824, 1,
1.669399, -0.2803755, 0.8870203, 1, 0, 0.2980392, 1,
1.688837, -0.1891519, 2.403671, 1, 0, 0.2941177, 1,
1.695187, -0.2608826, 1.854022, 1, 0, 0.2862745, 1,
1.698992, 1.875475, 2.750885, 1, 0, 0.282353, 1,
1.706149, -1.196181, 3.768903, 1, 0, 0.2745098, 1,
1.71072, 1.22517, 0.2198668, 1, 0, 0.2705882, 1,
1.765938, 0.1675553, 1.206117, 1, 0, 0.2627451, 1,
1.780515, 0.3356256, 0.6638167, 1, 0, 0.2588235, 1,
1.788166, 0.0848328, 2.558382, 1, 0, 0.2509804, 1,
1.797918, -1.24049, 1.316567, 1, 0, 0.2470588, 1,
1.800733, -0.1599111, 1.410486, 1, 0, 0.2392157, 1,
1.812465, 1.094204, 2.135343, 1, 0, 0.2352941, 1,
1.82362, 0.1793467, 2.391636, 1, 0, 0.227451, 1,
1.839473, 0.4355226, 1.352506, 1, 0, 0.2235294, 1,
1.862474, 0.3255451, -0.1266703, 1, 0, 0.2156863, 1,
1.885546, 1.163911, 2.466846, 1, 0, 0.2117647, 1,
1.909099, -0.3111467, 0.8361269, 1, 0, 0.2039216, 1,
1.910684, 0.7934269, 0.481308, 1, 0, 0.1960784, 1,
1.938489, 0.4063313, -0.3647031, 1, 0, 0.1921569, 1,
1.953246, -0.1436182, 0.5269125, 1, 0, 0.1843137, 1,
1.97431, 0.9320124, 3.378893, 1, 0, 0.1803922, 1,
1.976018, -0.690739, 0.7539044, 1, 0, 0.172549, 1,
1.976934, -0.3351265, -0.4649279, 1, 0, 0.1686275, 1,
1.988117, 2.275881, -0.7969941, 1, 0, 0.1607843, 1,
2.026695, 0.1734428, 2.113204, 1, 0, 0.1568628, 1,
2.037968, -1.151937, 1.194599, 1, 0, 0.1490196, 1,
2.090995, -1.118444, 3.302011, 1, 0, 0.145098, 1,
2.101282, -0.6419174, -0.3481262, 1, 0, 0.1372549, 1,
2.1151, -1.435679, 1.910847, 1, 0, 0.1333333, 1,
2.134563, -0.2475109, 2.513104, 1, 0, 0.1254902, 1,
2.139273, -1.289851, 2.572751, 1, 0, 0.1215686, 1,
2.163404, 0.3078972, 1.7882, 1, 0, 0.1137255, 1,
2.192295, -0.2134582, 0.7937378, 1, 0, 0.1098039, 1,
2.205793, -0.3066054, 1.62737, 1, 0, 0.1019608, 1,
2.223757, -0.1612564, 1.815444, 1, 0, 0.09411765, 1,
2.33485, -0.8227898, 2.336852, 1, 0, 0.09019608, 1,
2.384437, -0.4940869, 3.651087, 1, 0, 0.08235294, 1,
2.426536, -1.270791, 2.230356, 1, 0, 0.07843138, 1,
2.443607, -0.56019, 1.259853, 1, 0, 0.07058824, 1,
2.494903, -0.4231636, -0.6860058, 1, 0, 0.06666667, 1,
2.538327, 0.4860219, 1.906058, 1, 0, 0.05882353, 1,
2.63836, -1.570781, 2.592429, 1, 0, 0.05490196, 1,
2.776805, 1.177227, 1.116792, 1, 0, 0.04705882, 1,
2.779904, -1.072567, 1.762766, 1, 0, 0.04313726, 1,
2.806371, -1.424521, 2.434426, 1, 0, 0.03529412, 1,
2.820559, -0.4283941, 0.4829718, 1, 0, 0.03137255, 1,
2.826019, 0.499131, 1.282115, 1, 0, 0.02352941, 1,
2.867547, 0.9775697, 2.794125, 1, 0, 0.01960784, 1,
2.977654, -1.277113, -0.135238, 1, 0, 0.01176471, 1,
3.6736, 0.2490964, 1.077436, 1, 0, 0.007843138, 1
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
0.2201275, -3.900834, -7.240384, 0, -0.5, 0.5, 0.5,
0.2201275, -3.900834, -7.240384, 1, -0.5, 0.5, 0.5,
0.2201275, -3.900834, -7.240384, 1, 1.5, 0.5, 0.5,
0.2201275, -3.900834, -7.240384, 0, 1.5, 0.5, 0.5
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
-4.404073, 0.1248276, -7.240384, 0, -0.5, 0.5, 0.5,
-4.404073, 0.1248276, -7.240384, 1, -0.5, 0.5, 0.5,
-4.404073, 0.1248276, -7.240384, 1, 1.5, 0.5, 0.5,
-4.404073, 0.1248276, -7.240384, 0, 1.5, 0.5, 0.5
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
-4.404073, -3.900834, -0.1110871, 0, -0.5, 0.5, 0.5,
-4.404073, -3.900834, -0.1110871, 1, -0.5, 0.5, 0.5,
-4.404073, -3.900834, -0.1110871, 1, 1.5, 0.5, 0.5,
-4.404073, -3.900834, -0.1110871, 0, 1.5, 0.5, 0.5
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
-3, -2.971835, -5.595161,
3, -2.971835, -5.595161,
-3, -2.971835, -5.595161,
-3, -3.126668, -5.869365,
-2, -2.971835, -5.595161,
-2, -3.126668, -5.869365,
-1, -2.971835, -5.595161,
-1, -3.126668, -5.869365,
0, -2.971835, -5.595161,
0, -3.126668, -5.869365,
1, -2.971835, -5.595161,
1, -3.126668, -5.869365,
2, -2.971835, -5.595161,
2, -3.126668, -5.869365,
3, -2.971835, -5.595161,
3, -3.126668, -5.869365
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
-3, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
-3, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
-3, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
-3, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
-2, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
-2, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
-2, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
-2, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
-1, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
-1, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
-1, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
-1, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
0, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
0, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
0, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
0, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
1, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
1, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
1, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
1, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
2, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
2, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
2, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
2, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5,
3, -3.436334, -6.417772, 0, -0.5, 0.5, 0.5,
3, -3.436334, -6.417772, 1, -0.5, 0.5, 0.5,
3, -3.436334, -6.417772, 1, 1.5, 0.5, 0.5,
3, -3.436334, -6.417772, 0, 1.5, 0.5, 0.5
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
-3.33695, -2, -5.595161,
-3.33695, 3, -5.595161,
-3.33695, -2, -5.595161,
-3.514804, -2, -5.869365,
-3.33695, -1, -5.595161,
-3.514804, -1, -5.869365,
-3.33695, 0, -5.595161,
-3.514804, 0, -5.869365,
-3.33695, 1, -5.595161,
-3.514804, 1, -5.869365,
-3.33695, 2, -5.595161,
-3.514804, 2, -5.869365,
-3.33695, 3, -5.595161,
-3.514804, 3, -5.869365
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
-3.870511, -2, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, -2, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, -2, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, -2, -6.417772, 0, 1.5, 0.5, 0.5,
-3.870511, -1, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, -1, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, -1, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, -1, -6.417772, 0, 1.5, 0.5, 0.5,
-3.870511, 0, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, 0, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, 0, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, 0, -6.417772, 0, 1.5, 0.5, 0.5,
-3.870511, 1, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, 1, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, 1, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, 1, -6.417772, 0, 1.5, 0.5, 0.5,
-3.870511, 2, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, 2, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, 2, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, 2, -6.417772, 0, 1.5, 0.5, 0.5,
-3.870511, 3, -6.417772, 0, -0.5, 0.5, 0.5,
-3.870511, 3, -6.417772, 1, -0.5, 0.5, 0.5,
-3.870511, 3, -6.417772, 1, 1.5, 0.5, 0.5,
-3.870511, 3, -6.417772, 0, 1.5, 0.5, 0.5
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
-3.33695, -2.971835, -4,
-3.33695, -2.971835, 4,
-3.33695, -2.971835, -4,
-3.514804, -3.126668, -4,
-3.33695, -2.971835, -2,
-3.514804, -3.126668, -2,
-3.33695, -2.971835, 0,
-3.514804, -3.126668, 0,
-3.33695, -2.971835, 2,
-3.514804, -3.126668, 2,
-3.33695, -2.971835, 4,
-3.514804, -3.126668, 4
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
-3.870511, -3.436334, -4, 0, -0.5, 0.5, 0.5,
-3.870511, -3.436334, -4, 1, -0.5, 0.5, 0.5,
-3.870511, -3.436334, -4, 1, 1.5, 0.5, 0.5,
-3.870511, -3.436334, -4, 0, 1.5, 0.5, 0.5,
-3.870511, -3.436334, -2, 0, -0.5, 0.5, 0.5,
-3.870511, -3.436334, -2, 1, -0.5, 0.5, 0.5,
-3.870511, -3.436334, -2, 1, 1.5, 0.5, 0.5,
-3.870511, -3.436334, -2, 0, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 0, 0, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 0, 1, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 0, 1, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 0, 0, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 2, 0, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 2, 1, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 2, 1, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 2, 0, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 4, 0, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 4, 1, -0.5, 0.5, 0.5,
-3.870511, -3.436334, 4, 1, 1.5, 0.5, 0.5,
-3.870511, -3.436334, 4, 0, 1.5, 0.5, 0.5
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
-3.33695, -2.971835, -5.595161,
-3.33695, 3.22149, -5.595161,
-3.33695, -2.971835, 5.372987,
-3.33695, 3.22149, 5.372987,
-3.33695, -2.971835, -5.595161,
-3.33695, -2.971835, 5.372987,
-3.33695, 3.22149, -5.595161,
-3.33695, 3.22149, 5.372987,
-3.33695, -2.971835, -5.595161,
3.777205, -2.971835, -5.595161,
-3.33695, -2.971835, 5.372987,
3.777205, -2.971835, 5.372987,
-3.33695, 3.22149, -5.595161,
3.777205, 3.22149, -5.595161,
-3.33695, 3.22149, 5.372987,
3.777205, 3.22149, 5.372987,
3.777205, -2.971835, -5.595161,
3.777205, 3.22149, -5.595161,
3.777205, -2.971835, 5.372987,
3.777205, 3.22149, 5.372987,
3.777205, -2.971835, -5.595161,
3.777205, -2.971835, 5.372987,
3.777205, 3.22149, -5.595161,
3.777205, 3.22149, 5.372987
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
var radius = 7.72463;
var distance = 34.36775;
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
mvMatrix.translate( -0.2201275, -0.1248276, 0.1110871 );
mvMatrix.scale( 1.174001, 1.348552, 0.7614796 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36775);
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


