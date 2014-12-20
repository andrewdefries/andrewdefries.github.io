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
-3.041933, -0.6588973, -2.241554, 1, 0, 0, 1,
-3.005545, 0.9879353, -2.900613, 1, 0.007843138, 0, 1,
-2.594176, 1.189684, -0.6400442, 1, 0.01176471, 0, 1,
-2.534423, 0.5847405, -0.6359659, 1, 0.01960784, 0, 1,
-2.528711, -1.011914, -1.486493, 1, 0.02352941, 0, 1,
-2.511351, -1.437448, -2.671705, 1, 0.03137255, 0, 1,
-2.462402, -0.5997472, -2.73309, 1, 0.03529412, 0, 1,
-2.415913, -0.9227585, 2.189896, 1, 0.04313726, 0, 1,
-2.395009, -2.019096, -3.03733, 1, 0.04705882, 0, 1,
-2.284861, 0.1563132, -2.689687, 1, 0.05490196, 0, 1,
-2.283758, 1.343817, -2.147042, 1, 0.05882353, 0, 1,
-2.210727, -0.5919115, -2.350821, 1, 0.06666667, 0, 1,
-2.158607, 0.6623406, -0.1969464, 1, 0.07058824, 0, 1,
-2.158511, 0.7123322, -0.4518323, 1, 0.07843138, 0, 1,
-2.158231, 0.7312331, -1.617156, 1, 0.08235294, 0, 1,
-2.101804, -1.850542, -1.637045, 1, 0.09019608, 0, 1,
-2.094532, 0.737543, -1.473071, 1, 0.09411765, 0, 1,
-2.079361, 0.2614321, -2.374018, 1, 0.1019608, 0, 1,
-2.01695, 0.1936239, 0.1607785, 1, 0.1098039, 0, 1,
-1.992126, -0.8397382, -2.394095, 1, 0.1137255, 0, 1,
-1.972818, 1.383593, -1.560877, 1, 0.1215686, 0, 1,
-1.969169, 0.6575321, -1.904007, 1, 0.1254902, 0, 1,
-1.942571, -0.3677875, -3.381251, 1, 0.1333333, 0, 1,
-1.921881, -1.000927, -3.179988, 1, 0.1372549, 0, 1,
-1.910907, -0.6104991, 0.1894702, 1, 0.145098, 0, 1,
-1.909373, 0.7916594, -2.871159, 1, 0.1490196, 0, 1,
-1.882673, 1.404902, -2.438795, 1, 0.1568628, 0, 1,
-1.872565, 0.0829723, -0.4593117, 1, 0.1607843, 0, 1,
-1.870252, -1.041727, -1.266342, 1, 0.1686275, 0, 1,
-1.865506, -0.6598707, -3.193486, 1, 0.172549, 0, 1,
-1.855133, 0.2844237, -0.9610159, 1, 0.1803922, 0, 1,
-1.841128, -0.1558193, -3.540831, 1, 0.1843137, 0, 1,
-1.836511, -1.138375, -2.069603, 1, 0.1921569, 0, 1,
-1.800176, 1.063872, -1.239649, 1, 0.1960784, 0, 1,
-1.796932, -1.311491, -2.404721, 1, 0.2039216, 0, 1,
-1.779141, -0.07771584, -0.7046099, 1, 0.2117647, 0, 1,
-1.778322, -0.2400617, -2.188909, 1, 0.2156863, 0, 1,
-1.770682, 1.644556, -1.23308, 1, 0.2235294, 0, 1,
-1.726608, -0.2637067, -1.564792, 1, 0.227451, 0, 1,
-1.709814, -0.3239212, -2.546966, 1, 0.2352941, 0, 1,
-1.675084, 1.574448, -1.843028, 1, 0.2392157, 0, 1,
-1.664935, 0.0385586, -0.1560933, 1, 0.2470588, 0, 1,
-1.658443, 0.7373786, -2.241445, 1, 0.2509804, 0, 1,
-1.655171, 1.442313, -0.8438642, 1, 0.2588235, 0, 1,
-1.654294, -0.5458656, -1.899383, 1, 0.2627451, 0, 1,
-1.65395, -0.3943979, -0.5805131, 1, 0.2705882, 0, 1,
-1.651451, 0.2929251, -1.411531, 1, 0.2745098, 0, 1,
-1.638487, 0.8296819, -2.838452, 1, 0.282353, 0, 1,
-1.635782, 0.7231568, -1.876242, 1, 0.2862745, 0, 1,
-1.629375, 0.7191488, -2.02642, 1, 0.2941177, 0, 1,
-1.628984, -0.2853968, -2.432984, 1, 0.3019608, 0, 1,
-1.628221, -0.5932036, -1.0689, 1, 0.3058824, 0, 1,
-1.609997, -1.317096, -1.910063, 1, 0.3137255, 0, 1,
-1.605258, -0.04844419, -1.744873, 1, 0.3176471, 0, 1,
-1.600123, 1.226061, -0.8123893, 1, 0.3254902, 0, 1,
-1.595356, -0.7174489, -1.224579, 1, 0.3294118, 0, 1,
-1.582097, 1.937602, 0.3534253, 1, 0.3372549, 0, 1,
-1.56845, -1.511102, -3.518483, 1, 0.3411765, 0, 1,
-1.565958, 0.3514014, -1.934462, 1, 0.3490196, 0, 1,
-1.555444, -0.5476424, -0.9303958, 1, 0.3529412, 0, 1,
-1.544303, -0.1195376, -2.182236, 1, 0.3607843, 0, 1,
-1.526272, 0.06154265, -1.609246, 1, 0.3647059, 0, 1,
-1.524366, -0.2023728, -2.031607, 1, 0.372549, 0, 1,
-1.52043, 0.4763868, -1.846912, 1, 0.3764706, 0, 1,
-1.520414, -1.048714, -3.644648, 1, 0.3843137, 0, 1,
-1.518943, 1.061903, -0.6334583, 1, 0.3882353, 0, 1,
-1.518108, -0.484677, -1.430637, 1, 0.3960784, 0, 1,
-1.517373, -0.677595, -4.368885, 1, 0.4039216, 0, 1,
-1.516551, -0.211111, -2.926663, 1, 0.4078431, 0, 1,
-1.516467, -0.04354168, -1.766735, 1, 0.4156863, 0, 1,
-1.506352, 0.009577892, -0.8051906, 1, 0.4196078, 0, 1,
-1.453439, -2.304554, -2.663509, 1, 0.427451, 0, 1,
-1.45316, 0.02606319, -1.521226, 1, 0.4313726, 0, 1,
-1.433759, 0.200324, -2.108429, 1, 0.4392157, 0, 1,
-1.421272, 0.3482019, -1.452465, 1, 0.4431373, 0, 1,
-1.420993, -1.120736, -1.419082, 1, 0.4509804, 0, 1,
-1.417482, -0.4764972, -2.77229, 1, 0.454902, 0, 1,
-1.411446, 1.231462, -0.915467, 1, 0.4627451, 0, 1,
-1.408603, 0.6452667, -0.9315673, 1, 0.4666667, 0, 1,
-1.406898, 0.4871265, -1.020146, 1, 0.4745098, 0, 1,
-1.405199, -0.1603459, -1.531354, 1, 0.4784314, 0, 1,
-1.404846, -1.098528, -1.940258, 1, 0.4862745, 0, 1,
-1.402411, 1.707244, -0.5932693, 1, 0.4901961, 0, 1,
-1.400273, 0.3054288, -1.952775, 1, 0.4980392, 0, 1,
-1.395977, -0.6295381, -1.936958, 1, 0.5058824, 0, 1,
-1.394386, 0.4099821, -0.549544, 1, 0.509804, 0, 1,
-1.392648, 0.4943364, 0.5111423, 1, 0.5176471, 0, 1,
-1.39057, -0.7480848, -2.754485, 1, 0.5215687, 0, 1,
-1.387473, 1.028323, 0.006155757, 1, 0.5294118, 0, 1,
-1.386589, 0.4125063, -0.9910342, 1, 0.5333334, 0, 1,
-1.38038, 0.8821626, -1.878682, 1, 0.5411765, 0, 1,
-1.357917, -0.1541141, -3.113875, 1, 0.5450981, 0, 1,
-1.351801, -0.9249146, -0.06668442, 1, 0.5529412, 0, 1,
-1.348709, 0.8335183, -1.286992, 1, 0.5568628, 0, 1,
-1.33567, 0.07722933, -0.6937513, 1, 0.5647059, 0, 1,
-1.334001, -0.9765079, -2.696568, 1, 0.5686275, 0, 1,
-1.333277, 0.7239086, -0.6617916, 1, 0.5764706, 0, 1,
-1.329676, 1.09651, -0.9832994, 1, 0.5803922, 0, 1,
-1.328918, -0.6485801, -2.366922, 1, 0.5882353, 0, 1,
-1.323516, 0.9127145, 1.642579, 1, 0.5921569, 0, 1,
-1.307693, 0.03455269, -1.905201, 1, 0.6, 0, 1,
-1.303769, 1.03578, 0.1031476, 1, 0.6078432, 0, 1,
-1.303377, -1.56843, -2.69021, 1, 0.6117647, 0, 1,
-1.302694, -0.5487481, -1.297088, 1, 0.6196079, 0, 1,
-1.301438, 0.5926421, -2.018508, 1, 0.6235294, 0, 1,
-1.299561, 0.5845628, -1.92282, 1, 0.6313726, 0, 1,
-1.285273, -0.6854336, -2.567421, 1, 0.6352941, 0, 1,
-1.264441, 0.3171886, -1.223252, 1, 0.6431373, 0, 1,
-1.260649, 1.265203, 0.6598101, 1, 0.6470588, 0, 1,
-1.259784, -0.4845947, -1.766171, 1, 0.654902, 0, 1,
-1.252697, 0.1351692, -0.4820669, 1, 0.6588235, 0, 1,
-1.248515, -2.715306, -0.6952915, 1, 0.6666667, 0, 1,
-1.242551, 1.695304, 0.6677066, 1, 0.6705883, 0, 1,
-1.223257, 1.049379, -1.932235, 1, 0.6784314, 0, 1,
-1.213606, -1.685111, -2.95635, 1, 0.682353, 0, 1,
-1.213166, -0.7535554, -1.127774, 1, 0.6901961, 0, 1,
-1.20516, -0.6001228, -2.015355, 1, 0.6941177, 0, 1,
-1.205074, -1.598728, -3.074897, 1, 0.7019608, 0, 1,
-1.202613, -0.3174209, -1.9943, 1, 0.7098039, 0, 1,
-1.199855, -0.4717812, -2.607765, 1, 0.7137255, 0, 1,
-1.191931, -1.715222, -3.550186, 1, 0.7215686, 0, 1,
-1.186612, -1.014325, -2.375678, 1, 0.7254902, 0, 1,
-1.180837, -0.5750747, -2.261523, 1, 0.7333333, 0, 1,
-1.176334, 0.5697644, 0.1286506, 1, 0.7372549, 0, 1,
-1.176233, -0.4713079, -2.041631, 1, 0.7450981, 0, 1,
-1.173536, 0.1366692, -1.355325, 1, 0.7490196, 0, 1,
-1.172599, -0.9785329, -2.418417, 1, 0.7568628, 0, 1,
-1.164265, -0.5071439, -1.516447, 1, 0.7607843, 0, 1,
-1.159478, 0.6538925, -0.1373177, 1, 0.7686275, 0, 1,
-1.155434, -1.818458, -3.761307, 1, 0.772549, 0, 1,
-1.151093, 0.4224817, -0.5153044, 1, 0.7803922, 0, 1,
-1.141721, 0.3586867, -1.234032, 1, 0.7843137, 0, 1,
-1.136937, 0.1813459, -0.5107782, 1, 0.7921569, 0, 1,
-1.136322, 1.953807, 0.5424533, 1, 0.7960784, 0, 1,
-1.134557, 0.02420647, -2.154058, 1, 0.8039216, 0, 1,
-1.133133, 2.205232, -0.4240541, 1, 0.8117647, 0, 1,
-1.132705, -1.242692, -2.737852, 1, 0.8156863, 0, 1,
-1.13213, 0.5257314, -0.8591064, 1, 0.8235294, 0, 1,
-1.123064, -1.664889, -4.248297, 1, 0.827451, 0, 1,
-1.1192, 0.2821351, -3.056727, 1, 0.8352941, 0, 1,
-1.116145, 0.531954, -1.807179, 1, 0.8392157, 0, 1,
-1.111215, -0.2588269, -2.302156, 1, 0.8470588, 0, 1,
-1.111201, -0.6318005, -3.322902, 1, 0.8509804, 0, 1,
-1.096347, -0.09453778, -1.488678, 1, 0.8588235, 0, 1,
-1.094296, 0.01656714, -2.133304, 1, 0.8627451, 0, 1,
-1.093767, 0.6563199, 0.7497864, 1, 0.8705882, 0, 1,
-1.091226, -0.7361355, -2.374599, 1, 0.8745098, 0, 1,
-1.091002, 0.3480904, -1.659459, 1, 0.8823529, 0, 1,
-1.089563, 0.7191727, -1.522499, 1, 0.8862745, 0, 1,
-1.077808, -0.2684691, -1.512518, 1, 0.8941177, 0, 1,
-1.073997, 0.48114, -0.7773716, 1, 0.8980392, 0, 1,
-1.073933, 0.2347267, -1.441838, 1, 0.9058824, 0, 1,
-1.072254, -0.907057, -2.694494, 1, 0.9137255, 0, 1,
-1.071796, 1.027313, 0.5750698, 1, 0.9176471, 0, 1,
-1.068388, -1.460721, -3.217387, 1, 0.9254902, 0, 1,
-1.050583, 0.4368496, -1.429391, 1, 0.9294118, 0, 1,
-1.039454, 2.376906, -0.6180918, 1, 0.9372549, 0, 1,
-1.039126, 0.3259336, -2.06964, 1, 0.9411765, 0, 1,
-1.036462, -0.7472907, -0.06560504, 1, 0.9490196, 0, 1,
-1.036362, -0.2936614, -3.375045, 1, 0.9529412, 0, 1,
-1.027565, 0.04996837, -2.66233, 1, 0.9607843, 0, 1,
-1.027541, -0.6955669, -2.662836, 1, 0.9647059, 0, 1,
-1.027026, 0.8963249, -0.5422796, 1, 0.972549, 0, 1,
-1.026493, -0.5759149, -3.058067, 1, 0.9764706, 0, 1,
-1.021453, -1.370622, -1.501961, 1, 0.9843137, 0, 1,
-1.017288, 0.9530846, -1.274369, 1, 0.9882353, 0, 1,
-1.013289, 0.8544472, -1.953886, 1, 0.9960784, 0, 1,
-1.007876, -0.9675283, -2.938666, 0.9960784, 1, 0, 1,
-0.9996051, -0.4251083, -1.455894, 0.9921569, 1, 0, 1,
-0.9904931, 1.293547, 0.5205231, 0.9843137, 1, 0, 1,
-0.9871596, -0.06755189, -2.590218, 0.9803922, 1, 0, 1,
-0.973663, -1.266629, -1.077594, 0.972549, 1, 0, 1,
-0.9687988, -0.2888999, -1.606292, 0.9686275, 1, 0, 1,
-0.9637703, 0.9444815, -0.01037164, 0.9607843, 1, 0, 1,
-0.9633086, -0.7654544, -3.846551, 0.9568627, 1, 0, 1,
-0.9617308, -1.279639, -2.839147, 0.9490196, 1, 0, 1,
-0.9575973, 0.9079171, -0.5502464, 0.945098, 1, 0, 1,
-0.9537463, 0.9251978, -1.587395, 0.9372549, 1, 0, 1,
-0.95233, 0.6831287, -1.260947, 0.9333333, 1, 0, 1,
-0.9500249, 0.2819243, -0.8251038, 0.9254902, 1, 0, 1,
-0.9472679, 0.08830301, -2.516713, 0.9215686, 1, 0, 1,
-0.9447848, -0.01161082, -1.842849, 0.9137255, 1, 0, 1,
-0.9437459, 0.5724381, -0.8834024, 0.9098039, 1, 0, 1,
-0.943393, 0.3420082, 0.7337703, 0.9019608, 1, 0, 1,
-0.9393021, -0.743146, -0.1828362, 0.8941177, 1, 0, 1,
-0.9276081, -0.4665685, -2.908152, 0.8901961, 1, 0, 1,
-0.9275834, 0.9457703, 0.3017254, 0.8823529, 1, 0, 1,
-0.9268671, 0.1871399, -1.077038, 0.8784314, 1, 0, 1,
-0.9218888, -1.86489, -4.633559, 0.8705882, 1, 0, 1,
-0.9162121, -1.98945, -2.008036, 0.8666667, 1, 0, 1,
-0.9114932, -0.7343386, -2.508276, 0.8588235, 1, 0, 1,
-0.9082496, -1.56476, -4.179362, 0.854902, 1, 0, 1,
-0.8992204, 0.2144769, -3.048516, 0.8470588, 1, 0, 1,
-0.8953798, 0.3383335, -1.920024, 0.8431373, 1, 0, 1,
-0.8917115, -1.00777, -2.404712, 0.8352941, 1, 0, 1,
-0.8904396, -1.443487, -3.076422, 0.8313726, 1, 0, 1,
-0.8848079, 0.1927955, 1.241773, 0.8235294, 1, 0, 1,
-0.8819839, 0.4085439, -0.3700752, 0.8196079, 1, 0, 1,
-0.8758022, -2.544597, -4.011772, 0.8117647, 1, 0, 1,
-0.8753666, -2.048388, -3.217094, 0.8078431, 1, 0, 1,
-0.8734124, -0.3041242, -1.29118, 0.8, 1, 0, 1,
-0.8639846, -2.048264, -2.357558, 0.7921569, 1, 0, 1,
-0.8610588, -0.4748996, -0.9989955, 0.7882353, 1, 0, 1,
-0.8589481, 0.1728297, -2.2606, 0.7803922, 1, 0, 1,
-0.8572252, -0.5038502, -3.69199, 0.7764706, 1, 0, 1,
-0.8555174, -0.1196279, -1.472655, 0.7686275, 1, 0, 1,
-0.8547537, -0.3419165, -3.238159, 0.7647059, 1, 0, 1,
-0.8519708, 1.088658, -0.7182031, 0.7568628, 1, 0, 1,
-0.8478573, -0.3657286, -1.753149, 0.7529412, 1, 0, 1,
-0.8455061, -1.035189, -2.757705, 0.7450981, 1, 0, 1,
-0.8446219, 0.397559, -1.89827, 0.7411765, 1, 0, 1,
-0.8351388, -0.5160046, -1.75153, 0.7333333, 1, 0, 1,
-0.8333694, -2.737239, -1.400019, 0.7294118, 1, 0, 1,
-0.8324749, -0.5892371, -1.584325, 0.7215686, 1, 0, 1,
-0.8294454, -0.9115064, -1.054116, 0.7176471, 1, 0, 1,
-0.8285004, 0.9565143, 1.551797, 0.7098039, 1, 0, 1,
-0.8268802, -0.5188088, -1.535944, 0.7058824, 1, 0, 1,
-0.8225713, -0.260486, -2.609805, 0.6980392, 1, 0, 1,
-0.8212385, 2.189945, 0.2957037, 0.6901961, 1, 0, 1,
-0.8190747, -0.3708906, -1.67538, 0.6862745, 1, 0, 1,
-0.8175492, 0.5886077, -2.116495, 0.6784314, 1, 0, 1,
-0.8162313, 0.7601902, -0.7633895, 0.6745098, 1, 0, 1,
-0.8133937, 0.07137603, 0.6144124, 0.6666667, 1, 0, 1,
-0.8087919, 0.60796, -0.2124135, 0.6627451, 1, 0, 1,
-0.8030704, -0.1099647, -0.9723348, 0.654902, 1, 0, 1,
-0.8027897, 0.6148666, -1.24666, 0.6509804, 1, 0, 1,
-0.8001609, -1.677496, -3.228004, 0.6431373, 1, 0, 1,
-0.7958296, 1.152528, -1.146371, 0.6392157, 1, 0, 1,
-0.7883131, 1.120344, -0.9141402, 0.6313726, 1, 0, 1,
-0.7864928, -0.1472624, -2.236249, 0.627451, 1, 0, 1,
-0.7839355, 0.3386329, -0.3828523, 0.6196079, 1, 0, 1,
-0.780566, -1.493391, -2.569315, 0.6156863, 1, 0, 1,
-0.7791032, 0.6220512, -1.856006, 0.6078432, 1, 0, 1,
-0.7742286, -1.75336, -3.459972, 0.6039216, 1, 0, 1,
-0.7734946, -0.5869202, -1.645884, 0.5960785, 1, 0, 1,
-0.7698302, 0.2460445, -1.463437, 0.5882353, 1, 0, 1,
-0.7655262, -1.994249, -2.616132, 0.5843138, 1, 0, 1,
-0.7493435, -2.321193, -3.810838, 0.5764706, 1, 0, 1,
-0.7461808, -0.2121077, -1.112289, 0.572549, 1, 0, 1,
-0.7421943, 0.1090088, -1.541551, 0.5647059, 1, 0, 1,
-0.7406356, 0.3409707, 0.891432, 0.5607843, 1, 0, 1,
-0.7401463, 0.2651837, -1.950866, 0.5529412, 1, 0, 1,
-0.7302102, 0.6753642, -2.756862, 0.5490196, 1, 0, 1,
-0.7195708, 0.04396551, -2.227227, 0.5411765, 1, 0, 1,
-0.7179717, -1.982285, -3.901115, 0.5372549, 1, 0, 1,
-0.7164805, 1.639537, 0.09288349, 0.5294118, 1, 0, 1,
-0.7163436, -0.4337327, -3.25195, 0.5254902, 1, 0, 1,
-0.709842, -0.5049672, -1.458401, 0.5176471, 1, 0, 1,
-0.707836, -0.7426249, -3.451091, 0.5137255, 1, 0, 1,
-0.706583, -0.1413627, -2.308926, 0.5058824, 1, 0, 1,
-0.7055974, -1.069405, -3.545026, 0.5019608, 1, 0, 1,
-0.7029411, 1.131587, 0.07335947, 0.4941176, 1, 0, 1,
-0.6896223, -0.628975, -1.749019, 0.4862745, 1, 0, 1,
-0.6891165, 1.035547, -1.494251, 0.4823529, 1, 0, 1,
-0.6879826, 1.004687, -0.0189459, 0.4745098, 1, 0, 1,
-0.6836109, 0.3608701, -0.9849591, 0.4705882, 1, 0, 1,
-0.6788329, 0.316672, -0.5172815, 0.4627451, 1, 0, 1,
-0.6720759, -0.5711787, -2.225517, 0.4588235, 1, 0, 1,
-0.6718165, 0.6684565, -0.8072262, 0.4509804, 1, 0, 1,
-0.665203, -0.2888161, -2.442577, 0.4470588, 1, 0, 1,
-0.6580883, 1.691897, 2.225353, 0.4392157, 1, 0, 1,
-0.6566267, -0.3584751, -2.032267, 0.4352941, 1, 0, 1,
-0.6542849, 1.015759, -0.01504396, 0.427451, 1, 0, 1,
-0.6512974, 0.1370797, -2.098554, 0.4235294, 1, 0, 1,
-0.6465495, -1.42988, -3.677749, 0.4156863, 1, 0, 1,
-0.6432967, -1.42441, -3.086683, 0.4117647, 1, 0, 1,
-0.6403649, 1.096706, 1.364526, 0.4039216, 1, 0, 1,
-0.634864, -1.749414, -2.332832, 0.3960784, 1, 0, 1,
-0.6347558, 0.2377932, -1.417881, 0.3921569, 1, 0, 1,
-0.6260597, -0.1744768, -1.824961, 0.3843137, 1, 0, 1,
-0.6238989, 0.1571725, -0.8106003, 0.3803922, 1, 0, 1,
-0.6191603, 0.3696816, -1.722539, 0.372549, 1, 0, 1,
-0.6163519, -0.5715336, -1.170506, 0.3686275, 1, 0, 1,
-0.6136439, 0.7202825, -0.3464207, 0.3607843, 1, 0, 1,
-0.6117709, -0.2239659, -3.268825, 0.3568628, 1, 0, 1,
-0.6113219, 0.8327311, -0.7908405, 0.3490196, 1, 0, 1,
-0.6099272, -0.197992, -2.326445, 0.345098, 1, 0, 1,
-0.6081775, 0.09122577, -0.5797651, 0.3372549, 1, 0, 1,
-0.6081191, 0.5208595, -1.040975, 0.3333333, 1, 0, 1,
-0.607338, -0.4474884, -2.667655, 0.3254902, 1, 0, 1,
-0.6066099, 0.4321111, -1.259365, 0.3215686, 1, 0, 1,
-0.6061034, 1.023509, 0.3259732, 0.3137255, 1, 0, 1,
-0.6059086, 1.68992, -0.8918418, 0.3098039, 1, 0, 1,
-0.5982175, -1.735651, -2.236062, 0.3019608, 1, 0, 1,
-0.594554, -1.313016, -2.843438, 0.2941177, 1, 0, 1,
-0.5910891, 0.5823318, 0.2696477, 0.2901961, 1, 0, 1,
-0.5896139, -0.806128, -1.311184, 0.282353, 1, 0, 1,
-0.5864607, -0.1309618, -1.626798, 0.2784314, 1, 0, 1,
-0.5849035, -0.9597329, -3.76453, 0.2705882, 1, 0, 1,
-0.5839839, 0.4319971, 0.170632, 0.2666667, 1, 0, 1,
-0.5818023, -0.2108435, -1.649089, 0.2588235, 1, 0, 1,
-0.5769389, -0.6147264, -1.133317, 0.254902, 1, 0, 1,
-0.5767704, 0.7395807, 0.870731, 0.2470588, 1, 0, 1,
-0.5763656, -0.4896081, -2.915954, 0.2431373, 1, 0, 1,
-0.5745171, 1.675726, 0.1940817, 0.2352941, 1, 0, 1,
-0.5742766, -1.267277, -2.543754, 0.2313726, 1, 0, 1,
-0.5740087, -0.8440227, -1.908594, 0.2235294, 1, 0, 1,
-0.5727171, 0.6458979, 0.5046369, 0.2196078, 1, 0, 1,
-0.5655307, -0.9562215, -2.934919, 0.2117647, 1, 0, 1,
-0.5592351, -0.8374191, -1.336758, 0.2078431, 1, 0, 1,
-0.5578947, 0.9272975, -0.5876597, 0.2, 1, 0, 1,
-0.5576132, -0.3159062, -2.786561, 0.1921569, 1, 0, 1,
-0.5483321, -0.1488647, -0.7486917, 0.1882353, 1, 0, 1,
-0.548201, 1.025845, -0.4148045, 0.1803922, 1, 0, 1,
-0.5468675, -1.165339, -2.620594, 0.1764706, 1, 0, 1,
-0.5452614, 1.372177, -0.8013252, 0.1686275, 1, 0, 1,
-0.5440245, 0.01653856, -1.41706, 0.1647059, 1, 0, 1,
-0.5413408, 0.1354441, -1.821541, 0.1568628, 1, 0, 1,
-0.533124, 0.7767947, -0.6433213, 0.1529412, 1, 0, 1,
-0.5313618, 1.95341, 0.8639486, 0.145098, 1, 0, 1,
-0.5311705, -0.4799007, -1.536741, 0.1411765, 1, 0, 1,
-0.5310097, 1.553054, 1.037614, 0.1333333, 1, 0, 1,
-0.530654, 1.554765, -0.2112782, 0.1294118, 1, 0, 1,
-0.5306009, 1.573513, 0.4476546, 0.1215686, 1, 0, 1,
-0.5272193, -0.4017821, -2.16634, 0.1176471, 1, 0, 1,
-0.5152653, 1.044347, -1.487868, 0.1098039, 1, 0, 1,
-0.5150082, -0.5300833, -2.398371, 0.1058824, 1, 0, 1,
-0.5119789, 0.1042267, -3.417533, 0.09803922, 1, 0, 1,
-0.5117603, 0.5701116, -0.3250411, 0.09019608, 1, 0, 1,
-0.5088888, 0.5371181, -1.543289, 0.08627451, 1, 0, 1,
-0.5065392, -0.37745, -1.02794, 0.07843138, 1, 0, 1,
-0.506206, 0.1923846, -0.493494, 0.07450981, 1, 0, 1,
-0.4997078, 0.9721948, -1.6228, 0.06666667, 1, 0, 1,
-0.4981356, 0.4204912, -1.586776, 0.0627451, 1, 0, 1,
-0.4980343, -0.5659651, -3.865351, 0.05490196, 1, 0, 1,
-0.4927768, 0.3807345, -0.3966508, 0.05098039, 1, 0, 1,
-0.492379, -1.046031, -2.595862, 0.04313726, 1, 0, 1,
-0.4845659, -6.071633e-05, -1.954815, 0.03921569, 1, 0, 1,
-0.482745, 0.7559155, -1.218157, 0.03137255, 1, 0, 1,
-0.479324, -0.4707424, -2.728214, 0.02745098, 1, 0, 1,
-0.4787512, 0.2766867, -0.879225, 0.01960784, 1, 0, 1,
-0.4786727, 0.4610803, -0.872385, 0.01568628, 1, 0, 1,
-0.4783756, -1.424314, -4.131853, 0.007843138, 1, 0, 1,
-0.4727503, 1.323934, -0.2955277, 0.003921569, 1, 0, 1,
-0.4715272, -0.3549191, -1.934463, 0, 1, 0.003921569, 1,
-0.471444, -0.2252274, -1.714586, 0, 1, 0.01176471, 1,
-0.4660737, 0.0362717, -2.037449, 0, 1, 0.01568628, 1,
-0.4631539, -1.485211, -3.875524, 0, 1, 0.02352941, 1,
-0.4570156, 0.7956124, 0.1947494, 0, 1, 0.02745098, 1,
-0.4545114, 0.2254504, -2.615026, 0, 1, 0.03529412, 1,
-0.4520971, 0.02182054, -1.350326, 0, 1, 0.03921569, 1,
-0.4516627, -0.3194374, -2.190752, 0, 1, 0.04705882, 1,
-0.4516307, 0.06108581, -1.206876, 0, 1, 0.05098039, 1,
-0.4487753, -0.5385851, -3.881768, 0, 1, 0.05882353, 1,
-0.4467078, -0.227797, -2.667186, 0, 1, 0.0627451, 1,
-0.4464462, -1.382382, -1.786761, 0, 1, 0.07058824, 1,
-0.4434167, 0.7173068, 0.01323557, 0, 1, 0.07450981, 1,
-0.4414024, 1.441028, -0.1189624, 0, 1, 0.08235294, 1,
-0.4410137, 0.6917437, -0.3477957, 0, 1, 0.08627451, 1,
-0.437932, -0.3332278, -3.691159, 0, 1, 0.09411765, 1,
-0.4373071, -0.03021826, -3.410769, 0, 1, 0.1019608, 1,
-0.4365823, -0.5103444, -1.679493, 0, 1, 0.1058824, 1,
-0.4316455, 0.6074367, -2.064518, 0, 1, 0.1137255, 1,
-0.4294436, -0.2204408, -1.748557, 0, 1, 0.1176471, 1,
-0.4283496, -1.759299, -1.295321, 0, 1, 0.1254902, 1,
-0.4282586, -1.959057, -2.478295, 0, 1, 0.1294118, 1,
-0.4274544, -1.926665, -3.11231, 0, 1, 0.1372549, 1,
-0.4267711, 0.2399949, -0.06522048, 0, 1, 0.1411765, 1,
-0.4251848, 0.1251663, -1.934964, 0, 1, 0.1490196, 1,
-0.4227866, 1.005564, -1.208898, 0, 1, 0.1529412, 1,
-0.4205664, 1.268526, 0.1301799, 0, 1, 0.1607843, 1,
-0.4191604, -1.458062, -3.21733, 0, 1, 0.1647059, 1,
-0.4165251, 0.04481211, -0.3496727, 0, 1, 0.172549, 1,
-0.4112215, 0.01358782, -3.55139, 0, 1, 0.1764706, 1,
-0.4100601, -0.6428595, -1.310823, 0, 1, 0.1843137, 1,
-0.4077592, 0.2116727, -1.516889, 0, 1, 0.1882353, 1,
-0.4069072, 1.006961, -0.5108263, 0, 1, 0.1960784, 1,
-0.4059615, -0.2589851, -1.785318, 0, 1, 0.2039216, 1,
-0.3985566, -1.062714, -3.483857, 0, 1, 0.2078431, 1,
-0.3970177, -1.738029, -2.910657, 0, 1, 0.2156863, 1,
-0.3953741, -1.120253, -2.231088, 0, 1, 0.2196078, 1,
-0.3843777, 0.9300703, -0.8859274, 0, 1, 0.227451, 1,
-0.3753049, 2.134024, 0.7393227, 0, 1, 0.2313726, 1,
-0.3717003, -0.3461552, -3.846267, 0, 1, 0.2392157, 1,
-0.3651992, -0.06426074, -3.356046, 0, 1, 0.2431373, 1,
-0.3629365, -0.182478, -2.082597, 0, 1, 0.2509804, 1,
-0.3612099, -0.8031919, -3.220649, 0, 1, 0.254902, 1,
-0.3604973, 1.151411, -0.5560738, 0, 1, 0.2627451, 1,
-0.3566502, 0.6539956, -0.3688103, 0, 1, 0.2666667, 1,
-0.3551158, -1.135768, -2.582303, 0, 1, 0.2745098, 1,
-0.3531511, 0.5286864, -0.7116497, 0, 1, 0.2784314, 1,
-0.3519817, -0.4739666, -3.468534, 0, 1, 0.2862745, 1,
-0.3497667, -0.9357355, -1.558685, 0, 1, 0.2901961, 1,
-0.3449712, -1.152142, -2.043022, 0, 1, 0.2980392, 1,
-0.3386051, 1.503495, -0.575462, 0, 1, 0.3058824, 1,
-0.3322671, -1.722467, -2.971957, 0, 1, 0.3098039, 1,
-0.3315827, -0.93088, -3.783218, 0, 1, 0.3176471, 1,
-0.3267576, 0.3096895, -1.460289, 0, 1, 0.3215686, 1,
-0.3226541, -0.7292584, -1.882953, 0, 1, 0.3294118, 1,
-0.3208628, 0.05527722, -2.888176, 0, 1, 0.3333333, 1,
-0.318773, 1.927818, 1.178432, 0, 1, 0.3411765, 1,
-0.3173926, 0.3282735, -0.7570779, 0, 1, 0.345098, 1,
-0.3173908, -0.3698741, -2.99247, 0, 1, 0.3529412, 1,
-0.3146615, 0.6233427, -0.7005115, 0, 1, 0.3568628, 1,
-0.3145549, -0.1887294, -2.589464, 0, 1, 0.3647059, 1,
-0.3125313, -0.1725066, -2.766977, 0, 1, 0.3686275, 1,
-0.3064654, -0.1531399, -0.1864782, 0, 1, 0.3764706, 1,
-0.3060243, 0.6247661, 1.341205, 0, 1, 0.3803922, 1,
-0.3053194, 0.1623069, -3.334751, 0, 1, 0.3882353, 1,
-0.3036163, 0.2814318, -1.442268, 0, 1, 0.3921569, 1,
-0.3001273, -1.342151, -0.6080782, 0, 1, 0.4, 1,
-0.2947056, -1.645005, -3.791036, 0, 1, 0.4078431, 1,
-0.2933438, -1.490851, -1.89218, 0, 1, 0.4117647, 1,
-0.2933252, 0.5020965, -0.3430462, 0, 1, 0.4196078, 1,
-0.2932703, 2.894687, -0.1784062, 0, 1, 0.4235294, 1,
-0.2885884, -0.8693867, -3.128838, 0, 1, 0.4313726, 1,
-0.2847606, -0.9784474, -2.280649, 0, 1, 0.4352941, 1,
-0.2817358, -0.113631, -2.703932, 0, 1, 0.4431373, 1,
-0.2763537, 0.3743852, -1.518785, 0, 1, 0.4470588, 1,
-0.2762553, -0.7507326, -3.279368, 0, 1, 0.454902, 1,
-0.273037, 0.7758051, -0.1050856, 0, 1, 0.4588235, 1,
-0.2720525, -1.366419, -3.569211, 0, 1, 0.4666667, 1,
-0.2685364, 1.194266, 0.02633627, 0, 1, 0.4705882, 1,
-0.2661066, -0.1486223, -1.893667, 0, 1, 0.4784314, 1,
-0.2654054, -0.05989701, -2.449793, 0, 1, 0.4823529, 1,
-0.2611205, 0.6083307, -0.5609904, 0, 1, 0.4901961, 1,
-0.2585177, 0.2332906, -1.397647, 0, 1, 0.4941176, 1,
-0.2568547, 2.119837, -2.038971, 0, 1, 0.5019608, 1,
-0.2561975, -1.245526, -4.193779, 0, 1, 0.509804, 1,
-0.2551549, 0.8415477, 0.7838581, 0, 1, 0.5137255, 1,
-0.2541467, 0.144792, -0.7750704, 0, 1, 0.5215687, 1,
-0.2503995, -0.7996703, -2.998222, 0, 1, 0.5254902, 1,
-0.2492467, 2.87554, 0.08517696, 0, 1, 0.5333334, 1,
-0.2463368, -0.7125398, -1.05765, 0, 1, 0.5372549, 1,
-0.2447664, -1.207493, -2.886589, 0, 1, 0.5450981, 1,
-0.2429702, -0.7074525, -1.80837, 0, 1, 0.5490196, 1,
-0.2405167, -0.3328201, -0.7727224, 0, 1, 0.5568628, 1,
-0.2353484, 0.1004087, -1.296435, 0, 1, 0.5607843, 1,
-0.2324791, 1.297434, -1.522748, 0, 1, 0.5686275, 1,
-0.2299154, 0.5767466, -0.465304, 0, 1, 0.572549, 1,
-0.2282951, -0.4451036, -2.502985, 0, 1, 0.5803922, 1,
-0.2279438, -0.9125832, -6.163605, 0, 1, 0.5843138, 1,
-0.2273719, -1.674411, -3.243684, 0, 1, 0.5921569, 1,
-0.2273634, 0.6647395, -0.8045115, 0, 1, 0.5960785, 1,
-0.2244328, -0.0004731418, -1.367286, 0, 1, 0.6039216, 1,
-0.2168786, -0.4838389, -2.885248, 0, 1, 0.6117647, 1,
-0.216075, 0.9419257, -2.751591, 0, 1, 0.6156863, 1,
-0.2152376, 0.3189025, -1.344298, 0, 1, 0.6235294, 1,
-0.2150322, 0.4783555, -0.6958868, 0, 1, 0.627451, 1,
-0.212242, -0.1252133, -0.3706833, 0, 1, 0.6352941, 1,
-0.2068513, 0.385579, -2.057005, 0, 1, 0.6392157, 1,
-0.2053889, 1.201734, 1.218887, 0, 1, 0.6470588, 1,
-0.2047707, -0.3141314, -1.514856, 0, 1, 0.6509804, 1,
-0.20148, -0.8015173, -2.002779, 0, 1, 0.6588235, 1,
-0.1984515, -1.317389, -3.772403, 0, 1, 0.6627451, 1,
-0.1970064, 0.2799395, -2.08922, 0, 1, 0.6705883, 1,
-0.1959635, -0.5272404, -3.269182, 0, 1, 0.6745098, 1,
-0.1959547, -0.1193447, -0.7266412, 0, 1, 0.682353, 1,
-0.1954485, -0.3599329, -3.069508, 0, 1, 0.6862745, 1,
-0.186675, 0.7457065, 0.1291436, 0, 1, 0.6941177, 1,
-0.1855266, 0.7618633, -0.203228, 0, 1, 0.7019608, 1,
-0.1824726, -1.354447, -1.879823, 0, 1, 0.7058824, 1,
-0.1822184, 0.190573, 2.980957, 0, 1, 0.7137255, 1,
-0.1820894, 0.555854, 0.4480821, 0, 1, 0.7176471, 1,
-0.1808186, 0.992502, -0.06791241, 0, 1, 0.7254902, 1,
-0.1807418, 0.3751231, -0.003758069, 0, 1, 0.7294118, 1,
-0.1752954, 1.011209, -1.049038, 0, 1, 0.7372549, 1,
-0.1746231, 0.3045988, -1.266137, 0, 1, 0.7411765, 1,
-0.1698175, 0.6837538, 1.982319, 0, 1, 0.7490196, 1,
-0.1661047, -0.2870551, -2.737269, 0, 1, 0.7529412, 1,
-0.1637749, 0.4376386, -1.467415, 0, 1, 0.7607843, 1,
-0.1636823, -0.3061453, -1.565087, 0, 1, 0.7647059, 1,
-0.1635417, 0.09753238, -1.953406, 0, 1, 0.772549, 1,
-0.160626, -0.3110237, -0.2586828, 0, 1, 0.7764706, 1,
-0.158769, 0.4017202, -0.5858429, 0, 1, 0.7843137, 1,
-0.156076, 0.9297806, -0.4600317, 0, 1, 0.7882353, 1,
-0.151675, 1.429452, -1.955709, 0, 1, 0.7960784, 1,
-0.1513793, -1.548838, -3.026181, 0, 1, 0.8039216, 1,
-0.1419802, 0.4304017, 1.460956, 0, 1, 0.8078431, 1,
-0.1389321, 0.3802649, -0.2171542, 0, 1, 0.8156863, 1,
-0.1362326, -1.289727, -2.714472, 0, 1, 0.8196079, 1,
-0.1359102, -0.1953074, -1.595116, 0, 1, 0.827451, 1,
-0.1334471, -0.2067154, -1.84737, 0, 1, 0.8313726, 1,
-0.1311718, -0.8917131, -3.640282, 0, 1, 0.8392157, 1,
-0.1309904, -0.8783214, -4.213859, 0, 1, 0.8431373, 1,
-0.1297672, -1.093015, -3.962608, 0, 1, 0.8509804, 1,
-0.1293246, 0.1451417, -0.8484256, 0, 1, 0.854902, 1,
-0.129244, -1.618956, -3.190281, 0, 1, 0.8627451, 1,
-0.1265026, -0.3974213, -3.007364, 0, 1, 0.8666667, 1,
-0.1259292, -1.475465, -2.835784, 0, 1, 0.8745098, 1,
-0.1228508, -0.6812088, -3.246717, 0, 1, 0.8784314, 1,
-0.1194419, 0.6215358, 0.1548881, 0, 1, 0.8862745, 1,
-0.1152169, -0.2251045, -3.314306, 0, 1, 0.8901961, 1,
-0.1149382, 1.734381, -0.4053885, 0, 1, 0.8980392, 1,
-0.1063496, -1.719337, -5.38842, 0, 1, 0.9058824, 1,
-0.10515, -1.236468, -4.294633, 0, 1, 0.9098039, 1,
-0.1049538, 1.000795, 0.6409121, 0, 1, 0.9176471, 1,
-0.1036171, -1.333595, -2.937237, 0, 1, 0.9215686, 1,
-0.1014881, -0.6544861, -2.427512, 0, 1, 0.9294118, 1,
-0.09771337, 0.4626117, -0.1978358, 0, 1, 0.9333333, 1,
-0.09751505, 0.895802, -0.2499971, 0, 1, 0.9411765, 1,
-0.09018932, -0.360367, -3.338706, 0, 1, 0.945098, 1,
-0.08871201, 0.2147243, -0.4127619, 0, 1, 0.9529412, 1,
-0.08694084, 1.604171, 0.717869, 0, 1, 0.9568627, 1,
-0.0820792, 0.1875625, -1.287691, 0, 1, 0.9647059, 1,
-0.07997116, -1.064214, -3.415389, 0, 1, 0.9686275, 1,
-0.07714842, -1.067214, -3.546518, 0, 1, 0.9764706, 1,
-0.0672552, -0.6194796, -3.360266, 0, 1, 0.9803922, 1,
-0.06527048, 1.356459, -0.7339333, 0, 1, 0.9882353, 1,
-0.06154715, -0.2461461, -0.9788964, 0, 1, 0.9921569, 1,
-0.05624667, -0.7642512, -2.492999, 0, 1, 1, 1,
-0.05535506, 0.5632033, -0.5549684, 0, 0.9921569, 1, 1,
-0.05412203, 0.2118322, 0.2695994, 0, 0.9882353, 1, 1,
-0.04785252, 0.3901589, -0.2362015, 0, 0.9803922, 1, 1,
-0.04319495, 0.7519199, 0.9737776, 0, 0.9764706, 1, 1,
-0.04152933, 1.664603, -1.241661, 0, 0.9686275, 1, 1,
-0.03935237, 0.801702, 0.7085268, 0, 0.9647059, 1, 1,
-0.03702859, -0.07671998, -3.647522, 0, 0.9568627, 1, 1,
-0.03160633, -0.8729558, -5.001163, 0, 0.9529412, 1, 1,
-0.02968231, -0.0609538, -0.2169441, 0, 0.945098, 1, 1,
-0.02708895, -0.2963123, -3.359998, 0, 0.9411765, 1, 1,
-0.02453745, 1.067333, -0.03192393, 0, 0.9333333, 1, 1,
-0.02407786, 0.7603267, -1.056858, 0, 0.9294118, 1, 1,
-0.018016, -0.5843014, -2.37126, 0, 0.9215686, 1, 1,
-0.01633893, -0.7736928, -3.521171, 0, 0.9176471, 1, 1,
-0.0141538, 1.527217, -0.1768576, 0, 0.9098039, 1, 1,
-0.01148442, -0.7226371, -4.292093, 0, 0.9058824, 1, 1,
-0.005892601, 1.696372, -0.4287365, 0, 0.8980392, 1, 1,
-0.004212897, 1.268669, -1.267001, 0, 0.8901961, 1, 1,
-0.003728674, 1.296474, -0.9804506, 0, 0.8862745, 1, 1,
-0.002618959, 0.3634418, -1.839673, 0, 0.8784314, 1, 1,
-0.001704282, -1.299279, -3.263931, 0, 0.8745098, 1, 1,
0.001318713, 0.8798383, -1.557393, 0, 0.8666667, 1, 1,
0.002912727, -0.9487248, 2.030182, 0, 0.8627451, 1, 1,
0.00548668, 0.2812528, -0.5161498, 0, 0.854902, 1, 1,
0.009398235, -1.806247, 5.108004, 0, 0.8509804, 1, 1,
0.01193488, 1.716492, 1.089304, 0, 0.8431373, 1, 1,
0.01677928, 0.990219, 0.3674056, 0, 0.8392157, 1, 1,
0.01706168, 1.246691, -1.264749, 0, 0.8313726, 1, 1,
0.02129833, 0.0372206, 1.627659, 0, 0.827451, 1, 1,
0.02353987, -0.05343226, 3.406664, 0, 0.8196079, 1, 1,
0.02836435, -0.4017163, 2.006657, 0, 0.8156863, 1, 1,
0.02856497, 0.8629205, 1.850425, 0, 0.8078431, 1, 1,
0.02951566, 0.490876, -0.6532279, 0, 0.8039216, 1, 1,
0.03150244, 0.09475019, 1.150567, 0, 0.7960784, 1, 1,
0.03287043, 0.9745834, 1.484679, 0, 0.7882353, 1, 1,
0.03571865, -0.7160386, 3.513463, 0, 0.7843137, 1, 1,
0.03595728, -0.603967, 1.848537, 0, 0.7764706, 1, 1,
0.03607343, 0.02966757, 1.41501, 0, 0.772549, 1, 1,
0.03691678, -0.8582956, 3.224303, 0, 0.7647059, 1, 1,
0.04362712, -1.901592, 3.946597, 0, 0.7607843, 1, 1,
0.04719374, 0.2465172, -0.303066, 0, 0.7529412, 1, 1,
0.0496111, -0.8320943, 4.216396, 0, 0.7490196, 1, 1,
0.05112403, 0.1078708, 0.3433047, 0, 0.7411765, 1, 1,
0.05567269, 0.5974922, 1.733772, 0, 0.7372549, 1, 1,
0.06228296, 1.254392, 2.405311, 0, 0.7294118, 1, 1,
0.06486674, -0.2553569, 1.998697, 0, 0.7254902, 1, 1,
0.06708411, -1.210534, 4.41915, 0, 0.7176471, 1, 1,
0.06786621, 0.1166764, 0.1696706, 0, 0.7137255, 1, 1,
0.07249833, -0.06422651, 1.466053, 0, 0.7058824, 1, 1,
0.07285474, 0.1747971, 0.6242463, 0, 0.6980392, 1, 1,
0.07542959, 0.7228258, -0.0931737, 0, 0.6941177, 1, 1,
0.0763313, 1.259709, 0.9563603, 0, 0.6862745, 1, 1,
0.08121311, -2.813799, 1.753401, 0, 0.682353, 1, 1,
0.08321795, -0.02725385, 1.792265, 0, 0.6745098, 1, 1,
0.08337931, -0.02466063, 2.489813, 0, 0.6705883, 1, 1,
0.08621304, -1.194178, 2.864239, 0, 0.6627451, 1, 1,
0.093504, 0.6711307, -0.1123188, 0, 0.6588235, 1, 1,
0.09633993, 1.300304, -1.071602, 0, 0.6509804, 1, 1,
0.09702298, -1.825451, 2.841408, 0, 0.6470588, 1, 1,
0.09820403, -0.5140207, 4.581543, 0, 0.6392157, 1, 1,
0.09866411, -0.3973468, 3.660718, 0, 0.6352941, 1, 1,
0.09963098, -1.118867, 3.338882, 0, 0.627451, 1, 1,
0.0997617, -0.222546, 3.715974, 0, 0.6235294, 1, 1,
0.1013044, 1.119568, -0.2847928, 0, 0.6156863, 1, 1,
0.1032978, -0.9979403, 3.698951, 0, 0.6117647, 1, 1,
0.1044616, -0.849744, 3.061356, 0, 0.6039216, 1, 1,
0.1081207, 1.547592, -0.4965218, 0, 0.5960785, 1, 1,
0.1096656, 0.1751361, 0.3527624, 0, 0.5921569, 1, 1,
0.1097282, -0.2063021, 2.781714, 0, 0.5843138, 1, 1,
0.1101359, -1.382863, 5.234735, 0, 0.5803922, 1, 1,
0.1123627, -0.6778796, 2.2871, 0, 0.572549, 1, 1,
0.1169432, -1.698854, 2.622276, 0, 0.5686275, 1, 1,
0.1180068, 0.7946529, -0.4702086, 0, 0.5607843, 1, 1,
0.1203576, -1.237208, 1.317615, 0, 0.5568628, 1, 1,
0.1206962, 1.074251, -0.01151741, 0, 0.5490196, 1, 1,
0.124245, 0.8408811, 0.8243083, 0, 0.5450981, 1, 1,
0.1265625, -1.893637, 0.8763797, 0, 0.5372549, 1, 1,
0.1329607, -0.6598802, 2.726181, 0, 0.5333334, 1, 1,
0.1350782, 1.009719, -1.107879, 0, 0.5254902, 1, 1,
0.1390797, -0.1880905, 2.811246, 0, 0.5215687, 1, 1,
0.1466199, 0.02885985, 1.68399, 0, 0.5137255, 1, 1,
0.1504712, 0.2110143, 2.063765, 0, 0.509804, 1, 1,
0.150696, -0.364703, 1.682287, 0, 0.5019608, 1, 1,
0.1557752, 1.127602, 0.1125867, 0, 0.4941176, 1, 1,
0.1576424, 0.4540355, 1.75417, 0, 0.4901961, 1, 1,
0.1592094, 1.924677, -0.02050466, 0, 0.4823529, 1, 1,
0.1595204, -1.019158, 2.930526, 0, 0.4784314, 1, 1,
0.1645134, -1.2801, 1.889232, 0, 0.4705882, 1, 1,
0.1686646, -0.2554465, 2.977041, 0, 0.4666667, 1, 1,
0.1703812, -1.39715, 3.722556, 0, 0.4588235, 1, 1,
0.1772929, -0.2289779, 3.922076, 0, 0.454902, 1, 1,
0.1775671, -0.9583374, 3.173185, 0, 0.4470588, 1, 1,
0.1783187, -1.124524, 2.945108, 0, 0.4431373, 1, 1,
0.1812069, -0.6187646, 4.638887, 0, 0.4352941, 1, 1,
0.1864433, -0.1942516, 1.885437, 0, 0.4313726, 1, 1,
0.1867805, -1.139157, 4.316461, 0, 0.4235294, 1, 1,
0.1880363, 0.1830952, 0.4719827, 0, 0.4196078, 1, 1,
0.1892416, 0.2354087, 0.9951574, 0, 0.4117647, 1, 1,
0.1905569, 0.2130339, 0.3505619, 0, 0.4078431, 1, 1,
0.190666, -0.04680192, 0.1443196, 0, 0.4, 1, 1,
0.1910631, -1.415521, 3.094767, 0, 0.3921569, 1, 1,
0.1920742, 0.595278, 1.153863, 0, 0.3882353, 1, 1,
0.1923848, -0.7720205, 3.198431, 0, 0.3803922, 1, 1,
0.1942329, -0.1357831, 1.203846, 0, 0.3764706, 1, 1,
0.2013647, -0.9803088, 3.055069, 0, 0.3686275, 1, 1,
0.2019251, 0.5683765, 1.116684, 0, 0.3647059, 1, 1,
0.2046375, 0.1049007, 0.4541428, 0, 0.3568628, 1, 1,
0.2174831, -1.533016, 2.973862, 0, 0.3529412, 1, 1,
0.2191729, -0.2085022, 2.664382, 0, 0.345098, 1, 1,
0.2200302, -0.1060332, 2.484025, 0, 0.3411765, 1, 1,
0.2237636, 0.8871184, 1.569083, 0, 0.3333333, 1, 1,
0.2270827, 0.1234981, 2.570513, 0, 0.3294118, 1, 1,
0.2271324, 0.2481664, 0.7270618, 0, 0.3215686, 1, 1,
0.2279933, -0.1771383, 2.413989, 0, 0.3176471, 1, 1,
0.2345118, -1.142636, 0.7230597, 0, 0.3098039, 1, 1,
0.2354889, 1.060381, 1.122282, 0, 0.3058824, 1, 1,
0.2377594, -0.8394682, 3.207712, 0, 0.2980392, 1, 1,
0.2377826, 1.045911, -0.178648, 0, 0.2901961, 1, 1,
0.2394433, 0.5807207, 1.319523, 0, 0.2862745, 1, 1,
0.2446329, -0.9602906, 2.43782, 0, 0.2784314, 1, 1,
0.2493228, -0.8087127, 2.595344, 0, 0.2745098, 1, 1,
0.2547396, 0.8201597, 1.62015, 0, 0.2666667, 1, 1,
0.2552492, -0.3158442, 1.75673, 0, 0.2627451, 1, 1,
0.2611349, -2.184926, 2.909261, 0, 0.254902, 1, 1,
0.2614354, -1.291961, 2.316488, 0, 0.2509804, 1, 1,
0.2669831, -1.000884, 2.973282, 0, 0.2431373, 1, 1,
0.2698938, 0.7905971, 0.9944994, 0, 0.2392157, 1, 1,
0.2736769, -0.6817222, 2.593734, 0, 0.2313726, 1, 1,
0.2777278, -0.004224396, 0.01580913, 0, 0.227451, 1, 1,
0.2790215, 2.072697, -0.4934745, 0, 0.2196078, 1, 1,
0.2797896, 1.41197, 1.703976, 0, 0.2156863, 1, 1,
0.2816746, -1.196019, 4.257904, 0, 0.2078431, 1, 1,
0.2854668, 1.664514, 1.667227, 0, 0.2039216, 1, 1,
0.2913477, 1.101292, 0.4753501, 0, 0.1960784, 1, 1,
0.2932852, 0.04217483, 0.2048912, 0, 0.1882353, 1, 1,
0.2985696, 0.5227284, -0.3623027, 0, 0.1843137, 1, 1,
0.3008892, 1.908651, 0.6110877, 0, 0.1764706, 1, 1,
0.3018533, -0.6624898, 2.224025, 0, 0.172549, 1, 1,
0.3028782, -0.3095644, 2.47125, 0, 0.1647059, 1, 1,
0.3033872, 0.08401409, 2.319011, 0, 0.1607843, 1, 1,
0.3042172, 0.405424, 1.401844, 0, 0.1529412, 1, 1,
0.3085866, -0.521166, 2.95185, 0, 0.1490196, 1, 1,
0.3095253, 0.327813, 1.344098, 0, 0.1411765, 1, 1,
0.3141869, -1.262799, 3.718811, 0, 0.1372549, 1, 1,
0.3183681, -1.765391, 1.712969, 0, 0.1294118, 1, 1,
0.3205194, 0.3553919, 0.8885937, 0, 0.1254902, 1, 1,
0.3262115, -0.2599161, 1.247223, 0, 0.1176471, 1, 1,
0.327552, -0.5017015, 3.238178, 0, 0.1137255, 1, 1,
0.3283626, 1.311235, -0.3334712, 0, 0.1058824, 1, 1,
0.329086, -1.352652, 3.599517, 0, 0.09803922, 1, 1,
0.334803, -0.7131506, 2.141374, 0, 0.09411765, 1, 1,
0.3357936, 0.1049334, 1.745642, 0, 0.08627451, 1, 1,
0.3431435, -0.2303848, 2.841411, 0, 0.08235294, 1, 1,
0.3450444, 0.2780141, 1.557868, 0, 0.07450981, 1, 1,
0.3551007, -0.3513509, 2.837226, 0, 0.07058824, 1, 1,
0.3596862, 0.4649542, 1.314466, 0, 0.0627451, 1, 1,
0.3604822, 0.1956962, 0.05947898, 0, 0.05882353, 1, 1,
0.3625208, 0.1777338, -0.7744487, 0, 0.05098039, 1, 1,
0.3644353, 1.105965, -0.3694368, 0, 0.04705882, 1, 1,
0.3666081, -0.4806578, 3.96319, 0, 0.03921569, 1, 1,
0.3669583, 1.953926, -0.1673701, 0, 0.03529412, 1, 1,
0.3685179, 0.3809471, 1.668142, 0, 0.02745098, 1, 1,
0.3717892, -1.925152, 3.211555, 0, 0.02352941, 1, 1,
0.3727346, -0.03924115, 2.030047, 0, 0.01568628, 1, 1,
0.3728596, -0.8622707, 3.307668, 0, 0.01176471, 1, 1,
0.3737022, -0.4930805, 0.21915, 0, 0.003921569, 1, 1,
0.3738511, 1.085817, -1.011711, 0.003921569, 0, 1, 1,
0.3811319, 0.342246, 1.162479, 0.007843138, 0, 1, 1,
0.3869624, 1.288473, -0.560372, 0.01568628, 0, 1, 1,
0.3904631, -0.1528594, 2.018483, 0.01960784, 0, 1, 1,
0.391053, 0.8254891, -0.281152, 0.02745098, 0, 1, 1,
0.3913819, 1.059423, 0.1510882, 0.03137255, 0, 1, 1,
0.3947551, 0.4462528, -0.08704474, 0.03921569, 0, 1, 1,
0.3968291, -0.866429, 2.598256, 0.04313726, 0, 1, 1,
0.3968331, 1.093416, 2.153173, 0.05098039, 0, 1, 1,
0.3998575, -0.4655829, 1.91481, 0.05490196, 0, 1, 1,
0.4008652, 0.5640566, 1.010853, 0.0627451, 0, 1, 1,
0.4070856, -1.868764, 2.385844, 0.06666667, 0, 1, 1,
0.4174707, 0.5490094, -0.04793056, 0.07450981, 0, 1, 1,
0.4177921, -0.307322, 0.1374502, 0.07843138, 0, 1, 1,
0.4205795, 0.03986101, 1.987481, 0.08627451, 0, 1, 1,
0.4231347, -2.103111, 3.758308, 0.09019608, 0, 1, 1,
0.4236558, 1.018501, 2.434534, 0.09803922, 0, 1, 1,
0.4237453, 0.853493, -0.05504465, 0.1058824, 0, 1, 1,
0.4298548, 1.035298, 0.4509637, 0.1098039, 0, 1, 1,
0.4311648, -1.174895, 2.358042, 0.1176471, 0, 1, 1,
0.4372847, 0.4058257, 2.979985, 0.1215686, 0, 1, 1,
0.4382229, -1.655585, 2.492562, 0.1294118, 0, 1, 1,
0.4394146, 0.3616699, 1.630525, 0.1333333, 0, 1, 1,
0.4399668, 1.306636, 1.62212, 0.1411765, 0, 1, 1,
0.4468117, -1.275988, 2.271641, 0.145098, 0, 1, 1,
0.4476924, -0.5486255, 2.977631, 0.1529412, 0, 1, 1,
0.4484512, 1.018598, 0.6134623, 0.1568628, 0, 1, 1,
0.4510621, -1.644909, 1.999733, 0.1647059, 0, 1, 1,
0.4528774, -1.113584, 2.444663, 0.1686275, 0, 1, 1,
0.4529969, 1.202309, -1.325717, 0.1764706, 0, 1, 1,
0.4566199, 2.074384, 1.5208, 0.1803922, 0, 1, 1,
0.4568463, 0.4856793, -0.1524164, 0.1882353, 0, 1, 1,
0.4572697, 0.1217652, 0.7437454, 0.1921569, 0, 1, 1,
0.4652843, 0.6287355, -0.07382145, 0.2, 0, 1, 1,
0.4662103, -1.347426, 2.613801, 0.2078431, 0, 1, 1,
0.4670508, -0.3173022, 2.166051, 0.2117647, 0, 1, 1,
0.4674689, 1.451684, -1.687276, 0.2196078, 0, 1, 1,
0.4682103, -0.204559, 2.492323, 0.2235294, 0, 1, 1,
0.4707977, -0.6160943, 2.92816, 0.2313726, 0, 1, 1,
0.472373, -0.684356, 3.259781, 0.2352941, 0, 1, 1,
0.4733073, 0.716636, 0.1236991, 0.2431373, 0, 1, 1,
0.4765415, -1.801465, 3.206135, 0.2470588, 0, 1, 1,
0.4781259, -1.432064, 2.579878, 0.254902, 0, 1, 1,
0.4882362, -1.998345, 3.104562, 0.2588235, 0, 1, 1,
0.4896589, 0.9322177, 0.06726936, 0.2666667, 0, 1, 1,
0.4901946, 0.7122921, -2.276657, 0.2705882, 0, 1, 1,
0.4936679, -1.86753, 2.426594, 0.2784314, 0, 1, 1,
0.4937766, -0.7945056, 2.592773, 0.282353, 0, 1, 1,
0.4993032, -1.327796, 2.960455, 0.2901961, 0, 1, 1,
0.5022891, -0.6575492, 1.625444, 0.2941177, 0, 1, 1,
0.5113616, -0.3392558, 2.38211, 0.3019608, 0, 1, 1,
0.5139123, -0.4279261, 1.648067, 0.3098039, 0, 1, 1,
0.5152964, -1.393307, 4.216455, 0.3137255, 0, 1, 1,
0.5156726, 0.5928776, 0.1659793, 0.3215686, 0, 1, 1,
0.5177495, -2.605237, 2.00482, 0.3254902, 0, 1, 1,
0.5195721, -0.1282631, 0.467375, 0.3333333, 0, 1, 1,
0.5197126, 1.033254, -0.03984348, 0.3372549, 0, 1, 1,
0.5250325, -0.04816698, 0.92756, 0.345098, 0, 1, 1,
0.5286872, -1.40756, 2.844191, 0.3490196, 0, 1, 1,
0.5287202, -0.4980203, 1.645809, 0.3568628, 0, 1, 1,
0.5312088, -0.1177632, 2.645993, 0.3607843, 0, 1, 1,
0.5433769, -0.3347512, 0.1738516, 0.3686275, 0, 1, 1,
0.5467554, 0.7792857, -0.5034651, 0.372549, 0, 1, 1,
0.5469614, -0.4518881, 1.697258, 0.3803922, 0, 1, 1,
0.5480481, 0.7771861, 1.616351, 0.3843137, 0, 1, 1,
0.5562161, 0.2527021, 0.2396645, 0.3921569, 0, 1, 1,
0.5579219, 0.1402136, 0.8335072, 0.3960784, 0, 1, 1,
0.5607599, -0.3612445, 1.239321, 0.4039216, 0, 1, 1,
0.5612517, 1.642619, 0.9143772, 0.4117647, 0, 1, 1,
0.5669195, -0.6054086, 3.457503, 0.4156863, 0, 1, 1,
0.5677422, -0.2089216, 1.051552, 0.4235294, 0, 1, 1,
0.5679989, 0.1196949, 0.604605, 0.427451, 0, 1, 1,
0.5689489, 0.5200297, 1.473415, 0.4352941, 0, 1, 1,
0.5696773, 1.666728, 0.2690812, 0.4392157, 0, 1, 1,
0.5723266, -0.2178571, 0.4008661, 0.4470588, 0, 1, 1,
0.573565, 0.5009204, 0.6316836, 0.4509804, 0, 1, 1,
0.5766057, -0.6568726, 3.821688, 0.4588235, 0, 1, 1,
0.5776967, -0.8537607, -0.1453307, 0.4627451, 0, 1, 1,
0.5794828, -1.014584, 2.117257, 0.4705882, 0, 1, 1,
0.580178, 0.6810205, -0.6751034, 0.4745098, 0, 1, 1,
0.5804215, -0.3717495, 3.030276, 0.4823529, 0, 1, 1,
0.5943445, -0.4167226, 2.162599, 0.4862745, 0, 1, 1,
0.5975387, -2.342036, 4.08493, 0.4941176, 0, 1, 1,
0.6102639, 0.3775938, 1.927113, 0.5019608, 0, 1, 1,
0.6112537, -1.381935, 4.024815, 0.5058824, 0, 1, 1,
0.6123635, 1.309969, 0.2909062, 0.5137255, 0, 1, 1,
0.6179156, 1.359738, 1.237041, 0.5176471, 0, 1, 1,
0.6243482, -0.707102, 3.650648, 0.5254902, 0, 1, 1,
0.6401238, 0.1685851, 0.8724734, 0.5294118, 0, 1, 1,
0.6421431, -1.237358, 2.459108, 0.5372549, 0, 1, 1,
0.6514304, 1.562288, -1.764764, 0.5411765, 0, 1, 1,
0.6570879, 0.3395956, 1.253785, 0.5490196, 0, 1, 1,
0.6571771, 0.559005, -0.4134149, 0.5529412, 0, 1, 1,
0.6610558, 1.33531, 2.447919, 0.5607843, 0, 1, 1,
0.6617433, -0.5899078, 0.9192502, 0.5647059, 0, 1, 1,
0.6642317, 0.6433906, 0.4921266, 0.572549, 0, 1, 1,
0.6645386, -1.491676, 1.779572, 0.5764706, 0, 1, 1,
0.6649059, 0.1100287, 2.722056, 0.5843138, 0, 1, 1,
0.6660061, 0.5481135, 0.898574, 0.5882353, 0, 1, 1,
0.6773301, 2.669338, 0.6145606, 0.5960785, 0, 1, 1,
0.687973, -1.075795, 2.484939, 0.6039216, 0, 1, 1,
0.6917672, -0.1259293, 0.9525725, 0.6078432, 0, 1, 1,
0.7091425, -0.4028251, 1.877424, 0.6156863, 0, 1, 1,
0.7092944, -0.790278, 3.646513, 0.6196079, 0, 1, 1,
0.7114474, 0.8304371, 2.047652, 0.627451, 0, 1, 1,
0.7120486, -0.3883873, 2.504593, 0.6313726, 0, 1, 1,
0.7138724, 0.8777285, 0.5714006, 0.6392157, 0, 1, 1,
0.7182161, -0.9557585, 2.317325, 0.6431373, 0, 1, 1,
0.7216283, -1.347072, 2.237964, 0.6509804, 0, 1, 1,
0.7283631, -0.7568775, 2.593246, 0.654902, 0, 1, 1,
0.7316926, -0.9172301, 3.010353, 0.6627451, 0, 1, 1,
0.7409022, -0.03194362, -0.2406482, 0.6666667, 0, 1, 1,
0.7414155, -1.32691, 1.273075, 0.6745098, 0, 1, 1,
0.751886, -0.5613129, 2.669564, 0.6784314, 0, 1, 1,
0.7590203, -0.8918914, 2.43582, 0.6862745, 0, 1, 1,
0.7672986, 0.430747, 2.933531, 0.6901961, 0, 1, 1,
0.7735444, 0.006637898, 3.876368, 0.6980392, 0, 1, 1,
0.7814712, -0.6866735, 5.478134, 0.7058824, 0, 1, 1,
0.7844505, 0.2413956, -0.1312477, 0.7098039, 0, 1, 1,
0.7912158, -1.79397, 2.586889, 0.7176471, 0, 1, 1,
0.7913236, 1.000417, -0.2142236, 0.7215686, 0, 1, 1,
0.7938288, 1.516593, 0.7834336, 0.7294118, 0, 1, 1,
0.7965986, 0.07847573, 1.120655, 0.7333333, 0, 1, 1,
0.7986264, -1.188191, 1.844272, 0.7411765, 0, 1, 1,
0.8069308, -0.7296475, 1.758771, 0.7450981, 0, 1, 1,
0.809153, 0.02392339, 3.752739, 0.7529412, 0, 1, 1,
0.8111414, 2.042541, -0.473966, 0.7568628, 0, 1, 1,
0.812632, 0.07603542, 0.7944099, 0.7647059, 0, 1, 1,
0.8164823, -0.1070168, 0.733192, 0.7686275, 0, 1, 1,
0.8219242, -1.750541, 1.87989, 0.7764706, 0, 1, 1,
0.8265818, 1.257614, 0.5379149, 0.7803922, 0, 1, 1,
0.8278702, -0.6034079, 0.8598999, 0.7882353, 0, 1, 1,
0.8283719, -0.6117784, 1.365635, 0.7921569, 0, 1, 1,
0.8335044, -0.02723131, 2.089431, 0.8, 0, 1, 1,
0.8374097, 1.796833, 0.5303042, 0.8078431, 0, 1, 1,
0.8393956, 1.199793, -0.5563768, 0.8117647, 0, 1, 1,
0.8425566, 0.8798043, 1.064456, 0.8196079, 0, 1, 1,
0.8428548, -0.4635259, 1.394117, 0.8235294, 0, 1, 1,
0.8465679, -1.953102, 2.464551, 0.8313726, 0, 1, 1,
0.8558929, 0.05798048, -1.261388, 0.8352941, 0, 1, 1,
0.8561361, -1.289443, 4.353097, 0.8431373, 0, 1, 1,
0.8778209, 1.073728, 0.2870533, 0.8470588, 0, 1, 1,
0.8833938, 0.007520141, 1.898346, 0.854902, 0, 1, 1,
0.8835639, 1.04507, 1.117621, 0.8588235, 0, 1, 1,
0.897498, 0.4914552, -0.06804438, 0.8666667, 0, 1, 1,
0.9020701, 0.9569418, 1.396767, 0.8705882, 0, 1, 1,
0.9032208, -1.48785, 1.464542, 0.8784314, 0, 1, 1,
0.9083277, 1.408085, 1.155193, 0.8823529, 0, 1, 1,
0.925957, 1.456329, 1.077937, 0.8901961, 0, 1, 1,
0.930355, 0.9627317, 1.017165, 0.8941177, 0, 1, 1,
0.9339871, -0.2106304, 2.519985, 0.9019608, 0, 1, 1,
0.9350991, -0.7731473, 1.682231, 0.9098039, 0, 1, 1,
0.9364383, -1.280869, 2.792443, 0.9137255, 0, 1, 1,
0.9379684, -1.852969, 3.564608, 0.9215686, 0, 1, 1,
0.940045, 0.01680253, 2.350399, 0.9254902, 0, 1, 1,
0.9401909, 1.066651, 2.196747, 0.9333333, 0, 1, 1,
0.9420936, 0.2937666, 1.228712, 0.9372549, 0, 1, 1,
0.9506148, -0.4268504, 4.214553, 0.945098, 0, 1, 1,
0.9515085, -2.623936, 2.261112, 0.9490196, 0, 1, 1,
0.9545057, -0.5470623, 2.064285, 0.9568627, 0, 1, 1,
0.9551055, -2.090408, 4.409661, 0.9607843, 0, 1, 1,
0.9583071, 0.3970207, 2.278416, 0.9686275, 0, 1, 1,
0.9618511, -1.237507, 1.123118, 0.972549, 0, 1, 1,
0.9621297, 0.7013697, 1.911509, 0.9803922, 0, 1, 1,
0.9649487, -0.4986969, 3.924813, 0.9843137, 0, 1, 1,
0.9668152, 0.7641778, 2.126122, 0.9921569, 0, 1, 1,
0.9672771, -1.615628, 3.538964, 0.9960784, 0, 1, 1,
0.9693837, 0.5619268, 2.245738, 1, 0, 0.9960784, 1,
0.9734182, -0.9609836, 2.250596, 1, 0, 0.9882353, 1,
0.9750611, 1.935363, 0.2040747, 1, 0, 0.9843137, 1,
0.986958, -1.105439, 2.254987, 1, 0, 0.9764706, 1,
0.9998136, 0.7602236, 0.8506098, 1, 0, 0.972549, 1,
1.00091, -0.06254769, 1.704128, 1, 0, 0.9647059, 1,
1.007772, 1.342232, 1.390089, 1, 0, 0.9607843, 1,
1.016896, -0.4667879, 1.907886, 1, 0, 0.9529412, 1,
1.019082, -0.9324655, 3.591935, 1, 0, 0.9490196, 1,
1.030317, 1.295598, 1.162243, 1, 0, 0.9411765, 1,
1.045853, 1.909633, 0.5369299, 1, 0, 0.9372549, 1,
1.046424, 0.5214917, 0.3289456, 1, 0, 0.9294118, 1,
1.04813, 0.2235207, 0.2368444, 1, 0, 0.9254902, 1,
1.051004, 0.6969671, 0.498202, 1, 0, 0.9176471, 1,
1.061061, -1.502254, 1.745414, 1, 0, 0.9137255, 1,
1.061941, 1.034346, 1.221161, 1, 0, 0.9058824, 1,
1.062073, -0.4865298, 2.134214, 1, 0, 0.9019608, 1,
1.078098, -0.03507826, 1.772326, 1, 0, 0.8941177, 1,
1.08055, -0.340697, 0.6990529, 1, 0, 0.8862745, 1,
1.082623, 0.4448623, -0.9160303, 1, 0, 0.8823529, 1,
1.08315, -1.444371, 3.694504, 1, 0, 0.8745098, 1,
1.08493, 0.3802076, 1.414374, 1, 0, 0.8705882, 1,
1.087547, 0.8057215, 1.560149, 1, 0, 0.8627451, 1,
1.09336, -0.1085666, -0.1577485, 1, 0, 0.8588235, 1,
1.09366, 0.1205497, 0.3986954, 1, 0, 0.8509804, 1,
1.096591, 2.025146, -0.2478009, 1, 0, 0.8470588, 1,
1.111851, 0.3467521, 1.745843, 1, 0, 0.8392157, 1,
1.113101, 0.5971731, 1.5804, 1, 0, 0.8352941, 1,
1.121957, 0.3329007, -0.6324561, 1, 0, 0.827451, 1,
1.122441, -1.73901, 4.741235, 1, 0, 0.8235294, 1,
1.126311, -1.382407, 2.374836, 1, 0, 0.8156863, 1,
1.129905, 0.3193586, -0.0942535, 1, 0, 0.8117647, 1,
1.133831, 0.4181618, -1.704041, 1, 0, 0.8039216, 1,
1.139936, 0.1223844, 0.8065225, 1, 0, 0.7960784, 1,
1.151875, -0.3527413, -0.8216625, 1, 0, 0.7921569, 1,
1.152881, -1.172708, 0.5515412, 1, 0, 0.7843137, 1,
1.153416, -0.126155, 3.04439, 1, 0, 0.7803922, 1,
1.159166, -1.655135, 3.373675, 1, 0, 0.772549, 1,
1.159825, 2.080664, 0.2380406, 1, 0, 0.7686275, 1,
1.160565, -1.399465, 0.5423078, 1, 0, 0.7607843, 1,
1.161366, 0.6063415, -0.7054711, 1, 0, 0.7568628, 1,
1.171676, -1.275518, 2.616658, 1, 0, 0.7490196, 1,
1.179546, 0.7852304, 1.986227, 1, 0, 0.7450981, 1,
1.18068, -0.4270598, 1.419482, 1, 0, 0.7372549, 1,
1.183319, 0.1556204, 2.378419, 1, 0, 0.7333333, 1,
1.193155, -0.5711188, 2.388974, 1, 0, 0.7254902, 1,
1.197577, -1.129731, 1.265705, 1, 0, 0.7215686, 1,
1.199895, -0.1989595, 1.949804, 1, 0, 0.7137255, 1,
1.20343, 0.510289, 1.650843, 1, 0, 0.7098039, 1,
1.205072, 0.1582307, 2.998352, 1, 0, 0.7019608, 1,
1.209579, 0.8610566, 2.643335, 1, 0, 0.6941177, 1,
1.219624, 2.022615, 0.0332321, 1, 0, 0.6901961, 1,
1.22506, -0.6950181, 0.2507057, 1, 0, 0.682353, 1,
1.225275, 1.028659, -1.184101, 1, 0, 0.6784314, 1,
1.226424, 1.139214, 2.423063, 1, 0, 0.6705883, 1,
1.229234, 1.047657, 1.113231, 1, 0, 0.6666667, 1,
1.236108, 0.4835275, 1.415666, 1, 0, 0.6588235, 1,
1.237196, 0.631421, 1.700728, 1, 0, 0.654902, 1,
1.237727, 0.3168698, 2.16684, 1, 0, 0.6470588, 1,
1.240755, 0.02365023, 2.178912, 1, 0, 0.6431373, 1,
1.241205, 1.035287, 1.282409, 1, 0, 0.6352941, 1,
1.246715, -0.8453564, 0.818336, 1, 0, 0.6313726, 1,
1.264335, 1.839005, -0.5530124, 1, 0, 0.6235294, 1,
1.282691, -0.2953624, 1.024531, 1, 0, 0.6196079, 1,
1.285654, 1.685331, 0.8558743, 1, 0, 0.6117647, 1,
1.286555, 1.045698, 0.348407, 1, 0, 0.6078432, 1,
1.291888, -1.078739, 2.303679, 1, 0, 0.6, 1,
1.298921, 1.424329, 1.598701, 1, 0, 0.5921569, 1,
1.299082, 0.7049438, 0.4389274, 1, 0, 0.5882353, 1,
1.299349, -0.6110072, 1.83096, 1, 0, 0.5803922, 1,
1.308953, -1.654387, 2.127561, 1, 0, 0.5764706, 1,
1.310114, 0.5628839, 1.293022, 1, 0, 0.5686275, 1,
1.310374, 1.874263, -0.02985701, 1, 0, 0.5647059, 1,
1.311993, -1.141696, 2.435318, 1, 0, 0.5568628, 1,
1.315331, 0.5722852, 1.077231, 1, 0, 0.5529412, 1,
1.316788, 0.2892447, 0.4524883, 1, 0, 0.5450981, 1,
1.318956, 0.3998948, 0.03741148, 1, 0, 0.5411765, 1,
1.334206, 0.4059155, 1.04346, 1, 0, 0.5333334, 1,
1.339708, -1.652459, 1.256928, 1, 0, 0.5294118, 1,
1.340504, 2.106718, -0.3643968, 1, 0, 0.5215687, 1,
1.342774, 1.008296, -0.04960106, 1, 0, 0.5176471, 1,
1.358028, -0.1500584, 2.315638, 1, 0, 0.509804, 1,
1.358088, -0.2097454, 0.9115674, 1, 0, 0.5058824, 1,
1.360093, -0.8712433, 1.230922, 1, 0, 0.4980392, 1,
1.361354, 0.8279342, 1.845209, 1, 0, 0.4901961, 1,
1.362987, 0.2543274, 1.488833, 1, 0, 0.4862745, 1,
1.364617, 1.786278, 0.5320166, 1, 0, 0.4784314, 1,
1.366173, 0.7975768, 2.392168, 1, 0, 0.4745098, 1,
1.369706, 0.3016523, 1.179866, 1, 0, 0.4666667, 1,
1.376375, 1.113177, 0.3418877, 1, 0, 0.4627451, 1,
1.380735, -1.686447, 2.640849, 1, 0, 0.454902, 1,
1.388553, 1.211609, -1.078598, 1, 0, 0.4509804, 1,
1.391412, 0.5943778, 1.178107, 1, 0, 0.4431373, 1,
1.393251, 0.5524461, 0.9539065, 1, 0, 0.4392157, 1,
1.417797, 2.155723, 1.007814, 1, 0, 0.4313726, 1,
1.430482, -0.4378358, 0.7418307, 1, 0, 0.427451, 1,
1.430991, -1.097139, 0.7424534, 1, 0, 0.4196078, 1,
1.439029, 0.2475019, 0.4152093, 1, 0, 0.4156863, 1,
1.439451, 0.7332082, -0.4401696, 1, 0, 0.4078431, 1,
1.455051, -1.220685, 1.988292, 1, 0, 0.4039216, 1,
1.455809, 0.09715985, 2.312421, 1, 0, 0.3960784, 1,
1.470039, 0.3698457, 0.1418452, 1, 0, 0.3882353, 1,
1.502202, -0.212145, 1.872737, 1, 0, 0.3843137, 1,
1.504094, 0.3679653, 0.4304856, 1, 0, 0.3764706, 1,
1.507878, -0.3241682, 0.1427352, 1, 0, 0.372549, 1,
1.55133, -0.4368921, 2.324519, 1, 0, 0.3647059, 1,
1.586972, 0.1710935, 1.469193, 1, 0, 0.3607843, 1,
1.58972, 0.04279666, 2.61445, 1, 0, 0.3529412, 1,
1.594445, 1.245985, -0.1642291, 1, 0, 0.3490196, 1,
1.60122, 1.233236, 1.595817, 1, 0, 0.3411765, 1,
1.607011, -1.169319, 2.264528, 1, 0, 0.3372549, 1,
1.609746, -0.4003906, 1.090518, 1, 0, 0.3294118, 1,
1.641726, 0.8770612, 0.6248507, 1, 0, 0.3254902, 1,
1.641761, 0.2205514, 2.353757, 1, 0, 0.3176471, 1,
1.647497, -1.0655, 2.580046, 1, 0, 0.3137255, 1,
1.651689, -0.1104976, -0.4828362, 1, 0, 0.3058824, 1,
1.652476, 1.101626, 1.473405, 1, 0, 0.2980392, 1,
1.674441, -0.3838983, 1.559853, 1, 0, 0.2941177, 1,
1.677687, 0.2987438, 1.496821, 1, 0, 0.2862745, 1,
1.710344, -0.05449681, 0.8943895, 1, 0, 0.282353, 1,
1.717107, 1.009006, -0.7667589, 1, 0, 0.2745098, 1,
1.71866, 0.2491839, 1.693411, 1, 0, 0.2705882, 1,
1.734452, -0.8381586, 1.557432, 1, 0, 0.2627451, 1,
1.74157, -0.6867561, 3.768543, 1, 0, 0.2588235, 1,
1.752125, -0.07512286, 1.529445, 1, 0, 0.2509804, 1,
1.758253, 0.6416961, -0.02366279, 1, 0, 0.2470588, 1,
1.76354, 0.0227859, 1.973265, 1, 0, 0.2392157, 1,
1.775068, 0.3533232, 1.93766, 1, 0, 0.2352941, 1,
1.780496, 0.4675898, 2.550818, 1, 0, 0.227451, 1,
1.802858, 1.70115, 0.3086138, 1, 0, 0.2235294, 1,
1.833487, 2.028953, -0.6292999, 1, 0, 0.2156863, 1,
1.842995, -0.9762628, 1.646798, 1, 0, 0.2117647, 1,
1.870624, -1.095113, 1.700055, 1, 0, 0.2039216, 1,
1.947033, 0.5985533, 1.584277, 1, 0, 0.1960784, 1,
2.014091, -0.8753306, 2.75603, 1, 0, 0.1921569, 1,
2.050843, -0.4238825, 0.4626111, 1, 0, 0.1843137, 1,
2.080584, 0.6438475, 1.13984, 1, 0, 0.1803922, 1,
2.080853, -0.1770205, 1.136096, 1, 0, 0.172549, 1,
2.096466, -0.1608619, 1.875995, 1, 0, 0.1686275, 1,
2.114818, 0.906862, -0.3773552, 1, 0, 0.1607843, 1,
2.123485, 1.308009, 1.546552, 1, 0, 0.1568628, 1,
2.141227, -0.04977236, 1.384202, 1, 0, 0.1490196, 1,
2.156945, -0.2631083, 0.9178476, 1, 0, 0.145098, 1,
2.157015, -1.897104, 1.679861, 1, 0, 0.1372549, 1,
2.179332, 0.3444268, -0.2629651, 1, 0, 0.1333333, 1,
2.206972, 0.6761647, 0.3337555, 1, 0, 0.1254902, 1,
2.21192, 0.4032691, 3.036247, 1, 0, 0.1215686, 1,
2.257073, -0.3675723, 0.1093891, 1, 0, 0.1137255, 1,
2.266778, 1.532621, 1.014977, 1, 0, 0.1098039, 1,
2.283038, 1.889356, -1.714392, 1, 0, 0.1019608, 1,
2.303162, 0.1244671, 2.350814, 1, 0, 0.09411765, 1,
2.304178, 0.8911704, 0.7558633, 1, 0, 0.09019608, 1,
2.34925, -1.254637, 2.395468, 1, 0, 0.08235294, 1,
2.471576, 0.674209, 2.055118, 1, 0, 0.07843138, 1,
2.478208, -0.2981509, 1.804794, 1, 0, 0.07058824, 1,
2.493006, 0.2860395, 0.5609504, 1, 0, 0.06666667, 1,
2.548973, -1.456642, 2.563276, 1, 0, 0.05882353, 1,
2.591926, 0.2205128, 1.381383, 1, 0, 0.05490196, 1,
2.63285, 0.1480564, 2.471777, 1, 0, 0.04705882, 1,
2.637266, -0.5128028, 1.526761, 1, 0, 0.04313726, 1,
2.74707, -0.8698698, 2.734141, 1, 0, 0.03529412, 1,
2.764174, -0.87662, 3.042449, 1, 0, 0.03137255, 1,
2.896023, 0.6383771, 2.496035, 1, 0, 0.02352941, 1,
2.940024, -0.004159614, 0.2910883, 1, 0, 0.01960784, 1,
2.945333, -0.2701308, 2.600039, 1, 0, 0.01176471, 1,
3.640423, 1.499199, -0.6620817, 1, 0, 0.007843138, 1
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
0.299245, -3.781388, -8.13688, 0, -0.5, 0.5, 0.5,
0.299245, -3.781388, -8.13688, 1, -0.5, 0.5, 0.5,
0.299245, -3.781388, -8.13688, 1, 1.5, 0.5, 0.5,
0.299245, -3.781388, -8.13688, 0, 1.5, 0.5, 0.5
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
-4.174593, 0.0404439, -8.13688, 0, -0.5, 0.5, 0.5,
-4.174593, 0.0404439, -8.13688, 1, -0.5, 0.5, 0.5,
-4.174593, 0.0404439, -8.13688, 1, 1.5, 0.5, 0.5,
-4.174593, 0.0404439, -8.13688, 0, 1.5, 0.5, 0.5
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
-4.174593, -3.781388, -0.3427355, 0, -0.5, 0.5, 0.5,
-4.174593, -3.781388, -0.3427355, 1, -0.5, 0.5, 0.5,
-4.174593, -3.781388, -0.3427355, 1, 1.5, 0.5, 0.5,
-4.174593, -3.781388, -0.3427355, 0, 1.5, 0.5, 0.5
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
-3, -2.899426, -6.338231,
3, -2.899426, -6.338231,
-3, -2.899426, -6.338231,
-3, -3.04642, -6.638006,
-2, -2.899426, -6.338231,
-2, -3.04642, -6.638006,
-1, -2.899426, -6.338231,
-1, -3.04642, -6.638006,
0, -2.899426, -6.338231,
0, -3.04642, -6.638006,
1, -2.899426, -6.338231,
1, -3.04642, -6.638006,
2, -2.899426, -6.338231,
2, -3.04642, -6.638006,
3, -2.899426, -6.338231,
3, -3.04642, -6.638006
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
-3, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
-3, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
-3, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
-3, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
-2, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
-2, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
-2, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
-2, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
-1, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
-1, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
-1, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
-1, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
0, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
0, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
0, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
0, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
1, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
1, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
1, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
1, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
2, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
2, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
2, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
2, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5,
3, -3.340407, -7.237556, 0, -0.5, 0.5, 0.5,
3, -3.340407, -7.237556, 1, -0.5, 0.5, 0.5,
3, -3.340407, -7.237556, 1, 1.5, 0.5, 0.5,
3, -3.340407, -7.237556, 0, 1.5, 0.5, 0.5
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
-3.142169, -2, -6.338231,
-3.142169, 2, -6.338231,
-3.142169, -2, -6.338231,
-3.314239, -2, -6.638006,
-3.142169, -1, -6.338231,
-3.314239, -1, -6.638006,
-3.142169, 0, -6.338231,
-3.314239, 0, -6.638006,
-3.142169, 1, -6.338231,
-3.314239, 1, -6.638006,
-3.142169, 2, -6.338231,
-3.314239, 2, -6.638006
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
-3.658381, -2, -7.237556, 0, -0.5, 0.5, 0.5,
-3.658381, -2, -7.237556, 1, -0.5, 0.5, 0.5,
-3.658381, -2, -7.237556, 1, 1.5, 0.5, 0.5,
-3.658381, -2, -7.237556, 0, 1.5, 0.5, 0.5,
-3.658381, -1, -7.237556, 0, -0.5, 0.5, 0.5,
-3.658381, -1, -7.237556, 1, -0.5, 0.5, 0.5,
-3.658381, -1, -7.237556, 1, 1.5, 0.5, 0.5,
-3.658381, -1, -7.237556, 0, 1.5, 0.5, 0.5,
-3.658381, 0, -7.237556, 0, -0.5, 0.5, 0.5,
-3.658381, 0, -7.237556, 1, -0.5, 0.5, 0.5,
-3.658381, 0, -7.237556, 1, 1.5, 0.5, 0.5,
-3.658381, 0, -7.237556, 0, 1.5, 0.5, 0.5,
-3.658381, 1, -7.237556, 0, -0.5, 0.5, 0.5,
-3.658381, 1, -7.237556, 1, -0.5, 0.5, 0.5,
-3.658381, 1, -7.237556, 1, 1.5, 0.5, 0.5,
-3.658381, 1, -7.237556, 0, 1.5, 0.5, 0.5,
-3.658381, 2, -7.237556, 0, -0.5, 0.5, 0.5,
-3.658381, 2, -7.237556, 1, -0.5, 0.5, 0.5,
-3.658381, 2, -7.237556, 1, 1.5, 0.5, 0.5,
-3.658381, 2, -7.237556, 0, 1.5, 0.5, 0.5
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
-3.142169, -2.899426, -6,
-3.142169, -2.899426, 4,
-3.142169, -2.899426, -6,
-3.314239, -3.04642, -6,
-3.142169, -2.899426, -4,
-3.314239, -3.04642, -4,
-3.142169, -2.899426, -2,
-3.314239, -3.04642, -2,
-3.142169, -2.899426, 0,
-3.314239, -3.04642, 0,
-3.142169, -2.899426, 2,
-3.314239, -3.04642, 2,
-3.142169, -2.899426, 4,
-3.314239, -3.04642, 4
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
"-6",
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
-3.658381, -3.340407, -6, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -6, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -6, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, -6, 0, 1.5, 0.5, 0.5,
-3.658381, -3.340407, -4, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -4, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -4, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, -4, 0, 1.5, 0.5, 0.5,
-3.658381, -3.340407, -2, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -2, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, -2, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, -2, 0, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 0, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 0, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 0, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 0, 0, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 2, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 2, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 2, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 2, 0, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 4, 0, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 4, 1, -0.5, 0.5, 0.5,
-3.658381, -3.340407, 4, 1, 1.5, 0.5, 0.5,
-3.658381, -3.340407, 4, 0, 1.5, 0.5, 0.5
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
-3.142169, -2.899426, -6.338231,
-3.142169, 2.980314, -6.338231,
-3.142169, -2.899426, 5.65276,
-3.142169, 2.980314, 5.65276,
-3.142169, -2.899426, -6.338231,
-3.142169, -2.899426, 5.65276,
-3.142169, 2.980314, -6.338231,
-3.142169, 2.980314, 5.65276,
-3.142169, -2.899426, -6.338231,
3.740659, -2.899426, -6.338231,
-3.142169, -2.899426, 5.65276,
3.740659, -2.899426, 5.65276,
-3.142169, 2.980314, -6.338231,
3.740659, 2.980314, -6.338231,
-3.142169, 2.980314, 5.65276,
3.740659, 2.980314, 5.65276,
3.740659, -2.899426, -6.338231,
3.740659, 2.980314, -6.338231,
3.740659, -2.899426, 5.65276,
3.740659, 2.980314, 5.65276,
3.740659, -2.899426, -6.338231,
3.740659, -2.899426, 5.65276,
3.740659, 2.980314, -6.338231,
3.740659, 2.980314, 5.65276
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
var radius = 8.022666;
var distance = 35.69375;
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
mvMatrix.translate( -0.299245, -0.0404439, 0.3427355 );
mvMatrix.scale( 1.260276, 1.47528, 0.7233983 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69375);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


