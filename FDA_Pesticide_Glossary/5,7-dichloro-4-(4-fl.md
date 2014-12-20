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
-3.337413, -0.4330744, -0.875454, 1, 0, 0, 1,
-2.977759, -0.07678485, -1.40673, 1, 0.007843138, 0, 1,
-2.827621, -0.1810587, -1.92861, 1, 0.01176471, 0, 1,
-2.690493, -0.5277244, -1.121738, 1, 0.01960784, 0, 1,
-2.687402, -0.4905608, -1.780295, 1, 0.02352941, 0, 1,
-2.641387, -0.7525418, 1.531569, 1, 0.03137255, 0, 1,
-2.414995, -0.4599966, -1.349194, 1, 0.03529412, 0, 1,
-2.406982, -1.032356, -3.630759, 1, 0.04313726, 0, 1,
-2.370813, -1.350271, -2.110648, 1, 0.04705882, 0, 1,
-2.362496, -0.2294854, -1.314319, 1, 0.05490196, 0, 1,
-2.348991, -0.2771381, -1.619332, 1, 0.05882353, 0, 1,
-2.340272, -0.6420016, -0.6029253, 1, 0.06666667, 0, 1,
-2.29716, 1.387574, -0.7453061, 1, 0.07058824, 0, 1,
-2.260554, -1.755817, -2.348974, 1, 0.07843138, 0, 1,
-2.146422, -0.08978982, -0.549031, 1, 0.08235294, 0, 1,
-2.106553, -0.5598619, -2.974695, 1, 0.09019608, 0, 1,
-2.104731, 0.7650607, -2.639965, 1, 0.09411765, 0, 1,
-2.093721, 0.2747401, -0.007195147, 1, 0.1019608, 0, 1,
-2.081347, -0.2520444, -1.136394, 1, 0.1098039, 0, 1,
-2.039869, 1.1567, -1.410181, 1, 0.1137255, 0, 1,
-2.002612, 0.2641479, -3.668443, 1, 0.1215686, 0, 1,
-1.989217, -3.081758, -3.650285, 1, 0.1254902, 0, 1,
-1.975529, 1.183315, -2.410065, 1, 0.1333333, 0, 1,
-1.967653, 0.1172016, -0.8564252, 1, 0.1372549, 0, 1,
-1.946745, -1.772995, -2.488903, 1, 0.145098, 0, 1,
-1.932906, 1.067296, -2.047722, 1, 0.1490196, 0, 1,
-1.932895, -0.04759756, -1.501143, 1, 0.1568628, 0, 1,
-1.929539, 0.5837573, -2.465732, 1, 0.1607843, 0, 1,
-1.928452, -0.1228483, -1.329364, 1, 0.1686275, 0, 1,
-1.910682, -0.8915309, -2.315104, 1, 0.172549, 0, 1,
-1.90314, -0.326248, -1.744209, 1, 0.1803922, 0, 1,
-1.895923, -0.5236141, -1.46415, 1, 0.1843137, 0, 1,
-1.871573, 0.7518219, -2.034225, 1, 0.1921569, 0, 1,
-1.868724, 0.4977134, -2.689716, 1, 0.1960784, 0, 1,
-1.862404, 1.012694, -0.6107198, 1, 0.2039216, 0, 1,
-1.853802, -0.3938839, -1.113979, 1, 0.2117647, 0, 1,
-1.846322, 1.095519, -0.9696322, 1, 0.2156863, 0, 1,
-1.839509, -1.811129, -3.127232, 1, 0.2235294, 0, 1,
-1.835323, -0.5701318, -1.038903, 1, 0.227451, 0, 1,
-1.81992, -0.01272657, -2.440659, 1, 0.2352941, 0, 1,
-1.805141, 1.254142, -1.004907, 1, 0.2392157, 0, 1,
-1.759509, -2.297974, -2.968646, 1, 0.2470588, 0, 1,
-1.752131, 0.4880829, -1.830281, 1, 0.2509804, 0, 1,
-1.745138, 1.203212, 0.3606054, 1, 0.2588235, 0, 1,
-1.74344, -0.4864814, -2.090131, 1, 0.2627451, 0, 1,
-1.733717, 0.1290309, -1.748961, 1, 0.2705882, 0, 1,
-1.73287, -0.0171549, -1.858706, 1, 0.2745098, 0, 1,
-1.731519, 0.5233186, -1.221761, 1, 0.282353, 0, 1,
-1.730218, -0.6569394, -1.634865, 1, 0.2862745, 0, 1,
-1.722795, 0.5324826, -3.224117, 1, 0.2941177, 0, 1,
-1.71814, 0.9631581, -1.555307, 1, 0.3019608, 0, 1,
-1.707707, 1.081262, -1.592948, 1, 0.3058824, 0, 1,
-1.70134, 0.2132149, -3.411919, 1, 0.3137255, 0, 1,
-1.697931, 0.6245291, -1.014654, 1, 0.3176471, 0, 1,
-1.697738, -1.551554, -3.270812, 1, 0.3254902, 0, 1,
-1.694784, -2.430793, -2.969722, 1, 0.3294118, 0, 1,
-1.685804, 0.13554, -1.055125, 1, 0.3372549, 0, 1,
-1.682204, -1.145001, -2.358724, 1, 0.3411765, 0, 1,
-1.672946, 0.8868275, -1.452132, 1, 0.3490196, 0, 1,
-1.646975, -1.530124, -4.980225, 1, 0.3529412, 0, 1,
-1.645047, -1.325356, -2.24871, 1, 0.3607843, 0, 1,
-1.626617, -0.3292037, -0.5928812, 1, 0.3647059, 0, 1,
-1.623885, -0.1153177, -1.140361, 1, 0.372549, 0, 1,
-1.61702, -0.5420751, -0.2367171, 1, 0.3764706, 0, 1,
-1.606028, -0.01701736, -0.5195112, 1, 0.3843137, 0, 1,
-1.589781, 0.2678605, -0.5942153, 1, 0.3882353, 0, 1,
-1.577899, -0.4827941, -0.4253585, 1, 0.3960784, 0, 1,
-1.575074, -1.390888, -3.532136, 1, 0.4039216, 0, 1,
-1.564853, 3.547705, 1.408795, 1, 0.4078431, 0, 1,
-1.562635, 0.3163091, -0.0578497, 1, 0.4156863, 0, 1,
-1.542055, -0.1353672, 0.1980912, 1, 0.4196078, 0, 1,
-1.541737, -1.988985, -1.902243, 1, 0.427451, 0, 1,
-1.53032, -0.2197577, -1.74498, 1, 0.4313726, 0, 1,
-1.52869, 0.2921726, -2.563962, 1, 0.4392157, 0, 1,
-1.52805, -0.07398565, -1.80012, 1, 0.4431373, 0, 1,
-1.518608, 0.1462751, -1.584049, 1, 0.4509804, 0, 1,
-1.506653, -0.8553037, -1.341258, 1, 0.454902, 0, 1,
-1.498412, -0.2212122, -0.5517663, 1, 0.4627451, 0, 1,
-1.485532, 0.7830758, -1.704209, 1, 0.4666667, 0, 1,
-1.481349, 0.493777, -1.93969, 1, 0.4745098, 0, 1,
-1.479315, 1.480896, 0.6303267, 1, 0.4784314, 0, 1,
-1.478175, -0.3684663, -0.2846056, 1, 0.4862745, 0, 1,
-1.463445, -1.13781, -2.495531, 1, 0.4901961, 0, 1,
-1.457087, 0.6018972, -0.6038073, 1, 0.4980392, 0, 1,
-1.450469, 0.7747081, -1.546612, 1, 0.5058824, 0, 1,
-1.448333, -0.06624293, -2.200186, 1, 0.509804, 0, 1,
-1.442955, -0.03828992, -0.7275136, 1, 0.5176471, 0, 1,
-1.409152, -0.7471621, -1.411628, 1, 0.5215687, 0, 1,
-1.405951, 0.9004631, -0.4811082, 1, 0.5294118, 0, 1,
-1.402436, 0.5068906, -0.0623391, 1, 0.5333334, 0, 1,
-1.39737, 1.120088, -1.214789, 1, 0.5411765, 0, 1,
-1.390007, 0.3670522, -1.931257, 1, 0.5450981, 0, 1,
-1.38172, -1.050904, -1.997726, 1, 0.5529412, 0, 1,
-1.378662, -1.038395, -1.682926, 1, 0.5568628, 0, 1,
-1.378235, -0.1667765, 0.5870159, 1, 0.5647059, 0, 1,
-1.378172, -0.8833457, -2.772348, 1, 0.5686275, 0, 1,
-1.3761, -0.2384259, -1.442298, 1, 0.5764706, 0, 1,
-1.373542, -0.5019546, -1.105204, 1, 0.5803922, 0, 1,
-1.37323, 1.586489, 1.509229, 1, 0.5882353, 0, 1,
-1.373052, 0.7113894, -3.441965, 1, 0.5921569, 0, 1,
-1.366045, 0.7912069, -0.8345132, 1, 0.6, 0, 1,
-1.354552, 0.4625897, 0.4206669, 1, 0.6078432, 0, 1,
-1.341519, 0.7673823, -0.485019, 1, 0.6117647, 0, 1,
-1.335294, 0.7557618, -1.63336, 1, 0.6196079, 0, 1,
-1.323284, -0.2021696, -0.9638119, 1, 0.6235294, 0, 1,
-1.3023, -0.3250642, -2.536573, 1, 0.6313726, 0, 1,
-1.272078, 1.588555, -0.9700136, 1, 0.6352941, 0, 1,
-1.266199, -0.9790905, -1.840145, 1, 0.6431373, 0, 1,
-1.260851, -0.01453688, -2.919845, 1, 0.6470588, 0, 1,
-1.257314, -0.6633686, -1.472547, 1, 0.654902, 0, 1,
-1.251237, -0.06454274, -1.260484, 1, 0.6588235, 0, 1,
-1.246729, -0.2586443, -1.881979, 1, 0.6666667, 0, 1,
-1.245092, 0.5629707, 0.5753394, 1, 0.6705883, 0, 1,
-1.241441, -0.8612099, -1.58979, 1, 0.6784314, 0, 1,
-1.234146, 0.455041, 0.4341981, 1, 0.682353, 0, 1,
-1.221605, -0.2843513, -0.8500258, 1, 0.6901961, 0, 1,
-1.219836, -1.799452, -3.244885, 1, 0.6941177, 0, 1,
-1.217202, -1.094272, -1.632339, 1, 0.7019608, 0, 1,
-1.204726, -0.5203174, -0.15143, 1, 0.7098039, 0, 1,
-1.197635, -0.5286688, -2.889727, 1, 0.7137255, 0, 1,
-1.190005, 1.254274, -1.881606, 1, 0.7215686, 0, 1,
-1.185097, 0.8071151, 0.9011096, 1, 0.7254902, 0, 1,
-1.184139, 0.8508648, -0.6761466, 1, 0.7333333, 0, 1,
-1.179273, -0.7770953, -2.863442, 1, 0.7372549, 0, 1,
-1.174129, -0.4910642, -2.926641, 1, 0.7450981, 0, 1,
-1.166465, -2.403878, -2.774666, 1, 0.7490196, 0, 1,
-1.165185, -1.137953, -2.571824, 1, 0.7568628, 0, 1,
-1.143106, -1.043617, -0.8437886, 1, 0.7607843, 0, 1,
-1.139582, -0.1900322, -2.004558, 1, 0.7686275, 0, 1,
-1.137981, 0.2763671, -2.093486, 1, 0.772549, 0, 1,
-1.131412, 1.155799, 0.9279061, 1, 0.7803922, 0, 1,
-1.130504, -2.785999, -1.843825, 1, 0.7843137, 0, 1,
-1.128672, 2.020141, -0.2705366, 1, 0.7921569, 0, 1,
-1.127662, 1.569703, 0.9516671, 1, 0.7960784, 0, 1,
-1.122103, 0.4198178, -1.02019, 1, 0.8039216, 0, 1,
-1.117803, -0.7213974, -1.118813, 1, 0.8117647, 0, 1,
-1.10897, -0.2433321, -0.9952532, 1, 0.8156863, 0, 1,
-1.092074, -0.6396864, -3.070001, 1, 0.8235294, 0, 1,
-1.081978, -0.5611969, -4.066742, 1, 0.827451, 0, 1,
-1.077672, 1.49161, -0.08999868, 1, 0.8352941, 0, 1,
-1.073829, 0.5691525, -0.03916859, 1, 0.8392157, 0, 1,
-1.070322, 0.03491161, -4.026653, 1, 0.8470588, 0, 1,
-1.066115, 1.058624, 0.3569763, 1, 0.8509804, 0, 1,
-1.06004, 1.083287, -0.6381585, 1, 0.8588235, 0, 1,
-1.054243, 0.5113488, -2.205412, 1, 0.8627451, 0, 1,
-1.047843, 0.5138988, -2.175851, 1, 0.8705882, 0, 1,
-1.046753, 0.525917, -1.524353, 1, 0.8745098, 0, 1,
-1.044301, -0.195756, -1.22373, 1, 0.8823529, 0, 1,
-1.036895, -0.2114275, -0.5689454, 1, 0.8862745, 0, 1,
-1.034463, 1.043767, -1.90351, 1, 0.8941177, 0, 1,
-1.032496, -1.327811, -2.244717, 1, 0.8980392, 0, 1,
-1.029646, 0.3948229, -1.071436, 1, 0.9058824, 0, 1,
-1.029322, -1.676059, -4.425897, 1, 0.9137255, 0, 1,
-1.026514, -0.259182, -1.189099, 1, 0.9176471, 0, 1,
-1.025515, 1.486504, -0.4708716, 1, 0.9254902, 0, 1,
-1.019779, -0.5550783, -1.968469, 1, 0.9294118, 0, 1,
-1.01784, 1.97066, -0.5537825, 1, 0.9372549, 0, 1,
-1.013123, 0.5484003, 1.177637, 1, 0.9411765, 0, 1,
-1.006427, 0.6332214, -1.286251, 1, 0.9490196, 0, 1,
-0.9974526, 0.421246, -1.708748, 1, 0.9529412, 0, 1,
-0.9940509, -0.9836905, -1.325487, 1, 0.9607843, 0, 1,
-0.9876328, -0.0001575911, -2.487375, 1, 0.9647059, 0, 1,
-0.9868351, -0.1629951, -1.198116, 1, 0.972549, 0, 1,
-0.9806821, -0.6286535, -0.8836434, 1, 0.9764706, 0, 1,
-0.9794536, 0.1263366, -1.959802, 1, 0.9843137, 0, 1,
-0.9749182, 0.9868735, -1.509809, 1, 0.9882353, 0, 1,
-0.9703538, 0.2344471, -0.8375214, 1, 0.9960784, 0, 1,
-0.9684858, -0.9336681, -1.858356, 0.9960784, 1, 0, 1,
-0.967872, 1.311493, 0.1850502, 0.9921569, 1, 0, 1,
-0.9667925, 0.6613668, -1.496987, 0.9843137, 1, 0, 1,
-0.9548866, -0.4714701, -1.939989, 0.9803922, 1, 0, 1,
-0.9486875, -1.635252, -3.317324, 0.972549, 1, 0, 1,
-0.9481331, -0.02456467, -2.76494, 0.9686275, 1, 0, 1,
-0.9470617, 2.564755, 0.5637766, 0.9607843, 1, 0, 1,
-0.9468712, -0.530322, -2.018874, 0.9568627, 1, 0, 1,
-0.9424543, 0.5477265, -0.5438423, 0.9490196, 1, 0, 1,
-0.9346395, 0.2415466, -2.479064, 0.945098, 1, 0, 1,
-0.9338647, -1.905121, -4.217922, 0.9372549, 1, 0, 1,
-0.9326317, -0.2659261, -2.281173, 0.9333333, 1, 0, 1,
-0.9297364, 0.3288265, -2.322022, 0.9254902, 1, 0, 1,
-0.9246352, 2.645989, -1.767499, 0.9215686, 1, 0, 1,
-0.9193435, 0.8629324, -0.569894, 0.9137255, 1, 0, 1,
-0.9191074, -1.682845, -3.511041, 0.9098039, 1, 0, 1,
-0.9136513, -0.7349795, -3.69479, 0.9019608, 1, 0, 1,
-0.9111328, -0.2845951, -1.486443, 0.8941177, 1, 0, 1,
-0.910419, -0.09308568, -3.022181, 0.8901961, 1, 0, 1,
-0.8980844, 0.06333541, -1.157067, 0.8823529, 1, 0, 1,
-0.8957907, 0.1101421, -0.6713206, 0.8784314, 1, 0, 1,
-0.8950568, 0.2691027, -1.693969, 0.8705882, 1, 0, 1,
-0.8910194, -0.1151066, 0.1349607, 0.8666667, 1, 0, 1,
-0.8908605, 0.09948424, -2.797543, 0.8588235, 1, 0, 1,
-0.8887689, -0.136047, -2.895041, 0.854902, 1, 0, 1,
-0.8798203, 0.4361118, 0.3378022, 0.8470588, 1, 0, 1,
-0.877206, 1.404312, -0.5547294, 0.8431373, 1, 0, 1,
-0.8749389, 0.6736466, -0.1231523, 0.8352941, 1, 0, 1,
-0.8731067, 1.12491, -0.5837668, 0.8313726, 1, 0, 1,
-0.8705767, -1.885396, -2.077886, 0.8235294, 1, 0, 1,
-0.8700015, -0.2912963, -3.17433, 0.8196079, 1, 0, 1,
-0.8655292, 0.2850597, -2.172702, 0.8117647, 1, 0, 1,
-0.8546532, -0.6885459, -1.526592, 0.8078431, 1, 0, 1,
-0.8525995, 0.3633438, -1.376156, 0.8, 1, 0, 1,
-0.8522996, -0.1882207, -2.125047, 0.7921569, 1, 0, 1,
-0.849919, 1.001888, -0.3197047, 0.7882353, 1, 0, 1,
-0.8467944, -0.4574441, -2.539565, 0.7803922, 1, 0, 1,
-0.8370231, 1.912561, -0.6337942, 0.7764706, 1, 0, 1,
-0.8324757, -0.8214855, -3.169364, 0.7686275, 1, 0, 1,
-0.8303761, 0.1592444, -1.785189, 0.7647059, 1, 0, 1,
-0.8284798, -0.1677232, -1.767853, 0.7568628, 1, 0, 1,
-0.8278763, 0.3138853, -2.022147, 0.7529412, 1, 0, 1,
-0.8233769, 0.8789308, -1.589946, 0.7450981, 1, 0, 1,
-0.8227268, 0.230296, -0.9321535, 0.7411765, 1, 0, 1,
-0.8207529, 0.5917646, -1.201437, 0.7333333, 1, 0, 1,
-0.8194601, -0.9253945, -2.783453, 0.7294118, 1, 0, 1,
-0.8179903, 0.3658721, -2.578486, 0.7215686, 1, 0, 1,
-0.8174188, -0.7036728, -1.934311, 0.7176471, 1, 0, 1,
-0.815893, -0.3178868, -2.502073, 0.7098039, 1, 0, 1,
-0.8143671, 0.0866171, -1.495446, 0.7058824, 1, 0, 1,
-0.8139297, -0.778662, -0.4758777, 0.6980392, 1, 0, 1,
-0.8111018, -1.059074, -2.099777, 0.6901961, 1, 0, 1,
-0.8053715, -0.4839113, -2.68421, 0.6862745, 1, 0, 1,
-0.8018779, 0.4498443, -3.318619, 0.6784314, 1, 0, 1,
-0.8000473, -1.83372, -2.664298, 0.6745098, 1, 0, 1,
-0.799578, -0.3285587, -0.1492155, 0.6666667, 1, 0, 1,
-0.7832934, 1.451901, -1.729472, 0.6627451, 1, 0, 1,
-0.7784182, -0.9661989, -1.197757, 0.654902, 1, 0, 1,
-0.7718168, 2.75918, -0.1039315, 0.6509804, 1, 0, 1,
-0.7695953, -0.32786, -0.7533737, 0.6431373, 1, 0, 1,
-0.7671021, 0.8736222, -1.258578, 0.6392157, 1, 0, 1,
-0.765542, 2.401459, 0.6794115, 0.6313726, 1, 0, 1,
-0.7654122, 1.331293, 0.4987504, 0.627451, 1, 0, 1,
-0.7647969, 0.5712775, -0.1215342, 0.6196079, 1, 0, 1,
-0.7609439, 0.6199633, -0.3280577, 0.6156863, 1, 0, 1,
-0.7585395, 0.5289068, 1.139854, 0.6078432, 1, 0, 1,
-0.7528158, -0.9869492, -2.492586, 0.6039216, 1, 0, 1,
-0.748895, 0.3489091, 0.9713145, 0.5960785, 1, 0, 1,
-0.727747, -0.5057361, -0.9769859, 0.5882353, 1, 0, 1,
-0.7276642, 0.164057, -1.6613, 0.5843138, 1, 0, 1,
-0.7256641, 0.5465356, -2.676139, 0.5764706, 1, 0, 1,
-0.7245715, 0.9617366, 1.325688, 0.572549, 1, 0, 1,
-0.7239999, -0.9138981, -3.377423, 0.5647059, 1, 0, 1,
-0.7235041, 0.03070604, -3.20885, 0.5607843, 1, 0, 1,
-0.7207192, -0.5131391, -2.670382, 0.5529412, 1, 0, 1,
-0.7178164, -1.512813, -2.200615, 0.5490196, 1, 0, 1,
-0.7036825, 0.5258826, 0.4494291, 0.5411765, 1, 0, 1,
-0.6961789, -0.2136083, -2.196915, 0.5372549, 1, 0, 1,
-0.6881731, 0.1813388, -2.547417, 0.5294118, 1, 0, 1,
-0.6877967, 0.6771225, 1.164355, 0.5254902, 1, 0, 1,
-0.6845181, 0.7090691, -0.1457983, 0.5176471, 1, 0, 1,
-0.6814726, -0.1797777, -0.2564678, 0.5137255, 1, 0, 1,
-0.6770233, 0.2697356, 0.3616247, 0.5058824, 1, 0, 1,
-0.6725649, 0.4622034, -0.2737852, 0.5019608, 1, 0, 1,
-0.6704801, -0.5107853, -1.359096, 0.4941176, 1, 0, 1,
-0.661316, -0.7568123, -1.508276, 0.4862745, 1, 0, 1,
-0.6604365, -0.1052276, -1.905648, 0.4823529, 1, 0, 1,
-0.6550794, 1.42944, -1.005902, 0.4745098, 1, 0, 1,
-0.6533443, 0.3322814, -0.9420756, 0.4705882, 1, 0, 1,
-0.6528031, -0.9018586, -3.126491, 0.4627451, 1, 0, 1,
-0.6516792, -0.93254, -4.554064, 0.4588235, 1, 0, 1,
-0.6493927, 2.832672, 0.1960946, 0.4509804, 1, 0, 1,
-0.6452503, 1.048679, 0.1301855, 0.4470588, 1, 0, 1,
-0.6414305, -0.9151453, -2.890881, 0.4392157, 1, 0, 1,
-0.6366636, 0.6007519, -2.097522, 0.4352941, 1, 0, 1,
-0.6350553, -0.1582815, -1.445898, 0.427451, 1, 0, 1,
-0.6330543, -2.325198, -3.492403, 0.4235294, 1, 0, 1,
-0.6268041, 0.6622824, -1.113518, 0.4156863, 1, 0, 1,
-0.6253703, 1.031946, -0.317085, 0.4117647, 1, 0, 1,
-0.6110069, -0.5771492, -4.443758, 0.4039216, 1, 0, 1,
-0.6089431, 0.284738, -3.114666, 0.3960784, 1, 0, 1,
-0.6058543, 1.003837, -1.10643, 0.3921569, 1, 0, 1,
-0.6054836, 1.125534, -0.349602, 0.3843137, 1, 0, 1,
-0.6036119, -0.355072, -1.76325, 0.3803922, 1, 0, 1,
-0.5983232, -0.1866388, -0.5234305, 0.372549, 1, 0, 1,
-0.5979709, 0.1735853, -1.058344, 0.3686275, 1, 0, 1,
-0.5966448, -0.7725367, -2.76324, 0.3607843, 1, 0, 1,
-0.5948038, -0.6550747, -1.476089, 0.3568628, 1, 0, 1,
-0.5935341, -0.9906328, -1.624867, 0.3490196, 1, 0, 1,
-0.5928044, 0.2772254, -1.653882, 0.345098, 1, 0, 1,
-0.5756996, 1.134465, -1.152983, 0.3372549, 1, 0, 1,
-0.5753591, -0.7928175, -2.243814, 0.3333333, 1, 0, 1,
-0.5744706, 0.4151994, -2.134892, 0.3254902, 1, 0, 1,
-0.5742421, 1.70026, -1.910391, 0.3215686, 1, 0, 1,
-0.5718108, 0.1821383, 0.7864148, 0.3137255, 1, 0, 1,
-0.5695112, 0.8136733, -0.8603272, 0.3098039, 1, 0, 1,
-0.5671819, 0.7026629, -1.86275, 0.3019608, 1, 0, 1,
-0.5640129, 1.082772, 0.2876144, 0.2941177, 1, 0, 1,
-0.5638759, 1.005996, 0.8077614, 0.2901961, 1, 0, 1,
-0.5613558, -1.236499, -3.013417, 0.282353, 1, 0, 1,
-0.5599684, 0.4474922, -2.17682, 0.2784314, 1, 0, 1,
-0.5589728, 0.1454194, -1.573901, 0.2705882, 1, 0, 1,
-0.558879, 0.6306857, -0.3479967, 0.2666667, 1, 0, 1,
-0.5573984, -0.7069194, -0.6267592, 0.2588235, 1, 0, 1,
-0.5485362, 0.9524168, -2.028644, 0.254902, 1, 0, 1,
-0.5466444, -0.3278937, -2.296443, 0.2470588, 1, 0, 1,
-0.5395462, -1.170356, -3.033899, 0.2431373, 1, 0, 1,
-0.5370354, 1.744563, 0.4292349, 0.2352941, 1, 0, 1,
-0.5338935, -0.09114559, -1.412988, 0.2313726, 1, 0, 1,
-0.529927, -2.751, -3.339932, 0.2235294, 1, 0, 1,
-0.5249794, -0.3821183, -1.784939, 0.2196078, 1, 0, 1,
-0.5123249, 0.5250085, 0.102612, 0.2117647, 1, 0, 1,
-0.5104216, -0.7379845, -4.14983, 0.2078431, 1, 0, 1,
-0.5031467, -0.3358176, -1.19445, 0.2, 1, 0, 1,
-0.5031404, 0.002723037, -1.688685, 0.1921569, 1, 0, 1,
-0.5028405, 0.5515366, -2.225743, 0.1882353, 1, 0, 1,
-0.5002739, 0.5056522, -1.358298, 0.1803922, 1, 0, 1,
-0.4996396, 0.2114759, 0.2508182, 0.1764706, 1, 0, 1,
-0.4991156, 0.2917713, -0.289496, 0.1686275, 1, 0, 1,
-0.4978035, -0.3392158, -2.249291, 0.1647059, 1, 0, 1,
-0.4954494, -0.1360057, -1.691567, 0.1568628, 1, 0, 1,
-0.4951953, -2.239099, -2.410879, 0.1529412, 1, 0, 1,
-0.4912309, -0.2727963, -2.672441, 0.145098, 1, 0, 1,
-0.4873565, -1.341163, -1.196672, 0.1411765, 1, 0, 1,
-0.4830276, -0.05580938, -1.230926, 0.1333333, 1, 0, 1,
-0.4808158, 0.4460388, -2.258437, 0.1294118, 1, 0, 1,
-0.4794463, -0.9216192, -0.7540838, 0.1215686, 1, 0, 1,
-0.4736574, 0.4161067, -0.3742014, 0.1176471, 1, 0, 1,
-0.4702264, -0.4904489, -3.115573, 0.1098039, 1, 0, 1,
-0.4697301, 0.1474494, -0.1522039, 0.1058824, 1, 0, 1,
-0.4667627, 1.274178, -1.813799, 0.09803922, 1, 0, 1,
-0.4650363, 1.133545, -0.5790987, 0.09019608, 1, 0, 1,
-0.4638224, -0.06119712, -3.022493, 0.08627451, 1, 0, 1,
-0.4634011, 0.9991242, -0.3261213, 0.07843138, 1, 0, 1,
-0.4609396, -1.429044, -2.022347, 0.07450981, 1, 0, 1,
-0.460002, -0.618529, -2.958766, 0.06666667, 1, 0, 1,
-0.4559367, 1.023471, 1.565133, 0.0627451, 1, 0, 1,
-0.4556957, -0.6872758, -1.921571, 0.05490196, 1, 0, 1,
-0.4552419, 2.238423, -0.6913512, 0.05098039, 1, 0, 1,
-0.4483989, -0.152911, -3.230187, 0.04313726, 1, 0, 1,
-0.4469903, -0.1983435, -3.493562, 0.03921569, 1, 0, 1,
-0.445059, 0.03367209, -0.2672476, 0.03137255, 1, 0, 1,
-0.4429445, 1.890157, -0.5869029, 0.02745098, 1, 0, 1,
-0.4405878, 0.06832547, -3.71576, 0.01960784, 1, 0, 1,
-0.4368461, -1.069444, -3.703662, 0.01568628, 1, 0, 1,
-0.4309723, -0.1159326, -0.09970258, 0.007843138, 1, 0, 1,
-0.4273916, 1.794216, 0.6532168, 0.003921569, 1, 0, 1,
-0.4263882, -0.132205, -2.271401, 0, 1, 0.003921569, 1,
-0.4261717, 0.3283063, -1.137922, 0, 1, 0.01176471, 1,
-0.4259463, 0.05360407, -0.5943295, 0, 1, 0.01568628, 1,
-0.4257898, 1.34551, 0.7143384, 0, 1, 0.02352941, 1,
-0.4251962, 1.012936, -1.271419, 0, 1, 0.02745098, 1,
-0.4246816, 1.63168, -0.3106978, 0, 1, 0.03529412, 1,
-0.4242093, 2.341559, 0.7899055, 0, 1, 0.03921569, 1,
-0.4235224, -2.862321, -3.397162, 0, 1, 0.04705882, 1,
-0.4223736, 1.388657, 0.07118079, 0, 1, 0.05098039, 1,
-0.4149207, 0.4553362, -0.8187596, 0, 1, 0.05882353, 1,
-0.4125715, -0.02108622, -1.903575, 0, 1, 0.0627451, 1,
-0.4084763, -0.5312728, -2.134438, 0, 1, 0.07058824, 1,
-0.4080432, -0.1599228, 0.5038032, 0, 1, 0.07450981, 1,
-0.4034834, -0.03397893, -2.524246, 0, 1, 0.08235294, 1,
-0.3998986, -0.3645498, -1.606119, 0, 1, 0.08627451, 1,
-0.3950969, -1.06077, -3.503443, 0, 1, 0.09411765, 1,
-0.3919495, -0.1815722, -2.607231, 0, 1, 0.1019608, 1,
-0.38991, -0.522536, -2.663345, 0, 1, 0.1058824, 1,
-0.3880368, 2.319535, 0.2076275, 0, 1, 0.1137255, 1,
-0.385692, -0.895773, -1.880551, 0, 1, 0.1176471, 1,
-0.3844307, 0.7671543, 0.1603867, 0, 1, 0.1254902, 1,
-0.3818873, 1.499555, 0.07233711, 0, 1, 0.1294118, 1,
-0.378429, -0.5179762, -2.411181, 0, 1, 0.1372549, 1,
-0.3781028, 0.06949595, 0.2688162, 0, 1, 0.1411765, 1,
-0.3716216, 2.585696, -0.9213938, 0, 1, 0.1490196, 1,
-0.369913, 0.3685983, -0.6558875, 0, 1, 0.1529412, 1,
-0.3691863, -1.243842, -1.975056, 0, 1, 0.1607843, 1,
-0.3683052, -2.497938, -2.240258, 0, 1, 0.1647059, 1,
-0.3617698, -0.4689108, -4.352781, 0, 1, 0.172549, 1,
-0.3593695, -2.200633, -4.048521, 0, 1, 0.1764706, 1,
-0.3592353, -0.9247982, -2.256482, 0, 1, 0.1843137, 1,
-0.3568558, 1.116313, 0.0495513, 0, 1, 0.1882353, 1,
-0.3500558, -0.8905201, -1.99923, 0, 1, 0.1960784, 1,
-0.3443955, -1.118387, -1.213399, 0, 1, 0.2039216, 1,
-0.3403763, 0.8725171, -0.6405519, 0, 1, 0.2078431, 1,
-0.334569, -0.6968299, 0.893201, 0, 1, 0.2156863, 1,
-0.3327335, -0.6091421, -3.378665, 0, 1, 0.2196078, 1,
-0.3321063, 0.3800829, 0.4994546, 0, 1, 0.227451, 1,
-0.3318138, -0.5565639, -3.344746, 0, 1, 0.2313726, 1,
-0.3317311, -1.536296, -2.707355, 0, 1, 0.2392157, 1,
-0.3265141, 0.8384542, -1.060083, 0, 1, 0.2431373, 1,
-0.3228987, -0.1753582, -1.338679, 0, 1, 0.2509804, 1,
-0.321323, 0.8970004, -0.8732374, 0, 1, 0.254902, 1,
-0.3204433, 0.7145398, -0.2580384, 0, 1, 0.2627451, 1,
-0.3132672, -0.7183051, -3.912709, 0, 1, 0.2666667, 1,
-0.3115983, 0.0558864, -1.571893, 0, 1, 0.2745098, 1,
-0.3110731, -0.5972277, -1.201648, 0, 1, 0.2784314, 1,
-0.3105787, -1.297891, -2.617915, 0, 1, 0.2862745, 1,
-0.3068699, 1.922193, -1.074476, 0, 1, 0.2901961, 1,
-0.3021085, 0.2231782, -0.5434027, 0, 1, 0.2980392, 1,
-0.2954151, 0.3305515, -1.29799, 0, 1, 0.3058824, 1,
-0.2889829, -1.133525, -3.732772, 0, 1, 0.3098039, 1,
-0.2847114, -0.2723151, -3.601131, 0, 1, 0.3176471, 1,
-0.283462, 0.06558493, -0.3655652, 0, 1, 0.3215686, 1,
-0.2820757, -0.8406637, -3.452833, 0, 1, 0.3294118, 1,
-0.2808716, 0.4888152, -1.254411, 0, 1, 0.3333333, 1,
-0.2768236, -0.5033574, -3.665362, 0, 1, 0.3411765, 1,
-0.2690585, 0.1208012, -1.290506, 0, 1, 0.345098, 1,
-0.2627577, 0.0637681, -0.5618315, 0, 1, 0.3529412, 1,
-0.2614215, 0.3000888, -1.499154, 0, 1, 0.3568628, 1,
-0.2604363, -0.4202609, -2.034667, 0, 1, 0.3647059, 1,
-0.2593079, -0.02010313, -2.011899, 0, 1, 0.3686275, 1,
-0.2581652, 0.01409787, -1.171339, 0, 1, 0.3764706, 1,
-0.2536164, 0.8703283, 0.04446213, 0, 1, 0.3803922, 1,
-0.2511059, -1.059264, -2.424481, 0, 1, 0.3882353, 1,
-0.2488814, 0.3232365, -1.772763, 0, 1, 0.3921569, 1,
-0.2474458, 0.4408331, -0.9000337, 0, 1, 0.4, 1,
-0.2469751, 1.12098, 0.6686941, 0, 1, 0.4078431, 1,
-0.2460093, 0.7730171, -2.205291, 0, 1, 0.4117647, 1,
-0.2417186, 0.4548579, -1.020569, 0, 1, 0.4196078, 1,
-0.2402657, 0.9098071, -0.3217268, 0, 1, 0.4235294, 1,
-0.2401187, 0.4352273, -1.071949, 0, 1, 0.4313726, 1,
-0.2322585, -0.1219153, 0.05308525, 0, 1, 0.4352941, 1,
-0.230473, -0.1106299, -1.959627, 0, 1, 0.4431373, 1,
-0.230268, 0.8346415, -2.466126, 0, 1, 0.4470588, 1,
-0.2267891, -0.169184, -1.574811, 0, 1, 0.454902, 1,
-0.2232966, 0.5154929, 1.281205, 0, 1, 0.4588235, 1,
-0.2217632, 0.7266235, -0.61398, 0, 1, 0.4666667, 1,
-0.2187064, -1.393108, -3.689269, 0, 1, 0.4705882, 1,
-0.2181297, -1.139334, -4.779357, 0, 1, 0.4784314, 1,
-0.2165805, 0.7387491, 0.197502, 0, 1, 0.4823529, 1,
-0.2165726, 0.1965916, -1.093018, 0, 1, 0.4901961, 1,
-0.2143644, -1.40903, -1.865946, 0, 1, 0.4941176, 1,
-0.2133473, -1.146561, -1.969695, 0, 1, 0.5019608, 1,
-0.2116438, 1.498703, -0.4414365, 0, 1, 0.509804, 1,
-0.2116028, -0.1637863, -3.483883, 0, 1, 0.5137255, 1,
-0.2033034, 0.1407718, -1.165981, 0, 1, 0.5215687, 1,
-0.202758, -0.2544798, -3.287538, 0, 1, 0.5254902, 1,
-0.2013963, -0.04637579, -2.021632, 0, 1, 0.5333334, 1,
-0.2011708, 0.2102037, -1.294308, 0, 1, 0.5372549, 1,
-0.1973332, -1.699731, -2.027362, 0, 1, 0.5450981, 1,
-0.1966202, 0.2943945, -0.4988634, 0, 1, 0.5490196, 1,
-0.1934174, -0.514662, -2.301992, 0, 1, 0.5568628, 1,
-0.1932471, -1.064798, -2.32193, 0, 1, 0.5607843, 1,
-0.1896602, -0.3276187, -3.863716, 0, 1, 0.5686275, 1,
-0.1871777, 0.4608141, -1.070799, 0, 1, 0.572549, 1,
-0.1821475, -0.3312155, -3.563924, 0, 1, 0.5803922, 1,
-0.1818778, 0.6674358, 0.6790448, 0, 1, 0.5843138, 1,
-0.1816516, 1.896191, 1.569283, 0, 1, 0.5921569, 1,
-0.179637, -0.105185, -1.679833, 0, 1, 0.5960785, 1,
-0.1776486, 0.3384252, -1.241368, 0, 1, 0.6039216, 1,
-0.176509, -0.1788291, -1.384727, 0, 1, 0.6117647, 1,
-0.1762633, -0.5510252, -3.416404, 0, 1, 0.6156863, 1,
-0.1759399, 0.4715393, -1.551219, 0, 1, 0.6235294, 1,
-0.1758744, -0.2964866, -1.400452, 0, 1, 0.627451, 1,
-0.1753618, -1.485573, -1.933108, 0, 1, 0.6352941, 1,
-0.1741049, -0.8670975, -2.330633, 0, 1, 0.6392157, 1,
-0.1726228, 1.293883, 0.4039696, 0, 1, 0.6470588, 1,
-0.1704738, 0.6434, -0.8160768, 0, 1, 0.6509804, 1,
-0.1696095, -0.312614, -2.047805, 0, 1, 0.6588235, 1,
-0.1682217, -1.009485, -3.981813, 0, 1, 0.6627451, 1,
-0.1671427, 1.319492, 0.8714043, 0, 1, 0.6705883, 1,
-0.1626883, -1.784284, -3.032285, 0, 1, 0.6745098, 1,
-0.1622743, 1.459802, -2.122443, 0, 1, 0.682353, 1,
-0.1570149, 0.3034629, 0.751394, 0, 1, 0.6862745, 1,
-0.1500472, 0.466888, -0.7964705, 0, 1, 0.6941177, 1,
-0.1473958, -0.6987538, -1.734405, 0, 1, 0.7019608, 1,
-0.1466331, 0.7898623, -0.7124248, 0, 1, 0.7058824, 1,
-0.1459117, -0.5706556, -2.761635, 0, 1, 0.7137255, 1,
-0.1449219, -1.530617, -2.882106, 0, 1, 0.7176471, 1,
-0.144649, -0.8366379, -3.321485, 0, 1, 0.7254902, 1,
-0.1443596, -1.523982, -4.091938, 0, 1, 0.7294118, 1,
-0.143511, 0.05965318, -1.291426, 0, 1, 0.7372549, 1,
-0.1430385, -1.01501, -3.824074, 0, 1, 0.7411765, 1,
-0.1410749, 0.1072519, -0.9581035, 0, 1, 0.7490196, 1,
-0.1397124, 0.9712037, 0.7597381, 0, 1, 0.7529412, 1,
-0.138816, -1.637902, -4.068742, 0, 1, 0.7607843, 1,
-0.1378821, 1.732326, -1.174118, 0, 1, 0.7647059, 1,
-0.1369867, 1.624667, -0.8817666, 0, 1, 0.772549, 1,
-0.1345181, 0.2391177, 0.5458564, 0, 1, 0.7764706, 1,
-0.130077, -0.7194765, -2.143528, 0, 1, 0.7843137, 1,
-0.1282403, -0.193573, -4.31598, 0, 1, 0.7882353, 1,
-0.1168049, -1.316214, -4.027043, 0, 1, 0.7960784, 1,
-0.1164048, 0.1025815, 0.0596622, 0, 1, 0.8039216, 1,
-0.1162243, -0.2027083, -2.666397, 0, 1, 0.8078431, 1,
-0.1158382, 1.3467, -0.6956292, 0, 1, 0.8156863, 1,
-0.1154575, -0.6946007, -2.802175, 0, 1, 0.8196079, 1,
-0.1008451, 0.8284693, -0.759514, 0, 1, 0.827451, 1,
-0.09810603, -0.6334227, -3.019803, 0, 1, 0.8313726, 1,
-0.09674362, 0.1415071, -1.029756, 0, 1, 0.8392157, 1,
-0.09665152, 1.565087, 0.8307434, 0, 1, 0.8431373, 1,
-0.09457722, -0.7822405, -1.935887, 0, 1, 0.8509804, 1,
-0.09314398, 1.62838, -0.8655615, 0, 1, 0.854902, 1,
-0.09038481, 0.6592899, -2.360308, 0, 1, 0.8627451, 1,
-0.08807174, -1.758911, -1.747028, 0, 1, 0.8666667, 1,
-0.08695089, 1.699095, -0.1350411, 0, 1, 0.8745098, 1,
-0.08632725, 0.3184261, 0.4928004, 0, 1, 0.8784314, 1,
-0.085583, 0.2909399, -1.155218, 0, 1, 0.8862745, 1,
-0.08447147, -1.323356, -2.380115, 0, 1, 0.8901961, 1,
-0.08354708, -1.735995, -1.859387, 0, 1, 0.8980392, 1,
-0.0771806, -0.9453319, -2.859039, 0, 1, 0.9058824, 1,
-0.07715617, -1.524694, -3.198229, 0, 1, 0.9098039, 1,
-0.07683571, -0.3800417, -2.337621, 0, 1, 0.9176471, 1,
-0.07351761, 0.04999468, -0.7804401, 0, 1, 0.9215686, 1,
-0.07320701, -1.558682, -3.136135, 0, 1, 0.9294118, 1,
-0.07218738, -0.884892, -3.20768, 0, 1, 0.9333333, 1,
-0.07180738, -2.649476, -3.611419, 0, 1, 0.9411765, 1,
-0.06551594, 0.4826784, -1.521477, 0, 1, 0.945098, 1,
-0.06295035, -1.589101, -2.729098, 0, 1, 0.9529412, 1,
-0.05754555, -0.446343, -3.186965, 0, 1, 0.9568627, 1,
-0.05282698, 0.3364449, -0.1951603, 0, 1, 0.9647059, 1,
-0.05031234, -0.4135256, -3.538146, 0, 1, 0.9686275, 1,
-0.04873992, 0.9327008, -0.02365147, 0, 1, 0.9764706, 1,
-0.04608558, -0.9803827, -2.109858, 0, 1, 0.9803922, 1,
-0.0440862, -0.3111878, -4.343379, 0, 1, 0.9882353, 1,
-0.0417223, 1.004228, 0.5625108, 0, 1, 0.9921569, 1,
-0.03673358, 0.3736685, -0.1245801, 0, 1, 1, 1,
-0.03264449, -0.03427798, -3.440688, 0, 0.9921569, 1, 1,
-0.03184601, 2.554789, -1.467137, 0, 0.9882353, 1, 1,
-0.02496005, -1.039109, -2.616099, 0, 0.9803922, 1, 1,
-0.02207488, 1.087531, -2.172428, 0, 0.9764706, 1, 1,
-0.02161338, -1.193472, -3.932213, 0, 0.9686275, 1, 1,
-0.01892582, 0.6071205, 0.1335683, 0, 0.9647059, 1, 1,
-0.01377526, 0.4029205, -1.640577, 0, 0.9568627, 1, 1,
-0.01330565, -0.5156303, -1.838495, 0, 0.9529412, 1, 1,
-0.01271999, -0.5533566, -3.728116, 0, 0.945098, 1, 1,
-0.01179946, 0.6132398, 1.03973, 0, 0.9411765, 1, 1,
-0.01179837, 0.876466, -1.498694, 0, 0.9333333, 1, 1,
-0.01043362, -1.064968, -4.016338, 0, 0.9294118, 1, 1,
-0.006491111, -0.4612618, -0.90419, 0, 0.9215686, 1, 1,
-0.005660846, 1.404482, -0.6907762, 0, 0.9176471, 1, 1,
-0.004744104, -0.6596682, -2.329768, 0, 0.9098039, 1, 1,
-0.004565338, -0.4146794, -1.576286, 0, 0.9058824, 1, 1,
-0.003861709, -0.4704054, -3.838525, 0, 0.8980392, 1, 1,
-0.002506192, -0.6993719, -2.088537, 0, 0.8901961, 1, 1,
-0.00208277, -1.6349, -2.476706, 0, 0.8862745, 1, 1,
0.004737625, 0.3388084, 0.3310503, 0, 0.8784314, 1, 1,
0.01381336, 0.3930604, -0.3447434, 0, 0.8745098, 1, 1,
0.01583035, 1.035704, 3.00507, 0, 0.8666667, 1, 1,
0.01696943, -0.6347193, 1.327309, 0, 0.8627451, 1, 1,
0.01840166, -0.03360346, 3.059607, 0, 0.854902, 1, 1,
0.01953981, -1.314134, 4.041447, 0, 0.8509804, 1, 1,
0.02233909, -0.2959617, 5.527255, 0, 0.8431373, 1, 1,
0.02294768, -0.644179, 4.117955, 0, 0.8392157, 1, 1,
0.02506792, -0.3820312, 4.43842, 0, 0.8313726, 1, 1,
0.03045601, -0.38141, 2.394924, 0, 0.827451, 1, 1,
0.03169114, -0.5227455, 2.845706, 0, 0.8196079, 1, 1,
0.03299207, -0.1981358, 2.377154, 0, 0.8156863, 1, 1,
0.03369622, 0.1754611, -0.456207, 0, 0.8078431, 1, 1,
0.03714768, 0.1578078, 0.3869609, 0, 0.8039216, 1, 1,
0.03775175, 1.247839, -0.2700322, 0, 0.7960784, 1, 1,
0.03928675, -0.655376, 4.330583, 0, 0.7882353, 1, 1,
0.04374811, 0.7120393, 1.567218, 0, 0.7843137, 1, 1,
0.04443248, 0.7193751, -1.917044, 0, 0.7764706, 1, 1,
0.04477796, 1.051966, 0.5306563, 0, 0.772549, 1, 1,
0.04494533, 1.85987, 0.6421513, 0, 0.7647059, 1, 1,
0.04508338, -0.67208, 2.559379, 0, 0.7607843, 1, 1,
0.04834729, 0.6489042, -0.4714371, 0, 0.7529412, 1, 1,
0.04974207, 1.417196, -0.2480714, 0, 0.7490196, 1, 1,
0.04977309, 0.4510874, 0.5324264, 0, 0.7411765, 1, 1,
0.05009843, -1.155331, 2.981166, 0, 0.7372549, 1, 1,
0.05167538, 0.3706411, -0.2748106, 0, 0.7294118, 1, 1,
0.05198231, -0.8156114, 3.091039, 0, 0.7254902, 1, 1,
0.05768685, -0.1448163, 2.69913, 0, 0.7176471, 1, 1,
0.05784191, 0.6709691, 1.690033, 0, 0.7137255, 1, 1,
0.05997739, -1.087635, 1.107985, 0, 0.7058824, 1, 1,
0.06015144, -0.356341, 3.223945, 0, 0.6980392, 1, 1,
0.0621589, -0.6828049, 3.400991, 0, 0.6941177, 1, 1,
0.06839737, 0.6057861, 1.334782, 0, 0.6862745, 1, 1,
0.06858336, -0.7818482, 2.530404, 0, 0.682353, 1, 1,
0.07077536, -0.2519102, 2.004056, 0, 0.6745098, 1, 1,
0.07294822, -0.1941738, 2.336096, 0, 0.6705883, 1, 1,
0.07524337, -0.1426644, 2.186769, 0, 0.6627451, 1, 1,
0.07804176, 2.743982, 2.103754, 0, 0.6588235, 1, 1,
0.08370317, -1.9539, 1.416279, 0, 0.6509804, 1, 1,
0.08721311, 0.7086714, -0.5182163, 0, 0.6470588, 1, 1,
0.08834896, -0.6525636, 2.138957, 0, 0.6392157, 1, 1,
0.08859687, 0.08837212, -0.190352, 0, 0.6352941, 1, 1,
0.08997823, 0.9462413, 0.4327295, 0, 0.627451, 1, 1,
0.0950364, -0.03493724, 2.282595, 0, 0.6235294, 1, 1,
0.09609543, -1.270511, 2.50414, 0, 0.6156863, 1, 1,
0.0974812, 0.6593668, -2.039903, 0, 0.6117647, 1, 1,
0.09892154, -1.13341, 2.403492, 0, 0.6039216, 1, 1,
0.1080014, 0.004558136, 3.395869, 0, 0.5960785, 1, 1,
0.1099265, 0.9808782, -0.6303358, 0, 0.5921569, 1, 1,
0.1110932, 1.206076, 0.4134152, 0, 0.5843138, 1, 1,
0.1112416, 1.269797, 0.09452405, 0, 0.5803922, 1, 1,
0.1114018, -1.032329, 4.340285, 0, 0.572549, 1, 1,
0.1132062, 1.02871, 0.9936554, 0, 0.5686275, 1, 1,
0.1134192, 1.600159, 0.4693546, 0, 0.5607843, 1, 1,
0.1135298, -1.916869, 4.567843, 0, 0.5568628, 1, 1,
0.1141219, 0.6053652, -0.6775723, 0, 0.5490196, 1, 1,
0.1160225, -0.5569662, 1.911982, 0, 0.5450981, 1, 1,
0.1171874, -0.1461051, 2.954734, 0, 0.5372549, 1, 1,
0.1187362, 1.947202, 1.080726, 0, 0.5333334, 1, 1,
0.1195658, 0.6296605, -0.02590795, 0, 0.5254902, 1, 1,
0.1197233, 2.080358, 0.4112733, 0, 0.5215687, 1, 1,
0.125646, -0.2820483, 2.093252, 0, 0.5137255, 1, 1,
0.1270247, -0.4790913, 2.239592, 0, 0.509804, 1, 1,
0.1285886, 0.2255028, 0.7772343, 0, 0.5019608, 1, 1,
0.1288544, -1.470605, 2.959852, 0, 0.4941176, 1, 1,
0.1293104, -0.9534028, 1.350193, 0, 0.4901961, 1, 1,
0.1314393, -0.8284013, 4.639513, 0, 0.4823529, 1, 1,
0.1344313, 1.287844, 0.2930819, 0, 0.4784314, 1, 1,
0.135263, 0.7126217, 1.107602, 0, 0.4705882, 1, 1,
0.1364467, 3.068719, 0.7678892, 0, 0.4666667, 1, 1,
0.1398806, 0.3866939, 1.01624, 0, 0.4588235, 1, 1,
0.1404178, 0.5550734, -0.2980687, 0, 0.454902, 1, 1,
0.1407282, -2.145216, 2.738295, 0, 0.4470588, 1, 1,
0.1407982, -0.2358628, 2.569239, 0, 0.4431373, 1, 1,
0.1411907, 0.1835694, -0.1105469, 0, 0.4352941, 1, 1,
0.1412192, -0.2840922, 0.4323409, 0, 0.4313726, 1, 1,
0.1419774, 0.8055792, -0.3167014, 0, 0.4235294, 1, 1,
0.1439509, 1.506837, -0.3080572, 0, 0.4196078, 1, 1,
0.1522349, 0.01227747, 2.513052, 0, 0.4117647, 1, 1,
0.1583167, -2.510045, 4.097494, 0, 0.4078431, 1, 1,
0.1612813, -1.385205, 3.497169, 0, 0.4, 1, 1,
0.1641141, 0.970082, -1.064928, 0, 0.3921569, 1, 1,
0.1707109, 0.1032963, 0.366134, 0, 0.3882353, 1, 1,
0.1735647, 1.075776, 0.5289088, 0, 0.3803922, 1, 1,
0.1763249, 0.4377103, 0.1674669, 0, 0.3764706, 1, 1,
0.1800195, -1.809389, 2.069728, 0, 0.3686275, 1, 1,
0.1816664, -0.8071932, 3.824772, 0, 0.3647059, 1, 1,
0.1897216, 2.101873, 0.2549647, 0, 0.3568628, 1, 1,
0.1908014, 0.6236873, 0.7685331, 0, 0.3529412, 1, 1,
0.1910845, -0.1746948, 2.707396, 0, 0.345098, 1, 1,
0.193279, -0.4167268, 1.494262, 0, 0.3411765, 1, 1,
0.1944279, 1.812918, -0.2536691, 0, 0.3333333, 1, 1,
0.1990988, 0.5677149, 0.8636404, 0, 0.3294118, 1, 1,
0.1998735, -1.584386, 2.710567, 0, 0.3215686, 1, 1,
0.2009291, -1.410932, 3.366328, 0, 0.3176471, 1, 1,
0.2017847, -0.05922627, 2.507783, 0, 0.3098039, 1, 1,
0.2025775, 0.524096, -1.122426, 0, 0.3058824, 1, 1,
0.2101156, -1.859029, 4.43403, 0, 0.2980392, 1, 1,
0.2105195, -0.8252853, 2.208699, 0, 0.2901961, 1, 1,
0.2106847, -2.105568, 1.832707, 0, 0.2862745, 1, 1,
0.2156232, -0.8660631, 2.91969, 0, 0.2784314, 1, 1,
0.2157099, -0.1498449, 1.675241, 0, 0.2745098, 1, 1,
0.219404, -0.8419521, 3.265246, 0, 0.2666667, 1, 1,
0.2196059, 0.9013836, -0.1148238, 0, 0.2627451, 1, 1,
0.2216208, 0.3884916, 0.3813047, 0, 0.254902, 1, 1,
0.2413304, -0.5064265, 1.605475, 0, 0.2509804, 1, 1,
0.246497, 0.9810263, 0.2227171, 0, 0.2431373, 1, 1,
0.248064, -0.1051294, 1.283064, 0, 0.2392157, 1, 1,
0.2515492, 1.079058, -1.108264, 0, 0.2313726, 1, 1,
0.2515521, -0.04754309, 1.617184, 0, 0.227451, 1, 1,
0.2524505, -0.9168085, 2.229384, 0, 0.2196078, 1, 1,
0.253782, 0.3170518, -0.5353073, 0, 0.2156863, 1, 1,
0.2552816, 0.8090908, -0.1023975, 0, 0.2078431, 1, 1,
0.2564155, 0.3803743, -1.355903, 0, 0.2039216, 1, 1,
0.2566666, 0.4563212, 0.7793403, 0, 0.1960784, 1, 1,
0.2569942, 0.6496521, 0.1910604, 0, 0.1882353, 1, 1,
0.2590657, 0.3286642, 0.1742496, 0, 0.1843137, 1, 1,
0.2597988, 1.748673, 0.3717614, 0, 0.1764706, 1, 1,
0.2618171, 1.126583, -0.004420018, 0, 0.172549, 1, 1,
0.2621621, -0.1868461, 2.664141, 0, 0.1647059, 1, 1,
0.2636363, 0.4807433, 1.184019, 0, 0.1607843, 1, 1,
0.2650525, -0.6724801, 3.329308, 0, 0.1529412, 1, 1,
0.271063, 1.78784, -1.198818, 0, 0.1490196, 1, 1,
0.2711966, 0.6191995, 0.2825003, 0, 0.1411765, 1, 1,
0.2770779, 0.2346777, 0.9983742, 0, 0.1372549, 1, 1,
0.2774913, -1.275083, 3.139211, 0, 0.1294118, 1, 1,
0.2811479, -0.09301475, 0.4716108, 0, 0.1254902, 1, 1,
0.2975242, -1.313465, 1.890742, 0, 0.1176471, 1, 1,
0.3009967, -0.6226454, 2.761533, 0, 0.1137255, 1, 1,
0.3039264, 1.950249, -0.6051322, 0, 0.1058824, 1, 1,
0.3096037, 0.9295451, -1.597969, 0, 0.09803922, 1, 1,
0.3183805, -1.313283, 1.409546, 0, 0.09411765, 1, 1,
0.3193763, -0.18601, 3.671128, 0, 0.08627451, 1, 1,
0.3202375, 1.39214, 1.589831, 0, 0.08235294, 1, 1,
0.3230579, 0.005928764, -0.5617926, 0, 0.07450981, 1, 1,
0.3269505, -0.01787845, 1.579378, 0, 0.07058824, 1, 1,
0.3313307, -1.075584, 2.09951, 0, 0.0627451, 1, 1,
0.3321526, -1.392332, 4.805958, 0, 0.05882353, 1, 1,
0.3397406, 1.291778, 0.2026127, 0, 0.05098039, 1, 1,
0.3455076, 0.1728094, 1.000063, 0, 0.04705882, 1, 1,
0.3460469, -0.1759364, 2.914729, 0, 0.03921569, 1, 1,
0.3498207, -1.187706, 3.815063, 0, 0.03529412, 1, 1,
0.3538774, -0.6623768, 2.447823, 0, 0.02745098, 1, 1,
0.3543632, 1.421643, 0.02237131, 0, 0.02352941, 1, 1,
0.3564012, -0.8854788, 2.179219, 0, 0.01568628, 1, 1,
0.3567866, 0.61047, 1.134562, 0, 0.01176471, 1, 1,
0.3571518, 2.112963, 2.280161, 0, 0.003921569, 1, 1,
0.3572422, 0.5179615, 0.4815188, 0.003921569, 0, 1, 1,
0.361067, -1.354796, 4.158047, 0.007843138, 0, 1, 1,
0.3646169, -0.7527755, 1.491279, 0.01568628, 0, 1, 1,
0.3681105, 0.4498935, -0.4390424, 0.01960784, 0, 1, 1,
0.3698304, 0.8730995, -0.3108923, 0.02745098, 0, 1, 1,
0.3725001, -0.3365608, 3.585312, 0.03137255, 0, 1, 1,
0.3749683, 0.3198383, 0.349308, 0.03921569, 0, 1, 1,
0.3780973, 0.09737037, 1.546125, 0.04313726, 0, 1, 1,
0.3782393, 0.1352204, -0.1116692, 0.05098039, 0, 1, 1,
0.379806, 0.1714996, 1.747487, 0.05490196, 0, 1, 1,
0.3859806, -0.4726618, 2.887293, 0.0627451, 0, 1, 1,
0.387656, 0.4267745, 0.1343149, 0.06666667, 0, 1, 1,
0.3970404, 0.4489579, 0.6231605, 0.07450981, 0, 1, 1,
0.3994533, -0.3367658, 2.287887, 0.07843138, 0, 1, 1,
0.4027599, 1.817316, 0.7746174, 0.08627451, 0, 1, 1,
0.4033602, 0.8088333, 1.305199, 0.09019608, 0, 1, 1,
0.4049289, 0.09201444, 1.431945, 0.09803922, 0, 1, 1,
0.4075926, 2.774725, -1.326228, 0.1058824, 0, 1, 1,
0.4093142, 0.5736021, 2.059381, 0.1098039, 0, 1, 1,
0.4095658, 0.5484239, 0.7098266, 0.1176471, 0, 1, 1,
0.4121851, 1.183076, 0.8861374, 0.1215686, 0, 1, 1,
0.4125617, 0.397824, 1.545727, 0.1294118, 0, 1, 1,
0.4309144, 0.1369134, 1.353994, 0.1333333, 0, 1, 1,
0.4311979, -1.227496, 2.351804, 0.1411765, 0, 1, 1,
0.4341656, 0.7283919, 0.6464128, 0.145098, 0, 1, 1,
0.4389599, 2.049505, 0.7332759, 0.1529412, 0, 1, 1,
0.4408082, 0.6261986, 1.572824, 0.1568628, 0, 1, 1,
0.4415328, -1.121518, 4.802611, 0.1647059, 0, 1, 1,
0.441817, -1.908389, 2.336622, 0.1686275, 0, 1, 1,
0.4434651, 1.911604, 0.9068599, 0.1764706, 0, 1, 1,
0.4438028, 0.3017595, 0.9210413, 0.1803922, 0, 1, 1,
0.4449254, -0.09405023, 0.7003676, 0.1882353, 0, 1, 1,
0.4466861, -0.414625, 0.6058635, 0.1921569, 0, 1, 1,
0.4487492, -0.4931764, 3.995218, 0.2, 0, 1, 1,
0.4549648, -1.908653, 1.913786, 0.2078431, 0, 1, 1,
0.4569171, -0.2244342, 2.922856, 0.2117647, 0, 1, 1,
0.4580707, -0.2943199, 0.3490677, 0.2196078, 0, 1, 1,
0.461861, -0.3622449, 2.048244, 0.2235294, 0, 1, 1,
0.4646775, 0.792482, 1.196003, 0.2313726, 0, 1, 1,
0.4666428, 0.03090504, 1.212144, 0.2352941, 0, 1, 1,
0.4692079, -0.1863485, 2.068113, 0.2431373, 0, 1, 1,
0.4715814, 1.349518, 0.152643, 0.2470588, 0, 1, 1,
0.4738981, 0.4198968, 0.2628842, 0.254902, 0, 1, 1,
0.4742618, -0.6846499, 1.571412, 0.2588235, 0, 1, 1,
0.4787161, -1.097039, 4.17934, 0.2666667, 0, 1, 1,
0.4811257, 0.2828207, 0.04669452, 0.2705882, 0, 1, 1,
0.4876166, -0.9900219, 3.066009, 0.2784314, 0, 1, 1,
0.489784, -0.8008391, 4.154531, 0.282353, 0, 1, 1,
0.4906623, -0.6596413, 2.678979, 0.2901961, 0, 1, 1,
0.4945559, -1.727925, 2.62216, 0.2941177, 0, 1, 1,
0.5038136, -1.127142, 3.041325, 0.3019608, 0, 1, 1,
0.5042831, 2.286704, 2.437946, 0.3098039, 0, 1, 1,
0.508088, -0.9914456, 4.532494, 0.3137255, 0, 1, 1,
0.5085521, -0.350303, 1.769368, 0.3215686, 0, 1, 1,
0.5089825, -0.02252046, 2.138477, 0.3254902, 0, 1, 1,
0.5124133, -0.3533928, 1.871052, 0.3333333, 0, 1, 1,
0.5142868, -0.336542, 2.942496, 0.3372549, 0, 1, 1,
0.5157105, -0.6670694, 2.305196, 0.345098, 0, 1, 1,
0.5181768, 0.6262943, 0.6916347, 0.3490196, 0, 1, 1,
0.5228439, 0.6165593, 0.7787241, 0.3568628, 0, 1, 1,
0.5282289, -0.6491579, 3.569819, 0.3607843, 0, 1, 1,
0.5294316, 0.4376933, -0.1156608, 0.3686275, 0, 1, 1,
0.5323398, -0.7182606, 0.1659016, 0.372549, 0, 1, 1,
0.5325119, 0.1175775, 0.3425658, 0.3803922, 0, 1, 1,
0.5418717, -0.3234914, 1.598876, 0.3843137, 0, 1, 1,
0.5445167, 0.004398018, 1.000175, 0.3921569, 0, 1, 1,
0.5451258, -1.315557, 3.739419, 0.3960784, 0, 1, 1,
0.5478964, 0.0745534, 0.9098216, 0.4039216, 0, 1, 1,
0.5521269, 0.8749361, -0.3470064, 0.4117647, 0, 1, 1,
0.5567794, 0.5629926, 1.378574, 0.4156863, 0, 1, 1,
0.5583678, -0.9376565, 3.632811, 0.4235294, 0, 1, 1,
0.5609993, -0.06390911, 0.8738888, 0.427451, 0, 1, 1,
0.5626877, -0.769245, 0.6744639, 0.4352941, 0, 1, 1,
0.5685126, -1.063134, 2.686175, 0.4392157, 0, 1, 1,
0.5691169, -0.5096595, 2.694178, 0.4470588, 0, 1, 1,
0.5764491, 1.81472, -0.7154759, 0.4509804, 0, 1, 1,
0.5778281, -1.829763, 2.141222, 0.4588235, 0, 1, 1,
0.5794368, 0.7392002, 2.126889, 0.4627451, 0, 1, 1,
0.5821669, -0.3356131, 2.174393, 0.4705882, 0, 1, 1,
0.5849021, 0.4546707, 1.146998, 0.4745098, 0, 1, 1,
0.5899487, -1.721252, 3.111106, 0.4823529, 0, 1, 1,
0.5905626, 1.13853, -0.2942595, 0.4862745, 0, 1, 1,
0.5907876, 0.4048724, 1.174613, 0.4941176, 0, 1, 1,
0.5915515, 0.349134, 2.69832, 0.5019608, 0, 1, 1,
0.5924235, -1.221103, 1.452634, 0.5058824, 0, 1, 1,
0.5953052, -0.04597824, 1.696328, 0.5137255, 0, 1, 1,
0.5968283, 1.575589, 0.7585567, 0.5176471, 0, 1, 1,
0.6108673, 0.7048458, 0.4856865, 0.5254902, 0, 1, 1,
0.6162764, 0.886904, 0.8161694, 0.5294118, 0, 1, 1,
0.6176733, 0.49802, 1.443081, 0.5372549, 0, 1, 1,
0.6215726, 1.302689, 0.3469102, 0.5411765, 0, 1, 1,
0.6292757, 1.75159, 0.1710774, 0.5490196, 0, 1, 1,
0.6298968, -1.554891, 0.3041372, 0.5529412, 0, 1, 1,
0.6338286, 0.2071444, 0.2633573, 0.5607843, 0, 1, 1,
0.6349183, 0.8067071, -1.299199, 0.5647059, 0, 1, 1,
0.6417979, -0.03712725, 0.3992025, 0.572549, 0, 1, 1,
0.6457313, 0.1990047, -0.3298205, 0.5764706, 0, 1, 1,
0.6469994, 0.6191612, 1.900556, 0.5843138, 0, 1, 1,
0.6509264, -0.9505385, 4.445749, 0.5882353, 0, 1, 1,
0.653112, 0.7272781, 1.7379, 0.5960785, 0, 1, 1,
0.6546515, 1.346384, 0.143982, 0.6039216, 0, 1, 1,
0.6594625, 0.1300291, 0.6544029, 0.6078432, 0, 1, 1,
0.6620103, -0.562938, 2.166009, 0.6156863, 0, 1, 1,
0.6626863, 0.2645524, 0.4292243, 0.6196079, 0, 1, 1,
0.6768742, -0.9812357, 2.878569, 0.627451, 0, 1, 1,
0.6805331, -1.331463, 4.009866, 0.6313726, 0, 1, 1,
0.6856534, -0.2294187, -0.1438717, 0.6392157, 0, 1, 1,
0.6863235, -2.429043, 1.206679, 0.6431373, 0, 1, 1,
0.6923211, -1.666821, 1.519004, 0.6509804, 0, 1, 1,
0.6936018, 0.3556546, 1.990889, 0.654902, 0, 1, 1,
0.6972683, 1.143521, 1.941903, 0.6627451, 0, 1, 1,
0.7000582, 0.4788851, 0.2912096, 0.6666667, 0, 1, 1,
0.7057019, -2.137207, 4.414405, 0.6745098, 0, 1, 1,
0.7058571, 2.231052, 0.3052895, 0.6784314, 0, 1, 1,
0.7141618, 0.8345039, -0.2043269, 0.6862745, 0, 1, 1,
0.7163656, 0.9748889, 0.4110582, 0.6901961, 0, 1, 1,
0.7184262, 0.2771754, 0.2985529, 0.6980392, 0, 1, 1,
0.7192645, 0.2400332, 0.7067947, 0.7058824, 0, 1, 1,
0.7202333, -0.6900672, 3.310174, 0.7098039, 0, 1, 1,
0.7212232, 0.8906547, 0.5824988, 0.7176471, 0, 1, 1,
0.7217559, -2.021587, 2.494905, 0.7215686, 0, 1, 1,
0.7230871, 0.9014164, 0.5464121, 0.7294118, 0, 1, 1,
0.7285626, -0.1118413, 1.453645, 0.7333333, 0, 1, 1,
0.731364, 1.202503, 0.4956333, 0.7411765, 0, 1, 1,
0.7315423, 0.3495707, 1.230045, 0.7450981, 0, 1, 1,
0.7405296, -0.3238514, 1.515046, 0.7529412, 0, 1, 1,
0.7457697, -2.246948, 1.894785, 0.7568628, 0, 1, 1,
0.7473527, -1.297564, 4.289393, 0.7647059, 0, 1, 1,
0.7508259, -0.2722402, 2.182969, 0.7686275, 0, 1, 1,
0.7517547, 0.9822528, -0.7833034, 0.7764706, 0, 1, 1,
0.7550334, 0.3140524, 0.04667505, 0.7803922, 0, 1, 1,
0.7671478, -1.700752, 2.56474, 0.7882353, 0, 1, 1,
0.7691755, -0.7147458, 1.897152, 0.7921569, 0, 1, 1,
0.7717729, 2.194977, 1.972928, 0.8, 0, 1, 1,
0.7727776, -1.015787, 2.708286, 0.8078431, 0, 1, 1,
0.7823855, -0.4332667, 1.458419, 0.8117647, 0, 1, 1,
0.7983888, 0.6437042, 2.723027, 0.8196079, 0, 1, 1,
0.8046936, 1.024131, 1.324902, 0.8235294, 0, 1, 1,
0.8049822, 0.09972163, 1.511928, 0.8313726, 0, 1, 1,
0.810779, -0.8966613, 3.144168, 0.8352941, 0, 1, 1,
0.8138806, -0.09972319, 1.013825, 0.8431373, 0, 1, 1,
0.8198683, 0.9209703, 0.6300929, 0.8470588, 0, 1, 1,
0.8200377, 0.5406736, 1.455963, 0.854902, 0, 1, 1,
0.8225334, 1.231961, -0.1760009, 0.8588235, 0, 1, 1,
0.8254155, -0.1994786, 1.818109, 0.8666667, 0, 1, 1,
0.8272414, -0.7498184, 2.530099, 0.8705882, 0, 1, 1,
0.8305057, 0.01392724, 1.148723, 0.8784314, 0, 1, 1,
0.830694, 1.422787, 1.401941, 0.8823529, 0, 1, 1,
0.8311772, 1.029105, 0.2667574, 0.8901961, 0, 1, 1,
0.8354734, -1.613167, 1.256577, 0.8941177, 0, 1, 1,
0.8397319, -1.226766, 2.229502, 0.9019608, 0, 1, 1,
0.8424878, -1.380649, 2.697109, 0.9098039, 0, 1, 1,
0.8462188, 0.2029592, 1.134214, 0.9137255, 0, 1, 1,
0.8531235, 0.3791274, 1.274661, 0.9215686, 0, 1, 1,
0.8540484, 0.606275, 0.9348646, 0.9254902, 0, 1, 1,
0.8556665, 1.286976, -1.135873, 0.9333333, 0, 1, 1,
0.8684376, 1.037927, 0.1796771, 0.9372549, 0, 1, 1,
0.8689963, 0.9653308, 0.5103491, 0.945098, 0, 1, 1,
0.8700727, 0.7221243, 1.289309, 0.9490196, 0, 1, 1,
0.8736755, -1.656646, 2.551724, 0.9568627, 0, 1, 1,
0.8813471, -0.1127572, 0.05487542, 0.9607843, 0, 1, 1,
0.8822619, 1.404596, 0.1421159, 0.9686275, 0, 1, 1,
0.8853638, 0.04015521, 1.426748, 0.972549, 0, 1, 1,
0.8880624, -2.259602, 2.630631, 0.9803922, 0, 1, 1,
0.8904495, -2.389373, 1.841024, 0.9843137, 0, 1, 1,
0.8930332, -1.777279, 4.232636, 0.9921569, 0, 1, 1,
0.897299, 0.7659175, 0.579077, 0.9960784, 0, 1, 1,
0.9036735, 0.5631798, -0.6137334, 1, 0, 0.9960784, 1,
0.9071782, 0.1637558, 1.339249, 1, 0, 0.9882353, 1,
0.9083634, 0.2397583, 2.743517, 1, 0, 0.9843137, 1,
0.9086528, 0.7731075, 2.251311, 1, 0, 0.9764706, 1,
0.9149174, -1.285821, 1.777384, 1, 0, 0.972549, 1,
0.915286, -0.6947917, 5.078199, 1, 0, 0.9647059, 1,
0.9171848, 1.062992, -0.3151037, 1, 0, 0.9607843, 1,
0.9174449, 1.379762, -0.2627732, 1, 0, 0.9529412, 1,
0.9191063, 0.8265681, 1.228766, 1, 0, 0.9490196, 1,
0.9212077, 0.2550724, 0.9716631, 1, 0, 0.9411765, 1,
0.9315314, -0.0479667, 0.990006, 1, 0, 0.9372549, 1,
0.9327978, 0.3368298, 0.5973544, 1, 0, 0.9294118, 1,
0.9415324, 1.129935, 0.5718923, 1, 0, 0.9254902, 1,
0.9441116, 1.116622, 2.162476, 1, 0, 0.9176471, 1,
0.9461907, 0.9250816, 1.943726, 1, 0, 0.9137255, 1,
0.947085, -0.1872061, 3.660727, 1, 0, 0.9058824, 1,
0.9484429, -0.5630521, 2.638971, 1, 0, 0.9019608, 1,
0.953104, 0.9114979, 0.4958546, 1, 0, 0.8941177, 1,
0.9556742, -1.490349, 1.605956, 1, 0, 0.8862745, 1,
0.9569728, -0.5153528, 3.62359, 1, 0, 0.8823529, 1,
0.9634993, 0.433449, 0.2674616, 1, 0, 0.8745098, 1,
0.9732558, -0.8324804, 1.779976, 1, 0, 0.8705882, 1,
0.9752566, -0.2263764, 2.313282, 1, 0, 0.8627451, 1,
0.9852677, -1.157437, 2.906436, 1, 0, 0.8588235, 1,
0.9868045, 1.443993, 0.2994818, 1, 0, 0.8509804, 1,
0.9901829, 0.4586967, 1.64159, 1, 0, 0.8470588, 1,
0.9963701, -1.907566, 1.413067, 1, 0, 0.8392157, 1,
0.9981738, -0.6700193, 2.120885, 1, 0, 0.8352941, 1,
1.001196, 1.111549, 0.3869518, 1, 0, 0.827451, 1,
1.008029, 0.0006721164, 1.874298, 1, 0, 0.8235294, 1,
1.016592, 0.324808, 0.9988475, 1, 0, 0.8156863, 1,
1.021177, -1.22537, 2.703213, 1, 0, 0.8117647, 1,
1.040949, -0.600578, 3.649088, 1, 0, 0.8039216, 1,
1.041067, -0.9211992, 2.020593, 1, 0, 0.7960784, 1,
1.042062, -1.400284, 3.710587, 1, 0, 0.7921569, 1,
1.061034, -0.1638626, 2.116353, 1, 0, 0.7843137, 1,
1.072515, 0.003168836, 2.27514, 1, 0, 0.7803922, 1,
1.076973, 1.356914, -0.4258852, 1, 0, 0.772549, 1,
1.077574, -0.1252842, 1.72373, 1, 0, 0.7686275, 1,
1.079955, -0.9929411, 1.88352, 1, 0, 0.7607843, 1,
1.081523, -0.2312455, 2.554655, 1, 0, 0.7568628, 1,
1.087609, 1.669315, -0.8464644, 1, 0, 0.7490196, 1,
1.088089, 0.4049358, 0.803108, 1, 0, 0.7450981, 1,
1.089027, 0.752221, 0.01536529, 1, 0, 0.7372549, 1,
1.089128, -1.557959, 2.004585, 1, 0, 0.7333333, 1,
1.091852, 1.641449, 0.1122975, 1, 0, 0.7254902, 1,
1.09492, -0.865204, 2.06774, 1, 0, 0.7215686, 1,
1.095886, -0.7135878, 3.788302, 1, 0, 0.7137255, 1,
1.108179, -0.293328, 1.502445, 1, 0, 0.7098039, 1,
1.111751, 1.289832, -0.4454828, 1, 0, 0.7019608, 1,
1.114859, 0.0713683, 2.604188, 1, 0, 0.6941177, 1,
1.126528, -0.6905195, 2.055707, 1, 0, 0.6901961, 1,
1.128363, -0.3882493, 2.068036, 1, 0, 0.682353, 1,
1.132949, -0.3374083, 2.113145, 1, 0, 0.6784314, 1,
1.148271, -1.835837, 0.7795355, 1, 0, 0.6705883, 1,
1.153179, -0.004487294, 2.563684, 1, 0, 0.6666667, 1,
1.155681, 0.5432333, 3.902328, 1, 0, 0.6588235, 1,
1.156036, -0.5284923, 3.01572, 1, 0, 0.654902, 1,
1.157526, -0.2474788, 2.881263, 1, 0, 0.6470588, 1,
1.157565, -0.2174035, 3.034424, 1, 0, 0.6431373, 1,
1.162067, 0.1633511, 0.789694, 1, 0, 0.6352941, 1,
1.170006, 0.8466403, 0.3205643, 1, 0, 0.6313726, 1,
1.17799, 1.510418, 1.931625, 1, 0, 0.6235294, 1,
1.178178, -0.6408745, 2.145766, 1, 0, 0.6196079, 1,
1.178761, 0.01270329, 2.561101, 1, 0, 0.6117647, 1,
1.178862, 1.974321, -0.6456444, 1, 0, 0.6078432, 1,
1.1809, -0.05249648, 0.8363838, 1, 0, 0.6, 1,
1.181653, 0.7134447, 2.876917, 1, 0, 0.5921569, 1,
1.187604, -0.5863523, 1.83027, 1, 0, 0.5882353, 1,
1.196272, 0.673699, 0.5505514, 1, 0, 0.5803922, 1,
1.201944, 0.1047051, 2.842976, 1, 0, 0.5764706, 1,
1.206639, 0.341841, 1.895367, 1, 0, 0.5686275, 1,
1.217058, 1.567814, -1.296129, 1, 0, 0.5647059, 1,
1.224824, 0.4433042, 2.424527, 1, 0, 0.5568628, 1,
1.230062, 0.6093755, 1.594292, 1, 0, 0.5529412, 1,
1.235793, 1.908275, -0.1589376, 1, 0, 0.5450981, 1,
1.246683, 0.7913802, 2.609938, 1, 0, 0.5411765, 1,
1.274237, 0.7197409, 1.571519, 1, 0, 0.5333334, 1,
1.289341, -0.4470538, 2.17187, 1, 0, 0.5294118, 1,
1.294089, 0.1790072, 2.187526, 1, 0, 0.5215687, 1,
1.294199, -0.6431662, 2.09744, 1, 0, 0.5176471, 1,
1.304696, -0.2537445, 0.5383253, 1, 0, 0.509804, 1,
1.310364, 0.4558558, 1.248, 1, 0, 0.5058824, 1,
1.31252, 0.6039462, -0.2967614, 1, 0, 0.4980392, 1,
1.324602, -0.2450328, 1.249719, 1, 0, 0.4901961, 1,
1.327977, 0.1599114, 0.5789636, 1, 0, 0.4862745, 1,
1.334091, 0.3568971, 1.540359, 1, 0, 0.4784314, 1,
1.341413, 0.3480284, -1.106386, 1, 0, 0.4745098, 1,
1.364843, -0.7330567, 2.212755, 1, 0, 0.4666667, 1,
1.380647, -0.7157514, 3.864934, 1, 0, 0.4627451, 1,
1.382082, -1.410664, 0.4402553, 1, 0, 0.454902, 1,
1.41241, -0.5094239, 0.7217807, 1, 0, 0.4509804, 1,
1.414492, 0.2507702, 1.471348, 1, 0, 0.4431373, 1,
1.419728, 1.006935, -0.4637123, 1, 0, 0.4392157, 1,
1.430842, -0.531298, 1.529652, 1, 0, 0.4313726, 1,
1.431896, 0.8345076, 1.12858, 1, 0, 0.427451, 1,
1.436199, -0.7103333, 1.747888, 1, 0, 0.4196078, 1,
1.440436, -0.6145569, 2.491578, 1, 0, 0.4156863, 1,
1.447512, 0.3125859, 1.064511, 1, 0, 0.4078431, 1,
1.448005, -0.5015447, 0.1556748, 1, 0, 0.4039216, 1,
1.454259, -0.3112299, 3.55648, 1, 0, 0.3960784, 1,
1.459329, -1.041093, 0.3863851, 1, 0, 0.3882353, 1,
1.472138, -1.688334, 2.392721, 1, 0, 0.3843137, 1,
1.474551, 0.6050346, 1.11785, 1, 0, 0.3764706, 1,
1.47673, 0.5211329, -0.869596, 1, 0, 0.372549, 1,
1.484911, 1.613389, 1.60772, 1, 0, 0.3647059, 1,
1.48517, 0.4360154, -0.485884, 1, 0, 0.3607843, 1,
1.486658, -0.9669936, 1.260517, 1, 0, 0.3529412, 1,
1.497045, 1.06776, 1.891717, 1, 0, 0.3490196, 1,
1.52307, 1.570713, 1.202304, 1, 0, 0.3411765, 1,
1.525759, -0.8592858, 2.687064, 1, 0, 0.3372549, 1,
1.550544, -0.5047869, 2.985506, 1, 0, 0.3294118, 1,
1.575979, -0.9388706, 0.8699861, 1, 0, 0.3254902, 1,
1.576755, -0.5347424, 1.092897, 1, 0, 0.3176471, 1,
1.581375, -0.4023427, 0.6184574, 1, 0, 0.3137255, 1,
1.60624, 0.06283018, 1.297215, 1, 0, 0.3058824, 1,
1.609648, 0.5497022, 1.096845, 1, 0, 0.2980392, 1,
1.64677, -1.439852, 1.36838, 1, 0, 0.2941177, 1,
1.659457, 1.06184, 1.928341, 1, 0, 0.2862745, 1,
1.661043, 0.7945907, 1.995802, 1, 0, 0.282353, 1,
1.667683, -0.1686869, 2.761852, 1, 0, 0.2745098, 1,
1.694337, 1.082644, 0.796272, 1, 0, 0.2705882, 1,
1.696182, -1.600451, 2.330458, 1, 0, 0.2627451, 1,
1.705815, -2.471954, 2.723375, 1, 0, 0.2588235, 1,
1.706085, 1.04737, 1.739949, 1, 0, 0.2509804, 1,
1.712391, -0.2203032, 2.141008, 1, 0, 0.2470588, 1,
1.713896, -0.3360824, 1.758174, 1, 0, 0.2392157, 1,
1.722576, -0.5942324, 2.028789, 1, 0, 0.2352941, 1,
1.727325, 0.4462561, 1.971681, 1, 0, 0.227451, 1,
1.738262, -0.2543099, 1.937832, 1, 0, 0.2235294, 1,
1.756908, -0.1222007, 0.7771029, 1, 0, 0.2156863, 1,
1.757686, -1.265925, 1.659772, 1, 0, 0.2117647, 1,
1.785137, 0.1887891, 1.16872, 1, 0, 0.2039216, 1,
1.799942, -1.505394, 2.625941, 1, 0, 0.1960784, 1,
1.808227, -0.3200325, 2.057102, 1, 0, 0.1921569, 1,
1.819088, 0.3813843, -0.06293859, 1, 0, 0.1843137, 1,
1.830467, -2.286962, 0.9712385, 1, 0, 0.1803922, 1,
1.860581, -0.8652259, 2.003331, 1, 0, 0.172549, 1,
1.861099, -1.260748, 2.333158, 1, 0, 0.1686275, 1,
1.876883, 0.3550451, 1.33897, 1, 0, 0.1607843, 1,
1.880612, -0.7387979, 1.596604, 1, 0, 0.1568628, 1,
1.897062, 1.221492, -0.01007963, 1, 0, 0.1490196, 1,
1.897078, -0.7904927, 3.138069, 1, 0, 0.145098, 1,
1.900188, -0.3516878, 1.264864, 1, 0, 0.1372549, 1,
1.904995, -1.290596, 1.475759, 1, 0, 0.1333333, 1,
1.923904, 0.6849687, 0.1423954, 1, 0, 0.1254902, 1,
1.92689, -0.7341963, 1.868391, 1, 0, 0.1215686, 1,
2.001289, -0.762121, 0.7031962, 1, 0, 0.1137255, 1,
2.021761, 0.927218, 1.354259, 1, 0, 0.1098039, 1,
2.026165, 0.3979557, 0.01687038, 1, 0, 0.1019608, 1,
2.088474, 1.297568, 1.362738, 1, 0, 0.09411765, 1,
2.200816, -2.010022, 2.64246, 1, 0, 0.09019608, 1,
2.20406, -0.1604064, 1.026793, 1, 0, 0.08235294, 1,
2.247554, -0.1451301, 0.3965636, 1, 0, 0.07843138, 1,
2.275959, 1.669613, 1.67632, 1, 0, 0.07058824, 1,
2.320845, -0.9478627, 3.1177, 1, 0, 0.06666667, 1,
2.367295, 2.081902, 1.74559, 1, 0, 0.05882353, 1,
2.386328, 0.2628941, 1.616856, 1, 0, 0.05490196, 1,
2.449317, -0.3710451, 1.366689, 1, 0, 0.04705882, 1,
2.58514, 0.8485515, 1.024473, 1, 0, 0.04313726, 1,
2.590939, 0.8534435, 0.1487093, 1, 0, 0.03529412, 1,
2.630527, -0.424354, 1.791781, 1, 0, 0.03137255, 1,
2.810796, -0.3832594, 2.1141, 1, 0, 0.02352941, 1,
2.873772, -0.4892343, 4.649617, 1, 0, 0.01960784, 1,
2.921166, -1.344489, 1.363307, 1, 0, 0.01176471, 1,
3.461048, -0.008904453, 1.5634, 1, 0, 0.007843138, 1
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
0.06181753, -4.205452, -6.761242, 0, -0.5, 0.5, 0.5,
0.06181753, -4.205452, -6.761242, 1, -0.5, 0.5, 0.5,
0.06181753, -4.205452, -6.761242, 1, 1.5, 0.5, 0.5,
0.06181753, -4.205452, -6.761242, 0, 1.5, 0.5, 0.5
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
-4.489752, 0.2329737, -6.761242, 0, -0.5, 0.5, 0.5,
-4.489752, 0.2329737, -6.761242, 1, -0.5, 0.5, 0.5,
-4.489752, 0.2329737, -6.761242, 1, 1.5, 0.5, 0.5,
-4.489752, 0.2329737, -6.761242, 0, 1.5, 0.5, 0.5
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
-4.489752, -4.205452, 0.2735152, 0, -0.5, 0.5, 0.5,
-4.489752, -4.205452, 0.2735152, 1, -0.5, 0.5, 0.5,
-4.489752, -4.205452, 0.2735152, 1, 1.5, 0.5, 0.5,
-4.489752, -4.205452, 0.2735152, 0, 1.5, 0.5, 0.5
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
-3, -3.1812, -5.137837,
3, -3.1812, -5.137837,
-3, -3.1812, -5.137837,
-3, -3.351909, -5.408404,
-2, -3.1812, -5.137837,
-2, -3.351909, -5.408404,
-1, -3.1812, -5.137837,
-1, -3.351909, -5.408404,
0, -3.1812, -5.137837,
0, -3.351909, -5.408404,
1, -3.1812, -5.137837,
1, -3.351909, -5.408404,
2, -3.1812, -5.137837,
2, -3.351909, -5.408404,
3, -3.1812, -5.137837,
3, -3.351909, -5.408404
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
-3, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
-3, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
-3, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
-3, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
-2, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
-2, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
-2, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
-2, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
-1, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
-1, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
-1, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
-1, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
0, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
0, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
0, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
0, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
1, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
1, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
1, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
1, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
2, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
2, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
2, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
2, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5,
3, -3.693326, -5.94954, 0, -0.5, 0.5, 0.5,
3, -3.693326, -5.94954, 1, -0.5, 0.5, 0.5,
3, -3.693326, -5.94954, 1, 1.5, 0.5, 0.5,
3, -3.693326, -5.94954, 0, 1.5, 0.5, 0.5
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
-3.43939, -3, -5.137837,
-3.43939, 3, -5.137837,
-3.43939, -3, -5.137837,
-3.61445, -3, -5.408404,
-3.43939, -2, -5.137837,
-3.61445, -2, -5.408404,
-3.43939, -1, -5.137837,
-3.61445, -1, -5.408404,
-3.43939, 0, -5.137837,
-3.61445, 0, -5.408404,
-3.43939, 1, -5.137837,
-3.61445, 1, -5.408404,
-3.43939, 2, -5.137837,
-3.61445, 2, -5.408404,
-3.43939, 3, -5.137837,
-3.61445, 3, -5.408404
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
-3.964571, -3, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, -3, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, -3, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, -3, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, -2, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, -2, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, -2, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, -2, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, -1, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, -1, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, -1, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, -1, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, 0, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, 0, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, 0, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, 0, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, 1, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, 1, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, 1, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, 1, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, 2, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, 2, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, 2, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, 2, -5.94954, 0, 1.5, 0.5, 0.5,
-3.964571, 3, -5.94954, 0, -0.5, 0.5, 0.5,
-3.964571, 3, -5.94954, 1, -0.5, 0.5, 0.5,
-3.964571, 3, -5.94954, 1, 1.5, 0.5, 0.5,
-3.964571, 3, -5.94954, 0, 1.5, 0.5, 0.5
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
-3.43939, -3.1812, -4,
-3.43939, -3.1812, 4,
-3.43939, -3.1812, -4,
-3.61445, -3.351909, -4,
-3.43939, -3.1812, -2,
-3.61445, -3.351909, -2,
-3.43939, -3.1812, 0,
-3.61445, -3.351909, 0,
-3.43939, -3.1812, 2,
-3.61445, -3.351909, 2,
-3.43939, -3.1812, 4,
-3.61445, -3.351909, 4
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
-3.964571, -3.693326, -4, 0, -0.5, 0.5, 0.5,
-3.964571, -3.693326, -4, 1, -0.5, 0.5, 0.5,
-3.964571, -3.693326, -4, 1, 1.5, 0.5, 0.5,
-3.964571, -3.693326, -4, 0, 1.5, 0.5, 0.5,
-3.964571, -3.693326, -2, 0, -0.5, 0.5, 0.5,
-3.964571, -3.693326, -2, 1, -0.5, 0.5, 0.5,
-3.964571, -3.693326, -2, 1, 1.5, 0.5, 0.5,
-3.964571, -3.693326, -2, 0, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 0, 0, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 0, 1, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 0, 1, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 0, 0, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 2, 0, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 2, 1, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 2, 1, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 2, 0, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 4, 0, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 4, 1, -0.5, 0.5, 0.5,
-3.964571, -3.693326, 4, 1, 1.5, 0.5, 0.5,
-3.964571, -3.693326, 4, 0, 1.5, 0.5, 0.5
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
-3.43939, -3.1812, -5.137837,
-3.43939, 3.647147, -5.137837,
-3.43939, -3.1812, 5.684867,
-3.43939, 3.647147, 5.684867,
-3.43939, -3.1812, -5.137837,
-3.43939, -3.1812, 5.684867,
-3.43939, 3.647147, -5.137837,
-3.43939, 3.647147, 5.684867,
-3.43939, -3.1812, -5.137837,
3.563025, -3.1812, -5.137837,
-3.43939, -3.1812, 5.684867,
3.563025, -3.1812, 5.684867,
-3.43939, 3.647147, -5.137837,
3.563025, 3.647147, -5.137837,
-3.43939, 3.647147, 5.684867,
3.563025, 3.647147, 5.684867,
3.563025, -3.1812, -5.137837,
3.563025, 3.647147, -5.137837,
3.563025, -3.1812, 5.684867,
3.563025, 3.647147, 5.684867,
3.563025, -3.1812, -5.137837,
3.563025, -3.1812, 5.684867,
3.563025, 3.647147, -5.137837,
3.563025, 3.647147, 5.684867
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
var radius = 7.789367;
var distance = 34.65577;
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
mvMatrix.translate( -0.06181753, -0.2329737, -0.2735152 );
mvMatrix.scale( 1.20273, 1.23339, 0.7781804 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65577);
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


