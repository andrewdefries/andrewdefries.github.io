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
-3.327631, 1.052122, 0.7107955, 1, 0, 0, 1,
-3.20101, 0.7189084, 0.08704577, 1, 0.007843138, 0, 1,
-2.769132, -0.5410781, -3.720009, 1, 0.01176471, 0, 1,
-2.76343, 0.3172142, -3.267722, 1, 0.01960784, 0, 1,
-2.606369, -0.09284709, -3.006749, 1, 0.02352941, 0, 1,
-2.550519, -1.955856, -0.65617, 1, 0.03137255, 0, 1,
-2.505786, -0.388618, -2.146302, 1, 0.03529412, 0, 1,
-2.469638, -0.2921818, -2.328175, 1, 0.04313726, 0, 1,
-2.446637, -0.8529049, -2.891063, 1, 0.04705882, 0, 1,
-2.415701, 0.4421628, -1.807876, 1, 0.05490196, 0, 1,
-2.401258, -0.000835659, -2.468765, 1, 0.05882353, 0, 1,
-2.349245, 0.08248363, -1.189274, 1, 0.06666667, 0, 1,
-2.327864, -0.5941009, -2.613629, 1, 0.07058824, 0, 1,
-2.199376, 0.369291, -1.23927, 1, 0.07843138, 0, 1,
-2.144093, -0.1377888, 0.1377367, 1, 0.08235294, 0, 1,
-2.14139, -0.001443406, -2.218381, 1, 0.09019608, 0, 1,
-2.113158, 0.7143975, -2.229963, 1, 0.09411765, 0, 1,
-2.070183, 0.3435946, -1.514463, 1, 0.1019608, 0, 1,
-2.037179, 1.038185, -0.4427443, 1, 0.1098039, 0, 1,
-2.021231, -0.8886065, -3.900541, 1, 0.1137255, 0, 1,
-2.013822, -0.02371655, -1.005199, 1, 0.1215686, 0, 1,
-2.007682, 1.248199, -0.4121166, 1, 0.1254902, 0, 1,
-1.977469, -0.2257138, -2.434905, 1, 0.1333333, 0, 1,
-1.960634, -1.507002, -1.86204, 1, 0.1372549, 0, 1,
-1.898061, -1.375805, -2.72389, 1, 0.145098, 0, 1,
-1.889895, -1.001128, -1.073438, 1, 0.1490196, 0, 1,
-1.889633, -0.4989104, -1.653535, 1, 0.1568628, 0, 1,
-1.865293, 0.7650339, -1.392731, 1, 0.1607843, 0, 1,
-1.863253, 0.5944778, -0.9204207, 1, 0.1686275, 0, 1,
-1.845044, -1.042495, -3.979316, 1, 0.172549, 0, 1,
-1.789322, 1.64363, -1.023256, 1, 0.1803922, 0, 1,
-1.773994, 0.3397943, 0.1170904, 1, 0.1843137, 0, 1,
-1.772029, -0.2006625, -1.882192, 1, 0.1921569, 0, 1,
-1.74715, 0.162233, -1.964392, 1, 0.1960784, 0, 1,
-1.736782, 0.2033012, -1.73252, 1, 0.2039216, 0, 1,
-1.733886, -0.2595218, -3.079842, 1, 0.2117647, 0, 1,
-1.72566, -0.3323277, -0.6570176, 1, 0.2156863, 0, 1,
-1.717129, -0.2234593, -1.871415, 1, 0.2235294, 0, 1,
-1.705222, 1.029645, -0.5994974, 1, 0.227451, 0, 1,
-1.702855, 1.490951, -1.25725, 1, 0.2352941, 0, 1,
-1.68847, -0.9947755, -2.327783, 1, 0.2392157, 0, 1,
-1.679362, -0.02111981, -1.640715, 1, 0.2470588, 0, 1,
-1.67802, -0.6734764, -1.004995, 1, 0.2509804, 0, 1,
-1.672265, -0.2554404, -0.3096521, 1, 0.2588235, 0, 1,
-1.643349, 0.5656839, -1.020025, 1, 0.2627451, 0, 1,
-1.635204, 0.08686972, -1.652542, 1, 0.2705882, 0, 1,
-1.630972, -0.2269345, -2.958092, 1, 0.2745098, 0, 1,
-1.608533, -2.174901, -3.207682, 1, 0.282353, 0, 1,
-1.607177, -0.84669, -1.723149, 1, 0.2862745, 0, 1,
-1.597235, 0.1498444, -0.6259501, 1, 0.2941177, 0, 1,
-1.593031, 1.015466, -0.5262364, 1, 0.3019608, 0, 1,
-1.58542, 0.6635597, -0.2366689, 1, 0.3058824, 0, 1,
-1.582558, -1.627087, -1.807605, 1, 0.3137255, 0, 1,
-1.575073, -0.1104016, -1.648411, 1, 0.3176471, 0, 1,
-1.55895, 1.171351, -1.854232, 1, 0.3254902, 0, 1,
-1.554613, 0.1318445, -0.9799343, 1, 0.3294118, 0, 1,
-1.551838, -1.987627, -4.039423, 1, 0.3372549, 0, 1,
-1.551446, -1.912577, -2.156723, 1, 0.3411765, 0, 1,
-1.544818, 0.8941371, 0.7986255, 1, 0.3490196, 0, 1,
-1.542888, 0.2292515, -1.7071, 1, 0.3529412, 0, 1,
-1.532754, 1.079731, -0.1101958, 1, 0.3607843, 0, 1,
-1.526207, -0.5713864, -0.7529417, 1, 0.3647059, 0, 1,
-1.51491, 1.563744, -3.794507, 1, 0.372549, 0, 1,
-1.480375, -0.3350246, -1.044262, 1, 0.3764706, 0, 1,
-1.479346, 0.9646366, -2.699576, 1, 0.3843137, 0, 1,
-1.476261, 0.7376311, -1.670373, 1, 0.3882353, 0, 1,
-1.473737, -0.2243025, -0.4429829, 1, 0.3960784, 0, 1,
-1.462538, -1.351743, -3.558172, 1, 0.4039216, 0, 1,
-1.460085, 0.9039509, -0.04649072, 1, 0.4078431, 0, 1,
-1.456984, -1.104483, -1.579389, 1, 0.4156863, 0, 1,
-1.447858, 1.368, -0.7423137, 1, 0.4196078, 0, 1,
-1.437551, 1.05122, 1.161991, 1, 0.427451, 0, 1,
-1.435944, 0.3087052, -0.4002525, 1, 0.4313726, 0, 1,
-1.426808, -0.6893629, -1.044035, 1, 0.4392157, 0, 1,
-1.422569, 1.545932, -0.6134247, 1, 0.4431373, 0, 1,
-1.421447, -0.7508571, -1.882276, 1, 0.4509804, 0, 1,
-1.420342, 0.5297374, -0.162989, 1, 0.454902, 0, 1,
-1.416403, -0.3927617, -2.608662, 1, 0.4627451, 0, 1,
-1.41151, 0.1852058, -1.199104, 1, 0.4666667, 0, 1,
-1.407102, 2.005034, -0.3813915, 1, 0.4745098, 0, 1,
-1.402914, 1.107825, -0.02805263, 1, 0.4784314, 0, 1,
-1.39421, -1.018823, -1.223235, 1, 0.4862745, 0, 1,
-1.378429, -0.1740147, -1.147525, 1, 0.4901961, 0, 1,
-1.376441, -0.9010513, -2.429812, 1, 0.4980392, 0, 1,
-1.371742, 0.9944936, -0.3568955, 1, 0.5058824, 0, 1,
-1.354895, 2.052095, 0.3208931, 1, 0.509804, 0, 1,
-1.342147, -0.1685475, -2.236315, 1, 0.5176471, 0, 1,
-1.340026, 0.4858354, -0.7813668, 1, 0.5215687, 0, 1,
-1.339712, 0.4752883, -0.8269735, 1, 0.5294118, 0, 1,
-1.319691, -1.770357, 0.5481445, 1, 0.5333334, 0, 1,
-1.318121, 0.6649617, 0.3877782, 1, 0.5411765, 0, 1,
-1.31477, -1.066364, -3.867505, 1, 0.5450981, 0, 1,
-1.298358, 0.08844692, -0.9310154, 1, 0.5529412, 0, 1,
-1.282198, 0.2864057, -1.039094, 1, 0.5568628, 0, 1,
-1.282059, 1.592753, 0.5054158, 1, 0.5647059, 0, 1,
-1.279317, 0.2041091, 0.6967047, 1, 0.5686275, 0, 1,
-1.2763, -0.4815021, -1.226733, 1, 0.5764706, 0, 1,
-1.273282, -0.6776165, -1.325773, 1, 0.5803922, 0, 1,
-1.271616, 0.7097436, -1.804516, 1, 0.5882353, 0, 1,
-1.266006, 0.5108241, -2.00661, 1, 0.5921569, 0, 1,
-1.26574, 0.9582444, -1.129187, 1, 0.6, 0, 1,
-1.257338, 0.6247011, -0.6162961, 1, 0.6078432, 0, 1,
-1.257305, 0.3017923, -2.278239, 1, 0.6117647, 0, 1,
-1.247679, 0.71595, -1.330585, 1, 0.6196079, 0, 1,
-1.244256, 1.776015, 0.1839598, 1, 0.6235294, 0, 1,
-1.242765, -0.3233419, -1.326787, 1, 0.6313726, 0, 1,
-1.217022, -0.2211813, -1.756702, 1, 0.6352941, 0, 1,
-1.21216, -0.252338, -2.470149, 1, 0.6431373, 0, 1,
-1.210233, -0.6319667, -1.631872, 1, 0.6470588, 0, 1,
-1.20753, 0.4606402, 0.3007638, 1, 0.654902, 0, 1,
-1.205865, -0.1085778, -1.740984, 1, 0.6588235, 0, 1,
-1.2016, 1.589067, -1.841968, 1, 0.6666667, 0, 1,
-1.197453, 1.406495, -1.524408, 1, 0.6705883, 0, 1,
-1.186918, 0.9412971, -1.038859, 1, 0.6784314, 0, 1,
-1.184242, -0.806731, -0.4249841, 1, 0.682353, 0, 1,
-1.180706, 1.952529, 0.2799657, 1, 0.6901961, 0, 1,
-1.174391, 1.237345, -0.4575114, 1, 0.6941177, 0, 1,
-1.173411, 0.5653614, -2.25519, 1, 0.7019608, 0, 1,
-1.172657, 1.9459, -0.6448698, 1, 0.7098039, 0, 1,
-1.171844, -1.146469, -1.979188, 1, 0.7137255, 0, 1,
-1.165457, 0.5814946, -1.037503, 1, 0.7215686, 0, 1,
-1.151744, -1.380785, -1.6937, 1, 0.7254902, 0, 1,
-1.146998, 1.725605, -0.4416987, 1, 0.7333333, 0, 1,
-1.146663, 0.4354392, -0.6824986, 1, 0.7372549, 0, 1,
-1.140824, -0.05089166, -2.399181, 1, 0.7450981, 0, 1,
-1.138686, 0.3863541, -2.183517, 1, 0.7490196, 0, 1,
-1.135216, -0.4958744, -0.5898514, 1, 0.7568628, 0, 1,
-1.132977, 1.381289, -0.2969221, 1, 0.7607843, 0, 1,
-1.124598, 4.108753, 0.5346559, 1, 0.7686275, 0, 1,
-1.11239, -0.3668864, -0.6000668, 1, 0.772549, 0, 1,
-1.111658, -0.3265054, -0.6588896, 1, 0.7803922, 0, 1,
-1.110387, 0.3127792, -2.158142, 1, 0.7843137, 0, 1,
-1.107654, 0.9262076, -1.984001, 1, 0.7921569, 0, 1,
-1.106716, -0.65507, -2.374849, 1, 0.7960784, 0, 1,
-1.088991, -0.7901264, -1.851606, 1, 0.8039216, 0, 1,
-1.081819, 0.4860241, -1.509568, 1, 0.8117647, 0, 1,
-1.074633, -0.4513084, 0.03397765, 1, 0.8156863, 0, 1,
-1.071017, 0.5445698, -1.488581, 1, 0.8235294, 0, 1,
-1.067454, 0.8702479, -0.6646413, 1, 0.827451, 0, 1,
-1.067139, 0.2404983, -2.368023, 1, 0.8352941, 0, 1,
-1.065186, -0.7816356, -2.10281, 1, 0.8392157, 0, 1,
-1.064804, -0.5125298, -2.233439, 1, 0.8470588, 0, 1,
-1.06306, -1.011896, -1.081236, 1, 0.8509804, 0, 1,
-1.061054, -1.206282, -2.835101, 1, 0.8588235, 0, 1,
-1.059937, 1.149943, -0.2332705, 1, 0.8627451, 0, 1,
-1.056726, -0.9255819, -2.791435, 1, 0.8705882, 0, 1,
-1.05285, 0.6691591, -1.579923, 1, 0.8745098, 0, 1,
-1.052388, -0.5868354, -1.672037, 1, 0.8823529, 0, 1,
-1.044495, -0.9484502, -0.9101657, 1, 0.8862745, 0, 1,
-1.041033, -0.6541687, -2.474623, 1, 0.8941177, 0, 1,
-1.037176, -0.2080798, -1.461323, 1, 0.8980392, 0, 1,
-1.035159, 1.290131, -2.289018, 1, 0.9058824, 0, 1,
-1.033565, -0.001348266, -2.673739, 1, 0.9137255, 0, 1,
-1.032727, 0.2775941, -0.6307174, 1, 0.9176471, 0, 1,
-1.023292, -0.2738197, -1.058725, 1, 0.9254902, 0, 1,
-1.017721, -0.4180669, -2.094753, 1, 0.9294118, 0, 1,
-1.003281, 1.226072, 0.6840551, 1, 0.9372549, 0, 1,
-1.003161, -0.5923323, -2.803651, 1, 0.9411765, 0, 1,
-0.99108, -0.7535511, -2.992348, 1, 0.9490196, 0, 1,
-0.9844165, -0.4434162, -2.498234, 1, 0.9529412, 0, 1,
-0.981287, -0.278799, -2.651758, 1, 0.9607843, 0, 1,
-0.9785346, -0.7009252, -1.788146, 1, 0.9647059, 0, 1,
-0.9779152, 0.9072592, -1.646388, 1, 0.972549, 0, 1,
-0.976858, -0.2891009, -1.988564, 1, 0.9764706, 0, 1,
-0.9751675, -0.01769335, -2.666359, 1, 0.9843137, 0, 1,
-0.9670271, -1.141479, -3.566336, 1, 0.9882353, 0, 1,
-0.9653293, -0.1407228, -2.051224, 1, 0.9960784, 0, 1,
-0.9589735, -1.222677, -3.437278, 0.9960784, 1, 0, 1,
-0.9501004, 0.8349262, -0.8387281, 0.9921569, 1, 0, 1,
-0.9492138, -0.9896317, -3.396922, 0.9843137, 1, 0, 1,
-0.9438781, -0.9850842, -1.089906, 0.9803922, 1, 0, 1,
-0.9105899, 1.441682, -1.434537, 0.972549, 1, 0, 1,
-0.9083005, 0.2520906, -2.940106, 0.9686275, 1, 0, 1,
-0.9050549, 0.176422, -1.443835, 0.9607843, 1, 0, 1,
-0.9016469, -0.5627474, -1.966329, 0.9568627, 1, 0, 1,
-0.8993541, 0.8834604, 0.3019791, 0.9490196, 1, 0, 1,
-0.8941241, 1.004565, -0.2071829, 0.945098, 1, 0, 1,
-0.8854434, 1.537782, -1.291894, 0.9372549, 1, 0, 1,
-0.8853181, -1.449527, -2.116179, 0.9333333, 1, 0, 1,
-0.8819185, 0.7415981, -0.8294889, 0.9254902, 1, 0, 1,
-0.8738237, -1.049083, -2.798436, 0.9215686, 1, 0, 1,
-0.8676248, 0.2213618, -0.7623789, 0.9137255, 1, 0, 1,
-0.8610546, -0.4162945, -1.25188, 0.9098039, 1, 0, 1,
-0.8587239, -0.5464548, -2.430299, 0.9019608, 1, 0, 1,
-0.8572785, -0.7605653, -0.8000321, 0.8941177, 1, 0, 1,
-0.8547028, -0.1624416, 0.09056073, 0.8901961, 1, 0, 1,
-0.8492183, -0.5043565, -3.032668, 0.8823529, 1, 0, 1,
-0.8487237, -0.3245806, 0.4397292, 0.8784314, 1, 0, 1,
-0.8429077, -0.3019966, -2.900909, 0.8705882, 1, 0, 1,
-0.8427441, 0.5950629, -1.913714, 0.8666667, 1, 0, 1,
-0.8414464, 0.6080936, -0.02074339, 0.8588235, 1, 0, 1,
-0.8362914, 0.05277841, -0.5159608, 0.854902, 1, 0, 1,
-0.8346881, 0.4173259, -3.077735, 0.8470588, 1, 0, 1,
-0.8329107, -1.014342, -3.760367, 0.8431373, 1, 0, 1,
-0.8325995, -0.1840099, -1.905599, 0.8352941, 1, 0, 1,
-0.8275757, 0.1586466, -1.519895, 0.8313726, 1, 0, 1,
-0.8200709, -0.1594682, -3.036002, 0.8235294, 1, 0, 1,
-0.8198659, 0.634845, -1.509367, 0.8196079, 1, 0, 1,
-0.8122815, 1.283211, 0.3159634, 0.8117647, 1, 0, 1,
-0.8116453, -0.5180827, -1.250376, 0.8078431, 1, 0, 1,
-0.8070619, -0.87471, -2.259834, 0.8, 1, 0, 1,
-0.7986599, -0.7219641, -3.975906, 0.7921569, 1, 0, 1,
-0.7952773, 0.6901858, -0.7350393, 0.7882353, 1, 0, 1,
-0.783257, -0.8123339, -3.451692, 0.7803922, 1, 0, 1,
-0.7784245, 0.1662138, -2.407373, 0.7764706, 1, 0, 1,
-0.7761581, 1.250653, -0.9088877, 0.7686275, 1, 0, 1,
-0.7741694, -1.036081, -1.796696, 0.7647059, 1, 0, 1,
-0.7693225, 1.37804, -1.632062, 0.7568628, 1, 0, 1,
-0.7683131, 1.039204, -0.7473423, 0.7529412, 1, 0, 1,
-0.765649, 1.456423, 1.250223, 0.7450981, 1, 0, 1,
-0.76367, -0.1931532, -0.5642005, 0.7411765, 1, 0, 1,
-0.7621349, -1.74404, -1.620595, 0.7333333, 1, 0, 1,
-0.7587941, 0.2196635, -1.937126, 0.7294118, 1, 0, 1,
-0.758056, -0.01879429, -1.955963, 0.7215686, 1, 0, 1,
-0.7566814, 0.548939, -1.10329, 0.7176471, 1, 0, 1,
-0.7552989, -1.76886, -3.685879, 0.7098039, 1, 0, 1,
-0.7525978, 0.7538757, 0.5196202, 0.7058824, 1, 0, 1,
-0.7521924, -0.5185764, -2.673005, 0.6980392, 1, 0, 1,
-0.7494501, -0.0395511, -1.046025, 0.6901961, 1, 0, 1,
-0.7473131, -1.088094, -1.595878, 0.6862745, 1, 0, 1,
-0.7402896, 1.352465, -0.01337147, 0.6784314, 1, 0, 1,
-0.7382495, 0.9626806, -2.195986, 0.6745098, 1, 0, 1,
-0.7226688, -0.1576594, -3.115739, 0.6666667, 1, 0, 1,
-0.7178314, -1.108329, -3.622779, 0.6627451, 1, 0, 1,
-0.7147707, 0.2923242, -0.7222972, 0.654902, 1, 0, 1,
-0.7102211, 1.135287, 1.128625, 0.6509804, 1, 0, 1,
-0.7094637, -0.5088854, -2.877133, 0.6431373, 1, 0, 1,
-0.7076179, -1.316017, -2.715534, 0.6392157, 1, 0, 1,
-0.6995355, 0.3421052, -1.406052, 0.6313726, 1, 0, 1,
-0.697286, 1.133829, -1.725259, 0.627451, 1, 0, 1,
-0.6968504, -0.2086892, 0.03101743, 0.6196079, 1, 0, 1,
-0.6961904, -1.12724, -1.201835, 0.6156863, 1, 0, 1,
-0.6958625, -0.02206618, -2.919571, 0.6078432, 1, 0, 1,
-0.6934565, 0.8184749, 0.4643751, 0.6039216, 1, 0, 1,
-0.6781426, -0.7775233, -1.821893, 0.5960785, 1, 0, 1,
-0.6768789, 1.063391, -3.351887, 0.5882353, 1, 0, 1,
-0.6765735, 1.470444, -1.030467, 0.5843138, 1, 0, 1,
-0.6758806, -0.7492622, -1.861035, 0.5764706, 1, 0, 1,
-0.6754724, 1.103284, 0.9214089, 0.572549, 1, 0, 1,
-0.6678175, 0.1178215, -0.4368474, 0.5647059, 1, 0, 1,
-0.6674068, -0.3300756, -1.719366, 0.5607843, 1, 0, 1,
-0.6578384, 0.01760898, -0.08025324, 0.5529412, 1, 0, 1,
-0.6522993, -0.2273291, -1.275436, 0.5490196, 1, 0, 1,
-0.6506712, 0.3022687, -0.9891616, 0.5411765, 1, 0, 1,
-0.6459602, -0.2860007, -1.151158, 0.5372549, 1, 0, 1,
-0.644913, 1.986477, -0.3732263, 0.5294118, 1, 0, 1,
-0.6413906, -0.7703907, -1.160633, 0.5254902, 1, 0, 1,
-0.6394932, 0.04294705, -1.567104, 0.5176471, 1, 0, 1,
-0.638985, 0.7243705, -0.5512382, 0.5137255, 1, 0, 1,
-0.6380373, 2.059683, -2.078054, 0.5058824, 1, 0, 1,
-0.6374469, -1.688468, -3.571416, 0.5019608, 1, 0, 1,
-0.6371451, -0.2292016, -1.004987, 0.4941176, 1, 0, 1,
-0.6338202, -1.187612, -2.34881, 0.4862745, 1, 0, 1,
-0.6325678, -0.9129965, -3.096457, 0.4823529, 1, 0, 1,
-0.6275494, -0.1600689, -3.195428, 0.4745098, 1, 0, 1,
-0.6261902, -0.536612, -1.069575, 0.4705882, 1, 0, 1,
-0.6258405, -0.5313071, -2.36826, 0.4627451, 1, 0, 1,
-0.6205925, -0.5941818, -0.9091427, 0.4588235, 1, 0, 1,
-0.6094313, 0.6648104, -0.528679, 0.4509804, 1, 0, 1,
-0.6094044, 0.5057275, -1.446057, 0.4470588, 1, 0, 1,
-0.6028562, 1.124617, -0.5077838, 0.4392157, 1, 0, 1,
-0.598512, 0.7386446, -2.177699, 0.4352941, 1, 0, 1,
-0.5877202, -0.6622017, -3.183861, 0.427451, 1, 0, 1,
-0.5864846, 0.4917711, -0.484139, 0.4235294, 1, 0, 1,
-0.5835528, -0.5061306, -0.08811869, 0.4156863, 1, 0, 1,
-0.5824099, 1.696237, -1.442262, 0.4117647, 1, 0, 1,
-0.5822684, 1.656563, -1.398531, 0.4039216, 1, 0, 1,
-0.5809003, -0.6062114, -1.814412, 0.3960784, 1, 0, 1,
-0.5800856, 0.4753118, -0.4455878, 0.3921569, 1, 0, 1,
-0.5737161, -0.3668724, -0.1952037, 0.3843137, 1, 0, 1,
-0.5708753, 0.1131708, -1.10163, 0.3803922, 1, 0, 1,
-0.5645761, -0.1448692, -2.610736, 0.372549, 1, 0, 1,
-0.5639865, 0.005967266, 0.4645432, 0.3686275, 1, 0, 1,
-0.5598587, -0.4255194, -2.203257, 0.3607843, 1, 0, 1,
-0.5593208, 1.908137, -1.291325, 0.3568628, 1, 0, 1,
-0.5592393, 0.6625149, -0.3746502, 0.3490196, 1, 0, 1,
-0.558507, 0.2801209, -0.1898013, 0.345098, 1, 0, 1,
-0.5464569, -0.963972, -1.403399, 0.3372549, 1, 0, 1,
-0.5449049, 0.2414726, -0.229427, 0.3333333, 1, 0, 1,
-0.5414592, -1.013611, -1.978447, 0.3254902, 1, 0, 1,
-0.5373543, 0.6568054, -0.2997572, 0.3215686, 1, 0, 1,
-0.5371069, -0.4066086, -3.843407, 0.3137255, 1, 0, 1,
-0.5363531, 1.214437, -0.8279037, 0.3098039, 1, 0, 1,
-0.5348131, 0.5055498, -0.9148583, 0.3019608, 1, 0, 1,
-0.5335681, -2.195932, -3.456212, 0.2941177, 1, 0, 1,
-0.5315354, -0.7251547, -2.479784, 0.2901961, 1, 0, 1,
-0.5307574, 0.7519396, -0.8154689, 0.282353, 1, 0, 1,
-0.5274054, -0.208427, -2.304465, 0.2784314, 1, 0, 1,
-0.5202594, 1.211721, -0.1173842, 0.2705882, 1, 0, 1,
-0.5150771, -1.356892, -3.34975, 0.2666667, 1, 0, 1,
-0.5149072, 1.566571, -0.4209063, 0.2588235, 1, 0, 1,
-0.5131416, -0.4204887, -2.424819, 0.254902, 1, 0, 1,
-0.5111282, -0.781094, -4.707771, 0.2470588, 1, 0, 1,
-0.5066455, 0.4008078, -1.085539, 0.2431373, 1, 0, 1,
-0.495966, 0.2703379, -1.74886, 0.2352941, 1, 0, 1,
-0.494754, -1.311436, -2.084656, 0.2313726, 1, 0, 1,
-0.4895122, -0.7428532, -2.987208, 0.2235294, 1, 0, 1,
-0.4894486, 0.8557108, 0.03272127, 0.2196078, 1, 0, 1,
-0.488832, 0.6307515, -1.583532, 0.2117647, 1, 0, 1,
-0.4875925, -1.326331, -4.475818, 0.2078431, 1, 0, 1,
-0.4875239, -0.4340907, -1.857179, 0.2, 1, 0, 1,
-0.4859529, 0.1558527, -3.373304, 0.1921569, 1, 0, 1,
-0.4796213, 0.4109296, 0.6193592, 0.1882353, 1, 0, 1,
-0.4780905, -2.010022, -2.112787, 0.1803922, 1, 0, 1,
-0.4744486, 1.847798, -0.4104427, 0.1764706, 1, 0, 1,
-0.4709661, 1.345388, -0.8825933, 0.1686275, 1, 0, 1,
-0.470574, -0.3129264, -2.351254, 0.1647059, 1, 0, 1,
-0.4688313, 1.188305, -0.9373963, 0.1568628, 1, 0, 1,
-0.4663543, -0.4779537, -4.204916, 0.1529412, 1, 0, 1,
-0.4606757, 0.6318948, -1.594888, 0.145098, 1, 0, 1,
-0.4583214, 1.781593, -0.3435443, 0.1411765, 1, 0, 1,
-0.4577193, -0.02290063, -1.736711, 0.1333333, 1, 0, 1,
-0.4472084, -0.6278391, -3.276686, 0.1294118, 1, 0, 1,
-0.4398998, -0.5846768, -3.165276, 0.1215686, 1, 0, 1,
-0.4356869, -0.7274644, -3.253545, 0.1176471, 1, 0, 1,
-0.4304518, 0.6175344, 0.466221, 0.1098039, 1, 0, 1,
-0.4272078, 0.5342873, -0.311605, 0.1058824, 1, 0, 1,
-0.4241715, -0.8434938, -3.213503, 0.09803922, 1, 0, 1,
-0.4211722, -0.7808859, -2.115184, 0.09019608, 1, 0, 1,
-0.4188417, 1.894151, -2.270931, 0.08627451, 1, 0, 1,
-0.4185554, -2.559783, -4.048363, 0.07843138, 1, 0, 1,
-0.4177651, 0.2584104, -0.8247431, 0.07450981, 1, 0, 1,
-0.4136496, 0.6047546, -0.005304326, 0.06666667, 1, 0, 1,
-0.4111807, -0.5772105, -4.772695, 0.0627451, 1, 0, 1,
-0.4100748, -1.118461, -3.944955, 0.05490196, 1, 0, 1,
-0.4082023, 0.09483051, -2.094121, 0.05098039, 1, 0, 1,
-0.4031501, 1.658417, -1.063934, 0.04313726, 1, 0, 1,
-0.4014857, 0.5462878, -2.026904, 0.03921569, 1, 0, 1,
-0.3964356, -0.04575299, -1.055515, 0.03137255, 1, 0, 1,
-0.3964258, 0.4654386, 0.0853882, 0.02745098, 1, 0, 1,
-0.3953692, -0.1238388, -1.32785, 0.01960784, 1, 0, 1,
-0.3950038, 1.561944, 0.855493, 0.01568628, 1, 0, 1,
-0.391313, 0.1794286, -2.616106, 0.007843138, 1, 0, 1,
-0.3911942, -0.2087253, -2.115165, 0.003921569, 1, 0, 1,
-0.3909015, -0.3855511, -2.192805, 0, 1, 0.003921569, 1,
-0.3901388, 0.07382834, 0.2829971, 0, 1, 0.01176471, 1,
-0.3881814, -0.4470062, -3.26043, 0, 1, 0.01568628, 1,
-0.3853887, -0.8874769, -4.504972, 0, 1, 0.02352941, 1,
-0.3804909, -2.998674, -3.352403, 0, 1, 0.02745098, 1,
-0.3770824, 0.6027734, -0.6944999, 0, 1, 0.03529412, 1,
-0.3729389, 0.9167557, -1.881029, 0, 1, 0.03921569, 1,
-0.3729198, -0.1320206, -3.537707, 0, 1, 0.04705882, 1,
-0.3646951, -0.6721174, -0.7429584, 0, 1, 0.05098039, 1,
-0.3637362, -1.476632, -2.677159, 0, 1, 0.05882353, 1,
-0.3580986, 1.828511, -0.05343682, 0, 1, 0.0627451, 1,
-0.3569799, -0.2909465, -2.531648, 0, 1, 0.07058824, 1,
-0.3565893, -0.300876, -2.080306, 0, 1, 0.07450981, 1,
-0.3536986, -1.074906, -3.725024, 0, 1, 0.08235294, 1,
-0.3503972, -1.827172, -2.947603, 0, 1, 0.08627451, 1,
-0.3480265, 0.6397673, -0.5055286, 0, 1, 0.09411765, 1,
-0.3450058, 1.633995, -0.9710944, 0, 1, 0.1019608, 1,
-0.3384737, 0.3800588, -0.7510827, 0, 1, 0.1058824, 1,
-0.3382626, 1.160548, -0.9514062, 0, 1, 0.1137255, 1,
-0.336207, -0.8416186, -1.086942, 0, 1, 0.1176471, 1,
-0.3345935, 0.6208311, -1.288166, 0, 1, 0.1254902, 1,
-0.3342591, 0.2245585, -0.8187881, 0, 1, 0.1294118, 1,
-0.3304246, 0.5167954, 0.4806126, 0, 1, 0.1372549, 1,
-0.3303576, 0.5893757, -0.8437857, 0, 1, 0.1411765, 1,
-0.3268785, 0.3113387, -1.325051, 0, 1, 0.1490196, 1,
-0.3256315, -1.337994, -1.441696, 0, 1, 0.1529412, 1,
-0.3253491, -0.1281405, -3.443131, 0, 1, 0.1607843, 1,
-0.324955, 1.129268, -1.43973, 0, 1, 0.1647059, 1,
-0.3230024, 1.410586, -0.8595741, 0, 1, 0.172549, 1,
-0.3173821, 0.4270479, -2.988238, 0, 1, 0.1764706, 1,
-0.3157802, 0.963783, 0.1200036, 0, 1, 0.1843137, 1,
-0.3155011, 0.791407, -1.071987, 0, 1, 0.1882353, 1,
-0.3144022, 0.06363545, -1.776673, 0, 1, 0.1960784, 1,
-0.3101499, 1.115277, -0.2320045, 0, 1, 0.2039216, 1,
-0.3062526, -1.338197, -3.978961, 0, 1, 0.2078431, 1,
-0.2969164, -0.3120238, -2.327068, 0, 1, 0.2156863, 1,
-0.2942296, -0.442031, -2.653423, 0, 1, 0.2196078, 1,
-0.292163, -0.02126678, -1.50971, 0, 1, 0.227451, 1,
-0.2919118, -0.5791692, -1.822572, 0, 1, 0.2313726, 1,
-0.2900572, 0.4022773, 0.6579611, 0, 1, 0.2392157, 1,
-0.2873864, -0.9259332, -2.755845, 0, 1, 0.2431373, 1,
-0.2844261, 0.007795227, -2.628216, 0, 1, 0.2509804, 1,
-0.2841809, -0.2619924, -3.44277, 0, 1, 0.254902, 1,
-0.2803088, -0.462571, -1.278941, 0, 1, 0.2627451, 1,
-0.2802818, 2.172823, -2.242223, 0, 1, 0.2666667, 1,
-0.2785932, -1.442869, -2.667031, 0, 1, 0.2745098, 1,
-0.2783005, 2.045161, -1.237772, 0, 1, 0.2784314, 1,
-0.2761407, -0.6467453, -2.865076, 0, 1, 0.2862745, 1,
-0.2758641, 0.2871517, -2.544302, 0, 1, 0.2901961, 1,
-0.2663695, -0.148914, -1.858095, 0, 1, 0.2980392, 1,
-0.2622359, -0.04514026, -2.335379, 0, 1, 0.3058824, 1,
-0.2619413, 0.1533014, -0.8313935, 0, 1, 0.3098039, 1,
-0.2618226, 0.1929072, -0.3305079, 0, 1, 0.3176471, 1,
-0.2587104, -0.04407696, -3.207167, 0, 1, 0.3215686, 1,
-0.2522338, 0.9476228, 1.165536, 0, 1, 0.3294118, 1,
-0.2486484, 0.5010001, -0.5523379, 0, 1, 0.3333333, 1,
-0.2485492, 0.1037043, -1.384118, 0, 1, 0.3411765, 1,
-0.2476555, -1.977073, -3.743678, 0, 1, 0.345098, 1,
-0.2462766, 0.8069323, -0.7405148, 0, 1, 0.3529412, 1,
-0.2455329, 1.01508, -1.400777, 0, 1, 0.3568628, 1,
-0.2439817, -0.08842298, -0.8112953, 0, 1, 0.3647059, 1,
-0.2398931, 0.9666796, 0.5411512, 0, 1, 0.3686275, 1,
-0.2397382, 0.2967734, -1.624879, 0, 1, 0.3764706, 1,
-0.2394313, -1.046903, -3.123677, 0, 1, 0.3803922, 1,
-0.2375884, -0.4026444, -2.857141, 0, 1, 0.3882353, 1,
-0.2349768, -0.3521219, -4.573905, 0, 1, 0.3921569, 1,
-0.2308963, 0.06687561, -0.2581911, 0, 1, 0.4, 1,
-0.2268085, 0.01214624, -1.690209, 0, 1, 0.4078431, 1,
-0.2211825, 0.7186485, 1.028132, 0, 1, 0.4117647, 1,
-0.2161544, -0.1385954, -0.9592264, 0, 1, 0.4196078, 1,
-0.2127137, -1.146278, -3.142974, 0, 1, 0.4235294, 1,
-0.2120737, -1.855527, -2.723792, 0, 1, 0.4313726, 1,
-0.2092009, 0.9395716, 1.010916, 0, 1, 0.4352941, 1,
-0.2065247, -0.02776044, -2.292052, 0, 1, 0.4431373, 1,
-0.2039888, -0.413243, -2.462656, 0, 1, 0.4470588, 1,
-0.2030907, -0.796052, -3.481884, 0, 1, 0.454902, 1,
-0.2009715, 0.2710785, -0.4304655, 0, 1, 0.4588235, 1,
-0.1981065, 0.01552267, -0.7420056, 0, 1, 0.4666667, 1,
-0.1954876, 3.393829, -1.113959, 0, 1, 0.4705882, 1,
-0.194108, 0.6575831, 1.4808, 0, 1, 0.4784314, 1,
-0.1843632, -0.8306841, -2.04286, 0, 1, 0.4823529, 1,
-0.1833389, 0.4802439, 1.114623, 0, 1, 0.4901961, 1,
-0.1825625, 1.466797, -0.8402423, 0, 1, 0.4941176, 1,
-0.1812537, 0.4217221, -0.5172651, 0, 1, 0.5019608, 1,
-0.1785413, -1.186896, -1.968454, 0, 1, 0.509804, 1,
-0.1713045, 0.7813715, -0.05779667, 0, 1, 0.5137255, 1,
-0.1683288, -1.107629, -3.262874, 0, 1, 0.5215687, 1,
-0.1670203, -3.014637, -3.028856, 0, 1, 0.5254902, 1,
-0.1652436, 0.9899533, 0.1263054, 0, 1, 0.5333334, 1,
-0.1635665, -0.2973372, -2.028401, 0, 1, 0.5372549, 1,
-0.1588213, -1.250147, -3.428692, 0, 1, 0.5450981, 1,
-0.1547797, 0.2649196, -1.936474, 0, 1, 0.5490196, 1,
-0.1531447, -1.120936, -2.833625, 0, 1, 0.5568628, 1,
-0.1402353, 0.5221663, 0.518178, 0, 1, 0.5607843, 1,
-0.1390108, -0.06817809, -1.760132, 0, 1, 0.5686275, 1,
-0.1361656, 0.6641421, -1.578799, 0, 1, 0.572549, 1,
-0.1330743, 0.2471876, -1.26242, 0, 1, 0.5803922, 1,
-0.1297942, -0.01858013, -3.485655, 0, 1, 0.5843138, 1,
-0.1267492, -0.5939714, -3.217888, 0, 1, 0.5921569, 1,
-0.1236234, -0.3609886, -2.667431, 0, 1, 0.5960785, 1,
-0.1167101, -1.030971, -1.745397, 0, 1, 0.6039216, 1,
-0.1048306, 1.426099, 0.4977832, 0, 1, 0.6117647, 1,
-0.1036842, -0.0752919, -1.066326, 0, 1, 0.6156863, 1,
-0.0986433, -3.315829, -1.883376, 0, 1, 0.6235294, 1,
-0.09718245, -0.4723376, -1.1498, 0, 1, 0.627451, 1,
-0.09686869, 0.3215855, -0.5309878, 0, 1, 0.6352941, 1,
-0.09511886, 1.931612, 0.5390205, 0, 1, 0.6392157, 1,
-0.09396437, -0.05959703, -1.974853, 0, 1, 0.6470588, 1,
-0.08943076, 0.1236014, -0.6283755, 0, 1, 0.6509804, 1,
-0.08940836, -0.5300732, -4.396533, 0, 1, 0.6588235, 1,
-0.08893431, -0.008287255, -0.6104228, 0, 1, 0.6627451, 1,
-0.08092644, 0.02892469, -0.8040588, 0, 1, 0.6705883, 1,
-0.0780227, -0.4077031, -5.208369, 0, 1, 0.6745098, 1,
-0.07735619, 1.215741, 0.3001339, 0, 1, 0.682353, 1,
-0.0751888, -0.1787056, -4.033576, 0, 1, 0.6862745, 1,
-0.07166026, 0.6847272, -0.3462203, 0, 1, 0.6941177, 1,
-0.07061281, -0.6959922, -3.151568, 0, 1, 0.7019608, 1,
-0.07007205, 0.2695677, -1.716149, 0, 1, 0.7058824, 1,
-0.0690177, 0.4431566, -1.006756, 0, 1, 0.7137255, 1,
-0.06791198, -1.784697, -3.303311, 0, 1, 0.7176471, 1,
-0.06748049, -0.8761536, -3.959567, 0, 1, 0.7254902, 1,
-0.06734493, -0.5328922, -4.142269, 0, 1, 0.7294118, 1,
-0.06308583, -1.251396, -3.446948, 0, 1, 0.7372549, 1,
-0.06303777, 0.2572083, 0.7007131, 0, 1, 0.7411765, 1,
-0.06234622, 1.558458, 0.1054799, 0, 1, 0.7490196, 1,
-0.06225652, -0.3177592, -4.718976, 0, 1, 0.7529412, 1,
-0.05540658, 0.6422334, -1.108147, 0, 1, 0.7607843, 1,
-0.05500687, 0.5878772, -1.083238, 0, 1, 0.7647059, 1,
-0.05321083, 0.2135734, 0.3460835, 0, 1, 0.772549, 1,
-0.05139438, 0.6726758, -1.24262, 0, 1, 0.7764706, 1,
-0.05002084, -0.2783059, -3.237917, 0, 1, 0.7843137, 1,
-0.04906785, 0.7974839, -1.483336, 0, 1, 0.7882353, 1,
-0.04809472, 0.6365591, -1.351667, 0, 1, 0.7960784, 1,
-0.04396029, 0.655662, 0.2181057, 0, 1, 0.8039216, 1,
-0.0438136, 0.4335214, 2.145954, 0, 1, 0.8078431, 1,
-0.03502051, 0.202732, -1.046258, 0, 1, 0.8156863, 1,
-0.0306819, 0.4204958, -0.2980222, 0, 1, 0.8196079, 1,
-0.03013015, -1.115388, -3.61165, 0, 1, 0.827451, 1,
-0.02595062, 0.327591, -0.1486565, 0, 1, 0.8313726, 1,
-0.02479998, 0.3878158, -0.4316631, 0, 1, 0.8392157, 1,
-0.02358375, -0.292404, -3.586657, 0, 1, 0.8431373, 1,
-0.02036975, 0.330284, -0.8843814, 0, 1, 0.8509804, 1,
-0.01854173, -0.2052597, -3.41486, 0, 1, 0.854902, 1,
-0.01133273, 0.2836856, 0.5011864, 0, 1, 0.8627451, 1,
-0.0109338, -1.084716, -2.148206, 0, 1, 0.8666667, 1,
-0.006418752, 0.08351676, -0.4725301, 0, 1, 0.8745098, 1,
-0.002859931, -1.261971, -3.783618, 0, 1, 0.8784314, 1,
0.004470672, -0.1934593, 4.308948, 0, 1, 0.8862745, 1,
0.006418623, -0.5267159, 1.244931, 0, 1, 0.8901961, 1,
0.01051878, -0.2104212, 3.833404, 0, 1, 0.8980392, 1,
0.01336695, -0.02339272, 2.192905, 0, 1, 0.9058824, 1,
0.01635016, 1.94061, 0.7020348, 0, 1, 0.9098039, 1,
0.02300958, 0.05492061, 0.4623218, 0, 1, 0.9176471, 1,
0.02476062, 0.5156541, -0.2069037, 0, 1, 0.9215686, 1,
0.02931703, 0.7235495, 2.364419, 0, 1, 0.9294118, 1,
0.02945667, 0.731614, 0.2821654, 0, 1, 0.9333333, 1,
0.03155301, -1.977314, 1.017633, 0, 1, 0.9411765, 1,
0.03206592, 1.153539, -1.397972, 0, 1, 0.945098, 1,
0.03209946, -0.1459659, 4.635944, 0, 1, 0.9529412, 1,
0.03265107, 1.764668, -0.127592, 0, 1, 0.9568627, 1,
0.03273018, 0.5586268, -0.1778575, 0, 1, 0.9647059, 1,
0.03389964, 1.691036, 0.4978407, 0, 1, 0.9686275, 1,
0.03546856, -1.801798, 2.455532, 0, 1, 0.9764706, 1,
0.03606163, -0.5371498, 3.615279, 0, 1, 0.9803922, 1,
0.03726356, -0.6361454, 4.299306, 0, 1, 0.9882353, 1,
0.04167397, 0.2388272, -1.386389, 0, 1, 0.9921569, 1,
0.04195594, -0.2758731, 3.739692, 0, 1, 1, 1,
0.04743113, -0.1248507, 2.052244, 0, 0.9921569, 1, 1,
0.04939357, 1.967785, 0.9016172, 0, 0.9882353, 1, 1,
0.05292223, -0.6165501, 0.5951817, 0, 0.9803922, 1, 1,
0.05529516, 1.367208, 1.126134, 0, 0.9764706, 1, 1,
0.06054917, -0.7058512, 4.921087, 0, 0.9686275, 1, 1,
0.0621416, -0.4985198, 3.647623, 0, 0.9647059, 1, 1,
0.06260934, -0.1379075, 2.772252, 0, 0.9568627, 1, 1,
0.0642511, -0.4850491, 2.493547, 0, 0.9529412, 1, 1,
0.06426114, 0.7138475, 0.08617877, 0, 0.945098, 1, 1,
0.06868777, 1.385835, 1.252953, 0, 0.9411765, 1, 1,
0.07088953, -0.5549111, 4.340719, 0, 0.9333333, 1, 1,
0.07422087, 0.7761478, -0.5818982, 0, 0.9294118, 1, 1,
0.07713228, 0.5009769, 0.7740022, 0, 0.9215686, 1, 1,
0.08056333, 1.207603, -0.9807196, 0, 0.9176471, 1, 1,
0.08268556, 1.4152, 0.3017357, 0, 0.9098039, 1, 1,
0.08795041, 0.1321984, -1.075803, 0, 0.9058824, 1, 1,
0.09118004, -0.6945351, 3.671163, 0, 0.8980392, 1, 1,
0.09235646, 0.4366543, 0.8252277, 0, 0.8901961, 1, 1,
0.09366965, -0.2868375, 3.799924, 0, 0.8862745, 1, 1,
0.09487347, -0.3831126, 2.307845, 0, 0.8784314, 1, 1,
0.09655355, -1.540917, 2.878311, 0, 0.8745098, 1, 1,
0.09697878, 0.3541164, -1.16414, 0, 0.8666667, 1, 1,
0.09811545, 0.9387546, -0.3928853, 0, 0.8627451, 1, 1,
0.1006245, 0.0007695625, 2.9601, 0, 0.854902, 1, 1,
0.1012262, -1.083117, 3.242802, 0, 0.8509804, 1, 1,
0.1023334, -2.363102, 3.398947, 0, 0.8431373, 1, 1,
0.103986, 1.393821, -0.677242, 0, 0.8392157, 1, 1,
0.1058533, -1.71351, 3.220073, 0, 0.8313726, 1, 1,
0.1203334, -0.5492654, 3.088446, 0, 0.827451, 1, 1,
0.1237902, -0.2429387, 3.878494, 0, 0.8196079, 1, 1,
0.1257184, -0.8982176, 3.514806, 0, 0.8156863, 1, 1,
0.1258205, 0.72995, 0.3695776, 0, 0.8078431, 1, 1,
0.1281214, -0.8344377, 1.161284, 0, 0.8039216, 1, 1,
0.1282989, -0.5726275, 2.010711, 0, 0.7960784, 1, 1,
0.12919, -0.9945708, 1.737925, 0, 0.7882353, 1, 1,
0.1334084, -0.1010627, 1.445004, 0, 0.7843137, 1, 1,
0.1340239, 1.6238, 0.6179649, 0, 0.7764706, 1, 1,
0.1357272, -1.404963, 2.323984, 0, 0.772549, 1, 1,
0.1389731, 0.5212404, 1.348664, 0, 0.7647059, 1, 1,
0.1410446, 0.5515483, 0.3338404, 0, 0.7607843, 1, 1,
0.1442119, -0.7461804, 2.554582, 0, 0.7529412, 1, 1,
0.1487519, -0.9421821, 3.354459, 0, 0.7490196, 1, 1,
0.1522187, 0.2891847, -0.7046668, 0, 0.7411765, 1, 1,
0.1556066, 1.404182, -0.889643, 0, 0.7372549, 1, 1,
0.1559656, -0.4947561, 3.181983, 0, 0.7294118, 1, 1,
0.1590196, 1.726263, -0.6810901, 0, 0.7254902, 1, 1,
0.1610246, 0.2096921, -0.2940093, 0, 0.7176471, 1, 1,
0.1612373, 0.8133498, 0.4785092, 0, 0.7137255, 1, 1,
0.162179, 0.8995437, 0.2706662, 0, 0.7058824, 1, 1,
0.1657116, -0.8381352, 2.32788, 0, 0.6980392, 1, 1,
0.1661159, -0.7954246, 3.017247, 0, 0.6941177, 1, 1,
0.173764, 0.08309244, 0.8999889, 0, 0.6862745, 1, 1,
0.1773758, 0.2888033, 0.6715824, 0, 0.682353, 1, 1,
0.1785566, 0.3372575, -2.424397, 0, 0.6745098, 1, 1,
0.1789579, 2.11602, 0.5081856, 0, 0.6705883, 1, 1,
0.1801351, 1.578882, -0.6930714, 0, 0.6627451, 1, 1,
0.1816683, -1.612545, 2.191835, 0, 0.6588235, 1, 1,
0.1858276, 0.5007159, 0.1718184, 0, 0.6509804, 1, 1,
0.1880364, -0.2576103, 1.788049, 0, 0.6470588, 1, 1,
0.1891541, -0.5238737, 2.64325, 0, 0.6392157, 1, 1,
0.1908369, 0.728614, 1.344116, 0, 0.6352941, 1, 1,
0.1911259, -0.3106063, 2.606717, 0, 0.627451, 1, 1,
0.1919681, -0.003871773, 1.923598, 0, 0.6235294, 1, 1,
0.1936437, -0.1957315, 0.07902663, 0, 0.6156863, 1, 1,
0.1963737, -0.357997, 2.068813, 0, 0.6117647, 1, 1,
0.2012883, -0.3455155, 3.566184, 0, 0.6039216, 1, 1,
0.2064985, -1.481475, 2.11343, 0, 0.5960785, 1, 1,
0.211276, 0.2725166, 2.463025, 0, 0.5921569, 1, 1,
0.2116814, -0.3554909, 4.745059, 0, 0.5843138, 1, 1,
0.2165356, -1.043262, 3.447985, 0, 0.5803922, 1, 1,
0.2184165, 1.538556, -0.2835594, 0, 0.572549, 1, 1,
0.2259267, -1.666669, 1.632472, 0, 0.5686275, 1, 1,
0.2300383, 0.3803668, 1.332476, 0, 0.5607843, 1, 1,
0.2319643, 0.1966029, -0.1459945, 0, 0.5568628, 1, 1,
0.2326306, 0.03295108, 2.121408, 0, 0.5490196, 1, 1,
0.2341382, 1.345476, 0.1363927, 0, 0.5450981, 1, 1,
0.2349371, -0.4111384, 2.799644, 0, 0.5372549, 1, 1,
0.2353116, 0.9101681, 1.33079, 0, 0.5333334, 1, 1,
0.2364814, -0.2587661, 3.619056, 0, 0.5254902, 1, 1,
0.2367052, 1.564158, 0.493928, 0, 0.5215687, 1, 1,
0.237373, -0.8415899, 2.145498, 0, 0.5137255, 1, 1,
0.2374036, -0.09493815, 3.806273, 0, 0.509804, 1, 1,
0.2375327, 2.586861, -1.595554, 0, 0.5019608, 1, 1,
0.2416311, 2.380928, 0.6772895, 0, 0.4941176, 1, 1,
0.2416568, -1.042574, 2.278218, 0, 0.4901961, 1, 1,
0.2498455, 0.2998852, -0.4333889, 0, 0.4823529, 1, 1,
0.2509858, -0.02406839, 2.384768, 0, 0.4784314, 1, 1,
0.2513958, -1.954458, 4.131427, 0, 0.4705882, 1, 1,
0.2565851, 0.2895598, 0.07201133, 0, 0.4666667, 1, 1,
0.2600549, -0.2418542, 2.875765, 0, 0.4588235, 1, 1,
0.2611095, 0.1024518, -0.300719, 0, 0.454902, 1, 1,
0.2631971, 1.634002, -0.5012404, 0, 0.4470588, 1, 1,
0.2679892, 0.09350984, 1.101941, 0, 0.4431373, 1, 1,
0.2688897, -0.4463612, 0.8250409, 0, 0.4352941, 1, 1,
0.2737048, 0.6205262, -0.8073428, 0, 0.4313726, 1, 1,
0.2773794, -0.003291356, -0.4697798, 0, 0.4235294, 1, 1,
0.2783992, 1.427459, 0.4949327, 0, 0.4196078, 1, 1,
0.2805761, 0.6337384, 1.403441, 0, 0.4117647, 1, 1,
0.2816925, 1.171721, -0.07667085, 0, 0.4078431, 1, 1,
0.282881, 0.220272, -4.823806e-05, 0, 0.4, 1, 1,
0.2833069, -0.9510198, 2.435575, 0, 0.3921569, 1, 1,
0.2849082, 0.3750075, 0.547373, 0, 0.3882353, 1, 1,
0.2864588, -0.2909221, 3.087028, 0, 0.3803922, 1, 1,
0.2873042, 1.760053, -1.186655, 0, 0.3764706, 1, 1,
0.2877942, 0.250903, 2.398157, 0, 0.3686275, 1, 1,
0.291608, -0.4450471, 1.508367, 0, 0.3647059, 1, 1,
0.2946832, -0.003334984, 2.587383, 0, 0.3568628, 1, 1,
0.2948065, -0.7893879, 2.720937, 0, 0.3529412, 1, 1,
0.295145, 0.9586992, 0.02200337, 0, 0.345098, 1, 1,
0.2978698, -2.045461, 4.113519, 0, 0.3411765, 1, 1,
0.3042246, -1.157062, 1.394872, 0, 0.3333333, 1, 1,
0.308266, -0.08209249, 3.357092, 0, 0.3294118, 1, 1,
0.3247461, 0.9347175, -0.5493061, 0, 0.3215686, 1, 1,
0.3269789, 1.433444, 0.03496267, 0, 0.3176471, 1, 1,
0.3313491, -0.187466, 3.183875, 0, 0.3098039, 1, 1,
0.3330335, -0.9171955, 2.282989, 0, 0.3058824, 1, 1,
0.3361578, 0.09576049, 0.8545107, 0, 0.2980392, 1, 1,
0.3373024, -1.600274, 2.185792, 0, 0.2901961, 1, 1,
0.3383609, -0.06422399, 2.692347, 0, 0.2862745, 1, 1,
0.3388985, -0.3467617, 2.596587, 0, 0.2784314, 1, 1,
0.3417214, -1.762081, 3.808186, 0, 0.2745098, 1, 1,
0.3477276, 0.4971842, 0.7027168, 0, 0.2666667, 1, 1,
0.3477603, -0.9080824, 1.697913, 0, 0.2627451, 1, 1,
0.3478866, -0.3526168, 2.910629, 0, 0.254902, 1, 1,
0.349116, -0.2577336, 2.422297, 0, 0.2509804, 1, 1,
0.3500636, 0.6486085, 0.2505793, 0, 0.2431373, 1, 1,
0.3555812, -1.471776, 3.847028, 0, 0.2392157, 1, 1,
0.3560901, 0.62508, 1.348003, 0, 0.2313726, 1, 1,
0.356187, -1.025946, 3.688502, 0, 0.227451, 1, 1,
0.3632112, 1.776592, 1.216625, 0, 0.2196078, 1, 1,
0.3678876, -0.4341325, 2.248134, 0, 0.2156863, 1, 1,
0.3683321, -1.096861, 2.526355, 0, 0.2078431, 1, 1,
0.3809125, 0.6929594, 0.2549561, 0, 0.2039216, 1, 1,
0.3821557, 0.7128978, 0.975885, 0, 0.1960784, 1, 1,
0.3898221, -0.2256338, 2.616244, 0, 0.1882353, 1, 1,
0.3906289, 1.080295, 2.229295, 0, 0.1843137, 1, 1,
0.3913724, 0.2140901, 2.64387, 0, 0.1764706, 1, 1,
0.3926346, 0.845511, 1.312775, 0, 0.172549, 1, 1,
0.4009101, -1.159318, 2.237795, 0, 0.1647059, 1, 1,
0.4009734, -0.05836209, 1.85685, 0, 0.1607843, 1, 1,
0.4018179, -0.224021, 2.261681, 0, 0.1529412, 1, 1,
0.4066847, -1.48522, 3.115195, 0, 0.1490196, 1, 1,
0.4214947, -0.08286341, 2.759225, 0, 0.1411765, 1, 1,
0.4224498, -2.778449, 4.733413, 0, 0.1372549, 1, 1,
0.4261321, -0.6733953, 1.885039, 0, 0.1294118, 1, 1,
0.4290639, -2.002785, 3.210586, 0, 0.1254902, 1, 1,
0.4297773, 0.543539, 1.699135, 0, 0.1176471, 1, 1,
0.4338814, 1.128992, 2.083401, 0, 0.1137255, 1, 1,
0.4366481, 1.825015, 1.026104, 0, 0.1058824, 1, 1,
0.4373875, -0.4005039, 0.9469182, 0, 0.09803922, 1, 1,
0.4374748, -0.3641755, 2.271657, 0, 0.09411765, 1, 1,
0.4395042, 0.5727046, 1.6002, 0, 0.08627451, 1, 1,
0.4433737, 2.104895, 1.031003, 0, 0.08235294, 1, 1,
0.444282, -0.05140853, 0.8744444, 0, 0.07450981, 1, 1,
0.4451294, 1.029972, 1.42533, 0, 0.07058824, 1, 1,
0.447058, -1.421682, 4.333658, 0, 0.0627451, 1, 1,
0.4491082, 0.4099743, 0.110121, 0, 0.05882353, 1, 1,
0.4580956, 0.006926985, 2.156719, 0, 0.05098039, 1, 1,
0.4601061, -0.4006573, 4.216137, 0, 0.04705882, 1, 1,
0.4658452, 0.4013467, 1.184933, 0, 0.03921569, 1, 1,
0.4678174, 0.215719, 2.919623, 0, 0.03529412, 1, 1,
0.468423, 2.24847, -1.866444, 0, 0.02745098, 1, 1,
0.4726257, -1.033638, 3.000177, 0, 0.02352941, 1, 1,
0.4767863, 0.8545901, 1.104446, 0, 0.01568628, 1, 1,
0.4768752, 0.7051963, 0.01195196, 0, 0.01176471, 1, 1,
0.4776547, -0.275372, 1.999038, 0, 0.003921569, 1, 1,
0.4797371, 0.5411544, 0.7107257, 0.003921569, 0, 1, 1,
0.4802725, -0.7820907, 1.896963, 0.007843138, 0, 1, 1,
0.4865542, -1.658933, 2.967255, 0.01568628, 0, 1, 1,
0.4878457, 1.997812, -0.5357282, 0.01960784, 0, 1, 1,
0.4880802, 2.059406, -1.599824, 0.02745098, 0, 1, 1,
0.4893486, 1.802253, 1.800628, 0.03137255, 0, 1, 1,
0.4908469, -0.583963, 3.523707, 0.03921569, 0, 1, 1,
0.4918447, -1.241621, 3.355703, 0.04313726, 0, 1, 1,
0.4932739, -0.6479276, 3.509679, 0.05098039, 0, 1, 1,
0.4940962, -1.799888, 2.870018, 0.05490196, 0, 1, 1,
0.4950246, -0.9473011, 1.942003, 0.0627451, 0, 1, 1,
0.4950421, 0.5990912, 1.287396, 0.06666667, 0, 1, 1,
0.4969279, 0.9623615, 1.577173, 0.07450981, 0, 1, 1,
0.497873, -0.287147, 1.444001, 0.07843138, 0, 1, 1,
0.4988951, 0.476136, 0.658248, 0.08627451, 0, 1, 1,
0.5005741, 0.30767, 1.418802, 0.09019608, 0, 1, 1,
0.5014353, 1.849985, -1.126921, 0.09803922, 0, 1, 1,
0.5045882, -0.1296787, 1.850195, 0.1058824, 0, 1, 1,
0.5046603, 0.8038348, -0.2408774, 0.1098039, 0, 1, 1,
0.504778, -0.1842148, 2.339093, 0.1176471, 0, 1, 1,
0.5054009, -0.8245603, 2.553709, 0.1215686, 0, 1, 1,
0.5061629, -0.1267856, 1.814928, 0.1294118, 0, 1, 1,
0.5076959, -0.5864852, 2.542168, 0.1333333, 0, 1, 1,
0.5087015, -0.170132, 0.5941246, 0.1411765, 0, 1, 1,
0.5108627, 1.277592, 2.130306, 0.145098, 0, 1, 1,
0.5131008, 1.178836, 1.609936, 0.1529412, 0, 1, 1,
0.5190901, -0.5157268, 2.938858, 0.1568628, 0, 1, 1,
0.5227512, -0.3263864, 0.4597738, 0.1647059, 0, 1, 1,
0.5234573, -0.9233627, 2.620826, 0.1686275, 0, 1, 1,
0.5250831, 1.400421, 2.206508, 0.1764706, 0, 1, 1,
0.525604, -0.01437692, 1.918549, 0.1803922, 0, 1, 1,
0.527279, -0.3352865, 3.640403, 0.1882353, 0, 1, 1,
0.5325347, 1.406551, 0.09132496, 0.1921569, 0, 1, 1,
0.5331711, 1.246338, 0.959199, 0.2, 0, 1, 1,
0.5335833, -0.3477365, 1.883835, 0.2078431, 0, 1, 1,
0.5392632, 0.4865794, 1.051477, 0.2117647, 0, 1, 1,
0.541873, -1.300404, 4.285048, 0.2196078, 0, 1, 1,
0.5457017, -0.2165525, 3.050321, 0.2235294, 0, 1, 1,
0.5557943, 1.085834, 1.520399, 0.2313726, 0, 1, 1,
0.5564958, 0.8756828, 0.1434529, 0.2352941, 0, 1, 1,
0.5578704, 1.326068, 1.727084, 0.2431373, 0, 1, 1,
0.5644382, -1.089012, 2.522146, 0.2470588, 0, 1, 1,
0.5659522, 2.340814, 1.5942, 0.254902, 0, 1, 1,
0.5742328, -0.5509562, 4.054462, 0.2588235, 0, 1, 1,
0.5745643, -0.6552798, 1.259302, 0.2666667, 0, 1, 1,
0.5747145, 0.6102073, 1.786348, 0.2705882, 0, 1, 1,
0.575869, 0.546665, 1.01234, 0.2784314, 0, 1, 1,
0.5770569, -1.149066, 2.805261, 0.282353, 0, 1, 1,
0.5801015, -0.5241116, 2.531924, 0.2901961, 0, 1, 1,
0.5819014, -1.43749, 3.494992, 0.2941177, 0, 1, 1,
0.5820569, -1.386195, 1.769601, 0.3019608, 0, 1, 1,
0.5846464, -1.601058, 3.360795, 0.3098039, 0, 1, 1,
0.5880573, -2.242941, 3.588438, 0.3137255, 0, 1, 1,
0.5900016, -0.2584958, -0.9673514, 0.3215686, 0, 1, 1,
0.5912629, 0.2716504, -0.1106034, 0.3254902, 0, 1, 1,
0.5927559, -0.201159, 2.147205, 0.3333333, 0, 1, 1,
0.5928413, -0.7239679, 2.756627, 0.3372549, 0, 1, 1,
0.593567, -0.4827642, 0.3997894, 0.345098, 0, 1, 1,
0.595885, 0.05150072, 1.348489, 0.3490196, 0, 1, 1,
0.5972229, 0.7546493, 1.792476, 0.3568628, 0, 1, 1,
0.5982327, 1.162107, 1.768748, 0.3607843, 0, 1, 1,
0.5986201, 1.551385, 0.4738714, 0.3686275, 0, 1, 1,
0.6072919, -0.3276193, 1.033699, 0.372549, 0, 1, 1,
0.6099938, 0.7531224, 1.272236, 0.3803922, 0, 1, 1,
0.6107138, -0.3418756, 2.492747, 0.3843137, 0, 1, 1,
0.6123315, 0.1743854, 1.717781, 0.3921569, 0, 1, 1,
0.6124038, -0.7322153, 0.4891393, 0.3960784, 0, 1, 1,
0.6140647, -3.292683, 2.761304, 0.4039216, 0, 1, 1,
0.6146276, 0.9020768, 0.04985555, 0.4117647, 0, 1, 1,
0.614749, -0.1258136, 0.3243013, 0.4156863, 0, 1, 1,
0.6164451, -0.7822393, 4.086153, 0.4235294, 0, 1, 1,
0.6172329, 0.1655209, 1.459748, 0.427451, 0, 1, 1,
0.6173398, 0.6468542, 0.7899011, 0.4352941, 0, 1, 1,
0.6183244, -1.638968, 1.021906, 0.4392157, 0, 1, 1,
0.6188871, -1.201604, 1.547282, 0.4470588, 0, 1, 1,
0.6214706, 1.268337, 0.9576706, 0.4509804, 0, 1, 1,
0.6221638, 0.5884308, 0.7750387, 0.4588235, 0, 1, 1,
0.6255794, 0.4023303, 0.5047986, 0.4627451, 0, 1, 1,
0.6257645, 0.03244196, 1.995018, 0.4705882, 0, 1, 1,
0.6267456, 0.3654059, 1.279883, 0.4745098, 0, 1, 1,
0.6325967, 0.1123552, 1.284998, 0.4823529, 0, 1, 1,
0.6334008, 0.1509003, 1.814356, 0.4862745, 0, 1, 1,
0.6418926, -0.196129, 1.786617, 0.4941176, 0, 1, 1,
0.6423333, -0.8097268, 2.841629, 0.5019608, 0, 1, 1,
0.645731, 0.5170945, 0.9585854, 0.5058824, 0, 1, 1,
0.6540716, 0.4518349, 0.9862067, 0.5137255, 0, 1, 1,
0.660485, -1.450067, 3.497323, 0.5176471, 0, 1, 1,
0.6627512, 0.7411203, 0.3036723, 0.5254902, 0, 1, 1,
0.6637599, -0.8180281, 2.194227, 0.5294118, 0, 1, 1,
0.6665503, -0.601728, 2.188548, 0.5372549, 0, 1, 1,
0.6702285, -0.3391064, 2.105901, 0.5411765, 0, 1, 1,
0.6725336, 0.1118504, 0.7118645, 0.5490196, 0, 1, 1,
0.6767768, -0.4906142, 2.436579, 0.5529412, 0, 1, 1,
0.6824406, -0.303907, -0.3926032, 0.5607843, 0, 1, 1,
0.682943, -0.05772214, 1.192026, 0.5647059, 0, 1, 1,
0.6894895, -0.4140028, 2.090601, 0.572549, 0, 1, 1,
0.6901258, -1.268186, 0.9794319, 0.5764706, 0, 1, 1,
0.6935286, 0.3879397, 1.160921, 0.5843138, 0, 1, 1,
0.6956063, 0.06427247, 2.397864, 0.5882353, 0, 1, 1,
0.6961729, 0.7058716, -0.4549489, 0.5960785, 0, 1, 1,
0.7001069, 0.7805252, -0.1991764, 0.6039216, 0, 1, 1,
0.7028694, 0.8321723, 1.961643, 0.6078432, 0, 1, 1,
0.7037723, -1.812198, 1.492504, 0.6156863, 0, 1, 1,
0.704098, 0.8449984, -0.5561476, 0.6196079, 0, 1, 1,
0.7075182, 1.60041, 0.0593594, 0.627451, 0, 1, 1,
0.71018, 0.2110431, 2.053363, 0.6313726, 0, 1, 1,
0.7108123, 0.08665898, 2.292942, 0.6392157, 0, 1, 1,
0.7166389, 1.27235, 0.09773806, 0.6431373, 0, 1, 1,
0.7243062, -0.6186738, 1.095788, 0.6509804, 0, 1, 1,
0.725256, -0.8307689, 1.70612, 0.654902, 0, 1, 1,
0.7280811, 0.7326043, 1.424604, 0.6627451, 0, 1, 1,
0.7317001, 1.772825, 0.3246116, 0.6666667, 0, 1, 1,
0.7367346, 1.488775, -0.8644478, 0.6745098, 0, 1, 1,
0.7423949, 0.07477957, 1.680562, 0.6784314, 0, 1, 1,
0.750891, -0.8206566, 2.560424, 0.6862745, 0, 1, 1,
0.7528896, -1.568719, 1.609301, 0.6901961, 0, 1, 1,
0.7604247, 1.021379, 0.9431746, 0.6980392, 0, 1, 1,
0.7630408, 1.031785, 1.966421, 0.7058824, 0, 1, 1,
0.7634646, -0.3456821, 1.200451, 0.7098039, 0, 1, 1,
0.7635712, 1.265465, 1.91037, 0.7176471, 0, 1, 1,
0.7711781, 0.08615088, 1.330609, 0.7215686, 0, 1, 1,
0.7749287, 0.3230613, 0.3446913, 0.7294118, 0, 1, 1,
0.7752219, 0.3621185, 1.270659, 0.7333333, 0, 1, 1,
0.777005, 0.07495093, 2.068274, 0.7411765, 0, 1, 1,
0.7795117, 0.2081134, 1.229656, 0.7450981, 0, 1, 1,
0.7822872, -1.921801, 1.03394, 0.7529412, 0, 1, 1,
0.7838047, -1.225314, 3.625306, 0.7568628, 0, 1, 1,
0.7864324, -0.4434485, 2.265895, 0.7647059, 0, 1, 1,
0.7940981, -1.04484, 4.429999, 0.7686275, 0, 1, 1,
0.8001143, 0.2492808, 2.07751, 0.7764706, 0, 1, 1,
0.8027854, -0.009443814, 2.49198, 0.7803922, 0, 1, 1,
0.8051928, 0.5563427, 2.696253, 0.7882353, 0, 1, 1,
0.8066287, -1.331509, 2.977835, 0.7921569, 0, 1, 1,
0.8074554, 0.4683872, 0.4003063, 0.8, 0, 1, 1,
0.8078366, -0.05839087, 1.049165, 0.8078431, 0, 1, 1,
0.8113402, 0.4898693, -0.3213101, 0.8117647, 0, 1, 1,
0.8204682, 0.2200987, 1.619375, 0.8196079, 0, 1, 1,
0.8242992, -0.5567436, 1.932848, 0.8235294, 0, 1, 1,
0.8313821, 0.9735253, 0.9033273, 0.8313726, 0, 1, 1,
0.8315631, 1.462762, 1.893637, 0.8352941, 0, 1, 1,
0.832913, -1.514949, 2.769598, 0.8431373, 0, 1, 1,
0.8366486, -0.9966123, 3.651146, 0.8470588, 0, 1, 1,
0.8376577, -0.196837, 0.5943879, 0.854902, 0, 1, 1,
0.8412458, 1.685476, 0.433948, 0.8588235, 0, 1, 1,
0.8417286, 0.09270697, 1.708375, 0.8666667, 0, 1, 1,
0.8448581, 0.4397516, 2.842372, 0.8705882, 0, 1, 1,
0.8461985, 0.6584895, 0.2651204, 0.8784314, 0, 1, 1,
0.8474243, -0.5471156, 0.8007159, 0.8823529, 0, 1, 1,
0.8487704, -0.4827246, 0.4974204, 0.8901961, 0, 1, 1,
0.8534796, 0.1687225, 1.528862, 0.8941177, 0, 1, 1,
0.8566409, -0.9579471, 2.18432, 0.9019608, 0, 1, 1,
0.8617936, -1.22078, 2.693614, 0.9098039, 0, 1, 1,
0.8629589, -1.473635, 3.055814, 0.9137255, 0, 1, 1,
0.8663021, -0.1360561, 1.452376, 0.9215686, 0, 1, 1,
0.868944, -0.3587478, 2.769958, 0.9254902, 0, 1, 1,
0.8831786, -0.9180374, 3.698931, 0.9333333, 0, 1, 1,
0.8922684, -0.2480793, 0.09021107, 0.9372549, 0, 1, 1,
0.9077358, 0.01179485, 2.139939, 0.945098, 0, 1, 1,
0.9124626, 1.684629, -0.9201539, 0.9490196, 0, 1, 1,
0.9146208, 1.462302, 1.740951, 0.9568627, 0, 1, 1,
0.9153328, -0.8995733, 2.468104, 0.9607843, 0, 1, 1,
0.9172871, 0.5249415, -0.05290256, 0.9686275, 0, 1, 1,
0.9194019, -0.700756, 2.00537, 0.972549, 0, 1, 1,
0.9201443, -0.490579, 2.374431, 0.9803922, 0, 1, 1,
0.9215689, 1.618284, -0.427882, 0.9843137, 0, 1, 1,
0.9234664, -1.418479, 3.432797, 0.9921569, 0, 1, 1,
0.9293692, 0.1970032, 1.686541, 0.9960784, 0, 1, 1,
0.9309807, 1.573375, 0.1377699, 1, 0, 0.9960784, 1,
0.9472867, 1.021303, -0.3754489, 1, 0, 0.9882353, 1,
0.9479203, 1.00974, 0.8363655, 1, 0, 0.9843137, 1,
0.9567447, -0.4763572, 1.42607, 1, 0, 0.9764706, 1,
0.9592751, 1.855613, -0.06519832, 1, 0, 0.972549, 1,
0.9702776, -0.5140374, 1.2007, 1, 0, 0.9647059, 1,
0.9706024, 0.5531026, 0.6654451, 1, 0, 0.9607843, 1,
0.979401, -1.088742, 1.492096, 1, 0, 0.9529412, 1,
0.9822372, 0.05252373, 1.520476, 1, 0, 0.9490196, 1,
0.9833087, -0.1942197, 0.1466566, 1, 0, 0.9411765, 1,
0.9861721, 1.107313, 1.983043, 1, 0, 0.9372549, 1,
0.9948007, -0.8601069, 0.8653631, 1, 0, 0.9294118, 1,
0.9993791, 0.1952517, 0.9035876, 1, 0, 0.9254902, 1,
1.001202, -0.8171359, 1.763968, 1, 0, 0.9176471, 1,
1.00539, -1.212092, 1.657695, 1, 0, 0.9137255, 1,
1.013837, 1.304263, 1.252333, 1, 0, 0.9058824, 1,
1.016134, 0.5734043, 0.6924744, 1, 0, 0.9019608, 1,
1.017106, -0.2893889, 2.483292, 1, 0, 0.8941177, 1,
1.020349, 0.5811357, 1.42303, 1, 0, 0.8862745, 1,
1.021284, 1.292338, 2.424141, 1, 0, 0.8823529, 1,
1.026426, 0.7938542, 1.111024, 1, 0, 0.8745098, 1,
1.031708, 0.3724323, 0.8498274, 1, 0, 0.8705882, 1,
1.040191, -0.3094309, 2.369098, 1, 0, 0.8627451, 1,
1.041114, -0.1543763, 0.8857994, 1, 0, 0.8588235, 1,
1.047089, 1.687067, 0.1305375, 1, 0, 0.8509804, 1,
1.050897, 1.445893, 0.1755604, 1, 0, 0.8470588, 1,
1.053093, -0.5422391, 0.6556718, 1, 0, 0.8392157, 1,
1.054006, 0.2818504, 2.12548, 1, 0, 0.8352941, 1,
1.054053, 0.4953289, 2.34903, 1, 0, 0.827451, 1,
1.054829, 1.292119, -0.4974343, 1, 0, 0.8235294, 1,
1.064432, -0.3557357, 2.338078, 1, 0, 0.8156863, 1,
1.073201, 0.7801419, 2.41275, 1, 0, 0.8117647, 1,
1.075716, -1.111545, 1.98604, 1, 0, 0.8039216, 1,
1.075947, 0.1433203, 1.067097, 1, 0, 0.7960784, 1,
1.078226, 0.04467046, 0.6244506, 1, 0, 0.7921569, 1,
1.084067, 0.0724733, 2.138016, 1, 0, 0.7843137, 1,
1.086718, -0.7331129, 2.202929, 1, 0, 0.7803922, 1,
1.093652, 1.562431, 0.591234, 1, 0, 0.772549, 1,
1.093954, 0.7956501, 2.053901, 1, 0, 0.7686275, 1,
1.095553, 0.7332601, 1.927651, 1, 0, 0.7607843, 1,
1.109038, 0.03652466, 0.09713973, 1, 0, 0.7568628, 1,
1.111497, -2.123855, 1.13535, 1, 0, 0.7490196, 1,
1.111959, 1.609333, -0.1926658, 1, 0, 0.7450981, 1,
1.112643, 1.079676, 0.3783615, 1, 0, 0.7372549, 1,
1.113635, -1.230113, 3.224529, 1, 0, 0.7333333, 1,
1.117748, -1.024687, 1.194343, 1, 0, 0.7254902, 1,
1.126962, 1.77611, 1.048757, 1, 0, 0.7215686, 1,
1.138826, -0.4365089, 1.765703, 1, 0, 0.7137255, 1,
1.154549, 2.064399, 0.2404127, 1, 0, 0.7098039, 1,
1.17309, -0.4511069, 4.033143, 1, 0, 0.7019608, 1,
1.180278, -0.7654435, 3.459982, 1, 0, 0.6941177, 1,
1.18496, 1.388718, 0.6425071, 1, 0, 0.6901961, 1,
1.189147, 1.087712, 1.182166, 1, 0, 0.682353, 1,
1.195554, 0.5420924, 0.120372, 1, 0, 0.6784314, 1,
1.196581, -0.7929053, 0.7374244, 1, 0, 0.6705883, 1,
1.199845, 0.1206345, 1.247562, 1, 0, 0.6666667, 1,
1.204258, 0.5986521, 1.964795, 1, 0, 0.6588235, 1,
1.209873, -1.04188, 2.441636, 1, 0, 0.654902, 1,
1.211335, -0.8824734, 3.908828, 1, 0, 0.6470588, 1,
1.21147, 0.9715793, -0.03040824, 1, 0, 0.6431373, 1,
1.216671, -0.7642711, 0.737792, 1, 0, 0.6352941, 1,
1.223244, 1.087266, 2.072217, 1, 0, 0.6313726, 1,
1.223411, -1.03541, 2.240572, 1, 0, 0.6235294, 1,
1.226633, 0.7552002, 1.963223, 1, 0, 0.6196079, 1,
1.231518, 0.2946286, 2.50797, 1, 0, 0.6117647, 1,
1.23254, 1.515043, -0.9425612, 1, 0, 0.6078432, 1,
1.24244, 0.2021864, 2.59844, 1, 0, 0.6, 1,
1.246256, 0.8529301, 1.704005, 1, 0, 0.5921569, 1,
1.252301, -0.6774673, 2.207818, 1, 0, 0.5882353, 1,
1.258892, -0.6176654, 2.020674, 1, 0, 0.5803922, 1,
1.267354, -1.246014, 3.086157, 1, 0, 0.5764706, 1,
1.268298, 1.406151, 0.1486765, 1, 0, 0.5686275, 1,
1.273831, 1.303291, 0.1092375, 1, 0, 0.5647059, 1,
1.284704, -0.671681, 1.733433, 1, 0, 0.5568628, 1,
1.285115, 1.645983, -0.3517978, 1, 0, 0.5529412, 1,
1.290021, 1.625908, -1.075311, 1, 0, 0.5450981, 1,
1.293471, 1.344913, -0.7270267, 1, 0, 0.5411765, 1,
1.294432, 0.7018653, 0.9383752, 1, 0, 0.5333334, 1,
1.306504, 1.263902, 0.9001499, 1, 0, 0.5294118, 1,
1.315088, 1.528301, 0.6515126, 1, 0, 0.5215687, 1,
1.321201, 0.3986087, 0.9402081, 1, 0, 0.5176471, 1,
1.321594, -1.059897, 2.769155, 1, 0, 0.509804, 1,
1.34281, -0.4061882, 2.801942, 1, 0, 0.5058824, 1,
1.353131, -0.3736205, 0.7140834, 1, 0, 0.4980392, 1,
1.362588, 0.2205525, 1.311988, 1, 0, 0.4901961, 1,
1.365187, 0.6858737, 2.364906, 1, 0, 0.4862745, 1,
1.37564, 0.2485034, 2.476704, 1, 0, 0.4784314, 1,
1.396881, 0.3024619, -0.2101259, 1, 0, 0.4745098, 1,
1.416062, 0.2164817, 1.428136, 1, 0, 0.4666667, 1,
1.422211, -0.06762364, 0.884185, 1, 0, 0.4627451, 1,
1.432063, -0.934578, 2.592401, 1, 0, 0.454902, 1,
1.433197, -2.970254, 3.728195, 1, 0, 0.4509804, 1,
1.44462, -0.7622388, 1.186497, 1, 0, 0.4431373, 1,
1.445494, -0.3207788, 2.018709, 1, 0, 0.4392157, 1,
1.446585, 1.200449, 1.066492, 1, 0, 0.4313726, 1,
1.470462, -0.04581635, 0.7118779, 1, 0, 0.427451, 1,
1.477828, 0.0614525, 1.523974, 1, 0, 0.4196078, 1,
1.481831, -1.258422, 1.530297, 1, 0, 0.4156863, 1,
1.485666, 2.378341, -1.684102, 1, 0, 0.4078431, 1,
1.522837, -0.7381985, 1.838534, 1, 0, 0.4039216, 1,
1.532341, -0.123082, 2.242416, 1, 0, 0.3960784, 1,
1.533616, -1.34493, 1.793184, 1, 0, 0.3882353, 1,
1.537709, -0.6911795, 2.457477, 1, 0, 0.3843137, 1,
1.553157, 0.8881619, 0.4991725, 1, 0, 0.3764706, 1,
1.561313, 0.3932279, 3.199732, 1, 0, 0.372549, 1,
1.5693, -0.1871504, 1.769839, 1, 0, 0.3647059, 1,
1.579833, -0.1043673, 2.494675, 1, 0, 0.3607843, 1,
1.592784, -1.869332, 2.703038, 1, 0, 0.3529412, 1,
1.599766, -1.527044, 3.405806, 1, 0, 0.3490196, 1,
1.607506, -1.295651, 1.968337, 1, 0, 0.3411765, 1,
1.621436, -0.4794956, -0.3211228, 1, 0, 0.3372549, 1,
1.629182, -0.6470954, 2.163015, 1, 0, 0.3294118, 1,
1.639163, -0.01870359, 0.7039098, 1, 0, 0.3254902, 1,
1.640808, 1.683924, -0.008573966, 1, 0, 0.3176471, 1,
1.643161, -2.590872, 3.338722, 1, 0, 0.3137255, 1,
1.651436, 0.4914898, 0.2398746, 1, 0, 0.3058824, 1,
1.6551, -0.9416034, 2.152523, 1, 0, 0.2980392, 1,
1.711281, 0.4699424, 0.6547881, 1, 0, 0.2941177, 1,
1.713253, -0.4860794, 0.8782146, 1, 0, 0.2862745, 1,
1.713542, 1.307605, 1.558389, 1, 0, 0.282353, 1,
1.715516, 1.638772, 1.225125, 1, 0, 0.2745098, 1,
1.725089, 1.263023, 2.127964, 1, 0, 0.2705882, 1,
1.727813, -0.44906, 2.52577, 1, 0, 0.2627451, 1,
1.739959, -0.1442756, 1.37703, 1, 0, 0.2588235, 1,
1.744507, -0.3443837, 0.9250081, 1, 0, 0.2509804, 1,
1.745408, 0.1031806, -0.1581408, 1, 0, 0.2470588, 1,
1.757355, 0.2773504, 2.317685, 1, 0, 0.2392157, 1,
1.775953, 0.3254901, 1.630036, 1, 0, 0.2352941, 1,
1.778189, -0.2353862, 1.089548, 1, 0, 0.227451, 1,
1.783976, 1.243407, 1.905486, 1, 0, 0.2235294, 1,
1.793327, 1.59546, -0.1443978, 1, 0, 0.2156863, 1,
1.794616, -1.23975, 1.721976, 1, 0, 0.2117647, 1,
1.800811, -0.6708897, 1.724152, 1, 0, 0.2039216, 1,
1.804729, -0.9558463, 0.7691373, 1, 0, 0.1960784, 1,
1.810182, -0.616769, 1.464151, 1, 0, 0.1921569, 1,
1.818469, 0.004828447, 1.895746, 1, 0, 0.1843137, 1,
1.833968, -0.8199646, 0.4468219, 1, 0, 0.1803922, 1,
1.840027, -0.5328598, 1.902901, 1, 0, 0.172549, 1,
1.860933, 1.607072, 1.097025, 1, 0, 0.1686275, 1,
1.870579, 0.8681244, 2.262847, 1, 0, 0.1607843, 1,
1.877164, -1.022682, 2.480314, 1, 0, 0.1568628, 1,
1.878818, 0.6769092, 3.183849, 1, 0, 0.1490196, 1,
1.889473, -1.336733, 1.602361, 1, 0, 0.145098, 1,
1.90318, 1.26384, 2.522617, 1, 0, 0.1372549, 1,
1.922721, 1.502452, 1.42128, 1, 0, 0.1333333, 1,
2.001888, 0.2330693, -0.2363267, 1, 0, 0.1254902, 1,
2.027029, 0.4512278, 2.645972, 1, 0, 0.1215686, 1,
2.040393, -3.498885, 2.482644, 1, 0, 0.1137255, 1,
2.04725, -0.1567497, 0.6242304, 1, 0, 0.1098039, 1,
2.050869, 0.1564058, 1.359572, 1, 0, 0.1019608, 1,
2.05226, -2.100524, 2.179149, 1, 0, 0.09411765, 1,
2.123521, -0.7624074, 1.709907, 1, 0, 0.09019608, 1,
2.146268, 0.8640934, 1.459978, 1, 0, 0.08235294, 1,
2.178247, -0.8564531, -0.6622546, 1, 0, 0.07843138, 1,
2.195456, -0.6451423, 1.731801, 1, 0, 0.07058824, 1,
2.199357, 0.7923808, 3.808695, 1, 0, 0.06666667, 1,
2.264868, -0.9188895, 0.6054118, 1, 0, 0.05882353, 1,
2.30537, 0.7554347, -0.1484686, 1, 0, 0.05490196, 1,
2.334923, 1.018427, -0.09551278, 1, 0, 0.04705882, 1,
2.362533, -0.9708055, 3.081339, 1, 0, 0.04313726, 1,
2.430393, -0.9394127, 1.294245, 1, 0, 0.03529412, 1,
2.529302, -0.1800146, 1.5739, 1, 0, 0.03137255, 1,
2.542358, -0.1269543, 2.055036, 1, 0, 0.02352941, 1,
2.584481, -0.5073456, 1.313482, 1, 0, 0.01960784, 1,
2.931801, 2.402806, 0.607888, 1, 0, 0.01176471, 1,
3.928311, -0.06318915, 1.560581, 1, 0, 0.007843138, 1
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
0.3003403, -4.78838, -6.925312, 0, -0.5, 0.5, 0.5,
0.3003403, -4.78838, -6.925312, 1, -0.5, 0.5, 0.5,
0.3003403, -4.78838, -6.925312, 1, 1.5, 0.5, 0.5,
0.3003403, -4.78838, -6.925312, 0, 1.5, 0.5, 0.5
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
-4.557513, 0.3049339, -6.925312, 0, -0.5, 0.5, 0.5,
-4.557513, 0.3049339, -6.925312, 1, -0.5, 0.5, 0.5,
-4.557513, 0.3049339, -6.925312, 1, 1.5, 0.5, 0.5,
-4.557513, 0.3049339, -6.925312, 0, 1.5, 0.5, 0.5
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
-4.557513, -4.78838, -0.1436408, 0, -0.5, 0.5, 0.5,
-4.557513, -4.78838, -0.1436408, 1, -0.5, 0.5, 0.5,
-4.557513, -4.78838, -0.1436408, 1, 1.5, 0.5, 0.5,
-4.557513, -4.78838, -0.1436408, 0, 1.5, 0.5, 0.5
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
-2, -3.612999, -5.360311,
2, -3.612999, -5.360311,
-2, -3.612999, -5.360311,
-2, -3.808896, -5.621144,
0, -3.612999, -5.360311,
0, -3.808896, -5.621144,
2, -3.612999, -5.360311,
2, -3.808896, -5.621144
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
"0",
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
-2, -4.200689, -6.142811, 0, -0.5, 0.5, 0.5,
-2, -4.200689, -6.142811, 1, -0.5, 0.5, 0.5,
-2, -4.200689, -6.142811, 1, 1.5, 0.5, 0.5,
-2, -4.200689, -6.142811, 0, 1.5, 0.5, 0.5,
0, -4.200689, -6.142811, 0, -0.5, 0.5, 0.5,
0, -4.200689, -6.142811, 1, -0.5, 0.5, 0.5,
0, -4.200689, -6.142811, 1, 1.5, 0.5, 0.5,
0, -4.200689, -6.142811, 0, 1.5, 0.5, 0.5,
2, -4.200689, -6.142811, 0, -0.5, 0.5, 0.5,
2, -4.200689, -6.142811, 1, -0.5, 0.5, 0.5,
2, -4.200689, -6.142811, 1, 1.5, 0.5, 0.5,
2, -4.200689, -6.142811, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.43647, -2, -5.360311,
-3.43647, 4, -5.360311,
-3.43647, -2, -5.360311,
-3.62331, -2, -5.621144,
-3.43647, 0, -5.360311,
-3.62331, 0, -5.621144,
-3.43647, 2, -5.360311,
-3.62331, 2, -5.621144,
-3.43647, 4, -5.360311,
-3.62331, 4, -5.621144
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
"0",
"2",
"4"
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
-3.996991, -2, -6.142811, 0, -0.5, 0.5, 0.5,
-3.996991, -2, -6.142811, 1, -0.5, 0.5, 0.5,
-3.996991, -2, -6.142811, 1, 1.5, 0.5, 0.5,
-3.996991, -2, -6.142811, 0, 1.5, 0.5, 0.5,
-3.996991, 0, -6.142811, 0, -0.5, 0.5, 0.5,
-3.996991, 0, -6.142811, 1, -0.5, 0.5, 0.5,
-3.996991, 0, -6.142811, 1, 1.5, 0.5, 0.5,
-3.996991, 0, -6.142811, 0, 1.5, 0.5, 0.5,
-3.996991, 2, -6.142811, 0, -0.5, 0.5, 0.5,
-3.996991, 2, -6.142811, 1, -0.5, 0.5, 0.5,
-3.996991, 2, -6.142811, 1, 1.5, 0.5, 0.5,
-3.996991, 2, -6.142811, 0, 1.5, 0.5, 0.5,
-3.996991, 4, -6.142811, 0, -0.5, 0.5, 0.5,
-3.996991, 4, -6.142811, 1, -0.5, 0.5, 0.5,
-3.996991, 4, -6.142811, 1, 1.5, 0.5, 0.5,
-3.996991, 4, -6.142811, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.43647, -3.612999, -4,
-3.43647, -3.612999, 4,
-3.43647, -3.612999, -4,
-3.62331, -3.808896, -4,
-3.43647, -3.612999, -2,
-3.62331, -3.808896, -2,
-3.43647, -3.612999, 0,
-3.62331, -3.808896, 0,
-3.43647, -3.612999, 2,
-3.62331, -3.808896, 2,
-3.43647, -3.612999, 4,
-3.62331, -3.808896, 4
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
-3.996991, -4.200689, -4, 0, -0.5, 0.5, 0.5,
-3.996991, -4.200689, -4, 1, -0.5, 0.5, 0.5,
-3.996991, -4.200689, -4, 1, 1.5, 0.5, 0.5,
-3.996991, -4.200689, -4, 0, 1.5, 0.5, 0.5,
-3.996991, -4.200689, -2, 0, -0.5, 0.5, 0.5,
-3.996991, -4.200689, -2, 1, -0.5, 0.5, 0.5,
-3.996991, -4.200689, -2, 1, 1.5, 0.5, 0.5,
-3.996991, -4.200689, -2, 0, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 0, 0, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 0, 1, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 0, 1, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 0, 0, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 2, 0, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 2, 1, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 2, 1, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 2, 0, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 4, 0, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 4, 1, -0.5, 0.5, 0.5,
-3.996991, -4.200689, 4, 1, 1.5, 0.5, 0.5,
-3.996991, -4.200689, 4, 0, 1.5, 0.5, 0.5
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
-3.43647, -3.612999, -5.360311,
-3.43647, 4.222867, -5.360311,
-3.43647, -3.612999, 5.073029,
-3.43647, 4.222867, 5.073029,
-3.43647, -3.612999, -5.360311,
-3.43647, -3.612999, 5.073029,
-3.43647, 4.222867, -5.360311,
-3.43647, 4.222867, 5.073029,
-3.43647, -3.612999, -5.360311,
4.03715, -3.612999, -5.360311,
-3.43647, -3.612999, 5.073029,
4.03715, -3.612999, 5.073029,
-3.43647, 4.222867, -5.360311,
4.03715, 4.222867, -5.360311,
-3.43647, 4.222867, 5.073029,
4.03715, 4.222867, 5.073029,
4.03715, -3.612999, -5.360311,
4.03715, 4.222867, -5.360311,
4.03715, -3.612999, 5.073029,
4.03715, 4.222867, 5.073029,
4.03715, -3.612999, -5.360311,
4.03715, -3.612999, 5.073029,
4.03715, 4.222867, -5.360311,
4.03715, 4.222867, 5.073029
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
var radius = 8.029449;
var distance = 35.72392;
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
mvMatrix.translate( -0.3003403, -0.3049339, 0.1436408 );
mvMatrix.scale( 1.161632, 1.107931, 0.8321015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.72392);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
5-acetyl-8-quinolino<-read.table("5-acetyl-8-quinolino.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-5-acetyl-8-quinolino$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
y<-5-acetyl-8-quinolino$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
```

```r
z<-5-acetyl-8-quinolino$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetyl' not found
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
-3.327631, 1.052122, 0.7107955, 0, 0, 1, 1, 1,
-3.20101, 0.7189084, 0.08704577, 1, 0, 0, 1, 1,
-2.769132, -0.5410781, -3.720009, 1, 0, 0, 1, 1,
-2.76343, 0.3172142, -3.267722, 1, 0, 0, 1, 1,
-2.606369, -0.09284709, -3.006749, 1, 0, 0, 1, 1,
-2.550519, -1.955856, -0.65617, 1, 0, 0, 1, 1,
-2.505786, -0.388618, -2.146302, 0, 0, 0, 1, 1,
-2.469638, -0.2921818, -2.328175, 0, 0, 0, 1, 1,
-2.446637, -0.8529049, -2.891063, 0, 0, 0, 1, 1,
-2.415701, 0.4421628, -1.807876, 0, 0, 0, 1, 1,
-2.401258, -0.000835659, -2.468765, 0, 0, 0, 1, 1,
-2.349245, 0.08248363, -1.189274, 0, 0, 0, 1, 1,
-2.327864, -0.5941009, -2.613629, 0, 0, 0, 1, 1,
-2.199376, 0.369291, -1.23927, 1, 1, 1, 1, 1,
-2.144093, -0.1377888, 0.1377367, 1, 1, 1, 1, 1,
-2.14139, -0.001443406, -2.218381, 1, 1, 1, 1, 1,
-2.113158, 0.7143975, -2.229963, 1, 1, 1, 1, 1,
-2.070183, 0.3435946, -1.514463, 1, 1, 1, 1, 1,
-2.037179, 1.038185, -0.4427443, 1, 1, 1, 1, 1,
-2.021231, -0.8886065, -3.900541, 1, 1, 1, 1, 1,
-2.013822, -0.02371655, -1.005199, 1, 1, 1, 1, 1,
-2.007682, 1.248199, -0.4121166, 1, 1, 1, 1, 1,
-1.977469, -0.2257138, -2.434905, 1, 1, 1, 1, 1,
-1.960634, -1.507002, -1.86204, 1, 1, 1, 1, 1,
-1.898061, -1.375805, -2.72389, 1, 1, 1, 1, 1,
-1.889895, -1.001128, -1.073438, 1, 1, 1, 1, 1,
-1.889633, -0.4989104, -1.653535, 1, 1, 1, 1, 1,
-1.865293, 0.7650339, -1.392731, 1, 1, 1, 1, 1,
-1.863253, 0.5944778, -0.9204207, 0, 0, 1, 1, 1,
-1.845044, -1.042495, -3.979316, 1, 0, 0, 1, 1,
-1.789322, 1.64363, -1.023256, 1, 0, 0, 1, 1,
-1.773994, 0.3397943, 0.1170904, 1, 0, 0, 1, 1,
-1.772029, -0.2006625, -1.882192, 1, 0, 0, 1, 1,
-1.74715, 0.162233, -1.964392, 1, 0, 0, 1, 1,
-1.736782, 0.2033012, -1.73252, 0, 0, 0, 1, 1,
-1.733886, -0.2595218, -3.079842, 0, 0, 0, 1, 1,
-1.72566, -0.3323277, -0.6570176, 0, 0, 0, 1, 1,
-1.717129, -0.2234593, -1.871415, 0, 0, 0, 1, 1,
-1.705222, 1.029645, -0.5994974, 0, 0, 0, 1, 1,
-1.702855, 1.490951, -1.25725, 0, 0, 0, 1, 1,
-1.68847, -0.9947755, -2.327783, 0, 0, 0, 1, 1,
-1.679362, -0.02111981, -1.640715, 1, 1, 1, 1, 1,
-1.67802, -0.6734764, -1.004995, 1, 1, 1, 1, 1,
-1.672265, -0.2554404, -0.3096521, 1, 1, 1, 1, 1,
-1.643349, 0.5656839, -1.020025, 1, 1, 1, 1, 1,
-1.635204, 0.08686972, -1.652542, 1, 1, 1, 1, 1,
-1.630972, -0.2269345, -2.958092, 1, 1, 1, 1, 1,
-1.608533, -2.174901, -3.207682, 1, 1, 1, 1, 1,
-1.607177, -0.84669, -1.723149, 1, 1, 1, 1, 1,
-1.597235, 0.1498444, -0.6259501, 1, 1, 1, 1, 1,
-1.593031, 1.015466, -0.5262364, 1, 1, 1, 1, 1,
-1.58542, 0.6635597, -0.2366689, 1, 1, 1, 1, 1,
-1.582558, -1.627087, -1.807605, 1, 1, 1, 1, 1,
-1.575073, -0.1104016, -1.648411, 1, 1, 1, 1, 1,
-1.55895, 1.171351, -1.854232, 1, 1, 1, 1, 1,
-1.554613, 0.1318445, -0.9799343, 1, 1, 1, 1, 1,
-1.551838, -1.987627, -4.039423, 0, 0, 1, 1, 1,
-1.551446, -1.912577, -2.156723, 1, 0, 0, 1, 1,
-1.544818, 0.8941371, 0.7986255, 1, 0, 0, 1, 1,
-1.542888, 0.2292515, -1.7071, 1, 0, 0, 1, 1,
-1.532754, 1.079731, -0.1101958, 1, 0, 0, 1, 1,
-1.526207, -0.5713864, -0.7529417, 1, 0, 0, 1, 1,
-1.51491, 1.563744, -3.794507, 0, 0, 0, 1, 1,
-1.480375, -0.3350246, -1.044262, 0, 0, 0, 1, 1,
-1.479346, 0.9646366, -2.699576, 0, 0, 0, 1, 1,
-1.476261, 0.7376311, -1.670373, 0, 0, 0, 1, 1,
-1.473737, -0.2243025, -0.4429829, 0, 0, 0, 1, 1,
-1.462538, -1.351743, -3.558172, 0, 0, 0, 1, 1,
-1.460085, 0.9039509, -0.04649072, 0, 0, 0, 1, 1,
-1.456984, -1.104483, -1.579389, 1, 1, 1, 1, 1,
-1.447858, 1.368, -0.7423137, 1, 1, 1, 1, 1,
-1.437551, 1.05122, 1.161991, 1, 1, 1, 1, 1,
-1.435944, 0.3087052, -0.4002525, 1, 1, 1, 1, 1,
-1.426808, -0.6893629, -1.044035, 1, 1, 1, 1, 1,
-1.422569, 1.545932, -0.6134247, 1, 1, 1, 1, 1,
-1.421447, -0.7508571, -1.882276, 1, 1, 1, 1, 1,
-1.420342, 0.5297374, -0.162989, 1, 1, 1, 1, 1,
-1.416403, -0.3927617, -2.608662, 1, 1, 1, 1, 1,
-1.41151, 0.1852058, -1.199104, 1, 1, 1, 1, 1,
-1.407102, 2.005034, -0.3813915, 1, 1, 1, 1, 1,
-1.402914, 1.107825, -0.02805263, 1, 1, 1, 1, 1,
-1.39421, -1.018823, -1.223235, 1, 1, 1, 1, 1,
-1.378429, -0.1740147, -1.147525, 1, 1, 1, 1, 1,
-1.376441, -0.9010513, -2.429812, 1, 1, 1, 1, 1,
-1.371742, 0.9944936, -0.3568955, 0, 0, 1, 1, 1,
-1.354895, 2.052095, 0.3208931, 1, 0, 0, 1, 1,
-1.342147, -0.1685475, -2.236315, 1, 0, 0, 1, 1,
-1.340026, 0.4858354, -0.7813668, 1, 0, 0, 1, 1,
-1.339712, 0.4752883, -0.8269735, 1, 0, 0, 1, 1,
-1.319691, -1.770357, 0.5481445, 1, 0, 0, 1, 1,
-1.318121, 0.6649617, 0.3877782, 0, 0, 0, 1, 1,
-1.31477, -1.066364, -3.867505, 0, 0, 0, 1, 1,
-1.298358, 0.08844692, -0.9310154, 0, 0, 0, 1, 1,
-1.282198, 0.2864057, -1.039094, 0, 0, 0, 1, 1,
-1.282059, 1.592753, 0.5054158, 0, 0, 0, 1, 1,
-1.279317, 0.2041091, 0.6967047, 0, 0, 0, 1, 1,
-1.2763, -0.4815021, -1.226733, 0, 0, 0, 1, 1,
-1.273282, -0.6776165, -1.325773, 1, 1, 1, 1, 1,
-1.271616, 0.7097436, -1.804516, 1, 1, 1, 1, 1,
-1.266006, 0.5108241, -2.00661, 1, 1, 1, 1, 1,
-1.26574, 0.9582444, -1.129187, 1, 1, 1, 1, 1,
-1.257338, 0.6247011, -0.6162961, 1, 1, 1, 1, 1,
-1.257305, 0.3017923, -2.278239, 1, 1, 1, 1, 1,
-1.247679, 0.71595, -1.330585, 1, 1, 1, 1, 1,
-1.244256, 1.776015, 0.1839598, 1, 1, 1, 1, 1,
-1.242765, -0.3233419, -1.326787, 1, 1, 1, 1, 1,
-1.217022, -0.2211813, -1.756702, 1, 1, 1, 1, 1,
-1.21216, -0.252338, -2.470149, 1, 1, 1, 1, 1,
-1.210233, -0.6319667, -1.631872, 1, 1, 1, 1, 1,
-1.20753, 0.4606402, 0.3007638, 1, 1, 1, 1, 1,
-1.205865, -0.1085778, -1.740984, 1, 1, 1, 1, 1,
-1.2016, 1.589067, -1.841968, 1, 1, 1, 1, 1,
-1.197453, 1.406495, -1.524408, 0, 0, 1, 1, 1,
-1.186918, 0.9412971, -1.038859, 1, 0, 0, 1, 1,
-1.184242, -0.806731, -0.4249841, 1, 0, 0, 1, 1,
-1.180706, 1.952529, 0.2799657, 1, 0, 0, 1, 1,
-1.174391, 1.237345, -0.4575114, 1, 0, 0, 1, 1,
-1.173411, 0.5653614, -2.25519, 1, 0, 0, 1, 1,
-1.172657, 1.9459, -0.6448698, 0, 0, 0, 1, 1,
-1.171844, -1.146469, -1.979188, 0, 0, 0, 1, 1,
-1.165457, 0.5814946, -1.037503, 0, 0, 0, 1, 1,
-1.151744, -1.380785, -1.6937, 0, 0, 0, 1, 1,
-1.146998, 1.725605, -0.4416987, 0, 0, 0, 1, 1,
-1.146663, 0.4354392, -0.6824986, 0, 0, 0, 1, 1,
-1.140824, -0.05089166, -2.399181, 0, 0, 0, 1, 1,
-1.138686, 0.3863541, -2.183517, 1, 1, 1, 1, 1,
-1.135216, -0.4958744, -0.5898514, 1, 1, 1, 1, 1,
-1.132977, 1.381289, -0.2969221, 1, 1, 1, 1, 1,
-1.124598, 4.108753, 0.5346559, 1, 1, 1, 1, 1,
-1.11239, -0.3668864, -0.6000668, 1, 1, 1, 1, 1,
-1.111658, -0.3265054, -0.6588896, 1, 1, 1, 1, 1,
-1.110387, 0.3127792, -2.158142, 1, 1, 1, 1, 1,
-1.107654, 0.9262076, -1.984001, 1, 1, 1, 1, 1,
-1.106716, -0.65507, -2.374849, 1, 1, 1, 1, 1,
-1.088991, -0.7901264, -1.851606, 1, 1, 1, 1, 1,
-1.081819, 0.4860241, -1.509568, 1, 1, 1, 1, 1,
-1.074633, -0.4513084, 0.03397765, 1, 1, 1, 1, 1,
-1.071017, 0.5445698, -1.488581, 1, 1, 1, 1, 1,
-1.067454, 0.8702479, -0.6646413, 1, 1, 1, 1, 1,
-1.067139, 0.2404983, -2.368023, 1, 1, 1, 1, 1,
-1.065186, -0.7816356, -2.10281, 0, 0, 1, 1, 1,
-1.064804, -0.5125298, -2.233439, 1, 0, 0, 1, 1,
-1.06306, -1.011896, -1.081236, 1, 0, 0, 1, 1,
-1.061054, -1.206282, -2.835101, 1, 0, 0, 1, 1,
-1.059937, 1.149943, -0.2332705, 1, 0, 0, 1, 1,
-1.056726, -0.9255819, -2.791435, 1, 0, 0, 1, 1,
-1.05285, 0.6691591, -1.579923, 0, 0, 0, 1, 1,
-1.052388, -0.5868354, -1.672037, 0, 0, 0, 1, 1,
-1.044495, -0.9484502, -0.9101657, 0, 0, 0, 1, 1,
-1.041033, -0.6541687, -2.474623, 0, 0, 0, 1, 1,
-1.037176, -0.2080798, -1.461323, 0, 0, 0, 1, 1,
-1.035159, 1.290131, -2.289018, 0, 0, 0, 1, 1,
-1.033565, -0.001348266, -2.673739, 0, 0, 0, 1, 1,
-1.032727, 0.2775941, -0.6307174, 1, 1, 1, 1, 1,
-1.023292, -0.2738197, -1.058725, 1, 1, 1, 1, 1,
-1.017721, -0.4180669, -2.094753, 1, 1, 1, 1, 1,
-1.003281, 1.226072, 0.6840551, 1, 1, 1, 1, 1,
-1.003161, -0.5923323, -2.803651, 1, 1, 1, 1, 1,
-0.99108, -0.7535511, -2.992348, 1, 1, 1, 1, 1,
-0.9844165, -0.4434162, -2.498234, 1, 1, 1, 1, 1,
-0.981287, -0.278799, -2.651758, 1, 1, 1, 1, 1,
-0.9785346, -0.7009252, -1.788146, 1, 1, 1, 1, 1,
-0.9779152, 0.9072592, -1.646388, 1, 1, 1, 1, 1,
-0.976858, -0.2891009, -1.988564, 1, 1, 1, 1, 1,
-0.9751675, -0.01769335, -2.666359, 1, 1, 1, 1, 1,
-0.9670271, -1.141479, -3.566336, 1, 1, 1, 1, 1,
-0.9653293, -0.1407228, -2.051224, 1, 1, 1, 1, 1,
-0.9589735, -1.222677, -3.437278, 1, 1, 1, 1, 1,
-0.9501004, 0.8349262, -0.8387281, 0, 0, 1, 1, 1,
-0.9492138, -0.9896317, -3.396922, 1, 0, 0, 1, 1,
-0.9438781, -0.9850842, -1.089906, 1, 0, 0, 1, 1,
-0.9105899, 1.441682, -1.434537, 1, 0, 0, 1, 1,
-0.9083005, 0.2520906, -2.940106, 1, 0, 0, 1, 1,
-0.9050549, 0.176422, -1.443835, 1, 0, 0, 1, 1,
-0.9016469, -0.5627474, -1.966329, 0, 0, 0, 1, 1,
-0.8993541, 0.8834604, 0.3019791, 0, 0, 0, 1, 1,
-0.8941241, 1.004565, -0.2071829, 0, 0, 0, 1, 1,
-0.8854434, 1.537782, -1.291894, 0, 0, 0, 1, 1,
-0.8853181, -1.449527, -2.116179, 0, 0, 0, 1, 1,
-0.8819185, 0.7415981, -0.8294889, 0, 0, 0, 1, 1,
-0.8738237, -1.049083, -2.798436, 0, 0, 0, 1, 1,
-0.8676248, 0.2213618, -0.7623789, 1, 1, 1, 1, 1,
-0.8610546, -0.4162945, -1.25188, 1, 1, 1, 1, 1,
-0.8587239, -0.5464548, -2.430299, 1, 1, 1, 1, 1,
-0.8572785, -0.7605653, -0.8000321, 1, 1, 1, 1, 1,
-0.8547028, -0.1624416, 0.09056073, 1, 1, 1, 1, 1,
-0.8492183, -0.5043565, -3.032668, 1, 1, 1, 1, 1,
-0.8487237, -0.3245806, 0.4397292, 1, 1, 1, 1, 1,
-0.8429077, -0.3019966, -2.900909, 1, 1, 1, 1, 1,
-0.8427441, 0.5950629, -1.913714, 1, 1, 1, 1, 1,
-0.8414464, 0.6080936, -0.02074339, 1, 1, 1, 1, 1,
-0.8362914, 0.05277841, -0.5159608, 1, 1, 1, 1, 1,
-0.8346881, 0.4173259, -3.077735, 1, 1, 1, 1, 1,
-0.8329107, -1.014342, -3.760367, 1, 1, 1, 1, 1,
-0.8325995, -0.1840099, -1.905599, 1, 1, 1, 1, 1,
-0.8275757, 0.1586466, -1.519895, 1, 1, 1, 1, 1,
-0.8200709, -0.1594682, -3.036002, 0, 0, 1, 1, 1,
-0.8198659, 0.634845, -1.509367, 1, 0, 0, 1, 1,
-0.8122815, 1.283211, 0.3159634, 1, 0, 0, 1, 1,
-0.8116453, -0.5180827, -1.250376, 1, 0, 0, 1, 1,
-0.8070619, -0.87471, -2.259834, 1, 0, 0, 1, 1,
-0.7986599, -0.7219641, -3.975906, 1, 0, 0, 1, 1,
-0.7952773, 0.6901858, -0.7350393, 0, 0, 0, 1, 1,
-0.783257, -0.8123339, -3.451692, 0, 0, 0, 1, 1,
-0.7784245, 0.1662138, -2.407373, 0, 0, 0, 1, 1,
-0.7761581, 1.250653, -0.9088877, 0, 0, 0, 1, 1,
-0.7741694, -1.036081, -1.796696, 0, 0, 0, 1, 1,
-0.7693225, 1.37804, -1.632062, 0, 0, 0, 1, 1,
-0.7683131, 1.039204, -0.7473423, 0, 0, 0, 1, 1,
-0.765649, 1.456423, 1.250223, 1, 1, 1, 1, 1,
-0.76367, -0.1931532, -0.5642005, 1, 1, 1, 1, 1,
-0.7621349, -1.74404, -1.620595, 1, 1, 1, 1, 1,
-0.7587941, 0.2196635, -1.937126, 1, 1, 1, 1, 1,
-0.758056, -0.01879429, -1.955963, 1, 1, 1, 1, 1,
-0.7566814, 0.548939, -1.10329, 1, 1, 1, 1, 1,
-0.7552989, -1.76886, -3.685879, 1, 1, 1, 1, 1,
-0.7525978, 0.7538757, 0.5196202, 1, 1, 1, 1, 1,
-0.7521924, -0.5185764, -2.673005, 1, 1, 1, 1, 1,
-0.7494501, -0.0395511, -1.046025, 1, 1, 1, 1, 1,
-0.7473131, -1.088094, -1.595878, 1, 1, 1, 1, 1,
-0.7402896, 1.352465, -0.01337147, 1, 1, 1, 1, 1,
-0.7382495, 0.9626806, -2.195986, 1, 1, 1, 1, 1,
-0.7226688, -0.1576594, -3.115739, 1, 1, 1, 1, 1,
-0.7178314, -1.108329, -3.622779, 1, 1, 1, 1, 1,
-0.7147707, 0.2923242, -0.7222972, 0, 0, 1, 1, 1,
-0.7102211, 1.135287, 1.128625, 1, 0, 0, 1, 1,
-0.7094637, -0.5088854, -2.877133, 1, 0, 0, 1, 1,
-0.7076179, -1.316017, -2.715534, 1, 0, 0, 1, 1,
-0.6995355, 0.3421052, -1.406052, 1, 0, 0, 1, 1,
-0.697286, 1.133829, -1.725259, 1, 0, 0, 1, 1,
-0.6968504, -0.2086892, 0.03101743, 0, 0, 0, 1, 1,
-0.6961904, -1.12724, -1.201835, 0, 0, 0, 1, 1,
-0.6958625, -0.02206618, -2.919571, 0, 0, 0, 1, 1,
-0.6934565, 0.8184749, 0.4643751, 0, 0, 0, 1, 1,
-0.6781426, -0.7775233, -1.821893, 0, 0, 0, 1, 1,
-0.6768789, 1.063391, -3.351887, 0, 0, 0, 1, 1,
-0.6765735, 1.470444, -1.030467, 0, 0, 0, 1, 1,
-0.6758806, -0.7492622, -1.861035, 1, 1, 1, 1, 1,
-0.6754724, 1.103284, 0.9214089, 1, 1, 1, 1, 1,
-0.6678175, 0.1178215, -0.4368474, 1, 1, 1, 1, 1,
-0.6674068, -0.3300756, -1.719366, 1, 1, 1, 1, 1,
-0.6578384, 0.01760898, -0.08025324, 1, 1, 1, 1, 1,
-0.6522993, -0.2273291, -1.275436, 1, 1, 1, 1, 1,
-0.6506712, 0.3022687, -0.9891616, 1, 1, 1, 1, 1,
-0.6459602, -0.2860007, -1.151158, 1, 1, 1, 1, 1,
-0.644913, 1.986477, -0.3732263, 1, 1, 1, 1, 1,
-0.6413906, -0.7703907, -1.160633, 1, 1, 1, 1, 1,
-0.6394932, 0.04294705, -1.567104, 1, 1, 1, 1, 1,
-0.638985, 0.7243705, -0.5512382, 1, 1, 1, 1, 1,
-0.6380373, 2.059683, -2.078054, 1, 1, 1, 1, 1,
-0.6374469, -1.688468, -3.571416, 1, 1, 1, 1, 1,
-0.6371451, -0.2292016, -1.004987, 1, 1, 1, 1, 1,
-0.6338202, -1.187612, -2.34881, 0, 0, 1, 1, 1,
-0.6325678, -0.9129965, -3.096457, 1, 0, 0, 1, 1,
-0.6275494, -0.1600689, -3.195428, 1, 0, 0, 1, 1,
-0.6261902, -0.536612, -1.069575, 1, 0, 0, 1, 1,
-0.6258405, -0.5313071, -2.36826, 1, 0, 0, 1, 1,
-0.6205925, -0.5941818, -0.9091427, 1, 0, 0, 1, 1,
-0.6094313, 0.6648104, -0.528679, 0, 0, 0, 1, 1,
-0.6094044, 0.5057275, -1.446057, 0, 0, 0, 1, 1,
-0.6028562, 1.124617, -0.5077838, 0, 0, 0, 1, 1,
-0.598512, 0.7386446, -2.177699, 0, 0, 0, 1, 1,
-0.5877202, -0.6622017, -3.183861, 0, 0, 0, 1, 1,
-0.5864846, 0.4917711, -0.484139, 0, 0, 0, 1, 1,
-0.5835528, -0.5061306, -0.08811869, 0, 0, 0, 1, 1,
-0.5824099, 1.696237, -1.442262, 1, 1, 1, 1, 1,
-0.5822684, 1.656563, -1.398531, 1, 1, 1, 1, 1,
-0.5809003, -0.6062114, -1.814412, 1, 1, 1, 1, 1,
-0.5800856, 0.4753118, -0.4455878, 1, 1, 1, 1, 1,
-0.5737161, -0.3668724, -0.1952037, 1, 1, 1, 1, 1,
-0.5708753, 0.1131708, -1.10163, 1, 1, 1, 1, 1,
-0.5645761, -0.1448692, -2.610736, 1, 1, 1, 1, 1,
-0.5639865, 0.005967266, 0.4645432, 1, 1, 1, 1, 1,
-0.5598587, -0.4255194, -2.203257, 1, 1, 1, 1, 1,
-0.5593208, 1.908137, -1.291325, 1, 1, 1, 1, 1,
-0.5592393, 0.6625149, -0.3746502, 1, 1, 1, 1, 1,
-0.558507, 0.2801209, -0.1898013, 1, 1, 1, 1, 1,
-0.5464569, -0.963972, -1.403399, 1, 1, 1, 1, 1,
-0.5449049, 0.2414726, -0.229427, 1, 1, 1, 1, 1,
-0.5414592, -1.013611, -1.978447, 1, 1, 1, 1, 1,
-0.5373543, 0.6568054, -0.2997572, 0, 0, 1, 1, 1,
-0.5371069, -0.4066086, -3.843407, 1, 0, 0, 1, 1,
-0.5363531, 1.214437, -0.8279037, 1, 0, 0, 1, 1,
-0.5348131, 0.5055498, -0.9148583, 1, 0, 0, 1, 1,
-0.5335681, -2.195932, -3.456212, 1, 0, 0, 1, 1,
-0.5315354, -0.7251547, -2.479784, 1, 0, 0, 1, 1,
-0.5307574, 0.7519396, -0.8154689, 0, 0, 0, 1, 1,
-0.5274054, -0.208427, -2.304465, 0, 0, 0, 1, 1,
-0.5202594, 1.211721, -0.1173842, 0, 0, 0, 1, 1,
-0.5150771, -1.356892, -3.34975, 0, 0, 0, 1, 1,
-0.5149072, 1.566571, -0.4209063, 0, 0, 0, 1, 1,
-0.5131416, -0.4204887, -2.424819, 0, 0, 0, 1, 1,
-0.5111282, -0.781094, -4.707771, 0, 0, 0, 1, 1,
-0.5066455, 0.4008078, -1.085539, 1, 1, 1, 1, 1,
-0.495966, 0.2703379, -1.74886, 1, 1, 1, 1, 1,
-0.494754, -1.311436, -2.084656, 1, 1, 1, 1, 1,
-0.4895122, -0.7428532, -2.987208, 1, 1, 1, 1, 1,
-0.4894486, 0.8557108, 0.03272127, 1, 1, 1, 1, 1,
-0.488832, 0.6307515, -1.583532, 1, 1, 1, 1, 1,
-0.4875925, -1.326331, -4.475818, 1, 1, 1, 1, 1,
-0.4875239, -0.4340907, -1.857179, 1, 1, 1, 1, 1,
-0.4859529, 0.1558527, -3.373304, 1, 1, 1, 1, 1,
-0.4796213, 0.4109296, 0.6193592, 1, 1, 1, 1, 1,
-0.4780905, -2.010022, -2.112787, 1, 1, 1, 1, 1,
-0.4744486, 1.847798, -0.4104427, 1, 1, 1, 1, 1,
-0.4709661, 1.345388, -0.8825933, 1, 1, 1, 1, 1,
-0.470574, -0.3129264, -2.351254, 1, 1, 1, 1, 1,
-0.4688313, 1.188305, -0.9373963, 1, 1, 1, 1, 1,
-0.4663543, -0.4779537, -4.204916, 0, 0, 1, 1, 1,
-0.4606757, 0.6318948, -1.594888, 1, 0, 0, 1, 1,
-0.4583214, 1.781593, -0.3435443, 1, 0, 0, 1, 1,
-0.4577193, -0.02290063, -1.736711, 1, 0, 0, 1, 1,
-0.4472084, -0.6278391, -3.276686, 1, 0, 0, 1, 1,
-0.4398998, -0.5846768, -3.165276, 1, 0, 0, 1, 1,
-0.4356869, -0.7274644, -3.253545, 0, 0, 0, 1, 1,
-0.4304518, 0.6175344, 0.466221, 0, 0, 0, 1, 1,
-0.4272078, 0.5342873, -0.311605, 0, 0, 0, 1, 1,
-0.4241715, -0.8434938, -3.213503, 0, 0, 0, 1, 1,
-0.4211722, -0.7808859, -2.115184, 0, 0, 0, 1, 1,
-0.4188417, 1.894151, -2.270931, 0, 0, 0, 1, 1,
-0.4185554, -2.559783, -4.048363, 0, 0, 0, 1, 1,
-0.4177651, 0.2584104, -0.8247431, 1, 1, 1, 1, 1,
-0.4136496, 0.6047546, -0.005304326, 1, 1, 1, 1, 1,
-0.4111807, -0.5772105, -4.772695, 1, 1, 1, 1, 1,
-0.4100748, -1.118461, -3.944955, 1, 1, 1, 1, 1,
-0.4082023, 0.09483051, -2.094121, 1, 1, 1, 1, 1,
-0.4031501, 1.658417, -1.063934, 1, 1, 1, 1, 1,
-0.4014857, 0.5462878, -2.026904, 1, 1, 1, 1, 1,
-0.3964356, -0.04575299, -1.055515, 1, 1, 1, 1, 1,
-0.3964258, 0.4654386, 0.0853882, 1, 1, 1, 1, 1,
-0.3953692, -0.1238388, -1.32785, 1, 1, 1, 1, 1,
-0.3950038, 1.561944, 0.855493, 1, 1, 1, 1, 1,
-0.391313, 0.1794286, -2.616106, 1, 1, 1, 1, 1,
-0.3911942, -0.2087253, -2.115165, 1, 1, 1, 1, 1,
-0.3909015, -0.3855511, -2.192805, 1, 1, 1, 1, 1,
-0.3901388, 0.07382834, 0.2829971, 1, 1, 1, 1, 1,
-0.3881814, -0.4470062, -3.26043, 0, 0, 1, 1, 1,
-0.3853887, -0.8874769, -4.504972, 1, 0, 0, 1, 1,
-0.3804909, -2.998674, -3.352403, 1, 0, 0, 1, 1,
-0.3770824, 0.6027734, -0.6944999, 1, 0, 0, 1, 1,
-0.3729389, 0.9167557, -1.881029, 1, 0, 0, 1, 1,
-0.3729198, -0.1320206, -3.537707, 1, 0, 0, 1, 1,
-0.3646951, -0.6721174, -0.7429584, 0, 0, 0, 1, 1,
-0.3637362, -1.476632, -2.677159, 0, 0, 0, 1, 1,
-0.3580986, 1.828511, -0.05343682, 0, 0, 0, 1, 1,
-0.3569799, -0.2909465, -2.531648, 0, 0, 0, 1, 1,
-0.3565893, -0.300876, -2.080306, 0, 0, 0, 1, 1,
-0.3536986, -1.074906, -3.725024, 0, 0, 0, 1, 1,
-0.3503972, -1.827172, -2.947603, 0, 0, 0, 1, 1,
-0.3480265, 0.6397673, -0.5055286, 1, 1, 1, 1, 1,
-0.3450058, 1.633995, -0.9710944, 1, 1, 1, 1, 1,
-0.3384737, 0.3800588, -0.7510827, 1, 1, 1, 1, 1,
-0.3382626, 1.160548, -0.9514062, 1, 1, 1, 1, 1,
-0.336207, -0.8416186, -1.086942, 1, 1, 1, 1, 1,
-0.3345935, 0.6208311, -1.288166, 1, 1, 1, 1, 1,
-0.3342591, 0.2245585, -0.8187881, 1, 1, 1, 1, 1,
-0.3304246, 0.5167954, 0.4806126, 1, 1, 1, 1, 1,
-0.3303576, 0.5893757, -0.8437857, 1, 1, 1, 1, 1,
-0.3268785, 0.3113387, -1.325051, 1, 1, 1, 1, 1,
-0.3256315, -1.337994, -1.441696, 1, 1, 1, 1, 1,
-0.3253491, -0.1281405, -3.443131, 1, 1, 1, 1, 1,
-0.324955, 1.129268, -1.43973, 1, 1, 1, 1, 1,
-0.3230024, 1.410586, -0.8595741, 1, 1, 1, 1, 1,
-0.3173821, 0.4270479, -2.988238, 1, 1, 1, 1, 1,
-0.3157802, 0.963783, 0.1200036, 0, 0, 1, 1, 1,
-0.3155011, 0.791407, -1.071987, 1, 0, 0, 1, 1,
-0.3144022, 0.06363545, -1.776673, 1, 0, 0, 1, 1,
-0.3101499, 1.115277, -0.2320045, 1, 0, 0, 1, 1,
-0.3062526, -1.338197, -3.978961, 1, 0, 0, 1, 1,
-0.2969164, -0.3120238, -2.327068, 1, 0, 0, 1, 1,
-0.2942296, -0.442031, -2.653423, 0, 0, 0, 1, 1,
-0.292163, -0.02126678, -1.50971, 0, 0, 0, 1, 1,
-0.2919118, -0.5791692, -1.822572, 0, 0, 0, 1, 1,
-0.2900572, 0.4022773, 0.6579611, 0, 0, 0, 1, 1,
-0.2873864, -0.9259332, -2.755845, 0, 0, 0, 1, 1,
-0.2844261, 0.007795227, -2.628216, 0, 0, 0, 1, 1,
-0.2841809, -0.2619924, -3.44277, 0, 0, 0, 1, 1,
-0.2803088, -0.462571, -1.278941, 1, 1, 1, 1, 1,
-0.2802818, 2.172823, -2.242223, 1, 1, 1, 1, 1,
-0.2785932, -1.442869, -2.667031, 1, 1, 1, 1, 1,
-0.2783005, 2.045161, -1.237772, 1, 1, 1, 1, 1,
-0.2761407, -0.6467453, -2.865076, 1, 1, 1, 1, 1,
-0.2758641, 0.2871517, -2.544302, 1, 1, 1, 1, 1,
-0.2663695, -0.148914, -1.858095, 1, 1, 1, 1, 1,
-0.2622359, -0.04514026, -2.335379, 1, 1, 1, 1, 1,
-0.2619413, 0.1533014, -0.8313935, 1, 1, 1, 1, 1,
-0.2618226, 0.1929072, -0.3305079, 1, 1, 1, 1, 1,
-0.2587104, -0.04407696, -3.207167, 1, 1, 1, 1, 1,
-0.2522338, 0.9476228, 1.165536, 1, 1, 1, 1, 1,
-0.2486484, 0.5010001, -0.5523379, 1, 1, 1, 1, 1,
-0.2485492, 0.1037043, -1.384118, 1, 1, 1, 1, 1,
-0.2476555, -1.977073, -3.743678, 1, 1, 1, 1, 1,
-0.2462766, 0.8069323, -0.7405148, 0, 0, 1, 1, 1,
-0.2455329, 1.01508, -1.400777, 1, 0, 0, 1, 1,
-0.2439817, -0.08842298, -0.8112953, 1, 0, 0, 1, 1,
-0.2398931, 0.9666796, 0.5411512, 1, 0, 0, 1, 1,
-0.2397382, 0.2967734, -1.624879, 1, 0, 0, 1, 1,
-0.2394313, -1.046903, -3.123677, 1, 0, 0, 1, 1,
-0.2375884, -0.4026444, -2.857141, 0, 0, 0, 1, 1,
-0.2349768, -0.3521219, -4.573905, 0, 0, 0, 1, 1,
-0.2308963, 0.06687561, -0.2581911, 0, 0, 0, 1, 1,
-0.2268085, 0.01214624, -1.690209, 0, 0, 0, 1, 1,
-0.2211825, 0.7186485, 1.028132, 0, 0, 0, 1, 1,
-0.2161544, -0.1385954, -0.9592264, 0, 0, 0, 1, 1,
-0.2127137, -1.146278, -3.142974, 0, 0, 0, 1, 1,
-0.2120737, -1.855527, -2.723792, 1, 1, 1, 1, 1,
-0.2092009, 0.9395716, 1.010916, 1, 1, 1, 1, 1,
-0.2065247, -0.02776044, -2.292052, 1, 1, 1, 1, 1,
-0.2039888, -0.413243, -2.462656, 1, 1, 1, 1, 1,
-0.2030907, -0.796052, -3.481884, 1, 1, 1, 1, 1,
-0.2009715, 0.2710785, -0.4304655, 1, 1, 1, 1, 1,
-0.1981065, 0.01552267, -0.7420056, 1, 1, 1, 1, 1,
-0.1954876, 3.393829, -1.113959, 1, 1, 1, 1, 1,
-0.194108, 0.6575831, 1.4808, 1, 1, 1, 1, 1,
-0.1843632, -0.8306841, -2.04286, 1, 1, 1, 1, 1,
-0.1833389, 0.4802439, 1.114623, 1, 1, 1, 1, 1,
-0.1825625, 1.466797, -0.8402423, 1, 1, 1, 1, 1,
-0.1812537, 0.4217221, -0.5172651, 1, 1, 1, 1, 1,
-0.1785413, -1.186896, -1.968454, 1, 1, 1, 1, 1,
-0.1713045, 0.7813715, -0.05779667, 1, 1, 1, 1, 1,
-0.1683288, -1.107629, -3.262874, 0, 0, 1, 1, 1,
-0.1670203, -3.014637, -3.028856, 1, 0, 0, 1, 1,
-0.1652436, 0.9899533, 0.1263054, 1, 0, 0, 1, 1,
-0.1635665, -0.2973372, -2.028401, 1, 0, 0, 1, 1,
-0.1588213, -1.250147, -3.428692, 1, 0, 0, 1, 1,
-0.1547797, 0.2649196, -1.936474, 1, 0, 0, 1, 1,
-0.1531447, -1.120936, -2.833625, 0, 0, 0, 1, 1,
-0.1402353, 0.5221663, 0.518178, 0, 0, 0, 1, 1,
-0.1390108, -0.06817809, -1.760132, 0, 0, 0, 1, 1,
-0.1361656, 0.6641421, -1.578799, 0, 0, 0, 1, 1,
-0.1330743, 0.2471876, -1.26242, 0, 0, 0, 1, 1,
-0.1297942, -0.01858013, -3.485655, 0, 0, 0, 1, 1,
-0.1267492, -0.5939714, -3.217888, 0, 0, 0, 1, 1,
-0.1236234, -0.3609886, -2.667431, 1, 1, 1, 1, 1,
-0.1167101, -1.030971, -1.745397, 1, 1, 1, 1, 1,
-0.1048306, 1.426099, 0.4977832, 1, 1, 1, 1, 1,
-0.1036842, -0.0752919, -1.066326, 1, 1, 1, 1, 1,
-0.0986433, -3.315829, -1.883376, 1, 1, 1, 1, 1,
-0.09718245, -0.4723376, -1.1498, 1, 1, 1, 1, 1,
-0.09686869, 0.3215855, -0.5309878, 1, 1, 1, 1, 1,
-0.09511886, 1.931612, 0.5390205, 1, 1, 1, 1, 1,
-0.09396437, -0.05959703, -1.974853, 1, 1, 1, 1, 1,
-0.08943076, 0.1236014, -0.6283755, 1, 1, 1, 1, 1,
-0.08940836, -0.5300732, -4.396533, 1, 1, 1, 1, 1,
-0.08893431, -0.008287255, -0.6104228, 1, 1, 1, 1, 1,
-0.08092644, 0.02892469, -0.8040588, 1, 1, 1, 1, 1,
-0.0780227, -0.4077031, -5.208369, 1, 1, 1, 1, 1,
-0.07735619, 1.215741, 0.3001339, 1, 1, 1, 1, 1,
-0.0751888, -0.1787056, -4.033576, 0, 0, 1, 1, 1,
-0.07166026, 0.6847272, -0.3462203, 1, 0, 0, 1, 1,
-0.07061281, -0.6959922, -3.151568, 1, 0, 0, 1, 1,
-0.07007205, 0.2695677, -1.716149, 1, 0, 0, 1, 1,
-0.0690177, 0.4431566, -1.006756, 1, 0, 0, 1, 1,
-0.06791198, -1.784697, -3.303311, 1, 0, 0, 1, 1,
-0.06748049, -0.8761536, -3.959567, 0, 0, 0, 1, 1,
-0.06734493, -0.5328922, -4.142269, 0, 0, 0, 1, 1,
-0.06308583, -1.251396, -3.446948, 0, 0, 0, 1, 1,
-0.06303777, 0.2572083, 0.7007131, 0, 0, 0, 1, 1,
-0.06234622, 1.558458, 0.1054799, 0, 0, 0, 1, 1,
-0.06225652, -0.3177592, -4.718976, 0, 0, 0, 1, 1,
-0.05540658, 0.6422334, -1.108147, 0, 0, 0, 1, 1,
-0.05500687, 0.5878772, -1.083238, 1, 1, 1, 1, 1,
-0.05321083, 0.2135734, 0.3460835, 1, 1, 1, 1, 1,
-0.05139438, 0.6726758, -1.24262, 1, 1, 1, 1, 1,
-0.05002084, -0.2783059, -3.237917, 1, 1, 1, 1, 1,
-0.04906785, 0.7974839, -1.483336, 1, 1, 1, 1, 1,
-0.04809472, 0.6365591, -1.351667, 1, 1, 1, 1, 1,
-0.04396029, 0.655662, 0.2181057, 1, 1, 1, 1, 1,
-0.0438136, 0.4335214, 2.145954, 1, 1, 1, 1, 1,
-0.03502051, 0.202732, -1.046258, 1, 1, 1, 1, 1,
-0.0306819, 0.4204958, -0.2980222, 1, 1, 1, 1, 1,
-0.03013015, -1.115388, -3.61165, 1, 1, 1, 1, 1,
-0.02595062, 0.327591, -0.1486565, 1, 1, 1, 1, 1,
-0.02479998, 0.3878158, -0.4316631, 1, 1, 1, 1, 1,
-0.02358375, -0.292404, -3.586657, 1, 1, 1, 1, 1,
-0.02036975, 0.330284, -0.8843814, 1, 1, 1, 1, 1,
-0.01854173, -0.2052597, -3.41486, 0, 0, 1, 1, 1,
-0.01133273, 0.2836856, 0.5011864, 1, 0, 0, 1, 1,
-0.0109338, -1.084716, -2.148206, 1, 0, 0, 1, 1,
-0.006418752, 0.08351676, -0.4725301, 1, 0, 0, 1, 1,
-0.002859931, -1.261971, -3.783618, 1, 0, 0, 1, 1,
0.004470672, -0.1934593, 4.308948, 1, 0, 0, 1, 1,
0.006418623, -0.5267159, 1.244931, 0, 0, 0, 1, 1,
0.01051878, -0.2104212, 3.833404, 0, 0, 0, 1, 1,
0.01336695, -0.02339272, 2.192905, 0, 0, 0, 1, 1,
0.01635016, 1.94061, 0.7020348, 0, 0, 0, 1, 1,
0.02300958, 0.05492061, 0.4623218, 0, 0, 0, 1, 1,
0.02476062, 0.5156541, -0.2069037, 0, 0, 0, 1, 1,
0.02931703, 0.7235495, 2.364419, 0, 0, 0, 1, 1,
0.02945667, 0.731614, 0.2821654, 1, 1, 1, 1, 1,
0.03155301, -1.977314, 1.017633, 1, 1, 1, 1, 1,
0.03206592, 1.153539, -1.397972, 1, 1, 1, 1, 1,
0.03209946, -0.1459659, 4.635944, 1, 1, 1, 1, 1,
0.03265107, 1.764668, -0.127592, 1, 1, 1, 1, 1,
0.03273018, 0.5586268, -0.1778575, 1, 1, 1, 1, 1,
0.03389964, 1.691036, 0.4978407, 1, 1, 1, 1, 1,
0.03546856, -1.801798, 2.455532, 1, 1, 1, 1, 1,
0.03606163, -0.5371498, 3.615279, 1, 1, 1, 1, 1,
0.03726356, -0.6361454, 4.299306, 1, 1, 1, 1, 1,
0.04167397, 0.2388272, -1.386389, 1, 1, 1, 1, 1,
0.04195594, -0.2758731, 3.739692, 1, 1, 1, 1, 1,
0.04743113, -0.1248507, 2.052244, 1, 1, 1, 1, 1,
0.04939357, 1.967785, 0.9016172, 1, 1, 1, 1, 1,
0.05292223, -0.6165501, 0.5951817, 1, 1, 1, 1, 1,
0.05529516, 1.367208, 1.126134, 0, 0, 1, 1, 1,
0.06054917, -0.7058512, 4.921087, 1, 0, 0, 1, 1,
0.0621416, -0.4985198, 3.647623, 1, 0, 0, 1, 1,
0.06260934, -0.1379075, 2.772252, 1, 0, 0, 1, 1,
0.0642511, -0.4850491, 2.493547, 1, 0, 0, 1, 1,
0.06426114, 0.7138475, 0.08617877, 1, 0, 0, 1, 1,
0.06868777, 1.385835, 1.252953, 0, 0, 0, 1, 1,
0.07088953, -0.5549111, 4.340719, 0, 0, 0, 1, 1,
0.07422087, 0.7761478, -0.5818982, 0, 0, 0, 1, 1,
0.07713228, 0.5009769, 0.7740022, 0, 0, 0, 1, 1,
0.08056333, 1.207603, -0.9807196, 0, 0, 0, 1, 1,
0.08268556, 1.4152, 0.3017357, 0, 0, 0, 1, 1,
0.08795041, 0.1321984, -1.075803, 0, 0, 0, 1, 1,
0.09118004, -0.6945351, 3.671163, 1, 1, 1, 1, 1,
0.09235646, 0.4366543, 0.8252277, 1, 1, 1, 1, 1,
0.09366965, -0.2868375, 3.799924, 1, 1, 1, 1, 1,
0.09487347, -0.3831126, 2.307845, 1, 1, 1, 1, 1,
0.09655355, -1.540917, 2.878311, 1, 1, 1, 1, 1,
0.09697878, 0.3541164, -1.16414, 1, 1, 1, 1, 1,
0.09811545, 0.9387546, -0.3928853, 1, 1, 1, 1, 1,
0.1006245, 0.0007695625, 2.9601, 1, 1, 1, 1, 1,
0.1012262, -1.083117, 3.242802, 1, 1, 1, 1, 1,
0.1023334, -2.363102, 3.398947, 1, 1, 1, 1, 1,
0.103986, 1.393821, -0.677242, 1, 1, 1, 1, 1,
0.1058533, -1.71351, 3.220073, 1, 1, 1, 1, 1,
0.1203334, -0.5492654, 3.088446, 1, 1, 1, 1, 1,
0.1237902, -0.2429387, 3.878494, 1, 1, 1, 1, 1,
0.1257184, -0.8982176, 3.514806, 1, 1, 1, 1, 1,
0.1258205, 0.72995, 0.3695776, 0, 0, 1, 1, 1,
0.1281214, -0.8344377, 1.161284, 1, 0, 0, 1, 1,
0.1282989, -0.5726275, 2.010711, 1, 0, 0, 1, 1,
0.12919, -0.9945708, 1.737925, 1, 0, 0, 1, 1,
0.1334084, -0.1010627, 1.445004, 1, 0, 0, 1, 1,
0.1340239, 1.6238, 0.6179649, 1, 0, 0, 1, 1,
0.1357272, -1.404963, 2.323984, 0, 0, 0, 1, 1,
0.1389731, 0.5212404, 1.348664, 0, 0, 0, 1, 1,
0.1410446, 0.5515483, 0.3338404, 0, 0, 0, 1, 1,
0.1442119, -0.7461804, 2.554582, 0, 0, 0, 1, 1,
0.1487519, -0.9421821, 3.354459, 0, 0, 0, 1, 1,
0.1522187, 0.2891847, -0.7046668, 0, 0, 0, 1, 1,
0.1556066, 1.404182, -0.889643, 0, 0, 0, 1, 1,
0.1559656, -0.4947561, 3.181983, 1, 1, 1, 1, 1,
0.1590196, 1.726263, -0.6810901, 1, 1, 1, 1, 1,
0.1610246, 0.2096921, -0.2940093, 1, 1, 1, 1, 1,
0.1612373, 0.8133498, 0.4785092, 1, 1, 1, 1, 1,
0.162179, 0.8995437, 0.2706662, 1, 1, 1, 1, 1,
0.1657116, -0.8381352, 2.32788, 1, 1, 1, 1, 1,
0.1661159, -0.7954246, 3.017247, 1, 1, 1, 1, 1,
0.173764, 0.08309244, 0.8999889, 1, 1, 1, 1, 1,
0.1773758, 0.2888033, 0.6715824, 1, 1, 1, 1, 1,
0.1785566, 0.3372575, -2.424397, 1, 1, 1, 1, 1,
0.1789579, 2.11602, 0.5081856, 1, 1, 1, 1, 1,
0.1801351, 1.578882, -0.6930714, 1, 1, 1, 1, 1,
0.1816683, -1.612545, 2.191835, 1, 1, 1, 1, 1,
0.1858276, 0.5007159, 0.1718184, 1, 1, 1, 1, 1,
0.1880364, -0.2576103, 1.788049, 1, 1, 1, 1, 1,
0.1891541, -0.5238737, 2.64325, 0, 0, 1, 1, 1,
0.1908369, 0.728614, 1.344116, 1, 0, 0, 1, 1,
0.1911259, -0.3106063, 2.606717, 1, 0, 0, 1, 1,
0.1919681, -0.003871773, 1.923598, 1, 0, 0, 1, 1,
0.1936437, -0.1957315, 0.07902663, 1, 0, 0, 1, 1,
0.1963737, -0.357997, 2.068813, 1, 0, 0, 1, 1,
0.2012883, -0.3455155, 3.566184, 0, 0, 0, 1, 1,
0.2064985, -1.481475, 2.11343, 0, 0, 0, 1, 1,
0.211276, 0.2725166, 2.463025, 0, 0, 0, 1, 1,
0.2116814, -0.3554909, 4.745059, 0, 0, 0, 1, 1,
0.2165356, -1.043262, 3.447985, 0, 0, 0, 1, 1,
0.2184165, 1.538556, -0.2835594, 0, 0, 0, 1, 1,
0.2259267, -1.666669, 1.632472, 0, 0, 0, 1, 1,
0.2300383, 0.3803668, 1.332476, 1, 1, 1, 1, 1,
0.2319643, 0.1966029, -0.1459945, 1, 1, 1, 1, 1,
0.2326306, 0.03295108, 2.121408, 1, 1, 1, 1, 1,
0.2341382, 1.345476, 0.1363927, 1, 1, 1, 1, 1,
0.2349371, -0.4111384, 2.799644, 1, 1, 1, 1, 1,
0.2353116, 0.9101681, 1.33079, 1, 1, 1, 1, 1,
0.2364814, -0.2587661, 3.619056, 1, 1, 1, 1, 1,
0.2367052, 1.564158, 0.493928, 1, 1, 1, 1, 1,
0.237373, -0.8415899, 2.145498, 1, 1, 1, 1, 1,
0.2374036, -0.09493815, 3.806273, 1, 1, 1, 1, 1,
0.2375327, 2.586861, -1.595554, 1, 1, 1, 1, 1,
0.2416311, 2.380928, 0.6772895, 1, 1, 1, 1, 1,
0.2416568, -1.042574, 2.278218, 1, 1, 1, 1, 1,
0.2498455, 0.2998852, -0.4333889, 1, 1, 1, 1, 1,
0.2509858, -0.02406839, 2.384768, 1, 1, 1, 1, 1,
0.2513958, -1.954458, 4.131427, 0, 0, 1, 1, 1,
0.2565851, 0.2895598, 0.07201133, 1, 0, 0, 1, 1,
0.2600549, -0.2418542, 2.875765, 1, 0, 0, 1, 1,
0.2611095, 0.1024518, -0.300719, 1, 0, 0, 1, 1,
0.2631971, 1.634002, -0.5012404, 1, 0, 0, 1, 1,
0.2679892, 0.09350984, 1.101941, 1, 0, 0, 1, 1,
0.2688897, -0.4463612, 0.8250409, 0, 0, 0, 1, 1,
0.2737048, 0.6205262, -0.8073428, 0, 0, 0, 1, 1,
0.2773794, -0.003291356, -0.4697798, 0, 0, 0, 1, 1,
0.2783992, 1.427459, 0.4949327, 0, 0, 0, 1, 1,
0.2805761, 0.6337384, 1.403441, 0, 0, 0, 1, 1,
0.2816925, 1.171721, -0.07667085, 0, 0, 0, 1, 1,
0.282881, 0.220272, -4.823806e-05, 0, 0, 0, 1, 1,
0.2833069, -0.9510198, 2.435575, 1, 1, 1, 1, 1,
0.2849082, 0.3750075, 0.547373, 1, 1, 1, 1, 1,
0.2864588, -0.2909221, 3.087028, 1, 1, 1, 1, 1,
0.2873042, 1.760053, -1.186655, 1, 1, 1, 1, 1,
0.2877942, 0.250903, 2.398157, 1, 1, 1, 1, 1,
0.291608, -0.4450471, 1.508367, 1, 1, 1, 1, 1,
0.2946832, -0.003334984, 2.587383, 1, 1, 1, 1, 1,
0.2948065, -0.7893879, 2.720937, 1, 1, 1, 1, 1,
0.295145, 0.9586992, 0.02200337, 1, 1, 1, 1, 1,
0.2978698, -2.045461, 4.113519, 1, 1, 1, 1, 1,
0.3042246, -1.157062, 1.394872, 1, 1, 1, 1, 1,
0.308266, -0.08209249, 3.357092, 1, 1, 1, 1, 1,
0.3247461, 0.9347175, -0.5493061, 1, 1, 1, 1, 1,
0.3269789, 1.433444, 0.03496267, 1, 1, 1, 1, 1,
0.3313491, -0.187466, 3.183875, 1, 1, 1, 1, 1,
0.3330335, -0.9171955, 2.282989, 0, 0, 1, 1, 1,
0.3361578, 0.09576049, 0.8545107, 1, 0, 0, 1, 1,
0.3373024, -1.600274, 2.185792, 1, 0, 0, 1, 1,
0.3383609, -0.06422399, 2.692347, 1, 0, 0, 1, 1,
0.3388985, -0.3467617, 2.596587, 1, 0, 0, 1, 1,
0.3417214, -1.762081, 3.808186, 1, 0, 0, 1, 1,
0.3477276, 0.4971842, 0.7027168, 0, 0, 0, 1, 1,
0.3477603, -0.9080824, 1.697913, 0, 0, 0, 1, 1,
0.3478866, -0.3526168, 2.910629, 0, 0, 0, 1, 1,
0.349116, -0.2577336, 2.422297, 0, 0, 0, 1, 1,
0.3500636, 0.6486085, 0.2505793, 0, 0, 0, 1, 1,
0.3555812, -1.471776, 3.847028, 0, 0, 0, 1, 1,
0.3560901, 0.62508, 1.348003, 0, 0, 0, 1, 1,
0.356187, -1.025946, 3.688502, 1, 1, 1, 1, 1,
0.3632112, 1.776592, 1.216625, 1, 1, 1, 1, 1,
0.3678876, -0.4341325, 2.248134, 1, 1, 1, 1, 1,
0.3683321, -1.096861, 2.526355, 1, 1, 1, 1, 1,
0.3809125, 0.6929594, 0.2549561, 1, 1, 1, 1, 1,
0.3821557, 0.7128978, 0.975885, 1, 1, 1, 1, 1,
0.3898221, -0.2256338, 2.616244, 1, 1, 1, 1, 1,
0.3906289, 1.080295, 2.229295, 1, 1, 1, 1, 1,
0.3913724, 0.2140901, 2.64387, 1, 1, 1, 1, 1,
0.3926346, 0.845511, 1.312775, 1, 1, 1, 1, 1,
0.4009101, -1.159318, 2.237795, 1, 1, 1, 1, 1,
0.4009734, -0.05836209, 1.85685, 1, 1, 1, 1, 1,
0.4018179, -0.224021, 2.261681, 1, 1, 1, 1, 1,
0.4066847, -1.48522, 3.115195, 1, 1, 1, 1, 1,
0.4214947, -0.08286341, 2.759225, 1, 1, 1, 1, 1,
0.4224498, -2.778449, 4.733413, 0, 0, 1, 1, 1,
0.4261321, -0.6733953, 1.885039, 1, 0, 0, 1, 1,
0.4290639, -2.002785, 3.210586, 1, 0, 0, 1, 1,
0.4297773, 0.543539, 1.699135, 1, 0, 0, 1, 1,
0.4338814, 1.128992, 2.083401, 1, 0, 0, 1, 1,
0.4366481, 1.825015, 1.026104, 1, 0, 0, 1, 1,
0.4373875, -0.4005039, 0.9469182, 0, 0, 0, 1, 1,
0.4374748, -0.3641755, 2.271657, 0, 0, 0, 1, 1,
0.4395042, 0.5727046, 1.6002, 0, 0, 0, 1, 1,
0.4433737, 2.104895, 1.031003, 0, 0, 0, 1, 1,
0.444282, -0.05140853, 0.8744444, 0, 0, 0, 1, 1,
0.4451294, 1.029972, 1.42533, 0, 0, 0, 1, 1,
0.447058, -1.421682, 4.333658, 0, 0, 0, 1, 1,
0.4491082, 0.4099743, 0.110121, 1, 1, 1, 1, 1,
0.4580956, 0.006926985, 2.156719, 1, 1, 1, 1, 1,
0.4601061, -0.4006573, 4.216137, 1, 1, 1, 1, 1,
0.4658452, 0.4013467, 1.184933, 1, 1, 1, 1, 1,
0.4678174, 0.215719, 2.919623, 1, 1, 1, 1, 1,
0.468423, 2.24847, -1.866444, 1, 1, 1, 1, 1,
0.4726257, -1.033638, 3.000177, 1, 1, 1, 1, 1,
0.4767863, 0.8545901, 1.104446, 1, 1, 1, 1, 1,
0.4768752, 0.7051963, 0.01195196, 1, 1, 1, 1, 1,
0.4776547, -0.275372, 1.999038, 1, 1, 1, 1, 1,
0.4797371, 0.5411544, 0.7107257, 1, 1, 1, 1, 1,
0.4802725, -0.7820907, 1.896963, 1, 1, 1, 1, 1,
0.4865542, -1.658933, 2.967255, 1, 1, 1, 1, 1,
0.4878457, 1.997812, -0.5357282, 1, 1, 1, 1, 1,
0.4880802, 2.059406, -1.599824, 1, 1, 1, 1, 1,
0.4893486, 1.802253, 1.800628, 0, 0, 1, 1, 1,
0.4908469, -0.583963, 3.523707, 1, 0, 0, 1, 1,
0.4918447, -1.241621, 3.355703, 1, 0, 0, 1, 1,
0.4932739, -0.6479276, 3.509679, 1, 0, 0, 1, 1,
0.4940962, -1.799888, 2.870018, 1, 0, 0, 1, 1,
0.4950246, -0.9473011, 1.942003, 1, 0, 0, 1, 1,
0.4950421, 0.5990912, 1.287396, 0, 0, 0, 1, 1,
0.4969279, 0.9623615, 1.577173, 0, 0, 0, 1, 1,
0.497873, -0.287147, 1.444001, 0, 0, 0, 1, 1,
0.4988951, 0.476136, 0.658248, 0, 0, 0, 1, 1,
0.5005741, 0.30767, 1.418802, 0, 0, 0, 1, 1,
0.5014353, 1.849985, -1.126921, 0, 0, 0, 1, 1,
0.5045882, -0.1296787, 1.850195, 0, 0, 0, 1, 1,
0.5046603, 0.8038348, -0.2408774, 1, 1, 1, 1, 1,
0.504778, -0.1842148, 2.339093, 1, 1, 1, 1, 1,
0.5054009, -0.8245603, 2.553709, 1, 1, 1, 1, 1,
0.5061629, -0.1267856, 1.814928, 1, 1, 1, 1, 1,
0.5076959, -0.5864852, 2.542168, 1, 1, 1, 1, 1,
0.5087015, -0.170132, 0.5941246, 1, 1, 1, 1, 1,
0.5108627, 1.277592, 2.130306, 1, 1, 1, 1, 1,
0.5131008, 1.178836, 1.609936, 1, 1, 1, 1, 1,
0.5190901, -0.5157268, 2.938858, 1, 1, 1, 1, 1,
0.5227512, -0.3263864, 0.4597738, 1, 1, 1, 1, 1,
0.5234573, -0.9233627, 2.620826, 1, 1, 1, 1, 1,
0.5250831, 1.400421, 2.206508, 1, 1, 1, 1, 1,
0.525604, -0.01437692, 1.918549, 1, 1, 1, 1, 1,
0.527279, -0.3352865, 3.640403, 1, 1, 1, 1, 1,
0.5325347, 1.406551, 0.09132496, 1, 1, 1, 1, 1,
0.5331711, 1.246338, 0.959199, 0, 0, 1, 1, 1,
0.5335833, -0.3477365, 1.883835, 1, 0, 0, 1, 1,
0.5392632, 0.4865794, 1.051477, 1, 0, 0, 1, 1,
0.541873, -1.300404, 4.285048, 1, 0, 0, 1, 1,
0.5457017, -0.2165525, 3.050321, 1, 0, 0, 1, 1,
0.5557943, 1.085834, 1.520399, 1, 0, 0, 1, 1,
0.5564958, 0.8756828, 0.1434529, 0, 0, 0, 1, 1,
0.5578704, 1.326068, 1.727084, 0, 0, 0, 1, 1,
0.5644382, -1.089012, 2.522146, 0, 0, 0, 1, 1,
0.5659522, 2.340814, 1.5942, 0, 0, 0, 1, 1,
0.5742328, -0.5509562, 4.054462, 0, 0, 0, 1, 1,
0.5745643, -0.6552798, 1.259302, 0, 0, 0, 1, 1,
0.5747145, 0.6102073, 1.786348, 0, 0, 0, 1, 1,
0.575869, 0.546665, 1.01234, 1, 1, 1, 1, 1,
0.5770569, -1.149066, 2.805261, 1, 1, 1, 1, 1,
0.5801015, -0.5241116, 2.531924, 1, 1, 1, 1, 1,
0.5819014, -1.43749, 3.494992, 1, 1, 1, 1, 1,
0.5820569, -1.386195, 1.769601, 1, 1, 1, 1, 1,
0.5846464, -1.601058, 3.360795, 1, 1, 1, 1, 1,
0.5880573, -2.242941, 3.588438, 1, 1, 1, 1, 1,
0.5900016, -0.2584958, -0.9673514, 1, 1, 1, 1, 1,
0.5912629, 0.2716504, -0.1106034, 1, 1, 1, 1, 1,
0.5927559, -0.201159, 2.147205, 1, 1, 1, 1, 1,
0.5928413, -0.7239679, 2.756627, 1, 1, 1, 1, 1,
0.593567, -0.4827642, 0.3997894, 1, 1, 1, 1, 1,
0.595885, 0.05150072, 1.348489, 1, 1, 1, 1, 1,
0.5972229, 0.7546493, 1.792476, 1, 1, 1, 1, 1,
0.5982327, 1.162107, 1.768748, 1, 1, 1, 1, 1,
0.5986201, 1.551385, 0.4738714, 0, 0, 1, 1, 1,
0.6072919, -0.3276193, 1.033699, 1, 0, 0, 1, 1,
0.6099938, 0.7531224, 1.272236, 1, 0, 0, 1, 1,
0.6107138, -0.3418756, 2.492747, 1, 0, 0, 1, 1,
0.6123315, 0.1743854, 1.717781, 1, 0, 0, 1, 1,
0.6124038, -0.7322153, 0.4891393, 1, 0, 0, 1, 1,
0.6140647, -3.292683, 2.761304, 0, 0, 0, 1, 1,
0.6146276, 0.9020768, 0.04985555, 0, 0, 0, 1, 1,
0.614749, -0.1258136, 0.3243013, 0, 0, 0, 1, 1,
0.6164451, -0.7822393, 4.086153, 0, 0, 0, 1, 1,
0.6172329, 0.1655209, 1.459748, 0, 0, 0, 1, 1,
0.6173398, 0.6468542, 0.7899011, 0, 0, 0, 1, 1,
0.6183244, -1.638968, 1.021906, 0, 0, 0, 1, 1,
0.6188871, -1.201604, 1.547282, 1, 1, 1, 1, 1,
0.6214706, 1.268337, 0.9576706, 1, 1, 1, 1, 1,
0.6221638, 0.5884308, 0.7750387, 1, 1, 1, 1, 1,
0.6255794, 0.4023303, 0.5047986, 1, 1, 1, 1, 1,
0.6257645, 0.03244196, 1.995018, 1, 1, 1, 1, 1,
0.6267456, 0.3654059, 1.279883, 1, 1, 1, 1, 1,
0.6325967, 0.1123552, 1.284998, 1, 1, 1, 1, 1,
0.6334008, 0.1509003, 1.814356, 1, 1, 1, 1, 1,
0.6418926, -0.196129, 1.786617, 1, 1, 1, 1, 1,
0.6423333, -0.8097268, 2.841629, 1, 1, 1, 1, 1,
0.645731, 0.5170945, 0.9585854, 1, 1, 1, 1, 1,
0.6540716, 0.4518349, 0.9862067, 1, 1, 1, 1, 1,
0.660485, -1.450067, 3.497323, 1, 1, 1, 1, 1,
0.6627512, 0.7411203, 0.3036723, 1, 1, 1, 1, 1,
0.6637599, -0.8180281, 2.194227, 1, 1, 1, 1, 1,
0.6665503, -0.601728, 2.188548, 0, 0, 1, 1, 1,
0.6702285, -0.3391064, 2.105901, 1, 0, 0, 1, 1,
0.6725336, 0.1118504, 0.7118645, 1, 0, 0, 1, 1,
0.6767768, -0.4906142, 2.436579, 1, 0, 0, 1, 1,
0.6824406, -0.303907, -0.3926032, 1, 0, 0, 1, 1,
0.682943, -0.05772214, 1.192026, 1, 0, 0, 1, 1,
0.6894895, -0.4140028, 2.090601, 0, 0, 0, 1, 1,
0.6901258, -1.268186, 0.9794319, 0, 0, 0, 1, 1,
0.6935286, 0.3879397, 1.160921, 0, 0, 0, 1, 1,
0.6956063, 0.06427247, 2.397864, 0, 0, 0, 1, 1,
0.6961729, 0.7058716, -0.4549489, 0, 0, 0, 1, 1,
0.7001069, 0.7805252, -0.1991764, 0, 0, 0, 1, 1,
0.7028694, 0.8321723, 1.961643, 0, 0, 0, 1, 1,
0.7037723, -1.812198, 1.492504, 1, 1, 1, 1, 1,
0.704098, 0.8449984, -0.5561476, 1, 1, 1, 1, 1,
0.7075182, 1.60041, 0.0593594, 1, 1, 1, 1, 1,
0.71018, 0.2110431, 2.053363, 1, 1, 1, 1, 1,
0.7108123, 0.08665898, 2.292942, 1, 1, 1, 1, 1,
0.7166389, 1.27235, 0.09773806, 1, 1, 1, 1, 1,
0.7243062, -0.6186738, 1.095788, 1, 1, 1, 1, 1,
0.725256, -0.8307689, 1.70612, 1, 1, 1, 1, 1,
0.7280811, 0.7326043, 1.424604, 1, 1, 1, 1, 1,
0.7317001, 1.772825, 0.3246116, 1, 1, 1, 1, 1,
0.7367346, 1.488775, -0.8644478, 1, 1, 1, 1, 1,
0.7423949, 0.07477957, 1.680562, 1, 1, 1, 1, 1,
0.750891, -0.8206566, 2.560424, 1, 1, 1, 1, 1,
0.7528896, -1.568719, 1.609301, 1, 1, 1, 1, 1,
0.7604247, 1.021379, 0.9431746, 1, 1, 1, 1, 1,
0.7630408, 1.031785, 1.966421, 0, 0, 1, 1, 1,
0.7634646, -0.3456821, 1.200451, 1, 0, 0, 1, 1,
0.7635712, 1.265465, 1.91037, 1, 0, 0, 1, 1,
0.7711781, 0.08615088, 1.330609, 1, 0, 0, 1, 1,
0.7749287, 0.3230613, 0.3446913, 1, 0, 0, 1, 1,
0.7752219, 0.3621185, 1.270659, 1, 0, 0, 1, 1,
0.777005, 0.07495093, 2.068274, 0, 0, 0, 1, 1,
0.7795117, 0.2081134, 1.229656, 0, 0, 0, 1, 1,
0.7822872, -1.921801, 1.03394, 0, 0, 0, 1, 1,
0.7838047, -1.225314, 3.625306, 0, 0, 0, 1, 1,
0.7864324, -0.4434485, 2.265895, 0, 0, 0, 1, 1,
0.7940981, -1.04484, 4.429999, 0, 0, 0, 1, 1,
0.8001143, 0.2492808, 2.07751, 0, 0, 0, 1, 1,
0.8027854, -0.009443814, 2.49198, 1, 1, 1, 1, 1,
0.8051928, 0.5563427, 2.696253, 1, 1, 1, 1, 1,
0.8066287, -1.331509, 2.977835, 1, 1, 1, 1, 1,
0.8074554, 0.4683872, 0.4003063, 1, 1, 1, 1, 1,
0.8078366, -0.05839087, 1.049165, 1, 1, 1, 1, 1,
0.8113402, 0.4898693, -0.3213101, 1, 1, 1, 1, 1,
0.8204682, 0.2200987, 1.619375, 1, 1, 1, 1, 1,
0.8242992, -0.5567436, 1.932848, 1, 1, 1, 1, 1,
0.8313821, 0.9735253, 0.9033273, 1, 1, 1, 1, 1,
0.8315631, 1.462762, 1.893637, 1, 1, 1, 1, 1,
0.832913, -1.514949, 2.769598, 1, 1, 1, 1, 1,
0.8366486, -0.9966123, 3.651146, 1, 1, 1, 1, 1,
0.8376577, -0.196837, 0.5943879, 1, 1, 1, 1, 1,
0.8412458, 1.685476, 0.433948, 1, 1, 1, 1, 1,
0.8417286, 0.09270697, 1.708375, 1, 1, 1, 1, 1,
0.8448581, 0.4397516, 2.842372, 0, 0, 1, 1, 1,
0.8461985, 0.6584895, 0.2651204, 1, 0, 0, 1, 1,
0.8474243, -0.5471156, 0.8007159, 1, 0, 0, 1, 1,
0.8487704, -0.4827246, 0.4974204, 1, 0, 0, 1, 1,
0.8534796, 0.1687225, 1.528862, 1, 0, 0, 1, 1,
0.8566409, -0.9579471, 2.18432, 1, 0, 0, 1, 1,
0.8617936, -1.22078, 2.693614, 0, 0, 0, 1, 1,
0.8629589, -1.473635, 3.055814, 0, 0, 0, 1, 1,
0.8663021, -0.1360561, 1.452376, 0, 0, 0, 1, 1,
0.868944, -0.3587478, 2.769958, 0, 0, 0, 1, 1,
0.8831786, -0.9180374, 3.698931, 0, 0, 0, 1, 1,
0.8922684, -0.2480793, 0.09021107, 0, 0, 0, 1, 1,
0.9077358, 0.01179485, 2.139939, 0, 0, 0, 1, 1,
0.9124626, 1.684629, -0.9201539, 1, 1, 1, 1, 1,
0.9146208, 1.462302, 1.740951, 1, 1, 1, 1, 1,
0.9153328, -0.8995733, 2.468104, 1, 1, 1, 1, 1,
0.9172871, 0.5249415, -0.05290256, 1, 1, 1, 1, 1,
0.9194019, -0.700756, 2.00537, 1, 1, 1, 1, 1,
0.9201443, -0.490579, 2.374431, 1, 1, 1, 1, 1,
0.9215689, 1.618284, -0.427882, 1, 1, 1, 1, 1,
0.9234664, -1.418479, 3.432797, 1, 1, 1, 1, 1,
0.9293692, 0.1970032, 1.686541, 1, 1, 1, 1, 1,
0.9309807, 1.573375, 0.1377699, 1, 1, 1, 1, 1,
0.9472867, 1.021303, -0.3754489, 1, 1, 1, 1, 1,
0.9479203, 1.00974, 0.8363655, 1, 1, 1, 1, 1,
0.9567447, -0.4763572, 1.42607, 1, 1, 1, 1, 1,
0.9592751, 1.855613, -0.06519832, 1, 1, 1, 1, 1,
0.9702776, -0.5140374, 1.2007, 1, 1, 1, 1, 1,
0.9706024, 0.5531026, 0.6654451, 0, 0, 1, 1, 1,
0.979401, -1.088742, 1.492096, 1, 0, 0, 1, 1,
0.9822372, 0.05252373, 1.520476, 1, 0, 0, 1, 1,
0.9833087, -0.1942197, 0.1466566, 1, 0, 0, 1, 1,
0.9861721, 1.107313, 1.983043, 1, 0, 0, 1, 1,
0.9948007, -0.8601069, 0.8653631, 1, 0, 0, 1, 1,
0.9993791, 0.1952517, 0.9035876, 0, 0, 0, 1, 1,
1.001202, -0.8171359, 1.763968, 0, 0, 0, 1, 1,
1.00539, -1.212092, 1.657695, 0, 0, 0, 1, 1,
1.013837, 1.304263, 1.252333, 0, 0, 0, 1, 1,
1.016134, 0.5734043, 0.6924744, 0, 0, 0, 1, 1,
1.017106, -0.2893889, 2.483292, 0, 0, 0, 1, 1,
1.020349, 0.5811357, 1.42303, 0, 0, 0, 1, 1,
1.021284, 1.292338, 2.424141, 1, 1, 1, 1, 1,
1.026426, 0.7938542, 1.111024, 1, 1, 1, 1, 1,
1.031708, 0.3724323, 0.8498274, 1, 1, 1, 1, 1,
1.040191, -0.3094309, 2.369098, 1, 1, 1, 1, 1,
1.041114, -0.1543763, 0.8857994, 1, 1, 1, 1, 1,
1.047089, 1.687067, 0.1305375, 1, 1, 1, 1, 1,
1.050897, 1.445893, 0.1755604, 1, 1, 1, 1, 1,
1.053093, -0.5422391, 0.6556718, 1, 1, 1, 1, 1,
1.054006, 0.2818504, 2.12548, 1, 1, 1, 1, 1,
1.054053, 0.4953289, 2.34903, 1, 1, 1, 1, 1,
1.054829, 1.292119, -0.4974343, 1, 1, 1, 1, 1,
1.064432, -0.3557357, 2.338078, 1, 1, 1, 1, 1,
1.073201, 0.7801419, 2.41275, 1, 1, 1, 1, 1,
1.075716, -1.111545, 1.98604, 1, 1, 1, 1, 1,
1.075947, 0.1433203, 1.067097, 1, 1, 1, 1, 1,
1.078226, 0.04467046, 0.6244506, 0, 0, 1, 1, 1,
1.084067, 0.0724733, 2.138016, 1, 0, 0, 1, 1,
1.086718, -0.7331129, 2.202929, 1, 0, 0, 1, 1,
1.093652, 1.562431, 0.591234, 1, 0, 0, 1, 1,
1.093954, 0.7956501, 2.053901, 1, 0, 0, 1, 1,
1.095553, 0.7332601, 1.927651, 1, 0, 0, 1, 1,
1.109038, 0.03652466, 0.09713973, 0, 0, 0, 1, 1,
1.111497, -2.123855, 1.13535, 0, 0, 0, 1, 1,
1.111959, 1.609333, -0.1926658, 0, 0, 0, 1, 1,
1.112643, 1.079676, 0.3783615, 0, 0, 0, 1, 1,
1.113635, -1.230113, 3.224529, 0, 0, 0, 1, 1,
1.117748, -1.024687, 1.194343, 0, 0, 0, 1, 1,
1.126962, 1.77611, 1.048757, 0, 0, 0, 1, 1,
1.138826, -0.4365089, 1.765703, 1, 1, 1, 1, 1,
1.154549, 2.064399, 0.2404127, 1, 1, 1, 1, 1,
1.17309, -0.4511069, 4.033143, 1, 1, 1, 1, 1,
1.180278, -0.7654435, 3.459982, 1, 1, 1, 1, 1,
1.18496, 1.388718, 0.6425071, 1, 1, 1, 1, 1,
1.189147, 1.087712, 1.182166, 1, 1, 1, 1, 1,
1.195554, 0.5420924, 0.120372, 1, 1, 1, 1, 1,
1.196581, -0.7929053, 0.7374244, 1, 1, 1, 1, 1,
1.199845, 0.1206345, 1.247562, 1, 1, 1, 1, 1,
1.204258, 0.5986521, 1.964795, 1, 1, 1, 1, 1,
1.209873, -1.04188, 2.441636, 1, 1, 1, 1, 1,
1.211335, -0.8824734, 3.908828, 1, 1, 1, 1, 1,
1.21147, 0.9715793, -0.03040824, 1, 1, 1, 1, 1,
1.216671, -0.7642711, 0.737792, 1, 1, 1, 1, 1,
1.223244, 1.087266, 2.072217, 1, 1, 1, 1, 1,
1.223411, -1.03541, 2.240572, 0, 0, 1, 1, 1,
1.226633, 0.7552002, 1.963223, 1, 0, 0, 1, 1,
1.231518, 0.2946286, 2.50797, 1, 0, 0, 1, 1,
1.23254, 1.515043, -0.9425612, 1, 0, 0, 1, 1,
1.24244, 0.2021864, 2.59844, 1, 0, 0, 1, 1,
1.246256, 0.8529301, 1.704005, 1, 0, 0, 1, 1,
1.252301, -0.6774673, 2.207818, 0, 0, 0, 1, 1,
1.258892, -0.6176654, 2.020674, 0, 0, 0, 1, 1,
1.267354, -1.246014, 3.086157, 0, 0, 0, 1, 1,
1.268298, 1.406151, 0.1486765, 0, 0, 0, 1, 1,
1.273831, 1.303291, 0.1092375, 0, 0, 0, 1, 1,
1.284704, -0.671681, 1.733433, 0, 0, 0, 1, 1,
1.285115, 1.645983, -0.3517978, 0, 0, 0, 1, 1,
1.290021, 1.625908, -1.075311, 1, 1, 1, 1, 1,
1.293471, 1.344913, -0.7270267, 1, 1, 1, 1, 1,
1.294432, 0.7018653, 0.9383752, 1, 1, 1, 1, 1,
1.306504, 1.263902, 0.9001499, 1, 1, 1, 1, 1,
1.315088, 1.528301, 0.6515126, 1, 1, 1, 1, 1,
1.321201, 0.3986087, 0.9402081, 1, 1, 1, 1, 1,
1.321594, -1.059897, 2.769155, 1, 1, 1, 1, 1,
1.34281, -0.4061882, 2.801942, 1, 1, 1, 1, 1,
1.353131, -0.3736205, 0.7140834, 1, 1, 1, 1, 1,
1.362588, 0.2205525, 1.311988, 1, 1, 1, 1, 1,
1.365187, 0.6858737, 2.364906, 1, 1, 1, 1, 1,
1.37564, 0.2485034, 2.476704, 1, 1, 1, 1, 1,
1.396881, 0.3024619, -0.2101259, 1, 1, 1, 1, 1,
1.416062, 0.2164817, 1.428136, 1, 1, 1, 1, 1,
1.422211, -0.06762364, 0.884185, 1, 1, 1, 1, 1,
1.432063, -0.934578, 2.592401, 0, 0, 1, 1, 1,
1.433197, -2.970254, 3.728195, 1, 0, 0, 1, 1,
1.44462, -0.7622388, 1.186497, 1, 0, 0, 1, 1,
1.445494, -0.3207788, 2.018709, 1, 0, 0, 1, 1,
1.446585, 1.200449, 1.066492, 1, 0, 0, 1, 1,
1.470462, -0.04581635, 0.7118779, 1, 0, 0, 1, 1,
1.477828, 0.0614525, 1.523974, 0, 0, 0, 1, 1,
1.481831, -1.258422, 1.530297, 0, 0, 0, 1, 1,
1.485666, 2.378341, -1.684102, 0, 0, 0, 1, 1,
1.522837, -0.7381985, 1.838534, 0, 0, 0, 1, 1,
1.532341, -0.123082, 2.242416, 0, 0, 0, 1, 1,
1.533616, -1.34493, 1.793184, 0, 0, 0, 1, 1,
1.537709, -0.6911795, 2.457477, 0, 0, 0, 1, 1,
1.553157, 0.8881619, 0.4991725, 1, 1, 1, 1, 1,
1.561313, 0.3932279, 3.199732, 1, 1, 1, 1, 1,
1.5693, -0.1871504, 1.769839, 1, 1, 1, 1, 1,
1.579833, -0.1043673, 2.494675, 1, 1, 1, 1, 1,
1.592784, -1.869332, 2.703038, 1, 1, 1, 1, 1,
1.599766, -1.527044, 3.405806, 1, 1, 1, 1, 1,
1.607506, -1.295651, 1.968337, 1, 1, 1, 1, 1,
1.621436, -0.4794956, -0.3211228, 1, 1, 1, 1, 1,
1.629182, -0.6470954, 2.163015, 1, 1, 1, 1, 1,
1.639163, -0.01870359, 0.7039098, 1, 1, 1, 1, 1,
1.640808, 1.683924, -0.008573966, 1, 1, 1, 1, 1,
1.643161, -2.590872, 3.338722, 1, 1, 1, 1, 1,
1.651436, 0.4914898, 0.2398746, 1, 1, 1, 1, 1,
1.6551, -0.9416034, 2.152523, 1, 1, 1, 1, 1,
1.711281, 0.4699424, 0.6547881, 1, 1, 1, 1, 1,
1.713253, -0.4860794, 0.8782146, 0, 0, 1, 1, 1,
1.713542, 1.307605, 1.558389, 1, 0, 0, 1, 1,
1.715516, 1.638772, 1.225125, 1, 0, 0, 1, 1,
1.725089, 1.263023, 2.127964, 1, 0, 0, 1, 1,
1.727813, -0.44906, 2.52577, 1, 0, 0, 1, 1,
1.739959, -0.1442756, 1.37703, 1, 0, 0, 1, 1,
1.744507, -0.3443837, 0.9250081, 0, 0, 0, 1, 1,
1.745408, 0.1031806, -0.1581408, 0, 0, 0, 1, 1,
1.757355, 0.2773504, 2.317685, 0, 0, 0, 1, 1,
1.775953, 0.3254901, 1.630036, 0, 0, 0, 1, 1,
1.778189, -0.2353862, 1.089548, 0, 0, 0, 1, 1,
1.783976, 1.243407, 1.905486, 0, 0, 0, 1, 1,
1.793327, 1.59546, -0.1443978, 0, 0, 0, 1, 1,
1.794616, -1.23975, 1.721976, 1, 1, 1, 1, 1,
1.800811, -0.6708897, 1.724152, 1, 1, 1, 1, 1,
1.804729, -0.9558463, 0.7691373, 1, 1, 1, 1, 1,
1.810182, -0.616769, 1.464151, 1, 1, 1, 1, 1,
1.818469, 0.004828447, 1.895746, 1, 1, 1, 1, 1,
1.833968, -0.8199646, 0.4468219, 1, 1, 1, 1, 1,
1.840027, -0.5328598, 1.902901, 1, 1, 1, 1, 1,
1.860933, 1.607072, 1.097025, 1, 1, 1, 1, 1,
1.870579, 0.8681244, 2.262847, 1, 1, 1, 1, 1,
1.877164, -1.022682, 2.480314, 1, 1, 1, 1, 1,
1.878818, 0.6769092, 3.183849, 1, 1, 1, 1, 1,
1.889473, -1.336733, 1.602361, 1, 1, 1, 1, 1,
1.90318, 1.26384, 2.522617, 1, 1, 1, 1, 1,
1.922721, 1.502452, 1.42128, 1, 1, 1, 1, 1,
2.001888, 0.2330693, -0.2363267, 1, 1, 1, 1, 1,
2.027029, 0.4512278, 2.645972, 0, 0, 1, 1, 1,
2.040393, -3.498885, 2.482644, 1, 0, 0, 1, 1,
2.04725, -0.1567497, 0.6242304, 1, 0, 0, 1, 1,
2.050869, 0.1564058, 1.359572, 1, 0, 0, 1, 1,
2.05226, -2.100524, 2.179149, 1, 0, 0, 1, 1,
2.123521, -0.7624074, 1.709907, 1, 0, 0, 1, 1,
2.146268, 0.8640934, 1.459978, 0, 0, 0, 1, 1,
2.178247, -0.8564531, -0.6622546, 0, 0, 0, 1, 1,
2.195456, -0.6451423, 1.731801, 0, 0, 0, 1, 1,
2.199357, 0.7923808, 3.808695, 0, 0, 0, 1, 1,
2.264868, -0.9188895, 0.6054118, 0, 0, 0, 1, 1,
2.30537, 0.7554347, -0.1484686, 0, 0, 0, 1, 1,
2.334923, 1.018427, -0.09551278, 0, 0, 0, 1, 1,
2.362533, -0.9708055, 3.081339, 1, 1, 1, 1, 1,
2.430393, -0.9394127, 1.294245, 1, 1, 1, 1, 1,
2.529302, -0.1800146, 1.5739, 1, 1, 1, 1, 1,
2.542358, -0.1269543, 2.055036, 1, 1, 1, 1, 1,
2.584481, -0.5073456, 1.313482, 1, 1, 1, 1, 1,
2.931801, 2.402806, 0.607888, 1, 1, 1, 1, 1,
3.928311, -0.06318915, 1.560581, 1, 1, 1, 1, 1
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
var radius = 9.916835;
var distance = 34.83246;
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
mvMatrix.translate( -0.3003402, -0.3049338, 0.1436408 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83246);
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