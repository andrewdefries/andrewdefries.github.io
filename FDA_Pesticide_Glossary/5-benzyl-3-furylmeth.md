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
-2.856648, -0.06258579, -0.4994463, 1, 0, 0, 1,
-2.811079, 0.6559834, 0.1325428, 1, 0.007843138, 0, 1,
-2.776716, 1.379972, -1.763478, 1, 0.01176471, 0, 1,
-2.638814, -1.499351, -3.38547, 1, 0.01960784, 0, 1,
-2.608358, 0.2202135, -0.2530857, 1, 0.02352941, 0, 1,
-2.603074, -2.135714, -1.541586, 1, 0.03137255, 0, 1,
-2.420737, 1.840713, -2.265104, 1, 0.03529412, 0, 1,
-2.390907, -0.0655759, -2.553932, 1, 0.04313726, 0, 1,
-2.385698, -1.803378, -0.7874593, 1, 0.04705882, 0, 1,
-2.347688, -0.008270297, -2.589514, 1, 0.05490196, 0, 1,
-2.312631, -1.726291, 0.06734253, 1, 0.05882353, 0, 1,
-2.309238, -1.828846, -1.939722, 1, 0.06666667, 0, 1,
-2.273767, -0.6461938, -1.698703, 1, 0.07058824, 0, 1,
-2.248556, 3.281516, 0.1184663, 1, 0.07843138, 0, 1,
-2.241961, 0.1090491, -0.855773, 1, 0.08235294, 0, 1,
-2.22318, -0.4507002, -0.9563133, 1, 0.09019608, 0, 1,
-2.195947, -1.084873, -1.60099, 1, 0.09411765, 0, 1,
-2.147296, 0.9671989, -0.1366255, 1, 0.1019608, 0, 1,
-2.085048, -0.1218873, -1.308453, 1, 0.1098039, 0, 1,
-2.041776, -0.860265, -2.73472, 1, 0.1137255, 0, 1,
-2.040059, 1.4671, -2.343035, 1, 0.1215686, 0, 1,
-2.022544, -0.5174968, -3.208226, 1, 0.1254902, 0, 1,
-1.986733, -0.7783562, -2.337551, 1, 0.1333333, 0, 1,
-1.968977, -0.9378681, -1.910444, 1, 0.1372549, 0, 1,
-1.966334, -2.778102, -2.770036, 1, 0.145098, 0, 1,
-1.89256, 0.6523311, -0.1138094, 1, 0.1490196, 0, 1,
-1.88569, 0.8390339, -1.947505, 1, 0.1568628, 0, 1,
-1.865291, -2.235065, -3.150811, 1, 0.1607843, 0, 1,
-1.861778, 1.276425, 0.9095672, 1, 0.1686275, 0, 1,
-1.853684, -0.5096915, -2.731224, 1, 0.172549, 0, 1,
-1.852564, -0.8512061, -2.528257, 1, 0.1803922, 0, 1,
-1.843398, -0.4900015, -1.307238, 1, 0.1843137, 0, 1,
-1.824181, 0.3007318, -0.4926949, 1, 0.1921569, 0, 1,
-1.812813, -0.2734621, -2.32571, 1, 0.1960784, 0, 1,
-1.795618, -1.08362, -1.3129, 1, 0.2039216, 0, 1,
-1.787502, 1.946771, -0.7302204, 1, 0.2117647, 0, 1,
-1.781322, -0.5242375, -0.3529041, 1, 0.2156863, 0, 1,
-1.779679, -0.7403399, -2.267724, 1, 0.2235294, 0, 1,
-1.765271, 1.7561, -0.683836, 1, 0.227451, 0, 1,
-1.755434, 1.606229, -0.5328511, 1, 0.2352941, 0, 1,
-1.747413, -0.2520881, -1.007168, 1, 0.2392157, 0, 1,
-1.746009, -0.1482105, -1.968153, 1, 0.2470588, 0, 1,
-1.729923, 1.534858, 0.09350368, 1, 0.2509804, 0, 1,
-1.729832, 0.5194567, -0.9832001, 1, 0.2588235, 0, 1,
-1.726923, 0.3966318, -2.123694, 1, 0.2627451, 0, 1,
-1.719358, -0.1115314, -0.5720983, 1, 0.2705882, 0, 1,
-1.710586, -0.7281338, -1.402134, 1, 0.2745098, 0, 1,
-1.708611, 0.2112451, -1.800669, 1, 0.282353, 0, 1,
-1.696983, -0.508997, -1.079601, 1, 0.2862745, 0, 1,
-1.674011, -0.2218098, -1.948602, 1, 0.2941177, 0, 1,
-1.668718, -0.4092407, -0.2855017, 1, 0.3019608, 0, 1,
-1.652373, 0.1426284, -0.3767756, 1, 0.3058824, 0, 1,
-1.643003, 0.8060858, -0.9136071, 1, 0.3137255, 0, 1,
-1.640755, -0.4667313, -2.870033, 1, 0.3176471, 0, 1,
-1.637004, 1.131815, -1.186207, 1, 0.3254902, 0, 1,
-1.634412, 0.4643398, -1.022538, 1, 0.3294118, 0, 1,
-1.604156, 0.2465088, -2.910855, 1, 0.3372549, 0, 1,
-1.570073, 1.108663, -0.4343691, 1, 0.3411765, 0, 1,
-1.563611, 0.2184241, -0.308411, 1, 0.3490196, 0, 1,
-1.561476, -0.9411359, -1.36744, 1, 0.3529412, 0, 1,
-1.556538, 0.2717932, -2.004252, 1, 0.3607843, 0, 1,
-1.553019, -0.4887606, -0.9646798, 1, 0.3647059, 0, 1,
-1.552666, -0.8004172, -1.910511, 1, 0.372549, 0, 1,
-1.550116, 0.6122494, -2.108218, 1, 0.3764706, 0, 1,
-1.542831, -0.6364538, -2.500721, 1, 0.3843137, 0, 1,
-1.538676, 0.8879339, -0.7283704, 1, 0.3882353, 0, 1,
-1.530264, -0.2847387, -2.683412, 1, 0.3960784, 0, 1,
-1.517096, 1.314412, -1.120186, 1, 0.4039216, 0, 1,
-1.515201, -0.9936211, -1.343741, 1, 0.4078431, 0, 1,
-1.508139, 0.8418567, -0.5037586, 1, 0.4156863, 0, 1,
-1.506348, 0.004505143, -1.541659, 1, 0.4196078, 0, 1,
-1.504848, -0.6564614, -0.5186119, 1, 0.427451, 0, 1,
-1.502404, 0.279808, -1.371295, 1, 0.4313726, 0, 1,
-1.477366, -2.523873, -2.841452, 1, 0.4392157, 0, 1,
-1.450826, 0.5734538, -1.29016, 1, 0.4431373, 0, 1,
-1.449853, 0.4353229, -1.040343, 1, 0.4509804, 0, 1,
-1.445696, -0.2336009, -2.323798, 1, 0.454902, 0, 1,
-1.443283, -1.737498, -2.368464, 1, 0.4627451, 0, 1,
-1.442449, -0.2465578, -1.746524, 1, 0.4666667, 0, 1,
-1.427171, -1.031912, -2.280065, 1, 0.4745098, 0, 1,
-1.427012, -0.1729965, -1.957825, 1, 0.4784314, 0, 1,
-1.410897, -0.8524581, -2.667713, 1, 0.4862745, 0, 1,
-1.410864, 1.503314, -0.5358549, 1, 0.4901961, 0, 1,
-1.401508, 2.637707, -1.88617, 1, 0.4980392, 0, 1,
-1.390657, -0.07979979, -1.589718, 1, 0.5058824, 0, 1,
-1.38544, 0.7397593, -1.149362, 1, 0.509804, 0, 1,
-1.374164, 1.655692, -1.007154, 1, 0.5176471, 0, 1,
-1.368727, 0.1087396, -0.5931916, 1, 0.5215687, 0, 1,
-1.361333, 1.175863, -2.97084, 1, 0.5294118, 0, 1,
-1.341589, -0.6841406, -0.7542317, 1, 0.5333334, 0, 1,
-1.338226, -0.9234922, -1.440111, 1, 0.5411765, 0, 1,
-1.337299, -1.474054, -1.532171, 1, 0.5450981, 0, 1,
-1.336071, -1.73161, -2.803068, 1, 0.5529412, 0, 1,
-1.33105, -1.348032, -0.9030447, 1, 0.5568628, 0, 1,
-1.329098, -0.1143284, -0.7292424, 1, 0.5647059, 0, 1,
-1.32418, -1.582279, -1.850401, 1, 0.5686275, 0, 1,
-1.313319, -0.8278047, -3.689372, 1, 0.5764706, 0, 1,
-1.311279, 1.860213, -0.08343507, 1, 0.5803922, 0, 1,
-1.310973, -0.9031834, -1.928289, 1, 0.5882353, 0, 1,
-1.306749, 0.1761311, -1.38473, 1, 0.5921569, 0, 1,
-1.304159, 0.7478979, -1.001458, 1, 0.6, 0, 1,
-1.298099, 1.3573, -0.4307749, 1, 0.6078432, 0, 1,
-1.280051, -0.7926443, -1.525995, 1, 0.6117647, 0, 1,
-1.279312, -0.8988618, -1.88184, 1, 0.6196079, 0, 1,
-1.26269, 1.317294, -0.6227549, 1, 0.6235294, 0, 1,
-1.256621, -0.7448307, -2.228475, 1, 0.6313726, 0, 1,
-1.252625, 1.167607, -0.6976002, 1, 0.6352941, 0, 1,
-1.244402, 0.2268897, 0.08517051, 1, 0.6431373, 0, 1,
-1.231018, 0.5305452, -0.1080922, 1, 0.6470588, 0, 1,
-1.22884, -1.715921, -3.376869, 1, 0.654902, 0, 1,
-1.217058, -1.019654, -2.805241, 1, 0.6588235, 0, 1,
-1.21121, 0.3043886, -0.5739941, 1, 0.6666667, 0, 1,
-1.209597, -2.285487, -1.520449, 1, 0.6705883, 0, 1,
-1.198523, -0.4169933, -1.55966, 1, 0.6784314, 0, 1,
-1.1922, -0.2277377, -2.568226, 1, 0.682353, 0, 1,
-1.190685, -0.5496939, -3.782537, 1, 0.6901961, 0, 1,
-1.176837, -1.066843, -2.96436, 1, 0.6941177, 0, 1,
-1.175566, -0.6208142, -1.486824, 1, 0.7019608, 0, 1,
-1.165082, 0.5994699, -0.8799938, 1, 0.7098039, 0, 1,
-1.158968, 1.183993, 0.2419602, 1, 0.7137255, 0, 1,
-1.151562, -1.103929, -3.527351, 1, 0.7215686, 0, 1,
-1.143495, -1.446694, -2.655176, 1, 0.7254902, 0, 1,
-1.13958, -0.2350236, -1.310807, 1, 0.7333333, 0, 1,
-1.13169, 0.1387274, -1.522076, 1, 0.7372549, 0, 1,
-1.124496, 1.185892, 0.9170299, 1, 0.7450981, 0, 1,
-1.118981, -0.1539, -3.255679, 1, 0.7490196, 0, 1,
-1.118894, -0.02893344, -0.7284498, 1, 0.7568628, 0, 1,
-1.114236, -0.292709, -1.729851, 1, 0.7607843, 0, 1,
-1.101478, 0.577848, -0.4879655, 1, 0.7686275, 0, 1,
-1.100553, 0.5177691, -0.5405149, 1, 0.772549, 0, 1,
-1.095954, -0.8092453, -1.432291, 1, 0.7803922, 0, 1,
-1.091128, -0.9393018, -2.541033, 1, 0.7843137, 0, 1,
-1.08895, -0.02610771, -0.978686, 1, 0.7921569, 0, 1,
-1.085808, -0.2069098, -3.308375, 1, 0.7960784, 0, 1,
-1.084777, 1.669955, -1.117412, 1, 0.8039216, 0, 1,
-1.080198, -0.680674, -2.967828, 1, 0.8117647, 0, 1,
-1.068297, 0.3068083, -1.540154, 1, 0.8156863, 0, 1,
-1.067958, -0.768192, -3.702064, 1, 0.8235294, 0, 1,
-1.066064, -0.1064538, -1.659319, 1, 0.827451, 0, 1,
-1.049018, 2.466798, -0.144065, 1, 0.8352941, 0, 1,
-1.048814, 1.143774, -0.1664958, 1, 0.8392157, 0, 1,
-1.041868, 1.049569, -0.706781, 1, 0.8470588, 0, 1,
-1.038487, -1.14798, -1.720414, 1, 0.8509804, 0, 1,
-1.03634, 2.154762, -1.593462, 1, 0.8588235, 0, 1,
-1.033758, 0.285856, -3.359105, 1, 0.8627451, 0, 1,
-1.031035, 0.6465601, -1.849743, 1, 0.8705882, 0, 1,
-1.029692, 1.222473, -0.8425508, 1, 0.8745098, 0, 1,
-1.026531, 0.3537564, -1.597855, 1, 0.8823529, 0, 1,
-1.017261, 1.301894, -1.350656, 1, 0.8862745, 0, 1,
-1.008089, -1.112082, -2.040157, 1, 0.8941177, 0, 1,
-1.005755, -0.524462, -2.708187, 1, 0.8980392, 0, 1,
-0.9948264, 0.5399854, 1.22114, 1, 0.9058824, 0, 1,
-0.9934834, 0.2453051, -0.6094224, 1, 0.9137255, 0, 1,
-0.9914379, -0.6487384, -2.697456, 1, 0.9176471, 0, 1,
-0.9876915, -0.3855212, -1.551771, 1, 0.9254902, 0, 1,
-0.9870377, -0.4207936, -2.514901, 1, 0.9294118, 0, 1,
-0.9859516, 1.101963, 1.097981, 1, 0.9372549, 0, 1,
-0.9854265, 0.748807, -2.090032, 1, 0.9411765, 0, 1,
-0.9851273, -1.633639, -1.807454, 1, 0.9490196, 0, 1,
-0.9818189, -0.8028791, -2.014278, 1, 0.9529412, 0, 1,
-0.9818174, 1.160306, -0.1172756, 1, 0.9607843, 0, 1,
-0.9792864, 1.952555, 1.368478, 1, 0.9647059, 0, 1,
-0.9777122, -0.6735181, -1.853114, 1, 0.972549, 0, 1,
-0.9685308, -1.005106, -1.704092, 1, 0.9764706, 0, 1,
-0.9682337, 0.4471937, -1.77043, 1, 0.9843137, 0, 1,
-0.9582046, -1.59685, -1.593469, 1, 0.9882353, 0, 1,
-0.956964, -0.940865, -1.302039, 1, 0.9960784, 0, 1,
-0.9559081, -0.6023622, -3.058905, 0.9960784, 1, 0, 1,
-0.9396188, -1.106291, -2.732536, 0.9921569, 1, 0, 1,
-0.9378061, 0.2943484, -1.199865, 0.9843137, 1, 0, 1,
-0.9344008, -0.5450166, -0.4614522, 0.9803922, 1, 0, 1,
-0.9284261, -0.4228727, -0.4646733, 0.972549, 1, 0, 1,
-0.9241593, -1.602966, -3.052179, 0.9686275, 1, 0, 1,
-0.9204523, 1.276106, 1.204384, 0.9607843, 1, 0, 1,
-0.9200404, 0.7731071, -0.2431675, 0.9568627, 1, 0, 1,
-0.9198368, -1.312117, -2.20956, 0.9490196, 1, 0, 1,
-0.9160346, 1.448325, -0.1817909, 0.945098, 1, 0, 1,
-0.9155195, 1.265787, -1.615741, 0.9372549, 1, 0, 1,
-0.9018693, -0.4110766, -4.33902, 0.9333333, 1, 0, 1,
-0.9011681, -0.5482225, -1.61874, 0.9254902, 1, 0, 1,
-0.8928848, 0.6180937, -1.404814, 0.9215686, 1, 0, 1,
-0.8862785, -2.25196, -2.462052, 0.9137255, 1, 0, 1,
-0.884917, 0.3377111, -2.705703, 0.9098039, 1, 0, 1,
-0.8845242, -0.2837161, 0.1757303, 0.9019608, 1, 0, 1,
-0.8822429, 0.3512673, -0.1586303, 0.8941177, 1, 0, 1,
-0.8783497, -0.3380964, -2.164069, 0.8901961, 1, 0, 1,
-0.8767589, -0.04970136, -3.378329, 0.8823529, 1, 0, 1,
-0.8763301, 0.07059295, -1.460897, 0.8784314, 1, 0, 1,
-0.8626651, -0.924343, -3.593804, 0.8705882, 1, 0, 1,
-0.8448969, 0.6671769, 0.594582, 0.8666667, 1, 0, 1,
-0.835963, 0.3314977, -1.103458, 0.8588235, 1, 0, 1,
-0.8355176, -2.079196, -3.662749, 0.854902, 1, 0, 1,
-0.8337957, 1.223379, -0.5862654, 0.8470588, 1, 0, 1,
-0.8323199, 0.5046889, -2.069956, 0.8431373, 1, 0, 1,
-0.8158935, -1.234763, -2.188534, 0.8352941, 1, 0, 1,
-0.8073831, 1.376348, 2.573134, 0.8313726, 1, 0, 1,
-0.8066628, -1.021688, -2.766477, 0.8235294, 1, 0, 1,
-0.8043025, 3.362465, -1.013816, 0.8196079, 1, 0, 1,
-0.8030792, 0.8652664, 0.2122914, 0.8117647, 1, 0, 1,
-0.7994478, 1.097677, -0.875341, 0.8078431, 1, 0, 1,
-0.7944323, 0.5790253, -0.06433835, 0.8, 1, 0, 1,
-0.7926892, 0.184125, -2.505146, 0.7921569, 1, 0, 1,
-0.7888482, 1.298394, -1.730841, 0.7882353, 1, 0, 1,
-0.7881417, 0.06431377, 0.4903589, 0.7803922, 1, 0, 1,
-0.7876592, -0.29633, -2.121713, 0.7764706, 1, 0, 1,
-0.7871608, 0.5300471, -0.9676803, 0.7686275, 1, 0, 1,
-0.7793673, -0.2593988, 0.05164356, 0.7647059, 1, 0, 1,
-0.7780866, -0.168778, -2.334588, 0.7568628, 1, 0, 1,
-0.7764181, -0.7897125, -3.395434, 0.7529412, 1, 0, 1,
-0.7707247, 0.8158907, -2.057228, 0.7450981, 1, 0, 1,
-0.7701107, -1.985743, -3.782169, 0.7411765, 1, 0, 1,
-0.7666323, -0.6547088, -4.308429, 0.7333333, 1, 0, 1,
-0.7660836, -2.071474, -3.512958, 0.7294118, 1, 0, 1,
-0.7640961, -0.5554914, -1.257749, 0.7215686, 1, 0, 1,
-0.7552728, -0.07535367, -2.957076, 0.7176471, 1, 0, 1,
-0.7522068, -0.8643674, -3.557637, 0.7098039, 1, 0, 1,
-0.7414398, 0.05120412, -0.4006197, 0.7058824, 1, 0, 1,
-0.7410014, 1.703541, -0.3476233, 0.6980392, 1, 0, 1,
-0.7365937, -0.3254288, -3.222301, 0.6901961, 1, 0, 1,
-0.7320552, -0.2368336, -0.7906454, 0.6862745, 1, 0, 1,
-0.7216294, 0.5478428, -1.906756, 0.6784314, 1, 0, 1,
-0.7191719, -0.6045455, -1.858519, 0.6745098, 1, 0, 1,
-0.7128451, -1.192796, -2.658468, 0.6666667, 1, 0, 1,
-0.709032, -0.8914024, -1.080147, 0.6627451, 1, 0, 1,
-0.7089742, -1.030758, -4.153494, 0.654902, 1, 0, 1,
-0.7087708, 1.16412, -2.381009, 0.6509804, 1, 0, 1,
-0.7057456, -0.3037572, -0.5946199, 0.6431373, 1, 0, 1,
-0.7050943, -0.4399461, -3.100129, 0.6392157, 1, 0, 1,
-0.7035348, 0.129903, -0.6901132, 0.6313726, 1, 0, 1,
-0.7031668, -1.650263, -0.7677916, 0.627451, 1, 0, 1,
-0.7001694, 2.071603, 0.8682815, 0.6196079, 1, 0, 1,
-0.6951612, -0.5657492, -4.955944, 0.6156863, 1, 0, 1,
-0.692811, 0.7152242, -3.033515, 0.6078432, 1, 0, 1,
-0.6906171, -0.9136163, -2.578115, 0.6039216, 1, 0, 1,
-0.6901096, -1.067796, -3.952698, 0.5960785, 1, 0, 1,
-0.6883006, -0.4506233, -2.020802, 0.5882353, 1, 0, 1,
-0.6880748, 1.559171, -1.861863, 0.5843138, 1, 0, 1,
-0.6877266, 0.3356038, -1.467566, 0.5764706, 1, 0, 1,
-0.6840976, -0.8691821, -4.448255, 0.572549, 1, 0, 1,
-0.6837785, -0.471109, -1.676918, 0.5647059, 1, 0, 1,
-0.6828923, 1.155947, 0.3711594, 0.5607843, 1, 0, 1,
-0.6776177, -0.6738842, -2.13545, 0.5529412, 1, 0, 1,
-0.6741886, -0.3563478, -1.837057, 0.5490196, 1, 0, 1,
-0.6686044, 2.095946, 0.1459197, 0.5411765, 1, 0, 1,
-0.6668204, -0.4937205, -2.346723, 0.5372549, 1, 0, 1,
-0.6650115, 1.748727, 0.9887655, 0.5294118, 1, 0, 1,
-0.663831, -0.1712488, -3.377819, 0.5254902, 1, 0, 1,
-0.6519005, -1.87232, -3.079674, 0.5176471, 1, 0, 1,
-0.6490046, -1.857067, -2.391086, 0.5137255, 1, 0, 1,
-0.6487709, -0.03441249, -2.210855, 0.5058824, 1, 0, 1,
-0.6483511, 0.4483117, 0.8052043, 0.5019608, 1, 0, 1,
-0.6475914, -0.7384337, -3.774246, 0.4941176, 1, 0, 1,
-0.6447318, 0.2325982, -1.155028, 0.4862745, 1, 0, 1,
-0.6416314, -0.3608185, -1.306378, 0.4823529, 1, 0, 1,
-0.6385586, -0.7572902, -4.380693, 0.4745098, 1, 0, 1,
-0.6369593, 0.5371268, -1.576627, 0.4705882, 1, 0, 1,
-0.6355147, 0.2932392, -1.098032, 0.4627451, 1, 0, 1,
-0.6336578, 1.012943, -1.038634, 0.4588235, 1, 0, 1,
-0.6321239, 0.2983689, -1.1612, 0.4509804, 1, 0, 1,
-0.6292862, 1.887921, -0.1249008, 0.4470588, 1, 0, 1,
-0.6188905, -0.163819, -3.028001, 0.4392157, 1, 0, 1,
-0.6153873, -0.04206242, -1.021436, 0.4352941, 1, 0, 1,
-0.6148004, 1.745463, -0.4006579, 0.427451, 1, 0, 1,
-0.6062761, 0.7916343, -1.63366, 0.4235294, 1, 0, 1,
-0.6010016, 0.1478922, -1.442047, 0.4156863, 1, 0, 1,
-0.598848, 0.832873, -0.6204827, 0.4117647, 1, 0, 1,
-0.5917742, -1.145022, -2.08842, 0.4039216, 1, 0, 1,
-0.5883197, -1.322702, -2.095553, 0.3960784, 1, 0, 1,
-0.5876011, -0.1889064, -2.506064, 0.3921569, 1, 0, 1,
-0.5827015, 0.2244475, -2.69652, 0.3843137, 1, 0, 1,
-0.5794575, -0.4535727, -2.91266, 0.3803922, 1, 0, 1,
-0.5773178, 1.011071, -1.833157, 0.372549, 1, 0, 1,
-0.5664776, 2.148593, -1.515697, 0.3686275, 1, 0, 1,
-0.5648511, 0.5789736, 0.5676452, 0.3607843, 1, 0, 1,
-0.5647625, 1.344775, -1.084988, 0.3568628, 1, 0, 1,
-0.564025, -0.2040633, -2.196047, 0.3490196, 1, 0, 1,
-0.5598935, 0.2044806, -2.010282, 0.345098, 1, 0, 1,
-0.5567508, -0.7955537, -1.680081, 0.3372549, 1, 0, 1,
-0.5516692, 0.4244944, -1.253508, 0.3333333, 1, 0, 1,
-0.5502271, -0.03809503, -0.7227165, 0.3254902, 1, 0, 1,
-0.5469137, 0.3861521, -1.909554, 0.3215686, 1, 0, 1,
-0.5452757, 0.5317845, 0.1016831, 0.3137255, 1, 0, 1,
-0.541457, -1.096714, -3.240848, 0.3098039, 1, 0, 1,
-0.5385794, 0.320645, -0.7948689, 0.3019608, 1, 0, 1,
-0.5376303, 0.4915586, -1.394925, 0.2941177, 1, 0, 1,
-0.5349951, -0.1615185, -2.643075, 0.2901961, 1, 0, 1,
-0.5343504, -0.792928, -2.784992, 0.282353, 1, 0, 1,
-0.5332665, 0.7087268, -2.901121, 0.2784314, 1, 0, 1,
-0.5307729, -0.1326293, -1.607935, 0.2705882, 1, 0, 1,
-0.5301869, -0.446733, -3.972568, 0.2666667, 1, 0, 1,
-0.5262008, -0.291925, -2.291682, 0.2588235, 1, 0, 1,
-0.525686, 0.3330555, -1.062184, 0.254902, 1, 0, 1,
-0.524507, -0.4934295, -1.935721, 0.2470588, 1, 0, 1,
-0.5217248, 1.085676, -0.906244, 0.2431373, 1, 0, 1,
-0.5150186, 0.9188256, -0.7116315, 0.2352941, 1, 0, 1,
-0.5052657, -0.5719636, -1.028283, 0.2313726, 1, 0, 1,
-0.5050992, -1.421107, -2.189676, 0.2235294, 1, 0, 1,
-0.5026721, -0.8243761, -1.69078, 0.2196078, 1, 0, 1,
-0.5003036, -0.9569934, -3.087903, 0.2117647, 1, 0, 1,
-0.4995288, -0.2770759, -1.666157, 0.2078431, 1, 0, 1,
-0.4985671, -0.1615757, -1.132539, 0.2, 1, 0, 1,
-0.496305, -0.5288936, -0.9047737, 0.1921569, 1, 0, 1,
-0.4774701, 0.2157995, -1.033301, 0.1882353, 1, 0, 1,
-0.477067, 0.09564795, -2.01299, 0.1803922, 1, 0, 1,
-0.4754752, -1.139824, -2.900696, 0.1764706, 1, 0, 1,
-0.472062, 0.8285052, 1.021738, 0.1686275, 1, 0, 1,
-0.4720576, 0.1176631, -2.380841, 0.1647059, 1, 0, 1,
-0.471653, -0.5637352, -2.427507, 0.1568628, 1, 0, 1,
-0.4624469, 0.9284922, -0.4298035, 0.1529412, 1, 0, 1,
-0.4601322, 0.04551854, 0.1576903, 0.145098, 1, 0, 1,
-0.457391, 0.3236055, -0.1922265, 0.1411765, 1, 0, 1,
-0.453239, -0.3093793, -2.235816, 0.1333333, 1, 0, 1,
-0.4499154, -0.676114, -0.534667, 0.1294118, 1, 0, 1,
-0.4475486, 1.056449, -0.6687588, 0.1215686, 1, 0, 1,
-0.4442449, -0.328763, -0.7423347, 0.1176471, 1, 0, 1,
-0.4426374, -0.04960458, -2.964348, 0.1098039, 1, 0, 1,
-0.4419923, -0.3859798, -3.24028, 0.1058824, 1, 0, 1,
-0.4418339, -0.05984789, -1.402557, 0.09803922, 1, 0, 1,
-0.4405894, -0.8899837, -4.91624, 0.09019608, 1, 0, 1,
-0.4347796, -2.164669, -2.78416, 0.08627451, 1, 0, 1,
-0.43108, -0.6433201, -2.842137, 0.07843138, 1, 0, 1,
-0.4279917, -0.380169, -4.151126, 0.07450981, 1, 0, 1,
-0.4235975, 0.3322812, -2.458717, 0.06666667, 1, 0, 1,
-0.4200296, 0.1201707, -0.1846853, 0.0627451, 1, 0, 1,
-0.4195303, -0.5091692, -1.413221, 0.05490196, 1, 0, 1,
-0.4190973, 1.171416, -1.037548, 0.05098039, 1, 0, 1,
-0.4186354, -0.2744271, -2.626917, 0.04313726, 1, 0, 1,
-0.417004, -1.389959, -3.304071, 0.03921569, 1, 0, 1,
-0.4127938, -0.8162752, -2.32238, 0.03137255, 1, 0, 1,
-0.4106608, -0.6484253, -0.4540303, 0.02745098, 1, 0, 1,
-0.4081033, 0.6904858, -1.59245, 0.01960784, 1, 0, 1,
-0.4037798, 0.1238806, -0.8394685, 0.01568628, 1, 0, 1,
-0.4013506, -1.287301, -3.000161, 0.007843138, 1, 0, 1,
-0.401255, 2.173121, -0.268057, 0.003921569, 1, 0, 1,
-0.3991953, 0.1986924, -0.4879003, 0, 1, 0.003921569, 1,
-0.3980664, 1.092001, 0.3178053, 0, 1, 0.01176471, 1,
-0.397433, -2.240122, -2.061664, 0, 1, 0.01568628, 1,
-0.3949703, -4.354168, -2.613218, 0, 1, 0.02352941, 1,
-0.3848122, -0.06430502, -2.063907, 0, 1, 0.02745098, 1,
-0.3804644, -0.6407922, -2.899023, 0, 1, 0.03529412, 1,
-0.3768048, -2.052881, -2.70739, 0, 1, 0.03921569, 1,
-0.3735173, 1.60329, 1.856333, 0, 1, 0.04705882, 1,
-0.3628331, -1.243637, -3.194202, 0, 1, 0.05098039, 1,
-0.3614036, 0.2766793, -1.260785, 0, 1, 0.05882353, 1,
-0.3595458, -0.3280684, -1.388444, 0, 1, 0.0627451, 1,
-0.3592765, -0.6973248, -4.251276, 0, 1, 0.07058824, 1,
-0.3589019, 1.858318, -0.5480458, 0, 1, 0.07450981, 1,
-0.3537302, 0.6014693, -0.1625461, 0, 1, 0.08235294, 1,
-0.3512938, -0.07646807, -0.4397394, 0, 1, 0.08627451, 1,
-0.349663, 0.6698301, -0.7209092, 0, 1, 0.09411765, 1,
-0.3493477, 0.1608231, -2.82021, 0, 1, 0.1019608, 1,
-0.3479108, -0.6903472, -3.41589, 0, 1, 0.1058824, 1,
-0.3431925, -1.658821, -2.345591, 0, 1, 0.1137255, 1,
-0.3424663, -0.5556688, -2.572567, 0, 1, 0.1176471, 1,
-0.3394181, 0.1489396, -0.50585, 0, 1, 0.1254902, 1,
-0.3374802, -0.9277251, -2.017591, 0, 1, 0.1294118, 1,
-0.3366703, -0.7404276, -2.842278, 0, 1, 0.1372549, 1,
-0.336253, 0.5789708, 1.276189, 0, 1, 0.1411765, 1,
-0.3341893, 0.1402897, 0.540849, 0, 1, 0.1490196, 1,
-0.3340782, 0.7269823, -2.241125, 0, 1, 0.1529412, 1,
-0.3325296, 1.362899, 0.733941, 0, 1, 0.1607843, 1,
-0.3303814, -0.1256942, -2.090137, 0, 1, 0.1647059, 1,
-0.3259413, 0.2755684, -0.4786157, 0, 1, 0.172549, 1,
-0.3229659, 0.1122965, -0.146862, 0, 1, 0.1764706, 1,
-0.3183855, -1.764856, -3.516884, 0, 1, 0.1843137, 1,
-0.3115091, -0.02359731, -1.317137, 0, 1, 0.1882353, 1,
-0.3113028, 0.7969481, -1.349682, 0, 1, 0.1960784, 1,
-0.3093991, 0.1049225, -1.804943, 0, 1, 0.2039216, 1,
-0.3084919, 0.06536379, -1.557454, 0, 1, 0.2078431, 1,
-0.3073769, -0.2741501, -1.809677, 0, 1, 0.2156863, 1,
-0.3073462, -0.3052097, -4.463615, 0, 1, 0.2196078, 1,
-0.299951, 0.1334184, -1.035918, 0, 1, 0.227451, 1,
-0.2959715, 0.9352251, 0.930182, 0, 1, 0.2313726, 1,
-0.2955597, -0.002414746, -1.614929, 0, 1, 0.2392157, 1,
-0.2955296, 0.5261393, 0.3826791, 0, 1, 0.2431373, 1,
-0.295476, -0.568846, -3.507551, 0, 1, 0.2509804, 1,
-0.2943413, -0.6993042, -2.321661, 0, 1, 0.254902, 1,
-0.283517, 0.8878675, -0.2072708, 0, 1, 0.2627451, 1,
-0.282041, -1.200396, -3.296384, 0, 1, 0.2666667, 1,
-0.2819232, -2.381807, -3.367166, 0, 1, 0.2745098, 1,
-0.2814241, 0.264914, -0.6865025, 0, 1, 0.2784314, 1,
-0.2789533, 1.218642, -0.8764022, 0, 1, 0.2862745, 1,
-0.2766922, -0.2123397, -2.095318, 0, 1, 0.2901961, 1,
-0.2686774, -0.3670354, -2.618888, 0, 1, 0.2980392, 1,
-0.2676761, -1.303581, -3.598994, 0, 1, 0.3058824, 1,
-0.2675499, -0.9815594, -4.601998, 0, 1, 0.3098039, 1,
-0.2660308, 1.527057, 0.5216181, 0, 1, 0.3176471, 1,
-0.2641196, 0.782189, -0.7944654, 0, 1, 0.3215686, 1,
-0.261333, -0.9036468, -2.235317, 0, 1, 0.3294118, 1,
-0.2584007, 1.067881, -0.6914881, 0, 1, 0.3333333, 1,
-0.2572291, 1.367617, 0.1963902, 0, 1, 0.3411765, 1,
-0.2569699, 0.4448599, 0.6430047, 0, 1, 0.345098, 1,
-0.2554241, -0.2226488, -2.422847, 0, 1, 0.3529412, 1,
-0.250735, 0.1634694, -1.728453, 0, 1, 0.3568628, 1,
-0.2498183, 0.06360107, -1.452115, 0, 1, 0.3647059, 1,
-0.2487896, 0.04182876, -1.834409, 0, 1, 0.3686275, 1,
-0.2460667, -1.743913, -3.09466, 0, 1, 0.3764706, 1,
-0.2454213, -0.5781693, -2.135525, 0, 1, 0.3803922, 1,
-0.2431885, 0.908105, -2.013409, 0, 1, 0.3882353, 1,
-0.2415157, -0.03829283, -1.305027, 0, 1, 0.3921569, 1,
-0.2384886, 1.190251, 0.3288132, 0, 1, 0.4, 1,
-0.2354182, 1.30527, 1.185759, 0, 1, 0.4078431, 1,
-0.234919, 0.02250153, -2.027279, 0, 1, 0.4117647, 1,
-0.2340581, -1.709788, -3.485176, 0, 1, 0.4196078, 1,
-0.23347, 2.999117, -1.027368, 0, 1, 0.4235294, 1,
-0.2334243, 1.051703, -0.2137794, 0, 1, 0.4313726, 1,
-0.2300867, 1.050883, -0.8559816, 0, 1, 0.4352941, 1,
-0.2298574, 1.192763, -0.02973362, 0, 1, 0.4431373, 1,
-0.2298558, 0.5150098, -1.723819, 0, 1, 0.4470588, 1,
-0.2290439, -0.1793132, 0.6504493, 0, 1, 0.454902, 1,
-0.2168688, -0.08071989, -1.494215, 0, 1, 0.4588235, 1,
-0.2145274, -0.3783604, -1.816857, 0, 1, 0.4666667, 1,
-0.2141299, -1.201952, -3.683058, 0, 1, 0.4705882, 1,
-0.2140693, 0.2800624, -1.273852, 0, 1, 0.4784314, 1,
-0.2117884, 0.1247425, -0.05003623, 0, 1, 0.4823529, 1,
-0.2087041, 0.4432746, -0.8090421, 0, 1, 0.4901961, 1,
-0.2044574, -1.357889, -4.298528, 0, 1, 0.4941176, 1,
-0.2020726, 0.5999439, -0.7089206, 0, 1, 0.5019608, 1,
-0.1971093, -0.3510807, -2.193907, 0, 1, 0.509804, 1,
-0.1934169, 0.411943, -2.103058, 0, 1, 0.5137255, 1,
-0.192128, 1.118477, -0.9118301, 0, 1, 0.5215687, 1,
-0.1921218, 0.7956084, 0.7326898, 0, 1, 0.5254902, 1,
-0.1913074, 0.674621, 0.08216691, 0, 1, 0.5333334, 1,
-0.1893547, -0.3479945, -3.814689, 0, 1, 0.5372549, 1,
-0.1877181, -0.3628933, -3.729838, 0, 1, 0.5450981, 1,
-0.1832232, -1.230158, -3.00553, 0, 1, 0.5490196, 1,
-0.1811074, 0.2944044, 0.5234969, 0, 1, 0.5568628, 1,
-0.1735783, -0.2837708, -3.113189, 0, 1, 0.5607843, 1,
-0.1704421, 1.968429, 0.3371381, 0, 1, 0.5686275, 1,
-0.1649836, 0.6630177, -1.753533, 0, 1, 0.572549, 1,
-0.1639803, -2.844397, -2.894368, 0, 1, 0.5803922, 1,
-0.1595463, 0.7985372, -0.5461639, 0, 1, 0.5843138, 1,
-0.1581321, 0.3070474, -2.043702, 0, 1, 0.5921569, 1,
-0.1565482, -0.2178095, -1.067875, 0, 1, 0.5960785, 1,
-0.1543826, -1.314088, -0.9152284, 0, 1, 0.6039216, 1,
-0.1489025, -0.9642156, -3.861715, 0, 1, 0.6117647, 1,
-0.1441557, 0.5209737, 0.1091424, 0, 1, 0.6156863, 1,
-0.1382644, -0.08916442, -0.4996667, 0, 1, 0.6235294, 1,
-0.1365738, -0.6707342, -2.675457, 0, 1, 0.627451, 1,
-0.1352506, 0.2542565, -1.044848, 0, 1, 0.6352941, 1,
-0.1334555, 1.351629, 0.1946329, 0, 1, 0.6392157, 1,
-0.1333002, 0.1724032, -0.6369435, 0, 1, 0.6470588, 1,
-0.1319073, 0.1155262, -0.860354, 0, 1, 0.6509804, 1,
-0.1301618, -0.127648, -1.832231, 0, 1, 0.6588235, 1,
-0.1247594, 0.4485369, -0.1310811, 0, 1, 0.6627451, 1,
-0.1217968, 1.853418, 0.4125792, 0, 1, 0.6705883, 1,
-0.116058, -0.7953959, -3.246014, 0, 1, 0.6745098, 1,
-0.1148417, -0.2580055, -2.468863, 0, 1, 0.682353, 1,
-0.1135361, 0.6780993, -0.2926027, 0, 1, 0.6862745, 1,
-0.1133307, -0.663237, -2.298715, 0, 1, 0.6941177, 1,
-0.1131377, 0.2626661, 0.2220394, 0, 1, 0.7019608, 1,
-0.1123507, 1.037219, -0.2964152, 0, 1, 0.7058824, 1,
-0.1108037, 0.3430169, 0.9686849, 0, 1, 0.7137255, 1,
-0.1092218, -0.8470119, -3.177906, 0, 1, 0.7176471, 1,
-0.1080376, 0.5691736, -0.3969142, 0, 1, 0.7254902, 1,
-0.1045999, -0.1361428, 0.1766037, 0, 1, 0.7294118, 1,
-0.104268, -0.7366827, -3.907987, 0, 1, 0.7372549, 1,
-0.09866532, -0.5521531, -2.800155, 0, 1, 0.7411765, 1,
-0.09678512, 0.7856336, -1.353753, 0, 1, 0.7490196, 1,
-0.09396845, -0.5215883, -2.966029, 0, 1, 0.7529412, 1,
-0.09060331, -0.455488, -3.262542, 0, 1, 0.7607843, 1,
-0.0898405, 0.5915849, 1.196139, 0, 1, 0.7647059, 1,
-0.08956953, 1.708434, -1.028702, 0, 1, 0.772549, 1,
-0.08788493, -0.9896985, -3.785298, 0, 1, 0.7764706, 1,
-0.08757322, -0.1993444, -4.43052, 0, 1, 0.7843137, 1,
-0.08725908, 0.6101058, -1.227449, 0, 1, 0.7882353, 1,
-0.08439501, 0.155288, 0.1617709, 0, 1, 0.7960784, 1,
-0.08123218, -0.2487844, -2.955506, 0, 1, 0.8039216, 1,
-0.08073431, 0.1825027, 0.3981571, 0, 1, 0.8078431, 1,
-0.07916503, -0.6890893, -3.276449, 0, 1, 0.8156863, 1,
-0.07788798, -0.09094669, -1.662826, 0, 1, 0.8196079, 1,
-0.0741388, 0.5670904, -0.4163336, 0, 1, 0.827451, 1,
-0.07201891, 0.4694903, -1.251429, 0, 1, 0.8313726, 1,
-0.07136417, -0.3812174, -2.185815, 0, 1, 0.8392157, 1,
-0.06943808, -0.0304823, -2.470753, 0, 1, 0.8431373, 1,
-0.06723358, 1.418414, 0.7436507, 0, 1, 0.8509804, 1,
-0.0657158, 1.238283, -0.2073385, 0, 1, 0.854902, 1,
-0.06153242, -2.369621, -3.797466, 0, 1, 0.8627451, 1,
-0.05652322, 0.3620466, -0.5190906, 0, 1, 0.8666667, 1,
-0.05328491, -1.016228, -3.609331, 0, 1, 0.8745098, 1,
-0.05273274, 0.2243036, 0.6306376, 0, 1, 0.8784314, 1,
-0.0504132, 0.534228, -2.078591, 0, 1, 0.8862745, 1,
-0.04882688, -1.330825, -4.222785, 0, 1, 0.8901961, 1,
-0.04823693, 1.238991, -0.4385632, 0, 1, 0.8980392, 1,
-0.04579016, 1.130223, 0.5306684, 0, 1, 0.9058824, 1,
-0.04327399, -0.4607524, -3.098572, 0, 1, 0.9098039, 1,
-0.04057328, -1.512387, -3.986554, 0, 1, 0.9176471, 1,
-0.04001474, 1.331897, 1.4897, 0, 1, 0.9215686, 1,
-0.03885331, -0.9195193, -1.79973, 0, 1, 0.9294118, 1,
-0.03840532, -1.717647, -2.702585, 0, 1, 0.9333333, 1,
-0.0376226, 0.8787161, 1.569625, 0, 1, 0.9411765, 1,
-0.03601835, 1.783495, -0.8965331, 0, 1, 0.945098, 1,
-0.03252793, -0.7706349, -2.958823, 0, 1, 0.9529412, 1,
-0.02912155, 0.01277019, -1.044155, 0, 1, 0.9568627, 1,
-0.02544153, -1.310133, -3.961268, 0, 1, 0.9647059, 1,
-0.02368462, 1.427204, -0.1612333, 0, 1, 0.9686275, 1,
-0.02346512, -1.217177, -3.534876, 0, 1, 0.9764706, 1,
-0.02288631, -0.2322369, -3.690771, 0, 1, 0.9803922, 1,
-0.02143119, 0.9392609, -1.723791, 0, 1, 0.9882353, 1,
-0.01683009, 1.663494, 1.029887, 0, 1, 0.9921569, 1,
-0.01413688, -0.4992805, -3.966853, 0, 1, 1, 1,
-0.01273547, 1.260562, 0.05817636, 0, 0.9921569, 1, 1,
-0.004727253, -2.138798, -3.604885, 0, 0.9882353, 1, 1,
-0.004217258, 2.066735, 1.562521, 0, 0.9803922, 1, 1,
-0.003701592, -0.6304902, -3.020004, 0, 0.9764706, 1, 1,
-0.0007249931, 0.5994137, -0.5844631, 0, 0.9686275, 1, 1,
-9.772743e-05, -0.1844145, -2.259484, 0, 0.9647059, 1, 1,
0.003477632, 0.9324329, 1.424942, 0, 0.9568627, 1, 1,
0.004376551, 1.011621, 2.509886, 0, 0.9529412, 1, 1,
0.007931298, 0.2127605, 0.4709747, 0, 0.945098, 1, 1,
0.01224077, 1.91706, -0.9292415, 0, 0.9411765, 1, 1,
0.01316711, -1.064109, 3.420542, 0, 0.9333333, 1, 1,
0.01465882, -1.322004, 3.086911, 0, 0.9294118, 1, 1,
0.01541665, 0.5123039, -0.01125644, 0, 0.9215686, 1, 1,
0.01975464, -0.5739042, 1.933903, 0, 0.9176471, 1, 1,
0.02355043, -1.241689, 4.568845, 0, 0.9098039, 1, 1,
0.02367071, 0.1343068, -0.09057786, 0, 0.9058824, 1, 1,
0.02414689, 0.8828755, 2.496596, 0, 0.8980392, 1, 1,
0.02712391, -0.8551405, 1.654549, 0, 0.8901961, 1, 1,
0.02787861, -0.6000449, 3.252925, 0, 0.8862745, 1, 1,
0.03125891, 0.4893878, 0.5115185, 0, 0.8784314, 1, 1,
0.03162952, 1.308927, -2.247189, 0, 0.8745098, 1, 1,
0.03244121, 0.2091007, -0.3545666, 0, 0.8666667, 1, 1,
0.03641336, 1.125416, 0.7929621, 0, 0.8627451, 1, 1,
0.03730099, 0.07654008, 1.568316, 0, 0.854902, 1, 1,
0.03749494, 1.07286, 0.6333618, 0, 0.8509804, 1, 1,
0.03998615, 0.8614253, -0.2881582, 0, 0.8431373, 1, 1,
0.04177026, -1.565277, 4.244845, 0, 0.8392157, 1, 1,
0.04196348, 0.9523315, 1.862234, 0, 0.8313726, 1, 1,
0.04201502, 0.3548848, 1.352174, 0, 0.827451, 1, 1,
0.04402715, -1.791289, 3.309635, 0, 0.8196079, 1, 1,
0.04518631, -2.370193, 3.28953, 0, 0.8156863, 1, 1,
0.05075473, 0.9310429, -1.302448, 0, 0.8078431, 1, 1,
0.05218834, 0.3510404, 0.7333573, 0, 0.8039216, 1, 1,
0.05367934, -1.517967, 2.277527, 0, 0.7960784, 1, 1,
0.05777387, 0.9339692, -0.05548279, 0, 0.7882353, 1, 1,
0.05814069, -0.05741546, 4.21787, 0, 0.7843137, 1, 1,
0.05935661, 0.7625548, 0.7128422, 0, 0.7764706, 1, 1,
0.06049993, 0.03730805, 0.8324543, 0, 0.772549, 1, 1,
0.06486721, 0.3434949, 1.269452, 0, 0.7647059, 1, 1,
0.07806037, -0.04844664, 2.174799, 0, 0.7607843, 1, 1,
0.07893016, -0.09897327, 3.094626, 0, 0.7529412, 1, 1,
0.08105167, 1.008934, -0.2454092, 0, 0.7490196, 1, 1,
0.08311328, 0.7360308, -0.6304173, 0, 0.7411765, 1, 1,
0.08529197, 1.114862, 1.345761, 0, 0.7372549, 1, 1,
0.08891298, 0.3234394, 0.940698, 0, 0.7294118, 1, 1,
0.09787598, 0.06582093, 1.74402, 0, 0.7254902, 1, 1,
0.1010261, 0.6762101, -1.303782, 0, 0.7176471, 1, 1,
0.104863, 0.02871714, -0.5278668, 0, 0.7137255, 1, 1,
0.1089115, -0.04550846, 1.056167, 0, 0.7058824, 1, 1,
0.1101174, -0.2892022, 3.160667, 0, 0.6980392, 1, 1,
0.1121285, -0.7721892, 3.158176, 0, 0.6941177, 1, 1,
0.1128028, -1.09426, 3.764892, 0, 0.6862745, 1, 1,
0.1156064, 0.7781259, -0.8392563, 0, 0.682353, 1, 1,
0.1171094, 0.3663361, 2.01181, 0, 0.6745098, 1, 1,
0.1201473, -0.1398516, 2.659999, 0, 0.6705883, 1, 1,
0.1231734, 1.79548, -0.07525953, 0, 0.6627451, 1, 1,
0.1252484, -0.8226863, 2.560521, 0, 0.6588235, 1, 1,
0.1271276, -0.7953018, 3.853235, 0, 0.6509804, 1, 1,
0.1299922, 0.325819, -0.3101969, 0, 0.6470588, 1, 1,
0.1328824, -0.7656301, 2.527608, 0, 0.6392157, 1, 1,
0.1344063, -0.4021559, 3.170933, 0, 0.6352941, 1, 1,
0.1346854, -1.19336, 2.917205, 0, 0.627451, 1, 1,
0.1352088, -1.322152, 2.551901, 0, 0.6235294, 1, 1,
0.1384575, 0.187351, -0.966489, 0, 0.6156863, 1, 1,
0.1389876, -0.6224267, 4.534827, 0, 0.6117647, 1, 1,
0.1392433, -0.9519059, 1.664974, 0, 0.6039216, 1, 1,
0.1416957, -1.558726, 2.824913, 0, 0.5960785, 1, 1,
0.1431328, -0.4439152, 2.399424, 0, 0.5921569, 1, 1,
0.1438733, -0.05692653, 1.439938, 0, 0.5843138, 1, 1,
0.1447151, 0.7853212, 0.3144532, 0, 0.5803922, 1, 1,
0.1452058, -1.385135, 3.566519, 0, 0.572549, 1, 1,
0.1458579, -0.8253179, 3.576553, 0, 0.5686275, 1, 1,
0.1508941, 0.125804, 0.6283746, 0, 0.5607843, 1, 1,
0.1509777, -0.8625136, 4.48197, 0, 0.5568628, 1, 1,
0.154841, -0.3009236, 2.975987, 0, 0.5490196, 1, 1,
0.155308, -0.1381589, 1.679925, 0, 0.5450981, 1, 1,
0.1591275, 1.098862, 1.826034, 0, 0.5372549, 1, 1,
0.1591714, -0.6240726, 2.936324, 0, 0.5333334, 1, 1,
0.1606539, -0.3489027, 3.248894, 0, 0.5254902, 1, 1,
0.1609153, -0.07540995, 1.54212, 0, 0.5215687, 1, 1,
0.1611778, 0.1063952, 0.5174276, 0, 0.5137255, 1, 1,
0.1612446, 0.672384, -1.687121, 0, 0.509804, 1, 1,
0.1643363, -0.3215675, 2.107346, 0, 0.5019608, 1, 1,
0.1657972, 2.366153, 0.638639, 0, 0.4941176, 1, 1,
0.1664659, 0.6509603, -0.0675002, 0, 0.4901961, 1, 1,
0.1667971, -1.067454, 3.708103, 0, 0.4823529, 1, 1,
0.1682558, -1.46711, 3.340195, 0, 0.4784314, 1, 1,
0.1695477, 1.36043, 0.2193262, 0, 0.4705882, 1, 1,
0.1701464, 0.1638893, 1.784257, 0, 0.4666667, 1, 1,
0.1706718, -0.2067911, 1.572426, 0, 0.4588235, 1, 1,
0.1708165, 2.134179, 0.1030308, 0, 0.454902, 1, 1,
0.1722083, -0.7968487, 2.093257, 0, 0.4470588, 1, 1,
0.1780691, 1.185741, -0.2658666, 0, 0.4431373, 1, 1,
0.181166, 2.606765, 0.3537702, 0, 0.4352941, 1, 1,
0.1880515, 0.3768876, 1.905403, 0, 0.4313726, 1, 1,
0.1882272, -0.01254785, 2.185961, 0, 0.4235294, 1, 1,
0.1896816, -0.7290249, 1.027155, 0, 0.4196078, 1, 1,
0.1922461, -1.061284, 3.247576, 0, 0.4117647, 1, 1,
0.1960035, -0.6793506, 3.204587, 0, 0.4078431, 1, 1,
0.1973014, 0.445981, -0.7333548, 0, 0.4, 1, 1,
0.1997553, -0.6243389, 3.242688, 0, 0.3921569, 1, 1,
0.2064078, -1.386707, 3.767432, 0, 0.3882353, 1, 1,
0.2068246, -1.468721, 2.507525, 0, 0.3803922, 1, 1,
0.2078633, 1.005999, 0.6168559, 0, 0.3764706, 1, 1,
0.210231, -0.05230203, 1.724464, 0, 0.3686275, 1, 1,
0.2186379, -0.09951657, 1.833737, 0, 0.3647059, 1, 1,
0.2208472, -0.3254988, 1.682905, 0, 0.3568628, 1, 1,
0.2215187, 0.7826971, -1.123583, 0, 0.3529412, 1, 1,
0.2228404, -0.3178221, 2.39544, 0, 0.345098, 1, 1,
0.2234606, -1.085857, 3.809726, 0, 0.3411765, 1, 1,
0.2243334, -0.8322999, 2.13563, 0, 0.3333333, 1, 1,
0.2254931, 0.938547, 1.019098, 0, 0.3294118, 1, 1,
0.2300939, 0.6196272, 0.3963157, 0, 0.3215686, 1, 1,
0.2325425, -0.8277286, 2.079887, 0, 0.3176471, 1, 1,
0.2365279, 1.013684, 2.050619, 0, 0.3098039, 1, 1,
0.2391378, -0.1246829, 1.013118, 0, 0.3058824, 1, 1,
0.2421947, 0.1565266, -0.1345204, 0, 0.2980392, 1, 1,
0.2424351, -0.0620726, 0.5014301, 0, 0.2901961, 1, 1,
0.2444355, -0.6300995, 3.254543, 0, 0.2862745, 1, 1,
0.2488308, 1.785543, -0.8118815, 0, 0.2784314, 1, 1,
0.2496514, -0.07688688, 1.078018, 0, 0.2745098, 1, 1,
0.2518612, 0.177822, 1.247421, 0, 0.2666667, 1, 1,
0.2577846, 0.8252825, -1.021327, 0, 0.2627451, 1, 1,
0.2587585, 0.7660573, 1.481913, 0, 0.254902, 1, 1,
0.2664685, -0.138064, 3.0253, 0, 0.2509804, 1, 1,
0.2713288, 0.4099903, 1.804979, 0, 0.2431373, 1, 1,
0.2736645, 1.202921, -1.321497, 0, 0.2392157, 1, 1,
0.2751491, -1.288172, 4.703076, 0, 0.2313726, 1, 1,
0.2780396, 0.6867145, -0.4822748, 0, 0.227451, 1, 1,
0.2793391, -1.403907, 2.506887, 0, 0.2196078, 1, 1,
0.2807947, -0.1514677, 0.5320477, 0, 0.2156863, 1, 1,
0.2846626, 0.7855923, 1.384232, 0, 0.2078431, 1, 1,
0.2869142, -0.938014, 3.970507, 0, 0.2039216, 1, 1,
0.2883621, 0.5354851, 1.672343, 0, 0.1960784, 1, 1,
0.2888419, 1.009548, 0.555954, 0, 0.1882353, 1, 1,
0.2913023, 1.219529, -1.252727, 0, 0.1843137, 1, 1,
0.2986494, -0.08303369, 0.4366497, 0, 0.1764706, 1, 1,
0.2989751, -0.9484859, 0.8560381, 0, 0.172549, 1, 1,
0.299683, -1.131627, 3.070411, 0, 0.1647059, 1, 1,
0.3027237, -0.6798093, 1.892458, 0, 0.1607843, 1, 1,
0.305789, -0.3952577, 4.560584, 0, 0.1529412, 1, 1,
0.3090469, 0.8482164, 0.626547, 0, 0.1490196, 1, 1,
0.3119518, 0.7635309, 0.8401577, 0, 0.1411765, 1, 1,
0.3150206, -0.0719706, 1.312487, 0, 0.1372549, 1, 1,
0.3201097, -0.7801806, 3.390402, 0, 0.1294118, 1, 1,
0.3226175, -1.858425, 3.145236, 0, 0.1254902, 1, 1,
0.3258257, 1.245386, 0.08199922, 0, 0.1176471, 1, 1,
0.3260256, 1.014127, 0.9452784, 0, 0.1137255, 1, 1,
0.3263872, 1.217084, 0.03983994, 0, 0.1058824, 1, 1,
0.3270475, 0.1363207, 1.310828, 0, 0.09803922, 1, 1,
0.3300367, -0.3405628, 3.355468, 0, 0.09411765, 1, 1,
0.335321, -0.2075867, -0.2888784, 0, 0.08627451, 1, 1,
0.3396145, 0.3514374, 1.767009, 0, 0.08235294, 1, 1,
0.3401459, -1.215215, 2.27661, 0, 0.07450981, 1, 1,
0.3423172, 0.2964097, 2.768363, 0, 0.07058824, 1, 1,
0.3456772, 0.2590641, -0.7541228, 0, 0.0627451, 1, 1,
0.3473184, 1.67782, -0.2112158, 0, 0.05882353, 1, 1,
0.3497664, -0.4501005, 5.284877, 0, 0.05098039, 1, 1,
0.3549014, 1.390668, 1.26883, 0, 0.04705882, 1, 1,
0.3571495, 0.04538211, 0.9594055, 0, 0.03921569, 1, 1,
0.3592978, 1.165465, 0.4072332, 0, 0.03529412, 1, 1,
0.3604728, 0.1693328, 0.7756329, 0, 0.02745098, 1, 1,
0.3655394, -1.979521, 3.96499, 0, 0.02352941, 1, 1,
0.366087, -0.1945222, 2.875011, 0, 0.01568628, 1, 1,
0.3668722, -0.03641248, 3.53349, 0, 0.01176471, 1, 1,
0.3677669, -1.598924, 2.920263, 0, 0.003921569, 1, 1,
0.3688313, -0.8868479, 0.1785388, 0.003921569, 0, 1, 1,
0.3701662, 0.9030355, 0.9724379, 0.007843138, 0, 1, 1,
0.3726981, 1.281731, 0.1588031, 0.01568628, 0, 1, 1,
0.373209, -0.6629291, 1.80934, 0.01960784, 0, 1, 1,
0.3778028, -0.9060945, 1.856505, 0.02745098, 0, 1, 1,
0.387809, -0.852381, 3.891592, 0.03137255, 0, 1, 1,
0.3890058, 1.226317, 0.923618, 0.03921569, 0, 1, 1,
0.3896201, 2.494487, 0.3305428, 0.04313726, 0, 1, 1,
0.3907481, -1.404167, 2.890928, 0.05098039, 0, 1, 1,
0.3945947, 0.4721141, 0.207958, 0.05490196, 0, 1, 1,
0.3959592, -0.5796013, 2.844514, 0.0627451, 0, 1, 1,
0.3999804, 0.5167812, 0.5657601, 0.06666667, 0, 1, 1,
0.4002454, 0.1969037, 2.964035, 0.07450981, 0, 1, 1,
0.4020258, 1.115986, 1.17752, 0.07843138, 0, 1, 1,
0.4024668, -0.7997491, 0.7265083, 0.08627451, 0, 1, 1,
0.4133165, 0.2402159, 0.7919551, 0.09019608, 0, 1, 1,
0.4134901, 1.161457, 1.773928, 0.09803922, 0, 1, 1,
0.4140775, -0.2648095, 3.235331, 0.1058824, 0, 1, 1,
0.4145066, -0.6039295, 1.182048, 0.1098039, 0, 1, 1,
0.414941, 0.3853694, 1.851387, 0.1176471, 0, 1, 1,
0.4164963, 1.895291, 1.036427, 0.1215686, 0, 1, 1,
0.4195268, 1.170234, 0.5921031, 0.1294118, 0, 1, 1,
0.4247643, -0.582554, 1.28775, 0.1333333, 0, 1, 1,
0.4268366, -0.2850805, 2.909927, 0.1411765, 0, 1, 1,
0.4315385, -1.298862, 3.463233, 0.145098, 0, 1, 1,
0.4386335, -1.549186, 2.542447, 0.1529412, 0, 1, 1,
0.4419479, -2.131839, 3.453091, 0.1568628, 0, 1, 1,
0.4467294, 0.1121442, 1.4243, 0.1647059, 0, 1, 1,
0.4534885, -0.5324588, 1.847033, 0.1686275, 0, 1, 1,
0.4561522, 0.5042481, -2.386461, 0.1764706, 0, 1, 1,
0.4633104, 0.3095005, 2.890473, 0.1803922, 0, 1, 1,
0.4645632, -2.127421, 2.809432, 0.1882353, 0, 1, 1,
0.4645956, -0.6222228, 3.400798, 0.1921569, 0, 1, 1,
0.4655381, -0.2835693, 3.889703, 0.2, 0, 1, 1,
0.4662425, 0.1847823, 0.08790401, 0.2078431, 0, 1, 1,
0.4673139, 1.37102, 0.205304, 0.2117647, 0, 1, 1,
0.4674881, -0.1916441, 2.945022, 0.2196078, 0, 1, 1,
0.4734611, -0.6770177, 2.139866, 0.2235294, 0, 1, 1,
0.479119, -0.9363558, 2.83234, 0.2313726, 0, 1, 1,
0.4819788, -0.1234933, 3.492192, 0.2352941, 0, 1, 1,
0.484685, 0.5323985, 1.409585, 0.2431373, 0, 1, 1,
0.4868706, -0.1352989, 1.576235, 0.2470588, 0, 1, 1,
0.4896551, -0.1628292, 3.697042, 0.254902, 0, 1, 1,
0.4934289, 1.20539, 0.1800792, 0.2588235, 0, 1, 1,
0.4949994, -0.4846123, 2.833768, 0.2666667, 0, 1, 1,
0.4967123, -1.035175, 2.435263, 0.2705882, 0, 1, 1,
0.5040748, -0.03334864, -0.1129001, 0.2784314, 0, 1, 1,
0.5045629, 0.4219916, 0.7228608, 0.282353, 0, 1, 1,
0.5076899, -0.7275341, 0.3868393, 0.2901961, 0, 1, 1,
0.5174015, 0.3038665, 0.3298487, 0.2941177, 0, 1, 1,
0.5185456, -0.811395, 1.224247, 0.3019608, 0, 1, 1,
0.5210328, -0.5572056, 0.5402233, 0.3098039, 0, 1, 1,
0.5226093, -2.097704, 3.074592, 0.3137255, 0, 1, 1,
0.5295725, -0.60602, 4.141831, 0.3215686, 0, 1, 1,
0.5335822, -0.4792162, 2.214532, 0.3254902, 0, 1, 1,
0.5339077, 2.74655, 0.4004372, 0.3333333, 0, 1, 1,
0.5345879, -0.5578552, 1.977887, 0.3372549, 0, 1, 1,
0.535835, 0.4559977, 0.9115098, 0.345098, 0, 1, 1,
0.5358366, -0.08476968, 1.655286, 0.3490196, 0, 1, 1,
0.5362958, 0.2934, 0.2965438, 0.3568628, 0, 1, 1,
0.5371147, -0.4960096, 3.231023, 0.3607843, 0, 1, 1,
0.5393095, -0.0212565, 1.633998, 0.3686275, 0, 1, 1,
0.5404481, -0.918391, 3.952585, 0.372549, 0, 1, 1,
0.5457909, -0.4020863, 1.672565, 0.3803922, 0, 1, 1,
0.5475905, -1.398481, 3.682214, 0.3843137, 0, 1, 1,
0.5480875, 0.4177299, -0.966387, 0.3921569, 0, 1, 1,
0.5516818, 0.8911234, 0.6694463, 0.3960784, 0, 1, 1,
0.5541903, 0.3105467, 1.651324, 0.4039216, 0, 1, 1,
0.5550748, -0.4918076, 1.703126, 0.4117647, 0, 1, 1,
0.5559652, -0.9679726, 1.874015, 0.4156863, 0, 1, 1,
0.5562426, 0.8595369, -0.4184879, 0.4235294, 0, 1, 1,
0.5568307, -0.9840797, 1.950242, 0.427451, 0, 1, 1,
0.5599009, -1.331753, 2.897438, 0.4352941, 0, 1, 1,
0.5619314, 0.0786727, 1.611394, 0.4392157, 0, 1, 1,
0.564293, -0.05469499, 0.3130517, 0.4470588, 0, 1, 1,
0.5644922, -1.070227, 2.429477, 0.4509804, 0, 1, 1,
0.5660267, -0.5547727, 3.835925, 0.4588235, 0, 1, 1,
0.5705746, -0.7234386, 0.8668724, 0.4627451, 0, 1, 1,
0.5821814, 0.4164284, 0.285608, 0.4705882, 0, 1, 1,
0.5868043, -0.6522139, 2.493504, 0.4745098, 0, 1, 1,
0.5889774, 0.3234566, 0.4701813, 0.4823529, 0, 1, 1,
0.6029973, 0.5153621, 0.8719798, 0.4862745, 0, 1, 1,
0.6089095, -1.04435, 4.157277, 0.4941176, 0, 1, 1,
0.6125684, -0.6965735, 2.258642, 0.5019608, 0, 1, 1,
0.6200263, -1.600562, 2.366699, 0.5058824, 0, 1, 1,
0.6202406, 1.854896, 1.425983, 0.5137255, 0, 1, 1,
0.620712, -1.154184, 0.2125956, 0.5176471, 0, 1, 1,
0.6258151, 0.1494115, 3.323134, 0.5254902, 0, 1, 1,
0.6332307, -0.6515906, 2.006465, 0.5294118, 0, 1, 1,
0.6339441, -0.7656699, -0.1775713, 0.5372549, 0, 1, 1,
0.6369287, 0.3091601, 0.4767149, 0.5411765, 0, 1, 1,
0.6392811, 1.209198, 1.601472, 0.5490196, 0, 1, 1,
0.6454282, -0.4641986, 2.104363, 0.5529412, 0, 1, 1,
0.6484275, -0.3938582, 2.878652, 0.5607843, 0, 1, 1,
0.6490641, -1.639992, 3.497691, 0.5647059, 0, 1, 1,
0.6541228, -1.198619, 3.248877, 0.572549, 0, 1, 1,
0.6548228, 0.4723334, -1.556221, 0.5764706, 0, 1, 1,
0.6555718, -1.825943, 2.262298, 0.5843138, 0, 1, 1,
0.6574884, -1.84569, 2.506319, 0.5882353, 0, 1, 1,
0.6608767, -0.2817052, 4.057775, 0.5960785, 0, 1, 1,
0.6644082, -1.855493, 1.500286, 0.6039216, 0, 1, 1,
0.6653863, -1.561595, 1.621861, 0.6078432, 0, 1, 1,
0.6664527, 0.1579913, 0.4720161, 0.6156863, 0, 1, 1,
0.6667183, 1.078335, -0.8309519, 0.6196079, 0, 1, 1,
0.6675754, 0.07320483, 2.075135, 0.627451, 0, 1, 1,
0.6720142, 0.2497232, 2.254068, 0.6313726, 0, 1, 1,
0.6734545, 1.080594, -0.2491366, 0.6392157, 0, 1, 1,
0.6739821, -0.8000712, 3.341684, 0.6431373, 0, 1, 1,
0.6783916, 0.3094185, -0.4033551, 0.6509804, 0, 1, 1,
0.6855541, 1.934428, 0.2807936, 0.654902, 0, 1, 1,
0.692423, 0.1231825, 1.526446, 0.6627451, 0, 1, 1,
0.6942612, -0.1493855, 2.386668, 0.6666667, 0, 1, 1,
0.7032552, 0.4708775, 1.752512, 0.6745098, 0, 1, 1,
0.7055189, -0.5165495, 2.477495, 0.6784314, 0, 1, 1,
0.7073359, 0.2677549, 2.439964, 0.6862745, 0, 1, 1,
0.7076519, 0.2502213, 1.360385, 0.6901961, 0, 1, 1,
0.709729, -2.455665, 1.324154, 0.6980392, 0, 1, 1,
0.7114588, -0.246012, 1.526759, 0.7058824, 0, 1, 1,
0.7114714, -1.084443, 4.299444, 0.7098039, 0, 1, 1,
0.7124518, -0.1901758, 0.8826023, 0.7176471, 0, 1, 1,
0.7176976, 2.118982, -0.5699145, 0.7215686, 0, 1, 1,
0.7204497, -2.096769, 2.755538, 0.7294118, 0, 1, 1,
0.7222363, -1.662307, 3.261813, 0.7333333, 0, 1, 1,
0.7270279, -0.3809401, 2.762633, 0.7411765, 0, 1, 1,
0.730454, 0.2842699, 1.026282, 0.7450981, 0, 1, 1,
0.7330094, 0.9474998, 2.258353, 0.7529412, 0, 1, 1,
0.7342505, -0.4157809, 2.591333, 0.7568628, 0, 1, 1,
0.735604, 0.3551417, 2.891539, 0.7647059, 0, 1, 1,
0.7374805, 0.7303901, 0.6792156, 0.7686275, 0, 1, 1,
0.7395026, 0.02514074, 0.03116863, 0.7764706, 0, 1, 1,
0.7430706, -0.2152563, 0.5969419, 0.7803922, 0, 1, 1,
0.7466168, -1.750191, 4.052247, 0.7882353, 0, 1, 1,
0.7487667, 0.2205153, 0.9864552, 0.7921569, 0, 1, 1,
0.7546969, 0.07219148, 3.0217, 0.8, 0, 1, 1,
0.7566537, -1.955738, 3.161751, 0.8078431, 0, 1, 1,
0.7618745, 1.186521, 0.8134308, 0.8117647, 0, 1, 1,
0.7628957, -0.4910456, 3.454549, 0.8196079, 0, 1, 1,
0.7659565, -0.4892244, 1.910183, 0.8235294, 0, 1, 1,
0.7714731, -0.4145348, 2.159372, 0.8313726, 0, 1, 1,
0.7743342, -3.021186, 1.519467, 0.8352941, 0, 1, 1,
0.7795613, -0.3069077, 3.335392, 0.8431373, 0, 1, 1,
0.7814297, 0.0678464, -0.04052281, 0.8470588, 0, 1, 1,
0.7851601, -0.2385503, 0.9288158, 0.854902, 0, 1, 1,
0.7871758, -2.746589, 3.227713, 0.8588235, 0, 1, 1,
0.7921097, -0.4105546, 1.065361, 0.8666667, 0, 1, 1,
0.7981107, 0.01663233, 1.824829, 0.8705882, 0, 1, 1,
0.8074142, -0.102756, 2.662328, 0.8784314, 0, 1, 1,
0.8087263, 0.6426474, 2.102046, 0.8823529, 0, 1, 1,
0.8145833, -0.1371651, 1.917304, 0.8901961, 0, 1, 1,
0.8165208, 0.6789972, 1.001311, 0.8941177, 0, 1, 1,
0.8242561, -0.05975793, 2.013742, 0.9019608, 0, 1, 1,
0.826272, 0.1548102, 0.5996476, 0.9098039, 0, 1, 1,
0.8302787, -0.8797671, 1.54873, 0.9137255, 0, 1, 1,
0.8304835, 0.9355963, -0.2265264, 0.9215686, 0, 1, 1,
0.8344344, 0.6437852, 0.1505146, 0.9254902, 0, 1, 1,
0.8356003, -0.719324, 2.678832, 0.9333333, 0, 1, 1,
0.8415384, 1.742921, -0.1783393, 0.9372549, 0, 1, 1,
0.8465007, 0.8123393, -0.06705344, 0.945098, 0, 1, 1,
0.8577537, 1.156762, 1.187649, 0.9490196, 0, 1, 1,
0.8605589, 0.580346, 1.379041, 0.9568627, 0, 1, 1,
0.8605843, 0.3600865, 1.270502, 0.9607843, 0, 1, 1,
0.8608091, -0.4998239, 3.346748, 0.9686275, 0, 1, 1,
0.8644963, 0.4960688, -0.4738061, 0.972549, 0, 1, 1,
0.8773179, -0.3692031, 0.763126, 0.9803922, 0, 1, 1,
0.8828511, 1.093454, 0.7672548, 0.9843137, 0, 1, 1,
0.8912664, 1.340085, -0.8464814, 0.9921569, 0, 1, 1,
0.8941855, -0.5024546, 2.36279, 0.9960784, 0, 1, 1,
0.8946477, 0.5040574, 2.898275, 1, 0, 0.9960784, 1,
0.9005466, 0.3934328, 2.725634, 1, 0, 0.9882353, 1,
0.9006314, -0.551285, 2.519999, 1, 0, 0.9843137, 1,
0.9022015, 2.018348, 1.117332, 1, 0, 0.9764706, 1,
0.9033267, -0.3563763, 1.17249, 1, 0, 0.972549, 1,
0.9094558, 0.09600598, 2.646766, 1, 0, 0.9647059, 1,
0.9133765, -0.3263129, 5.666106, 1, 0, 0.9607843, 1,
0.9156337, 1.815013, -0.5331194, 1, 0, 0.9529412, 1,
0.9335059, 1.224409, 3.326607, 1, 0, 0.9490196, 1,
0.935041, -0.05224082, 2.947557, 1, 0, 0.9411765, 1,
0.9359059, 0.5047049, -0.5499554, 1, 0, 0.9372549, 1,
0.9376764, 1.425893, 1.069566, 1, 0, 0.9294118, 1,
0.9476337, 1.075673, 0.637067, 1, 0, 0.9254902, 1,
0.986561, -0.09973949, 1.865603, 1, 0, 0.9176471, 1,
0.9878523, 0.1521772, 0.7100057, 1, 0, 0.9137255, 1,
1.001507, -0.3057276, 2.448329, 1, 0, 0.9058824, 1,
1.001674, -0.9667903, 2.3197, 1, 0, 0.9019608, 1,
1.005413, 0.6907763, 0.9872286, 1, 0, 0.8941177, 1,
1.008234, -0.839893, 2.638309, 1, 0, 0.8862745, 1,
1.008406, -0.1477913, 0.668431, 1, 0, 0.8823529, 1,
1.014551, 0.2927745, 0.3680143, 1, 0, 0.8745098, 1,
1.033934, 0.8957879, 2.181084, 1, 0, 0.8705882, 1,
1.034252, -1.898126, 2.122567, 1, 0, 0.8627451, 1,
1.037294, 0.5852131, 1.767882, 1, 0, 0.8588235, 1,
1.0431, -0.2424418, 3.442029, 1, 0, 0.8509804, 1,
1.048738, -1.241798, 2.011721, 1, 0, 0.8470588, 1,
1.053471, -0.6382975, 3.368322, 1, 0, 0.8392157, 1,
1.060947, -0.2652135, 1.013865, 1, 0, 0.8352941, 1,
1.064221, -0.1153316, 2.699795, 1, 0, 0.827451, 1,
1.065526, 1.048239, -0.8780699, 1, 0, 0.8235294, 1,
1.082337, 0.01999869, 3.295052, 1, 0, 0.8156863, 1,
1.107811, -2.714907, 3.808016, 1, 0, 0.8117647, 1,
1.111439, 1.403193, 0.5967324, 1, 0, 0.8039216, 1,
1.112645, -0.2534447, 2.222493, 1, 0, 0.7960784, 1,
1.113965, 2.316073, -0.932153, 1, 0, 0.7921569, 1,
1.117783, 0.459943, -0.2748151, 1, 0, 0.7843137, 1,
1.124004, 0.115041, -1.324873, 1, 0, 0.7803922, 1,
1.1242, -0.6536059, 1.885711, 1, 0, 0.772549, 1,
1.124336, -1.417513, 4.031846, 1, 0, 0.7686275, 1,
1.126194, -0.005837569, 1.242946, 1, 0, 0.7607843, 1,
1.128496, 2.308971, 0.8270874, 1, 0, 0.7568628, 1,
1.133032, 0.2376626, 0.8224573, 1, 0, 0.7490196, 1,
1.136016, -0.140727, 0.3103255, 1, 0, 0.7450981, 1,
1.148088, -0.8967081, 2.135066, 1, 0, 0.7372549, 1,
1.150441, -0.1759817, 0.8293756, 1, 0, 0.7333333, 1,
1.154159, 0.9898987, 2.223456, 1, 0, 0.7254902, 1,
1.162796, -1.775234, 2.490151, 1, 0, 0.7215686, 1,
1.163732, 1.769915, -0.1506315, 1, 0, 0.7137255, 1,
1.184549, 0.967259, 0.4455297, 1, 0, 0.7098039, 1,
1.185766, -0.6091235, 1.830598, 1, 0, 0.7019608, 1,
1.191432, -1.591637, 3.155316, 1, 0, 0.6941177, 1,
1.194892, -0.6536703, 4.10923, 1, 0, 0.6901961, 1,
1.197614, -1.667827, 1.676359, 1, 0, 0.682353, 1,
1.201864, -0.2430155, 0.4722585, 1, 0, 0.6784314, 1,
1.204192, -1.202319, 1.102468, 1, 0, 0.6705883, 1,
1.204345, -1.019762, 2.337246, 1, 0, 0.6666667, 1,
1.210555, 1.77231, 1.069449, 1, 0, 0.6588235, 1,
1.210712, -0.4324299, 2.169988, 1, 0, 0.654902, 1,
1.215564, 0.009246754, 0.3152319, 1, 0, 0.6470588, 1,
1.226559, 0.5369586, -0.01241768, 1, 0, 0.6431373, 1,
1.228206, -1.195069, 3.726214, 1, 0, 0.6352941, 1,
1.23905, 1.525773, 2.73318, 1, 0, 0.6313726, 1,
1.242945, 0.527428, 1.140781, 1, 0, 0.6235294, 1,
1.243459, 0.309259, 3.632208, 1, 0, 0.6196079, 1,
1.245619, -2.256507, 2.996058, 1, 0, 0.6117647, 1,
1.2462, 2.57817, 0.03686166, 1, 0, 0.6078432, 1,
1.2474, 1.65389, -1.038887, 1, 0, 0.6, 1,
1.256032, -0.9965684, 1.087018, 1, 0, 0.5921569, 1,
1.256478, 1.093113, 0.01486783, 1, 0, 0.5882353, 1,
1.263368, 0.9100677, 0.9176487, 1, 0, 0.5803922, 1,
1.266199, 1.027915, 0.02664477, 1, 0, 0.5764706, 1,
1.267391, 0.7385448, 1.711343, 1, 0, 0.5686275, 1,
1.273789, -0.3985755, 2.811723, 1, 0, 0.5647059, 1,
1.285205, 0.6617512, 2.257851, 1, 0, 0.5568628, 1,
1.287839, 1.206018, 0.4445156, 1, 0, 0.5529412, 1,
1.312565, 1.057911, 2.596164, 1, 0, 0.5450981, 1,
1.313665, 0.3335764, 1.165578, 1, 0, 0.5411765, 1,
1.317774, -0.5885466, 2.258409, 1, 0, 0.5333334, 1,
1.32072, 1.071966, 2.180187, 1, 0, 0.5294118, 1,
1.339897, -0.5118921, 2.136607, 1, 0, 0.5215687, 1,
1.342257, -0.6134323, 2.80969, 1, 0, 0.5176471, 1,
1.350538, -1.944816, 0.2530445, 1, 0, 0.509804, 1,
1.357837, -0.2997, 1.062124, 1, 0, 0.5058824, 1,
1.363647, -0.6156809, 2.346844, 1, 0, 0.4980392, 1,
1.36487, -0.3068169, 2.740494, 1, 0, 0.4901961, 1,
1.379031, -0.3819914, 1.377149, 1, 0, 0.4862745, 1,
1.383461, -0.05157188, 2.96625, 1, 0, 0.4784314, 1,
1.389697, -0.7405316, 1.476585, 1, 0, 0.4745098, 1,
1.392206, -0.3557544, 0.835282, 1, 0, 0.4666667, 1,
1.395361, -0.1047969, 3.032384, 1, 0, 0.4627451, 1,
1.403256, -1.911274, 4.046542, 1, 0, 0.454902, 1,
1.405062, 1.959133, 1.739085, 1, 0, 0.4509804, 1,
1.416535, -0.5037733, 1.886468, 1, 0, 0.4431373, 1,
1.423742, -0.2463465, 0.783422, 1, 0, 0.4392157, 1,
1.426708, -1.177871, 1.015608, 1, 0, 0.4313726, 1,
1.431493, -1.256879, 2.734826, 1, 0, 0.427451, 1,
1.438957, 0.06223714, 1.964633, 1, 0, 0.4196078, 1,
1.442907, -0.5673552, 2.642393, 1, 0, 0.4156863, 1,
1.459117, -0.8817533, 1.218173, 1, 0, 0.4078431, 1,
1.460153, -2.273267, 3.576007, 1, 0, 0.4039216, 1,
1.46953, -0.03739861, 0.3291109, 1, 0, 0.3960784, 1,
1.47905, 0.9129351, -0.4341239, 1, 0, 0.3882353, 1,
1.481794, -1.47556, 3.08808, 1, 0, 0.3843137, 1,
1.499765, 0.7396298, 1.82917, 1, 0, 0.3764706, 1,
1.504796, 1.827688, -0.2389918, 1, 0, 0.372549, 1,
1.511207, -1.953681, 1.457797, 1, 0, 0.3647059, 1,
1.519093, 0.4509507, -1.826142, 1, 0, 0.3607843, 1,
1.531688, -1.291779, 4.09292, 1, 0, 0.3529412, 1,
1.537897, 0.8748741, 0.7397588, 1, 0, 0.3490196, 1,
1.544416, 1.232629, -0.2359735, 1, 0, 0.3411765, 1,
1.546266, -0.2734512, 1.266682, 1, 0, 0.3372549, 1,
1.552508, -0.1535333, -0.8670093, 1, 0, 0.3294118, 1,
1.553042, 0.0167633, 2.595251, 1, 0, 0.3254902, 1,
1.553431, 0.8957315, 1.965104, 1, 0, 0.3176471, 1,
1.55542, 0.4002414, 1.287173, 1, 0, 0.3137255, 1,
1.555459, -0.000731727, 1.655242, 1, 0, 0.3058824, 1,
1.56307, -0.3515854, 1.317101, 1, 0, 0.2980392, 1,
1.563344, -1.037934, 1.04496, 1, 0, 0.2941177, 1,
1.574964, -0.2208134, 1.620051, 1, 0, 0.2862745, 1,
1.579978, 0.9615099, 1.182335, 1, 0, 0.282353, 1,
1.580173, 0.3303463, 0.685239, 1, 0, 0.2745098, 1,
1.583408, 1.135784, 1.879847, 1, 0, 0.2705882, 1,
1.611644, 1.568319, 1.14286, 1, 0, 0.2627451, 1,
1.618437, -2.100317, 1.387895, 1, 0, 0.2588235, 1,
1.640667, 0.3548445, 0.6361907, 1, 0, 0.2509804, 1,
1.664068, -0.2863243, 1.796005, 1, 0, 0.2470588, 1,
1.665717, 0.4845169, 1.00836, 1, 0, 0.2392157, 1,
1.674722, 0.2641913, 1.7216, 1, 0, 0.2352941, 1,
1.675376, 0.3474331, 1.960911, 1, 0, 0.227451, 1,
1.680364, -2.816689, 2.512786, 1, 0, 0.2235294, 1,
1.695847, -0.5033706, 0.7953094, 1, 0, 0.2156863, 1,
1.715525, -0.5335198, 1.524559, 1, 0, 0.2117647, 1,
1.720832, -0.8006844, 0.1045256, 1, 0, 0.2039216, 1,
1.722154, 0.4602574, -0.2842091, 1, 0, 0.1960784, 1,
1.726645, 1.448133, -0.8278675, 1, 0, 0.1921569, 1,
1.731922, -1.266663, 0.8314774, 1, 0, 0.1843137, 1,
1.769924, -0.009696274, 1.18579, 1, 0, 0.1803922, 1,
1.784913, -1.031612, -0.1161903, 1, 0, 0.172549, 1,
1.791653, -0.5469655, 2.741571, 1, 0, 0.1686275, 1,
1.798065, 1.193981, 1.663478, 1, 0, 0.1607843, 1,
1.838895, -0.5693957, 2.332098, 1, 0, 0.1568628, 1,
1.905144, -1.533567, 3.408977, 1, 0, 0.1490196, 1,
1.908097, -1.217266, 3.116632, 1, 0, 0.145098, 1,
1.991114, -1.589346, 1.451283, 1, 0, 0.1372549, 1,
1.994227, 0.3918331, 2.255527, 1, 0, 0.1333333, 1,
1.996768, 2.102427, 0.6044681, 1, 0, 0.1254902, 1,
2.004456, -0.6463666, 1.383064, 1, 0, 0.1215686, 1,
2.034063, 0.8637955, -0.3680713, 1, 0, 0.1137255, 1,
2.035755, 0.2036008, 1.908752, 1, 0, 0.1098039, 1,
2.073484, -0.7368416, 0.7059857, 1, 0, 0.1019608, 1,
2.087763, 0.02878874, 2.384299, 1, 0, 0.09411765, 1,
2.092466, -0.252566, 2.082162, 1, 0, 0.09019608, 1,
2.138021, 0.2769681, 1.57214, 1, 0, 0.08235294, 1,
2.143455, 0.1594045, 2.319903, 1, 0, 0.07843138, 1,
2.182809, -0.1493351, 1.59538, 1, 0, 0.07058824, 1,
2.193694, -2.017898, 3.444412, 1, 0, 0.06666667, 1,
2.194644, -0.2678999, 2.916732, 1, 0, 0.05882353, 1,
2.197919, -0.7771641, 1.383895, 1, 0, 0.05490196, 1,
2.248159, -0.3294105, 0.7669356, 1, 0, 0.04705882, 1,
2.255762, -1.417168, 1.759258, 1, 0, 0.04313726, 1,
2.259904, 1.163671, 1.863238, 1, 0, 0.03529412, 1,
2.268483, 0.6175441, 2.022493, 1, 0, 0.03137255, 1,
2.388706, 0.3568336, 3.079138, 1, 0, 0.02352941, 1,
2.692337, -1.34095, 1.866834, 1, 0, 0.01960784, 1,
2.723364, -0.4923849, 2.446703, 1, 0, 0.01176471, 1,
2.815952, -0.4632008, 1.330586, 1, 0, 0.007843138, 1
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
-0.02034831, -5.662138, -6.756382, 0, -0.5, 0.5, 0.5,
-0.02034831, -5.662138, -6.756382, 1, -0.5, 0.5, 0.5,
-0.02034831, -5.662138, -6.756382, 1, 1.5, 0.5, 0.5,
-0.02034831, -5.662138, -6.756382, 0, 1.5, 0.5, 0.5
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
-3.818154, -0.4958519, -6.756382, 0, -0.5, 0.5, 0.5,
-3.818154, -0.4958519, -6.756382, 1, -0.5, 0.5, 0.5,
-3.818154, -0.4958519, -6.756382, 1, 1.5, 0.5, 0.5,
-3.818154, -0.4958519, -6.756382, 0, 1.5, 0.5, 0.5
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
-3.818154, -5.662138, 0.3550808, 0, -0.5, 0.5, 0.5,
-3.818154, -5.662138, 0.3550808, 1, -0.5, 0.5, 0.5,
-3.818154, -5.662138, 0.3550808, 1, 1.5, 0.5, 0.5,
-3.818154, -5.662138, 0.3550808, 0, 1.5, 0.5, 0.5
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
-2, -4.469918, -5.115275,
2, -4.469918, -5.115275,
-2, -4.469918, -5.115275,
-2, -4.668621, -5.388793,
-1, -4.469918, -5.115275,
-1, -4.668621, -5.388793,
0, -4.469918, -5.115275,
0, -4.668621, -5.388793,
1, -4.469918, -5.115275,
1, -4.668621, -5.388793,
2, -4.469918, -5.115275,
2, -4.668621, -5.388793
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
-2, -5.066028, -5.935828, 0, -0.5, 0.5, 0.5,
-2, -5.066028, -5.935828, 1, -0.5, 0.5, 0.5,
-2, -5.066028, -5.935828, 1, 1.5, 0.5, 0.5,
-2, -5.066028, -5.935828, 0, 1.5, 0.5, 0.5,
-1, -5.066028, -5.935828, 0, -0.5, 0.5, 0.5,
-1, -5.066028, -5.935828, 1, -0.5, 0.5, 0.5,
-1, -5.066028, -5.935828, 1, 1.5, 0.5, 0.5,
-1, -5.066028, -5.935828, 0, 1.5, 0.5, 0.5,
0, -5.066028, -5.935828, 0, -0.5, 0.5, 0.5,
0, -5.066028, -5.935828, 1, -0.5, 0.5, 0.5,
0, -5.066028, -5.935828, 1, 1.5, 0.5, 0.5,
0, -5.066028, -5.935828, 0, 1.5, 0.5, 0.5,
1, -5.066028, -5.935828, 0, -0.5, 0.5, 0.5,
1, -5.066028, -5.935828, 1, -0.5, 0.5, 0.5,
1, -5.066028, -5.935828, 1, 1.5, 0.5, 0.5,
1, -5.066028, -5.935828, 0, 1.5, 0.5, 0.5,
2, -5.066028, -5.935828, 0, -0.5, 0.5, 0.5,
2, -5.066028, -5.935828, 1, -0.5, 0.5, 0.5,
2, -5.066028, -5.935828, 1, 1.5, 0.5, 0.5,
2, -5.066028, -5.935828, 0, 1.5, 0.5, 0.5
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
-2.941737, -4, -5.115275,
-2.941737, 2, -5.115275,
-2.941737, -4, -5.115275,
-3.087807, -4, -5.388793,
-2.941737, -2, -5.115275,
-3.087807, -2, -5.388793,
-2.941737, 0, -5.115275,
-3.087807, 0, -5.388793,
-2.941737, 2, -5.115275,
-3.087807, 2, -5.388793
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
"-4",
"-2",
"0",
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
-3.379946, -4, -5.935828, 0, -0.5, 0.5, 0.5,
-3.379946, -4, -5.935828, 1, -0.5, 0.5, 0.5,
-3.379946, -4, -5.935828, 1, 1.5, 0.5, 0.5,
-3.379946, -4, -5.935828, 0, 1.5, 0.5, 0.5,
-3.379946, -2, -5.935828, 0, -0.5, 0.5, 0.5,
-3.379946, -2, -5.935828, 1, -0.5, 0.5, 0.5,
-3.379946, -2, -5.935828, 1, 1.5, 0.5, 0.5,
-3.379946, -2, -5.935828, 0, 1.5, 0.5, 0.5,
-3.379946, 0, -5.935828, 0, -0.5, 0.5, 0.5,
-3.379946, 0, -5.935828, 1, -0.5, 0.5, 0.5,
-3.379946, 0, -5.935828, 1, 1.5, 0.5, 0.5,
-3.379946, 0, -5.935828, 0, 1.5, 0.5, 0.5,
-3.379946, 2, -5.935828, 0, -0.5, 0.5, 0.5,
-3.379946, 2, -5.935828, 1, -0.5, 0.5, 0.5,
-3.379946, 2, -5.935828, 1, 1.5, 0.5, 0.5,
-3.379946, 2, -5.935828, 0, 1.5, 0.5, 0.5
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
-2.941737, -4.469918, -4,
-2.941737, -4.469918, 4,
-2.941737, -4.469918, -4,
-3.087807, -4.668621, -4,
-2.941737, -4.469918, -2,
-3.087807, -4.668621, -2,
-2.941737, -4.469918, 0,
-3.087807, -4.668621, 0,
-2.941737, -4.469918, 2,
-3.087807, -4.668621, 2,
-2.941737, -4.469918, 4,
-3.087807, -4.668621, 4
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
-3.379946, -5.066028, -4, 0, -0.5, 0.5, 0.5,
-3.379946, -5.066028, -4, 1, -0.5, 0.5, 0.5,
-3.379946, -5.066028, -4, 1, 1.5, 0.5, 0.5,
-3.379946, -5.066028, -4, 0, 1.5, 0.5, 0.5,
-3.379946, -5.066028, -2, 0, -0.5, 0.5, 0.5,
-3.379946, -5.066028, -2, 1, -0.5, 0.5, 0.5,
-3.379946, -5.066028, -2, 1, 1.5, 0.5, 0.5,
-3.379946, -5.066028, -2, 0, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 0, 0, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 0, 1, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 0, 1, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 0, 0, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 2, 0, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 2, 1, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 2, 1, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 2, 0, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 4, 0, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 4, 1, -0.5, 0.5, 0.5,
-3.379946, -5.066028, 4, 1, 1.5, 0.5, 0.5,
-3.379946, -5.066028, 4, 0, 1.5, 0.5, 0.5
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
-2.941737, -4.469918, -5.115275,
-2.941737, 3.478214, -5.115275,
-2.941737, -4.469918, 5.825437,
-2.941737, 3.478214, 5.825437,
-2.941737, -4.469918, -5.115275,
-2.941737, -4.469918, 5.825437,
-2.941737, 3.478214, -5.115275,
-2.941737, 3.478214, 5.825437,
-2.941737, -4.469918, -5.115275,
2.901041, -4.469918, -5.115275,
-2.941737, -4.469918, 5.825437,
2.901041, -4.469918, 5.825437,
-2.941737, 3.478214, -5.115275,
2.901041, 3.478214, -5.115275,
-2.941737, 3.478214, 5.825437,
2.901041, 3.478214, 5.825437,
2.901041, -4.469918, -5.115275,
2.901041, 3.478214, -5.115275,
2.901041, -4.469918, 5.825437,
2.901041, 3.478214, 5.825437,
2.901041, -4.469918, -5.115275,
2.901041, -4.469918, 5.825437,
2.901041, 3.478214, -5.115275,
2.901041, 3.478214, 5.825437
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
var radius = 7.866207;
var distance = 34.99764;
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
mvMatrix.translate( 0.02034831, 0.4958519, -0.3550808 );
mvMatrix.scale( 1.45566, 1.070075, 0.7773806 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99764);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
5-benzyl-3-furylmeth<-read.table("5-benzyl-3-furylmeth.xyz")
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
-2.856648, -0.06258579, -0.4994463, 0, 0, 1, 1, 1,
-2.811079, 0.6559834, 0.1325428, 1, 0, 0, 1, 1,
-2.776716, 1.379972, -1.763478, 1, 0, 0, 1, 1,
-2.638814, -1.499351, -3.38547, 1, 0, 0, 1, 1,
-2.608358, 0.2202135, -0.2530857, 1, 0, 0, 1, 1,
-2.603074, -2.135714, -1.541586, 1, 0, 0, 1, 1,
-2.420737, 1.840713, -2.265104, 0, 0, 0, 1, 1,
-2.390907, -0.0655759, -2.553932, 0, 0, 0, 1, 1,
-2.385698, -1.803378, -0.7874593, 0, 0, 0, 1, 1,
-2.347688, -0.008270297, -2.589514, 0, 0, 0, 1, 1,
-2.312631, -1.726291, 0.06734253, 0, 0, 0, 1, 1,
-2.309238, -1.828846, -1.939722, 0, 0, 0, 1, 1,
-2.273767, -0.6461938, -1.698703, 0, 0, 0, 1, 1,
-2.248556, 3.281516, 0.1184663, 1, 1, 1, 1, 1,
-2.241961, 0.1090491, -0.855773, 1, 1, 1, 1, 1,
-2.22318, -0.4507002, -0.9563133, 1, 1, 1, 1, 1,
-2.195947, -1.084873, -1.60099, 1, 1, 1, 1, 1,
-2.147296, 0.9671989, -0.1366255, 1, 1, 1, 1, 1,
-2.085048, -0.1218873, -1.308453, 1, 1, 1, 1, 1,
-2.041776, -0.860265, -2.73472, 1, 1, 1, 1, 1,
-2.040059, 1.4671, -2.343035, 1, 1, 1, 1, 1,
-2.022544, -0.5174968, -3.208226, 1, 1, 1, 1, 1,
-1.986733, -0.7783562, -2.337551, 1, 1, 1, 1, 1,
-1.968977, -0.9378681, -1.910444, 1, 1, 1, 1, 1,
-1.966334, -2.778102, -2.770036, 1, 1, 1, 1, 1,
-1.89256, 0.6523311, -0.1138094, 1, 1, 1, 1, 1,
-1.88569, 0.8390339, -1.947505, 1, 1, 1, 1, 1,
-1.865291, -2.235065, -3.150811, 1, 1, 1, 1, 1,
-1.861778, 1.276425, 0.9095672, 0, 0, 1, 1, 1,
-1.853684, -0.5096915, -2.731224, 1, 0, 0, 1, 1,
-1.852564, -0.8512061, -2.528257, 1, 0, 0, 1, 1,
-1.843398, -0.4900015, -1.307238, 1, 0, 0, 1, 1,
-1.824181, 0.3007318, -0.4926949, 1, 0, 0, 1, 1,
-1.812813, -0.2734621, -2.32571, 1, 0, 0, 1, 1,
-1.795618, -1.08362, -1.3129, 0, 0, 0, 1, 1,
-1.787502, 1.946771, -0.7302204, 0, 0, 0, 1, 1,
-1.781322, -0.5242375, -0.3529041, 0, 0, 0, 1, 1,
-1.779679, -0.7403399, -2.267724, 0, 0, 0, 1, 1,
-1.765271, 1.7561, -0.683836, 0, 0, 0, 1, 1,
-1.755434, 1.606229, -0.5328511, 0, 0, 0, 1, 1,
-1.747413, -0.2520881, -1.007168, 0, 0, 0, 1, 1,
-1.746009, -0.1482105, -1.968153, 1, 1, 1, 1, 1,
-1.729923, 1.534858, 0.09350368, 1, 1, 1, 1, 1,
-1.729832, 0.5194567, -0.9832001, 1, 1, 1, 1, 1,
-1.726923, 0.3966318, -2.123694, 1, 1, 1, 1, 1,
-1.719358, -0.1115314, -0.5720983, 1, 1, 1, 1, 1,
-1.710586, -0.7281338, -1.402134, 1, 1, 1, 1, 1,
-1.708611, 0.2112451, -1.800669, 1, 1, 1, 1, 1,
-1.696983, -0.508997, -1.079601, 1, 1, 1, 1, 1,
-1.674011, -0.2218098, -1.948602, 1, 1, 1, 1, 1,
-1.668718, -0.4092407, -0.2855017, 1, 1, 1, 1, 1,
-1.652373, 0.1426284, -0.3767756, 1, 1, 1, 1, 1,
-1.643003, 0.8060858, -0.9136071, 1, 1, 1, 1, 1,
-1.640755, -0.4667313, -2.870033, 1, 1, 1, 1, 1,
-1.637004, 1.131815, -1.186207, 1, 1, 1, 1, 1,
-1.634412, 0.4643398, -1.022538, 1, 1, 1, 1, 1,
-1.604156, 0.2465088, -2.910855, 0, 0, 1, 1, 1,
-1.570073, 1.108663, -0.4343691, 1, 0, 0, 1, 1,
-1.563611, 0.2184241, -0.308411, 1, 0, 0, 1, 1,
-1.561476, -0.9411359, -1.36744, 1, 0, 0, 1, 1,
-1.556538, 0.2717932, -2.004252, 1, 0, 0, 1, 1,
-1.553019, -0.4887606, -0.9646798, 1, 0, 0, 1, 1,
-1.552666, -0.8004172, -1.910511, 0, 0, 0, 1, 1,
-1.550116, 0.6122494, -2.108218, 0, 0, 0, 1, 1,
-1.542831, -0.6364538, -2.500721, 0, 0, 0, 1, 1,
-1.538676, 0.8879339, -0.7283704, 0, 0, 0, 1, 1,
-1.530264, -0.2847387, -2.683412, 0, 0, 0, 1, 1,
-1.517096, 1.314412, -1.120186, 0, 0, 0, 1, 1,
-1.515201, -0.9936211, -1.343741, 0, 0, 0, 1, 1,
-1.508139, 0.8418567, -0.5037586, 1, 1, 1, 1, 1,
-1.506348, 0.004505143, -1.541659, 1, 1, 1, 1, 1,
-1.504848, -0.6564614, -0.5186119, 1, 1, 1, 1, 1,
-1.502404, 0.279808, -1.371295, 1, 1, 1, 1, 1,
-1.477366, -2.523873, -2.841452, 1, 1, 1, 1, 1,
-1.450826, 0.5734538, -1.29016, 1, 1, 1, 1, 1,
-1.449853, 0.4353229, -1.040343, 1, 1, 1, 1, 1,
-1.445696, -0.2336009, -2.323798, 1, 1, 1, 1, 1,
-1.443283, -1.737498, -2.368464, 1, 1, 1, 1, 1,
-1.442449, -0.2465578, -1.746524, 1, 1, 1, 1, 1,
-1.427171, -1.031912, -2.280065, 1, 1, 1, 1, 1,
-1.427012, -0.1729965, -1.957825, 1, 1, 1, 1, 1,
-1.410897, -0.8524581, -2.667713, 1, 1, 1, 1, 1,
-1.410864, 1.503314, -0.5358549, 1, 1, 1, 1, 1,
-1.401508, 2.637707, -1.88617, 1, 1, 1, 1, 1,
-1.390657, -0.07979979, -1.589718, 0, 0, 1, 1, 1,
-1.38544, 0.7397593, -1.149362, 1, 0, 0, 1, 1,
-1.374164, 1.655692, -1.007154, 1, 0, 0, 1, 1,
-1.368727, 0.1087396, -0.5931916, 1, 0, 0, 1, 1,
-1.361333, 1.175863, -2.97084, 1, 0, 0, 1, 1,
-1.341589, -0.6841406, -0.7542317, 1, 0, 0, 1, 1,
-1.338226, -0.9234922, -1.440111, 0, 0, 0, 1, 1,
-1.337299, -1.474054, -1.532171, 0, 0, 0, 1, 1,
-1.336071, -1.73161, -2.803068, 0, 0, 0, 1, 1,
-1.33105, -1.348032, -0.9030447, 0, 0, 0, 1, 1,
-1.329098, -0.1143284, -0.7292424, 0, 0, 0, 1, 1,
-1.32418, -1.582279, -1.850401, 0, 0, 0, 1, 1,
-1.313319, -0.8278047, -3.689372, 0, 0, 0, 1, 1,
-1.311279, 1.860213, -0.08343507, 1, 1, 1, 1, 1,
-1.310973, -0.9031834, -1.928289, 1, 1, 1, 1, 1,
-1.306749, 0.1761311, -1.38473, 1, 1, 1, 1, 1,
-1.304159, 0.7478979, -1.001458, 1, 1, 1, 1, 1,
-1.298099, 1.3573, -0.4307749, 1, 1, 1, 1, 1,
-1.280051, -0.7926443, -1.525995, 1, 1, 1, 1, 1,
-1.279312, -0.8988618, -1.88184, 1, 1, 1, 1, 1,
-1.26269, 1.317294, -0.6227549, 1, 1, 1, 1, 1,
-1.256621, -0.7448307, -2.228475, 1, 1, 1, 1, 1,
-1.252625, 1.167607, -0.6976002, 1, 1, 1, 1, 1,
-1.244402, 0.2268897, 0.08517051, 1, 1, 1, 1, 1,
-1.231018, 0.5305452, -0.1080922, 1, 1, 1, 1, 1,
-1.22884, -1.715921, -3.376869, 1, 1, 1, 1, 1,
-1.217058, -1.019654, -2.805241, 1, 1, 1, 1, 1,
-1.21121, 0.3043886, -0.5739941, 1, 1, 1, 1, 1,
-1.209597, -2.285487, -1.520449, 0, 0, 1, 1, 1,
-1.198523, -0.4169933, -1.55966, 1, 0, 0, 1, 1,
-1.1922, -0.2277377, -2.568226, 1, 0, 0, 1, 1,
-1.190685, -0.5496939, -3.782537, 1, 0, 0, 1, 1,
-1.176837, -1.066843, -2.96436, 1, 0, 0, 1, 1,
-1.175566, -0.6208142, -1.486824, 1, 0, 0, 1, 1,
-1.165082, 0.5994699, -0.8799938, 0, 0, 0, 1, 1,
-1.158968, 1.183993, 0.2419602, 0, 0, 0, 1, 1,
-1.151562, -1.103929, -3.527351, 0, 0, 0, 1, 1,
-1.143495, -1.446694, -2.655176, 0, 0, 0, 1, 1,
-1.13958, -0.2350236, -1.310807, 0, 0, 0, 1, 1,
-1.13169, 0.1387274, -1.522076, 0, 0, 0, 1, 1,
-1.124496, 1.185892, 0.9170299, 0, 0, 0, 1, 1,
-1.118981, -0.1539, -3.255679, 1, 1, 1, 1, 1,
-1.118894, -0.02893344, -0.7284498, 1, 1, 1, 1, 1,
-1.114236, -0.292709, -1.729851, 1, 1, 1, 1, 1,
-1.101478, 0.577848, -0.4879655, 1, 1, 1, 1, 1,
-1.100553, 0.5177691, -0.5405149, 1, 1, 1, 1, 1,
-1.095954, -0.8092453, -1.432291, 1, 1, 1, 1, 1,
-1.091128, -0.9393018, -2.541033, 1, 1, 1, 1, 1,
-1.08895, -0.02610771, -0.978686, 1, 1, 1, 1, 1,
-1.085808, -0.2069098, -3.308375, 1, 1, 1, 1, 1,
-1.084777, 1.669955, -1.117412, 1, 1, 1, 1, 1,
-1.080198, -0.680674, -2.967828, 1, 1, 1, 1, 1,
-1.068297, 0.3068083, -1.540154, 1, 1, 1, 1, 1,
-1.067958, -0.768192, -3.702064, 1, 1, 1, 1, 1,
-1.066064, -0.1064538, -1.659319, 1, 1, 1, 1, 1,
-1.049018, 2.466798, -0.144065, 1, 1, 1, 1, 1,
-1.048814, 1.143774, -0.1664958, 0, 0, 1, 1, 1,
-1.041868, 1.049569, -0.706781, 1, 0, 0, 1, 1,
-1.038487, -1.14798, -1.720414, 1, 0, 0, 1, 1,
-1.03634, 2.154762, -1.593462, 1, 0, 0, 1, 1,
-1.033758, 0.285856, -3.359105, 1, 0, 0, 1, 1,
-1.031035, 0.6465601, -1.849743, 1, 0, 0, 1, 1,
-1.029692, 1.222473, -0.8425508, 0, 0, 0, 1, 1,
-1.026531, 0.3537564, -1.597855, 0, 0, 0, 1, 1,
-1.017261, 1.301894, -1.350656, 0, 0, 0, 1, 1,
-1.008089, -1.112082, -2.040157, 0, 0, 0, 1, 1,
-1.005755, -0.524462, -2.708187, 0, 0, 0, 1, 1,
-0.9948264, 0.5399854, 1.22114, 0, 0, 0, 1, 1,
-0.9934834, 0.2453051, -0.6094224, 0, 0, 0, 1, 1,
-0.9914379, -0.6487384, -2.697456, 1, 1, 1, 1, 1,
-0.9876915, -0.3855212, -1.551771, 1, 1, 1, 1, 1,
-0.9870377, -0.4207936, -2.514901, 1, 1, 1, 1, 1,
-0.9859516, 1.101963, 1.097981, 1, 1, 1, 1, 1,
-0.9854265, 0.748807, -2.090032, 1, 1, 1, 1, 1,
-0.9851273, -1.633639, -1.807454, 1, 1, 1, 1, 1,
-0.9818189, -0.8028791, -2.014278, 1, 1, 1, 1, 1,
-0.9818174, 1.160306, -0.1172756, 1, 1, 1, 1, 1,
-0.9792864, 1.952555, 1.368478, 1, 1, 1, 1, 1,
-0.9777122, -0.6735181, -1.853114, 1, 1, 1, 1, 1,
-0.9685308, -1.005106, -1.704092, 1, 1, 1, 1, 1,
-0.9682337, 0.4471937, -1.77043, 1, 1, 1, 1, 1,
-0.9582046, -1.59685, -1.593469, 1, 1, 1, 1, 1,
-0.956964, -0.940865, -1.302039, 1, 1, 1, 1, 1,
-0.9559081, -0.6023622, -3.058905, 1, 1, 1, 1, 1,
-0.9396188, -1.106291, -2.732536, 0, 0, 1, 1, 1,
-0.9378061, 0.2943484, -1.199865, 1, 0, 0, 1, 1,
-0.9344008, -0.5450166, -0.4614522, 1, 0, 0, 1, 1,
-0.9284261, -0.4228727, -0.4646733, 1, 0, 0, 1, 1,
-0.9241593, -1.602966, -3.052179, 1, 0, 0, 1, 1,
-0.9204523, 1.276106, 1.204384, 1, 0, 0, 1, 1,
-0.9200404, 0.7731071, -0.2431675, 0, 0, 0, 1, 1,
-0.9198368, -1.312117, -2.20956, 0, 0, 0, 1, 1,
-0.9160346, 1.448325, -0.1817909, 0, 0, 0, 1, 1,
-0.9155195, 1.265787, -1.615741, 0, 0, 0, 1, 1,
-0.9018693, -0.4110766, -4.33902, 0, 0, 0, 1, 1,
-0.9011681, -0.5482225, -1.61874, 0, 0, 0, 1, 1,
-0.8928848, 0.6180937, -1.404814, 0, 0, 0, 1, 1,
-0.8862785, -2.25196, -2.462052, 1, 1, 1, 1, 1,
-0.884917, 0.3377111, -2.705703, 1, 1, 1, 1, 1,
-0.8845242, -0.2837161, 0.1757303, 1, 1, 1, 1, 1,
-0.8822429, 0.3512673, -0.1586303, 1, 1, 1, 1, 1,
-0.8783497, -0.3380964, -2.164069, 1, 1, 1, 1, 1,
-0.8767589, -0.04970136, -3.378329, 1, 1, 1, 1, 1,
-0.8763301, 0.07059295, -1.460897, 1, 1, 1, 1, 1,
-0.8626651, -0.924343, -3.593804, 1, 1, 1, 1, 1,
-0.8448969, 0.6671769, 0.594582, 1, 1, 1, 1, 1,
-0.835963, 0.3314977, -1.103458, 1, 1, 1, 1, 1,
-0.8355176, -2.079196, -3.662749, 1, 1, 1, 1, 1,
-0.8337957, 1.223379, -0.5862654, 1, 1, 1, 1, 1,
-0.8323199, 0.5046889, -2.069956, 1, 1, 1, 1, 1,
-0.8158935, -1.234763, -2.188534, 1, 1, 1, 1, 1,
-0.8073831, 1.376348, 2.573134, 1, 1, 1, 1, 1,
-0.8066628, -1.021688, -2.766477, 0, 0, 1, 1, 1,
-0.8043025, 3.362465, -1.013816, 1, 0, 0, 1, 1,
-0.8030792, 0.8652664, 0.2122914, 1, 0, 0, 1, 1,
-0.7994478, 1.097677, -0.875341, 1, 0, 0, 1, 1,
-0.7944323, 0.5790253, -0.06433835, 1, 0, 0, 1, 1,
-0.7926892, 0.184125, -2.505146, 1, 0, 0, 1, 1,
-0.7888482, 1.298394, -1.730841, 0, 0, 0, 1, 1,
-0.7881417, 0.06431377, 0.4903589, 0, 0, 0, 1, 1,
-0.7876592, -0.29633, -2.121713, 0, 0, 0, 1, 1,
-0.7871608, 0.5300471, -0.9676803, 0, 0, 0, 1, 1,
-0.7793673, -0.2593988, 0.05164356, 0, 0, 0, 1, 1,
-0.7780866, -0.168778, -2.334588, 0, 0, 0, 1, 1,
-0.7764181, -0.7897125, -3.395434, 0, 0, 0, 1, 1,
-0.7707247, 0.8158907, -2.057228, 1, 1, 1, 1, 1,
-0.7701107, -1.985743, -3.782169, 1, 1, 1, 1, 1,
-0.7666323, -0.6547088, -4.308429, 1, 1, 1, 1, 1,
-0.7660836, -2.071474, -3.512958, 1, 1, 1, 1, 1,
-0.7640961, -0.5554914, -1.257749, 1, 1, 1, 1, 1,
-0.7552728, -0.07535367, -2.957076, 1, 1, 1, 1, 1,
-0.7522068, -0.8643674, -3.557637, 1, 1, 1, 1, 1,
-0.7414398, 0.05120412, -0.4006197, 1, 1, 1, 1, 1,
-0.7410014, 1.703541, -0.3476233, 1, 1, 1, 1, 1,
-0.7365937, -0.3254288, -3.222301, 1, 1, 1, 1, 1,
-0.7320552, -0.2368336, -0.7906454, 1, 1, 1, 1, 1,
-0.7216294, 0.5478428, -1.906756, 1, 1, 1, 1, 1,
-0.7191719, -0.6045455, -1.858519, 1, 1, 1, 1, 1,
-0.7128451, -1.192796, -2.658468, 1, 1, 1, 1, 1,
-0.709032, -0.8914024, -1.080147, 1, 1, 1, 1, 1,
-0.7089742, -1.030758, -4.153494, 0, 0, 1, 1, 1,
-0.7087708, 1.16412, -2.381009, 1, 0, 0, 1, 1,
-0.7057456, -0.3037572, -0.5946199, 1, 0, 0, 1, 1,
-0.7050943, -0.4399461, -3.100129, 1, 0, 0, 1, 1,
-0.7035348, 0.129903, -0.6901132, 1, 0, 0, 1, 1,
-0.7031668, -1.650263, -0.7677916, 1, 0, 0, 1, 1,
-0.7001694, 2.071603, 0.8682815, 0, 0, 0, 1, 1,
-0.6951612, -0.5657492, -4.955944, 0, 0, 0, 1, 1,
-0.692811, 0.7152242, -3.033515, 0, 0, 0, 1, 1,
-0.6906171, -0.9136163, -2.578115, 0, 0, 0, 1, 1,
-0.6901096, -1.067796, -3.952698, 0, 0, 0, 1, 1,
-0.6883006, -0.4506233, -2.020802, 0, 0, 0, 1, 1,
-0.6880748, 1.559171, -1.861863, 0, 0, 0, 1, 1,
-0.6877266, 0.3356038, -1.467566, 1, 1, 1, 1, 1,
-0.6840976, -0.8691821, -4.448255, 1, 1, 1, 1, 1,
-0.6837785, -0.471109, -1.676918, 1, 1, 1, 1, 1,
-0.6828923, 1.155947, 0.3711594, 1, 1, 1, 1, 1,
-0.6776177, -0.6738842, -2.13545, 1, 1, 1, 1, 1,
-0.6741886, -0.3563478, -1.837057, 1, 1, 1, 1, 1,
-0.6686044, 2.095946, 0.1459197, 1, 1, 1, 1, 1,
-0.6668204, -0.4937205, -2.346723, 1, 1, 1, 1, 1,
-0.6650115, 1.748727, 0.9887655, 1, 1, 1, 1, 1,
-0.663831, -0.1712488, -3.377819, 1, 1, 1, 1, 1,
-0.6519005, -1.87232, -3.079674, 1, 1, 1, 1, 1,
-0.6490046, -1.857067, -2.391086, 1, 1, 1, 1, 1,
-0.6487709, -0.03441249, -2.210855, 1, 1, 1, 1, 1,
-0.6483511, 0.4483117, 0.8052043, 1, 1, 1, 1, 1,
-0.6475914, -0.7384337, -3.774246, 1, 1, 1, 1, 1,
-0.6447318, 0.2325982, -1.155028, 0, 0, 1, 1, 1,
-0.6416314, -0.3608185, -1.306378, 1, 0, 0, 1, 1,
-0.6385586, -0.7572902, -4.380693, 1, 0, 0, 1, 1,
-0.6369593, 0.5371268, -1.576627, 1, 0, 0, 1, 1,
-0.6355147, 0.2932392, -1.098032, 1, 0, 0, 1, 1,
-0.6336578, 1.012943, -1.038634, 1, 0, 0, 1, 1,
-0.6321239, 0.2983689, -1.1612, 0, 0, 0, 1, 1,
-0.6292862, 1.887921, -0.1249008, 0, 0, 0, 1, 1,
-0.6188905, -0.163819, -3.028001, 0, 0, 0, 1, 1,
-0.6153873, -0.04206242, -1.021436, 0, 0, 0, 1, 1,
-0.6148004, 1.745463, -0.4006579, 0, 0, 0, 1, 1,
-0.6062761, 0.7916343, -1.63366, 0, 0, 0, 1, 1,
-0.6010016, 0.1478922, -1.442047, 0, 0, 0, 1, 1,
-0.598848, 0.832873, -0.6204827, 1, 1, 1, 1, 1,
-0.5917742, -1.145022, -2.08842, 1, 1, 1, 1, 1,
-0.5883197, -1.322702, -2.095553, 1, 1, 1, 1, 1,
-0.5876011, -0.1889064, -2.506064, 1, 1, 1, 1, 1,
-0.5827015, 0.2244475, -2.69652, 1, 1, 1, 1, 1,
-0.5794575, -0.4535727, -2.91266, 1, 1, 1, 1, 1,
-0.5773178, 1.011071, -1.833157, 1, 1, 1, 1, 1,
-0.5664776, 2.148593, -1.515697, 1, 1, 1, 1, 1,
-0.5648511, 0.5789736, 0.5676452, 1, 1, 1, 1, 1,
-0.5647625, 1.344775, -1.084988, 1, 1, 1, 1, 1,
-0.564025, -0.2040633, -2.196047, 1, 1, 1, 1, 1,
-0.5598935, 0.2044806, -2.010282, 1, 1, 1, 1, 1,
-0.5567508, -0.7955537, -1.680081, 1, 1, 1, 1, 1,
-0.5516692, 0.4244944, -1.253508, 1, 1, 1, 1, 1,
-0.5502271, -0.03809503, -0.7227165, 1, 1, 1, 1, 1,
-0.5469137, 0.3861521, -1.909554, 0, 0, 1, 1, 1,
-0.5452757, 0.5317845, 0.1016831, 1, 0, 0, 1, 1,
-0.541457, -1.096714, -3.240848, 1, 0, 0, 1, 1,
-0.5385794, 0.320645, -0.7948689, 1, 0, 0, 1, 1,
-0.5376303, 0.4915586, -1.394925, 1, 0, 0, 1, 1,
-0.5349951, -0.1615185, -2.643075, 1, 0, 0, 1, 1,
-0.5343504, -0.792928, -2.784992, 0, 0, 0, 1, 1,
-0.5332665, 0.7087268, -2.901121, 0, 0, 0, 1, 1,
-0.5307729, -0.1326293, -1.607935, 0, 0, 0, 1, 1,
-0.5301869, -0.446733, -3.972568, 0, 0, 0, 1, 1,
-0.5262008, -0.291925, -2.291682, 0, 0, 0, 1, 1,
-0.525686, 0.3330555, -1.062184, 0, 0, 0, 1, 1,
-0.524507, -0.4934295, -1.935721, 0, 0, 0, 1, 1,
-0.5217248, 1.085676, -0.906244, 1, 1, 1, 1, 1,
-0.5150186, 0.9188256, -0.7116315, 1, 1, 1, 1, 1,
-0.5052657, -0.5719636, -1.028283, 1, 1, 1, 1, 1,
-0.5050992, -1.421107, -2.189676, 1, 1, 1, 1, 1,
-0.5026721, -0.8243761, -1.69078, 1, 1, 1, 1, 1,
-0.5003036, -0.9569934, -3.087903, 1, 1, 1, 1, 1,
-0.4995288, -0.2770759, -1.666157, 1, 1, 1, 1, 1,
-0.4985671, -0.1615757, -1.132539, 1, 1, 1, 1, 1,
-0.496305, -0.5288936, -0.9047737, 1, 1, 1, 1, 1,
-0.4774701, 0.2157995, -1.033301, 1, 1, 1, 1, 1,
-0.477067, 0.09564795, -2.01299, 1, 1, 1, 1, 1,
-0.4754752, -1.139824, -2.900696, 1, 1, 1, 1, 1,
-0.472062, 0.8285052, 1.021738, 1, 1, 1, 1, 1,
-0.4720576, 0.1176631, -2.380841, 1, 1, 1, 1, 1,
-0.471653, -0.5637352, -2.427507, 1, 1, 1, 1, 1,
-0.4624469, 0.9284922, -0.4298035, 0, 0, 1, 1, 1,
-0.4601322, 0.04551854, 0.1576903, 1, 0, 0, 1, 1,
-0.457391, 0.3236055, -0.1922265, 1, 0, 0, 1, 1,
-0.453239, -0.3093793, -2.235816, 1, 0, 0, 1, 1,
-0.4499154, -0.676114, -0.534667, 1, 0, 0, 1, 1,
-0.4475486, 1.056449, -0.6687588, 1, 0, 0, 1, 1,
-0.4442449, -0.328763, -0.7423347, 0, 0, 0, 1, 1,
-0.4426374, -0.04960458, -2.964348, 0, 0, 0, 1, 1,
-0.4419923, -0.3859798, -3.24028, 0, 0, 0, 1, 1,
-0.4418339, -0.05984789, -1.402557, 0, 0, 0, 1, 1,
-0.4405894, -0.8899837, -4.91624, 0, 0, 0, 1, 1,
-0.4347796, -2.164669, -2.78416, 0, 0, 0, 1, 1,
-0.43108, -0.6433201, -2.842137, 0, 0, 0, 1, 1,
-0.4279917, -0.380169, -4.151126, 1, 1, 1, 1, 1,
-0.4235975, 0.3322812, -2.458717, 1, 1, 1, 1, 1,
-0.4200296, 0.1201707, -0.1846853, 1, 1, 1, 1, 1,
-0.4195303, -0.5091692, -1.413221, 1, 1, 1, 1, 1,
-0.4190973, 1.171416, -1.037548, 1, 1, 1, 1, 1,
-0.4186354, -0.2744271, -2.626917, 1, 1, 1, 1, 1,
-0.417004, -1.389959, -3.304071, 1, 1, 1, 1, 1,
-0.4127938, -0.8162752, -2.32238, 1, 1, 1, 1, 1,
-0.4106608, -0.6484253, -0.4540303, 1, 1, 1, 1, 1,
-0.4081033, 0.6904858, -1.59245, 1, 1, 1, 1, 1,
-0.4037798, 0.1238806, -0.8394685, 1, 1, 1, 1, 1,
-0.4013506, -1.287301, -3.000161, 1, 1, 1, 1, 1,
-0.401255, 2.173121, -0.268057, 1, 1, 1, 1, 1,
-0.3991953, 0.1986924, -0.4879003, 1, 1, 1, 1, 1,
-0.3980664, 1.092001, 0.3178053, 1, 1, 1, 1, 1,
-0.397433, -2.240122, -2.061664, 0, 0, 1, 1, 1,
-0.3949703, -4.354168, -2.613218, 1, 0, 0, 1, 1,
-0.3848122, -0.06430502, -2.063907, 1, 0, 0, 1, 1,
-0.3804644, -0.6407922, -2.899023, 1, 0, 0, 1, 1,
-0.3768048, -2.052881, -2.70739, 1, 0, 0, 1, 1,
-0.3735173, 1.60329, 1.856333, 1, 0, 0, 1, 1,
-0.3628331, -1.243637, -3.194202, 0, 0, 0, 1, 1,
-0.3614036, 0.2766793, -1.260785, 0, 0, 0, 1, 1,
-0.3595458, -0.3280684, -1.388444, 0, 0, 0, 1, 1,
-0.3592765, -0.6973248, -4.251276, 0, 0, 0, 1, 1,
-0.3589019, 1.858318, -0.5480458, 0, 0, 0, 1, 1,
-0.3537302, 0.6014693, -0.1625461, 0, 0, 0, 1, 1,
-0.3512938, -0.07646807, -0.4397394, 0, 0, 0, 1, 1,
-0.349663, 0.6698301, -0.7209092, 1, 1, 1, 1, 1,
-0.3493477, 0.1608231, -2.82021, 1, 1, 1, 1, 1,
-0.3479108, -0.6903472, -3.41589, 1, 1, 1, 1, 1,
-0.3431925, -1.658821, -2.345591, 1, 1, 1, 1, 1,
-0.3424663, -0.5556688, -2.572567, 1, 1, 1, 1, 1,
-0.3394181, 0.1489396, -0.50585, 1, 1, 1, 1, 1,
-0.3374802, -0.9277251, -2.017591, 1, 1, 1, 1, 1,
-0.3366703, -0.7404276, -2.842278, 1, 1, 1, 1, 1,
-0.336253, 0.5789708, 1.276189, 1, 1, 1, 1, 1,
-0.3341893, 0.1402897, 0.540849, 1, 1, 1, 1, 1,
-0.3340782, 0.7269823, -2.241125, 1, 1, 1, 1, 1,
-0.3325296, 1.362899, 0.733941, 1, 1, 1, 1, 1,
-0.3303814, -0.1256942, -2.090137, 1, 1, 1, 1, 1,
-0.3259413, 0.2755684, -0.4786157, 1, 1, 1, 1, 1,
-0.3229659, 0.1122965, -0.146862, 1, 1, 1, 1, 1,
-0.3183855, -1.764856, -3.516884, 0, 0, 1, 1, 1,
-0.3115091, -0.02359731, -1.317137, 1, 0, 0, 1, 1,
-0.3113028, 0.7969481, -1.349682, 1, 0, 0, 1, 1,
-0.3093991, 0.1049225, -1.804943, 1, 0, 0, 1, 1,
-0.3084919, 0.06536379, -1.557454, 1, 0, 0, 1, 1,
-0.3073769, -0.2741501, -1.809677, 1, 0, 0, 1, 1,
-0.3073462, -0.3052097, -4.463615, 0, 0, 0, 1, 1,
-0.299951, 0.1334184, -1.035918, 0, 0, 0, 1, 1,
-0.2959715, 0.9352251, 0.930182, 0, 0, 0, 1, 1,
-0.2955597, -0.002414746, -1.614929, 0, 0, 0, 1, 1,
-0.2955296, 0.5261393, 0.3826791, 0, 0, 0, 1, 1,
-0.295476, -0.568846, -3.507551, 0, 0, 0, 1, 1,
-0.2943413, -0.6993042, -2.321661, 0, 0, 0, 1, 1,
-0.283517, 0.8878675, -0.2072708, 1, 1, 1, 1, 1,
-0.282041, -1.200396, -3.296384, 1, 1, 1, 1, 1,
-0.2819232, -2.381807, -3.367166, 1, 1, 1, 1, 1,
-0.2814241, 0.264914, -0.6865025, 1, 1, 1, 1, 1,
-0.2789533, 1.218642, -0.8764022, 1, 1, 1, 1, 1,
-0.2766922, -0.2123397, -2.095318, 1, 1, 1, 1, 1,
-0.2686774, -0.3670354, -2.618888, 1, 1, 1, 1, 1,
-0.2676761, -1.303581, -3.598994, 1, 1, 1, 1, 1,
-0.2675499, -0.9815594, -4.601998, 1, 1, 1, 1, 1,
-0.2660308, 1.527057, 0.5216181, 1, 1, 1, 1, 1,
-0.2641196, 0.782189, -0.7944654, 1, 1, 1, 1, 1,
-0.261333, -0.9036468, -2.235317, 1, 1, 1, 1, 1,
-0.2584007, 1.067881, -0.6914881, 1, 1, 1, 1, 1,
-0.2572291, 1.367617, 0.1963902, 1, 1, 1, 1, 1,
-0.2569699, 0.4448599, 0.6430047, 1, 1, 1, 1, 1,
-0.2554241, -0.2226488, -2.422847, 0, 0, 1, 1, 1,
-0.250735, 0.1634694, -1.728453, 1, 0, 0, 1, 1,
-0.2498183, 0.06360107, -1.452115, 1, 0, 0, 1, 1,
-0.2487896, 0.04182876, -1.834409, 1, 0, 0, 1, 1,
-0.2460667, -1.743913, -3.09466, 1, 0, 0, 1, 1,
-0.2454213, -0.5781693, -2.135525, 1, 0, 0, 1, 1,
-0.2431885, 0.908105, -2.013409, 0, 0, 0, 1, 1,
-0.2415157, -0.03829283, -1.305027, 0, 0, 0, 1, 1,
-0.2384886, 1.190251, 0.3288132, 0, 0, 0, 1, 1,
-0.2354182, 1.30527, 1.185759, 0, 0, 0, 1, 1,
-0.234919, 0.02250153, -2.027279, 0, 0, 0, 1, 1,
-0.2340581, -1.709788, -3.485176, 0, 0, 0, 1, 1,
-0.23347, 2.999117, -1.027368, 0, 0, 0, 1, 1,
-0.2334243, 1.051703, -0.2137794, 1, 1, 1, 1, 1,
-0.2300867, 1.050883, -0.8559816, 1, 1, 1, 1, 1,
-0.2298574, 1.192763, -0.02973362, 1, 1, 1, 1, 1,
-0.2298558, 0.5150098, -1.723819, 1, 1, 1, 1, 1,
-0.2290439, -0.1793132, 0.6504493, 1, 1, 1, 1, 1,
-0.2168688, -0.08071989, -1.494215, 1, 1, 1, 1, 1,
-0.2145274, -0.3783604, -1.816857, 1, 1, 1, 1, 1,
-0.2141299, -1.201952, -3.683058, 1, 1, 1, 1, 1,
-0.2140693, 0.2800624, -1.273852, 1, 1, 1, 1, 1,
-0.2117884, 0.1247425, -0.05003623, 1, 1, 1, 1, 1,
-0.2087041, 0.4432746, -0.8090421, 1, 1, 1, 1, 1,
-0.2044574, -1.357889, -4.298528, 1, 1, 1, 1, 1,
-0.2020726, 0.5999439, -0.7089206, 1, 1, 1, 1, 1,
-0.1971093, -0.3510807, -2.193907, 1, 1, 1, 1, 1,
-0.1934169, 0.411943, -2.103058, 1, 1, 1, 1, 1,
-0.192128, 1.118477, -0.9118301, 0, 0, 1, 1, 1,
-0.1921218, 0.7956084, 0.7326898, 1, 0, 0, 1, 1,
-0.1913074, 0.674621, 0.08216691, 1, 0, 0, 1, 1,
-0.1893547, -0.3479945, -3.814689, 1, 0, 0, 1, 1,
-0.1877181, -0.3628933, -3.729838, 1, 0, 0, 1, 1,
-0.1832232, -1.230158, -3.00553, 1, 0, 0, 1, 1,
-0.1811074, 0.2944044, 0.5234969, 0, 0, 0, 1, 1,
-0.1735783, -0.2837708, -3.113189, 0, 0, 0, 1, 1,
-0.1704421, 1.968429, 0.3371381, 0, 0, 0, 1, 1,
-0.1649836, 0.6630177, -1.753533, 0, 0, 0, 1, 1,
-0.1639803, -2.844397, -2.894368, 0, 0, 0, 1, 1,
-0.1595463, 0.7985372, -0.5461639, 0, 0, 0, 1, 1,
-0.1581321, 0.3070474, -2.043702, 0, 0, 0, 1, 1,
-0.1565482, -0.2178095, -1.067875, 1, 1, 1, 1, 1,
-0.1543826, -1.314088, -0.9152284, 1, 1, 1, 1, 1,
-0.1489025, -0.9642156, -3.861715, 1, 1, 1, 1, 1,
-0.1441557, 0.5209737, 0.1091424, 1, 1, 1, 1, 1,
-0.1382644, -0.08916442, -0.4996667, 1, 1, 1, 1, 1,
-0.1365738, -0.6707342, -2.675457, 1, 1, 1, 1, 1,
-0.1352506, 0.2542565, -1.044848, 1, 1, 1, 1, 1,
-0.1334555, 1.351629, 0.1946329, 1, 1, 1, 1, 1,
-0.1333002, 0.1724032, -0.6369435, 1, 1, 1, 1, 1,
-0.1319073, 0.1155262, -0.860354, 1, 1, 1, 1, 1,
-0.1301618, -0.127648, -1.832231, 1, 1, 1, 1, 1,
-0.1247594, 0.4485369, -0.1310811, 1, 1, 1, 1, 1,
-0.1217968, 1.853418, 0.4125792, 1, 1, 1, 1, 1,
-0.116058, -0.7953959, -3.246014, 1, 1, 1, 1, 1,
-0.1148417, -0.2580055, -2.468863, 1, 1, 1, 1, 1,
-0.1135361, 0.6780993, -0.2926027, 0, 0, 1, 1, 1,
-0.1133307, -0.663237, -2.298715, 1, 0, 0, 1, 1,
-0.1131377, 0.2626661, 0.2220394, 1, 0, 0, 1, 1,
-0.1123507, 1.037219, -0.2964152, 1, 0, 0, 1, 1,
-0.1108037, 0.3430169, 0.9686849, 1, 0, 0, 1, 1,
-0.1092218, -0.8470119, -3.177906, 1, 0, 0, 1, 1,
-0.1080376, 0.5691736, -0.3969142, 0, 0, 0, 1, 1,
-0.1045999, -0.1361428, 0.1766037, 0, 0, 0, 1, 1,
-0.104268, -0.7366827, -3.907987, 0, 0, 0, 1, 1,
-0.09866532, -0.5521531, -2.800155, 0, 0, 0, 1, 1,
-0.09678512, 0.7856336, -1.353753, 0, 0, 0, 1, 1,
-0.09396845, -0.5215883, -2.966029, 0, 0, 0, 1, 1,
-0.09060331, -0.455488, -3.262542, 0, 0, 0, 1, 1,
-0.0898405, 0.5915849, 1.196139, 1, 1, 1, 1, 1,
-0.08956953, 1.708434, -1.028702, 1, 1, 1, 1, 1,
-0.08788493, -0.9896985, -3.785298, 1, 1, 1, 1, 1,
-0.08757322, -0.1993444, -4.43052, 1, 1, 1, 1, 1,
-0.08725908, 0.6101058, -1.227449, 1, 1, 1, 1, 1,
-0.08439501, 0.155288, 0.1617709, 1, 1, 1, 1, 1,
-0.08123218, -0.2487844, -2.955506, 1, 1, 1, 1, 1,
-0.08073431, 0.1825027, 0.3981571, 1, 1, 1, 1, 1,
-0.07916503, -0.6890893, -3.276449, 1, 1, 1, 1, 1,
-0.07788798, -0.09094669, -1.662826, 1, 1, 1, 1, 1,
-0.0741388, 0.5670904, -0.4163336, 1, 1, 1, 1, 1,
-0.07201891, 0.4694903, -1.251429, 1, 1, 1, 1, 1,
-0.07136417, -0.3812174, -2.185815, 1, 1, 1, 1, 1,
-0.06943808, -0.0304823, -2.470753, 1, 1, 1, 1, 1,
-0.06723358, 1.418414, 0.7436507, 1, 1, 1, 1, 1,
-0.0657158, 1.238283, -0.2073385, 0, 0, 1, 1, 1,
-0.06153242, -2.369621, -3.797466, 1, 0, 0, 1, 1,
-0.05652322, 0.3620466, -0.5190906, 1, 0, 0, 1, 1,
-0.05328491, -1.016228, -3.609331, 1, 0, 0, 1, 1,
-0.05273274, 0.2243036, 0.6306376, 1, 0, 0, 1, 1,
-0.0504132, 0.534228, -2.078591, 1, 0, 0, 1, 1,
-0.04882688, -1.330825, -4.222785, 0, 0, 0, 1, 1,
-0.04823693, 1.238991, -0.4385632, 0, 0, 0, 1, 1,
-0.04579016, 1.130223, 0.5306684, 0, 0, 0, 1, 1,
-0.04327399, -0.4607524, -3.098572, 0, 0, 0, 1, 1,
-0.04057328, -1.512387, -3.986554, 0, 0, 0, 1, 1,
-0.04001474, 1.331897, 1.4897, 0, 0, 0, 1, 1,
-0.03885331, -0.9195193, -1.79973, 0, 0, 0, 1, 1,
-0.03840532, -1.717647, -2.702585, 1, 1, 1, 1, 1,
-0.0376226, 0.8787161, 1.569625, 1, 1, 1, 1, 1,
-0.03601835, 1.783495, -0.8965331, 1, 1, 1, 1, 1,
-0.03252793, -0.7706349, -2.958823, 1, 1, 1, 1, 1,
-0.02912155, 0.01277019, -1.044155, 1, 1, 1, 1, 1,
-0.02544153, -1.310133, -3.961268, 1, 1, 1, 1, 1,
-0.02368462, 1.427204, -0.1612333, 1, 1, 1, 1, 1,
-0.02346512, -1.217177, -3.534876, 1, 1, 1, 1, 1,
-0.02288631, -0.2322369, -3.690771, 1, 1, 1, 1, 1,
-0.02143119, 0.9392609, -1.723791, 1, 1, 1, 1, 1,
-0.01683009, 1.663494, 1.029887, 1, 1, 1, 1, 1,
-0.01413688, -0.4992805, -3.966853, 1, 1, 1, 1, 1,
-0.01273547, 1.260562, 0.05817636, 1, 1, 1, 1, 1,
-0.004727253, -2.138798, -3.604885, 1, 1, 1, 1, 1,
-0.004217258, 2.066735, 1.562521, 1, 1, 1, 1, 1,
-0.003701592, -0.6304902, -3.020004, 0, 0, 1, 1, 1,
-0.0007249931, 0.5994137, -0.5844631, 1, 0, 0, 1, 1,
-9.772743e-05, -0.1844145, -2.259484, 1, 0, 0, 1, 1,
0.003477632, 0.9324329, 1.424942, 1, 0, 0, 1, 1,
0.004376551, 1.011621, 2.509886, 1, 0, 0, 1, 1,
0.007931298, 0.2127605, 0.4709747, 1, 0, 0, 1, 1,
0.01224077, 1.91706, -0.9292415, 0, 0, 0, 1, 1,
0.01316711, -1.064109, 3.420542, 0, 0, 0, 1, 1,
0.01465882, -1.322004, 3.086911, 0, 0, 0, 1, 1,
0.01541665, 0.5123039, -0.01125644, 0, 0, 0, 1, 1,
0.01975464, -0.5739042, 1.933903, 0, 0, 0, 1, 1,
0.02355043, -1.241689, 4.568845, 0, 0, 0, 1, 1,
0.02367071, 0.1343068, -0.09057786, 0, 0, 0, 1, 1,
0.02414689, 0.8828755, 2.496596, 1, 1, 1, 1, 1,
0.02712391, -0.8551405, 1.654549, 1, 1, 1, 1, 1,
0.02787861, -0.6000449, 3.252925, 1, 1, 1, 1, 1,
0.03125891, 0.4893878, 0.5115185, 1, 1, 1, 1, 1,
0.03162952, 1.308927, -2.247189, 1, 1, 1, 1, 1,
0.03244121, 0.2091007, -0.3545666, 1, 1, 1, 1, 1,
0.03641336, 1.125416, 0.7929621, 1, 1, 1, 1, 1,
0.03730099, 0.07654008, 1.568316, 1, 1, 1, 1, 1,
0.03749494, 1.07286, 0.6333618, 1, 1, 1, 1, 1,
0.03998615, 0.8614253, -0.2881582, 1, 1, 1, 1, 1,
0.04177026, -1.565277, 4.244845, 1, 1, 1, 1, 1,
0.04196348, 0.9523315, 1.862234, 1, 1, 1, 1, 1,
0.04201502, 0.3548848, 1.352174, 1, 1, 1, 1, 1,
0.04402715, -1.791289, 3.309635, 1, 1, 1, 1, 1,
0.04518631, -2.370193, 3.28953, 1, 1, 1, 1, 1,
0.05075473, 0.9310429, -1.302448, 0, 0, 1, 1, 1,
0.05218834, 0.3510404, 0.7333573, 1, 0, 0, 1, 1,
0.05367934, -1.517967, 2.277527, 1, 0, 0, 1, 1,
0.05777387, 0.9339692, -0.05548279, 1, 0, 0, 1, 1,
0.05814069, -0.05741546, 4.21787, 1, 0, 0, 1, 1,
0.05935661, 0.7625548, 0.7128422, 1, 0, 0, 1, 1,
0.06049993, 0.03730805, 0.8324543, 0, 0, 0, 1, 1,
0.06486721, 0.3434949, 1.269452, 0, 0, 0, 1, 1,
0.07806037, -0.04844664, 2.174799, 0, 0, 0, 1, 1,
0.07893016, -0.09897327, 3.094626, 0, 0, 0, 1, 1,
0.08105167, 1.008934, -0.2454092, 0, 0, 0, 1, 1,
0.08311328, 0.7360308, -0.6304173, 0, 0, 0, 1, 1,
0.08529197, 1.114862, 1.345761, 0, 0, 0, 1, 1,
0.08891298, 0.3234394, 0.940698, 1, 1, 1, 1, 1,
0.09787598, 0.06582093, 1.74402, 1, 1, 1, 1, 1,
0.1010261, 0.6762101, -1.303782, 1, 1, 1, 1, 1,
0.104863, 0.02871714, -0.5278668, 1, 1, 1, 1, 1,
0.1089115, -0.04550846, 1.056167, 1, 1, 1, 1, 1,
0.1101174, -0.2892022, 3.160667, 1, 1, 1, 1, 1,
0.1121285, -0.7721892, 3.158176, 1, 1, 1, 1, 1,
0.1128028, -1.09426, 3.764892, 1, 1, 1, 1, 1,
0.1156064, 0.7781259, -0.8392563, 1, 1, 1, 1, 1,
0.1171094, 0.3663361, 2.01181, 1, 1, 1, 1, 1,
0.1201473, -0.1398516, 2.659999, 1, 1, 1, 1, 1,
0.1231734, 1.79548, -0.07525953, 1, 1, 1, 1, 1,
0.1252484, -0.8226863, 2.560521, 1, 1, 1, 1, 1,
0.1271276, -0.7953018, 3.853235, 1, 1, 1, 1, 1,
0.1299922, 0.325819, -0.3101969, 1, 1, 1, 1, 1,
0.1328824, -0.7656301, 2.527608, 0, 0, 1, 1, 1,
0.1344063, -0.4021559, 3.170933, 1, 0, 0, 1, 1,
0.1346854, -1.19336, 2.917205, 1, 0, 0, 1, 1,
0.1352088, -1.322152, 2.551901, 1, 0, 0, 1, 1,
0.1384575, 0.187351, -0.966489, 1, 0, 0, 1, 1,
0.1389876, -0.6224267, 4.534827, 1, 0, 0, 1, 1,
0.1392433, -0.9519059, 1.664974, 0, 0, 0, 1, 1,
0.1416957, -1.558726, 2.824913, 0, 0, 0, 1, 1,
0.1431328, -0.4439152, 2.399424, 0, 0, 0, 1, 1,
0.1438733, -0.05692653, 1.439938, 0, 0, 0, 1, 1,
0.1447151, 0.7853212, 0.3144532, 0, 0, 0, 1, 1,
0.1452058, -1.385135, 3.566519, 0, 0, 0, 1, 1,
0.1458579, -0.8253179, 3.576553, 0, 0, 0, 1, 1,
0.1508941, 0.125804, 0.6283746, 1, 1, 1, 1, 1,
0.1509777, -0.8625136, 4.48197, 1, 1, 1, 1, 1,
0.154841, -0.3009236, 2.975987, 1, 1, 1, 1, 1,
0.155308, -0.1381589, 1.679925, 1, 1, 1, 1, 1,
0.1591275, 1.098862, 1.826034, 1, 1, 1, 1, 1,
0.1591714, -0.6240726, 2.936324, 1, 1, 1, 1, 1,
0.1606539, -0.3489027, 3.248894, 1, 1, 1, 1, 1,
0.1609153, -0.07540995, 1.54212, 1, 1, 1, 1, 1,
0.1611778, 0.1063952, 0.5174276, 1, 1, 1, 1, 1,
0.1612446, 0.672384, -1.687121, 1, 1, 1, 1, 1,
0.1643363, -0.3215675, 2.107346, 1, 1, 1, 1, 1,
0.1657972, 2.366153, 0.638639, 1, 1, 1, 1, 1,
0.1664659, 0.6509603, -0.0675002, 1, 1, 1, 1, 1,
0.1667971, -1.067454, 3.708103, 1, 1, 1, 1, 1,
0.1682558, -1.46711, 3.340195, 1, 1, 1, 1, 1,
0.1695477, 1.36043, 0.2193262, 0, 0, 1, 1, 1,
0.1701464, 0.1638893, 1.784257, 1, 0, 0, 1, 1,
0.1706718, -0.2067911, 1.572426, 1, 0, 0, 1, 1,
0.1708165, 2.134179, 0.1030308, 1, 0, 0, 1, 1,
0.1722083, -0.7968487, 2.093257, 1, 0, 0, 1, 1,
0.1780691, 1.185741, -0.2658666, 1, 0, 0, 1, 1,
0.181166, 2.606765, 0.3537702, 0, 0, 0, 1, 1,
0.1880515, 0.3768876, 1.905403, 0, 0, 0, 1, 1,
0.1882272, -0.01254785, 2.185961, 0, 0, 0, 1, 1,
0.1896816, -0.7290249, 1.027155, 0, 0, 0, 1, 1,
0.1922461, -1.061284, 3.247576, 0, 0, 0, 1, 1,
0.1960035, -0.6793506, 3.204587, 0, 0, 0, 1, 1,
0.1973014, 0.445981, -0.7333548, 0, 0, 0, 1, 1,
0.1997553, -0.6243389, 3.242688, 1, 1, 1, 1, 1,
0.2064078, -1.386707, 3.767432, 1, 1, 1, 1, 1,
0.2068246, -1.468721, 2.507525, 1, 1, 1, 1, 1,
0.2078633, 1.005999, 0.6168559, 1, 1, 1, 1, 1,
0.210231, -0.05230203, 1.724464, 1, 1, 1, 1, 1,
0.2186379, -0.09951657, 1.833737, 1, 1, 1, 1, 1,
0.2208472, -0.3254988, 1.682905, 1, 1, 1, 1, 1,
0.2215187, 0.7826971, -1.123583, 1, 1, 1, 1, 1,
0.2228404, -0.3178221, 2.39544, 1, 1, 1, 1, 1,
0.2234606, -1.085857, 3.809726, 1, 1, 1, 1, 1,
0.2243334, -0.8322999, 2.13563, 1, 1, 1, 1, 1,
0.2254931, 0.938547, 1.019098, 1, 1, 1, 1, 1,
0.2300939, 0.6196272, 0.3963157, 1, 1, 1, 1, 1,
0.2325425, -0.8277286, 2.079887, 1, 1, 1, 1, 1,
0.2365279, 1.013684, 2.050619, 1, 1, 1, 1, 1,
0.2391378, -0.1246829, 1.013118, 0, 0, 1, 1, 1,
0.2421947, 0.1565266, -0.1345204, 1, 0, 0, 1, 1,
0.2424351, -0.0620726, 0.5014301, 1, 0, 0, 1, 1,
0.2444355, -0.6300995, 3.254543, 1, 0, 0, 1, 1,
0.2488308, 1.785543, -0.8118815, 1, 0, 0, 1, 1,
0.2496514, -0.07688688, 1.078018, 1, 0, 0, 1, 1,
0.2518612, 0.177822, 1.247421, 0, 0, 0, 1, 1,
0.2577846, 0.8252825, -1.021327, 0, 0, 0, 1, 1,
0.2587585, 0.7660573, 1.481913, 0, 0, 0, 1, 1,
0.2664685, -0.138064, 3.0253, 0, 0, 0, 1, 1,
0.2713288, 0.4099903, 1.804979, 0, 0, 0, 1, 1,
0.2736645, 1.202921, -1.321497, 0, 0, 0, 1, 1,
0.2751491, -1.288172, 4.703076, 0, 0, 0, 1, 1,
0.2780396, 0.6867145, -0.4822748, 1, 1, 1, 1, 1,
0.2793391, -1.403907, 2.506887, 1, 1, 1, 1, 1,
0.2807947, -0.1514677, 0.5320477, 1, 1, 1, 1, 1,
0.2846626, 0.7855923, 1.384232, 1, 1, 1, 1, 1,
0.2869142, -0.938014, 3.970507, 1, 1, 1, 1, 1,
0.2883621, 0.5354851, 1.672343, 1, 1, 1, 1, 1,
0.2888419, 1.009548, 0.555954, 1, 1, 1, 1, 1,
0.2913023, 1.219529, -1.252727, 1, 1, 1, 1, 1,
0.2986494, -0.08303369, 0.4366497, 1, 1, 1, 1, 1,
0.2989751, -0.9484859, 0.8560381, 1, 1, 1, 1, 1,
0.299683, -1.131627, 3.070411, 1, 1, 1, 1, 1,
0.3027237, -0.6798093, 1.892458, 1, 1, 1, 1, 1,
0.305789, -0.3952577, 4.560584, 1, 1, 1, 1, 1,
0.3090469, 0.8482164, 0.626547, 1, 1, 1, 1, 1,
0.3119518, 0.7635309, 0.8401577, 1, 1, 1, 1, 1,
0.3150206, -0.0719706, 1.312487, 0, 0, 1, 1, 1,
0.3201097, -0.7801806, 3.390402, 1, 0, 0, 1, 1,
0.3226175, -1.858425, 3.145236, 1, 0, 0, 1, 1,
0.3258257, 1.245386, 0.08199922, 1, 0, 0, 1, 1,
0.3260256, 1.014127, 0.9452784, 1, 0, 0, 1, 1,
0.3263872, 1.217084, 0.03983994, 1, 0, 0, 1, 1,
0.3270475, 0.1363207, 1.310828, 0, 0, 0, 1, 1,
0.3300367, -0.3405628, 3.355468, 0, 0, 0, 1, 1,
0.335321, -0.2075867, -0.2888784, 0, 0, 0, 1, 1,
0.3396145, 0.3514374, 1.767009, 0, 0, 0, 1, 1,
0.3401459, -1.215215, 2.27661, 0, 0, 0, 1, 1,
0.3423172, 0.2964097, 2.768363, 0, 0, 0, 1, 1,
0.3456772, 0.2590641, -0.7541228, 0, 0, 0, 1, 1,
0.3473184, 1.67782, -0.2112158, 1, 1, 1, 1, 1,
0.3497664, -0.4501005, 5.284877, 1, 1, 1, 1, 1,
0.3549014, 1.390668, 1.26883, 1, 1, 1, 1, 1,
0.3571495, 0.04538211, 0.9594055, 1, 1, 1, 1, 1,
0.3592978, 1.165465, 0.4072332, 1, 1, 1, 1, 1,
0.3604728, 0.1693328, 0.7756329, 1, 1, 1, 1, 1,
0.3655394, -1.979521, 3.96499, 1, 1, 1, 1, 1,
0.366087, -0.1945222, 2.875011, 1, 1, 1, 1, 1,
0.3668722, -0.03641248, 3.53349, 1, 1, 1, 1, 1,
0.3677669, -1.598924, 2.920263, 1, 1, 1, 1, 1,
0.3688313, -0.8868479, 0.1785388, 1, 1, 1, 1, 1,
0.3701662, 0.9030355, 0.9724379, 1, 1, 1, 1, 1,
0.3726981, 1.281731, 0.1588031, 1, 1, 1, 1, 1,
0.373209, -0.6629291, 1.80934, 1, 1, 1, 1, 1,
0.3778028, -0.9060945, 1.856505, 1, 1, 1, 1, 1,
0.387809, -0.852381, 3.891592, 0, 0, 1, 1, 1,
0.3890058, 1.226317, 0.923618, 1, 0, 0, 1, 1,
0.3896201, 2.494487, 0.3305428, 1, 0, 0, 1, 1,
0.3907481, -1.404167, 2.890928, 1, 0, 0, 1, 1,
0.3945947, 0.4721141, 0.207958, 1, 0, 0, 1, 1,
0.3959592, -0.5796013, 2.844514, 1, 0, 0, 1, 1,
0.3999804, 0.5167812, 0.5657601, 0, 0, 0, 1, 1,
0.4002454, 0.1969037, 2.964035, 0, 0, 0, 1, 1,
0.4020258, 1.115986, 1.17752, 0, 0, 0, 1, 1,
0.4024668, -0.7997491, 0.7265083, 0, 0, 0, 1, 1,
0.4133165, 0.2402159, 0.7919551, 0, 0, 0, 1, 1,
0.4134901, 1.161457, 1.773928, 0, 0, 0, 1, 1,
0.4140775, -0.2648095, 3.235331, 0, 0, 0, 1, 1,
0.4145066, -0.6039295, 1.182048, 1, 1, 1, 1, 1,
0.414941, 0.3853694, 1.851387, 1, 1, 1, 1, 1,
0.4164963, 1.895291, 1.036427, 1, 1, 1, 1, 1,
0.4195268, 1.170234, 0.5921031, 1, 1, 1, 1, 1,
0.4247643, -0.582554, 1.28775, 1, 1, 1, 1, 1,
0.4268366, -0.2850805, 2.909927, 1, 1, 1, 1, 1,
0.4315385, -1.298862, 3.463233, 1, 1, 1, 1, 1,
0.4386335, -1.549186, 2.542447, 1, 1, 1, 1, 1,
0.4419479, -2.131839, 3.453091, 1, 1, 1, 1, 1,
0.4467294, 0.1121442, 1.4243, 1, 1, 1, 1, 1,
0.4534885, -0.5324588, 1.847033, 1, 1, 1, 1, 1,
0.4561522, 0.5042481, -2.386461, 1, 1, 1, 1, 1,
0.4633104, 0.3095005, 2.890473, 1, 1, 1, 1, 1,
0.4645632, -2.127421, 2.809432, 1, 1, 1, 1, 1,
0.4645956, -0.6222228, 3.400798, 1, 1, 1, 1, 1,
0.4655381, -0.2835693, 3.889703, 0, 0, 1, 1, 1,
0.4662425, 0.1847823, 0.08790401, 1, 0, 0, 1, 1,
0.4673139, 1.37102, 0.205304, 1, 0, 0, 1, 1,
0.4674881, -0.1916441, 2.945022, 1, 0, 0, 1, 1,
0.4734611, -0.6770177, 2.139866, 1, 0, 0, 1, 1,
0.479119, -0.9363558, 2.83234, 1, 0, 0, 1, 1,
0.4819788, -0.1234933, 3.492192, 0, 0, 0, 1, 1,
0.484685, 0.5323985, 1.409585, 0, 0, 0, 1, 1,
0.4868706, -0.1352989, 1.576235, 0, 0, 0, 1, 1,
0.4896551, -0.1628292, 3.697042, 0, 0, 0, 1, 1,
0.4934289, 1.20539, 0.1800792, 0, 0, 0, 1, 1,
0.4949994, -0.4846123, 2.833768, 0, 0, 0, 1, 1,
0.4967123, -1.035175, 2.435263, 0, 0, 0, 1, 1,
0.5040748, -0.03334864, -0.1129001, 1, 1, 1, 1, 1,
0.5045629, 0.4219916, 0.7228608, 1, 1, 1, 1, 1,
0.5076899, -0.7275341, 0.3868393, 1, 1, 1, 1, 1,
0.5174015, 0.3038665, 0.3298487, 1, 1, 1, 1, 1,
0.5185456, -0.811395, 1.224247, 1, 1, 1, 1, 1,
0.5210328, -0.5572056, 0.5402233, 1, 1, 1, 1, 1,
0.5226093, -2.097704, 3.074592, 1, 1, 1, 1, 1,
0.5295725, -0.60602, 4.141831, 1, 1, 1, 1, 1,
0.5335822, -0.4792162, 2.214532, 1, 1, 1, 1, 1,
0.5339077, 2.74655, 0.4004372, 1, 1, 1, 1, 1,
0.5345879, -0.5578552, 1.977887, 1, 1, 1, 1, 1,
0.535835, 0.4559977, 0.9115098, 1, 1, 1, 1, 1,
0.5358366, -0.08476968, 1.655286, 1, 1, 1, 1, 1,
0.5362958, 0.2934, 0.2965438, 1, 1, 1, 1, 1,
0.5371147, -0.4960096, 3.231023, 1, 1, 1, 1, 1,
0.5393095, -0.0212565, 1.633998, 0, 0, 1, 1, 1,
0.5404481, -0.918391, 3.952585, 1, 0, 0, 1, 1,
0.5457909, -0.4020863, 1.672565, 1, 0, 0, 1, 1,
0.5475905, -1.398481, 3.682214, 1, 0, 0, 1, 1,
0.5480875, 0.4177299, -0.966387, 1, 0, 0, 1, 1,
0.5516818, 0.8911234, 0.6694463, 1, 0, 0, 1, 1,
0.5541903, 0.3105467, 1.651324, 0, 0, 0, 1, 1,
0.5550748, -0.4918076, 1.703126, 0, 0, 0, 1, 1,
0.5559652, -0.9679726, 1.874015, 0, 0, 0, 1, 1,
0.5562426, 0.8595369, -0.4184879, 0, 0, 0, 1, 1,
0.5568307, -0.9840797, 1.950242, 0, 0, 0, 1, 1,
0.5599009, -1.331753, 2.897438, 0, 0, 0, 1, 1,
0.5619314, 0.0786727, 1.611394, 0, 0, 0, 1, 1,
0.564293, -0.05469499, 0.3130517, 1, 1, 1, 1, 1,
0.5644922, -1.070227, 2.429477, 1, 1, 1, 1, 1,
0.5660267, -0.5547727, 3.835925, 1, 1, 1, 1, 1,
0.5705746, -0.7234386, 0.8668724, 1, 1, 1, 1, 1,
0.5821814, 0.4164284, 0.285608, 1, 1, 1, 1, 1,
0.5868043, -0.6522139, 2.493504, 1, 1, 1, 1, 1,
0.5889774, 0.3234566, 0.4701813, 1, 1, 1, 1, 1,
0.6029973, 0.5153621, 0.8719798, 1, 1, 1, 1, 1,
0.6089095, -1.04435, 4.157277, 1, 1, 1, 1, 1,
0.6125684, -0.6965735, 2.258642, 1, 1, 1, 1, 1,
0.6200263, -1.600562, 2.366699, 1, 1, 1, 1, 1,
0.6202406, 1.854896, 1.425983, 1, 1, 1, 1, 1,
0.620712, -1.154184, 0.2125956, 1, 1, 1, 1, 1,
0.6258151, 0.1494115, 3.323134, 1, 1, 1, 1, 1,
0.6332307, -0.6515906, 2.006465, 1, 1, 1, 1, 1,
0.6339441, -0.7656699, -0.1775713, 0, 0, 1, 1, 1,
0.6369287, 0.3091601, 0.4767149, 1, 0, 0, 1, 1,
0.6392811, 1.209198, 1.601472, 1, 0, 0, 1, 1,
0.6454282, -0.4641986, 2.104363, 1, 0, 0, 1, 1,
0.6484275, -0.3938582, 2.878652, 1, 0, 0, 1, 1,
0.6490641, -1.639992, 3.497691, 1, 0, 0, 1, 1,
0.6541228, -1.198619, 3.248877, 0, 0, 0, 1, 1,
0.6548228, 0.4723334, -1.556221, 0, 0, 0, 1, 1,
0.6555718, -1.825943, 2.262298, 0, 0, 0, 1, 1,
0.6574884, -1.84569, 2.506319, 0, 0, 0, 1, 1,
0.6608767, -0.2817052, 4.057775, 0, 0, 0, 1, 1,
0.6644082, -1.855493, 1.500286, 0, 0, 0, 1, 1,
0.6653863, -1.561595, 1.621861, 0, 0, 0, 1, 1,
0.6664527, 0.1579913, 0.4720161, 1, 1, 1, 1, 1,
0.6667183, 1.078335, -0.8309519, 1, 1, 1, 1, 1,
0.6675754, 0.07320483, 2.075135, 1, 1, 1, 1, 1,
0.6720142, 0.2497232, 2.254068, 1, 1, 1, 1, 1,
0.6734545, 1.080594, -0.2491366, 1, 1, 1, 1, 1,
0.6739821, -0.8000712, 3.341684, 1, 1, 1, 1, 1,
0.6783916, 0.3094185, -0.4033551, 1, 1, 1, 1, 1,
0.6855541, 1.934428, 0.2807936, 1, 1, 1, 1, 1,
0.692423, 0.1231825, 1.526446, 1, 1, 1, 1, 1,
0.6942612, -0.1493855, 2.386668, 1, 1, 1, 1, 1,
0.7032552, 0.4708775, 1.752512, 1, 1, 1, 1, 1,
0.7055189, -0.5165495, 2.477495, 1, 1, 1, 1, 1,
0.7073359, 0.2677549, 2.439964, 1, 1, 1, 1, 1,
0.7076519, 0.2502213, 1.360385, 1, 1, 1, 1, 1,
0.709729, -2.455665, 1.324154, 1, 1, 1, 1, 1,
0.7114588, -0.246012, 1.526759, 0, 0, 1, 1, 1,
0.7114714, -1.084443, 4.299444, 1, 0, 0, 1, 1,
0.7124518, -0.1901758, 0.8826023, 1, 0, 0, 1, 1,
0.7176976, 2.118982, -0.5699145, 1, 0, 0, 1, 1,
0.7204497, -2.096769, 2.755538, 1, 0, 0, 1, 1,
0.7222363, -1.662307, 3.261813, 1, 0, 0, 1, 1,
0.7270279, -0.3809401, 2.762633, 0, 0, 0, 1, 1,
0.730454, 0.2842699, 1.026282, 0, 0, 0, 1, 1,
0.7330094, 0.9474998, 2.258353, 0, 0, 0, 1, 1,
0.7342505, -0.4157809, 2.591333, 0, 0, 0, 1, 1,
0.735604, 0.3551417, 2.891539, 0, 0, 0, 1, 1,
0.7374805, 0.7303901, 0.6792156, 0, 0, 0, 1, 1,
0.7395026, 0.02514074, 0.03116863, 0, 0, 0, 1, 1,
0.7430706, -0.2152563, 0.5969419, 1, 1, 1, 1, 1,
0.7466168, -1.750191, 4.052247, 1, 1, 1, 1, 1,
0.7487667, 0.2205153, 0.9864552, 1, 1, 1, 1, 1,
0.7546969, 0.07219148, 3.0217, 1, 1, 1, 1, 1,
0.7566537, -1.955738, 3.161751, 1, 1, 1, 1, 1,
0.7618745, 1.186521, 0.8134308, 1, 1, 1, 1, 1,
0.7628957, -0.4910456, 3.454549, 1, 1, 1, 1, 1,
0.7659565, -0.4892244, 1.910183, 1, 1, 1, 1, 1,
0.7714731, -0.4145348, 2.159372, 1, 1, 1, 1, 1,
0.7743342, -3.021186, 1.519467, 1, 1, 1, 1, 1,
0.7795613, -0.3069077, 3.335392, 1, 1, 1, 1, 1,
0.7814297, 0.0678464, -0.04052281, 1, 1, 1, 1, 1,
0.7851601, -0.2385503, 0.9288158, 1, 1, 1, 1, 1,
0.7871758, -2.746589, 3.227713, 1, 1, 1, 1, 1,
0.7921097, -0.4105546, 1.065361, 1, 1, 1, 1, 1,
0.7981107, 0.01663233, 1.824829, 0, 0, 1, 1, 1,
0.8074142, -0.102756, 2.662328, 1, 0, 0, 1, 1,
0.8087263, 0.6426474, 2.102046, 1, 0, 0, 1, 1,
0.8145833, -0.1371651, 1.917304, 1, 0, 0, 1, 1,
0.8165208, 0.6789972, 1.001311, 1, 0, 0, 1, 1,
0.8242561, -0.05975793, 2.013742, 1, 0, 0, 1, 1,
0.826272, 0.1548102, 0.5996476, 0, 0, 0, 1, 1,
0.8302787, -0.8797671, 1.54873, 0, 0, 0, 1, 1,
0.8304835, 0.9355963, -0.2265264, 0, 0, 0, 1, 1,
0.8344344, 0.6437852, 0.1505146, 0, 0, 0, 1, 1,
0.8356003, -0.719324, 2.678832, 0, 0, 0, 1, 1,
0.8415384, 1.742921, -0.1783393, 0, 0, 0, 1, 1,
0.8465007, 0.8123393, -0.06705344, 0, 0, 0, 1, 1,
0.8577537, 1.156762, 1.187649, 1, 1, 1, 1, 1,
0.8605589, 0.580346, 1.379041, 1, 1, 1, 1, 1,
0.8605843, 0.3600865, 1.270502, 1, 1, 1, 1, 1,
0.8608091, -0.4998239, 3.346748, 1, 1, 1, 1, 1,
0.8644963, 0.4960688, -0.4738061, 1, 1, 1, 1, 1,
0.8773179, -0.3692031, 0.763126, 1, 1, 1, 1, 1,
0.8828511, 1.093454, 0.7672548, 1, 1, 1, 1, 1,
0.8912664, 1.340085, -0.8464814, 1, 1, 1, 1, 1,
0.8941855, -0.5024546, 2.36279, 1, 1, 1, 1, 1,
0.8946477, 0.5040574, 2.898275, 1, 1, 1, 1, 1,
0.9005466, 0.3934328, 2.725634, 1, 1, 1, 1, 1,
0.9006314, -0.551285, 2.519999, 1, 1, 1, 1, 1,
0.9022015, 2.018348, 1.117332, 1, 1, 1, 1, 1,
0.9033267, -0.3563763, 1.17249, 1, 1, 1, 1, 1,
0.9094558, 0.09600598, 2.646766, 1, 1, 1, 1, 1,
0.9133765, -0.3263129, 5.666106, 0, 0, 1, 1, 1,
0.9156337, 1.815013, -0.5331194, 1, 0, 0, 1, 1,
0.9335059, 1.224409, 3.326607, 1, 0, 0, 1, 1,
0.935041, -0.05224082, 2.947557, 1, 0, 0, 1, 1,
0.9359059, 0.5047049, -0.5499554, 1, 0, 0, 1, 1,
0.9376764, 1.425893, 1.069566, 1, 0, 0, 1, 1,
0.9476337, 1.075673, 0.637067, 0, 0, 0, 1, 1,
0.986561, -0.09973949, 1.865603, 0, 0, 0, 1, 1,
0.9878523, 0.1521772, 0.7100057, 0, 0, 0, 1, 1,
1.001507, -0.3057276, 2.448329, 0, 0, 0, 1, 1,
1.001674, -0.9667903, 2.3197, 0, 0, 0, 1, 1,
1.005413, 0.6907763, 0.9872286, 0, 0, 0, 1, 1,
1.008234, -0.839893, 2.638309, 0, 0, 0, 1, 1,
1.008406, -0.1477913, 0.668431, 1, 1, 1, 1, 1,
1.014551, 0.2927745, 0.3680143, 1, 1, 1, 1, 1,
1.033934, 0.8957879, 2.181084, 1, 1, 1, 1, 1,
1.034252, -1.898126, 2.122567, 1, 1, 1, 1, 1,
1.037294, 0.5852131, 1.767882, 1, 1, 1, 1, 1,
1.0431, -0.2424418, 3.442029, 1, 1, 1, 1, 1,
1.048738, -1.241798, 2.011721, 1, 1, 1, 1, 1,
1.053471, -0.6382975, 3.368322, 1, 1, 1, 1, 1,
1.060947, -0.2652135, 1.013865, 1, 1, 1, 1, 1,
1.064221, -0.1153316, 2.699795, 1, 1, 1, 1, 1,
1.065526, 1.048239, -0.8780699, 1, 1, 1, 1, 1,
1.082337, 0.01999869, 3.295052, 1, 1, 1, 1, 1,
1.107811, -2.714907, 3.808016, 1, 1, 1, 1, 1,
1.111439, 1.403193, 0.5967324, 1, 1, 1, 1, 1,
1.112645, -0.2534447, 2.222493, 1, 1, 1, 1, 1,
1.113965, 2.316073, -0.932153, 0, 0, 1, 1, 1,
1.117783, 0.459943, -0.2748151, 1, 0, 0, 1, 1,
1.124004, 0.115041, -1.324873, 1, 0, 0, 1, 1,
1.1242, -0.6536059, 1.885711, 1, 0, 0, 1, 1,
1.124336, -1.417513, 4.031846, 1, 0, 0, 1, 1,
1.126194, -0.005837569, 1.242946, 1, 0, 0, 1, 1,
1.128496, 2.308971, 0.8270874, 0, 0, 0, 1, 1,
1.133032, 0.2376626, 0.8224573, 0, 0, 0, 1, 1,
1.136016, -0.140727, 0.3103255, 0, 0, 0, 1, 1,
1.148088, -0.8967081, 2.135066, 0, 0, 0, 1, 1,
1.150441, -0.1759817, 0.8293756, 0, 0, 0, 1, 1,
1.154159, 0.9898987, 2.223456, 0, 0, 0, 1, 1,
1.162796, -1.775234, 2.490151, 0, 0, 0, 1, 1,
1.163732, 1.769915, -0.1506315, 1, 1, 1, 1, 1,
1.184549, 0.967259, 0.4455297, 1, 1, 1, 1, 1,
1.185766, -0.6091235, 1.830598, 1, 1, 1, 1, 1,
1.191432, -1.591637, 3.155316, 1, 1, 1, 1, 1,
1.194892, -0.6536703, 4.10923, 1, 1, 1, 1, 1,
1.197614, -1.667827, 1.676359, 1, 1, 1, 1, 1,
1.201864, -0.2430155, 0.4722585, 1, 1, 1, 1, 1,
1.204192, -1.202319, 1.102468, 1, 1, 1, 1, 1,
1.204345, -1.019762, 2.337246, 1, 1, 1, 1, 1,
1.210555, 1.77231, 1.069449, 1, 1, 1, 1, 1,
1.210712, -0.4324299, 2.169988, 1, 1, 1, 1, 1,
1.215564, 0.009246754, 0.3152319, 1, 1, 1, 1, 1,
1.226559, 0.5369586, -0.01241768, 1, 1, 1, 1, 1,
1.228206, -1.195069, 3.726214, 1, 1, 1, 1, 1,
1.23905, 1.525773, 2.73318, 1, 1, 1, 1, 1,
1.242945, 0.527428, 1.140781, 0, 0, 1, 1, 1,
1.243459, 0.309259, 3.632208, 1, 0, 0, 1, 1,
1.245619, -2.256507, 2.996058, 1, 0, 0, 1, 1,
1.2462, 2.57817, 0.03686166, 1, 0, 0, 1, 1,
1.2474, 1.65389, -1.038887, 1, 0, 0, 1, 1,
1.256032, -0.9965684, 1.087018, 1, 0, 0, 1, 1,
1.256478, 1.093113, 0.01486783, 0, 0, 0, 1, 1,
1.263368, 0.9100677, 0.9176487, 0, 0, 0, 1, 1,
1.266199, 1.027915, 0.02664477, 0, 0, 0, 1, 1,
1.267391, 0.7385448, 1.711343, 0, 0, 0, 1, 1,
1.273789, -0.3985755, 2.811723, 0, 0, 0, 1, 1,
1.285205, 0.6617512, 2.257851, 0, 0, 0, 1, 1,
1.287839, 1.206018, 0.4445156, 0, 0, 0, 1, 1,
1.312565, 1.057911, 2.596164, 1, 1, 1, 1, 1,
1.313665, 0.3335764, 1.165578, 1, 1, 1, 1, 1,
1.317774, -0.5885466, 2.258409, 1, 1, 1, 1, 1,
1.32072, 1.071966, 2.180187, 1, 1, 1, 1, 1,
1.339897, -0.5118921, 2.136607, 1, 1, 1, 1, 1,
1.342257, -0.6134323, 2.80969, 1, 1, 1, 1, 1,
1.350538, -1.944816, 0.2530445, 1, 1, 1, 1, 1,
1.357837, -0.2997, 1.062124, 1, 1, 1, 1, 1,
1.363647, -0.6156809, 2.346844, 1, 1, 1, 1, 1,
1.36487, -0.3068169, 2.740494, 1, 1, 1, 1, 1,
1.379031, -0.3819914, 1.377149, 1, 1, 1, 1, 1,
1.383461, -0.05157188, 2.96625, 1, 1, 1, 1, 1,
1.389697, -0.7405316, 1.476585, 1, 1, 1, 1, 1,
1.392206, -0.3557544, 0.835282, 1, 1, 1, 1, 1,
1.395361, -0.1047969, 3.032384, 1, 1, 1, 1, 1,
1.403256, -1.911274, 4.046542, 0, 0, 1, 1, 1,
1.405062, 1.959133, 1.739085, 1, 0, 0, 1, 1,
1.416535, -0.5037733, 1.886468, 1, 0, 0, 1, 1,
1.423742, -0.2463465, 0.783422, 1, 0, 0, 1, 1,
1.426708, -1.177871, 1.015608, 1, 0, 0, 1, 1,
1.431493, -1.256879, 2.734826, 1, 0, 0, 1, 1,
1.438957, 0.06223714, 1.964633, 0, 0, 0, 1, 1,
1.442907, -0.5673552, 2.642393, 0, 0, 0, 1, 1,
1.459117, -0.8817533, 1.218173, 0, 0, 0, 1, 1,
1.460153, -2.273267, 3.576007, 0, 0, 0, 1, 1,
1.46953, -0.03739861, 0.3291109, 0, 0, 0, 1, 1,
1.47905, 0.9129351, -0.4341239, 0, 0, 0, 1, 1,
1.481794, -1.47556, 3.08808, 0, 0, 0, 1, 1,
1.499765, 0.7396298, 1.82917, 1, 1, 1, 1, 1,
1.504796, 1.827688, -0.2389918, 1, 1, 1, 1, 1,
1.511207, -1.953681, 1.457797, 1, 1, 1, 1, 1,
1.519093, 0.4509507, -1.826142, 1, 1, 1, 1, 1,
1.531688, -1.291779, 4.09292, 1, 1, 1, 1, 1,
1.537897, 0.8748741, 0.7397588, 1, 1, 1, 1, 1,
1.544416, 1.232629, -0.2359735, 1, 1, 1, 1, 1,
1.546266, -0.2734512, 1.266682, 1, 1, 1, 1, 1,
1.552508, -0.1535333, -0.8670093, 1, 1, 1, 1, 1,
1.553042, 0.0167633, 2.595251, 1, 1, 1, 1, 1,
1.553431, 0.8957315, 1.965104, 1, 1, 1, 1, 1,
1.55542, 0.4002414, 1.287173, 1, 1, 1, 1, 1,
1.555459, -0.000731727, 1.655242, 1, 1, 1, 1, 1,
1.56307, -0.3515854, 1.317101, 1, 1, 1, 1, 1,
1.563344, -1.037934, 1.04496, 1, 1, 1, 1, 1,
1.574964, -0.2208134, 1.620051, 0, 0, 1, 1, 1,
1.579978, 0.9615099, 1.182335, 1, 0, 0, 1, 1,
1.580173, 0.3303463, 0.685239, 1, 0, 0, 1, 1,
1.583408, 1.135784, 1.879847, 1, 0, 0, 1, 1,
1.611644, 1.568319, 1.14286, 1, 0, 0, 1, 1,
1.618437, -2.100317, 1.387895, 1, 0, 0, 1, 1,
1.640667, 0.3548445, 0.6361907, 0, 0, 0, 1, 1,
1.664068, -0.2863243, 1.796005, 0, 0, 0, 1, 1,
1.665717, 0.4845169, 1.00836, 0, 0, 0, 1, 1,
1.674722, 0.2641913, 1.7216, 0, 0, 0, 1, 1,
1.675376, 0.3474331, 1.960911, 0, 0, 0, 1, 1,
1.680364, -2.816689, 2.512786, 0, 0, 0, 1, 1,
1.695847, -0.5033706, 0.7953094, 0, 0, 0, 1, 1,
1.715525, -0.5335198, 1.524559, 1, 1, 1, 1, 1,
1.720832, -0.8006844, 0.1045256, 1, 1, 1, 1, 1,
1.722154, 0.4602574, -0.2842091, 1, 1, 1, 1, 1,
1.726645, 1.448133, -0.8278675, 1, 1, 1, 1, 1,
1.731922, -1.266663, 0.8314774, 1, 1, 1, 1, 1,
1.769924, -0.009696274, 1.18579, 1, 1, 1, 1, 1,
1.784913, -1.031612, -0.1161903, 1, 1, 1, 1, 1,
1.791653, -0.5469655, 2.741571, 1, 1, 1, 1, 1,
1.798065, 1.193981, 1.663478, 1, 1, 1, 1, 1,
1.838895, -0.5693957, 2.332098, 1, 1, 1, 1, 1,
1.905144, -1.533567, 3.408977, 1, 1, 1, 1, 1,
1.908097, -1.217266, 3.116632, 1, 1, 1, 1, 1,
1.991114, -1.589346, 1.451283, 1, 1, 1, 1, 1,
1.994227, 0.3918331, 2.255527, 1, 1, 1, 1, 1,
1.996768, 2.102427, 0.6044681, 1, 1, 1, 1, 1,
2.004456, -0.6463666, 1.383064, 0, 0, 1, 1, 1,
2.034063, 0.8637955, -0.3680713, 1, 0, 0, 1, 1,
2.035755, 0.2036008, 1.908752, 1, 0, 0, 1, 1,
2.073484, -0.7368416, 0.7059857, 1, 0, 0, 1, 1,
2.087763, 0.02878874, 2.384299, 1, 0, 0, 1, 1,
2.092466, -0.252566, 2.082162, 1, 0, 0, 1, 1,
2.138021, 0.2769681, 1.57214, 0, 0, 0, 1, 1,
2.143455, 0.1594045, 2.319903, 0, 0, 0, 1, 1,
2.182809, -0.1493351, 1.59538, 0, 0, 0, 1, 1,
2.193694, -2.017898, 3.444412, 0, 0, 0, 1, 1,
2.194644, -0.2678999, 2.916732, 0, 0, 0, 1, 1,
2.197919, -0.7771641, 1.383895, 0, 0, 0, 1, 1,
2.248159, -0.3294105, 0.7669356, 0, 0, 0, 1, 1,
2.255762, -1.417168, 1.759258, 1, 1, 1, 1, 1,
2.259904, 1.163671, 1.863238, 1, 1, 1, 1, 1,
2.268483, 0.6175441, 2.022493, 1, 1, 1, 1, 1,
2.388706, 0.3568336, 3.079138, 1, 1, 1, 1, 1,
2.692337, -1.34095, 1.866834, 1, 1, 1, 1, 1,
2.723364, -0.4923849, 2.446703, 1, 1, 1, 1, 1,
2.815952, -0.4632008, 1.330586, 1, 1, 1, 1, 1
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
var radius = 9.724241;
var distance = 34.15599;
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
mvMatrix.translate( 0.02034831, 0.4958518, -0.3550808 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15599);
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
