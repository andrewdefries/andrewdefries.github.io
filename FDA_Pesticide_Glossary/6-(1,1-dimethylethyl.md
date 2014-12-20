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
-3.602027, -0.24992, -2.300355, 1, 0, 0, 1,
-3.037137, -1.556493, -2.315307, 1, 0.007843138, 0, 1,
-2.862275, -0.1726558, -0.8909354, 1, 0.01176471, 0, 1,
-2.837285, 0.3024029, -1.19645, 1, 0.01960784, 0, 1,
-2.720159, 0.3137002, -1.710733, 1, 0.02352941, 0, 1,
-2.659649, 0.3180932, -0.211886, 1, 0.03137255, 0, 1,
-2.545855, 0.2971686, -1.875738, 1, 0.03529412, 0, 1,
-2.495945, -0.1639549, -2.617074, 1, 0.04313726, 0, 1,
-2.446342, -0.04639116, -3.218316, 1, 0.04705882, 0, 1,
-2.421493, 0.4354176, -1.20789, 1, 0.05490196, 0, 1,
-2.376844, -0.04395214, 0.5146877, 1, 0.05882353, 0, 1,
-2.340016, 0.9282451, -1.961461, 1, 0.06666667, 0, 1,
-2.301954, 0.8476179, 0.003235015, 1, 0.07058824, 0, 1,
-2.266899, -2.177502, -3.336479, 1, 0.07843138, 0, 1,
-2.249421, -0.2646495, 0.05896522, 1, 0.08235294, 0, 1,
-2.211115, 0.78383, 0.5305161, 1, 0.09019608, 0, 1,
-2.181659, 2.259186, -0.3610315, 1, 0.09411765, 0, 1,
-2.152642, -0.4200811, -1.866562, 1, 0.1019608, 0, 1,
-2.136906, 1.179669, -3.202965, 1, 0.1098039, 0, 1,
-2.128136, -0.2032841, -1.727677, 1, 0.1137255, 0, 1,
-2.077886, -0.06969087, -3.382492, 1, 0.1215686, 0, 1,
-2.055826, 1.947869, 0.09390391, 1, 0.1254902, 0, 1,
-2.049716, 0.6767451, 0.389176, 1, 0.1333333, 0, 1,
-2.04812, 1.094526, -0.5827077, 1, 0.1372549, 0, 1,
-2.032421, -0.5171582, -1.962721, 1, 0.145098, 0, 1,
-1.993551, 1.025037, -1.069134, 1, 0.1490196, 0, 1,
-1.965552, -0.1462773, -2.627904, 1, 0.1568628, 0, 1,
-1.963787, 0.7590141, -2.537134, 1, 0.1607843, 0, 1,
-1.945452, 0.7435967, -2.111663, 1, 0.1686275, 0, 1,
-1.929289, 0.07353327, -2.387518, 1, 0.172549, 0, 1,
-1.926343, 1.291229, -1.247552, 1, 0.1803922, 0, 1,
-1.895303, -1.488954, -1.87967, 1, 0.1843137, 0, 1,
-1.86714, -0.04105666, -3.229024, 1, 0.1921569, 0, 1,
-1.844572, 0.4126683, -0.7064987, 1, 0.1960784, 0, 1,
-1.840104, 0.2989601, -2.573333, 1, 0.2039216, 0, 1,
-1.839515, -0.6180311, -1.324634, 1, 0.2117647, 0, 1,
-1.829779, 0.1880508, -2.688907, 1, 0.2156863, 0, 1,
-1.825095, -1.701182, -1.651117, 1, 0.2235294, 0, 1,
-1.821795, -0.7530798, -1.278016, 1, 0.227451, 0, 1,
-1.805549, -0.7098365, -1.795813, 1, 0.2352941, 0, 1,
-1.752664, -1.098986, -1.153025, 1, 0.2392157, 0, 1,
-1.752277, 0.4287528, -0.1998187, 1, 0.2470588, 0, 1,
-1.722393, -3.238837, -2.542681, 1, 0.2509804, 0, 1,
-1.713954, -0.4439079, -2.599855, 1, 0.2588235, 0, 1,
-1.698126, 0.3995666, -0.5433194, 1, 0.2627451, 0, 1,
-1.691177, 0.3121291, -1.727965, 1, 0.2705882, 0, 1,
-1.683312, 0.4627115, -0.2142994, 1, 0.2745098, 0, 1,
-1.670889, 2.016976, -2.199762, 1, 0.282353, 0, 1,
-1.668249, 0.6621795, -1.284931, 1, 0.2862745, 0, 1,
-1.661118, -0.2767785, -1.876447, 1, 0.2941177, 0, 1,
-1.648791, 0.75257, 0.2204082, 1, 0.3019608, 0, 1,
-1.639611, 0.3928146, -2.181429, 1, 0.3058824, 0, 1,
-1.631271, -0.2737629, 0.35288, 1, 0.3137255, 0, 1,
-1.627024, -0.873049, -1.452106, 1, 0.3176471, 0, 1,
-1.612388, 1.882913, -1.182103, 1, 0.3254902, 0, 1,
-1.61155, 0.3314908, -1.746398, 1, 0.3294118, 0, 1,
-1.608642, 0.3736947, -0.101964, 1, 0.3372549, 0, 1,
-1.604601, 0.2242642, -1.851457, 1, 0.3411765, 0, 1,
-1.588445, -1.552491, -2.506025, 1, 0.3490196, 0, 1,
-1.581872, 1.062502, -1.367846, 1, 0.3529412, 0, 1,
-1.576803, -0.6831504, -2.601101, 1, 0.3607843, 0, 1,
-1.573802, 0.4144168, -2.078145, 1, 0.3647059, 0, 1,
-1.569668, 0.2874785, -1.528443, 1, 0.372549, 0, 1,
-1.55253, -0.6023678, -2.904762, 1, 0.3764706, 0, 1,
-1.534982, -0.3144086, 0.01897467, 1, 0.3843137, 0, 1,
-1.525553, 0.06836887, -0.7532963, 1, 0.3882353, 0, 1,
-1.521332, -0.3046383, -0.2553262, 1, 0.3960784, 0, 1,
-1.514521, 0.6006098, -1.424628, 1, 0.4039216, 0, 1,
-1.506716, -0.5775563, -3.247591, 1, 0.4078431, 0, 1,
-1.502576, 0.5142778, 0.4745401, 1, 0.4156863, 0, 1,
-1.487953, -1.904962, -2.824317, 1, 0.4196078, 0, 1,
-1.487031, 0.3837928, -3.078811, 1, 0.427451, 0, 1,
-1.485504, -0.8738016, -2.66074, 1, 0.4313726, 0, 1,
-1.485313, -1.867428, -1.021316, 1, 0.4392157, 0, 1,
-1.472699, 0.676045, -3.02446, 1, 0.4431373, 0, 1,
-1.46789, 0.9015176, -0.2948695, 1, 0.4509804, 0, 1,
-1.466459, 1.166983, -0.4538579, 1, 0.454902, 0, 1,
-1.464918, -0.5068596, -1.813634, 1, 0.4627451, 0, 1,
-1.462757, -0.7265006, -3.666547, 1, 0.4666667, 0, 1,
-1.461768, 0.1943447, -2.496627, 1, 0.4745098, 0, 1,
-1.452539, -0.7547791, -1.165116, 1, 0.4784314, 0, 1,
-1.445518, -0.6070988, -2.104387, 1, 0.4862745, 0, 1,
-1.443315, 1.199422, -0.1075694, 1, 0.4901961, 0, 1,
-1.426479, -0.03537869, -3.686903, 1, 0.4980392, 0, 1,
-1.422913, -0.1914161, -3.527736, 1, 0.5058824, 0, 1,
-1.421556, -0.1587801, -0.4350372, 1, 0.509804, 0, 1,
-1.421116, -1.101371, -1.531947, 1, 0.5176471, 0, 1,
-1.409819, 1.546512, -3.400517, 1, 0.5215687, 0, 1,
-1.407771, -1.383907, -1.99665, 1, 0.5294118, 0, 1,
-1.397375, -1.910401, -2.906357, 1, 0.5333334, 0, 1,
-1.374915, 1.071276, -1.523235, 1, 0.5411765, 0, 1,
-1.370302, 1.423412, -0.8231455, 1, 0.5450981, 0, 1,
-1.365747, -0.1928965, -1.573149, 1, 0.5529412, 0, 1,
-1.364197, -2.546136, -2.041118, 1, 0.5568628, 0, 1,
-1.353779, 1.242196, -1.816255, 1, 0.5647059, 0, 1,
-1.352443, -0.1887143, -1.264587, 1, 0.5686275, 0, 1,
-1.348365, -0.2999052, -1.318322, 1, 0.5764706, 0, 1,
-1.344238, 0.5113713, -1.23972, 1, 0.5803922, 0, 1,
-1.340025, -0.9467951, -1.782442, 1, 0.5882353, 0, 1,
-1.33819, -0.391975, -2.350009, 1, 0.5921569, 0, 1,
-1.337712, 1.222911, -1.992328, 1, 0.6, 0, 1,
-1.334298, 0.4456381, -2.259701, 1, 0.6078432, 0, 1,
-1.333917, 0.534642, -1.5686, 1, 0.6117647, 0, 1,
-1.328484, -0.3077372, -2.302909, 1, 0.6196079, 0, 1,
-1.320756, -0.8810366, -1.905309, 1, 0.6235294, 0, 1,
-1.318096, -1.030265, -2.018643, 1, 0.6313726, 0, 1,
-1.315465, 0.121132, -1.240749, 1, 0.6352941, 0, 1,
-1.30944, 0.001511874, -2.531401, 1, 0.6431373, 0, 1,
-1.301068, -1.142825, -2.321494, 1, 0.6470588, 0, 1,
-1.29811, 0.7199441, -1.861846, 1, 0.654902, 0, 1,
-1.294605, -0.8941311, -3.430402, 1, 0.6588235, 0, 1,
-1.289414, -0.8959433, -2.621806, 1, 0.6666667, 0, 1,
-1.288348, 0.1018981, -1.141688, 1, 0.6705883, 0, 1,
-1.283742, -0.1339662, -2.179316, 1, 0.6784314, 0, 1,
-1.281508, 0.2986138, -0.4745874, 1, 0.682353, 0, 1,
-1.280149, -0.2491574, -1.948499, 1, 0.6901961, 0, 1,
-1.253401, -0.7486256, -1.190046, 1, 0.6941177, 0, 1,
-1.226304, -1.363585, -4.025176, 1, 0.7019608, 0, 1,
-1.223633, 0.05800937, -2.009235, 1, 0.7098039, 0, 1,
-1.217246, 0.9147452, -2.377794, 1, 0.7137255, 0, 1,
-1.21062, 1.855256, -1.912556, 1, 0.7215686, 0, 1,
-1.202856, 1.399781, 0.3290692, 1, 0.7254902, 0, 1,
-1.202046, 0.1617432, -0.5814665, 1, 0.7333333, 0, 1,
-1.199721, -0.5727847, -1.762471, 1, 0.7372549, 0, 1,
-1.198522, 1.986569, -2.235633, 1, 0.7450981, 0, 1,
-1.193292, 0.7301868, -2.258991, 1, 0.7490196, 0, 1,
-1.192106, 0.746955, -0.4969019, 1, 0.7568628, 0, 1,
-1.177767, 1.176269, -0.5786232, 1, 0.7607843, 0, 1,
-1.17028, -0.4026425, -1.483909, 1, 0.7686275, 0, 1,
-1.162353, -0.2355389, -1.856227, 1, 0.772549, 0, 1,
-1.158197, 0.9406274, -0.5481074, 1, 0.7803922, 0, 1,
-1.155152, 1.451279, 0.165033, 1, 0.7843137, 0, 1,
-1.149251, -0.1196946, -3.024254, 1, 0.7921569, 0, 1,
-1.143819, 0.8454168, -2.229173, 1, 0.7960784, 0, 1,
-1.142383, -0.7188049, -1.559278, 1, 0.8039216, 0, 1,
-1.141622, 0.2292317, -1.967497, 1, 0.8117647, 0, 1,
-1.133261, 0.6029488, -1.275495, 1, 0.8156863, 0, 1,
-1.12664, -1.118693, -3.358138, 1, 0.8235294, 0, 1,
-1.125999, -0.3463036, -2.662954, 1, 0.827451, 0, 1,
-1.125621, -1.273304, -1.977492, 1, 0.8352941, 0, 1,
-1.123139, 1.550032, -1.389163, 1, 0.8392157, 0, 1,
-1.116386, 0.3820483, 1.296462, 1, 0.8470588, 0, 1,
-1.108913, -1.142835, -3.813324, 1, 0.8509804, 0, 1,
-1.098614, 1.223559, 0.1653157, 1, 0.8588235, 0, 1,
-1.086506, -1.489207, 0.04490687, 1, 0.8627451, 0, 1,
-1.082374, 0.2338763, -2.466874, 1, 0.8705882, 0, 1,
-1.08148, 1.270335, -1.902447, 1, 0.8745098, 0, 1,
-1.081047, 0.2041549, -2.413101, 1, 0.8823529, 0, 1,
-1.078795, -0.8912285, -3.331759, 1, 0.8862745, 0, 1,
-1.07728, 0.008364432, -1.798779, 1, 0.8941177, 0, 1,
-1.066438, -1.518647, -3.825989, 1, 0.8980392, 0, 1,
-1.061405, 2.148885, 0.3365276, 1, 0.9058824, 0, 1,
-1.060984, -0.8506196, -3.287925, 1, 0.9137255, 0, 1,
-1.060908, -1.326631, -2.408541, 1, 0.9176471, 0, 1,
-1.055164, -0.1280129, 0.227141, 1, 0.9254902, 0, 1,
-1.047634, 0.2461316, -2.296984, 1, 0.9294118, 0, 1,
-1.036459, 0.4475704, -1.967312, 1, 0.9372549, 0, 1,
-1.034208, 0.1108489, -1.138223, 1, 0.9411765, 0, 1,
-1.023866, -3.185923, -4.420077, 1, 0.9490196, 0, 1,
-1.023764, 0.1693136, -3.569975, 1, 0.9529412, 0, 1,
-1.021134, -0.4152483, -1.962434, 1, 0.9607843, 0, 1,
-1.020352, -0.09670236, -1.991106, 1, 0.9647059, 0, 1,
-1.017274, 0.8566945, -2.74807, 1, 0.972549, 0, 1,
-0.9942067, -0.2961248, -1.584754, 1, 0.9764706, 0, 1,
-0.9937903, -0.8924515, -2.219661, 1, 0.9843137, 0, 1,
-0.9894737, -1.163571, -3.839213, 1, 0.9882353, 0, 1,
-0.9894193, 0.9454032, -1.405224, 1, 0.9960784, 0, 1,
-0.9876496, 0.05793203, -1.600269, 0.9960784, 1, 0, 1,
-0.9872319, -0.301174, -0.2952713, 0.9921569, 1, 0, 1,
-0.9807962, -1.325844, -1.600789, 0.9843137, 1, 0, 1,
-0.9792241, 0.1881249, -1.128796, 0.9803922, 1, 0, 1,
-0.9788143, -0.5153994, -1.87871, 0.972549, 1, 0, 1,
-0.977327, 0.6798013, -1.731719, 0.9686275, 1, 0, 1,
-0.9666254, -0.7043499, -2.872375, 0.9607843, 1, 0, 1,
-0.9639978, 1.439444, -1.939192, 0.9568627, 1, 0, 1,
-0.9632164, -1.4919, -2.215911, 0.9490196, 1, 0, 1,
-0.9615126, -0.3852601, -2.027467, 0.945098, 1, 0, 1,
-0.9550882, -1.458952, -3.589268, 0.9372549, 1, 0, 1,
-0.9479852, 0.8463855, -0.6030237, 0.9333333, 1, 0, 1,
-0.947836, 2.256721, -0.1207183, 0.9254902, 1, 0, 1,
-0.9400018, 1.274677, -1.063793, 0.9215686, 1, 0, 1,
-0.9398361, -1.484477, -3.012229, 0.9137255, 1, 0, 1,
-0.93547, -0.1382442, -1.343955, 0.9098039, 1, 0, 1,
-0.9316709, -1.179657, -2.531334, 0.9019608, 1, 0, 1,
-0.9239516, 0.4169128, -1.437638, 0.8941177, 1, 0, 1,
-0.9228864, 0.7273925, -1.243976, 0.8901961, 1, 0, 1,
-0.921445, 1.219172, -1.856361, 0.8823529, 1, 0, 1,
-0.9192718, 2.348667, 0.706417, 0.8784314, 1, 0, 1,
-0.9160413, 0.8157355, -1.802484, 0.8705882, 1, 0, 1,
-0.9114465, 0.2463824, -1.969372, 0.8666667, 1, 0, 1,
-0.909348, 0.06771887, -1.495639, 0.8588235, 1, 0, 1,
-0.9079588, -0.06238164, -1.669424, 0.854902, 1, 0, 1,
-0.8917162, -0.4786887, -2.264931, 0.8470588, 1, 0, 1,
-0.8904518, -0.04098459, -0.6548404, 0.8431373, 1, 0, 1,
-0.8900957, -0.4005481, -1.768123, 0.8352941, 1, 0, 1,
-0.8894503, 0.004553573, -1.267561, 0.8313726, 1, 0, 1,
-0.8890808, 0.1233869, -1.965229, 0.8235294, 1, 0, 1,
-0.8842181, 0.9547753, -1.05053, 0.8196079, 1, 0, 1,
-0.8823689, 0.6035831, -2.231759, 0.8117647, 1, 0, 1,
-0.8816223, -0.8729351, -0.08175652, 0.8078431, 1, 0, 1,
-0.8813401, -1.437771, -2.825067, 0.8, 1, 0, 1,
-0.8782317, -1.145422, -2.537494, 0.7921569, 1, 0, 1,
-0.8761787, -1.034539, -1.12679, 0.7882353, 1, 0, 1,
-0.8754071, -0.2311619, -2.233127, 0.7803922, 1, 0, 1,
-0.8742848, 0.8967734, -0.4568515, 0.7764706, 1, 0, 1,
-0.8669605, -0.3548113, -0.2202733, 0.7686275, 1, 0, 1,
-0.8590882, 0.2863635, -0.9461801, 0.7647059, 1, 0, 1,
-0.848958, -0.08264788, -2.486134, 0.7568628, 1, 0, 1,
-0.8460569, 0.6325531, -2.308626, 0.7529412, 1, 0, 1,
-0.8406232, 0.2511837, -1.722166, 0.7450981, 1, 0, 1,
-0.8378431, 0.3578497, -2.455026, 0.7411765, 1, 0, 1,
-0.83499, 1.101573, -2.875964, 0.7333333, 1, 0, 1,
-0.8346688, -0.8083578, -0.6354326, 0.7294118, 1, 0, 1,
-0.8345073, -0.2762967, -2.421635, 0.7215686, 1, 0, 1,
-0.8326383, -0.6479018, -2.604006, 0.7176471, 1, 0, 1,
-0.8300478, -1.497227, -1.801949, 0.7098039, 1, 0, 1,
-0.8295047, 0.8913147, -2.57281, 0.7058824, 1, 0, 1,
-0.8279009, 1.102017, -0.6092543, 0.6980392, 1, 0, 1,
-0.824544, 1.553853, -0.2695, 0.6901961, 1, 0, 1,
-0.8170314, 0.5091428, -0.1581344, 0.6862745, 1, 0, 1,
-0.8140866, -0.8975419, -4.178399, 0.6784314, 1, 0, 1,
-0.8120326, -0.3672307, -3.873845, 0.6745098, 1, 0, 1,
-0.8115979, -0.5566741, -1.367524, 0.6666667, 1, 0, 1,
-0.8115959, 0.3419231, 0.3533178, 0.6627451, 1, 0, 1,
-0.8104657, -0.05442961, -2.716427, 0.654902, 1, 0, 1,
-0.8091731, 0.2732604, 0.2805572, 0.6509804, 1, 0, 1,
-0.8027381, 0.8002502, -1.025898, 0.6431373, 1, 0, 1,
-0.7974033, -0.8769981, -2.840206, 0.6392157, 1, 0, 1,
-0.7970883, 0.7901262, -0.155721, 0.6313726, 1, 0, 1,
-0.7960797, -1.520601, -2.839191, 0.627451, 1, 0, 1,
-0.7954975, 1.47915, 0.563693, 0.6196079, 1, 0, 1,
-0.7948478, -0.08733082, -2.921072, 0.6156863, 1, 0, 1,
-0.7920224, 0.171164, -0.9283764, 0.6078432, 1, 0, 1,
-0.7872349, 0.3667973, -1.672635, 0.6039216, 1, 0, 1,
-0.7859961, -1.090999, -2.712839, 0.5960785, 1, 0, 1,
-0.781601, 0.2184069, -0.6252707, 0.5882353, 1, 0, 1,
-0.7786257, -0.3605025, -1.511373, 0.5843138, 1, 0, 1,
-0.7723405, -1.723799, -3.790668, 0.5764706, 1, 0, 1,
-0.7720275, -0.5185826, -0.8093198, 0.572549, 1, 0, 1,
-0.7699463, -0.5594354, -1.99692, 0.5647059, 1, 0, 1,
-0.7675075, -1.187054, -2.683877, 0.5607843, 1, 0, 1,
-0.7670743, 2.453476, -1.320483, 0.5529412, 1, 0, 1,
-0.765231, 0.7999872, -1.143866, 0.5490196, 1, 0, 1,
-0.7619304, 1.471136, -1.127456, 0.5411765, 1, 0, 1,
-0.7617997, -0.4573271, -3.367309, 0.5372549, 1, 0, 1,
-0.761783, -1.127662, -2.914553, 0.5294118, 1, 0, 1,
-0.746988, 0.6521733, -2.488466, 0.5254902, 1, 0, 1,
-0.7444599, -1.601077, -2.318619, 0.5176471, 1, 0, 1,
-0.7396891, 1.505455, -0.4599449, 0.5137255, 1, 0, 1,
-0.7371215, 0.8208923, 0.4484242, 0.5058824, 1, 0, 1,
-0.7318853, -1.906052, -2.009616, 0.5019608, 1, 0, 1,
-0.7304476, -0.521088, -3.614737, 0.4941176, 1, 0, 1,
-0.730303, -0.5030316, -2.269682, 0.4862745, 1, 0, 1,
-0.7273717, 0.2929271, -0.6106877, 0.4823529, 1, 0, 1,
-0.7242926, 0.1297458, -2.692493, 0.4745098, 1, 0, 1,
-0.722423, -0.8182647, -0.5491264, 0.4705882, 1, 0, 1,
-0.7200902, 0.1453571, 1.62649, 0.4627451, 1, 0, 1,
-0.719598, -0.07523055, -1.681681, 0.4588235, 1, 0, 1,
-0.7183421, 1.351429, -0.9801456, 0.4509804, 1, 0, 1,
-0.7162642, 0.313716, -2.546045, 0.4470588, 1, 0, 1,
-0.712202, 0.5785403, 0.4984614, 0.4392157, 1, 0, 1,
-0.7108921, -0.8630572, -2.601547, 0.4352941, 1, 0, 1,
-0.7097368, -0.7238552, -4.141794, 0.427451, 1, 0, 1,
-0.7082565, -0.1396702, -0.3106201, 0.4235294, 1, 0, 1,
-0.7074008, -0.4828045, -2.972184, 0.4156863, 1, 0, 1,
-0.7058418, -1.934136, -2.82437, 0.4117647, 1, 0, 1,
-0.6989107, 0.07473392, 0.1961886, 0.4039216, 1, 0, 1,
-0.6962643, 0.08276976, -1.19132, 0.3960784, 1, 0, 1,
-0.6930352, 0.5979038, -0.8572533, 0.3921569, 1, 0, 1,
-0.6902291, 0.6610785, -1.49111, 0.3843137, 1, 0, 1,
-0.689566, -0.3288977, -3.092121, 0.3803922, 1, 0, 1,
-0.6883716, 0.009285882, -4.389749, 0.372549, 1, 0, 1,
-0.6853377, -0.04228707, -2.641294, 0.3686275, 1, 0, 1,
-0.6841949, 0.02204483, -1.261171, 0.3607843, 1, 0, 1,
-0.6836058, 0.28341, -0.7373927, 0.3568628, 1, 0, 1,
-0.6827484, 1.492979, -1.510005, 0.3490196, 1, 0, 1,
-0.6778533, 0.2177662, 0.2263704, 0.345098, 1, 0, 1,
-0.6716815, -1.947262, -2.737939, 0.3372549, 1, 0, 1,
-0.6672964, 1.505419, 0.6074826, 0.3333333, 1, 0, 1,
-0.6647544, -0.8579848, -0.6386181, 0.3254902, 1, 0, 1,
-0.6623096, 0.3163812, -0.3357172, 0.3215686, 1, 0, 1,
-0.6614152, 1.021759, -0.605174, 0.3137255, 1, 0, 1,
-0.6602287, -0.3073758, 0.1642689, 0.3098039, 1, 0, 1,
-0.6598526, -0.4806321, -2.882457, 0.3019608, 1, 0, 1,
-0.6577814, 0.3003996, -0.1351806, 0.2941177, 1, 0, 1,
-0.65679, 0.09576149, -1.949095, 0.2901961, 1, 0, 1,
-0.6565748, 0.9916196, -1.129297, 0.282353, 1, 0, 1,
-0.6496935, -0.2942375, -2.355369, 0.2784314, 1, 0, 1,
-0.645393, 1.174985, 0.7548572, 0.2705882, 1, 0, 1,
-0.6426734, 0.5063198, -1.680727, 0.2666667, 1, 0, 1,
-0.6421153, 1.312318, -0.4623314, 0.2588235, 1, 0, 1,
-0.6417419, -2.247299, -1.631708, 0.254902, 1, 0, 1,
-0.6417049, 0.3955174, -0.2441806, 0.2470588, 1, 0, 1,
-0.6380388, 0.7228955, 0.07091056, 0.2431373, 1, 0, 1,
-0.637185, 0.340461, -0.2127434, 0.2352941, 1, 0, 1,
-0.6326221, 0.402229, -0.1507391, 0.2313726, 1, 0, 1,
-0.6311258, 0.4858068, -0.8214422, 0.2235294, 1, 0, 1,
-0.6294436, -0.810972, -2.732023, 0.2196078, 1, 0, 1,
-0.6259282, 1.474324, -0.8851753, 0.2117647, 1, 0, 1,
-0.6258487, -0.21002, -2.378928, 0.2078431, 1, 0, 1,
-0.6247176, 0.4983028, -0.9227391, 0.2, 1, 0, 1,
-0.6203107, -1.539538, -2.08662, 0.1921569, 1, 0, 1,
-0.6185157, 1.364987, -0.3759527, 0.1882353, 1, 0, 1,
-0.6133903, 0.8907471, -2.21641, 0.1803922, 1, 0, 1,
-0.6130015, -1.69295, -3.313118, 0.1764706, 1, 0, 1,
-0.6124675, -0.4590272, -0.6633254, 0.1686275, 1, 0, 1,
-0.60952, 0.7359204, -0.8065607, 0.1647059, 1, 0, 1,
-0.6094832, 1.089164, -0.8160489, 0.1568628, 1, 0, 1,
-0.6068802, -1.650753, -2.424681, 0.1529412, 1, 0, 1,
-0.6067199, -0.2114724, -2.729869, 0.145098, 1, 0, 1,
-0.6020454, -0.6346027, -2.823262, 0.1411765, 1, 0, 1,
-0.5975415, 0.5646266, -0.9241938, 0.1333333, 1, 0, 1,
-0.5950627, 1.107612, 0.51494, 0.1294118, 1, 0, 1,
-0.5896803, -0.6461834, -1.896469, 0.1215686, 1, 0, 1,
-0.5870103, 0.6112806, -1.719467, 0.1176471, 1, 0, 1,
-0.5857378, -0.09930585, -2.79148, 0.1098039, 1, 0, 1,
-0.5823615, 1.074596, 0.3464044, 0.1058824, 1, 0, 1,
-0.5822524, 0.251914, -2.481574, 0.09803922, 1, 0, 1,
-0.5821319, 0.8069346, -0.8586289, 0.09019608, 1, 0, 1,
-0.5806199, 0.9496185, 1.267009, 0.08627451, 1, 0, 1,
-0.5736636, -0.6474191, -2.743734, 0.07843138, 1, 0, 1,
-0.573082, -0.385768, -3.923464, 0.07450981, 1, 0, 1,
-0.568456, -0.3389621, -1.932488, 0.06666667, 1, 0, 1,
-0.5682166, 1.51139, -1.503061, 0.0627451, 1, 0, 1,
-0.5643209, -0.4644531, -0.7099706, 0.05490196, 1, 0, 1,
-0.5548724, 0.02502477, -2.769769, 0.05098039, 1, 0, 1,
-0.5535735, 0.3418008, -2.343549, 0.04313726, 1, 0, 1,
-0.5524514, -1.847071, -1.83071, 0.03921569, 1, 0, 1,
-0.552406, -0.1559334, -1.843926, 0.03137255, 1, 0, 1,
-0.5516878, 1.91024, 1.135682, 0.02745098, 1, 0, 1,
-0.547729, -2.258844, -1.334391, 0.01960784, 1, 0, 1,
-0.5472623, 0.2333508, -1.554153, 0.01568628, 1, 0, 1,
-0.5454066, 0.5237396, -1.925629, 0.007843138, 1, 0, 1,
-0.5400141, -0.9962087, -2.417889, 0.003921569, 1, 0, 1,
-0.537502, -0.5357206, -1.84615, 0, 1, 0.003921569, 1,
-0.5371629, -0.7443559, -1.031552, 0, 1, 0.01176471, 1,
-0.5303894, 0.9669351, 0.03905902, 0, 1, 0.01568628, 1,
-0.5272093, -0.6859066, -2.015117, 0, 1, 0.02352941, 1,
-0.5270268, -0.5271344, -3.458989, 0, 1, 0.02745098, 1,
-0.5266545, -1.276917, -4.163749, 0, 1, 0.03529412, 1,
-0.519952, -0.5054736, -3.877328, 0, 1, 0.03921569, 1,
-0.5125214, 0.2183326, -0.6510782, 0, 1, 0.04705882, 1,
-0.5066966, -2.654478, -1.833694, 0, 1, 0.05098039, 1,
-0.5041701, -0.6682737, -3.180281, 0, 1, 0.05882353, 1,
-0.503345, 0.9077185, 0.05186024, 0, 1, 0.0627451, 1,
-0.5028469, -1.8428, -3.158734, 0, 1, 0.07058824, 1,
-0.5017747, 1.165396, -0.8799028, 0, 1, 0.07450981, 1,
-0.4977753, 0.8899346, 0.4424349, 0, 1, 0.08235294, 1,
-0.4977745, -1.546177, -4.158135, 0, 1, 0.08627451, 1,
-0.4939477, -1.290198, -2.114719, 0, 1, 0.09411765, 1,
-0.4880493, -0.6641512, -4.370558, 0, 1, 0.1019608, 1,
-0.4870694, 0.006558743, -1.733325, 0, 1, 0.1058824, 1,
-0.4860669, 1.148716, -1.258732, 0, 1, 0.1137255, 1,
-0.4842888, 1.79334, 1.155066, 0, 1, 0.1176471, 1,
-0.4830143, -0.312829, -0.1647878, 0, 1, 0.1254902, 1,
-0.4822179, 0.9934071, -0.1499827, 0, 1, 0.1294118, 1,
-0.4796782, -0.4552314, -2.495716, 0, 1, 0.1372549, 1,
-0.4785347, -1.657877, -2.788778, 0, 1, 0.1411765, 1,
-0.4763925, -1.553924, -3.012161, 0, 1, 0.1490196, 1,
-0.4752835, -0.8501462, -2.205369, 0, 1, 0.1529412, 1,
-0.4675329, -0.4928578, -2.378763, 0, 1, 0.1607843, 1,
-0.4659479, 0.6719286, 1.209165, 0, 1, 0.1647059, 1,
-0.4637584, -0.2867785, 0.3942488, 0, 1, 0.172549, 1,
-0.4598586, 0.02493914, -1.417784, 0, 1, 0.1764706, 1,
-0.4592612, 0.9934818, -2.706878, 0, 1, 0.1843137, 1,
-0.4557841, 1.709385, -0.2004293, 0, 1, 0.1882353, 1,
-0.4517264, -0.04451855, -1.18267, 0, 1, 0.1960784, 1,
-0.4468096, 0.7903492, -0.3703949, 0, 1, 0.2039216, 1,
-0.4396733, -1.126536, -1.531882, 0, 1, 0.2078431, 1,
-0.4364681, 0.1693179, -1.7515, 0, 1, 0.2156863, 1,
-0.4345727, -2.329989, -1.47282, 0, 1, 0.2196078, 1,
-0.4341374, 2.159189, -0.04665088, 0, 1, 0.227451, 1,
-0.4334838, -0.6191851, -2.461401, 0, 1, 0.2313726, 1,
-0.4294575, -0.8735842, -1.040055, 0, 1, 0.2392157, 1,
-0.4196991, 0.3220646, -1.317419, 0, 1, 0.2431373, 1,
-0.416945, -0.4195095, -2.697629, 0, 1, 0.2509804, 1,
-0.4131071, -1.127928, -3.680467, 0, 1, 0.254902, 1,
-0.4063548, 0.332204, -0.1717752, 0, 1, 0.2627451, 1,
-0.4036527, -0.3224114, -2.335867, 0, 1, 0.2666667, 1,
-0.4030579, 1.076999, 0.4743015, 0, 1, 0.2745098, 1,
-0.4023378, -0.2229136, -2.338182, 0, 1, 0.2784314, 1,
-0.4012129, 0.2223281, -1.343481, 0, 1, 0.2862745, 1,
-0.4003777, -0.3360555, -1.999994, 0, 1, 0.2901961, 1,
-0.3972171, -0.1260493, -1.016653, 0, 1, 0.2980392, 1,
-0.3947273, 0.2809537, -1.266184, 0, 1, 0.3058824, 1,
-0.3925894, -0.78585, -2.590127, 0, 1, 0.3098039, 1,
-0.3908092, -0.5486439, -1.884124, 0, 1, 0.3176471, 1,
-0.3881559, 0.7255106, -0.1226238, 0, 1, 0.3215686, 1,
-0.3875198, 0.3992476, 0.2001001, 0, 1, 0.3294118, 1,
-0.3865824, -0.3286104, -3.727905, 0, 1, 0.3333333, 1,
-0.3858446, 0.2701962, -1.51259, 0, 1, 0.3411765, 1,
-0.3852141, 1.832457, -0.05146962, 0, 1, 0.345098, 1,
-0.3843892, -1.472422, -2.046204, 0, 1, 0.3529412, 1,
-0.381795, -0.7624732, -1.079267, 0, 1, 0.3568628, 1,
-0.3812307, -0.6786447, -1.231199, 0, 1, 0.3647059, 1,
-0.3788179, 1.373519, 0.4154623, 0, 1, 0.3686275, 1,
-0.376968, 0.6554982, -0.7852109, 0, 1, 0.3764706, 1,
-0.3728717, 0.4847119, -0.4767912, 0, 1, 0.3803922, 1,
-0.3725325, -0.8744783, -3.496492, 0, 1, 0.3882353, 1,
-0.3684432, -2.420889, -1.933579, 0, 1, 0.3921569, 1,
-0.3587938, 0.9767945, -0.4125504, 0, 1, 0.4, 1,
-0.3548828, -0.6322477, -2.879814, 0, 1, 0.4078431, 1,
-0.3533645, -0.6997569, -3.643942, 0, 1, 0.4117647, 1,
-0.3494688, 1.735107, -2.042421, 0, 1, 0.4196078, 1,
-0.3482912, 0.2070004, -1.302744, 0, 1, 0.4235294, 1,
-0.3457216, -0.8809389, -2.991552, 0, 1, 0.4313726, 1,
-0.3452413, 0.7481033, -1.00188, 0, 1, 0.4352941, 1,
-0.3420878, 1.966085, -0.6530923, 0, 1, 0.4431373, 1,
-0.3405941, 1.420351, -0.1137844, 0, 1, 0.4470588, 1,
-0.3400079, 1.389907, 0.9543881, 0, 1, 0.454902, 1,
-0.3399524, 0.2722444, -0.868907, 0, 1, 0.4588235, 1,
-0.3394236, -0.9815559, -1.831679, 0, 1, 0.4666667, 1,
-0.3344856, -0.2788343, -1.756295, 0, 1, 0.4705882, 1,
-0.3315102, 0.4083491, 1.01676, 0, 1, 0.4784314, 1,
-0.331358, 0.09327039, -2.035359, 0, 1, 0.4823529, 1,
-0.3288072, 1.051471, -0.1455809, 0, 1, 0.4901961, 1,
-0.3257164, -1.480515, -3.609434, 0, 1, 0.4941176, 1,
-0.324887, 0.5726553, -0.6221405, 0, 1, 0.5019608, 1,
-0.3241113, 1.271062, 1.073874, 0, 1, 0.509804, 1,
-0.320783, -0.01250618, -1.324895, 0, 1, 0.5137255, 1,
-0.3205154, -0.331209, -1.702236, 0, 1, 0.5215687, 1,
-0.3156871, 1.129556, 1.07415, 0, 1, 0.5254902, 1,
-0.314152, 0.572791, -0.9891166, 0, 1, 0.5333334, 1,
-0.309835, 0.3442691, 1.400363, 0, 1, 0.5372549, 1,
-0.309113, 0.8975972, -0.4235179, 0, 1, 0.5450981, 1,
-0.3089311, 0.4523443, 0.110092, 0, 1, 0.5490196, 1,
-0.3066323, 1.511856, -0.4537167, 0, 1, 0.5568628, 1,
-0.3042635, 0.549889, 0.8845297, 0, 1, 0.5607843, 1,
-0.302971, 1.162494, -1.287568, 0, 1, 0.5686275, 1,
-0.3027652, -0.7383444, -1.540567, 0, 1, 0.572549, 1,
-0.2997804, 0.6585093, 0.3406672, 0, 1, 0.5803922, 1,
-0.2969512, -1.098877, -2.760938, 0, 1, 0.5843138, 1,
-0.2963697, -0.4505481, -1.345329, 0, 1, 0.5921569, 1,
-0.2950197, -0.01238916, -0.9974337, 0, 1, 0.5960785, 1,
-0.2924032, 0.1579075, -1.21613, 0, 1, 0.6039216, 1,
-0.2885139, -0.1598912, -2.695965, 0, 1, 0.6117647, 1,
-0.2845218, -0.4962079, -2.393434, 0, 1, 0.6156863, 1,
-0.2840071, 1.495139, -0.04054481, 0, 1, 0.6235294, 1,
-0.283297, 1.626642, 0.196686, 0, 1, 0.627451, 1,
-0.2812459, 0.5826265, -1.183766, 0, 1, 0.6352941, 1,
-0.279836, -0.1119973, -1.668636, 0, 1, 0.6392157, 1,
-0.279128, -0.09968158, -2.640483, 0, 1, 0.6470588, 1,
-0.277373, -0.05821552, -1.390608, 0, 1, 0.6509804, 1,
-0.2752394, 0.5078528, -2.334204, 0, 1, 0.6588235, 1,
-0.2727788, 2.092537, 1.243489, 0, 1, 0.6627451, 1,
-0.2717066, -0.3543644, -4.156749, 0, 1, 0.6705883, 1,
-0.2714226, 0.9118261, -0.4286748, 0, 1, 0.6745098, 1,
-0.2700917, -1.042427, -1.645724, 0, 1, 0.682353, 1,
-0.2686982, -0.4600685, -3.082402, 0, 1, 0.6862745, 1,
-0.2677018, -0.1465778, -0.8092856, 0, 1, 0.6941177, 1,
-0.2612885, -1.124442, -4.266243, 0, 1, 0.7019608, 1,
-0.2607698, -0.7840834, -1.881176, 0, 1, 0.7058824, 1,
-0.2591218, -0.08220929, -1.301504, 0, 1, 0.7137255, 1,
-0.2511681, -0.5144187, -1.249246, 0, 1, 0.7176471, 1,
-0.2461781, -0.4091824, -0.2327208, 0, 1, 0.7254902, 1,
-0.2455505, 1.395812, 1.329025, 0, 1, 0.7294118, 1,
-0.242395, -0.2966889, -2.061596, 0, 1, 0.7372549, 1,
-0.2416818, -1.225729, -2.717075, 0, 1, 0.7411765, 1,
-0.2387177, 0.3502699, -1.347884, 0, 1, 0.7490196, 1,
-0.2386604, 0.6273207, 0.7966776, 0, 1, 0.7529412, 1,
-0.2342986, -0.1625201, -4.788696, 0, 1, 0.7607843, 1,
-0.2326793, -0.3380507, -3.112888, 0, 1, 0.7647059, 1,
-0.2324195, -0.769296, -4.738729, 0, 1, 0.772549, 1,
-0.2283186, -0.1475177, -2.4915, 0, 1, 0.7764706, 1,
-0.2279647, -0.2794217, -2.748432, 0, 1, 0.7843137, 1,
-0.2257829, 1.263466, -2.240993, 0, 1, 0.7882353, 1,
-0.2251951, -0.3018228, -2.88669, 0, 1, 0.7960784, 1,
-0.220407, -1.369658, -2.335474, 0, 1, 0.8039216, 1,
-0.220202, 0.731396, -0.2825691, 0, 1, 0.8078431, 1,
-0.2192311, 1.112754, -0.6204587, 0, 1, 0.8156863, 1,
-0.2157899, 1.343149, -0.7240344, 0, 1, 0.8196079, 1,
-0.2125795, -1.955316, -1.819694, 0, 1, 0.827451, 1,
-0.2090994, -0.7623255, -2.042216, 0, 1, 0.8313726, 1,
-0.2065839, -0.8448508, -1.993315, 0, 1, 0.8392157, 1,
-0.2036642, 1.526172, -0.7150636, 0, 1, 0.8431373, 1,
-0.2020286, 0.3810974, -1.527983, 0, 1, 0.8509804, 1,
-0.192974, 0.5856609, -1.665113, 0, 1, 0.854902, 1,
-0.1928619, -0.948339, -3.750586, 0, 1, 0.8627451, 1,
-0.1895432, 1.595548, 1.200985, 0, 1, 0.8666667, 1,
-0.1874343, -0.1991802, -3.035233, 0, 1, 0.8745098, 1,
-0.1871899, 0.31811, 0.1052732, 0, 1, 0.8784314, 1,
-0.1826405, 0.2385258, -2.219847, 0, 1, 0.8862745, 1,
-0.1794635, 1.621659, 0.06335557, 0, 1, 0.8901961, 1,
-0.1764236, 1.830793, -0.3374209, 0, 1, 0.8980392, 1,
-0.1749169, 0.2269993, -0.5178481, 0, 1, 0.9058824, 1,
-0.1742008, 0.001218868, -1.99258, 0, 1, 0.9098039, 1,
-0.1681594, -0.797211, -2.897799, 0, 1, 0.9176471, 1,
-0.1664318, 0.2787645, -0.1649273, 0, 1, 0.9215686, 1,
-0.1663894, 0.7289658, 0.2234529, 0, 1, 0.9294118, 1,
-0.1659873, -0.9737565, -3.489891, 0, 1, 0.9333333, 1,
-0.1606556, -0.6252462, -2.423969, 0, 1, 0.9411765, 1,
-0.1576218, 0.7297282, -1.63884, 0, 1, 0.945098, 1,
-0.1574257, 0.1097436, 0.2789245, 0, 1, 0.9529412, 1,
-0.1530229, 0.5354516, -1.001341, 0, 1, 0.9568627, 1,
-0.1497877, -0.8385241, -2.185163, 0, 1, 0.9647059, 1,
-0.1491849, -1.908246, -2.177396, 0, 1, 0.9686275, 1,
-0.1484435, 0.9129712, -0.7447339, 0, 1, 0.9764706, 1,
-0.1479315, 0.4860873, 0.4505593, 0, 1, 0.9803922, 1,
-0.144486, 0.7273601, 0.007961584, 0, 1, 0.9882353, 1,
-0.1363461, 1.232364, -0.5927743, 0, 1, 0.9921569, 1,
-0.1340964, -0.318583, -2.907568, 0, 1, 1, 1,
-0.1320029, -0.3998464, -2.805864, 0, 0.9921569, 1, 1,
-0.1316359, -0.2685229, -3.494641, 0, 0.9882353, 1, 1,
-0.1265679, 0.2895443, 0.5689129, 0, 0.9803922, 1, 1,
-0.1243564, -1.544361, -3.90063, 0, 0.9764706, 1, 1,
-0.1239232, -0.8723919, -4.839097, 0, 0.9686275, 1, 1,
-0.120293, -0.9216287, -3.900193, 0, 0.9647059, 1, 1,
-0.1194617, -0.735581, -3.492066, 0, 0.9568627, 1, 1,
-0.1190311, -0.1721798, -3.606175, 0, 0.9529412, 1, 1,
-0.1173517, -1.580865, -2.968785, 0, 0.945098, 1, 1,
-0.1168125, -0.8303314, -4.274364, 0, 0.9411765, 1, 1,
-0.1160884, 1.665357, -0.9801691, 0, 0.9333333, 1, 1,
-0.115945, -1.014338, -2.971898, 0, 0.9294118, 1, 1,
-0.1114929, 2.10467, 0.9679555, 0, 0.9215686, 1, 1,
-0.1085479, 1.288454, -2.219306, 0, 0.9176471, 1, 1,
-0.1049316, 0.387682, -0.3473239, 0, 0.9098039, 1, 1,
-0.1040751, 0.3150378, -0.2729389, 0, 0.9058824, 1, 1,
-0.09757394, 1.784311, 0.7540415, 0, 0.8980392, 1, 1,
-0.09656867, -0.7358667, -3.827595, 0, 0.8901961, 1, 1,
-0.08613683, 0.05837277, -1.142469, 0, 0.8862745, 1, 1,
-0.08376545, -1.225414, -3.448031, 0, 0.8784314, 1, 1,
-0.0819025, 0.9349152, -2.123066, 0, 0.8745098, 1, 1,
-0.07879066, 1.389357, -0.9574479, 0, 0.8666667, 1, 1,
-0.07489349, 1.786025, 0.5336601, 0, 0.8627451, 1, 1,
-0.07478309, -0.5949237, -3.489346, 0, 0.854902, 1, 1,
-0.06890833, -1.01226, -4.243285, 0, 0.8509804, 1, 1,
-0.06510904, 0.455271, 1.040279, 0, 0.8431373, 1, 1,
-0.06309628, 0.6970671, 0.1297954, 0, 0.8392157, 1, 1,
-0.06237092, 0.7734113, -0.6003968, 0, 0.8313726, 1, 1,
-0.06133023, -0.8412926, -4.277134, 0, 0.827451, 1, 1,
-0.05319614, -0.3726081, -3.552644, 0, 0.8196079, 1, 1,
-0.05275347, 2.292533, -0.1690764, 0, 0.8156863, 1, 1,
-0.05263896, 1.86703, -1.218599, 0, 0.8078431, 1, 1,
-0.04742087, 0.5069714, -2.209267, 0, 0.8039216, 1, 1,
-0.04581857, 0.9976413, -0.5788659, 0, 0.7960784, 1, 1,
-0.04309468, 1.518533, -0.7470822, 0, 0.7882353, 1, 1,
-0.03586571, -0.8017487, -2.912369, 0, 0.7843137, 1, 1,
-0.03122821, 0.2358363, -0.2397016, 0, 0.7764706, 1, 1,
-0.03102373, -1.104597, -4.198334, 0, 0.772549, 1, 1,
-0.02925519, 1.634822, 0.5564358, 0, 0.7647059, 1, 1,
-0.02839907, 0.5678857, -1.529124, 0, 0.7607843, 1, 1,
-0.026026, 1.101323, 0.9098052, 0, 0.7529412, 1, 1,
-0.02529269, 0.4729916, 0.8743091, 0, 0.7490196, 1, 1,
-0.02522191, 1.101615, -1.316454, 0, 0.7411765, 1, 1,
-0.02430008, -0.3078384, -2.778571, 0, 0.7372549, 1, 1,
-0.02244881, -0.7564441, -3.639365, 0, 0.7294118, 1, 1,
-0.0216228, -0.5122998, -3.456457, 0, 0.7254902, 1, 1,
-0.02030434, -0.2678283, -2.137307, 0, 0.7176471, 1, 1,
-0.01921455, -0.1532517, -2.316073, 0, 0.7137255, 1, 1,
-0.005149753, 0.6102106, -1.295079, 0, 0.7058824, 1, 1,
-0.00198399, -1.188733, -3.361025, 0, 0.6980392, 1, 1,
-0.001812523, -0.5359625, -2.694342, 0, 0.6941177, 1, 1,
0.007277071, 0.3521804, 1.221486, 0, 0.6862745, 1, 1,
0.007887612, -0.1610695, 4.063522, 0, 0.682353, 1, 1,
0.009428683, 0.1293257, -1.538215, 0, 0.6745098, 1, 1,
0.01086119, 0.7891196, 0.2066017, 0, 0.6705883, 1, 1,
0.01432646, 0.05542753, -0.415627, 0, 0.6627451, 1, 1,
0.02469291, 0.05291563, 1.138366, 0, 0.6588235, 1, 1,
0.02798049, -0.1031235, 2.663263, 0, 0.6509804, 1, 1,
0.02983686, 0.8399376, 0.4780835, 0, 0.6470588, 1, 1,
0.03158304, -1.719248, 3.458055, 0, 0.6392157, 1, 1,
0.03517142, 1.056423, 0.6668723, 0, 0.6352941, 1, 1,
0.03578944, -0.1919821, 2.637229, 0, 0.627451, 1, 1,
0.03806206, 1.728205, -1.174589, 0, 0.6235294, 1, 1,
0.03938476, 2.216962, 0.2761282, 0, 0.6156863, 1, 1,
0.03955095, -0.4562334, 5.921661, 0, 0.6117647, 1, 1,
0.04719267, -0.5310434, 2.345295, 0, 0.6039216, 1, 1,
0.04866269, 1.097631, 0.1357982, 0, 0.5960785, 1, 1,
0.0574648, -0.2831306, 1.497177, 0, 0.5921569, 1, 1,
0.05912996, -1.196411, 3.131993, 0, 0.5843138, 1, 1,
0.06052925, 0.5903279, 0.7564761, 0, 0.5803922, 1, 1,
0.0612655, -0.7942107, 2.85597, 0, 0.572549, 1, 1,
0.06801037, -3.009973, 3.714725, 0, 0.5686275, 1, 1,
0.0712838, 1.144766, 0.4422171, 0, 0.5607843, 1, 1,
0.07365406, -0.1668679, 2.957155, 0, 0.5568628, 1, 1,
0.07696477, -0.004662131, 1.661775, 0, 0.5490196, 1, 1,
0.07787806, 0.59759, 1.269147, 0, 0.5450981, 1, 1,
0.07816324, -1.625609, 3.1873, 0, 0.5372549, 1, 1,
0.0805046, 0.1794202, 1.880564, 0, 0.5333334, 1, 1,
0.08584808, 0.6850769, 0.462887, 0, 0.5254902, 1, 1,
0.0929284, 1.987564, -0.4923532, 0, 0.5215687, 1, 1,
0.09739576, -1.30182, 1.226145, 0, 0.5137255, 1, 1,
0.09847611, -0.8303002, 3.187785, 0, 0.509804, 1, 1,
0.1002186, 1.101099, -0.4492203, 0, 0.5019608, 1, 1,
0.1004823, 0.8825583, 0.1309626, 0, 0.4941176, 1, 1,
0.104646, -0.9728892, 2.795932, 0, 0.4901961, 1, 1,
0.1053114, 1.076923, 1.048974, 0, 0.4823529, 1, 1,
0.1074154, -0.1250531, 2.539528, 0, 0.4784314, 1, 1,
0.1142652, 0.005655821, 0.2751683, 0, 0.4705882, 1, 1,
0.1158795, 0.6932089, 0.4703755, 0, 0.4666667, 1, 1,
0.1180898, 0.6138883, 1.042621, 0, 0.4588235, 1, 1,
0.1193642, -0.23211, 2.747867, 0, 0.454902, 1, 1,
0.1205861, -0.433017, 2.065084, 0, 0.4470588, 1, 1,
0.1227033, -1.401937, 1.660285, 0, 0.4431373, 1, 1,
0.1239195, 0.4146998, 0.8431183, 0, 0.4352941, 1, 1,
0.140955, -0.2907459, 4.747565, 0, 0.4313726, 1, 1,
0.1429502, -0.8464202, 3.81947, 0, 0.4235294, 1, 1,
0.1442369, -0.2788017, 3.505502, 0, 0.4196078, 1, 1,
0.1472219, 0.03173891, 0.8257008, 0, 0.4117647, 1, 1,
0.1487497, -2.3319, 3.191949, 0, 0.4078431, 1, 1,
0.1502848, 0.0002564228, 1.743291, 0, 0.4, 1, 1,
0.1505368, 1.031257, 0.837081, 0, 0.3921569, 1, 1,
0.1556105, -0.7189829, 3.878717, 0, 0.3882353, 1, 1,
0.1592415, 1.401669, -1.184384, 0, 0.3803922, 1, 1,
0.1611016, 0.04067674, -0.6826662, 0, 0.3764706, 1, 1,
0.1681108, 1.425447, 0.8341808, 0, 0.3686275, 1, 1,
0.1753375, -0.7183496, 3.808443, 0, 0.3647059, 1, 1,
0.1756336, -0.4514477, 3.845279, 0, 0.3568628, 1, 1,
0.1758761, 0.756678, 1.268652, 0, 0.3529412, 1, 1,
0.1772011, -1.561484, 3.020123, 0, 0.345098, 1, 1,
0.1773007, -1.12933, 4.318498, 0, 0.3411765, 1, 1,
0.1789891, -1.024053, 2.96614, 0, 0.3333333, 1, 1,
0.1799314, -0.0317781, 0.6567783, 0, 0.3294118, 1, 1,
0.1818042, -2.196474, 3.370712, 0, 0.3215686, 1, 1,
0.1843188, -0.4430294, 2.21222, 0, 0.3176471, 1, 1,
0.1849302, -1.728614, 3.4817, 0, 0.3098039, 1, 1,
0.1850019, -0.7813914, 4.214261, 0, 0.3058824, 1, 1,
0.1854451, 0.834458, 0.8564266, 0, 0.2980392, 1, 1,
0.1884537, 0.2552729, 0.7862484, 0, 0.2901961, 1, 1,
0.2002222, 0.739406, 1.526479, 0, 0.2862745, 1, 1,
0.2017368, 0.1704683, 1.111011, 0, 0.2784314, 1, 1,
0.2053965, 0.8221989, -1.204649, 0, 0.2745098, 1, 1,
0.2054002, -0.4732685, 2.214425, 0, 0.2666667, 1, 1,
0.2109231, -0.1414109, 1.583018, 0, 0.2627451, 1, 1,
0.2147544, 1.401724, -0.5091362, 0, 0.254902, 1, 1,
0.2227022, -1.084329, 4.075533, 0, 0.2509804, 1, 1,
0.2246763, -0.289183, 2.16424, 0, 0.2431373, 1, 1,
0.2248908, -0.5550375, 1.377292, 0, 0.2392157, 1, 1,
0.2267936, -0.8497217, 2.801836, 0, 0.2313726, 1, 1,
0.2306299, -2.202025, 3.485128, 0, 0.227451, 1, 1,
0.2341564, 0.4309399, 0.3660923, 0, 0.2196078, 1, 1,
0.2353556, 0.1275024, 1.963302, 0, 0.2156863, 1, 1,
0.2356685, 0.3148778, 0.1610478, 0, 0.2078431, 1, 1,
0.2359167, 0.4758803, 1.397371, 0, 0.2039216, 1, 1,
0.2368204, 0.2747509, 0.6438276, 0, 0.1960784, 1, 1,
0.2422324, -0.05039509, 2.536166, 0, 0.1882353, 1, 1,
0.2447903, 0.3234617, 0.6903661, 0, 0.1843137, 1, 1,
0.2488862, 1.318682, 0.699499, 0, 0.1764706, 1, 1,
0.2495486, 0.7181559, 0.4238203, 0, 0.172549, 1, 1,
0.2534437, 0.5444103, -0.962163, 0, 0.1647059, 1, 1,
0.2539726, -0.4296959, 2.835613, 0, 0.1607843, 1, 1,
0.2543067, 0.5084029, 0.5091606, 0, 0.1529412, 1, 1,
0.2549754, 0.8713252, -1.480496, 0, 0.1490196, 1, 1,
0.2557476, 1.154098, -0.6876332, 0, 0.1411765, 1, 1,
0.2592281, 0.4706194, 0.08934838, 0, 0.1372549, 1, 1,
0.2593076, -1.479729, 2.399171, 0, 0.1294118, 1, 1,
0.2604677, 0.3168596, 0.9482326, 0, 0.1254902, 1, 1,
0.2605075, 0.7695992, -0.944433, 0, 0.1176471, 1, 1,
0.2615337, 2.207233, -1.305384, 0, 0.1137255, 1, 1,
0.2626223, 0.2085304, 1.595913, 0, 0.1058824, 1, 1,
0.2653403, -0.4317322, 2.494885, 0, 0.09803922, 1, 1,
0.2697076, 1.511858, -0.3763998, 0, 0.09411765, 1, 1,
0.2742425, -0.3022008, 2.929384, 0, 0.08627451, 1, 1,
0.281512, 1.374491, 0.7025158, 0, 0.08235294, 1, 1,
0.2836609, -1.50068, 3.327248, 0, 0.07450981, 1, 1,
0.291806, -0.1418133, 2.051867, 0, 0.07058824, 1, 1,
0.2941221, 1.707879, -0.2816138, 0, 0.0627451, 1, 1,
0.295659, 1.032307, 0.9023489, 0, 0.05882353, 1, 1,
0.2971697, -0.2544211, 2.121215, 0, 0.05098039, 1, 1,
0.2975416, -1.311305, 1.460478, 0, 0.04705882, 1, 1,
0.2992812, 0.5507292, 0.1732022, 0, 0.03921569, 1, 1,
0.3008914, 0.544104, 0.6389718, 0, 0.03529412, 1, 1,
0.3028467, 1.527932, 0.1408269, 0, 0.02745098, 1, 1,
0.3034203, -0.4669352, 4.252908, 0, 0.02352941, 1, 1,
0.3037128, -0.3311467, 2.677972, 0, 0.01568628, 1, 1,
0.3053245, 0.5515758, -0.09902397, 0, 0.01176471, 1, 1,
0.3198515, -1.385517, 3.815148, 0, 0.003921569, 1, 1,
0.3201395, 0.821894, 0.2072314, 0.003921569, 0, 1, 1,
0.3222777, 0.6354133, 1.09071, 0.007843138, 0, 1, 1,
0.322394, 0.1568456, 1.652575, 0.01568628, 0, 1, 1,
0.3231747, 0.1000141, 1.29069, 0.01960784, 0, 1, 1,
0.3238838, -1.257935, 4.613615, 0.02745098, 0, 1, 1,
0.3246762, 1.624796, 1.549976, 0.03137255, 0, 1, 1,
0.3248698, -1.672063, 1.830659, 0.03921569, 0, 1, 1,
0.3305102, 0.6881863, -0.8289335, 0.04313726, 0, 1, 1,
0.3382338, 0.2276795, 1.058117, 0.05098039, 0, 1, 1,
0.3388591, 0.1126707, 3.075921, 0.05490196, 0, 1, 1,
0.346566, 1.480786, 1.285031, 0.0627451, 0, 1, 1,
0.3485353, 0.2891707, 1.399336, 0.06666667, 0, 1, 1,
0.3496527, 1.142292, 0.4484248, 0.07450981, 0, 1, 1,
0.3534291, -0.8526707, 2.390514, 0.07843138, 0, 1, 1,
0.3573466, -0.6955265, 3.592418, 0.08627451, 0, 1, 1,
0.358115, 0.9388856, 0.3919351, 0.09019608, 0, 1, 1,
0.3595006, 0.04259998, 1.785318, 0.09803922, 0, 1, 1,
0.3618017, 0.6042097, 1.57706, 0.1058824, 0, 1, 1,
0.3618854, -1.844678, 2.329668, 0.1098039, 0, 1, 1,
0.3632824, 0.657, 0.4345267, 0.1176471, 0, 1, 1,
0.3641472, 0.02021252, 1.752527, 0.1215686, 0, 1, 1,
0.3650272, 1.902409, -0.597025, 0.1294118, 0, 1, 1,
0.3685448, -0.625863, 2.669368, 0.1333333, 0, 1, 1,
0.3715102, 0.06920235, -0.14904, 0.1411765, 0, 1, 1,
0.377044, -0.4791738, 1.823893, 0.145098, 0, 1, 1,
0.3804589, -1.078837, 2.252058, 0.1529412, 0, 1, 1,
0.3844041, 0.7198641, -0.8834649, 0.1568628, 0, 1, 1,
0.3897435, 0.687536, -0.2751817, 0.1647059, 0, 1, 1,
0.3916231, 0.1342483, 0.09508451, 0.1686275, 0, 1, 1,
0.3971744, -0.5477009, 2.654684, 0.1764706, 0, 1, 1,
0.3991531, -1.852781, 3.224369, 0.1803922, 0, 1, 1,
0.4017778, -0.272914, 1.460826, 0.1882353, 0, 1, 1,
0.4032884, 0.0741571, 0.5544934, 0.1921569, 0, 1, 1,
0.4077858, 0.03887878, 0.4759676, 0.2, 0, 1, 1,
0.4120174, 1.771148, 0.8073641, 0.2078431, 0, 1, 1,
0.4164788, 1.063057, 0.7943832, 0.2117647, 0, 1, 1,
0.4175015, 0.591302, 0.730942, 0.2196078, 0, 1, 1,
0.419107, 0.9466691, 0.8945943, 0.2235294, 0, 1, 1,
0.4191207, 0.3254756, 0.3828921, 0.2313726, 0, 1, 1,
0.4232884, 0.6856654, -0.1585256, 0.2352941, 0, 1, 1,
0.4258263, -0.134055, -0.1624353, 0.2431373, 0, 1, 1,
0.4304278, -0.0807398, 2.981862, 0.2470588, 0, 1, 1,
0.4347255, -0.03967984, 1.168313, 0.254902, 0, 1, 1,
0.4388106, -0.3047916, 2.794291, 0.2588235, 0, 1, 1,
0.4419957, -0.1461699, 0.2586061, 0.2666667, 0, 1, 1,
0.4488346, 0.6736001, -0.45455, 0.2705882, 0, 1, 1,
0.4529541, -1.645725, 3.716741, 0.2784314, 0, 1, 1,
0.4544123, 0.01175958, 1.704125, 0.282353, 0, 1, 1,
0.4551058, -0.3204787, 0.1260694, 0.2901961, 0, 1, 1,
0.4555323, 0.02293301, 3.335224, 0.2941177, 0, 1, 1,
0.4563491, 0.9334663, -0.06087342, 0.3019608, 0, 1, 1,
0.470632, -0.4051193, 1.728184, 0.3098039, 0, 1, 1,
0.4710221, 1.76893, -0.3704742, 0.3137255, 0, 1, 1,
0.4746209, -0.135275, 1.486276, 0.3215686, 0, 1, 1,
0.4799824, 0.7937738, -0.5301325, 0.3254902, 0, 1, 1,
0.4804879, 0.3161912, 2.169955, 0.3333333, 0, 1, 1,
0.4827699, 0.104592, 0.6347625, 0.3372549, 0, 1, 1,
0.4849044, -0.7961286, 3.595945, 0.345098, 0, 1, 1,
0.4964257, -0.1356922, 0.6570476, 0.3490196, 0, 1, 1,
0.4969721, -1.517335, 2.662518, 0.3568628, 0, 1, 1,
0.5076324, 0.2820505, -0.04597382, 0.3607843, 0, 1, 1,
0.5155961, -1.283621, 2.231044, 0.3686275, 0, 1, 1,
0.5213658, -0.05023611, 2.499721, 0.372549, 0, 1, 1,
0.5222617, 0.3846699, 2.426669, 0.3803922, 0, 1, 1,
0.5285668, 0.3856974, -0.5734218, 0.3843137, 0, 1, 1,
0.52875, -0.3117545, 1.833445, 0.3921569, 0, 1, 1,
0.5295468, 1.459011, 1.358704, 0.3960784, 0, 1, 1,
0.5324467, 0.1457027, 1.333215, 0.4039216, 0, 1, 1,
0.5357862, -0.2488492, 2.086099, 0.4117647, 0, 1, 1,
0.5369173, -0.03051067, 1.396024, 0.4156863, 0, 1, 1,
0.5378283, -1.105642, 2.778867, 0.4235294, 0, 1, 1,
0.5411446, 0.7995881, 1.750814, 0.427451, 0, 1, 1,
0.5432928, -2.104282, 1.48014, 0.4352941, 0, 1, 1,
0.5461465, 0.1884804, 2.684087, 0.4392157, 0, 1, 1,
0.5461828, 0.8991459, 0.7884238, 0.4470588, 0, 1, 1,
0.5572185, 1.549096, 0.5365226, 0.4509804, 0, 1, 1,
0.558197, 0.9376563, 0.4510511, 0.4588235, 0, 1, 1,
0.5608381, 0.6034095, 1.46494, 0.4627451, 0, 1, 1,
0.561855, 1.959748, 1.535722, 0.4705882, 0, 1, 1,
0.5646945, 2.273884, 0.4656483, 0.4745098, 0, 1, 1,
0.5664311, -1.743534, 1.967979, 0.4823529, 0, 1, 1,
0.5705705, -0.8975754, 1.713195, 0.4862745, 0, 1, 1,
0.5705976, 0.2205618, 0.8094991, 0.4941176, 0, 1, 1,
0.5712866, 1.345659, -0.2296686, 0.5019608, 0, 1, 1,
0.5813346, -1.095037, 2.910748, 0.5058824, 0, 1, 1,
0.5894665, -1.355807, 1.764278, 0.5137255, 0, 1, 1,
0.5896319, -1.246539, 3.454786, 0.5176471, 0, 1, 1,
0.6008887, 0.5930271, -0.007605796, 0.5254902, 0, 1, 1,
0.6021596, 0.8341694, 0.669472, 0.5294118, 0, 1, 1,
0.6041523, 0.9733608, 1.455073, 0.5372549, 0, 1, 1,
0.6043076, -1.450867, 2.454581, 0.5411765, 0, 1, 1,
0.6057925, -1.488121, 2.124723, 0.5490196, 0, 1, 1,
0.6061729, 0.3457546, 2.040601, 0.5529412, 0, 1, 1,
0.6093304, 0.2082334, 1.698808, 0.5607843, 0, 1, 1,
0.6115733, 0.1154515, 1.026537, 0.5647059, 0, 1, 1,
0.6167545, -1.175927, 2.095965, 0.572549, 0, 1, 1,
0.6211026, 0.3633716, 1.455348, 0.5764706, 0, 1, 1,
0.6216533, -0.09805864, 2.425473, 0.5843138, 0, 1, 1,
0.623043, 1.734371, 1.829536, 0.5882353, 0, 1, 1,
0.6317862, -0.4304829, 2.994449, 0.5960785, 0, 1, 1,
0.6371318, -0.3523821, 1.423978, 0.6039216, 0, 1, 1,
0.641101, -0.6154124, 2.728787, 0.6078432, 0, 1, 1,
0.6412985, -1.203585, 3.362097, 0.6156863, 0, 1, 1,
0.6435173, -0.7653113, 3.145784, 0.6196079, 0, 1, 1,
0.6454614, -1.134228, 1.833383, 0.627451, 0, 1, 1,
0.6645082, 1.414766, -0.7508446, 0.6313726, 0, 1, 1,
0.6664457, 1.04539, 0.4739949, 0.6392157, 0, 1, 1,
0.6673347, 0.0617059, 0.9061548, 0.6431373, 0, 1, 1,
0.668555, 0.8290718, 1.666784, 0.6509804, 0, 1, 1,
0.6714009, 0.1769515, 2.142944, 0.654902, 0, 1, 1,
0.6826031, 1.692748, 0.1652942, 0.6627451, 0, 1, 1,
0.6874433, -0.7335534, 2.328577, 0.6666667, 0, 1, 1,
0.6916357, 0.5029125, 0.7873245, 0.6745098, 0, 1, 1,
0.7010605, 0.4123735, 1.291511, 0.6784314, 0, 1, 1,
0.7017398, -0.786523, 1.972591, 0.6862745, 0, 1, 1,
0.7061358, -0.09144644, 2.728386, 0.6901961, 0, 1, 1,
0.7071774, 1.512788, -0.2992126, 0.6980392, 0, 1, 1,
0.7138277, -0.7193106, 0.9999677, 0.7058824, 0, 1, 1,
0.7176408, 0.6173086, 1.527102, 0.7098039, 0, 1, 1,
0.7225531, -0.4098354, 2.766819, 0.7176471, 0, 1, 1,
0.7226181, 0.203176, 1.181019, 0.7215686, 0, 1, 1,
0.7237958, 1.127274, 0.4898763, 0.7294118, 0, 1, 1,
0.7253309, -0.05132657, 2.567756, 0.7333333, 0, 1, 1,
0.7302598, 0.5139511, 1.532391, 0.7411765, 0, 1, 1,
0.7324829, 0.1450287, -0.2280263, 0.7450981, 0, 1, 1,
0.7329057, -1.23658, 4.635985, 0.7529412, 0, 1, 1,
0.7422664, 1.353211, 0.5325512, 0.7568628, 0, 1, 1,
0.7434308, 2.135185, 0.1793085, 0.7647059, 0, 1, 1,
0.747612, 1.299954, 0.1710877, 0.7686275, 0, 1, 1,
0.749325, -0.6570816, 3.421565, 0.7764706, 0, 1, 1,
0.750544, -0.6593949, 2.570577, 0.7803922, 0, 1, 1,
0.7513682, 2.233385, -1.423516, 0.7882353, 0, 1, 1,
0.7530106, 0.196659, 1.239041, 0.7921569, 0, 1, 1,
0.7563946, 0.485946, 0.6849304, 0.8, 0, 1, 1,
0.7649432, -0.1977763, 0.7790015, 0.8078431, 0, 1, 1,
0.774279, 1.359535, 2.61425, 0.8117647, 0, 1, 1,
0.7760683, 0.2540367, 1.872193, 0.8196079, 0, 1, 1,
0.7761904, 0.1885924, 1.616608, 0.8235294, 0, 1, 1,
0.7810938, 0.4012025, 1.637715, 0.8313726, 0, 1, 1,
0.7816857, 0.372789, 0.8721236, 0.8352941, 0, 1, 1,
0.7836727, 0.7476002, -0.01202522, 0.8431373, 0, 1, 1,
0.7870336, 0.6649391, 0.8436899, 0.8470588, 0, 1, 1,
0.788582, -0.06932141, 2.765644, 0.854902, 0, 1, 1,
0.7893223, -1.561724, 4.886016, 0.8588235, 0, 1, 1,
0.7915219, -0.6768583, 3.782266, 0.8666667, 0, 1, 1,
0.7972104, 0.7135361, 0.1406058, 0.8705882, 0, 1, 1,
0.7994913, -0.3525029, 1.614064, 0.8784314, 0, 1, 1,
0.8173361, -0.3237076, 1.884523, 0.8823529, 0, 1, 1,
0.8329484, 0.09562201, 1.131554, 0.8901961, 0, 1, 1,
0.836543, 0.925044, 1.261328, 0.8941177, 0, 1, 1,
0.8409688, 0.5534399, 1.76255, 0.9019608, 0, 1, 1,
0.8449485, 0.05715978, 1.403677, 0.9098039, 0, 1, 1,
0.8551818, 0.5689851, 1.718972, 0.9137255, 0, 1, 1,
0.8576399, 0.2817759, 1.611658, 0.9215686, 0, 1, 1,
0.8634461, 0.24558, 0.9860538, 0.9254902, 0, 1, 1,
0.8765297, 0.6604398, -0.6550508, 0.9333333, 0, 1, 1,
0.8770931, -2.133713, 2.625339, 0.9372549, 0, 1, 1,
0.8772693, 0.4630863, 0.9749528, 0.945098, 0, 1, 1,
0.8793747, 2.187659, 1.13949, 0.9490196, 0, 1, 1,
0.8914992, -0.6085353, 2.25798, 0.9568627, 0, 1, 1,
0.8929474, 1.059637, 0.3469648, 0.9607843, 0, 1, 1,
0.8974574, -0.2414534, 0.7377144, 0.9686275, 0, 1, 1,
0.9007498, 0.2295135, 2.308864, 0.972549, 0, 1, 1,
0.9009573, -0.2507095, 0.261926, 0.9803922, 0, 1, 1,
0.9050902, 1.11657, 1.432432, 0.9843137, 0, 1, 1,
0.9077307, 1.014584, -1.255381, 0.9921569, 0, 1, 1,
0.9164991, 0.5674165, 2.860146, 0.9960784, 0, 1, 1,
0.9173493, -1.501447, 3.922193, 1, 0, 0.9960784, 1,
0.9227104, -0.07598575, 1.864883, 1, 0, 0.9882353, 1,
0.9258258, 0.4570362, 1.003045, 1, 0, 0.9843137, 1,
0.9297575, 0.04006719, 1.815533, 1, 0, 0.9764706, 1,
0.931545, -0.5422534, 1.750031, 1, 0, 0.972549, 1,
0.9316874, 1.229528, 0.05182532, 1, 0, 0.9647059, 1,
0.9318996, 0.6671129, -0.05927607, 1, 0, 0.9607843, 1,
0.9349819, -0.3788499, 3.180516, 1, 0, 0.9529412, 1,
0.9393458, 0.3859273, 0.7492084, 1, 0, 0.9490196, 1,
0.9396157, 1.832519, -2.438499, 1, 0, 0.9411765, 1,
0.9404678, 0.8920586, 0.3341577, 1, 0, 0.9372549, 1,
0.9410185, -0.4403081, 2.30176, 1, 0, 0.9294118, 1,
0.9532151, -0.1978134, 0.3794782, 1, 0, 0.9254902, 1,
0.9552694, -1.400976, 2.2145, 1, 0, 0.9176471, 1,
0.9560444, 0.05241837, 1.643539, 1, 0, 0.9137255, 1,
0.957729, -1.441483, 3.309388, 1, 0, 0.9058824, 1,
0.9579595, 1.106293, 2.215139, 1, 0, 0.9019608, 1,
0.960174, 0.4049723, -0.01067102, 1, 0, 0.8941177, 1,
0.9636489, -0.1877899, 2.540828, 1, 0, 0.8862745, 1,
0.9646413, 0.8332301, 0.7288595, 1, 0, 0.8823529, 1,
0.9654973, 0.2005118, 4.366327, 1, 0, 0.8745098, 1,
0.9673071, -0.1415278, 2.502455, 1, 0, 0.8705882, 1,
0.9690914, 1.064994, 2.369806, 1, 0, 0.8627451, 1,
0.9731463, 1.004637, 0.9078016, 1, 0, 0.8588235, 1,
0.9756867, 0.3592767, 1.249707, 1, 0, 0.8509804, 1,
0.9757155, 0.02927715, 0.9585227, 1, 0, 0.8470588, 1,
0.9912058, 0.007897746, 0.7485844, 1, 0, 0.8392157, 1,
0.9947612, -0.340979, 1.124046, 1, 0, 0.8352941, 1,
0.9949408, -1.290166, 2.721068, 1, 0, 0.827451, 1,
0.9962437, 0.1667278, 1.285061, 1, 0, 0.8235294, 1,
0.9988071, 0.7716119, 0.9023172, 1, 0, 0.8156863, 1,
1.00039, -0.3480411, 2.925601, 1, 0, 0.8117647, 1,
1.005265, -2.049558, 2.447273, 1, 0, 0.8039216, 1,
1.009842, 2.11403, 0.02963207, 1, 0, 0.7960784, 1,
1.012942, -0.9175295, 1.589967, 1, 0, 0.7921569, 1,
1.013701, 0.5408452, 1.073689, 1, 0, 0.7843137, 1,
1.020477, 1.50417, 1.985093, 1, 0, 0.7803922, 1,
1.027201, -1.306321, 3.714669, 1, 0, 0.772549, 1,
1.032847, 0.3411987, 0.8244691, 1, 0, 0.7686275, 1,
1.03337, -0.831688, 3.749643, 1, 0, 0.7607843, 1,
1.035929, -1.094008, 0.8073483, 1, 0, 0.7568628, 1,
1.036248, 1.10882, 1.361404, 1, 0, 0.7490196, 1,
1.04777, 0.04419507, 2.204394, 1, 0, 0.7450981, 1,
1.048296, 0.3426223, 1.709687, 1, 0, 0.7372549, 1,
1.058836, -0.7654615, 1.55336, 1, 0, 0.7333333, 1,
1.072225, -0.7608953, 2.491125, 1, 0, 0.7254902, 1,
1.07491, 0.4479326, 1.817604, 1, 0, 0.7215686, 1,
1.083853, 1.744732, 0.1716845, 1, 0, 0.7137255, 1,
1.087407, 1.46334, 0.08991323, 1, 0, 0.7098039, 1,
1.095289, 0.4049759, 2.094613, 1, 0, 0.7019608, 1,
1.109081, -1.67858, 4.562955, 1, 0, 0.6941177, 1,
1.115671, 2.266983, 1.637187, 1, 0, 0.6901961, 1,
1.123085, 1.225136, -0.1404972, 1, 0, 0.682353, 1,
1.123473, -1.257018, 3.06521, 1, 0, 0.6784314, 1,
1.132696, 0.156506, 1.307135, 1, 0, 0.6705883, 1,
1.143113, 0.1916594, 0.2486098, 1, 0, 0.6666667, 1,
1.148456, -1.578243, 4.063532, 1, 0, 0.6588235, 1,
1.153559, -0.970448, 2.057657, 1, 0, 0.654902, 1,
1.158927, -1.620092, 1.90692, 1, 0, 0.6470588, 1,
1.159795, 0.07715531, 0.143782, 1, 0, 0.6431373, 1,
1.164121, 0.1846532, 0.3068466, 1, 0, 0.6352941, 1,
1.171853, -0.2826385, 3.093283, 1, 0, 0.6313726, 1,
1.177657, -1.066473, 4.475514, 1, 0, 0.6235294, 1,
1.179826, -1.312967, 4.714195, 1, 0, 0.6196079, 1,
1.192896, 1.623963, -0.3893664, 1, 0, 0.6117647, 1,
1.198091, 0.573837, -0.5414008, 1, 0, 0.6078432, 1,
1.208478, -1.514042, 1.502929, 1, 0, 0.6, 1,
1.214145, -0.08930402, 1.194135, 1, 0, 0.5921569, 1,
1.23857, -1.009733, 2.309951, 1, 0, 0.5882353, 1,
1.239559, 0.821093, 1.661395, 1, 0, 0.5803922, 1,
1.243485, -1.093316, 0.7171351, 1, 0, 0.5764706, 1,
1.245347, -0.2814403, 0.478824, 1, 0, 0.5686275, 1,
1.250842, -0.09008138, 1.516639, 1, 0, 0.5647059, 1,
1.253239, 0.140808, 2.50966, 1, 0, 0.5568628, 1,
1.257514, 0.6366269, 0.560743, 1, 0, 0.5529412, 1,
1.26686, 2.076752, 0.5161806, 1, 0, 0.5450981, 1,
1.26851, 0.835437, 3.072968, 1, 0, 0.5411765, 1,
1.294497, -0.4366852, 2.24893, 1, 0, 0.5333334, 1,
1.29548, 0.6990654, -0.4938385, 1, 0, 0.5294118, 1,
1.297004, -1.296485, 1.932768, 1, 0, 0.5215687, 1,
1.311427, 0.4847109, 1.476462, 1, 0, 0.5176471, 1,
1.32047, -1.776626, 2.32815, 1, 0, 0.509804, 1,
1.322904, -0.4501019, 2.205091, 1, 0, 0.5058824, 1,
1.323126, 0.9634113, 0.6231268, 1, 0, 0.4980392, 1,
1.329162, -1.298458, 3.689065, 1, 0, 0.4901961, 1,
1.334791, 1.495932, 1.249389, 1, 0, 0.4862745, 1,
1.336062, 2.500119, 0.3006537, 1, 0, 0.4784314, 1,
1.364205, 0.9954674, -0.2254327, 1, 0, 0.4745098, 1,
1.366089, 0.6652366, 2.547467, 1, 0, 0.4666667, 1,
1.366536, -1.794636, 4.586154, 1, 0, 0.4627451, 1,
1.368761, 1.803215, -0.8882012, 1, 0, 0.454902, 1,
1.395889, -0.4288792, 1.938378, 1, 0, 0.4509804, 1,
1.396982, -1.317238, 0.9218927, 1, 0, 0.4431373, 1,
1.402378, -1.00792, 2.340432, 1, 0, 0.4392157, 1,
1.403201, -1.330567, 1.858904, 1, 0, 0.4313726, 1,
1.404309, 0.6128051, 1.198833, 1, 0, 0.427451, 1,
1.411905, -2.306857, 2.537271, 1, 0, 0.4196078, 1,
1.426936, -0.1992589, 3.83384, 1, 0, 0.4156863, 1,
1.427867, -0.5120162, 2.05225, 1, 0, 0.4078431, 1,
1.430346, 1.598152, 1.993479, 1, 0, 0.4039216, 1,
1.43348, 0.1860086, 0.5603985, 1, 0, 0.3960784, 1,
1.450494, 0.1748053, 1.403974, 1, 0, 0.3882353, 1,
1.453165, -0.09294219, 2.265613, 1, 0, 0.3843137, 1,
1.455632, 0.1313139, 1.791685, 1, 0, 0.3764706, 1,
1.461205, -0.7295944, 3.038206, 1, 0, 0.372549, 1,
1.462676, -0.2892566, -0.4110899, 1, 0, 0.3647059, 1,
1.47587, 0.5585954, 1.017553, 1, 0, 0.3607843, 1,
1.480037, 0.5717177, 1.363552, 1, 0, 0.3529412, 1,
1.484074, -0.03459056, 2.260457, 1, 0, 0.3490196, 1,
1.48608, 0.1794622, 2.685187, 1, 0, 0.3411765, 1,
1.501033, -1.429895, 3.776023, 1, 0, 0.3372549, 1,
1.52126, 0.01057594, 1.522164, 1, 0, 0.3294118, 1,
1.532898, 1.024722, 1.536811, 1, 0, 0.3254902, 1,
1.53501, 1.342251, 2.184317, 1, 0, 0.3176471, 1,
1.538053, -2.382658, 3.412807, 1, 0, 0.3137255, 1,
1.55336, -0.2783324, 1.268548, 1, 0, 0.3058824, 1,
1.564036, -0.6504739, 3.148933, 1, 0, 0.2980392, 1,
1.567486, 0.665448, 0.3858027, 1, 0, 0.2941177, 1,
1.572829, 1.123443, 2.445451, 1, 0, 0.2862745, 1,
1.579406, -1.502404, 0.4656244, 1, 0, 0.282353, 1,
1.584971, -1.450179, 0.9749488, 1, 0, 0.2745098, 1,
1.586081, -0.4232499, 2.234955, 1, 0, 0.2705882, 1,
1.587865, 1.080539, 1.737487, 1, 0, 0.2627451, 1,
1.639897, -0.1391352, 3.446312, 1, 0, 0.2588235, 1,
1.642083, -0.3521814, 3.181366, 1, 0, 0.2509804, 1,
1.642578, 1.495277, -0.3472787, 1, 0, 0.2470588, 1,
1.65279, -1.834886, 1.51546, 1, 0, 0.2392157, 1,
1.71345, 1.23035, 1.107299, 1, 0, 0.2352941, 1,
1.735852, -0.5544028, 0.5725109, 1, 0, 0.227451, 1,
1.754334, -0.7690523, 2.80919, 1, 0, 0.2235294, 1,
1.757875, -1.262668, 1.373719, 1, 0, 0.2156863, 1,
1.776317, -0.2039415, 0.4000651, 1, 0, 0.2117647, 1,
1.784503, 1.243762, 3.223316, 1, 0, 0.2039216, 1,
1.793495, -1.419837, 2.766969, 1, 0, 0.1960784, 1,
1.807897, 0.1708383, 0.8025823, 1, 0, 0.1921569, 1,
1.81199, -0.04044328, 1.284086, 1, 0, 0.1843137, 1,
1.814241, 0.6726761, 1.423638, 1, 0, 0.1803922, 1,
1.831734, 0.1576119, 2.796943, 1, 0, 0.172549, 1,
1.834926, 0.01496384, 1.484221, 1, 0, 0.1686275, 1,
1.936931, -0.004473954, 1.821126, 1, 0, 0.1607843, 1,
1.939076, -0.3113121, 0.3402716, 1, 0, 0.1568628, 1,
1.95879, -0.06587214, 1.341008, 1, 0, 0.1490196, 1,
1.983473, -0.04054902, 3.518604, 1, 0, 0.145098, 1,
1.991947, -2.435099, 3.376317, 1, 0, 0.1372549, 1,
2.01919, -1.461788, 3.183443, 1, 0, 0.1333333, 1,
2.041353, -0.1384369, -0.191919, 1, 0, 0.1254902, 1,
2.053624, -0.5650406, 2.024586, 1, 0, 0.1215686, 1,
2.069502, -1.018033, 1.529545, 1, 0, 0.1137255, 1,
2.105544, -0.8719559, 3.211233, 1, 0, 0.1098039, 1,
2.108894, -0.1478801, 2.579574, 1, 0, 0.1019608, 1,
2.145078, -0.8695531, 2.547088, 1, 0, 0.09411765, 1,
2.147955, 0.8226528, 2.431141, 1, 0, 0.09019608, 1,
2.224443, 0.1205785, 1.43931, 1, 0, 0.08235294, 1,
2.238296, 1.141795, 1.840466, 1, 0, 0.07843138, 1,
2.24135, 0.1784475, 1.840293, 1, 0, 0.07058824, 1,
2.256913, 1.158011, 0.9291142, 1, 0, 0.06666667, 1,
2.258356, -0.8614049, 2.139078, 1, 0, 0.05882353, 1,
2.327627, 0.5175364, 0.5879313, 1, 0, 0.05490196, 1,
2.41796, -0.9822557, 0.6344689, 1, 0, 0.04705882, 1,
2.580312, 1.148241, 0.673165, 1, 0, 0.04313726, 1,
2.582104, 0.4186809, 2.053252, 1, 0, 0.03529412, 1,
2.648895, 1.423586, 2.795821, 1, 0, 0.03137255, 1,
2.735362, 0.6209986, 2.19293, 1, 0, 0.02352941, 1,
2.776856, -0.5646148, 1.985691, 1, 0, 0.01960784, 1,
2.836516, 0.6991711, 1.820665, 1, 0, 0.01176471, 1,
3.360764, -0.533594, 1.87711, 1, 0, 0.007843138, 1
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
-0.1206313, -4.21159, -6.663046, 0, -0.5, 0.5, 0.5,
-0.1206313, -4.21159, -6.663046, 1, -0.5, 0.5, 0.5,
-0.1206313, -4.21159, -6.663046, 1, 1.5, 0.5, 0.5,
-0.1206313, -4.21159, -6.663046, 0, 1.5, 0.5, 0.5
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
-4.78222, -0.3693593, -6.663046, 0, -0.5, 0.5, 0.5,
-4.78222, -0.3693593, -6.663046, 1, -0.5, 0.5, 0.5,
-4.78222, -0.3693593, -6.663046, 1, 1.5, 0.5, 0.5,
-4.78222, -0.3693593, -6.663046, 0, 1.5, 0.5, 0.5
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
-4.78222, -4.21159, 0.5412819, 0, -0.5, 0.5, 0.5,
-4.78222, -4.21159, 0.5412819, 1, -0.5, 0.5, 0.5,
-4.78222, -4.21159, 0.5412819, 1, 1.5, 0.5, 0.5,
-4.78222, -4.21159, 0.5412819, 0, 1.5, 0.5, 0.5
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
-3, -3.324922, -5.000509,
3, -3.324922, -5.000509,
-3, -3.324922, -5.000509,
-3, -3.4727, -5.277598,
-2, -3.324922, -5.000509,
-2, -3.4727, -5.277598,
-1, -3.324922, -5.000509,
-1, -3.4727, -5.277598,
0, -3.324922, -5.000509,
0, -3.4727, -5.277598,
1, -3.324922, -5.000509,
1, -3.4727, -5.277598,
2, -3.324922, -5.000509,
2, -3.4727, -5.277598,
3, -3.324922, -5.000509,
3, -3.4727, -5.277598
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
-3, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
-3, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
-3, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
-3, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
-2, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
-2, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
-2, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
-2, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
-1, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
-1, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
-1, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
-1, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
0, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
0, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
0, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
0, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
1, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
1, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
1, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
1, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
2, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
2, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
2, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
2, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5,
3, -3.768256, -5.831778, 0, -0.5, 0.5, 0.5,
3, -3.768256, -5.831778, 1, -0.5, 0.5, 0.5,
3, -3.768256, -5.831778, 1, 1.5, 0.5, 0.5,
3, -3.768256, -5.831778, 0, 1.5, 0.5, 0.5
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
-3.706469, -3, -5.000509,
-3.706469, 2, -5.000509,
-3.706469, -3, -5.000509,
-3.885761, -3, -5.277598,
-3.706469, -2, -5.000509,
-3.885761, -2, -5.277598,
-3.706469, -1, -5.000509,
-3.885761, -1, -5.277598,
-3.706469, 0, -5.000509,
-3.885761, 0, -5.277598,
-3.706469, 1, -5.000509,
-3.885761, 1, -5.277598,
-3.706469, 2, -5.000509,
-3.885761, 2, -5.277598
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
-4.244344, -3, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, -3, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, -3, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, -3, -5.831778, 0, 1.5, 0.5, 0.5,
-4.244344, -2, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, -2, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, -2, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, -2, -5.831778, 0, 1.5, 0.5, 0.5,
-4.244344, -1, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, -1, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, -1, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, -1, -5.831778, 0, 1.5, 0.5, 0.5,
-4.244344, 0, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, 0, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, 0, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, 0, -5.831778, 0, 1.5, 0.5, 0.5,
-4.244344, 1, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, 1, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, 1, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, 1, -5.831778, 0, 1.5, 0.5, 0.5,
-4.244344, 2, -5.831778, 0, -0.5, 0.5, 0.5,
-4.244344, 2, -5.831778, 1, -0.5, 0.5, 0.5,
-4.244344, 2, -5.831778, 1, 1.5, 0.5, 0.5,
-4.244344, 2, -5.831778, 0, 1.5, 0.5, 0.5
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
-3.706469, -3.324922, -4,
-3.706469, -3.324922, 4,
-3.706469, -3.324922, -4,
-3.885761, -3.4727, -4,
-3.706469, -3.324922, -2,
-3.885761, -3.4727, -2,
-3.706469, -3.324922, 0,
-3.885761, -3.4727, 0,
-3.706469, -3.324922, 2,
-3.885761, -3.4727, 2,
-3.706469, -3.324922, 4,
-3.885761, -3.4727, 4
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
-4.244344, -3.768256, -4, 0, -0.5, 0.5, 0.5,
-4.244344, -3.768256, -4, 1, -0.5, 0.5, 0.5,
-4.244344, -3.768256, -4, 1, 1.5, 0.5, 0.5,
-4.244344, -3.768256, -4, 0, 1.5, 0.5, 0.5,
-4.244344, -3.768256, -2, 0, -0.5, 0.5, 0.5,
-4.244344, -3.768256, -2, 1, -0.5, 0.5, 0.5,
-4.244344, -3.768256, -2, 1, 1.5, 0.5, 0.5,
-4.244344, -3.768256, -2, 0, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 0, 0, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 0, 1, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 0, 1, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 0, 0, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 2, 0, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 2, 1, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 2, 1, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 2, 0, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 4, 0, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 4, 1, -0.5, 0.5, 0.5,
-4.244344, -3.768256, 4, 1, 1.5, 0.5, 0.5,
-4.244344, -3.768256, 4, 0, 1.5, 0.5, 0.5
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
-3.706469, -3.324922, -5.000509,
-3.706469, 2.586203, -5.000509,
-3.706469, -3.324922, 6.083073,
-3.706469, 2.586203, 6.083073,
-3.706469, -3.324922, -5.000509,
-3.706469, -3.324922, 6.083073,
-3.706469, 2.586203, -5.000509,
-3.706469, 2.586203, 6.083073,
-3.706469, -3.324922, -5.000509,
3.465206, -3.324922, -5.000509,
-3.706469, -3.324922, 6.083073,
3.465206, -3.324922, 6.083073,
-3.706469, 2.586203, -5.000509,
3.465206, 2.586203, -5.000509,
-3.706469, 2.586203, 6.083073,
3.465206, 2.586203, 6.083073,
3.465206, -3.324922, -5.000509,
3.465206, 2.586203, -5.000509,
3.465206, -3.324922, 6.083073,
3.465206, 2.586203, 6.083073,
3.465206, -3.324922, -5.000509,
3.465206, -3.324922, 6.083073,
3.465206, 2.586203, -5.000509,
3.465206, 2.586203, 6.083073
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
var radius = 7.723731;
var distance = 34.36375;
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
mvMatrix.translate( 0.1206313, 0.3693593, -0.5412819 );
mvMatrix.scale( 1.164449, 1.412768, 0.7534613 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36375);
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


