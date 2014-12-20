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
-3.138732, -0.169805, -0.1146389, 1, 0, 0, 1,
-2.841314, 0.9541296, -3.080978, 1, 0.007843138, 0, 1,
-2.719618, -2.132009, -2.55218, 1, 0.01176471, 0, 1,
-2.648304, -0.8358301, -1.063672, 1, 0.01960784, 0, 1,
-2.374583, 1.970575, -2.805062, 1, 0.02352941, 0, 1,
-2.373428, -0.8598379, -2.632785, 1, 0.03137255, 0, 1,
-2.333149, 0.3683355, -2.521184, 1, 0.03529412, 0, 1,
-2.332621, -0.5756487, -2.674102, 1, 0.04313726, 0, 1,
-2.322374, 0.3677171, 0.4609986, 1, 0.04705882, 0, 1,
-2.302738, -0.3764049, -3.127336, 1, 0.05490196, 0, 1,
-2.300902, -1.088664, -2.034938, 1, 0.05882353, 0, 1,
-2.166397, 0.02028534, -2.199958, 1, 0.06666667, 0, 1,
-2.070354, 1.015623, -0.1420646, 1, 0.07058824, 0, 1,
-2.053756, 0.01420451, -0.06716814, 1, 0.07843138, 0, 1,
-2.026999, 0.2852624, -0.2944374, 1, 0.08235294, 0, 1,
-1.996332, -0.9666898, -2.465174, 1, 0.09019608, 0, 1,
-1.977346, 0.1261325, -1.190643, 1, 0.09411765, 0, 1,
-1.95745, 0.2489777, -1.685525, 1, 0.1019608, 0, 1,
-1.953222, 0.01043862, -2.22025, 1, 0.1098039, 0, 1,
-1.948479, 0.5149922, -1.156408, 1, 0.1137255, 0, 1,
-1.938156, -0.8279089, -2.408199, 1, 0.1215686, 0, 1,
-1.91103, -0.4833856, -2.741995, 1, 0.1254902, 0, 1,
-1.88125, -0.5642418, -1.661989, 1, 0.1333333, 0, 1,
-1.878735, 0.3279904, -1.280142, 1, 0.1372549, 0, 1,
-1.874189, -0.3828822, -1.911398, 1, 0.145098, 0, 1,
-1.873043, 1.669778, -0.07620408, 1, 0.1490196, 0, 1,
-1.869123, -1.149887, -2.96534, 1, 0.1568628, 0, 1,
-1.834383, 1.407744, -0.6314283, 1, 0.1607843, 0, 1,
-1.826727, 0.009906049, -1.072088, 1, 0.1686275, 0, 1,
-1.756076, -0.6314425, -1.665417, 1, 0.172549, 0, 1,
-1.719914, 0.6958728, -0.8896831, 1, 0.1803922, 0, 1,
-1.715648, -1.481084, -1.018252, 1, 0.1843137, 0, 1,
-1.707993, -0.7772998, -3.057385, 1, 0.1921569, 0, 1,
-1.690777, 1.152729, -0.4033065, 1, 0.1960784, 0, 1,
-1.672032, 0.4634865, -1.624691, 1, 0.2039216, 0, 1,
-1.659756, -0.3737319, -1.330682, 1, 0.2117647, 0, 1,
-1.659479, -1.360963, -1.198982, 1, 0.2156863, 0, 1,
-1.640799, -0.29338, -2.130991, 1, 0.2235294, 0, 1,
-1.636327, -0.001518149, -2.088259, 1, 0.227451, 0, 1,
-1.633213, 0.7187815, -1.113718, 1, 0.2352941, 0, 1,
-1.632828, 0.804789, -1.801613, 1, 0.2392157, 0, 1,
-1.627094, 1.406054, 0.0353513, 1, 0.2470588, 0, 1,
-1.621166, -0.7316691, -0.6569133, 1, 0.2509804, 0, 1,
-1.614295, 0.4633806, -2.92709, 1, 0.2588235, 0, 1,
-1.6124, -0.8890182, -1.088472, 1, 0.2627451, 0, 1,
-1.600375, 1.633405, -0.6566747, 1, 0.2705882, 0, 1,
-1.594438, -0.1972765, -2.109117, 1, 0.2745098, 0, 1,
-1.5919, 0.06820774, -0.390819, 1, 0.282353, 0, 1,
-1.571906, 0.06911425, -3.103345, 1, 0.2862745, 0, 1,
-1.553773, 0.1573683, -1.206001, 1, 0.2941177, 0, 1,
-1.553671, 0.3366501, -0.6368241, 1, 0.3019608, 0, 1,
-1.549968, -0.8601494, -1.529313, 1, 0.3058824, 0, 1,
-1.542922, -0.6206279, -0.8866799, 1, 0.3137255, 0, 1,
-1.534299, -0.6402869, -1.23562, 1, 0.3176471, 0, 1,
-1.52076, -1.534848, -4.777903, 1, 0.3254902, 0, 1,
-1.51984, 1.137911, -0.5753194, 1, 0.3294118, 0, 1,
-1.512015, -0.3724322, -0.4743399, 1, 0.3372549, 0, 1,
-1.511535, -0.1014307, -0.841994, 1, 0.3411765, 0, 1,
-1.503132, 0.2150448, 0.1418418, 1, 0.3490196, 0, 1,
-1.485295, 2.327703, -0.7258853, 1, 0.3529412, 0, 1,
-1.478648, 1.130389, -0.2306412, 1, 0.3607843, 0, 1,
-1.469003, 0.09297588, -1.619442, 1, 0.3647059, 0, 1,
-1.463706, -0.6151482, -0.6683534, 1, 0.372549, 0, 1,
-1.4561, -1.188939, -4.053845, 1, 0.3764706, 0, 1,
-1.45488, -1.056368, -2.226733, 1, 0.3843137, 0, 1,
-1.443542, 0.8434337, -0.7713711, 1, 0.3882353, 0, 1,
-1.442247, 1.164285, 1.213918, 1, 0.3960784, 0, 1,
-1.430276, -0.4288814, 0.312108, 1, 0.4039216, 0, 1,
-1.405682, 1.169471, 0.2031485, 1, 0.4078431, 0, 1,
-1.391488, -0.1341488, -0.4543371, 1, 0.4156863, 0, 1,
-1.386379, -0.3744506, -1.221448, 1, 0.4196078, 0, 1,
-1.368752, 0.06069545, -1.933693, 1, 0.427451, 0, 1,
-1.36309, -0.007095874, -1.076451, 1, 0.4313726, 0, 1,
-1.360945, 0.3089487, -1.327557, 1, 0.4392157, 0, 1,
-1.351348, 0.891571, -1.542417, 1, 0.4431373, 0, 1,
-1.344324, 0.9540464, -0.3520723, 1, 0.4509804, 0, 1,
-1.338581, 2.186363, -1.542557, 1, 0.454902, 0, 1,
-1.335724, -0.2172895, -2.137332, 1, 0.4627451, 0, 1,
-1.329955, 1.198163, -0.6027363, 1, 0.4666667, 0, 1,
-1.326547, 0.096418, -1.824051, 1, 0.4745098, 0, 1,
-1.325216, 0.7128013, 0.6773007, 1, 0.4784314, 0, 1,
-1.31365, -0.832822, -1.205389, 1, 0.4862745, 0, 1,
-1.312249, 1.794984, 0.1437506, 1, 0.4901961, 0, 1,
-1.312065, 1.302509, -0.9230923, 1, 0.4980392, 0, 1,
-1.311683, -0.157138, -1.936164, 1, 0.5058824, 0, 1,
-1.301819, -0.2641395, -3.25181, 1, 0.509804, 0, 1,
-1.289007, 0.5185521, -1.655529, 1, 0.5176471, 0, 1,
-1.286397, 0.4894366, -1.991109, 1, 0.5215687, 0, 1,
-1.285446, -0.3828214, -2.393444, 1, 0.5294118, 0, 1,
-1.275594, 2.082893, -0.6017954, 1, 0.5333334, 0, 1,
-1.269687, -0.9380004, -3.069039, 1, 0.5411765, 0, 1,
-1.26854, 0.3507974, 0.6823607, 1, 0.5450981, 0, 1,
-1.268389, 1.044894, -0.8106912, 1, 0.5529412, 0, 1,
-1.25767, -0.8710748, -3.981245, 1, 0.5568628, 0, 1,
-1.257392, 0.1901453, -1.817833, 1, 0.5647059, 0, 1,
-1.253263, 0.05036316, -1.253961, 1, 0.5686275, 0, 1,
-1.252215, -1.945857, -3.577643, 1, 0.5764706, 0, 1,
-1.24542, 0.4161099, -1.819759, 1, 0.5803922, 0, 1,
-1.241976, 0.3900618, -1.539592, 1, 0.5882353, 0, 1,
-1.241224, -0.629685, -1.700154, 1, 0.5921569, 0, 1,
-1.239049, 0.2276142, -0.7206868, 1, 0.6, 0, 1,
-1.238288, 1.343935, 1.207436, 1, 0.6078432, 0, 1,
-1.238031, 0.2691141, -0.9100475, 1, 0.6117647, 0, 1,
-1.211424, -1.59352, -1.562072, 1, 0.6196079, 0, 1,
-1.204338, -0.0364961, -1.104606, 1, 0.6235294, 0, 1,
-1.189252, 0.723688, -2.019799, 1, 0.6313726, 0, 1,
-1.182768, -0.3777754, -1.138483, 1, 0.6352941, 0, 1,
-1.182706, -0.3865516, -1.636331, 1, 0.6431373, 0, 1,
-1.182227, -0.1368772, -1.813666, 1, 0.6470588, 0, 1,
-1.177036, -0.9512313, -1.94883, 1, 0.654902, 0, 1,
-1.169732, -0.5576171, -2.358933, 1, 0.6588235, 0, 1,
-1.169324, -0.1225578, -1.176209, 1, 0.6666667, 0, 1,
-1.166174, -0.7241771, -3.493739, 1, 0.6705883, 0, 1,
-1.162977, 0.02718443, -1.584023, 1, 0.6784314, 0, 1,
-1.162508, -0.6230004, -1.242272, 1, 0.682353, 0, 1,
-1.158403, -0.08739701, -3.322697, 1, 0.6901961, 0, 1,
-1.15839, -0.1874842, -4.413612, 1, 0.6941177, 0, 1,
-1.156914, 1.098169, -0.6223491, 1, 0.7019608, 0, 1,
-1.138368, -0.02105935, -3.474623, 1, 0.7098039, 0, 1,
-1.135964, -0.6073738, -2.680577, 1, 0.7137255, 0, 1,
-1.13402, 0.4374193, -3.420024, 1, 0.7215686, 0, 1,
-1.128336, 1.964657, 0.6462002, 1, 0.7254902, 0, 1,
-1.128166, -0.2196356, 0.09781925, 1, 0.7333333, 0, 1,
-1.126808, -0.04303676, -2.767127, 1, 0.7372549, 0, 1,
-1.126026, 0.7716832, -2.158123, 1, 0.7450981, 0, 1,
-1.124048, 0.8690212, -1.58892, 1, 0.7490196, 0, 1,
-1.109248, -0.3596913, -2.302619, 1, 0.7568628, 0, 1,
-1.106743, 0.2709142, -0.7186501, 1, 0.7607843, 0, 1,
-1.104384, 0.2335038, -1.720727, 1, 0.7686275, 0, 1,
-1.077459, -0.3406637, -1.227436, 1, 0.772549, 0, 1,
-1.07692, 1.928766, -0.5765954, 1, 0.7803922, 0, 1,
-1.075933, 1.103032, -0.7220105, 1, 0.7843137, 0, 1,
-1.070516, 1.616876, -0.8055729, 1, 0.7921569, 0, 1,
-1.065942, 0.4557511, -1.602661, 1, 0.7960784, 0, 1,
-1.061151, -0.7723925, -2.044019, 1, 0.8039216, 0, 1,
-1.055418, 1.884845, -1.201125, 1, 0.8117647, 0, 1,
-1.054559, -0.595267, -2.670681, 1, 0.8156863, 0, 1,
-1.054079, -1.778007, -3.125903, 1, 0.8235294, 0, 1,
-1.050392, -1.114133, -2.029578, 1, 0.827451, 0, 1,
-1.047296, -0.06589282, -0.5125371, 1, 0.8352941, 0, 1,
-1.045909, -0.7550516, -1.453756, 1, 0.8392157, 0, 1,
-1.045323, 0.2810799, -1.059724, 1, 0.8470588, 0, 1,
-1.043727, -0.592786, -3.203134, 1, 0.8509804, 0, 1,
-1.042885, -2.144779, -1.226315, 1, 0.8588235, 0, 1,
-1.038054, 0.7461666, 0.2586134, 1, 0.8627451, 0, 1,
-1.03766, 0.004072794, -0.5790514, 1, 0.8705882, 0, 1,
-1.032398, -1.412204, -2.393472, 1, 0.8745098, 0, 1,
-1.030574, 1.007661, -0.6187252, 1, 0.8823529, 0, 1,
-1.02784, 0.05704892, -2.045231, 1, 0.8862745, 0, 1,
-1.027565, -0.8090664, -1.171857, 1, 0.8941177, 0, 1,
-1.025445, 0.304241, -1.066426, 1, 0.8980392, 0, 1,
-1.024466, 0.6971453, -0.5879405, 1, 0.9058824, 0, 1,
-1.023077, 0.54544, -1.475063, 1, 0.9137255, 0, 1,
-1.021455, 2.638768, -1.150492, 1, 0.9176471, 0, 1,
-1.017341, -0.209047, -2.567598, 1, 0.9254902, 0, 1,
-1.016683, 0.007971919, -1.878138, 1, 0.9294118, 0, 1,
-1.010943, 2.147496, -0.1372986, 1, 0.9372549, 0, 1,
-1.006606, -0.6391416, -3.183656, 1, 0.9411765, 0, 1,
-1.006437, 1.193086, 0.01060564, 1, 0.9490196, 0, 1,
-1.005052, -0.9162522, -2.943819, 1, 0.9529412, 0, 1,
-1.00293, -0.4751018, -1.400502, 1, 0.9607843, 0, 1,
-1.002717, 0.1306743, -1.266505, 1, 0.9647059, 0, 1,
-1.002192, 0.6511112, -1.852868, 1, 0.972549, 0, 1,
-1.001333, 0.613421, -0.09878273, 1, 0.9764706, 0, 1,
-1.001294, -0.2081507, -1.595336, 1, 0.9843137, 0, 1,
-0.9915225, -1.883007, -3.349496, 1, 0.9882353, 0, 1,
-0.983648, 0.06693529, -0.840238, 1, 0.9960784, 0, 1,
-0.9781764, 0.4411448, -2.75123, 0.9960784, 1, 0, 1,
-0.9757786, -0.1956693, -1.91027, 0.9921569, 1, 0, 1,
-0.9746071, -0.8376966, -1.851645, 0.9843137, 1, 0, 1,
-0.9701768, -0.06837326, -2.134443, 0.9803922, 1, 0, 1,
-0.9673106, -0.6959502, -3.643442, 0.972549, 1, 0, 1,
-0.9663701, -1.034495, -1.3204, 0.9686275, 1, 0, 1,
-0.9661266, -0.2219235, -1.90403, 0.9607843, 1, 0, 1,
-0.9624946, -0.2027102, -2.615131, 0.9568627, 1, 0, 1,
-0.9532596, -1.3233, -3.353826, 0.9490196, 1, 0, 1,
-0.9476348, 0.05362527, -0.9317077, 0.945098, 1, 0, 1,
-0.9425824, -0.1052993, -1.263127, 0.9372549, 1, 0, 1,
-0.9402252, 1.929208, -0.2910975, 0.9333333, 1, 0, 1,
-0.9380772, -0.4510446, -1.448205, 0.9254902, 1, 0, 1,
-0.9356753, -1.471243, -3.016133, 0.9215686, 1, 0, 1,
-0.9313205, -0.8340433, -0.07375783, 0.9137255, 1, 0, 1,
-0.9294737, 0.8823932, -0.3967252, 0.9098039, 1, 0, 1,
-0.9251628, 0.6217339, -0.9595816, 0.9019608, 1, 0, 1,
-0.904566, 0.6667235, -0.7837291, 0.8941177, 1, 0, 1,
-0.9042856, -1.69532, -2.782135, 0.8901961, 1, 0, 1,
-0.9028186, -1.026112, -3.352796, 0.8823529, 1, 0, 1,
-0.891765, -1.014382, -1.058698, 0.8784314, 1, 0, 1,
-0.8909577, 0.1127753, -1.634089, 0.8705882, 1, 0, 1,
-0.8904122, -0.1492729, -2.516851, 0.8666667, 1, 0, 1,
-0.890269, -0.8157431, -1.691004, 0.8588235, 1, 0, 1,
-0.889382, 0.1844989, -0.2175781, 0.854902, 1, 0, 1,
-0.8861642, 1.047181, -2.048227, 0.8470588, 1, 0, 1,
-0.8859401, 1.885212, -1.14764, 0.8431373, 1, 0, 1,
-0.8839716, 1.001354, -0.9846076, 0.8352941, 1, 0, 1,
-0.8812808, -1.069757, -2.469695, 0.8313726, 1, 0, 1,
-0.8812075, -2.815848, -2.781193, 0.8235294, 1, 0, 1,
-0.8801315, -1.263555, -2.325928, 0.8196079, 1, 0, 1,
-0.8744038, -1.142753, -1.618159, 0.8117647, 1, 0, 1,
-0.863399, 0.5702631, -0.5623104, 0.8078431, 1, 0, 1,
-0.863046, -0.5747092, -2.546213, 0.8, 1, 0, 1,
-0.8583409, -1.401044, -2.477002, 0.7921569, 1, 0, 1,
-0.8482858, -1.794749, -1.843185, 0.7882353, 1, 0, 1,
-0.8425963, 0.5258708, -1.030509, 0.7803922, 1, 0, 1,
-0.8388596, -0.69306, -2.950769, 0.7764706, 1, 0, 1,
-0.8386653, -0.5480714, -2.080516, 0.7686275, 1, 0, 1,
-0.8365668, -0.3968401, -1.657484, 0.7647059, 1, 0, 1,
-0.8340966, -0.8081281, -4.086498, 0.7568628, 1, 0, 1,
-0.8339751, 0.9991223, -1.201645, 0.7529412, 1, 0, 1,
-0.8293025, 1.132858, -1.819823, 0.7450981, 1, 0, 1,
-0.8255963, -0.4952993, -2.354063, 0.7411765, 1, 0, 1,
-0.8238202, 0.155723, -1.622389, 0.7333333, 1, 0, 1,
-0.8144338, 0.6411041, -1.093331, 0.7294118, 1, 0, 1,
-0.8118004, 1.120343, 0.06473923, 0.7215686, 1, 0, 1,
-0.8110607, 0.6889067, -0.8527569, 0.7176471, 1, 0, 1,
-0.8105248, -1.196977, -3.896055, 0.7098039, 1, 0, 1,
-0.8100876, -0.5222264, -1.802558, 0.7058824, 1, 0, 1,
-0.7881744, -0.6911905, -1.565585, 0.6980392, 1, 0, 1,
-0.7859399, -1.46371, -4.074971, 0.6901961, 1, 0, 1,
-0.7846615, 2.174601, -0.7163731, 0.6862745, 1, 0, 1,
-0.7735672, -0.3722156, -3.298132, 0.6784314, 1, 0, 1,
-0.7703374, -0.9950277, -3.262359, 0.6745098, 1, 0, 1,
-0.7702779, -0.8551471, -1.597575, 0.6666667, 1, 0, 1,
-0.7702689, 0.8288458, -1.365944, 0.6627451, 1, 0, 1,
-0.7678478, 0.4078753, -1.629915, 0.654902, 1, 0, 1,
-0.7673696, 0.5702093, -0.9801026, 0.6509804, 1, 0, 1,
-0.7596098, -0.7902551, -2.575526, 0.6431373, 1, 0, 1,
-0.7527315, -0.9786546, -2.355915, 0.6392157, 1, 0, 1,
-0.7517403, 1.028263, -2.471823, 0.6313726, 1, 0, 1,
-0.7484075, 0.8156252, 0.7412573, 0.627451, 1, 0, 1,
-0.7418154, -1.395245, -0.628426, 0.6196079, 1, 0, 1,
-0.7392223, -0.02643797, -0.4450519, 0.6156863, 1, 0, 1,
-0.7386249, -0.04829745, -0.8973535, 0.6078432, 1, 0, 1,
-0.734055, -0.4264491, -3.363574, 0.6039216, 1, 0, 1,
-0.732826, -1.595587, -2.322672, 0.5960785, 1, 0, 1,
-0.728142, -2.511653, -3.246785, 0.5882353, 1, 0, 1,
-0.728051, -1.06282, -1.499557, 0.5843138, 1, 0, 1,
-0.7259725, 0.06677723, -1.05803, 0.5764706, 1, 0, 1,
-0.7187135, -1.125839, -1.138673, 0.572549, 1, 0, 1,
-0.7157426, 1.20531, 0.985589, 0.5647059, 1, 0, 1,
-0.7119278, -1.603711, -3.95723, 0.5607843, 1, 0, 1,
-0.7091799, -0.02510614, -0.4255711, 0.5529412, 1, 0, 1,
-0.704118, 0.6695735, 0.6057107, 0.5490196, 1, 0, 1,
-0.7003782, 0.7378655, -0.2169425, 0.5411765, 1, 0, 1,
-0.7002766, -0.06054995, -2.605402, 0.5372549, 1, 0, 1,
-0.7002252, -0.3603637, -1.672044, 0.5294118, 1, 0, 1,
-0.6966773, -0.4101523, -1.218519, 0.5254902, 1, 0, 1,
-0.6942429, 0.7696331, -0.6815501, 0.5176471, 1, 0, 1,
-0.6938498, 1.601634, -1.437888, 0.5137255, 1, 0, 1,
-0.6938409, -1.623485, -4.096954, 0.5058824, 1, 0, 1,
-0.6919888, -0.1212593, -2.053149, 0.5019608, 1, 0, 1,
-0.6907356, -0.6090812, -2.017186, 0.4941176, 1, 0, 1,
-0.6886895, 0.2300324, -0.979376, 0.4862745, 1, 0, 1,
-0.6880993, -0.5783161, -1.234248, 0.4823529, 1, 0, 1,
-0.6854126, 1.512429, 0.7509515, 0.4745098, 1, 0, 1,
-0.6646177, 0.1297185, -2.089898, 0.4705882, 1, 0, 1,
-0.6529761, -0.3599878, -1.782584, 0.4627451, 1, 0, 1,
-0.6505722, 0.2670442, -0.6995173, 0.4588235, 1, 0, 1,
-0.642764, -0.01737754, -1.899423, 0.4509804, 1, 0, 1,
-0.6425762, 0.04274555, -0.1339236, 0.4470588, 1, 0, 1,
-0.6425276, 0.5860915, 1.100496, 0.4392157, 1, 0, 1,
-0.6366123, 1.951559, -0.9299135, 0.4352941, 1, 0, 1,
-0.636268, 2.618046, 1.781021, 0.427451, 1, 0, 1,
-0.6346678, 0.7044838, -0.5773382, 0.4235294, 1, 0, 1,
-0.6206319, -1.598118, -1.30088, 0.4156863, 1, 0, 1,
-0.6205731, -0.8412753, -3.940992, 0.4117647, 1, 0, 1,
-0.6187633, -1.370657, -3.111915, 0.4039216, 1, 0, 1,
-0.6148104, 1.690527, 0.3062061, 0.3960784, 1, 0, 1,
-0.6144089, 0.5664147, -2.033945, 0.3921569, 1, 0, 1,
-0.6143345, -0.1526729, -0.8775836, 0.3843137, 1, 0, 1,
-0.6109036, 0.353906, -0.1327896, 0.3803922, 1, 0, 1,
-0.6025935, 0.07132814, -1.144122, 0.372549, 1, 0, 1,
-0.6009264, 0.763134, -1.433985, 0.3686275, 1, 0, 1,
-0.5947821, -0.6743097, -2.117347, 0.3607843, 1, 0, 1,
-0.5882436, 1.303617, 0.3399594, 0.3568628, 1, 0, 1,
-0.5866989, 0.157885, -1.750399, 0.3490196, 1, 0, 1,
-0.5837321, -0.05544793, -2.529105, 0.345098, 1, 0, 1,
-0.5809027, 1.409067, -0.1446677, 0.3372549, 1, 0, 1,
-0.5807589, -0.1051817, -1.966739, 0.3333333, 1, 0, 1,
-0.5806763, -1.26112, -3.081382, 0.3254902, 1, 0, 1,
-0.5711307, 0.5708759, -0.2236136, 0.3215686, 1, 0, 1,
-0.56707, 0.2360502, -1.616662, 0.3137255, 1, 0, 1,
-0.5650849, -0.7197281, -3.563456, 0.3098039, 1, 0, 1,
-0.5538709, 0.3435545, 0.1757954, 0.3019608, 1, 0, 1,
-0.552296, -0.5197058, -2.669779, 0.2941177, 1, 0, 1,
-0.5517888, -0.7215582, -3.579876, 0.2901961, 1, 0, 1,
-0.5420772, -0.01322299, -1.887414, 0.282353, 1, 0, 1,
-0.534671, 0.5253475, -2.013614, 0.2784314, 1, 0, 1,
-0.5324675, -1.962209, -3.163922, 0.2705882, 1, 0, 1,
-0.5255079, 0.913991, -0.6627966, 0.2666667, 1, 0, 1,
-0.5236234, -0.2770289, -0.5533929, 0.2588235, 1, 0, 1,
-0.5208354, -0.156799, -0.5055662, 0.254902, 1, 0, 1,
-0.5192421, 0.7906212, -1.751654, 0.2470588, 1, 0, 1,
-0.5180305, -1.32967, -2.056721, 0.2431373, 1, 0, 1,
-0.517738, 0.4999396, -2.057707, 0.2352941, 1, 0, 1,
-0.5069408, -0.07774655, -0.5599483, 0.2313726, 1, 0, 1,
-0.5064573, 0.7046529, 1.087664, 0.2235294, 1, 0, 1,
-0.5063073, -0.5879021, -2.603961, 0.2196078, 1, 0, 1,
-0.5013317, 0.2902231, -1.920468, 0.2117647, 1, 0, 1,
-0.4998959, -0.7261504, -1.372379, 0.2078431, 1, 0, 1,
-0.497081, -0.2583234, -1.805038, 0.2, 1, 0, 1,
-0.4966587, 1.158965, -1.798738, 0.1921569, 1, 0, 1,
-0.4958185, -0.6834072, -2.752632, 0.1882353, 1, 0, 1,
-0.4956747, 0.4773471, -1.305189, 0.1803922, 1, 0, 1,
-0.4946684, -0.4379363, -0.4558652, 0.1764706, 1, 0, 1,
-0.4827741, 0.9817377, -1.074854, 0.1686275, 1, 0, 1,
-0.4787788, 0.1896617, -1.833081, 0.1647059, 1, 0, 1,
-0.4723133, 1.035756, -1.298562, 0.1568628, 1, 0, 1,
-0.4710884, 0.8820654, -1.525017, 0.1529412, 1, 0, 1,
-0.4652225, -0.7663133, -3.466606, 0.145098, 1, 0, 1,
-0.46485, -0.02733007, -2.251457, 0.1411765, 1, 0, 1,
-0.4630954, -2.551815, -3.154591, 0.1333333, 1, 0, 1,
-0.4592773, -1.317559, -4.130309, 0.1294118, 1, 0, 1,
-0.4575328, 0.4704314, -2.307636, 0.1215686, 1, 0, 1,
-0.455073, 0.4438003, 0.6011035, 0.1176471, 1, 0, 1,
-0.4543837, 0.8936698, 0.7501474, 0.1098039, 1, 0, 1,
-0.4497847, 0.6034071, -0.01681161, 0.1058824, 1, 0, 1,
-0.4495869, 1.340448, -1.258605, 0.09803922, 1, 0, 1,
-0.4442928, 0.7644389, -0.58921, 0.09019608, 1, 0, 1,
-0.4418606, 0.9032776, 0.2331464, 0.08627451, 1, 0, 1,
-0.4382443, -1.4886, -2.517489, 0.07843138, 1, 0, 1,
-0.4369383, 0.02885162, -2.774029, 0.07450981, 1, 0, 1,
-0.4362327, 1.411887, -1.738761, 0.06666667, 1, 0, 1,
-0.4324368, -0.7910246, -3.957428, 0.0627451, 1, 0, 1,
-0.4294739, -1.057933, -4.341733, 0.05490196, 1, 0, 1,
-0.4196585, -0.5419526, -1.035166, 0.05098039, 1, 0, 1,
-0.4137849, 1.30251, -1.255672, 0.04313726, 1, 0, 1,
-0.4043844, -1.180742, -2.76229, 0.03921569, 1, 0, 1,
-0.3973424, -0.5749336, -3.039232, 0.03137255, 1, 0, 1,
-0.3928293, 1.213806, -0.8300625, 0.02745098, 1, 0, 1,
-0.392381, -0.5699317, -4.256783, 0.01960784, 1, 0, 1,
-0.3900157, -0.3755403, -3.267152, 0.01568628, 1, 0, 1,
-0.3851252, -0.7551947, -3.424658, 0.007843138, 1, 0, 1,
-0.3771504, -0.6056104, -1.063284, 0.003921569, 1, 0, 1,
-0.3757864, -0.01648016, -0.2892934, 0, 1, 0.003921569, 1,
-0.3750507, -1.473165, -3.405174, 0, 1, 0.01176471, 1,
-0.3745116, -0.2741483, -0.399754, 0, 1, 0.01568628, 1,
-0.3727325, -0.1946844, -3.188157, 0, 1, 0.02352941, 1,
-0.3723017, -0.8146331, -1.135936, 0, 1, 0.02745098, 1,
-0.3712885, -1.799191, -1.526213, 0, 1, 0.03529412, 1,
-0.3710412, 0.401303, -0.801305, 0, 1, 0.03921569, 1,
-0.3699341, -1.774377, -3.540123, 0, 1, 0.04705882, 1,
-0.3685978, -1.47641, -4.713075, 0, 1, 0.05098039, 1,
-0.3684469, 2.311493, 0.1219129, 0, 1, 0.05882353, 1,
-0.3614588, -0.1526921, -0.8469092, 0, 1, 0.0627451, 1,
-0.3612838, -0.1002167, -0.1995537, 0, 1, 0.07058824, 1,
-0.3610155, -1.084197, -2.321395, 0, 1, 0.07450981, 1,
-0.3605466, 0.1442316, -3.753087, 0, 1, 0.08235294, 1,
-0.3570184, -0.2637171, -1.642527, 0, 1, 0.08627451, 1,
-0.3548234, -2.043043, -3.81625, 0, 1, 0.09411765, 1,
-0.3529955, 0.06675617, -2.194244, 0, 1, 0.1019608, 1,
-0.3518692, 0.7535542, -0.2556574, 0, 1, 0.1058824, 1,
-0.3492897, 0.5465363, -1.896998, 0, 1, 0.1137255, 1,
-0.3466195, 0.4448699, -0.6038787, 0, 1, 0.1176471, 1,
-0.3417777, -0.2901955, -1.96615, 0, 1, 0.1254902, 1,
-0.339355, -0.3213215, -1.975301, 0, 1, 0.1294118, 1,
-0.3380038, -2.11296, -2.541191, 0, 1, 0.1372549, 1,
-0.3347039, 2.551634, -1.880679, 0, 1, 0.1411765, 1,
-0.3320433, -0.04544841, -1.826378, 0, 1, 0.1490196, 1,
-0.3303189, 1.122779, -0.7363693, 0, 1, 0.1529412, 1,
-0.329532, -1.802728, -4.302959, 0, 1, 0.1607843, 1,
-0.3248954, -0.2536134, -1.251354, 0, 1, 0.1647059, 1,
-0.3215472, 0.7484485, 1.534667, 0, 1, 0.172549, 1,
-0.3179851, 0.2857336, 0.4073119, 0, 1, 0.1764706, 1,
-0.31602, -0.2205918, -1.642089, 0, 1, 0.1843137, 1,
-0.3139562, 0.07909144, -1.459402, 0, 1, 0.1882353, 1,
-0.3080549, 0.6463733, 1.000128, 0, 1, 0.1960784, 1,
-0.3040072, 1.060758, -0.5260584, 0, 1, 0.2039216, 1,
-0.3022248, -0.8219441, -1.751435, 0, 1, 0.2078431, 1,
-0.2995927, 1.263406, -0.1752715, 0, 1, 0.2156863, 1,
-0.2894695, 1.059937, -1.390419, 0, 1, 0.2196078, 1,
-0.2878751, -0.09150874, -1.61628, 0, 1, 0.227451, 1,
-0.2867412, 0.5538403, 0.3589361, 0, 1, 0.2313726, 1,
-0.2824223, -0.5159312, -2.348409, 0, 1, 0.2392157, 1,
-0.2812733, -0.2304281, -1.866542, 0, 1, 0.2431373, 1,
-0.2808595, -0.4996971, -4.224965, 0, 1, 0.2509804, 1,
-0.2800876, -0.1121853, -1.60237, 0, 1, 0.254902, 1,
-0.2778052, -0.8444705, -2.172036, 0, 1, 0.2627451, 1,
-0.2761419, 1.79695, -0.7972029, 0, 1, 0.2666667, 1,
-0.2749571, 1.311797, -0.4410587, 0, 1, 0.2745098, 1,
-0.2724309, 0.4114635, 1.720836, 0, 1, 0.2784314, 1,
-0.2658645, 0.08389213, -1.74597, 0, 1, 0.2862745, 1,
-0.2655028, 1.351381, 0.4006413, 0, 1, 0.2901961, 1,
-0.2612849, 0.4497429, 0.009784081, 0, 1, 0.2980392, 1,
-0.2598406, 0.8244793, 0.1449333, 0, 1, 0.3058824, 1,
-0.2576793, -0.9761873, -2.478869, 0, 1, 0.3098039, 1,
-0.2556148, -0.8217797, -4.587409, 0, 1, 0.3176471, 1,
-0.2519998, 1.528518, -1.24523, 0, 1, 0.3215686, 1,
-0.2505377, -0.1544409, -2.697653, 0, 1, 0.3294118, 1,
-0.2483572, 1.588256, -1.771124, 0, 1, 0.3333333, 1,
-0.2464738, -1.131912, -5.803546, 0, 1, 0.3411765, 1,
-0.2418005, -1.142058, -2.449383, 0, 1, 0.345098, 1,
-0.2373372, -0.07540385, -2.700936, 0, 1, 0.3529412, 1,
-0.237182, 0.7685118, 1.538813, 0, 1, 0.3568628, 1,
-0.2339693, -0.3112703, -4.06707, 0, 1, 0.3647059, 1,
-0.2288913, -0.6921352, -3.10783, 0, 1, 0.3686275, 1,
-0.2283161, 0.8086585, -0.1761092, 0, 1, 0.3764706, 1,
-0.2269386, -0.2094857, -3.029606, 0, 1, 0.3803922, 1,
-0.2263556, -1.320655, -3.417784, 0, 1, 0.3882353, 1,
-0.2242156, 0.5873983, 0.7543978, 0, 1, 0.3921569, 1,
-0.2238298, 0.3489105, -1.681, 0, 1, 0.4, 1,
-0.2212161, 0.5360631, 0.1444834, 0, 1, 0.4078431, 1,
-0.2206859, 0.7088778, -1.030765, 0, 1, 0.4117647, 1,
-0.2202352, -0.9320612, -0.9935632, 0, 1, 0.4196078, 1,
-0.2137429, 1.044049, 0.06974352, 0, 1, 0.4235294, 1,
-0.2036275, 0.8414591, 2.012757, 0, 1, 0.4313726, 1,
-0.2025393, -0.3906725, -3.56227, 0, 1, 0.4352941, 1,
-0.2014567, 1.063771, -0.06541065, 0, 1, 0.4431373, 1,
-0.1952356, 0.9363875, -1.222768, 0, 1, 0.4470588, 1,
-0.1952179, -2.044266, -4.935606, 0, 1, 0.454902, 1,
-0.1937371, 1.178946, -1.687124, 0, 1, 0.4588235, 1,
-0.1821718, 1.279845, -0.3133957, 0, 1, 0.4666667, 1,
-0.1684889, 0.0899492, -2.928167, 0, 1, 0.4705882, 1,
-0.1668701, -2.05698, -3.343419, 0, 1, 0.4784314, 1,
-0.1666533, -0.05323258, -1.179723, 0, 1, 0.4823529, 1,
-0.166572, -0.9406804, -2.89816, 0, 1, 0.4901961, 1,
-0.1604105, 0.06651312, 0.2811674, 0, 1, 0.4941176, 1,
-0.1543868, -0.8565392, -3.316418, 0, 1, 0.5019608, 1,
-0.1481419, -1.463187, -2.700588, 0, 1, 0.509804, 1,
-0.1473068, 0.9585692, 1.009224, 0, 1, 0.5137255, 1,
-0.141537, -0.4319279, -2.14881, 0, 1, 0.5215687, 1,
-0.1369291, -0.2279232, -2.016323, 0, 1, 0.5254902, 1,
-0.134415, -2.464118, -2.958432, 0, 1, 0.5333334, 1,
-0.1337753, -1.558625, -3.366336, 0, 1, 0.5372549, 1,
-0.1321618, -1.179604, -4.171194, 0, 1, 0.5450981, 1,
-0.1311025, -0.3492072, -3.136253, 0, 1, 0.5490196, 1,
-0.1293269, 0.2364696, 0.07287032, 0, 1, 0.5568628, 1,
-0.1261628, 0.6358663, -1.583162, 0, 1, 0.5607843, 1,
-0.1259118, -2.350593, -5.449736, 0, 1, 0.5686275, 1,
-0.1249746, 1.523893, -1.402714, 0, 1, 0.572549, 1,
-0.121979, 0.9257237, 0.3784676, 0, 1, 0.5803922, 1,
-0.1198858, -0.4534131, -3.973457, 0, 1, 0.5843138, 1,
-0.1171733, -0.2653679, -3.427639, 0, 1, 0.5921569, 1,
-0.1170551, 1.514785, 1.731739, 0, 1, 0.5960785, 1,
-0.1104488, 0.3968401, -0.01698955, 0, 1, 0.6039216, 1,
-0.1089139, 0.04700695, -2.070042, 0, 1, 0.6117647, 1,
-0.1055413, -1.038173, -4.810308, 0, 1, 0.6156863, 1,
-0.1007243, -1.331688, -3.07839, 0, 1, 0.6235294, 1,
-0.09990267, -0.7835462, -3.316019, 0, 1, 0.627451, 1,
-0.09767637, 0.341453, -0.3683622, 0, 1, 0.6352941, 1,
-0.09765439, 0.1677749, -0.703794, 0, 1, 0.6392157, 1,
-0.09665778, 2.286291, -1.004447, 0, 1, 0.6470588, 1,
-0.08460522, 0.4747715, 0.0986915, 0, 1, 0.6509804, 1,
-0.0823616, -1.396755, -4.324275, 0, 1, 0.6588235, 1,
-0.08060658, 1.050613, 1.762996, 0, 1, 0.6627451, 1,
-0.08054148, 0.2993764, -1.59692, 0, 1, 0.6705883, 1,
-0.08042268, 0.2301829, -0.4533103, 0, 1, 0.6745098, 1,
-0.07553816, 0.01151132, -3.895593, 0, 1, 0.682353, 1,
-0.07393622, -0.1593611, -2.260976, 0, 1, 0.6862745, 1,
-0.07331353, -2.233685, -3.906908, 0, 1, 0.6941177, 1,
-0.07187912, 0.07031878, 0.4969513, 0, 1, 0.7019608, 1,
-0.0715513, -0.2937523, -3.784527, 0, 1, 0.7058824, 1,
-0.07061974, 1.292355, -0.05132251, 0, 1, 0.7137255, 1,
-0.0679941, -0.3707157, -3.231687, 0, 1, 0.7176471, 1,
-0.06753718, -0.4780053, -3.234506, 0, 1, 0.7254902, 1,
-0.06607865, 1.309025, 0.2236571, 0, 1, 0.7294118, 1,
-0.06516647, -0.699773, -3.368913, 0, 1, 0.7372549, 1,
-0.06455766, 0.1498476, -1.792657, 0, 1, 0.7411765, 1,
-0.06455433, 1.055014, -1.368808, 0, 1, 0.7490196, 1,
-0.05751521, 0.591728, -0.06371245, 0, 1, 0.7529412, 1,
-0.05631711, 0.1240601, 0.3992198, 0, 1, 0.7607843, 1,
-0.05610681, -0.7759319, -4.568438, 0, 1, 0.7647059, 1,
-0.05592943, 0.477298, -0.3050533, 0, 1, 0.772549, 1,
-0.05557621, 0.4753179, 0.006201603, 0, 1, 0.7764706, 1,
-0.05491196, -1.245034, -2.150988, 0, 1, 0.7843137, 1,
-0.05094784, -1.180035, -2.459238, 0, 1, 0.7882353, 1,
-0.0494452, -0.8903283, -3.484763, 0, 1, 0.7960784, 1,
-0.0465806, -0.0324734, -2.725133, 0, 1, 0.8039216, 1,
-0.03962074, -1.385646, -3.285762, 0, 1, 0.8078431, 1,
-0.03932846, -0.6082694, -2.985991, 0, 1, 0.8156863, 1,
-0.03223119, 0.5030345, -1.586623, 0, 1, 0.8196079, 1,
-0.03158623, -0.3193895, -3.868599, 0, 1, 0.827451, 1,
-0.03082915, 1.442564, 2.28502, 0, 1, 0.8313726, 1,
-0.02835806, -0.8019734, -4.162272, 0, 1, 0.8392157, 1,
-0.02805884, -1.333741, -3.095089, 0, 1, 0.8431373, 1,
-0.02378362, -0.5472351, -0.6671103, 0, 1, 0.8509804, 1,
-0.02130075, -0.382805, -4.181255, 0, 1, 0.854902, 1,
-0.01215357, -0.2247119, -3.810807, 0, 1, 0.8627451, 1,
-0.01148003, 1.794919, 0.7410818, 0, 1, 0.8666667, 1,
-0.01081265, 1.722538, 0.8481953, 0, 1, 0.8745098, 1,
-0.009603911, 0.3170488, 0.2315918, 0, 1, 0.8784314, 1,
-0.008816088, -1.10259, -2.547705, 0, 1, 0.8862745, 1,
-0.008679976, -0.7498363, -3.671198, 0, 1, 0.8901961, 1,
-0.008585258, -0.4089117, -3.874182, 0, 1, 0.8980392, 1,
0.007352025, -0.1311523, 2.703146, 0, 1, 0.9058824, 1,
0.008220637, -0.7588541, 2.92007, 0, 1, 0.9098039, 1,
0.009189476, 1.589508, -2.950354, 0, 1, 0.9176471, 1,
0.01249485, -0.7707312, 3.436819, 0, 1, 0.9215686, 1,
0.0127485, -0.2803445, 3.540552, 0, 1, 0.9294118, 1,
0.01444182, -0.6965616, 1.853236, 0, 1, 0.9333333, 1,
0.01942537, 0.1190138, -0.4034533, 0, 1, 0.9411765, 1,
0.02006444, -1.02701, 2.029509, 0, 1, 0.945098, 1,
0.02198747, -0.09016441, 3.767473, 0, 1, 0.9529412, 1,
0.02271637, 0.05163989, -0.5591971, 0, 1, 0.9568627, 1,
0.0230743, 0.04537261, 0.2565525, 0, 1, 0.9647059, 1,
0.03097071, -0.7054261, 2.149486, 0, 1, 0.9686275, 1,
0.03707397, 0.6881058, -0.3754139, 0, 1, 0.9764706, 1,
0.03707521, -0.7269149, 2.007314, 0, 1, 0.9803922, 1,
0.0376571, -1.075305, 5.226379, 0, 1, 0.9882353, 1,
0.04251697, 0.4774635, -0.8100902, 0, 1, 0.9921569, 1,
0.04375017, 2.838251, 0.02791332, 0, 1, 1, 1,
0.04475519, 0.2379754, 2.331729, 0, 0.9921569, 1, 1,
0.04611614, 0.06034105, -0.324221, 0, 0.9882353, 1, 1,
0.04735488, -0.4151934, 1.945139, 0, 0.9803922, 1, 1,
0.04752392, -1.290805, 3.063693, 0, 0.9764706, 1, 1,
0.04959743, -0.815463, 1.448175, 0, 0.9686275, 1, 1,
0.05131074, 0.5190421, -1.005743, 0, 0.9647059, 1, 1,
0.05181414, 1.0749, 0.5715757, 0, 0.9568627, 1, 1,
0.05549943, -0.684254, 5.775313, 0, 0.9529412, 1, 1,
0.05844846, 0.7170697, -1.108827, 0, 0.945098, 1, 1,
0.06177332, 0.7918461, -0.9756283, 0, 0.9411765, 1, 1,
0.06286313, 0.5411597, -1.781763, 0, 0.9333333, 1, 1,
0.06345385, 0.1268865, 0.0221923, 0, 0.9294118, 1, 1,
0.06590013, -0.2425812, 2.424441, 0, 0.9215686, 1, 1,
0.06765111, -1.074157, 4.788957, 0, 0.9176471, 1, 1,
0.06795081, 1.363111, -0.5445369, 0, 0.9098039, 1, 1,
0.06898668, 1.552675, 0.07865617, 0, 0.9058824, 1, 1,
0.07036484, 0.5143815, 0.09381296, 0, 0.8980392, 1, 1,
0.0707785, 0.4540916, 0.3497068, 0, 0.8901961, 1, 1,
0.0710529, -1.641856, 0.6920717, 0, 0.8862745, 1, 1,
0.07106239, 0.1738495, 0.9330015, 0, 0.8784314, 1, 1,
0.07135331, 0.6310838, 0.63287, 0, 0.8745098, 1, 1,
0.07184705, -0.2567993, 2.34678, 0, 0.8666667, 1, 1,
0.07289546, -0.6460744, 3.186395, 0, 0.8627451, 1, 1,
0.07618795, 0.02916629, 0.1249497, 0, 0.854902, 1, 1,
0.07677875, 0.4804312, -0.7279831, 0, 0.8509804, 1, 1,
0.07992668, 0.5871805, -0.2876359, 0, 0.8431373, 1, 1,
0.08003403, -0.7851413, 3.156949, 0, 0.8392157, 1, 1,
0.08360989, 0.4761859, -0.5859921, 0, 0.8313726, 1, 1,
0.08740716, -0.9142128, 2.356493, 0, 0.827451, 1, 1,
0.08797687, 1.244173, -0.5095325, 0, 0.8196079, 1, 1,
0.08862519, -0.6037011, 2.913045, 0, 0.8156863, 1, 1,
0.08914995, -1.016753, 3.7356, 0, 0.8078431, 1, 1,
0.08990104, -0.2948571, 2.590435, 0, 0.8039216, 1, 1,
0.09516286, 0.04541725, 1.629959, 0, 0.7960784, 1, 1,
0.09589007, -1.587961, 4.9625, 0, 0.7882353, 1, 1,
0.1011519, -0.4656111, 2.4809, 0, 0.7843137, 1, 1,
0.1150326, 0.3454761, 1.570668, 0, 0.7764706, 1, 1,
0.1152403, 0.4303763, 0.199869, 0, 0.772549, 1, 1,
0.1193767, 0.1614153, 0.04368944, 0, 0.7647059, 1, 1,
0.1222236, -0.1163327, 2.68493, 0, 0.7607843, 1, 1,
0.1255877, -1.252293, 2.706552, 0, 0.7529412, 1, 1,
0.1263391, -0.109095, 2.94212, 0, 0.7490196, 1, 1,
0.1286249, 1.360368, -0.6564656, 0, 0.7411765, 1, 1,
0.132846, -0.6928701, 3.06217, 0, 0.7372549, 1, 1,
0.1371897, -1.118744, 3.315967, 0, 0.7294118, 1, 1,
0.1440188, 0.8485916, -0.5301124, 0, 0.7254902, 1, 1,
0.1488376, 0.3356531, 0.8262001, 0, 0.7176471, 1, 1,
0.1503147, -0.5132538, 3.536273, 0, 0.7137255, 1, 1,
0.1508285, 0.5437011, -1.042668, 0, 0.7058824, 1, 1,
0.153061, -0.00451835, 0.5132275, 0, 0.6980392, 1, 1,
0.155801, -1.71288, 2.442589, 0, 0.6941177, 1, 1,
0.1562882, 0.0178228, 0.4119227, 0, 0.6862745, 1, 1,
0.1587674, 0.4379293, 0.2657846, 0, 0.682353, 1, 1,
0.1591397, -0.7012936, 1.840586, 0, 0.6745098, 1, 1,
0.1683626, -1.829563, 4.998244, 0, 0.6705883, 1, 1,
0.169705, -0.7449657, 1.697252, 0, 0.6627451, 1, 1,
0.1702538, -0.4985787, 2.054443, 0, 0.6588235, 1, 1,
0.1704492, -0.9243757, 3.638767, 0, 0.6509804, 1, 1,
0.1736951, 0.1269474, 2.235893, 0, 0.6470588, 1, 1,
0.1771416, -0.6929203, 3.746239, 0, 0.6392157, 1, 1,
0.1775302, -0.1992579, 4.083177, 0, 0.6352941, 1, 1,
0.178045, 1.20907, -0.5452087, 0, 0.627451, 1, 1,
0.178749, -1.809088, 2.067682, 0, 0.6235294, 1, 1,
0.1822762, 0.7115184, -0.4289854, 0, 0.6156863, 1, 1,
0.184096, 0.3705502, -0.4537848, 0, 0.6117647, 1, 1,
0.1870292, 0.8544821, 2.308679, 0, 0.6039216, 1, 1,
0.190421, -0.2571002, 3.528535, 0, 0.5960785, 1, 1,
0.1904382, -0.3542248, 2.76912, 0, 0.5921569, 1, 1,
0.2052268, -0.336672, 1.524598, 0, 0.5843138, 1, 1,
0.2057617, 0.68977, 1.275715, 0, 0.5803922, 1, 1,
0.2060115, 2.089058, -1.891128, 0, 0.572549, 1, 1,
0.207256, -0.8655614, 3.873743, 0, 0.5686275, 1, 1,
0.2081669, -0.1629038, 2.23392, 0, 0.5607843, 1, 1,
0.2093564, 0.9868494, -0.8480201, 0, 0.5568628, 1, 1,
0.2120524, -1.681579, 2.363196, 0, 0.5490196, 1, 1,
0.2138241, 0.368214, 1.842622, 0, 0.5450981, 1, 1,
0.2143431, 0.9641234, 0.4940165, 0, 0.5372549, 1, 1,
0.2181287, 0.8865256, -0.1030267, 0, 0.5333334, 1, 1,
0.2186698, 0.5451481, -1.353349, 0, 0.5254902, 1, 1,
0.2222612, 1.628653, 0.5090677, 0, 0.5215687, 1, 1,
0.2248648, -0.2229231, 1.826651, 0, 0.5137255, 1, 1,
0.2268257, 0.3489385, -0.2709378, 0, 0.509804, 1, 1,
0.2283736, -1.59137, 4.274806, 0, 0.5019608, 1, 1,
0.2323231, 0.7908427, -0.1675928, 0, 0.4941176, 1, 1,
0.237146, -0.3090765, 1.946273, 0, 0.4901961, 1, 1,
0.2408273, 0.3433666, 0.3723132, 0, 0.4823529, 1, 1,
0.2416152, -0.6269754, 1.512903, 0, 0.4784314, 1, 1,
0.2433131, -0.3999963, 2.841712, 0, 0.4705882, 1, 1,
0.2437541, -0.4234048, 2.041678, 0, 0.4666667, 1, 1,
0.2458804, -0.3034785, 2.565937, 0, 0.4588235, 1, 1,
0.2483442, -2.096676, 4.604242, 0, 0.454902, 1, 1,
0.2497814, 1.920782, 0.4117081, 0, 0.4470588, 1, 1,
0.2499209, -0.5616564, 3.217482, 0, 0.4431373, 1, 1,
0.2509846, -0.6548942, 4.049545, 0, 0.4352941, 1, 1,
0.2514812, 1.649027, 0.338599, 0, 0.4313726, 1, 1,
0.2634844, -0.9025207, 2.981865, 0, 0.4235294, 1, 1,
0.2665266, 1.014056, 0.6614232, 0, 0.4196078, 1, 1,
0.2680764, 0.6611336, -0.7584836, 0, 0.4117647, 1, 1,
0.2696517, 0.9393254, 0.3800601, 0, 0.4078431, 1, 1,
0.2698313, 0.2131991, -0.007037709, 0, 0.4, 1, 1,
0.2700885, -0.2655785, 1.723541, 0, 0.3921569, 1, 1,
0.2708172, -1.005157, 3.496343, 0, 0.3882353, 1, 1,
0.2740202, 0.2661555, -0.1187608, 0, 0.3803922, 1, 1,
0.2960378, 0.9372063, 0.7195342, 0, 0.3764706, 1, 1,
0.2994317, -2.133051, 0.6820748, 0, 0.3686275, 1, 1,
0.3033877, -0.9702598, 1.444011, 0, 0.3647059, 1, 1,
0.3039743, 1.222204, -0.9993036, 0, 0.3568628, 1, 1,
0.3118069, -0.2268653, 3.486746, 0, 0.3529412, 1, 1,
0.3137935, -0.3683925, 3.569378, 0, 0.345098, 1, 1,
0.3152447, 0.02830523, 1.519327, 0, 0.3411765, 1, 1,
0.3164406, -0.7441401, 2.365031, 0, 0.3333333, 1, 1,
0.3182728, -0.09271185, 0.752372, 0, 0.3294118, 1, 1,
0.3198767, 0.3545675, 1.364672, 0, 0.3215686, 1, 1,
0.3236686, -1.143728, 2.393247, 0, 0.3176471, 1, 1,
0.3265741, -1.349263, 3.270471, 0, 0.3098039, 1, 1,
0.3463808, -0.4699618, 3.048613, 0, 0.3058824, 1, 1,
0.349756, -0.8632351, 4.2341, 0, 0.2980392, 1, 1,
0.3514591, 0.6807315, 0.7522982, 0, 0.2901961, 1, 1,
0.3550161, 0.03560018, -0.02949805, 0, 0.2862745, 1, 1,
0.3556725, 1.779705, 1.684927, 0, 0.2784314, 1, 1,
0.3565111, 0.9464898, 0.04100457, 0, 0.2745098, 1, 1,
0.3573225, -2.278377, 3.42703, 0, 0.2666667, 1, 1,
0.36271, 0.3230399, 1.17195, 0, 0.2627451, 1, 1,
0.3637309, 0.5913165, -0.2247611, 0, 0.254902, 1, 1,
0.3690309, -1.248717, 2.125369, 0, 0.2509804, 1, 1,
0.3695685, -1.159005, 3.153122, 0, 0.2431373, 1, 1,
0.3701928, 0.8273641, 0.8166609, 0, 0.2392157, 1, 1,
0.3743725, -0.02572807, 1.205112, 0, 0.2313726, 1, 1,
0.3753528, 0.6771665, 0.9493608, 0, 0.227451, 1, 1,
0.3762257, 0.7716848, -0.06727199, 0, 0.2196078, 1, 1,
0.379173, -1.117592, 2.204848, 0, 0.2156863, 1, 1,
0.3839624, 1.146652, 0.03964752, 0, 0.2078431, 1, 1,
0.3871372, 0.6485946, 0.4136467, 0, 0.2039216, 1, 1,
0.3878014, -2.072014, 1.647505, 0, 0.1960784, 1, 1,
0.3881836, 0.7544181, 0.3317878, 0, 0.1882353, 1, 1,
0.3910534, 0.5689709, 0.266916, 0, 0.1843137, 1, 1,
0.3924575, -0.2944716, 3.646103, 0, 0.1764706, 1, 1,
0.3937078, -0.1848787, 3.032886, 0, 0.172549, 1, 1,
0.3958652, -0.1032049, 2.510831, 0, 0.1647059, 1, 1,
0.3966702, 0.5570797, 0.3943109, 0, 0.1607843, 1, 1,
0.4068339, -1.406313, 1.954686, 0, 0.1529412, 1, 1,
0.4073532, -0.4735479, 3.857005, 0, 0.1490196, 1, 1,
0.4081821, 0.4955626, 0.2482351, 0, 0.1411765, 1, 1,
0.4149385, 1.224663, -0.1124943, 0, 0.1372549, 1, 1,
0.4173186, 0.3063186, 2.188391, 0, 0.1294118, 1, 1,
0.4205109, 0.3301816, 2.405061, 0, 0.1254902, 1, 1,
0.4217883, -1.127284, 4.185431, 0, 0.1176471, 1, 1,
0.4218162, 1.338648, 1.422265, 0, 0.1137255, 1, 1,
0.4251925, -1.171237, 3.367568, 0, 0.1058824, 1, 1,
0.4267352, 0.1958123, 0.9209158, 0, 0.09803922, 1, 1,
0.4334954, -1.125892, 1.686208, 0, 0.09411765, 1, 1,
0.4393703, 0.5050198, 1.15655, 0, 0.08627451, 1, 1,
0.4399631, 1.157847, -0.9285227, 0, 0.08235294, 1, 1,
0.4417143, -0.4011772, 2.805071, 0, 0.07450981, 1, 1,
0.4435258, -0.9084089, 4.209507, 0, 0.07058824, 1, 1,
0.4438795, 1.427044, 0.1285543, 0, 0.0627451, 1, 1,
0.4442823, -0.3104378, 1.721403, 0, 0.05882353, 1, 1,
0.4465532, 2.527329, -0.566744, 0, 0.05098039, 1, 1,
0.4501728, -0.4249249, 2.593666, 0, 0.04705882, 1, 1,
0.450296, -1.006084, 2.135589, 0, 0.03921569, 1, 1,
0.4579986, -0.9415214, 4.026166, 0, 0.03529412, 1, 1,
0.4586972, 0.9038706, 1.011469, 0, 0.02745098, 1, 1,
0.4597757, 2.042843, 2.219991, 0, 0.02352941, 1, 1,
0.4618069, -0.9497522, 4.206891, 0, 0.01568628, 1, 1,
0.4665773, 0.6530201, 1.417943, 0, 0.01176471, 1, 1,
0.4667917, -0.2750815, 2.489183, 0, 0.003921569, 1, 1,
0.4669892, -0.1400998, 2.290493, 0.003921569, 0, 1, 1,
0.4677355, 0.9647987, 0.5931323, 0.007843138, 0, 1, 1,
0.4733067, -0.1832992, 2.777089, 0.01568628, 0, 1, 1,
0.4767434, -0.03185197, 3.535045, 0.01960784, 0, 1, 1,
0.4785059, 0.06744572, 1.472098, 0.02745098, 0, 1, 1,
0.4830729, -1.006527, 4.168204, 0.03137255, 0, 1, 1,
0.484114, -0.7302541, 2.806931, 0.03921569, 0, 1, 1,
0.4856325, 0.2616801, 0.441727, 0.04313726, 0, 1, 1,
0.4892791, 1.099954, -0.9434192, 0.05098039, 0, 1, 1,
0.4926288, 0.7810197, 0.8471825, 0.05490196, 0, 1, 1,
0.4960684, 1.267429, -0.7903655, 0.0627451, 0, 1, 1,
0.5022508, 1.074667, 0.3418666, 0.06666667, 0, 1, 1,
0.5023246, -1.264595, 2.849918, 0.07450981, 0, 1, 1,
0.5035955, 1.007735, 1.790452, 0.07843138, 0, 1, 1,
0.5069973, -1.93808, 1.647489, 0.08627451, 0, 1, 1,
0.5107882, -0.158871, 1.64385, 0.09019608, 0, 1, 1,
0.5126075, 1.185156, 0.1686, 0.09803922, 0, 1, 1,
0.5137281, 1.344369, -0.422579, 0.1058824, 0, 1, 1,
0.5217377, -1.657683, 3.407951, 0.1098039, 0, 1, 1,
0.5219991, -0.4476454, 3.515341, 0.1176471, 0, 1, 1,
0.5281283, 1.130937, 1.20236, 0.1215686, 0, 1, 1,
0.5307908, 1.645864, 1.33192, 0.1294118, 0, 1, 1,
0.5334847, 0.7288408, -0.2433581, 0.1333333, 0, 1, 1,
0.53399, -2.123089, 2.679823, 0.1411765, 0, 1, 1,
0.5340033, -1.265343, 1.790529, 0.145098, 0, 1, 1,
0.5388525, -0.1331594, -0.03522196, 0.1529412, 0, 1, 1,
0.5415636, 0.3049286, 1.632514, 0.1568628, 0, 1, 1,
0.5431721, -0.8843828, 2.235129, 0.1647059, 0, 1, 1,
0.5480004, -0.4111229, 2.465703, 0.1686275, 0, 1, 1,
0.5485293, 0.6948101, 1.695367, 0.1764706, 0, 1, 1,
0.5489357, -0.2122461, 3.222898, 0.1803922, 0, 1, 1,
0.5502536, 0.5655491, -0.1396046, 0.1882353, 0, 1, 1,
0.5528748, -2.263943, 2.894567, 0.1921569, 0, 1, 1,
0.5576996, -0.9174805, 1.880888, 0.2, 0, 1, 1,
0.5579389, -1.293285, 1.868012, 0.2078431, 0, 1, 1,
0.5581682, -0.9563419, 2.172309, 0.2117647, 0, 1, 1,
0.5625541, -1.579883, 2.011563, 0.2196078, 0, 1, 1,
0.5683411, 0.434786, 1.76379, 0.2235294, 0, 1, 1,
0.5712209, -0.1213834, 2.280534, 0.2313726, 0, 1, 1,
0.5772859, -0.04713894, 2.209482, 0.2352941, 0, 1, 1,
0.579722, -0.1294075, 3.971765, 0.2431373, 0, 1, 1,
0.5818588, 1.152837, 0.3597828, 0.2470588, 0, 1, 1,
0.5838361, 0.1546951, 2.814315, 0.254902, 0, 1, 1,
0.5875617, 0.514015, 1.154191, 0.2588235, 0, 1, 1,
0.5890585, 0.9193087, -1.619177, 0.2666667, 0, 1, 1,
0.5898068, 0.6805356, 0.3994456, 0.2705882, 0, 1, 1,
0.5941046, 1.200901, 0.2276073, 0.2784314, 0, 1, 1,
0.5942857, 1.031779, 0.6914755, 0.282353, 0, 1, 1,
0.6048809, -0.3804863, 2.135895, 0.2901961, 0, 1, 1,
0.6159244, -1.252656, 1.889899, 0.2941177, 0, 1, 1,
0.6193642, 0.7400658, 0.5107002, 0.3019608, 0, 1, 1,
0.6210417, 0.2840921, 0.9899198, 0.3098039, 0, 1, 1,
0.6263915, 1.326628, -0.01666063, 0.3137255, 0, 1, 1,
0.6302642, -0.3386669, 2.770511, 0.3215686, 0, 1, 1,
0.6427845, -0.7398422, 1.533876, 0.3254902, 0, 1, 1,
0.6557802, -1.329878, 3.049361, 0.3333333, 0, 1, 1,
0.6567216, -0.1058907, 1.725389, 0.3372549, 0, 1, 1,
0.6615354, -0.1090809, 2.152695, 0.345098, 0, 1, 1,
0.6628595, -1.01583, 3.030207, 0.3490196, 0, 1, 1,
0.6636807, -1.975352, 3.366961, 0.3568628, 0, 1, 1,
0.6712798, -0.1700177, 2.157776, 0.3607843, 0, 1, 1,
0.6862186, -1.108142, 3.339243, 0.3686275, 0, 1, 1,
0.6898116, -1.256463, 2.381452, 0.372549, 0, 1, 1,
0.6904221, 0.4668234, 3.030882, 0.3803922, 0, 1, 1,
0.6953665, 0.5057086, 1.577891, 0.3843137, 0, 1, 1,
0.6976008, -1.528831, 5.414175, 0.3921569, 0, 1, 1,
0.70468, -0.5810013, 1.816491, 0.3960784, 0, 1, 1,
0.7075024, -0.7516888, 3.796871, 0.4039216, 0, 1, 1,
0.7166573, -1.291651, 3.706605, 0.4117647, 0, 1, 1,
0.7177939, 0.4868313, 1.872762, 0.4156863, 0, 1, 1,
0.718163, 0.2819631, -0.06095265, 0.4235294, 0, 1, 1,
0.7214579, 1.003674, 0.1864115, 0.427451, 0, 1, 1,
0.7309408, -1.119325, 3.905016, 0.4352941, 0, 1, 1,
0.7326667, -1.181508, 2.349442, 0.4392157, 0, 1, 1,
0.7330275, 0.3068911, 2.058728, 0.4470588, 0, 1, 1,
0.7384016, -0.3259421, 2.783035, 0.4509804, 0, 1, 1,
0.7397416, 1.615228, 0.304984, 0.4588235, 0, 1, 1,
0.7438665, 1.029035, 0.3632148, 0.4627451, 0, 1, 1,
0.7469507, -1.07156, 0.6677333, 0.4705882, 0, 1, 1,
0.7546434, -0.8217399, 1.41145, 0.4745098, 0, 1, 1,
0.7571896, -0.04301494, 1.395315, 0.4823529, 0, 1, 1,
0.7587912, 0.4081164, 1.063575, 0.4862745, 0, 1, 1,
0.7592538, -0.3216234, 1.898005, 0.4941176, 0, 1, 1,
0.7598005, 0.2536232, 1.409158, 0.5019608, 0, 1, 1,
0.7630669, -0.200318, 2.754927, 0.5058824, 0, 1, 1,
0.7679477, 0.4884993, -0.06926883, 0.5137255, 0, 1, 1,
0.7729918, 0.5066702, 0.4853493, 0.5176471, 0, 1, 1,
0.7730834, -0.2552638, 3.317887, 0.5254902, 0, 1, 1,
0.784909, -0.03140986, 1.81721, 0.5294118, 0, 1, 1,
0.7906917, 0.154446, -1.386432, 0.5372549, 0, 1, 1,
0.7909312, -0.6867324, 1.87324, 0.5411765, 0, 1, 1,
0.7920582, -0.932726, 3.027504, 0.5490196, 0, 1, 1,
0.7921845, 2.159118, -0.2257128, 0.5529412, 0, 1, 1,
0.800324, -0.07782624, 1.621795, 0.5607843, 0, 1, 1,
0.8051091, -0.3613029, 1.938758, 0.5647059, 0, 1, 1,
0.8063017, 1.453385, 0.6961842, 0.572549, 0, 1, 1,
0.8073391, -0.9585617, 3.433293, 0.5764706, 0, 1, 1,
0.8082767, -0.3401292, 1.045056, 0.5843138, 0, 1, 1,
0.8111655, 0.3640001, 2.329761, 0.5882353, 0, 1, 1,
0.8115413, 0.08290245, 2.017391, 0.5960785, 0, 1, 1,
0.8125462, 0.2418077, 1.109984, 0.6039216, 0, 1, 1,
0.8150266, 0.8847302, 0.2950796, 0.6078432, 0, 1, 1,
0.8176236, -0.5368577, 3.839839, 0.6156863, 0, 1, 1,
0.8211027, 1.327529, 0.3404192, 0.6196079, 0, 1, 1,
0.8236052, 0.1082091, 2.627946, 0.627451, 0, 1, 1,
0.8282394, 0.1714566, 1.133982, 0.6313726, 0, 1, 1,
0.8318476, -0.6892114, 3.412422, 0.6392157, 0, 1, 1,
0.8322789, -0.001499673, 1.152913, 0.6431373, 0, 1, 1,
0.8367511, -0.9630926, 2.513214, 0.6509804, 0, 1, 1,
0.8399404, -0.8645365, 3.351509, 0.654902, 0, 1, 1,
0.8441617, -2.176208, 5.418408, 0.6627451, 0, 1, 1,
0.8465631, -0.2405566, 2.473896, 0.6666667, 0, 1, 1,
0.8470051, 0.94115, 3.361097, 0.6745098, 0, 1, 1,
0.8483555, -0.3786057, 0.6721274, 0.6784314, 0, 1, 1,
0.8486829, 0.46033, 1.260625, 0.6862745, 0, 1, 1,
0.8508578, 0.1659107, 0.3086555, 0.6901961, 0, 1, 1,
0.8509923, -0.4148251, 1.141803, 0.6980392, 0, 1, 1,
0.8535627, 1.423205, 1.935565, 0.7058824, 0, 1, 1,
0.8544905, -0.7785105, 1.830406, 0.7098039, 0, 1, 1,
0.8546791, -0.8812369, 3.676047, 0.7176471, 0, 1, 1,
0.8573124, -0.4842372, 1.050254, 0.7215686, 0, 1, 1,
0.8587942, 1.44619, 1.262741, 0.7294118, 0, 1, 1,
0.8602589, 1.041758, -0.266437, 0.7333333, 0, 1, 1,
0.8606191, -1.092756, 3.7118, 0.7411765, 0, 1, 1,
0.864168, 1.320368, -0.5744044, 0.7450981, 0, 1, 1,
0.8650644, -1.823348, 2.522018, 0.7529412, 0, 1, 1,
0.8706239, -1.010298, 1.180858, 0.7568628, 0, 1, 1,
0.8802082, -1.01703, 3.308753, 0.7647059, 0, 1, 1,
0.8889053, -1.623269, 3.000175, 0.7686275, 0, 1, 1,
0.893241, -0.5691786, 3.337366, 0.7764706, 0, 1, 1,
0.8935708, -1.003981, 1.77079, 0.7803922, 0, 1, 1,
0.9003806, 1.201117, -0.4146443, 0.7882353, 0, 1, 1,
0.9038095, 0.1260777, 0.5967991, 0.7921569, 0, 1, 1,
0.9107158, -1.04895, 2.246618, 0.8, 0, 1, 1,
0.9124755, -0.8632601, 1.295873, 0.8078431, 0, 1, 1,
0.9152876, 0.8437604, 2.395164, 0.8117647, 0, 1, 1,
0.9171572, 0.6421968, -0.1576487, 0.8196079, 0, 1, 1,
0.923184, 0.9418141, 0.8122622, 0.8235294, 0, 1, 1,
0.9246747, -0.3056758, 2.090001, 0.8313726, 0, 1, 1,
0.9271572, 1.435715, -0.1010974, 0.8352941, 0, 1, 1,
0.9281939, 0.4520274, -0.20521, 0.8431373, 0, 1, 1,
0.9303616, 0.3481314, 2.425924, 0.8470588, 0, 1, 1,
0.9308408, -0.9066759, 4.972729, 0.854902, 0, 1, 1,
0.9493705, -0.7077706, 2.292511, 0.8588235, 0, 1, 1,
0.9498926, -0.4707143, -1.675274, 0.8666667, 0, 1, 1,
0.9512002, -1.609583, 0.4119747, 0.8705882, 0, 1, 1,
0.9512185, -1.996705, 2.337173, 0.8784314, 0, 1, 1,
0.952253, 0.2441993, 1.211726, 0.8823529, 0, 1, 1,
0.9531854, 1.629246, -0.5573269, 0.8901961, 0, 1, 1,
0.9541664, -1.900648, 2.635389, 0.8941177, 0, 1, 1,
0.9549497, -0.2169572, -0.2809953, 0.9019608, 0, 1, 1,
0.9588498, 0.4962465, 0.3144589, 0.9098039, 0, 1, 1,
0.9593648, -0.6600174, 1.902338, 0.9137255, 0, 1, 1,
0.9604588, 1.138829, 0.4980403, 0.9215686, 0, 1, 1,
0.9626833, -0.2611132, 2.301976, 0.9254902, 0, 1, 1,
0.9646571, -2.590098, 3.549893, 0.9333333, 0, 1, 1,
0.9668772, 1.605562, 0.1289705, 0.9372549, 0, 1, 1,
0.9670239, -0.1049035, 1.94984, 0.945098, 0, 1, 1,
0.9869508, 0.1376039, 1.505519, 0.9490196, 0, 1, 1,
0.9917398, 0.2244138, 1.523849, 0.9568627, 0, 1, 1,
0.9989875, -0.5591888, 0.5393692, 0.9607843, 0, 1, 1,
1.009862, -0.5146716, 1.379084, 0.9686275, 0, 1, 1,
1.015165, 0.351851, 1.557569, 0.972549, 0, 1, 1,
1.019409, -0.460215, 2.104951, 0.9803922, 0, 1, 1,
1.022248, 0.524693, 0.5413783, 0.9843137, 0, 1, 1,
1.022432, 0.8191034, 0.2555116, 0.9921569, 0, 1, 1,
1.025167, 0.1973063, 1.165421, 0.9960784, 0, 1, 1,
1.025383, -1.192895, 3.187549, 1, 0, 0.9960784, 1,
1.036031, 1.620819, -0.1938827, 1, 0, 0.9882353, 1,
1.041711, -0.8877836, 2.052595, 1, 0, 0.9843137, 1,
1.052311, 0.3056112, 1.269338, 1, 0, 0.9764706, 1,
1.054504, -0.7699186, 3.387637, 1, 0, 0.972549, 1,
1.057636, -0.8795141, 1.73307, 1, 0, 0.9647059, 1,
1.061763, -0.9550043, 2.350623, 1, 0, 0.9607843, 1,
1.064527, 0.07836245, 2.292259, 1, 0, 0.9529412, 1,
1.066938, -0.7504497, 1.467646, 1, 0, 0.9490196, 1,
1.081677, 0.01697507, 1.127604, 1, 0, 0.9411765, 1,
1.08939, -0.02144094, 3.045361, 1, 0, 0.9372549, 1,
1.089939, -1.031463, 4.184113, 1, 0, 0.9294118, 1,
1.096233, -0.1876823, 1.981954, 1, 0, 0.9254902, 1,
1.097244, 0.5941738, 1.610824, 1, 0, 0.9176471, 1,
1.098063, -0.5749877, 2.78691, 1, 0, 0.9137255, 1,
1.099575, -0.4401376, 1.664569, 1, 0, 0.9058824, 1,
1.107301, -2.287504, 2.515119, 1, 0, 0.9019608, 1,
1.110811, 0.8398163, 0.5764567, 1, 0, 0.8941177, 1,
1.11245, 1.337587, 0.996424, 1, 0, 0.8862745, 1,
1.113173, -0.791425, 1.597608, 1, 0, 0.8823529, 1,
1.11435, -0.6760879, 2.694925, 1, 0, 0.8745098, 1,
1.117733, -0.3470274, 2.746163, 1, 0, 0.8705882, 1,
1.119217, -0.7526846, 0.1200125, 1, 0, 0.8627451, 1,
1.121193, -0.9244038, 2.533355, 1, 0, 0.8588235, 1,
1.126853, -0.8849127, 2.87751, 1, 0, 0.8509804, 1,
1.131227, 0.7893324, 0.988831, 1, 0, 0.8470588, 1,
1.136336, -1.134132, 2.275652, 1, 0, 0.8392157, 1,
1.137241, 0.1017897, 1.488164, 1, 0, 0.8352941, 1,
1.139336, 1.260356, 0.8007017, 1, 0, 0.827451, 1,
1.14816, 1.250824, 0.4114964, 1, 0, 0.8235294, 1,
1.151416, -2.275993, 3.218582, 1, 0, 0.8156863, 1,
1.152768, -1.782969, 3.18017, 1, 0, 0.8117647, 1,
1.163472, -0.3340943, 2.91632, 1, 0, 0.8039216, 1,
1.170667, 1.023711, 1.268706, 1, 0, 0.7960784, 1,
1.174042, -0.1283749, 2.209579, 1, 0, 0.7921569, 1,
1.174184, 0.4707525, 2.96211, 1, 0, 0.7843137, 1,
1.174541, -0.8426791, 3.009881, 1, 0, 0.7803922, 1,
1.17458, 1.982664, -0.5881217, 1, 0, 0.772549, 1,
1.174891, 1.392148, 0.549503, 1, 0, 0.7686275, 1,
1.190895, -0.5280293, 2.023702, 1, 0, 0.7607843, 1,
1.192524, 0.9817961, 0.8282709, 1, 0, 0.7568628, 1,
1.194222, -1.842969, 2.487045, 1, 0, 0.7490196, 1,
1.204723, -1.47131, 0.2884178, 1, 0, 0.7450981, 1,
1.211257, -0.669472, 3.56425, 1, 0, 0.7372549, 1,
1.215058, -0.3117014, 0.7974474, 1, 0, 0.7333333, 1,
1.216843, -0.2807155, 0.6963357, 1, 0, 0.7254902, 1,
1.225918, -0.2851624, 1.67424, 1, 0, 0.7215686, 1,
1.231475, -1.411699, 2.444038, 1, 0, 0.7137255, 1,
1.232862, 0.5893286, -0.8810654, 1, 0, 0.7098039, 1,
1.243828, -0.5248347, 0.7452826, 1, 0, 0.7019608, 1,
1.245985, -0.9831489, 2.201315, 1, 0, 0.6941177, 1,
1.24712, 0.01381456, 2.159993, 1, 0, 0.6901961, 1,
1.250514, -0.3379005, 1.733695, 1, 0, 0.682353, 1,
1.253873, 1.598639, -0.5781558, 1, 0, 0.6784314, 1,
1.256628, 2.561284, -0.7899252, 1, 0, 0.6705883, 1,
1.261367, 0.2569233, 2.681049, 1, 0, 0.6666667, 1,
1.262488, -0.5190214, 0.9640734, 1, 0, 0.6588235, 1,
1.26313, -0.5013974, 0.1033114, 1, 0, 0.654902, 1,
1.263856, -0.117771, 3.520282, 1, 0, 0.6470588, 1,
1.264482, -0.01063621, 2.784765, 1, 0, 0.6431373, 1,
1.272514, 1.354494, 1.404384, 1, 0, 0.6352941, 1,
1.275157, -0.0868078, 1.690586, 1, 0, 0.6313726, 1,
1.285304, -0.8961403, 3.070853, 1, 0, 0.6235294, 1,
1.286171, 1.464109, -0.5866742, 1, 0, 0.6196079, 1,
1.28894, 1.325421, 1.234729, 1, 0, 0.6117647, 1,
1.305899, 1.236782, 1.336653, 1, 0, 0.6078432, 1,
1.311102, 0.5467758, 1.053432, 1, 0, 0.6, 1,
1.320118, 0.7753657, -0.8550636, 1, 0, 0.5921569, 1,
1.331086, 0.2617932, 1.959913, 1, 0, 0.5882353, 1,
1.333957, -0.8017744, 0.4352691, 1, 0, 0.5803922, 1,
1.342289, -1.218097, 2.445008, 1, 0, 0.5764706, 1,
1.345308, 0.6486923, 2.065518, 1, 0, 0.5686275, 1,
1.356136, 0.7128361, 1.628132, 1, 0, 0.5647059, 1,
1.362005, 2.120738, -0.0337472, 1, 0, 0.5568628, 1,
1.363173, -0.2672545, 0.8102206, 1, 0, 0.5529412, 1,
1.364887, 0.8324589, 2.682181, 1, 0, 0.5450981, 1,
1.369886, -0.7244405, 2.434635, 1, 0, 0.5411765, 1,
1.378939, 0.123925, 1.910413, 1, 0, 0.5333334, 1,
1.406106, 0.09420641, 2.464324, 1, 0, 0.5294118, 1,
1.408612, -0.1268732, 0.6297357, 1, 0, 0.5215687, 1,
1.414378, -0.914433, 2.878716, 1, 0, 0.5176471, 1,
1.414487, -0.3574499, 2.77746, 1, 0, 0.509804, 1,
1.426348, -0.1351531, 2.788602, 1, 0, 0.5058824, 1,
1.433684, -1.786148, 2.590405, 1, 0, 0.4980392, 1,
1.446969, -1.321973, 3.600469, 1, 0, 0.4901961, 1,
1.451929, -0.588242, 2.344903, 1, 0, 0.4862745, 1,
1.461833, 2.130874, 3.212536, 1, 0, 0.4784314, 1,
1.465693, -0.8550208, 1.729163, 1, 0, 0.4745098, 1,
1.474006, -0.6014888, 3.050376, 1, 0, 0.4666667, 1,
1.488643, -0.9794728, 2.730193, 1, 0, 0.4627451, 1,
1.491899, 2.158534, -1.155755, 1, 0, 0.454902, 1,
1.493241, -0.8128721, 1.340313, 1, 0, 0.4509804, 1,
1.508999, -0.2487049, 3.090276, 1, 0, 0.4431373, 1,
1.511807, 0.5335828, 0.670823, 1, 0, 0.4392157, 1,
1.516254, -0.1498152, 0.3326755, 1, 0, 0.4313726, 1,
1.536136, -0.7581307, 1.788667, 1, 0, 0.427451, 1,
1.537206, -0.7520419, 0.6105569, 1, 0, 0.4196078, 1,
1.541975, -0.7159038, 2.54668, 1, 0, 0.4156863, 1,
1.547365, 0.8608004, 2.686371, 1, 0, 0.4078431, 1,
1.548877, -1.386578, 1.896721, 1, 0, 0.4039216, 1,
1.559599, -0.8364919, 2.079396, 1, 0, 0.3960784, 1,
1.568831, -1.762471, 3.761866, 1, 0, 0.3882353, 1,
1.571639, -0.2908976, 0.9615374, 1, 0, 0.3843137, 1,
1.572826, -1.649796, 2.129018, 1, 0, 0.3764706, 1,
1.575645, 0.01133516, 2.605453, 1, 0, 0.372549, 1,
1.586002, -0.2872955, 0.2429121, 1, 0, 0.3647059, 1,
1.589363, -0.4708844, 1.826465, 1, 0, 0.3607843, 1,
1.593167, -2.434837, 3.429779, 1, 0, 0.3529412, 1,
1.595745, -0.5699183, 0.9247727, 1, 0, 0.3490196, 1,
1.602491, 0.5958013, -0.10646, 1, 0, 0.3411765, 1,
1.613861, 1.097579, -0.5822894, 1, 0, 0.3372549, 1,
1.623015, 0.07625028, 1.784889, 1, 0, 0.3294118, 1,
1.626119, 0.9813378, 1.523476, 1, 0, 0.3254902, 1,
1.628938, 0.4122431, 1.39958, 1, 0, 0.3176471, 1,
1.643936, 1.294284, 0.6691554, 1, 0, 0.3137255, 1,
1.655444, 0.2323848, 0.9292972, 1, 0, 0.3058824, 1,
1.678537, 0.4019744, 1.336988, 1, 0, 0.2980392, 1,
1.680237, -0.04438152, 1.336917, 1, 0, 0.2941177, 1,
1.705793, 0.4560348, 3.679333, 1, 0, 0.2862745, 1,
1.729899, 0.4892121, 0.6677743, 1, 0, 0.282353, 1,
1.740299, 0.04693944, 1.091087, 1, 0, 0.2745098, 1,
1.751702, -0.2894812, 3.180073, 1, 0, 0.2705882, 1,
1.776181, -1.895522, 0.8240309, 1, 0, 0.2627451, 1,
1.781809, -0.4505902, 2.439853, 1, 0, 0.2588235, 1,
1.783445, 0.5536955, 0.4328374, 1, 0, 0.2509804, 1,
1.785965, -0.2731697, 1.302805, 1, 0, 0.2470588, 1,
1.793034, -0.5680744, 1.024455, 1, 0, 0.2392157, 1,
1.817488, 2.174148, 0.7204156, 1, 0, 0.2352941, 1,
1.820755, -0.967399, 2.931071, 1, 0, 0.227451, 1,
1.846863, -1.883981, 0.9142495, 1, 0, 0.2235294, 1,
1.848057, -1.482093, 1.35523, 1, 0, 0.2156863, 1,
1.848673, 0.4020682, 2.166177, 1, 0, 0.2117647, 1,
1.849121, 0.7165187, 1.333705, 1, 0, 0.2039216, 1,
1.862926, 0.8636249, 0.6136138, 1, 0, 0.1960784, 1,
1.892112, -0.543229, 2.412858, 1, 0, 0.1921569, 1,
1.896953, -0.8249066, 1.622094, 1, 0, 0.1843137, 1,
1.905333, -0.4625716, 1.442325, 1, 0, 0.1803922, 1,
1.942054, 0.775213, 0.8123847, 1, 0, 0.172549, 1,
1.947605, -0.9388804, 2.867286, 1, 0, 0.1686275, 1,
1.958524, -1.05362, 2.200156, 1, 0, 0.1607843, 1,
1.968501, -0.4800952, 1.496864, 1, 0, 0.1568628, 1,
1.9706, 0.5223029, 1.489224, 1, 0, 0.1490196, 1,
1.989806, -0.4184416, 0.5597829, 1, 0, 0.145098, 1,
2.017717, -0.8095908, 3.707833, 1, 0, 0.1372549, 1,
2.032145, -1.411229, 2.234402, 1, 0, 0.1333333, 1,
2.045733, 0.1896516, 2.777532, 1, 0, 0.1254902, 1,
2.105101, -0.09415781, -0.9467852, 1, 0, 0.1215686, 1,
2.116325, -0.04793583, 0.9911677, 1, 0, 0.1137255, 1,
2.129473, -1.173874, 1.214511, 1, 0, 0.1098039, 1,
2.131955, 1.163488, 2.25005, 1, 0, 0.1019608, 1,
2.144621, -0.01384627, 0.4914487, 1, 0, 0.09411765, 1,
2.152431, 0.3796335, 3.640247, 1, 0, 0.09019608, 1,
2.167757, 0.1634219, 4.198431, 1, 0, 0.08235294, 1,
2.195599, 1.576543, 0.3769166, 1, 0, 0.07843138, 1,
2.276937, -1.034865, 4.347663, 1, 0, 0.07058824, 1,
2.288005, 0.728495, 0.5402593, 1, 0, 0.06666667, 1,
2.442492, 1.163008, 1.980815, 1, 0, 0.05882353, 1,
2.460935, -0.2062215, 1.930545, 1, 0, 0.05490196, 1,
2.472903, 0.06736891, 1.124994, 1, 0, 0.04705882, 1,
2.487192, -1.340763, 2.49092, 1, 0, 0.04313726, 1,
2.490987, 0.5486915, 2.022178, 1, 0, 0.03529412, 1,
2.542849, -2.376887, 2.418503, 1, 0, 0.03137255, 1,
2.586754, -1.205021, 1.569811, 1, 0, 0.02352941, 1,
2.746413, 0.2479792, 0.3322948, 1, 0, 0.01960784, 1,
3.310882, 0.6249847, 0.485281, 1, 0, 0.01176471, 1,
3.799543, 1.508347, 2.258244, 1, 0, 0.007843138, 1
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
0.3304056, -3.774218, -7.766163, 0, -0.5, 0.5, 0.5,
0.3304056, -3.774218, -7.766163, 1, -0.5, 0.5, 0.5,
0.3304056, -3.774218, -7.766163, 1, 1.5, 0.5, 0.5,
0.3304056, -3.774218, -7.766163, 0, 1.5, 0.5, 0.5
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
-4.31477, 0.01120174, -7.766163, 0, -0.5, 0.5, 0.5,
-4.31477, 0.01120174, -7.766163, 1, -0.5, 0.5, 0.5,
-4.31477, 0.01120174, -7.766163, 1, 1.5, 0.5, 0.5,
-4.31477, 0.01120174, -7.766163, 0, 1.5, 0.5, 0.5
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
-4.31477, -3.774218, -0.01411653, 0, -0.5, 0.5, 0.5,
-4.31477, -3.774218, -0.01411653, 1, -0.5, 0.5, 0.5,
-4.31477, -3.774218, -0.01411653, 1, 1.5, 0.5, 0.5,
-4.31477, -3.774218, -0.01411653, 0, 1.5, 0.5, 0.5
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
-3, -2.900659, -5.977229,
3, -2.900659, -5.977229,
-3, -2.900659, -5.977229,
-3, -3.046252, -6.275385,
-2, -2.900659, -5.977229,
-2, -3.046252, -6.275385,
-1, -2.900659, -5.977229,
-1, -3.046252, -6.275385,
0, -2.900659, -5.977229,
0, -3.046252, -6.275385,
1, -2.900659, -5.977229,
1, -3.046252, -6.275385,
2, -2.900659, -5.977229,
2, -3.046252, -6.275385,
3, -2.900659, -5.977229,
3, -3.046252, -6.275385
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
-3, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
-3, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
-3, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
-3, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
-2, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
-2, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
-2, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
-2, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
-1, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
-1, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
-1, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
-1, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
0, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
0, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
0, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
0, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
1, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
1, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
1, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
1, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
2, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
2, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
2, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
2, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5,
3, -3.337439, -6.871696, 0, -0.5, 0.5, 0.5,
3, -3.337439, -6.871696, 1, -0.5, 0.5, 0.5,
3, -3.337439, -6.871696, 1, 1.5, 0.5, 0.5,
3, -3.337439, -6.871696, 0, 1.5, 0.5, 0.5
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
-3.242806, -2, -5.977229,
-3.242806, 2, -5.977229,
-3.242806, -2, -5.977229,
-3.421467, -2, -6.275385,
-3.242806, -1, -5.977229,
-3.421467, -1, -6.275385,
-3.242806, 0, -5.977229,
-3.421467, 0, -6.275385,
-3.242806, 1, -5.977229,
-3.421467, 1, -6.275385,
-3.242806, 2, -5.977229,
-3.421467, 2, -6.275385
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
-3.778788, -2, -6.871696, 0, -0.5, 0.5, 0.5,
-3.778788, -2, -6.871696, 1, -0.5, 0.5, 0.5,
-3.778788, -2, -6.871696, 1, 1.5, 0.5, 0.5,
-3.778788, -2, -6.871696, 0, 1.5, 0.5, 0.5,
-3.778788, -1, -6.871696, 0, -0.5, 0.5, 0.5,
-3.778788, -1, -6.871696, 1, -0.5, 0.5, 0.5,
-3.778788, -1, -6.871696, 1, 1.5, 0.5, 0.5,
-3.778788, -1, -6.871696, 0, 1.5, 0.5, 0.5,
-3.778788, 0, -6.871696, 0, -0.5, 0.5, 0.5,
-3.778788, 0, -6.871696, 1, -0.5, 0.5, 0.5,
-3.778788, 0, -6.871696, 1, 1.5, 0.5, 0.5,
-3.778788, 0, -6.871696, 0, 1.5, 0.5, 0.5,
-3.778788, 1, -6.871696, 0, -0.5, 0.5, 0.5,
-3.778788, 1, -6.871696, 1, -0.5, 0.5, 0.5,
-3.778788, 1, -6.871696, 1, 1.5, 0.5, 0.5,
-3.778788, 1, -6.871696, 0, 1.5, 0.5, 0.5,
-3.778788, 2, -6.871696, 0, -0.5, 0.5, 0.5,
-3.778788, 2, -6.871696, 1, -0.5, 0.5, 0.5,
-3.778788, 2, -6.871696, 1, 1.5, 0.5, 0.5,
-3.778788, 2, -6.871696, 0, 1.5, 0.5, 0.5
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
-3.242806, -2.900659, -4,
-3.242806, -2.900659, 4,
-3.242806, -2.900659, -4,
-3.421467, -3.046252, -4,
-3.242806, -2.900659, -2,
-3.421467, -3.046252, -2,
-3.242806, -2.900659, 0,
-3.421467, -3.046252, 0,
-3.242806, -2.900659, 2,
-3.421467, -3.046252, 2,
-3.242806, -2.900659, 4,
-3.421467, -3.046252, 4
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
-3.778788, -3.337439, -4, 0, -0.5, 0.5, 0.5,
-3.778788, -3.337439, -4, 1, -0.5, 0.5, 0.5,
-3.778788, -3.337439, -4, 1, 1.5, 0.5, 0.5,
-3.778788, -3.337439, -4, 0, 1.5, 0.5, 0.5,
-3.778788, -3.337439, -2, 0, -0.5, 0.5, 0.5,
-3.778788, -3.337439, -2, 1, -0.5, 0.5, 0.5,
-3.778788, -3.337439, -2, 1, 1.5, 0.5, 0.5,
-3.778788, -3.337439, -2, 0, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 0, 0, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 0, 1, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 0, 1, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 0, 0, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 2, 0, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 2, 1, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 2, 1, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 2, 0, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 4, 0, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 4, 1, -0.5, 0.5, 0.5,
-3.778788, -3.337439, 4, 1, 1.5, 0.5, 0.5,
-3.778788, -3.337439, 4, 0, 1.5, 0.5, 0.5
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
-3.242806, -2.900659, -5.977229,
-3.242806, 2.923063, -5.977229,
-3.242806, -2.900659, 5.948996,
-3.242806, 2.923063, 5.948996,
-3.242806, -2.900659, -5.977229,
-3.242806, -2.900659, 5.948996,
-3.242806, 2.923063, -5.977229,
-3.242806, 2.923063, 5.948996,
-3.242806, -2.900659, -5.977229,
3.903617, -2.900659, -5.977229,
-3.242806, -2.900659, 5.948996,
3.903617, -2.900659, 5.948996,
-3.242806, 2.923063, -5.977229,
3.903617, 2.923063, -5.977229,
-3.242806, 2.923063, 5.948996,
3.903617, 2.923063, 5.948996,
3.903617, -2.900659, -5.977229,
3.903617, 2.923063, -5.977229,
3.903617, -2.900659, 5.948996,
3.903617, 2.923063, 5.948996,
3.903617, -2.900659, -5.977229,
3.903617, -2.900659, 5.948996,
3.903617, 2.923063, -5.977229,
3.903617, 2.923063, 5.948996
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
var radius = 8.049161;
var distance = 35.81163;
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
mvMatrix.translate( -0.3304056, -0.01120174, 0.01411653 );
mvMatrix.scale( 1.2178, 1.49439, 0.7297288 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81163);
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
5-(4-chlorophenyl)-2<-read.table("5-(4-chlorophenyl)-2.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-5-(4-chlorophenyl)-2$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
```

```r
y<-5-(4-chlorophenyl)-2$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
```

```r
z<-5-(4-chlorophenyl)-2$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
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
-3.138732, -0.169805, -0.1146389, 0, 0, 1, 1, 1,
-2.841314, 0.9541296, -3.080978, 1, 0, 0, 1, 1,
-2.719618, -2.132009, -2.55218, 1, 0, 0, 1, 1,
-2.648304, -0.8358301, -1.063672, 1, 0, 0, 1, 1,
-2.374583, 1.970575, -2.805062, 1, 0, 0, 1, 1,
-2.373428, -0.8598379, -2.632785, 1, 0, 0, 1, 1,
-2.333149, 0.3683355, -2.521184, 0, 0, 0, 1, 1,
-2.332621, -0.5756487, -2.674102, 0, 0, 0, 1, 1,
-2.322374, 0.3677171, 0.4609986, 0, 0, 0, 1, 1,
-2.302738, -0.3764049, -3.127336, 0, 0, 0, 1, 1,
-2.300902, -1.088664, -2.034938, 0, 0, 0, 1, 1,
-2.166397, 0.02028534, -2.199958, 0, 0, 0, 1, 1,
-2.070354, 1.015623, -0.1420646, 0, 0, 0, 1, 1,
-2.053756, 0.01420451, -0.06716814, 1, 1, 1, 1, 1,
-2.026999, 0.2852624, -0.2944374, 1, 1, 1, 1, 1,
-1.996332, -0.9666898, -2.465174, 1, 1, 1, 1, 1,
-1.977346, 0.1261325, -1.190643, 1, 1, 1, 1, 1,
-1.95745, 0.2489777, -1.685525, 1, 1, 1, 1, 1,
-1.953222, 0.01043862, -2.22025, 1, 1, 1, 1, 1,
-1.948479, 0.5149922, -1.156408, 1, 1, 1, 1, 1,
-1.938156, -0.8279089, -2.408199, 1, 1, 1, 1, 1,
-1.91103, -0.4833856, -2.741995, 1, 1, 1, 1, 1,
-1.88125, -0.5642418, -1.661989, 1, 1, 1, 1, 1,
-1.878735, 0.3279904, -1.280142, 1, 1, 1, 1, 1,
-1.874189, -0.3828822, -1.911398, 1, 1, 1, 1, 1,
-1.873043, 1.669778, -0.07620408, 1, 1, 1, 1, 1,
-1.869123, -1.149887, -2.96534, 1, 1, 1, 1, 1,
-1.834383, 1.407744, -0.6314283, 1, 1, 1, 1, 1,
-1.826727, 0.009906049, -1.072088, 0, 0, 1, 1, 1,
-1.756076, -0.6314425, -1.665417, 1, 0, 0, 1, 1,
-1.719914, 0.6958728, -0.8896831, 1, 0, 0, 1, 1,
-1.715648, -1.481084, -1.018252, 1, 0, 0, 1, 1,
-1.707993, -0.7772998, -3.057385, 1, 0, 0, 1, 1,
-1.690777, 1.152729, -0.4033065, 1, 0, 0, 1, 1,
-1.672032, 0.4634865, -1.624691, 0, 0, 0, 1, 1,
-1.659756, -0.3737319, -1.330682, 0, 0, 0, 1, 1,
-1.659479, -1.360963, -1.198982, 0, 0, 0, 1, 1,
-1.640799, -0.29338, -2.130991, 0, 0, 0, 1, 1,
-1.636327, -0.001518149, -2.088259, 0, 0, 0, 1, 1,
-1.633213, 0.7187815, -1.113718, 0, 0, 0, 1, 1,
-1.632828, 0.804789, -1.801613, 0, 0, 0, 1, 1,
-1.627094, 1.406054, 0.0353513, 1, 1, 1, 1, 1,
-1.621166, -0.7316691, -0.6569133, 1, 1, 1, 1, 1,
-1.614295, 0.4633806, -2.92709, 1, 1, 1, 1, 1,
-1.6124, -0.8890182, -1.088472, 1, 1, 1, 1, 1,
-1.600375, 1.633405, -0.6566747, 1, 1, 1, 1, 1,
-1.594438, -0.1972765, -2.109117, 1, 1, 1, 1, 1,
-1.5919, 0.06820774, -0.390819, 1, 1, 1, 1, 1,
-1.571906, 0.06911425, -3.103345, 1, 1, 1, 1, 1,
-1.553773, 0.1573683, -1.206001, 1, 1, 1, 1, 1,
-1.553671, 0.3366501, -0.6368241, 1, 1, 1, 1, 1,
-1.549968, -0.8601494, -1.529313, 1, 1, 1, 1, 1,
-1.542922, -0.6206279, -0.8866799, 1, 1, 1, 1, 1,
-1.534299, -0.6402869, -1.23562, 1, 1, 1, 1, 1,
-1.52076, -1.534848, -4.777903, 1, 1, 1, 1, 1,
-1.51984, 1.137911, -0.5753194, 1, 1, 1, 1, 1,
-1.512015, -0.3724322, -0.4743399, 0, 0, 1, 1, 1,
-1.511535, -0.1014307, -0.841994, 1, 0, 0, 1, 1,
-1.503132, 0.2150448, 0.1418418, 1, 0, 0, 1, 1,
-1.485295, 2.327703, -0.7258853, 1, 0, 0, 1, 1,
-1.478648, 1.130389, -0.2306412, 1, 0, 0, 1, 1,
-1.469003, 0.09297588, -1.619442, 1, 0, 0, 1, 1,
-1.463706, -0.6151482, -0.6683534, 0, 0, 0, 1, 1,
-1.4561, -1.188939, -4.053845, 0, 0, 0, 1, 1,
-1.45488, -1.056368, -2.226733, 0, 0, 0, 1, 1,
-1.443542, 0.8434337, -0.7713711, 0, 0, 0, 1, 1,
-1.442247, 1.164285, 1.213918, 0, 0, 0, 1, 1,
-1.430276, -0.4288814, 0.312108, 0, 0, 0, 1, 1,
-1.405682, 1.169471, 0.2031485, 0, 0, 0, 1, 1,
-1.391488, -0.1341488, -0.4543371, 1, 1, 1, 1, 1,
-1.386379, -0.3744506, -1.221448, 1, 1, 1, 1, 1,
-1.368752, 0.06069545, -1.933693, 1, 1, 1, 1, 1,
-1.36309, -0.007095874, -1.076451, 1, 1, 1, 1, 1,
-1.360945, 0.3089487, -1.327557, 1, 1, 1, 1, 1,
-1.351348, 0.891571, -1.542417, 1, 1, 1, 1, 1,
-1.344324, 0.9540464, -0.3520723, 1, 1, 1, 1, 1,
-1.338581, 2.186363, -1.542557, 1, 1, 1, 1, 1,
-1.335724, -0.2172895, -2.137332, 1, 1, 1, 1, 1,
-1.329955, 1.198163, -0.6027363, 1, 1, 1, 1, 1,
-1.326547, 0.096418, -1.824051, 1, 1, 1, 1, 1,
-1.325216, 0.7128013, 0.6773007, 1, 1, 1, 1, 1,
-1.31365, -0.832822, -1.205389, 1, 1, 1, 1, 1,
-1.312249, 1.794984, 0.1437506, 1, 1, 1, 1, 1,
-1.312065, 1.302509, -0.9230923, 1, 1, 1, 1, 1,
-1.311683, -0.157138, -1.936164, 0, 0, 1, 1, 1,
-1.301819, -0.2641395, -3.25181, 1, 0, 0, 1, 1,
-1.289007, 0.5185521, -1.655529, 1, 0, 0, 1, 1,
-1.286397, 0.4894366, -1.991109, 1, 0, 0, 1, 1,
-1.285446, -0.3828214, -2.393444, 1, 0, 0, 1, 1,
-1.275594, 2.082893, -0.6017954, 1, 0, 0, 1, 1,
-1.269687, -0.9380004, -3.069039, 0, 0, 0, 1, 1,
-1.26854, 0.3507974, 0.6823607, 0, 0, 0, 1, 1,
-1.268389, 1.044894, -0.8106912, 0, 0, 0, 1, 1,
-1.25767, -0.8710748, -3.981245, 0, 0, 0, 1, 1,
-1.257392, 0.1901453, -1.817833, 0, 0, 0, 1, 1,
-1.253263, 0.05036316, -1.253961, 0, 0, 0, 1, 1,
-1.252215, -1.945857, -3.577643, 0, 0, 0, 1, 1,
-1.24542, 0.4161099, -1.819759, 1, 1, 1, 1, 1,
-1.241976, 0.3900618, -1.539592, 1, 1, 1, 1, 1,
-1.241224, -0.629685, -1.700154, 1, 1, 1, 1, 1,
-1.239049, 0.2276142, -0.7206868, 1, 1, 1, 1, 1,
-1.238288, 1.343935, 1.207436, 1, 1, 1, 1, 1,
-1.238031, 0.2691141, -0.9100475, 1, 1, 1, 1, 1,
-1.211424, -1.59352, -1.562072, 1, 1, 1, 1, 1,
-1.204338, -0.0364961, -1.104606, 1, 1, 1, 1, 1,
-1.189252, 0.723688, -2.019799, 1, 1, 1, 1, 1,
-1.182768, -0.3777754, -1.138483, 1, 1, 1, 1, 1,
-1.182706, -0.3865516, -1.636331, 1, 1, 1, 1, 1,
-1.182227, -0.1368772, -1.813666, 1, 1, 1, 1, 1,
-1.177036, -0.9512313, -1.94883, 1, 1, 1, 1, 1,
-1.169732, -0.5576171, -2.358933, 1, 1, 1, 1, 1,
-1.169324, -0.1225578, -1.176209, 1, 1, 1, 1, 1,
-1.166174, -0.7241771, -3.493739, 0, 0, 1, 1, 1,
-1.162977, 0.02718443, -1.584023, 1, 0, 0, 1, 1,
-1.162508, -0.6230004, -1.242272, 1, 0, 0, 1, 1,
-1.158403, -0.08739701, -3.322697, 1, 0, 0, 1, 1,
-1.15839, -0.1874842, -4.413612, 1, 0, 0, 1, 1,
-1.156914, 1.098169, -0.6223491, 1, 0, 0, 1, 1,
-1.138368, -0.02105935, -3.474623, 0, 0, 0, 1, 1,
-1.135964, -0.6073738, -2.680577, 0, 0, 0, 1, 1,
-1.13402, 0.4374193, -3.420024, 0, 0, 0, 1, 1,
-1.128336, 1.964657, 0.6462002, 0, 0, 0, 1, 1,
-1.128166, -0.2196356, 0.09781925, 0, 0, 0, 1, 1,
-1.126808, -0.04303676, -2.767127, 0, 0, 0, 1, 1,
-1.126026, 0.7716832, -2.158123, 0, 0, 0, 1, 1,
-1.124048, 0.8690212, -1.58892, 1, 1, 1, 1, 1,
-1.109248, -0.3596913, -2.302619, 1, 1, 1, 1, 1,
-1.106743, 0.2709142, -0.7186501, 1, 1, 1, 1, 1,
-1.104384, 0.2335038, -1.720727, 1, 1, 1, 1, 1,
-1.077459, -0.3406637, -1.227436, 1, 1, 1, 1, 1,
-1.07692, 1.928766, -0.5765954, 1, 1, 1, 1, 1,
-1.075933, 1.103032, -0.7220105, 1, 1, 1, 1, 1,
-1.070516, 1.616876, -0.8055729, 1, 1, 1, 1, 1,
-1.065942, 0.4557511, -1.602661, 1, 1, 1, 1, 1,
-1.061151, -0.7723925, -2.044019, 1, 1, 1, 1, 1,
-1.055418, 1.884845, -1.201125, 1, 1, 1, 1, 1,
-1.054559, -0.595267, -2.670681, 1, 1, 1, 1, 1,
-1.054079, -1.778007, -3.125903, 1, 1, 1, 1, 1,
-1.050392, -1.114133, -2.029578, 1, 1, 1, 1, 1,
-1.047296, -0.06589282, -0.5125371, 1, 1, 1, 1, 1,
-1.045909, -0.7550516, -1.453756, 0, 0, 1, 1, 1,
-1.045323, 0.2810799, -1.059724, 1, 0, 0, 1, 1,
-1.043727, -0.592786, -3.203134, 1, 0, 0, 1, 1,
-1.042885, -2.144779, -1.226315, 1, 0, 0, 1, 1,
-1.038054, 0.7461666, 0.2586134, 1, 0, 0, 1, 1,
-1.03766, 0.004072794, -0.5790514, 1, 0, 0, 1, 1,
-1.032398, -1.412204, -2.393472, 0, 0, 0, 1, 1,
-1.030574, 1.007661, -0.6187252, 0, 0, 0, 1, 1,
-1.02784, 0.05704892, -2.045231, 0, 0, 0, 1, 1,
-1.027565, -0.8090664, -1.171857, 0, 0, 0, 1, 1,
-1.025445, 0.304241, -1.066426, 0, 0, 0, 1, 1,
-1.024466, 0.6971453, -0.5879405, 0, 0, 0, 1, 1,
-1.023077, 0.54544, -1.475063, 0, 0, 0, 1, 1,
-1.021455, 2.638768, -1.150492, 1, 1, 1, 1, 1,
-1.017341, -0.209047, -2.567598, 1, 1, 1, 1, 1,
-1.016683, 0.007971919, -1.878138, 1, 1, 1, 1, 1,
-1.010943, 2.147496, -0.1372986, 1, 1, 1, 1, 1,
-1.006606, -0.6391416, -3.183656, 1, 1, 1, 1, 1,
-1.006437, 1.193086, 0.01060564, 1, 1, 1, 1, 1,
-1.005052, -0.9162522, -2.943819, 1, 1, 1, 1, 1,
-1.00293, -0.4751018, -1.400502, 1, 1, 1, 1, 1,
-1.002717, 0.1306743, -1.266505, 1, 1, 1, 1, 1,
-1.002192, 0.6511112, -1.852868, 1, 1, 1, 1, 1,
-1.001333, 0.613421, -0.09878273, 1, 1, 1, 1, 1,
-1.001294, -0.2081507, -1.595336, 1, 1, 1, 1, 1,
-0.9915225, -1.883007, -3.349496, 1, 1, 1, 1, 1,
-0.983648, 0.06693529, -0.840238, 1, 1, 1, 1, 1,
-0.9781764, 0.4411448, -2.75123, 1, 1, 1, 1, 1,
-0.9757786, -0.1956693, -1.91027, 0, 0, 1, 1, 1,
-0.9746071, -0.8376966, -1.851645, 1, 0, 0, 1, 1,
-0.9701768, -0.06837326, -2.134443, 1, 0, 0, 1, 1,
-0.9673106, -0.6959502, -3.643442, 1, 0, 0, 1, 1,
-0.9663701, -1.034495, -1.3204, 1, 0, 0, 1, 1,
-0.9661266, -0.2219235, -1.90403, 1, 0, 0, 1, 1,
-0.9624946, -0.2027102, -2.615131, 0, 0, 0, 1, 1,
-0.9532596, -1.3233, -3.353826, 0, 0, 0, 1, 1,
-0.9476348, 0.05362527, -0.9317077, 0, 0, 0, 1, 1,
-0.9425824, -0.1052993, -1.263127, 0, 0, 0, 1, 1,
-0.9402252, 1.929208, -0.2910975, 0, 0, 0, 1, 1,
-0.9380772, -0.4510446, -1.448205, 0, 0, 0, 1, 1,
-0.9356753, -1.471243, -3.016133, 0, 0, 0, 1, 1,
-0.9313205, -0.8340433, -0.07375783, 1, 1, 1, 1, 1,
-0.9294737, 0.8823932, -0.3967252, 1, 1, 1, 1, 1,
-0.9251628, 0.6217339, -0.9595816, 1, 1, 1, 1, 1,
-0.904566, 0.6667235, -0.7837291, 1, 1, 1, 1, 1,
-0.9042856, -1.69532, -2.782135, 1, 1, 1, 1, 1,
-0.9028186, -1.026112, -3.352796, 1, 1, 1, 1, 1,
-0.891765, -1.014382, -1.058698, 1, 1, 1, 1, 1,
-0.8909577, 0.1127753, -1.634089, 1, 1, 1, 1, 1,
-0.8904122, -0.1492729, -2.516851, 1, 1, 1, 1, 1,
-0.890269, -0.8157431, -1.691004, 1, 1, 1, 1, 1,
-0.889382, 0.1844989, -0.2175781, 1, 1, 1, 1, 1,
-0.8861642, 1.047181, -2.048227, 1, 1, 1, 1, 1,
-0.8859401, 1.885212, -1.14764, 1, 1, 1, 1, 1,
-0.8839716, 1.001354, -0.9846076, 1, 1, 1, 1, 1,
-0.8812808, -1.069757, -2.469695, 1, 1, 1, 1, 1,
-0.8812075, -2.815848, -2.781193, 0, 0, 1, 1, 1,
-0.8801315, -1.263555, -2.325928, 1, 0, 0, 1, 1,
-0.8744038, -1.142753, -1.618159, 1, 0, 0, 1, 1,
-0.863399, 0.5702631, -0.5623104, 1, 0, 0, 1, 1,
-0.863046, -0.5747092, -2.546213, 1, 0, 0, 1, 1,
-0.8583409, -1.401044, -2.477002, 1, 0, 0, 1, 1,
-0.8482858, -1.794749, -1.843185, 0, 0, 0, 1, 1,
-0.8425963, 0.5258708, -1.030509, 0, 0, 0, 1, 1,
-0.8388596, -0.69306, -2.950769, 0, 0, 0, 1, 1,
-0.8386653, -0.5480714, -2.080516, 0, 0, 0, 1, 1,
-0.8365668, -0.3968401, -1.657484, 0, 0, 0, 1, 1,
-0.8340966, -0.8081281, -4.086498, 0, 0, 0, 1, 1,
-0.8339751, 0.9991223, -1.201645, 0, 0, 0, 1, 1,
-0.8293025, 1.132858, -1.819823, 1, 1, 1, 1, 1,
-0.8255963, -0.4952993, -2.354063, 1, 1, 1, 1, 1,
-0.8238202, 0.155723, -1.622389, 1, 1, 1, 1, 1,
-0.8144338, 0.6411041, -1.093331, 1, 1, 1, 1, 1,
-0.8118004, 1.120343, 0.06473923, 1, 1, 1, 1, 1,
-0.8110607, 0.6889067, -0.8527569, 1, 1, 1, 1, 1,
-0.8105248, -1.196977, -3.896055, 1, 1, 1, 1, 1,
-0.8100876, -0.5222264, -1.802558, 1, 1, 1, 1, 1,
-0.7881744, -0.6911905, -1.565585, 1, 1, 1, 1, 1,
-0.7859399, -1.46371, -4.074971, 1, 1, 1, 1, 1,
-0.7846615, 2.174601, -0.7163731, 1, 1, 1, 1, 1,
-0.7735672, -0.3722156, -3.298132, 1, 1, 1, 1, 1,
-0.7703374, -0.9950277, -3.262359, 1, 1, 1, 1, 1,
-0.7702779, -0.8551471, -1.597575, 1, 1, 1, 1, 1,
-0.7702689, 0.8288458, -1.365944, 1, 1, 1, 1, 1,
-0.7678478, 0.4078753, -1.629915, 0, 0, 1, 1, 1,
-0.7673696, 0.5702093, -0.9801026, 1, 0, 0, 1, 1,
-0.7596098, -0.7902551, -2.575526, 1, 0, 0, 1, 1,
-0.7527315, -0.9786546, -2.355915, 1, 0, 0, 1, 1,
-0.7517403, 1.028263, -2.471823, 1, 0, 0, 1, 1,
-0.7484075, 0.8156252, 0.7412573, 1, 0, 0, 1, 1,
-0.7418154, -1.395245, -0.628426, 0, 0, 0, 1, 1,
-0.7392223, -0.02643797, -0.4450519, 0, 0, 0, 1, 1,
-0.7386249, -0.04829745, -0.8973535, 0, 0, 0, 1, 1,
-0.734055, -0.4264491, -3.363574, 0, 0, 0, 1, 1,
-0.732826, -1.595587, -2.322672, 0, 0, 0, 1, 1,
-0.728142, -2.511653, -3.246785, 0, 0, 0, 1, 1,
-0.728051, -1.06282, -1.499557, 0, 0, 0, 1, 1,
-0.7259725, 0.06677723, -1.05803, 1, 1, 1, 1, 1,
-0.7187135, -1.125839, -1.138673, 1, 1, 1, 1, 1,
-0.7157426, 1.20531, 0.985589, 1, 1, 1, 1, 1,
-0.7119278, -1.603711, -3.95723, 1, 1, 1, 1, 1,
-0.7091799, -0.02510614, -0.4255711, 1, 1, 1, 1, 1,
-0.704118, 0.6695735, 0.6057107, 1, 1, 1, 1, 1,
-0.7003782, 0.7378655, -0.2169425, 1, 1, 1, 1, 1,
-0.7002766, -0.06054995, -2.605402, 1, 1, 1, 1, 1,
-0.7002252, -0.3603637, -1.672044, 1, 1, 1, 1, 1,
-0.6966773, -0.4101523, -1.218519, 1, 1, 1, 1, 1,
-0.6942429, 0.7696331, -0.6815501, 1, 1, 1, 1, 1,
-0.6938498, 1.601634, -1.437888, 1, 1, 1, 1, 1,
-0.6938409, -1.623485, -4.096954, 1, 1, 1, 1, 1,
-0.6919888, -0.1212593, -2.053149, 1, 1, 1, 1, 1,
-0.6907356, -0.6090812, -2.017186, 1, 1, 1, 1, 1,
-0.6886895, 0.2300324, -0.979376, 0, 0, 1, 1, 1,
-0.6880993, -0.5783161, -1.234248, 1, 0, 0, 1, 1,
-0.6854126, 1.512429, 0.7509515, 1, 0, 0, 1, 1,
-0.6646177, 0.1297185, -2.089898, 1, 0, 0, 1, 1,
-0.6529761, -0.3599878, -1.782584, 1, 0, 0, 1, 1,
-0.6505722, 0.2670442, -0.6995173, 1, 0, 0, 1, 1,
-0.642764, -0.01737754, -1.899423, 0, 0, 0, 1, 1,
-0.6425762, 0.04274555, -0.1339236, 0, 0, 0, 1, 1,
-0.6425276, 0.5860915, 1.100496, 0, 0, 0, 1, 1,
-0.6366123, 1.951559, -0.9299135, 0, 0, 0, 1, 1,
-0.636268, 2.618046, 1.781021, 0, 0, 0, 1, 1,
-0.6346678, 0.7044838, -0.5773382, 0, 0, 0, 1, 1,
-0.6206319, -1.598118, -1.30088, 0, 0, 0, 1, 1,
-0.6205731, -0.8412753, -3.940992, 1, 1, 1, 1, 1,
-0.6187633, -1.370657, -3.111915, 1, 1, 1, 1, 1,
-0.6148104, 1.690527, 0.3062061, 1, 1, 1, 1, 1,
-0.6144089, 0.5664147, -2.033945, 1, 1, 1, 1, 1,
-0.6143345, -0.1526729, -0.8775836, 1, 1, 1, 1, 1,
-0.6109036, 0.353906, -0.1327896, 1, 1, 1, 1, 1,
-0.6025935, 0.07132814, -1.144122, 1, 1, 1, 1, 1,
-0.6009264, 0.763134, -1.433985, 1, 1, 1, 1, 1,
-0.5947821, -0.6743097, -2.117347, 1, 1, 1, 1, 1,
-0.5882436, 1.303617, 0.3399594, 1, 1, 1, 1, 1,
-0.5866989, 0.157885, -1.750399, 1, 1, 1, 1, 1,
-0.5837321, -0.05544793, -2.529105, 1, 1, 1, 1, 1,
-0.5809027, 1.409067, -0.1446677, 1, 1, 1, 1, 1,
-0.5807589, -0.1051817, -1.966739, 1, 1, 1, 1, 1,
-0.5806763, -1.26112, -3.081382, 1, 1, 1, 1, 1,
-0.5711307, 0.5708759, -0.2236136, 0, 0, 1, 1, 1,
-0.56707, 0.2360502, -1.616662, 1, 0, 0, 1, 1,
-0.5650849, -0.7197281, -3.563456, 1, 0, 0, 1, 1,
-0.5538709, 0.3435545, 0.1757954, 1, 0, 0, 1, 1,
-0.552296, -0.5197058, -2.669779, 1, 0, 0, 1, 1,
-0.5517888, -0.7215582, -3.579876, 1, 0, 0, 1, 1,
-0.5420772, -0.01322299, -1.887414, 0, 0, 0, 1, 1,
-0.534671, 0.5253475, -2.013614, 0, 0, 0, 1, 1,
-0.5324675, -1.962209, -3.163922, 0, 0, 0, 1, 1,
-0.5255079, 0.913991, -0.6627966, 0, 0, 0, 1, 1,
-0.5236234, -0.2770289, -0.5533929, 0, 0, 0, 1, 1,
-0.5208354, -0.156799, -0.5055662, 0, 0, 0, 1, 1,
-0.5192421, 0.7906212, -1.751654, 0, 0, 0, 1, 1,
-0.5180305, -1.32967, -2.056721, 1, 1, 1, 1, 1,
-0.517738, 0.4999396, -2.057707, 1, 1, 1, 1, 1,
-0.5069408, -0.07774655, -0.5599483, 1, 1, 1, 1, 1,
-0.5064573, 0.7046529, 1.087664, 1, 1, 1, 1, 1,
-0.5063073, -0.5879021, -2.603961, 1, 1, 1, 1, 1,
-0.5013317, 0.2902231, -1.920468, 1, 1, 1, 1, 1,
-0.4998959, -0.7261504, -1.372379, 1, 1, 1, 1, 1,
-0.497081, -0.2583234, -1.805038, 1, 1, 1, 1, 1,
-0.4966587, 1.158965, -1.798738, 1, 1, 1, 1, 1,
-0.4958185, -0.6834072, -2.752632, 1, 1, 1, 1, 1,
-0.4956747, 0.4773471, -1.305189, 1, 1, 1, 1, 1,
-0.4946684, -0.4379363, -0.4558652, 1, 1, 1, 1, 1,
-0.4827741, 0.9817377, -1.074854, 1, 1, 1, 1, 1,
-0.4787788, 0.1896617, -1.833081, 1, 1, 1, 1, 1,
-0.4723133, 1.035756, -1.298562, 1, 1, 1, 1, 1,
-0.4710884, 0.8820654, -1.525017, 0, 0, 1, 1, 1,
-0.4652225, -0.7663133, -3.466606, 1, 0, 0, 1, 1,
-0.46485, -0.02733007, -2.251457, 1, 0, 0, 1, 1,
-0.4630954, -2.551815, -3.154591, 1, 0, 0, 1, 1,
-0.4592773, -1.317559, -4.130309, 1, 0, 0, 1, 1,
-0.4575328, 0.4704314, -2.307636, 1, 0, 0, 1, 1,
-0.455073, 0.4438003, 0.6011035, 0, 0, 0, 1, 1,
-0.4543837, 0.8936698, 0.7501474, 0, 0, 0, 1, 1,
-0.4497847, 0.6034071, -0.01681161, 0, 0, 0, 1, 1,
-0.4495869, 1.340448, -1.258605, 0, 0, 0, 1, 1,
-0.4442928, 0.7644389, -0.58921, 0, 0, 0, 1, 1,
-0.4418606, 0.9032776, 0.2331464, 0, 0, 0, 1, 1,
-0.4382443, -1.4886, -2.517489, 0, 0, 0, 1, 1,
-0.4369383, 0.02885162, -2.774029, 1, 1, 1, 1, 1,
-0.4362327, 1.411887, -1.738761, 1, 1, 1, 1, 1,
-0.4324368, -0.7910246, -3.957428, 1, 1, 1, 1, 1,
-0.4294739, -1.057933, -4.341733, 1, 1, 1, 1, 1,
-0.4196585, -0.5419526, -1.035166, 1, 1, 1, 1, 1,
-0.4137849, 1.30251, -1.255672, 1, 1, 1, 1, 1,
-0.4043844, -1.180742, -2.76229, 1, 1, 1, 1, 1,
-0.3973424, -0.5749336, -3.039232, 1, 1, 1, 1, 1,
-0.3928293, 1.213806, -0.8300625, 1, 1, 1, 1, 1,
-0.392381, -0.5699317, -4.256783, 1, 1, 1, 1, 1,
-0.3900157, -0.3755403, -3.267152, 1, 1, 1, 1, 1,
-0.3851252, -0.7551947, -3.424658, 1, 1, 1, 1, 1,
-0.3771504, -0.6056104, -1.063284, 1, 1, 1, 1, 1,
-0.3757864, -0.01648016, -0.2892934, 1, 1, 1, 1, 1,
-0.3750507, -1.473165, -3.405174, 1, 1, 1, 1, 1,
-0.3745116, -0.2741483, -0.399754, 0, 0, 1, 1, 1,
-0.3727325, -0.1946844, -3.188157, 1, 0, 0, 1, 1,
-0.3723017, -0.8146331, -1.135936, 1, 0, 0, 1, 1,
-0.3712885, -1.799191, -1.526213, 1, 0, 0, 1, 1,
-0.3710412, 0.401303, -0.801305, 1, 0, 0, 1, 1,
-0.3699341, -1.774377, -3.540123, 1, 0, 0, 1, 1,
-0.3685978, -1.47641, -4.713075, 0, 0, 0, 1, 1,
-0.3684469, 2.311493, 0.1219129, 0, 0, 0, 1, 1,
-0.3614588, -0.1526921, -0.8469092, 0, 0, 0, 1, 1,
-0.3612838, -0.1002167, -0.1995537, 0, 0, 0, 1, 1,
-0.3610155, -1.084197, -2.321395, 0, 0, 0, 1, 1,
-0.3605466, 0.1442316, -3.753087, 0, 0, 0, 1, 1,
-0.3570184, -0.2637171, -1.642527, 0, 0, 0, 1, 1,
-0.3548234, -2.043043, -3.81625, 1, 1, 1, 1, 1,
-0.3529955, 0.06675617, -2.194244, 1, 1, 1, 1, 1,
-0.3518692, 0.7535542, -0.2556574, 1, 1, 1, 1, 1,
-0.3492897, 0.5465363, -1.896998, 1, 1, 1, 1, 1,
-0.3466195, 0.4448699, -0.6038787, 1, 1, 1, 1, 1,
-0.3417777, -0.2901955, -1.96615, 1, 1, 1, 1, 1,
-0.339355, -0.3213215, -1.975301, 1, 1, 1, 1, 1,
-0.3380038, -2.11296, -2.541191, 1, 1, 1, 1, 1,
-0.3347039, 2.551634, -1.880679, 1, 1, 1, 1, 1,
-0.3320433, -0.04544841, -1.826378, 1, 1, 1, 1, 1,
-0.3303189, 1.122779, -0.7363693, 1, 1, 1, 1, 1,
-0.329532, -1.802728, -4.302959, 1, 1, 1, 1, 1,
-0.3248954, -0.2536134, -1.251354, 1, 1, 1, 1, 1,
-0.3215472, 0.7484485, 1.534667, 1, 1, 1, 1, 1,
-0.3179851, 0.2857336, 0.4073119, 1, 1, 1, 1, 1,
-0.31602, -0.2205918, -1.642089, 0, 0, 1, 1, 1,
-0.3139562, 0.07909144, -1.459402, 1, 0, 0, 1, 1,
-0.3080549, 0.6463733, 1.000128, 1, 0, 0, 1, 1,
-0.3040072, 1.060758, -0.5260584, 1, 0, 0, 1, 1,
-0.3022248, -0.8219441, -1.751435, 1, 0, 0, 1, 1,
-0.2995927, 1.263406, -0.1752715, 1, 0, 0, 1, 1,
-0.2894695, 1.059937, -1.390419, 0, 0, 0, 1, 1,
-0.2878751, -0.09150874, -1.61628, 0, 0, 0, 1, 1,
-0.2867412, 0.5538403, 0.3589361, 0, 0, 0, 1, 1,
-0.2824223, -0.5159312, -2.348409, 0, 0, 0, 1, 1,
-0.2812733, -0.2304281, -1.866542, 0, 0, 0, 1, 1,
-0.2808595, -0.4996971, -4.224965, 0, 0, 0, 1, 1,
-0.2800876, -0.1121853, -1.60237, 0, 0, 0, 1, 1,
-0.2778052, -0.8444705, -2.172036, 1, 1, 1, 1, 1,
-0.2761419, 1.79695, -0.7972029, 1, 1, 1, 1, 1,
-0.2749571, 1.311797, -0.4410587, 1, 1, 1, 1, 1,
-0.2724309, 0.4114635, 1.720836, 1, 1, 1, 1, 1,
-0.2658645, 0.08389213, -1.74597, 1, 1, 1, 1, 1,
-0.2655028, 1.351381, 0.4006413, 1, 1, 1, 1, 1,
-0.2612849, 0.4497429, 0.009784081, 1, 1, 1, 1, 1,
-0.2598406, 0.8244793, 0.1449333, 1, 1, 1, 1, 1,
-0.2576793, -0.9761873, -2.478869, 1, 1, 1, 1, 1,
-0.2556148, -0.8217797, -4.587409, 1, 1, 1, 1, 1,
-0.2519998, 1.528518, -1.24523, 1, 1, 1, 1, 1,
-0.2505377, -0.1544409, -2.697653, 1, 1, 1, 1, 1,
-0.2483572, 1.588256, -1.771124, 1, 1, 1, 1, 1,
-0.2464738, -1.131912, -5.803546, 1, 1, 1, 1, 1,
-0.2418005, -1.142058, -2.449383, 1, 1, 1, 1, 1,
-0.2373372, -0.07540385, -2.700936, 0, 0, 1, 1, 1,
-0.237182, 0.7685118, 1.538813, 1, 0, 0, 1, 1,
-0.2339693, -0.3112703, -4.06707, 1, 0, 0, 1, 1,
-0.2288913, -0.6921352, -3.10783, 1, 0, 0, 1, 1,
-0.2283161, 0.8086585, -0.1761092, 1, 0, 0, 1, 1,
-0.2269386, -0.2094857, -3.029606, 1, 0, 0, 1, 1,
-0.2263556, -1.320655, -3.417784, 0, 0, 0, 1, 1,
-0.2242156, 0.5873983, 0.7543978, 0, 0, 0, 1, 1,
-0.2238298, 0.3489105, -1.681, 0, 0, 0, 1, 1,
-0.2212161, 0.5360631, 0.1444834, 0, 0, 0, 1, 1,
-0.2206859, 0.7088778, -1.030765, 0, 0, 0, 1, 1,
-0.2202352, -0.9320612, -0.9935632, 0, 0, 0, 1, 1,
-0.2137429, 1.044049, 0.06974352, 0, 0, 0, 1, 1,
-0.2036275, 0.8414591, 2.012757, 1, 1, 1, 1, 1,
-0.2025393, -0.3906725, -3.56227, 1, 1, 1, 1, 1,
-0.2014567, 1.063771, -0.06541065, 1, 1, 1, 1, 1,
-0.1952356, 0.9363875, -1.222768, 1, 1, 1, 1, 1,
-0.1952179, -2.044266, -4.935606, 1, 1, 1, 1, 1,
-0.1937371, 1.178946, -1.687124, 1, 1, 1, 1, 1,
-0.1821718, 1.279845, -0.3133957, 1, 1, 1, 1, 1,
-0.1684889, 0.0899492, -2.928167, 1, 1, 1, 1, 1,
-0.1668701, -2.05698, -3.343419, 1, 1, 1, 1, 1,
-0.1666533, -0.05323258, -1.179723, 1, 1, 1, 1, 1,
-0.166572, -0.9406804, -2.89816, 1, 1, 1, 1, 1,
-0.1604105, 0.06651312, 0.2811674, 1, 1, 1, 1, 1,
-0.1543868, -0.8565392, -3.316418, 1, 1, 1, 1, 1,
-0.1481419, -1.463187, -2.700588, 1, 1, 1, 1, 1,
-0.1473068, 0.9585692, 1.009224, 1, 1, 1, 1, 1,
-0.141537, -0.4319279, -2.14881, 0, 0, 1, 1, 1,
-0.1369291, -0.2279232, -2.016323, 1, 0, 0, 1, 1,
-0.134415, -2.464118, -2.958432, 1, 0, 0, 1, 1,
-0.1337753, -1.558625, -3.366336, 1, 0, 0, 1, 1,
-0.1321618, -1.179604, -4.171194, 1, 0, 0, 1, 1,
-0.1311025, -0.3492072, -3.136253, 1, 0, 0, 1, 1,
-0.1293269, 0.2364696, 0.07287032, 0, 0, 0, 1, 1,
-0.1261628, 0.6358663, -1.583162, 0, 0, 0, 1, 1,
-0.1259118, -2.350593, -5.449736, 0, 0, 0, 1, 1,
-0.1249746, 1.523893, -1.402714, 0, 0, 0, 1, 1,
-0.121979, 0.9257237, 0.3784676, 0, 0, 0, 1, 1,
-0.1198858, -0.4534131, -3.973457, 0, 0, 0, 1, 1,
-0.1171733, -0.2653679, -3.427639, 0, 0, 0, 1, 1,
-0.1170551, 1.514785, 1.731739, 1, 1, 1, 1, 1,
-0.1104488, 0.3968401, -0.01698955, 1, 1, 1, 1, 1,
-0.1089139, 0.04700695, -2.070042, 1, 1, 1, 1, 1,
-0.1055413, -1.038173, -4.810308, 1, 1, 1, 1, 1,
-0.1007243, -1.331688, -3.07839, 1, 1, 1, 1, 1,
-0.09990267, -0.7835462, -3.316019, 1, 1, 1, 1, 1,
-0.09767637, 0.341453, -0.3683622, 1, 1, 1, 1, 1,
-0.09765439, 0.1677749, -0.703794, 1, 1, 1, 1, 1,
-0.09665778, 2.286291, -1.004447, 1, 1, 1, 1, 1,
-0.08460522, 0.4747715, 0.0986915, 1, 1, 1, 1, 1,
-0.0823616, -1.396755, -4.324275, 1, 1, 1, 1, 1,
-0.08060658, 1.050613, 1.762996, 1, 1, 1, 1, 1,
-0.08054148, 0.2993764, -1.59692, 1, 1, 1, 1, 1,
-0.08042268, 0.2301829, -0.4533103, 1, 1, 1, 1, 1,
-0.07553816, 0.01151132, -3.895593, 1, 1, 1, 1, 1,
-0.07393622, -0.1593611, -2.260976, 0, 0, 1, 1, 1,
-0.07331353, -2.233685, -3.906908, 1, 0, 0, 1, 1,
-0.07187912, 0.07031878, 0.4969513, 1, 0, 0, 1, 1,
-0.0715513, -0.2937523, -3.784527, 1, 0, 0, 1, 1,
-0.07061974, 1.292355, -0.05132251, 1, 0, 0, 1, 1,
-0.0679941, -0.3707157, -3.231687, 1, 0, 0, 1, 1,
-0.06753718, -0.4780053, -3.234506, 0, 0, 0, 1, 1,
-0.06607865, 1.309025, 0.2236571, 0, 0, 0, 1, 1,
-0.06516647, -0.699773, -3.368913, 0, 0, 0, 1, 1,
-0.06455766, 0.1498476, -1.792657, 0, 0, 0, 1, 1,
-0.06455433, 1.055014, -1.368808, 0, 0, 0, 1, 1,
-0.05751521, 0.591728, -0.06371245, 0, 0, 0, 1, 1,
-0.05631711, 0.1240601, 0.3992198, 0, 0, 0, 1, 1,
-0.05610681, -0.7759319, -4.568438, 1, 1, 1, 1, 1,
-0.05592943, 0.477298, -0.3050533, 1, 1, 1, 1, 1,
-0.05557621, 0.4753179, 0.006201603, 1, 1, 1, 1, 1,
-0.05491196, -1.245034, -2.150988, 1, 1, 1, 1, 1,
-0.05094784, -1.180035, -2.459238, 1, 1, 1, 1, 1,
-0.0494452, -0.8903283, -3.484763, 1, 1, 1, 1, 1,
-0.0465806, -0.0324734, -2.725133, 1, 1, 1, 1, 1,
-0.03962074, -1.385646, -3.285762, 1, 1, 1, 1, 1,
-0.03932846, -0.6082694, -2.985991, 1, 1, 1, 1, 1,
-0.03223119, 0.5030345, -1.586623, 1, 1, 1, 1, 1,
-0.03158623, -0.3193895, -3.868599, 1, 1, 1, 1, 1,
-0.03082915, 1.442564, 2.28502, 1, 1, 1, 1, 1,
-0.02835806, -0.8019734, -4.162272, 1, 1, 1, 1, 1,
-0.02805884, -1.333741, -3.095089, 1, 1, 1, 1, 1,
-0.02378362, -0.5472351, -0.6671103, 1, 1, 1, 1, 1,
-0.02130075, -0.382805, -4.181255, 0, 0, 1, 1, 1,
-0.01215357, -0.2247119, -3.810807, 1, 0, 0, 1, 1,
-0.01148003, 1.794919, 0.7410818, 1, 0, 0, 1, 1,
-0.01081265, 1.722538, 0.8481953, 1, 0, 0, 1, 1,
-0.009603911, 0.3170488, 0.2315918, 1, 0, 0, 1, 1,
-0.008816088, -1.10259, -2.547705, 1, 0, 0, 1, 1,
-0.008679976, -0.7498363, -3.671198, 0, 0, 0, 1, 1,
-0.008585258, -0.4089117, -3.874182, 0, 0, 0, 1, 1,
0.007352025, -0.1311523, 2.703146, 0, 0, 0, 1, 1,
0.008220637, -0.7588541, 2.92007, 0, 0, 0, 1, 1,
0.009189476, 1.589508, -2.950354, 0, 0, 0, 1, 1,
0.01249485, -0.7707312, 3.436819, 0, 0, 0, 1, 1,
0.0127485, -0.2803445, 3.540552, 0, 0, 0, 1, 1,
0.01444182, -0.6965616, 1.853236, 1, 1, 1, 1, 1,
0.01942537, 0.1190138, -0.4034533, 1, 1, 1, 1, 1,
0.02006444, -1.02701, 2.029509, 1, 1, 1, 1, 1,
0.02198747, -0.09016441, 3.767473, 1, 1, 1, 1, 1,
0.02271637, 0.05163989, -0.5591971, 1, 1, 1, 1, 1,
0.0230743, 0.04537261, 0.2565525, 1, 1, 1, 1, 1,
0.03097071, -0.7054261, 2.149486, 1, 1, 1, 1, 1,
0.03707397, 0.6881058, -0.3754139, 1, 1, 1, 1, 1,
0.03707521, -0.7269149, 2.007314, 1, 1, 1, 1, 1,
0.0376571, -1.075305, 5.226379, 1, 1, 1, 1, 1,
0.04251697, 0.4774635, -0.8100902, 1, 1, 1, 1, 1,
0.04375017, 2.838251, 0.02791332, 1, 1, 1, 1, 1,
0.04475519, 0.2379754, 2.331729, 1, 1, 1, 1, 1,
0.04611614, 0.06034105, -0.324221, 1, 1, 1, 1, 1,
0.04735488, -0.4151934, 1.945139, 1, 1, 1, 1, 1,
0.04752392, -1.290805, 3.063693, 0, 0, 1, 1, 1,
0.04959743, -0.815463, 1.448175, 1, 0, 0, 1, 1,
0.05131074, 0.5190421, -1.005743, 1, 0, 0, 1, 1,
0.05181414, 1.0749, 0.5715757, 1, 0, 0, 1, 1,
0.05549943, -0.684254, 5.775313, 1, 0, 0, 1, 1,
0.05844846, 0.7170697, -1.108827, 1, 0, 0, 1, 1,
0.06177332, 0.7918461, -0.9756283, 0, 0, 0, 1, 1,
0.06286313, 0.5411597, -1.781763, 0, 0, 0, 1, 1,
0.06345385, 0.1268865, 0.0221923, 0, 0, 0, 1, 1,
0.06590013, -0.2425812, 2.424441, 0, 0, 0, 1, 1,
0.06765111, -1.074157, 4.788957, 0, 0, 0, 1, 1,
0.06795081, 1.363111, -0.5445369, 0, 0, 0, 1, 1,
0.06898668, 1.552675, 0.07865617, 0, 0, 0, 1, 1,
0.07036484, 0.5143815, 0.09381296, 1, 1, 1, 1, 1,
0.0707785, 0.4540916, 0.3497068, 1, 1, 1, 1, 1,
0.0710529, -1.641856, 0.6920717, 1, 1, 1, 1, 1,
0.07106239, 0.1738495, 0.9330015, 1, 1, 1, 1, 1,
0.07135331, 0.6310838, 0.63287, 1, 1, 1, 1, 1,
0.07184705, -0.2567993, 2.34678, 1, 1, 1, 1, 1,
0.07289546, -0.6460744, 3.186395, 1, 1, 1, 1, 1,
0.07618795, 0.02916629, 0.1249497, 1, 1, 1, 1, 1,
0.07677875, 0.4804312, -0.7279831, 1, 1, 1, 1, 1,
0.07992668, 0.5871805, -0.2876359, 1, 1, 1, 1, 1,
0.08003403, -0.7851413, 3.156949, 1, 1, 1, 1, 1,
0.08360989, 0.4761859, -0.5859921, 1, 1, 1, 1, 1,
0.08740716, -0.9142128, 2.356493, 1, 1, 1, 1, 1,
0.08797687, 1.244173, -0.5095325, 1, 1, 1, 1, 1,
0.08862519, -0.6037011, 2.913045, 1, 1, 1, 1, 1,
0.08914995, -1.016753, 3.7356, 0, 0, 1, 1, 1,
0.08990104, -0.2948571, 2.590435, 1, 0, 0, 1, 1,
0.09516286, 0.04541725, 1.629959, 1, 0, 0, 1, 1,
0.09589007, -1.587961, 4.9625, 1, 0, 0, 1, 1,
0.1011519, -0.4656111, 2.4809, 1, 0, 0, 1, 1,
0.1150326, 0.3454761, 1.570668, 1, 0, 0, 1, 1,
0.1152403, 0.4303763, 0.199869, 0, 0, 0, 1, 1,
0.1193767, 0.1614153, 0.04368944, 0, 0, 0, 1, 1,
0.1222236, -0.1163327, 2.68493, 0, 0, 0, 1, 1,
0.1255877, -1.252293, 2.706552, 0, 0, 0, 1, 1,
0.1263391, -0.109095, 2.94212, 0, 0, 0, 1, 1,
0.1286249, 1.360368, -0.6564656, 0, 0, 0, 1, 1,
0.132846, -0.6928701, 3.06217, 0, 0, 0, 1, 1,
0.1371897, -1.118744, 3.315967, 1, 1, 1, 1, 1,
0.1440188, 0.8485916, -0.5301124, 1, 1, 1, 1, 1,
0.1488376, 0.3356531, 0.8262001, 1, 1, 1, 1, 1,
0.1503147, -0.5132538, 3.536273, 1, 1, 1, 1, 1,
0.1508285, 0.5437011, -1.042668, 1, 1, 1, 1, 1,
0.153061, -0.00451835, 0.5132275, 1, 1, 1, 1, 1,
0.155801, -1.71288, 2.442589, 1, 1, 1, 1, 1,
0.1562882, 0.0178228, 0.4119227, 1, 1, 1, 1, 1,
0.1587674, 0.4379293, 0.2657846, 1, 1, 1, 1, 1,
0.1591397, -0.7012936, 1.840586, 1, 1, 1, 1, 1,
0.1683626, -1.829563, 4.998244, 1, 1, 1, 1, 1,
0.169705, -0.7449657, 1.697252, 1, 1, 1, 1, 1,
0.1702538, -0.4985787, 2.054443, 1, 1, 1, 1, 1,
0.1704492, -0.9243757, 3.638767, 1, 1, 1, 1, 1,
0.1736951, 0.1269474, 2.235893, 1, 1, 1, 1, 1,
0.1771416, -0.6929203, 3.746239, 0, 0, 1, 1, 1,
0.1775302, -0.1992579, 4.083177, 1, 0, 0, 1, 1,
0.178045, 1.20907, -0.5452087, 1, 0, 0, 1, 1,
0.178749, -1.809088, 2.067682, 1, 0, 0, 1, 1,
0.1822762, 0.7115184, -0.4289854, 1, 0, 0, 1, 1,
0.184096, 0.3705502, -0.4537848, 1, 0, 0, 1, 1,
0.1870292, 0.8544821, 2.308679, 0, 0, 0, 1, 1,
0.190421, -0.2571002, 3.528535, 0, 0, 0, 1, 1,
0.1904382, -0.3542248, 2.76912, 0, 0, 0, 1, 1,
0.2052268, -0.336672, 1.524598, 0, 0, 0, 1, 1,
0.2057617, 0.68977, 1.275715, 0, 0, 0, 1, 1,
0.2060115, 2.089058, -1.891128, 0, 0, 0, 1, 1,
0.207256, -0.8655614, 3.873743, 0, 0, 0, 1, 1,
0.2081669, -0.1629038, 2.23392, 1, 1, 1, 1, 1,
0.2093564, 0.9868494, -0.8480201, 1, 1, 1, 1, 1,
0.2120524, -1.681579, 2.363196, 1, 1, 1, 1, 1,
0.2138241, 0.368214, 1.842622, 1, 1, 1, 1, 1,
0.2143431, 0.9641234, 0.4940165, 1, 1, 1, 1, 1,
0.2181287, 0.8865256, -0.1030267, 1, 1, 1, 1, 1,
0.2186698, 0.5451481, -1.353349, 1, 1, 1, 1, 1,
0.2222612, 1.628653, 0.5090677, 1, 1, 1, 1, 1,
0.2248648, -0.2229231, 1.826651, 1, 1, 1, 1, 1,
0.2268257, 0.3489385, -0.2709378, 1, 1, 1, 1, 1,
0.2283736, -1.59137, 4.274806, 1, 1, 1, 1, 1,
0.2323231, 0.7908427, -0.1675928, 1, 1, 1, 1, 1,
0.237146, -0.3090765, 1.946273, 1, 1, 1, 1, 1,
0.2408273, 0.3433666, 0.3723132, 1, 1, 1, 1, 1,
0.2416152, -0.6269754, 1.512903, 1, 1, 1, 1, 1,
0.2433131, -0.3999963, 2.841712, 0, 0, 1, 1, 1,
0.2437541, -0.4234048, 2.041678, 1, 0, 0, 1, 1,
0.2458804, -0.3034785, 2.565937, 1, 0, 0, 1, 1,
0.2483442, -2.096676, 4.604242, 1, 0, 0, 1, 1,
0.2497814, 1.920782, 0.4117081, 1, 0, 0, 1, 1,
0.2499209, -0.5616564, 3.217482, 1, 0, 0, 1, 1,
0.2509846, -0.6548942, 4.049545, 0, 0, 0, 1, 1,
0.2514812, 1.649027, 0.338599, 0, 0, 0, 1, 1,
0.2634844, -0.9025207, 2.981865, 0, 0, 0, 1, 1,
0.2665266, 1.014056, 0.6614232, 0, 0, 0, 1, 1,
0.2680764, 0.6611336, -0.7584836, 0, 0, 0, 1, 1,
0.2696517, 0.9393254, 0.3800601, 0, 0, 0, 1, 1,
0.2698313, 0.2131991, -0.007037709, 0, 0, 0, 1, 1,
0.2700885, -0.2655785, 1.723541, 1, 1, 1, 1, 1,
0.2708172, -1.005157, 3.496343, 1, 1, 1, 1, 1,
0.2740202, 0.2661555, -0.1187608, 1, 1, 1, 1, 1,
0.2960378, 0.9372063, 0.7195342, 1, 1, 1, 1, 1,
0.2994317, -2.133051, 0.6820748, 1, 1, 1, 1, 1,
0.3033877, -0.9702598, 1.444011, 1, 1, 1, 1, 1,
0.3039743, 1.222204, -0.9993036, 1, 1, 1, 1, 1,
0.3118069, -0.2268653, 3.486746, 1, 1, 1, 1, 1,
0.3137935, -0.3683925, 3.569378, 1, 1, 1, 1, 1,
0.3152447, 0.02830523, 1.519327, 1, 1, 1, 1, 1,
0.3164406, -0.7441401, 2.365031, 1, 1, 1, 1, 1,
0.3182728, -0.09271185, 0.752372, 1, 1, 1, 1, 1,
0.3198767, 0.3545675, 1.364672, 1, 1, 1, 1, 1,
0.3236686, -1.143728, 2.393247, 1, 1, 1, 1, 1,
0.3265741, -1.349263, 3.270471, 1, 1, 1, 1, 1,
0.3463808, -0.4699618, 3.048613, 0, 0, 1, 1, 1,
0.349756, -0.8632351, 4.2341, 1, 0, 0, 1, 1,
0.3514591, 0.6807315, 0.7522982, 1, 0, 0, 1, 1,
0.3550161, 0.03560018, -0.02949805, 1, 0, 0, 1, 1,
0.3556725, 1.779705, 1.684927, 1, 0, 0, 1, 1,
0.3565111, 0.9464898, 0.04100457, 1, 0, 0, 1, 1,
0.3573225, -2.278377, 3.42703, 0, 0, 0, 1, 1,
0.36271, 0.3230399, 1.17195, 0, 0, 0, 1, 1,
0.3637309, 0.5913165, -0.2247611, 0, 0, 0, 1, 1,
0.3690309, -1.248717, 2.125369, 0, 0, 0, 1, 1,
0.3695685, -1.159005, 3.153122, 0, 0, 0, 1, 1,
0.3701928, 0.8273641, 0.8166609, 0, 0, 0, 1, 1,
0.3743725, -0.02572807, 1.205112, 0, 0, 0, 1, 1,
0.3753528, 0.6771665, 0.9493608, 1, 1, 1, 1, 1,
0.3762257, 0.7716848, -0.06727199, 1, 1, 1, 1, 1,
0.379173, -1.117592, 2.204848, 1, 1, 1, 1, 1,
0.3839624, 1.146652, 0.03964752, 1, 1, 1, 1, 1,
0.3871372, 0.6485946, 0.4136467, 1, 1, 1, 1, 1,
0.3878014, -2.072014, 1.647505, 1, 1, 1, 1, 1,
0.3881836, 0.7544181, 0.3317878, 1, 1, 1, 1, 1,
0.3910534, 0.5689709, 0.266916, 1, 1, 1, 1, 1,
0.3924575, -0.2944716, 3.646103, 1, 1, 1, 1, 1,
0.3937078, -0.1848787, 3.032886, 1, 1, 1, 1, 1,
0.3958652, -0.1032049, 2.510831, 1, 1, 1, 1, 1,
0.3966702, 0.5570797, 0.3943109, 1, 1, 1, 1, 1,
0.4068339, -1.406313, 1.954686, 1, 1, 1, 1, 1,
0.4073532, -0.4735479, 3.857005, 1, 1, 1, 1, 1,
0.4081821, 0.4955626, 0.2482351, 1, 1, 1, 1, 1,
0.4149385, 1.224663, -0.1124943, 0, 0, 1, 1, 1,
0.4173186, 0.3063186, 2.188391, 1, 0, 0, 1, 1,
0.4205109, 0.3301816, 2.405061, 1, 0, 0, 1, 1,
0.4217883, -1.127284, 4.185431, 1, 0, 0, 1, 1,
0.4218162, 1.338648, 1.422265, 1, 0, 0, 1, 1,
0.4251925, -1.171237, 3.367568, 1, 0, 0, 1, 1,
0.4267352, 0.1958123, 0.9209158, 0, 0, 0, 1, 1,
0.4334954, -1.125892, 1.686208, 0, 0, 0, 1, 1,
0.4393703, 0.5050198, 1.15655, 0, 0, 0, 1, 1,
0.4399631, 1.157847, -0.9285227, 0, 0, 0, 1, 1,
0.4417143, -0.4011772, 2.805071, 0, 0, 0, 1, 1,
0.4435258, -0.9084089, 4.209507, 0, 0, 0, 1, 1,
0.4438795, 1.427044, 0.1285543, 0, 0, 0, 1, 1,
0.4442823, -0.3104378, 1.721403, 1, 1, 1, 1, 1,
0.4465532, 2.527329, -0.566744, 1, 1, 1, 1, 1,
0.4501728, -0.4249249, 2.593666, 1, 1, 1, 1, 1,
0.450296, -1.006084, 2.135589, 1, 1, 1, 1, 1,
0.4579986, -0.9415214, 4.026166, 1, 1, 1, 1, 1,
0.4586972, 0.9038706, 1.011469, 1, 1, 1, 1, 1,
0.4597757, 2.042843, 2.219991, 1, 1, 1, 1, 1,
0.4618069, -0.9497522, 4.206891, 1, 1, 1, 1, 1,
0.4665773, 0.6530201, 1.417943, 1, 1, 1, 1, 1,
0.4667917, -0.2750815, 2.489183, 1, 1, 1, 1, 1,
0.4669892, -0.1400998, 2.290493, 1, 1, 1, 1, 1,
0.4677355, 0.9647987, 0.5931323, 1, 1, 1, 1, 1,
0.4733067, -0.1832992, 2.777089, 1, 1, 1, 1, 1,
0.4767434, -0.03185197, 3.535045, 1, 1, 1, 1, 1,
0.4785059, 0.06744572, 1.472098, 1, 1, 1, 1, 1,
0.4830729, -1.006527, 4.168204, 0, 0, 1, 1, 1,
0.484114, -0.7302541, 2.806931, 1, 0, 0, 1, 1,
0.4856325, 0.2616801, 0.441727, 1, 0, 0, 1, 1,
0.4892791, 1.099954, -0.9434192, 1, 0, 0, 1, 1,
0.4926288, 0.7810197, 0.8471825, 1, 0, 0, 1, 1,
0.4960684, 1.267429, -0.7903655, 1, 0, 0, 1, 1,
0.5022508, 1.074667, 0.3418666, 0, 0, 0, 1, 1,
0.5023246, -1.264595, 2.849918, 0, 0, 0, 1, 1,
0.5035955, 1.007735, 1.790452, 0, 0, 0, 1, 1,
0.5069973, -1.93808, 1.647489, 0, 0, 0, 1, 1,
0.5107882, -0.158871, 1.64385, 0, 0, 0, 1, 1,
0.5126075, 1.185156, 0.1686, 0, 0, 0, 1, 1,
0.5137281, 1.344369, -0.422579, 0, 0, 0, 1, 1,
0.5217377, -1.657683, 3.407951, 1, 1, 1, 1, 1,
0.5219991, -0.4476454, 3.515341, 1, 1, 1, 1, 1,
0.5281283, 1.130937, 1.20236, 1, 1, 1, 1, 1,
0.5307908, 1.645864, 1.33192, 1, 1, 1, 1, 1,
0.5334847, 0.7288408, -0.2433581, 1, 1, 1, 1, 1,
0.53399, -2.123089, 2.679823, 1, 1, 1, 1, 1,
0.5340033, -1.265343, 1.790529, 1, 1, 1, 1, 1,
0.5388525, -0.1331594, -0.03522196, 1, 1, 1, 1, 1,
0.5415636, 0.3049286, 1.632514, 1, 1, 1, 1, 1,
0.5431721, -0.8843828, 2.235129, 1, 1, 1, 1, 1,
0.5480004, -0.4111229, 2.465703, 1, 1, 1, 1, 1,
0.5485293, 0.6948101, 1.695367, 1, 1, 1, 1, 1,
0.5489357, -0.2122461, 3.222898, 1, 1, 1, 1, 1,
0.5502536, 0.5655491, -0.1396046, 1, 1, 1, 1, 1,
0.5528748, -2.263943, 2.894567, 1, 1, 1, 1, 1,
0.5576996, -0.9174805, 1.880888, 0, 0, 1, 1, 1,
0.5579389, -1.293285, 1.868012, 1, 0, 0, 1, 1,
0.5581682, -0.9563419, 2.172309, 1, 0, 0, 1, 1,
0.5625541, -1.579883, 2.011563, 1, 0, 0, 1, 1,
0.5683411, 0.434786, 1.76379, 1, 0, 0, 1, 1,
0.5712209, -0.1213834, 2.280534, 1, 0, 0, 1, 1,
0.5772859, -0.04713894, 2.209482, 0, 0, 0, 1, 1,
0.579722, -0.1294075, 3.971765, 0, 0, 0, 1, 1,
0.5818588, 1.152837, 0.3597828, 0, 0, 0, 1, 1,
0.5838361, 0.1546951, 2.814315, 0, 0, 0, 1, 1,
0.5875617, 0.514015, 1.154191, 0, 0, 0, 1, 1,
0.5890585, 0.9193087, -1.619177, 0, 0, 0, 1, 1,
0.5898068, 0.6805356, 0.3994456, 0, 0, 0, 1, 1,
0.5941046, 1.200901, 0.2276073, 1, 1, 1, 1, 1,
0.5942857, 1.031779, 0.6914755, 1, 1, 1, 1, 1,
0.6048809, -0.3804863, 2.135895, 1, 1, 1, 1, 1,
0.6159244, -1.252656, 1.889899, 1, 1, 1, 1, 1,
0.6193642, 0.7400658, 0.5107002, 1, 1, 1, 1, 1,
0.6210417, 0.2840921, 0.9899198, 1, 1, 1, 1, 1,
0.6263915, 1.326628, -0.01666063, 1, 1, 1, 1, 1,
0.6302642, -0.3386669, 2.770511, 1, 1, 1, 1, 1,
0.6427845, -0.7398422, 1.533876, 1, 1, 1, 1, 1,
0.6557802, -1.329878, 3.049361, 1, 1, 1, 1, 1,
0.6567216, -0.1058907, 1.725389, 1, 1, 1, 1, 1,
0.6615354, -0.1090809, 2.152695, 1, 1, 1, 1, 1,
0.6628595, -1.01583, 3.030207, 1, 1, 1, 1, 1,
0.6636807, -1.975352, 3.366961, 1, 1, 1, 1, 1,
0.6712798, -0.1700177, 2.157776, 1, 1, 1, 1, 1,
0.6862186, -1.108142, 3.339243, 0, 0, 1, 1, 1,
0.6898116, -1.256463, 2.381452, 1, 0, 0, 1, 1,
0.6904221, 0.4668234, 3.030882, 1, 0, 0, 1, 1,
0.6953665, 0.5057086, 1.577891, 1, 0, 0, 1, 1,
0.6976008, -1.528831, 5.414175, 1, 0, 0, 1, 1,
0.70468, -0.5810013, 1.816491, 1, 0, 0, 1, 1,
0.7075024, -0.7516888, 3.796871, 0, 0, 0, 1, 1,
0.7166573, -1.291651, 3.706605, 0, 0, 0, 1, 1,
0.7177939, 0.4868313, 1.872762, 0, 0, 0, 1, 1,
0.718163, 0.2819631, -0.06095265, 0, 0, 0, 1, 1,
0.7214579, 1.003674, 0.1864115, 0, 0, 0, 1, 1,
0.7309408, -1.119325, 3.905016, 0, 0, 0, 1, 1,
0.7326667, -1.181508, 2.349442, 0, 0, 0, 1, 1,
0.7330275, 0.3068911, 2.058728, 1, 1, 1, 1, 1,
0.7384016, -0.3259421, 2.783035, 1, 1, 1, 1, 1,
0.7397416, 1.615228, 0.304984, 1, 1, 1, 1, 1,
0.7438665, 1.029035, 0.3632148, 1, 1, 1, 1, 1,
0.7469507, -1.07156, 0.6677333, 1, 1, 1, 1, 1,
0.7546434, -0.8217399, 1.41145, 1, 1, 1, 1, 1,
0.7571896, -0.04301494, 1.395315, 1, 1, 1, 1, 1,
0.7587912, 0.4081164, 1.063575, 1, 1, 1, 1, 1,
0.7592538, -0.3216234, 1.898005, 1, 1, 1, 1, 1,
0.7598005, 0.2536232, 1.409158, 1, 1, 1, 1, 1,
0.7630669, -0.200318, 2.754927, 1, 1, 1, 1, 1,
0.7679477, 0.4884993, -0.06926883, 1, 1, 1, 1, 1,
0.7729918, 0.5066702, 0.4853493, 1, 1, 1, 1, 1,
0.7730834, -0.2552638, 3.317887, 1, 1, 1, 1, 1,
0.784909, -0.03140986, 1.81721, 1, 1, 1, 1, 1,
0.7906917, 0.154446, -1.386432, 0, 0, 1, 1, 1,
0.7909312, -0.6867324, 1.87324, 1, 0, 0, 1, 1,
0.7920582, -0.932726, 3.027504, 1, 0, 0, 1, 1,
0.7921845, 2.159118, -0.2257128, 1, 0, 0, 1, 1,
0.800324, -0.07782624, 1.621795, 1, 0, 0, 1, 1,
0.8051091, -0.3613029, 1.938758, 1, 0, 0, 1, 1,
0.8063017, 1.453385, 0.6961842, 0, 0, 0, 1, 1,
0.8073391, -0.9585617, 3.433293, 0, 0, 0, 1, 1,
0.8082767, -0.3401292, 1.045056, 0, 0, 0, 1, 1,
0.8111655, 0.3640001, 2.329761, 0, 0, 0, 1, 1,
0.8115413, 0.08290245, 2.017391, 0, 0, 0, 1, 1,
0.8125462, 0.2418077, 1.109984, 0, 0, 0, 1, 1,
0.8150266, 0.8847302, 0.2950796, 0, 0, 0, 1, 1,
0.8176236, -0.5368577, 3.839839, 1, 1, 1, 1, 1,
0.8211027, 1.327529, 0.3404192, 1, 1, 1, 1, 1,
0.8236052, 0.1082091, 2.627946, 1, 1, 1, 1, 1,
0.8282394, 0.1714566, 1.133982, 1, 1, 1, 1, 1,
0.8318476, -0.6892114, 3.412422, 1, 1, 1, 1, 1,
0.8322789, -0.001499673, 1.152913, 1, 1, 1, 1, 1,
0.8367511, -0.9630926, 2.513214, 1, 1, 1, 1, 1,
0.8399404, -0.8645365, 3.351509, 1, 1, 1, 1, 1,
0.8441617, -2.176208, 5.418408, 1, 1, 1, 1, 1,
0.8465631, -0.2405566, 2.473896, 1, 1, 1, 1, 1,
0.8470051, 0.94115, 3.361097, 1, 1, 1, 1, 1,
0.8483555, -0.3786057, 0.6721274, 1, 1, 1, 1, 1,
0.8486829, 0.46033, 1.260625, 1, 1, 1, 1, 1,
0.8508578, 0.1659107, 0.3086555, 1, 1, 1, 1, 1,
0.8509923, -0.4148251, 1.141803, 1, 1, 1, 1, 1,
0.8535627, 1.423205, 1.935565, 0, 0, 1, 1, 1,
0.8544905, -0.7785105, 1.830406, 1, 0, 0, 1, 1,
0.8546791, -0.8812369, 3.676047, 1, 0, 0, 1, 1,
0.8573124, -0.4842372, 1.050254, 1, 0, 0, 1, 1,
0.8587942, 1.44619, 1.262741, 1, 0, 0, 1, 1,
0.8602589, 1.041758, -0.266437, 1, 0, 0, 1, 1,
0.8606191, -1.092756, 3.7118, 0, 0, 0, 1, 1,
0.864168, 1.320368, -0.5744044, 0, 0, 0, 1, 1,
0.8650644, -1.823348, 2.522018, 0, 0, 0, 1, 1,
0.8706239, -1.010298, 1.180858, 0, 0, 0, 1, 1,
0.8802082, -1.01703, 3.308753, 0, 0, 0, 1, 1,
0.8889053, -1.623269, 3.000175, 0, 0, 0, 1, 1,
0.893241, -0.5691786, 3.337366, 0, 0, 0, 1, 1,
0.8935708, -1.003981, 1.77079, 1, 1, 1, 1, 1,
0.9003806, 1.201117, -0.4146443, 1, 1, 1, 1, 1,
0.9038095, 0.1260777, 0.5967991, 1, 1, 1, 1, 1,
0.9107158, -1.04895, 2.246618, 1, 1, 1, 1, 1,
0.9124755, -0.8632601, 1.295873, 1, 1, 1, 1, 1,
0.9152876, 0.8437604, 2.395164, 1, 1, 1, 1, 1,
0.9171572, 0.6421968, -0.1576487, 1, 1, 1, 1, 1,
0.923184, 0.9418141, 0.8122622, 1, 1, 1, 1, 1,
0.9246747, -0.3056758, 2.090001, 1, 1, 1, 1, 1,
0.9271572, 1.435715, -0.1010974, 1, 1, 1, 1, 1,
0.9281939, 0.4520274, -0.20521, 1, 1, 1, 1, 1,
0.9303616, 0.3481314, 2.425924, 1, 1, 1, 1, 1,
0.9308408, -0.9066759, 4.972729, 1, 1, 1, 1, 1,
0.9493705, -0.7077706, 2.292511, 1, 1, 1, 1, 1,
0.9498926, -0.4707143, -1.675274, 1, 1, 1, 1, 1,
0.9512002, -1.609583, 0.4119747, 0, 0, 1, 1, 1,
0.9512185, -1.996705, 2.337173, 1, 0, 0, 1, 1,
0.952253, 0.2441993, 1.211726, 1, 0, 0, 1, 1,
0.9531854, 1.629246, -0.5573269, 1, 0, 0, 1, 1,
0.9541664, -1.900648, 2.635389, 1, 0, 0, 1, 1,
0.9549497, -0.2169572, -0.2809953, 1, 0, 0, 1, 1,
0.9588498, 0.4962465, 0.3144589, 0, 0, 0, 1, 1,
0.9593648, -0.6600174, 1.902338, 0, 0, 0, 1, 1,
0.9604588, 1.138829, 0.4980403, 0, 0, 0, 1, 1,
0.9626833, -0.2611132, 2.301976, 0, 0, 0, 1, 1,
0.9646571, -2.590098, 3.549893, 0, 0, 0, 1, 1,
0.9668772, 1.605562, 0.1289705, 0, 0, 0, 1, 1,
0.9670239, -0.1049035, 1.94984, 0, 0, 0, 1, 1,
0.9869508, 0.1376039, 1.505519, 1, 1, 1, 1, 1,
0.9917398, 0.2244138, 1.523849, 1, 1, 1, 1, 1,
0.9989875, -0.5591888, 0.5393692, 1, 1, 1, 1, 1,
1.009862, -0.5146716, 1.379084, 1, 1, 1, 1, 1,
1.015165, 0.351851, 1.557569, 1, 1, 1, 1, 1,
1.019409, -0.460215, 2.104951, 1, 1, 1, 1, 1,
1.022248, 0.524693, 0.5413783, 1, 1, 1, 1, 1,
1.022432, 0.8191034, 0.2555116, 1, 1, 1, 1, 1,
1.025167, 0.1973063, 1.165421, 1, 1, 1, 1, 1,
1.025383, -1.192895, 3.187549, 1, 1, 1, 1, 1,
1.036031, 1.620819, -0.1938827, 1, 1, 1, 1, 1,
1.041711, -0.8877836, 2.052595, 1, 1, 1, 1, 1,
1.052311, 0.3056112, 1.269338, 1, 1, 1, 1, 1,
1.054504, -0.7699186, 3.387637, 1, 1, 1, 1, 1,
1.057636, -0.8795141, 1.73307, 1, 1, 1, 1, 1,
1.061763, -0.9550043, 2.350623, 0, 0, 1, 1, 1,
1.064527, 0.07836245, 2.292259, 1, 0, 0, 1, 1,
1.066938, -0.7504497, 1.467646, 1, 0, 0, 1, 1,
1.081677, 0.01697507, 1.127604, 1, 0, 0, 1, 1,
1.08939, -0.02144094, 3.045361, 1, 0, 0, 1, 1,
1.089939, -1.031463, 4.184113, 1, 0, 0, 1, 1,
1.096233, -0.1876823, 1.981954, 0, 0, 0, 1, 1,
1.097244, 0.5941738, 1.610824, 0, 0, 0, 1, 1,
1.098063, -0.5749877, 2.78691, 0, 0, 0, 1, 1,
1.099575, -0.4401376, 1.664569, 0, 0, 0, 1, 1,
1.107301, -2.287504, 2.515119, 0, 0, 0, 1, 1,
1.110811, 0.8398163, 0.5764567, 0, 0, 0, 1, 1,
1.11245, 1.337587, 0.996424, 0, 0, 0, 1, 1,
1.113173, -0.791425, 1.597608, 1, 1, 1, 1, 1,
1.11435, -0.6760879, 2.694925, 1, 1, 1, 1, 1,
1.117733, -0.3470274, 2.746163, 1, 1, 1, 1, 1,
1.119217, -0.7526846, 0.1200125, 1, 1, 1, 1, 1,
1.121193, -0.9244038, 2.533355, 1, 1, 1, 1, 1,
1.126853, -0.8849127, 2.87751, 1, 1, 1, 1, 1,
1.131227, 0.7893324, 0.988831, 1, 1, 1, 1, 1,
1.136336, -1.134132, 2.275652, 1, 1, 1, 1, 1,
1.137241, 0.1017897, 1.488164, 1, 1, 1, 1, 1,
1.139336, 1.260356, 0.8007017, 1, 1, 1, 1, 1,
1.14816, 1.250824, 0.4114964, 1, 1, 1, 1, 1,
1.151416, -2.275993, 3.218582, 1, 1, 1, 1, 1,
1.152768, -1.782969, 3.18017, 1, 1, 1, 1, 1,
1.163472, -0.3340943, 2.91632, 1, 1, 1, 1, 1,
1.170667, 1.023711, 1.268706, 1, 1, 1, 1, 1,
1.174042, -0.1283749, 2.209579, 0, 0, 1, 1, 1,
1.174184, 0.4707525, 2.96211, 1, 0, 0, 1, 1,
1.174541, -0.8426791, 3.009881, 1, 0, 0, 1, 1,
1.17458, 1.982664, -0.5881217, 1, 0, 0, 1, 1,
1.174891, 1.392148, 0.549503, 1, 0, 0, 1, 1,
1.190895, -0.5280293, 2.023702, 1, 0, 0, 1, 1,
1.192524, 0.9817961, 0.8282709, 0, 0, 0, 1, 1,
1.194222, -1.842969, 2.487045, 0, 0, 0, 1, 1,
1.204723, -1.47131, 0.2884178, 0, 0, 0, 1, 1,
1.211257, -0.669472, 3.56425, 0, 0, 0, 1, 1,
1.215058, -0.3117014, 0.7974474, 0, 0, 0, 1, 1,
1.216843, -0.2807155, 0.6963357, 0, 0, 0, 1, 1,
1.225918, -0.2851624, 1.67424, 0, 0, 0, 1, 1,
1.231475, -1.411699, 2.444038, 1, 1, 1, 1, 1,
1.232862, 0.5893286, -0.8810654, 1, 1, 1, 1, 1,
1.243828, -0.5248347, 0.7452826, 1, 1, 1, 1, 1,
1.245985, -0.9831489, 2.201315, 1, 1, 1, 1, 1,
1.24712, 0.01381456, 2.159993, 1, 1, 1, 1, 1,
1.250514, -0.3379005, 1.733695, 1, 1, 1, 1, 1,
1.253873, 1.598639, -0.5781558, 1, 1, 1, 1, 1,
1.256628, 2.561284, -0.7899252, 1, 1, 1, 1, 1,
1.261367, 0.2569233, 2.681049, 1, 1, 1, 1, 1,
1.262488, -0.5190214, 0.9640734, 1, 1, 1, 1, 1,
1.26313, -0.5013974, 0.1033114, 1, 1, 1, 1, 1,
1.263856, -0.117771, 3.520282, 1, 1, 1, 1, 1,
1.264482, -0.01063621, 2.784765, 1, 1, 1, 1, 1,
1.272514, 1.354494, 1.404384, 1, 1, 1, 1, 1,
1.275157, -0.0868078, 1.690586, 1, 1, 1, 1, 1,
1.285304, -0.8961403, 3.070853, 0, 0, 1, 1, 1,
1.286171, 1.464109, -0.5866742, 1, 0, 0, 1, 1,
1.28894, 1.325421, 1.234729, 1, 0, 0, 1, 1,
1.305899, 1.236782, 1.336653, 1, 0, 0, 1, 1,
1.311102, 0.5467758, 1.053432, 1, 0, 0, 1, 1,
1.320118, 0.7753657, -0.8550636, 1, 0, 0, 1, 1,
1.331086, 0.2617932, 1.959913, 0, 0, 0, 1, 1,
1.333957, -0.8017744, 0.4352691, 0, 0, 0, 1, 1,
1.342289, -1.218097, 2.445008, 0, 0, 0, 1, 1,
1.345308, 0.6486923, 2.065518, 0, 0, 0, 1, 1,
1.356136, 0.7128361, 1.628132, 0, 0, 0, 1, 1,
1.362005, 2.120738, -0.0337472, 0, 0, 0, 1, 1,
1.363173, -0.2672545, 0.8102206, 0, 0, 0, 1, 1,
1.364887, 0.8324589, 2.682181, 1, 1, 1, 1, 1,
1.369886, -0.7244405, 2.434635, 1, 1, 1, 1, 1,
1.378939, 0.123925, 1.910413, 1, 1, 1, 1, 1,
1.406106, 0.09420641, 2.464324, 1, 1, 1, 1, 1,
1.408612, -0.1268732, 0.6297357, 1, 1, 1, 1, 1,
1.414378, -0.914433, 2.878716, 1, 1, 1, 1, 1,
1.414487, -0.3574499, 2.77746, 1, 1, 1, 1, 1,
1.426348, -0.1351531, 2.788602, 1, 1, 1, 1, 1,
1.433684, -1.786148, 2.590405, 1, 1, 1, 1, 1,
1.446969, -1.321973, 3.600469, 1, 1, 1, 1, 1,
1.451929, -0.588242, 2.344903, 1, 1, 1, 1, 1,
1.461833, 2.130874, 3.212536, 1, 1, 1, 1, 1,
1.465693, -0.8550208, 1.729163, 1, 1, 1, 1, 1,
1.474006, -0.6014888, 3.050376, 1, 1, 1, 1, 1,
1.488643, -0.9794728, 2.730193, 1, 1, 1, 1, 1,
1.491899, 2.158534, -1.155755, 0, 0, 1, 1, 1,
1.493241, -0.8128721, 1.340313, 1, 0, 0, 1, 1,
1.508999, -0.2487049, 3.090276, 1, 0, 0, 1, 1,
1.511807, 0.5335828, 0.670823, 1, 0, 0, 1, 1,
1.516254, -0.1498152, 0.3326755, 1, 0, 0, 1, 1,
1.536136, -0.7581307, 1.788667, 1, 0, 0, 1, 1,
1.537206, -0.7520419, 0.6105569, 0, 0, 0, 1, 1,
1.541975, -0.7159038, 2.54668, 0, 0, 0, 1, 1,
1.547365, 0.8608004, 2.686371, 0, 0, 0, 1, 1,
1.548877, -1.386578, 1.896721, 0, 0, 0, 1, 1,
1.559599, -0.8364919, 2.079396, 0, 0, 0, 1, 1,
1.568831, -1.762471, 3.761866, 0, 0, 0, 1, 1,
1.571639, -0.2908976, 0.9615374, 0, 0, 0, 1, 1,
1.572826, -1.649796, 2.129018, 1, 1, 1, 1, 1,
1.575645, 0.01133516, 2.605453, 1, 1, 1, 1, 1,
1.586002, -0.2872955, 0.2429121, 1, 1, 1, 1, 1,
1.589363, -0.4708844, 1.826465, 1, 1, 1, 1, 1,
1.593167, -2.434837, 3.429779, 1, 1, 1, 1, 1,
1.595745, -0.5699183, 0.9247727, 1, 1, 1, 1, 1,
1.602491, 0.5958013, -0.10646, 1, 1, 1, 1, 1,
1.613861, 1.097579, -0.5822894, 1, 1, 1, 1, 1,
1.623015, 0.07625028, 1.784889, 1, 1, 1, 1, 1,
1.626119, 0.9813378, 1.523476, 1, 1, 1, 1, 1,
1.628938, 0.4122431, 1.39958, 1, 1, 1, 1, 1,
1.643936, 1.294284, 0.6691554, 1, 1, 1, 1, 1,
1.655444, 0.2323848, 0.9292972, 1, 1, 1, 1, 1,
1.678537, 0.4019744, 1.336988, 1, 1, 1, 1, 1,
1.680237, -0.04438152, 1.336917, 1, 1, 1, 1, 1,
1.705793, 0.4560348, 3.679333, 0, 0, 1, 1, 1,
1.729899, 0.4892121, 0.6677743, 1, 0, 0, 1, 1,
1.740299, 0.04693944, 1.091087, 1, 0, 0, 1, 1,
1.751702, -0.2894812, 3.180073, 1, 0, 0, 1, 1,
1.776181, -1.895522, 0.8240309, 1, 0, 0, 1, 1,
1.781809, -0.4505902, 2.439853, 1, 0, 0, 1, 1,
1.783445, 0.5536955, 0.4328374, 0, 0, 0, 1, 1,
1.785965, -0.2731697, 1.302805, 0, 0, 0, 1, 1,
1.793034, -0.5680744, 1.024455, 0, 0, 0, 1, 1,
1.817488, 2.174148, 0.7204156, 0, 0, 0, 1, 1,
1.820755, -0.967399, 2.931071, 0, 0, 0, 1, 1,
1.846863, -1.883981, 0.9142495, 0, 0, 0, 1, 1,
1.848057, -1.482093, 1.35523, 0, 0, 0, 1, 1,
1.848673, 0.4020682, 2.166177, 1, 1, 1, 1, 1,
1.849121, 0.7165187, 1.333705, 1, 1, 1, 1, 1,
1.862926, 0.8636249, 0.6136138, 1, 1, 1, 1, 1,
1.892112, -0.543229, 2.412858, 1, 1, 1, 1, 1,
1.896953, -0.8249066, 1.622094, 1, 1, 1, 1, 1,
1.905333, -0.4625716, 1.442325, 1, 1, 1, 1, 1,
1.942054, 0.775213, 0.8123847, 1, 1, 1, 1, 1,
1.947605, -0.9388804, 2.867286, 1, 1, 1, 1, 1,
1.958524, -1.05362, 2.200156, 1, 1, 1, 1, 1,
1.968501, -0.4800952, 1.496864, 1, 1, 1, 1, 1,
1.9706, 0.5223029, 1.489224, 1, 1, 1, 1, 1,
1.989806, -0.4184416, 0.5597829, 1, 1, 1, 1, 1,
2.017717, -0.8095908, 3.707833, 1, 1, 1, 1, 1,
2.032145, -1.411229, 2.234402, 1, 1, 1, 1, 1,
2.045733, 0.1896516, 2.777532, 1, 1, 1, 1, 1,
2.105101, -0.09415781, -0.9467852, 0, 0, 1, 1, 1,
2.116325, -0.04793583, 0.9911677, 1, 0, 0, 1, 1,
2.129473, -1.173874, 1.214511, 1, 0, 0, 1, 1,
2.131955, 1.163488, 2.25005, 1, 0, 0, 1, 1,
2.144621, -0.01384627, 0.4914487, 1, 0, 0, 1, 1,
2.152431, 0.3796335, 3.640247, 1, 0, 0, 1, 1,
2.167757, 0.1634219, 4.198431, 0, 0, 0, 1, 1,
2.195599, 1.576543, 0.3769166, 0, 0, 0, 1, 1,
2.276937, -1.034865, 4.347663, 0, 0, 0, 1, 1,
2.288005, 0.728495, 0.5402593, 0, 0, 0, 1, 1,
2.442492, 1.163008, 1.980815, 0, 0, 0, 1, 1,
2.460935, -0.2062215, 1.930545, 0, 0, 0, 1, 1,
2.472903, 0.06736891, 1.124994, 0, 0, 0, 1, 1,
2.487192, -1.340763, 2.49092, 1, 1, 1, 1, 1,
2.490987, 0.5486915, 2.022178, 1, 1, 1, 1, 1,
2.542849, -2.376887, 2.418503, 1, 1, 1, 1, 1,
2.586754, -1.205021, 1.569811, 1, 1, 1, 1, 1,
2.746413, 0.2479792, 0.3322948, 1, 1, 1, 1, 1,
3.310882, 0.6249847, 0.485281, 1, 1, 1, 1, 1,
3.799543, 1.508347, 2.258244, 1, 1, 1, 1, 1
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
var radius = 9.882621;
var distance = 34.71228;
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
mvMatrix.translate( -0.3304057, -0.01120174, 0.01411653 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.71228);
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
