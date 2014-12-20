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
-3.383537, 0.1014483, 0.03667583, 1, 0, 0, 1,
-2.898231, -0.5400605, -1.340941, 1, 0.007843138, 0, 1,
-2.878336, 0.3126002, 0.4726371, 1, 0.01176471, 0, 1,
-2.753119, 1.713453, -0.6203248, 1, 0.01960784, 0, 1,
-2.68429, -0.5309273, -0.4332051, 1, 0.02352941, 0, 1,
-2.672403, -0.5375261, -1.336516, 1, 0.03137255, 0, 1,
-2.551633, 0.8538383, 0.5536127, 1, 0.03529412, 0, 1,
-2.445319, -1.086686, -1.783787, 1, 0.04313726, 0, 1,
-2.414609, -1.665555, -0.7662732, 1, 0.04705882, 0, 1,
-2.373688, -1.587905, -3.381086, 1, 0.05490196, 0, 1,
-2.344377, -1.521882, -1.488688, 1, 0.05882353, 0, 1,
-2.27511, 2.254185, -1.342458, 1, 0.06666667, 0, 1,
-2.22551, 0.6332101, -0.4157998, 1, 0.07058824, 0, 1,
-2.206605, -0.1336147, -0.3059386, 1, 0.07843138, 0, 1,
-2.153638, 0.5928537, -1.28906, 1, 0.08235294, 0, 1,
-2.130091, 1.261704, -0.2395328, 1, 0.09019608, 0, 1,
-2.110436, 0.02060562, -3.172638, 1, 0.09411765, 0, 1,
-2.047143, 0.7509624, -2.926046, 1, 0.1019608, 0, 1,
-2.039039, 0.009669015, -0.911092, 1, 0.1098039, 0, 1,
-2.035228, -0.01638269, -2.193248, 1, 0.1137255, 0, 1,
-1.991718, -3.908624, -3.177139, 1, 0.1215686, 0, 1,
-1.988711, -1.295336, -4.305622, 1, 0.1254902, 0, 1,
-1.958235, 0.29135, -1.278836, 1, 0.1333333, 0, 1,
-1.94454, -0.1784246, -2.968635, 1, 0.1372549, 0, 1,
-1.93359, -1.008523, -2.318542, 1, 0.145098, 0, 1,
-1.909914, -0.3707784, -1.632073, 1, 0.1490196, 0, 1,
-1.897735, -1.020979, -3.055594, 1, 0.1568628, 0, 1,
-1.882197, 0.6863229, -2.974542, 1, 0.1607843, 0, 1,
-1.877688, -1.310393, -2.372606, 1, 0.1686275, 0, 1,
-1.877283, 0.5797755, -1.367684, 1, 0.172549, 0, 1,
-1.859897, 0.5784503, -0.5501282, 1, 0.1803922, 0, 1,
-1.858491, 2.130399, -0.4929565, 1, 0.1843137, 0, 1,
-1.835518, 1.064041, -0.7869338, 1, 0.1921569, 0, 1,
-1.822637, -0.5748163, -3.344289, 1, 0.1960784, 0, 1,
-1.821653, -0.4110448, -2.142206, 1, 0.2039216, 0, 1,
-1.804458, 0.403901, -2.006114, 1, 0.2117647, 0, 1,
-1.796288, 0.3158394, -0.9929971, 1, 0.2156863, 0, 1,
-1.793244, 0.1250095, -0.941668, 1, 0.2235294, 0, 1,
-1.771081, 1.42497, -3.296227, 1, 0.227451, 0, 1,
-1.769866, -0.1008451, -3.116302, 1, 0.2352941, 0, 1,
-1.769852, -0.7018361, -4.192856, 1, 0.2392157, 0, 1,
-1.761884, 1.597951, -0.4597547, 1, 0.2470588, 0, 1,
-1.760005, -1.158971, -1.610857, 1, 0.2509804, 0, 1,
-1.750966, 0.01730527, -3.448725, 1, 0.2588235, 0, 1,
-1.74354, -0.7732593, -3.594367, 1, 0.2627451, 0, 1,
-1.734302, -0.2937765, -1.573193, 1, 0.2705882, 0, 1,
-1.711972, -0.8483254, -1.588869, 1, 0.2745098, 0, 1,
-1.710412, 0.781171, -0.4839387, 1, 0.282353, 0, 1,
-1.703958, 0.6761262, -2.504534, 1, 0.2862745, 0, 1,
-1.701425, -0.02057347, -2.185364, 1, 0.2941177, 0, 1,
-1.669104, 0.005588661, -2.046101, 1, 0.3019608, 0, 1,
-1.665745, 0.1781223, -2.295679, 1, 0.3058824, 0, 1,
-1.628448, 1.14502, -1.412936, 1, 0.3137255, 0, 1,
-1.622303, -0.4461254, -2.083502, 1, 0.3176471, 0, 1,
-1.594603, 0.6029834, -1.855674, 1, 0.3254902, 0, 1,
-1.588481, 0.8930321, -1.933972, 1, 0.3294118, 0, 1,
-1.585277, 0.2343177, -1.554691, 1, 0.3372549, 0, 1,
-1.58277, -0.4376296, -1.218261, 1, 0.3411765, 0, 1,
-1.580332, -0.2427336, -1.833848, 1, 0.3490196, 0, 1,
-1.57751, 0.9735695, -1.682628, 1, 0.3529412, 0, 1,
-1.568276, -0.3057943, -1.721838, 1, 0.3607843, 0, 1,
-1.55199, -1.189988, 0.7403077, 1, 0.3647059, 0, 1,
-1.549662, 0.3216536, -0.8880791, 1, 0.372549, 0, 1,
-1.547023, 0.1047648, -0.5524546, 1, 0.3764706, 0, 1,
-1.539928, -0.1249878, -1.857011, 1, 0.3843137, 0, 1,
-1.533674, 0.5070802, 2.362384, 1, 0.3882353, 0, 1,
-1.532614, -1.085597, -1.701032, 1, 0.3960784, 0, 1,
-1.531631, -0.1218153, -0.1031148, 1, 0.4039216, 0, 1,
-1.507951, -1.485339, -2.101591, 1, 0.4078431, 0, 1,
-1.491848, 0.8426905, -0.4760171, 1, 0.4156863, 0, 1,
-1.486762, -0.0137067, -2.672793, 1, 0.4196078, 0, 1,
-1.486272, -1.512873, -1.115188, 1, 0.427451, 0, 1,
-1.476146, -0.8998418, -2.755281, 1, 0.4313726, 0, 1,
-1.47549, -1.665448, -5.250534, 1, 0.4392157, 0, 1,
-1.455691, 1.935997, 1.54438, 1, 0.4431373, 0, 1,
-1.450547, -0.9743767, -3.266006, 1, 0.4509804, 0, 1,
-1.437948, -0.2455274, -1.634719, 1, 0.454902, 0, 1,
-1.437725, 0.2704106, 1.618997, 1, 0.4627451, 0, 1,
-1.437366, 1.324672, 1.204927, 1, 0.4666667, 0, 1,
-1.426466, 0.1148058, -0.4210092, 1, 0.4745098, 0, 1,
-1.425812, 0.9050286, -1.535835, 1, 0.4784314, 0, 1,
-1.409749, 1.482275, -2.127286, 1, 0.4862745, 0, 1,
-1.407983, -1.649005, -2.879599, 1, 0.4901961, 0, 1,
-1.406073, -1.886742, -1.628538, 1, 0.4980392, 0, 1,
-1.406009, 0.1629657, -1.676477, 1, 0.5058824, 0, 1,
-1.400402, -0.5783979, -2.480681, 1, 0.509804, 0, 1,
-1.399135, 1.227076, -1.413163, 1, 0.5176471, 0, 1,
-1.35781, 2.881125, -0.2279516, 1, 0.5215687, 0, 1,
-1.357059, 0.4495312, -1.901828, 1, 0.5294118, 0, 1,
-1.351104, -0.7859097, -2.306206, 1, 0.5333334, 0, 1,
-1.350303, -1.857726, -2.476143, 1, 0.5411765, 0, 1,
-1.338176, 0.01341726, -1.215996, 1, 0.5450981, 0, 1,
-1.329246, -0.06811947, -3.456295, 1, 0.5529412, 0, 1,
-1.320809, -0.5338445, -3.130041, 1, 0.5568628, 0, 1,
-1.304868, -0.1422891, -2.522561, 1, 0.5647059, 0, 1,
-1.304792, -0.4055703, -1.439592, 1, 0.5686275, 0, 1,
-1.30341, -0.09545156, -1.527918, 1, 0.5764706, 0, 1,
-1.284281, 1.11068, 0.4360926, 1, 0.5803922, 0, 1,
-1.277212, -1.054577, -2.949365, 1, 0.5882353, 0, 1,
-1.275954, -1.497143, -3.175852, 1, 0.5921569, 0, 1,
-1.254025, -0.9661799, -4.497789, 1, 0.6, 0, 1,
-1.244625, -1.803707, -3.500977, 1, 0.6078432, 0, 1,
-1.239423, 0.8453859, -0.6345942, 1, 0.6117647, 0, 1,
-1.235959, -0.4887964, 0.01342031, 1, 0.6196079, 0, 1,
-1.229504, -1.064541, -1.762888, 1, 0.6235294, 0, 1,
-1.226572, -0.5470415, -1.823084, 1, 0.6313726, 0, 1,
-1.226369, 1.765033, -0.152855, 1, 0.6352941, 0, 1,
-1.225188, 1.456814, -1.432211, 1, 0.6431373, 0, 1,
-1.214278, -1.10102, -1.293904, 1, 0.6470588, 0, 1,
-1.213074, -0.9996958, -1.614413, 1, 0.654902, 0, 1,
-1.204767, 0.9437438, -0.7000656, 1, 0.6588235, 0, 1,
-1.204336, -0.5903351, -1.924601, 1, 0.6666667, 0, 1,
-1.203331, 0.3942655, 0.0733756, 1, 0.6705883, 0, 1,
-1.20242, 0.3080169, -1.383421, 1, 0.6784314, 0, 1,
-1.197323, -0.409897, -3.384475, 1, 0.682353, 0, 1,
-1.194282, 1.764377, -1.937051, 1, 0.6901961, 0, 1,
-1.188103, 0.8976062, -2.968369, 1, 0.6941177, 0, 1,
-1.184987, -1.363938, -4.500277, 1, 0.7019608, 0, 1,
-1.184779, 1.113898, 0.1078016, 1, 0.7098039, 0, 1,
-1.178571, -2.494408, -3.058408, 1, 0.7137255, 0, 1,
-1.178333, -0.866129, -1.441371, 1, 0.7215686, 0, 1,
-1.172447, -0.6068692, -2.449644, 1, 0.7254902, 0, 1,
-1.171337, -0.4955849, -1.904788, 1, 0.7333333, 0, 1,
-1.168438, -1.31509, -3.217428, 1, 0.7372549, 0, 1,
-1.167475, -1.068256, -3.313178, 1, 0.7450981, 0, 1,
-1.158304, 0.5421453, -1.226701, 1, 0.7490196, 0, 1,
-1.15428, 1.357565, -1.712826, 1, 0.7568628, 0, 1,
-1.137711, -0.1280999, -1.515944, 1, 0.7607843, 0, 1,
-1.130819, -1.326029, -1.27177, 1, 0.7686275, 0, 1,
-1.116016, 0.6972572, -0.2535239, 1, 0.772549, 0, 1,
-1.115581, 0.3975552, -1.763216, 1, 0.7803922, 0, 1,
-1.114468, -0.5237079, -3.063096, 1, 0.7843137, 0, 1,
-1.113972, 0.07731883, -1.342644, 1, 0.7921569, 0, 1,
-1.106576, 1.109965, 0.6609361, 1, 0.7960784, 0, 1,
-1.106532, 0.2341774, 0.7668946, 1, 0.8039216, 0, 1,
-1.10563, 1.169213, -1.966959, 1, 0.8117647, 0, 1,
-1.097065, -1.744933, -3.605212, 1, 0.8156863, 0, 1,
-1.081743, 0.401855, -2.274194, 1, 0.8235294, 0, 1,
-1.081408, 0.3776558, -1.622228, 1, 0.827451, 0, 1,
-1.069866, 0.5514173, -2.583419, 1, 0.8352941, 0, 1,
-1.065938, 0.05776481, -1.139356, 1, 0.8392157, 0, 1,
-1.058417, -0.1387948, -0.9108942, 1, 0.8470588, 0, 1,
-1.053841, -1.250382, -3.183282, 1, 0.8509804, 0, 1,
-1.044708, 0.2924769, -1.002169, 1, 0.8588235, 0, 1,
-1.035208, 1.06955, -1.283702, 1, 0.8627451, 0, 1,
-1.033359, 1.402872, -1.894836, 1, 0.8705882, 0, 1,
-1.03125, 0.3723042, -1.710586, 1, 0.8745098, 0, 1,
-1.02851, 1.527672, -3.207291, 1, 0.8823529, 0, 1,
-1.023342, 1.241043, 0.3705655, 1, 0.8862745, 0, 1,
-1.023034, 0.2431456, -3.350531, 1, 0.8941177, 0, 1,
-1.018523, -0.9097579, -3.415329, 1, 0.8980392, 0, 1,
-1.016331, 2.108829, -1.375107, 1, 0.9058824, 0, 1,
-1.009352, -0.4743985, -2.100225, 1, 0.9137255, 0, 1,
-1.008504, -0.8411563, -2.314521, 1, 0.9176471, 0, 1,
-1.007145, 0.4941047, -1.114428, 1, 0.9254902, 0, 1,
-0.9930074, 0.04038871, -1.618395, 1, 0.9294118, 0, 1,
-0.9850631, -0.413047, -3.905761, 1, 0.9372549, 0, 1,
-0.9792215, -1.188385, -1.432994, 1, 0.9411765, 0, 1,
-0.9762362, 1.168458, 0.3355244, 1, 0.9490196, 0, 1,
-0.9697948, 1.176243, -1.084489, 1, 0.9529412, 0, 1,
-0.9665979, 1.009866, -0.1656745, 1, 0.9607843, 0, 1,
-0.9639345, -2.366031, -3.455753, 1, 0.9647059, 0, 1,
-0.9617285, -0.2468199, -0.6764373, 1, 0.972549, 0, 1,
-0.9558755, -1.413128, -2.865553, 1, 0.9764706, 0, 1,
-0.9534674, 0.5385163, -0.3701452, 1, 0.9843137, 0, 1,
-0.951449, 1.06392, -1.183249, 1, 0.9882353, 0, 1,
-0.9514309, 0.9162173, -0.7328529, 1, 0.9960784, 0, 1,
-0.9508228, -1.226965, -1.89277, 0.9960784, 1, 0, 1,
-0.949246, 0.1508649, -1.629998, 0.9921569, 1, 0, 1,
-0.9462084, 0.1684192, -2.330826, 0.9843137, 1, 0, 1,
-0.9408541, -0.003134295, -2.228683, 0.9803922, 1, 0, 1,
-0.937789, -0.07411461, -0.5702697, 0.972549, 1, 0, 1,
-0.9355084, -0.7417178, -1.042496, 0.9686275, 1, 0, 1,
-0.9330939, -1.261665, -1.648748, 0.9607843, 1, 0, 1,
-0.931541, 0.7928252, -1.409657, 0.9568627, 1, 0, 1,
-0.9309874, -0.4686803, -0.6905963, 0.9490196, 1, 0, 1,
-0.9304376, -1.416425, -2.413685, 0.945098, 1, 0, 1,
-0.9107108, 0.8716046, -0.5305358, 0.9372549, 1, 0, 1,
-0.9073214, 1.069077, -1.22876, 0.9333333, 1, 0, 1,
-0.9072483, 1.553467, 0.6285976, 0.9254902, 1, 0, 1,
-0.9010279, -1.105869, -1.889351, 0.9215686, 1, 0, 1,
-0.8930051, -0.9526147, -1.476073, 0.9137255, 1, 0, 1,
-0.892337, -0.01438054, 0.4592552, 0.9098039, 1, 0, 1,
-0.8871822, 0.1068189, -1.289802, 0.9019608, 1, 0, 1,
-0.8856395, -0.9102485, -2.225792, 0.8941177, 1, 0, 1,
-0.8774943, -0.8730723, -2.069411, 0.8901961, 1, 0, 1,
-0.8755719, 1.392398, -0.5030637, 0.8823529, 1, 0, 1,
-0.8750417, 1.252699, -0.66811, 0.8784314, 1, 0, 1,
-0.8722527, -0.4323721, -0.8562679, 0.8705882, 1, 0, 1,
-0.8721384, -0.7358029, -1.958844, 0.8666667, 1, 0, 1,
-0.8681623, -0.3319924, -1.694746, 0.8588235, 1, 0, 1,
-0.8661427, 0.9347275, -0.3672541, 0.854902, 1, 0, 1,
-0.8660058, -0.9614096, -3.478803, 0.8470588, 1, 0, 1,
-0.8653321, -0.2580586, -1.440196, 0.8431373, 1, 0, 1,
-0.8578286, -0.5274454, -2.247852, 0.8352941, 1, 0, 1,
-0.8561139, 1.540789, 0.6885331, 0.8313726, 1, 0, 1,
-0.8558241, -1.163885, -4.62561, 0.8235294, 1, 0, 1,
-0.8505275, -1.531169, -3.033051, 0.8196079, 1, 0, 1,
-0.8476173, -1.507547, -2.315865, 0.8117647, 1, 0, 1,
-0.8467396, 0.350866, -1.108383, 0.8078431, 1, 0, 1,
-0.8440714, 0.1985804, -1.475083, 0.8, 1, 0, 1,
-0.8434975, -0.3675066, -1.982188, 0.7921569, 1, 0, 1,
-0.842726, 0.3426021, -0.6948128, 0.7882353, 1, 0, 1,
-0.8424079, 0.7446023, -1.166232, 0.7803922, 1, 0, 1,
-0.838836, 1.282164, -1.480796, 0.7764706, 1, 0, 1,
-0.8362275, -0.9711531, -2.587047, 0.7686275, 1, 0, 1,
-0.8355641, 0.2494291, -1.021431, 0.7647059, 1, 0, 1,
-0.8348459, 0.07823144, -0.95894, 0.7568628, 1, 0, 1,
-0.8342124, -1.836783, -2.463693, 0.7529412, 1, 0, 1,
-0.8322769, 1.127145, -4.220362, 0.7450981, 1, 0, 1,
-0.8283164, 0.6339244, -2.368875, 0.7411765, 1, 0, 1,
-0.8279325, 0.5450692, -0.5636542, 0.7333333, 1, 0, 1,
-0.825919, 0.3329909, -1.305351, 0.7294118, 1, 0, 1,
-0.8250332, 0.04601019, -2.16086, 0.7215686, 1, 0, 1,
-0.8240927, 0.01210034, -0.8401423, 0.7176471, 1, 0, 1,
-0.8220314, -1.867666, -3.104109, 0.7098039, 1, 0, 1,
-0.82125, -0.5772453, -4.292859, 0.7058824, 1, 0, 1,
-0.8170953, 0.5778592, -1.403994, 0.6980392, 1, 0, 1,
-0.8140631, 0.5349217, -0.1262315, 0.6901961, 1, 0, 1,
-0.8126321, 0.1007917, -3.369356, 0.6862745, 1, 0, 1,
-0.8108374, -1.035854, -3.711667, 0.6784314, 1, 0, 1,
-0.8061028, 0.4931471, -2.569315, 0.6745098, 1, 0, 1,
-0.8038135, -1.67229, -1.916242, 0.6666667, 1, 0, 1,
-0.8019104, 0.2508653, -1.493464, 0.6627451, 1, 0, 1,
-0.7972273, 1.679177, -0.8686681, 0.654902, 1, 0, 1,
-0.7962887, -1.218777, -3.031678, 0.6509804, 1, 0, 1,
-0.7924321, -0.2039156, -2.495877, 0.6431373, 1, 0, 1,
-0.7914661, -0.6785938, -1.035476, 0.6392157, 1, 0, 1,
-0.7890484, -1.340114, -3.417212, 0.6313726, 1, 0, 1,
-0.7794219, -1.188392, -2.234401, 0.627451, 1, 0, 1,
-0.7765355, 0.2330143, 0.05704241, 0.6196079, 1, 0, 1,
-0.774976, 0.6813312, -1.559642, 0.6156863, 1, 0, 1,
-0.7735927, 0.8570386, 0.09644312, 0.6078432, 1, 0, 1,
-0.7679292, -1.5814, -2.917962, 0.6039216, 1, 0, 1,
-0.7644001, -0.1575665, -1.346038, 0.5960785, 1, 0, 1,
-0.7618411, 0.5060459, -1.089069, 0.5882353, 1, 0, 1,
-0.7618324, 0.4130072, -1.136657, 0.5843138, 1, 0, 1,
-0.7564718, 1.858786, -0.6802117, 0.5764706, 1, 0, 1,
-0.7557588, -0.9955299, -1.827205, 0.572549, 1, 0, 1,
-0.7527768, -1.223786, -3.057731, 0.5647059, 1, 0, 1,
-0.750927, -0.9959731, -3.951576, 0.5607843, 1, 0, 1,
-0.7448719, -0.04609798, -2.815568, 0.5529412, 1, 0, 1,
-0.7434424, -0.2222731, -2.383141, 0.5490196, 1, 0, 1,
-0.7344427, -0.3832367, -4.239693, 0.5411765, 1, 0, 1,
-0.7335703, 1.572329, -0.9799502, 0.5372549, 1, 0, 1,
-0.7324405, 0.3343595, -0.1438496, 0.5294118, 1, 0, 1,
-0.732408, 0.06485192, -1.049011, 0.5254902, 1, 0, 1,
-0.7316502, -1.546504, -1.921956, 0.5176471, 1, 0, 1,
-0.7271722, 0.532123, -1.949926, 0.5137255, 1, 0, 1,
-0.7245888, 0.38545, -0.2360507, 0.5058824, 1, 0, 1,
-0.7228544, -0.5501548, -2.594541, 0.5019608, 1, 0, 1,
-0.7144385, 0.1117613, 0.03297277, 0.4941176, 1, 0, 1,
-0.7120698, 0.07512756, -0.9220082, 0.4862745, 1, 0, 1,
-0.7114673, -0.2471248, -2.255039, 0.4823529, 1, 0, 1,
-0.7098182, -0.2936409, 0.6463026, 0.4745098, 1, 0, 1,
-0.7092016, -0.9425784, -3.112071, 0.4705882, 1, 0, 1,
-0.7090796, 0.2809746, -1.067208, 0.4627451, 1, 0, 1,
-0.708674, -0.8917148, -2.519612, 0.4588235, 1, 0, 1,
-0.7017856, 2.474476, -0.9586285, 0.4509804, 1, 0, 1,
-0.6945091, -0.4210865, -2.95662, 0.4470588, 1, 0, 1,
-0.6921151, -1.003934, -1.932047, 0.4392157, 1, 0, 1,
-0.6908622, -0.01658466, -0.7399402, 0.4352941, 1, 0, 1,
-0.6906357, -0.3928783, -2.419607, 0.427451, 1, 0, 1,
-0.6855277, 1.931112, -2.502148, 0.4235294, 1, 0, 1,
-0.683577, 0.6480825, -1.354723, 0.4156863, 1, 0, 1,
-0.6782313, -2.30124, -4.165307, 0.4117647, 1, 0, 1,
-0.6698772, 0.7173676, -0.941483, 0.4039216, 1, 0, 1,
-0.6683762, -0.4663196, -1.815157, 0.3960784, 1, 0, 1,
-0.6606024, -0.05987835, -0.9808099, 0.3921569, 1, 0, 1,
-0.6598262, 0.1943546, -1.713922, 0.3843137, 1, 0, 1,
-0.6564043, 0.2564687, -1.30365, 0.3803922, 1, 0, 1,
-0.6534961, 0.6921989, -1.057582, 0.372549, 1, 0, 1,
-0.6527894, 0.7691709, -0.08112348, 0.3686275, 1, 0, 1,
-0.6517016, -2.3556, -0.09112286, 0.3607843, 1, 0, 1,
-0.6493798, 0.4311369, -1.56143, 0.3568628, 1, 0, 1,
-0.6409817, -1.464202, -1.898584, 0.3490196, 1, 0, 1,
-0.6377084, 0.2219329, 0.4475145, 0.345098, 1, 0, 1,
-0.6336775, 0.4463041, -2.415742, 0.3372549, 1, 0, 1,
-0.6330193, -0.1489398, -1.408346, 0.3333333, 1, 0, 1,
-0.6318506, -1.215973, -2.401549, 0.3254902, 1, 0, 1,
-0.6317592, 0.129595, 0.04260775, 0.3215686, 1, 0, 1,
-0.6277889, 0.8446001, 0.01688999, 0.3137255, 1, 0, 1,
-0.6259741, -0.8333554, -3.682368, 0.3098039, 1, 0, 1,
-0.6093054, -0.5897487, -2.415385, 0.3019608, 1, 0, 1,
-0.6073927, 0.1736229, -1.107049, 0.2941177, 1, 0, 1,
-0.6066002, 0.7912977, -1.184535, 0.2901961, 1, 0, 1,
-0.6023051, -0.5776176, -1.848928, 0.282353, 1, 0, 1,
-0.6004229, 2.722063, 0.1973271, 0.2784314, 1, 0, 1,
-0.5997832, 0.7340893, 0.2417951, 0.2705882, 1, 0, 1,
-0.5936553, -0.7927076, -1.824012, 0.2666667, 1, 0, 1,
-0.591879, -0.01406021, -1.5072, 0.2588235, 1, 0, 1,
-0.5918299, 0.8421233, -1.30158, 0.254902, 1, 0, 1,
-0.5907222, -0.02469761, -1.858775, 0.2470588, 1, 0, 1,
-0.5895588, -0.6136162, -2.8803, 0.2431373, 1, 0, 1,
-0.5891463, -0.5391179, -0.4873789, 0.2352941, 1, 0, 1,
-0.5870452, 0.2217567, -1.133768, 0.2313726, 1, 0, 1,
-0.5779295, 0.8673198, 0.6032478, 0.2235294, 1, 0, 1,
-0.5726765, 0.7328278, -0.6691613, 0.2196078, 1, 0, 1,
-0.5716432, 1.668616, -1.642944, 0.2117647, 1, 0, 1,
-0.5619133, 0.6894001, 0.2339924, 0.2078431, 1, 0, 1,
-0.5618015, -0.09916472, -4.014841, 0.2, 1, 0, 1,
-0.5594519, 0.12561, -2.150445, 0.1921569, 1, 0, 1,
-0.5578569, -0.4156054, -1.698107, 0.1882353, 1, 0, 1,
-0.5567096, -0.03922807, -1.809601, 0.1803922, 1, 0, 1,
-0.5565094, -0.2083644, -1.794598, 0.1764706, 1, 0, 1,
-0.5492805, 2.177276, 1.6751, 0.1686275, 1, 0, 1,
-0.5478494, 0.0382317, -0.1168849, 0.1647059, 1, 0, 1,
-0.5423544, -0.7480209, -3.863773, 0.1568628, 1, 0, 1,
-0.5386205, -1.807416, -1.971509, 0.1529412, 1, 0, 1,
-0.5372963, 0.2001882, -1.157903, 0.145098, 1, 0, 1,
-0.5342684, -1.232477, -4.006546, 0.1411765, 1, 0, 1,
-0.5342078, 0.4889139, 0.5287148, 0.1333333, 1, 0, 1,
-0.5313492, 0.3403109, -1.63763, 0.1294118, 1, 0, 1,
-0.529664, 1.443963, -0.6956725, 0.1215686, 1, 0, 1,
-0.5249018, 1.032949, -2.080951, 0.1176471, 1, 0, 1,
-0.5247961, 0.1443623, -1.489114, 0.1098039, 1, 0, 1,
-0.5217727, -0.6463068, -2.541008, 0.1058824, 1, 0, 1,
-0.5201055, 0.9970827, -0.8910596, 0.09803922, 1, 0, 1,
-0.519044, 0.2919684, -1.950536, 0.09019608, 1, 0, 1,
-0.5148047, 0.4817117, -0.4547303, 0.08627451, 1, 0, 1,
-0.5144725, -0.1701975, -1.990719, 0.07843138, 1, 0, 1,
-0.513505, -0.2395594, -2.886881, 0.07450981, 1, 0, 1,
-0.5060963, -0.5298845, -3.36241, 0.06666667, 1, 0, 1,
-0.5051756, 1.016111, -0.9378846, 0.0627451, 1, 0, 1,
-0.4995548, 1.330043, 0.005023403, 0.05490196, 1, 0, 1,
-0.4991617, -1.599226, -1.640188, 0.05098039, 1, 0, 1,
-0.498538, 1.401202, 0.2889084, 0.04313726, 1, 0, 1,
-0.4864661, 0.8505482, -0.5579376, 0.03921569, 1, 0, 1,
-0.4859348, 0.1483964, -1.242194, 0.03137255, 1, 0, 1,
-0.4838004, 0.5502234, -1.678712, 0.02745098, 1, 0, 1,
-0.4793932, -0.67313, -3.000592, 0.01960784, 1, 0, 1,
-0.4784133, 0.1366256, -1.809426, 0.01568628, 1, 0, 1,
-0.4741198, 0.5998368, -0.4945776, 0.007843138, 1, 0, 1,
-0.4739683, -0.7741428, -3.651469, 0.003921569, 1, 0, 1,
-0.4730888, 1.552959, -1.304814, 0, 1, 0.003921569, 1,
-0.4689687, 0.1263656, -2.701671, 0, 1, 0.01176471, 1,
-0.4686971, 1.239157, -0.8285756, 0, 1, 0.01568628, 1,
-0.4674061, 0.1349669, -1.118621, 0, 1, 0.02352941, 1,
-0.4668399, 0.2640343, -0.8231166, 0, 1, 0.02745098, 1,
-0.4635505, 0.2073622, -1.332367, 0, 1, 0.03529412, 1,
-0.4616048, 0.5740825, -4.078903, 0, 1, 0.03921569, 1,
-0.4580972, 1.308068, 1.469807, 0, 1, 0.04705882, 1,
-0.4559183, 1.052418, 0.7081102, 0, 1, 0.05098039, 1,
-0.4537617, -0.05866901, -2.673631, 0, 1, 0.05882353, 1,
-0.4537048, 1.225656, -0.6330302, 0, 1, 0.0627451, 1,
-0.4515242, -0.1848884, -2.687245, 0, 1, 0.07058824, 1,
-0.446731, -0.5909183, -2.589042, 0, 1, 0.07450981, 1,
-0.4455054, -0.2879553, -0.8263757, 0, 1, 0.08235294, 1,
-0.4388906, -0.8235049, -4.46933, 0, 1, 0.08627451, 1,
-0.4382426, -0.03202628, 0.5789329, 0, 1, 0.09411765, 1,
-0.437768, -0.2051587, -1.652665, 0, 1, 0.1019608, 1,
-0.4322191, 0.1752397, -1.473891, 0, 1, 0.1058824, 1,
-0.4263769, -2.01392, -4.577505, 0, 1, 0.1137255, 1,
-0.4246527, -1.738718, -4.10142, 0, 1, 0.1176471, 1,
-0.4117522, 0.8406485, -1.133556, 0, 1, 0.1254902, 1,
-0.4093757, -0.4943791, -2.533252, 0, 1, 0.1294118, 1,
-0.4078661, -0.2131269, -1.517155, 0, 1, 0.1372549, 1,
-0.4049987, -1.313785, -3.787348, 0, 1, 0.1411765, 1,
-0.4048345, 0.3784724, -1.757399, 0, 1, 0.1490196, 1,
-0.4029828, 1.23116, -0.709428, 0, 1, 0.1529412, 1,
-0.401869, -0.6488748, -1.987412, 0, 1, 0.1607843, 1,
-0.4014578, -0.8851781, -2.117766, 0, 1, 0.1647059, 1,
-0.3933812, 0.1677722, -0.4254942, 0, 1, 0.172549, 1,
-0.3927003, -0.4571096, -1.685579, 0, 1, 0.1764706, 1,
-0.3919615, -0.5854545, -1.302617, 0, 1, 0.1843137, 1,
-0.3896502, 0.7427141, -0.449154, 0, 1, 0.1882353, 1,
-0.3853256, 1.559937, 0.0346449, 0, 1, 0.1960784, 1,
-0.384432, -0.5029023, -1.965377, 0, 1, 0.2039216, 1,
-0.3839382, 0.7189265, 0.3388175, 0, 1, 0.2078431, 1,
-0.3831032, -0.3137855, -1.157866, 0, 1, 0.2156863, 1,
-0.3799069, 1.14814, 0.3735466, 0, 1, 0.2196078, 1,
-0.3768977, 1.100621, -1.136955, 0, 1, 0.227451, 1,
-0.3758002, 0.4703025, -2.342794, 0, 1, 0.2313726, 1,
-0.3754369, 0.3085056, 0.674387, 0, 1, 0.2392157, 1,
-0.3725677, 0.0552529, -1.688402, 0, 1, 0.2431373, 1,
-0.371855, -1.347367, -2.655457, 0, 1, 0.2509804, 1,
-0.3695061, -0.3230847, -1.605854, 0, 1, 0.254902, 1,
-0.3681988, 1.066441, -0.2992841, 0, 1, 0.2627451, 1,
-0.3680616, -0.5062321, -2.206575, 0, 1, 0.2666667, 1,
-0.3628213, -1.147298, -3.547082, 0, 1, 0.2745098, 1,
-0.362716, 0.5439768, -0.7503433, 0, 1, 0.2784314, 1,
-0.3615639, -0.5735632, -2.053604, 0, 1, 0.2862745, 1,
-0.355328, -2.748697, -3.230803, 0, 1, 0.2901961, 1,
-0.3517378, -0.2223526, -0.7724741, 0, 1, 0.2980392, 1,
-0.3431769, -0.8985712, -1.594224, 0, 1, 0.3058824, 1,
-0.3367086, 2.301971, 1.20119, 0, 1, 0.3098039, 1,
-0.3325877, 1.16445, 0.4952895, 0, 1, 0.3176471, 1,
-0.3286957, 1.642682, 0.04254257, 0, 1, 0.3215686, 1,
-0.3285397, 0.3361184, 0.04069765, 0, 1, 0.3294118, 1,
-0.328019, 0.1549419, -1.406151, 0, 1, 0.3333333, 1,
-0.3275947, 0.3556424, -0.1713756, 0, 1, 0.3411765, 1,
-0.3208282, 0.4500866, 1.679549, 0, 1, 0.345098, 1,
-0.3203061, 0.09851735, -2.324641, 0, 1, 0.3529412, 1,
-0.3200398, 1.275859, 0.2146295, 0, 1, 0.3568628, 1,
-0.3179926, 1.281692, 0.5455139, 0, 1, 0.3647059, 1,
-0.3165503, -0.02048167, -2.748475, 0, 1, 0.3686275, 1,
-0.3160963, 0.4216285, -0.00251957, 0, 1, 0.3764706, 1,
-0.310631, 0.9100519, -0.9280957, 0, 1, 0.3803922, 1,
-0.3054285, -0.7805165, -1.693753, 0, 1, 0.3882353, 1,
-0.3050543, 2.108314, -0.2416277, 0, 1, 0.3921569, 1,
-0.3027602, -0.3105848, -2.01318, 0, 1, 0.4, 1,
-0.3014394, -0.4739936, -3.058145, 0, 1, 0.4078431, 1,
-0.2996601, -0.4797813, -1.683548, 0, 1, 0.4117647, 1,
-0.298738, 0.9187817, -0.6864767, 0, 1, 0.4196078, 1,
-0.2984308, -0.2969227, -2.98593, 0, 1, 0.4235294, 1,
-0.29318, 1.305661, -1.182583, 0, 1, 0.4313726, 1,
-0.2926116, -0.2266326, -1.877731, 0, 1, 0.4352941, 1,
-0.2904962, 1.982161, -0.1977971, 0, 1, 0.4431373, 1,
-0.2865556, -0.1037161, -1.495451, 0, 1, 0.4470588, 1,
-0.2851815, 0.03736356, -1.779035, 0, 1, 0.454902, 1,
-0.2840515, -0.4754833, -3.33454, 0, 1, 0.4588235, 1,
-0.2832033, -0.7422948, -2.267127, 0, 1, 0.4666667, 1,
-0.2775444, -1.647765, -1.621258, 0, 1, 0.4705882, 1,
-0.2773668, 0.7019408, -1.83093, 0, 1, 0.4784314, 1,
-0.2771323, -0.330837, -3.596696, 0, 1, 0.4823529, 1,
-0.2769454, 2.374788, 0.1182763, 0, 1, 0.4901961, 1,
-0.2753423, -0.5702858, -2.396018, 0, 1, 0.4941176, 1,
-0.2737421, 0.07471929, -2.846577, 0, 1, 0.5019608, 1,
-0.2723051, -0.8684142, -1.124403, 0, 1, 0.509804, 1,
-0.2683479, 0.7892838, -1.696939, 0, 1, 0.5137255, 1,
-0.267273, 1.155205, -1.502688, 0, 1, 0.5215687, 1,
-0.2645588, 0.09434813, -0.1750332, 0, 1, 0.5254902, 1,
-0.2585776, 0.1214299, -2.084921, 0, 1, 0.5333334, 1,
-0.2555686, -0.5599912, -2.898867, 0, 1, 0.5372549, 1,
-0.2503217, 1.381125, -0.7024825, 0, 1, 0.5450981, 1,
-0.2453474, -0.4244235, -5.176594, 0, 1, 0.5490196, 1,
-0.2433954, 0.157303, -1.728822, 0, 1, 0.5568628, 1,
-0.235923, 1.216799, 0.9170153, 0, 1, 0.5607843, 1,
-0.2349383, -1.034972, -4.817103, 0, 1, 0.5686275, 1,
-0.2326537, -0.3835635, -2.908906, 0, 1, 0.572549, 1,
-0.2309466, 0.1971243, -3.436327, 0, 1, 0.5803922, 1,
-0.2296135, -2.016371, -2.566925, 0, 1, 0.5843138, 1,
-0.2274809, 1.866725, -0.561554, 0, 1, 0.5921569, 1,
-0.2269239, 1.315792, 0.175133, 0, 1, 0.5960785, 1,
-0.2260293, 0.2793307, -1.626559, 0, 1, 0.6039216, 1,
-0.2230809, 1.439107, -1.069155, 0, 1, 0.6117647, 1,
-0.2201714, 1.351086, 0.7650334, 0, 1, 0.6156863, 1,
-0.2161406, -1.79672, -2.969746, 0, 1, 0.6235294, 1,
-0.2088307, -0.3180985, -4.240825, 0, 1, 0.627451, 1,
-0.2071851, -0.736268, -1.310715, 0, 1, 0.6352941, 1,
-0.2051028, 1.707279, 1.233719, 0, 1, 0.6392157, 1,
-0.1996447, 1.039788, 0.6470883, 0, 1, 0.6470588, 1,
-0.1948615, -0.5667741, -2.800755, 0, 1, 0.6509804, 1,
-0.1947379, 0.9581921, -1.482074, 0, 1, 0.6588235, 1,
-0.1916363, -1.038843, -3.063923, 0, 1, 0.6627451, 1,
-0.1902318, -1.31298, -0.6929963, 0, 1, 0.6705883, 1,
-0.1894029, 1.186292, 0.5073471, 0, 1, 0.6745098, 1,
-0.1799642, 0.05689613, -1.546158, 0, 1, 0.682353, 1,
-0.1765227, 0.9235793, -0.2881874, 0, 1, 0.6862745, 1,
-0.1753655, -0.698638, -3.791316, 0, 1, 0.6941177, 1,
-0.1657183, -1.296444, -2.451161, 0, 1, 0.7019608, 1,
-0.1571386, 0.7418561, -0.8812776, 0, 1, 0.7058824, 1,
-0.1562471, -0.5391564, -3.828262, 0, 1, 0.7137255, 1,
-0.1544567, -1.385687, -2.182872, 0, 1, 0.7176471, 1,
-0.1515113, 0.6754161, 0.03141644, 0, 1, 0.7254902, 1,
-0.1511844, 0.1506952, 0.1275476, 0, 1, 0.7294118, 1,
-0.1501273, -0.3587207, -3.082066, 0, 1, 0.7372549, 1,
-0.1489177, -1.156679, -4.42815, 0, 1, 0.7411765, 1,
-0.1484736, 2.377873, -0.9851888, 0, 1, 0.7490196, 1,
-0.1473299, 1.848354, 0.5355328, 0, 1, 0.7529412, 1,
-0.1462976, -0.03689596, -2.667545, 0, 1, 0.7607843, 1,
-0.144417, -1.275688, -3.057684, 0, 1, 0.7647059, 1,
-0.1441822, -1.82668, -3.436418, 0, 1, 0.772549, 1,
-0.1441065, 0.0251043, -2.132922, 0, 1, 0.7764706, 1,
-0.1389502, 0.00942228, -0.3639012, 0, 1, 0.7843137, 1,
-0.1323114, 0.6714855, -2.34429, 0, 1, 0.7882353, 1,
-0.1318416, -0.09032848, -3.273845, 0, 1, 0.7960784, 1,
-0.1291321, -0.6762801, -3.526154, 0, 1, 0.8039216, 1,
-0.1286084, 0.4527838, -0.05436039, 0, 1, 0.8078431, 1,
-0.1277721, 0.4822209, 0.6984903, 0, 1, 0.8156863, 1,
-0.1265047, 0.9225793, 0.1454574, 0, 1, 0.8196079, 1,
-0.1230454, -0.2095242, -1.695516, 0, 1, 0.827451, 1,
-0.1191226, -0.012948, -2.682698, 0, 1, 0.8313726, 1,
-0.1174135, -0.475581, -1.563555, 0, 1, 0.8392157, 1,
-0.1118626, -0.4838959, -2.965221, 0, 1, 0.8431373, 1,
-0.1063849, -0.856802, -4.08727, 0, 1, 0.8509804, 1,
-0.1012997, -1.26213, -2.985569, 0, 1, 0.854902, 1,
-0.0978394, 0.1684051, -2.303005, 0, 1, 0.8627451, 1,
-0.09655638, 0.1040883, -1.511607, 0, 1, 0.8666667, 1,
-0.08651165, 1.296072, 0.2998724, 0, 1, 0.8745098, 1,
-0.08454329, -1.495245, -2.061006, 0, 1, 0.8784314, 1,
-0.07509869, -0.798256, -3.575777, 0, 1, 0.8862745, 1,
-0.06976544, -0.3522035, -2.118728, 0, 1, 0.8901961, 1,
-0.06911463, 0.5335461, -1.247024, 0, 1, 0.8980392, 1,
-0.06522368, 0.6766274, -1.131369, 0, 1, 0.9058824, 1,
-0.06386009, -0.8605399, -2.707895, 0, 1, 0.9098039, 1,
-0.06303986, -0.6726397, -3.042952, 0, 1, 0.9176471, 1,
-0.05943511, 0.8303771, -0.8299196, 0, 1, 0.9215686, 1,
-0.05289681, 0.211685, -2.213763, 0, 1, 0.9294118, 1,
-0.05004223, -0.9883683, -3.479951, 0, 1, 0.9333333, 1,
-0.04810404, 1.021271, -0.5237014, 0, 1, 0.9411765, 1,
-0.04214476, -0.1952129, -2.111849, 0, 1, 0.945098, 1,
-0.03792904, -0.05381276, -2.413671, 0, 1, 0.9529412, 1,
-0.037063, 0.4596582, 0.8539715, 0, 1, 0.9568627, 1,
-0.0350223, -0.1737037, -2.094765, 0, 1, 0.9647059, 1,
-0.0347142, 0.2454887, -0.3214043, 0, 1, 0.9686275, 1,
-0.03052954, 2.657493, -0.3555619, 0, 1, 0.9764706, 1,
-0.02621394, -0.5502286, -2.82322, 0, 1, 0.9803922, 1,
-0.02483791, 2.155384, 2.959738, 0, 1, 0.9882353, 1,
-0.02280692, 0.73635, -2.091731, 0, 1, 0.9921569, 1,
-0.02084932, -1.573771, -4.134977, 0, 1, 1, 1,
-0.0197316, 1.589899, -0.1308337, 0, 0.9921569, 1, 1,
-0.009287233, -1.022196, -4.722378, 0, 0.9882353, 1, 1,
-0.008773931, -0.2551972, -2.150537, 0, 0.9803922, 1, 1,
-0.002799372, -0.04371667, -0.2091434, 0, 0.9764706, 1, 1,
0.001451525, -0.5410013, 3.641769, 0, 0.9686275, 1, 1,
0.00403868, 1.591105, -0.2488135, 0, 0.9647059, 1, 1,
0.004636951, -0.6083418, 2.549287, 0, 0.9568627, 1, 1,
0.006064339, 0.7659426, -0.790661, 0, 0.9529412, 1, 1,
0.006929882, -1.191642, 4.00622, 0, 0.945098, 1, 1,
0.007546356, -1.559465, 4.081107, 0, 0.9411765, 1, 1,
0.00844851, -1.050379, 3.036016, 0, 0.9333333, 1, 1,
0.01152572, 0.05669416, -0.4548587, 0, 0.9294118, 1, 1,
0.01346419, 1.525195, 1.608406, 0, 0.9215686, 1, 1,
0.01586636, 0.7945292, 0.8764328, 0, 0.9176471, 1, 1,
0.01758924, -0.3236081, 3.61345, 0, 0.9098039, 1, 1,
0.01950566, -0.5422942, 2.339405, 0, 0.9058824, 1, 1,
0.02016404, 0.9986937, -0.5197135, 0, 0.8980392, 1, 1,
0.02445837, 0.1110098, -0.5590532, 0, 0.8901961, 1, 1,
0.02552605, -0.8689817, 4.64011, 0, 0.8862745, 1, 1,
0.02737208, 1.477124, -0.4633805, 0, 0.8784314, 1, 1,
0.03071771, 0.6557584, -0.8610258, 0, 0.8745098, 1, 1,
0.0337947, -1.118957, 1.199571, 0, 0.8666667, 1, 1,
0.03567312, -0.5673186, 3.582866, 0, 0.8627451, 1, 1,
0.03615415, -0.1981084, 2.20639, 0, 0.854902, 1, 1,
0.03811155, 0.3721849, -0.3512963, 0, 0.8509804, 1, 1,
0.04375983, -0.2752052, 2.016741, 0, 0.8431373, 1, 1,
0.04615365, -0.01916504, 3.562761, 0, 0.8392157, 1, 1,
0.04970557, -1.095482, 2.611955, 0, 0.8313726, 1, 1,
0.05132601, 0.5607066, 0.9589597, 0, 0.827451, 1, 1,
0.06653739, -0.4615426, 1.845636, 0, 0.8196079, 1, 1,
0.06853334, -0.4998894, 2.33358, 0, 0.8156863, 1, 1,
0.06890783, 0.9537871, -0.7111776, 0, 0.8078431, 1, 1,
0.07190952, -1.923726, 2.739025, 0, 0.8039216, 1, 1,
0.07367404, -0.9159906, 1.12848, 0, 0.7960784, 1, 1,
0.07512102, -0.8820448, 2.354561, 0, 0.7882353, 1, 1,
0.08285623, -0.317703, 4.639853, 0, 0.7843137, 1, 1,
0.08329175, -1.335213, 4.801566, 0, 0.7764706, 1, 1,
0.08897083, -0.03594835, 1.425727, 0, 0.772549, 1, 1,
0.0902703, 0.05137567, 1.595672, 0, 0.7647059, 1, 1,
0.09275332, -0.1058404, 1.275474, 0, 0.7607843, 1, 1,
0.09302116, -0.5672902, 3.888378, 0, 0.7529412, 1, 1,
0.09489749, 1.055276, 0.8837032, 0, 0.7490196, 1, 1,
0.0960255, -1.988869, 2.636852, 0, 0.7411765, 1, 1,
0.09943818, 0.5118426, 0.6155452, 0, 0.7372549, 1, 1,
0.1018975, -0.02031477, 2.373358, 0, 0.7294118, 1, 1,
0.1021821, 2.105556, 0.470615, 0, 0.7254902, 1, 1,
0.1026552, 1.710875, 1.577307, 0, 0.7176471, 1, 1,
0.1041627, 0.8568155, -0.9855497, 0, 0.7137255, 1, 1,
0.1051831, -0.1403048, 1.346718, 0, 0.7058824, 1, 1,
0.1052288, 0.2865365, 0.7615415, 0, 0.6980392, 1, 1,
0.1061792, -0.2915862, 3.896368, 0, 0.6941177, 1, 1,
0.1066994, -0.7989971, 3.303138, 0, 0.6862745, 1, 1,
0.1113682, 0.08210879, 0.5032424, 0, 0.682353, 1, 1,
0.1173343, 0.05984799, 1.613371, 0, 0.6745098, 1, 1,
0.1181837, 1.48331, -0.7628137, 0, 0.6705883, 1, 1,
0.1186862, 1.61107, 0.1325347, 0, 0.6627451, 1, 1,
0.1187682, 2.710773, 0.5343189, 0, 0.6588235, 1, 1,
0.1191096, 0.5912467, 0.2452853, 0, 0.6509804, 1, 1,
0.119375, -2.389693, 2.752404, 0, 0.6470588, 1, 1,
0.1248783, 0.1440202, -0.4191127, 0, 0.6392157, 1, 1,
0.1271454, -1.392284, 4.302717, 0, 0.6352941, 1, 1,
0.1328341, 0.3288018, -1.255667, 0, 0.627451, 1, 1,
0.133594, 1.361299, 0.873942, 0, 0.6235294, 1, 1,
0.1341383, -1.615727, 2.930468, 0, 0.6156863, 1, 1,
0.1381698, -0.1041592, 2.322683, 0, 0.6117647, 1, 1,
0.1451845, -0.8818858, 3.831255, 0, 0.6039216, 1, 1,
0.1472977, -1.016166, 4.283136, 0, 0.5960785, 1, 1,
0.1481896, -0.83112, 3.05942, 0, 0.5921569, 1, 1,
0.1489094, 0.7281103, -0.4013323, 0, 0.5843138, 1, 1,
0.1501208, -0.01263785, -0.7499819, 0, 0.5803922, 1, 1,
0.1511994, 0.7111363, -0.5078591, 0, 0.572549, 1, 1,
0.1513415, -1.464076, 4.262491, 0, 0.5686275, 1, 1,
0.1514289, 0.8543884, -1.684795, 0, 0.5607843, 1, 1,
0.1600733, 0.2065713, 1.796283, 0, 0.5568628, 1, 1,
0.1634113, -0.4474306, 4.94851, 0, 0.5490196, 1, 1,
0.1661734, 0.7480275, -0.3405823, 0, 0.5450981, 1, 1,
0.1667984, -1.635814, 4.874523, 0, 0.5372549, 1, 1,
0.1717575, 0.6865364, 0.545175, 0, 0.5333334, 1, 1,
0.1735663, -0.5849971, 3.407852, 0, 0.5254902, 1, 1,
0.1751682, 1.435347, 1.125949, 0, 0.5215687, 1, 1,
0.1791489, 0.4632583, 0.7493171, 0, 0.5137255, 1, 1,
0.1833305, 0.6828597, -0.1913192, 0, 0.509804, 1, 1,
0.1850148, 0.9540352, -0.2607955, 0, 0.5019608, 1, 1,
0.1871017, -2.230511, 3.499601, 0, 0.4941176, 1, 1,
0.1900022, -0.976242, 2.18508, 0, 0.4901961, 1, 1,
0.1906913, -2.291839, 1.883945, 0, 0.4823529, 1, 1,
0.1929067, 1.042309, 0.2715907, 0, 0.4784314, 1, 1,
0.2056314, -0.03142616, 1.625508, 0, 0.4705882, 1, 1,
0.20676, 1.132831, -0.2979127, 0, 0.4666667, 1, 1,
0.209827, 0.01774134, 1.861815, 0, 0.4588235, 1, 1,
0.2117992, -0.8334861, 2.838641, 0, 0.454902, 1, 1,
0.2130814, -0.685652, 3.767536, 0, 0.4470588, 1, 1,
0.2144098, 0.1115657, 0.9468358, 0, 0.4431373, 1, 1,
0.2153138, -0.07793421, 1.045763, 0, 0.4352941, 1, 1,
0.220315, 0.3512723, 1.173498, 0, 0.4313726, 1, 1,
0.222014, 0.1894027, 0.06989913, 0, 0.4235294, 1, 1,
0.2225459, 0.9520699, -0.7469139, 0, 0.4196078, 1, 1,
0.2274507, -0.7575167, 4.317275, 0, 0.4117647, 1, 1,
0.2275133, -0.9983602, 4.682684, 0, 0.4078431, 1, 1,
0.2292725, -0.4923895, 3.489597, 0, 0.4, 1, 1,
0.2315212, -0.7023439, 2.116772, 0, 0.3921569, 1, 1,
0.2327263, 1.157723, 0.09256187, 0, 0.3882353, 1, 1,
0.236317, -1.203882, 4.018669, 0, 0.3803922, 1, 1,
0.2377608, -0.06615981, 3.895455, 0, 0.3764706, 1, 1,
0.237865, 0.8901119, 1.189143, 0, 0.3686275, 1, 1,
0.2390626, 0.6781064, 1.588917, 0, 0.3647059, 1, 1,
0.2406074, -1.960608, 3.542421, 0, 0.3568628, 1, 1,
0.2429453, 0.7579219, 0.3367018, 0, 0.3529412, 1, 1,
0.2462707, 0.6278999, 1.473089, 0, 0.345098, 1, 1,
0.2486141, -0.8842949, 2.572561, 0, 0.3411765, 1, 1,
0.2491637, 0.3411678, 0.4105372, 0, 0.3333333, 1, 1,
0.2506613, -1.24542, 1.947204, 0, 0.3294118, 1, 1,
0.2515227, -1.623668, 4.217515, 0, 0.3215686, 1, 1,
0.2559271, 1.655533, 2.124734, 0, 0.3176471, 1, 1,
0.2621782, 1.074701, 0.8466368, 0, 0.3098039, 1, 1,
0.262812, -0.4723593, 1.896589, 0, 0.3058824, 1, 1,
0.2662061, -1.238439, 3.912415, 0, 0.2980392, 1, 1,
0.2675145, -1.0324, 4.044718, 0, 0.2901961, 1, 1,
0.2693705, 0.7819813, -0.1255855, 0, 0.2862745, 1, 1,
0.2717775, -0.4780799, 1.092501, 0, 0.2784314, 1, 1,
0.280524, -1.65686, 3.182485, 0, 0.2745098, 1, 1,
0.280959, 0.5457218, 0.3044894, 0, 0.2666667, 1, 1,
0.2853488, -1.397464, 2.341715, 0, 0.2627451, 1, 1,
0.2913748, -0.5018979, 3.455391, 0, 0.254902, 1, 1,
0.293015, -1.210723, 2.62514, 0, 0.2509804, 1, 1,
0.2940167, 1.896091, 1.028971, 0, 0.2431373, 1, 1,
0.2944556, -1.692334, 3.269456, 0, 0.2392157, 1, 1,
0.2970958, -0.973617, 1.512537, 0, 0.2313726, 1, 1,
0.3057237, -0.3136028, 2.83011, 0, 0.227451, 1, 1,
0.3066437, 0.4209077, 1.83501, 0, 0.2196078, 1, 1,
0.3107527, -1.127605, 3.711297, 0, 0.2156863, 1, 1,
0.3160067, 0.8431117, 0.2865725, 0, 0.2078431, 1, 1,
0.3189918, -0.5403247, 2.714508, 0, 0.2039216, 1, 1,
0.3257325, 0.5435966, 0.9366802, 0, 0.1960784, 1, 1,
0.3259264, -0.02300262, 1.749269, 0, 0.1882353, 1, 1,
0.3278487, -1.17245, 3.253738, 0, 0.1843137, 1, 1,
0.3326013, -1.337592, 3.710496, 0, 0.1764706, 1, 1,
0.3408332, 1.573136, -0.1301087, 0, 0.172549, 1, 1,
0.3437344, 0.01760994, 2.270544, 0, 0.1647059, 1, 1,
0.3489389, -0.08966599, 2.561727, 0, 0.1607843, 1, 1,
0.3489632, -0.3039319, 2.052394, 0, 0.1529412, 1, 1,
0.3495214, -0.1687685, 2.36848, 0, 0.1490196, 1, 1,
0.3518032, 0.7452545, -0.5070962, 0, 0.1411765, 1, 1,
0.3546955, 1.590922, 0.3994637, 0, 0.1372549, 1, 1,
0.3591998, 0.2763051, 1.656387, 0, 0.1294118, 1, 1,
0.3593992, -0.03290866, 3.590793, 0, 0.1254902, 1, 1,
0.3623317, 0.2589892, -0.09641527, 0, 0.1176471, 1, 1,
0.3625543, 1.869148, 1.049293, 0, 0.1137255, 1, 1,
0.3695272, 0.5967959, -1.167979, 0, 0.1058824, 1, 1,
0.3703941, -0.8748128, 3.299883, 0, 0.09803922, 1, 1,
0.3739171, -0.1876378, -0.6147598, 0, 0.09411765, 1, 1,
0.3739266, -0.6818243, 0.9723966, 0, 0.08627451, 1, 1,
0.3758838, -0.1657166, 0.8834801, 0, 0.08235294, 1, 1,
0.3761728, -0.6230386, 1.068331, 0, 0.07450981, 1, 1,
0.3768437, 0.1632494, -0.1044328, 0, 0.07058824, 1, 1,
0.3791141, 2.056033, 1.519244, 0, 0.0627451, 1, 1,
0.3795494, -0.5055225, 3.035843, 0, 0.05882353, 1, 1,
0.3843353, -1.292274, 3.471043, 0, 0.05098039, 1, 1,
0.38491, -0.7389756, 1.335909, 0, 0.04705882, 1, 1,
0.3876026, 0.1283638, 1.612227, 0, 0.03921569, 1, 1,
0.388144, -3.939195, 5.317384, 0, 0.03529412, 1, 1,
0.3887432, 0.03329034, 1.710155, 0, 0.02745098, 1, 1,
0.3919659, -0.7182689, 2.274893, 0, 0.02352941, 1, 1,
0.3932027, -1.43096, 3.456412, 0, 0.01568628, 1, 1,
0.3940991, 0.7057717, 2.207772, 0, 0.01176471, 1, 1,
0.3944396, 1.707129, 0.9818283, 0, 0.003921569, 1, 1,
0.395025, -0.04844907, 2.303852, 0.003921569, 0, 1, 1,
0.4020243, -0.06550321, 1.434576, 0.007843138, 0, 1, 1,
0.4027845, 1.308601, -0.1732905, 0.01568628, 0, 1, 1,
0.4036117, 1.166226, 1.120167, 0.01960784, 0, 1, 1,
0.4048234, 0.1962655, 1.337279, 0.02745098, 0, 1, 1,
0.4062142, 2.380129, 0.8509141, 0.03137255, 0, 1, 1,
0.4069579, 0.8841822, -0.1328573, 0.03921569, 0, 1, 1,
0.4137655, 0.4886744, -0.2938151, 0.04313726, 0, 1, 1,
0.414822, 0.5559035, 1.970899, 0.05098039, 0, 1, 1,
0.4172556, -2.300144, 4.497642, 0.05490196, 0, 1, 1,
0.4235229, 0.163897, 1.107402, 0.0627451, 0, 1, 1,
0.4246421, -0.120712, 1.757024, 0.06666667, 0, 1, 1,
0.4247806, -0.6693438, 3.343779, 0.07450981, 0, 1, 1,
0.4363272, 1.790594, 2.827403, 0.07843138, 0, 1, 1,
0.4379843, 0.5737844, 1.702276, 0.08627451, 0, 1, 1,
0.4399963, 1.944618, 0.8638983, 0.09019608, 0, 1, 1,
0.4466726, 0.3922077, 0.5827638, 0.09803922, 0, 1, 1,
0.4504806, -1.659578, 2.810141, 0.1058824, 0, 1, 1,
0.4576815, -2.517165, 2.278317, 0.1098039, 0, 1, 1,
0.4649783, 0.664028, 0.01744174, 0.1176471, 0, 1, 1,
0.4666681, -0.4412178, 2.553418, 0.1215686, 0, 1, 1,
0.4672057, -1.054228, 2.252705, 0.1294118, 0, 1, 1,
0.4708682, 0.01265521, 1.484053, 0.1333333, 0, 1, 1,
0.471974, -0.6782246, 2.773853, 0.1411765, 0, 1, 1,
0.4740843, 1.084811, 1.08748, 0.145098, 0, 1, 1,
0.4750446, 0.4197549, 0.98986, 0.1529412, 0, 1, 1,
0.4753796, 1.570167, -0.09646928, 0.1568628, 0, 1, 1,
0.4763079, -0.733107, 4.007008, 0.1647059, 0, 1, 1,
0.4798633, -0.05607967, 1.058058, 0.1686275, 0, 1, 1,
0.4802264, 0.06927632, 2.832698, 0.1764706, 0, 1, 1,
0.4827629, -0.653573, 4.499708, 0.1803922, 0, 1, 1,
0.483525, 1.383963, 1.744111, 0.1882353, 0, 1, 1,
0.4836335, -0.9808165, 5.234484, 0.1921569, 0, 1, 1,
0.4861721, -0.09958917, 2.69333, 0.2, 0, 1, 1,
0.4865751, -0.9111488, 2.121105, 0.2078431, 0, 1, 1,
0.4900744, -0.6337765, 2.270567, 0.2117647, 0, 1, 1,
0.4943001, -1.337359, 2.61572, 0.2196078, 0, 1, 1,
0.4946307, -0.696389, 3.903187, 0.2235294, 0, 1, 1,
0.5046084, 0.4015353, 1.490743, 0.2313726, 0, 1, 1,
0.506806, -0.3265026, 2.303966, 0.2352941, 0, 1, 1,
0.5094703, 0.4313318, 1.212172, 0.2431373, 0, 1, 1,
0.5103992, -0.140473, 1.463254, 0.2470588, 0, 1, 1,
0.5132884, -1.762753, 4.158756, 0.254902, 0, 1, 1,
0.5170762, 0.9345193, -0.2799059, 0.2588235, 0, 1, 1,
0.5170779, -0.0006643347, 1.912099, 0.2666667, 0, 1, 1,
0.5181188, 0.03068581, 2.949532, 0.2705882, 0, 1, 1,
0.5198864, 0.6905859, 0.09027858, 0.2784314, 0, 1, 1,
0.5237606, -0.3523115, 1.582039, 0.282353, 0, 1, 1,
0.5241833, 1.062026, -0.0651946, 0.2901961, 0, 1, 1,
0.5263522, -0.868946, 1.08871, 0.2941177, 0, 1, 1,
0.5268055, 1.037498, 0.0429061, 0.3019608, 0, 1, 1,
0.5308043, -2.1607, 1.806479, 0.3098039, 0, 1, 1,
0.5351731, -0.1359705, 1.552244, 0.3137255, 0, 1, 1,
0.5355699, 0.6451908, 1.632135, 0.3215686, 0, 1, 1,
0.5357341, 1.159194, 0.7072496, 0.3254902, 0, 1, 1,
0.5406264, -0.07726537, 1.046968, 0.3333333, 0, 1, 1,
0.5432173, 0.7542942, 0.900606, 0.3372549, 0, 1, 1,
0.5447866, 0.5024142, 0.3548058, 0.345098, 0, 1, 1,
0.5458176, 0.06807365, 1.312448, 0.3490196, 0, 1, 1,
0.5504519, -0.1532669, 4.02287, 0.3568628, 0, 1, 1,
0.5608013, 1.867292, -0.5068607, 0.3607843, 0, 1, 1,
0.5618311, 0.8296512, 0.05128358, 0.3686275, 0, 1, 1,
0.5783762, 0.8590272, -0.186081, 0.372549, 0, 1, 1,
0.5875236, 1.006142, -1.085648, 0.3803922, 0, 1, 1,
0.5879921, 0.4599739, 2.326837, 0.3843137, 0, 1, 1,
0.5904747, -0.7095808, 2.238523, 0.3921569, 0, 1, 1,
0.594515, 0.06489983, 3.15683, 0.3960784, 0, 1, 1,
0.5975112, 0.7768634, 2.080091, 0.4039216, 0, 1, 1,
0.5982651, -1.081092, 1.38752, 0.4117647, 0, 1, 1,
0.5992958, -1.604301, 3.743917, 0.4156863, 0, 1, 1,
0.6048532, 0.5298184, 0.1159502, 0.4235294, 0, 1, 1,
0.6065179, 0.2929189, 0.9461162, 0.427451, 0, 1, 1,
0.6115607, 0.1012637, -0.06660309, 0.4352941, 0, 1, 1,
0.6137429, 0.2953686, 2.543926, 0.4392157, 0, 1, 1,
0.6246958, -0.8338752, 1.496007, 0.4470588, 0, 1, 1,
0.6256809, 0.3059545, 0.6111772, 0.4509804, 0, 1, 1,
0.6263421, 0.2802563, 1.15094, 0.4588235, 0, 1, 1,
0.6281303, 0.3398789, 0.2539324, 0.4627451, 0, 1, 1,
0.6298902, 0.8541481, 1.473226, 0.4705882, 0, 1, 1,
0.6318486, 1.276399, -1.100235, 0.4745098, 0, 1, 1,
0.6331004, 0.6574064, -0.01928117, 0.4823529, 0, 1, 1,
0.6392211, -1.492312, 2.654714, 0.4862745, 0, 1, 1,
0.6407212, -0.6970949, 2.512596, 0.4941176, 0, 1, 1,
0.6411904, -0.3785378, 2.870667, 0.5019608, 0, 1, 1,
0.6430227, -1.586167, 2.987448, 0.5058824, 0, 1, 1,
0.6444697, 1.165261, 0.3061013, 0.5137255, 0, 1, 1,
0.6477857, -0.6918945, 2.398429, 0.5176471, 0, 1, 1,
0.6485572, -1.007235, 3.067417, 0.5254902, 0, 1, 1,
0.6494202, 0.5428605, 1.332837, 0.5294118, 0, 1, 1,
0.6584486, -0.5254629, 1.416268, 0.5372549, 0, 1, 1,
0.6596533, 0.2982499, 1.229978, 0.5411765, 0, 1, 1,
0.6609999, -2.995016, 3.878672, 0.5490196, 0, 1, 1,
0.6620271, 1.102428, 1.619892, 0.5529412, 0, 1, 1,
0.6635342, 0.6647071, 0.7465006, 0.5607843, 0, 1, 1,
0.6648282, 0.7181665, 0.5689763, 0.5647059, 0, 1, 1,
0.6667038, -0.005099791, 0.03654567, 0.572549, 0, 1, 1,
0.6741741, -0.02323647, 0.8755671, 0.5764706, 0, 1, 1,
0.6773207, -0.9268777, 2.381386, 0.5843138, 0, 1, 1,
0.6781449, 1.030579, 1.393074, 0.5882353, 0, 1, 1,
0.6835398, -0.2490577, 0.2167235, 0.5960785, 0, 1, 1,
0.6874024, -0.0390674, -0.1048721, 0.6039216, 0, 1, 1,
0.6905156, -0.939249, 1.59655, 0.6078432, 0, 1, 1,
0.6918653, -0.6188572, 3.714867, 0.6156863, 0, 1, 1,
0.6935856, 1.306656, -0.1324497, 0.6196079, 0, 1, 1,
0.6947837, 0.3155948, 2.125743, 0.627451, 0, 1, 1,
0.6964257, 2.532362, 0.1404271, 0.6313726, 0, 1, 1,
0.6967446, 0.7766536, 1.009092, 0.6392157, 0, 1, 1,
0.7022018, 0.8945575, -1.14346, 0.6431373, 0, 1, 1,
0.7149124, -1.9229, 2.243276, 0.6509804, 0, 1, 1,
0.716038, -0.7843154, 3.640684, 0.654902, 0, 1, 1,
0.718488, -0.1944224, 2.504677, 0.6627451, 0, 1, 1,
0.7267334, -1.307623, 3.914535, 0.6666667, 0, 1, 1,
0.7306188, 0.4541993, 0.3262873, 0.6745098, 0, 1, 1,
0.7323701, -0.1490326, 1.693232, 0.6784314, 0, 1, 1,
0.7342436, 0.2596232, 2.03225, 0.6862745, 0, 1, 1,
0.7396582, 1.704725, 1.606524, 0.6901961, 0, 1, 1,
0.7436193, 1.137783, -0.6901758, 0.6980392, 0, 1, 1,
0.7544382, 0.1277814, 1.938685, 0.7058824, 0, 1, 1,
0.7616419, 1.119837, 1.890952, 0.7098039, 0, 1, 1,
0.7617748, -0.8474545, 2.898923, 0.7176471, 0, 1, 1,
0.7694144, 0.8529329, 2.426446, 0.7215686, 0, 1, 1,
0.7763609, -1.020756, 3.678878, 0.7294118, 0, 1, 1,
0.7769563, -0.979684, 1.735279, 0.7333333, 0, 1, 1,
0.7781782, 0.333676, 2.307955, 0.7411765, 0, 1, 1,
0.7791924, 0.8616002, 1.75578, 0.7450981, 0, 1, 1,
0.7799085, -0.7927427, 3.76854, 0.7529412, 0, 1, 1,
0.7874449, 0.2776479, 1.573033, 0.7568628, 0, 1, 1,
0.7930113, 1.844245, 1.17583, 0.7647059, 0, 1, 1,
0.7969931, 0.2899196, 0.8199766, 0.7686275, 0, 1, 1,
0.7985596, 0.2338975, 0.6174263, 0.7764706, 0, 1, 1,
0.801182, 1.180424, 1.048477, 0.7803922, 0, 1, 1,
0.8017014, 0.6551927, 0.3467567, 0.7882353, 0, 1, 1,
0.809499, 0.3835123, 2.347756, 0.7921569, 0, 1, 1,
0.8120045, 0.1934607, 2.346559, 0.8, 0, 1, 1,
0.8177059, 1.74251, 0.8054238, 0.8078431, 0, 1, 1,
0.8187386, 0.1107679, 2.626127, 0.8117647, 0, 1, 1,
0.8243215, 0.9005217, -0.1766251, 0.8196079, 0, 1, 1,
0.8268404, -0.08821926, 3.22288, 0.8235294, 0, 1, 1,
0.8347313, 1.642509, 0.3915913, 0.8313726, 0, 1, 1,
0.8376314, -0.6369973, 1.520169, 0.8352941, 0, 1, 1,
0.8443839, -0.4310954, 1.492065, 0.8431373, 0, 1, 1,
0.8452544, -0.1814998, 2.358863, 0.8470588, 0, 1, 1,
0.853498, 0.9995971, 3.467918, 0.854902, 0, 1, 1,
0.8543468, 1.838132, 1.452736, 0.8588235, 0, 1, 1,
0.8569228, 1.185041, -0.4690664, 0.8666667, 0, 1, 1,
0.8695785, 0.6059669, 0.6535411, 0.8705882, 0, 1, 1,
0.8711399, 1.072238, 2.029562, 0.8784314, 0, 1, 1,
0.8727627, 2.005144, 0.6840214, 0.8823529, 0, 1, 1,
0.8750194, 0.9094542, -0.0587458, 0.8901961, 0, 1, 1,
0.8758873, 0.7800774, 1.111818, 0.8941177, 0, 1, 1,
0.8857615, -1.055751, 4.286723, 0.9019608, 0, 1, 1,
0.8865201, 1.231492, 0.6228689, 0.9098039, 0, 1, 1,
0.8869021, -0.329249, 2.211642, 0.9137255, 0, 1, 1,
0.8889904, 1.37486, 1.293019, 0.9215686, 0, 1, 1,
0.8915779, 1.324648, 1.284135, 0.9254902, 0, 1, 1,
0.8917286, 2.308021, -1.087937, 0.9333333, 0, 1, 1,
0.8948368, 0.9180717, 0.0515511, 0.9372549, 0, 1, 1,
0.899596, -1.556984, 4.741253, 0.945098, 0, 1, 1,
0.9000057, 0.4121702, 1.757008, 0.9490196, 0, 1, 1,
0.9035259, 0.3239403, 1.612432, 0.9568627, 0, 1, 1,
0.9054811, -0.7926711, 2.022674, 0.9607843, 0, 1, 1,
0.9131615, 1.498048, 0.4746031, 0.9686275, 0, 1, 1,
0.9133179, -0.1139318, 0.09836472, 0.972549, 0, 1, 1,
0.9165, 0.3651869, 2.593942, 0.9803922, 0, 1, 1,
0.9192724, 0.0225131, 1.672137, 0.9843137, 0, 1, 1,
0.9198381, 1.924173, 0.1748993, 0.9921569, 0, 1, 1,
0.9205202, -1.237167, 2.638684, 0.9960784, 0, 1, 1,
0.9243183, -0.5372686, 2.502894, 1, 0, 0.9960784, 1,
0.9262894, -0.7425106, 3.209249, 1, 0, 0.9882353, 1,
0.9327513, -0.8906962, 4.434371, 1, 0, 0.9843137, 1,
0.938804, 2.283776, 0.689254, 1, 0, 0.9764706, 1,
0.9436206, -2.353191, 2.854784, 1, 0, 0.972549, 1,
0.9442607, 1.795622, 1.051383, 1, 0, 0.9647059, 1,
0.9478783, -0.3457439, 2.788172, 1, 0, 0.9607843, 1,
0.9571038, -0.1017351, 1.633917, 1, 0, 0.9529412, 1,
0.9604934, -0.3698678, 2.290345, 1, 0, 0.9490196, 1,
0.9685777, 1.251792, -0.2746901, 1, 0, 0.9411765, 1,
0.9758945, -0.6566808, 3.1452, 1, 0, 0.9372549, 1,
0.9764073, 0.2469478, 2.101581, 1, 0, 0.9294118, 1,
0.9790723, -0.5258811, 1.502757, 1, 0, 0.9254902, 1,
0.9822398, 0.5208312, 2.134335, 1, 0, 0.9176471, 1,
0.9889834, 1.089776, 1.397231, 1, 0, 0.9137255, 1,
0.9925548, -0.7908928, 2.487914, 1, 0, 0.9058824, 1,
0.9929617, 0.2452049, 1.194135, 1, 0, 0.9019608, 1,
0.9935861, -1.461477, 2.012289, 1, 0, 0.8941177, 1,
1.000584, -1.393107, 0.3927252, 1, 0, 0.8862745, 1,
1.001855, -1.057426, 3.015165, 1, 0, 0.8823529, 1,
1.010223, 0.1623313, 0.02195209, 1, 0, 0.8745098, 1,
1.010718, 1.7332, 0.3300145, 1, 0, 0.8705882, 1,
1.012096, 0.4028128, 2.561399, 1, 0, 0.8627451, 1,
1.01453, 0.2454181, 1.083061, 1, 0, 0.8588235, 1,
1.02239, -0.4799306, 2.619762, 1, 0, 0.8509804, 1,
1.035195, -1.065719, 3.503915, 1, 0, 0.8470588, 1,
1.042812, -0.08766014, 1.237709, 1, 0, 0.8392157, 1,
1.046841, -0.2588208, 3.213218, 1, 0, 0.8352941, 1,
1.047527, -0.6925696, 1.128525, 1, 0, 0.827451, 1,
1.05257, -0.3234655, 1.041191, 1, 0, 0.8235294, 1,
1.053197, 0.5850226, -0.2456064, 1, 0, 0.8156863, 1,
1.056317, -1.818566, 3.22155, 1, 0, 0.8117647, 1,
1.057396, -1.006759, 3.644322, 1, 0, 0.8039216, 1,
1.063042, -1.069975, 1.895477, 1, 0, 0.7960784, 1,
1.073568, -0.3808601, 1.262309, 1, 0, 0.7921569, 1,
1.074203, -0.4122899, 1.251804, 1, 0, 0.7843137, 1,
1.076802, -0.3587386, 2.646824, 1, 0, 0.7803922, 1,
1.079407, -0.8567073, 1.761879, 1, 0, 0.772549, 1,
1.089595, 2.157527, 0.9489139, 1, 0, 0.7686275, 1,
1.091277, 0.7017565, 0.5868856, 1, 0, 0.7607843, 1,
1.102475, 0.9027243, -0.09079324, 1, 0, 0.7568628, 1,
1.103016, 0.5848972, 0.6594231, 1, 0, 0.7490196, 1,
1.111343, 1.00815, 0.1997387, 1, 0, 0.7450981, 1,
1.114633, -0.1017051, 0.4813753, 1, 0, 0.7372549, 1,
1.117366, 0.8503935, 2.847274, 1, 0, 0.7333333, 1,
1.12235, -1.659491, 3.378875, 1, 0, 0.7254902, 1,
1.123747, 0.8891187, 0.8009758, 1, 0, 0.7215686, 1,
1.125808, -0.4702132, 1.25336, 1, 0, 0.7137255, 1,
1.131576, -0.5790942, 3.251769, 1, 0, 0.7098039, 1,
1.133436, 0.6485475, 0.0907395, 1, 0, 0.7019608, 1,
1.139279, -0.5855741, 0.506143, 1, 0, 0.6941177, 1,
1.141607, -0.1949629, 1.156484, 1, 0, 0.6901961, 1,
1.143568, 0.1904249, -0.7577992, 1, 0, 0.682353, 1,
1.163276, -0.3413956, 0.3183277, 1, 0, 0.6784314, 1,
1.165632, -0.1160651, 1.554485, 1, 0, 0.6705883, 1,
1.168887, -0.1173879, 2.57182, 1, 0, 0.6666667, 1,
1.170524, -0.3839835, 1.801821, 1, 0, 0.6588235, 1,
1.174489, -0.684779, 1.55667, 1, 0, 0.654902, 1,
1.179611, 0.429816, 2.276913, 1, 0, 0.6470588, 1,
1.185421, -0.9690474, 3.421815, 1, 0, 0.6431373, 1,
1.187877, -0.4094071, 0.867723, 1, 0, 0.6352941, 1,
1.193884, 0.5878095, -0.1311968, 1, 0, 0.6313726, 1,
1.195069, -0.3690001, 2.046122, 1, 0, 0.6235294, 1,
1.211776, 0.3732809, 2.658569, 1, 0, 0.6196079, 1,
1.214905, 0.8217449, 0.9200199, 1, 0, 0.6117647, 1,
1.218414, -0.9045823, 2.212102, 1, 0, 0.6078432, 1,
1.219523, 2.178886, 1.14427, 1, 0, 0.6, 1,
1.220756, -1.788939, 0.3023269, 1, 0, 0.5921569, 1,
1.244245, 0.4942032, 1.31105, 1, 0, 0.5882353, 1,
1.254354, 0.121931, 1.791318, 1, 0, 0.5803922, 1,
1.257811, -0.2861953, 0.8408382, 1, 0, 0.5764706, 1,
1.261625, 2.215238, -0.4496425, 1, 0, 0.5686275, 1,
1.263756, -0.1037955, 0.770025, 1, 0, 0.5647059, 1,
1.273663, -0.7372044, 1.520795, 1, 0, 0.5568628, 1,
1.277054, 1.867275, -0.7926137, 1, 0, 0.5529412, 1,
1.277759, 0.7990584, 2.242323, 1, 0, 0.5450981, 1,
1.278713, 0.651712, 0.6173875, 1, 0, 0.5411765, 1,
1.279514, 0.6102006, 0.09155428, 1, 0, 0.5333334, 1,
1.287983, 0.9535714, -0.4489915, 1, 0, 0.5294118, 1,
1.290476, -1.547224, 2.030017, 1, 0, 0.5215687, 1,
1.305384, -0.04012708, 3.500957, 1, 0, 0.5176471, 1,
1.311547, -2.485523, 3.034135, 1, 0, 0.509804, 1,
1.313518, 0.06670659, 1.505518, 1, 0, 0.5058824, 1,
1.319312, -1.416529, 0.27571, 1, 0, 0.4980392, 1,
1.320601, -0.5316752, 1.62481, 1, 0, 0.4901961, 1,
1.320708, 1.185478, 2.691451, 1, 0, 0.4862745, 1,
1.337504, -0.3967882, 1.307453, 1, 0, 0.4784314, 1,
1.34476, -1.492175, 5.146631, 1, 0, 0.4745098, 1,
1.34964, 1.118727, 0.8758951, 1, 0, 0.4666667, 1,
1.352714, -0.1570453, 2.889378, 1, 0, 0.4627451, 1,
1.356412, 0.9916875, 0.6267518, 1, 0, 0.454902, 1,
1.366095, 1.741469, -0.09193879, 1, 0, 0.4509804, 1,
1.366284, 0.1552021, 1.194002, 1, 0, 0.4431373, 1,
1.379063, -0.05076489, 0.5695329, 1, 0, 0.4392157, 1,
1.384757, -1.399129, 2.25472, 1, 0, 0.4313726, 1,
1.385691, 0.1463526, 1.209963, 1, 0, 0.427451, 1,
1.386181, -1.303454, 0.7551682, 1, 0, 0.4196078, 1,
1.390837, -0.6711591, 2.415424, 1, 0, 0.4156863, 1,
1.400426, -1.240941, 2.740324, 1, 0, 0.4078431, 1,
1.401174, 1.517896, 0.1998837, 1, 0, 0.4039216, 1,
1.402331, 0.398193, 1.626999, 1, 0, 0.3960784, 1,
1.402682, -0.9860026, 3.209225, 1, 0, 0.3882353, 1,
1.403818, -1.526507, 1.994103, 1, 0, 0.3843137, 1,
1.410307, 0.05702376, 1.214222, 1, 0, 0.3764706, 1,
1.416065, 2.154493, 0.8601745, 1, 0, 0.372549, 1,
1.421262, -0.4545006, 3.18937, 1, 0, 0.3647059, 1,
1.4241, -1.400679, 1.482551, 1, 0, 0.3607843, 1,
1.42618, -0.4930033, 2.265398, 1, 0, 0.3529412, 1,
1.437104, -0.6103237, 0.7965365, 1, 0, 0.3490196, 1,
1.457499, 0.9516806, 1.907059, 1, 0, 0.3411765, 1,
1.508928, 0.6982016, 1.32059, 1, 0, 0.3372549, 1,
1.511576, 0.6933702, 0.5365588, 1, 0, 0.3294118, 1,
1.51404, 1.316025, 1.118524, 1, 0, 0.3254902, 1,
1.528827, -0.7580496, 1.086789, 1, 0, 0.3176471, 1,
1.534532, -0.5065808, 2.179494, 1, 0, 0.3137255, 1,
1.538704, 1.321149, 1.706841, 1, 0, 0.3058824, 1,
1.548922, -0.4941345, 1.533192, 1, 0, 0.2980392, 1,
1.549799, -1.599619, 4.570499, 1, 0, 0.2941177, 1,
1.561133, 2.849047, 1.483191, 1, 0, 0.2862745, 1,
1.563482, -0.8723211, 1.931925, 1, 0, 0.282353, 1,
1.572161, -0.8217131, 2.320498, 1, 0, 0.2745098, 1,
1.576736, 0.4864158, 1.180931, 1, 0, 0.2705882, 1,
1.58299, 0.2838114, 1.00386, 1, 0, 0.2627451, 1,
1.609999, 0.1630388, 0.5937427, 1, 0, 0.2588235, 1,
1.633863, 0.1448951, 0.7014421, 1, 0, 0.2509804, 1,
1.638271, 2.08441, 0.4830809, 1, 0, 0.2470588, 1,
1.645044, -0.7866753, 0.9956543, 1, 0, 0.2392157, 1,
1.651159, -1.5036, 2.781118, 1, 0, 0.2352941, 1,
1.658618, 0.3004949, 1.107443, 1, 0, 0.227451, 1,
1.661375, -1.502169, 1.081901, 1, 0, 0.2235294, 1,
1.665958, 0.3048726, 2.71874, 1, 0, 0.2156863, 1,
1.684827, -0.9768005, 2.018807, 1, 0, 0.2117647, 1,
1.698942, 2.196279, 0.5183328, 1, 0, 0.2039216, 1,
1.70281, 0.03753333, 2.054592, 1, 0, 0.1960784, 1,
1.710079, -1.31088, 4.051638, 1, 0, 0.1921569, 1,
1.773512, -0.505209, 2.482715, 1, 0, 0.1843137, 1,
1.776417, 0.9092922, 0.8087988, 1, 0, 0.1803922, 1,
1.811522, -0.8939046, 1.882999, 1, 0, 0.172549, 1,
1.828199, 1.148743, 0.5798712, 1, 0, 0.1686275, 1,
1.830323, -1.536287, 0.5145087, 1, 0, 0.1607843, 1,
1.861256, -2.24929, 2.997568, 1, 0, 0.1568628, 1,
1.86567, 0.07565434, 1.754596, 1, 0, 0.1490196, 1,
1.88121, 0.8067045, 2.336711, 1, 0, 0.145098, 1,
1.882372, 0.02830403, -0.4440784, 1, 0, 0.1372549, 1,
1.903345, 1.720935, 2.129437, 1, 0, 0.1333333, 1,
1.90654, -1.351031, 1.495242, 1, 0, 0.1254902, 1,
1.94259, 1.904164, 2.38905, 1, 0, 0.1215686, 1,
1.980723, 0.002821452, 1.005442, 1, 0, 0.1137255, 1,
1.982594, 0.5724719, 0.5141954, 1, 0, 0.1098039, 1,
2.007883, 0.7570108, 2.35197, 1, 0, 0.1019608, 1,
2.013079, -1.691423, 2.900011, 1, 0, 0.09411765, 1,
2.034867, -0.05226881, 2.401909, 1, 0, 0.09019608, 1,
2.055969, 2.043696, 0.5133579, 1, 0, 0.08235294, 1,
2.082536, 0.1972563, 0.8471206, 1, 0, 0.07843138, 1,
2.137482, -0.1039205, 1.762245, 1, 0, 0.07058824, 1,
2.14759, -1.108918, 2.345629, 1, 0, 0.06666667, 1,
2.185528, -0.6986941, 2.417602, 1, 0, 0.05882353, 1,
2.200677, -1.69917, 2.056434, 1, 0, 0.05490196, 1,
2.207095, 0.4294232, 0.8971378, 1, 0, 0.04705882, 1,
2.281053, 0.2943236, 2.915641, 1, 0, 0.04313726, 1,
2.332073, 2.121945, 0.954937, 1, 0, 0.03529412, 1,
2.410444, -0.2554144, 0.5333962, 1, 0, 0.03137255, 1,
2.588542, -1.166127, 4.011727, 1, 0, 0.02352941, 1,
2.724502, -1.036814, 1.564493, 1, 0, 0.01960784, 1,
2.926797, 1.238876, 0.6204947, 1, 0, 0.01176471, 1,
3.251467, -0.541455, 2.309955, 1, 0, 0.007843138, 1
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
-0.06603467, -5.095239, -7.041796, 0, -0.5, 0.5, 0.5,
-0.06603467, -5.095239, -7.041796, 1, -0.5, 0.5, 0.5,
-0.06603467, -5.095239, -7.041796, 1, 1.5, 0.5, 0.5,
-0.06603467, -5.095239, -7.041796, 0, 1.5, 0.5, 0.5
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
-4.50817, -0.5290347, -7.041796, 0, -0.5, 0.5, 0.5,
-4.50817, -0.5290347, -7.041796, 1, -0.5, 0.5, 0.5,
-4.50817, -0.5290347, -7.041796, 1, 1.5, 0.5, 0.5,
-4.50817, -0.5290347, -7.041796, 0, 1.5, 0.5, 0.5
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
-4.50817, -5.095239, 0.03342533, 0, -0.5, 0.5, 0.5,
-4.50817, -5.095239, 0.03342533, 1, -0.5, 0.5, 0.5,
-4.50817, -5.095239, 0.03342533, 1, 1.5, 0.5, 0.5,
-4.50817, -5.095239, 0.03342533, 0, 1.5, 0.5, 0.5
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
-3, -4.0415, -5.409052,
3, -4.0415, -5.409052,
-3, -4.0415, -5.409052,
-3, -4.217123, -5.681176,
-2, -4.0415, -5.409052,
-2, -4.217123, -5.681176,
-1, -4.0415, -5.409052,
-1, -4.217123, -5.681176,
0, -4.0415, -5.409052,
0, -4.217123, -5.681176,
1, -4.0415, -5.409052,
1, -4.217123, -5.681176,
2, -4.0415, -5.409052,
2, -4.217123, -5.681176,
3, -4.0415, -5.409052,
3, -4.217123, -5.681176
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
-3, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
-3, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
-3, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
-3, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
-2, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
-2, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
-2, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
-2, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
-1, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
-1, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
-1, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
-1, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
0, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
0, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
0, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
0, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
1, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
1, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
1, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
1, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
2, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
2, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
2, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
2, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5,
3, -4.568369, -6.225424, 0, -0.5, 0.5, 0.5,
3, -4.568369, -6.225424, 1, -0.5, 0.5, 0.5,
3, -4.568369, -6.225424, 1, 1.5, 0.5, 0.5,
3, -4.568369, -6.225424, 0, 1.5, 0.5, 0.5
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
-3.483062, -3, -5.409052,
-3.483062, 2, -5.409052,
-3.483062, -3, -5.409052,
-3.653913, -3, -5.681176,
-3.483062, -2, -5.409052,
-3.653913, -2, -5.681176,
-3.483062, -1, -5.409052,
-3.653913, -1, -5.681176,
-3.483062, 0, -5.409052,
-3.653913, 0, -5.681176,
-3.483062, 1, -5.409052,
-3.653913, 1, -5.681176,
-3.483062, 2, -5.409052,
-3.653913, 2, -5.681176
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
-3.995616, -3, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, -3, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, -3, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, -3, -6.225424, 0, 1.5, 0.5, 0.5,
-3.995616, -2, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, -2, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, -2, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, -2, -6.225424, 0, 1.5, 0.5, 0.5,
-3.995616, -1, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, -1, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, -1, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, -1, -6.225424, 0, 1.5, 0.5, 0.5,
-3.995616, 0, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, 0, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, 0, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, 0, -6.225424, 0, 1.5, 0.5, 0.5,
-3.995616, 1, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, 1, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, 1, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, 1, -6.225424, 0, 1.5, 0.5, 0.5,
-3.995616, 2, -6.225424, 0, -0.5, 0.5, 0.5,
-3.995616, 2, -6.225424, 1, -0.5, 0.5, 0.5,
-3.995616, 2, -6.225424, 1, 1.5, 0.5, 0.5,
-3.995616, 2, -6.225424, 0, 1.5, 0.5, 0.5
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
-3.483062, -4.0415, -4,
-3.483062, -4.0415, 4,
-3.483062, -4.0415, -4,
-3.653913, -4.217123, -4,
-3.483062, -4.0415, -2,
-3.653913, -4.217123, -2,
-3.483062, -4.0415, 0,
-3.653913, -4.217123, 0,
-3.483062, -4.0415, 2,
-3.653913, -4.217123, 2,
-3.483062, -4.0415, 4,
-3.653913, -4.217123, 4
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
-3.995616, -4.568369, -4, 0, -0.5, 0.5, 0.5,
-3.995616, -4.568369, -4, 1, -0.5, 0.5, 0.5,
-3.995616, -4.568369, -4, 1, 1.5, 0.5, 0.5,
-3.995616, -4.568369, -4, 0, 1.5, 0.5, 0.5,
-3.995616, -4.568369, -2, 0, -0.5, 0.5, 0.5,
-3.995616, -4.568369, -2, 1, -0.5, 0.5, 0.5,
-3.995616, -4.568369, -2, 1, 1.5, 0.5, 0.5,
-3.995616, -4.568369, -2, 0, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 0, 0, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 0, 1, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 0, 1, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 0, 0, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 2, 0, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 2, 1, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 2, 1, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 2, 0, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 4, 0, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 4, 1, -0.5, 0.5, 0.5,
-3.995616, -4.568369, 4, 1, 1.5, 0.5, 0.5,
-3.995616, -4.568369, 4, 0, 1.5, 0.5, 0.5
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
-3.483062, -4.0415, -5.409052,
-3.483062, 2.98343, -5.409052,
-3.483062, -4.0415, 5.475903,
-3.483062, 2.98343, 5.475903,
-3.483062, -4.0415, -5.409052,
-3.483062, -4.0415, 5.475903,
-3.483062, 2.98343, -5.409052,
-3.483062, 2.98343, 5.475903,
-3.483062, -4.0415, -5.409052,
3.350992, -4.0415, -5.409052,
-3.483062, -4.0415, 5.475903,
3.350992, -4.0415, 5.475903,
-3.483062, 2.98343, -5.409052,
3.350992, 2.98343, -5.409052,
-3.483062, 2.98343, 5.475903,
3.350992, 2.98343, 5.475903,
3.350992, -4.0415, -5.409052,
3.350992, 2.98343, -5.409052,
3.350992, -4.0415, 5.475903,
3.350992, 2.98343, 5.475903,
3.350992, -4.0415, -5.409052,
3.350992, -4.0415, 5.475903,
3.350992, 2.98343, -5.409052,
3.350992, 2.98343, 5.475903
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
var radius = 7.821242;
var distance = 34.79759;
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
mvMatrix.translate( 0.06603467, 0.5290347, -0.03342533 );
mvMatrix.scale( 1.237403, 1.203781, 0.7768962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79759);
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


