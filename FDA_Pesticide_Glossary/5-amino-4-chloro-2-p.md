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
-3.219253, 0.2912172, -2.918363, 1, 0, 0, 1,
-3.0244, 0.6494122, -3.338613, 1, 0.007843138, 0, 1,
-2.955332, 0.02845925, -1.63742, 1, 0.01176471, 0, 1,
-2.891438, -1.714758, -3.193916, 1, 0.01960784, 0, 1,
-2.843239, -0.4915171, -3.232564, 1, 0.02352941, 0, 1,
-2.8211, 0.3591481, -1.590863, 1, 0.03137255, 0, 1,
-2.447726, 0.3072089, -1.615341, 1, 0.03529412, 0, 1,
-2.394202, -0.9797373, -1.474789, 1, 0.04313726, 0, 1,
-2.378238, 0.451977, -1.962052, 1, 0.04705882, 0, 1,
-2.331671, -1.217908, -3.472556, 1, 0.05490196, 0, 1,
-2.306506, -0.2355869, -0.969206, 1, 0.05882353, 0, 1,
-2.265573, -0.05010396, -1.26252, 1, 0.06666667, 0, 1,
-2.246964, 0.6011031, -2.31992, 1, 0.07058824, 0, 1,
-2.225179, -1.955531, -1.277535, 1, 0.07843138, 0, 1,
-2.186121, -1.362388, -1.785993, 1, 0.08235294, 0, 1,
-2.149653, 2.069001, -1.807614, 1, 0.09019608, 0, 1,
-2.091956, -0.1916706, -2.023582, 1, 0.09411765, 0, 1,
-2.046538, -0.8947079, -2.019757, 1, 0.1019608, 0, 1,
-2.040388, 1.456867, -2.795745, 1, 0.1098039, 0, 1,
-2.028086, -1.107507, -1.056323, 1, 0.1137255, 0, 1,
-1.968509, 0.07333088, -1.424896, 1, 0.1215686, 0, 1,
-1.962402, -1.856027, -4.475887, 1, 0.1254902, 0, 1,
-1.937576, -0.7694016, -1.512659, 1, 0.1333333, 0, 1,
-1.929816, -1.523071, -3.668228, 1, 0.1372549, 0, 1,
-1.928904, 0.3628486, 0.3364002, 1, 0.145098, 0, 1,
-1.92682, 0.1199445, -2.24785, 1, 0.1490196, 0, 1,
-1.90859, -0.5424973, -2.173749, 1, 0.1568628, 0, 1,
-1.902433, -0.7023747, -1.338963, 1, 0.1607843, 0, 1,
-1.901999, 0.1278929, -2.203956, 1, 0.1686275, 0, 1,
-1.898205, -0.9733821, -1.709187, 1, 0.172549, 0, 1,
-1.898003, -0.106115, -0.8044412, 1, 0.1803922, 0, 1,
-1.891635, 0.4613458, -1.215351, 1, 0.1843137, 0, 1,
-1.878544, -2.503142, -2.808681, 1, 0.1921569, 0, 1,
-1.826577, -0.8113564, -1.382263, 1, 0.1960784, 0, 1,
-1.812584, 0.783668, -1.713873, 1, 0.2039216, 0, 1,
-1.78182, -1.260322, -2.526717, 1, 0.2117647, 0, 1,
-1.757294, 1.070236, -1.561511, 1, 0.2156863, 0, 1,
-1.753215, -0.7430029, -1.000866, 1, 0.2235294, 0, 1,
-1.73393, -0.3188811, -0.5235174, 1, 0.227451, 0, 1,
-1.715104, -1.226162, -2.519049, 1, 0.2352941, 0, 1,
-1.70141, 0.9371883, -1.811186, 1, 0.2392157, 0, 1,
-1.697102, 0.8938276, -1.365242, 1, 0.2470588, 0, 1,
-1.694376, -1.099298, -3.792901, 1, 0.2509804, 0, 1,
-1.681388, 1.639813, -0.4593159, 1, 0.2588235, 0, 1,
-1.677898, -1.558112, -1.671586, 1, 0.2627451, 0, 1,
-1.660555, -0.524937, -0.9931492, 1, 0.2705882, 0, 1,
-1.651973, -0.3793504, -0.7494212, 1, 0.2745098, 0, 1,
-1.639534, 1.014812, -1.224435, 1, 0.282353, 0, 1,
-1.628614, 1.818754, -0.8031238, 1, 0.2862745, 0, 1,
-1.620296, -1.72609, -1.659031, 1, 0.2941177, 0, 1,
-1.616638, 0.4774604, -0.5488272, 1, 0.3019608, 0, 1,
-1.61425, 0.9627566, -2.587515, 1, 0.3058824, 0, 1,
-1.613631, -1.094232, -2.025775, 1, 0.3137255, 0, 1,
-1.609687, 0.1216173, -2.064254, 1, 0.3176471, 0, 1,
-1.601312, -0.3351855, -1.584328, 1, 0.3254902, 0, 1,
-1.590027, -0.1086637, 0.4681663, 1, 0.3294118, 0, 1,
-1.584428, -0.3662428, -2.491757, 1, 0.3372549, 0, 1,
-1.568033, -0.3756205, -2.404267, 1, 0.3411765, 0, 1,
-1.565242, -0.4873959, -0.4783292, 1, 0.3490196, 0, 1,
-1.564487, 0.5890601, 0.01272133, 1, 0.3529412, 0, 1,
-1.564381, -0.5583477, -1.675435, 1, 0.3607843, 0, 1,
-1.56206, -1.047858, -3.729658, 1, 0.3647059, 0, 1,
-1.548057, -1.032757, -2.822725, 1, 0.372549, 0, 1,
-1.538673, 0.7280219, -1.823027, 1, 0.3764706, 0, 1,
-1.536971, -0.9930748, -1.086361, 1, 0.3843137, 0, 1,
-1.518697, 0.2479809, -2.50927, 1, 0.3882353, 0, 1,
-1.50989, 0.1281945, -2.855465, 1, 0.3960784, 0, 1,
-1.504522, 0.6023827, -0.1205061, 1, 0.4039216, 0, 1,
-1.497938, -1.309632, -3.568182, 1, 0.4078431, 0, 1,
-1.480695, 0.2853951, -3.114718, 1, 0.4156863, 0, 1,
-1.476583, -0.4697863, -1.367243, 1, 0.4196078, 0, 1,
-1.469667, 0.8812634, -1.589656, 1, 0.427451, 0, 1,
-1.461322, 1.580164, -1.277526, 1, 0.4313726, 0, 1,
-1.460809, -0.8567401, -3.883054, 1, 0.4392157, 0, 1,
-1.453062, -1.265407, -1.523939, 1, 0.4431373, 0, 1,
-1.447725, -0.5190762, -2.775383, 1, 0.4509804, 0, 1,
-1.438346, -0.6176291, -2.706272, 1, 0.454902, 0, 1,
-1.43302, 1.363729, -0.2350558, 1, 0.4627451, 0, 1,
-1.428832, 0.1464932, -2.079827, 1, 0.4666667, 0, 1,
-1.419027, 0.3338407, 0.01520986, 1, 0.4745098, 0, 1,
-1.416018, -0.3714526, -2.479069, 1, 0.4784314, 0, 1,
-1.411555, -0.8788432, -1.253964, 1, 0.4862745, 0, 1,
-1.403081, -0.2458154, -1.560935, 1, 0.4901961, 0, 1,
-1.398948, -0.8316931, 1.368037, 1, 0.4980392, 0, 1,
-1.386003, 0.3028728, -1.12826, 1, 0.5058824, 0, 1,
-1.383965, 0.3729707, -2.537009, 1, 0.509804, 0, 1,
-1.381119, 0.3865882, -0.2550023, 1, 0.5176471, 0, 1,
-1.378765, -0.5377125, 0.9470357, 1, 0.5215687, 0, 1,
-1.375197, -1.110974, -1.565268, 1, 0.5294118, 0, 1,
-1.369107, -1.69918, -4.881894, 1, 0.5333334, 0, 1,
-1.363038, 1.216449, -1.615921, 1, 0.5411765, 0, 1,
-1.353223, 1.679737, 0.09696259, 1, 0.5450981, 0, 1,
-1.351728, 1.292953, -0.5801818, 1, 0.5529412, 0, 1,
-1.342499, 1.395103, 0.5882878, 1, 0.5568628, 0, 1,
-1.342165, -2.771112, -1.306628, 1, 0.5647059, 0, 1,
-1.335555, 0.2849641, -1.277639, 1, 0.5686275, 0, 1,
-1.334733, 0.5716358, -2.261486, 1, 0.5764706, 0, 1,
-1.328246, -0.3858962, -0.4403163, 1, 0.5803922, 0, 1,
-1.319451, 0.6588307, -0.7382042, 1, 0.5882353, 0, 1,
-1.307162, 0.2182893, 0.1199075, 1, 0.5921569, 0, 1,
-1.291727, 0.5644718, -0.09191067, 1, 0.6, 0, 1,
-1.290757, 0.9342958, -1.358384, 1, 0.6078432, 0, 1,
-1.288554, 1.072809, -1.014807, 1, 0.6117647, 0, 1,
-1.28619, 0.4739889, -2.329108, 1, 0.6196079, 0, 1,
-1.279156, 0.1367705, -2.101637, 1, 0.6235294, 0, 1,
-1.275771, 0.3227744, -0.4359753, 1, 0.6313726, 0, 1,
-1.274058, -1.831049, -2.252406, 1, 0.6352941, 0, 1,
-1.261749, -3.095252, -2.524972, 1, 0.6431373, 0, 1,
-1.261491, 0.5143079, -0.2963882, 1, 0.6470588, 0, 1,
-1.256232, -1.217846, -1.090972, 1, 0.654902, 0, 1,
-1.248065, 0.6543717, -0.6931125, 1, 0.6588235, 0, 1,
-1.246839, -0.2266662, -3.373893, 1, 0.6666667, 0, 1,
-1.246711, -0.6272613, -1.297618, 1, 0.6705883, 0, 1,
-1.246455, 1.232753, 0.08843514, 1, 0.6784314, 0, 1,
-1.2445, -1.192802, -3.646436, 1, 0.682353, 0, 1,
-1.240723, -1.93178, -2.077208, 1, 0.6901961, 0, 1,
-1.23695, 1.991326, -0.3502707, 1, 0.6941177, 0, 1,
-1.23311, -1.400152, -2.952934, 1, 0.7019608, 0, 1,
-1.229739, 0.6520458, -1.051372, 1, 0.7098039, 0, 1,
-1.220906, 0.5232471, -1.944865, 1, 0.7137255, 0, 1,
-1.205185, 1.269509, 0.2100746, 1, 0.7215686, 0, 1,
-1.205052, -1.169043, -3.515208, 1, 0.7254902, 0, 1,
-1.198452, -0.722287, -2.978928, 1, 0.7333333, 0, 1,
-1.178362, -0.5351206, -1.477543, 1, 0.7372549, 0, 1,
-1.178027, 0.5101455, -2.300676, 1, 0.7450981, 0, 1,
-1.177916, 0.8129767, -3.052392, 1, 0.7490196, 0, 1,
-1.175676, -1.792429, -4.236511, 1, 0.7568628, 0, 1,
-1.164417, -0.7059289, -1.444838, 1, 0.7607843, 0, 1,
-1.164282, 0.8896001, 0.08320478, 1, 0.7686275, 0, 1,
-1.16392, 1.356206, -0.2891523, 1, 0.772549, 0, 1,
-1.141201, -0.3656493, -1.460851, 1, 0.7803922, 0, 1,
-1.130228, 2.358947, 0.6790933, 1, 0.7843137, 0, 1,
-1.124623, -1.059248, -1.754156, 1, 0.7921569, 0, 1,
-1.124333, -0.4469759, -0.7116839, 1, 0.7960784, 0, 1,
-1.120102, 2.920659, -1.044326, 1, 0.8039216, 0, 1,
-1.118373, 0.3791006, -0.7275462, 1, 0.8117647, 0, 1,
-1.115813, 0.4235277, -2.604607, 1, 0.8156863, 0, 1,
-1.114605, -0.293367, -0.3300713, 1, 0.8235294, 0, 1,
-1.109533, -1.102038, -3.136619, 1, 0.827451, 0, 1,
-1.109301, -1.466902, -2.549275, 1, 0.8352941, 0, 1,
-1.105626, 0.3630443, -0.4787882, 1, 0.8392157, 0, 1,
-1.10438, -0.1999686, -3.237042, 1, 0.8470588, 0, 1,
-1.09967, -0.07445309, -2.339302, 1, 0.8509804, 0, 1,
-1.098605, -0.558139, -2.224046, 1, 0.8588235, 0, 1,
-1.097665, -0.8300133, -1.748673, 1, 0.8627451, 0, 1,
-1.097493, -0.2210817, -3.239606, 1, 0.8705882, 0, 1,
-1.08102, -0.2522891, -2.524565, 1, 0.8745098, 0, 1,
-1.080651, 1.748141, 0.182079, 1, 0.8823529, 0, 1,
-1.07776, 2.097153, 0.1994053, 1, 0.8862745, 0, 1,
-1.075444, -0.9933494, -1.021404, 1, 0.8941177, 0, 1,
-1.060121, -1.183369, -1.840045, 1, 0.8980392, 0, 1,
-1.059242, 0.8372459, -1.22876, 1, 0.9058824, 0, 1,
-1.050175, -0.708953, -0.5043029, 1, 0.9137255, 0, 1,
-1.045501, -0.2195721, -3.152605, 1, 0.9176471, 0, 1,
-1.041326, 0.3950334, -1.772444, 1, 0.9254902, 0, 1,
-1.039949, 1.709467, 1.231265, 1, 0.9294118, 0, 1,
-1.033894, 1.485613, -0.4447585, 1, 0.9372549, 0, 1,
-1.026143, 1.337041, -1.376567, 1, 0.9411765, 0, 1,
-1.021538, 1.438223, -0.3712602, 1, 0.9490196, 0, 1,
-1.017973, -0.3875975, -0.8566982, 1, 0.9529412, 0, 1,
-1.006315, 0.1543854, -1.574761, 1, 0.9607843, 0, 1,
-1.006283, 1.033468, -0.4379735, 1, 0.9647059, 0, 1,
-1.005647, -0.02033027, -1.546304, 1, 0.972549, 0, 1,
-0.99777, -1.57913, -4.353447, 1, 0.9764706, 0, 1,
-0.9964832, -0.623706, -2.924956, 1, 0.9843137, 0, 1,
-0.9919195, -0.05282716, 0.145737, 1, 0.9882353, 0, 1,
-0.9886299, 1.233745, 0.376096, 1, 0.9960784, 0, 1,
-0.9860858, 0.5479459, 0.1888538, 0.9960784, 1, 0, 1,
-0.9821229, 0.4070811, -1.573126, 0.9921569, 1, 0, 1,
-0.9813482, -0.2875033, -0.7700278, 0.9843137, 1, 0, 1,
-0.9809338, -0.3700613, -0.9868799, 0.9803922, 1, 0, 1,
-0.9741386, -0.007681636, -0.4966735, 0.972549, 1, 0, 1,
-0.9691107, 0.5930341, -1.927986, 0.9686275, 1, 0, 1,
-0.9676458, 0.5849597, -0.9203224, 0.9607843, 1, 0, 1,
-0.9646559, 0.8526554, 1.337278, 0.9568627, 1, 0, 1,
-0.9616786, 0.2735669, -3.450792, 0.9490196, 1, 0, 1,
-0.9557289, -1.592356, -1.576961, 0.945098, 1, 0, 1,
-0.9550415, -0.4879084, -3.239025, 0.9372549, 1, 0, 1,
-0.9392327, 1.092263, -1.198326, 0.9333333, 1, 0, 1,
-0.9310288, 0.5729446, 0.5569677, 0.9254902, 1, 0, 1,
-0.917436, 0.7514951, -3.362512, 0.9215686, 1, 0, 1,
-0.9159047, -1.166317, -1.774632, 0.9137255, 1, 0, 1,
-0.9143528, -1.401354, -3.292132, 0.9098039, 1, 0, 1,
-0.9133998, -0.7935969, -2.217484, 0.9019608, 1, 0, 1,
-0.9076844, -0.2009331, -2.261441, 0.8941177, 1, 0, 1,
-0.9052129, -0.5175907, -0.8795357, 0.8901961, 1, 0, 1,
-0.9048422, 1.04293, 0.2163343, 0.8823529, 1, 0, 1,
-0.8970596, -0.7172948, -3.853038, 0.8784314, 1, 0, 1,
-0.8852339, -0.3719904, -1.445142, 0.8705882, 1, 0, 1,
-0.8825623, 0.1838879, -0.7531665, 0.8666667, 1, 0, 1,
-0.8805139, -2.486272, -3.589692, 0.8588235, 1, 0, 1,
-0.879929, 1.122589, -1.333204, 0.854902, 1, 0, 1,
-0.8784653, 2.52637, 0.7341364, 0.8470588, 1, 0, 1,
-0.8723326, -0.6683248, -1.056352, 0.8431373, 1, 0, 1,
-0.8674511, -0.1222043, -1.978271, 0.8352941, 1, 0, 1,
-0.8647915, 1.617056, 0.2439101, 0.8313726, 1, 0, 1,
-0.8641338, -0.6418977, -2.445705, 0.8235294, 1, 0, 1,
-0.8632897, -0.5499097, -3.325608, 0.8196079, 1, 0, 1,
-0.8613907, 0.6049081, -0.8167353, 0.8117647, 1, 0, 1,
-0.8613547, 0.2061405, -0.6855942, 0.8078431, 1, 0, 1,
-0.8613392, 0.03335685, -0.7979265, 0.8, 1, 0, 1,
-0.8605387, -0.6429853, -0.4833084, 0.7921569, 1, 0, 1,
-0.859346, -0.008523406, -1.841534, 0.7882353, 1, 0, 1,
-0.8591938, -1.9863, -2.482374, 0.7803922, 1, 0, 1,
-0.8589681, -0.04994077, -1.620622, 0.7764706, 1, 0, 1,
-0.8429983, -0.3814108, -0.7758502, 0.7686275, 1, 0, 1,
-0.8396869, -0.250254, -2.080954, 0.7647059, 1, 0, 1,
-0.8346509, -1.344254, -3.17728, 0.7568628, 1, 0, 1,
-0.834393, -0.921617, -3.168412, 0.7529412, 1, 0, 1,
-0.8338945, -0.0707532, -1.579744, 0.7450981, 1, 0, 1,
-0.8280212, 0.8258492, -1.602403, 0.7411765, 1, 0, 1,
-0.8259063, -0.39385, -2.490401, 0.7333333, 1, 0, 1,
-0.8240196, 0.356333, -2.168982, 0.7294118, 1, 0, 1,
-0.8236727, -0.2301645, -0.8329118, 0.7215686, 1, 0, 1,
-0.8225046, 0.9085536, 0.3836193, 0.7176471, 1, 0, 1,
-0.8165874, 1.387782, 1.33415, 0.7098039, 1, 0, 1,
-0.8140698, -0.5446539, -2.440034, 0.7058824, 1, 0, 1,
-0.8110659, 0.5082556, 0.02652476, 0.6980392, 1, 0, 1,
-0.8102596, -0.3116819, -2.511646, 0.6901961, 1, 0, 1,
-0.8046541, 0.1091233, -1.315432, 0.6862745, 1, 0, 1,
-0.8044671, 0.8417656, -0.8223401, 0.6784314, 1, 0, 1,
-0.7998121, -0.1414632, -2.371866, 0.6745098, 1, 0, 1,
-0.7984238, -0.4099045, -1.781144, 0.6666667, 1, 0, 1,
-0.7956174, -0.4359914, -1.551695, 0.6627451, 1, 0, 1,
-0.7919391, -1.24566, -2.758263, 0.654902, 1, 0, 1,
-0.7819732, 1.845801, -0.8202847, 0.6509804, 1, 0, 1,
-0.7794482, -0.0007938621, -1.173834, 0.6431373, 1, 0, 1,
-0.7792779, -0.7372668, -2.060102, 0.6392157, 1, 0, 1,
-0.7775404, 1.57843, 1.972528, 0.6313726, 1, 0, 1,
-0.7765843, 0.7067006, -0.8421384, 0.627451, 1, 0, 1,
-0.7729126, 0.04208147, -2.109513, 0.6196079, 1, 0, 1,
-0.7671196, -0.5745687, -1.306481, 0.6156863, 1, 0, 1,
-0.7666085, 0.384899, -1.305257, 0.6078432, 1, 0, 1,
-0.7623366, -0.854673, -3.055518, 0.6039216, 1, 0, 1,
-0.7605064, 2.413104, -1.390163, 0.5960785, 1, 0, 1,
-0.7602034, 1.894539, 0.5950701, 0.5882353, 1, 0, 1,
-0.759148, 0.08873961, -0.517065, 0.5843138, 1, 0, 1,
-0.7581975, -1.059618, -4.368598, 0.5764706, 1, 0, 1,
-0.7539557, 0.3048009, -1.339373, 0.572549, 1, 0, 1,
-0.7519199, 0.541986, 0.8070952, 0.5647059, 1, 0, 1,
-0.7460284, 0.3827118, -1.986771, 0.5607843, 1, 0, 1,
-0.7459369, 1.778407, -1.556491, 0.5529412, 1, 0, 1,
-0.7423286, -0.3893514, -2.531946, 0.5490196, 1, 0, 1,
-0.7417741, 0.9847775, -0.1165531, 0.5411765, 1, 0, 1,
-0.7408064, -1.064271, -1.953341, 0.5372549, 1, 0, 1,
-0.7397707, -1.043106, -3.929331, 0.5294118, 1, 0, 1,
-0.7374201, -1.611408, -2.146776, 0.5254902, 1, 0, 1,
-0.7349709, 0.3196282, -2.72467, 0.5176471, 1, 0, 1,
-0.734161, 2.105258, 0.7519981, 0.5137255, 1, 0, 1,
-0.7291791, -0.3466209, -0.3065765, 0.5058824, 1, 0, 1,
-0.7234087, 0.07381111, -1.79583, 0.5019608, 1, 0, 1,
-0.7204053, -0.470164, -3.712481, 0.4941176, 1, 0, 1,
-0.7158628, -0.5545664, -2.380329, 0.4862745, 1, 0, 1,
-0.714933, -2.068637, -2.069272, 0.4823529, 1, 0, 1,
-0.7147647, -0.3009287, -2.702387, 0.4745098, 1, 0, 1,
-0.7090098, 0.4830044, 0.4776646, 0.4705882, 1, 0, 1,
-0.705478, -1.160409, -0.3868609, 0.4627451, 1, 0, 1,
-0.7054607, 0.3195976, -1.673444, 0.4588235, 1, 0, 1,
-0.701055, -0.1283978, -2.821749, 0.4509804, 1, 0, 1,
-0.6939031, -0.6870551, -3.816352, 0.4470588, 1, 0, 1,
-0.6879339, 0.5121886, -1.650726, 0.4392157, 1, 0, 1,
-0.6871321, -0.315346, -1.94594, 0.4352941, 1, 0, 1,
-0.686494, 0.7926909, -0.8525969, 0.427451, 1, 0, 1,
-0.6863065, -0.9873805, -4.586841, 0.4235294, 1, 0, 1,
-0.686148, 1.253276, -1.222824, 0.4156863, 1, 0, 1,
-0.6852545, 0.550868, -0.2955199, 0.4117647, 1, 0, 1,
-0.6833636, -1.40649, -2.356305, 0.4039216, 1, 0, 1,
-0.6773232, 1.036979, 0.02282838, 0.3960784, 1, 0, 1,
-0.6678175, -0.03494301, 0.1583106, 0.3921569, 1, 0, 1,
-0.667009, -0.1062675, -0.6751674, 0.3843137, 1, 0, 1,
-0.6668857, -0.2121052, -2.197443, 0.3803922, 1, 0, 1,
-0.6658387, -2.133231, -4.093768, 0.372549, 1, 0, 1,
-0.6621274, 0.1711886, -2.118309, 0.3686275, 1, 0, 1,
-0.6497286, -0.8774224, -1.845692, 0.3607843, 1, 0, 1,
-0.6410007, -0.01697593, -2.113183, 0.3568628, 1, 0, 1,
-0.6378381, -1.786412, -2.767995, 0.3490196, 1, 0, 1,
-0.6374455, 0.006316266, -1.204932, 0.345098, 1, 0, 1,
-0.6340161, -2.006854, -3.833901, 0.3372549, 1, 0, 1,
-0.6325665, -0.520597, -2.057046, 0.3333333, 1, 0, 1,
-0.6324985, 0.4021659, 1.249774, 0.3254902, 1, 0, 1,
-0.6310194, 0.966237, -0.6886261, 0.3215686, 1, 0, 1,
-0.6307455, 0.1897467, -2.720135, 0.3137255, 1, 0, 1,
-0.629469, -0.2650231, -0.392773, 0.3098039, 1, 0, 1,
-0.629468, 0.5919067, -0.2587115, 0.3019608, 1, 0, 1,
-0.6272704, -0.9632086, -2.98045, 0.2941177, 1, 0, 1,
-0.6264306, -0.4897392, -0.4242953, 0.2901961, 1, 0, 1,
-0.6147942, -0.9447706, -3.480981, 0.282353, 1, 0, 1,
-0.6139139, 1.57433, -1.157063, 0.2784314, 1, 0, 1,
-0.6068008, 1.354825, -0.771583, 0.2705882, 1, 0, 1,
-0.6031463, 0.1719367, -1.329805, 0.2666667, 1, 0, 1,
-0.6025878, -0.4094765, -2.173837, 0.2588235, 1, 0, 1,
-0.5988968, 2.685341, 0.8331571, 0.254902, 1, 0, 1,
-0.5922629, 0.2545691, -1.550755, 0.2470588, 1, 0, 1,
-0.5891349, 0.5823475, 0.1122537, 0.2431373, 1, 0, 1,
-0.5891223, 1.651077, 0.3261497, 0.2352941, 1, 0, 1,
-0.5848351, -0.08180403, -1.043092, 0.2313726, 1, 0, 1,
-0.5811382, 0.01399603, -1.290497, 0.2235294, 1, 0, 1,
-0.5784485, 0.8287085, -1.08303, 0.2196078, 1, 0, 1,
-0.5778785, 0.1152598, -1.523078, 0.2117647, 1, 0, 1,
-0.5694019, -0.2419752, -4.21943, 0.2078431, 1, 0, 1,
-0.5676447, -0.1476079, -3.144418, 0.2, 1, 0, 1,
-0.5644178, 1.251552, 0.7633725, 0.1921569, 1, 0, 1,
-0.5639741, 1.261567, -0.3786822, 0.1882353, 1, 0, 1,
-0.5576233, 0.9890494, -0.2103241, 0.1803922, 1, 0, 1,
-0.5523345, -0.4499571, -2.505929, 0.1764706, 1, 0, 1,
-0.5511176, 0.6908436, -1.154993, 0.1686275, 1, 0, 1,
-0.5504953, 0.1290552, -3.465768, 0.1647059, 1, 0, 1,
-0.5502514, -1.426256, -2.087559, 0.1568628, 1, 0, 1,
-0.549111, -0.6674906, -3.60569, 0.1529412, 1, 0, 1,
-0.5476048, -0.4547322, -2.35606, 0.145098, 1, 0, 1,
-0.5464118, -0.2879554, -1.48093, 0.1411765, 1, 0, 1,
-0.5401196, 1.742039, 1.300978, 0.1333333, 1, 0, 1,
-0.5398014, 0.1199998, -0.8800418, 0.1294118, 1, 0, 1,
-0.539003, 0.4772377, -0.6308144, 0.1215686, 1, 0, 1,
-0.5382727, 0.6925297, -0.3034995, 0.1176471, 1, 0, 1,
-0.5382558, -0.1330909, -1.793936, 0.1098039, 1, 0, 1,
-0.5355315, -1.443866, -2.428753, 0.1058824, 1, 0, 1,
-0.5345231, 1.418432, 0.8804112, 0.09803922, 1, 0, 1,
-0.5283481, 0.8850181, 0.1304025, 0.09019608, 1, 0, 1,
-0.5261621, -0.3803034, -2.983414, 0.08627451, 1, 0, 1,
-0.5193338, 0.3506452, -1.571403, 0.07843138, 1, 0, 1,
-0.5186031, 0.05924988, -1.469115, 0.07450981, 1, 0, 1,
-0.5184911, -1.635079, -3.490769, 0.06666667, 1, 0, 1,
-0.5173587, -0.2019754, -2.248492, 0.0627451, 1, 0, 1,
-0.515297, 1.351167, -0.8799258, 0.05490196, 1, 0, 1,
-0.5079346, -0.1968346, -2.667267, 0.05098039, 1, 0, 1,
-0.5074259, -0.8197035, -2.177118, 0.04313726, 1, 0, 1,
-0.4919726, -1.351014, -0.6858855, 0.03921569, 1, 0, 1,
-0.4911504, -0.8050393, -2.812851, 0.03137255, 1, 0, 1,
-0.490335, 0.5682329, -2.644947, 0.02745098, 1, 0, 1,
-0.4828999, -0.9786389, -2.477987, 0.01960784, 1, 0, 1,
-0.4828335, 0.01158512, -1.659562, 0.01568628, 1, 0, 1,
-0.4785707, -0.003819528, -1.876583, 0.007843138, 1, 0, 1,
-0.4744824, -0.05254818, -1.695173, 0.003921569, 1, 0, 1,
-0.4726498, 0.5800304, -0.9299032, 0, 1, 0.003921569, 1,
-0.4708843, 1.335132, -0.2345956, 0, 1, 0.01176471, 1,
-0.4701252, 0.6380212, -2.333249, 0, 1, 0.01568628, 1,
-0.463445, -0.4039649, -2.392076, 0, 1, 0.02352941, 1,
-0.4627291, -0.9175164, -2.371732, 0, 1, 0.02745098, 1,
-0.4611519, -0.653001, -2.992552, 0, 1, 0.03529412, 1,
-0.4608856, -1.205941, -1.988882, 0, 1, 0.03921569, 1,
-0.446113, -0.1560587, -1.485184, 0, 1, 0.04705882, 1,
-0.4455014, -1.12132, -2.068047, 0, 1, 0.05098039, 1,
-0.4415396, 1.5129, 0.2239147, 0, 1, 0.05882353, 1,
-0.441113, -1.319727, -2.896074, 0, 1, 0.0627451, 1,
-0.4376843, 2.249712, -0.6441711, 0, 1, 0.07058824, 1,
-0.4323785, 1.084964, -0.1863881, 0, 1, 0.07450981, 1,
-0.4279976, 1.157939, -2.538404, 0, 1, 0.08235294, 1,
-0.4277467, 1.091544, -1.671181, 0, 1, 0.08627451, 1,
-0.4261096, -0.4848855, -0.8470753, 0, 1, 0.09411765, 1,
-0.425956, 0.06507717, -2.635642, 0, 1, 0.1019608, 1,
-0.4210201, 0.4933729, 0.8863751, 0, 1, 0.1058824, 1,
-0.4197095, 0.1710133, -0.9997616, 0, 1, 0.1137255, 1,
-0.4159478, 2.824099, 0.02988805, 0, 1, 0.1176471, 1,
-0.4137353, -0.7741827, -2.860803, 0, 1, 0.1254902, 1,
-0.4134988, -2.854826, -3.437609, 0, 1, 0.1294118, 1,
-0.4117184, 0.6692792, -1.873589, 0, 1, 0.1372549, 1,
-0.4110791, -0.3761088, -1.643509, 0, 1, 0.1411765, 1,
-0.410425, 1.434571, -0.8690267, 0, 1, 0.1490196, 1,
-0.407513, -0.4579167, -2.126301, 0, 1, 0.1529412, 1,
-0.4042997, -0.07341267, -2.607904, 0, 1, 0.1607843, 1,
-0.4031205, 0.1018858, -1.726363, 0, 1, 0.1647059, 1,
-0.4028824, 0.6951859, -0.695117, 0, 1, 0.172549, 1,
-0.4026512, -0.532536, -0.5323748, 0, 1, 0.1764706, 1,
-0.3995675, 1.305716, -0.6898322, 0, 1, 0.1843137, 1,
-0.3952774, 0.2002339, -1.260003, 0, 1, 0.1882353, 1,
-0.3935122, 2.160461, -0.4955911, 0, 1, 0.1960784, 1,
-0.3931082, -0.5182651, -1.943928, 0, 1, 0.2039216, 1,
-0.3905549, -1.584347, -3.354738, 0, 1, 0.2078431, 1,
-0.3887388, -0.8263335, -3.863516, 0, 1, 0.2156863, 1,
-0.3887348, 0.3656401, -0.9843307, 0, 1, 0.2196078, 1,
-0.3868671, -2.203577, -1.4941, 0, 1, 0.227451, 1,
-0.3856671, -0.06895667, -1.695747, 0, 1, 0.2313726, 1,
-0.3777241, 1.087026, -2.125342, 0, 1, 0.2392157, 1,
-0.3741293, 1.307768, 0.5393808, 0, 1, 0.2431373, 1,
-0.3740549, -0.1974977, -0.3600193, 0, 1, 0.2509804, 1,
-0.3710055, 0.8072445, 0.1203083, 0, 1, 0.254902, 1,
-0.3708961, -0.0154458, -0.9738214, 0, 1, 0.2627451, 1,
-0.3696232, 1.807119, 0.399167, 0, 1, 0.2666667, 1,
-0.3674377, -1.219491, -3.861602, 0, 1, 0.2745098, 1,
-0.3654188, 0.005954768, -0.7400722, 0, 1, 0.2784314, 1,
-0.3649953, -0.8997595, -0.8025514, 0, 1, 0.2862745, 1,
-0.3614349, -0.6293442, -3.991337, 0, 1, 0.2901961, 1,
-0.3610054, 1.003161, -1.507284, 0, 1, 0.2980392, 1,
-0.3486655, -1.370771, -3.378726, 0, 1, 0.3058824, 1,
-0.3437678, 0.1281145, -1.189312, 0, 1, 0.3098039, 1,
-0.34315, -0.5064452, -2.294454, 0, 1, 0.3176471, 1,
-0.3428738, 0.100622, 0.2537288, 0, 1, 0.3215686, 1,
-0.3414658, -2.379913, -4.909158, 0, 1, 0.3294118, 1,
-0.3401192, 0.7847981, -2.035398, 0, 1, 0.3333333, 1,
-0.3362673, -1.36158, -1.781943, 0, 1, 0.3411765, 1,
-0.3338174, -1.244533, -2.358876, 0, 1, 0.345098, 1,
-0.3256055, 1.93829, 0.2084541, 0, 1, 0.3529412, 1,
-0.3249001, -0.09175254, -1.457824, 0, 1, 0.3568628, 1,
-0.323674, -0.2972839, -3.463428, 0, 1, 0.3647059, 1,
-0.3226184, 1.028815, 1.007201, 0, 1, 0.3686275, 1,
-0.3220382, -1.399825, -3.250189, 0, 1, 0.3764706, 1,
-0.3202892, 2.307118, -0.8285202, 0, 1, 0.3803922, 1,
-0.3202212, 0.4080095, -2.248999, 0, 1, 0.3882353, 1,
-0.3119919, 0.3310992, -1.371764, 0, 1, 0.3921569, 1,
-0.3040968, -0.4821225, -4.434241, 0, 1, 0.4, 1,
-0.3023172, -1.420505, -2.255247, 0, 1, 0.4078431, 1,
-0.3013669, 1.305799, 0.847589, 0, 1, 0.4117647, 1,
-0.2936539, -1.010321, -2.821221, 0, 1, 0.4196078, 1,
-0.29018, 1.802533, 2.073891, 0, 1, 0.4235294, 1,
-0.2894204, 0.4349717, -0.2578473, 0, 1, 0.4313726, 1,
-0.2877947, 0.5707277, 0.5669258, 0, 1, 0.4352941, 1,
-0.2864791, -0.342362, -3.432964, 0, 1, 0.4431373, 1,
-0.2848115, 0.2053658, -2.318338, 0, 1, 0.4470588, 1,
-0.2818223, -0.5247945, -3.353522, 0, 1, 0.454902, 1,
-0.2788737, 0.3228589, -2.789849, 0, 1, 0.4588235, 1,
-0.2770812, -1.82337, -3.364271, 0, 1, 0.4666667, 1,
-0.2768208, -0.3569236, -2.287335, 0, 1, 0.4705882, 1,
-0.2754077, 1.711989, 0.4102202, 0, 1, 0.4784314, 1,
-0.273594, -0.1588448, -1.876772, 0, 1, 0.4823529, 1,
-0.2621848, -0.641711, -1.699213, 0, 1, 0.4901961, 1,
-0.2591713, -1.424849, -2.954842, 0, 1, 0.4941176, 1,
-0.2453127, -1.154235, -3.160942, 0, 1, 0.5019608, 1,
-0.2422095, 1.409569, -2.677632, 0, 1, 0.509804, 1,
-0.2405469, 0.1947948, -1.492648, 0, 1, 0.5137255, 1,
-0.2394553, 0.2681333, -1.321661, 0, 1, 0.5215687, 1,
-0.2390559, -1.060198, -1.607993, 0, 1, 0.5254902, 1,
-0.237249, 1.815688, 0.7427429, 0, 1, 0.5333334, 1,
-0.2280289, 1.052413, -1.442962, 0, 1, 0.5372549, 1,
-0.2276161, 0.5429555, -0.6407604, 0, 1, 0.5450981, 1,
-0.2259049, -0.1489005, -1.541087, 0, 1, 0.5490196, 1,
-0.2195098, 0.1450142, 0.2564561, 0, 1, 0.5568628, 1,
-0.219333, -0.6804368, -3.664464, 0, 1, 0.5607843, 1,
-0.2130154, 0.7077377, -0.2643587, 0, 1, 0.5686275, 1,
-0.2123426, 0.7372814, -0.9645965, 0, 1, 0.572549, 1,
-0.2105497, -1.262399, -3.063875, 0, 1, 0.5803922, 1,
-0.2075307, -0.3016648, -1.022468, 0, 1, 0.5843138, 1,
-0.2043621, -0.6471264, -4.728593, 0, 1, 0.5921569, 1,
-0.200004, 0.4987482, -0.2107731, 0, 1, 0.5960785, 1,
-0.1993217, 0.2060079, 1.446311, 0, 1, 0.6039216, 1,
-0.1988676, -0.001972761, -1.094069, 0, 1, 0.6117647, 1,
-0.1988393, -0.1500622, -2.445713, 0, 1, 0.6156863, 1,
-0.1937251, 1.093388, -0.05514218, 0, 1, 0.6235294, 1,
-0.192914, 0.8260727, -0.8867145, 0, 1, 0.627451, 1,
-0.1852992, -0.3837808, -4.124069, 0, 1, 0.6352941, 1,
-0.1833765, 0.4263009, -1.126625, 0, 1, 0.6392157, 1,
-0.1831701, -0.7353145, -3.798129, 0, 1, 0.6470588, 1,
-0.1768868, 0.03702981, -2.378854, 0, 1, 0.6509804, 1,
-0.1763987, 0.00942386, -1.903703, 0, 1, 0.6588235, 1,
-0.1726587, 0.2703372, 0.6292139, 0, 1, 0.6627451, 1,
-0.1672534, -0.3893788, -2.868604, 0, 1, 0.6705883, 1,
-0.1648362, 2.158303, -0.2809594, 0, 1, 0.6745098, 1,
-0.1617985, 1.287169, 0.4875615, 0, 1, 0.682353, 1,
-0.1608339, -0.1725573, -1.812447, 0, 1, 0.6862745, 1,
-0.1589123, -0.2835599, -2.192795, 0, 1, 0.6941177, 1,
-0.156374, 0.8659337, 0.1324416, 0, 1, 0.7019608, 1,
-0.1557266, -2.027397, -2.864209, 0, 1, 0.7058824, 1,
-0.1534184, 0.2795617, -0.7363859, 0, 1, 0.7137255, 1,
-0.1511659, 0.4850049, 1.175215, 0, 1, 0.7176471, 1,
-0.1471135, -0.8844847, -2.513111, 0, 1, 0.7254902, 1,
-0.1457209, -0.1724555, -3.185165, 0, 1, 0.7294118, 1,
-0.143728, -2.309623, -4.112523, 0, 1, 0.7372549, 1,
-0.142638, 0.9697002, -0.7005278, 0, 1, 0.7411765, 1,
-0.1282535, 0.3297017, -0.3564175, 0, 1, 0.7490196, 1,
-0.1182394, -0.2302402, -3.385847, 0, 1, 0.7529412, 1,
-0.115649, 0.4805966, 1.448269, 0, 1, 0.7607843, 1,
-0.1123517, 0.534543, 0.6003458, 0, 1, 0.7647059, 1,
-0.1115718, -0.3967918, -1.977668, 0, 1, 0.772549, 1,
-0.1065993, 0.5758939, -0.5330017, 0, 1, 0.7764706, 1,
-0.1057428, -0.2264578, -2.696117, 0, 1, 0.7843137, 1,
-0.1040111, 0.2932619, 0.7971756, 0, 1, 0.7882353, 1,
-0.1014896, 0.1826111, 0.6244766, 0, 1, 0.7960784, 1,
-0.1012161, -0.428982, -5.017715, 0, 1, 0.8039216, 1,
-0.09582304, -0.07402799, -2.177656, 0, 1, 0.8078431, 1,
-0.0934699, -1.097467, -0.612384, 0, 1, 0.8156863, 1,
-0.091755, 2.257072, 1.677676, 0, 1, 0.8196079, 1,
-0.09004775, 1.135842, -0.2046846, 0, 1, 0.827451, 1,
-0.08872055, -0.6475464, -2.287577, 0, 1, 0.8313726, 1,
-0.08612334, -0.8155243, -3.926411, 0, 1, 0.8392157, 1,
-0.08377258, -0.431207, -2.376081, 0, 1, 0.8431373, 1,
-0.07733367, -0.3206532, -2.396479, 0, 1, 0.8509804, 1,
-0.07377601, -0.7241153, -5.48183, 0, 1, 0.854902, 1,
-0.07266843, 0.4311287, 0.1980163, 0, 1, 0.8627451, 1,
-0.07233728, 0.08759297, -0.934897, 0, 1, 0.8666667, 1,
-0.0720487, 1.571912, 0.2814072, 0, 1, 0.8745098, 1,
-0.06627965, 0.9970205, -1.919959, 0, 1, 0.8784314, 1,
-0.06579481, -0.9744222, -2.647653, 0, 1, 0.8862745, 1,
-0.06223951, 1.126312, -0.06357086, 0, 1, 0.8901961, 1,
-0.06002528, 0.8596395, 0.6564943, 0, 1, 0.8980392, 1,
-0.05639006, 0.15809, -0.2957359, 0, 1, 0.9058824, 1,
-0.05169916, -0.7701848, -2.362333, 0, 1, 0.9098039, 1,
-0.04688314, 1.141849, -0.3751965, 0, 1, 0.9176471, 1,
-0.04647451, 1.214434, 1.04864, 0, 1, 0.9215686, 1,
-0.04604752, 0.8707265, 0.3269334, 0, 1, 0.9294118, 1,
-0.04515471, -0.6562325, -1.172992, 0, 1, 0.9333333, 1,
-0.04442259, -0.5191236, -2.506534, 0, 1, 0.9411765, 1,
-0.04431724, 0.434525, 0.7507468, 0, 1, 0.945098, 1,
-0.04417088, -0.3067088, -3.064813, 0, 1, 0.9529412, 1,
-0.04225331, 0.7206572, -1.040709, 0, 1, 0.9568627, 1,
-0.03984733, 0.2226822, 0.6107215, 0, 1, 0.9647059, 1,
-0.03915275, 0.9585198, 0.6683045, 0, 1, 0.9686275, 1,
-0.0365638, -0.7991503, -3.069254, 0, 1, 0.9764706, 1,
-0.03450966, -0.182788, -2.782097, 0, 1, 0.9803922, 1,
-0.03064616, 0.9904459, 0.5402307, 0, 1, 0.9882353, 1,
-0.03064215, 0.8122539, -0.4265242, 0, 1, 0.9921569, 1,
-0.02578933, 1.600081, -0.08154672, 0, 1, 1, 1,
-0.02340226, -0.4384085, -2.557113, 0, 0.9921569, 1, 1,
-0.01908079, 0.364241, 0.8848799, 0, 0.9882353, 1, 1,
-0.01792915, -0.2238716, -1.842124, 0, 0.9803922, 1, 1,
-0.01594269, 0.05655517, -1.189465, 0, 0.9764706, 1, 1,
-0.01478221, -0.1739576, -2.300408, 0, 0.9686275, 1, 1,
-0.01422878, 0.4551859, 0.9485191, 0, 0.9647059, 1, 1,
-0.01403692, -0.2430762, -1.825915, 0, 0.9568627, 1, 1,
-0.01350731, -1.063292, -2.951192, 0, 0.9529412, 1, 1,
-0.01339996, 1.574436, -0.9897593, 0, 0.945098, 1, 1,
-0.007403692, 0.3925116, -0.05487002, 0, 0.9411765, 1, 1,
-0.006177081, 0.9960726, -0.1550201, 0, 0.9333333, 1, 1,
-0.005700845, -0.7991663, -4.73466, 0, 0.9294118, 1, 1,
-0.003497496, -0.5692143, -3.137887, 0, 0.9215686, 1, 1,
-0.00197582, -0.92816, -2.954596, 0, 0.9176471, 1, 1,
-0.00196619, 0.9241398, -0.3985195, 0, 0.9098039, 1, 1,
-0.001508098, -0.458205, -2.845408, 0, 0.9058824, 1, 1,
0.005146213, -0.2208509, 3.086477, 0, 0.8980392, 1, 1,
0.00808183, -1.136592, 3.610079, 0, 0.8901961, 1, 1,
0.01545561, -1.068873, 2.438375, 0, 0.8862745, 1, 1,
0.01561095, -0.1155837, 5.095537, 0, 0.8784314, 1, 1,
0.01947424, -1.334068, 3.881301, 0, 0.8745098, 1, 1,
0.02624826, -1.943688, 3.564209, 0, 0.8666667, 1, 1,
0.0312572, -1.407927, 1.867313, 0, 0.8627451, 1, 1,
0.03186771, -1.321671, 3.53524, 0, 0.854902, 1, 1,
0.03685303, 0.6137273, -1.068552, 0, 0.8509804, 1, 1,
0.03805744, -0.6325971, 3.954677, 0, 0.8431373, 1, 1,
0.04238633, 0.6463249, -0.7285757, 0, 0.8392157, 1, 1,
0.04615871, 0.2680298, -0.278927, 0, 0.8313726, 1, 1,
0.04686093, 0.8069388, -0.8876147, 0, 0.827451, 1, 1,
0.05339367, -0.1890896, 2.760367, 0, 0.8196079, 1, 1,
0.0644332, -1.037251, 3.418303, 0, 0.8156863, 1, 1,
0.07017475, 0.3345228, -0.5973222, 0, 0.8078431, 1, 1,
0.07175622, -0.01469381, 1.555354, 0, 0.8039216, 1, 1,
0.07276341, 1.646239, 2.071488, 0, 0.7960784, 1, 1,
0.08636314, -0.5111434, 2.924877, 0, 0.7882353, 1, 1,
0.08857878, 0.4870645, 0.9054869, 0, 0.7843137, 1, 1,
0.09384064, 0.6249284, 1.276958, 0, 0.7764706, 1, 1,
0.09745334, -0.1902035, 2.776078, 0, 0.772549, 1, 1,
0.099906, 0.7111878, -0.8184375, 0, 0.7647059, 1, 1,
0.1047923, 0.7667362, 0.07545015, 0, 0.7607843, 1, 1,
0.1059874, 0.6038594, 1.740105, 0, 0.7529412, 1, 1,
0.1101386, -0.05497833, 0.8956936, 0, 0.7490196, 1, 1,
0.1122763, 2.245315, -1.497436, 0, 0.7411765, 1, 1,
0.1146565, 0.1717734, 1.73085, 0, 0.7372549, 1, 1,
0.1160792, -0.4263459, 2.40097, 0, 0.7294118, 1, 1,
0.1185778, -0.2357735, 2.345029, 0, 0.7254902, 1, 1,
0.1231634, -1.278417, 2.988239, 0, 0.7176471, 1, 1,
0.1241856, 0.7673703, -0.5199687, 0, 0.7137255, 1, 1,
0.1272849, 1.464263, 0.1709361, 0, 0.7058824, 1, 1,
0.1330755, 0.4057205, 0.5394524, 0, 0.6980392, 1, 1,
0.1344083, -0.0987461, 2.013113, 0, 0.6941177, 1, 1,
0.1352757, -0.6752228, 3.90589, 0, 0.6862745, 1, 1,
0.13925, -0.7781083, 2.569839, 0, 0.682353, 1, 1,
0.1408012, -0.3577547, 4.292707, 0, 0.6745098, 1, 1,
0.141193, -1.594133, 2.561063, 0, 0.6705883, 1, 1,
0.1429339, -0.7547076, 1.737377, 0, 0.6627451, 1, 1,
0.1446496, -0.4405366, 1.997239, 0, 0.6588235, 1, 1,
0.1462177, -0.003804123, 1.914221, 0, 0.6509804, 1, 1,
0.1467257, -0.5218141, 3.079789, 0, 0.6470588, 1, 1,
0.1490361, -0.0330823, 2.738873, 0, 0.6392157, 1, 1,
0.1505498, -0.4465562, 3.362116, 0, 0.6352941, 1, 1,
0.1510144, 0.4564948, 1.429426, 0, 0.627451, 1, 1,
0.1523779, 0.9878224, -0.9744098, 0, 0.6235294, 1, 1,
0.1565533, -0.2389863, 2.411748, 0, 0.6156863, 1, 1,
0.1576332, -0.8968899, 2.8457, 0, 0.6117647, 1, 1,
0.1603922, 1.922979, -0.3085729, 0, 0.6039216, 1, 1,
0.167181, -1.06938, 3.772465, 0, 0.5960785, 1, 1,
0.1724792, -0.206709, 3.491776, 0, 0.5921569, 1, 1,
0.1751631, 0.4662541, -0.6806109, 0, 0.5843138, 1, 1,
0.1786821, 1.069859, 1.01638, 0, 0.5803922, 1, 1,
0.1813086, 0.0624245, -0.7085145, 0, 0.572549, 1, 1,
0.1823663, -1.059717, 2.182182, 0, 0.5686275, 1, 1,
0.1851891, -0.7773101, 2.303863, 0, 0.5607843, 1, 1,
0.1878961, -0.6539435, 3.059022, 0, 0.5568628, 1, 1,
0.1920999, -1.529546, 3.508656, 0, 0.5490196, 1, 1,
0.19721, -1.067547, 3.409483, 0, 0.5450981, 1, 1,
0.1990945, -0.205029, 3.799044, 0, 0.5372549, 1, 1,
0.2007426, 2.022955, -0.6724547, 0, 0.5333334, 1, 1,
0.2018821, -0.9434465, 2.015405, 0, 0.5254902, 1, 1,
0.2028125, -1.061454, 3.791151, 0, 0.5215687, 1, 1,
0.2052315, 0.7513033, 0.2994938, 0, 0.5137255, 1, 1,
0.2066054, 2.100952, -0.01379344, 0, 0.509804, 1, 1,
0.2093647, 1.687753, -0.8425321, 0, 0.5019608, 1, 1,
0.2101792, 0.234345, -0.02559868, 0, 0.4941176, 1, 1,
0.2107365, -0.639847, 2.169006, 0, 0.4901961, 1, 1,
0.2136954, 0.5294409, 0.2863002, 0, 0.4823529, 1, 1,
0.213935, 1.516924, 1.460243, 0, 0.4784314, 1, 1,
0.2168777, 0.7311809, 1.930865, 0, 0.4705882, 1, 1,
0.2169876, -1.70292, 1.580305, 0, 0.4666667, 1, 1,
0.2189228, -0.4835959, 3.352885, 0, 0.4588235, 1, 1,
0.2190691, -1.478204, 2.730998, 0, 0.454902, 1, 1,
0.224007, -1.036281, 2.273109, 0, 0.4470588, 1, 1,
0.2265981, 0.2112839, 0.1276095, 0, 0.4431373, 1, 1,
0.2268694, -0.3423499, 1.407557, 0, 0.4352941, 1, 1,
0.2272285, 0.3161062, 1.700754, 0, 0.4313726, 1, 1,
0.2272919, 1.531008, 1.94618, 0, 0.4235294, 1, 1,
0.2300248, 0.4985009, 0.7631758, 0, 0.4196078, 1, 1,
0.2427655, 0.4027499, 1.537203, 0, 0.4117647, 1, 1,
0.2448517, 0.6504738, 0.0005586674, 0, 0.4078431, 1, 1,
0.2456374, 1.171159, 0.4069977, 0, 0.4, 1, 1,
0.2463351, -0.9562675, 1.344996, 0, 0.3921569, 1, 1,
0.2495866, -0.0296697, 1.819379, 0, 0.3882353, 1, 1,
0.252262, 0.5050851, -0.3974836, 0, 0.3803922, 1, 1,
0.2540081, 0.8436403, 0.7559084, 0, 0.3764706, 1, 1,
0.2583282, 0.45881, 1.776258, 0, 0.3686275, 1, 1,
0.2600274, -0.85944, 3.240244, 0, 0.3647059, 1, 1,
0.2611313, 0.212171, 1.23774, 0, 0.3568628, 1, 1,
0.2675378, 1.700302, -0.1692095, 0, 0.3529412, 1, 1,
0.2682258, -0.01088561, 1.520465, 0, 0.345098, 1, 1,
0.2751123, -0.01842214, -0.155587, 0, 0.3411765, 1, 1,
0.2835639, 0.3290141, 0.694784, 0, 0.3333333, 1, 1,
0.2843515, 0.5840372, -0.1065902, 0, 0.3294118, 1, 1,
0.2854131, 0.786105, -0.1468657, 0, 0.3215686, 1, 1,
0.2910437, 0.213107, 1.654681, 0, 0.3176471, 1, 1,
0.2927899, -1.124982, 2.914321, 0, 0.3098039, 1, 1,
0.2990852, -0.6656145, 2.415715, 0, 0.3058824, 1, 1,
0.3032108, 0.2444585, -0.188349, 0, 0.2980392, 1, 1,
0.3056217, 0.399352, 1.079264, 0, 0.2901961, 1, 1,
0.3062634, -2.260363, 4.807779, 0, 0.2862745, 1, 1,
0.3065775, 0.8250886, 2.371156, 0, 0.2784314, 1, 1,
0.3068887, 0.2786757, 1.382327, 0, 0.2745098, 1, 1,
0.3076392, -0.8184593, 4.300304, 0, 0.2666667, 1, 1,
0.307665, -0.3448627, 2.268302, 0, 0.2627451, 1, 1,
0.3110691, 0.915502, -0.1550511, 0, 0.254902, 1, 1,
0.3119878, 1.336403, 0.6782983, 0, 0.2509804, 1, 1,
0.3155678, 1.456463, 1.922091, 0, 0.2431373, 1, 1,
0.3162102, -0.1579425, 1.309706, 0, 0.2392157, 1, 1,
0.3201571, 1.264459, -0.04131164, 0, 0.2313726, 1, 1,
0.3393281, 0.3260292, 0.175559, 0, 0.227451, 1, 1,
0.3423719, -1.119774, 3.440902, 0, 0.2196078, 1, 1,
0.3429642, -0.009989339, 1.272003, 0, 0.2156863, 1, 1,
0.3435428, 0.4927384, 0.4842798, 0, 0.2078431, 1, 1,
0.3469758, 0.6732134, -0.2588786, 0, 0.2039216, 1, 1,
0.3490795, 0.4619864, -0.4716963, 0, 0.1960784, 1, 1,
0.350839, 1.88934, 0.8821984, 0, 0.1882353, 1, 1,
0.351572, -2.180555, 3.703263, 0, 0.1843137, 1, 1,
0.3531341, 0.1221158, 0.6135681, 0, 0.1764706, 1, 1,
0.3533262, -0.028958, 2.194147, 0, 0.172549, 1, 1,
0.3551895, 0.2618887, 0.1202511, 0, 0.1647059, 1, 1,
0.3565219, 0.7180414, 1.866439, 0, 0.1607843, 1, 1,
0.3612046, 0.1504278, 2.517499, 0, 0.1529412, 1, 1,
0.3621314, -0.3205707, 1.031342, 0, 0.1490196, 1, 1,
0.3649482, 0.5498239, -0.2605902, 0, 0.1411765, 1, 1,
0.3654928, -0.8258533, 2.599124, 0, 0.1372549, 1, 1,
0.3730515, 0.3494417, 1.680651, 0, 0.1294118, 1, 1,
0.3745358, 1.845371, 0.586558, 0, 0.1254902, 1, 1,
0.3789615, 0.2898208, 0.8539358, 0, 0.1176471, 1, 1,
0.3797441, 0.5911166, 1.56105, 0, 0.1137255, 1, 1,
0.3840154, 0.981458, 0.3148884, 0, 0.1058824, 1, 1,
0.3856407, -1.419859, 0.9731134, 0, 0.09803922, 1, 1,
0.3874134, -1.68455, 2.567798, 0, 0.09411765, 1, 1,
0.3911945, 0.890879, -0.5737571, 0, 0.08627451, 1, 1,
0.3958957, -0.4678744, 1.370816, 0, 0.08235294, 1, 1,
0.3961985, 0.8114124, 1.342951, 0, 0.07450981, 1, 1,
0.4006226, 0.1675442, 1.899346, 0, 0.07058824, 1, 1,
0.4018361, -0.3019124, 2.486934, 0, 0.0627451, 1, 1,
0.4056294, 1.653658, 2.024523, 0, 0.05882353, 1, 1,
0.4069102, -1.119401, 1.012006, 0, 0.05098039, 1, 1,
0.4115947, -1.127881, 2.939505, 0, 0.04705882, 1, 1,
0.4171906, -0.1500539, 1.086446, 0, 0.03921569, 1, 1,
0.4181034, 0.1711069, 1.049762, 0, 0.03529412, 1, 1,
0.4209402, 0.2564861, 1.425245, 0, 0.02745098, 1, 1,
0.4219845, -0.410577, 1.907597, 0, 0.02352941, 1, 1,
0.4254856, 1.345687, -0.0987501, 0, 0.01568628, 1, 1,
0.4323726, 0.5408425, 0.4249132, 0, 0.01176471, 1, 1,
0.4362049, 2.501624, -0.4848634, 0, 0.003921569, 1, 1,
0.4362288, -0.2973075, 1.917663, 0.003921569, 0, 1, 1,
0.4367656, -1.608734, 4.317302, 0.007843138, 0, 1, 1,
0.4384955, -1.391513, 2.212569, 0.01568628, 0, 1, 1,
0.4402605, -1.389603, 2.728155, 0.01960784, 0, 1, 1,
0.4438253, 0.700879, 0.5306494, 0.02745098, 0, 1, 1,
0.4490612, -0.5872074, 2.688949, 0.03137255, 0, 1, 1,
0.449335, 1.614694, -0.4437386, 0.03921569, 0, 1, 1,
0.4579026, 0.7839221, -1.277872, 0.04313726, 0, 1, 1,
0.4603445, 2.66906, 0.120698, 0.05098039, 0, 1, 1,
0.4607008, 0.2521458, 2.6263, 0.05490196, 0, 1, 1,
0.4630119, 0.3650589, 1.316116, 0.0627451, 0, 1, 1,
0.4634019, -0.5068293, 2.390957, 0.06666667, 0, 1, 1,
0.4654824, -0.2943275, 2.378133, 0.07450981, 0, 1, 1,
0.4670987, -1.197966, 2.711396, 0.07843138, 0, 1, 1,
0.4676822, -1.116622, 2.341014, 0.08627451, 0, 1, 1,
0.4700034, 0.1967146, 2.085631, 0.09019608, 0, 1, 1,
0.4729751, 0.4062077, 2.283864, 0.09803922, 0, 1, 1,
0.4748374, -0.02700364, 1.596107, 0.1058824, 0, 1, 1,
0.4748641, 0.5340512, 1.206069, 0.1098039, 0, 1, 1,
0.48019, -1.204561, 3.042744, 0.1176471, 0, 1, 1,
0.4843311, -0.2101699, 1.400712, 0.1215686, 0, 1, 1,
0.485811, -0.3571966, 2.123899, 0.1294118, 0, 1, 1,
0.4898785, 1.766109, 0.06042786, 0.1333333, 0, 1, 1,
0.4902559, 0.383837, -0.1642842, 0.1411765, 0, 1, 1,
0.49104, 0.2404898, 0.5592341, 0.145098, 0, 1, 1,
0.5008933, 0.2792859, 1.621188, 0.1529412, 0, 1, 1,
0.5024872, -0.2989461, 1.163678, 0.1568628, 0, 1, 1,
0.5041366, -0.6706358, 3.836427, 0.1647059, 0, 1, 1,
0.5067258, -0.736622, 5.007085, 0.1686275, 0, 1, 1,
0.510079, -0.7073649, 2.613824, 0.1764706, 0, 1, 1,
0.5114897, -0.0108038, 2.042184, 0.1803922, 0, 1, 1,
0.5140301, 1.502091, 2.322094, 0.1882353, 0, 1, 1,
0.5145866, 0.3530846, 1.049994, 0.1921569, 0, 1, 1,
0.51504, -0.9356789, 1.250984, 0.2, 0, 1, 1,
0.5174877, -0.436478, -0.1818204, 0.2078431, 0, 1, 1,
0.5189673, 0.05428895, 3.267224, 0.2117647, 0, 1, 1,
0.5236752, -0.6462106, 3.439872, 0.2196078, 0, 1, 1,
0.5292045, 0.527178, 1.735841, 0.2235294, 0, 1, 1,
0.5334174, 0.585938, 0.9865415, 0.2313726, 0, 1, 1,
0.5365533, -0.9216058, 3.256884, 0.2352941, 0, 1, 1,
0.5416076, 0.09693138, 1.858222, 0.2431373, 0, 1, 1,
0.5446149, 0.09574434, 2.152815, 0.2470588, 0, 1, 1,
0.5461092, 0.3110393, -0.1352828, 0.254902, 0, 1, 1,
0.5494372, -0.2594347, 0.1793805, 0.2588235, 0, 1, 1,
0.5502518, -0.3227407, 4.036057, 0.2666667, 0, 1, 1,
0.5516855, -0.307061, 1.467907, 0.2705882, 0, 1, 1,
0.5533358, -0.9514247, 4.653211, 0.2784314, 0, 1, 1,
0.5541257, -0.7128361, 0.6251861, 0.282353, 0, 1, 1,
0.5553105, 0.3454235, 2.363414, 0.2901961, 0, 1, 1,
0.556812, 1.254382, -0.9928358, 0.2941177, 0, 1, 1,
0.5594295, -0.5063753, 1.212439, 0.3019608, 0, 1, 1,
0.5594496, 0.6656647, 1.370048, 0.3098039, 0, 1, 1,
0.5624704, -1.503849, 2.895581, 0.3137255, 0, 1, 1,
0.5662975, 0.8659419, 0.06819634, 0.3215686, 0, 1, 1,
0.5663522, -0.4063498, 0.01160016, 0.3254902, 0, 1, 1,
0.5693342, 0.3961063, 0.09718722, 0.3333333, 0, 1, 1,
0.5696189, -0.09072474, 2.989237, 0.3372549, 0, 1, 1,
0.5760782, 1.009057, 1.950256, 0.345098, 0, 1, 1,
0.578815, -0.3906237, 3.236321, 0.3490196, 0, 1, 1,
0.5793456, 0.2710332, 0.429216, 0.3568628, 0, 1, 1,
0.5794912, -0.9753526, 0.1432975, 0.3607843, 0, 1, 1,
0.5798951, 0.8540974, 2.061276, 0.3686275, 0, 1, 1,
0.5802453, -0.3659525, 2.865593, 0.372549, 0, 1, 1,
0.5804235, 1.219925, -0.3943264, 0.3803922, 0, 1, 1,
0.5815426, 0.9088401, 1.093466, 0.3843137, 0, 1, 1,
0.5831734, 0.08558498, 2.052122, 0.3921569, 0, 1, 1,
0.5882172, 0.7119946, 0.5302237, 0.3960784, 0, 1, 1,
0.5904428, 0.6443345, 1.233093, 0.4039216, 0, 1, 1,
0.5907425, 1.010026, 1.476895, 0.4117647, 0, 1, 1,
0.5912581, 1.571675, 1.684, 0.4156863, 0, 1, 1,
0.5923575, -0.6584374, 3.874171, 0.4235294, 0, 1, 1,
0.5937783, 0.3171806, 0.8817127, 0.427451, 0, 1, 1,
0.5946568, 0.5234048, 0.9351349, 0.4352941, 0, 1, 1,
0.6027299, -0.1285509, 0.4780585, 0.4392157, 0, 1, 1,
0.6034626, 0.6640506, 1.378565, 0.4470588, 0, 1, 1,
0.6130685, -1.348284, 2.5667, 0.4509804, 0, 1, 1,
0.6167785, -0.4440525, 0.2825437, 0.4588235, 0, 1, 1,
0.618323, 0.9621581, -0.6374243, 0.4627451, 0, 1, 1,
0.619381, 1.734892, -1.006893, 0.4705882, 0, 1, 1,
0.6205325, 1.275165, 0.429801, 0.4745098, 0, 1, 1,
0.6239318, -1.638407, 3.432085, 0.4823529, 0, 1, 1,
0.6259879, 0.781886, 1.233417, 0.4862745, 0, 1, 1,
0.6294129, 2.189142, -0.2156158, 0.4941176, 0, 1, 1,
0.6297517, -0.4526233, 0.8581597, 0.5019608, 0, 1, 1,
0.6429679, 0.05504795, 2.453816, 0.5058824, 0, 1, 1,
0.6438956, 0.1503659, -0.1359853, 0.5137255, 0, 1, 1,
0.6450312, -1.908006, 5.081738, 0.5176471, 0, 1, 1,
0.6463813, -0.1573264, 2.56484, 0.5254902, 0, 1, 1,
0.6499023, -0.6648103, 4.372694, 0.5294118, 0, 1, 1,
0.6522607, 0.02531641, 1.707465, 0.5372549, 0, 1, 1,
0.6542435, 0.005394658, 2.59692, 0.5411765, 0, 1, 1,
0.6555013, 0.7057234, 1.426504, 0.5490196, 0, 1, 1,
0.6564668, -1.100376, 4.175819, 0.5529412, 0, 1, 1,
0.6594013, 0.1489846, -0.1793338, 0.5607843, 0, 1, 1,
0.6644858, 2.741326, 0.1559876, 0.5647059, 0, 1, 1,
0.6684384, 1.953136, 1.811296, 0.572549, 0, 1, 1,
0.6687259, 0.2688673, 1.093817, 0.5764706, 0, 1, 1,
0.6717112, -0.05676615, 2.236134, 0.5843138, 0, 1, 1,
0.6731885, 1.445842, 0.9240435, 0.5882353, 0, 1, 1,
0.6736091, -1.570684, 1.970859, 0.5960785, 0, 1, 1,
0.6745175, -1.205547, 4.741785, 0.6039216, 0, 1, 1,
0.6761118, 0.8783796, 0.5455143, 0.6078432, 0, 1, 1,
0.6810626, -1.158353, 2.358835, 0.6156863, 0, 1, 1,
0.6845751, -1.125345, 1.819564, 0.6196079, 0, 1, 1,
0.6853917, 2.540493, 0.07031704, 0.627451, 0, 1, 1,
0.6991147, 0.7717478, 0.9963431, 0.6313726, 0, 1, 1,
0.6991835, -0.4646451, 1.841085, 0.6392157, 0, 1, 1,
0.7038772, -0.8338689, 1.970687, 0.6431373, 0, 1, 1,
0.7076099, -1.162626, 1.30522, 0.6509804, 0, 1, 1,
0.7140133, -0.2980788, 1.056301, 0.654902, 0, 1, 1,
0.7142128, -1.60907, 3.088496, 0.6627451, 0, 1, 1,
0.7149753, 1.87757, -0.03410048, 0.6666667, 0, 1, 1,
0.7163255, -1.032691, 2.335935, 0.6745098, 0, 1, 1,
0.7236475, 0.4097932, 2.11213, 0.6784314, 0, 1, 1,
0.7247502, 2.427215, -0.7291089, 0.6862745, 0, 1, 1,
0.725939, 1.000704, 0.2775725, 0.6901961, 0, 1, 1,
0.730114, 1.146446, 0.03566753, 0.6980392, 0, 1, 1,
0.7332867, 0.3384669, 0.7624027, 0.7058824, 0, 1, 1,
0.7360945, 0.02664768, 1.062017, 0.7098039, 0, 1, 1,
0.7368585, 1.719925, 0.2849783, 0.7176471, 0, 1, 1,
0.7429873, 1.279504, 0.3093213, 0.7215686, 0, 1, 1,
0.7445138, -0.6829076, 1.850614, 0.7294118, 0, 1, 1,
0.7472093, 0.07906662, 0.3793114, 0.7333333, 0, 1, 1,
0.7478673, 0.625265, 1.000391, 0.7411765, 0, 1, 1,
0.7513016, -0.2013044, 2.484699, 0.7450981, 0, 1, 1,
0.7534037, -0.6252069, 2.088968, 0.7529412, 0, 1, 1,
0.7544407, -1.049666, 0.3677182, 0.7568628, 0, 1, 1,
0.7607185, -0.2582506, 1.230451, 0.7647059, 0, 1, 1,
0.765502, -0.7281849, 4.520671, 0.7686275, 0, 1, 1,
0.7665254, 1.41602, 0.7424547, 0.7764706, 0, 1, 1,
0.7669904, -0.3163505, 1.745514, 0.7803922, 0, 1, 1,
0.7683619, 0.4347427, 0.09794984, 0.7882353, 0, 1, 1,
0.7694911, 1.465233, 1.756889, 0.7921569, 0, 1, 1,
0.7699584, 0.4082868, 1.138685, 0.8, 0, 1, 1,
0.7754879, -0.2915402, 1.570109, 0.8078431, 0, 1, 1,
0.7804453, -0.2462186, 0.5676542, 0.8117647, 0, 1, 1,
0.7848134, -1.132232, 4.046341, 0.8196079, 0, 1, 1,
0.7876108, 2.116784, 1.713316, 0.8235294, 0, 1, 1,
0.7944943, 2.348818, 0.5932047, 0.8313726, 0, 1, 1,
0.7967546, -1.553609, 4.072103, 0.8352941, 0, 1, 1,
0.79847, 1.649728, 2.191669, 0.8431373, 0, 1, 1,
0.799318, -0.02920401, 2.315018, 0.8470588, 0, 1, 1,
0.8007047, 1.591757, -0.3549536, 0.854902, 0, 1, 1,
0.8086886, 0.9731511, -0.1082791, 0.8588235, 0, 1, 1,
0.8112828, -1.109757, 3.34244, 0.8666667, 0, 1, 1,
0.811363, 0.2269309, 0.3247677, 0.8705882, 0, 1, 1,
0.8136533, 0.472243, 0.9075326, 0.8784314, 0, 1, 1,
0.8137598, 1.50542, 0.1141345, 0.8823529, 0, 1, 1,
0.8161305, -0.3237234, 2.390543, 0.8901961, 0, 1, 1,
0.8166899, -0.3004211, 3.684455, 0.8941177, 0, 1, 1,
0.818175, 2.125486, -0.235291, 0.9019608, 0, 1, 1,
0.8189003, 0.1774225, 0.1504584, 0.9098039, 0, 1, 1,
0.8190321, -0.4203697, 3.880614, 0.9137255, 0, 1, 1,
0.819391, 0.1851096, 1.424116, 0.9215686, 0, 1, 1,
0.8304495, -0.004791563, 2.082665, 0.9254902, 0, 1, 1,
0.8407061, -0.6849182, 1.316121, 0.9333333, 0, 1, 1,
0.8428365, 0.5659848, -1.22552, 0.9372549, 0, 1, 1,
0.8431726, -0.02004606, 1.770437, 0.945098, 0, 1, 1,
0.8462613, -0.8301225, 0.7195832, 0.9490196, 0, 1, 1,
0.8513533, -0.7583039, 2.476014, 0.9568627, 0, 1, 1,
0.853887, 0.2746332, 0.6317455, 0.9607843, 0, 1, 1,
0.855269, -0.4295926, 2.917969, 0.9686275, 0, 1, 1,
0.8585618, 1.612896, 1.644641, 0.972549, 0, 1, 1,
0.8595173, 0.8085192, 1.609342, 0.9803922, 0, 1, 1,
0.8851609, -0.5049332, -0.05702014, 0.9843137, 0, 1, 1,
0.8883834, 0.3890364, 1.0734, 0.9921569, 0, 1, 1,
0.8931162, -0.6605332, 2.015179, 0.9960784, 0, 1, 1,
0.8976116, 0.6334375, -0.7645688, 1, 0, 0.9960784, 1,
0.9048619, -0.4772266, 0.3448665, 1, 0, 0.9882353, 1,
0.9066045, 1.072576, 0.8675058, 1, 0, 0.9843137, 1,
0.9158735, 1.371388, -0.04854829, 1, 0, 0.9764706, 1,
0.9189366, -0.2266527, 2.441455, 1, 0, 0.972549, 1,
0.9201792, -1.481842, 2.082314, 1, 0, 0.9647059, 1,
0.9294981, 1.079736, 0.03166197, 1, 0, 0.9607843, 1,
0.950294, 0.5196816, 1.382708, 1, 0, 0.9529412, 1,
0.9545818, 2.918003, 1.426072, 1, 0, 0.9490196, 1,
0.954765, 0.8642253, 0.3026, 1, 0, 0.9411765, 1,
0.9556881, -1.821711, 2.978014, 1, 0, 0.9372549, 1,
0.9559293, 0.2371412, 0.6402798, 1, 0, 0.9294118, 1,
0.9584792, 0.00390872, 0.4060169, 1, 0, 0.9254902, 1,
0.9665884, -0.1444433, 0.4239771, 1, 0, 0.9176471, 1,
0.9669105, 0.658074, 2.042584, 1, 0, 0.9137255, 1,
0.9769737, 1.100101, -0.2734828, 1, 0, 0.9058824, 1,
0.9797896, -0.3340716, 2.092986, 1, 0, 0.9019608, 1,
0.9869969, 0.3074836, 1.318493, 1, 0, 0.8941177, 1,
0.9878156, -1.240054, 2.15655, 1, 0, 0.8862745, 1,
0.988241, -0.01169715, 1.492093, 1, 0, 0.8823529, 1,
0.9923096, -0.1563356, 2.001339, 1, 0, 0.8745098, 1,
1.004096, -0.5451168, 2.646007, 1, 0, 0.8705882, 1,
1.008028, -2.153091, 2.039787, 1, 0, 0.8627451, 1,
1.009236, 0.5123419, 0.7001638, 1, 0, 0.8588235, 1,
1.013211, 0.3913865, 2.326765, 1, 0, 0.8509804, 1,
1.022905, 0.5572199, 1.257976, 1, 0, 0.8470588, 1,
1.023193, 0.3447641, 1.385726, 1, 0, 0.8392157, 1,
1.02864, 1.010047, 0.3292185, 1, 0, 0.8352941, 1,
1.028672, 2.522938, -0.4018636, 1, 0, 0.827451, 1,
1.029245, 0.02381852, 0.8755065, 1, 0, 0.8235294, 1,
1.030791, 1.360426, 1.437935, 1, 0, 0.8156863, 1,
1.031445, 2.019107, 1.673761, 1, 0, 0.8117647, 1,
1.041622, 0.823171, 1.024234, 1, 0, 0.8039216, 1,
1.04907, 0.784643, 0.9399611, 1, 0, 0.7960784, 1,
1.050757, 0.06767805, 0.9883584, 1, 0, 0.7921569, 1,
1.051816, -0.3068075, 2.703923, 1, 0, 0.7843137, 1,
1.058918, -0.4890012, 3.175311, 1, 0, 0.7803922, 1,
1.068689, 0.3489406, 0.1761487, 1, 0, 0.772549, 1,
1.073051, 1.129474, -1.057905, 1, 0, 0.7686275, 1,
1.083134, 1.19491, -0.6724424, 1, 0, 0.7607843, 1,
1.084225, -0.06657282, 1.237606, 1, 0, 0.7568628, 1,
1.088758, 0.3034742, 0.1963948, 1, 0, 0.7490196, 1,
1.096745, -2.728659, 3.135458, 1, 0, 0.7450981, 1,
1.103128, -0.438588, 1.713592, 1, 0, 0.7372549, 1,
1.104043, -0.8772372, 1.994416, 1, 0, 0.7333333, 1,
1.105574, -0.909906, 2.592712, 1, 0, 0.7254902, 1,
1.122232, -0.3023288, 2.336868, 1, 0, 0.7215686, 1,
1.125727, -0.4022732, 2.036414, 1, 0, 0.7137255, 1,
1.127766, -1.130309, 3.257832, 1, 0, 0.7098039, 1,
1.131244, 0.2779087, 1.998137, 1, 0, 0.7019608, 1,
1.160055, 1.922249, 0.08554393, 1, 0, 0.6941177, 1,
1.170139, -0.3255661, 3.291953, 1, 0, 0.6901961, 1,
1.171954, 1.714013, -0.3641495, 1, 0, 0.682353, 1,
1.175475, 0.6195018, 2.118057, 1, 0, 0.6784314, 1,
1.17555, 0.07306179, 1.679972, 1, 0, 0.6705883, 1,
1.190041, -0.1057737, 3.496314, 1, 0, 0.6666667, 1,
1.205976, -1.626901, 2.909479, 1, 0, 0.6588235, 1,
1.214031, 1.559225, -1.330753, 1, 0, 0.654902, 1,
1.217511, 0.7691785, 0.7896467, 1, 0, 0.6470588, 1,
1.222313, -0.01976997, 1.560898, 1, 0, 0.6431373, 1,
1.231411, -0.8001046, 4.13856, 1, 0, 0.6352941, 1,
1.235532, 0.727369, -0.3062263, 1, 0, 0.6313726, 1,
1.238683, -0.6816037, 2.440675, 1, 0, 0.6235294, 1,
1.245049, -0.470809, 1.623205, 1, 0, 0.6196079, 1,
1.245857, 0.03193613, 1.735484, 1, 0, 0.6117647, 1,
1.257068, -0.07143249, 1.664732, 1, 0, 0.6078432, 1,
1.262382, 0.6344972, 1.816775, 1, 0, 0.6, 1,
1.264727, 1.097311, 0.7899892, 1, 0, 0.5921569, 1,
1.265664, -1.074632, 3.012207, 1, 0, 0.5882353, 1,
1.273402, -0.09436581, -0.01452238, 1, 0, 0.5803922, 1,
1.292435, -0.2817459, 1.414898, 1, 0, 0.5764706, 1,
1.302101, 1.395953, -0.9662639, 1, 0, 0.5686275, 1,
1.309789, -1.281259, 1.806422, 1, 0, 0.5647059, 1,
1.326652, -1.11537, 2.421548, 1, 0, 0.5568628, 1,
1.330666, -0.4721566, 3.096385, 1, 0, 0.5529412, 1,
1.33292, 0.175232, 2.067805, 1, 0, 0.5450981, 1,
1.342451, -0.603954, 2.585315, 1, 0, 0.5411765, 1,
1.343792, -1.054187, 3.095324, 1, 0, 0.5333334, 1,
1.358116, 1.301562, 0.6852092, 1, 0, 0.5294118, 1,
1.363088, -0.6729391, 2.11962, 1, 0, 0.5215687, 1,
1.3704, -1.010165, 1.949478, 1, 0, 0.5176471, 1,
1.380496, -0.2182393, 2.009267, 1, 0, 0.509804, 1,
1.386703, -1.094307, 4.208824, 1, 0, 0.5058824, 1,
1.405781, -1.143516, 2.030778, 1, 0, 0.4980392, 1,
1.406513, 0.02795875, 3.028858, 1, 0, 0.4901961, 1,
1.410068, -0.2716561, 1.440563, 1, 0, 0.4862745, 1,
1.412585, 0.04331869, 0.9833819, 1, 0, 0.4784314, 1,
1.419669, 0.7725917, 2.295493, 1, 0, 0.4745098, 1,
1.420723, 0.4256315, 0.523767, 1, 0, 0.4666667, 1,
1.430061, -0.742992, 0.6800419, 1, 0, 0.4627451, 1,
1.444455, -0.194663, -0.3298904, 1, 0, 0.454902, 1,
1.461401, -2.446342, 1.77261, 1, 0, 0.4509804, 1,
1.472798, 1.470195, 1.167945, 1, 0, 0.4431373, 1,
1.480357, 1.112485, -0.3299384, 1, 0, 0.4392157, 1,
1.481849, 1.136169, -1.094423, 1, 0, 0.4313726, 1,
1.494317, 0.4433073, 0.3968256, 1, 0, 0.427451, 1,
1.496704, -1.754554, 0.5710937, 1, 0, 0.4196078, 1,
1.516522, 0.6815633, -0.2573663, 1, 0, 0.4156863, 1,
1.531603, 1.424462, 1.330797, 1, 0, 0.4078431, 1,
1.559361, -0.8721707, 1.924563, 1, 0, 0.4039216, 1,
1.561746, 0.9722697, 2.392234, 1, 0, 0.3960784, 1,
1.57157, -0.1561983, 1.815524, 1, 0, 0.3882353, 1,
1.572016, 0.7992097, 0.8250861, 1, 0, 0.3843137, 1,
1.629539, 0.3344456, 1.046628, 1, 0, 0.3764706, 1,
1.637104, 0.1607179, -0.4685794, 1, 0, 0.372549, 1,
1.637712, -0.05671175, 2.420986, 1, 0, 0.3647059, 1,
1.647137, 1.932518, -0.8450896, 1, 0, 0.3607843, 1,
1.652923, 0.294663, 1.797321, 1, 0, 0.3529412, 1,
1.653646, 1.294052, 1.263361, 1, 0, 0.3490196, 1,
1.653882, -0.7948249, 2.214664, 1, 0, 0.3411765, 1,
1.656044, -0.4711162, 1.936168, 1, 0, 0.3372549, 1,
1.658174, -0.7081988, 2.588632, 1, 0, 0.3294118, 1,
1.670882, -0.03192792, 0.1952043, 1, 0, 0.3254902, 1,
1.673514, -0.6822052, 1.613582, 1, 0, 0.3176471, 1,
1.673851, 0.7808602, 2.797026, 1, 0, 0.3137255, 1,
1.67443, 0.6579759, 2.110142, 1, 0, 0.3058824, 1,
1.675463, -1.113727, 1.189226, 1, 0, 0.2980392, 1,
1.699284, 1.461583, 0.8319959, 1, 0, 0.2941177, 1,
1.708619, 0.3753474, 2.22742, 1, 0, 0.2862745, 1,
1.723384, -0.5428629, 0.5385335, 1, 0, 0.282353, 1,
1.734733, -0.5387241, 1.517156, 1, 0, 0.2745098, 1,
1.741813, -0.7800464, 1.817406, 1, 0, 0.2705882, 1,
1.742045, 0.6339685, 1.471513, 1, 0, 0.2627451, 1,
1.764342, -1.771666, 1.853257, 1, 0, 0.2588235, 1,
1.776065, 0.4598361, 1.065213, 1, 0, 0.2509804, 1,
1.808677, 0.7469233, 0.8487742, 1, 0, 0.2470588, 1,
1.815768, -0.6574802, 0.612348, 1, 0, 0.2392157, 1,
1.817245, 0.6560962, -0.8960671, 1, 0, 0.2352941, 1,
1.827164, 0.1279133, 1.901092, 1, 0, 0.227451, 1,
1.848858, 0.1602415, 3.829016, 1, 0, 0.2235294, 1,
1.855243, -0.2201325, 1.242129, 1, 0, 0.2156863, 1,
1.873052, -0.4740115, 2.403391, 1, 0, 0.2117647, 1,
1.874577, -0.3256634, 1.715437, 1, 0, 0.2039216, 1,
1.881848, -0.6964031, 1.78536, 1, 0, 0.1960784, 1,
1.883276, 0.4677569, 1.868316, 1, 0, 0.1921569, 1,
1.908281, -1.080464, 1.389119, 1, 0, 0.1843137, 1,
1.973021, -0.2610377, 1.070545, 1, 0, 0.1803922, 1,
1.982744, -0.5897861, 1.565316, 1, 0, 0.172549, 1,
1.984411, 0.5282515, 0.660313, 1, 0, 0.1686275, 1,
1.989748, 2.017282, 1.901674, 1, 0, 0.1607843, 1,
1.990405, -0.02420517, 3.342748, 1, 0, 0.1568628, 1,
2.010068, -0.2293103, 3.189308, 1, 0, 0.1490196, 1,
2.012391, -1.98194, 2.526557, 1, 0, 0.145098, 1,
2.024591, 0.2841247, 1.344971, 1, 0, 0.1372549, 1,
2.029301, -0.9234065, 2.259686, 1, 0, 0.1333333, 1,
2.036664, 0.3333943, 0.7876893, 1, 0, 0.1254902, 1,
2.043513, 0.3964144, -1.086748, 1, 0, 0.1215686, 1,
2.075047, -0.9914446, 2.259437, 1, 0, 0.1137255, 1,
2.086146, 0.6388649, 0.7626353, 1, 0, 0.1098039, 1,
2.092446, 0.974099, 1.070873, 1, 0, 0.1019608, 1,
2.119063, -1.101602, 1.806867, 1, 0, 0.09411765, 1,
2.166349, 1.287141, 0.2396174, 1, 0, 0.09019608, 1,
2.228389, 1.195405, 0.4625849, 1, 0, 0.08235294, 1,
2.250385, 1.92703, 2.606321, 1, 0, 0.07843138, 1,
2.267861, -1.189797, 1.903719, 1, 0, 0.07058824, 1,
2.273224, -0.392469, 2.415938, 1, 0, 0.06666667, 1,
2.28184, -0.38594, 1.365939, 1, 0, 0.05882353, 1,
2.3056, 1.517235, 1.36177, 1, 0, 0.05490196, 1,
2.333447, 0.8934339, 0.6115419, 1, 0, 0.04705882, 1,
2.461185, -2.883128, 1.743541, 1, 0, 0.04313726, 1,
2.46209, -1.098428, 1.809524, 1, 0, 0.03529412, 1,
2.513686, -0.09656112, 1.230986, 1, 0, 0.03137255, 1,
2.589907, -0.2036258, 3.035516, 1, 0, 0.02352941, 1,
2.604794, -0.767238, 3.149724, 1, 0, 0.01960784, 1,
2.66498, -0.0007624089, 1.882957, 1, 0, 0.01176471, 1,
2.782239, -0.04456791, 1.06574, 1, 0, 0.007843138, 1
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
-0.2185068, -4.114948, -7.274693, 0, -0.5, 0.5, 0.5,
-0.2185068, -4.114948, -7.274693, 1, -0.5, 0.5, 0.5,
-0.2185068, -4.114948, -7.274693, 1, 1.5, 0.5, 0.5,
-0.2185068, -4.114948, -7.274693, 0, 1.5, 0.5, 0.5
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
-4.236506, -0.08729649, -7.274693, 0, -0.5, 0.5, 0.5,
-4.236506, -0.08729649, -7.274693, 1, -0.5, 0.5, 0.5,
-4.236506, -0.08729649, -7.274693, 1, 1.5, 0.5, 0.5,
-4.236506, -0.08729649, -7.274693, 0, 1.5, 0.5, 0.5
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
-4.236506, -4.114948, -0.1931465, 0, -0.5, 0.5, 0.5,
-4.236506, -4.114948, -0.1931465, 1, -0.5, 0.5, 0.5,
-4.236506, -4.114948, -0.1931465, 1, 1.5, 0.5, 0.5,
-4.236506, -4.114948, -0.1931465, 0, 1.5, 0.5, 0.5
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
-3, -3.18549, -5.64049,
2, -3.18549, -5.64049,
-3, -3.18549, -5.64049,
-3, -3.3404, -5.912858,
-2, -3.18549, -5.64049,
-2, -3.3404, -5.912858,
-1, -3.18549, -5.64049,
-1, -3.3404, -5.912858,
0, -3.18549, -5.64049,
0, -3.3404, -5.912858,
1, -3.18549, -5.64049,
1, -3.3404, -5.912858,
2, -3.18549, -5.64049,
2, -3.3404, -5.912858
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
-3, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
-3, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
-3, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
-3, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5,
-2, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
-2, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
-2, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
-2, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5,
-1, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
-1, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
-1, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
-1, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5,
0, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
0, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
0, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
0, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5,
1, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
1, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
1, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
1, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5,
2, -3.650219, -6.457592, 0, -0.5, 0.5, 0.5,
2, -3.650219, -6.457592, 1, -0.5, 0.5, 0.5,
2, -3.650219, -6.457592, 1, 1.5, 0.5, 0.5,
2, -3.650219, -6.457592, 0, 1.5, 0.5, 0.5
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
-3.309275, -3, -5.64049,
-3.309275, 2, -5.64049,
-3.309275, -3, -5.64049,
-3.463814, -3, -5.912858,
-3.309275, -2, -5.64049,
-3.463814, -2, -5.912858,
-3.309275, -1, -5.64049,
-3.463814, -1, -5.912858,
-3.309275, 0, -5.64049,
-3.463814, 0, -5.912858,
-3.309275, 1, -5.64049,
-3.463814, 1, -5.912858,
-3.309275, 2, -5.64049,
-3.463814, 2, -5.912858
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
-3.772891, -3, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, -3, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, -3, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, -3, -6.457592, 0, 1.5, 0.5, 0.5,
-3.772891, -2, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, -2, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, -2, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, -2, -6.457592, 0, 1.5, 0.5, 0.5,
-3.772891, -1, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, -1, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, -1, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, -1, -6.457592, 0, 1.5, 0.5, 0.5,
-3.772891, 0, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, 0, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, 0, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, 0, -6.457592, 0, 1.5, 0.5, 0.5,
-3.772891, 1, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, 1, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, 1, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, 1, -6.457592, 0, 1.5, 0.5, 0.5,
-3.772891, 2, -6.457592, 0, -0.5, 0.5, 0.5,
-3.772891, 2, -6.457592, 1, -0.5, 0.5, 0.5,
-3.772891, 2, -6.457592, 1, 1.5, 0.5, 0.5,
-3.772891, 2, -6.457592, 0, 1.5, 0.5, 0.5
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
-3.309275, -3.18549, -4,
-3.309275, -3.18549, 4,
-3.309275, -3.18549, -4,
-3.463814, -3.3404, -4,
-3.309275, -3.18549, -2,
-3.463814, -3.3404, -2,
-3.309275, -3.18549, 0,
-3.463814, -3.3404, 0,
-3.309275, -3.18549, 2,
-3.463814, -3.3404, 2,
-3.309275, -3.18549, 4,
-3.463814, -3.3404, 4
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
-3.772891, -3.650219, -4, 0, -0.5, 0.5, 0.5,
-3.772891, -3.650219, -4, 1, -0.5, 0.5, 0.5,
-3.772891, -3.650219, -4, 1, 1.5, 0.5, 0.5,
-3.772891, -3.650219, -4, 0, 1.5, 0.5, 0.5,
-3.772891, -3.650219, -2, 0, -0.5, 0.5, 0.5,
-3.772891, -3.650219, -2, 1, -0.5, 0.5, 0.5,
-3.772891, -3.650219, -2, 1, 1.5, 0.5, 0.5,
-3.772891, -3.650219, -2, 0, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 0, 0, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 0, 1, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 0, 1, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 0, 0, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 2, 0, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 2, 1, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 2, 1, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 2, 0, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 4, 0, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 4, 1, -0.5, 0.5, 0.5,
-3.772891, -3.650219, 4, 1, 1.5, 0.5, 0.5,
-3.772891, -3.650219, 4, 0, 1.5, 0.5, 0.5
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
-3.309275, -3.18549, -5.64049,
-3.309275, 3.010897, -5.64049,
-3.309275, -3.18549, 5.254197,
-3.309275, 3.010897, 5.254197,
-3.309275, -3.18549, -5.64049,
-3.309275, -3.18549, 5.254197,
-3.309275, 3.010897, -5.64049,
-3.309275, 3.010897, 5.254197,
-3.309275, -3.18549, -5.64049,
2.872262, -3.18549, -5.64049,
-3.309275, -3.18549, 5.254197,
2.872262, -3.18549, 5.254197,
-3.309275, 3.010897, -5.64049,
2.872262, 3.010897, -5.64049,
-3.309275, 3.010897, 5.254197,
2.872262, 3.010897, 5.254197,
2.872262, -3.18549, -5.64049,
2.872262, 3.010897, -5.64049,
2.872262, -3.18549, 5.254197,
2.872262, 3.010897, 5.254197,
2.872262, -3.18549, -5.64049,
2.872262, -3.18549, 5.254197,
2.872262, 3.010897, -5.64049,
2.872262, 3.010897, 5.254197
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
var radius = 7.462383;
var distance = 33.20098;
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
mvMatrix.translate( 0.2185068, 0.08729649, 0.1931465 );
mvMatrix.scale( 1.305254, 1.302126, 0.7405879 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.20098);
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
5-amino-4-chloro-2-p<-read.table("5-amino-4-chloro-2-p.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-5-amino-4-chloro-2-p$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
y<-5-amino-4-chloro-2-p$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
z<-5-amino-4-chloro-2-p$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
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
-3.219253, 0.2912172, -2.918363, 0, 0, 1, 1, 1,
-3.0244, 0.6494122, -3.338613, 1, 0, 0, 1, 1,
-2.955332, 0.02845925, -1.63742, 1, 0, 0, 1, 1,
-2.891438, -1.714758, -3.193916, 1, 0, 0, 1, 1,
-2.843239, -0.4915171, -3.232564, 1, 0, 0, 1, 1,
-2.8211, 0.3591481, -1.590863, 1, 0, 0, 1, 1,
-2.447726, 0.3072089, -1.615341, 0, 0, 0, 1, 1,
-2.394202, -0.9797373, -1.474789, 0, 0, 0, 1, 1,
-2.378238, 0.451977, -1.962052, 0, 0, 0, 1, 1,
-2.331671, -1.217908, -3.472556, 0, 0, 0, 1, 1,
-2.306506, -0.2355869, -0.969206, 0, 0, 0, 1, 1,
-2.265573, -0.05010396, -1.26252, 0, 0, 0, 1, 1,
-2.246964, 0.6011031, -2.31992, 0, 0, 0, 1, 1,
-2.225179, -1.955531, -1.277535, 1, 1, 1, 1, 1,
-2.186121, -1.362388, -1.785993, 1, 1, 1, 1, 1,
-2.149653, 2.069001, -1.807614, 1, 1, 1, 1, 1,
-2.091956, -0.1916706, -2.023582, 1, 1, 1, 1, 1,
-2.046538, -0.8947079, -2.019757, 1, 1, 1, 1, 1,
-2.040388, 1.456867, -2.795745, 1, 1, 1, 1, 1,
-2.028086, -1.107507, -1.056323, 1, 1, 1, 1, 1,
-1.968509, 0.07333088, -1.424896, 1, 1, 1, 1, 1,
-1.962402, -1.856027, -4.475887, 1, 1, 1, 1, 1,
-1.937576, -0.7694016, -1.512659, 1, 1, 1, 1, 1,
-1.929816, -1.523071, -3.668228, 1, 1, 1, 1, 1,
-1.928904, 0.3628486, 0.3364002, 1, 1, 1, 1, 1,
-1.92682, 0.1199445, -2.24785, 1, 1, 1, 1, 1,
-1.90859, -0.5424973, -2.173749, 1, 1, 1, 1, 1,
-1.902433, -0.7023747, -1.338963, 1, 1, 1, 1, 1,
-1.901999, 0.1278929, -2.203956, 0, 0, 1, 1, 1,
-1.898205, -0.9733821, -1.709187, 1, 0, 0, 1, 1,
-1.898003, -0.106115, -0.8044412, 1, 0, 0, 1, 1,
-1.891635, 0.4613458, -1.215351, 1, 0, 0, 1, 1,
-1.878544, -2.503142, -2.808681, 1, 0, 0, 1, 1,
-1.826577, -0.8113564, -1.382263, 1, 0, 0, 1, 1,
-1.812584, 0.783668, -1.713873, 0, 0, 0, 1, 1,
-1.78182, -1.260322, -2.526717, 0, 0, 0, 1, 1,
-1.757294, 1.070236, -1.561511, 0, 0, 0, 1, 1,
-1.753215, -0.7430029, -1.000866, 0, 0, 0, 1, 1,
-1.73393, -0.3188811, -0.5235174, 0, 0, 0, 1, 1,
-1.715104, -1.226162, -2.519049, 0, 0, 0, 1, 1,
-1.70141, 0.9371883, -1.811186, 0, 0, 0, 1, 1,
-1.697102, 0.8938276, -1.365242, 1, 1, 1, 1, 1,
-1.694376, -1.099298, -3.792901, 1, 1, 1, 1, 1,
-1.681388, 1.639813, -0.4593159, 1, 1, 1, 1, 1,
-1.677898, -1.558112, -1.671586, 1, 1, 1, 1, 1,
-1.660555, -0.524937, -0.9931492, 1, 1, 1, 1, 1,
-1.651973, -0.3793504, -0.7494212, 1, 1, 1, 1, 1,
-1.639534, 1.014812, -1.224435, 1, 1, 1, 1, 1,
-1.628614, 1.818754, -0.8031238, 1, 1, 1, 1, 1,
-1.620296, -1.72609, -1.659031, 1, 1, 1, 1, 1,
-1.616638, 0.4774604, -0.5488272, 1, 1, 1, 1, 1,
-1.61425, 0.9627566, -2.587515, 1, 1, 1, 1, 1,
-1.613631, -1.094232, -2.025775, 1, 1, 1, 1, 1,
-1.609687, 0.1216173, -2.064254, 1, 1, 1, 1, 1,
-1.601312, -0.3351855, -1.584328, 1, 1, 1, 1, 1,
-1.590027, -0.1086637, 0.4681663, 1, 1, 1, 1, 1,
-1.584428, -0.3662428, -2.491757, 0, 0, 1, 1, 1,
-1.568033, -0.3756205, -2.404267, 1, 0, 0, 1, 1,
-1.565242, -0.4873959, -0.4783292, 1, 0, 0, 1, 1,
-1.564487, 0.5890601, 0.01272133, 1, 0, 0, 1, 1,
-1.564381, -0.5583477, -1.675435, 1, 0, 0, 1, 1,
-1.56206, -1.047858, -3.729658, 1, 0, 0, 1, 1,
-1.548057, -1.032757, -2.822725, 0, 0, 0, 1, 1,
-1.538673, 0.7280219, -1.823027, 0, 0, 0, 1, 1,
-1.536971, -0.9930748, -1.086361, 0, 0, 0, 1, 1,
-1.518697, 0.2479809, -2.50927, 0, 0, 0, 1, 1,
-1.50989, 0.1281945, -2.855465, 0, 0, 0, 1, 1,
-1.504522, 0.6023827, -0.1205061, 0, 0, 0, 1, 1,
-1.497938, -1.309632, -3.568182, 0, 0, 0, 1, 1,
-1.480695, 0.2853951, -3.114718, 1, 1, 1, 1, 1,
-1.476583, -0.4697863, -1.367243, 1, 1, 1, 1, 1,
-1.469667, 0.8812634, -1.589656, 1, 1, 1, 1, 1,
-1.461322, 1.580164, -1.277526, 1, 1, 1, 1, 1,
-1.460809, -0.8567401, -3.883054, 1, 1, 1, 1, 1,
-1.453062, -1.265407, -1.523939, 1, 1, 1, 1, 1,
-1.447725, -0.5190762, -2.775383, 1, 1, 1, 1, 1,
-1.438346, -0.6176291, -2.706272, 1, 1, 1, 1, 1,
-1.43302, 1.363729, -0.2350558, 1, 1, 1, 1, 1,
-1.428832, 0.1464932, -2.079827, 1, 1, 1, 1, 1,
-1.419027, 0.3338407, 0.01520986, 1, 1, 1, 1, 1,
-1.416018, -0.3714526, -2.479069, 1, 1, 1, 1, 1,
-1.411555, -0.8788432, -1.253964, 1, 1, 1, 1, 1,
-1.403081, -0.2458154, -1.560935, 1, 1, 1, 1, 1,
-1.398948, -0.8316931, 1.368037, 1, 1, 1, 1, 1,
-1.386003, 0.3028728, -1.12826, 0, 0, 1, 1, 1,
-1.383965, 0.3729707, -2.537009, 1, 0, 0, 1, 1,
-1.381119, 0.3865882, -0.2550023, 1, 0, 0, 1, 1,
-1.378765, -0.5377125, 0.9470357, 1, 0, 0, 1, 1,
-1.375197, -1.110974, -1.565268, 1, 0, 0, 1, 1,
-1.369107, -1.69918, -4.881894, 1, 0, 0, 1, 1,
-1.363038, 1.216449, -1.615921, 0, 0, 0, 1, 1,
-1.353223, 1.679737, 0.09696259, 0, 0, 0, 1, 1,
-1.351728, 1.292953, -0.5801818, 0, 0, 0, 1, 1,
-1.342499, 1.395103, 0.5882878, 0, 0, 0, 1, 1,
-1.342165, -2.771112, -1.306628, 0, 0, 0, 1, 1,
-1.335555, 0.2849641, -1.277639, 0, 0, 0, 1, 1,
-1.334733, 0.5716358, -2.261486, 0, 0, 0, 1, 1,
-1.328246, -0.3858962, -0.4403163, 1, 1, 1, 1, 1,
-1.319451, 0.6588307, -0.7382042, 1, 1, 1, 1, 1,
-1.307162, 0.2182893, 0.1199075, 1, 1, 1, 1, 1,
-1.291727, 0.5644718, -0.09191067, 1, 1, 1, 1, 1,
-1.290757, 0.9342958, -1.358384, 1, 1, 1, 1, 1,
-1.288554, 1.072809, -1.014807, 1, 1, 1, 1, 1,
-1.28619, 0.4739889, -2.329108, 1, 1, 1, 1, 1,
-1.279156, 0.1367705, -2.101637, 1, 1, 1, 1, 1,
-1.275771, 0.3227744, -0.4359753, 1, 1, 1, 1, 1,
-1.274058, -1.831049, -2.252406, 1, 1, 1, 1, 1,
-1.261749, -3.095252, -2.524972, 1, 1, 1, 1, 1,
-1.261491, 0.5143079, -0.2963882, 1, 1, 1, 1, 1,
-1.256232, -1.217846, -1.090972, 1, 1, 1, 1, 1,
-1.248065, 0.6543717, -0.6931125, 1, 1, 1, 1, 1,
-1.246839, -0.2266662, -3.373893, 1, 1, 1, 1, 1,
-1.246711, -0.6272613, -1.297618, 0, 0, 1, 1, 1,
-1.246455, 1.232753, 0.08843514, 1, 0, 0, 1, 1,
-1.2445, -1.192802, -3.646436, 1, 0, 0, 1, 1,
-1.240723, -1.93178, -2.077208, 1, 0, 0, 1, 1,
-1.23695, 1.991326, -0.3502707, 1, 0, 0, 1, 1,
-1.23311, -1.400152, -2.952934, 1, 0, 0, 1, 1,
-1.229739, 0.6520458, -1.051372, 0, 0, 0, 1, 1,
-1.220906, 0.5232471, -1.944865, 0, 0, 0, 1, 1,
-1.205185, 1.269509, 0.2100746, 0, 0, 0, 1, 1,
-1.205052, -1.169043, -3.515208, 0, 0, 0, 1, 1,
-1.198452, -0.722287, -2.978928, 0, 0, 0, 1, 1,
-1.178362, -0.5351206, -1.477543, 0, 0, 0, 1, 1,
-1.178027, 0.5101455, -2.300676, 0, 0, 0, 1, 1,
-1.177916, 0.8129767, -3.052392, 1, 1, 1, 1, 1,
-1.175676, -1.792429, -4.236511, 1, 1, 1, 1, 1,
-1.164417, -0.7059289, -1.444838, 1, 1, 1, 1, 1,
-1.164282, 0.8896001, 0.08320478, 1, 1, 1, 1, 1,
-1.16392, 1.356206, -0.2891523, 1, 1, 1, 1, 1,
-1.141201, -0.3656493, -1.460851, 1, 1, 1, 1, 1,
-1.130228, 2.358947, 0.6790933, 1, 1, 1, 1, 1,
-1.124623, -1.059248, -1.754156, 1, 1, 1, 1, 1,
-1.124333, -0.4469759, -0.7116839, 1, 1, 1, 1, 1,
-1.120102, 2.920659, -1.044326, 1, 1, 1, 1, 1,
-1.118373, 0.3791006, -0.7275462, 1, 1, 1, 1, 1,
-1.115813, 0.4235277, -2.604607, 1, 1, 1, 1, 1,
-1.114605, -0.293367, -0.3300713, 1, 1, 1, 1, 1,
-1.109533, -1.102038, -3.136619, 1, 1, 1, 1, 1,
-1.109301, -1.466902, -2.549275, 1, 1, 1, 1, 1,
-1.105626, 0.3630443, -0.4787882, 0, 0, 1, 1, 1,
-1.10438, -0.1999686, -3.237042, 1, 0, 0, 1, 1,
-1.09967, -0.07445309, -2.339302, 1, 0, 0, 1, 1,
-1.098605, -0.558139, -2.224046, 1, 0, 0, 1, 1,
-1.097665, -0.8300133, -1.748673, 1, 0, 0, 1, 1,
-1.097493, -0.2210817, -3.239606, 1, 0, 0, 1, 1,
-1.08102, -0.2522891, -2.524565, 0, 0, 0, 1, 1,
-1.080651, 1.748141, 0.182079, 0, 0, 0, 1, 1,
-1.07776, 2.097153, 0.1994053, 0, 0, 0, 1, 1,
-1.075444, -0.9933494, -1.021404, 0, 0, 0, 1, 1,
-1.060121, -1.183369, -1.840045, 0, 0, 0, 1, 1,
-1.059242, 0.8372459, -1.22876, 0, 0, 0, 1, 1,
-1.050175, -0.708953, -0.5043029, 0, 0, 0, 1, 1,
-1.045501, -0.2195721, -3.152605, 1, 1, 1, 1, 1,
-1.041326, 0.3950334, -1.772444, 1, 1, 1, 1, 1,
-1.039949, 1.709467, 1.231265, 1, 1, 1, 1, 1,
-1.033894, 1.485613, -0.4447585, 1, 1, 1, 1, 1,
-1.026143, 1.337041, -1.376567, 1, 1, 1, 1, 1,
-1.021538, 1.438223, -0.3712602, 1, 1, 1, 1, 1,
-1.017973, -0.3875975, -0.8566982, 1, 1, 1, 1, 1,
-1.006315, 0.1543854, -1.574761, 1, 1, 1, 1, 1,
-1.006283, 1.033468, -0.4379735, 1, 1, 1, 1, 1,
-1.005647, -0.02033027, -1.546304, 1, 1, 1, 1, 1,
-0.99777, -1.57913, -4.353447, 1, 1, 1, 1, 1,
-0.9964832, -0.623706, -2.924956, 1, 1, 1, 1, 1,
-0.9919195, -0.05282716, 0.145737, 1, 1, 1, 1, 1,
-0.9886299, 1.233745, 0.376096, 1, 1, 1, 1, 1,
-0.9860858, 0.5479459, 0.1888538, 1, 1, 1, 1, 1,
-0.9821229, 0.4070811, -1.573126, 0, 0, 1, 1, 1,
-0.9813482, -0.2875033, -0.7700278, 1, 0, 0, 1, 1,
-0.9809338, -0.3700613, -0.9868799, 1, 0, 0, 1, 1,
-0.9741386, -0.007681636, -0.4966735, 1, 0, 0, 1, 1,
-0.9691107, 0.5930341, -1.927986, 1, 0, 0, 1, 1,
-0.9676458, 0.5849597, -0.9203224, 1, 0, 0, 1, 1,
-0.9646559, 0.8526554, 1.337278, 0, 0, 0, 1, 1,
-0.9616786, 0.2735669, -3.450792, 0, 0, 0, 1, 1,
-0.9557289, -1.592356, -1.576961, 0, 0, 0, 1, 1,
-0.9550415, -0.4879084, -3.239025, 0, 0, 0, 1, 1,
-0.9392327, 1.092263, -1.198326, 0, 0, 0, 1, 1,
-0.9310288, 0.5729446, 0.5569677, 0, 0, 0, 1, 1,
-0.917436, 0.7514951, -3.362512, 0, 0, 0, 1, 1,
-0.9159047, -1.166317, -1.774632, 1, 1, 1, 1, 1,
-0.9143528, -1.401354, -3.292132, 1, 1, 1, 1, 1,
-0.9133998, -0.7935969, -2.217484, 1, 1, 1, 1, 1,
-0.9076844, -0.2009331, -2.261441, 1, 1, 1, 1, 1,
-0.9052129, -0.5175907, -0.8795357, 1, 1, 1, 1, 1,
-0.9048422, 1.04293, 0.2163343, 1, 1, 1, 1, 1,
-0.8970596, -0.7172948, -3.853038, 1, 1, 1, 1, 1,
-0.8852339, -0.3719904, -1.445142, 1, 1, 1, 1, 1,
-0.8825623, 0.1838879, -0.7531665, 1, 1, 1, 1, 1,
-0.8805139, -2.486272, -3.589692, 1, 1, 1, 1, 1,
-0.879929, 1.122589, -1.333204, 1, 1, 1, 1, 1,
-0.8784653, 2.52637, 0.7341364, 1, 1, 1, 1, 1,
-0.8723326, -0.6683248, -1.056352, 1, 1, 1, 1, 1,
-0.8674511, -0.1222043, -1.978271, 1, 1, 1, 1, 1,
-0.8647915, 1.617056, 0.2439101, 1, 1, 1, 1, 1,
-0.8641338, -0.6418977, -2.445705, 0, 0, 1, 1, 1,
-0.8632897, -0.5499097, -3.325608, 1, 0, 0, 1, 1,
-0.8613907, 0.6049081, -0.8167353, 1, 0, 0, 1, 1,
-0.8613547, 0.2061405, -0.6855942, 1, 0, 0, 1, 1,
-0.8613392, 0.03335685, -0.7979265, 1, 0, 0, 1, 1,
-0.8605387, -0.6429853, -0.4833084, 1, 0, 0, 1, 1,
-0.859346, -0.008523406, -1.841534, 0, 0, 0, 1, 1,
-0.8591938, -1.9863, -2.482374, 0, 0, 0, 1, 1,
-0.8589681, -0.04994077, -1.620622, 0, 0, 0, 1, 1,
-0.8429983, -0.3814108, -0.7758502, 0, 0, 0, 1, 1,
-0.8396869, -0.250254, -2.080954, 0, 0, 0, 1, 1,
-0.8346509, -1.344254, -3.17728, 0, 0, 0, 1, 1,
-0.834393, -0.921617, -3.168412, 0, 0, 0, 1, 1,
-0.8338945, -0.0707532, -1.579744, 1, 1, 1, 1, 1,
-0.8280212, 0.8258492, -1.602403, 1, 1, 1, 1, 1,
-0.8259063, -0.39385, -2.490401, 1, 1, 1, 1, 1,
-0.8240196, 0.356333, -2.168982, 1, 1, 1, 1, 1,
-0.8236727, -0.2301645, -0.8329118, 1, 1, 1, 1, 1,
-0.8225046, 0.9085536, 0.3836193, 1, 1, 1, 1, 1,
-0.8165874, 1.387782, 1.33415, 1, 1, 1, 1, 1,
-0.8140698, -0.5446539, -2.440034, 1, 1, 1, 1, 1,
-0.8110659, 0.5082556, 0.02652476, 1, 1, 1, 1, 1,
-0.8102596, -0.3116819, -2.511646, 1, 1, 1, 1, 1,
-0.8046541, 0.1091233, -1.315432, 1, 1, 1, 1, 1,
-0.8044671, 0.8417656, -0.8223401, 1, 1, 1, 1, 1,
-0.7998121, -0.1414632, -2.371866, 1, 1, 1, 1, 1,
-0.7984238, -0.4099045, -1.781144, 1, 1, 1, 1, 1,
-0.7956174, -0.4359914, -1.551695, 1, 1, 1, 1, 1,
-0.7919391, -1.24566, -2.758263, 0, 0, 1, 1, 1,
-0.7819732, 1.845801, -0.8202847, 1, 0, 0, 1, 1,
-0.7794482, -0.0007938621, -1.173834, 1, 0, 0, 1, 1,
-0.7792779, -0.7372668, -2.060102, 1, 0, 0, 1, 1,
-0.7775404, 1.57843, 1.972528, 1, 0, 0, 1, 1,
-0.7765843, 0.7067006, -0.8421384, 1, 0, 0, 1, 1,
-0.7729126, 0.04208147, -2.109513, 0, 0, 0, 1, 1,
-0.7671196, -0.5745687, -1.306481, 0, 0, 0, 1, 1,
-0.7666085, 0.384899, -1.305257, 0, 0, 0, 1, 1,
-0.7623366, -0.854673, -3.055518, 0, 0, 0, 1, 1,
-0.7605064, 2.413104, -1.390163, 0, 0, 0, 1, 1,
-0.7602034, 1.894539, 0.5950701, 0, 0, 0, 1, 1,
-0.759148, 0.08873961, -0.517065, 0, 0, 0, 1, 1,
-0.7581975, -1.059618, -4.368598, 1, 1, 1, 1, 1,
-0.7539557, 0.3048009, -1.339373, 1, 1, 1, 1, 1,
-0.7519199, 0.541986, 0.8070952, 1, 1, 1, 1, 1,
-0.7460284, 0.3827118, -1.986771, 1, 1, 1, 1, 1,
-0.7459369, 1.778407, -1.556491, 1, 1, 1, 1, 1,
-0.7423286, -0.3893514, -2.531946, 1, 1, 1, 1, 1,
-0.7417741, 0.9847775, -0.1165531, 1, 1, 1, 1, 1,
-0.7408064, -1.064271, -1.953341, 1, 1, 1, 1, 1,
-0.7397707, -1.043106, -3.929331, 1, 1, 1, 1, 1,
-0.7374201, -1.611408, -2.146776, 1, 1, 1, 1, 1,
-0.7349709, 0.3196282, -2.72467, 1, 1, 1, 1, 1,
-0.734161, 2.105258, 0.7519981, 1, 1, 1, 1, 1,
-0.7291791, -0.3466209, -0.3065765, 1, 1, 1, 1, 1,
-0.7234087, 0.07381111, -1.79583, 1, 1, 1, 1, 1,
-0.7204053, -0.470164, -3.712481, 1, 1, 1, 1, 1,
-0.7158628, -0.5545664, -2.380329, 0, 0, 1, 1, 1,
-0.714933, -2.068637, -2.069272, 1, 0, 0, 1, 1,
-0.7147647, -0.3009287, -2.702387, 1, 0, 0, 1, 1,
-0.7090098, 0.4830044, 0.4776646, 1, 0, 0, 1, 1,
-0.705478, -1.160409, -0.3868609, 1, 0, 0, 1, 1,
-0.7054607, 0.3195976, -1.673444, 1, 0, 0, 1, 1,
-0.701055, -0.1283978, -2.821749, 0, 0, 0, 1, 1,
-0.6939031, -0.6870551, -3.816352, 0, 0, 0, 1, 1,
-0.6879339, 0.5121886, -1.650726, 0, 0, 0, 1, 1,
-0.6871321, -0.315346, -1.94594, 0, 0, 0, 1, 1,
-0.686494, 0.7926909, -0.8525969, 0, 0, 0, 1, 1,
-0.6863065, -0.9873805, -4.586841, 0, 0, 0, 1, 1,
-0.686148, 1.253276, -1.222824, 0, 0, 0, 1, 1,
-0.6852545, 0.550868, -0.2955199, 1, 1, 1, 1, 1,
-0.6833636, -1.40649, -2.356305, 1, 1, 1, 1, 1,
-0.6773232, 1.036979, 0.02282838, 1, 1, 1, 1, 1,
-0.6678175, -0.03494301, 0.1583106, 1, 1, 1, 1, 1,
-0.667009, -0.1062675, -0.6751674, 1, 1, 1, 1, 1,
-0.6668857, -0.2121052, -2.197443, 1, 1, 1, 1, 1,
-0.6658387, -2.133231, -4.093768, 1, 1, 1, 1, 1,
-0.6621274, 0.1711886, -2.118309, 1, 1, 1, 1, 1,
-0.6497286, -0.8774224, -1.845692, 1, 1, 1, 1, 1,
-0.6410007, -0.01697593, -2.113183, 1, 1, 1, 1, 1,
-0.6378381, -1.786412, -2.767995, 1, 1, 1, 1, 1,
-0.6374455, 0.006316266, -1.204932, 1, 1, 1, 1, 1,
-0.6340161, -2.006854, -3.833901, 1, 1, 1, 1, 1,
-0.6325665, -0.520597, -2.057046, 1, 1, 1, 1, 1,
-0.6324985, 0.4021659, 1.249774, 1, 1, 1, 1, 1,
-0.6310194, 0.966237, -0.6886261, 0, 0, 1, 1, 1,
-0.6307455, 0.1897467, -2.720135, 1, 0, 0, 1, 1,
-0.629469, -0.2650231, -0.392773, 1, 0, 0, 1, 1,
-0.629468, 0.5919067, -0.2587115, 1, 0, 0, 1, 1,
-0.6272704, -0.9632086, -2.98045, 1, 0, 0, 1, 1,
-0.6264306, -0.4897392, -0.4242953, 1, 0, 0, 1, 1,
-0.6147942, -0.9447706, -3.480981, 0, 0, 0, 1, 1,
-0.6139139, 1.57433, -1.157063, 0, 0, 0, 1, 1,
-0.6068008, 1.354825, -0.771583, 0, 0, 0, 1, 1,
-0.6031463, 0.1719367, -1.329805, 0, 0, 0, 1, 1,
-0.6025878, -0.4094765, -2.173837, 0, 0, 0, 1, 1,
-0.5988968, 2.685341, 0.8331571, 0, 0, 0, 1, 1,
-0.5922629, 0.2545691, -1.550755, 0, 0, 0, 1, 1,
-0.5891349, 0.5823475, 0.1122537, 1, 1, 1, 1, 1,
-0.5891223, 1.651077, 0.3261497, 1, 1, 1, 1, 1,
-0.5848351, -0.08180403, -1.043092, 1, 1, 1, 1, 1,
-0.5811382, 0.01399603, -1.290497, 1, 1, 1, 1, 1,
-0.5784485, 0.8287085, -1.08303, 1, 1, 1, 1, 1,
-0.5778785, 0.1152598, -1.523078, 1, 1, 1, 1, 1,
-0.5694019, -0.2419752, -4.21943, 1, 1, 1, 1, 1,
-0.5676447, -0.1476079, -3.144418, 1, 1, 1, 1, 1,
-0.5644178, 1.251552, 0.7633725, 1, 1, 1, 1, 1,
-0.5639741, 1.261567, -0.3786822, 1, 1, 1, 1, 1,
-0.5576233, 0.9890494, -0.2103241, 1, 1, 1, 1, 1,
-0.5523345, -0.4499571, -2.505929, 1, 1, 1, 1, 1,
-0.5511176, 0.6908436, -1.154993, 1, 1, 1, 1, 1,
-0.5504953, 0.1290552, -3.465768, 1, 1, 1, 1, 1,
-0.5502514, -1.426256, -2.087559, 1, 1, 1, 1, 1,
-0.549111, -0.6674906, -3.60569, 0, 0, 1, 1, 1,
-0.5476048, -0.4547322, -2.35606, 1, 0, 0, 1, 1,
-0.5464118, -0.2879554, -1.48093, 1, 0, 0, 1, 1,
-0.5401196, 1.742039, 1.300978, 1, 0, 0, 1, 1,
-0.5398014, 0.1199998, -0.8800418, 1, 0, 0, 1, 1,
-0.539003, 0.4772377, -0.6308144, 1, 0, 0, 1, 1,
-0.5382727, 0.6925297, -0.3034995, 0, 0, 0, 1, 1,
-0.5382558, -0.1330909, -1.793936, 0, 0, 0, 1, 1,
-0.5355315, -1.443866, -2.428753, 0, 0, 0, 1, 1,
-0.5345231, 1.418432, 0.8804112, 0, 0, 0, 1, 1,
-0.5283481, 0.8850181, 0.1304025, 0, 0, 0, 1, 1,
-0.5261621, -0.3803034, -2.983414, 0, 0, 0, 1, 1,
-0.5193338, 0.3506452, -1.571403, 0, 0, 0, 1, 1,
-0.5186031, 0.05924988, -1.469115, 1, 1, 1, 1, 1,
-0.5184911, -1.635079, -3.490769, 1, 1, 1, 1, 1,
-0.5173587, -0.2019754, -2.248492, 1, 1, 1, 1, 1,
-0.515297, 1.351167, -0.8799258, 1, 1, 1, 1, 1,
-0.5079346, -0.1968346, -2.667267, 1, 1, 1, 1, 1,
-0.5074259, -0.8197035, -2.177118, 1, 1, 1, 1, 1,
-0.4919726, -1.351014, -0.6858855, 1, 1, 1, 1, 1,
-0.4911504, -0.8050393, -2.812851, 1, 1, 1, 1, 1,
-0.490335, 0.5682329, -2.644947, 1, 1, 1, 1, 1,
-0.4828999, -0.9786389, -2.477987, 1, 1, 1, 1, 1,
-0.4828335, 0.01158512, -1.659562, 1, 1, 1, 1, 1,
-0.4785707, -0.003819528, -1.876583, 1, 1, 1, 1, 1,
-0.4744824, -0.05254818, -1.695173, 1, 1, 1, 1, 1,
-0.4726498, 0.5800304, -0.9299032, 1, 1, 1, 1, 1,
-0.4708843, 1.335132, -0.2345956, 1, 1, 1, 1, 1,
-0.4701252, 0.6380212, -2.333249, 0, 0, 1, 1, 1,
-0.463445, -0.4039649, -2.392076, 1, 0, 0, 1, 1,
-0.4627291, -0.9175164, -2.371732, 1, 0, 0, 1, 1,
-0.4611519, -0.653001, -2.992552, 1, 0, 0, 1, 1,
-0.4608856, -1.205941, -1.988882, 1, 0, 0, 1, 1,
-0.446113, -0.1560587, -1.485184, 1, 0, 0, 1, 1,
-0.4455014, -1.12132, -2.068047, 0, 0, 0, 1, 1,
-0.4415396, 1.5129, 0.2239147, 0, 0, 0, 1, 1,
-0.441113, -1.319727, -2.896074, 0, 0, 0, 1, 1,
-0.4376843, 2.249712, -0.6441711, 0, 0, 0, 1, 1,
-0.4323785, 1.084964, -0.1863881, 0, 0, 0, 1, 1,
-0.4279976, 1.157939, -2.538404, 0, 0, 0, 1, 1,
-0.4277467, 1.091544, -1.671181, 0, 0, 0, 1, 1,
-0.4261096, -0.4848855, -0.8470753, 1, 1, 1, 1, 1,
-0.425956, 0.06507717, -2.635642, 1, 1, 1, 1, 1,
-0.4210201, 0.4933729, 0.8863751, 1, 1, 1, 1, 1,
-0.4197095, 0.1710133, -0.9997616, 1, 1, 1, 1, 1,
-0.4159478, 2.824099, 0.02988805, 1, 1, 1, 1, 1,
-0.4137353, -0.7741827, -2.860803, 1, 1, 1, 1, 1,
-0.4134988, -2.854826, -3.437609, 1, 1, 1, 1, 1,
-0.4117184, 0.6692792, -1.873589, 1, 1, 1, 1, 1,
-0.4110791, -0.3761088, -1.643509, 1, 1, 1, 1, 1,
-0.410425, 1.434571, -0.8690267, 1, 1, 1, 1, 1,
-0.407513, -0.4579167, -2.126301, 1, 1, 1, 1, 1,
-0.4042997, -0.07341267, -2.607904, 1, 1, 1, 1, 1,
-0.4031205, 0.1018858, -1.726363, 1, 1, 1, 1, 1,
-0.4028824, 0.6951859, -0.695117, 1, 1, 1, 1, 1,
-0.4026512, -0.532536, -0.5323748, 1, 1, 1, 1, 1,
-0.3995675, 1.305716, -0.6898322, 0, 0, 1, 1, 1,
-0.3952774, 0.2002339, -1.260003, 1, 0, 0, 1, 1,
-0.3935122, 2.160461, -0.4955911, 1, 0, 0, 1, 1,
-0.3931082, -0.5182651, -1.943928, 1, 0, 0, 1, 1,
-0.3905549, -1.584347, -3.354738, 1, 0, 0, 1, 1,
-0.3887388, -0.8263335, -3.863516, 1, 0, 0, 1, 1,
-0.3887348, 0.3656401, -0.9843307, 0, 0, 0, 1, 1,
-0.3868671, -2.203577, -1.4941, 0, 0, 0, 1, 1,
-0.3856671, -0.06895667, -1.695747, 0, 0, 0, 1, 1,
-0.3777241, 1.087026, -2.125342, 0, 0, 0, 1, 1,
-0.3741293, 1.307768, 0.5393808, 0, 0, 0, 1, 1,
-0.3740549, -0.1974977, -0.3600193, 0, 0, 0, 1, 1,
-0.3710055, 0.8072445, 0.1203083, 0, 0, 0, 1, 1,
-0.3708961, -0.0154458, -0.9738214, 1, 1, 1, 1, 1,
-0.3696232, 1.807119, 0.399167, 1, 1, 1, 1, 1,
-0.3674377, -1.219491, -3.861602, 1, 1, 1, 1, 1,
-0.3654188, 0.005954768, -0.7400722, 1, 1, 1, 1, 1,
-0.3649953, -0.8997595, -0.8025514, 1, 1, 1, 1, 1,
-0.3614349, -0.6293442, -3.991337, 1, 1, 1, 1, 1,
-0.3610054, 1.003161, -1.507284, 1, 1, 1, 1, 1,
-0.3486655, -1.370771, -3.378726, 1, 1, 1, 1, 1,
-0.3437678, 0.1281145, -1.189312, 1, 1, 1, 1, 1,
-0.34315, -0.5064452, -2.294454, 1, 1, 1, 1, 1,
-0.3428738, 0.100622, 0.2537288, 1, 1, 1, 1, 1,
-0.3414658, -2.379913, -4.909158, 1, 1, 1, 1, 1,
-0.3401192, 0.7847981, -2.035398, 1, 1, 1, 1, 1,
-0.3362673, -1.36158, -1.781943, 1, 1, 1, 1, 1,
-0.3338174, -1.244533, -2.358876, 1, 1, 1, 1, 1,
-0.3256055, 1.93829, 0.2084541, 0, 0, 1, 1, 1,
-0.3249001, -0.09175254, -1.457824, 1, 0, 0, 1, 1,
-0.323674, -0.2972839, -3.463428, 1, 0, 0, 1, 1,
-0.3226184, 1.028815, 1.007201, 1, 0, 0, 1, 1,
-0.3220382, -1.399825, -3.250189, 1, 0, 0, 1, 1,
-0.3202892, 2.307118, -0.8285202, 1, 0, 0, 1, 1,
-0.3202212, 0.4080095, -2.248999, 0, 0, 0, 1, 1,
-0.3119919, 0.3310992, -1.371764, 0, 0, 0, 1, 1,
-0.3040968, -0.4821225, -4.434241, 0, 0, 0, 1, 1,
-0.3023172, -1.420505, -2.255247, 0, 0, 0, 1, 1,
-0.3013669, 1.305799, 0.847589, 0, 0, 0, 1, 1,
-0.2936539, -1.010321, -2.821221, 0, 0, 0, 1, 1,
-0.29018, 1.802533, 2.073891, 0, 0, 0, 1, 1,
-0.2894204, 0.4349717, -0.2578473, 1, 1, 1, 1, 1,
-0.2877947, 0.5707277, 0.5669258, 1, 1, 1, 1, 1,
-0.2864791, -0.342362, -3.432964, 1, 1, 1, 1, 1,
-0.2848115, 0.2053658, -2.318338, 1, 1, 1, 1, 1,
-0.2818223, -0.5247945, -3.353522, 1, 1, 1, 1, 1,
-0.2788737, 0.3228589, -2.789849, 1, 1, 1, 1, 1,
-0.2770812, -1.82337, -3.364271, 1, 1, 1, 1, 1,
-0.2768208, -0.3569236, -2.287335, 1, 1, 1, 1, 1,
-0.2754077, 1.711989, 0.4102202, 1, 1, 1, 1, 1,
-0.273594, -0.1588448, -1.876772, 1, 1, 1, 1, 1,
-0.2621848, -0.641711, -1.699213, 1, 1, 1, 1, 1,
-0.2591713, -1.424849, -2.954842, 1, 1, 1, 1, 1,
-0.2453127, -1.154235, -3.160942, 1, 1, 1, 1, 1,
-0.2422095, 1.409569, -2.677632, 1, 1, 1, 1, 1,
-0.2405469, 0.1947948, -1.492648, 1, 1, 1, 1, 1,
-0.2394553, 0.2681333, -1.321661, 0, 0, 1, 1, 1,
-0.2390559, -1.060198, -1.607993, 1, 0, 0, 1, 1,
-0.237249, 1.815688, 0.7427429, 1, 0, 0, 1, 1,
-0.2280289, 1.052413, -1.442962, 1, 0, 0, 1, 1,
-0.2276161, 0.5429555, -0.6407604, 1, 0, 0, 1, 1,
-0.2259049, -0.1489005, -1.541087, 1, 0, 0, 1, 1,
-0.2195098, 0.1450142, 0.2564561, 0, 0, 0, 1, 1,
-0.219333, -0.6804368, -3.664464, 0, 0, 0, 1, 1,
-0.2130154, 0.7077377, -0.2643587, 0, 0, 0, 1, 1,
-0.2123426, 0.7372814, -0.9645965, 0, 0, 0, 1, 1,
-0.2105497, -1.262399, -3.063875, 0, 0, 0, 1, 1,
-0.2075307, -0.3016648, -1.022468, 0, 0, 0, 1, 1,
-0.2043621, -0.6471264, -4.728593, 0, 0, 0, 1, 1,
-0.200004, 0.4987482, -0.2107731, 1, 1, 1, 1, 1,
-0.1993217, 0.2060079, 1.446311, 1, 1, 1, 1, 1,
-0.1988676, -0.001972761, -1.094069, 1, 1, 1, 1, 1,
-0.1988393, -0.1500622, -2.445713, 1, 1, 1, 1, 1,
-0.1937251, 1.093388, -0.05514218, 1, 1, 1, 1, 1,
-0.192914, 0.8260727, -0.8867145, 1, 1, 1, 1, 1,
-0.1852992, -0.3837808, -4.124069, 1, 1, 1, 1, 1,
-0.1833765, 0.4263009, -1.126625, 1, 1, 1, 1, 1,
-0.1831701, -0.7353145, -3.798129, 1, 1, 1, 1, 1,
-0.1768868, 0.03702981, -2.378854, 1, 1, 1, 1, 1,
-0.1763987, 0.00942386, -1.903703, 1, 1, 1, 1, 1,
-0.1726587, 0.2703372, 0.6292139, 1, 1, 1, 1, 1,
-0.1672534, -0.3893788, -2.868604, 1, 1, 1, 1, 1,
-0.1648362, 2.158303, -0.2809594, 1, 1, 1, 1, 1,
-0.1617985, 1.287169, 0.4875615, 1, 1, 1, 1, 1,
-0.1608339, -0.1725573, -1.812447, 0, 0, 1, 1, 1,
-0.1589123, -0.2835599, -2.192795, 1, 0, 0, 1, 1,
-0.156374, 0.8659337, 0.1324416, 1, 0, 0, 1, 1,
-0.1557266, -2.027397, -2.864209, 1, 0, 0, 1, 1,
-0.1534184, 0.2795617, -0.7363859, 1, 0, 0, 1, 1,
-0.1511659, 0.4850049, 1.175215, 1, 0, 0, 1, 1,
-0.1471135, -0.8844847, -2.513111, 0, 0, 0, 1, 1,
-0.1457209, -0.1724555, -3.185165, 0, 0, 0, 1, 1,
-0.143728, -2.309623, -4.112523, 0, 0, 0, 1, 1,
-0.142638, 0.9697002, -0.7005278, 0, 0, 0, 1, 1,
-0.1282535, 0.3297017, -0.3564175, 0, 0, 0, 1, 1,
-0.1182394, -0.2302402, -3.385847, 0, 0, 0, 1, 1,
-0.115649, 0.4805966, 1.448269, 0, 0, 0, 1, 1,
-0.1123517, 0.534543, 0.6003458, 1, 1, 1, 1, 1,
-0.1115718, -0.3967918, -1.977668, 1, 1, 1, 1, 1,
-0.1065993, 0.5758939, -0.5330017, 1, 1, 1, 1, 1,
-0.1057428, -0.2264578, -2.696117, 1, 1, 1, 1, 1,
-0.1040111, 0.2932619, 0.7971756, 1, 1, 1, 1, 1,
-0.1014896, 0.1826111, 0.6244766, 1, 1, 1, 1, 1,
-0.1012161, -0.428982, -5.017715, 1, 1, 1, 1, 1,
-0.09582304, -0.07402799, -2.177656, 1, 1, 1, 1, 1,
-0.0934699, -1.097467, -0.612384, 1, 1, 1, 1, 1,
-0.091755, 2.257072, 1.677676, 1, 1, 1, 1, 1,
-0.09004775, 1.135842, -0.2046846, 1, 1, 1, 1, 1,
-0.08872055, -0.6475464, -2.287577, 1, 1, 1, 1, 1,
-0.08612334, -0.8155243, -3.926411, 1, 1, 1, 1, 1,
-0.08377258, -0.431207, -2.376081, 1, 1, 1, 1, 1,
-0.07733367, -0.3206532, -2.396479, 1, 1, 1, 1, 1,
-0.07377601, -0.7241153, -5.48183, 0, 0, 1, 1, 1,
-0.07266843, 0.4311287, 0.1980163, 1, 0, 0, 1, 1,
-0.07233728, 0.08759297, -0.934897, 1, 0, 0, 1, 1,
-0.0720487, 1.571912, 0.2814072, 1, 0, 0, 1, 1,
-0.06627965, 0.9970205, -1.919959, 1, 0, 0, 1, 1,
-0.06579481, -0.9744222, -2.647653, 1, 0, 0, 1, 1,
-0.06223951, 1.126312, -0.06357086, 0, 0, 0, 1, 1,
-0.06002528, 0.8596395, 0.6564943, 0, 0, 0, 1, 1,
-0.05639006, 0.15809, -0.2957359, 0, 0, 0, 1, 1,
-0.05169916, -0.7701848, -2.362333, 0, 0, 0, 1, 1,
-0.04688314, 1.141849, -0.3751965, 0, 0, 0, 1, 1,
-0.04647451, 1.214434, 1.04864, 0, 0, 0, 1, 1,
-0.04604752, 0.8707265, 0.3269334, 0, 0, 0, 1, 1,
-0.04515471, -0.6562325, -1.172992, 1, 1, 1, 1, 1,
-0.04442259, -0.5191236, -2.506534, 1, 1, 1, 1, 1,
-0.04431724, 0.434525, 0.7507468, 1, 1, 1, 1, 1,
-0.04417088, -0.3067088, -3.064813, 1, 1, 1, 1, 1,
-0.04225331, 0.7206572, -1.040709, 1, 1, 1, 1, 1,
-0.03984733, 0.2226822, 0.6107215, 1, 1, 1, 1, 1,
-0.03915275, 0.9585198, 0.6683045, 1, 1, 1, 1, 1,
-0.0365638, -0.7991503, -3.069254, 1, 1, 1, 1, 1,
-0.03450966, -0.182788, -2.782097, 1, 1, 1, 1, 1,
-0.03064616, 0.9904459, 0.5402307, 1, 1, 1, 1, 1,
-0.03064215, 0.8122539, -0.4265242, 1, 1, 1, 1, 1,
-0.02578933, 1.600081, -0.08154672, 1, 1, 1, 1, 1,
-0.02340226, -0.4384085, -2.557113, 1, 1, 1, 1, 1,
-0.01908079, 0.364241, 0.8848799, 1, 1, 1, 1, 1,
-0.01792915, -0.2238716, -1.842124, 1, 1, 1, 1, 1,
-0.01594269, 0.05655517, -1.189465, 0, 0, 1, 1, 1,
-0.01478221, -0.1739576, -2.300408, 1, 0, 0, 1, 1,
-0.01422878, 0.4551859, 0.9485191, 1, 0, 0, 1, 1,
-0.01403692, -0.2430762, -1.825915, 1, 0, 0, 1, 1,
-0.01350731, -1.063292, -2.951192, 1, 0, 0, 1, 1,
-0.01339996, 1.574436, -0.9897593, 1, 0, 0, 1, 1,
-0.007403692, 0.3925116, -0.05487002, 0, 0, 0, 1, 1,
-0.006177081, 0.9960726, -0.1550201, 0, 0, 0, 1, 1,
-0.005700845, -0.7991663, -4.73466, 0, 0, 0, 1, 1,
-0.003497496, -0.5692143, -3.137887, 0, 0, 0, 1, 1,
-0.00197582, -0.92816, -2.954596, 0, 0, 0, 1, 1,
-0.00196619, 0.9241398, -0.3985195, 0, 0, 0, 1, 1,
-0.001508098, -0.458205, -2.845408, 0, 0, 0, 1, 1,
0.005146213, -0.2208509, 3.086477, 1, 1, 1, 1, 1,
0.00808183, -1.136592, 3.610079, 1, 1, 1, 1, 1,
0.01545561, -1.068873, 2.438375, 1, 1, 1, 1, 1,
0.01561095, -0.1155837, 5.095537, 1, 1, 1, 1, 1,
0.01947424, -1.334068, 3.881301, 1, 1, 1, 1, 1,
0.02624826, -1.943688, 3.564209, 1, 1, 1, 1, 1,
0.0312572, -1.407927, 1.867313, 1, 1, 1, 1, 1,
0.03186771, -1.321671, 3.53524, 1, 1, 1, 1, 1,
0.03685303, 0.6137273, -1.068552, 1, 1, 1, 1, 1,
0.03805744, -0.6325971, 3.954677, 1, 1, 1, 1, 1,
0.04238633, 0.6463249, -0.7285757, 1, 1, 1, 1, 1,
0.04615871, 0.2680298, -0.278927, 1, 1, 1, 1, 1,
0.04686093, 0.8069388, -0.8876147, 1, 1, 1, 1, 1,
0.05339367, -0.1890896, 2.760367, 1, 1, 1, 1, 1,
0.0644332, -1.037251, 3.418303, 1, 1, 1, 1, 1,
0.07017475, 0.3345228, -0.5973222, 0, 0, 1, 1, 1,
0.07175622, -0.01469381, 1.555354, 1, 0, 0, 1, 1,
0.07276341, 1.646239, 2.071488, 1, 0, 0, 1, 1,
0.08636314, -0.5111434, 2.924877, 1, 0, 0, 1, 1,
0.08857878, 0.4870645, 0.9054869, 1, 0, 0, 1, 1,
0.09384064, 0.6249284, 1.276958, 1, 0, 0, 1, 1,
0.09745334, -0.1902035, 2.776078, 0, 0, 0, 1, 1,
0.099906, 0.7111878, -0.8184375, 0, 0, 0, 1, 1,
0.1047923, 0.7667362, 0.07545015, 0, 0, 0, 1, 1,
0.1059874, 0.6038594, 1.740105, 0, 0, 0, 1, 1,
0.1101386, -0.05497833, 0.8956936, 0, 0, 0, 1, 1,
0.1122763, 2.245315, -1.497436, 0, 0, 0, 1, 1,
0.1146565, 0.1717734, 1.73085, 0, 0, 0, 1, 1,
0.1160792, -0.4263459, 2.40097, 1, 1, 1, 1, 1,
0.1185778, -0.2357735, 2.345029, 1, 1, 1, 1, 1,
0.1231634, -1.278417, 2.988239, 1, 1, 1, 1, 1,
0.1241856, 0.7673703, -0.5199687, 1, 1, 1, 1, 1,
0.1272849, 1.464263, 0.1709361, 1, 1, 1, 1, 1,
0.1330755, 0.4057205, 0.5394524, 1, 1, 1, 1, 1,
0.1344083, -0.0987461, 2.013113, 1, 1, 1, 1, 1,
0.1352757, -0.6752228, 3.90589, 1, 1, 1, 1, 1,
0.13925, -0.7781083, 2.569839, 1, 1, 1, 1, 1,
0.1408012, -0.3577547, 4.292707, 1, 1, 1, 1, 1,
0.141193, -1.594133, 2.561063, 1, 1, 1, 1, 1,
0.1429339, -0.7547076, 1.737377, 1, 1, 1, 1, 1,
0.1446496, -0.4405366, 1.997239, 1, 1, 1, 1, 1,
0.1462177, -0.003804123, 1.914221, 1, 1, 1, 1, 1,
0.1467257, -0.5218141, 3.079789, 1, 1, 1, 1, 1,
0.1490361, -0.0330823, 2.738873, 0, 0, 1, 1, 1,
0.1505498, -0.4465562, 3.362116, 1, 0, 0, 1, 1,
0.1510144, 0.4564948, 1.429426, 1, 0, 0, 1, 1,
0.1523779, 0.9878224, -0.9744098, 1, 0, 0, 1, 1,
0.1565533, -0.2389863, 2.411748, 1, 0, 0, 1, 1,
0.1576332, -0.8968899, 2.8457, 1, 0, 0, 1, 1,
0.1603922, 1.922979, -0.3085729, 0, 0, 0, 1, 1,
0.167181, -1.06938, 3.772465, 0, 0, 0, 1, 1,
0.1724792, -0.206709, 3.491776, 0, 0, 0, 1, 1,
0.1751631, 0.4662541, -0.6806109, 0, 0, 0, 1, 1,
0.1786821, 1.069859, 1.01638, 0, 0, 0, 1, 1,
0.1813086, 0.0624245, -0.7085145, 0, 0, 0, 1, 1,
0.1823663, -1.059717, 2.182182, 0, 0, 0, 1, 1,
0.1851891, -0.7773101, 2.303863, 1, 1, 1, 1, 1,
0.1878961, -0.6539435, 3.059022, 1, 1, 1, 1, 1,
0.1920999, -1.529546, 3.508656, 1, 1, 1, 1, 1,
0.19721, -1.067547, 3.409483, 1, 1, 1, 1, 1,
0.1990945, -0.205029, 3.799044, 1, 1, 1, 1, 1,
0.2007426, 2.022955, -0.6724547, 1, 1, 1, 1, 1,
0.2018821, -0.9434465, 2.015405, 1, 1, 1, 1, 1,
0.2028125, -1.061454, 3.791151, 1, 1, 1, 1, 1,
0.2052315, 0.7513033, 0.2994938, 1, 1, 1, 1, 1,
0.2066054, 2.100952, -0.01379344, 1, 1, 1, 1, 1,
0.2093647, 1.687753, -0.8425321, 1, 1, 1, 1, 1,
0.2101792, 0.234345, -0.02559868, 1, 1, 1, 1, 1,
0.2107365, -0.639847, 2.169006, 1, 1, 1, 1, 1,
0.2136954, 0.5294409, 0.2863002, 1, 1, 1, 1, 1,
0.213935, 1.516924, 1.460243, 1, 1, 1, 1, 1,
0.2168777, 0.7311809, 1.930865, 0, 0, 1, 1, 1,
0.2169876, -1.70292, 1.580305, 1, 0, 0, 1, 1,
0.2189228, -0.4835959, 3.352885, 1, 0, 0, 1, 1,
0.2190691, -1.478204, 2.730998, 1, 0, 0, 1, 1,
0.224007, -1.036281, 2.273109, 1, 0, 0, 1, 1,
0.2265981, 0.2112839, 0.1276095, 1, 0, 0, 1, 1,
0.2268694, -0.3423499, 1.407557, 0, 0, 0, 1, 1,
0.2272285, 0.3161062, 1.700754, 0, 0, 0, 1, 1,
0.2272919, 1.531008, 1.94618, 0, 0, 0, 1, 1,
0.2300248, 0.4985009, 0.7631758, 0, 0, 0, 1, 1,
0.2427655, 0.4027499, 1.537203, 0, 0, 0, 1, 1,
0.2448517, 0.6504738, 0.0005586674, 0, 0, 0, 1, 1,
0.2456374, 1.171159, 0.4069977, 0, 0, 0, 1, 1,
0.2463351, -0.9562675, 1.344996, 1, 1, 1, 1, 1,
0.2495866, -0.0296697, 1.819379, 1, 1, 1, 1, 1,
0.252262, 0.5050851, -0.3974836, 1, 1, 1, 1, 1,
0.2540081, 0.8436403, 0.7559084, 1, 1, 1, 1, 1,
0.2583282, 0.45881, 1.776258, 1, 1, 1, 1, 1,
0.2600274, -0.85944, 3.240244, 1, 1, 1, 1, 1,
0.2611313, 0.212171, 1.23774, 1, 1, 1, 1, 1,
0.2675378, 1.700302, -0.1692095, 1, 1, 1, 1, 1,
0.2682258, -0.01088561, 1.520465, 1, 1, 1, 1, 1,
0.2751123, -0.01842214, -0.155587, 1, 1, 1, 1, 1,
0.2835639, 0.3290141, 0.694784, 1, 1, 1, 1, 1,
0.2843515, 0.5840372, -0.1065902, 1, 1, 1, 1, 1,
0.2854131, 0.786105, -0.1468657, 1, 1, 1, 1, 1,
0.2910437, 0.213107, 1.654681, 1, 1, 1, 1, 1,
0.2927899, -1.124982, 2.914321, 1, 1, 1, 1, 1,
0.2990852, -0.6656145, 2.415715, 0, 0, 1, 1, 1,
0.3032108, 0.2444585, -0.188349, 1, 0, 0, 1, 1,
0.3056217, 0.399352, 1.079264, 1, 0, 0, 1, 1,
0.3062634, -2.260363, 4.807779, 1, 0, 0, 1, 1,
0.3065775, 0.8250886, 2.371156, 1, 0, 0, 1, 1,
0.3068887, 0.2786757, 1.382327, 1, 0, 0, 1, 1,
0.3076392, -0.8184593, 4.300304, 0, 0, 0, 1, 1,
0.307665, -0.3448627, 2.268302, 0, 0, 0, 1, 1,
0.3110691, 0.915502, -0.1550511, 0, 0, 0, 1, 1,
0.3119878, 1.336403, 0.6782983, 0, 0, 0, 1, 1,
0.3155678, 1.456463, 1.922091, 0, 0, 0, 1, 1,
0.3162102, -0.1579425, 1.309706, 0, 0, 0, 1, 1,
0.3201571, 1.264459, -0.04131164, 0, 0, 0, 1, 1,
0.3393281, 0.3260292, 0.175559, 1, 1, 1, 1, 1,
0.3423719, -1.119774, 3.440902, 1, 1, 1, 1, 1,
0.3429642, -0.009989339, 1.272003, 1, 1, 1, 1, 1,
0.3435428, 0.4927384, 0.4842798, 1, 1, 1, 1, 1,
0.3469758, 0.6732134, -0.2588786, 1, 1, 1, 1, 1,
0.3490795, 0.4619864, -0.4716963, 1, 1, 1, 1, 1,
0.350839, 1.88934, 0.8821984, 1, 1, 1, 1, 1,
0.351572, -2.180555, 3.703263, 1, 1, 1, 1, 1,
0.3531341, 0.1221158, 0.6135681, 1, 1, 1, 1, 1,
0.3533262, -0.028958, 2.194147, 1, 1, 1, 1, 1,
0.3551895, 0.2618887, 0.1202511, 1, 1, 1, 1, 1,
0.3565219, 0.7180414, 1.866439, 1, 1, 1, 1, 1,
0.3612046, 0.1504278, 2.517499, 1, 1, 1, 1, 1,
0.3621314, -0.3205707, 1.031342, 1, 1, 1, 1, 1,
0.3649482, 0.5498239, -0.2605902, 1, 1, 1, 1, 1,
0.3654928, -0.8258533, 2.599124, 0, 0, 1, 1, 1,
0.3730515, 0.3494417, 1.680651, 1, 0, 0, 1, 1,
0.3745358, 1.845371, 0.586558, 1, 0, 0, 1, 1,
0.3789615, 0.2898208, 0.8539358, 1, 0, 0, 1, 1,
0.3797441, 0.5911166, 1.56105, 1, 0, 0, 1, 1,
0.3840154, 0.981458, 0.3148884, 1, 0, 0, 1, 1,
0.3856407, -1.419859, 0.9731134, 0, 0, 0, 1, 1,
0.3874134, -1.68455, 2.567798, 0, 0, 0, 1, 1,
0.3911945, 0.890879, -0.5737571, 0, 0, 0, 1, 1,
0.3958957, -0.4678744, 1.370816, 0, 0, 0, 1, 1,
0.3961985, 0.8114124, 1.342951, 0, 0, 0, 1, 1,
0.4006226, 0.1675442, 1.899346, 0, 0, 0, 1, 1,
0.4018361, -0.3019124, 2.486934, 0, 0, 0, 1, 1,
0.4056294, 1.653658, 2.024523, 1, 1, 1, 1, 1,
0.4069102, -1.119401, 1.012006, 1, 1, 1, 1, 1,
0.4115947, -1.127881, 2.939505, 1, 1, 1, 1, 1,
0.4171906, -0.1500539, 1.086446, 1, 1, 1, 1, 1,
0.4181034, 0.1711069, 1.049762, 1, 1, 1, 1, 1,
0.4209402, 0.2564861, 1.425245, 1, 1, 1, 1, 1,
0.4219845, -0.410577, 1.907597, 1, 1, 1, 1, 1,
0.4254856, 1.345687, -0.0987501, 1, 1, 1, 1, 1,
0.4323726, 0.5408425, 0.4249132, 1, 1, 1, 1, 1,
0.4362049, 2.501624, -0.4848634, 1, 1, 1, 1, 1,
0.4362288, -0.2973075, 1.917663, 1, 1, 1, 1, 1,
0.4367656, -1.608734, 4.317302, 1, 1, 1, 1, 1,
0.4384955, -1.391513, 2.212569, 1, 1, 1, 1, 1,
0.4402605, -1.389603, 2.728155, 1, 1, 1, 1, 1,
0.4438253, 0.700879, 0.5306494, 1, 1, 1, 1, 1,
0.4490612, -0.5872074, 2.688949, 0, 0, 1, 1, 1,
0.449335, 1.614694, -0.4437386, 1, 0, 0, 1, 1,
0.4579026, 0.7839221, -1.277872, 1, 0, 0, 1, 1,
0.4603445, 2.66906, 0.120698, 1, 0, 0, 1, 1,
0.4607008, 0.2521458, 2.6263, 1, 0, 0, 1, 1,
0.4630119, 0.3650589, 1.316116, 1, 0, 0, 1, 1,
0.4634019, -0.5068293, 2.390957, 0, 0, 0, 1, 1,
0.4654824, -0.2943275, 2.378133, 0, 0, 0, 1, 1,
0.4670987, -1.197966, 2.711396, 0, 0, 0, 1, 1,
0.4676822, -1.116622, 2.341014, 0, 0, 0, 1, 1,
0.4700034, 0.1967146, 2.085631, 0, 0, 0, 1, 1,
0.4729751, 0.4062077, 2.283864, 0, 0, 0, 1, 1,
0.4748374, -0.02700364, 1.596107, 0, 0, 0, 1, 1,
0.4748641, 0.5340512, 1.206069, 1, 1, 1, 1, 1,
0.48019, -1.204561, 3.042744, 1, 1, 1, 1, 1,
0.4843311, -0.2101699, 1.400712, 1, 1, 1, 1, 1,
0.485811, -0.3571966, 2.123899, 1, 1, 1, 1, 1,
0.4898785, 1.766109, 0.06042786, 1, 1, 1, 1, 1,
0.4902559, 0.383837, -0.1642842, 1, 1, 1, 1, 1,
0.49104, 0.2404898, 0.5592341, 1, 1, 1, 1, 1,
0.5008933, 0.2792859, 1.621188, 1, 1, 1, 1, 1,
0.5024872, -0.2989461, 1.163678, 1, 1, 1, 1, 1,
0.5041366, -0.6706358, 3.836427, 1, 1, 1, 1, 1,
0.5067258, -0.736622, 5.007085, 1, 1, 1, 1, 1,
0.510079, -0.7073649, 2.613824, 1, 1, 1, 1, 1,
0.5114897, -0.0108038, 2.042184, 1, 1, 1, 1, 1,
0.5140301, 1.502091, 2.322094, 1, 1, 1, 1, 1,
0.5145866, 0.3530846, 1.049994, 1, 1, 1, 1, 1,
0.51504, -0.9356789, 1.250984, 0, 0, 1, 1, 1,
0.5174877, -0.436478, -0.1818204, 1, 0, 0, 1, 1,
0.5189673, 0.05428895, 3.267224, 1, 0, 0, 1, 1,
0.5236752, -0.6462106, 3.439872, 1, 0, 0, 1, 1,
0.5292045, 0.527178, 1.735841, 1, 0, 0, 1, 1,
0.5334174, 0.585938, 0.9865415, 1, 0, 0, 1, 1,
0.5365533, -0.9216058, 3.256884, 0, 0, 0, 1, 1,
0.5416076, 0.09693138, 1.858222, 0, 0, 0, 1, 1,
0.5446149, 0.09574434, 2.152815, 0, 0, 0, 1, 1,
0.5461092, 0.3110393, -0.1352828, 0, 0, 0, 1, 1,
0.5494372, -0.2594347, 0.1793805, 0, 0, 0, 1, 1,
0.5502518, -0.3227407, 4.036057, 0, 0, 0, 1, 1,
0.5516855, -0.307061, 1.467907, 0, 0, 0, 1, 1,
0.5533358, -0.9514247, 4.653211, 1, 1, 1, 1, 1,
0.5541257, -0.7128361, 0.6251861, 1, 1, 1, 1, 1,
0.5553105, 0.3454235, 2.363414, 1, 1, 1, 1, 1,
0.556812, 1.254382, -0.9928358, 1, 1, 1, 1, 1,
0.5594295, -0.5063753, 1.212439, 1, 1, 1, 1, 1,
0.5594496, 0.6656647, 1.370048, 1, 1, 1, 1, 1,
0.5624704, -1.503849, 2.895581, 1, 1, 1, 1, 1,
0.5662975, 0.8659419, 0.06819634, 1, 1, 1, 1, 1,
0.5663522, -0.4063498, 0.01160016, 1, 1, 1, 1, 1,
0.5693342, 0.3961063, 0.09718722, 1, 1, 1, 1, 1,
0.5696189, -0.09072474, 2.989237, 1, 1, 1, 1, 1,
0.5760782, 1.009057, 1.950256, 1, 1, 1, 1, 1,
0.578815, -0.3906237, 3.236321, 1, 1, 1, 1, 1,
0.5793456, 0.2710332, 0.429216, 1, 1, 1, 1, 1,
0.5794912, -0.9753526, 0.1432975, 1, 1, 1, 1, 1,
0.5798951, 0.8540974, 2.061276, 0, 0, 1, 1, 1,
0.5802453, -0.3659525, 2.865593, 1, 0, 0, 1, 1,
0.5804235, 1.219925, -0.3943264, 1, 0, 0, 1, 1,
0.5815426, 0.9088401, 1.093466, 1, 0, 0, 1, 1,
0.5831734, 0.08558498, 2.052122, 1, 0, 0, 1, 1,
0.5882172, 0.7119946, 0.5302237, 1, 0, 0, 1, 1,
0.5904428, 0.6443345, 1.233093, 0, 0, 0, 1, 1,
0.5907425, 1.010026, 1.476895, 0, 0, 0, 1, 1,
0.5912581, 1.571675, 1.684, 0, 0, 0, 1, 1,
0.5923575, -0.6584374, 3.874171, 0, 0, 0, 1, 1,
0.5937783, 0.3171806, 0.8817127, 0, 0, 0, 1, 1,
0.5946568, 0.5234048, 0.9351349, 0, 0, 0, 1, 1,
0.6027299, -0.1285509, 0.4780585, 0, 0, 0, 1, 1,
0.6034626, 0.6640506, 1.378565, 1, 1, 1, 1, 1,
0.6130685, -1.348284, 2.5667, 1, 1, 1, 1, 1,
0.6167785, -0.4440525, 0.2825437, 1, 1, 1, 1, 1,
0.618323, 0.9621581, -0.6374243, 1, 1, 1, 1, 1,
0.619381, 1.734892, -1.006893, 1, 1, 1, 1, 1,
0.6205325, 1.275165, 0.429801, 1, 1, 1, 1, 1,
0.6239318, -1.638407, 3.432085, 1, 1, 1, 1, 1,
0.6259879, 0.781886, 1.233417, 1, 1, 1, 1, 1,
0.6294129, 2.189142, -0.2156158, 1, 1, 1, 1, 1,
0.6297517, -0.4526233, 0.8581597, 1, 1, 1, 1, 1,
0.6429679, 0.05504795, 2.453816, 1, 1, 1, 1, 1,
0.6438956, 0.1503659, -0.1359853, 1, 1, 1, 1, 1,
0.6450312, -1.908006, 5.081738, 1, 1, 1, 1, 1,
0.6463813, -0.1573264, 2.56484, 1, 1, 1, 1, 1,
0.6499023, -0.6648103, 4.372694, 1, 1, 1, 1, 1,
0.6522607, 0.02531641, 1.707465, 0, 0, 1, 1, 1,
0.6542435, 0.005394658, 2.59692, 1, 0, 0, 1, 1,
0.6555013, 0.7057234, 1.426504, 1, 0, 0, 1, 1,
0.6564668, -1.100376, 4.175819, 1, 0, 0, 1, 1,
0.6594013, 0.1489846, -0.1793338, 1, 0, 0, 1, 1,
0.6644858, 2.741326, 0.1559876, 1, 0, 0, 1, 1,
0.6684384, 1.953136, 1.811296, 0, 0, 0, 1, 1,
0.6687259, 0.2688673, 1.093817, 0, 0, 0, 1, 1,
0.6717112, -0.05676615, 2.236134, 0, 0, 0, 1, 1,
0.6731885, 1.445842, 0.9240435, 0, 0, 0, 1, 1,
0.6736091, -1.570684, 1.970859, 0, 0, 0, 1, 1,
0.6745175, -1.205547, 4.741785, 0, 0, 0, 1, 1,
0.6761118, 0.8783796, 0.5455143, 0, 0, 0, 1, 1,
0.6810626, -1.158353, 2.358835, 1, 1, 1, 1, 1,
0.6845751, -1.125345, 1.819564, 1, 1, 1, 1, 1,
0.6853917, 2.540493, 0.07031704, 1, 1, 1, 1, 1,
0.6991147, 0.7717478, 0.9963431, 1, 1, 1, 1, 1,
0.6991835, -0.4646451, 1.841085, 1, 1, 1, 1, 1,
0.7038772, -0.8338689, 1.970687, 1, 1, 1, 1, 1,
0.7076099, -1.162626, 1.30522, 1, 1, 1, 1, 1,
0.7140133, -0.2980788, 1.056301, 1, 1, 1, 1, 1,
0.7142128, -1.60907, 3.088496, 1, 1, 1, 1, 1,
0.7149753, 1.87757, -0.03410048, 1, 1, 1, 1, 1,
0.7163255, -1.032691, 2.335935, 1, 1, 1, 1, 1,
0.7236475, 0.4097932, 2.11213, 1, 1, 1, 1, 1,
0.7247502, 2.427215, -0.7291089, 1, 1, 1, 1, 1,
0.725939, 1.000704, 0.2775725, 1, 1, 1, 1, 1,
0.730114, 1.146446, 0.03566753, 1, 1, 1, 1, 1,
0.7332867, 0.3384669, 0.7624027, 0, 0, 1, 1, 1,
0.7360945, 0.02664768, 1.062017, 1, 0, 0, 1, 1,
0.7368585, 1.719925, 0.2849783, 1, 0, 0, 1, 1,
0.7429873, 1.279504, 0.3093213, 1, 0, 0, 1, 1,
0.7445138, -0.6829076, 1.850614, 1, 0, 0, 1, 1,
0.7472093, 0.07906662, 0.3793114, 1, 0, 0, 1, 1,
0.7478673, 0.625265, 1.000391, 0, 0, 0, 1, 1,
0.7513016, -0.2013044, 2.484699, 0, 0, 0, 1, 1,
0.7534037, -0.6252069, 2.088968, 0, 0, 0, 1, 1,
0.7544407, -1.049666, 0.3677182, 0, 0, 0, 1, 1,
0.7607185, -0.2582506, 1.230451, 0, 0, 0, 1, 1,
0.765502, -0.7281849, 4.520671, 0, 0, 0, 1, 1,
0.7665254, 1.41602, 0.7424547, 0, 0, 0, 1, 1,
0.7669904, -0.3163505, 1.745514, 1, 1, 1, 1, 1,
0.7683619, 0.4347427, 0.09794984, 1, 1, 1, 1, 1,
0.7694911, 1.465233, 1.756889, 1, 1, 1, 1, 1,
0.7699584, 0.4082868, 1.138685, 1, 1, 1, 1, 1,
0.7754879, -0.2915402, 1.570109, 1, 1, 1, 1, 1,
0.7804453, -0.2462186, 0.5676542, 1, 1, 1, 1, 1,
0.7848134, -1.132232, 4.046341, 1, 1, 1, 1, 1,
0.7876108, 2.116784, 1.713316, 1, 1, 1, 1, 1,
0.7944943, 2.348818, 0.5932047, 1, 1, 1, 1, 1,
0.7967546, -1.553609, 4.072103, 1, 1, 1, 1, 1,
0.79847, 1.649728, 2.191669, 1, 1, 1, 1, 1,
0.799318, -0.02920401, 2.315018, 1, 1, 1, 1, 1,
0.8007047, 1.591757, -0.3549536, 1, 1, 1, 1, 1,
0.8086886, 0.9731511, -0.1082791, 1, 1, 1, 1, 1,
0.8112828, -1.109757, 3.34244, 1, 1, 1, 1, 1,
0.811363, 0.2269309, 0.3247677, 0, 0, 1, 1, 1,
0.8136533, 0.472243, 0.9075326, 1, 0, 0, 1, 1,
0.8137598, 1.50542, 0.1141345, 1, 0, 0, 1, 1,
0.8161305, -0.3237234, 2.390543, 1, 0, 0, 1, 1,
0.8166899, -0.3004211, 3.684455, 1, 0, 0, 1, 1,
0.818175, 2.125486, -0.235291, 1, 0, 0, 1, 1,
0.8189003, 0.1774225, 0.1504584, 0, 0, 0, 1, 1,
0.8190321, -0.4203697, 3.880614, 0, 0, 0, 1, 1,
0.819391, 0.1851096, 1.424116, 0, 0, 0, 1, 1,
0.8304495, -0.004791563, 2.082665, 0, 0, 0, 1, 1,
0.8407061, -0.6849182, 1.316121, 0, 0, 0, 1, 1,
0.8428365, 0.5659848, -1.22552, 0, 0, 0, 1, 1,
0.8431726, -0.02004606, 1.770437, 0, 0, 0, 1, 1,
0.8462613, -0.8301225, 0.7195832, 1, 1, 1, 1, 1,
0.8513533, -0.7583039, 2.476014, 1, 1, 1, 1, 1,
0.853887, 0.2746332, 0.6317455, 1, 1, 1, 1, 1,
0.855269, -0.4295926, 2.917969, 1, 1, 1, 1, 1,
0.8585618, 1.612896, 1.644641, 1, 1, 1, 1, 1,
0.8595173, 0.8085192, 1.609342, 1, 1, 1, 1, 1,
0.8851609, -0.5049332, -0.05702014, 1, 1, 1, 1, 1,
0.8883834, 0.3890364, 1.0734, 1, 1, 1, 1, 1,
0.8931162, -0.6605332, 2.015179, 1, 1, 1, 1, 1,
0.8976116, 0.6334375, -0.7645688, 1, 1, 1, 1, 1,
0.9048619, -0.4772266, 0.3448665, 1, 1, 1, 1, 1,
0.9066045, 1.072576, 0.8675058, 1, 1, 1, 1, 1,
0.9158735, 1.371388, -0.04854829, 1, 1, 1, 1, 1,
0.9189366, -0.2266527, 2.441455, 1, 1, 1, 1, 1,
0.9201792, -1.481842, 2.082314, 1, 1, 1, 1, 1,
0.9294981, 1.079736, 0.03166197, 0, 0, 1, 1, 1,
0.950294, 0.5196816, 1.382708, 1, 0, 0, 1, 1,
0.9545818, 2.918003, 1.426072, 1, 0, 0, 1, 1,
0.954765, 0.8642253, 0.3026, 1, 0, 0, 1, 1,
0.9556881, -1.821711, 2.978014, 1, 0, 0, 1, 1,
0.9559293, 0.2371412, 0.6402798, 1, 0, 0, 1, 1,
0.9584792, 0.00390872, 0.4060169, 0, 0, 0, 1, 1,
0.9665884, -0.1444433, 0.4239771, 0, 0, 0, 1, 1,
0.9669105, 0.658074, 2.042584, 0, 0, 0, 1, 1,
0.9769737, 1.100101, -0.2734828, 0, 0, 0, 1, 1,
0.9797896, -0.3340716, 2.092986, 0, 0, 0, 1, 1,
0.9869969, 0.3074836, 1.318493, 0, 0, 0, 1, 1,
0.9878156, -1.240054, 2.15655, 0, 0, 0, 1, 1,
0.988241, -0.01169715, 1.492093, 1, 1, 1, 1, 1,
0.9923096, -0.1563356, 2.001339, 1, 1, 1, 1, 1,
1.004096, -0.5451168, 2.646007, 1, 1, 1, 1, 1,
1.008028, -2.153091, 2.039787, 1, 1, 1, 1, 1,
1.009236, 0.5123419, 0.7001638, 1, 1, 1, 1, 1,
1.013211, 0.3913865, 2.326765, 1, 1, 1, 1, 1,
1.022905, 0.5572199, 1.257976, 1, 1, 1, 1, 1,
1.023193, 0.3447641, 1.385726, 1, 1, 1, 1, 1,
1.02864, 1.010047, 0.3292185, 1, 1, 1, 1, 1,
1.028672, 2.522938, -0.4018636, 1, 1, 1, 1, 1,
1.029245, 0.02381852, 0.8755065, 1, 1, 1, 1, 1,
1.030791, 1.360426, 1.437935, 1, 1, 1, 1, 1,
1.031445, 2.019107, 1.673761, 1, 1, 1, 1, 1,
1.041622, 0.823171, 1.024234, 1, 1, 1, 1, 1,
1.04907, 0.784643, 0.9399611, 1, 1, 1, 1, 1,
1.050757, 0.06767805, 0.9883584, 0, 0, 1, 1, 1,
1.051816, -0.3068075, 2.703923, 1, 0, 0, 1, 1,
1.058918, -0.4890012, 3.175311, 1, 0, 0, 1, 1,
1.068689, 0.3489406, 0.1761487, 1, 0, 0, 1, 1,
1.073051, 1.129474, -1.057905, 1, 0, 0, 1, 1,
1.083134, 1.19491, -0.6724424, 1, 0, 0, 1, 1,
1.084225, -0.06657282, 1.237606, 0, 0, 0, 1, 1,
1.088758, 0.3034742, 0.1963948, 0, 0, 0, 1, 1,
1.096745, -2.728659, 3.135458, 0, 0, 0, 1, 1,
1.103128, -0.438588, 1.713592, 0, 0, 0, 1, 1,
1.104043, -0.8772372, 1.994416, 0, 0, 0, 1, 1,
1.105574, -0.909906, 2.592712, 0, 0, 0, 1, 1,
1.122232, -0.3023288, 2.336868, 0, 0, 0, 1, 1,
1.125727, -0.4022732, 2.036414, 1, 1, 1, 1, 1,
1.127766, -1.130309, 3.257832, 1, 1, 1, 1, 1,
1.131244, 0.2779087, 1.998137, 1, 1, 1, 1, 1,
1.160055, 1.922249, 0.08554393, 1, 1, 1, 1, 1,
1.170139, -0.3255661, 3.291953, 1, 1, 1, 1, 1,
1.171954, 1.714013, -0.3641495, 1, 1, 1, 1, 1,
1.175475, 0.6195018, 2.118057, 1, 1, 1, 1, 1,
1.17555, 0.07306179, 1.679972, 1, 1, 1, 1, 1,
1.190041, -0.1057737, 3.496314, 1, 1, 1, 1, 1,
1.205976, -1.626901, 2.909479, 1, 1, 1, 1, 1,
1.214031, 1.559225, -1.330753, 1, 1, 1, 1, 1,
1.217511, 0.7691785, 0.7896467, 1, 1, 1, 1, 1,
1.222313, -0.01976997, 1.560898, 1, 1, 1, 1, 1,
1.231411, -0.8001046, 4.13856, 1, 1, 1, 1, 1,
1.235532, 0.727369, -0.3062263, 1, 1, 1, 1, 1,
1.238683, -0.6816037, 2.440675, 0, 0, 1, 1, 1,
1.245049, -0.470809, 1.623205, 1, 0, 0, 1, 1,
1.245857, 0.03193613, 1.735484, 1, 0, 0, 1, 1,
1.257068, -0.07143249, 1.664732, 1, 0, 0, 1, 1,
1.262382, 0.6344972, 1.816775, 1, 0, 0, 1, 1,
1.264727, 1.097311, 0.7899892, 1, 0, 0, 1, 1,
1.265664, -1.074632, 3.012207, 0, 0, 0, 1, 1,
1.273402, -0.09436581, -0.01452238, 0, 0, 0, 1, 1,
1.292435, -0.2817459, 1.414898, 0, 0, 0, 1, 1,
1.302101, 1.395953, -0.9662639, 0, 0, 0, 1, 1,
1.309789, -1.281259, 1.806422, 0, 0, 0, 1, 1,
1.326652, -1.11537, 2.421548, 0, 0, 0, 1, 1,
1.330666, -0.4721566, 3.096385, 0, 0, 0, 1, 1,
1.33292, 0.175232, 2.067805, 1, 1, 1, 1, 1,
1.342451, -0.603954, 2.585315, 1, 1, 1, 1, 1,
1.343792, -1.054187, 3.095324, 1, 1, 1, 1, 1,
1.358116, 1.301562, 0.6852092, 1, 1, 1, 1, 1,
1.363088, -0.6729391, 2.11962, 1, 1, 1, 1, 1,
1.3704, -1.010165, 1.949478, 1, 1, 1, 1, 1,
1.380496, -0.2182393, 2.009267, 1, 1, 1, 1, 1,
1.386703, -1.094307, 4.208824, 1, 1, 1, 1, 1,
1.405781, -1.143516, 2.030778, 1, 1, 1, 1, 1,
1.406513, 0.02795875, 3.028858, 1, 1, 1, 1, 1,
1.410068, -0.2716561, 1.440563, 1, 1, 1, 1, 1,
1.412585, 0.04331869, 0.9833819, 1, 1, 1, 1, 1,
1.419669, 0.7725917, 2.295493, 1, 1, 1, 1, 1,
1.420723, 0.4256315, 0.523767, 1, 1, 1, 1, 1,
1.430061, -0.742992, 0.6800419, 1, 1, 1, 1, 1,
1.444455, -0.194663, -0.3298904, 0, 0, 1, 1, 1,
1.461401, -2.446342, 1.77261, 1, 0, 0, 1, 1,
1.472798, 1.470195, 1.167945, 1, 0, 0, 1, 1,
1.480357, 1.112485, -0.3299384, 1, 0, 0, 1, 1,
1.481849, 1.136169, -1.094423, 1, 0, 0, 1, 1,
1.494317, 0.4433073, 0.3968256, 1, 0, 0, 1, 1,
1.496704, -1.754554, 0.5710937, 0, 0, 0, 1, 1,
1.516522, 0.6815633, -0.2573663, 0, 0, 0, 1, 1,
1.531603, 1.424462, 1.330797, 0, 0, 0, 1, 1,
1.559361, -0.8721707, 1.924563, 0, 0, 0, 1, 1,
1.561746, 0.9722697, 2.392234, 0, 0, 0, 1, 1,
1.57157, -0.1561983, 1.815524, 0, 0, 0, 1, 1,
1.572016, 0.7992097, 0.8250861, 0, 0, 0, 1, 1,
1.629539, 0.3344456, 1.046628, 1, 1, 1, 1, 1,
1.637104, 0.1607179, -0.4685794, 1, 1, 1, 1, 1,
1.637712, -0.05671175, 2.420986, 1, 1, 1, 1, 1,
1.647137, 1.932518, -0.8450896, 1, 1, 1, 1, 1,
1.652923, 0.294663, 1.797321, 1, 1, 1, 1, 1,
1.653646, 1.294052, 1.263361, 1, 1, 1, 1, 1,
1.653882, -0.7948249, 2.214664, 1, 1, 1, 1, 1,
1.656044, -0.4711162, 1.936168, 1, 1, 1, 1, 1,
1.658174, -0.7081988, 2.588632, 1, 1, 1, 1, 1,
1.670882, -0.03192792, 0.1952043, 1, 1, 1, 1, 1,
1.673514, -0.6822052, 1.613582, 1, 1, 1, 1, 1,
1.673851, 0.7808602, 2.797026, 1, 1, 1, 1, 1,
1.67443, 0.6579759, 2.110142, 1, 1, 1, 1, 1,
1.675463, -1.113727, 1.189226, 1, 1, 1, 1, 1,
1.699284, 1.461583, 0.8319959, 1, 1, 1, 1, 1,
1.708619, 0.3753474, 2.22742, 0, 0, 1, 1, 1,
1.723384, -0.5428629, 0.5385335, 1, 0, 0, 1, 1,
1.734733, -0.5387241, 1.517156, 1, 0, 0, 1, 1,
1.741813, -0.7800464, 1.817406, 1, 0, 0, 1, 1,
1.742045, 0.6339685, 1.471513, 1, 0, 0, 1, 1,
1.764342, -1.771666, 1.853257, 1, 0, 0, 1, 1,
1.776065, 0.4598361, 1.065213, 0, 0, 0, 1, 1,
1.808677, 0.7469233, 0.8487742, 0, 0, 0, 1, 1,
1.815768, -0.6574802, 0.612348, 0, 0, 0, 1, 1,
1.817245, 0.6560962, -0.8960671, 0, 0, 0, 1, 1,
1.827164, 0.1279133, 1.901092, 0, 0, 0, 1, 1,
1.848858, 0.1602415, 3.829016, 0, 0, 0, 1, 1,
1.855243, -0.2201325, 1.242129, 0, 0, 0, 1, 1,
1.873052, -0.4740115, 2.403391, 1, 1, 1, 1, 1,
1.874577, -0.3256634, 1.715437, 1, 1, 1, 1, 1,
1.881848, -0.6964031, 1.78536, 1, 1, 1, 1, 1,
1.883276, 0.4677569, 1.868316, 1, 1, 1, 1, 1,
1.908281, -1.080464, 1.389119, 1, 1, 1, 1, 1,
1.973021, -0.2610377, 1.070545, 1, 1, 1, 1, 1,
1.982744, -0.5897861, 1.565316, 1, 1, 1, 1, 1,
1.984411, 0.5282515, 0.660313, 1, 1, 1, 1, 1,
1.989748, 2.017282, 1.901674, 1, 1, 1, 1, 1,
1.990405, -0.02420517, 3.342748, 1, 1, 1, 1, 1,
2.010068, -0.2293103, 3.189308, 1, 1, 1, 1, 1,
2.012391, -1.98194, 2.526557, 1, 1, 1, 1, 1,
2.024591, 0.2841247, 1.344971, 1, 1, 1, 1, 1,
2.029301, -0.9234065, 2.259686, 1, 1, 1, 1, 1,
2.036664, 0.3333943, 0.7876893, 1, 1, 1, 1, 1,
2.043513, 0.3964144, -1.086748, 0, 0, 1, 1, 1,
2.075047, -0.9914446, 2.259437, 1, 0, 0, 1, 1,
2.086146, 0.6388649, 0.7626353, 1, 0, 0, 1, 1,
2.092446, 0.974099, 1.070873, 1, 0, 0, 1, 1,
2.119063, -1.101602, 1.806867, 1, 0, 0, 1, 1,
2.166349, 1.287141, 0.2396174, 1, 0, 0, 1, 1,
2.228389, 1.195405, 0.4625849, 0, 0, 0, 1, 1,
2.250385, 1.92703, 2.606321, 0, 0, 0, 1, 1,
2.267861, -1.189797, 1.903719, 0, 0, 0, 1, 1,
2.273224, -0.392469, 2.415938, 0, 0, 0, 1, 1,
2.28184, -0.38594, 1.365939, 0, 0, 0, 1, 1,
2.3056, 1.517235, 1.36177, 0, 0, 0, 1, 1,
2.333447, 0.8934339, 0.6115419, 0, 0, 0, 1, 1,
2.461185, -2.883128, 1.743541, 1, 1, 1, 1, 1,
2.46209, -1.098428, 1.809524, 1, 1, 1, 1, 1,
2.513686, -0.09656112, 1.230986, 1, 1, 1, 1, 1,
2.589907, -0.2036258, 3.035516, 1, 1, 1, 1, 1,
2.604794, -0.767238, 3.149724, 1, 1, 1, 1, 1,
2.66498, -0.0007624089, 1.882957, 1, 1, 1, 1, 1,
2.782239, -0.04456791, 1.06574, 1, 1, 1, 1, 1
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
var radius = 9.308965;
var distance = 32.69734;
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
mvMatrix.translate( 0.2185068, 0.08729649, 0.1931465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.69734);
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
