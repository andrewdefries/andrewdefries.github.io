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
-3.804124, -0.6811389, -1.78952, 1, 0, 0, 1,
-3.172802, 1.134445, -1.986521, 1, 0.007843138, 0, 1,
-2.96398, 0.01569776, -1.6235, 1, 0.01176471, 0, 1,
-2.745689, -0.247332, -3.497861, 1, 0.01960784, 0, 1,
-2.533874, 0.2568196, -1.092135, 1, 0.02352941, 0, 1,
-2.421621, 0.1181294, -2.485149, 1, 0.03137255, 0, 1,
-2.383795, -0.1515176, -1.188882, 1, 0.03529412, 0, 1,
-2.378036, 0.5572868, -3.306018, 1, 0.04313726, 0, 1,
-2.341002, -0.2300203, -0.04536022, 1, 0.04705882, 0, 1,
-2.254915, 0.3339887, -1.467123, 1, 0.05490196, 0, 1,
-2.23979, -0.3994496, -3.802428, 1, 0.05882353, 0, 1,
-2.231221, -0.3720438, -3.514014, 1, 0.06666667, 0, 1,
-2.199693, -1.046094, -2.033305, 1, 0.07058824, 0, 1,
-2.194558, -1.361502, -2.798436, 1, 0.07843138, 0, 1,
-2.186218, 2.174977, -1.413212, 1, 0.08235294, 0, 1,
-2.124466, -1.03395, -4.099171, 1, 0.09019608, 0, 1,
-2.098006, -1.071193, -1.652842, 1, 0.09411765, 0, 1,
-2.090275, -1.063756, -2.604193, 1, 0.1019608, 0, 1,
-2.071693, -2.159931, -3.351864, 1, 0.1098039, 0, 1,
-2.055182, 1.964068, 0.06472461, 1, 0.1137255, 0, 1,
-2.039838, 0.9918089, -3.148834, 1, 0.1215686, 0, 1,
-2.039545, 2.095317, -0.4655872, 1, 0.1254902, 0, 1,
-1.952931, -0.7106722, -3.918149, 1, 0.1333333, 0, 1,
-1.946852, 0.8087236, -3.023633, 1, 0.1372549, 0, 1,
-1.91879, -0.7213314, -1.850882, 1, 0.145098, 0, 1,
-1.913931, 0.9840478, -1.544309, 1, 0.1490196, 0, 1,
-1.909217, -1.550255, -1.622147, 1, 0.1568628, 0, 1,
-1.852962, -1.226728, -2.234204, 1, 0.1607843, 0, 1,
-1.83604, -0.1489436, -1.836792, 1, 0.1686275, 0, 1,
-1.834194, -0.3278004, -2.457, 1, 0.172549, 0, 1,
-1.77748, 1.381268, -0.3925956, 1, 0.1803922, 0, 1,
-1.756732, 1.12421, -2.033396, 1, 0.1843137, 0, 1,
-1.721144, 0.3387707, 0.02132572, 1, 0.1921569, 0, 1,
-1.706172, -0.6427459, -2.016479, 1, 0.1960784, 0, 1,
-1.703169, 0.6271041, -0.8129049, 1, 0.2039216, 0, 1,
-1.699472, 0.4947439, -2.682566, 1, 0.2117647, 0, 1,
-1.697241, -0.8361003, -3.453494, 1, 0.2156863, 0, 1,
-1.685287, -0.01423471, -1.633958, 1, 0.2235294, 0, 1,
-1.665648, 0.9158599, -1.80602, 1, 0.227451, 0, 1,
-1.665368, -1.259641, -3.168792, 1, 0.2352941, 0, 1,
-1.659295, -1.165015, -3.848367, 1, 0.2392157, 0, 1,
-1.651203, -0.2967581, -1.152101, 1, 0.2470588, 0, 1,
-1.639097, -0.009052591, -1.202423, 1, 0.2509804, 0, 1,
-1.629593, 0.5428408, -1.327304, 1, 0.2588235, 0, 1,
-1.629426, -0.1884729, -1.834426, 1, 0.2627451, 0, 1,
-1.621074, 0.4048415, -2.504869, 1, 0.2705882, 0, 1,
-1.616228, 1.455733, 0.04957994, 1, 0.2745098, 0, 1,
-1.611283, -1.766192, -3.086524, 1, 0.282353, 0, 1,
-1.593649, 0.1306828, -1.977104, 1, 0.2862745, 0, 1,
-1.59233, 0.5098544, -3.18331, 1, 0.2941177, 0, 1,
-1.585531, -0.1467487, -1.215505, 1, 0.3019608, 0, 1,
-1.56853, -1.493785, -1.223319, 1, 0.3058824, 0, 1,
-1.567189, -0.8819675, -2.567611, 1, 0.3137255, 0, 1,
-1.551342, -2.369797, -2.7747, 1, 0.3176471, 0, 1,
-1.545591, -0.1295894, -0.7680337, 1, 0.3254902, 0, 1,
-1.538235, -0.03357904, -2.052919, 1, 0.3294118, 0, 1,
-1.517846, -1.165508, -2.67549, 1, 0.3372549, 0, 1,
-1.50891, 1.660297, -0.4945511, 1, 0.3411765, 0, 1,
-1.507555, -1.313461, -1.518487, 1, 0.3490196, 0, 1,
-1.501402, -0.1694644, -1.288084, 1, 0.3529412, 0, 1,
-1.478525, 1.308998, -1.371137, 1, 0.3607843, 0, 1,
-1.476394, 0.4917205, -2.340545, 1, 0.3647059, 0, 1,
-1.475784, -0.2935564, -2.230102, 1, 0.372549, 0, 1,
-1.471221, -0.5543132, -3.599136, 1, 0.3764706, 0, 1,
-1.457579, 0.1394253, -0.5156846, 1, 0.3843137, 0, 1,
-1.446177, -1.009127, -1.539822, 1, 0.3882353, 0, 1,
-1.441991, 1.222769, 0.1484573, 1, 0.3960784, 0, 1,
-1.441852, 0.3694352, -0.9570273, 1, 0.4039216, 0, 1,
-1.439787, 1.104529, -1.774075, 1, 0.4078431, 0, 1,
-1.417617, -1.273323, -2.696176, 1, 0.4156863, 0, 1,
-1.395934, 0.9987056, 0.3907308, 1, 0.4196078, 0, 1,
-1.383242, -0.5644967, -1.539231, 1, 0.427451, 0, 1,
-1.381812, 0.3963275, -0.7200443, 1, 0.4313726, 0, 1,
-1.374361, 0.0116938, -2.397265, 1, 0.4392157, 0, 1,
-1.373803, -0.9670478, -3.869336, 1, 0.4431373, 0, 1,
-1.372883, -0.4021322, -1.650772, 1, 0.4509804, 0, 1,
-1.36942, 1.311263, 0.0488025, 1, 0.454902, 0, 1,
-1.359888, -1.504505, -4.031212, 1, 0.4627451, 0, 1,
-1.354683, 1.199275, 0.1141589, 1, 0.4666667, 0, 1,
-1.349597, 0.96893, -0.3270861, 1, 0.4745098, 0, 1,
-1.347757, 1.491068, 0.09804098, 1, 0.4784314, 0, 1,
-1.342903, -0.6165622, -3.192614, 1, 0.4862745, 0, 1,
-1.338136, 1.555193, 0.1159422, 1, 0.4901961, 0, 1,
-1.336019, -0.03552519, -2.754055, 1, 0.4980392, 0, 1,
-1.323521, -0.8475572, -2.512386, 1, 0.5058824, 0, 1,
-1.319357, -0.03668598, -2.358405, 1, 0.509804, 0, 1,
-1.306377, 0.2690875, -1.637501, 1, 0.5176471, 0, 1,
-1.297042, 1.625065, -0.6255821, 1, 0.5215687, 0, 1,
-1.29259, -0.1928757, -1.630645, 1, 0.5294118, 0, 1,
-1.291868, -0.9817623, -3.23812, 1, 0.5333334, 0, 1,
-1.288429, -0.3128171, -2.594779, 1, 0.5411765, 0, 1,
-1.287939, -1.704348, -0.8663498, 1, 0.5450981, 0, 1,
-1.282903, 0.3467523, -2.069121, 1, 0.5529412, 0, 1,
-1.280952, -1.468353, -1.864887, 1, 0.5568628, 0, 1,
-1.265487, -0.3755513, -1.769226, 1, 0.5647059, 0, 1,
-1.264697, 0.8208144, -3.202607, 1, 0.5686275, 0, 1,
-1.26128, -0.1938838, 0.2282936, 1, 0.5764706, 0, 1,
-1.260375, 1.284291, -1.032246, 1, 0.5803922, 0, 1,
-1.255699, -0.5403766, 0.1645435, 1, 0.5882353, 0, 1,
-1.255479, 0.6583118, -1.07336, 1, 0.5921569, 0, 1,
-1.238011, -0.2969109, -1.96309, 1, 0.6, 0, 1,
-1.23551, 0.4550853, -3.4513, 1, 0.6078432, 0, 1,
-1.219883, 1.431005, -0.3435692, 1, 0.6117647, 0, 1,
-1.218438, 1.508077, -0.9554245, 1, 0.6196079, 0, 1,
-1.207914, -1.05911, -2.002358, 1, 0.6235294, 0, 1,
-1.189942, 1.293789, -0.5598497, 1, 0.6313726, 0, 1,
-1.182024, 0.1050542, -1.89822, 1, 0.6352941, 0, 1,
-1.180636, -0.6806501, -3.615792, 1, 0.6431373, 0, 1,
-1.17957, -0.1345873, -1.23943, 1, 0.6470588, 0, 1,
-1.168609, -1.815883, -3.435459, 1, 0.654902, 0, 1,
-1.164692, -0.3885476, -1.619523, 1, 0.6588235, 0, 1,
-1.161056, 0.3344638, -1.609361, 1, 0.6666667, 0, 1,
-1.156219, 0.2651932, -0.9917443, 1, 0.6705883, 0, 1,
-1.155449, -0.9181965, -3.790769, 1, 0.6784314, 0, 1,
-1.152328, -0.5494495, -2.746772, 1, 0.682353, 0, 1,
-1.152007, 0.4108071, -1.210244, 1, 0.6901961, 0, 1,
-1.149479, -1.294494, -1.222347, 1, 0.6941177, 0, 1,
-1.149232, 0.1091485, -2.619813, 1, 0.7019608, 0, 1,
-1.147099, -0.3330281, -1.650969, 1, 0.7098039, 0, 1,
-1.144072, -0.6626863, -2.382182, 1, 0.7137255, 0, 1,
-1.137587, 1.23788, 0.7505608, 1, 0.7215686, 0, 1,
-1.135728, 1.080184, -1.53405, 1, 0.7254902, 0, 1,
-1.131114, 1.606452, 0.9424892, 1, 0.7333333, 0, 1,
-1.12679, 0.5985, 0.443955, 1, 0.7372549, 0, 1,
-1.120487, 0.6237919, 0.406927, 1, 0.7450981, 0, 1,
-1.118519, 0.4969917, -1.762689, 1, 0.7490196, 0, 1,
-1.11745, -0.355736, -1.052277, 1, 0.7568628, 0, 1,
-1.115791, 1.389689, -0.07892492, 1, 0.7607843, 0, 1,
-1.110209, -2.352472, -4.967093, 1, 0.7686275, 0, 1,
-1.108513, -1.318427, -0.4659271, 1, 0.772549, 0, 1,
-1.102321, -1.575257, -2.786211, 1, 0.7803922, 0, 1,
-1.10118, 0.7988549, -1.42093, 1, 0.7843137, 0, 1,
-1.100961, 1.167299, 1.024005, 1, 0.7921569, 0, 1,
-1.093443, 0.9610313, -0.7397303, 1, 0.7960784, 0, 1,
-1.092866, 0.8125831, -1.828789, 1, 0.8039216, 0, 1,
-1.087797, -0.5293788, -0.3124571, 1, 0.8117647, 0, 1,
-1.082299, 0.4044523, -1.470484, 1, 0.8156863, 0, 1,
-1.077008, 1.23828, -0.9786642, 1, 0.8235294, 0, 1,
-1.074923, 1.37762, -0.5322318, 1, 0.827451, 0, 1,
-1.066147, 0.5502622, -1.395969, 1, 0.8352941, 0, 1,
-1.065583, 0.1141819, -1.097417, 1, 0.8392157, 0, 1,
-1.062477, 0.2652441, -0.7330733, 1, 0.8470588, 0, 1,
-1.061661, 1.894459, -1.258752, 1, 0.8509804, 0, 1,
-1.060223, 0.1311129, -2.198407, 1, 0.8588235, 0, 1,
-1.056978, -1.164144, -3.682058, 1, 0.8627451, 0, 1,
-1.0536, -1.400416, -3.255955, 1, 0.8705882, 0, 1,
-1.049748, -0.8699796, -1.101878, 1, 0.8745098, 0, 1,
-1.042989, 0.1402111, -0.290182, 1, 0.8823529, 0, 1,
-1.042677, -0.3507272, -1.663828, 1, 0.8862745, 0, 1,
-1.035121, 0.9431549, -0.1294639, 1, 0.8941177, 0, 1,
-1.023269, -2.280212, -2.921703, 1, 0.8980392, 0, 1,
-1.002518, 0.4247991, -2.29278, 1, 0.9058824, 0, 1,
-0.9978043, -0.1559387, -2.371193, 1, 0.9137255, 0, 1,
-0.9933904, -1.267635, -1.223, 1, 0.9176471, 0, 1,
-0.9875653, 0.2962506, -1.935486, 1, 0.9254902, 0, 1,
-0.9874336, -0.4468791, -1.204728, 1, 0.9294118, 0, 1,
-0.9873681, -0.9764695, -1.567106, 1, 0.9372549, 0, 1,
-0.9753374, 0.006381753, -0.06021762, 1, 0.9411765, 0, 1,
-0.9724391, -0.393764, -3.79499, 1, 0.9490196, 0, 1,
-0.9711547, 1.084272, -0.4720988, 1, 0.9529412, 0, 1,
-0.9587759, 0.0338404, -1.951724, 1, 0.9607843, 0, 1,
-0.9454184, -0.9684998, -1.744884, 1, 0.9647059, 0, 1,
-0.9404063, -1.350073, -3.95965, 1, 0.972549, 0, 1,
-0.9385279, 0.5918063, -2.130906, 1, 0.9764706, 0, 1,
-0.9361369, -1.226139, -0.07635686, 1, 0.9843137, 0, 1,
-0.933606, -0.2321519, 0.3985437, 1, 0.9882353, 0, 1,
-0.9328133, -1.120245, -0.4844641, 1, 0.9960784, 0, 1,
-0.92707, -0.3074719, -1.988701, 0.9960784, 1, 0, 1,
-0.9264885, -0.8086075, -0.7888108, 0.9921569, 1, 0, 1,
-0.9260502, 0.4952396, -1.614443, 0.9843137, 1, 0, 1,
-0.9260216, 1.823553, -0.9878696, 0.9803922, 1, 0, 1,
-0.9249391, -0.5546562, -0.4662204, 0.972549, 1, 0, 1,
-0.9240019, -0.9293793, -1.345549, 0.9686275, 1, 0, 1,
-0.9221346, 0.330209, -1.976444, 0.9607843, 1, 0, 1,
-0.9220108, -2.226338, -2.948276, 0.9568627, 1, 0, 1,
-0.9212455, -0.2316426, -3.254963, 0.9490196, 1, 0, 1,
-0.9185532, -0.5164334, -2.955209, 0.945098, 1, 0, 1,
-0.9053738, -1.572363, -3.580831, 0.9372549, 1, 0, 1,
-0.902597, -1.310784, -0.3936242, 0.9333333, 1, 0, 1,
-0.9017413, 1.62271, -0.2527306, 0.9254902, 1, 0, 1,
-0.9004262, -1.228214, -2.430274, 0.9215686, 1, 0, 1,
-0.8943077, -0.4420085, -1.512581, 0.9137255, 1, 0, 1,
-0.894199, -1.817243, -3.904402, 0.9098039, 1, 0, 1,
-0.8924062, 0.09004354, -1.585826, 0.9019608, 1, 0, 1,
-0.8872869, 1.374747, -0.5928866, 0.8941177, 1, 0, 1,
-0.8848594, -0.5749714, -2.350964, 0.8901961, 1, 0, 1,
-0.8847386, 0.4752961, 0.7871002, 0.8823529, 1, 0, 1,
-0.8830091, 0.9875044, 0.7148612, 0.8784314, 1, 0, 1,
-0.8792201, -1.149274, -2.682792, 0.8705882, 1, 0, 1,
-0.8747297, 1.205305, -1.159697, 0.8666667, 1, 0, 1,
-0.8731866, -0.0270109, -1.746583, 0.8588235, 1, 0, 1,
-0.870428, 0.2524297, -0.5007317, 0.854902, 1, 0, 1,
-0.863889, -0.4703815, -1.772598, 0.8470588, 1, 0, 1,
-0.8624665, 0.5754715, -1.837405, 0.8431373, 1, 0, 1,
-0.8609357, -1.487293, -2.478496, 0.8352941, 1, 0, 1,
-0.853744, 0.7701198, 0.4516822, 0.8313726, 1, 0, 1,
-0.8530273, 0.2493537, 0.9586912, 0.8235294, 1, 0, 1,
-0.8520381, 0.5516961, -0.6052848, 0.8196079, 1, 0, 1,
-0.8452143, 0.03359134, -0.6326967, 0.8117647, 1, 0, 1,
-0.8423038, -0.09302276, -2.43678, 0.8078431, 1, 0, 1,
-0.8422041, -0.6954542, -4.763865, 0.8, 1, 0, 1,
-0.8396913, -1.749244, -4.000293, 0.7921569, 1, 0, 1,
-0.8264176, 0.6906679, -0.380012, 0.7882353, 1, 0, 1,
-0.8252951, 0.1921737, -1.13302, 0.7803922, 1, 0, 1,
-0.8252366, -0.2951472, -1.295235, 0.7764706, 1, 0, 1,
-0.8223271, 0.3755211, -2.455783, 0.7686275, 1, 0, 1,
-0.8222629, 1.362286, -2.209654, 0.7647059, 1, 0, 1,
-0.8217333, 0.9344498, -0.7839307, 0.7568628, 1, 0, 1,
-0.8137829, -1.316041, -3.480523, 0.7529412, 1, 0, 1,
-0.8075137, 1.45033, -0.7842215, 0.7450981, 1, 0, 1,
-0.8053889, 0.01833883, -2.935355, 0.7411765, 1, 0, 1,
-0.8049277, 1.217678, -0.935086, 0.7333333, 1, 0, 1,
-0.8045361, -0.5966589, -4.21677, 0.7294118, 1, 0, 1,
-0.7998158, -0.3154175, -1.398664, 0.7215686, 1, 0, 1,
-0.7975595, -0.299184, -2.117734, 0.7176471, 1, 0, 1,
-0.7932432, -2.105784, -2.384604, 0.7098039, 1, 0, 1,
-0.7880412, 0.3454039, -0.9852503, 0.7058824, 1, 0, 1,
-0.7864289, 1.208123, -1.716853, 0.6980392, 1, 0, 1,
-0.7827444, -0.7700979, -4.19938, 0.6901961, 1, 0, 1,
-0.7780365, 0.328532, -2.242934, 0.6862745, 1, 0, 1,
-0.7755979, 0.2153444, -1.327953, 0.6784314, 1, 0, 1,
-0.7720799, 0.8704925, -0.532338, 0.6745098, 1, 0, 1,
-0.7714675, -0.2616, -2.742983, 0.6666667, 1, 0, 1,
-0.7708734, 0.4748484, -0.94952, 0.6627451, 1, 0, 1,
-0.761447, -0.8709128, 0.06392244, 0.654902, 1, 0, 1,
-0.7539448, 0.6075485, 0.008588876, 0.6509804, 1, 0, 1,
-0.7539181, 0.6675826, 0.132778, 0.6431373, 1, 0, 1,
-0.7533023, 0.8689269, 0.04029655, 0.6392157, 1, 0, 1,
-0.7532022, -0.8258798, -2.929428, 0.6313726, 1, 0, 1,
-0.7465378, 0.653835, -1.131014, 0.627451, 1, 0, 1,
-0.7425885, 1.007189, -0.05818978, 0.6196079, 1, 0, 1,
-0.7423924, 0.6342685, -0.3320552, 0.6156863, 1, 0, 1,
-0.7422016, 1.562266, -0.9816733, 0.6078432, 1, 0, 1,
-0.7412304, 0.1933713, -1.499146, 0.6039216, 1, 0, 1,
-0.7408561, 0.2796853, -3.389848, 0.5960785, 1, 0, 1,
-0.7345789, -0.01186935, -2.481169, 0.5882353, 1, 0, 1,
-0.7322873, 1.885522, -0.6851916, 0.5843138, 1, 0, 1,
-0.7282922, -0.02157433, 1.518333, 0.5764706, 1, 0, 1,
-0.7233806, 0.158111, -2.595054, 0.572549, 1, 0, 1,
-0.7233305, -0.1853475, -2.331717, 0.5647059, 1, 0, 1,
-0.7232685, -1.283883, -3.126094, 0.5607843, 1, 0, 1,
-0.718374, 1.427657, 0.6973196, 0.5529412, 1, 0, 1,
-0.7179522, -0.8643445, -2.856411, 0.5490196, 1, 0, 1,
-0.7145187, -1.237064, -3.091896, 0.5411765, 1, 0, 1,
-0.7137722, 2.898198, -1.402972, 0.5372549, 1, 0, 1,
-0.7113534, -0.1149249, -2.108245, 0.5294118, 1, 0, 1,
-0.7083026, 0.4605738, -0.8323184, 0.5254902, 1, 0, 1,
-0.698191, -0.007535131, -1.133618, 0.5176471, 1, 0, 1,
-0.6976493, 1.213172, -0.63986, 0.5137255, 1, 0, 1,
-0.6940024, -0.4062508, -3.19154, 0.5058824, 1, 0, 1,
-0.6900008, -1.559126, -2.010228, 0.5019608, 1, 0, 1,
-0.687162, 0.8637357, -0.5975096, 0.4941176, 1, 0, 1,
-0.6858837, -1.373626, -2.396893, 0.4862745, 1, 0, 1,
-0.6845249, 1.779472, -2.145958, 0.4823529, 1, 0, 1,
-0.674422, 0.727797, 0.4878383, 0.4745098, 1, 0, 1,
-0.6712775, 1.052116, -2.509111, 0.4705882, 1, 0, 1,
-0.6586224, -0.4577081, -0.337583, 0.4627451, 1, 0, 1,
-0.6549194, -0.9317393, -1.222428, 0.4588235, 1, 0, 1,
-0.6542751, 0.2464936, -0.8628283, 0.4509804, 1, 0, 1,
-0.6494106, 0.01281259, -2.64258, 0.4470588, 1, 0, 1,
-0.6487265, 0.4493629, -2.677288, 0.4392157, 1, 0, 1,
-0.6474066, -1.16944, -2.959016, 0.4352941, 1, 0, 1,
-0.6467382, 0.008221304, -2.34072, 0.427451, 1, 0, 1,
-0.6420064, 0.6235706, 0.4425395, 0.4235294, 1, 0, 1,
-0.6334905, 0.4854321, -1.380415, 0.4156863, 1, 0, 1,
-0.6267096, -0.2776837, -1.052638, 0.4117647, 1, 0, 1,
-0.6249349, 0.2349935, -2.593075, 0.4039216, 1, 0, 1,
-0.6159568, -0.2949221, -3.83271, 0.3960784, 1, 0, 1,
-0.6064537, -0.6535354, -1.712846, 0.3921569, 1, 0, 1,
-0.604276, 0.8331169, -0.6306309, 0.3843137, 1, 0, 1,
-0.6036789, -1.189396, -3.872907, 0.3803922, 1, 0, 1,
-0.6035372, -0.07904232, -1.399421, 0.372549, 1, 0, 1,
-0.6028199, 0.4940228, -0.2539879, 0.3686275, 1, 0, 1,
-0.6007085, -1.887466, -1.97146, 0.3607843, 1, 0, 1,
-0.5981228, -0.2454676, -2.016358, 0.3568628, 1, 0, 1,
-0.5966463, 0.6320744, -0.7830311, 0.3490196, 1, 0, 1,
-0.5938202, 0.1929828, -1.739327, 0.345098, 1, 0, 1,
-0.5930218, -1.5457, -1.995167, 0.3372549, 1, 0, 1,
-0.5913733, 0.5457446, 0.04117267, 0.3333333, 1, 0, 1,
-0.58939, -0.7885654, -2.764798, 0.3254902, 1, 0, 1,
-0.5842968, 0.3738899, -1.968559, 0.3215686, 1, 0, 1,
-0.5828748, 0.2275937, -0.2582939, 0.3137255, 1, 0, 1,
-0.5822544, 1.211384, -1.167747, 0.3098039, 1, 0, 1,
-0.5806301, -0.7687108, -3.270157, 0.3019608, 1, 0, 1,
-0.5803581, 0.3687068, 0.03880783, 0.2941177, 1, 0, 1,
-0.579677, 0.8567713, -0.1143989, 0.2901961, 1, 0, 1,
-0.5792702, 0.6719263, -1.481535, 0.282353, 1, 0, 1,
-0.5766497, 0.3998503, -0.7792393, 0.2784314, 1, 0, 1,
-0.5741206, 0.3776906, -1.156969, 0.2705882, 1, 0, 1,
-0.5727181, -0.6365579, 0.7658125, 0.2666667, 1, 0, 1,
-0.5693873, 1.630245, 0.252986, 0.2588235, 1, 0, 1,
-0.5687174, -0.3471436, -2.619489, 0.254902, 1, 0, 1,
-0.5682055, 2.003413, 0.4169537, 0.2470588, 1, 0, 1,
-0.5655977, 0.1335172, -1.719622, 0.2431373, 1, 0, 1,
-0.5565162, 1.770886, -0.802982, 0.2352941, 1, 0, 1,
-0.5474162, -0.1961283, -2.068793, 0.2313726, 1, 0, 1,
-0.5466709, 1.667664, -0.2831402, 0.2235294, 1, 0, 1,
-0.5458793, 0.5953329, -1.260869, 0.2196078, 1, 0, 1,
-0.5438293, -0.9140498, -3.289769, 0.2117647, 1, 0, 1,
-0.5364615, -0.3199443, -3.072076, 0.2078431, 1, 0, 1,
-0.5341687, 1.122345, -0.4371143, 0.2, 1, 0, 1,
-0.5305601, -0.1019887, -1.366509, 0.1921569, 1, 0, 1,
-0.5268164, -1.06274, -4.23595, 0.1882353, 1, 0, 1,
-0.5267848, -0.7479346, -3.411077, 0.1803922, 1, 0, 1,
-0.5253954, -0.1772543, -3.473349, 0.1764706, 1, 0, 1,
-0.5252684, 0.2403753, 0.8986537, 0.1686275, 1, 0, 1,
-0.5246037, 0.5244763, 0.0412228, 0.1647059, 1, 0, 1,
-0.5221378, 1.358796, -0.9474916, 0.1568628, 1, 0, 1,
-0.521832, -0.7050959, -2.977256, 0.1529412, 1, 0, 1,
-0.5205923, 0.9127126, -0.9221326, 0.145098, 1, 0, 1,
-0.5188258, 0.7458975, 0.500955, 0.1411765, 1, 0, 1,
-0.5186563, -0.436457, -0.5366641, 0.1333333, 1, 0, 1,
-0.5164584, 0.434802, 0.1117485, 0.1294118, 1, 0, 1,
-0.5161521, 0.4401966, -0.9654929, 0.1215686, 1, 0, 1,
-0.514393, -0.05339713, -2.782254, 0.1176471, 1, 0, 1,
-0.513378, 0.3582665, 0.5307928, 0.1098039, 1, 0, 1,
-0.5093617, 0.5283729, -0.9448228, 0.1058824, 1, 0, 1,
-0.5044261, 0.6181539, -0.5624943, 0.09803922, 1, 0, 1,
-0.5041628, -0.4796171, -2.25004, 0.09019608, 1, 0, 1,
-0.5041401, 0.8135959, 0.2873569, 0.08627451, 1, 0, 1,
-0.4993182, -1.234551, -2.816913, 0.07843138, 1, 0, 1,
-0.4985642, 0.9216669, -0.3642384, 0.07450981, 1, 0, 1,
-0.4965535, -0.3590513, -2.97338, 0.06666667, 1, 0, 1,
-0.4952207, -0.1562056, -0.4550141, 0.0627451, 1, 0, 1,
-0.4948993, -0.4450511, -3.766446, 0.05490196, 1, 0, 1,
-0.488257, -0.9733964, -3.423243, 0.05098039, 1, 0, 1,
-0.4807035, -0.6005337, -3.78798, 0.04313726, 1, 0, 1,
-0.4795856, -1.647474, -3.612783, 0.03921569, 1, 0, 1,
-0.4741229, -0.6005571, -0.8010629, 0.03137255, 1, 0, 1,
-0.4710444, 1.408716, 0.1096285, 0.02745098, 1, 0, 1,
-0.4708806, -0.8026465, -1.4621, 0.01960784, 1, 0, 1,
-0.4665271, 0.9674686, -0.5520694, 0.01568628, 1, 0, 1,
-0.4662972, -1.518015, -2.419783, 0.007843138, 1, 0, 1,
-0.464201, -0.1541385, -1.702736, 0.003921569, 1, 0, 1,
-0.4543904, 0.58482, -0.5955024, 0, 1, 0.003921569, 1,
-0.4515898, -0.1064944, 0.05156233, 0, 1, 0.01176471, 1,
-0.4461079, -0.5446499, -1.833694, 0, 1, 0.01568628, 1,
-0.4408966, -2.014738, -2.865359, 0, 1, 0.02352941, 1,
-0.43727, -0.463684, -2.568787, 0, 1, 0.02745098, 1,
-0.4310267, 0.946689, -1.636266, 0, 1, 0.03529412, 1,
-0.4297531, 0.5366477, 0.2176763, 0, 1, 0.03921569, 1,
-0.4295824, -0.4999152, -1.632825, 0, 1, 0.04705882, 1,
-0.428259, 0.0487783, -0.8911405, 0, 1, 0.05098039, 1,
-0.4218009, 0.08325192, -1.821283, 0, 1, 0.05882353, 1,
-0.4188762, -1.965889, -2.261238, 0, 1, 0.0627451, 1,
-0.4178702, -0.7090582, -3.125613, 0, 1, 0.07058824, 1,
-0.4132233, 1.22294, -1.048277, 0, 1, 0.07450981, 1,
-0.4119795, -0.7728014, -1.005863, 0, 1, 0.08235294, 1,
-0.4100815, 1.303283, -1.362734, 0, 1, 0.08627451, 1,
-0.4099555, 0.07617462, -3.216699, 0, 1, 0.09411765, 1,
-0.4053992, -0.174811, -2.012663, 0, 1, 0.1019608, 1,
-0.4045934, 0.4437593, -1.441277, 0, 1, 0.1058824, 1,
-0.3976447, -0.35384, -4.721622, 0, 1, 0.1137255, 1,
-0.3951603, 0.9074847, -3.483268, 0, 1, 0.1176471, 1,
-0.3934277, -1.033044, -2.16705, 0, 1, 0.1254902, 1,
-0.392832, -0.09034138, -3.29585, 0, 1, 0.1294118, 1,
-0.3843009, 0.1909512, -0.4863772, 0, 1, 0.1372549, 1,
-0.384235, -0.1462794, -2.271464, 0, 1, 0.1411765, 1,
-0.3841418, 0.1541974, 0.142147, 0, 1, 0.1490196, 1,
-0.3813478, -0.0303336, -2.113575, 0, 1, 0.1529412, 1,
-0.3812158, -0.383002, -0.5186724, 0, 1, 0.1607843, 1,
-0.3804072, 1.159926, 0.4241328, 0, 1, 0.1647059, 1,
-0.3766952, 0.388802, -0.3089887, 0, 1, 0.172549, 1,
-0.376652, 1.310502, 0.2712055, 0, 1, 0.1764706, 1,
-0.3762298, 1.269924, -1.605264, 0, 1, 0.1843137, 1,
-0.3713732, -0.9017155, -3.049697, 0, 1, 0.1882353, 1,
-0.3686934, 0.03751232, -0.5119066, 0, 1, 0.1960784, 1,
-0.3617482, -0.09926508, -2.364121, 0, 1, 0.2039216, 1,
-0.3612189, -2.090775, -3.595666, 0, 1, 0.2078431, 1,
-0.354168, -2.046521, -1.794194, 0, 1, 0.2156863, 1,
-0.3534633, -0.09700397, -1.926435, 0, 1, 0.2196078, 1,
-0.3520686, -0.4838803, -2.561416, 0, 1, 0.227451, 1,
-0.3511132, 0.2930929, -1.347201, 0, 1, 0.2313726, 1,
-0.3509681, 1.313611, -0.002896636, 0, 1, 0.2392157, 1,
-0.3486961, 0.4544029, -1.508995, 0, 1, 0.2431373, 1,
-0.3438785, 0.3555593, -1.581385, 0, 1, 0.2509804, 1,
-0.3397079, 1.032889, 0.5800068, 0, 1, 0.254902, 1,
-0.3390475, -0.5867133, -0.961398, 0, 1, 0.2627451, 1,
-0.3378659, -0.09972354, -2.100022, 0, 1, 0.2666667, 1,
-0.3352153, 0.05644998, -0.8875923, 0, 1, 0.2745098, 1,
-0.3347445, 0.3237965, -1.467974, 0, 1, 0.2784314, 1,
-0.3341007, -0.03854075, -2.305169, 0, 1, 0.2862745, 1,
-0.334085, 0.2712865, -0.8249753, 0, 1, 0.2901961, 1,
-0.3339289, -0.7204069, -1.130734, 0, 1, 0.2980392, 1,
-0.3267225, 1.805027, -0.8164111, 0, 1, 0.3058824, 1,
-0.32569, 1.546021, -0.8500397, 0, 1, 0.3098039, 1,
-0.3194293, 1.57564, -1.239539, 0, 1, 0.3176471, 1,
-0.3189872, 0.1803121, -1.354016, 0, 1, 0.3215686, 1,
-0.3186918, -2.091713, -3.046418, 0, 1, 0.3294118, 1,
-0.3162553, 1.049892, -0.5682495, 0, 1, 0.3333333, 1,
-0.3155354, -0.8888224, -1.687871, 0, 1, 0.3411765, 1,
-0.3123624, 0.6002673, -0.2609716, 0, 1, 0.345098, 1,
-0.3121691, 0.4327528, -0.4949057, 0, 1, 0.3529412, 1,
-0.3103492, 0.6654287, 0.1799075, 0, 1, 0.3568628, 1,
-0.3100576, -1.082696, -1.916886, 0, 1, 0.3647059, 1,
-0.3081871, 0.5565664, -0.4777121, 0, 1, 0.3686275, 1,
-0.3043748, 1.199017, -0.8437306, 0, 1, 0.3764706, 1,
-0.2978842, 1.223452, -1.432778, 0, 1, 0.3803922, 1,
-0.2971785, 0.1053278, 0.2682816, 0, 1, 0.3882353, 1,
-0.292283, -0.7226118, -1.822033, 0, 1, 0.3921569, 1,
-0.2917795, 0.7657939, -1.463279, 0, 1, 0.4, 1,
-0.2736652, 0.3328927, -0.3532307, 0, 1, 0.4078431, 1,
-0.2731217, -0.1609308, -1.20216, 0, 1, 0.4117647, 1,
-0.2724828, 0.06951265, -0.429585, 0, 1, 0.4196078, 1,
-0.2680104, 0.3117621, -1.628267, 0, 1, 0.4235294, 1,
-0.2642715, 0.2541876, -0.6408371, 0, 1, 0.4313726, 1,
-0.2425958, -0.7914845, -3.128189, 0, 1, 0.4352941, 1,
-0.2401341, -0.461418, -2.792302, 0, 1, 0.4431373, 1,
-0.2400233, -1.31685, -2.078613, 0, 1, 0.4470588, 1,
-0.239358, 0.602357, 0.5114552, 0, 1, 0.454902, 1,
-0.2356508, 0.4003539, -0.6852475, 0, 1, 0.4588235, 1,
-0.2310901, 0.4421698, -1.937002, 0, 1, 0.4666667, 1,
-0.2305528, 1.440714, -0.08473422, 0, 1, 0.4705882, 1,
-0.23035, 0.1494882, -3.043638, 0, 1, 0.4784314, 1,
-0.2295483, 1.826992, -0.4927863, 0, 1, 0.4823529, 1,
-0.225607, -0.2268622, -1.086736, 0, 1, 0.4901961, 1,
-0.2252875, 0.01331164, -0.9483355, 0, 1, 0.4941176, 1,
-0.2252691, 1.53346, 0.8450668, 0, 1, 0.5019608, 1,
-0.2195546, -1.910311, -2.533357, 0, 1, 0.509804, 1,
-0.2159978, -0.6563641, -3.99053, 0, 1, 0.5137255, 1,
-0.2132882, 1.349499, 1.342409, 0, 1, 0.5215687, 1,
-0.2126056, 0.3463284, 0.6711637, 0, 1, 0.5254902, 1,
-0.2070254, 0.5497743, 1.590304, 0, 1, 0.5333334, 1,
-0.2008597, -0.4532501, -2.812416, 0, 1, 0.5372549, 1,
-0.196481, 0.8466151, -0.8144526, 0, 1, 0.5450981, 1,
-0.1960957, 0.7240779, -0.6661096, 0, 1, 0.5490196, 1,
-0.1922441, 0.08238085, -1.043161, 0, 1, 0.5568628, 1,
-0.1877874, -0.6308744, -2.551073, 0, 1, 0.5607843, 1,
-0.1867349, 0.9550709, -0.1529139, 0, 1, 0.5686275, 1,
-0.1865487, 1.295307, -1.085673, 0, 1, 0.572549, 1,
-0.1836495, 0.3963374, -2.064066, 0, 1, 0.5803922, 1,
-0.1822216, -1.727259, -0.1919773, 0, 1, 0.5843138, 1,
-0.1803048, -0.5829663, -1.5528, 0, 1, 0.5921569, 1,
-0.1784627, -1.402745, -2.286406, 0, 1, 0.5960785, 1,
-0.1781553, -0.8988271, -1.683946, 0, 1, 0.6039216, 1,
-0.1755649, -0.05488033, -0.8449215, 0, 1, 0.6117647, 1,
-0.1664201, 0.03891303, -2.158351, 0, 1, 0.6156863, 1,
-0.1613418, 0.01405216, -2.458251, 0, 1, 0.6235294, 1,
-0.1598801, 0.4977098, -1.73181, 0, 1, 0.627451, 1,
-0.1535052, 0.739575, 1.441744, 0, 1, 0.6352941, 1,
-0.1464698, -0.07456185, -2.563019, 0, 1, 0.6392157, 1,
-0.1460198, -0.03124432, -0.3329561, 0, 1, 0.6470588, 1,
-0.1453055, -1.524786, -2.968184, 0, 1, 0.6509804, 1,
-0.1433898, 0.6922872, -1.852489, 0, 1, 0.6588235, 1,
-0.1430172, 0.3236552, -0.6289226, 0, 1, 0.6627451, 1,
-0.1412993, -1.55666, -4.165903, 0, 1, 0.6705883, 1,
-0.141296, 0.9599426, -0.008899867, 0, 1, 0.6745098, 1,
-0.1371299, -0.5592936, -3.275103, 0, 1, 0.682353, 1,
-0.1356188, -0.6428297, -1.428, 0, 1, 0.6862745, 1,
-0.1348519, -2.086266, -3.099708, 0, 1, 0.6941177, 1,
-0.1344442, 1.339768, -0.4357134, 0, 1, 0.7019608, 1,
-0.1340658, 0.2148066, -0.6201473, 0, 1, 0.7058824, 1,
-0.132819, 0.9691368, -0.6829829, 0, 1, 0.7137255, 1,
-0.1321285, -0.5765305, -2.024605, 0, 1, 0.7176471, 1,
-0.1309307, 0.06786091, -0.2949957, 0, 1, 0.7254902, 1,
-0.1037009, -0.3257782, -1.725572, 0, 1, 0.7294118, 1,
-0.101269, 1.459982, -0.2318069, 0, 1, 0.7372549, 1,
-0.1012388, 1.277145, 1.197667, 0, 1, 0.7411765, 1,
-0.1011583, 1.312863, -0.7855782, 0, 1, 0.7490196, 1,
-0.09873967, -0.7077069, -4.457424, 0, 1, 0.7529412, 1,
-0.09488399, -0.05663726, -0.6064317, 0, 1, 0.7607843, 1,
-0.09403203, 0.9845994, -0.605172, 0, 1, 0.7647059, 1,
-0.08945892, 0.4927488, 1.003733, 0, 1, 0.772549, 1,
-0.07817981, -0.201868, -2.134642, 0, 1, 0.7764706, 1,
-0.07514384, -0.4239208, -4.336692, 0, 1, 0.7843137, 1,
-0.07166307, 0.09663923, 0.9673513, 0, 1, 0.7882353, 1,
-0.05922416, -0.8278331, -2.93373, 0, 1, 0.7960784, 1,
-0.05249133, -0.4536246, -4.118656, 0, 1, 0.8039216, 1,
-0.0507312, -0.2961534, -4.348912, 0, 1, 0.8078431, 1,
-0.04837374, 0.06606746, -0.8530886, 0, 1, 0.8156863, 1,
-0.04620967, 0.4379931, -0.4974744, 0, 1, 0.8196079, 1,
-0.04372478, -0.2043596, -4.192702, 0, 1, 0.827451, 1,
-0.04328873, -0.2056347, -2.609625, 0, 1, 0.8313726, 1,
-0.04036989, -0.01081173, -0.2953174, 0, 1, 0.8392157, 1,
-0.03813028, -0.1520524, -2.370676, 0, 1, 0.8431373, 1,
-0.02957405, -0.04509502, -5.083998, 0, 1, 0.8509804, 1,
-0.02734626, -0.5275715, -5.21211, 0, 1, 0.854902, 1,
-0.02679204, -0.09624038, -3.1977, 0, 1, 0.8627451, 1,
-0.02634781, 0.532709, 0.3869772, 0, 1, 0.8666667, 1,
-0.02491073, -0.2663621, -2.452981, 0, 1, 0.8745098, 1,
-0.02466447, 0.01310676, -0.4977556, 0, 1, 0.8784314, 1,
-0.02296459, -0.5866498, -2.665753, 0, 1, 0.8862745, 1,
-0.02202502, 0.2785199, 0.1787312, 0, 1, 0.8901961, 1,
-0.01469384, -1.4545, -3.673576, 0, 1, 0.8980392, 1,
-0.01206851, -0.7070223, -4.4429, 0, 1, 0.9058824, 1,
-0.01159929, -0.2247847, -2.571033, 0, 1, 0.9098039, 1,
-0.01005475, 0.1991715, -0.9478213, 0, 1, 0.9176471, 1,
-0.008941663, -0.2864913, -1.773707, 0, 1, 0.9215686, 1,
-0.008434343, -0.5658684, -3.195496, 0, 1, 0.9294118, 1,
-0.004601454, -0.9576337, -2.563644, 0, 1, 0.9333333, 1,
-0.003274814, 1.546886, 2.304896, 0, 1, 0.9411765, 1,
0.002537524, 0.5912975, -0.5513572, 0, 1, 0.945098, 1,
0.007862934, -1.219437, 2.914985, 0, 1, 0.9529412, 1,
0.008565459, 0.2225633, -1.571874, 0, 1, 0.9568627, 1,
0.01201658, -0.9496034, 1.136945, 0, 1, 0.9647059, 1,
0.01359128, 1.33372, -0.1384782, 0, 1, 0.9686275, 1,
0.01604527, -0.748394, 3.960808, 0, 1, 0.9764706, 1,
0.01805517, 1.213229, 0.5772811, 0, 1, 0.9803922, 1,
0.02482247, 1.244694, 0.8292059, 0, 1, 0.9882353, 1,
0.02496223, 0.6329572, -1.437636, 0, 1, 0.9921569, 1,
0.0370208, 0.1479353, -0.3270205, 0, 1, 1, 1,
0.03751707, 0.2957576, 0.102753, 0, 0.9921569, 1, 1,
0.04092933, -0.2042502, 2.466269, 0, 0.9882353, 1, 1,
0.04796007, -0.3657703, 3.560883, 0, 0.9803922, 1, 1,
0.04830367, -0.474333, 3.086172, 0, 0.9764706, 1, 1,
0.0484008, 0.6781236, -0.1983373, 0, 0.9686275, 1, 1,
0.05103471, 1.536886, -1.571404, 0, 0.9647059, 1, 1,
0.05515916, -1.076196, 2.145845, 0, 0.9568627, 1, 1,
0.05705246, -0.4341292, 3.946706, 0, 0.9529412, 1, 1,
0.05912736, -0.6070794, 2.679526, 0, 0.945098, 1, 1,
0.06450592, 0.2238018, 0.7275217, 0, 0.9411765, 1, 1,
0.06557407, -0.03029592, 3.028776, 0, 0.9333333, 1, 1,
0.06739869, -0.8794279, 2.031021, 0, 0.9294118, 1, 1,
0.068455, 1.515307, -1.835607, 0, 0.9215686, 1, 1,
0.0694948, -1.185562, 3.168157, 0, 0.9176471, 1, 1,
0.07529972, 0.2712097, 0.07448413, 0, 0.9098039, 1, 1,
0.07648035, 1.37503, -0.6952674, 0, 0.9058824, 1, 1,
0.07894574, -0.5992458, 3.643793, 0, 0.8980392, 1, 1,
0.07967105, -2.168595, 2.918712, 0, 0.8901961, 1, 1,
0.08168978, -0.07671228, 0.840753, 0, 0.8862745, 1, 1,
0.08652268, -1.24966, 3.045824, 0, 0.8784314, 1, 1,
0.08741525, -1.37539, 2.635307, 0, 0.8745098, 1, 1,
0.08763331, 1.492168, -0.270008, 0, 0.8666667, 1, 1,
0.09083293, -0.9254571, 2.484657, 0, 0.8627451, 1, 1,
0.1023135, -1.448711, 1.66108, 0, 0.854902, 1, 1,
0.1068962, 0.2099486, -0.3229721, 0, 0.8509804, 1, 1,
0.1072386, 1.658505, 2.140058, 0, 0.8431373, 1, 1,
0.1075834, -0.4591927, 2.380793, 0, 0.8392157, 1, 1,
0.1078322, -0.6896834, 3.144598, 0, 0.8313726, 1, 1,
0.1089319, -0.321826, 1.959202, 0, 0.827451, 1, 1,
0.1106627, -0.1757335, 3.200417, 0, 0.8196079, 1, 1,
0.1158283, -2.437949, 3.581671, 0, 0.8156863, 1, 1,
0.1180645, -0.9533031, 1.596857, 0, 0.8078431, 1, 1,
0.121545, 1.484623, 0.7657168, 0, 0.8039216, 1, 1,
0.127011, 0.09249718, 0.01742859, 0, 0.7960784, 1, 1,
0.1272833, -0.6693351, 3.871043, 0, 0.7882353, 1, 1,
0.1293037, -0.4695513, 2.97318, 0, 0.7843137, 1, 1,
0.1317019, -0.3048626, 4.072176, 0, 0.7764706, 1, 1,
0.1338263, -0.08925094, 3.242892, 0, 0.772549, 1, 1,
0.1345365, -0.1097134, 3.097804, 0, 0.7647059, 1, 1,
0.1348587, -0.3596171, 1.990316, 0, 0.7607843, 1, 1,
0.1442644, 0.1808343, 0.6454602, 0, 0.7529412, 1, 1,
0.1449633, -0.6356547, 2.18268, 0, 0.7490196, 1, 1,
0.1451392, -0.09353724, 1.436152, 0, 0.7411765, 1, 1,
0.1464203, -0.2202907, 1.570652, 0, 0.7372549, 1, 1,
0.1489078, -1.000008, 2.201845, 0, 0.7294118, 1, 1,
0.1538446, -0.1289792, 0.7905896, 0, 0.7254902, 1, 1,
0.155967, -0.1358008, 1.873384, 0, 0.7176471, 1, 1,
0.1579109, 0.5511482, 0.3080354, 0, 0.7137255, 1, 1,
0.1618428, -0.05723462, 1.428269, 0, 0.7058824, 1, 1,
0.1636233, 0.7179227, 0.2150783, 0, 0.6980392, 1, 1,
0.1640706, -0.4529032, 1.47707, 0, 0.6941177, 1, 1,
0.1655303, 1.722071, 0.9161988, 0, 0.6862745, 1, 1,
0.1676002, -0.651604, 3.90214, 0, 0.682353, 1, 1,
0.1738656, -0.7102668, 3.748804, 0, 0.6745098, 1, 1,
0.1778091, -0.9478238, 4.046562, 0, 0.6705883, 1, 1,
0.1779066, -0.1404675, 2.402821, 0, 0.6627451, 1, 1,
0.1888247, -0.6760436, 1.948987, 0, 0.6588235, 1, 1,
0.191491, 0.8286115, 0.004126438, 0, 0.6509804, 1, 1,
0.1954933, -1.976202, 4.272428, 0, 0.6470588, 1, 1,
0.199267, -0.7809172, 1.940614, 0, 0.6392157, 1, 1,
0.2007493, 0.9123292, 0.2008783, 0, 0.6352941, 1, 1,
0.2011181, -1.037016, 1.918358, 0, 0.627451, 1, 1,
0.201338, -1.005263, 2.290322, 0, 0.6235294, 1, 1,
0.2018187, -0.9903112, 2.977063, 0, 0.6156863, 1, 1,
0.202458, 1.176575, 0.4394911, 0, 0.6117647, 1, 1,
0.203013, -0.7571236, 2.748086, 0, 0.6039216, 1, 1,
0.2098593, 0.5761503, 1.415691, 0, 0.5960785, 1, 1,
0.2125386, 1.058554, -0.5288681, 0, 0.5921569, 1, 1,
0.2221377, -0.3812886, 3.536558, 0, 0.5843138, 1, 1,
0.2230867, 0.3831699, -0.4191388, 0, 0.5803922, 1, 1,
0.2232907, 0.445107, -2.399744, 0, 0.572549, 1, 1,
0.2297773, 0.456374, -1.180421, 0, 0.5686275, 1, 1,
0.2306216, -1.009218, 1.020363, 0, 0.5607843, 1, 1,
0.2319003, 0.2009013, 0.8366631, 0, 0.5568628, 1, 1,
0.233743, 0.4789736, 1.631063, 0, 0.5490196, 1, 1,
0.2390994, -0.02441028, 0.2426572, 0, 0.5450981, 1, 1,
0.2398718, 0.09257531, 1.567659, 0, 0.5372549, 1, 1,
0.241874, 0.9383693, -1.946492, 0, 0.5333334, 1, 1,
0.242154, -1.125356, 3.586568, 0, 0.5254902, 1, 1,
0.2464079, -1.186117, 1.813387, 0, 0.5215687, 1, 1,
0.246912, 0.9684671, 2.214347, 0, 0.5137255, 1, 1,
0.2495745, -2.247375, 3.864246, 0, 0.509804, 1, 1,
0.2524602, 0.7812416, -1.039204, 0, 0.5019608, 1, 1,
0.2563758, 1.86841, -0.5177181, 0, 0.4941176, 1, 1,
0.257348, -1.052698, 3.167124, 0, 0.4901961, 1, 1,
0.2576286, -0.1868217, 1.365543, 0, 0.4823529, 1, 1,
0.2576286, -1.741392, 4.65525, 0, 0.4784314, 1, 1,
0.2653069, 0.4023523, 1.4503, 0, 0.4705882, 1, 1,
0.2667963, 0.7758597, 1.687494, 0, 0.4666667, 1, 1,
0.2695723, -0.3574396, 2.533685, 0, 0.4588235, 1, 1,
0.269988, -2.091901, 3.085612, 0, 0.454902, 1, 1,
0.2758501, -0.4758774, 2.15268, 0, 0.4470588, 1, 1,
0.2785645, 0.5808008, 0.9838139, 0, 0.4431373, 1, 1,
0.2785967, 1.55957, 0.6588905, 0, 0.4352941, 1, 1,
0.2857136, 2.011442, -0.3118227, 0, 0.4313726, 1, 1,
0.2869917, 0.7416714, 0.290018, 0, 0.4235294, 1, 1,
0.2928171, 1.454747, -1.112321, 0, 0.4196078, 1, 1,
0.2954891, 1.093839, -0.3043955, 0, 0.4117647, 1, 1,
0.2983417, -1.897099, 2.096521, 0, 0.4078431, 1, 1,
0.299324, -0.2680011, 3.073318, 0, 0.4, 1, 1,
0.2993664, -1.173083, 3.882217, 0, 0.3921569, 1, 1,
0.2994436, -1.009375, 3.637671, 0, 0.3882353, 1, 1,
0.2999473, 0.2868054, 2.714394, 0, 0.3803922, 1, 1,
0.2999665, 0.684237, -0.6181288, 0, 0.3764706, 1, 1,
0.3017669, -0.8131536, 2.485757, 0, 0.3686275, 1, 1,
0.3037618, -0.8369445, 2.670701, 0, 0.3647059, 1, 1,
0.3067456, 0.6629795, 1.207654, 0, 0.3568628, 1, 1,
0.3094685, -0.9269598, 2.408021, 0, 0.3529412, 1, 1,
0.3109526, -1.464982, 3.281835, 0, 0.345098, 1, 1,
0.315615, -0.200291, 2.792933, 0, 0.3411765, 1, 1,
0.3184534, -0.5718508, 3.137045, 0, 0.3333333, 1, 1,
0.321532, -1.504409, 3.22981, 0, 0.3294118, 1, 1,
0.3235513, 0.6946718, 1.755039, 0, 0.3215686, 1, 1,
0.323877, 0.05499379, 0.00893996, 0, 0.3176471, 1, 1,
0.3259432, 0.2499051, 1.066788, 0, 0.3098039, 1, 1,
0.3342103, -2.176401, 3.417834, 0, 0.3058824, 1, 1,
0.3344585, -0.3241605, 2.418191, 0, 0.2980392, 1, 1,
0.3348094, 0.01397789, -0.1195607, 0, 0.2901961, 1, 1,
0.337357, 0.03214035, 2.396675, 0, 0.2862745, 1, 1,
0.3387958, 0.0208332, 1.805013, 0, 0.2784314, 1, 1,
0.3388959, -1.556597, 2.618926, 0, 0.2745098, 1, 1,
0.3411913, -1.621289, 1.987814, 0, 0.2666667, 1, 1,
0.3419835, -0.4430794, 3.307256, 0, 0.2627451, 1, 1,
0.3478695, -0.1365418, 2.56621, 0, 0.254902, 1, 1,
0.3510523, 0.2325186, 0.3364892, 0, 0.2509804, 1, 1,
0.3523526, 0.09303921, 1.813329, 0, 0.2431373, 1, 1,
0.3567023, -0.354504, 1.562775, 0, 0.2392157, 1, 1,
0.3599909, 1.918183, 0.4041093, 0, 0.2313726, 1, 1,
0.360247, -0.5510111, 1.867942, 0, 0.227451, 1, 1,
0.3634345, 0.1700701, 2.563433, 0, 0.2196078, 1, 1,
0.3690816, 0.4562993, 0.5587338, 0, 0.2156863, 1, 1,
0.3707082, -1.295456, 2.848498, 0, 0.2078431, 1, 1,
0.3716951, 1.809644, -1.34489, 0, 0.2039216, 1, 1,
0.3775582, 0.5727656, 1.090758, 0, 0.1960784, 1, 1,
0.3819253, 1.101552, 1.194182, 0, 0.1882353, 1, 1,
0.3898945, 1.619064, -1.07908, 0, 0.1843137, 1, 1,
0.3929299, -1.440995, 2.574977, 0, 0.1764706, 1, 1,
0.3951316, -0.2204362, 3.489793, 0, 0.172549, 1, 1,
0.4021592, 0.4429007, 0.5752677, 0, 0.1647059, 1, 1,
0.4107194, 0.8434824, -0.4826923, 0, 0.1607843, 1, 1,
0.4170934, 0.3417212, 1.377873, 0, 0.1529412, 1, 1,
0.4261013, -1.04635, 3.031613, 0, 0.1490196, 1, 1,
0.4323001, 0.05716906, 3.023998, 0, 0.1411765, 1, 1,
0.4328312, 1.146069, 1.231051, 0, 0.1372549, 1, 1,
0.4342661, 1.091411, -1.177986, 0, 0.1294118, 1, 1,
0.4361929, 0.8943124, 0.5718489, 0, 0.1254902, 1, 1,
0.4363167, 0.2131158, 0.8454563, 0, 0.1176471, 1, 1,
0.4366029, 0.2086732, 0.9641041, 0, 0.1137255, 1, 1,
0.4386715, -0.297027, 2.239108, 0, 0.1058824, 1, 1,
0.443364, -0.3954545, 1.967895, 0, 0.09803922, 1, 1,
0.4495917, 0.3799641, -0.7155614, 0, 0.09411765, 1, 1,
0.4502648, -0.1368386, 1.049083, 0, 0.08627451, 1, 1,
0.451555, 1.447108, 0.854789, 0, 0.08235294, 1, 1,
0.4526326, -0.7464535, 3.17041, 0, 0.07450981, 1, 1,
0.4534529, 0.1476107, 2.094801, 0, 0.07058824, 1, 1,
0.4541062, -0.2556216, 1.122957, 0, 0.0627451, 1, 1,
0.4550886, 1.718601, -1.739923, 0, 0.05882353, 1, 1,
0.455213, -0.980266, 2.592671, 0, 0.05098039, 1, 1,
0.4569466, -1.492832, 1.936032, 0, 0.04705882, 1, 1,
0.4651838, 0.9354241, -1.330779, 0, 0.03921569, 1, 1,
0.4659483, 0.4827832, 0.4984066, 0, 0.03529412, 1, 1,
0.4676665, -0.2143063, 2.180501, 0, 0.02745098, 1, 1,
0.4689019, 1.661024, -1.299211, 0, 0.02352941, 1, 1,
0.4758744, -0.6768467, 1.76596, 0, 0.01568628, 1, 1,
0.4819949, -1.97236, 2.407919, 0, 0.01176471, 1, 1,
0.4861458, 0.1081941, 1.652354, 0, 0.003921569, 1, 1,
0.4921977, 1.128788, -0.8154735, 0.003921569, 0, 1, 1,
0.5002532, -0.5368781, 2.80978, 0.007843138, 0, 1, 1,
0.5037969, -1.095716, 1.968672, 0.01568628, 0, 1, 1,
0.5076763, -0.1792954, 1.662903, 0.01960784, 0, 1, 1,
0.5082225, -0.4806802, 2.688053, 0.02745098, 0, 1, 1,
0.5084951, -0.2788974, 3.520699, 0.03137255, 0, 1, 1,
0.5092732, 0.9432305, 0.2421632, 0.03921569, 0, 1, 1,
0.5138263, 2.263316, -1.47619, 0.04313726, 0, 1, 1,
0.5151244, -0.7606757, 2.563507, 0.05098039, 0, 1, 1,
0.5209786, -0.5104758, 3.783882, 0.05490196, 0, 1, 1,
0.5227721, 1.281333, -0.6641263, 0.0627451, 0, 1, 1,
0.5262333, 0.3112795, 2.831261, 0.06666667, 0, 1, 1,
0.5274585, 0.02762656, 2.272396, 0.07450981, 0, 1, 1,
0.5284966, -1.36656, 3.094893, 0.07843138, 0, 1, 1,
0.5296146, -0.6722524, 0.8262053, 0.08627451, 0, 1, 1,
0.5351471, 0.04192856, 1.555068, 0.09019608, 0, 1, 1,
0.5362883, -1.966727, 3.705396, 0.09803922, 0, 1, 1,
0.5375336, -2.080997, 2.757134, 0.1058824, 0, 1, 1,
0.5377318, 1.138641, 1.008093, 0.1098039, 0, 1, 1,
0.5388712, -0.8793985, 3.377532, 0.1176471, 0, 1, 1,
0.5414187, 0.9284299, -0.5253678, 0.1215686, 0, 1, 1,
0.5455911, -1.635197, 3.45801, 0.1294118, 0, 1, 1,
0.5490784, 1.335387, 0.8016871, 0.1333333, 0, 1, 1,
0.5513732, 0.3659454, -0.3694883, 0.1411765, 0, 1, 1,
0.5525759, -1.770442, 2.402644, 0.145098, 0, 1, 1,
0.5576869, -0.5890936, 2.436952, 0.1529412, 0, 1, 1,
0.5579063, 0.002417207, 1.591301, 0.1568628, 0, 1, 1,
0.5579068, 1.496734, -0.9882294, 0.1647059, 0, 1, 1,
0.5583324, -0.2009313, 3.162042, 0.1686275, 0, 1, 1,
0.5654534, -0.4427909, 3.322231, 0.1764706, 0, 1, 1,
0.5656065, -0.995488, 2.946802, 0.1803922, 0, 1, 1,
0.5673575, 0.0239997, 1.673114, 0.1882353, 0, 1, 1,
0.5673608, -1.735709, 3.565478, 0.1921569, 0, 1, 1,
0.5714268, 0.6237729, 0.6683017, 0.2, 0, 1, 1,
0.5757227, 0.8610458, 1.571624, 0.2078431, 0, 1, 1,
0.5763113, -1.748657, 3.063731, 0.2117647, 0, 1, 1,
0.5767317, 1.081346, 1.770255, 0.2196078, 0, 1, 1,
0.5791615, 2.174659, -1.065045, 0.2235294, 0, 1, 1,
0.5807456, -0.5073004, 2.527133, 0.2313726, 0, 1, 1,
0.5811642, 0.4612818, -0.3366444, 0.2352941, 0, 1, 1,
0.5813535, 0.5018401, 1.307535, 0.2431373, 0, 1, 1,
0.5835467, 0.4033531, 1.53156, 0.2470588, 0, 1, 1,
0.586642, 0.4907826, 1.037986, 0.254902, 0, 1, 1,
0.5902351, -0.1715841, 2.104523, 0.2588235, 0, 1, 1,
0.5990076, 0.8915414, 0.1663789, 0.2666667, 0, 1, 1,
0.6013758, -0.04377528, 2.159188, 0.2705882, 0, 1, 1,
0.6026297, 0.5960457, -0.8017623, 0.2784314, 0, 1, 1,
0.6045498, 1.518242, -0.5382897, 0.282353, 0, 1, 1,
0.6095497, 0.32252, 1.358524, 0.2901961, 0, 1, 1,
0.611253, -1.345972, 3.666454, 0.2941177, 0, 1, 1,
0.6124007, 1.629155, -0.596383, 0.3019608, 0, 1, 1,
0.6131915, -0.06709493, 0.5233182, 0.3098039, 0, 1, 1,
0.6137459, 0.4262282, 0.07554357, 0.3137255, 0, 1, 1,
0.6140355, -0.3327844, 1.10949, 0.3215686, 0, 1, 1,
0.6205418, -0.6333888, 2.705292, 0.3254902, 0, 1, 1,
0.6223226, -1.225622, 2.038187, 0.3333333, 0, 1, 1,
0.6269453, 2.141207, -0.1512945, 0.3372549, 0, 1, 1,
0.6297079, -0.8529766, 3.532013, 0.345098, 0, 1, 1,
0.6310693, -0.4734198, 1.445313, 0.3490196, 0, 1, 1,
0.6388093, 1.010079, 1.726185, 0.3568628, 0, 1, 1,
0.6425723, 0.6526124, 0.8916196, 0.3607843, 0, 1, 1,
0.6427483, -0.7893129, 2.454437, 0.3686275, 0, 1, 1,
0.6495758, 0.1280153, 1.023501, 0.372549, 0, 1, 1,
0.6510442, -1.198185, 4.291473, 0.3803922, 0, 1, 1,
0.6512989, -0.6379991, 1.797895, 0.3843137, 0, 1, 1,
0.6565847, 2.640785, 1.132384, 0.3921569, 0, 1, 1,
0.656739, -0.1365179, 2.468056, 0.3960784, 0, 1, 1,
0.6572205, -0.8132843, 2.983538, 0.4039216, 0, 1, 1,
0.6599745, 0.3464202, 0.5342022, 0.4117647, 0, 1, 1,
0.6619675, 1.45878, -0.7900635, 0.4156863, 0, 1, 1,
0.6619918, -0.7108939, 0.9940823, 0.4235294, 0, 1, 1,
0.6620523, -0.9454567, 3.726486, 0.427451, 0, 1, 1,
0.6629157, -0.3909143, 1.413831, 0.4352941, 0, 1, 1,
0.6631108, -1.363237, 1.863027, 0.4392157, 0, 1, 1,
0.6652987, 1.113458, 0.5227783, 0.4470588, 0, 1, 1,
0.6755822, 1.319506, 1.055488, 0.4509804, 0, 1, 1,
0.6801289, -0.1955723, -0.4027928, 0.4588235, 0, 1, 1,
0.6802461, 1.786939, 1.196365, 0.4627451, 0, 1, 1,
0.6867532, -1.097306, 2.529008, 0.4705882, 0, 1, 1,
0.6908291, -0.6065727, 0.1189651, 0.4745098, 0, 1, 1,
0.692506, 0.9073129, 0.2756155, 0.4823529, 0, 1, 1,
0.6972552, 0.03152568, 1.642669, 0.4862745, 0, 1, 1,
0.6988213, -0.2170677, 0.5451363, 0.4941176, 0, 1, 1,
0.7027406, 0.2799844, 1.674137, 0.5019608, 0, 1, 1,
0.7044669, 0.1903915, 0.6492648, 0.5058824, 0, 1, 1,
0.7050919, -0.6313894, 1.643098, 0.5137255, 0, 1, 1,
0.7072116, 1.021944, 0.4192767, 0.5176471, 0, 1, 1,
0.7089348, 0.1616552, 1.203238, 0.5254902, 0, 1, 1,
0.7100746, -0.1964266, 1.338045, 0.5294118, 0, 1, 1,
0.7114311, -1.045215, 2.512757, 0.5372549, 0, 1, 1,
0.7195282, -0.0108217, 1.920121, 0.5411765, 0, 1, 1,
0.7208382, -1.718409, 3.144588, 0.5490196, 0, 1, 1,
0.7213501, 0.07075242, 1.708242, 0.5529412, 0, 1, 1,
0.7217591, 1.197881, 1.316402, 0.5607843, 0, 1, 1,
0.7232177, 0.4380212, -0.3343359, 0.5647059, 0, 1, 1,
0.7260395, 0.3860104, 2.065467, 0.572549, 0, 1, 1,
0.7308156, 1.156151, 0.8493378, 0.5764706, 0, 1, 1,
0.733644, -0.7499854, 2.511164, 0.5843138, 0, 1, 1,
0.7372456, -0.6104248, 1.506065, 0.5882353, 0, 1, 1,
0.7390165, -0.2512863, 1.274482, 0.5960785, 0, 1, 1,
0.7400508, 1.731815, 1.562324, 0.6039216, 0, 1, 1,
0.7408007, -1.46397, 2.776897, 0.6078432, 0, 1, 1,
0.7410684, 0.3877803, 0.03232813, 0.6156863, 0, 1, 1,
0.7429782, 0.2488434, 2.097368, 0.6196079, 0, 1, 1,
0.7464743, -0.5274084, 2.379422, 0.627451, 0, 1, 1,
0.7468475, -0.5989999, 2.274526, 0.6313726, 0, 1, 1,
0.7496378, -1.263597, 2.941737, 0.6392157, 0, 1, 1,
0.7504617, 0.5835012, 1.061466, 0.6431373, 0, 1, 1,
0.752445, 0.3930422, 2.18112, 0.6509804, 0, 1, 1,
0.7601731, -0.2195654, 2.312693, 0.654902, 0, 1, 1,
0.7656981, -0.2330972, 1.988674, 0.6627451, 0, 1, 1,
0.7668324, 0.6798293, 1.159563, 0.6666667, 0, 1, 1,
0.7687252, -0.3181284, 3.309391, 0.6745098, 0, 1, 1,
0.7740431, -0.3511494, 2.980547, 0.6784314, 0, 1, 1,
0.7760468, 0.8652203, -0.2496748, 0.6862745, 0, 1, 1,
0.776592, -0.6755822, 2.910947, 0.6901961, 0, 1, 1,
0.7775062, -0.5176703, 0.5052788, 0.6980392, 0, 1, 1,
0.7808967, -1.250805, 3.581414, 0.7058824, 0, 1, 1,
0.787921, -1.441055, 1.837551, 0.7098039, 0, 1, 1,
0.7880353, -1.742115, 2.620497, 0.7176471, 0, 1, 1,
0.7913723, -0.1448608, 1.563896, 0.7215686, 0, 1, 1,
0.7937142, -0.3537485, 1.042602, 0.7294118, 0, 1, 1,
0.7941437, 0.6968026, 0.8869918, 0.7333333, 0, 1, 1,
0.7947202, 1.251871, 1.167476, 0.7411765, 0, 1, 1,
0.7996412, 0.6041328, 1.48434, 0.7450981, 0, 1, 1,
0.8039383, 0.1294992, 1.123116, 0.7529412, 0, 1, 1,
0.8128313, 0.647123, 0.6519253, 0.7568628, 0, 1, 1,
0.8130271, -0.09739521, 2.018478, 0.7647059, 0, 1, 1,
0.8192402, 1.410055, 1.175452, 0.7686275, 0, 1, 1,
0.8309797, 1.318126, 0.5720769, 0.7764706, 0, 1, 1,
0.8312544, 1.193782, 2.98262, 0.7803922, 0, 1, 1,
0.8321879, 0.5934812, -0.02471667, 0.7882353, 0, 1, 1,
0.8358824, 1.484571, 2.501698, 0.7921569, 0, 1, 1,
0.8363029, 0.7965983, 0.4213211, 0.8, 0, 1, 1,
0.84087, -0.7624151, 2.127604, 0.8078431, 0, 1, 1,
0.8449656, 1.342039, 1.12235, 0.8117647, 0, 1, 1,
0.8449816, 0.05833904, 2.25282, 0.8196079, 0, 1, 1,
0.8514121, -2.957845, 1.268371, 0.8235294, 0, 1, 1,
0.8670299, 0.8107517, -0.4872391, 0.8313726, 0, 1, 1,
0.8850604, -0.8073737, 2.321233, 0.8352941, 0, 1, 1,
0.8909543, -0.007645282, 0.9446412, 0.8431373, 0, 1, 1,
0.8946708, 0.9680986, -2.21652, 0.8470588, 0, 1, 1,
0.8982, 0.6431942, 0.505566, 0.854902, 0, 1, 1,
0.9076684, -0.9129758, 1.826943, 0.8588235, 0, 1, 1,
0.9079636, -0.3522393, 1.79717, 0.8666667, 0, 1, 1,
0.9090815, 1.173874, -1.0854, 0.8705882, 0, 1, 1,
0.9159279, 1.397795, -0.4375262, 0.8784314, 0, 1, 1,
0.9277268, -0.540522, 1.982701, 0.8823529, 0, 1, 1,
0.9325128, 1.258221, 0.6833597, 0.8901961, 0, 1, 1,
0.9329474, -1.214707, 0.8069293, 0.8941177, 0, 1, 1,
0.9404295, 0.8942615, 1.543051, 0.9019608, 0, 1, 1,
0.949774, 0.8420154, -1.300896, 0.9098039, 0, 1, 1,
0.9507215, 0.8880451, 2.086528, 0.9137255, 0, 1, 1,
0.9542132, 0.2197694, 1.151502, 0.9215686, 0, 1, 1,
0.9554433, 0.6209869, 2.321624, 0.9254902, 0, 1, 1,
0.9582445, -1.484518, 2.230883, 0.9333333, 0, 1, 1,
0.9654442, 1.494894, -0.1310034, 0.9372549, 0, 1, 1,
0.9655049, -1.19512, 3.104747, 0.945098, 0, 1, 1,
0.9730331, -0.9064098, 0.8683211, 0.9490196, 0, 1, 1,
0.9735545, 0.891656, 0.6718, 0.9568627, 0, 1, 1,
0.9795882, 0.01123719, 1.165301, 0.9607843, 0, 1, 1,
0.9827676, 1.324778, 1.458181, 0.9686275, 0, 1, 1,
0.9872659, -0.02845732, 3.125101, 0.972549, 0, 1, 1,
0.9963328, 1.7599, -1.254769, 0.9803922, 0, 1, 1,
0.9992342, -0.002472632, 1.064518, 0.9843137, 0, 1, 1,
1.00216, -0.03124543, 0.5915659, 0.9921569, 0, 1, 1,
1.004721, 0.6006283, 1.159779, 0.9960784, 0, 1, 1,
1.026003, -0.01753285, 3.107448, 1, 0, 0.9960784, 1,
1.027383, -0.3257544, 2.542704, 1, 0, 0.9882353, 1,
1.035215, 0.9752056, 1.075862, 1, 0, 0.9843137, 1,
1.036008, 0.7791878, 1.210781, 1, 0, 0.9764706, 1,
1.037159, -0.2704993, 0.2672221, 1, 0, 0.972549, 1,
1.052928, 0.1847716, 0.858916, 1, 0, 0.9647059, 1,
1.055104, -0.460088, 0.8073021, 1, 0, 0.9607843, 1,
1.056742, 0.2431549, -0.4495492, 1, 0, 0.9529412, 1,
1.057226, 0.05438524, 3.735868, 1, 0, 0.9490196, 1,
1.057905, -0.2299574, 1.979193, 1, 0, 0.9411765, 1,
1.08013, -0.5395206, 1.988157, 1, 0, 0.9372549, 1,
1.083978, 0.8188004, 2.310045, 1, 0, 0.9294118, 1,
1.088323, -1.127654, 2.507532, 1, 0, 0.9254902, 1,
1.090807, -0.5928658, 1.123534, 1, 0, 0.9176471, 1,
1.096132, -0.2139572, 2.645239, 1, 0, 0.9137255, 1,
1.098636, 1.331972, 0.1324743, 1, 0, 0.9058824, 1,
1.100943, -1.287509, 2.19219, 1, 0, 0.9019608, 1,
1.103568, 2.002721, 0.770905, 1, 0, 0.8941177, 1,
1.104969, 1.034814, -0.7571453, 1, 0, 0.8862745, 1,
1.110783, -0.3199327, 2.274682, 1, 0, 0.8823529, 1,
1.112017, -1.567931, 4.805229, 1, 0, 0.8745098, 1,
1.113879, -0.1402978, 1.544182, 1, 0, 0.8705882, 1,
1.115449, -2.084328, 2.555525, 1, 0, 0.8627451, 1,
1.118229, 1.610581, -0.8065183, 1, 0, 0.8588235, 1,
1.121537, 0.8877925, 1.417146, 1, 0, 0.8509804, 1,
1.1252, -0.9126551, 3.867137, 1, 0, 0.8470588, 1,
1.12907, 0.3697096, 0.7841722, 1, 0, 0.8392157, 1,
1.13465, 0.4632175, 2.35984, 1, 0, 0.8352941, 1,
1.138042, -0.2744151, 2.643131, 1, 0, 0.827451, 1,
1.143405, -0.4828315, 0.31801, 1, 0, 0.8235294, 1,
1.164463, -1.001358, 3.060912, 1, 0, 0.8156863, 1,
1.164685, -1.207971, 1.261459, 1, 0, 0.8117647, 1,
1.165189, -0.2090579, 1.884621, 1, 0, 0.8039216, 1,
1.170488, 1.126637, 1.071967, 1, 0, 0.7960784, 1,
1.175501, -0.06050004, 1.151956, 1, 0, 0.7921569, 1,
1.177311, -0.8806493, 1.760556, 1, 0, 0.7843137, 1,
1.179791, -0.02110545, 0.9381003, 1, 0, 0.7803922, 1,
1.187941, 0.5308985, 0.08241137, 1, 0, 0.772549, 1,
1.193103, -0.8733522, 1.160562, 1, 0, 0.7686275, 1,
1.199371, 1.456745, 0.8083865, 1, 0, 0.7607843, 1,
1.20591, 0.56734, 2.018179, 1, 0, 0.7568628, 1,
1.20991, 0.08796559, 0.4396389, 1, 0, 0.7490196, 1,
1.215229, -1.328877, 1.972638, 1, 0, 0.7450981, 1,
1.215397, -0.5299407, 2.737434, 1, 0, 0.7372549, 1,
1.220654, 0.6215411, -0.1363277, 1, 0, 0.7333333, 1,
1.223852, 1.782516, -0.104672, 1, 0, 0.7254902, 1,
1.231938, 0.3072315, 0.318637, 1, 0, 0.7215686, 1,
1.237358, 0.06366954, 1.654872, 1, 0, 0.7137255, 1,
1.23744, -0.5573381, 1.758402, 1, 0, 0.7098039, 1,
1.24243, 0.3063016, 1.790047, 1, 0, 0.7019608, 1,
1.247359, 0.6052935, 1.513084, 1, 0, 0.6941177, 1,
1.252316, -0.3030309, 2.22639, 1, 0, 0.6901961, 1,
1.257236, -0.3984373, 2.496166, 1, 0, 0.682353, 1,
1.258374, -1.009434, 3.492624, 1, 0, 0.6784314, 1,
1.259036, -1.25573, 2.140566, 1, 0, 0.6705883, 1,
1.261667, 0.7681305, 0.9882887, 1, 0, 0.6666667, 1,
1.264322, -0.5724143, 0.4678889, 1, 0, 0.6588235, 1,
1.271087, 0.7800611, 1.060301, 1, 0, 0.654902, 1,
1.27446, -0.6786159, 2.514293, 1, 0, 0.6470588, 1,
1.278085, -1.112002, 2.354555, 1, 0, 0.6431373, 1,
1.287865, -1.16624, 1.556957, 1, 0, 0.6352941, 1,
1.294649, 0.5217244, 0.6227056, 1, 0, 0.6313726, 1,
1.295185, -0.6190804, 3.362514, 1, 0, 0.6235294, 1,
1.305573, -1.384839, 1.536371, 1, 0, 0.6196079, 1,
1.309533, 0.3563809, 1.380173, 1, 0, 0.6117647, 1,
1.31091, -1.223272, 2.111536, 1, 0, 0.6078432, 1,
1.319977, -0.3922167, 3.136656, 1, 0, 0.6, 1,
1.321398, -1.009035, 2.196396, 1, 0, 0.5921569, 1,
1.323521, -0.1550465, 1.67186, 1, 0, 0.5882353, 1,
1.325476, 0.8742973, -0.15138, 1, 0, 0.5803922, 1,
1.330563, 0.5449747, 2.320542, 1, 0, 0.5764706, 1,
1.341867, -2.149333, 2.785628, 1, 0, 0.5686275, 1,
1.34609, 0.15055, 0.8563026, 1, 0, 0.5647059, 1,
1.346677, -1.032151, 1.514916, 1, 0, 0.5568628, 1,
1.355081, 1.702162, -0.4208379, 1, 0, 0.5529412, 1,
1.356629, -0.7238477, 0.9991582, 1, 0, 0.5450981, 1,
1.368422, -1.291829, 2.802346, 1, 0, 0.5411765, 1,
1.369291, -0.5546848, 2.889187, 1, 0, 0.5333334, 1,
1.373168, 0.4049997, 0.5984049, 1, 0, 0.5294118, 1,
1.376887, 1.24452, -0.8061221, 1, 0, 0.5215687, 1,
1.383887, 1.219813, 1.956273, 1, 0, 0.5176471, 1,
1.399713, -0.5057165, 2.099119, 1, 0, 0.509804, 1,
1.42286, 1.194216, 2.203489, 1, 0, 0.5058824, 1,
1.427137, 0.4755759, 1.340359, 1, 0, 0.4980392, 1,
1.430073, -0.7342978, 1.665389, 1, 0, 0.4901961, 1,
1.431295, -1.075448, 0.3446983, 1, 0, 0.4862745, 1,
1.433332, 2.021758, 0.5076175, 1, 0, 0.4784314, 1,
1.437904, -0.8683896, 0.9881775, 1, 0, 0.4745098, 1,
1.440086, 0.2085992, 0.7214815, 1, 0, 0.4666667, 1,
1.441506, -0.6836383, 2.590653, 1, 0, 0.4627451, 1,
1.448502, 0.3370222, 1.84659, 1, 0, 0.454902, 1,
1.449394, -1.430958, 3.123538, 1, 0, 0.4509804, 1,
1.472845, -0.6721655, 1.180678, 1, 0, 0.4431373, 1,
1.472851, 1.413148, 1.917531, 1, 0, 0.4392157, 1,
1.487994, 0.8765889, 0.9422077, 1, 0, 0.4313726, 1,
1.490195, -0.5130014, 2.997125, 1, 0, 0.427451, 1,
1.496985, 0.2844211, 1.117517, 1, 0, 0.4196078, 1,
1.503696, 0.50922, 2.092592, 1, 0, 0.4156863, 1,
1.517493, 0.7503617, 0.1090801, 1, 0, 0.4078431, 1,
1.519011, 0.1123407, 1.455683, 1, 0, 0.4039216, 1,
1.521673, -1.903193, 1.985134, 1, 0, 0.3960784, 1,
1.524284, 0.5460595, 1.506072, 1, 0, 0.3882353, 1,
1.543337, 0.005841692, 3.623451, 1, 0, 0.3843137, 1,
1.545679, 0.1798848, 1.05695, 1, 0, 0.3764706, 1,
1.571618, -0.6876625, -0.07562093, 1, 0, 0.372549, 1,
1.576908, 1.521987, 2.434046, 1, 0, 0.3647059, 1,
1.578646, 0.4198209, 2.012111, 1, 0, 0.3607843, 1,
1.585659, 0.1201898, 2.520982, 1, 0, 0.3529412, 1,
1.600924, -1.1922, 2.510698, 1, 0, 0.3490196, 1,
1.605517, 1.067704, -0.7595815, 1, 0, 0.3411765, 1,
1.610542, -1.800436, 2.091948, 1, 0, 0.3372549, 1,
1.610914, -0.4026081, -0.008051319, 1, 0, 0.3294118, 1,
1.61484, -3.006674, 2.965912, 1, 0, 0.3254902, 1,
1.621089, -1.706531, 2.042878, 1, 0, 0.3176471, 1,
1.623401, 1.72774, 0.5365461, 1, 0, 0.3137255, 1,
1.632126, -1.652561, 0.831259, 1, 0, 0.3058824, 1,
1.645742, 1.550535, 0.5134929, 1, 0, 0.2980392, 1,
1.649811, -0.5935502, 2.698286, 1, 0, 0.2941177, 1,
1.652422, -0.3443745, 1.26377, 1, 0, 0.2862745, 1,
1.653641, -0.4873486, 0.8918114, 1, 0, 0.282353, 1,
1.655926, -0.2903989, 1.435796, 1, 0, 0.2745098, 1,
1.664316, -0.4405863, 1.485667, 1, 0, 0.2705882, 1,
1.673652, -0.9647133, 0.08233863, 1, 0, 0.2627451, 1,
1.713496, 1.868844, 1.56178, 1, 0, 0.2588235, 1,
1.732978, -0.09242976, 1.387354, 1, 0, 0.2509804, 1,
1.759069, -0.3529276, 2.432115, 1, 0, 0.2470588, 1,
1.762361, 0.1363483, 1.046838, 1, 0, 0.2392157, 1,
1.774485, -2.071567, 3.795652, 1, 0, 0.2352941, 1,
1.780356, -0.5467034, 1.612548, 1, 0, 0.227451, 1,
1.785948, 0.01302894, 1.999557, 1, 0, 0.2235294, 1,
1.808906, -0.5435892, 3.237947, 1, 0, 0.2156863, 1,
1.813803, 0.0531697, 2.054315, 1, 0, 0.2117647, 1,
1.854712, 0.4032296, 0.4641671, 1, 0, 0.2039216, 1,
1.888723, -0.45926, 2.279708, 1, 0, 0.1960784, 1,
1.905537, 0.4355317, 1.275573, 1, 0, 0.1921569, 1,
1.945337, -2.026575, 1.734459, 1, 0, 0.1843137, 1,
1.949684, -1.017334, 2.52926, 1, 0, 0.1803922, 1,
1.953243, 1.401996, 0.8783887, 1, 0, 0.172549, 1,
1.961951, -0.2988635, 0.03796981, 1, 0, 0.1686275, 1,
1.974563, -0.2641292, 2.418978, 1, 0, 0.1607843, 1,
1.976643, -0.6815929, 1.70135, 1, 0, 0.1568628, 1,
1.990224, 1.827798, -0.6046662, 1, 0, 0.1490196, 1,
1.994471, 0.7275534, 2.82514, 1, 0, 0.145098, 1,
2.007712, -1.376479, 2.26704, 1, 0, 0.1372549, 1,
2.067417, 0.1248558, 1.075144, 1, 0, 0.1333333, 1,
2.180982, 0.8144862, 2.29231, 1, 0, 0.1254902, 1,
2.265822, -1.972115, 2.34884, 1, 0, 0.1215686, 1,
2.275959, 0.04004703, 1.349196, 1, 0, 0.1137255, 1,
2.276756, -0.3351533, 2.799973, 1, 0, 0.1098039, 1,
2.290779, 0.3096117, 1.512114, 1, 0, 0.1019608, 1,
2.292866, 0.7061354, 0.4537274, 1, 0, 0.09411765, 1,
2.298347, -0.5685115, 2.152502, 1, 0, 0.09019608, 1,
2.309325, -0.1347162, 1.881568, 1, 0, 0.08235294, 1,
2.315691, 2.024457, 0.7266424, 1, 0, 0.07843138, 1,
2.329466, 1.807604, -0.7047324, 1, 0, 0.07058824, 1,
2.353779, -0.3778934, 3.002561, 1, 0, 0.06666667, 1,
2.413408, -1.156988, 1.293437, 1, 0, 0.05882353, 1,
2.493846, -0.347989, 2.347532, 1, 0, 0.05490196, 1,
2.517775, -1.453751, 3.384367, 1, 0, 0.04705882, 1,
2.551956, -0.07925833, 1.098405, 1, 0, 0.04313726, 1,
2.673747, -1.978715, 1.595917, 1, 0, 0.03529412, 1,
2.82711, -2.893603, 3.236086, 1, 0, 0.03137255, 1,
2.890975, -1.680583, 1.201855, 1, 0, 0.02352941, 1,
2.91804, 0.2685255, -0.3205168, 1, 0, 0.01960784, 1,
3.027631, 0.1698331, 2.723493, 1, 0, 0.01176471, 1,
3.15204, -0.4531341, 1.748934, 1, 0, 0.007843138, 1
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
-0.3260418, -4.007549, -6.910049, 0, -0.5, 0.5, 0.5,
-0.3260418, -4.007549, -6.910049, 1, -0.5, 0.5, 0.5,
-0.3260418, -4.007549, -6.910049, 1, 1.5, 0.5, 0.5,
-0.3260418, -4.007549, -6.910049, 0, 1.5, 0.5, 0.5
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
-4.983193, -0.05423772, -6.910049, 0, -0.5, 0.5, 0.5,
-4.983193, -0.05423772, -6.910049, 1, -0.5, 0.5, 0.5,
-4.983193, -0.05423772, -6.910049, 1, 1.5, 0.5, 0.5,
-4.983193, -0.05423772, -6.910049, 0, 1.5, 0.5, 0.5
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
-4.983193, -4.007549, -0.2034404, 0, -0.5, 0.5, 0.5,
-4.983193, -4.007549, -0.2034404, 1, -0.5, 0.5, 0.5,
-4.983193, -4.007549, -0.2034404, 1, 1.5, 0.5, 0.5,
-4.983193, -4.007549, -0.2034404, 0, 1.5, 0.5, 0.5
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
-3, -3.095247, -5.36237,
3, -3.095247, -5.36237,
-3, -3.095247, -5.36237,
-3, -3.247297, -5.620317,
-2, -3.095247, -5.36237,
-2, -3.247297, -5.620317,
-1, -3.095247, -5.36237,
-1, -3.247297, -5.620317,
0, -3.095247, -5.36237,
0, -3.247297, -5.620317,
1, -3.095247, -5.36237,
1, -3.247297, -5.620317,
2, -3.095247, -5.36237,
2, -3.247297, -5.620317,
3, -3.095247, -5.36237,
3, -3.247297, -5.620317
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
-3, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
-3, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
-3, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
-3, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
-2, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
-2, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
-2, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
-2, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
-1, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
-1, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
-1, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
-1, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
0, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
0, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
0, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
0, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
1, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
1, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
1, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
1, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
2, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
2, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
2, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
2, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5,
3, -3.551398, -6.136209, 0, -0.5, 0.5, 0.5,
3, -3.551398, -6.136209, 1, -0.5, 0.5, 0.5,
3, -3.551398, -6.136209, 1, 1.5, 0.5, 0.5,
3, -3.551398, -6.136209, 0, 1.5, 0.5, 0.5
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
-3.908466, -3, -5.36237,
-3.908466, 2, -5.36237,
-3.908466, -3, -5.36237,
-4.087587, -3, -5.620317,
-3.908466, -2, -5.36237,
-4.087587, -2, -5.620317,
-3.908466, -1, -5.36237,
-4.087587, -1, -5.620317,
-3.908466, 0, -5.36237,
-4.087587, 0, -5.620317,
-3.908466, 1, -5.36237,
-4.087587, 1, -5.620317,
-3.908466, 2, -5.36237,
-4.087587, 2, -5.620317
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
-4.44583, -3, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, -3, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, -3, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, -3, -6.136209, 0, 1.5, 0.5, 0.5,
-4.44583, -2, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, -2, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, -2, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, -2, -6.136209, 0, 1.5, 0.5, 0.5,
-4.44583, -1, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, -1, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, -1, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, -1, -6.136209, 0, 1.5, 0.5, 0.5,
-4.44583, 0, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, 0, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, 0, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, 0, -6.136209, 0, 1.5, 0.5, 0.5,
-4.44583, 1, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, 1, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, 1, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, 1, -6.136209, 0, 1.5, 0.5, 0.5,
-4.44583, 2, -6.136209, 0, -0.5, 0.5, 0.5,
-4.44583, 2, -6.136209, 1, -0.5, 0.5, 0.5,
-4.44583, 2, -6.136209, 1, 1.5, 0.5, 0.5,
-4.44583, 2, -6.136209, 0, 1.5, 0.5, 0.5
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
-3.908466, -3.095247, -4,
-3.908466, -3.095247, 4,
-3.908466, -3.095247, -4,
-4.087587, -3.247297, -4,
-3.908466, -3.095247, -2,
-4.087587, -3.247297, -2,
-3.908466, -3.095247, 0,
-4.087587, -3.247297, 0,
-3.908466, -3.095247, 2,
-4.087587, -3.247297, 2,
-3.908466, -3.095247, 4,
-4.087587, -3.247297, 4
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
-4.44583, -3.551398, -4, 0, -0.5, 0.5, 0.5,
-4.44583, -3.551398, -4, 1, -0.5, 0.5, 0.5,
-4.44583, -3.551398, -4, 1, 1.5, 0.5, 0.5,
-4.44583, -3.551398, -4, 0, 1.5, 0.5, 0.5,
-4.44583, -3.551398, -2, 0, -0.5, 0.5, 0.5,
-4.44583, -3.551398, -2, 1, -0.5, 0.5, 0.5,
-4.44583, -3.551398, -2, 1, 1.5, 0.5, 0.5,
-4.44583, -3.551398, -2, 0, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 0, 0, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 0, 1, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 0, 1, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 0, 0, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 2, 0, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 2, 1, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 2, 1, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 2, 0, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 4, 0, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 4, 1, -0.5, 0.5, 0.5,
-4.44583, -3.551398, 4, 1, 1.5, 0.5, 0.5,
-4.44583, -3.551398, 4, 0, 1.5, 0.5, 0.5
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
-3.908466, -3.095247, -5.36237,
-3.908466, 2.986771, -5.36237,
-3.908466, -3.095247, 4.955489,
-3.908466, 2.986771, 4.955489,
-3.908466, -3.095247, -5.36237,
-3.908466, -3.095247, 4.955489,
-3.908466, 2.986771, -5.36237,
-3.908466, 2.986771, 4.955489,
-3.908466, -3.095247, -5.36237,
3.256382, -3.095247, -5.36237,
-3.908466, -3.095247, 4.955489,
3.256382, -3.095247, 4.955489,
-3.908466, 2.986771, -5.36237,
3.256382, 2.986771, -5.36237,
-3.908466, 2.986771, 4.955489,
3.256382, 2.986771, 4.955489,
3.256382, -3.095247, -5.36237,
3.256382, 2.986771, -5.36237,
3.256382, -3.095247, 4.955489,
3.256382, 2.986771, 4.955489,
3.256382, -3.095247, -5.36237,
3.256382, -3.095247, 4.955489,
3.256382, 2.986771, -5.36237,
3.256382, 2.986771, 4.955489
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
var radius = 7.452506;
var distance = 33.15704;
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
mvMatrix.translate( 0.3260418, 0.05423772, 0.2034404 );
mvMatrix.scale( 1.124629, 1.324856, 0.7809561 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15704);
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
5-pentyloxolan-2-one<-read.table("5-pentyloxolan-2-one.xyz", skip=1)
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
-3.804124, -0.6811389, -1.78952, 0, 0, 1, 1, 1,
-3.172802, 1.134445, -1.986521, 1, 0, 0, 1, 1,
-2.96398, 0.01569776, -1.6235, 1, 0, 0, 1, 1,
-2.745689, -0.247332, -3.497861, 1, 0, 0, 1, 1,
-2.533874, 0.2568196, -1.092135, 1, 0, 0, 1, 1,
-2.421621, 0.1181294, -2.485149, 1, 0, 0, 1, 1,
-2.383795, -0.1515176, -1.188882, 0, 0, 0, 1, 1,
-2.378036, 0.5572868, -3.306018, 0, 0, 0, 1, 1,
-2.341002, -0.2300203, -0.04536022, 0, 0, 0, 1, 1,
-2.254915, 0.3339887, -1.467123, 0, 0, 0, 1, 1,
-2.23979, -0.3994496, -3.802428, 0, 0, 0, 1, 1,
-2.231221, -0.3720438, -3.514014, 0, 0, 0, 1, 1,
-2.199693, -1.046094, -2.033305, 0, 0, 0, 1, 1,
-2.194558, -1.361502, -2.798436, 1, 1, 1, 1, 1,
-2.186218, 2.174977, -1.413212, 1, 1, 1, 1, 1,
-2.124466, -1.03395, -4.099171, 1, 1, 1, 1, 1,
-2.098006, -1.071193, -1.652842, 1, 1, 1, 1, 1,
-2.090275, -1.063756, -2.604193, 1, 1, 1, 1, 1,
-2.071693, -2.159931, -3.351864, 1, 1, 1, 1, 1,
-2.055182, 1.964068, 0.06472461, 1, 1, 1, 1, 1,
-2.039838, 0.9918089, -3.148834, 1, 1, 1, 1, 1,
-2.039545, 2.095317, -0.4655872, 1, 1, 1, 1, 1,
-1.952931, -0.7106722, -3.918149, 1, 1, 1, 1, 1,
-1.946852, 0.8087236, -3.023633, 1, 1, 1, 1, 1,
-1.91879, -0.7213314, -1.850882, 1, 1, 1, 1, 1,
-1.913931, 0.9840478, -1.544309, 1, 1, 1, 1, 1,
-1.909217, -1.550255, -1.622147, 1, 1, 1, 1, 1,
-1.852962, -1.226728, -2.234204, 1, 1, 1, 1, 1,
-1.83604, -0.1489436, -1.836792, 0, 0, 1, 1, 1,
-1.834194, -0.3278004, -2.457, 1, 0, 0, 1, 1,
-1.77748, 1.381268, -0.3925956, 1, 0, 0, 1, 1,
-1.756732, 1.12421, -2.033396, 1, 0, 0, 1, 1,
-1.721144, 0.3387707, 0.02132572, 1, 0, 0, 1, 1,
-1.706172, -0.6427459, -2.016479, 1, 0, 0, 1, 1,
-1.703169, 0.6271041, -0.8129049, 0, 0, 0, 1, 1,
-1.699472, 0.4947439, -2.682566, 0, 0, 0, 1, 1,
-1.697241, -0.8361003, -3.453494, 0, 0, 0, 1, 1,
-1.685287, -0.01423471, -1.633958, 0, 0, 0, 1, 1,
-1.665648, 0.9158599, -1.80602, 0, 0, 0, 1, 1,
-1.665368, -1.259641, -3.168792, 0, 0, 0, 1, 1,
-1.659295, -1.165015, -3.848367, 0, 0, 0, 1, 1,
-1.651203, -0.2967581, -1.152101, 1, 1, 1, 1, 1,
-1.639097, -0.009052591, -1.202423, 1, 1, 1, 1, 1,
-1.629593, 0.5428408, -1.327304, 1, 1, 1, 1, 1,
-1.629426, -0.1884729, -1.834426, 1, 1, 1, 1, 1,
-1.621074, 0.4048415, -2.504869, 1, 1, 1, 1, 1,
-1.616228, 1.455733, 0.04957994, 1, 1, 1, 1, 1,
-1.611283, -1.766192, -3.086524, 1, 1, 1, 1, 1,
-1.593649, 0.1306828, -1.977104, 1, 1, 1, 1, 1,
-1.59233, 0.5098544, -3.18331, 1, 1, 1, 1, 1,
-1.585531, -0.1467487, -1.215505, 1, 1, 1, 1, 1,
-1.56853, -1.493785, -1.223319, 1, 1, 1, 1, 1,
-1.567189, -0.8819675, -2.567611, 1, 1, 1, 1, 1,
-1.551342, -2.369797, -2.7747, 1, 1, 1, 1, 1,
-1.545591, -0.1295894, -0.7680337, 1, 1, 1, 1, 1,
-1.538235, -0.03357904, -2.052919, 1, 1, 1, 1, 1,
-1.517846, -1.165508, -2.67549, 0, 0, 1, 1, 1,
-1.50891, 1.660297, -0.4945511, 1, 0, 0, 1, 1,
-1.507555, -1.313461, -1.518487, 1, 0, 0, 1, 1,
-1.501402, -0.1694644, -1.288084, 1, 0, 0, 1, 1,
-1.478525, 1.308998, -1.371137, 1, 0, 0, 1, 1,
-1.476394, 0.4917205, -2.340545, 1, 0, 0, 1, 1,
-1.475784, -0.2935564, -2.230102, 0, 0, 0, 1, 1,
-1.471221, -0.5543132, -3.599136, 0, 0, 0, 1, 1,
-1.457579, 0.1394253, -0.5156846, 0, 0, 0, 1, 1,
-1.446177, -1.009127, -1.539822, 0, 0, 0, 1, 1,
-1.441991, 1.222769, 0.1484573, 0, 0, 0, 1, 1,
-1.441852, 0.3694352, -0.9570273, 0, 0, 0, 1, 1,
-1.439787, 1.104529, -1.774075, 0, 0, 0, 1, 1,
-1.417617, -1.273323, -2.696176, 1, 1, 1, 1, 1,
-1.395934, 0.9987056, 0.3907308, 1, 1, 1, 1, 1,
-1.383242, -0.5644967, -1.539231, 1, 1, 1, 1, 1,
-1.381812, 0.3963275, -0.7200443, 1, 1, 1, 1, 1,
-1.374361, 0.0116938, -2.397265, 1, 1, 1, 1, 1,
-1.373803, -0.9670478, -3.869336, 1, 1, 1, 1, 1,
-1.372883, -0.4021322, -1.650772, 1, 1, 1, 1, 1,
-1.36942, 1.311263, 0.0488025, 1, 1, 1, 1, 1,
-1.359888, -1.504505, -4.031212, 1, 1, 1, 1, 1,
-1.354683, 1.199275, 0.1141589, 1, 1, 1, 1, 1,
-1.349597, 0.96893, -0.3270861, 1, 1, 1, 1, 1,
-1.347757, 1.491068, 0.09804098, 1, 1, 1, 1, 1,
-1.342903, -0.6165622, -3.192614, 1, 1, 1, 1, 1,
-1.338136, 1.555193, 0.1159422, 1, 1, 1, 1, 1,
-1.336019, -0.03552519, -2.754055, 1, 1, 1, 1, 1,
-1.323521, -0.8475572, -2.512386, 0, 0, 1, 1, 1,
-1.319357, -0.03668598, -2.358405, 1, 0, 0, 1, 1,
-1.306377, 0.2690875, -1.637501, 1, 0, 0, 1, 1,
-1.297042, 1.625065, -0.6255821, 1, 0, 0, 1, 1,
-1.29259, -0.1928757, -1.630645, 1, 0, 0, 1, 1,
-1.291868, -0.9817623, -3.23812, 1, 0, 0, 1, 1,
-1.288429, -0.3128171, -2.594779, 0, 0, 0, 1, 1,
-1.287939, -1.704348, -0.8663498, 0, 0, 0, 1, 1,
-1.282903, 0.3467523, -2.069121, 0, 0, 0, 1, 1,
-1.280952, -1.468353, -1.864887, 0, 0, 0, 1, 1,
-1.265487, -0.3755513, -1.769226, 0, 0, 0, 1, 1,
-1.264697, 0.8208144, -3.202607, 0, 0, 0, 1, 1,
-1.26128, -0.1938838, 0.2282936, 0, 0, 0, 1, 1,
-1.260375, 1.284291, -1.032246, 1, 1, 1, 1, 1,
-1.255699, -0.5403766, 0.1645435, 1, 1, 1, 1, 1,
-1.255479, 0.6583118, -1.07336, 1, 1, 1, 1, 1,
-1.238011, -0.2969109, -1.96309, 1, 1, 1, 1, 1,
-1.23551, 0.4550853, -3.4513, 1, 1, 1, 1, 1,
-1.219883, 1.431005, -0.3435692, 1, 1, 1, 1, 1,
-1.218438, 1.508077, -0.9554245, 1, 1, 1, 1, 1,
-1.207914, -1.05911, -2.002358, 1, 1, 1, 1, 1,
-1.189942, 1.293789, -0.5598497, 1, 1, 1, 1, 1,
-1.182024, 0.1050542, -1.89822, 1, 1, 1, 1, 1,
-1.180636, -0.6806501, -3.615792, 1, 1, 1, 1, 1,
-1.17957, -0.1345873, -1.23943, 1, 1, 1, 1, 1,
-1.168609, -1.815883, -3.435459, 1, 1, 1, 1, 1,
-1.164692, -0.3885476, -1.619523, 1, 1, 1, 1, 1,
-1.161056, 0.3344638, -1.609361, 1, 1, 1, 1, 1,
-1.156219, 0.2651932, -0.9917443, 0, 0, 1, 1, 1,
-1.155449, -0.9181965, -3.790769, 1, 0, 0, 1, 1,
-1.152328, -0.5494495, -2.746772, 1, 0, 0, 1, 1,
-1.152007, 0.4108071, -1.210244, 1, 0, 0, 1, 1,
-1.149479, -1.294494, -1.222347, 1, 0, 0, 1, 1,
-1.149232, 0.1091485, -2.619813, 1, 0, 0, 1, 1,
-1.147099, -0.3330281, -1.650969, 0, 0, 0, 1, 1,
-1.144072, -0.6626863, -2.382182, 0, 0, 0, 1, 1,
-1.137587, 1.23788, 0.7505608, 0, 0, 0, 1, 1,
-1.135728, 1.080184, -1.53405, 0, 0, 0, 1, 1,
-1.131114, 1.606452, 0.9424892, 0, 0, 0, 1, 1,
-1.12679, 0.5985, 0.443955, 0, 0, 0, 1, 1,
-1.120487, 0.6237919, 0.406927, 0, 0, 0, 1, 1,
-1.118519, 0.4969917, -1.762689, 1, 1, 1, 1, 1,
-1.11745, -0.355736, -1.052277, 1, 1, 1, 1, 1,
-1.115791, 1.389689, -0.07892492, 1, 1, 1, 1, 1,
-1.110209, -2.352472, -4.967093, 1, 1, 1, 1, 1,
-1.108513, -1.318427, -0.4659271, 1, 1, 1, 1, 1,
-1.102321, -1.575257, -2.786211, 1, 1, 1, 1, 1,
-1.10118, 0.7988549, -1.42093, 1, 1, 1, 1, 1,
-1.100961, 1.167299, 1.024005, 1, 1, 1, 1, 1,
-1.093443, 0.9610313, -0.7397303, 1, 1, 1, 1, 1,
-1.092866, 0.8125831, -1.828789, 1, 1, 1, 1, 1,
-1.087797, -0.5293788, -0.3124571, 1, 1, 1, 1, 1,
-1.082299, 0.4044523, -1.470484, 1, 1, 1, 1, 1,
-1.077008, 1.23828, -0.9786642, 1, 1, 1, 1, 1,
-1.074923, 1.37762, -0.5322318, 1, 1, 1, 1, 1,
-1.066147, 0.5502622, -1.395969, 1, 1, 1, 1, 1,
-1.065583, 0.1141819, -1.097417, 0, 0, 1, 1, 1,
-1.062477, 0.2652441, -0.7330733, 1, 0, 0, 1, 1,
-1.061661, 1.894459, -1.258752, 1, 0, 0, 1, 1,
-1.060223, 0.1311129, -2.198407, 1, 0, 0, 1, 1,
-1.056978, -1.164144, -3.682058, 1, 0, 0, 1, 1,
-1.0536, -1.400416, -3.255955, 1, 0, 0, 1, 1,
-1.049748, -0.8699796, -1.101878, 0, 0, 0, 1, 1,
-1.042989, 0.1402111, -0.290182, 0, 0, 0, 1, 1,
-1.042677, -0.3507272, -1.663828, 0, 0, 0, 1, 1,
-1.035121, 0.9431549, -0.1294639, 0, 0, 0, 1, 1,
-1.023269, -2.280212, -2.921703, 0, 0, 0, 1, 1,
-1.002518, 0.4247991, -2.29278, 0, 0, 0, 1, 1,
-0.9978043, -0.1559387, -2.371193, 0, 0, 0, 1, 1,
-0.9933904, -1.267635, -1.223, 1, 1, 1, 1, 1,
-0.9875653, 0.2962506, -1.935486, 1, 1, 1, 1, 1,
-0.9874336, -0.4468791, -1.204728, 1, 1, 1, 1, 1,
-0.9873681, -0.9764695, -1.567106, 1, 1, 1, 1, 1,
-0.9753374, 0.006381753, -0.06021762, 1, 1, 1, 1, 1,
-0.9724391, -0.393764, -3.79499, 1, 1, 1, 1, 1,
-0.9711547, 1.084272, -0.4720988, 1, 1, 1, 1, 1,
-0.9587759, 0.0338404, -1.951724, 1, 1, 1, 1, 1,
-0.9454184, -0.9684998, -1.744884, 1, 1, 1, 1, 1,
-0.9404063, -1.350073, -3.95965, 1, 1, 1, 1, 1,
-0.9385279, 0.5918063, -2.130906, 1, 1, 1, 1, 1,
-0.9361369, -1.226139, -0.07635686, 1, 1, 1, 1, 1,
-0.933606, -0.2321519, 0.3985437, 1, 1, 1, 1, 1,
-0.9328133, -1.120245, -0.4844641, 1, 1, 1, 1, 1,
-0.92707, -0.3074719, -1.988701, 1, 1, 1, 1, 1,
-0.9264885, -0.8086075, -0.7888108, 0, 0, 1, 1, 1,
-0.9260502, 0.4952396, -1.614443, 1, 0, 0, 1, 1,
-0.9260216, 1.823553, -0.9878696, 1, 0, 0, 1, 1,
-0.9249391, -0.5546562, -0.4662204, 1, 0, 0, 1, 1,
-0.9240019, -0.9293793, -1.345549, 1, 0, 0, 1, 1,
-0.9221346, 0.330209, -1.976444, 1, 0, 0, 1, 1,
-0.9220108, -2.226338, -2.948276, 0, 0, 0, 1, 1,
-0.9212455, -0.2316426, -3.254963, 0, 0, 0, 1, 1,
-0.9185532, -0.5164334, -2.955209, 0, 0, 0, 1, 1,
-0.9053738, -1.572363, -3.580831, 0, 0, 0, 1, 1,
-0.902597, -1.310784, -0.3936242, 0, 0, 0, 1, 1,
-0.9017413, 1.62271, -0.2527306, 0, 0, 0, 1, 1,
-0.9004262, -1.228214, -2.430274, 0, 0, 0, 1, 1,
-0.8943077, -0.4420085, -1.512581, 1, 1, 1, 1, 1,
-0.894199, -1.817243, -3.904402, 1, 1, 1, 1, 1,
-0.8924062, 0.09004354, -1.585826, 1, 1, 1, 1, 1,
-0.8872869, 1.374747, -0.5928866, 1, 1, 1, 1, 1,
-0.8848594, -0.5749714, -2.350964, 1, 1, 1, 1, 1,
-0.8847386, 0.4752961, 0.7871002, 1, 1, 1, 1, 1,
-0.8830091, 0.9875044, 0.7148612, 1, 1, 1, 1, 1,
-0.8792201, -1.149274, -2.682792, 1, 1, 1, 1, 1,
-0.8747297, 1.205305, -1.159697, 1, 1, 1, 1, 1,
-0.8731866, -0.0270109, -1.746583, 1, 1, 1, 1, 1,
-0.870428, 0.2524297, -0.5007317, 1, 1, 1, 1, 1,
-0.863889, -0.4703815, -1.772598, 1, 1, 1, 1, 1,
-0.8624665, 0.5754715, -1.837405, 1, 1, 1, 1, 1,
-0.8609357, -1.487293, -2.478496, 1, 1, 1, 1, 1,
-0.853744, 0.7701198, 0.4516822, 1, 1, 1, 1, 1,
-0.8530273, 0.2493537, 0.9586912, 0, 0, 1, 1, 1,
-0.8520381, 0.5516961, -0.6052848, 1, 0, 0, 1, 1,
-0.8452143, 0.03359134, -0.6326967, 1, 0, 0, 1, 1,
-0.8423038, -0.09302276, -2.43678, 1, 0, 0, 1, 1,
-0.8422041, -0.6954542, -4.763865, 1, 0, 0, 1, 1,
-0.8396913, -1.749244, -4.000293, 1, 0, 0, 1, 1,
-0.8264176, 0.6906679, -0.380012, 0, 0, 0, 1, 1,
-0.8252951, 0.1921737, -1.13302, 0, 0, 0, 1, 1,
-0.8252366, -0.2951472, -1.295235, 0, 0, 0, 1, 1,
-0.8223271, 0.3755211, -2.455783, 0, 0, 0, 1, 1,
-0.8222629, 1.362286, -2.209654, 0, 0, 0, 1, 1,
-0.8217333, 0.9344498, -0.7839307, 0, 0, 0, 1, 1,
-0.8137829, -1.316041, -3.480523, 0, 0, 0, 1, 1,
-0.8075137, 1.45033, -0.7842215, 1, 1, 1, 1, 1,
-0.8053889, 0.01833883, -2.935355, 1, 1, 1, 1, 1,
-0.8049277, 1.217678, -0.935086, 1, 1, 1, 1, 1,
-0.8045361, -0.5966589, -4.21677, 1, 1, 1, 1, 1,
-0.7998158, -0.3154175, -1.398664, 1, 1, 1, 1, 1,
-0.7975595, -0.299184, -2.117734, 1, 1, 1, 1, 1,
-0.7932432, -2.105784, -2.384604, 1, 1, 1, 1, 1,
-0.7880412, 0.3454039, -0.9852503, 1, 1, 1, 1, 1,
-0.7864289, 1.208123, -1.716853, 1, 1, 1, 1, 1,
-0.7827444, -0.7700979, -4.19938, 1, 1, 1, 1, 1,
-0.7780365, 0.328532, -2.242934, 1, 1, 1, 1, 1,
-0.7755979, 0.2153444, -1.327953, 1, 1, 1, 1, 1,
-0.7720799, 0.8704925, -0.532338, 1, 1, 1, 1, 1,
-0.7714675, -0.2616, -2.742983, 1, 1, 1, 1, 1,
-0.7708734, 0.4748484, -0.94952, 1, 1, 1, 1, 1,
-0.761447, -0.8709128, 0.06392244, 0, 0, 1, 1, 1,
-0.7539448, 0.6075485, 0.008588876, 1, 0, 0, 1, 1,
-0.7539181, 0.6675826, 0.132778, 1, 0, 0, 1, 1,
-0.7533023, 0.8689269, 0.04029655, 1, 0, 0, 1, 1,
-0.7532022, -0.8258798, -2.929428, 1, 0, 0, 1, 1,
-0.7465378, 0.653835, -1.131014, 1, 0, 0, 1, 1,
-0.7425885, 1.007189, -0.05818978, 0, 0, 0, 1, 1,
-0.7423924, 0.6342685, -0.3320552, 0, 0, 0, 1, 1,
-0.7422016, 1.562266, -0.9816733, 0, 0, 0, 1, 1,
-0.7412304, 0.1933713, -1.499146, 0, 0, 0, 1, 1,
-0.7408561, 0.2796853, -3.389848, 0, 0, 0, 1, 1,
-0.7345789, -0.01186935, -2.481169, 0, 0, 0, 1, 1,
-0.7322873, 1.885522, -0.6851916, 0, 0, 0, 1, 1,
-0.7282922, -0.02157433, 1.518333, 1, 1, 1, 1, 1,
-0.7233806, 0.158111, -2.595054, 1, 1, 1, 1, 1,
-0.7233305, -0.1853475, -2.331717, 1, 1, 1, 1, 1,
-0.7232685, -1.283883, -3.126094, 1, 1, 1, 1, 1,
-0.718374, 1.427657, 0.6973196, 1, 1, 1, 1, 1,
-0.7179522, -0.8643445, -2.856411, 1, 1, 1, 1, 1,
-0.7145187, -1.237064, -3.091896, 1, 1, 1, 1, 1,
-0.7137722, 2.898198, -1.402972, 1, 1, 1, 1, 1,
-0.7113534, -0.1149249, -2.108245, 1, 1, 1, 1, 1,
-0.7083026, 0.4605738, -0.8323184, 1, 1, 1, 1, 1,
-0.698191, -0.007535131, -1.133618, 1, 1, 1, 1, 1,
-0.6976493, 1.213172, -0.63986, 1, 1, 1, 1, 1,
-0.6940024, -0.4062508, -3.19154, 1, 1, 1, 1, 1,
-0.6900008, -1.559126, -2.010228, 1, 1, 1, 1, 1,
-0.687162, 0.8637357, -0.5975096, 1, 1, 1, 1, 1,
-0.6858837, -1.373626, -2.396893, 0, 0, 1, 1, 1,
-0.6845249, 1.779472, -2.145958, 1, 0, 0, 1, 1,
-0.674422, 0.727797, 0.4878383, 1, 0, 0, 1, 1,
-0.6712775, 1.052116, -2.509111, 1, 0, 0, 1, 1,
-0.6586224, -0.4577081, -0.337583, 1, 0, 0, 1, 1,
-0.6549194, -0.9317393, -1.222428, 1, 0, 0, 1, 1,
-0.6542751, 0.2464936, -0.8628283, 0, 0, 0, 1, 1,
-0.6494106, 0.01281259, -2.64258, 0, 0, 0, 1, 1,
-0.6487265, 0.4493629, -2.677288, 0, 0, 0, 1, 1,
-0.6474066, -1.16944, -2.959016, 0, 0, 0, 1, 1,
-0.6467382, 0.008221304, -2.34072, 0, 0, 0, 1, 1,
-0.6420064, 0.6235706, 0.4425395, 0, 0, 0, 1, 1,
-0.6334905, 0.4854321, -1.380415, 0, 0, 0, 1, 1,
-0.6267096, -0.2776837, -1.052638, 1, 1, 1, 1, 1,
-0.6249349, 0.2349935, -2.593075, 1, 1, 1, 1, 1,
-0.6159568, -0.2949221, -3.83271, 1, 1, 1, 1, 1,
-0.6064537, -0.6535354, -1.712846, 1, 1, 1, 1, 1,
-0.604276, 0.8331169, -0.6306309, 1, 1, 1, 1, 1,
-0.6036789, -1.189396, -3.872907, 1, 1, 1, 1, 1,
-0.6035372, -0.07904232, -1.399421, 1, 1, 1, 1, 1,
-0.6028199, 0.4940228, -0.2539879, 1, 1, 1, 1, 1,
-0.6007085, -1.887466, -1.97146, 1, 1, 1, 1, 1,
-0.5981228, -0.2454676, -2.016358, 1, 1, 1, 1, 1,
-0.5966463, 0.6320744, -0.7830311, 1, 1, 1, 1, 1,
-0.5938202, 0.1929828, -1.739327, 1, 1, 1, 1, 1,
-0.5930218, -1.5457, -1.995167, 1, 1, 1, 1, 1,
-0.5913733, 0.5457446, 0.04117267, 1, 1, 1, 1, 1,
-0.58939, -0.7885654, -2.764798, 1, 1, 1, 1, 1,
-0.5842968, 0.3738899, -1.968559, 0, 0, 1, 1, 1,
-0.5828748, 0.2275937, -0.2582939, 1, 0, 0, 1, 1,
-0.5822544, 1.211384, -1.167747, 1, 0, 0, 1, 1,
-0.5806301, -0.7687108, -3.270157, 1, 0, 0, 1, 1,
-0.5803581, 0.3687068, 0.03880783, 1, 0, 0, 1, 1,
-0.579677, 0.8567713, -0.1143989, 1, 0, 0, 1, 1,
-0.5792702, 0.6719263, -1.481535, 0, 0, 0, 1, 1,
-0.5766497, 0.3998503, -0.7792393, 0, 0, 0, 1, 1,
-0.5741206, 0.3776906, -1.156969, 0, 0, 0, 1, 1,
-0.5727181, -0.6365579, 0.7658125, 0, 0, 0, 1, 1,
-0.5693873, 1.630245, 0.252986, 0, 0, 0, 1, 1,
-0.5687174, -0.3471436, -2.619489, 0, 0, 0, 1, 1,
-0.5682055, 2.003413, 0.4169537, 0, 0, 0, 1, 1,
-0.5655977, 0.1335172, -1.719622, 1, 1, 1, 1, 1,
-0.5565162, 1.770886, -0.802982, 1, 1, 1, 1, 1,
-0.5474162, -0.1961283, -2.068793, 1, 1, 1, 1, 1,
-0.5466709, 1.667664, -0.2831402, 1, 1, 1, 1, 1,
-0.5458793, 0.5953329, -1.260869, 1, 1, 1, 1, 1,
-0.5438293, -0.9140498, -3.289769, 1, 1, 1, 1, 1,
-0.5364615, -0.3199443, -3.072076, 1, 1, 1, 1, 1,
-0.5341687, 1.122345, -0.4371143, 1, 1, 1, 1, 1,
-0.5305601, -0.1019887, -1.366509, 1, 1, 1, 1, 1,
-0.5268164, -1.06274, -4.23595, 1, 1, 1, 1, 1,
-0.5267848, -0.7479346, -3.411077, 1, 1, 1, 1, 1,
-0.5253954, -0.1772543, -3.473349, 1, 1, 1, 1, 1,
-0.5252684, 0.2403753, 0.8986537, 1, 1, 1, 1, 1,
-0.5246037, 0.5244763, 0.0412228, 1, 1, 1, 1, 1,
-0.5221378, 1.358796, -0.9474916, 1, 1, 1, 1, 1,
-0.521832, -0.7050959, -2.977256, 0, 0, 1, 1, 1,
-0.5205923, 0.9127126, -0.9221326, 1, 0, 0, 1, 1,
-0.5188258, 0.7458975, 0.500955, 1, 0, 0, 1, 1,
-0.5186563, -0.436457, -0.5366641, 1, 0, 0, 1, 1,
-0.5164584, 0.434802, 0.1117485, 1, 0, 0, 1, 1,
-0.5161521, 0.4401966, -0.9654929, 1, 0, 0, 1, 1,
-0.514393, -0.05339713, -2.782254, 0, 0, 0, 1, 1,
-0.513378, 0.3582665, 0.5307928, 0, 0, 0, 1, 1,
-0.5093617, 0.5283729, -0.9448228, 0, 0, 0, 1, 1,
-0.5044261, 0.6181539, -0.5624943, 0, 0, 0, 1, 1,
-0.5041628, -0.4796171, -2.25004, 0, 0, 0, 1, 1,
-0.5041401, 0.8135959, 0.2873569, 0, 0, 0, 1, 1,
-0.4993182, -1.234551, -2.816913, 0, 0, 0, 1, 1,
-0.4985642, 0.9216669, -0.3642384, 1, 1, 1, 1, 1,
-0.4965535, -0.3590513, -2.97338, 1, 1, 1, 1, 1,
-0.4952207, -0.1562056, -0.4550141, 1, 1, 1, 1, 1,
-0.4948993, -0.4450511, -3.766446, 1, 1, 1, 1, 1,
-0.488257, -0.9733964, -3.423243, 1, 1, 1, 1, 1,
-0.4807035, -0.6005337, -3.78798, 1, 1, 1, 1, 1,
-0.4795856, -1.647474, -3.612783, 1, 1, 1, 1, 1,
-0.4741229, -0.6005571, -0.8010629, 1, 1, 1, 1, 1,
-0.4710444, 1.408716, 0.1096285, 1, 1, 1, 1, 1,
-0.4708806, -0.8026465, -1.4621, 1, 1, 1, 1, 1,
-0.4665271, 0.9674686, -0.5520694, 1, 1, 1, 1, 1,
-0.4662972, -1.518015, -2.419783, 1, 1, 1, 1, 1,
-0.464201, -0.1541385, -1.702736, 1, 1, 1, 1, 1,
-0.4543904, 0.58482, -0.5955024, 1, 1, 1, 1, 1,
-0.4515898, -0.1064944, 0.05156233, 1, 1, 1, 1, 1,
-0.4461079, -0.5446499, -1.833694, 0, 0, 1, 1, 1,
-0.4408966, -2.014738, -2.865359, 1, 0, 0, 1, 1,
-0.43727, -0.463684, -2.568787, 1, 0, 0, 1, 1,
-0.4310267, 0.946689, -1.636266, 1, 0, 0, 1, 1,
-0.4297531, 0.5366477, 0.2176763, 1, 0, 0, 1, 1,
-0.4295824, -0.4999152, -1.632825, 1, 0, 0, 1, 1,
-0.428259, 0.0487783, -0.8911405, 0, 0, 0, 1, 1,
-0.4218009, 0.08325192, -1.821283, 0, 0, 0, 1, 1,
-0.4188762, -1.965889, -2.261238, 0, 0, 0, 1, 1,
-0.4178702, -0.7090582, -3.125613, 0, 0, 0, 1, 1,
-0.4132233, 1.22294, -1.048277, 0, 0, 0, 1, 1,
-0.4119795, -0.7728014, -1.005863, 0, 0, 0, 1, 1,
-0.4100815, 1.303283, -1.362734, 0, 0, 0, 1, 1,
-0.4099555, 0.07617462, -3.216699, 1, 1, 1, 1, 1,
-0.4053992, -0.174811, -2.012663, 1, 1, 1, 1, 1,
-0.4045934, 0.4437593, -1.441277, 1, 1, 1, 1, 1,
-0.3976447, -0.35384, -4.721622, 1, 1, 1, 1, 1,
-0.3951603, 0.9074847, -3.483268, 1, 1, 1, 1, 1,
-0.3934277, -1.033044, -2.16705, 1, 1, 1, 1, 1,
-0.392832, -0.09034138, -3.29585, 1, 1, 1, 1, 1,
-0.3843009, 0.1909512, -0.4863772, 1, 1, 1, 1, 1,
-0.384235, -0.1462794, -2.271464, 1, 1, 1, 1, 1,
-0.3841418, 0.1541974, 0.142147, 1, 1, 1, 1, 1,
-0.3813478, -0.0303336, -2.113575, 1, 1, 1, 1, 1,
-0.3812158, -0.383002, -0.5186724, 1, 1, 1, 1, 1,
-0.3804072, 1.159926, 0.4241328, 1, 1, 1, 1, 1,
-0.3766952, 0.388802, -0.3089887, 1, 1, 1, 1, 1,
-0.376652, 1.310502, 0.2712055, 1, 1, 1, 1, 1,
-0.3762298, 1.269924, -1.605264, 0, 0, 1, 1, 1,
-0.3713732, -0.9017155, -3.049697, 1, 0, 0, 1, 1,
-0.3686934, 0.03751232, -0.5119066, 1, 0, 0, 1, 1,
-0.3617482, -0.09926508, -2.364121, 1, 0, 0, 1, 1,
-0.3612189, -2.090775, -3.595666, 1, 0, 0, 1, 1,
-0.354168, -2.046521, -1.794194, 1, 0, 0, 1, 1,
-0.3534633, -0.09700397, -1.926435, 0, 0, 0, 1, 1,
-0.3520686, -0.4838803, -2.561416, 0, 0, 0, 1, 1,
-0.3511132, 0.2930929, -1.347201, 0, 0, 0, 1, 1,
-0.3509681, 1.313611, -0.002896636, 0, 0, 0, 1, 1,
-0.3486961, 0.4544029, -1.508995, 0, 0, 0, 1, 1,
-0.3438785, 0.3555593, -1.581385, 0, 0, 0, 1, 1,
-0.3397079, 1.032889, 0.5800068, 0, 0, 0, 1, 1,
-0.3390475, -0.5867133, -0.961398, 1, 1, 1, 1, 1,
-0.3378659, -0.09972354, -2.100022, 1, 1, 1, 1, 1,
-0.3352153, 0.05644998, -0.8875923, 1, 1, 1, 1, 1,
-0.3347445, 0.3237965, -1.467974, 1, 1, 1, 1, 1,
-0.3341007, -0.03854075, -2.305169, 1, 1, 1, 1, 1,
-0.334085, 0.2712865, -0.8249753, 1, 1, 1, 1, 1,
-0.3339289, -0.7204069, -1.130734, 1, 1, 1, 1, 1,
-0.3267225, 1.805027, -0.8164111, 1, 1, 1, 1, 1,
-0.32569, 1.546021, -0.8500397, 1, 1, 1, 1, 1,
-0.3194293, 1.57564, -1.239539, 1, 1, 1, 1, 1,
-0.3189872, 0.1803121, -1.354016, 1, 1, 1, 1, 1,
-0.3186918, -2.091713, -3.046418, 1, 1, 1, 1, 1,
-0.3162553, 1.049892, -0.5682495, 1, 1, 1, 1, 1,
-0.3155354, -0.8888224, -1.687871, 1, 1, 1, 1, 1,
-0.3123624, 0.6002673, -0.2609716, 1, 1, 1, 1, 1,
-0.3121691, 0.4327528, -0.4949057, 0, 0, 1, 1, 1,
-0.3103492, 0.6654287, 0.1799075, 1, 0, 0, 1, 1,
-0.3100576, -1.082696, -1.916886, 1, 0, 0, 1, 1,
-0.3081871, 0.5565664, -0.4777121, 1, 0, 0, 1, 1,
-0.3043748, 1.199017, -0.8437306, 1, 0, 0, 1, 1,
-0.2978842, 1.223452, -1.432778, 1, 0, 0, 1, 1,
-0.2971785, 0.1053278, 0.2682816, 0, 0, 0, 1, 1,
-0.292283, -0.7226118, -1.822033, 0, 0, 0, 1, 1,
-0.2917795, 0.7657939, -1.463279, 0, 0, 0, 1, 1,
-0.2736652, 0.3328927, -0.3532307, 0, 0, 0, 1, 1,
-0.2731217, -0.1609308, -1.20216, 0, 0, 0, 1, 1,
-0.2724828, 0.06951265, -0.429585, 0, 0, 0, 1, 1,
-0.2680104, 0.3117621, -1.628267, 0, 0, 0, 1, 1,
-0.2642715, 0.2541876, -0.6408371, 1, 1, 1, 1, 1,
-0.2425958, -0.7914845, -3.128189, 1, 1, 1, 1, 1,
-0.2401341, -0.461418, -2.792302, 1, 1, 1, 1, 1,
-0.2400233, -1.31685, -2.078613, 1, 1, 1, 1, 1,
-0.239358, 0.602357, 0.5114552, 1, 1, 1, 1, 1,
-0.2356508, 0.4003539, -0.6852475, 1, 1, 1, 1, 1,
-0.2310901, 0.4421698, -1.937002, 1, 1, 1, 1, 1,
-0.2305528, 1.440714, -0.08473422, 1, 1, 1, 1, 1,
-0.23035, 0.1494882, -3.043638, 1, 1, 1, 1, 1,
-0.2295483, 1.826992, -0.4927863, 1, 1, 1, 1, 1,
-0.225607, -0.2268622, -1.086736, 1, 1, 1, 1, 1,
-0.2252875, 0.01331164, -0.9483355, 1, 1, 1, 1, 1,
-0.2252691, 1.53346, 0.8450668, 1, 1, 1, 1, 1,
-0.2195546, -1.910311, -2.533357, 1, 1, 1, 1, 1,
-0.2159978, -0.6563641, -3.99053, 1, 1, 1, 1, 1,
-0.2132882, 1.349499, 1.342409, 0, 0, 1, 1, 1,
-0.2126056, 0.3463284, 0.6711637, 1, 0, 0, 1, 1,
-0.2070254, 0.5497743, 1.590304, 1, 0, 0, 1, 1,
-0.2008597, -0.4532501, -2.812416, 1, 0, 0, 1, 1,
-0.196481, 0.8466151, -0.8144526, 1, 0, 0, 1, 1,
-0.1960957, 0.7240779, -0.6661096, 1, 0, 0, 1, 1,
-0.1922441, 0.08238085, -1.043161, 0, 0, 0, 1, 1,
-0.1877874, -0.6308744, -2.551073, 0, 0, 0, 1, 1,
-0.1867349, 0.9550709, -0.1529139, 0, 0, 0, 1, 1,
-0.1865487, 1.295307, -1.085673, 0, 0, 0, 1, 1,
-0.1836495, 0.3963374, -2.064066, 0, 0, 0, 1, 1,
-0.1822216, -1.727259, -0.1919773, 0, 0, 0, 1, 1,
-0.1803048, -0.5829663, -1.5528, 0, 0, 0, 1, 1,
-0.1784627, -1.402745, -2.286406, 1, 1, 1, 1, 1,
-0.1781553, -0.8988271, -1.683946, 1, 1, 1, 1, 1,
-0.1755649, -0.05488033, -0.8449215, 1, 1, 1, 1, 1,
-0.1664201, 0.03891303, -2.158351, 1, 1, 1, 1, 1,
-0.1613418, 0.01405216, -2.458251, 1, 1, 1, 1, 1,
-0.1598801, 0.4977098, -1.73181, 1, 1, 1, 1, 1,
-0.1535052, 0.739575, 1.441744, 1, 1, 1, 1, 1,
-0.1464698, -0.07456185, -2.563019, 1, 1, 1, 1, 1,
-0.1460198, -0.03124432, -0.3329561, 1, 1, 1, 1, 1,
-0.1453055, -1.524786, -2.968184, 1, 1, 1, 1, 1,
-0.1433898, 0.6922872, -1.852489, 1, 1, 1, 1, 1,
-0.1430172, 0.3236552, -0.6289226, 1, 1, 1, 1, 1,
-0.1412993, -1.55666, -4.165903, 1, 1, 1, 1, 1,
-0.141296, 0.9599426, -0.008899867, 1, 1, 1, 1, 1,
-0.1371299, -0.5592936, -3.275103, 1, 1, 1, 1, 1,
-0.1356188, -0.6428297, -1.428, 0, 0, 1, 1, 1,
-0.1348519, -2.086266, -3.099708, 1, 0, 0, 1, 1,
-0.1344442, 1.339768, -0.4357134, 1, 0, 0, 1, 1,
-0.1340658, 0.2148066, -0.6201473, 1, 0, 0, 1, 1,
-0.132819, 0.9691368, -0.6829829, 1, 0, 0, 1, 1,
-0.1321285, -0.5765305, -2.024605, 1, 0, 0, 1, 1,
-0.1309307, 0.06786091, -0.2949957, 0, 0, 0, 1, 1,
-0.1037009, -0.3257782, -1.725572, 0, 0, 0, 1, 1,
-0.101269, 1.459982, -0.2318069, 0, 0, 0, 1, 1,
-0.1012388, 1.277145, 1.197667, 0, 0, 0, 1, 1,
-0.1011583, 1.312863, -0.7855782, 0, 0, 0, 1, 1,
-0.09873967, -0.7077069, -4.457424, 0, 0, 0, 1, 1,
-0.09488399, -0.05663726, -0.6064317, 0, 0, 0, 1, 1,
-0.09403203, 0.9845994, -0.605172, 1, 1, 1, 1, 1,
-0.08945892, 0.4927488, 1.003733, 1, 1, 1, 1, 1,
-0.07817981, -0.201868, -2.134642, 1, 1, 1, 1, 1,
-0.07514384, -0.4239208, -4.336692, 1, 1, 1, 1, 1,
-0.07166307, 0.09663923, 0.9673513, 1, 1, 1, 1, 1,
-0.05922416, -0.8278331, -2.93373, 1, 1, 1, 1, 1,
-0.05249133, -0.4536246, -4.118656, 1, 1, 1, 1, 1,
-0.0507312, -0.2961534, -4.348912, 1, 1, 1, 1, 1,
-0.04837374, 0.06606746, -0.8530886, 1, 1, 1, 1, 1,
-0.04620967, 0.4379931, -0.4974744, 1, 1, 1, 1, 1,
-0.04372478, -0.2043596, -4.192702, 1, 1, 1, 1, 1,
-0.04328873, -0.2056347, -2.609625, 1, 1, 1, 1, 1,
-0.04036989, -0.01081173, -0.2953174, 1, 1, 1, 1, 1,
-0.03813028, -0.1520524, -2.370676, 1, 1, 1, 1, 1,
-0.02957405, -0.04509502, -5.083998, 1, 1, 1, 1, 1,
-0.02734626, -0.5275715, -5.21211, 0, 0, 1, 1, 1,
-0.02679204, -0.09624038, -3.1977, 1, 0, 0, 1, 1,
-0.02634781, 0.532709, 0.3869772, 1, 0, 0, 1, 1,
-0.02491073, -0.2663621, -2.452981, 1, 0, 0, 1, 1,
-0.02466447, 0.01310676, -0.4977556, 1, 0, 0, 1, 1,
-0.02296459, -0.5866498, -2.665753, 1, 0, 0, 1, 1,
-0.02202502, 0.2785199, 0.1787312, 0, 0, 0, 1, 1,
-0.01469384, -1.4545, -3.673576, 0, 0, 0, 1, 1,
-0.01206851, -0.7070223, -4.4429, 0, 0, 0, 1, 1,
-0.01159929, -0.2247847, -2.571033, 0, 0, 0, 1, 1,
-0.01005475, 0.1991715, -0.9478213, 0, 0, 0, 1, 1,
-0.008941663, -0.2864913, -1.773707, 0, 0, 0, 1, 1,
-0.008434343, -0.5658684, -3.195496, 0, 0, 0, 1, 1,
-0.004601454, -0.9576337, -2.563644, 1, 1, 1, 1, 1,
-0.003274814, 1.546886, 2.304896, 1, 1, 1, 1, 1,
0.002537524, 0.5912975, -0.5513572, 1, 1, 1, 1, 1,
0.007862934, -1.219437, 2.914985, 1, 1, 1, 1, 1,
0.008565459, 0.2225633, -1.571874, 1, 1, 1, 1, 1,
0.01201658, -0.9496034, 1.136945, 1, 1, 1, 1, 1,
0.01359128, 1.33372, -0.1384782, 1, 1, 1, 1, 1,
0.01604527, -0.748394, 3.960808, 1, 1, 1, 1, 1,
0.01805517, 1.213229, 0.5772811, 1, 1, 1, 1, 1,
0.02482247, 1.244694, 0.8292059, 1, 1, 1, 1, 1,
0.02496223, 0.6329572, -1.437636, 1, 1, 1, 1, 1,
0.0370208, 0.1479353, -0.3270205, 1, 1, 1, 1, 1,
0.03751707, 0.2957576, 0.102753, 1, 1, 1, 1, 1,
0.04092933, -0.2042502, 2.466269, 1, 1, 1, 1, 1,
0.04796007, -0.3657703, 3.560883, 1, 1, 1, 1, 1,
0.04830367, -0.474333, 3.086172, 0, 0, 1, 1, 1,
0.0484008, 0.6781236, -0.1983373, 1, 0, 0, 1, 1,
0.05103471, 1.536886, -1.571404, 1, 0, 0, 1, 1,
0.05515916, -1.076196, 2.145845, 1, 0, 0, 1, 1,
0.05705246, -0.4341292, 3.946706, 1, 0, 0, 1, 1,
0.05912736, -0.6070794, 2.679526, 1, 0, 0, 1, 1,
0.06450592, 0.2238018, 0.7275217, 0, 0, 0, 1, 1,
0.06557407, -0.03029592, 3.028776, 0, 0, 0, 1, 1,
0.06739869, -0.8794279, 2.031021, 0, 0, 0, 1, 1,
0.068455, 1.515307, -1.835607, 0, 0, 0, 1, 1,
0.0694948, -1.185562, 3.168157, 0, 0, 0, 1, 1,
0.07529972, 0.2712097, 0.07448413, 0, 0, 0, 1, 1,
0.07648035, 1.37503, -0.6952674, 0, 0, 0, 1, 1,
0.07894574, -0.5992458, 3.643793, 1, 1, 1, 1, 1,
0.07967105, -2.168595, 2.918712, 1, 1, 1, 1, 1,
0.08168978, -0.07671228, 0.840753, 1, 1, 1, 1, 1,
0.08652268, -1.24966, 3.045824, 1, 1, 1, 1, 1,
0.08741525, -1.37539, 2.635307, 1, 1, 1, 1, 1,
0.08763331, 1.492168, -0.270008, 1, 1, 1, 1, 1,
0.09083293, -0.9254571, 2.484657, 1, 1, 1, 1, 1,
0.1023135, -1.448711, 1.66108, 1, 1, 1, 1, 1,
0.1068962, 0.2099486, -0.3229721, 1, 1, 1, 1, 1,
0.1072386, 1.658505, 2.140058, 1, 1, 1, 1, 1,
0.1075834, -0.4591927, 2.380793, 1, 1, 1, 1, 1,
0.1078322, -0.6896834, 3.144598, 1, 1, 1, 1, 1,
0.1089319, -0.321826, 1.959202, 1, 1, 1, 1, 1,
0.1106627, -0.1757335, 3.200417, 1, 1, 1, 1, 1,
0.1158283, -2.437949, 3.581671, 1, 1, 1, 1, 1,
0.1180645, -0.9533031, 1.596857, 0, 0, 1, 1, 1,
0.121545, 1.484623, 0.7657168, 1, 0, 0, 1, 1,
0.127011, 0.09249718, 0.01742859, 1, 0, 0, 1, 1,
0.1272833, -0.6693351, 3.871043, 1, 0, 0, 1, 1,
0.1293037, -0.4695513, 2.97318, 1, 0, 0, 1, 1,
0.1317019, -0.3048626, 4.072176, 1, 0, 0, 1, 1,
0.1338263, -0.08925094, 3.242892, 0, 0, 0, 1, 1,
0.1345365, -0.1097134, 3.097804, 0, 0, 0, 1, 1,
0.1348587, -0.3596171, 1.990316, 0, 0, 0, 1, 1,
0.1442644, 0.1808343, 0.6454602, 0, 0, 0, 1, 1,
0.1449633, -0.6356547, 2.18268, 0, 0, 0, 1, 1,
0.1451392, -0.09353724, 1.436152, 0, 0, 0, 1, 1,
0.1464203, -0.2202907, 1.570652, 0, 0, 0, 1, 1,
0.1489078, -1.000008, 2.201845, 1, 1, 1, 1, 1,
0.1538446, -0.1289792, 0.7905896, 1, 1, 1, 1, 1,
0.155967, -0.1358008, 1.873384, 1, 1, 1, 1, 1,
0.1579109, 0.5511482, 0.3080354, 1, 1, 1, 1, 1,
0.1618428, -0.05723462, 1.428269, 1, 1, 1, 1, 1,
0.1636233, 0.7179227, 0.2150783, 1, 1, 1, 1, 1,
0.1640706, -0.4529032, 1.47707, 1, 1, 1, 1, 1,
0.1655303, 1.722071, 0.9161988, 1, 1, 1, 1, 1,
0.1676002, -0.651604, 3.90214, 1, 1, 1, 1, 1,
0.1738656, -0.7102668, 3.748804, 1, 1, 1, 1, 1,
0.1778091, -0.9478238, 4.046562, 1, 1, 1, 1, 1,
0.1779066, -0.1404675, 2.402821, 1, 1, 1, 1, 1,
0.1888247, -0.6760436, 1.948987, 1, 1, 1, 1, 1,
0.191491, 0.8286115, 0.004126438, 1, 1, 1, 1, 1,
0.1954933, -1.976202, 4.272428, 1, 1, 1, 1, 1,
0.199267, -0.7809172, 1.940614, 0, 0, 1, 1, 1,
0.2007493, 0.9123292, 0.2008783, 1, 0, 0, 1, 1,
0.2011181, -1.037016, 1.918358, 1, 0, 0, 1, 1,
0.201338, -1.005263, 2.290322, 1, 0, 0, 1, 1,
0.2018187, -0.9903112, 2.977063, 1, 0, 0, 1, 1,
0.202458, 1.176575, 0.4394911, 1, 0, 0, 1, 1,
0.203013, -0.7571236, 2.748086, 0, 0, 0, 1, 1,
0.2098593, 0.5761503, 1.415691, 0, 0, 0, 1, 1,
0.2125386, 1.058554, -0.5288681, 0, 0, 0, 1, 1,
0.2221377, -0.3812886, 3.536558, 0, 0, 0, 1, 1,
0.2230867, 0.3831699, -0.4191388, 0, 0, 0, 1, 1,
0.2232907, 0.445107, -2.399744, 0, 0, 0, 1, 1,
0.2297773, 0.456374, -1.180421, 0, 0, 0, 1, 1,
0.2306216, -1.009218, 1.020363, 1, 1, 1, 1, 1,
0.2319003, 0.2009013, 0.8366631, 1, 1, 1, 1, 1,
0.233743, 0.4789736, 1.631063, 1, 1, 1, 1, 1,
0.2390994, -0.02441028, 0.2426572, 1, 1, 1, 1, 1,
0.2398718, 0.09257531, 1.567659, 1, 1, 1, 1, 1,
0.241874, 0.9383693, -1.946492, 1, 1, 1, 1, 1,
0.242154, -1.125356, 3.586568, 1, 1, 1, 1, 1,
0.2464079, -1.186117, 1.813387, 1, 1, 1, 1, 1,
0.246912, 0.9684671, 2.214347, 1, 1, 1, 1, 1,
0.2495745, -2.247375, 3.864246, 1, 1, 1, 1, 1,
0.2524602, 0.7812416, -1.039204, 1, 1, 1, 1, 1,
0.2563758, 1.86841, -0.5177181, 1, 1, 1, 1, 1,
0.257348, -1.052698, 3.167124, 1, 1, 1, 1, 1,
0.2576286, -0.1868217, 1.365543, 1, 1, 1, 1, 1,
0.2576286, -1.741392, 4.65525, 1, 1, 1, 1, 1,
0.2653069, 0.4023523, 1.4503, 0, 0, 1, 1, 1,
0.2667963, 0.7758597, 1.687494, 1, 0, 0, 1, 1,
0.2695723, -0.3574396, 2.533685, 1, 0, 0, 1, 1,
0.269988, -2.091901, 3.085612, 1, 0, 0, 1, 1,
0.2758501, -0.4758774, 2.15268, 1, 0, 0, 1, 1,
0.2785645, 0.5808008, 0.9838139, 1, 0, 0, 1, 1,
0.2785967, 1.55957, 0.6588905, 0, 0, 0, 1, 1,
0.2857136, 2.011442, -0.3118227, 0, 0, 0, 1, 1,
0.2869917, 0.7416714, 0.290018, 0, 0, 0, 1, 1,
0.2928171, 1.454747, -1.112321, 0, 0, 0, 1, 1,
0.2954891, 1.093839, -0.3043955, 0, 0, 0, 1, 1,
0.2983417, -1.897099, 2.096521, 0, 0, 0, 1, 1,
0.299324, -0.2680011, 3.073318, 0, 0, 0, 1, 1,
0.2993664, -1.173083, 3.882217, 1, 1, 1, 1, 1,
0.2994436, -1.009375, 3.637671, 1, 1, 1, 1, 1,
0.2999473, 0.2868054, 2.714394, 1, 1, 1, 1, 1,
0.2999665, 0.684237, -0.6181288, 1, 1, 1, 1, 1,
0.3017669, -0.8131536, 2.485757, 1, 1, 1, 1, 1,
0.3037618, -0.8369445, 2.670701, 1, 1, 1, 1, 1,
0.3067456, 0.6629795, 1.207654, 1, 1, 1, 1, 1,
0.3094685, -0.9269598, 2.408021, 1, 1, 1, 1, 1,
0.3109526, -1.464982, 3.281835, 1, 1, 1, 1, 1,
0.315615, -0.200291, 2.792933, 1, 1, 1, 1, 1,
0.3184534, -0.5718508, 3.137045, 1, 1, 1, 1, 1,
0.321532, -1.504409, 3.22981, 1, 1, 1, 1, 1,
0.3235513, 0.6946718, 1.755039, 1, 1, 1, 1, 1,
0.323877, 0.05499379, 0.00893996, 1, 1, 1, 1, 1,
0.3259432, 0.2499051, 1.066788, 1, 1, 1, 1, 1,
0.3342103, -2.176401, 3.417834, 0, 0, 1, 1, 1,
0.3344585, -0.3241605, 2.418191, 1, 0, 0, 1, 1,
0.3348094, 0.01397789, -0.1195607, 1, 0, 0, 1, 1,
0.337357, 0.03214035, 2.396675, 1, 0, 0, 1, 1,
0.3387958, 0.0208332, 1.805013, 1, 0, 0, 1, 1,
0.3388959, -1.556597, 2.618926, 1, 0, 0, 1, 1,
0.3411913, -1.621289, 1.987814, 0, 0, 0, 1, 1,
0.3419835, -0.4430794, 3.307256, 0, 0, 0, 1, 1,
0.3478695, -0.1365418, 2.56621, 0, 0, 0, 1, 1,
0.3510523, 0.2325186, 0.3364892, 0, 0, 0, 1, 1,
0.3523526, 0.09303921, 1.813329, 0, 0, 0, 1, 1,
0.3567023, -0.354504, 1.562775, 0, 0, 0, 1, 1,
0.3599909, 1.918183, 0.4041093, 0, 0, 0, 1, 1,
0.360247, -0.5510111, 1.867942, 1, 1, 1, 1, 1,
0.3634345, 0.1700701, 2.563433, 1, 1, 1, 1, 1,
0.3690816, 0.4562993, 0.5587338, 1, 1, 1, 1, 1,
0.3707082, -1.295456, 2.848498, 1, 1, 1, 1, 1,
0.3716951, 1.809644, -1.34489, 1, 1, 1, 1, 1,
0.3775582, 0.5727656, 1.090758, 1, 1, 1, 1, 1,
0.3819253, 1.101552, 1.194182, 1, 1, 1, 1, 1,
0.3898945, 1.619064, -1.07908, 1, 1, 1, 1, 1,
0.3929299, -1.440995, 2.574977, 1, 1, 1, 1, 1,
0.3951316, -0.2204362, 3.489793, 1, 1, 1, 1, 1,
0.4021592, 0.4429007, 0.5752677, 1, 1, 1, 1, 1,
0.4107194, 0.8434824, -0.4826923, 1, 1, 1, 1, 1,
0.4170934, 0.3417212, 1.377873, 1, 1, 1, 1, 1,
0.4261013, -1.04635, 3.031613, 1, 1, 1, 1, 1,
0.4323001, 0.05716906, 3.023998, 1, 1, 1, 1, 1,
0.4328312, 1.146069, 1.231051, 0, 0, 1, 1, 1,
0.4342661, 1.091411, -1.177986, 1, 0, 0, 1, 1,
0.4361929, 0.8943124, 0.5718489, 1, 0, 0, 1, 1,
0.4363167, 0.2131158, 0.8454563, 1, 0, 0, 1, 1,
0.4366029, 0.2086732, 0.9641041, 1, 0, 0, 1, 1,
0.4386715, -0.297027, 2.239108, 1, 0, 0, 1, 1,
0.443364, -0.3954545, 1.967895, 0, 0, 0, 1, 1,
0.4495917, 0.3799641, -0.7155614, 0, 0, 0, 1, 1,
0.4502648, -0.1368386, 1.049083, 0, 0, 0, 1, 1,
0.451555, 1.447108, 0.854789, 0, 0, 0, 1, 1,
0.4526326, -0.7464535, 3.17041, 0, 0, 0, 1, 1,
0.4534529, 0.1476107, 2.094801, 0, 0, 0, 1, 1,
0.4541062, -0.2556216, 1.122957, 0, 0, 0, 1, 1,
0.4550886, 1.718601, -1.739923, 1, 1, 1, 1, 1,
0.455213, -0.980266, 2.592671, 1, 1, 1, 1, 1,
0.4569466, -1.492832, 1.936032, 1, 1, 1, 1, 1,
0.4651838, 0.9354241, -1.330779, 1, 1, 1, 1, 1,
0.4659483, 0.4827832, 0.4984066, 1, 1, 1, 1, 1,
0.4676665, -0.2143063, 2.180501, 1, 1, 1, 1, 1,
0.4689019, 1.661024, -1.299211, 1, 1, 1, 1, 1,
0.4758744, -0.6768467, 1.76596, 1, 1, 1, 1, 1,
0.4819949, -1.97236, 2.407919, 1, 1, 1, 1, 1,
0.4861458, 0.1081941, 1.652354, 1, 1, 1, 1, 1,
0.4921977, 1.128788, -0.8154735, 1, 1, 1, 1, 1,
0.5002532, -0.5368781, 2.80978, 1, 1, 1, 1, 1,
0.5037969, -1.095716, 1.968672, 1, 1, 1, 1, 1,
0.5076763, -0.1792954, 1.662903, 1, 1, 1, 1, 1,
0.5082225, -0.4806802, 2.688053, 1, 1, 1, 1, 1,
0.5084951, -0.2788974, 3.520699, 0, 0, 1, 1, 1,
0.5092732, 0.9432305, 0.2421632, 1, 0, 0, 1, 1,
0.5138263, 2.263316, -1.47619, 1, 0, 0, 1, 1,
0.5151244, -0.7606757, 2.563507, 1, 0, 0, 1, 1,
0.5209786, -0.5104758, 3.783882, 1, 0, 0, 1, 1,
0.5227721, 1.281333, -0.6641263, 1, 0, 0, 1, 1,
0.5262333, 0.3112795, 2.831261, 0, 0, 0, 1, 1,
0.5274585, 0.02762656, 2.272396, 0, 0, 0, 1, 1,
0.5284966, -1.36656, 3.094893, 0, 0, 0, 1, 1,
0.5296146, -0.6722524, 0.8262053, 0, 0, 0, 1, 1,
0.5351471, 0.04192856, 1.555068, 0, 0, 0, 1, 1,
0.5362883, -1.966727, 3.705396, 0, 0, 0, 1, 1,
0.5375336, -2.080997, 2.757134, 0, 0, 0, 1, 1,
0.5377318, 1.138641, 1.008093, 1, 1, 1, 1, 1,
0.5388712, -0.8793985, 3.377532, 1, 1, 1, 1, 1,
0.5414187, 0.9284299, -0.5253678, 1, 1, 1, 1, 1,
0.5455911, -1.635197, 3.45801, 1, 1, 1, 1, 1,
0.5490784, 1.335387, 0.8016871, 1, 1, 1, 1, 1,
0.5513732, 0.3659454, -0.3694883, 1, 1, 1, 1, 1,
0.5525759, -1.770442, 2.402644, 1, 1, 1, 1, 1,
0.5576869, -0.5890936, 2.436952, 1, 1, 1, 1, 1,
0.5579063, 0.002417207, 1.591301, 1, 1, 1, 1, 1,
0.5579068, 1.496734, -0.9882294, 1, 1, 1, 1, 1,
0.5583324, -0.2009313, 3.162042, 1, 1, 1, 1, 1,
0.5654534, -0.4427909, 3.322231, 1, 1, 1, 1, 1,
0.5656065, -0.995488, 2.946802, 1, 1, 1, 1, 1,
0.5673575, 0.0239997, 1.673114, 1, 1, 1, 1, 1,
0.5673608, -1.735709, 3.565478, 1, 1, 1, 1, 1,
0.5714268, 0.6237729, 0.6683017, 0, 0, 1, 1, 1,
0.5757227, 0.8610458, 1.571624, 1, 0, 0, 1, 1,
0.5763113, -1.748657, 3.063731, 1, 0, 0, 1, 1,
0.5767317, 1.081346, 1.770255, 1, 0, 0, 1, 1,
0.5791615, 2.174659, -1.065045, 1, 0, 0, 1, 1,
0.5807456, -0.5073004, 2.527133, 1, 0, 0, 1, 1,
0.5811642, 0.4612818, -0.3366444, 0, 0, 0, 1, 1,
0.5813535, 0.5018401, 1.307535, 0, 0, 0, 1, 1,
0.5835467, 0.4033531, 1.53156, 0, 0, 0, 1, 1,
0.586642, 0.4907826, 1.037986, 0, 0, 0, 1, 1,
0.5902351, -0.1715841, 2.104523, 0, 0, 0, 1, 1,
0.5990076, 0.8915414, 0.1663789, 0, 0, 0, 1, 1,
0.6013758, -0.04377528, 2.159188, 0, 0, 0, 1, 1,
0.6026297, 0.5960457, -0.8017623, 1, 1, 1, 1, 1,
0.6045498, 1.518242, -0.5382897, 1, 1, 1, 1, 1,
0.6095497, 0.32252, 1.358524, 1, 1, 1, 1, 1,
0.611253, -1.345972, 3.666454, 1, 1, 1, 1, 1,
0.6124007, 1.629155, -0.596383, 1, 1, 1, 1, 1,
0.6131915, -0.06709493, 0.5233182, 1, 1, 1, 1, 1,
0.6137459, 0.4262282, 0.07554357, 1, 1, 1, 1, 1,
0.6140355, -0.3327844, 1.10949, 1, 1, 1, 1, 1,
0.6205418, -0.6333888, 2.705292, 1, 1, 1, 1, 1,
0.6223226, -1.225622, 2.038187, 1, 1, 1, 1, 1,
0.6269453, 2.141207, -0.1512945, 1, 1, 1, 1, 1,
0.6297079, -0.8529766, 3.532013, 1, 1, 1, 1, 1,
0.6310693, -0.4734198, 1.445313, 1, 1, 1, 1, 1,
0.6388093, 1.010079, 1.726185, 1, 1, 1, 1, 1,
0.6425723, 0.6526124, 0.8916196, 1, 1, 1, 1, 1,
0.6427483, -0.7893129, 2.454437, 0, 0, 1, 1, 1,
0.6495758, 0.1280153, 1.023501, 1, 0, 0, 1, 1,
0.6510442, -1.198185, 4.291473, 1, 0, 0, 1, 1,
0.6512989, -0.6379991, 1.797895, 1, 0, 0, 1, 1,
0.6565847, 2.640785, 1.132384, 1, 0, 0, 1, 1,
0.656739, -0.1365179, 2.468056, 1, 0, 0, 1, 1,
0.6572205, -0.8132843, 2.983538, 0, 0, 0, 1, 1,
0.6599745, 0.3464202, 0.5342022, 0, 0, 0, 1, 1,
0.6619675, 1.45878, -0.7900635, 0, 0, 0, 1, 1,
0.6619918, -0.7108939, 0.9940823, 0, 0, 0, 1, 1,
0.6620523, -0.9454567, 3.726486, 0, 0, 0, 1, 1,
0.6629157, -0.3909143, 1.413831, 0, 0, 0, 1, 1,
0.6631108, -1.363237, 1.863027, 0, 0, 0, 1, 1,
0.6652987, 1.113458, 0.5227783, 1, 1, 1, 1, 1,
0.6755822, 1.319506, 1.055488, 1, 1, 1, 1, 1,
0.6801289, -0.1955723, -0.4027928, 1, 1, 1, 1, 1,
0.6802461, 1.786939, 1.196365, 1, 1, 1, 1, 1,
0.6867532, -1.097306, 2.529008, 1, 1, 1, 1, 1,
0.6908291, -0.6065727, 0.1189651, 1, 1, 1, 1, 1,
0.692506, 0.9073129, 0.2756155, 1, 1, 1, 1, 1,
0.6972552, 0.03152568, 1.642669, 1, 1, 1, 1, 1,
0.6988213, -0.2170677, 0.5451363, 1, 1, 1, 1, 1,
0.7027406, 0.2799844, 1.674137, 1, 1, 1, 1, 1,
0.7044669, 0.1903915, 0.6492648, 1, 1, 1, 1, 1,
0.7050919, -0.6313894, 1.643098, 1, 1, 1, 1, 1,
0.7072116, 1.021944, 0.4192767, 1, 1, 1, 1, 1,
0.7089348, 0.1616552, 1.203238, 1, 1, 1, 1, 1,
0.7100746, -0.1964266, 1.338045, 1, 1, 1, 1, 1,
0.7114311, -1.045215, 2.512757, 0, 0, 1, 1, 1,
0.7195282, -0.0108217, 1.920121, 1, 0, 0, 1, 1,
0.7208382, -1.718409, 3.144588, 1, 0, 0, 1, 1,
0.7213501, 0.07075242, 1.708242, 1, 0, 0, 1, 1,
0.7217591, 1.197881, 1.316402, 1, 0, 0, 1, 1,
0.7232177, 0.4380212, -0.3343359, 1, 0, 0, 1, 1,
0.7260395, 0.3860104, 2.065467, 0, 0, 0, 1, 1,
0.7308156, 1.156151, 0.8493378, 0, 0, 0, 1, 1,
0.733644, -0.7499854, 2.511164, 0, 0, 0, 1, 1,
0.7372456, -0.6104248, 1.506065, 0, 0, 0, 1, 1,
0.7390165, -0.2512863, 1.274482, 0, 0, 0, 1, 1,
0.7400508, 1.731815, 1.562324, 0, 0, 0, 1, 1,
0.7408007, -1.46397, 2.776897, 0, 0, 0, 1, 1,
0.7410684, 0.3877803, 0.03232813, 1, 1, 1, 1, 1,
0.7429782, 0.2488434, 2.097368, 1, 1, 1, 1, 1,
0.7464743, -0.5274084, 2.379422, 1, 1, 1, 1, 1,
0.7468475, -0.5989999, 2.274526, 1, 1, 1, 1, 1,
0.7496378, -1.263597, 2.941737, 1, 1, 1, 1, 1,
0.7504617, 0.5835012, 1.061466, 1, 1, 1, 1, 1,
0.752445, 0.3930422, 2.18112, 1, 1, 1, 1, 1,
0.7601731, -0.2195654, 2.312693, 1, 1, 1, 1, 1,
0.7656981, -0.2330972, 1.988674, 1, 1, 1, 1, 1,
0.7668324, 0.6798293, 1.159563, 1, 1, 1, 1, 1,
0.7687252, -0.3181284, 3.309391, 1, 1, 1, 1, 1,
0.7740431, -0.3511494, 2.980547, 1, 1, 1, 1, 1,
0.7760468, 0.8652203, -0.2496748, 1, 1, 1, 1, 1,
0.776592, -0.6755822, 2.910947, 1, 1, 1, 1, 1,
0.7775062, -0.5176703, 0.5052788, 1, 1, 1, 1, 1,
0.7808967, -1.250805, 3.581414, 0, 0, 1, 1, 1,
0.787921, -1.441055, 1.837551, 1, 0, 0, 1, 1,
0.7880353, -1.742115, 2.620497, 1, 0, 0, 1, 1,
0.7913723, -0.1448608, 1.563896, 1, 0, 0, 1, 1,
0.7937142, -0.3537485, 1.042602, 1, 0, 0, 1, 1,
0.7941437, 0.6968026, 0.8869918, 1, 0, 0, 1, 1,
0.7947202, 1.251871, 1.167476, 0, 0, 0, 1, 1,
0.7996412, 0.6041328, 1.48434, 0, 0, 0, 1, 1,
0.8039383, 0.1294992, 1.123116, 0, 0, 0, 1, 1,
0.8128313, 0.647123, 0.6519253, 0, 0, 0, 1, 1,
0.8130271, -0.09739521, 2.018478, 0, 0, 0, 1, 1,
0.8192402, 1.410055, 1.175452, 0, 0, 0, 1, 1,
0.8309797, 1.318126, 0.5720769, 0, 0, 0, 1, 1,
0.8312544, 1.193782, 2.98262, 1, 1, 1, 1, 1,
0.8321879, 0.5934812, -0.02471667, 1, 1, 1, 1, 1,
0.8358824, 1.484571, 2.501698, 1, 1, 1, 1, 1,
0.8363029, 0.7965983, 0.4213211, 1, 1, 1, 1, 1,
0.84087, -0.7624151, 2.127604, 1, 1, 1, 1, 1,
0.8449656, 1.342039, 1.12235, 1, 1, 1, 1, 1,
0.8449816, 0.05833904, 2.25282, 1, 1, 1, 1, 1,
0.8514121, -2.957845, 1.268371, 1, 1, 1, 1, 1,
0.8670299, 0.8107517, -0.4872391, 1, 1, 1, 1, 1,
0.8850604, -0.8073737, 2.321233, 1, 1, 1, 1, 1,
0.8909543, -0.007645282, 0.9446412, 1, 1, 1, 1, 1,
0.8946708, 0.9680986, -2.21652, 1, 1, 1, 1, 1,
0.8982, 0.6431942, 0.505566, 1, 1, 1, 1, 1,
0.9076684, -0.9129758, 1.826943, 1, 1, 1, 1, 1,
0.9079636, -0.3522393, 1.79717, 1, 1, 1, 1, 1,
0.9090815, 1.173874, -1.0854, 0, 0, 1, 1, 1,
0.9159279, 1.397795, -0.4375262, 1, 0, 0, 1, 1,
0.9277268, -0.540522, 1.982701, 1, 0, 0, 1, 1,
0.9325128, 1.258221, 0.6833597, 1, 0, 0, 1, 1,
0.9329474, -1.214707, 0.8069293, 1, 0, 0, 1, 1,
0.9404295, 0.8942615, 1.543051, 1, 0, 0, 1, 1,
0.949774, 0.8420154, -1.300896, 0, 0, 0, 1, 1,
0.9507215, 0.8880451, 2.086528, 0, 0, 0, 1, 1,
0.9542132, 0.2197694, 1.151502, 0, 0, 0, 1, 1,
0.9554433, 0.6209869, 2.321624, 0, 0, 0, 1, 1,
0.9582445, -1.484518, 2.230883, 0, 0, 0, 1, 1,
0.9654442, 1.494894, -0.1310034, 0, 0, 0, 1, 1,
0.9655049, -1.19512, 3.104747, 0, 0, 0, 1, 1,
0.9730331, -0.9064098, 0.8683211, 1, 1, 1, 1, 1,
0.9735545, 0.891656, 0.6718, 1, 1, 1, 1, 1,
0.9795882, 0.01123719, 1.165301, 1, 1, 1, 1, 1,
0.9827676, 1.324778, 1.458181, 1, 1, 1, 1, 1,
0.9872659, -0.02845732, 3.125101, 1, 1, 1, 1, 1,
0.9963328, 1.7599, -1.254769, 1, 1, 1, 1, 1,
0.9992342, -0.002472632, 1.064518, 1, 1, 1, 1, 1,
1.00216, -0.03124543, 0.5915659, 1, 1, 1, 1, 1,
1.004721, 0.6006283, 1.159779, 1, 1, 1, 1, 1,
1.026003, -0.01753285, 3.107448, 1, 1, 1, 1, 1,
1.027383, -0.3257544, 2.542704, 1, 1, 1, 1, 1,
1.035215, 0.9752056, 1.075862, 1, 1, 1, 1, 1,
1.036008, 0.7791878, 1.210781, 1, 1, 1, 1, 1,
1.037159, -0.2704993, 0.2672221, 1, 1, 1, 1, 1,
1.052928, 0.1847716, 0.858916, 1, 1, 1, 1, 1,
1.055104, -0.460088, 0.8073021, 0, 0, 1, 1, 1,
1.056742, 0.2431549, -0.4495492, 1, 0, 0, 1, 1,
1.057226, 0.05438524, 3.735868, 1, 0, 0, 1, 1,
1.057905, -0.2299574, 1.979193, 1, 0, 0, 1, 1,
1.08013, -0.5395206, 1.988157, 1, 0, 0, 1, 1,
1.083978, 0.8188004, 2.310045, 1, 0, 0, 1, 1,
1.088323, -1.127654, 2.507532, 0, 0, 0, 1, 1,
1.090807, -0.5928658, 1.123534, 0, 0, 0, 1, 1,
1.096132, -0.2139572, 2.645239, 0, 0, 0, 1, 1,
1.098636, 1.331972, 0.1324743, 0, 0, 0, 1, 1,
1.100943, -1.287509, 2.19219, 0, 0, 0, 1, 1,
1.103568, 2.002721, 0.770905, 0, 0, 0, 1, 1,
1.104969, 1.034814, -0.7571453, 0, 0, 0, 1, 1,
1.110783, -0.3199327, 2.274682, 1, 1, 1, 1, 1,
1.112017, -1.567931, 4.805229, 1, 1, 1, 1, 1,
1.113879, -0.1402978, 1.544182, 1, 1, 1, 1, 1,
1.115449, -2.084328, 2.555525, 1, 1, 1, 1, 1,
1.118229, 1.610581, -0.8065183, 1, 1, 1, 1, 1,
1.121537, 0.8877925, 1.417146, 1, 1, 1, 1, 1,
1.1252, -0.9126551, 3.867137, 1, 1, 1, 1, 1,
1.12907, 0.3697096, 0.7841722, 1, 1, 1, 1, 1,
1.13465, 0.4632175, 2.35984, 1, 1, 1, 1, 1,
1.138042, -0.2744151, 2.643131, 1, 1, 1, 1, 1,
1.143405, -0.4828315, 0.31801, 1, 1, 1, 1, 1,
1.164463, -1.001358, 3.060912, 1, 1, 1, 1, 1,
1.164685, -1.207971, 1.261459, 1, 1, 1, 1, 1,
1.165189, -0.2090579, 1.884621, 1, 1, 1, 1, 1,
1.170488, 1.126637, 1.071967, 1, 1, 1, 1, 1,
1.175501, -0.06050004, 1.151956, 0, 0, 1, 1, 1,
1.177311, -0.8806493, 1.760556, 1, 0, 0, 1, 1,
1.179791, -0.02110545, 0.9381003, 1, 0, 0, 1, 1,
1.187941, 0.5308985, 0.08241137, 1, 0, 0, 1, 1,
1.193103, -0.8733522, 1.160562, 1, 0, 0, 1, 1,
1.199371, 1.456745, 0.8083865, 1, 0, 0, 1, 1,
1.20591, 0.56734, 2.018179, 0, 0, 0, 1, 1,
1.20991, 0.08796559, 0.4396389, 0, 0, 0, 1, 1,
1.215229, -1.328877, 1.972638, 0, 0, 0, 1, 1,
1.215397, -0.5299407, 2.737434, 0, 0, 0, 1, 1,
1.220654, 0.6215411, -0.1363277, 0, 0, 0, 1, 1,
1.223852, 1.782516, -0.104672, 0, 0, 0, 1, 1,
1.231938, 0.3072315, 0.318637, 0, 0, 0, 1, 1,
1.237358, 0.06366954, 1.654872, 1, 1, 1, 1, 1,
1.23744, -0.5573381, 1.758402, 1, 1, 1, 1, 1,
1.24243, 0.3063016, 1.790047, 1, 1, 1, 1, 1,
1.247359, 0.6052935, 1.513084, 1, 1, 1, 1, 1,
1.252316, -0.3030309, 2.22639, 1, 1, 1, 1, 1,
1.257236, -0.3984373, 2.496166, 1, 1, 1, 1, 1,
1.258374, -1.009434, 3.492624, 1, 1, 1, 1, 1,
1.259036, -1.25573, 2.140566, 1, 1, 1, 1, 1,
1.261667, 0.7681305, 0.9882887, 1, 1, 1, 1, 1,
1.264322, -0.5724143, 0.4678889, 1, 1, 1, 1, 1,
1.271087, 0.7800611, 1.060301, 1, 1, 1, 1, 1,
1.27446, -0.6786159, 2.514293, 1, 1, 1, 1, 1,
1.278085, -1.112002, 2.354555, 1, 1, 1, 1, 1,
1.287865, -1.16624, 1.556957, 1, 1, 1, 1, 1,
1.294649, 0.5217244, 0.6227056, 1, 1, 1, 1, 1,
1.295185, -0.6190804, 3.362514, 0, 0, 1, 1, 1,
1.305573, -1.384839, 1.536371, 1, 0, 0, 1, 1,
1.309533, 0.3563809, 1.380173, 1, 0, 0, 1, 1,
1.31091, -1.223272, 2.111536, 1, 0, 0, 1, 1,
1.319977, -0.3922167, 3.136656, 1, 0, 0, 1, 1,
1.321398, -1.009035, 2.196396, 1, 0, 0, 1, 1,
1.323521, -0.1550465, 1.67186, 0, 0, 0, 1, 1,
1.325476, 0.8742973, -0.15138, 0, 0, 0, 1, 1,
1.330563, 0.5449747, 2.320542, 0, 0, 0, 1, 1,
1.341867, -2.149333, 2.785628, 0, 0, 0, 1, 1,
1.34609, 0.15055, 0.8563026, 0, 0, 0, 1, 1,
1.346677, -1.032151, 1.514916, 0, 0, 0, 1, 1,
1.355081, 1.702162, -0.4208379, 0, 0, 0, 1, 1,
1.356629, -0.7238477, 0.9991582, 1, 1, 1, 1, 1,
1.368422, -1.291829, 2.802346, 1, 1, 1, 1, 1,
1.369291, -0.5546848, 2.889187, 1, 1, 1, 1, 1,
1.373168, 0.4049997, 0.5984049, 1, 1, 1, 1, 1,
1.376887, 1.24452, -0.8061221, 1, 1, 1, 1, 1,
1.383887, 1.219813, 1.956273, 1, 1, 1, 1, 1,
1.399713, -0.5057165, 2.099119, 1, 1, 1, 1, 1,
1.42286, 1.194216, 2.203489, 1, 1, 1, 1, 1,
1.427137, 0.4755759, 1.340359, 1, 1, 1, 1, 1,
1.430073, -0.7342978, 1.665389, 1, 1, 1, 1, 1,
1.431295, -1.075448, 0.3446983, 1, 1, 1, 1, 1,
1.433332, 2.021758, 0.5076175, 1, 1, 1, 1, 1,
1.437904, -0.8683896, 0.9881775, 1, 1, 1, 1, 1,
1.440086, 0.2085992, 0.7214815, 1, 1, 1, 1, 1,
1.441506, -0.6836383, 2.590653, 1, 1, 1, 1, 1,
1.448502, 0.3370222, 1.84659, 0, 0, 1, 1, 1,
1.449394, -1.430958, 3.123538, 1, 0, 0, 1, 1,
1.472845, -0.6721655, 1.180678, 1, 0, 0, 1, 1,
1.472851, 1.413148, 1.917531, 1, 0, 0, 1, 1,
1.487994, 0.8765889, 0.9422077, 1, 0, 0, 1, 1,
1.490195, -0.5130014, 2.997125, 1, 0, 0, 1, 1,
1.496985, 0.2844211, 1.117517, 0, 0, 0, 1, 1,
1.503696, 0.50922, 2.092592, 0, 0, 0, 1, 1,
1.517493, 0.7503617, 0.1090801, 0, 0, 0, 1, 1,
1.519011, 0.1123407, 1.455683, 0, 0, 0, 1, 1,
1.521673, -1.903193, 1.985134, 0, 0, 0, 1, 1,
1.524284, 0.5460595, 1.506072, 0, 0, 0, 1, 1,
1.543337, 0.005841692, 3.623451, 0, 0, 0, 1, 1,
1.545679, 0.1798848, 1.05695, 1, 1, 1, 1, 1,
1.571618, -0.6876625, -0.07562093, 1, 1, 1, 1, 1,
1.576908, 1.521987, 2.434046, 1, 1, 1, 1, 1,
1.578646, 0.4198209, 2.012111, 1, 1, 1, 1, 1,
1.585659, 0.1201898, 2.520982, 1, 1, 1, 1, 1,
1.600924, -1.1922, 2.510698, 1, 1, 1, 1, 1,
1.605517, 1.067704, -0.7595815, 1, 1, 1, 1, 1,
1.610542, -1.800436, 2.091948, 1, 1, 1, 1, 1,
1.610914, -0.4026081, -0.008051319, 1, 1, 1, 1, 1,
1.61484, -3.006674, 2.965912, 1, 1, 1, 1, 1,
1.621089, -1.706531, 2.042878, 1, 1, 1, 1, 1,
1.623401, 1.72774, 0.5365461, 1, 1, 1, 1, 1,
1.632126, -1.652561, 0.831259, 1, 1, 1, 1, 1,
1.645742, 1.550535, 0.5134929, 1, 1, 1, 1, 1,
1.649811, -0.5935502, 2.698286, 1, 1, 1, 1, 1,
1.652422, -0.3443745, 1.26377, 0, 0, 1, 1, 1,
1.653641, -0.4873486, 0.8918114, 1, 0, 0, 1, 1,
1.655926, -0.2903989, 1.435796, 1, 0, 0, 1, 1,
1.664316, -0.4405863, 1.485667, 1, 0, 0, 1, 1,
1.673652, -0.9647133, 0.08233863, 1, 0, 0, 1, 1,
1.713496, 1.868844, 1.56178, 1, 0, 0, 1, 1,
1.732978, -0.09242976, 1.387354, 0, 0, 0, 1, 1,
1.759069, -0.3529276, 2.432115, 0, 0, 0, 1, 1,
1.762361, 0.1363483, 1.046838, 0, 0, 0, 1, 1,
1.774485, -2.071567, 3.795652, 0, 0, 0, 1, 1,
1.780356, -0.5467034, 1.612548, 0, 0, 0, 1, 1,
1.785948, 0.01302894, 1.999557, 0, 0, 0, 1, 1,
1.808906, -0.5435892, 3.237947, 0, 0, 0, 1, 1,
1.813803, 0.0531697, 2.054315, 1, 1, 1, 1, 1,
1.854712, 0.4032296, 0.4641671, 1, 1, 1, 1, 1,
1.888723, -0.45926, 2.279708, 1, 1, 1, 1, 1,
1.905537, 0.4355317, 1.275573, 1, 1, 1, 1, 1,
1.945337, -2.026575, 1.734459, 1, 1, 1, 1, 1,
1.949684, -1.017334, 2.52926, 1, 1, 1, 1, 1,
1.953243, 1.401996, 0.8783887, 1, 1, 1, 1, 1,
1.961951, -0.2988635, 0.03796981, 1, 1, 1, 1, 1,
1.974563, -0.2641292, 2.418978, 1, 1, 1, 1, 1,
1.976643, -0.6815929, 1.70135, 1, 1, 1, 1, 1,
1.990224, 1.827798, -0.6046662, 1, 1, 1, 1, 1,
1.994471, 0.7275534, 2.82514, 1, 1, 1, 1, 1,
2.007712, -1.376479, 2.26704, 1, 1, 1, 1, 1,
2.067417, 0.1248558, 1.075144, 1, 1, 1, 1, 1,
2.180982, 0.8144862, 2.29231, 1, 1, 1, 1, 1,
2.265822, -1.972115, 2.34884, 0, 0, 1, 1, 1,
2.275959, 0.04004703, 1.349196, 1, 0, 0, 1, 1,
2.276756, -0.3351533, 2.799973, 1, 0, 0, 1, 1,
2.290779, 0.3096117, 1.512114, 1, 0, 0, 1, 1,
2.292866, 0.7061354, 0.4537274, 1, 0, 0, 1, 1,
2.298347, -0.5685115, 2.152502, 1, 0, 0, 1, 1,
2.309325, -0.1347162, 1.881568, 0, 0, 0, 1, 1,
2.315691, 2.024457, 0.7266424, 0, 0, 0, 1, 1,
2.329466, 1.807604, -0.7047324, 0, 0, 0, 1, 1,
2.353779, -0.3778934, 3.002561, 0, 0, 0, 1, 1,
2.413408, -1.156988, 1.293437, 0, 0, 0, 1, 1,
2.493846, -0.347989, 2.347532, 0, 0, 0, 1, 1,
2.517775, -1.453751, 3.384367, 0, 0, 0, 1, 1,
2.551956, -0.07925833, 1.098405, 1, 1, 1, 1, 1,
2.673747, -1.978715, 1.595917, 1, 1, 1, 1, 1,
2.82711, -2.893603, 3.236086, 1, 1, 1, 1, 1,
2.890975, -1.680583, 1.201855, 1, 1, 1, 1, 1,
2.91804, 0.2685255, -0.3205168, 1, 1, 1, 1, 1,
3.027631, 0.1698331, 2.723493, 1, 1, 1, 1, 1,
3.15204, -0.4531341, 1.748934, 1, 1, 1, 1, 1
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
var radius = 9.319479;
var distance = 32.73428;
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
mvMatrix.translate( 0.3260419, 0.05423784, 0.2034404 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73428);
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
