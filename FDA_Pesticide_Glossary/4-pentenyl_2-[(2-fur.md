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
-3.271573, 2.940753, -0.3537561, 1, 0, 0, 1,
-3.120988, 0.2776337, 0.4616579, 1, 0.007843138, 0, 1,
-2.946896, -0.187931, -2.466607, 1, 0.01176471, 0, 1,
-2.8335, -1.530856, -1.85611, 1, 0.01960784, 0, 1,
-2.82412, -0.1692417, -0.5062588, 1, 0.02352941, 0, 1,
-2.776783, -0.2499401, -1.600122, 1, 0.03137255, 0, 1,
-2.701099, -1.065005, -4.927433, 1, 0.03529412, 0, 1,
-2.630377, -0.5884978, -1.765614, 1, 0.04313726, 0, 1,
-2.596499, -1.222966, -1.507602, 1, 0.04705882, 0, 1,
-2.56881, -0.270772, -1.569252, 1, 0.05490196, 0, 1,
-2.455155, 0.3525224, -0.1535702, 1, 0.05882353, 0, 1,
-2.439758, -0.3167552, -1.062636, 1, 0.06666667, 0, 1,
-2.409491, -0.4568633, -2.762028, 1, 0.07058824, 0, 1,
-2.339123, 0.3329895, -0.355873, 1, 0.07843138, 0, 1,
-2.276105, 0.7061184, -0.3166823, 1, 0.08235294, 0, 1,
-2.208378, 0.9120448, -1.419129, 1, 0.09019608, 0, 1,
-2.181935, -0.3265471, -0.6166026, 1, 0.09411765, 0, 1,
-2.06444, -0.09320781, -1.570417, 1, 0.1019608, 0, 1,
-2.021879, 0.2091884, -1.760413, 1, 0.1098039, 0, 1,
-2.021436, -0.4534052, -1.265042, 1, 0.1137255, 0, 1,
-2.015348, 0.366136, -0.3140948, 1, 0.1215686, 0, 1,
-1.989735, 1.348179, 1.0698, 1, 0.1254902, 0, 1,
-1.982733, 1.391147, -0.9742062, 1, 0.1333333, 0, 1,
-1.977759, -0.8993772, -1.674595, 1, 0.1372549, 0, 1,
-1.977248, 0.680828, -0.4408245, 1, 0.145098, 0, 1,
-1.972961, 0.9014382, -0.2788448, 1, 0.1490196, 0, 1,
-1.919524, 1.100508, -0.2987712, 1, 0.1568628, 0, 1,
-1.861175, 0.3139716, -0.5028, 1, 0.1607843, 0, 1,
-1.856558, -0.089358, -1.73685, 1, 0.1686275, 0, 1,
-1.855361, 1.366558, -3.274807, 1, 0.172549, 0, 1,
-1.855288, -2.182577, -3.110506, 1, 0.1803922, 0, 1,
-1.846844, -1.704994, -0.647576, 1, 0.1843137, 0, 1,
-1.837031, 0.1618816, -0.1354505, 1, 0.1921569, 0, 1,
-1.836929, -0.6194513, -1.782269, 1, 0.1960784, 0, 1,
-1.820775, -0.5756191, -3.276947, 1, 0.2039216, 0, 1,
-1.814053, 0.7688209, -0.2903917, 1, 0.2117647, 0, 1,
-1.800427, -0.3057, -1.675864, 1, 0.2156863, 0, 1,
-1.799609, -0.5131063, -1.011212, 1, 0.2235294, 0, 1,
-1.766468, -1.902318, -1.218717, 1, 0.227451, 0, 1,
-1.764814, 0.0554992, -0.7021182, 1, 0.2352941, 0, 1,
-1.763859, 2.214782, -1.755792, 1, 0.2392157, 0, 1,
-1.700341, 0.7146545, -2.114112, 1, 0.2470588, 0, 1,
-1.699761, 0.2390593, -2.139802, 1, 0.2509804, 0, 1,
-1.690825, -0.2217212, -3.649597, 1, 0.2588235, 0, 1,
-1.688734, 0.8556705, -1.363544, 1, 0.2627451, 0, 1,
-1.681932, 1.422776, -2.595084, 1, 0.2705882, 0, 1,
-1.677526, -1.034341, -2.878876, 1, 0.2745098, 0, 1,
-1.665823, -1.320439, -0.7845235, 1, 0.282353, 0, 1,
-1.662413, 0.5710101, -1.181563, 1, 0.2862745, 0, 1,
-1.662175, -2.022931, -3.490539, 1, 0.2941177, 0, 1,
-1.662147, 0.4034675, -1.30035, 1, 0.3019608, 0, 1,
-1.645583, -0.5019183, -1.830294, 1, 0.3058824, 0, 1,
-1.644925, -1.565175, -3.441215, 1, 0.3137255, 0, 1,
-1.640939, -0.8822307, -2.189423, 1, 0.3176471, 0, 1,
-1.625868, 0.5100256, -0.6711364, 1, 0.3254902, 0, 1,
-1.617115, -0.6893511, -3.591131, 1, 0.3294118, 0, 1,
-1.592877, -0.5182387, -1.671416, 1, 0.3372549, 0, 1,
-1.57731, -0.4412533, -1.800284, 1, 0.3411765, 0, 1,
-1.575399, -0.8657944, -0.84387, 1, 0.3490196, 0, 1,
-1.574994, 1.64799, -1.374915, 1, 0.3529412, 0, 1,
-1.57257, -1.856841, -3.77878, 1, 0.3607843, 0, 1,
-1.56234, 1.376456, -1.844885, 1, 0.3647059, 0, 1,
-1.55404, -0.4707699, -1.528865, 1, 0.372549, 0, 1,
-1.548144, 0.5791516, -1.894232, 1, 0.3764706, 0, 1,
-1.529455, 0.7990538, 0.4763629, 1, 0.3843137, 0, 1,
-1.52045, 0.9346199, -0.3434356, 1, 0.3882353, 0, 1,
-1.497634, -0.7462347, -1.802722, 1, 0.3960784, 0, 1,
-1.495262, 0.1098069, -2.221409, 1, 0.4039216, 0, 1,
-1.484874, 0.4870173, -0.5766959, 1, 0.4078431, 0, 1,
-1.482756, -1.814809, -3.554529, 1, 0.4156863, 0, 1,
-1.471242, -1.405048, -2.796892, 1, 0.4196078, 0, 1,
-1.464156, -2.693101, -2.682282, 1, 0.427451, 0, 1,
-1.458758, 0.550889, -0.5709149, 1, 0.4313726, 0, 1,
-1.458247, 0.1743032, -1.061252, 1, 0.4392157, 0, 1,
-1.448938, -0.6880692, -3.082381, 1, 0.4431373, 0, 1,
-1.44873, -0.5092403, -1.119561, 1, 0.4509804, 0, 1,
-1.429856, -1.191227, -2.384524, 1, 0.454902, 0, 1,
-1.426032, 1.501036, -0.8467479, 1, 0.4627451, 0, 1,
-1.425256, 0.2555597, -0.6345679, 1, 0.4666667, 0, 1,
-1.423191, 0.5909883, -0.2427084, 1, 0.4745098, 0, 1,
-1.420322, 0.3081683, -2.157016, 1, 0.4784314, 0, 1,
-1.420306, -1.666844, -3.611143, 1, 0.4862745, 0, 1,
-1.415694, -0.05333395, -1.6438, 1, 0.4901961, 0, 1,
-1.405093, -0.4259732, -2.017866, 1, 0.4980392, 0, 1,
-1.372707, -0.7176109, -3.489832, 1, 0.5058824, 0, 1,
-1.364666, 0.4331605, -1.89723, 1, 0.509804, 0, 1,
-1.364414, 0.6604233, -0.8258638, 1, 0.5176471, 0, 1,
-1.354462, 0.6246451, -0.8530729, 1, 0.5215687, 0, 1,
-1.352199, -0.3155648, -2.546992, 1, 0.5294118, 0, 1,
-1.343372, 0.7510287, 1.07463, 1, 0.5333334, 0, 1,
-1.334969, -1.427253, -0.7970477, 1, 0.5411765, 0, 1,
-1.327008, 0.04489069, -0.5266069, 1, 0.5450981, 0, 1,
-1.325947, -0.5201102, -0.2538196, 1, 0.5529412, 0, 1,
-1.318914, -0.1097668, -1.189859, 1, 0.5568628, 0, 1,
-1.317183, -0.02332508, 0.905303, 1, 0.5647059, 0, 1,
-1.30781, 0.7357153, -1.494971, 1, 0.5686275, 0, 1,
-1.299216, -0.1350173, 0.1042908, 1, 0.5764706, 0, 1,
-1.289613, 0.1091348, -1.09441, 1, 0.5803922, 0, 1,
-1.288085, 1.429537, -0.4129769, 1, 0.5882353, 0, 1,
-1.284614, -1.685387, -1.942119, 1, 0.5921569, 0, 1,
-1.2833, 0.2872045, -0.6801299, 1, 0.6, 0, 1,
-1.276264, 0.006529352, -0.3917412, 1, 0.6078432, 0, 1,
-1.272071, 1.478357, -1.833401, 1, 0.6117647, 0, 1,
-1.247127, 1.688651, -0.6699646, 1, 0.6196079, 0, 1,
-1.242407, 0.7009162, 0.1082025, 1, 0.6235294, 0, 1,
-1.233866, 0.2145063, -3.615684, 1, 0.6313726, 0, 1,
-1.228426, -1.553515, -1.913093, 1, 0.6352941, 0, 1,
-1.227497, 1.178442, -1.338743, 1, 0.6431373, 0, 1,
-1.225896, 1.464527, -0.919923, 1, 0.6470588, 0, 1,
-1.216582, 1.586469, 0.2957294, 1, 0.654902, 0, 1,
-1.20672, -1.373446, -2.392087, 1, 0.6588235, 0, 1,
-1.197188, 0.2126962, 0.1987679, 1, 0.6666667, 0, 1,
-1.196719, -0.8379185, -1.849673, 1, 0.6705883, 0, 1,
-1.194308, 0.9027867, -1.306273, 1, 0.6784314, 0, 1,
-1.192835, 0.3621013, -2.165431, 1, 0.682353, 0, 1,
-1.192264, 0.7460185, -1.29021, 1, 0.6901961, 0, 1,
-1.179508, -0.3412739, -1.026033, 1, 0.6941177, 0, 1,
-1.178942, 1.003709, 0.008444359, 1, 0.7019608, 0, 1,
-1.170256, 0.9659407, -0.8315307, 1, 0.7098039, 0, 1,
-1.166998, -0.8924679, -2.043921, 1, 0.7137255, 0, 1,
-1.166408, -0.32788, -0.543735, 1, 0.7215686, 0, 1,
-1.166344, -1.997694, -3.97375, 1, 0.7254902, 0, 1,
-1.163131, 1.782659, -1.238342, 1, 0.7333333, 0, 1,
-1.163013, 0.3696596, -1.907038, 1, 0.7372549, 0, 1,
-1.158665, -0.550815, -3.10823, 1, 0.7450981, 0, 1,
-1.158392, -1.301095, -3.016057, 1, 0.7490196, 0, 1,
-1.153013, -1.93222, -2.97313, 1, 0.7568628, 0, 1,
-1.152604, 1.248398, -0.3769745, 1, 0.7607843, 0, 1,
-1.143998, 0.2080136, -2.164635, 1, 0.7686275, 0, 1,
-1.141474, -1.119068, -2.504411, 1, 0.772549, 0, 1,
-1.139475, 0.4411248, 0.596122, 1, 0.7803922, 0, 1,
-1.138703, -1.393535, -1.038609, 1, 0.7843137, 0, 1,
-1.133777, 0.3407077, -1.12172, 1, 0.7921569, 0, 1,
-1.126703, -0.9000736, -2.185387, 1, 0.7960784, 0, 1,
-1.123583, -2.123856, -1.734119, 1, 0.8039216, 0, 1,
-1.122426, -0.2688117, -2.808239, 1, 0.8117647, 0, 1,
-1.10686, 0.9857881, -0.08019458, 1, 0.8156863, 0, 1,
-1.106455, 0.2295182, -0.5022528, 1, 0.8235294, 0, 1,
-1.096017, -0.7671772, -2.702238, 1, 0.827451, 0, 1,
-1.087404, -0.7124781, -1.267492, 1, 0.8352941, 0, 1,
-1.081689, 0.491445, -1.48607, 1, 0.8392157, 0, 1,
-1.07943, 0.3932974, -0.7756457, 1, 0.8470588, 0, 1,
-1.078414, -0.1702301, -1.025294, 1, 0.8509804, 0, 1,
-1.075191, 0.7338213, -1.524397, 1, 0.8588235, 0, 1,
-1.07392, 0.4560308, -0.9199479, 1, 0.8627451, 0, 1,
-1.07384, -0.3719084, -1.644205, 1, 0.8705882, 0, 1,
-1.070899, -1.179087, -1.738727, 1, 0.8745098, 0, 1,
-1.067293, -0.952005, -2.988667, 1, 0.8823529, 0, 1,
-1.063101, 0.2285587, -0.4001547, 1, 0.8862745, 0, 1,
-1.05946, 0.08686643, -0.1673693, 1, 0.8941177, 0, 1,
-1.056251, -0.5895893, -1.628597, 1, 0.8980392, 0, 1,
-1.054424, -0.1320341, -1.098261, 1, 0.9058824, 0, 1,
-1.047418, 0.7679589, -2.733171, 1, 0.9137255, 0, 1,
-1.044738, -0.9489801, -2.167099, 1, 0.9176471, 0, 1,
-1.042616, 0.678235, 0.07465447, 1, 0.9254902, 0, 1,
-1.042473, 0.4318036, -2.510879, 1, 0.9294118, 0, 1,
-1.040107, 0.4821832, -0.494021, 1, 0.9372549, 0, 1,
-1.039223, 0.7971292, -2.479933, 1, 0.9411765, 0, 1,
-1.037028, -0.4201602, -2.350027, 1, 0.9490196, 0, 1,
-1.035247, -1.21917, -1.479486, 1, 0.9529412, 0, 1,
-1.032197, 1.753037, -0.9668654, 1, 0.9607843, 0, 1,
-1.031674, -0.8859109, -2.100793, 1, 0.9647059, 0, 1,
-1.026934, 1.15906, -0.1038907, 1, 0.972549, 0, 1,
-1.026837, 1.790944, -1.550887, 1, 0.9764706, 0, 1,
-1.026135, 0.47255, -1.666632, 1, 0.9843137, 0, 1,
-1.025974, 0.6639284, -0.1789577, 1, 0.9882353, 0, 1,
-1.023188, -0.1574509, -2.940905, 1, 0.9960784, 0, 1,
-1.020778, 0.1850159, -0.3091767, 0.9960784, 1, 0, 1,
-1.018755, 0.785224, -0.104736, 0.9921569, 1, 0, 1,
-1.017279, -1.010506, -2.766982, 0.9843137, 1, 0, 1,
-1.016293, -1.642997, -3.066996, 0.9803922, 1, 0, 1,
-1.016129, 0.5474792, -2.49032, 0.972549, 1, 0, 1,
-1.014298, 0.418869, -1.3366, 0.9686275, 1, 0, 1,
-1.014193, -0.6765409, -3.162732, 0.9607843, 1, 0, 1,
-1.001329, -1.176997, -2.383575, 0.9568627, 1, 0, 1,
-0.9986212, -0.6865798, -2.177938, 0.9490196, 1, 0, 1,
-0.9928763, 0.865642, -1.700952, 0.945098, 1, 0, 1,
-0.9922435, -1.665909, -3.064655, 0.9372549, 1, 0, 1,
-0.9912925, 0.3679952, -1.08034, 0.9333333, 1, 0, 1,
-0.9777708, -0.6760117, -4.182745, 0.9254902, 1, 0, 1,
-0.9752569, 2.117925, 0.4235474, 0.9215686, 1, 0, 1,
-0.9707253, 0.4874151, 0.6227014, 0.9137255, 1, 0, 1,
-0.9676399, 0.8795833, -0.4225936, 0.9098039, 1, 0, 1,
-0.966004, -0.8237422, 0.5667378, 0.9019608, 1, 0, 1,
-0.961176, 0.6600126, -0.6755809, 0.8941177, 1, 0, 1,
-0.9546661, -1.790205, -1.446105, 0.8901961, 1, 0, 1,
-0.9503141, -1.166421, -2.598773, 0.8823529, 1, 0, 1,
-0.9501796, 2.440286, 0.8600249, 0.8784314, 1, 0, 1,
-0.9459784, -0.871403, -2.298905, 0.8705882, 1, 0, 1,
-0.9450374, 0.4289496, -1.591574, 0.8666667, 1, 0, 1,
-0.9443632, -2.042763, -2.315245, 0.8588235, 1, 0, 1,
-0.9423361, 1.768082, -1.610956, 0.854902, 1, 0, 1,
-0.9401078, -1.848308, -2.949167, 0.8470588, 1, 0, 1,
-0.9360707, -0.206313, -2.00499, 0.8431373, 1, 0, 1,
-0.9195487, -0.9224556, -3.522535, 0.8352941, 1, 0, 1,
-0.9107744, -0.5661462, -3.199945, 0.8313726, 1, 0, 1,
-0.9016477, -1.413053, -2.711581, 0.8235294, 1, 0, 1,
-0.9002034, 0.6659111, -2.782933, 0.8196079, 1, 0, 1,
-0.8990493, 0.2771867, -2.097059, 0.8117647, 1, 0, 1,
-0.8953416, 0.4257775, -1.549892, 0.8078431, 1, 0, 1,
-0.8906849, -1.370591, -3.01478, 0.8, 1, 0, 1,
-0.8889275, 0.989131, -1.452323, 0.7921569, 1, 0, 1,
-0.8739301, 0.2636927, -1.517173, 0.7882353, 1, 0, 1,
-0.8729612, -1.149629, -2.879207, 0.7803922, 1, 0, 1,
-0.8689597, -0.7806119, -2.127135, 0.7764706, 1, 0, 1,
-0.8670997, -0.6321824, -2.375506, 0.7686275, 1, 0, 1,
-0.8592011, -1.282606, -2.909752, 0.7647059, 1, 0, 1,
-0.858775, -0.3382875, -1.348404, 0.7568628, 1, 0, 1,
-0.8577516, -0.9263501, -3.005573, 0.7529412, 1, 0, 1,
-0.8523908, -0.2489686, -0.450261, 0.7450981, 1, 0, 1,
-0.8507033, 1.753544, -1.725904, 0.7411765, 1, 0, 1,
-0.8381154, 0.5849595, -1.319215, 0.7333333, 1, 0, 1,
-0.8355412, 0.5804911, -0.1616577, 0.7294118, 1, 0, 1,
-0.8353224, 0.5971534, -1.127586, 0.7215686, 1, 0, 1,
-0.8352481, -1.40262, -3.617163, 0.7176471, 1, 0, 1,
-0.8265974, -2.66071, -3.613988, 0.7098039, 1, 0, 1,
-0.8265914, -0.9330131, -2.044248, 0.7058824, 1, 0, 1,
-0.8223205, 0.5155792, -2.186511, 0.6980392, 1, 0, 1,
-0.8169701, 0.128785, -2.014059, 0.6901961, 1, 0, 1,
-0.8146695, 0.4839868, -0.4126634, 0.6862745, 1, 0, 1,
-0.8091018, 0.6060385, -1.610795, 0.6784314, 1, 0, 1,
-0.8079041, -0.5156669, -1.676072, 0.6745098, 1, 0, 1,
-0.8041856, 0.3610792, -0.968597, 0.6666667, 1, 0, 1,
-0.794423, 0.5510128, -1.154208, 0.6627451, 1, 0, 1,
-0.7908789, 2.477809, -1.581959, 0.654902, 1, 0, 1,
-0.7849581, 1.761638, -1.40575, 0.6509804, 1, 0, 1,
-0.7837186, -7.950895e-05, -0.5217797, 0.6431373, 1, 0, 1,
-0.7826573, 0.5955369, -1.121182, 0.6392157, 1, 0, 1,
-0.7816521, -0.1263281, -2.675238, 0.6313726, 1, 0, 1,
-0.7808461, 0.1291126, -1.763428, 0.627451, 1, 0, 1,
-0.7728915, -0.8623546, -2.966003, 0.6196079, 1, 0, 1,
-0.7696152, -0.3848561, -0.88705, 0.6156863, 1, 0, 1,
-0.7695882, 0.6993495, -0.08587078, 0.6078432, 1, 0, 1,
-0.7666588, -0.4562811, -2.636395, 0.6039216, 1, 0, 1,
-0.7579863, -1.11827, -2.141276, 0.5960785, 1, 0, 1,
-0.7552187, -0.3443042, -2.172945, 0.5882353, 1, 0, 1,
-0.753853, -0.7416102, -1.624876, 0.5843138, 1, 0, 1,
-0.7523266, -1.145913, -2.849369, 0.5764706, 1, 0, 1,
-0.7423079, 0.3915672, -2.750096, 0.572549, 1, 0, 1,
-0.7399412, -1.881176, -1.811125, 0.5647059, 1, 0, 1,
-0.7376495, -0.8729376, -2.235977, 0.5607843, 1, 0, 1,
-0.7355822, -1.639759, -3.601939, 0.5529412, 1, 0, 1,
-0.7273645, 1.836717, -1.378136, 0.5490196, 1, 0, 1,
-0.7204458, -1.071932, -1.733982, 0.5411765, 1, 0, 1,
-0.7182537, 0.5049545, -0.3702581, 0.5372549, 1, 0, 1,
-0.7180828, 1.568353, -2.615163, 0.5294118, 1, 0, 1,
-0.7053842, 0.1250357, -1.248972, 0.5254902, 1, 0, 1,
-0.7047681, -0.2705865, -3.468242, 0.5176471, 1, 0, 1,
-0.7019303, 0.3810308, -0.5114483, 0.5137255, 1, 0, 1,
-0.6972592, 0.9116235, -0.1390225, 0.5058824, 1, 0, 1,
-0.6947048, 2.510118, -0.6426705, 0.5019608, 1, 0, 1,
-0.6891947, 1.19521, -0.6809245, 0.4941176, 1, 0, 1,
-0.668059, 0.1063535, -2.37969, 0.4862745, 1, 0, 1,
-0.6676846, 0.5432137, 0.5071351, 0.4823529, 1, 0, 1,
-0.6655779, 2.260182, 0.4928634, 0.4745098, 1, 0, 1,
-0.6577469, -1.054874, -2.332154, 0.4705882, 1, 0, 1,
-0.6546274, 0.172689, -1.848664, 0.4627451, 1, 0, 1,
-0.6526918, 1.144844, -2.149033, 0.4588235, 1, 0, 1,
-0.6513042, 1.15095, -0.05562371, 0.4509804, 1, 0, 1,
-0.6402887, -1.854562, -3.454671, 0.4470588, 1, 0, 1,
-0.6365855, -0.3754592, -0.765731, 0.4392157, 1, 0, 1,
-0.6363851, -0.1626605, -1.553697, 0.4352941, 1, 0, 1,
-0.6306546, -0.476748, -3.334867, 0.427451, 1, 0, 1,
-0.6237048, 0.9554819, 0.4862611, 0.4235294, 1, 0, 1,
-0.6222683, -0.7518766, -2.389148, 0.4156863, 1, 0, 1,
-0.6217393, -0.06473429, 0.03360549, 0.4117647, 1, 0, 1,
-0.6210124, -0.7001137, -3.044492, 0.4039216, 1, 0, 1,
-0.6207991, 0.4288568, -1.020093, 0.3960784, 1, 0, 1,
-0.6204341, -0.4737302, -0.2419474, 0.3921569, 1, 0, 1,
-0.6137112, -0.2869107, -2.55918, 0.3843137, 1, 0, 1,
-0.6118832, -0.5123011, -1.466104, 0.3803922, 1, 0, 1,
-0.6100401, 0.3847753, -1.346627, 0.372549, 1, 0, 1,
-0.6083055, -1.471843, -4.856594, 0.3686275, 1, 0, 1,
-0.6063036, 1.065326, -0.6867865, 0.3607843, 1, 0, 1,
-0.6057114, 0.8716305, -0.2734893, 0.3568628, 1, 0, 1,
-0.6053217, 0.09758714, 0.8060523, 0.3490196, 1, 0, 1,
-0.603833, 0.0610587, -0.5878307, 0.345098, 1, 0, 1,
-0.5839516, -0.7434984, -2.938006, 0.3372549, 1, 0, 1,
-0.582495, -0.3061827, -2.743414, 0.3333333, 1, 0, 1,
-0.576369, 0.4510759, -0.9599074, 0.3254902, 1, 0, 1,
-0.5737119, 0.884891, -0.1633114, 0.3215686, 1, 0, 1,
-0.56791, 0.7150447, -0.4341867, 0.3137255, 1, 0, 1,
-0.5626276, -0.5852959, -3.57189, 0.3098039, 1, 0, 1,
-0.5556496, 0.3137965, -1.580716, 0.3019608, 1, 0, 1,
-0.5503168, -1.310082, -3.180718, 0.2941177, 1, 0, 1,
-0.5499605, -0.4474252, -1.579003, 0.2901961, 1, 0, 1,
-0.5478458, -0.5165946, -2.784371, 0.282353, 1, 0, 1,
-0.546091, 0.8729247, -1.658487, 0.2784314, 1, 0, 1,
-0.5424427, 0.5640296, -0.8058545, 0.2705882, 1, 0, 1,
-0.5414341, -0.0857954, -3.194315, 0.2666667, 1, 0, 1,
-0.534501, -0.5804837, -2.960632, 0.2588235, 1, 0, 1,
-0.5343878, 0.8027298, -0.1113841, 0.254902, 1, 0, 1,
-0.5321586, -1.096958, -2.027138, 0.2470588, 1, 0, 1,
-0.5313219, -1.499896, -3.899591, 0.2431373, 1, 0, 1,
-0.5293166, 0.3702609, 0.131332, 0.2352941, 1, 0, 1,
-0.5285187, -0.8823347, -2.602025, 0.2313726, 1, 0, 1,
-0.5270592, -0.9304041, -2.622488, 0.2235294, 1, 0, 1,
-0.5231016, 0.9132181, -1.380106, 0.2196078, 1, 0, 1,
-0.5192344, 1.033228, 1.228095, 0.2117647, 1, 0, 1,
-0.5189611, 0.009953125, -2.038896, 0.2078431, 1, 0, 1,
-0.5187387, -0.4306121, -1.20697, 0.2, 1, 0, 1,
-0.5156944, -0.09206465, -2.600829, 0.1921569, 1, 0, 1,
-0.5130102, 1.00275, -0.2683206, 0.1882353, 1, 0, 1,
-0.51219, 0.5647259, -2.116957, 0.1803922, 1, 0, 1,
-0.5080895, -1.728796, -2.101099, 0.1764706, 1, 0, 1,
-0.5039908, -0.3292781, -4.23761, 0.1686275, 1, 0, 1,
-0.5019487, -0.8615852, -3.14457, 0.1647059, 1, 0, 1,
-0.4975592, 0.1584002, -0.7621678, 0.1568628, 1, 0, 1,
-0.4973122, -0.9182408, -2.881118, 0.1529412, 1, 0, 1,
-0.4906369, -0.308648, -2.733635, 0.145098, 1, 0, 1,
-0.4899086, 0.5428037, -1.517814, 0.1411765, 1, 0, 1,
-0.4867276, -1.346993, -3.077387, 0.1333333, 1, 0, 1,
-0.4835157, 0.7538569, 0.08873491, 0.1294118, 1, 0, 1,
-0.4821652, -1.075066, -3.950558, 0.1215686, 1, 0, 1,
-0.4702771, 0.220886, 0.6720046, 0.1176471, 1, 0, 1,
-0.4692253, -0.917318, -2.274334, 0.1098039, 1, 0, 1,
-0.4681515, 1.177132, -0.1282415, 0.1058824, 1, 0, 1,
-0.466213, 0.4995707, -1.413864, 0.09803922, 1, 0, 1,
-0.4650345, 0.3372978, -2.160254, 0.09019608, 1, 0, 1,
-0.4604347, -0.283251, -1.254465, 0.08627451, 1, 0, 1,
-0.4554677, -0.04453827, -1.252008, 0.07843138, 1, 0, 1,
-0.4526937, 1.223056, -1.419597, 0.07450981, 1, 0, 1,
-0.4516721, 0.2128194, 0.2313251, 0.06666667, 1, 0, 1,
-0.4507558, 0.2787161, -1.245507, 0.0627451, 1, 0, 1,
-0.4459859, -0.5502039, -2.108162, 0.05490196, 1, 0, 1,
-0.4421922, 1.135472, -1.435222, 0.05098039, 1, 0, 1,
-0.4400015, 0.1659947, -1.957388, 0.04313726, 1, 0, 1,
-0.4395809, -0.5698074, -2.941799, 0.03921569, 1, 0, 1,
-0.438638, 0.04207325, -2.641502, 0.03137255, 1, 0, 1,
-0.4376405, 0.5373765, -0.7541853, 0.02745098, 1, 0, 1,
-0.4329825, -0.3678299, -1.618141, 0.01960784, 1, 0, 1,
-0.4325515, 0.7956733, -0.006523914, 0.01568628, 1, 0, 1,
-0.429083, -0.8027267, -1.347929, 0.007843138, 1, 0, 1,
-0.4254407, -2.150257, -3.290761, 0.003921569, 1, 0, 1,
-0.4249339, 0.06390005, -1.07606, 0, 1, 0.003921569, 1,
-0.4224071, -0.2556035, -2.490215, 0, 1, 0.01176471, 1,
-0.4206867, 0.4796658, -1.776698, 0, 1, 0.01568628, 1,
-0.4102262, -0.78518, -2.77202, 0, 1, 0.02352941, 1,
-0.4097991, -0.2864947, -1.345023, 0, 1, 0.02745098, 1,
-0.4002175, 1.077276, 0.9264284, 0, 1, 0.03529412, 1,
-0.3995754, 1.593967, -0.1822079, 0, 1, 0.03921569, 1,
-0.3972313, -1.398725, -1.929106, 0, 1, 0.04705882, 1,
-0.3914991, 1.66258, 1.03476, 0, 1, 0.05098039, 1,
-0.3869421, -0.6752972, -0.5587844, 0, 1, 0.05882353, 1,
-0.3808816, 0.3360938, 1.013448, 0, 1, 0.0627451, 1,
-0.3782598, 0.3769926, -1.177441, 0, 1, 0.07058824, 1,
-0.3776812, -0.9640545, -1.276775, 0, 1, 0.07450981, 1,
-0.3731742, 2.126641, -0.7725995, 0, 1, 0.08235294, 1,
-0.3695232, 0.9212998, -0.5724651, 0, 1, 0.08627451, 1,
-0.3691756, 1.408265, 1.182334, 0, 1, 0.09411765, 1,
-0.36817, -1.296794, -3.440852, 0, 1, 0.1019608, 1,
-0.3674497, 0.8038501, -0.3119166, 0, 1, 0.1058824, 1,
-0.3636234, 1.2299, 0.3592663, 0, 1, 0.1137255, 1,
-0.3613413, 0.3074188, -0.5310073, 0, 1, 0.1176471, 1,
-0.350938, -0.04234959, -2.822016, 0, 1, 0.1254902, 1,
-0.3504404, 0.3145381, -0.6807982, 0, 1, 0.1294118, 1,
-0.3503368, -0.4192952, -3.718338, 0, 1, 0.1372549, 1,
-0.3462926, -0.3418221, -1.551441, 0, 1, 0.1411765, 1,
-0.3404943, 0.524607, -0.2298227, 0, 1, 0.1490196, 1,
-0.3404569, 0.4420764, -1.132094, 0, 1, 0.1529412, 1,
-0.3381603, -0.4888585, -2.650369, 0, 1, 0.1607843, 1,
-0.3378724, 0.9881651, 1.15532, 0, 1, 0.1647059, 1,
-0.3369778, -2.672657, -2.942279, 0, 1, 0.172549, 1,
-0.3358302, 2.676487, -1.161188, 0, 1, 0.1764706, 1,
-0.3338317, -0.6352856, -2.812549, 0, 1, 0.1843137, 1,
-0.3302383, -0.09741893, -0.9784468, 0, 1, 0.1882353, 1,
-0.3298495, -1.132781, -1.405195, 0, 1, 0.1960784, 1,
-0.3266661, 1.312647, -0.8343205, 0, 1, 0.2039216, 1,
-0.3249446, -0.7487911, -2.552584, 0, 1, 0.2078431, 1,
-0.3247514, -0.03148435, -1.722126, 0, 1, 0.2156863, 1,
-0.3196482, 0.3369472, -1.136148, 0, 1, 0.2196078, 1,
-0.3178992, -0.3688958, -1.89373, 0, 1, 0.227451, 1,
-0.3169658, 0.4853867, -1.692902, 0, 1, 0.2313726, 1,
-0.3019794, 0.2598816, 1.063285, 0, 1, 0.2392157, 1,
-0.3015659, -0.2275559, -2.509767, 0, 1, 0.2431373, 1,
-0.3010558, 0.4601943, -0.4191814, 0, 1, 0.2509804, 1,
-0.2987511, 0.5884377, 0.5187154, 0, 1, 0.254902, 1,
-0.2952443, -0.2859988, -3.042783, 0, 1, 0.2627451, 1,
-0.2852982, -0.5916162, -2.591004, 0, 1, 0.2666667, 1,
-0.2831728, -2.511334, -1.318385, 0, 1, 0.2745098, 1,
-0.2814059, -0.4494283, -1.903181, 0, 1, 0.2784314, 1,
-0.2803048, 1.252121, -0.418663, 0, 1, 0.2862745, 1,
-0.2789529, 0.64798, 0.7210811, 0, 1, 0.2901961, 1,
-0.2737291, -0.6956431, -3.118448, 0, 1, 0.2980392, 1,
-0.2721757, -1.650494, -3.020407, 0, 1, 0.3058824, 1,
-0.2693583, 0.4210964, -2.500134, 0, 1, 0.3098039, 1,
-0.265981, -1.074492, -2.982871, 0, 1, 0.3176471, 1,
-0.2633733, -0.05307866, -0.727457, 0, 1, 0.3215686, 1,
-0.2627057, -1.07114, -2.7012, 0, 1, 0.3294118, 1,
-0.2598533, -0.5842269, -1.820441, 0, 1, 0.3333333, 1,
-0.2576818, -0.2141589, -1.272652, 0, 1, 0.3411765, 1,
-0.2509952, -1.393241, -1.82181, 0, 1, 0.345098, 1,
-0.2472545, -0.2503098, -2.03633, 0, 1, 0.3529412, 1,
-0.2463168, -0.1105776, -1.145264, 0, 1, 0.3568628, 1,
-0.2426731, -0.4582616, -2.823255, 0, 1, 0.3647059, 1,
-0.2407004, 1.374077, -1.526096, 0, 1, 0.3686275, 1,
-0.2398277, -1.493377, -1.431796, 0, 1, 0.3764706, 1,
-0.2394305, 2.650567, -1.091946, 0, 1, 0.3803922, 1,
-0.2393028, -0.2733055, -1.038345, 0, 1, 0.3882353, 1,
-0.2343703, -0.2872763, -2.896532, 0, 1, 0.3921569, 1,
-0.2336924, -0.4827008, -3.299304, 0, 1, 0.4, 1,
-0.2326338, -0.3608999, -2.143201, 0, 1, 0.4078431, 1,
-0.2283538, -0.1774701, -2.597575, 0, 1, 0.4117647, 1,
-0.2267917, -0.9758343, -1.423445, 0, 1, 0.4196078, 1,
-0.2255517, -0.3011197, -4.273345, 0, 1, 0.4235294, 1,
-0.2248921, 0.2166231, -0.8884563, 0, 1, 0.4313726, 1,
-0.222623, -1.025206, -1.163213, 0, 1, 0.4352941, 1,
-0.2069196, 0.4938183, 0.0334037, 0, 1, 0.4431373, 1,
-0.2053647, -1.586695, -2.982409, 0, 1, 0.4470588, 1,
-0.2049085, -0.6479299, -3.158056, 0, 1, 0.454902, 1,
-0.2011068, 0.5186366, 0.1801504, 0, 1, 0.4588235, 1,
-0.198432, 1.163525, 0.4721776, 0, 1, 0.4666667, 1,
-0.1984215, 0.4016879, -2.486011, 0, 1, 0.4705882, 1,
-0.1929418, -1.333017, -1.403028, 0, 1, 0.4784314, 1,
-0.1926388, 1.232072, 0.6826681, 0, 1, 0.4823529, 1,
-0.1925613, -1.013839, -3.444123, 0, 1, 0.4901961, 1,
-0.1886395, -1.075269, -0.9513687, 0, 1, 0.4941176, 1,
-0.1824393, 1.51683, 0.7578406, 0, 1, 0.5019608, 1,
-0.1795842, -0.4847731, -4.246913, 0, 1, 0.509804, 1,
-0.1783992, -0.546674, -4.102648, 0, 1, 0.5137255, 1,
-0.1781782, -0.7167824, -1.48432, 0, 1, 0.5215687, 1,
-0.1749709, 0.1884153, 1.046265, 0, 1, 0.5254902, 1,
-0.1736399, 0.06309038, -2.839611, 0, 1, 0.5333334, 1,
-0.1722364, -0.6365364, -3.379979, 0, 1, 0.5372549, 1,
-0.1602315, -0.4511945, -4.554794, 0, 1, 0.5450981, 1,
-0.1567632, 1.098717, -0.41376, 0, 1, 0.5490196, 1,
-0.1555403, 0.4529505, -0.7085102, 0, 1, 0.5568628, 1,
-0.1554143, 1.021296, -0.01169893, 0, 1, 0.5607843, 1,
-0.1545136, -0.2116513, -2.438821, 0, 1, 0.5686275, 1,
-0.1542982, -0.2864136, -2.635999, 0, 1, 0.572549, 1,
-0.151759, 0.08718055, -1.557558, 0, 1, 0.5803922, 1,
-0.1513547, -0.9793836, -2.854433, 0, 1, 0.5843138, 1,
-0.1512516, 0.1766138, 0.8123432, 0, 1, 0.5921569, 1,
-0.1465741, -1.800217, -4.478001, 0, 1, 0.5960785, 1,
-0.1445599, 0.2585873, -0.4471113, 0, 1, 0.6039216, 1,
-0.141294, -0.1869636, -3.286724, 0, 1, 0.6117647, 1,
-0.1406205, 0.6420614, 1.03101, 0, 1, 0.6156863, 1,
-0.1337936, -1.428561, -4.162724, 0, 1, 0.6235294, 1,
-0.1319571, 0.4877591, -0.04755346, 0, 1, 0.627451, 1,
-0.130436, -0.3041861, -1.936684, 0, 1, 0.6352941, 1,
-0.1249834, -1.687019, -2.419945, 0, 1, 0.6392157, 1,
-0.1244853, 1.500234, -0.0133987, 0, 1, 0.6470588, 1,
-0.1241356, 0.5310611, 0.897664, 0, 1, 0.6509804, 1,
-0.1222523, -0.8300284, -1.985183, 0, 1, 0.6588235, 1,
-0.1220008, -0.3226019, -2.053994, 0, 1, 0.6627451, 1,
-0.1192284, 0.1603431, -1.293619, 0, 1, 0.6705883, 1,
-0.1165002, 0.4365516, 0.04858863, 0, 1, 0.6745098, 1,
-0.1153104, 0.7244241, -0.2686382, 0, 1, 0.682353, 1,
-0.1138498, 0.6131093, 0.5547684, 0, 1, 0.6862745, 1,
-0.1111445, -0.812387, -3.022476, 0, 1, 0.6941177, 1,
-0.1111435, -0.4729965, -1.979211, 0, 1, 0.7019608, 1,
-0.1082552, 0.3121412, 0.5798146, 0, 1, 0.7058824, 1,
-0.1074775, -0.29301, -2.854764, 0, 1, 0.7137255, 1,
-0.1067002, 0.8539595, -0.7577848, 0, 1, 0.7176471, 1,
-0.1051164, -0.155912, -2.512197, 0, 1, 0.7254902, 1,
-0.1033059, -0.2947361, -1.985937, 0, 1, 0.7294118, 1,
-0.1027172, 0.2528091, 0.4200695, 0, 1, 0.7372549, 1,
-0.1005487, 1.043643, -1.403572, 0, 1, 0.7411765, 1,
-0.0956038, 1.209612, -1.68035, 0, 1, 0.7490196, 1,
-0.09468534, 1.253285, -1.580014, 0, 1, 0.7529412, 1,
-0.09197865, -1.409318, -4.851275, 0, 1, 0.7607843, 1,
-0.08894094, 0.7982053, -1.155049, 0, 1, 0.7647059, 1,
-0.08707334, -0.5351921, -3.87257, 0, 1, 0.772549, 1,
-0.08526954, 1.237868, 0.7048458, 0, 1, 0.7764706, 1,
-0.08292227, -0.5529045, -3.588426, 0, 1, 0.7843137, 1,
-0.08220848, 0.9174571, -0.2256166, 0, 1, 0.7882353, 1,
-0.07981916, -0.2189333, -3.158071, 0, 1, 0.7960784, 1,
-0.07812338, 1.126149, -0.1337991, 0, 1, 0.8039216, 1,
-0.07261136, 1.418013, 1.744359, 0, 1, 0.8078431, 1,
-0.07248668, -0.1240751, -4.542294, 0, 1, 0.8156863, 1,
-0.06477185, -2.125708, -4.131626, 0, 1, 0.8196079, 1,
-0.06175679, -2.281992, -3.754421, 0, 1, 0.827451, 1,
-0.05996428, 0.2142098, 0.4136784, 0, 1, 0.8313726, 1,
-0.05877977, 1.61021, 0.3562362, 0, 1, 0.8392157, 1,
-0.05689346, -2.55258, -1.543056, 0, 1, 0.8431373, 1,
-0.05188475, -0.3824749, -2.18216, 0, 1, 0.8509804, 1,
-0.05173968, -0.3232875, -2.112389, 0, 1, 0.854902, 1,
-0.04922162, -0.08103488, -0.6065682, 0, 1, 0.8627451, 1,
-0.04650681, 0.7988404, -2.001983, 0, 1, 0.8666667, 1,
-0.04458296, 0.5576067, -1.862101, 0, 1, 0.8745098, 1,
-0.04415169, 0.5253022, -0.8873867, 0, 1, 0.8784314, 1,
-0.04410597, -0.8206631, -3.928137, 0, 1, 0.8862745, 1,
-0.04391937, -1.741642, -2.297066, 0, 1, 0.8901961, 1,
-0.04246791, -0.7754699, -2.745706, 0, 1, 0.8980392, 1,
-0.04158157, 0.5396239, -0.09199846, 0, 1, 0.9058824, 1,
-0.03855956, -0.3700432, -3.32202, 0, 1, 0.9098039, 1,
-0.03588672, -1.284831, -4.293562, 0, 1, 0.9176471, 1,
-0.03279641, 1.039903, 1.251512, 0, 1, 0.9215686, 1,
-0.03082127, -0.4147997, -4.718805, 0, 1, 0.9294118, 1,
-0.02707395, 0.6596522, 1.373108, 0, 1, 0.9333333, 1,
-0.02682687, -0.6038393, -2.91077, 0, 1, 0.9411765, 1,
-0.02342521, 1.427539, -0.08275712, 0, 1, 0.945098, 1,
-0.02205153, 0.3571239, 0.3589165, 0, 1, 0.9529412, 1,
-0.02178939, -0.4705075, -3.509759, 0, 1, 0.9568627, 1,
-0.02150602, -1.204498, -3.566641, 0, 1, 0.9647059, 1,
-0.02106228, 0.4046991, -1.112107, 0, 1, 0.9686275, 1,
-0.02078242, 0.1751503, 0.4951171, 0, 1, 0.9764706, 1,
-0.02003029, 0.3558496, 0.2783621, 0, 1, 0.9803922, 1,
-0.01960359, -0.4819116, -2.483377, 0, 1, 0.9882353, 1,
-0.01828895, 0.1116932, -0.3425135, 0, 1, 0.9921569, 1,
-0.01741737, 0.5710485, 0.09103771, 0, 1, 1, 1,
-0.01363247, -0.8842329, -3.620396, 0, 0.9921569, 1, 1,
-0.01193125, -0.1484827, -2.1929, 0, 0.9882353, 1, 1,
-0.00372125, 1.053831, -0.5543517, 0, 0.9803922, 1, 1,
-0.003596354, 0.1186265, 1.423302, 0, 0.9764706, 1, 1,
-0.003561819, 0.3007861, 0.6820283, 0, 0.9686275, 1, 1,
0.00514292, -0.7431842, 3.608143, 0, 0.9647059, 1, 1,
0.006404187, -0.4993678, 3.288785, 0, 0.9568627, 1, 1,
0.007044387, -0.6315035, 3.891545, 0, 0.9529412, 1, 1,
0.01130438, 1.60218, 0.5127283, 0, 0.945098, 1, 1,
0.01135023, 0.3042273, -0.5898366, 0, 0.9411765, 1, 1,
0.01376935, 1.456345, -0.5492392, 0, 0.9333333, 1, 1,
0.01471424, -0.7711994, 2.360989, 0, 0.9294118, 1, 1,
0.01515504, -0.08859235, 2.585938, 0, 0.9215686, 1, 1,
0.01628756, 0.1882392, 0.6082126, 0, 0.9176471, 1, 1,
0.01748051, -1.191975, 2.296927, 0, 0.9098039, 1, 1,
0.01930905, -0.1568727, 2.303429, 0, 0.9058824, 1, 1,
0.02048221, -0.214376, 2.641067, 0, 0.8980392, 1, 1,
0.02104156, -0.3359315, 2.449966, 0, 0.8901961, 1, 1,
0.02116981, -0.9865118, 1.926507, 0, 0.8862745, 1, 1,
0.0216337, 0.3970702, 0.1569495, 0, 0.8784314, 1, 1,
0.02411839, -0.2680176, 3.101151, 0, 0.8745098, 1, 1,
0.02543509, 0.186664, -0.04816428, 0, 0.8666667, 1, 1,
0.02729291, 0.8732951, 0.6321672, 0, 0.8627451, 1, 1,
0.02793371, -0.06839845, 2.070745, 0, 0.854902, 1, 1,
0.02923439, 0.8934982, -0.7406175, 0, 0.8509804, 1, 1,
0.03375783, 0.3348343, -0.219906, 0, 0.8431373, 1, 1,
0.03379226, -0.2034557, 2.520282, 0, 0.8392157, 1, 1,
0.03857776, -0.8123161, 4.83167, 0, 0.8313726, 1, 1,
0.04321566, 0.4433451, 0.021788, 0, 0.827451, 1, 1,
0.04565195, -0.3329447, 4.63132, 0, 0.8196079, 1, 1,
0.05226318, 1.651143, -0.7586018, 0, 0.8156863, 1, 1,
0.05241465, 0.309282, -0.02931448, 0, 0.8078431, 1, 1,
0.05244783, 1.803725, -0.08039843, 0, 0.8039216, 1, 1,
0.05316658, -0.131912, 2.318568, 0, 0.7960784, 1, 1,
0.05413474, 0.4237025, 0.1797232, 0, 0.7882353, 1, 1,
0.05522864, -1.50878, 3.086678, 0, 0.7843137, 1, 1,
0.05573184, -0.5277961, 4.873037, 0, 0.7764706, 1, 1,
0.05611664, 0.8686229, -1.495898, 0, 0.772549, 1, 1,
0.05973866, -0.3764059, 3.966078, 0, 0.7647059, 1, 1,
0.06338187, -2.046829, 2.573084, 0, 0.7607843, 1, 1,
0.07037869, -0.6270732, 2.046365, 0, 0.7529412, 1, 1,
0.07427584, -0.8710775, 2.059041, 0, 0.7490196, 1, 1,
0.07497235, 0.6784567, -0.1581876, 0, 0.7411765, 1, 1,
0.07571249, 1.114086, -0.7395675, 0, 0.7372549, 1, 1,
0.07647084, -1.360072, 3.100081, 0, 0.7294118, 1, 1,
0.07789034, 0.2632236, -0.9372925, 0, 0.7254902, 1, 1,
0.07909086, 0.1529555, 0.7326984, 0, 0.7176471, 1, 1,
0.08550379, -2.07316, 2.460988, 0, 0.7137255, 1, 1,
0.08917218, -2.925414, 3.061436, 0, 0.7058824, 1, 1,
0.09111039, -0.09323628, 5.857317, 0, 0.6980392, 1, 1,
0.09154921, -1.298283, 3.479616, 0, 0.6941177, 1, 1,
0.09204257, 0.2974089, 0.6429252, 0, 0.6862745, 1, 1,
0.09435381, -0.4320818, 1.823609, 0, 0.682353, 1, 1,
0.09475802, -0.1763065, 1.620064, 0, 0.6745098, 1, 1,
0.09514976, -0.7832556, 2.721323, 0, 0.6705883, 1, 1,
0.09543925, -0.5715778, 1.665709, 0, 0.6627451, 1, 1,
0.09635378, -0.9296246, 3.556203, 0, 0.6588235, 1, 1,
0.1013051, -1.222576, 1.718081, 0, 0.6509804, 1, 1,
0.1027208, -0.1523989, 4.057186, 0, 0.6470588, 1, 1,
0.1030367, 1.272178, 0.1848776, 0, 0.6392157, 1, 1,
0.1034687, -1.080703, 3.393247, 0, 0.6352941, 1, 1,
0.1073393, -0.7022577, 3.965027, 0, 0.627451, 1, 1,
0.1093725, 1.180144, 1.026295, 0, 0.6235294, 1, 1,
0.1100589, 0.6102318, 0.1910218, 0, 0.6156863, 1, 1,
0.1226499, -0.3967519, 4.693093, 0, 0.6117647, 1, 1,
0.1226625, -0.4699833, 2.395843, 0, 0.6039216, 1, 1,
0.1228408, 0.630734, 1.986861, 0, 0.5960785, 1, 1,
0.1269997, 1.340489, 2.286755, 0, 0.5921569, 1, 1,
0.1285665, 0.4510783, 0.7883945, 0, 0.5843138, 1, 1,
0.1322502, 0.776257, 2.078993, 0, 0.5803922, 1, 1,
0.1323099, 0.6996261, -1.337052, 0, 0.572549, 1, 1,
0.1338554, 0.2980303, -0.7316729, 0, 0.5686275, 1, 1,
0.1363006, 0.5282634, 0.7634472, 0, 0.5607843, 1, 1,
0.1368166, -1.053384, 3.85708, 0, 0.5568628, 1, 1,
0.1369243, -0.1512446, 2.00536, 0, 0.5490196, 1, 1,
0.1381032, 1.019108, 0.004151555, 0, 0.5450981, 1, 1,
0.1405306, -0.5607315, 3.040329, 0, 0.5372549, 1, 1,
0.1419085, 0.1822188, 0.2326525, 0, 0.5333334, 1, 1,
0.1441021, 0.7203806, 1.153563, 0, 0.5254902, 1, 1,
0.1509449, -1.763365, 1.983626, 0, 0.5215687, 1, 1,
0.1516099, -0.5864294, 3.677047, 0, 0.5137255, 1, 1,
0.1519723, 0.5149463, -0.462931, 0, 0.509804, 1, 1,
0.1547757, -1.417437, 4.539675, 0, 0.5019608, 1, 1,
0.1561073, 0.02861871, 1.591506, 0, 0.4941176, 1, 1,
0.1588526, -1.078881, 2.814616, 0, 0.4901961, 1, 1,
0.1612395, -2.198695, 2.574534, 0, 0.4823529, 1, 1,
0.1637547, 0.2169885, -0.02776903, 0, 0.4784314, 1, 1,
0.1655379, -1.969842, 2.327387, 0, 0.4705882, 1, 1,
0.1661073, 0.6688245, 0.07338306, 0, 0.4666667, 1, 1,
0.1699311, 1.176996, 0.6823161, 0, 0.4588235, 1, 1,
0.1750025, -0.1582021, 2.607866, 0, 0.454902, 1, 1,
0.1793756, -0.1147053, 0.7198656, 0, 0.4470588, 1, 1,
0.1843267, -0.9688585, 4.435922, 0, 0.4431373, 1, 1,
0.1871159, 0.9406531, -0.9701128, 0, 0.4352941, 1, 1,
0.1886636, 0.3268002, 0.3789246, 0, 0.4313726, 1, 1,
0.1909542, 0.5367268, -0.5142299, 0, 0.4235294, 1, 1,
0.1945056, 0.5097179, 0.5822626, 0, 0.4196078, 1, 1,
0.2011043, 1.229623, 0.7749304, 0, 0.4117647, 1, 1,
0.2040021, -0.3091055, 2.150507, 0, 0.4078431, 1, 1,
0.2063245, -0.1252869, 2.537101, 0, 0.4, 1, 1,
0.2065336, -0.7306939, 2.262716, 0, 0.3921569, 1, 1,
0.2073042, 0.2074236, 2.191225, 0, 0.3882353, 1, 1,
0.2115657, -1.468351, 3.929713, 0, 0.3803922, 1, 1,
0.2132767, 0.73548, 0.7063484, 0, 0.3764706, 1, 1,
0.2171838, -0.8546419, 1.376864, 0, 0.3686275, 1, 1,
0.2220679, -0.3460244, 2.099211, 0, 0.3647059, 1, 1,
0.2237303, -1.498921, 4.224636, 0, 0.3568628, 1, 1,
0.2277672, -1.357927, 2.592638, 0, 0.3529412, 1, 1,
0.2278234, 0.04378476, 0.5891986, 0, 0.345098, 1, 1,
0.2279463, -2.06116, 3.478212, 0, 0.3411765, 1, 1,
0.228983, 1.322101, 0.5586037, 0, 0.3333333, 1, 1,
0.2314993, 0.6944376, 0.1060471, 0, 0.3294118, 1, 1,
0.2344937, 0.8297921, 0.1328348, 0, 0.3215686, 1, 1,
0.2355424, -0.7114803, 4.988711, 0, 0.3176471, 1, 1,
0.2403411, 0.1044977, 0.8494571, 0, 0.3098039, 1, 1,
0.2428077, 0.8400424, -0.7867579, 0, 0.3058824, 1, 1,
0.2538508, 0.3031229, -0.111026, 0, 0.2980392, 1, 1,
0.2593545, 0.3392923, 0.3748921, 0, 0.2901961, 1, 1,
0.2711024, -0.544235, 3.868224, 0, 0.2862745, 1, 1,
0.2727318, -0.53473, 1.411568, 0, 0.2784314, 1, 1,
0.2754715, 1.040991, -0.8860351, 0, 0.2745098, 1, 1,
0.2779519, -0.1559921, 2.620563, 0, 0.2666667, 1, 1,
0.2794514, 1.499185, 1.61697, 0, 0.2627451, 1, 1,
0.2881811, -0.8490865, 3.786413, 0, 0.254902, 1, 1,
0.2932333, -0.2676974, 0.7524028, 0, 0.2509804, 1, 1,
0.2962124, 0.2620231, 1.508763, 0, 0.2431373, 1, 1,
0.2987896, 1.434783, 0.8995252, 0, 0.2392157, 1, 1,
0.3053824, 1.426566, 1.986134, 0, 0.2313726, 1, 1,
0.3057835, 1.117914, -0.2649526, 0, 0.227451, 1, 1,
0.3118796, 0.2452121, 2.869617, 0, 0.2196078, 1, 1,
0.314997, 1.161676, 0.9586987, 0, 0.2156863, 1, 1,
0.3185434, -0.770098, 4.19672, 0, 0.2078431, 1, 1,
0.3293857, 0.9742247, 0.5176237, 0, 0.2039216, 1, 1,
0.3328782, -0.5930592, 1.231117, 0, 0.1960784, 1, 1,
0.3341583, 1.500559, 1.085724, 0, 0.1882353, 1, 1,
0.3395259, 0.8695571, -1.92069, 0, 0.1843137, 1, 1,
0.3436315, 0.134628, 2.297179, 0, 0.1764706, 1, 1,
0.3489287, -0.6381466, 3.603997, 0, 0.172549, 1, 1,
0.3496611, -2.057222, 3.226908, 0, 0.1647059, 1, 1,
0.3522722, 0.2468956, -0.0335694, 0, 0.1607843, 1, 1,
0.3560529, 0.3989565, -0.5122409, 0, 0.1529412, 1, 1,
0.3566871, 1.126889, -0.45478, 0, 0.1490196, 1, 1,
0.3652503, 0.2920201, 1.694586, 0, 0.1411765, 1, 1,
0.3691457, -0.864141, 2.495362, 0, 0.1372549, 1, 1,
0.3739778, 0.6589899, -0.4953383, 0, 0.1294118, 1, 1,
0.3901171, 0.6907555, -0.5104027, 0, 0.1254902, 1, 1,
0.3908433, 0.7125439, 0.2692927, 0, 0.1176471, 1, 1,
0.3913468, 0.5666057, 2.046127, 0, 0.1137255, 1, 1,
0.3999521, 0.09450601, 2.854958, 0, 0.1058824, 1, 1,
0.4023705, -0.03594803, 0.6813005, 0, 0.09803922, 1, 1,
0.4024599, 0.9525033, -1.308479, 0, 0.09411765, 1, 1,
0.4140268, -1.120677, 2.230869, 0, 0.08627451, 1, 1,
0.4249421, -0.02125777, 0.8665457, 0, 0.08235294, 1, 1,
0.425532, 0.7298749, 2.269194, 0, 0.07450981, 1, 1,
0.4307945, -0.1717384, 2.259261, 0, 0.07058824, 1, 1,
0.4309272, 0.05322511, 1.800489, 0, 0.0627451, 1, 1,
0.4314574, 0.1783162, 0.1964406, 0, 0.05882353, 1, 1,
0.4328488, 0.7759542, 0.2833775, 0, 0.05098039, 1, 1,
0.433549, -0.6439693, 2.074129, 0, 0.04705882, 1, 1,
0.4338795, -0.5208562, 2.73839, 0, 0.03921569, 1, 1,
0.4340111, 0.7753194, 1.104243, 0, 0.03529412, 1, 1,
0.4343222, 0.3400818, 0.58842, 0, 0.02745098, 1, 1,
0.4393542, -1.095627, 4.291194, 0, 0.02352941, 1, 1,
0.4394141, 0.4237415, -0.7128623, 0, 0.01568628, 1, 1,
0.4399096, 1.870312, 0.9594226, 0, 0.01176471, 1, 1,
0.4408627, -0.3981078, 2.888982, 0, 0.003921569, 1, 1,
0.4471885, -0.03944189, 0.08600068, 0.003921569, 0, 1, 1,
0.4486662, 0.5733855, 1.771049, 0.007843138, 0, 1, 1,
0.4488882, -0.72928, 2.832726, 0.01568628, 0, 1, 1,
0.4494325, 0.7572672, 0.7975845, 0.01960784, 0, 1, 1,
0.4498173, 0.8118751, -0.7571834, 0.02745098, 0, 1, 1,
0.4594216, -0.9626325, 3.828774, 0.03137255, 0, 1, 1,
0.4630216, -0.6991785, 1.771026, 0.03921569, 0, 1, 1,
0.4635468, -1.394787, 1.829007, 0.04313726, 0, 1, 1,
0.4636732, -0.3235033, 2.639677, 0.05098039, 0, 1, 1,
0.4648636, 1.33737, 1.50931, 0.05490196, 0, 1, 1,
0.4694021, -0.2499555, 2.175822, 0.0627451, 0, 1, 1,
0.4703653, -0.03526348, 3.837844, 0.06666667, 0, 1, 1,
0.4738202, -0.1058005, 1.272858, 0.07450981, 0, 1, 1,
0.476099, -1.546117, 1.955766, 0.07843138, 0, 1, 1,
0.4763863, 0.5657711, -0.1351449, 0.08627451, 0, 1, 1,
0.4779292, 2.070989, -2.169429, 0.09019608, 0, 1, 1,
0.4815327, -0.6175715, 4.008584, 0.09803922, 0, 1, 1,
0.486813, -0.2442096, 3.283658, 0.1058824, 0, 1, 1,
0.4884352, 2.491604, -2.005828, 0.1098039, 0, 1, 1,
0.497309, 0.1481558, 2.004297, 0.1176471, 0, 1, 1,
0.5117264, 0.04625505, 3.224386, 0.1215686, 0, 1, 1,
0.5123134, 0.01328209, 1.842191, 0.1294118, 0, 1, 1,
0.513571, 1.49202, 2.158727, 0.1333333, 0, 1, 1,
0.5152287, -1.781189, 4.607962, 0.1411765, 0, 1, 1,
0.5189275, -0.1209525, 1.561176, 0.145098, 0, 1, 1,
0.5214165, 0.444863, 1.773381, 0.1529412, 0, 1, 1,
0.5259687, 0.3922215, 0.8121988, 0.1568628, 0, 1, 1,
0.5266181, 1.688309, -0.3687737, 0.1647059, 0, 1, 1,
0.527114, -1.042212, 1.812054, 0.1686275, 0, 1, 1,
0.5281326, -0.483533, 1.963485, 0.1764706, 0, 1, 1,
0.52896, 0.01543637, -0.006400743, 0.1803922, 0, 1, 1,
0.5322124, 0.06543779, -0.6183931, 0.1882353, 0, 1, 1,
0.5335162, 0.2053124, 1.319834, 0.1921569, 0, 1, 1,
0.5383657, -0.2854385, 1.478213, 0.2, 0, 1, 1,
0.5391462, 1.300338, 0.3289634, 0.2078431, 0, 1, 1,
0.5395301, 0.225617, 0.26102, 0.2117647, 0, 1, 1,
0.5454445, -0.5257366, 2.283974, 0.2196078, 0, 1, 1,
0.5460265, -0.3531479, 1.12638, 0.2235294, 0, 1, 1,
0.5474282, 0.1850756, 1.525116, 0.2313726, 0, 1, 1,
0.5508652, -1.282192, 4.669467, 0.2352941, 0, 1, 1,
0.5520796, 0.7674254, 0.9091821, 0.2431373, 0, 1, 1,
0.5562797, -0.05036014, 2.814317, 0.2470588, 0, 1, 1,
0.559531, -0.1392086, 1.728481, 0.254902, 0, 1, 1,
0.5615292, -1.035196, 1.597712, 0.2588235, 0, 1, 1,
0.5761682, 0.02155239, 2.814375, 0.2666667, 0, 1, 1,
0.5807368, -2.033866, 4.128146, 0.2705882, 0, 1, 1,
0.590847, 1.061932, 0.2196423, 0.2784314, 0, 1, 1,
0.5916083, -0.7799736, 1.070433, 0.282353, 0, 1, 1,
0.5978369, 0.4795714, 0.9888155, 0.2901961, 0, 1, 1,
0.6051388, -1.315443, 3.735303, 0.2941177, 0, 1, 1,
0.6069263, -1.012483, 1.96501, 0.3019608, 0, 1, 1,
0.6069817, -1.211992, 2.705713, 0.3098039, 0, 1, 1,
0.6094924, 0.6479875, 0.6990634, 0.3137255, 0, 1, 1,
0.6099342, 0.07286945, 2.38186, 0.3215686, 0, 1, 1,
0.6120952, 0.4375774, 0.2987039, 0.3254902, 0, 1, 1,
0.6121864, 0.1065073, 2.461897, 0.3333333, 0, 1, 1,
0.6137183, -0.6156329, -0.5728709, 0.3372549, 0, 1, 1,
0.6140101, 0.04271498, 1.654259, 0.345098, 0, 1, 1,
0.6149588, -1.020212, 1.520295, 0.3490196, 0, 1, 1,
0.6201783, 0.3565026, 0.07712182, 0.3568628, 0, 1, 1,
0.622499, -0.1959812, 3.947743, 0.3607843, 0, 1, 1,
0.6247986, -0.3365435, 2.021085, 0.3686275, 0, 1, 1,
0.6252664, -0.5339484, 2.770324, 0.372549, 0, 1, 1,
0.6266142, -0.2468767, 2.316978, 0.3803922, 0, 1, 1,
0.633855, 0.7744488, 2.334822, 0.3843137, 0, 1, 1,
0.6345392, 0.5872604, 0.8049805, 0.3921569, 0, 1, 1,
0.6385599, -0.9498428, 1.892724, 0.3960784, 0, 1, 1,
0.6409042, -0.9579952, 3.216387, 0.4039216, 0, 1, 1,
0.643728, 1.389389, 1.373341, 0.4117647, 0, 1, 1,
0.6452811, -0.472174, 1.582483, 0.4156863, 0, 1, 1,
0.6453118, 0.6295859, 1.399029, 0.4235294, 0, 1, 1,
0.6457813, -0.7179725, -0.4001794, 0.427451, 0, 1, 1,
0.6459277, -0.6734999, 2.60653, 0.4352941, 0, 1, 1,
0.648658, -0.133045, 1.389509, 0.4392157, 0, 1, 1,
0.6516321, 0.6192757, 2.606225, 0.4470588, 0, 1, 1,
0.654335, 0.4429941, 1.027191, 0.4509804, 0, 1, 1,
0.6596901, -0.9765316, 2.374231, 0.4588235, 0, 1, 1,
0.6598651, 0.3557333, 0.7166116, 0.4627451, 0, 1, 1,
0.6724982, 0.2919221, -0.3341826, 0.4705882, 0, 1, 1,
0.676012, -1.200648, 2.551653, 0.4745098, 0, 1, 1,
0.6814736, 0.3399485, -0.7769177, 0.4823529, 0, 1, 1,
0.6825949, -0.5302106, 3.229095, 0.4862745, 0, 1, 1,
0.6833061, 0.5834932, 0.7122094, 0.4941176, 0, 1, 1,
0.688792, 0.8079264, -0.2910525, 0.5019608, 0, 1, 1,
0.6903626, 2.132238, 2.394126, 0.5058824, 0, 1, 1,
0.6922382, 0.09471459, 1.682417, 0.5137255, 0, 1, 1,
0.6934944, 0.6434829, -0.3341681, 0.5176471, 0, 1, 1,
0.7021762, 0.9433974, 1.415802, 0.5254902, 0, 1, 1,
0.7097527, 1.836103, 0.404279, 0.5294118, 0, 1, 1,
0.7122004, -0.3937368, 2.197675, 0.5372549, 0, 1, 1,
0.7138893, 1.182105, 1.749961, 0.5411765, 0, 1, 1,
0.7152496, -1.265021, 2.629744, 0.5490196, 0, 1, 1,
0.7178618, 1.040565, 0.6336606, 0.5529412, 0, 1, 1,
0.7187401, -1.189712, 3.421821, 0.5607843, 0, 1, 1,
0.7243598, 0.6141645, 0.9406936, 0.5647059, 0, 1, 1,
0.7264847, -2.45434, 3.049144, 0.572549, 0, 1, 1,
0.7268549, 0.4178357, 0.8990896, 0.5764706, 0, 1, 1,
0.7284328, 2.563685, 1.172448, 0.5843138, 0, 1, 1,
0.7294022, 1.279794, 0.1600282, 0.5882353, 0, 1, 1,
0.7331608, -1.717947, 1.824573, 0.5960785, 0, 1, 1,
0.7334645, -0.1372793, 0.9145071, 0.6039216, 0, 1, 1,
0.736476, -0.4770951, 0.4125029, 0.6078432, 0, 1, 1,
0.7367396, 0.2577952, 0.7501529, 0.6156863, 0, 1, 1,
0.7410415, -0.6081324, 2.369685, 0.6196079, 0, 1, 1,
0.7426044, 1.211654, -1.587693, 0.627451, 0, 1, 1,
0.7455012, 0.7243142, -0.5786153, 0.6313726, 0, 1, 1,
0.7475904, -1.419594, 3.258093, 0.6392157, 0, 1, 1,
0.7483837, -0.6615982, 3.209519, 0.6431373, 0, 1, 1,
0.7495129, -0.4856685, 4.104706, 0.6509804, 0, 1, 1,
0.7530756, -0.4678715, 2.072057, 0.654902, 0, 1, 1,
0.7581791, -1.253197, 2.267931, 0.6627451, 0, 1, 1,
0.7585034, -0.4632371, 3.252186, 0.6666667, 0, 1, 1,
0.7628147, -0.5141872, 2.073359, 0.6745098, 0, 1, 1,
0.7636655, -0.7675028, 1.660045, 0.6784314, 0, 1, 1,
0.7637965, -0.1543072, 1.133965, 0.6862745, 0, 1, 1,
0.7655838, 0.0373983, 2.162492, 0.6901961, 0, 1, 1,
0.7704402, 0.4888507, 1.593214, 0.6980392, 0, 1, 1,
0.7708176, -0.2775648, 1.788743, 0.7058824, 0, 1, 1,
0.7742439, -0.8052219, 2.340831, 0.7098039, 0, 1, 1,
0.7800593, -0.6813409, 2.186997, 0.7176471, 0, 1, 1,
0.7840732, 0.845762, 1.059523, 0.7215686, 0, 1, 1,
0.7841961, 0.318441, 1.208368, 0.7294118, 0, 1, 1,
0.7846254, -0.417612, 2.554901, 0.7333333, 0, 1, 1,
0.7860543, 1.270121, -0.3290234, 0.7411765, 0, 1, 1,
0.7866705, -0.5094038, 3.607223, 0.7450981, 0, 1, 1,
0.786816, -2.061361, 2.611957, 0.7529412, 0, 1, 1,
0.7897385, 0.1023077, 2.243414, 0.7568628, 0, 1, 1,
0.7921656, -1.251834, 4.425096, 0.7647059, 0, 1, 1,
0.7953955, 0.5341813, 2.26864, 0.7686275, 0, 1, 1,
0.7962242, -0.2378471, 2.549971, 0.7764706, 0, 1, 1,
0.8001273, -0.3993702, 0.6039484, 0.7803922, 0, 1, 1,
0.8060331, 0.3857932, 1.632777, 0.7882353, 0, 1, 1,
0.806087, -1.023989, 1.088533, 0.7921569, 0, 1, 1,
0.8063233, 1.169939, 2.826022, 0.8, 0, 1, 1,
0.8082041, -1.043702, 3.607997, 0.8078431, 0, 1, 1,
0.8100147, -2.228178, 2.238889, 0.8117647, 0, 1, 1,
0.8107378, -0.3960488, 2.347451, 0.8196079, 0, 1, 1,
0.8140286, 0.6991888, 2.046157, 0.8235294, 0, 1, 1,
0.814782, 1.735078, 0.1617033, 0.8313726, 0, 1, 1,
0.8196045, 0.8713199, 0.3238706, 0.8352941, 0, 1, 1,
0.8200638, -0.1079267, 1.225759, 0.8431373, 0, 1, 1,
0.8253876, -1.690336, 4.691548, 0.8470588, 0, 1, 1,
0.8298741, 0.04770279, 0.4561111, 0.854902, 0, 1, 1,
0.830767, 1.321782, -0.0102025, 0.8588235, 0, 1, 1,
0.8480038, -1.354508, 2.4215, 0.8666667, 0, 1, 1,
0.8490928, 0.1096264, 3.127092, 0.8705882, 0, 1, 1,
0.8501961, 0.5076311, 0.7082253, 0.8784314, 0, 1, 1,
0.8511201, -0.2335111, 2.088845, 0.8823529, 0, 1, 1,
0.8518738, -0.2262225, 1.810574, 0.8901961, 0, 1, 1,
0.8550653, 0.2712119, -0.2900665, 0.8941177, 0, 1, 1,
0.857375, 0.5732888, 1.913962, 0.9019608, 0, 1, 1,
0.8666432, -0.423849, -0.220083, 0.9098039, 0, 1, 1,
0.8708438, -0.1074843, 2.324809, 0.9137255, 0, 1, 1,
0.8734033, 1.921817, -1.19613, 0.9215686, 0, 1, 1,
0.8734492, 0.3166305, -0.2004045, 0.9254902, 0, 1, 1,
0.8772067, -0.1292119, 3.196487, 0.9333333, 0, 1, 1,
0.8796058, -0.7751884, 0.4165633, 0.9372549, 0, 1, 1,
0.879993, 0.3711749, 0.828971, 0.945098, 0, 1, 1,
0.8821955, 0.7286282, 1.676847, 0.9490196, 0, 1, 1,
0.8835641, 1.302206, 2.681882, 0.9568627, 0, 1, 1,
0.8858281, 0.007507387, 1.323875, 0.9607843, 0, 1, 1,
0.8937784, -0.3405984, 1.528034, 0.9686275, 0, 1, 1,
0.895704, 0.5435652, 1.472237, 0.972549, 0, 1, 1,
0.8968391, 1.147456, 0.221611, 0.9803922, 0, 1, 1,
0.8999669, -1.657011, 2.89692, 0.9843137, 0, 1, 1,
0.9155793, 1.00906, 1.92391, 0.9921569, 0, 1, 1,
0.9173759, 0.1294236, 1.066457, 0.9960784, 0, 1, 1,
0.9182029, -0.3871545, 2.729007, 1, 0, 0.9960784, 1,
0.9250537, -1.993783, 3.90164, 1, 0, 0.9882353, 1,
0.930966, -0.8336563, 1.632898, 1, 0, 0.9843137, 1,
0.9361534, 0.3786973, 0.4255978, 1, 0, 0.9764706, 1,
0.9413246, -0.8522289, 1.825103, 1, 0, 0.972549, 1,
0.9430085, 0.7172367, 1.279553, 1, 0, 0.9647059, 1,
0.9543993, 0.761403, 2.09326, 1, 0, 0.9607843, 1,
0.9597611, -0.981452, 1.431033, 1, 0, 0.9529412, 1,
0.9700986, 0.4061309, 1.092536, 1, 0, 0.9490196, 1,
0.9722909, -0.6047487, 2.350598, 1, 0, 0.9411765, 1,
0.9728101, -1.225424, 4.330613, 1, 0, 0.9372549, 1,
0.9853285, 0.7572924, 1.185714, 1, 0, 0.9294118, 1,
0.9908371, -1.518163, 2.12427, 1, 0, 0.9254902, 1,
0.9911771, -1.180451, 2.768956, 1, 0, 0.9176471, 1,
0.9936863, 0.3822661, 2.849087, 1, 0, 0.9137255, 1,
0.9940133, 0.7448424, 1.888484, 1, 0, 0.9058824, 1,
1.003158, -1.263739, 3.560398, 1, 0, 0.9019608, 1,
1.006818, -0.0999158, 2.116812, 1, 0, 0.8941177, 1,
1.006848, -0.4604397, 2.535396, 1, 0, 0.8862745, 1,
1.011264, -1.176638, 1.41022, 1, 0, 0.8823529, 1,
1.030023, 0.2019128, 2.073251, 1, 0, 0.8745098, 1,
1.038445, 0.02001111, 2.078542, 1, 0, 0.8705882, 1,
1.039626, 1.504796, -0.632777, 1, 0, 0.8627451, 1,
1.043542, -0.4326766, 1.436017, 1, 0, 0.8588235, 1,
1.044816, -0.3211535, 1.4605, 1, 0, 0.8509804, 1,
1.046109, 0.5008693, 0.6481351, 1, 0, 0.8470588, 1,
1.057063, 2.19346, 0.6374873, 1, 0, 0.8392157, 1,
1.079789, 1.216349, 1.817504, 1, 0, 0.8352941, 1,
1.082106, 1.759237, 0.8634191, 1, 0, 0.827451, 1,
1.090963, -0.4015038, 2.420615, 1, 0, 0.8235294, 1,
1.093548, -1.061782, 3.501863, 1, 0, 0.8156863, 1,
1.095649, 1.638556, -1.859922, 1, 0, 0.8117647, 1,
1.096358, -1.687643, 2.447669, 1, 0, 0.8039216, 1,
1.09996, -0.01835607, 0.9036422, 1, 0, 0.7960784, 1,
1.100939, -0.9073327, 3.607627, 1, 0, 0.7921569, 1,
1.102409, -0.4246585, 0.1787582, 1, 0, 0.7843137, 1,
1.114859, -0.8471742, 2.566254, 1, 0, 0.7803922, 1,
1.117051, -1.276106, 2.493647, 1, 0, 0.772549, 1,
1.120815, 0.5479454, 1.032151, 1, 0, 0.7686275, 1,
1.121305, -0.9416622, 1.455819, 1, 0, 0.7607843, 1,
1.12234, -0.1582517, 2.716756, 1, 0, 0.7568628, 1,
1.122907, 1.844943, 0.2240652, 1, 0, 0.7490196, 1,
1.133076, 1.185393, -0.4602785, 1, 0, 0.7450981, 1,
1.145298, -3.028765, 2.037676, 1, 0, 0.7372549, 1,
1.155295, -1.498835, 3.41901, 1, 0, 0.7333333, 1,
1.15966, -1.859796, 2.277411, 1, 0, 0.7254902, 1,
1.160154, -0.7569932, 2.421357, 1, 0, 0.7215686, 1,
1.160163, -0.8691975, 0.9227816, 1, 0, 0.7137255, 1,
1.177065, 1.382838, 1.623731, 1, 0, 0.7098039, 1,
1.183451, -1.643641, 3.442617, 1, 0, 0.7019608, 1,
1.18688, 1.71952, -0.1575518, 1, 0, 0.6941177, 1,
1.188119, 0.7598474, 2.331335, 1, 0, 0.6901961, 1,
1.192254, -0.7554839, 1.406028, 1, 0, 0.682353, 1,
1.195574, -2.670751, 3.051299, 1, 0, 0.6784314, 1,
1.199954, -0.7849323, 1.217736, 1, 0, 0.6705883, 1,
1.200425, -0.7794807, 2.548022, 1, 0, 0.6666667, 1,
1.20141, 0.8529125, -0.2269937, 1, 0, 0.6588235, 1,
1.20857, 1.166731, 0.2026919, 1, 0, 0.654902, 1,
1.209566, -0.06882153, 1.696701, 1, 0, 0.6470588, 1,
1.217062, 0.5743343, 0.1051715, 1, 0, 0.6431373, 1,
1.217081, 0.2728626, 1.018182, 1, 0, 0.6352941, 1,
1.218208, -1.384865, 1.231966, 1, 0, 0.6313726, 1,
1.219541, 1.123448, 0.4861543, 1, 0, 0.6235294, 1,
1.233481, -0.1850633, 3.589989, 1, 0, 0.6196079, 1,
1.23585, 1.970276, 1.48259, 1, 0, 0.6117647, 1,
1.241136, 0.2890737, -0.4614738, 1, 0, 0.6078432, 1,
1.253263, -2.069506, 2.807127, 1, 0, 0.6, 1,
1.260695, 1.912923, -1.557247, 1, 0, 0.5921569, 1,
1.261408, 1.666832, 0.4386334, 1, 0, 0.5882353, 1,
1.261798, 0.8047704, 1.1761, 1, 0, 0.5803922, 1,
1.261849, -0.2870986, 2.676401, 1, 0, 0.5764706, 1,
1.264361, 1.13884, 0.7699481, 1, 0, 0.5686275, 1,
1.293361, 0.2846388, 0.6298007, 1, 0, 0.5647059, 1,
1.294037, -0.5025843, 2.204861, 1, 0, 0.5568628, 1,
1.295346, -1.48937, 1.060559, 1, 0, 0.5529412, 1,
1.301952, -0.9761295, 1.150862, 1, 0, 0.5450981, 1,
1.317644, -1.392827, 2.133564, 1, 0, 0.5411765, 1,
1.356914, 0.3912369, 0.380047, 1, 0, 0.5333334, 1,
1.361131, 0.07073781, 2.187477, 1, 0, 0.5294118, 1,
1.36121, 0.1078062, 1.192573, 1, 0, 0.5215687, 1,
1.365595, 1.609307, 0.501412, 1, 0, 0.5176471, 1,
1.388002, 0.7015557, 0.9780579, 1, 0, 0.509804, 1,
1.388254, -0.4018703, 3.482082, 1, 0, 0.5058824, 1,
1.38857, -1.031051, 1.310048, 1, 0, 0.4980392, 1,
1.393662, 0.6221271, 2.073953, 1, 0, 0.4901961, 1,
1.402312, 1.931827, -0.02114531, 1, 0, 0.4862745, 1,
1.404081, 1.185393, 1.381289, 1, 0, 0.4784314, 1,
1.404693, -0.7978334, 2.32391, 1, 0, 0.4745098, 1,
1.408443, 0.5535229, 1.74391, 1, 0, 0.4666667, 1,
1.414461, 2.223674, 0.8932299, 1, 0, 0.4627451, 1,
1.417872, -0.8815498, 2.454473, 1, 0, 0.454902, 1,
1.429754, -0.2350001, 1.642786, 1, 0, 0.4509804, 1,
1.433721, -0.8313983, 4.11041, 1, 0, 0.4431373, 1,
1.434284, -1.171373, 2.202971, 1, 0, 0.4392157, 1,
1.435602, 0.5094687, 1.387128, 1, 0, 0.4313726, 1,
1.445676, 1.799513, -1.079206, 1, 0, 0.427451, 1,
1.468581, 1.318251, 1.05392, 1, 0, 0.4196078, 1,
1.474929, -0.02472663, 1.139856, 1, 0, 0.4156863, 1,
1.486035, 0.3558536, 0.9931024, 1, 0, 0.4078431, 1,
1.486328, 1.705096, 1.905155, 1, 0, 0.4039216, 1,
1.496115, -0.6307678, 2.187214, 1, 0, 0.3960784, 1,
1.526009, -0.9799185, 2.086936, 1, 0, 0.3882353, 1,
1.529199, 0.8631715, 1.087287, 1, 0, 0.3843137, 1,
1.56561, 0.5759562, 1.471964, 1, 0, 0.3764706, 1,
1.569434, 0.5934412, 1.782907, 1, 0, 0.372549, 1,
1.586292, 0.2393416, 2.381841, 1, 0, 0.3647059, 1,
1.587293, -0.1416062, 1.54639, 1, 0, 0.3607843, 1,
1.592411, -0.9449742, 1.666041, 1, 0, 0.3529412, 1,
1.602259, -0.08450346, 2.137724, 1, 0, 0.3490196, 1,
1.602398, 0.9409555, 1.462755, 1, 0, 0.3411765, 1,
1.618856, -0.5124097, 1.295565, 1, 0, 0.3372549, 1,
1.625556, -1.935725, 2.250054, 1, 0, 0.3294118, 1,
1.627809, -1.926048, 1.399732, 1, 0, 0.3254902, 1,
1.633432, -0.5891829, 1.321376, 1, 0, 0.3176471, 1,
1.64784, 0.109369, 0.7075323, 1, 0, 0.3137255, 1,
1.65933, 1.044337, 1.278847, 1, 0, 0.3058824, 1,
1.661501, -1.046985, 1.774994, 1, 0, 0.2980392, 1,
1.68264, 1.285551, -0.3233308, 1, 0, 0.2941177, 1,
1.693987, 0.5717551, -0.218499, 1, 0, 0.2862745, 1,
1.694437, -0.3657016, 1.593267, 1, 0, 0.282353, 1,
1.69662, 0.2196712, -1.904361, 1, 0, 0.2745098, 1,
1.726149, -0.570872, 0.5853541, 1, 0, 0.2705882, 1,
1.730995, -1.021489, 2.159796, 1, 0, 0.2627451, 1,
1.734846, -0.1570047, 1.526822, 1, 0, 0.2588235, 1,
1.737724, 1.172309, 1.658055, 1, 0, 0.2509804, 1,
1.741909, 0.6941197, 1.262026, 1, 0, 0.2470588, 1,
1.748494, -1.486652, 2.430402, 1, 0, 0.2392157, 1,
1.75322, 0.9570851, 0.9594639, 1, 0, 0.2352941, 1,
1.77271, 1.492291, 0.05868285, 1, 0, 0.227451, 1,
1.780317, -0.1491117, 0.821223, 1, 0, 0.2235294, 1,
1.782969, 0.1034702, 2.245152, 1, 0, 0.2156863, 1,
1.78802, -1.267825, 2.483177, 1, 0, 0.2117647, 1,
1.792652, 0.1573754, 0.5958083, 1, 0, 0.2039216, 1,
1.812544, 0.3566354, 1.295703, 1, 0, 0.1960784, 1,
1.822614, -0.2723657, 1.532284, 1, 0, 0.1921569, 1,
1.837136, -1.303832, 2.580572, 1, 0, 0.1843137, 1,
1.839362, 0.7514801, 0.7386451, 1, 0, 0.1803922, 1,
1.859069, -0.07467165, 2.74015, 1, 0, 0.172549, 1,
1.872386, -0.07734794, 1.746056, 1, 0, 0.1686275, 1,
1.884353, -0.1549922, 2.187152, 1, 0, 0.1607843, 1,
1.884582, 1.566924, -0.5858666, 1, 0, 0.1568628, 1,
1.904042, -0.169999, 1.002049, 1, 0, 0.1490196, 1,
1.906104, 0.6411949, 0.2790398, 1, 0, 0.145098, 1,
1.920414, 1.166667, 1.22111, 1, 0, 0.1372549, 1,
1.957211, -0.58666, 0.3489244, 1, 0, 0.1333333, 1,
1.96379, -0.1165895, 0.3153689, 1, 0, 0.1254902, 1,
1.965933, 0.3732522, -0.6513017, 1, 0, 0.1215686, 1,
1.990178, -0.02771854, 1.06618, 1, 0, 0.1137255, 1,
2.029659, -0.2525177, -0.05479277, 1, 0, 0.1098039, 1,
2.05025, 0.6561782, 2.69784, 1, 0, 0.1019608, 1,
2.071317, -1.273211, 2.410688, 1, 0, 0.09411765, 1,
2.091728, 1.064275, 0.4598114, 1, 0, 0.09019608, 1,
2.126399, 0.04720627, 0.988456, 1, 0, 0.08235294, 1,
2.128449, 1.018098, -0.1986246, 1, 0, 0.07843138, 1,
2.186322, 0.2931235, 3.617268, 1, 0, 0.07058824, 1,
2.194408, -0.6190454, 2.186687, 1, 0, 0.06666667, 1,
2.225735, -0.3151314, 1.766312, 1, 0, 0.05882353, 1,
2.289258, 2.793689, -0.4804144, 1, 0, 0.05490196, 1,
2.361895, -0.2967272, 2.565341, 1, 0, 0.04705882, 1,
2.415844, 0.1964903, 1.798647, 1, 0, 0.04313726, 1,
2.504992, 1.172025, 1.231167, 1, 0, 0.03529412, 1,
2.514337, -1.419335, 1.076499, 1, 0, 0.03137255, 1,
2.642508, -0.5119153, 2.60697, 1, 0, 0.02352941, 1,
2.693803, 1.294419, -0.3947758, 1, 0, 0.01960784, 1,
3.091379, -1.265521, 1.475202, 1, 0, 0.01176471, 1,
3.400278, -2.011618, 2.192709, 1, 0, 0.007843138, 1
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
0.06435251, -4.040599, -6.755448, 0, -0.5, 0.5, 0.5,
0.06435251, -4.040599, -6.755448, 1, -0.5, 0.5, 0.5,
0.06435251, -4.040599, -6.755448, 1, 1.5, 0.5, 0.5,
0.06435251, -4.040599, -6.755448, 0, 1.5, 0.5, 0.5
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
-4.402452, -0.04400647, -6.755448, 0, -0.5, 0.5, 0.5,
-4.402452, -0.04400647, -6.755448, 1, -0.5, 0.5, 0.5,
-4.402452, -0.04400647, -6.755448, 1, 1.5, 0.5, 0.5,
-4.402452, -0.04400647, -6.755448, 0, 1.5, 0.5, 0.5
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
-4.402452, -4.040599, 0.4649422, 0, -0.5, 0.5, 0.5,
-4.402452, -4.040599, 0.4649422, 1, -0.5, 0.5, 0.5,
-4.402452, -4.040599, 0.4649422, 1, 1.5, 0.5, 0.5,
-4.402452, -4.040599, 0.4649422, 0, 1.5, 0.5, 0.5
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
-3, -3.118308, -5.089204,
3, -3.118308, -5.089204,
-3, -3.118308, -5.089204,
-3, -3.272023, -5.366911,
-2, -3.118308, -5.089204,
-2, -3.272023, -5.366911,
-1, -3.118308, -5.089204,
-1, -3.272023, -5.366911,
0, -3.118308, -5.089204,
0, -3.272023, -5.366911,
1, -3.118308, -5.089204,
1, -3.272023, -5.366911,
2, -3.118308, -5.089204,
2, -3.272023, -5.366911,
3, -3.118308, -5.089204,
3, -3.272023, -5.366911
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
-3, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
-3, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
-3, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
-3, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
-2, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
-2, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
-2, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
-2, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
-1, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
-1, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
-1, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
-1, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
0, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
0, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
0, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
0, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
1, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
1, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
1, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
1, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
2, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
2, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
2, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
2, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5,
3, -3.579453, -5.922326, 0, -0.5, 0.5, 0.5,
3, -3.579453, -5.922326, 1, -0.5, 0.5, 0.5,
3, -3.579453, -5.922326, 1, 1.5, 0.5, 0.5,
3, -3.579453, -5.922326, 0, 1.5, 0.5, 0.5
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
-3.371651, -3, -5.089204,
-3.371651, 2, -5.089204,
-3.371651, -3, -5.089204,
-3.543451, -3, -5.366911,
-3.371651, -2, -5.089204,
-3.543451, -2, -5.366911,
-3.371651, -1, -5.089204,
-3.543451, -1, -5.366911,
-3.371651, 0, -5.089204,
-3.543451, 0, -5.366911,
-3.371651, 1, -5.089204,
-3.543451, 1, -5.366911,
-3.371651, 2, -5.089204,
-3.543451, 2, -5.366911
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
-3.887051, -3, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, -3, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, -3, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, -3, -5.922326, 0, 1.5, 0.5, 0.5,
-3.887051, -2, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, -2, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, -2, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, -2, -5.922326, 0, 1.5, 0.5, 0.5,
-3.887051, -1, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, -1, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, -1, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, -1, -5.922326, 0, 1.5, 0.5, 0.5,
-3.887051, 0, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, 0, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, 0, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, 0, -5.922326, 0, 1.5, 0.5, 0.5,
-3.887051, 1, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, 1, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, 1, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, 1, -5.922326, 0, 1.5, 0.5, 0.5,
-3.887051, 2, -5.922326, 0, -0.5, 0.5, 0.5,
-3.887051, 2, -5.922326, 1, -0.5, 0.5, 0.5,
-3.887051, 2, -5.922326, 1, 1.5, 0.5, 0.5,
-3.887051, 2, -5.922326, 0, 1.5, 0.5, 0.5
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
-3.371651, -3.118308, -4,
-3.371651, -3.118308, 4,
-3.371651, -3.118308, -4,
-3.543451, -3.272023, -4,
-3.371651, -3.118308, -2,
-3.543451, -3.272023, -2,
-3.371651, -3.118308, 0,
-3.543451, -3.272023, 0,
-3.371651, -3.118308, 2,
-3.543451, -3.272023, 2,
-3.371651, -3.118308, 4,
-3.543451, -3.272023, 4
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
-3.887051, -3.579453, -4, 0, -0.5, 0.5, 0.5,
-3.887051, -3.579453, -4, 1, -0.5, 0.5, 0.5,
-3.887051, -3.579453, -4, 1, 1.5, 0.5, 0.5,
-3.887051, -3.579453, -4, 0, 1.5, 0.5, 0.5,
-3.887051, -3.579453, -2, 0, -0.5, 0.5, 0.5,
-3.887051, -3.579453, -2, 1, -0.5, 0.5, 0.5,
-3.887051, -3.579453, -2, 1, 1.5, 0.5, 0.5,
-3.887051, -3.579453, -2, 0, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 0, 0, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 0, 1, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 0, 1, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 0, 0, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 2, 0, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 2, 1, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 2, 1, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 2, 0, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 4, 0, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 4, 1, -0.5, 0.5, 0.5,
-3.887051, -3.579453, 4, 1, 1.5, 0.5, 0.5,
-3.887051, -3.579453, 4, 0, 1.5, 0.5, 0.5
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
-3.371651, -3.118308, -5.089204,
-3.371651, 3.030295, -5.089204,
-3.371651, -3.118308, 6.019089,
-3.371651, 3.030295, 6.019089,
-3.371651, -3.118308, -5.089204,
-3.371651, -3.118308, 6.019089,
-3.371651, 3.030295, -5.089204,
-3.371651, 3.030295, 6.019089,
-3.371651, -3.118308, -5.089204,
3.500356, -3.118308, -5.089204,
-3.371651, -3.118308, 6.019089,
3.500356, -3.118308, 6.019089,
-3.371651, 3.030295, -5.089204,
3.500356, 3.030295, -5.089204,
-3.371651, 3.030295, 6.019089,
3.500356, 3.030295, 6.019089,
3.500356, -3.118308, -5.089204,
3.500356, 3.030295, -5.089204,
3.500356, -3.118308, 6.019089,
3.500356, 3.030295, 6.019089,
3.500356, -3.118308, -5.089204,
3.500356, -3.118308, 6.019089,
3.500356, 3.030295, -5.089204,
3.500356, 3.030295, 6.019089
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
var radius = 7.709022;
var distance = 34.29831;
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
mvMatrix.translate( -0.06435251, 0.04400647, -0.4649422 );
mvMatrix.scale( 1.212913, 1.355616, 0.7503535 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.29831);
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


