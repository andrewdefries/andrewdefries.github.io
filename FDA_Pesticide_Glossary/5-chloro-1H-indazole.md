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
-3.326751, 0.5612729, -0.2258578, 1, 0, 0, 1,
-2.903014, 0.6677077, -0.6208793, 1, 0.007843138, 0, 1,
-2.889255, 0.2290527, -0.7007599, 1, 0.01176471, 0, 1,
-2.696943, -0.9864961, -2.015192, 1, 0.01960784, 0, 1,
-2.694463, 0.2447745, -2.120572, 1, 0.02352941, 0, 1,
-2.633413, 0.8393848, -2.881671, 1, 0.03137255, 0, 1,
-2.630976, -0.5360778, -0.5863464, 1, 0.03529412, 0, 1,
-2.570407, 0.02825131, -2.145895, 1, 0.04313726, 0, 1,
-2.557792, -0.2522032, -1.765254, 1, 0.04705882, 0, 1,
-2.490347, -0.3358297, -0.7289732, 1, 0.05490196, 0, 1,
-2.453255, -0.923559, -1.943402, 1, 0.05882353, 0, 1,
-2.401645, -0.4258092, -1.160885, 1, 0.06666667, 0, 1,
-2.381172, -1.331239, -2.427711, 1, 0.07058824, 0, 1,
-2.374894, 0.6957833, -3.646219, 1, 0.07843138, 0, 1,
-2.34448, 1.554043, -1.011659, 1, 0.08235294, 0, 1,
-2.242033, -1.1621, -2.857853, 1, 0.09019608, 0, 1,
-2.197357, 0.7335776, -1.335999, 1, 0.09411765, 0, 1,
-2.139414, -1.295303, -1.00144, 1, 0.1019608, 0, 1,
-2.111671, 0.007009858, -2.064067, 1, 0.1098039, 0, 1,
-2.106629, -1.581052, -1.971062, 1, 0.1137255, 0, 1,
-2.074089, 0.430504, -1.276455, 1, 0.1215686, 0, 1,
-2.059304, -0.5983211, -1.515638, 1, 0.1254902, 0, 1,
-2.050769, 0.3905647, -2.502401, 1, 0.1333333, 0, 1,
-2.048191, 1.114413, 1.547938, 1, 0.1372549, 0, 1,
-2.047568, -0.1128638, -1.626246, 1, 0.145098, 0, 1,
-2.038351, -1.472663, -4.060589, 1, 0.1490196, 0, 1,
-2.006965, -0.6338876, -2.945734, 1, 0.1568628, 0, 1,
-1.978044, -0.624374, -1.749112, 1, 0.1607843, 0, 1,
-1.948767, -1.518432, -0.7558746, 1, 0.1686275, 0, 1,
-1.924205, -0.6355802, -2.278206, 1, 0.172549, 0, 1,
-1.922686, 0.8758849, -0.8762608, 1, 0.1803922, 0, 1,
-1.825955, -1.08525, -1.820761, 1, 0.1843137, 0, 1,
-1.820937, 1.767858, 0.9987459, 1, 0.1921569, 0, 1,
-1.812876, 0.4453012, -0.824329, 1, 0.1960784, 0, 1,
-1.797698, 0.1549748, -0.9999671, 1, 0.2039216, 0, 1,
-1.789023, -0.7306779, -2.426222, 1, 0.2117647, 0, 1,
-1.787481, -2.353807, -1.660876, 1, 0.2156863, 0, 1,
-1.756, 0.8517244, 0.3809105, 1, 0.2235294, 0, 1,
-1.743353, 0.05416388, -2.244506, 1, 0.227451, 0, 1,
-1.741058, 0.5303478, -1.877932, 1, 0.2352941, 0, 1,
-1.724476, -0.7565358, -0.6416069, 1, 0.2392157, 0, 1,
-1.716307, 0.0106354, 0.3436247, 1, 0.2470588, 0, 1,
-1.713093, -1.191278, -3.169515, 1, 0.2509804, 0, 1,
-1.703592, -1.093719, -1.107879, 1, 0.2588235, 0, 1,
-1.691171, 0.2122646, -0.05566383, 1, 0.2627451, 0, 1,
-1.663777, 1.652792, -1.828418, 1, 0.2705882, 0, 1,
-1.658077, 0.8354593, -1.251387, 1, 0.2745098, 0, 1,
-1.656064, -0.6169194, -1.202554, 1, 0.282353, 0, 1,
-1.643624, -0.06293432, -0.9145357, 1, 0.2862745, 0, 1,
-1.63738, -0.3187873, -1.258508, 1, 0.2941177, 0, 1,
-1.632052, -0.7176315, -1.729662, 1, 0.3019608, 0, 1,
-1.592131, -0.1454188, -3.121904, 1, 0.3058824, 0, 1,
-1.583984, 0.758119, -2.27183, 1, 0.3137255, 0, 1,
-1.579896, 0.8813226, -0.6726016, 1, 0.3176471, 0, 1,
-1.573595, 0.6993697, -0.3503874, 1, 0.3254902, 0, 1,
-1.5733, -0.2561378, -2.00048, 1, 0.3294118, 0, 1,
-1.570119, 2.164434, -2.43468, 1, 0.3372549, 0, 1,
-1.569431, -0.4136312, -0.7549029, 1, 0.3411765, 0, 1,
-1.568059, 1.224331, -2.560144, 1, 0.3490196, 0, 1,
-1.56373, 0.7520519, -1.751563, 1, 0.3529412, 0, 1,
-1.563551, -2.074595, -2.89587, 1, 0.3607843, 0, 1,
-1.563153, -0.1885834, -1.316293, 1, 0.3647059, 0, 1,
-1.544025, -0.3062092, -2.580129, 1, 0.372549, 0, 1,
-1.541718, -0.973922, -2.188366, 1, 0.3764706, 0, 1,
-1.5389, 0.7296156, -1.88665, 1, 0.3843137, 0, 1,
-1.535951, 1.226827, -1.115369, 1, 0.3882353, 0, 1,
-1.52505, 0.09574901, -0.8095896, 1, 0.3960784, 0, 1,
-1.509298, -0.07412515, -3.736179, 1, 0.4039216, 0, 1,
-1.50444, 1.193232, -0.8681412, 1, 0.4078431, 0, 1,
-1.501436, -0.619925, -1.818042, 1, 0.4156863, 0, 1,
-1.497784, -0.2313628, -2.948091, 1, 0.4196078, 0, 1,
-1.488945, 0.4814859, -1.032131, 1, 0.427451, 0, 1,
-1.46395, -0.419656, -1.659805, 1, 0.4313726, 0, 1,
-1.438942, 1.929948, 0.1051488, 1, 0.4392157, 0, 1,
-1.438703, -0.5142735, -1.761298, 1, 0.4431373, 0, 1,
-1.438194, -0.6858026, -2.056273, 1, 0.4509804, 0, 1,
-1.434973, -2.062898, -3.783114, 1, 0.454902, 0, 1,
-1.428061, 0.8693183, -2.492364, 1, 0.4627451, 0, 1,
-1.426028, 1.089881, -2.199685, 1, 0.4666667, 0, 1,
-1.420438, -0.5470417, -0.5016662, 1, 0.4745098, 0, 1,
-1.398225, -0.2884195, -2.830982, 1, 0.4784314, 0, 1,
-1.398205, 0.6128324, -0.4501565, 1, 0.4862745, 0, 1,
-1.395283, 0.1575174, -1.24029, 1, 0.4901961, 0, 1,
-1.373034, -1.335087, -2.234495, 1, 0.4980392, 0, 1,
-1.369735, -1.779754, -2.894154, 1, 0.5058824, 0, 1,
-1.352481, 1.436242, -1.736661, 1, 0.509804, 0, 1,
-1.351679, -0.4596339, -0.512831, 1, 0.5176471, 0, 1,
-1.338598, -0.04614541, -2.866655, 1, 0.5215687, 0, 1,
-1.32593, 0.01332055, 0.371237, 1, 0.5294118, 0, 1,
-1.306831, 0.3850925, -3.505306, 1, 0.5333334, 0, 1,
-1.296792, 0.2244797, -2.084864, 1, 0.5411765, 0, 1,
-1.294248, 0.3082353, -2.41447, 1, 0.5450981, 0, 1,
-1.286156, -0.1696751, 0.6650621, 1, 0.5529412, 0, 1,
-1.283854, 0.3114111, -1.065384, 1, 0.5568628, 0, 1,
-1.277922, 1.019398, -1.34211, 1, 0.5647059, 0, 1,
-1.276497, 0.1785038, -2.142678, 1, 0.5686275, 0, 1,
-1.275915, 0.0217664, -1.736541, 1, 0.5764706, 0, 1,
-1.271439, -0.6286281, -1.942369, 1, 0.5803922, 0, 1,
-1.271401, -0.6817394, -0.9358439, 1, 0.5882353, 0, 1,
-1.269552, 0.9613459, -0.8421686, 1, 0.5921569, 0, 1,
-1.258469, 1.08059, -0.6300899, 1, 0.6, 0, 1,
-1.252939, 0.8125222, -0.6707148, 1, 0.6078432, 0, 1,
-1.248811, 0.1999452, -2.502341, 1, 0.6117647, 0, 1,
-1.248526, 1.024493, -1.773314, 1, 0.6196079, 0, 1,
-1.240267, 0.2715558, -0.6160392, 1, 0.6235294, 0, 1,
-1.239674, -0.2032014, -0.519155, 1, 0.6313726, 0, 1,
-1.234022, -0.2647692, -2.427122, 1, 0.6352941, 0, 1,
-1.228476, -0.2108227, -1.001626, 1, 0.6431373, 0, 1,
-1.227803, -0.6897547, -1.683209, 1, 0.6470588, 0, 1,
-1.225984, 0.5616409, -1.722762, 1, 0.654902, 0, 1,
-1.222157, -0.5622883, -1.330017, 1, 0.6588235, 0, 1,
-1.221668, 0.7682062, -0.2874869, 1, 0.6666667, 0, 1,
-1.221542, 0.2764667, -2.495983, 1, 0.6705883, 0, 1,
-1.220377, -0.9109524, -3.302795, 1, 0.6784314, 0, 1,
-1.217833, -2.356955, -1.713313, 1, 0.682353, 0, 1,
-1.21595, 1.2915, -0.8628828, 1, 0.6901961, 0, 1,
-1.209706, -0.8791835, -2.565896, 1, 0.6941177, 0, 1,
-1.203232, -1.438204, -2.491939, 1, 0.7019608, 0, 1,
-1.189082, -0.3007405, -3.52088, 1, 0.7098039, 0, 1,
-1.181845, -0.2993361, -1.041607, 1, 0.7137255, 0, 1,
-1.174, 1.535272, -1.89965, 1, 0.7215686, 0, 1,
-1.168796, -0.544187, -1.338541, 1, 0.7254902, 0, 1,
-1.167681, 0.176283, -0.7322437, 1, 0.7333333, 0, 1,
-1.166745, -1.582849, -1.363183, 1, 0.7372549, 0, 1,
-1.157814, 1.340471, -0.9417431, 1, 0.7450981, 0, 1,
-1.152628, -1.06961, -1.150255, 1, 0.7490196, 0, 1,
-1.151079, 0.3086948, -2.048592, 1, 0.7568628, 0, 1,
-1.136056, 1.222395, -1.435764, 1, 0.7607843, 0, 1,
-1.125684, -1.257258, -3.279847, 1, 0.7686275, 0, 1,
-1.110497, -0.3864492, -2.401366, 1, 0.772549, 0, 1,
-1.107082, 0.7899984, -0.06150451, 1, 0.7803922, 0, 1,
-1.102519, 0.593231, -2.930975, 1, 0.7843137, 0, 1,
-1.094663, 0.8166305, -0.8938424, 1, 0.7921569, 0, 1,
-1.085287, 0.7945622, -2.250625, 1, 0.7960784, 0, 1,
-1.084436, 1.090752, -2.251933, 1, 0.8039216, 0, 1,
-1.083607, -1.807998, -2.499448, 1, 0.8117647, 0, 1,
-1.082939, 1.166618, 1.961529, 1, 0.8156863, 0, 1,
-1.081702, -0.481345, -4.224103, 1, 0.8235294, 0, 1,
-1.072067, 0.56019, -2.003685, 1, 0.827451, 0, 1,
-1.069624, -1.669488, -1.347721, 1, 0.8352941, 0, 1,
-1.068372, -0.06971306, -2.154442, 1, 0.8392157, 0, 1,
-1.062451, -0.129521, -0.4312111, 1, 0.8470588, 0, 1,
-1.061459, 1.145964, 0.2023526, 1, 0.8509804, 0, 1,
-1.060256, -1.383379, -3.279714, 1, 0.8588235, 0, 1,
-1.059695, 0.09525624, -0.2024729, 1, 0.8627451, 0, 1,
-1.056446, 1.645397, -2.086135, 1, 0.8705882, 0, 1,
-1.05476, 0.6979393, -1.401183, 1, 0.8745098, 0, 1,
-1.054344, 0.3096265, -0.76859, 1, 0.8823529, 0, 1,
-1.050068, -1.155754, -2.314271, 1, 0.8862745, 0, 1,
-1.04454, 2.197353, -1.25861, 1, 0.8941177, 0, 1,
-1.040059, -2.519783, -2.884766, 1, 0.8980392, 0, 1,
-1.026701, 0.3166876, -3.320669, 1, 0.9058824, 0, 1,
-1.006007, 0.533896, -2.070714, 1, 0.9137255, 0, 1,
-0.999967, -0.001298382, -0.9034989, 1, 0.9176471, 0, 1,
-0.9991618, -1.574543, -2.496138, 1, 0.9254902, 0, 1,
-0.998921, 1.770795, -2.400124, 1, 0.9294118, 0, 1,
-0.9981968, 1.712552, -0.7083579, 1, 0.9372549, 0, 1,
-0.9962516, -0.827304, -0.783291, 1, 0.9411765, 0, 1,
-0.994836, -0.8239315, -1.948993, 1, 0.9490196, 0, 1,
-0.9945176, -0.1192995, -2.487695, 1, 0.9529412, 0, 1,
-0.9839322, 0.04881455, -1.257795, 1, 0.9607843, 0, 1,
-0.9830155, 0.1322436, -2.728432, 1, 0.9647059, 0, 1,
-0.9755029, -1.540108, -0.8729969, 1, 0.972549, 0, 1,
-0.974664, -1.356948, -1.632393, 1, 0.9764706, 0, 1,
-0.9741557, 1.184844, -0.5565431, 1, 0.9843137, 0, 1,
-0.9722147, -1.589415, -3.563014, 1, 0.9882353, 0, 1,
-0.9679119, -1.580174, -4.375548, 1, 0.9960784, 0, 1,
-0.9648688, 0.7820325, -1.735009, 0.9960784, 1, 0, 1,
-0.9607677, 0.391435, 0.2218743, 0.9921569, 1, 0, 1,
-0.9539213, -0.005751429, -4.394392, 0.9843137, 1, 0, 1,
-0.9526128, -0.3613788, -1.823145, 0.9803922, 1, 0, 1,
-0.9517785, 0.6307054, -2.414512, 0.972549, 1, 0, 1,
-0.9453904, 0.122312, -0.8911335, 0.9686275, 1, 0, 1,
-0.9443096, -1.007173, -2.450155, 0.9607843, 1, 0, 1,
-0.9436843, -1.51608, -3.379505, 0.9568627, 1, 0, 1,
-0.9416416, -1.729023, -3.180414, 0.9490196, 1, 0, 1,
-0.9409541, 2.012745, -0.619665, 0.945098, 1, 0, 1,
-0.9404781, 1.662122, 0.4006923, 0.9372549, 1, 0, 1,
-0.9241754, 0.02284471, -3.401587, 0.9333333, 1, 0, 1,
-0.9192399, -0.4369579, -0.4547895, 0.9254902, 1, 0, 1,
-0.916614, 1.463536, -1.58739, 0.9215686, 1, 0, 1,
-0.915275, -0.4426314, -1.562803, 0.9137255, 1, 0, 1,
-0.9150276, 1.719578, -2.912889, 0.9098039, 1, 0, 1,
-0.9147879, -0.1337743, -2.44852, 0.9019608, 1, 0, 1,
-0.9052911, -0.1504802, -1.112903, 0.8941177, 1, 0, 1,
-0.9033329, -0.8869191, -3.292527, 0.8901961, 1, 0, 1,
-0.9008361, 1.126626, 0.04962153, 0.8823529, 1, 0, 1,
-0.8950284, -1.388634, -2.936634, 0.8784314, 1, 0, 1,
-0.8936836, -0.8598621, -3.105486, 0.8705882, 1, 0, 1,
-0.8928583, -0.4546332, -2.19564, 0.8666667, 1, 0, 1,
-0.8922071, 1.097055, -0.9415988, 0.8588235, 1, 0, 1,
-0.8909193, 0.7637123, -1.622098, 0.854902, 1, 0, 1,
-0.8882537, 0.6834739, -0.3293077, 0.8470588, 1, 0, 1,
-0.8868923, -0.6840526, -3.662017, 0.8431373, 1, 0, 1,
-0.8682251, -0.9950083, -2.927028, 0.8352941, 1, 0, 1,
-0.86665, 0.5129775, -1.68269, 0.8313726, 1, 0, 1,
-0.8641354, -0.2164709, -2.680361, 0.8235294, 1, 0, 1,
-0.8620817, -1.580401, -2.397743, 0.8196079, 1, 0, 1,
-0.8518195, 1.454721, -0.3208044, 0.8117647, 1, 0, 1,
-0.8512892, -1.416093, -2.0696, 0.8078431, 1, 0, 1,
-0.8490906, -0.6505952, -4.547646, 0.8, 1, 0, 1,
-0.8478107, -1.56773, -1.781999, 0.7921569, 1, 0, 1,
-0.8423682, -0.3754923, -0.8226529, 0.7882353, 1, 0, 1,
-0.8387004, -0.4725021, -2.990164, 0.7803922, 1, 0, 1,
-0.8383265, 1.457374, 0.6870592, 0.7764706, 1, 0, 1,
-0.8322586, 0.9690795, -0.09957797, 0.7686275, 1, 0, 1,
-0.8319124, -1.058851, -1.225167, 0.7647059, 1, 0, 1,
-0.8309, 1.360997, 0.7396393, 0.7568628, 1, 0, 1,
-0.8287493, 0.03203642, -1.222273, 0.7529412, 1, 0, 1,
-0.8285816, 1.011438, -0.4942663, 0.7450981, 1, 0, 1,
-0.8284376, 0.1177133, -1.142953, 0.7411765, 1, 0, 1,
-0.828356, -0.236256, -3.457789, 0.7333333, 1, 0, 1,
-0.8175548, 0.04386128, -1.77083, 0.7294118, 1, 0, 1,
-0.8163664, 2.080658, -0.6765445, 0.7215686, 1, 0, 1,
-0.8025075, -0.6147475, -1.202079, 0.7176471, 1, 0, 1,
-0.7967761, -1.401397, -2.060343, 0.7098039, 1, 0, 1,
-0.795714, -0.388892, -1.643245, 0.7058824, 1, 0, 1,
-0.7884383, -0.1001671, -1.344749, 0.6980392, 1, 0, 1,
-0.7815776, -1.648093, -1.165679, 0.6901961, 1, 0, 1,
-0.776883, -0.567203, -2.108902, 0.6862745, 1, 0, 1,
-0.7766942, 0.2038736, -2.641273, 0.6784314, 1, 0, 1,
-0.7761356, 0.1888426, -1.474289, 0.6745098, 1, 0, 1,
-0.7730407, -1.231603, -1.662025, 0.6666667, 1, 0, 1,
-0.7728963, 0.7597433, -1.601701, 0.6627451, 1, 0, 1,
-0.7725934, -0.1234785, -1.979234, 0.654902, 1, 0, 1,
-0.7720087, 0.6890259, -2.866417, 0.6509804, 1, 0, 1,
-0.7674337, 1.327649, 0.2107187, 0.6431373, 1, 0, 1,
-0.7671732, -0.8968474, -2.651983, 0.6392157, 1, 0, 1,
-0.7628947, -0.3950205, -3.784887, 0.6313726, 1, 0, 1,
-0.7610955, 1.426954, 0.6955505, 0.627451, 1, 0, 1,
-0.7558953, 1.366769, -0.1752401, 0.6196079, 1, 0, 1,
-0.7462595, 0.6410918, -2.355209, 0.6156863, 1, 0, 1,
-0.742251, 1.023159, -1.273017, 0.6078432, 1, 0, 1,
-0.7414714, 0.4795835, -0.5824407, 0.6039216, 1, 0, 1,
-0.7344837, 0.57702, 1.248396, 0.5960785, 1, 0, 1,
-0.7340534, 0.7863625, -1.640606, 0.5882353, 1, 0, 1,
-0.7339748, -0.8537427, -3.335481, 0.5843138, 1, 0, 1,
-0.7332538, 1.059801, -2.414858, 0.5764706, 1, 0, 1,
-0.7305062, -0.8543014, -2.27828, 0.572549, 1, 0, 1,
-0.7287773, -2.909828, -2.236329, 0.5647059, 1, 0, 1,
-0.7199225, 0.39285, -0.3312229, 0.5607843, 1, 0, 1,
-0.7139871, -0.3651789, -1.090825, 0.5529412, 1, 0, 1,
-0.704951, -0.3822635, -1.671459, 0.5490196, 1, 0, 1,
-0.7021223, 0.4102821, -1.286838, 0.5411765, 1, 0, 1,
-0.6996633, -1.003575, -3.26939, 0.5372549, 1, 0, 1,
-0.6949764, -0.4548204, -3.711716, 0.5294118, 1, 0, 1,
-0.6837949, -0.06970941, -2.791548, 0.5254902, 1, 0, 1,
-0.674601, -0.7824541, -2.306405, 0.5176471, 1, 0, 1,
-0.6725802, 0.5524402, -3.228822, 0.5137255, 1, 0, 1,
-0.6714125, -0.308008, -1.782707, 0.5058824, 1, 0, 1,
-0.6643488, -1.432888, -3.643038, 0.5019608, 1, 0, 1,
-0.6567651, 2.123536, 0.6926119, 0.4941176, 1, 0, 1,
-0.6549321, 0.4572067, -2.166506, 0.4862745, 1, 0, 1,
-0.6534075, 0.3135526, -2.249561, 0.4823529, 1, 0, 1,
-0.6499659, 0.4313162, -0.1949729, 0.4745098, 1, 0, 1,
-0.6384818, -1.117064, -1.716129, 0.4705882, 1, 0, 1,
-0.6339418, 1.779765, -0.1168611, 0.4627451, 1, 0, 1,
-0.6317564, 0.368302, -2.751338, 0.4588235, 1, 0, 1,
-0.6301609, 0.09012636, -0.7703975, 0.4509804, 1, 0, 1,
-0.6290544, -1.078825, -2.464798, 0.4470588, 1, 0, 1,
-0.6272232, 1.179269, -1.069791, 0.4392157, 1, 0, 1,
-0.6239599, -0.1287933, -0.5564079, 0.4352941, 1, 0, 1,
-0.6233087, -0.05795728, -0.4730779, 0.427451, 1, 0, 1,
-0.6194611, -0.8679019, -1.424039, 0.4235294, 1, 0, 1,
-0.6192608, -0.5203419, -3.407387, 0.4156863, 1, 0, 1,
-0.6179964, -0.9985892, -3.762743, 0.4117647, 1, 0, 1,
-0.6168633, -1.141082, -3.174115, 0.4039216, 1, 0, 1,
-0.6159844, 0.2519269, -1.720606, 0.3960784, 1, 0, 1,
-0.6153673, -0.4507662, -3.513382, 0.3921569, 1, 0, 1,
-0.6129602, 0.150817, 0.7794961, 0.3843137, 1, 0, 1,
-0.6116723, -0.3058171, -2.214141, 0.3803922, 1, 0, 1,
-0.6101645, -0.07045942, -1.732689, 0.372549, 1, 0, 1,
-0.6065238, -0.0393009, -1.492864, 0.3686275, 1, 0, 1,
-0.6064231, 1.173595, -1.540196, 0.3607843, 1, 0, 1,
-0.6007143, -0.53532, 0.02271115, 0.3568628, 1, 0, 1,
-0.5998228, 0.3723605, -1.163813, 0.3490196, 1, 0, 1,
-0.597295, -0.2850919, -0.2869868, 0.345098, 1, 0, 1,
-0.5971606, -0.8316367, -3.373284, 0.3372549, 1, 0, 1,
-0.5963204, -1.044248, -3.954688, 0.3333333, 1, 0, 1,
-0.5947403, -1.309278, -2.71391, 0.3254902, 1, 0, 1,
-0.5933712, -0.1509808, -1.814938, 0.3215686, 1, 0, 1,
-0.5896157, -0.7528523, -3.99622, 0.3137255, 1, 0, 1,
-0.5814183, 0.6590279, 0.2802031, 0.3098039, 1, 0, 1,
-0.5699827, -0.3326453, 0.07038555, 0.3019608, 1, 0, 1,
-0.5685353, -0.3343637, -2.099395, 0.2941177, 1, 0, 1,
-0.5679975, -1.455127, -3.104856, 0.2901961, 1, 0, 1,
-0.5627945, 1.039793, 0.2061417, 0.282353, 1, 0, 1,
-0.5598097, -0.3385073, -0.136647, 0.2784314, 1, 0, 1,
-0.5594711, 0.7210381, 0.9614488, 0.2705882, 1, 0, 1,
-0.5568405, -0.1155102, -1.39382, 0.2666667, 1, 0, 1,
-0.551127, 0.3118302, -0.7755851, 0.2588235, 1, 0, 1,
-0.5433128, -1.264422, -2.911305, 0.254902, 1, 0, 1,
-0.5428114, -0.7473114, 0.0418223, 0.2470588, 1, 0, 1,
-0.5424581, 0.9014161, -0.7687467, 0.2431373, 1, 0, 1,
-0.5406005, -0.8268273, -1.874241, 0.2352941, 1, 0, 1,
-0.5398372, 1.104943, -0.2664492, 0.2313726, 1, 0, 1,
-0.5348023, -0.7540182, -2.619606, 0.2235294, 1, 0, 1,
-0.5326165, -1.444013, -2.673181, 0.2196078, 1, 0, 1,
-0.5319484, 1.108726, -2.254504, 0.2117647, 1, 0, 1,
-0.5221714, -0.232729, -2.553325, 0.2078431, 1, 0, 1,
-0.5214263, -0.05376364, -2.633199, 0.2, 1, 0, 1,
-0.5171299, 0.5024379, -2.001053, 0.1921569, 1, 0, 1,
-0.514769, -1.07066, -2.141601, 0.1882353, 1, 0, 1,
-0.5099016, -0.8268582, -2.095247, 0.1803922, 1, 0, 1,
-0.5051162, -1.077941, -3.632553, 0.1764706, 1, 0, 1,
-0.5017447, 0.3856081, -2.078166, 0.1686275, 1, 0, 1,
-0.4974295, -0.3766859, -1.576573, 0.1647059, 1, 0, 1,
-0.4929829, -0.9628261, -2.229609, 0.1568628, 1, 0, 1,
-0.4858109, 0.6209714, 0.6075459, 0.1529412, 1, 0, 1,
-0.479075, 0.1827374, -0.04233428, 0.145098, 1, 0, 1,
-0.4754506, 0.08378073, -0.1182035, 0.1411765, 1, 0, 1,
-0.4745815, -0.3163258, -1.709217, 0.1333333, 1, 0, 1,
-0.4662821, 1.34961, 0.5799821, 0.1294118, 1, 0, 1,
-0.4654112, 0.004540538, -1.169202, 0.1215686, 1, 0, 1,
-0.4602028, -0.7764977, -3.222065, 0.1176471, 1, 0, 1,
-0.4574706, -0.1496741, -3.81676, 0.1098039, 1, 0, 1,
-0.4520578, 0.0004694477, -1.793537, 0.1058824, 1, 0, 1,
-0.450151, 2.212185, -0.2159188, 0.09803922, 1, 0, 1,
-0.4499255, -0.6854997, -1.608034, 0.09019608, 1, 0, 1,
-0.446342, -0.3089531, -2.571907, 0.08627451, 1, 0, 1,
-0.4405215, 0.1217888, 0.1457459, 0.07843138, 1, 0, 1,
-0.4371335, -0.7371361, -3.368068, 0.07450981, 1, 0, 1,
-0.4369791, -1.888738, -1.047028, 0.06666667, 1, 0, 1,
-0.4362049, 1.032944, -0.5673098, 0.0627451, 1, 0, 1,
-0.4358678, 1.192635, 0.9161791, 0.05490196, 1, 0, 1,
-0.4340945, -0.6860682, -5.351702, 0.05098039, 1, 0, 1,
-0.4325471, -0.3773802, -2.869754, 0.04313726, 1, 0, 1,
-0.4310989, 0.6242138, -0.446664, 0.03921569, 1, 0, 1,
-0.4278283, -0.06551528, -1.97575, 0.03137255, 1, 0, 1,
-0.4196761, 0.228051, -0.4074832, 0.02745098, 1, 0, 1,
-0.4194961, 0.353651, 0.3015183, 0.01960784, 1, 0, 1,
-0.4182261, 0.4420782, -0.2851981, 0.01568628, 1, 0, 1,
-0.4180282, -1.354066, -2.43381, 0.007843138, 1, 0, 1,
-0.4171907, 0.7203347, -1.52787, 0.003921569, 1, 0, 1,
-0.4166646, -0.4325074, 0.2727481, 0, 1, 0.003921569, 1,
-0.4157134, -0.4205636, -2.035313, 0, 1, 0.01176471, 1,
-0.4139504, -0.9740968, -4.333117, 0, 1, 0.01568628, 1,
-0.4129666, -0.02596063, -1.200651, 0, 1, 0.02352941, 1,
-0.4094757, -1.777588, -2.396979, 0, 1, 0.02745098, 1,
-0.4090002, -1.315935, -2.459589, 0, 1, 0.03529412, 1,
-0.4085545, -0.431513, -0.9806708, 0, 1, 0.03921569, 1,
-0.407385, -0.4683519, -2.455722, 0, 1, 0.04705882, 1,
-0.4039154, 0.6121716, -0.9924864, 0, 1, 0.05098039, 1,
-0.4038637, 0.4376403, -0.6909714, 0, 1, 0.05882353, 1,
-0.4019567, 0.7914354, -0.1874721, 0, 1, 0.0627451, 1,
-0.400227, -0.0003062628, -1.286841, 0, 1, 0.07058824, 1,
-0.398809, -1.350141, -2.736373, 0, 1, 0.07450981, 1,
-0.397051, 0.4958367, -0.7607173, 0, 1, 0.08235294, 1,
-0.3963957, 1.298713, -0.7794708, 0, 1, 0.08627451, 1,
-0.395439, -0.9396955, -3.043611, 0, 1, 0.09411765, 1,
-0.3953785, 1.638737, 0.4781415, 0, 1, 0.1019608, 1,
-0.3947408, -0.1468777, -2.510137, 0, 1, 0.1058824, 1,
-0.394308, 1.465603, 0.5927208, 0, 1, 0.1137255, 1,
-0.3930964, -0.3970968, -3.366432, 0, 1, 0.1176471, 1,
-0.389524, -0.06542383, -1.911744, 0, 1, 0.1254902, 1,
-0.3809237, -1.035543, -2.9032, 0, 1, 0.1294118, 1,
-0.3776417, 0.5944607, -0.3128268, 0, 1, 0.1372549, 1,
-0.3732324, -1.681871, -3.12146, 0, 1, 0.1411765, 1,
-0.3731826, -0.1986522, -1.283794, 0, 1, 0.1490196, 1,
-0.371794, -1.362222, -2.739413, 0, 1, 0.1529412, 1,
-0.3702687, -1.033063, -1.070074, 0, 1, 0.1607843, 1,
-0.3689038, -0.3784245, -4.849286, 0, 1, 0.1647059, 1,
-0.3584733, 1.198111, -0.4720977, 0, 1, 0.172549, 1,
-0.3531338, -0.8257424, -3.062659, 0, 1, 0.1764706, 1,
-0.3496515, 0.9891385, -1.383345, 0, 1, 0.1843137, 1,
-0.3477626, -0.3512338, -2.573822, 0, 1, 0.1882353, 1,
-0.3386539, 0.5926048, -2.16999, 0, 1, 0.1960784, 1,
-0.3349342, -0.3658381, -2.287371, 0, 1, 0.2039216, 1,
-0.3329372, 1.900265, -1.796359, 0, 1, 0.2078431, 1,
-0.3318934, 0.1375728, -2.149418, 0, 1, 0.2156863, 1,
-0.3317862, 1.470433, 0.6172804, 0, 1, 0.2196078, 1,
-0.331243, -1.593553, -4.020544, 0, 1, 0.227451, 1,
-0.3218727, -1.806439, -3.216197, 0, 1, 0.2313726, 1,
-0.3210954, -0.7534111, -2.979617, 0, 1, 0.2392157, 1,
-0.3160093, 0.6822455, -1.506772, 0, 1, 0.2431373, 1,
-0.3145083, -0.5311455, -2.935116, 0, 1, 0.2509804, 1,
-0.3130971, -1.237021, -1.432352, 0, 1, 0.254902, 1,
-0.3012442, -1.612519, -3.718702, 0, 1, 0.2627451, 1,
-0.2977147, 1.004363, 0.4486128, 0, 1, 0.2666667, 1,
-0.2942699, 0.2668024, 1.006313, 0, 1, 0.2745098, 1,
-0.2903871, 0.4148952, 1.387527, 0, 1, 0.2784314, 1,
-0.2899572, -1.337766, -2.951838, 0, 1, 0.2862745, 1,
-0.2892072, -1.074067, -5.036912, 0, 1, 0.2901961, 1,
-0.2884668, 1.010188, 0.3875192, 0, 1, 0.2980392, 1,
-0.2881987, -1.587287, 0.1360503, 0, 1, 0.3058824, 1,
-0.2869704, 0.01729743, -0.6691352, 0, 1, 0.3098039, 1,
-0.2865222, -0.3935225, -4.861373, 0, 1, 0.3176471, 1,
-0.2836075, 0.9074197, -0.4353724, 0, 1, 0.3215686, 1,
-0.2831263, -1.05908, -1.652414, 0, 1, 0.3294118, 1,
-0.2824411, -0.6516396, -4.056703, 0, 1, 0.3333333, 1,
-0.2818848, -0.09663463, -1.236599, 0, 1, 0.3411765, 1,
-0.2764398, -1.202532, -3.824706, 0, 1, 0.345098, 1,
-0.2711853, 1.591938, -0.4570847, 0, 1, 0.3529412, 1,
-0.2675874, -0.07913085, -0.2716758, 0, 1, 0.3568628, 1,
-0.2650268, -2.215364, -3.759727, 0, 1, 0.3647059, 1,
-0.2646604, -0.7764813, -2.577255, 0, 1, 0.3686275, 1,
-0.2645656, 0.3167354, -3.031914, 0, 1, 0.3764706, 1,
-0.2634635, 1.355846, 0.7788587, 0, 1, 0.3803922, 1,
-0.259432, -0.3900819, -2.079421, 0, 1, 0.3882353, 1,
-0.2587158, -0.4444331, -3.577985, 0, 1, 0.3921569, 1,
-0.2559318, 1.029056, -0.7250819, 0, 1, 0.4, 1,
-0.2558604, 0.7857071, -0.3101357, 0, 1, 0.4078431, 1,
-0.2543059, -0.5048557, -3.243025, 0, 1, 0.4117647, 1,
-0.2515123, -1.59904, -3.365394, 0, 1, 0.4196078, 1,
-0.2506298, 1.445199, 0.7131169, 0, 1, 0.4235294, 1,
-0.2493679, 0.4282807, -1.19808, 0, 1, 0.4313726, 1,
-0.2483375, 1.028848, -0.5967228, 0, 1, 0.4352941, 1,
-0.2462008, 0.9531915, -1.246074, 0, 1, 0.4431373, 1,
-0.2456765, 0.4704545, -2.161552, 0, 1, 0.4470588, 1,
-0.2413829, 0.5351715, -1.100359, 0, 1, 0.454902, 1,
-0.2388959, -1.475599, -2.214869, 0, 1, 0.4588235, 1,
-0.2368872, 0.9788901, 0.8099406, 0, 1, 0.4666667, 1,
-0.2330074, 0.1366183, -0.5336455, 0, 1, 0.4705882, 1,
-0.2314664, -0.7040512, -2.726053, 0, 1, 0.4784314, 1,
-0.2300825, -0.5551758, -1.73873, 0, 1, 0.4823529, 1,
-0.2297602, 0.3213486, -1.152182, 0, 1, 0.4901961, 1,
-0.2271398, -0.5990139, -4.037648, 0, 1, 0.4941176, 1,
-0.2248024, -0.9973025, -3.106445, 0, 1, 0.5019608, 1,
-0.2241766, 0.008267012, -1.334107, 0, 1, 0.509804, 1,
-0.2212751, -0.1827727, -1.575052, 0, 1, 0.5137255, 1,
-0.2168685, -0.7665586, -4.587991, 0, 1, 0.5215687, 1,
-0.216453, 2.476343, -0.2922005, 0, 1, 0.5254902, 1,
-0.2116756, 0.6013239, 1.204774, 0, 1, 0.5333334, 1,
-0.207469, 1.03951, 0.4533132, 0, 1, 0.5372549, 1,
-0.2072788, -1.147155, -2.504236, 0, 1, 0.5450981, 1,
-0.2072107, -1.209561, -1.981997, 0, 1, 0.5490196, 1,
-0.2018012, -0.2866003, -3.355324, 0, 1, 0.5568628, 1,
-0.1979519, 1.318935, -0.7874765, 0, 1, 0.5607843, 1,
-0.1976721, 0.95396, 0.03999761, 0, 1, 0.5686275, 1,
-0.1905577, 1.160446, 0.4836369, 0, 1, 0.572549, 1,
-0.1901734, 0.208718, -1.868942, 0, 1, 0.5803922, 1,
-0.1897342, -0.4446309, -2.690689, 0, 1, 0.5843138, 1,
-0.1894326, -1.489416, -2.431126, 0, 1, 0.5921569, 1,
-0.1888945, 1.596526, -1.767301, 0, 1, 0.5960785, 1,
-0.1846668, 1.058607, -0.1697753, 0, 1, 0.6039216, 1,
-0.1792596, 0.3813447, -2.654339, 0, 1, 0.6117647, 1,
-0.1784648, 1.146827, 0.9086287, 0, 1, 0.6156863, 1,
-0.172815, -0.3819779, -2.584858, 0, 1, 0.6235294, 1,
-0.1719669, 0.8063488, -0.5684406, 0, 1, 0.627451, 1,
-0.1707084, -1.450052, -2.752184, 0, 1, 0.6352941, 1,
-0.1685641, -0.6938027, -3.435901, 0, 1, 0.6392157, 1,
-0.1659001, -0.3156065, -3.115609, 0, 1, 0.6470588, 1,
-0.1582409, 1.631885, -0.7580295, 0, 1, 0.6509804, 1,
-0.1573006, -1.689543, -0.8996214, 0, 1, 0.6588235, 1,
-0.1558623, -0.1779535, -3.399335, 0, 1, 0.6627451, 1,
-0.1538962, 0.02487211, 0.3272536, 0, 1, 0.6705883, 1,
-0.1525278, -0.2871755, -2.520636, 0, 1, 0.6745098, 1,
-0.1500116, -0.9535136, -2.660079, 0, 1, 0.682353, 1,
-0.1417328, -1.357095, -4.129184, 0, 1, 0.6862745, 1,
-0.1381463, 2.308163, -0.7906416, 0, 1, 0.6941177, 1,
-0.1367557, 0.9559158, 0.5333871, 0, 1, 0.7019608, 1,
-0.1365758, -0.01684538, -0.7936916, 0, 1, 0.7058824, 1,
-0.1362532, 0.1242783, -1.276208, 0, 1, 0.7137255, 1,
-0.134269, -1.273706, -2.039698, 0, 1, 0.7176471, 1,
-0.1326979, -0.3480035, -2.320142, 0, 1, 0.7254902, 1,
-0.1313089, -0.01128804, -1.911163, 0, 1, 0.7294118, 1,
-0.1270856, 0.7219864, 0.5458974, 0, 1, 0.7372549, 1,
-0.1258127, -0.2744316, -3.362092, 0, 1, 0.7411765, 1,
-0.122462, 1.068395, 0.3612605, 0, 1, 0.7490196, 1,
-0.1217459, -0.1569443, -4.124369, 0, 1, 0.7529412, 1,
-0.119787, -1.450135, -1.756238, 0, 1, 0.7607843, 1,
-0.1191284, -1.86271, -2.387511, 0, 1, 0.7647059, 1,
-0.1130217, 1.817147, 2.392084, 0, 1, 0.772549, 1,
-0.1057865, -0.6655667, -1.001806, 0, 1, 0.7764706, 1,
-0.1056636, -0.2800083, -3.57143, 0, 1, 0.7843137, 1,
-0.1038188, -0.4681011, -2.905042, 0, 1, 0.7882353, 1,
-0.09978081, -0.8391431, -3.402125, 0, 1, 0.7960784, 1,
-0.09828582, -0.8139396, -4.027239, 0, 1, 0.8039216, 1,
-0.08773032, 1.373805, 2.354557, 0, 1, 0.8078431, 1,
-0.08441923, 1.295696, 1.949454, 0, 1, 0.8156863, 1,
-0.07932806, -0.3831297, -3.35312, 0, 1, 0.8196079, 1,
-0.07540728, -0.8551338, -1.515983, 0, 1, 0.827451, 1,
-0.07482839, -0.519551, -2.936286, 0, 1, 0.8313726, 1,
-0.07085469, -1.611811, -3.501092, 0, 1, 0.8392157, 1,
-0.06622373, 0.4716122, -1.025399, 0, 1, 0.8431373, 1,
-0.06081486, 2.214967, -0.05990203, 0, 1, 0.8509804, 1,
-0.05946931, 0.3888463, -1.051321, 0, 1, 0.854902, 1,
-0.0540944, 0.4278305, 0.02162471, 0, 1, 0.8627451, 1,
-0.05220295, -0.2797919, -3.068136, 0, 1, 0.8666667, 1,
-0.0501913, -1.202175, -2.53219, 0, 1, 0.8745098, 1,
-0.04963546, -0.8281842, -0.9331281, 0, 1, 0.8784314, 1,
-0.04958582, 0.04348001, -1.588675, 0, 1, 0.8862745, 1,
-0.04875954, 0.9304665, 0.4763262, 0, 1, 0.8901961, 1,
-0.04381229, -0.9037759, -4.330451, 0, 1, 0.8980392, 1,
-0.04366655, -0.9790852, -3.13472, 0, 1, 0.9058824, 1,
-0.03928956, 1.173873, 1.540627, 0, 1, 0.9098039, 1,
-0.03622452, -0.8616159, -2.476616, 0, 1, 0.9176471, 1,
-0.03336873, 0.5803048, -0.8386266, 0, 1, 0.9215686, 1,
-0.03222705, 0.4761539, -0.6682475, 0, 1, 0.9294118, 1,
-0.02909435, -0.3422636, -2.737179, 0, 1, 0.9333333, 1,
-0.01941095, 2.554963, -1.268848, 0, 1, 0.9411765, 1,
-0.01530437, -0.2480316, -3.873592, 0, 1, 0.945098, 1,
-0.01188155, 0.7777957, 0.7674774, 0, 1, 0.9529412, 1,
-0.01177997, -0.1378902, -2.165403, 0, 1, 0.9568627, 1,
-0.003223695, -1.040833, -2.027278, 0, 1, 0.9647059, 1,
-0.00296581, -1.118488, -4.372231, 0, 1, 0.9686275, 1,
0.002344138, 0.1684272, 1.317969, 0, 1, 0.9764706, 1,
0.004630248, -0.1304512, 3.386522, 0, 1, 0.9803922, 1,
0.008431192, -0.7360836, 1.920489, 0, 1, 0.9882353, 1,
0.01180394, -1.29803, 1.408115, 0, 1, 0.9921569, 1,
0.01197577, -0.5748553, 2.830788, 0, 1, 1, 1,
0.01297003, -1.588761, 1.807413, 0, 0.9921569, 1, 1,
0.01386331, -0.4736812, 3.261011, 0, 0.9882353, 1, 1,
0.01577116, 0.21923, -1.293648, 0, 0.9803922, 1, 1,
0.01613422, -1.112633, 3.663381, 0, 0.9764706, 1, 1,
0.01614601, -0.2416846, 2.711272, 0, 0.9686275, 1, 1,
0.01656177, 0.07313949, 0.8365619, 0, 0.9647059, 1, 1,
0.02613586, 1.85849, -0.5939447, 0, 0.9568627, 1, 1,
0.03053988, -0.1083385, 3.46792, 0, 0.9529412, 1, 1,
0.03135812, -0.1891713, 2.781848, 0, 0.945098, 1, 1,
0.0320759, 1.527127, -1.065244, 0, 0.9411765, 1, 1,
0.03517051, -1.194794, 1.363199, 0, 0.9333333, 1, 1,
0.03878482, -0.08598983, 2.004807, 0, 0.9294118, 1, 1,
0.03938478, -0.2423982, 3.775951, 0, 0.9215686, 1, 1,
0.04143685, -0.456865, 1.976643, 0, 0.9176471, 1, 1,
0.04192004, 1.337402, 1.349564, 0, 0.9098039, 1, 1,
0.04610691, -0.9687387, 4.182213, 0, 0.9058824, 1, 1,
0.05660108, 1.866367, 0.4334337, 0, 0.8980392, 1, 1,
0.05674558, 0.7726007, -0.5983554, 0, 0.8901961, 1, 1,
0.05765456, 0.5531658, -0.8782948, 0, 0.8862745, 1, 1,
0.05984323, -0.08510594, 1.938096, 0, 0.8784314, 1, 1,
0.06024332, 1.789675, 0.2045279, 0, 0.8745098, 1, 1,
0.06765781, -1.33392, 1.366792, 0, 0.8666667, 1, 1,
0.06816614, 0.4419428, 0.8878176, 0, 0.8627451, 1, 1,
0.07203817, -0.2753968, 3.694265, 0, 0.854902, 1, 1,
0.07507375, 1.168819, 1.413364, 0, 0.8509804, 1, 1,
0.07688189, 0.1265263, 1.294427, 0, 0.8431373, 1, 1,
0.08148947, -1.159354, 4.742746, 0, 0.8392157, 1, 1,
0.0849634, -1.6216, 2.73198, 0, 0.8313726, 1, 1,
0.08932635, 0.5552095, -0.03417712, 0, 0.827451, 1, 1,
0.09021854, -0.5495204, 2.618937, 0, 0.8196079, 1, 1,
0.09827491, 0.001142662, 1.929393, 0, 0.8156863, 1, 1,
0.0987998, -1.637504, 1.554084, 0, 0.8078431, 1, 1,
0.0997673, 0.3366289, -1.768745, 0, 0.8039216, 1, 1,
0.1025152, 0.6368821, 0.4496893, 0, 0.7960784, 1, 1,
0.1040574, 0.8239162, 1.133348, 0, 0.7882353, 1, 1,
0.1062136, -0.3402769, 3.206311, 0, 0.7843137, 1, 1,
0.1120251, -0.36741, 1.193981, 0, 0.7764706, 1, 1,
0.1134586, 0.7662191, 2.367612, 0, 0.772549, 1, 1,
0.115895, -0.8360453, 1.547069, 0, 0.7647059, 1, 1,
0.1177992, -3.147327, 2.414404, 0, 0.7607843, 1, 1,
0.1188559, 1.479421, 1.294404, 0, 0.7529412, 1, 1,
0.1201642, 0.7360419, -1.088184, 0, 0.7490196, 1, 1,
0.1224114, 1.498357, 1.799157, 0, 0.7411765, 1, 1,
0.1253577, -0.3125152, 3.766384, 0, 0.7372549, 1, 1,
0.1254132, -0.4620107, 2.575658, 0, 0.7294118, 1, 1,
0.1294363, 1.179762, -0.0443195, 0, 0.7254902, 1, 1,
0.138756, -0.4320366, 5.073006, 0, 0.7176471, 1, 1,
0.139073, -0.05967402, 0.4651895, 0, 0.7137255, 1, 1,
0.1400048, -1.223756, 4.274271, 0, 0.7058824, 1, 1,
0.1411341, -0.5723763, 3.86708, 0, 0.6980392, 1, 1,
0.1420538, -1.792453, 3.249833, 0, 0.6941177, 1, 1,
0.1434736, -1.07956, 3.043145, 0, 0.6862745, 1, 1,
0.1439113, -0.04520054, 1.72126, 0, 0.682353, 1, 1,
0.1447166, 0.1699974, -1.096549, 0, 0.6745098, 1, 1,
0.145246, 2.050436, 1.202739, 0, 0.6705883, 1, 1,
0.1466042, -0.5226842, 2.403404, 0, 0.6627451, 1, 1,
0.1483705, 0.600484, -0.2561662, 0, 0.6588235, 1, 1,
0.1487001, 1.487931, 0.8132666, 0, 0.6509804, 1, 1,
0.1521652, 0.8461089, 0.4710895, 0, 0.6470588, 1, 1,
0.1577031, -1.183897, 1.992358, 0, 0.6392157, 1, 1,
0.1629124, -0.3214148, 5.606646, 0, 0.6352941, 1, 1,
0.164454, -0.104036, 1.663553, 0, 0.627451, 1, 1,
0.1664577, -0.2945904, 1.50678, 0, 0.6235294, 1, 1,
0.167221, -0.7869465, 3.14261, 0, 0.6156863, 1, 1,
0.1708936, 0.7488779, -0.6801553, 0, 0.6117647, 1, 1,
0.1725073, 0.8023569, 1.455162, 0, 0.6039216, 1, 1,
0.180692, -0.2939549, 3.390249, 0, 0.5960785, 1, 1,
0.1878146, 0.1221139, 1.460642, 0, 0.5921569, 1, 1,
0.1885109, 0.3333674, 0.2880889, 0, 0.5843138, 1, 1,
0.1889552, -0.8617625, 2.315417, 0, 0.5803922, 1, 1,
0.2010703, -1.041735, 4.838397, 0, 0.572549, 1, 1,
0.2058673, -0.4380387, 1.233334, 0, 0.5686275, 1, 1,
0.210075, -1.380535, 2.763573, 0, 0.5607843, 1, 1,
0.2169553, -0.3900653, 2.119238, 0, 0.5568628, 1, 1,
0.2200589, 2.633027, -0.01519788, 0, 0.5490196, 1, 1,
0.2201181, -0.3757542, 2.558997, 0, 0.5450981, 1, 1,
0.2224662, 1.405323, 1.07876, 0, 0.5372549, 1, 1,
0.2225937, 1.103916, -1.347636, 0, 0.5333334, 1, 1,
0.2243591, -1.006998, 3.783161, 0, 0.5254902, 1, 1,
0.2256961, 1.993581, -1.099167, 0, 0.5215687, 1, 1,
0.2283643, -0.7116296, 1.85346, 0, 0.5137255, 1, 1,
0.2289196, 2.434476, -1.071412, 0, 0.509804, 1, 1,
0.239525, -0.0414905, 0.3823129, 0, 0.5019608, 1, 1,
0.2423106, 2.155055, 0.3235709, 0, 0.4941176, 1, 1,
0.2433858, 0.7496473, 0.2342332, 0, 0.4901961, 1, 1,
0.2437915, 0.797711, -0.5133573, 0, 0.4823529, 1, 1,
0.2443194, 0.176835, 0.5928229, 0, 0.4784314, 1, 1,
0.2454481, -0.03675426, 2.582021, 0, 0.4705882, 1, 1,
0.2476134, 0.532808, 0.3633197, 0, 0.4666667, 1, 1,
0.2531767, 0.208629, 0.6808226, 0, 0.4588235, 1, 1,
0.2591733, 0.9142308, 0.9367886, 0, 0.454902, 1, 1,
0.2650136, 1.470779, 0.1890092, 0, 0.4470588, 1, 1,
0.2685549, -0.04765792, 3.020431, 0, 0.4431373, 1, 1,
0.2697344, -1.928551, 3.176972, 0, 0.4352941, 1, 1,
0.2756594, -0.09687884, 1.250722, 0, 0.4313726, 1, 1,
0.2759551, -0.4115129, 3.295423, 0, 0.4235294, 1, 1,
0.277584, -0.07067225, 0.6830988, 0, 0.4196078, 1, 1,
0.2826354, -0.7938439, 6.192297, 0, 0.4117647, 1, 1,
0.2880512, -0.1311811, 1.491339, 0, 0.4078431, 1, 1,
0.2941805, 0.5533079, 2.036838, 0, 0.4, 1, 1,
0.2981981, -0.225162, 1.025447, 0, 0.3921569, 1, 1,
0.2993802, 1.075836, -1.592799, 0, 0.3882353, 1, 1,
0.3063551, -0.3672959, 2.975975, 0, 0.3803922, 1, 1,
0.3072048, 0.3288666, -0.07646731, 0, 0.3764706, 1, 1,
0.3090088, 0.2886583, 1.91819, 0, 0.3686275, 1, 1,
0.309832, 1.691604, -0.131116, 0, 0.3647059, 1, 1,
0.3117285, 0.8120665, -0.04683296, 0, 0.3568628, 1, 1,
0.3126952, 1.105151, 0.8820075, 0, 0.3529412, 1, 1,
0.315515, -1.681663, 2.165214, 0, 0.345098, 1, 1,
0.3167307, 0.8089639, 0.6139461, 0, 0.3411765, 1, 1,
0.3168768, 0.2178174, 0.6970537, 0, 0.3333333, 1, 1,
0.3185617, 1.526321, -0.6652665, 0, 0.3294118, 1, 1,
0.3217743, 1.652393, -1.160824, 0, 0.3215686, 1, 1,
0.3222706, 1.764159, 2.272166, 0, 0.3176471, 1, 1,
0.3247738, -1.003577, 1.498908, 0, 0.3098039, 1, 1,
0.3250574, 1.225494, 0.3346977, 0, 0.3058824, 1, 1,
0.3283648, -0.6315742, 3.500498, 0, 0.2980392, 1, 1,
0.3294428, -0.5774249, 2.484482, 0, 0.2901961, 1, 1,
0.3363493, 1.296169, 0.4593055, 0, 0.2862745, 1, 1,
0.3394225, 0.2117126, -0.6607698, 0, 0.2784314, 1, 1,
0.3481899, 0.1898008, 2.033623, 0, 0.2745098, 1, 1,
0.3484968, 0.02435583, 3.136974, 0, 0.2666667, 1, 1,
0.3586949, 1.379054, 1.667579, 0, 0.2627451, 1, 1,
0.3634177, 1.604462, -0.1537521, 0, 0.254902, 1, 1,
0.3678956, 0.5955818, 2.54313, 0, 0.2509804, 1, 1,
0.3704346, 0.5546906, 0.007060668, 0, 0.2431373, 1, 1,
0.3706211, -0.2527892, 2.589798, 0, 0.2392157, 1, 1,
0.3726022, 0.1662058, 1.968291, 0, 0.2313726, 1, 1,
0.3757311, 0.4169423, 2.504202, 0, 0.227451, 1, 1,
0.3760397, -1.109776, 0.7836486, 0, 0.2196078, 1, 1,
0.3790157, 0.5818674, 2.272487, 0, 0.2156863, 1, 1,
0.3813337, 1.150067, 2.170319, 0, 0.2078431, 1, 1,
0.3833366, -0.5084497, 2.773925, 0, 0.2039216, 1, 1,
0.3841206, -0.3484444, 2.433788, 0, 0.1960784, 1, 1,
0.3900468, 1.967528, -0.2469898, 0, 0.1882353, 1, 1,
0.3908346, 0.6647938, 0.3049898, 0, 0.1843137, 1, 1,
0.3959433, 1.206016, 0.8042181, 0, 0.1764706, 1, 1,
0.3961526, 1.364177, -1.657766, 0, 0.172549, 1, 1,
0.401683, -0.7207747, 1.867381, 0, 0.1647059, 1, 1,
0.4060822, -2.002765, 3.806291, 0, 0.1607843, 1, 1,
0.4067349, -0.01878599, 1.170238, 0, 0.1529412, 1, 1,
0.4079362, -1.011207, 3.411412, 0, 0.1490196, 1, 1,
0.4118605, 2.211423, 0.1414659, 0, 0.1411765, 1, 1,
0.414789, 1.88681, 0.4556243, 0, 0.1372549, 1, 1,
0.418649, -1.112738, 3.528155, 0, 0.1294118, 1, 1,
0.4211152, -0.5878903, 2.36141, 0, 0.1254902, 1, 1,
0.4246125, -0.1169263, 2.269526, 0, 0.1176471, 1, 1,
0.4254147, 0.3122906, 2.590111, 0, 0.1137255, 1, 1,
0.4255202, 0.06344408, 2.638452, 0, 0.1058824, 1, 1,
0.4263026, 2.134462, 1.039875, 0, 0.09803922, 1, 1,
0.4275678, 0.4871675, 0.1045061, 0, 0.09411765, 1, 1,
0.4351028, -1.015988, 4.224128, 0, 0.08627451, 1, 1,
0.4385914, 0.09310891, 1.920498, 0, 0.08235294, 1, 1,
0.4422733, 1.16781, 1.292899, 0, 0.07450981, 1, 1,
0.4464031, 1.179363, 0.2899828, 0, 0.07058824, 1, 1,
0.4465352, 0.243772, 0.2673074, 0, 0.0627451, 1, 1,
0.4502057, -1.567108, 2.704052, 0, 0.05882353, 1, 1,
0.4517351, -0.4984287, 2.25902, 0, 0.05098039, 1, 1,
0.4518497, -0.862681, 2.032587, 0, 0.04705882, 1, 1,
0.4557777, -1.635042, 4.707961, 0, 0.03921569, 1, 1,
0.4561422, -0.2115916, 1.744966, 0, 0.03529412, 1, 1,
0.4590903, -0.9105722, 2.273539, 0, 0.02745098, 1, 1,
0.459284, 0.4281961, 1.641717, 0, 0.02352941, 1, 1,
0.4605972, -0.4565278, 2.912885, 0, 0.01568628, 1, 1,
0.4609636, -0.2444162, 2.244578, 0, 0.01176471, 1, 1,
0.4713073, 0.5637565, 1.406945, 0, 0.003921569, 1, 1,
0.4837534, -0.2445302, 3.377879, 0.003921569, 0, 1, 1,
0.4850791, -0.8463816, 1.861989, 0.007843138, 0, 1, 1,
0.4911264, -0.1979308, 2.104524, 0.01568628, 0, 1, 1,
0.4916758, 0.306085, 0.9671796, 0.01960784, 0, 1, 1,
0.4942667, 1.424176, -1.425822, 0.02745098, 0, 1, 1,
0.4945693, -0.6934671, 2.874748, 0.03137255, 0, 1, 1,
0.5000725, -0.2725315, 2.674262, 0.03921569, 0, 1, 1,
0.5019934, -0.2673529, 1.554163, 0.04313726, 0, 1, 1,
0.5064572, 1.680762, -0.2189506, 0.05098039, 0, 1, 1,
0.5101209, -0.2263089, 1.962484, 0.05490196, 0, 1, 1,
0.5182562, 0.5362129, 0.9023675, 0.0627451, 0, 1, 1,
0.5211012, 0.04040277, 1.198472, 0.06666667, 0, 1, 1,
0.5243647, 0.4124358, 1.15385, 0.07450981, 0, 1, 1,
0.5257109, 2.030647, 0.6236298, 0.07843138, 0, 1, 1,
0.5268694, -0.2734615, 1.569478, 0.08627451, 0, 1, 1,
0.5283137, -0.3746889, 3.005362, 0.09019608, 0, 1, 1,
0.5291728, 0.9399446, 2.727414, 0.09803922, 0, 1, 1,
0.5303345, 0.0127886, 1.697558, 0.1058824, 0, 1, 1,
0.5309735, 2.026402, -0.5444959, 0.1098039, 0, 1, 1,
0.5342428, 0.8695396, -2.576524, 0.1176471, 0, 1, 1,
0.5364522, 0.5220199, -2.056717, 0.1215686, 0, 1, 1,
0.5366358, 1.202266, 1.413047, 0.1294118, 0, 1, 1,
0.5393274, 0.2584028, 0.9806219, 0.1333333, 0, 1, 1,
0.5458502, -1.119714, 2.834267, 0.1411765, 0, 1, 1,
0.5461146, 1.496313, -1.813747, 0.145098, 0, 1, 1,
0.5499319, -0.426037, 3.020043, 0.1529412, 0, 1, 1,
0.5505165, 0.378018, 0.3643207, 0.1568628, 0, 1, 1,
0.5524404, 0.9091987, 1.668739, 0.1647059, 0, 1, 1,
0.5550872, 0.03279477, 1.99526, 0.1686275, 0, 1, 1,
0.558531, 0.189181, 1.744151, 0.1764706, 0, 1, 1,
0.5596924, -0.6518044, 1.592542, 0.1803922, 0, 1, 1,
0.562225, 0.01019712, 2.269518, 0.1882353, 0, 1, 1,
0.5738384, 0.8093996, -0.1330035, 0.1921569, 0, 1, 1,
0.5792646, 0.6224968, 0.7101039, 0.2, 0, 1, 1,
0.581116, 0.7685476, 0.2097675, 0.2078431, 0, 1, 1,
0.5817651, -1.634335, 3.580981, 0.2117647, 0, 1, 1,
0.5847404, 0.1712717, 2.832444, 0.2196078, 0, 1, 1,
0.5868382, -1.383941, 3.355937, 0.2235294, 0, 1, 1,
0.5889282, 0.3905013, 3.045739, 0.2313726, 0, 1, 1,
0.590848, 0.3681129, 1.261541, 0.2352941, 0, 1, 1,
0.5990214, -1.077129, 2.243382, 0.2431373, 0, 1, 1,
0.6027582, 2.216902, 1.464147, 0.2470588, 0, 1, 1,
0.602904, 2.092442, 1.105197, 0.254902, 0, 1, 1,
0.6047726, -0.06350685, 2.589634, 0.2588235, 0, 1, 1,
0.6066989, 0.05476607, 1.895726, 0.2666667, 0, 1, 1,
0.6080039, 1.480638, 0.1493184, 0.2705882, 0, 1, 1,
0.6083602, -0.6049758, 1.536152, 0.2784314, 0, 1, 1,
0.611647, 0.4421611, 1.823379, 0.282353, 0, 1, 1,
0.6116629, 0.1402165, 1.316439, 0.2901961, 0, 1, 1,
0.6130254, 0.5378065, -0.1010462, 0.2941177, 0, 1, 1,
0.6134973, 0.02899452, 0.7213108, 0.3019608, 0, 1, 1,
0.6145406, 0.4273923, 1.697611, 0.3098039, 0, 1, 1,
0.6190554, -0.7558419, 2.872601, 0.3137255, 0, 1, 1,
0.6215051, 0.6099737, -0.3780804, 0.3215686, 0, 1, 1,
0.622564, 0.2579154, 1.212063, 0.3254902, 0, 1, 1,
0.6241524, 0.8073729, 2.376319, 0.3333333, 0, 1, 1,
0.6247082, 0.6192348, 2.128443, 0.3372549, 0, 1, 1,
0.6261185, -0.5485563, 1.264403, 0.345098, 0, 1, 1,
0.6265182, -0.5068418, 0.9597023, 0.3490196, 0, 1, 1,
0.6302891, -0.3803722, 2.492957, 0.3568628, 0, 1, 1,
0.6322107, -1.088151, 2.732613, 0.3607843, 0, 1, 1,
0.6323714, -0.6922967, 0.5527092, 0.3686275, 0, 1, 1,
0.6326613, 0.6793628, 0.6181284, 0.372549, 0, 1, 1,
0.6410093, -0.4352518, 2.385897, 0.3803922, 0, 1, 1,
0.6421803, 0.5389929, 1.316559, 0.3843137, 0, 1, 1,
0.6445816, -1.009462, 4.407733, 0.3921569, 0, 1, 1,
0.6480921, -0.1916245, 2.272981, 0.3960784, 0, 1, 1,
0.6510638, 2.038823, 1.729886, 0.4039216, 0, 1, 1,
0.6556194, 0.7759389, 1.614572, 0.4117647, 0, 1, 1,
0.6562065, -2.275785, 4.24804, 0.4156863, 0, 1, 1,
0.6658931, -1.907181, 4.266811, 0.4235294, 0, 1, 1,
0.6707495, 0.6974164, 1.257546, 0.427451, 0, 1, 1,
0.6748362, -1.149742, 1.859652, 0.4352941, 0, 1, 1,
0.6763209, 0.371815, 0.9345155, 0.4392157, 0, 1, 1,
0.6773184, -0.1353309, 3.117486, 0.4470588, 0, 1, 1,
0.679007, 1.185928, 0.2355037, 0.4509804, 0, 1, 1,
0.6792307, -2.825851, 2.5624, 0.4588235, 0, 1, 1,
0.6822425, 0.3499953, 0.5298991, 0.4627451, 0, 1, 1,
0.6826258, 0.6925305, 1.188779, 0.4705882, 0, 1, 1,
0.6889002, 0.4711406, 0.363352, 0.4745098, 0, 1, 1,
0.6904363, 0.8244786, 2.111644, 0.4823529, 0, 1, 1,
0.6966324, -0.6230354, 1.024958, 0.4862745, 0, 1, 1,
0.697468, -0.7288714, 2.335955, 0.4941176, 0, 1, 1,
0.6993158, -1.79714, 2.017734, 0.5019608, 0, 1, 1,
0.6997503, 0.01585765, 0.5680197, 0.5058824, 0, 1, 1,
0.7026274, -0.8919531, 2.369695, 0.5137255, 0, 1, 1,
0.7061288, -0.6084552, 0.5171881, 0.5176471, 0, 1, 1,
0.7095469, 0.7666019, 2.177549, 0.5254902, 0, 1, 1,
0.7124535, -0.2719082, 0.7364023, 0.5294118, 0, 1, 1,
0.7159918, 1.534772, 1.092592, 0.5372549, 0, 1, 1,
0.7230825, -0.512416, 0.6715211, 0.5411765, 0, 1, 1,
0.7273967, 1.434823, 2.679125, 0.5490196, 0, 1, 1,
0.7288036, 0.8134052, -0.1527903, 0.5529412, 0, 1, 1,
0.729845, 0.0007255492, 1.584061, 0.5607843, 0, 1, 1,
0.7300446, -1.042337, 3.329342, 0.5647059, 0, 1, 1,
0.7302815, 0.7115443, -0.5241576, 0.572549, 0, 1, 1,
0.7323603, -1.550954, 1.418247, 0.5764706, 0, 1, 1,
0.7361465, 0.07520658, 1.474509, 0.5843138, 0, 1, 1,
0.7401931, -0.112132, 1.321114, 0.5882353, 0, 1, 1,
0.74297, 0.5312984, 1.596677, 0.5960785, 0, 1, 1,
0.7432348, -0.2316981, 1.644024, 0.6039216, 0, 1, 1,
0.7456529, -0.5384733, 2.981535, 0.6078432, 0, 1, 1,
0.7516854, -0.1910627, -0.1049642, 0.6156863, 0, 1, 1,
0.7537308, 0.05020867, 1.545848, 0.6196079, 0, 1, 1,
0.7541288, -0.05252608, 1.307171, 0.627451, 0, 1, 1,
0.7575819, 0.1963916, 0.5858227, 0.6313726, 0, 1, 1,
0.7577963, -1.359368, 2.746561, 0.6392157, 0, 1, 1,
0.7605767, -1.313719, 2.574546, 0.6431373, 0, 1, 1,
0.7620829, -1.40735, 2.343976, 0.6509804, 0, 1, 1,
0.7643946, -1.011508, 3.969415, 0.654902, 0, 1, 1,
0.7669392, 0.2210677, 1.476907, 0.6627451, 0, 1, 1,
0.7710836, 0.5983942, -0.08909978, 0.6666667, 0, 1, 1,
0.7719128, 0.5287342, -0.03782516, 0.6745098, 0, 1, 1,
0.7768272, 0.8833327, -0.441767, 0.6784314, 0, 1, 1,
0.7775999, 0.170394, 1.809942, 0.6862745, 0, 1, 1,
0.780072, -1.138599, 3.042624, 0.6901961, 0, 1, 1,
0.7818467, -0.03927157, 2.031753, 0.6980392, 0, 1, 1,
0.7869614, 2.213724, 0.2333766, 0.7058824, 0, 1, 1,
0.788205, 2.387167, 1.745084, 0.7098039, 0, 1, 1,
0.7915291, 1.959368, 1.351334, 0.7176471, 0, 1, 1,
0.7942485, -0.9469728, 2.829723, 0.7215686, 0, 1, 1,
0.7953053, 0.760124, 1.665525, 0.7294118, 0, 1, 1,
0.7986145, -1.756838, 1.877125, 0.7333333, 0, 1, 1,
0.8002065, 0.3430962, -0.04162181, 0.7411765, 0, 1, 1,
0.8018157, 0.6748266, 0.1094271, 0.7450981, 0, 1, 1,
0.812119, -0.8107593, 0.8210667, 0.7529412, 0, 1, 1,
0.8207099, 0.3039365, 1.745391, 0.7568628, 0, 1, 1,
0.8212952, 0.2318952, 2.150916, 0.7647059, 0, 1, 1,
0.8232572, -0.9506906, 2.472656, 0.7686275, 0, 1, 1,
0.8238057, -0.5981414, 2.31112, 0.7764706, 0, 1, 1,
0.8247987, 1.332708, 2.586455, 0.7803922, 0, 1, 1,
0.8259496, -0.4414755, 1.306781, 0.7882353, 0, 1, 1,
0.8269639, -1.280018, 3.115126, 0.7921569, 0, 1, 1,
0.8281822, 0.1817365, 1.148249, 0.8, 0, 1, 1,
0.8284164, 0.03264797, 2.795568, 0.8078431, 0, 1, 1,
0.8319989, -1.369702, 3.70193, 0.8117647, 0, 1, 1,
0.8346016, 1.42335, 2.596261, 0.8196079, 0, 1, 1,
0.8349149, 0.1669621, 0.385556, 0.8235294, 0, 1, 1,
0.8370074, 0.5982718, -0.9616862, 0.8313726, 0, 1, 1,
0.8394999, -1.580154, 3.330956, 0.8352941, 0, 1, 1,
0.8427837, -0.6923861, 2.925737, 0.8431373, 0, 1, 1,
0.8433243, 0.6776967, -0.4804192, 0.8470588, 0, 1, 1,
0.8443577, 0.2644824, 1.434903, 0.854902, 0, 1, 1,
0.8446373, 0.8175838, -0.6645414, 0.8588235, 0, 1, 1,
0.8580688, -1.292847, 1.298206, 0.8666667, 0, 1, 1,
0.8590958, -1.03565, 1.791898, 0.8705882, 0, 1, 1,
0.8595165, -0.4515866, 2.177914, 0.8784314, 0, 1, 1,
0.8817501, 0.3009138, -1.010202, 0.8823529, 0, 1, 1,
0.8829498, 0.0320894, 1.108676, 0.8901961, 0, 1, 1,
0.8847404, 1.786646, 1.469348, 0.8941177, 0, 1, 1,
0.887833, 0.1783431, 1.287676, 0.9019608, 0, 1, 1,
0.8884677, -0.1624776, 3.280287, 0.9098039, 0, 1, 1,
0.8917573, -1.933718, 4.093935, 0.9137255, 0, 1, 1,
0.8974681, 1.645278, 1.174506, 0.9215686, 0, 1, 1,
0.8982541, 0.3283927, 0.8811568, 0.9254902, 0, 1, 1,
0.9019875, 2.06537, 0.7837003, 0.9333333, 0, 1, 1,
0.9192021, -0.6300873, 3.599273, 0.9372549, 0, 1, 1,
0.919243, -0.05575627, 0.8588425, 0.945098, 0, 1, 1,
0.9210924, -1.100096, 3.080662, 0.9490196, 0, 1, 1,
0.9229206, 0.6512129, 1.569659, 0.9568627, 0, 1, 1,
0.9244453, -0.6977099, 2.066785, 0.9607843, 0, 1, 1,
0.9280473, 0.9824799, 1.538458, 0.9686275, 0, 1, 1,
0.9317043, -0.9005098, 0.9926229, 0.972549, 0, 1, 1,
0.9342443, -0.776788, 2.600964, 0.9803922, 0, 1, 1,
0.9363738, -0.7130592, 1.812349, 0.9843137, 0, 1, 1,
0.9467981, 0.4045042, 0.8185567, 0.9921569, 0, 1, 1,
0.9502714, -0.09923751, 1.027227, 0.9960784, 0, 1, 1,
0.9555827, 1.083449, -0.19361, 1, 0, 0.9960784, 1,
0.9579622, -0.3151215, 1.965692, 1, 0, 0.9882353, 1,
0.9629315, -0.4793934, 2.734511, 1, 0, 0.9843137, 1,
0.9661846, 0.2105347, 1.382152, 1, 0, 0.9764706, 1,
0.9674184, -0.6130698, 2.365364, 1, 0, 0.972549, 1,
0.9692413, -0.4469341, 1.237665, 1, 0, 0.9647059, 1,
0.9711645, 0.4783651, 4.094395, 1, 0, 0.9607843, 1,
0.9728526, -0.8611639, 3.724256, 1, 0, 0.9529412, 1,
0.9802279, -0.8592316, 0.9066386, 1, 0, 0.9490196, 1,
0.9839501, 0.6106758, 0.3349887, 1, 0, 0.9411765, 1,
0.9921533, 0.8472974, 0.3310733, 1, 0, 0.9372549, 1,
0.9973634, 2.064599, 0.6091562, 1, 0, 0.9294118, 1,
1.001954, -1.43689, 4.668859, 1, 0, 0.9254902, 1,
1.004195, -0.6272449, 2.357687, 1, 0, 0.9176471, 1,
1.013431, -1.517542, 2.119723, 1, 0, 0.9137255, 1,
1.030779, 0.1590306, 1.383617, 1, 0, 0.9058824, 1,
1.035206, -0.3814248, 1.525565, 1, 0, 0.9019608, 1,
1.035614, -0.003130222, 2.347638, 1, 0, 0.8941177, 1,
1.037026, 0.4355161, 2.458077, 1, 0, 0.8862745, 1,
1.044313, -0.4257827, 2.121219, 1, 0, 0.8823529, 1,
1.052, 0.1383273, 0.8250628, 1, 0, 0.8745098, 1,
1.057781, 0.1436684, 2.013323, 1, 0, 0.8705882, 1,
1.058008, -1.238121, 2.113014, 1, 0, 0.8627451, 1,
1.062102, -1.66626, 1.711674, 1, 0, 0.8588235, 1,
1.071786, -0.9301915, 4.128503, 1, 0, 0.8509804, 1,
1.072414, 0.5837098, 1.780722, 1, 0, 0.8470588, 1,
1.080623, -2.309244, 2.248051, 1, 0, 0.8392157, 1,
1.08435, -0.230576, 1.547977, 1, 0, 0.8352941, 1,
1.08926, 0.2047598, 0.202645, 1, 0, 0.827451, 1,
1.089835, 0.340012, 2.563533, 1, 0, 0.8235294, 1,
1.091298, 0.3718271, -1.007142, 1, 0, 0.8156863, 1,
1.102786, -0.4784495, 2.020913, 1, 0, 0.8117647, 1,
1.106192, -1.920958, 2.757555, 1, 0, 0.8039216, 1,
1.112428, 0.154844, 0.6676602, 1, 0, 0.7960784, 1,
1.114567, -0.1373296, 2.780147, 1, 0, 0.7921569, 1,
1.11599, 1.08853, -0.9489428, 1, 0, 0.7843137, 1,
1.118234, -1.210351, 2.463768, 1, 0, 0.7803922, 1,
1.123853, -0.7392766, 1.256213, 1, 0, 0.772549, 1,
1.126718, 0.2536846, 2.09715, 1, 0, 0.7686275, 1,
1.137474, -1.134152, 2.304742, 1, 0, 0.7607843, 1,
1.140823, -0.2671466, 1.850309, 1, 0, 0.7568628, 1,
1.147043, 0.1494633, 1.872325, 1, 0, 0.7490196, 1,
1.150218, 0.6735759, 2.539999, 1, 0, 0.7450981, 1,
1.150699, -1.061941, 2.271127, 1, 0, 0.7372549, 1,
1.151847, -0.1622426, 2.718512, 1, 0, 0.7333333, 1,
1.153008, 1.675097, -0.01996768, 1, 0, 0.7254902, 1,
1.159802, -0.4241709, 1.965306, 1, 0, 0.7215686, 1,
1.162199, 0.09756102, 3.85551, 1, 0, 0.7137255, 1,
1.166326, -0.6771613, 2.333869, 1, 0, 0.7098039, 1,
1.171065, 0.8774914, 0.5833451, 1, 0, 0.7019608, 1,
1.17529, 0.1144983, 1.169118, 1, 0, 0.6941177, 1,
1.179188, -0.350028, 2.010332, 1, 0, 0.6901961, 1,
1.186852, -1.601325, 1.966134, 1, 0, 0.682353, 1,
1.190045, 1.25797, 1.43066, 1, 0, 0.6784314, 1,
1.193125, -0.3066913, 3.322087, 1, 0, 0.6705883, 1,
1.19798, 1.112509, 1.431607, 1, 0, 0.6666667, 1,
1.224869, 0.7967992, 1.213958, 1, 0, 0.6588235, 1,
1.226453, 0.1441778, 1.019802, 1, 0, 0.654902, 1,
1.231846, -0.3435546, 1.450282, 1, 0, 0.6470588, 1,
1.234026, -0.4282154, 0.23613, 1, 0, 0.6431373, 1,
1.235163, 1.680678, 0.2414793, 1, 0, 0.6352941, 1,
1.241251, -1.162467, 2.202939, 1, 0, 0.6313726, 1,
1.243079, 1.355751, 1.741023, 1, 0, 0.6235294, 1,
1.244794, 0.4478997, 1.157411, 1, 0, 0.6196079, 1,
1.250025, -0.589661, 2.05824, 1, 0, 0.6117647, 1,
1.254511, 1.385798, 0.527903, 1, 0, 0.6078432, 1,
1.257204, -0.1929736, 1.558018, 1, 0, 0.6, 1,
1.265062, 2.530107, -0.9056068, 1, 0, 0.5921569, 1,
1.271318, -0.6547189, -0.1028288, 1, 0, 0.5882353, 1,
1.273747, -0.4672219, 1.844587, 1, 0, 0.5803922, 1,
1.275048, -0.1638996, 1.420879, 1, 0, 0.5764706, 1,
1.27794, -1.157428, 1.890069, 1, 0, 0.5686275, 1,
1.286806, 1.162756, 1.888298, 1, 0, 0.5647059, 1,
1.288213, -1.450433, 3.292184, 1, 0, 0.5568628, 1,
1.289439, -1.205377, 3.989357, 1, 0, 0.5529412, 1,
1.291307, 1.37764, 2.35016, 1, 0, 0.5450981, 1,
1.29486, -0.7063234, 2.072253, 1, 0, 0.5411765, 1,
1.341702, 0.3316656, 0.1625165, 1, 0, 0.5333334, 1,
1.361198, -0.3445088, 1.151811, 1, 0, 0.5294118, 1,
1.376099, 1.914981, 1.471157, 1, 0, 0.5215687, 1,
1.380119, -0.9027058, 1.912912, 1, 0, 0.5176471, 1,
1.380254, 0.5659745, 1.902195, 1, 0, 0.509804, 1,
1.381379, -2.06953, 3.167349, 1, 0, 0.5058824, 1,
1.388543, -0.1318753, 0.8604507, 1, 0, 0.4980392, 1,
1.398021, 1.790857, 1.655459, 1, 0, 0.4901961, 1,
1.40216, 0.1658202, 0.4294041, 1, 0, 0.4862745, 1,
1.403557, -0.537133, 1.506569, 1, 0, 0.4784314, 1,
1.405617, -1.264558, 3.157342, 1, 0, 0.4745098, 1,
1.407619, -0.2545452, 1.507385, 1, 0, 0.4666667, 1,
1.40849, 0.4074025, -0.07524469, 1, 0, 0.4627451, 1,
1.411647, -0.6812916, 1.211569, 1, 0, 0.454902, 1,
1.417461, 0.5940892, 2.128171, 1, 0, 0.4509804, 1,
1.420891, 0.7384015, 2.943225, 1, 0, 0.4431373, 1,
1.421053, 0.6263708, -1.126856, 1, 0, 0.4392157, 1,
1.424235, 1.291791, 1.93212, 1, 0, 0.4313726, 1,
1.431031, -0.5696756, 2.629858, 1, 0, 0.427451, 1,
1.45281, -0.04245181, 0.7726249, 1, 0, 0.4196078, 1,
1.471229, 1.170967, 1.839389, 1, 0, 0.4156863, 1,
1.474882, 1.935678, 1.451492, 1, 0, 0.4078431, 1,
1.48291, -1.686062, 2.839849, 1, 0, 0.4039216, 1,
1.497104, 0.8480633, 0.7749434, 1, 0, 0.3960784, 1,
1.505142, 1.16219, 0.08416367, 1, 0, 0.3882353, 1,
1.514833, -0.2990177, 0.6718091, 1, 0, 0.3843137, 1,
1.516652, 0.7558872, 0.1372656, 1, 0, 0.3764706, 1,
1.520069, -2.260845, 2.812997, 1, 0, 0.372549, 1,
1.522068, -0.9644105, 1.595825, 1, 0, 0.3647059, 1,
1.527672, -0.1082891, 1.075278, 1, 0, 0.3607843, 1,
1.532649, 1.668705, -0.695922, 1, 0, 0.3529412, 1,
1.546584, -3.248398, 4.189939, 1, 0, 0.3490196, 1,
1.560009, 0.6569282, 0.6693671, 1, 0, 0.3411765, 1,
1.619619, -1.1557, 0.6177278, 1, 0, 0.3372549, 1,
1.634104, 0.6023602, 1.283574, 1, 0, 0.3294118, 1,
1.638649, -0.4784732, 2.096556, 1, 0, 0.3254902, 1,
1.639719, 1.767801, 1.366872, 1, 0, 0.3176471, 1,
1.650223, -0.03815225, 2.377324, 1, 0, 0.3137255, 1,
1.657418, 0.9371466, 0.9694675, 1, 0, 0.3058824, 1,
1.662632, -0.6214965, 1.21794, 1, 0, 0.2980392, 1,
1.687539, -0.04831133, 3.23006, 1, 0, 0.2941177, 1,
1.701307, 0.4166454, 0.003866646, 1, 0, 0.2862745, 1,
1.702413, -0.6309876, 2.422112, 1, 0, 0.282353, 1,
1.706572, -0.6569216, 2.260152, 1, 0, 0.2745098, 1,
1.706722, -1.181266, 3.089742, 1, 0, 0.2705882, 1,
1.730381, -0.3989101, 2.040384, 1, 0, 0.2627451, 1,
1.732246, 1.786841, 1.963259, 1, 0, 0.2588235, 1,
1.750256, 1.084112, 0.5783379, 1, 0, 0.2509804, 1,
1.756469, -0.2597283, 1.871326, 1, 0, 0.2470588, 1,
1.758569, 0.7653198, -0.9433936, 1, 0, 0.2392157, 1,
1.78888, 0.019631, 0.713371, 1, 0, 0.2352941, 1,
1.789797, 0.179241, 2.307526, 1, 0, 0.227451, 1,
1.790777, 1.393862, 1.693155, 1, 0, 0.2235294, 1,
1.802853, -1.012701, 0.09192447, 1, 0, 0.2156863, 1,
1.808699, 0.4746778, 1.554501, 1, 0, 0.2117647, 1,
1.810783, -0.1455027, 0.8610426, 1, 0, 0.2039216, 1,
1.844963, -0.01333375, 2.384003, 1, 0, 0.1960784, 1,
1.848221, 2.020109, 1.475809, 1, 0, 0.1921569, 1,
1.851602, 1.348556, 1.441033, 1, 0, 0.1843137, 1,
1.862825, 0.4043499, 1.518849, 1, 0, 0.1803922, 1,
1.877396, 0.9558657, 0.5837061, 1, 0, 0.172549, 1,
1.879404, -0.38011, 1.688652, 1, 0, 0.1686275, 1,
1.891708, 1.628762, 0.7140916, 1, 0, 0.1607843, 1,
1.92108, -1.191432, 3.985398, 1, 0, 0.1568628, 1,
1.935096, -0.08637704, 0.9204001, 1, 0, 0.1490196, 1,
1.936742, -1.269371, 3.007051, 1, 0, 0.145098, 1,
1.984813, -0.0379899, 0.4594418, 1, 0, 0.1372549, 1,
2.009987, -1.210395, 1.465734, 1, 0, 0.1333333, 1,
2.027047, 0.3969714, 2.096956, 1, 0, 0.1254902, 1,
2.069272, 0.06190204, 2.093167, 1, 0, 0.1215686, 1,
2.094062, 1.482218, 1.638641, 1, 0, 0.1137255, 1,
2.11989, -1.122769, 1.175429, 1, 0, 0.1098039, 1,
2.12745, 0.02681941, 2.054888, 1, 0, 0.1019608, 1,
2.13142, 0.7183167, 1.125149, 1, 0, 0.09411765, 1,
2.141682, 0.296485, 1.130589, 1, 0, 0.09019608, 1,
2.187087, -0.1810445, 1.04361, 1, 0, 0.08235294, 1,
2.224616, -0.07664625, 0.2456504, 1, 0, 0.07843138, 1,
2.276698, -1.657202, 2.006582, 1, 0, 0.07058824, 1,
2.313254, 0.7876551, 2.5209, 1, 0, 0.06666667, 1,
2.374288, -0.6018835, 2.91341, 1, 0, 0.05882353, 1,
2.395158, -0.3994058, 0.6222565, 1, 0, 0.05490196, 1,
2.461184, -1.311379, 2.189626, 1, 0, 0.04705882, 1,
2.470047, -1.169826, 2.292733, 1, 0, 0.04313726, 1,
2.568905, -1.018539, 1.401126, 1, 0, 0.03529412, 1,
2.687047, -0.9422624, 2.832793, 1, 0, 0.03137255, 1,
2.687822, -0.6582408, 2.111519, 1, 0, 0.02352941, 1,
2.882856, 1.004694, 1.41265, 1, 0, 0.01960784, 1,
2.910947, 0.9232649, 2.312294, 1, 0, 0.01176471, 1,
2.930835, -0.5195739, 0.8435553, 1, 0, 0.007843138, 1
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
-0.1979582, -4.245299, -7.30841, 0, -0.5, 0.5, 0.5,
-0.1979582, -4.245299, -7.30841, 1, -0.5, 0.5, 0.5,
-0.1979582, -4.245299, -7.30841, 1, 1.5, 0.5, 0.5,
-0.1979582, -4.245299, -7.30841, 0, 1.5, 0.5, 0.5
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
-4.387413, -0.3076853, -7.30841, 0, -0.5, 0.5, 0.5,
-4.387413, -0.3076853, -7.30841, 1, -0.5, 0.5, 0.5,
-4.387413, -0.3076853, -7.30841, 1, 1.5, 0.5, 0.5,
-4.387413, -0.3076853, -7.30841, 0, 1.5, 0.5, 0.5
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
-4.387413, -4.245299, 0.4202974, 0, -0.5, 0.5, 0.5,
-4.387413, -4.245299, 0.4202974, 1, -0.5, 0.5, 0.5,
-4.387413, -4.245299, 0.4202974, 1, 1.5, 0.5, 0.5,
-4.387413, -4.245299, 0.4202974, 0, 1.5, 0.5, 0.5
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
-3, -3.336619, -5.524862,
2, -3.336619, -5.524862,
-3, -3.336619, -5.524862,
-3, -3.488066, -5.82212,
-2, -3.336619, -5.524862,
-2, -3.488066, -5.82212,
-1, -3.336619, -5.524862,
-1, -3.488066, -5.82212,
0, -3.336619, -5.524862,
0, -3.488066, -5.82212,
1, -3.336619, -5.524862,
1, -3.488066, -5.82212,
2, -3.336619, -5.524862,
2, -3.488066, -5.82212
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
-3, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
-3, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
-3, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
-3, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5,
-2, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
-2, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
-2, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
-2, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5,
-1, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
-1, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
-1, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
-1, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5,
0, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
0, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
0, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
0, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5,
1, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
1, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
1, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
1, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5,
2, -3.790959, -6.416636, 0, -0.5, 0.5, 0.5,
2, -3.790959, -6.416636, 1, -0.5, 0.5, 0.5,
2, -3.790959, -6.416636, 1, 1.5, 0.5, 0.5,
2, -3.790959, -6.416636, 0, 1.5, 0.5, 0.5
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
-3.420615, -3, -5.524862,
-3.420615, 2, -5.524862,
-3.420615, -3, -5.524862,
-3.581748, -3, -5.82212,
-3.420615, -2, -5.524862,
-3.581748, -2, -5.82212,
-3.420615, -1, -5.524862,
-3.581748, -1, -5.82212,
-3.420615, 0, -5.524862,
-3.581748, 0, -5.82212,
-3.420615, 1, -5.524862,
-3.581748, 1, -5.82212,
-3.420615, 2, -5.524862,
-3.581748, 2, -5.82212
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
-3.904014, -3, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, -3, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, -3, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, -3, -6.416636, 0, 1.5, 0.5, 0.5,
-3.904014, -2, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, -2, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, -2, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, -2, -6.416636, 0, 1.5, 0.5, 0.5,
-3.904014, -1, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, -1, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, -1, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, -1, -6.416636, 0, 1.5, 0.5, 0.5,
-3.904014, 0, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, 0, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, 0, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, 0, -6.416636, 0, 1.5, 0.5, 0.5,
-3.904014, 1, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, 1, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, 1, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, 1, -6.416636, 0, 1.5, 0.5, 0.5,
-3.904014, 2, -6.416636, 0, -0.5, 0.5, 0.5,
-3.904014, 2, -6.416636, 1, -0.5, 0.5, 0.5,
-3.904014, 2, -6.416636, 1, 1.5, 0.5, 0.5,
-3.904014, 2, -6.416636, 0, 1.5, 0.5, 0.5
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
-3.420615, -3.336619, -4,
-3.420615, -3.336619, 6,
-3.420615, -3.336619, -4,
-3.581748, -3.488066, -4,
-3.420615, -3.336619, -2,
-3.581748, -3.488066, -2,
-3.420615, -3.336619, 0,
-3.581748, -3.488066, 0,
-3.420615, -3.336619, 2,
-3.581748, -3.488066, 2,
-3.420615, -3.336619, 4,
-3.581748, -3.488066, 4,
-3.420615, -3.336619, 6,
-3.581748, -3.488066, 6
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
"4",
"6"
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
-3.904014, -3.790959, -4, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, -4, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, -4, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, -4, 0, 1.5, 0.5, 0.5,
-3.904014, -3.790959, -2, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, -2, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, -2, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, -2, 0, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 0, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 0, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 0, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 0, 0, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 2, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 2, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 2, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 2, 0, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 4, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 4, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 4, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 4, 0, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 6, 0, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 6, 1, -0.5, 0.5, 0.5,
-3.904014, -3.790959, 6, 1, 1.5, 0.5, 0.5,
-3.904014, -3.790959, 6, 0, 1.5, 0.5, 0.5
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
-3.420615, -3.336619, -5.524862,
-3.420615, 2.721248, -5.524862,
-3.420615, -3.336619, 6.365457,
-3.420615, 2.721248, 6.365457,
-3.420615, -3.336619, -5.524862,
-3.420615, -3.336619, 6.365457,
-3.420615, 2.721248, -5.524862,
-3.420615, 2.721248, 6.365457,
-3.420615, -3.336619, -5.524862,
3.024699, -3.336619, -5.524862,
-3.420615, -3.336619, 6.365457,
3.024699, -3.336619, 6.365457,
-3.420615, 2.721248, -5.524862,
3.024699, 2.721248, -5.524862,
-3.420615, 2.721248, 6.365457,
3.024699, 2.721248, 6.365457,
3.024699, -3.336619, -5.524862,
3.024699, 2.721248, -5.524862,
3.024699, -3.336619, 6.365457,
3.024699, 2.721248, 6.365457,
3.024699, -3.336619, -5.524862,
3.024699, -3.336619, 6.365457,
3.024699, 2.721248, -5.524862,
3.024699, 2.721248, 6.365457
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
var radius = 7.91336;
var distance = 35.20743;
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
mvMatrix.translate( 0.1979582, 0.3076853, -0.4202974 );
mvMatrix.scale( 1.327488, 1.412391, 0.7195837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20743);
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


