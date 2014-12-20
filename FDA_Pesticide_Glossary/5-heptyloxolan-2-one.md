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
-2.820689, 1.712259, -1.138691, 1, 0, 0, 1,
-2.708374, -0.7825132, -1.680597, 1, 0.007843138, 0, 1,
-2.659289, -1.250049, -2.183616, 1, 0.01176471, 0, 1,
-2.569115, 0.08243403, -1.43924, 1, 0.01960784, 0, 1,
-2.514398, 0.5379061, -2.263178, 1, 0.02352941, 0, 1,
-2.347661, -0.8392246, -2.266619, 1, 0.03137255, 0, 1,
-2.312077, -2.288378, -1.32327, 1, 0.03529412, 0, 1,
-2.284117, 1.159054, -1.826514, 1, 0.04313726, 0, 1,
-2.235288, -0.1494938, -0.2341321, 1, 0.04705882, 0, 1,
-2.213165, -0.1675595, -3.091729, 1, 0.05490196, 0, 1,
-2.205697, 0.7052515, -1.05025, 1, 0.05882353, 0, 1,
-2.160708, -0.305934, -0.9119883, 1, 0.06666667, 0, 1,
-2.15523, -0.0074498, -0.9962339, 1, 0.07058824, 0, 1,
-2.139951, -2.447402, -2.527224, 1, 0.07843138, 0, 1,
-2.118855, 1.456804, -1.617677, 1, 0.08235294, 0, 1,
-2.068386, -0.1314763, -1.881034, 1, 0.09019608, 0, 1,
-2.066326, 1.3943, 0.2073458, 1, 0.09411765, 0, 1,
-2.056989, 0.953444, -0.4322531, 1, 0.1019608, 0, 1,
-2.046269, -0.4362439, 0.7436633, 1, 0.1098039, 0, 1,
-2.038727, -0.294009, -2.548266, 1, 0.1137255, 0, 1,
-2.019768, 0.5299199, -1.254182, 1, 0.1215686, 0, 1,
-1.994012, 0.8268431, -0.003630353, 1, 0.1254902, 0, 1,
-1.975121, 0.145177, -0.9506307, 1, 0.1333333, 0, 1,
-1.973617, 1.661593, -1.108438, 1, 0.1372549, 0, 1,
-1.940279, 0.1118339, 0.1991053, 1, 0.145098, 0, 1,
-1.929853, -0.1024168, -0.9159063, 1, 0.1490196, 0, 1,
-1.927117, 0.1829486, -0.7676241, 1, 0.1568628, 0, 1,
-1.925974, 0.807934, -2.380896, 1, 0.1607843, 0, 1,
-1.910109, 0.6976959, -0.2144067, 1, 0.1686275, 0, 1,
-1.908186, 1.405101, -0.8516768, 1, 0.172549, 0, 1,
-1.879726, 1.403561, -1.337241, 1, 0.1803922, 0, 1,
-1.847836, 0.1614559, -1.100209, 1, 0.1843137, 0, 1,
-1.836315, 0.4026438, -3.853139, 1, 0.1921569, 0, 1,
-1.823566, -0.1651864, -1.804986, 1, 0.1960784, 0, 1,
-1.796358, -0.1533579, -2.341616, 1, 0.2039216, 0, 1,
-1.769308, -1.429837, -3.748603, 1, 0.2117647, 0, 1,
-1.765223, -0.7171922, -3.242611, 1, 0.2156863, 0, 1,
-1.749398, -0.4371853, -0.7826391, 1, 0.2235294, 0, 1,
-1.736663, 0.6716098, -2.266649, 1, 0.227451, 0, 1,
-1.723326, 0.680956, -2.687901, 1, 0.2352941, 0, 1,
-1.717367, -0.3605691, -0.6560678, 1, 0.2392157, 0, 1,
-1.705004, 1.276884, -0.2273785, 1, 0.2470588, 0, 1,
-1.698659, -0.8485307, -1.62088, 1, 0.2509804, 0, 1,
-1.696182, 0.5931796, -3.629647, 1, 0.2588235, 0, 1,
-1.693722, 0.1666601, -1.787503, 1, 0.2627451, 0, 1,
-1.676756, -1.383962, -2.085999, 1, 0.2705882, 0, 1,
-1.674227, -0.9823239, -2.280503, 1, 0.2745098, 0, 1,
-1.664632, 0.6781376, -1.566685, 1, 0.282353, 0, 1,
-1.661847, -0.7973949, -1.270655, 1, 0.2862745, 0, 1,
-1.660239, -0.9779204, -1.631606, 1, 0.2941177, 0, 1,
-1.641345, 1.117116, 0.0361521, 1, 0.3019608, 0, 1,
-1.629719, 0.5805938, -0.2793967, 1, 0.3058824, 0, 1,
-1.629406, -0.3342544, -1.869446, 1, 0.3137255, 0, 1,
-1.627285, -0.06707796, -2.461961, 1, 0.3176471, 0, 1,
-1.620099, 0.2473218, -3.042384, 1, 0.3254902, 0, 1,
-1.614855, -0.3845618, -1.71081, 1, 0.3294118, 0, 1,
-1.598587, -0.8957689, -4.079273, 1, 0.3372549, 0, 1,
-1.592753, -0.2222673, -1.839258, 1, 0.3411765, 0, 1,
-1.592711, 0.6313582, 0.6218817, 1, 0.3490196, 0, 1,
-1.582616, 0.9948894, -1.529314, 1, 0.3529412, 0, 1,
-1.576951, 0.7455001, -0.09856185, 1, 0.3607843, 0, 1,
-1.558625, -0.2262259, -0.8964971, 1, 0.3647059, 0, 1,
-1.517496, 0.7572994, -3.021201, 1, 0.372549, 0, 1,
-1.513992, 0.3279041, -1.545847, 1, 0.3764706, 0, 1,
-1.512764, -2.149936, -3.097613, 1, 0.3843137, 0, 1,
-1.511451, 1.601544, -1.431164, 1, 0.3882353, 0, 1,
-1.494752, 0.03046792, -0.9693815, 1, 0.3960784, 0, 1,
-1.486481, 0.004025678, -2.610307, 1, 0.4039216, 0, 1,
-1.472031, 0.5117757, 0.4354261, 1, 0.4078431, 0, 1,
-1.464911, 0.05547027, -0.4223763, 1, 0.4156863, 0, 1,
-1.464688, 2.551272, 0.04870701, 1, 0.4196078, 0, 1,
-1.45919, 0.9515297, -2.763356, 1, 0.427451, 0, 1,
-1.45799, 2.160959, -1.087166, 1, 0.4313726, 0, 1,
-1.450063, 1.736366, -0.1690025, 1, 0.4392157, 0, 1,
-1.398185, -0.8764665, -1.226045, 1, 0.4431373, 0, 1,
-1.392359, 0.9845631, 0.6709765, 1, 0.4509804, 0, 1,
-1.391616, 0.9571622, -2.065987, 1, 0.454902, 0, 1,
-1.389886, 0.3458813, -1.053159, 1, 0.4627451, 0, 1,
-1.387448, 0.05706705, -1.252436, 1, 0.4666667, 0, 1,
-1.37645, 1.047823, 0.1571746, 1, 0.4745098, 0, 1,
-1.373703, -1.01398, -2.540424, 1, 0.4784314, 0, 1,
-1.370619, 1.437083, -0.6253014, 1, 0.4862745, 0, 1,
-1.362148, -1.484332, -2.2333, 1, 0.4901961, 0, 1,
-1.360357, 1.335005, -1.324576, 1, 0.4980392, 0, 1,
-1.359636, 0.1513148, -2.726726, 1, 0.5058824, 0, 1,
-1.356737, 1.803435, -0.2298604, 1, 0.509804, 0, 1,
-1.356117, -0.3865292, -1.924397, 1, 0.5176471, 0, 1,
-1.345971, 0.2377789, -1.086801, 1, 0.5215687, 0, 1,
-1.339845, 0.167003, -0.5803905, 1, 0.5294118, 0, 1,
-1.338304, -1.068505, -2.798073, 1, 0.5333334, 0, 1,
-1.333367, -2.178588, -3.368063, 1, 0.5411765, 0, 1,
-1.329393, 0.5292781, -0.6456751, 1, 0.5450981, 0, 1,
-1.32834, -1.017382, -3.19102, 1, 0.5529412, 0, 1,
-1.302816, -0.3916862, -1.401018, 1, 0.5568628, 0, 1,
-1.274969, -1.33226, -1.517996, 1, 0.5647059, 0, 1,
-1.274773, 0.3749824, -2.073141, 1, 0.5686275, 0, 1,
-1.263708, 1.929977, -1.315154, 1, 0.5764706, 0, 1,
-1.263011, 0.9263918, -0.7835965, 1, 0.5803922, 0, 1,
-1.256896, 0.121995, -3.140228, 1, 0.5882353, 0, 1,
-1.253466, -0.7826468, -1.492053, 1, 0.5921569, 0, 1,
-1.250038, -1.034176, -2.476747, 1, 0.6, 0, 1,
-1.248352, 0.09290123, -3.221465, 1, 0.6078432, 0, 1,
-1.247598, -1.392169, -2.480484, 1, 0.6117647, 0, 1,
-1.246703, 1.787125, -0.04218952, 1, 0.6196079, 0, 1,
-1.246427, -1.053583, -1.563967, 1, 0.6235294, 0, 1,
-1.240172, -0.08131379, -1.334929, 1, 0.6313726, 0, 1,
-1.237953, 0.567489, -0.6311804, 1, 0.6352941, 0, 1,
-1.235958, -0.05900506, -1.334058, 1, 0.6431373, 0, 1,
-1.235056, -0.2241983, -3.516066, 1, 0.6470588, 0, 1,
-1.234733, -2.079298, -2.153397, 1, 0.654902, 0, 1,
-1.224617, 0.9926018, -0.275592, 1, 0.6588235, 0, 1,
-1.222259, -0.4113419, -1.624156, 1, 0.6666667, 0, 1,
-1.219383, -0.7983745, -2.76877, 1, 0.6705883, 0, 1,
-1.216694, -1.008855, -3.547497, 1, 0.6784314, 0, 1,
-1.209323, 1.107275, -0.9387824, 1, 0.682353, 0, 1,
-1.20897, 0.7426382, -1.07544, 1, 0.6901961, 0, 1,
-1.205775, -0.4849975, -1.686218, 1, 0.6941177, 0, 1,
-1.19625, 0.4042813, -0.2161715, 1, 0.7019608, 0, 1,
-1.191328, 1.859952, 0.239772, 1, 0.7098039, 0, 1,
-1.184672, -0.4334813, -1.213506, 1, 0.7137255, 0, 1,
-1.178413, 1.441482, -2.701966, 1, 0.7215686, 0, 1,
-1.172534, -0.2224328, -2.569047, 1, 0.7254902, 0, 1,
-1.171364, 1.562353, -1.031963, 1, 0.7333333, 0, 1,
-1.168091, -2.050051, -2.45382, 1, 0.7372549, 0, 1,
-1.15493, 2.229569, -1.843783, 1, 0.7450981, 0, 1,
-1.152846, -0.3416717, -2.206074, 1, 0.7490196, 0, 1,
-1.151081, -0.2684225, -3.466594, 1, 0.7568628, 0, 1,
-1.14623, 0.3031895, -0.9380784, 1, 0.7607843, 0, 1,
-1.145821, 0.2387958, -1.023225, 1, 0.7686275, 0, 1,
-1.143524, -0.1734274, -2.331762, 1, 0.772549, 0, 1,
-1.139628, -0.4518081, -1.885533, 1, 0.7803922, 0, 1,
-1.13888, 0.6150175, -1.844856, 1, 0.7843137, 0, 1,
-1.137211, 0.2020325, -2.425754, 1, 0.7921569, 0, 1,
-1.13621, 0.1775402, -1.03104, 1, 0.7960784, 0, 1,
-1.134904, -2.025346, -2.011465, 1, 0.8039216, 0, 1,
-1.127861, 0.1449402, -0.6148775, 1, 0.8117647, 0, 1,
-1.127659, -0.248149, -2.066521, 1, 0.8156863, 0, 1,
-1.119089, 1.204046, -0.578641, 1, 0.8235294, 0, 1,
-1.113104, 1.263303, -0.7723631, 1, 0.827451, 0, 1,
-1.1018, -0.1125088, -1.803544, 1, 0.8352941, 0, 1,
-1.097586, -0.552255, -2.730916, 1, 0.8392157, 0, 1,
-1.083531, 1.100602, 1.052281, 1, 0.8470588, 0, 1,
-1.081669, 0.1124707, -1.129757, 1, 0.8509804, 0, 1,
-1.081612, -0.09115719, 0.1326574, 1, 0.8588235, 0, 1,
-1.080924, 0.1939345, -1.029583, 1, 0.8627451, 0, 1,
-1.076887, -1.241232, -3.179316, 1, 0.8705882, 0, 1,
-1.073154, -0.6294882, -0.7321288, 1, 0.8745098, 0, 1,
-1.064964, -0.005568202, -1.538176, 1, 0.8823529, 0, 1,
-1.059427, 0.9726999, -1.553989, 1, 0.8862745, 0, 1,
-1.058521, 0.2880922, 0.1398368, 1, 0.8941177, 0, 1,
-1.058303, 2.157598, 0.1869401, 1, 0.8980392, 0, 1,
-1.057365, -0.8131088, -3.953355, 1, 0.9058824, 0, 1,
-1.053737, 2.110833, 0.9212493, 1, 0.9137255, 0, 1,
-1.052875, 0.1717762, -0.9461998, 1, 0.9176471, 0, 1,
-1.051224, -0.7664205, -3.054581, 1, 0.9254902, 0, 1,
-1.045869, 1.696538, -1.654454, 1, 0.9294118, 0, 1,
-1.042154, 0.3232417, -0.6779408, 1, 0.9372549, 0, 1,
-1.039087, 1.913893, 0.4670217, 1, 0.9411765, 0, 1,
-1.037378, -0.8764058, -1.3651, 1, 0.9490196, 0, 1,
-1.037209, -0.352733, -2.585303, 1, 0.9529412, 0, 1,
-1.030478, -0.4416826, -0.7875351, 1, 0.9607843, 0, 1,
-1.029364, -0.2286095, -0.9473575, 1, 0.9647059, 0, 1,
-1.027235, -2.177011, -3.473995, 1, 0.972549, 0, 1,
-1.025508, 1.541867, -1.968885, 1, 0.9764706, 0, 1,
-1.019589, 1.045524, -2.021034, 1, 0.9843137, 0, 1,
-1.01143, 1.526603, -0.8071616, 1, 0.9882353, 0, 1,
-1.006695, -1.207667, -2.738201, 1, 0.9960784, 0, 1,
-1.001628, 0.08385989, -2.408377, 0.9960784, 1, 0, 1,
-0.9957422, 0.3549365, -0.8035278, 0.9921569, 1, 0, 1,
-0.9957163, -1.236874, -1.887691, 0.9843137, 1, 0, 1,
-0.993046, 1.199147, -1.848552, 0.9803922, 1, 0, 1,
-0.9891718, 0.9932495, -0.5545931, 0.972549, 1, 0, 1,
-0.9870653, 0.009422598, -1.96106, 0.9686275, 1, 0, 1,
-0.9832104, 0.08251021, -1.816718, 0.9607843, 1, 0, 1,
-0.9788628, -1.377263, -2.682633, 0.9568627, 1, 0, 1,
-0.972338, -1.095317, -2.82636, 0.9490196, 1, 0, 1,
-0.9719548, 1.097279, 0.7600494, 0.945098, 1, 0, 1,
-0.9650002, -1.270886, -3.600139, 0.9372549, 1, 0, 1,
-0.9604743, 0.2938857, -0.02739786, 0.9333333, 1, 0, 1,
-0.9544092, 0.07356986, -1.120882, 0.9254902, 1, 0, 1,
-0.9440663, 0.3867937, -0.2715232, 0.9215686, 1, 0, 1,
-0.9437031, -0.9212624, -2.357072, 0.9137255, 1, 0, 1,
-0.9361758, 1.542674, 0.3463239, 0.9098039, 1, 0, 1,
-0.9247242, -0.7579571, -2.252225, 0.9019608, 1, 0, 1,
-0.9230137, -0.5684721, -0.8665489, 0.8941177, 1, 0, 1,
-0.9221261, -0.7168878, -3.723827, 0.8901961, 1, 0, 1,
-0.9207112, 1.271041, -1.168091, 0.8823529, 1, 0, 1,
-0.9203711, -0.3698072, -1.406572, 0.8784314, 1, 0, 1,
-0.9190395, 1.727056, -1.389716, 0.8705882, 1, 0, 1,
-0.9016136, 0.3310348, -0.2582727, 0.8666667, 1, 0, 1,
-0.9015163, -0.09591793, -2.79756, 0.8588235, 1, 0, 1,
-0.8928082, 0.2067364, -2.027827, 0.854902, 1, 0, 1,
-0.8865176, -0.5020645, -2.225518, 0.8470588, 1, 0, 1,
-0.8835674, 0.730002, -0.7276697, 0.8431373, 1, 0, 1,
-0.8819941, -2.114501, -3.826766, 0.8352941, 1, 0, 1,
-0.8803369, -0.509621, -1.98803, 0.8313726, 1, 0, 1,
-0.8765894, -0.4824702, -0.7649517, 0.8235294, 1, 0, 1,
-0.8760055, 0.2690215, -0.2900879, 0.8196079, 1, 0, 1,
-0.8672026, -0.4712537, -1.880926, 0.8117647, 1, 0, 1,
-0.865971, -0.8744205, -2.347863, 0.8078431, 1, 0, 1,
-0.8646804, 1.452942, -1.84669, 0.8, 1, 0, 1,
-0.8646527, -1.138855, -3.612974, 0.7921569, 1, 0, 1,
-0.8573488, -0.3251076, -3.415621, 0.7882353, 1, 0, 1,
-0.8537245, 1.042125, 1.071045, 0.7803922, 1, 0, 1,
-0.8502735, 0.4431393, -0.3684807, 0.7764706, 1, 0, 1,
-0.8490873, -0.1813353, -2.869876, 0.7686275, 1, 0, 1,
-0.8477038, 0.6822901, -0.1768547, 0.7647059, 1, 0, 1,
-0.8468655, -2.220634, -4.508833, 0.7568628, 1, 0, 1,
-0.8444967, -0.6832623, -1.740021, 0.7529412, 1, 0, 1,
-0.8441625, -1.307898, -2.823572, 0.7450981, 1, 0, 1,
-0.8325925, 0.6493443, -1.196793, 0.7411765, 1, 0, 1,
-0.8259946, -2.52949, -0.8012267, 0.7333333, 1, 0, 1,
-0.8252319, 0.387356, -1.561465, 0.7294118, 1, 0, 1,
-0.8199733, 0.06941868, -1.593852, 0.7215686, 1, 0, 1,
-0.8167751, 1.169334, -1.339238, 0.7176471, 1, 0, 1,
-0.8139223, 0.6686592, -0.9871361, 0.7098039, 1, 0, 1,
-0.8111088, -0.824786, -2.302419, 0.7058824, 1, 0, 1,
-0.8082079, -0.7791219, -1.731039, 0.6980392, 1, 0, 1,
-0.8075713, 1.120959, -0.4860316, 0.6901961, 1, 0, 1,
-0.7982372, 0.3786267, -0.9345545, 0.6862745, 1, 0, 1,
-0.79524, 0.9650919, -0.973832, 0.6784314, 1, 0, 1,
-0.7930213, 2.87681, -0.9227819, 0.6745098, 1, 0, 1,
-0.792197, -1.896986, -1.373376, 0.6666667, 1, 0, 1,
-0.7894322, -0.3745244, -2.325547, 0.6627451, 1, 0, 1,
-0.7877207, 1.847659, 0.01128031, 0.654902, 1, 0, 1,
-0.7751122, -2.657063, -2.265975, 0.6509804, 1, 0, 1,
-0.7701496, -0.3857342, -2.824951, 0.6431373, 1, 0, 1,
-0.7679666, 0.7165496, -0.1250397, 0.6392157, 1, 0, 1,
-0.7639583, -0.01148139, -1.937358, 0.6313726, 1, 0, 1,
-0.7624857, 1.123307, -1.13381, 0.627451, 1, 0, 1,
-0.7601588, -0.2975651, -2.369231, 0.6196079, 1, 0, 1,
-0.7589196, -0.06727099, -1.286518, 0.6156863, 1, 0, 1,
-0.7569017, -0.2934146, -2.997756, 0.6078432, 1, 0, 1,
-0.7548177, -1.252214, -3.41187, 0.6039216, 1, 0, 1,
-0.7547286, -0.3409357, -2.511097, 0.5960785, 1, 0, 1,
-0.7546905, -1.815163, -2.109468, 0.5882353, 1, 0, 1,
-0.7541, -0.5040356, -2.523899, 0.5843138, 1, 0, 1,
-0.7523388, 1.434237, -1.905814, 0.5764706, 1, 0, 1,
-0.7463652, 1.391573, -1.23068, 0.572549, 1, 0, 1,
-0.7450138, -0.5640258, -2.860663, 0.5647059, 1, 0, 1,
-0.7369851, -0.887462, -3.559199, 0.5607843, 1, 0, 1,
-0.7365621, -0.8631024, -4.419514, 0.5529412, 1, 0, 1,
-0.7332737, 2.26541, -0.3685439, 0.5490196, 1, 0, 1,
-0.7331483, 0.1874859, 0.1981269, 0.5411765, 1, 0, 1,
-0.7315885, 0.4771237, -0.5825765, 0.5372549, 1, 0, 1,
-0.7311046, -0.8063051, -1.093247, 0.5294118, 1, 0, 1,
-0.7187092, 1.824785, -2.123141, 0.5254902, 1, 0, 1,
-0.7184721, 0.8642476, -2.126974, 0.5176471, 1, 0, 1,
-0.7172359, -1.03591, -1.370413, 0.5137255, 1, 0, 1,
-0.7171231, 0.9410328, -2.024786, 0.5058824, 1, 0, 1,
-0.7112339, -0.3601755, -3.375612, 0.5019608, 1, 0, 1,
-0.704851, 0.1433628, -0.8606178, 0.4941176, 1, 0, 1,
-0.7027914, -0.09526164, -0.3773756, 0.4862745, 1, 0, 1,
-0.6926433, -0.2146816, -2.236239, 0.4823529, 1, 0, 1,
-0.6903192, -1.183607, -1.437113, 0.4745098, 1, 0, 1,
-0.6874245, 0.7541624, 0.5912652, 0.4705882, 1, 0, 1,
-0.6846218, 0.8382865, -1.614798, 0.4627451, 1, 0, 1,
-0.680389, 1.363556, -0.7642977, 0.4588235, 1, 0, 1,
-0.676227, 0.3344404, -1.763707, 0.4509804, 1, 0, 1,
-0.6733329, -1.675963, -2.996521, 0.4470588, 1, 0, 1,
-0.672298, 0.4648529, -1.514866, 0.4392157, 1, 0, 1,
-0.6708415, -1.425414, -3.589626, 0.4352941, 1, 0, 1,
-0.6684884, 0.3206031, -2.607364, 0.427451, 1, 0, 1,
-0.6676496, -0.8101695, -3.402747, 0.4235294, 1, 0, 1,
-0.666366, -1.457431, -4.14114, 0.4156863, 1, 0, 1,
-0.6647485, -1.557595, -3.608539, 0.4117647, 1, 0, 1,
-0.6611573, -1.268861, -2.884167, 0.4039216, 1, 0, 1,
-0.6586, 0.9235591, -0.8297982, 0.3960784, 1, 0, 1,
-0.655713, 0.1230145, -0.8197948, 0.3921569, 1, 0, 1,
-0.6546763, -0.4987492, -2.929528, 0.3843137, 1, 0, 1,
-0.6526907, -1.817915, -2.810654, 0.3803922, 1, 0, 1,
-0.6496056, -0.1790192, -1.939385, 0.372549, 1, 0, 1,
-0.6443098, 0.1561988, 0.3200787, 0.3686275, 1, 0, 1,
-0.6421991, 0.03632446, -1.384463, 0.3607843, 1, 0, 1,
-0.639693, -0.06807087, -2.692025, 0.3568628, 1, 0, 1,
-0.6307065, 1.99438, -0.3771229, 0.3490196, 1, 0, 1,
-0.6265053, -0.1772731, -3.766943, 0.345098, 1, 0, 1,
-0.6199138, 0.1992701, -2.058868, 0.3372549, 1, 0, 1,
-0.6158617, -1.370283, -2.825712, 0.3333333, 1, 0, 1,
-0.609452, 1.691998, -1.17428, 0.3254902, 1, 0, 1,
-0.6074504, 0.5912768, -2.547006, 0.3215686, 1, 0, 1,
-0.6034377, 0.9648711, -0.3894416, 0.3137255, 1, 0, 1,
-0.603168, 0.7858654, -0.4967826, 0.3098039, 1, 0, 1,
-0.5981513, -1.019542, -4.498164, 0.3019608, 1, 0, 1,
-0.5935317, 0.7795764, 1.027381, 0.2941177, 1, 0, 1,
-0.5928933, -0.6555963, -1.840916, 0.2901961, 1, 0, 1,
-0.5898757, 0.5251817, -1.092981, 0.282353, 1, 0, 1,
-0.5885846, -0.4983614, -2.213438, 0.2784314, 1, 0, 1,
-0.5831527, 1.599585, -1.714385, 0.2705882, 1, 0, 1,
-0.5750417, -1.363975, -3.141042, 0.2666667, 1, 0, 1,
-0.5588039, 1.470165, 0.3774733, 0.2588235, 1, 0, 1,
-0.5549867, -1.811742, -3.243107, 0.254902, 1, 0, 1,
-0.5547521, -1.306453, -3.328079, 0.2470588, 1, 0, 1,
-0.5542716, 2.2587, 0.3324873, 0.2431373, 1, 0, 1,
-0.547366, 0.9277216, -2.031608, 0.2352941, 1, 0, 1,
-0.5420078, 1.212795, 0.3732488, 0.2313726, 1, 0, 1,
-0.5399587, 0.3608061, 0.2088241, 0.2235294, 1, 0, 1,
-0.5376328, 0.5661294, 0.1147836, 0.2196078, 1, 0, 1,
-0.5281565, -0.0632731, -1.617881, 0.2117647, 1, 0, 1,
-0.5271999, 0.6674035, -0.4863329, 0.2078431, 1, 0, 1,
-0.5211915, 0.3278523, 0.05205533, 0.2, 1, 0, 1,
-0.5185161, -0.002819169, -1.557779, 0.1921569, 1, 0, 1,
-0.517552, 1.211411, 1.162936, 0.1882353, 1, 0, 1,
-0.5150892, -0.01618026, -2.434741, 0.1803922, 1, 0, 1,
-0.5132188, -0.7031438, -1.275184, 0.1764706, 1, 0, 1,
-0.5110349, -1.417169, -2.981472, 0.1686275, 1, 0, 1,
-0.5050642, -0.7587855, -2.706032, 0.1647059, 1, 0, 1,
-0.5019878, -0.1832362, -4.157558, 0.1568628, 1, 0, 1,
-0.5002477, -1.864081, -4.6648, 0.1529412, 1, 0, 1,
-0.4990254, -1.578971, -3.504179, 0.145098, 1, 0, 1,
-0.4974649, 0.6026998, -0.826924, 0.1411765, 1, 0, 1,
-0.4965428, -0.1788827, -2.859966, 0.1333333, 1, 0, 1,
-0.4923604, -0.7693652, -2.810986, 0.1294118, 1, 0, 1,
-0.4898547, 0.1983051, -1.289367, 0.1215686, 1, 0, 1,
-0.4878053, 1.054386, 0.6228765, 0.1176471, 1, 0, 1,
-0.4807213, -0.1240106, -1.872697, 0.1098039, 1, 0, 1,
-0.4801387, 0.1002915, 0.2533862, 0.1058824, 1, 0, 1,
-0.47951, -0.4312958, -3.434869, 0.09803922, 1, 0, 1,
-0.4767862, 2.202508, -0.1273499, 0.09019608, 1, 0, 1,
-0.476325, 0.03342777, -1.005208, 0.08627451, 1, 0, 1,
-0.4722333, -0.1977698, -3.676429, 0.07843138, 1, 0, 1,
-0.4714988, 0.8166689, -0.1059676, 0.07450981, 1, 0, 1,
-0.471176, -0.5594457, -0.7400534, 0.06666667, 1, 0, 1,
-0.468729, 1.720546, 1.086595, 0.0627451, 1, 0, 1,
-0.4686921, 0.2138824, -1.186874, 0.05490196, 1, 0, 1,
-0.4604527, 0.3478589, -1.679444, 0.05098039, 1, 0, 1,
-0.454734, 0.288709, -0.4641209, 0.04313726, 1, 0, 1,
-0.4515813, -1.609912, -3.488555, 0.03921569, 1, 0, 1,
-0.4512234, -0.7989909, -4.808197, 0.03137255, 1, 0, 1,
-0.4510553, 0.2043678, -2.116998, 0.02745098, 1, 0, 1,
-0.4481929, -1.553832, -4.072603, 0.01960784, 1, 0, 1,
-0.4462153, 0.6365507, 0.2158738, 0.01568628, 1, 0, 1,
-0.4434998, -0.8001928, -3.687294, 0.007843138, 1, 0, 1,
-0.4434696, -0.4786077, -3.216811, 0.003921569, 1, 0, 1,
-0.4429165, 0.6591912, 0.9277999, 0, 1, 0.003921569, 1,
-0.4416129, 0.7915269, 0.157099, 0, 1, 0.01176471, 1,
-0.4357265, 0.513982, -1.241627, 0, 1, 0.01568628, 1,
-0.4327359, 1.695078, 0.5773335, 0, 1, 0.02352941, 1,
-0.4313231, -0.369139, -3.028116, 0, 1, 0.02745098, 1,
-0.4281856, -0.2044838, -3.370083, 0, 1, 0.03529412, 1,
-0.4268949, -0.2812167, -1.722769, 0, 1, 0.03921569, 1,
-0.4253584, 0.3786663, -1.550232, 0, 1, 0.04705882, 1,
-0.4232555, 0.7347994, 0.2046711, 0, 1, 0.05098039, 1,
-0.4219989, 0.716464, -0.4258622, 0, 1, 0.05882353, 1,
-0.4158168, 1.04078, -0.8997166, 0, 1, 0.0627451, 1,
-0.4148845, 0.8417072, -0.9987911, 0, 1, 0.07058824, 1,
-0.4141293, 0.4179872, -1.442941, 0, 1, 0.07450981, 1,
-0.4129637, 0.8016326, -2.096642, 0, 1, 0.08235294, 1,
-0.411459, 0.6633754, -1.024744, 0, 1, 0.08627451, 1,
-0.4093482, 0.0495405, -1.28299, 0, 1, 0.09411765, 1,
-0.4069968, -1.277276, -2.814624, 0, 1, 0.1019608, 1,
-0.4035492, 0.2963888, 0.5640556, 0, 1, 0.1058824, 1,
-0.3999684, 0.07098856, -1.570504, 0, 1, 0.1137255, 1,
-0.3991722, 0.4334904, -0.4862067, 0, 1, 0.1176471, 1,
-0.395465, -0.616803, -4.600989, 0, 1, 0.1254902, 1,
-0.3928605, 0.8151125, -1.782928, 0, 1, 0.1294118, 1,
-0.3911118, -0.9102795, -2.759007, 0, 1, 0.1372549, 1,
-0.3908716, -1.120495, -3.976357, 0, 1, 0.1411765, 1,
-0.3868619, 1.946141, -1.32179, 0, 1, 0.1490196, 1,
-0.3867624, -0.02294346, 0.348117, 0, 1, 0.1529412, 1,
-0.3824632, -0.9563803, -2.730099, 0, 1, 0.1607843, 1,
-0.3802214, -0.5698897, -2.175322, 0, 1, 0.1647059, 1,
-0.3796218, -0.0011942, -2.053329, 0, 1, 0.172549, 1,
-0.3775368, -1.383763, -2.78351, 0, 1, 0.1764706, 1,
-0.3755471, -0.25281, -2.405946, 0, 1, 0.1843137, 1,
-0.3742542, 2.50571, -0.6130534, 0, 1, 0.1882353, 1,
-0.3720593, 0.6700126, -0.08104812, 0, 1, 0.1960784, 1,
-0.3709521, -0.5092114, -2.735785, 0, 1, 0.2039216, 1,
-0.3684886, 0.3301985, 1.494809, 0, 1, 0.2078431, 1,
-0.3554553, -0.2144268, -1.638349, 0, 1, 0.2156863, 1,
-0.3552806, -0.6595654, -3.207263, 0, 1, 0.2196078, 1,
-0.3539487, -0.1574323, -1.901504, 0, 1, 0.227451, 1,
-0.3526704, -1.203765, -2.971228, 0, 1, 0.2313726, 1,
-0.3466177, 0.7735835, -1.143013, 0, 1, 0.2392157, 1,
-0.3451466, 0.7765401, -2.027045, 0, 1, 0.2431373, 1,
-0.3388541, 1.278889, -1.325007, 0, 1, 0.2509804, 1,
-0.3301788, -0.7699053, -1.980545, 0, 1, 0.254902, 1,
-0.3280469, -0.727636, -1.491381, 0, 1, 0.2627451, 1,
-0.3277696, -0.4301254, -3.048997, 0, 1, 0.2666667, 1,
-0.3260261, 0.7595918, 0.1671536, 0, 1, 0.2745098, 1,
-0.3251284, 0.3286498, -0.1354814, 0, 1, 0.2784314, 1,
-0.3248557, 1.05041, 0.6323627, 0, 1, 0.2862745, 1,
-0.3178675, 0.6993233, -1.72768, 0, 1, 0.2901961, 1,
-0.3143229, 0.8829428, -0.9116778, 0, 1, 0.2980392, 1,
-0.3135501, -0.08458718, -1.657058, 0, 1, 0.3058824, 1,
-0.3090222, 0.009668765, -2.516458, 0, 1, 0.3098039, 1,
-0.3049024, -0.7833835, -2.590676, 0, 1, 0.3176471, 1,
-0.2985023, -0.264638, -1.451209, 0, 1, 0.3215686, 1,
-0.2932275, 0.5624475, -0.898985, 0, 1, 0.3294118, 1,
-0.284651, -0.4089334, -1.845708, 0, 1, 0.3333333, 1,
-0.2836415, 1.031031, -0.0720888, 0, 1, 0.3411765, 1,
-0.2835196, 0.8461238, -0.4463309, 0, 1, 0.345098, 1,
-0.2808948, 0.3195992, -0.9064483, 0, 1, 0.3529412, 1,
-0.2787529, 0.5567855, -0.7120807, 0, 1, 0.3568628, 1,
-0.277014, 0.3521039, -1.439921, 0, 1, 0.3647059, 1,
-0.2681692, 0.001149468, -1.777124, 0, 1, 0.3686275, 1,
-0.2644579, -1.695347, -3.518934, 0, 1, 0.3764706, 1,
-0.2614544, -2.170688, -3.826878, 0, 1, 0.3803922, 1,
-0.2592072, -1.462376, -2.468393, 0, 1, 0.3882353, 1,
-0.2547392, -1.162726, -2.754049, 0, 1, 0.3921569, 1,
-0.254532, 0.1052646, -2.756419, 0, 1, 0.4, 1,
-0.2526011, -0.6734511, -3.314373, 0, 1, 0.4078431, 1,
-0.2509729, 0.6497228, -1.280751, 0, 1, 0.4117647, 1,
-0.2458833, -0.7078456, -2.727361, 0, 1, 0.4196078, 1,
-0.2419972, -0.6135032, -4.04501, 0, 1, 0.4235294, 1,
-0.2407891, 0.3667364, 0.5802813, 0, 1, 0.4313726, 1,
-0.2371183, 0.4626314, -0.3073609, 0, 1, 0.4352941, 1,
-0.2343711, -0.2002066, -3.472081, 0, 1, 0.4431373, 1,
-0.2329279, 0.07855128, -1.001347, 0, 1, 0.4470588, 1,
-0.2321097, -0.2374716, -2.237252, 0, 1, 0.454902, 1,
-0.2311876, 1.502415, 1.302889, 0, 1, 0.4588235, 1,
-0.2301257, -0.0779194, -2.778972, 0, 1, 0.4666667, 1,
-0.2247539, 1.471631, -0.9715685, 0, 1, 0.4705882, 1,
-0.2192871, -0.6053622, -0.9955581, 0, 1, 0.4784314, 1,
-0.2139314, -0.2063932, -2.337484, 0, 1, 0.4823529, 1,
-0.2130409, -0.2090778, -2.697944, 0, 1, 0.4901961, 1,
-0.2099791, 0.1321424, 0.3057292, 0, 1, 0.4941176, 1,
-0.2095788, -0.08225102, -2.982274, 0, 1, 0.5019608, 1,
-0.2086702, -0.2371419, -0.1018343, 0, 1, 0.509804, 1,
-0.2036541, -0.7406945, -2.333444, 0, 1, 0.5137255, 1,
-0.2035223, -0.510482, -3.244046, 0, 1, 0.5215687, 1,
-0.1997678, 0.06534749, -2.561895, 0, 1, 0.5254902, 1,
-0.1990786, 0.03325069, -0.5084288, 0, 1, 0.5333334, 1,
-0.1850434, 1.03423, 1.081938, 0, 1, 0.5372549, 1,
-0.1839517, -0.8398028, -4.205337, 0, 1, 0.5450981, 1,
-0.1809069, 1.601939, 1.024875, 0, 1, 0.5490196, 1,
-0.1792679, -0.8977188, -1.841974, 0, 1, 0.5568628, 1,
-0.1733469, 0.2439554, -2.373291, 0, 1, 0.5607843, 1,
-0.1721589, -0.5184096, -1.899442, 0, 1, 0.5686275, 1,
-0.1678344, 0.3172638, 0.2612391, 0, 1, 0.572549, 1,
-0.1674394, 0.03036232, -1.543919, 0, 1, 0.5803922, 1,
-0.1657113, 1.358836, 0.138368, 0, 1, 0.5843138, 1,
-0.1617115, -0.3923362, -3.440972, 0, 1, 0.5921569, 1,
-0.161152, 0.01159994, -1.251225, 0, 1, 0.5960785, 1,
-0.1489047, 1.156819, 0.5691717, 0, 1, 0.6039216, 1,
-0.141781, 1.703145, -0.1082187, 0, 1, 0.6117647, 1,
-0.1387957, 0.2886164, -0.8929137, 0, 1, 0.6156863, 1,
-0.1385642, -2.120043, -1.607293, 0, 1, 0.6235294, 1,
-0.1323906, -1.413846, -3.73769, 0, 1, 0.627451, 1,
-0.1304821, -0.7579525, -2.364622, 0, 1, 0.6352941, 1,
-0.1303308, -1.299051, -2.951051, 0, 1, 0.6392157, 1,
-0.1286555, -0.7813519, -1.34054, 0, 1, 0.6470588, 1,
-0.1281718, -0.8816025, -3.729537, 0, 1, 0.6509804, 1,
-0.1271227, 0.6666054, -1.122184, 0, 1, 0.6588235, 1,
-0.1172312, -1.156102, -3.352809, 0, 1, 0.6627451, 1,
-0.1154519, 0.5226672, -0.6464151, 0, 1, 0.6705883, 1,
-0.11142, 0.7589935, -0.6076461, 0, 1, 0.6745098, 1,
-0.1094358, 0.1435874, -3.312506, 0, 1, 0.682353, 1,
-0.1081691, 0.4537211, -0.05641894, 0, 1, 0.6862745, 1,
-0.108107, 0.02784069, -1.808217, 0, 1, 0.6941177, 1,
-0.1069612, 0.3055273, 0.07645559, 0, 1, 0.7019608, 1,
-0.1054838, 0.2979205, -1.131921, 0, 1, 0.7058824, 1,
-0.1040125, 0.2562276, 0.3173923, 0, 1, 0.7137255, 1,
-0.1027341, 0.4372568, 0.5906887, 0, 1, 0.7176471, 1,
-0.102251, -2.443343, -4.83899, 0, 1, 0.7254902, 1,
-0.09952467, 1.251477, -1.607183, 0, 1, 0.7294118, 1,
-0.09747186, 0.01742605, -1.508922, 0, 1, 0.7372549, 1,
-0.09644204, 0.9993764, 0.07071975, 0, 1, 0.7411765, 1,
-0.09595077, 0.3272202, -1.342684, 0, 1, 0.7490196, 1,
-0.09336631, 0.2669328, -1.151755, 0, 1, 0.7529412, 1,
-0.08704402, -2.178679, -3.018224, 0, 1, 0.7607843, 1,
-0.08441094, -0.4489902, -2.525948, 0, 1, 0.7647059, 1,
-0.08336892, 1.686077, 0.3803804, 0, 1, 0.772549, 1,
-0.07205052, -0.5021865, -2.306916, 0, 1, 0.7764706, 1,
-0.06710897, 0.3587749, -0.4383186, 0, 1, 0.7843137, 1,
-0.06647197, 0.6435566, -1.10681, 0, 1, 0.7882353, 1,
-0.06548321, -2.809439, -2.192974, 0, 1, 0.7960784, 1,
-0.06143542, 2.589587, -1.002697, 0, 1, 0.8039216, 1,
-0.05992418, -0.3525897, -2.727795, 0, 1, 0.8078431, 1,
-0.0564604, -0.8309752, -3.411941, 0, 1, 0.8156863, 1,
-0.05135366, -1.044627, -2.772951, 0, 1, 0.8196079, 1,
-0.0499074, -0.7402484, -2.778859, 0, 1, 0.827451, 1,
-0.04891071, 0.3044725, 0.4930134, 0, 1, 0.8313726, 1,
-0.04712532, 0.1364206, -0.006949756, 0, 1, 0.8392157, 1,
-0.03844619, 1.462074, 0.4842769, 0, 1, 0.8431373, 1,
-0.03060105, 0.8031909, -0.3358078, 0, 1, 0.8509804, 1,
-0.02928693, 0.00345151, -0.8016551, 0, 1, 0.854902, 1,
-0.02846812, -1.077583, -3.535703, 0, 1, 0.8627451, 1,
-0.02660405, 0.5750127, 0.9299563, 0, 1, 0.8666667, 1,
-0.02334184, 1.56779, 1.242515, 0, 1, 0.8745098, 1,
-0.02083011, 0.8547968, 0.5769913, 0, 1, 0.8784314, 1,
-0.02025644, -0.1386569, -2.074807, 0, 1, 0.8862745, 1,
-0.01419198, 1.595217, 0.7447774, 0, 1, 0.8901961, 1,
-0.009792498, 0.4730788, 2.613158, 0, 1, 0.8980392, 1,
-0.006399583, -1.417347, -3.56473, 0, 1, 0.9058824, 1,
0.001052936, -0.1283625, 1.14496, 0, 1, 0.9098039, 1,
0.002262113, 0.85188, 1.193941, 0, 1, 0.9176471, 1,
0.007375773, 0.703918, -0.147805, 0, 1, 0.9215686, 1,
0.01036605, 0.280084, -1.082148, 0, 1, 0.9294118, 1,
0.01074219, 1.412031, 0.4822945, 0, 1, 0.9333333, 1,
0.0124669, -0.06092887, 2.442133, 0, 1, 0.9411765, 1,
0.01293398, 0.326522, -0.7219865, 0, 1, 0.945098, 1,
0.01701976, 0.169762, -0.7568661, 0, 1, 0.9529412, 1,
0.0172616, -1.853835, 3.306797, 0, 1, 0.9568627, 1,
0.02812678, 0.5815994, -0.298647, 0, 1, 0.9647059, 1,
0.02829264, -0.3360495, 3.896344, 0, 1, 0.9686275, 1,
0.03586856, 0.291983, 0.8822805, 0, 1, 0.9764706, 1,
0.03899615, 1.164538, -0.000707695, 0, 1, 0.9803922, 1,
0.04344334, -1.207674, 3.083609, 0, 1, 0.9882353, 1,
0.04887869, 0.6443678, -0.6891082, 0, 1, 0.9921569, 1,
0.0512424, -0.3063372, 2.047547, 0, 1, 1, 1,
0.05742241, -0.1462226, 3.03339, 0, 0.9921569, 1, 1,
0.05822823, 0.9276707, 1.106521, 0, 0.9882353, 1, 1,
0.05848279, -1.455589, 2.122958, 0, 0.9803922, 1, 1,
0.06032663, 1.888206, 2.215013, 0, 0.9764706, 1, 1,
0.06268177, 0.5294057, -0.3007866, 0, 0.9686275, 1, 1,
0.06326474, 1.762093, 1.778692, 0, 0.9647059, 1, 1,
0.07315077, -0.06300405, 2.086538, 0, 0.9568627, 1, 1,
0.08062054, -0.2145679, 1.422259, 0, 0.9529412, 1, 1,
0.08281971, 2.765163, 0.4765864, 0, 0.945098, 1, 1,
0.08529492, 0.0677962, 1.349925, 0, 0.9411765, 1, 1,
0.08863294, 0.3468721, 0.3470449, 0, 0.9333333, 1, 1,
0.08895438, -0.5084099, 3.726228, 0, 0.9294118, 1, 1,
0.09074403, 1.011982, -0.3216471, 0, 0.9215686, 1, 1,
0.09399801, 1.077495, 1.448024, 0, 0.9176471, 1, 1,
0.09445199, -0.5761555, 2.880786, 0, 0.9098039, 1, 1,
0.09651873, -0.2007669, 2.796191, 0, 0.9058824, 1, 1,
0.09741804, -0.02351921, 0.6592854, 0, 0.8980392, 1, 1,
0.09780144, 0.9787863, 0.1239821, 0, 0.8901961, 1, 1,
0.09928314, -0.38003, 5.733009, 0, 0.8862745, 1, 1,
0.1044102, 0.4231083, -0.5465529, 0, 0.8784314, 1, 1,
0.1063372, -1.459266, 1.285754, 0, 0.8745098, 1, 1,
0.1095444, -0.841677, 3.891526, 0, 0.8666667, 1, 1,
0.1106505, 0.5378149, -0.6569209, 0, 0.8627451, 1, 1,
0.1142029, -0.2501823, 1.922924, 0, 0.854902, 1, 1,
0.1171768, 0.3994974, 0.5565667, 0, 0.8509804, 1, 1,
0.1254023, 0.8513234, 0.5604403, 0, 0.8431373, 1, 1,
0.1265747, 0.06567948, 0.9422885, 0, 0.8392157, 1, 1,
0.1270496, 1.172823, 2.077706, 0, 0.8313726, 1, 1,
0.1336471, -0.604822, 0.6304587, 0, 0.827451, 1, 1,
0.1348937, 0.1425442, 1.125066, 0, 0.8196079, 1, 1,
0.1357007, 0.9168163, -0.09142757, 0, 0.8156863, 1, 1,
0.1372684, 1.467549, 0.7491418, 0, 0.8078431, 1, 1,
0.1454716, -1.170372, 2.750823, 0, 0.8039216, 1, 1,
0.1462756, 0.3761196, -0.2231575, 0, 0.7960784, 1, 1,
0.1487571, -0.78738, 3.287781, 0, 0.7882353, 1, 1,
0.1523936, -0.8194008, 2.729672, 0, 0.7843137, 1, 1,
0.1555445, -0.2926606, 0.7252889, 0, 0.7764706, 1, 1,
0.1557251, 0.6510476, -0.6135, 0, 0.772549, 1, 1,
0.1594915, -1.481345, 2.720901, 0, 0.7647059, 1, 1,
0.1603521, -0.6087073, 2.447972, 0, 0.7607843, 1, 1,
0.160519, -0.7590816, 4.569731, 0, 0.7529412, 1, 1,
0.1647495, -0.4784816, 2.646564, 0, 0.7490196, 1, 1,
0.1659428, 2.094984, 0.1571375, 0, 0.7411765, 1, 1,
0.1662152, -1.132579, 4.0833, 0, 0.7372549, 1, 1,
0.1680558, 0.5556014, 1.177203, 0, 0.7294118, 1, 1,
0.1702174, 0.03928721, 3.775091, 0, 0.7254902, 1, 1,
0.1707731, 1.972498, -0.124715, 0, 0.7176471, 1, 1,
0.1766982, 1.210441, -1.397325, 0, 0.7137255, 1, 1,
0.1879917, -0.2849123, 3.335217, 0, 0.7058824, 1, 1,
0.1880658, -0.2925375, 1.141979, 0, 0.6980392, 1, 1,
0.190064, 0.4240227, -0.1522343, 0, 0.6941177, 1, 1,
0.1907459, 0.01901322, 1.189311, 0, 0.6862745, 1, 1,
0.1914949, 0.8389078, 0.7046582, 0, 0.682353, 1, 1,
0.1917076, 1.132213, -0.115329, 0, 0.6745098, 1, 1,
0.1949495, 0.1836163, 0.733631, 0, 0.6705883, 1, 1,
0.1979646, 1.37316, 0.05424621, 0, 0.6627451, 1, 1,
0.1982797, 1.762267, 0.03580433, 0, 0.6588235, 1, 1,
0.2002328, 0.1577284, -0.2538406, 0, 0.6509804, 1, 1,
0.2019322, 0.1450331, 1.006771, 0, 0.6470588, 1, 1,
0.2046197, 0.03278264, 2.512301, 0, 0.6392157, 1, 1,
0.2086921, -1.810947, 4.007523, 0, 0.6352941, 1, 1,
0.2106296, -0.5345433, 2.581588, 0, 0.627451, 1, 1,
0.2115252, 0.9464972, 0.03393731, 0, 0.6235294, 1, 1,
0.2140914, -0.04553965, 2.266433, 0, 0.6156863, 1, 1,
0.2157916, -0.3219817, 2.363225, 0, 0.6117647, 1, 1,
0.2192061, 1.277638, 1.423981, 0, 0.6039216, 1, 1,
0.2196188, 0.979849, 0.2639283, 0, 0.5960785, 1, 1,
0.2204831, -0.3252043, 4.718152, 0, 0.5921569, 1, 1,
0.2261869, -1.106732, 3.262862, 0, 0.5843138, 1, 1,
0.2269631, -0.8926818, 3.879943, 0, 0.5803922, 1, 1,
0.2276002, 0.09612875, 2.981607, 0, 0.572549, 1, 1,
0.2295854, 0.5040275, 2.118242, 0, 0.5686275, 1, 1,
0.2295898, 1.605521, -0.4656725, 0, 0.5607843, 1, 1,
0.231175, 0.1119541, 1.659222, 0, 0.5568628, 1, 1,
0.2312591, 0.08368266, 1.584324, 0, 0.5490196, 1, 1,
0.2330464, -1.394908, 3.801203, 0, 0.5450981, 1, 1,
0.2337456, -0.379077, 1.891829, 0, 0.5372549, 1, 1,
0.2341549, 0.6899075, 1.093918, 0, 0.5333334, 1, 1,
0.2365424, 0.2130523, 1.850413, 0, 0.5254902, 1, 1,
0.2397391, 1.777153, -0.3723485, 0, 0.5215687, 1, 1,
0.2457518, 0.1123161, 0.7798665, 0, 0.5137255, 1, 1,
0.2459114, -1.616176, 4.809147, 0, 0.509804, 1, 1,
0.2513634, 0.7030609, 0.728138, 0, 0.5019608, 1, 1,
0.2517199, -0.592898, 2.776253, 0, 0.4941176, 1, 1,
0.2518585, 1.164847, 0.7035691, 0, 0.4901961, 1, 1,
0.2549756, 0.9245429, 0.02996288, 0, 0.4823529, 1, 1,
0.2561528, -1.825324, 3.101843, 0, 0.4784314, 1, 1,
0.2572421, 0.2916066, 0.4456825, 0, 0.4705882, 1, 1,
0.2574364, -1.182125, 3.593651, 0, 0.4666667, 1, 1,
0.2641878, 0.2177614, 0.01139633, 0, 0.4588235, 1, 1,
0.276462, -1.182146, 3.038962, 0, 0.454902, 1, 1,
0.2785813, 1.14109, 0.04926728, 0, 0.4470588, 1, 1,
0.2810935, -0.04478424, 2.920541, 0, 0.4431373, 1, 1,
0.2844404, -1.929555, 2.707205, 0, 0.4352941, 1, 1,
0.2896791, -0.7413269, 4.340699, 0, 0.4313726, 1, 1,
0.2917555, 0.1239296, 2.255667, 0, 0.4235294, 1, 1,
0.2941273, 0.4051169, -0.1322196, 0, 0.4196078, 1, 1,
0.2947283, 2.34496, 0.1726135, 0, 0.4117647, 1, 1,
0.2949798, -0.7852054, 2.709922, 0, 0.4078431, 1, 1,
0.298322, -0.5302958, 2.534036, 0, 0.4, 1, 1,
0.2984871, 0.155195, -0.06600767, 0, 0.3921569, 1, 1,
0.3047381, -1.747529, 1.874773, 0, 0.3882353, 1, 1,
0.3054655, -1.005397, 2.692762, 0, 0.3803922, 1, 1,
0.3067816, -1.970325, 3.239902, 0, 0.3764706, 1, 1,
0.3083454, -1.499054, 1.967029, 0, 0.3686275, 1, 1,
0.311174, 0.004025128, 1.446768, 0, 0.3647059, 1, 1,
0.3138131, 0.135822, 0.8322716, 0, 0.3568628, 1, 1,
0.3165786, -1.621024, 4.14585, 0, 0.3529412, 1, 1,
0.3181755, 0.1513982, 1.27431, 0, 0.345098, 1, 1,
0.3199009, 0.9267764, 0.427141, 0, 0.3411765, 1, 1,
0.3204772, 0.4299578, -0.6769366, 0, 0.3333333, 1, 1,
0.3230619, -1.111759, 3.276612, 0, 0.3294118, 1, 1,
0.3234656, -1.439764, 3.750861, 0, 0.3215686, 1, 1,
0.3242329, -1.01893, 4.388021, 0, 0.3176471, 1, 1,
0.3268165, 1.22856, -1.174161, 0, 0.3098039, 1, 1,
0.3274834, 0.003214357, 1.924066, 0, 0.3058824, 1, 1,
0.3296445, 0.1653981, 0.9483945, 0, 0.2980392, 1, 1,
0.3317544, 0.4162143, -0.329642, 0, 0.2901961, 1, 1,
0.3338339, 0.9476269, -0.03399161, 0, 0.2862745, 1, 1,
0.3358271, -0.05314459, 1.452274, 0, 0.2784314, 1, 1,
0.3367856, 0.3728895, 0.9427464, 0, 0.2745098, 1, 1,
0.337604, -0.5668173, 1.825777, 0, 0.2666667, 1, 1,
0.34368, -0.4259856, 1.638282, 0, 0.2627451, 1, 1,
0.3454699, -0.6467884, 3.788075, 0, 0.254902, 1, 1,
0.3475389, -0.8615625, 3.113324, 0, 0.2509804, 1, 1,
0.3481391, -0.311945, 2.21277, 0, 0.2431373, 1, 1,
0.3512394, -0.3494642, 3.377253, 0, 0.2392157, 1, 1,
0.3571229, 0.6091158, 0.9072108, 0, 0.2313726, 1, 1,
0.3666171, 0.7796232, -0.2973204, 0, 0.227451, 1, 1,
0.3695556, -1.339577, 2.79205, 0, 0.2196078, 1, 1,
0.3757056, -0.6836567, 1.948258, 0, 0.2156863, 1, 1,
0.3788477, 0.558454, 1.25736, 0, 0.2078431, 1, 1,
0.379541, 0.8945661, -0.7040682, 0, 0.2039216, 1, 1,
0.3819317, -0.04626449, 1.911307, 0, 0.1960784, 1, 1,
0.3864639, -0.5552369, 4.380163, 0, 0.1882353, 1, 1,
0.3879681, -0.3651281, 2.624858, 0, 0.1843137, 1, 1,
0.3904311, 0.5642195, -1.396816, 0, 0.1764706, 1, 1,
0.3911593, -1.416723, 2.755512, 0, 0.172549, 1, 1,
0.3938218, -0.6077822, 4.736402, 0, 0.1647059, 1, 1,
0.398305, -0.3529367, 3.243572, 0, 0.1607843, 1, 1,
0.3992376, -1.995352, 2.481664, 0, 0.1529412, 1, 1,
0.4110087, 0.6259723, 1.932536, 0, 0.1490196, 1, 1,
0.4125982, 0.7679289, -1.129627, 0, 0.1411765, 1, 1,
0.4185078, -0.007080817, 2.974843, 0, 0.1372549, 1, 1,
0.4211035, 0.7466299, 0.6984566, 0, 0.1294118, 1, 1,
0.424439, 2.024343, -0.06056353, 0, 0.1254902, 1, 1,
0.4250197, -1.541486, 3.317677, 0, 0.1176471, 1, 1,
0.4281353, -0.3937711, 3.332159, 0, 0.1137255, 1, 1,
0.4288636, 0.7325704, 1.240644, 0, 0.1058824, 1, 1,
0.4319319, -0.1172501, 1.54129, 0, 0.09803922, 1, 1,
0.4323418, -1.778193, 2.968191, 0, 0.09411765, 1, 1,
0.4340914, 0.4018018, 2.637966, 0, 0.08627451, 1, 1,
0.4356674, 1.320734, 0.6185547, 0, 0.08235294, 1, 1,
0.4365723, 0.5545651, 0.8695189, 0, 0.07450981, 1, 1,
0.4374603, -1.289092, 2.609008, 0, 0.07058824, 1, 1,
0.4374631, -1.605218, 4.159906, 0, 0.0627451, 1, 1,
0.4424405, -1.890362, 1.731263, 0, 0.05882353, 1, 1,
0.4432189, 0.002865626, 0.9713892, 0, 0.05098039, 1, 1,
0.4432261, 0.1510822, 0.3542974, 0, 0.04705882, 1, 1,
0.4456847, -1.80465, 3.446498, 0, 0.03921569, 1, 1,
0.4457835, -1.468167, 3.131512, 0, 0.03529412, 1, 1,
0.4468262, 0.7555941, 0.7769054, 0, 0.02745098, 1, 1,
0.4468536, -1.800237, 2.120639, 0, 0.02352941, 1, 1,
0.4492222, -0.5113753, 2.225992, 0, 0.01568628, 1, 1,
0.4500061, 0.1033347, 3.461623, 0, 0.01176471, 1, 1,
0.4574951, 0.8300616, 2.518156, 0, 0.003921569, 1, 1,
0.4589809, -0.1886681, 3.582294, 0.003921569, 0, 1, 1,
0.4596886, -2.061934, 3.531448, 0.007843138, 0, 1, 1,
0.4614601, 0.3833531, -0.3684568, 0.01568628, 0, 1, 1,
0.4678554, -1.427211, 1.813494, 0.01960784, 0, 1, 1,
0.4703316, -0.4646244, 3.367132, 0.02745098, 0, 1, 1,
0.4704791, 1.296553, -0.2835255, 0.03137255, 0, 1, 1,
0.4757869, -0.6765404, 2.756807, 0.03921569, 0, 1, 1,
0.4765698, 1.784549, 1.218549, 0.04313726, 0, 1, 1,
0.4903004, 1.01495, -0.3397587, 0.05098039, 0, 1, 1,
0.4904091, -0.1209281, 1.865274, 0.05490196, 0, 1, 1,
0.492833, 1.021813, 1.103169, 0.0627451, 0, 1, 1,
0.4942045, -0.7775329, 1.957899, 0.06666667, 0, 1, 1,
0.4979266, 0.5349252, 0.07583947, 0.07450981, 0, 1, 1,
0.504822, 0.2199104, 1.17582, 0.07843138, 0, 1, 1,
0.505836, -0.3907377, 2.816548, 0.08627451, 0, 1, 1,
0.5067957, 0.02241045, 1.228099, 0.09019608, 0, 1, 1,
0.5075434, -0.9223638, 2.053787, 0.09803922, 0, 1, 1,
0.5149103, -0.6002817, 2.747603, 0.1058824, 0, 1, 1,
0.5179221, 0.5404112, 0.765913, 0.1098039, 0, 1, 1,
0.5249045, 0.2293134, 0.8994627, 0.1176471, 0, 1, 1,
0.5253325, -0.2658662, 2.252282, 0.1215686, 0, 1, 1,
0.5270472, -1.029072, 2.521618, 0.1294118, 0, 1, 1,
0.5284467, -0.77769, 1.801046, 0.1333333, 0, 1, 1,
0.5308838, 0.296958, 0.5277213, 0.1411765, 0, 1, 1,
0.5315871, 0.4977017, -0.4454848, 0.145098, 0, 1, 1,
0.5329937, 1.510218, 0.959849, 0.1529412, 0, 1, 1,
0.5368047, 0.6090531, -0.2025057, 0.1568628, 0, 1, 1,
0.5387389, -0.07890853, 1.972854, 0.1647059, 0, 1, 1,
0.539522, 1.599492, 1.435815, 0.1686275, 0, 1, 1,
0.5431013, 1.368807, 0.299444, 0.1764706, 0, 1, 1,
0.5437669, -0.8399596, 4.344461, 0.1803922, 0, 1, 1,
0.5473033, -1.269542, 2.654475, 0.1882353, 0, 1, 1,
0.5494531, 1.334494, -0.5881859, 0.1921569, 0, 1, 1,
0.5533908, 0.4867988, 0.02282374, 0.2, 0, 1, 1,
0.5557929, 0.1397944, 1.174023, 0.2078431, 0, 1, 1,
0.5612895, -0.5175344, 4.827274, 0.2117647, 0, 1, 1,
0.5651726, -0.07287505, 0.9557134, 0.2196078, 0, 1, 1,
0.5661652, -0.2571723, 2.589014, 0.2235294, 0, 1, 1,
0.5708855, 1.223078, 0.6463627, 0.2313726, 0, 1, 1,
0.5725239, -1.354337, 4.500333, 0.2352941, 0, 1, 1,
0.5749308, -1.104036, 3.16806, 0.2431373, 0, 1, 1,
0.5753703, -0.4589553, 1.472441, 0.2470588, 0, 1, 1,
0.5795177, 0.5443783, 2.559956, 0.254902, 0, 1, 1,
0.580097, -0.2238523, 2.224658, 0.2588235, 0, 1, 1,
0.5803186, -1.509728, 3.860936, 0.2666667, 0, 1, 1,
0.5843992, 0.7352405, 0.2205593, 0.2705882, 0, 1, 1,
0.5915751, -1.569093, 2.957325, 0.2784314, 0, 1, 1,
0.5923386, 2.165848, 1.574556, 0.282353, 0, 1, 1,
0.5939571, -0.7723257, 1.859711, 0.2901961, 0, 1, 1,
0.6011133, 0.2561824, 1.421856, 0.2941177, 0, 1, 1,
0.6017594, -0.06684177, 2.562585, 0.3019608, 0, 1, 1,
0.6025578, 0.7597783, 1.750055, 0.3098039, 0, 1, 1,
0.605264, -0.3140505, -0.01149134, 0.3137255, 0, 1, 1,
0.6155302, -1.311138, 4.141963, 0.3215686, 0, 1, 1,
0.6249313, 0.3342581, 0.7238837, 0.3254902, 0, 1, 1,
0.6258152, -1.557985, 1.535588, 0.3333333, 0, 1, 1,
0.6274683, -0.7328793, 5.207205, 0.3372549, 0, 1, 1,
0.6338505, -0.8646851, 2.602547, 0.345098, 0, 1, 1,
0.6344175, -0.4355792, 0.7622477, 0.3490196, 0, 1, 1,
0.6357194, -0.2885978, 0.3040966, 0.3568628, 0, 1, 1,
0.6384767, -0.4013921, 2.81325, 0.3607843, 0, 1, 1,
0.6389882, 0.8076104, -0.3051734, 0.3686275, 0, 1, 1,
0.6408566, 0.6314265, -0.1912466, 0.372549, 0, 1, 1,
0.6425191, 0.4285941, -1.352454, 0.3803922, 0, 1, 1,
0.6443287, -0.169274, 1.444199, 0.3843137, 0, 1, 1,
0.6467949, 1.620782, 1.428658, 0.3921569, 0, 1, 1,
0.6469881, 0.1558772, -0.5024679, 0.3960784, 0, 1, 1,
0.6481367, -0.3659709, 1.941035, 0.4039216, 0, 1, 1,
0.6503628, 1.120006, 1.42682, 0.4117647, 0, 1, 1,
0.6515426, 0.6348535, 0.6655356, 0.4156863, 0, 1, 1,
0.6598487, -0.21228, 1.209257, 0.4235294, 0, 1, 1,
0.6622412, 0.8468418, 0.1675661, 0.427451, 0, 1, 1,
0.6635986, 1.483738, -0.01300292, 0.4352941, 0, 1, 1,
0.6648506, 0.6386203, 0.8015257, 0.4392157, 0, 1, 1,
0.6753113, 0.4082161, -0.5915951, 0.4470588, 0, 1, 1,
0.6799203, 1.586987, 1.480215, 0.4509804, 0, 1, 1,
0.6842641, 0.3013627, 2.737381, 0.4588235, 0, 1, 1,
0.6850075, 1.531254, -0.009482995, 0.4627451, 0, 1, 1,
0.6855084, 0.3000032, 1.953818, 0.4705882, 0, 1, 1,
0.6874914, -0.6211888, 2.83884, 0.4745098, 0, 1, 1,
0.6912768, 1.73755, -0.8906349, 0.4823529, 0, 1, 1,
0.6971341, -0.1502376, 1.752911, 0.4862745, 0, 1, 1,
0.6975134, 0.6077585, 0.8119625, 0.4941176, 0, 1, 1,
0.7043526, 0.7701194, -0.1166823, 0.5019608, 0, 1, 1,
0.7048013, -1.154589, 2.180759, 0.5058824, 0, 1, 1,
0.7057863, 1.267757, 2.111169, 0.5137255, 0, 1, 1,
0.7061085, 0.3724044, -0.5045782, 0.5176471, 0, 1, 1,
0.707092, -0.5100919, 2.337331, 0.5254902, 0, 1, 1,
0.7102166, 0.1224034, 1.722537, 0.5294118, 0, 1, 1,
0.7214106, -1.207224, 2.854648, 0.5372549, 0, 1, 1,
0.7215887, 1.078187, 1.016205, 0.5411765, 0, 1, 1,
0.7275432, 0.3226126, 1.490512, 0.5490196, 0, 1, 1,
0.7380303, -0.3079742, 3.929062, 0.5529412, 0, 1, 1,
0.7425243, -1.306408, 3.213449, 0.5607843, 0, 1, 1,
0.742941, 0.119075, 0.6022592, 0.5647059, 0, 1, 1,
0.7458301, -0.5787123, 2.442745, 0.572549, 0, 1, 1,
0.7465414, -1.109891, 1.211221, 0.5764706, 0, 1, 1,
0.7488577, -0.4328599, 2.072043, 0.5843138, 0, 1, 1,
0.7504272, 1.246938, 0.8242315, 0.5882353, 0, 1, 1,
0.7592559, 0.4542309, 1.655313, 0.5960785, 0, 1, 1,
0.7594866, -0.8626429, 2.505404, 0.6039216, 0, 1, 1,
0.7622093, 1.117704, -0.115412, 0.6078432, 0, 1, 1,
0.7635838, 0.8338388, 1.966618, 0.6156863, 0, 1, 1,
0.7666972, -0.3126179, 2.955243, 0.6196079, 0, 1, 1,
0.7699641, 0.17782, 1.147199, 0.627451, 0, 1, 1,
0.7731723, 1.64162, 1.704291, 0.6313726, 0, 1, 1,
0.7832106, -0.8392825, 0.8799236, 0.6392157, 0, 1, 1,
0.7851036, -0.4803538, 0.3913241, 0.6431373, 0, 1, 1,
0.7873007, -0.05115214, 1.145828, 0.6509804, 0, 1, 1,
0.7873659, 1.19277, 1.085052, 0.654902, 0, 1, 1,
0.7913682, -1.813146, 3.069531, 0.6627451, 0, 1, 1,
0.7932151, 0.4471801, -0.2734412, 0.6666667, 0, 1, 1,
0.7963896, 0.01512273, 2.729694, 0.6745098, 0, 1, 1,
0.8024265, -1.385995, 2.568684, 0.6784314, 0, 1, 1,
0.8036702, 0.2076987, 2.461498, 0.6862745, 0, 1, 1,
0.8051927, 1.785929, 0.2858961, 0.6901961, 0, 1, 1,
0.8084778, 0.5390306, 2.280294, 0.6980392, 0, 1, 1,
0.8106872, -0.02176273, 0.3691387, 0.7058824, 0, 1, 1,
0.8169735, -1.006598, 2.616546, 0.7098039, 0, 1, 1,
0.8170052, 0.9130096, -0.1348606, 0.7176471, 0, 1, 1,
0.8175412, -1.673733, 3.614312, 0.7215686, 0, 1, 1,
0.8194682, 2.120041, 0.9939299, 0.7294118, 0, 1, 1,
0.8387763, 0.5851006, 4.313629, 0.7333333, 0, 1, 1,
0.8404255, -1.102844, 0.5573127, 0.7411765, 0, 1, 1,
0.8424156, -1.141507, 2.853083, 0.7450981, 0, 1, 1,
0.8432583, -0.5899026, 1.928127, 0.7529412, 0, 1, 1,
0.8518338, -0.7841338, 3.598895, 0.7568628, 0, 1, 1,
0.8518777, -1.649299, 1.135415, 0.7647059, 0, 1, 1,
0.8611186, 0.2492552, 0.9460624, 0.7686275, 0, 1, 1,
0.8733933, -0.7212234, 1.259007, 0.7764706, 0, 1, 1,
0.87444, 1.985625, 0.577229, 0.7803922, 0, 1, 1,
0.8766269, -0.1225549, 0.9993934, 0.7882353, 0, 1, 1,
0.881369, -0.417967, 1.386215, 0.7921569, 0, 1, 1,
0.8930969, 0.9859925, 1.43971, 0.8, 0, 1, 1,
0.8931328, 1.01295, 0.5909973, 0.8078431, 0, 1, 1,
0.8981714, 1.618865, -0.03328194, 0.8117647, 0, 1, 1,
0.9023831, -2.386204, 1.498394, 0.8196079, 0, 1, 1,
0.9042941, -0.7209707, 0.4756072, 0.8235294, 0, 1, 1,
0.9043431, -0.3614651, 2.513465, 0.8313726, 0, 1, 1,
0.9060108, -0.4269507, 1.749669, 0.8352941, 0, 1, 1,
0.9133211, 0.5718765, -1.140744, 0.8431373, 0, 1, 1,
0.9145879, 0.07988569, 1.583392, 0.8470588, 0, 1, 1,
0.9167484, 1.492674, 1.407366, 0.854902, 0, 1, 1,
0.9206227, -0.3826543, 1.187188, 0.8588235, 0, 1, 1,
0.9236081, 0.9782875, 0.004552259, 0.8666667, 0, 1, 1,
0.9265079, -0.2066779, 0.6097882, 0.8705882, 0, 1, 1,
0.93325, -0.2564335, 2.617581, 0.8784314, 0, 1, 1,
0.9397805, 1.533806, -1.393474, 0.8823529, 0, 1, 1,
0.9437482, -0.55336, 3.612445, 0.8901961, 0, 1, 1,
0.9450709, 0.6555022, 1.113926, 0.8941177, 0, 1, 1,
0.9548733, 0.01459633, 1.52065, 0.9019608, 0, 1, 1,
0.9588199, -1.289756, 3.286979, 0.9098039, 0, 1, 1,
0.973487, 0.5893649, 0.7001975, 0.9137255, 0, 1, 1,
0.9750221, -0.8175426, 3.578351, 0.9215686, 0, 1, 1,
0.9752724, -0.9833277, 3.112016, 0.9254902, 0, 1, 1,
0.9790128, -0.0223657, 2.21818, 0.9333333, 0, 1, 1,
0.9800813, -0.6159856, 2.565252, 0.9372549, 0, 1, 1,
0.9831637, 0.004008311, 2.074842, 0.945098, 0, 1, 1,
0.9918717, 0.4377145, 0.3990969, 0.9490196, 0, 1, 1,
0.995313, 0.1965922, 1.132045, 0.9568627, 0, 1, 1,
0.996053, 1.787377, 1.461829, 0.9607843, 0, 1, 1,
0.9993823, 1.147678, 1.491409, 0.9686275, 0, 1, 1,
1.002762, -0.6628903, 4.38964, 0.972549, 0, 1, 1,
1.006107, -0.2333148, 1.093793, 0.9803922, 0, 1, 1,
1.006301, 0.9826328, -0.712905, 0.9843137, 0, 1, 1,
1.00733, -0.1434451, 2.312904, 0.9921569, 0, 1, 1,
1.016818, 1.627079, 3.553766, 0.9960784, 0, 1, 1,
1.020816, 0.681372, 1.443292, 1, 0, 0.9960784, 1,
1.026704, -0.8017089, 3.604697, 1, 0, 0.9882353, 1,
1.03604, -0.0496476, 1.873162, 1, 0, 0.9843137, 1,
1.04468, -0.04631158, 0.3166571, 1, 0, 0.9764706, 1,
1.054536, -0.2005552, -0.3931829, 1, 0, 0.972549, 1,
1.05768, 0.3880289, -0.3058766, 1, 0, 0.9647059, 1,
1.062192, -0.1447008, 2.788158, 1, 0, 0.9607843, 1,
1.062726, 2.046391, 0.2156296, 1, 0, 0.9529412, 1,
1.068845, 0.8351749, -0.5955667, 1, 0, 0.9490196, 1,
1.070667, 1.622709, -1.481557, 1, 0, 0.9411765, 1,
1.073929, -0.9193538, 1.369323, 1, 0, 0.9372549, 1,
1.074429, 0.1054884, 0.6778368, 1, 0, 0.9294118, 1,
1.074789, -0.539331, 3.781005, 1, 0, 0.9254902, 1,
1.076404, 0.7964603, 2.360205, 1, 0, 0.9176471, 1,
1.080632, 1.841402, 2.250172, 1, 0, 0.9137255, 1,
1.081311, 0.1164781, 1.567525, 1, 0, 0.9058824, 1,
1.0824, -0.8081516, 2.31033, 1, 0, 0.9019608, 1,
1.084572, 0.3718419, -0.9850975, 1, 0, 0.8941177, 1,
1.085917, 0.2495845, 1.155124, 1, 0, 0.8862745, 1,
1.09062, -1.201169, 2.31942, 1, 0, 0.8823529, 1,
1.093423, -0.2784856, 1.714155, 1, 0, 0.8745098, 1,
1.099666, -0.1109107, 0.2130149, 1, 0, 0.8705882, 1,
1.113228, -0.9642926, 1.648706, 1, 0, 0.8627451, 1,
1.12282, 0.1782598, 1.938316, 1, 0, 0.8588235, 1,
1.132258, 0.7947847, 0.771021, 1, 0, 0.8509804, 1,
1.139751, 1.540584, 3.191349, 1, 0, 0.8470588, 1,
1.144171, 1.859812, -0.4273188, 1, 0, 0.8392157, 1,
1.149696, 0.5362847, 0.6317761, 1, 0, 0.8352941, 1,
1.150081, 0.0379541, 2.191558, 1, 0, 0.827451, 1,
1.153689, 0.1546801, 0.2786295, 1, 0, 0.8235294, 1,
1.175879, 1.610148, -0.4240959, 1, 0, 0.8156863, 1,
1.186898, 0.2714642, 1.188576, 1, 0, 0.8117647, 1,
1.187051, 0.2712967, 1.123384, 1, 0, 0.8039216, 1,
1.188368, 0.6045558, 3.436452, 1, 0, 0.7960784, 1,
1.188727, 0.2960224, 2.716235, 1, 0, 0.7921569, 1,
1.192106, 0.3873807, 0.2910936, 1, 0, 0.7843137, 1,
1.196317, 0.8841928, 0.7826029, 1, 0, 0.7803922, 1,
1.200076, -0.6388624, 2.83576, 1, 0, 0.772549, 1,
1.206358, 0.3522857, 2.214884, 1, 0, 0.7686275, 1,
1.212294, 0.90128, -0.05676424, 1, 0, 0.7607843, 1,
1.221877, 0.4967145, 1.114291, 1, 0, 0.7568628, 1,
1.230579, 0.04670589, 2.055962, 1, 0, 0.7490196, 1,
1.243221, 0.5398023, 1.195807, 1, 0, 0.7450981, 1,
1.246975, -0.4122625, 2.11394, 1, 0, 0.7372549, 1,
1.253926, 0.1978316, 1.889587, 1, 0, 0.7333333, 1,
1.25758, 0.7543539, 1.49012, 1, 0, 0.7254902, 1,
1.257861, 0.9636018, 0.06926151, 1, 0, 0.7215686, 1,
1.25821, 1.687852, 0.9608819, 1, 0, 0.7137255, 1,
1.258438, -1.100352, 3.202351, 1, 0, 0.7098039, 1,
1.258829, 0.5088432, 0.8823016, 1, 0, 0.7019608, 1,
1.276181, 0.3077286, 0.8979942, 1, 0, 0.6941177, 1,
1.278754, -0.8789164, 2.344304, 1, 0, 0.6901961, 1,
1.281911, -1.082408, 3.216787, 1, 0, 0.682353, 1,
1.283042, -0.4720559, 0.2785233, 1, 0, 0.6784314, 1,
1.287508, 2.094518, 0.6291513, 1, 0, 0.6705883, 1,
1.288397, -1.472367, 1.741588, 1, 0, 0.6666667, 1,
1.290099, 1.030412, -0.4450933, 1, 0, 0.6588235, 1,
1.293686, 1.121308, 1.338937, 1, 0, 0.654902, 1,
1.308172, -0.7833937, 3.895446, 1, 0, 0.6470588, 1,
1.317379, -0.4731791, 2.579966, 1, 0, 0.6431373, 1,
1.317506, -0.1630716, 0.2901791, 1, 0, 0.6352941, 1,
1.322734, 1.372292, 0.8203746, 1, 0, 0.6313726, 1,
1.323785, -0.5575172, 2.762166, 1, 0, 0.6235294, 1,
1.324732, 0.004428796, 2.291457, 1, 0, 0.6196079, 1,
1.326664, 1.637454, -0.4274923, 1, 0, 0.6117647, 1,
1.3269, 1.368332, 1.861947, 1, 0, 0.6078432, 1,
1.332096, -0.7699154, 2.163804, 1, 0, 0.6, 1,
1.335611, -0.256649, 0.7309198, 1, 0, 0.5921569, 1,
1.340141, 1.734444, 0.5476177, 1, 0, 0.5882353, 1,
1.361868, 0.2439179, 1.924375, 1, 0, 0.5803922, 1,
1.36243, -0.5890312, 1.970584, 1, 0, 0.5764706, 1,
1.363618, 0.2648444, -0.1182363, 1, 0, 0.5686275, 1,
1.379578, 0.7594317, -0.8738508, 1, 0, 0.5647059, 1,
1.384349, 0.6743789, -0.3329467, 1, 0, 0.5568628, 1,
1.404099, -0.5932205, 2.553999, 1, 0, 0.5529412, 1,
1.410734, -0.4481913, 1.358844, 1, 0, 0.5450981, 1,
1.411843, 1.170516, 0.9091979, 1, 0, 0.5411765, 1,
1.413064, 0.7999184, -2.317969, 1, 0, 0.5333334, 1,
1.415357, 0.245249, 2.00271, 1, 0, 0.5294118, 1,
1.416921, -1.434441, 1.142783, 1, 0, 0.5215687, 1,
1.418404, 0.5805641, 0.5576327, 1, 0, 0.5176471, 1,
1.424677, -0.08389163, 1.519224, 1, 0, 0.509804, 1,
1.433171, -0.2946127, 2.10251, 1, 0, 0.5058824, 1,
1.44093, 0.938518, 0.527803, 1, 0, 0.4980392, 1,
1.449095, 0.8073458, 2.522324, 1, 0, 0.4901961, 1,
1.452934, -0.03041168, 2.238596, 1, 0, 0.4862745, 1,
1.462677, -0.6743042, 2.940585, 1, 0, 0.4784314, 1,
1.475723, 1.047106, 3.316797, 1, 0, 0.4745098, 1,
1.484547, 1.550852, -0.1663938, 1, 0, 0.4666667, 1,
1.498522, -0.2828834, 1.148484, 1, 0, 0.4627451, 1,
1.50108, -1.597172, 2.248318, 1, 0, 0.454902, 1,
1.503029, 0.06787433, 0.5271261, 1, 0, 0.4509804, 1,
1.527064, -0.801993, 2.456486, 1, 0, 0.4431373, 1,
1.533733, -0.1815241, -0.06492985, 1, 0, 0.4392157, 1,
1.534614, 0.9569992, 0.8993928, 1, 0, 0.4313726, 1,
1.541355, -0.2023842, 1.24628, 1, 0, 0.427451, 1,
1.550301, 0.07571753, 1.730319, 1, 0, 0.4196078, 1,
1.551482, 0.06509703, 1.894819, 1, 0, 0.4156863, 1,
1.56103, 0.5634441, 0.1624245, 1, 0, 0.4078431, 1,
1.565553, -0.04690565, 1.465388, 1, 0, 0.4039216, 1,
1.573048, -2.06377, 1.378162, 1, 0, 0.3960784, 1,
1.593748, 1.00428, 0.8794506, 1, 0, 0.3882353, 1,
1.617055, 1.552292, 1.491767, 1, 0, 0.3843137, 1,
1.630431, 0.15348, 0.4605263, 1, 0, 0.3764706, 1,
1.635166, 1.485457, -0.3471525, 1, 0, 0.372549, 1,
1.645266, -0.7804321, 2.796444, 1, 0, 0.3647059, 1,
1.650318, 0.550367, -1.661792, 1, 0, 0.3607843, 1,
1.662151, 0.2033085, 2.172786, 1, 0, 0.3529412, 1,
1.674984, -1.285182, 0.6182528, 1, 0, 0.3490196, 1,
1.684053, 0.2585085, 1.173611, 1, 0, 0.3411765, 1,
1.685651, -0.1517091, 0.8487957, 1, 0, 0.3372549, 1,
1.693135, 0.8137491, -0.3198893, 1, 0, 0.3294118, 1,
1.695893, 0.4282895, 2.073253, 1, 0, 0.3254902, 1,
1.702268, 0.6278988, 1.62449, 1, 0, 0.3176471, 1,
1.716909, 1.058491, 1.257705, 1, 0, 0.3137255, 1,
1.720804, -0.258923, 2.49201, 1, 0, 0.3058824, 1,
1.745483, -0.5085211, 3.328556, 1, 0, 0.2980392, 1,
1.748494, 0.8351939, 2.137853, 1, 0, 0.2941177, 1,
1.767511, 1.32375, -0.3115964, 1, 0, 0.2862745, 1,
1.782626, 0.1899321, 1.76115, 1, 0, 0.282353, 1,
1.78425, -1.063068, 2.634534, 1, 0, 0.2745098, 1,
1.78739, 0.8153466, 1.71184, 1, 0, 0.2705882, 1,
1.788549, 0.1483877, -0.3900519, 1, 0, 0.2627451, 1,
1.795453, 0.01416935, 1.804163, 1, 0, 0.2588235, 1,
1.796067, 0.6144018, 0.2073995, 1, 0, 0.2509804, 1,
1.804422, 0.345158, 0.276503, 1, 0, 0.2470588, 1,
1.804602, -1.308867, 2.36199, 1, 0, 0.2392157, 1,
1.82597, -0.07405028, 1.801046, 1, 0, 0.2352941, 1,
1.851211, 0.409147, -0.8776126, 1, 0, 0.227451, 1,
1.869277, -1.864459, 1.402003, 1, 0, 0.2235294, 1,
1.872226, 0.5585392, 1.825408, 1, 0, 0.2156863, 1,
1.880486, -0.2158275, 1.629423, 1, 0, 0.2117647, 1,
1.8899, -0.03316726, 2.655495, 1, 0, 0.2039216, 1,
1.892512, -1.045528, 2.403513, 1, 0, 0.1960784, 1,
1.906071, 0.3297422, 2.353705, 1, 0, 0.1921569, 1,
1.913021, 0.8635596, 1.065542, 1, 0, 0.1843137, 1,
1.957003, 0.04801043, 1.201617, 1, 0, 0.1803922, 1,
1.960738, -0.193444, 1.191461, 1, 0, 0.172549, 1,
1.964185, -1.953639, 2.409264, 1, 0, 0.1686275, 1,
2.000118, 0.1873157, 1.500534, 1, 0, 0.1607843, 1,
2.047066, 0.6399578, 2.406087, 1, 0, 0.1568628, 1,
2.059561, -0.9836769, 4.106521, 1, 0, 0.1490196, 1,
2.076333, 2.034388, 1.132369, 1, 0, 0.145098, 1,
2.089634, 0.07734048, 0.5191723, 1, 0, 0.1372549, 1,
2.128056, 0.7365909, 2.435168, 1, 0, 0.1333333, 1,
2.133102, -1.379064, 2.32519, 1, 0, 0.1254902, 1,
2.172832, -0.6039814, 0.8777183, 1, 0, 0.1215686, 1,
2.177351, 0.05843983, 0.5223457, 1, 0, 0.1137255, 1,
2.199736, -1.373176, 0.8251615, 1, 0, 0.1098039, 1,
2.205, -0.6030264, 1.454108, 1, 0, 0.1019608, 1,
2.210442, 1.069871, 1.056311, 1, 0, 0.09411765, 1,
2.228567, 0.6774724, 0.7502911, 1, 0, 0.09019608, 1,
2.272013, 0.3540957, 1.468796, 1, 0, 0.08235294, 1,
2.336795, 0.3282917, 0.5426197, 1, 0, 0.07843138, 1,
2.345672, 0.4621512, 1.558444, 1, 0, 0.07058824, 1,
2.390072, -0.6825682, 2.229012, 1, 0, 0.06666667, 1,
2.421123, -0.4581178, 1.208956, 1, 0, 0.05882353, 1,
2.438408, 0.3481792, 0.6263772, 1, 0, 0.05490196, 1,
2.458512, 0.3910832, 0.7061043, 1, 0, 0.04705882, 1,
2.468757, 0.3666684, 2.530616, 1, 0, 0.04313726, 1,
2.495302, 1.028069, 1.175874, 1, 0, 0.03529412, 1,
2.539307, -0.8093166, 3.786365, 1, 0, 0.03137255, 1,
2.638686, 0.9469766, 0.9996552, 1, 0, 0.02352941, 1,
2.670712, -1.354713, 2.334604, 1, 0, 0.01960784, 1,
2.7974, 0.5550377, 1.172385, 1, 0, 0.01176471, 1,
2.905922, 0.7568857, 2.411749, 1, 0, 0.007843138, 1
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
0.04261684, -3.773259, -6.630944, 0, -0.5, 0.5, 0.5,
0.04261684, -3.773259, -6.630944, 1, -0.5, 0.5, 0.5,
0.04261684, -3.773259, -6.630944, 1, 1.5, 0.5, 0.5,
0.04261684, -3.773259, -6.630944, 0, 1.5, 0.5, 0.5
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
-3.791349, 0.03368521, -6.630944, 0, -0.5, 0.5, 0.5,
-3.791349, 0.03368521, -6.630944, 1, -0.5, 0.5, 0.5,
-3.791349, 0.03368521, -6.630944, 1, 1.5, 0.5, 0.5,
-3.791349, 0.03368521, -6.630944, 0, 1.5, 0.5, 0.5
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
-3.791349, -3.773259, 0.4470096, 0, -0.5, 0.5, 0.5,
-3.791349, -3.773259, 0.4470096, 1, -0.5, 0.5, 0.5,
-3.791349, -3.773259, 0.4470096, 1, 1.5, 0.5, 0.5,
-3.791349, -3.773259, 0.4470096, 0, 1.5, 0.5, 0.5
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
-2, -2.894733, -4.99757,
2, -2.894733, -4.99757,
-2, -2.894733, -4.99757,
-2, -3.041154, -5.269799,
-1, -2.894733, -4.99757,
-1, -3.041154, -5.269799,
0, -2.894733, -4.99757,
0, -3.041154, -5.269799,
1, -2.894733, -4.99757,
1, -3.041154, -5.269799,
2, -2.894733, -4.99757,
2, -3.041154, -5.269799
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
-2, -3.333996, -5.814257, 0, -0.5, 0.5, 0.5,
-2, -3.333996, -5.814257, 1, -0.5, 0.5, 0.5,
-2, -3.333996, -5.814257, 1, 1.5, 0.5, 0.5,
-2, -3.333996, -5.814257, 0, 1.5, 0.5, 0.5,
-1, -3.333996, -5.814257, 0, -0.5, 0.5, 0.5,
-1, -3.333996, -5.814257, 1, -0.5, 0.5, 0.5,
-1, -3.333996, -5.814257, 1, 1.5, 0.5, 0.5,
-1, -3.333996, -5.814257, 0, 1.5, 0.5, 0.5,
0, -3.333996, -5.814257, 0, -0.5, 0.5, 0.5,
0, -3.333996, -5.814257, 1, -0.5, 0.5, 0.5,
0, -3.333996, -5.814257, 1, 1.5, 0.5, 0.5,
0, -3.333996, -5.814257, 0, 1.5, 0.5, 0.5,
1, -3.333996, -5.814257, 0, -0.5, 0.5, 0.5,
1, -3.333996, -5.814257, 1, -0.5, 0.5, 0.5,
1, -3.333996, -5.814257, 1, 1.5, 0.5, 0.5,
1, -3.333996, -5.814257, 0, 1.5, 0.5, 0.5,
2, -3.333996, -5.814257, 0, -0.5, 0.5, 0.5,
2, -3.333996, -5.814257, 1, -0.5, 0.5, 0.5,
2, -3.333996, -5.814257, 1, 1.5, 0.5, 0.5,
2, -3.333996, -5.814257, 0, 1.5, 0.5, 0.5
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
-2.906588, -2, -4.99757,
-2.906588, 2, -4.99757,
-2.906588, -2, -4.99757,
-3.054048, -2, -5.269799,
-2.906588, -1, -4.99757,
-3.054048, -1, -5.269799,
-2.906588, 0, -4.99757,
-3.054048, 0, -5.269799,
-2.906588, 1, -4.99757,
-3.054048, 1, -5.269799,
-2.906588, 2, -4.99757,
-3.054048, 2, -5.269799
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
-3.348969, -2, -5.814257, 0, -0.5, 0.5, 0.5,
-3.348969, -2, -5.814257, 1, -0.5, 0.5, 0.5,
-3.348969, -2, -5.814257, 1, 1.5, 0.5, 0.5,
-3.348969, -2, -5.814257, 0, 1.5, 0.5, 0.5,
-3.348969, -1, -5.814257, 0, -0.5, 0.5, 0.5,
-3.348969, -1, -5.814257, 1, -0.5, 0.5, 0.5,
-3.348969, -1, -5.814257, 1, 1.5, 0.5, 0.5,
-3.348969, -1, -5.814257, 0, 1.5, 0.5, 0.5,
-3.348969, 0, -5.814257, 0, -0.5, 0.5, 0.5,
-3.348969, 0, -5.814257, 1, -0.5, 0.5, 0.5,
-3.348969, 0, -5.814257, 1, 1.5, 0.5, 0.5,
-3.348969, 0, -5.814257, 0, 1.5, 0.5, 0.5,
-3.348969, 1, -5.814257, 0, -0.5, 0.5, 0.5,
-3.348969, 1, -5.814257, 1, -0.5, 0.5, 0.5,
-3.348969, 1, -5.814257, 1, 1.5, 0.5, 0.5,
-3.348969, 1, -5.814257, 0, 1.5, 0.5, 0.5,
-3.348969, 2, -5.814257, 0, -0.5, 0.5, 0.5,
-3.348969, 2, -5.814257, 1, -0.5, 0.5, 0.5,
-3.348969, 2, -5.814257, 1, 1.5, 0.5, 0.5,
-3.348969, 2, -5.814257, 0, 1.5, 0.5, 0.5
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
-2.906588, -2.894733, -4,
-2.906588, -2.894733, 4,
-2.906588, -2.894733, -4,
-3.054048, -3.041154, -4,
-2.906588, -2.894733, -2,
-3.054048, -3.041154, -2,
-2.906588, -2.894733, 0,
-3.054048, -3.041154, 0,
-2.906588, -2.894733, 2,
-3.054048, -3.041154, 2,
-2.906588, -2.894733, 4,
-3.054048, -3.041154, 4
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
-3.348969, -3.333996, -4, 0, -0.5, 0.5, 0.5,
-3.348969, -3.333996, -4, 1, -0.5, 0.5, 0.5,
-3.348969, -3.333996, -4, 1, 1.5, 0.5, 0.5,
-3.348969, -3.333996, -4, 0, 1.5, 0.5, 0.5,
-3.348969, -3.333996, -2, 0, -0.5, 0.5, 0.5,
-3.348969, -3.333996, -2, 1, -0.5, 0.5, 0.5,
-3.348969, -3.333996, -2, 1, 1.5, 0.5, 0.5,
-3.348969, -3.333996, -2, 0, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 0, 0, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 0, 1, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 0, 1, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 0, 0, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 2, 0, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 2, 1, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 2, 1, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 2, 0, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 4, 0, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 4, 1, -0.5, 0.5, 0.5,
-3.348969, -3.333996, 4, 1, 1.5, 0.5, 0.5,
-3.348969, -3.333996, 4, 0, 1.5, 0.5, 0.5
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
-2.906588, -2.894733, -4.99757,
-2.906588, 2.962104, -4.99757,
-2.906588, -2.894733, 5.891589,
-2.906588, 2.962104, 5.891589,
-2.906588, -2.894733, -4.99757,
-2.906588, -2.894733, 5.891589,
-2.906588, 2.962104, -4.99757,
-2.906588, 2.962104, 5.891589,
-2.906588, -2.894733, -4.99757,
2.991822, -2.894733, -4.99757,
-2.906588, -2.894733, 5.891589,
2.991822, -2.894733, 5.891589,
-2.906588, 2.962104, -4.99757,
2.991822, 2.962104, -4.99757,
-2.906588, 2.962104, 5.891589,
2.991822, 2.962104, 5.891589,
2.991822, -2.894733, -4.99757,
2.991822, 2.962104, -4.99757,
2.991822, -2.894733, 5.891589,
2.991822, 2.962104, 5.891589,
2.991822, -2.894733, -4.99757,
2.991822, -2.894733, 5.891589,
2.991822, 2.962104, -4.99757,
2.991822, 2.962104, 5.891589
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
var radius = 7.315097;
var distance = 32.54569;
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
mvMatrix.translate( -0.04261684, -0.03368521, -0.4470096 );
mvMatrix.scale( 1.340908, 1.350426, 0.7263395 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.54569);
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
5-heptyloxolan-2-one<-read.table("5-heptyloxolan-2-one.xyz")
```

```
## Error in read.table("5-heptyloxolan-2-one.xyz"): no lines available in input
```

```r
x<-5-heptyloxolan-2-one$V2
```

```
## Error in eval(expr, envir, enclos): object 'heptyloxolan' not found
```

```r
y<-5-heptyloxolan-2-one$V3
```

```
## Error in eval(expr, envir, enclos): object 'heptyloxolan' not found
```

```r
z<-5-heptyloxolan-2-one$V4
```

```
## Error in eval(expr, envir, enclos): object 'heptyloxolan' not found
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
-2.820689, 1.712259, -1.138691, 0, 0, 1, 1, 1,
-2.708374, -0.7825132, -1.680597, 1, 0, 0, 1, 1,
-2.659289, -1.250049, -2.183616, 1, 0, 0, 1, 1,
-2.569115, 0.08243403, -1.43924, 1, 0, 0, 1, 1,
-2.514398, 0.5379061, -2.263178, 1, 0, 0, 1, 1,
-2.347661, -0.8392246, -2.266619, 1, 0, 0, 1, 1,
-2.312077, -2.288378, -1.32327, 0, 0, 0, 1, 1,
-2.284117, 1.159054, -1.826514, 0, 0, 0, 1, 1,
-2.235288, -0.1494938, -0.2341321, 0, 0, 0, 1, 1,
-2.213165, -0.1675595, -3.091729, 0, 0, 0, 1, 1,
-2.205697, 0.7052515, -1.05025, 0, 0, 0, 1, 1,
-2.160708, -0.305934, -0.9119883, 0, 0, 0, 1, 1,
-2.15523, -0.0074498, -0.9962339, 0, 0, 0, 1, 1,
-2.139951, -2.447402, -2.527224, 1, 1, 1, 1, 1,
-2.118855, 1.456804, -1.617677, 1, 1, 1, 1, 1,
-2.068386, -0.1314763, -1.881034, 1, 1, 1, 1, 1,
-2.066326, 1.3943, 0.2073458, 1, 1, 1, 1, 1,
-2.056989, 0.953444, -0.4322531, 1, 1, 1, 1, 1,
-2.046269, -0.4362439, 0.7436633, 1, 1, 1, 1, 1,
-2.038727, -0.294009, -2.548266, 1, 1, 1, 1, 1,
-2.019768, 0.5299199, -1.254182, 1, 1, 1, 1, 1,
-1.994012, 0.8268431, -0.003630353, 1, 1, 1, 1, 1,
-1.975121, 0.145177, -0.9506307, 1, 1, 1, 1, 1,
-1.973617, 1.661593, -1.108438, 1, 1, 1, 1, 1,
-1.940279, 0.1118339, 0.1991053, 1, 1, 1, 1, 1,
-1.929853, -0.1024168, -0.9159063, 1, 1, 1, 1, 1,
-1.927117, 0.1829486, -0.7676241, 1, 1, 1, 1, 1,
-1.925974, 0.807934, -2.380896, 1, 1, 1, 1, 1,
-1.910109, 0.6976959, -0.2144067, 0, 0, 1, 1, 1,
-1.908186, 1.405101, -0.8516768, 1, 0, 0, 1, 1,
-1.879726, 1.403561, -1.337241, 1, 0, 0, 1, 1,
-1.847836, 0.1614559, -1.100209, 1, 0, 0, 1, 1,
-1.836315, 0.4026438, -3.853139, 1, 0, 0, 1, 1,
-1.823566, -0.1651864, -1.804986, 1, 0, 0, 1, 1,
-1.796358, -0.1533579, -2.341616, 0, 0, 0, 1, 1,
-1.769308, -1.429837, -3.748603, 0, 0, 0, 1, 1,
-1.765223, -0.7171922, -3.242611, 0, 0, 0, 1, 1,
-1.749398, -0.4371853, -0.7826391, 0, 0, 0, 1, 1,
-1.736663, 0.6716098, -2.266649, 0, 0, 0, 1, 1,
-1.723326, 0.680956, -2.687901, 0, 0, 0, 1, 1,
-1.717367, -0.3605691, -0.6560678, 0, 0, 0, 1, 1,
-1.705004, 1.276884, -0.2273785, 1, 1, 1, 1, 1,
-1.698659, -0.8485307, -1.62088, 1, 1, 1, 1, 1,
-1.696182, 0.5931796, -3.629647, 1, 1, 1, 1, 1,
-1.693722, 0.1666601, -1.787503, 1, 1, 1, 1, 1,
-1.676756, -1.383962, -2.085999, 1, 1, 1, 1, 1,
-1.674227, -0.9823239, -2.280503, 1, 1, 1, 1, 1,
-1.664632, 0.6781376, -1.566685, 1, 1, 1, 1, 1,
-1.661847, -0.7973949, -1.270655, 1, 1, 1, 1, 1,
-1.660239, -0.9779204, -1.631606, 1, 1, 1, 1, 1,
-1.641345, 1.117116, 0.0361521, 1, 1, 1, 1, 1,
-1.629719, 0.5805938, -0.2793967, 1, 1, 1, 1, 1,
-1.629406, -0.3342544, -1.869446, 1, 1, 1, 1, 1,
-1.627285, -0.06707796, -2.461961, 1, 1, 1, 1, 1,
-1.620099, 0.2473218, -3.042384, 1, 1, 1, 1, 1,
-1.614855, -0.3845618, -1.71081, 1, 1, 1, 1, 1,
-1.598587, -0.8957689, -4.079273, 0, 0, 1, 1, 1,
-1.592753, -0.2222673, -1.839258, 1, 0, 0, 1, 1,
-1.592711, 0.6313582, 0.6218817, 1, 0, 0, 1, 1,
-1.582616, 0.9948894, -1.529314, 1, 0, 0, 1, 1,
-1.576951, 0.7455001, -0.09856185, 1, 0, 0, 1, 1,
-1.558625, -0.2262259, -0.8964971, 1, 0, 0, 1, 1,
-1.517496, 0.7572994, -3.021201, 0, 0, 0, 1, 1,
-1.513992, 0.3279041, -1.545847, 0, 0, 0, 1, 1,
-1.512764, -2.149936, -3.097613, 0, 0, 0, 1, 1,
-1.511451, 1.601544, -1.431164, 0, 0, 0, 1, 1,
-1.494752, 0.03046792, -0.9693815, 0, 0, 0, 1, 1,
-1.486481, 0.004025678, -2.610307, 0, 0, 0, 1, 1,
-1.472031, 0.5117757, 0.4354261, 0, 0, 0, 1, 1,
-1.464911, 0.05547027, -0.4223763, 1, 1, 1, 1, 1,
-1.464688, 2.551272, 0.04870701, 1, 1, 1, 1, 1,
-1.45919, 0.9515297, -2.763356, 1, 1, 1, 1, 1,
-1.45799, 2.160959, -1.087166, 1, 1, 1, 1, 1,
-1.450063, 1.736366, -0.1690025, 1, 1, 1, 1, 1,
-1.398185, -0.8764665, -1.226045, 1, 1, 1, 1, 1,
-1.392359, 0.9845631, 0.6709765, 1, 1, 1, 1, 1,
-1.391616, 0.9571622, -2.065987, 1, 1, 1, 1, 1,
-1.389886, 0.3458813, -1.053159, 1, 1, 1, 1, 1,
-1.387448, 0.05706705, -1.252436, 1, 1, 1, 1, 1,
-1.37645, 1.047823, 0.1571746, 1, 1, 1, 1, 1,
-1.373703, -1.01398, -2.540424, 1, 1, 1, 1, 1,
-1.370619, 1.437083, -0.6253014, 1, 1, 1, 1, 1,
-1.362148, -1.484332, -2.2333, 1, 1, 1, 1, 1,
-1.360357, 1.335005, -1.324576, 1, 1, 1, 1, 1,
-1.359636, 0.1513148, -2.726726, 0, 0, 1, 1, 1,
-1.356737, 1.803435, -0.2298604, 1, 0, 0, 1, 1,
-1.356117, -0.3865292, -1.924397, 1, 0, 0, 1, 1,
-1.345971, 0.2377789, -1.086801, 1, 0, 0, 1, 1,
-1.339845, 0.167003, -0.5803905, 1, 0, 0, 1, 1,
-1.338304, -1.068505, -2.798073, 1, 0, 0, 1, 1,
-1.333367, -2.178588, -3.368063, 0, 0, 0, 1, 1,
-1.329393, 0.5292781, -0.6456751, 0, 0, 0, 1, 1,
-1.32834, -1.017382, -3.19102, 0, 0, 0, 1, 1,
-1.302816, -0.3916862, -1.401018, 0, 0, 0, 1, 1,
-1.274969, -1.33226, -1.517996, 0, 0, 0, 1, 1,
-1.274773, 0.3749824, -2.073141, 0, 0, 0, 1, 1,
-1.263708, 1.929977, -1.315154, 0, 0, 0, 1, 1,
-1.263011, 0.9263918, -0.7835965, 1, 1, 1, 1, 1,
-1.256896, 0.121995, -3.140228, 1, 1, 1, 1, 1,
-1.253466, -0.7826468, -1.492053, 1, 1, 1, 1, 1,
-1.250038, -1.034176, -2.476747, 1, 1, 1, 1, 1,
-1.248352, 0.09290123, -3.221465, 1, 1, 1, 1, 1,
-1.247598, -1.392169, -2.480484, 1, 1, 1, 1, 1,
-1.246703, 1.787125, -0.04218952, 1, 1, 1, 1, 1,
-1.246427, -1.053583, -1.563967, 1, 1, 1, 1, 1,
-1.240172, -0.08131379, -1.334929, 1, 1, 1, 1, 1,
-1.237953, 0.567489, -0.6311804, 1, 1, 1, 1, 1,
-1.235958, -0.05900506, -1.334058, 1, 1, 1, 1, 1,
-1.235056, -0.2241983, -3.516066, 1, 1, 1, 1, 1,
-1.234733, -2.079298, -2.153397, 1, 1, 1, 1, 1,
-1.224617, 0.9926018, -0.275592, 1, 1, 1, 1, 1,
-1.222259, -0.4113419, -1.624156, 1, 1, 1, 1, 1,
-1.219383, -0.7983745, -2.76877, 0, 0, 1, 1, 1,
-1.216694, -1.008855, -3.547497, 1, 0, 0, 1, 1,
-1.209323, 1.107275, -0.9387824, 1, 0, 0, 1, 1,
-1.20897, 0.7426382, -1.07544, 1, 0, 0, 1, 1,
-1.205775, -0.4849975, -1.686218, 1, 0, 0, 1, 1,
-1.19625, 0.4042813, -0.2161715, 1, 0, 0, 1, 1,
-1.191328, 1.859952, 0.239772, 0, 0, 0, 1, 1,
-1.184672, -0.4334813, -1.213506, 0, 0, 0, 1, 1,
-1.178413, 1.441482, -2.701966, 0, 0, 0, 1, 1,
-1.172534, -0.2224328, -2.569047, 0, 0, 0, 1, 1,
-1.171364, 1.562353, -1.031963, 0, 0, 0, 1, 1,
-1.168091, -2.050051, -2.45382, 0, 0, 0, 1, 1,
-1.15493, 2.229569, -1.843783, 0, 0, 0, 1, 1,
-1.152846, -0.3416717, -2.206074, 1, 1, 1, 1, 1,
-1.151081, -0.2684225, -3.466594, 1, 1, 1, 1, 1,
-1.14623, 0.3031895, -0.9380784, 1, 1, 1, 1, 1,
-1.145821, 0.2387958, -1.023225, 1, 1, 1, 1, 1,
-1.143524, -0.1734274, -2.331762, 1, 1, 1, 1, 1,
-1.139628, -0.4518081, -1.885533, 1, 1, 1, 1, 1,
-1.13888, 0.6150175, -1.844856, 1, 1, 1, 1, 1,
-1.137211, 0.2020325, -2.425754, 1, 1, 1, 1, 1,
-1.13621, 0.1775402, -1.03104, 1, 1, 1, 1, 1,
-1.134904, -2.025346, -2.011465, 1, 1, 1, 1, 1,
-1.127861, 0.1449402, -0.6148775, 1, 1, 1, 1, 1,
-1.127659, -0.248149, -2.066521, 1, 1, 1, 1, 1,
-1.119089, 1.204046, -0.578641, 1, 1, 1, 1, 1,
-1.113104, 1.263303, -0.7723631, 1, 1, 1, 1, 1,
-1.1018, -0.1125088, -1.803544, 1, 1, 1, 1, 1,
-1.097586, -0.552255, -2.730916, 0, 0, 1, 1, 1,
-1.083531, 1.100602, 1.052281, 1, 0, 0, 1, 1,
-1.081669, 0.1124707, -1.129757, 1, 0, 0, 1, 1,
-1.081612, -0.09115719, 0.1326574, 1, 0, 0, 1, 1,
-1.080924, 0.1939345, -1.029583, 1, 0, 0, 1, 1,
-1.076887, -1.241232, -3.179316, 1, 0, 0, 1, 1,
-1.073154, -0.6294882, -0.7321288, 0, 0, 0, 1, 1,
-1.064964, -0.005568202, -1.538176, 0, 0, 0, 1, 1,
-1.059427, 0.9726999, -1.553989, 0, 0, 0, 1, 1,
-1.058521, 0.2880922, 0.1398368, 0, 0, 0, 1, 1,
-1.058303, 2.157598, 0.1869401, 0, 0, 0, 1, 1,
-1.057365, -0.8131088, -3.953355, 0, 0, 0, 1, 1,
-1.053737, 2.110833, 0.9212493, 0, 0, 0, 1, 1,
-1.052875, 0.1717762, -0.9461998, 1, 1, 1, 1, 1,
-1.051224, -0.7664205, -3.054581, 1, 1, 1, 1, 1,
-1.045869, 1.696538, -1.654454, 1, 1, 1, 1, 1,
-1.042154, 0.3232417, -0.6779408, 1, 1, 1, 1, 1,
-1.039087, 1.913893, 0.4670217, 1, 1, 1, 1, 1,
-1.037378, -0.8764058, -1.3651, 1, 1, 1, 1, 1,
-1.037209, -0.352733, -2.585303, 1, 1, 1, 1, 1,
-1.030478, -0.4416826, -0.7875351, 1, 1, 1, 1, 1,
-1.029364, -0.2286095, -0.9473575, 1, 1, 1, 1, 1,
-1.027235, -2.177011, -3.473995, 1, 1, 1, 1, 1,
-1.025508, 1.541867, -1.968885, 1, 1, 1, 1, 1,
-1.019589, 1.045524, -2.021034, 1, 1, 1, 1, 1,
-1.01143, 1.526603, -0.8071616, 1, 1, 1, 1, 1,
-1.006695, -1.207667, -2.738201, 1, 1, 1, 1, 1,
-1.001628, 0.08385989, -2.408377, 1, 1, 1, 1, 1,
-0.9957422, 0.3549365, -0.8035278, 0, 0, 1, 1, 1,
-0.9957163, -1.236874, -1.887691, 1, 0, 0, 1, 1,
-0.993046, 1.199147, -1.848552, 1, 0, 0, 1, 1,
-0.9891718, 0.9932495, -0.5545931, 1, 0, 0, 1, 1,
-0.9870653, 0.009422598, -1.96106, 1, 0, 0, 1, 1,
-0.9832104, 0.08251021, -1.816718, 1, 0, 0, 1, 1,
-0.9788628, -1.377263, -2.682633, 0, 0, 0, 1, 1,
-0.972338, -1.095317, -2.82636, 0, 0, 0, 1, 1,
-0.9719548, 1.097279, 0.7600494, 0, 0, 0, 1, 1,
-0.9650002, -1.270886, -3.600139, 0, 0, 0, 1, 1,
-0.9604743, 0.2938857, -0.02739786, 0, 0, 0, 1, 1,
-0.9544092, 0.07356986, -1.120882, 0, 0, 0, 1, 1,
-0.9440663, 0.3867937, -0.2715232, 0, 0, 0, 1, 1,
-0.9437031, -0.9212624, -2.357072, 1, 1, 1, 1, 1,
-0.9361758, 1.542674, 0.3463239, 1, 1, 1, 1, 1,
-0.9247242, -0.7579571, -2.252225, 1, 1, 1, 1, 1,
-0.9230137, -0.5684721, -0.8665489, 1, 1, 1, 1, 1,
-0.9221261, -0.7168878, -3.723827, 1, 1, 1, 1, 1,
-0.9207112, 1.271041, -1.168091, 1, 1, 1, 1, 1,
-0.9203711, -0.3698072, -1.406572, 1, 1, 1, 1, 1,
-0.9190395, 1.727056, -1.389716, 1, 1, 1, 1, 1,
-0.9016136, 0.3310348, -0.2582727, 1, 1, 1, 1, 1,
-0.9015163, -0.09591793, -2.79756, 1, 1, 1, 1, 1,
-0.8928082, 0.2067364, -2.027827, 1, 1, 1, 1, 1,
-0.8865176, -0.5020645, -2.225518, 1, 1, 1, 1, 1,
-0.8835674, 0.730002, -0.7276697, 1, 1, 1, 1, 1,
-0.8819941, -2.114501, -3.826766, 1, 1, 1, 1, 1,
-0.8803369, -0.509621, -1.98803, 1, 1, 1, 1, 1,
-0.8765894, -0.4824702, -0.7649517, 0, 0, 1, 1, 1,
-0.8760055, 0.2690215, -0.2900879, 1, 0, 0, 1, 1,
-0.8672026, -0.4712537, -1.880926, 1, 0, 0, 1, 1,
-0.865971, -0.8744205, -2.347863, 1, 0, 0, 1, 1,
-0.8646804, 1.452942, -1.84669, 1, 0, 0, 1, 1,
-0.8646527, -1.138855, -3.612974, 1, 0, 0, 1, 1,
-0.8573488, -0.3251076, -3.415621, 0, 0, 0, 1, 1,
-0.8537245, 1.042125, 1.071045, 0, 0, 0, 1, 1,
-0.8502735, 0.4431393, -0.3684807, 0, 0, 0, 1, 1,
-0.8490873, -0.1813353, -2.869876, 0, 0, 0, 1, 1,
-0.8477038, 0.6822901, -0.1768547, 0, 0, 0, 1, 1,
-0.8468655, -2.220634, -4.508833, 0, 0, 0, 1, 1,
-0.8444967, -0.6832623, -1.740021, 0, 0, 0, 1, 1,
-0.8441625, -1.307898, -2.823572, 1, 1, 1, 1, 1,
-0.8325925, 0.6493443, -1.196793, 1, 1, 1, 1, 1,
-0.8259946, -2.52949, -0.8012267, 1, 1, 1, 1, 1,
-0.8252319, 0.387356, -1.561465, 1, 1, 1, 1, 1,
-0.8199733, 0.06941868, -1.593852, 1, 1, 1, 1, 1,
-0.8167751, 1.169334, -1.339238, 1, 1, 1, 1, 1,
-0.8139223, 0.6686592, -0.9871361, 1, 1, 1, 1, 1,
-0.8111088, -0.824786, -2.302419, 1, 1, 1, 1, 1,
-0.8082079, -0.7791219, -1.731039, 1, 1, 1, 1, 1,
-0.8075713, 1.120959, -0.4860316, 1, 1, 1, 1, 1,
-0.7982372, 0.3786267, -0.9345545, 1, 1, 1, 1, 1,
-0.79524, 0.9650919, -0.973832, 1, 1, 1, 1, 1,
-0.7930213, 2.87681, -0.9227819, 1, 1, 1, 1, 1,
-0.792197, -1.896986, -1.373376, 1, 1, 1, 1, 1,
-0.7894322, -0.3745244, -2.325547, 1, 1, 1, 1, 1,
-0.7877207, 1.847659, 0.01128031, 0, 0, 1, 1, 1,
-0.7751122, -2.657063, -2.265975, 1, 0, 0, 1, 1,
-0.7701496, -0.3857342, -2.824951, 1, 0, 0, 1, 1,
-0.7679666, 0.7165496, -0.1250397, 1, 0, 0, 1, 1,
-0.7639583, -0.01148139, -1.937358, 1, 0, 0, 1, 1,
-0.7624857, 1.123307, -1.13381, 1, 0, 0, 1, 1,
-0.7601588, -0.2975651, -2.369231, 0, 0, 0, 1, 1,
-0.7589196, -0.06727099, -1.286518, 0, 0, 0, 1, 1,
-0.7569017, -0.2934146, -2.997756, 0, 0, 0, 1, 1,
-0.7548177, -1.252214, -3.41187, 0, 0, 0, 1, 1,
-0.7547286, -0.3409357, -2.511097, 0, 0, 0, 1, 1,
-0.7546905, -1.815163, -2.109468, 0, 0, 0, 1, 1,
-0.7541, -0.5040356, -2.523899, 0, 0, 0, 1, 1,
-0.7523388, 1.434237, -1.905814, 1, 1, 1, 1, 1,
-0.7463652, 1.391573, -1.23068, 1, 1, 1, 1, 1,
-0.7450138, -0.5640258, -2.860663, 1, 1, 1, 1, 1,
-0.7369851, -0.887462, -3.559199, 1, 1, 1, 1, 1,
-0.7365621, -0.8631024, -4.419514, 1, 1, 1, 1, 1,
-0.7332737, 2.26541, -0.3685439, 1, 1, 1, 1, 1,
-0.7331483, 0.1874859, 0.1981269, 1, 1, 1, 1, 1,
-0.7315885, 0.4771237, -0.5825765, 1, 1, 1, 1, 1,
-0.7311046, -0.8063051, -1.093247, 1, 1, 1, 1, 1,
-0.7187092, 1.824785, -2.123141, 1, 1, 1, 1, 1,
-0.7184721, 0.8642476, -2.126974, 1, 1, 1, 1, 1,
-0.7172359, -1.03591, -1.370413, 1, 1, 1, 1, 1,
-0.7171231, 0.9410328, -2.024786, 1, 1, 1, 1, 1,
-0.7112339, -0.3601755, -3.375612, 1, 1, 1, 1, 1,
-0.704851, 0.1433628, -0.8606178, 1, 1, 1, 1, 1,
-0.7027914, -0.09526164, -0.3773756, 0, 0, 1, 1, 1,
-0.6926433, -0.2146816, -2.236239, 1, 0, 0, 1, 1,
-0.6903192, -1.183607, -1.437113, 1, 0, 0, 1, 1,
-0.6874245, 0.7541624, 0.5912652, 1, 0, 0, 1, 1,
-0.6846218, 0.8382865, -1.614798, 1, 0, 0, 1, 1,
-0.680389, 1.363556, -0.7642977, 1, 0, 0, 1, 1,
-0.676227, 0.3344404, -1.763707, 0, 0, 0, 1, 1,
-0.6733329, -1.675963, -2.996521, 0, 0, 0, 1, 1,
-0.672298, 0.4648529, -1.514866, 0, 0, 0, 1, 1,
-0.6708415, -1.425414, -3.589626, 0, 0, 0, 1, 1,
-0.6684884, 0.3206031, -2.607364, 0, 0, 0, 1, 1,
-0.6676496, -0.8101695, -3.402747, 0, 0, 0, 1, 1,
-0.666366, -1.457431, -4.14114, 0, 0, 0, 1, 1,
-0.6647485, -1.557595, -3.608539, 1, 1, 1, 1, 1,
-0.6611573, -1.268861, -2.884167, 1, 1, 1, 1, 1,
-0.6586, 0.9235591, -0.8297982, 1, 1, 1, 1, 1,
-0.655713, 0.1230145, -0.8197948, 1, 1, 1, 1, 1,
-0.6546763, -0.4987492, -2.929528, 1, 1, 1, 1, 1,
-0.6526907, -1.817915, -2.810654, 1, 1, 1, 1, 1,
-0.6496056, -0.1790192, -1.939385, 1, 1, 1, 1, 1,
-0.6443098, 0.1561988, 0.3200787, 1, 1, 1, 1, 1,
-0.6421991, 0.03632446, -1.384463, 1, 1, 1, 1, 1,
-0.639693, -0.06807087, -2.692025, 1, 1, 1, 1, 1,
-0.6307065, 1.99438, -0.3771229, 1, 1, 1, 1, 1,
-0.6265053, -0.1772731, -3.766943, 1, 1, 1, 1, 1,
-0.6199138, 0.1992701, -2.058868, 1, 1, 1, 1, 1,
-0.6158617, -1.370283, -2.825712, 1, 1, 1, 1, 1,
-0.609452, 1.691998, -1.17428, 1, 1, 1, 1, 1,
-0.6074504, 0.5912768, -2.547006, 0, 0, 1, 1, 1,
-0.6034377, 0.9648711, -0.3894416, 1, 0, 0, 1, 1,
-0.603168, 0.7858654, -0.4967826, 1, 0, 0, 1, 1,
-0.5981513, -1.019542, -4.498164, 1, 0, 0, 1, 1,
-0.5935317, 0.7795764, 1.027381, 1, 0, 0, 1, 1,
-0.5928933, -0.6555963, -1.840916, 1, 0, 0, 1, 1,
-0.5898757, 0.5251817, -1.092981, 0, 0, 0, 1, 1,
-0.5885846, -0.4983614, -2.213438, 0, 0, 0, 1, 1,
-0.5831527, 1.599585, -1.714385, 0, 0, 0, 1, 1,
-0.5750417, -1.363975, -3.141042, 0, 0, 0, 1, 1,
-0.5588039, 1.470165, 0.3774733, 0, 0, 0, 1, 1,
-0.5549867, -1.811742, -3.243107, 0, 0, 0, 1, 1,
-0.5547521, -1.306453, -3.328079, 0, 0, 0, 1, 1,
-0.5542716, 2.2587, 0.3324873, 1, 1, 1, 1, 1,
-0.547366, 0.9277216, -2.031608, 1, 1, 1, 1, 1,
-0.5420078, 1.212795, 0.3732488, 1, 1, 1, 1, 1,
-0.5399587, 0.3608061, 0.2088241, 1, 1, 1, 1, 1,
-0.5376328, 0.5661294, 0.1147836, 1, 1, 1, 1, 1,
-0.5281565, -0.0632731, -1.617881, 1, 1, 1, 1, 1,
-0.5271999, 0.6674035, -0.4863329, 1, 1, 1, 1, 1,
-0.5211915, 0.3278523, 0.05205533, 1, 1, 1, 1, 1,
-0.5185161, -0.002819169, -1.557779, 1, 1, 1, 1, 1,
-0.517552, 1.211411, 1.162936, 1, 1, 1, 1, 1,
-0.5150892, -0.01618026, -2.434741, 1, 1, 1, 1, 1,
-0.5132188, -0.7031438, -1.275184, 1, 1, 1, 1, 1,
-0.5110349, -1.417169, -2.981472, 1, 1, 1, 1, 1,
-0.5050642, -0.7587855, -2.706032, 1, 1, 1, 1, 1,
-0.5019878, -0.1832362, -4.157558, 1, 1, 1, 1, 1,
-0.5002477, -1.864081, -4.6648, 0, 0, 1, 1, 1,
-0.4990254, -1.578971, -3.504179, 1, 0, 0, 1, 1,
-0.4974649, 0.6026998, -0.826924, 1, 0, 0, 1, 1,
-0.4965428, -0.1788827, -2.859966, 1, 0, 0, 1, 1,
-0.4923604, -0.7693652, -2.810986, 1, 0, 0, 1, 1,
-0.4898547, 0.1983051, -1.289367, 1, 0, 0, 1, 1,
-0.4878053, 1.054386, 0.6228765, 0, 0, 0, 1, 1,
-0.4807213, -0.1240106, -1.872697, 0, 0, 0, 1, 1,
-0.4801387, 0.1002915, 0.2533862, 0, 0, 0, 1, 1,
-0.47951, -0.4312958, -3.434869, 0, 0, 0, 1, 1,
-0.4767862, 2.202508, -0.1273499, 0, 0, 0, 1, 1,
-0.476325, 0.03342777, -1.005208, 0, 0, 0, 1, 1,
-0.4722333, -0.1977698, -3.676429, 0, 0, 0, 1, 1,
-0.4714988, 0.8166689, -0.1059676, 1, 1, 1, 1, 1,
-0.471176, -0.5594457, -0.7400534, 1, 1, 1, 1, 1,
-0.468729, 1.720546, 1.086595, 1, 1, 1, 1, 1,
-0.4686921, 0.2138824, -1.186874, 1, 1, 1, 1, 1,
-0.4604527, 0.3478589, -1.679444, 1, 1, 1, 1, 1,
-0.454734, 0.288709, -0.4641209, 1, 1, 1, 1, 1,
-0.4515813, -1.609912, -3.488555, 1, 1, 1, 1, 1,
-0.4512234, -0.7989909, -4.808197, 1, 1, 1, 1, 1,
-0.4510553, 0.2043678, -2.116998, 1, 1, 1, 1, 1,
-0.4481929, -1.553832, -4.072603, 1, 1, 1, 1, 1,
-0.4462153, 0.6365507, 0.2158738, 1, 1, 1, 1, 1,
-0.4434998, -0.8001928, -3.687294, 1, 1, 1, 1, 1,
-0.4434696, -0.4786077, -3.216811, 1, 1, 1, 1, 1,
-0.4429165, 0.6591912, 0.9277999, 1, 1, 1, 1, 1,
-0.4416129, 0.7915269, 0.157099, 1, 1, 1, 1, 1,
-0.4357265, 0.513982, -1.241627, 0, 0, 1, 1, 1,
-0.4327359, 1.695078, 0.5773335, 1, 0, 0, 1, 1,
-0.4313231, -0.369139, -3.028116, 1, 0, 0, 1, 1,
-0.4281856, -0.2044838, -3.370083, 1, 0, 0, 1, 1,
-0.4268949, -0.2812167, -1.722769, 1, 0, 0, 1, 1,
-0.4253584, 0.3786663, -1.550232, 1, 0, 0, 1, 1,
-0.4232555, 0.7347994, 0.2046711, 0, 0, 0, 1, 1,
-0.4219989, 0.716464, -0.4258622, 0, 0, 0, 1, 1,
-0.4158168, 1.04078, -0.8997166, 0, 0, 0, 1, 1,
-0.4148845, 0.8417072, -0.9987911, 0, 0, 0, 1, 1,
-0.4141293, 0.4179872, -1.442941, 0, 0, 0, 1, 1,
-0.4129637, 0.8016326, -2.096642, 0, 0, 0, 1, 1,
-0.411459, 0.6633754, -1.024744, 0, 0, 0, 1, 1,
-0.4093482, 0.0495405, -1.28299, 1, 1, 1, 1, 1,
-0.4069968, -1.277276, -2.814624, 1, 1, 1, 1, 1,
-0.4035492, 0.2963888, 0.5640556, 1, 1, 1, 1, 1,
-0.3999684, 0.07098856, -1.570504, 1, 1, 1, 1, 1,
-0.3991722, 0.4334904, -0.4862067, 1, 1, 1, 1, 1,
-0.395465, -0.616803, -4.600989, 1, 1, 1, 1, 1,
-0.3928605, 0.8151125, -1.782928, 1, 1, 1, 1, 1,
-0.3911118, -0.9102795, -2.759007, 1, 1, 1, 1, 1,
-0.3908716, -1.120495, -3.976357, 1, 1, 1, 1, 1,
-0.3868619, 1.946141, -1.32179, 1, 1, 1, 1, 1,
-0.3867624, -0.02294346, 0.348117, 1, 1, 1, 1, 1,
-0.3824632, -0.9563803, -2.730099, 1, 1, 1, 1, 1,
-0.3802214, -0.5698897, -2.175322, 1, 1, 1, 1, 1,
-0.3796218, -0.0011942, -2.053329, 1, 1, 1, 1, 1,
-0.3775368, -1.383763, -2.78351, 1, 1, 1, 1, 1,
-0.3755471, -0.25281, -2.405946, 0, 0, 1, 1, 1,
-0.3742542, 2.50571, -0.6130534, 1, 0, 0, 1, 1,
-0.3720593, 0.6700126, -0.08104812, 1, 0, 0, 1, 1,
-0.3709521, -0.5092114, -2.735785, 1, 0, 0, 1, 1,
-0.3684886, 0.3301985, 1.494809, 1, 0, 0, 1, 1,
-0.3554553, -0.2144268, -1.638349, 1, 0, 0, 1, 1,
-0.3552806, -0.6595654, -3.207263, 0, 0, 0, 1, 1,
-0.3539487, -0.1574323, -1.901504, 0, 0, 0, 1, 1,
-0.3526704, -1.203765, -2.971228, 0, 0, 0, 1, 1,
-0.3466177, 0.7735835, -1.143013, 0, 0, 0, 1, 1,
-0.3451466, 0.7765401, -2.027045, 0, 0, 0, 1, 1,
-0.3388541, 1.278889, -1.325007, 0, 0, 0, 1, 1,
-0.3301788, -0.7699053, -1.980545, 0, 0, 0, 1, 1,
-0.3280469, -0.727636, -1.491381, 1, 1, 1, 1, 1,
-0.3277696, -0.4301254, -3.048997, 1, 1, 1, 1, 1,
-0.3260261, 0.7595918, 0.1671536, 1, 1, 1, 1, 1,
-0.3251284, 0.3286498, -0.1354814, 1, 1, 1, 1, 1,
-0.3248557, 1.05041, 0.6323627, 1, 1, 1, 1, 1,
-0.3178675, 0.6993233, -1.72768, 1, 1, 1, 1, 1,
-0.3143229, 0.8829428, -0.9116778, 1, 1, 1, 1, 1,
-0.3135501, -0.08458718, -1.657058, 1, 1, 1, 1, 1,
-0.3090222, 0.009668765, -2.516458, 1, 1, 1, 1, 1,
-0.3049024, -0.7833835, -2.590676, 1, 1, 1, 1, 1,
-0.2985023, -0.264638, -1.451209, 1, 1, 1, 1, 1,
-0.2932275, 0.5624475, -0.898985, 1, 1, 1, 1, 1,
-0.284651, -0.4089334, -1.845708, 1, 1, 1, 1, 1,
-0.2836415, 1.031031, -0.0720888, 1, 1, 1, 1, 1,
-0.2835196, 0.8461238, -0.4463309, 1, 1, 1, 1, 1,
-0.2808948, 0.3195992, -0.9064483, 0, 0, 1, 1, 1,
-0.2787529, 0.5567855, -0.7120807, 1, 0, 0, 1, 1,
-0.277014, 0.3521039, -1.439921, 1, 0, 0, 1, 1,
-0.2681692, 0.001149468, -1.777124, 1, 0, 0, 1, 1,
-0.2644579, -1.695347, -3.518934, 1, 0, 0, 1, 1,
-0.2614544, -2.170688, -3.826878, 1, 0, 0, 1, 1,
-0.2592072, -1.462376, -2.468393, 0, 0, 0, 1, 1,
-0.2547392, -1.162726, -2.754049, 0, 0, 0, 1, 1,
-0.254532, 0.1052646, -2.756419, 0, 0, 0, 1, 1,
-0.2526011, -0.6734511, -3.314373, 0, 0, 0, 1, 1,
-0.2509729, 0.6497228, -1.280751, 0, 0, 0, 1, 1,
-0.2458833, -0.7078456, -2.727361, 0, 0, 0, 1, 1,
-0.2419972, -0.6135032, -4.04501, 0, 0, 0, 1, 1,
-0.2407891, 0.3667364, 0.5802813, 1, 1, 1, 1, 1,
-0.2371183, 0.4626314, -0.3073609, 1, 1, 1, 1, 1,
-0.2343711, -0.2002066, -3.472081, 1, 1, 1, 1, 1,
-0.2329279, 0.07855128, -1.001347, 1, 1, 1, 1, 1,
-0.2321097, -0.2374716, -2.237252, 1, 1, 1, 1, 1,
-0.2311876, 1.502415, 1.302889, 1, 1, 1, 1, 1,
-0.2301257, -0.0779194, -2.778972, 1, 1, 1, 1, 1,
-0.2247539, 1.471631, -0.9715685, 1, 1, 1, 1, 1,
-0.2192871, -0.6053622, -0.9955581, 1, 1, 1, 1, 1,
-0.2139314, -0.2063932, -2.337484, 1, 1, 1, 1, 1,
-0.2130409, -0.2090778, -2.697944, 1, 1, 1, 1, 1,
-0.2099791, 0.1321424, 0.3057292, 1, 1, 1, 1, 1,
-0.2095788, -0.08225102, -2.982274, 1, 1, 1, 1, 1,
-0.2086702, -0.2371419, -0.1018343, 1, 1, 1, 1, 1,
-0.2036541, -0.7406945, -2.333444, 1, 1, 1, 1, 1,
-0.2035223, -0.510482, -3.244046, 0, 0, 1, 1, 1,
-0.1997678, 0.06534749, -2.561895, 1, 0, 0, 1, 1,
-0.1990786, 0.03325069, -0.5084288, 1, 0, 0, 1, 1,
-0.1850434, 1.03423, 1.081938, 1, 0, 0, 1, 1,
-0.1839517, -0.8398028, -4.205337, 1, 0, 0, 1, 1,
-0.1809069, 1.601939, 1.024875, 1, 0, 0, 1, 1,
-0.1792679, -0.8977188, -1.841974, 0, 0, 0, 1, 1,
-0.1733469, 0.2439554, -2.373291, 0, 0, 0, 1, 1,
-0.1721589, -0.5184096, -1.899442, 0, 0, 0, 1, 1,
-0.1678344, 0.3172638, 0.2612391, 0, 0, 0, 1, 1,
-0.1674394, 0.03036232, -1.543919, 0, 0, 0, 1, 1,
-0.1657113, 1.358836, 0.138368, 0, 0, 0, 1, 1,
-0.1617115, -0.3923362, -3.440972, 0, 0, 0, 1, 1,
-0.161152, 0.01159994, -1.251225, 1, 1, 1, 1, 1,
-0.1489047, 1.156819, 0.5691717, 1, 1, 1, 1, 1,
-0.141781, 1.703145, -0.1082187, 1, 1, 1, 1, 1,
-0.1387957, 0.2886164, -0.8929137, 1, 1, 1, 1, 1,
-0.1385642, -2.120043, -1.607293, 1, 1, 1, 1, 1,
-0.1323906, -1.413846, -3.73769, 1, 1, 1, 1, 1,
-0.1304821, -0.7579525, -2.364622, 1, 1, 1, 1, 1,
-0.1303308, -1.299051, -2.951051, 1, 1, 1, 1, 1,
-0.1286555, -0.7813519, -1.34054, 1, 1, 1, 1, 1,
-0.1281718, -0.8816025, -3.729537, 1, 1, 1, 1, 1,
-0.1271227, 0.6666054, -1.122184, 1, 1, 1, 1, 1,
-0.1172312, -1.156102, -3.352809, 1, 1, 1, 1, 1,
-0.1154519, 0.5226672, -0.6464151, 1, 1, 1, 1, 1,
-0.11142, 0.7589935, -0.6076461, 1, 1, 1, 1, 1,
-0.1094358, 0.1435874, -3.312506, 1, 1, 1, 1, 1,
-0.1081691, 0.4537211, -0.05641894, 0, 0, 1, 1, 1,
-0.108107, 0.02784069, -1.808217, 1, 0, 0, 1, 1,
-0.1069612, 0.3055273, 0.07645559, 1, 0, 0, 1, 1,
-0.1054838, 0.2979205, -1.131921, 1, 0, 0, 1, 1,
-0.1040125, 0.2562276, 0.3173923, 1, 0, 0, 1, 1,
-0.1027341, 0.4372568, 0.5906887, 1, 0, 0, 1, 1,
-0.102251, -2.443343, -4.83899, 0, 0, 0, 1, 1,
-0.09952467, 1.251477, -1.607183, 0, 0, 0, 1, 1,
-0.09747186, 0.01742605, -1.508922, 0, 0, 0, 1, 1,
-0.09644204, 0.9993764, 0.07071975, 0, 0, 0, 1, 1,
-0.09595077, 0.3272202, -1.342684, 0, 0, 0, 1, 1,
-0.09336631, 0.2669328, -1.151755, 0, 0, 0, 1, 1,
-0.08704402, -2.178679, -3.018224, 0, 0, 0, 1, 1,
-0.08441094, -0.4489902, -2.525948, 1, 1, 1, 1, 1,
-0.08336892, 1.686077, 0.3803804, 1, 1, 1, 1, 1,
-0.07205052, -0.5021865, -2.306916, 1, 1, 1, 1, 1,
-0.06710897, 0.3587749, -0.4383186, 1, 1, 1, 1, 1,
-0.06647197, 0.6435566, -1.10681, 1, 1, 1, 1, 1,
-0.06548321, -2.809439, -2.192974, 1, 1, 1, 1, 1,
-0.06143542, 2.589587, -1.002697, 1, 1, 1, 1, 1,
-0.05992418, -0.3525897, -2.727795, 1, 1, 1, 1, 1,
-0.0564604, -0.8309752, -3.411941, 1, 1, 1, 1, 1,
-0.05135366, -1.044627, -2.772951, 1, 1, 1, 1, 1,
-0.0499074, -0.7402484, -2.778859, 1, 1, 1, 1, 1,
-0.04891071, 0.3044725, 0.4930134, 1, 1, 1, 1, 1,
-0.04712532, 0.1364206, -0.006949756, 1, 1, 1, 1, 1,
-0.03844619, 1.462074, 0.4842769, 1, 1, 1, 1, 1,
-0.03060105, 0.8031909, -0.3358078, 1, 1, 1, 1, 1,
-0.02928693, 0.00345151, -0.8016551, 0, 0, 1, 1, 1,
-0.02846812, -1.077583, -3.535703, 1, 0, 0, 1, 1,
-0.02660405, 0.5750127, 0.9299563, 1, 0, 0, 1, 1,
-0.02334184, 1.56779, 1.242515, 1, 0, 0, 1, 1,
-0.02083011, 0.8547968, 0.5769913, 1, 0, 0, 1, 1,
-0.02025644, -0.1386569, -2.074807, 1, 0, 0, 1, 1,
-0.01419198, 1.595217, 0.7447774, 0, 0, 0, 1, 1,
-0.009792498, 0.4730788, 2.613158, 0, 0, 0, 1, 1,
-0.006399583, -1.417347, -3.56473, 0, 0, 0, 1, 1,
0.001052936, -0.1283625, 1.14496, 0, 0, 0, 1, 1,
0.002262113, 0.85188, 1.193941, 0, 0, 0, 1, 1,
0.007375773, 0.703918, -0.147805, 0, 0, 0, 1, 1,
0.01036605, 0.280084, -1.082148, 0, 0, 0, 1, 1,
0.01074219, 1.412031, 0.4822945, 1, 1, 1, 1, 1,
0.0124669, -0.06092887, 2.442133, 1, 1, 1, 1, 1,
0.01293398, 0.326522, -0.7219865, 1, 1, 1, 1, 1,
0.01701976, 0.169762, -0.7568661, 1, 1, 1, 1, 1,
0.0172616, -1.853835, 3.306797, 1, 1, 1, 1, 1,
0.02812678, 0.5815994, -0.298647, 1, 1, 1, 1, 1,
0.02829264, -0.3360495, 3.896344, 1, 1, 1, 1, 1,
0.03586856, 0.291983, 0.8822805, 1, 1, 1, 1, 1,
0.03899615, 1.164538, -0.000707695, 1, 1, 1, 1, 1,
0.04344334, -1.207674, 3.083609, 1, 1, 1, 1, 1,
0.04887869, 0.6443678, -0.6891082, 1, 1, 1, 1, 1,
0.0512424, -0.3063372, 2.047547, 1, 1, 1, 1, 1,
0.05742241, -0.1462226, 3.03339, 1, 1, 1, 1, 1,
0.05822823, 0.9276707, 1.106521, 1, 1, 1, 1, 1,
0.05848279, -1.455589, 2.122958, 1, 1, 1, 1, 1,
0.06032663, 1.888206, 2.215013, 0, 0, 1, 1, 1,
0.06268177, 0.5294057, -0.3007866, 1, 0, 0, 1, 1,
0.06326474, 1.762093, 1.778692, 1, 0, 0, 1, 1,
0.07315077, -0.06300405, 2.086538, 1, 0, 0, 1, 1,
0.08062054, -0.2145679, 1.422259, 1, 0, 0, 1, 1,
0.08281971, 2.765163, 0.4765864, 1, 0, 0, 1, 1,
0.08529492, 0.0677962, 1.349925, 0, 0, 0, 1, 1,
0.08863294, 0.3468721, 0.3470449, 0, 0, 0, 1, 1,
0.08895438, -0.5084099, 3.726228, 0, 0, 0, 1, 1,
0.09074403, 1.011982, -0.3216471, 0, 0, 0, 1, 1,
0.09399801, 1.077495, 1.448024, 0, 0, 0, 1, 1,
0.09445199, -0.5761555, 2.880786, 0, 0, 0, 1, 1,
0.09651873, -0.2007669, 2.796191, 0, 0, 0, 1, 1,
0.09741804, -0.02351921, 0.6592854, 1, 1, 1, 1, 1,
0.09780144, 0.9787863, 0.1239821, 1, 1, 1, 1, 1,
0.09928314, -0.38003, 5.733009, 1, 1, 1, 1, 1,
0.1044102, 0.4231083, -0.5465529, 1, 1, 1, 1, 1,
0.1063372, -1.459266, 1.285754, 1, 1, 1, 1, 1,
0.1095444, -0.841677, 3.891526, 1, 1, 1, 1, 1,
0.1106505, 0.5378149, -0.6569209, 1, 1, 1, 1, 1,
0.1142029, -0.2501823, 1.922924, 1, 1, 1, 1, 1,
0.1171768, 0.3994974, 0.5565667, 1, 1, 1, 1, 1,
0.1254023, 0.8513234, 0.5604403, 1, 1, 1, 1, 1,
0.1265747, 0.06567948, 0.9422885, 1, 1, 1, 1, 1,
0.1270496, 1.172823, 2.077706, 1, 1, 1, 1, 1,
0.1336471, -0.604822, 0.6304587, 1, 1, 1, 1, 1,
0.1348937, 0.1425442, 1.125066, 1, 1, 1, 1, 1,
0.1357007, 0.9168163, -0.09142757, 1, 1, 1, 1, 1,
0.1372684, 1.467549, 0.7491418, 0, 0, 1, 1, 1,
0.1454716, -1.170372, 2.750823, 1, 0, 0, 1, 1,
0.1462756, 0.3761196, -0.2231575, 1, 0, 0, 1, 1,
0.1487571, -0.78738, 3.287781, 1, 0, 0, 1, 1,
0.1523936, -0.8194008, 2.729672, 1, 0, 0, 1, 1,
0.1555445, -0.2926606, 0.7252889, 1, 0, 0, 1, 1,
0.1557251, 0.6510476, -0.6135, 0, 0, 0, 1, 1,
0.1594915, -1.481345, 2.720901, 0, 0, 0, 1, 1,
0.1603521, -0.6087073, 2.447972, 0, 0, 0, 1, 1,
0.160519, -0.7590816, 4.569731, 0, 0, 0, 1, 1,
0.1647495, -0.4784816, 2.646564, 0, 0, 0, 1, 1,
0.1659428, 2.094984, 0.1571375, 0, 0, 0, 1, 1,
0.1662152, -1.132579, 4.0833, 0, 0, 0, 1, 1,
0.1680558, 0.5556014, 1.177203, 1, 1, 1, 1, 1,
0.1702174, 0.03928721, 3.775091, 1, 1, 1, 1, 1,
0.1707731, 1.972498, -0.124715, 1, 1, 1, 1, 1,
0.1766982, 1.210441, -1.397325, 1, 1, 1, 1, 1,
0.1879917, -0.2849123, 3.335217, 1, 1, 1, 1, 1,
0.1880658, -0.2925375, 1.141979, 1, 1, 1, 1, 1,
0.190064, 0.4240227, -0.1522343, 1, 1, 1, 1, 1,
0.1907459, 0.01901322, 1.189311, 1, 1, 1, 1, 1,
0.1914949, 0.8389078, 0.7046582, 1, 1, 1, 1, 1,
0.1917076, 1.132213, -0.115329, 1, 1, 1, 1, 1,
0.1949495, 0.1836163, 0.733631, 1, 1, 1, 1, 1,
0.1979646, 1.37316, 0.05424621, 1, 1, 1, 1, 1,
0.1982797, 1.762267, 0.03580433, 1, 1, 1, 1, 1,
0.2002328, 0.1577284, -0.2538406, 1, 1, 1, 1, 1,
0.2019322, 0.1450331, 1.006771, 1, 1, 1, 1, 1,
0.2046197, 0.03278264, 2.512301, 0, 0, 1, 1, 1,
0.2086921, -1.810947, 4.007523, 1, 0, 0, 1, 1,
0.2106296, -0.5345433, 2.581588, 1, 0, 0, 1, 1,
0.2115252, 0.9464972, 0.03393731, 1, 0, 0, 1, 1,
0.2140914, -0.04553965, 2.266433, 1, 0, 0, 1, 1,
0.2157916, -0.3219817, 2.363225, 1, 0, 0, 1, 1,
0.2192061, 1.277638, 1.423981, 0, 0, 0, 1, 1,
0.2196188, 0.979849, 0.2639283, 0, 0, 0, 1, 1,
0.2204831, -0.3252043, 4.718152, 0, 0, 0, 1, 1,
0.2261869, -1.106732, 3.262862, 0, 0, 0, 1, 1,
0.2269631, -0.8926818, 3.879943, 0, 0, 0, 1, 1,
0.2276002, 0.09612875, 2.981607, 0, 0, 0, 1, 1,
0.2295854, 0.5040275, 2.118242, 0, 0, 0, 1, 1,
0.2295898, 1.605521, -0.4656725, 1, 1, 1, 1, 1,
0.231175, 0.1119541, 1.659222, 1, 1, 1, 1, 1,
0.2312591, 0.08368266, 1.584324, 1, 1, 1, 1, 1,
0.2330464, -1.394908, 3.801203, 1, 1, 1, 1, 1,
0.2337456, -0.379077, 1.891829, 1, 1, 1, 1, 1,
0.2341549, 0.6899075, 1.093918, 1, 1, 1, 1, 1,
0.2365424, 0.2130523, 1.850413, 1, 1, 1, 1, 1,
0.2397391, 1.777153, -0.3723485, 1, 1, 1, 1, 1,
0.2457518, 0.1123161, 0.7798665, 1, 1, 1, 1, 1,
0.2459114, -1.616176, 4.809147, 1, 1, 1, 1, 1,
0.2513634, 0.7030609, 0.728138, 1, 1, 1, 1, 1,
0.2517199, -0.592898, 2.776253, 1, 1, 1, 1, 1,
0.2518585, 1.164847, 0.7035691, 1, 1, 1, 1, 1,
0.2549756, 0.9245429, 0.02996288, 1, 1, 1, 1, 1,
0.2561528, -1.825324, 3.101843, 1, 1, 1, 1, 1,
0.2572421, 0.2916066, 0.4456825, 0, 0, 1, 1, 1,
0.2574364, -1.182125, 3.593651, 1, 0, 0, 1, 1,
0.2641878, 0.2177614, 0.01139633, 1, 0, 0, 1, 1,
0.276462, -1.182146, 3.038962, 1, 0, 0, 1, 1,
0.2785813, 1.14109, 0.04926728, 1, 0, 0, 1, 1,
0.2810935, -0.04478424, 2.920541, 1, 0, 0, 1, 1,
0.2844404, -1.929555, 2.707205, 0, 0, 0, 1, 1,
0.2896791, -0.7413269, 4.340699, 0, 0, 0, 1, 1,
0.2917555, 0.1239296, 2.255667, 0, 0, 0, 1, 1,
0.2941273, 0.4051169, -0.1322196, 0, 0, 0, 1, 1,
0.2947283, 2.34496, 0.1726135, 0, 0, 0, 1, 1,
0.2949798, -0.7852054, 2.709922, 0, 0, 0, 1, 1,
0.298322, -0.5302958, 2.534036, 0, 0, 0, 1, 1,
0.2984871, 0.155195, -0.06600767, 1, 1, 1, 1, 1,
0.3047381, -1.747529, 1.874773, 1, 1, 1, 1, 1,
0.3054655, -1.005397, 2.692762, 1, 1, 1, 1, 1,
0.3067816, -1.970325, 3.239902, 1, 1, 1, 1, 1,
0.3083454, -1.499054, 1.967029, 1, 1, 1, 1, 1,
0.311174, 0.004025128, 1.446768, 1, 1, 1, 1, 1,
0.3138131, 0.135822, 0.8322716, 1, 1, 1, 1, 1,
0.3165786, -1.621024, 4.14585, 1, 1, 1, 1, 1,
0.3181755, 0.1513982, 1.27431, 1, 1, 1, 1, 1,
0.3199009, 0.9267764, 0.427141, 1, 1, 1, 1, 1,
0.3204772, 0.4299578, -0.6769366, 1, 1, 1, 1, 1,
0.3230619, -1.111759, 3.276612, 1, 1, 1, 1, 1,
0.3234656, -1.439764, 3.750861, 1, 1, 1, 1, 1,
0.3242329, -1.01893, 4.388021, 1, 1, 1, 1, 1,
0.3268165, 1.22856, -1.174161, 1, 1, 1, 1, 1,
0.3274834, 0.003214357, 1.924066, 0, 0, 1, 1, 1,
0.3296445, 0.1653981, 0.9483945, 1, 0, 0, 1, 1,
0.3317544, 0.4162143, -0.329642, 1, 0, 0, 1, 1,
0.3338339, 0.9476269, -0.03399161, 1, 0, 0, 1, 1,
0.3358271, -0.05314459, 1.452274, 1, 0, 0, 1, 1,
0.3367856, 0.3728895, 0.9427464, 1, 0, 0, 1, 1,
0.337604, -0.5668173, 1.825777, 0, 0, 0, 1, 1,
0.34368, -0.4259856, 1.638282, 0, 0, 0, 1, 1,
0.3454699, -0.6467884, 3.788075, 0, 0, 0, 1, 1,
0.3475389, -0.8615625, 3.113324, 0, 0, 0, 1, 1,
0.3481391, -0.311945, 2.21277, 0, 0, 0, 1, 1,
0.3512394, -0.3494642, 3.377253, 0, 0, 0, 1, 1,
0.3571229, 0.6091158, 0.9072108, 0, 0, 0, 1, 1,
0.3666171, 0.7796232, -0.2973204, 1, 1, 1, 1, 1,
0.3695556, -1.339577, 2.79205, 1, 1, 1, 1, 1,
0.3757056, -0.6836567, 1.948258, 1, 1, 1, 1, 1,
0.3788477, 0.558454, 1.25736, 1, 1, 1, 1, 1,
0.379541, 0.8945661, -0.7040682, 1, 1, 1, 1, 1,
0.3819317, -0.04626449, 1.911307, 1, 1, 1, 1, 1,
0.3864639, -0.5552369, 4.380163, 1, 1, 1, 1, 1,
0.3879681, -0.3651281, 2.624858, 1, 1, 1, 1, 1,
0.3904311, 0.5642195, -1.396816, 1, 1, 1, 1, 1,
0.3911593, -1.416723, 2.755512, 1, 1, 1, 1, 1,
0.3938218, -0.6077822, 4.736402, 1, 1, 1, 1, 1,
0.398305, -0.3529367, 3.243572, 1, 1, 1, 1, 1,
0.3992376, -1.995352, 2.481664, 1, 1, 1, 1, 1,
0.4110087, 0.6259723, 1.932536, 1, 1, 1, 1, 1,
0.4125982, 0.7679289, -1.129627, 1, 1, 1, 1, 1,
0.4185078, -0.007080817, 2.974843, 0, 0, 1, 1, 1,
0.4211035, 0.7466299, 0.6984566, 1, 0, 0, 1, 1,
0.424439, 2.024343, -0.06056353, 1, 0, 0, 1, 1,
0.4250197, -1.541486, 3.317677, 1, 0, 0, 1, 1,
0.4281353, -0.3937711, 3.332159, 1, 0, 0, 1, 1,
0.4288636, 0.7325704, 1.240644, 1, 0, 0, 1, 1,
0.4319319, -0.1172501, 1.54129, 0, 0, 0, 1, 1,
0.4323418, -1.778193, 2.968191, 0, 0, 0, 1, 1,
0.4340914, 0.4018018, 2.637966, 0, 0, 0, 1, 1,
0.4356674, 1.320734, 0.6185547, 0, 0, 0, 1, 1,
0.4365723, 0.5545651, 0.8695189, 0, 0, 0, 1, 1,
0.4374603, -1.289092, 2.609008, 0, 0, 0, 1, 1,
0.4374631, -1.605218, 4.159906, 0, 0, 0, 1, 1,
0.4424405, -1.890362, 1.731263, 1, 1, 1, 1, 1,
0.4432189, 0.002865626, 0.9713892, 1, 1, 1, 1, 1,
0.4432261, 0.1510822, 0.3542974, 1, 1, 1, 1, 1,
0.4456847, -1.80465, 3.446498, 1, 1, 1, 1, 1,
0.4457835, -1.468167, 3.131512, 1, 1, 1, 1, 1,
0.4468262, 0.7555941, 0.7769054, 1, 1, 1, 1, 1,
0.4468536, -1.800237, 2.120639, 1, 1, 1, 1, 1,
0.4492222, -0.5113753, 2.225992, 1, 1, 1, 1, 1,
0.4500061, 0.1033347, 3.461623, 1, 1, 1, 1, 1,
0.4574951, 0.8300616, 2.518156, 1, 1, 1, 1, 1,
0.4589809, -0.1886681, 3.582294, 1, 1, 1, 1, 1,
0.4596886, -2.061934, 3.531448, 1, 1, 1, 1, 1,
0.4614601, 0.3833531, -0.3684568, 1, 1, 1, 1, 1,
0.4678554, -1.427211, 1.813494, 1, 1, 1, 1, 1,
0.4703316, -0.4646244, 3.367132, 1, 1, 1, 1, 1,
0.4704791, 1.296553, -0.2835255, 0, 0, 1, 1, 1,
0.4757869, -0.6765404, 2.756807, 1, 0, 0, 1, 1,
0.4765698, 1.784549, 1.218549, 1, 0, 0, 1, 1,
0.4903004, 1.01495, -0.3397587, 1, 0, 0, 1, 1,
0.4904091, -0.1209281, 1.865274, 1, 0, 0, 1, 1,
0.492833, 1.021813, 1.103169, 1, 0, 0, 1, 1,
0.4942045, -0.7775329, 1.957899, 0, 0, 0, 1, 1,
0.4979266, 0.5349252, 0.07583947, 0, 0, 0, 1, 1,
0.504822, 0.2199104, 1.17582, 0, 0, 0, 1, 1,
0.505836, -0.3907377, 2.816548, 0, 0, 0, 1, 1,
0.5067957, 0.02241045, 1.228099, 0, 0, 0, 1, 1,
0.5075434, -0.9223638, 2.053787, 0, 0, 0, 1, 1,
0.5149103, -0.6002817, 2.747603, 0, 0, 0, 1, 1,
0.5179221, 0.5404112, 0.765913, 1, 1, 1, 1, 1,
0.5249045, 0.2293134, 0.8994627, 1, 1, 1, 1, 1,
0.5253325, -0.2658662, 2.252282, 1, 1, 1, 1, 1,
0.5270472, -1.029072, 2.521618, 1, 1, 1, 1, 1,
0.5284467, -0.77769, 1.801046, 1, 1, 1, 1, 1,
0.5308838, 0.296958, 0.5277213, 1, 1, 1, 1, 1,
0.5315871, 0.4977017, -0.4454848, 1, 1, 1, 1, 1,
0.5329937, 1.510218, 0.959849, 1, 1, 1, 1, 1,
0.5368047, 0.6090531, -0.2025057, 1, 1, 1, 1, 1,
0.5387389, -0.07890853, 1.972854, 1, 1, 1, 1, 1,
0.539522, 1.599492, 1.435815, 1, 1, 1, 1, 1,
0.5431013, 1.368807, 0.299444, 1, 1, 1, 1, 1,
0.5437669, -0.8399596, 4.344461, 1, 1, 1, 1, 1,
0.5473033, -1.269542, 2.654475, 1, 1, 1, 1, 1,
0.5494531, 1.334494, -0.5881859, 1, 1, 1, 1, 1,
0.5533908, 0.4867988, 0.02282374, 0, 0, 1, 1, 1,
0.5557929, 0.1397944, 1.174023, 1, 0, 0, 1, 1,
0.5612895, -0.5175344, 4.827274, 1, 0, 0, 1, 1,
0.5651726, -0.07287505, 0.9557134, 1, 0, 0, 1, 1,
0.5661652, -0.2571723, 2.589014, 1, 0, 0, 1, 1,
0.5708855, 1.223078, 0.6463627, 1, 0, 0, 1, 1,
0.5725239, -1.354337, 4.500333, 0, 0, 0, 1, 1,
0.5749308, -1.104036, 3.16806, 0, 0, 0, 1, 1,
0.5753703, -0.4589553, 1.472441, 0, 0, 0, 1, 1,
0.5795177, 0.5443783, 2.559956, 0, 0, 0, 1, 1,
0.580097, -0.2238523, 2.224658, 0, 0, 0, 1, 1,
0.5803186, -1.509728, 3.860936, 0, 0, 0, 1, 1,
0.5843992, 0.7352405, 0.2205593, 0, 0, 0, 1, 1,
0.5915751, -1.569093, 2.957325, 1, 1, 1, 1, 1,
0.5923386, 2.165848, 1.574556, 1, 1, 1, 1, 1,
0.5939571, -0.7723257, 1.859711, 1, 1, 1, 1, 1,
0.6011133, 0.2561824, 1.421856, 1, 1, 1, 1, 1,
0.6017594, -0.06684177, 2.562585, 1, 1, 1, 1, 1,
0.6025578, 0.7597783, 1.750055, 1, 1, 1, 1, 1,
0.605264, -0.3140505, -0.01149134, 1, 1, 1, 1, 1,
0.6155302, -1.311138, 4.141963, 1, 1, 1, 1, 1,
0.6249313, 0.3342581, 0.7238837, 1, 1, 1, 1, 1,
0.6258152, -1.557985, 1.535588, 1, 1, 1, 1, 1,
0.6274683, -0.7328793, 5.207205, 1, 1, 1, 1, 1,
0.6338505, -0.8646851, 2.602547, 1, 1, 1, 1, 1,
0.6344175, -0.4355792, 0.7622477, 1, 1, 1, 1, 1,
0.6357194, -0.2885978, 0.3040966, 1, 1, 1, 1, 1,
0.6384767, -0.4013921, 2.81325, 1, 1, 1, 1, 1,
0.6389882, 0.8076104, -0.3051734, 0, 0, 1, 1, 1,
0.6408566, 0.6314265, -0.1912466, 1, 0, 0, 1, 1,
0.6425191, 0.4285941, -1.352454, 1, 0, 0, 1, 1,
0.6443287, -0.169274, 1.444199, 1, 0, 0, 1, 1,
0.6467949, 1.620782, 1.428658, 1, 0, 0, 1, 1,
0.6469881, 0.1558772, -0.5024679, 1, 0, 0, 1, 1,
0.6481367, -0.3659709, 1.941035, 0, 0, 0, 1, 1,
0.6503628, 1.120006, 1.42682, 0, 0, 0, 1, 1,
0.6515426, 0.6348535, 0.6655356, 0, 0, 0, 1, 1,
0.6598487, -0.21228, 1.209257, 0, 0, 0, 1, 1,
0.6622412, 0.8468418, 0.1675661, 0, 0, 0, 1, 1,
0.6635986, 1.483738, -0.01300292, 0, 0, 0, 1, 1,
0.6648506, 0.6386203, 0.8015257, 0, 0, 0, 1, 1,
0.6753113, 0.4082161, -0.5915951, 1, 1, 1, 1, 1,
0.6799203, 1.586987, 1.480215, 1, 1, 1, 1, 1,
0.6842641, 0.3013627, 2.737381, 1, 1, 1, 1, 1,
0.6850075, 1.531254, -0.009482995, 1, 1, 1, 1, 1,
0.6855084, 0.3000032, 1.953818, 1, 1, 1, 1, 1,
0.6874914, -0.6211888, 2.83884, 1, 1, 1, 1, 1,
0.6912768, 1.73755, -0.8906349, 1, 1, 1, 1, 1,
0.6971341, -0.1502376, 1.752911, 1, 1, 1, 1, 1,
0.6975134, 0.6077585, 0.8119625, 1, 1, 1, 1, 1,
0.7043526, 0.7701194, -0.1166823, 1, 1, 1, 1, 1,
0.7048013, -1.154589, 2.180759, 1, 1, 1, 1, 1,
0.7057863, 1.267757, 2.111169, 1, 1, 1, 1, 1,
0.7061085, 0.3724044, -0.5045782, 1, 1, 1, 1, 1,
0.707092, -0.5100919, 2.337331, 1, 1, 1, 1, 1,
0.7102166, 0.1224034, 1.722537, 1, 1, 1, 1, 1,
0.7214106, -1.207224, 2.854648, 0, 0, 1, 1, 1,
0.7215887, 1.078187, 1.016205, 1, 0, 0, 1, 1,
0.7275432, 0.3226126, 1.490512, 1, 0, 0, 1, 1,
0.7380303, -0.3079742, 3.929062, 1, 0, 0, 1, 1,
0.7425243, -1.306408, 3.213449, 1, 0, 0, 1, 1,
0.742941, 0.119075, 0.6022592, 1, 0, 0, 1, 1,
0.7458301, -0.5787123, 2.442745, 0, 0, 0, 1, 1,
0.7465414, -1.109891, 1.211221, 0, 0, 0, 1, 1,
0.7488577, -0.4328599, 2.072043, 0, 0, 0, 1, 1,
0.7504272, 1.246938, 0.8242315, 0, 0, 0, 1, 1,
0.7592559, 0.4542309, 1.655313, 0, 0, 0, 1, 1,
0.7594866, -0.8626429, 2.505404, 0, 0, 0, 1, 1,
0.7622093, 1.117704, -0.115412, 0, 0, 0, 1, 1,
0.7635838, 0.8338388, 1.966618, 1, 1, 1, 1, 1,
0.7666972, -0.3126179, 2.955243, 1, 1, 1, 1, 1,
0.7699641, 0.17782, 1.147199, 1, 1, 1, 1, 1,
0.7731723, 1.64162, 1.704291, 1, 1, 1, 1, 1,
0.7832106, -0.8392825, 0.8799236, 1, 1, 1, 1, 1,
0.7851036, -0.4803538, 0.3913241, 1, 1, 1, 1, 1,
0.7873007, -0.05115214, 1.145828, 1, 1, 1, 1, 1,
0.7873659, 1.19277, 1.085052, 1, 1, 1, 1, 1,
0.7913682, -1.813146, 3.069531, 1, 1, 1, 1, 1,
0.7932151, 0.4471801, -0.2734412, 1, 1, 1, 1, 1,
0.7963896, 0.01512273, 2.729694, 1, 1, 1, 1, 1,
0.8024265, -1.385995, 2.568684, 1, 1, 1, 1, 1,
0.8036702, 0.2076987, 2.461498, 1, 1, 1, 1, 1,
0.8051927, 1.785929, 0.2858961, 1, 1, 1, 1, 1,
0.8084778, 0.5390306, 2.280294, 1, 1, 1, 1, 1,
0.8106872, -0.02176273, 0.3691387, 0, 0, 1, 1, 1,
0.8169735, -1.006598, 2.616546, 1, 0, 0, 1, 1,
0.8170052, 0.9130096, -0.1348606, 1, 0, 0, 1, 1,
0.8175412, -1.673733, 3.614312, 1, 0, 0, 1, 1,
0.8194682, 2.120041, 0.9939299, 1, 0, 0, 1, 1,
0.8387763, 0.5851006, 4.313629, 1, 0, 0, 1, 1,
0.8404255, -1.102844, 0.5573127, 0, 0, 0, 1, 1,
0.8424156, -1.141507, 2.853083, 0, 0, 0, 1, 1,
0.8432583, -0.5899026, 1.928127, 0, 0, 0, 1, 1,
0.8518338, -0.7841338, 3.598895, 0, 0, 0, 1, 1,
0.8518777, -1.649299, 1.135415, 0, 0, 0, 1, 1,
0.8611186, 0.2492552, 0.9460624, 0, 0, 0, 1, 1,
0.8733933, -0.7212234, 1.259007, 0, 0, 0, 1, 1,
0.87444, 1.985625, 0.577229, 1, 1, 1, 1, 1,
0.8766269, -0.1225549, 0.9993934, 1, 1, 1, 1, 1,
0.881369, -0.417967, 1.386215, 1, 1, 1, 1, 1,
0.8930969, 0.9859925, 1.43971, 1, 1, 1, 1, 1,
0.8931328, 1.01295, 0.5909973, 1, 1, 1, 1, 1,
0.8981714, 1.618865, -0.03328194, 1, 1, 1, 1, 1,
0.9023831, -2.386204, 1.498394, 1, 1, 1, 1, 1,
0.9042941, -0.7209707, 0.4756072, 1, 1, 1, 1, 1,
0.9043431, -0.3614651, 2.513465, 1, 1, 1, 1, 1,
0.9060108, -0.4269507, 1.749669, 1, 1, 1, 1, 1,
0.9133211, 0.5718765, -1.140744, 1, 1, 1, 1, 1,
0.9145879, 0.07988569, 1.583392, 1, 1, 1, 1, 1,
0.9167484, 1.492674, 1.407366, 1, 1, 1, 1, 1,
0.9206227, -0.3826543, 1.187188, 1, 1, 1, 1, 1,
0.9236081, 0.9782875, 0.004552259, 1, 1, 1, 1, 1,
0.9265079, -0.2066779, 0.6097882, 0, 0, 1, 1, 1,
0.93325, -0.2564335, 2.617581, 1, 0, 0, 1, 1,
0.9397805, 1.533806, -1.393474, 1, 0, 0, 1, 1,
0.9437482, -0.55336, 3.612445, 1, 0, 0, 1, 1,
0.9450709, 0.6555022, 1.113926, 1, 0, 0, 1, 1,
0.9548733, 0.01459633, 1.52065, 1, 0, 0, 1, 1,
0.9588199, -1.289756, 3.286979, 0, 0, 0, 1, 1,
0.973487, 0.5893649, 0.7001975, 0, 0, 0, 1, 1,
0.9750221, -0.8175426, 3.578351, 0, 0, 0, 1, 1,
0.9752724, -0.9833277, 3.112016, 0, 0, 0, 1, 1,
0.9790128, -0.0223657, 2.21818, 0, 0, 0, 1, 1,
0.9800813, -0.6159856, 2.565252, 0, 0, 0, 1, 1,
0.9831637, 0.004008311, 2.074842, 0, 0, 0, 1, 1,
0.9918717, 0.4377145, 0.3990969, 1, 1, 1, 1, 1,
0.995313, 0.1965922, 1.132045, 1, 1, 1, 1, 1,
0.996053, 1.787377, 1.461829, 1, 1, 1, 1, 1,
0.9993823, 1.147678, 1.491409, 1, 1, 1, 1, 1,
1.002762, -0.6628903, 4.38964, 1, 1, 1, 1, 1,
1.006107, -0.2333148, 1.093793, 1, 1, 1, 1, 1,
1.006301, 0.9826328, -0.712905, 1, 1, 1, 1, 1,
1.00733, -0.1434451, 2.312904, 1, 1, 1, 1, 1,
1.016818, 1.627079, 3.553766, 1, 1, 1, 1, 1,
1.020816, 0.681372, 1.443292, 1, 1, 1, 1, 1,
1.026704, -0.8017089, 3.604697, 1, 1, 1, 1, 1,
1.03604, -0.0496476, 1.873162, 1, 1, 1, 1, 1,
1.04468, -0.04631158, 0.3166571, 1, 1, 1, 1, 1,
1.054536, -0.2005552, -0.3931829, 1, 1, 1, 1, 1,
1.05768, 0.3880289, -0.3058766, 1, 1, 1, 1, 1,
1.062192, -0.1447008, 2.788158, 0, 0, 1, 1, 1,
1.062726, 2.046391, 0.2156296, 1, 0, 0, 1, 1,
1.068845, 0.8351749, -0.5955667, 1, 0, 0, 1, 1,
1.070667, 1.622709, -1.481557, 1, 0, 0, 1, 1,
1.073929, -0.9193538, 1.369323, 1, 0, 0, 1, 1,
1.074429, 0.1054884, 0.6778368, 1, 0, 0, 1, 1,
1.074789, -0.539331, 3.781005, 0, 0, 0, 1, 1,
1.076404, 0.7964603, 2.360205, 0, 0, 0, 1, 1,
1.080632, 1.841402, 2.250172, 0, 0, 0, 1, 1,
1.081311, 0.1164781, 1.567525, 0, 0, 0, 1, 1,
1.0824, -0.8081516, 2.31033, 0, 0, 0, 1, 1,
1.084572, 0.3718419, -0.9850975, 0, 0, 0, 1, 1,
1.085917, 0.2495845, 1.155124, 0, 0, 0, 1, 1,
1.09062, -1.201169, 2.31942, 1, 1, 1, 1, 1,
1.093423, -0.2784856, 1.714155, 1, 1, 1, 1, 1,
1.099666, -0.1109107, 0.2130149, 1, 1, 1, 1, 1,
1.113228, -0.9642926, 1.648706, 1, 1, 1, 1, 1,
1.12282, 0.1782598, 1.938316, 1, 1, 1, 1, 1,
1.132258, 0.7947847, 0.771021, 1, 1, 1, 1, 1,
1.139751, 1.540584, 3.191349, 1, 1, 1, 1, 1,
1.144171, 1.859812, -0.4273188, 1, 1, 1, 1, 1,
1.149696, 0.5362847, 0.6317761, 1, 1, 1, 1, 1,
1.150081, 0.0379541, 2.191558, 1, 1, 1, 1, 1,
1.153689, 0.1546801, 0.2786295, 1, 1, 1, 1, 1,
1.175879, 1.610148, -0.4240959, 1, 1, 1, 1, 1,
1.186898, 0.2714642, 1.188576, 1, 1, 1, 1, 1,
1.187051, 0.2712967, 1.123384, 1, 1, 1, 1, 1,
1.188368, 0.6045558, 3.436452, 1, 1, 1, 1, 1,
1.188727, 0.2960224, 2.716235, 0, 0, 1, 1, 1,
1.192106, 0.3873807, 0.2910936, 1, 0, 0, 1, 1,
1.196317, 0.8841928, 0.7826029, 1, 0, 0, 1, 1,
1.200076, -0.6388624, 2.83576, 1, 0, 0, 1, 1,
1.206358, 0.3522857, 2.214884, 1, 0, 0, 1, 1,
1.212294, 0.90128, -0.05676424, 1, 0, 0, 1, 1,
1.221877, 0.4967145, 1.114291, 0, 0, 0, 1, 1,
1.230579, 0.04670589, 2.055962, 0, 0, 0, 1, 1,
1.243221, 0.5398023, 1.195807, 0, 0, 0, 1, 1,
1.246975, -0.4122625, 2.11394, 0, 0, 0, 1, 1,
1.253926, 0.1978316, 1.889587, 0, 0, 0, 1, 1,
1.25758, 0.7543539, 1.49012, 0, 0, 0, 1, 1,
1.257861, 0.9636018, 0.06926151, 0, 0, 0, 1, 1,
1.25821, 1.687852, 0.9608819, 1, 1, 1, 1, 1,
1.258438, -1.100352, 3.202351, 1, 1, 1, 1, 1,
1.258829, 0.5088432, 0.8823016, 1, 1, 1, 1, 1,
1.276181, 0.3077286, 0.8979942, 1, 1, 1, 1, 1,
1.278754, -0.8789164, 2.344304, 1, 1, 1, 1, 1,
1.281911, -1.082408, 3.216787, 1, 1, 1, 1, 1,
1.283042, -0.4720559, 0.2785233, 1, 1, 1, 1, 1,
1.287508, 2.094518, 0.6291513, 1, 1, 1, 1, 1,
1.288397, -1.472367, 1.741588, 1, 1, 1, 1, 1,
1.290099, 1.030412, -0.4450933, 1, 1, 1, 1, 1,
1.293686, 1.121308, 1.338937, 1, 1, 1, 1, 1,
1.308172, -0.7833937, 3.895446, 1, 1, 1, 1, 1,
1.317379, -0.4731791, 2.579966, 1, 1, 1, 1, 1,
1.317506, -0.1630716, 0.2901791, 1, 1, 1, 1, 1,
1.322734, 1.372292, 0.8203746, 1, 1, 1, 1, 1,
1.323785, -0.5575172, 2.762166, 0, 0, 1, 1, 1,
1.324732, 0.004428796, 2.291457, 1, 0, 0, 1, 1,
1.326664, 1.637454, -0.4274923, 1, 0, 0, 1, 1,
1.3269, 1.368332, 1.861947, 1, 0, 0, 1, 1,
1.332096, -0.7699154, 2.163804, 1, 0, 0, 1, 1,
1.335611, -0.256649, 0.7309198, 1, 0, 0, 1, 1,
1.340141, 1.734444, 0.5476177, 0, 0, 0, 1, 1,
1.361868, 0.2439179, 1.924375, 0, 0, 0, 1, 1,
1.36243, -0.5890312, 1.970584, 0, 0, 0, 1, 1,
1.363618, 0.2648444, -0.1182363, 0, 0, 0, 1, 1,
1.379578, 0.7594317, -0.8738508, 0, 0, 0, 1, 1,
1.384349, 0.6743789, -0.3329467, 0, 0, 0, 1, 1,
1.404099, -0.5932205, 2.553999, 0, 0, 0, 1, 1,
1.410734, -0.4481913, 1.358844, 1, 1, 1, 1, 1,
1.411843, 1.170516, 0.9091979, 1, 1, 1, 1, 1,
1.413064, 0.7999184, -2.317969, 1, 1, 1, 1, 1,
1.415357, 0.245249, 2.00271, 1, 1, 1, 1, 1,
1.416921, -1.434441, 1.142783, 1, 1, 1, 1, 1,
1.418404, 0.5805641, 0.5576327, 1, 1, 1, 1, 1,
1.424677, -0.08389163, 1.519224, 1, 1, 1, 1, 1,
1.433171, -0.2946127, 2.10251, 1, 1, 1, 1, 1,
1.44093, 0.938518, 0.527803, 1, 1, 1, 1, 1,
1.449095, 0.8073458, 2.522324, 1, 1, 1, 1, 1,
1.452934, -0.03041168, 2.238596, 1, 1, 1, 1, 1,
1.462677, -0.6743042, 2.940585, 1, 1, 1, 1, 1,
1.475723, 1.047106, 3.316797, 1, 1, 1, 1, 1,
1.484547, 1.550852, -0.1663938, 1, 1, 1, 1, 1,
1.498522, -0.2828834, 1.148484, 1, 1, 1, 1, 1,
1.50108, -1.597172, 2.248318, 0, 0, 1, 1, 1,
1.503029, 0.06787433, 0.5271261, 1, 0, 0, 1, 1,
1.527064, -0.801993, 2.456486, 1, 0, 0, 1, 1,
1.533733, -0.1815241, -0.06492985, 1, 0, 0, 1, 1,
1.534614, 0.9569992, 0.8993928, 1, 0, 0, 1, 1,
1.541355, -0.2023842, 1.24628, 1, 0, 0, 1, 1,
1.550301, 0.07571753, 1.730319, 0, 0, 0, 1, 1,
1.551482, 0.06509703, 1.894819, 0, 0, 0, 1, 1,
1.56103, 0.5634441, 0.1624245, 0, 0, 0, 1, 1,
1.565553, -0.04690565, 1.465388, 0, 0, 0, 1, 1,
1.573048, -2.06377, 1.378162, 0, 0, 0, 1, 1,
1.593748, 1.00428, 0.8794506, 0, 0, 0, 1, 1,
1.617055, 1.552292, 1.491767, 0, 0, 0, 1, 1,
1.630431, 0.15348, 0.4605263, 1, 1, 1, 1, 1,
1.635166, 1.485457, -0.3471525, 1, 1, 1, 1, 1,
1.645266, -0.7804321, 2.796444, 1, 1, 1, 1, 1,
1.650318, 0.550367, -1.661792, 1, 1, 1, 1, 1,
1.662151, 0.2033085, 2.172786, 1, 1, 1, 1, 1,
1.674984, -1.285182, 0.6182528, 1, 1, 1, 1, 1,
1.684053, 0.2585085, 1.173611, 1, 1, 1, 1, 1,
1.685651, -0.1517091, 0.8487957, 1, 1, 1, 1, 1,
1.693135, 0.8137491, -0.3198893, 1, 1, 1, 1, 1,
1.695893, 0.4282895, 2.073253, 1, 1, 1, 1, 1,
1.702268, 0.6278988, 1.62449, 1, 1, 1, 1, 1,
1.716909, 1.058491, 1.257705, 1, 1, 1, 1, 1,
1.720804, -0.258923, 2.49201, 1, 1, 1, 1, 1,
1.745483, -0.5085211, 3.328556, 1, 1, 1, 1, 1,
1.748494, 0.8351939, 2.137853, 1, 1, 1, 1, 1,
1.767511, 1.32375, -0.3115964, 0, 0, 1, 1, 1,
1.782626, 0.1899321, 1.76115, 1, 0, 0, 1, 1,
1.78425, -1.063068, 2.634534, 1, 0, 0, 1, 1,
1.78739, 0.8153466, 1.71184, 1, 0, 0, 1, 1,
1.788549, 0.1483877, -0.3900519, 1, 0, 0, 1, 1,
1.795453, 0.01416935, 1.804163, 1, 0, 0, 1, 1,
1.796067, 0.6144018, 0.2073995, 0, 0, 0, 1, 1,
1.804422, 0.345158, 0.276503, 0, 0, 0, 1, 1,
1.804602, -1.308867, 2.36199, 0, 0, 0, 1, 1,
1.82597, -0.07405028, 1.801046, 0, 0, 0, 1, 1,
1.851211, 0.409147, -0.8776126, 0, 0, 0, 1, 1,
1.869277, -1.864459, 1.402003, 0, 0, 0, 1, 1,
1.872226, 0.5585392, 1.825408, 0, 0, 0, 1, 1,
1.880486, -0.2158275, 1.629423, 1, 1, 1, 1, 1,
1.8899, -0.03316726, 2.655495, 1, 1, 1, 1, 1,
1.892512, -1.045528, 2.403513, 1, 1, 1, 1, 1,
1.906071, 0.3297422, 2.353705, 1, 1, 1, 1, 1,
1.913021, 0.8635596, 1.065542, 1, 1, 1, 1, 1,
1.957003, 0.04801043, 1.201617, 1, 1, 1, 1, 1,
1.960738, -0.193444, 1.191461, 1, 1, 1, 1, 1,
1.964185, -1.953639, 2.409264, 1, 1, 1, 1, 1,
2.000118, 0.1873157, 1.500534, 1, 1, 1, 1, 1,
2.047066, 0.6399578, 2.406087, 1, 1, 1, 1, 1,
2.059561, -0.9836769, 4.106521, 1, 1, 1, 1, 1,
2.076333, 2.034388, 1.132369, 1, 1, 1, 1, 1,
2.089634, 0.07734048, 0.5191723, 1, 1, 1, 1, 1,
2.128056, 0.7365909, 2.435168, 1, 1, 1, 1, 1,
2.133102, -1.379064, 2.32519, 1, 1, 1, 1, 1,
2.172832, -0.6039814, 0.8777183, 0, 0, 1, 1, 1,
2.177351, 0.05843983, 0.5223457, 1, 0, 0, 1, 1,
2.199736, -1.373176, 0.8251615, 1, 0, 0, 1, 1,
2.205, -0.6030264, 1.454108, 1, 0, 0, 1, 1,
2.210442, 1.069871, 1.056311, 1, 0, 0, 1, 1,
2.228567, 0.6774724, 0.7502911, 1, 0, 0, 1, 1,
2.272013, 0.3540957, 1.468796, 0, 0, 0, 1, 1,
2.336795, 0.3282917, 0.5426197, 0, 0, 0, 1, 1,
2.345672, 0.4621512, 1.558444, 0, 0, 0, 1, 1,
2.390072, -0.6825682, 2.229012, 0, 0, 0, 1, 1,
2.421123, -0.4581178, 1.208956, 0, 0, 0, 1, 1,
2.438408, 0.3481792, 0.6263772, 0, 0, 0, 1, 1,
2.458512, 0.3910832, 0.7061043, 0, 0, 0, 1, 1,
2.468757, 0.3666684, 2.530616, 1, 1, 1, 1, 1,
2.495302, 1.028069, 1.175874, 1, 1, 1, 1, 1,
2.539307, -0.8093166, 3.786365, 1, 1, 1, 1, 1,
2.638686, 0.9469766, 0.9996552, 1, 1, 1, 1, 1,
2.670712, -1.354713, 2.334604, 1, 1, 1, 1, 1,
2.7974, 0.5550377, 1.172385, 1, 1, 1, 1, 1,
2.905922, 0.7568857, 2.411749, 1, 1, 1, 1, 1
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
var radius = 9.151083;
var distance = 32.14279;
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
mvMatrix.translate( -0.04261684, -0.03368521, -0.4470096 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.14279);
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
