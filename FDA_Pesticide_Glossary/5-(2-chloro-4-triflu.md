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
-3.257636, 0.4076562, -3.066293, 1, 0, 0, 1,
-3.040498, 1.476208, -1.760813, 1, 0.007843138, 0, 1,
-2.483476, 0.2829578, -1.146762, 1, 0.01176471, 0, 1,
-2.47972, -0.4928499, -1.729607, 1, 0.01960784, 0, 1,
-2.473908, 0.2118161, -2.114119, 1, 0.02352941, 0, 1,
-2.463552, -0.3643596, -1.110104, 1, 0.03137255, 0, 1,
-2.396558, 0.433968, -1.702179, 1, 0.03529412, 0, 1,
-2.380658, 0.654273, -0.04568695, 1, 0.04313726, 0, 1,
-2.380502, 1.764012, -2.149219, 1, 0.04705882, 0, 1,
-2.330098, -0.4438996, -1.743357, 1, 0.05490196, 0, 1,
-2.280358, 2.270594, -0.9358281, 1, 0.05882353, 0, 1,
-2.264946, 0.3773606, -0.319526, 1, 0.06666667, 0, 1,
-2.228306, -0.1208653, -3.27491, 1, 0.07058824, 0, 1,
-2.221935, 2.49887, -0.1856864, 1, 0.07843138, 0, 1,
-2.177984, -1.938888, -0.3634464, 1, 0.08235294, 0, 1,
-2.153986, 0.7081221, 0.9287808, 1, 0.09019608, 0, 1,
-2.151091, -0.4206852, -1.720109, 1, 0.09411765, 0, 1,
-2.119916, -0.6668909, -2.507468, 1, 0.1019608, 0, 1,
-2.104553, -0.3338869, -0.8577142, 1, 0.1098039, 0, 1,
-2.039093, 0.03668571, -1.850595, 1, 0.1137255, 0, 1,
-2.034442, -0.2083899, -0.6425633, 1, 0.1215686, 0, 1,
-2.006745, 0.787361, -1.698306, 1, 0.1254902, 0, 1,
-1.98228, 0.4977569, -2.422266, 1, 0.1333333, 0, 1,
-1.957934, -1.245817, -1.235331, 1, 0.1372549, 0, 1,
-1.954997, -0.2109844, -1.531169, 1, 0.145098, 0, 1,
-1.915778, 0.7449389, -0.007152687, 1, 0.1490196, 0, 1,
-1.906591, -0.1991441, -2.050451, 1, 0.1568628, 0, 1,
-1.880433, -0.8279028, -2.226256, 1, 0.1607843, 0, 1,
-1.874583, 0.6033608, -3.143939, 1, 0.1686275, 0, 1,
-1.862182, -0.909111, -0.6928768, 1, 0.172549, 0, 1,
-1.852421, 0.377842, -1.186739, 1, 0.1803922, 0, 1,
-1.813128, -0.677794, -3.223153, 1, 0.1843137, 0, 1,
-1.769654, -1.240437, -0.6895915, 1, 0.1921569, 0, 1,
-1.768366, -0.4117175, -0.198438, 1, 0.1960784, 0, 1,
-1.750221, 0.5426802, -1.158677, 1, 0.2039216, 0, 1,
-1.743474, -0.09273361, -2.391439, 1, 0.2117647, 0, 1,
-1.743372, 1.054953, -3.389663, 1, 0.2156863, 0, 1,
-1.713267, 0.2784249, -1.282908, 1, 0.2235294, 0, 1,
-1.70364, -0.8171435, -2.335384, 1, 0.227451, 0, 1,
-1.698887, 1.037342, -0.7613202, 1, 0.2352941, 0, 1,
-1.681304, -0.1839887, -2.054019, 1, 0.2392157, 0, 1,
-1.678229, 0.011084, -1.072672, 1, 0.2470588, 0, 1,
-1.642914, 1.495579, -0.2416757, 1, 0.2509804, 0, 1,
-1.639651, 0.2473291, -2.032598, 1, 0.2588235, 0, 1,
-1.606813, 0.2522704, -1.279061, 1, 0.2627451, 0, 1,
-1.605037, 2.440448, 0.1868203, 1, 0.2705882, 0, 1,
-1.596831, -1.125104, -1.818066, 1, 0.2745098, 0, 1,
-1.588703, -1.050843, -0.9243429, 1, 0.282353, 0, 1,
-1.588542, 0.06285057, -2.570593, 1, 0.2862745, 0, 1,
-1.586606, -0.2503464, -1.989265, 1, 0.2941177, 0, 1,
-1.586199, -0.01317123, -2.017956, 1, 0.3019608, 0, 1,
-1.579691, 0.6209046, -0.3688826, 1, 0.3058824, 0, 1,
-1.577968, -0.4367136, -0.9358385, 1, 0.3137255, 0, 1,
-1.571384, 1.063457, 0.1049697, 1, 0.3176471, 0, 1,
-1.563449, -0.4645294, -0.9482378, 1, 0.3254902, 0, 1,
-1.559029, -0.426411, -1.792544, 1, 0.3294118, 0, 1,
-1.55179, -0.4137359, -2.723079, 1, 0.3372549, 0, 1,
-1.532187, -0.008260236, -0.678524, 1, 0.3411765, 0, 1,
-1.532077, -1.396443, -0.5661377, 1, 0.3490196, 0, 1,
-1.529002, 0.03314217, -1.978737, 1, 0.3529412, 0, 1,
-1.517303, 0.3900292, 0.7684737, 1, 0.3607843, 0, 1,
-1.511868, -0.205742, -1.580738, 1, 0.3647059, 0, 1,
-1.498404, 0.3710281, -0.6167834, 1, 0.372549, 0, 1,
-1.469444, 0.5319569, -0.9154961, 1, 0.3764706, 0, 1,
-1.450979, 0.7602421, -0.9674958, 1, 0.3843137, 0, 1,
-1.447134, -2.303751, -2.462748, 1, 0.3882353, 0, 1,
-1.445336, -0.1942578, -1.907265, 1, 0.3960784, 0, 1,
-1.431642, -0.0007189929, -2.025889, 1, 0.4039216, 0, 1,
-1.429055, -0.1680613, -2.036921, 1, 0.4078431, 0, 1,
-1.425802, -1.753614, -1.956313, 1, 0.4156863, 0, 1,
-1.420742, 0.1627153, 0.1519445, 1, 0.4196078, 0, 1,
-1.418003, 0.9786367, 0.9006641, 1, 0.427451, 0, 1,
-1.412934, 2.114268, -0.3723409, 1, 0.4313726, 0, 1,
-1.406363, 0.4976045, -2.832912, 1, 0.4392157, 0, 1,
-1.40032, 0.4249101, -1.895802, 1, 0.4431373, 0, 1,
-1.382659, 0.8767675, -0.8459805, 1, 0.4509804, 0, 1,
-1.379841, 0.6761681, -0.5682788, 1, 0.454902, 0, 1,
-1.377695, 1.790519, -1.966748, 1, 0.4627451, 0, 1,
-1.373901, 1.320822, 0.9949735, 1, 0.4666667, 0, 1,
-1.356447, -0.2214203, -1.224845, 1, 0.4745098, 0, 1,
-1.345708, 1.045932, -0.8455588, 1, 0.4784314, 0, 1,
-1.340431, 0.6353375, -1.496108, 1, 0.4862745, 0, 1,
-1.337606, -0.938394, -2.033693, 1, 0.4901961, 0, 1,
-1.333813, 0.8314306, 0.2811268, 1, 0.4980392, 0, 1,
-1.322095, 1.429794, -0.06974098, 1, 0.5058824, 0, 1,
-1.308836, -1.188145, -0.0609872, 1, 0.509804, 0, 1,
-1.308818, 1.114751, -1.322828, 1, 0.5176471, 0, 1,
-1.308241, -1.25566, -2.162204, 1, 0.5215687, 0, 1,
-1.294576, -1.406832, -2.359255, 1, 0.5294118, 0, 1,
-1.286796, 1.483081, -0.498027, 1, 0.5333334, 0, 1,
-1.282238, 1.212161, -0.2750681, 1, 0.5411765, 0, 1,
-1.280617, 0.09013269, -0.9267635, 1, 0.5450981, 0, 1,
-1.271294, 0.3751978, -1.178995, 1, 0.5529412, 0, 1,
-1.269217, -0.04703247, -0.1952615, 1, 0.5568628, 0, 1,
-1.267959, 0.5696086, -1.315072, 1, 0.5647059, 0, 1,
-1.239884, -0.7698371, -2.523956, 1, 0.5686275, 0, 1,
-1.231662, -1.245297, -3.18898, 1, 0.5764706, 0, 1,
-1.223229, -0.246025, -0.7175833, 1, 0.5803922, 0, 1,
-1.214579, -0.6110537, -1.28234, 1, 0.5882353, 0, 1,
-1.211602, 0.1157465, -2.136903, 1, 0.5921569, 0, 1,
-1.206886, 0.3052945, -0.5020595, 1, 0.6, 0, 1,
-1.206032, -0.2422768, -1.028525, 1, 0.6078432, 0, 1,
-1.20281, -1.848058, -3.230769, 1, 0.6117647, 0, 1,
-1.186334, 1.508603, -0.5762304, 1, 0.6196079, 0, 1,
-1.181331, -1.801043, -2.441339, 1, 0.6235294, 0, 1,
-1.177164, -1.883072, -1.920087, 1, 0.6313726, 0, 1,
-1.168576, 0.08793012, -1.848663, 1, 0.6352941, 0, 1,
-1.168049, 1.133018, -0.1694042, 1, 0.6431373, 0, 1,
-1.160433, 1.536099, -2.306397, 1, 0.6470588, 0, 1,
-1.16023, -0.250704, -1.338671, 1, 0.654902, 0, 1,
-1.159068, 0.6611697, -3.368237, 1, 0.6588235, 0, 1,
-1.15548, 0.981986, 0.6790708, 1, 0.6666667, 0, 1,
-1.154803, -1.579104, -3.670451, 1, 0.6705883, 0, 1,
-1.143657, -1.163546, -3.468292, 1, 0.6784314, 0, 1,
-1.142063, 0.9079893, -1.207493, 1, 0.682353, 0, 1,
-1.139896, 1.640365, -0.838197, 1, 0.6901961, 0, 1,
-1.135125, 1.68527, -1.488476, 1, 0.6941177, 0, 1,
-1.125399, -0.07801929, -2.376772, 1, 0.7019608, 0, 1,
-1.123924, 0.6494688, -0.01324655, 1, 0.7098039, 0, 1,
-1.122244, 1.374211, -1.040204, 1, 0.7137255, 0, 1,
-1.120462, 1.14447, -0.6832736, 1, 0.7215686, 0, 1,
-1.119456, 0.1723945, 1.202864, 1, 0.7254902, 0, 1,
-1.119349, -0.465827, -2.740639, 1, 0.7333333, 0, 1,
-1.118614, 0.09063011, -3.046716, 1, 0.7372549, 0, 1,
-1.118418, 0.7047767, -0.2412059, 1, 0.7450981, 0, 1,
-1.113199, 0.763137, -1.153147, 1, 0.7490196, 0, 1,
-1.109376, 0.6578874, -0.6842409, 1, 0.7568628, 0, 1,
-1.106241, -0.3735337, -0.623225, 1, 0.7607843, 0, 1,
-1.105284, 1.354844, -0.789708, 1, 0.7686275, 0, 1,
-1.099425, 0.4234288, -0.3155351, 1, 0.772549, 0, 1,
-1.091112, 0.1036597, -2.385396, 1, 0.7803922, 0, 1,
-1.087228, 0.9890105, -0.5055308, 1, 0.7843137, 0, 1,
-1.073669, 0.1149257, -0.9854472, 1, 0.7921569, 0, 1,
-1.069469, -0.03768992, -1.523013, 1, 0.7960784, 0, 1,
-1.066887, -0.3762446, -4.675545, 1, 0.8039216, 0, 1,
-1.066495, -0.5564077, -0.2160268, 1, 0.8117647, 0, 1,
-1.056343, 0.7069242, -2.118501, 1, 0.8156863, 0, 1,
-1.054992, 0.452307, -0.2708743, 1, 0.8235294, 0, 1,
-1.051893, 1.086697, 2.185984, 1, 0.827451, 0, 1,
-1.051725, -0.5861911, -1.717301, 1, 0.8352941, 0, 1,
-1.05081, -0.09250186, -1.488582, 1, 0.8392157, 0, 1,
-1.048964, 0.8155964, -1.612401, 1, 0.8470588, 0, 1,
-1.045303, -0.4042161, -1.578841, 1, 0.8509804, 0, 1,
-1.041508, 1.045663, -1.904831, 1, 0.8588235, 0, 1,
-1.038107, -0.206951, -0.9829867, 1, 0.8627451, 0, 1,
-1.029478, -2.105189, -3.499984, 1, 0.8705882, 0, 1,
-1.028315, 0.8152501, -1.521886, 1, 0.8745098, 0, 1,
-1.026689, -1.24783, -2.49071, 1, 0.8823529, 0, 1,
-1.025488, -1.398205, -2.963038, 1, 0.8862745, 0, 1,
-1.02213, 0.6509091, -1.025924, 1, 0.8941177, 0, 1,
-1.01858, -0.1962677, -2.533905, 1, 0.8980392, 0, 1,
-1.016381, 0.4368401, -2.054828, 1, 0.9058824, 0, 1,
-1.011813, -1.400992, -3.332757, 1, 0.9137255, 0, 1,
-1.009647, 1.95003, -0.865067, 1, 0.9176471, 0, 1,
-1.003647, 0.6855084, -2.714426, 1, 0.9254902, 0, 1,
-1.00221, -1.226511, -2.186214, 1, 0.9294118, 0, 1,
-1.001281, 1.372153, 0.8248321, 1, 0.9372549, 0, 1,
-1.000592, 1.114612, 0.4439166, 1, 0.9411765, 0, 1,
-0.9992468, -0.8351132, -2.241646, 1, 0.9490196, 0, 1,
-0.9979594, 0.3470174, -0.7407188, 1, 0.9529412, 0, 1,
-0.9858326, -0.7517759, -2.858082, 1, 0.9607843, 0, 1,
-0.981162, 0.2212393, -0.5286795, 1, 0.9647059, 0, 1,
-0.9793175, -1.213746, -2.786797, 1, 0.972549, 0, 1,
-0.9761521, -0.2673442, -1.249619, 1, 0.9764706, 0, 1,
-0.9669401, 0.8835089, -0.3493282, 1, 0.9843137, 0, 1,
-0.9665074, 0.4497428, -1.481057, 1, 0.9882353, 0, 1,
-0.9493516, 0.8810298, -0.9931238, 1, 0.9960784, 0, 1,
-0.944746, -0.4961215, -2.867403, 0.9960784, 1, 0, 1,
-0.9443946, -0.7921098, -3.434033, 0.9921569, 1, 0, 1,
-0.9438329, 0.103925, -0.2322897, 0.9843137, 1, 0, 1,
-0.9314379, 1.459166, -0.2369754, 0.9803922, 1, 0, 1,
-0.9298266, 0.9203267, -0.101508, 0.972549, 1, 0, 1,
-0.9271799, -1.189933, -3.757009, 0.9686275, 1, 0, 1,
-0.918492, -1.339202, -0.48909, 0.9607843, 1, 0, 1,
-0.9153738, -0.3768761, -2.215444, 0.9568627, 1, 0, 1,
-0.9152138, -0.4506038, -0.1146249, 0.9490196, 1, 0, 1,
-0.9147802, -0.3615764, -1.018685, 0.945098, 1, 0, 1,
-0.9126887, 0.131533, -1.331181, 0.9372549, 1, 0, 1,
-0.9114786, 0.7898628, -0.9110044, 0.9333333, 1, 0, 1,
-0.9103643, -2.368513, -3.269431, 0.9254902, 1, 0, 1,
-0.9101942, 0.1074907, -0.6704689, 0.9215686, 1, 0, 1,
-0.9053587, 0.173914, -1.192512, 0.9137255, 1, 0, 1,
-0.8996384, 0.3645204, -1.424996, 0.9098039, 1, 0, 1,
-0.8959765, 0.5254787, -0.9407417, 0.9019608, 1, 0, 1,
-0.8943822, 0.4240794, -2.368308, 0.8941177, 1, 0, 1,
-0.88874, 1.936671, -1.010607, 0.8901961, 1, 0, 1,
-0.8849224, 0.2915289, 0.4102631, 0.8823529, 1, 0, 1,
-0.8742422, 0.3056229, -2.354599, 0.8784314, 1, 0, 1,
-0.8737937, 1.360008, -1.909956, 0.8705882, 1, 0, 1,
-0.8587873, -0.5066162, -1.537592, 0.8666667, 1, 0, 1,
-0.8554305, -0.1280857, -3.179432, 0.8588235, 1, 0, 1,
-0.8537063, -1.970263, -3.313454, 0.854902, 1, 0, 1,
-0.8461847, -0.5644729, -1.814883, 0.8470588, 1, 0, 1,
-0.8454388, 0.2278931, -0.8348444, 0.8431373, 1, 0, 1,
-0.8421779, 1.745244, -1.701992, 0.8352941, 1, 0, 1,
-0.8379359, -2.463393, -2.710418, 0.8313726, 1, 0, 1,
-0.8334084, 0.2319375, -0.8580967, 0.8235294, 1, 0, 1,
-0.8313885, -0.3174475, -2.357383, 0.8196079, 1, 0, 1,
-0.8307615, 0.5437512, -0.262036, 0.8117647, 1, 0, 1,
-0.8295336, -1.609083, -3.782314, 0.8078431, 1, 0, 1,
-0.8288007, -0.03725432, -1.77469, 0.8, 1, 0, 1,
-0.8248915, 0.5064114, -1.469054, 0.7921569, 1, 0, 1,
-0.8173351, 0.589834, -1.145609, 0.7882353, 1, 0, 1,
-0.8072773, 0.9788156, -1.962896, 0.7803922, 1, 0, 1,
-0.8071941, 2.328629, 0.3455617, 0.7764706, 1, 0, 1,
-0.7980149, -0.83567, -3.555546, 0.7686275, 1, 0, 1,
-0.7944629, -1.014189, -0.6454011, 0.7647059, 1, 0, 1,
-0.7930825, -0.3323683, -1.676934, 0.7568628, 1, 0, 1,
-0.791065, 0.571852, 0.07604961, 0.7529412, 1, 0, 1,
-0.7879367, -0.2918527, -0.2586859, 0.7450981, 1, 0, 1,
-0.786393, 0.3507153, -2.41179, 0.7411765, 1, 0, 1,
-0.7855443, 0.6383162, -2.527622, 0.7333333, 1, 0, 1,
-0.7799791, 0.7465509, -0.603487, 0.7294118, 1, 0, 1,
-0.7787489, 0.9065753, -0.7534804, 0.7215686, 1, 0, 1,
-0.7785738, -0.06971621, -1.781655, 0.7176471, 1, 0, 1,
-0.7721175, -1.24091, -2.233018, 0.7098039, 1, 0, 1,
-0.7690466, 1.762346, -3.138521, 0.7058824, 1, 0, 1,
-0.7631955, 1.097175, 0.5524571, 0.6980392, 1, 0, 1,
-0.7597771, 0.1313807, -1.378156, 0.6901961, 1, 0, 1,
-0.7593264, -0.8909175, -3.848454, 0.6862745, 1, 0, 1,
-0.7519848, -0.292461, 0.6264388, 0.6784314, 1, 0, 1,
-0.7479146, -1.054044, -2.383254, 0.6745098, 1, 0, 1,
-0.7461261, -0.8609939, -1.959479, 0.6666667, 1, 0, 1,
-0.7391433, 0.8987257, 0.2670543, 0.6627451, 1, 0, 1,
-0.7331578, -1.168709, -1.971436, 0.654902, 1, 0, 1,
-0.7327309, -0.2134277, -1.854814, 0.6509804, 1, 0, 1,
-0.7268315, 0.4301243, -0.870253, 0.6431373, 1, 0, 1,
-0.7237966, 0.6191456, -1.497478, 0.6392157, 1, 0, 1,
-0.7193689, -0.9387375, -2.05604, 0.6313726, 1, 0, 1,
-0.7170088, -0.2460829, -1.057032, 0.627451, 1, 0, 1,
-0.7120705, 0.6349795, -0.4038725, 0.6196079, 1, 0, 1,
-0.7102826, -0.07957821, -2.523082, 0.6156863, 1, 0, 1,
-0.7094689, 0.9145714, -1.226758, 0.6078432, 1, 0, 1,
-0.7090382, 1.825292, 0.3568501, 0.6039216, 1, 0, 1,
-0.6941995, -0.6012471, -1.751873, 0.5960785, 1, 0, 1,
-0.6909795, -1.034862, -1.680976, 0.5882353, 1, 0, 1,
-0.6877291, 1.08881, -1.140597, 0.5843138, 1, 0, 1,
-0.6869291, -0.3862828, -1.181029, 0.5764706, 1, 0, 1,
-0.6784943, -1.555925, -1.68782, 0.572549, 1, 0, 1,
-0.6766052, -1.098887, -2.827785, 0.5647059, 1, 0, 1,
-0.6763794, -0.8032904, -2.014579, 0.5607843, 1, 0, 1,
-0.6753395, 0.7638334, -1.850443, 0.5529412, 1, 0, 1,
-0.6747624, -0.6506289, -3.568858, 0.5490196, 1, 0, 1,
-0.6741554, -0.7471148, -1.056839, 0.5411765, 1, 0, 1,
-0.6694547, -0.02768898, -2.830737, 0.5372549, 1, 0, 1,
-0.6685735, 0.8665681, -0.2686243, 0.5294118, 1, 0, 1,
-0.6676782, -2.247557, -3.681509, 0.5254902, 1, 0, 1,
-0.6644331, -0.4603589, -0.9405977, 0.5176471, 1, 0, 1,
-0.6642968, 0.513184, -0.8365142, 0.5137255, 1, 0, 1,
-0.6612743, -2.38465, -2.451745, 0.5058824, 1, 0, 1,
-0.6589943, -0.6768187, -0.5351789, 0.5019608, 1, 0, 1,
-0.6581007, -0.4599002, -1.858525, 0.4941176, 1, 0, 1,
-0.6565915, -0.1144835, -2.910134, 0.4862745, 1, 0, 1,
-0.6564577, 0.139023, -0.629517, 0.4823529, 1, 0, 1,
-0.6558512, 2.483204, -0.2924868, 0.4745098, 1, 0, 1,
-0.6545566, 0.2933904, -0.3622836, 0.4705882, 1, 0, 1,
-0.6521245, -1.156708, -2.378815, 0.4627451, 1, 0, 1,
-0.6517923, 0.3476322, -1.733498, 0.4588235, 1, 0, 1,
-0.6484082, 0.194802, -1.156031, 0.4509804, 1, 0, 1,
-0.6483093, 0.538613, 0.136574, 0.4470588, 1, 0, 1,
-0.6475252, -0.2762159, -1.110272, 0.4392157, 1, 0, 1,
-0.6416763, 0.2235925, -0.599714, 0.4352941, 1, 0, 1,
-0.6381341, 0.09277584, -2.254905, 0.427451, 1, 0, 1,
-0.6330532, 2.00869, 1.651773, 0.4235294, 1, 0, 1,
-0.6304075, -1.444406, -2.155631, 0.4156863, 1, 0, 1,
-0.6278293, -0.01175158, -1.03989, 0.4117647, 1, 0, 1,
-0.627681, 0.2272639, -1.630882, 0.4039216, 1, 0, 1,
-0.6254225, 0.5701478, -0.1717193, 0.3960784, 1, 0, 1,
-0.6236477, 0.9584866, 1.886294, 0.3921569, 1, 0, 1,
-0.622846, -0.428231, -2.822546, 0.3843137, 1, 0, 1,
-0.619716, -0.7215934, -3.183852, 0.3803922, 1, 0, 1,
-0.6175099, 1.298872, -0.5396736, 0.372549, 1, 0, 1,
-0.614309, 0.4299815, -0.07157059, 0.3686275, 1, 0, 1,
-0.6116339, 1.158314, -0.828031, 0.3607843, 1, 0, 1,
-0.6026413, -0.5428807, -2.728234, 0.3568628, 1, 0, 1,
-0.6008219, 0.8602301, -1.35166, 0.3490196, 1, 0, 1,
-0.5930417, 0.8658016, 0.04766195, 0.345098, 1, 0, 1,
-0.5890998, 0.5240331, 1.075338, 0.3372549, 1, 0, 1,
-0.5820661, 0.869086, -1.917572, 0.3333333, 1, 0, 1,
-0.5817575, -0.9863526, -3.600783, 0.3254902, 1, 0, 1,
-0.5814837, 0.5325145, -1.082541, 0.3215686, 1, 0, 1,
-0.5754487, -0.2954099, -1.451369, 0.3137255, 1, 0, 1,
-0.5736766, 0.4634075, -0.5615085, 0.3098039, 1, 0, 1,
-0.5727872, -1.298482, -2.832337, 0.3019608, 1, 0, 1,
-0.5722604, 0.7968623, -0.9389381, 0.2941177, 1, 0, 1,
-0.5714154, 0.1661769, -0.937955, 0.2901961, 1, 0, 1,
-0.5691784, 0.2545936, -1.422526, 0.282353, 1, 0, 1,
-0.5650632, 0.4197853, -1.001474, 0.2784314, 1, 0, 1,
-0.5639009, 0.4036593, -0.6900568, 0.2705882, 1, 0, 1,
-0.5609626, -0.3934371, -2.188461, 0.2666667, 1, 0, 1,
-0.5583375, -1.44284, -3.514436, 0.2588235, 1, 0, 1,
-0.5578681, -1.019257, -2.44243, 0.254902, 1, 0, 1,
-0.5540909, -0.4725171, -1.703002, 0.2470588, 1, 0, 1,
-0.5508436, -0.6730102, -1.838406, 0.2431373, 1, 0, 1,
-0.5506742, -0.419625, -3.851792, 0.2352941, 1, 0, 1,
-0.5487477, -2.020145, -2.357732, 0.2313726, 1, 0, 1,
-0.5483166, 0.07876979, -1.799007, 0.2235294, 1, 0, 1,
-0.5446054, -1.28844, -4.016263, 0.2196078, 1, 0, 1,
-0.5421762, -1.660797, -1.698675, 0.2117647, 1, 0, 1,
-0.5410525, 0.1451177, -0.7173005, 0.2078431, 1, 0, 1,
-0.5344166, 0.8970698, -0.7916283, 0.2, 1, 0, 1,
-0.5334355, 0.5020909, 1.495152, 0.1921569, 1, 0, 1,
-0.5286504, 1.497801, -1.054013, 0.1882353, 1, 0, 1,
-0.5272045, 2.241207, 0.27064, 0.1803922, 1, 0, 1,
-0.5192829, 1.760151, -0.3347458, 0.1764706, 1, 0, 1,
-0.5117462, 1.858188, -0.4718756, 0.1686275, 1, 0, 1,
-0.5076066, 0.7872189, 1.084635, 0.1647059, 1, 0, 1,
-0.5069228, 0.5848007, -3.969324, 0.1568628, 1, 0, 1,
-0.5052114, -0.386383, -2.311536, 0.1529412, 1, 0, 1,
-0.5048398, -1.411515, -3.573173, 0.145098, 1, 0, 1,
-0.5045487, -1.165925, -2.350594, 0.1411765, 1, 0, 1,
-0.5017812, -0.7052237, -1.955556, 0.1333333, 1, 0, 1,
-0.5009839, -1.204497, -1.622165, 0.1294118, 1, 0, 1,
-0.4970683, 0.866854, -0.8161063, 0.1215686, 1, 0, 1,
-0.4917705, -0.9169692, -3.390807, 0.1176471, 1, 0, 1,
-0.4890557, 0.3547857, -0.5253639, 0.1098039, 1, 0, 1,
-0.4889008, 0.03590812, -0.04898234, 0.1058824, 1, 0, 1,
-0.4882907, 0.05595791, -1.502513, 0.09803922, 1, 0, 1,
-0.4877421, -0.3989293, -2.047682, 0.09019608, 1, 0, 1,
-0.4874769, 1.148436, -0.6249886, 0.08627451, 1, 0, 1,
-0.48716, -0.1964835, -0.5539815, 0.07843138, 1, 0, 1,
-0.4846576, 0.4585687, -0.3590415, 0.07450981, 1, 0, 1,
-0.4791656, -0.5449955, -2.464464, 0.06666667, 1, 0, 1,
-0.4758494, 1.019063, -0.9239877, 0.0627451, 1, 0, 1,
-0.4750549, -0.6109771, -3.017856, 0.05490196, 1, 0, 1,
-0.4724572, 0.6167815, -0.4921206, 0.05098039, 1, 0, 1,
-0.4681298, -0.4701368, -1.296443, 0.04313726, 1, 0, 1,
-0.4629441, -0.2845363, -1.409196, 0.03921569, 1, 0, 1,
-0.4624658, -0.3141953, -3.838904, 0.03137255, 1, 0, 1,
-0.4618124, -0.1330074, -3.51688, 0.02745098, 1, 0, 1,
-0.4580626, -0.3004523, -2.336413, 0.01960784, 1, 0, 1,
-0.45792, 1.094421, -2.297253, 0.01568628, 1, 0, 1,
-0.45602, -0.6469266, -3.450275, 0.007843138, 1, 0, 1,
-0.4552823, 0.1200253, -0.1197396, 0.003921569, 1, 0, 1,
-0.4542433, -1.025422, -2.781468, 0, 1, 0.003921569, 1,
-0.452908, -2.077405, -2.352531, 0, 1, 0.01176471, 1,
-0.4515966, 0.3850474, -1.518371, 0, 1, 0.01568628, 1,
-0.450818, -0.8139793, -2.474084, 0, 1, 0.02352941, 1,
-0.441177, -0.7649976, -1.679573, 0, 1, 0.02745098, 1,
-0.439636, -0.5163667, -2.600187, 0, 1, 0.03529412, 1,
-0.4380025, 0.2325561, -1.231107, 0, 1, 0.03921569, 1,
-0.4339501, 0.5855354, -0.07138018, 0, 1, 0.04705882, 1,
-0.4280434, 0.9333239, -0.4831485, 0, 1, 0.05098039, 1,
-0.4244637, -0.1740273, -0.2013521, 0, 1, 0.05882353, 1,
-0.4225269, -0.5251231, -0.2647582, 0, 1, 0.0627451, 1,
-0.4218709, 1.324858, -1.014536, 0, 1, 0.07058824, 1,
-0.4214949, 1.524298, -0.502758, 0, 1, 0.07450981, 1,
-0.4186445, 0.4928385, -1.138459, 0, 1, 0.08235294, 1,
-0.4139594, -0.8899523, -3.354424, 0, 1, 0.08627451, 1,
-0.4118816, 0.03196733, -0.5576523, 0, 1, 0.09411765, 1,
-0.40765, -0.5661648, -2.148299, 0, 1, 0.1019608, 1,
-0.4053173, -1.340668, -0.65058, 0, 1, 0.1058824, 1,
-0.4026995, -0.3461823, -2.767837, 0, 1, 0.1137255, 1,
-0.4024511, 1.249053, -1.320127, 0, 1, 0.1176471, 1,
-0.3979067, 0.8642429, 0.4842326, 0, 1, 0.1254902, 1,
-0.3956573, 3.016354, -0.05578909, 0, 1, 0.1294118, 1,
-0.3902791, -1.407231, -2.513254, 0, 1, 0.1372549, 1,
-0.3841276, 0.7681145, 0.2145047, 0, 1, 0.1411765, 1,
-0.3838384, -0.4662758, -3.046545, 0, 1, 0.1490196, 1,
-0.3816569, 1.484354, -0.08981293, 0, 1, 0.1529412, 1,
-0.3774941, -0.6944332, -4.142512, 0, 1, 0.1607843, 1,
-0.3771572, 0.2212678, -0.1884386, 0, 1, 0.1647059, 1,
-0.3699405, -0.2463293, -2.201843, 0, 1, 0.172549, 1,
-0.368608, 1.140154, -1.105799, 0, 1, 0.1764706, 1,
-0.3675375, 1.987036, -0.969496, 0, 1, 0.1843137, 1,
-0.3592696, 0.610997, -1.928591, 0, 1, 0.1882353, 1,
-0.3520801, 0.06998418, -0.417934, 0, 1, 0.1960784, 1,
-0.3519013, -0.7838024, -2.195164, 0, 1, 0.2039216, 1,
-0.3516582, 1.271585, -0.3563485, 0, 1, 0.2078431, 1,
-0.3492566, -0.7939565, -3.230331, 0, 1, 0.2156863, 1,
-0.3439547, 0.9992568, 2.281003, 0, 1, 0.2196078, 1,
-0.3382456, -0.08974029, -1.428009, 0, 1, 0.227451, 1,
-0.3380675, 2.14015, -0.7778326, 0, 1, 0.2313726, 1,
-0.3353188, -0.8044174, -2.990645, 0, 1, 0.2392157, 1,
-0.3319246, 0.5979765, -2.378752, 0, 1, 0.2431373, 1,
-0.3288643, -0.54094, -1.878447, 0, 1, 0.2509804, 1,
-0.3285224, 0.4260055, -1.161226, 0, 1, 0.254902, 1,
-0.3281153, 1.081833, 1.034312, 0, 1, 0.2627451, 1,
-0.3278936, -0.6697857, -3.262513, 0, 1, 0.2666667, 1,
-0.3264261, -0.4385207, -3.091498, 0, 1, 0.2745098, 1,
-0.3255862, 1.048249, -0.3255382, 0, 1, 0.2784314, 1,
-0.3172018, 0.0474084, -2.195849, 0, 1, 0.2862745, 1,
-0.3170681, 0.498586, -0.860512, 0, 1, 0.2901961, 1,
-0.3166089, -0.8799745, -2.911047, 0, 1, 0.2980392, 1,
-0.3124083, -0.987454, -3.380605, 0, 1, 0.3058824, 1,
-0.3104911, 1.154619, 0.4032618, 0, 1, 0.3098039, 1,
-0.3102267, 0.734832, -1.32066, 0, 1, 0.3176471, 1,
-0.3065452, -0.4547364, -4.018226, 0, 1, 0.3215686, 1,
-0.3034796, 1.330859, -0.1070357, 0, 1, 0.3294118, 1,
-0.3010905, -1.563109, -2.832065, 0, 1, 0.3333333, 1,
-0.2990014, -0.3421723, -0.5570321, 0, 1, 0.3411765, 1,
-0.2970109, 0.7672139, 0.09716014, 0, 1, 0.345098, 1,
-0.2941866, 2.112019, 0.5630287, 0, 1, 0.3529412, 1,
-0.2936159, -1.404301, -4.801673, 0, 1, 0.3568628, 1,
-0.2929987, 0.7445698, 0.2709372, 0, 1, 0.3647059, 1,
-0.29194, -0.5991381, -3.549298, 0, 1, 0.3686275, 1,
-0.2849248, -0.5646818, -3.28074, 0, 1, 0.3764706, 1,
-0.2838558, 0.8214586, -0.5938895, 0, 1, 0.3803922, 1,
-0.2797979, -0.8327708, -1.853775, 0, 1, 0.3882353, 1,
-0.2734539, 1.494546, 0.6128485, 0, 1, 0.3921569, 1,
-0.2731063, 0.06083778, -0.1307211, 0, 1, 0.4, 1,
-0.2666994, 0.6756942, -0.3100608, 0, 1, 0.4078431, 1,
-0.2655932, 0.5875795, -0.6980115, 0, 1, 0.4117647, 1,
-0.2629423, -1.598115, -4.057212, 0, 1, 0.4196078, 1,
-0.2559431, 0.6628794, -1.534499, 0, 1, 0.4235294, 1,
-0.2550438, -0.4795022, -2.988506, 0, 1, 0.4313726, 1,
-0.2539342, -0.2675346, -1.615976, 0, 1, 0.4352941, 1,
-0.2481936, 0.2665466, -0.3043464, 0, 1, 0.4431373, 1,
-0.246627, -1.001754, -3.266254, 0, 1, 0.4470588, 1,
-0.2458408, -1.004484, -1.646447, 0, 1, 0.454902, 1,
-0.245501, -1.452269, -0.5207006, 0, 1, 0.4588235, 1,
-0.2324079, 1.23478, -0.5202115, 0, 1, 0.4666667, 1,
-0.2309944, 0.9561227, -1.394105, 0, 1, 0.4705882, 1,
-0.2232056, -0.9604465, -4.300149, 0, 1, 0.4784314, 1,
-0.2217138, 1.803426, 0.5806241, 0, 1, 0.4823529, 1,
-0.2204493, 0.1135265, -0.9540162, 0, 1, 0.4901961, 1,
-0.2150525, -0.28889, -2.404681, 0, 1, 0.4941176, 1,
-0.2140283, -0.8824983, -2.343364, 0, 1, 0.5019608, 1,
-0.2130682, 0.5253394, -0.1376219, 0, 1, 0.509804, 1,
-0.2099848, -1.294283, -2.910852, 0, 1, 0.5137255, 1,
-0.2089067, -1.58402, -3.862533, 0, 1, 0.5215687, 1,
-0.2086731, 1.764798, -0.5453375, 0, 1, 0.5254902, 1,
-0.2086571, 0.2446167, 0.4848498, 0, 1, 0.5333334, 1,
-0.197529, -0.1228152, -2.063699, 0, 1, 0.5372549, 1,
-0.1964945, 0.01911417, -1.091018, 0, 1, 0.5450981, 1,
-0.1958693, -0.158799, -2.870524, 0, 1, 0.5490196, 1,
-0.1918178, 0.08098717, -0.9698277, 0, 1, 0.5568628, 1,
-0.1897602, -1.862278, -2.455799, 0, 1, 0.5607843, 1,
-0.1866813, 0.9116417, 1.418391, 0, 1, 0.5686275, 1,
-0.1856321, -0.7068441, -4.137689, 0, 1, 0.572549, 1,
-0.1848421, -1.030107, -2.675041, 0, 1, 0.5803922, 1,
-0.1839428, -0.7076469, -3.216764, 0, 1, 0.5843138, 1,
-0.1824637, 0.739952, 1.538414, 0, 1, 0.5921569, 1,
-0.178242, -0.2694605, -1.737102, 0, 1, 0.5960785, 1,
-0.1781265, -0.475452, -3.417477, 0, 1, 0.6039216, 1,
-0.177096, 0.402833, -1.393015, 0, 1, 0.6117647, 1,
-0.1742792, -0.1092338, -2.329553, 0, 1, 0.6156863, 1,
-0.1709116, -0.3861939, -2.605353, 0, 1, 0.6235294, 1,
-0.1661666, 0.4904947, -0.283426, 0, 1, 0.627451, 1,
-0.1632705, -0.6454611, -2.489259, 0, 1, 0.6352941, 1,
-0.1625308, 0.2135113, -0.3492157, 0, 1, 0.6392157, 1,
-0.1614094, -0.4280943, -1.853393, 0, 1, 0.6470588, 1,
-0.1602924, 0.05415345, -0.3898331, 0, 1, 0.6509804, 1,
-0.1594567, -0.5452811, -3.108186, 0, 1, 0.6588235, 1,
-0.1583118, -0.3391671, -2.97313, 0, 1, 0.6627451, 1,
-0.1576894, -0.128575, -2.213899, 0, 1, 0.6705883, 1,
-0.1555714, 2.436545, 1.258087, 0, 1, 0.6745098, 1,
-0.155048, -0.6974669, -3.69915, 0, 1, 0.682353, 1,
-0.1512588, 0.736638, -0.5681974, 0, 1, 0.6862745, 1,
-0.1460592, 1.933153, -0.5809813, 0, 1, 0.6941177, 1,
-0.1456286, 1.224326, -0.6688815, 0, 1, 0.7019608, 1,
-0.1454241, 1.932996, -0.5217099, 0, 1, 0.7058824, 1,
-0.1445697, -1.099774, -3.329597, 0, 1, 0.7137255, 1,
-0.1388696, -0.71657, -3.6835, 0, 1, 0.7176471, 1,
-0.1377584, -1.23385, -4.421747, 0, 1, 0.7254902, 1,
-0.1345512, 0.9153363, 0.4853185, 0, 1, 0.7294118, 1,
-0.1342634, -1.116704, -4.094037, 0, 1, 0.7372549, 1,
-0.1332652, 0.05818222, 0.4136552, 0, 1, 0.7411765, 1,
-0.1314777, -0.9808199, -3.38539, 0, 1, 0.7490196, 1,
-0.1283185, -2.135362, -3.768884, 0, 1, 0.7529412, 1,
-0.1255973, 1.413945, 0.6638955, 0, 1, 0.7607843, 1,
-0.1090096, -0.7937522, -3.783158, 0, 1, 0.7647059, 1,
-0.1085677, -0.205991, -2.931679, 0, 1, 0.772549, 1,
-0.108199, -0.6396683, -3.030287, 0, 1, 0.7764706, 1,
-0.1067627, -0.3431289, -3.157608, 0, 1, 0.7843137, 1,
-0.104325, 0.009343687, -1.948385, 0, 1, 0.7882353, 1,
-0.1028724, -0.4215938, -3.632479, 0, 1, 0.7960784, 1,
-0.1019021, -0.005822739, -2.763015, 0, 1, 0.8039216, 1,
-0.1008606, -0.07624108, -2.417587, 0, 1, 0.8078431, 1,
-0.09977232, 1.117595, -1.114325, 0, 1, 0.8156863, 1,
-0.09759277, 1.1908, -0.8024597, 0, 1, 0.8196079, 1,
-0.09656718, 0.6681616, -1.051668, 0, 1, 0.827451, 1,
-0.09557472, -0.9919903, -4.25905, 0, 1, 0.8313726, 1,
-0.08251507, -0.120782, -2.209121, 0, 1, 0.8392157, 1,
-0.08036235, 1.060575, 1.153112, 0, 1, 0.8431373, 1,
-0.07923912, -0.9278693, -2.695387, 0, 1, 0.8509804, 1,
-0.0790931, -0.585717, -1.453213, 0, 1, 0.854902, 1,
-0.07194828, 0.5785871, 0.9123381, 0, 1, 0.8627451, 1,
-0.0708108, 1.124161, 1.036205, 0, 1, 0.8666667, 1,
-0.07004234, 0.314842, 0.5387466, 0, 1, 0.8745098, 1,
-0.06685872, 0.5786783, 0.73817, 0, 1, 0.8784314, 1,
-0.06603178, -0.7563089, -3.227722, 0, 1, 0.8862745, 1,
-0.06596778, 1.293259, -0.4083124, 0, 1, 0.8901961, 1,
-0.0611765, -1.368032, -3.402407, 0, 1, 0.8980392, 1,
-0.06038524, -2.344385, -3.394591, 0, 1, 0.9058824, 1,
-0.05997589, 2.516377, -0.2951522, 0, 1, 0.9098039, 1,
-0.05517944, 0.4985195, 0.4163661, 0, 1, 0.9176471, 1,
-0.05364214, 1.050828, -0.2169759, 0, 1, 0.9215686, 1,
-0.04905709, 1.070952, 0.0175676, 0, 1, 0.9294118, 1,
-0.04575495, -0.007443197, -1.585107, 0, 1, 0.9333333, 1,
-0.04207697, -0.3309932, -1.417345, 0, 1, 0.9411765, 1,
-0.04177932, 0.59252, -0.3874749, 0, 1, 0.945098, 1,
-0.03910089, -2.592114, -2.73477, 0, 1, 0.9529412, 1,
-0.03393114, -1.91155, -2.548856, 0, 1, 0.9568627, 1,
-0.02945328, 0.7255882, -1.637142, 0, 1, 0.9647059, 1,
-0.02268379, -0.5111983, -4.005178, 0, 1, 0.9686275, 1,
-0.02233261, -0.1142952, -2.123192, 0, 1, 0.9764706, 1,
-0.01363401, -0.7546332, -3.672547, 0, 1, 0.9803922, 1,
-0.01101237, 0.8100526, 1.829479, 0, 1, 0.9882353, 1,
-0.007056207, -0.0836287, -4.105825, 0, 1, 0.9921569, 1,
-0.005113286, -0.06403854, -2.817045, 0, 1, 1, 1,
-0.001662197, 2.236521, 0.3582757, 0, 0.9921569, 1, 1,
-0.001551646, 0.1031622, 0.6464612, 0, 0.9882353, 1, 1,
0.0008846435, -1.026185, 1.668395, 0, 0.9803922, 1, 1,
0.004367935, -2.264799, 3.218717, 0, 0.9764706, 1, 1,
0.006766907, -0.4142641, 3.512518, 0, 0.9686275, 1, 1,
0.00841433, -1.549857, 2.114107, 0, 0.9647059, 1, 1,
0.008817463, -0.2580762, 2.692189, 0, 0.9568627, 1, 1,
0.01670816, -0.0247418, 1.843984, 0, 0.9529412, 1, 1,
0.01688653, -2.176843, 5.717778, 0, 0.945098, 1, 1,
0.01707994, 1.557289, -1.047019, 0, 0.9411765, 1, 1,
0.01915227, 1.57787, -0.8469086, 0, 0.9333333, 1, 1,
0.02306994, 0.2587327, -0.01592189, 0, 0.9294118, 1, 1,
0.02394159, 0.1686937, 2.070962, 0, 0.9215686, 1, 1,
0.02835429, 0.0115951, 2.72977, 0, 0.9176471, 1, 1,
0.02894225, 0.4258891, 0.863061, 0, 0.9098039, 1, 1,
0.02976444, 2.20945, 1.522015, 0, 0.9058824, 1, 1,
0.031158, 0.02524832, 1.861208, 0, 0.8980392, 1, 1,
0.03463004, 1.247526, 1.320296, 0, 0.8901961, 1, 1,
0.03517668, 0.6862111, 0.2231682, 0, 0.8862745, 1, 1,
0.03988779, -0.04387263, 1.601769, 0, 0.8784314, 1, 1,
0.04439123, -2.441467, 2.620554, 0, 0.8745098, 1, 1,
0.04666146, 0.2447892, -1.589523, 0, 0.8666667, 1, 1,
0.05246552, 3.089932, -0.01962619, 0, 0.8627451, 1, 1,
0.05312826, -0.7401292, 4.036458, 0, 0.854902, 1, 1,
0.05332093, 1.591118, 1.427501, 0, 0.8509804, 1, 1,
0.05862949, -1.108746, 2.817603, 0, 0.8431373, 1, 1,
0.05904458, 0.9393167, 0.9500693, 0, 0.8392157, 1, 1,
0.0610919, 0.2111307, 0.1228631, 0, 0.8313726, 1, 1,
0.06401873, 0.3500815, 1.587439, 0, 0.827451, 1, 1,
0.07610252, -0.3704969, 5.26844, 0, 0.8196079, 1, 1,
0.07611994, 0.8292651, 1.345569, 0, 0.8156863, 1, 1,
0.08247906, -0.6627607, 4.243689, 0, 0.8078431, 1, 1,
0.08346351, -0.123333, 0.6238663, 0, 0.8039216, 1, 1,
0.08695319, -0.06588341, 1.717071, 0, 0.7960784, 1, 1,
0.09179208, -0.1158815, 2.628189, 0, 0.7882353, 1, 1,
0.09613225, 0.06225538, 2.43179, 0, 0.7843137, 1, 1,
0.09684552, -1.747351, 2.662407, 0, 0.7764706, 1, 1,
0.1001351, -2.083365, 3.617847, 0, 0.772549, 1, 1,
0.1009118, 1.551424, -0.9492326, 0, 0.7647059, 1, 1,
0.1030442, -0.2662915, 3.21519, 0, 0.7607843, 1, 1,
0.1055309, -1.586378, 2.653728, 0, 0.7529412, 1, 1,
0.1095848, 1.314836, -1.21815, 0, 0.7490196, 1, 1,
0.1110768, 0.003307175, 2.349961, 0, 0.7411765, 1, 1,
0.1114366, 0.4103177, 2.234294, 0, 0.7372549, 1, 1,
0.1168202, -0.3328437, 1.744301, 0, 0.7294118, 1, 1,
0.1177487, -1.240355, 3.977002, 0, 0.7254902, 1, 1,
0.1183459, -0.2751922, 2.934323, 0, 0.7176471, 1, 1,
0.1211286, 0.3725191, 0.8458851, 0, 0.7137255, 1, 1,
0.1214872, 0.5564667, 0.4913477, 0, 0.7058824, 1, 1,
0.122407, -0.8044775, 2.469644, 0, 0.6980392, 1, 1,
0.1259606, 0.1185156, 2.318633, 0, 0.6941177, 1, 1,
0.1280829, -0.850681, 2.045731, 0, 0.6862745, 1, 1,
0.1302899, 0.7677112, 1.045154, 0, 0.682353, 1, 1,
0.1315624, 0.006100612, 1.407896, 0, 0.6745098, 1, 1,
0.1338126, -0.1851188, 1.800557, 0, 0.6705883, 1, 1,
0.1344754, 0.06321599, 0.4728169, 0, 0.6627451, 1, 1,
0.1363338, 0.5428533, -0.4845122, 0, 0.6588235, 1, 1,
0.1377016, -1.929482, 2.989069, 0, 0.6509804, 1, 1,
0.1383453, -0.2245173, 3.03625, 0, 0.6470588, 1, 1,
0.1385363, -2.518143, 3.133975, 0, 0.6392157, 1, 1,
0.1404788, -0.54443, 4.077981, 0, 0.6352941, 1, 1,
0.1453768, -1.044176, 1.962153, 0, 0.627451, 1, 1,
0.1471627, -0.8690708, 4.454241, 0, 0.6235294, 1, 1,
0.1486397, -0.3573591, 3.081185, 0, 0.6156863, 1, 1,
0.1492746, -0.3830093, 2.596914, 0, 0.6117647, 1, 1,
0.1506768, -3.009547, 2.642229, 0, 0.6039216, 1, 1,
0.1532417, -0.1932712, 2.326057, 0, 0.5960785, 1, 1,
0.1578515, 1.572596, -0.5001712, 0, 0.5921569, 1, 1,
0.1584169, 1.394624, -0.1981127, 0, 0.5843138, 1, 1,
0.1609306, -0.5481444, 3.146777, 0, 0.5803922, 1, 1,
0.1626645, -1.156919, 2.811623, 0, 0.572549, 1, 1,
0.165759, 1.93069, -1.971262, 0, 0.5686275, 1, 1,
0.1676367, -0.9631968, 2.515013, 0, 0.5607843, 1, 1,
0.1702374, -1.373225, 2.46086, 0, 0.5568628, 1, 1,
0.1708069, 1.285578, 0.4603672, 0, 0.5490196, 1, 1,
0.171157, -0.03524087, 1.443739, 0, 0.5450981, 1, 1,
0.1716617, -0.2024079, 2.184541, 0, 0.5372549, 1, 1,
0.1733231, 2.121982, 0.1665394, 0, 0.5333334, 1, 1,
0.1783494, 1.801694, -0.3140208, 0, 0.5254902, 1, 1,
0.1791122, 1.352916, 0.8027839, 0, 0.5215687, 1, 1,
0.1802194, -0.4881184, 3.772575, 0, 0.5137255, 1, 1,
0.1861822, -1.45741, 3.723187, 0, 0.509804, 1, 1,
0.1890041, 0.9336573, -1.474097, 0, 0.5019608, 1, 1,
0.1906836, -1.251403, 2.980487, 0, 0.4941176, 1, 1,
0.191218, -0.8028677, 4.342701, 0, 0.4901961, 1, 1,
0.1924269, -0.009195775, 2.326335, 0, 0.4823529, 1, 1,
0.1935035, -0.8024151, 2.356884, 0, 0.4784314, 1, 1,
0.1935287, -0.7157142, 2.753244, 0, 0.4705882, 1, 1,
0.2007111, -0.5700088, 3.949303, 0, 0.4666667, 1, 1,
0.2012257, -1.713241, 2.767039, 0, 0.4588235, 1, 1,
0.2012779, 0.5678014, 0.9947103, 0, 0.454902, 1, 1,
0.2039835, -0.2852156, 1.452716, 0, 0.4470588, 1, 1,
0.2041127, -0.3325626, 2.140083, 0, 0.4431373, 1, 1,
0.2061993, 0.6475382, 0.5172153, 0, 0.4352941, 1, 1,
0.2063362, -0.2801983, 1.751415, 0, 0.4313726, 1, 1,
0.2092886, -1.644244, 4.695329, 0, 0.4235294, 1, 1,
0.2105505, 0.2200797, 1.585374, 0, 0.4196078, 1, 1,
0.2111035, -0.578586, 4.746211, 0, 0.4117647, 1, 1,
0.2152486, -0.3211647, 2.664772, 0, 0.4078431, 1, 1,
0.2158494, -0.5321354, 3.039991, 0, 0.4, 1, 1,
0.2158746, 0.4062106, 1.854364, 0, 0.3921569, 1, 1,
0.2160495, -0.1634749, 3.167685, 0, 0.3882353, 1, 1,
0.2173072, 1.018197, 0.4963406, 0, 0.3803922, 1, 1,
0.2195996, 0.293533, 1.055718, 0, 0.3764706, 1, 1,
0.2230035, 2.091725, -1.69568, 0, 0.3686275, 1, 1,
0.223013, 0.7649859, 1.093687, 0, 0.3647059, 1, 1,
0.2294923, -0.4752728, 2.531512, 0, 0.3568628, 1, 1,
0.2360074, 0.2604285, 1.913701, 0, 0.3529412, 1, 1,
0.2378294, 0.1700438, -0.6812239, 0, 0.345098, 1, 1,
0.2378655, -1.022077, 2.347468, 0, 0.3411765, 1, 1,
0.2397034, 0.7173904, 0.7647329, 0, 0.3333333, 1, 1,
0.2449655, 0.4831828, 0.4933708, 0, 0.3294118, 1, 1,
0.2470683, -0.6735098, 2.01484, 0, 0.3215686, 1, 1,
0.2491292, 0.7316372, -0.2231725, 0, 0.3176471, 1, 1,
0.2497562, -1.322654, 2.938426, 0, 0.3098039, 1, 1,
0.2509434, -0.09718335, 1.296133, 0, 0.3058824, 1, 1,
0.2530728, 0.1780667, 1.027263, 0, 0.2980392, 1, 1,
0.255529, 1.129661, 0.6676022, 0, 0.2901961, 1, 1,
0.2571004, 0.5257486, -0.5167033, 0, 0.2862745, 1, 1,
0.2639364, -0.9254717, 2.783842, 0, 0.2784314, 1, 1,
0.2642524, 1.982531, 0.800352, 0, 0.2745098, 1, 1,
0.2667457, -0.1104962, 2.728272, 0, 0.2666667, 1, 1,
0.271281, 1.098663, 0.7770341, 0, 0.2627451, 1, 1,
0.2772668, 0.7095234, -0.3347431, 0, 0.254902, 1, 1,
0.2839518, -1.367353, 5.929903, 0, 0.2509804, 1, 1,
0.2877179, 0.4327362, 1.362714, 0, 0.2431373, 1, 1,
0.2938085, 1.256288, 0.08930746, 0, 0.2392157, 1, 1,
0.2940963, 1.336944, 0.4392386, 0, 0.2313726, 1, 1,
0.2972073, -0.9717303, 4.23739, 0, 0.227451, 1, 1,
0.2974501, 1.409193, 0.08391078, 0, 0.2196078, 1, 1,
0.2999616, -0.7296296, 3.847637, 0, 0.2156863, 1, 1,
0.3013306, 0.969791, -0.7105576, 0, 0.2078431, 1, 1,
0.3053718, -0.4487893, 3.429316, 0, 0.2039216, 1, 1,
0.3061785, -0.240766, 2.007895, 0, 0.1960784, 1, 1,
0.3069394, -0.4758229, 1.669278, 0, 0.1882353, 1, 1,
0.3082093, 0.7819254, -0.190861, 0, 0.1843137, 1, 1,
0.3093283, -1.404961, 3.283152, 0, 0.1764706, 1, 1,
0.3105581, 0.4896334, 2.348423, 0, 0.172549, 1, 1,
0.3146516, 1.432484, 0.3908967, 0, 0.1647059, 1, 1,
0.3151302, 0.2789371, 0.1634566, 0, 0.1607843, 1, 1,
0.3184248, 1.116305, -0.3777405, 0, 0.1529412, 1, 1,
0.3225543, 1.897246, 0.117934, 0, 0.1490196, 1, 1,
0.3232477, -0.1870539, 2.422673, 0, 0.1411765, 1, 1,
0.3253527, 0.1538433, 1.538432, 0, 0.1372549, 1, 1,
0.3260833, -1.007156, 1.562942, 0, 0.1294118, 1, 1,
0.3287102, -0.4457039, 2.068133, 0, 0.1254902, 1, 1,
0.3363051, -1.13272, 3.51556, 0, 0.1176471, 1, 1,
0.3396466, 1.861201, 1.583601, 0, 0.1137255, 1, 1,
0.3401155, -0.709709, 3.264816, 0, 0.1058824, 1, 1,
0.344994, 1.555691, 1.656269, 0, 0.09803922, 1, 1,
0.3496155, 1.482966, -0.109481, 0, 0.09411765, 1, 1,
0.3543193, 0.7915154, 1.470803, 0, 0.08627451, 1, 1,
0.3565516, 0.3106484, 0.5866743, 0, 0.08235294, 1, 1,
0.3621067, 1.976312, 1.058428, 0, 0.07450981, 1, 1,
0.3634356, 0.05402016, 2.488086, 0, 0.07058824, 1, 1,
0.3671123, 0.4834791, 0.6456151, 0, 0.0627451, 1, 1,
0.3692843, -1.228733, 2.137668, 0, 0.05882353, 1, 1,
0.3761182, 0.5673581, 1.270472, 0, 0.05098039, 1, 1,
0.3850431, -0.3899362, 3.065528, 0, 0.04705882, 1, 1,
0.3854148, -0.688744, 2.228064, 0, 0.03921569, 1, 1,
0.3978019, -1.420117, 4.894911, 0, 0.03529412, 1, 1,
0.4078038, -0.7142252, 2.088947, 0, 0.02745098, 1, 1,
0.4102388, 0.01597451, 2.990451, 0, 0.02352941, 1, 1,
0.4106193, -1.940781, 4.69099, 0, 0.01568628, 1, 1,
0.4130515, -0.7382873, 2.871364, 0, 0.01176471, 1, 1,
0.4131023, -1.419864, 4.009956, 0, 0.003921569, 1, 1,
0.4149788, 0.6663921, -0.3785669, 0.003921569, 0, 1, 1,
0.4205705, -0.03840854, -1.244185, 0.007843138, 0, 1, 1,
0.4277017, -0.01816963, 0.8835129, 0.01568628, 0, 1, 1,
0.4351747, 0.219564, 0.330171, 0.01960784, 0, 1, 1,
0.4358747, -0.02814278, 2.562599, 0.02745098, 0, 1, 1,
0.4365127, -1.02522, 3.846421, 0.03137255, 0, 1, 1,
0.4390425, -2.46892, 3.726439, 0.03921569, 0, 1, 1,
0.4395232, 0.03329202, 2.287297, 0.04313726, 0, 1, 1,
0.4516441, 0.6313094, 1.230413, 0.05098039, 0, 1, 1,
0.4558442, -1.516863, 2.610254, 0.05490196, 0, 1, 1,
0.4581855, -0.3783171, 3.107097, 0.0627451, 0, 1, 1,
0.4646703, 0.9329854, -0.6918921, 0.06666667, 0, 1, 1,
0.4647812, 0.2307515, 0.5482614, 0.07450981, 0, 1, 1,
0.4655832, -0.253584, 2.878082, 0.07843138, 0, 1, 1,
0.4691312, -0.9215516, 3.016439, 0.08627451, 0, 1, 1,
0.4708771, -0.06503236, 2.187569, 0.09019608, 0, 1, 1,
0.4709821, 0.4133348, 2.028798, 0.09803922, 0, 1, 1,
0.4745004, 0.4219212, 1.94769, 0.1058824, 0, 1, 1,
0.4787754, -1.039075, 1.434676, 0.1098039, 0, 1, 1,
0.478818, -0.6951582, 1.778318, 0.1176471, 0, 1, 1,
0.4834041, -0.01001525, 0.8977364, 0.1215686, 0, 1, 1,
0.4848808, -0.3782218, -0.4644422, 0.1294118, 0, 1, 1,
0.4864193, -0.03273491, 2.381692, 0.1333333, 0, 1, 1,
0.4866154, 0.6630691, 1.159462, 0.1411765, 0, 1, 1,
0.4888598, 1.883858, -0.2964379, 0.145098, 0, 1, 1,
0.4902076, -1.204052, 2.679773, 0.1529412, 0, 1, 1,
0.4902369, -0.9747535, 2.154628, 0.1568628, 0, 1, 1,
0.4974518, 0.6612288, 2.398195, 0.1647059, 0, 1, 1,
0.4975468, -0.6059191, 3.187985, 0.1686275, 0, 1, 1,
0.5033525, -0.2574358, 2.494524, 0.1764706, 0, 1, 1,
0.5041212, 1.65651, 1.159716, 0.1803922, 0, 1, 1,
0.5051703, -0.4474807, 2.42933, 0.1882353, 0, 1, 1,
0.5051889, 0.04196952, 0.1919795, 0.1921569, 0, 1, 1,
0.5080315, -0.1773849, 1.88781, 0.2, 0, 1, 1,
0.5080824, -1.691894, 3.180721, 0.2078431, 0, 1, 1,
0.5087152, 1.664317, 0.3411268, 0.2117647, 0, 1, 1,
0.5095822, -0.0309895, 1.210571, 0.2196078, 0, 1, 1,
0.5128559, -1.723545, 1.852443, 0.2235294, 0, 1, 1,
0.5182458, 0.3597825, -1.07763, 0.2313726, 0, 1, 1,
0.5187947, 0.5245601, -0.1070215, 0.2352941, 0, 1, 1,
0.523845, -0.5609136, 1.599956, 0.2431373, 0, 1, 1,
0.5250854, -1.045383, 2.37069, 0.2470588, 0, 1, 1,
0.5353175, -0.02704169, -0.3333375, 0.254902, 0, 1, 1,
0.5355778, -2.365408, 3.899149, 0.2588235, 0, 1, 1,
0.5366138, 0.6473337, -0.2846831, 0.2666667, 0, 1, 1,
0.541455, 0.2859164, 0.7913008, 0.2705882, 0, 1, 1,
0.5416848, 1.445166, 2.571179, 0.2784314, 0, 1, 1,
0.5418941, -0.1300127, 2.005896, 0.282353, 0, 1, 1,
0.5475032, -1.759548, 4.038483, 0.2901961, 0, 1, 1,
0.5521766, -0.541613, 2.662819, 0.2941177, 0, 1, 1,
0.5544128, -1.259259, 3.864184, 0.3019608, 0, 1, 1,
0.558778, -0.1201251, -0.2014797, 0.3098039, 0, 1, 1,
0.5610394, 0.4534516, 0.7506945, 0.3137255, 0, 1, 1,
0.5624757, 0.5094338, -0.06943653, 0.3215686, 0, 1, 1,
0.5640796, 0.1978464, 1.711899, 0.3254902, 0, 1, 1,
0.5729598, 1.543716, -0.1628335, 0.3333333, 0, 1, 1,
0.5738338, -0.9595366, 2.093303, 0.3372549, 0, 1, 1,
0.5777658, 0.3106042, 0.9428135, 0.345098, 0, 1, 1,
0.5784695, -0.2269479, 1.5135, 0.3490196, 0, 1, 1,
0.5809591, 1.06219, 1.502308, 0.3568628, 0, 1, 1,
0.5831, -2.090605, 4.26441, 0.3607843, 0, 1, 1,
0.5844554, -0.0946058, 1.155039, 0.3686275, 0, 1, 1,
0.586396, -0.9268966, 1.68238, 0.372549, 0, 1, 1,
0.5888042, -1.86826, 0.7289377, 0.3803922, 0, 1, 1,
0.5905508, -0.1554085, 2.719289, 0.3843137, 0, 1, 1,
0.596384, -0.7507926, 2.490164, 0.3921569, 0, 1, 1,
0.5998769, -1.217253, 3.329274, 0.3960784, 0, 1, 1,
0.6031089, -1.620746, 3.348424, 0.4039216, 0, 1, 1,
0.6125057, 0.159864, 1.382491, 0.4117647, 0, 1, 1,
0.6183555, 1.457633, 0.7507644, 0.4156863, 0, 1, 1,
0.6242247, 0.6990141, 0.611019, 0.4235294, 0, 1, 1,
0.628501, -0.6269653, 1.622267, 0.427451, 0, 1, 1,
0.6295137, -0.3549425, 3.740232, 0.4352941, 0, 1, 1,
0.6325442, 2.007459, 2.240212, 0.4392157, 0, 1, 1,
0.6374713, -0.6913717, 3.165617, 0.4470588, 0, 1, 1,
0.6400709, -0.4268933, 2.29832, 0.4509804, 0, 1, 1,
0.643542, 0.08021583, 1.535052, 0.4588235, 0, 1, 1,
0.6494889, 2.06606, 0.272413, 0.4627451, 0, 1, 1,
0.654047, 1.12036, -1.516259, 0.4705882, 0, 1, 1,
0.6592587, -0.7902849, 2.26302, 0.4745098, 0, 1, 1,
0.6616005, -0.485165, 1.046791, 0.4823529, 0, 1, 1,
0.6628225, 1.247371, -1.226549, 0.4862745, 0, 1, 1,
0.6749423, -1.763235, 4.392609, 0.4941176, 0, 1, 1,
0.6769872, -0.2297102, 2.658609, 0.5019608, 0, 1, 1,
0.6838447, 1.112582, 0.1273043, 0.5058824, 0, 1, 1,
0.6864183, -0.4626886, 1.999884, 0.5137255, 0, 1, 1,
0.6901591, -0.6593723, 1.13724, 0.5176471, 0, 1, 1,
0.6912867, 0.6111469, 2.955862, 0.5254902, 0, 1, 1,
0.6938995, 0.1115042, 1.728138, 0.5294118, 0, 1, 1,
0.6948143, 1.258383, -1.568493, 0.5372549, 0, 1, 1,
0.6975233, -0.6578045, 1.111451, 0.5411765, 0, 1, 1,
0.7002143, 0.3652987, 2.843885, 0.5490196, 0, 1, 1,
0.7028936, 0.5755981, 0.1235463, 0.5529412, 0, 1, 1,
0.7068807, -0.5745877, 3.501279, 0.5607843, 0, 1, 1,
0.7100557, 1.026753, 1.692565, 0.5647059, 0, 1, 1,
0.7155282, -1.649315, 1.26002, 0.572549, 0, 1, 1,
0.7200294, 1.225487, 0.8647986, 0.5764706, 0, 1, 1,
0.7256809, -0.7980859, 2.044208, 0.5843138, 0, 1, 1,
0.7260042, 2.346653, 2.519119, 0.5882353, 0, 1, 1,
0.7278376, -0.2950531, 3.268798, 0.5960785, 0, 1, 1,
0.7315732, 0.5974197, 0.8567984, 0.6039216, 0, 1, 1,
0.7427378, -0.830605, 2.510858, 0.6078432, 0, 1, 1,
0.7442883, 1.336203, -0.9318882, 0.6156863, 0, 1, 1,
0.750591, -0.5792829, 0.8109305, 0.6196079, 0, 1, 1,
0.75393, 1.679259, -0.2873989, 0.627451, 0, 1, 1,
0.7565877, 0.3862718, 1.691312, 0.6313726, 0, 1, 1,
0.7565884, -0.7791859, 1.995106, 0.6392157, 0, 1, 1,
0.7580658, 1.444095, -0.6210795, 0.6431373, 0, 1, 1,
0.762668, 1.279571, -1.677265, 0.6509804, 0, 1, 1,
0.7630237, -0.5117356, 0.6859694, 0.654902, 0, 1, 1,
0.7633444, -0.1938164, 2.731337, 0.6627451, 0, 1, 1,
0.7658919, -1.56328, 2.7563, 0.6666667, 0, 1, 1,
0.7659113, -0.1767471, 3.947125, 0.6745098, 0, 1, 1,
0.7663504, -2.122961, 3.532478, 0.6784314, 0, 1, 1,
0.7680998, 0.5677702, 2.310032, 0.6862745, 0, 1, 1,
0.7682889, 1.033357, -0.6879336, 0.6901961, 0, 1, 1,
0.7703893, -0.8761824, 2.012056, 0.6980392, 0, 1, 1,
0.7724946, 0.5958036, -0.07910638, 0.7058824, 0, 1, 1,
0.7796856, -0.7615995, 3.346295, 0.7098039, 0, 1, 1,
0.7810575, -0.8564902, 4.089283, 0.7176471, 0, 1, 1,
0.7829173, 1.182466, -0.4744925, 0.7215686, 0, 1, 1,
0.7852013, -0.9360204, 1.252943, 0.7294118, 0, 1, 1,
0.7906435, -0.8839949, 2.724941, 0.7333333, 0, 1, 1,
0.7970178, 0.03938523, 1.8692, 0.7411765, 0, 1, 1,
0.7996252, -0.9887838, 2.798204, 0.7450981, 0, 1, 1,
0.8061508, -1.33251, 1.394894, 0.7529412, 0, 1, 1,
0.810756, 1.24328, 0.8527204, 0.7568628, 0, 1, 1,
0.8161535, 0.82104, 1.664492, 0.7647059, 0, 1, 1,
0.8183874, 0.9663242, -0.06996404, 0.7686275, 0, 1, 1,
0.8193888, -0.236558, 0.04106823, 0.7764706, 0, 1, 1,
0.8252857, 0.1763432, 2.330857, 0.7803922, 0, 1, 1,
0.8322273, 0.888746, -0.5711675, 0.7882353, 0, 1, 1,
0.8338444, -1.168743, 3.247628, 0.7921569, 0, 1, 1,
0.8477004, -1.255696, 3.019907, 0.8, 0, 1, 1,
0.8481875, -0.4954244, 1.946464, 0.8078431, 0, 1, 1,
0.8550252, 1.203448, 0.03058538, 0.8117647, 0, 1, 1,
0.8564473, -0.3261175, 2.080833, 0.8196079, 0, 1, 1,
0.8575621, 0.1625896, 2.450933, 0.8235294, 0, 1, 1,
0.8622194, 0.7358617, 1.900778, 0.8313726, 0, 1, 1,
0.8628457, 2.280386, -0.160976, 0.8352941, 0, 1, 1,
0.8694965, 1.009003, 0.01751191, 0.8431373, 0, 1, 1,
0.8742625, 0.8537744, 1.095281, 0.8470588, 0, 1, 1,
0.8756106, -0.0977404, 1.283646, 0.854902, 0, 1, 1,
0.8763844, -1.447359, 2.914363, 0.8588235, 0, 1, 1,
0.8778236, -0.09820247, 1.024605, 0.8666667, 0, 1, 1,
0.8828411, 1.890608, -1.949625, 0.8705882, 0, 1, 1,
0.8888373, -2.7503, 2.974899, 0.8784314, 0, 1, 1,
0.8948684, 0.6936507, 2.11633, 0.8823529, 0, 1, 1,
0.8979712, -1.942543, 3.334679, 0.8901961, 0, 1, 1,
0.9021949, -0.528588, 0.2627798, 0.8941177, 0, 1, 1,
0.9055989, 0.4008774, 1.151675, 0.9019608, 0, 1, 1,
0.906589, -1.558501, 3.619163, 0.9098039, 0, 1, 1,
0.910928, 0.1246491, 1.474655, 0.9137255, 0, 1, 1,
0.9221022, 0.2088031, 2.897191, 0.9215686, 0, 1, 1,
0.9224195, 0.8914919, 1.603369, 0.9254902, 0, 1, 1,
0.9233178, 1.095142, 0.6479546, 0.9333333, 0, 1, 1,
0.9260231, 0.8727686, 1.702179, 0.9372549, 0, 1, 1,
0.9313288, 1.814881, 0.8710378, 0.945098, 0, 1, 1,
0.9479898, -0.1373505, 2.135314, 0.9490196, 0, 1, 1,
0.9517152, 0.7421089, -0.115774, 0.9568627, 0, 1, 1,
0.9580193, -0.4711747, 1.453887, 0.9607843, 0, 1, 1,
0.9582737, -1.345547, 2.423794, 0.9686275, 0, 1, 1,
0.9622042, -1.767582, 3.343617, 0.972549, 0, 1, 1,
0.9685165, 1.389115, 0.7875293, 0.9803922, 0, 1, 1,
0.9738017, 0.05897529, 1.955743, 0.9843137, 0, 1, 1,
0.9835848, 0.2194723, 3.070881, 0.9921569, 0, 1, 1,
0.9840479, -0.4952486, 1.93001, 0.9960784, 0, 1, 1,
0.9842607, 1.462053, 1.513263, 1, 0, 0.9960784, 1,
0.986659, 2.847313, 0.1935924, 1, 0, 0.9882353, 1,
0.9905877, 1.273244, 0.9802385, 1, 0, 0.9843137, 1,
0.9932794, -0.6757013, 1.625905, 1, 0, 0.9764706, 1,
0.9955937, 0.2167676, 1.266605, 1, 0, 0.972549, 1,
0.998038, -1.600216, 3.112596, 1, 0, 0.9647059, 1,
0.9980916, -0.6262001, 1.693494, 1, 0, 0.9607843, 1,
0.9990734, 1.175034, 1.496336, 1, 0, 0.9529412, 1,
0.9994199, 3.324726, -1.16064, 1, 0, 0.9490196, 1,
1.005446, 1.32044, -0.7728724, 1, 0, 0.9411765, 1,
1.006041, 1.008328, 1.455729, 1, 0, 0.9372549, 1,
1.010716, 1.25409, -0.2943721, 1, 0, 0.9294118, 1,
1.015734, 0.4750721, 2.053096, 1, 0, 0.9254902, 1,
1.03043, -0.08372436, 1.333833, 1, 0, 0.9176471, 1,
1.030715, 1.358739, 0.1694129, 1, 0, 0.9137255, 1,
1.056482, -0.5974156, 1.448156, 1, 0, 0.9058824, 1,
1.063028, -1.330805, 3.434457, 1, 0, 0.9019608, 1,
1.080651, -1.140826, 2.476806, 1, 0, 0.8941177, 1,
1.081195, 1.329156, 1.432707, 1, 0, 0.8862745, 1,
1.081725, 1.330745, 1.385518, 1, 0, 0.8823529, 1,
1.086511, 1.27549, 1.484926, 1, 0, 0.8745098, 1,
1.088324, 1.52696, 1.729442, 1, 0, 0.8705882, 1,
1.089634, -1.262041, 2.817955, 1, 0, 0.8627451, 1,
1.09668, 0.4496047, 0.7193695, 1, 0, 0.8588235, 1,
1.098367, -0.44017, 1.895772, 1, 0, 0.8509804, 1,
1.102418, 0.3178794, 2.810811, 1, 0, 0.8470588, 1,
1.10557, -2.250215, 1.743307, 1, 0, 0.8392157, 1,
1.111378, -1.260247, 3.150805, 1, 0, 0.8352941, 1,
1.125131, -0.2777293, 2.922689, 1, 0, 0.827451, 1,
1.127975, 0.4030181, -0.3167778, 1, 0, 0.8235294, 1,
1.13257, -0.06575062, 1.349939, 1, 0, 0.8156863, 1,
1.133736, -1.17123, 0.9741575, 1, 0, 0.8117647, 1,
1.138535, 0.9340367, -0.2381486, 1, 0, 0.8039216, 1,
1.142014, -0.2564876, 2.520005, 1, 0, 0.7960784, 1,
1.148702, 1.364219, 0.3529303, 1, 0, 0.7921569, 1,
1.148823, 1.094569, -0.5047602, 1, 0, 0.7843137, 1,
1.150149, 0.9127285, -1.067136, 1, 0, 0.7803922, 1,
1.154132, -0.4762124, 2.49787, 1, 0, 0.772549, 1,
1.179253, -2.16836, 3.290696, 1, 0, 0.7686275, 1,
1.179836, -1.085793, 0.6786154, 1, 0, 0.7607843, 1,
1.181594, -2.834173, 3.199254, 1, 0, 0.7568628, 1,
1.186299, 1.495533, 2.150138, 1, 0, 0.7490196, 1,
1.203127, -1.294261, 3.251724, 1, 0, 0.7450981, 1,
1.205775, -0.8820524, 1.46696, 1, 0, 0.7372549, 1,
1.207744, -0.0698707, 1.125779, 1, 0, 0.7333333, 1,
1.208068, -0.03646144, 1.077869, 1, 0, 0.7254902, 1,
1.210376, -1.369807, 0.8839322, 1, 0, 0.7215686, 1,
1.210866, -1.284954, 3.203492, 1, 0, 0.7137255, 1,
1.219936, 0.07571886, 0.4991362, 1, 0, 0.7098039, 1,
1.236041, -0.5976732, 1.365152, 1, 0, 0.7019608, 1,
1.237335, 0.7800564, -1.485442, 1, 0, 0.6941177, 1,
1.240249, 0.2605329, 1.741057, 1, 0, 0.6901961, 1,
1.248859, -0.2146983, 1.916956, 1, 0, 0.682353, 1,
1.265241, 0.2227079, 2.344308, 1, 0, 0.6784314, 1,
1.268204, -0.4926213, 0.5693916, 1, 0, 0.6705883, 1,
1.270546, 0.02910545, 1.471768, 1, 0, 0.6666667, 1,
1.275743, 0.4334938, 2.629391, 1, 0, 0.6588235, 1,
1.280876, 2.284887, 1.567815, 1, 0, 0.654902, 1,
1.284979, 0.4525057, 2.634268, 1, 0, 0.6470588, 1,
1.286248, 0.1549276, 1.764511, 1, 0, 0.6431373, 1,
1.288596, 0.9035593, 0.6021808, 1, 0, 0.6352941, 1,
1.292883, -0.6265921, 1.073539, 1, 0, 0.6313726, 1,
1.297052, 0.5238091, 0.1139418, 1, 0, 0.6235294, 1,
1.29983, -1.40908, 1.85161, 1, 0, 0.6196079, 1,
1.301696, 0.7831783, 1.949876, 1, 0, 0.6117647, 1,
1.304991, -1.132082, 3.581589, 1, 0, 0.6078432, 1,
1.304992, -1.067935, 1.446761, 1, 0, 0.6, 1,
1.321906, -0.7000281, 1.138329, 1, 0, 0.5921569, 1,
1.330097, 1.245841, 2.085192, 1, 0, 0.5882353, 1,
1.331788, 0.571705, 2.175218, 1, 0, 0.5803922, 1,
1.335428, 0.9431891, 0.3125601, 1, 0, 0.5764706, 1,
1.350384, -1.653239, 2.40109, 1, 0, 0.5686275, 1,
1.35142, -0.7356887, 3.21882, 1, 0, 0.5647059, 1,
1.352932, 0.1726261, 3.708579, 1, 0, 0.5568628, 1,
1.357968, 0.9615482, 2.016788, 1, 0, 0.5529412, 1,
1.361203, 1.564512, -0.987869, 1, 0, 0.5450981, 1,
1.362271, 0.5607155, 1.122374, 1, 0, 0.5411765, 1,
1.371258, 0.6175151, 1.643357, 1, 0, 0.5333334, 1,
1.376622, 0.6070226, 1.507063, 1, 0, 0.5294118, 1,
1.382506, 1.306545, 0.6132807, 1, 0, 0.5215687, 1,
1.385025, -0.01055849, 1.806875, 1, 0, 0.5176471, 1,
1.385044, 0.5160011, 1.576299, 1, 0, 0.509804, 1,
1.386613, -0.5951529, 2.171263, 1, 0, 0.5058824, 1,
1.391089, -0.7777445, 3.071851, 1, 0, 0.4980392, 1,
1.401095, 0.03327358, 1.059669, 1, 0, 0.4901961, 1,
1.40126, -0.4646495, 2.4661, 1, 0, 0.4862745, 1,
1.403881, -0.2250761, 2.785218, 1, 0, 0.4784314, 1,
1.403993, -1.418619, 1.989665, 1, 0, 0.4745098, 1,
1.406264, -0.6669768, 1.807327, 1, 0, 0.4666667, 1,
1.407731, -1.518832, 1.636835, 1, 0, 0.4627451, 1,
1.428122, -0.365025, 3.061971, 1, 0, 0.454902, 1,
1.430552, -0.03633954, 0.3751094, 1, 0, 0.4509804, 1,
1.43065, -1.6122, 0.6771885, 1, 0, 0.4431373, 1,
1.43186, 0.8820805, 0.546092, 1, 0, 0.4392157, 1,
1.433471, -1.102014, 1.082413, 1, 0, 0.4313726, 1,
1.434456, 1.782409, 0.772086, 1, 0, 0.427451, 1,
1.434494, 1.17359, 1.227975, 1, 0, 0.4196078, 1,
1.435935, 0.7141179, 1.655052, 1, 0, 0.4156863, 1,
1.436301, -0.6656393, 2.674848, 1, 0, 0.4078431, 1,
1.438731, 1.659194, 0.7050061, 1, 0, 0.4039216, 1,
1.445877, -0.7305914, -0.2934408, 1, 0, 0.3960784, 1,
1.451794, 1.007774, 0.7375062, 1, 0, 0.3882353, 1,
1.456528, 1.539736, 0.6278021, 1, 0, 0.3843137, 1,
1.475053, -1.562484, 2.887178, 1, 0, 0.3764706, 1,
1.483731, -0.7156016, 1.506818, 1, 0, 0.372549, 1,
1.493777, -1.688784, 4.657491, 1, 0, 0.3647059, 1,
1.500087, -0.7081448, 1.875953, 1, 0, 0.3607843, 1,
1.511573, -2.413457, 3.186999, 1, 0, 0.3529412, 1,
1.512105, -0.4157856, 1.012308, 1, 0, 0.3490196, 1,
1.529888, 0.3749873, 1.41114, 1, 0, 0.3411765, 1,
1.531245, 1.277126, 1.356952, 1, 0, 0.3372549, 1,
1.532871, -0.7341812, 3.03003, 1, 0, 0.3294118, 1,
1.535776, 1.412001, 1.975972, 1, 0, 0.3254902, 1,
1.536232, 0.4187144, 1.095889, 1, 0, 0.3176471, 1,
1.552838, -0.334147, 1.730658, 1, 0, 0.3137255, 1,
1.554477, 0.5739191, 0.8226391, 1, 0, 0.3058824, 1,
1.554771, 1.479393, 0.4412182, 1, 0, 0.2980392, 1,
1.562587, 1.237567, 1.580412, 1, 0, 0.2941177, 1,
1.56996, 0.8649375, 2.097811, 1, 0, 0.2862745, 1,
1.570975, -0.09611029, 1.428389, 1, 0, 0.282353, 1,
1.583469, -1.678383, 2.214555, 1, 0, 0.2745098, 1,
1.605869, 0.7368281, 1.712937, 1, 0, 0.2705882, 1,
1.62597, 1.012459, 2.023361, 1, 0, 0.2627451, 1,
1.63078, -0.4358827, 1.697092, 1, 0, 0.2588235, 1,
1.644266, -0.9327948, 2.252762, 1, 0, 0.2509804, 1,
1.645625, -0.3595314, 0.832959, 1, 0, 0.2470588, 1,
1.65051, -0.2400952, 1.352217, 1, 0, 0.2392157, 1,
1.674061, -1.536601, 2.558383, 1, 0, 0.2352941, 1,
1.712523, 0.1761081, 2.585814, 1, 0, 0.227451, 1,
1.738842, 2.754078, 0.2781673, 1, 0, 0.2235294, 1,
1.74611, -0.353635, 3.03891, 1, 0, 0.2156863, 1,
1.783016, -0.4247229, 2.096532, 1, 0, 0.2117647, 1,
1.786872, -1.380039, 3.147213, 1, 0, 0.2039216, 1,
1.810465, -0.5106715, 0.5841249, 1, 0, 0.1960784, 1,
1.815623, 1.352808, 0.1662538, 1, 0, 0.1921569, 1,
1.823122, 0.790901, 0.2138917, 1, 0, 0.1843137, 1,
1.829657, 0.5889419, 2.021972, 1, 0, 0.1803922, 1,
1.832584, -0.7198189, 2.375079, 1, 0, 0.172549, 1,
1.840238, -1.181618, 2.078261, 1, 0, 0.1686275, 1,
1.850355, -0.2587221, 1.969302, 1, 0, 0.1607843, 1,
1.896693, 0.4923766, 0.8354774, 1, 0, 0.1568628, 1,
1.956125, 0.9540785, 0.9312652, 1, 0, 0.1490196, 1,
1.985683, 0.8157968, 0.6552274, 1, 0, 0.145098, 1,
2.036808, -0.7460964, 1.236075, 1, 0, 0.1372549, 1,
2.039426, 1.248278, -0.2757368, 1, 0, 0.1333333, 1,
2.044821, 0.3044479, 0.8404492, 1, 0, 0.1254902, 1,
2.054695, -0.3258372, 2.269313, 1, 0, 0.1215686, 1,
2.099195, -0.7119669, 2.272154, 1, 0, 0.1137255, 1,
2.109675, -0.6119584, 1.25184, 1, 0, 0.1098039, 1,
2.119382, -2.429739, 2.15585, 1, 0, 0.1019608, 1,
2.232055, -0.1631622, 2.34821, 1, 0, 0.09411765, 1,
2.305628, -2.028861, 3.185429, 1, 0, 0.09019608, 1,
2.33629, -0.2268763, 1.474181, 1, 0, 0.08235294, 1,
2.344191, -1.051386, 2.489851, 1, 0, 0.07843138, 1,
2.439767, 1.025544, 1.793009, 1, 0, 0.07058824, 1,
2.449841, -0.422452, 3.18582, 1, 0, 0.06666667, 1,
2.499259, 0.1182419, 1.693804, 1, 0, 0.05882353, 1,
2.51195, -0.935152, 3.151522, 1, 0, 0.05490196, 1,
2.561522, 0.6608825, 2.240656, 1, 0, 0.04705882, 1,
2.573783, -0.5494568, 3.183141, 1, 0, 0.04313726, 1,
2.60401, 0.6537867, 3.450129, 1, 0, 0.03529412, 1,
2.664168, 2.243623, 1.744879, 1, 0, 0.03137255, 1,
2.667923, -0.08543469, 0.8661386, 1, 0, 0.02352941, 1,
2.773587, 0.08425741, 1.695898, 1, 0, 0.01960784, 1,
3.109577, -0.2157981, 2.570318, 1, 0, 0.01176471, 1,
3.42784, 0.9824987, 1.929929, 1, 0, 0.007843138, 1
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
0.0851022, -4.083206, -6.620675, 0, -0.5, 0.5, 0.5,
0.0851022, -4.083206, -6.620675, 1, -0.5, 0.5, 0.5,
0.0851022, -4.083206, -6.620675, 1, 1.5, 0.5, 0.5,
0.0851022, -4.083206, -6.620675, 0, 1.5, 0.5, 0.5
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
-4.390824, 0.1575896, -6.620675, 0, -0.5, 0.5, 0.5,
-4.390824, 0.1575896, -6.620675, 1, -0.5, 0.5, 0.5,
-4.390824, 0.1575896, -6.620675, 1, 1.5, 0.5, 0.5,
-4.390824, 0.1575896, -6.620675, 0, 1.5, 0.5, 0.5
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
-4.390824, -4.083206, 0.564115, 0, -0.5, 0.5, 0.5,
-4.390824, -4.083206, 0.564115, 1, -0.5, 0.5, 0.5,
-4.390824, -4.083206, 0.564115, 1, 1.5, 0.5, 0.5,
-4.390824, -4.083206, 0.564115, 0, 1.5, 0.5, 0.5
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
-3, -3.104561, -4.962646,
3, -3.104561, -4.962646,
-3, -3.104561, -4.962646,
-3, -3.267669, -5.238985,
-2, -3.104561, -4.962646,
-2, -3.267669, -5.238985,
-1, -3.104561, -4.962646,
-1, -3.267669, -5.238985,
0, -3.104561, -4.962646,
0, -3.267669, -5.238985,
1, -3.104561, -4.962646,
1, -3.267669, -5.238985,
2, -3.104561, -4.962646,
2, -3.267669, -5.238985,
3, -3.104561, -4.962646,
3, -3.267669, -5.238985
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
-3, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
-3, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
-3, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
-3, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
-2, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
-2, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
-2, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
-2, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
-1, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
-1, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
-1, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
-1, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
0, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
0, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
0, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
0, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
1, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
1, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
1, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
1, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
2, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
2, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
2, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
2, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5,
3, -3.593884, -5.791661, 0, -0.5, 0.5, 0.5,
3, -3.593884, -5.791661, 1, -0.5, 0.5, 0.5,
3, -3.593884, -5.791661, 1, 1.5, 0.5, 0.5,
3, -3.593884, -5.791661, 0, 1.5, 0.5, 0.5
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
-3.357918, -3, -4.962646,
-3.357918, 3, -4.962646,
-3.357918, -3, -4.962646,
-3.530069, -3, -5.238985,
-3.357918, -2, -4.962646,
-3.530069, -2, -5.238985,
-3.357918, -1, -4.962646,
-3.530069, -1, -5.238985,
-3.357918, 0, -4.962646,
-3.530069, 0, -5.238985,
-3.357918, 1, -4.962646,
-3.530069, 1, -5.238985,
-3.357918, 2, -4.962646,
-3.530069, 2, -5.238985,
-3.357918, 3, -4.962646,
-3.530069, 3, -5.238985
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
-3.874371, -3, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, -3, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, -3, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, -3, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, -2, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, -2, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, -2, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, -2, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, -1, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, -1, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, -1, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, -1, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, 0, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, 0, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, 0, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, 0, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, 1, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, 1, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, 1, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, 1, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, 2, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, 2, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, 2, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, 2, -5.791661, 0, 1.5, 0.5, 0.5,
-3.874371, 3, -5.791661, 0, -0.5, 0.5, 0.5,
-3.874371, 3, -5.791661, 1, -0.5, 0.5, 0.5,
-3.874371, 3, -5.791661, 1, 1.5, 0.5, 0.5,
-3.874371, 3, -5.791661, 0, 1.5, 0.5, 0.5
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
-3.357918, -3.104561, -4,
-3.357918, -3.104561, 4,
-3.357918, -3.104561, -4,
-3.530069, -3.267669, -4,
-3.357918, -3.104561, -2,
-3.530069, -3.267669, -2,
-3.357918, -3.104561, 0,
-3.530069, -3.267669, 0,
-3.357918, -3.104561, 2,
-3.530069, -3.267669, 2,
-3.357918, -3.104561, 4,
-3.530069, -3.267669, 4
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
-3.874371, -3.593884, -4, 0, -0.5, 0.5, 0.5,
-3.874371, -3.593884, -4, 1, -0.5, 0.5, 0.5,
-3.874371, -3.593884, -4, 1, 1.5, 0.5, 0.5,
-3.874371, -3.593884, -4, 0, 1.5, 0.5, 0.5,
-3.874371, -3.593884, -2, 0, -0.5, 0.5, 0.5,
-3.874371, -3.593884, -2, 1, -0.5, 0.5, 0.5,
-3.874371, -3.593884, -2, 1, 1.5, 0.5, 0.5,
-3.874371, -3.593884, -2, 0, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 0, 0, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 0, 1, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 0, 1, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 0, 0, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 2, 0, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 2, 1, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 2, 1, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 2, 0, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 4, 0, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 4, 1, -0.5, 0.5, 0.5,
-3.874371, -3.593884, 4, 1, 1.5, 0.5, 0.5,
-3.874371, -3.593884, 4, 0, 1.5, 0.5, 0.5
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
-3.357918, -3.104561, -4.962646,
-3.357918, 3.41974, -4.962646,
-3.357918, -3.104561, 6.090877,
-3.357918, 3.41974, 6.090877,
-3.357918, -3.104561, -4.962646,
-3.357918, -3.104561, 6.090877,
-3.357918, 3.41974, -4.962646,
-3.357918, 3.41974, 6.090877,
-3.357918, -3.104561, -4.962646,
3.528122, -3.104561, -4.962646,
-3.357918, -3.104561, 6.090877,
3.528122, -3.104561, 6.090877,
-3.357918, 3.41974, -4.962646,
3.528122, 3.41974, -4.962646,
-3.357918, 3.41974, 6.090877,
3.528122, 3.41974, 6.090877,
3.528122, -3.104561, -4.962646,
3.528122, 3.41974, -4.962646,
3.528122, -3.104561, 6.090877,
3.528122, 3.41974, 6.090877,
3.528122, -3.104561, -4.962646,
3.528122, -3.104561, 6.090877,
3.528122, 3.41974, -4.962646,
3.528122, 3.41974, 6.090877
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
var radius = 7.777889;
var distance = 34.60471;
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
mvMatrix.translate( -0.0851022, -0.1575896, -0.564115 );
mvMatrix.scale( 1.221254, 1.288967, 0.7608078 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60471);
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


