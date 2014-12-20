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
-3.08651, -0.2576123, -2.416258, 1, 0, 0, 1,
-2.75749, 0.3118111, -0.7247322, 1, 0.007843138, 0, 1,
-2.689434, 0.6377963, 0.2206888, 1, 0.01176471, 0, 1,
-2.653734, 1.046357, 0.02213015, 1, 0.01960784, 0, 1,
-2.639802, 1.054807, -0.1711865, 1, 0.02352941, 0, 1,
-2.59159, -0.6150576, -2.113378, 1, 0.03137255, 0, 1,
-2.565093, -0.07839837, -1.375075, 1, 0.03529412, 0, 1,
-2.490185, 0.9000195, -0.9365128, 1, 0.04313726, 0, 1,
-2.437048, -1.644072, -2.118178, 1, 0.04705882, 0, 1,
-2.370349, -0.2742981, -2.888338, 1, 0.05490196, 0, 1,
-2.304016, 0.3193191, -0.1582416, 1, 0.05882353, 0, 1,
-2.253933, 2.368583, -1.027605, 1, 0.06666667, 0, 1,
-2.252316, 0.9369605, -1.128196, 1, 0.07058824, 0, 1,
-2.203984, -0.6385162, -2.632284, 1, 0.07843138, 0, 1,
-2.202921, -0.04764728, 1.26713, 1, 0.08235294, 0, 1,
-2.19136, 1.213322, -2.449595, 1, 0.09019608, 0, 1,
-2.160441, 2.664351, 0.637736, 1, 0.09411765, 0, 1,
-2.158727, -0.01268464, -2.094823, 1, 0.1019608, 0, 1,
-2.131872, -1.181825, -2.94174, 1, 0.1098039, 0, 1,
-2.110912, 0.4750389, -1.442775, 1, 0.1137255, 0, 1,
-2.10517, 0.5127578, -2.011358, 1, 0.1215686, 0, 1,
-2.102695, 0.9104168, -0.2642791, 1, 0.1254902, 0, 1,
-2.091888, -0.3042782, -1.565807, 1, 0.1333333, 0, 1,
-2.05002, -0.829865, -2.240107, 1, 0.1372549, 0, 1,
-2.044717, 1.564539, -1.473464, 1, 0.145098, 0, 1,
-2.040585, 0.1653997, -2.378018, 1, 0.1490196, 0, 1,
-2.018241, 1.901704, -1.472787, 1, 0.1568628, 0, 1,
-2.0102, -0.4522277, -2.123491, 1, 0.1607843, 0, 1,
-1.892437, -0.4482739, -3.539492, 1, 0.1686275, 0, 1,
-1.876443, 1.023307, -0.8342074, 1, 0.172549, 0, 1,
-1.838192, 0.3348417, -1.276225, 1, 0.1803922, 0, 1,
-1.810921, 0.8401425, -0.4485095, 1, 0.1843137, 0, 1,
-1.798007, 1.296496, -0.4590443, 1, 0.1921569, 0, 1,
-1.797826, -1.019131, -3.374025, 1, 0.1960784, 0, 1,
-1.784429, 1.84139, -1.222581, 1, 0.2039216, 0, 1,
-1.771026, 0.690664, -1.494137, 1, 0.2117647, 0, 1,
-1.752624, -0.1953949, -3.146243, 1, 0.2156863, 0, 1,
-1.738351, -0.7746743, -0.9030735, 1, 0.2235294, 0, 1,
-1.727023, 0.09804668, -0.906959, 1, 0.227451, 0, 1,
-1.721853, 0.8242769, -1.749021, 1, 0.2352941, 0, 1,
-1.710563, 1.258954, -1.497985, 1, 0.2392157, 0, 1,
-1.7018, 1.268499, -1.865333, 1, 0.2470588, 0, 1,
-1.68915, -0.005780276, -1.898542, 1, 0.2509804, 0, 1,
-1.683045, 0.09562007, -1.863402, 1, 0.2588235, 0, 1,
-1.677902, 1.078264, -1.453799, 1, 0.2627451, 0, 1,
-1.677444, 0.5824639, -1.139144, 1, 0.2705882, 0, 1,
-1.670244, 2.963979, -2.019648, 1, 0.2745098, 0, 1,
-1.647575, 0.552269, -0.5564556, 1, 0.282353, 0, 1,
-1.644856, -0.4344136, -0.5676423, 1, 0.2862745, 0, 1,
-1.631378, 0.1997725, -1.257328, 1, 0.2941177, 0, 1,
-1.627993, 1.495281, -1.653969, 1, 0.3019608, 0, 1,
-1.625921, 0.3440054, -2.742529, 1, 0.3058824, 0, 1,
-1.616358, 0.8823446, -1.119985, 1, 0.3137255, 0, 1,
-1.604215, 1.137694, -1.114255, 1, 0.3176471, 0, 1,
-1.600019, -0.5159375, -2.173078, 1, 0.3254902, 0, 1,
-1.589267, 0.9089543, 0.1049115, 1, 0.3294118, 0, 1,
-1.567308, -1.367776, -2.995623, 1, 0.3372549, 0, 1,
-1.548895, 0.2285378, -1.568348, 1, 0.3411765, 0, 1,
-1.539546, 1.248561, -1.761564, 1, 0.3490196, 0, 1,
-1.53068, -1.664598, -4.214339, 1, 0.3529412, 0, 1,
-1.517054, 0.5171755, -1.237337, 1, 0.3607843, 0, 1,
-1.511643, 1.757731, -0.3050458, 1, 0.3647059, 0, 1,
-1.508129, 0.2083467, -3.038254, 1, 0.372549, 0, 1,
-1.500516, 0.8941715, -1.066998, 1, 0.3764706, 0, 1,
-1.494125, -0.7616253, -1.983718, 1, 0.3843137, 0, 1,
-1.48901, 0.2254338, -2.613899, 1, 0.3882353, 0, 1,
-1.448935, -0.4794076, -1.792249, 1, 0.3960784, 0, 1,
-1.442759, -0.4147415, -2.626094, 1, 0.4039216, 0, 1,
-1.435857, 0.246067, -0.343716, 1, 0.4078431, 0, 1,
-1.430841, -0.9103261, -3.159532, 1, 0.4156863, 0, 1,
-1.419089, 0.01948906, -2.797817, 1, 0.4196078, 0, 1,
-1.417924, 1.634182, -0.9290896, 1, 0.427451, 0, 1,
-1.415883, 2.381937, -0.2072348, 1, 0.4313726, 0, 1,
-1.414321, 0.6663738, 0.826109, 1, 0.4392157, 0, 1,
-1.410911, -0.502121, -1.988854, 1, 0.4431373, 0, 1,
-1.391761, -0.1575993, -1.451455, 1, 0.4509804, 0, 1,
-1.391627, 0.5021231, 1.679203, 1, 0.454902, 0, 1,
-1.390182, -0.1443657, -2.919867, 1, 0.4627451, 0, 1,
-1.376881, 0.125502, -0.6121333, 1, 0.4666667, 0, 1,
-1.362756, 0.4523384, -1.220056, 1, 0.4745098, 0, 1,
-1.362405, -1.236301, -2.301633, 1, 0.4784314, 0, 1,
-1.345433, 0.3568951, -1.020259, 1, 0.4862745, 0, 1,
-1.339466, -1.583807, -1.143281, 1, 0.4901961, 0, 1,
-1.334649, -0.3526455, -2.661781, 1, 0.4980392, 0, 1,
-1.330207, -0.7245073, -2.500595, 1, 0.5058824, 0, 1,
-1.326493, -1.532937, -3.159945, 1, 0.509804, 0, 1,
-1.324061, -0.6537097, -2.252717, 1, 0.5176471, 0, 1,
-1.315036, 0.5440944, -1.780103, 1, 0.5215687, 0, 1,
-1.314624, -1.402571, -1.861737, 1, 0.5294118, 0, 1,
-1.312781, -0.3208455, -3.147157, 1, 0.5333334, 0, 1,
-1.30841, 0.9164618, 0.4982568, 1, 0.5411765, 0, 1,
-1.29959, 0.1836561, -3.491004, 1, 0.5450981, 0, 1,
-1.297215, 1.400258, -1.69786, 1, 0.5529412, 0, 1,
-1.29106, 1.145269, -1.817773, 1, 0.5568628, 0, 1,
-1.289032, -1.419325, -1.951736, 1, 0.5647059, 0, 1,
-1.287418, 1.722418, -1.012103, 1, 0.5686275, 0, 1,
-1.285698, 0.7099397, -0.275584, 1, 0.5764706, 0, 1,
-1.282616, 0.5340079, -2.586486, 1, 0.5803922, 0, 1,
-1.276093, 1.056546, -1.300613, 1, 0.5882353, 0, 1,
-1.274412, -0.1176208, -0.2242385, 1, 0.5921569, 0, 1,
-1.273124, -1.100891, -2.530926, 1, 0.6, 0, 1,
-1.27287, 0.273937, -2.708855, 1, 0.6078432, 0, 1,
-1.272421, -1.418157, -2.751558, 1, 0.6117647, 0, 1,
-1.267107, -1.964494, -2.100409, 1, 0.6196079, 0, 1,
-1.261214, 0.04426308, -1.499006, 1, 0.6235294, 0, 1,
-1.257004, 1.16802, -0.7826806, 1, 0.6313726, 0, 1,
-1.250634, 0.4379413, -1.496364, 1, 0.6352941, 0, 1,
-1.247778, 0.8659925, -1.897708, 1, 0.6431373, 0, 1,
-1.244472, 0.5477735, -2.273981, 1, 0.6470588, 0, 1,
-1.2391, -0.8390774, -2.282904, 1, 0.654902, 0, 1,
-1.237955, 2.119589, -0.2777965, 1, 0.6588235, 0, 1,
-1.226479, -1.041615, -2.096797, 1, 0.6666667, 0, 1,
-1.223171, -0.4020002, -1.336525, 1, 0.6705883, 0, 1,
-1.218386, -0.08990858, -0.5477767, 1, 0.6784314, 0, 1,
-1.204138, -1.080974, -2.081527, 1, 0.682353, 0, 1,
-1.190129, -1.095831, 0.09609267, 1, 0.6901961, 0, 1,
-1.181292, 0.7560613, -0.9660699, 1, 0.6941177, 0, 1,
-1.173839, 0.8668556, -1.266023, 1, 0.7019608, 0, 1,
-1.172836, -1.118521, -1.946705, 1, 0.7098039, 0, 1,
-1.170674, 0.2902765, -1.497176, 1, 0.7137255, 0, 1,
-1.162446, -0.5467837, -1.965227, 1, 0.7215686, 0, 1,
-1.157131, -0.294944, -1.90193, 1, 0.7254902, 0, 1,
-1.154559, 1.408531, -0.1171443, 1, 0.7333333, 0, 1,
-1.153008, 0.5329552, -1.007677, 1, 0.7372549, 0, 1,
-1.150292, 0.7208448, -2.385995, 1, 0.7450981, 0, 1,
-1.146368, -0.4602505, -2.357951, 1, 0.7490196, 0, 1,
-1.140729, 0.746246, -1.162907, 1, 0.7568628, 0, 1,
-1.130891, -0.8950073, -2.831267, 1, 0.7607843, 0, 1,
-1.121343, 0.3250089, 0.1661714, 1, 0.7686275, 0, 1,
-1.120722, -1.607932, -2.723771, 1, 0.772549, 0, 1,
-1.120301, 1.057104, -0.2596183, 1, 0.7803922, 0, 1,
-1.104069, -0.5673677, -2.481283, 1, 0.7843137, 0, 1,
-1.096519, -0.2661451, -1.112265, 1, 0.7921569, 0, 1,
-1.094252, 1.304997, -1.332819, 1, 0.7960784, 0, 1,
-1.086419, -0.1813256, -1.327733, 1, 0.8039216, 0, 1,
-1.079477, 0.5393796, -0.8653858, 1, 0.8117647, 0, 1,
-1.077902, 1.709705, -1.277654, 1, 0.8156863, 0, 1,
-1.07469, 0.2587495, -2.085542, 1, 0.8235294, 0, 1,
-1.073082, 2.484535, -1.944317, 1, 0.827451, 0, 1,
-1.070337, -1.907465, -2.055699, 1, 0.8352941, 0, 1,
-1.066926, -0.03870898, -1.634766, 1, 0.8392157, 0, 1,
-1.066018, 2.12345, -0.1028712, 1, 0.8470588, 0, 1,
-1.062152, -0.7821791, -1.927395, 1, 0.8509804, 0, 1,
-1.053092, -1.533063, -2.351489, 1, 0.8588235, 0, 1,
-1.052873, -0.2145471, -2.583152, 1, 0.8627451, 0, 1,
-1.052253, 0.03908556, -1.460368, 1, 0.8705882, 0, 1,
-1.052002, 0.816438, -0.06576829, 1, 0.8745098, 0, 1,
-1.045253, 1.237297, -1.58545, 1, 0.8823529, 0, 1,
-1.037522, -0.7781829, -0.6399842, 1, 0.8862745, 0, 1,
-1.030237, -1.554999, -0.7701184, 1, 0.8941177, 0, 1,
-1.030071, -0.2557941, -1.724319, 1, 0.8980392, 0, 1,
-1.027102, -0.9651754, -1.992792, 1, 0.9058824, 0, 1,
-1.026642, 0.2895559, -1.295632, 1, 0.9137255, 0, 1,
-1.025365, 0.7390026, 0.09063075, 1, 0.9176471, 0, 1,
-1.02031, 1.411379, -1.336636, 1, 0.9254902, 0, 1,
-1.019464, -1.435665, -1.510922, 1, 0.9294118, 0, 1,
-1.017356, 0.7264892, -1.142061, 1, 0.9372549, 0, 1,
-1.015608, -0.18964, -2.867737, 1, 0.9411765, 0, 1,
-1.013041, -0.3793034, -2.186445, 1, 0.9490196, 0, 1,
-1.006689, 1.079434, -0.3955611, 1, 0.9529412, 0, 1,
-1.006634, -0.9415612, -1.239625, 1, 0.9607843, 0, 1,
-1.002362, -0.836701, -3.492053, 1, 0.9647059, 0, 1,
-0.9988545, -0.7269309, -3.146087, 1, 0.972549, 0, 1,
-0.9917738, 0.115699, -2.415305, 1, 0.9764706, 0, 1,
-0.9917176, 1.343902, 0.0806518, 1, 0.9843137, 0, 1,
-0.9888106, 1.273474, -1.990798, 1, 0.9882353, 0, 1,
-0.9858235, 1.102229, -0.1939549, 1, 0.9960784, 0, 1,
-0.9778481, -1.938, -2.523679, 0.9960784, 1, 0, 1,
-0.9747865, 3.353753, -0.4034508, 0.9921569, 1, 0, 1,
-0.9696194, 0.1407635, -2.218189, 0.9843137, 1, 0, 1,
-0.9678454, 0.1817686, -3.930728, 0.9803922, 1, 0, 1,
-0.966087, 2.352617, -1.543454, 0.972549, 1, 0, 1,
-0.9596096, 0.7596073, -0.1345583, 0.9686275, 1, 0, 1,
-0.9585855, -0.5369762, -2.914737, 0.9607843, 1, 0, 1,
-0.9574519, 0.8645113, -2.457728, 0.9568627, 1, 0, 1,
-0.9558444, -1.693637, -5.124903, 0.9490196, 1, 0, 1,
-0.9542537, -0.5456174, -2.406279, 0.945098, 1, 0, 1,
-0.9541214, 1.335584, 1.326789, 0.9372549, 1, 0, 1,
-0.9420896, -0.1408976, -0.06037441, 0.9333333, 1, 0, 1,
-0.9396402, -0.420422, -0.9500575, 0.9254902, 1, 0, 1,
-0.9385948, 0.1015927, -2.071715, 0.9215686, 1, 0, 1,
-0.9311603, 0.2261468, -2.087231, 0.9137255, 1, 0, 1,
-0.9244534, 1.611403, -3.688143, 0.9098039, 1, 0, 1,
-0.9227506, -0.07442465, -1.476398, 0.9019608, 1, 0, 1,
-0.9182232, 0.339758, 1.09873, 0.8941177, 1, 0, 1,
-0.912324, 1.839394, 0.002969072, 0.8901961, 1, 0, 1,
-0.8976722, 2.017836, 0.8456376, 0.8823529, 1, 0, 1,
-0.896926, 0.03202716, -1.061151, 0.8784314, 1, 0, 1,
-0.8920467, -0.9938574, -2.575777, 0.8705882, 1, 0, 1,
-0.8863326, -0.4468246, -1.611359, 0.8666667, 1, 0, 1,
-0.8861169, 1.143743, -1.597122, 0.8588235, 1, 0, 1,
-0.8796127, 0.9858901, -0.05588156, 0.854902, 1, 0, 1,
-0.8729692, 1.045391, -0.6034747, 0.8470588, 1, 0, 1,
-0.8697023, 0.4645359, -0.5549363, 0.8431373, 1, 0, 1,
-0.8617848, -0.2264339, -2.123538, 0.8352941, 1, 0, 1,
-0.8610944, 2.341042, -0.39599, 0.8313726, 1, 0, 1,
-0.855884, -0.5136651, -1.851398, 0.8235294, 1, 0, 1,
-0.8499234, -0.2907415, -1.500409, 0.8196079, 1, 0, 1,
-0.8445683, -0.7566557, -2.95284, 0.8117647, 1, 0, 1,
-0.843833, 0.1150095, -0.5276912, 0.8078431, 1, 0, 1,
-0.8375751, -1.702504, -2.102649, 0.8, 1, 0, 1,
-0.8351994, -0.2765067, -3.234095, 0.7921569, 1, 0, 1,
-0.8327169, -0.1732547, -1.397942, 0.7882353, 1, 0, 1,
-0.8302346, 0.2291097, -1.126935, 0.7803922, 1, 0, 1,
-0.8290843, -0.02431233, -0.1868021, 0.7764706, 1, 0, 1,
-0.8283718, 1.351146, 1.423087, 0.7686275, 1, 0, 1,
-0.8248064, 0.2351792, -1.605123, 0.7647059, 1, 0, 1,
-0.8194824, 0.2187376, -0.9944232, 0.7568628, 1, 0, 1,
-0.8193462, -2.333888, -1.879197, 0.7529412, 1, 0, 1,
-0.8098915, -0.166303, -2.828331, 0.7450981, 1, 0, 1,
-0.8067959, -0.8539584, -3.83868, 0.7411765, 1, 0, 1,
-0.8044052, -0.1766116, -1.548211, 0.7333333, 1, 0, 1,
-0.8006025, -0.01826392, -0.604152, 0.7294118, 1, 0, 1,
-0.7922688, 0.1845996, -1.869809, 0.7215686, 1, 0, 1,
-0.789397, 2.962013, -2.218586, 0.7176471, 1, 0, 1,
-0.7844576, -0.5628985, -3.462735, 0.7098039, 1, 0, 1,
-0.7805204, -0.5439396, -1.486135, 0.7058824, 1, 0, 1,
-0.7787895, 0.0814765, -2.690106, 0.6980392, 1, 0, 1,
-0.7768314, -0.4606429, -3.111537, 0.6901961, 1, 0, 1,
-0.7743252, 0.9337813, -0.6724182, 0.6862745, 1, 0, 1,
-0.7644653, -0.2539432, -2.227257, 0.6784314, 1, 0, 1,
-0.7602447, 1.876413, -1.025434, 0.6745098, 1, 0, 1,
-0.7569052, 0.7654982, -0.16928, 0.6666667, 1, 0, 1,
-0.7536097, -0.4551672, -2.437435, 0.6627451, 1, 0, 1,
-0.7519543, 1.735923, -1.018263, 0.654902, 1, 0, 1,
-0.744764, 0.3555117, 0.222485, 0.6509804, 1, 0, 1,
-0.7447309, -0.5763401, -1.559167, 0.6431373, 1, 0, 1,
-0.7445166, -1.791443, -3.770809, 0.6392157, 1, 0, 1,
-0.7436489, 0.03139978, -2.655312, 0.6313726, 1, 0, 1,
-0.74158, 0.2275093, -1.042145, 0.627451, 1, 0, 1,
-0.7370064, 1.72117, 0.1945762, 0.6196079, 1, 0, 1,
-0.7368494, -1.450515, -2.324772, 0.6156863, 1, 0, 1,
-0.7342111, 0.6761877, 0.6240063, 0.6078432, 1, 0, 1,
-0.7322344, 0.8064915, -2.285113, 0.6039216, 1, 0, 1,
-0.7244012, 1.195758, -0.8631957, 0.5960785, 1, 0, 1,
-0.7232895, 1.196804, -0.4772312, 0.5882353, 1, 0, 1,
-0.7210159, 0.03184509, -1.974183, 0.5843138, 1, 0, 1,
-0.7194577, -1.163325, -3.758388, 0.5764706, 1, 0, 1,
-0.719016, -0.7326475, -1.681311, 0.572549, 1, 0, 1,
-0.7149215, 0.2300757, -0.6245412, 0.5647059, 1, 0, 1,
-0.7146103, -0.1947114, -1.877553, 0.5607843, 1, 0, 1,
-0.7104428, 0.01168734, -0.9046087, 0.5529412, 1, 0, 1,
-0.7092814, 1.25971, -2.488128, 0.5490196, 1, 0, 1,
-0.706592, -1.097857, -3.404771, 0.5411765, 1, 0, 1,
-0.7041288, 0.324748, -2.732954, 0.5372549, 1, 0, 1,
-0.6952688, -0.05227694, -1.964016, 0.5294118, 1, 0, 1,
-0.6927826, -0.4389957, -0.7543623, 0.5254902, 1, 0, 1,
-0.6908581, 0.03568179, -0.8991087, 0.5176471, 1, 0, 1,
-0.6900548, -0.04591339, -2.403284, 0.5137255, 1, 0, 1,
-0.6868061, 0.6732176, -1.433827, 0.5058824, 1, 0, 1,
-0.6842947, 0.2056445, 0.8190779, 0.5019608, 1, 0, 1,
-0.679222, 0.7600762, 0.1237563, 0.4941176, 1, 0, 1,
-0.6736497, 0.234252, 1.009625, 0.4862745, 1, 0, 1,
-0.673323, 1.19943, 0.08681879, 0.4823529, 1, 0, 1,
-0.6727456, 0.8609951, -0.9725817, 0.4745098, 1, 0, 1,
-0.6668449, 1.797519, 0.3828291, 0.4705882, 1, 0, 1,
-0.6658308, -0.1656055, -0.9007251, 0.4627451, 1, 0, 1,
-0.6635725, 0.8465755, -1.092838, 0.4588235, 1, 0, 1,
-0.6601614, -0.4150092, -2.241042, 0.4509804, 1, 0, 1,
-0.6565048, 0.01663801, -1.371547, 0.4470588, 1, 0, 1,
-0.6563089, -0.7377188, -2.881721, 0.4392157, 1, 0, 1,
-0.652149, -0.1790279, -0.9242125, 0.4352941, 1, 0, 1,
-0.6494952, 0.4195544, -0.71705, 0.427451, 1, 0, 1,
-0.6458779, 1.035039, 0.2247154, 0.4235294, 1, 0, 1,
-0.6389588, -1.433372, -2.989289, 0.4156863, 1, 0, 1,
-0.6372754, -0.5719698, -0.5582017, 0.4117647, 1, 0, 1,
-0.6355486, -0.1474468, -1.183517, 0.4039216, 1, 0, 1,
-0.6344363, -0.01496122, 0.09780759, 0.3960784, 1, 0, 1,
-0.6342643, -0.5566446, -3.724077, 0.3921569, 1, 0, 1,
-0.6243657, -0.1075016, -1.330654, 0.3843137, 1, 0, 1,
-0.6233777, 1.924342, 1.038876, 0.3803922, 1, 0, 1,
-0.6223754, 0.6288048, -0.9915311, 0.372549, 1, 0, 1,
-0.6194481, -0.175643, -1.859425, 0.3686275, 1, 0, 1,
-0.6173708, 1.51996, -1.945155, 0.3607843, 1, 0, 1,
-0.6121954, 0.7726515, -0.4302415, 0.3568628, 1, 0, 1,
-0.6121928, -0.5033954, -1.701701, 0.3490196, 1, 0, 1,
-0.611942, 0.7121777, -1.102954, 0.345098, 1, 0, 1,
-0.6096535, 2.201019, 0.01418799, 0.3372549, 1, 0, 1,
-0.6086282, -0.3728958, -0.9186704, 0.3333333, 1, 0, 1,
-0.6042602, 0.4802659, -2.876204, 0.3254902, 1, 0, 1,
-0.6023511, -2.062451, -3.277665, 0.3215686, 1, 0, 1,
-0.5995756, 0.06204875, -1.738716, 0.3137255, 1, 0, 1,
-0.5981287, -0.5097362, -3.054406, 0.3098039, 1, 0, 1,
-0.5960474, 0.005459945, -1.329136, 0.3019608, 1, 0, 1,
-0.5953321, -0.9785385, -3.297314, 0.2941177, 1, 0, 1,
-0.5953056, 0.8666476, 0.3336146, 0.2901961, 1, 0, 1,
-0.5937875, -1.977458, -1.696651, 0.282353, 1, 0, 1,
-0.5919225, 0.921131, 0.2061307, 0.2784314, 1, 0, 1,
-0.5912916, -1.239744, -2.971936, 0.2705882, 1, 0, 1,
-0.588727, -0.9564676, -2.020652, 0.2666667, 1, 0, 1,
-0.5839591, -0.2549006, -1.239254, 0.2588235, 1, 0, 1,
-0.5827508, 0.7226496, -0.4942056, 0.254902, 1, 0, 1,
-0.5826641, -0.8093715, -3.902414, 0.2470588, 1, 0, 1,
-0.5824994, 0.6926764, -1.116427, 0.2431373, 1, 0, 1,
-0.5634068, -0.1090777, -2.009144, 0.2352941, 1, 0, 1,
-0.5621021, 1.269634, -1.496237, 0.2313726, 1, 0, 1,
-0.5603645, 0.7983217, -2.01965, 0.2235294, 1, 0, 1,
-0.5581827, -0.2389213, -1.381212, 0.2196078, 1, 0, 1,
-0.5566261, -0.5279073, -3.511533, 0.2117647, 1, 0, 1,
-0.5522786, -0.7154669, -2.977561, 0.2078431, 1, 0, 1,
-0.5513663, 0.4563506, -2.069255, 0.2, 1, 0, 1,
-0.5509446, -0.1308983, -2.051649, 0.1921569, 1, 0, 1,
-0.5442579, -0.5069515, -1.373569, 0.1882353, 1, 0, 1,
-0.5363804, 1.643097, 1.079981, 0.1803922, 1, 0, 1,
-0.5248901, -0.8690021, -2.958865, 0.1764706, 1, 0, 1,
-0.5214438, 1.01947, -0.870342, 0.1686275, 1, 0, 1,
-0.5177775, -0.05103911, -1.507253, 0.1647059, 1, 0, 1,
-0.5136554, 0.009630547, -1.464972, 0.1568628, 1, 0, 1,
-0.5095069, -0.3004354, -0.9322489, 0.1529412, 1, 0, 1,
-0.5072634, -0.7507252, -3.773683, 0.145098, 1, 0, 1,
-0.5060252, 0.4079353, -1.475971, 0.1411765, 1, 0, 1,
-0.5060108, -0.6750659, -3.286308, 0.1333333, 1, 0, 1,
-0.4986097, -0.4933877, -3.191193, 0.1294118, 1, 0, 1,
-0.4967018, -0.09666654, -0.9777789, 0.1215686, 1, 0, 1,
-0.4907421, 1.051065, 0.008390196, 0.1176471, 1, 0, 1,
-0.4881499, 0.5803639, -3.305389, 0.1098039, 1, 0, 1,
-0.4798721, -2.078717, -4.186249, 0.1058824, 1, 0, 1,
-0.4770551, -0.2014325, -2.784604, 0.09803922, 1, 0, 1,
-0.4702697, 1.419114, -1.557425, 0.09019608, 1, 0, 1,
-0.4685048, 0.2888317, -0.8266705, 0.08627451, 1, 0, 1,
-0.4657144, -0.005440533, -3.820141, 0.07843138, 1, 0, 1,
-0.4655098, 0.02017426, 0.01979454, 0.07450981, 1, 0, 1,
-0.4634739, 1.694062, 0.1580547, 0.06666667, 1, 0, 1,
-0.4628261, -0.4086663, -2.908986, 0.0627451, 1, 0, 1,
-0.4597496, -0.6519629, -0.967677, 0.05490196, 1, 0, 1,
-0.4572815, 0.4349909, -0.5631009, 0.05098039, 1, 0, 1,
-0.4502609, 0.0598352, -0.8730304, 0.04313726, 1, 0, 1,
-0.4494813, -0.9535947, -1.898421, 0.03921569, 1, 0, 1,
-0.4437033, -0.8784537, -1.086376, 0.03137255, 1, 0, 1,
-0.4411918, 0.4435326, 2.094323, 0.02745098, 1, 0, 1,
-0.4407475, 2.142713, -1.745935, 0.01960784, 1, 0, 1,
-0.4405654, 1.568343, -1.147934, 0.01568628, 1, 0, 1,
-0.4403386, -1.712145, -2.458429, 0.007843138, 1, 0, 1,
-0.4278269, 0.5056342, 0.7428539, 0.003921569, 1, 0, 1,
-0.4275095, 0.08225011, -1.199461, 0, 1, 0.003921569, 1,
-0.421992, -0.9375783, -2.952669, 0, 1, 0.01176471, 1,
-0.4217667, -0.6757538, -3.030686, 0, 1, 0.01568628, 1,
-0.4196917, -2.200316, -2.63415, 0, 1, 0.02352941, 1,
-0.4184517, -0.1163815, -2.629532, 0, 1, 0.02745098, 1,
-0.4133675, 0.1500123, -0.8509386, 0, 1, 0.03529412, 1,
-0.4064507, 0.06899518, -0.9494972, 0, 1, 0.03921569, 1,
-0.4035838, 0.181138, -1.042979, 0, 1, 0.04705882, 1,
-0.4004513, -0.05842869, -0.5826198, 0, 1, 0.05098039, 1,
-0.3960414, -0.2069742, -3.184088, 0, 1, 0.05882353, 1,
-0.3929274, -0.8745414, -2.441777, 0, 1, 0.0627451, 1,
-0.3925394, -1.313628, -1.959131, 0, 1, 0.07058824, 1,
-0.3865464, 0.4250604, -0.7062274, 0, 1, 0.07450981, 1,
-0.3840649, -0.9913793, -1.258783, 0, 1, 0.08235294, 1,
-0.3832975, -0.5956421, -3.233133, 0, 1, 0.08627451, 1,
-0.3774116, 1.905935, -0.7078052, 0, 1, 0.09411765, 1,
-0.3719621, 2.080632, -0.1831909, 0, 1, 0.1019608, 1,
-0.3638018, -0.8433629, -1.303627, 0, 1, 0.1058824, 1,
-0.3626957, -1.517445, -3.795235, 0, 1, 0.1137255, 1,
-0.3549006, -0.410264, -2.908591, 0, 1, 0.1176471, 1,
-0.3547215, -1.144645, -2.281494, 0, 1, 0.1254902, 1,
-0.3532647, 0.4162561, 0.3359184, 0, 1, 0.1294118, 1,
-0.3515786, 0.2087353, -1.452386, 0, 1, 0.1372549, 1,
-0.3463363, -0.3827602, -1.255274, 0, 1, 0.1411765, 1,
-0.3454697, -0.830469, -2.315681, 0, 1, 0.1490196, 1,
-0.3450776, -0.5884522, -2.970026, 0, 1, 0.1529412, 1,
-0.3442265, -0.6976456, -2.350114, 0, 1, 0.1607843, 1,
-0.3425568, -0.5877885, -1.113292, 0, 1, 0.1647059, 1,
-0.3417566, -0.1589698, -2.788428, 0, 1, 0.172549, 1,
-0.3397485, 1.910277, 1.255263, 0, 1, 0.1764706, 1,
-0.3379345, 0.3080815, -1.508738, 0, 1, 0.1843137, 1,
-0.3377199, -1.035381, -3.286128, 0, 1, 0.1882353, 1,
-0.3348487, -1.015082, -3.958588, 0, 1, 0.1960784, 1,
-0.3347795, 0.6964047, 0.8014584, 0, 1, 0.2039216, 1,
-0.3314677, -0.628639, -2.358169, 0, 1, 0.2078431, 1,
-0.3290336, 0.1662887, -3.232471, 0, 1, 0.2156863, 1,
-0.3272876, 0.01104713, -1.364877, 0, 1, 0.2196078, 1,
-0.3265794, -0.8038479, -1.946904, 0, 1, 0.227451, 1,
-0.3254093, -1.570639, -3.387378, 0, 1, 0.2313726, 1,
-0.3234111, 0.7505084, -0.1443487, 0, 1, 0.2392157, 1,
-0.3227638, -0.4974062, -2.166222, 0, 1, 0.2431373, 1,
-0.3215897, 0.7076126, -0.447608, 0, 1, 0.2509804, 1,
-0.3215862, -0.5271512, -2.298672, 0, 1, 0.254902, 1,
-0.3199461, 1.279622, -0.558224, 0, 1, 0.2627451, 1,
-0.3196595, -1.611686, -3.233335, 0, 1, 0.2666667, 1,
-0.3157419, 0.6188953, -0.1757277, 0, 1, 0.2745098, 1,
-0.3140785, 0.5923659, -0.7316355, 0, 1, 0.2784314, 1,
-0.3122255, 2.157419, 1.183856, 0, 1, 0.2862745, 1,
-0.3114756, -1.136068, -4.927118, 0, 1, 0.2901961, 1,
-0.3062627, -0.539138, -1.789697, 0, 1, 0.2980392, 1,
-0.3058527, 0.2335955, -0.7681597, 0, 1, 0.3058824, 1,
-0.3024743, -0.2551358, -2.499601, 0, 1, 0.3098039, 1,
-0.2962448, 0.1086513, -2.951868, 0, 1, 0.3176471, 1,
-0.2890405, 1.342113, -1.829596, 0, 1, 0.3215686, 1,
-0.2848328, 0.5962567, 0.7132855, 0, 1, 0.3294118, 1,
-0.2840156, -0.9095001, -2.516049, 0, 1, 0.3333333, 1,
-0.2821667, 0.2563799, -2.729599, 0, 1, 0.3411765, 1,
-0.2791696, -1.007809, -4.692741, 0, 1, 0.345098, 1,
-0.2760793, 1.015449, 0.0408923, 0, 1, 0.3529412, 1,
-0.2751965, 0.3204396, -1.762251, 0, 1, 0.3568628, 1,
-0.2727617, 0.979872, 0.3350803, 0, 1, 0.3647059, 1,
-0.2717251, 1.185152, -4.106169, 0, 1, 0.3686275, 1,
-0.271363, -1.079988, -3.405642, 0, 1, 0.3764706, 1,
-0.2699492, 2.614691, 0.2322211, 0, 1, 0.3803922, 1,
-0.2698886, 2.153384, 0.7718102, 0, 1, 0.3882353, 1,
-0.2644191, 1.361221, -0.4674322, 0, 1, 0.3921569, 1,
-0.261662, 0.8100252, 0.08248625, 0, 1, 0.4, 1,
-0.2555641, -0.461832, -1.639303, 0, 1, 0.4078431, 1,
-0.253427, 1.920567, -0.9228465, 0, 1, 0.4117647, 1,
-0.25207, 0.2935468, -2.839757, 0, 1, 0.4196078, 1,
-0.2517501, 1.400123, 0.1354253, 0, 1, 0.4235294, 1,
-0.2510868, 0.5486647, 0.6023825, 0, 1, 0.4313726, 1,
-0.2475542, 0.690612, -1.012344, 0, 1, 0.4352941, 1,
-0.2457789, -0.3597936, -2.895261, 0, 1, 0.4431373, 1,
-0.2440977, -1.902375, -3.372849, 0, 1, 0.4470588, 1,
-0.2393287, 0.5563444, 1.134115, 0, 1, 0.454902, 1,
-0.238174, 1.038736, -0.855538, 0, 1, 0.4588235, 1,
-0.2273875, -1.157638, -1.53343, 0, 1, 0.4666667, 1,
-0.2148271, -0.6131281, -3.252981, 0, 1, 0.4705882, 1,
-0.2107903, 1.061764, 0.3997141, 0, 1, 0.4784314, 1,
-0.2098133, 0.2406894, -1.779501, 0, 1, 0.4823529, 1,
-0.209174, 0.7928072, -0.4395408, 0, 1, 0.4901961, 1,
-0.2081406, -0.6733408, -3.711742, 0, 1, 0.4941176, 1,
-0.2023237, 0.8420144, 2.177367, 0, 1, 0.5019608, 1,
-0.1935795, -0.4456601, -4.769021, 0, 1, 0.509804, 1,
-0.1929715, 0.5142059, -0.2245495, 0, 1, 0.5137255, 1,
-0.1903448, 1.039666, -1.241874, 0, 1, 0.5215687, 1,
-0.1872284, -0.8118486, -2.479953, 0, 1, 0.5254902, 1,
-0.1837179, -0.7306108, -1.666505, 0, 1, 0.5333334, 1,
-0.1832219, -1.042641, -3.991566, 0, 1, 0.5372549, 1,
-0.1807676, -0.5973201, -3.708718, 0, 1, 0.5450981, 1,
-0.1804936, -0.356321, -1.803867, 0, 1, 0.5490196, 1,
-0.1794885, -0.5538008, -2.556835, 0, 1, 0.5568628, 1,
-0.179438, -0.2526837, -0.8975987, 0, 1, 0.5607843, 1,
-0.1748904, -2.268381, -3.549139, 0, 1, 0.5686275, 1,
-0.1717159, -0.1016007, -3.329213, 0, 1, 0.572549, 1,
-0.1714147, -0.3846776, -0.6950887, 0, 1, 0.5803922, 1,
-0.1704463, -0.625127, -2.265811, 0, 1, 0.5843138, 1,
-0.1686525, -0.4339503, -3.337043, 0, 1, 0.5921569, 1,
-0.1679712, -0.8603194, -0.6310025, 0, 1, 0.5960785, 1,
-0.1659897, -1.800363, -2.865856, 0, 1, 0.6039216, 1,
-0.164965, -0.003620562, -1.92214, 0, 1, 0.6117647, 1,
-0.1638479, 1.033299, 0.5260841, 0, 1, 0.6156863, 1,
-0.1626638, -0.7419915, -3.061139, 0, 1, 0.6235294, 1,
-0.1580098, 1.36986, -0.3829769, 0, 1, 0.627451, 1,
-0.1558381, 1.57607, -1.187665, 0, 1, 0.6352941, 1,
-0.1544357, 1.881809, 1.057671, 0, 1, 0.6392157, 1,
-0.1504376, -0.3158612, -2.346956, 0, 1, 0.6470588, 1,
-0.150326, 1.033952, -1.663862, 0, 1, 0.6509804, 1,
-0.1459111, -0.2295411, -2.880474, 0, 1, 0.6588235, 1,
-0.1428397, -0.8114118, -1.990174, 0, 1, 0.6627451, 1,
-0.1404539, 0.5503966, 0.5202023, 0, 1, 0.6705883, 1,
-0.1358114, -0.7450974, -2.418204, 0, 1, 0.6745098, 1,
-0.1344445, -1.067832, -3.199667, 0, 1, 0.682353, 1,
-0.1307359, 0.1371616, -0.1175612, 0, 1, 0.6862745, 1,
-0.1280484, -0.9165042, -1.998549, 0, 1, 0.6941177, 1,
-0.1274389, 0.8825067, -0.5234147, 0, 1, 0.7019608, 1,
-0.1271129, 0.01590207, -2.755908, 0, 1, 0.7058824, 1,
-0.1266894, -0.1183249, -0.4344393, 0, 1, 0.7137255, 1,
-0.1214381, 0.4585657, -0.8938623, 0, 1, 0.7176471, 1,
-0.1205942, -1.033589, -1.619734, 0, 1, 0.7254902, 1,
-0.1186751, 2.437538, -0.5495731, 0, 1, 0.7294118, 1,
-0.1165226, 0.8289926, -1.111328, 0, 1, 0.7372549, 1,
-0.1155507, 1.469493, -2.215897, 0, 1, 0.7411765, 1,
-0.1149677, -0.7889871, -4.229779, 0, 1, 0.7490196, 1,
-0.1137793, -0.7872787, -1.920716, 0, 1, 0.7529412, 1,
-0.1122748, -0.4837134, -0.7941577, 0, 1, 0.7607843, 1,
-0.1064382, -0.6386045, -3.952187, 0, 1, 0.7647059, 1,
-0.1047972, -0.7541096, -3.561773, 0, 1, 0.772549, 1,
-0.1004546, -0.8714803, -2.957242, 0, 1, 0.7764706, 1,
-0.09628065, -2.517821, -2.965649, 0, 1, 0.7843137, 1,
-0.09162464, 0.5892411, -0.1713671, 0, 1, 0.7882353, 1,
-0.08284698, 0.4660313, -0.7750232, 0, 1, 0.7960784, 1,
-0.08180453, 1.910861, -0.8981178, 0, 1, 0.8039216, 1,
-0.07609046, 2.07148, -1.116884, 0, 1, 0.8078431, 1,
-0.07572351, 0.7267176, -0.6093185, 0, 1, 0.8156863, 1,
-0.07526787, 0.5694681, -0.6037283, 0, 1, 0.8196079, 1,
-0.07407632, 0.447421, 0.08441914, 0, 1, 0.827451, 1,
-0.07294623, -0.4717197, -4.173606, 0, 1, 0.8313726, 1,
-0.06525715, -0.08365754, -2.98095, 0, 1, 0.8392157, 1,
-0.063247, 1.108178, 1.102124, 0, 1, 0.8431373, 1,
-0.06283502, 0.2186408, -1.326316, 0, 1, 0.8509804, 1,
-0.0603841, 1.140222, -0.9589447, 0, 1, 0.854902, 1,
-0.05461978, 0.3535598, 0.01079102, 0, 1, 0.8627451, 1,
-0.05168054, -2.129636, -3.493263, 0, 1, 0.8666667, 1,
-0.04591926, 1.936468, 0.1443084, 0, 1, 0.8745098, 1,
-0.03929408, 0.9105318, 0.9923491, 0, 1, 0.8784314, 1,
-0.03905052, -0.1443903, -0.4423622, 0, 1, 0.8862745, 1,
-0.03756208, 0.7083854, -0.6620092, 0, 1, 0.8901961, 1,
-0.03578251, -1.058814, -2.531746, 0, 1, 0.8980392, 1,
-0.03555778, -0.180792, -2.285435, 0, 1, 0.9058824, 1,
-0.03215371, -0.3965925, -2.106449, 0, 1, 0.9098039, 1,
-0.03141214, -0.8290114, -3.785929, 0, 1, 0.9176471, 1,
-0.02700743, -2.259746, -4.164975, 0, 1, 0.9215686, 1,
-0.02698594, -2.225519, -2.205774, 0, 1, 0.9294118, 1,
-0.02121085, -0.2248597, -2.013809, 0, 1, 0.9333333, 1,
-0.01488109, 1.223497, -0.881522, 0, 1, 0.9411765, 1,
-0.01395301, 0.4729738, 0.3868913, 0, 1, 0.945098, 1,
-0.01317101, 0.8113412, 1.084777, 0, 1, 0.9529412, 1,
-0.01280535, -0.09127288, -3.804569, 0, 1, 0.9568627, 1,
-0.01045485, 0.2685103, -0.9530488, 0, 1, 0.9647059, 1,
-0.009413581, -0.859892, -3.20851, 0, 1, 0.9686275, 1,
-0.008340823, -1.355788, -1.640821, 0, 1, 0.9764706, 1,
-0.007743488, 0.791367, 0.2003834, 0, 1, 0.9803922, 1,
-0.004509826, -0.9489675, -3.766222, 0, 1, 0.9882353, 1,
-0.002152686, -2.688909, -2.898007, 0, 1, 0.9921569, 1,
-0.002126474, -0.1927875, -3.082767, 0, 1, 1, 1,
0.0005287047, -0.5158409, 2.286005, 0, 0.9921569, 1, 1,
0.001400565, 0.47882, 0.3896549, 0, 0.9882353, 1, 1,
0.002689637, 0.5342933, 0.7557912, 0, 0.9803922, 1, 1,
0.006031154, -0.4864838, 4.467744, 0, 0.9764706, 1, 1,
0.01352287, -0.0482595, 2.362587, 0, 0.9686275, 1, 1,
0.01383777, 2.035006, -0.4183741, 0, 0.9647059, 1, 1,
0.01417548, 0.4769815, -0.4326888, 0, 0.9568627, 1, 1,
0.01567875, -1.44919, 2.579619, 0, 0.9529412, 1, 1,
0.0209721, 0.3823343, 0.3218732, 0, 0.945098, 1, 1,
0.02346954, -0.9284183, 2.457536, 0, 0.9411765, 1, 1,
0.02450148, -0.8094866, 1.988276, 0, 0.9333333, 1, 1,
0.02797024, -1.212744, 2.58609, 0, 0.9294118, 1, 1,
0.03091565, 0.2247521, 0.7969739, 0, 0.9215686, 1, 1,
0.03222919, -0.425531, 3.216331, 0, 0.9176471, 1, 1,
0.03277696, 0.2755966, 1.915233, 0, 0.9098039, 1, 1,
0.03372478, 0.1141939, 0.8452622, 0, 0.9058824, 1, 1,
0.03409694, -0.6539708, 3.186574, 0, 0.8980392, 1, 1,
0.03871145, -0.06259277, 3.106195, 0, 0.8901961, 1, 1,
0.03999475, 1.159459, -1.070356, 0, 0.8862745, 1, 1,
0.04501627, 1.194063, -0.1365157, 0, 0.8784314, 1, 1,
0.04704079, -0.4074488, 2.648194, 0, 0.8745098, 1, 1,
0.04961988, -1.45691, 5.368743, 0, 0.8666667, 1, 1,
0.05012261, 0.1272487, 1.654979, 0, 0.8627451, 1, 1,
0.05146682, -0.7912644, 3.719674, 0, 0.854902, 1, 1,
0.05197029, 0.02405466, 0.4949459, 0, 0.8509804, 1, 1,
0.05478983, 0.3015344, 0.5943882, 0, 0.8431373, 1, 1,
0.05702874, -0.0952543, 2.284196, 0, 0.8392157, 1, 1,
0.05814021, 0.1588364, 1.00643, 0, 0.8313726, 1, 1,
0.06169273, 0.5420781, -0.5908157, 0, 0.827451, 1, 1,
0.06302886, -0.3140255, 2.373807, 0, 0.8196079, 1, 1,
0.06579262, 1.218949, -0.09929384, 0, 0.8156863, 1, 1,
0.0703738, -1.411855, 3.697502, 0, 0.8078431, 1, 1,
0.07125333, -0.5082601, 3.568778, 0, 0.8039216, 1, 1,
0.07680573, 0.1588392, -0.8195357, 0, 0.7960784, 1, 1,
0.08010571, 0.6214743, 2.397451, 0, 0.7882353, 1, 1,
0.0813026, -1.262452, 4.717273, 0, 0.7843137, 1, 1,
0.08211979, -0.2020689, 3.318823, 0, 0.7764706, 1, 1,
0.08739158, 2.119632, -1.13011, 0, 0.772549, 1, 1,
0.08755254, 0.6003376, 0.681924, 0, 0.7647059, 1, 1,
0.08848199, -0.621976, 4.149467, 0, 0.7607843, 1, 1,
0.08916344, -0.9185416, 1.778055, 0, 0.7529412, 1, 1,
0.08916733, 2.305018, 1.446321, 0, 0.7490196, 1, 1,
0.09206164, -0.4049124, 3.294124, 0, 0.7411765, 1, 1,
0.09363009, 0.6925865, 0.4275122, 0, 0.7372549, 1, 1,
0.09398898, 0.03033789, 1.324421, 0, 0.7294118, 1, 1,
0.0945557, 0.5032221, -0.4093353, 0, 0.7254902, 1, 1,
0.09596053, -0.9002864, 4.230083, 0, 0.7176471, 1, 1,
0.09705844, 0.6248541, -1.550005, 0, 0.7137255, 1, 1,
0.1005703, -0.2892432, 2.218307, 0, 0.7058824, 1, 1,
0.1035538, 0.8560543, -0.3714704, 0, 0.6980392, 1, 1,
0.1072352, -0.808835, 2.435053, 0, 0.6941177, 1, 1,
0.1119297, -0.4812722, 1.129026, 0, 0.6862745, 1, 1,
0.1119953, -0.4121315, 2.237046, 0, 0.682353, 1, 1,
0.1135073, -0.7542427, 3.144549, 0, 0.6745098, 1, 1,
0.1188364, -1.602106, 2.489563, 0, 0.6705883, 1, 1,
0.1202113, 0.2625292, -1.604413, 0, 0.6627451, 1, 1,
0.122093, -1.298756, 2.848763, 0, 0.6588235, 1, 1,
0.1249966, -1.058588, 4.22397, 0, 0.6509804, 1, 1,
0.1264617, -2.642302, 3.755569, 0, 0.6470588, 1, 1,
0.1278257, 0.146859, 0.6421114, 0, 0.6392157, 1, 1,
0.1303629, -0.1195311, 4.231634, 0, 0.6352941, 1, 1,
0.1399953, 0.08046843, 1.162219, 0, 0.627451, 1, 1,
0.1420469, 0.5129383, -0.313043, 0, 0.6235294, 1, 1,
0.1494996, 1.925814, -1.038006, 0, 0.6156863, 1, 1,
0.1500856, 0.02492663, 0.4943363, 0, 0.6117647, 1, 1,
0.1524956, 1.129933, -1.341448, 0, 0.6039216, 1, 1,
0.1528423, 0.124498, 0.9342118, 0, 0.5960785, 1, 1,
0.1576827, -0.8923411, 3.290272, 0, 0.5921569, 1, 1,
0.1596693, 0.5288184, -0.9892725, 0, 0.5843138, 1, 1,
0.1603086, -0.1402203, 1.803556, 0, 0.5803922, 1, 1,
0.1606153, -2.048474, 1.570556, 0, 0.572549, 1, 1,
0.1616881, -1.10981, 3.282201, 0, 0.5686275, 1, 1,
0.1665488, -0.163451, 2.241062, 0, 0.5607843, 1, 1,
0.171731, 0.01236635, 1.460472, 0, 0.5568628, 1, 1,
0.1746267, 0.5402042, 0.7167557, 0, 0.5490196, 1, 1,
0.1774897, -1.233911, 1.895581, 0, 0.5450981, 1, 1,
0.1804139, -0.8191139, 4.101022, 0, 0.5372549, 1, 1,
0.1804535, 0.8128524, -2.095191, 0, 0.5333334, 1, 1,
0.1822043, 1.191439, 1.486508, 0, 0.5254902, 1, 1,
0.1880319, 0.1865803, 0.9048824, 0, 0.5215687, 1, 1,
0.1913178, 0.03544756, -0.01544128, 0, 0.5137255, 1, 1,
0.1969307, 0.4500806, 1.002208, 0, 0.509804, 1, 1,
0.199181, -0.05356515, 1.320988, 0, 0.5019608, 1, 1,
0.1995928, 0.2631302, -1.6077, 0, 0.4941176, 1, 1,
0.2005407, -0.1404102, 0.3043359, 0, 0.4901961, 1, 1,
0.2160115, -0.9221388, 4.624159, 0, 0.4823529, 1, 1,
0.2208677, 0.3138491, 1.910521, 0, 0.4784314, 1, 1,
0.2245534, 0.415582, 0.1227439, 0, 0.4705882, 1, 1,
0.2270931, 0.1573661, 1.452783, 0, 0.4666667, 1, 1,
0.2312921, -0.1702592, 1.318227, 0, 0.4588235, 1, 1,
0.2332657, 0.03860837, 0.1801754, 0, 0.454902, 1, 1,
0.2362098, 2.142682, 0.615684, 0, 0.4470588, 1, 1,
0.2423804, -0.7295378, 3.586277, 0, 0.4431373, 1, 1,
0.2428576, 0.6983618, -0.5142928, 0, 0.4352941, 1, 1,
0.243299, -0.1746212, 0.6257535, 0, 0.4313726, 1, 1,
0.2450064, -0.4771633, 2.868995, 0, 0.4235294, 1, 1,
0.2463232, 1.0703, 0.8296653, 0, 0.4196078, 1, 1,
0.2496265, 0.5599912, -0.8705339, 0, 0.4117647, 1, 1,
0.2522886, -0.08810734, 2.71062, 0, 0.4078431, 1, 1,
0.2586793, 0.189511, 2.126701, 0, 0.4, 1, 1,
0.2617778, -0.3831415, -0.9046269, 0, 0.3921569, 1, 1,
0.2628706, 1.317199, -1.117472, 0, 0.3882353, 1, 1,
0.2669844, 0.8921514, 0.9463204, 0, 0.3803922, 1, 1,
0.2683624, -0.8254929, 2.919872, 0, 0.3764706, 1, 1,
0.2715349, -0.7385836, 4.326502, 0, 0.3686275, 1, 1,
0.2729545, 0.2547903, 1.147907, 0, 0.3647059, 1, 1,
0.2733755, 0.2701916, 0.4418363, 0, 0.3568628, 1, 1,
0.2734086, 0.6163136, 0.3294103, 0, 0.3529412, 1, 1,
0.2742699, 0.2180219, 0.09863334, 0, 0.345098, 1, 1,
0.2748608, 0.683321, -0.4286257, 0, 0.3411765, 1, 1,
0.2748883, 0.1477109, 0.9402703, 0, 0.3333333, 1, 1,
0.2793137, 1.304277, -0.08621344, 0, 0.3294118, 1, 1,
0.2841665, -0.6387068, 3.039131, 0, 0.3215686, 1, 1,
0.2869051, -0.2177349, 0.4757196, 0, 0.3176471, 1, 1,
0.2958325, 0.06468998, 3.113702, 0, 0.3098039, 1, 1,
0.2964437, -0.2897986, 1.83982, 0, 0.3058824, 1, 1,
0.302724, 1.061268, 0.7453378, 0, 0.2980392, 1, 1,
0.3170928, 0.7917077, -0.4179724, 0, 0.2901961, 1, 1,
0.3217511, 0.8374842, 1.235695, 0, 0.2862745, 1, 1,
0.3233514, -1.058883, 3.488815, 0, 0.2784314, 1, 1,
0.3246345, -1.388867, 4.354198, 0, 0.2745098, 1, 1,
0.3295414, -1.461337, 3.014507, 0, 0.2666667, 1, 1,
0.3312407, 0.6634591, 0.3660555, 0, 0.2627451, 1, 1,
0.3337855, -1.295778, 2.212157, 0, 0.254902, 1, 1,
0.3352421, 0.2706182, 0.2147892, 0, 0.2509804, 1, 1,
0.3361312, -0.007032665, -0.2309906, 0, 0.2431373, 1, 1,
0.3366168, 0.2387369, 0.1788395, 0, 0.2392157, 1, 1,
0.3381594, -0.3140572, 2.867128, 0, 0.2313726, 1, 1,
0.3381849, 0.3222356, 0.06902429, 0, 0.227451, 1, 1,
0.338484, -0.7999874, 2.271434, 0, 0.2196078, 1, 1,
0.3388081, 1.217296, 0.3489611, 0, 0.2156863, 1, 1,
0.3391015, -1.224911, 3.524895, 0, 0.2078431, 1, 1,
0.3444084, -1.31485, 2.273793, 0, 0.2039216, 1, 1,
0.3454049, -0.5682632, 2.1777, 0, 0.1960784, 1, 1,
0.3530548, -0.701284, 2.828516, 0, 0.1882353, 1, 1,
0.3571108, 0.04289848, 2.338219, 0, 0.1843137, 1, 1,
0.3589031, -0.1232025, 1.642792, 0, 0.1764706, 1, 1,
0.3612849, 2.16911, 0.09148433, 0, 0.172549, 1, 1,
0.3663388, 0.868877, 2.080988, 0, 0.1647059, 1, 1,
0.3716916, -0.2130675, 2.479821, 0, 0.1607843, 1, 1,
0.3754857, 1.228175, -1.176421, 0, 0.1529412, 1, 1,
0.378452, -0.6552467, 3.032851, 0, 0.1490196, 1, 1,
0.3829351, 0.4933513, -1.360066, 0, 0.1411765, 1, 1,
0.3846813, 0.5639232, -0.08980634, 0, 0.1372549, 1, 1,
0.3903655, -1.210153, 2.936605, 0, 0.1294118, 1, 1,
0.3939996, -0.8376974, 3.302114, 0, 0.1254902, 1, 1,
0.3963814, 0.2708654, -0.08075601, 0, 0.1176471, 1, 1,
0.3980357, 0.6992635, -0.2172895, 0, 0.1137255, 1, 1,
0.3991826, 1.276754, -0.8293289, 0, 0.1058824, 1, 1,
0.4017414, -1.281402, 3.589982, 0, 0.09803922, 1, 1,
0.4044321, 0.1720672, 0.7984694, 0, 0.09411765, 1, 1,
0.4081948, 0.1924958, 2.202648, 0, 0.08627451, 1, 1,
0.4152082, 0.5760642, 1.766214, 0, 0.08235294, 1, 1,
0.4183354, -1.360436, 2.560443, 0, 0.07450981, 1, 1,
0.4200364, 0.3345206, 1.878049, 0, 0.07058824, 1, 1,
0.4203779, -0.0971499, 1.989526, 0, 0.0627451, 1, 1,
0.4206871, -0.2850007, 0.8972698, 0, 0.05882353, 1, 1,
0.4240658, -0.3470786, 2.101647, 0, 0.05098039, 1, 1,
0.4319519, -2.047326, 4.693289, 0, 0.04705882, 1, 1,
0.435295, -0.5520721, 2.848056, 0, 0.03921569, 1, 1,
0.4413315, 0.8684173, 2.23588, 0, 0.03529412, 1, 1,
0.4430977, 0.3162961, 1.686758, 0, 0.02745098, 1, 1,
0.4441087, 0.8184096, -0.8639418, 0, 0.02352941, 1, 1,
0.4459439, -2.261749, 1.22398, 0, 0.01568628, 1, 1,
0.4491055, -0.5454134, 1.504425, 0, 0.01176471, 1, 1,
0.4509034, 1.199645, 1.241295, 0, 0.003921569, 1, 1,
0.4525501, -0.1675656, 2.629082, 0.003921569, 0, 1, 1,
0.4554652, 0.1792878, 1.111251, 0.007843138, 0, 1, 1,
0.4596191, -0.6814266, 1.174806, 0.01568628, 0, 1, 1,
0.4611477, -0.572111, 0.9216077, 0.01960784, 0, 1, 1,
0.4644427, 0.2902105, 0.7602906, 0.02745098, 0, 1, 1,
0.4721434, -1.482489, 2.301981, 0.03137255, 0, 1, 1,
0.4724795, 0.9626009, -0.1324238, 0.03921569, 0, 1, 1,
0.4734659, -0.1437296, -0.6335024, 0.04313726, 0, 1, 1,
0.4739303, -0.2901129, 1.012686, 0.05098039, 0, 1, 1,
0.4760108, 0.8803244, -0.3688241, 0.05490196, 0, 1, 1,
0.4799289, -0.1827847, 1.274969, 0.0627451, 0, 1, 1,
0.4809211, 0.5671758, 1.365918, 0.06666667, 0, 1, 1,
0.4837905, -0.2794737, 2.454492, 0.07450981, 0, 1, 1,
0.4900123, 0.7312101, 0.425717, 0.07843138, 0, 1, 1,
0.4903662, -0.05665452, 1.88801, 0.08627451, 0, 1, 1,
0.495348, 0.3870231, 1.350367, 0.09019608, 0, 1, 1,
0.4975658, 0.7509818, -0.2402511, 0.09803922, 0, 1, 1,
0.4979199, 0.1264928, 1.58332, 0.1058824, 0, 1, 1,
0.4988625, 1.204905, -1.505856, 0.1098039, 0, 1, 1,
0.4995234, -0.03591878, 3.055155, 0.1176471, 0, 1, 1,
0.4996375, 1.076885, 0.3589683, 0.1215686, 0, 1, 1,
0.5002971, -0.4090673, 0.560066, 0.1294118, 0, 1, 1,
0.5004169, 0.1814271, 2.211706, 0.1333333, 0, 1, 1,
0.5037203, -0.5230677, 1.695667, 0.1411765, 0, 1, 1,
0.5045872, 0.08398937, 2.991959, 0.145098, 0, 1, 1,
0.5060537, -0.4549523, 2.530796, 0.1529412, 0, 1, 1,
0.5073525, 0.1743951, 2.832438, 0.1568628, 0, 1, 1,
0.5115332, -0.6537048, 3.524586, 0.1647059, 0, 1, 1,
0.5116696, -0.8204513, 2.22227, 0.1686275, 0, 1, 1,
0.5119341, 2.626037, -0.2152078, 0.1764706, 0, 1, 1,
0.512035, 0.6298363, 2.134322, 0.1803922, 0, 1, 1,
0.5138745, 0.610239, 1.177255, 0.1882353, 0, 1, 1,
0.514135, 1.100529, 0.6277038, 0.1921569, 0, 1, 1,
0.5220437, 0.4990306, 0.2769516, 0.2, 0, 1, 1,
0.5220972, 0.1640082, 2.475341, 0.2078431, 0, 1, 1,
0.527262, -0.9017208, 2.537287, 0.2117647, 0, 1, 1,
0.5284315, -0.5324319, 4.302086, 0.2196078, 0, 1, 1,
0.5306502, 0.07928114, 0.9964603, 0.2235294, 0, 1, 1,
0.5322216, 2.108841, 0.05918204, 0.2313726, 0, 1, 1,
0.5455772, 0.9998946, 2.032635, 0.2352941, 0, 1, 1,
0.5457721, -0.2146654, 2.40207, 0.2431373, 0, 1, 1,
0.5459598, 2.205108, 1.171527, 0.2470588, 0, 1, 1,
0.5471556, -0.3325995, -0.1122837, 0.254902, 0, 1, 1,
0.5514455, -1.099245, 2.13227, 0.2588235, 0, 1, 1,
0.5514529, 0.1855479, 0.9743866, 0.2666667, 0, 1, 1,
0.5526205, 1.675926, -0.2655388, 0.2705882, 0, 1, 1,
0.5556898, -0.4520516, 1.922216, 0.2784314, 0, 1, 1,
0.5565879, 0.2535906, 0.4730669, 0.282353, 0, 1, 1,
0.5577729, -0.2146626, 2.119345, 0.2901961, 0, 1, 1,
0.5595338, 0.05324091, 1.223544, 0.2941177, 0, 1, 1,
0.56054, -1.485334, 3.968445, 0.3019608, 0, 1, 1,
0.5619978, -0.5297983, 2.940763, 0.3098039, 0, 1, 1,
0.5622901, -0.4921189, 3.249025, 0.3137255, 0, 1, 1,
0.5638451, -0.6513068, 2.046489, 0.3215686, 0, 1, 1,
0.5645897, 3.666671, -1.135695, 0.3254902, 0, 1, 1,
0.5651487, 1.116314, 1.685647, 0.3333333, 0, 1, 1,
0.5673225, 0.2579162, 0.3065903, 0.3372549, 0, 1, 1,
0.568664, 0.4608099, 0.888229, 0.345098, 0, 1, 1,
0.5687895, -0.4880885, 3.119804, 0.3490196, 0, 1, 1,
0.5710254, 1.68727, -1.005529, 0.3568628, 0, 1, 1,
0.5747204, -1.033407, 0.2449279, 0.3607843, 0, 1, 1,
0.580583, 0.1782793, -0.01146263, 0.3686275, 0, 1, 1,
0.5810491, -0.4290691, 2.485098, 0.372549, 0, 1, 1,
0.5869525, 0.7397914, 1.940284, 0.3803922, 0, 1, 1,
0.594012, 1.637335, -0.6515104, 0.3843137, 0, 1, 1,
0.5942076, 2.226629, 1.366011, 0.3921569, 0, 1, 1,
0.5990065, -0.8200464, 1.332364, 0.3960784, 0, 1, 1,
0.6004326, 0.7341735, 0.6014003, 0.4039216, 0, 1, 1,
0.603537, -0.339293, 1.317826, 0.4117647, 0, 1, 1,
0.6043757, 1.551034, -0.3265656, 0.4156863, 0, 1, 1,
0.6057335, -0.4587225, 3.071845, 0.4235294, 0, 1, 1,
0.6123328, 0.4864588, 1.837114, 0.427451, 0, 1, 1,
0.6175668, -1.722924, 2.610153, 0.4352941, 0, 1, 1,
0.6212458, -0.593302, 2.384733, 0.4392157, 0, 1, 1,
0.6220212, -0.9246157, 4.207805, 0.4470588, 0, 1, 1,
0.6319829, 0.5499017, -0.6213393, 0.4509804, 0, 1, 1,
0.6383966, 0.3740436, 0.970814, 0.4588235, 0, 1, 1,
0.6401579, -0.7244099, 2.607878, 0.4627451, 0, 1, 1,
0.6443999, 0.9798339, 1.071515, 0.4705882, 0, 1, 1,
0.6495696, 0.04212991, 1.817119, 0.4745098, 0, 1, 1,
0.6591256, 0.2039724, 1.152878, 0.4823529, 0, 1, 1,
0.6593475, -0.2505592, 0.1053121, 0.4862745, 0, 1, 1,
0.6632106, -1.045476, 3.417528, 0.4941176, 0, 1, 1,
0.663629, 0.9180182, 0.2843788, 0.5019608, 0, 1, 1,
0.6653313, -0.9408385, 1.491573, 0.5058824, 0, 1, 1,
0.6654031, 0.4362926, 0.6512982, 0.5137255, 0, 1, 1,
0.6661525, -1.572504, 2.088241, 0.5176471, 0, 1, 1,
0.6678627, -0.1686871, 0.9537969, 0.5254902, 0, 1, 1,
0.6710358, -0.824038, 1.898614, 0.5294118, 0, 1, 1,
0.6715947, 1.288186, 0.7004423, 0.5372549, 0, 1, 1,
0.6727987, 0.2608961, 1.563054, 0.5411765, 0, 1, 1,
0.6736348, -0.2647206, 4.016395, 0.5490196, 0, 1, 1,
0.6765721, 0.1088814, 1.296303, 0.5529412, 0, 1, 1,
0.6787575, -1.856653, 3.681837, 0.5607843, 0, 1, 1,
0.6831984, 0.5630527, 2.430336, 0.5647059, 0, 1, 1,
0.6858485, -0.04679117, 1.908367, 0.572549, 0, 1, 1,
0.6877202, 0.4939446, 1.21406, 0.5764706, 0, 1, 1,
0.6883117, -0.08941238, 2.770231, 0.5843138, 0, 1, 1,
0.6936476, -0.04432973, 2.205857, 0.5882353, 0, 1, 1,
0.6946415, -0.0688349, 0.8208822, 0.5960785, 0, 1, 1,
0.6947075, 0.2209002, 1.626538, 0.6039216, 0, 1, 1,
0.6972244, 0.7665434, -1.732273, 0.6078432, 0, 1, 1,
0.6977361, 0.8295157, -0.3330632, 0.6156863, 0, 1, 1,
0.7059554, -1.328553, -0.4951435, 0.6196079, 0, 1, 1,
0.7065588, 0.7122222, 1.110996, 0.627451, 0, 1, 1,
0.7080088, 1.841854, 1.288148, 0.6313726, 0, 1, 1,
0.7102419, -0.1060167, 0.2060495, 0.6392157, 0, 1, 1,
0.7112508, -0.8882521, 2.307968, 0.6431373, 0, 1, 1,
0.7124249, -0.3686424, 0.4520666, 0.6509804, 0, 1, 1,
0.7181822, -0.8049707, 0.7267959, 0.654902, 0, 1, 1,
0.7264895, -1.198846, 1.779758, 0.6627451, 0, 1, 1,
0.7266417, 0.247422, -0.08743982, 0.6666667, 0, 1, 1,
0.726682, 0.1432657, 0.7009325, 0.6745098, 0, 1, 1,
0.7276725, -1.615234, 3.62721, 0.6784314, 0, 1, 1,
0.7325701, 0.5306427, -0.8523985, 0.6862745, 0, 1, 1,
0.7335464, -0.5406618, 2.537329, 0.6901961, 0, 1, 1,
0.733967, -0.006714169, 1.662619, 0.6980392, 0, 1, 1,
0.7359831, -0.5645379, 2.594058, 0.7058824, 0, 1, 1,
0.7363149, -0.1960518, 2.295595, 0.7098039, 0, 1, 1,
0.7378465, 0.1662428, 0.8105196, 0.7176471, 0, 1, 1,
0.7402886, -1.198206, 3.427073, 0.7215686, 0, 1, 1,
0.7413723, -2.060558, 1.427117, 0.7294118, 0, 1, 1,
0.7430401, -0.3695276, 1.23464, 0.7333333, 0, 1, 1,
0.7505953, -0.3333406, 4.320785, 0.7411765, 0, 1, 1,
0.7518831, -0.5656453, 4.344154, 0.7450981, 0, 1, 1,
0.7556649, -1.502354, 2.30895, 0.7529412, 0, 1, 1,
0.7568502, 0.1390593, 1.439531, 0.7568628, 0, 1, 1,
0.7592721, -1.91901, 2.777294, 0.7647059, 0, 1, 1,
0.7605047, 1.51142, 1.08999, 0.7686275, 0, 1, 1,
0.760943, -0.7679991, 2.686017, 0.7764706, 0, 1, 1,
0.7649625, -0.2858157, 3.122701, 0.7803922, 0, 1, 1,
0.7663453, -1.344418, 2.691958, 0.7882353, 0, 1, 1,
0.7727071, 0.1687301, 0.7172912, 0.7921569, 0, 1, 1,
0.7758772, 0.5128087, 1.067387, 0.8, 0, 1, 1,
0.7773479, -0.02655204, 0.3350471, 0.8078431, 0, 1, 1,
0.7810066, -0.6292475, 1.989803, 0.8117647, 0, 1, 1,
0.7816175, -0.03285041, 1.190907, 0.8196079, 0, 1, 1,
0.7896698, 1.655248, 2.15357, 0.8235294, 0, 1, 1,
0.7904965, -0.5922842, 3.102878, 0.8313726, 0, 1, 1,
0.793085, 0.09633282, 0.7361822, 0.8352941, 0, 1, 1,
0.7987579, -0.6710404, 0.9225499, 0.8431373, 0, 1, 1,
0.8034286, -0.5447611, 2.637764, 0.8470588, 0, 1, 1,
0.8186747, 0.1301883, 0.4171088, 0.854902, 0, 1, 1,
0.8318589, -0.033726, 1.756762, 0.8588235, 0, 1, 1,
0.8456529, 0.8294528, 0.282143, 0.8666667, 0, 1, 1,
0.8485124, -0.6614503, 2.267333, 0.8705882, 0, 1, 1,
0.8519365, -0.7292007, 2.432702, 0.8784314, 0, 1, 1,
0.8542202, 3.148853, -0.1854642, 0.8823529, 0, 1, 1,
0.8553004, 0.6877019, -0.3786629, 0.8901961, 0, 1, 1,
0.8563975, 0.2630399, -0.6152117, 0.8941177, 0, 1, 1,
0.8593341, 0.5150595, 1.501841, 0.9019608, 0, 1, 1,
0.8617368, -0.3973346, 0.9812056, 0.9098039, 0, 1, 1,
0.8642304, 0.1524103, 1.89383, 0.9137255, 0, 1, 1,
0.8670107, -0.04000368, 3.06963, 0.9215686, 0, 1, 1,
0.8766853, 1.02034, 0.5171219, 0.9254902, 0, 1, 1,
0.8945388, 1.261174, 1.839933, 0.9333333, 0, 1, 1,
0.8991456, -0.854458, 1.853589, 0.9372549, 0, 1, 1,
0.9058594, 0.6175834, -1.899446, 0.945098, 0, 1, 1,
0.9084309, 0.7171051, 0.4880672, 0.9490196, 0, 1, 1,
0.9122576, 1.212866, 2.428736, 0.9568627, 0, 1, 1,
0.9124654, -0.1263059, 0.318228, 0.9607843, 0, 1, 1,
0.9139904, -0.5624328, 2.202798, 0.9686275, 0, 1, 1,
0.9188284, -1.060646, 2.426075, 0.972549, 0, 1, 1,
0.9312152, -0.7228451, 1.055917, 0.9803922, 0, 1, 1,
0.9339124, 0.8329945, 2.875535, 0.9843137, 0, 1, 1,
0.9347986, 0.5397405, -2.183839, 0.9921569, 0, 1, 1,
0.9355659, 2.252584, 1.637163, 0.9960784, 0, 1, 1,
0.944262, 0.2838524, 0.9524533, 1, 0, 0.9960784, 1,
0.9451966, -0.1637008, 1.7372, 1, 0, 0.9882353, 1,
0.9509587, -0.6353998, 2.103989, 1, 0, 0.9843137, 1,
0.9543057, -0.9663611, 2.198519, 1, 0, 0.9764706, 1,
0.9555278, -0.7851664, 3.059597, 1, 0, 0.972549, 1,
0.9564492, 0.1123897, 1.612122, 1, 0, 0.9647059, 1,
0.9578853, 1.366896, -0.1515013, 1, 0, 0.9607843, 1,
0.9607145, 1.156678, 1.627093, 1, 0, 0.9529412, 1,
0.9647318, -0.004743991, 2.221026, 1, 0, 0.9490196, 1,
0.9681812, 0.3064026, 1.090881, 1, 0, 0.9411765, 1,
0.9751055, -1.041623, 2.8787, 1, 0, 0.9372549, 1,
0.9776349, -0.9734397, 0.6249793, 1, 0, 0.9294118, 1,
0.983196, -1.609171, 3.069214, 1, 0, 0.9254902, 1,
0.9843817, 1.167673, 0.1010191, 1, 0, 0.9176471, 1,
0.9847383, -1.968428, 2.28413, 1, 0, 0.9137255, 1,
0.9969124, 0.3057434, 2.392754, 1, 0, 0.9058824, 1,
1.0027, 0.2546466, 1.249797, 1, 0, 0.9019608, 1,
1.004279, 1.529661, 2.345381, 1, 0, 0.8941177, 1,
1.008041, -0.8480476, 2.667027, 1, 0, 0.8862745, 1,
1.014233, -0.982535, 1.392227, 1, 0, 0.8823529, 1,
1.014482, -0.2267317, 1.386461, 1, 0, 0.8745098, 1,
1.016145, -1.263519, 2.943657, 1, 0, 0.8705882, 1,
1.026439, 0.5674518, -2.037604, 1, 0, 0.8627451, 1,
1.029376, -0.6545981, 1.193546, 1, 0, 0.8588235, 1,
1.03658, -1.234533, 4.692139, 1, 0, 0.8509804, 1,
1.037291, 1.241204, -0.8944979, 1, 0, 0.8470588, 1,
1.050138, -1.332975, 3.271177, 1, 0, 0.8392157, 1,
1.051606, 0.4617686, 2.417335, 1, 0, 0.8352941, 1,
1.057187, -0.03683579, 2.561495, 1, 0, 0.827451, 1,
1.057608, 0.06596757, 0.5128547, 1, 0, 0.8235294, 1,
1.058548, 0.1464379, 2.47415, 1, 0, 0.8156863, 1,
1.061435, 0.6760955, 0.2227385, 1, 0, 0.8117647, 1,
1.071344, -0.3963238, 1.735917, 1, 0, 0.8039216, 1,
1.073977, 0.6154518, 0.08442833, 1, 0, 0.7960784, 1,
1.084727, -1.415448, 1.020041, 1, 0, 0.7921569, 1,
1.087165, 0.5456901, 1.454943, 1, 0, 0.7843137, 1,
1.089281, 0.1505852, 2.675486, 1, 0, 0.7803922, 1,
1.091376, 0.3717168, 1.88424, 1, 0, 0.772549, 1,
1.102413, -0.323532, 1.88543, 1, 0, 0.7686275, 1,
1.103948, -0.2930323, 2.238875, 1, 0, 0.7607843, 1,
1.125431, 1.349336, -1.015984, 1, 0, 0.7568628, 1,
1.133436, -0.214091, 2.483112, 1, 0, 0.7490196, 1,
1.136417, 1.333272, 3.991498, 1, 0, 0.7450981, 1,
1.13947, -1.701798, 2.602817, 1, 0, 0.7372549, 1,
1.139828, 1.414359, 0.5526326, 1, 0, 0.7333333, 1,
1.149923, -0.9931742, 2.097091, 1, 0, 0.7254902, 1,
1.149965, -1.15964, 3.087359, 1, 0, 0.7215686, 1,
1.152097, -1.089258, 2.159215, 1, 0, 0.7137255, 1,
1.153166, 0.1284668, 1.504913, 1, 0, 0.7098039, 1,
1.166077, -0.7840395, 3.317177, 1, 0, 0.7019608, 1,
1.170964, 0.6306839, -0.498163, 1, 0, 0.6941177, 1,
1.172519, 0.5900251, 0.8788037, 1, 0, 0.6901961, 1,
1.174716, -1.239366, 2.179821, 1, 0, 0.682353, 1,
1.17606, 0.7444615, 1.181758, 1, 0, 0.6784314, 1,
1.178116, 0.1387306, -0.09352418, 1, 0, 0.6705883, 1,
1.181426, 0.9286225, 0.1872252, 1, 0, 0.6666667, 1,
1.188962, 0.8469928, 1.064331, 1, 0, 0.6588235, 1,
1.19261, -0.1496561, 1.519372, 1, 0, 0.654902, 1,
1.196265, 0.9084738, 1.034023, 1, 0, 0.6470588, 1,
1.206548, 0.7403474, 1.746839, 1, 0, 0.6431373, 1,
1.21451, -1.449519, 1.47759, 1, 0, 0.6352941, 1,
1.217774, 1.353508, 0.9396684, 1, 0, 0.6313726, 1,
1.224388, 0.5224622, 1.363964, 1, 0, 0.6235294, 1,
1.23212, 0.8159387, 1.850012, 1, 0, 0.6196079, 1,
1.233482, 2.315509, 0.118059, 1, 0, 0.6117647, 1,
1.244408, -0.5090985, 3.757378, 1, 0, 0.6078432, 1,
1.255652, -0.722572, 2.242399, 1, 0, 0.6, 1,
1.259359, -1.574673, 1.026553, 1, 0, 0.5921569, 1,
1.269107, -0.4144367, 1.744701, 1, 0, 0.5882353, 1,
1.275705, 2.471461, -0.02845144, 1, 0, 0.5803922, 1,
1.276946, 0.4560597, 2.287839, 1, 0, 0.5764706, 1,
1.27838, 1.321925, -0.1071108, 1, 0, 0.5686275, 1,
1.280372, -1.226011, 3.113246, 1, 0, 0.5647059, 1,
1.284278, 0.5416149, 1.766395, 1, 0, 0.5568628, 1,
1.300089, -0.3602808, 2.384627, 1, 0, 0.5529412, 1,
1.3016, -0.1410488, 2.389429, 1, 0, 0.5450981, 1,
1.313082, 0.5452142, 2.222941, 1, 0, 0.5411765, 1,
1.314288, -2.676967, 4.194792, 1, 0, 0.5333334, 1,
1.316425, -1.453483, 1.835376, 1, 0, 0.5294118, 1,
1.321341, 1.001628, 1.484007, 1, 0, 0.5215687, 1,
1.327358, -1.329755, 3.006021, 1, 0, 0.5176471, 1,
1.32787, -1.064097, 1.987154, 1, 0, 0.509804, 1,
1.337206, -1.150154, 2.307226, 1, 0, 0.5058824, 1,
1.358536, 0.6156383, 0.3651285, 1, 0, 0.4980392, 1,
1.36012, -1.405266, 1.597699, 1, 0, 0.4901961, 1,
1.365571, -1.302265, 1.997977, 1, 0, 0.4862745, 1,
1.370794, 0.3422937, 0.5536097, 1, 0, 0.4784314, 1,
1.373346, 2.09953, 1.466605, 1, 0, 0.4745098, 1,
1.374569, 0.06738017, 2.146355, 1, 0, 0.4666667, 1,
1.380644, 0.3659216, 1.260788, 1, 0, 0.4627451, 1,
1.397074, 1.582034, 0.9354079, 1, 0, 0.454902, 1,
1.400969, -1.05005, 2.300928, 1, 0, 0.4509804, 1,
1.418446, -0.7426662, 2.943929, 1, 0, 0.4431373, 1,
1.426078, -0.689352, 3.374262, 1, 0, 0.4392157, 1,
1.443417, -0.1481601, 1.072055, 1, 0, 0.4313726, 1,
1.447344, -0.745772, 1.659647, 1, 0, 0.427451, 1,
1.469235, -0.04785673, 2.666807, 1, 0, 0.4196078, 1,
1.469628, -1.357561, 2.92204, 1, 0, 0.4156863, 1,
1.487253, -0.9587221, 2.894837, 1, 0, 0.4078431, 1,
1.502453, 0.3440178, 0.4877623, 1, 0, 0.4039216, 1,
1.510325, -0.1647006, 1.134187, 1, 0, 0.3960784, 1,
1.514943, -1.985196, 1.874053, 1, 0, 0.3882353, 1,
1.51526, -0.6546264, 1.887261, 1, 0, 0.3843137, 1,
1.516892, -0.06030133, 0.8602251, 1, 0, 0.3764706, 1,
1.520943, -0.5348639, 3.646971, 1, 0, 0.372549, 1,
1.532801, 0.3220105, 0.08858134, 1, 0, 0.3647059, 1,
1.540111, -1.02177, 2.31941, 1, 0, 0.3607843, 1,
1.549379, -0.9485182, 1.596683, 1, 0, 0.3529412, 1,
1.554699, -1.347189, 2.294942, 1, 0, 0.3490196, 1,
1.554802, 0.6671677, 1.067118, 1, 0, 0.3411765, 1,
1.5622, -2.815749, 3.176596, 1, 0, 0.3372549, 1,
1.572034, -0.5249021, 4.049513, 1, 0, 0.3294118, 1,
1.594188, -0.970597, 2.659631, 1, 0, 0.3254902, 1,
1.614653, 1.433982, 1.410338, 1, 0, 0.3176471, 1,
1.635081, 1.744274, 1.064577, 1, 0, 0.3137255, 1,
1.636138, -0.2296085, 0.1184439, 1, 0, 0.3058824, 1,
1.63667, -2.429511, 1.728262, 1, 0, 0.2980392, 1,
1.652737, 1.0247, -0.8709545, 1, 0, 0.2941177, 1,
1.653574, 0.5067162, -1.135264, 1, 0, 0.2862745, 1,
1.674021, -1.08915, 2.776396, 1, 0, 0.282353, 1,
1.685277, 0.4859946, -0.8072723, 1, 0, 0.2745098, 1,
1.686696, -0.4642943, 1.583276, 1, 0, 0.2705882, 1,
1.694681, -0.2431247, 2.978358, 1, 0, 0.2627451, 1,
1.705824, 0.6639062, -0.1364741, 1, 0, 0.2588235, 1,
1.707541, -0.6687666, -1.914197, 1, 0, 0.2509804, 1,
1.711264, -0.404868, 3.231421, 1, 0, 0.2470588, 1,
1.714459, 0.6483149, 2.406615, 1, 0, 0.2392157, 1,
1.715433, 2.335392, 1.726509, 1, 0, 0.2352941, 1,
1.731549, -0.41307, 1.370013, 1, 0, 0.227451, 1,
1.733494, 1.437401, -1.39252, 1, 0, 0.2235294, 1,
1.73493, 1.181576, -0.2951838, 1, 0, 0.2156863, 1,
1.738361, -1.686426, 2.347205, 1, 0, 0.2117647, 1,
1.74887, 1.188908, 0.6465139, 1, 0, 0.2039216, 1,
1.843101, 1.097799, 0.2668878, 1, 0, 0.1960784, 1,
1.859487, -1.409866, 2.505821, 1, 0, 0.1921569, 1,
1.863429, -1.487062, 0.646077, 1, 0, 0.1843137, 1,
1.870825, -1.805223, 0.5251656, 1, 0, 0.1803922, 1,
1.885677, -0.3611525, 1.835986, 1, 0, 0.172549, 1,
1.932014, 0.5102251, 1.684266, 1, 0, 0.1686275, 1,
1.936435, 1.130215, 1.534108, 1, 0, 0.1607843, 1,
1.952743, -0.8006662, 1.12436, 1, 0, 0.1568628, 1,
1.966715, 0.5003905, 1.963789, 1, 0, 0.1490196, 1,
1.974647, -0.7084188, 0.2088057, 1, 0, 0.145098, 1,
1.987288, -0.5845459, 2.004254, 1, 0, 0.1372549, 1,
1.992043, 0.415162, 1.183853, 1, 0, 0.1333333, 1,
2.003597, 0.6456701, 1.804863, 1, 0, 0.1254902, 1,
2.004565, 0.1147162, 0.8525221, 1, 0, 0.1215686, 1,
2.022808, -1.38227, 2.119499, 1, 0, 0.1137255, 1,
2.048473, 0.3663808, 0.4235088, 1, 0, 0.1098039, 1,
2.051021, -0.1886833, 1.875372, 1, 0, 0.1019608, 1,
2.074963, 1.068539, 3.669737, 1, 0, 0.09411765, 1,
2.085665, 1.426018, -0.2446824, 1, 0, 0.09019608, 1,
2.135813, 0.5980867, 1.433306, 1, 0, 0.08235294, 1,
2.210928, 0.68287, 1.057658, 1, 0, 0.07843138, 1,
2.271561, -0.9741309, 2.673506, 1, 0, 0.07058824, 1,
2.334261, 0.2215615, 0.1847793, 1, 0, 0.06666667, 1,
2.358746, 0.2028692, 0.3090744, 1, 0, 0.05882353, 1,
2.428558, -0.6617861, 2.839335, 1, 0, 0.05490196, 1,
2.478691, -1.01814, 3.498358, 1, 0, 0.04705882, 1,
2.483069, -0.267346, 0.4967993, 1, 0, 0.04313726, 1,
2.490145, 2.400922, 0.3955355, 1, 0, 0.03529412, 1,
2.554986, 0.1076282, 3.33134, 1, 0, 0.03137255, 1,
2.565763, 1.500738, 1.096767, 1, 0, 0.02352941, 1,
2.700889, 1.86863, 0.1302732, 1, 0, 0.01960784, 1,
2.708121, -0.08762973, 1.239173, 1, 0, 0.01176471, 1,
3.162097, 0.5572093, 1.103405, 1, 0, 0.007843138, 1
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
0.03779352, -3.91452, -6.903576, 0, -0.5, 0.5, 0.5,
0.03779352, -3.91452, -6.903576, 1, -0.5, 0.5, 0.5,
0.03779352, -3.91452, -6.903576, 1, 1.5, 0.5, 0.5,
0.03779352, -3.91452, -6.903576, 0, 1.5, 0.5, 0.5
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
-4.145649, 0.4254607, -6.903576, 0, -0.5, 0.5, 0.5,
-4.145649, 0.4254607, -6.903576, 1, -0.5, 0.5, 0.5,
-4.145649, 0.4254607, -6.903576, 1, 1.5, 0.5, 0.5,
-4.145649, 0.4254607, -6.903576, 0, 1.5, 0.5, 0.5
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
-4.145649, -3.91452, 0.1219201, 0, -0.5, 0.5, 0.5,
-4.145649, -3.91452, 0.1219201, 1, -0.5, 0.5, 0.5,
-4.145649, -3.91452, 0.1219201, 1, 1.5, 0.5, 0.5,
-4.145649, -3.91452, 0.1219201, 0, 1.5, 0.5, 0.5
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
-3, -2.912986, -5.282308,
3, -2.912986, -5.282308,
-3, -2.912986, -5.282308,
-3, -3.079908, -5.552519,
-2, -2.912986, -5.282308,
-2, -3.079908, -5.552519,
-1, -2.912986, -5.282308,
-1, -3.079908, -5.552519,
0, -2.912986, -5.282308,
0, -3.079908, -5.552519,
1, -2.912986, -5.282308,
1, -3.079908, -5.552519,
2, -2.912986, -5.282308,
2, -3.079908, -5.552519,
3, -2.912986, -5.282308,
3, -3.079908, -5.552519
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
-3, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
-3, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
-3, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
-3, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
-2, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
-2, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
-2, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
-2, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
-1, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
-1, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
-1, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
-1, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
0, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
0, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
0, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
0, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
1, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
1, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
1, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
1, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
2, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
2, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
2, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
2, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5,
3, -3.413753, -6.092942, 0, -0.5, 0.5, 0.5,
3, -3.413753, -6.092942, 1, -0.5, 0.5, 0.5,
3, -3.413753, -6.092942, 1, 1.5, 0.5, 0.5,
3, -3.413753, -6.092942, 0, 1.5, 0.5, 0.5
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
-3.180239, -2, -5.282308,
-3.180239, 3, -5.282308,
-3.180239, -2, -5.282308,
-3.341141, -2, -5.552519,
-3.180239, -1, -5.282308,
-3.341141, -1, -5.552519,
-3.180239, 0, -5.282308,
-3.341141, 0, -5.552519,
-3.180239, 1, -5.282308,
-3.341141, 1, -5.552519,
-3.180239, 2, -5.282308,
-3.341141, 2, -5.552519,
-3.180239, 3, -5.282308,
-3.341141, 3, -5.552519
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
-3.662944, -2, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, -2, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, -2, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, -2, -6.092942, 0, 1.5, 0.5, 0.5,
-3.662944, -1, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, -1, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, -1, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, -1, -6.092942, 0, 1.5, 0.5, 0.5,
-3.662944, 0, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, 0, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, 0, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, 0, -6.092942, 0, 1.5, 0.5, 0.5,
-3.662944, 1, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, 1, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, 1, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, 1, -6.092942, 0, 1.5, 0.5, 0.5,
-3.662944, 2, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, 2, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, 2, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, 2, -6.092942, 0, 1.5, 0.5, 0.5,
-3.662944, 3, -6.092942, 0, -0.5, 0.5, 0.5,
-3.662944, 3, -6.092942, 1, -0.5, 0.5, 0.5,
-3.662944, 3, -6.092942, 1, 1.5, 0.5, 0.5,
-3.662944, 3, -6.092942, 0, 1.5, 0.5, 0.5
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
-3.180239, -2.912986, -4,
-3.180239, -2.912986, 4,
-3.180239, -2.912986, -4,
-3.341141, -3.079908, -4,
-3.180239, -2.912986, -2,
-3.341141, -3.079908, -2,
-3.180239, -2.912986, 0,
-3.341141, -3.079908, 0,
-3.180239, -2.912986, 2,
-3.341141, -3.079908, 2,
-3.180239, -2.912986, 4,
-3.341141, -3.079908, 4
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
-3.662944, -3.413753, -4, 0, -0.5, 0.5, 0.5,
-3.662944, -3.413753, -4, 1, -0.5, 0.5, 0.5,
-3.662944, -3.413753, -4, 1, 1.5, 0.5, 0.5,
-3.662944, -3.413753, -4, 0, 1.5, 0.5, 0.5,
-3.662944, -3.413753, -2, 0, -0.5, 0.5, 0.5,
-3.662944, -3.413753, -2, 1, -0.5, 0.5, 0.5,
-3.662944, -3.413753, -2, 1, 1.5, 0.5, 0.5,
-3.662944, -3.413753, -2, 0, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 0, 0, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 0, 1, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 0, 1, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 0, 0, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 2, 0, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 2, 1, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 2, 1, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 2, 0, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 4, 0, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 4, 1, -0.5, 0.5, 0.5,
-3.662944, -3.413753, 4, 1, 1.5, 0.5, 0.5,
-3.662944, -3.413753, 4, 0, 1.5, 0.5, 0.5
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
-3.180239, -2.912986, -5.282308,
-3.180239, 3.763907, -5.282308,
-3.180239, -2.912986, 5.526148,
-3.180239, 3.763907, 5.526148,
-3.180239, -2.912986, -5.282308,
-3.180239, -2.912986, 5.526148,
-3.180239, 3.763907, -5.282308,
-3.180239, 3.763907, 5.526148,
-3.180239, -2.912986, -5.282308,
3.255826, -2.912986, -5.282308,
-3.180239, -2.912986, 5.526148,
3.255826, -2.912986, 5.526148,
-3.180239, 3.763907, -5.282308,
3.255826, 3.763907, -5.282308,
-3.180239, 3.763907, 5.526148,
3.255826, 3.763907, 5.526148,
3.255826, -2.912986, -5.282308,
3.255826, 3.763907, -5.282308,
3.255826, -2.912986, 5.526148,
3.255826, 3.763907, 5.526148,
3.255826, -2.912986, -5.282308,
3.255826, -2.912986, 5.526148,
3.255826, 3.763907, -5.282308,
3.255826, 3.763907, 5.526148
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
var radius = 7.604801;
var distance = 33.83462;
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
mvMatrix.translate( -0.03779352, -0.4254607, -0.1219201 );
mvMatrix.scale( 1.27756, 1.23148, 0.7607433 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83462);
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


