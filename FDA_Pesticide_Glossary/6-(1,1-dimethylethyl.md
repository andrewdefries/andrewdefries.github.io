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
-2.936148, 1.622123, 1.209163, 1, 0, 0, 1,
-2.927969, 0.08717229, -2.275784, 1, 0.007843138, 0, 1,
-2.881903, 0.3299768, 0.03796998, 1, 0.01176471, 0, 1,
-2.623044, -0.02031967, -1.142632, 1, 0.01960784, 0, 1,
-2.551519, 0.131981, -3.409672, 1, 0.02352941, 0, 1,
-2.466709, -0.04367412, -0.7193389, 1, 0.03137255, 0, 1,
-2.390419, -1.36451, -1.593343, 1, 0.03529412, 0, 1,
-2.382787, -0.6072415, -3.116259, 1, 0.04313726, 0, 1,
-2.379077, 0.7712712, -1.107318, 1, 0.04705882, 0, 1,
-2.266046, 1.349686, -3.430784, 1, 0.05490196, 0, 1,
-2.203286, -0.1819059, -3.23946, 1, 0.05882353, 0, 1,
-2.159557, 1.162613, -0.8508008, 1, 0.06666667, 0, 1,
-2.137879, 0.9227704, -1.274858, 1, 0.07058824, 0, 1,
-2.104048, 1.011343, -0.8158973, 1, 0.07843138, 0, 1,
-2.089996, 0.2305402, -1.561792, 1, 0.08235294, 0, 1,
-2.073612, -0.8734535, -1.193268, 1, 0.09019608, 0, 1,
-2.070814, -0.07554734, -1.329131, 1, 0.09411765, 0, 1,
-2.043813, -0.3985757, -1.207721, 1, 0.1019608, 0, 1,
-2.040171, -1.038308, -3.893754, 1, 0.1098039, 0, 1,
-2.037112, 1.51123, -1.603045, 1, 0.1137255, 0, 1,
-2.036631, 0.009310502, -2.000287, 1, 0.1215686, 0, 1,
-1.972032, 0.4006641, -1.131708, 1, 0.1254902, 0, 1,
-1.953325, 0.1535452, -0.7670744, 1, 0.1333333, 0, 1,
-1.948563, -0.3089385, -0.9223666, 1, 0.1372549, 0, 1,
-1.946414, -0.9827994, -2.319067, 1, 0.145098, 0, 1,
-1.941211, 0.2890052, -0.3989114, 1, 0.1490196, 0, 1,
-1.939934, 2.152432, 0.6883707, 1, 0.1568628, 0, 1,
-1.917828, -1.185924, -3.95522, 1, 0.1607843, 0, 1,
-1.905005, -0.5083941, -1.876824, 1, 0.1686275, 0, 1,
-1.897184, -0.4711979, -2.350335, 1, 0.172549, 0, 1,
-1.87031, -0.7890291, -1.789629, 1, 0.1803922, 0, 1,
-1.867123, 0.9720252, -0.4730083, 1, 0.1843137, 0, 1,
-1.858374, 0.4736039, -0.8479059, 1, 0.1921569, 0, 1,
-1.809439, -0.3368841, -2.373437, 1, 0.1960784, 0, 1,
-1.792702, 0.3931797, -0.702388, 1, 0.2039216, 0, 1,
-1.778027, -0.3445096, -1.685749, 1, 0.2117647, 0, 1,
-1.77592, -1.029546, -1.275482, 1, 0.2156863, 0, 1,
-1.741609, -0.2985027, -1.209948, 1, 0.2235294, 0, 1,
-1.733071, 0.4606022, -3.269174, 1, 0.227451, 0, 1,
-1.731668, 1.142907, -1.574886, 1, 0.2352941, 0, 1,
-1.727248, -1.640525, -3.075991, 1, 0.2392157, 0, 1,
-1.704084, 1.079703, -3.492706, 1, 0.2470588, 0, 1,
-1.697376, 1.89059, -0.9241205, 1, 0.2509804, 0, 1,
-1.694964, -0.07934856, -2.652319, 1, 0.2588235, 0, 1,
-1.679997, 3.596839, -0.3110388, 1, 0.2627451, 0, 1,
-1.657227, 2.921036, -0.9577675, 1, 0.2705882, 0, 1,
-1.632577, 0.1520071, -3.228584, 1, 0.2745098, 0, 1,
-1.619772, -0.6655171, -2.142946, 1, 0.282353, 0, 1,
-1.607526, 0.5643849, -1.733641, 1, 0.2862745, 0, 1,
-1.605191, 1.066772, 1.561364, 1, 0.2941177, 0, 1,
-1.597096, 0.583271, -0.7743707, 1, 0.3019608, 0, 1,
-1.593676, -1.34309, -3.404663, 1, 0.3058824, 0, 1,
-1.592564, -0.6881792, -1.726247, 1, 0.3137255, 0, 1,
-1.580267, 1.00844, -3.095704, 1, 0.3176471, 0, 1,
-1.555385, 0.7616382, -1.95306, 1, 0.3254902, 0, 1,
-1.554685, -0.5414873, -2.619044, 1, 0.3294118, 0, 1,
-1.536322, 1.76864, -1.420733, 1, 0.3372549, 0, 1,
-1.524498, -0.4190874, -2.208647, 1, 0.3411765, 0, 1,
-1.515568, 1.254027, -2.306729, 1, 0.3490196, 0, 1,
-1.513584, -2.969675, -3.863427, 1, 0.3529412, 0, 1,
-1.512453, -1.257957, -2.664176, 1, 0.3607843, 0, 1,
-1.511757, -1.308927, -2.02421, 1, 0.3647059, 0, 1,
-1.509369, 1.299444, 0.4848753, 1, 0.372549, 0, 1,
-1.502169, 0.07751372, -1.656708, 1, 0.3764706, 0, 1,
-1.500734, -2.548511, -0.5779411, 1, 0.3843137, 0, 1,
-1.499648, -0.04235194, -1.489692, 1, 0.3882353, 0, 1,
-1.491626, 0.4809738, -1.578872, 1, 0.3960784, 0, 1,
-1.487933, -1.362747, -1.212393, 1, 0.4039216, 0, 1,
-1.485867, 0.226999, -1.033265, 1, 0.4078431, 0, 1,
-1.478663, 1.520684, -0.9781817, 1, 0.4156863, 0, 1,
-1.472813, 0.04662616, -2.21298, 1, 0.4196078, 0, 1,
-1.466393, 0.8545605, 0.02239173, 1, 0.427451, 0, 1,
-1.457915, 0.6251674, -1.710628, 1, 0.4313726, 0, 1,
-1.457627, -0.7593274, -3.588561, 1, 0.4392157, 0, 1,
-1.454877, 1.542669, -1.359225, 1, 0.4431373, 0, 1,
-1.440503, 0.5275892, -0.2578343, 1, 0.4509804, 0, 1,
-1.430601, -0.9762754, -4.063084, 1, 0.454902, 0, 1,
-1.420052, 0.5822028, -1.64755, 1, 0.4627451, 0, 1,
-1.402627, -0.9502977, -3.090286, 1, 0.4666667, 0, 1,
-1.385246, -0.03393855, -1.033836, 1, 0.4745098, 0, 1,
-1.382182, -0.3593993, -0.585282, 1, 0.4784314, 0, 1,
-1.357614, -0.1112909, -2.286167, 1, 0.4862745, 0, 1,
-1.349566, -0.4990639, -2.508089, 1, 0.4901961, 0, 1,
-1.341434, 0.6642865, -2.004533, 1, 0.4980392, 0, 1,
-1.340096, 0.4356205, -1.391378, 1, 0.5058824, 0, 1,
-1.33955, 1.203167, -2.102366, 1, 0.509804, 0, 1,
-1.328477, -0.07492712, -1.554273, 1, 0.5176471, 0, 1,
-1.321537, -0.6808173, -2.277355, 1, 0.5215687, 0, 1,
-1.31018, 0.7322385, -1.068885, 1, 0.5294118, 0, 1,
-1.289184, -1.586998, -3.629774, 1, 0.5333334, 0, 1,
-1.272244, -0.2286236, -1.755199, 1, 0.5411765, 0, 1,
-1.267762, -0.07766623, -1.78847, 1, 0.5450981, 0, 1,
-1.264518, -0.7989233, -2.209663, 1, 0.5529412, 0, 1,
-1.262404, -1.448045, -0.891071, 1, 0.5568628, 0, 1,
-1.255348, -0.9489771, -2.010136, 1, 0.5647059, 0, 1,
-1.248499, -0.5942412, -1.195024, 1, 0.5686275, 0, 1,
-1.245013, 1.537099, 0.3222761, 1, 0.5764706, 0, 1,
-1.232276, -0.3023384, -3.233548, 1, 0.5803922, 0, 1,
-1.229793, 0.7592237, -0.3680623, 1, 0.5882353, 0, 1,
-1.226384, -0.07231105, -1.717407, 1, 0.5921569, 0, 1,
-1.223173, -0.7459412, -2.744709, 1, 0.6, 0, 1,
-1.218877, 1.219534, -0.5050823, 1, 0.6078432, 0, 1,
-1.209083, 1.239925, -0.2932646, 1, 0.6117647, 0, 1,
-1.20191, 0.8485687, -2.068624, 1, 0.6196079, 0, 1,
-1.193131, 0.9395995, -1.07765, 1, 0.6235294, 0, 1,
-1.192989, -1.085065, -4.741815, 1, 0.6313726, 0, 1,
-1.190283, -1.732631, -2.822102, 1, 0.6352941, 0, 1,
-1.184807, 0.333872, -0.1740122, 1, 0.6431373, 0, 1,
-1.177219, 1.970253, -0.7778347, 1, 0.6470588, 0, 1,
-1.172747, -0.06665026, -0.9653317, 1, 0.654902, 0, 1,
-1.170711, 0.04457233, -1.167536, 1, 0.6588235, 0, 1,
-1.166831, -0.3078291, -2.290988, 1, 0.6666667, 0, 1,
-1.166041, 2.077698, -1.823183, 1, 0.6705883, 0, 1,
-1.162309, -0.5707919, -2.371109, 1, 0.6784314, 0, 1,
-1.158659, -1.214992, -0.2682365, 1, 0.682353, 0, 1,
-1.155373, 0.9250246, -0.06827434, 1, 0.6901961, 0, 1,
-1.146105, 0.7751651, -0.3601782, 1, 0.6941177, 0, 1,
-1.145146, 0.01590282, -2.060525, 1, 0.7019608, 0, 1,
-1.142299, -1.002434, -1.656863, 1, 0.7098039, 0, 1,
-1.134863, -0.3361489, -1.264643, 1, 0.7137255, 0, 1,
-1.133662, 0.3569084, -1.111491, 1, 0.7215686, 0, 1,
-1.133451, -1.767335, -3.411303, 1, 0.7254902, 0, 1,
-1.119917, 0.2943761, -2.134597, 1, 0.7333333, 0, 1,
-1.110804, -1.254956, -2.552444, 1, 0.7372549, 0, 1,
-1.107436, 0.5701338, -2.414065, 1, 0.7450981, 0, 1,
-1.102537, -0.9653465, -2.170109, 1, 0.7490196, 0, 1,
-1.100248, 0.4548442, -0.1215887, 1, 0.7568628, 0, 1,
-1.094019, 0.7137088, 1.487172, 1, 0.7607843, 0, 1,
-1.091378, 0.1578376, -1.204486, 1, 0.7686275, 0, 1,
-1.08807, 0.4091346, 0.4245428, 1, 0.772549, 0, 1,
-1.084635, 0.5943859, -0.7918568, 1, 0.7803922, 0, 1,
-1.077331, 1.513769, -1.456144, 1, 0.7843137, 0, 1,
-1.07725, -0.2636254, -1.178479, 1, 0.7921569, 0, 1,
-1.074708, -1.180581, -1.51786, 1, 0.7960784, 0, 1,
-1.072516, -1.054314, -1.162801, 1, 0.8039216, 0, 1,
-1.071084, 2.332919, 0.5936794, 1, 0.8117647, 0, 1,
-1.066605, -0.7236204, -1.288285, 1, 0.8156863, 0, 1,
-1.064066, -1.02213, -2.338173, 1, 0.8235294, 0, 1,
-1.061293, 0.6572973, -2.130626, 1, 0.827451, 0, 1,
-1.060747, -0.2976931, -2.913396, 1, 0.8352941, 0, 1,
-1.053546, 0.8147694, -1.979918, 1, 0.8392157, 0, 1,
-1.052983, -0.3014103, -3.553646, 1, 0.8470588, 0, 1,
-1.046202, 0.5960897, -0.8502735, 1, 0.8509804, 0, 1,
-1.042706, 0.2665575, -1.404518, 1, 0.8588235, 0, 1,
-1.032354, -0.5009969, -2.483326, 1, 0.8627451, 0, 1,
-1.028228, 0.1929215, -2.411719, 1, 0.8705882, 0, 1,
-1.027873, -1.636823, -3.360322, 1, 0.8745098, 0, 1,
-1.021559, 1.268968, -1.722232, 1, 0.8823529, 0, 1,
-1.010422, -1.335161, -1.42566, 1, 0.8862745, 0, 1,
-1.000614, 1.373797, -1.630944, 1, 0.8941177, 0, 1,
-0.9977935, 1.809318, -3.231978, 1, 0.8980392, 0, 1,
-0.9958511, -0.4695412, -3.908169, 1, 0.9058824, 0, 1,
-0.9932218, -1.528072, -2.256464, 1, 0.9137255, 0, 1,
-0.9877312, -0.02306527, -3.097023, 1, 0.9176471, 0, 1,
-0.9876086, -0.9155086, -3.566041, 1, 0.9254902, 0, 1,
-0.9585546, -1.066488, -0.8657788, 1, 0.9294118, 0, 1,
-0.9481896, 1.284393, -0.5519709, 1, 0.9372549, 0, 1,
-0.947432, -0.02879804, 0.1365468, 1, 0.9411765, 0, 1,
-0.9471729, 0.7481745, -2.597617, 1, 0.9490196, 0, 1,
-0.9457455, -0.9048012, -1.928237, 1, 0.9529412, 0, 1,
-0.9401475, 1.702648, -1.126088, 1, 0.9607843, 0, 1,
-0.9391987, -0.4003803, -1.089415, 1, 0.9647059, 0, 1,
-0.936748, -0.9561204, -1.710499, 1, 0.972549, 0, 1,
-0.9319937, -0.6523972, -3.093569, 1, 0.9764706, 0, 1,
-0.9318531, -1.811367, -2.6856, 1, 0.9843137, 0, 1,
-0.9313313, 0.1486663, -1.036329, 1, 0.9882353, 0, 1,
-0.9300663, 0.1270679, -1.856784, 1, 0.9960784, 0, 1,
-0.9249739, -0.1192248, -1.787994, 0.9960784, 1, 0, 1,
-0.9198518, 0.8593113, -0.0007246421, 0.9921569, 1, 0, 1,
-0.9162443, 0.07430217, -1.056301, 0.9843137, 1, 0, 1,
-0.91552, -0.1433713, -0.8850519, 0.9803922, 1, 0, 1,
-0.9123415, 2.85916, -0.5332614, 0.972549, 1, 0, 1,
-0.901931, -0.02894851, -2.22047, 0.9686275, 1, 0, 1,
-0.8993915, -0.4239537, -0.1565141, 0.9607843, 1, 0, 1,
-0.8974677, -0.5904498, -2.994397, 0.9568627, 1, 0, 1,
-0.8945947, 0.4043882, -0.04656899, 0.9490196, 1, 0, 1,
-0.8920848, -1.16648, -1.557051, 0.945098, 1, 0, 1,
-0.8860065, 1.121261, -1.53429, 0.9372549, 1, 0, 1,
-0.8804587, -0.2840499, -3.429114, 0.9333333, 1, 0, 1,
-0.872916, 2.110998, 1.087261, 0.9254902, 1, 0, 1,
-0.8670583, -0.4716245, -2.432825, 0.9215686, 1, 0, 1,
-0.8642262, -1.708016, -2.128412, 0.9137255, 1, 0, 1,
-0.8622059, 0.8671275, -1.373158, 0.9098039, 1, 0, 1,
-0.8540377, 1.189103, 1.220235, 0.9019608, 1, 0, 1,
-0.8521388, 0.03699208, -0.5278657, 0.8941177, 1, 0, 1,
-0.8486975, 0.7210332, -0.8149851, 0.8901961, 1, 0, 1,
-0.8400238, 0.2351639, -0.1540114, 0.8823529, 1, 0, 1,
-0.8383452, 0.5651035, -1.129008, 0.8784314, 1, 0, 1,
-0.8372671, 0.2286016, -0.3787686, 0.8705882, 1, 0, 1,
-0.8368384, -1.375584, -2.580658, 0.8666667, 1, 0, 1,
-0.8345909, -0.3150396, -1.396049, 0.8588235, 1, 0, 1,
-0.8338228, 1.42335, -0.3787211, 0.854902, 1, 0, 1,
-0.8197481, 0.06385135, -2.971755, 0.8470588, 1, 0, 1,
-0.8155671, 0.1020106, -1.158796, 0.8431373, 1, 0, 1,
-0.811761, 1.101691, -0.5714941, 0.8352941, 1, 0, 1,
-0.8074657, -1.092004, -0.6520195, 0.8313726, 1, 0, 1,
-0.8056157, 0.9910799, -1.556422, 0.8235294, 1, 0, 1,
-0.8009355, -0.5222616, -0.7349464, 0.8196079, 1, 0, 1,
-0.7985077, 0.9238605, -1.686589, 0.8117647, 1, 0, 1,
-0.7928186, -0.06499604, -1.072785, 0.8078431, 1, 0, 1,
-0.7919903, -1.05572, -0.7075385, 0.8, 1, 0, 1,
-0.7893001, -0.4889237, -2.7706, 0.7921569, 1, 0, 1,
-0.7878547, -0.8650937, -1.956956, 0.7882353, 1, 0, 1,
-0.7834435, -1.480485, -3.025731, 0.7803922, 1, 0, 1,
-0.7741544, -0.7226583, -4.103101, 0.7764706, 1, 0, 1,
-0.7705995, -0.7770134, -3.617646, 0.7686275, 1, 0, 1,
-0.7699417, 0.440269, -1.685518, 0.7647059, 1, 0, 1,
-0.7683501, 1.443828, 0.1442761, 0.7568628, 1, 0, 1,
-0.7654877, 0.1210145, -1.129041, 0.7529412, 1, 0, 1,
-0.7652256, 0.2811435, -0.9187636, 0.7450981, 1, 0, 1,
-0.7622351, 0.2869646, -2.148711, 0.7411765, 1, 0, 1,
-0.7601658, -0.5991271, -2.774362, 0.7333333, 1, 0, 1,
-0.758105, -0.2682211, -1.45333, 0.7294118, 1, 0, 1,
-0.7519855, 0.07688177, -2.30863, 0.7215686, 1, 0, 1,
-0.7515987, 0.5953051, -0.1531237, 0.7176471, 1, 0, 1,
-0.7492296, 1.17748, -1.602506, 0.7098039, 1, 0, 1,
-0.7480471, -0.0466068, -0.3938318, 0.7058824, 1, 0, 1,
-0.7479138, -0.9155046, -2.895593, 0.6980392, 1, 0, 1,
-0.7455872, -1.187642, -0.9385373, 0.6901961, 1, 0, 1,
-0.7449813, -0.6253488, -2.994682, 0.6862745, 1, 0, 1,
-0.7428313, -0.5518773, -4.062947, 0.6784314, 1, 0, 1,
-0.7401609, -0.5647293, -2.924169, 0.6745098, 1, 0, 1,
-0.7343201, -0.4343561, -2.883809, 0.6666667, 1, 0, 1,
-0.7333956, 0.4437729, -0.1524983, 0.6627451, 1, 0, 1,
-0.7316592, 0.3173262, -1.680319, 0.654902, 1, 0, 1,
-0.729422, 1.324064, -0.3400296, 0.6509804, 1, 0, 1,
-0.7246817, -0.8767913, -2.293164, 0.6431373, 1, 0, 1,
-0.7212809, 0.5653071, -1.4776, 0.6392157, 1, 0, 1,
-0.7189559, -1.917149, -3.633633, 0.6313726, 1, 0, 1,
-0.7183835, 0.7537572, -0.8076825, 0.627451, 1, 0, 1,
-0.7163147, -1.133665, -3.244244, 0.6196079, 1, 0, 1,
-0.7155913, -0.8405738, -2.48107, 0.6156863, 1, 0, 1,
-0.6980422, 0.2379217, -2.234099, 0.6078432, 1, 0, 1,
-0.6955032, -2.280588, -3.148181, 0.6039216, 1, 0, 1,
-0.6932793, -2.383482, -3.357849, 0.5960785, 1, 0, 1,
-0.6914043, 0.7882689, -0.035031, 0.5882353, 1, 0, 1,
-0.6898292, -0.114502, -1.743172, 0.5843138, 1, 0, 1,
-0.6880444, -1.099211, -0.2062582, 0.5764706, 1, 0, 1,
-0.6862397, 0.4409589, -1.605832, 0.572549, 1, 0, 1,
-0.6854176, -0.386117, -0.8635754, 0.5647059, 1, 0, 1,
-0.6815671, -2.451683, -2.742107, 0.5607843, 1, 0, 1,
-0.6749698, -0.746354, -1.767519, 0.5529412, 1, 0, 1,
-0.6748918, 0.512589, -1.431792, 0.5490196, 1, 0, 1,
-0.6741455, -0.9898725, -4.65445, 0.5411765, 1, 0, 1,
-0.6726232, 0.6395741, -1.983027, 0.5372549, 1, 0, 1,
-0.6707161, 0.01790515, -2.637202, 0.5294118, 1, 0, 1,
-0.6674563, -1.30439, -1.815445, 0.5254902, 1, 0, 1,
-0.6636638, -0.6059085, -2.310676, 0.5176471, 1, 0, 1,
-0.6585747, -1.698435, -2.934201, 0.5137255, 1, 0, 1,
-0.6572487, -0.4633811, -2.259466, 0.5058824, 1, 0, 1,
-0.6558984, -0.8620306, -1.121483, 0.5019608, 1, 0, 1,
-0.6474754, 0.1715473, -0.2800406, 0.4941176, 1, 0, 1,
-0.6472118, 0.4067127, 0.08293818, 0.4862745, 1, 0, 1,
-0.6398956, 1.527336, -1.292845, 0.4823529, 1, 0, 1,
-0.6381256, 1.75611, 0.5369604, 0.4745098, 1, 0, 1,
-0.6340791, -1.997177, -4.368085, 0.4705882, 1, 0, 1,
-0.6334394, 0.437798, -1.845837, 0.4627451, 1, 0, 1,
-0.6306211, -0.1233122, -4.357889, 0.4588235, 1, 0, 1,
-0.6276423, -0.001638014, -2.462115, 0.4509804, 1, 0, 1,
-0.6203349, 1.461151, -0.6847556, 0.4470588, 1, 0, 1,
-0.6145757, -0.3041444, -4.09265, 0.4392157, 1, 0, 1,
-0.6046076, -0.1951823, -2.570346, 0.4352941, 1, 0, 1,
-0.6039025, 0.6703909, -0.2266277, 0.427451, 1, 0, 1,
-0.6035367, -0.6257002, -3.651214, 0.4235294, 1, 0, 1,
-0.6026641, 0.8789948, 0.4370379, 0.4156863, 1, 0, 1,
-0.6019818, -1.223235, -2.232803, 0.4117647, 1, 0, 1,
-0.599529, 0.9834425, 1.389988, 0.4039216, 1, 0, 1,
-0.5987626, -0.04841715, -1.611119, 0.3960784, 1, 0, 1,
-0.5973029, -0.1011485, -1.253004, 0.3921569, 1, 0, 1,
-0.5905901, 1.464962, 1.425634, 0.3843137, 1, 0, 1,
-0.5872346, 0.8862332, -0.0004878068, 0.3803922, 1, 0, 1,
-0.5854271, -0.1695027, -1.001434, 0.372549, 1, 0, 1,
-0.5845829, 1.551358, -0.03076635, 0.3686275, 1, 0, 1,
-0.5838985, -1.38226, -5.090541, 0.3607843, 1, 0, 1,
-0.5828091, -0.1561683, -2.123602, 0.3568628, 1, 0, 1,
-0.5803297, -0.7660537, -1.728225, 0.3490196, 1, 0, 1,
-0.5749186, -0.08238392, -2.575039, 0.345098, 1, 0, 1,
-0.5607492, 0.7363707, -0.07184787, 0.3372549, 1, 0, 1,
-0.5597425, -1.269485, -2.612129, 0.3333333, 1, 0, 1,
-0.559677, 1.222161, -0.6755, 0.3254902, 1, 0, 1,
-0.5548289, 0.2464115, -0.2281515, 0.3215686, 1, 0, 1,
-0.5510142, -2.224649, -2.553659, 0.3137255, 1, 0, 1,
-0.537077, 0.7818365, -0.230382, 0.3098039, 1, 0, 1,
-0.5353253, 0.1794848, -0.5929316, 0.3019608, 1, 0, 1,
-0.5341902, -0.4135221, -0.5094498, 0.2941177, 1, 0, 1,
-0.5222187, 1.10207, 1.510789, 0.2901961, 1, 0, 1,
-0.5199673, 0.583094, -0.8523866, 0.282353, 1, 0, 1,
-0.5186419, -0.9682981, -2.445308, 0.2784314, 1, 0, 1,
-0.5144773, -0.4149808, -1.745177, 0.2705882, 1, 0, 1,
-0.5078032, 0.3901239, -0.4145125, 0.2666667, 1, 0, 1,
-0.5056089, -1.355791, -3.860494, 0.2588235, 1, 0, 1,
-0.5039992, -0.2898551, -1.466561, 0.254902, 1, 0, 1,
-0.5011697, -1.730315, -2.595129, 0.2470588, 1, 0, 1,
-0.4971497, -0.7877985, -1.984532, 0.2431373, 1, 0, 1,
-0.4951374, 0.3346041, 0.1068862, 0.2352941, 1, 0, 1,
-0.4948547, -0.5960435, -2.971788, 0.2313726, 1, 0, 1,
-0.4896862, 0.6665412, -1.041788, 0.2235294, 1, 0, 1,
-0.4864148, 0.6931973, 1.72907, 0.2196078, 1, 0, 1,
-0.4818076, 0.2445981, -0.9487354, 0.2117647, 1, 0, 1,
-0.4776492, -1.190718, -3.68552, 0.2078431, 1, 0, 1,
-0.4769867, -0.1574367, -1.97149, 0.2, 1, 0, 1,
-0.4747352, -1.654718, -1.818815, 0.1921569, 1, 0, 1,
-0.4705892, -0.1478619, -2.698123, 0.1882353, 1, 0, 1,
-0.4677173, -1.571281, -2.299868, 0.1803922, 1, 0, 1,
-0.4641556, 0.4295671, -1.241571, 0.1764706, 1, 0, 1,
-0.4639207, -0.1765751, -2.43347, 0.1686275, 1, 0, 1,
-0.4618032, -1.762974, -2.671419, 0.1647059, 1, 0, 1,
-0.4613876, 1.441502, -0.3136739, 0.1568628, 1, 0, 1,
-0.4606667, -0.3374652, -2.22798, 0.1529412, 1, 0, 1,
-0.4496043, -1.003981, -2.592897, 0.145098, 1, 0, 1,
-0.4475603, 0.5507315, -0.1809773, 0.1411765, 1, 0, 1,
-0.446339, 1.706793, 0.7778825, 0.1333333, 1, 0, 1,
-0.4404579, -0.09582695, -1.740538, 0.1294118, 1, 0, 1,
-0.4377851, 0.7084141, 0.8928472, 0.1215686, 1, 0, 1,
-0.4304655, 0.2755543, -1.0926, 0.1176471, 1, 0, 1,
-0.4283326, 0.0475608, 0.3624308, 0.1098039, 1, 0, 1,
-0.4258605, 0.07703872, -1.057628, 0.1058824, 1, 0, 1,
-0.4254955, -2.392859, -4.285694, 0.09803922, 1, 0, 1,
-0.4251622, -0.7660031, -1.455631, 0.09019608, 1, 0, 1,
-0.424009, 1.156457, -0.7483177, 0.08627451, 1, 0, 1,
-0.4228815, -0.6720554, -3.543727, 0.07843138, 1, 0, 1,
-0.4160688, -0.1392679, -2.201253, 0.07450981, 1, 0, 1,
-0.4146444, -0.747811, -2.125169, 0.06666667, 1, 0, 1,
-0.4144143, 1.90115, -1.37835, 0.0627451, 1, 0, 1,
-0.4137869, 0.2084095, -1.435243, 0.05490196, 1, 0, 1,
-0.4135562, -0.3411331, -2.228744, 0.05098039, 1, 0, 1,
-0.4088935, -0.02369039, -0.5550337, 0.04313726, 1, 0, 1,
-0.4069678, 0.6972093, -2.831944, 0.03921569, 1, 0, 1,
-0.405772, -0.3733961, -2.621315, 0.03137255, 1, 0, 1,
-0.4019616, 0.4718421, 0.7629369, 0.02745098, 1, 0, 1,
-0.3984666, 0.09425341, -0.5513766, 0.01960784, 1, 0, 1,
-0.3976481, -0.02876532, -2.2175, 0.01568628, 1, 0, 1,
-0.3975199, -1.699746, -3.649575, 0.007843138, 1, 0, 1,
-0.3941136, 2.127608, -0.4605386, 0.003921569, 1, 0, 1,
-0.3917159, -0.1772347, -3.104695, 0, 1, 0.003921569, 1,
-0.3885463, -0.1293509, -2.568197, 0, 1, 0.01176471, 1,
-0.3862657, 1.278053, 1.642116, 0, 1, 0.01568628, 1,
-0.3837897, -0.6002778, -2.661766, 0, 1, 0.02352941, 1,
-0.3804646, 1.881672, -0.7194239, 0, 1, 0.02745098, 1,
-0.3796102, -0.1390852, -1.795353, 0, 1, 0.03529412, 1,
-0.3785842, -1.866775, -3.099019, 0, 1, 0.03921569, 1,
-0.375377, -0.0773898, -3.266555, 0, 1, 0.04705882, 1,
-0.3752938, 0.5311344, -0.863228, 0, 1, 0.05098039, 1,
-0.3729087, -0.1993374, -0.3669925, 0, 1, 0.05882353, 1,
-0.3710464, -0.7085275, -1.453616, 0, 1, 0.0627451, 1,
-0.3582467, 0.9959386, -1.279215, 0, 1, 0.07058824, 1,
-0.3580559, 0.1779783, -0.6553386, 0, 1, 0.07450981, 1,
-0.3548615, 2.159907, -0.3579918, 0, 1, 0.08235294, 1,
-0.3548525, 1.041031, -0.9425921, 0, 1, 0.08627451, 1,
-0.3530396, -0.6610858, -3.77536, 0, 1, 0.09411765, 1,
-0.3493115, -0.4897852, -2.05296, 0, 1, 0.1019608, 1,
-0.349014, 0.9995561, -0.8938242, 0, 1, 0.1058824, 1,
-0.3486632, 0.5570096, 0.6181963, 0, 1, 0.1137255, 1,
-0.3453472, 1.070563, -0.414456, 0, 1, 0.1176471, 1,
-0.3448618, -0.1925621, -1.440631, 0, 1, 0.1254902, 1,
-0.3413819, -0.5946426, -1.666488, 0, 1, 0.1294118, 1,
-0.3408276, 1.076823, 1.184001, 0, 1, 0.1372549, 1,
-0.339806, 0.3283289, -0.6272775, 0, 1, 0.1411765, 1,
-0.339203, -1.688537, -2.843766, 0, 1, 0.1490196, 1,
-0.3337598, 0.02710716, -0.4919847, 0, 1, 0.1529412, 1,
-0.3329049, -0.9953623, -1.405031, 0, 1, 0.1607843, 1,
-0.3305309, 0.04481798, 0.4040662, 0, 1, 0.1647059, 1,
-0.3301928, 0.009428064, -1.573279, 0, 1, 0.172549, 1,
-0.3300152, 0.9956945, -1.29218, 0, 1, 0.1764706, 1,
-0.3224858, -0.2901345, -1.765598, 0, 1, 0.1843137, 1,
-0.3202583, 1.370814, 1.663541, 0, 1, 0.1882353, 1,
-0.319273, 0.5455192, -1.706403, 0, 1, 0.1960784, 1,
-0.3181964, 0.7090054, 0.877801, 0, 1, 0.2039216, 1,
-0.3140134, 0.3012298, -1.671959, 0, 1, 0.2078431, 1,
-0.31224, 1.671025, -0.9544513, 0, 1, 0.2156863, 1,
-0.3109224, -0.5645939, -3.50788, 0, 1, 0.2196078, 1,
-0.3096742, -0.1259398, -1.900217, 0, 1, 0.227451, 1,
-0.3067501, -1.634401, -1.421551, 0, 1, 0.2313726, 1,
-0.3016444, -2.126281, -2.280364, 0, 1, 0.2392157, 1,
-0.2937619, 0.5798472, 0.4244009, 0, 1, 0.2431373, 1,
-0.2929109, -0.5355601, -2.378767, 0, 1, 0.2509804, 1,
-0.2894472, 0.9538451, -1.165049, 0, 1, 0.254902, 1,
-0.2877322, -0.7583581, -3.443566, 0, 1, 0.2627451, 1,
-0.2869024, 1.375753, -1.893365, 0, 1, 0.2666667, 1,
-0.2864801, 0.8371781, -0.314231, 0, 1, 0.2745098, 1,
-0.2851239, -0.08772078, -2.312232, 0, 1, 0.2784314, 1,
-0.2778731, -0.5109214, -2.632387, 0, 1, 0.2862745, 1,
-0.2731977, 0.4000226, 0.402242, 0, 1, 0.2901961, 1,
-0.2722589, 1.627038, 0.30132, 0, 1, 0.2980392, 1,
-0.2709306, 0.6258203, -1.424633, 0, 1, 0.3058824, 1,
-0.2678458, -1.894343, -2.71607, 0, 1, 0.3098039, 1,
-0.2669857, 0.5088257, 0.5678107, 0, 1, 0.3176471, 1,
-0.2651821, 0.8991317, 1.417107, 0, 1, 0.3215686, 1,
-0.264588, -2.599741, -4.124289, 0, 1, 0.3294118, 1,
-0.2625876, 1.032459, -0.3145013, 0, 1, 0.3333333, 1,
-0.261856, 1.347657, 1.11364, 0, 1, 0.3411765, 1,
-0.2611656, 0.2479158, -1.069785, 0, 1, 0.345098, 1,
-0.2607107, -2.329686, -4.106165, 0, 1, 0.3529412, 1,
-0.2604638, -0.1627134, -1.669945, 0, 1, 0.3568628, 1,
-0.2561063, -0.2334419, -1.984137, 0, 1, 0.3647059, 1,
-0.2543274, 0.6512758, -2.350266, 0, 1, 0.3686275, 1,
-0.2523956, -1.921736, -3.128963, 0, 1, 0.3764706, 1,
-0.2491533, 0.5231946, -0.271522, 0, 1, 0.3803922, 1,
-0.2446479, -0.1670316, -4.316908, 0, 1, 0.3882353, 1,
-0.2413869, 0.9144173, 1.218987, 0, 1, 0.3921569, 1,
-0.239901, -0.8578557, -3.270102, 0, 1, 0.4, 1,
-0.2381789, -0.4542765, -3.347324, 0, 1, 0.4078431, 1,
-0.2342306, -0.4569217, -4.343745, 0, 1, 0.4117647, 1,
-0.232344, -2.491971, -4.987679, 0, 1, 0.4196078, 1,
-0.2229615, -0.06300314, -2.359682, 0, 1, 0.4235294, 1,
-0.2229353, -1.367566, -1.607221, 0, 1, 0.4313726, 1,
-0.2198488, -1.54834, -2.054058, 0, 1, 0.4352941, 1,
-0.2163126, 0.05907235, -2.097636, 0, 1, 0.4431373, 1,
-0.215148, -2.05667, -4.359472, 0, 1, 0.4470588, 1,
-0.2142375, 1.171263, 0.4241388, 0, 1, 0.454902, 1,
-0.2127058, 0.62793, -0.4256883, 0, 1, 0.4588235, 1,
-0.2098842, -1.320624, -3.167896, 0, 1, 0.4666667, 1,
-0.20864, 1.904526, 0.03042221, 0, 1, 0.4705882, 1,
-0.2083189, -0.7106975, -2.483498, 0, 1, 0.4784314, 1,
-0.2048579, -0.4475776, -1.510427, 0, 1, 0.4823529, 1,
-0.2015925, 1.497068, 0.3155751, 0, 1, 0.4901961, 1,
-0.1988684, 0.2671716, 0.7583117, 0, 1, 0.4941176, 1,
-0.1978749, -1.178341, 0.3639314, 0, 1, 0.5019608, 1,
-0.195027, -0.9689602, -3.19491, 0, 1, 0.509804, 1,
-0.1935638, 0.5276015, -1.356758, 0, 1, 0.5137255, 1,
-0.1920002, 0.2206819, -0.2082299, 0, 1, 0.5215687, 1,
-0.1867905, 0.7002097, 1.357808, 0, 1, 0.5254902, 1,
-0.1856326, -1.04408, -1.743159, 0, 1, 0.5333334, 1,
-0.1836255, 0.9256339, 0.8740689, 0, 1, 0.5372549, 1,
-0.1761023, -0.545763, -2.227136, 0, 1, 0.5450981, 1,
-0.173007, -0.8983573, -3.086095, 0, 1, 0.5490196, 1,
-0.1727633, -0.790906, -2.508948, 0, 1, 0.5568628, 1,
-0.1713091, 0.9854421, 1.867011, 0, 1, 0.5607843, 1,
-0.1709421, -0.3949347, -3.169953, 0, 1, 0.5686275, 1,
-0.1688834, 0.8839679, 0.06064075, 0, 1, 0.572549, 1,
-0.164543, 0.1874608, -0.1333503, 0, 1, 0.5803922, 1,
-0.1631781, -1.064423, -2.308795, 0, 1, 0.5843138, 1,
-0.1594673, 0.005878785, -1.546307, 0, 1, 0.5921569, 1,
-0.1594297, 0.1778321, -0.4538906, 0, 1, 0.5960785, 1,
-0.1534027, 0.2078341, -1.167275, 0, 1, 0.6039216, 1,
-0.1528322, 0.333353, -1.944995, 0, 1, 0.6117647, 1,
-0.1516715, 0.7485806, -0.02449244, 0, 1, 0.6156863, 1,
-0.1486283, -1.066658, -1.395253, 0, 1, 0.6235294, 1,
-0.1457026, 0.1192947, -0.6913965, 0, 1, 0.627451, 1,
-0.145155, 0.5654625, -1.745744, 0, 1, 0.6352941, 1,
-0.1442306, 0.2072656, -0.8352679, 0, 1, 0.6392157, 1,
-0.1432749, -0.3780501, -3.409382, 0, 1, 0.6470588, 1,
-0.1382415, -1.04578, 0.8211448, 0, 1, 0.6509804, 1,
-0.1348471, -0.9954443, -4.177751, 0, 1, 0.6588235, 1,
-0.1300897, 1.237454, -1.101709, 0, 1, 0.6627451, 1,
-0.1279345, 0.209596, -0.6332821, 0, 1, 0.6705883, 1,
-0.1254751, -0.1824673, -2.251583, 0, 1, 0.6745098, 1,
-0.1206607, 0.4181768, -1.13996, 0, 1, 0.682353, 1,
-0.1204057, 1.842278, 1.451069, 0, 1, 0.6862745, 1,
-0.120167, -1.490376, -2.211083, 0, 1, 0.6941177, 1,
-0.119632, -0.3114182, -3.332112, 0, 1, 0.7019608, 1,
-0.1191369, 0.9589766, 0.8431305, 0, 1, 0.7058824, 1,
-0.1147, 0.3434189, -0.8449696, 0, 1, 0.7137255, 1,
-0.111758, 0.1576349, -1.397126, 0, 1, 0.7176471, 1,
-0.1108581, -0.5418065, -3.258467, 0, 1, 0.7254902, 1,
-0.1086979, -0.4498681, -3.805142, 0, 1, 0.7294118, 1,
-0.1055462, -0.2248127, -4.074152, 0, 1, 0.7372549, 1,
-0.1032985, -0.5939388, -1.758899, 0, 1, 0.7411765, 1,
-0.1019, -0.4354272, -2.148522, 0, 1, 0.7490196, 1,
-0.1014475, -1.126857, -2.909786, 0, 1, 0.7529412, 1,
-0.1000417, -0.1792224, -3.181386, 0, 1, 0.7607843, 1,
-0.09813944, 0.02525012, -1.458504, 0, 1, 0.7647059, 1,
-0.09533612, -0.9648349, -1.773406, 0, 1, 0.772549, 1,
-0.09436896, -0.2992559, -4.938891, 0, 1, 0.7764706, 1,
-0.09400801, 0.1202918, -1.257687, 0, 1, 0.7843137, 1,
-0.09389316, 0.8183529, -1.200577, 0, 1, 0.7882353, 1,
-0.09381012, -0.762396, -2.628563, 0, 1, 0.7960784, 1,
-0.09180231, 0.5696838, 1.718982, 0, 1, 0.8039216, 1,
-0.09138801, -0.903578, -1.600306, 0, 1, 0.8078431, 1,
-0.09133675, 0.4038441, -1.387755, 0, 1, 0.8156863, 1,
-0.09039731, -2.045215, -3.199024, 0, 1, 0.8196079, 1,
-0.08580539, -1.943951, -2.144722, 0, 1, 0.827451, 1,
-0.08472485, 1.452169, -0.6460857, 0, 1, 0.8313726, 1,
-0.07946636, -0.7971513, -2.48663, 0, 1, 0.8392157, 1,
-0.07084247, 1.62328, 0.2086668, 0, 1, 0.8431373, 1,
-0.07032075, 0.9939145, 0.09976977, 0, 1, 0.8509804, 1,
-0.06800739, -0.3582247, -1.310886, 0, 1, 0.854902, 1,
-0.06402106, 0.9634714, -0.8594676, 0, 1, 0.8627451, 1,
-0.06376479, -0.3263067, -1.534958, 0, 1, 0.8666667, 1,
-0.0631164, 0.5572708, -1.110918, 0, 1, 0.8745098, 1,
-0.05986954, 1.917716, 0.05064595, 0, 1, 0.8784314, 1,
-0.05984556, -0.6268449, -4.523687, 0, 1, 0.8862745, 1,
-0.05775889, 1.80231, 0.06748717, 0, 1, 0.8901961, 1,
-0.05769712, -0.06070285, -0.8845502, 0, 1, 0.8980392, 1,
-0.05357043, 0.9564868, 0.6222615, 0, 1, 0.9058824, 1,
-0.05053303, -1.31343, -3.246726, 0, 1, 0.9098039, 1,
-0.04602324, 0.7151936, 0.1491477, 0, 1, 0.9176471, 1,
-0.0432772, -1.123723, -2.787, 0, 1, 0.9215686, 1,
-0.04227877, -0.3828728, -2.574732, 0, 1, 0.9294118, 1,
-0.04204713, 0.8070157, 0.08543327, 0, 1, 0.9333333, 1,
-0.0388138, 0.7640269, -1.203806, 0, 1, 0.9411765, 1,
-0.03661213, -0.0155124, -3.008575, 0, 1, 0.945098, 1,
-0.02677241, 0.3626412, 1.31546, 0, 1, 0.9529412, 1,
-0.02341917, -0.9225256, -3.761726, 0, 1, 0.9568627, 1,
-0.02327786, 1.376722, 0.5094332, 0, 1, 0.9647059, 1,
-0.02151568, 0.5779678, -0.4130054, 0, 1, 0.9686275, 1,
-0.02078921, 0.001364753, -0.6195443, 0, 1, 0.9764706, 1,
-0.01176209, -1.171651, -1.818005, 0, 1, 0.9803922, 1,
-0.007199805, 0.4622843, -0.2446232, 0, 1, 0.9882353, 1,
-0.005050009, -0.5165591, -3.764025, 0, 1, 0.9921569, 1,
0.003754567, -1.806788, 4.280416, 0, 1, 1, 1,
0.004873723, 0.419248, 1.554938, 0, 0.9921569, 1, 1,
0.01237582, 1.653178, 0.3886479, 0, 0.9882353, 1, 1,
0.01824974, 0.4257747, -0.9785991, 0, 0.9803922, 1, 1,
0.01829138, -0.716998, 5.121764, 0, 0.9764706, 1, 1,
0.01910042, -1.629128, 3.253855, 0, 0.9686275, 1, 1,
0.01976315, 0.9153312, 0.25958, 0, 0.9647059, 1, 1,
0.02027113, -0.4164135, 3.498576, 0, 0.9568627, 1, 1,
0.02056783, -0.4355738, 3.998735, 0, 0.9529412, 1, 1,
0.0217923, 1.495437, -0.1311714, 0, 0.945098, 1, 1,
0.02216578, -0.9226584, 1.508462, 0, 0.9411765, 1, 1,
0.02442322, -1.474149, 3.459725, 0, 0.9333333, 1, 1,
0.0260885, 1.138309, 0.5035741, 0, 0.9294118, 1, 1,
0.02736286, -0.4180534, 0.858795, 0, 0.9215686, 1, 1,
0.03121509, -1.533114, 4.751567, 0, 0.9176471, 1, 1,
0.03774973, 1.539449, 0.9068315, 0, 0.9098039, 1, 1,
0.03981012, -0.1850391, 5.672194, 0, 0.9058824, 1, 1,
0.04273149, -0.2478981, 4.982596, 0, 0.8980392, 1, 1,
0.047473, -0.7415301, 3.156829, 0, 0.8901961, 1, 1,
0.04809505, -0.5046254, 0.8559648, 0, 0.8862745, 1, 1,
0.05166796, 0.7566732, -0.8727264, 0, 0.8784314, 1, 1,
0.05392398, 1.877077, 0.6192707, 0, 0.8745098, 1, 1,
0.06482695, 0.4641549, -0.3381332, 0, 0.8666667, 1, 1,
0.06577976, -1.349475, 2.077693, 0, 0.8627451, 1, 1,
0.06890252, 0.2469421, 0.04050158, 0, 0.854902, 1, 1,
0.07181935, -0.362138, 3.527988, 0, 0.8509804, 1, 1,
0.07415859, 0.3443944, -0.184638, 0, 0.8431373, 1, 1,
0.07432813, 0.02950102, -0.04587841, 0, 0.8392157, 1, 1,
0.07570051, -0.5722739, 4.392429, 0, 0.8313726, 1, 1,
0.07663886, -0.09257706, 0.7357909, 0, 0.827451, 1, 1,
0.08132144, 0.2699651, 2.3081, 0, 0.8196079, 1, 1,
0.08564036, 0.1632667, 1.745864, 0, 0.8156863, 1, 1,
0.08729277, 0.5529184, 0.03840481, 0, 0.8078431, 1, 1,
0.0890425, 1.622497, -0.07982569, 0, 0.8039216, 1, 1,
0.0898183, 1.529764, -0.0579416, 0, 0.7960784, 1, 1,
0.09173259, -0.254103, 1.014423, 0, 0.7882353, 1, 1,
0.09288934, 0.1161841, -1.971459, 0, 0.7843137, 1, 1,
0.09421686, -1.020826, 3.420349, 0, 0.7764706, 1, 1,
0.09432814, -0.8954673, 3.629666, 0, 0.772549, 1, 1,
0.094841, 1.056193, 0.1635759, 0, 0.7647059, 1, 1,
0.1030467, 1.573921, -0.6075238, 0, 0.7607843, 1, 1,
0.1053473, 1.160544, -1.112801, 0, 0.7529412, 1, 1,
0.1064066, -0.3496794, 2.584469, 0, 0.7490196, 1, 1,
0.1068018, -0.6394684, 3.319702, 0, 0.7411765, 1, 1,
0.1082419, 1.446403, 0.2080191, 0, 0.7372549, 1, 1,
0.1113694, -1.041452, 3.965157, 0, 0.7294118, 1, 1,
0.1222476, -0.8176718, 1.14289, 0, 0.7254902, 1, 1,
0.1232304, -0.4695861, 3.479209, 0, 0.7176471, 1, 1,
0.1240494, -0.9584761, 2.088066, 0, 0.7137255, 1, 1,
0.1242296, -0.158262, 3.810491, 0, 0.7058824, 1, 1,
0.126319, -0.3742385, 3.253145, 0, 0.6980392, 1, 1,
0.1270006, -0.5672511, 3.442281, 0, 0.6941177, 1, 1,
0.1311328, 0.7908865, 1.148038, 0, 0.6862745, 1, 1,
0.1403881, -1.793739, 4.594769, 0, 0.682353, 1, 1,
0.1431764, -0.995444, 3.175931, 0, 0.6745098, 1, 1,
0.1443582, 1.027257, 0.7809802, 0, 0.6705883, 1, 1,
0.1453133, -1.891122, 4.253575, 0, 0.6627451, 1, 1,
0.1469918, -0.1772344, 2.172679, 0, 0.6588235, 1, 1,
0.1469962, 0.9460189, 0.6661576, 0, 0.6509804, 1, 1,
0.1495517, 0.4520526, 1.729289, 0, 0.6470588, 1, 1,
0.1499528, 0.3508597, 1.004336, 0, 0.6392157, 1, 1,
0.1512525, -1.14177, 3.011489, 0, 0.6352941, 1, 1,
0.151552, -0.3354731, 2.689897, 0, 0.627451, 1, 1,
0.1546757, -0.02323892, 2.953112, 0, 0.6235294, 1, 1,
0.1551617, -0.2549404, 1.803562, 0, 0.6156863, 1, 1,
0.1582099, -0.8381761, 3.282523, 0, 0.6117647, 1, 1,
0.1647294, 1.978586, -0.3332875, 0, 0.6039216, 1, 1,
0.1677135, 0.5456771, -0.4261369, 0, 0.5960785, 1, 1,
0.167887, 0.05580668, 1.264795, 0, 0.5921569, 1, 1,
0.1700113, -1.125926, 3.802193, 0, 0.5843138, 1, 1,
0.1705182, 1.186528, -1.144672, 0, 0.5803922, 1, 1,
0.1725459, -1.545672, 2.807656, 0, 0.572549, 1, 1,
0.1750526, -0.4796961, 2.413369, 0, 0.5686275, 1, 1,
0.1757663, 0.910409, 1.281606, 0, 0.5607843, 1, 1,
0.1780097, -0.3576781, 2.85566, 0, 0.5568628, 1, 1,
0.1807445, -1.295855, 3.879986, 0, 0.5490196, 1, 1,
0.1840599, 0.9498476, -2.025728, 0, 0.5450981, 1, 1,
0.1863837, 2.45259, 0.5956562, 0, 0.5372549, 1, 1,
0.1865639, 0.7365297, 1.915863, 0, 0.5333334, 1, 1,
0.1882322, 0.3267033, 0.7572157, 0, 0.5254902, 1, 1,
0.190135, -0.4665028, 2.857995, 0, 0.5215687, 1, 1,
0.1965552, -0.7434439, 2.643759, 0, 0.5137255, 1, 1,
0.1967096, -0.4558555, 0.9674153, 0, 0.509804, 1, 1,
0.1970508, -0.1942007, 2.840485, 0, 0.5019608, 1, 1,
0.200378, -0.8603776, 3.066386, 0, 0.4941176, 1, 1,
0.2023258, -0.2185106, 3.042572, 0, 0.4901961, 1, 1,
0.2040469, 0.8259686, 1.834057, 0, 0.4823529, 1, 1,
0.2081522, -1.143005, 2.753944, 0, 0.4784314, 1, 1,
0.2098915, -1.550054, 3.781957, 0, 0.4705882, 1, 1,
0.2110013, 0.4283792, 0.9480926, 0, 0.4666667, 1, 1,
0.2112539, -0.9354449, 3.579512, 0, 0.4588235, 1, 1,
0.2186437, 0.6803507, 1.937444, 0, 0.454902, 1, 1,
0.2195186, 0.8010086, 0.1544961, 0, 0.4470588, 1, 1,
0.2200696, -1.295348, 3.62066, 0, 0.4431373, 1, 1,
0.2209162, -0.921616, 1.97252, 0, 0.4352941, 1, 1,
0.2210271, -0.5844628, 3.447891, 0, 0.4313726, 1, 1,
0.2237432, 0.823643, 1.393109, 0, 0.4235294, 1, 1,
0.226422, 0.115099, -0.2822611, 0, 0.4196078, 1, 1,
0.2336884, 0.01641977, 0.7817674, 0, 0.4117647, 1, 1,
0.2364706, 1.667594, -0.02696391, 0, 0.4078431, 1, 1,
0.240266, -0.04351795, 0.184727, 0, 0.4, 1, 1,
0.248995, 1.243401, -0.4617574, 0, 0.3921569, 1, 1,
0.2496233, -0.5725724, 2.638302, 0, 0.3882353, 1, 1,
0.2537858, -1.639707, 3.865848, 0, 0.3803922, 1, 1,
0.2551798, -0.8709398, 3.015064, 0, 0.3764706, 1, 1,
0.2585124, -1.267154, 4.36125, 0, 0.3686275, 1, 1,
0.2605679, 1.23611, -0.3732749, 0, 0.3647059, 1, 1,
0.2632407, 0.3574267, 0.4608369, 0, 0.3568628, 1, 1,
0.2649707, 0.5151521, 0.2918257, 0, 0.3529412, 1, 1,
0.2665998, -0.5057678, 2.365621, 0, 0.345098, 1, 1,
0.267842, -0.4754312, 1.151627, 0, 0.3411765, 1, 1,
0.2693402, 0.5221545, 0.01079697, 0, 0.3333333, 1, 1,
0.2700065, 0.7044314, 0.5528091, 0, 0.3294118, 1, 1,
0.2711121, -0.3137996, 2.852837, 0, 0.3215686, 1, 1,
0.276952, 1.13898, 1.18301, 0, 0.3176471, 1, 1,
0.2809393, 0.9449978, -0.08242316, 0, 0.3098039, 1, 1,
0.2920505, 0.8769957, -0.0378194, 0, 0.3058824, 1, 1,
0.3080654, 0.9184732, -0.06926409, 0, 0.2980392, 1, 1,
0.3125706, -0.1248239, 2.621684, 0, 0.2901961, 1, 1,
0.3144378, 0.2541529, 1.177848, 0, 0.2862745, 1, 1,
0.3159595, 0.8433928, 1.042023, 0, 0.2784314, 1, 1,
0.3164235, -0.9677159, 2.24857, 0, 0.2745098, 1, 1,
0.3170378, 0.5334916, 0.7411839, 0, 0.2666667, 1, 1,
0.3175852, -0.0002097369, 1.088349, 0, 0.2627451, 1, 1,
0.3179325, 1.005446, -0.06747027, 0, 0.254902, 1, 1,
0.3217793, -0.9728563, 3.495097, 0, 0.2509804, 1, 1,
0.3247091, -1.129063, 2.387543, 0, 0.2431373, 1, 1,
0.3251178, 0.7737879, -0.1191319, 0, 0.2392157, 1, 1,
0.3291296, -0.9855891, 2.184913, 0, 0.2313726, 1, 1,
0.3292792, -1.441508, 1.547714, 0, 0.227451, 1, 1,
0.3327535, 0.7379237, -1.292547, 0, 0.2196078, 1, 1,
0.3331407, 0.489196, 2.491804, 0, 0.2156863, 1, 1,
0.3338982, -0.2738518, 0.9061825, 0, 0.2078431, 1, 1,
0.3373324, -0.8527917, 3.890087, 0, 0.2039216, 1, 1,
0.3374388, -1.321831, 1.910126, 0, 0.1960784, 1, 1,
0.3393766, -1.161578, 2.849706, 0, 0.1882353, 1, 1,
0.3400682, 0.3688391, 0.6508116, 0, 0.1843137, 1, 1,
0.3411424, -1.31734, 2.41664, 0, 0.1764706, 1, 1,
0.3412841, 0.1379502, 1.62706, 0, 0.172549, 1, 1,
0.3441695, -0.03510325, 2.516179, 0, 0.1647059, 1, 1,
0.3477049, 0.8196859, -0.08920093, 0, 0.1607843, 1, 1,
0.3499936, 0.8220291, 2.329144, 0, 0.1529412, 1, 1,
0.3502708, -0.4695499, 1.671199, 0, 0.1490196, 1, 1,
0.3513244, 0.6404838, 0.4850143, 0, 0.1411765, 1, 1,
0.3524216, -0.9335055, 4.346915, 0, 0.1372549, 1, 1,
0.3525212, -0.4903997, 2.910079, 0, 0.1294118, 1, 1,
0.352782, 0.5595943, 0.8675506, 0, 0.1254902, 1, 1,
0.3539509, 0.7104942, 1.760796, 0, 0.1176471, 1, 1,
0.3580382, -0.5811307, 3.64632, 0, 0.1137255, 1, 1,
0.3642769, 0.6349874, 1.226238, 0, 0.1058824, 1, 1,
0.3660131, -0.5881752, 3.276454, 0, 0.09803922, 1, 1,
0.3670036, 0.6429114, 1.302169, 0, 0.09411765, 1, 1,
0.3675499, -1.682382, 2.92905, 0, 0.08627451, 1, 1,
0.369427, 0.06325028, 3.580645, 0, 0.08235294, 1, 1,
0.3694739, -0.1621304, 2.038156, 0, 0.07450981, 1, 1,
0.3773797, 2.257565, -0.6377648, 0, 0.07058824, 1, 1,
0.3778848, -0.3847037, 3.829746, 0, 0.0627451, 1, 1,
0.378003, 0.8099626, 0.09943506, 0, 0.05882353, 1, 1,
0.3817913, 0.355132, 0.5808364, 0, 0.05098039, 1, 1,
0.3853422, -1.691754, 1.849851, 0, 0.04705882, 1, 1,
0.3927957, 0.4957592, 0.4463423, 0, 0.03921569, 1, 1,
0.3994544, 1.2299, 0.4960666, 0, 0.03529412, 1, 1,
0.4025797, -1.525471, 2.641979, 0, 0.02745098, 1, 1,
0.4033412, 0.7112964, -0.99444, 0, 0.02352941, 1, 1,
0.4034612, -1.481221, 2.758925, 0, 0.01568628, 1, 1,
0.4119817, -1.01146, 0.5928803, 0, 0.01176471, 1, 1,
0.4145252, 1.015466, -0.3590203, 0, 0.003921569, 1, 1,
0.4150307, 1.497294, 0.3246656, 0.003921569, 0, 1, 1,
0.4208496, 0.4958154, 1.400241, 0.007843138, 0, 1, 1,
0.4257394, 1.269254, -0.9303976, 0.01568628, 0, 1, 1,
0.4325106, 0.6656903, 0.1208974, 0.01960784, 0, 1, 1,
0.4347282, -1.042891, 2.806068, 0.02745098, 0, 1, 1,
0.4395956, 0.8457626, 1.005033, 0.03137255, 0, 1, 1,
0.4403409, -2.025603, 1.856311, 0.03921569, 0, 1, 1,
0.4504914, -1.068404, 3.065458, 0.04313726, 0, 1, 1,
0.4559187, -0.7734941, 3.301351, 0.05098039, 0, 1, 1,
0.45863, 1.800116, 3.372993, 0.05490196, 0, 1, 1,
0.4632768, 1.466859, 0.04127372, 0.0627451, 0, 1, 1,
0.4710801, 0.2903914, 0.7279284, 0.06666667, 0, 1, 1,
0.4745491, -0.3024169, 1.499975, 0.07450981, 0, 1, 1,
0.4748508, 0.570797, 1.667441, 0.07843138, 0, 1, 1,
0.4761198, -0.5652763, 1.197703, 0.08627451, 0, 1, 1,
0.4768709, -0.09795633, 1.177511, 0.09019608, 0, 1, 1,
0.4780229, 0.04193552, 1.991708, 0.09803922, 0, 1, 1,
0.4811759, -0.2043049, 1.612063, 0.1058824, 0, 1, 1,
0.4829426, 0.3533196, 1.655793, 0.1098039, 0, 1, 1,
0.4846561, 1.268583, -0.2404654, 0.1176471, 0, 1, 1,
0.48474, 0.468354, 2.281931, 0.1215686, 0, 1, 1,
0.4852711, -0.9585152, 4.601223, 0.1294118, 0, 1, 1,
0.4855798, 0.5841943, 1.296403, 0.1333333, 0, 1, 1,
0.4865517, 0.4499667, 2.563555, 0.1411765, 0, 1, 1,
0.4875296, -1.40891, 3.468498, 0.145098, 0, 1, 1,
0.4883616, 0.2345392, 0.6343368, 0.1529412, 0, 1, 1,
0.4885921, 1.128734, -0.6494212, 0.1568628, 0, 1, 1,
0.4886736, 1.057952, 0.2469118, 0.1647059, 0, 1, 1,
0.4946866, 0.8671345, -0.05658924, 0.1686275, 0, 1, 1,
0.4953042, -1.75611, 3.64214, 0.1764706, 0, 1, 1,
0.4977792, 0.6434425, 0.9219332, 0.1803922, 0, 1, 1,
0.5009388, -1.280902, 1.579186, 0.1882353, 0, 1, 1,
0.5047231, -1.34033, 2.080333, 0.1921569, 0, 1, 1,
0.5062024, 0.715086, -1.148983, 0.2, 0, 1, 1,
0.5063235, -2.16124, 3.150166, 0.2078431, 0, 1, 1,
0.5078751, -1.106694, 1.784742, 0.2117647, 0, 1, 1,
0.5083274, 2.341062, -0.5051978, 0.2196078, 0, 1, 1,
0.5101612, 0.2407479, 2.137697, 0.2235294, 0, 1, 1,
0.5118026, -0.6162409, 2.412676, 0.2313726, 0, 1, 1,
0.5143575, 0.511218, -0.3465624, 0.2352941, 0, 1, 1,
0.5255381, -0.758038, 2.629929, 0.2431373, 0, 1, 1,
0.5257317, 0.5050726, 0.3217368, 0.2470588, 0, 1, 1,
0.5272093, -1.868511, 4.285093, 0.254902, 0, 1, 1,
0.5272703, -2.484789, 2.681468, 0.2588235, 0, 1, 1,
0.5277293, 0.6602314, 0.2385364, 0.2666667, 0, 1, 1,
0.5328803, 0.2392047, 0.0978388, 0.2705882, 0, 1, 1,
0.5347985, -0.3938735, 1.760135, 0.2784314, 0, 1, 1,
0.537229, -0.9369844, 2.816065, 0.282353, 0, 1, 1,
0.538018, -0.6536755, 2.732304, 0.2901961, 0, 1, 1,
0.5388924, -1.826727, 2.455278, 0.2941177, 0, 1, 1,
0.5452018, -0.3844295, 3.02207, 0.3019608, 0, 1, 1,
0.5479293, 0.01164825, 1.645337, 0.3098039, 0, 1, 1,
0.5509692, 0.4355704, 0.03187459, 0.3137255, 0, 1, 1,
0.5555607, 0.8414208, -0.2765958, 0.3215686, 0, 1, 1,
0.5574303, 1.030744, 0.6055294, 0.3254902, 0, 1, 1,
0.557533, 0.4851974, 0.4338948, 0.3333333, 0, 1, 1,
0.5598561, -0.7145001, 2.733622, 0.3372549, 0, 1, 1,
0.5609033, 0.6997894, 1.525314, 0.345098, 0, 1, 1,
0.5637952, -0.9772067, 1.549958, 0.3490196, 0, 1, 1,
0.5646565, -0.1481422, 1.211895, 0.3568628, 0, 1, 1,
0.5649025, -0.8185296, 1.680639, 0.3607843, 0, 1, 1,
0.5664861, 1.520322, 1.719139, 0.3686275, 0, 1, 1,
0.5805455, -1.585509, 3.543652, 0.372549, 0, 1, 1,
0.5816969, 0.8140535, 1.686676, 0.3803922, 0, 1, 1,
0.5841729, 0.2819871, 0.9012555, 0.3843137, 0, 1, 1,
0.5854079, -0.004579732, 2.976223, 0.3921569, 0, 1, 1,
0.5936883, -1.05583, 2.478008, 0.3960784, 0, 1, 1,
0.5992404, 0.7145941, 0.8853517, 0.4039216, 0, 1, 1,
0.5994881, -0.3260835, 4.345815, 0.4117647, 0, 1, 1,
0.6039703, 1.090209, 0.3071728, 0.4156863, 0, 1, 1,
0.6071301, -1.289605, 4.203315, 0.4235294, 0, 1, 1,
0.6094481, 2.727993, 1.518855, 0.427451, 0, 1, 1,
0.6106087, 0.7822827, -1.156458, 0.4352941, 0, 1, 1,
0.6156769, 0.3251504, 0.307065, 0.4392157, 0, 1, 1,
0.6201993, -0.8888911, 1.289396, 0.4470588, 0, 1, 1,
0.6211374, 1.21477, -0.1115497, 0.4509804, 0, 1, 1,
0.6253008, 0.3951949, -0.04848257, 0.4588235, 0, 1, 1,
0.6351902, 0.03037187, 0.4861628, 0.4627451, 0, 1, 1,
0.6353465, 0.1768452, 0.3333491, 0.4705882, 0, 1, 1,
0.6355135, -0.7119497, 3.547609, 0.4745098, 0, 1, 1,
0.6386714, -0.9170323, 3.958327, 0.4823529, 0, 1, 1,
0.6412411, -0.4406444, 1.684102, 0.4862745, 0, 1, 1,
0.6429789, -0.3512606, 3.923454, 0.4941176, 0, 1, 1,
0.6455325, 0.8488562, 1.217231, 0.5019608, 0, 1, 1,
0.6495862, 0.7076786, 3.139901, 0.5058824, 0, 1, 1,
0.6496558, 0.2721019, 0.5853456, 0.5137255, 0, 1, 1,
0.6591102, -0.08577019, 0.4817913, 0.5176471, 0, 1, 1,
0.661009, -0.7999268, 3.762317, 0.5254902, 0, 1, 1,
0.661427, 0.8309111, 1.857603, 0.5294118, 0, 1, 1,
0.6652448, 1.124276, 0.6406526, 0.5372549, 0, 1, 1,
0.6664265, 0.5375177, -0.2975295, 0.5411765, 0, 1, 1,
0.6707964, 0.4125513, 1.957302, 0.5490196, 0, 1, 1,
0.6731483, 1.267959, 0.08565514, 0.5529412, 0, 1, 1,
0.6830329, -1.013861, 2.623353, 0.5607843, 0, 1, 1,
0.6839857, 0.5005757, 1.749966, 0.5647059, 0, 1, 1,
0.6940138, -0.179996, 2.13093, 0.572549, 0, 1, 1,
0.6991256, 1.023666, 1.879866, 0.5764706, 0, 1, 1,
0.7006891, 0.8795832, 0.366123, 0.5843138, 0, 1, 1,
0.7050121, -1.787371, 3.381471, 0.5882353, 0, 1, 1,
0.7063328, -0.4443479, 0.772149, 0.5960785, 0, 1, 1,
0.7067587, -0.5912518, 3.420716, 0.6039216, 0, 1, 1,
0.7080543, -1.069945, 4.924792, 0.6078432, 0, 1, 1,
0.7100046, -1.102662, 1.657956, 0.6156863, 0, 1, 1,
0.715009, -0.9699687, 1.704353, 0.6196079, 0, 1, 1,
0.7187977, 0.5089754, 0.1000919, 0.627451, 0, 1, 1,
0.7219614, -0.1725162, 3.893477, 0.6313726, 0, 1, 1,
0.7256362, -0.394114, 3.056559, 0.6392157, 0, 1, 1,
0.7369785, 1.012151, 2.151853, 0.6431373, 0, 1, 1,
0.7421247, 0.02498298, 3.208925, 0.6509804, 0, 1, 1,
0.7421249, 1.869287, -0.4397045, 0.654902, 0, 1, 1,
0.7525569, -0.05321908, 0.889582, 0.6627451, 0, 1, 1,
0.755449, 0.6710457, 0.2899128, 0.6666667, 0, 1, 1,
0.7621649, 0.9363658, -0.3623615, 0.6745098, 0, 1, 1,
0.7741356, -0.9410418, 4.405205, 0.6784314, 0, 1, 1,
0.7759513, 1.434885, 1.41314, 0.6862745, 0, 1, 1,
0.7760514, -0.2395982, 2.376131, 0.6901961, 0, 1, 1,
0.7870516, -0.06587033, 2.596756, 0.6980392, 0, 1, 1,
0.7883762, 0.2312837, 1.418025, 0.7058824, 0, 1, 1,
0.7885122, -0.197126, 3.043687, 0.7098039, 0, 1, 1,
0.7941346, 0.2388002, 0.6848972, 0.7176471, 0, 1, 1,
0.8006434, 0.1930189, 0.6419632, 0.7215686, 0, 1, 1,
0.8105435, -0.264111, 1.129238, 0.7294118, 0, 1, 1,
0.8129231, 0.8544495, -0.3427501, 0.7333333, 0, 1, 1,
0.8141132, -0.4720579, 1.728358, 0.7411765, 0, 1, 1,
0.8149354, -0.9270321, 2.247893, 0.7450981, 0, 1, 1,
0.8161251, -1.743201, 3.979537, 0.7529412, 0, 1, 1,
0.8210202, 0.03146312, 0.9144593, 0.7568628, 0, 1, 1,
0.8299809, -1.429671, 2.231859, 0.7647059, 0, 1, 1,
0.8366835, -0.2848836, 1.421763, 0.7686275, 0, 1, 1,
0.8369082, 0.8334686, 1.601953, 0.7764706, 0, 1, 1,
0.8398322, -1.115604, 2.543775, 0.7803922, 0, 1, 1,
0.8426552, -0.3229965, 2.951542, 0.7882353, 0, 1, 1,
0.8494575, -1.047854, 2.583163, 0.7921569, 0, 1, 1,
0.8519318, 0.2303315, 0.6822964, 0.8, 0, 1, 1,
0.8541648, -1.211141, 3.590725, 0.8078431, 0, 1, 1,
0.8579874, -0.2292658, 1.191218, 0.8117647, 0, 1, 1,
0.860356, -0.2554415, 2.857754, 0.8196079, 0, 1, 1,
0.8749658, 0.6700085, 2.146947, 0.8235294, 0, 1, 1,
0.8798046, 0.1852742, 0.1529594, 0.8313726, 0, 1, 1,
0.8798384, 0.2639695, 0.01676703, 0.8352941, 0, 1, 1,
0.8820189, 1.175419, 0.3608273, 0.8431373, 0, 1, 1,
0.8823509, 0.2452625, 3.123264, 0.8470588, 0, 1, 1,
0.8827176, 0.6998893, 2.441816, 0.854902, 0, 1, 1,
0.8833585, 1.00832, 0.1271314, 0.8588235, 0, 1, 1,
0.8918918, 0.4573757, 0.6713921, 0.8666667, 0, 1, 1,
0.894987, 0.64553, -0.9717399, 0.8705882, 0, 1, 1,
0.9002985, -0.4188965, 2.752182, 0.8784314, 0, 1, 1,
0.9062815, -1.003132, 1.300629, 0.8823529, 0, 1, 1,
0.9078586, -0.3728948, 2.201008, 0.8901961, 0, 1, 1,
0.9086059, -0.3128876, 0.5180855, 0.8941177, 0, 1, 1,
0.9119174, -0.6874748, 3.476101, 0.9019608, 0, 1, 1,
0.9198796, 0.3855481, 0.1459, 0.9098039, 0, 1, 1,
0.9230943, 0.2010053, 0.5197294, 0.9137255, 0, 1, 1,
0.9277804, 0.7553333, 0.6723512, 0.9215686, 0, 1, 1,
0.9318234, 0.9601719, 0.2061875, 0.9254902, 0, 1, 1,
0.9369044, 1.08956, 0.47933, 0.9333333, 0, 1, 1,
0.9374811, -0.2146427, 2.705033, 0.9372549, 0, 1, 1,
0.9468003, -2.152336, 3.754201, 0.945098, 0, 1, 1,
0.9487144, -1.091128, 3.452678, 0.9490196, 0, 1, 1,
0.9491662, 0.937514, -0.08225323, 0.9568627, 0, 1, 1,
0.9530079, -0.7076087, 1.050175, 0.9607843, 0, 1, 1,
0.9548156, 0.4764423, -0.3593905, 0.9686275, 0, 1, 1,
0.9579136, 1.761446, 0.2061329, 0.972549, 0, 1, 1,
0.9599651, -0.8231835, 1.205714, 0.9803922, 0, 1, 1,
0.966142, -1.043805, 3.098709, 0.9843137, 0, 1, 1,
0.9671447, -0.357315, 1.505724, 0.9921569, 0, 1, 1,
0.9685305, 1.296418, -1.170045, 0.9960784, 0, 1, 1,
0.9742245, -0.3994347, 1.953184, 1, 0, 0.9960784, 1,
0.9743605, 0.1434622, 2.087798, 1, 0, 0.9882353, 1,
0.9768141, 1.532142, 2.250647, 1, 0, 0.9843137, 1,
0.9784674, -0.00300872, 2.654776, 1, 0, 0.9764706, 1,
0.9851988, 0.5524881, 2.534845, 1, 0, 0.972549, 1,
0.9892702, -0.5712011, 2.24144, 1, 0, 0.9647059, 1,
0.9912113, -1.873773, 3.171143, 1, 0, 0.9607843, 1,
1.005569, -1.684133, 2.088135, 1, 0, 0.9529412, 1,
1.007625, 0.3974508, 0.4334214, 1, 0, 0.9490196, 1,
1.011325, -1.299496, 4.16799, 1, 0, 0.9411765, 1,
1.016265, 1.248595, -1.359106, 1, 0, 0.9372549, 1,
1.024667, -2.327209, 3.554267, 1, 0, 0.9294118, 1,
1.026885, 1.409976, 0.01658406, 1, 0, 0.9254902, 1,
1.028344, 1.636499, 1.259836, 1, 0, 0.9176471, 1,
1.030336, -0.4934244, 2.067458, 1, 0, 0.9137255, 1,
1.035118, 0.6592137, 3.189924, 1, 0, 0.9058824, 1,
1.041436, -0.1056529, 1.904105, 1, 0, 0.9019608, 1,
1.046027, -1.259041, 3.307159, 1, 0, 0.8941177, 1,
1.051259, -0.8726915, 2.827925, 1, 0, 0.8862745, 1,
1.05187, 0.5261396, 1.822804, 1, 0, 0.8823529, 1,
1.052316, 0.2390418, 0.161918, 1, 0, 0.8745098, 1,
1.053338, 0.1931394, 1.677863, 1, 0, 0.8705882, 1,
1.054569, 0.0138739, 2.956587, 1, 0, 0.8627451, 1,
1.066837, -1.049471, 1.639607, 1, 0, 0.8588235, 1,
1.074134, -0.5534234, 2.066816, 1, 0, 0.8509804, 1,
1.088071, -0.0754528, 1.527546, 1, 0, 0.8470588, 1,
1.088791, 1.828919, 0.8141808, 1, 0, 0.8392157, 1,
1.090444, 1.192388, -0.5143135, 1, 0, 0.8352941, 1,
1.091725, -0.2845193, 0.8483397, 1, 0, 0.827451, 1,
1.094366, -0.2177998, 0.4711866, 1, 0, 0.8235294, 1,
1.095589, 0.5339245, 1.795043, 1, 0, 0.8156863, 1,
1.105621, -1.246391, 1.092743, 1, 0, 0.8117647, 1,
1.10677, -0.7412914, 2.699013, 1, 0, 0.8039216, 1,
1.107165, -1.127503, 2.840204, 1, 0, 0.7960784, 1,
1.107887, 1.16907, 0.3949899, 1, 0, 0.7921569, 1,
1.114609, -1.02345, 4.443568, 1, 0, 0.7843137, 1,
1.116453, 2.071357, 2.1506, 1, 0, 0.7803922, 1,
1.118184, 0.1183918, -0.2695948, 1, 0, 0.772549, 1,
1.137832, 0.4193783, 1.057057, 1, 0, 0.7686275, 1,
1.143979, 0.008269699, 3.64286, 1, 0, 0.7607843, 1,
1.150154, -1.662903, 2.001323, 1, 0, 0.7568628, 1,
1.150611, 3.073258, 0.4772467, 1, 0, 0.7490196, 1,
1.161254, 0.664056, 1.996298, 1, 0, 0.7450981, 1,
1.164736, 0.1749627, 0.2561129, 1, 0, 0.7372549, 1,
1.16512, 0.502421, 1.732045, 1, 0, 0.7333333, 1,
1.168662, -1.29103, 2.725602, 1, 0, 0.7254902, 1,
1.17267, 0.1762127, 2.382425, 1, 0, 0.7215686, 1,
1.184213, 0.3156389, 0.4384191, 1, 0, 0.7137255, 1,
1.185523, 1.046522, -0.9258468, 1, 0, 0.7098039, 1,
1.185913, 1.941516, 0.1236722, 1, 0, 0.7019608, 1,
1.186072, -0.552476, 3.331663, 1, 0, 0.6941177, 1,
1.18983, -2.133817, 2.122122, 1, 0, 0.6901961, 1,
1.19955, -0.09795862, 1.915632, 1, 0, 0.682353, 1,
1.199554, 1.27064, 1.730956, 1, 0, 0.6784314, 1,
1.20123, 0.3425436, 1.382457, 1, 0, 0.6705883, 1,
1.215893, -0.9317653, 2.24594, 1, 0, 0.6666667, 1,
1.217779, -0.2952359, 1.079058, 1, 0, 0.6588235, 1,
1.220556, -0.0942931, 1.147853, 1, 0, 0.654902, 1,
1.224459, -0.8376389, 2.234338, 1, 0, 0.6470588, 1,
1.229178, 0.3328977, 1.101465, 1, 0, 0.6431373, 1,
1.242875, -0.9821461, 2.00726, 1, 0, 0.6352941, 1,
1.244902, 1.422022, -1.029292, 1, 0, 0.6313726, 1,
1.246295, 0.7339172, 1.581083, 1, 0, 0.6235294, 1,
1.247224, 1.101198, 0.9496548, 1, 0, 0.6196079, 1,
1.249243, 0.9640111, 0.9465377, 1, 0, 0.6117647, 1,
1.253128, -0.5965961, 1.953414, 1, 0, 0.6078432, 1,
1.262114, 1.22872, 1.158233, 1, 0, 0.6, 1,
1.265243, 0.2288145, 1.472647, 1, 0, 0.5921569, 1,
1.267066, 0.528645, 1.340752, 1, 0, 0.5882353, 1,
1.271322, 0.7978618, 0.8484123, 1, 0, 0.5803922, 1,
1.282696, 0.7697593, 1.026958, 1, 0, 0.5764706, 1,
1.299446, -0.4584197, 3.27591, 1, 0, 0.5686275, 1,
1.306408, -2.166545, 0.6576524, 1, 0, 0.5647059, 1,
1.313178, -0.2429969, 3.704412, 1, 0, 0.5568628, 1,
1.322514, -0.1650929, 3.52916, 1, 0, 0.5529412, 1,
1.323383, 1.759728, 1.140409, 1, 0, 0.5450981, 1,
1.328446, -0.8645427, 3.101027, 1, 0, 0.5411765, 1,
1.340557, -0.07812865, 2.781242, 1, 0, 0.5333334, 1,
1.34352, -1.27548, 3.072109, 1, 0, 0.5294118, 1,
1.345707, 1.378697, 0.3257984, 1, 0, 0.5215687, 1,
1.346621, 0.159826, 2.22037, 1, 0, 0.5176471, 1,
1.348312, 1.158478, 0.7608336, 1, 0, 0.509804, 1,
1.353768, -1.371247, 3.89816, 1, 0, 0.5058824, 1,
1.354428, -0.09845752, 1.896951, 1, 0, 0.4980392, 1,
1.37295, -0.5189694, 2.128059, 1, 0, 0.4901961, 1,
1.386274, -0.1963508, 3.26735, 1, 0, 0.4862745, 1,
1.391421, 0.1048703, 1.648455, 1, 0, 0.4784314, 1,
1.394967, -0.5734798, 2.827054, 1, 0, 0.4745098, 1,
1.398229, 0.4115039, 0.1282701, 1, 0, 0.4666667, 1,
1.415749, -0.1621525, 2.73492, 1, 0, 0.4627451, 1,
1.419618, -2.219882, 2.72083, 1, 0, 0.454902, 1,
1.422529, 0.5856909, 2.49477, 1, 0, 0.4509804, 1,
1.433261, 0.3027085, 1.843307, 1, 0, 0.4431373, 1,
1.442262, 1.14895, 2.750746, 1, 0, 0.4392157, 1,
1.444609, -0.8519245, 3.409045, 1, 0, 0.4313726, 1,
1.445111, 0.2308474, 0.9390434, 1, 0, 0.427451, 1,
1.459815, 0.2471341, 2.788149, 1, 0, 0.4196078, 1,
1.465442, 0.5054562, 1.731963, 1, 0, 0.4156863, 1,
1.472714, -0.789272, 2.653352, 1, 0, 0.4078431, 1,
1.478683, -0.769523, 3.076894, 1, 0, 0.4039216, 1,
1.483892, 0.2644791, 0.6859576, 1, 0, 0.3960784, 1,
1.484705, -1.262472, 1.444493, 1, 0, 0.3882353, 1,
1.51127, -2.053111, 3.191196, 1, 0, 0.3843137, 1,
1.519756, -1.270702, 2.730189, 1, 0, 0.3764706, 1,
1.520378, -0.2733789, 1.355166, 1, 0, 0.372549, 1,
1.556518, -0.4300963, 1.007702, 1, 0, 0.3647059, 1,
1.558217, -2.302475, 3.735209, 1, 0, 0.3607843, 1,
1.56108, -1.368817, 2.82338, 1, 0, 0.3529412, 1,
1.570917, -0.2325166, 2.20752, 1, 0, 0.3490196, 1,
1.57451, -0.2527688, 2.065549, 1, 0, 0.3411765, 1,
1.576842, 0.3868141, -0.8915655, 1, 0, 0.3372549, 1,
1.60688, -0.8633904, 1.193782, 1, 0, 0.3294118, 1,
1.612773, 1.987704, -2.029506, 1, 0, 0.3254902, 1,
1.617059, -0.8661109, 2.513985, 1, 0, 0.3176471, 1,
1.629118, -0.3886101, 2.105348, 1, 0, 0.3137255, 1,
1.635506, 0.6559063, 0.7661723, 1, 0, 0.3058824, 1,
1.640781, 1.655495, 0.4029938, 1, 0, 0.2980392, 1,
1.643847, 0.4934146, 1.643972, 1, 0, 0.2941177, 1,
1.648746, -0.761837, 2.426083, 1, 0, 0.2862745, 1,
1.659823, 1.099489, 1.107862, 1, 0, 0.282353, 1,
1.663724, -0.5886814, 0.6162447, 1, 0, 0.2745098, 1,
1.68309, 0.7659962, 0.8098274, 1, 0, 0.2705882, 1,
1.699119, -0.07307677, 1.811005, 1, 0, 0.2627451, 1,
1.699439, 0.6254333, 1.55978, 1, 0, 0.2588235, 1,
1.703159, -1.377247, 2.19001, 1, 0, 0.2509804, 1,
1.705217, -0.4102115, 2.324409, 1, 0, 0.2470588, 1,
1.710446, 0.06056895, 1.544173, 1, 0, 0.2392157, 1,
1.73064, -0.7889128, 3.896187, 1, 0, 0.2352941, 1,
1.752783, -0.7719335, 2.752509, 1, 0, 0.227451, 1,
1.769043, -1.267702, 2.189268, 1, 0, 0.2235294, 1,
1.777856, 0.120427, -0.5169116, 1, 0, 0.2156863, 1,
1.780044, -0.07607217, 2.033336, 1, 0, 0.2117647, 1,
1.783333, 0.0910605, 1.738902, 1, 0, 0.2039216, 1,
1.784228, 0.9790358, 1.989165, 1, 0, 0.1960784, 1,
1.794251, -0.7512065, 4.186435, 1, 0, 0.1921569, 1,
1.808548, 0.06628227, 1.6856, 1, 0, 0.1843137, 1,
1.811404, -0.2009698, 2.127837, 1, 0, 0.1803922, 1,
1.827277, -0.1616805, 1.883633, 1, 0, 0.172549, 1,
1.832838, 1.609154, -0.3571487, 1, 0, 0.1686275, 1,
1.863511, -0.599314, 3.94392, 1, 0, 0.1607843, 1,
1.877465, 0.2075392, 2.26744, 1, 0, 0.1568628, 1,
1.908873, -1.523265, 3.636871, 1, 0, 0.1490196, 1,
1.953223, -0.3238914, 2.987018, 1, 0, 0.145098, 1,
1.953779, 0.555611, 3.177248, 1, 0, 0.1372549, 1,
1.978942, 1.97546, -0.1374248, 1, 0, 0.1333333, 1,
2.03561, -0.03823779, 2.320373, 1, 0, 0.1254902, 1,
2.079815, -0.3519342, 3.439382, 1, 0, 0.1215686, 1,
2.142345, -0.8004969, 1.051579, 1, 0, 0.1137255, 1,
2.184003, -0.4441916, 2.1961, 1, 0, 0.1098039, 1,
2.200469, 0.9291871, 1.151966, 1, 0, 0.1019608, 1,
2.203134, -0.3137342, 2.56039, 1, 0, 0.09411765, 1,
2.272332, 0.4638298, 1.734484, 1, 0, 0.09019608, 1,
2.324602, -2.437241, 4.329797, 1, 0, 0.08235294, 1,
2.364181, 0.3742679, 2.211337, 1, 0, 0.07843138, 1,
2.441046, 0.0040511, 0.2361813, 1, 0, 0.07058824, 1,
2.458812, -0.8883128, 3.352798, 1, 0, 0.06666667, 1,
2.460818, 1.332455, 0.7652828, 1, 0, 0.05882353, 1,
2.464454, -0.1381955, -0.5299119, 1, 0, 0.05490196, 1,
2.466725, -0.5317897, 1.642582, 1, 0, 0.04705882, 1,
2.482227, -0.3452689, 3.173918, 1, 0, 0.04313726, 1,
2.537398, -2.510234, 3.273903, 1, 0, 0.03529412, 1,
2.620013, 0.8890817, 2.234505, 1, 0, 0.03137255, 1,
2.7114, -0.5881876, 0.3084533, 1, 0, 0.02352941, 1,
2.867814, 0.2112302, 0.5101333, 1, 0, 0.01960784, 1,
2.888118, -2.068627, 3.422414, 1, 0, 0.01176471, 1,
3.033015, -1.329429, 1.35985, 1, 0, 0.007843138, 1
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
0.04843342, -4.082699, -6.914825, 0, -0.5, 0.5, 0.5,
0.04843342, -4.082699, -6.914825, 1, -0.5, 0.5, 0.5,
0.04843342, -4.082699, -6.914825, 1, 1.5, 0.5, 0.5,
0.04843342, -4.082699, -6.914825, 0, 1.5, 0.5, 0.5
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
-3.947921, 0.3135819, -6.914825, 0, -0.5, 0.5, 0.5,
-3.947921, 0.3135819, -6.914825, 1, -0.5, 0.5, 0.5,
-3.947921, 0.3135819, -6.914825, 1, 1.5, 0.5, 0.5,
-3.947921, 0.3135819, -6.914825, 0, 1.5, 0.5, 0.5
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
-3.947921, -4.082699, 0.2908263, 0, -0.5, 0.5, 0.5,
-3.947921, -4.082699, 0.2908263, 1, -0.5, 0.5, 0.5,
-3.947921, -4.082699, 0.2908263, 1, 1.5, 0.5, 0.5,
-3.947921, -4.082699, 0.2908263, 0, 1.5, 0.5, 0.5
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
-2, -3.068172, -5.251982,
3, -3.068172, -5.251982,
-2, -3.068172, -5.251982,
-2, -3.23726, -5.529123,
-1, -3.068172, -5.251982,
-1, -3.23726, -5.529123,
0, -3.068172, -5.251982,
0, -3.23726, -5.529123,
1, -3.068172, -5.251982,
1, -3.23726, -5.529123,
2, -3.068172, -5.251982,
2, -3.23726, -5.529123,
3, -3.068172, -5.251982,
3, -3.23726, -5.529123
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
-2, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
-2, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
-2, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
-2, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5,
-1, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
-1, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
-1, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
-1, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5,
0, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
0, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
0, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
0, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5,
1, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
1, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
1, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
1, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5,
2, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
2, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
2, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
2, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5,
3, -3.575436, -6.083404, 0, -0.5, 0.5, 0.5,
3, -3.575436, -6.083404, 1, -0.5, 0.5, 0.5,
3, -3.575436, -6.083404, 1, 1.5, 0.5, 0.5,
3, -3.575436, -6.083404, 0, 1.5, 0.5, 0.5
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
-3.025685, -2, -5.251982,
-3.025685, 3, -5.251982,
-3.025685, -2, -5.251982,
-3.179391, -2, -5.529123,
-3.025685, -1, -5.251982,
-3.179391, -1, -5.529123,
-3.025685, 0, -5.251982,
-3.179391, 0, -5.529123,
-3.025685, 1, -5.251982,
-3.179391, 1, -5.529123,
-3.025685, 2, -5.251982,
-3.179391, 2, -5.529123,
-3.025685, 3, -5.251982,
-3.179391, 3, -5.529123
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
-3.486803, -2, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, -2, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, -2, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, -2, -6.083404, 0, 1.5, 0.5, 0.5,
-3.486803, -1, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, -1, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, -1, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, -1, -6.083404, 0, 1.5, 0.5, 0.5,
-3.486803, 0, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, 0, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, 0, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, 0, -6.083404, 0, 1.5, 0.5, 0.5,
-3.486803, 1, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, 1, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, 1, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, 1, -6.083404, 0, 1.5, 0.5, 0.5,
-3.486803, 2, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, 2, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, 2, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, 2, -6.083404, 0, 1.5, 0.5, 0.5,
-3.486803, 3, -6.083404, 0, -0.5, 0.5, 0.5,
-3.486803, 3, -6.083404, 1, -0.5, 0.5, 0.5,
-3.486803, 3, -6.083404, 1, 1.5, 0.5, 0.5,
-3.486803, 3, -6.083404, 0, 1.5, 0.5, 0.5
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
-3.025685, -3.068172, -4,
-3.025685, -3.068172, 4,
-3.025685, -3.068172, -4,
-3.179391, -3.23726, -4,
-3.025685, -3.068172, -2,
-3.179391, -3.23726, -2,
-3.025685, -3.068172, 0,
-3.179391, -3.23726, 0,
-3.025685, -3.068172, 2,
-3.179391, -3.23726, 2,
-3.025685, -3.068172, 4,
-3.179391, -3.23726, 4
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
-3.486803, -3.575436, -4, 0, -0.5, 0.5, 0.5,
-3.486803, -3.575436, -4, 1, -0.5, 0.5, 0.5,
-3.486803, -3.575436, -4, 1, 1.5, 0.5, 0.5,
-3.486803, -3.575436, -4, 0, 1.5, 0.5, 0.5,
-3.486803, -3.575436, -2, 0, -0.5, 0.5, 0.5,
-3.486803, -3.575436, -2, 1, -0.5, 0.5, 0.5,
-3.486803, -3.575436, -2, 1, 1.5, 0.5, 0.5,
-3.486803, -3.575436, -2, 0, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 0, 0, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 0, 1, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 0, 1, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 0, 0, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 2, 0, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 2, 1, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 2, 1, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 2, 0, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 4, 0, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 4, 1, -0.5, 0.5, 0.5,
-3.486803, -3.575436, 4, 1, 1.5, 0.5, 0.5,
-3.486803, -3.575436, 4, 0, 1.5, 0.5, 0.5
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
-3.025685, -3.068172, -5.251982,
-3.025685, 3.695336, -5.251982,
-3.025685, -3.068172, 5.833635,
-3.025685, 3.695336, 5.833635,
-3.025685, -3.068172, -5.251982,
-3.025685, -3.068172, 5.833635,
-3.025685, 3.695336, -5.251982,
-3.025685, 3.695336, 5.833635,
-3.025685, -3.068172, -5.251982,
3.122552, -3.068172, -5.251982,
-3.025685, -3.068172, 5.833635,
3.122552, -3.068172, 5.833635,
-3.025685, 3.695336, -5.251982,
3.122552, 3.695336, -5.251982,
-3.025685, 3.695336, 5.833635,
3.122552, 3.695336, 5.833635,
3.122552, -3.068172, -5.251982,
3.122552, 3.695336, -5.251982,
3.122552, -3.068172, 5.833635,
3.122552, 3.695336, 5.833635,
3.122552, -3.068172, -5.251982,
3.122552, -3.068172, 5.833635,
3.122552, 3.695336, -5.251982,
3.122552, 3.695336, 5.833635
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
var radius = 7.672184;
var distance = 34.13441;
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
mvMatrix.translate( -0.04843342, -0.3135819, -0.2908263 );
mvMatrix.scale( 1.349218, 1.226481, 0.7482953 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13441);
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


