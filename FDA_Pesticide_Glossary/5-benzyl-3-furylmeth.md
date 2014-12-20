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
-2.865007, -0.6777342, -1.603002, 1, 0, 0, 1,
-2.739957, -0.5345644, -3.152431, 1, 0.007843138, 0, 1,
-2.644413, -0.3401074, -0.6367452, 1, 0.01176471, 0, 1,
-2.534107, 1.218312, -2.309912, 1, 0.01960784, 0, 1,
-2.523203, -1.309597, -3.220123, 1, 0.02352941, 0, 1,
-2.497685, 0.3386324, -1.852761, 1, 0.03137255, 0, 1,
-2.485213, -0.3828815, -1.245089, 1, 0.03529412, 0, 1,
-2.396695, -0.1139249, -2.449628, 1, 0.04313726, 0, 1,
-2.353664, -0.6908118, -3.280676, 1, 0.04705882, 0, 1,
-2.282952, 0.2873942, -0.7273409, 1, 0.05490196, 0, 1,
-2.279486, 1.464455, -2.567499, 1, 0.05882353, 0, 1,
-2.242398, 0.3689151, -1.117154, 1, 0.06666667, 0, 1,
-2.163385, 1.031439, -1.350316, 1, 0.07058824, 0, 1,
-2.11138, -2.71271, -3.717168, 1, 0.07843138, 0, 1,
-2.076117, 0.3819377, -1.290611, 1, 0.08235294, 0, 1,
-2.05827, -0.1924878, -1.035, 1, 0.09019608, 0, 1,
-2.052598, 0.8342989, -0.5827507, 1, 0.09411765, 0, 1,
-1.994701, 1.157037, -0.5959876, 1, 0.1019608, 0, 1,
-1.991516, 1.682021, -1.142174, 1, 0.1098039, 0, 1,
-1.989152, -0.5507298, -1.526078, 1, 0.1137255, 0, 1,
-1.950864, 1.515695, -3.587755, 1, 0.1215686, 0, 1,
-1.940397, -3.11228, -2.508612, 1, 0.1254902, 0, 1,
-1.927427, -0.149192, -2.183137, 1, 0.1333333, 0, 1,
-1.906349, 0.3720034, -2.421549, 1, 0.1372549, 0, 1,
-1.902715, 0.7445473, -0.2015988, 1, 0.145098, 0, 1,
-1.896176, -0.07554091, -1.895325, 1, 0.1490196, 0, 1,
-1.863836, 0.2018574, -3.152392, 1, 0.1568628, 0, 1,
-1.850371, 0.3769825, -1.495388, 1, 0.1607843, 0, 1,
-1.835479, -0.04629717, -3.001009, 1, 0.1686275, 0, 1,
-1.834229, -0.0337331, -2.325242, 1, 0.172549, 0, 1,
-1.811566, -0.6479841, -1.500749, 1, 0.1803922, 0, 1,
-1.80227, -0.2883212, 0.06228272, 1, 0.1843137, 0, 1,
-1.797258, 0.5730627, -0.4364962, 1, 0.1921569, 0, 1,
-1.778823, -1.530813, -1.642665, 1, 0.1960784, 0, 1,
-1.777827, 2.297273, 0.2844011, 1, 0.2039216, 0, 1,
-1.773234, 1.25497, -0.3984168, 1, 0.2117647, 0, 1,
-1.75641, -1.024806, -3.512003, 1, 0.2156863, 0, 1,
-1.756127, -0.3743553, -2.847523, 1, 0.2235294, 0, 1,
-1.755928, 1.126122, 0.9399778, 1, 0.227451, 0, 1,
-1.754062, -0.8469523, -3.357946, 1, 0.2352941, 0, 1,
-1.729827, -0.1272787, -2.179156, 1, 0.2392157, 0, 1,
-1.728334, -0.656794, -2.327602, 1, 0.2470588, 0, 1,
-1.727635, -1.199921, -4.377806, 1, 0.2509804, 0, 1,
-1.726222, -2.397439, -2.676318, 1, 0.2588235, 0, 1,
-1.709862, 1.439009, -2.658683, 1, 0.2627451, 0, 1,
-1.677125, -0.8296872, -1.139153, 1, 0.2705882, 0, 1,
-1.674198, -2.038319, -2.582573, 1, 0.2745098, 0, 1,
-1.667914, 0.2923058, -0.5646706, 1, 0.282353, 0, 1,
-1.643207, -0.7690781, -2.352226, 1, 0.2862745, 0, 1,
-1.643114, -0.818947, -2.871673, 1, 0.2941177, 0, 1,
-1.6283, 0.7890193, -1.444433, 1, 0.3019608, 0, 1,
-1.615741, 0.7562522, -0.06793547, 1, 0.3058824, 0, 1,
-1.603578, 1.811625, -1.009981, 1, 0.3137255, 0, 1,
-1.597381, 0.9663398, 0.9857894, 1, 0.3176471, 0, 1,
-1.587054, 1.470596, -0.7441516, 1, 0.3254902, 0, 1,
-1.560456, 0.5240444, -1.571363, 1, 0.3294118, 0, 1,
-1.558437, 0.2986914, -2.567122, 1, 0.3372549, 0, 1,
-1.552835, 0.5364288, -2.346193, 1, 0.3411765, 0, 1,
-1.543738, -0.552142, -3.198997, 1, 0.3490196, 0, 1,
-1.525762, -1.723404, -3.360633, 1, 0.3529412, 0, 1,
-1.516587, 1.056397, -2.198111, 1, 0.3607843, 0, 1,
-1.515854, 0.1091283, -1.763486, 1, 0.3647059, 0, 1,
-1.510799, 1.057994, -0.658933, 1, 0.372549, 0, 1,
-1.499262, -0.5367146, -2.953202, 1, 0.3764706, 0, 1,
-1.475944, -1.369954, -2.40518, 1, 0.3843137, 0, 1,
-1.455602, 0.5543202, -0.3249629, 1, 0.3882353, 0, 1,
-1.455112, 1.201477, -0.4456408, 1, 0.3960784, 0, 1,
-1.454314, 0.0197611, -2.361406, 1, 0.4039216, 0, 1,
-1.448096, 0.529258, -0.3803017, 1, 0.4078431, 0, 1,
-1.446076, -0.4152793, -1.627746, 1, 0.4156863, 0, 1,
-1.441435, 0.6916553, -0.02510231, 1, 0.4196078, 0, 1,
-1.43378, 0.76833, -0.4837427, 1, 0.427451, 0, 1,
-1.426422, 0.6155229, 0.08191377, 1, 0.4313726, 0, 1,
-1.412583, 0.1926308, -1.695623, 1, 0.4392157, 0, 1,
-1.409135, -0.34242, -1.650175, 1, 0.4431373, 0, 1,
-1.399927, 2.33646, 1.727863, 1, 0.4509804, 0, 1,
-1.395211, 0.6403875, 1.251358, 1, 0.454902, 0, 1,
-1.372008, -0.7462881, -1.985999, 1, 0.4627451, 0, 1,
-1.371461, 0.4221623, -0.2475524, 1, 0.4666667, 0, 1,
-1.359661, 0.1074438, -1.510614, 1, 0.4745098, 0, 1,
-1.35804, 0.8929814, -1.844062, 1, 0.4784314, 0, 1,
-1.353304, 0.3551809, -1.137694, 1, 0.4862745, 0, 1,
-1.351552, -0.112895, 0.04102517, 1, 0.4901961, 0, 1,
-1.347473, 0.2094347, -0.02876527, 1, 0.4980392, 0, 1,
-1.341701, 1.181205, -0.3094838, 1, 0.5058824, 0, 1,
-1.341195, 0.5568247, -2.683793, 1, 0.509804, 0, 1,
-1.333341, -1.578581, -2.582277, 1, 0.5176471, 0, 1,
-1.333327, -0.8667774, -1.157662, 1, 0.5215687, 0, 1,
-1.315937, 0.5628584, -2.398655, 1, 0.5294118, 0, 1,
-1.312135, 1.832112, -0.1877401, 1, 0.5333334, 0, 1,
-1.308568, -0.128842, -3.763978, 1, 0.5411765, 0, 1,
-1.306045, -0.0224818, -1.01873, 1, 0.5450981, 0, 1,
-1.304245, 1.871931, -1.421206, 1, 0.5529412, 0, 1,
-1.300928, 0.191024, -1.220706, 1, 0.5568628, 0, 1,
-1.298665, -0.8387339, 0.2519064, 1, 0.5647059, 0, 1,
-1.288082, -1.278118, -1.163156, 1, 0.5686275, 0, 1,
-1.286682, 2.034462, -0.8965069, 1, 0.5764706, 0, 1,
-1.279298, 0.5390568, -1.718275, 1, 0.5803922, 0, 1,
-1.27581, -0.2417538, -0.7476463, 1, 0.5882353, 0, 1,
-1.266464, -0.3535723, -2.971183, 1, 0.5921569, 0, 1,
-1.261846, 0.7808293, -0.4290633, 1, 0.6, 0, 1,
-1.253794, -0.04173254, -0.3529777, 1, 0.6078432, 0, 1,
-1.252024, 2.16569, -1.573921, 1, 0.6117647, 0, 1,
-1.241982, -0.8842409, -2.994793, 1, 0.6196079, 0, 1,
-1.240832, 0.1586093, -1.125728, 1, 0.6235294, 0, 1,
-1.240427, -1.061291, -2.972933, 1, 0.6313726, 0, 1,
-1.235004, 0.5748798, -1.143977, 1, 0.6352941, 0, 1,
-1.233577, 0.4536545, -1.632303, 1, 0.6431373, 0, 1,
-1.233242, -1.055456, -2.803805, 1, 0.6470588, 0, 1,
-1.22911, -0.2850048, -2.486782, 1, 0.654902, 0, 1,
-1.227092, 1.927072, -0.1823511, 1, 0.6588235, 0, 1,
-1.22582, -0.2176581, -1.847601, 1, 0.6666667, 0, 1,
-1.224823, 0.119176, -0.2610975, 1, 0.6705883, 0, 1,
-1.216093, -0.1818625, -2.712141, 1, 0.6784314, 0, 1,
-1.21437, -1.77215, -1.284037, 1, 0.682353, 0, 1,
-1.212678, -1.803723, -1.74518, 1, 0.6901961, 0, 1,
-1.212363, 0.06095539, -2.191732, 1, 0.6941177, 0, 1,
-1.211172, 1.595736, -0.7201278, 1, 0.7019608, 0, 1,
-1.199115, 0.142986, -2.395028, 1, 0.7098039, 0, 1,
-1.195853, -0.5087386, -0.1136227, 1, 0.7137255, 0, 1,
-1.19057, 0.2261937, -1.122529, 1, 0.7215686, 0, 1,
-1.185867, 1.12239, -0.02958346, 1, 0.7254902, 0, 1,
-1.184925, -0.04506775, -2.301965, 1, 0.7333333, 0, 1,
-1.181622, -0.4829424, -3.210864, 1, 0.7372549, 0, 1,
-1.173047, -1.137918, -2.637244, 1, 0.7450981, 0, 1,
-1.173035, 0.07723273, -0.9862369, 1, 0.7490196, 0, 1,
-1.170197, 0.2931952, -2.362622, 1, 0.7568628, 0, 1,
-1.154963, 1.395366, -0.01182872, 1, 0.7607843, 0, 1,
-1.151279, -1.427547, -2.886021, 1, 0.7686275, 0, 1,
-1.143813, -2.072031, -2.204314, 1, 0.772549, 0, 1,
-1.13841, 1.630556, -0.1703608, 1, 0.7803922, 0, 1,
-1.137367, 0.3432958, -0.3318882, 1, 0.7843137, 0, 1,
-1.13617, 0.597988, -1.322845, 1, 0.7921569, 0, 1,
-1.131439, 1.503887, -2.101614, 1, 0.7960784, 0, 1,
-1.107148, 0.733404, -2.153747, 1, 0.8039216, 0, 1,
-1.103006, 0.477268, -0.6000692, 1, 0.8117647, 0, 1,
-1.101398, -0.2131914, -2.773076, 1, 0.8156863, 0, 1,
-1.098168, 0.1986065, -0.3995682, 1, 0.8235294, 0, 1,
-1.097663, 0.01813035, -1.069251, 1, 0.827451, 0, 1,
-1.085366, -0.5585145, -0.8635998, 1, 0.8352941, 0, 1,
-1.08164, -1.49002, -1.439871, 1, 0.8392157, 0, 1,
-1.076669, 0.3925438, -1.557041, 1, 0.8470588, 0, 1,
-1.076524, 0.2272294, -0.02700445, 1, 0.8509804, 0, 1,
-1.065755, -1.0033, -2.376484, 1, 0.8588235, 0, 1,
-1.059314, 0.2187608, -2.189648, 1, 0.8627451, 0, 1,
-1.059158, -1.120185, -4.556499, 1, 0.8705882, 0, 1,
-1.054319, -0.4474685, -1.300742, 1, 0.8745098, 0, 1,
-1.051126, 1.330171, 0.0005805636, 1, 0.8823529, 0, 1,
-1.050561, 0.2732012, -0.8581196, 1, 0.8862745, 0, 1,
-1.048584, 0.3042151, -0.02940701, 1, 0.8941177, 0, 1,
-1.046018, -1.40533, -0.5222989, 1, 0.8980392, 0, 1,
-1.042014, 0.9635021, -0.2306897, 1, 0.9058824, 0, 1,
-1.040289, 0.4504703, -3.237767, 1, 0.9137255, 0, 1,
-1.039008, -0.02138875, -1.668891, 1, 0.9176471, 0, 1,
-1.038278, 0.6069526, -0.6080123, 1, 0.9254902, 0, 1,
-1.036047, 0.1319073, -0.6071402, 1, 0.9294118, 0, 1,
-1.035651, 0.2091641, -2.946443, 1, 0.9372549, 0, 1,
-1.035635, 0.9103091, -1.686018, 1, 0.9411765, 0, 1,
-1.031622, -1.042397, -2.825508, 1, 0.9490196, 0, 1,
-1.015449, -0.6143333, -2.631442, 1, 0.9529412, 0, 1,
-0.9979969, -0.04739867, -2.818807, 1, 0.9607843, 0, 1,
-0.9903338, 0.0467617, -2.462452, 1, 0.9647059, 0, 1,
-0.9852924, 0.8109674, -0.6834075, 1, 0.972549, 0, 1,
-0.9709085, 0.1032322, -3.337995, 1, 0.9764706, 0, 1,
-0.9692045, 1.327497, -0.4077559, 1, 0.9843137, 0, 1,
-0.9684869, -0.02039504, -2.130996, 1, 0.9882353, 0, 1,
-0.966962, 1.75274, 0.9083517, 1, 0.9960784, 0, 1,
-0.9653876, 0.217598, -2.681521, 0.9960784, 1, 0, 1,
-0.9562516, -0.3344895, -1.659413, 0.9921569, 1, 0, 1,
-0.9548643, 0.9376807, -1.673984, 0.9843137, 1, 0, 1,
-0.9517605, 1.825973, 0.03900196, 0.9803922, 1, 0, 1,
-0.9501227, -1.272702, -2.945868, 0.972549, 1, 0, 1,
-0.92766, -1.611725, -2.289696, 0.9686275, 1, 0, 1,
-0.922001, 0.6692991, -1.072361, 0.9607843, 1, 0, 1,
-0.919813, 0.02715969, -2.031206, 0.9568627, 1, 0, 1,
-0.9184705, 1.285743, -1.086607, 0.9490196, 1, 0, 1,
-0.9087294, 0.4839426, -1.412479, 0.945098, 1, 0, 1,
-0.907702, 0.464963, -2.309763, 0.9372549, 1, 0, 1,
-0.8938128, 0.04140633, 0.291438, 0.9333333, 1, 0, 1,
-0.8889086, 0.1010963, -0.6010904, 0.9254902, 1, 0, 1,
-0.8838487, -1.054446, -2.302096, 0.9215686, 1, 0, 1,
-0.8837543, 2.214017, 0.06571003, 0.9137255, 1, 0, 1,
-0.8823001, -1.064037, -3.497462, 0.9098039, 1, 0, 1,
-0.8774079, 0.2815636, -0.8999014, 0.9019608, 1, 0, 1,
-0.8715677, 0.4144469, -2.045789, 0.8941177, 1, 0, 1,
-0.8696905, -0.4580565, -1.252233, 0.8901961, 1, 0, 1,
-0.8676896, -0.6261293, -1.588538, 0.8823529, 1, 0, 1,
-0.8665692, -0.04321271, -0.3520314, 0.8784314, 1, 0, 1,
-0.8571291, 0.1731989, -1.98046, 0.8705882, 1, 0, 1,
-0.8555369, 1.585608, -1.459798, 0.8666667, 1, 0, 1,
-0.8543215, -0.2735014, -1.087582, 0.8588235, 1, 0, 1,
-0.8468568, -0.4290235, -2.035607, 0.854902, 1, 0, 1,
-0.8463719, -0.3283923, -1.569453, 0.8470588, 1, 0, 1,
-0.8463501, 0.1128614, -1.906468, 0.8431373, 1, 0, 1,
-0.8457373, 1.266953, -2.432349, 0.8352941, 1, 0, 1,
-0.8440905, -0.5178031, -1.149484, 0.8313726, 1, 0, 1,
-0.8426662, 0.7447731, 1.245763, 0.8235294, 1, 0, 1,
-0.8410028, -0.2834258, -3.189602, 0.8196079, 1, 0, 1,
-0.8398376, 1.41465, -0.3901598, 0.8117647, 1, 0, 1,
-0.8386023, -0.09229802, -1.362584, 0.8078431, 1, 0, 1,
-0.8385521, 1.493224, -1.702943, 0.8, 1, 0, 1,
-0.8334816, -0.8680326, -2.390575, 0.7921569, 1, 0, 1,
-0.8299694, -0.6418315, -2.745943, 0.7882353, 1, 0, 1,
-0.8297483, 0.4436759, 0.06524838, 0.7803922, 1, 0, 1,
-0.8277617, -1.252428, -3.8572, 0.7764706, 1, 0, 1,
-0.8275308, 1.357865, 0.1223065, 0.7686275, 1, 0, 1,
-0.8262398, 1.032896, -1.345681, 0.7647059, 1, 0, 1,
-0.8219606, -0.4324492, -2.232305, 0.7568628, 1, 0, 1,
-0.8199729, 0.4719376, -0.7518513, 0.7529412, 1, 0, 1,
-0.8182282, -1.013546, -3.278122, 0.7450981, 1, 0, 1,
-0.8109596, 1.522961, -1.000561, 0.7411765, 1, 0, 1,
-0.8102373, 0.7229993, 0.2621024, 0.7333333, 1, 0, 1,
-0.8098447, -0.04965068, -0.6710936, 0.7294118, 1, 0, 1,
-0.8046562, -0.5636458, -2.16926, 0.7215686, 1, 0, 1,
-0.8012483, 0.3305024, -2.158851, 0.7176471, 1, 0, 1,
-0.7959046, -0.1319783, -3.335328, 0.7098039, 1, 0, 1,
-0.7938258, 0.7223131, 0.9070008, 0.7058824, 1, 0, 1,
-0.7896919, -1.033444, -3.48789, 0.6980392, 1, 0, 1,
-0.7733549, 0.3675235, -2.240273, 0.6901961, 1, 0, 1,
-0.7725983, -0.7106653, -3.674834, 0.6862745, 1, 0, 1,
-0.7680148, -0.8815712, -2.491723, 0.6784314, 1, 0, 1,
-0.7659554, 0.7010775, -0.6754908, 0.6745098, 1, 0, 1,
-0.7602938, -0.1574425, -1.212973, 0.6666667, 1, 0, 1,
-0.7548935, -1.200778, -2.06097, 0.6627451, 1, 0, 1,
-0.7539276, -0.7167017, -2.395476, 0.654902, 1, 0, 1,
-0.7529128, -0.1679355, -0.07737607, 0.6509804, 1, 0, 1,
-0.7478992, -0.2601089, -1.296056, 0.6431373, 1, 0, 1,
-0.740988, 0.5578327, -1.055678, 0.6392157, 1, 0, 1,
-0.7395357, -2.343471, -2.981348, 0.6313726, 1, 0, 1,
-0.735992, 1.054283, -1.384176, 0.627451, 1, 0, 1,
-0.7353643, 2.939278, -1.297464, 0.6196079, 1, 0, 1,
-0.7308124, 1.469654, -0.6874159, 0.6156863, 1, 0, 1,
-0.7307155, -0.3573817, -2.328799, 0.6078432, 1, 0, 1,
-0.7280924, -1.137087, -1.767749, 0.6039216, 1, 0, 1,
-0.7271225, -0.8006145, -3.270157, 0.5960785, 1, 0, 1,
-0.7268362, 1.876024, 0.7803327, 0.5882353, 1, 0, 1,
-0.7267212, -0.5847778, -2.328952, 0.5843138, 1, 0, 1,
-0.7266638, -1.280874, -3.982275, 0.5764706, 1, 0, 1,
-0.7235303, -0.2677428, -0.2467882, 0.572549, 1, 0, 1,
-0.7211764, -1.536712, -2.471931, 0.5647059, 1, 0, 1,
-0.7193013, -1.213344, -1.282905, 0.5607843, 1, 0, 1,
-0.7175416, -0.8858241, -2.563064, 0.5529412, 1, 0, 1,
-0.7159252, -1.110365, -3.394871, 0.5490196, 1, 0, 1,
-0.7125136, 0.2150838, -2.121907, 0.5411765, 1, 0, 1,
-0.7033128, -0.1176236, -1.750777, 0.5372549, 1, 0, 1,
-0.7004921, 1.263709, 0.05872399, 0.5294118, 1, 0, 1,
-0.6990752, 1.624386, -0.4619674, 0.5254902, 1, 0, 1,
-0.6986656, -1.935071, -4.135527, 0.5176471, 1, 0, 1,
-0.6945699, 0.7170357, -0.0865798, 0.5137255, 1, 0, 1,
-0.6931367, -0.971176, -3.290321, 0.5058824, 1, 0, 1,
-0.6849959, -0.4726327, -0.1084877, 0.5019608, 1, 0, 1,
-0.684889, -1.497418, -2.429281, 0.4941176, 1, 0, 1,
-0.6844425, 0.3551743, -0.9397866, 0.4862745, 1, 0, 1,
-0.6837161, -0.3658721, -4.315392, 0.4823529, 1, 0, 1,
-0.6813281, -1.441462, -3.164296, 0.4745098, 1, 0, 1,
-0.6790816, 0.4267077, -0.9015955, 0.4705882, 1, 0, 1,
-0.6727018, 0.3446134, 0.1163679, 0.4627451, 1, 0, 1,
-0.6693156, 1.405321, -1.637201, 0.4588235, 1, 0, 1,
-0.6627125, 0.2388416, -2.21912, 0.4509804, 1, 0, 1,
-0.6517023, -1.755388, -3.877784, 0.4470588, 1, 0, 1,
-0.6487836, 0.2857656, -0.3958296, 0.4392157, 1, 0, 1,
-0.6474667, -2.313824, -5.421374, 0.4352941, 1, 0, 1,
-0.6464714, 0.5658485, 0.2544111, 0.427451, 1, 0, 1,
-0.6446806, 0.1228572, -2.062405, 0.4235294, 1, 0, 1,
-0.6375855, -1.202398, -3.352004, 0.4156863, 1, 0, 1,
-0.6364416, -1.224349, -3.227342, 0.4117647, 1, 0, 1,
-0.6302478, 0.1174615, 0.06593864, 0.4039216, 1, 0, 1,
-0.6284186, 0.1174964, -1.200645, 0.3960784, 1, 0, 1,
-0.6271209, -0.8416927, -1.053942, 0.3921569, 1, 0, 1,
-0.6234433, -0.4547285, -1.929421, 0.3843137, 1, 0, 1,
-0.6224833, 0.06614731, -2.072666, 0.3803922, 1, 0, 1,
-0.617152, -0.1326082, -2.184874, 0.372549, 1, 0, 1,
-0.6110047, 0.7462123, -2.128243, 0.3686275, 1, 0, 1,
-0.6091967, -0.1597591, -0.3499999, 0.3607843, 1, 0, 1,
-0.6079312, -1.390999, -4.693236, 0.3568628, 1, 0, 1,
-0.6072685, -1.06605, -4.070317, 0.3490196, 1, 0, 1,
-0.6024469, -1.007055, -2.490018, 0.345098, 1, 0, 1,
-0.586374, -0.4167916, -1.35187, 0.3372549, 1, 0, 1,
-0.5814183, -2.391186, -2.747745, 0.3333333, 1, 0, 1,
-0.5811188, -0.131455, -2.186797, 0.3254902, 1, 0, 1,
-0.5801178, 0.635489, 1.841188, 0.3215686, 1, 0, 1,
-0.5797284, -1.560446, -2.800624, 0.3137255, 1, 0, 1,
-0.5734302, -0.3232837, 1.038137, 0.3098039, 1, 0, 1,
-0.5717942, 0.1389497, -1.598138, 0.3019608, 1, 0, 1,
-0.5708935, 1.036198, 0.4110519, 0.2941177, 1, 0, 1,
-0.5707839, -1.586653, -4.089912, 0.2901961, 1, 0, 1,
-0.5588603, 0.6395121, -0.6186779, 0.282353, 1, 0, 1,
-0.5578143, -1.366917, -3.407496, 0.2784314, 1, 0, 1,
-0.5566154, -0.8800328, -2.537542, 0.2705882, 1, 0, 1,
-0.5560403, 1.008617, -2.71332, 0.2666667, 1, 0, 1,
-0.5537413, 1.278999, -0.4232487, 0.2588235, 1, 0, 1,
-0.5519997, 1.958455, -1.378254, 0.254902, 1, 0, 1,
-0.5490249, 0.5961959, -0.900539, 0.2470588, 1, 0, 1,
-0.5489082, 0.2054673, -0.7622378, 0.2431373, 1, 0, 1,
-0.5447831, -0.03177516, -1.847261, 0.2352941, 1, 0, 1,
-0.5446322, -0.662267, -2.037719, 0.2313726, 1, 0, 1,
-0.5446212, -0.8185547, -2.301866, 0.2235294, 1, 0, 1,
-0.5441924, -0.8335976, -1.852476, 0.2196078, 1, 0, 1,
-0.5438105, 0.3684738, -0.1623558, 0.2117647, 1, 0, 1,
-0.543797, 0.8075223, 0.4439576, 0.2078431, 1, 0, 1,
-0.5367898, 0.9297636, 0.7714131, 0.2, 1, 0, 1,
-0.5341535, -1.0482, -3.224169, 0.1921569, 1, 0, 1,
-0.5339841, 0.8657455, -1.233978, 0.1882353, 1, 0, 1,
-0.5317353, -1.411133, -2.85705, 0.1803922, 1, 0, 1,
-0.5287446, 2.049501, -0.1406879, 0.1764706, 1, 0, 1,
-0.527665, 0.388843, 0.3298855, 0.1686275, 1, 0, 1,
-0.5262939, -0.6088876, -1.500008, 0.1647059, 1, 0, 1,
-0.5225046, 0.4270254, -1.767358, 0.1568628, 1, 0, 1,
-0.5216113, 1.019957, -1.054962, 0.1529412, 1, 0, 1,
-0.5167385, -1.476846, -2.14743, 0.145098, 1, 0, 1,
-0.5160933, -1.581252, -2.335793, 0.1411765, 1, 0, 1,
-0.5151242, -0.1816467, -2.793175, 0.1333333, 1, 0, 1,
-0.5137488, 0.06448052, -2.758619, 0.1294118, 1, 0, 1,
-0.5032468, 0.1774264, -1.351995, 0.1215686, 1, 0, 1,
-0.5025807, 0.2253084, -1.826216, 0.1176471, 1, 0, 1,
-0.5012619, -0.2624705, -2.022126, 0.1098039, 1, 0, 1,
-0.4973646, 0.8638827, -2.421717, 0.1058824, 1, 0, 1,
-0.4928781, 0.2425115, -0.4563765, 0.09803922, 1, 0, 1,
-0.4922553, -1.00063, -2.97339, 0.09019608, 1, 0, 1,
-0.4920944, 0.8986602, 1.131658, 0.08627451, 1, 0, 1,
-0.4865516, 0.4354431, 0.2135282, 0.07843138, 1, 0, 1,
-0.4775894, -3.164823, -1.773787, 0.07450981, 1, 0, 1,
-0.4742836, 0.7838185, 0.1543435, 0.06666667, 1, 0, 1,
-0.4731873, -0.4884932, -1.994218, 0.0627451, 1, 0, 1,
-0.4716717, -0.6652206, -4.091982, 0.05490196, 1, 0, 1,
-0.4701544, -0.6802323, -2.020229, 0.05098039, 1, 0, 1,
-0.4673071, 0.3472377, -2.634706, 0.04313726, 1, 0, 1,
-0.4653916, 0.5799023, -1.290433, 0.03921569, 1, 0, 1,
-0.4641957, -0.6836907, -1.939925, 0.03137255, 1, 0, 1,
-0.4602283, -0.1014151, -1.63189, 0.02745098, 1, 0, 1,
-0.4566497, -0.3496191, -2.3993, 0.01960784, 1, 0, 1,
-0.4487254, -0.1292968, -1.792359, 0.01568628, 1, 0, 1,
-0.4482117, -0.1140916, -3.156137, 0.007843138, 1, 0, 1,
-0.4469939, 1.536902, 0.3724958, 0.003921569, 1, 0, 1,
-0.4457837, -0.2459422, -1.565342, 0, 1, 0.003921569, 1,
-0.4428714, 0.7325139, -0.3628355, 0, 1, 0.01176471, 1,
-0.434748, 0.5796967, -1.219011, 0, 1, 0.01568628, 1,
-0.4299231, -1.292861, -1.944093, 0, 1, 0.02352941, 1,
-0.4220403, -1.784388, -2.015638, 0, 1, 0.02745098, 1,
-0.4184498, 0.8020023, 0.1004325, 0, 1, 0.03529412, 1,
-0.4163798, 0.4960143, -0.3870167, 0, 1, 0.03921569, 1,
-0.4157819, -0.8331589, -4.116584, 0, 1, 0.04705882, 1,
-0.4104801, 0.3945845, -1.269321, 0, 1, 0.05098039, 1,
-0.4085973, 0.3082193, 0.88883, 0, 1, 0.05882353, 1,
-0.4057564, -1.40635, -4.398256, 0, 1, 0.0627451, 1,
-0.3985726, -0.8120582, -1.480522, 0, 1, 0.07058824, 1,
-0.3886391, 0.4705234, -1.388428, 0, 1, 0.07450981, 1,
-0.3880196, 1.470476, -1.45479, 0, 1, 0.08235294, 1,
-0.3837798, -0.9774915, -1.369522, 0, 1, 0.08627451, 1,
-0.380846, -0.8829803, -4.03967, 0, 1, 0.09411765, 1,
-0.3789302, -0.6966534, -1.780438, 0, 1, 0.1019608, 1,
-0.3749701, -0.1655254, -2.863663, 0, 1, 0.1058824, 1,
-0.3653388, 0.2989355, 0.1293533, 0, 1, 0.1137255, 1,
-0.364169, 0.9471136, -0.9976181, 0, 1, 0.1176471, 1,
-0.3621192, -0.7749755, -3.299799, 0, 1, 0.1254902, 1,
-0.3585627, 0.768104, 1.194077, 0, 1, 0.1294118, 1,
-0.3536801, -0.1027984, -1.462377, 0, 1, 0.1372549, 1,
-0.35261, 0.8687992, -0.1323264, 0, 1, 0.1411765, 1,
-0.3513567, -0.3387017, -3.61985, 0, 1, 0.1490196, 1,
-0.3498356, 0.07324449, 0.01786709, 0, 1, 0.1529412, 1,
-0.3490207, -1.822508, -3.798898, 0, 1, 0.1607843, 1,
-0.3461311, 1.046, 0.6465304, 0, 1, 0.1647059, 1,
-0.3375007, 0.6644821, -0.2248162, 0, 1, 0.172549, 1,
-0.3291227, -0.4440323, -2.860464, 0, 1, 0.1764706, 1,
-0.3282838, -0.005531703, -1.006953, 0, 1, 0.1843137, 1,
-0.3166634, -0.192967, -1.316511, 0, 1, 0.1882353, 1,
-0.3163646, 0.3998457, -1.044965, 0, 1, 0.1960784, 1,
-0.314844, -1.166535, -3.473834, 0, 1, 0.2039216, 1,
-0.3107644, -0.3394785, -2.709221, 0, 1, 0.2078431, 1,
-0.3094533, -0.5937811, -1.904477, 0, 1, 0.2156863, 1,
-0.307036, -2.203689, -0.6647846, 0, 1, 0.2196078, 1,
-0.3025625, 0.357149, -1.015167, 0, 1, 0.227451, 1,
-0.3017546, 0.6483748, -0.6763924, 0, 1, 0.2313726, 1,
-0.3011435, -0.1416189, -1.508888, 0, 1, 0.2392157, 1,
-0.2918175, -0.09144484, -0.7057013, 0, 1, 0.2431373, 1,
-0.2917005, 0.4997173, 0.04914434, 0, 1, 0.2509804, 1,
-0.2902896, -2.407084, -0.5001088, 0, 1, 0.254902, 1,
-0.288763, -0.31004, -3.22557, 0, 1, 0.2627451, 1,
-0.2886146, 0.3547353, -1.171972, 0, 1, 0.2666667, 1,
-0.2841834, -0.6846396, -2.864069, 0, 1, 0.2745098, 1,
-0.2829201, 1.983553, 0.04165015, 0, 1, 0.2784314, 1,
-0.280183, 1.178991, 0.1092552, 0, 1, 0.2862745, 1,
-0.2798949, 0.8011456, 0.2076042, 0, 1, 0.2901961, 1,
-0.2727128, -0.3276888, -1.404021, 0, 1, 0.2980392, 1,
-0.2711584, 1.34401, 0.1636964, 0, 1, 0.3058824, 1,
-0.2702335, 1.269807, 1.423616, 0, 1, 0.3098039, 1,
-0.2671188, -0.5460961, -1.725104, 0, 1, 0.3176471, 1,
-0.2669279, 0.6856396, -0.04015798, 0, 1, 0.3215686, 1,
-0.2640305, 0.9594072, 0.4380161, 0, 1, 0.3294118, 1,
-0.2619151, -0.6210392, -2.81411, 0, 1, 0.3333333, 1,
-0.2592545, 0.4494448, -0.02272001, 0, 1, 0.3411765, 1,
-0.2587462, -0.4029667, -0.9169564, 0, 1, 0.345098, 1,
-0.2571013, -0.7898041, -2.193011, 0, 1, 0.3529412, 1,
-0.2550732, -0.3494861, -2.45785, 0, 1, 0.3568628, 1,
-0.2527014, 0.1414046, -1.870506, 0, 1, 0.3647059, 1,
-0.249369, -0.4546334, -2.792871, 0, 1, 0.3686275, 1,
-0.2484462, 2.138486, -0.9265295, 0, 1, 0.3764706, 1,
-0.2481576, 0.4891711, 1.560388, 0, 1, 0.3803922, 1,
-0.2481522, -1.402815, -3.633041, 0, 1, 0.3882353, 1,
-0.2452782, 0.4280542, -1.150218, 0, 1, 0.3921569, 1,
-0.2449728, -0.5562229, -3.18981, 0, 1, 0.4, 1,
-0.2445739, 0.8423063, 1.597577, 0, 1, 0.4078431, 1,
-0.2424699, 0.30536, 1.273089, 0, 1, 0.4117647, 1,
-0.2411122, 0.4243234, 1.156155, 0, 1, 0.4196078, 1,
-0.2375899, 1.178693, 0.03244284, 0, 1, 0.4235294, 1,
-0.2357938, -0.9724129, -3.965044, 0, 1, 0.4313726, 1,
-0.2316997, -0.134345, -1.213024, 0, 1, 0.4352941, 1,
-0.22178, 0.7401071, 1.528075, 0, 1, 0.4431373, 1,
-0.2181402, -1.011454, -4.276597, 0, 1, 0.4470588, 1,
-0.2126953, 0.7092642, -0.07155707, 0, 1, 0.454902, 1,
-0.2106818, 1.409488, -0.7908175, 0, 1, 0.4588235, 1,
-0.2082755, -0.7631745, -3.122616, 0, 1, 0.4666667, 1,
-0.2079086, -0.7574786, -2.970942, 0, 1, 0.4705882, 1,
-0.2007074, -0.9651147, -4.378082, 0, 1, 0.4784314, 1,
-0.1886248, -0.4248752, -0.8346961, 0, 1, 0.4823529, 1,
-0.1846785, 0.9702908, 0.01467927, 0, 1, 0.4901961, 1,
-0.1843518, 0.59578, -0.01434792, 0, 1, 0.4941176, 1,
-0.1812714, 0.8314102, 0.02537585, 0, 1, 0.5019608, 1,
-0.1799197, 0.1992676, -1.376746, 0, 1, 0.509804, 1,
-0.1774724, 0.5249117, -0.9336376, 0, 1, 0.5137255, 1,
-0.1771903, 0.3814767, -1.439088, 0, 1, 0.5215687, 1,
-0.1771047, 0.8886445, -1.845664, 0, 1, 0.5254902, 1,
-0.1764299, 2.401567, -0.7218426, 0, 1, 0.5333334, 1,
-0.1761786, -1.304718, -4.631248, 0, 1, 0.5372549, 1,
-0.1742953, 0.5126483, 0.8110809, 0, 1, 0.5450981, 1,
-0.1736062, -0.4404764, -3.191474, 0, 1, 0.5490196, 1,
-0.17115, 1.841842, -0.6670954, 0, 1, 0.5568628, 1,
-0.1679554, -1.357771, -2.950475, 0, 1, 0.5607843, 1,
-0.1670682, -1.101226, -1.767223, 0, 1, 0.5686275, 1,
-0.163525, -0.9464678, -3.329709, 0, 1, 0.572549, 1,
-0.162646, 1.612871, -0.6014187, 0, 1, 0.5803922, 1,
-0.1593418, 2.868168, -0.4076802, 0, 1, 0.5843138, 1,
-0.1585199, -0.3656278, -3.502012, 0, 1, 0.5921569, 1,
-0.1560632, -0.7894545, -3.464431, 0, 1, 0.5960785, 1,
-0.1550125, -0.8442127, -4.166252, 0, 1, 0.6039216, 1,
-0.1539586, -0.2661, -2.351372, 0, 1, 0.6117647, 1,
-0.14873, -2.3356, -5.101036, 0, 1, 0.6156863, 1,
-0.1475346, -1.939759, -5.195052, 0, 1, 0.6235294, 1,
-0.1467887, -0.1870625, -3.69234, 0, 1, 0.627451, 1,
-0.1463898, 0.4755281, -0.2560768, 0, 1, 0.6352941, 1,
-0.1455341, 1.067079, 0.4763642, 0, 1, 0.6392157, 1,
-0.1452892, -0.8916267, -3.649555, 0, 1, 0.6470588, 1,
-0.1444045, -0.8510092, -0.6186789, 0, 1, 0.6509804, 1,
-0.1420344, -0.27782, -2.602238, 0, 1, 0.6588235, 1,
-0.1393266, 1.414904, 1.700284, 0, 1, 0.6627451, 1,
-0.1374566, -0.7421585, -3.256463, 0, 1, 0.6705883, 1,
-0.1368437, -0.1385799, -3.205132, 0, 1, 0.6745098, 1,
-0.1355522, -0.3710015, -2.378591, 0, 1, 0.682353, 1,
-0.1348228, -2.026349, -4.161542, 0, 1, 0.6862745, 1,
-0.1338975, -0.3880959, -3.431214, 0, 1, 0.6941177, 1,
-0.1326859, 0.08143108, -1.486305, 0, 1, 0.7019608, 1,
-0.1323956, 1.350588, -1.080519, 0, 1, 0.7058824, 1,
-0.1306228, -0.3613988, -2.688207, 0, 1, 0.7137255, 1,
-0.1285661, 1.242659, -0.1172932, 0, 1, 0.7176471, 1,
-0.12523, 1.102542, 0.4771428, 0, 1, 0.7254902, 1,
-0.1224732, 0.5484771, -1.313064, 0, 1, 0.7294118, 1,
-0.1215916, 0.484681, -0.2980256, 0, 1, 0.7372549, 1,
-0.1189489, -0.1726635, -2.102219, 0, 1, 0.7411765, 1,
-0.1172519, -0.7202026, -1.992317, 0, 1, 0.7490196, 1,
-0.1165602, 0.9261203, 1.233717, 0, 1, 0.7529412, 1,
-0.1153913, 2.87601, 0.6722093, 0, 1, 0.7607843, 1,
-0.1074054, 0.2341796, -0.263335, 0, 1, 0.7647059, 1,
-0.1017606, -0.1742388, -3.366017, 0, 1, 0.772549, 1,
-0.09891009, -0.6702534, -4.190045, 0, 1, 0.7764706, 1,
-0.09608337, 1.321317, -0.8126131, 0, 1, 0.7843137, 1,
-0.09470689, 0.3073383, 0.5111815, 0, 1, 0.7882353, 1,
-0.09231775, -1.451624, -2.784194, 0, 1, 0.7960784, 1,
-0.08876486, -0.644735, -3.684461, 0, 1, 0.8039216, 1,
-0.08404143, -0.6141813, -2.865982, 0, 1, 0.8078431, 1,
-0.07978914, -0.06128224, -2.205322, 0, 1, 0.8156863, 1,
-0.07956235, 0.3749537, -0.7137347, 0, 1, 0.8196079, 1,
-0.07857311, 1.437654, -0.1893986, 0, 1, 0.827451, 1,
-0.07433449, 0.6178737, 0.09119038, 0, 1, 0.8313726, 1,
-0.07247227, -0.4698403, -4.055297, 0, 1, 0.8392157, 1,
-0.0711172, -0.4258858, -2.762792, 0, 1, 0.8431373, 1,
-0.06535572, 0.6176939, -0.5513857, 0, 1, 0.8509804, 1,
-0.06508859, 1.914806, -0.2166221, 0, 1, 0.854902, 1,
-0.06159693, 1.007477, 0.2660796, 0, 1, 0.8627451, 1,
-0.05279439, -1.313458, -2.831652, 0, 1, 0.8666667, 1,
-0.04838297, -0.6352004, -4.681107, 0, 1, 0.8745098, 1,
-0.04569115, 1.099339, -0.9479319, 0, 1, 0.8784314, 1,
-0.04394188, -0.5244954, -2.958397, 0, 1, 0.8862745, 1,
-0.04013433, 0.5143725, 1.815539, 0, 1, 0.8901961, 1,
-0.03586436, -1.574407, -3.171169, 0, 1, 0.8980392, 1,
-0.03428073, -1.205769, -3.679405, 0, 1, 0.9058824, 1,
-0.03350238, -0.4444652, -2.333455, 0, 1, 0.9098039, 1,
-0.03333623, -2.464214, -3.715943, 0, 1, 0.9176471, 1,
-0.02854083, 0.175382, 0.5883695, 0, 1, 0.9215686, 1,
-0.02091712, -0.06726579, -3.957027, 0, 1, 0.9294118, 1,
-0.02072026, 0.7741109, 0.7086943, 0, 1, 0.9333333, 1,
-0.01276027, -0.4911767, -2.002683, 0, 1, 0.9411765, 1,
-0.01256991, 0.179862, 0.851822, 0, 1, 0.945098, 1,
-0.01203282, -2.366744, -1.848105, 0, 1, 0.9529412, 1,
-0.01156165, 2.038392, -0.654642, 0, 1, 0.9568627, 1,
-0.01133461, 0.4235049, 1.362614, 0, 1, 0.9647059, 1,
-0.01071398, 1.871886, -0.7443869, 0, 1, 0.9686275, 1,
-0.007453053, 0.9374699, 0.1359756, 0, 1, 0.9764706, 1,
-0.005195769, 1.147638, 0.1752185, 0, 1, 0.9803922, 1,
-0.003535657, 0.8101835, -0.6656281, 0, 1, 0.9882353, 1,
-0.001263072, 2.096501, 0.3269109, 0, 1, 0.9921569, 1,
-0.001226476, 0.6319306, -1.423947, 0, 1, 1, 1,
0.003187015, 1.739196, 1.041145, 0, 0.9921569, 1, 1,
0.006213934, 0.03359234, 0.9412218, 0, 0.9882353, 1, 1,
0.007740045, 1.498954, -0.8170399, 0, 0.9803922, 1, 1,
0.007847652, -0.4717984, 4.866961, 0, 0.9764706, 1, 1,
0.01383879, 0.798924, -0.9341767, 0, 0.9686275, 1, 1,
0.01437739, -0.7125468, 3.493109, 0, 0.9647059, 1, 1,
0.01784356, 1.235728, -0.35903, 0, 0.9568627, 1, 1,
0.01916952, 0.3061917, -2.386324, 0, 0.9529412, 1, 1,
0.02211362, -0.7126402, 1.472611, 0, 0.945098, 1, 1,
0.02236158, 0.2599916, 1.105295, 0, 0.9411765, 1, 1,
0.02341822, -1.342761, 5.550682, 0, 0.9333333, 1, 1,
0.02604585, 0.5345103, -0.9552116, 0, 0.9294118, 1, 1,
0.02666662, -1.23277, 3.557014, 0, 0.9215686, 1, 1,
0.02872165, 0.3474244, -0.8051095, 0, 0.9176471, 1, 1,
0.03041932, 0.05481284, -0.9024286, 0, 0.9098039, 1, 1,
0.03431248, -0.4692642, 5.043977, 0, 0.9058824, 1, 1,
0.03484305, -0.5723585, 3.174759, 0, 0.8980392, 1, 1,
0.03822025, 0.444448, -1.443564, 0, 0.8901961, 1, 1,
0.04035633, -2.208663, 4.847329, 0, 0.8862745, 1, 1,
0.04318542, -2.635125, 3.31486, 0, 0.8784314, 1, 1,
0.04407891, -0.09115681, 3.469452, 0, 0.8745098, 1, 1,
0.04674243, 2.047094, -0.07256552, 0, 0.8666667, 1, 1,
0.05079208, 2.002957, 0.4650164, 0, 0.8627451, 1, 1,
0.05479278, 1.269341, -0.4000753, 0, 0.854902, 1, 1,
0.05587454, -0.5756109, 4.042882, 0, 0.8509804, 1, 1,
0.06045368, -1.2079, 2.755951, 0, 0.8431373, 1, 1,
0.06048359, -0.8581628, 4.327025, 0, 0.8392157, 1, 1,
0.06064315, 0.02453321, 1.753217, 0, 0.8313726, 1, 1,
0.06081786, -1.554789, 3.098779, 0, 0.827451, 1, 1,
0.06452839, -2.127073, 3.643675, 0, 0.8196079, 1, 1,
0.06832891, 0.5629829, 0.09553313, 0, 0.8156863, 1, 1,
0.06935113, 0.974135, 1.499117, 0, 0.8078431, 1, 1,
0.07217418, -0.5243407, 5.027133, 0, 0.8039216, 1, 1,
0.0772189, -0.2241761, 2.271591, 0, 0.7960784, 1, 1,
0.07748584, -0.8349365, 4.544732, 0, 0.7882353, 1, 1,
0.07915156, 2.715665, -1.753716, 0, 0.7843137, 1, 1,
0.07980134, 1.089508, -1.006683, 0, 0.7764706, 1, 1,
0.09200599, -0.9755284, 2.814059, 0, 0.772549, 1, 1,
0.09535948, -0.3528093, 2.874116, 0, 0.7647059, 1, 1,
0.09601883, 1.377538, -0.06844845, 0, 0.7607843, 1, 1,
0.0962099, 0.5779217, 0.9409305, 0, 0.7529412, 1, 1,
0.102492, -0.01420809, 1.107288, 0, 0.7490196, 1, 1,
0.1030749, -0.6445593, 1.705142, 0, 0.7411765, 1, 1,
0.1050118, 1.630507, -1.234118, 0, 0.7372549, 1, 1,
0.1072599, -0.3702852, 4.400421, 0, 0.7294118, 1, 1,
0.108081, -1.191561, 3.153139, 0, 0.7254902, 1, 1,
0.1092013, 0.1601186, 1.373458, 0, 0.7176471, 1, 1,
0.110405, 1.91954, 1.477689, 0, 0.7137255, 1, 1,
0.1119534, -0.9137197, 3.111053, 0, 0.7058824, 1, 1,
0.1133497, -0.3213754, 2.46064, 0, 0.6980392, 1, 1,
0.1146756, 1.509165, -0.3563103, 0, 0.6941177, 1, 1,
0.1178295, -0.6407968, 0.6487212, 0, 0.6862745, 1, 1,
0.1194719, 2.743345, 1.342075, 0, 0.682353, 1, 1,
0.1197708, -0.8738683, 4.893963, 0, 0.6745098, 1, 1,
0.1199701, 1.529263, 0.8430622, 0, 0.6705883, 1, 1,
0.1237827, 2.21271, -1.02059, 0, 0.6627451, 1, 1,
0.1292391, 0.9219057, 0.7099502, 0, 0.6588235, 1, 1,
0.1302252, -1.489861, 1.837986, 0, 0.6509804, 1, 1,
0.1318632, 0.4569826, 0.3661889, 0, 0.6470588, 1, 1,
0.133644, -1.433278, 2.532648, 0, 0.6392157, 1, 1,
0.1360308, 0.2013993, 0.8411003, 0, 0.6352941, 1, 1,
0.14182, 0.08247996, 0.1157767, 0, 0.627451, 1, 1,
0.1477399, -1.545853, 1.266284, 0, 0.6235294, 1, 1,
0.1505965, -0.4659662, 4.026105, 0, 0.6156863, 1, 1,
0.1518241, 0.0640798, 1.912294, 0, 0.6117647, 1, 1,
0.1525949, -0.8272353, 3.611006, 0, 0.6039216, 1, 1,
0.1538797, -0.9520305, 4.095547, 0, 0.5960785, 1, 1,
0.1555443, 1.122343, 0.5842358, 0, 0.5921569, 1, 1,
0.1603914, 0.5749074, -0.5541604, 0, 0.5843138, 1, 1,
0.1635673, -0.5740073, 1.794982, 0, 0.5803922, 1, 1,
0.172341, -0.05455654, 2.083271, 0, 0.572549, 1, 1,
0.1753395, 0.9559814, 0.7334108, 0, 0.5686275, 1, 1,
0.1777193, -2.635359, 1.390024, 0, 0.5607843, 1, 1,
0.1788199, -1.356767, 2.767915, 0, 0.5568628, 1, 1,
0.1805156, -0.3007264, 2.107502, 0, 0.5490196, 1, 1,
0.1813834, 0.5542749, -0.730342, 0, 0.5450981, 1, 1,
0.1854824, -0.1449097, 3.850631, 0, 0.5372549, 1, 1,
0.187301, 0.09385602, 1.892142, 0, 0.5333334, 1, 1,
0.1903162, -0.03223679, 2.629245, 0, 0.5254902, 1, 1,
0.1941873, 0.5393621, 0.3118246, 0, 0.5215687, 1, 1,
0.1949358, 1.581716, -0.7033061, 0, 0.5137255, 1, 1,
0.2021879, -0.1095129, 2.109145, 0, 0.509804, 1, 1,
0.2073622, -0.3720225, 1.363497, 0, 0.5019608, 1, 1,
0.2084699, 0.3638073, 0.9207889, 0, 0.4941176, 1, 1,
0.2110973, 0.6449569, 0.4329585, 0, 0.4901961, 1, 1,
0.2145064, -0.5787877, 3.006282, 0, 0.4823529, 1, 1,
0.2159287, 0.4575329, 0.3887999, 0, 0.4784314, 1, 1,
0.2164126, 0.6516342, 0.551529, 0, 0.4705882, 1, 1,
0.2169769, 1.474222, 1.32812, 0, 0.4666667, 1, 1,
0.2177608, 1.201268, -1.311172, 0, 0.4588235, 1, 1,
0.2222343, 0.5630014, 1.071607, 0, 0.454902, 1, 1,
0.224535, -0.1431821, 3.609059, 0, 0.4470588, 1, 1,
0.2361623, -0.7386734, 3.128741, 0, 0.4431373, 1, 1,
0.2392627, 0.3482991, 1.654776, 0, 0.4352941, 1, 1,
0.239391, -1.448513, 1.823194, 0, 0.4313726, 1, 1,
0.2481258, -2.104573, 2.989801, 0, 0.4235294, 1, 1,
0.2525953, -1.239815, 3.380428, 0, 0.4196078, 1, 1,
0.2557178, -0.5454005, 3.325539, 0, 0.4117647, 1, 1,
0.2561472, -1.775759, 3.267688, 0, 0.4078431, 1, 1,
0.256717, 0.1277044, -0.1885655, 0, 0.4, 1, 1,
0.2590505, -0.5620452, 3.185779, 0, 0.3921569, 1, 1,
0.2601761, 0.7442774, -0.6811923, 0, 0.3882353, 1, 1,
0.2611024, 0.4766156, 0.5295434, 0, 0.3803922, 1, 1,
0.2619854, -0.04057727, 2.585754, 0, 0.3764706, 1, 1,
0.2633751, -1.250396, 3.973133, 0, 0.3686275, 1, 1,
0.2648653, 1.32514, 0.6985611, 0, 0.3647059, 1, 1,
0.26773, -0.8104198, 3.383919, 0, 0.3568628, 1, 1,
0.2709624, -0.5586029, 2.901186, 0, 0.3529412, 1, 1,
0.2756572, -0.3881592, 2.740919, 0, 0.345098, 1, 1,
0.2770803, 0.06470925, 2.199105, 0, 0.3411765, 1, 1,
0.2785515, -1.193398, 4.411711, 0, 0.3333333, 1, 1,
0.2809313, -0.5653919, 2.067297, 0, 0.3294118, 1, 1,
0.2836958, -2.141016, 1.611932, 0, 0.3215686, 1, 1,
0.2860412, -0.6274846, 2.984641, 0, 0.3176471, 1, 1,
0.2861363, -0.02094197, 0.4562826, 0, 0.3098039, 1, 1,
0.2875421, 0.8724317, 0.6399841, 0, 0.3058824, 1, 1,
0.2878447, 1.993455, -0.1237073, 0, 0.2980392, 1, 1,
0.289047, 0.04465759, 0.02177852, 0, 0.2901961, 1, 1,
0.2907941, 0.3649105, -1.675113, 0, 0.2862745, 1, 1,
0.2926525, 0.01603209, 3.015955, 0, 0.2784314, 1, 1,
0.2989148, -0.5013446, 1.129634, 0, 0.2745098, 1, 1,
0.3026196, 2.116889, 0.2261782, 0, 0.2666667, 1, 1,
0.3046172, 2.563726, 0.3692802, 0, 0.2627451, 1, 1,
0.3079729, -1.081458, 3.63439, 0, 0.254902, 1, 1,
0.3099181, 2.18499, 0.880612, 0, 0.2509804, 1, 1,
0.3132866, 0.02700388, 1.294746, 0, 0.2431373, 1, 1,
0.3171392, 0.3144474, 0.595153, 0, 0.2392157, 1, 1,
0.3171581, 0.6157945, 0.7039733, 0, 0.2313726, 1, 1,
0.3192433, -0.5225552, 2.057349, 0, 0.227451, 1, 1,
0.325616, 0.17573, 0.95999, 0, 0.2196078, 1, 1,
0.3278832, -0.59022, 2.598686, 0, 0.2156863, 1, 1,
0.3310323, -0.3252712, 1.293951, 0, 0.2078431, 1, 1,
0.3328242, -0.001398125, 1.999697, 0, 0.2039216, 1, 1,
0.3369023, -1.238226, 4.244719, 0, 0.1960784, 1, 1,
0.340499, -1.353595, 2.445332, 0, 0.1882353, 1, 1,
0.344427, 0.2076837, -0.5998635, 0, 0.1843137, 1, 1,
0.3470021, -0.05718463, 2.049588, 0, 0.1764706, 1, 1,
0.3493304, -0.01720284, 2.174966, 0, 0.172549, 1, 1,
0.349354, 0.8025882, -0.3352346, 0, 0.1647059, 1, 1,
0.3507944, 1.832572, -1.292245, 0, 0.1607843, 1, 1,
0.3553075, -0.866163, 2.210818, 0, 0.1529412, 1, 1,
0.3628344, 1.746413, -1.64814, 0, 0.1490196, 1, 1,
0.3696881, 0.6359602, 0.9010004, 0, 0.1411765, 1, 1,
0.3730844, -0.1433205, 2.616544, 0, 0.1372549, 1, 1,
0.3742081, -0.08641212, 1.604344, 0, 0.1294118, 1, 1,
0.3745302, -0.6994703, 1.847835, 0, 0.1254902, 1, 1,
0.3753411, 0.847213, 0.8182341, 0, 0.1176471, 1, 1,
0.376507, -0.6933998, 2.210577, 0, 0.1137255, 1, 1,
0.3784668, -0.2756127, 2.862144, 0, 0.1058824, 1, 1,
0.3794244, 0.4226389, 0.519838, 0, 0.09803922, 1, 1,
0.3805773, 0.1957407, -0.5832309, 0, 0.09411765, 1, 1,
0.3864775, 0.5342805, 0.8162403, 0, 0.08627451, 1, 1,
0.3896029, 0.7000976, 2.783391, 0, 0.08235294, 1, 1,
0.3899856, -0.2297803, 2.415233, 0, 0.07450981, 1, 1,
0.3919824, -0.4413538, 0.3188715, 0, 0.07058824, 1, 1,
0.393375, 1.224287, 1.397453, 0, 0.0627451, 1, 1,
0.4050061, 0.1611881, 2.008918, 0, 0.05882353, 1, 1,
0.4071631, 0.7933185, 0.02521331, 0, 0.05098039, 1, 1,
0.4073543, -0.3391628, 0.9825248, 0, 0.04705882, 1, 1,
0.4121312, -1.000331, 2.721867, 0, 0.03921569, 1, 1,
0.4131966, -0.1496959, 1.611699, 0, 0.03529412, 1, 1,
0.4147888, 0.662872, -0.2161258, 0, 0.02745098, 1, 1,
0.4225232, -1.116749, 1.389328, 0, 0.02352941, 1, 1,
0.4256795, -0.2107218, 2.14783, 0, 0.01568628, 1, 1,
0.429518, 0.4668648, 0.1805829, 0, 0.01176471, 1, 1,
0.4295702, 0.8821521, 1.075633, 0, 0.003921569, 1, 1,
0.4314517, -0.2224973, 2.223763, 0.003921569, 0, 1, 1,
0.4326726, -0.2240758, 1.368796, 0.007843138, 0, 1, 1,
0.4332421, 0.2314629, 1.425117, 0.01568628, 0, 1, 1,
0.4384477, 2.678254, -1.896748, 0.01960784, 0, 1, 1,
0.4385905, 0.5801973, 0.5332655, 0.02745098, 0, 1, 1,
0.4418217, -1.006992, 2.320404, 0.03137255, 0, 1, 1,
0.4524601, -0.04447215, 1.593681, 0.03921569, 0, 1, 1,
0.4527585, -0.8672389, 3.120251, 0.04313726, 0, 1, 1,
0.4534161, -1.844452, 3.855839, 0.05098039, 0, 1, 1,
0.4550516, -0.274605, 0.9357403, 0.05490196, 0, 1, 1,
0.4576068, 0.9746023, 0.9623079, 0.0627451, 0, 1, 1,
0.4590836, 0.9523926, -0.7653878, 0.06666667, 0, 1, 1,
0.4662676, -0.9085801, 4.125867, 0.07450981, 0, 1, 1,
0.4668613, -0.9435747, 3.078102, 0.07843138, 0, 1, 1,
0.4720881, -0.973167, 3.077846, 0.08627451, 0, 1, 1,
0.4731939, -0.8444319, 1.991457, 0.09019608, 0, 1, 1,
0.4759665, 1.655865, -0.1870614, 0.09803922, 0, 1, 1,
0.476041, -0.1103246, 1.387548, 0.1058824, 0, 1, 1,
0.4770576, 0.4572159, 1.857533, 0.1098039, 0, 1, 1,
0.4846235, -0.3006448, 2.658035, 0.1176471, 0, 1, 1,
0.4888952, 1.008745, 1.03401, 0.1215686, 0, 1, 1,
0.4915414, 0.05771295, 0.2657584, 0.1294118, 0, 1, 1,
0.4920288, 0.2200419, 1.483704, 0.1333333, 0, 1, 1,
0.4923163, 0.942719, -0.6261265, 0.1411765, 0, 1, 1,
0.4941307, -1.353814, 2.910729, 0.145098, 0, 1, 1,
0.4965455, 1.198976, 1.963012, 0.1529412, 0, 1, 1,
0.4967719, -0.8128381, 2.331889, 0.1568628, 0, 1, 1,
0.4975069, -1.665307, 1.224914, 0.1647059, 0, 1, 1,
0.5018804, -0.4120069, 3.567326, 0.1686275, 0, 1, 1,
0.5021713, 0.6496174, 0.9687311, 0.1764706, 0, 1, 1,
0.5025553, -0.5564868, 2.180822, 0.1803922, 0, 1, 1,
0.5039219, 0.6172882, -1.277742, 0.1882353, 0, 1, 1,
0.5046129, 1.498172, -1.530545, 0.1921569, 0, 1, 1,
0.5056737, -1.331353, 3.111438, 0.2, 0, 1, 1,
0.5059221, 0.3174604, 2.786766, 0.2078431, 0, 1, 1,
0.507952, 1.486137, 1.928678, 0.2117647, 0, 1, 1,
0.5108881, -1.679006, 2.223028, 0.2196078, 0, 1, 1,
0.5151857, -0.4831529, 1.559571, 0.2235294, 0, 1, 1,
0.5153212, 0.1804151, 0.9146714, 0.2313726, 0, 1, 1,
0.5159735, 0.6278276, 0.4343102, 0.2352941, 0, 1, 1,
0.5173399, 2.399639, -0.1798075, 0.2431373, 0, 1, 1,
0.5180603, 1.450878, -0.2876546, 0.2470588, 0, 1, 1,
0.5182673, 0.2432545, 1.722017, 0.254902, 0, 1, 1,
0.522072, -1.201797, 2.730966, 0.2588235, 0, 1, 1,
0.5237014, -0.3568063, 0.1092311, 0.2666667, 0, 1, 1,
0.5251549, -0.5897138, 1.748028, 0.2705882, 0, 1, 1,
0.5291524, 0.9692151, -0.5228709, 0.2784314, 0, 1, 1,
0.5369897, 0.01741024, 1.679125, 0.282353, 0, 1, 1,
0.5373417, 0.9920697, -0.202578, 0.2901961, 0, 1, 1,
0.5386347, -0.4292658, 2.56994, 0.2941177, 0, 1, 1,
0.5392206, -1.830792, 3.88786, 0.3019608, 0, 1, 1,
0.5394318, 1.079433, 1.004057, 0.3098039, 0, 1, 1,
0.5398825, -0.3023167, 3.091996, 0.3137255, 0, 1, 1,
0.5421315, 0.5691714, 0.07612778, 0.3215686, 0, 1, 1,
0.5443095, -1.17132, 1.305201, 0.3254902, 0, 1, 1,
0.5529682, -0.1758269, 1.52206, 0.3333333, 0, 1, 1,
0.5534484, 0.5354309, 0.7968273, 0.3372549, 0, 1, 1,
0.5582763, 1.565389, -0.1794956, 0.345098, 0, 1, 1,
0.5641068, -0.7486746, 3.062419, 0.3490196, 0, 1, 1,
0.573891, 0.5395757, 1.598602, 0.3568628, 0, 1, 1,
0.5784129, -1.657831, 2.99166, 0.3607843, 0, 1, 1,
0.5794138, 2.076091, -0.9632243, 0.3686275, 0, 1, 1,
0.5821933, -0.3483286, 3.04369, 0.372549, 0, 1, 1,
0.5824696, 1.325207, -0.1630248, 0.3803922, 0, 1, 1,
0.5829546, -0.2411898, 2.066531, 0.3843137, 0, 1, 1,
0.5939228, 1.857264, 0.0009786882, 0.3921569, 0, 1, 1,
0.5949237, -0.1429518, 3.735068, 0.3960784, 0, 1, 1,
0.5949931, 0.2997502, 2.03335, 0.4039216, 0, 1, 1,
0.5970563, 0.04629611, 1.856367, 0.4117647, 0, 1, 1,
0.6008912, 0.5308158, 1.276833, 0.4156863, 0, 1, 1,
0.6064757, -1.446285, 3.575762, 0.4235294, 0, 1, 1,
0.6093798, -1.123427, 2.971698, 0.427451, 0, 1, 1,
0.6243231, 0.5584298, 0.9549922, 0.4352941, 0, 1, 1,
0.6247874, -1.161376, 4.839172, 0.4392157, 0, 1, 1,
0.626133, -0.7106026, 2.093441, 0.4470588, 0, 1, 1,
0.6302258, 0.1729481, 0.5586833, 0.4509804, 0, 1, 1,
0.6344903, 1.610174, 0.5502071, 0.4588235, 0, 1, 1,
0.6382807, 0.200027, 1.644792, 0.4627451, 0, 1, 1,
0.6419999, -0.2627322, 2.809684, 0.4705882, 0, 1, 1,
0.6517082, 0.01076511, 0.3497881, 0.4745098, 0, 1, 1,
0.6529112, 1.7139, 0.2954132, 0.4823529, 0, 1, 1,
0.6541701, -1.452925, 1.468932, 0.4862745, 0, 1, 1,
0.656082, -0.06093936, 1.277669, 0.4941176, 0, 1, 1,
0.6631507, -0.2617867, 1.433925, 0.5019608, 0, 1, 1,
0.6671751, -0.9163714, 2.274158, 0.5058824, 0, 1, 1,
0.6705466, -0.7430084, 3.559536, 0.5137255, 0, 1, 1,
0.6706694, -2.077514, 3.887989, 0.5176471, 0, 1, 1,
0.6785384, -0.2820351, 1.667388, 0.5254902, 0, 1, 1,
0.6798158, -0.7322935, 2.846637, 0.5294118, 0, 1, 1,
0.6868752, 0.8289604, 1.879011, 0.5372549, 0, 1, 1,
0.6869193, 0.6726435, 0.5198333, 0.5411765, 0, 1, 1,
0.7002504, 1.995863, -1.172567, 0.5490196, 0, 1, 1,
0.7032173, 0.1289807, 1.59174, 0.5529412, 0, 1, 1,
0.7033774, 0.8801099, 1.466616, 0.5607843, 0, 1, 1,
0.7046337, 0.3532967, 2.736427, 0.5647059, 0, 1, 1,
0.7083794, 2.028914, -1.311276, 0.572549, 0, 1, 1,
0.7109554, 0.467283, 1.797614, 0.5764706, 0, 1, 1,
0.7155706, -1.629882, 3.574314, 0.5843138, 0, 1, 1,
0.7190941, -1.901587, 2.676589, 0.5882353, 0, 1, 1,
0.7217126, 0.102193, 2.006572, 0.5960785, 0, 1, 1,
0.7271852, 1.567953, 0.0894896, 0.6039216, 0, 1, 1,
0.7299351, -0.8539562, 2.543658, 0.6078432, 0, 1, 1,
0.737085, -0.2700792, 2.685793, 0.6156863, 0, 1, 1,
0.7442307, -0.9650002, -0.03315124, 0.6196079, 0, 1, 1,
0.7442346, -0.522011, 1.15145, 0.627451, 0, 1, 1,
0.744239, 0.15623, 0.5762237, 0.6313726, 0, 1, 1,
0.7450998, -0.6612284, 3.320789, 0.6392157, 0, 1, 1,
0.7466028, 0.005044387, 2.147629, 0.6431373, 0, 1, 1,
0.758943, -0.7815148, 2.825401, 0.6509804, 0, 1, 1,
0.7591138, 1.162187, -1.51923, 0.654902, 0, 1, 1,
0.7653935, 0.7820696, 1.051017, 0.6627451, 0, 1, 1,
0.7760039, 0.3133048, 1.322517, 0.6666667, 0, 1, 1,
0.7779371, 0.2543722, 1.689931, 0.6745098, 0, 1, 1,
0.7838707, 0.4638084, 1.068968, 0.6784314, 0, 1, 1,
0.7904479, -1.522814, 2.680546, 0.6862745, 0, 1, 1,
0.7912896, -0.8527828, 2.423802, 0.6901961, 0, 1, 1,
0.7957204, 0.7201552, 0.993956, 0.6980392, 0, 1, 1,
0.8009757, 0.08355094, 0.8893039, 0.7058824, 0, 1, 1,
0.8037245, 1.290989, 1.116917, 0.7098039, 0, 1, 1,
0.8042275, -0.9286727, 0.8123692, 0.7176471, 0, 1, 1,
0.8091457, -1.30882, 2.451527, 0.7215686, 0, 1, 1,
0.8208293, -1.136399, 2.609195, 0.7294118, 0, 1, 1,
0.8257166, -0.3896559, 2.996871, 0.7333333, 0, 1, 1,
0.8257728, -0.7113015, 2.373239, 0.7411765, 0, 1, 1,
0.8273822, 0.4492111, 1.817284, 0.7450981, 0, 1, 1,
0.8299745, 0.2928552, 1.281356, 0.7529412, 0, 1, 1,
0.8338884, 0.4366317, 2.114758, 0.7568628, 0, 1, 1,
0.8410522, 0.5645074, 0.4957159, 0.7647059, 0, 1, 1,
0.8483331, -2.106715, 3.544852, 0.7686275, 0, 1, 1,
0.8505759, -0.2958662, 1.560312, 0.7764706, 0, 1, 1,
0.8508703, -0.1224528, 1.077111, 0.7803922, 0, 1, 1,
0.8560954, 0.2110854, 1.423152, 0.7882353, 0, 1, 1,
0.8566751, 2.126416, 0.1084627, 0.7921569, 0, 1, 1,
0.8615025, 0.6920298, 0.0834039, 0.8, 0, 1, 1,
0.8616058, 0.8636399, 2.264719, 0.8078431, 0, 1, 1,
0.8637964, -0.03504036, 1.20674, 0.8117647, 0, 1, 1,
0.8691683, 1.040772, 0.1702717, 0.8196079, 0, 1, 1,
0.8786634, 0.6896481, -0.9484972, 0.8235294, 0, 1, 1,
0.8806378, -0.3755759, 2.764186, 0.8313726, 0, 1, 1,
0.8815712, 0.9249408, 2.154872, 0.8352941, 0, 1, 1,
0.8824121, -0.008141153, 0.5155958, 0.8431373, 0, 1, 1,
0.8882644, -0.5137139, 0.07633365, 0.8470588, 0, 1, 1,
0.8908796, -0.2936004, 3.258734, 0.854902, 0, 1, 1,
0.8915579, -0.3770565, 2.355047, 0.8588235, 0, 1, 1,
0.8962975, 0.4452962, 1.639756, 0.8666667, 0, 1, 1,
0.8978314, -1.660149, 1.32032, 0.8705882, 0, 1, 1,
0.8984988, -0.02705268, -0.1780058, 0.8784314, 0, 1, 1,
0.8990373, 0.6867062, 2.037249, 0.8823529, 0, 1, 1,
0.901429, 0.7021332, -0.2100475, 0.8901961, 0, 1, 1,
0.9034462, 0.4483733, 1.09972, 0.8941177, 0, 1, 1,
0.9076931, -0.7737145, 2.661978, 0.9019608, 0, 1, 1,
0.9105543, -0.6929588, 2.074797, 0.9098039, 0, 1, 1,
0.9112926, -1.387431, 3.502162, 0.9137255, 0, 1, 1,
0.9182556, 0.8080497, 0.6011366, 0.9215686, 0, 1, 1,
0.9189798, -0.3464112, 2.013251, 0.9254902, 0, 1, 1,
0.9190134, 0.317947, 2.268851, 0.9333333, 0, 1, 1,
0.9202818, 2.597368, 1.02808, 0.9372549, 0, 1, 1,
0.9229081, 1.38696, 0.8507864, 0.945098, 0, 1, 1,
0.9287729, 0.02613585, 1.746775, 0.9490196, 0, 1, 1,
0.9333711, 0.4588016, 3.101538, 0.9568627, 0, 1, 1,
0.9369876, -0.3138225, 1.339357, 0.9607843, 0, 1, 1,
0.9384255, 1.21918, 1.383437, 0.9686275, 0, 1, 1,
0.9424084, 0.07142483, 0.6474568, 0.972549, 0, 1, 1,
0.9425641, 0.6089877, 0.7929465, 0.9803922, 0, 1, 1,
0.9431319, 1.940266, 3.241292, 0.9843137, 0, 1, 1,
0.9439347, 0.04898666, 0.9806314, 0.9921569, 0, 1, 1,
0.9461729, 0.7107762, 0.9929202, 0.9960784, 0, 1, 1,
0.9507011, 0.6787639, 1.178898, 1, 0, 0.9960784, 1,
0.9545834, 0.05771716, 0.3912974, 1, 0, 0.9882353, 1,
0.9549831, 0.9642247, -0.0110608, 1, 0, 0.9843137, 1,
0.9596381, 0.02119977, 2.426869, 1, 0, 0.9764706, 1,
0.9602371, -1.19215, 3.266804, 1, 0, 0.972549, 1,
0.9607795, 0.5292866, 1.436929, 1, 0, 0.9647059, 1,
0.9640418, -0.6699563, 2.921259, 1, 0, 0.9607843, 1,
0.9641369, 1.630922, 2.270994, 1, 0, 0.9529412, 1,
0.9929825, -0.2129699, 1.598642, 1, 0, 0.9490196, 1,
0.9930754, 0.4235867, 0.1362398, 1, 0, 0.9411765, 1,
0.9982497, 0.9841671, 0.2315305, 1, 0, 0.9372549, 1,
0.9986776, -0.04642187, 2.083406, 1, 0, 0.9294118, 1,
0.9999272, 0.7227998, -0.3919943, 1, 0, 0.9254902, 1,
1.000754, -2.526127, 2.119574, 1, 0, 0.9176471, 1,
1.011472, -0.9009252, 4.614532, 1, 0, 0.9137255, 1,
1.02624, -0.5827482, 2.548714, 1, 0, 0.9058824, 1,
1.031715, -0.882632, 3.979542, 1, 0, 0.9019608, 1,
1.032786, -0.3028788, 0.8923934, 1, 0, 0.8941177, 1,
1.036908, -1.252658, 3.362643, 1, 0, 0.8862745, 1,
1.043594, -0.636766, 2.314138, 1, 0, 0.8823529, 1,
1.04378, 0.2020662, 1.05534, 1, 0, 0.8745098, 1,
1.04559, 0.5761178, 1.712499, 1, 0, 0.8705882, 1,
1.054024, -0.5791523, 4.413374, 1, 0, 0.8627451, 1,
1.060334, -0.3802006, -0.003704744, 1, 0, 0.8588235, 1,
1.060346, -1.455857, 2.005278, 1, 0, 0.8509804, 1,
1.060926, -0.4594444, 1.295896, 1, 0, 0.8470588, 1,
1.062123, 0.05639149, 1.808082, 1, 0, 0.8392157, 1,
1.093432, 0.7259, -0.4967219, 1, 0, 0.8352941, 1,
1.094183, 0.1346357, 1.500751, 1, 0, 0.827451, 1,
1.094668, -0.6171883, 2.784601, 1, 0, 0.8235294, 1,
1.105579, 0.3341526, 1.36442, 1, 0, 0.8156863, 1,
1.112987, -0.8770066, 2.217443, 1, 0, 0.8117647, 1,
1.118723, 1.407571, 1.308299, 1, 0, 0.8039216, 1,
1.119138, 1.890328, 0.2659709, 1, 0, 0.7960784, 1,
1.121309, -0.2148508, 0.6271669, 1, 0, 0.7921569, 1,
1.123504, -0.8261544, 2.132193, 1, 0, 0.7843137, 1,
1.127314, 0.7216228, 1.483794, 1, 0, 0.7803922, 1,
1.148089, 0.842519, 0.4105832, 1, 0, 0.772549, 1,
1.149752, 0.4602416, 1.144952, 1, 0, 0.7686275, 1,
1.153005, 0.9885843, 0.8235257, 1, 0, 0.7607843, 1,
1.162101, -0.6600451, 0.6675501, 1, 0, 0.7568628, 1,
1.163594, 0.07591272, 1.583985, 1, 0, 0.7490196, 1,
1.166123, -0.6041811, 2.98608, 1, 0, 0.7450981, 1,
1.167066, 0.9400982, 0.5157485, 1, 0, 0.7372549, 1,
1.171203, -1.220043, 1.462041, 1, 0, 0.7333333, 1,
1.172335, -0.5976552, 2.178988, 1, 0, 0.7254902, 1,
1.178548, -0.8739786, 3.002941, 1, 0, 0.7215686, 1,
1.189934, 1.811189, 1.48218, 1, 0, 0.7137255, 1,
1.190935, 0.5911549, 1.71653, 1, 0, 0.7098039, 1,
1.195766, -0.196731, 1.588452, 1, 0, 0.7019608, 1,
1.202154, -1.911029, 2.647089, 1, 0, 0.6941177, 1,
1.205871, -0.04790265, 1.14435, 1, 0, 0.6901961, 1,
1.205994, 1.963367, 1.410774, 1, 0, 0.682353, 1,
1.206451, -0.6109413, 2.392086, 1, 0, 0.6784314, 1,
1.208519, 0.8793977, 0.7381461, 1, 0, 0.6705883, 1,
1.210122, -0.7495663, 2.246216, 1, 0, 0.6666667, 1,
1.217497, 0.04341758, 0.09472208, 1, 0, 0.6588235, 1,
1.2271, 2.580943, -0.2538648, 1, 0, 0.654902, 1,
1.233104, -1.471029, 1.674634, 1, 0, 0.6470588, 1,
1.234562, -1.010815, 2.887322, 1, 0, 0.6431373, 1,
1.235377, -0.2386102, 1.726277, 1, 0, 0.6352941, 1,
1.251989, -1.594928, 0.8235095, 1, 0, 0.6313726, 1,
1.258638, -0.8272015, 1.937985, 1, 0, 0.6235294, 1,
1.262151, 0.108376, 0.7962595, 1, 0, 0.6196079, 1,
1.264754, -1.396156, 3.761892, 1, 0, 0.6117647, 1,
1.267643, 0.3776846, 0.9406742, 1, 0, 0.6078432, 1,
1.288108, -0.1449125, 1.948857, 1, 0, 0.6, 1,
1.296648, 0.9116001, 0.5158128, 1, 0, 0.5921569, 1,
1.302079, 0.9913484, 2.316678, 1, 0, 0.5882353, 1,
1.303911, 1.024563, 1.783493, 1, 0, 0.5803922, 1,
1.306489, -1.368987, 2.187344, 1, 0, 0.5764706, 1,
1.309128, -0.3481297, 2.366925, 1, 0, 0.5686275, 1,
1.330142, -1.432303, 1.590909, 1, 0, 0.5647059, 1,
1.330171, -0.08937847, 2.314171, 1, 0, 0.5568628, 1,
1.33136, -1.24802, 1.993111, 1, 0, 0.5529412, 1,
1.332426, 2.741474, 2.271091, 1, 0, 0.5450981, 1,
1.333347, -0.2377154, 1.628072, 1, 0, 0.5411765, 1,
1.33381, -0.8330489, 2.66576, 1, 0, 0.5333334, 1,
1.336881, 0.07477301, 1.881603, 1, 0, 0.5294118, 1,
1.349623, 2.525294, 1.52505, 1, 0, 0.5215687, 1,
1.353069, -0.7833712, 1.091412, 1, 0, 0.5176471, 1,
1.361376, -0.5683593, 1.045859, 1, 0, 0.509804, 1,
1.361719, -0.02131424, 3.593392, 1, 0, 0.5058824, 1,
1.368475, -1.126015, 2.888185, 1, 0, 0.4980392, 1,
1.370057, -0.5165594, 2.752855, 1, 0, 0.4901961, 1,
1.371616, 0.3879788, 1.052783, 1, 0, 0.4862745, 1,
1.376642, -1.445227, 1.764974, 1, 0, 0.4784314, 1,
1.379053, 1.096467, -0.5264597, 1, 0, 0.4745098, 1,
1.385657, 0.5966184, 2.296271, 1, 0, 0.4666667, 1,
1.403236, 0.03800784, 1.77032, 1, 0, 0.4627451, 1,
1.409331, 0.5972393, 1.568699, 1, 0, 0.454902, 1,
1.417054, -1.981312, 4.164867, 1, 0, 0.4509804, 1,
1.423677, 1.048792, 1.892719, 1, 0, 0.4431373, 1,
1.428193, -0.5064448, 1.570179, 1, 0, 0.4392157, 1,
1.437378, 0.5334148, 1.085456, 1, 0, 0.4313726, 1,
1.444418, -1.418256, 3.242715, 1, 0, 0.427451, 1,
1.452363, 0.2789388, 0.6704546, 1, 0, 0.4196078, 1,
1.482503, 0.7893738, 0.1296856, 1, 0, 0.4156863, 1,
1.489564, -0.01439313, 1.492412, 1, 0, 0.4078431, 1,
1.498616, 0.7117565, 0.8755504, 1, 0, 0.4039216, 1,
1.505701, 0.9210845, 0.1540542, 1, 0, 0.3960784, 1,
1.509323, -0.21886, 2.04232, 1, 0, 0.3882353, 1,
1.547608, 1.165627, -0.371512, 1, 0, 0.3843137, 1,
1.561289, 0.5691511, 1.256088, 1, 0, 0.3764706, 1,
1.589124, 0.7767698, 1.265536, 1, 0, 0.372549, 1,
1.590527, 0.2744882, 1.472115, 1, 0, 0.3647059, 1,
1.603193, -0.05009065, 1.117484, 1, 0, 0.3607843, 1,
1.607396, 0.6143863, 1.250961, 1, 0, 0.3529412, 1,
1.610157, 0.4676178, 0.1301847, 1, 0, 0.3490196, 1,
1.615708, -0.1285601, 1.30191, 1, 0, 0.3411765, 1,
1.629988, 0.1573531, 0.2750683, 1, 0, 0.3372549, 1,
1.631839, 0.3843935, 1.326608, 1, 0, 0.3294118, 1,
1.647812, 1.266188, 1.224831, 1, 0, 0.3254902, 1,
1.65335, 0.1822235, 2.004255, 1, 0, 0.3176471, 1,
1.700252, -0.1471224, 1.040523, 1, 0, 0.3137255, 1,
1.717756, -0.3735996, 0.8768892, 1, 0, 0.3058824, 1,
1.725622, 0.6564167, 2.352498, 1, 0, 0.2980392, 1,
1.733818, -0.1939016, 1.037051, 1, 0, 0.2941177, 1,
1.740187, -1.190566, 2.257693, 1, 0, 0.2862745, 1,
1.776941, -1.059379, 2.280194, 1, 0, 0.282353, 1,
1.788686, 0.06200216, 2.727657, 1, 0, 0.2745098, 1,
1.792997, -0.2236011, 2.068298, 1, 0, 0.2705882, 1,
1.804156, -1.551466, 3.651718, 1, 0, 0.2627451, 1,
1.812955, 1.571382, -0.9254232, 1, 0, 0.2588235, 1,
1.834245, -1.785222, 1.118294, 1, 0, 0.2509804, 1,
1.837544, -1.111151, 1.339987, 1, 0, 0.2470588, 1,
1.848466, 0.01906974, 1.591643, 1, 0, 0.2392157, 1,
1.871585, 1.391746, 1.28346, 1, 0, 0.2352941, 1,
1.890419, 1.923912, 1.789195, 1, 0, 0.227451, 1,
1.891387, -0.3925675, 1.92065, 1, 0, 0.2235294, 1,
1.89652, -0.5547609, 0.2142762, 1, 0, 0.2156863, 1,
1.897389, -0.5382888, 2.413135, 1, 0, 0.2117647, 1,
1.905426, 0.6641957, 2.894992, 1, 0, 0.2039216, 1,
1.918151, -0.5217849, 0.4484435, 1, 0, 0.1960784, 1,
1.941666, 0.008023651, 2.296314, 1, 0, 0.1921569, 1,
1.951502, 0.8912159, 1.551469, 1, 0, 0.1843137, 1,
1.974633, -0.1527219, 1.172245, 1, 0, 0.1803922, 1,
1.997472, 0.5187334, 0.528187, 1, 0, 0.172549, 1,
2.004485, -1.559654, 2.670397, 1, 0, 0.1686275, 1,
2.027029, -0.0965744, -0.2719752, 1, 0, 0.1607843, 1,
2.032757, 0.07671546, 0.8004051, 1, 0, 0.1568628, 1,
2.0455, 0.1306212, 0.4704103, 1, 0, 0.1490196, 1,
2.048127, -0.6835293, 0.5032517, 1, 0, 0.145098, 1,
2.050512, 0.4648848, 1.241414, 1, 0, 0.1372549, 1,
2.113656, 0.5952253, 1.781282, 1, 0, 0.1333333, 1,
2.200016, 0.6048547, 1.854743, 1, 0, 0.1254902, 1,
2.25749, -1.120772, 1.902318, 1, 0, 0.1215686, 1,
2.270909, -1.808152, 1.607966, 1, 0, 0.1137255, 1,
2.301567, -0.9577788, 2.58022, 1, 0, 0.1098039, 1,
2.329341, -0.02277647, 1.278273, 1, 0, 0.1019608, 1,
2.334812, -0.3541189, 3.144988, 1, 0, 0.09411765, 1,
2.351051, -0.2265323, 1.355998, 1, 0, 0.09019608, 1,
2.399103, -0.8681009, 3.348076, 1, 0, 0.08235294, 1,
2.428584, -0.7000003, 0.5063927, 1, 0, 0.07843138, 1,
2.428704, 1.365737, -0.140303, 1, 0, 0.07058824, 1,
2.486951, 0.4345542, 0.880828, 1, 0, 0.06666667, 1,
2.496128, -0.2292377, 2.959394, 1, 0, 0.05882353, 1,
2.602922, 0.4891195, 1.022966, 1, 0, 0.05490196, 1,
2.678162, -0.1179802, 3.905073, 1, 0, 0.04705882, 1,
2.704735, -1.700814, 1.495054, 1, 0, 0.04313726, 1,
2.727229, 1.047902, 0.5833389, 1, 0, 0.03529412, 1,
2.850901, -0.7104856, 2.126984, 1, 0, 0.03137255, 1,
2.896377, 1.383847, 1.409751, 1, 0, 0.02352941, 1,
2.999661, 0.520408, 1.285705, 1, 0, 0.01960784, 1,
3.025914, -0.860199, 2.750359, 1, 0, 0.01176471, 1,
3.190102, -0.3111133, 2.667392, 1, 0, 0.007843138, 1
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
0.1625473, -4.199469, -7.281138, 0, -0.5, 0.5, 0.5,
0.1625473, -4.199469, -7.281138, 1, -0.5, 0.5, 0.5,
0.1625473, -4.199469, -7.281138, 1, 1.5, 0.5, 0.5,
0.1625473, -4.199469, -7.281138, 0, 1.5, 0.5, 0.5
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
-3.891348, -0.1127727, -7.281138, 0, -0.5, 0.5, 0.5,
-3.891348, -0.1127727, -7.281138, 1, -0.5, 0.5, 0.5,
-3.891348, -0.1127727, -7.281138, 1, 1.5, 0.5, 0.5,
-3.891348, -0.1127727, -7.281138, 0, 1.5, 0.5, 0.5
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
-3.891348, -4.199469, 0.06465387, 0, -0.5, 0.5, 0.5,
-3.891348, -4.199469, 0.06465387, 1, -0.5, 0.5, 0.5,
-3.891348, -4.199469, 0.06465387, 1, 1.5, 0.5, 0.5,
-3.891348, -4.199469, 0.06465387, 0, 1.5, 0.5, 0.5
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
-2, -3.256385, -5.585955,
3, -3.256385, -5.585955,
-2, -3.256385, -5.585955,
-2, -3.413565, -5.868485,
-1, -3.256385, -5.585955,
-1, -3.413565, -5.868485,
0, -3.256385, -5.585955,
0, -3.413565, -5.868485,
1, -3.256385, -5.585955,
1, -3.413565, -5.868485,
2, -3.256385, -5.585955,
2, -3.413565, -5.868485,
3, -3.256385, -5.585955,
3, -3.413565, -5.868485
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
-2, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
-2, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
-2, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
-2, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5,
-1, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
-1, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
-1, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
-1, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5,
0, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
0, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
0, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
0, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5,
1, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
1, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
1, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
1, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5,
2, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
2, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
2, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
2, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5,
3, -3.727927, -6.433547, 0, -0.5, 0.5, 0.5,
3, -3.727927, -6.433547, 1, -0.5, 0.5, 0.5,
3, -3.727927, -6.433547, 1, 1.5, 0.5, 0.5,
3, -3.727927, -6.433547, 0, 1.5, 0.5, 0.5
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
-2.955833, -3, -5.585955,
-2.955833, 2, -5.585955,
-2.955833, -3, -5.585955,
-3.111753, -3, -5.868485,
-2.955833, -2, -5.585955,
-3.111753, -2, -5.868485,
-2.955833, -1, -5.585955,
-3.111753, -1, -5.868485,
-2.955833, 0, -5.585955,
-3.111753, 0, -5.868485,
-2.955833, 1, -5.585955,
-3.111753, 1, -5.868485,
-2.955833, 2, -5.585955,
-3.111753, 2, -5.868485
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
-3.423591, -3, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, -3, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, -3, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, -3, -6.433547, 0, 1.5, 0.5, 0.5,
-3.423591, -2, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, -2, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, -2, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, -2, -6.433547, 0, 1.5, 0.5, 0.5,
-3.423591, -1, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, -1, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, -1, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, -1, -6.433547, 0, 1.5, 0.5, 0.5,
-3.423591, 0, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, 0, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, 0, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, 0, -6.433547, 0, 1.5, 0.5, 0.5,
-3.423591, 1, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, 1, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, 1, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, 1, -6.433547, 0, 1.5, 0.5, 0.5,
-3.423591, 2, -6.433547, 0, -0.5, 0.5, 0.5,
-3.423591, 2, -6.433547, 1, -0.5, 0.5, 0.5,
-3.423591, 2, -6.433547, 1, 1.5, 0.5, 0.5,
-3.423591, 2, -6.433547, 0, 1.5, 0.5, 0.5
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
-2.955833, -3.256385, -4,
-2.955833, -3.256385, 4,
-2.955833, -3.256385, -4,
-3.111753, -3.413565, -4,
-2.955833, -3.256385, -2,
-3.111753, -3.413565, -2,
-2.955833, -3.256385, 0,
-3.111753, -3.413565, 0,
-2.955833, -3.256385, 2,
-3.111753, -3.413565, 2,
-2.955833, -3.256385, 4,
-3.111753, -3.413565, 4
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
-3.423591, -3.727927, -4, 0, -0.5, 0.5, 0.5,
-3.423591, -3.727927, -4, 1, -0.5, 0.5, 0.5,
-3.423591, -3.727927, -4, 1, 1.5, 0.5, 0.5,
-3.423591, -3.727927, -4, 0, 1.5, 0.5, 0.5,
-3.423591, -3.727927, -2, 0, -0.5, 0.5, 0.5,
-3.423591, -3.727927, -2, 1, -0.5, 0.5, 0.5,
-3.423591, -3.727927, -2, 1, 1.5, 0.5, 0.5,
-3.423591, -3.727927, -2, 0, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 0, 0, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 0, 1, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 0, 1, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 0, 0, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 2, 0, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 2, 1, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 2, 1, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 2, 0, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 4, 0, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 4, 1, -0.5, 0.5, 0.5,
-3.423591, -3.727927, 4, 1, 1.5, 0.5, 0.5,
-3.423591, -3.727927, 4, 0, 1.5, 0.5, 0.5
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
-2.955833, -3.256385, -5.585955,
-2.955833, 3.030839, -5.585955,
-2.955833, -3.256385, 5.715263,
-2.955833, 3.030839, 5.715263,
-2.955833, -3.256385, -5.585955,
-2.955833, -3.256385, 5.715263,
-2.955833, 3.030839, -5.585955,
-2.955833, 3.030839, 5.715263,
-2.955833, -3.256385, -5.585955,
3.280928, -3.256385, -5.585955,
-2.955833, -3.256385, 5.715263,
3.280928, -3.256385, 5.715263,
-2.955833, 3.030839, -5.585955,
3.280928, 3.030839, -5.585955,
-2.955833, 3.030839, 5.715263,
3.280928, 3.030839, 5.715263,
3.280928, -3.256385, -5.585955,
3.280928, 3.030839, -5.585955,
3.280928, -3.256385, 5.715263,
3.280928, 3.030839, 5.715263,
3.280928, -3.256385, -5.585955,
3.280928, -3.256385, 5.715263,
3.280928, 3.030839, -5.585955,
3.280928, 3.030839, 5.715263
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
var radius = 7.66674;
var distance = 34.11019;
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
mvMatrix.translate( -0.1625473, 0.1127727, -0.06465387 );
mvMatrix.scale( 1.329124, 1.318456, 0.7334988 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.11019);
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
5-benzyl-3-furylmeth<-read.table("5-benzyl-3-furylmeth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-5-benzyl-3-furylmeth$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzyl' not found
```

```r
y<-5-benzyl-3-furylmeth$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzyl' not found
```

```r
z<-5-benzyl-3-furylmeth$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzyl' not found
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
-2.865007, -0.6777342, -1.603002, 0, 0, 1, 1, 1,
-2.739957, -0.5345644, -3.152431, 1, 0, 0, 1, 1,
-2.644413, -0.3401074, -0.6367452, 1, 0, 0, 1, 1,
-2.534107, 1.218312, -2.309912, 1, 0, 0, 1, 1,
-2.523203, -1.309597, -3.220123, 1, 0, 0, 1, 1,
-2.497685, 0.3386324, -1.852761, 1, 0, 0, 1, 1,
-2.485213, -0.3828815, -1.245089, 0, 0, 0, 1, 1,
-2.396695, -0.1139249, -2.449628, 0, 0, 0, 1, 1,
-2.353664, -0.6908118, -3.280676, 0, 0, 0, 1, 1,
-2.282952, 0.2873942, -0.7273409, 0, 0, 0, 1, 1,
-2.279486, 1.464455, -2.567499, 0, 0, 0, 1, 1,
-2.242398, 0.3689151, -1.117154, 0, 0, 0, 1, 1,
-2.163385, 1.031439, -1.350316, 0, 0, 0, 1, 1,
-2.11138, -2.71271, -3.717168, 1, 1, 1, 1, 1,
-2.076117, 0.3819377, -1.290611, 1, 1, 1, 1, 1,
-2.05827, -0.1924878, -1.035, 1, 1, 1, 1, 1,
-2.052598, 0.8342989, -0.5827507, 1, 1, 1, 1, 1,
-1.994701, 1.157037, -0.5959876, 1, 1, 1, 1, 1,
-1.991516, 1.682021, -1.142174, 1, 1, 1, 1, 1,
-1.989152, -0.5507298, -1.526078, 1, 1, 1, 1, 1,
-1.950864, 1.515695, -3.587755, 1, 1, 1, 1, 1,
-1.940397, -3.11228, -2.508612, 1, 1, 1, 1, 1,
-1.927427, -0.149192, -2.183137, 1, 1, 1, 1, 1,
-1.906349, 0.3720034, -2.421549, 1, 1, 1, 1, 1,
-1.902715, 0.7445473, -0.2015988, 1, 1, 1, 1, 1,
-1.896176, -0.07554091, -1.895325, 1, 1, 1, 1, 1,
-1.863836, 0.2018574, -3.152392, 1, 1, 1, 1, 1,
-1.850371, 0.3769825, -1.495388, 1, 1, 1, 1, 1,
-1.835479, -0.04629717, -3.001009, 0, 0, 1, 1, 1,
-1.834229, -0.0337331, -2.325242, 1, 0, 0, 1, 1,
-1.811566, -0.6479841, -1.500749, 1, 0, 0, 1, 1,
-1.80227, -0.2883212, 0.06228272, 1, 0, 0, 1, 1,
-1.797258, 0.5730627, -0.4364962, 1, 0, 0, 1, 1,
-1.778823, -1.530813, -1.642665, 1, 0, 0, 1, 1,
-1.777827, 2.297273, 0.2844011, 0, 0, 0, 1, 1,
-1.773234, 1.25497, -0.3984168, 0, 0, 0, 1, 1,
-1.75641, -1.024806, -3.512003, 0, 0, 0, 1, 1,
-1.756127, -0.3743553, -2.847523, 0, 0, 0, 1, 1,
-1.755928, 1.126122, 0.9399778, 0, 0, 0, 1, 1,
-1.754062, -0.8469523, -3.357946, 0, 0, 0, 1, 1,
-1.729827, -0.1272787, -2.179156, 0, 0, 0, 1, 1,
-1.728334, -0.656794, -2.327602, 1, 1, 1, 1, 1,
-1.727635, -1.199921, -4.377806, 1, 1, 1, 1, 1,
-1.726222, -2.397439, -2.676318, 1, 1, 1, 1, 1,
-1.709862, 1.439009, -2.658683, 1, 1, 1, 1, 1,
-1.677125, -0.8296872, -1.139153, 1, 1, 1, 1, 1,
-1.674198, -2.038319, -2.582573, 1, 1, 1, 1, 1,
-1.667914, 0.2923058, -0.5646706, 1, 1, 1, 1, 1,
-1.643207, -0.7690781, -2.352226, 1, 1, 1, 1, 1,
-1.643114, -0.818947, -2.871673, 1, 1, 1, 1, 1,
-1.6283, 0.7890193, -1.444433, 1, 1, 1, 1, 1,
-1.615741, 0.7562522, -0.06793547, 1, 1, 1, 1, 1,
-1.603578, 1.811625, -1.009981, 1, 1, 1, 1, 1,
-1.597381, 0.9663398, 0.9857894, 1, 1, 1, 1, 1,
-1.587054, 1.470596, -0.7441516, 1, 1, 1, 1, 1,
-1.560456, 0.5240444, -1.571363, 1, 1, 1, 1, 1,
-1.558437, 0.2986914, -2.567122, 0, 0, 1, 1, 1,
-1.552835, 0.5364288, -2.346193, 1, 0, 0, 1, 1,
-1.543738, -0.552142, -3.198997, 1, 0, 0, 1, 1,
-1.525762, -1.723404, -3.360633, 1, 0, 0, 1, 1,
-1.516587, 1.056397, -2.198111, 1, 0, 0, 1, 1,
-1.515854, 0.1091283, -1.763486, 1, 0, 0, 1, 1,
-1.510799, 1.057994, -0.658933, 0, 0, 0, 1, 1,
-1.499262, -0.5367146, -2.953202, 0, 0, 0, 1, 1,
-1.475944, -1.369954, -2.40518, 0, 0, 0, 1, 1,
-1.455602, 0.5543202, -0.3249629, 0, 0, 0, 1, 1,
-1.455112, 1.201477, -0.4456408, 0, 0, 0, 1, 1,
-1.454314, 0.0197611, -2.361406, 0, 0, 0, 1, 1,
-1.448096, 0.529258, -0.3803017, 0, 0, 0, 1, 1,
-1.446076, -0.4152793, -1.627746, 1, 1, 1, 1, 1,
-1.441435, 0.6916553, -0.02510231, 1, 1, 1, 1, 1,
-1.43378, 0.76833, -0.4837427, 1, 1, 1, 1, 1,
-1.426422, 0.6155229, 0.08191377, 1, 1, 1, 1, 1,
-1.412583, 0.1926308, -1.695623, 1, 1, 1, 1, 1,
-1.409135, -0.34242, -1.650175, 1, 1, 1, 1, 1,
-1.399927, 2.33646, 1.727863, 1, 1, 1, 1, 1,
-1.395211, 0.6403875, 1.251358, 1, 1, 1, 1, 1,
-1.372008, -0.7462881, -1.985999, 1, 1, 1, 1, 1,
-1.371461, 0.4221623, -0.2475524, 1, 1, 1, 1, 1,
-1.359661, 0.1074438, -1.510614, 1, 1, 1, 1, 1,
-1.35804, 0.8929814, -1.844062, 1, 1, 1, 1, 1,
-1.353304, 0.3551809, -1.137694, 1, 1, 1, 1, 1,
-1.351552, -0.112895, 0.04102517, 1, 1, 1, 1, 1,
-1.347473, 0.2094347, -0.02876527, 1, 1, 1, 1, 1,
-1.341701, 1.181205, -0.3094838, 0, 0, 1, 1, 1,
-1.341195, 0.5568247, -2.683793, 1, 0, 0, 1, 1,
-1.333341, -1.578581, -2.582277, 1, 0, 0, 1, 1,
-1.333327, -0.8667774, -1.157662, 1, 0, 0, 1, 1,
-1.315937, 0.5628584, -2.398655, 1, 0, 0, 1, 1,
-1.312135, 1.832112, -0.1877401, 1, 0, 0, 1, 1,
-1.308568, -0.128842, -3.763978, 0, 0, 0, 1, 1,
-1.306045, -0.0224818, -1.01873, 0, 0, 0, 1, 1,
-1.304245, 1.871931, -1.421206, 0, 0, 0, 1, 1,
-1.300928, 0.191024, -1.220706, 0, 0, 0, 1, 1,
-1.298665, -0.8387339, 0.2519064, 0, 0, 0, 1, 1,
-1.288082, -1.278118, -1.163156, 0, 0, 0, 1, 1,
-1.286682, 2.034462, -0.8965069, 0, 0, 0, 1, 1,
-1.279298, 0.5390568, -1.718275, 1, 1, 1, 1, 1,
-1.27581, -0.2417538, -0.7476463, 1, 1, 1, 1, 1,
-1.266464, -0.3535723, -2.971183, 1, 1, 1, 1, 1,
-1.261846, 0.7808293, -0.4290633, 1, 1, 1, 1, 1,
-1.253794, -0.04173254, -0.3529777, 1, 1, 1, 1, 1,
-1.252024, 2.16569, -1.573921, 1, 1, 1, 1, 1,
-1.241982, -0.8842409, -2.994793, 1, 1, 1, 1, 1,
-1.240832, 0.1586093, -1.125728, 1, 1, 1, 1, 1,
-1.240427, -1.061291, -2.972933, 1, 1, 1, 1, 1,
-1.235004, 0.5748798, -1.143977, 1, 1, 1, 1, 1,
-1.233577, 0.4536545, -1.632303, 1, 1, 1, 1, 1,
-1.233242, -1.055456, -2.803805, 1, 1, 1, 1, 1,
-1.22911, -0.2850048, -2.486782, 1, 1, 1, 1, 1,
-1.227092, 1.927072, -0.1823511, 1, 1, 1, 1, 1,
-1.22582, -0.2176581, -1.847601, 1, 1, 1, 1, 1,
-1.224823, 0.119176, -0.2610975, 0, 0, 1, 1, 1,
-1.216093, -0.1818625, -2.712141, 1, 0, 0, 1, 1,
-1.21437, -1.77215, -1.284037, 1, 0, 0, 1, 1,
-1.212678, -1.803723, -1.74518, 1, 0, 0, 1, 1,
-1.212363, 0.06095539, -2.191732, 1, 0, 0, 1, 1,
-1.211172, 1.595736, -0.7201278, 1, 0, 0, 1, 1,
-1.199115, 0.142986, -2.395028, 0, 0, 0, 1, 1,
-1.195853, -0.5087386, -0.1136227, 0, 0, 0, 1, 1,
-1.19057, 0.2261937, -1.122529, 0, 0, 0, 1, 1,
-1.185867, 1.12239, -0.02958346, 0, 0, 0, 1, 1,
-1.184925, -0.04506775, -2.301965, 0, 0, 0, 1, 1,
-1.181622, -0.4829424, -3.210864, 0, 0, 0, 1, 1,
-1.173047, -1.137918, -2.637244, 0, 0, 0, 1, 1,
-1.173035, 0.07723273, -0.9862369, 1, 1, 1, 1, 1,
-1.170197, 0.2931952, -2.362622, 1, 1, 1, 1, 1,
-1.154963, 1.395366, -0.01182872, 1, 1, 1, 1, 1,
-1.151279, -1.427547, -2.886021, 1, 1, 1, 1, 1,
-1.143813, -2.072031, -2.204314, 1, 1, 1, 1, 1,
-1.13841, 1.630556, -0.1703608, 1, 1, 1, 1, 1,
-1.137367, 0.3432958, -0.3318882, 1, 1, 1, 1, 1,
-1.13617, 0.597988, -1.322845, 1, 1, 1, 1, 1,
-1.131439, 1.503887, -2.101614, 1, 1, 1, 1, 1,
-1.107148, 0.733404, -2.153747, 1, 1, 1, 1, 1,
-1.103006, 0.477268, -0.6000692, 1, 1, 1, 1, 1,
-1.101398, -0.2131914, -2.773076, 1, 1, 1, 1, 1,
-1.098168, 0.1986065, -0.3995682, 1, 1, 1, 1, 1,
-1.097663, 0.01813035, -1.069251, 1, 1, 1, 1, 1,
-1.085366, -0.5585145, -0.8635998, 1, 1, 1, 1, 1,
-1.08164, -1.49002, -1.439871, 0, 0, 1, 1, 1,
-1.076669, 0.3925438, -1.557041, 1, 0, 0, 1, 1,
-1.076524, 0.2272294, -0.02700445, 1, 0, 0, 1, 1,
-1.065755, -1.0033, -2.376484, 1, 0, 0, 1, 1,
-1.059314, 0.2187608, -2.189648, 1, 0, 0, 1, 1,
-1.059158, -1.120185, -4.556499, 1, 0, 0, 1, 1,
-1.054319, -0.4474685, -1.300742, 0, 0, 0, 1, 1,
-1.051126, 1.330171, 0.0005805636, 0, 0, 0, 1, 1,
-1.050561, 0.2732012, -0.8581196, 0, 0, 0, 1, 1,
-1.048584, 0.3042151, -0.02940701, 0, 0, 0, 1, 1,
-1.046018, -1.40533, -0.5222989, 0, 0, 0, 1, 1,
-1.042014, 0.9635021, -0.2306897, 0, 0, 0, 1, 1,
-1.040289, 0.4504703, -3.237767, 0, 0, 0, 1, 1,
-1.039008, -0.02138875, -1.668891, 1, 1, 1, 1, 1,
-1.038278, 0.6069526, -0.6080123, 1, 1, 1, 1, 1,
-1.036047, 0.1319073, -0.6071402, 1, 1, 1, 1, 1,
-1.035651, 0.2091641, -2.946443, 1, 1, 1, 1, 1,
-1.035635, 0.9103091, -1.686018, 1, 1, 1, 1, 1,
-1.031622, -1.042397, -2.825508, 1, 1, 1, 1, 1,
-1.015449, -0.6143333, -2.631442, 1, 1, 1, 1, 1,
-0.9979969, -0.04739867, -2.818807, 1, 1, 1, 1, 1,
-0.9903338, 0.0467617, -2.462452, 1, 1, 1, 1, 1,
-0.9852924, 0.8109674, -0.6834075, 1, 1, 1, 1, 1,
-0.9709085, 0.1032322, -3.337995, 1, 1, 1, 1, 1,
-0.9692045, 1.327497, -0.4077559, 1, 1, 1, 1, 1,
-0.9684869, -0.02039504, -2.130996, 1, 1, 1, 1, 1,
-0.966962, 1.75274, 0.9083517, 1, 1, 1, 1, 1,
-0.9653876, 0.217598, -2.681521, 1, 1, 1, 1, 1,
-0.9562516, -0.3344895, -1.659413, 0, 0, 1, 1, 1,
-0.9548643, 0.9376807, -1.673984, 1, 0, 0, 1, 1,
-0.9517605, 1.825973, 0.03900196, 1, 0, 0, 1, 1,
-0.9501227, -1.272702, -2.945868, 1, 0, 0, 1, 1,
-0.92766, -1.611725, -2.289696, 1, 0, 0, 1, 1,
-0.922001, 0.6692991, -1.072361, 1, 0, 0, 1, 1,
-0.919813, 0.02715969, -2.031206, 0, 0, 0, 1, 1,
-0.9184705, 1.285743, -1.086607, 0, 0, 0, 1, 1,
-0.9087294, 0.4839426, -1.412479, 0, 0, 0, 1, 1,
-0.907702, 0.464963, -2.309763, 0, 0, 0, 1, 1,
-0.8938128, 0.04140633, 0.291438, 0, 0, 0, 1, 1,
-0.8889086, 0.1010963, -0.6010904, 0, 0, 0, 1, 1,
-0.8838487, -1.054446, -2.302096, 0, 0, 0, 1, 1,
-0.8837543, 2.214017, 0.06571003, 1, 1, 1, 1, 1,
-0.8823001, -1.064037, -3.497462, 1, 1, 1, 1, 1,
-0.8774079, 0.2815636, -0.8999014, 1, 1, 1, 1, 1,
-0.8715677, 0.4144469, -2.045789, 1, 1, 1, 1, 1,
-0.8696905, -0.4580565, -1.252233, 1, 1, 1, 1, 1,
-0.8676896, -0.6261293, -1.588538, 1, 1, 1, 1, 1,
-0.8665692, -0.04321271, -0.3520314, 1, 1, 1, 1, 1,
-0.8571291, 0.1731989, -1.98046, 1, 1, 1, 1, 1,
-0.8555369, 1.585608, -1.459798, 1, 1, 1, 1, 1,
-0.8543215, -0.2735014, -1.087582, 1, 1, 1, 1, 1,
-0.8468568, -0.4290235, -2.035607, 1, 1, 1, 1, 1,
-0.8463719, -0.3283923, -1.569453, 1, 1, 1, 1, 1,
-0.8463501, 0.1128614, -1.906468, 1, 1, 1, 1, 1,
-0.8457373, 1.266953, -2.432349, 1, 1, 1, 1, 1,
-0.8440905, -0.5178031, -1.149484, 1, 1, 1, 1, 1,
-0.8426662, 0.7447731, 1.245763, 0, 0, 1, 1, 1,
-0.8410028, -0.2834258, -3.189602, 1, 0, 0, 1, 1,
-0.8398376, 1.41465, -0.3901598, 1, 0, 0, 1, 1,
-0.8386023, -0.09229802, -1.362584, 1, 0, 0, 1, 1,
-0.8385521, 1.493224, -1.702943, 1, 0, 0, 1, 1,
-0.8334816, -0.8680326, -2.390575, 1, 0, 0, 1, 1,
-0.8299694, -0.6418315, -2.745943, 0, 0, 0, 1, 1,
-0.8297483, 0.4436759, 0.06524838, 0, 0, 0, 1, 1,
-0.8277617, -1.252428, -3.8572, 0, 0, 0, 1, 1,
-0.8275308, 1.357865, 0.1223065, 0, 0, 0, 1, 1,
-0.8262398, 1.032896, -1.345681, 0, 0, 0, 1, 1,
-0.8219606, -0.4324492, -2.232305, 0, 0, 0, 1, 1,
-0.8199729, 0.4719376, -0.7518513, 0, 0, 0, 1, 1,
-0.8182282, -1.013546, -3.278122, 1, 1, 1, 1, 1,
-0.8109596, 1.522961, -1.000561, 1, 1, 1, 1, 1,
-0.8102373, 0.7229993, 0.2621024, 1, 1, 1, 1, 1,
-0.8098447, -0.04965068, -0.6710936, 1, 1, 1, 1, 1,
-0.8046562, -0.5636458, -2.16926, 1, 1, 1, 1, 1,
-0.8012483, 0.3305024, -2.158851, 1, 1, 1, 1, 1,
-0.7959046, -0.1319783, -3.335328, 1, 1, 1, 1, 1,
-0.7938258, 0.7223131, 0.9070008, 1, 1, 1, 1, 1,
-0.7896919, -1.033444, -3.48789, 1, 1, 1, 1, 1,
-0.7733549, 0.3675235, -2.240273, 1, 1, 1, 1, 1,
-0.7725983, -0.7106653, -3.674834, 1, 1, 1, 1, 1,
-0.7680148, -0.8815712, -2.491723, 1, 1, 1, 1, 1,
-0.7659554, 0.7010775, -0.6754908, 1, 1, 1, 1, 1,
-0.7602938, -0.1574425, -1.212973, 1, 1, 1, 1, 1,
-0.7548935, -1.200778, -2.06097, 1, 1, 1, 1, 1,
-0.7539276, -0.7167017, -2.395476, 0, 0, 1, 1, 1,
-0.7529128, -0.1679355, -0.07737607, 1, 0, 0, 1, 1,
-0.7478992, -0.2601089, -1.296056, 1, 0, 0, 1, 1,
-0.740988, 0.5578327, -1.055678, 1, 0, 0, 1, 1,
-0.7395357, -2.343471, -2.981348, 1, 0, 0, 1, 1,
-0.735992, 1.054283, -1.384176, 1, 0, 0, 1, 1,
-0.7353643, 2.939278, -1.297464, 0, 0, 0, 1, 1,
-0.7308124, 1.469654, -0.6874159, 0, 0, 0, 1, 1,
-0.7307155, -0.3573817, -2.328799, 0, 0, 0, 1, 1,
-0.7280924, -1.137087, -1.767749, 0, 0, 0, 1, 1,
-0.7271225, -0.8006145, -3.270157, 0, 0, 0, 1, 1,
-0.7268362, 1.876024, 0.7803327, 0, 0, 0, 1, 1,
-0.7267212, -0.5847778, -2.328952, 0, 0, 0, 1, 1,
-0.7266638, -1.280874, -3.982275, 1, 1, 1, 1, 1,
-0.7235303, -0.2677428, -0.2467882, 1, 1, 1, 1, 1,
-0.7211764, -1.536712, -2.471931, 1, 1, 1, 1, 1,
-0.7193013, -1.213344, -1.282905, 1, 1, 1, 1, 1,
-0.7175416, -0.8858241, -2.563064, 1, 1, 1, 1, 1,
-0.7159252, -1.110365, -3.394871, 1, 1, 1, 1, 1,
-0.7125136, 0.2150838, -2.121907, 1, 1, 1, 1, 1,
-0.7033128, -0.1176236, -1.750777, 1, 1, 1, 1, 1,
-0.7004921, 1.263709, 0.05872399, 1, 1, 1, 1, 1,
-0.6990752, 1.624386, -0.4619674, 1, 1, 1, 1, 1,
-0.6986656, -1.935071, -4.135527, 1, 1, 1, 1, 1,
-0.6945699, 0.7170357, -0.0865798, 1, 1, 1, 1, 1,
-0.6931367, -0.971176, -3.290321, 1, 1, 1, 1, 1,
-0.6849959, -0.4726327, -0.1084877, 1, 1, 1, 1, 1,
-0.684889, -1.497418, -2.429281, 1, 1, 1, 1, 1,
-0.6844425, 0.3551743, -0.9397866, 0, 0, 1, 1, 1,
-0.6837161, -0.3658721, -4.315392, 1, 0, 0, 1, 1,
-0.6813281, -1.441462, -3.164296, 1, 0, 0, 1, 1,
-0.6790816, 0.4267077, -0.9015955, 1, 0, 0, 1, 1,
-0.6727018, 0.3446134, 0.1163679, 1, 0, 0, 1, 1,
-0.6693156, 1.405321, -1.637201, 1, 0, 0, 1, 1,
-0.6627125, 0.2388416, -2.21912, 0, 0, 0, 1, 1,
-0.6517023, -1.755388, -3.877784, 0, 0, 0, 1, 1,
-0.6487836, 0.2857656, -0.3958296, 0, 0, 0, 1, 1,
-0.6474667, -2.313824, -5.421374, 0, 0, 0, 1, 1,
-0.6464714, 0.5658485, 0.2544111, 0, 0, 0, 1, 1,
-0.6446806, 0.1228572, -2.062405, 0, 0, 0, 1, 1,
-0.6375855, -1.202398, -3.352004, 0, 0, 0, 1, 1,
-0.6364416, -1.224349, -3.227342, 1, 1, 1, 1, 1,
-0.6302478, 0.1174615, 0.06593864, 1, 1, 1, 1, 1,
-0.6284186, 0.1174964, -1.200645, 1, 1, 1, 1, 1,
-0.6271209, -0.8416927, -1.053942, 1, 1, 1, 1, 1,
-0.6234433, -0.4547285, -1.929421, 1, 1, 1, 1, 1,
-0.6224833, 0.06614731, -2.072666, 1, 1, 1, 1, 1,
-0.617152, -0.1326082, -2.184874, 1, 1, 1, 1, 1,
-0.6110047, 0.7462123, -2.128243, 1, 1, 1, 1, 1,
-0.6091967, -0.1597591, -0.3499999, 1, 1, 1, 1, 1,
-0.6079312, -1.390999, -4.693236, 1, 1, 1, 1, 1,
-0.6072685, -1.06605, -4.070317, 1, 1, 1, 1, 1,
-0.6024469, -1.007055, -2.490018, 1, 1, 1, 1, 1,
-0.586374, -0.4167916, -1.35187, 1, 1, 1, 1, 1,
-0.5814183, -2.391186, -2.747745, 1, 1, 1, 1, 1,
-0.5811188, -0.131455, -2.186797, 1, 1, 1, 1, 1,
-0.5801178, 0.635489, 1.841188, 0, 0, 1, 1, 1,
-0.5797284, -1.560446, -2.800624, 1, 0, 0, 1, 1,
-0.5734302, -0.3232837, 1.038137, 1, 0, 0, 1, 1,
-0.5717942, 0.1389497, -1.598138, 1, 0, 0, 1, 1,
-0.5708935, 1.036198, 0.4110519, 1, 0, 0, 1, 1,
-0.5707839, -1.586653, -4.089912, 1, 0, 0, 1, 1,
-0.5588603, 0.6395121, -0.6186779, 0, 0, 0, 1, 1,
-0.5578143, -1.366917, -3.407496, 0, 0, 0, 1, 1,
-0.5566154, -0.8800328, -2.537542, 0, 0, 0, 1, 1,
-0.5560403, 1.008617, -2.71332, 0, 0, 0, 1, 1,
-0.5537413, 1.278999, -0.4232487, 0, 0, 0, 1, 1,
-0.5519997, 1.958455, -1.378254, 0, 0, 0, 1, 1,
-0.5490249, 0.5961959, -0.900539, 0, 0, 0, 1, 1,
-0.5489082, 0.2054673, -0.7622378, 1, 1, 1, 1, 1,
-0.5447831, -0.03177516, -1.847261, 1, 1, 1, 1, 1,
-0.5446322, -0.662267, -2.037719, 1, 1, 1, 1, 1,
-0.5446212, -0.8185547, -2.301866, 1, 1, 1, 1, 1,
-0.5441924, -0.8335976, -1.852476, 1, 1, 1, 1, 1,
-0.5438105, 0.3684738, -0.1623558, 1, 1, 1, 1, 1,
-0.543797, 0.8075223, 0.4439576, 1, 1, 1, 1, 1,
-0.5367898, 0.9297636, 0.7714131, 1, 1, 1, 1, 1,
-0.5341535, -1.0482, -3.224169, 1, 1, 1, 1, 1,
-0.5339841, 0.8657455, -1.233978, 1, 1, 1, 1, 1,
-0.5317353, -1.411133, -2.85705, 1, 1, 1, 1, 1,
-0.5287446, 2.049501, -0.1406879, 1, 1, 1, 1, 1,
-0.527665, 0.388843, 0.3298855, 1, 1, 1, 1, 1,
-0.5262939, -0.6088876, -1.500008, 1, 1, 1, 1, 1,
-0.5225046, 0.4270254, -1.767358, 1, 1, 1, 1, 1,
-0.5216113, 1.019957, -1.054962, 0, 0, 1, 1, 1,
-0.5167385, -1.476846, -2.14743, 1, 0, 0, 1, 1,
-0.5160933, -1.581252, -2.335793, 1, 0, 0, 1, 1,
-0.5151242, -0.1816467, -2.793175, 1, 0, 0, 1, 1,
-0.5137488, 0.06448052, -2.758619, 1, 0, 0, 1, 1,
-0.5032468, 0.1774264, -1.351995, 1, 0, 0, 1, 1,
-0.5025807, 0.2253084, -1.826216, 0, 0, 0, 1, 1,
-0.5012619, -0.2624705, -2.022126, 0, 0, 0, 1, 1,
-0.4973646, 0.8638827, -2.421717, 0, 0, 0, 1, 1,
-0.4928781, 0.2425115, -0.4563765, 0, 0, 0, 1, 1,
-0.4922553, -1.00063, -2.97339, 0, 0, 0, 1, 1,
-0.4920944, 0.8986602, 1.131658, 0, 0, 0, 1, 1,
-0.4865516, 0.4354431, 0.2135282, 0, 0, 0, 1, 1,
-0.4775894, -3.164823, -1.773787, 1, 1, 1, 1, 1,
-0.4742836, 0.7838185, 0.1543435, 1, 1, 1, 1, 1,
-0.4731873, -0.4884932, -1.994218, 1, 1, 1, 1, 1,
-0.4716717, -0.6652206, -4.091982, 1, 1, 1, 1, 1,
-0.4701544, -0.6802323, -2.020229, 1, 1, 1, 1, 1,
-0.4673071, 0.3472377, -2.634706, 1, 1, 1, 1, 1,
-0.4653916, 0.5799023, -1.290433, 1, 1, 1, 1, 1,
-0.4641957, -0.6836907, -1.939925, 1, 1, 1, 1, 1,
-0.4602283, -0.1014151, -1.63189, 1, 1, 1, 1, 1,
-0.4566497, -0.3496191, -2.3993, 1, 1, 1, 1, 1,
-0.4487254, -0.1292968, -1.792359, 1, 1, 1, 1, 1,
-0.4482117, -0.1140916, -3.156137, 1, 1, 1, 1, 1,
-0.4469939, 1.536902, 0.3724958, 1, 1, 1, 1, 1,
-0.4457837, -0.2459422, -1.565342, 1, 1, 1, 1, 1,
-0.4428714, 0.7325139, -0.3628355, 1, 1, 1, 1, 1,
-0.434748, 0.5796967, -1.219011, 0, 0, 1, 1, 1,
-0.4299231, -1.292861, -1.944093, 1, 0, 0, 1, 1,
-0.4220403, -1.784388, -2.015638, 1, 0, 0, 1, 1,
-0.4184498, 0.8020023, 0.1004325, 1, 0, 0, 1, 1,
-0.4163798, 0.4960143, -0.3870167, 1, 0, 0, 1, 1,
-0.4157819, -0.8331589, -4.116584, 1, 0, 0, 1, 1,
-0.4104801, 0.3945845, -1.269321, 0, 0, 0, 1, 1,
-0.4085973, 0.3082193, 0.88883, 0, 0, 0, 1, 1,
-0.4057564, -1.40635, -4.398256, 0, 0, 0, 1, 1,
-0.3985726, -0.8120582, -1.480522, 0, 0, 0, 1, 1,
-0.3886391, 0.4705234, -1.388428, 0, 0, 0, 1, 1,
-0.3880196, 1.470476, -1.45479, 0, 0, 0, 1, 1,
-0.3837798, -0.9774915, -1.369522, 0, 0, 0, 1, 1,
-0.380846, -0.8829803, -4.03967, 1, 1, 1, 1, 1,
-0.3789302, -0.6966534, -1.780438, 1, 1, 1, 1, 1,
-0.3749701, -0.1655254, -2.863663, 1, 1, 1, 1, 1,
-0.3653388, 0.2989355, 0.1293533, 1, 1, 1, 1, 1,
-0.364169, 0.9471136, -0.9976181, 1, 1, 1, 1, 1,
-0.3621192, -0.7749755, -3.299799, 1, 1, 1, 1, 1,
-0.3585627, 0.768104, 1.194077, 1, 1, 1, 1, 1,
-0.3536801, -0.1027984, -1.462377, 1, 1, 1, 1, 1,
-0.35261, 0.8687992, -0.1323264, 1, 1, 1, 1, 1,
-0.3513567, -0.3387017, -3.61985, 1, 1, 1, 1, 1,
-0.3498356, 0.07324449, 0.01786709, 1, 1, 1, 1, 1,
-0.3490207, -1.822508, -3.798898, 1, 1, 1, 1, 1,
-0.3461311, 1.046, 0.6465304, 1, 1, 1, 1, 1,
-0.3375007, 0.6644821, -0.2248162, 1, 1, 1, 1, 1,
-0.3291227, -0.4440323, -2.860464, 1, 1, 1, 1, 1,
-0.3282838, -0.005531703, -1.006953, 0, 0, 1, 1, 1,
-0.3166634, -0.192967, -1.316511, 1, 0, 0, 1, 1,
-0.3163646, 0.3998457, -1.044965, 1, 0, 0, 1, 1,
-0.314844, -1.166535, -3.473834, 1, 0, 0, 1, 1,
-0.3107644, -0.3394785, -2.709221, 1, 0, 0, 1, 1,
-0.3094533, -0.5937811, -1.904477, 1, 0, 0, 1, 1,
-0.307036, -2.203689, -0.6647846, 0, 0, 0, 1, 1,
-0.3025625, 0.357149, -1.015167, 0, 0, 0, 1, 1,
-0.3017546, 0.6483748, -0.6763924, 0, 0, 0, 1, 1,
-0.3011435, -0.1416189, -1.508888, 0, 0, 0, 1, 1,
-0.2918175, -0.09144484, -0.7057013, 0, 0, 0, 1, 1,
-0.2917005, 0.4997173, 0.04914434, 0, 0, 0, 1, 1,
-0.2902896, -2.407084, -0.5001088, 0, 0, 0, 1, 1,
-0.288763, -0.31004, -3.22557, 1, 1, 1, 1, 1,
-0.2886146, 0.3547353, -1.171972, 1, 1, 1, 1, 1,
-0.2841834, -0.6846396, -2.864069, 1, 1, 1, 1, 1,
-0.2829201, 1.983553, 0.04165015, 1, 1, 1, 1, 1,
-0.280183, 1.178991, 0.1092552, 1, 1, 1, 1, 1,
-0.2798949, 0.8011456, 0.2076042, 1, 1, 1, 1, 1,
-0.2727128, -0.3276888, -1.404021, 1, 1, 1, 1, 1,
-0.2711584, 1.34401, 0.1636964, 1, 1, 1, 1, 1,
-0.2702335, 1.269807, 1.423616, 1, 1, 1, 1, 1,
-0.2671188, -0.5460961, -1.725104, 1, 1, 1, 1, 1,
-0.2669279, 0.6856396, -0.04015798, 1, 1, 1, 1, 1,
-0.2640305, 0.9594072, 0.4380161, 1, 1, 1, 1, 1,
-0.2619151, -0.6210392, -2.81411, 1, 1, 1, 1, 1,
-0.2592545, 0.4494448, -0.02272001, 1, 1, 1, 1, 1,
-0.2587462, -0.4029667, -0.9169564, 1, 1, 1, 1, 1,
-0.2571013, -0.7898041, -2.193011, 0, 0, 1, 1, 1,
-0.2550732, -0.3494861, -2.45785, 1, 0, 0, 1, 1,
-0.2527014, 0.1414046, -1.870506, 1, 0, 0, 1, 1,
-0.249369, -0.4546334, -2.792871, 1, 0, 0, 1, 1,
-0.2484462, 2.138486, -0.9265295, 1, 0, 0, 1, 1,
-0.2481576, 0.4891711, 1.560388, 1, 0, 0, 1, 1,
-0.2481522, -1.402815, -3.633041, 0, 0, 0, 1, 1,
-0.2452782, 0.4280542, -1.150218, 0, 0, 0, 1, 1,
-0.2449728, -0.5562229, -3.18981, 0, 0, 0, 1, 1,
-0.2445739, 0.8423063, 1.597577, 0, 0, 0, 1, 1,
-0.2424699, 0.30536, 1.273089, 0, 0, 0, 1, 1,
-0.2411122, 0.4243234, 1.156155, 0, 0, 0, 1, 1,
-0.2375899, 1.178693, 0.03244284, 0, 0, 0, 1, 1,
-0.2357938, -0.9724129, -3.965044, 1, 1, 1, 1, 1,
-0.2316997, -0.134345, -1.213024, 1, 1, 1, 1, 1,
-0.22178, 0.7401071, 1.528075, 1, 1, 1, 1, 1,
-0.2181402, -1.011454, -4.276597, 1, 1, 1, 1, 1,
-0.2126953, 0.7092642, -0.07155707, 1, 1, 1, 1, 1,
-0.2106818, 1.409488, -0.7908175, 1, 1, 1, 1, 1,
-0.2082755, -0.7631745, -3.122616, 1, 1, 1, 1, 1,
-0.2079086, -0.7574786, -2.970942, 1, 1, 1, 1, 1,
-0.2007074, -0.9651147, -4.378082, 1, 1, 1, 1, 1,
-0.1886248, -0.4248752, -0.8346961, 1, 1, 1, 1, 1,
-0.1846785, 0.9702908, 0.01467927, 1, 1, 1, 1, 1,
-0.1843518, 0.59578, -0.01434792, 1, 1, 1, 1, 1,
-0.1812714, 0.8314102, 0.02537585, 1, 1, 1, 1, 1,
-0.1799197, 0.1992676, -1.376746, 1, 1, 1, 1, 1,
-0.1774724, 0.5249117, -0.9336376, 1, 1, 1, 1, 1,
-0.1771903, 0.3814767, -1.439088, 0, 0, 1, 1, 1,
-0.1771047, 0.8886445, -1.845664, 1, 0, 0, 1, 1,
-0.1764299, 2.401567, -0.7218426, 1, 0, 0, 1, 1,
-0.1761786, -1.304718, -4.631248, 1, 0, 0, 1, 1,
-0.1742953, 0.5126483, 0.8110809, 1, 0, 0, 1, 1,
-0.1736062, -0.4404764, -3.191474, 1, 0, 0, 1, 1,
-0.17115, 1.841842, -0.6670954, 0, 0, 0, 1, 1,
-0.1679554, -1.357771, -2.950475, 0, 0, 0, 1, 1,
-0.1670682, -1.101226, -1.767223, 0, 0, 0, 1, 1,
-0.163525, -0.9464678, -3.329709, 0, 0, 0, 1, 1,
-0.162646, 1.612871, -0.6014187, 0, 0, 0, 1, 1,
-0.1593418, 2.868168, -0.4076802, 0, 0, 0, 1, 1,
-0.1585199, -0.3656278, -3.502012, 0, 0, 0, 1, 1,
-0.1560632, -0.7894545, -3.464431, 1, 1, 1, 1, 1,
-0.1550125, -0.8442127, -4.166252, 1, 1, 1, 1, 1,
-0.1539586, -0.2661, -2.351372, 1, 1, 1, 1, 1,
-0.14873, -2.3356, -5.101036, 1, 1, 1, 1, 1,
-0.1475346, -1.939759, -5.195052, 1, 1, 1, 1, 1,
-0.1467887, -0.1870625, -3.69234, 1, 1, 1, 1, 1,
-0.1463898, 0.4755281, -0.2560768, 1, 1, 1, 1, 1,
-0.1455341, 1.067079, 0.4763642, 1, 1, 1, 1, 1,
-0.1452892, -0.8916267, -3.649555, 1, 1, 1, 1, 1,
-0.1444045, -0.8510092, -0.6186789, 1, 1, 1, 1, 1,
-0.1420344, -0.27782, -2.602238, 1, 1, 1, 1, 1,
-0.1393266, 1.414904, 1.700284, 1, 1, 1, 1, 1,
-0.1374566, -0.7421585, -3.256463, 1, 1, 1, 1, 1,
-0.1368437, -0.1385799, -3.205132, 1, 1, 1, 1, 1,
-0.1355522, -0.3710015, -2.378591, 1, 1, 1, 1, 1,
-0.1348228, -2.026349, -4.161542, 0, 0, 1, 1, 1,
-0.1338975, -0.3880959, -3.431214, 1, 0, 0, 1, 1,
-0.1326859, 0.08143108, -1.486305, 1, 0, 0, 1, 1,
-0.1323956, 1.350588, -1.080519, 1, 0, 0, 1, 1,
-0.1306228, -0.3613988, -2.688207, 1, 0, 0, 1, 1,
-0.1285661, 1.242659, -0.1172932, 1, 0, 0, 1, 1,
-0.12523, 1.102542, 0.4771428, 0, 0, 0, 1, 1,
-0.1224732, 0.5484771, -1.313064, 0, 0, 0, 1, 1,
-0.1215916, 0.484681, -0.2980256, 0, 0, 0, 1, 1,
-0.1189489, -0.1726635, -2.102219, 0, 0, 0, 1, 1,
-0.1172519, -0.7202026, -1.992317, 0, 0, 0, 1, 1,
-0.1165602, 0.9261203, 1.233717, 0, 0, 0, 1, 1,
-0.1153913, 2.87601, 0.6722093, 0, 0, 0, 1, 1,
-0.1074054, 0.2341796, -0.263335, 1, 1, 1, 1, 1,
-0.1017606, -0.1742388, -3.366017, 1, 1, 1, 1, 1,
-0.09891009, -0.6702534, -4.190045, 1, 1, 1, 1, 1,
-0.09608337, 1.321317, -0.8126131, 1, 1, 1, 1, 1,
-0.09470689, 0.3073383, 0.5111815, 1, 1, 1, 1, 1,
-0.09231775, -1.451624, -2.784194, 1, 1, 1, 1, 1,
-0.08876486, -0.644735, -3.684461, 1, 1, 1, 1, 1,
-0.08404143, -0.6141813, -2.865982, 1, 1, 1, 1, 1,
-0.07978914, -0.06128224, -2.205322, 1, 1, 1, 1, 1,
-0.07956235, 0.3749537, -0.7137347, 1, 1, 1, 1, 1,
-0.07857311, 1.437654, -0.1893986, 1, 1, 1, 1, 1,
-0.07433449, 0.6178737, 0.09119038, 1, 1, 1, 1, 1,
-0.07247227, -0.4698403, -4.055297, 1, 1, 1, 1, 1,
-0.0711172, -0.4258858, -2.762792, 1, 1, 1, 1, 1,
-0.06535572, 0.6176939, -0.5513857, 1, 1, 1, 1, 1,
-0.06508859, 1.914806, -0.2166221, 0, 0, 1, 1, 1,
-0.06159693, 1.007477, 0.2660796, 1, 0, 0, 1, 1,
-0.05279439, -1.313458, -2.831652, 1, 0, 0, 1, 1,
-0.04838297, -0.6352004, -4.681107, 1, 0, 0, 1, 1,
-0.04569115, 1.099339, -0.9479319, 1, 0, 0, 1, 1,
-0.04394188, -0.5244954, -2.958397, 1, 0, 0, 1, 1,
-0.04013433, 0.5143725, 1.815539, 0, 0, 0, 1, 1,
-0.03586436, -1.574407, -3.171169, 0, 0, 0, 1, 1,
-0.03428073, -1.205769, -3.679405, 0, 0, 0, 1, 1,
-0.03350238, -0.4444652, -2.333455, 0, 0, 0, 1, 1,
-0.03333623, -2.464214, -3.715943, 0, 0, 0, 1, 1,
-0.02854083, 0.175382, 0.5883695, 0, 0, 0, 1, 1,
-0.02091712, -0.06726579, -3.957027, 0, 0, 0, 1, 1,
-0.02072026, 0.7741109, 0.7086943, 1, 1, 1, 1, 1,
-0.01276027, -0.4911767, -2.002683, 1, 1, 1, 1, 1,
-0.01256991, 0.179862, 0.851822, 1, 1, 1, 1, 1,
-0.01203282, -2.366744, -1.848105, 1, 1, 1, 1, 1,
-0.01156165, 2.038392, -0.654642, 1, 1, 1, 1, 1,
-0.01133461, 0.4235049, 1.362614, 1, 1, 1, 1, 1,
-0.01071398, 1.871886, -0.7443869, 1, 1, 1, 1, 1,
-0.007453053, 0.9374699, 0.1359756, 1, 1, 1, 1, 1,
-0.005195769, 1.147638, 0.1752185, 1, 1, 1, 1, 1,
-0.003535657, 0.8101835, -0.6656281, 1, 1, 1, 1, 1,
-0.001263072, 2.096501, 0.3269109, 1, 1, 1, 1, 1,
-0.001226476, 0.6319306, -1.423947, 1, 1, 1, 1, 1,
0.003187015, 1.739196, 1.041145, 1, 1, 1, 1, 1,
0.006213934, 0.03359234, 0.9412218, 1, 1, 1, 1, 1,
0.007740045, 1.498954, -0.8170399, 1, 1, 1, 1, 1,
0.007847652, -0.4717984, 4.866961, 0, 0, 1, 1, 1,
0.01383879, 0.798924, -0.9341767, 1, 0, 0, 1, 1,
0.01437739, -0.7125468, 3.493109, 1, 0, 0, 1, 1,
0.01784356, 1.235728, -0.35903, 1, 0, 0, 1, 1,
0.01916952, 0.3061917, -2.386324, 1, 0, 0, 1, 1,
0.02211362, -0.7126402, 1.472611, 1, 0, 0, 1, 1,
0.02236158, 0.2599916, 1.105295, 0, 0, 0, 1, 1,
0.02341822, -1.342761, 5.550682, 0, 0, 0, 1, 1,
0.02604585, 0.5345103, -0.9552116, 0, 0, 0, 1, 1,
0.02666662, -1.23277, 3.557014, 0, 0, 0, 1, 1,
0.02872165, 0.3474244, -0.8051095, 0, 0, 0, 1, 1,
0.03041932, 0.05481284, -0.9024286, 0, 0, 0, 1, 1,
0.03431248, -0.4692642, 5.043977, 0, 0, 0, 1, 1,
0.03484305, -0.5723585, 3.174759, 1, 1, 1, 1, 1,
0.03822025, 0.444448, -1.443564, 1, 1, 1, 1, 1,
0.04035633, -2.208663, 4.847329, 1, 1, 1, 1, 1,
0.04318542, -2.635125, 3.31486, 1, 1, 1, 1, 1,
0.04407891, -0.09115681, 3.469452, 1, 1, 1, 1, 1,
0.04674243, 2.047094, -0.07256552, 1, 1, 1, 1, 1,
0.05079208, 2.002957, 0.4650164, 1, 1, 1, 1, 1,
0.05479278, 1.269341, -0.4000753, 1, 1, 1, 1, 1,
0.05587454, -0.5756109, 4.042882, 1, 1, 1, 1, 1,
0.06045368, -1.2079, 2.755951, 1, 1, 1, 1, 1,
0.06048359, -0.8581628, 4.327025, 1, 1, 1, 1, 1,
0.06064315, 0.02453321, 1.753217, 1, 1, 1, 1, 1,
0.06081786, -1.554789, 3.098779, 1, 1, 1, 1, 1,
0.06452839, -2.127073, 3.643675, 1, 1, 1, 1, 1,
0.06832891, 0.5629829, 0.09553313, 1, 1, 1, 1, 1,
0.06935113, 0.974135, 1.499117, 0, 0, 1, 1, 1,
0.07217418, -0.5243407, 5.027133, 1, 0, 0, 1, 1,
0.0772189, -0.2241761, 2.271591, 1, 0, 0, 1, 1,
0.07748584, -0.8349365, 4.544732, 1, 0, 0, 1, 1,
0.07915156, 2.715665, -1.753716, 1, 0, 0, 1, 1,
0.07980134, 1.089508, -1.006683, 1, 0, 0, 1, 1,
0.09200599, -0.9755284, 2.814059, 0, 0, 0, 1, 1,
0.09535948, -0.3528093, 2.874116, 0, 0, 0, 1, 1,
0.09601883, 1.377538, -0.06844845, 0, 0, 0, 1, 1,
0.0962099, 0.5779217, 0.9409305, 0, 0, 0, 1, 1,
0.102492, -0.01420809, 1.107288, 0, 0, 0, 1, 1,
0.1030749, -0.6445593, 1.705142, 0, 0, 0, 1, 1,
0.1050118, 1.630507, -1.234118, 0, 0, 0, 1, 1,
0.1072599, -0.3702852, 4.400421, 1, 1, 1, 1, 1,
0.108081, -1.191561, 3.153139, 1, 1, 1, 1, 1,
0.1092013, 0.1601186, 1.373458, 1, 1, 1, 1, 1,
0.110405, 1.91954, 1.477689, 1, 1, 1, 1, 1,
0.1119534, -0.9137197, 3.111053, 1, 1, 1, 1, 1,
0.1133497, -0.3213754, 2.46064, 1, 1, 1, 1, 1,
0.1146756, 1.509165, -0.3563103, 1, 1, 1, 1, 1,
0.1178295, -0.6407968, 0.6487212, 1, 1, 1, 1, 1,
0.1194719, 2.743345, 1.342075, 1, 1, 1, 1, 1,
0.1197708, -0.8738683, 4.893963, 1, 1, 1, 1, 1,
0.1199701, 1.529263, 0.8430622, 1, 1, 1, 1, 1,
0.1237827, 2.21271, -1.02059, 1, 1, 1, 1, 1,
0.1292391, 0.9219057, 0.7099502, 1, 1, 1, 1, 1,
0.1302252, -1.489861, 1.837986, 1, 1, 1, 1, 1,
0.1318632, 0.4569826, 0.3661889, 1, 1, 1, 1, 1,
0.133644, -1.433278, 2.532648, 0, 0, 1, 1, 1,
0.1360308, 0.2013993, 0.8411003, 1, 0, 0, 1, 1,
0.14182, 0.08247996, 0.1157767, 1, 0, 0, 1, 1,
0.1477399, -1.545853, 1.266284, 1, 0, 0, 1, 1,
0.1505965, -0.4659662, 4.026105, 1, 0, 0, 1, 1,
0.1518241, 0.0640798, 1.912294, 1, 0, 0, 1, 1,
0.1525949, -0.8272353, 3.611006, 0, 0, 0, 1, 1,
0.1538797, -0.9520305, 4.095547, 0, 0, 0, 1, 1,
0.1555443, 1.122343, 0.5842358, 0, 0, 0, 1, 1,
0.1603914, 0.5749074, -0.5541604, 0, 0, 0, 1, 1,
0.1635673, -0.5740073, 1.794982, 0, 0, 0, 1, 1,
0.172341, -0.05455654, 2.083271, 0, 0, 0, 1, 1,
0.1753395, 0.9559814, 0.7334108, 0, 0, 0, 1, 1,
0.1777193, -2.635359, 1.390024, 1, 1, 1, 1, 1,
0.1788199, -1.356767, 2.767915, 1, 1, 1, 1, 1,
0.1805156, -0.3007264, 2.107502, 1, 1, 1, 1, 1,
0.1813834, 0.5542749, -0.730342, 1, 1, 1, 1, 1,
0.1854824, -0.1449097, 3.850631, 1, 1, 1, 1, 1,
0.187301, 0.09385602, 1.892142, 1, 1, 1, 1, 1,
0.1903162, -0.03223679, 2.629245, 1, 1, 1, 1, 1,
0.1941873, 0.5393621, 0.3118246, 1, 1, 1, 1, 1,
0.1949358, 1.581716, -0.7033061, 1, 1, 1, 1, 1,
0.2021879, -0.1095129, 2.109145, 1, 1, 1, 1, 1,
0.2073622, -0.3720225, 1.363497, 1, 1, 1, 1, 1,
0.2084699, 0.3638073, 0.9207889, 1, 1, 1, 1, 1,
0.2110973, 0.6449569, 0.4329585, 1, 1, 1, 1, 1,
0.2145064, -0.5787877, 3.006282, 1, 1, 1, 1, 1,
0.2159287, 0.4575329, 0.3887999, 1, 1, 1, 1, 1,
0.2164126, 0.6516342, 0.551529, 0, 0, 1, 1, 1,
0.2169769, 1.474222, 1.32812, 1, 0, 0, 1, 1,
0.2177608, 1.201268, -1.311172, 1, 0, 0, 1, 1,
0.2222343, 0.5630014, 1.071607, 1, 0, 0, 1, 1,
0.224535, -0.1431821, 3.609059, 1, 0, 0, 1, 1,
0.2361623, -0.7386734, 3.128741, 1, 0, 0, 1, 1,
0.2392627, 0.3482991, 1.654776, 0, 0, 0, 1, 1,
0.239391, -1.448513, 1.823194, 0, 0, 0, 1, 1,
0.2481258, -2.104573, 2.989801, 0, 0, 0, 1, 1,
0.2525953, -1.239815, 3.380428, 0, 0, 0, 1, 1,
0.2557178, -0.5454005, 3.325539, 0, 0, 0, 1, 1,
0.2561472, -1.775759, 3.267688, 0, 0, 0, 1, 1,
0.256717, 0.1277044, -0.1885655, 0, 0, 0, 1, 1,
0.2590505, -0.5620452, 3.185779, 1, 1, 1, 1, 1,
0.2601761, 0.7442774, -0.6811923, 1, 1, 1, 1, 1,
0.2611024, 0.4766156, 0.5295434, 1, 1, 1, 1, 1,
0.2619854, -0.04057727, 2.585754, 1, 1, 1, 1, 1,
0.2633751, -1.250396, 3.973133, 1, 1, 1, 1, 1,
0.2648653, 1.32514, 0.6985611, 1, 1, 1, 1, 1,
0.26773, -0.8104198, 3.383919, 1, 1, 1, 1, 1,
0.2709624, -0.5586029, 2.901186, 1, 1, 1, 1, 1,
0.2756572, -0.3881592, 2.740919, 1, 1, 1, 1, 1,
0.2770803, 0.06470925, 2.199105, 1, 1, 1, 1, 1,
0.2785515, -1.193398, 4.411711, 1, 1, 1, 1, 1,
0.2809313, -0.5653919, 2.067297, 1, 1, 1, 1, 1,
0.2836958, -2.141016, 1.611932, 1, 1, 1, 1, 1,
0.2860412, -0.6274846, 2.984641, 1, 1, 1, 1, 1,
0.2861363, -0.02094197, 0.4562826, 1, 1, 1, 1, 1,
0.2875421, 0.8724317, 0.6399841, 0, 0, 1, 1, 1,
0.2878447, 1.993455, -0.1237073, 1, 0, 0, 1, 1,
0.289047, 0.04465759, 0.02177852, 1, 0, 0, 1, 1,
0.2907941, 0.3649105, -1.675113, 1, 0, 0, 1, 1,
0.2926525, 0.01603209, 3.015955, 1, 0, 0, 1, 1,
0.2989148, -0.5013446, 1.129634, 1, 0, 0, 1, 1,
0.3026196, 2.116889, 0.2261782, 0, 0, 0, 1, 1,
0.3046172, 2.563726, 0.3692802, 0, 0, 0, 1, 1,
0.3079729, -1.081458, 3.63439, 0, 0, 0, 1, 1,
0.3099181, 2.18499, 0.880612, 0, 0, 0, 1, 1,
0.3132866, 0.02700388, 1.294746, 0, 0, 0, 1, 1,
0.3171392, 0.3144474, 0.595153, 0, 0, 0, 1, 1,
0.3171581, 0.6157945, 0.7039733, 0, 0, 0, 1, 1,
0.3192433, -0.5225552, 2.057349, 1, 1, 1, 1, 1,
0.325616, 0.17573, 0.95999, 1, 1, 1, 1, 1,
0.3278832, -0.59022, 2.598686, 1, 1, 1, 1, 1,
0.3310323, -0.3252712, 1.293951, 1, 1, 1, 1, 1,
0.3328242, -0.001398125, 1.999697, 1, 1, 1, 1, 1,
0.3369023, -1.238226, 4.244719, 1, 1, 1, 1, 1,
0.340499, -1.353595, 2.445332, 1, 1, 1, 1, 1,
0.344427, 0.2076837, -0.5998635, 1, 1, 1, 1, 1,
0.3470021, -0.05718463, 2.049588, 1, 1, 1, 1, 1,
0.3493304, -0.01720284, 2.174966, 1, 1, 1, 1, 1,
0.349354, 0.8025882, -0.3352346, 1, 1, 1, 1, 1,
0.3507944, 1.832572, -1.292245, 1, 1, 1, 1, 1,
0.3553075, -0.866163, 2.210818, 1, 1, 1, 1, 1,
0.3628344, 1.746413, -1.64814, 1, 1, 1, 1, 1,
0.3696881, 0.6359602, 0.9010004, 1, 1, 1, 1, 1,
0.3730844, -0.1433205, 2.616544, 0, 0, 1, 1, 1,
0.3742081, -0.08641212, 1.604344, 1, 0, 0, 1, 1,
0.3745302, -0.6994703, 1.847835, 1, 0, 0, 1, 1,
0.3753411, 0.847213, 0.8182341, 1, 0, 0, 1, 1,
0.376507, -0.6933998, 2.210577, 1, 0, 0, 1, 1,
0.3784668, -0.2756127, 2.862144, 1, 0, 0, 1, 1,
0.3794244, 0.4226389, 0.519838, 0, 0, 0, 1, 1,
0.3805773, 0.1957407, -0.5832309, 0, 0, 0, 1, 1,
0.3864775, 0.5342805, 0.8162403, 0, 0, 0, 1, 1,
0.3896029, 0.7000976, 2.783391, 0, 0, 0, 1, 1,
0.3899856, -0.2297803, 2.415233, 0, 0, 0, 1, 1,
0.3919824, -0.4413538, 0.3188715, 0, 0, 0, 1, 1,
0.393375, 1.224287, 1.397453, 0, 0, 0, 1, 1,
0.4050061, 0.1611881, 2.008918, 1, 1, 1, 1, 1,
0.4071631, 0.7933185, 0.02521331, 1, 1, 1, 1, 1,
0.4073543, -0.3391628, 0.9825248, 1, 1, 1, 1, 1,
0.4121312, -1.000331, 2.721867, 1, 1, 1, 1, 1,
0.4131966, -0.1496959, 1.611699, 1, 1, 1, 1, 1,
0.4147888, 0.662872, -0.2161258, 1, 1, 1, 1, 1,
0.4225232, -1.116749, 1.389328, 1, 1, 1, 1, 1,
0.4256795, -0.2107218, 2.14783, 1, 1, 1, 1, 1,
0.429518, 0.4668648, 0.1805829, 1, 1, 1, 1, 1,
0.4295702, 0.8821521, 1.075633, 1, 1, 1, 1, 1,
0.4314517, -0.2224973, 2.223763, 1, 1, 1, 1, 1,
0.4326726, -0.2240758, 1.368796, 1, 1, 1, 1, 1,
0.4332421, 0.2314629, 1.425117, 1, 1, 1, 1, 1,
0.4384477, 2.678254, -1.896748, 1, 1, 1, 1, 1,
0.4385905, 0.5801973, 0.5332655, 1, 1, 1, 1, 1,
0.4418217, -1.006992, 2.320404, 0, 0, 1, 1, 1,
0.4524601, -0.04447215, 1.593681, 1, 0, 0, 1, 1,
0.4527585, -0.8672389, 3.120251, 1, 0, 0, 1, 1,
0.4534161, -1.844452, 3.855839, 1, 0, 0, 1, 1,
0.4550516, -0.274605, 0.9357403, 1, 0, 0, 1, 1,
0.4576068, 0.9746023, 0.9623079, 1, 0, 0, 1, 1,
0.4590836, 0.9523926, -0.7653878, 0, 0, 0, 1, 1,
0.4662676, -0.9085801, 4.125867, 0, 0, 0, 1, 1,
0.4668613, -0.9435747, 3.078102, 0, 0, 0, 1, 1,
0.4720881, -0.973167, 3.077846, 0, 0, 0, 1, 1,
0.4731939, -0.8444319, 1.991457, 0, 0, 0, 1, 1,
0.4759665, 1.655865, -0.1870614, 0, 0, 0, 1, 1,
0.476041, -0.1103246, 1.387548, 0, 0, 0, 1, 1,
0.4770576, 0.4572159, 1.857533, 1, 1, 1, 1, 1,
0.4846235, -0.3006448, 2.658035, 1, 1, 1, 1, 1,
0.4888952, 1.008745, 1.03401, 1, 1, 1, 1, 1,
0.4915414, 0.05771295, 0.2657584, 1, 1, 1, 1, 1,
0.4920288, 0.2200419, 1.483704, 1, 1, 1, 1, 1,
0.4923163, 0.942719, -0.6261265, 1, 1, 1, 1, 1,
0.4941307, -1.353814, 2.910729, 1, 1, 1, 1, 1,
0.4965455, 1.198976, 1.963012, 1, 1, 1, 1, 1,
0.4967719, -0.8128381, 2.331889, 1, 1, 1, 1, 1,
0.4975069, -1.665307, 1.224914, 1, 1, 1, 1, 1,
0.5018804, -0.4120069, 3.567326, 1, 1, 1, 1, 1,
0.5021713, 0.6496174, 0.9687311, 1, 1, 1, 1, 1,
0.5025553, -0.5564868, 2.180822, 1, 1, 1, 1, 1,
0.5039219, 0.6172882, -1.277742, 1, 1, 1, 1, 1,
0.5046129, 1.498172, -1.530545, 1, 1, 1, 1, 1,
0.5056737, -1.331353, 3.111438, 0, 0, 1, 1, 1,
0.5059221, 0.3174604, 2.786766, 1, 0, 0, 1, 1,
0.507952, 1.486137, 1.928678, 1, 0, 0, 1, 1,
0.5108881, -1.679006, 2.223028, 1, 0, 0, 1, 1,
0.5151857, -0.4831529, 1.559571, 1, 0, 0, 1, 1,
0.5153212, 0.1804151, 0.9146714, 1, 0, 0, 1, 1,
0.5159735, 0.6278276, 0.4343102, 0, 0, 0, 1, 1,
0.5173399, 2.399639, -0.1798075, 0, 0, 0, 1, 1,
0.5180603, 1.450878, -0.2876546, 0, 0, 0, 1, 1,
0.5182673, 0.2432545, 1.722017, 0, 0, 0, 1, 1,
0.522072, -1.201797, 2.730966, 0, 0, 0, 1, 1,
0.5237014, -0.3568063, 0.1092311, 0, 0, 0, 1, 1,
0.5251549, -0.5897138, 1.748028, 0, 0, 0, 1, 1,
0.5291524, 0.9692151, -0.5228709, 1, 1, 1, 1, 1,
0.5369897, 0.01741024, 1.679125, 1, 1, 1, 1, 1,
0.5373417, 0.9920697, -0.202578, 1, 1, 1, 1, 1,
0.5386347, -0.4292658, 2.56994, 1, 1, 1, 1, 1,
0.5392206, -1.830792, 3.88786, 1, 1, 1, 1, 1,
0.5394318, 1.079433, 1.004057, 1, 1, 1, 1, 1,
0.5398825, -0.3023167, 3.091996, 1, 1, 1, 1, 1,
0.5421315, 0.5691714, 0.07612778, 1, 1, 1, 1, 1,
0.5443095, -1.17132, 1.305201, 1, 1, 1, 1, 1,
0.5529682, -0.1758269, 1.52206, 1, 1, 1, 1, 1,
0.5534484, 0.5354309, 0.7968273, 1, 1, 1, 1, 1,
0.5582763, 1.565389, -0.1794956, 1, 1, 1, 1, 1,
0.5641068, -0.7486746, 3.062419, 1, 1, 1, 1, 1,
0.573891, 0.5395757, 1.598602, 1, 1, 1, 1, 1,
0.5784129, -1.657831, 2.99166, 1, 1, 1, 1, 1,
0.5794138, 2.076091, -0.9632243, 0, 0, 1, 1, 1,
0.5821933, -0.3483286, 3.04369, 1, 0, 0, 1, 1,
0.5824696, 1.325207, -0.1630248, 1, 0, 0, 1, 1,
0.5829546, -0.2411898, 2.066531, 1, 0, 0, 1, 1,
0.5939228, 1.857264, 0.0009786882, 1, 0, 0, 1, 1,
0.5949237, -0.1429518, 3.735068, 1, 0, 0, 1, 1,
0.5949931, 0.2997502, 2.03335, 0, 0, 0, 1, 1,
0.5970563, 0.04629611, 1.856367, 0, 0, 0, 1, 1,
0.6008912, 0.5308158, 1.276833, 0, 0, 0, 1, 1,
0.6064757, -1.446285, 3.575762, 0, 0, 0, 1, 1,
0.6093798, -1.123427, 2.971698, 0, 0, 0, 1, 1,
0.6243231, 0.5584298, 0.9549922, 0, 0, 0, 1, 1,
0.6247874, -1.161376, 4.839172, 0, 0, 0, 1, 1,
0.626133, -0.7106026, 2.093441, 1, 1, 1, 1, 1,
0.6302258, 0.1729481, 0.5586833, 1, 1, 1, 1, 1,
0.6344903, 1.610174, 0.5502071, 1, 1, 1, 1, 1,
0.6382807, 0.200027, 1.644792, 1, 1, 1, 1, 1,
0.6419999, -0.2627322, 2.809684, 1, 1, 1, 1, 1,
0.6517082, 0.01076511, 0.3497881, 1, 1, 1, 1, 1,
0.6529112, 1.7139, 0.2954132, 1, 1, 1, 1, 1,
0.6541701, -1.452925, 1.468932, 1, 1, 1, 1, 1,
0.656082, -0.06093936, 1.277669, 1, 1, 1, 1, 1,
0.6631507, -0.2617867, 1.433925, 1, 1, 1, 1, 1,
0.6671751, -0.9163714, 2.274158, 1, 1, 1, 1, 1,
0.6705466, -0.7430084, 3.559536, 1, 1, 1, 1, 1,
0.6706694, -2.077514, 3.887989, 1, 1, 1, 1, 1,
0.6785384, -0.2820351, 1.667388, 1, 1, 1, 1, 1,
0.6798158, -0.7322935, 2.846637, 1, 1, 1, 1, 1,
0.6868752, 0.8289604, 1.879011, 0, 0, 1, 1, 1,
0.6869193, 0.6726435, 0.5198333, 1, 0, 0, 1, 1,
0.7002504, 1.995863, -1.172567, 1, 0, 0, 1, 1,
0.7032173, 0.1289807, 1.59174, 1, 0, 0, 1, 1,
0.7033774, 0.8801099, 1.466616, 1, 0, 0, 1, 1,
0.7046337, 0.3532967, 2.736427, 1, 0, 0, 1, 1,
0.7083794, 2.028914, -1.311276, 0, 0, 0, 1, 1,
0.7109554, 0.467283, 1.797614, 0, 0, 0, 1, 1,
0.7155706, -1.629882, 3.574314, 0, 0, 0, 1, 1,
0.7190941, -1.901587, 2.676589, 0, 0, 0, 1, 1,
0.7217126, 0.102193, 2.006572, 0, 0, 0, 1, 1,
0.7271852, 1.567953, 0.0894896, 0, 0, 0, 1, 1,
0.7299351, -0.8539562, 2.543658, 0, 0, 0, 1, 1,
0.737085, -0.2700792, 2.685793, 1, 1, 1, 1, 1,
0.7442307, -0.9650002, -0.03315124, 1, 1, 1, 1, 1,
0.7442346, -0.522011, 1.15145, 1, 1, 1, 1, 1,
0.744239, 0.15623, 0.5762237, 1, 1, 1, 1, 1,
0.7450998, -0.6612284, 3.320789, 1, 1, 1, 1, 1,
0.7466028, 0.005044387, 2.147629, 1, 1, 1, 1, 1,
0.758943, -0.7815148, 2.825401, 1, 1, 1, 1, 1,
0.7591138, 1.162187, -1.51923, 1, 1, 1, 1, 1,
0.7653935, 0.7820696, 1.051017, 1, 1, 1, 1, 1,
0.7760039, 0.3133048, 1.322517, 1, 1, 1, 1, 1,
0.7779371, 0.2543722, 1.689931, 1, 1, 1, 1, 1,
0.7838707, 0.4638084, 1.068968, 1, 1, 1, 1, 1,
0.7904479, -1.522814, 2.680546, 1, 1, 1, 1, 1,
0.7912896, -0.8527828, 2.423802, 1, 1, 1, 1, 1,
0.7957204, 0.7201552, 0.993956, 1, 1, 1, 1, 1,
0.8009757, 0.08355094, 0.8893039, 0, 0, 1, 1, 1,
0.8037245, 1.290989, 1.116917, 1, 0, 0, 1, 1,
0.8042275, -0.9286727, 0.8123692, 1, 0, 0, 1, 1,
0.8091457, -1.30882, 2.451527, 1, 0, 0, 1, 1,
0.8208293, -1.136399, 2.609195, 1, 0, 0, 1, 1,
0.8257166, -0.3896559, 2.996871, 1, 0, 0, 1, 1,
0.8257728, -0.7113015, 2.373239, 0, 0, 0, 1, 1,
0.8273822, 0.4492111, 1.817284, 0, 0, 0, 1, 1,
0.8299745, 0.2928552, 1.281356, 0, 0, 0, 1, 1,
0.8338884, 0.4366317, 2.114758, 0, 0, 0, 1, 1,
0.8410522, 0.5645074, 0.4957159, 0, 0, 0, 1, 1,
0.8483331, -2.106715, 3.544852, 0, 0, 0, 1, 1,
0.8505759, -0.2958662, 1.560312, 0, 0, 0, 1, 1,
0.8508703, -0.1224528, 1.077111, 1, 1, 1, 1, 1,
0.8560954, 0.2110854, 1.423152, 1, 1, 1, 1, 1,
0.8566751, 2.126416, 0.1084627, 1, 1, 1, 1, 1,
0.8615025, 0.6920298, 0.0834039, 1, 1, 1, 1, 1,
0.8616058, 0.8636399, 2.264719, 1, 1, 1, 1, 1,
0.8637964, -0.03504036, 1.20674, 1, 1, 1, 1, 1,
0.8691683, 1.040772, 0.1702717, 1, 1, 1, 1, 1,
0.8786634, 0.6896481, -0.9484972, 1, 1, 1, 1, 1,
0.8806378, -0.3755759, 2.764186, 1, 1, 1, 1, 1,
0.8815712, 0.9249408, 2.154872, 1, 1, 1, 1, 1,
0.8824121, -0.008141153, 0.5155958, 1, 1, 1, 1, 1,
0.8882644, -0.5137139, 0.07633365, 1, 1, 1, 1, 1,
0.8908796, -0.2936004, 3.258734, 1, 1, 1, 1, 1,
0.8915579, -0.3770565, 2.355047, 1, 1, 1, 1, 1,
0.8962975, 0.4452962, 1.639756, 1, 1, 1, 1, 1,
0.8978314, -1.660149, 1.32032, 0, 0, 1, 1, 1,
0.8984988, -0.02705268, -0.1780058, 1, 0, 0, 1, 1,
0.8990373, 0.6867062, 2.037249, 1, 0, 0, 1, 1,
0.901429, 0.7021332, -0.2100475, 1, 0, 0, 1, 1,
0.9034462, 0.4483733, 1.09972, 1, 0, 0, 1, 1,
0.9076931, -0.7737145, 2.661978, 1, 0, 0, 1, 1,
0.9105543, -0.6929588, 2.074797, 0, 0, 0, 1, 1,
0.9112926, -1.387431, 3.502162, 0, 0, 0, 1, 1,
0.9182556, 0.8080497, 0.6011366, 0, 0, 0, 1, 1,
0.9189798, -0.3464112, 2.013251, 0, 0, 0, 1, 1,
0.9190134, 0.317947, 2.268851, 0, 0, 0, 1, 1,
0.9202818, 2.597368, 1.02808, 0, 0, 0, 1, 1,
0.9229081, 1.38696, 0.8507864, 0, 0, 0, 1, 1,
0.9287729, 0.02613585, 1.746775, 1, 1, 1, 1, 1,
0.9333711, 0.4588016, 3.101538, 1, 1, 1, 1, 1,
0.9369876, -0.3138225, 1.339357, 1, 1, 1, 1, 1,
0.9384255, 1.21918, 1.383437, 1, 1, 1, 1, 1,
0.9424084, 0.07142483, 0.6474568, 1, 1, 1, 1, 1,
0.9425641, 0.6089877, 0.7929465, 1, 1, 1, 1, 1,
0.9431319, 1.940266, 3.241292, 1, 1, 1, 1, 1,
0.9439347, 0.04898666, 0.9806314, 1, 1, 1, 1, 1,
0.9461729, 0.7107762, 0.9929202, 1, 1, 1, 1, 1,
0.9507011, 0.6787639, 1.178898, 1, 1, 1, 1, 1,
0.9545834, 0.05771716, 0.3912974, 1, 1, 1, 1, 1,
0.9549831, 0.9642247, -0.0110608, 1, 1, 1, 1, 1,
0.9596381, 0.02119977, 2.426869, 1, 1, 1, 1, 1,
0.9602371, -1.19215, 3.266804, 1, 1, 1, 1, 1,
0.9607795, 0.5292866, 1.436929, 1, 1, 1, 1, 1,
0.9640418, -0.6699563, 2.921259, 0, 0, 1, 1, 1,
0.9641369, 1.630922, 2.270994, 1, 0, 0, 1, 1,
0.9929825, -0.2129699, 1.598642, 1, 0, 0, 1, 1,
0.9930754, 0.4235867, 0.1362398, 1, 0, 0, 1, 1,
0.9982497, 0.9841671, 0.2315305, 1, 0, 0, 1, 1,
0.9986776, -0.04642187, 2.083406, 1, 0, 0, 1, 1,
0.9999272, 0.7227998, -0.3919943, 0, 0, 0, 1, 1,
1.000754, -2.526127, 2.119574, 0, 0, 0, 1, 1,
1.011472, -0.9009252, 4.614532, 0, 0, 0, 1, 1,
1.02624, -0.5827482, 2.548714, 0, 0, 0, 1, 1,
1.031715, -0.882632, 3.979542, 0, 0, 0, 1, 1,
1.032786, -0.3028788, 0.8923934, 0, 0, 0, 1, 1,
1.036908, -1.252658, 3.362643, 0, 0, 0, 1, 1,
1.043594, -0.636766, 2.314138, 1, 1, 1, 1, 1,
1.04378, 0.2020662, 1.05534, 1, 1, 1, 1, 1,
1.04559, 0.5761178, 1.712499, 1, 1, 1, 1, 1,
1.054024, -0.5791523, 4.413374, 1, 1, 1, 1, 1,
1.060334, -0.3802006, -0.003704744, 1, 1, 1, 1, 1,
1.060346, -1.455857, 2.005278, 1, 1, 1, 1, 1,
1.060926, -0.4594444, 1.295896, 1, 1, 1, 1, 1,
1.062123, 0.05639149, 1.808082, 1, 1, 1, 1, 1,
1.093432, 0.7259, -0.4967219, 1, 1, 1, 1, 1,
1.094183, 0.1346357, 1.500751, 1, 1, 1, 1, 1,
1.094668, -0.6171883, 2.784601, 1, 1, 1, 1, 1,
1.105579, 0.3341526, 1.36442, 1, 1, 1, 1, 1,
1.112987, -0.8770066, 2.217443, 1, 1, 1, 1, 1,
1.118723, 1.407571, 1.308299, 1, 1, 1, 1, 1,
1.119138, 1.890328, 0.2659709, 1, 1, 1, 1, 1,
1.121309, -0.2148508, 0.6271669, 0, 0, 1, 1, 1,
1.123504, -0.8261544, 2.132193, 1, 0, 0, 1, 1,
1.127314, 0.7216228, 1.483794, 1, 0, 0, 1, 1,
1.148089, 0.842519, 0.4105832, 1, 0, 0, 1, 1,
1.149752, 0.4602416, 1.144952, 1, 0, 0, 1, 1,
1.153005, 0.9885843, 0.8235257, 1, 0, 0, 1, 1,
1.162101, -0.6600451, 0.6675501, 0, 0, 0, 1, 1,
1.163594, 0.07591272, 1.583985, 0, 0, 0, 1, 1,
1.166123, -0.6041811, 2.98608, 0, 0, 0, 1, 1,
1.167066, 0.9400982, 0.5157485, 0, 0, 0, 1, 1,
1.171203, -1.220043, 1.462041, 0, 0, 0, 1, 1,
1.172335, -0.5976552, 2.178988, 0, 0, 0, 1, 1,
1.178548, -0.8739786, 3.002941, 0, 0, 0, 1, 1,
1.189934, 1.811189, 1.48218, 1, 1, 1, 1, 1,
1.190935, 0.5911549, 1.71653, 1, 1, 1, 1, 1,
1.195766, -0.196731, 1.588452, 1, 1, 1, 1, 1,
1.202154, -1.911029, 2.647089, 1, 1, 1, 1, 1,
1.205871, -0.04790265, 1.14435, 1, 1, 1, 1, 1,
1.205994, 1.963367, 1.410774, 1, 1, 1, 1, 1,
1.206451, -0.6109413, 2.392086, 1, 1, 1, 1, 1,
1.208519, 0.8793977, 0.7381461, 1, 1, 1, 1, 1,
1.210122, -0.7495663, 2.246216, 1, 1, 1, 1, 1,
1.217497, 0.04341758, 0.09472208, 1, 1, 1, 1, 1,
1.2271, 2.580943, -0.2538648, 1, 1, 1, 1, 1,
1.233104, -1.471029, 1.674634, 1, 1, 1, 1, 1,
1.234562, -1.010815, 2.887322, 1, 1, 1, 1, 1,
1.235377, -0.2386102, 1.726277, 1, 1, 1, 1, 1,
1.251989, -1.594928, 0.8235095, 1, 1, 1, 1, 1,
1.258638, -0.8272015, 1.937985, 0, 0, 1, 1, 1,
1.262151, 0.108376, 0.7962595, 1, 0, 0, 1, 1,
1.264754, -1.396156, 3.761892, 1, 0, 0, 1, 1,
1.267643, 0.3776846, 0.9406742, 1, 0, 0, 1, 1,
1.288108, -0.1449125, 1.948857, 1, 0, 0, 1, 1,
1.296648, 0.9116001, 0.5158128, 1, 0, 0, 1, 1,
1.302079, 0.9913484, 2.316678, 0, 0, 0, 1, 1,
1.303911, 1.024563, 1.783493, 0, 0, 0, 1, 1,
1.306489, -1.368987, 2.187344, 0, 0, 0, 1, 1,
1.309128, -0.3481297, 2.366925, 0, 0, 0, 1, 1,
1.330142, -1.432303, 1.590909, 0, 0, 0, 1, 1,
1.330171, -0.08937847, 2.314171, 0, 0, 0, 1, 1,
1.33136, -1.24802, 1.993111, 0, 0, 0, 1, 1,
1.332426, 2.741474, 2.271091, 1, 1, 1, 1, 1,
1.333347, -0.2377154, 1.628072, 1, 1, 1, 1, 1,
1.33381, -0.8330489, 2.66576, 1, 1, 1, 1, 1,
1.336881, 0.07477301, 1.881603, 1, 1, 1, 1, 1,
1.349623, 2.525294, 1.52505, 1, 1, 1, 1, 1,
1.353069, -0.7833712, 1.091412, 1, 1, 1, 1, 1,
1.361376, -0.5683593, 1.045859, 1, 1, 1, 1, 1,
1.361719, -0.02131424, 3.593392, 1, 1, 1, 1, 1,
1.368475, -1.126015, 2.888185, 1, 1, 1, 1, 1,
1.370057, -0.5165594, 2.752855, 1, 1, 1, 1, 1,
1.371616, 0.3879788, 1.052783, 1, 1, 1, 1, 1,
1.376642, -1.445227, 1.764974, 1, 1, 1, 1, 1,
1.379053, 1.096467, -0.5264597, 1, 1, 1, 1, 1,
1.385657, 0.5966184, 2.296271, 1, 1, 1, 1, 1,
1.403236, 0.03800784, 1.77032, 1, 1, 1, 1, 1,
1.409331, 0.5972393, 1.568699, 0, 0, 1, 1, 1,
1.417054, -1.981312, 4.164867, 1, 0, 0, 1, 1,
1.423677, 1.048792, 1.892719, 1, 0, 0, 1, 1,
1.428193, -0.5064448, 1.570179, 1, 0, 0, 1, 1,
1.437378, 0.5334148, 1.085456, 1, 0, 0, 1, 1,
1.444418, -1.418256, 3.242715, 1, 0, 0, 1, 1,
1.452363, 0.2789388, 0.6704546, 0, 0, 0, 1, 1,
1.482503, 0.7893738, 0.1296856, 0, 0, 0, 1, 1,
1.489564, -0.01439313, 1.492412, 0, 0, 0, 1, 1,
1.498616, 0.7117565, 0.8755504, 0, 0, 0, 1, 1,
1.505701, 0.9210845, 0.1540542, 0, 0, 0, 1, 1,
1.509323, -0.21886, 2.04232, 0, 0, 0, 1, 1,
1.547608, 1.165627, -0.371512, 0, 0, 0, 1, 1,
1.561289, 0.5691511, 1.256088, 1, 1, 1, 1, 1,
1.589124, 0.7767698, 1.265536, 1, 1, 1, 1, 1,
1.590527, 0.2744882, 1.472115, 1, 1, 1, 1, 1,
1.603193, -0.05009065, 1.117484, 1, 1, 1, 1, 1,
1.607396, 0.6143863, 1.250961, 1, 1, 1, 1, 1,
1.610157, 0.4676178, 0.1301847, 1, 1, 1, 1, 1,
1.615708, -0.1285601, 1.30191, 1, 1, 1, 1, 1,
1.629988, 0.1573531, 0.2750683, 1, 1, 1, 1, 1,
1.631839, 0.3843935, 1.326608, 1, 1, 1, 1, 1,
1.647812, 1.266188, 1.224831, 1, 1, 1, 1, 1,
1.65335, 0.1822235, 2.004255, 1, 1, 1, 1, 1,
1.700252, -0.1471224, 1.040523, 1, 1, 1, 1, 1,
1.717756, -0.3735996, 0.8768892, 1, 1, 1, 1, 1,
1.725622, 0.6564167, 2.352498, 1, 1, 1, 1, 1,
1.733818, -0.1939016, 1.037051, 1, 1, 1, 1, 1,
1.740187, -1.190566, 2.257693, 0, 0, 1, 1, 1,
1.776941, -1.059379, 2.280194, 1, 0, 0, 1, 1,
1.788686, 0.06200216, 2.727657, 1, 0, 0, 1, 1,
1.792997, -0.2236011, 2.068298, 1, 0, 0, 1, 1,
1.804156, -1.551466, 3.651718, 1, 0, 0, 1, 1,
1.812955, 1.571382, -0.9254232, 1, 0, 0, 1, 1,
1.834245, -1.785222, 1.118294, 0, 0, 0, 1, 1,
1.837544, -1.111151, 1.339987, 0, 0, 0, 1, 1,
1.848466, 0.01906974, 1.591643, 0, 0, 0, 1, 1,
1.871585, 1.391746, 1.28346, 0, 0, 0, 1, 1,
1.890419, 1.923912, 1.789195, 0, 0, 0, 1, 1,
1.891387, -0.3925675, 1.92065, 0, 0, 0, 1, 1,
1.89652, -0.5547609, 0.2142762, 0, 0, 0, 1, 1,
1.897389, -0.5382888, 2.413135, 1, 1, 1, 1, 1,
1.905426, 0.6641957, 2.894992, 1, 1, 1, 1, 1,
1.918151, -0.5217849, 0.4484435, 1, 1, 1, 1, 1,
1.941666, 0.008023651, 2.296314, 1, 1, 1, 1, 1,
1.951502, 0.8912159, 1.551469, 1, 1, 1, 1, 1,
1.974633, -0.1527219, 1.172245, 1, 1, 1, 1, 1,
1.997472, 0.5187334, 0.528187, 1, 1, 1, 1, 1,
2.004485, -1.559654, 2.670397, 1, 1, 1, 1, 1,
2.027029, -0.0965744, -0.2719752, 1, 1, 1, 1, 1,
2.032757, 0.07671546, 0.8004051, 1, 1, 1, 1, 1,
2.0455, 0.1306212, 0.4704103, 1, 1, 1, 1, 1,
2.048127, -0.6835293, 0.5032517, 1, 1, 1, 1, 1,
2.050512, 0.4648848, 1.241414, 1, 1, 1, 1, 1,
2.113656, 0.5952253, 1.781282, 1, 1, 1, 1, 1,
2.200016, 0.6048547, 1.854743, 1, 1, 1, 1, 1,
2.25749, -1.120772, 1.902318, 0, 0, 1, 1, 1,
2.270909, -1.808152, 1.607966, 1, 0, 0, 1, 1,
2.301567, -0.9577788, 2.58022, 1, 0, 0, 1, 1,
2.329341, -0.02277647, 1.278273, 1, 0, 0, 1, 1,
2.334812, -0.3541189, 3.144988, 1, 0, 0, 1, 1,
2.351051, -0.2265323, 1.355998, 1, 0, 0, 1, 1,
2.399103, -0.8681009, 3.348076, 0, 0, 0, 1, 1,
2.428584, -0.7000003, 0.5063927, 0, 0, 0, 1, 1,
2.428704, 1.365737, -0.140303, 0, 0, 0, 1, 1,
2.486951, 0.4345542, 0.880828, 0, 0, 0, 1, 1,
2.496128, -0.2292377, 2.959394, 0, 0, 0, 1, 1,
2.602922, 0.4891195, 1.022966, 0, 0, 0, 1, 1,
2.678162, -0.1179802, 3.905073, 0, 0, 0, 1, 1,
2.704735, -1.700814, 1.495054, 1, 1, 1, 1, 1,
2.727229, 1.047902, 0.5833389, 1, 1, 1, 1, 1,
2.850901, -0.7104856, 2.126984, 1, 1, 1, 1, 1,
2.896377, 1.383847, 1.409751, 1, 1, 1, 1, 1,
2.999661, 0.520408, 1.285705, 1, 1, 1, 1, 1,
3.025914, -0.860199, 2.750359, 1, 1, 1, 1, 1,
3.190102, -0.3111133, 2.667392, 1, 1, 1, 1, 1
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
var radius = 9.507772;
var distance = 33.39565;
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
mvMatrix.translate( -0.1625473, 0.1127728, -0.06465387 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39565);
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
