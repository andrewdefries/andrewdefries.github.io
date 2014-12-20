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
-3.063937, -0.6196159, -0.177525, 1, 0, 0, 1,
-2.740776, 0.1267842, 0.4570228, 1, 0.007843138, 0, 1,
-2.726813, -0.2119397, -1.254304, 1, 0.01176471, 0, 1,
-2.630901, -0.1006484, -1.747904, 1, 0.01960784, 0, 1,
-2.617944, 0.03673004, -2.529875, 1, 0.02352941, 0, 1,
-2.590325, -0.7544157, -1.036337, 1, 0.03137255, 0, 1,
-2.510269, 0.9078537, -0.7043923, 1, 0.03529412, 0, 1,
-2.460238, -1.274753, -3.325995, 1, 0.04313726, 0, 1,
-2.350136, -0.681199, -2.863195, 1, 0.04705882, 0, 1,
-2.334553, 0.5313166, -2.887089, 1, 0.05490196, 0, 1,
-2.268995, 1.450284, -0.1475301, 1, 0.05882353, 0, 1,
-2.224776, -0.1296789, -0.8192438, 1, 0.06666667, 0, 1,
-2.105332, 0.06716228, -1.568167, 1, 0.07058824, 0, 1,
-2.10442, 1.535246, -0.8799502, 1, 0.07843138, 0, 1,
-2.095908, -0.8465123, -2.194308, 1, 0.08235294, 0, 1,
-2.094899, 1.599043, -1.220378, 1, 0.09019608, 0, 1,
-2.081847, 0.2996496, -1.096578, 1, 0.09411765, 0, 1,
-2.0575, 2.4408, 1.716758, 1, 0.1019608, 0, 1,
-2.052076, -0.7435294, -1.00487, 1, 0.1098039, 0, 1,
-2.046231, 0.707843, -1.500426, 1, 0.1137255, 0, 1,
-2.017014, -1.980637, -1.635936, 1, 0.1215686, 0, 1,
-2.01156, 2.052334, -0.7315003, 1, 0.1254902, 0, 1,
-2.011484, -0.5392362, -1.56551, 1, 0.1333333, 0, 1,
-1.996908, 1.806073, 0.4546736, 1, 0.1372549, 0, 1,
-1.955765, -0.2181853, -2.755973, 1, 0.145098, 0, 1,
-1.886152, 0.6417232, -0.6278678, 1, 0.1490196, 0, 1,
-1.882872, 1.729475, -1.462296, 1, 0.1568628, 0, 1,
-1.858818, 0.04747876, -0.7889268, 1, 0.1607843, 0, 1,
-1.851204, -1.049867, -1.564215, 1, 0.1686275, 0, 1,
-1.846591, -0.1746996, -0.6026332, 1, 0.172549, 0, 1,
-1.843851, -0.06007983, -2.947439, 1, 0.1803922, 0, 1,
-1.829504, -2.050067, -2.012948, 1, 0.1843137, 0, 1,
-1.820016, -0.1149482, -1.981101, 1, 0.1921569, 0, 1,
-1.816503, -0.4118298, -1.272596, 1, 0.1960784, 0, 1,
-1.815234, -2.370426, -2.744191, 1, 0.2039216, 0, 1,
-1.798836, 0.6717151, -0.989621, 1, 0.2117647, 0, 1,
-1.78737, 0.5921501, -1.820798, 1, 0.2156863, 0, 1,
-1.782295, -0.4821481, -0.2450874, 1, 0.2235294, 0, 1,
-1.779737, -1.731668, -1.677267, 1, 0.227451, 0, 1,
-1.758101, -1.904187, -2.269361, 1, 0.2352941, 0, 1,
-1.738749, -0.2372078, -1.8879, 1, 0.2392157, 0, 1,
-1.729288, -1.419952, -2.026298, 1, 0.2470588, 0, 1,
-1.715174, 0.0806241, -1.014643, 1, 0.2509804, 0, 1,
-1.710599, -0.8583248, -2.223263, 1, 0.2588235, 0, 1,
-1.690866, -0.6011305, -1.615348, 1, 0.2627451, 0, 1,
-1.68804, 0.2240669, -0.985122, 1, 0.2705882, 0, 1,
-1.674663, 1.421546, -0.2161694, 1, 0.2745098, 0, 1,
-1.670317, 3.258364, -0.3840007, 1, 0.282353, 0, 1,
-1.655555, 0.2731688, -1.083825, 1, 0.2862745, 0, 1,
-1.65555, 0.7076122, -1.010549, 1, 0.2941177, 0, 1,
-1.65123, 1.60763, -0.2051672, 1, 0.3019608, 0, 1,
-1.642804, -0.6928501, -1.860601, 1, 0.3058824, 0, 1,
-1.640368, 1.247572, -0.9339852, 1, 0.3137255, 0, 1,
-1.63324, 0.2246047, -0.8428196, 1, 0.3176471, 0, 1,
-1.61249, 0.1946089, -3.018944, 1, 0.3254902, 0, 1,
-1.60921, 0.4792808, -2.086908, 1, 0.3294118, 0, 1,
-1.604897, -0.02468862, -2.048687, 1, 0.3372549, 0, 1,
-1.604241, 1.345904, -1.480119, 1, 0.3411765, 0, 1,
-1.602246, -0.1924329, -0.6104594, 1, 0.3490196, 0, 1,
-1.602004, 1.480082, -0.6764065, 1, 0.3529412, 0, 1,
-1.594174, -0.7140349, -0.3494956, 1, 0.3607843, 0, 1,
-1.591336, -0.3802746, -1.164231, 1, 0.3647059, 0, 1,
-1.567921, -1.210376, -2.623716, 1, 0.372549, 0, 1,
-1.560357, -0.1323583, -1.323017, 1, 0.3764706, 0, 1,
-1.557537, -0.6736443, -3.311397, 1, 0.3843137, 0, 1,
-1.544492, 0.828943, -2.779901, 1, 0.3882353, 0, 1,
-1.543727, -0.3594272, -1.281987, 1, 0.3960784, 0, 1,
-1.538219, -0.2631916, -1.368497, 1, 0.4039216, 0, 1,
-1.535891, 0.04043796, -1.179613, 1, 0.4078431, 0, 1,
-1.526786, -0.462261, -1.789074, 1, 0.4156863, 0, 1,
-1.52016, -1.538063, -4.193936, 1, 0.4196078, 0, 1,
-1.520056, -0.4214926, -1.03059, 1, 0.427451, 0, 1,
-1.515103, -0.3274347, -2.83732, 1, 0.4313726, 0, 1,
-1.475175, 0.822808, -1.587091, 1, 0.4392157, 0, 1,
-1.46938, -0.9961087, -2.076011, 1, 0.4431373, 0, 1,
-1.465708, 1.838288, -0.1682154, 1, 0.4509804, 0, 1,
-1.45507, 0.4060139, -2.764353, 1, 0.454902, 0, 1,
-1.45073, -0.9209632, -1.214043, 1, 0.4627451, 0, 1,
-1.434874, 1.028237, -1.840639, 1, 0.4666667, 0, 1,
-1.425573, -1.210403, -3.158357, 1, 0.4745098, 0, 1,
-1.422022, -2.111666, -1.986649, 1, 0.4784314, 0, 1,
-1.420071, 1.846683, -2.252507, 1, 0.4862745, 0, 1,
-1.417919, 0.009622997, -1.905623, 1, 0.4901961, 0, 1,
-1.415372, 0.8643924, -0.5476516, 1, 0.4980392, 0, 1,
-1.403092, -0.8142201, -2.898902, 1, 0.5058824, 0, 1,
-1.394297, -0.4940983, -1.241041, 1, 0.509804, 0, 1,
-1.389726, 0.1265225, -2.612419, 1, 0.5176471, 0, 1,
-1.389714, 1.710567, -0.933134, 1, 0.5215687, 0, 1,
-1.387316, -0.6444833, -2.059974, 1, 0.5294118, 0, 1,
-1.376568, -0.4107026, -1.039946, 1, 0.5333334, 0, 1,
-1.372679, -0.5405018, -1.278154, 1, 0.5411765, 0, 1,
-1.369954, -0.6964083, -1.692309, 1, 0.5450981, 0, 1,
-1.367572, -0.7673094, -3.952355, 1, 0.5529412, 0, 1,
-1.34599, -0.03382055, -1.099792, 1, 0.5568628, 0, 1,
-1.320561, -0.4521348, -1.064801, 1, 0.5647059, 0, 1,
-1.315462, 0.04553985, -3.192487, 1, 0.5686275, 0, 1,
-1.310716, 1.394994, -1.366947, 1, 0.5764706, 0, 1,
-1.30641, -0.5122395, -2.948591, 1, 0.5803922, 0, 1,
-1.303377, 0.3290904, -0.9530641, 1, 0.5882353, 0, 1,
-1.290839, 1.926332, -0.8903627, 1, 0.5921569, 0, 1,
-1.286351, 1.075436, -1.853944, 1, 0.6, 0, 1,
-1.281252, 0.110756, -2.965868, 1, 0.6078432, 0, 1,
-1.280975, 1.297612, -0.8249167, 1, 0.6117647, 0, 1,
-1.267654, -0.5596169, -0.511057, 1, 0.6196079, 0, 1,
-1.265263, 0.5194369, -2.821877, 1, 0.6235294, 0, 1,
-1.264384, -0.9769056, -2.201783, 1, 0.6313726, 0, 1,
-1.263628, -1.23601, -0.6320304, 1, 0.6352941, 0, 1,
-1.261721, 0.7513215, 0.06418831, 1, 0.6431373, 0, 1,
-1.252274, -0.8296789, -3.105977, 1, 0.6470588, 0, 1,
-1.250674, -1.038778, -3.14561, 1, 0.654902, 0, 1,
-1.243065, -0.2547911, -2.839562, 1, 0.6588235, 0, 1,
-1.234864, -0.8285524, -3.279472, 1, 0.6666667, 0, 1,
-1.231043, -0.4320734, -2.781193, 1, 0.6705883, 0, 1,
-1.222992, 0.2779782, -2.998361, 1, 0.6784314, 0, 1,
-1.220984, 1.08216, -0.2537933, 1, 0.682353, 0, 1,
-1.214461, 0.07413372, -1.47977, 1, 0.6901961, 0, 1,
-1.212974, 1.163657, -1.033448, 1, 0.6941177, 0, 1,
-1.21098, -0.4561347, -1.562943, 1, 0.7019608, 0, 1,
-1.206599, -0.4024426, -2.397094, 1, 0.7098039, 0, 1,
-1.202549, -1.068646, -0.8941096, 1, 0.7137255, 0, 1,
-1.200417, -1.912664, -1.632269, 1, 0.7215686, 0, 1,
-1.199478, 0.5713006, -1.185013, 1, 0.7254902, 0, 1,
-1.198082, -0.3697068, -2.117417, 1, 0.7333333, 0, 1,
-1.195849, -0.5975212, -1.414332, 1, 0.7372549, 0, 1,
-1.186387, -2.200987, -3.383848, 1, 0.7450981, 0, 1,
-1.181336, -1.19349, -3.296477, 1, 0.7490196, 0, 1,
-1.177373, -0.6405775, -0.3601449, 1, 0.7568628, 0, 1,
-1.176934, 0.7755364, -4.434128, 1, 0.7607843, 0, 1,
-1.175816, 1.234771, -1.253296, 1, 0.7686275, 0, 1,
-1.166109, -0.2957683, -1.954146, 1, 0.772549, 0, 1,
-1.164097, 0.1696858, -1.493402, 1, 0.7803922, 0, 1,
-1.161759, 1.632685, -1.973144, 1, 0.7843137, 0, 1,
-1.156901, -0.7185391, -1.204625, 1, 0.7921569, 0, 1,
-1.149926, -1.187448, -2.447865, 1, 0.7960784, 0, 1,
-1.14183, -0.2679732, -0.02794336, 1, 0.8039216, 0, 1,
-1.136481, -0.6376213, -1.832354, 1, 0.8117647, 0, 1,
-1.118923, -0.7365996, -1.686364, 1, 0.8156863, 0, 1,
-1.117722, -0.474076, -2.019775, 1, 0.8235294, 0, 1,
-1.110442, 1.52124, -0.7880535, 1, 0.827451, 0, 1,
-1.109266, 0.2253714, -0.4387156, 1, 0.8352941, 0, 1,
-1.103209, -2.2837, -3.37034, 1, 0.8392157, 0, 1,
-1.101773, -0.4333903, -2.028013, 1, 0.8470588, 0, 1,
-1.092023, 0.3535394, -1.312799, 1, 0.8509804, 0, 1,
-1.091673, 2.697, -2.365257, 1, 0.8588235, 0, 1,
-1.091643, -1.082785, -3.127138, 1, 0.8627451, 0, 1,
-1.088313, -2.445648, -2.191646, 1, 0.8705882, 0, 1,
-1.084231, 0.4323606, -1.964521, 1, 0.8745098, 0, 1,
-1.081158, -0.5375119, -1.372349, 1, 0.8823529, 0, 1,
-1.076648, 0.7750635, 0.7646332, 1, 0.8862745, 0, 1,
-1.072828, -0.6761794, -2.68985, 1, 0.8941177, 0, 1,
-1.067568, -1.992851, -2.524256, 1, 0.8980392, 0, 1,
-1.050774, -1.061745, -2.365351, 1, 0.9058824, 0, 1,
-1.046613, 0.4157524, -1.014668, 1, 0.9137255, 0, 1,
-1.034845, -0.6551559, -1.477753, 1, 0.9176471, 0, 1,
-1.025819, -0.1011994, -2.626254, 1, 0.9254902, 0, 1,
-1.024322, 0.7072199, -1.340216, 1, 0.9294118, 0, 1,
-1.02309, 0.2579628, -1.462932, 1, 0.9372549, 0, 1,
-1.01838, -1.417194, -2.627268, 1, 0.9411765, 0, 1,
-1.015618, 0.5255864, -0.1134553, 1, 0.9490196, 0, 1,
-1.014611, -2.130034, -2.840078, 1, 0.9529412, 0, 1,
-1.006299, -0.03874062, -2.253188, 1, 0.9607843, 0, 1,
-1.00267, 0.09924882, -1.073546, 1, 0.9647059, 0, 1,
-1.002439, -0.6433058, -0.3119366, 1, 0.972549, 0, 1,
-0.9986225, -0.0544182, 0.102689, 1, 0.9764706, 0, 1,
-0.9942541, 1.663583, 0.3714052, 1, 0.9843137, 0, 1,
-0.9932776, -1.13489, -3.005188, 1, 0.9882353, 0, 1,
-0.9843444, 0.6170045, 1.523927, 1, 0.9960784, 0, 1,
-0.9784476, -1.19366, -2.683121, 0.9960784, 1, 0, 1,
-0.9782826, 2.061719, 0.5389267, 0.9921569, 1, 0, 1,
-0.9734577, 0.938667, -0.008162238, 0.9843137, 1, 0, 1,
-0.9653306, -1.460475, -2.666194, 0.9803922, 1, 0, 1,
-0.9627652, 2.532604, -0.01012096, 0.972549, 1, 0, 1,
-0.9550402, -0.4268613, -3.309246, 0.9686275, 1, 0, 1,
-0.9499593, 0.4884809, 1.66148, 0.9607843, 1, 0, 1,
-0.9251665, -1.20359, -2.810666, 0.9568627, 1, 0, 1,
-0.917249, -0.8191166, -2.324561, 0.9490196, 1, 0, 1,
-0.9159611, -1.827762, -3.690425, 0.945098, 1, 0, 1,
-0.8979747, 1.945534, -2.363975, 0.9372549, 1, 0, 1,
-0.8842055, 0.4225836, -1.893877, 0.9333333, 1, 0, 1,
-0.8823956, 1.56151, -1.39284, 0.9254902, 1, 0, 1,
-0.8821297, -0.6575939, -1.526993, 0.9215686, 1, 0, 1,
-0.8799143, 1.447802, -0.053626, 0.9137255, 1, 0, 1,
-0.8787923, -0.07783273, -0.905296, 0.9098039, 1, 0, 1,
-0.8760005, -1.747086, -2.925472, 0.9019608, 1, 0, 1,
-0.8732998, 1.092969, -0.886957, 0.8941177, 1, 0, 1,
-0.8685565, 1.272683, 0.05096789, 0.8901961, 1, 0, 1,
-0.8670011, 0.7852074, -1.501101, 0.8823529, 1, 0, 1,
-0.8542714, 0.7395918, -2.688408, 0.8784314, 1, 0, 1,
-0.8480424, -0.2811156, -0.3714212, 0.8705882, 1, 0, 1,
-0.8461598, 1.104461, -0.815205, 0.8666667, 1, 0, 1,
-0.8359584, -0.03769545, -1.799487, 0.8588235, 1, 0, 1,
-0.8341708, 0.4501216, -0.8211059, 0.854902, 1, 0, 1,
-0.8327118, 0.7516364, 0.4911643, 0.8470588, 1, 0, 1,
-0.8253139, 1.28409, -0.8306065, 0.8431373, 1, 0, 1,
-0.8231398, 0.4792626, -2.598182, 0.8352941, 1, 0, 1,
-0.8204349, -0.5238485, -3.440952, 0.8313726, 1, 0, 1,
-0.8201375, -0.7389069, -2.265185, 0.8235294, 1, 0, 1,
-0.8187436, -0.6039282, -3.189154, 0.8196079, 1, 0, 1,
-0.812013, -0.8207478, -3.193731, 0.8117647, 1, 0, 1,
-0.8088526, -0.05978461, -1.985026, 0.8078431, 1, 0, 1,
-0.8063386, -1.923909, -2.079765, 0.8, 1, 0, 1,
-0.8022211, -0.267263, -2.067728, 0.7921569, 1, 0, 1,
-0.7974045, 1.202688, -2.561535, 0.7882353, 1, 0, 1,
-0.7965377, 0.1084342, -1.600868, 0.7803922, 1, 0, 1,
-0.7949692, 0.3452997, -0.9345788, 0.7764706, 1, 0, 1,
-0.7916455, -0.2505119, -3.013848, 0.7686275, 1, 0, 1,
-0.791144, -1.657733, -3.800866, 0.7647059, 1, 0, 1,
-0.7691764, -1.128161, -3.336812, 0.7568628, 1, 0, 1,
-0.7645003, 1.972284, 0.5211866, 0.7529412, 1, 0, 1,
-0.763864, -0.3720275, -2.073448, 0.7450981, 1, 0, 1,
-0.7637895, -0.1954236, -1.140237, 0.7411765, 1, 0, 1,
-0.7555562, -0.6099113, -3.236636, 0.7333333, 1, 0, 1,
-0.7553104, 1.492003, -1.955353, 0.7294118, 1, 0, 1,
-0.754779, -2.019108, -2.916939, 0.7215686, 1, 0, 1,
-0.7515876, 1.086953, -0.549682, 0.7176471, 1, 0, 1,
-0.747189, -0.6484783, -2.218479, 0.7098039, 1, 0, 1,
-0.7340212, 0.06629153, -0.6470277, 0.7058824, 1, 0, 1,
-0.7312545, 1.676766, 0.2995653, 0.6980392, 1, 0, 1,
-0.7274566, -0.4072007, -3.62119, 0.6901961, 1, 0, 1,
-0.7266038, -1.537899, -3.042921, 0.6862745, 1, 0, 1,
-0.7222574, -0.8275262, -2.367372, 0.6784314, 1, 0, 1,
-0.7207423, 1.158466, -0.2815943, 0.6745098, 1, 0, 1,
-0.7177238, 0.6107012, 0.3214486, 0.6666667, 1, 0, 1,
-0.7175792, -0.9266514, -2.012042, 0.6627451, 1, 0, 1,
-0.7174144, -1.720235, -3.414299, 0.654902, 1, 0, 1,
-0.7169843, 0.1611493, -1.51871, 0.6509804, 1, 0, 1,
-0.7062375, 1.833187, -0.189778, 0.6431373, 1, 0, 1,
-0.6984313, -0.7373998, -2.423306, 0.6392157, 1, 0, 1,
-0.6960762, -1.40928, -4.087899, 0.6313726, 1, 0, 1,
-0.69524, -0.03165662, -1.314449, 0.627451, 1, 0, 1,
-0.6934728, 0.6352807, -0.4843136, 0.6196079, 1, 0, 1,
-0.6906508, -1.185341, -0.2719728, 0.6156863, 1, 0, 1,
-0.6875083, 1.034791, -1.07235, 0.6078432, 1, 0, 1,
-0.6872733, 0.5417896, -0.04649419, 0.6039216, 1, 0, 1,
-0.6792255, -1.449364, -1.565506, 0.5960785, 1, 0, 1,
-0.6777757, -0.202289, -1.967746, 0.5882353, 1, 0, 1,
-0.6735986, -0.1264808, -1.851147, 0.5843138, 1, 0, 1,
-0.672729, 0.1802953, -0.8592459, 0.5764706, 1, 0, 1,
-0.6721383, 1.707378, -0.3322014, 0.572549, 1, 0, 1,
-0.6710411, 0.5877969, 0.3026574, 0.5647059, 1, 0, 1,
-0.6680506, 0.3017426, 0.8528462, 0.5607843, 1, 0, 1,
-0.6646739, 0.7818991, -0.6241039, 0.5529412, 1, 0, 1,
-0.6640702, 0.6457242, -2.417376, 0.5490196, 1, 0, 1,
-0.6598563, 0.5369765, 0.4367316, 0.5411765, 1, 0, 1,
-0.6589368, -1.250884, -2.9183, 0.5372549, 1, 0, 1,
-0.6585557, 1.044312, -3.332686, 0.5294118, 1, 0, 1,
-0.6528154, -1.098054, -3.935539, 0.5254902, 1, 0, 1,
-0.6502077, 0.7618857, 0.1611706, 0.5176471, 1, 0, 1,
-0.6488839, 0.7528779, 0.2247798, 0.5137255, 1, 0, 1,
-0.6459371, -0.3264095, -1.68486, 0.5058824, 1, 0, 1,
-0.6451426, -0.1262488, -1.198548, 0.5019608, 1, 0, 1,
-0.6430432, -0.3087815, -3.47801, 0.4941176, 1, 0, 1,
-0.6389802, 0.7707582, -2.479264, 0.4862745, 1, 0, 1,
-0.6382416, 0.310596, -1.965929, 0.4823529, 1, 0, 1,
-0.6377524, 1.03069, -0.06475382, 0.4745098, 1, 0, 1,
-0.6318957, 0.4778185, -0.5350537, 0.4705882, 1, 0, 1,
-0.6317539, -0.107791, -1.247354, 0.4627451, 1, 0, 1,
-0.6273741, -2.140483, -3.563025, 0.4588235, 1, 0, 1,
-0.6268226, 1.008896, 0.3379165, 0.4509804, 1, 0, 1,
-0.6178901, -2.601173, -2.998082, 0.4470588, 1, 0, 1,
-0.6175296, 1.125135, -0.4463844, 0.4392157, 1, 0, 1,
-0.610753, -0.04886099, -1.848788, 0.4352941, 1, 0, 1,
-0.6063887, -1.263503, -2.738767, 0.427451, 1, 0, 1,
-0.6041701, 1.0477, -1.296243, 0.4235294, 1, 0, 1,
-0.6027058, -1.906758, -3.539705, 0.4156863, 1, 0, 1,
-0.6015429, -0.8267321, -2.395328, 0.4117647, 1, 0, 1,
-0.5991672, -1.824522, -2.409729, 0.4039216, 1, 0, 1,
-0.5956552, -0.4638272, -3.041821, 0.3960784, 1, 0, 1,
-0.5898411, -0.2466269, -1.0783, 0.3921569, 1, 0, 1,
-0.5846879, 0.1557653, -2.289643, 0.3843137, 1, 0, 1,
-0.5759962, -0.6074178, -1.929786, 0.3803922, 1, 0, 1,
-0.5753005, -0.4005945, -1.578947, 0.372549, 1, 0, 1,
-0.5641618, -1.522795, -3.467775, 0.3686275, 1, 0, 1,
-0.5618614, -1.253287, -2.741788, 0.3607843, 1, 0, 1,
-0.5599994, 1.013249, -0.7218785, 0.3568628, 1, 0, 1,
-0.5570052, -1.16498, -0.4504898, 0.3490196, 1, 0, 1,
-0.5532993, 1.458293, 0.9371561, 0.345098, 1, 0, 1,
-0.5418158, 2.085911, 1.397061, 0.3372549, 1, 0, 1,
-0.5410215, -1.310813, -2.667731, 0.3333333, 1, 0, 1,
-0.5395369, -0.3781504, -1.296541, 0.3254902, 1, 0, 1,
-0.5370655, 0.871031, 0.4206353, 0.3215686, 1, 0, 1,
-0.534918, 1.779306, -1.252707, 0.3137255, 1, 0, 1,
-0.53352, -0.05152065, -1.342347, 0.3098039, 1, 0, 1,
-0.5326624, -1.5747, -2.684635, 0.3019608, 1, 0, 1,
-0.5307538, 0.07560895, -1.827654, 0.2941177, 1, 0, 1,
-0.5299382, -1.498637, -2.755734, 0.2901961, 1, 0, 1,
-0.5298458, 1.225042, 0.6819862, 0.282353, 1, 0, 1,
-0.528743, 0.7628826, -0.2660508, 0.2784314, 1, 0, 1,
-0.5281301, 0.9364487, -1.124669, 0.2705882, 1, 0, 1,
-0.527051, -1.524119, -0.7904303, 0.2666667, 1, 0, 1,
-0.5218551, 2.578613, 0.2728671, 0.2588235, 1, 0, 1,
-0.5191009, -1.025984, -2.24813, 0.254902, 1, 0, 1,
-0.5172975, -1.183943, -3.981426, 0.2470588, 1, 0, 1,
-0.5148432, -0.3163454, -0.8946649, 0.2431373, 1, 0, 1,
-0.5104496, -0.3531072, -1.407941, 0.2352941, 1, 0, 1,
-0.508783, -0.1192342, -1.818737, 0.2313726, 1, 0, 1,
-0.5081062, 0.2996617, -0.0395243, 0.2235294, 1, 0, 1,
-0.5027596, 0.7617261, -0.6319068, 0.2196078, 1, 0, 1,
-0.4983897, -0.6549397, -2.570338, 0.2117647, 1, 0, 1,
-0.4914863, 0.8345847, -0.6695786, 0.2078431, 1, 0, 1,
-0.4836291, 0.5642628, -1.900419, 0.2, 1, 0, 1,
-0.4817036, -0.2167459, -1.695514, 0.1921569, 1, 0, 1,
-0.479639, 0.0802721, -0.6296831, 0.1882353, 1, 0, 1,
-0.4781261, 0.6655699, -1.29108, 0.1803922, 1, 0, 1,
-0.4776931, -0.00486143, -0.1903228, 0.1764706, 1, 0, 1,
-0.4701429, 0.8420259, -0.6733298, 0.1686275, 1, 0, 1,
-0.4642905, -0.6542511, -1.694271, 0.1647059, 1, 0, 1,
-0.4587218, 0.240746, -1.989906, 0.1568628, 1, 0, 1,
-0.4551478, 0.2647879, -0.02005902, 0.1529412, 1, 0, 1,
-0.4534049, 0.3528934, -2.734899, 0.145098, 1, 0, 1,
-0.4528191, 0.1192417, -1.52071, 0.1411765, 1, 0, 1,
-0.4512675, -1.369783, -2.088768, 0.1333333, 1, 0, 1,
-0.4469461, -0.1723164, -2.760483, 0.1294118, 1, 0, 1,
-0.4464672, 0.6558747, -1.197251, 0.1215686, 1, 0, 1,
-0.4453795, 1.741553, -0.6427317, 0.1176471, 1, 0, 1,
-0.4409767, -0.9140309, -4.456008, 0.1098039, 1, 0, 1,
-0.4401433, 1.130061, 0.8571302, 0.1058824, 1, 0, 1,
-0.4381284, 0.2225422, -0.9919326, 0.09803922, 1, 0, 1,
-0.43742, 0.4278568, -0.7342829, 0.09019608, 1, 0, 1,
-0.4328016, 0.5514184, -1.280878, 0.08627451, 1, 0, 1,
-0.4277713, 0.3658731, -0.237845, 0.07843138, 1, 0, 1,
-0.4239045, -1.849748, -3.673482, 0.07450981, 1, 0, 1,
-0.4229822, 0.05997217, -0.8022719, 0.06666667, 1, 0, 1,
-0.4225717, 0.2638281, -0.7957761, 0.0627451, 1, 0, 1,
-0.4222495, 0.1601722, -1.259709, 0.05490196, 1, 0, 1,
-0.4213636, 0.633206, -0.3367039, 0.05098039, 1, 0, 1,
-0.4189587, 0.9970686, 0.2759143, 0.04313726, 1, 0, 1,
-0.417235, 0.9904336, -1.019067, 0.03921569, 1, 0, 1,
-0.4103838, -0.3760966, -1.510128, 0.03137255, 1, 0, 1,
-0.4084439, 2.735105, 0.4141206, 0.02745098, 1, 0, 1,
-0.4027252, -0.1160332, -0.8326932, 0.01960784, 1, 0, 1,
-0.4026405, 0.9026013, -2.489005, 0.01568628, 1, 0, 1,
-0.4011031, -1.294399, -3.120943, 0.007843138, 1, 0, 1,
-0.3990035, 0.1021398, -0.135897, 0.003921569, 1, 0, 1,
-0.3987477, -1.786339, -2.378117, 0, 1, 0.003921569, 1,
-0.3971238, -0.5917247, -3.060474, 0, 1, 0.01176471, 1,
-0.395768, -1.123333, -2.440665, 0, 1, 0.01568628, 1,
-0.3930892, -0.1542648, -1.824968, 0, 1, 0.02352941, 1,
-0.386972, -0.09421054, -2.867381, 0, 1, 0.02745098, 1,
-0.3858014, 0.3436989, -1.334344, 0, 1, 0.03529412, 1,
-0.3839853, 0.3276452, -1.16095, 0, 1, 0.03921569, 1,
-0.3834843, -0.7834968, -1.504198, 0, 1, 0.04705882, 1,
-0.3780817, -0.9574378, -3.848638, 0, 1, 0.05098039, 1,
-0.3735073, 0.8750975, -1.361755, 0, 1, 0.05882353, 1,
-0.3700897, 2.105538, -1.990662, 0, 1, 0.0627451, 1,
-0.3683783, -0.6167038, -3.82025, 0, 1, 0.07058824, 1,
-0.3671239, 0.1580042, 0.6203909, 0, 1, 0.07450981, 1,
-0.3671136, 0.1841347, -0.5881935, 0, 1, 0.08235294, 1,
-0.3649548, 0.7529767, -0.6660838, 0, 1, 0.08627451, 1,
-0.3636267, 0.1464292, -0.4618225, 0, 1, 0.09411765, 1,
-0.361637, 0.6536056, -1.0894, 0, 1, 0.1019608, 1,
-0.359377, 0.3121426, -0.7886529, 0, 1, 0.1058824, 1,
-0.3592782, 1.022668, 1.185143, 0, 1, 0.1137255, 1,
-0.3592468, -0.4231395, -3.05694, 0, 1, 0.1176471, 1,
-0.3553318, 0.8627725, 0.2747917, 0, 1, 0.1254902, 1,
-0.3541881, 1.189931, 0.6425943, 0, 1, 0.1294118, 1,
-0.3534597, 1.170186, -1.145619, 0, 1, 0.1372549, 1,
-0.3529809, 0.5861409, 0.6795253, 0, 1, 0.1411765, 1,
-0.3484715, -0.4580569, -3.239975, 0, 1, 0.1490196, 1,
-0.3483737, 0.4384456, -0.4235241, 0, 1, 0.1529412, 1,
-0.3468257, -0.1042904, 0.0359583, 0, 1, 0.1607843, 1,
-0.3466952, 1.922606, -0.3631826, 0, 1, 0.1647059, 1,
-0.3455615, 0.7529899, -0.8641333, 0, 1, 0.172549, 1,
-0.3437571, 0.9041336, 0.5863644, 0, 1, 0.1764706, 1,
-0.343377, 0.8225929, 0.0939662, 0, 1, 0.1843137, 1,
-0.3381987, 0.9056954, -0.3250287, 0, 1, 0.1882353, 1,
-0.3344258, -0.3648342, -2.990862, 0, 1, 0.1960784, 1,
-0.3316041, 0.6212422, -1.913515, 0, 1, 0.2039216, 1,
-0.3306638, -0.7868531, -0.9416637, 0, 1, 0.2078431, 1,
-0.3284124, 0.03912599, -2.320507, 0, 1, 0.2156863, 1,
-0.3269722, 0.4252631, -1.997061, 0, 1, 0.2196078, 1,
-0.3259923, -0.4125676, -2.884383, 0, 1, 0.227451, 1,
-0.3248462, 0.07046159, -0.655579, 0, 1, 0.2313726, 1,
-0.3246998, 0.5051448, -0.4206142, 0, 1, 0.2392157, 1,
-0.3243319, 0.8842837, -0.9681914, 0, 1, 0.2431373, 1,
-0.3217286, -1.53403, -3.835687, 0, 1, 0.2509804, 1,
-0.3167575, -0.763364, -2.841221, 0, 1, 0.254902, 1,
-0.3147606, 0.09139707, -1.151357, 0, 1, 0.2627451, 1,
-0.3129286, 1.24939, -0.2874199, 0, 1, 0.2666667, 1,
-0.3115489, -0.1172302, -2.276706, 0, 1, 0.2745098, 1,
-0.3109834, 1.684645, -0.3728678, 0, 1, 0.2784314, 1,
-0.3109366, -0.5451197, -1.791603, 0, 1, 0.2862745, 1,
-0.31018, -0.2431503, -1.591211, 0, 1, 0.2901961, 1,
-0.3091741, 0.3767159, -0.6097881, 0, 1, 0.2980392, 1,
-0.2928292, -0.1184111, -1.936117, 0, 1, 0.3058824, 1,
-0.2899598, 0.5541935, -0.3117116, 0, 1, 0.3098039, 1,
-0.2868095, -0.165143, -0.6744273, 0, 1, 0.3176471, 1,
-0.2816851, -0.1980533, -2.766261, 0, 1, 0.3215686, 1,
-0.2811692, 2.541809, -1.095416, 0, 1, 0.3294118, 1,
-0.2779138, 1.444086, -1.016001, 0, 1, 0.3333333, 1,
-0.2751701, 0.5006585, -0.3419616, 0, 1, 0.3411765, 1,
-0.2751204, -0.365947, -1.759301, 0, 1, 0.345098, 1,
-0.2679211, 0.2429721, -1.397563, 0, 1, 0.3529412, 1,
-0.2674266, -0.7544608, -3.052447, 0, 1, 0.3568628, 1,
-0.2661168, 0.5234441, -1.165802, 0, 1, 0.3647059, 1,
-0.2635969, 0.9687164, 0.5556422, 0, 1, 0.3686275, 1,
-0.2626542, -0.222353, -2.732308, 0, 1, 0.3764706, 1,
-0.2617091, -1.394872, -2.295758, 0, 1, 0.3803922, 1,
-0.2608683, 1.072286, 0.4790632, 0, 1, 0.3882353, 1,
-0.2582015, -1.240258, -2.791214, 0, 1, 0.3921569, 1,
-0.255254, -0.0149546, 0.1473554, 0, 1, 0.4, 1,
-0.2527378, 1.900237, -2.024387, 0, 1, 0.4078431, 1,
-0.248007, 0.4915352, 0.5209504, 0, 1, 0.4117647, 1,
-0.2473508, 0.4840253, -1.706738, 0, 1, 0.4196078, 1,
-0.2470607, -0.4590996, -2.069504, 0, 1, 0.4235294, 1,
-0.245616, -0.693646, -1.949758, 0, 1, 0.4313726, 1,
-0.2403188, -0.7366971, -3.820629, 0, 1, 0.4352941, 1,
-0.238195, 1.875625, -0.6197473, 0, 1, 0.4431373, 1,
-0.2375366, -2.209636, -3.762127, 0, 1, 0.4470588, 1,
-0.2335249, -2.065006, -3.183891, 0, 1, 0.454902, 1,
-0.2307335, -0.9223906, -2.646726, 0, 1, 0.4588235, 1,
-0.2273901, 0.7349812, -0.09093002, 0, 1, 0.4666667, 1,
-0.2237905, -0.4427068, -3.338089, 0, 1, 0.4705882, 1,
-0.2229084, 1.461213, 0.5601652, 0, 1, 0.4784314, 1,
-0.2205634, 1.456593, -0.4401835, 0, 1, 0.4823529, 1,
-0.2201726, -0.2020058, -1.23237, 0, 1, 0.4901961, 1,
-0.218757, 0.5673737, -0.9411198, 0, 1, 0.4941176, 1,
-0.2186463, -0.6365575, -2.187515, 0, 1, 0.5019608, 1,
-0.2173669, 0.608977, -1.63292, 0, 1, 0.509804, 1,
-0.213012, -2.193911, -3.166645, 0, 1, 0.5137255, 1,
-0.2112443, -0.6316081, -1.699894, 0, 1, 0.5215687, 1,
-0.2094213, -0.1959127, -3.807662, 0, 1, 0.5254902, 1,
-0.208662, 0.3481639, -0.4172535, 0, 1, 0.5333334, 1,
-0.201807, -0.5935531, -4.0851, 0, 1, 0.5372549, 1,
-0.1994063, -1.391926, -3.603491, 0, 1, 0.5450981, 1,
-0.1972181, -0.9051728, -2.250022, 0, 1, 0.5490196, 1,
-0.1957355, 0.966001, 0.5710589, 0, 1, 0.5568628, 1,
-0.1954365, 0.9646938, -0.404399, 0, 1, 0.5607843, 1,
-0.1948784, 0.1154989, -0.4237274, 0, 1, 0.5686275, 1,
-0.1940912, 0.8237552, -0.9086683, 0, 1, 0.572549, 1,
-0.1901398, 1.096768, 0.1030371, 0, 1, 0.5803922, 1,
-0.1794876, 1.141072, 0.2522729, 0, 1, 0.5843138, 1,
-0.1787727, -1.709294, -4.048979, 0, 1, 0.5921569, 1,
-0.1772276, 1.422419, 1.615788, 0, 1, 0.5960785, 1,
-0.1687695, 0.9953475, 1.461252, 0, 1, 0.6039216, 1,
-0.1636351, -0.1758626, -1.349564, 0, 1, 0.6117647, 1,
-0.1622611, 0.617016, -0.9701066, 0, 1, 0.6156863, 1,
-0.1608803, -0.7320583, -2.303448, 0, 1, 0.6235294, 1,
-0.1585726, 1.632947, -0.7541685, 0, 1, 0.627451, 1,
-0.1519035, -0.01150856, -3.687089, 0, 1, 0.6352941, 1,
-0.1511375, 0.9341281, -0.952709, 0, 1, 0.6392157, 1,
-0.1494436, 0.5435275, 0.1968798, 0, 1, 0.6470588, 1,
-0.1493248, -0.03642853, -3.370661, 0, 1, 0.6509804, 1,
-0.1488806, 0.124341, -1.832044, 0, 1, 0.6588235, 1,
-0.1485666, 0.8534713, -0.8754884, 0, 1, 0.6627451, 1,
-0.1480137, 0.2914278, 0.2039341, 0, 1, 0.6705883, 1,
-0.1474254, -0.1372828, -2.810707, 0, 1, 0.6745098, 1,
-0.1452022, -0.4048139, -4.839189, 0, 1, 0.682353, 1,
-0.1414573, 1.697375, 0.7873455, 0, 1, 0.6862745, 1,
-0.1412712, 1.207575, 0.8424467, 0, 1, 0.6941177, 1,
-0.1403606, 0.5680498, -1.093019, 0, 1, 0.7019608, 1,
-0.139393, 0.1563544, -2.188768, 0, 1, 0.7058824, 1,
-0.1390598, -0.3630272, -3.188468, 0, 1, 0.7137255, 1,
-0.1364506, 0.09452023, -1.093065, 0, 1, 0.7176471, 1,
-0.1308148, -0.2480845, -3.716293, 0, 1, 0.7254902, 1,
-0.1281096, -0.1064768, -2.233807, 0, 1, 0.7294118, 1,
-0.1246531, -0.1941562, -2.997032, 0, 1, 0.7372549, 1,
-0.1243032, -0.9213012, -3.560935, 0, 1, 0.7411765, 1,
-0.1229886, -0.6367596, -3.519026, 0, 1, 0.7490196, 1,
-0.1227786, -0.2000926, -1.970524, 0, 1, 0.7529412, 1,
-0.1200533, 0.2101735, 0.6247082, 0, 1, 0.7607843, 1,
-0.1198994, -0.7062632, -3.159027, 0, 1, 0.7647059, 1,
-0.1184495, 0.143133, -2.186646, 0, 1, 0.772549, 1,
-0.1179445, 0.4357928, -0.5196484, 0, 1, 0.7764706, 1,
-0.1147078, -1.290576, -4.356195, 0, 1, 0.7843137, 1,
-0.1142029, 0.6934032, -1.132344, 0, 1, 0.7882353, 1,
-0.108353, -0.1028305, -2.541635, 0, 1, 0.7960784, 1,
-0.1062999, -2.088883, -1.876782, 0, 1, 0.8039216, 1,
-0.1031283, 1.330208, -0.07525345, 0, 1, 0.8078431, 1,
-0.1023761, -0.4747351, -4.496247, 0, 1, 0.8156863, 1,
-0.1003623, 0.6922268, -0.3134717, 0, 1, 0.8196079, 1,
-0.09745976, -0.5048979, -3.38395, 0, 1, 0.827451, 1,
-0.09628693, 1.586016, -0.2012499, 0, 1, 0.8313726, 1,
-0.09509008, -2.095038, -3.341673, 0, 1, 0.8392157, 1,
-0.09377396, -0.932501, -3.607707, 0, 1, 0.8431373, 1,
-0.09208649, 0.4222555, 0.3915503, 0, 1, 0.8509804, 1,
-0.0869882, -0.6332747, -2.783393, 0, 1, 0.854902, 1,
-0.08538463, -0.620371, -3.014798, 0, 1, 0.8627451, 1,
-0.08252496, 0.6597695, 0.9073874, 0, 1, 0.8666667, 1,
-0.08114111, -1.337502, -1.89197, 0, 1, 0.8745098, 1,
-0.07659665, 0.8354392, 1.586984, 0, 1, 0.8784314, 1,
-0.0745346, 1.159653, 0.8674928, 0, 1, 0.8862745, 1,
-0.07405696, -0.3269222, -4.01404, 0, 1, 0.8901961, 1,
-0.07276266, -0.2106067, -3.119245, 0, 1, 0.8980392, 1,
-0.07203725, 2.230947, 0.8928201, 0, 1, 0.9058824, 1,
-0.07023589, -0.7411389, -2.993711, 0, 1, 0.9098039, 1,
-0.06719628, 0.7203156, 0.8675877, 0, 1, 0.9176471, 1,
-0.06417567, -0.2138368, -2.705013, 0, 1, 0.9215686, 1,
-0.06236674, 1.683796, 1.304626, 0, 1, 0.9294118, 1,
-0.0598343, 1.787438, -0.3757657, 0, 1, 0.9333333, 1,
-0.05979775, -0.7753862, -3.614883, 0, 1, 0.9411765, 1,
-0.05261346, -0.7937088, -3.42167, 0, 1, 0.945098, 1,
-0.0505795, -0.1322589, -2.904624, 0, 1, 0.9529412, 1,
-0.04891146, -0.8164988, -1.044348, 0, 1, 0.9568627, 1,
-0.04609402, 0.3565958, -1.038409, 0, 1, 0.9647059, 1,
-0.0440259, -2.00632, -2.413624, 0, 1, 0.9686275, 1,
-0.04374641, 0.9376264, 0.5391083, 0, 1, 0.9764706, 1,
-0.0408833, 0.420996, -0.8849696, 0, 1, 0.9803922, 1,
-0.03722222, 0.4254126, -0.9462005, 0, 1, 0.9882353, 1,
-0.03666306, 0.4921332, -0.3774219, 0, 1, 0.9921569, 1,
-0.0340278, 0.08808075, -1.162813, 0, 1, 1, 1,
-0.02877978, -0.81849, -1.80608, 0, 0.9921569, 1, 1,
-0.02806129, 0.3138206, 0.00405675, 0, 0.9882353, 1, 1,
-0.02714435, 0.5592542, -0.7699111, 0, 0.9803922, 1, 1,
-0.02599682, 1.47513, 0.008626904, 0, 0.9764706, 1, 1,
-0.02287768, -0.4763074, -3.206491, 0, 0.9686275, 1, 1,
-0.02180126, -0.1372992, -4.094168, 0, 0.9647059, 1, 1,
-0.01602932, -0.9225802, -4.383575, 0, 0.9568627, 1, 1,
-0.01124863, -0.328611, -3.241304, 0, 0.9529412, 1, 1,
-0.01028189, 0.2631742, -1.103735, 0, 0.945098, 1, 1,
-0.008207472, -0.3458288, -2.140718, 0, 0.9411765, 1, 1,
-0.006995019, 0.7512865, 0.9927096, 0, 0.9333333, 1, 1,
-0.004845511, -0.8989445, -3.715255, 0, 0.9294118, 1, 1,
-0.003518172, -1.446896, -2.509894, 0, 0.9215686, 1, 1,
-0.000430954, 1.061216, 0.9176229, 0, 0.9176471, 1, 1,
0.00337609, -0.1118749, 3.803898, 0, 0.9098039, 1, 1,
0.005999551, -0.003103964, 2.789881, 0, 0.9058824, 1, 1,
0.01011418, 0.3506511, -0.3599792, 0, 0.8980392, 1, 1,
0.01013589, 1.019947, 0.3931287, 0, 0.8901961, 1, 1,
0.01318096, 2.248512, 0.02823087, 0, 0.8862745, 1, 1,
0.01483995, 1.098121, -0.15556, 0, 0.8784314, 1, 1,
0.01532786, -0.3895118, 3.626023, 0, 0.8745098, 1, 1,
0.01661554, -1.00803, 3.017167, 0, 0.8666667, 1, 1,
0.01730415, -0.4925918, 3.521309, 0, 0.8627451, 1, 1,
0.01750577, 0.4344025, 1.168978, 0, 0.854902, 1, 1,
0.02239627, -1.729128, 3.60254, 0, 0.8509804, 1, 1,
0.02414984, 1.311198, -0.7260531, 0, 0.8431373, 1, 1,
0.02451188, -0.3329225, 2.269586, 0, 0.8392157, 1, 1,
0.02648613, -0.487401, 2.524552, 0, 0.8313726, 1, 1,
0.02680883, 0.5887876, -0.5582162, 0, 0.827451, 1, 1,
0.0290544, 1.656963, -0.8861661, 0, 0.8196079, 1, 1,
0.0304629, -1.595258, 3.792949, 0, 0.8156863, 1, 1,
0.0305427, 0.06418391, 1.291091, 0, 0.8078431, 1, 1,
0.03158776, -0.6657728, 3.475554, 0, 0.8039216, 1, 1,
0.03385662, 0.7714931, 1.127131, 0, 0.7960784, 1, 1,
0.03409991, -0.742035, 4.187631, 0, 0.7882353, 1, 1,
0.03760717, -0.2286102, 1.78112, 0, 0.7843137, 1, 1,
0.03806969, -1.955595, 3.39567, 0, 0.7764706, 1, 1,
0.03808019, 0.5593863, -0.8102167, 0, 0.772549, 1, 1,
0.04289353, 0.8187864, -2.233248, 0, 0.7647059, 1, 1,
0.04291479, 0.02342379, 1.65571, 0, 0.7607843, 1, 1,
0.04731811, -2.475548, 3.12007, 0, 0.7529412, 1, 1,
0.04908174, -0.4725259, 3.440012, 0, 0.7490196, 1, 1,
0.05025251, 1.19701, 1.474247, 0, 0.7411765, 1, 1,
0.0503308, -0.2995858, 2.512143, 0, 0.7372549, 1, 1,
0.05689155, 0.9596367, -1.899175, 0, 0.7294118, 1, 1,
0.05777016, 0.7525158, -0.2004765, 0, 0.7254902, 1, 1,
0.05847365, -0.5472584, 4.243025, 0, 0.7176471, 1, 1,
0.05849981, -1.041553, 4.903531, 0, 0.7137255, 1, 1,
0.05976881, 0.2811653, -0.03932171, 0, 0.7058824, 1, 1,
0.0626544, 0.6794809, 0.6539395, 0, 0.6980392, 1, 1,
0.06383738, -1.499588, 2.864699, 0, 0.6941177, 1, 1,
0.06492706, 0.008181754, 1.108286, 0, 0.6862745, 1, 1,
0.06612814, -0.4061685, 2.644023, 0, 0.682353, 1, 1,
0.06767506, 1.253428, 0.3981858, 0, 0.6745098, 1, 1,
0.07000659, 0.4805245, 1.316905, 0, 0.6705883, 1, 1,
0.07309511, 0.7671588, -1.057334, 0, 0.6627451, 1, 1,
0.07594577, 2.17242, -1.331001, 0, 0.6588235, 1, 1,
0.07982481, 1.037936, -1.092141, 0, 0.6509804, 1, 1,
0.08120285, -1.220498, 4.434588, 0, 0.6470588, 1, 1,
0.08216885, 1.12544, 0.60892, 0, 0.6392157, 1, 1,
0.08439138, 0.51753, -0.1906946, 0, 0.6352941, 1, 1,
0.08652738, -1.2688, 5.697932, 0, 0.627451, 1, 1,
0.08746139, 0.9143164, 0.3933901, 0, 0.6235294, 1, 1,
0.09013457, -1.650443, 2.635532, 0, 0.6156863, 1, 1,
0.09038285, -0.1235178, 1.745754, 0, 0.6117647, 1, 1,
0.09221502, -1.432437, 2.136871, 0, 0.6039216, 1, 1,
0.09282242, -0.8387139, 0.6779842, 0, 0.5960785, 1, 1,
0.09437177, 0.152079, 2.083353, 0, 0.5921569, 1, 1,
0.09882449, 0.3972529, 0.6189421, 0, 0.5843138, 1, 1,
0.1054087, -0.2914568, 2.027872, 0, 0.5803922, 1, 1,
0.1066555, -0.01896912, 0.344324, 0, 0.572549, 1, 1,
0.1122934, -1.120149, 2.616687, 0, 0.5686275, 1, 1,
0.127868, 1.723419, 0.1892067, 0, 0.5607843, 1, 1,
0.1279716, -0.1335552, 1.778267, 0, 0.5568628, 1, 1,
0.1303671, 0.81346, -0.8921093, 0, 0.5490196, 1, 1,
0.1309092, -1.033237, 3.981716, 0, 0.5450981, 1, 1,
0.1339786, 0.343183, -0.6013536, 0, 0.5372549, 1, 1,
0.1373524, -0.6192372, 2.598449, 0, 0.5333334, 1, 1,
0.1421772, 0.2157206, -0.8446423, 0, 0.5254902, 1, 1,
0.1515582, -0.1577372, 0.9065332, 0, 0.5215687, 1, 1,
0.1537582, -0.8362986, 3.871019, 0, 0.5137255, 1, 1,
0.1559833, -0.5015471, 4.07071, 0, 0.509804, 1, 1,
0.1562749, 0.3353889, -0.3988636, 0, 0.5019608, 1, 1,
0.1596805, 0.3472842, 0.687332, 0, 0.4941176, 1, 1,
0.1608297, -0.9819412, 2.758694, 0, 0.4901961, 1, 1,
0.165374, 0.4291205, 1.059352, 0, 0.4823529, 1, 1,
0.1685626, -0.830753, 2.919293, 0, 0.4784314, 1, 1,
0.1731873, -1.537292, 2.00491, 0, 0.4705882, 1, 1,
0.174693, 0.5941298, 0.2203842, 0, 0.4666667, 1, 1,
0.1778106, 0.2515963, 2.409259, 0, 0.4588235, 1, 1,
0.1778798, -0.1209891, 3.795992, 0, 0.454902, 1, 1,
0.1782157, 0.9054992, 2.881162, 0, 0.4470588, 1, 1,
0.1794808, 0.3981388, 1.25724, 0, 0.4431373, 1, 1,
0.1804162, 0.6430946, 1.691058, 0, 0.4352941, 1, 1,
0.1839013, 0.06054805, 0.6795272, 0, 0.4313726, 1, 1,
0.1842272, -1.150446, 1.78546, 0, 0.4235294, 1, 1,
0.1851602, -1.013982, 3.671681, 0, 0.4196078, 1, 1,
0.1904322, 1.61005, 0.6289205, 0, 0.4117647, 1, 1,
0.1952373, -0.008558098, -1.216941, 0, 0.4078431, 1, 1,
0.2000001, -0.08108003, 3.081173, 0, 0.4, 1, 1,
0.2001814, -0.6124032, 1.764453, 0, 0.3921569, 1, 1,
0.2040057, -0.7480258, 3.547944, 0, 0.3882353, 1, 1,
0.204077, 0.7704139, 1.209835, 0, 0.3803922, 1, 1,
0.2045918, 0.4468264, 0.09542934, 0, 0.3764706, 1, 1,
0.2090791, 0.829599, 1.918017, 0, 0.3686275, 1, 1,
0.211558, -0.1136872, -0.00411618, 0, 0.3647059, 1, 1,
0.2118869, -0.1554735, 3.76216, 0, 0.3568628, 1, 1,
0.2154421, 1.144332, -0.7593759, 0, 0.3529412, 1, 1,
0.2177833, -0.3977401, 3.184858, 0, 0.345098, 1, 1,
0.2266876, 0.3298496, 0.3937645, 0, 0.3411765, 1, 1,
0.2309159, 1.690935, 0.8429782, 0, 0.3333333, 1, 1,
0.231603, 0.08597273, -1.30713, 0, 0.3294118, 1, 1,
0.231612, -0.7359509, 4.055852, 0, 0.3215686, 1, 1,
0.2328347, 1.557247, 0.1414558, 0, 0.3176471, 1, 1,
0.2382562, -0.6780221, 3.259773, 0, 0.3098039, 1, 1,
0.2385722, -0.4738012, 0.4868541, 0, 0.3058824, 1, 1,
0.2394152, -0.1379284, 1.357784, 0, 0.2980392, 1, 1,
0.2414093, -1.2571, 1.715333, 0, 0.2901961, 1, 1,
0.2441827, -0.2022011, 4.530736, 0, 0.2862745, 1, 1,
0.2482427, -0.3486736, 1.753547, 0, 0.2784314, 1, 1,
0.2486932, 0.5216395, 0.8351477, 0, 0.2745098, 1, 1,
0.2502188, -0.6783444, 1.851979, 0, 0.2666667, 1, 1,
0.2532825, 0.8143443, -0.4346735, 0, 0.2627451, 1, 1,
0.2596505, -0.6457378, 1.846591, 0, 0.254902, 1, 1,
0.2597772, 0.5415416, -0.002926387, 0, 0.2509804, 1, 1,
0.262278, 0.08695006, 2.440366, 0, 0.2431373, 1, 1,
0.2631441, 1.687779, 1.209656, 0, 0.2392157, 1, 1,
0.267591, 0.3078734, 1.562238, 0, 0.2313726, 1, 1,
0.2682721, 0.3165588, -0.4558269, 0, 0.227451, 1, 1,
0.2693577, 2.29628, -1.16294, 0, 0.2196078, 1, 1,
0.2702022, 0.4990057, 0.1441953, 0, 0.2156863, 1, 1,
0.2712181, -0.4660107, 1.04909, 0, 0.2078431, 1, 1,
0.275233, 0.1308766, 1.115358, 0, 0.2039216, 1, 1,
0.2758287, 1.446216, 0.4579381, 0, 0.1960784, 1, 1,
0.2805934, 1.894388, 0.8180961, 0, 0.1882353, 1, 1,
0.2822228, 1.231063, 1.426518, 0, 0.1843137, 1, 1,
0.2827344, 0.181583, 0.09337744, 0, 0.1764706, 1, 1,
0.2834398, 1.902811, -0.2110196, 0, 0.172549, 1, 1,
0.2876213, 0.9772065, 0.4141558, 0, 0.1647059, 1, 1,
0.2915021, -0.9031008, 0.9020962, 0, 0.1607843, 1, 1,
0.2985186, 1.142379, 1.423861, 0, 0.1529412, 1, 1,
0.3023231, 1.007297, -0.5512094, 0, 0.1490196, 1, 1,
0.3043753, -2.504662, 4.520074, 0, 0.1411765, 1, 1,
0.3054691, -0.4664048, 1.941062, 0, 0.1372549, 1, 1,
0.3110977, -1.373985, 2.550581, 0, 0.1294118, 1, 1,
0.3122374, 1.105596, 2.127613, 0, 0.1254902, 1, 1,
0.3429937, -1.721373, 3.968228, 0, 0.1176471, 1, 1,
0.3437427, 0.1033708, 0.3657213, 0, 0.1137255, 1, 1,
0.3468787, 1.683287, 0.01484864, 0, 0.1058824, 1, 1,
0.3515549, -0.4989342, 3.138566, 0, 0.09803922, 1, 1,
0.3545414, -1.465389, 1.842458, 0, 0.09411765, 1, 1,
0.3571346, -1.013058, 2.599764, 0, 0.08627451, 1, 1,
0.3599195, 0.05053125, 1.323292, 0, 0.08235294, 1, 1,
0.3601485, -0.01262677, 2.366445, 0, 0.07450981, 1, 1,
0.3608304, -1.383936, 3.958942, 0, 0.07058824, 1, 1,
0.3627155, -0.4262775, 2.460226, 0, 0.0627451, 1, 1,
0.3643346, 0.3040691, 3.297713, 0, 0.05882353, 1, 1,
0.3689365, 0.6837596, 0.02280256, 0, 0.05098039, 1, 1,
0.369398, 1.089681, 0.4257134, 0, 0.04705882, 1, 1,
0.3735152, -1.29767, 3.867022, 0, 0.03921569, 1, 1,
0.3755272, -0.8005375, 1.833241, 0, 0.03529412, 1, 1,
0.3771197, -0.4753835, 1.564976, 0, 0.02745098, 1, 1,
0.3791104, -2.926331, 2.379484, 0, 0.02352941, 1, 1,
0.3805787, -0.2767989, 1.797958, 0, 0.01568628, 1, 1,
0.3818917, -0.2937588, 1.93931, 0, 0.01176471, 1, 1,
0.3850572, 0.8416608, 0.1155254, 0, 0.003921569, 1, 1,
0.3856806, -1.404525, 3.037364, 0.003921569, 0, 1, 1,
0.3887911, -0.8651072, 1.29797, 0.007843138, 0, 1, 1,
0.3921718, -2.259585, 3.064062, 0.01568628, 0, 1, 1,
0.3946131, -0.5350327, 2.831718, 0.01960784, 0, 1, 1,
0.3977483, -1.161311, 3.013523, 0.02745098, 0, 1, 1,
0.3990456, -0.1271808, 2.751512, 0.03137255, 0, 1, 1,
0.3991128, 1.58579, 0.08262942, 0.03921569, 0, 1, 1,
0.4024189, 1.196238, -1.828988, 0.04313726, 0, 1, 1,
0.4045222, 0.5760201, -0.581008, 0.05098039, 0, 1, 1,
0.4054319, -1.502571, 1.894742, 0.05490196, 0, 1, 1,
0.4063134, 0.8426132, 0.1453082, 0.0627451, 0, 1, 1,
0.4064357, 0.7732234, 0.9383377, 0.06666667, 0, 1, 1,
0.4078929, 0.4923041, 3.481796, 0.07450981, 0, 1, 1,
0.408884, 0.08922766, 1.545237, 0.07843138, 0, 1, 1,
0.4107274, -1.641561, 2.512513, 0.08627451, 0, 1, 1,
0.4165396, 0.01318732, 2.755047, 0.09019608, 0, 1, 1,
0.4182016, -0.314165, 1.141312, 0.09803922, 0, 1, 1,
0.4199739, 0.812291, -0.5318423, 0.1058824, 0, 1, 1,
0.4238566, -1.216523, 3.903306, 0.1098039, 0, 1, 1,
0.423929, 0.5007298, 1.602667, 0.1176471, 0, 1, 1,
0.4243643, -0.3331554, 3.14477, 0.1215686, 0, 1, 1,
0.4265158, 1.498616, -1.096301, 0.1294118, 0, 1, 1,
0.4269671, -0.2924178, 0.583963, 0.1333333, 0, 1, 1,
0.4274666, 0.6983529, 0.9807357, 0.1411765, 0, 1, 1,
0.4312752, -0.1199549, 1.286906, 0.145098, 0, 1, 1,
0.4313172, -0.5322528, 2.258804, 0.1529412, 0, 1, 1,
0.4326226, -0.1625636, 1.625691, 0.1568628, 0, 1, 1,
0.4361059, 0.02192334, 2.467006, 0.1647059, 0, 1, 1,
0.4361155, -0.9404433, 5.7386, 0.1686275, 0, 1, 1,
0.4361508, -0.05195299, 3.245092, 0.1764706, 0, 1, 1,
0.4374135, 0.2229637, 0.7959979, 0.1803922, 0, 1, 1,
0.4391787, 0.5284203, 1.734465, 0.1882353, 0, 1, 1,
0.4434893, 0.05543113, 2.346791, 0.1921569, 0, 1, 1,
0.4484354, 0.3942227, 0.893773, 0.2, 0, 1, 1,
0.4506788, 0.073915, 2.104203, 0.2078431, 0, 1, 1,
0.4514642, 1.932006, -0.5997246, 0.2117647, 0, 1, 1,
0.4548108, -1.292211, 1.186965, 0.2196078, 0, 1, 1,
0.4584928, 1.015292, 0.1249051, 0.2235294, 0, 1, 1,
0.460105, -0.05326694, 3.584297, 0.2313726, 0, 1, 1,
0.4610195, -0.8194197, 3.603469, 0.2352941, 0, 1, 1,
0.4625109, -0.8784856, 3.93224, 0.2431373, 0, 1, 1,
0.4685235, 1.159868, 0.7689356, 0.2470588, 0, 1, 1,
0.4738168, -0.2658443, 1.142173, 0.254902, 0, 1, 1,
0.4768126, 0.07933641, 2.887801, 0.2588235, 0, 1, 1,
0.4772046, -0.8814677, 2.772583, 0.2666667, 0, 1, 1,
0.4787236, 0.3343915, -1.148625, 0.2705882, 0, 1, 1,
0.4808699, -0.1225144, 2.811844, 0.2784314, 0, 1, 1,
0.4866086, 0.8727263, 0.624948, 0.282353, 0, 1, 1,
0.4866662, -1.207826, 1.321471, 0.2901961, 0, 1, 1,
0.4875363, -1.644819, 2.774723, 0.2941177, 0, 1, 1,
0.4931163, -0.1497378, 3.332701, 0.3019608, 0, 1, 1,
0.5024746, -0.3405392, 2.402834, 0.3098039, 0, 1, 1,
0.5030824, 1.188475, 1.597948, 0.3137255, 0, 1, 1,
0.5125785, 0.1049212, 1.912231, 0.3215686, 0, 1, 1,
0.5178173, 0.216784, 2.021065, 0.3254902, 0, 1, 1,
0.5187265, -1.391416, 2.302481, 0.3333333, 0, 1, 1,
0.5207346, 1.825461, 0.3994372, 0.3372549, 0, 1, 1,
0.5239228, 1.426015, 0.777116, 0.345098, 0, 1, 1,
0.5244269, -0.187492, 2.353202, 0.3490196, 0, 1, 1,
0.5272687, -1.085407, 1.780412, 0.3568628, 0, 1, 1,
0.5322102, 0.5559256, 1.580339, 0.3607843, 0, 1, 1,
0.5323585, -0.4802751, 3.723368, 0.3686275, 0, 1, 1,
0.5349101, 0.9519964, -0.3826173, 0.372549, 0, 1, 1,
0.5349845, -0.2862728, 2.076006, 0.3803922, 0, 1, 1,
0.5353324, -0.5524234, 3.019476, 0.3843137, 0, 1, 1,
0.5385741, -0.6929055, 3.651237, 0.3921569, 0, 1, 1,
0.5440196, 0.3480369, 1.273387, 0.3960784, 0, 1, 1,
0.5488585, 0.9716021, -1.793716, 0.4039216, 0, 1, 1,
0.5507063, 0.3257493, -0.5224277, 0.4117647, 0, 1, 1,
0.55248, -0.3292755, 1.817684, 0.4156863, 0, 1, 1,
0.5541363, -0.6230009, 1.983362, 0.4235294, 0, 1, 1,
0.5615835, -0.5791432, 1.189036, 0.427451, 0, 1, 1,
0.5640835, -1.179033, 2.273204, 0.4352941, 0, 1, 1,
0.5642971, -0.7666925, 1.892008, 0.4392157, 0, 1, 1,
0.5658309, -0.480581, 2.73379, 0.4470588, 0, 1, 1,
0.5681884, -0.320239, 4.033972, 0.4509804, 0, 1, 1,
0.5699741, -0.008106185, 1.147423, 0.4588235, 0, 1, 1,
0.5733904, -0.2405704, 2.337471, 0.4627451, 0, 1, 1,
0.5735225, 1.115167, 0.1313594, 0.4705882, 0, 1, 1,
0.5797517, 0.4843839, 0.7566032, 0.4745098, 0, 1, 1,
0.5808928, 1.545172, -0.1830379, 0.4823529, 0, 1, 1,
0.586947, -2.264489, 2.865057, 0.4862745, 0, 1, 1,
0.5939796, 0.005236901, 0.869875, 0.4941176, 0, 1, 1,
0.5985447, -1.515657, 1.951616, 0.5019608, 0, 1, 1,
0.5986639, -0.1147826, 0.9526728, 0.5058824, 0, 1, 1,
0.5995696, -0.08482769, -0.5383918, 0.5137255, 0, 1, 1,
0.604895, 0.004387251, -0.009749171, 0.5176471, 0, 1, 1,
0.6097074, 0.9325449, 0.4253146, 0.5254902, 0, 1, 1,
0.6098076, 0.7014022, 1.010162, 0.5294118, 0, 1, 1,
0.6161937, 1.289938, -1.621449, 0.5372549, 0, 1, 1,
0.6162512, -1.104762, 2.724764, 0.5411765, 0, 1, 1,
0.6196808, 0.09823563, 1.882331, 0.5490196, 0, 1, 1,
0.6234792, -0.2475961, 3.31689, 0.5529412, 0, 1, 1,
0.6270668, -0.936397, 2.19185, 0.5607843, 0, 1, 1,
0.6279591, -0.6426681, 1.022234, 0.5647059, 0, 1, 1,
0.6323425, -0.8962041, 1.656744, 0.572549, 0, 1, 1,
0.634688, 0.9905939, 1.579287, 0.5764706, 0, 1, 1,
0.6355587, 1.354859, -0.4887253, 0.5843138, 0, 1, 1,
0.6365451, -1.129703, 2.187794, 0.5882353, 0, 1, 1,
0.6372925, -0.1520535, 0.6168922, 0.5960785, 0, 1, 1,
0.6429951, 0.9975525, 1.484859, 0.6039216, 0, 1, 1,
0.6500533, -0.238664, 1.342498, 0.6078432, 0, 1, 1,
0.6540942, -0.1640363, 0.7441656, 0.6156863, 0, 1, 1,
0.6599991, -0.5284223, 2.99158, 0.6196079, 0, 1, 1,
0.6614925, 0.1970557, 0.2238538, 0.627451, 0, 1, 1,
0.6715635, -0.3682336, 3.404247, 0.6313726, 0, 1, 1,
0.6858172, 0.2147814, 0.648765, 0.6392157, 0, 1, 1,
0.6888825, 0.2949084, -0.3797477, 0.6431373, 0, 1, 1,
0.6889808, -1.170457, 1.514992, 0.6509804, 0, 1, 1,
0.6899198, 0.1530266, 1.148928, 0.654902, 0, 1, 1,
0.6910211, -1.327545, 0.5628974, 0.6627451, 0, 1, 1,
0.6952821, -0.923988, 3.066925, 0.6666667, 0, 1, 1,
0.7041131, 0.9888879, 0.8839622, 0.6745098, 0, 1, 1,
0.7137153, -0.9149293, 3.110657, 0.6784314, 0, 1, 1,
0.7206425, 1.175017, -1.239521, 0.6862745, 0, 1, 1,
0.7246996, 0.4227532, 0.9580699, 0.6901961, 0, 1, 1,
0.7249503, -0.8445865, 2.649366, 0.6980392, 0, 1, 1,
0.7305979, 0.1608471, 0.5960692, 0.7058824, 0, 1, 1,
0.7438498, -1.712124, 3.288332, 0.7098039, 0, 1, 1,
0.7531431, -0.2650645, 2.611253, 0.7176471, 0, 1, 1,
0.7551203, 1.292491, -0.1275577, 0.7215686, 0, 1, 1,
0.7585276, -2.1064, 4.380253, 0.7294118, 0, 1, 1,
0.7590386, 0.2299101, 1.309939, 0.7333333, 0, 1, 1,
0.7706407, 1.342064, 0.1377479, 0.7411765, 0, 1, 1,
0.7706547, -1.69699, 2.570386, 0.7450981, 0, 1, 1,
0.7738621, 0.6301085, 0.08922849, 0.7529412, 0, 1, 1,
0.7751153, 0.6220697, 2.09921, 0.7568628, 0, 1, 1,
0.7775558, 1.759626, 0.8696985, 0.7647059, 0, 1, 1,
0.7781125, -0.2657915, 0.4607124, 0.7686275, 0, 1, 1,
0.7797726, -1.224599, 2.666933, 0.7764706, 0, 1, 1,
0.7821708, -0.3514723, 1.795525, 0.7803922, 0, 1, 1,
0.7833112, 1.333409, 1.035718, 0.7882353, 0, 1, 1,
0.7874354, 0.1524958, 0.9305103, 0.7921569, 0, 1, 1,
0.7914577, 0.358334, 2.291014, 0.8, 0, 1, 1,
0.7980598, -0.7697895, 3.000688, 0.8078431, 0, 1, 1,
0.8020409, 1.313612, 1.082519, 0.8117647, 0, 1, 1,
0.8038848, 0.7821, 1.408597, 0.8196079, 0, 1, 1,
0.805332, 1.344633, 0.3572866, 0.8235294, 0, 1, 1,
0.8092313, -0.05202085, 2.040229, 0.8313726, 0, 1, 1,
0.8126748, 1.227046, 1.33769, 0.8352941, 0, 1, 1,
0.8297204, 0.5805494, 0.6121913, 0.8431373, 0, 1, 1,
0.8298439, -0.590467, 4.030435, 0.8470588, 0, 1, 1,
0.8299495, -0.2620047, 1.672799, 0.854902, 0, 1, 1,
0.8329874, -0.1993678, 2.194912, 0.8588235, 0, 1, 1,
0.8398557, 0.339097, 0.3414579, 0.8666667, 0, 1, 1,
0.8412679, -1.251353, 1.966694, 0.8705882, 0, 1, 1,
0.844583, -0.7551252, 2.068452, 0.8784314, 0, 1, 1,
0.8473181, -0.1752593, 1.713366, 0.8823529, 0, 1, 1,
0.8518854, -0.3635432, 2.238872, 0.8901961, 0, 1, 1,
0.8635882, 0.893006, 1.306901, 0.8941177, 0, 1, 1,
0.8691712, -1.099034, 2.216638, 0.9019608, 0, 1, 1,
0.8795, 0.3133941, 0.9235975, 0.9098039, 0, 1, 1,
0.8895907, 0.7836939, 0.6909438, 0.9137255, 0, 1, 1,
0.8966778, 1.050051, -0.3449879, 0.9215686, 0, 1, 1,
0.8985081, 1.083061, -0.5166292, 0.9254902, 0, 1, 1,
0.9016099, 1.069511, -0.00141805, 0.9333333, 0, 1, 1,
0.9037278, 0.9021778, 0.3217958, 0.9372549, 0, 1, 1,
0.9038004, -1.318393, 4.135979, 0.945098, 0, 1, 1,
0.9072714, 0.1220274, 0.2817861, 0.9490196, 0, 1, 1,
0.9094728, 0.09731966, 3.626219, 0.9568627, 0, 1, 1,
0.9109493, 0.8684176, -0.2425119, 0.9607843, 0, 1, 1,
0.9119304, -0.09972396, 0.8804815, 0.9686275, 0, 1, 1,
0.9205787, -1.67893, 2.541839, 0.972549, 0, 1, 1,
0.9212338, 1.116136, 0.6241803, 0.9803922, 0, 1, 1,
0.9319953, -0.07777656, 3.413947, 0.9843137, 0, 1, 1,
0.9380253, -0.3952856, 1.37403, 0.9921569, 0, 1, 1,
0.9392741, 0.1402946, 1.965195, 0.9960784, 0, 1, 1,
0.9393348, 1.12192, -0.4476967, 1, 0, 0.9960784, 1,
0.9405966, -0.2026045, 1.767823, 1, 0, 0.9882353, 1,
0.9412118, -0.03012007, -0.06375324, 1, 0, 0.9843137, 1,
0.9442614, 0.06855094, 1.9798, 1, 0, 0.9764706, 1,
0.9499908, -0.8643054, 2.241288, 1, 0, 0.972549, 1,
0.9528205, -1.134709, 2.067917, 1, 0, 0.9647059, 1,
0.9566818, -1.424627, 2.588009, 1, 0, 0.9607843, 1,
0.9593366, -1.193435, 2.499511, 1, 0, 0.9529412, 1,
0.9683383, 0.8194659, 0.2212178, 1, 0, 0.9490196, 1,
0.9683647, 0.05547872, 0.749819, 1, 0, 0.9411765, 1,
0.9701062, -0.6065406, 3.328035, 1, 0, 0.9372549, 1,
0.9702413, 0.3286536, 2.569953, 1, 0, 0.9294118, 1,
0.9704993, 1.195746, 1.831132, 1, 0, 0.9254902, 1,
0.9716519, 0.9801329, 1.543709, 1, 0, 0.9176471, 1,
0.9800176, 0.9351511, -1.135658, 1, 0, 0.9137255, 1,
0.9800342, -0.1690882, 3.100849, 1, 0, 0.9058824, 1,
0.9814025, 1.210699, -0.2050378, 1, 0, 0.9019608, 1,
0.9903454, -0.7626801, 2.086992, 1, 0, 0.8941177, 1,
0.9981993, 0.08675069, 1.802865, 1, 0, 0.8862745, 1,
0.998935, -1.141799, 1.103927, 1, 0, 0.8823529, 1,
1.005676, 0.5831254, -0.08474322, 1, 0, 0.8745098, 1,
1.012425, 1.340384, 1.830612, 1, 0, 0.8705882, 1,
1.025432, 1.543392, 1.525048, 1, 0, 0.8627451, 1,
1.032579, -0.894433, 2.594624, 1, 0, 0.8588235, 1,
1.04319, -1.373271, 2.302174, 1, 0, 0.8509804, 1,
1.044179, -0.9925163, 1.889043, 1, 0, 0.8470588, 1,
1.044977, -0.839157, 0.347365, 1, 0, 0.8392157, 1,
1.049756, -0.539159, 1.569263, 1, 0, 0.8352941, 1,
1.073302, -0.5609698, 0.1794618, 1, 0, 0.827451, 1,
1.075449, -0.9962409, 2.939176, 1, 0, 0.8235294, 1,
1.075849, -0.2006645, 2.044818, 1, 0, 0.8156863, 1,
1.081457, -1.024769, 1.512545, 1, 0, 0.8117647, 1,
1.0826, -0.6436889, 1.225639, 1, 0, 0.8039216, 1,
1.083564, -0.2227777, 1.164512, 1, 0, 0.7960784, 1,
1.087111, 1.006774, 0.3818563, 1, 0, 0.7921569, 1,
1.087608, -1.155358, 1.234804, 1, 0, 0.7843137, 1,
1.097458, 0.2756955, 0.1860422, 1, 0, 0.7803922, 1,
1.100711, -0.3550726, 1.778416, 1, 0, 0.772549, 1,
1.101244, 1.188409, 0.3195224, 1, 0, 0.7686275, 1,
1.112882, -0.2103415, 2.63817, 1, 0, 0.7607843, 1,
1.114504, 0.544897, 0.1171482, 1, 0, 0.7568628, 1,
1.118757, 0.219605, 0.7227939, 1, 0, 0.7490196, 1,
1.12613, -1.228474, 3.046769, 1, 0, 0.7450981, 1,
1.140368, 0.3486129, 2.622642, 1, 0, 0.7372549, 1,
1.141012, -1.700451, 1.18913, 1, 0, 0.7333333, 1,
1.153391, -0.8088121, 1.987401, 1, 0, 0.7254902, 1,
1.15539, 1.888365, -0.5608162, 1, 0, 0.7215686, 1,
1.15556, 0.3604005, 1.25863, 1, 0, 0.7137255, 1,
1.163878, 1.059448, 2.615458, 1, 0, 0.7098039, 1,
1.172101, -0.6985997, 1.040462, 1, 0, 0.7019608, 1,
1.173326, -0.3010353, 2.423844, 1, 0, 0.6941177, 1,
1.175551, 0.3774108, -0.08522028, 1, 0, 0.6901961, 1,
1.184811, -0.5405099, 1.548243, 1, 0, 0.682353, 1,
1.192119, -1.148573, 1.548532, 1, 0, 0.6784314, 1,
1.193092, 0.8742831, 2.003659, 1, 0, 0.6705883, 1,
1.193848, 0.7352176, 0.5817823, 1, 0, 0.6666667, 1,
1.206086, 0.6351058, -0.9486569, 1, 0, 0.6588235, 1,
1.211133, 0.9866779, -0.1295757, 1, 0, 0.654902, 1,
1.213598, -0.1017455, 2.338706, 1, 0, 0.6470588, 1,
1.213718, 0.2815467, 1.358977, 1, 0, 0.6431373, 1,
1.218642, -0.6616017, 0.8696107, 1, 0, 0.6352941, 1,
1.220091, 0.9584464, 1.048035, 1, 0, 0.6313726, 1,
1.230827, -0.6485071, 1.549174, 1, 0, 0.6235294, 1,
1.234076, -0.7552187, 3.985281, 1, 0, 0.6196079, 1,
1.238584, -1.01864, 2.375092, 1, 0, 0.6117647, 1,
1.239086, 1.665955, 1.832934, 1, 0, 0.6078432, 1,
1.240827, 0.3786345, 2.443857, 1, 0, 0.6, 1,
1.252643, -0.698996, 2.551646, 1, 0, 0.5921569, 1,
1.254239, 1.801933, 0.2039466, 1, 0, 0.5882353, 1,
1.255772, -0.3268972, 0.6291066, 1, 0, 0.5803922, 1,
1.258593, 0.555947, 1.586578, 1, 0, 0.5764706, 1,
1.276279, 1.749732, 1.71919, 1, 0, 0.5686275, 1,
1.277258, -0.5259915, -0.07728481, 1, 0, 0.5647059, 1,
1.283261, -0.5367188, 3.594047, 1, 0, 0.5568628, 1,
1.287742, 1.582886, 3.169317, 1, 0, 0.5529412, 1,
1.29428, -0.9611899, 1.091055, 1, 0, 0.5450981, 1,
1.302081, -1.495025, 0.7022086, 1, 0, 0.5411765, 1,
1.306409, -1.405568, 1.019393, 1, 0, 0.5333334, 1,
1.311369, 0.7741815, 0.5972483, 1, 0, 0.5294118, 1,
1.313187, 1.019715, -0.5790457, 1, 0, 0.5215687, 1,
1.323293, -1.553587, 1.965638, 1, 0, 0.5176471, 1,
1.325291, -0.05898611, 0.3010588, 1, 0, 0.509804, 1,
1.336399, -0.9161599, 1.777258, 1, 0, 0.5058824, 1,
1.346289, 1.397754, 0.3444932, 1, 0, 0.4980392, 1,
1.351261, -0.5912791, 3.258048, 1, 0, 0.4901961, 1,
1.351804, 1.551811, 1.816329, 1, 0, 0.4862745, 1,
1.372517, 1.303682, 0.7713954, 1, 0, 0.4784314, 1,
1.388321, 0.3582868, 0.9783263, 1, 0, 0.4745098, 1,
1.396042, 1.526855, 0.7180182, 1, 0, 0.4666667, 1,
1.396238, -1.338927, 2.287199, 1, 0, 0.4627451, 1,
1.410601, 0.2586565, 0.8252704, 1, 0, 0.454902, 1,
1.446808, -1.4587, 2.623429, 1, 0, 0.4509804, 1,
1.45136, 0.8433357, 0.3602923, 1, 0, 0.4431373, 1,
1.463406, -0.2848319, 0.6305768, 1, 0, 0.4392157, 1,
1.470022, 1.332396, -1.207951, 1, 0, 0.4313726, 1,
1.483668, -0.4319517, 1.923766, 1, 0, 0.427451, 1,
1.488304, -1.538128, 1.948866, 1, 0, 0.4196078, 1,
1.490698, -0.619929, 1.679939, 1, 0, 0.4156863, 1,
1.491836, -1.961126, 1.645722, 1, 0, 0.4078431, 1,
1.497289, -0.2785243, 1.612145, 1, 0, 0.4039216, 1,
1.502556, -0.9677785, 2.449364, 1, 0, 0.3960784, 1,
1.507569, 0.5964758, 1.676625, 1, 0, 0.3882353, 1,
1.516303, 0.1667536, 1.038278, 1, 0, 0.3843137, 1,
1.521925, 0.3994887, 1.853875, 1, 0, 0.3764706, 1,
1.530691, -0.3324742, 2.340883, 1, 0, 0.372549, 1,
1.53579, -0.9605011, 1.110194, 1, 0, 0.3647059, 1,
1.537865, -0.1435895, 2.556175, 1, 0, 0.3607843, 1,
1.538111, -0.5101523, 2.078494, 1, 0, 0.3529412, 1,
1.541098, 1.164414, 2.748119, 1, 0, 0.3490196, 1,
1.542671, 0.7357533, 2.279666, 1, 0, 0.3411765, 1,
1.556528, -0.3811151, 1.358352, 1, 0, 0.3372549, 1,
1.557476, -0.2655468, 2.28559, 1, 0, 0.3294118, 1,
1.557773, 0.733954, 0.9307352, 1, 0, 0.3254902, 1,
1.577331, 0.7974072, 0.06982884, 1, 0, 0.3176471, 1,
1.581106, -0.7232531, 2.889697, 1, 0, 0.3137255, 1,
1.581249, 0.3843208, 0.8308923, 1, 0, 0.3058824, 1,
1.60408, 2.536337, 0.01967423, 1, 0, 0.2980392, 1,
1.616964, 1.424627, 1.381897, 1, 0, 0.2941177, 1,
1.622513, -0.5866255, 2.11097, 1, 0, 0.2862745, 1,
1.634595, 0.2447799, -0.1483521, 1, 0, 0.282353, 1,
1.63531, -1.392616, 2.217376, 1, 0, 0.2745098, 1,
1.636932, -1.201933, 1.048839, 1, 0, 0.2705882, 1,
1.659567, -0.8340663, 1.833781, 1, 0, 0.2627451, 1,
1.670577, 0.4035532, 1.319421, 1, 0, 0.2588235, 1,
1.674547, -0.9664467, 2.417797, 1, 0, 0.2509804, 1,
1.676735, -1.542161, 4.239108, 1, 0, 0.2470588, 1,
1.681191, 0.4445159, 2.673003, 1, 0, 0.2392157, 1,
1.685022, 0.8316444, 1.131943, 1, 0, 0.2352941, 1,
1.686414, -0.2405171, 1.718635, 1, 0, 0.227451, 1,
1.703984, 1.990767, 0.9241843, 1, 0, 0.2235294, 1,
1.70412, -0.05350345, 1.365028, 1, 0, 0.2156863, 1,
1.71802, -0.2113446, 0.8379001, 1, 0, 0.2117647, 1,
1.74911, 0.6055598, 1.702105, 1, 0, 0.2039216, 1,
1.749716, -1.024887, 1.057721, 1, 0, 0.1960784, 1,
1.754683, -0.7114537, 0.8379369, 1, 0, 0.1921569, 1,
1.777255, -1.430937, 2.845427, 1, 0, 0.1843137, 1,
1.80302, 0.6501954, 0.734386, 1, 0, 0.1803922, 1,
1.81462, -0.4071633, 1.793469, 1, 0, 0.172549, 1,
1.827096, 0.2038432, 1.731761, 1, 0, 0.1686275, 1,
1.83013, -0.506499, -0.04547175, 1, 0, 0.1607843, 1,
1.837645, -1.292185, 2.419005, 1, 0, 0.1568628, 1,
1.848801, -0.669764, 2.7783, 1, 0, 0.1490196, 1,
1.849631, 1.399842, -0.08365419, 1, 0, 0.145098, 1,
1.870126, 0.585629, 2.01924, 1, 0, 0.1372549, 1,
1.876861, 2.111794, 1.373225, 1, 0, 0.1333333, 1,
1.934736, 0.1433308, 2.415063, 1, 0, 0.1254902, 1,
2.017169, -2.334806, 3.348021, 1, 0, 0.1215686, 1,
2.063802, 0.219439, 0.2827035, 1, 0, 0.1137255, 1,
2.071924, 0.06460892, 2.03242, 1, 0, 0.1098039, 1,
2.082824, -0.215397, 3.090471, 1, 0, 0.1019608, 1,
2.087629, -1.843849, 1.331779, 1, 0, 0.09411765, 1,
2.107656, -0.6120021, 1.595876, 1, 0, 0.09019608, 1,
2.141742, -1.464039, 2.535784, 1, 0, 0.08235294, 1,
2.210063, -0.3327161, 2.171422, 1, 0, 0.07843138, 1,
2.237426, -1.938276, 2.866921, 1, 0, 0.07058824, 1,
2.28018, 0.3744647, 2.909974, 1, 0, 0.06666667, 1,
2.353298, -2.167542, 1.343457, 1, 0, 0.05882353, 1,
2.359541, 0.2404145, 0.6698196, 1, 0, 0.05490196, 1,
2.435263, -1.598922, 1.955134, 1, 0, 0.04705882, 1,
2.548476, 0.6216676, 1.619777, 1, 0, 0.04313726, 1,
2.559868, 0.2246075, 1.189823, 1, 0, 0.03529412, 1,
2.745461, 0.4021572, 2.255168, 1, 0, 0.03137255, 1,
2.746803, -0.01551409, 2.209994, 1, 0, 0.02352941, 1,
2.799922, 0.9131557, 2.281608, 1, 0, 0.01960784, 1,
2.93167, 0.8763568, 1.227726, 1, 0, 0.01176471, 1,
3.537593, -1.553897, 1.673297, 1, 0, 0.007843138, 1
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
0.236828, -3.974637, -6.632124, 0, -0.5, 0.5, 0.5,
0.236828, -3.974637, -6.632124, 1, -0.5, 0.5, 0.5,
0.236828, -3.974637, -6.632124, 1, 1.5, 0.5, 0.5,
0.236828, -3.974637, -6.632124, 0, 1.5, 0.5, 0.5
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
-4.182896, 0.1660165, -6.632124, 0, -0.5, 0.5, 0.5,
-4.182896, 0.1660165, -6.632124, 1, -0.5, 0.5, 0.5,
-4.182896, 0.1660165, -6.632124, 1, 1.5, 0.5, 0.5,
-4.182896, 0.1660165, -6.632124, 0, 1.5, 0.5, 0.5
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
-4.182896, -3.974637, 0.4497058, 0, -0.5, 0.5, 0.5,
-4.182896, -3.974637, 0.4497058, 1, -0.5, 0.5, 0.5,
-4.182896, -3.974637, 0.4497058, 1, 1.5, 0.5, 0.5,
-4.182896, -3.974637, 0.4497058, 0, 1.5, 0.5, 0.5
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
-3, -3.019101, -4.997855,
3, -3.019101, -4.997855,
-3, -3.019101, -4.997855,
-3, -3.178357, -5.270234,
-2, -3.019101, -4.997855,
-2, -3.178357, -5.270234,
-1, -3.019101, -4.997855,
-1, -3.178357, -5.270234,
0, -3.019101, -4.997855,
0, -3.178357, -5.270234,
1, -3.019101, -4.997855,
1, -3.178357, -5.270234,
2, -3.019101, -4.997855,
2, -3.178357, -5.270234,
3, -3.019101, -4.997855,
3, -3.178357, -5.270234
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
-3, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
-3, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
-3, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
-3, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
-2, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
-2, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
-2, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
-2, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
-1, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
-1, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
-1, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
-1, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
0, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
0, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
0, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
0, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
1, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
1, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
1, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
1, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
2, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
2, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
2, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
2, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5,
3, -3.496869, -5.81499, 0, -0.5, 0.5, 0.5,
3, -3.496869, -5.81499, 1, -0.5, 0.5, 0.5,
3, -3.496869, -5.81499, 1, 1.5, 0.5, 0.5,
3, -3.496869, -5.81499, 0, 1.5, 0.5, 0.5
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
-3.16296, -2, -4.997855,
-3.16296, 3, -4.997855,
-3.16296, -2, -4.997855,
-3.332949, -2, -5.270234,
-3.16296, -1, -4.997855,
-3.332949, -1, -5.270234,
-3.16296, 0, -4.997855,
-3.332949, 0, -5.270234,
-3.16296, 1, -4.997855,
-3.332949, 1, -5.270234,
-3.16296, 2, -4.997855,
-3.332949, 2, -5.270234,
-3.16296, 3, -4.997855,
-3.332949, 3, -5.270234
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
-3.672928, -2, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, -2, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, -2, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, -2, -5.81499, 0, 1.5, 0.5, 0.5,
-3.672928, -1, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, -1, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, -1, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, -1, -5.81499, 0, 1.5, 0.5, 0.5,
-3.672928, 0, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, 0, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, 0, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, 0, -5.81499, 0, 1.5, 0.5, 0.5,
-3.672928, 1, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, 1, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, 1, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, 1, -5.81499, 0, 1.5, 0.5, 0.5,
-3.672928, 2, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, 2, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, 2, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, 2, -5.81499, 0, 1.5, 0.5, 0.5,
-3.672928, 3, -5.81499, 0, -0.5, 0.5, 0.5,
-3.672928, 3, -5.81499, 1, -0.5, 0.5, 0.5,
-3.672928, 3, -5.81499, 1, 1.5, 0.5, 0.5,
-3.672928, 3, -5.81499, 0, 1.5, 0.5, 0.5
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
-3.16296, -3.019101, -4,
-3.16296, -3.019101, 4,
-3.16296, -3.019101, -4,
-3.332949, -3.178357, -4,
-3.16296, -3.019101, -2,
-3.332949, -3.178357, -2,
-3.16296, -3.019101, 0,
-3.332949, -3.178357, 0,
-3.16296, -3.019101, 2,
-3.332949, -3.178357, 2,
-3.16296, -3.019101, 4,
-3.332949, -3.178357, 4
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
-3.672928, -3.496869, -4, 0, -0.5, 0.5, 0.5,
-3.672928, -3.496869, -4, 1, -0.5, 0.5, 0.5,
-3.672928, -3.496869, -4, 1, 1.5, 0.5, 0.5,
-3.672928, -3.496869, -4, 0, 1.5, 0.5, 0.5,
-3.672928, -3.496869, -2, 0, -0.5, 0.5, 0.5,
-3.672928, -3.496869, -2, 1, -0.5, 0.5, 0.5,
-3.672928, -3.496869, -2, 1, 1.5, 0.5, 0.5,
-3.672928, -3.496869, -2, 0, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 0, 0, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 0, 1, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 0, 1, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 0, 0, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 2, 0, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 2, 1, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 2, 1, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 2, 0, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 4, 0, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 4, 1, -0.5, 0.5, 0.5,
-3.672928, -3.496869, 4, 1, 1.5, 0.5, 0.5,
-3.672928, -3.496869, 4, 0, 1.5, 0.5, 0.5
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
-3.16296, -3.019101, -4.997855,
-3.16296, 3.351134, -4.997855,
-3.16296, -3.019101, 5.897267,
-3.16296, 3.351134, 5.897267,
-3.16296, -3.019101, -4.997855,
-3.16296, -3.019101, 5.897267,
-3.16296, 3.351134, -4.997855,
-3.16296, 3.351134, 5.897267,
-3.16296, -3.019101, -4.997855,
3.636616, -3.019101, -4.997855,
-3.16296, -3.019101, 5.897267,
3.636616, -3.019101, 5.897267,
-3.16296, 3.351134, -4.997855,
3.636616, 3.351134, -4.997855,
-3.16296, 3.351134, 5.897267,
3.636616, 3.351134, 5.897267,
3.636616, -3.019101, -4.997855,
3.636616, 3.351134, -4.997855,
3.636616, -3.019101, 5.897267,
3.636616, 3.351134, 5.897267,
3.636616, -3.019101, -4.997855,
3.636616, -3.019101, 5.897267,
3.636616, 3.351134, -4.997855,
3.636616, 3.351134, 5.897267
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
var radius = 7.655088;
var distance = 34.05835;
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
mvMatrix.translate( -0.236828, -0.1660165, -0.4497058 );
mvMatrix.scale( 1.217257, 1.299298, 0.7596823 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05835);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
5-acetyl-8-quinolino<-read.table("5-acetyl-8-quinolino.xyz")
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
-3.063937, -0.6196159, -0.177525, 0, 0, 1, 1, 1,
-2.740776, 0.1267842, 0.4570228, 1, 0, 0, 1, 1,
-2.726813, -0.2119397, -1.254304, 1, 0, 0, 1, 1,
-2.630901, -0.1006484, -1.747904, 1, 0, 0, 1, 1,
-2.617944, 0.03673004, -2.529875, 1, 0, 0, 1, 1,
-2.590325, -0.7544157, -1.036337, 1, 0, 0, 1, 1,
-2.510269, 0.9078537, -0.7043923, 0, 0, 0, 1, 1,
-2.460238, -1.274753, -3.325995, 0, 0, 0, 1, 1,
-2.350136, -0.681199, -2.863195, 0, 0, 0, 1, 1,
-2.334553, 0.5313166, -2.887089, 0, 0, 0, 1, 1,
-2.268995, 1.450284, -0.1475301, 0, 0, 0, 1, 1,
-2.224776, -0.1296789, -0.8192438, 0, 0, 0, 1, 1,
-2.105332, 0.06716228, -1.568167, 0, 0, 0, 1, 1,
-2.10442, 1.535246, -0.8799502, 1, 1, 1, 1, 1,
-2.095908, -0.8465123, -2.194308, 1, 1, 1, 1, 1,
-2.094899, 1.599043, -1.220378, 1, 1, 1, 1, 1,
-2.081847, 0.2996496, -1.096578, 1, 1, 1, 1, 1,
-2.0575, 2.4408, 1.716758, 1, 1, 1, 1, 1,
-2.052076, -0.7435294, -1.00487, 1, 1, 1, 1, 1,
-2.046231, 0.707843, -1.500426, 1, 1, 1, 1, 1,
-2.017014, -1.980637, -1.635936, 1, 1, 1, 1, 1,
-2.01156, 2.052334, -0.7315003, 1, 1, 1, 1, 1,
-2.011484, -0.5392362, -1.56551, 1, 1, 1, 1, 1,
-1.996908, 1.806073, 0.4546736, 1, 1, 1, 1, 1,
-1.955765, -0.2181853, -2.755973, 1, 1, 1, 1, 1,
-1.886152, 0.6417232, -0.6278678, 1, 1, 1, 1, 1,
-1.882872, 1.729475, -1.462296, 1, 1, 1, 1, 1,
-1.858818, 0.04747876, -0.7889268, 1, 1, 1, 1, 1,
-1.851204, -1.049867, -1.564215, 0, 0, 1, 1, 1,
-1.846591, -0.1746996, -0.6026332, 1, 0, 0, 1, 1,
-1.843851, -0.06007983, -2.947439, 1, 0, 0, 1, 1,
-1.829504, -2.050067, -2.012948, 1, 0, 0, 1, 1,
-1.820016, -0.1149482, -1.981101, 1, 0, 0, 1, 1,
-1.816503, -0.4118298, -1.272596, 1, 0, 0, 1, 1,
-1.815234, -2.370426, -2.744191, 0, 0, 0, 1, 1,
-1.798836, 0.6717151, -0.989621, 0, 0, 0, 1, 1,
-1.78737, 0.5921501, -1.820798, 0, 0, 0, 1, 1,
-1.782295, -0.4821481, -0.2450874, 0, 0, 0, 1, 1,
-1.779737, -1.731668, -1.677267, 0, 0, 0, 1, 1,
-1.758101, -1.904187, -2.269361, 0, 0, 0, 1, 1,
-1.738749, -0.2372078, -1.8879, 0, 0, 0, 1, 1,
-1.729288, -1.419952, -2.026298, 1, 1, 1, 1, 1,
-1.715174, 0.0806241, -1.014643, 1, 1, 1, 1, 1,
-1.710599, -0.8583248, -2.223263, 1, 1, 1, 1, 1,
-1.690866, -0.6011305, -1.615348, 1, 1, 1, 1, 1,
-1.68804, 0.2240669, -0.985122, 1, 1, 1, 1, 1,
-1.674663, 1.421546, -0.2161694, 1, 1, 1, 1, 1,
-1.670317, 3.258364, -0.3840007, 1, 1, 1, 1, 1,
-1.655555, 0.2731688, -1.083825, 1, 1, 1, 1, 1,
-1.65555, 0.7076122, -1.010549, 1, 1, 1, 1, 1,
-1.65123, 1.60763, -0.2051672, 1, 1, 1, 1, 1,
-1.642804, -0.6928501, -1.860601, 1, 1, 1, 1, 1,
-1.640368, 1.247572, -0.9339852, 1, 1, 1, 1, 1,
-1.63324, 0.2246047, -0.8428196, 1, 1, 1, 1, 1,
-1.61249, 0.1946089, -3.018944, 1, 1, 1, 1, 1,
-1.60921, 0.4792808, -2.086908, 1, 1, 1, 1, 1,
-1.604897, -0.02468862, -2.048687, 0, 0, 1, 1, 1,
-1.604241, 1.345904, -1.480119, 1, 0, 0, 1, 1,
-1.602246, -0.1924329, -0.6104594, 1, 0, 0, 1, 1,
-1.602004, 1.480082, -0.6764065, 1, 0, 0, 1, 1,
-1.594174, -0.7140349, -0.3494956, 1, 0, 0, 1, 1,
-1.591336, -0.3802746, -1.164231, 1, 0, 0, 1, 1,
-1.567921, -1.210376, -2.623716, 0, 0, 0, 1, 1,
-1.560357, -0.1323583, -1.323017, 0, 0, 0, 1, 1,
-1.557537, -0.6736443, -3.311397, 0, 0, 0, 1, 1,
-1.544492, 0.828943, -2.779901, 0, 0, 0, 1, 1,
-1.543727, -0.3594272, -1.281987, 0, 0, 0, 1, 1,
-1.538219, -0.2631916, -1.368497, 0, 0, 0, 1, 1,
-1.535891, 0.04043796, -1.179613, 0, 0, 0, 1, 1,
-1.526786, -0.462261, -1.789074, 1, 1, 1, 1, 1,
-1.52016, -1.538063, -4.193936, 1, 1, 1, 1, 1,
-1.520056, -0.4214926, -1.03059, 1, 1, 1, 1, 1,
-1.515103, -0.3274347, -2.83732, 1, 1, 1, 1, 1,
-1.475175, 0.822808, -1.587091, 1, 1, 1, 1, 1,
-1.46938, -0.9961087, -2.076011, 1, 1, 1, 1, 1,
-1.465708, 1.838288, -0.1682154, 1, 1, 1, 1, 1,
-1.45507, 0.4060139, -2.764353, 1, 1, 1, 1, 1,
-1.45073, -0.9209632, -1.214043, 1, 1, 1, 1, 1,
-1.434874, 1.028237, -1.840639, 1, 1, 1, 1, 1,
-1.425573, -1.210403, -3.158357, 1, 1, 1, 1, 1,
-1.422022, -2.111666, -1.986649, 1, 1, 1, 1, 1,
-1.420071, 1.846683, -2.252507, 1, 1, 1, 1, 1,
-1.417919, 0.009622997, -1.905623, 1, 1, 1, 1, 1,
-1.415372, 0.8643924, -0.5476516, 1, 1, 1, 1, 1,
-1.403092, -0.8142201, -2.898902, 0, 0, 1, 1, 1,
-1.394297, -0.4940983, -1.241041, 1, 0, 0, 1, 1,
-1.389726, 0.1265225, -2.612419, 1, 0, 0, 1, 1,
-1.389714, 1.710567, -0.933134, 1, 0, 0, 1, 1,
-1.387316, -0.6444833, -2.059974, 1, 0, 0, 1, 1,
-1.376568, -0.4107026, -1.039946, 1, 0, 0, 1, 1,
-1.372679, -0.5405018, -1.278154, 0, 0, 0, 1, 1,
-1.369954, -0.6964083, -1.692309, 0, 0, 0, 1, 1,
-1.367572, -0.7673094, -3.952355, 0, 0, 0, 1, 1,
-1.34599, -0.03382055, -1.099792, 0, 0, 0, 1, 1,
-1.320561, -0.4521348, -1.064801, 0, 0, 0, 1, 1,
-1.315462, 0.04553985, -3.192487, 0, 0, 0, 1, 1,
-1.310716, 1.394994, -1.366947, 0, 0, 0, 1, 1,
-1.30641, -0.5122395, -2.948591, 1, 1, 1, 1, 1,
-1.303377, 0.3290904, -0.9530641, 1, 1, 1, 1, 1,
-1.290839, 1.926332, -0.8903627, 1, 1, 1, 1, 1,
-1.286351, 1.075436, -1.853944, 1, 1, 1, 1, 1,
-1.281252, 0.110756, -2.965868, 1, 1, 1, 1, 1,
-1.280975, 1.297612, -0.8249167, 1, 1, 1, 1, 1,
-1.267654, -0.5596169, -0.511057, 1, 1, 1, 1, 1,
-1.265263, 0.5194369, -2.821877, 1, 1, 1, 1, 1,
-1.264384, -0.9769056, -2.201783, 1, 1, 1, 1, 1,
-1.263628, -1.23601, -0.6320304, 1, 1, 1, 1, 1,
-1.261721, 0.7513215, 0.06418831, 1, 1, 1, 1, 1,
-1.252274, -0.8296789, -3.105977, 1, 1, 1, 1, 1,
-1.250674, -1.038778, -3.14561, 1, 1, 1, 1, 1,
-1.243065, -0.2547911, -2.839562, 1, 1, 1, 1, 1,
-1.234864, -0.8285524, -3.279472, 1, 1, 1, 1, 1,
-1.231043, -0.4320734, -2.781193, 0, 0, 1, 1, 1,
-1.222992, 0.2779782, -2.998361, 1, 0, 0, 1, 1,
-1.220984, 1.08216, -0.2537933, 1, 0, 0, 1, 1,
-1.214461, 0.07413372, -1.47977, 1, 0, 0, 1, 1,
-1.212974, 1.163657, -1.033448, 1, 0, 0, 1, 1,
-1.21098, -0.4561347, -1.562943, 1, 0, 0, 1, 1,
-1.206599, -0.4024426, -2.397094, 0, 0, 0, 1, 1,
-1.202549, -1.068646, -0.8941096, 0, 0, 0, 1, 1,
-1.200417, -1.912664, -1.632269, 0, 0, 0, 1, 1,
-1.199478, 0.5713006, -1.185013, 0, 0, 0, 1, 1,
-1.198082, -0.3697068, -2.117417, 0, 0, 0, 1, 1,
-1.195849, -0.5975212, -1.414332, 0, 0, 0, 1, 1,
-1.186387, -2.200987, -3.383848, 0, 0, 0, 1, 1,
-1.181336, -1.19349, -3.296477, 1, 1, 1, 1, 1,
-1.177373, -0.6405775, -0.3601449, 1, 1, 1, 1, 1,
-1.176934, 0.7755364, -4.434128, 1, 1, 1, 1, 1,
-1.175816, 1.234771, -1.253296, 1, 1, 1, 1, 1,
-1.166109, -0.2957683, -1.954146, 1, 1, 1, 1, 1,
-1.164097, 0.1696858, -1.493402, 1, 1, 1, 1, 1,
-1.161759, 1.632685, -1.973144, 1, 1, 1, 1, 1,
-1.156901, -0.7185391, -1.204625, 1, 1, 1, 1, 1,
-1.149926, -1.187448, -2.447865, 1, 1, 1, 1, 1,
-1.14183, -0.2679732, -0.02794336, 1, 1, 1, 1, 1,
-1.136481, -0.6376213, -1.832354, 1, 1, 1, 1, 1,
-1.118923, -0.7365996, -1.686364, 1, 1, 1, 1, 1,
-1.117722, -0.474076, -2.019775, 1, 1, 1, 1, 1,
-1.110442, 1.52124, -0.7880535, 1, 1, 1, 1, 1,
-1.109266, 0.2253714, -0.4387156, 1, 1, 1, 1, 1,
-1.103209, -2.2837, -3.37034, 0, 0, 1, 1, 1,
-1.101773, -0.4333903, -2.028013, 1, 0, 0, 1, 1,
-1.092023, 0.3535394, -1.312799, 1, 0, 0, 1, 1,
-1.091673, 2.697, -2.365257, 1, 0, 0, 1, 1,
-1.091643, -1.082785, -3.127138, 1, 0, 0, 1, 1,
-1.088313, -2.445648, -2.191646, 1, 0, 0, 1, 1,
-1.084231, 0.4323606, -1.964521, 0, 0, 0, 1, 1,
-1.081158, -0.5375119, -1.372349, 0, 0, 0, 1, 1,
-1.076648, 0.7750635, 0.7646332, 0, 0, 0, 1, 1,
-1.072828, -0.6761794, -2.68985, 0, 0, 0, 1, 1,
-1.067568, -1.992851, -2.524256, 0, 0, 0, 1, 1,
-1.050774, -1.061745, -2.365351, 0, 0, 0, 1, 1,
-1.046613, 0.4157524, -1.014668, 0, 0, 0, 1, 1,
-1.034845, -0.6551559, -1.477753, 1, 1, 1, 1, 1,
-1.025819, -0.1011994, -2.626254, 1, 1, 1, 1, 1,
-1.024322, 0.7072199, -1.340216, 1, 1, 1, 1, 1,
-1.02309, 0.2579628, -1.462932, 1, 1, 1, 1, 1,
-1.01838, -1.417194, -2.627268, 1, 1, 1, 1, 1,
-1.015618, 0.5255864, -0.1134553, 1, 1, 1, 1, 1,
-1.014611, -2.130034, -2.840078, 1, 1, 1, 1, 1,
-1.006299, -0.03874062, -2.253188, 1, 1, 1, 1, 1,
-1.00267, 0.09924882, -1.073546, 1, 1, 1, 1, 1,
-1.002439, -0.6433058, -0.3119366, 1, 1, 1, 1, 1,
-0.9986225, -0.0544182, 0.102689, 1, 1, 1, 1, 1,
-0.9942541, 1.663583, 0.3714052, 1, 1, 1, 1, 1,
-0.9932776, -1.13489, -3.005188, 1, 1, 1, 1, 1,
-0.9843444, 0.6170045, 1.523927, 1, 1, 1, 1, 1,
-0.9784476, -1.19366, -2.683121, 1, 1, 1, 1, 1,
-0.9782826, 2.061719, 0.5389267, 0, 0, 1, 1, 1,
-0.9734577, 0.938667, -0.008162238, 1, 0, 0, 1, 1,
-0.9653306, -1.460475, -2.666194, 1, 0, 0, 1, 1,
-0.9627652, 2.532604, -0.01012096, 1, 0, 0, 1, 1,
-0.9550402, -0.4268613, -3.309246, 1, 0, 0, 1, 1,
-0.9499593, 0.4884809, 1.66148, 1, 0, 0, 1, 1,
-0.9251665, -1.20359, -2.810666, 0, 0, 0, 1, 1,
-0.917249, -0.8191166, -2.324561, 0, 0, 0, 1, 1,
-0.9159611, -1.827762, -3.690425, 0, 0, 0, 1, 1,
-0.8979747, 1.945534, -2.363975, 0, 0, 0, 1, 1,
-0.8842055, 0.4225836, -1.893877, 0, 0, 0, 1, 1,
-0.8823956, 1.56151, -1.39284, 0, 0, 0, 1, 1,
-0.8821297, -0.6575939, -1.526993, 0, 0, 0, 1, 1,
-0.8799143, 1.447802, -0.053626, 1, 1, 1, 1, 1,
-0.8787923, -0.07783273, -0.905296, 1, 1, 1, 1, 1,
-0.8760005, -1.747086, -2.925472, 1, 1, 1, 1, 1,
-0.8732998, 1.092969, -0.886957, 1, 1, 1, 1, 1,
-0.8685565, 1.272683, 0.05096789, 1, 1, 1, 1, 1,
-0.8670011, 0.7852074, -1.501101, 1, 1, 1, 1, 1,
-0.8542714, 0.7395918, -2.688408, 1, 1, 1, 1, 1,
-0.8480424, -0.2811156, -0.3714212, 1, 1, 1, 1, 1,
-0.8461598, 1.104461, -0.815205, 1, 1, 1, 1, 1,
-0.8359584, -0.03769545, -1.799487, 1, 1, 1, 1, 1,
-0.8341708, 0.4501216, -0.8211059, 1, 1, 1, 1, 1,
-0.8327118, 0.7516364, 0.4911643, 1, 1, 1, 1, 1,
-0.8253139, 1.28409, -0.8306065, 1, 1, 1, 1, 1,
-0.8231398, 0.4792626, -2.598182, 1, 1, 1, 1, 1,
-0.8204349, -0.5238485, -3.440952, 1, 1, 1, 1, 1,
-0.8201375, -0.7389069, -2.265185, 0, 0, 1, 1, 1,
-0.8187436, -0.6039282, -3.189154, 1, 0, 0, 1, 1,
-0.812013, -0.8207478, -3.193731, 1, 0, 0, 1, 1,
-0.8088526, -0.05978461, -1.985026, 1, 0, 0, 1, 1,
-0.8063386, -1.923909, -2.079765, 1, 0, 0, 1, 1,
-0.8022211, -0.267263, -2.067728, 1, 0, 0, 1, 1,
-0.7974045, 1.202688, -2.561535, 0, 0, 0, 1, 1,
-0.7965377, 0.1084342, -1.600868, 0, 0, 0, 1, 1,
-0.7949692, 0.3452997, -0.9345788, 0, 0, 0, 1, 1,
-0.7916455, -0.2505119, -3.013848, 0, 0, 0, 1, 1,
-0.791144, -1.657733, -3.800866, 0, 0, 0, 1, 1,
-0.7691764, -1.128161, -3.336812, 0, 0, 0, 1, 1,
-0.7645003, 1.972284, 0.5211866, 0, 0, 0, 1, 1,
-0.763864, -0.3720275, -2.073448, 1, 1, 1, 1, 1,
-0.7637895, -0.1954236, -1.140237, 1, 1, 1, 1, 1,
-0.7555562, -0.6099113, -3.236636, 1, 1, 1, 1, 1,
-0.7553104, 1.492003, -1.955353, 1, 1, 1, 1, 1,
-0.754779, -2.019108, -2.916939, 1, 1, 1, 1, 1,
-0.7515876, 1.086953, -0.549682, 1, 1, 1, 1, 1,
-0.747189, -0.6484783, -2.218479, 1, 1, 1, 1, 1,
-0.7340212, 0.06629153, -0.6470277, 1, 1, 1, 1, 1,
-0.7312545, 1.676766, 0.2995653, 1, 1, 1, 1, 1,
-0.7274566, -0.4072007, -3.62119, 1, 1, 1, 1, 1,
-0.7266038, -1.537899, -3.042921, 1, 1, 1, 1, 1,
-0.7222574, -0.8275262, -2.367372, 1, 1, 1, 1, 1,
-0.7207423, 1.158466, -0.2815943, 1, 1, 1, 1, 1,
-0.7177238, 0.6107012, 0.3214486, 1, 1, 1, 1, 1,
-0.7175792, -0.9266514, -2.012042, 1, 1, 1, 1, 1,
-0.7174144, -1.720235, -3.414299, 0, 0, 1, 1, 1,
-0.7169843, 0.1611493, -1.51871, 1, 0, 0, 1, 1,
-0.7062375, 1.833187, -0.189778, 1, 0, 0, 1, 1,
-0.6984313, -0.7373998, -2.423306, 1, 0, 0, 1, 1,
-0.6960762, -1.40928, -4.087899, 1, 0, 0, 1, 1,
-0.69524, -0.03165662, -1.314449, 1, 0, 0, 1, 1,
-0.6934728, 0.6352807, -0.4843136, 0, 0, 0, 1, 1,
-0.6906508, -1.185341, -0.2719728, 0, 0, 0, 1, 1,
-0.6875083, 1.034791, -1.07235, 0, 0, 0, 1, 1,
-0.6872733, 0.5417896, -0.04649419, 0, 0, 0, 1, 1,
-0.6792255, -1.449364, -1.565506, 0, 0, 0, 1, 1,
-0.6777757, -0.202289, -1.967746, 0, 0, 0, 1, 1,
-0.6735986, -0.1264808, -1.851147, 0, 0, 0, 1, 1,
-0.672729, 0.1802953, -0.8592459, 1, 1, 1, 1, 1,
-0.6721383, 1.707378, -0.3322014, 1, 1, 1, 1, 1,
-0.6710411, 0.5877969, 0.3026574, 1, 1, 1, 1, 1,
-0.6680506, 0.3017426, 0.8528462, 1, 1, 1, 1, 1,
-0.6646739, 0.7818991, -0.6241039, 1, 1, 1, 1, 1,
-0.6640702, 0.6457242, -2.417376, 1, 1, 1, 1, 1,
-0.6598563, 0.5369765, 0.4367316, 1, 1, 1, 1, 1,
-0.6589368, -1.250884, -2.9183, 1, 1, 1, 1, 1,
-0.6585557, 1.044312, -3.332686, 1, 1, 1, 1, 1,
-0.6528154, -1.098054, -3.935539, 1, 1, 1, 1, 1,
-0.6502077, 0.7618857, 0.1611706, 1, 1, 1, 1, 1,
-0.6488839, 0.7528779, 0.2247798, 1, 1, 1, 1, 1,
-0.6459371, -0.3264095, -1.68486, 1, 1, 1, 1, 1,
-0.6451426, -0.1262488, -1.198548, 1, 1, 1, 1, 1,
-0.6430432, -0.3087815, -3.47801, 1, 1, 1, 1, 1,
-0.6389802, 0.7707582, -2.479264, 0, 0, 1, 1, 1,
-0.6382416, 0.310596, -1.965929, 1, 0, 0, 1, 1,
-0.6377524, 1.03069, -0.06475382, 1, 0, 0, 1, 1,
-0.6318957, 0.4778185, -0.5350537, 1, 0, 0, 1, 1,
-0.6317539, -0.107791, -1.247354, 1, 0, 0, 1, 1,
-0.6273741, -2.140483, -3.563025, 1, 0, 0, 1, 1,
-0.6268226, 1.008896, 0.3379165, 0, 0, 0, 1, 1,
-0.6178901, -2.601173, -2.998082, 0, 0, 0, 1, 1,
-0.6175296, 1.125135, -0.4463844, 0, 0, 0, 1, 1,
-0.610753, -0.04886099, -1.848788, 0, 0, 0, 1, 1,
-0.6063887, -1.263503, -2.738767, 0, 0, 0, 1, 1,
-0.6041701, 1.0477, -1.296243, 0, 0, 0, 1, 1,
-0.6027058, -1.906758, -3.539705, 0, 0, 0, 1, 1,
-0.6015429, -0.8267321, -2.395328, 1, 1, 1, 1, 1,
-0.5991672, -1.824522, -2.409729, 1, 1, 1, 1, 1,
-0.5956552, -0.4638272, -3.041821, 1, 1, 1, 1, 1,
-0.5898411, -0.2466269, -1.0783, 1, 1, 1, 1, 1,
-0.5846879, 0.1557653, -2.289643, 1, 1, 1, 1, 1,
-0.5759962, -0.6074178, -1.929786, 1, 1, 1, 1, 1,
-0.5753005, -0.4005945, -1.578947, 1, 1, 1, 1, 1,
-0.5641618, -1.522795, -3.467775, 1, 1, 1, 1, 1,
-0.5618614, -1.253287, -2.741788, 1, 1, 1, 1, 1,
-0.5599994, 1.013249, -0.7218785, 1, 1, 1, 1, 1,
-0.5570052, -1.16498, -0.4504898, 1, 1, 1, 1, 1,
-0.5532993, 1.458293, 0.9371561, 1, 1, 1, 1, 1,
-0.5418158, 2.085911, 1.397061, 1, 1, 1, 1, 1,
-0.5410215, -1.310813, -2.667731, 1, 1, 1, 1, 1,
-0.5395369, -0.3781504, -1.296541, 1, 1, 1, 1, 1,
-0.5370655, 0.871031, 0.4206353, 0, 0, 1, 1, 1,
-0.534918, 1.779306, -1.252707, 1, 0, 0, 1, 1,
-0.53352, -0.05152065, -1.342347, 1, 0, 0, 1, 1,
-0.5326624, -1.5747, -2.684635, 1, 0, 0, 1, 1,
-0.5307538, 0.07560895, -1.827654, 1, 0, 0, 1, 1,
-0.5299382, -1.498637, -2.755734, 1, 0, 0, 1, 1,
-0.5298458, 1.225042, 0.6819862, 0, 0, 0, 1, 1,
-0.528743, 0.7628826, -0.2660508, 0, 0, 0, 1, 1,
-0.5281301, 0.9364487, -1.124669, 0, 0, 0, 1, 1,
-0.527051, -1.524119, -0.7904303, 0, 0, 0, 1, 1,
-0.5218551, 2.578613, 0.2728671, 0, 0, 0, 1, 1,
-0.5191009, -1.025984, -2.24813, 0, 0, 0, 1, 1,
-0.5172975, -1.183943, -3.981426, 0, 0, 0, 1, 1,
-0.5148432, -0.3163454, -0.8946649, 1, 1, 1, 1, 1,
-0.5104496, -0.3531072, -1.407941, 1, 1, 1, 1, 1,
-0.508783, -0.1192342, -1.818737, 1, 1, 1, 1, 1,
-0.5081062, 0.2996617, -0.0395243, 1, 1, 1, 1, 1,
-0.5027596, 0.7617261, -0.6319068, 1, 1, 1, 1, 1,
-0.4983897, -0.6549397, -2.570338, 1, 1, 1, 1, 1,
-0.4914863, 0.8345847, -0.6695786, 1, 1, 1, 1, 1,
-0.4836291, 0.5642628, -1.900419, 1, 1, 1, 1, 1,
-0.4817036, -0.2167459, -1.695514, 1, 1, 1, 1, 1,
-0.479639, 0.0802721, -0.6296831, 1, 1, 1, 1, 1,
-0.4781261, 0.6655699, -1.29108, 1, 1, 1, 1, 1,
-0.4776931, -0.00486143, -0.1903228, 1, 1, 1, 1, 1,
-0.4701429, 0.8420259, -0.6733298, 1, 1, 1, 1, 1,
-0.4642905, -0.6542511, -1.694271, 1, 1, 1, 1, 1,
-0.4587218, 0.240746, -1.989906, 1, 1, 1, 1, 1,
-0.4551478, 0.2647879, -0.02005902, 0, 0, 1, 1, 1,
-0.4534049, 0.3528934, -2.734899, 1, 0, 0, 1, 1,
-0.4528191, 0.1192417, -1.52071, 1, 0, 0, 1, 1,
-0.4512675, -1.369783, -2.088768, 1, 0, 0, 1, 1,
-0.4469461, -0.1723164, -2.760483, 1, 0, 0, 1, 1,
-0.4464672, 0.6558747, -1.197251, 1, 0, 0, 1, 1,
-0.4453795, 1.741553, -0.6427317, 0, 0, 0, 1, 1,
-0.4409767, -0.9140309, -4.456008, 0, 0, 0, 1, 1,
-0.4401433, 1.130061, 0.8571302, 0, 0, 0, 1, 1,
-0.4381284, 0.2225422, -0.9919326, 0, 0, 0, 1, 1,
-0.43742, 0.4278568, -0.7342829, 0, 0, 0, 1, 1,
-0.4328016, 0.5514184, -1.280878, 0, 0, 0, 1, 1,
-0.4277713, 0.3658731, -0.237845, 0, 0, 0, 1, 1,
-0.4239045, -1.849748, -3.673482, 1, 1, 1, 1, 1,
-0.4229822, 0.05997217, -0.8022719, 1, 1, 1, 1, 1,
-0.4225717, 0.2638281, -0.7957761, 1, 1, 1, 1, 1,
-0.4222495, 0.1601722, -1.259709, 1, 1, 1, 1, 1,
-0.4213636, 0.633206, -0.3367039, 1, 1, 1, 1, 1,
-0.4189587, 0.9970686, 0.2759143, 1, 1, 1, 1, 1,
-0.417235, 0.9904336, -1.019067, 1, 1, 1, 1, 1,
-0.4103838, -0.3760966, -1.510128, 1, 1, 1, 1, 1,
-0.4084439, 2.735105, 0.4141206, 1, 1, 1, 1, 1,
-0.4027252, -0.1160332, -0.8326932, 1, 1, 1, 1, 1,
-0.4026405, 0.9026013, -2.489005, 1, 1, 1, 1, 1,
-0.4011031, -1.294399, -3.120943, 1, 1, 1, 1, 1,
-0.3990035, 0.1021398, -0.135897, 1, 1, 1, 1, 1,
-0.3987477, -1.786339, -2.378117, 1, 1, 1, 1, 1,
-0.3971238, -0.5917247, -3.060474, 1, 1, 1, 1, 1,
-0.395768, -1.123333, -2.440665, 0, 0, 1, 1, 1,
-0.3930892, -0.1542648, -1.824968, 1, 0, 0, 1, 1,
-0.386972, -0.09421054, -2.867381, 1, 0, 0, 1, 1,
-0.3858014, 0.3436989, -1.334344, 1, 0, 0, 1, 1,
-0.3839853, 0.3276452, -1.16095, 1, 0, 0, 1, 1,
-0.3834843, -0.7834968, -1.504198, 1, 0, 0, 1, 1,
-0.3780817, -0.9574378, -3.848638, 0, 0, 0, 1, 1,
-0.3735073, 0.8750975, -1.361755, 0, 0, 0, 1, 1,
-0.3700897, 2.105538, -1.990662, 0, 0, 0, 1, 1,
-0.3683783, -0.6167038, -3.82025, 0, 0, 0, 1, 1,
-0.3671239, 0.1580042, 0.6203909, 0, 0, 0, 1, 1,
-0.3671136, 0.1841347, -0.5881935, 0, 0, 0, 1, 1,
-0.3649548, 0.7529767, -0.6660838, 0, 0, 0, 1, 1,
-0.3636267, 0.1464292, -0.4618225, 1, 1, 1, 1, 1,
-0.361637, 0.6536056, -1.0894, 1, 1, 1, 1, 1,
-0.359377, 0.3121426, -0.7886529, 1, 1, 1, 1, 1,
-0.3592782, 1.022668, 1.185143, 1, 1, 1, 1, 1,
-0.3592468, -0.4231395, -3.05694, 1, 1, 1, 1, 1,
-0.3553318, 0.8627725, 0.2747917, 1, 1, 1, 1, 1,
-0.3541881, 1.189931, 0.6425943, 1, 1, 1, 1, 1,
-0.3534597, 1.170186, -1.145619, 1, 1, 1, 1, 1,
-0.3529809, 0.5861409, 0.6795253, 1, 1, 1, 1, 1,
-0.3484715, -0.4580569, -3.239975, 1, 1, 1, 1, 1,
-0.3483737, 0.4384456, -0.4235241, 1, 1, 1, 1, 1,
-0.3468257, -0.1042904, 0.0359583, 1, 1, 1, 1, 1,
-0.3466952, 1.922606, -0.3631826, 1, 1, 1, 1, 1,
-0.3455615, 0.7529899, -0.8641333, 1, 1, 1, 1, 1,
-0.3437571, 0.9041336, 0.5863644, 1, 1, 1, 1, 1,
-0.343377, 0.8225929, 0.0939662, 0, 0, 1, 1, 1,
-0.3381987, 0.9056954, -0.3250287, 1, 0, 0, 1, 1,
-0.3344258, -0.3648342, -2.990862, 1, 0, 0, 1, 1,
-0.3316041, 0.6212422, -1.913515, 1, 0, 0, 1, 1,
-0.3306638, -0.7868531, -0.9416637, 1, 0, 0, 1, 1,
-0.3284124, 0.03912599, -2.320507, 1, 0, 0, 1, 1,
-0.3269722, 0.4252631, -1.997061, 0, 0, 0, 1, 1,
-0.3259923, -0.4125676, -2.884383, 0, 0, 0, 1, 1,
-0.3248462, 0.07046159, -0.655579, 0, 0, 0, 1, 1,
-0.3246998, 0.5051448, -0.4206142, 0, 0, 0, 1, 1,
-0.3243319, 0.8842837, -0.9681914, 0, 0, 0, 1, 1,
-0.3217286, -1.53403, -3.835687, 0, 0, 0, 1, 1,
-0.3167575, -0.763364, -2.841221, 0, 0, 0, 1, 1,
-0.3147606, 0.09139707, -1.151357, 1, 1, 1, 1, 1,
-0.3129286, 1.24939, -0.2874199, 1, 1, 1, 1, 1,
-0.3115489, -0.1172302, -2.276706, 1, 1, 1, 1, 1,
-0.3109834, 1.684645, -0.3728678, 1, 1, 1, 1, 1,
-0.3109366, -0.5451197, -1.791603, 1, 1, 1, 1, 1,
-0.31018, -0.2431503, -1.591211, 1, 1, 1, 1, 1,
-0.3091741, 0.3767159, -0.6097881, 1, 1, 1, 1, 1,
-0.2928292, -0.1184111, -1.936117, 1, 1, 1, 1, 1,
-0.2899598, 0.5541935, -0.3117116, 1, 1, 1, 1, 1,
-0.2868095, -0.165143, -0.6744273, 1, 1, 1, 1, 1,
-0.2816851, -0.1980533, -2.766261, 1, 1, 1, 1, 1,
-0.2811692, 2.541809, -1.095416, 1, 1, 1, 1, 1,
-0.2779138, 1.444086, -1.016001, 1, 1, 1, 1, 1,
-0.2751701, 0.5006585, -0.3419616, 1, 1, 1, 1, 1,
-0.2751204, -0.365947, -1.759301, 1, 1, 1, 1, 1,
-0.2679211, 0.2429721, -1.397563, 0, 0, 1, 1, 1,
-0.2674266, -0.7544608, -3.052447, 1, 0, 0, 1, 1,
-0.2661168, 0.5234441, -1.165802, 1, 0, 0, 1, 1,
-0.2635969, 0.9687164, 0.5556422, 1, 0, 0, 1, 1,
-0.2626542, -0.222353, -2.732308, 1, 0, 0, 1, 1,
-0.2617091, -1.394872, -2.295758, 1, 0, 0, 1, 1,
-0.2608683, 1.072286, 0.4790632, 0, 0, 0, 1, 1,
-0.2582015, -1.240258, -2.791214, 0, 0, 0, 1, 1,
-0.255254, -0.0149546, 0.1473554, 0, 0, 0, 1, 1,
-0.2527378, 1.900237, -2.024387, 0, 0, 0, 1, 1,
-0.248007, 0.4915352, 0.5209504, 0, 0, 0, 1, 1,
-0.2473508, 0.4840253, -1.706738, 0, 0, 0, 1, 1,
-0.2470607, -0.4590996, -2.069504, 0, 0, 0, 1, 1,
-0.245616, -0.693646, -1.949758, 1, 1, 1, 1, 1,
-0.2403188, -0.7366971, -3.820629, 1, 1, 1, 1, 1,
-0.238195, 1.875625, -0.6197473, 1, 1, 1, 1, 1,
-0.2375366, -2.209636, -3.762127, 1, 1, 1, 1, 1,
-0.2335249, -2.065006, -3.183891, 1, 1, 1, 1, 1,
-0.2307335, -0.9223906, -2.646726, 1, 1, 1, 1, 1,
-0.2273901, 0.7349812, -0.09093002, 1, 1, 1, 1, 1,
-0.2237905, -0.4427068, -3.338089, 1, 1, 1, 1, 1,
-0.2229084, 1.461213, 0.5601652, 1, 1, 1, 1, 1,
-0.2205634, 1.456593, -0.4401835, 1, 1, 1, 1, 1,
-0.2201726, -0.2020058, -1.23237, 1, 1, 1, 1, 1,
-0.218757, 0.5673737, -0.9411198, 1, 1, 1, 1, 1,
-0.2186463, -0.6365575, -2.187515, 1, 1, 1, 1, 1,
-0.2173669, 0.608977, -1.63292, 1, 1, 1, 1, 1,
-0.213012, -2.193911, -3.166645, 1, 1, 1, 1, 1,
-0.2112443, -0.6316081, -1.699894, 0, 0, 1, 1, 1,
-0.2094213, -0.1959127, -3.807662, 1, 0, 0, 1, 1,
-0.208662, 0.3481639, -0.4172535, 1, 0, 0, 1, 1,
-0.201807, -0.5935531, -4.0851, 1, 0, 0, 1, 1,
-0.1994063, -1.391926, -3.603491, 1, 0, 0, 1, 1,
-0.1972181, -0.9051728, -2.250022, 1, 0, 0, 1, 1,
-0.1957355, 0.966001, 0.5710589, 0, 0, 0, 1, 1,
-0.1954365, 0.9646938, -0.404399, 0, 0, 0, 1, 1,
-0.1948784, 0.1154989, -0.4237274, 0, 0, 0, 1, 1,
-0.1940912, 0.8237552, -0.9086683, 0, 0, 0, 1, 1,
-0.1901398, 1.096768, 0.1030371, 0, 0, 0, 1, 1,
-0.1794876, 1.141072, 0.2522729, 0, 0, 0, 1, 1,
-0.1787727, -1.709294, -4.048979, 0, 0, 0, 1, 1,
-0.1772276, 1.422419, 1.615788, 1, 1, 1, 1, 1,
-0.1687695, 0.9953475, 1.461252, 1, 1, 1, 1, 1,
-0.1636351, -0.1758626, -1.349564, 1, 1, 1, 1, 1,
-0.1622611, 0.617016, -0.9701066, 1, 1, 1, 1, 1,
-0.1608803, -0.7320583, -2.303448, 1, 1, 1, 1, 1,
-0.1585726, 1.632947, -0.7541685, 1, 1, 1, 1, 1,
-0.1519035, -0.01150856, -3.687089, 1, 1, 1, 1, 1,
-0.1511375, 0.9341281, -0.952709, 1, 1, 1, 1, 1,
-0.1494436, 0.5435275, 0.1968798, 1, 1, 1, 1, 1,
-0.1493248, -0.03642853, -3.370661, 1, 1, 1, 1, 1,
-0.1488806, 0.124341, -1.832044, 1, 1, 1, 1, 1,
-0.1485666, 0.8534713, -0.8754884, 1, 1, 1, 1, 1,
-0.1480137, 0.2914278, 0.2039341, 1, 1, 1, 1, 1,
-0.1474254, -0.1372828, -2.810707, 1, 1, 1, 1, 1,
-0.1452022, -0.4048139, -4.839189, 1, 1, 1, 1, 1,
-0.1414573, 1.697375, 0.7873455, 0, 0, 1, 1, 1,
-0.1412712, 1.207575, 0.8424467, 1, 0, 0, 1, 1,
-0.1403606, 0.5680498, -1.093019, 1, 0, 0, 1, 1,
-0.139393, 0.1563544, -2.188768, 1, 0, 0, 1, 1,
-0.1390598, -0.3630272, -3.188468, 1, 0, 0, 1, 1,
-0.1364506, 0.09452023, -1.093065, 1, 0, 0, 1, 1,
-0.1308148, -0.2480845, -3.716293, 0, 0, 0, 1, 1,
-0.1281096, -0.1064768, -2.233807, 0, 0, 0, 1, 1,
-0.1246531, -0.1941562, -2.997032, 0, 0, 0, 1, 1,
-0.1243032, -0.9213012, -3.560935, 0, 0, 0, 1, 1,
-0.1229886, -0.6367596, -3.519026, 0, 0, 0, 1, 1,
-0.1227786, -0.2000926, -1.970524, 0, 0, 0, 1, 1,
-0.1200533, 0.2101735, 0.6247082, 0, 0, 0, 1, 1,
-0.1198994, -0.7062632, -3.159027, 1, 1, 1, 1, 1,
-0.1184495, 0.143133, -2.186646, 1, 1, 1, 1, 1,
-0.1179445, 0.4357928, -0.5196484, 1, 1, 1, 1, 1,
-0.1147078, -1.290576, -4.356195, 1, 1, 1, 1, 1,
-0.1142029, 0.6934032, -1.132344, 1, 1, 1, 1, 1,
-0.108353, -0.1028305, -2.541635, 1, 1, 1, 1, 1,
-0.1062999, -2.088883, -1.876782, 1, 1, 1, 1, 1,
-0.1031283, 1.330208, -0.07525345, 1, 1, 1, 1, 1,
-0.1023761, -0.4747351, -4.496247, 1, 1, 1, 1, 1,
-0.1003623, 0.6922268, -0.3134717, 1, 1, 1, 1, 1,
-0.09745976, -0.5048979, -3.38395, 1, 1, 1, 1, 1,
-0.09628693, 1.586016, -0.2012499, 1, 1, 1, 1, 1,
-0.09509008, -2.095038, -3.341673, 1, 1, 1, 1, 1,
-0.09377396, -0.932501, -3.607707, 1, 1, 1, 1, 1,
-0.09208649, 0.4222555, 0.3915503, 1, 1, 1, 1, 1,
-0.0869882, -0.6332747, -2.783393, 0, 0, 1, 1, 1,
-0.08538463, -0.620371, -3.014798, 1, 0, 0, 1, 1,
-0.08252496, 0.6597695, 0.9073874, 1, 0, 0, 1, 1,
-0.08114111, -1.337502, -1.89197, 1, 0, 0, 1, 1,
-0.07659665, 0.8354392, 1.586984, 1, 0, 0, 1, 1,
-0.0745346, 1.159653, 0.8674928, 1, 0, 0, 1, 1,
-0.07405696, -0.3269222, -4.01404, 0, 0, 0, 1, 1,
-0.07276266, -0.2106067, -3.119245, 0, 0, 0, 1, 1,
-0.07203725, 2.230947, 0.8928201, 0, 0, 0, 1, 1,
-0.07023589, -0.7411389, -2.993711, 0, 0, 0, 1, 1,
-0.06719628, 0.7203156, 0.8675877, 0, 0, 0, 1, 1,
-0.06417567, -0.2138368, -2.705013, 0, 0, 0, 1, 1,
-0.06236674, 1.683796, 1.304626, 0, 0, 0, 1, 1,
-0.0598343, 1.787438, -0.3757657, 1, 1, 1, 1, 1,
-0.05979775, -0.7753862, -3.614883, 1, 1, 1, 1, 1,
-0.05261346, -0.7937088, -3.42167, 1, 1, 1, 1, 1,
-0.0505795, -0.1322589, -2.904624, 1, 1, 1, 1, 1,
-0.04891146, -0.8164988, -1.044348, 1, 1, 1, 1, 1,
-0.04609402, 0.3565958, -1.038409, 1, 1, 1, 1, 1,
-0.0440259, -2.00632, -2.413624, 1, 1, 1, 1, 1,
-0.04374641, 0.9376264, 0.5391083, 1, 1, 1, 1, 1,
-0.0408833, 0.420996, -0.8849696, 1, 1, 1, 1, 1,
-0.03722222, 0.4254126, -0.9462005, 1, 1, 1, 1, 1,
-0.03666306, 0.4921332, -0.3774219, 1, 1, 1, 1, 1,
-0.0340278, 0.08808075, -1.162813, 1, 1, 1, 1, 1,
-0.02877978, -0.81849, -1.80608, 1, 1, 1, 1, 1,
-0.02806129, 0.3138206, 0.00405675, 1, 1, 1, 1, 1,
-0.02714435, 0.5592542, -0.7699111, 1, 1, 1, 1, 1,
-0.02599682, 1.47513, 0.008626904, 0, 0, 1, 1, 1,
-0.02287768, -0.4763074, -3.206491, 1, 0, 0, 1, 1,
-0.02180126, -0.1372992, -4.094168, 1, 0, 0, 1, 1,
-0.01602932, -0.9225802, -4.383575, 1, 0, 0, 1, 1,
-0.01124863, -0.328611, -3.241304, 1, 0, 0, 1, 1,
-0.01028189, 0.2631742, -1.103735, 1, 0, 0, 1, 1,
-0.008207472, -0.3458288, -2.140718, 0, 0, 0, 1, 1,
-0.006995019, 0.7512865, 0.9927096, 0, 0, 0, 1, 1,
-0.004845511, -0.8989445, -3.715255, 0, 0, 0, 1, 1,
-0.003518172, -1.446896, -2.509894, 0, 0, 0, 1, 1,
-0.000430954, 1.061216, 0.9176229, 0, 0, 0, 1, 1,
0.00337609, -0.1118749, 3.803898, 0, 0, 0, 1, 1,
0.005999551, -0.003103964, 2.789881, 0, 0, 0, 1, 1,
0.01011418, 0.3506511, -0.3599792, 1, 1, 1, 1, 1,
0.01013589, 1.019947, 0.3931287, 1, 1, 1, 1, 1,
0.01318096, 2.248512, 0.02823087, 1, 1, 1, 1, 1,
0.01483995, 1.098121, -0.15556, 1, 1, 1, 1, 1,
0.01532786, -0.3895118, 3.626023, 1, 1, 1, 1, 1,
0.01661554, -1.00803, 3.017167, 1, 1, 1, 1, 1,
0.01730415, -0.4925918, 3.521309, 1, 1, 1, 1, 1,
0.01750577, 0.4344025, 1.168978, 1, 1, 1, 1, 1,
0.02239627, -1.729128, 3.60254, 1, 1, 1, 1, 1,
0.02414984, 1.311198, -0.7260531, 1, 1, 1, 1, 1,
0.02451188, -0.3329225, 2.269586, 1, 1, 1, 1, 1,
0.02648613, -0.487401, 2.524552, 1, 1, 1, 1, 1,
0.02680883, 0.5887876, -0.5582162, 1, 1, 1, 1, 1,
0.0290544, 1.656963, -0.8861661, 1, 1, 1, 1, 1,
0.0304629, -1.595258, 3.792949, 1, 1, 1, 1, 1,
0.0305427, 0.06418391, 1.291091, 0, 0, 1, 1, 1,
0.03158776, -0.6657728, 3.475554, 1, 0, 0, 1, 1,
0.03385662, 0.7714931, 1.127131, 1, 0, 0, 1, 1,
0.03409991, -0.742035, 4.187631, 1, 0, 0, 1, 1,
0.03760717, -0.2286102, 1.78112, 1, 0, 0, 1, 1,
0.03806969, -1.955595, 3.39567, 1, 0, 0, 1, 1,
0.03808019, 0.5593863, -0.8102167, 0, 0, 0, 1, 1,
0.04289353, 0.8187864, -2.233248, 0, 0, 0, 1, 1,
0.04291479, 0.02342379, 1.65571, 0, 0, 0, 1, 1,
0.04731811, -2.475548, 3.12007, 0, 0, 0, 1, 1,
0.04908174, -0.4725259, 3.440012, 0, 0, 0, 1, 1,
0.05025251, 1.19701, 1.474247, 0, 0, 0, 1, 1,
0.0503308, -0.2995858, 2.512143, 0, 0, 0, 1, 1,
0.05689155, 0.9596367, -1.899175, 1, 1, 1, 1, 1,
0.05777016, 0.7525158, -0.2004765, 1, 1, 1, 1, 1,
0.05847365, -0.5472584, 4.243025, 1, 1, 1, 1, 1,
0.05849981, -1.041553, 4.903531, 1, 1, 1, 1, 1,
0.05976881, 0.2811653, -0.03932171, 1, 1, 1, 1, 1,
0.0626544, 0.6794809, 0.6539395, 1, 1, 1, 1, 1,
0.06383738, -1.499588, 2.864699, 1, 1, 1, 1, 1,
0.06492706, 0.008181754, 1.108286, 1, 1, 1, 1, 1,
0.06612814, -0.4061685, 2.644023, 1, 1, 1, 1, 1,
0.06767506, 1.253428, 0.3981858, 1, 1, 1, 1, 1,
0.07000659, 0.4805245, 1.316905, 1, 1, 1, 1, 1,
0.07309511, 0.7671588, -1.057334, 1, 1, 1, 1, 1,
0.07594577, 2.17242, -1.331001, 1, 1, 1, 1, 1,
0.07982481, 1.037936, -1.092141, 1, 1, 1, 1, 1,
0.08120285, -1.220498, 4.434588, 1, 1, 1, 1, 1,
0.08216885, 1.12544, 0.60892, 0, 0, 1, 1, 1,
0.08439138, 0.51753, -0.1906946, 1, 0, 0, 1, 1,
0.08652738, -1.2688, 5.697932, 1, 0, 0, 1, 1,
0.08746139, 0.9143164, 0.3933901, 1, 0, 0, 1, 1,
0.09013457, -1.650443, 2.635532, 1, 0, 0, 1, 1,
0.09038285, -0.1235178, 1.745754, 1, 0, 0, 1, 1,
0.09221502, -1.432437, 2.136871, 0, 0, 0, 1, 1,
0.09282242, -0.8387139, 0.6779842, 0, 0, 0, 1, 1,
0.09437177, 0.152079, 2.083353, 0, 0, 0, 1, 1,
0.09882449, 0.3972529, 0.6189421, 0, 0, 0, 1, 1,
0.1054087, -0.2914568, 2.027872, 0, 0, 0, 1, 1,
0.1066555, -0.01896912, 0.344324, 0, 0, 0, 1, 1,
0.1122934, -1.120149, 2.616687, 0, 0, 0, 1, 1,
0.127868, 1.723419, 0.1892067, 1, 1, 1, 1, 1,
0.1279716, -0.1335552, 1.778267, 1, 1, 1, 1, 1,
0.1303671, 0.81346, -0.8921093, 1, 1, 1, 1, 1,
0.1309092, -1.033237, 3.981716, 1, 1, 1, 1, 1,
0.1339786, 0.343183, -0.6013536, 1, 1, 1, 1, 1,
0.1373524, -0.6192372, 2.598449, 1, 1, 1, 1, 1,
0.1421772, 0.2157206, -0.8446423, 1, 1, 1, 1, 1,
0.1515582, -0.1577372, 0.9065332, 1, 1, 1, 1, 1,
0.1537582, -0.8362986, 3.871019, 1, 1, 1, 1, 1,
0.1559833, -0.5015471, 4.07071, 1, 1, 1, 1, 1,
0.1562749, 0.3353889, -0.3988636, 1, 1, 1, 1, 1,
0.1596805, 0.3472842, 0.687332, 1, 1, 1, 1, 1,
0.1608297, -0.9819412, 2.758694, 1, 1, 1, 1, 1,
0.165374, 0.4291205, 1.059352, 1, 1, 1, 1, 1,
0.1685626, -0.830753, 2.919293, 1, 1, 1, 1, 1,
0.1731873, -1.537292, 2.00491, 0, 0, 1, 1, 1,
0.174693, 0.5941298, 0.2203842, 1, 0, 0, 1, 1,
0.1778106, 0.2515963, 2.409259, 1, 0, 0, 1, 1,
0.1778798, -0.1209891, 3.795992, 1, 0, 0, 1, 1,
0.1782157, 0.9054992, 2.881162, 1, 0, 0, 1, 1,
0.1794808, 0.3981388, 1.25724, 1, 0, 0, 1, 1,
0.1804162, 0.6430946, 1.691058, 0, 0, 0, 1, 1,
0.1839013, 0.06054805, 0.6795272, 0, 0, 0, 1, 1,
0.1842272, -1.150446, 1.78546, 0, 0, 0, 1, 1,
0.1851602, -1.013982, 3.671681, 0, 0, 0, 1, 1,
0.1904322, 1.61005, 0.6289205, 0, 0, 0, 1, 1,
0.1952373, -0.008558098, -1.216941, 0, 0, 0, 1, 1,
0.2000001, -0.08108003, 3.081173, 0, 0, 0, 1, 1,
0.2001814, -0.6124032, 1.764453, 1, 1, 1, 1, 1,
0.2040057, -0.7480258, 3.547944, 1, 1, 1, 1, 1,
0.204077, 0.7704139, 1.209835, 1, 1, 1, 1, 1,
0.2045918, 0.4468264, 0.09542934, 1, 1, 1, 1, 1,
0.2090791, 0.829599, 1.918017, 1, 1, 1, 1, 1,
0.211558, -0.1136872, -0.00411618, 1, 1, 1, 1, 1,
0.2118869, -0.1554735, 3.76216, 1, 1, 1, 1, 1,
0.2154421, 1.144332, -0.7593759, 1, 1, 1, 1, 1,
0.2177833, -0.3977401, 3.184858, 1, 1, 1, 1, 1,
0.2266876, 0.3298496, 0.3937645, 1, 1, 1, 1, 1,
0.2309159, 1.690935, 0.8429782, 1, 1, 1, 1, 1,
0.231603, 0.08597273, -1.30713, 1, 1, 1, 1, 1,
0.231612, -0.7359509, 4.055852, 1, 1, 1, 1, 1,
0.2328347, 1.557247, 0.1414558, 1, 1, 1, 1, 1,
0.2382562, -0.6780221, 3.259773, 1, 1, 1, 1, 1,
0.2385722, -0.4738012, 0.4868541, 0, 0, 1, 1, 1,
0.2394152, -0.1379284, 1.357784, 1, 0, 0, 1, 1,
0.2414093, -1.2571, 1.715333, 1, 0, 0, 1, 1,
0.2441827, -0.2022011, 4.530736, 1, 0, 0, 1, 1,
0.2482427, -0.3486736, 1.753547, 1, 0, 0, 1, 1,
0.2486932, 0.5216395, 0.8351477, 1, 0, 0, 1, 1,
0.2502188, -0.6783444, 1.851979, 0, 0, 0, 1, 1,
0.2532825, 0.8143443, -0.4346735, 0, 0, 0, 1, 1,
0.2596505, -0.6457378, 1.846591, 0, 0, 0, 1, 1,
0.2597772, 0.5415416, -0.002926387, 0, 0, 0, 1, 1,
0.262278, 0.08695006, 2.440366, 0, 0, 0, 1, 1,
0.2631441, 1.687779, 1.209656, 0, 0, 0, 1, 1,
0.267591, 0.3078734, 1.562238, 0, 0, 0, 1, 1,
0.2682721, 0.3165588, -0.4558269, 1, 1, 1, 1, 1,
0.2693577, 2.29628, -1.16294, 1, 1, 1, 1, 1,
0.2702022, 0.4990057, 0.1441953, 1, 1, 1, 1, 1,
0.2712181, -0.4660107, 1.04909, 1, 1, 1, 1, 1,
0.275233, 0.1308766, 1.115358, 1, 1, 1, 1, 1,
0.2758287, 1.446216, 0.4579381, 1, 1, 1, 1, 1,
0.2805934, 1.894388, 0.8180961, 1, 1, 1, 1, 1,
0.2822228, 1.231063, 1.426518, 1, 1, 1, 1, 1,
0.2827344, 0.181583, 0.09337744, 1, 1, 1, 1, 1,
0.2834398, 1.902811, -0.2110196, 1, 1, 1, 1, 1,
0.2876213, 0.9772065, 0.4141558, 1, 1, 1, 1, 1,
0.2915021, -0.9031008, 0.9020962, 1, 1, 1, 1, 1,
0.2985186, 1.142379, 1.423861, 1, 1, 1, 1, 1,
0.3023231, 1.007297, -0.5512094, 1, 1, 1, 1, 1,
0.3043753, -2.504662, 4.520074, 1, 1, 1, 1, 1,
0.3054691, -0.4664048, 1.941062, 0, 0, 1, 1, 1,
0.3110977, -1.373985, 2.550581, 1, 0, 0, 1, 1,
0.3122374, 1.105596, 2.127613, 1, 0, 0, 1, 1,
0.3429937, -1.721373, 3.968228, 1, 0, 0, 1, 1,
0.3437427, 0.1033708, 0.3657213, 1, 0, 0, 1, 1,
0.3468787, 1.683287, 0.01484864, 1, 0, 0, 1, 1,
0.3515549, -0.4989342, 3.138566, 0, 0, 0, 1, 1,
0.3545414, -1.465389, 1.842458, 0, 0, 0, 1, 1,
0.3571346, -1.013058, 2.599764, 0, 0, 0, 1, 1,
0.3599195, 0.05053125, 1.323292, 0, 0, 0, 1, 1,
0.3601485, -0.01262677, 2.366445, 0, 0, 0, 1, 1,
0.3608304, -1.383936, 3.958942, 0, 0, 0, 1, 1,
0.3627155, -0.4262775, 2.460226, 0, 0, 0, 1, 1,
0.3643346, 0.3040691, 3.297713, 1, 1, 1, 1, 1,
0.3689365, 0.6837596, 0.02280256, 1, 1, 1, 1, 1,
0.369398, 1.089681, 0.4257134, 1, 1, 1, 1, 1,
0.3735152, -1.29767, 3.867022, 1, 1, 1, 1, 1,
0.3755272, -0.8005375, 1.833241, 1, 1, 1, 1, 1,
0.3771197, -0.4753835, 1.564976, 1, 1, 1, 1, 1,
0.3791104, -2.926331, 2.379484, 1, 1, 1, 1, 1,
0.3805787, -0.2767989, 1.797958, 1, 1, 1, 1, 1,
0.3818917, -0.2937588, 1.93931, 1, 1, 1, 1, 1,
0.3850572, 0.8416608, 0.1155254, 1, 1, 1, 1, 1,
0.3856806, -1.404525, 3.037364, 1, 1, 1, 1, 1,
0.3887911, -0.8651072, 1.29797, 1, 1, 1, 1, 1,
0.3921718, -2.259585, 3.064062, 1, 1, 1, 1, 1,
0.3946131, -0.5350327, 2.831718, 1, 1, 1, 1, 1,
0.3977483, -1.161311, 3.013523, 1, 1, 1, 1, 1,
0.3990456, -0.1271808, 2.751512, 0, 0, 1, 1, 1,
0.3991128, 1.58579, 0.08262942, 1, 0, 0, 1, 1,
0.4024189, 1.196238, -1.828988, 1, 0, 0, 1, 1,
0.4045222, 0.5760201, -0.581008, 1, 0, 0, 1, 1,
0.4054319, -1.502571, 1.894742, 1, 0, 0, 1, 1,
0.4063134, 0.8426132, 0.1453082, 1, 0, 0, 1, 1,
0.4064357, 0.7732234, 0.9383377, 0, 0, 0, 1, 1,
0.4078929, 0.4923041, 3.481796, 0, 0, 0, 1, 1,
0.408884, 0.08922766, 1.545237, 0, 0, 0, 1, 1,
0.4107274, -1.641561, 2.512513, 0, 0, 0, 1, 1,
0.4165396, 0.01318732, 2.755047, 0, 0, 0, 1, 1,
0.4182016, -0.314165, 1.141312, 0, 0, 0, 1, 1,
0.4199739, 0.812291, -0.5318423, 0, 0, 0, 1, 1,
0.4238566, -1.216523, 3.903306, 1, 1, 1, 1, 1,
0.423929, 0.5007298, 1.602667, 1, 1, 1, 1, 1,
0.4243643, -0.3331554, 3.14477, 1, 1, 1, 1, 1,
0.4265158, 1.498616, -1.096301, 1, 1, 1, 1, 1,
0.4269671, -0.2924178, 0.583963, 1, 1, 1, 1, 1,
0.4274666, 0.6983529, 0.9807357, 1, 1, 1, 1, 1,
0.4312752, -0.1199549, 1.286906, 1, 1, 1, 1, 1,
0.4313172, -0.5322528, 2.258804, 1, 1, 1, 1, 1,
0.4326226, -0.1625636, 1.625691, 1, 1, 1, 1, 1,
0.4361059, 0.02192334, 2.467006, 1, 1, 1, 1, 1,
0.4361155, -0.9404433, 5.7386, 1, 1, 1, 1, 1,
0.4361508, -0.05195299, 3.245092, 1, 1, 1, 1, 1,
0.4374135, 0.2229637, 0.7959979, 1, 1, 1, 1, 1,
0.4391787, 0.5284203, 1.734465, 1, 1, 1, 1, 1,
0.4434893, 0.05543113, 2.346791, 1, 1, 1, 1, 1,
0.4484354, 0.3942227, 0.893773, 0, 0, 1, 1, 1,
0.4506788, 0.073915, 2.104203, 1, 0, 0, 1, 1,
0.4514642, 1.932006, -0.5997246, 1, 0, 0, 1, 1,
0.4548108, -1.292211, 1.186965, 1, 0, 0, 1, 1,
0.4584928, 1.015292, 0.1249051, 1, 0, 0, 1, 1,
0.460105, -0.05326694, 3.584297, 1, 0, 0, 1, 1,
0.4610195, -0.8194197, 3.603469, 0, 0, 0, 1, 1,
0.4625109, -0.8784856, 3.93224, 0, 0, 0, 1, 1,
0.4685235, 1.159868, 0.7689356, 0, 0, 0, 1, 1,
0.4738168, -0.2658443, 1.142173, 0, 0, 0, 1, 1,
0.4768126, 0.07933641, 2.887801, 0, 0, 0, 1, 1,
0.4772046, -0.8814677, 2.772583, 0, 0, 0, 1, 1,
0.4787236, 0.3343915, -1.148625, 0, 0, 0, 1, 1,
0.4808699, -0.1225144, 2.811844, 1, 1, 1, 1, 1,
0.4866086, 0.8727263, 0.624948, 1, 1, 1, 1, 1,
0.4866662, -1.207826, 1.321471, 1, 1, 1, 1, 1,
0.4875363, -1.644819, 2.774723, 1, 1, 1, 1, 1,
0.4931163, -0.1497378, 3.332701, 1, 1, 1, 1, 1,
0.5024746, -0.3405392, 2.402834, 1, 1, 1, 1, 1,
0.5030824, 1.188475, 1.597948, 1, 1, 1, 1, 1,
0.5125785, 0.1049212, 1.912231, 1, 1, 1, 1, 1,
0.5178173, 0.216784, 2.021065, 1, 1, 1, 1, 1,
0.5187265, -1.391416, 2.302481, 1, 1, 1, 1, 1,
0.5207346, 1.825461, 0.3994372, 1, 1, 1, 1, 1,
0.5239228, 1.426015, 0.777116, 1, 1, 1, 1, 1,
0.5244269, -0.187492, 2.353202, 1, 1, 1, 1, 1,
0.5272687, -1.085407, 1.780412, 1, 1, 1, 1, 1,
0.5322102, 0.5559256, 1.580339, 1, 1, 1, 1, 1,
0.5323585, -0.4802751, 3.723368, 0, 0, 1, 1, 1,
0.5349101, 0.9519964, -0.3826173, 1, 0, 0, 1, 1,
0.5349845, -0.2862728, 2.076006, 1, 0, 0, 1, 1,
0.5353324, -0.5524234, 3.019476, 1, 0, 0, 1, 1,
0.5385741, -0.6929055, 3.651237, 1, 0, 0, 1, 1,
0.5440196, 0.3480369, 1.273387, 1, 0, 0, 1, 1,
0.5488585, 0.9716021, -1.793716, 0, 0, 0, 1, 1,
0.5507063, 0.3257493, -0.5224277, 0, 0, 0, 1, 1,
0.55248, -0.3292755, 1.817684, 0, 0, 0, 1, 1,
0.5541363, -0.6230009, 1.983362, 0, 0, 0, 1, 1,
0.5615835, -0.5791432, 1.189036, 0, 0, 0, 1, 1,
0.5640835, -1.179033, 2.273204, 0, 0, 0, 1, 1,
0.5642971, -0.7666925, 1.892008, 0, 0, 0, 1, 1,
0.5658309, -0.480581, 2.73379, 1, 1, 1, 1, 1,
0.5681884, -0.320239, 4.033972, 1, 1, 1, 1, 1,
0.5699741, -0.008106185, 1.147423, 1, 1, 1, 1, 1,
0.5733904, -0.2405704, 2.337471, 1, 1, 1, 1, 1,
0.5735225, 1.115167, 0.1313594, 1, 1, 1, 1, 1,
0.5797517, 0.4843839, 0.7566032, 1, 1, 1, 1, 1,
0.5808928, 1.545172, -0.1830379, 1, 1, 1, 1, 1,
0.586947, -2.264489, 2.865057, 1, 1, 1, 1, 1,
0.5939796, 0.005236901, 0.869875, 1, 1, 1, 1, 1,
0.5985447, -1.515657, 1.951616, 1, 1, 1, 1, 1,
0.5986639, -0.1147826, 0.9526728, 1, 1, 1, 1, 1,
0.5995696, -0.08482769, -0.5383918, 1, 1, 1, 1, 1,
0.604895, 0.004387251, -0.009749171, 1, 1, 1, 1, 1,
0.6097074, 0.9325449, 0.4253146, 1, 1, 1, 1, 1,
0.6098076, 0.7014022, 1.010162, 1, 1, 1, 1, 1,
0.6161937, 1.289938, -1.621449, 0, 0, 1, 1, 1,
0.6162512, -1.104762, 2.724764, 1, 0, 0, 1, 1,
0.6196808, 0.09823563, 1.882331, 1, 0, 0, 1, 1,
0.6234792, -0.2475961, 3.31689, 1, 0, 0, 1, 1,
0.6270668, -0.936397, 2.19185, 1, 0, 0, 1, 1,
0.6279591, -0.6426681, 1.022234, 1, 0, 0, 1, 1,
0.6323425, -0.8962041, 1.656744, 0, 0, 0, 1, 1,
0.634688, 0.9905939, 1.579287, 0, 0, 0, 1, 1,
0.6355587, 1.354859, -0.4887253, 0, 0, 0, 1, 1,
0.6365451, -1.129703, 2.187794, 0, 0, 0, 1, 1,
0.6372925, -0.1520535, 0.6168922, 0, 0, 0, 1, 1,
0.6429951, 0.9975525, 1.484859, 0, 0, 0, 1, 1,
0.6500533, -0.238664, 1.342498, 0, 0, 0, 1, 1,
0.6540942, -0.1640363, 0.7441656, 1, 1, 1, 1, 1,
0.6599991, -0.5284223, 2.99158, 1, 1, 1, 1, 1,
0.6614925, 0.1970557, 0.2238538, 1, 1, 1, 1, 1,
0.6715635, -0.3682336, 3.404247, 1, 1, 1, 1, 1,
0.6858172, 0.2147814, 0.648765, 1, 1, 1, 1, 1,
0.6888825, 0.2949084, -0.3797477, 1, 1, 1, 1, 1,
0.6889808, -1.170457, 1.514992, 1, 1, 1, 1, 1,
0.6899198, 0.1530266, 1.148928, 1, 1, 1, 1, 1,
0.6910211, -1.327545, 0.5628974, 1, 1, 1, 1, 1,
0.6952821, -0.923988, 3.066925, 1, 1, 1, 1, 1,
0.7041131, 0.9888879, 0.8839622, 1, 1, 1, 1, 1,
0.7137153, -0.9149293, 3.110657, 1, 1, 1, 1, 1,
0.7206425, 1.175017, -1.239521, 1, 1, 1, 1, 1,
0.7246996, 0.4227532, 0.9580699, 1, 1, 1, 1, 1,
0.7249503, -0.8445865, 2.649366, 1, 1, 1, 1, 1,
0.7305979, 0.1608471, 0.5960692, 0, 0, 1, 1, 1,
0.7438498, -1.712124, 3.288332, 1, 0, 0, 1, 1,
0.7531431, -0.2650645, 2.611253, 1, 0, 0, 1, 1,
0.7551203, 1.292491, -0.1275577, 1, 0, 0, 1, 1,
0.7585276, -2.1064, 4.380253, 1, 0, 0, 1, 1,
0.7590386, 0.2299101, 1.309939, 1, 0, 0, 1, 1,
0.7706407, 1.342064, 0.1377479, 0, 0, 0, 1, 1,
0.7706547, -1.69699, 2.570386, 0, 0, 0, 1, 1,
0.7738621, 0.6301085, 0.08922849, 0, 0, 0, 1, 1,
0.7751153, 0.6220697, 2.09921, 0, 0, 0, 1, 1,
0.7775558, 1.759626, 0.8696985, 0, 0, 0, 1, 1,
0.7781125, -0.2657915, 0.4607124, 0, 0, 0, 1, 1,
0.7797726, -1.224599, 2.666933, 0, 0, 0, 1, 1,
0.7821708, -0.3514723, 1.795525, 1, 1, 1, 1, 1,
0.7833112, 1.333409, 1.035718, 1, 1, 1, 1, 1,
0.7874354, 0.1524958, 0.9305103, 1, 1, 1, 1, 1,
0.7914577, 0.358334, 2.291014, 1, 1, 1, 1, 1,
0.7980598, -0.7697895, 3.000688, 1, 1, 1, 1, 1,
0.8020409, 1.313612, 1.082519, 1, 1, 1, 1, 1,
0.8038848, 0.7821, 1.408597, 1, 1, 1, 1, 1,
0.805332, 1.344633, 0.3572866, 1, 1, 1, 1, 1,
0.8092313, -0.05202085, 2.040229, 1, 1, 1, 1, 1,
0.8126748, 1.227046, 1.33769, 1, 1, 1, 1, 1,
0.8297204, 0.5805494, 0.6121913, 1, 1, 1, 1, 1,
0.8298439, -0.590467, 4.030435, 1, 1, 1, 1, 1,
0.8299495, -0.2620047, 1.672799, 1, 1, 1, 1, 1,
0.8329874, -0.1993678, 2.194912, 1, 1, 1, 1, 1,
0.8398557, 0.339097, 0.3414579, 1, 1, 1, 1, 1,
0.8412679, -1.251353, 1.966694, 0, 0, 1, 1, 1,
0.844583, -0.7551252, 2.068452, 1, 0, 0, 1, 1,
0.8473181, -0.1752593, 1.713366, 1, 0, 0, 1, 1,
0.8518854, -0.3635432, 2.238872, 1, 0, 0, 1, 1,
0.8635882, 0.893006, 1.306901, 1, 0, 0, 1, 1,
0.8691712, -1.099034, 2.216638, 1, 0, 0, 1, 1,
0.8795, 0.3133941, 0.9235975, 0, 0, 0, 1, 1,
0.8895907, 0.7836939, 0.6909438, 0, 0, 0, 1, 1,
0.8966778, 1.050051, -0.3449879, 0, 0, 0, 1, 1,
0.8985081, 1.083061, -0.5166292, 0, 0, 0, 1, 1,
0.9016099, 1.069511, -0.00141805, 0, 0, 0, 1, 1,
0.9037278, 0.9021778, 0.3217958, 0, 0, 0, 1, 1,
0.9038004, -1.318393, 4.135979, 0, 0, 0, 1, 1,
0.9072714, 0.1220274, 0.2817861, 1, 1, 1, 1, 1,
0.9094728, 0.09731966, 3.626219, 1, 1, 1, 1, 1,
0.9109493, 0.8684176, -0.2425119, 1, 1, 1, 1, 1,
0.9119304, -0.09972396, 0.8804815, 1, 1, 1, 1, 1,
0.9205787, -1.67893, 2.541839, 1, 1, 1, 1, 1,
0.9212338, 1.116136, 0.6241803, 1, 1, 1, 1, 1,
0.9319953, -0.07777656, 3.413947, 1, 1, 1, 1, 1,
0.9380253, -0.3952856, 1.37403, 1, 1, 1, 1, 1,
0.9392741, 0.1402946, 1.965195, 1, 1, 1, 1, 1,
0.9393348, 1.12192, -0.4476967, 1, 1, 1, 1, 1,
0.9405966, -0.2026045, 1.767823, 1, 1, 1, 1, 1,
0.9412118, -0.03012007, -0.06375324, 1, 1, 1, 1, 1,
0.9442614, 0.06855094, 1.9798, 1, 1, 1, 1, 1,
0.9499908, -0.8643054, 2.241288, 1, 1, 1, 1, 1,
0.9528205, -1.134709, 2.067917, 1, 1, 1, 1, 1,
0.9566818, -1.424627, 2.588009, 0, 0, 1, 1, 1,
0.9593366, -1.193435, 2.499511, 1, 0, 0, 1, 1,
0.9683383, 0.8194659, 0.2212178, 1, 0, 0, 1, 1,
0.9683647, 0.05547872, 0.749819, 1, 0, 0, 1, 1,
0.9701062, -0.6065406, 3.328035, 1, 0, 0, 1, 1,
0.9702413, 0.3286536, 2.569953, 1, 0, 0, 1, 1,
0.9704993, 1.195746, 1.831132, 0, 0, 0, 1, 1,
0.9716519, 0.9801329, 1.543709, 0, 0, 0, 1, 1,
0.9800176, 0.9351511, -1.135658, 0, 0, 0, 1, 1,
0.9800342, -0.1690882, 3.100849, 0, 0, 0, 1, 1,
0.9814025, 1.210699, -0.2050378, 0, 0, 0, 1, 1,
0.9903454, -0.7626801, 2.086992, 0, 0, 0, 1, 1,
0.9981993, 0.08675069, 1.802865, 0, 0, 0, 1, 1,
0.998935, -1.141799, 1.103927, 1, 1, 1, 1, 1,
1.005676, 0.5831254, -0.08474322, 1, 1, 1, 1, 1,
1.012425, 1.340384, 1.830612, 1, 1, 1, 1, 1,
1.025432, 1.543392, 1.525048, 1, 1, 1, 1, 1,
1.032579, -0.894433, 2.594624, 1, 1, 1, 1, 1,
1.04319, -1.373271, 2.302174, 1, 1, 1, 1, 1,
1.044179, -0.9925163, 1.889043, 1, 1, 1, 1, 1,
1.044977, -0.839157, 0.347365, 1, 1, 1, 1, 1,
1.049756, -0.539159, 1.569263, 1, 1, 1, 1, 1,
1.073302, -0.5609698, 0.1794618, 1, 1, 1, 1, 1,
1.075449, -0.9962409, 2.939176, 1, 1, 1, 1, 1,
1.075849, -0.2006645, 2.044818, 1, 1, 1, 1, 1,
1.081457, -1.024769, 1.512545, 1, 1, 1, 1, 1,
1.0826, -0.6436889, 1.225639, 1, 1, 1, 1, 1,
1.083564, -0.2227777, 1.164512, 1, 1, 1, 1, 1,
1.087111, 1.006774, 0.3818563, 0, 0, 1, 1, 1,
1.087608, -1.155358, 1.234804, 1, 0, 0, 1, 1,
1.097458, 0.2756955, 0.1860422, 1, 0, 0, 1, 1,
1.100711, -0.3550726, 1.778416, 1, 0, 0, 1, 1,
1.101244, 1.188409, 0.3195224, 1, 0, 0, 1, 1,
1.112882, -0.2103415, 2.63817, 1, 0, 0, 1, 1,
1.114504, 0.544897, 0.1171482, 0, 0, 0, 1, 1,
1.118757, 0.219605, 0.7227939, 0, 0, 0, 1, 1,
1.12613, -1.228474, 3.046769, 0, 0, 0, 1, 1,
1.140368, 0.3486129, 2.622642, 0, 0, 0, 1, 1,
1.141012, -1.700451, 1.18913, 0, 0, 0, 1, 1,
1.153391, -0.8088121, 1.987401, 0, 0, 0, 1, 1,
1.15539, 1.888365, -0.5608162, 0, 0, 0, 1, 1,
1.15556, 0.3604005, 1.25863, 1, 1, 1, 1, 1,
1.163878, 1.059448, 2.615458, 1, 1, 1, 1, 1,
1.172101, -0.6985997, 1.040462, 1, 1, 1, 1, 1,
1.173326, -0.3010353, 2.423844, 1, 1, 1, 1, 1,
1.175551, 0.3774108, -0.08522028, 1, 1, 1, 1, 1,
1.184811, -0.5405099, 1.548243, 1, 1, 1, 1, 1,
1.192119, -1.148573, 1.548532, 1, 1, 1, 1, 1,
1.193092, 0.8742831, 2.003659, 1, 1, 1, 1, 1,
1.193848, 0.7352176, 0.5817823, 1, 1, 1, 1, 1,
1.206086, 0.6351058, -0.9486569, 1, 1, 1, 1, 1,
1.211133, 0.9866779, -0.1295757, 1, 1, 1, 1, 1,
1.213598, -0.1017455, 2.338706, 1, 1, 1, 1, 1,
1.213718, 0.2815467, 1.358977, 1, 1, 1, 1, 1,
1.218642, -0.6616017, 0.8696107, 1, 1, 1, 1, 1,
1.220091, 0.9584464, 1.048035, 1, 1, 1, 1, 1,
1.230827, -0.6485071, 1.549174, 0, 0, 1, 1, 1,
1.234076, -0.7552187, 3.985281, 1, 0, 0, 1, 1,
1.238584, -1.01864, 2.375092, 1, 0, 0, 1, 1,
1.239086, 1.665955, 1.832934, 1, 0, 0, 1, 1,
1.240827, 0.3786345, 2.443857, 1, 0, 0, 1, 1,
1.252643, -0.698996, 2.551646, 1, 0, 0, 1, 1,
1.254239, 1.801933, 0.2039466, 0, 0, 0, 1, 1,
1.255772, -0.3268972, 0.6291066, 0, 0, 0, 1, 1,
1.258593, 0.555947, 1.586578, 0, 0, 0, 1, 1,
1.276279, 1.749732, 1.71919, 0, 0, 0, 1, 1,
1.277258, -0.5259915, -0.07728481, 0, 0, 0, 1, 1,
1.283261, -0.5367188, 3.594047, 0, 0, 0, 1, 1,
1.287742, 1.582886, 3.169317, 0, 0, 0, 1, 1,
1.29428, -0.9611899, 1.091055, 1, 1, 1, 1, 1,
1.302081, -1.495025, 0.7022086, 1, 1, 1, 1, 1,
1.306409, -1.405568, 1.019393, 1, 1, 1, 1, 1,
1.311369, 0.7741815, 0.5972483, 1, 1, 1, 1, 1,
1.313187, 1.019715, -0.5790457, 1, 1, 1, 1, 1,
1.323293, -1.553587, 1.965638, 1, 1, 1, 1, 1,
1.325291, -0.05898611, 0.3010588, 1, 1, 1, 1, 1,
1.336399, -0.9161599, 1.777258, 1, 1, 1, 1, 1,
1.346289, 1.397754, 0.3444932, 1, 1, 1, 1, 1,
1.351261, -0.5912791, 3.258048, 1, 1, 1, 1, 1,
1.351804, 1.551811, 1.816329, 1, 1, 1, 1, 1,
1.372517, 1.303682, 0.7713954, 1, 1, 1, 1, 1,
1.388321, 0.3582868, 0.9783263, 1, 1, 1, 1, 1,
1.396042, 1.526855, 0.7180182, 1, 1, 1, 1, 1,
1.396238, -1.338927, 2.287199, 1, 1, 1, 1, 1,
1.410601, 0.2586565, 0.8252704, 0, 0, 1, 1, 1,
1.446808, -1.4587, 2.623429, 1, 0, 0, 1, 1,
1.45136, 0.8433357, 0.3602923, 1, 0, 0, 1, 1,
1.463406, -0.2848319, 0.6305768, 1, 0, 0, 1, 1,
1.470022, 1.332396, -1.207951, 1, 0, 0, 1, 1,
1.483668, -0.4319517, 1.923766, 1, 0, 0, 1, 1,
1.488304, -1.538128, 1.948866, 0, 0, 0, 1, 1,
1.490698, -0.619929, 1.679939, 0, 0, 0, 1, 1,
1.491836, -1.961126, 1.645722, 0, 0, 0, 1, 1,
1.497289, -0.2785243, 1.612145, 0, 0, 0, 1, 1,
1.502556, -0.9677785, 2.449364, 0, 0, 0, 1, 1,
1.507569, 0.5964758, 1.676625, 0, 0, 0, 1, 1,
1.516303, 0.1667536, 1.038278, 0, 0, 0, 1, 1,
1.521925, 0.3994887, 1.853875, 1, 1, 1, 1, 1,
1.530691, -0.3324742, 2.340883, 1, 1, 1, 1, 1,
1.53579, -0.9605011, 1.110194, 1, 1, 1, 1, 1,
1.537865, -0.1435895, 2.556175, 1, 1, 1, 1, 1,
1.538111, -0.5101523, 2.078494, 1, 1, 1, 1, 1,
1.541098, 1.164414, 2.748119, 1, 1, 1, 1, 1,
1.542671, 0.7357533, 2.279666, 1, 1, 1, 1, 1,
1.556528, -0.3811151, 1.358352, 1, 1, 1, 1, 1,
1.557476, -0.2655468, 2.28559, 1, 1, 1, 1, 1,
1.557773, 0.733954, 0.9307352, 1, 1, 1, 1, 1,
1.577331, 0.7974072, 0.06982884, 1, 1, 1, 1, 1,
1.581106, -0.7232531, 2.889697, 1, 1, 1, 1, 1,
1.581249, 0.3843208, 0.8308923, 1, 1, 1, 1, 1,
1.60408, 2.536337, 0.01967423, 1, 1, 1, 1, 1,
1.616964, 1.424627, 1.381897, 1, 1, 1, 1, 1,
1.622513, -0.5866255, 2.11097, 0, 0, 1, 1, 1,
1.634595, 0.2447799, -0.1483521, 1, 0, 0, 1, 1,
1.63531, -1.392616, 2.217376, 1, 0, 0, 1, 1,
1.636932, -1.201933, 1.048839, 1, 0, 0, 1, 1,
1.659567, -0.8340663, 1.833781, 1, 0, 0, 1, 1,
1.670577, 0.4035532, 1.319421, 1, 0, 0, 1, 1,
1.674547, -0.9664467, 2.417797, 0, 0, 0, 1, 1,
1.676735, -1.542161, 4.239108, 0, 0, 0, 1, 1,
1.681191, 0.4445159, 2.673003, 0, 0, 0, 1, 1,
1.685022, 0.8316444, 1.131943, 0, 0, 0, 1, 1,
1.686414, -0.2405171, 1.718635, 0, 0, 0, 1, 1,
1.703984, 1.990767, 0.9241843, 0, 0, 0, 1, 1,
1.70412, -0.05350345, 1.365028, 0, 0, 0, 1, 1,
1.71802, -0.2113446, 0.8379001, 1, 1, 1, 1, 1,
1.74911, 0.6055598, 1.702105, 1, 1, 1, 1, 1,
1.749716, -1.024887, 1.057721, 1, 1, 1, 1, 1,
1.754683, -0.7114537, 0.8379369, 1, 1, 1, 1, 1,
1.777255, -1.430937, 2.845427, 1, 1, 1, 1, 1,
1.80302, 0.6501954, 0.734386, 1, 1, 1, 1, 1,
1.81462, -0.4071633, 1.793469, 1, 1, 1, 1, 1,
1.827096, 0.2038432, 1.731761, 1, 1, 1, 1, 1,
1.83013, -0.506499, -0.04547175, 1, 1, 1, 1, 1,
1.837645, -1.292185, 2.419005, 1, 1, 1, 1, 1,
1.848801, -0.669764, 2.7783, 1, 1, 1, 1, 1,
1.849631, 1.399842, -0.08365419, 1, 1, 1, 1, 1,
1.870126, 0.585629, 2.01924, 1, 1, 1, 1, 1,
1.876861, 2.111794, 1.373225, 1, 1, 1, 1, 1,
1.934736, 0.1433308, 2.415063, 1, 1, 1, 1, 1,
2.017169, -2.334806, 3.348021, 0, 0, 1, 1, 1,
2.063802, 0.219439, 0.2827035, 1, 0, 0, 1, 1,
2.071924, 0.06460892, 2.03242, 1, 0, 0, 1, 1,
2.082824, -0.215397, 3.090471, 1, 0, 0, 1, 1,
2.087629, -1.843849, 1.331779, 1, 0, 0, 1, 1,
2.107656, -0.6120021, 1.595876, 1, 0, 0, 1, 1,
2.141742, -1.464039, 2.535784, 0, 0, 0, 1, 1,
2.210063, -0.3327161, 2.171422, 0, 0, 0, 1, 1,
2.237426, -1.938276, 2.866921, 0, 0, 0, 1, 1,
2.28018, 0.3744647, 2.909974, 0, 0, 0, 1, 1,
2.353298, -2.167542, 1.343457, 0, 0, 0, 1, 1,
2.359541, 0.2404145, 0.6698196, 0, 0, 0, 1, 1,
2.435263, -1.598922, 1.955134, 0, 0, 0, 1, 1,
2.548476, 0.6216676, 1.619777, 1, 1, 1, 1, 1,
2.559868, 0.2246075, 1.189823, 1, 1, 1, 1, 1,
2.745461, 0.4021572, 2.255168, 1, 1, 1, 1, 1,
2.746803, -0.01551409, 2.209994, 1, 1, 1, 1, 1,
2.799922, 0.9131557, 2.281608, 1, 1, 1, 1, 1,
2.93167, 0.8763568, 1.227726, 1, 1, 1, 1, 1,
3.537593, -1.553897, 1.673297, 1, 1, 1, 1, 1
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
var radius = 9.513193;
var distance = 33.41469;
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
mvMatrix.translate( -0.2368279, -0.1660163, -0.4497058 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41469);
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
