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
-3.010693, 0.6996605, -0.964352, 1, 0, 0, 1,
-2.85903, 0.9399921, -2.592311, 1, 0.007843138, 0, 1,
-2.827097, 0.6787338, -2.387684, 1, 0.01176471, 0, 1,
-2.690484, 0.3029724, -1.081388, 1, 0.01960784, 0, 1,
-2.673792, 0.461264, -1.735041, 1, 0.02352941, 0, 1,
-2.620372, 2.527297, -1.015002, 1, 0.03137255, 0, 1,
-2.585307, 1.598885, -3.442983, 1, 0.03529412, 0, 1,
-2.548714, -0.05501874, -0.8174284, 1, 0.04313726, 0, 1,
-2.52401, 0.6639401, -2.989836, 1, 0.04705882, 0, 1,
-2.469927, -0.9625055, -0.399478, 1, 0.05490196, 0, 1,
-2.40775, 0.4498702, -0.555948, 1, 0.05882353, 0, 1,
-2.337941, 0.0273407, -1.778907, 1, 0.06666667, 0, 1,
-2.327321, 1.012045, -1.595717, 1, 0.07058824, 0, 1,
-2.311019, -1.116959, -2.485197, 1, 0.07843138, 0, 1,
-2.303161, 2.112767, -1.779397, 1, 0.08235294, 0, 1,
-2.285796, 1.27633, -1.387331, 1, 0.09019608, 0, 1,
-2.241226, 1.367027, -0.4820161, 1, 0.09411765, 0, 1,
-2.212954, -0.391005, 0.1285403, 1, 0.1019608, 0, 1,
-2.188596, 0.3277001, -2.792588, 1, 0.1098039, 0, 1,
-2.144676, 0.3714925, -1.035257, 1, 0.1137255, 0, 1,
-2.139067, 0.5443467, -0.7144153, 1, 0.1215686, 0, 1,
-2.13712, 1.246181, -2.460349, 1, 0.1254902, 0, 1,
-2.124234, -1.498429, -1.84531, 1, 0.1333333, 0, 1,
-2.112294, 0.2054534, -2.073268, 1, 0.1372549, 0, 1,
-2.104526, -0.447692, -2.907966, 1, 0.145098, 0, 1,
-2.076241, -1.865144, -1.539525, 1, 0.1490196, 0, 1,
-1.994348, -0.5685587, -1.934904, 1, 0.1568628, 0, 1,
-1.989471, 0.5957084, -0.5448535, 1, 0.1607843, 0, 1,
-1.96553, 1.558173, -0.641948, 1, 0.1686275, 0, 1,
-1.959764, -0.7907995, -1.16777, 1, 0.172549, 0, 1,
-1.95241, -1.28748, -1.56142, 1, 0.1803922, 0, 1,
-1.944397, -1.054992, -1.465616, 1, 0.1843137, 0, 1,
-1.928316, 0.3084206, -2.351436, 1, 0.1921569, 0, 1,
-1.910998, 0.5535982, -3.447546, 1, 0.1960784, 0, 1,
-1.902897, -0.5541513, -2.056886, 1, 0.2039216, 0, 1,
-1.897377, 0.4292689, -0.8510539, 1, 0.2117647, 0, 1,
-1.895504, -1.307309, -2.431713, 1, 0.2156863, 0, 1,
-1.892483, -0.04854268, 0.828827, 1, 0.2235294, 0, 1,
-1.875573, -0.2162998, -0.6904501, 1, 0.227451, 0, 1,
-1.864669, -0.8855664, -1.474077, 1, 0.2352941, 0, 1,
-1.825169, -0.6222046, -3.089306, 1, 0.2392157, 0, 1,
-1.824571, -1.365031, -2.563444, 1, 0.2470588, 0, 1,
-1.819717, -0.7325488, -3.026615, 1, 0.2509804, 0, 1,
-1.811332, -0.2565992, -0.1757784, 1, 0.2588235, 0, 1,
-1.809748, 0.2187528, -1.487691, 1, 0.2627451, 0, 1,
-1.772702, -0.5755418, -2.308796, 1, 0.2705882, 0, 1,
-1.760179, -0.08887114, -2.088593, 1, 0.2745098, 0, 1,
-1.757928, 1.608565, -0.881098, 1, 0.282353, 0, 1,
-1.732224, -0.3991335, -1.01306, 1, 0.2862745, 0, 1,
-1.727926, -1.059746, -1.719972, 1, 0.2941177, 0, 1,
-1.721511, 0.8278056, -0.5286768, 1, 0.3019608, 0, 1,
-1.716866, -0.08784927, -0.3922357, 1, 0.3058824, 0, 1,
-1.708306, -1.352065, -1.715421, 1, 0.3137255, 0, 1,
-1.698657, 1.509114, 0.7407577, 1, 0.3176471, 0, 1,
-1.69652, 3.369642, 0.4876997, 1, 0.3254902, 0, 1,
-1.6922, -1.080377, -1.742415, 1, 0.3294118, 0, 1,
-1.683743, 0.2354084, -2.240836, 1, 0.3372549, 0, 1,
-1.68221, -0.6683161, -2.509053, 1, 0.3411765, 0, 1,
-1.674834, -1.365938, -2.955869, 1, 0.3490196, 0, 1,
-1.671445, 0.2521761, -1.296175, 1, 0.3529412, 0, 1,
-1.650975, -0.2523278, -1.465023, 1, 0.3607843, 0, 1,
-1.650308, -0.6437159, -1.454484, 1, 0.3647059, 0, 1,
-1.649473, -0.4190198, -2.734756, 1, 0.372549, 0, 1,
-1.649186, -1.331602, -2.213097, 1, 0.3764706, 0, 1,
-1.642193, -0.7870301, -0.4457631, 1, 0.3843137, 0, 1,
-1.63362, 0.228786, -2.610055, 1, 0.3882353, 0, 1,
-1.630867, -1.855868, -3.025864, 1, 0.3960784, 0, 1,
-1.617343, -1.072645, -2.804419, 1, 0.4039216, 0, 1,
-1.615271, 0.3048553, -1.634069, 1, 0.4078431, 0, 1,
-1.612722, -1.645474, -3.676044, 1, 0.4156863, 0, 1,
-1.610152, 1.805378, -0.6652064, 1, 0.4196078, 0, 1,
-1.607453, -1.250728, -3.329381, 1, 0.427451, 0, 1,
-1.58251, -1.453997, -0.6902525, 1, 0.4313726, 0, 1,
-1.565059, 1.506057, -0.7675802, 1, 0.4392157, 0, 1,
-1.545146, 1.074263, 0.01706494, 1, 0.4431373, 0, 1,
-1.540429, -0.7877331, -3.684734, 1, 0.4509804, 0, 1,
-1.514154, 0.08194906, -1.685466, 1, 0.454902, 0, 1,
-1.505725, 0.2610756, -0.3101566, 1, 0.4627451, 0, 1,
-1.490159, -0.9800367, -2.11796, 1, 0.4666667, 0, 1,
-1.486084, 1.22399, -1.335847, 1, 0.4745098, 0, 1,
-1.478305, -0.9658648, -1.98546, 1, 0.4784314, 0, 1,
-1.453946, 0.1968473, 0.3907869, 1, 0.4862745, 0, 1,
-1.453881, -0.4777884, -1.05701, 1, 0.4901961, 0, 1,
-1.450467, 0.3738176, -2.227495, 1, 0.4980392, 0, 1,
-1.436904, -0.7739944, -2.757314, 1, 0.5058824, 0, 1,
-1.433563, -0.806739, -1.896298, 1, 0.509804, 0, 1,
-1.424827, -1.157955, -1.735458, 1, 0.5176471, 0, 1,
-1.423112, -0.05740662, -1.924193, 1, 0.5215687, 0, 1,
-1.411777, -0.8825569, -0.6973476, 1, 0.5294118, 0, 1,
-1.408127, -1.067347, -2.434992, 1, 0.5333334, 0, 1,
-1.406105, -0.262615, -1.363188, 1, 0.5411765, 0, 1,
-1.405227, 0.6957018, 0.202587, 1, 0.5450981, 0, 1,
-1.402127, -1.030669, -1.107203, 1, 0.5529412, 0, 1,
-1.391923, 1.979097, -0.081749, 1, 0.5568628, 0, 1,
-1.38406, -1.246975, -1.256641, 1, 0.5647059, 0, 1,
-1.381237, -1.561125, -1.648128, 1, 0.5686275, 0, 1,
-1.380328, 0.792882, -1.379164, 1, 0.5764706, 0, 1,
-1.373999, -1.559614, -3.098668, 1, 0.5803922, 0, 1,
-1.366908, -0.7057939, -1.947131, 1, 0.5882353, 0, 1,
-1.364424, -0.1609034, -2.685817, 1, 0.5921569, 0, 1,
-1.354466, 0.1653769, -1.160358, 1, 0.6, 0, 1,
-1.354074, 0.7205606, -1.594401, 1, 0.6078432, 0, 1,
-1.346243, 1.729461, -1.258349, 1, 0.6117647, 0, 1,
-1.335841, 0.346716, -2.019706, 1, 0.6196079, 0, 1,
-1.328313, -0.2977895, -1.055828, 1, 0.6235294, 0, 1,
-1.326354, -0.9843165, -3.904091, 1, 0.6313726, 0, 1,
-1.309075, 0.09498268, -1.978286, 1, 0.6352941, 0, 1,
-1.300614, -0.3642663, -2.639889, 1, 0.6431373, 0, 1,
-1.297354, 0.2735292, -1.805665, 1, 0.6470588, 0, 1,
-1.294879, 1.781602, -1.956405, 1, 0.654902, 0, 1,
-1.29356, 0.6379097, -0.5482449, 1, 0.6588235, 0, 1,
-1.290129, 0.06224307, -1.087651, 1, 0.6666667, 0, 1,
-1.284739, 1.122238, -2.758348, 1, 0.6705883, 0, 1,
-1.280533, -1.344344, -1.544686, 1, 0.6784314, 0, 1,
-1.280121, -2.133861, -3.897138, 1, 0.682353, 0, 1,
-1.279857, -0.2764594, -1.907599, 1, 0.6901961, 0, 1,
-1.27928, 1.688595, -0.5239777, 1, 0.6941177, 0, 1,
-1.279044, -1.597906, -2.452913, 1, 0.7019608, 0, 1,
-1.278179, 0.03041943, -0.330854, 1, 0.7098039, 0, 1,
-1.275326, -0.5766671, -3.785537, 1, 0.7137255, 0, 1,
-1.271878, -0.9205933, -3.033467, 1, 0.7215686, 0, 1,
-1.267712, 0.1489495, -1.813679, 1, 0.7254902, 0, 1,
-1.263189, -1.263397, -3.511961, 1, 0.7333333, 0, 1,
-1.25678, 1.584946, 1.115373, 1, 0.7372549, 0, 1,
-1.256583, 0.6428909, -1.260993, 1, 0.7450981, 0, 1,
-1.255095, -0.5943401, -1.772663, 1, 0.7490196, 0, 1,
-1.250047, -1.472298, -3.821226, 1, 0.7568628, 0, 1,
-1.245723, -1.897487, -2.407447, 1, 0.7607843, 0, 1,
-1.244881, -1.059775, -2.214238, 1, 0.7686275, 0, 1,
-1.241154, 0.3103713, -1.337397, 1, 0.772549, 0, 1,
-1.240969, 1.133985, -1.219984, 1, 0.7803922, 0, 1,
-1.232819, -0.7927664, -3.891541, 1, 0.7843137, 0, 1,
-1.231448, -2.271014, -2.736252, 1, 0.7921569, 0, 1,
-1.228984, 0.1374274, -1.840748, 1, 0.7960784, 0, 1,
-1.220785, -0.3241652, -2.863152, 1, 0.8039216, 0, 1,
-1.217764, -1.784926, -2.071715, 1, 0.8117647, 0, 1,
-1.215115, 2.027486, -1.881835, 1, 0.8156863, 0, 1,
-1.213134, 0.8005924, -1.418833, 1, 0.8235294, 0, 1,
-1.20647, 1.251539, -1.576763, 1, 0.827451, 0, 1,
-1.197932, -0.9097154, -1.931337, 1, 0.8352941, 0, 1,
-1.194163, 1.022265, -1.966292, 1, 0.8392157, 0, 1,
-1.193904, 0.3703938, -1.958557, 1, 0.8470588, 0, 1,
-1.191412, -0.6518221, -3.921765, 1, 0.8509804, 0, 1,
-1.187659, 1.151271, 0.04099461, 1, 0.8588235, 0, 1,
-1.181271, 0.4872594, -1.290358, 1, 0.8627451, 0, 1,
-1.180356, -1.158089, -3.204701, 1, 0.8705882, 0, 1,
-1.180244, 1.854852, -0.6443923, 1, 0.8745098, 0, 1,
-1.17405, -0.7379776, -3.650056, 1, 0.8823529, 0, 1,
-1.172391, 0.1130222, -1.455125, 1, 0.8862745, 0, 1,
-1.171905, 1.14626, -1.772173, 1, 0.8941177, 0, 1,
-1.161335, -0.3347197, -2.123896, 1, 0.8980392, 0, 1,
-1.160005, -0.4413127, -0.6354515, 1, 0.9058824, 0, 1,
-1.154444, -0.3822326, -0.7465519, 1, 0.9137255, 0, 1,
-1.152889, 1.316293, -0.8557648, 1, 0.9176471, 0, 1,
-1.151026, -0.6985212, -2.531602, 1, 0.9254902, 0, 1,
-1.148459, -0.1159738, -2.110711, 1, 0.9294118, 0, 1,
-1.130249, -0.9586786, -0.5192968, 1, 0.9372549, 0, 1,
-1.130211, 0.06670561, -0.9579809, 1, 0.9411765, 0, 1,
-1.11953, -0.1091934, -0.9756738, 1, 0.9490196, 0, 1,
-1.116851, 0.7060674, 0.7731784, 1, 0.9529412, 0, 1,
-1.109044, -0.2628994, -2.871899, 1, 0.9607843, 0, 1,
-1.085899, -1.0144, -3.299824, 1, 0.9647059, 0, 1,
-1.084342, 0.7795567, -0.7084863, 1, 0.972549, 0, 1,
-1.083793, 0.7025217, -1.454477, 1, 0.9764706, 0, 1,
-1.079638, 1.445653, -3.191923, 1, 0.9843137, 0, 1,
-1.069794, 0.477535, -1.151091, 1, 0.9882353, 0, 1,
-1.068068, -0.7762077, -1.601417, 1, 0.9960784, 0, 1,
-1.067341, -0.7990284, -2.141103, 0.9960784, 1, 0, 1,
-1.054907, -0.4362891, -1.020536, 0.9921569, 1, 0, 1,
-1.053837, 1.102877, -1.514249, 0.9843137, 1, 0, 1,
-1.052019, 0.5529206, -0.5662978, 0.9803922, 1, 0, 1,
-1.026361, 0.5823328, -0.2873651, 0.972549, 1, 0, 1,
-1.025572, -0.02946086, -2.140613, 0.9686275, 1, 0, 1,
-1.020206, 1.1848, 1.488711, 0.9607843, 1, 0, 1,
-1.001635, 0.6166238, -1.598203, 0.9568627, 1, 0, 1,
-0.9976265, 0.9250721, -0.1749813, 0.9490196, 1, 0, 1,
-0.9976088, -1.772544, -3.122065, 0.945098, 1, 0, 1,
-0.991132, -0.3727668, -0.5170295, 0.9372549, 1, 0, 1,
-0.9888489, 0.8780962, -0.2230738, 0.9333333, 1, 0, 1,
-0.9741697, 0.08962821, -1.522796, 0.9254902, 1, 0, 1,
-0.9691728, 0.7120579, -0.655342, 0.9215686, 1, 0, 1,
-0.9664634, -0.1871082, -2.780901, 0.9137255, 1, 0, 1,
-0.9627643, -0.5809414, -2.911124, 0.9098039, 1, 0, 1,
-0.951618, -1.217406, -2.808739, 0.9019608, 1, 0, 1,
-0.9508635, -0.7644058, -2.393794, 0.8941177, 1, 0, 1,
-0.9372026, 0.9693503, 1.435247, 0.8901961, 1, 0, 1,
-0.9328157, -0.1989923, -0.7562642, 0.8823529, 1, 0, 1,
-0.9313728, -0.8548057, -2.759403, 0.8784314, 1, 0, 1,
-0.9231237, -1.060202, -1.234318, 0.8705882, 1, 0, 1,
-0.9191352, -0.5014328, -1.743361, 0.8666667, 1, 0, 1,
-0.9076558, -0.5430394, -4.095223, 0.8588235, 1, 0, 1,
-0.9072653, -0.07601462, -1.962017, 0.854902, 1, 0, 1,
-0.8931721, -1.873079, -5.281624, 0.8470588, 1, 0, 1,
-0.889411, 1.146045, -2.549237, 0.8431373, 1, 0, 1,
-0.8851234, 0.04536278, -1.52014, 0.8352941, 1, 0, 1,
-0.8766924, -0.3758969, -0.8583121, 0.8313726, 1, 0, 1,
-0.8766066, 1.555282, -1.271523, 0.8235294, 1, 0, 1,
-0.8706185, 1.505026, 0.2870638, 0.8196079, 1, 0, 1,
-0.8688977, 1.164582, -0.925777, 0.8117647, 1, 0, 1,
-0.8664503, -1.095048, -1.945988, 0.8078431, 1, 0, 1,
-0.8659414, 0.7568743, -0.7620364, 0.8, 1, 0, 1,
-0.8642149, -0.573522, -3.05289, 0.7921569, 1, 0, 1,
-0.8630276, -1.168128, -2.333442, 0.7882353, 1, 0, 1,
-0.8611749, 0.4037852, -2.755535, 0.7803922, 1, 0, 1,
-0.851164, -1.545235, -3.588568, 0.7764706, 1, 0, 1,
-0.8497694, 0.03063229, -1.886793, 0.7686275, 1, 0, 1,
-0.8472986, -0.9914837, -1.611024, 0.7647059, 1, 0, 1,
-0.8419381, -1.645191, -4.296481, 0.7568628, 1, 0, 1,
-0.8369263, -1.644729, -3.529481, 0.7529412, 1, 0, 1,
-0.8352583, 0.3201633, -1.106696, 0.7450981, 1, 0, 1,
-0.8341925, -1.861184, -4.366043, 0.7411765, 1, 0, 1,
-0.833958, -0.2279511, -0.5855489, 0.7333333, 1, 0, 1,
-0.8285322, 1.334767, -1.229832, 0.7294118, 1, 0, 1,
-0.8158948, -0.3558994, -3.004841, 0.7215686, 1, 0, 1,
-0.8151103, 1.416039, 0.05168477, 0.7176471, 1, 0, 1,
-0.8128356, -1.110926, -2.801081, 0.7098039, 1, 0, 1,
-0.8102205, 0.4013285, -1.313497, 0.7058824, 1, 0, 1,
-0.8097382, 1.504737, -0.8558102, 0.6980392, 1, 0, 1,
-0.7959004, 0.6360689, -0.8134699, 0.6901961, 1, 0, 1,
-0.7921041, 1.775776, 1.138621, 0.6862745, 1, 0, 1,
-0.7878817, -1.140415, -1.704417, 0.6784314, 1, 0, 1,
-0.7841269, -0.6588899, -0.6772718, 0.6745098, 1, 0, 1,
-0.7838729, -0.1508483, -2.534386, 0.6666667, 1, 0, 1,
-0.7835963, -0.5116046, -1.883968, 0.6627451, 1, 0, 1,
-0.7720625, 0.7746235, -0.9166203, 0.654902, 1, 0, 1,
-0.7655638, -0.3569137, -0.9853912, 0.6509804, 1, 0, 1,
-0.7651401, -0.6902179, -3.879713, 0.6431373, 1, 0, 1,
-0.7650505, 0.6921301, -3.1435, 0.6392157, 1, 0, 1,
-0.7629915, -0.6863381, -2.833409, 0.6313726, 1, 0, 1,
-0.7570804, -0.1663855, -1.134966, 0.627451, 1, 0, 1,
-0.7561123, -1.17571, -2.686216, 0.6196079, 1, 0, 1,
-0.7556126, -0.08813093, -3.015183, 0.6156863, 1, 0, 1,
-0.7548004, 0.3304484, 1.943066, 0.6078432, 1, 0, 1,
-0.7503061, -1.202613, -2.080732, 0.6039216, 1, 0, 1,
-0.7454425, 0.5499717, 1.366352, 0.5960785, 1, 0, 1,
-0.7424897, -0.2603178, -2.358797, 0.5882353, 1, 0, 1,
-0.7394795, -0.1825635, -0.9006411, 0.5843138, 1, 0, 1,
-0.7392744, -0.7730379, -3.433564, 0.5764706, 1, 0, 1,
-0.7353963, 0.07074846, -1.280172, 0.572549, 1, 0, 1,
-0.7352693, 1.011442, -1.48402, 0.5647059, 1, 0, 1,
-0.7333125, -1.371034, -3.213791, 0.5607843, 1, 0, 1,
-0.718856, 1.256072, 0.1708376, 0.5529412, 1, 0, 1,
-0.713527, 1.383201, 0.678811, 0.5490196, 1, 0, 1,
-0.7132609, 0.9716854, -1.639845, 0.5411765, 1, 0, 1,
-0.7118053, -0.2182592, -0.6569505, 0.5372549, 1, 0, 1,
-0.711104, 1.364099, -1.619365, 0.5294118, 1, 0, 1,
-0.7068844, 1.139582, -1.207988, 0.5254902, 1, 0, 1,
-0.7018169, -2.145763, -2.702967, 0.5176471, 1, 0, 1,
-0.6997885, 0.8097208, 1.609961, 0.5137255, 1, 0, 1,
-0.6909996, 2.648442, -0.7291181, 0.5058824, 1, 0, 1,
-0.6830839, -1.700171, -2.460734, 0.5019608, 1, 0, 1,
-0.6825966, 0.825318, -0.3950353, 0.4941176, 1, 0, 1,
-0.6818557, 0.3620384, -1.43211, 0.4862745, 1, 0, 1,
-0.6746202, 0.8927993, -0.8528147, 0.4823529, 1, 0, 1,
-0.6745647, -1.813241, -4.048974, 0.4745098, 1, 0, 1,
-0.6691616, -0.1598514, -1.799078, 0.4705882, 1, 0, 1,
-0.6689377, -2.013788, -2.07345, 0.4627451, 1, 0, 1,
-0.6686307, 0.09765084, -0.8605571, 0.4588235, 1, 0, 1,
-0.6673859, -0.7567648, -1.368161, 0.4509804, 1, 0, 1,
-0.6673169, 1.21983, 1.436692, 0.4470588, 1, 0, 1,
-0.6650277, 2.621429, -1.668908, 0.4392157, 1, 0, 1,
-0.6643854, -0.6273019, -2.394351, 0.4352941, 1, 0, 1,
-0.6612089, -2.052412, -4.461245, 0.427451, 1, 0, 1,
-0.6604004, 1.796282, -0.4128252, 0.4235294, 1, 0, 1,
-0.6584759, -1.283726, -2.631667, 0.4156863, 1, 0, 1,
-0.6575154, 0.778028, -1.113359, 0.4117647, 1, 0, 1,
-0.6568203, 0.5242462, 0.01098101, 0.4039216, 1, 0, 1,
-0.6548242, 0.01383682, -0.827713, 0.3960784, 1, 0, 1,
-0.6494381, -0.8804808, -1.616377, 0.3921569, 1, 0, 1,
-0.649388, 0.8438972, -2.129398, 0.3843137, 1, 0, 1,
-0.6486285, 1.932355, -0.6197262, 0.3803922, 1, 0, 1,
-0.6478891, -0.1336574, -3.674614, 0.372549, 1, 0, 1,
-0.6423321, -0.5220662, -2.961667, 0.3686275, 1, 0, 1,
-0.6385661, -0.1233929, -1.870476, 0.3607843, 1, 0, 1,
-0.6377721, -0.1418244, -2.530685, 0.3568628, 1, 0, 1,
-0.6337332, -0.1964152, -0.5041546, 0.3490196, 1, 0, 1,
-0.6328478, -0.465586, -0.8123516, 0.345098, 1, 0, 1,
-0.6303371, 0.3354835, -0.8733269, 0.3372549, 1, 0, 1,
-0.6275873, 0.6845201, -0.5038139, 0.3333333, 1, 0, 1,
-0.6265211, -0.2112119, -2.360943, 0.3254902, 1, 0, 1,
-0.6253443, 1.069263, -1.00804, 0.3215686, 1, 0, 1,
-0.6232113, 1.577965, 1.168089, 0.3137255, 1, 0, 1,
-0.6200975, 0.9239303, 0.4519598, 0.3098039, 1, 0, 1,
-0.6157501, 1.309701, -1.160411, 0.3019608, 1, 0, 1,
-0.6098502, -0.7001431, -0.7876175, 0.2941177, 1, 0, 1,
-0.6066534, 0.7852286, -1.713506, 0.2901961, 1, 0, 1,
-0.6035036, -0.309053, -2.583254, 0.282353, 1, 0, 1,
-0.594192, -0.6630701, -2.943861, 0.2784314, 1, 0, 1,
-0.5878551, 0.1768338, -2.179439, 0.2705882, 1, 0, 1,
-0.5872964, -0.7457318, -2.305825, 0.2666667, 1, 0, 1,
-0.5807431, 0.1801539, -1.14752, 0.2588235, 1, 0, 1,
-0.5723268, 2.086832, -1.263093, 0.254902, 1, 0, 1,
-0.5673544, 0.1815294, -1.97342, 0.2470588, 1, 0, 1,
-0.5652141, -0.3682168, -4.877487, 0.2431373, 1, 0, 1,
-0.5650176, -0.7271277, -2.543646, 0.2352941, 1, 0, 1,
-0.5644161, 0.09252534, -1.546378, 0.2313726, 1, 0, 1,
-0.5623952, 0.2243838, 0.1349115, 0.2235294, 1, 0, 1,
-0.5578501, -0.5689052, -2.475019, 0.2196078, 1, 0, 1,
-0.5560561, -0.24029, -2.380666, 0.2117647, 1, 0, 1,
-0.5557808, 0.02904954, -3.306791, 0.2078431, 1, 0, 1,
-0.5523849, -1.839318, -2.538813, 0.2, 1, 0, 1,
-0.5508972, -0.02646608, -2.727562, 0.1921569, 1, 0, 1,
-0.5484665, -0.3165287, -1.577268, 0.1882353, 1, 0, 1,
-0.5424828, -0.9867647, -2.416533, 0.1803922, 1, 0, 1,
-0.5407263, -0.09757033, -1.450952, 0.1764706, 1, 0, 1,
-0.5378917, 2.879942, 1.372892, 0.1686275, 1, 0, 1,
-0.5332518, -1.172589, -2.991429, 0.1647059, 1, 0, 1,
-0.5293612, 0.6325604, -2.008191, 0.1568628, 1, 0, 1,
-0.5259367, -0.9485013, -2.490013, 0.1529412, 1, 0, 1,
-0.5243431, -0.05478429, -2.314342, 0.145098, 1, 0, 1,
-0.5139354, -0.3784129, -1.635498, 0.1411765, 1, 0, 1,
-0.5121303, 0.2285825, -2.095337, 0.1333333, 1, 0, 1,
-0.5046383, -0.4054471, -3.287389, 0.1294118, 1, 0, 1,
-0.5037384, -0.2036986, -3.090749, 0.1215686, 1, 0, 1,
-0.4950784, -0.08358781, -1.87345, 0.1176471, 1, 0, 1,
-0.4946688, -0.7482433, -4.256744, 0.1098039, 1, 0, 1,
-0.4935436, -0.3921551, -2.296687, 0.1058824, 1, 0, 1,
-0.4879372, -0.9412428, -2.337521, 0.09803922, 1, 0, 1,
-0.4877054, 0.8906692, -0.2447957, 0.09019608, 1, 0, 1,
-0.4830139, -0.1562949, -2.299494, 0.08627451, 1, 0, 1,
-0.4799398, -1.083473, -1.900624, 0.07843138, 1, 0, 1,
-0.472752, -1.770979, -2.857336, 0.07450981, 1, 0, 1,
-0.4723332, -0.7130444, -2.847355, 0.06666667, 1, 0, 1,
-0.4723302, 1.165102, -0.09723904, 0.0627451, 1, 0, 1,
-0.4644747, 0.06889636, -1.617247, 0.05490196, 1, 0, 1,
-0.4631333, 1.407816, 0.6060563, 0.05098039, 1, 0, 1,
-0.4502279, 1.844836, -1.672528, 0.04313726, 1, 0, 1,
-0.4473862, 1.004766, -0.7992504, 0.03921569, 1, 0, 1,
-0.4470884, 0.7070063, -0.09231114, 0.03137255, 1, 0, 1,
-0.4466244, 0.2355868, -1.986757, 0.02745098, 1, 0, 1,
-0.4446641, -0.92585, -3.230335, 0.01960784, 1, 0, 1,
-0.4427018, -0.5749146, -3.627925, 0.01568628, 1, 0, 1,
-0.4383171, -1.182726, -3.652001, 0.007843138, 1, 0, 1,
-0.4355552, -0.2294902, -3.914048, 0.003921569, 1, 0, 1,
-0.4347845, 0.643696, -0.11954, 0, 1, 0.003921569, 1,
-0.4322425, 0.4660419, -3.534887, 0, 1, 0.01176471, 1,
-0.431444, 1.649834, -1.001464, 0, 1, 0.01568628, 1,
-0.4306755, 0.03439191, -2.334749, 0, 1, 0.02352941, 1,
-0.4304136, 0.1631783, -2.906474, 0, 1, 0.02745098, 1,
-0.4262791, -2.206161, -2.037537, 0, 1, 0.03529412, 1,
-0.4160868, 0.6600239, -1.105415, 0, 1, 0.03921569, 1,
-0.4134602, -0.6012978, -3.616866, 0, 1, 0.04705882, 1,
-0.406853, 0.557563, -1.125829, 0, 1, 0.05098039, 1,
-0.4064531, 0.06378359, -2.192588, 0, 1, 0.05882353, 1,
-0.4055672, -1.109367, -4.178645, 0, 1, 0.0627451, 1,
-0.4018471, 0.08044603, -1.344965, 0, 1, 0.07058824, 1,
-0.3976936, -1.504995, -3.249054, 0, 1, 0.07450981, 1,
-0.3935579, 0.2706574, -1.100588, 0, 1, 0.08235294, 1,
-0.3933099, 0.3659894, -2.075397, 0, 1, 0.08627451, 1,
-0.3872015, 0.5102302, -1.476704, 0, 1, 0.09411765, 1,
-0.3867013, 0.01985342, -2.876539, 0, 1, 0.1019608, 1,
-0.380611, -1.459051, -3.637712, 0, 1, 0.1058824, 1,
-0.3787789, 1.472027, -1.27388, 0, 1, 0.1137255, 1,
-0.3737294, -0.7791432, -2.293636, 0, 1, 0.1176471, 1,
-0.3731253, 0.454946, -0.01850678, 0, 1, 0.1254902, 1,
-0.369693, -0.1654131, -2.869735, 0, 1, 0.1294118, 1,
-0.3673852, 0.1809459, -2.021166, 0, 1, 0.1372549, 1,
-0.3556982, 1.768239, -0.114561, 0, 1, 0.1411765, 1,
-0.3496328, 0.1292041, -0.8798907, 0, 1, 0.1490196, 1,
-0.3471915, 1.002364, -2.194679, 0, 1, 0.1529412, 1,
-0.3390886, -1.207941, -1.626904, 0, 1, 0.1607843, 1,
-0.3388174, 0.5965286, 0.5488549, 0, 1, 0.1647059, 1,
-0.3362712, 1.080649, -0.3891833, 0, 1, 0.172549, 1,
-0.3351367, 1.9816, 0.5464372, 0, 1, 0.1764706, 1,
-0.3333778, -0.2871913, -2.745305, 0, 1, 0.1843137, 1,
-0.333357, -1.462929, -3.093409, 0, 1, 0.1882353, 1,
-0.3304483, -1.22275, -2.119005, 0, 1, 0.1960784, 1,
-0.3296421, -0.8388869, -2.0628, 0, 1, 0.2039216, 1,
-0.3217458, 1.783207, 0.1852355, 0, 1, 0.2078431, 1,
-0.3200273, 0.1029022, -0.5301738, 0, 1, 0.2156863, 1,
-0.3171363, -0.5827034, -2.595539, 0, 1, 0.2196078, 1,
-0.3093432, 0.2501767, -0.3354901, 0, 1, 0.227451, 1,
-0.3055476, -2.448069, -1.260834, 0, 1, 0.2313726, 1,
-0.2920102, -0.3099162, -5.16413, 0, 1, 0.2392157, 1,
-0.2886852, -0.4823514, -2.436045, 0, 1, 0.2431373, 1,
-0.28745, 1.090708, 0.1608407, 0, 1, 0.2509804, 1,
-0.2866771, -1.09287, -3.094227, 0, 1, 0.254902, 1,
-0.2850235, -1.554996, -1.603238, 0, 1, 0.2627451, 1,
-0.2840371, 0.5652063, 1.119103, 0, 1, 0.2666667, 1,
-0.2831948, -0.5211928, -2.759917, 0, 1, 0.2745098, 1,
-0.282813, -2.035635, -2.254665, 0, 1, 0.2784314, 1,
-0.280142, 0.9650201, 0.3000881, 0, 1, 0.2862745, 1,
-0.279407, 0.1428208, -0.4981581, 0, 1, 0.2901961, 1,
-0.2739978, 0.4660793, 1.003578, 0, 1, 0.2980392, 1,
-0.2727694, -0.4758345, -1.599409, 0, 1, 0.3058824, 1,
-0.2699286, 2.041517, -2.473053, 0, 1, 0.3098039, 1,
-0.2670438, -0.1873779, -4.418221, 0, 1, 0.3176471, 1,
-0.2640169, -1.415521, -3.258124, 0, 1, 0.3215686, 1,
-0.2621758, -0.8918531, -3.343545, 0, 1, 0.3294118, 1,
-0.2587423, 0.266155, -1.231855, 0, 1, 0.3333333, 1,
-0.2569978, -2.135394, -3.476027, 0, 1, 0.3411765, 1,
-0.2564618, 0.9915912, -0.7478104, 0, 1, 0.345098, 1,
-0.2550383, -1.311171, -2.30303, 0, 1, 0.3529412, 1,
-0.2543153, -1.65193, -4.509154, 0, 1, 0.3568628, 1,
-0.2524161, 0.627773, -0.5892693, 0, 1, 0.3647059, 1,
-0.2501062, 1.780466, -0.8299844, 0, 1, 0.3686275, 1,
-0.2418531, -0.8100954, -3.419343, 0, 1, 0.3764706, 1,
-0.241564, 0.0768273, -1.397253, 0, 1, 0.3803922, 1,
-0.2415504, 0.4554095, 0.8471494, 0, 1, 0.3882353, 1,
-0.2413937, -0.4534118, -3.570444, 0, 1, 0.3921569, 1,
-0.2267062, -0.6319956, -3.40685, 0, 1, 0.4, 1,
-0.2253797, 0.9298003, 0.06881902, 0, 1, 0.4078431, 1,
-0.2196591, 0.8217465, -0.4189557, 0, 1, 0.4117647, 1,
-0.2080417, 0.8453684, -0.8201801, 0, 1, 0.4196078, 1,
-0.2052591, 0.6592101, -0.01379964, 0, 1, 0.4235294, 1,
-0.1972447, -0.04949047, -2.627541, 0, 1, 0.4313726, 1,
-0.1900143, 0.8620703, 2.582749, 0, 1, 0.4352941, 1,
-0.1877429, 0.7465969, 0.5889572, 0, 1, 0.4431373, 1,
-0.1847479, 0.3907761, -1.127771, 0, 1, 0.4470588, 1,
-0.1792987, 0.1103286, 0.1424734, 0, 1, 0.454902, 1,
-0.1778314, 0.1118696, -1.112188, 0, 1, 0.4588235, 1,
-0.1596416, 0.5435866, -0.981574, 0, 1, 0.4666667, 1,
-0.1387308, 0.4114157, -0.857288, 0, 1, 0.4705882, 1,
-0.1376014, -0.4557936, -4.023089, 0, 1, 0.4784314, 1,
-0.1303382, -1.115332, -3.646148, 0, 1, 0.4823529, 1,
-0.1284809, -0.02787972, -2.490386, 0, 1, 0.4901961, 1,
-0.1245533, 0.03956109, -0.9837413, 0, 1, 0.4941176, 1,
-0.1244026, 0.4475327, -0.3539087, 0, 1, 0.5019608, 1,
-0.1222106, -0.8279474, -2.769349, 0, 1, 0.509804, 1,
-0.1191997, 2.402056, -0.6244557, 0, 1, 0.5137255, 1,
-0.112954, -0.9190796, -2.309536, 0, 1, 0.5215687, 1,
-0.109321, -0.1693996, -4.177322, 0, 1, 0.5254902, 1,
-0.107716, -0.8920079, -3.269417, 0, 1, 0.5333334, 1,
-0.1045622, 1.20177, -1.646576, 0, 1, 0.5372549, 1,
-0.1041047, 0.5033361, 0.3796756, 0, 1, 0.5450981, 1,
-0.1032264, -0.3884988, -2.249543, 0, 1, 0.5490196, 1,
-0.1009116, -0.2697332, -3.424844, 0, 1, 0.5568628, 1,
-0.09915242, 0.6384461, 0.5083445, 0, 1, 0.5607843, 1,
-0.09755557, 1.79275, -0.955761, 0, 1, 0.5686275, 1,
-0.09673731, 2.071322, -0.7893456, 0, 1, 0.572549, 1,
-0.09515777, 0.782667, -2.605549, 0, 1, 0.5803922, 1,
-0.08121302, 0.947125, -1.507154, 0, 1, 0.5843138, 1,
-0.07944937, -0.4983886, -1.493767, 0, 1, 0.5921569, 1,
-0.07928514, 0.1111119, 0.1397952, 0, 1, 0.5960785, 1,
-0.07544373, 0.387986, -1.255147, 0, 1, 0.6039216, 1,
-0.07463146, 0.2363877, -0.1142894, 0, 1, 0.6117647, 1,
-0.06812786, -1.811111, -3.999259, 0, 1, 0.6156863, 1,
-0.06684486, 1.354434, 0.1973344, 0, 1, 0.6235294, 1,
-0.06670927, 0.5045822, 1.81319, 0, 1, 0.627451, 1,
-0.06646589, -0.5108514, -4.066455, 0, 1, 0.6352941, 1,
-0.05837868, 0.3468683, -0.766601, 0, 1, 0.6392157, 1,
-0.05701694, 0.7478102, -0.5581156, 0, 1, 0.6470588, 1,
-0.05411025, 0.04627977, -0.9464597, 0, 1, 0.6509804, 1,
-0.05357567, -0.6909579, -4.974367, 0, 1, 0.6588235, 1,
-0.05035525, 0.7330614, 0.7686284, 0, 1, 0.6627451, 1,
-0.04975735, -0.961245, -3.791007, 0, 1, 0.6705883, 1,
-0.04967169, -0.1316383, -4.201235, 0, 1, 0.6745098, 1,
-0.04790827, 1.549548, -0.3561384, 0, 1, 0.682353, 1,
-0.04776379, -0.8229244, -1.969572, 0, 1, 0.6862745, 1,
-0.04415411, 0.6230347, -0.9231203, 0, 1, 0.6941177, 1,
-0.04406824, -2.029143, -4.481783, 0, 1, 0.7019608, 1,
-0.04335106, 0.1845867, -2.095975, 0, 1, 0.7058824, 1,
-0.04207253, -0.6596324, -1.648995, 0, 1, 0.7137255, 1,
-0.03871692, 1.068838, 0.8591614, 0, 1, 0.7176471, 1,
-0.03615433, -0.4292443, -3.722887, 0, 1, 0.7254902, 1,
-0.0344061, 0.09859453, 0.6842774, 0, 1, 0.7294118, 1,
-0.0311341, 1.404905, -0.8092532, 0, 1, 0.7372549, 1,
-0.02987801, 1.834358, -0.316598, 0, 1, 0.7411765, 1,
-0.02614357, 0.5013492, 0.0642195, 0, 1, 0.7490196, 1,
-0.02496321, -0.7933983, -4.730085, 0, 1, 0.7529412, 1,
-0.0245584, -0.6112789, -4.754578, 0, 1, 0.7607843, 1,
-0.02431343, -0.9988977, -4.383712, 0, 1, 0.7647059, 1,
-0.02371291, -2.454648, -2.676232, 0, 1, 0.772549, 1,
-0.02358482, 1.420858, 1.182811, 0, 1, 0.7764706, 1,
-0.02338621, 0.6010202, -0.2990189, 0, 1, 0.7843137, 1,
-0.02062247, -0.4445341, -1.54933, 0, 1, 0.7882353, 1,
-0.01957452, -0.740094, -3.130752, 0, 1, 0.7960784, 1,
-0.0192029, 0.3836009, 0.7617291, 0, 1, 0.8039216, 1,
-0.01797408, -1.536382, -3.497327, 0, 1, 0.8078431, 1,
-0.01763068, 1.621754, -0.4814413, 0, 1, 0.8156863, 1,
-0.01699726, 0.6381176, 0.1073438, 0, 1, 0.8196079, 1,
-0.01084955, -0.3469367, -2.653612, 0, 1, 0.827451, 1,
-0.009209281, -0.690734, -3.670002, 0, 1, 0.8313726, 1,
-0.008990956, 1.320179, 1.024483, 0, 1, 0.8392157, 1,
-0.004701911, -0.07186325, -3.815879, 0, 1, 0.8431373, 1,
-0.001504476, 1.697525, 0.704701, 0, 1, 0.8509804, 1,
-0.0008559503, -1.401467, -3.581264, 0, 1, 0.854902, 1,
0.0009266157, -0.7748845, 3.521451, 0, 1, 0.8627451, 1,
0.006473231, 0.1732624, 0.05204526, 0, 1, 0.8666667, 1,
0.007790946, 0.6036897, 1.104534, 0, 1, 0.8745098, 1,
0.008254351, 0.6028306, -1.318434, 0, 1, 0.8784314, 1,
0.01860765, -1.688307, 4.013904, 0, 1, 0.8862745, 1,
0.02086348, -0.4659149, 2.794824, 0, 1, 0.8901961, 1,
0.02115052, 0.03175071, 2.319267, 0, 1, 0.8980392, 1,
0.02488466, -0.4016868, 3.825376, 0, 1, 0.9058824, 1,
0.03237844, -0.6092557, 1.392829, 0, 1, 0.9098039, 1,
0.03313085, 0.0005438643, 3.595007, 0, 1, 0.9176471, 1,
0.03785018, 0.5092265, -2.443777, 0, 1, 0.9215686, 1,
0.04100116, 0.5082781, 1.107485, 0, 1, 0.9294118, 1,
0.04109428, 2.7343, 0.05134519, 0, 1, 0.9333333, 1,
0.04567787, 1.46927, -1.542491, 0, 1, 0.9411765, 1,
0.04987305, -0.2878393, 3.032664, 0, 1, 0.945098, 1,
0.0501672, 0.9227369, -0.3417853, 0, 1, 0.9529412, 1,
0.05037155, 0.624891, -0.3898972, 0, 1, 0.9568627, 1,
0.05141749, 0.9152742, 0.9553259, 0, 1, 0.9647059, 1,
0.05423923, 1.565225, 0.7362369, 0, 1, 0.9686275, 1,
0.05539772, -0.4353333, 4.181513, 0, 1, 0.9764706, 1,
0.05567293, -1.591568, 5.59481, 0, 1, 0.9803922, 1,
0.05757368, 2.277589, -0.06949113, 0, 1, 0.9882353, 1,
0.06618074, 0.5882971, -0.2699645, 0, 1, 0.9921569, 1,
0.06684302, 1.433936, -2.280788, 0, 1, 1, 1,
0.07181117, 0.7345393, 2.177964, 0, 0.9921569, 1, 1,
0.07245994, -0.8936418, 3.276681, 0, 0.9882353, 1, 1,
0.0728839, -1.051082, 4.340606, 0, 0.9803922, 1, 1,
0.07683298, -0.654976, 3.238538, 0, 0.9764706, 1, 1,
0.08080501, 0.2380584, -1.426161, 0, 0.9686275, 1, 1,
0.0827286, -0.3840477, 2.854679, 0, 0.9647059, 1, 1,
0.08445654, 1.864618, 0.04025302, 0, 0.9568627, 1, 1,
0.08819932, 0.6432275, 2.410159, 0, 0.9529412, 1, 1,
0.08859777, 0.191782, -0.1888775, 0, 0.945098, 1, 1,
0.0914036, -0.3929109, 3.393034, 0, 0.9411765, 1, 1,
0.09405631, -0.1840087, 1.567791, 0, 0.9333333, 1, 1,
0.09933998, 1.117381, 1.008599, 0, 0.9294118, 1, 1,
0.1001159, 0.5166088, 0.7304576, 0, 0.9215686, 1, 1,
0.1043634, 0.02852398, 0.7081749, 0, 0.9176471, 1, 1,
0.1055035, -0.2376172, 3.899749, 0, 0.9098039, 1, 1,
0.1096525, 0.5065482, 0.4203821, 0, 0.9058824, 1, 1,
0.1098249, 1.558685, 0.05294846, 0, 0.8980392, 1, 1,
0.110197, 0.6386405, 2.02296, 0, 0.8901961, 1, 1,
0.1108659, 0.5018236, 0.6226432, 0, 0.8862745, 1, 1,
0.1130172, 0.0790786, 1.486875, 0, 0.8784314, 1, 1,
0.1148379, 1.486612, 0.5877022, 0, 0.8745098, 1, 1,
0.1161887, -0.8798845, 4.452826, 0, 0.8666667, 1, 1,
0.1163059, -0.3860746, 3.389139, 0, 0.8627451, 1, 1,
0.1202759, 0.6975646, -0.001182276, 0, 0.854902, 1, 1,
0.1245748, -0.26746, 2.30734, 0, 0.8509804, 1, 1,
0.1248625, 0.3062226, 1.726654, 0, 0.8431373, 1, 1,
0.1264961, 0.184099, 0.86625, 0, 0.8392157, 1, 1,
0.1332272, 0.0770625, 1.462519, 0, 0.8313726, 1, 1,
0.1399953, -0.3752374, 3.128127, 0, 0.827451, 1, 1,
0.1424656, -0.03612509, 0.4975176, 0, 0.8196079, 1, 1,
0.1428727, -0.01845194, 0.3675955, 0, 0.8156863, 1, 1,
0.1508293, 0.492241, 1.185102, 0, 0.8078431, 1, 1,
0.1599195, 0.7535287, 0.3303688, 0, 0.8039216, 1, 1,
0.1718946, -0.9920537, 1.977256, 0, 0.7960784, 1, 1,
0.1720339, -0.5300392, 1.840585, 0, 0.7882353, 1, 1,
0.1725856, 0.02012624, 1.965274, 0, 0.7843137, 1, 1,
0.1742718, -1.098586, 2.584389, 0, 0.7764706, 1, 1,
0.179828, 0.4534706, 0.1961777, 0, 0.772549, 1, 1,
0.1822328, -0.4768422, 2.876404, 0, 0.7647059, 1, 1,
0.1868232, 0.3479004, -0.2727247, 0, 0.7607843, 1, 1,
0.1885143, 0.6611298, -0.01865408, 0, 0.7529412, 1, 1,
0.1929303, -0.1143401, 1.926751, 0, 0.7490196, 1, 1,
0.1961997, -0.1457276, 3.101387, 0, 0.7411765, 1, 1,
0.1978402, 0.996797, 1.883127, 0, 0.7372549, 1, 1,
0.1992009, 0.2442241, 2.437622, 0, 0.7294118, 1, 1,
0.2015363, 0.4262902, 1.388644, 0, 0.7254902, 1, 1,
0.2024636, 0.4243532, 0.9134046, 0, 0.7176471, 1, 1,
0.2048016, -0.4455797, 0.8162844, 0, 0.7137255, 1, 1,
0.2048298, 0.3713405, -0.2229764, 0, 0.7058824, 1, 1,
0.204954, -0.5256402, 3.060998, 0, 0.6980392, 1, 1,
0.2069433, 0.03725458, 1.154811, 0, 0.6941177, 1, 1,
0.2076159, 0.6756619, -0.06715991, 0, 0.6862745, 1, 1,
0.2117876, 0.6167619, 0.7735988, 0, 0.682353, 1, 1,
0.2136687, -0.4484904, 1.442675, 0, 0.6745098, 1, 1,
0.2143776, 0.4468103, 0.7231974, 0, 0.6705883, 1, 1,
0.2219232, 0.7863931, -1.332958, 0, 0.6627451, 1, 1,
0.2220816, -1.451924, 1.620475, 0, 0.6588235, 1, 1,
0.2265501, 0.8755883, -1.482576, 0, 0.6509804, 1, 1,
0.2268355, 1.337055, -0.2544501, 0, 0.6470588, 1, 1,
0.2268911, 0.2716569, 0.1714727, 0, 0.6392157, 1, 1,
0.2276004, -0.8778036, 2.787743, 0, 0.6352941, 1, 1,
0.228705, 1.048315, -0.2548905, 0, 0.627451, 1, 1,
0.2288036, 1.780324, 0.206479, 0, 0.6235294, 1, 1,
0.2313287, -0.8030952, 1.741928, 0, 0.6156863, 1, 1,
0.2364923, -0.3771739, 2.145576, 0, 0.6117647, 1, 1,
0.2405215, -0.6949302, 2.666203, 0, 0.6039216, 1, 1,
0.2557862, -1.551863, 3.419394, 0, 0.5960785, 1, 1,
0.2570851, 1.141485, 0.8165842, 0, 0.5921569, 1, 1,
0.2610068, -0.2654358, 1.651467, 0, 0.5843138, 1, 1,
0.2622554, 0.4176168, 1.371657, 0, 0.5803922, 1, 1,
0.2643043, 0.5613682, 0.3948777, 0, 0.572549, 1, 1,
0.2658948, 1.143889, 0.5740167, 0, 0.5686275, 1, 1,
0.2665124, 0.2621263, 1.303902, 0, 0.5607843, 1, 1,
0.2669816, -0.371452, 0.8942816, 0, 0.5568628, 1, 1,
0.2738213, -0.223345, 3.662026, 0, 0.5490196, 1, 1,
0.2741043, -0.7643716, 3.897879, 0, 0.5450981, 1, 1,
0.2756618, -1.096701, 2.079109, 0, 0.5372549, 1, 1,
0.2779208, 0.8615676, 0.4080352, 0, 0.5333334, 1, 1,
0.278584, 0.04362539, 2.008453, 0, 0.5254902, 1, 1,
0.279425, -1.451545, 2.39332, 0, 0.5215687, 1, 1,
0.2798776, 0.3845441, 2.0569, 0, 0.5137255, 1, 1,
0.2801628, 0.06236406, 1.01756, 0, 0.509804, 1, 1,
0.2806742, -0.3285805, 2.760978, 0, 0.5019608, 1, 1,
0.2839993, -0.8431111, 1.070482, 0, 0.4941176, 1, 1,
0.2847224, -0.864415, 3.356626, 0, 0.4901961, 1, 1,
0.2907406, -0.8555152, 4.194331, 0, 0.4823529, 1, 1,
0.2930573, -0.4503238, 1.84227, 0, 0.4784314, 1, 1,
0.2986403, -0.6729829, 3.359881, 0, 0.4705882, 1, 1,
0.2999152, 0.8734027, 1.396001, 0, 0.4666667, 1, 1,
0.3017356, -1.266444, 4.708889, 0, 0.4588235, 1, 1,
0.308187, -0.7620951, 1.201668, 0, 0.454902, 1, 1,
0.3082903, 0.574779, 1.297154, 0, 0.4470588, 1, 1,
0.3107804, 0.305915, 0.8625347, 0, 0.4431373, 1, 1,
0.3111747, -0.4980746, 2.530997, 0, 0.4352941, 1, 1,
0.3117128, -0.3551023, 3.74516, 0, 0.4313726, 1, 1,
0.3179393, -0.5294716, 2.606293, 0, 0.4235294, 1, 1,
0.3249861, -0.009838553, 1.367013, 0, 0.4196078, 1, 1,
0.3266949, -0.5915902, 3.01956, 0, 0.4117647, 1, 1,
0.3272808, 0.5025068, -0.4686865, 0, 0.4078431, 1, 1,
0.328166, 0.8731337, 2.076849, 0, 0.4, 1, 1,
0.3293656, 0.9200233, 1.101347, 0, 0.3921569, 1, 1,
0.3293944, -0.4934434, 2.988969, 0, 0.3882353, 1, 1,
0.331041, 0.1886517, 1.09999, 0, 0.3803922, 1, 1,
0.3343133, 1.609951, -0.6082183, 0, 0.3764706, 1, 1,
0.33636, -0.3430672, 2.843296, 0, 0.3686275, 1, 1,
0.3377395, 0.7296243, -0.1174591, 0, 0.3647059, 1, 1,
0.3423809, 1.099604, 0.3019257, 0, 0.3568628, 1, 1,
0.3439668, -1.161407, 2.950994, 0, 0.3529412, 1, 1,
0.3459035, 0.2385623, 1.701467, 0, 0.345098, 1, 1,
0.3468864, 0.5277053, 0.5112026, 0, 0.3411765, 1, 1,
0.3554936, 0.391842, 0.7714171, 0, 0.3333333, 1, 1,
0.358811, -0.006387762, 0.09791792, 0, 0.3294118, 1, 1,
0.3631754, 1.675435, -0.07759244, 0, 0.3215686, 1, 1,
0.3648126, 0.2333938, 0.2234382, 0, 0.3176471, 1, 1,
0.365659, 1.136026, 1.591949, 0, 0.3098039, 1, 1,
0.3667267, 0.6690059, 1.036467, 0, 0.3058824, 1, 1,
0.3680858, 1.21622, -1.394875, 0, 0.2980392, 1, 1,
0.3800814, -1.501296, 2.400448, 0, 0.2901961, 1, 1,
0.3820445, 0.2288362, 0.9260074, 0, 0.2862745, 1, 1,
0.3823117, 0.008979053, 0.2352966, 0, 0.2784314, 1, 1,
0.3841896, -0.6804143, 3.082178, 0, 0.2745098, 1, 1,
0.3851156, 0.2617874, 1.024786, 0, 0.2666667, 1, 1,
0.3870499, 1.795377, 0.5968262, 0, 0.2627451, 1, 1,
0.3946374, 1.617543, 0.0711069, 0, 0.254902, 1, 1,
0.3959975, 1.851935, -0.5259569, 0, 0.2509804, 1, 1,
0.3979011, -0.1965993, 2.048188, 0, 0.2431373, 1, 1,
0.4037466, 0.2353884, 1.876639, 0, 0.2392157, 1, 1,
0.4047697, 0.2820393, 2.849768, 0, 0.2313726, 1, 1,
0.4059308, -1.352275, 3.880293, 0, 0.227451, 1, 1,
0.4080262, 0.1109915, -0.4918655, 0, 0.2196078, 1, 1,
0.4110598, 0.06865561, 1.872513, 0, 0.2156863, 1, 1,
0.4110734, 0.8677758, 2.327172, 0, 0.2078431, 1, 1,
0.4111741, -0.7635034, 2.589512, 0, 0.2039216, 1, 1,
0.4126032, 2.715864, 2.081783, 0, 0.1960784, 1, 1,
0.4127248, 0.896436, 2.855077, 0, 0.1882353, 1, 1,
0.4136189, 0.4770401, 1.106712, 0, 0.1843137, 1, 1,
0.4171552, 0.6605352, -1.932864, 0, 0.1764706, 1, 1,
0.4183811, -1.018834, 2.662232, 0, 0.172549, 1, 1,
0.4254255, 0.5415789, 1.680599, 0, 0.1647059, 1, 1,
0.4297529, 0.01886098, 1.833106, 0, 0.1607843, 1, 1,
0.4314564, -0.2091216, 2.366001, 0, 0.1529412, 1, 1,
0.4375352, 0.7039874, 0.8429754, 0, 0.1490196, 1, 1,
0.4422367, -1.134618, 2.798681, 0, 0.1411765, 1, 1,
0.4466394, -0.5954809, 2.336963, 0, 0.1372549, 1, 1,
0.4473889, -1.68731, 3.839078, 0, 0.1294118, 1, 1,
0.4525045, 1.190876, 0.9664952, 0, 0.1254902, 1, 1,
0.4559814, -1.072176, 1.998663, 0, 0.1176471, 1, 1,
0.4648782, 2.037493, 1.024858, 0, 0.1137255, 1, 1,
0.4649761, 0.3122208, 0.1432858, 0, 0.1058824, 1, 1,
0.4656933, 0.6327963, 0.9437865, 0, 0.09803922, 1, 1,
0.4677855, -1.015726, 2.834433, 0, 0.09411765, 1, 1,
0.4700755, 2.166422, -0.5234554, 0, 0.08627451, 1, 1,
0.4718741, -0.1332277, 0.7377673, 0, 0.08235294, 1, 1,
0.4758648, 0.3200058, -0.2154673, 0, 0.07450981, 1, 1,
0.4774066, 0.4558038, 0.5376307, 0, 0.07058824, 1, 1,
0.4785376, 1.386127, 0.09760402, 0, 0.0627451, 1, 1,
0.4800856, -0.6359098, 1.246777, 0, 0.05882353, 1, 1,
0.4827332, -0.5955867, 2.212234, 0, 0.05098039, 1, 1,
0.4832021, 0.5500488, 0.7735608, 0, 0.04705882, 1, 1,
0.4889956, -0.4255041, 3.005457, 0, 0.03921569, 1, 1,
0.4891397, -0.9382231, 2.620887, 0, 0.03529412, 1, 1,
0.4939652, -0.3608316, 1.703212, 0, 0.02745098, 1, 1,
0.498601, -2.091683, 1.115791, 0, 0.02352941, 1, 1,
0.4996586, 0.1565477, 0.5045961, 0, 0.01568628, 1, 1,
0.5038922, -0.3045615, 3.232287, 0, 0.01176471, 1, 1,
0.5056907, -1.312599, 3.556222, 0, 0.003921569, 1, 1,
0.5061544, 0.2154353, 1.10302, 0.003921569, 0, 1, 1,
0.5062711, 1.275017, -0.1660662, 0.007843138, 0, 1, 1,
0.5069115, 0.6050844, 0.6031557, 0.01568628, 0, 1, 1,
0.5120068, -1.155471, 3.168684, 0.01960784, 0, 1, 1,
0.5142882, 0.01012027, 2.013692, 0.02745098, 0, 1, 1,
0.5144258, 0.2486813, 2.800553, 0.03137255, 0, 1, 1,
0.5163206, -0.3366847, 1.574023, 0.03921569, 0, 1, 1,
0.5205985, -0.850639, 1.469235, 0.04313726, 0, 1, 1,
0.5220837, 0.4504101, 0.6811948, 0.05098039, 0, 1, 1,
0.5228999, 0.2119793, 0.9418854, 0.05490196, 0, 1, 1,
0.5338538, 1.258722, 1.181835, 0.0627451, 0, 1, 1,
0.5383883, 1.465928, 0.6837128, 0.06666667, 0, 1, 1,
0.5390869, 1.345279, -0.4808756, 0.07450981, 0, 1, 1,
0.5446822, -0.3963401, 2.572441, 0.07843138, 0, 1, 1,
0.5451629, -1.886728, 3.027995, 0.08627451, 0, 1, 1,
0.5507115, 2.442084, 0.1118503, 0.09019608, 0, 1, 1,
0.5508507, 2.234311, 0.5298531, 0.09803922, 0, 1, 1,
0.5513381, -1.062784, 2.510458, 0.1058824, 0, 1, 1,
0.5515308, 0.9419501, 0.5527393, 0.1098039, 0, 1, 1,
0.5556197, 0.3689679, 1.828979, 0.1176471, 0, 1, 1,
0.5564161, 0.8116059, 1.219722, 0.1215686, 0, 1, 1,
0.5610833, -1.463503, 2.372922, 0.1294118, 0, 1, 1,
0.5742025, -2.434828, 3.584223, 0.1333333, 0, 1, 1,
0.5786152, -0.3058279, 2.596509, 0.1411765, 0, 1, 1,
0.5812429, -0.02920527, 1.475226, 0.145098, 0, 1, 1,
0.5839157, 0.07951736, 2.902996, 0.1529412, 0, 1, 1,
0.5867738, -0.7407936, 2.34772, 0.1568628, 0, 1, 1,
0.5907298, 0.6548909, 0.2322015, 0.1647059, 0, 1, 1,
0.5917281, 0.6798855, 0.9972888, 0.1686275, 0, 1, 1,
0.6046313, 0.8385423, 2.250333, 0.1764706, 0, 1, 1,
0.6120411, -0.8260803, 2.165183, 0.1803922, 0, 1, 1,
0.6146875, 0.5382063, 1.179726, 0.1882353, 0, 1, 1,
0.6151099, -0.3846817, 1.618572, 0.1921569, 0, 1, 1,
0.6179411, 1.00035, 0.7489884, 0.2, 0, 1, 1,
0.6183271, 0.03580227, 3.379427, 0.2078431, 0, 1, 1,
0.6203995, -1.073538, 4.568624, 0.2117647, 0, 1, 1,
0.6226432, -1.140581, 3.700381, 0.2196078, 0, 1, 1,
0.6234742, -0.4959579, 3.43809, 0.2235294, 0, 1, 1,
0.6242859, 1.660716, -1.553594, 0.2313726, 0, 1, 1,
0.6285875, 0.1403009, 1.338539, 0.2352941, 0, 1, 1,
0.6288014, -2.312172, 2.200728, 0.2431373, 0, 1, 1,
0.6288418, 0.3247173, 0.6778819, 0.2470588, 0, 1, 1,
0.6292796, -0.2015089, 2.096716, 0.254902, 0, 1, 1,
0.6293537, 1.12587, -0.4473069, 0.2588235, 0, 1, 1,
0.62967, 1.098758, 0.9497299, 0.2666667, 0, 1, 1,
0.6320055, 0.4262927, -0.009389556, 0.2705882, 0, 1, 1,
0.634567, -0.8329393, 3.553595, 0.2784314, 0, 1, 1,
0.6385936, -1.025266, 3.521405, 0.282353, 0, 1, 1,
0.6403577, 0.6098334, -0.08759023, 0.2901961, 0, 1, 1,
0.6451214, 0.9852413, 1.359216, 0.2941177, 0, 1, 1,
0.6473593, 0.2061267, 1.358641, 0.3019608, 0, 1, 1,
0.6517109, -0.9901456, 1.762182, 0.3098039, 0, 1, 1,
0.6526942, 0.1673235, 2.160197, 0.3137255, 0, 1, 1,
0.6527485, -0.2416088, 1.964224, 0.3215686, 0, 1, 1,
0.654426, -1.49582, 3.269483, 0.3254902, 0, 1, 1,
0.654786, -0.06785072, 2.778919, 0.3333333, 0, 1, 1,
0.6565153, 0.4485202, 1.590577, 0.3372549, 0, 1, 1,
0.6607097, -0.3075381, -0.9468684, 0.345098, 0, 1, 1,
0.6618128, -0.03256259, 2.123459, 0.3490196, 0, 1, 1,
0.6642801, 1.33737, -0.1438195, 0.3568628, 0, 1, 1,
0.6650658, -0.03867961, 2.979452, 0.3607843, 0, 1, 1,
0.6654921, -0.416218, 3.486078, 0.3686275, 0, 1, 1,
0.6704463, -0.5023025, 3.41839, 0.372549, 0, 1, 1,
0.6709372, -0.2798788, 0.8217773, 0.3803922, 0, 1, 1,
0.6735544, -0.06560013, 1.355955, 0.3843137, 0, 1, 1,
0.6760485, 0.3768669, 0.7534586, 0.3921569, 0, 1, 1,
0.6796944, 1.218355, -0.2120957, 0.3960784, 0, 1, 1,
0.6811609, 1.02331, -0.5650396, 0.4039216, 0, 1, 1,
0.6941049, 1.630468, -0.240406, 0.4117647, 0, 1, 1,
0.7006437, 1.305317, 0.5007786, 0.4156863, 0, 1, 1,
0.7025037, 0.1355192, 1.835872, 0.4235294, 0, 1, 1,
0.7034646, 0.7112564, 2.384154, 0.427451, 0, 1, 1,
0.7068595, -0.6523199, 2.893757, 0.4352941, 0, 1, 1,
0.7071996, 1.764275, 0.253564, 0.4392157, 0, 1, 1,
0.7112977, -0.1812574, 1.386552, 0.4470588, 0, 1, 1,
0.712751, 2.502723, -0.6956092, 0.4509804, 0, 1, 1,
0.71601, 0.8776141, -0.8574576, 0.4588235, 0, 1, 1,
0.7186021, 0.256848, 1.288097, 0.4627451, 0, 1, 1,
0.7242087, 0.6083799, 0.3604918, 0.4705882, 0, 1, 1,
0.7286674, -0.6643956, 2.512642, 0.4745098, 0, 1, 1,
0.7292978, 1.504603, 0.2672015, 0.4823529, 0, 1, 1,
0.7303031, -0.2684493, 0.7344819, 0.4862745, 0, 1, 1,
0.7305162, -2.43122, 3.489396, 0.4941176, 0, 1, 1,
0.7329214, -0.8414052, 1.362305, 0.5019608, 0, 1, 1,
0.7340623, -2.281483, 3.387602, 0.5058824, 0, 1, 1,
0.7349771, -1.419528, 2.883412, 0.5137255, 0, 1, 1,
0.7350537, 0.7401443, -0.4120644, 0.5176471, 0, 1, 1,
0.7356922, -0.8701178, 2.636694, 0.5254902, 0, 1, 1,
0.7427072, -0.4079191, 1.282247, 0.5294118, 0, 1, 1,
0.7456123, 2.588109, 0.1544918, 0.5372549, 0, 1, 1,
0.7477866, -0.04234056, 1.979959, 0.5411765, 0, 1, 1,
0.7479244, 0.6289987, 0.271808, 0.5490196, 0, 1, 1,
0.7504376, -0.1497031, 2.205616, 0.5529412, 0, 1, 1,
0.7510158, 1.995378, -0.4190799, 0.5607843, 0, 1, 1,
0.7511601, -0.33412, 2.602729, 0.5647059, 0, 1, 1,
0.7551326, -0.5694359, 1.022812, 0.572549, 0, 1, 1,
0.7551684, 0.4501277, 0.003427131, 0.5764706, 0, 1, 1,
0.756478, -0.01796837, 2.041045, 0.5843138, 0, 1, 1,
0.7661062, 1.003568, 1.559403, 0.5882353, 0, 1, 1,
0.767213, -0.4100303, 2.439629, 0.5960785, 0, 1, 1,
0.7682713, -0.7390392, 2.334641, 0.6039216, 0, 1, 1,
0.7684996, 0.1548441, 0.5285516, 0.6078432, 0, 1, 1,
0.7737252, -0.3445285, 2.330611, 0.6156863, 0, 1, 1,
0.7748232, 1.635056, 0.7216691, 0.6196079, 0, 1, 1,
0.7806273, -1.034339, 2.688473, 0.627451, 0, 1, 1,
0.781378, 1.493933, 2.576195, 0.6313726, 0, 1, 1,
0.7877589, -0.043563, 1.714805, 0.6392157, 0, 1, 1,
0.7883995, 0.2000324, 2.467541, 0.6431373, 0, 1, 1,
0.7906888, 0.2056187, 1.079219, 0.6509804, 0, 1, 1,
0.7918875, 1.420935, 1.063493, 0.654902, 0, 1, 1,
0.7964824, 0.3727742, 1.942553, 0.6627451, 0, 1, 1,
0.7994221, 0.3980715, 1.076888, 0.6666667, 0, 1, 1,
0.8018997, -0.330541, 0.1797554, 0.6745098, 0, 1, 1,
0.8111416, 0.6742983, -1.641728, 0.6784314, 0, 1, 1,
0.8171497, 2.158549, -0.5348482, 0.6862745, 0, 1, 1,
0.8208326, 0.2307444, 2.033879, 0.6901961, 0, 1, 1,
0.82133, -0.2301831, 2.151955, 0.6980392, 0, 1, 1,
0.826037, -0.6865484, 4.542523, 0.7058824, 0, 1, 1,
0.8262965, -0.660459, 1.56091, 0.7098039, 0, 1, 1,
0.8323929, -0.8639851, 2.648699, 0.7176471, 0, 1, 1,
0.8337364, -1.745977, 0.3144775, 0.7215686, 0, 1, 1,
0.840874, -0.1765504, 2.59321, 0.7294118, 0, 1, 1,
0.8415146, -0.4070058, 1.216458, 0.7333333, 0, 1, 1,
0.8429871, -0.06076848, 1.175558, 0.7411765, 0, 1, 1,
0.8458139, -0.2380542, 0.5008634, 0.7450981, 0, 1, 1,
0.8514076, -0.9174671, 3.387353, 0.7529412, 0, 1, 1,
0.8542548, 0.4077822, 2.075802, 0.7568628, 0, 1, 1,
0.855577, 1.084978, 0.868312, 0.7647059, 0, 1, 1,
0.8588744, -1.365444, 0.6763645, 0.7686275, 0, 1, 1,
0.8596632, 0.3304232, 0.3585257, 0.7764706, 0, 1, 1,
0.8645539, -1.102829, 3.053618, 0.7803922, 0, 1, 1,
0.8659507, 1.998616, 0.1010702, 0.7882353, 0, 1, 1,
0.8689738, -1.385281, 3.39364, 0.7921569, 0, 1, 1,
0.8800249, -0.2139624, 2.878678, 0.8, 0, 1, 1,
0.8819863, 2.38044, -0.6380835, 0.8078431, 0, 1, 1,
0.8859392, 0.4833953, 1.16488, 0.8117647, 0, 1, 1,
0.8874699, 0.9231616, 0.06489504, 0.8196079, 0, 1, 1,
0.8888702, -0.7051347, 0.5562782, 0.8235294, 0, 1, 1,
0.8903322, -1.767565, 0.7851639, 0.8313726, 0, 1, 1,
0.8903468, -1.007212, 2.569685, 0.8352941, 0, 1, 1,
0.8918459, -0.9892107, 0.1962985, 0.8431373, 0, 1, 1,
0.8992561, 0.1696745, 0.6199539, 0.8470588, 0, 1, 1,
0.8992701, 0.9297472, 1.010947, 0.854902, 0, 1, 1,
0.903537, 0.6090695, 3.006221, 0.8588235, 0, 1, 1,
0.9036037, -0.4033378, 0.7868134, 0.8666667, 0, 1, 1,
0.9185674, 0.2303308, 1.732069, 0.8705882, 0, 1, 1,
0.9211124, -1.715755, 1.788018, 0.8784314, 0, 1, 1,
0.9214946, 0.07885781, 0.8269686, 0.8823529, 0, 1, 1,
0.9255652, -1.582208, 3.170538, 0.8901961, 0, 1, 1,
0.9277714, 2.027037, -0.2346633, 0.8941177, 0, 1, 1,
0.9350382, 0.3123827, 1.865008, 0.9019608, 0, 1, 1,
0.942768, 2.128587, 1.048622, 0.9098039, 0, 1, 1,
0.9452878, -0.597711, 2.900537, 0.9137255, 0, 1, 1,
0.948631, -0.4960486, 2.724733, 0.9215686, 0, 1, 1,
0.948784, -0.6869541, 0.4353464, 0.9254902, 0, 1, 1,
0.9515621, -0.6715558, 2.122821, 0.9333333, 0, 1, 1,
0.9524668, -1.092788, 4.147925, 0.9372549, 0, 1, 1,
0.9556724, -1.055692, 4.143731, 0.945098, 0, 1, 1,
0.9573885, -0.09418227, 1.536375, 0.9490196, 0, 1, 1,
0.9577913, -1.676158, 2.923428, 0.9568627, 0, 1, 1,
0.9627931, 1.549224, 1.186969, 0.9607843, 0, 1, 1,
0.9691693, -0.5385454, 0.6764862, 0.9686275, 0, 1, 1,
0.9708592, 1.383091, -0.400256, 0.972549, 0, 1, 1,
0.9717777, -0.4125704, 1.915262, 0.9803922, 0, 1, 1,
0.9721556, -0.2749425, 1.503561, 0.9843137, 0, 1, 1,
0.9730977, -0.08899091, 1.127074, 0.9921569, 0, 1, 1,
0.9740657, -0.4985636, 2.408338, 0.9960784, 0, 1, 1,
0.9746619, -2.524726, 4.373432, 1, 0, 0.9960784, 1,
0.9762903, 1.471917, 1.483692, 1, 0, 0.9882353, 1,
0.9764435, 0.6533293, 0.8031297, 1, 0, 0.9843137, 1,
0.9802648, -1.151234, 1.255615, 1, 0, 0.9764706, 1,
0.9913393, 0.8313695, -2.236276, 1, 0, 0.972549, 1,
0.9956494, -0.7595423, 2.697792, 1, 0, 0.9647059, 1,
0.9985989, 1.438042, 0.05686926, 1, 0, 0.9607843, 1,
1.015493, -0.9473267, 2.911317, 1, 0, 0.9529412, 1,
1.022812, -1.11417, 3.439219, 1, 0, 0.9490196, 1,
1.027376, 0.7409085, 1.15459, 1, 0, 0.9411765, 1,
1.028458, -0.8587507, 3.842837, 1, 0, 0.9372549, 1,
1.030314, 0.3574714, 1.550773, 1, 0, 0.9294118, 1,
1.034194, -0.9759953, 2.477856, 1, 0, 0.9254902, 1,
1.035965, 0.5496012, 1.757165, 1, 0, 0.9176471, 1,
1.038354, -0.9917085, 2.380812, 1, 0, 0.9137255, 1,
1.040317, 0.7199754, 1.726523, 1, 0, 0.9058824, 1,
1.042874, 0.4174246, 1.973442, 1, 0, 0.9019608, 1,
1.045207, 0.2174068, -0.7090896, 1, 0, 0.8941177, 1,
1.046567, -0.857398, 3.522555, 1, 0, 0.8862745, 1,
1.051683, -1.232051, 3.084331, 1, 0, 0.8823529, 1,
1.056316, 0.6210175, 0.8330129, 1, 0, 0.8745098, 1,
1.058346, -0.005190518, 1.668418, 1, 0, 0.8705882, 1,
1.058579, -0.4860814, 1.641429, 1, 0, 0.8627451, 1,
1.064904, -1.004371, 5.182908, 1, 0, 0.8588235, 1,
1.065406, 2.342322, 0.8845783, 1, 0, 0.8509804, 1,
1.076292, 1.880736, 2.268492, 1, 0, 0.8470588, 1,
1.078926, 0.40222, 1.040527, 1, 0, 0.8392157, 1,
1.084381, 0.1194507, 3.025932, 1, 0, 0.8352941, 1,
1.084477, 1.271219, 2.093557, 1, 0, 0.827451, 1,
1.088129, 0.4942096, 0.1281369, 1, 0, 0.8235294, 1,
1.091133, -1.541442, 2.87788, 1, 0, 0.8156863, 1,
1.091721, -0.6330261, 1.887612, 1, 0, 0.8117647, 1,
1.1038, -0.6178849, 1.224907, 1, 0, 0.8039216, 1,
1.108867, -0.9349898, 1.485709, 1, 0, 0.7960784, 1,
1.112565, -0.5750272, 2.814482, 1, 0, 0.7921569, 1,
1.113144, -0.1214009, 1.506386, 1, 0, 0.7843137, 1,
1.122568, 1.001811, 0.2358906, 1, 0, 0.7803922, 1,
1.131471, 0.5137252, 2.819724, 1, 0, 0.772549, 1,
1.147119, 1.056585, -0.4250282, 1, 0, 0.7686275, 1,
1.16457, 0.2638627, 0.3479871, 1, 0, 0.7607843, 1,
1.168662, -0.8297437, 3.075003, 1, 0, 0.7568628, 1,
1.183343, 0.2021478, 2.312101, 1, 0, 0.7490196, 1,
1.186438, -0.3955622, 4.301047, 1, 0, 0.7450981, 1,
1.208805, 0.99107, -0.9585787, 1, 0, 0.7372549, 1,
1.208847, -0.340042, 2.220568, 1, 0, 0.7333333, 1,
1.211545, 0.444438, 0.9846358, 1, 0, 0.7254902, 1,
1.213138, -0.08688109, 0.00169616, 1, 0, 0.7215686, 1,
1.22138, -0.639744, 1.671573, 1, 0, 0.7137255, 1,
1.226349, -0.07876431, 2.321099, 1, 0, 0.7098039, 1,
1.228211, 0.7874469, 1.279289, 1, 0, 0.7019608, 1,
1.237605, -0.3961376, 1.871667, 1, 0, 0.6941177, 1,
1.256261, 0.2526103, 0.8100801, 1, 0, 0.6901961, 1,
1.257424, 1.246911, 0.9263777, 1, 0, 0.682353, 1,
1.260146, 0.465873, 1.394085, 1, 0, 0.6784314, 1,
1.265507, 1.116486, 1.661287, 1, 0, 0.6705883, 1,
1.271673, -1.112079, 1.559349, 1, 0, 0.6666667, 1,
1.273061, 0.5097017, 1.048835, 1, 0, 0.6588235, 1,
1.276058, -0.3659791, 2.864345, 1, 0, 0.654902, 1,
1.282469, 0.67723, 1.085837, 1, 0, 0.6470588, 1,
1.299522, 0.09988301, 1.585179, 1, 0, 0.6431373, 1,
1.300802, 0.1418635, 0.6922587, 1, 0, 0.6352941, 1,
1.30172, -0.2968681, 2.269575, 1, 0, 0.6313726, 1,
1.306248, -0.1279334, 0.9994342, 1, 0, 0.6235294, 1,
1.308987, 0.2355763, -0.2604739, 1, 0, 0.6196079, 1,
1.313961, -0.841562, 3.236375, 1, 0, 0.6117647, 1,
1.31933, 0.01424566, 0.6358817, 1, 0, 0.6078432, 1,
1.322511, 2.543846, 0.9668394, 1, 0, 0.6, 1,
1.330284, 1.560157, 1.409343, 1, 0, 0.5921569, 1,
1.333399, -1.141307, 3.416519, 1, 0, 0.5882353, 1,
1.33451, -0.8718094, 1.696084, 1, 0, 0.5803922, 1,
1.341313, -2.163246, 2.468251, 1, 0, 0.5764706, 1,
1.347588, -2.153108, 2.550094, 1, 0, 0.5686275, 1,
1.352999, -1.167874, 1.926946, 1, 0, 0.5647059, 1,
1.372978, 0.4540722, 3.118761, 1, 0, 0.5568628, 1,
1.376327, -1.035235, 0.4941809, 1, 0, 0.5529412, 1,
1.381787, -0.7426246, 2.481691, 1, 0, 0.5450981, 1,
1.384998, 0.3382286, 2.510048, 1, 0, 0.5411765, 1,
1.387072, -0.002229731, 1.54284, 1, 0, 0.5333334, 1,
1.412147, -0.4389148, 1.568722, 1, 0, 0.5294118, 1,
1.421202, 0.5907863, 1.996454, 1, 0, 0.5215687, 1,
1.426032, -0.8573109, 0.3310227, 1, 0, 0.5176471, 1,
1.428269, 0.449347, 2.065266, 1, 0, 0.509804, 1,
1.429886, -0.3827525, 3.525258, 1, 0, 0.5058824, 1,
1.430171, -0.4059091, 2.784532, 1, 0, 0.4980392, 1,
1.439042, -0.1512379, 2.420285, 1, 0, 0.4901961, 1,
1.451426, -0.3630044, 1.141169, 1, 0, 0.4862745, 1,
1.459388, -0.166408, 2.604825, 1, 0, 0.4784314, 1,
1.460266, 0.427274, 0.7047797, 1, 0, 0.4745098, 1,
1.46201, 0.02554949, 3.305178, 1, 0, 0.4666667, 1,
1.467435, -1.107889, 1.270609, 1, 0, 0.4627451, 1,
1.482856, -1.69361, 3.386974, 1, 0, 0.454902, 1,
1.483321, -0.2216578, 1.775003, 1, 0, 0.4509804, 1,
1.485574, -0.6111166, 1.764644, 1, 0, 0.4431373, 1,
1.486627, -0.7435274, 2.099459, 1, 0, 0.4392157, 1,
1.517915, 1.073693, -0.5942378, 1, 0, 0.4313726, 1,
1.521066, 0.1731327, 1.891939, 1, 0, 0.427451, 1,
1.527826, 0.6308799, -0.06584738, 1, 0, 0.4196078, 1,
1.532839, 0.875083, 0.5308176, 1, 0, 0.4156863, 1,
1.534486, 0.5254174, 1.61447, 1, 0, 0.4078431, 1,
1.534882, -2.477289, 2.965277, 1, 0, 0.4039216, 1,
1.584777, -0.7295216, 0.4138195, 1, 0, 0.3960784, 1,
1.594563, 0.1919761, 1.100531, 1, 0, 0.3882353, 1,
1.60074, 0.5507602, 1.950865, 1, 0, 0.3843137, 1,
1.605747, 1.439375, 1.510568, 1, 0, 0.3764706, 1,
1.612118, 0.2588288, 2.784552, 1, 0, 0.372549, 1,
1.613526, -1.097911, 3.198969, 1, 0, 0.3647059, 1,
1.61531, 0.597506, 1.451642, 1, 0, 0.3607843, 1,
1.630887, 0.209535, 1.316347, 1, 0, 0.3529412, 1,
1.641335, -1.061387, 1.982899, 1, 0, 0.3490196, 1,
1.649505, 1.032529, 1.952705, 1, 0, 0.3411765, 1,
1.649582, 0.9171612, 0.9879361, 1, 0, 0.3372549, 1,
1.65943, 1.833898, 0.4279441, 1, 0, 0.3294118, 1,
1.675075, -1.422076, 1.899963, 1, 0, 0.3254902, 1,
1.681396, -1.582694, 1.178738, 1, 0, 0.3176471, 1,
1.681637, 1.378297, 2.415173, 1, 0, 0.3137255, 1,
1.68279, 1.375662, 3.442621, 1, 0, 0.3058824, 1,
1.716427, 0.2186696, 2.202396, 1, 0, 0.2980392, 1,
1.72363, -0.6432478, 3.40303, 1, 0, 0.2941177, 1,
1.727367, 0.108468, 0.9251614, 1, 0, 0.2862745, 1,
1.738785, 0.04010111, 2.573899, 1, 0, 0.282353, 1,
1.745129, 0.3468191, 1.387931, 1, 0, 0.2745098, 1,
1.764275, 0.1670416, 0.7301144, 1, 0, 0.2705882, 1,
1.764995, -0.3719195, 3.602402, 1, 0, 0.2627451, 1,
1.772899, -0.03160134, 2.967371, 1, 0, 0.2588235, 1,
1.781099, -0.1569636, 3.586512, 1, 0, 0.2509804, 1,
1.785113, 0.5843624, 1.107633, 1, 0, 0.2470588, 1,
1.785973, -0.9325078, 1.523819, 1, 0, 0.2392157, 1,
1.802125, -1.460696, 2.416367, 1, 0, 0.2352941, 1,
1.818445, 1.577831, -1.068614, 1, 0, 0.227451, 1,
1.853297, -1.390138, 3.481448, 1, 0, 0.2235294, 1,
1.855252, -0.2279, 2.726425, 1, 0, 0.2156863, 1,
1.865255, -1.090439, 1.704491, 1, 0, 0.2117647, 1,
1.882999, -0.3583778, 0.8230628, 1, 0, 0.2039216, 1,
1.885704, -0.05232129, 1.408246, 1, 0, 0.1960784, 1,
1.905282, 0.4074886, -0.8130777, 1, 0, 0.1921569, 1,
1.911379, 1.363506, 0.7570593, 1, 0, 0.1843137, 1,
1.949863, -0.08550391, 3.226135, 1, 0, 0.1803922, 1,
1.950873, -1.047398, 2.122831, 1, 0, 0.172549, 1,
1.982335, 0.1128049, 2.828356, 1, 0, 0.1686275, 1,
1.98691, 1.102216, 1.055177, 1, 0, 0.1607843, 1,
2.029753, -0.09577665, 1.838874, 1, 0, 0.1568628, 1,
2.05062, 0.1656572, 2.208601, 1, 0, 0.1490196, 1,
2.052264, -0.775642, 1.049439, 1, 0, 0.145098, 1,
2.069322, 0.5001951, 1.418955, 1, 0, 0.1372549, 1,
2.079997, -0.7464797, 0.8769429, 1, 0, 0.1333333, 1,
2.096509, -0.4165689, 1.847452, 1, 0, 0.1254902, 1,
2.103957, 0.07354531, 2.737433, 1, 0, 0.1215686, 1,
2.129794, 1.898303, -0.5871283, 1, 0, 0.1137255, 1,
2.229194, -1.527758, 1.699775, 1, 0, 0.1098039, 1,
2.238852, -1.932781, 2.878329, 1, 0, 0.1019608, 1,
2.247095, -0.3843811, 4.676056, 1, 0, 0.09411765, 1,
2.270647, 0.1710006, 2.396323, 1, 0, 0.09019608, 1,
2.271531, -0.1819846, 1.752058, 1, 0, 0.08235294, 1,
2.319841, 0.91649, 0.7514632, 1, 0, 0.07843138, 1,
2.338904, -0.3686458, 1.873248, 1, 0, 0.07058824, 1,
2.359222, -1.09921, 2.581284, 1, 0, 0.06666667, 1,
2.373516, -0.506462, 0.9936339, 1, 0, 0.05882353, 1,
2.475883, -2.39476, 2.845404, 1, 0, 0.05490196, 1,
2.48219, -1.835652, 1.345737, 1, 0, 0.04705882, 1,
2.601385, -0.2635977, 0.6403995, 1, 0, 0.04313726, 1,
2.619177, 0.4553645, 0.3805626, 1, 0, 0.03529412, 1,
2.651327, -1.808643, 1.978179, 1, 0, 0.03137255, 1,
2.820463, 0.7614881, 2.569457, 1, 0, 0.02352941, 1,
2.82283, -1.813791, 4.034076, 1, 0, 0.01960784, 1,
2.875821, 0.7941477, 2.075377, 1, 0, 0.01176471, 1,
2.943028, -0.9126775, -1.470778, 1, 0, 0.007843138, 1
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
-0.03383231, -3.523822, -7.125179, 0, -0.5, 0.5, 0.5,
-0.03383231, -3.523822, -7.125179, 1, -0.5, 0.5, 0.5,
-0.03383231, -3.523822, -7.125179, 1, 1.5, 0.5, 0.5,
-0.03383231, -3.523822, -7.125179, 0, 1.5, 0.5, 0.5
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
-4.019849, 0.4224581, -7.125179, 0, -0.5, 0.5, 0.5,
-4.019849, 0.4224581, -7.125179, 1, -0.5, 0.5, 0.5,
-4.019849, 0.4224581, -7.125179, 1, 1.5, 0.5, 0.5,
-4.019849, 0.4224581, -7.125179, 0, 1.5, 0.5, 0.5
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
-4.019849, -3.523822, 0.1565931, 0, -0.5, 0.5, 0.5,
-4.019849, -3.523822, 0.1565931, 1, -0.5, 0.5, 0.5,
-4.019849, -3.523822, 0.1565931, 1, 1.5, 0.5, 0.5,
-4.019849, -3.523822, 0.1565931, 0, 1.5, 0.5, 0.5
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
-3, -2.613142, -5.44477,
2, -2.613142, -5.44477,
-3, -2.613142, -5.44477,
-3, -2.764922, -5.724839,
-2, -2.613142, -5.44477,
-2, -2.764922, -5.724839,
-1, -2.613142, -5.44477,
-1, -2.764922, -5.724839,
0, -2.613142, -5.44477,
0, -2.764922, -5.724839,
1, -2.613142, -5.44477,
1, -2.764922, -5.724839,
2, -2.613142, -5.44477,
2, -2.764922, -5.724839
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
-3, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
-3, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
-3, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
-3, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5,
-2, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
-2, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
-2, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
-2, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5,
-1, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
-1, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
-1, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
-1, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5,
0, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
0, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
0, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
0, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5,
1, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
1, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
1, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
1, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5,
2, -3.068482, -6.284975, 0, -0.5, 0.5, 0.5,
2, -3.068482, -6.284975, 1, -0.5, 0.5, 0.5,
2, -3.068482, -6.284975, 1, 1.5, 0.5, 0.5,
2, -3.068482, -6.284975, 0, 1.5, 0.5, 0.5
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
-3.099999, -2, -5.44477,
-3.099999, 3, -5.44477,
-3.099999, -2, -5.44477,
-3.253307, -2, -5.724839,
-3.099999, -1, -5.44477,
-3.253307, -1, -5.724839,
-3.099999, 0, -5.44477,
-3.253307, 0, -5.724839,
-3.099999, 1, -5.44477,
-3.253307, 1, -5.724839,
-3.099999, 2, -5.44477,
-3.253307, 2, -5.724839,
-3.099999, 3, -5.44477,
-3.253307, 3, -5.724839
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
-3.559924, -2, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, -2, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, -2, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, -2, -6.284975, 0, 1.5, 0.5, 0.5,
-3.559924, -1, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, -1, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, -1, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, -1, -6.284975, 0, 1.5, 0.5, 0.5,
-3.559924, 0, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, 0, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, 0, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, 0, -6.284975, 0, 1.5, 0.5, 0.5,
-3.559924, 1, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, 1, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, 1, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, 1, -6.284975, 0, 1.5, 0.5, 0.5,
-3.559924, 2, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, 2, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, 2, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, 2, -6.284975, 0, 1.5, 0.5, 0.5,
-3.559924, 3, -6.284975, 0, -0.5, 0.5, 0.5,
-3.559924, 3, -6.284975, 1, -0.5, 0.5, 0.5,
-3.559924, 3, -6.284975, 1, 1.5, 0.5, 0.5,
-3.559924, 3, -6.284975, 0, 1.5, 0.5, 0.5
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
-3.099999, -2.613142, -4,
-3.099999, -2.613142, 4,
-3.099999, -2.613142, -4,
-3.253307, -2.764922, -4,
-3.099999, -2.613142, -2,
-3.253307, -2.764922, -2,
-3.099999, -2.613142, 0,
-3.253307, -2.764922, 0,
-3.099999, -2.613142, 2,
-3.253307, -2.764922, 2,
-3.099999, -2.613142, 4,
-3.253307, -2.764922, 4
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
-3.559924, -3.068482, -4, 0, -0.5, 0.5, 0.5,
-3.559924, -3.068482, -4, 1, -0.5, 0.5, 0.5,
-3.559924, -3.068482, -4, 1, 1.5, 0.5, 0.5,
-3.559924, -3.068482, -4, 0, 1.5, 0.5, 0.5,
-3.559924, -3.068482, -2, 0, -0.5, 0.5, 0.5,
-3.559924, -3.068482, -2, 1, -0.5, 0.5, 0.5,
-3.559924, -3.068482, -2, 1, 1.5, 0.5, 0.5,
-3.559924, -3.068482, -2, 0, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 0, 0, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 0, 1, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 0, 1, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 0, 0, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 2, 0, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 2, 1, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 2, 1, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 2, 0, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 4, 0, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 4, 1, -0.5, 0.5, 0.5,
-3.559924, -3.068482, 4, 1, 1.5, 0.5, 0.5,
-3.559924, -3.068482, 4, 0, 1.5, 0.5, 0.5
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
-3.099999, -2.613142, -5.44477,
-3.099999, 3.458058, -5.44477,
-3.099999, -2.613142, 5.757957,
-3.099999, 3.458058, 5.757957,
-3.099999, -2.613142, -5.44477,
-3.099999, -2.613142, 5.757957,
-3.099999, 3.458058, -5.44477,
-3.099999, 3.458058, 5.757957,
-3.099999, -2.613142, -5.44477,
3.032334, -2.613142, -5.44477,
-3.099999, -2.613142, 5.757957,
3.032334, -2.613142, 5.757957,
-3.099999, 3.458058, -5.44477,
3.032334, 3.458058, -5.44477,
-3.099999, 3.458058, 5.757957,
3.032334, 3.458058, 5.757957,
3.032334, -2.613142, -5.44477,
3.032334, 3.458058, -5.44477,
3.032334, -2.613142, 5.757957,
3.032334, 3.458058, 5.757957,
3.032334, -2.613142, -5.44477,
3.032334, -2.613142, 5.757957,
3.032334, 3.458058, -5.44477,
3.032334, 3.458058, 5.757957
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
var radius = 7.550985;
var distance = 33.59519;
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
mvMatrix.translate( 0.03383231, -0.4224581, -0.1565931 );
mvMatrix.scale( 1.331349, 1.344754, 0.7287755 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59519);
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


