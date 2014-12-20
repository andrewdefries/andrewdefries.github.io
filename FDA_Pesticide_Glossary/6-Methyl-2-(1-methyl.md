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
-3.317915, 0.4883555, -1.595859, 1, 0, 0, 1,
-3.196048, -1.597051, -1.788775, 1, 0.007843138, 0, 1,
-3.080026, 0.4247879, -2.915778, 1, 0.01176471, 0, 1,
-2.758768, -0.8391722, -3.763584, 1, 0.01960784, 0, 1,
-2.583504, 1.839074, -1.695141, 1, 0.02352941, 0, 1,
-2.579126, -1.829271, -1.912564, 1, 0.03137255, 0, 1,
-2.532049, 0.3794852, -0.3433529, 1, 0.03529412, 0, 1,
-2.509977, 1.014807, -1.495943, 1, 0.04313726, 0, 1,
-2.458608, 1.98944, 0.4206032, 1, 0.04705882, 0, 1,
-2.43336, -1.436573, -1.514246, 1, 0.05490196, 0, 1,
-2.416082, 0.01825529, -1.460169, 1, 0.05882353, 0, 1,
-2.406752, -1.621785, -0.1967107, 1, 0.06666667, 0, 1,
-2.39642, 1.882218, -0.854426, 1, 0.07058824, 0, 1,
-2.34294, 0.7715011, -0.45714, 1, 0.07843138, 0, 1,
-2.332924, 0.702164, -0.2629327, 1, 0.08235294, 0, 1,
-2.276008, 1.130369, -2.614404, 1, 0.09019608, 0, 1,
-2.272467, -1.169902, -2.059377, 1, 0.09411765, 0, 1,
-2.266223, 1.417251, 0.3317353, 1, 0.1019608, 0, 1,
-2.260487, -1.313062, -2.287771, 1, 0.1098039, 0, 1,
-2.203047, -2.50092, -2.053994, 1, 0.1137255, 0, 1,
-2.190208, -0.5823025, -2.382146, 1, 0.1215686, 0, 1,
-2.168244, 1.202807, -2.285883, 1, 0.1254902, 0, 1,
-2.147039, -0.7101699, -3.156873, 1, 0.1333333, 0, 1,
-2.080821, 0.6114513, -1.993299, 1, 0.1372549, 0, 1,
-2.070165, -1.934685, -0.9596384, 1, 0.145098, 0, 1,
-2.061301, -1.406461, -1.837415, 1, 0.1490196, 0, 1,
-2.059553, 2.367277, -0.7208267, 1, 0.1568628, 0, 1,
-2.050723, -0.2420681, -2.253759, 1, 0.1607843, 0, 1,
-2.020454, -0.004134251, -0.9339874, 1, 0.1686275, 0, 1,
-2.009332, 0.8340175, -2.519079, 1, 0.172549, 0, 1,
-2.006788, -0.1128797, -1.588141, 1, 0.1803922, 0, 1,
-1.999529, -1.187712, -1.772772, 1, 0.1843137, 0, 1,
-1.986672, -0.7742508, -1.707612, 1, 0.1921569, 0, 1,
-1.937778, -0.7464191, -1.512969, 1, 0.1960784, 0, 1,
-1.933576, -0.3906523, -5.383293, 1, 0.2039216, 0, 1,
-1.913308, -0.7476934, -1.979225, 1, 0.2117647, 0, 1,
-1.904511, 1.046818, 0.283641, 1, 0.2156863, 0, 1,
-1.904489, 0.8269502, -0.8789904, 1, 0.2235294, 0, 1,
-1.868219, 1.077567, 0.02588898, 1, 0.227451, 0, 1,
-1.864793, 0.9492962, -2.965079, 1, 0.2352941, 0, 1,
-1.853514, 0.8771212, -0.6277513, 1, 0.2392157, 0, 1,
-1.847893, -0.613577, -2.382167, 1, 0.2470588, 0, 1,
-1.838875, -0.06502392, -0.9352129, 1, 0.2509804, 0, 1,
-1.808009, -0.9086833, -2.243378, 1, 0.2588235, 0, 1,
-1.796301, 1.527609, -1.949798, 1, 0.2627451, 0, 1,
-1.788367, 0.6241798, -0.6580095, 1, 0.2705882, 0, 1,
-1.787903, -0.7861024, -0.8801979, 1, 0.2745098, 0, 1,
-1.770935, 0.487505, 0.1312106, 1, 0.282353, 0, 1,
-1.76911, -1.710954, -2.407547, 1, 0.2862745, 0, 1,
-1.757469, 1.171703, -0.7533236, 1, 0.2941177, 0, 1,
-1.75266, -0.02144366, -1.891906, 1, 0.3019608, 0, 1,
-1.736596, -0.09342327, -0.7743696, 1, 0.3058824, 0, 1,
-1.731306, -0.1810816, -0.3688065, 1, 0.3137255, 0, 1,
-1.729331, -0.3049435, -1.549201, 1, 0.3176471, 0, 1,
-1.726608, 1.799783, -0.4659858, 1, 0.3254902, 0, 1,
-1.725627, 1.052289, -0.9673412, 1, 0.3294118, 0, 1,
-1.72328, -0.7645814, -1.009297, 1, 0.3372549, 0, 1,
-1.721103, 0.2949151, -1.682657, 1, 0.3411765, 0, 1,
-1.701701, 1.306793, 0.4099005, 1, 0.3490196, 0, 1,
-1.696858, -0.4703989, -4.41885, 1, 0.3529412, 0, 1,
-1.664213, -0.07650557, -2.194935, 1, 0.3607843, 0, 1,
-1.656622, 1.96582, -0.5424678, 1, 0.3647059, 0, 1,
-1.654003, -1.47688, -2.265134, 1, 0.372549, 0, 1,
-1.630581, 1.879682, -0.1411574, 1, 0.3764706, 0, 1,
-1.591585, -1.520381, -1.24547, 1, 0.3843137, 0, 1,
-1.58602, 0.1668824, -1.226084, 1, 0.3882353, 0, 1,
-1.584077, -0.5116448, -1.984739, 1, 0.3960784, 0, 1,
-1.574434, -0.8903074, -2.83398, 1, 0.4039216, 0, 1,
-1.557826, 0.7791083, -1.145437, 1, 0.4078431, 0, 1,
-1.554741, -0.2148938, -2.13022, 1, 0.4156863, 0, 1,
-1.553209, 0.5962987, 0.01847641, 1, 0.4196078, 0, 1,
-1.546211, 1.366433, 0.8458284, 1, 0.427451, 0, 1,
-1.545503, -0.3562942, -1.995446, 1, 0.4313726, 0, 1,
-1.544505, 1.423514, -1.362214, 1, 0.4392157, 0, 1,
-1.543555, 0.9895411, -0.6804317, 1, 0.4431373, 0, 1,
-1.535851, -1.043535, -1.795479, 1, 0.4509804, 0, 1,
-1.534316, -0.7946135, -0.9295382, 1, 0.454902, 0, 1,
-1.532217, -2.120942, -1.197299, 1, 0.4627451, 0, 1,
-1.531895, 0.5542894, -1.13991, 1, 0.4666667, 0, 1,
-1.527319, -0.3793508, -3.471362, 1, 0.4745098, 0, 1,
-1.52024, -0.6706041, -2.970782, 1, 0.4784314, 0, 1,
-1.512511, 3.197361, -1.142015, 1, 0.4862745, 0, 1,
-1.509706, -1.149592, -3.025785, 1, 0.4901961, 0, 1,
-1.505961, 0.7353265, -1.370584, 1, 0.4980392, 0, 1,
-1.496971, 1.13085, -0.6487347, 1, 0.5058824, 0, 1,
-1.486386, 0.07287895, -2.492209, 1, 0.509804, 0, 1,
-1.485546, 0.7706339, -1.179218, 1, 0.5176471, 0, 1,
-1.467201, 1.616584, -1.36826, 1, 0.5215687, 0, 1,
-1.463404, 1.369855, 0.2947094, 1, 0.5294118, 0, 1,
-1.455838, -0.9060111, -1.303265, 1, 0.5333334, 0, 1,
-1.450922, -0.7476377, -2.525708, 1, 0.5411765, 0, 1,
-1.446334, -0.6094452, -1.825284, 1, 0.5450981, 0, 1,
-1.446257, 1.452867, -1.067632, 1, 0.5529412, 0, 1,
-1.443488, -1.497149, -1.980135, 1, 0.5568628, 0, 1,
-1.438729, -1.691481, -1.772086, 1, 0.5647059, 0, 1,
-1.429599, -0.413803, -1.993546, 1, 0.5686275, 0, 1,
-1.418361, 0.9112605, -0.977639, 1, 0.5764706, 0, 1,
-1.412261, -0.2052305, -2.463495, 1, 0.5803922, 0, 1,
-1.41069, -0.7698945, -3.330088, 1, 0.5882353, 0, 1,
-1.391118, 0.01885229, -1.594381, 1, 0.5921569, 0, 1,
-1.370032, 0.6196383, -0.09830111, 1, 0.6, 0, 1,
-1.369993, 0.01060602, -0.666422, 1, 0.6078432, 0, 1,
-1.364127, 0.4962844, -1.695197, 1, 0.6117647, 0, 1,
-1.361628, 0.6843055, -2.331486, 1, 0.6196079, 0, 1,
-1.359442, -1.574342, -4.043989, 1, 0.6235294, 0, 1,
-1.353328, 1.119152, -1.86711, 1, 0.6313726, 0, 1,
-1.327209, 0.4577988, -3.214517, 1, 0.6352941, 0, 1,
-1.31553, -1.962638, -3.372419, 1, 0.6431373, 0, 1,
-1.315128, -0.07408712, -3.056486, 1, 0.6470588, 0, 1,
-1.308925, -0.8818224, -1.501399, 1, 0.654902, 0, 1,
-1.307104, 0.2740712, -0.006513141, 1, 0.6588235, 0, 1,
-1.279136, -0.1769583, -2.370962, 1, 0.6666667, 0, 1,
-1.27807, -1.639965, -2.068982, 1, 0.6705883, 0, 1,
-1.268466, 0.7632436, -2.706194, 1, 0.6784314, 0, 1,
-1.267584, -0.4474387, -2.134116, 1, 0.682353, 0, 1,
-1.265926, 0.7718291, -0.650255, 1, 0.6901961, 0, 1,
-1.241083, -1.049734, -2.131197, 1, 0.6941177, 0, 1,
-1.234884, -2.470766, -0.6813789, 1, 0.7019608, 0, 1,
-1.228844, -0.1994745, -1.083216, 1, 0.7098039, 0, 1,
-1.225144, 0.2874325, -0.8569188, 1, 0.7137255, 0, 1,
-1.224158, 1.643987, 0.3710329, 1, 0.7215686, 0, 1,
-1.219846, -0.7549918, -0.5491693, 1, 0.7254902, 0, 1,
-1.199281, 0.7692141, -1.565642, 1, 0.7333333, 0, 1,
-1.193598, 0.6594644, -1.431915, 1, 0.7372549, 0, 1,
-1.183694, -0.8468907, -2.61267, 1, 0.7450981, 0, 1,
-1.178124, 0.05317204, -0.720008, 1, 0.7490196, 0, 1,
-1.177359, 1.909372, -1.724985, 1, 0.7568628, 0, 1,
-1.174829, -0.9398417, -1.962186, 1, 0.7607843, 0, 1,
-1.171068, -0.2534287, -2.092762, 1, 0.7686275, 0, 1,
-1.168193, 0.2490049, 0.2171285, 1, 0.772549, 0, 1,
-1.165484, 1.80521, -0.02690388, 1, 0.7803922, 0, 1,
-1.162723, -2.373511, -2.635892, 1, 0.7843137, 0, 1,
-1.159331, 0.8853799, -1.92163, 1, 0.7921569, 0, 1,
-1.151455, -1.418569, -1.960432, 1, 0.7960784, 0, 1,
-1.15012, 0.2546809, -1.610406, 1, 0.8039216, 0, 1,
-1.147922, -0.7893032, -2.275575, 1, 0.8117647, 0, 1,
-1.14526, 0.8530605, -0.8687269, 1, 0.8156863, 0, 1,
-1.126018, 0.2784426, -2.142319, 1, 0.8235294, 0, 1,
-1.115988, -1.30628, -2.021577, 1, 0.827451, 0, 1,
-1.114641, 0.003424892, -2.872927, 1, 0.8352941, 0, 1,
-1.108457, -2.04824, -2.447913, 1, 0.8392157, 0, 1,
-1.09947, -1.181694, -4.159452, 1, 0.8470588, 0, 1,
-1.089505, -1.657181, -0.6144398, 1, 0.8509804, 0, 1,
-1.08793, 0.5630249, -2.250375, 1, 0.8588235, 0, 1,
-1.085819, 0.7780731, -1.689918, 1, 0.8627451, 0, 1,
-1.077212, 1.416578, 1.321613, 1, 0.8705882, 0, 1,
-1.076727, -0.8891818, -2.838247, 1, 0.8745098, 0, 1,
-1.073117, -1.391557, -1.734934, 1, 0.8823529, 0, 1,
-1.071931, 0.7161877, -0.8045768, 1, 0.8862745, 0, 1,
-1.071525, -0.5832681, -2.565372, 1, 0.8941177, 0, 1,
-1.070435, 0.5280993, -1.508926, 1, 0.8980392, 0, 1,
-1.068405, -0.4238377, -0.8220366, 1, 0.9058824, 0, 1,
-1.066501, 0.5987769, -2.236074, 1, 0.9137255, 0, 1,
-1.042209, -0.7302028, -1.49068, 1, 0.9176471, 0, 1,
-1.039309, -0.4038906, -1.324236, 1, 0.9254902, 0, 1,
-1.029253, 1.490278, 0.3527974, 1, 0.9294118, 0, 1,
-1.029015, -0.01847793, -1.539775, 1, 0.9372549, 0, 1,
-1.024917, -0.9449652, -2.286403, 1, 0.9411765, 0, 1,
-1.024022, 0.3500003, 0.7330105, 1, 0.9490196, 0, 1,
-1.021223, -0.4915839, -1.206744, 1, 0.9529412, 0, 1,
-1.019567, 0.2142871, -0.2486194, 1, 0.9607843, 0, 1,
-1.013941, -1.565239, -3.948123, 1, 0.9647059, 0, 1,
-1.010922, -0.7942953, -0.5274316, 1, 0.972549, 0, 1,
-1.005549, -1.106428, -2.147516, 1, 0.9764706, 0, 1,
-0.9986153, 0.6695167, 0.4196803, 1, 0.9843137, 0, 1,
-0.996955, -0.1479053, -3.681112, 1, 0.9882353, 0, 1,
-0.9958368, -0.959192, -2.848333, 1, 0.9960784, 0, 1,
-0.9889936, -0.3829183, -0.4869228, 0.9960784, 1, 0, 1,
-0.9868835, -0.5708972, -0.7933862, 0.9921569, 1, 0, 1,
-0.9816542, -0.4547975, -1.092974, 0.9843137, 1, 0, 1,
-0.9804961, 1.478093, -0.1418973, 0.9803922, 1, 0, 1,
-0.9785804, 1.906836, 0.7096491, 0.972549, 1, 0, 1,
-0.974142, -0.6942936, -3.657649, 0.9686275, 1, 0, 1,
-0.9734448, -1.593651, -2.298644, 0.9607843, 1, 0, 1,
-0.9698921, -0.6576046, -1.765467, 0.9568627, 1, 0, 1,
-0.9695628, 1.821993, -2.226973, 0.9490196, 1, 0, 1,
-0.9687196, 0.4495123, -1.225999, 0.945098, 1, 0, 1,
-0.9656761, -0.3073427, -1.548882, 0.9372549, 1, 0, 1,
-0.964557, 0.9386446, -1.409966, 0.9333333, 1, 0, 1,
-0.9634243, 1.357304, 0.07530243, 0.9254902, 1, 0, 1,
-0.9588516, 0.07121221, -2.445773, 0.9215686, 1, 0, 1,
-0.9588379, -1.35913, -2.977726, 0.9137255, 1, 0, 1,
-0.9560379, 0.7498017, 0.308538, 0.9098039, 1, 0, 1,
-0.9522484, 0.03873303, -0.5647442, 0.9019608, 1, 0, 1,
-0.9501152, -0.004197207, -2.704443, 0.8941177, 1, 0, 1,
-0.9490327, 0.6889337, -4.165606, 0.8901961, 1, 0, 1,
-0.9401253, -0.0725244, -1.765927, 0.8823529, 1, 0, 1,
-0.9384283, -0.575242, -2.11277, 0.8784314, 1, 0, 1,
-0.9348367, 0.4294689, -2.131707, 0.8705882, 1, 0, 1,
-0.9345906, 1.151382, -1.907957, 0.8666667, 1, 0, 1,
-0.9305155, -0.9569363, -2.78138, 0.8588235, 1, 0, 1,
-0.9304543, -0.9420338, -3.292475, 0.854902, 1, 0, 1,
-0.9216098, -1.245383, -1.966406, 0.8470588, 1, 0, 1,
-0.9213201, -1.26254, -4.057375, 0.8431373, 1, 0, 1,
-0.9170394, 0.7057928, -1.12117, 0.8352941, 1, 0, 1,
-0.9127657, -0.6054769, -1.911248, 0.8313726, 1, 0, 1,
-0.9062409, 1.415022, -0.3975484, 0.8235294, 1, 0, 1,
-0.905764, -1.203101, -2.305901, 0.8196079, 1, 0, 1,
-0.9044617, 1.780459, -2.30073, 0.8117647, 1, 0, 1,
-0.8986219, -1.073862, -0.9854969, 0.8078431, 1, 0, 1,
-0.8942336, -0.4248303, -1.405912, 0.8, 1, 0, 1,
-0.8906494, 1.868345, 0.1759811, 0.7921569, 1, 0, 1,
-0.8797347, 0.9023774, -1.432213, 0.7882353, 1, 0, 1,
-0.8677069, 0.5005869, -1.438034, 0.7803922, 1, 0, 1,
-0.8584692, -1.935197, -3.555536, 0.7764706, 1, 0, 1,
-0.853238, 0.1130341, -2.483706, 0.7686275, 1, 0, 1,
-0.8493657, -0.2674372, -1.701738, 0.7647059, 1, 0, 1,
-0.8468169, -0.005010189, -2.897739, 0.7568628, 1, 0, 1,
-0.8422109, 1.814628, -0.03742564, 0.7529412, 1, 0, 1,
-0.8359618, -0.3743439, -2.860808, 0.7450981, 1, 0, 1,
-0.8332841, 0.6486014, -1.001418, 0.7411765, 1, 0, 1,
-0.8313773, -2.260705, -3.038052, 0.7333333, 1, 0, 1,
-0.8288643, -0.2801463, -0.8964509, 0.7294118, 1, 0, 1,
-0.8271717, 0.2175338, -1.303861, 0.7215686, 1, 0, 1,
-0.8266328, -1.068399, -1.685134, 0.7176471, 1, 0, 1,
-0.8204532, -1.13492, -2.078871, 0.7098039, 1, 0, 1,
-0.8203568, 0.09760152, -1.624129, 0.7058824, 1, 0, 1,
-0.817664, -0.3539923, -0.5897787, 0.6980392, 1, 0, 1,
-0.8163221, 0.6446154, -0.1406896, 0.6901961, 1, 0, 1,
-0.8118725, -0.3825544, -1.436713, 0.6862745, 1, 0, 1,
-0.8070942, -1.170959, -3.034629, 0.6784314, 1, 0, 1,
-0.8068464, -1.361753, -1.404844, 0.6745098, 1, 0, 1,
-0.8021815, 0.1292147, 0.07938565, 0.6666667, 1, 0, 1,
-0.7988889, 1.61389, -2.479772, 0.6627451, 1, 0, 1,
-0.7947243, -0.1883685, -1.674262, 0.654902, 1, 0, 1,
-0.7924772, -0.4424278, -2.518167, 0.6509804, 1, 0, 1,
-0.7906608, -0.2828908, -3.853939, 0.6431373, 1, 0, 1,
-0.7876842, 0.7926381, -0.9222516, 0.6392157, 1, 0, 1,
-0.78369, 1.611354, -0.86329, 0.6313726, 1, 0, 1,
-0.7815817, 1.159989, 1.585501, 0.627451, 1, 0, 1,
-0.78122, -0.4584414, -2.089327, 0.6196079, 1, 0, 1,
-0.7758225, 0.2772538, -2.69298, 0.6156863, 1, 0, 1,
-0.7725868, -0.3048831, -2.559677, 0.6078432, 1, 0, 1,
-0.766422, 1.189696, 1.35195, 0.6039216, 1, 0, 1,
-0.7616551, 0.965003, -0.3020885, 0.5960785, 1, 0, 1,
-0.7598242, 1.573581, -1.470267, 0.5882353, 1, 0, 1,
-0.7553384, -0.02188482, -0.9995912, 0.5843138, 1, 0, 1,
-0.752023, 0.2618599, -0.8693681, 0.5764706, 1, 0, 1,
-0.7492298, 1.134729, -0.1758715, 0.572549, 1, 0, 1,
-0.7443561, 0.582316, -1.440423, 0.5647059, 1, 0, 1,
-0.7439951, -1.141287, -3.166774, 0.5607843, 1, 0, 1,
-0.7403332, -1.702443, -1.889518, 0.5529412, 1, 0, 1,
-0.733898, -0.9866036, -2.427778, 0.5490196, 1, 0, 1,
-0.7324244, 1.147407, -1.064512, 0.5411765, 1, 0, 1,
-0.7308376, 0.3079885, 0.2688554, 0.5372549, 1, 0, 1,
-0.7288732, 1.396819, -1.009198, 0.5294118, 1, 0, 1,
-0.7257876, 0.06751546, -0.1956369, 0.5254902, 1, 0, 1,
-0.7236101, 0.3938671, -0.7176227, 0.5176471, 1, 0, 1,
-0.7164699, -0.1453315, -2.096212, 0.5137255, 1, 0, 1,
-0.7058084, 0.1727829, -2.085958, 0.5058824, 1, 0, 1,
-0.7025979, 0.1145704, -0.7597023, 0.5019608, 1, 0, 1,
-0.6971909, 1.622699, -3.23959, 0.4941176, 1, 0, 1,
-0.6967744, -0.8690807, -1.870366, 0.4862745, 1, 0, 1,
-0.6943097, -0.8788832, -1.678177, 0.4823529, 1, 0, 1,
-0.6940577, 0.01506238, -2.259992, 0.4745098, 1, 0, 1,
-0.6907594, 0.5673946, 0.05288341, 0.4705882, 1, 0, 1,
-0.6875044, -0.3554372, -2.460231, 0.4627451, 1, 0, 1,
-0.6848134, -0.9546327, -1.61415, 0.4588235, 1, 0, 1,
-0.6830977, -0.6757005, -1.566996, 0.4509804, 1, 0, 1,
-0.6770863, 0.2226275, -2.340265, 0.4470588, 1, 0, 1,
-0.6707572, -2.374791, -2.213287, 0.4392157, 1, 0, 1,
-0.6705976, 1.346298, 0.05893271, 0.4352941, 1, 0, 1,
-0.6696435, 0.5665259, -0.4486411, 0.427451, 1, 0, 1,
-0.6676416, 0.6986972, -0.8556361, 0.4235294, 1, 0, 1,
-0.6601256, 0.3947144, -1.084798, 0.4156863, 1, 0, 1,
-0.658849, 0.1350465, -0.7622961, 0.4117647, 1, 0, 1,
-0.6588048, -1.83988, -3.530663, 0.4039216, 1, 0, 1,
-0.6567525, 0.9063642, -0.6616727, 0.3960784, 1, 0, 1,
-0.6556417, 1.796432, -0.3280889, 0.3921569, 1, 0, 1,
-0.6449585, 1.391599, 0.03369673, 0.3843137, 1, 0, 1,
-0.6394044, -0.773033, -2.841665, 0.3803922, 1, 0, 1,
-0.6357061, 0.2451768, -1.761731, 0.372549, 1, 0, 1,
-0.6347983, 0.913644, -0.2930652, 0.3686275, 1, 0, 1,
-0.6345, -0.3452328, -1.796451, 0.3607843, 1, 0, 1,
-0.6317651, 0.03037705, -2.68267, 0.3568628, 1, 0, 1,
-0.629963, 0.3632663, -1.543411, 0.3490196, 1, 0, 1,
-0.6253676, 0.008825509, -1.093496, 0.345098, 1, 0, 1,
-0.6166574, 1.111128, -0.4685892, 0.3372549, 1, 0, 1,
-0.616582, -0.4610353, -1.824555, 0.3333333, 1, 0, 1,
-0.6121665, -2.024334, -3.090636, 0.3254902, 1, 0, 1,
-0.6119738, 0.0924329, -2.552158, 0.3215686, 1, 0, 1,
-0.6117517, -1.519543, -2.022228, 0.3137255, 1, 0, 1,
-0.6095322, -1.837238, -4.001671, 0.3098039, 1, 0, 1,
-0.6030884, 1.646412, -1.207817, 0.3019608, 1, 0, 1,
-0.5986962, 0.09398207, -1.542176, 0.2941177, 1, 0, 1,
-0.5968238, 0.5457078, -0.6537955, 0.2901961, 1, 0, 1,
-0.5965407, -0.3716451, -2.072225, 0.282353, 1, 0, 1,
-0.5898989, -0.2689445, -3.478514, 0.2784314, 1, 0, 1,
-0.5898072, 1.435931, -2.80566, 0.2705882, 1, 0, 1,
-0.5882278, 1.601469, -1.286619, 0.2666667, 1, 0, 1,
-0.5813164, -1.380407, -2.67777, 0.2588235, 1, 0, 1,
-0.5606586, 0.8115468, -2.249612, 0.254902, 1, 0, 1,
-0.5603111, 0.4303375, -1.672568, 0.2470588, 1, 0, 1,
-0.5593777, -0.06951121, -1.088446, 0.2431373, 1, 0, 1,
-0.5571626, 0.9520361, 0.1397475, 0.2352941, 1, 0, 1,
-0.5548737, -2.35657, -2.546287, 0.2313726, 1, 0, 1,
-0.5542897, 0.2760497, -0.5490999, 0.2235294, 1, 0, 1,
-0.5538872, -0.8833047, -2.18082, 0.2196078, 1, 0, 1,
-0.5522373, -1.459022, -4.911207, 0.2117647, 1, 0, 1,
-0.552071, 0.2029754, -0.1239622, 0.2078431, 1, 0, 1,
-0.5451564, 1.077997, -0.4776183, 0.2, 1, 0, 1,
-0.5435062, 0.3379442, -2.116321, 0.1921569, 1, 0, 1,
-0.5427564, -0.6373702, -3.333212, 0.1882353, 1, 0, 1,
-0.5398613, -0.1667874, -0.8130777, 0.1803922, 1, 0, 1,
-0.5384019, -0.5805098, -0.578796, 0.1764706, 1, 0, 1,
-0.5305268, -0.9951279, -2.773584, 0.1686275, 1, 0, 1,
-0.5300034, -1.934283, -2.945425, 0.1647059, 1, 0, 1,
-0.5283014, 0.179422, 0.4413975, 0.1568628, 1, 0, 1,
-0.5188663, -1.501056, -0.4773277, 0.1529412, 1, 0, 1,
-0.5187722, -2.052743, -1.572376, 0.145098, 1, 0, 1,
-0.5172856, 1.173584, 0.1499908, 0.1411765, 1, 0, 1,
-0.5092272, -0.365138, -1.869415, 0.1333333, 1, 0, 1,
-0.5066894, -1.511682, -1.890716, 0.1294118, 1, 0, 1,
-0.504194, -0.5504452, -1.428578, 0.1215686, 1, 0, 1,
-0.502686, 0.4790377, -1.611892, 0.1176471, 1, 0, 1,
-0.5006874, -0.8003417, -3.002655, 0.1098039, 1, 0, 1,
-0.5001727, 0.1071539, 0.2096428, 0.1058824, 1, 0, 1,
-0.4939623, 0.07813137, 0.04196218, 0.09803922, 1, 0, 1,
-0.4923568, -0.7981405, -1.93333, 0.09019608, 1, 0, 1,
-0.4902861, -0.2683534, -1.830556, 0.08627451, 1, 0, 1,
-0.4890589, 0.7402212, 0.2220182, 0.07843138, 1, 0, 1,
-0.4858086, -0.9888178, -2.068577, 0.07450981, 1, 0, 1,
-0.4849695, 1.292699, 1.266601, 0.06666667, 1, 0, 1,
-0.4811187, -2.180351, -4.268596, 0.0627451, 1, 0, 1,
-0.4734567, 0.341344, -1.522128, 0.05490196, 1, 0, 1,
-0.471846, -0.3770533, -1.574036, 0.05098039, 1, 0, 1,
-0.4689224, 0.2096835, 0.6907515, 0.04313726, 1, 0, 1,
-0.4681442, 0.04921117, -0.2280254, 0.03921569, 1, 0, 1,
-0.4610981, 0.3204255, -0.4741744, 0.03137255, 1, 0, 1,
-0.4582492, 0.644446, -0.9675373, 0.02745098, 1, 0, 1,
-0.4559313, -2.20713, -2.737282, 0.01960784, 1, 0, 1,
-0.4538607, 1.506725, 1.01313, 0.01568628, 1, 0, 1,
-0.4528293, -1.312263, -4.169166, 0.007843138, 1, 0, 1,
-0.4519593, 0.1392272, -1.4802, 0.003921569, 1, 0, 1,
-0.4490822, -1.180097, -3.432999, 0, 1, 0.003921569, 1,
-0.4479918, 0.7114719, 0.1140156, 0, 1, 0.01176471, 1,
-0.4434644, 0.4854261, -1.848705, 0, 1, 0.01568628, 1,
-0.4434551, 1.184677, -0.7495604, 0, 1, 0.02352941, 1,
-0.4375469, -0.04356989, -2.005383, 0, 1, 0.02745098, 1,
-0.4246878, -1.561982, -3.273466, 0, 1, 0.03529412, 1,
-0.4200649, 0.5210572, -1.063664, 0, 1, 0.03921569, 1,
-0.4162682, 0.2504337, -3.631616, 0, 1, 0.04705882, 1,
-0.4122901, 1.212607, 0.1680281, 0, 1, 0.05098039, 1,
-0.4066937, 0.4907299, 0.2484276, 0, 1, 0.05882353, 1,
-0.3960732, 0.09665723, -2.089103, 0, 1, 0.0627451, 1,
-0.3923227, 0.8036593, -0.05851408, 0, 1, 0.07058824, 1,
-0.3862496, 0.6626304, -1.726199, 0, 1, 0.07450981, 1,
-0.3848213, 0.1721257, -1.74516, 0, 1, 0.08235294, 1,
-0.3817341, 0.7254676, -1.932085, 0, 1, 0.08627451, 1,
-0.377117, 0.6730093, -1.176062, 0, 1, 0.09411765, 1,
-0.375247, -0.5393683, -2.0443, 0, 1, 0.1019608, 1,
-0.3670645, -1.154711, -2.979263, 0, 1, 0.1058824, 1,
-0.3599976, -0.5710062, -2.484675, 0, 1, 0.1137255, 1,
-0.3554291, 0.2483055, 0.4888804, 0, 1, 0.1176471, 1,
-0.3553477, -0.3347067, -1.48, 0, 1, 0.1254902, 1,
-0.3547641, 1.446774, 0.3480518, 0, 1, 0.1294118, 1,
-0.3546877, -0.03540158, -3.350498, 0, 1, 0.1372549, 1,
-0.3455844, 0.3081324, 0.1306763, 0, 1, 0.1411765, 1,
-0.3453726, 1.132991, -0.8195994, 0, 1, 0.1490196, 1,
-0.3424728, 0.1124319, -2.657793, 0, 1, 0.1529412, 1,
-0.3405721, 0.5774843, 0.499264, 0, 1, 0.1607843, 1,
-0.3371734, 0.4952454, -1.339179, 0, 1, 0.1647059, 1,
-0.3362998, -1.177414, -2.341933, 0, 1, 0.172549, 1,
-0.3355219, 1.318191, 0.02697577, 0, 1, 0.1764706, 1,
-0.3324309, 1.202621, 1.099452, 0, 1, 0.1843137, 1,
-0.3293727, -0.806013, -2.215776, 0, 1, 0.1882353, 1,
-0.3292979, -0.5768403, -0.9110101, 0, 1, 0.1960784, 1,
-0.3212867, 0.06767697, -2.908215, 0, 1, 0.2039216, 1,
-0.321248, 2.131209, -0.6337926, 0, 1, 0.2078431, 1,
-0.3208775, -1.743992, -2.991931, 0, 1, 0.2156863, 1,
-0.3206072, 0.9131798, -1.417299, 0, 1, 0.2196078, 1,
-0.3203518, 3.064861, 0.4106412, 0, 1, 0.227451, 1,
-0.3185662, 0.780669, 0.1960784, 0, 1, 0.2313726, 1,
-0.3094583, 0.2420547, -1.833276, 0, 1, 0.2392157, 1,
-0.3055363, -0.8721794, -3.935782, 0, 1, 0.2431373, 1,
-0.2963338, -0.5299522, -3.539747, 0, 1, 0.2509804, 1,
-0.295891, -0.6142559, -3.454104, 0, 1, 0.254902, 1,
-0.2918187, -0.5285366, -1.018329, 0, 1, 0.2627451, 1,
-0.2911354, 0.4989449, -0.2805356, 0, 1, 0.2666667, 1,
-0.2893526, 0.3190639, -0.8463305, 0, 1, 0.2745098, 1,
-0.2886009, 0.5258088, -0.2332692, 0, 1, 0.2784314, 1,
-0.2878371, -1.100282, -2.580341, 0, 1, 0.2862745, 1,
-0.2868718, -1.662893, -3.416212, 0, 1, 0.2901961, 1,
-0.2829043, -0.2283598, -2.389338, 0, 1, 0.2980392, 1,
-0.282428, 0.99889, -1.068524, 0, 1, 0.3058824, 1,
-0.2821478, 0.9221698, 1.158852, 0, 1, 0.3098039, 1,
-0.2755454, -1.54071, -2.546933, 0, 1, 0.3176471, 1,
-0.2754191, -0.9803186, -2.702143, 0, 1, 0.3215686, 1,
-0.2740192, 0.0317554, -1.93263, 0, 1, 0.3294118, 1,
-0.2719547, 1.177436, 0.5575994, 0, 1, 0.3333333, 1,
-0.2707187, 0.05381728, -2.007841, 0, 1, 0.3411765, 1,
-0.2627263, -0.2677441, -2.526318, 0, 1, 0.345098, 1,
-0.2621102, -0.1159376, -3.010863, 0, 1, 0.3529412, 1,
-0.261727, -0.8397233, -3.409837, 0, 1, 0.3568628, 1,
-0.2598237, 1.240514, 0.9012229, 0, 1, 0.3647059, 1,
-0.2585886, 0.1802982, -1.312898, 0, 1, 0.3686275, 1,
-0.2568742, 0.1111987, -0.9632347, 0, 1, 0.3764706, 1,
-0.2552724, 1.489772, 0.03187436, 0, 1, 0.3803922, 1,
-0.2514654, -1.321083, -0.1732505, 0, 1, 0.3882353, 1,
-0.2481622, -2.298468, -2.426491, 0, 1, 0.3921569, 1,
-0.2478716, -0.2222345, -4.540442, 0, 1, 0.4, 1,
-0.247724, -0.114886, -2.106739, 0, 1, 0.4078431, 1,
-0.2455022, -1.249541, -2.776912, 0, 1, 0.4117647, 1,
-0.245423, 0.4728022, -0.3429778, 0, 1, 0.4196078, 1,
-0.2439009, -0.6573477, -3.340552, 0, 1, 0.4235294, 1,
-0.2419768, 1.785836, 1.274092, 0, 1, 0.4313726, 1,
-0.2384943, 0.4011921, 0.2456734, 0, 1, 0.4352941, 1,
-0.2372368, 0.3954993, -0.4159596, 0, 1, 0.4431373, 1,
-0.2355655, -2.153367, -3.114936, 0, 1, 0.4470588, 1,
-0.2337765, -1.336223, -3.330621, 0, 1, 0.454902, 1,
-0.2261361, -0.730313, 0.1891868, 0, 1, 0.4588235, 1,
-0.2239291, -0.6805971, -3.576959, 0, 1, 0.4666667, 1,
-0.2234283, -0.0412188, -2.048976, 0, 1, 0.4705882, 1,
-0.2221072, 1.169355, -1.726016, 0, 1, 0.4784314, 1,
-0.2192913, -0.1841353, -3.101902, 0, 1, 0.4823529, 1,
-0.2092419, -0.8497364, -3.100523, 0, 1, 0.4901961, 1,
-0.2085633, -0.960485, -2.958644, 0, 1, 0.4941176, 1,
-0.2060216, 0.6540346, 0.525683, 0, 1, 0.5019608, 1,
-0.2008298, 0.2628376, 0.04152346, 0, 1, 0.509804, 1,
-0.1996424, 1.609412, -1.247132, 0, 1, 0.5137255, 1,
-0.1994036, -0.3046851, -1.700353, 0, 1, 0.5215687, 1,
-0.1990104, 0.3205732, -0.04178021, 0, 1, 0.5254902, 1,
-0.1971461, -0.08447602, -0.6295207, 0, 1, 0.5333334, 1,
-0.1966801, -0.3303592, -3.823565, 0, 1, 0.5372549, 1,
-0.1897281, 2.375977, -1.450281, 0, 1, 0.5450981, 1,
-0.1891512, 2.024897, -2.388284, 0, 1, 0.5490196, 1,
-0.1891102, 0.5487517, 0.4698793, 0, 1, 0.5568628, 1,
-0.186238, 0.2565828, -1.045307, 0, 1, 0.5607843, 1,
-0.1852962, 0.06829335, -1.570269, 0, 1, 0.5686275, 1,
-0.1766759, -1.304763, -2.011451, 0, 1, 0.572549, 1,
-0.1753542, 1.752134, -0.1077103, 0, 1, 0.5803922, 1,
-0.1750535, 0.155797, 1.881196, 0, 1, 0.5843138, 1,
-0.1690089, -1.349634, -3.213179, 0, 1, 0.5921569, 1,
-0.1649109, -1.711501, -1.607229, 0, 1, 0.5960785, 1,
-0.1627226, -0.0401329, -2.597842, 0, 1, 0.6039216, 1,
-0.1610466, 0.2831431, 0.3309263, 0, 1, 0.6117647, 1,
-0.160008, -2.994164, -3.702128, 0, 1, 0.6156863, 1,
-0.1524667, 0.5776939, 1.536561, 0, 1, 0.6235294, 1,
-0.1514639, 0.7387668, 1.118161, 0, 1, 0.627451, 1,
-0.1438818, -1.640176, -3.071442, 0, 1, 0.6352941, 1,
-0.1421606, -0.8706843, -2.011532, 0, 1, 0.6392157, 1,
-0.1415488, -0.6089013, -2.379947, 0, 1, 0.6470588, 1,
-0.136742, -0.5132747, -4.168699, 0, 1, 0.6509804, 1,
-0.134796, 2.025133, -0.1043734, 0, 1, 0.6588235, 1,
-0.132886, 2.25318, 0.9606903, 0, 1, 0.6627451, 1,
-0.1310556, -0.7285145, -3.173758, 0, 1, 0.6705883, 1,
-0.1292945, 1.875494, -1.895669, 0, 1, 0.6745098, 1,
-0.1292441, 0.1970633, 0.06355105, 0, 1, 0.682353, 1,
-0.127432, -0.4042507, -2.423997, 0, 1, 0.6862745, 1,
-0.1243928, -1.552284, -4.782899, 0, 1, 0.6941177, 1,
-0.119311, 0.6111516, -0.1090489, 0, 1, 0.7019608, 1,
-0.1191816, -1.474645, -2.340393, 0, 1, 0.7058824, 1,
-0.1153433, -1.132426, -3.826432, 0, 1, 0.7137255, 1,
-0.1122223, -0.111608, -3.225773, 0, 1, 0.7176471, 1,
-0.1110352, -0.4872408, -2.08288, 0, 1, 0.7254902, 1,
-0.1101142, 0.4121953, -2.746222, 0, 1, 0.7294118, 1,
-0.1089857, 1.357876, 0.0001916416, 0, 1, 0.7372549, 1,
-0.1045477, 2.124371, 1.227064, 0, 1, 0.7411765, 1,
-0.1041626, -1.539498, -4.026771, 0, 1, 0.7490196, 1,
-0.100653, -0.8925399, -3.851059, 0, 1, 0.7529412, 1,
-0.1002318, -0.7884172, -3.020439, 0, 1, 0.7607843, 1,
-0.09712973, 0.4443191, 0.3582217, 0, 1, 0.7647059, 1,
-0.09663446, 0.2888979, 1.103291, 0, 1, 0.772549, 1,
-0.09296273, 2.138796, -0.5769491, 0, 1, 0.7764706, 1,
-0.09172136, -0.8222693, -3.869649, 0, 1, 0.7843137, 1,
-0.0916647, -0.872828, -3.964386, 0, 1, 0.7882353, 1,
-0.08769611, 1.581139, -0.2814147, 0, 1, 0.7960784, 1,
-0.08693834, 0.1013048, -2.183186, 0, 1, 0.8039216, 1,
-0.08617943, -2.428041, -1.254813, 0, 1, 0.8078431, 1,
-0.08298336, 0.5233539, 1.008286, 0, 1, 0.8156863, 1,
-0.08246849, 1.460013, 0.7132697, 0, 1, 0.8196079, 1,
-0.08180816, 0.2768962, -2.271301, 0, 1, 0.827451, 1,
-0.08149167, -1.907657, -3.037417, 0, 1, 0.8313726, 1,
-0.079027, 0.6029477, 0.5963736, 0, 1, 0.8392157, 1,
-0.07877862, 0.2178343, -1.376959, 0, 1, 0.8431373, 1,
-0.07748986, -1.380498, -3.637604, 0, 1, 0.8509804, 1,
-0.06918304, 0.1284973, -2.276675, 0, 1, 0.854902, 1,
-0.06363694, 1.428953, 0.6530064, 0, 1, 0.8627451, 1,
-0.06021804, 0.2921929, -0.6529021, 0, 1, 0.8666667, 1,
-0.06000862, -0.6627327, -3.521275, 0, 1, 0.8745098, 1,
-0.05990257, -0.8809323, -2.072094, 0, 1, 0.8784314, 1,
-0.05690464, -0.1469684, -5.54911, 0, 1, 0.8862745, 1,
-0.05327262, 1.117769, -0.7979587, 0, 1, 0.8901961, 1,
-0.05240082, -0.1439996, -2.772253, 0, 1, 0.8980392, 1,
-0.04954146, -1.118127, -3.15938, 0, 1, 0.9058824, 1,
-0.04563696, -0.8273408, -4.089849, 0, 1, 0.9098039, 1,
-0.04458448, 1.165152, -0.7946998, 0, 1, 0.9176471, 1,
-0.04404603, -0.6442167, -2.403875, 0, 1, 0.9215686, 1,
-0.04278968, 0.8349369, -0.8055679, 0, 1, 0.9294118, 1,
-0.04168337, -0.79742, -3.526522, 0, 1, 0.9333333, 1,
-0.04154532, -0.3918457, -4.623446, 0, 1, 0.9411765, 1,
-0.04130916, 1.104904, 0.1579339, 0, 1, 0.945098, 1,
-0.03807408, -0.3965427, -2.356046, 0, 1, 0.9529412, 1,
-0.03205768, 0.8884898, -0.1297271, 0, 1, 0.9568627, 1,
-0.02731838, 0.175679, 0.123523, 0, 1, 0.9647059, 1,
-0.02619986, 1.301524, -3.324781, 0, 1, 0.9686275, 1,
-0.02264768, 0.09945259, 0.110668, 0, 1, 0.9764706, 1,
-0.02147022, -0.7068229, -4.259688, 0, 1, 0.9803922, 1,
-0.01659927, -0.1229091, -3.697427, 0, 1, 0.9882353, 1,
-0.01635808, 1.095028, -1.36651, 0, 1, 0.9921569, 1,
-0.01391316, -0.3987974, -4.580154, 0, 1, 1, 1,
-0.0122237, -0.6499175, -3.910224, 0, 0.9921569, 1, 1,
-0.0108203, 0.4305117, 0.09121946, 0, 0.9882353, 1, 1,
-0.01060282, 0.8610824, 0.2472039, 0, 0.9803922, 1, 1,
-0.005420219, -1.176987, -3.042567, 0, 0.9764706, 1, 1,
0.002478659, -0.3081732, 3.13592, 0, 0.9686275, 1, 1,
0.006192653, -1.387416, 4.172152, 0, 0.9647059, 1, 1,
0.007183378, -0.5006007, 4.008957, 0, 0.9568627, 1, 1,
0.008919436, -0.4502244, 2.508291, 0, 0.9529412, 1, 1,
0.01001862, 0.2260559, 1.109658, 0, 0.945098, 1, 1,
0.01588828, 1.075066, 0.7421371, 0, 0.9411765, 1, 1,
0.02301846, -0.9433412, 3.943131, 0, 0.9333333, 1, 1,
0.02671214, -0.6205297, 2.356206, 0, 0.9294118, 1, 1,
0.02672703, 0.7819448, -0.2995424, 0, 0.9215686, 1, 1,
0.02702776, -2.033149, 2.758031, 0, 0.9176471, 1, 1,
0.03042632, -0.1076058, 3.500926, 0, 0.9098039, 1, 1,
0.03231977, 0.6845283, 0.3511282, 0, 0.9058824, 1, 1,
0.03630961, 0.8407618, 0.7008827, 0, 0.8980392, 1, 1,
0.04059569, 0.06617104, 1.455698, 0, 0.8901961, 1, 1,
0.04442248, -0.07812481, 3.174737, 0, 0.8862745, 1, 1,
0.04606313, -1.203171, 2.558869, 0, 0.8784314, 1, 1,
0.04646184, -0.9212965, 3.133914, 0, 0.8745098, 1, 1,
0.04744003, 0.2851552, 0.6915883, 0, 0.8666667, 1, 1,
0.04835419, 0.3468527, 0.02033005, 0, 0.8627451, 1, 1,
0.05200946, -0.806681, 2.41334, 0, 0.854902, 1, 1,
0.05506925, -0.8556014, 3.849478, 0, 0.8509804, 1, 1,
0.05563362, 0.5400124, 0.2705829, 0, 0.8431373, 1, 1,
0.05814767, -0.8757946, 3.733348, 0, 0.8392157, 1, 1,
0.0590435, -1.188893, 3.378925, 0, 0.8313726, 1, 1,
0.0596412, 0.1722816, 0.6956482, 0, 0.827451, 1, 1,
0.06248954, -2.195029, 3.008127, 0, 0.8196079, 1, 1,
0.06365918, 0.8617381, -0.6189806, 0, 0.8156863, 1, 1,
0.06888668, -0.9188052, 3.15712, 0, 0.8078431, 1, 1,
0.06965079, 0.671479, -0.8946078, 0, 0.8039216, 1, 1,
0.07394806, -0.8055646, 4.170412, 0, 0.7960784, 1, 1,
0.07485685, 0.7309061, 1.079848, 0, 0.7882353, 1, 1,
0.07590254, 0.7340521, 1.167035, 0, 0.7843137, 1, 1,
0.08266255, 1.122964, -2.27352, 0, 0.7764706, 1, 1,
0.08658495, -1.500428, 1.667667, 0, 0.772549, 1, 1,
0.08985694, 2.622737, -1.920329, 0, 0.7647059, 1, 1,
0.09382296, 1.088046, -0.8880371, 0, 0.7607843, 1, 1,
0.0953682, 0.4348333, 0.3970529, 0, 0.7529412, 1, 1,
0.1016912, -0.4882082, 1.76817, 0, 0.7490196, 1, 1,
0.1062676, 0.4835996, 1.135006, 0, 0.7411765, 1, 1,
0.1143777, -1.553739, 3.990678, 0, 0.7372549, 1, 1,
0.1183536, -0.6263366, 1.664718, 0, 0.7294118, 1, 1,
0.1221408, -0.5793562, 2.852048, 0, 0.7254902, 1, 1,
0.1241578, 1.229063, 0.1391541, 0, 0.7176471, 1, 1,
0.1250312, -0.5036541, 1.181553, 0, 0.7137255, 1, 1,
0.1268077, -0.06744806, 2.80958, 0, 0.7058824, 1, 1,
0.1273406, 0.1938615, -0.5588983, 0, 0.6980392, 1, 1,
0.128748, -0.9272176, 3.300074, 0, 0.6941177, 1, 1,
0.1291533, -0.9999653, 3.707922, 0, 0.6862745, 1, 1,
0.1330792, 1.86477, 0.002958148, 0, 0.682353, 1, 1,
0.1408538, -0.1637571, 1.092582, 0, 0.6745098, 1, 1,
0.1416682, -1.245322, 3.739369, 0, 0.6705883, 1, 1,
0.1444019, 0.06021994, 1.008255, 0, 0.6627451, 1, 1,
0.1481787, 0.1839734, 1.543959, 0, 0.6588235, 1, 1,
0.1498018, -1.58975, 4.655581, 0, 0.6509804, 1, 1,
0.1507614, -0.9152254, 2.515617, 0, 0.6470588, 1, 1,
0.1512843, -0.6797134, 2.520137, 0, 0.6392157, 1, 1,
0.1530185, 1.37949, -1.07337, 0, 0.6352941, 1, 1,
0.1538885, -0.2279742, 3.112729, 0, 0.627451, 1, 1,
0.160429, -0.7206915, 2.655124, 0, 0.6235294, 1, 1,
0.1654388, -0.1168994, 1.543264, 0, 0.6156863, 1, 1,
0.1692834, -0.3460084, 2.654534, 0, 0.6117647, 1, 1,
0.1752652, 1.288003, 0.06506199, 0, 0.6039216, 1, 1,
0.1753763, -0.04206156, 0.6615902, 0, 0.5960785, 1, 1,
0.1755864, -0.3749887, 2.054023, 0, 0.5921569, 1, 1,
0.1828186, -0.3167085, 2.801189, 0, 0.5843138, 1, 1,
0.1831134, 0.5556713, 1.732726, 0, 0.5803922, 1, 1,
0.1881972, -0.8186726, 2.573104, 0, 0.572549, 1, 1,
0.1887934, -1.85391, 3.293483, 0, 0.5686275, 1, 1,
0.1935977, 1.081604, 0.9249375, 0, 0.5607843, 1, 1,
0.1939555, 0.4602129, 1.027258, 0, 0.5568628, 1, 1,
0.1949538, 0.6696882, 0.2905998, 0, 0.5490196, 1, 1,
0.20162, -1.170005, 2.138241, 0, 0.5450981, 1, 1,
0.204579, 0.4538229, 0.5725046, 0, 0.5372549, 1, 1,
0.2048797, -0.2886876, 2.69116, 0, 0.5333334, 1, 1,
0.2138904, 0.06670567, -0.3861861, 0, 0.5254902, 1, 1,
0.2156341, 1.703731, 0.1356796, 0, 0.5215687, 1, 1,
0.2216085, -0.3661068, 1.539043, 0, 0.5137255, 1, 1,
0.222075, -0.7739824, 3.161751, 0, 0.509804, 1, 1,
0.2255341, -0.1684121, 2.536387, 0, 0.5019608, 1, 1,
0.2324736, 0.4724166, 1.053266, 0, 0.4941176, 1, 1,
0.2340553, -1.282708, 2.805257, 0, 0.4901961, 1, 1,
0.2344547, -0.1180007, 2.989863, 0, 0.4823529, 1, 1,
0.2371447, -0.4211677, 1.190383, 0, 0.4784314, 1, 1,
0.2376866, -0.08380154, 2.719242, 0, 0.4705882, 1, 1,
0.2388883, 1.34171, 0.5803107, 0, 0.4666667, 1, 1,
0.2394769, 0.1870474, 1.239667, 0, 0.4588235, 1, 1,
0.2402572, -1.486287, 4.034931, 0, 0.454902, 1, 1,
0.2414896, 0.8931754, 1.178759, 0, 0.4470588, 1, 1,
0.2456664, -0.8836825, 0.2443733, 0, 0.4431373, 1, 1,
0.2468279, -0.5744984, 3.055436, 0, 0.4352941, 1, 1,
0.2521068, 0.1326421, 0.1532408, 0, 0.4313726, 1, 1,
0.2529177, -0.3676861, 3.097228, 0, 0.4235294, 1, 1,
0.2599252, 1.312214, -2.028679, 0, 0.4196078, 1, 1,
0.2612655, 1.258907, -0.508501, 0, 0.4117647, 1, 1,
0.2677879, -0.5653231, 2.627574, 0, 0.4078431, 1, 1,
0.2682596, 0.6596818, 0.0672295, 0, 0.4, 1, 1,
0.2721041, -0.1655533, 3.523112, 0, 0.3921569, 1, 1,
0.2724998, -0.8757744, 3.776414, 0, 0.3882353, 1, 1,
0.2740457, -1.432179, 2.020526, 0, 0.3803922, 1, 1,
0.2778286, -1.02861, 2.568835, 0, 0.3764706, 1, 1,
0.2798346, 0.5848292, -0.4862364, 0, 0.3686275, 1, 1,
0.2803051, 1.85781, 0.4127806, 0, 0.3647059, 1, 1,
0.289677, 0.4472393, -0.5228738, 0, 0.3568628, 1, 1,
0.2909051, 1.253139, 0.4967546, 0, 0.3529412, 1, 1,
0.2954355, -0.009328562, 2.318054, 0, 0.345098, 1, 1,
0.2989976, -1.056674, 2.640901, 0, 0.3411765, 1, 1,
0.2993217, -1.119983, 3.785557, 0, 0.3333333, 1, 1,
0.3000505, -1.330571, 3.955319, 0, 0.3294118, 1, 1,
0.302113, 0.724671, -0.9123144, 0, 0.3215686, 1, 1,
0.3042145, -0.4975742, 2.364567, 0, 0.3176471, 1, 1,
0.3063101, 0.6505961, 1.63495, 0, 0.3098039, 1, 1,
0.3070823, 0.7907133, 1.096994, 0, 0.3058824, 1, 1,
0.3105912, -0.3733606, 2.700918, 0, 0.2980392, 1, 1,
0.3121798, -1.176707, 1.930484, 0, 0.2901961, 1, 1,
0.3201501, -0.4336245, 2.806434, 0, 0.2862745, 1, 1,
0.3228071, -1.200811, 1.998846, 0, 0.2784314, 1, 1,
0.3246362, -0.3560263, 0.147859, 0, 0.2745098, 1, 1,
0.3265226, 0.6453524, -0.006594166, 0, 0.2666667, 1, 1,
0.3272067, 2.419921, -0.4778256, 0, 0.2627451, 1, 1,
0.3290021, -0.526063, 3.857873, 0, 0.254902, 1, 1,
0.338771, 0.4312708, -0.8577087, 0, 0.2509804, 1, 1,
0.3397523, 1.819741, -0.5895804, 0, 0.2431373, 1, 1,
0.3415098, -0.09586374, 1.598875, 0, 0.2392157, 1, 1,
0.3435406, 2.059369, 0.5507258, 0, 0.2313726, 1, 1,
0.3473081, 1.352244, 1.180755, 0, 0.227451, 1, 1,
0.348585, -0.5936993, 0.9049595, 0, 0.2196078, 1, 1,
0.3511715, -0.7560046, 3.288049, 0, 0.2156863, 1, 1,
0.3516606, 0.2989281, -0.9213145, 0, 0.2078431, 1, 1,
0.3523144, -0.6330794, 1.936583, 0, 0.2039216, 1, 1,
0.3545042, 0.07177036, 2.06774, 0, 0.1960784, 1, 1,
0.3561419, 0.7854179, 0.9488482, 0, 0.1882353, 1, 1,
0.3574905, -0.7564814, 1.348015, 0, 0.1843137, 1, 1,
0.3583153, 1.795798, 0.916543, 0, 0.1764706, 1, 1,
0.3628581, -0.4878577, 0.585409, 0, 0.172549, 1, 1,
0.3631915, -0.7609153, 2.310628, 0, 0.1647059, 1, 1,
0.3701185, -0.7077057, 2.801055, 0, 0.1607843, 1, 1,
0.3755809, -0.5614794, 2.161301, 0, 0.1529412, 1, 1,
0.3763408, 0.5924966, 0.1624951, 0, 0.1490196, 1, 1,
0.379787, 0.4892178, 0.3968127, 0, 0.1411765, 1, 1,
0.3844685, -0.3097192, 2.955814, 0, 0.1372549, 1, 1,
0.3879752, -1.117696, 3.273332, 0, 0.1294118, 1, 1,
0.388322, -0.4248622, 2.048985, 0, 0.1254902, 1, 1,
0.3886507, -0.6041163, 2.23204, 0, 0.1176471, 1, 1,
0.3927588, 0.2512534, 1.129918, 0, 0.1137255, 1, 1,
0.3928105, -1.117878, 4.252028, 0, 0.1058824, 1, 1,
0.3947072, 1.06337, -0.3513902, 0, 0.09803922, 1, 1,
0.3957798, 0.8229812, 1.1196, 0, 0.09411765, 1, 1,
0.3995523, 1.297243, 1.362901, 0, 0.08627451, 1, 1,
0.4029884, -1.207981, 2.644068, 0, 0.08235294, 1, 1,
0.4045347, 1.427906, -0.4894017, 0, 0.07450981, 1, 1,
0.409916, 0.4070001, 2.31095, 0, 0.07058824, 1, 1,
0.4185758, 0.1766637, 1.013557, 0, 0.0627451, 1, 1,
0.4238544, -0.4665557, 2.183384, 0, 0.05882353, 1, 1,
0.4255677, -0.3507944, 2.367885, 0, 0.05098039, 1, 1,
0.426476, -0.9513993, 2.161253, 0, 0.04705882, 1, 1,
0.427826, -0.1204713, 2.350039, 0, 0.03921569, 1, 1,
0.4300096, 0.5614242, -0.6642946, 0, 0.03529412, 1, 1,
0.432497, 0.9581866, -1.686121, 0, 0.02745098, 1, 1,
0.4342523, 1.47053, -0.08995318, 0, 0.02352941, 1, 1,
0.4345253, -1.278327, 2.330384, 0, 0.01568628, 1, 1,
0.4401108, -0.4243275, 3.386008, 0, 0.01176471, 1, 1,
0.4402768, 0.6587425, 1.99819, 0, 0.003921569, 1, 1,
0.4414393, -0.3608736, 1.360284, 0.003921569, 0, 1, 1,
0.4552726, 1.257467, -0.2075058, 0.007843138, 0, 1, 1,
0.4665846, 0.2260517, 1.339736, 0.01568628, 0, 1, 1,
0.4669091, 1.723451, 1.642283, 0.01960784, 0, 1, 1,
0.4801421, -0.007204133, 1.351724, 0.02745098, 0, 1, 1,
0.4810398, 0.07930202, 2.554227, 0.03137255, 0, 1, 1,
0.4821952, -0.410699, 4.507422, 0.03921569, 0, 1, 1,
0.4844357, -0.7640707, 2.681506, 0.04313726, 0, 1, 1,
0.4845542, -0.2081441, 2.177253, 0.05098039, 0, 1, 1,
0.4883603, 0.5083662, 1.169083, 0.05490196, 0, 1, 1,
0.4942617, -0.46473, 3.786259, 0.0627451, 0, 1, 1,
0.500412, -0.6276405, 0.6151956, 0.06666667, 0, 1, 1,
0.5024193, -0.6275389, 3.781954, 0.07450981, 0, 1, 1,
0.5040844, 0.1177215, 1.635686, 0.07843138, 0, 1, 1,
0.5074514, -1.338717, 2.726345, 0.08627451, 0, 1, 1,
0.5100806, 0.2565549, -0.4969993, 0.09019608, 0, 1, 1,
0.5109591, 0.1238887, 1.970654, 0.09803922, 0, 1, 1,
0.514582, 0.6518308, -0.05490754, 0.1058824, 0, 1, 1,
0.5160884, 1.729343, -0.2354509, 0.1098039, 0, 1, 1,
0.5171542, -0.272083, 3.101084, 0.1176471, 0, 1, 1,
0.5179595, 0.5317693, 1.867133, 0.1215686, 0, 1, 1,
0.5187305, 0.3806008, 1.720302, 0.1294118, 0, 1, 1,
0.5190482, 0.342266, -0.3657951, 0.1333333, 0, 1, 1,
0.5237598, 0.5399749, 0.1058455, 0.1411765, 0, 1, 1,
0.5282832, 0.5455828, 0.105005, 0.145098, 0, 1, 1,
0.5283658, 1.440981, -0.83942, 0.1529412, 0, 1, 1,
0.5284232, -0.4617887, 3.220101, 0.1568628, 0, 1, 1,
0.5293243, -0.7083265, 2.584153, 0.1647059, 0, 1, 1,
0.5307611, 1.478737, -0.06036903, 0.1686275, 0, 1, 1,
0.5372366, 0.09876499, 2.220669, 0.1764706, 0, 1, 1,
0.5393973, -0.3797761, 2.902935, 0.1803922, 0, 1, 1,
0.5403475, -0.872438, 0.8153727, 0.1882353, 0, 1, 1,
0.5428866, -0.4419134, 3.360007, 0.1921569, 0, 1, 1,
0.5437316, 0.6879825, 0.3781359, 0.2, 0, 1, 1,
0.5471262, -0.3488372, 1.912359, 0.2078431, 0, 1, 1,
0.5531219, 0.1838467, 0.7457781, 0.2117647, 0, 1, 1,
0.5596234, -0.7655377, 2.811931, 0.2196078, 0, 1, 1,
0.5598207, -0.2936802, 1.671074, 0.2235294, 0, 1, 1,
0.574279, 0.9761281, -0.07191116, 0.2313726, 0, 1, 1,
0.5761521, 1.864219, -0.07907789, 0.2352941, 0, 1, 1,
0.5806407, -1.780565, 4.251619, 0.2431373, 0, 1, 1,
0.5820297, -0.7927631, 4.411448, 0.2470588, 0, 1, 1,
0.5828608, 0.468587, -0.6555005, 0.254902, 0, 1, 1,
0.5874195, 1.323666, 2.755958, 0.2588235, 0, 1, 1,
0.5883498, -0.2954595, 2.24173, 0.2666667, 0, 1, 1,
0.5888631, -0.5872996, 1.344038, 0.2705882, 0, 1, 1,
0.591556, 3.019963, 0.7392477, 0.2784314, 0, 1, 1,
0.5937799, -0.3950272, 2.199691, 0.282353, 0, 1, 1,
0.5945684, -0.429362, 3.345492, 0.2901961, 0, 1, 1,
0.5961034, -0.07017554, 1.984285, 0.2941177, 0, 1, 1,
0.5968748, 0.939261, -0.4067723, 0.3019608, 0, 1, 1,
0.6028526, 1.018404, 0.894626, 0.3098039, 0, 1, 1,
0.6029848, 0.4753324, 0.7041768, 0.3137255, 0, 1, 1,
0.6057899, -0.471823, 2.304067, 0.3215686, 0, 1, 1,
0.6125587, 0.005411947, 2.794202, 0.3254902, 0, 1, 1,
0.6142211, 0.850843, -0.2878774, 0.3333333, 0, 1, 1,
0.6159901, 0.2221333, 0.6879574, 0.3372549, 0, 1, 1,
0.6191354, -2.585561, 2.647576, 0.345098, 0, 1, 1,
0.6197703, 0.2925515, -0.3950371, 0.3490196, 0, 1, 1,
0.6212753, 3.207736, -0.1936709, 0.3568628, 0, 1, 1,
0.6228346, -0.580468, 1.795958, 0.3607843, 0, 1, 1,
0.6261649, -0.9150519, 2.667919, 0.3686275, 0, 1, 1,
0.628721, -1.505532, 1.486322, 0.372549, 0, 1, 1,
0.629071, 0.3275105, 1.107435, 0.3803922, 0, 1, 1,
0.629118, 1.031504, 0.8967462, 0.3843137, 0, 1, 1,
0.6293622, -1.61846, 4.341988, 0.3921569, 0, 1, 1,
0.6343136, 0.7280296, -1.515377, 0.3960784, 0, 1, 1,
0.6454036, -0.1699803, 2.141724, 0.4039216, 0, 1, 1,
0.6465127, -1.072519, 1.908002, 0.4117647, 0, 1, 1,
0.6493418, -0.8148571, 1.526593, 0.4156863, 0, 1, 1,
0.6494747, 2.231651, 0.2243501, 0.4235294, 0, 1, 1,
0.6639208, -1.184843, 2.719762, 0.427451, 0, 1, 1,
0.6664591, 0.9801149, 0.4574397, 0.4352941, 0, 1, 1,
0.6669181, 0.6261554, -0.6448522, 0.4392157, 0, 1, 1,
0.6671754, -0.2427671, 0.6266174, 0.4470588, 0, 1, 1,
0.6672904, -1.051, 0.7690995, 0.4509804, 0, 1, 1,
0.6691712, 0.1763764, 0.5640445, 0.4588235, 0, 1, 1,
0.6762983, -0.2688958, 2.337399, 0.4627451, 0, 1, 1,
0.6810247, -0.000501494, -0.3438265, 0.4705882, 0, 1, 1,
0.6876943, -0.1224184, 2.829067, 0.4745098, 0, 1, 1,
0.6878808, -0.1395963, 1.610225, 0.4823529, 0, 1, 1,
0.691394, 0.3676611, 1.156663, 0.4862745, 0, 1, 1,
0.6963951, 0.2005969, 1.877868, 0.4941176, 0, 1, 1,
0.700192, -0.2990308, 3.390004, 0.5019608, 0, 1, 1,
0.7007026, -0.04214514, 0.3183827, 0.5058824, 0, 1, 1,
0.7033563, -1.519238, 2.9226, 0.5137255, 0, 1, 1,
0.708465, -0.6968622, 2.663827, 0.5176471, 0, 1, 1,
0.7086611, -1.417716, 2.646785, 0.5254902, 0, 1, 1,
0.7140262, -0.3111389, 1.867677, 0.5294118, 0, 1, 1,
0.7157772, 0.6034512, 0.4553639, 0.5372549, 0, 1, 1,
0.7172503, -0.9086089, 2.797808, 0.5411765, 0, 1, 1,
0.71934, 1.26711, 0.4987107, 0.5490196, 0, 1, 1,
0.7216855, -0.1474012, 2.260997, 0.5529412, 0, 1, 1,
0.7259555, -0.8745902, 3.138536, 0.5607843, 0, 1, 1,
0.7271633, -0.8498172, 2.641512, 0.5647059, 0, 1, 1,
0.7296073, 1.589754, -2.093967, 0.572549, 0, 1, 1,
0.730589, -0.3634554, 0.238546, 0.5764706, 0, 1, 1,
0.7322022, 1.814887, -0.5282388, 0.5843138, 0, 1, 1,
0.7352678, 0.9089051, 1.762562, 0.5882353, 0, 1, 1,
0.7379836, -0.7342914, 3.732941, 0.5960785, 0, 1, 1,
0.7396307, 1.816325, -0.1282808, 0.6039216, 0, 1, 1,
0.7404296, 1.580366, -0.5827131, 0.6078432, 0, 1, 1,
0.7409217, -0.3126916, 2.113534, 0.6156863, 0, 1, 1,
0.7434244, 0.8004997, 1.650269, 0.6196079, 0, 1, 1,
0.7442212, -0.2930584, 1.842261, 0.627451, 0, 1, 1,
0.7446319, -1.13688, 3.810765, 0.6313726, 0, 1, 1,
0.7461013, -0.2314287, 2.903671, 0.6392157, 0, 1, 1,
0.747481, 1.111481, 3.131307, 0.6431373, 0, 1, 1,
0.7562041, 0.01875636, 2.488603, 0.6509804, 0, 1, 1,
0.7562469, -0.637117, -0.1342153, 0.654902, 0, 1, 1,
0.7614926, 0.6937934, 0.2900492, 0.6627451, 0, 1, 1,
0.7641976, -0.5607214, 1.638782, 0.6666667, 0, 1, 1,
0.7645382, 0.3011891, 1.746403, 0.6745098, 0, 1, 1,
0.7667, -0.1506903, 3.898057, 0.6784314, 0, 1, 1,
0.7696658, 1.054542, 1.503555, 0.6862745, 0, 1, 1,
0.771947, -0.2252727, 3.22067, 0.6901961, 0, 1, 1,
0.7809952, -0.4771177, 2.51494, 0.6980392, 0, 1, 1,
0.7831924, -0.1999386, 2.124534, 0.7058824, 0, 1, 1,
0.7835432, 0.1454391, 1.384654, 0.7098039, 0, 1, 1,
0.7866011, -0.3362124, 2.372155, 0.7176471, 0, 1, 1,
0.7970448, -0.6070665, 2.954548, 0.7215686, 0, 1, 1,
0.7973187, -0.7473494, 2.393086, 0.7294118, 0, 1, 1,
0.8089792, 2.364614, 0.005506663, 0.7333333, 0, 1, 1,
0.8098007, -0.7271235, 2.742274, 0.7411765, 0, 1, 1,
0.8121604, -0.2488023, 0.9812385, 0.7450981, 0, 1, 1,
0.8145301, 0.7125779, 0.8221173, 0.7529412, 0, 1, 1,
0.8290651, -0.3159111, 3.25352, 0.7568628, 0, 1, 1,
0.8321627, -0.7022, 1.776117, 0.7647059, 0, 1, 1,
0.8443464, 2.445725, 1.833836, 0.7686275, 0, 1, 1,
0.8450941, -0.606554, 2.551827, 0.7764706, 0, 1, 1,
0.8452654, -0.6503397, 2.365938, 0.7803922, 0, 1, 1,
0.8493509, 0.1350365, -0.6398908, 0.7882353, 0, 1, 1,
0.8531946, 1.098999, 1.608828, 0.7921569, 0, 1, 1,
0.8575887, 0.0489158, 1.246696, 0.8, 0, 1, 1,
0.8580801, 0.9770189, 0.3839297, 0.8078431, 0, 1, 1,
0.8647989, -0.3599563, 0.7304938, 0.8117647, 0, 1, 1,
0.8665165, 0.7587518, 0.3975075, 0.8196079, 0, 1, 1,
0.8761988, -1.749791, 2.104122, 0.8235294, 0, 1, 1,
0.8778603, 0.4831741, 0.5785503, 0.8313726, 0, 1, 1,
0.885982, -0.350134, 1.152216, 0.8352941, 0, 1, 1,
0.886331, -0.2945885, 2.137637, 0.8431373, 0, 1, 1,
0.8870389, 0.4766706, 1.387842, 0.8470588, 0, 1, 1,
0.8907967, 0.9748111, 0.8715648, 0.854902, 0, 1, 1,
0.8943876, -1.565867, 3.091614, 0.8588235, 0, 1, 1,
0.9029402, 0.8777615, 1.344193, 0.8666667, 0, 1, 1,
0.9038259, 0.6621222, 0.4228801, 0.8705882, 0, 1, 1,
0.9042625, -0.6333039, 1.987913, 0.8784314, 0, 1, 1,
0.9159039, 0.8723718, 0.3376534, 0.8823529, 0, 1, 1,
0.9171149, 0.3885283, 1.443273, 0.8901961, 0, 1, 1,
0.9194664, 0.06629525, 1.78969, 0.8941177, 0, 1, 1,
0.9300539, 1.282427, 0.02622939, 0.9019608, 0, 1, 1,
0.9328805, 1.344601, 1.628838, 0.9098039, 0, 1, 1,
0.9383437, 0.3101615, 1.81668, 0.9137255, 0, 1, 1,
0.9410989, -1.282988, 2.304297, 0.9215686, 0, 1, 1,
0.941663, -0.198775, 0.9634345, 0.9254902, 0, 1, 1,
0.9440187, -0.3409516, 0.5759072, 0.9333333, 0, 1, 1,
0.9465939, 0.6912689, 2.433184, 0.9372549, 0, 1, 1,
0.9529924, -0.7886362, 2.221139, 0.945098, 0, 1, 1,
0.9606168, -0.4982944, 2.154884, 0.9490196, 0, 1, 1,
0.9648455, -0.2017396, 2.259553, 0.9568627, 0, 1, 1,
0.9702945, 1.41171, 1.058682, 0.9607843, 0, 1, 1,
0.9734402, -3.359352, 1.689673, 0.9686275, 0, 1, 1,
0.9787107, 0.2740028, -0.294414, 0.972549, 0, 1, 1,
0.9798794, 1.180305, 2.449439, 0.9803922, 0, 1, 1,
0.9874778, 0.1726041, 0.09914196, 0.9843137, 0, 1, 1,
0.9875516, -0.7472546, 1.510945, 0.9921569, 0, 1, 1,
0.9894386, -1.649563, 2.652847, 0.9960784, 0, 1, 1,
0.9929035, -0.3185067, 0.9031046, 1, 0, 0.9960784, 1,
0.9942144, 0.8298318, 2.097894, 1, 0, 0.9882353, 1,
0.9955865, -0.1878946, 2.4224, 1, 0, 0.9843137, 1,
1.000589, 0.5737553, 1.88194, 1, 0, 0.9764706, 1,
1.003849, 0.4082033, -0.09731612, 1, 0, 0.972549, 1,
1.005237, 0.1681559, 0.8616341, 1, 0, 0.9647059, 1,
1.005256, 1.331837, 0.73147, 1, 0, 0.9607843, 1,
1.006053, -0.7950045, 1.719056, 1, 0, 0.9529412, 1,
1.008739, 1.127398, 0.8627059, 1, 0, 0.9490196, 1,
1.008961, 0.7654525, 1.421808, 1, 0, 0.9411765, 1,
1.009363, -2.014486, 3.404012, 1, 0, 0.9372549, 1,
1.011788, -0.3325137, 1.364271, 1, 0, 0.9294118, 1,
1.016786, -0.08185009, 1.739866, 1, 0, 0.9254902, 1,
1.027014, -0.4579739, 1.562324, 1, 0, 0.9176471, 1,
1.03977, -0.4820637, 1.324745, 1, 0, 0.9137255, 1,
1.04304, 0.06814819, 0.5011674, 1, 0, 0.9058824, 1,
1.045224, -0.8470339, 0.5827153, 1, 0, 0.9019608, 1,
1.046591, -0.06173524, 2.184127, 1, 0, 0.8941177, 1,
1.048516, -1.493245, 1.994291, 1, 0, 0.8862745, 1,
1.052678, -0.2932534, 1.859071, 1, 0, 0.8823529, 1,
1.054424, -0.07210623, 1.900068, 1, 0, 0.8745098, 1,
1.056165, 0.152547, 1.328616, 1, 0, 0.8705882, 1,
1.056789, -2.149304, 1.787632, 1, 0, 0.8627451, 1,
1.079191, -0.3442796, 1.732373, 1, 0, 0.8588235, 1,
1.081206, -9.948266e-05, 2.475945, 1, 0, 0.8509804, 1,
1.082095, -0.3649521, 1.09042, 1, 0, 0.8470588, 1,
1.091853, 1.894966, 0.485626, 1, 0, 0.8392157, 1,
1.103822, 0.0130068, -0.5737392, 1, 0, 0.8352941, 1,
1.108347, 1.140226, -0.7739136, 1, 0, 0.827451, 1,
1.108607, -1.62977, 1.513564, 1, 0, 0.8235294, 1,
1.110425, 0.07563362, 0.4177899, 1, 0, 0.8156863, 1,
1.112048, -0.8456936, 2.481372, 1, 0, 0.8117647, 1,
1.112691, -1.537328, 4.574014, 1, 0, 0.8039216, 1,
1.115694, 0.6096352, 2.366118, 1, 0, 0.7960784, 1,
1.119938, -1.138379, 2.782533, 1, 0, 0.7921569, 1,
1.123046, -0.2528869, 2.670417, 1, 0, 0.7843137, 1,
1.123885, -1.010726, 2.941508, 1, 0, 0.7803922, 1,
1.127566, 1.246292, 1.314797, 1, 0, 0.772549, 1,
1.130535, -0.4339003, 1.512713, 1, 0, 0.7686275, 1,
1.134136, 0.06183295, 3.045975, 1, 0, 0.7607843, 1,
1.134539, 0.2826405, 0.4888391, 1, 0, 0.7568628, 1,
1.135043, 0.9779135, 2.146358, 1, 0, 0.7490196, 1,
1.143689, -1.108388, 3.921674, 1, 0, 0.7450981, 1,
1.149182, -0.9812363, 1.411945, 1, 0, 0.7372549, 1,
1.155751, 0.2624641, 1.589367, 1, 0, 0.7333333, 1,
1.159422, 0.2985457, -0.2930976, 1, 0, 0.7254902, 1,
1.162418, 1.915436, 1.026052, 1, 0, 0.7215686, 1,
1.168915, 1.397823, 3.026652, 1, 0, 0.7137255, 1,
1.170158, -1.137426, 2.478694, 1, 0, 0.7098039, 1,
1.174148, -0.4492656, 1.572371, 1, 0, 0.7019608, 1,
1.177469, 0.7205716, 1.245344, 1, 0, 0.6941177, 1,
1.178161, -0.8600265, 1.356504, 1, 0, 0.6901961, 1,
1.179596, -0.7458803, 1.143988, 1, 0, 0.682353, 1,
1.18908, -0.8166282, 0.2520488, 1, 0, 0.6784314, 1,
1.204967, 0.4347851, 2.233316, 1, 0, 0.6705883, 1,
1.207609, -0.5233645, 0.9574918, 1, 0, 0.6666667, 1,
1.207686, 0.6785434, 1.839826, 1, 0, 0.6588235, 1,
1.210671, 2.196473, 0.6817084, 1, 0, 0.654902, 1,
1.212752, -0.3860577, 2.167787, 1, 0, 0.6470588, 1,
1.219178, 1.306115, -0.1611087, 1, 0, 0.6431373, 1,
1.220578, 0.4201929, 2.821415, 1, 0, 0.6352941, 1,
1.220851, 1.011783, 0.6960119, 1, 0, 0.6313726, 1,
1.223523, 0.7748756, 0.9803394, 1, 0, 0.6235294, 1,
1.225706, 0.1784468, 1.140921, 1, 0, 0.6196079, 1,
1.229543, 0.4906147, 1.327759, 1, 0, 0.6117647, 1,
1.232088, 0.2974963, 0.2981645, 1, 0, 0.6078432, 1,
1.234843, 0.4643459, -0.1547258, 1, 0, 0.6, 1,
1.235988, -1.464803, 2.974946, 1, 0, 0.5921569, 1,
1.236261, -0.2127931, 3.01475, 1, 0, 0.5882353, 1,
1.239212, 0.403142, 1.148511, 1, 0, 0.5803922, 1,
1.241312, 0.1499268, 3.038004, 1, 0, 0.5764706, 1,
1.25193, -0.09488541, 0.7243311, 1, 0, 0.5686275, 1,
1.258409, -0.1955345, 0.09300759, 1, 0, 0.5647059, 1,
1.259073, -1.475634, 1.591201, 1, 0, 0.5568628, 1,
1.261018, 0.2407003, 2.179862, 1, 0, 0.5529412, 1,
1.264563, -0.8158746, 1.598424, 1, 0, 0.5450981, 1,
1.271732, -1.72696, 2.170792, 1, 0, 0.5411765, 1,
1.273284, -0.5677493, 2.578847, 1, 0, 0.5333334, 1,
1.276084, 0.4942927, 0.9589249, 1, 0, 0.5294118, 1,
1.286312, -0.1283426, 3.116754, 1, 0, 0.5215687, 1,
1.289861, 0.7888415, 0.7268066, 1, 0, 0.5176471, 1,
1.29895, -0.1239107, 2.746621, 1, 0, 0.509804, 1,
1.302087, 1.116321, -0.3095003, 1, 0, 0.5058824, 1,
1.312931, -0.2541024, 2.888574, 1, 0, 0.4980392, 1,
1.314339, -0.6178142, 1.782946, 1, 0, 0.4901961, 1,
1.32453, 0.3536493, 1.195926, 1, 0, 0.4862745, 1,
1.329795, 1.977263, 0.8694101, 1, 0, 0.4784314, 1,
1.330462, 1.766646, 1.801354, 1, 0, 0.4745098, 1,
1.332368, -0.3622407, 0.3327237, 1, 0, 0.4666667, 1,
1.332495, -0.7778096, 2.238038, 1, 0, 0.4627451, 1,
1.341538, 0.1419914, 3.014425, 1, 0, 0.454902, 1,
1.348425, -0.409952, 2.825214, 1, 0, 0.4509804, 1,
1.348522, -0.7937973, 1.129985, 1, 0, 0.4431373, 1,
1.349138, 0.3061912, 1.976673, 1, 0, 0.4392157, 1,
1.366125, -0.1425241, 2.18926, 1, 0, 0.4313726, 1,
1.36806, -1.589936, 3.472529, 1, 0, 0.427451, 1,
1.376548, 1.089918, 2.050069, 1, 0, 0.4196078, 1,
1.40111, 1.060037, 1.36177, 1, 0, 0.4156863, 1,
1.425877, 0.2123409, -0.3263993, 1, 0, 0.4078431, 1,
1.429876, 0.4474148, 0.03552428, 1, 0, 0.4039216, 1,
1.430559, 0.8424323, -0.1966318, 1, 0, 0.3960784, 1,
1.43838, 0.6794291, 1.86075, 1, 0, 0.3882353, 1,
1.442049, -1.316831, 2.354656, 1, 0, 0.3843137, 1,
1.458215, 0.8880777, 0.526684, 1, 0, 0.3764706, 1,
1.459695, -1.279614, 2.081159, 1, 0, 0.372549, 1,
1.46218, 0.4581944, 2.006715, 1, 0, 0.3647059, 1,
1.480044, 0.6759603, 0.9976332, 1, 0, 0.3607843, 1,
1.519114, -0.5803679, 4.093005, 1, 0, 0.3529412, 1,
1.522675, 1.207066, 0.7102904, 1, 0, 0.3490196, 1,
1.53339, -1.150862, 1.840904, 1, 0, 0.3411765, 1,
1.535501, -0.5612471, 1.560098, 1, 0, 0.3372549, 1,
1.537729, -1.466055, 1.642911, 1, 0, 0.3294118, 1,
1.562717, 1.499814, 0.08194663, 1, 0, 0.3254902, 1,
1.573323, 0.4740259, 2.049985, 1, 0, 0.3176471, 1,
1.578499, 1.431123, -0.7584211, 1, 0, 0.3137255, 1,
1.610137, 0.9567277, 2.626117, 1, 0, 0.3058824, 1,
1.635421, -1.225536, 2.960064, 1, 0, 0.2980392, 1,
1.648468, 0.202207, 1.002733, 1, 0, 0.2941177, 1,
1.659178, -0.2541966, 2.563654, 1, 0, 0.2862745, 1,
1.662713, -0.6603227, 2.163004, 1, 0, 0.282353, 1,
1.702062, 1.213603, 1.373695, 1, 0, 0.2745098, 1,
1.702534, 0.3184973, 1.556303, 1, 0, 0.2705882, 1,
1.704942, -0.6554266, 2.943056, 1, 0, 0.2627451, 1,
1.711062, -0.4334864, 1.344738, 1, 0, 0.2588235, 1,
1.713233, -1.193548, 2.768933, 1, 0, 0.2509804, 1,
1.722455, 0.1226391, 1.730466, 1, 0, 0.2470588, 1,
1.727774, -0.9912142, 1.20367, 1, 0, 0.2392157, 1,
1.737443, 0.3233137, 1.529092, 1, 0, 0.2352941, 1,
1.745443, 0.09881821, 1.353366, 1, 0, 0.227451, 1,
1.758174, -1.609136, 2.040151, 1, 0, 0.2235294, 1,
1.769786, 0.4798443, 2.894925, 1, 0, 0.2156863, 1,
1.797166, 1.860774, 1.529201, 1, 0, 0.2117647, 1,
1.799851, -0.9540002, 1.717006, 1, 0, 0.2039216, 1,
1.818424, -1.318597, 3.3528, 1, 0, 0.1960784, 1,
1.833983, 0.2243489, 1.537498, 1, 0, 0.1921569, 1,
1.838067, -2.468853, 1.772327, 1, 0, 0.1843137, 1,
1.848688, 0.724813, -0.05496592, 1, 0, 0.1803922, 1,
1.855058, 1.127736, 0.3167702, 1, 0, 0.172549, 1,
1.863878, -0.2592823, 1.792561, 1, 0, 0.1686275, 1,
1.86811, -2.518337, 2.362733, 1, 0, 0.1607843, 1,
1.892421, -0.7616878, 1.636257, 1, 0, 0.1568628, 1,
1.915016, -0.5784786, 1.876365, 1, 0, 0.1490196, 1,
1.926308, 2.036358, 0.48978, 1, 0, 0.145098, 1,
1.947699, -1.825026, 1.313682, 1, 0, 0.1372549, 1,
1.958231, 0.5176961, 1.483057, 1, 0, 0.1333333, 1,
2.017844, 0.6168938, 0.8287067, 1, 0, 0.1254902, 1,
2.076292, -0.1434295, 2.436121, 1, 0, 0.1215686, 1,
2.092116, 1.112767, 1.712802, 1, 0, 0.1137255, 1,
2.118015, 0.02266257, 1.934965, 1, 0, 0.1098039, 1,
2.147858, -1.360897, 0.5203943, 1, 0, 0.1019608, 1,
2.15059, 2.315716, 0.3318641, 1, 0, 0.09411765, 1,
2.165379, -0.3363213, 3.018737, 1, 0, 0.09019608, 1,
2.2009, -0.7404259, 3.286775, 1, 0, 0.08235294, 1,
2.227113, -1.152785, 1.921032, 1, 0, 0.07843138, 1,
2.250578, -0.9592038, 3.489591, 1, 0, 0.07058824, 1,
2.265742, -0.4109598, 2.118416, 1, 0, 0.06666667, 1,
2.282146, -1.192933, 4.590316, 1, 0, 0.05882353, 1,
2.296519, 0.1747748, 1.777093, 1, 0, 0.05490196, 1,
2.317441, 0.0608451, 1.292737, 1, 0, 0.04705882, 1,
2.369639, -1.588801, 0.50868, 1, 0, 0.04313726, 1,
2.4181, -0.4506439, 1.759982, 1, 0, 0.03529412, 1,
2.568892, 1.138384, 3.090205, 1, 0, 0.03137255, 1,
2.61909, -0.9140878, 2.023342, 1, 0, 0.02352941, 1,
2.665199, -1.79955, 3.603083, 1, 0, 0.01960784, 1,
2.729607, -0.2015015, 0.6887857, 1, 0, 0.01176471, 1,
2.883101, -0.1643702, 2.063772, 1, 0, 0.007843138, 1
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
-0.2174069, -4.472474, -7.278806, 0, -0.5, 0.5, 0.5,
-0.2174069, -4.472474, -7.278806, 1, -0.5, 0.5, 0.5,
-0.2174069, -4.472474, -7.278806, 1, 1.5, 0.5, 0.5,
-0.2174069, -4.472474, -7.278806, 0, 1.5, 0.5, 0.5
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
-4.368987, -0.07580805, -7.278806, 0, -0.5, 0.5, 0.5,
-4.368987, -0.07580805, -7.278806, 1, -0.5, 0.5, 0.5,
-4.368987, -0.07580805, -7.278806, 1, 1.5, 0.5, 0.5,
-4.368987, -0.07580805, -7.278806, 0, 1.5, 0.5, 0.5
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
-4.368987, -4.472474, -0.4467645, 0, -0.5, 0.5, 0.5,
-4.368987, -4.472474, -0.4467645, 1, -0.5, 0.5, 0.5,
-4.368987, -4.472474, -0.4467645, 1, 1.5, 0.5, 0.5,
-4.368987, -4.472474, -0.4467645, 0, 1.5, 0.5, 0.5
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
-3, -3.457859, -5.702181,
2, -3.457859, -5.702181,
-3, -3.457859, -5.702181,
-3, -3.626961, -5.964952,
-2, -3.457859, -5.702181,
-2, -3.626961, -5.964952,
-1, -3.457859, -5.702181,
-1, -3.626961, -5.964952,
0, -3.457859, -5.702181,
0, -3.626961, -5.964952,
1, -3.457859, -5.702181,
1, -3.626961, -5.964952,
2, -3.457859, -5.702181,
2, -3.626961, -5.964952
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
-3, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
-3, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
-3, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
-3, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5,
-2, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
-2, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
-2, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
-2, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5,
-1, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
-1, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
-1, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
-1, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5,
0, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
0, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
0, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
0, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5,
1, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
1, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
1, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
1, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5,
2, -3.965166, -6.490493, 0, -0.5, 0.5, 0.5,
2, -3.965166, -6.490493, 1, -0.5, 0.5, 0.5,
2, -3.965166, -6.490493, 1, 1.5, 0.5, 0.5,
2, -3.965166, -6.490493, 0, 1.5, 0.5, 0.5
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
-3.41093, -3, -5.702181,
-3.41093, 3, -5.702181,
-3.41093, -3, -5.702181,
-3.570606, -3, -5.964952,
-3.41093, -2, -5.702181,
-3.570606, -2, -5.964952,
-3.41093, -1, -5.702181,
-3.570606, -1, -5.964952,
-3.41093, 0, -5.702181,
-3.570606, 0, -5.964952,
-3.41093, 1, -5.702181,
-3.570606, 1, -5.964952,
-3.41093, 2, -5.702181,
-3.570606, 2, -5.964952,
-3.41093, 3, -5.702181,
-3.570606, 3, -5.964952
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
-3.889959, -3, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, -3, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, -3, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, -3, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, -2, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, -2, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, -2, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, -2, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, -1, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, -1, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, -1, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, -1, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, 0, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, 0, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, 0, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, 0, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, 1, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, 1, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, 1, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, 1, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, 2, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, 2, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, 2, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, 2, -6.490493, 0, 1.5, 0.5, 0.5,
-3.889959, 3, -6.490493, 0, -0.5, 0.5, 0.5,
-3.889959, 3, -6.490493, 1, -0.5, 0.5, 0.5,
-3.889959, 3, -6.490493, 1, 1.5, 0.5, 0.5,
-3.889959, 3, -6.490493, 0, 1.5, 0.5, 0.5
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
-3.41093, -3.457859, -4,
-3.41093, -3.457859, 4,
-3.41093, -3.457859, -4,
-3.570606, -3.626961, -4,
-3.41093, -3.457859, -2,
-3.570606, -3.626961, -2,
-3.41093, -3.457859, 0,
-3.570606, -3.626961, 0,
-3.41093, -3.457859, 2,
-3.570606, -3.626961, 2,
-3.41093, -3.457859, 4,
-3.570606, -3.626961, 4
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
-3.889959, -3.965166, -4, 0, -0.5, 0.5, 0.5,
-3.889959, -3.965166, -4, 1, -0.5, 0.5, 0.5,
-3.889959, -3.965166, -4, 1, 1.5, 0.5, 0.5,
-3.889959, -3.965166, -4, 0, 1.5, 0.5, 0.5,
-3.889959, -3.965166, -2, 0, -0.5, 0.5, 0.5,
-3.889959, -3.965166, -2, 1, -0.5, 0.5, 0.5,
-3.889959, -3.965166, -2, 1, 1.5, 0.5, 0.5,
-3.889959, -3.965166, -2, 0, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 0, 0, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 0, 1, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 0, 1, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 0, 0, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 2, 0, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 2, 1, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 2, 1, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 2, 0, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 4, 0, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 4, 1, -0.5, 0.5, 0.5,
-3.889959, -3.965166, 4, 1, 1.5, 0.5, 0.5,
-3.889959, -3.965166, 4, 0, 1.5, 0.5, 0.5
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
-3.41093, -3.457859, -5.702181,
-3.41093, 3.306242, -5.702181,
-3.41093, -3.457859, 4.808652,
-3.41093, 3.306242, 4.808652,
-3.41093, -3.457859, -5.702181,
-3.41093, -3.457859, 4.808652,
-3.41093, 3.306242, -5.702181,
-3.41093, 3.306242, 4.808652,
-3.41093, -3.457859, -5.702181,
2.976116, -3.457859, -5.702181,
-3.41093, -3.457859, 4.808652,
2.976116, -3.457859, 4.808652,
-3.41093, 3.306242, -5.702181,
2.976116, 3.306242, -5.702181,
-3.41093, 3.306242, 4.808652,
2.976116, 3.306242, 4.808652,
2.976116, -3.457859, -5.702181,
2.976116, 3.306242, -5.702181,
2.976116, -3.457859, 4.808652,
2.976116, 3.306242, 4.808652,
2.976116, -3.457859, -5.702181,
2.976116, -3.457859, 4.808652,
2.976116, 3.306242, -5.702181,
2.976116, 3.306242, 4.808652
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
var radius = 7.495251;
var distance = 33.34722;
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
mvMatrix.translate( 0.2174069, 0.07580805, 0.4467645 );
mvMatrix.scale( 1.26882, 1.198092, 0.7710152 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.34722);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


