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
-3.294696, -0.3360065, -2.248368, 1, 0, 0, 1,
-2.865426, -0.9522402, -1.805114, 1, 0.007843138, 0, 1,
-2.714092, -1.318774, -4.347636, 1, 0.01176471, 0, 1,
-2.679067, 0.4827009, -4.076195, 1, 0.01960784, 0, 1,
-2.634874, 2.169729, -1.715182, 1, 0.02352941, 0, 1,
-2.502247, 0.4701154, -1.713881, 1, 0.03137255, 0, 1,
-2.501037, 0.3347989, -0.5859616, 1, 0.03529412, 0, 1,
-2.495702, 0.4659505, -2.109175, 1, 0.04313726, 0, 1,
-2.482548, 0.4155927, -1.72915, 1, 0.04705882, 0, 1,
-2.441707, -0.2061074, -1.059395, 1, 0.05490196, 0, 1,
-2.434071, -1.098843, -1.191879, 1, 0.05882353, 0, 1,
-2.348569, -0.04705717, -2.878194, 1, 0.06666667, 0, 1,
-2.300773, 0.6785444, -1.142138, 1, 0.07058824, 0, 1,
-2.266098, 0.7926582, 1.253502, 1, 0.07843138, 0, 1,
-2.241701, 0.1670027, -0.3004525, 1, 0.08235294, 0, 1,
-2.239697, 1.329669, -0.4613408, 1, 0.09019608, 0, 1,
-2.227569, -1.994236, -2.48758, 1, 0.09411765, 0, 1,
-2.14017, -0.6227959, -2.346504, 1, 0.1019608, 0, 1,
-2.122037, 0.7679948, -1.393414, 1, 0.1098039, 0, 1,
-2.109425, 0.1119057, -1.165458, 1, 0.1137255, 0, 1,
-2.094419, -0.1268954, -2.294969, 1, 0.1215686, 0, 1,
-2.088834, -0.1347516, -1.462461, 1, 0.1254902, 0, 1,
-2.086942, -2.169462, -1.879994, 1, 0.1333333, 0, 1,
-2.075476, 0.3808577, -1.48342, 1, 0.1372549, 0, 1,
-2.068034, 0.3855111, -2.983228, 1, 0.145098, 0, 1,
-2.065825, 0.2399123, -1.84457, 1, 0.1490196, 0, 1,
-2.054598, 0.4253716, -0.9021381, 1, 0.1568628, 0, 1,
-2.021248, -0.4679177, -1.553131, 1, 0.1607843, 0, 1,
-2.009641, 0.488932, -1.896918, 1, 0.1686275, 0, 1,
-1.987721, 2.192104, -0.5236, 1, 0.172549, 0, 1,
-1.987298, -0.5934349, -1.335832, 1, 0.1803922, 0, 1,
-1.957868, 1.111054, -0.1531713, 1, 0.1843137, 0, 1,
-1.954659, -0.4924373, -0.1588466, 1, 0.1921569, 0, 1,
-1.944993, 0.6048747, -0.8484608, 1, 0.1960784, 0, 1,
-1.944727, 1.214637, 0.09879464, 1, 0.2039216, 0, 1,
-1.913433, 0.9435196, -2.464543, 1, 0.2117647, 0, 1,
-1.902579, 0.2593463, -2.040906, 1, 0.2156863, 0, 1,
-1.902456, -0.6142963, -0.9150377, 1, 0.2235294, 0, 1,
-1.900368, 0.8728141, -1.833377, 1, 0.227451, 0, 1,
-1.898114, -1.612161, -2.642047, 1, 0.2352941, 0, 1,
-1.879357, 0.3576126, -2.816867, 1, 0.2392157, 0, 1,
-1.875459, 0.1144698, -0.1834353, 1, 0.2470588, 0, 1,
-1.86008, 0.2471273, -1.559708, 1, 0.2509804, 0, 1,
-1.850065, 0.6891756, -0.6573763, 1, 0.2588235, 0, 1,
-1.820326, 2.129751, 0.5336347, 1, 0.2627451, 0, 1,
-1.814718, -0.009478853, -1.80902, 1, 0.2705882, 0, 1,
-1.809055, -0.1178342, -1.840265, 1, 0.2745098, 0, 1,
-1.802666, -0.7761821, -1.952076, 1, 0.282353, 0, 1,
-1.785697, -1.270203, -1.562703, 1, 0.2862745, 0, 1,
-1.769769, 0.07665366, -3.41876, 1, 0.2941177, 0, 1,
-1.762655, 0.6549674, -2.481957, 1, 0.3019608, 0, 1,
-1.743956, 1.721826, -0.1518295, 1, 0.3058824, 0, 1,
-1.73478, -0.01188875, -1.14343, 1, 0.3137255, 0, 1,
-1.712726, -0.5448971, -2.358084, 1, 0.3176471, 0, 1,
-1.686576, -0.4522111, -0.9078039, 1, 0.3254902, 0, 1,
-1.683231, 1.677632, -0.2723483, 1, 0.3294118, 0, 1,
-1.676341, -0.588249, -2.288111, 1, 0.3372549, 0, 1,
-1.628825, 0.06200313, -0.2308894, 1, 0.3411765, 0, 1,
-1.622787, -1.355906, -0.7772654, 1, 0.3490196, 0, 1,
-1.619632, 1.566427, -3.288352, 1, 0.3529412, 0, 1,
-1.618666, -1.836905, -2.731976, 1, 0.3607843, 0, 1,
-1.618065, -0.2391311, -0.7629574, 1, 0.3647059, 0, 1,
-1.613279, -0.3780642, -3.40821, 1, 0.372549, 0, 1,
-1.612689, -1.343717, -3.147141, 1, 0.3764706, 0, 1,
-1.611417, -2.381639, -3.141031, 1, 0.3843137, 0, 1,
-1.605572, -0.1025517, -2.393488, 1, 0.3882353, 0, 1,
-1.598702, -1.063875, -3.223581, 1, 0.3960784, 0, 1,
-1.578707, 1.802986, -1.271264, 1, 0.4039216, 0, 1,
-1.572888, -1.208073, -1.669919, 1, 0.4078431, 0, 1,
-1.533531, 0.4304897, -1.748083, 1, 0.4156863, 0, 1,
-1.51741, 1.144845, 0.1631643, 1, 0.4196078, 0, 1,
-1.513631, -1.245756, -2.504733, 1, 0.427451, 0, 1,
-1.507604, 0.08822992, -1.876622, 1, 0.4313726, 0, 1,
-1.500637, 0.1012618, 1.773104, 1, 0.4392157, 0, 1,
-1.500191, -0.4451782, -0.2054395, 1, 0.4431373, 0, 1,
-1.493229, -0.6902387, -4.310052, 1, 0.4509804, 0, 1,
-1.468057, -0.5620781, -0.05124043, 1, 0.454902, 0, 1,
-1.467566, -0.5905133, -1.841092, 1, 0.4627451, 0, 1,
-1.467471, 0.3866975, -1.904547, 1, 0.4666667, 0, 1,
-1.467337, 0.244851, -0.0606554, 1, 0.4745098, 0, 1,
-1.465702, -0.3697768, -2.129622, 1, 0.4784314, 0, 1,
-1.461855, -0.6126917, -1.497576, 1, 0.4862745, 0, 1,
-1.451334, -0.4514219, -1.537749, 1, 0.4901961, 0, 1,
-1.44714, -0.7366668, -3.189017, 1, 0.4980392, 0, 1,
-1.431554, 1.26377, -0.6239188, 1, 0.5058824, 0, 1,
-1.417792, 0.5863606, -0.9359133, 1, 0.509804, 0, 1,
-1.412424, 3.236149, 0.8792287, 1, 0.5176471, 0, 1,
-1.408932, 0.8850039, -2.04277, 1, 0.5215687, 0, 1,
-1.398853, 1.467061, -0.2398862, 1, 0.5294118, 0, 1,
-1.390255, 0.8370354, -3.552233, 1, 0.5333334, 0, 1,
-1.389646, -0.4364214, -2.022149, 1, 0.5411765, 0, 1,
-1.377021, 0.599923, -1.116129, 1, 0.5450981, 0, 1,
-1.365843, -0.485495, -0.9796099, 1, 0.5529412, 0, 1,
-1.360999, -0.5543842, -3.127928, 1, 0.5568628, 0, 1,
-1.358415, -0.4992375, -2.796229, 1, 0.5647059, 0, 1,
-1.354372, -0.7112821, -1.611242, 1, 0.5686275, 0, 1,
-1.351662, 1.505411, -0.7388753, 1, 0.5764706, 0, 1,
-1.344119, 1.063344, -0.6969896, 1, 0.5803922, 0, 1,
-1.336494, -0.1512471, -2.098752, 1, 0.5882353, 0, 1,
-1.332753, -0.9573009, -2.625149, 1, 0.5921569, 0, 1,
-1.332074, 1.056183, -0.1011713, 1, 0.6, 0, 1,
-1.315779, 0.9126249, -1.338997, 1, 0.6078432, 0, 1,
-1.31292, 1.259109, -1.084039, 1, 0.6117647, 0, 1,
-1.305059, -1.147922, -1.639737, 1, 0.6196079, 0, 1,
-1.300721, 0.6553299, -0.6307621, 1, 0.6235294, 0, 1,
-1.294258, 0.4980645, -1.414199, 1, 0.6313726, 0, 1,
-1.290715, 0.04322157, -1.254335, 1, 0.6352941, 0, 1,
-1.28919, 1.755902, -1.654644, 1, 0.6431373, 0, 1,
-1.283593, 1.7574, 0.8918281, 1, 0.6470588, 0, 1,
-1.283561, -0.9159724, -1.291069, 1, 0.654902, 0, 1,
-1.283135, -0.4020821, -2.531213, 1, 0.6588235, 0, 1,
-1.276488, -0.5154601, -1.674458, 1, 0.6666667, 0, 1,
-1.252508, -1.140194, -0.5510251, 1, 0.6705883, 0, 1,
-1.241522, -0.2413936, -2.685914, 1, 0.6784314, 0, 1,
-1.241037, 1.433176, 0.9822119, 1, 0.682353, 0, 1,
-1.232308, -0.8696717, -3.349113, 1, 0.6901961, 0, 1,
-1.227344, -1.425545, -3.257284, 1, 0.6941177, 0, 1,
-1.2152, 1.640692, 1.153089, 1, 0.7019608, 0, 1,
-1.214175, -0.3545789, -3.626869, 1, 0.7098039, 0, 1,
-1.213931, 0.0663621, -3.28558, 1, 0.7137255, 0, 1,
-1.213869, 0.02714761, -2.561711, 1, 0.7215686, 0, 1,
-1.207507, 0.2484243, -0.4108668, 1, 0.7254902, 0, 1,
-1.203935, 0.01141916, -2.2354, 1, 0.7333333, 0, 1,
-1.203348, -1.060831, -1.990373, 1, 0.7372549, 0, 1,
-1.196731, 1.063312, -1.493311, 1, 0.7450981, 0, 1,
-1.193132, 0.5705171, -0.9961489, 1, 0.7490196, 0, 1,
-1.156486, 0.9960698, -0.5678751, 1, 0.7568628, 0, 1,
-1.155766, -1.299186, -2.745728, 1, 0.7607843, 0, 1,
-1.153555, -0.1458427, -2.867604, 1, 0.7686275, 0, 1,
-1.135054, 0.4930347, -0.8866687, 1, 0.772549, 0, 1,
-1.134326, -0.9504208, -1.514633, 1, 0.7803922, 0, 1,
-1.131749, 1.226687, -1.656148, 1, 0.7843137, 0, 1,
-1.129817, -0.8413838, -0.6390866, 1, 0.7921569, 0, 1,
-1.127996, -1.008739, -2.057142, 1, 0.7960784, 0, 1,
-1.126983, -0.3124857, -0.4996982, 1, 0.8039216, 0, 1,
-1.125316, 0.8766124, -0.09027804, 1, 0.8117647, 0, 1,
-1.124538, 0.3611076, -1.3024, 1, 0.8156863, 0, 1,
-1.123872, -1.342018, -5.167027, 1, 0.8235294, 0, 1,
-1.12112, -0.7874846, -2.617977, 1, 0.827451, 0, 1,
-1.119924, 0.2093367, -1.900403, 1, 0.8352941, 0, 1,
-1.119463, 1.653576, -0.2725654, 1, 0.8392157, 0, 1,
-1.116982, -0.8759357, -2.517535, 1, 0.8470588, 0, 1,
-1.115311, 2.143572, -1.113479, 1, 0.8509804, 0, 1,
-1.111766, -0.3388427, -1.972126, 1, 0.8588235, 0, 1,
-1.1105, -3.579469, -2.538932, 1, 0.8627451, 0, 1,
-1.110005, -0.6765224, -2.06845, 1, 0.8705882, 0, 1,
-1.109062, -0.6289631, -3.006934, 1, 0.8745098, 0, 1,
-1.107526, 0.7300351, -1.386785, 1, 0.8823529, 0, 1,
-1.101098, -0.2168298, -1.187502, 1, 0.8862745, 0, 1,
-1.093514, -0.2926913, -2.534535, 1, 0.8941177, 0, 1,
-1.093124, 0.8303651, -0.06749578, 1, 0.8980392, 0, 1,
-1.091444, -0.7311935, -3.574764, 1, 0.9058824, 0, 1,
-1.090877, 2.197593, -1.074831, 1, 0.9137255, 0, 1,
-1.073966, -1.026121, -3.371465, 1, 0.9176471, 0, 1,
-1.073894, -1.909645, -3.103675, 1, 0.9254902, 0, 1,
-1.06683, 0.3711939, -1.992618, 1, 0.9294118, 0, 1,
-1.066465, -0.05931413, -3.050111, 1, 0.9372549, 0, 1,
-1.064991, -1.667132, -3.53966, 1, 0.9411765, 0, 1,
-1.064726, 1.418342, -1.115349, 1, 0.9490196, 0, 1,
-1.058083, 1.352099, -0.2270235, 1, 0.9529412, 0, 1,
-1.045423, 0.3955128, -2.129781, 1, 0.9607843, 0, 1,
-1.045075, -0.2499036, -1.327708, 1, 0.9647059, 0, 1,
-1.040585, 0.2622255, -1.397088, 1, 0.972549, 0, 1,
-1.036557, 1.401655, -1.587584, 1, 0.9764706, 0, 1,
-1.036366, 0.5368028, -0.1251695, 1, 0.9843137, 0, 1,
-1.035283, -0.3112575, -2.411121, 1, 0.9882353, 0, 1,
-1.034023, -0.3145564, -1.673735, 1, 0.9960784, 0, 1,
-1.031196, 0.3831295, -0.7290149, 0.9960784, 1, 0, 1,
-1.024127, 0.7117975, -0.2487679, 0.9921569, 1, 0, 1,
-1.021478, 0.2099664, -2.519779, 0.9843137, 1, 0, 1,
-1.007057, -1.118012, -2.529939, 0.9803922, 1, 0, 1,
-1.006958, 1.153272, -0.4823096, 0.972549, 1, 0, 1,
-1.003023, 0.9092148, -0.2832462, 0.9686275, 1, 0, 1,
-1.00135, -0.4494063, -2.259978, 0.9607843, 1, 0, 1,
-0.9904202, 2.521934, -0.4374869, 0.9568627, 1, 0, 1,
-0.9876305, -0.6904978, -2.607774, 0.9490196, 1, 0, 1,
-0.9829683, -1.030438, -3.564707, 0.945098, 1, 0, 1,
-0.9759516, 1.760173, -0.5567257, 0.9372549, 1, 0, 1,
-0.9729093, -0.9294293, -1.360646, 0.9333333, 1, 0, 1,
-0.9686429, 0.07513531, -0.3149624, 0.9254902, 1, 0, 1,
-0.9667476, 1.414301, 0.2256006, 0.9215686, 1, 0, 1,
-0.9643981, 0.7575094, -1.604298, 0.9137255, 1, 0, 1,
-0.9642693, 0.7381681, 1.341822, 0.9098039, 1, 0, 1,
-0.9606177, -0.09254384, -1.560109, 0.9019608, 1, 0, 1,
-0.959116, 0.219947, -3.197112, 0.8941177, 1, 0, 1,
-0.9564086, 0.1047888, -0.4980427, 0.8901961, 1, 0, 1,
-0.9546701, 0.1744215, -0.9806517, 0.8823529, 1, 0, 1,
-0.9479862, 0.2483821, -1.31252, 0.8784314, 1, 0, 1,
-0.947159, 1.004352, -1.994815, 0.8705882, 1, 0, 1,
-0.9464269, -2.061026, -3.972116, 0.8666667, 1, 0, 1,
-0.9439337, -0.005552545, -1.136312, 0.8588235, 1, 0, 1,
-0.9382514, -2.45325, -3.137112, 0.854902, 1, 0, 1,
-0.9351215, 0.2311206, -1.295891, 0.8470588, 1, 0, 1,
-0.9303895, -1.099535, -1.664921, 0.8431373, 1, 0, 1,
-0.9240421, -0.4102639, -1.337289, 0.8352941, 1, 0, 1,
-0.9223742, -0.4293497, -2.523984, 0.8313726, 1, 0, 1,
-0.9202691, 0.4914794, -0.3553578, 0.8235294, 1, 0, 1,
-0.9155185, -0.3582824, -1.790856, 0.8196079, 1, 0, 1,
-0.9115419, 1.08167, -1.801113, 0.8117647, 1, 0, 1,
-0.9030591, -0.286697, -3.065753, 0.8078431, 1, 0, 1,
-0.8813016, 1.694134, 0.3849007, 0.8, 1, 0, 1,
-0.8812532, -1.833431, -1.712338, 0.7921569, 1, 0, 1,
-0.8801641, -1.960065, -3.563879, 0.7882353, 1, 0, 1,
-0.8779271, 0.7006105, -0.2724036, 0.7803922, 1, 0, 1,
-0.8774744, -0.2606728, -1.757729, 0.7764706, 1, 0, 1,
-0.8766731, -0.6133665, -3.121229, 0.7686275, 1, 0, 1,
-0.8624896, 2.410105, 0.01485987, 0.7647059, 1, 0, 1,
-0.8620683, -0.7585815, -3.237514, 0.7568628, 1, 0, 1,
-0.8574027, -0.3505988, 0.3707214, 0.7529412, 1, 0, 1,
-0.8573337, 1.247322, -1.141066, 0.7450981, 1, 0, 1,
-0.8568719, -1.221725, -2.276158, 0.7411765, 1, 0, 1,
-0.855598, -0.3600369, -2.556239, 0.7333333, 1, 0, 1,
-0.8553267, 0.257506, -2.9537, 0.7294118, 1, 0, 1,
-0.8448213, -1.491437, -0.9255932, 0.7215686, 1, 0, 1,
-0.8444695, -0.9570152, -2.580494, 0.7176471, 1, 0, 1,
-0.8423528, -1.457553, -1.078636, 0.7098039, 1, 0, 1,
-0.8403739, 0.434093, -0.9233147, 0.7058824, 1, 0, 1,
-0.8380516, 0.2272396, -1.533766, 0.6980392, 1, 0, 1,
-0.834864, -0.1947832, -0.4063649, 0.6901961, 1, 0, 1,
-0.8335426, 0.9363809, -0.9947627, 0.6862745, 1, 0, 1,
-0.8246565, 1.990617, 0.7077528, 0.6784314, 1, 0, 1,
-0.8203381, 0.8630379, -2.205396, 0.6745098, 1, 0, 1,
-0.8166659, 1.170577, -0.661289, 0.6666667, 1, 0, 1,
-0.8120924, -1.875164, -4.247887, 0.6627451, 1, 0, 1,
-0.8082392, -1.413252, -3.355325, 0.654902, 1, 0, 1,
-0.8027171, -1.335561, -3.080475, 0.6509804, 1, 0, 1,
-0.8026663, 1.511095, -1.705759, 0.6431373, 1, 0, 1,
-0.7992107, 0.3016289, -1.8555, 0.6392157, 1, 0, 1,
-0.7939123, 0.7502198, -0.4388003, 0.6313726, 1, 0, 1,
-0.790286, 1.312225, -0.8621407, 0.627451, 1, 0, 1,
-0.7844929, -0.5430906, -2.204617, 0.6196079, 1, 0, 1,
-0.782998, 0.7328579, -2.191217, 0.6156863, 1, 0, 1,
-0.7810645, 0.7994108, -1.05478, 0.6078432, 1, 0, 1,
-0.7793601, -0.6284696, -2.215594, 0.6039216, 1, 0, 1,
-0.7793424, 0.1777076, -1.974355, 0.5960785, 1, 0, 1,
-0.7778751, -0.4661381, -4.049866, 0.5882353, 1, 0, 1,
-0.7747435, 0.9285315, 0.618258, 0.5843138, 1, 0, 1,
-0.7739319, 1.779976, -0.6913939, 0.5764706, 1, 0, 1,
-0.7720087, -1.132246, -2.537656, 0.572549, 1, 0, 1,
-0.7682017, -3.254775, -3.025164, 0.5647059, 1, 0, 1,
-0.7623692, 0.6865129, 0.1761636, 0.5607843, 1, 0, 1,
-0.7601677, 1.817349, -1.252327, 0.5529412, 1, 0, 1,
-0.7586443, -0.2025702, -2.40374, 0.5490196, 1, 0, 1,
-0.7455133, 1.44005, 0.9008962, 0.5411765, 1, 0, 1,
-0.7447168, 0.5489138, -0.7991633, 0.5372549, 1, 0, 1,
-0.7439247, -0.512308, -1.964737, 0.5294118, 1, 0, 1,
-0.743197, -0.8430418, -2.769107, 0.5254902, 1, 0, 1,
-0.7369211, 1.712752, -0.4216335, 0.5176471, 1, 0, 1,
-0.7357789, -0.1597788, -2.531174, 0.5137255, 1, 0, 1,
-0.7338949, 0.374828, -1.959172, 0.5058824, 1, 0, 1,
-0.7317048, 0.1462362, -0.2069102, 0.5019608, 1, 0, 1,
-0.7258751, 0.2439749, -2.219797, 0.4941176, 1, 0, 1,
-0.7242703, -0.4702948, -0.9359117, 0.4862745, 1, 0, 1,
-0.7208072, 0.3129023, -0.5201189, 0.4823529, 1, 0, 1,
-0.7194356, 0.428952, -1.053424, 0.4745098, 1, 0, 1,
-0.7192799, 0.8036382, 1.487483, 0.4705882, 1, 0, 1,
-0.7188948, -0.05537509, -2.068695, 0.4627451, 1, 0, 1,
-0.7177917, -0.9050986, -1.871997, 0.4588235, 1, 0, 1,
-0.704255, -0.8792111, -1.606602, 0.4509804, 1, 0, 1,
-0.7012668, -0.6493527, -1.456346, 0.4470588, 1, 0, 1,
-0.698108, -0.6362553, -1.28482, 0.4392157, 1, 0, 1,
-0.6954677, -0.7640957, -3.44554, 0.4352941, 1, 0, 1,
-0.6936213, -0.356104, -2.15677, 0.427451, 1, 0, 1,
-0.6896223, -0.3075477, -3.902554, 0.4235294, 1, 0, 1,
-0.6776313, -1.202711, -2.727348, 0.4156863, 1, 0, 1,
-0.6750882, -0.5006323, -1.788711, 0.4117647, 1, 0, 1,
-0.6728423, -0.9211673, -3.134036, 0.4039216, 1, 0, 1,
-0.6708463, 0.2939788, -1.260968, 0.3960784, 1, 0, 1,
-0.6689923, 1.630175, 1.887076, 0.3921569, 1, 0, 1,
-0.6681064, -0.2586802, -3.196078, 0.3843137, 1, 0, 1,
-0.665792, 0.6175629, -2.823029, 0.3803922, 1, 0, 1,
-0.6567507, 0.4574145, 0.4549309, 0.372549, 1, 0, 1,
-0.656454, 0.2569099, -2.653884, 0.3686275, 1, 0, 1,
-0.6562556, -1.658789, -2.200404, 0.3607843, 1, 0, 1,
-0.6550251, 0.4681952, -1.245622, 0.3568628, 1, 0, 1,
-0.65074, 1.636434, 1.746066, 0.3490196, 1, 0, 1,
-0.6487849, -0.08824788, -0.9962555, 0.345098, 1, 0, 1,
-0.6410607, 0.7285367, -0.300946, 0.3372549, 1, 0, 1,
-0.6398779, 0.8270818, -0.1293517, 0.3333333, 1, 0, 1,
-0.6393153, -0.6237928, -2.845359, 0.3254902, 1, 0, 1,
-0.6295918, -0.6571877, -2.636555, 0.3215686, 1, 0, 1,
-0.6245872, 0.3250326, -0.3012284, 0.3137255, 1, 0, 1,
-0.6188276, -0.2533395, -0.1002794, 0.3098039, 1, 0, 1,
-0.6104324, 0.8688122, 2.383847, 0.3019608, 1, 0, 1,
-0.60886, -0.5957894, -2.666613, 0.2941177, 1, 0, 1,
-0.6072065, -0.7882424, -2.347957, 0.2901961, 1, 0, 1,
-0.6006802, -0.2920115, -3.160713, 0.282353, 1, 0, 1,
-0.5987407, 0.2642923, -0.2630618, 0.2784314, 1, 0, 1,
-0.5982649, 0.7740017, -0.2814025, 0.2705882, 1, 0, 1,
-0.5893945, -0.9480303, -4.572857, 0.2666667, 1, 0, 1,
-0.5891542, 0.5340021, -2.780814, 0.2588235, 1, 0, 1,
-0.5879208, 2.190975, 0.5379255, 0.254902, 1, 0, 1,
-0.5844439, -0.333725, -2.805776, 0.2470588, 1, 0, 1,
-0.5788802, -1.216814, -3.666411, 0.2431373, 1, 0, 1,
-0.5744376, 0.1898009, 0.04621883, 0.2352941, 1, 0, 1,
-0.5667526, 0.3032488, -0.2783102, 0.2313726, 1, 0, 1,
-0.5665098, -1.702255, -2.98655, 0.2235294, 1, 0, 1,
-0.5636102, 0.8618046, -1.109352, 0.2196078, 1, 0, 1,
-0.5626714, -0.06532977, -0.05069026, 0.2117647, 1, 0, 1,
-0.5622425, 1.332246, -0.1836873, 0.2078431, 1, 0, 1,
-0.5565053, 0.5264633, -2.972764, 0.2, 1, 0, 1,
-0.5561315, 0.222238, 0.02839565, 0.1921569, 1, 0, 1,
-0.5550793, 0.5028222, 0.1252193, 0.1882353, 1, 0, 1,
-0.5548316, 0.7033281, -0.8137621, 0.1803922, 1, 0, 1,
-0.554484, 0.4373008, -0.3194268, 0.1764706, 1, 0, 1,
-0.55291, 0.2704995, -0.5805888, 0.1686275, 1, 0, 1,
-0.5463661, 1.452854, -0.6921785, 0.1647059, 1, 0, 1,
-0.5457262, -0.277133, -1.729789, 0.1568628, 1, 0, 1,
-0.545635, -0.278943, -1.628383, 0.1529412, 1, 0, 1,
-0.5423553, -0.6362017, -3.443224, 0.145098, 1, 0, 1,
-0.5382136, 0.5989299, -0.4387973, 0.1411765, 1, 0, 1,
-0.5376421, 4.269299, 1.134419, 0.1333333, 1, 0, 1,
-0.5349708, 1.600359, 0.9724441, 0.1294118, 1, 0, 1,
-0.5272413, -0.1273913, -1.696733, 0.1215686, 1, 0, 1,
-0.5247726, -1.71754, -2.743481, 0.1176471, 1, 0, 1,
-0.5242903, -0.3866713, -2.476475, 0.1098039, 1, 0, 1,
-0.5156983, 0.8934802, -0.7238802, 0.1058824, 1, 0, 1,
-0.5141187, 0.03617846, -2.103164, 0.09803922, 1, 0, 1,
-0.5101336, 1.359956, -0.8122622, 0.09019608, 1, 0, 1,
-0.5089021, -0.2254246, 1.140348, 0.08627451, 1, 0, 1,
-0.502277, -1.646692, -1.5426, 0.07843138, 1, 0, 1,
-0.500112, 2.679683, 0.3396294, 0.07450981, 1, 0, 1,
-0.4999532, -0.04290804, -1.69362, 0.06666667, 1, 0, 1,
-0.4984312, 1.445348, -1.068587, 0.0627451, 1, 0, 1,
-0.4950996, -0.4188513, -3.098545, 0.05490196, 1, 0, 1,
-0.4948608, -0.07670113, -2.46271, 0.05098039, 1, 0, 1,
-0.4929236, 0.7786884, -1.188511, 0.04313726, 1, 0, 1,
-0.4888821, 0.007662123, -2.333002, 0.03921569, 1, 0, 1,
-0.4825154, -0.4170001, -1.255191, 0.03137255, 1, 0, 1,
-0.4779055, 0.9383621, -0.1490122, 0.02745098, 1, 0, 1,
-0.4693951, 1.953236, -0.6362768, 0.01960784, 1, 0, 1,
-0.4690276, 0.3277482, -1.352711, 0.01568628, 1, 0, 1,
-0.4683687, -0.9524509, -1.506291, 0.007843138, 1, 0, 1,
-0.4664474, -1.09085, -3.481318, 0.003921569, 1, 0, 1,
-0.4662357, 1.725994, -0.5393357, 0, 1, 0.003921569, 1,
-0.4659739, 1.444597, -0.6279865, 0, 1, 0.01176471, 1,
-0.4655698, -0.5231445, -3.32194, 0, 1, 0.01568628, 1,
-0.4648688, 0.8941971, -0.9614589, 0, 1, 0.02352941, 1,
-0.4628354, 0.4957867, -1.205232, 0, 1, 0.02745098, 1,
-0.4607597, 0.6583489, -3.450903, 0, 1, 0.03529412, 1,
-0.4606126, -0.3514967, -1.807037, 0, 1, 0.03921569, 1,
-0.459039, -0.6398791, -0.6536749, 0, 1, 0.04705882, 1,
-0.4583565, 1.193863, 0.4986174, 0, 1, 0.05098039, 1,
-0.4559237, 0.2623159, -1.524246, 0, 1, 0.05882353, 1,
-0.4550266, -1.468446, -3.804983, 0, 1, 0.0627451, 1,
-0.4510455, 0.6350469, -0.6318931, 0, 1, 0.07058824, 1,
-0.449198, 0.730338, 0.01136144, 0, 1, 0.07450981, 1,
-0.448317, 0.3054498, 0.2318254, 0, 1, 0.08235294, 1,
-0.4467201, 0.3355682, -2.394133, 0, 1, 0.08627451, 1,
-0.4432309, 0.2057088, -1.84073, 0, 1, 0.09411765, 1,
-0.4423289, -0.939999, -1.868488, 0, 1, 0.1019608, 1,
-0.4414816, -0.4463964, -2.871669, 0, 1, 0.1058824, 1,
-0.4363259, 0.8320276, -0.7701665, 0, 1, 0.1137255, 1,
-0.4340622, 0.383915, 1.88385, 0, 1, 0.1176471, 1,
-0.4330062, 1.136441, -0.9542394, 0, 1, 0.1254902, 1,
-0.428629, -0.3428024, -2.295226, 0, 1, 0.1294118, 1,
-0.4220183, 1.404885, 0.8833935, 0, 1, 0.1372549, 1,
-0.4196773, -0.049015, -1.677286, 0, 1, 0.1411765, 1,
-0.4098599, -1.475442, -2.356109, 0, 1, 0.1490196, 1,
-0.4086736, -1.39601, -3.444679, 0, 1, 0.1529412, 1,
-0.4086317, -0.1740391, -1.070723, 0, 1, 0.1607843, 1,
-0.407011, 0.5441546, -0.6484632, 0, 1, 0.1647059, 1,
-0.4057827, 0.472853, -0.01678965, 0, 1, 0.172549, 1,
-0.4040678, -1.501837, -3.337063, 0, 1, 0.1764706, 1,
-0.4034334, -1.005081, -2.674121, 0, 1, 0.1843137, 1,
-0.4015842, 1.005864, -0.8288748, 0, 1, 0.1882353, 1,
-0.4008973, 1.863732, 0.9176368, 0, 1, 0.1960784, 1,
-0.3957039, -0.9659531, -3.386134, 0, 1, 0.2039216, 1,
-0.3930554, 2.683069, 0.09655511, 0, 1, 0.2078431, 1,
-0.3922737, -1.521859, -4.7986, 0, 1, 0.2156863, 1,
-0.385967, 1.885903, 0.6240596, 0, 1, 0.2196078, 1,
-0.3830036, 0.2100202, -1.305926, 0, 1, 0.227451, 1,
-0.3789272, -1.539416, -2.62878, 0, 1, 0.2313726, 1,
-0.3788831, 0.3633983, 0.6004679, 0, 1, 0.2392157, 1,
-0.3751057, 0.6222018, 0.08843795, 0, 1, 0.2431373, 1,
-0.3733676, -0.7622999, -2.689858, 0, 1, 0.2509804, 1,
-0.3731135, -0.5735209, -0.505607, 0, 1, 0.254902, 1,
-0.3722749, -0.1551908, -3.22609, 0, 1, 0.2627451, 1,
-0.3710903, 0.001215739, -0.9158528, 0, 1, 0.2666667, 1,
-0.3705468, -0.4310834, -0.4347052, 0, 1, 0.2745098, 1,
-0.368592, 0.4124663, -0.3660051, 0, 1, 0.2784314, 1,
-0.3673258, 0.4594321, 1.072287, 0, 1, 0.2862745, 1,
-0.3668287, -0.1342916, 0.3243624, 0, 1, 0.2901961, 1,
-0.3660021, 0.2185566, -0.08618311, 0, 1, 0.2980392, 1,
-0.3632995, -0.2757145, -2.6598, 0, 1, 0.3058824, 1,
-0.3611232, 1.190219, -0.5207005, 0, 1, 0.3098039, 1,
-0.3607147, -0.8643994, -4.164759, 0, 1, 0.3176471, 1,
-0.3585072, 2.703311, -0.8325864, 0, 1, 0.3215686, 1,
-0.3579276, -1.143938, -2.751461, 0, 1, 0.3294118, 1,
-0.3561459, -0.2932301, -3.045006, 0, 1, 0.3333333, 1,
-0.3559413, -1.358256, -3.485467, 0, 1, 0.3411765, 1,
-0.3518536, 0.4031589, -1.227276, 0, 1, 0.345098, 1,
-0.3512173, -0.2801849, -2.047809, 0, 1, 0.3529412, 1,
-0.3499247, -0.9762341, -3.657044, 0, 1, 0.3568628, 1,
-0.3472607, 0.710503, 0.08856557, 0, 1, 0.3647059, 1,
-0.3456993, 0.7257596, -0.2607936, 0, 1, 0.3686275, 1,
-0.344377, -0.08323665, -2.432276, 0, 1, 0.3764706, 1,
-0.3417626, 1.475137, -0.05520657, 0, 1, 0.3803922, 1,
-0.3343139, -2.264663, -3.623878, 0, 1, 0.3882353, 1,
-0.3329257, 1.610439, 0.5968017, 0, 1, 0.3921569, 1,
-0.3212195, 0.804651, 0.634773, 0, 1, 0.4, 1,
-0.3101471, 0.6743591, -0.5991288, 0, 1, 0.4078431, 1,
-0.3088981, -0.2226514, -2.46443, 0, 1, 0.4117647, 1,
-0.3074051, -0.7878999, -3.786331, 0, 1, 0.4196078, 1,
-0.303072, 1.085391, -0.05922437, 0, 1, 0.4235294, 1,
-0.3025104, -1.414225, -1.915137, 0, 1, 0.4313726, 1,
-0.3024598, -0.1137077, 0.1704306, 0, 1, 0.4352941, 1,
-0.301779, -1.593182, -2.425258, 0, 1, 0.4431373, 1,
-0.2961074, 0.4638251, -1.398536, 0, 1, 0.4470588, 1,
-0.2919746, 0.2517588, -0.6240917, 0, 1, 0.454902, 1,
-0.2893703, 1.412266, 2.107742, 0, 1, 0.4588235, 1,
-0.2855384, -0.7156314, -3.069511, 0, 1, 0.4666667, 1,
-0.2716715, -1.34218, -4.826071, 0, 1, 0.4705882, 1,
-0.2708079, -1.15962, -3.339367, 0, 1, 0.4784314, 1,
-0.2679739, -0.02842226, -2.91085, 0, 1, 0.4823529, 1,
-0.265808, -0.6144372, -2.728579, 0, 1, 0.4901961, 1,
-0.2653217, 0.05332562, -2.836314, 0, 1, 0.4941176, 1,
-0.261535, 0.04324682, -0.8486658, 0, 1, 0.5019608, 1,
-0.2612869, 0.7392734, 1.087704, 0, 1, 0.509804, 1,
-0.2600704, 2.902668, -0.7995242, 0, 1, 0.5137255, 1,
-0.258122, 0.07321022, -0.8950527, 0, 1, 0.5215687, 1,
-0.254517, -0.4739904, -1.25669, 0, 1, 0.5254902, 1,
-0.2531173, -0.9849943, -3.300928, 0, 1, 0.5333334, 1,
-0.2463815, 1.644066, 0.4643884, 0, 1, 0.5372549, 1,
-0.2458157, -1.352381, -2.871867, 0, 1, 0.5450981, 1,
-0.2453533, -0.6212295, -3.356959, 0, 1, 0.5490196, 1,
-0.2451198, 1.397768, -0.8687583, 0, 1, 0.5568628, 1,
-0.2434831, 0.2604249, -1.331071, 0, 1, 0.5607843, 1,
-0.2413605, -1.457439, -3.692735, 0, 1, 0.5686275, 1,
-0.2407168, 0.7875875, -3.001168, 0, 1, 0.572549, 1,
-0.2404516, -0.6271455, -3.439088, 0, 1, 0.5803922, 1,
-0.2382619, 1.157251, -0.3175188, 0, 1, 0.5843138, 1,
-0.2361183, -1.219545, -1.719498, 0, 1, 0.5921569, 1,
-0.2353797, 1.27408, 1.837532, 0, 1, 0.5960785, 1,
-0.2329871, 2.707897, -0.8366987, 0, 1, 0.6039216, 1,
-0.2308019, 0.1084094, -0.7694445, 0, 1, 0.6117647, 1,
-0.2294764, 0.5910044, -0.8003914, 0, 1, 0.6156863, 1,
-0.2293547, 0.05134704, -1.596217, 0, 1, 0.6235294, 1,
-0.2284486, -0.04945066, -1.899193, 0, 1, 0.627451, 1,
-0.2282686, 1.580472, -0.4630976, 0, 1, 0.6352941, 1,
-0.2276157, -1.972511, -4.070918, 0, 1, 0.6392157, 1,
-0.2264211, 1.321915, 0.6533691, 0, 1, 0.6470588, 1,
-0.2245619, 1.194083, 0.0134655, 0, 1, 0.6509804, 1,
-0.2216581, -1.409835, -4.293312, 0, 1, 0.6588235, 1,
-0.2192509, -0.03377884, -3.021003, 0, 1, 0.6627451, 1,
-0.2172615, -0.1350731, -2.430497, 0, 1, 0.6705883, 1,
-0.2171759, -0.5197583, -3.365514, 0, 1, 0.6745098, 1,
-0.2131217, -0.3725456, -1.246965, 0, 1, 0.682353, 1,
-0.2130662, -0.2575559, -5.139262, 0, 1, 0.6862745, 1,
-0.2100785, 0.4008968, -1.719444, 0, 1, 0.6941177, 1,
-0.205791, -1.088007, -3.27041, 0, 1, 0.7019608, 1,
-0.2057212, -0.6337034, -3.601839, 0, 1, 0.7058824, 1,
-0.204027, 1.489482, 0.4594925, 0, 1, 0.7137255, 1,
-0.2036841, -1.344347, -1.55016, 0, 1, 0.7176471, 1,
-0.2007555, -1.87052, -3.034178, 0, 1, 0.7254902, 1,
-0.1963463, 0.4023483, -3.374275, 0, 1, 0.7294118, 1,
-0.1943552, -1.231159, -2.439319, 0, 1, 0.7372549, 1,
-0.1931931, 0.5321974, -1.356675, 0, 1, 0.7411765, 1,
-0.1891157, -0.3432032, -2.752299, 0, 1, 0.7490196, 1,
-0.1818468, -0.1788708, -1.24584, 0, 1, 0.7529412, 1,
-0.1809491, 0.6133718, -0.1655447, 0, 1, 0.7607843, 1,
-0.180111, 2.975178, 1.571184, 0, 1, 0.7647059, 1,
-0.174576, -0.31922, -3.500598, 0, 1, 0.772549, 1,
-0.173602, 0.4746301, 1.388836, 0, 1, 0.7764706, 1,
-0.170929, -0.09608518, -4.15415, 0, 1, 0.7843137, 1,
-0.1695382, -0.8913025, -2.854243, 0, 1, 0.7882353, 1,
-0.1684081, 1.501556, -1.434609, 0, 1, 0.7960784, 1,
-0.1663139, -1.546613, -2.926651, 0, 1, 0.8039216, 1,
-0.1640999, -0.2757293, -3.119645, 0, 1, 0.8078431, 1,
-0.1619627, 0.3542853, 0.294497, 0, 1, 0.8156863, 1,
-0.1603839, -0.6358027, -2.620432, 0, 1, 0.8196079, 1,
-0.1598946, 0.6033362, -0.8617197, 0, 1, 0.827451, 1,
-0.1559641, 0.695923, 1.478993, 0, 1, 0.8313726, 1,
-0.1543962, -0.7016279, -1.705643, 0, 1, 0.8392157, 1,
-0.1538976, 0.2656195, 0.2923406, 0, 1, 0.8431373, 1,
-0.1466614, -0.3320473, -2.509547, 0, 1, 0.8509804, 1,
-0.146167, -0.05870598, -1.1053, 0, 1, 0.854902, 1,
-0.1453158, 1.038296, 0.4934807, 0, 1, 0.8627451, 1,
-0.1419012, -1.311575, -2.312315, 0, 1, 0.8666667, 1,
-0.1403539, 1.000157, -1.574213, 0, 1, 0.8745098, 1,
-0.1401117, -0.3239449, -2.135323, 0, 1, 0.8784314, 1,
-0.1381245, 1.283511, -0.7654043, 0, 1, 0.8862745, 1,
-0.1370663, 0.8214428, -1.169095, 0, 1, 0.8901961, 1,
-0.136708, 1.178645, -0.5393101, 0, 1, 0.8980392, 1,
-0.1341806, 0.5603363, 0.1344809, 0, 1, 0.9058824, 1,
-0.1340465, 1.15895, 0.7773421, 0, 1, 0.9098039, 1,
-0.1319482, -1.113054, -3.272778, 0, 1, 0.9176471, 1,
-0.1256156, -1.350545, -2.0668, 0, 1, 0.9215686, 1,
-0.1212588, -0.597132, -2.977059, 0, 1, 0.9294118, 1,
-0.1176381, -0.7362804, -4.563679, 0, 1, 0.9333333, 1,
-0.1135094, -0.7724043, -1.742724, 0, 1, 0.9411765, 1,
-0.1103438, 0.7716055, 0.07907053, 0, 1, 0.945098, 1,
-0.1092075, 0.7076285, 0.8037227, 0, 1, 0.9529412, 1,
-0.1082336, -1.766104, -3.607124, 0, 1, 0.9568627, 1,
-0.1059711, 1.682231, 0.5335563, 0, 1, 0.9647059, 1,
-0.1056657, 0.3245858, -0.132151, 0, 1, 0.9686275, 1,
-0.1051187, 0.5212615, -0.6480055, 0, 1, 0.9764706, 1,
-0.1019414, 0.5186281, 0.8021876, 0, 1, 0.9803922, 1,
-0.1012438, -0.1992598, -1.513666, 0, 1, 0.9882353, 1,
-0.09687999, 0.1107061, -0.1097885, 0, 1, 0.9921569, 1,
-0.09638227, -2.948777, -3.743807, 0, 1, 1, 1,
-0.09615902, 1.353654, 0.07565074, 0, 0.9921569, 1, 1,
-0.09604264, 0.3012595, 0.06924486, 0, 0.9882353, 1, 1,
-0.09528293, -0.2312923, -3.28392, 0, 0.9803922, 1, 1,
-0.09332757, 0.727695, -0.08476097, 0, 0.9764706, 1, 1,
-0.09017371, -1.265119, -3.012645, 0, 0.9686275, 1, 1,
-0.08890868, 1.283826, 1.256645, 0, 0.9647059, 1, 1,
-0.0851422, 0.4869955, -1.137734, 0, 0.9568627, 1, 1,
-0.08043871, -0.115158, -2.40635, 0, 0.9529412, 1, 1,
-0.08000086, 1.773108, 0.2206878, 0, 0.945098, 1, 1,
-0.07726315, 1.198913, 0.3225622, 0, 0.9411765, 1, 1,
-0.07535363, -2.182231, -2.194588, 0, 0.9333333, 1, 1,
-0.06064158, -0.904149, -3.703487, 0, 0.9294118, 1, 1,
-0.05698752, 0.2865947, 0.04885122, 0, 0.9215686, 1, 1,
-0.05113032, -0.1764772, -2.252577, 0, 0.9176471, 1, 1,
-0.05050089, -1.257347, -4.014338, 0, 0.9098039, 1, 1,
-0.05002252, -0.6092901, -5.305612, 0, 0.9058824, 1, 1,
-0.04685756, -0.8832153, -0.8629535, 0, 0.8980392, 1, 1,
-0.04469535, -0.03610224, -2.059329, 0, 0.8901961, 1, 1,
-0.0446017, -0.3071129, -3.398378, 0, 0.8862745, 1, 1,
-0.04321883, 0.003320013, -2.692339, 0, 0.8784314, 1, 1,
-0.04093153, -0.8090046, -1.791508, 0, 0.8745098, 1, 1,
-0.03639235, -0.4101714, -3.812882, 0, 0.8666667, 1, 1,
-0.03557282, 0.2765127, -1.445448, 0, 0.8627451, 1, 1,
-0.03411369, -0.6312, -2.724134, 0, 0.854902, 1, 1,
-0.03350591, 0.37316, -0.2545758, 0, 0.8509804, 1, 1,
-0.0312307, -0.241866, -2.684978, 0, 0.8431373, 1, 1,
-0.03112679, -0.1651429, -4.494716, 0, 0.8392157, 1, 1,
-0.03057774, 0.6292306, 0.3287149, 0, 0.8313726, 1, 1,
-0.03033222, -0.5492035, -2.301568, 0, 0.827451, 1, 1,
-0.02978221, -0.2435002, -4.836076, 0, 0.8196079, 1, 1,
-0.02579367, -0.7004182, -2.959767, 0, 0.8156863, 1, 1,
-0.02314119, 0.5710971, 0.8148152, 0, 0.8078431, 1, 1,
-0.02173176, 0.3918878, 0.3967829, 0, 0.8039216, 1, 1,
-0.01895113, -2.175667, -5.056222, 0, 0.7960784, 1, 1,
-0.01187719, 0.03828345, 0.7113523, 0, 0.7882353, 1, 1,
-0.01171488, -0.8524823, -2.625878, 0, 0.7843137, 1, 1,
-0.00830851, -0.4466192, -2.76447, 0, 0.7764706, 1, 1,
-0.007191835, -0.7296346, -4.182423, 0, 0.772549, 1, 1,
-0.005271799, -0.6162865, -2.866951, 0, 0.7647059, 1, 1,
-0.004775727, 0.7554713, -0.6604083, 0, 0.7607843, 1, 1,
-0.002799601, 1.028644, 0.8088409, 0, 0.7529412, 1, 1,
-0.001737117, 1.0013, -0.5850381, 0, 0.7490196, 1, 1,
-0.001382176, 0.4235809, -1.930732, 0, 0.7411765, 1, 1,
0.00114262, -0.1730215, 3.77495, 0, 0.7372549, 1, 1,
0.00273515, -0.7602984, 2.643154, 0, 0.7294118, 1, 1,
0.003675696, -0.6792739, 1.607955, 0, 0.7254902, 1, 1,
0.005085093, 1.74947, -1.126213, 0, 0.7176471, 1, 1,
0.008635961, -0.2430886, 2.28837, 0, 0.7137255, 1, 1,
0.01566178, 0.4991241, -0.4609851, 0, 0.7058824, 1, 1,
0.0188882, -0.3663781, 4.09001, 0, 0.6980392, 1, 1,
0.02640833, 0.273159, 0.7992768, 0, 0.6941177, 1, 1,
0.02657984, -0.2362334, 3.210581, 0, 0.6862745, 1, 1,
0.0342459, 0.897661, 0.6028085, 0, 0.682353, 1, 1,
0.0438718, -0.5753339, 3.581545, 0, 0.6745098, 1, 1,
0.04895822, 0.05480563, 0.647937, 0, 0.6705883, 1, 1,
0.05153594, -0.05197032, 3.086938, 0, 0.6627451, 1, 1,
0.05173789, 1.174669, 1.936331, 0, 0.6588235, 1, 1,
0.05226162, -2.241121, 3.078145, 0, 0.6509804, 1, 1,
0.05844454, -1.674954, 3.567165, 0, 0.6470588, 1, 1,
0.05914275, 1.8629, 0.9842669, 0, 0.6392157, 1, 1,
0.06060879, -0.5069878, 2.799309, 0, 0.6352941, 1, 1,
0.06274763, 1.061082, 0.008285115, 0, 0.627451, 1, 1,
0.06417189, -0.4190029, 3.07125, 0, 0.6235294, 1, 1,
0.07084287, -0.004166448, 1.655335, 0, 0.6156863, 1, 1,
0.07363184, 0.5304327, 0.5472419, 0, 0.6117647, 1, 1,
0.0755202, -0.1498571, 1.646155, 0, 0.6039216, 1, 1,
0.07598583, 0.3387596, 0.7909145, 0, 0.5960785, 1, 1,
0.07669602, 0.5348706, -0.1289047, 0, 0.5921569, 1, 1,
0.08090977, 0.1028084, 0.837694, 0, 0.5843138, 1, 1,
0.081509, -1.140117, 1.981594, 0, 0.5803922, 1, 1,
0.08269107, 1.648445, 1.377348, 0, 0.572549, 1, 1,
0.08879867, 0.0399649, 0.964917, 0, 0.5686275, 1, 1,
0.09094519, -1.301629, 2.211, 0, 0.5607843, 1, 1,
0.09636762, -0.1277639, 1.353463, 0, 0.5568628, 1, 1,
0.09745127, -1.087599, 4.797551, 0, 0.5490196, 1, 1,
0.09811205, 0.2414244, 1.830737, 0, 0.5450981, 1, 1,
0.1035942, 0.1251595, 0.3339998, 0, 0.5372549, 1, 1,
0.1051359, -1.164438, 2.51244, 0, 0.5333334, 1, 1,
0.1056117, 0.03568982, 0.7640041, 0, 0.5254902, 1, 1,
0.1094005, -0.3642382, 3.412528, 0, 0.5215687, 1, 1,
0.1142142, -3.126312, 2.354132, 0, 0.5137255, 1, 1,
0.1176255, -0.3977327, 1.920509, 0, 0.509804, 1, 1,
0.1201212, -1.67987, 1.234945, 0, 0.5019608, 1, 1,
0.122452, -1.34367, 4.288533, 0, 0.4941176, 1, 1,
0.1261096, 1.687842, -0.4322509, 0, 0.4901961, 1, 1,
0.1262032, -0.2829986, 1.382282, 0, 0.4823529, 1, 1,
0.1306808, -1.097406, 4.634287, 0, 0.4784314, 1, 1,
0.1335241, -1.18608, 3.131999, 0, 0.4705882, 1, 1,
0.1341224, -1.014614, 4.291146, 0, 0.4666667, 1, 1,
0.1351358, 0.9628493, -0.8981116, 0, 0.4588235, 1, 1,
0.1354634, -1.487388, 3.871807, 0, 0.454902, 1, 1,
0.1361581, -0.8694121, 3.146821, 0, 0.4470588, 1, 1,
0.1384691, 0.9774644, -0.1338337, 0, 0.4431373, 1, 1,
0.1402828, -0.3490982, 1.94304, 0, 0.4352941, 1, 1,
0.1417056, 0.579, 0.08764122, 0, 0.4313726, 1, 1,
0.1483074, 0.621152, 0.9198841, 0, 0.4235294, 1, 1,
0.151457, 1.338995, 1.567949, 0, 0.4196078, 1, 1,
0.1530865, 0.605066, -0.4536217, 0, 0.4117647, 1, 1,
0.1541306, -0.2068856, 1.662323, 0, 0.4078431, 1, 1,
0.1569814, -0.7539602, 3.490346, 0, 0.4, 1, 1,
0.1618892, -1.266216, 3.91247, 0, 0.3921569, 1, 1,
0.1619944, -0.8058001, 2.142146, 0, 0.3882353, 1, 1,
0.1665445, -0.7268907, 1.70463, 0, 0.3803922, 1, 1,
0.1716515, 1.050023, 3.101674, 0, 0.3764706, 1, 1,
0.1717952, -1.202596, 4.502481, 0, 0.3686275, 1, 1,
0.183564, -0.3007623, 3.393903, 0, 0.3647059, 1, 1,
0.185755, 0.8556084, 0.8391817, 0, 0.3568628, 1, 1,
0.1875474, 1.813922, 1.919969, 0, 0.3529412, 1, 1,
0.1911215, 0.4163366, 0.8444601, 0, 0.345098, 1, 1,
0.1921681, 0.2740865, -0.3324044, 0, 0.3411765, 1, 1,
0.194048, -0.8749759, 2.397501, 0, 0.3333333, 1, 1,
0.1973844, -0.9535277, 3.507317, 0, 0.3294118, 1, 1,
0.202644, -0.8275332, 2.243262, 0, 0.3215686, 1, 1,
0.2068702, -0.3248976, 3.582304, 0, 0.3176471, 1, 1,
0.2074098, -0.5263363, 4.356674, 0, 0.3098039, 1, 1,
0.2085425, 1.970817, -0.03437629, 0, 0.3058824, 1, 1,
0.2090194, -0.480122, 3.035856, 0, 0.2980392, 1, 1,
0.2106789, -0.7118952, 2.573631, 0, 0.2901961, 1, 1,
0.2121413, 0.2981137, 1.803031, 0, 0.2862745, 1, 1,
0.2132405, 2.102859, 0.2604446, 0, 0.2784314, 1, 1,
0.2132948, 0.2086926, 0.5533228, 0, 0.2745098, 1, 1,
0.215213, 1.583625, 0.5696088, 0, 0.2666667, 1, 1,
0.2167799, -1.177271, 2.860468, 0, 0.2627451, 1, 1,
0.220214, 0.4635084, 2.032895, 0, 0.254902, 1, 1,
0.2232687, 1.347567, 0.7179035, 0, 0.2509804, 1, 1,
0.2267005, -0.4049479, 2.857545, 0, 0.2431373, 1, 1,
0.2289343, 0.3924497, 2.219313, 0, 0.2392157, 1, 1,
0.2321982, 0.3595894, 2.023664, 0, 0.2313726, 1, 1,
0.2344231, -1.118457, 2.305577, 0, 0.227451, 1, 1,
0.2395582, -0.3778892, 3.487818, 0, 0.2196078, 1, 1,
0.2425766, -0.3965572, 3.007459, 0, 0.2156863, 1, 1,
0.2444704, -0.5385611, 1.884442, 0, 0.2078431, 1, 1,
0.2453688, -2.208835, 0.9410549, 0, 0.2039216, 1, 1,
0.2533469, 0.7529448, -2.598907, 0, 0.1960784, 1, 1,
0.2545298, 2.178388, -1.467838, 0, 0.1882353, 1, 1,
0.2554894, 0.6510807, 0.4527415, 0, 0.1843137, 1, 1,
0.2577298, 1.216874, 0.9079326, 0, 0.1764706, 1, 1,
0.258474, 2.755799, 0.3296666, 0, 0.172549, 1, 1,
0.2586827, 0.2206193, 0.9370055, 0, 0.1647059, 1, 1,
0.2609932, 1.622975, -0.4705992, 0, 0.1607843, 1, 1,
0.2620484, -0.6555508, 3.32927, 0, 0.1529412, 1, 1,
0.2624837, 0.6102425, 0.7590153, 0, 0.1490196, 1, 1,
0.2636858, 1.169635, -1.806559, 0, 0.1411765, 1, 1,
0.2662627, 1.23691, 0.8786603, 0, 0.1372549, 1, 1,
0.2668205, 1.128412, 1.644346, 0, 0.1294118, 1, 1,
0.2669057, -0.9063118, 1.908371, 0, 0.1254902, 1, 1,
0.2682418, 0.5405409, 0.7142474, 0, 0.1176471, 1, 1,
0.2694454, -1.213268, 1.481054, 0, 0.1137255, 1, 1,
0.2753675, -2.005043, 2.665431, 0, 0.1058824, 1, 1,
0.2754361, -0.3617767, 2.937615, 0, 0.09803922, 1, 1,
0.2761135, 0.5455734, 1.262257, 0, 0.09411765, 1, 1,
0.2768076, -0.08024128, 1.028397, 0, 0.08627451, 1, 1,
0.2813294, 0.8581452, 0.9122751, 0, 0.08235294, 1, 1,
0.2837907, 0.6491637, 1.023567, 0, 0.07450981, 1, 1,
0.2925657, 0.8092871, 0.4771966, 0, 0.07058824, 1, 1,
0.2930085, -0.4320944, 3.070094, 0, 0.0627451, 1, 1,
0.3027361, 0.04991359, 1.831822, 0, 0.05882353, 1, 1,
0.3131423, -0.1440773, -0.1669486, 0, 0.05098039, 1, 1,
0.3203527, -1.124172, 3.360232, 0, 0.04705882, 1, 1,
0.3229093, -0.1977972, 1.859499, 0, 0.03921569, 1, 1,
0.3234714, 0.1580727, 0.8481395, 0, 0.03529412, 1, 1,
0.3235051, -1.134716, 3.268905, 0, 0.02745098, 1, 1,
0.3239191, 0.6906545, -1.413799, 0, 0.02352941, 1, 1,
0.3255253, 1.127735, 0.9256408, 0, 0.01568628, 1, 1,
0.3257631, 2.520232, -0.015584, 0, 0.01176471, 1, 1,
0.3283569, -0.1025493, 0.5860653, 0, 0.003921569, 1, 1,
0.3408509, 1.412825, -1.926234, 0.003921569, 0, 1, 1,
0.3408583, 0.08396431, 1.698146, 0.007843138, 0, 1, 1,
0.3412255, 0.4112855, 0.9290415, 0.01568628, 0, 1, 1,
0.3444995, 0.2388901, 0.704754, 0.01960784, 0, 1, 1,
0.3586664, 0.7367002, 0.09155668, 0.02745098, 0, 1, 1,
0.3602417, 0.5175607, -0.1287908, 0.03137255, 0, 1, 1,
0.368561, 1.579303, -0.3431263, 0.03921569, 0, 1, 1,
0.3731263, 0.6412279, 0.9363813, 0.04313726, 0, 1, 1,
0.3744847, -1.462049, 3.896383, 0.05098039, 0, 1, 1,
0.3789334, -0.7001273, 0.9284635, 0.05490196, 0, 1, 1,
0.3832072, 1.270618, -0.7975845, 0.0627451, 0, 1, 1,
0.38416, 0.4760456, 0.05619215, 0.06666667, 0, 1, 1,
0.3854822, -0.6173542, 3.995725, 0.07450981, 0, 1, 1,
0.3863721, 1.866367, 0.6902589, 0.07843138, 0, 1, 1,
0.3864864, 1.363441, 1.52599, 0.08627451, 0, 1, 1,
0.3932975, 1.189273, -0.7012469, 0.09019608, 0, 1, 1,
0.3957737, -0.5168341, 2.326774, 0.09803922, 0, 1, 1,
0.3960383, -0.6042755, 2.516755, 0.1058824, 0, 1, 1,
0.3994826, 0.4604066, 0.2326913, 0.1098039, 0, 1, 1,
0.4037464, -0.736385, 1.923333, 0.1176471, 0, 1, 1,
0.4063974, -1.134616, 2.702389, 0.1215686, 0, 1, 1,
0.4101527, -0.587783, 3.839583, 0.1294118, 0, 1, 1,
0.4102296, -0.1694228, 0.5796783, 0.1333333, 0, 1, 1,
0.4242798, 0.03034794, 1.76058, 0.1411765, 0, 1, 1,
0.4309677, 1.736587, 1.099005, 0.145098, 0, 1, 1,
0.4317082, 0.7936053, 2.002063, 0.1529412, 0, 1, 1,
0.4344781, -1.494776, 4.749612, 0.1568628, 0, 1, 1,
0.4380525, -0.2827044, 4.417291, 0.1647059, 0, 1, 1,
0.4385783, -1.38618, 2.801352, 0.1686275, 0, 1, 1,
0.4417783, 0.2652893, 0.4923783, 0.1764706, 0, 1, 1,
0.4433342, -0.2219805, 1.997891, 0.1803922, 0, 1, 1,
0.445073, 0.4927095, 0.7797203, 0.1882353, 0, 1, 1,
0.4453084, -1.351058, 2.255575, 0.1921569, 0, 1, 1,
0.4526416, -0.6344481, 1.191383, 0.2, 0, 1, 1,
0.455865, 0.2263069, 1.200836, 0.2078431, 0, 1, 1,
0.45825, 1.722719, 0.2493668, 0.2117647, 0, 1, 1,
0.4648972, -1.186464, 0.8291407, 0.2196078, 0, 1, 1,
0.4650006, -1.32279, 3.119517, 0.2235294, 0, 1, 1,
0.4715692, 0.1777934, 1.571101, 0.2313726, 0, 1, 1,
0.4731282, 0.1363607, 1.366385, 0.2352941, 0, 1, 1,
0.4739426, 1.223432, 0.6738935, 0.2431373, 0, 1, 1,
0.4778669, 0.07111158, 2.716781, 0.2470588, 0, 1, 1,
0.4783352, 1.129959, 0.7599227, 0.254902, 0, 1, 1,
0.4821727, -0.07324551, 1.049295, 0.2588235, 0, 1, 1,
0.4866661, -0.1209737, 2.144521, 0.2666667, 0, 1, 1,
0.4873804, 0.5067831, 0.08100352, 0.2705882, 0, 1, 1,
0.4875314, 0.3917795, 1.367562, 0.2784314, 0, 1, 1,
0.4950922, 1.116461, -0.2554675, 0.282353, 0, 1, 1,
0.5023116, -0.3558224, 4.257402, 0.2901961, 0, 1, 1,
0.5039138, 1.24361, 0.3636779, 0.2941177, 0, 1, 1,
0.5089447, -0.9217361, 3.317928, 0.3019608, 0, 1, 1,
0.5111341, 0.2974097, 1.453254, 0.3098039, 0, 1, 1,
0.5172346, 0.4538349, 1.237816, 0.3137255, 0, 1, 1,
0.5213984, 1.363457, -0.5720286, 0.3215686, 0, 1, 1,
0.5216938, 0.9088576, 1.257061, 0.3254902, 0, 1, 1,
0.5263526, -1.473179, 3.366312, 0.3333333, 0, 1, 1,
0.5272844, 1.211935, 1.157447, 0.3372549, 0, 1, 1,
0.5329149, 0.2568576, 1.183075, 0.345098, 0, 1, 1,
0.533863, -1.085416, 2.709668, 0.3490196, 0, 1, 1,
0.5364895, 0.1236217, 0.7373369, 0.3568628, 0, 1, 1,
0.5434976, -1.333961, 1.35853, 0.3607843, 0, 1, 1,
0.5449076, -0.2139771, 0.4648466, 0.3686275, 0, 1, 1,
0.5465629, 0.4414791, 1.563483, 0.372549, 0, 1, 1,
0.556453, 0.3387793, -0.2071015, 0.3803922, 0, 1, 1,
0.5638701, 1.313418, -0.2691939, 0.3843137, 0, 1, 1,
0.5665505, -0.5247608, 2.990205, 0.3921569, 0, 1, 1,
0.5666347, 0.5901269, 1.341892, 0.3960784, 0, 1, 1,
0.5671641, 1.920332, -0.2732778, 0.4039216, 0, 1, 1,
0.5682145, 0.6642267, -0.06222105, 0.4117647, 0, 1, 1,
0.5725994, 1.64435, 1.47937, 0.4156863, 0, 1, 1,
0.5734114, 1.498693, 0.9562696, 0.4235294, 0, 1, 1,
0.5738724, 0.1076685, 2.652123, 0.427451, 0, 1, 1,
0.5748008, 0.05767081, 3.272234, 0.4352941, 0, 1, 1,
0.5752261, 2.100271, 0.409558, 0.4392157, 0, 1, 1,
0.578616, 0.5112002, 0.9874414, 0.4470588, 0, 1, 1,
0.5786316, -0.05279107, 1.473286, 0.4509804, 0, 1, 1,
0.5803241, 1.25986, -0.2035877, 0.4588235, 0, 1, 1,
0.5804656, 0.9588049, 0.1219899, 0.4627451, 0, 1, 1,
0.5872654, -0.1359821, 2.179895, 0.4705882, 0, 1, 1,
0.5921939, 0.004276011, 0.6046045, 0.4745098, 0, 1, 1,
0.5996447, 0.08958977, 2.455512, 0.4823529, 0, 1, 1,
0.6095679, -1.08599, 2.815781, 0.4862745, 0, 1, 1,
0.609921, 0.1976293, 2.114314, 0.4941176, 0, 1, 1,
0.6108789, -0.9693621, 1.419671, 0.5019608, 0, 1, 1,
0.6115209, 0.6171525, 0.7902033, 0.5058824, 0, 1, 1,
0.6133529, -1.502886, 3.65846, 0.5137255, 0, 1, 1,
0.6136431, -0.7112503, 2.292427, 0.5176471, 0, 1, 1,
0.6147987, -0.1178367, 1.774816, 0.5254902, 0, 1, 1,
0.6206471, 0.4407934, 1.12889, 0.5294118, 0, 1, 1,
0.6211064, 1.748259, 0.740554, 0.5372549, 0, 1, 1,
0.621551, 1.062414, -0.04612645, 0.5411765, 0, 1, 1,
0.6219232, -0.3223126, 0.5378863, 0.5490196, 0, 1, 1,
0.6274922, -0.763194, 1.271511, 0.5529412, 0, 1, 1,
0.6322991, 0.4650969, 0.7927517, 0.5607843, 0, 1, 1,
0.6372675, 0.5557374, 0.3922201, 0.5647059, 0, 1, 1,
0.6390092, -0.7823802, 2.105044, 0.572549, 0, 1, 1,
0.6391065, 1.760555, 0.1159145, 0.5764706, 0, 1, 1,
0.640814, 1.309505, -0.558038, 0.5843138, 0, 1, 1,
0.6453955, 0.4021496, -0.8831219, 0.5882353, 0, 1, 1,
0.6620958, -1.499333, 2.180172, 0.5960785, 0, 1, 1,
0.665608, -0.07282516, 2.65571, 0.6039216, 0, 1, 1,
0.6670843, 2.539673, -1.291278, 0.6078432, 0, 1, 1,
0.6672087, 0.7242188, 1.125417, 0.6156863, 0, 1, 1,
0.6726947, 0.917614, 1.793654, 0.6196079, 0, 1, 1,
0.6728982, -0.3191186, 1.867461, 0.627451, 0, 1, 1,
0.6764058, 1.357405, -0.4070341, 0.6313726, 0, 1, 1,
0.6769416, 1.589236, -0.1027349, 0.6392157, 0, 1, 1,
0.6820142, 0.4959975, 0.3683623, 0.6431373, 0, 1, 1,
0.6854463, 0.4144538, 0.841791, 0.6509804, 0, 1, 1,
0.6858709, 2.130475, -0.338264, 0.654902, 0, 1, 1,
0.6898196, -0.6909716, 2.788452, 0.6627451, 0, 1, 1,
0.7023578, -0.4855408, 3.180978, 0.6666667, 0, 1, 1,
0.7156296, -1.164587, 1.862354, 0.6745098, 0, 1, 1,
0.7193431, 0.5485185, 0.8384922, 0.6784314, 0, 1, 1,
0.7257649, -0.6954625, 2.309416, 0.6862745, 0, 1, 1,
0.7270592, 1.09452, 1.345389, 0.6901961, 0, 1, 1,
0.7272331, -1.669881, 2.757706, 0.6980392, 0, 1, 1,
0.7347423, 2.236061, -0.03888478, 0.7058824, 0, 1, 1,
0.7379679, -2.552367, 4.80179, 0.7098039, 0, 1, 1,
0.7430348, 0.02364089, 3.349028, 0.7176471, 0, 1, 1,
0.7490425, -0.8632617, 2.288008, 0.7215686, 0, 1, 1,
0.757059, 1.274446, 1.316574, 0.7294118, 0, 1, 1,
0.760743, -2.682892, 3.587082, 0.7333333, 0, 1, 1,
0.7730071, 0.4795462, 2.417462, 0.7411765, 0, 1, 1,
0.7779933, -0.3946193, 2.714155, 0.7450981, 0, 1, 1,
0.778694, 0.4052191, 1.792717, 0.7529412, 0, 1, 1,
0.7826906, 0.989625, 0.07886221, 0.7568628, 0, 1, 1,
0.7866385, 0.3398817, 0.509485, 0.7647059, 0, 1, 1,
0.7885217, -1.06604, 3.596127, 0.7686275, 0, 1, 1,
0.793154, -1.581124, 3.107739, 0.7764706, 0, 1, 1,
0.7933952, 0.7931059, 2.139221, 0.7803922, 0, 1, 1,
0.8015181, 0.4304018, 0.3621927, 0.7882353, 0, 1, 1,
0.803031, -2.935303, 3.175262, 0.7921569, 0, 1, 1,
0.8045235, 0.3966437, 0.3052451, 0.8, 0, 1, 1,
0.8056272, -1.444591, 3.523024, 0.8078431, 0, 1, 1,
0.8075761, 0.04452796, 2.021857, 0.8117647, 0, 1, 1,
0.8093997, 0.2534159, 1.197027, 0.8196079, 0, 1, 1,
0.8118998, 0.2747673, 0.7877555, 0.8235294, 0, 1, 1,
0.8123411, -0.7259994, 0.9146907, 0.8313726, 0, 1, 1,
0.8126103, -1.294103, 2.948751, 0.8352941, 0, 1, 1,
0.8153067, 0.3723865, 1.26302, 0.8431373, 0, 1, 1,
0.8157333, 1.080159, -0.3665267, 0.8470588, 0, 1, 1,
0.8446612, -0.3662335, 3.168074, 0.854902, 0, 1, 1,
0.8535075, -1.1093, 2.068386, 0.8588235, 0, 1, 1,
0.8643644, -0.3864946, 3.166637, 0.8666667, 0, 1, 1,
0.870204, 0.3513718, 0.7085496, 0.8705882, 0, 1, 1,
0.8704875, -0.2786872, 1.732464, 0.8784314, 0, 1, 1,
0.8760018, -0.02947901, 2.565623, 0.8823529, 0, 1, 1,
0.8819331, 0.1734365, 2.894471, 0.8901961, 0, 1, 1,
0.888425, 0.9222826, 0.8362262, 0.8941177, 0, 1, 1,
0.8914289, 0.8279927, 1.013427, 0.9019608, 0, 1, 1,
0.8991311, -0.9078246, 2.698384, 0.9098039, 0, 1, 1,
0.8994107, 0.5561387, 0.960745, 0.9137255, 0, 1, 1,
0.9110295, -0.3099474, 2.571305, 0.9215686, 0, 1, 1,
0.9158062, -0.3126626, 0.188296, 0.9254902, 0, 1, 1,
0.920067, -0.7126061, 3.622581, 0.9333333, 0, 1, 1,
0.9253941, -1.173264, 2.982302, 0.9372549, 0, 1, 1,
0.9357024, -0.9288293, 1.75804, 0.945098, 0, 1, 1,
0.9367437, -0.6930511, 2.340507, 0.9490196, 0, 1, 1,
0.9442731, 0.6894131, 0.6796591, 0.9568627, 0, 1, 1,
0.9471601, -0.2859199, 3.298948, 0.9607843, 0, 1, 1,
0.9508579, 1.345366, 1.793309, 0.9686275, 0, 1, 1,
0.9516613, 0.4821694, 2.385263, 0.972549, 0, 1, 1,
0.9547213, 0.06353171, 2.67, 0.9803922, 0, 1, 1,
0.9568124, 0.3402023, 0.1177552, 0.9843137, 0, 1, 1,
0.9589184, -0.120623, 1.733967, 0.9921569, 0, 1, 1,
0.9613738, 0.3206986, 2.116487, 0.9960784, 0, 1, 1,
0.9624916, 0.3176715, 1.671485, 1, 0, 0.9960784, 1,
0.9628091, -0.5582824, 1.716368, 1, 0, 0.9882353, 1,
0.9635137, 0.3857116, 0.603571, 1, 0, 0.9843137, 1,
0.9641199, -0.9827807, 2.082727, 1, 0, 0.9764706, 1,
0.967801, -1.435458, 4.196004, 1, 0, 0.972549, 1,
0.9704221, 0.4529819, 1.917467, 1, 0, 0.9647059, 1,
0.9705284, 0.2144268, 0.1361066, 1, 0, 0.9607843, 1,
0.9725283, -1.734842, 3.289365, 1, 0, 0.9529412, 1,
0.9735494, -0.8974752, 2.380887, 1, 0, 0.9490196, 1,
0.984455, -0.2184582, 2.033504, 1, 0, 0.9411765, 1,
0.9910647, -1.804434, 1.829082, 1, 0, 0.9372549, 1,
0.9918277, -0.8066316, 2.271409, 1, 0, 0.9294118, 1,
1.005931, 0.8585145, 0.8646525, 1, 0, 0.9254902, 1,
1.01044, 0.5661568, 0.5707144, 1, 0, 0.9176471, 1,
1.01372, -1.151226, 2.219516, 1, 0, 0.9137255, 1,
1.017676, -0.3452875, 1.64048, 1, 0, 0.9058824, 1,
1.024634, 1.673072, 2.941365, 1, 0, 0.9019608, 1,
1.026053, 0.2685093, 1.544336, 1, 0, 0.8941177, 1,
1.028993, -0.827368, 0.5252057, 1, 0, 0.8862745, 1,
1.03508, 0.6187194, 1.261452, 1, 0, 0.8823529, 1,
1.037216, 0.03046675, 1.921252, 1, 0, 0.8745098, 1,
1.042176, 0.4908988, 0.7169555, 1, 0, 0.8705882, 1,
1.049277, 0.1981038, 0.6663446, 1, 0, 0.8627451, 1,
1.058851, 1.669921, 0.7242296, 1, 0, 0.8588235, 1,
1.060401, -1.590525, 3.968623, 1, 0, 0.8509804, 1,
1.067677, 2.122679, -1.592481, 1, 0, 0.8470588, 1,
1.068119, 1.030381, -0.1271218, 1, 0, 0.8392157, 1,
1.069301, -0.3281384, 2.300741, 1, 0, 0.8352941, 1,
1.081344, -0.3082277, 0.9412382, 1, 0, 0.827451, 1,
1.085865, -0.4585338, 1.598868, 1, 0, 0.8235294, 1,
1.095576, 2.432208, 1.443424, 1, 0, 0.8156863, 1,
1.095666, -2.484821, 2.316494, 1, 0, 0.8117647, 1,
1.097441, 0.3620835, 0.1338784, 1, 0, 0.8039216, 1,
1.099545, 0.6274694, 2.42315, 1, 0, 0.7960784, 1,
1.100433, -1.812973, 2.91177, 1, 0, 0.7921569, 1,
1.102532, 1.517473, -0.5997849, 1, 0, 0.7843137, 1,
1.114203, -0.01180122, 1.591698, 1, 0, 0.7803922, 1,
1.117406, -0.8128063, 2.488878, 1, 0, 0.772549, 1,
1.120664, -1.863838, -0.4528769, 1, 0, 0.7686275, 1,
1.121435, 0.6094055, 1.70272, 1, 0, 0.7607843, 1,
1.12728, -0.06259459, 1.607645, 1, 0, 0.7568628, 1,
1.128814, 0.2932566, 2.493483, 1, 0, 0.7490196, 1,
1.145402, -1.017794, 2.096737, 1, 0, 0.7450981, 1,
1.149064, -0.7322327, 0.143011, 1, 0, 0.7372549, 1,
1.150027, -0.1281702, 3.59376, 1, 0, 0.7333333, 1,
1.152312, 0.3329006, 0.1922043, 1, 0, 0.7254902, 1,
1.167934, 0.1708088, 3.359807, 1, 0, 0.7215686, 1,
1.17928, 0.6618439, 0.6275488, 1, 0, 0.7137255, 1,
1.185046, -0.7522778, 0.9154186, 1, 0, 0.7098039, 1,
1.198227, 0.206729, 2.217418, 1, 0, 0.7019608, 1,
1.20627, 0.4886365, 1.651687, 1, 0, 0.6941177, 1,
1.213102, -1.737162, 3.460319, 1, 0, 0.6901961, 1,
1.213325, -0.4617178, 0.7783649, 1, 0, 0.682353, 1,
1.21396, -0.7022087, 3.760593, 1, 0, 0.6784314, 1,
1.222447, -0.9972278, 4.047933, 1, 0, 0.6705883, 1,
1.231037, 0.9192439, 1.707579, 1, 0, 0.6666667, 1,
1.239421, 0.6137229, 0.4374489, 1, 0, 0.6588235, 1,
1.246711, 0.2951679, 1.484025, 1, 0, 0.654902, 1,
1.285298, 1.75382, -0.7285066, 1, 0, 0.6470588, 1,
1.289587, 0.5259149, 1.527364, 1, 0, 0.6431373, 1,
1.29026, 0.6944629, -0.6181187, 1, 0, 0.6352941, 1,
1.296184, 2.883859, 1.141629, 1, 0, 0.6313726, 1,
1.298747, -0.2034836, 4.008727, 1, 0, 0.6235294, 1,
1.298775, 0.3540656, 1.381454, 1, 0, 0.6196079, 1,
1.304294, 0.4010794, 0.4080651, 1, 0, 0.6117647, 1,
1.305628, -1.011183, 0.9501461, 1, 0, 0.6078432, 1,
1.308762, -0.724218, 1.375528, 1, 0, 0.6, 1,
1.319632, -0.6720357, 3.182135, 1, 0, 0.5921569, 1,
1.341845, -0.7029333, 1.763688, 1, 0, 0.5882353, 1,
1.342548, 0.5968423, 1.420844, 1, 0, 0.5803922, 1,
1.343657, 0.3534025, 2.16116, 1, 0, 0.5764706, 1,
1.352244, 0.4713427, 2.691743, 1, 0, 0.5686275, 1,
1.352737, -1.660477, 2.651508, 1, 0, 0.5647059, 1,
1.353126, 0.3975586, 0.8595468, 1, 0, 0.5568628, 1,
1.35497, -1.423944, 1.692641, 1, 0, 0.5529412, 1,
1.357887, -0.2292425, 3.400126, 1, 0, 0.5450981, 1,
1.358808, 0.2038384, 2.168939, 1, 0, 0.5411765, 1,
1.361551, 0.5718466, -0.4272144, 1, 0, 0.5333334, 1,
1.365496, 2.2767, -0.466912, 1, 0, 0.5294118, 1,
1.370029, 0.1703935, 1.976889, 1, 0, 0.5215687, 1,
1.379387, 0.7827681, 1.428341, 1, 0, 0.5176471, 1,
1.38118, -1.78194, 2.179947, 1, 0, 0.509804, 1,
1.385676, -0.6027324, 0.9618383, 1, 0, 0.5058824, 1,
1.385836, -1.500255, 1.962433, 1, 0, 0.4980392, 1,
1.393947, 0.2411014, 1.910489, 1, 0, 0.4901961, 1,
1.40393, 1.171454, 0.7737514, 1, 0, 0.4862745, 1,
1.413872, 1.153719, 2.589673, 1, 0, 0.4784314, 1,
1.459794, -1.695878, 2.418025, 1, 0, 0.4745098, 1,
1.473825, 1.572354, 0.9724262, 1, 0, 0.4666667, 1,
1.481491, 0.55185, 0.203767, 1, 0, 0.4627451, 1,
1.48324, 0.5011351, 1.293806, 1, 0, 0.454902, 1,
1.492262, -1.359121, 2.572565, 1, 0, 0.4509804, 1,
1.495047, -0.1129196, 0.7840062, 1, 0, 0.4431373, 1,
1.495619, -1.082324, 1.432117, 1, 0, 0.4392157, 1,
1.514089, 0.5652015, 0.5668316, 1, 0, 0.4313726, 1,
1.51544, 1.738408, -0.2973297, 1, 0, 0.427451, 1,
1.522369, 1.603062, -0.9508564, 1, 0, 0.4196078, 1,
1.543614, -0.1196032, 0.5788378, 1, 0, 0.4156863, 1,
1.557079, 1.357228, 1.114663, 1, 0, 0.4078431, 1,
1.563025, 1.446948, -0.02923393, 1, 0, 0.4039216, 1,
1.572546, 0.2827471, 1.801928, 1, 0, 0.3960784, 1,
1.5782, 1.826612, -0.4112742, 1, 0, 0.3882353, 1,
1.580953, -1.285022, 1.334511, 1, 0, 0.3843137, 1,
1.586657, 0.6608611, 1.793113, 1, 0, 0.3764706, 1,
1.595361, -1.5476, 0.8157027, 1, 0, 0.372549, 1,
1.601601, 0.6756783, -0.1578912, 1, 0, 0.3647059, 1,
1.624227, 0.2648182, 1.332428, 1, 0, 0.3607843, 1,
1.641194, -0.8280013, 3.014349, 1, 0, 0.3529412, 1,
1.64994, -0.03335589, 2.115746, 1, 0, 0.3490196, 1,
1.651419, 0.1284262, 0.9714647, 1, 0, 0.3411765, 1,
1.667493, -0.4072916, 2.171525, 1, 0, 0.3372549, 1,
1.678776, 1.232679, 0.9637232, 1, 0, 0.3294118, 1,
1.692183, -0.2086418, -0.1801343, 1, 0, 0.3254902, 1,
1.693091, -1.970546, 3.534174, 1, 0, 0.3176471, 1,
1.701186, -0.4885042, 1.357585, 1, 0, 0.3137255, 1,
1.702661, 0.002489419, 2.979248, 1, 0, 0.3058824, 1,
1.705205, -1.517889, 3.992968, 1, 0, 0.2980392, 1,
1.720692, 1.47176, 1.946896, 1, 0, 0.2941177, 1,
1.721123, -0.1209469, 1.96276, 1, 0, 0.2862745, 1,
1.724683, 0.09724651, 2.275726, 1, 0, 0.282353, 1,
1.732159, 0.6289245, 2.547042, 1, 0, 0.2745098, 1,
1.741799, 0.2724432, 0.3310119, 1, 0, 0.2705882, 1,
1.749754, 0.04934195, 0.4230473, 1, 0, 0.2627451, 1,
1.750009, 0.5917084, 1.152349, 1, 0, 0.2588235, 1,
1.768611, 0.7597569, 2.144469, 1, 0, 0.2509804, 1,
1.785617, 1.376486, 2.728694, 1, 0, 0.2470588, 1,
1.829743, 2.092067, 0.9097788, 1, 0, 0.2392157, 1,
1.834222, -0.05478043, 5.485051, 1, 0, 0.2352941, 1,
1.866005, 0.3936129, 0.9452342, 1, 0, 0.227451, 1,
1.866305, 0.263245, 2.720423, 1, 0, 0.2235294, 1,
1.879464, 0.6728134, 2.704047, 1, 0, 0.2156863, 1,
1.883705, 0.1109668, 0.5029142, 1, 0, 0.2117647, 1,
1.889763, -1.186782, 2.746448, 1, 0, 0.2039216, 1,
1.892654, 0.5937008, 0.8899425, 1, 0, 0.1960784, 1,
1.905912, 1.449844, 1.568376, 1, 0, 0.1921569, 1,
1.910642, -1.006095, 2.15905, 1, 0, 0.1843137, 1,
1.959451, 0.3720966, 1.650607, 1, 0, 0.1803922, 1,
1.963304, 1.009981, 1.864776, 1, 0, 0.172549, 1,
1.974752, -0.7150089, 0.9908288, 1, 0, 0.1686275, 1,
2.015615, 0.6026617, -0.0177077, 1, 0, 0.1607843, 1,
2.018754, 1.239294, 1.011705, 1, 0, 0.1568628, 1,
2.043907, 2.510064, 1.810298, 1, 0, 0.1490196, 1,
2.044867, -0.848397, 3.179544, 1, 0, 0.145098, 1,
2.072109, 1.260732, 2.083234, 1, 0, 0.1372549, 1,
2.085017, -0.3628907, 1.058688, 1, 0, 0.1333333, 1,
2.121577, -1.260476, 2.016993, 1, 0, 0.1254902, 1,
2.139392, 2.104142, 1.347399, 1, 0, 0.1215686, 1,
2.14461, 0.01191765, 2.163, 1, 0, 0.1137255, 1,
2.145451, -0.1201079, 1.67177, 1, 0, 0.1098039, 1,
2.150949, -1.538632, 1.885582, 1, 0, 0.1019608, 1,
2.191642, -0.6022786, 2.044422, 1, 0, 0.09411765, 1,
2.19619, 0.8386238, 0.417644, 1, 0, 0.09019608, 1,
2.217412, 0.03418881, 0.9042246, 1, 0, 0.08235294, 1,
2.259251, -0.111798, 1.095594, 1, 0, 0.07843138, 1,
2.320884, 0.9772393, 0.8071118, 1, 0, 0.07058824, 1,
2.359619, 0.6059042, 0.06680571, 1, 0, 0.06666667, 1,
2.394919, -1.468377, 1.257498, 1, 0, 0.05882353, 1,
2.411621, 0.2919337, 0.2508149, 1, 0, 0.05490196, 1,
2.538052, 1.152642, 2.186865, 1, 0, 0.04705882, 1,
2.584066, -0.1961898, 1.928164, 1, 0, 0.04313726, 1,
2.738635, -0.3355854, 2.080001, 1, 0, 0.03529412, 1,
2.757629, -1.246421, 2.135061, 1, 0, 0.03137255, 1,
2.770139, 0.1443932, -0.4588062, 1, 0, 0.02352941, 1,
3.112418, -0.7453678, 1.43972, 1, 0, 0.01960784, 1,
3.196031, 0.5712248, 3.270728, 1, 0, 0.01176471, 1,
3.287633, 1.366241, 1.844653, 1, 0, 0.007843138, 1
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
-0.003531337, -4.909835, -7.13463, 0, -0.5, 0.5, 0.5,
-0.003531337, -4.909835, -7.13463, 1, -0.5, 0.5, 0.5,
-0.003531337, -4.909835, -7.13463, 1, 1.5, 0.5, 0.5,
-0.003531337, -4.909835, -7.13463, 0, 1.5, 0.5, 0.5
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
-4.4104, 0.3449149, -7.13463, 0, -0.5, 0.5, 0.5,
-4.4104, 0.3449149, -7.13463, 1, -0.5, 0.5, 0.5,
-4.4104, 0.3449149, -7.13463, 1, 1.5, 0.5, 0.5,
-4.4104, 0.3449149, -7.13463, 0, 1.5, 0.5, 0.5
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
-4.4104, -4.909835, 0.08971953, 0, -0.5, 0.5, 0.5,
-4.4104, -4.909835, 0.08971953, 1, -0.5, 0.5, 0.5,
-4.4104, -4.909835, 0.08971953, 1, 1.5, 0.5, 0.5,
-4.4104, -4.909835, 0.08971953, 0, 1.5, 0.5, 0.5
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
-3, -3.697201, -5.467472,
3, -3.697201, -5.467472,
-3, -3.697201, -5.467472,
-3, -3.899307, -5.745332,
-2, -3.697201, -5.467472,
-2, -3.899307, -5.745332,
-1, -3.697201, -5.467472,
-1, -3.899307, -5.745332,
0, -3.697201, -5.467472,
0, -3.899307, -5.745332,
1, -3.697201, -5.467472,
1, -3.899307, -5.745332,
2, -3.697201, -5.467472,
2, -3.899307, -5.745332,
3, -3.697201, -5.467472,
3, -3.899307, -5.745332
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
-3, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
-3, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
-3, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
-3, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
-2, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
-2, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
-2, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
-2, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
-1, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
-1, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
-1, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
-1, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
0, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
0, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
0, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
0, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
1, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
1, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
1, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
1, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
2, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
2, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
2, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
2, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5,
3, -4.303518, -6.301051, 0, -0.5, 0.5, 0.5,
3, -4.303518, -6.301051, 1, -0.5, 0.5, 0.5,
3, -4.303518, -6.301051, 1, 1.5, 0.5, 0.5,
3, -4.303518, -6.301051, 0, 1.5, 0.5, 0.5
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
-3.39343, -2, -5.467472,
-3.39343, 4, -5.467472,
-3.39343, -2, -5.467472,
-3.562926, -2, -5.745332,
-3.39343, 0, -5.467472,
-3.562926, 0, -5.745332,
-3.39343, 2, -5.467472,
-3.562926, 2, -5.745332,
-3.39343, 4, -5.467472,
-3.562926, 4, -5.745332
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
-3.901915, -2, -6.301051, 0, -0.5, 0.5, 0.5,
-3.901915, -2, -6.301051, 1, -0.5, 0.5, 0.5,
-3.901915, -2, -6.301051, 1, 1.5, 0.5, 0.5,
-3.901915, -2, -6.301051, 0, 1.5, 0.5, 0.5,
-3.901915, 0, -6.301051, 0, -0.5, 0.5, 0.5,
-3.901915, 0, -6.301051, 1, -0.5, 0.5, 0.5,
-3.901915, 0, -6.301051, 1, 1.5, 0.5, 0.5,
-3.901915, 0, -6.301051, 0, 1.5, 0.5, 0.5,
-3.901915, 2, -6.301051, 0, -0.5, 0.5, 0.5,
-3.901915, 2, -6.301051, 1, -0.5, 0.5, 0.5,
-3.901915, 2, -6.301051, 1, 1.5, 0.5, 0.5,
-3.901915, 2, -6.301051, 0, 1.5, 0.5, 0.5,
-3.901915, 4, -6.301051, 0, -0.5, 0.5, 0.5,
-3.901915, 4, -6.301051, 1, -0.5, 0.5, 0.5,
-3.901915, 4, -6.301051, 1, 1.5, 0.5, 0.5,
-3.901915, 4, -6.301051, 0, 1.5, 0.5, 0.5
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
-3.39343, -3.697201, -4,
-3.39343, -3.697201, 4,
-3.39343, -3.697201, -4,
-3.562926, -3.899307, -4,
-3.39343, -3.697201, -2,
-3.562926, -3.899307, -2,
-3.39343, -3.697201, 0,
-3.562926, -3.899307, 0,
-3.39343, -3.697201, 2,
-3.562926, -3.899307, 2,
-3.39343, -3.697201, 4,
-3.562926, -3.899307, 4
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
-3.901915, -4.303518, -4, 0, -0.5, 0.5, 0.5,
-3.901915, -4.303518, -4, 1, -0.5, 0.5, 0.5,
-3.901915, -4.303518, -4, 1, 1.5, 0.5, 0.5,
-3.901915, -4.303518, -4, 0, 1.5, 0.5, 0.5,
-3.901915, -4.303518, -2, 0, -0.5, 0.5, 0.5,
-3.901915, -4.303518, -2, 1, -0.5, 0.5, 0.5,
-3.901915, -4.303518, -2, 1, 1.5, 0.5, 0.5,
-3.901915, -4.303518, -2, 0, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 0, 0, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 0, 1, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 0, 1, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 0, 0, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 2, 0, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 2, 1, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 2, 1, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 2, 0, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 4, 0, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 4, 1, -0.5, 0.5, 0.5,
-3.901915, -4.303518, 4, 1, 1.5, 0.5, 0.5,
-3.901915, -4.303518, 4, 0, 1.5, 0.5, 0.5
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
-3.39343, -3.697201, -5.467472,
-3.39343, 4.387031, -5.467472,
-3.39343, -3.697201, 5.646911,
-3.39343, 4.387031, 5.646911,
-3.39343, -3.697201, -5.467472,
-3.39343, -3.697201, 5.646911,
-3.39343, 4.387031, -5.467472,
-3.39343, 4.387031, 5.646911,
-3.39343, -3.697201, -5.467472,
3.386368, -3.697201, -5.467472,
-3.39343, -3.697201, 5.646911,
3.386368, -3.697201, 5.646911,
-3.39343, 4.387031, -5.467472,
3.386368, 4.387031, -5.467472,
-3.39343, 4.387031, 5.646911,
3.386368, 4.387031, 5.646911,
3.386368, -3.697201, -5.467472,
3.386368, 4.387031, -5.467472,
3.386368, -3.697201, 5.646911,
3.386368, 4.387031, 5.646911,
3.386368, -3.697201, -5.467472,
3.386368, -3.697201, 5.646911,
3.386368, 4.387031, -5.467472,
3.386368, 4.387031, 5.646911
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
var radius = 8.183154;
var distance = 36.40777;
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
mvMatrix.translate( 0.003531337, -0.3449149, -0.08971953 );
mvMatrix.scale( 1.305022, 1.09445, 0.7960663 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.40777);
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
5-pentyloxolan-2-one<-read.table("5-pentyloxolan-2-one.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-5-pentyloxolan-2-one$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentyloxolan' not found
```

```r
y<-5-pentyloxolan-2-one$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentyloxolan' not found
```

```r
z<-5-pentyloxolan-2-one$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentyloxolan' not found
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
-3.294696, -0.3360065, -2.248368, 0, 0, 1, 1, 1,
-2.865426, -0.9522402, -1.805114, 1, 0, 0, 1, 1,
-2.714092, -1.318774, -4.347636, 1, 0, 0, 1, 1,
-2.679067, 0.4827009, -4.076195, 1, 0, 0, 1, 1,
-2.634874, 2.169729, -1.715182, 1, 0, 0, 1, 1,
-2.502247, 0.4701154, -1.713881, 1, 0, 0, 1, 1,
-2.501037, 0.3347989, -0.5859616, 0, 0, 0, 1, 1,
-2.495702, 0.4659505, -2.109175, 0, 0, 0, 1, 1,
-2.482548, 0.4155927, -1.72915, 0, 0, 0, 1, 1,
-2.441707, -0.2061074, -1.059395, 0, 0, 0, 1, 1,
-2.434071, -1.098843, -1.191879, 0, 0, 0, 1, 1,
-2.348569, -0.04705717, -2.878194, 0, 0, 0, 1, 1,
-2.300773, 0.6785444, -1.142138, 0, 0, 0, 1, 1,
-2.266098, 0.7926582, 1.253502, 1, 1, 1, 1, 1,
-2.241701, 0.1670027, -0.3004525, 1, 1, 1, 1, 1,
-2.239697, 1.329669, -0.4613408, 1, 1, 1, 1, 1,
-2.227569, -1.994236, -2.48758, 1, 1, 1, 1, 1,
-2.14017, -0.6227959, -2.346504, 1, 1, 1, 1, 1,
-2.122037, 0.7679948, -1.393414, 1, 1, 1, 1, 1,
-2.109425, 0.1119057, -1.165458, 1, 1, 1, 1, 1,
-2.094419, -0.1268954, -2.294969, 1, 1, 1, 1, 1,
-2.088834, -0.1347516, -1.462461, 1, 1, 1, 1, 1,
-2.086942, -2.169462, -1.879994, 1, 1, 1, 1, 1,
-2.075476, 0.3808577, -1.48342, 1, 1, 1, 1, 1,
-2.068034, 0.3855111, -2.983228, 1, 1, 1, 1, 1,
-2.065825, 0.2399123, -1.84457, 1, 1, 1, 1, 1,
-2.054598, 0.4253716, -0.9021381, 1, 1, 1, 1, 1,
-2.021248, -0.4679177, -1.553131, 1, 1, 1, 1, 1,
-2.009641, 0.488932, -1.896918, 0, 0, 1, 1, 1,
-1.987721, 2.192104, -0.5236, 1, 0, 0, 1, 1,
-1.987298, -0.5934349, -1.335832, 1, 0, 0, 1, 1,
-1.957868, 1.111054, -0.1531713, 1, 0, 0, 1, 1,
-1.954659, -0.4924373, -0.1588466, 1, 0, 0, 1, 1,
-1.944993, 0.6048747, -0.8484608, 1, 0, 0, 1, 1,
-1.944727, 1.214637, 0.09879464, 0, 0, 0, 1, 1,
-1.913433, 0.9435196, -2.464543, 0, 0, 0, 1, 1,
-1.902579, 0.2593463, -2.040906, 0, 0, 0, 1, 1,
-1.902456, -0.6142963, -0.9150377, 0, 0, 0, 1, 1,
-1.900368, 0.8728141, -1.833377, 0, 0, 0, 1, 1,
-1.898114, -1.612161, -2.642047, 0, 0, 0, 1, 1,
-1.879357, 0.3576126, -2.816867, 0, 0, 0, 1, 1,
-1.875459, 0.1144698, -0.1834353, 1, 1, 1, 1, 1,
-1.86008, 0.2471273, -1.559708, 1, 1, 1, 1, 1,
-1.850065, 0.6891756, -0.6573763, 1, 1, 1, 1, 1,
-1.820326, 2.129751, 0.5336347, 1, 1, 1, 1, 1,
-1.814718, -0.009478853, -1.80902, 1, 1, 1, 1, 1,
-1.809055, -0.1178342, -1.840265, 1, 1, 1, 1, 1,
-1.802666, -0.7761821, -1.952076, 1, 1, 1, 1, 1,
-1.785697, -1.270203, -1.562703, 1, 1, 1, 1, 1,
-1.769769, 0.07665366, -3.41876, 1, 1, 1, 1, 1,
-1.762655, 0.6549674, -2.481957, 1, 1, 1, 1, 1,
-1.743956, 1.721826, -0.1518295, 1, 1, 1, 1, 1,
-1.73478, -0.01188875, -1.14343, 1, 1, 1, 1, 1,
-1.712726, -0.5448971, -2.358084, 1, 1, 1, 1, 1,
-1.686576, -0.4522111, -0.9078039, 1, 1, 1, 1, 1,
-1.683231, 1.677632, -0.2723483, 1, 1, 1, 1, 1,
-1.676341, -0.588249, -2.288111, 0, 0, 1, 1, 1,
-1.628825, 0.06200313, -0.2308894, 1, 0, 0, 1, 1,
-1.622787, -1.355906, -0.7772654, 1, 0, 0, 1, 1,
-1.619632, 1.566427, -3.288352, 1, 0, 0, 1, 1,
-1.618666, -1.836905, -2.731976, 1, 0, 0, 1, 1,
-1.618065, -0.2391311, -0.7629574, 1, 0, 0, 1, 1,
-1.613279, -0.3780642, -3.40821, 0, 0, 0, 1, 1,
-1.612689, -1.343717, -3.147141, 0, 0, 0, 1, 1,
-1.611417, -2.381639, -3.141031, 0, 0, 0, 1, 1,
-1.605572, -0.1025517, -2.393488, 0, 0, 0, 1, 1,
-1.598702, -1.063875, -3.223581, 0, 0, 0, 1, 1,
-1.578707, 1.802986, -1.271264, 0, 0, 0, 1, 1,
-1.572888, -1.208073, -1.669919, 0, 0, 0, 1, 1,
-1.533531, 0.4304897, -1.748083, 1, 1, 1, 1, 1,
-1.51741, 1.144845, 0.1631643, 1, 1, 1, 1, 1,
-1.513631, -1.245756, -2.504733, 1, 1, 1, 1, 1,
-1.507604, 0.08822992, -1.876622, 1, 1, 1, 1, 1,
-1.500637, 0.1012618, 1.773104, 1, 1, 1, 1, 1,
-1.500191, -0.4451782, -0.2054395, 1, 1, 1, 1, 1,
-1.493229, -0.6902387, -4.310052, 1, 1, 1, 1, 1,
-1.468057, -0.5620781, -0.05124043, 1, 1, 1, 1, 1,
-1.467566, -0.5905133, -1.841092, 1, 1, 1, 1, 1,
-1.467471, 0.3866975, -1.904547, 1, 1, 1, 1, 1,
-1.467337, 0.244851, -0.0606554, 1, 1, 1, 1, 1,
-1.465702, -0.3697768, -2.129622, 1, 1, 1, 1, 1,
-1.461855, -0.6126917, -1.497576, 1, 1, 1, 1, 1,
-1.451334, -0.4514219, -1.537749, 1, 1, 1, 1, 1,
-1.44714, -0.7366668, -3.189017, 1, 1, 1, 1, 1,
-1.431554, 1.26377, -0.6239188, 0, 0, 1, 1, 1,
-1.417792, 0.5863606, -0.9359133, 1, 0, 0, 1, 1,
-1.412424, 3.236149, 0.8792287, 1, 0, 0, 1, 1,
-1.408932, 0.8850039, -2.04277, 1, 0, 0, 1, 1,
-1.398853, 1.467061, -0.2398862, 1, 0, 0, 1, 1,
-1.390255, 0.8370354, -3.552233, 1, 0, 0, 1, 1,
-1.389646, -0.4364214, -2.022149, 0, 0, 0, 1, 1,
-1.377021, 0.599923, -1.116129, 0, 0, 0, 1, 1,
-1.365843, -0.485495, -0.9796099, 0, 0, 0, 1, 1,
-1.360999, -0.5543842, -3.127928, 0, 0, 0, 1, 1,
-1.358415, -0.4992375, -2.796229, 0, 0, 0, 1, 1,
-1.354372, -0.7112821, -1.611242, 0, 0, 0, 1, 1,
-1.351662, 1.505411, -0.7388753, 0, 0, 0, 1, 1,
-1.344119, 1.063344, -0.6969896, 1, 1, 1, 1, 1,
-1.336494, -0.1512471, -2.098752, 1, 1, 1, 1, 1,
-1.332753, -0.9573009, -2.625149, 1, 1, 1, 1, 1,
-1.332074, 1.056183, -0.1011713, 1, 1, 1, 1, 1,
-1.315779, 0.9126249, -1.338997, 1, 1, 1, 1, 1,
-1.31292, 1.259109, -1.084039, 1, 1, 1, 1, 1,
-1.305059, -1.147922, -1.639737, 1, 1, 1, 1, 1,
-1.300721, 0.6553299, -0.6307621, 1, 1, 1, 1, 1,
-1.294258, 0.4980645, -1.414199, 1, 1, 1, 1, 1,
-1.290715, 0.04322157, -1.254335, 1, 1, 1, 1, 1,
-1.28919, 1.755902, -1.654644, 1, 1, 1, 1, 1,
-1.283593, 1.7574, 0.8918281, 1, 1, 1, 1, 1,
-1.283561, -0.9159724, -1.291069, 1, 1, 1, 1, 1,
-1.283135, -0.4020821, -2.531213, 1, 1, 1, 1, 1,
-1.276488, -0.5154601, -1.674458, 1, 1, 1, 1, 1,
-1.252508, -1.140194, -0.5510251, 0, 0, 1, 1, 1,
-1.241522, -0.2413936, -2.685914, 1, 0, 0, 1, 1,
-1.241037, 1.433176, 0.9822119, 1, 0, 0, 1, 1,
-1.232308, -0.8696717, -3.349113, 1, 0, 0, 1, 1,
-1.227344, -1.425545, -3.257284, 1, 0, 0, 1, 1,
-1.2152, 1.640692, 1.153089, 1, 0, 0, 1, 1,
-1.214175, -0.3545789, -3.626869, 0, 0, 0, 1, 1,
-1.213931, 0.0663621, -3.28558, 0, 0, 0, 1, 1,
-1.213869, 0.02714761, -2.561711, 0, 0, 0, 1, 1,
-1.207507, 0.2484243, -0.4108668, 0, 0, 0, 1, 1,
-1.203935, 0.01141916, -2.2354, 0, 0, 0, 1, 1,
-1.203348, -1.060831, -1.990373, 0, 0, 0, 1, 1,
-1.196731, 1.063312, -1.493311, 0, 0, 0, 1, 1,
-1.193132, 0.5705171, -0.9961489, 1, 1, 1, 1, 1,
-1.156486, 0.9960698, -0.5678751, 1, 1, 1, 1, 1,
-1.155766, -1.299186, -2.745728, 1, 1, 1, 1, 1,
-1.153555, -0.1458427, -2.867604, 1, 1, 1, 1, 1,
-1.135054, 0.4930347, -0.8866687, 1, 1, 1, 1, 1,
-1.134326, -0.9504208, -1.514633, 1, 1, 1, 1, 1,
-1.131749, 1.226687, -1.656148, 1, 1, 1, 1, 1,
-1.129817, -0.8413838, -0.6390866, 1, 1, 1, 1, 1,
-1.127996, -1.008739, -2.057142, 1, 1, 1, 1, 1,
-1.126983, -0.3124857, -0.4996982, 1, 1, 1, 1, 1,
-1.125316, 0.8766124, -0.09027804, 1, 1, 1, 1, 1,
-1.124538, 0.3611076, -1.3024, 1, 1, 1, 1, 1,
-1.123872, -1.342018, -5.167027, 1, 1, 1, 1, 1,
-1.12112, -0.7874846, -2.617977, 1, 1, 1, 1, 1,
-1.119924, 0.2093367, -1.900403, 1, 1, 1, 1, 1,
-1.119463, 1.653576, -0.2725654, 0, 0, 1, 1, 1,
-1.116982, -0.8759357, -2.517535, 1, 0, 0, 1, 1,
-1.115311, 2.143572, -1.113479, 1, 0, 0, 1, 1,
-1.111766, -0.3388427, -1.972126, 1, 0, 0, 1, 1,
-1.1105, -3.579469, -2.538932, 1, 0, 0, 1, 1,
-1.110005, -0.6765224, -2.06845, 1, 0, 0, 1, 1,
-1.109062, -0.6289631, -3.006934, 0, 0, 0, 1, 1,
-1.107526, 0.7300351, -1.386785, 0, 0, 0, 1, 1,
-1.101098, -0.2168298, -1.187502, 0, 0, 0, 1, 1,
-1.093514, -0.2926913, -2.534535, 0, 0, 0, 1, 1,
-1.093124, 0.8303651, -0.06749578, 0, 0, 0, 1, 1,
-1.091444, -0.7311935, -3.574764, 0, 0, 0, 1, 1,
-1.090877, 2.197593, -1.074831, 0, 0, 0, 1, 1,
-1.073966, -1.026121, -3.371465, 1, 1, 1, 1, 1,
-1.073894, -1.909645, -3.103675, 1, 1, 1, 1, 1,
-1.06683, 0.3711939, -1.992618, 1, 1, 1, 1, 1,
-1.066465, -0.05931413, -3.050111, 1, 1, 1, 1, 1,
-1.064991, -1.667132, -3.53966, 1, 1, 1, 1, 1,
-1.064726, 1.418342, -1.115349, 1, 1, 1, 1, 1,
-1.058083, 1.352099, -0.2270235, 1, 1, 1, 1, 1,
-1.045423, 0.3955128, -2.129781, 1, 1, 1, 1, 1,
-1.045075, -0.2499036, -1.327708, 1, 1, 1, 1, 1,
-1.040585, 0.2622255, -1.397088, 1, 1, 1, 1, 1,
-1.036557, 1.401655, -1.587584, 1, 1, 1, 1, 1,
-1.036366, 0.5368028, -0.1251695, 1, 1, 1, 1, 1,
-1.035283, -0.3112575, -2.411121, 1, 1, 1, 1, 1,
-1.034023, -0.3145564, -1.673735, 1, 1, 1, 1, 1,
-1.031196, 0.3831295, -0.7290149, 1, 1, 1, 1, 1,
-1.024127, 0.7117975, -0.2487679, 0, 0, 1, 1, 1,
-1.021478, 0.2099664, -2.519779, 1, 0, 0, 1, 1,
-1.007057, -1.118012, -2.529939, 1, 0, 0, 1, 1,
-1.006958, 1.153272, -0.4823096, 1, 0, 0, 1, 1,
-1.003023, 0.9092148, -0.2832462, 1, 0, 0, 1, 1,
-1.00135, -0.4494063, -2.259978, 1, 0, 0, 1, 1,
-0.9904202, 2.521934, -0.4374869, 0, 0, 0, 1, 1,
-0.9876305, -0.6904978, -2.607774, 0, 0, 0, 1, 1,
-0.9829683, -1.030438, -3.564707, 0, 0, 0, 1, 1,
-0.9759516, 1.760173, -0.5567257, 0, 0, 0, 1, 1,
-0.9729093, -0.9294293, -1.360646, 0, 0, 0, 1, 1,
-0.9686429, 0.07513531, -0.3149624, 0, 0, 0, 1, 1,
-0.9667476, 1.414301, 0.2256006, 0, 0, 0, 1, 1,
-0.9643981, 0.7575094, -1.604298, 1, 1, 1, 1, 1,
-0.9642693, 0.7381681, 1.341822, 1, 1, 1, 1, 1,
-0.9606177, -0.09254384, -1.560109, 1, 1, 1, 1, 1,
-0.959116, 0.219947, -3.197112, 1, 1, 1, 1, 1,
-0.9564086, 0.1047888, -0.4980427, 1, 1, 1, 1, 1,
-0.9546701, 0.1744215, -0.9806517, 1, 1, 1, 1, 1,
-0.9479862, 0.2483821, -1.31252, 1, 1, 1, 1, 1,
-0.947159, 1.004352, -1.994815, 1, 1, 1, 1, 1,
-0.9464269, -2.061026, -3.972116, 1, 1, 1, 1, 1,
-0.9439337, -0.005552545, -1.136312, 1, 1, 1, 1, 1,
-0.9382514, -2.45325, -3.137112, 1, 1, 1, 1, 1,
-0.9351215, 0.2311206, -1.295891, 1, 1, 1, 1, 1,
-0.9303895, -1.099535, -1.664921, 1, 1, 1, 1, 1,
-0.9240421, -0.4102639, -1.337289, 1, 1, 1, 1, 1,
-0.9223742, -0.4293497, -2.523984, 1, 1, 1, 1, 1,
-0.9202691, 0.4914794, -0.3553578, 0, 0, 1, 1, 1,
-0.9155185, -0.3582824, -1.790856, 1, 0, 0, 1, 1,
-0.9115419, 1.08167, -1.801113, 1, 0, 0, 1, 1,
-0.9030591, -0.286697, -3.065753, 1, 0, 0, 1, 1,
-0.8813016, 1.694134, 0.3849007, 1, 0, 0, 1, 1,
-0.8812532, -1.833431, -1.712338, 1, 0, 0, 1, 1,
-0.8801641, -1.960065, -3.563879, 0, 0, 0, 1, 1,
-0.8779271, 0.7006105, -0.2724036, 0, 0, 0, 1, 1,
-0.8774744, -0.2606728, -1.757729, 0, 0, 0, 1, 1,
-0.8766731, -0.6133665, -3.121229, 0, 0, 0, 1, 1,
-0.8624896, 2.410105, 0.01485987, 0, 0, 0, 1, 1,
-0.8620683, -0.7585815, -3.237514, 0, 0, 0, 1, 1,
-0.8574027, -0.3505988, 0.3707214, 0, 0, 0, 1, 1,
-0.8573337, 1.247322, -1.141066, 1, 1, 1, 1, 1,
-0.8568719, -1.221725, -2.276158, 1, 1, 1, 1, 1,
-0.855598, -0.3600369, -2.556239, 1, 1, 1, 1, 1,
-0.8553267, 0.257506, -2.9537, 1, 1, 1, 1, 1,
-0.8448213, -1.491437, -0.9255932, 1, 1, 1, 1, 1,
-0.8444695, -0.9570152, -2.580494, 1, 1, 1, 1, 1,
-0.8423528, -1.457553, -1.078636, 1, 1, 1, 1, 1,
-0.8403739, 0.434093, -0.9233147, 1, 1, 1, 1, 1,
-0.8380516, 0.2272396, -1.533766, 1, 1, 1, 1, 1,
-0.834864, -0.1947832, -0.4063649, 1, 1, 1, 1, 1,
-0.8335426, 0.9363809, -0.9947627, 1, 1, 1, 1, 1,
-0.8246565, 1.990617, 0.7077528, 1, 1, 1, 1, 1,
-0.8203381, 0.8630379, -2.205396, 1, 1, 1, 1, 1,
-0.8166659, 1.170577, -0.661289, 1, 1, 1, 1, 1,
-0.8120924, -1.875164, -4.247887, 1, 1, 1, 1, 1,
-0.8082392, -1.413252, -3.355325, 0, 0, 1, 1, 1,
-0.8027171, -1.335561, -3.080475, 1, 0, 0, 1, 1,
-0.8026663, 1.511095, -1.705759, 1, 0, 0, 1, 1,
-0.7992107, 0.3016289, -1.8555, 1, 0, 0, 1, 1,
-0.7939123, 0.7502198, -0.4388003, 1, 0, 0, 1, 1,
-0.790286, 1.312225, -0.8621407, 1, 0, 0, 1, 1,
-0.7844929, -0.5430906, -2.204617, 0, 0, 0, 1, 1,
-0.782998, 0.7328579, -2.191217, 0, 0, 0, 1, 1,
-0.7810645, 0.7994108, -1.05478, 0, 0, 0, 1, 1,
-0.7793601, -0.6284696, -2.215594, 0, 0, 0, 1, 1,
-0.7793424, 0.1777076, -1.974355, 0, 0, 0, 1, 1,
-0.7778751, -0.4661381, -4.049866, 0, 0, 0, 1, 1,
-0.7747435, 0.9285315, 0.618258, 0, 0, 0, 1, 1,
-0.7739319, 1.779976, -0.6913939, 1, 1, 1, 1, 1,
-0.7720087, -1.132246, -2.537656, 1, 1, 1, 1, 1,
-0.7682017, -3.254775, -3.025164, 1, 1, 1, 1, 1,
-0.7623692, 0.6865129, 0.1761636, 1, 1, 1, 1, 1,
-0.7601677, 1.817349, -1.252327, 1, 1, 1, 1, 1,
-0.7586443, -0.2025702, -2.40374, 1, 1, 1, 1, 1,
-0.7455133, 1.44005, 0.9008962, 1, 1, 1, 1, 1,
-0.7447168, 0.5489138, -0.7991633, 1, 1, 1, 1, 1,
-0.7439247, -0.512308, -1.964737, 1, 1, 1, 1, 1,
-0.743197, -0.8430418, -2.769107, 1, 1, 1, 1, 1,
-0.7369211, 1.712752, -0.4216335, 1, 1, 1, 1, 1,
-0.7357789, -0.1597788, -2.531174, 1, 1, 1, 1, 1,
-0.7338949, 0.374828, -1.959172, 1, 1, 1, 1, 1,
-0.7317048, 0.1462362, -0.2069102, 1, 1, 1, 1, 1,
-0.7258751, 0.2439749, -2.219797, 1, 1, 1, 1, 1,
-0.7242703, -0.4702948, -0.9359117, 0, 0, 1, 1, 1,
-0.7208072, 0.3129023, -0.5201189, 1, 0, 0, 1, 1,
-0.7194356, 0.428952, -1.053424, 1, 0, 0, 1, 1,
-0.7192799, 0.8036382, 1.487483, 1, 0, 0, 1, 1,
-0.7188948, -0.05537509, -2.068695, 1, 0, 0, 1, 1,
-0.7177917, -0.9050986, -1.871997, 1, 0, 0, 1, 1,
-0.704255, -0.8792111, -1.606602, 0, 0, 0, 1, 1,
-0.7012668, -0.6493527, -1.456346, 0, 0, 0, 1, 1,
-0.698108, -0.6362553, -1.28482, 0, 0, 0, 1, 1,
-0.6954677, -0.7640957, -3.44554, 0, 0, 0, 1, 1,
-0.6936213, -0.356104, -2.15677, 0, 0, 0, 1, 1,
-0.6896223, -0.3075477, -3.902554, 0, 0, 0, 1, 1,
-0.6776313, -1.202711, -2.727348, 0, 0, 0, 1, 1,
-0.6750882, -0.5006323, -1.788711, 1, 1, 1, 1, 1,
-0.6728423, -0.9211673, -3.134036, 1, 1, 1, 1, 1,
-0.6708463, 0.2939788, -1.260968, 1, 1, 1, 1, 1,
-0.6689923, 1.630175, 1.887076, 1, 1, 1, 1, 1,
-0.6681064, -0.2586802, -3.196078, 1, 1, 1, 1, 1,
-0.665792, 0.6175629, -2.823029, 1, 1, 1, 1, 1,
-0.6567507, 0.4574145, 0.4549309, 1, 1, 1, 1, 1,
-0.656454, 0.2569099, -2.653884, 1, 1, 1, 1, 1,
-0.6562556, -1.658789, -2.200404, 1, 1, 1, 1, 1,
-0.6550251, 0.4681952, -1.245622, 1, 1, 1, 1, 1,
-0.65074, 1.636434, 1.746066, 1, 1, 1, 1, 1,
-0.6487849, -0.08824788, -0.9962555, 1, 1, 1, 1, 1,
-0.6410607, 0.7285367, -0.300946, 1, 1, 1, 1, 1,
-0.6398779, 0.8270818, -0.1293517, 1, 1, 1, 1, 1,
-0.6393153, -0.6237928, -2.845359, 1, 1, 1, 1, 1,
-0.6295918, -0.6571877, -2.636555, 0, 0, 1, 1, 1,
-0.6245872, 0.3250326, -0.3012284, 1, 0, 0, 1, 1,
-0.6188276, -0.2533395, -0.1002794, 1, 0, 0, 1, 1,
-0.6104324, 0.8688122, 2.383847, 1, 0, 0, 1, 1,
-0.60886, -0.5957894, -2.666613, 1, 0, 0, 1, 1,
-0.6072065, -0.7882424, -2.347957, 1, 0, 0, 1, 1,
-0.6006802, -0.2920115, -3.160713, 0, 0, 0, 1, 1,
-0.5987407, 0.2642923, -0.2630618, 0, 0, 0, 1, 1,
-0.5982649, 0.7740017, -0.2814025, 0, 0, 0, 1, 1,
-0.5893945, -0.9480303, -4.572857, 0, 0, 0, 1, 1,
-0.5891542, 0.5340021, -2.780814, 0, 0, 0, 1, 1,
-0.5879208, 2.190975, 0.5379255, 0, 0, 0, 1, 1,
-0.5844439, -0.333725, -2.805776, 0, 0, 0, 1, 1,
-0.5788802, -1.216814, -3.666411, 1, 1, 1, 1, 1,
-0.5744376, 0.1898009, 0.04621883, 1, 1, 1, 1, 1,
-0.5667526, 0.3032488, -0.2783102, 1, 1, 1, 1, 1,
-0.5665098, -1.702255, -2.98655, 1, 1, 1, 1, 1,
-0.5636102, 0.8618046, -1.109352, 1, 1, 1, 1, 1,
-0.5626714, -0.06532977, -0.05069026, 1, 1, 1, 1, 1,
-0.5622425, 1.332246, -0.1836873, 1, 1, 1, 1, 1,
-0.5565053, 0.5264633, -2.972764, 1, 1, 1, 1, 1,
-0.5561315, 0.222238, 0.02839565, 1, 1, 1, 1, 1,
-0.5550793, 0.5028222, 0.1252193, 1, 1, 1, 1, 1,
-0.5548316, 0.7033281, -0.8137621, 1, 1, 1, 1, 1,
-0.554484, 0.4373008, -0.3194268, 1, 1, 1, 1, 1,
-0.55291, 0.2704995, -0.5805888, 1, 1, 1, 1, 1,
-0.5463661, 1.452854, -0.6921785, 1, 1, 1, 1, 1,
-0.5457262, -0.277133, -1.729789, 1, 1, 1, 1, 1,
-0.545635, -0.278943, -1.628383, 0, 0, 1, 1, 1,
-0.5423553, -0.6362017, -3.443224, 1, 0, 0, 1, 1,
-0.5382136, 0.5989299, -0.4387973, 1, 0, 0, 1, 1,
-0.5376421, 4.269299, 1.134419, 1, 0, 0, 1, 1,
-0.5349708, 1.600359, 0.9724441, 1, 0, 0, 1, 1,
-0.5272413, -0.1273913, -1.696733, 1, 0, 0, 1, 1,
-0.5247726, -1.71754, -2.743481, 0, 0, 0, 1, 1,
-0.5242903, -0.3866713, -2.476475, 0, 0, 0, 1, 1,
-0.5156983, 0.8934802, -0.7238802, 0, 0, 0, 1, 1,
-0.5141187, 0.03617846, -2.103164, 0, 0, 0, 1, 1,
-0.5101336, 1.359956, -0.8122622, 0, 0, 0, 1, 1,
-0.5089021, -0.2254246, 1.140348, 0, 0, 0, 1, 1,
-0.502277, -1.646692, -1.5426, 0, 0, 0, 1, 1,
-0.500112, 2.679683, 0.3396294, 1, 1, 1, 1, 1,
-0.4999532, -0.04290804, -1.69362, 1, 1, 1, 1, 1,
-0.4984312, 1.445348, -1.068587, 1, 1, 1, 1, 1,
-0.4950996, -0.4188513, -3.098545, 1, 1, 1, 1, 1,
-0.4948608, -0.07670113, -2.46271, 1, 1, 1, 1, 1,
-0.4929236, 0.7786884, -1.188511, 1, 1, 1, 1, 1,
-0.4888821, 0.007662123, -2.333002, 1, 1, 1, 1, 1,
-0.4825154, -0.4170001, -1.255191, 1, 1, 1, 1, 1,
-0.4779055, 0.9383621, -0.1490122, 1, 1, 1, 1, 1,
-0.4693951, 1.953236, -0.6362768, 1, 1, 1, 1, 1,
-0.4690276, 0.3277482, -1.352711, 1, 1, 1, 1, 1,
-0.4683687, -0.9524509, -1.506291, 1, 1, 1, 1, 1,
-0.4664474, -1.09085, -3.481318, 1, 1, 1, 1, 1,
-0.4662357, 1.725994, -0.5393357, 1, 1, 1, 1, 1,
-0.4659739, 1.444597, -0.6279865, 1, 1, 1, 1, 1,
-0.4655698, -0.5231445, -3.32194, 0, 0, 1, 1, 1,
-0.4648688, 0.8941971, -0.9614589, 1, 0, 0, 1, 1,
-0.4628354, 0.4957867, -1.205232, 1, 0, 0, 1, 1,
-0.4607597, 0.6583489, -3.450903, 1, 0, 0, 1, 1,
-0.4606126, -0.3514967, -1.807037, 1, 0, 0, 1, 1,
-0.459039, -0.6398791, -0.6536749, 1, 0, 0, 1, 1,
-0.4583565, 1.193863, 0.4986174, 0, 0, 0, 1, 1,
-0.4559237, 0.2623159, -1.524246, 0, 0, 0, 1, 1,
-0.4550266, -1.468446, -3.804983, 0, 0, 0, 1, 1,
-0.4510455, 0.6350469, -0.6318931, 0, 0, 0, 1, 1,
-0.449198, 0.730338, 0.01136144, 0, 0, 0, 1, 1,
-0.448317, 0.3054498, 0.2318254, 0, 0, 0, 1, 1,
-0.4467201, 0.3355682, -2.394133, 0, 0, 0, 1, 1,
-0.4432309, 0.2057088, -1.84073, 1, 1, 1, 1, 1,
-0.4423289, -0.939999, -1.868488, 1, 1, 1, 1, 1,
-0.4414816, -0.4463964, -2.871669, 1, 1, 1, 1, 1,
-0.4363259, 0.8320276, -0.7701665, 1, 1, 1, 1, 1,
-0.4340622, 0.383915, 1.88385, 1, 1, 1, 1, 1,
-0.4330062, 1.136441, -0.9542394, 1, 1, 1, 1, 1,
-0.428629, -0.3428024, -2.295226, 1, 1, 1, 1, 1,
-0.4220183, 1.404885, 0.8833935, 1, 1, 1, 1, 1,
-0.4196773, -0.049015, -1.677286, 1, 1, 1, 1, 1,
-0.4098599, -1.475442, -2.356109, 1, 1, 1, 1, 1,
-0.4086736, -1.39601, -3.444679, 1, 1, 1, 1, 1,
-0.4086317, -0.1740391, -1.070723, 1, 1, 1, 1, 1,
-0.407011, 0.5441546, -0.6484632, 1, 1, 1, 1, 1,
-0.4057827, 0.472853, -0.01678965, 1, 1, 1, 1, 1,
-0.4040678, -1.501837, -3.337063, 1, 1, 1, 1, 1,
-0.4034334, -1.005081, -2.674121, 0, 0, 1, 1, 1,
-0.4015842, 1.005864, -0.8288748, 1, 0, 0, 1, 1,
-0.4008973, 1.863732, 0.9176368, 1, 0, 0, 1, 1,
-0.3957039, -0.9659531, -3.386134, 1, 0, 0, 1, 1,
-0.3930554, 2.683069, 0.09655511, 1, 0, 0, 1, 1,
-0.3922737, -1.521859, -4.7986, 1, 0, 0, 1, 1,
-0.385967, 1.885903, 0.6240596, 0, 0, 0, 1, 1,
-0.3830036, 0.2100202, -1.305926, 0, 0, 0, 1, 1,
-0.3789272, -1.539416, -2.62878, 0, 0, 0, 1, 1,
-0.3788831, 0.3633983, 0.6004679, 0, 0, 0, 1, 1,
-0.3751057, 0.6222018, 0.08843795, 0, 0, 0, 1, 1,
-0.3733676, -0.7622999, -2.689858, 0, 0, 0, 1, 1,
-0.3731135, -0.5735209, -0.505607, 0, 0, 0, 1, 1,
-0.3722749, -0.1551908, -3.22609, 1, 1, 1, 1, 1,
-0.3710903, 0.001215739, -0.9158528, 1, 1, 1, 1, 1,
-0.3705468, -0.4310834, -0.4347052, 1, 1, 1, 1, 1,
-0.368592, 0.4124663, -0.3660051, 1, 1, 1, 1, 1,
-0.3673258, 0.4594321, 1.072287, 1, 1, 1, 1, 1,
-0.3668287, -0.1342916, 0.3243624, 1, 1, 1, 1, 1,
-0.3660021, 0.2185566, -0.08618311, 1, 1, 1, 1, 1,
-0.3632995, -0.2757145, -2.6598, 1, 1, 1, 1, 1,
-0.3611232, 1.190219, -0.5207005, 1, 1, 1, 1, 1,
-0.3607147, -0.8643994, -4.164759, 1, 1, 1, 1, 1,
-0.3585072, 2.703311, -0.8325864, 1, 1, 1, 1, 1,
-0.3579276, -1.143938, -2.751461, 1, 1, 1, 1, 1,
-0.3561459, -0.2932301, -3.045006, 1, 1, 1, 1, 1,
-0.3559413, -1.358256, -3.485467, 1, 1, 1, 1, 1,
-0.3518536, 0.4031589, -1.227276, 1, 1, 1, 1, 1,
-0.3512173, -0.2801849, -2.047809, 0, 0, 1, 1, 1,
-0.3499247, -0.9762341, -3.657044, 1, 0, 0, 1, 1,
-0.3472607, 0.710503, 0.08856557, 1, 0, 0, 1, 1,
-0.3456993, 0.7257596, -0.2607936, 1, 0, 0, 1, 1,
-0.344377, -0.08323665, -2.432276, 1, 0, 0, 1, 1,
-0.3417626, 1.475137, -0.05520657, 1, 0, 0, 1, 1,
-0.3343139, -2.264663, -3.623878, 0, 0, 0, 1, 1,
-0.3329257, 1.610439, 0.5968017, 0, 0, 0, 1, 1,
-0.3212195, 0.804651, 0.634773, 0, 0, 0, 1, 1,
-0.3101471, 0.6743591, -0.5991288, 0, 0, 0, 1, 1,
-0.3088981, -0.2226514, -2.46443, 0, 0, 0, 1, 1,
-0.3074051, -0.7878999, -3.786331, 0, 0, 0, 1, 1,
-0.303072, 1.085391, -0.05922437, 0, 0, 0, 1, 1,
-0.3025104, -1.414225, -1.915137, 1, 1, 1, 1, 1,
-0.3024598, -0.1137077, 0.1704306, 1, 1, 1, 1, 1,
-0.301779, -1.593182, -2.425258, 1, 1, 1, 1, 1,
-0.2961074, 0.4638251, -1.398536, 1, 1, 1, 1, 1,
-0.2919746, 0.2517588, -0.6240917, 1, 1, 1, 1, 1,
-0.2893703, 1.412266, 2.107742, 1, 1, 1, 1, 1,
-0.2855384, -0.7156314, -3.069511, 1, 1, 1, 1, 1,
-0.2716715, -1.34218, -4.826071, 1, 1, 1, 1, 1,
-0.2708079, -1.15962, -3.339367, 1, 1, 1, 1, 1,
-0.2679739, -0.02842226, -2.91085, 1, 1, 1, 1, 1,
-0.265808, -0.6144372, -2.728579, 1, 1, 1, 1, 1,
-0.2653217, 0.05332562, -2.836314, 1, 1, 1, 1, 1,
-0.261535, 0.04324682, -0.8486658, 1, 1, 1, 1, 1,
-0.2612869, 0.7392734, 1.087704, 1, 1, 1, 1, 1,
-0.2600704, 2.902668, -0.7995242, 1, 1, 1, 1, 1,
-0.258122, 0.07321022, -0.8950527, 0, 0, 1, 1, 1,
-0.254517, -0.4739904, -1.25669, 1, 0, 0, 1, 1,
-0.2531173, -0.9849943, -3.300928, 1, 0, 0, 1, 1,
-0.2463815, 1.644066, 0.4643884, 1, 0, 0, 1, 1,
-0.2458157, -1.352381, -2.871867, 1, 0, 0, 1, 1,
-0.2453533, -0.6212295, -3.356959, 1, 0, 0, 1, 1,
-0.2451198, 1.397768, -0.8687583, 0, 0, 0, 1, 1,
-0.2434831, 0.2604249, -1.331071, 0, 0, 0, 1, 1,
-0.2413605, -1.457439, -3.692735, 0, 0, 0, 1, 1,
-0.2407168, 0.7875875, -3.001168, 0, 0, 0, 1, 1,
-0.2404516, -0.6271455, -3.439088, 0, 0, 0, 1, 1,
-0.2382619, 1.157251, -0.3175188, 0, 0, 0, 1, 1,
-0.2361183, -1.219545, -1.719498, 0, 0, 0, 1, 1,
-0.2353797, 1.27408, 1.837532, 1, 1, 1, 1, 1,
-0.2329871, 2.707897, -0.8366987, 1, 1, 1, 1, 1,
-0.2308019, 0.1084094, -0.7694445, 1, 1, 1, 1, 1,
-0.2294764, 0.5910044, -0.8003914, 1, 1, 1, 1, 1,
-0.2293547, 0.05134704, -1.596217, 1, 1, 1, 1, 1,
-0.2284486, -0.04945066, -1.899193, 1, 1, 1, 1, 1,
-0.2282686, 1.580472, -0.4630976, 1, 1, 1, 1, 1,
-0.2276157, -1.972511, -4.070918, 1, 1, 1, 1, 1,
-0.2264211, 1.321915, 0.6533691, 1, 1, 1, 1, 1,
-0.2245619, 1.194083, 0.0134655, 1, 1, 1, 1, 1,
-0.2216581, -1.409835, -4.293312, 1, 1, 1, 1, 1,
-0.2192509, -0.03377884, -3.021003, 1, 1, 1, 1, 1,
-0.2172615, -0.1350731, -2.430497, 1, 1, 1, 1, 1,
-0.2171759, -0.5197583, -3.365514, 1, 1, 1, 1, 1,
-0.2131217, -0.3725456, -1.246965, 1, 1, 1, 1, 1,
-0.2130662, -0.2575559, -5.139262, 0, 0, 1, 1, 1,
-0.2100785, 0.4008968, -1.719444, 1, 0, 0, 1, 1,
-0.205791, -1.088007, -3.27041, 1, 0, 0, 1, 1,
-0.2057212, -0.6337034, -3.601839, 1, 0, 0, 1, 1,
-0.204027, 1.489482, 0.4594925, 1, 0, 0, 1, 1,
-0.2036841, -1.344347, -1.55016, 1, 0, 0, 1, 1,
-0.2007555, -1.87052, -3.034178, 0, 0, 0, 1, 1,
-0.1963463, 0.4023483, -3.374275, 0, 0, 0, 1, 1,
-0.1943552, -1.231159, -2.439319, 0, 0, 0, 1, 1,
-0.1931931, 0.5321974, -1.356675, 0, 0, 0, 1, 1,
-0.1891157, -0.3432032, -2.752299, 0, 0, 0, 1, 1,
-0.1818468, -0.1788708, -1.24584, 0, 0, 0, 1, 1,
-0.1809491, 0.6133718, -0.1655447, 0, 0, 0, 1, 1,
-0.180111, 2.975178, 1.571184, 1, 1, 1, 1, 1,
-0.174576, -0.31922, -3.500598, 1, 1, 1, 1, 1,
-0.173602, 0.4746301, 1.388836, 1, 1, 1, 1, 1,
-0.170929, -0.09608518, -4.15415, 1, 1, 1, 1, 1,
-0.1695382, -0.8913025, -2.854243, 1, 1, 1, 1, 1,
-0.1684081, 1.501556, -1.434609, 1, 1, 1, 1, 1,
-0.1663139, -1.546613, -2.926651, 1, 1, 1, 1, 1,
-0.1640999, -0.2757293, -3.119645, 1, 1, 1, 1, 1,
-0.1619627, 0.3542853, 0.294497, 1, 1, 1, 1, 1,
-0.1603839, -0.6358027, -2.620432, 1, 1, 1, 1, 1,
-0.1598946, 0.6033362, -0.8617197, 1, 1, 1, 1, 1,
-0.1559641, 0.695923, 1.478993, 1, 1, 1, 1, 1,
-0.1543962, -0.7016279, -1.705643, 1, 1, 1, 1, 1,
-0.1538976, 0.2656195, 0.2923406, 1, 1, 1, 1, 1,
-0.1466614, -0.3320473, -2.509547, 1, 1, 1, 1, 1,
-0.146167, -0.05870598, -1.1053, 0, 0, 1, 1, 1,
-0.1453158, 1.038296, 0.4934807, 1, 0, 0, 1, 1,
-0.1419012, -1.311575, -2.312315, 1, 0, 0, 1, 1,
-0.1403539, 1.000157, -1.574213, 1, 0, 0, 1, 1,
-0.1401117, -0.3239449, -2.135323, 1, 0, 0, 1, 1,
-0.1381245, 1.283511, -0.7654043, 1, 0, 0, 1, 1,
-0.1370663, 0.8214428, -1.169095, 0, 0, 0, 1, 1,
-0.136708, 1.178645, -0.5393101, 0, 0, 0, 1, 1,
-0.1341806, 0.5603363, 0.1344809, 0, 0, 0, 1, 1,
-0.1340465, 1.15895, 0.7773421, 0, 0, 0, 1, 1,
-0.1319482, -1.113054, -3.272778, 0, 0, 0, 1, 1,
-0.1256156, -1.350545, -2.0668, 0, 0, 0, 1, 1,
-0.1212588, -0.597132, -2.977059, 0, 0, 0, 1, 1,
-0.1176381, -0.7362804, -4.563679, 1, 1, 1, 1, 1,
-0.1135094, -0.7724043, -1.742724, 1, 1, 1, 1, 1,
-0.1103438, 0.7716055, 0.07907053, 1, 1, 1, 1, 1,
-0.1092075, 0.7076285, 0.8037227, 1, 1, 1, 1, 1,
-0.1082336, -1.766104, -3.607124, 1, 1, 1, 1, 1,
-0.1059711, 1.682231, 0.5335563, 1, 1, 1, 1, 1,
-0.1056657, 0.3245858, -0.132151, 1, 1, 1, 1, 1,
-0.1051187, 0.5212615, -0.6480055, 1, 1, 1, 1, 1,
-0.1019414, 0.5186281, 0.8021876, 1, 1, 1, 1, 1,
-0.1012438, -0.1992598, -1.513666, 1, 1, 1, 1, 1,
-0.09687999, 0.1107061, -0.1097885, 1, 1, 1, 1, 1,
-0.09638227, -2.948777, -3.743807, 1, 1, 1, 1, 1,
-0.09615902, 1.353654, 0.07565074, 1, 1, 1, 1, 1,
-0.09604264, 0.3012595, 0.06924486, 1, 1, 1, 1, 1,
-0.09528293, -0.2312923, -3.28392, 1, 1, 1, 1, 1,
-0.09332757, 0.727695, -0.08476097, 0, 0, 1, 1, 1,
-0.09017371, -1.265119, -3.012645, 1, 0, 0, 1, 1,
-0.08890868, 1.283826, 1.256645, 1, 0, 0, 1, 1,
-0.0851422, 0.4869955, -1.137734, 1, 0, 0, 1, 1,
-0.08043871, -0.115158, -2.40635, 1, 0, 0, 1, 1,
-0.08000086, 1.773108, 0.2206878, 1, 0, 0, 1, 1,
-0.07726315, 1.198913, 0.3225622, 0, 0, 0, 1, 1,
-0.07535363, -2.182231, -2.194588, 0, 0, 0, 1, 1,
-0.06064158, -0.904149, -3.703487, 0, 0, 0, 1, 1,
-0.05698752, 0.2865947, 0.04885122, 0, 0, 0, 1, 1,
-0.05113032, -0.1764772, -2.252577, 0, 0, 0, 1, 1,
-0.05050089, -1.257347, -4.014338, 0, 0, 0, 1, 1,
-0.05002252, -0.6092901, -5.305612, 0, 0, 0, 1, 1,
-0.04685756, -0.8832153, -0.8629535, 1, 1, 1, 1, 1,
-0.04469535, -0.03610224, -2.059329, 1, 1, 1, 1, 1,
-0.0446017, -0.3071129, -3.398378, 1, 1, 1, 1, 1,
-0.04321883, 0.003320013, -2.692339, 1, 1, 1, 1, 1,
-0.04093153, -0.8090046, -1.791508, 1, 1, 1, 1, 1,
-0.03639235, -0.4101714, -3.812882, 1, 1, 1, 1, 1,
-0.03557282, 0.2765127, -1.445448, 1, 1, 1, 1, 1,
-0.03411369, -0.6312, -2.724134, 1, 1, 1, 1, 1,
-0.03350591, 0.37316, -0.2545758, 1, 1, 1, 1, 1,
-0.0312307, -0.241866, -2.684978, 1, 1, 1, 1, 1,
-0.03112679, -0.1651429, -4.494716, 1, 1, 1, 1, 1,
-0.03057774, 0.6292306, 0.3287149, 1, 1, 1, 1, 1,
-0.03033222, -0.5492035, -2.301568, 1, 1, 1, 1, 1,
-0.02978221, -0.2435002, -4.836076, 1, 1, 1, 1, 1,
-0.02579367, -0.7004182, -2.959767, 1, 1, 1, 1, 1,
-0.02314119, 0.5710971, 0.8148152, 0, 0, 1, 1, 1,
-0.02173176, 0.3918878, 0.3967829, 1, 0, 0, 1, 1,
-0.01895113, -2.175667, -5.056222, 1, 0, 0, 1, 1,
-0.01187719, 0.03828345, 0.7113523, 1, 0, 0, 1, 1,
-0.01171488, -0.8524823, -2.625878, 1, 0, 0, 1, 1,
-0.00830851, -0.4466192, -2.76447, 1, 0, 0, 1, 1,
-0.007191835, -0.7296346, -4.182423, 0, 0, 0, 1, 1,
-0.005271799, -0.6162865, -2.866951, 0, 0, 0, 1, 1,
-0.004775727, 0.7554713, -0.6604083, 0, 0, 0, 1, 1,
-0.002799601, 1.028644, 0.8088409, 0, 0, 0, 1, 1,
-0.001737117, 1.0013, -0.5850381, 0, 0, 0, 1, 1,
-0.001382176, 0.4235809, -1.930732, 0, 0, 0, 1, 1,
0.00114262, -0.1730215, 3.77495, 0, 0, 0, 1, 1,
0.00273515, -0.7602984, 2.643154, 1, 1, 1, 1, 1,
0.003675696, -0.6792739, 1.607955, 1, 1, 1, 1, 1,
0.005085093, 1.74947, -1.126213, 1, 1, 1, 1, 1,
0.008635961, -0.2430886, 2.28837, 1, 1, 1, 1, 1,
0.01566178, 0.4991241, -0.4609851, 1, 1, 1, 1, 1,
0.0188882, -0.3663781, 4.09001, 1, 1, 1, 1, 1,
0.02640833, 0.273159, 0.7992768, 1, 1, 1, 1, 1,
0.02657984, -0.2362334, 3.210581, 1, 1, 1, 1, 1,
0.0342459, 0.897661, 0.6028085, 1, 1, 1, 1, 1,
0.0438718, -0.5753339, 3.581545, 1, 1, 1, 1, 1,
0.04895822, 0.05480563, 0.647937, 1, 1, 1, 1, 1,
0.05153594, -0.05197032, 3.086938, 1, 1, 1, 1, 1,
0.05173789, 1.174669, 1.936331, 1, 1, 1, 1, 1,
0.05226162, -2.241121, 3.078145, 1, 1, 1, 1, 1,
0.05844454, -1.674954, 3.567165, 1, 1, 1, 1, 1,
0.05914275, 1.8629, 0.9842669, 0, 0, 1, 1, 1,
0.06060879, -0.5069878, 2.799309, 1, 0, 0, 1, 1,
0.06274763, 1.061082, 0.008285115, 1, 0, 0, 1, 1,
0.06417189, -0.4190029, 3.07125, 1, 0, 0, 1, 1,
0.07084287, -0.004166448, 1.655335, 1, 0, 0, 1, 1,
0.07363184, 0.5304327, 0.5472419, 1, 0, 0, 1, 1,
0.0755202, -0.1498571, 1.646155, 0, 0, 0, 1, 1,
0.07598583, 0.3387596, 0.7909145, 0, 0, 0, 1, 1,
0.07669602, 0.5348706, -0.1289047, 0, 0, 0, 1, 1,
0.08090977, 0.1028084, 0.837694, 0, 0, 0, 1, 1,
0.081509, -1.140117, 1.981594, 0, 0, 0, 1, 1,
0.08269107, 1.648445, 1.377348, 0, 0, 0, 1, 1,
0.08879867, 0.0399649, 0.964917, 0, 0, 0, 1, 1,
0.09094519, -1.301629, 2.211, 1, 1, 1, 1, 1,
0.09636762, -0.1277639, 1.353463, 1, 1, 1, 1, 1,
0.09745127, -1.087599, 4.797551, 1, 1, 1, 1, 1,
0.09811205, 0.2414244, 1.830737, 1, 1, 1, 1, 1,
0.1035942, 0.1251595, 0.3339998, 1, 1, 1, 1, 1,
0.1051359, -1.164438, 2.51244, 1, 1, 1, 1, 1,
0.1056117, 0.03568982, 0.7640041, 1, 1, 1, 1, 1,
0.1094005, -0.3642382, 3.412528, 1, 1, 1, 1, 1,
0.1142142, -3.126312, 2.354132, 1, 1, 1, 1, 1,
0.1176255, -0.3977327, 1.920509, 1, 1, 1, 1, 1,
0.1201212, -1.67987, 1.234945, 1, 1, 1, 1, 1,
0.122452, -1.34367, 4.288533, 1, 1, 1, 1, 1,
0.1261096, 1.687842, -0.4322509, 1, 1, 1, 1, 1,
0.1262032, -0.2829986, 1.382282, 1, 1, 1, 1, 1,
0.1306808, -1.097406, 4.634287, 1, 1, 1, 1, 1,
0.1335241, -1.18608, 3.131999, 0, 0, 1, 1, 1,
0.1341224, -1.014614, 4.291146, 1, 0, 0, 1, 1,
0.1351358, 0.9628493, -0.8981116, 1, 0, 0, 1, 1,
0.1354634, -1.487388, 3.871807, 1, 0, 0, 1, 1,
0.1361581, -0.8694121, 3.146821, 1, 0, 0, 1, 1,
0.1384691, 0.9774644, -0.1338337, 1, 0, 0, 1, 1,
0.1402828, -0.3490982, 1.94304, 0, 0, 0, 1, 1,
0.1417056, 0.579, 0.08764122, 0, 0, 0, 1, 1,
0.1483074, 0.621152, 0.9198841, 0, 0, 0, 1, 1,
0.151457, 1.338995, 1.567949, 0, 0, 0, 1, 1,
0.1530865, 0.605066, -0.4536217, 0, 0, 0, 1, 1,
0.1541306, -0.2068856, 1.662323, 0, 0, 0, 1, 1,
0.1569814, -0.7539602, 3.490346, 0, 0, 0, 1, 1,
0.1618892, -1.266216, 3.91247, 1, 1, 1, 1, 1,
0.1619944, -0.8058001, 2.142146, 1, 1, 1, 1, 1,
0.1665445, -0.7268907, 1.70463, 1, 1, 1, 1, 1,
0.1716515, 1.050023, 3.101674, 1, 1, 1, 1, 1,
0.1717952, -1.202596, 4.502481, 1, 1, 1, 1, 1,
0.183564, -0.3007623, 3.393903, 1, 1, 1, 1, 1,
0.185755, 0.8556084, 0.8391817, 1, 1, 1, 1, 1,
0.1875474, 1.813922, 1.919969, 1, 1, 1, 1, 1,
0.1911215, 0.4163366, 0.8444601, 1, 1, 1, 1, 1,
0.1921681, 0.2740865, -0.3324044, 1, 1, 1, 1, 1,
0.194048, -0.8749759, 2.397501, 1, 1, 1, 1, 1,
0.1973844, -0.9535277, 3.507317, 1, 1, 1, 1, 1,
0.202644, -0.8275332, 2.243262, 1, 1, 1, 1, 1,
0.2068702, -0.3248976, 3.582304, 1, 1, 1, 1, 1,
0.2074098, -0.5263363, 4.356674, 1, 1, 1, 1, 1,
0.2085425, 1.970817, -0.03437629, 0, 0, 1, 1, 1,
0.2090194, -0.480122, 3.035856, 1, 0, 0, 1, 1,
0.2106789, -0.7118952, 2.573631, 1, 0, 0, 1, 1,
0.2121413, 0.2981137, 1.803031, 1, 0, 0, 1, 1,
0.2132405, 2.102859, 0.2604446, 1, 0, 0, 1, 1,
0.2132948, 0.2086926, 0.5533228, 1, 0, 0, 1, 1,
0.215213, 1.583625, 0.5696088, 0, 0, 0, 1, 1,
0.2167799, -1.177271, 2.860468, 0, 0, 0, 1, 1,
0.220214, 0.4635084, 2.032895, 0, 0, 0, 1, 1,
0.2232687, 1.347567, 0.7179035, 0, 0, 0, 1, 1,
0.2267005, -0.4049479, 2.857545, 0, 0, 0, 1, 1,
0.2289343, 0.3924497, 2.219313, 0, 0, 0, 1, 1,
0.2321982, 0.3595894, 2.023664, 0, 0, 0, 1, 1,
0.2344231, -1.118457, 2.305577, 1, 1, 1, 1, 1,
0.2395582, -0.3778892, 3.487818, 1, 1, 1, 1, 1,
0.2425766, -0.3965572, 3.007459, 1, 1, 1, 1, 1,
0.2444704, -0.5385611, 1.884442, 1, 1, 1, 1, 1,
0.2453688, -2.208835, 0.9410549, 1, 1, 1, 1, 1,
0.2533469, 0.7529448, -2.598907, 1, 1, 1, 1, 1,
0.2545298, 2.178388, -1.467838, 1, 1, 1, 1, 1,
0.2554894, 0.6510807, 0.4527415, 1, 1, 1, 1, 1,
0.2577298, 1.216874, 0.9079326, 1, 1, 1, 1, 1,
0.258474, 2.755799, 0.3296666, 1, 1, 1, 1, 1,
0.2586827, 0.2206193, 0.9370055, 1, 1, 1, 1, 1,
0.2609932, 1.622975, -0.4705992, 1, 1, 1, 1, 1,
0.2620484, -0.6555508, 3.32927, 1, 1, 1, 1, 1,
0.2624837, 0.6102425, 0.7590153, 1, 1, 1, 1, 1,
0.2636858, 1.169635, -1.806559, 1, 1, 1, 1, 1,
0.2662627, 1.23691, 0.8786603, 0, 0, 1, 1, 1,
0.2668205, 1.128412, 1.644346, 1, 0, 0, 1, 1,
0.2669057, -0.9063118, 1.908371, 1, 0, 0, 1, 1,
0.2682418, 0.5405409, 0.7142474, 1, 0, 0, 1, 1,
0.2694454, -1.213268, 1.481054, 1, 0, 0, 1, 1,
0.2753675, -2.005043, 2.665431, 1, 0, 0, 1, 1,
0.2754361, -0.3617767, 2.937615, 0, 0, 0, 1, 1,
0.2761135, 0.5455734, 1.262257, 0, 0, 0, 1, 1,
0.2768076, -0.08024128, 1.028397, 0, 0, 0, 1, 1,
0.2813294, 0.8581452, 0.9122751, 0, 0, 0, 1, 1,
0.2837907, 0.6491637, 1.023567, 0, 0, 0, 1, 1,
0.2925657, 0.8092871, 0.4771966, 0, 0, 0, 1, 1,
0.2930085, -0.4320944, 3.070094, 0, 0, 0, 1, 1,
0.3027361, 0.04991359, 1.831822, 1, 1, 1, 1, 1,
0.3131423, -0.1440773, -0.1669486, 1, 1, 1, 1, 1,
0.3203527, -1.124172, 3.360232, 1, 1, 1, 1, 1,
0.3229093, -0.1977972, 1.859499, 1, 1, 1, 1, 1,
0.3234714, 0.1580727, 0.8481395, 1, 1, 1, 1, 1,
0.3235051, -1.134716, 3.268905, 1, 1, 1, 1, 1,
0.3239191, 0.6906545, -1.413799, 1, 1, 1, 1, 1,
0.3255253, 1.127735, 0.9256408, 1, 1, 1, 1, 1,
0.3257631, 2.520232, -0.015584, 1, 1, 1, 1, 1,
0.3283569, -0.1025493, 0.5860653, 1, 1, 1, 1, 1,
0.3408509, 1.412825, -1.926234, 1, 1, 1, 1, 1,
0.3408583, 0.08396431, 1.698146, 1, 1, 1, 1, 1,
0.3412255, 0.4112855, 0.9290415, 1, 1, 1, 1, 1,
0.3444995, 0.2388901, 0.704754, 1, 1, 1, 1, 1,
0.3586664, 0.7367002, 0.09155668, 1, 1, 1, 1, 1,
0.3602417, 0.5175607, -0.1287908, 0, 0, 1, 1, 1,
0.368561, 1.579303, -0.3431263, 1, 0, 0, 1, 1,
0.3731263, 0.6412279, 0.9363813, 1, 0, 0, 1, 1,
0.3744847, -1.462049, 3.896383, 1, 0, 0, 1, 1,
0.3789334, -0.7001273, 0.9284635, 1, 0, 0, 1, 1,
0.3832072, 1.270618, -0.7975845, 1, 0, 0, 1, 1,
0.38416, 0.4760456, 0.05619215, 0, 0, 0, 1, 1,
0.3854822, -0.6173542, 3.995725, 0, 0, 0, 1, 1,
0.3863721, 1.866367, 0.6902589, 0, 0, 0, 1, 1,
0.3864864, 1.363441, 1.52599, 0, 0, 0, 1, 1,
0.3932975, 1.189273, -0.7012469, 0, 0, 0, 1, 1,
0.3957737, -0.5168341, 2.326774, 0, 0, 0, 1, 1,
0.3960383, -0.6042755, 2.516755, 0, 0, 0, 1, 1,
0.3994826, 0.4604066, 0.2326913, 1, 1, 1, 1, 1,
0.4037464, -0.736385, 1.923333, 1, 1, 1, 1, 1,
0.4063974, -1.134616, 2.702389, 1, 1, 1, 1, 1,
0.4101527, -0.587783, 3.839583, 1, 1, 1, 1, 1,
0.4102296, -0.1694228, 0.5796783, 1, 1, 1, 1, 1,
0.4242798, 0.03034794, 1.76058, 1, 1, 1, 1, 1,
0.4309677, 1.736587, 1.099005, 1, 1, 1, 1, 1,
0.4317082, 0.7936053, 2.002063, 1, 1, 1, 1, 1,
0.4344781, -1.494776, 4.749612, 1, 1, 1, 1, 1,
0.4380525, -0.2827044, 4.417291, 1, 1, 1, 1, 1,
0.4385783, -1.38618, 2.801352, 1, 1, 1, 1, 1,
0.4417783, 0.2652893, 0.4923783, 1, 1, 1, 1, 1,
0.4433342, -0.2219805, 1.997891, 1, 1, 1, 1, 1,
0.445073, 0.4927095, 0.7797203, 1, 1, 1, 1, 1,
0.4453084, -1.351058, 2.255575, 1, 1, 1, 1, 1,
0.4526416, -0.6344481, 1.191383, 0, 0, 1, 1, 1,
0.455865, 0.2263069, 1.200836, 1, 0, 0, 1, 1,
0.45825, 1.722719, 0.2493668, 1, 0, 0, 1, 1,
0.4648972, -1.186464, 0.8291407, 1, 0, 0, 1, 1,
0.4650006, -1.32279, 3.119517, 1, 0, 0, 1, 1,
0.4715692, 0.1777934, 1.571101, 1, 0, 0, 1, 1,
0.4731282, 0.1363607, 1.366385, 0, 0, 0, 1, 1,
0.4739426, 1.223432, 0.6738935, 0, 0, 0, 1, 1,
0.4778669, 0.07111158, 2.716781, 0, 0, 0, 1, 1,
0.4783352, 1.129959, 0.7599227, 0, 0, 0, 1, 1,
0.4821727, -0.07324551, 1.049295, 0, 0, 0, 1, 1,
0.4866661, -0.1209737, 2.144521, 0, 0, 0, 1, 1,
0.4873804, 0.5067831, 0.08100352, 0, 0, 0, 1, 1,
0.4875314, 0.3917795, 1.367562, 1, 1, 1, 1, 1,
0.4950922, 1.116461, -0.2554675, 1, 1, 1, 1, 1,
0.5023116, -0.3558224, 4.257402, 1, 1, 1, 1, 1,
0.5039138, 1.24361, 0.3636779, 1, 1, 1, 1, 1,
0.5089447, -0.9217361, 3.317928, 1, 1, 1, 1, 1,
0.5111341, 0.2974097, 1.453254, 1, 1, 1, 1, 1,
0.5172346, 0.4538349, 1.237816, 1, 1, 1, 1, 1,
0.5213984, 1.363457, -0.5720286, 1, 1, 1, 1, 1,
0.5216938, 0.9088576, 1.257061, 1, 1, 1, 1, 1,
0.5263526, -1.473179, 3.366312, 1, 1, 1, 1, 1,
0.5272844, 1.211935, 1.157447, 1, 1, 1, 1, 1,
0.5329149, 0.2568576, 1.183075, 1, 1, 1, 1, 1,
0.533863, -1.085416, 2.709668, 1, 1, 1, 1, 1,
0.5364895, 0.1236217, 0.7373369, 1, 1, 1, 1, 1,
0.5434976, -1.333961, 1.35853, 1, 1, 1, 1, 1,
0.5449076, -0.2139771, 0.4648466, 0, 0, 1, 1, 1,
0.5465629, 0.4414791, 1.563483, 1, 0, 0, 1, 1,
0.556453, 0.3387793, -0.2071015, 1, 0, 0, 1, 1,
0.5638701, 1.313418, -0.2691939, 1, 0, 0, 1, 1,
0.5665505, -0.5247608, 2.990205, 1, 0, 0, 1, 1,
0.5666347, 0.5901269, 1.341892, 1, 0, 0, 1, 1,
0.5671641, 1.920332, -0.2732778, 0, 0, 0, 1, 1,
0.5682145, 0.6642267, -0.06222105, 0, 0, 0, 1, 1,
0.5725994, 1.64435, 1.47937, 0, 0, 0, 1, 1,
0.5734114, 1.498693, 0.9562696, 0, 0, 0, 1, 1,
0.5738724, 0.1076685, 2.652123, 0, 0, 0, 1, 1,
0.5748008, 0.05767081, 3.272234, 0, 0, 0, 1, 1,
0.5752261, 2.100271, 0.409558, 0, 0, 0, 1, 1,
0.578616, 0.5112002, 0.9874414, 1, 1, 1, 1, 1,
0.5786316, -0.05279107, 1.473286, 1, 1, 1, 1, 1,
0.5803241, 1.25986, -0.2035877, 1, 1, 1, 1, 1,
0.5804656, 0.9588049, 0.1219899, 1, 1, 1, 1, 1,
0.5872654, -0.1359821, 2.179895, 1, 1, 1, 1, 1,
0.5921939, 0.004276011, 0.6046045, 1, 1, 1, 1, 1,
0.5996447, 0.08958977, 2.455512, 1, 1, 1, 1, 1,
0.6095679, -1.08599, 2.815781, 1, 1, 1, 1, 1,
0.609921, 0.1976293, 2.114314, 1, 1, 1, 1, 1,
0.6108789, -0.9693621, 1.419671, 1, 1, 1, 1, 1,
0.6115209, 0.6171525, 0.7902033, 1, 1, 1, 1, 1,
0.6133529, -1.502886, 3.65846, 1, 1, 1, 1, 1,
0.6136431, -0.7112503, 2.292427, 1, 1, 1, 1, 1,
0.6147987, -0.1178367, 1.774816, 1, 1, 1, 1, 1,
0.6206471, 0.4407934, 1.12889, 1, 1, 1, 1, 1,
0.6211064, 1.748259, 0.740554, 0, 0, 1, 1, 1,
0.621551, 1.062414, -0.04612645, 1, 0, 0, 1, 1,
0.6219232, -0.3223126, 0.5378863, 1, 0, 0, 1, 1,
0.6274922, -0.763194, 1.271511, 1, 0, 0, 1, 1,
0.6322991, 0.4650969, 0.7927517, 1, 0, 0, 1, 1,
0.6372675, 0.5557374, 0.3922201, 1, 0, 0, 1, 1,
0.6390092, -0.7823802, 2.105044, 0, 0, 0, 1, 1,
0.6391065, 1.760555, 0.1159145, 0, 0, 0, 1, 1,
0.640814, 1.309505, -0.558038, 0, 0, 0, 1, 1,
0.6453955, 0.4021496, -0.8831219, 0, 0, 0, 1, 1,
0.6620958, -1.499333, 2.180172, 0, 0, 0, 1, 1,
0.665608, -0.07282516, 2.65571, 0, 0, 0, 1, 1,
0.6670843, 2.539673, -1.291278, 0, 0, 0, 1, 1,
0.6672087, 0.7242188, 1.125417, 1, 1, 1, 1, 1,
0.6726947, 0.917614, 1.793654, 1, 1, 1, 1, 1,
0.6728982, -0.3191186, 1.867461, 1, 1, 1, 1, 1,
0.6764058, 1.357405, -0.4070341, 1, 1, 1, 1, 1,
0.6769416, 1.589236, -0.1027349, 1, 1, 1, 1, 1,
0.6820142, 0.4959975, 0.3683623, 1, 1, 1, 1, 1,
0.6854463, 0.4144538, 0.841791, 1, 1, 1, 1, 1,
0.6858709, 2.130475, -0.338264, 1, 1, 1, 1, 1,
0.6898196, -0.6909716, 2.788452, 1, 1, 1, 1, 1,
0.7023578, -0.4855408, 3.180978, 1, 1, 1, 1, 1,
0.7156296, -1.164587, 1.862354, 1, 1, 1, 1, 1,
0.7193431, 0.5485185, 0.8384922, 1, 1, 1, 1, 1,
0.7257649, -0.6954625, 2.309416, 1, 1, 1, 1, 1,
0.7270592, 1.09452, 1.345389, 1, 1, 1, 1, 1,
0.7272331, -1.669881, 2.757706, 1, 1, 1, 1, 1,
0.7347423, 2.236061, -0.03888478, 0, 0, 1, 1, 1,
0.7379679, -2.552367, 4.80179, 1, 0, 0, 1, 1,
0.7430348, 0.02364089, 3.349028, 1, 0, 0, 1, 1,
0.7490425, -0.8632617, 2.288008, 1, 0, 0, 1, 1,
0.757059, 1.274446, 1.316574, 1, 0, 0, 1, 1,
0.760743, -2.682892, 3.587082, 1, 0, 0, 1, 1,
0.7730071, 0.4795462, 2.417462, 0, 0, 0, 1, 1,
0.7779933, -0.3946193, 2.714155, 0, 0, 0, 1, 1,
0.778694, 0.4052191, 1.792717, 0, 0, 0, 1, 1,
0.7826906, 0.989625, 0.07886221, 0, 0, 0, 1, 1,
0.7866385, 0.3398817, 0.509485, 0, 0, 0, 1, 1,
0.7885217, -1.06604, 3.596127, 0, 0, 0, 1, 1,
0.793154, -1.581124, 3.107739, 0, 0, 0, 1, 1,
0.7933952, 0.7931059, 2.139221, 1, 1, 1, 1, 1,
0.8015181, 0.4304018, 0.3621927, 1, 1, 1, 1, 1,
0.803031, -2.935303, 3.175262, 1, 1, 1, 1, 1,
0.8045235, 0.3966437, 0.3052451, 1, 1, 1, 1, 1,
0.8056272, -1.444591, 3.523024, 1, 1, 1, 1, 1,
0.8075761, 0.04452796, 2.021857, 1, 1, 1, 1, 1,
0.8093997, 0.2534159, 1.197027, 1, 1, 1, 1, 1,
0.8118998, 0.2747673, 0.7877555, 1, 1, 1, 1, 1,
0.8123411, -0.7259994, 0.9146907, 1, 1, 1, 1, 1,
0.8126103, -1.294103, 2.948751, 1, 1, 1, 1, 1,
0.8153067, 0.3723865, 1.26302, 1, 1, 1, 1, 1,
0.8157333, 1.080159, -0.3665267, 1, 1, 1, 1, 1,
0.8446612, -0.3662335, 3.168074, 1, 1, 1, 1, 1,
0.8535075, -1.1093, 2.068386, 1, 1, 1, 1, 1,
0.8643644, -0.3864946, 3.166637, 1, 1, 1, 1, 1,
0.870204, 0.3513718, 0.7085496, 0, 0, 1, 1, 1,
0.8704875, -0.2786872, 1.732464, 1, 0, 0, 1, 1,
0.8760018, -0.02947901, 2.565623, 1, 0, 0, 1, 1,
0.8819331, 0.1734365, 2.894471, 1, 0, 0, 1, 1,
0.888425, 0.9222826, 0.8362262, 1, 0, 0, 1, 1,
0.8914289, 0.8279927, 1.013427, 1, 0, 0, 1, 1,
0.8991311, -0.9078246, 2.698384, 0, 0, 0, 1, 1,
0.8994107, 0.5561387, 0.960745, 0, 0, 0, 1, 1,
0.9110295, -0.3099474, 2.571305, 0, 0, 0, 1, 1,
0.9158062, -0.3126626, 0.188296, 0, 0, 0, 1, 1,
0.920067, -0.7126061, 3.622581, 0, 0, 0, 1, 1,
0.9253941, -1.173264, 2.982302, 0, 0, 0, 1, 1,
0.9357024, -0.9288293, 1.75804, 0, 0, 0, 1, 1,
0.9367437, -0.6930511, 2.340507, 1, 1, 1, 1, 1,
0.9442731, 0.6894131, 0.6796591, 1, 1, 1, 1, 1,
0.9471601, -0.2859199, 3.298948, 1, 1, 1, 1, 1,
0.9508579, 1.345366, 1.793309, 1, 1, 1, 1, 1,
0.9516613, 0.4821694, 2.385263, 1, 1, 1, 1, 1,
0.9547213, 0.06353171, 2.67, 1, 1, 1, 1, 1,
0.9568124, 0.3402023, 0.1177552, 1, 1, 1, 1, 1,
0.9589184, -0.120623, 1.733967, 1, 1, 1, 1, 1,
0.9613738, 0.3206986, 2.116487, 1, 1, 1, 1, 1,
0.9624916, 0.3176715, 1.671485, 1, 1, 1, 1, 1,
0.9628091, -0.5582824, 1.716368, 1, 1, 1, 1, 1,
0.9635137, 0.3857116, 0.603571, 1, 1, 1, 1, 1,
0.9641199, -0.9827807, 2.082727, 1, 1, 1, 1, 1,
0.967801, -1.435458, 4.196004, 1, 1, 1, 1, 1,
0.9704221, 0.4529819, 1.917467, 1, 1, 1, 1, 1,
0.9705284, 0.2144268, 0.1361066, 0, 0, 1, 1, 1,
0.9725283, -1.734842, 3.289365, 1, 0, 0, 1, 1,
0.9735494, -0.8974752, 2.380887, 1, 0, 0, 1, 1,
0.984455, -0.2184582, 2.033504, 1, 0, 0, 1, 1,
0.9910647, -1.804434, 1.829082, 1, 0, 0, 1, 1,
0.9918277, -0.8066316, 2.271409, 1, 0, 0, 1, 1,
1.005931, 0.8585145, 0.8646525, 0, 0, 0, 1, 1,
1.01044, 0.5661568, 0.5707144, 0, 0, 0, 1, 1,
1.01372, -1.151226, 2.219516, 0, 0, 0, 1, 1,
1.017676, -0.3452875, 1.64048, 0, 0, 0, 1, 1,
1.024634, 1.673072, 2.941365, 0, 0, 0, 1, 1,
1.026053, 0.2685093, 1.544336, 0, 0, 0, 1, 1,
1.028993, -0.827368, 0.5252057, 0, 0, 0, 1, 1,
1.03508, 0.6187194, 1.261452, 1, 1, 1, 1, 1,
1.037216, 0.03046675, 1.921252, 1, 1, 1, 1, 1,
1.042176, 0.4908988, 0.7169555, 1, 1, 1, 1, 1,
1.049277, 0.1981038, 0.6663446, 1, 1, 1, 1, 1,
1.058851, 1.669921, 0.7242296, 1, 1, 1, 1, 1,
1.060401, -1.590525, 3.968623, 1, 1, 1, 1, 1,
1.067677, 2.122679, -1.592481, 1, 1, 1, 1, 1,
1.068119, 1.030381, -0.1271218, 1, 1, 1, 1, 1,
1.069301, -0.3281384, 2.300741, 1, 1, 1, 1, 1,
1.081344, -0.3082277, 0.9412382, 1, 1, 1, 1, 1,
1.085865, -0.4585338, 1.598868, 1, 1, 1, 1, 1,
1.095576, 2.432208, 1.443424, 1, 1, 1, 1, 1,
1.095666, -2.484821, 2.316494, 1, 1, 1, 1, 1,
1.097441, 0.3620835, 0.1338784, 1, 1, 1, 1, 1,
1.099545, 0.6274694, 2.42315, 1, 1, 1, 1, 1,
1.100433, -1.812973, 2.91177, 0, 0, 1, 1, 1,
1.102532, 1.517473, -0.5997849, 1, 0, 0, 1, 1,
1.114203, -0.01180122, 1.591698, 1, 0, 0, 1, 1,
1.117406, -0.8128063, 2.488878, 1, 0, 0, 1, 1,
1.120664, -1.863838, -0.4528769, 1, 0, 0, 1, 1,
1.121435, 0.6094055, 1.70272, 1, 0, 0, 1, 1,
1.12728, -0.06259459, 1.607645, 0, 0, 0, 1, 1,
1.128814, 0.2932566, 2.493483, 0, 0, 0, 1, 1,
1.145402, -1.017794, 2.096737, 0, 0, 0, 1, 1,
1.149064, -0.7322327, 0.143011, 0, 0, 0, 1, 1,
1.150027, -0.1281702, 3.59376, 0, 0, 0, 1, 1,
1.152312, 0.3329006, 0.1922043, 0, 0, 0, 1, 1,
1.167934, 0.1708088, 3.359807, 0, 0, 0, 1, 1,
1.17928, 0.6618439, 0.6275488, 1, 1, 1, 1, 1,
1.185046, -0.7522778, 0.9154186, 1, 1, 1, 1, 1,
1.198227, 0.206729, 2.217418, 1, 1, 1, 1, 1,
1.20627, 0.4886365, 1.651687, 1, 1, 1, 1, 1,
1.213102, -1.737162, 3.460319, 1, 1, 1, 1, 1,
1.213325, -0.4617178, 0.7783649, 1, 1, 1, 1, 1,
1.21396, -0.7022087, 3.760593, 1, 1, 1, 1, 1,
1.222447, -0.9972278, 4.047933, 1, 1, 1, 1, 1,
1.231037, 0.9192439, 1.707579, 1, 1, 1, 1, 1,
1.239421, 0.6137229, 0.4374489, 1, 1, 1, 1, 1,
1.246711, 0.2951679, 1.484025, 1, 1, 1, 1, 1,
1.285298, 1.75382, -0.7285066, 1, 1, 1, 1, 1,
1.289587, 0.5259149, 1.527364, 1, 1, 1, 1, 1,
1.29026, 0.6944629, -0.6181187, 1, 1, 1, 1, 1,
1.296184, 2.883859, 1.141629, 1, 1, 1, 1, 1,
1.298747, -0.2034836, 4.008727, 0, 0, 1, 1, 1,
1.298775, 0.3540656, 1.381454, 1, 0, 0, 1, 1,
1.304294, 0.4010794, 0.4080651, 1, 0, 0, 1, 1,
1.305628, -1.011183, 0.9501461, 1, 0, 0, 1, 1,
1.308762, -0.724218, 1.375528, 1, 0, 0, 1, 1,
1.319632, -0.6720357, 3.182135, 1, 0, 0, 1, 1,
1.341845, -0.7029333, 1.763688, 0, 0, 0, 1, 1,
1.342548, 0.5968423, 1.420844, 0, 0, 0, 1, 1,
1.343657, 0.3534025, 2.16116, 0, 0, 0, 1, 1,
1.352244, 0.4713427, 2.691743, 0, 0, 0, 1, 1,
1.352737, -1.660477, 2.651508, 0, 0, 0, 1, 1,
1.353126, 0.3975586, 0.8595468, 0, 0, 0, 1, 1,
1.35497, -1.423944, 1.692641, 0, 0, 0, 1, 1,
1.357887, -0.2292425, 3.400126, 1, 1, 1, 1, 1,
1.358808, 0.2038384, 2.168939, 1, 1, 1, 1, 1,
1.361551, 0.5718466, -0.4272144, 1, 1, 1, 1, 1,
1.365496, 2.2767, -0.466912, 1, 1, 1, 1, 1,
1.370029, 0.1703935, 1.976889, 1, 1, 1, 1, 1,
1.379387, 0.7827681, 1.428341, 1, 1, 1, 1, 1,
1.38118, -1.78194, 2.179947, 1, 1, 1, 1, 1,
1.385676, -0.6027324, 0.9618383, 1, 1, 1, 1, 1,
1.385836, -1.500255, 1.962433, 1, 1, 1, 1, 1,
1.393947, 0.2411014, 1.910489, 1, 1, 1, 1, 1,
1.40393, 1.171454, 0.7737514, 1, 1, 1, 1, 1,
1.413872, 1.153719, 2.589673, 1, 1, 1, 1, 1,
1.459794, -1.695878, 2.418025, 1, 1, 1, 1, 1,
1.473825, 1.572354, 0.9724262, 1, 1, 1, 1, 1,
1.481491, 0.55185, 0.203767, 1, 1, 1, 1, 1,
1.48324, 0.5011351, 1.293806, 0, 0, 1, 1, 1,
1.492262, -1.359121, 2.572565, 1, 0, 0, 1, 1,
1.495047, -0.1129196, 0.7840062, 1, 0, 0, 1, 1,
1.495619, -1.082324, 1.432117, 1, 0, 0, 1, 1,
1.514089, 0.5652015, 0.5668316, 1, 0, 0, 1, 1,
1.51544, 1.738408, -0.2973297, 1, 0, 0, 1, 1,
1.522369, 1.603062, -0.9508564, 0, 0, 0, 1, 1,
1.543614, -0.1196032, 0.5788378, 0, 0, 0, 1, 1,
1.557079, 1.357228, 1.114663, 0, 0, 0, 1, 1,
1.563025, 1.446948, -0.02923393, 0, 0, 0, 1, 1,
1.572546, 0.2827471, 1.801928, 0, 0, 0, 1, 1,
1.5782, 1.826612, -0.4112742, 0, 0, 0, 1, 1,
1.580953, -1.285022, 1.334511, 0, 0, 0, 1, 1,
1.586657, 0.6608611, 1.793113, 1, 1, 1, 1, 1,
1.595361, -1.5476, 0.8157027, 1, 1, 1, 1, 1,
1.601601, 0.6756783, -0.1578912, 1, 1, 1, 1, 1,
1.624227, 0.2648182, 1.332428, 1, 1, 1, 1, 1,
1.641194, -0.8280013, 3.014349, 1, 1, 1, 1, 1,
1.64994, -0.03335589, 2.115746, 1, 1, 1, 1, 1,
1.651419, 0.1284262, 0.9714647, 1, 1, 1, 1, 1,
1.667493, -0.4072916, 2.171525, 1, 1, 1, 1, 1,
1.678776, 1.232679, 0.9637232, 1, 1, 1, 1, 1,
1.692183, -0.2086418, -0.1801343, 1, 1, 1, 1, 1,
1.693091, -1.970546, 3.534174, 1, 1, 1, 1, 1,
1.701186, -0.4885042, 1.357585, 1, 1, 1, 1, 1,
1.702661, 0.002489419, 2.979248, 1, 1, 1, 1, 1,
1.705205, -1.517889, 3.992968, 1, 1, 1, 1, 1,
1.720692, 1.47176, 1.946896, 1, 1, 1, 1, 1,
1.721123, -0.1209469, 1.96276, 0, 0, 1, 1, 1,
1.724683, 0.09724651, 2.275726, 1, 0, 0, 1, 1,
1.732159, 0.6289245, 2.547042, 1, 0, 0, 1, 1,
1.741799, 0.2724432, 0.3310119, 1, 0, 0, 1, 1,
1.749754, 0.04934195, 0.4230473, 1, 0, 0, 1, 1,
1.750009, 0.5917084, 1.152349, 1, 0, 0, 1, 1,
1.768611, 0.7597569, 2.144469, 0, 0, 0, 1, 1,
1.785617, 1.376486, 2.728694, 0, 0, 0, 1, 1,
1.829743, 2.092067, 0.9097788, 0, 0, 0, 1, 1,
1.834222, -0.05478043, 5.485051, 0, 0, 0, 1, 1,
1.866005, 0.3936129, 0.9452342, 0, 0, 0, 1, 1,
1.866305, 0.263245, 2.720423, 0, 0, 0, 1, 1,
1.879464, 0.6728134, 2.704047, 0, 0, 0, 1, 1,
1.883705, 0.1109668, 0.5029142, 1, 1, 1, 1, 1,
1.889763, -1.186782, 2.746448, 1, 1, 1, 1, 1,
1.892654, 0.5937008, 0.8899425, 1, 1, 1, 1, 1,
1.905912, 1.449844, 1.568376, 1, 1, 1, 1, 1,
1.910642, -1.006095, 2.15905, 1, 1, 1, 1, 1,
1.959451, 0.3720966, 1.650607, 1, 1, 1, 1, 1,
1.963304, 1.009981, 1.864776, 1, 1, 1, 1, 1,
1.974752, -0.7150089, 0.9908288, 1, 1, 1, 1, 1,
2.015615, 0.6026617, -0.0177077, 1, 1, 1, 1, 1,
2.018754, 1.239294, 1.011705, 1, 1, 1, 1, 1,
2.043907, 2.510064, 1.810298, 1, 1, 1, 1, 1,
2.044867, -0.848397, 3.179544, 1, 1, 1, 1, 1,
2.072109, 1.260732, 2.083234, 1, 1, 1, 1, 1,
2.085017, -0.3628907, 1.058688, 1, 1, 1, 1, 1,
2.121577, -1.260476, 2.016993, 1, 1, 1, 1, 1,
2.139392, 2.104142, 1.347399, 0, 0, 1, 1, 1,
2.14461, 0.01191765, 2.163, 1, 0, 0, 1, 1,
2.145451, -0.1201079, 1.67177, 1, 0, 0, 1, 1,
2.150949, -1.538632, 1.885582, 1, 0, 0, 1, 1,
2.191642, -0.6022786, 2.044422, 1, 0, 0, 1, 1,
2.19619, 0.8386238, 0.417644, 1, 0, 0, 1, 1,
2.217412, 0.03418881, 0.9042246, 0, 0, 0, 1, 1,
2.259251, -0.111798, 1.095594, 0, 0, 0, 1, 1,
2.320884, 0.9772393, 0.8071118, 0, 0, 0, 1, 1,
2.359619, 0.6059042, 0.06680571, 0, 0, 0, 1, 1,
2.394919, -1.468377, 1.257498, 0, 0, 0, 1, 1,
2.411621, 0.2919337, 0.2508149, 0, 0, 0, 1, 1,
2.538052, 1.152642, 2.186865, 0, 0, 0, 1, 1,
2.584066, -0.1961898, 1.928164, 1, 1, 1, 1, 1,
2.738635, -0.3355854, 2.080001, 1, 1, 1, 1, 1,
2.757629, -1.246421, 2.135061, 1, 1, 1, 1, 1,
2.770139, 0.1443932, -0.4588062, 1, 1, 1, 1, 1,
3.112418, -0.7453678, 1.43972, 1, 1, 1, 1, 1,
3.196031, 0.5712248, 3.270728, 1, 1, 1, 1, 1,
3.287633, 1.366241, 1.844653, 1, 1, 1, 1, 1
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
var radius = 10.05546;
var distance = 35.31939;
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
mvMatrix.translate( 0.003531456, -0.3449149, -0.08971953 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.31939);
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
