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
-2.881215, -0.5499842, -1.803207, 1, 0, 0, 1,
-2.618847, 0.8078294, -2.386362, 1, 0.007843138, 0, 1,
-2.601362, -0.6559405, 0.5799644, 1, 0.01176471, 0, 1,
-2.575057, -0.7943367, -1.638768, 1, 0.01960784, 0, 1,
-2.514916, 0.2990785, -2.049671, 1, 0.02352941, 0, 1,
-2.445384, -2.054635, -1.390854, 1, 0.03137255, 0, 1,
-2.417499, 1.191013, -2.393367, 1, 0.03529412, 0, 1,
-2.397013, -0.1897338, -1.699066, 1, 0.04313726, 0, 1,
-2.3879, 1.699544, -2.222339, 1, 0.04705882, 0, 1,
-2.387039, -1.266963, -1.024697, 1, 0.05490196, 0, 1,
-2.365947, 0.1318911, -2.834546, 1, 0.05882353, 0, 1,
-2.359727, -1.490452, -0.7475772, 1, 0.06666667, 0, 1,
-2.35181, 0.3367707, -1.732226, 1, 0.07058824, 0, 1,
-2.281797, -0.4828171, -2.665542, 1, 0.07843138, 0, 1,
-2.256221, -0.04815239, -1.263214, 1, 0.08235294, 0, 1,
-2.248049, -0.2506314, -0.7014423, 1, 0.09019608, 0, 1,
-2.244243, 0.5197283, -1.827393, 1, 0.09411765, 0, 1,
-2.217481, -0.2565488, -2.03582, 1, 0.1019608, 0, 1,
-2.214924, 0.09078993, 0.3847693, 1, 0.1098039, 0, 1,
-2.194127, -1.639663, -2.691507, 1, 0.1137255, 0, 1,
-2.187555, 2.473701, -0.5664444, 1, 0.1215686, 0, 1,
-2.16311, 1.32777, -1.930783, 1, 0.1254902, 0, 1,
-2.153213, -0.1060456, 0.1029646, 1, 0.1333333, 0, 1,
-2.121322, -0.8857658, -2.681982, 1, 0.1372549, 0, 1,
-2.119078, 0.4565821, -2.863655, 1, 0.145098, 0, 1,
-2.081993, 0.8936393, -1.813793, 1, 0.1490196, 0, 1,
-2.066637, -0.2116553, -0.5430391, 1, 0.1568628, 0, 1,
-2.05407, 0.2807314, -0.4077865, 1, 0.1607843, 0, 1,
-2.040915, -1.089734, -2.08638, 1, 0.1686275, 0, 1,
-2.013799, -0.1943728, -3.049939, 1, 0.172549, 0, 1,
-1.988913, 0.1745776, -0.5101257, 1, 0.1803922, 0, 1,
-1.988151, 0.8025233, -2.53899, 1, 0.1843137, 0, 1,
-1.986089, 0.9053062, -3.26436, 1, 0.1921569, 0, 1,
-1.963394, -0.2452678, -2.595703, 1, 0.1960784, 0, 1,
-1.958576, -0.2577116, -1.764648, 1, 0.2039216, 0, 1,
-1.939846, -0.3968287, -0.3491926, 1, 0.2117647, 0, 1,
-1.92669, -0.342373, -3.194882, 1, 0.2156863, 0, 1,
-1.89677, 0.2837946, -1.752054, 1, 0.2235294, 0, 1,
-1.887885, -1.099697, -1.91223, 1, 0.227451, 0, 1,
-1.881135, 0.8641759, -0.2951314, 1, 0.2352941, 0, 1,
-1.877203, 1.169267, -1.532633, 1, 0.2392157, 0, 1,
-1.872794, -0.8752917, -1.347415, 1, 0.2470588, 0, 1,
-1.867245, -2.084444, -2.213801, 1, 0.2509804, 0, 1,
-1.85269, -1.326579, -2.813833, 1, 0.2588235, 0, 1,
-1.850964, 0.19263, -1.610863, 1, 0.2627451, 0, 1,
-1.849938, -0.3056014, -1.534349, 1, 0.2705882, 0, 1,
-1.842588, 0.1158092, -0.9524484, 1, 0.2745098, 0, 1,
-1.833856, -0.01238961, -2.958481, 1, 0.282353, 0, 1,
-1.78296, 0.6290753, -2.360261, 1, 0.2862745, 0, 1,
-1.765524, 0.2048424, -0.9743613, 1, 0.2941177, 0, 1,
-1.732511, -1.354427, -2.94475, 1, 0.3019608, 0, 1,
-1.722412, -0.2036242, -1.748472, 1, 0.3058824, 0, 1,
-1.708326, 1.058987, -1.036057, 1, 0.3137255, 0, 1,
-1.702712, -0.5132934, -0.772243, 1, 0.3176471, 0, 1,
-1.698962, -0.4688866, -2.165152, 1, 0.3254902, 0, 1,
-1.69531, -0.8900926, -2.308506, 1, 0.3294118, 0, 1,
-1.690753, -1.01074, -0.2751598, 1, 0.3372549, 0, 1,
-1.680916, -1.295358, -3.105198, 1, 0.3411765, 0, 1,
-1.676708, -0.7718132, -3.37957, 1, 0.3490196, 0, 1,
-1.669786, 0.1360633, -0.2098872, 1, 0.3529412, 0, 1,
-1.667814, -0.6309276, -1.030792, 1, 0.3607843, 0, 1,
-1.643746, 0.2890157, -1.300981, 1, 0.3647059, 0, 1,
-1.636231, 1.723379, 0.9475073, 1, 0.372549, 0, 1,
-1.626778, 0.09043684, -1.940528, 1, 0.3764706, 0, 1,
-1.621737, -0.3355955, -1.337893, 1, 0.3843137, 0, 1,
-1.621576, 0.9027633, 0.1988216, 1, 0.3882353, 0, 1,
-1.620635, 0.1253902, -2.795748, 1, 0.3960784, 0, 1,
-1.612437, -1.295742, -3.249991, 1, 0.4039216, 0, 1,
-1.602334, 1.299843, -0.9620136, 1, 0.4078431, 0, 1,
-1.598631, -0.2440079, -2.372955, 1, 0.4156863, 0, 1,
-1.588774, 0.03151149, -1.078039, 1, 0.4196078, 0, 1,
-1.584406, -0.009734808, -1.974314, 1, 0.427451, 0, 1,
-1.578963, 0.6868525, -0.878584, 1, 0.4313726, 0, 1,
-1.565941, -0.1070081, -0.5909151, 1, 0.4392157, 0, 1,
-1.556278, -0.9068061, -1.461965, 1, 0.4431373, 0, 1,
-1.547557, -0.805949, -1.719298, 1, 0.4509804, 0, 1,
-1.547493, -0.3900474, -1.377891, 1, 0.454902, 0, 1,
-1.541274, -0.1757291, -1.053456, 1, 0.4627451, 0, 1,
-1.531494, -0.7861905, -2.379453, 1, 0.4666667, 0, 1,
-1.515068, 1.295968, -3.930077, 1, 0.4745098, 0, 1,
-1.513773, -0.6470999, -3.852949, 1, 0.4784314, 0, 1,
-1.513061, -0.3358586, -1.521439, 1, 0.4862745, 0, 1,
-1.496548, -0.6550077, -2.199865, 1, 0.4901961, 0, 1,
-1.495373, -0.09669413, -1.674944, 1, 0.4980392, 0, 1,
-1.482145, 1.105156, -0.6034303, 1, 0.5058824, 0, 1,
-1.470056, -0.1739421, -1.428124, 1, 0.509804, 0, 1,
-1.467762, 0.1759451, -1.580469, 1, 0.5176471, 0, 1,
-1.45611, -1.410891, -1.641293, 1, 0.5215687, 0, 1,
-1.447956, -0.03635031, -1.286994, 1, 0.5294118, 0, 1,
-1.44343, -0.1339111, -0.3963712, 1, 0.5333334, 0, 1,
-1.433406, -0.1511951, 0.1515089, 1, 0.5411765, 0, 1,
-1.414057, 0.1082586, -1.039522, 1, 0.5450981, 0, 1,
-1.403687, 1.746821, -1.580505, 1, 0.5529412, 0, 1,
-1.400728, 2.3217, 1.129509, 1, 0.5568628, 0, 1,
-1.398535, 0.3356455, -1.453591, 1, 0.5647059, 0, 1,
-1.398091, 0.367988, -0.127052, 1, 0.5686275, 0, 1,
-1.396315, 1.072838, -1.701547, 1, 0.5764706, 0, 1,
-1.392955, -0.2785637, -2.127979, 1, 0.5803922, 0, 1,
-1.39021, 0.1246672, -0.3431293, 1, 0.5882353, 0, 1,
-1.389587, 1.318238, 0.2709012, 1, 0.5921569, 0, 1,
-1.387219, -0.3488087, -1.591673, 1, 0.6, 0, 1,
-1.380176, -0.1824747, 0.1732779, 1, 0.6078432, 0, 1,
-1.375306, 0.1459309, -1.233869, 1, 0.6117647, 0, 1,
-1.347169, -1.514351, -3.650172, 1, 0.6196079, 0, 1,
-1.340317, -1.626437, -1.15674, 1, 0.6235294, 0, 1,
-1.328991, 0.5398762, -0.5747393, 1, 0.6313726, 0, 1,
-1.326122, 2.339222, -0.5722901, 1, 0.6352941, 0, 1,
-1.320771, 0.4025362, -0.4382354, 1, 0.6431373, 0, 1,
-1.31933, -0.2916591, -0.5618618, 1, 0.6470588, 0, 1,
-1.314173, 0.8251879, 0.03052138, 1, 0.654902, 0, 1,
-1.302281, 1.783173, -1.341211, 1, 0.6588235, 0, 1,
-1.30206, -1.381094, -1.681347, 1, 0.6666667, 0, 1,
-1.297569, 1.747768, 1.769775, 1, 0.6705883, 0, 1,
-1.28689, 0.3182519, -1.606768, 1, 0.6784314, 0, 1,
-1.283814, 0.1936145, -0.7886567, 1, 0.682353, 0, 1,
-1.26668, -1.236919, -0.9975427, 1, 0.6901961, 0, 1,
-1.261471, -1.230505, -2.665423, 1, 0.6941177, 0, 1,
-1.260381, -0.06975434, -3.378278, 1, 0.7019608, 0, 1,
-1.251532, 0.7964601, -1.196699, 1, 0.7098039, 0, 1,
-1.250843, -0.2554716, -2.943241, 1, 0.7137255, 0, 1,
-1.248962, 0.2167843, -0.4066124, 1, 0.7215686, 0, 1,
-1.247078, 0.4721298, 0.3603009, 1, 0.7254902, 0, 1,
-1.239875, 1.226173, -0.4905866, 1, 0.7333333, 0, 1,
-1.238742, 1.079177, -0.5104597, 1, 0.7372549, 0, 1,
-1.234921, -0.49447, -0.9722866, 1, 0.7450981, 0, 1,
-1.233422, 1.974821, 0.2196509, 1, 0.7490196, 0, 1,
-1.23282, -0.6120264, -1.2765, 1, 0.7568628, 0, 1,
-1.223383, -0.7771894, -1.221864, 1, 0.7607843, 0, 1,
-1.220791, 0.3387606, -2.613705, 1, 0.7686275, 0, 1,
-1.21683, -0.587786, -1.948957, 1, 0.772549, 0, 1,
-1.209944, 0.626462, -1.153647, 1, 0.7803922, 0, 1,
-1.20697, 0.9909348, -0.04275524, 1, 0.7843137, 0, 1,
-1.199498, -1.366784, -3.023579, 1, 0.7921569, 0, 1,
-1.176248, 1.593373, -0.3466215, 1, 0.7960784, 0, 1,
-1.175619, -1.267452, -3.776281, 1, 0.8039216, 0, 1,
-1.174831, -0.1040025, -0.8774014, 1, 0.8117647, 0, 1,
-1.166994, -1.510431, -1.561444, 1, 0.8156863, 0, 1,
-1.162633, 1.223713, -1.533703, 1, 0.8235294, 0, 1,
-1.162369, 0.427123, -1.22029, 1, 0.827451, 0, 1,
-1.160075, -1.909985, -3.978397, 1, 0.8352941, 0, 1,
-1.153417, 0.9285822, 0.5509387, 1, 0.8392157, 0, 1,
-1.150019, -0.1737851, -2.383504, 1, 0.8470588, 0, 1,
-1.136212, 1.201691, 0.6655521, 1, 0.8509804, 0, 1,
-1.130112, 0.3006548, -3.053332, 1, 0.8588235, 0, 1,
-1.128775, 0.9930841, 1.049185, 1, 0.8627451, 0, 1,
-1.122667, 0.442279, -0.2628714, 1, 0.8705882, 0, 1,
-1.115309, -0.3106012, -0.8764859, 1, 0.8745098, 0, 1,
-1.112212, 0.3996978, -2.354485, 1, 0.8823529, 0, 1,
-1.106671, -0.8550906, -3.657491, 1, 0.8862745, 0, 1,
-1.09785, -0.1591936, -1.685391, 1, 0.8941177, 0, 1,
-1.086948, 0.0601674, -0.1227628, 1, 0.8980392, 0, 1,
-1.072016, 1.920133, -1.116181, 1, 0.9058824, 0, 1,
-1.061989, 0.3975779, -0.7624633, 1, 0.9137255, 0, 1,
-1.059532, 0.4361656, 0.3922385, 1, 0.9176471, 0, 1,
-1.057248, -1.152184, -1.942773, 1, 0.9254902, 0, 1,
-1.055217, 0.0908628, -0.6276562, 1, 0.9294118, 0, 1,
-1.048494, -1.545991, -3.405051, 1, 0.9372549, 0, 1,
-1.040148, -0.7251863, -1.84149, 1, 0.9411765, 0, 1,
-1.030906, -1.244618, -1.291558, 1, 0.9490196, 0, 1,
-1.02824, -0.0583005, -0.9374532, 1, 0.9529412, 0, 1,
-1.020295, -0.8259457, -2.607682, 1, 0.9607843, 0, 1,
-1.020125, -0.1992233, -1.520441, 1, 0.9647059, 0, 1,
-1.010722, -0.7996315, -0.9763021, 1, 0.972549, 0, 1,
-1.010647, 0.09451016, -1.601375, 1, 0.9764706, 0, 1,
-1.010488, -0.4344626, -0.5555673, 1, 0.9843137, 0, 1,
-0.9973216, -0.284073, 0.4449143, 1, 0.9882353, 0, 1,
-0.988247, -0.09027113, -1.867586, 1, 0.9960784, 0, 1,
-0.9870043, 0.1871162, -2.01749, 0.9960784, 1, 0, 1,
-0.9784868, -2.344733, -2.948968, 0.9921569, 1, 0, 1,
-0.9760636, 1.176063, -0.5804592, 0.9843137, 1, 0, 1,
-0.971208, -2.643819, -3.64027, 0.9803922, 1, 0, 1,
-0.9654892, -0.2201953, -0.3166408, 0.972549, 1, 0, 1,
-0.9549183, -0.09099241, -3.15465, 0.9686275, 1, 0, 1,
-0.9491502, 2.117998, -0.8404132, 0.9607843, 1, 0, 1,
-0.9470716, -0.0833348, -1.156215, 0.9568627, 1, 0, 1,
-0.940201, -2.071825, -3.533098, 0.9490196, 1, 0, 1,
-0.9380642, -0.395836, -2.11623, 0.945098, 1, 0, 1,
-0.9368802, 0.1552837, -4.430479, 0.9372549, 1, 0, 1,
-0.934985, -1.035984, -2.333523, 0.9333333, 1, 0, 1,
-0.932805, -2.117851, -2.221889, 0.9254902, 1, 0, 1,
-0.9299491, -1.953258, -1.477312, 0.9215686, 1, 0, 1,
-0.9268064, 1.42602, 0.3837744, 0.9137255, 1, 0, 1,
-0.9138337, -1.316043, -1.794656, 0.9098039, 1, 0, 1,
-0.903078, 0.7347738, -2.221895, 0.9019608, 1, 0, 1,
-0.8874675, -1.410678, -3.225371, 0.8941177, 1, 0, 1,
-0.8862773, 0.6184933, -0.9811059, 0.8901961, 1, 0, 1,
-0.8857744, 1.025961, -1.260553, 0.8823529, 1, 0, 1,
-0.8851173, -0.653629, -2.301671, 0.8784314, 1, 0, 1,
-0.8786057, 0.6920972, -0.6139106, 0.8705882, 1, 0, 1,
-0.8748474, 0.7465245, -2.207635, 0.8666667, 1, 0, 1,
-0.8662429, -1.804323, -3.156251, 0.8588235, 1, 0, 1,
-0.8660418, 0.7962048, -0.4914509, 0.854902, 1, 0, 1,
-0.8633441, 1.476514, -0.9011297, 0.8470588, 1, 0, 1,
-0.8623825, -0.05634974, -0.8195017, 0.8431373, 1, 0, 1,
-0.8549156, 0.4377098, -1.685762, 0.8352941, 1, 0, 1,
-0.8536974, -0.2201271, 1.728091, 0.8313726, 1, 0, 1,
-0.8514671, 0.008918921, -1.779061, 0.8235294, 1, 0, 1,
-0.8512235, -0.6289553, -2.672861, 0.8196079, 1, 0, 1,
-0.8424379, -0.7142199, -1.823476, 0.8117647, 1, 0, 1,
-0.8336849, -1.090144, -1.823479, 0.8078431, 1, 0, 1,
-0.8281415, 0.6623052, 1.142307, 0.8, 1, 0, 1,
-0.8247916, 1.644629, -1.236235, 0.7921569, 1, 0, 1,
-0.8232315, -1.401248, -3.407683, 0.7882353, 1, 0, 1,
-0.819049, 1.74725, -0.7385418, 0.7803922, 1, 0, 1,
-0.818735, 1.151887, -2.140868, 0.7764706, 1, 0, 1,
-0.8159974, 0.3185408, -1.440552, 0.7686275, 1, 0, 1,
-0.8108827, 1.651595, -0.6518, 0.7647059, 1, 0, 1,
-0.8052351, -2.950457, -5.030408, 0.7568628, 1, 0, 1,
-0.7985315, -0.1184932, -1.275849, 0.7529412, 1, 0, 1,
-0.7954146, -0.4119317, -3.642059, 0.7450981, 1, 0, 1,
-0.7925697, 0.1708481, -2.856638, 0.7411765, 1, 0, 1,
-0.7912726, -0.07625186, -0.3161472, 0.7333333, 1, 0, 1,
-0.7910667, -0.3309233, -3.228456, 0.7294118, 1, 0, 1,
-0.7871555, -0.5068927, -1.875578, 0.7215686, 1, 0, 1,
-0.782391, 0.4962861, -0.9912671, 0.7176471, 1, 0, 1,
-0.7778975, -0.2169748, -3.178893, 0.7098039, 1, 0, 1,
-0.7773139, -0.3023801, -0.7295558, 0.7058824, 1, 0, 1,
-0.7746292, -0.05810361, -1.562815, 0.6980392, 1, 0, 1,
-0.7683703, -0.3124292, -2.869092, 0.6901961, 1, 0, 1,
-0.7669318, -0.886146, -3.224866, 0.6862745, 1, 0, 1,
-0.7633427, -0.8130735, -2.277153, 0.6784314, 1, 0, 1,
-0.757489, 0.343861, -1.980755, 0.6745098, 1, 0, 1,
-0.7572129, 0.7368647, -0.8517334, 0.6666667, 1, 0, 1,
-0.7569207, -0.4061061, -0.7540844, 0.6627451, 1, 0, 1,
-0.7560874, 1.135254, -0.009140797, 0.654902, 1, 0, 1,
-0.7555453, 0.2460791, 1.93099, 0.6509804, 1, 0, 1,
-0.754726, 1.293083, 0.2990218, 0.6431373, 1, 0, 1,
-0.7528517, -0.2055079, -2.403609, 0.6392157, 1, 0, 1,
-0.748096, 0.8328775, -0.72767, 0.6313726, 1, 0, 1,
-0.7453622, -1.831733, -3.646066, 0.627451, 1, 0, 1,
-0.7443842, 1.414877, -0.4004661, 0.6196079, 1, 0, 1,
-0.7389047, -0.07585584, -0.5115542, 0.6156863, 1, 0, 1,
-0.7358465, 0.6402233, -0.2677114, 0.6078432, 1, 0, 1,
-0.7333391, -0.5166847, -2.076285, 0.6039216, 1, 0, 1,
-0.7223657, -1.166745, 0.09848905, 0.5960785, 1, 0, 1,
-0.7193335, -0.6659622, -2.64157, 0.5882353, 1, 0, 1,
-0.718612, -0.3799017, -1.476969, 0.5843138, 1, 0, 1,
-0.7084009, -0.1846546, -0.5356471, 0.5764706, 1, 0, 1,
-0.7051364, 0.3099914, 0.0108972, 0.572549, 1, 0, 1,
-0.7044123, -0.4378585, -2.746495, 0.5647059, 1, 0, 1,
-0.701591, -1.65981, -2.978864, 0.5607843, 1, 0, 1,
-0.6994764, 0.02199495, -0.4842652, 0.5529412, 1, 0, 1,
-0.6989862, -0.4864471, -2.312371, 0.5490196, 1, 0, 1,
-0.6977183, -0.8276986, -2.59129, 0.5411765, 1, 0, 1,
-0.6904684, 0.3112327, 0.1979185, 0.5372549, 1, 0, 1,
-0.6890042, 0.3146184, -2.440938, 0.5294118, 1, 0, 1,
-0.682568, 1.883174, 1.43854, 0.5254902, 1, 0, 1,
-0.6810099, -1.97706, -1.377958, 0.5176471, 1, 0, 1,
-0.6772935, -0.367432, -2.903826, 0.5137255, 1, 0, 1,
-0.6770018, -0.1182791, -1.299978, 0.5058824, 1, 0, 1,
-0.671653, -0.793138, -2.037699, 0.5019608, 1, 0, 1,
-0.6642019, -0.007994571, 0.7724873, 0.4941176, 1, 0, 1,
-0.6634549, 1.24005, -0.2662345, 0.4862745, 1, 0, 1,
-0.659963, 1.536825, 0.2962839, 0.4823529, 1, 0, 1,
-0.6580269, -0.2867426, -1.507872, 0.4745098, 1, 0, 1,
-0.6557733, 1.561298, 1.593761, 0.4705882, 1, 0, 1,
-0.6505036, 0.7865436, -1.686491, 0.4627451, 1, 0, 1,
-0.6489236, -1.32248, -0.3244469, 0.4588235, 1, 0, 1,
-0.6466535, -0.05605954, -0.3355254, 0.4509804, 1, 0, 1,
-0.6456916, 0.5158783, -1.008378, 0.4470588, 1, 0, 1,
-0.6447133, -1.28604, -1.850894, 0.4392157, 1, 0, 1,
-0.6443333, -0.06581951, -2.107595, 0.4352941, 1, 0, 1,
-0.6411852, 0.2798593, -0.3772867, 0.427451, 1, 0, 1,
-0.6387993, 0.6293879, -1.489908, 0.4235294, 1, 0, 1,
-0.6380768, 2.319007, -0.5933261, 0.4156863, 1, 0, 1,
-0.6371222, -0.8376728, -2.694628, 0.4117647, 1, 0, 1,
-0.6336815, 0.3168449, -1.321056, 0.4039216, 1, 0, 1,
-0.6312459, 0.2607751, -1.277712, 0.3960784, 1, 0, 1,
-0.6290369, -0.1288207, -1.340669, 0.3921569, 1, 0, 1,
-0.6262931, 0.5849901, 0.2703978, 0.3843137, 1, 0, 1,
-0.6249649, -0.1739487, -1.057839, 0.3803922, 1, 0, 1,
-0.6237031, 0.02914243, -1.81408, 0.372549, 1, 0, 1,
-0.6170117, -0.3450677, -2.846238, 0.3686275, 1, 0, 1,
-0.6151949, -1.382149, -4.21665, 0.3607843, 1, 0, 1,
-0.613904, 0.1699332, -2.516478, 0.3568628, 1, 0, 1,
-0.6096678, 0.2419158, -1.334234, 0.3490196, 1, 0, 1,
-0.6031691, 0.9913811, -2.6041, 0.345098, 1, 0, 1,
-0.6003782, -0.1090448, -3.09036, 0.3372549, 1, 0, 1,
-0.5954909, 1.101747, 0.1546157, 0.3333333, 1, 0, 1,
-0.5952775, 1.320892, -1.031213, 0.3254902, 1, 0, 1,
-0.5887628, 0.9147493, -0.6230899, 0.3215686, 1, 0, 1,
-0.5832408, -0.3479876, -0.771496, 0.3137255, 1, 0, 1,
-0.5781266, 0.5129051, -0.9137859, 0.3098039, 1, 0, 1,
-0.5680217, 1.217179, 0.5550039, 0.3019608, 1, 0, 1,
-0.56425, 0.6559649, 0.8640915, 0.2941177, 1, 0, 1,
-0.5635821, -0.2949989, -3.091327, 0.2901961, 1, 0, 1,
-0.5581399, -1.004687, -3.00849, 0.282353, 1, 0, 1,
-0.5572513, 0.3910197, -1.068782, 0.2784314, 1, 0, 1,
-0.5564786, -1.416334, -3.37067, 0.2705882, 1, 0, 1,
-0.55412, 1.086799, -1.294443, 0.2666667, 1, 0, 1,
-0.5487043, 0.000306529, 1.157844, 0.2588235, 1, 0, 1,
-0.5435564, 0.1267482, -0.7541288, 0.254902, 1, 0, 1,
-0.5422974, 0.3434176, -1.800134, 0.2470588, 1, 0, 1,
-0.5400081, 2.112537, -1.056172, 0.2431373, 1, 0, 1,
-0.5382553, -0.3161766, -1.408926, 0.2352941, 1, 0, 1,
-0.5312226, 0.4779006, 0.3846001, 0.2313726, 1, 0, 1,
-0.5239776, -0.5233285, -2.704422, 0.2235294, 1, 0, 1,
-0.5199255, 1.063418, -0.05492932, 0.2196078, 1, 0, 1,
-0.5115309, -0.008882485, -2.743742, 0.2117647, 1, 0, 1,
-0.5107062, -1.096893, -3.205515, 0.2078431, 1, 0, 1,
-0.498896, -0.05029957, -0.1297822, 0.2, 1, 0, 1,
-0.4938838, 0.208036, -2.089984, 0.1921569, 1, 0, 1,
-0.4917369, -0.6891875, -1.093399, 0.1882353, 1, 0, 1,
-0.4906028, -2.138262, -4.786095, 0.1803922, 1, 0, 1,
-0.4873466, -0.06167805, -1.451378, 0.1764706, 1, 0, 1,
-0.4837017, -0.08011875, -3.049615, 0.1686275, 1, 0, 1,
-0.474941, 0.4796885, -0.2155384, 0.1647059, 1, 0, 1,
-0.464647, 0.672716, -1.251645, 0.1568628, 1, 0, 1,
-0.4645661, -2.0397, -4.055398, 0.1529412, 1, 0, 1,
-0.4594851, 0.5375301, -1.872477, 0.145098, 1, 0, 1,
-0.4592134, 0.8083961, -0.1447055, 0.1411765, 1, 0, 1,
-0.4529151, -0.09186048, -1.806719, 0.1333333, 1, 0, 1,
-0.4503305, 1.102116, -2.116691, 0.1294118, 1, 0, 1,
-0.4497022, -1.0886, -2.887386, 0.1215686, 1, 0, 1,
-0.4434271, -0.1527695, -2.095, 0.1176471, 1, 0, 1,
-0.4423935, 0.2357064, -1.814971, 0.1098039, 1, 0, 1,
-0.4419509, 0.2783755, -1.300975, 0.1058824, 1, 0, 1,
-0.4401467, 0.5858169, -0.3869424, 0.09803922, 1, 0, 1,
-0.4387118, -0.1270964, -1.588498, 0.09019608, 1, 0, 1,
-0.4363574, 0.1040526, -1.70727, 0.08627451, 1, 0, 1,
-0.4331556, 0.7964407, -2.114343, 0.07843138, 1, 0, 1,
-0.4306745, -1.728799, -1.830405, 0.07450981, 1, 0, 1,
-0.4299935, -0.4477068, -1.681287, 0.06666667, 1, 0, 1,
-0.4275509, -2.456633, -3.261047, 0.0627451, 1, 0, 1,
-0.4245242, 1.11673, 0.4935191, 0.05490196, 1, 0, 1,
-0.4179703, 0.4592229, -0.7989358, 0.05098039, 1, 0, 1,
-0.4166338, -1.732693, -2.547849, 0.04313726, 1, 0, 1,
-0.3956228, 0.3198191, -2.952414, 0.03921569, 1, 0, 1,
-0.390123, 0.100525, -2.025326, 0.03137255, 1, 0, 1,
-0.3891045, 0.5981348, -0.03492139, 0.02745098, 1, 0, 1,
-0.3888268, 0.2741882, 0.1170705, 0.01960784, 1, 0, 1,
-0.3873851, -0.2046297, -3.033218, 0.01568628, 1, 0, 1,
-0.38634, 0.01959473, -0.638381, 0.007843138, 1, 0, 1,
-0.3841341, -0.445191, -4.05201, 0.003921569, 1, 0, 1,
-0.3795717, -0.0960687, -2.901602, 0, 1, 0.003921569, 1,
-0.3785842, -1.361753, -3.862753, 0, 1, 0.01176471, 1,
-0.378093, 1.284165, -1.795581, 0, 1, 0.01568628, 1,
-0.3766147, -0.1292779, -0.1107656, 0, 1, 0.02352941, 1,
-0.3751596, 0.2336087, -0.6475093, 0, 1, 0.02745098, 1,
-0.3728483, 0.8641112, -1.485186, 0, 1, 0.03529412, 1,
-0.3728076, 0.4416054, -1.794495, 0, 1, 0.03921569, 1,
-0.371915, 1.364714, 0.2751335, 0, 1, 0.04705882, 1,
-0.3679468, -0.7449466, -4.117131, 0, 1, 0.05098039, 1,
-0.3667481, 0.1714037, -0.5137252, 0, 1, 0.05882353, 1,
-0.3651284, 0.3248165, -0.01216681, 0, 1, 0.0627451, 1,
-0.3631144, -0.6982007, -3.968565, 0, 1, 0.07058824, 1,
-0.3548659, 0.6702849, -0.2312829, 0, 1, 0.07450981, 1,
-0.3521043, 0.3415267, -0.3372259, 0, 1, 0.08235294, 1,
-0.3514677, -0.9508123, -2.890323, 0, 1, 0.08627451, 1,
-0.3479644, 1.313544, -0.288081, 0, 1, 0.09411765, 1,
-0.345441, 1.143548, 0.7426076, 0, 1, 0.1019608, 1,
-0.3432367, -0.5475041, -4.591916, 0, 1, 0.1058824, 1,
-0.3329137, -0.05556397, -0.2672506, 0, 1, 0.1137255, 1,
-0.3319639, -0.8661781, -2.033114, 0, 1, 0.1176471, 1,
-0.3302884, -0.2388157, -3.799466, 0, 1, 0.1254902, 1,
-0.3274312, 0.894141, -0.8431068, 0, 1, 0.1294118, 1,
-0.325324, -0.3789331, -4.211799, 0, 1, 0.1372549, 1,
-0.3243852, -0.7161751, -3.928509, 0, 1, 0.1411765, 1,
-0.3192472, -1.027627, -1.270023, 0, 1, 0.1490196, 1,
-0.3185357, -0.6997641, -3.01007, 0, 1, 0.1529412, 1,
-0.3153771, -0.74397, -1.957313, 0, 1, 0.1607843, 1,
-0.3147352, 1.593343, 0.8895567, 0, 1, 0.1647059, 1,
-0.314175, -0.5271011, -2.392432, 0, 1, 0.172549, 1,
-0.310862, 0.06796307, -1.972937, 0, 1, 0.1764706, 1,
-0.3104577, 0.09952259, -0.9766818, 0, 1, 0.1843137, 1,
-0.3090719, 0.7935209, 1.166593, 0, 1, 0.1882353, 1,
-0.3033153, 0.1697435, -0.1842503, 0, 1, 0.1960784, 1,
-0.303191, -0.1630636, -1.802432, 0, 1, 0.2039216, 1,
-0.2973217, 0.9942641, 2.070601, 0, 1, 0.2078431, 1,
-0.2880755, 1.843782, -0.2600883, 0, 1, 0.2156863, 1,
-0.2879242, 1.237663, -1.380577, 0, 1, 0.2196078, 1,
-0.2864747, 1.224634, -0.9528116, 0, 1, 0.227451, 1,
-0.2805224, -0.6456892, -2.876448, 0, 1, 0.2313726, 1,
-0.2772715, -0.4532963, -1.700275, 0, 1, 0.2392157, 1,
-0.2746356, -0.8588594, -2.739311, 0, 1, 0.2431373, 1,
-0.273915, -0.3949447, -3.968223, 0, 1, 0.2509804, 1,
-0.2722801, -0.1502291, -2.076955, 0, 1, 0.254902, 1,
-0.2705776, -1.659228, -1.701027, 0, 1, 0.2627451, 1,
-0.2679936, -1.178955, -2.929885, 0, 1, 0.2666667, 1,
-0.2668509, -0.515747, -3.45943, 0, 1, 0.2745098, 1,
-0.2666169, -1.671653, -3.777613, 0, 1, 0.2784314, 1,
-0.2663198, -0.006122055, -1.764871, 0, 1, 0.2862745, 1,
-0.2639548, 0.9157802, 0.8720104, 0, 1, 0.2901961, 1,
-0.2599188, -1.607569, -1.612249, 0, 1, 0.2980392, 1,
-0.257077, -0.643886, -4.088552, 0, 1, 0.3058824, 1,
-0.2522695, -0.4021047, -2.25176, 0, 1, 0.3098039, 1,
-0.2518558, 0.1036124, -0.9061487, 0, 1, 0.3176471, 1,
-0.2475487, 0.8437308, 0.6891887, 0, 1, 0.3215686, 1,
-0.2458122, 0.03567171, -0.2681509, 0, 1, 0.3294118, 1,
-0.2431718, -0.1840382, -2.355037, 0, 1, 0.3333333, 1,
-0.2372386, -1.620047, -0.270422, 0, 1, 0.3411765, 1,
-0.2358219, -1.604535, -4.350285, 0, 1, 0.345098, 1,
-0.2356921, -0.3580148, -1.844243, 0, 1, 0.3529412, 1,
-0.2325245, -2.177107, -2.076155, 0, 1, 0.3568628, 1,
-0.2259045, -0.3889677, -3.315658, 0, 1, 0.3647059, 1,
-0.2242384, -0.998898, -4.888666, 0, 1, 0.3686275, 1,
-0.2205588, 2.447949, -0.08144946, 0, 1, 0.3764706, 1,
-0.2184839, -0.617543, -2.764809, 0, 1, 0.3803922, 1,
-0.2178435, 0.0871487, -2.170501, 0, 1, 0.3882353, 1,
-0.2175474, -0.9990302, -4.385497, 0, 1, 0.3921569, 1,
-0.2142112, -0.5085751, -2.136712, 0, 1, 0.4, 1,
-0.2135369, 1.778927, -0.1415575, 0, 1, 0.4078431, 1,
-0.2072801, -1.375493, -2.863194, 0, 1, 0.4117647, 1,
-0.2054489, -1.120682, -3.503467, 0, 1, 0.4196078, 1,
-0.2026203, -1.410075, -1.397885, 0, 1, 0.4235294, 1,
-0.2011424, 0.2200863, 0.5143017, 0, 1, 0.4313726, 1,
-0.1990556, -0.04696139, -1.123978, 0, 1, 0.4352941, 1,
-0.1977627, 0.02583916, -2.34663, 0, 1, 0.4431373, 1,
-0.1956485, -0.3614465, -1.672884, 0, 1, 0.4470588, 1,
-0.1947926, -0.06656853, -0.9900719, 0, 1, 0.454902, 1,
-0.1946018, 1.254848, 1.773049, 0, 1, 0.4588235, 1,
-0.1934794, -1.350714, -2.576488, 0, 1, 0.4666667, 1,
-0.1934335, 1.124559, -0.8923604, 0, 1, 0.4705882, 1,
-0.1899378, -1.165315, -4.097834, 0, 1, 0.4784314, 1,
-0.1843413, -0.9384659, -3.574772, 0, 1, 0.4823529, 1,
-0.1787352, -0.2126279, -3.00836, 0, 1, 0.4901961, 1,
-0.1782767, 1.684647, 1.493296, 0, 1, 0.4941176, 1,
-0.1741638, 0.3767835, 0.1362842, 0, 1, 0.5019608, 1,
-0.1713221, 0.2283649, -0.1387169, 0, 1, 0.509804, 1,
-0.1658656, 0.09884789, -0.4694464, 0, 1, 0.5137255, 1,
-0.1650826, 0.5228707, -0.05180204, 0, 1, 0.5215687, 1,
-0.163359, 0.6217565, -0.7521993, 0, 1, 0.5254902, 1,
-0.1599152, -0.2887442, -3.948876, 0, 1, 0.5333334, 1,
-0.1576362, -0.2371953, -3.13718, 0, 1, 0.5372549, 1,
-0.1573252, -1.098169, -3.729845, 0, 1, 0.5450981, 1,
-0.1536165, -0.6866696, -1.741426, 0, 1, 0.5490196, 1,
-0.1473701, -0.000431516, -0.9344694, 0, 1, 0.5568628, 1,
-0.1420485, -2.38231, -2.146499, 0, 1, 0.5607843, 1,
-0.1374442, -1.567652, -3.113444, 0, 1, 0.5686275, 1,
-0.1367375, -0.6643904, -4.267442, 0, 1, 0.572549, 1,
-0.1351061, 2.362706, 1.249012, 0, 1, 0.5803922, 1,
-0.1341522, -2.023432, -2.940093, 0, 1, 0.5843138, 1,
-0.1333109, -0.1762508, -3.472223, 0, 1, 0.5921569, 1,
-0.1324967, 0.6854598, 0.01958329, 0, 1, 0.5960785, 1,
-0.1311291, 1.315368, -0.5410368, 0, 1, 0.6039216, 1,
-0.1287728, 0.05463376, -0.4021332, 0, 1, 0.6117647, 1,
-0.1267992, -0.7835878, -4.029855, 0, 1, 0.6156863, 1,
-0.1211034, 1.481826, -0.09615715, 0, 1, 0.6235294, 1,
-0.1167615, 1.229448, 0.5110377, 0, 1, 0.627451, 1,
-0.1161607, -1.028854, -0.6536998, 0, 1, 0.6352941, 1,
-0.1155844, 0.7011163, 0.9098211, 0, 1, 0.6392157, 1,
-0.1110757, -1.631064, -1.956252, 0, 1, 0.6470588, 1,
-0.1077115, 0.2362379, 0.0346493, 0, 1, 0.6509804, 1,
-0.103836, -0.3191539, -2.308727, 0, 1, 0.6588235, 1,
-0.1025126, -1.359107, -2.534704, 0, 1, 0.6627451, 1,
-0.09714355, 0.1795294, 0.5590437, 0, 1, 0.6705883, 1,
-0.09648012, 0.1761515, -0.2675898, 0, 1, 0.6745098, 1,
-0.09445494, 1.94912, -0.2662582, 0, 1, 0.682353, 1,
-0.09374467, 1.358479, 0.4883197, 0, 1, 0.6862745, 1,
-0.09258521, 0.1692945, -2.33598, 0, 1, 0.6941177, 1,
-0.09253858, 0.909898, 1.293315, 0, 1, 0.7019608, 1,
-0.09072314, 0.3375137, -1.073626, 0, 1, 0.7058824, 1,
-0.08939263, 4.028067, -0.8241552, 0, 1, 0.7137255, 1,
-0.08538041, 1.305399, 2.4278, 0, 1, 0.7176471, 1,
-0.08492994, -0.890803, -4.481185, 0, 1, 0.7254902, 1,
-0.082848, 1.246326, 0.0618753, 0, 1, 0.7294118, 1,
-0.08005832, -0.2343251, -2.411874, 0, 1, 0.7372549, 1,
-0.07998303, 0.7180365, 0.472185, 0, 1, 0.7411765, 1,
-0.07833859, -0.3796867, -1.705357, 0, 1, 0.7490196, 1,
-0.07462039, 1.159192, -1.064444, 0, 1, 0.7529412, 1,
-0.07453627, -0.1825947, -1.03486, 0, 1, 0.7607843, 1,
-0.07034847, -0.5476012, -3.701914, 0, 1, 0.7647059, 1,
-0.06984839, 1.120666, -0.3787352, 0, 1, 0.772549, 1,
-0.06958129, -0.09915983, -3.100139, 0, 1, 0.7764706, 1,
-0.06807519, 1.038134, -0.5142273, 0, 1, 0.7843137, 1,
-0.06032787, 0.3560575, 1.241629, 0, 1, 0.7882353, 1,
-0.05871412, -1.88387, -0.6264726, 0, 1, 0.7960784, 1,
-0.05538328, 0.3284857, 0.6389388, 0, 1, 0.8039216, 1,
-0.05056645, -0.5067322, -4.410708, 0, 1, 0.8078431, 1,
-0.05033092, 0.3050659, -1.256225, 0, 1, 0.8156863, 1,
-0.04785793, 0.01685143, -2.16882, 0, 1, 0.8196079, 1,
-0.04366335, -1.691715, -1.850917, 0, 1, 0.827451, 1,
-0.04170105, -1.675334, -3.543103, 0, 1, 0.8313726, 1,
-0.04004586, -0.08809904, -4.008123, 0, 1, 0.8392157, 1,
-0.03577312, 2.028788, 0.6234139, 0, 1, 0.8431373, 1,
-0.02690793, -0.3464727, -4.026682, 0, 1, 0.8509804, 1,
-0.02655007, 0.1288245, -1.521612, 0, 1, 0.854902, 1,
-0.02647789, -1.119634, -3.242461, 0, 1, 0.8627451, 1,
-0.02478787, -1.026768, -4.264641, 0, 1, 0.8666667, 1,
-0.02156619, 0.960271, 1.0066, 0, 1, 0.8745098, 1,
-0.02086456, 0.1461596, 0.4808733, 0, 1, 0.8784314, 1,
-0.01943088, -0.6092112, -4.271361, 0, 1, 0.8862745, 1,
-0.01878736, -0.3374745, -4.147227, 0, 1, 0.8901961, 1,
-0.01654514, -0.4393242, -3.653537, 0, 1, 0.8980392, 1,
-0.01566014, -0.4049991, -5.732768, 0, 1, 0.9058824, 1,
-0.01461755, -0.139963, -2.523026, 0, 1, 0.9098039, 1,
-0.01003099, 0.3756319, -1.10477, 0, 1, 0.9176471, 1,
-0.008528701, 1.126625, -0.02577228, 0, 1, 0.9215686, 1,
-0.007795709, -1.044321, -2.081374, 0, 1, 0.9294118, 1,
-0.007645471, 0.1952485, -1.11986, 0, 1, 0.9333333, 1,
-0.00720363, 1.990385, -0.1555585, 0, 1, 0.9411765, 1,
-0.006223073, 0.09126536, 0.05384465, 0, 1, 0.945098, 1,
-0.004800145, 0.194397, -0.09936799, 0, 1, 0.9529412, 1,
-0.004585619, 0.4070869, -0.3338027, 0, 1, 0.9568627, 1,
0.002432002, -0.6455278, 3.225492, 0, 1, 0.9647059, 1,
0.004060669, -0.06582547, 3.192216, 0, 1, 0.9686275, 1,
0.01226541, 1.660143, 0.4771507, 0, 1, 0.9764706, 1,
0.01524904, 0.6796691, 0.2093563, 0, 1, 0.9803922, 1,
0.02104075, 1.392197, -0.2588522, 0, 1, 0.9882353, 1,
0.02156576, 1.137378, 0.7747169, 0, 1, 0.9921569, 1,
0.02504623, -0.6004475, 3.238196, 0, 1, 1, 1,
0.02719254, 0.1947887, 1.255351, 0, 0.9921569, 1, 1,
0.03193661, 0.3753676, 0.4080462, 0, 0.9882353, 1, 1,
0.03480314, -0.04998425, 1.392095, 0, 0.9803922, 1, 1,
0.03666043, 1.204975, 0.01832779, 0, 0.9764706, 1, 1,
0.03720719, 0.3059888, -0.06368273, 0, 0.9686275, 1, 1,
0.03860119, -1.188405, 4.437785, 0, 0.9647059, 1, 1,
0.05180453, -0.001846072, -0.03130883, 0, 0.9568627, 1, 1,
0.05197614, -0.5362737, 5.744646, 0, 0.9529412, 1, 1,
0.05224782, -0.9710437, 3.962621, 0, 0.945098, 1, 1,
0.0524223, 1.418437, 0.367067, 0, 0.9411765, 1, 1,
0.05535498, 2.205135, 1.005919, 0, 0.9333333, 1, 1,
0.05537462, 2.766896, 0.6676973, 0, 0.9294118, 1, 1,
0.06025672, 0.390222, -0.6220358, 0, 0.9215686, 1, 1,
0.06679632, -0.5957366, 1.805801, 0, 0.9176471, 1, 1,
0.08065867, 1.421772, -0.4937678, 0, 0.9098039, 1, 1,
0.08196221, -0.03405236, 3.818711, 0, 0.9058824, 1, 1,
0.08251382, 1.253569, -0.539001, 0, 0.8980392, 1, 1,
0.08635365, 1.279453, 0.219823, 0, 0.8901961, 1, 1,
0.09241372, -0.1766166, 2.73454, 0, 0.8862745, 1, 1,
0.09690605, -0.003136854, 0.8393542, 0, 0.8784314, 1, 1,
0.09717459, 1.489826, 0.5537578, 0, 0.8745098, 1, 1,
0.1054299, -0.7751933, 2.815816, 0, 0.8666667, 1, 1,
0.107147, 1.845518, -0.02205466, 0, 0.8627451, 1, 1,
0.1090265, -0.4159566, 2.916446, 0, 0.854902, 1, 1,
0.1115417, 0.1806591, 0.781155, 0, 0.8509804, 1, 1,
0.1115994, -1.30224, 1.481156, 0, 0.8431373, 1, 1,
0.1119411, 0.1769722, -0.4299238, 0, 0.8392157, 1, 1,
0.1137509, 0.524393, -0.04978231, 0, 0.8313726, 1, 1,
0.1141662, 0.7216572, 0.5427354, 0, 0.827451, 1, 1,
0.1146768, -0.03057244, 0.9402065, 0, 0.8196079, 1, 1,
0.1177435, -0.8692874, 4.441121, 0, 0.8156863, 1, 1,
0.1183046, -0.9340858, 2.484119, 0, 0.8078431, 1, 1,
0.1208804, 2.395213, 1.741329, 0, 0.8039216, 1, 1,
0.1232992, 0.3726776, -1.080234, 0, 0.7960784, 1, 1,
0.1243026, -1.210763, 3.12046, 0, 0.7882353, 1, 1,
0.1249005, -3.887972, 3.46556, 0, 0.7843137, 1, 1,
0.1335513, -1.813023, 2.92436, 0, 0.7764706, 1, 1,
0.1335712, 1.167601, 0.9854499, 0, 0.772549, 1, 1,
0.1338641, -1.818881, 1.852104, 0, 0.7647059, 1, 1,
0.1389606, 0.2950686, 0.4151432, 0, 0.7607843, 1, 1,
0.1396432, 0.1119556, 2.769826, 0, 0.7529412, 1, 1,
0.1397977, 1.047626, 0.6956984, 0, 0.7490196, 1, 1,
0.1409837, 0.2096561, -0.3647289, 0, 0.7411765, 1, 1,
0.1421222, 0.6938917, 0.007876238, 0, 0.7372549, 1, 1,
0.1423131, -0.7293683, 3.774168, 0, 0.7294118, 1, 1,
0.1425681, -1.016896, 1.026572, 0, 0.7254902, 1, 1,
0.1471426, 0.948495, -0.2854356, 0, 0.7176471, 1, 1,
0.1590003, -0.1161712, 2.774945, 0, 0.7137255, 1, 1,
0.1617119, 0.3244485, -0.3194993, 0, 0.7058824, 1, 1,
0.1625911, 1.296424, -0.7950935, 0, 0.6980392, 1, 1,
0.1628945, 1.028754, 0.381099, 0, 0.6941177, 1, 1,
0.1653616, -0.6246528, 4.992251, 0, 0.6862745, 1, 1,
0.1669037, 0.1290534, 1.04351, 0, 0.682353, 1, 1,
0.1703609, -0.217225, 2.916807, 0, 0.6745098, 1, 1,
0.1750302, 0.3467693, -0.01137898, 0, 0.6705883, 1, 1,
0.1757499, 0.4246786, 1.51224, 0, 0.6627451, 1, 1,
0.1766247, 1.542865, -1.836819, 0, 0.6588235, 1, 1,
0.1800398, -0.3951793, 3.844725, 0, 0.6509804, 1, 1,
0.1928165, 0.2440123, 1.679144, 0, 0.6470588, 1, 1,
0.1990252, 1.293994, -0.2010674, 0, 0.6392157, 1, 1,
0.2027301, -0.8254215, 0.2262193, 0, 0.6352941, 1, 1,
0.2071137, -0.9124653, 2.220244, 0, 0.627451, 1, 1,
0.2117825, 0.3307294, 0.842957, 0, 0.6235294, 1, 1,
0.2120222, -2.290886, 3.162728, 0, 0.6156863, 1, 1,
0.2143364, -1.233404, 2.691676, 0, 0.6117647, 1, 1,
0.216274, 0.4788527, 0.4172023, 0, 0.6039216, 1, 1,
0.2169272, -1.236107, 4.960831, 0, 0.5960785, 1, 1,
0.2178429, 0.1761497, 1.080968, 0, 0.5921569, 1, 1,
0.2189371, -0.03763739, 2.416448, 0, 0.5843138, 1, 1,
0.2211921, 0.4990007, 1.984542, 0, 0.5803922, 1, 1,
0.2226713, 1.117449, 1.611577, 0, 0.572549, 1, 1,
0.2228519, -1.837846, 3.794037, 0, 0.5686275, 1, 1,
0.2231857, 1.902064, 1.691526, 0, 0.5607843, 1, 1,
0.2324918, -0.2598663, 1.489219, 0, 0.5568628, 1, 1,
0.2334652, -2.022696, 2.935564, 0, 0.5490196, 1, 1,
0.2436736, 0.9791891, 1.56196, 0, 0.5450981, 1, 1,
0.2451221, -0.3155736, 3.265541, 0, 0.5372549, 1, 1,
0.2473934, -1.718087, 4.002648, 0, 0.5333334, 1, 1,
0.2495444, -0.4132405, 2.434301, 0, 0.5254902, 1, 1,
0.2500468, 0.4513673, 1.036012, 0, 0.5215687, 1, 1,
0.250124, -1.00326, 4.204212, 0, 0.5137255, 1, 1,
0.2501557, 0.6860292, -0.05649285, 0, 0.509804, 1, 1,
0.2534665, 1.126334, 0.524971, 0, 0.5019608, 1, 1,
0.2564961, 0.9212382, -1.007438, 0, 0.4941176, 1, 1,
0.256659, -1.374559, 4.001264, 0, 0.4901961, 1, 1,
0.2575183, 0.2709177, 0.5617835, 0, 0.4823529, 1, 1,
0.2651506, -1.365876, 3.475744, 0, 0.4784314, 1, 1,
0.2662811, 0.6988741, 1.309518, 0, 0.4705882, 1, 1,
0.26808, 1.638948, -1.837692, 0, 0.4666667, 1, 1,
0.2697434, 1.018388, 1.082537, 0, 0.4588235, 1, 1,
0.2749628, 0.3120738, 0.9257994, 0, 0.454902, 1, 1,
0.275348, -0.01136374, 1.778186, 0, 0.4470588, 1, 1,
0.2776759, -0.02059963, 3.092145, 0, 0.4431373, 1, 1,
0.2780371, -0.3157765, 2.790516, 0, 0.4352941, 1, 1,
0.27999, -0.5303565, 3.588957, 0, 0.4313726, 1, 1,
0.2860129, -0.08024327, 1.520429, 0, 0.4235294, 1, 1,
0.2872594, 1.142327, 0.1482963, 0, 0.4196078, 1, 1,
0.2973059, 0.931896, -1.341569, 0, 0.4117647, 1, 1,
0.3007801, 0.1117925, 2.488899, 0, 0.4078431, 1, 1,
0.3034933, 0.4340608, 0.09231205, 0, 0.4, 1, 1,
0.3036123, 0.2333343, 1.534191, 0, 0.3921569, 1, 1,
0.3036814, 0.218635, -1.673124, 0, 0.3882353, 1, 1,
0.3079704, -0.9776503, 3.284283, 0, 0.3803922, 1, 1,
0.3095303, 2, 1.458586, 0, 0.3764706, 1, 1,
0.3109697, 0.05004313, 0.4457712, 0, 0.3686275, 1, 1,
0.3140065, 1.189446, 0.1996863, 0, 0.3647059, 1, 1,
0.3161379, -0.9068742, 2.40616, 0, 0.3568628, 1, 1,
0.3225311, 0.1192595, 2.201009, 0, 0.3529412, 1, 1,
0.3239576, -1.89145, 4.31314, 0, 0.345098, 1, 1,
0.3267489, 0.2215345, 0.09929546, 0, 0.3411765, 1, 1,
0.3271317, -1.347126, 3.208461, 0, 0.3333333, 1, 1,
0.3362631, 0.157675, -0.1081433, 0, 0.3294118, 1, 1,
0.3368503, 0.12208, 0.214791, 0, 0.3215686, 1, 1,
0.3458167, -1.096281, 3.178858, 0, 0.3176471, 1, 1,
0.3460701, -0.1461572, 4.314065, 0, 0.3098039, 1, 1,
0.3470094, -0.06096647, 0.3356964, 0, 0.3058824, 1, 1,
0.3500353, 0.1075703, 1.319346, 0, 0.2980392, 1, 1,
0.3501416, 1.29727, -1.232451, 0, 0.2901961, 1, 1,
0.3549975, 1.146203, 2.071192, 0, 0.2862745, 1, 1,
0.3581289, -0.2805913, 0.1072685, 0, 0.2784314, 1, 1,
0.35817, 0.4865602, 0.6732106, 0, 0.2745098, 1, 1,
0.3588793, -0.3075108, 3.061598, 0, 0.2666667, 1, 1,
0.3588923, -1.314634, 3.122121, 0, 0.2627451, 1, 1,
0.3593301, -0.6798844, 2.829556, 0, 0.254902, 1, 1,
0.3674841, -0.4195651, 1.380463, 0, 0.2509804, 1, 1,
0.3686374, 0.5538772, 0.9347876, 0, 0.2431373, 1, 1,
0.3707056, 1.008657, -0.01102486, 0, 0.2392157, 1, 1,
0.3723252, -0.1205855, 0.0897467, 0, 0.2313726, 1, 1,
0.3751639, -1.832847, 1.727602, 0, 0.227451, 1, 1,
0.3757977, -1.547324, 2.486804, 0, 0.2196078, 1, 1,
0.3774269, -1.892342, 2.462243, 0, 0.2156863, 1, 1,
0.3778539, 0.0248821, 1.343608, 0, 0.2078431, 1, 1,
0.3802487, 0.1431831, 1.436355, 0, 0.2039216, 1, 1,
0.3809507, 0.05430356, 0.1203144, 0, 0.1960784, 1, 1,
0.3812059, 0.8462239, 0.1463037, 0, 0.1882353, 1, 1,
0.3822144, 0.1394615, 1.914836, 0, 0.1843137, 1, 1,
0.3834007, 0.6307501, 0.4708259, 0, 0.1764706, 1, 1,
0.3834366, 0.1498941, 1.496489, 0, 0.172549, 1, 1,
0.3855031, -0.1666646, 2.135939, 0, 0.1647059, 1, 1,
0.3864364, -0.1413552, 2.834027, 0, 0.1607843, 1, 1,
0.3896615, 0.772903, -0.6464707, 0, 0.1529412, 1, 1,
0.3940992, 0.3251276, 0.1571412, 0, 0.1490196, 1, 1,
0.3966514, -0.960436, 3.139592, 0, 0.1411765, 1, 1,
0.3977628, -1.45396, 2.982493, 0, 0.1372549, 1, 1,
0.4020917, -0.8074732, 2.626834, 0, 0.1294118, 1, 1,
0.4030196, -1.4155, 1.938501, 0, 0.1254902, 1, 1,
0.4044272, -2.192312, 2.81416, 0, 0.1176471, 1, 1,
0.4059528, -0.2208387, 2.212918, 0, 0.1137255, 1, 1,
0.4063939, -0.5403544, 2.077679, 0, 0.1058824, 1, 1,
0.4111503, 0.5560481, 0.09966673, 0, 0.09803922, 1, 1,
0.4155661, 1.162409, 0.9000323, 0, 0.09411765, 1, 1,
0.4204622, -0.3589009, 2.024175, 0, 0.08627451, 1, 1,
0.4207765, 0.8409104, 0.8060113, 0, 0.08235294, 1, 1,
0.4245932, 0.4779023, 1.517783, 0, 0.07450981, 1, 1,
0.4297162, 1.066618, -0.4663265, 0, 0.07058824, 1, 1,
0.4386421, -0.6510339, 4.053453, 0, 0.0627451, 1, 1,
0.4403415, 0.74546, 0.270176, 0, 0.05882353, 1, 1,
0.4410092, 1.447162, -0.7836158, 0, 0.05098039, 1, 1,
0.4420326, -0.3462296, 1.594237, 0, 0.04705882, 1, 1,
0.4425254, 0.2224576, 2.301008, 0, 0.03921569, 1, 1,
0.4439186, -1.089061, 2.21049, 0, 0.03529412, 1, 1,
0.447498, -1.971774, 2.107969, 0, 0.02745098, 1, 1,
0.45159, 0.3698185, 1.845795, 0, 0.02352941, 1, 1,
0.4550676, 0.5041032, 0.637736, 0, 0.01568628, 1, 1,
0.4628754, 0.620639, 2.587175, 0, 0.01176471, 1, 1,
0.4643986, 0.3176938, 1.925156, 0, 0.003921569, 1, 1,
0.4679065, 0.3119997, -0.4402387, 0.003921569, 0, 1, 1,
0.4709379, 0.1985326, 2.109537, 0.007843138, 0, 1, 1,
0.4852651, 0.04218799, 0.7093428, 0.01568628, 0, 1, 1,
0.4879722, 1.2996, -2.127013, 0.01960784, 0, 1, 1,
0.4918343, -0.04757453, 2.195444, 0.02745098, 0, 1, 1,
0.4935246, -0.4550957, 2.659626, 0.03137255, 0, 1, 1,
0.4949062, -0.747576, 2.403976, 0.03921569, 0, 1, 1,
0.4985452, -0.1518984, 2.232008, 0.04313726, 0, 1, 1,
0.5003878, -1.358872, 2.2704, 0.05098039, 0, 1, 1,
0.5006211, -2.226912, 2.170444, 0.05490196, 0, 1, 1,
0.5007448, -0.6066363, 1.169223, 0.0627451, 0, 1, 1,
0.5061132, -0.851009, 3.398427, 0.06666667, 0, 1, 1,
0.5087983, 0.6250049, 0.307334, 0.07450981, 0, 1, 1,
0.5109167, 0.2840869, 1.024009, 0.07843138, 0, 1, 1,
0.5117158, -1.346118, 2.392705, 0.08627451, 0, 1, 1,
0.5145735, 0.3239571, 0.7692658, 0.09019608, 0, 1, 1,
0.5167843, -0.6010671, 2.49617, 0.09803922, 0, 1, 1,
0.5190008, 0.9383669, -0.1742616, 0.1058824, 0, 1, 1,
0.5201434, -0.01383744, 0.7264001, 0.1098039, 0, 1, 1,
0.5211216, 0.6669552, 0.5295494, 0.1176471, 0, 1, 1,
0.5221375, 2.541639, 0.5953007, 0.1215686, 0, 1, 1,
0.5236747, -1.658701, 4.938532, 0.1294118, 0, 1, 1,
0.5277994, 1.16655, 0.05693199, 0.1333333, 0, 1, 1,
0.5299079, -1.334948, 2.227146, 0.1411765, 0, 1, 1,
0.5304306, -0.9953123, 2.831122, 0.145098, 0, 1, 1,
0.5306159, 0.9073656, -0.8259422, 0.1529412, 0, 1, 1,
0.5337644, -0.6513771, 3.202015, 0.1568628, 0, 1, 1,
0.5347675, -0.4732115, 1.180223, 0.1647059, 0, 1, 1,
0.5397761, -0.4226889, 2.339022, 0.1686275, 0, 1, 1,
0.5460889, -0.5297216, 2.343773, 0.1764706, 0, 1, 1,
0.5492946, 0.05889232, 2.42053, 0.1803922, 0, 1, 1,
0.5533492, -2.0859, 2.317794, 0.1882353, 0, 1, 1,
0.5583194, -0.09698232, 1.140678, 0.1921569, 0, 1, 1,
0.5594823, -0.7969256, 1.538046, 0.2, 0, 1, 1,
0.5615311, 0.01923582, 2.005954, 0.2078431, 0, 1, 1,
0.5615889, -0.5393236, 0.5616581, 0.2117647, 0, 1, 1,
0.5649214, -0.9320574, 0.9378927, 0.2196078, 0, 1, 1,
0.5657337, 0.3419395, -0.03974503, 0.2235294, 0, 1, 1,
0.5721409, -0.7196963, 2.970478, 0.2313726, 0, 1, 1,
0.5770269, 1.215254, 0.1263377, 0.2352941, 0, 1, 1,
0.5770884, 1.251148, 1.994339, 0.2431373, 0, 1, 1,
0.5840703, -0.4289471, 3.165917, 0.2470588, 0, 1, 1,
0.5882638, -0.362536, 2.609828, 0.254902, 0, 1, 1,
0.5889961, 1.417786, -0.05921056, 0.2588235, 0, 1, 1,
0.5893226, -1.081709, 3.859487, 0.2666667, 0, 1, 1,
0.5917543, -0.1252312, 3.089792, 0.2705882, 0, 1, 1,
0.5940408, -1.377601, 2.248771, 0.2784314, 0, 1, 1,
0.6023633, -0.9787763, 2.340662, 0.282353, 0, 1, 1,
0.6024517, 1.65122, 0.8073067, 0.2901961, 0, 1, 1,
0.6060302, 1.692567, 0.1982637, 0.2941177, 0, 1, 1,
0.6061311, -0.706022, 3.271449, 0.3019608, 0, 1, 1,
0.6130502, -0.4219885, 2.27145, 0.3098039, 0, 1, 1,
0.6150072, 0.1035744, 1.23006, 0.3137255, 0, 1, 1,
0.6150837, -0.4104982, 0.8428427, 0.3215686, 0, 1, 1,
0.6153011, 0.240669, 2.773423, 0.3254902, 0, 1, 1,
0.6157871, -2.491243, 2.017621, 0.3333333, 0, 1, 1,
0.620324, -0.3138258, 0.6532527, 0.3372549, 0, 1, 1,
0.6218003, -0.661216, 1.641137, 0.345098, 0, 1, 1,
0.6222917, 2.63524, -0.9254142, 0.3490196, 0, 1, 1,
0.6267467, 0.4699634, 0.7865974, 0.3568628, 0, 1, 1,
0.6317545, 0.1371103, 1.457814, 0.3607843, 0, 1, 1,
0.6335664, -0.7691508, 2.624674, 0.3686275, 0, 1, 1,
0.6344448, 0.00272382, 1.396347, 0.372549, 0, 1, 1,
0.6345654, -1.248938, 2.011628, 0.3803922, 0, 1, 1,
0.6351246, -0.4051515, 3.187449, 0.3843137, 0, 1, 1,
0.6361951, 1.060847, -0.2123549, 0.3921569, 0, 1, 1,
0.6420196, 1.792664, -0.297314, 0.3960784, 0, 1, 1,
0.6436886, 0.9505067, 1.238919, 0.4039216, 0, 1, 1,
0.6480442, 1.399304, 0.8239595, 0.4117647, 0, 1, 1,
0.6500679, 0.5985952, 1.091277, 0.4156863, 0, 1, 1,
0.6515583, -0.3196539, 1.026058, 0.4235294, 0, 1, 1,
0.6566129, -0.3216204, 0.9283092, 0.427451, 0, 1, 1,
0.6578155, -2.045389, 3.646228, 0.4352941, 0, 1, 1,
0.6584573, -1.036165, 2.96336, 0.4392157, 0, 1, 1,
0.6646608, -0.3728383, 1.515551, 0.4470588, 0, 1, 1,
0.6646721, -0.8845171, 3.471405, 0.4509804, 0, 1, 1,
0.665536, 0.8099539, 1.932678, 0.4588235, 0, 1, 1,
0.6698663, 0.6559559, 1.081439, 0.4627451, 0, 1, 1,
0.6761838, 0.7386764, -1.061314, 0.4705882, 0, 1, 1,
0.6805351, -1.954361, 3.134048, 0.4745098, 0, 1, 1,
0.6834433, -0.3414503, 0.6725652, 0.4823529, 0, 1, 1,
0.6867411, 0.1789316, -1.097674, 0.4862745, 0, 1, 1,
0.6886991, 2.080063, -0.7049393, 0.4941176, 0, 1, 1,
0.6906436, 1.091154, 1.644036, 0.5019608, 0, 1, 1,
0.6911131, 0.2890207, 0.1506522, 0.5058824, 0, 1, 1,
0.6932988, -0.006752766, 3.015606, 0.5137255, 0, 1, 1,
0.6942024, -1.028174, 2.617632, 0.5176471, 0, 1, 1,
0.6979668, 0.336704, 1.18651, 0.5254902, 0, 1, 1,
0.7023475, -0.3440192, 3.020712, 0.5294118, 0, 1, 1,
0.7141576, -0.152704, 0.7905613, 0.5372549, 0, 1, 1,
0.7175096, -1.493601, 2.576457, 0.5411765, 0, 1, 1,
0.7198564, -0.2110828, 2.322588, 0.5490196, 0, 1, 1,
0.7259658, 0.1871708, 3.204703, 0.5529412, 0, 1, 1,
0.7319852, 0.2090555, 1.296689, 0.5607843, 0, 1, 1,
0.7332386, -0.1470363, 2.133837, 0.5647059, 0, 1, 1,
0.7386829, 0.006851948, 1.758402, 0.572549, 0, 1, 1,
0.7415062, 1.756218, 0.9248463, 0.5764706, 0, 1, 1,
0.7423971, 0.1303386, 2.03116, 0.5843138, 0, 1, 1,
0.7451608, -1.842245, 3.993154, 0.5882353, 0, 1, 1,
0.74707, 0.7910017, -0.4544581, 0.5960785, 0, 1, 1,
0.7499334, 1.471921, -0.2002791, 0.6039216, 0, 1, 1,
0.7508942, 0.8601953, 2.120822, 0.6078432, 0, 1, 1,
0.7596475, -1.159977, 2.120486, 0.6156863, 0, 1, 1,
0.7638708, -0.8292735, 4.101317, 0.6196079, 0, 1, 1,
0.7681499, -0.4311894, 1.758936, 0.627451, 0, 1, 1,
0.7699689, 0.2732397, 0.06913113, 0.6313726, 0, 1, 1,
0.7745988, -0.3071451, 0.3085753, 0.6392157, 0, 1, 1,
0.7773299, 0.1648357, 0.8365881, 0.6431373, 0, 1, 1,
0.7803144, -0.1143228, 0.94921, 0.6509804, 0, 1, 1,
0.7816029, 0.3551946, 1.57831, 0.654902, 0, 1, 1,
0.7897974, 0.73963, 1.995667, 0.6627451, 0, 1, 1,
0.7904506, -0.8753896, 3.50939, 0.6666667, 0, 1, 1,
0.7910146, -0.8485978, 0.781278, 0.6745098, 0, 1, 1,
0.7915801, 1.349625, 1.211059, 0.6784314, 0, 1, 1,
0.792398, -0.5238221, 0.2591043, 0.6862745, 0, 1, 1,
0.7941762, 0.1174115, -0.4215782, 0.6901961, 0, 1, 1,
0.7969182, 0.280274, -0.1046459, 0.6980392, 0, 1, 1,
0.7986175, -0.3860207, 3.745009, 0.7058824, 0, 1, 1,
0.7990126, -0.8095824, 1.926995, 0.7098039, 0, 1, 1,
0.8018419, 0.659282, 1.307226, 0.7176471, 0, 1, 1,
0.8038285, -0.2690594, 2.041518, 0.7215686, 0, 1, 1,
0.8040689, -0.8929249, 0.1140494, 0.7294118, 0, 1, 1,
0.8094412, 0.9925674, 0.5199131, 0.7333333, 0, 1, 1,
0.8121231, 0.157163, 1.275875, 0.7411765, 0, 1, 1,
0.8147348, 1.262504, 1.197004, 0.7450981, 0, 1, 1,
0.8191779, -2.158283, 2.91438, 0.7529412, 0, 1, 1,
0.8193558, -0.4230884, 2.786837, 0.7568628, 0, 1, 1,
0.8202177, -1.515104, 2.987289, 0.7647059, 0, 1, 1,
0.8243643, 1.22658, 2.085744, 0.7686275, 0, 1, 1,
0.8254812, -0.4275367, 1.839674, 0.7764706, 0, 1, 1,
0.829811, -0.04039653, 2.250623, 0.7803922, 0, 1, 1,
0.8301511, -0.5130247, 1.394448, 0.7882353, 0, 1, 1,
0.8334786, -1.529074, 1.734696, 0.7921569, 0, 1, 1,
0.8368493, 1.40215, -0.9554716, 0.8, 0, 1, 1,
0.8434073, 0.1196021, 0.9243695, 0.8078431, 0, 1, 1,
0.8448398, -0.9468867, 0.3936923, 0.8117647, 0, 1, 1,
0.8488183, -1.59207, 2.26481, 0.8196079, 0, 1, 1,
0.8504797, 0.07854029, 2.614637, 0.8235294, 0, 1, 1,
0.8509204, -0.8373088, 2.835317, 0.8313726, 0, 1, 1,
0.8522569, 1.208592, -0.1633985, 0.8352941, 0, 1, 1,
0.8607801, -0.7520958, 2.387338, 0.8431373, 0, 1, 1,
0.8661877, -0.4403917, 2.858006, 0.8470588, 0, 1, 1,
0.8698049, -0.4702509, 2.290195, 0.854902, 0, 1, 1,
0.8701662, 0.9300927, -0.1181675, 0.8588235, 0, 1, 1,
0.8711379, 1.056218, 1.673953, 0.8666667, 0, 1, 1,
0.8744734, 0.6077175, -0.2313015, 0.8705882, 0, 1, 1,
0.8841637, 1.140244, -1.684873, 0.8784314, 0, 1, 1,
0.8911353, 1.461683, 2.12329, 0.8823529, 0, 1, 1,
0.893958, 1.530067, 0.1119989, 0.8901961, 0, 1, 1,
0.8995031, -0.605489, 1.845608, 0.8941177, 0, 1, 1,
0.9033819, -0.1999851, 1.479592, 0.9019608, 0, 1, 1,
0.9091364, -0.1703776, 1.254101, 0.9098039, 0, 1, 1,
0.9101616, -0.873763, 3.40962, 0.9137255, 0, 1, 1,
0.9144139, 0.07426615, 0.466252, 0.9215686, 0, 1, 1,
0.9265042, -0.8068205, 2.410448, 0.9254902, 0, 1, 1,
0.9323969, -0.01027683, 0.7117392, 0.9333333, 0, 1, 1,
0.9408566, -0.8299154, 2.028029, 0.9372549, 0, 1, 1,
0.942005, -0.3548763, 2.783066, 0.945098, 0, 1, 1,
0.9495524, 0.0185874, 1.310395, 0.9490196, 0, 1, 1,
0.9552653, 1.91767, 0.6791657, 0.9568627, 0, 1, 1,
0.9562365, -0.243627, 2.268152, 0.9607843, 0, 1, 1,
0.9725149, 0.1833232, 1.07959, 0.9686275, 0, 1, 1,
0.97305, 0.3914174, 2.024391, 0.972549, 0, 1, 1,
0.9751506, 1.099936, 0.597614, 0.9803922, 0, 1, 1,
0.9764327, 0.6921511, 1.125188, 0.9843137, 0, 1, 1,
0.9787747, -0.7238224, 1.153276, 0.9921569, 0, 1, 1,
0.9794438, 0.4977482, 0.5305434, 0.9960784, 0, 1, 1,
0.9802107, 0.5382317, 1.058003, 1, 0, 0.9960784, 1,
0.9834625, 0.6553181, -0.1226525, 1, 0, 0.9882353, 1,
0.9884235, 1.61753, 1.773907, 1, 0, 0.9843137, 1,
0.9899486, -0.7309889, 1.111755, 1, 0, 0.9764706, 1,
0.9934182, -0.2588709, 2.75897, 1, 0, 0.972549, 1,
0.9935004, 1.248206, 0.5679184, 1, 0, 0.9647059, 1,
1.008501, -0.2836425, 1.190992, 1, 0, 0.9607843, 1,
1.009929, -0.6288597, 2.039966, 1, 0, 0.9529412, 1,
1.011414, -0.9657555, 1.402704, 1, 0, 0.9490196, 1,
1.013461, -2.042586, 3.013314, 1, 0, 0.9411765, 1,
1.018269, 0.3595495, 2.171981, 1, 0, 0.9372549, 1,
1.020362, 0.8377733, -0.06188266, 1, 0, 0.9294118, 1,
1.024861, 0.9331975, -0.3009153, 1, 0, 0.9254902, 1,
1.025876, 0.280786, 1.444097, 1, 0, 0.9176471, 1,
1.02775, -0.7599444, 3.814181, 1, 0, 0.9137255, 1,
1.040134, -1.119661, 2.040448, 1, 0, 0.9058824, 1,
1.046535, 1.103631, 0.289737, 1, 0, 0.9019608, 1,
1.048746, -0.08254199, 2.741124, 1, 0, 0.8941177, 1,
1.049945, -0.8342351, 2.798655, 1, 0, 0.8862745, 1,
1.051993, 0.7317078, 0.05883843, 1, 0, 0.8823529, 1,
1.054434, -0.7096829, 2.611029, 1, 0, 0.8745098, 1,
1.060079, 1.62101, -0.4580941, 1, 0, 0.8705882, 1,
1.063734, -1.082734, 2.431252, 1, 0, 0.8627451, 1,
1.063993, -0.918508, -0.7068408, 1, 0, 0.8588235, 1,
1.068911, -1.153918, 1.069731, 1, 0, 0.8509804, 1,
1.07008, 1.011754, 0.1809831, 1, 0, 0.8470588, 1,
1.072522, 1.690502, 0.199658, 1, 0, 0.8392157, 1,
1.073213, 0.09918465, 0.6688221, 1, 0, 0.8352941, 1,
1.076145, 0.06324662, -0.309872, 1, 0, 0.827451, 1,
1.078015, -0.3425045, 1.100457, 1, 0, 0.8235294, 1,
1.079774, 1.102686, -0.5677425, 1, 0, 0.8156863, 1,
1.081187, -1.789515, 5.33417, 1, 0, 0.8117647, 1,
1.08929, 0.8333547, -0.02632262, 1, 0, 0.8039216, 1,
1.089331, -0.7164867, 2.084685, 1, 0, 0.7960784, 1,
1.107184, -0.6429666, 0.559716, 1, 0, 0.7921569, 1,
1.107782, 0.9159589, 0.501385, 1, 0, 0.7843137, 1,
1.111747, -1.51662, 2.301007, 1, 0, 0.7803922, 1,
1.117843, 1.562764, 2.432507, 1, 0, 0.772549, 1,
1.124555, -0.2694267, 2.906019, 1, 0, 0.7686275, 1,
1.125067, -0.03184214, 2.046644, 1, 0, 0.7607843, 1,
1.129361, 1.319006, 1.996002, 1, 0, 0.7568628, 1,
1.130402, -0.04589526, 1.399591, 1, 0, 0.7490196, 1,
1.131081, -0.3946242, 0.04876244, 1, 0, 0.7450981, 1,
1.131966, -1.437447, 3.468906, 1, 0, 0.7372549, 1,
1.143426, 0.4850595, 1.345104, 1, 0, 0.7333333, 1,
1.145729, 2.049119, -1.34567, 1, 0, 0.7254902, 1,
1.160478, -1.182259, 2.900301, 1, 0, 0.7215686, 1,
1.161058, -1.518247, 3.072868, 1, 0, 0.7137255, 1,
1.166996, 0.6298118, 0.5328594, 1, 0, 0.7098039, 1,
1.17194, -0.3186487, 2.850858, 1, 0, 0.7019608, 1,
1.178113, -0.0472519, 0.6019198, 1, 0, 0.6941177, 1,
1.179887, 0.07596996, 4.160925, 1, 0, 0.6901961, 1,
1.181381, 0.6251405, 0.2220257, 1, 0, 0.682353, 1,
1.182079, -0.4880754, 0.712149, 1, 0, 0.6784314, 1,
1.183353, -0.04818497, 0.9675813, 1, 0, 0.6705883, 1,
1.184884, -0.8823863, 0.6264026, 1, 0, 0.6666667, 1,
1.189829, -0.8009164, 1.390847, 1, 0, 0.6588235, 1,
1.19048, -0.08257816, 2.148044, 1, 0, 0.654902, 1,
1.191389, -0.3318417, -0.6095338, 1, 0, 0.6470588, 1,
1.203929, -0.2263508, 1.237706, 1, 0, 0.6431373, 1,
1.20874, 0.4918779, 1.556059, 1, 0, 0.6352941, 1,
1.210203, 1.189381, 0.04067247, 1, 0, 0.6313726, 1,
1.22262, 1.187215, 1.846414, 1, 0, 0.6235294, 1,
1.251253, 0.8463147, -0.7581782, 1, 0, 0.6196079, 1,
1.251889, -0.08009057, 3.541648, 1, 0, 0.6117647, 1,
1.258854, 1.999481, 1.994849, 1, 0, 0.6078432, 1,
1.261895, -1.013002, 3.090286, 1, 0, 0.6, 1,
1.264002, 1.053535, 1.054066, 1, 0, 0.5921569, 1,
1.272111, -0.2375989, 1.50485, 1, 0, 0.5882353, 1,
1.274879, 0.9033477, 0.5652296, 1, 0, 0.5803922, 1,
1.283565, 0.6404337, 0.5227707, 1, 0, 0.5764706, 1,
1.288537, -0.9737006, 1.619876, 1, 0, 0.5686275, 1,
1.295389, 1.048908, -0.6319096, 1, 0, 0.5647059, 1,
1.297388, 1.312532, -0.5375795, 1, 0, 0.5568628, 1,
1.301144, -0.04213675, 1.686855, 1, 0, 0.5529412, 1,
1.306827, -1.548336, 1.608957, 1, 0, 0.5450981, 1,
1.319098, -1.059508, 1.546429, 1, 0, 0.5411765, 1,
1.321652, 0.3677693, 1.178121, 1, 0, 0.5333334, 1,
1.323689, 1.427134, 0.3808001, 1, 0, 0.5294118, 1,
1.326194, -0.07167976, 2.776998, 1, 0, 0.5215687, 1,
1.327881, -0.4269608, 2.11559, 1, 0, 0.5176471, 1,
1.328178, 1.239303, 1.929323, 1, 0, 0.509804, 1,
1.336739, -0.3055754, 2.936236, 1, 0, 0.5058824, 1,
1.338151, -0.8753014, 0.2225264, 1, 0, 0.4980392, 1,
1.346162, 0.1888575, 3.866762, 1, 0, 0.4901961, 1,
1.353262, 0.2337778, 0.3896055, 1, 0, 0.4862745, 1,
1.358873, -0.7008681, 1.320799, 1, 0, 0.4784314, 1,
1.362826, -0.541315, 1.607958, 1, 0, 0.4745098, 1,
1.373177, -0.758953, 0.9286841, 1, 0, 0.4666667, 1,
1.397362, -0.2437218, 1.218831, 1, 0, 0.4627451, 1,
1.398474, -1.229925, 4.177659, 1, 0, 0.454902, 1,
1.407647, -0.5069693, 3.370629, 1, 0, 0.4509804, 1,
1.408761, 0.5122746, 1.855151, 1, 0, 0.4431373, 1,
1.413214, 0.07031693, 1.563342, 1, 0, 0.4392157, 1,
1.430472, -1.261822, 2.740891, 1, 0, 0.4313726, 1,
1.434571, -0.6850594, 3.617099, 1, 0, 0.427451, 1,
1.450117, 0.7208503, 0.3400113, 1, 0, 0.4196078, 1,
1.450122, -0.03077408, 1.81684, 1, 0, 0.4156863, 1,
1.479396, 2.37324, -1.055994, 1, 0, 0.4078431, 1,
1.487365, 1.888949, 2.76649, 1, 0, 0.4039216, 1,
1.489974, 2.047705, 0.8039164, 1, 0, 0.3960784, 1,
1.501552, -0.480644, 2.171097, 1, 0, 0.3882353, 1,
1.504745, -1.838839, 2.182893, 1, 0, 0.3843137, 1,
1.51991, 2.118985, 1.480866, 1, 0, 0.3764706, 1,
1.525692, 0.06422761, -0.4319338, 1, 0, 0.372549, 1,
1.534829, -1.604559, 2.150242, 1, 0, 0.3647059, 1,
1.546782, -1.523407, 3.828871, 1, 0, 0.3607843, 1,
1.554973, -0.3728128, 2.918339, 1, 0, 0.3529412, 1,
1.577175, 0.2650101, 2.8203, 1, 0, 0.3490196, 1,
1.589921, 0.9301229, 0.5521538, 1, 0, 0.3411765, 1,
1.596246, -0.7170996, 3.193438, 1, 0, 0.3372549, 1,
1.61224, 1.693531, 0.01365091, 1, 0, 0.3294118, 1,
1.61997, 0.4923826, 1.636832, 1, 0, 0.3254902, 1,
1.6393, 0.17074, 0.9059859, 1, 0, 0.3176471, 1,
1.644158, 0.3795126, 1.091054, 1, 0, 0.3137255, 1,
1.653693, -0.715763, 0.2856249, 1, 0, 0.3058824, 1,
1.664292, 1.35556, 1.643874, 1, 0, 0.2980392, 1,
1.670738, -1.759276, 1.865752, 1, 0, 0.2941177, 1,
1.674607, 1.563664, 2.107513, 1, 0, 0.2862745, 1,
1.676728, -0.5136147, 0.9265749, 1, 0, 0.282353, 1,
1.677138, -0.5600705, 2.568078, 1, 0, 0.2745098, 1,
1.678387, 0.2228562, 0.6198617, 1, 0, 0.2705882, 1,
1.680395, -1.91858, 4.210314, 1, 0, 0.2627451, 1,
1.688401, -1.018707, 1.625546, 1, 0, 0.2588235, 1,
1.692338, -1.271828, 2.390948, 1, 0, 0.2509804, 1,
1.712095, 1.149329, 0.3777303, 1, 0, 0.2470588, 1,
1.713535, 1.726375, -0.3194297, 1, 0, 0.2392157, 1,
1.715295, 0.9403484, -1.004978, 1, 0, 0.2352941, 1,
1.73625, -0.3020574, 1.213428, 1, 0, 0.227451, 1,
1.744663, 1.108431, -0.3011214, 1, 0, 0.2235294, 1,
1.748849, 0.2011399, 2.359533, 1, 0, 0.2156863, 1,
1.786068, -0.04113295, 1.43422, 1, 0, 0.2117647, 1,
1.806087, 0.2905721, 1.746844, 1, 0, 0.2039216, 1,
1.848013, -0.7817291, 1.724175, 1, 0, 0.1960784, 1,
1.853207, 0.9054916, 2.08319, 1, 0, 0.1921569, 1,
1.855683, 0.417372, 0.5381387, 1, 0, 0.1843137, 1,
1.864847, 0.6121718, 0.7619191, 1, 0, 0.1803922, 1,
1.876265, -0.2369648, 2.898218, 1, 0, 0.172549, 1,
1.886454, 0.03451421, 1.327559, 1, 0, 0.1686275, 1,
1.906149, 1.067638, 1.959717, 1, 0, 0.1607843, 1,
1.921523, 1.834321, -0.5441633, 1, 0, 0.1568628, 1,
1.940151, -0.8536856, 1.710808, 1, 0, 0.1490196, 1,
2.003219, 0.8575212, 1.091671, 1, 0, 0.145098, 1,
2.011573, -0.4353888, 1.873888, 1, 0, 0.1372549, 1,
2.021437, -2.083027, 2.37504, 1, 0, 0.1333333, 1,
2.052198, 1.08673, 0.4182519, 1, 0, 0.1254902, 1,
2.056918, -0.6703101, 1.654389, 1, 0, 0.1215686, 1,
2.146513, -1.036619, 3.59916, 1, 0, 0.1137255, 1,
2.181563, -1.917988, 1.968593, 1, 0, 0.1098039, 1,
2.183563, 0.8875902, 1.010574, 1, 0, 0.1019608, 1,
2.213716, 0.6791654, 0.8187209, 1, 0, 0.09411765, 1,
2.252715, 1.028025, 2.208332, 1, 0, 0.09019608, 1,
2.322441, 0.3433169, 0.9973701, 1, 0, 0.08235294, 1,
2.344702, -0.6297114, 1.563297, 1, 0, 0.07843138, 1,
2.355021, 0.9168513, 2.061135, 1, 0, 0.07058824, 1,
2.356833, 0.7888014, 0.2016685, 1, 0, 0.06666667, 1,
2.367078, -0.09192941, 2.004566, 1, 0, 0.05882353, 1,
2.377884, -1.128091, 2.563438, 1, 0, 0.05490196, 1,
2.378039, 0.4554974, 2.403901, 1, 0, 0.04705882, 1,
2.41916, 0.3024503, 1.214834, 1, 0, 0.04313726, 1,
2.429926, 1.81566, 0.3698066, 1, 0, 0.03529412, 1,
2.631867, 0.07724569, 2.44799, 1, 0, 0.03137255, 1,
2.656735, 1.335499, 0.1055085, 1, 0, 0.02352941, 1,
2.666893, 0.01959589, 1.492907, 1, 0, 0.01960784, 1,
2.742929, 0.2991087, 1.240273, 1, 0, 0.01176471, 1,
2.793825, 0.108892, 1.906338, 1, 0, 0.007843138, 1
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
-0.04369521, -5.229741, -7.67819, 0, -0.5, 0.5, 0.5,
-0.04369521, -5.229741, -7.67819, 1, -0.5, 0.5, 0.5,
-0.04369521, -5.229741, -7.67819, 1, 1.5, 0.5, 0.5,
-0.04369521, -5.229741, -7.67819, 0, 1.5, 0.5, 0.5
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
-3.843135, 0.07004762, -7.67819, 0, -0.5, 0.5, 0.5,
-3.843135, 0.07004762, -7.67819, 1, -0.5, 0.5, 0.5,
-3.843135, 0.07004762, -7.67819, 1, 1.5, 0.5, 0.5,
-3.843135, 0.07004762, -7.67819, 0, 1.5, 0.5, 0.5
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
-3.843135, -5.229741, 0.005938768, 0, -0.5, 0.5, 0.5,
-3.843135, -5.229741, 0.005938768, 1, -0.5, 0.5, 0.5,
-3.843135, -5.229741, 0.005938768, 1, 1.5, 0.5, 0.5,
-3.843135, -5.229741, 0.005938768, 0, 1.5, 0.5, 0.5
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
-2, -4.006712, -5.904929,
2, -4.006712, -5.904929,
-2, -4.006712, -5.904929,
-2, -4.21055, -6.200473,
-1, -4.006712, -5.904929,
-1, -4.21055, -6.200473,
0, -4.006712, -5.904929,
0, -4.21055, -6.200473,
1, -4.006712, -5.904929,
1, -4.21055, -6.200473,
2, -4.006712, -5.904929,
2, -4.21055, -6.200473
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
-2, -4.618227, -6.79156, 0, -0.5, 0.5, 0.5,
-2, -4.618227, -6.79156, 1, -0.5, 0.5, 0.5,
-2, -4.618227, -6.79156, 1, 1.5, 0.5, 0.5,
-2, -4.618227, -6.79156, 0, 1.5, 0.5, 0.5,
-1, -4.618227, -6.79156, 0, -0.5, 0.5, 0.5,
-1, -4.618227, -6.79156, 1, -0.5, 0.5, 0.5,
-1, -4.618227, -6.79156, 1, 1.5, 0.5, 0.5,
-1, -4.618227, -6.79156, 0, 1.5, 0.5, 0.5,
0, -4.618227, -6.79156, 0, -0.5, 0.5, 0.5,
0, -4.618227, -6.79156, 1, -0.5, 0.5, 0.5,
0, -4.618227, -6.79156, 1, 1.5, 0.5, 0.5,
0, -4.618227, -6.79156, 0, 1.5, 0.5, 0.5,
1, -4.618227, -6.79156, 0, -0.5, 0.5, 0.5,
1, -4.618227, -6.79156, 1, -0.5, 0.5, 0.5,
1, -4.618227, -6.79156, 1, 1.5, 0.5, 0.5,
1, -4.618227, -6.79156, 0, 1.5, 0.5, 0.5,
2, -4.618227, -6.79156, 0, -0.5, 0.5, 0.5,
2, -4.618227, -6.79156, 1, -0.5, 0.5, 0.5,
2, -4.618227, -6.79156, 1, 1.5, 0.5, 0.5,
2, -4.618227, -6.79156, 0, 1.5, 0.5, 0.5
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
-2.966341, -2, -5.904929,
-2.966341, 4, -5.904929,
-2.966341, -2, -5.904929,
-3.112473, -2, -6.200473,
-2.966341, 0, -5.904929,
-3.112473, 0, -6.200473,
-2.966341, 2, -5.904929,
-3.112473, 2, -6.200473,
-2.966341, 4, -5.904929,
-3.112473, 4, -6.200473
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
-3.404738, -2, -6.79156, 0, -0.5, 0.5, 0.5,
-3.404738, -2, -6.79156, 1, -0.5, 0.5, 0.5,
-3.404738, -2, -6.79156, 1, 1.5, 0.5, 0.5,
-3.404738, -2, -6.79156, 0, 1.5, 0.5, 0.5,
-3.404738, 0, -6.79156, 0, -0.5, 0.5, 0.5,
-3.404738, 0, -6.79156, 1, -0.5, 0.5, 0.5,
-3.404738, 0, -6.79156, 1, 1.5, 0.5, 0.5,
-3.404738, 0, -6.79156, 0, 1.5, 0.5, 0.5,
-3.404738, 2, -6.79156, 0, -0.5, 0.5, 0.5,
-3.404738, 2, -6.79156, 1, -0.5, 0.5, 0.5,
-3.404738, 2, -6.79156, 1, 1.5, 0.5, 0.5,
-3.404738, 2, -6.79156, 0, 1.5, 0.5, 0.5,
-3.404738, 4, -6.79156, 0, -0.5, 0.5, 0.5,
-3.404738, 4, -6.79156, 1, -0.5, 0.5, 0.5,
-3.404738, 4, -6.79156, 1, 1.5, 0.5, 0.5,
-3.404738, 4, -6.79156, 0, 1.5, 0.5, 0.5
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
-2.966341, -4.006712, -4,
-2.966341, -4.006712, 4,
-2.966341, -4.006712, -4,
-3.112473, -4.21055, -4,
-2.966341, -4.006712, -2,
-3.112473, -4.21055, -2,
-2.966341, -4.006712, 0,
-3.112473, -4.21055, 0,
-2.966341, -4.006712, 2,
-3.112473, -4.21055, 2,
-2.966341, -4.006712, 4,
-3.112473, -4.21055, 4
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
-3.404738, -4.618227, -4, 0, -0.5, 0.5, 0.5,
-3.404738, -4.618227, -4, 1, -0.5, 0.5, 0.5,
-3.404738, -4.618227, -4, 1, 1.5, 0.5, 0.5,
-3.404738, -4.618227, -4, 0, 1.5, 0.5, 0.5,
-3.404738, -4.618227, -2, 0, -0.5, 0.5, 0.5,
-3.404738, -4.618227, -2, 1, -0.5, 0.5, 0.5,
-3.404738, -4.618227, -2, 1, 1.5, 0.5, 0.5,
-3.404738, -4.618227, -2, 0, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 0, 0, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 0, 1, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 0, 1, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 0, 0, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 2, 0, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 2, 1, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 2, 1, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 2, 0, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 4, 0, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 4, 1, -0.5, 0.5, 0.5,
-3.404738, -4.618227, 4, 1, 1.5, 0.5, 0.5,
-3.404738, -4.618227, 4, 0, 1.5, 0.5, 0.5
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
-2.966341, -4.006712, -5.904929,
-2.966341, 4.146808, -5.904929,
-2.966341, -4.006712, 5.916807,
-2.966341, 4.146808, 5.916807,
-2.966341, -4.006712, -5.904929,
-2.966341, -4.006712, 5.916807,
-2.966341, 4.146808, -5.904929,
-2.966341, 4.146808, 5.916807,
-2.966341, -4.006712, -5.904929,
2.878951, -4.006712, -5.904929,
-2.966341, -4.006712, 5.916807,
2.878951, -4.006712, 5.916807,
-2.966341, 4.146808, -5.904929,
2.878951, 4.146808, -5.904929,
-2.966341, 4.146808, 5.916807,
2.878951, 4.146808, 5.916807,
2.878951, -4.006712, -5.904929,
2.878951, 4.146808, -5.904929,
2.878951, -4.006712, 5.916807,
2.878951, 4.146808, 5.916807,
2.878951, -4.006712, -5.904929,
2.878951, -4.006712, 5.916807,
2.878951, 4.146808, -5.904929,
2.878951, 4.146808, 5.916807
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
var radius = 8.279296;
var distance = 36.83552;
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
mvMatrix.translate( 0.04369521, -0.07004762, -0.005938768 );
mvMatrix.scale( 1.531444, 1.097898, 0.7572269 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.83552);
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


