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
-3.147987, -1.738242, -2.551334, 1, 0, 0, 1,
-3.121878, -0.1200097, -1.17448, 1, 0.007843138, 0, 1,
-2.980948, 0.765967, -1.369894, 1, 0.01176471, 0, 1,
-2.845105, 0.308339, -1.796111, 1, 0.01960784, 0, 1,
-2.822413, -0.5091899, -3.710196, 1, 0.02352941, 0, 1,
-2.821268, 1.365006, -1.953317, 1, 0.03137255, 0, 1,
-2.713786, 0.2309336, -2.46075, 1, 0.03529412, 0, 1,
-2.516512, -1.122451, -1.517256, 1, 0.04313726, 0, 1,
-2.502786, -0.211714, -1.745914, 1, 0.04705882, 0, 1,
-2.423117, 0.1311647, -0.7789423, 1, 0.05490196, 0, 1,
-2.417586, -0.08945156, -2.560985, 1, 0.05882353, 0, 1,
-2.399477, -0.4058362, -3.110685, 1, 0.06666667, 0, 1,
-2.335444, 0.6206794, -0.1564675, 1, 0.07058824, 0, 1,
-2.312168, 0.276548, -2.204392, 1, 0.07843138, 0, 1,
-2.306309, -1.258025, -2.064499, 1, 0.08235294, 0, 1,
-2.281613, -0.1322728, -2.314598, 1, 0.09019608, 0, 1,
-2.249244, -1.149732, -3.159752, 1, 0.09411765, 0, 1,
-2.22539, 1.365174, -1.229308, 1, 0.1019608, 0, 1,
-2.211449, 0.1532225, -1.190105, 1, 0.1098039, 0, 1,
-2.19987, 0.9971707, -1.022466, 1, 0.1137255, 0, 1,
-2.199759, 0.3075024, -0.8873808, 1, 0.1215686, 0, 1,
-2.188807, 2.513351, -0.8587376, 1, 0.1254902, 0, 1,
-2.175697, 0.6502234, -0.4196733, 1, 0.1333333, 0, 1,
-2.16045, -1.742603, -2.293825, 1, 0.1372549, 0, 1,
-2.159877, -0.8930755, -0.685651, 1, 0.145098, 0, 1,
-2.118584, 1.056328, -1.081198, 1, 0.1490196, 0, 1,
-2.115331, 1.263007, -2.592123, 1, 0.1568628, 0, 1,
-2.113826, -0.7285432, -2.484057, 1, 0.1607843, 0, 1,
-2.109152, 0.3676707, -0.72746, 1, 0.1686275, 0, 1,
-2.064197, -0.7146981, -1.208734, 1, 0.172549, 0, 1,
-1.980013, -0.4619808, -2.065059, 1, 0.1803922, 0, 1,
-1.971698, 1.095768, -1.759565, 1, 0.1843137, 0, 1,
-1.9502, -0.4022055, -2.718432, 1, 0.1921569, 0, 1,
-1.94795, 0.7472488, -0.2251239, 1, 0.1960784, 0, 1,
-1.942092, -0.1970022, -2.179989, 1, 0.2039216, 0, 1,
-1.926682, 0.7079489, -1.661093, 1, 0.2117647, 0, 1,
-1.915261, -0.1744348, -0.6232975, 1, 0.2156863, 0, 1,
-1.853626, -0.504963, -2.097887, 1, 0.2235294, 0, 1,
-1.823827, -0.6084635, -1.66021, 1, 0.227451, 0, 1,
-1.818212, 0.3367556, -0.5629859, 1, 0.2352941, 0, 1,
-1.812527, -0.7013473, -1.501218, 1, 0.2392157, 0, 1,
-1.810894, -0.6917888, -1.334101, 1, 0.2470588, 0, 1,
-1.784949, -0.7583361, -1.876607, 1, 0.2509804, 0, 1,
-1.75634, -0.519655, -3.254475, 1, 0.2588235, 0, 1,
-1.752009, -0.5839111, 0.7485681, 1, 0.2627451, 0, 1,
-1.742247, -0.799709, -1.820189, 1, 0.2705882, 0, 1,
-1.738828, -1.360357, -3.313431, 1, 0.2745098, 0, 1,
-1.733928, 0.3753679, -0.4649531, 1, 0.282353, 0, 1,
-1.726834, 0.14998, -1.019049, 1, 0.2862745, 0, 1,
-1.686114, 2.121032, -0.9994922, 1, 0.2941177, 0, 1,
-1.680443, 0.9055226, -0.0604024, 1, 0.3019608, 0, 1,
-1.677177, -0.4100925, -1.336597, 1, 0.3058824, 0, 1,
-1.667884, 1.184465, -2.150082, 1, 0.3137255, 0, 1,
-1.667854, -0.5016155, -2.863354, 1, 0.3176471, 0, 1,
-1.66519, 0.7952296, -3.317566, 1, 0.3254902, 0, 1,
-1.649997, 0.3295433, -1.917782, 1, 0.3294118, 0, 1,
-1.642267, -0.01891562, -1.904803, 1, 0.3372549, 0, 1,
-1.641068, 0.7108659, 0.7478008, 1, 0.3411765, 0, 1,
-1.63479, 0.1988498, -1.989594, 1, 0.3490196, 0, 1,
-1.623051, 0.5940963, -1.903605, 1, 0.3529412, 0, 1,
-1.611452, 0.7287737, -0.4926901, 1, 0.3607843, 0, 1,
-1.579901, -1.398586, -2.720495, 1, 0.3647059, 0, 1,
-1.579247, -0.03717942, -0.4478308, 1, 0.372549, 0, 1,
-1.563974, 0.8727652, -1.792563, 1, 0.3764706, 0, 1,
-1.554904, -1.469253, -2.767643, 1, 0.3843137, 0, 1,
-1.547426, 0.5801432, 0.6765029, 1, 0.3882353, 0, 1,
-1.533896, -0.5346394, 0.7838963, 1, 0.3960784, 0, 1,
-1.512769, -1.439162, -2.605014, 1, 0.4039216, 0, 1,
-1.509611, 2.456321, 0.9254615, 1, 0.4078431, 0, 1,
-1.508829, 2.372934, -2.230502, 1, 0.4156863, 0, 1,
-1.507447, -0.2548948, -3.286082, 1, 0.4196078, 0, 1,
-1.50593, -1.477947, -3.211091, 1, 0.427451, 0, 1,
-1.493659, -1.211915, -2.1128, 1, 0.4313726, 0, 1,
-1.482728, -0.6280639, -1.768993, 1, 0.4392157, 0, 1,
-1.482249, 1.149402, -1.207167, 1, 0.4431373, 0, 1,
-1.482167, 1.192476, -3.052931, 1, 0.4509804, 0, 1,
-1.480257, 0.2607352, -2.080631, 1, 0.454902, 0, 1,
-1.477122, 1.941228, -0.8136605, 1, 0.4627451, 0, 1,
-1.468794, -0.2829761, -1.91321, 1, 0.4666667, 0, 1,
-1.466027, -0.003263528, -2.406875, 1, 0.4745098, 0, 1,
-1.463585, -0.08825166, -1.061701, 1, 0.4784314, 0, 1,
-1.45779, 1.781123, -1.967865, 1, 0.4862745, 0, 1,
-1.443032, 0.1675541, -3.334645, 1, 0.4901961, 0, 1,
-1.440344, 0.4246754, -1.422839, 1, 0.4980392, 0, 1,
-1.43652, -0.9722911, -0.5920753, 1, 0.5058824, 0, 1,
-1.423882, 0.7049481, -0.3904046, 1, 0.509804, 0, 1,
-1.414115, 2.925973, -1.063027, 1, 0.5176471, 0, 1,
-1.401825, -0.1547042, -1.439784, 1, 0.5215687, 0, 1,
-1.401248, 3.468195, 1.828036, 1, 0.5294118, 0, 1,
-1.385613, -0.5340633, -1.157329, 1, 0.5333334, 0, 1,
-1.383624, -0.7077681, -2.643503, 1, 0.5411765, 0, 1,
-1.379619, 0.2852163, -3.201811, 1, 0.5450981, 0, 1,
-1.375963, 0.4332672, -1.254704, 1, 0.5529412, 0, 1,
-1.351765, -0.3365504, -3.364072, 1, 0.5568628, 0, 1,
-1.345993, 0.4963595, -1.794371, 1, 0.5647059, 0, 1,
-1.343916, 0.9289364, -1.568778, 1, 0.5686275, 0, 1,
-1.343674, -0.5747433, -2.029506, 1, 0.5764706, 0, 1,
-1.342931, 1.279491, 0.8935491, 1, 0.5803922, 0, 1,
-1.334902, 0.06015749, -1.154346, 1, 0.5882353, 0, 1,
-1.325917, -0.1043879, -0.1557062, 1, 0.5921569, 0, 1,
-1.320766, -1.115106, -2.671144, 1, 0.6, 0, 1,
-1.318824, -1.097291, 0.6208183, 1, 0.6078432, 0, 1,
-1.307031, -1.09079, -1.200492, 1, 0.6117647, 0, 1,
-1.306628, -0.3837319, -2.454434, 1, 0.6196079, 0, 1,
-1.305472, -0.7104394, -2.591044, 1, 0.6235294, 0, 1,
-1.30519, 2.507016, 0.210629, 1, 0.6313726, 0, 1,
-1.295682, -1.372812, -1.454886, 1, 0.6352941, 0, 1,
-1.283108, 0.5858883, -1.941328, 1, 0.6431373, 0, 1,
-1.282907, -0.6705211, -2.770438, 1, 0.6470588, 0, 1,
-1.280044, -0.08976543, -1.135521, 1, 0.654902, 0, 1,
-1.273107, -0.3856301, -1.169526, 1, 0.6588235, 0, 1,
-1.271326, -0.107849, -1.589626, 1, 0.6666667, 0, 1,
-1.27011, -1.381389, -1.511255, 1, 0.6705883, 0, 1,
-1.264468, -0.8060706, -3.688859, 1, 0.6784314, 0, 1,
-1.254379, 0.1680524, -0.3382517, 1, 0.682353, 0, 1,
-1.253613, -0.3581308, -2.246588, 1, 0.6901961, 0, 1,
-1.252523, -0.03573145, -0.6416888, 1, 0.6941177, 0, 1,
-1.234599, -0.8664175, -2.350804, 1, 0.7019608, 0, 1,
-1.227624, -1.128552, -2.183026, 1, 0.7098039, 0, 1,
-1.225126, 0.533855, -0.55558, 1, 0.7137255, 0, 1,
-1.220729, -0.7590508, -0.3784952, 1, 0.7215686, 0, 1,
-1.218338, 0.349575, -0.02190114, 1, 0.7254902, 0, 1,
-1.203119, 0.1060806, -1.219976, 1, 0.7333333, 0, 1,
-1.198569, -0.07261956, -0.1985991, 1, 0.7372549, 0, 1,
-1.197939, -0.8920457, -0.7351403, 1, 0.7450981, 0, 1,
-1.193637, 0.1063181, -2.043219, 1, 0.7490196, 0, 1,
-1.19221, -1.810914, -2.605611, 1, 0.7568628, 0, 1,
-1.176659, -0.3738382, -0.8490771, 1, 0.7607843, 0, 1,
-1.175453, -0.8198413, -3.301986, 1, 0.7686275, 0, 1,
-1.175075, -0.3044658, -2.027415, 1, 0.772549, 0, 1,
-1.172122, -1.95258, -1.348436, 1, 0.7803922, 0, 1,
-1.166964, -0.4781096, -1.547143, 1, 0.7843137, 0, 1,
-1.160828, 0.6476939, -2.530099, 1, 0.7921569, 0, 1,
-1.152827, 1.624548, -0.3393108, 1, 0.7960784, 0, 1,
-1.151519, 0.6764511, 0.7897821, 1, 0.8039216, 0, 1,
-1.135129, -0.7146273, -1.708592, 1, 0.8117647, 0, 1,
-1.13372, 0.9783469, 0.649708, 1, 0.8156863, 0, 1,
-1.126738, -0.6437423, -0.9352449, 1, 0.8235294, 0, 1,
-1.125479, 0.09200502, -1.946856, 1, 0.827451, 0, 1,
-1.125386, 0.1834018, -0.7146944, 1, 0.8352941, 0, 1,
-1.120737, 1.67693, 0.5766523, 1, 0.8392157, 0, 1,
-1.11407, -1.405459, -2.465228, 1, 0.8470588, 0, 1,
-1.112957, -0.2527072, -0.8718721, 1, 0.8509804, 0, 1,
-1.104915, -0.4828603, -1.647789, 1, 0.8588235, 0, 1,
-1.095959, 0.2364218, -2.942342, 1, 0.8627451, 0, 1,
-1.094756, -3.285474, -3.201182, 1, 0.8705882, 0, 1,
-1.086618, -0.2589058, -1.247196, 1, 0.8745098, 0, 1,
-1.082118, -0.8649064, -2.479687, 1, 0.8823529, 0, 1,
-1.070914, -0.008327571, -1.298139, 1, 0.8862745, 0, 1,
-1.050059, 0.1417746, -1.184835, 1, 0.8941177, 0, 1,
-1.040775, -1.016971, 0.1163253, 1, 0.8980392, 0, 1,
-1.039949, -0.06447718, -3.307504, 1, 0.9058824, 0, 1,
-1.038318, 0.03181706, -0.9402613, 1, 0.9137255, 0, 1,
-1.028541, -1.74299, -3.950802, 1, 0.9176471, 0, 1,
-1.022218, -1.370518, -1.435207, 1, 0.9254902, 0, 1,
-1.021418, 0.06026571, -3.310019, 1, 0.9294118, 0, 1,
-1.020705, 1.687466, 0.04511201, 1, 0.9372549, 0, 1,
-1.014612, -1.707587, -3.014728, 1, 0.9411765, 0, 1,
-1.013681, -0.1874167, -1.768382, 1, 0.9490196, 0, 1,
-1.013328, 0.3379552, -2.593247, 1, 0.9529412, 0, 1,
-1.012896, -0.461334, -1.042479, 1, 0.9607843, 0, 1,
-1.008828, -0.4512436, -2.624892, 1, 0.9647059, 0, 1,
-1.008135, 1.291479, -1.085951, 1, 0.972549, 0, 1,
-1.002211, -0.5675421, -0.9082221, 1, 0.9764706, 0, 1,
-1.00022, -0.8941682, -3.458074, 1, 0.9843137, 0, 1,
-0.9910899, -0.1976446, -2.597621, 1, 0.9882353, 0, 1,
-0.9865948, 1.021404, 0.924111, 1, 0.9960784, 0, 1,
-0.9722134, 0.2504417, -2.325786, 0.9960784, 1, 0, 1,
-0.972033, -1.886712, -3.14048, 0.9921569, 1, 0, 1,
-0.9701892, -1.682865, -3.888144, 0.9843137, 1, 0, 1,
-0.9693371, 2.681622, 0.116269, 0.9803922, 1, 0, 1,
-0.969196, 0.7025942, -1.893233, 0.972549, 1, 0, 1,
-0.9688184, -0.6678061, -2.158689, 0.9686275, 1, 0, 1,
-0.9675063, -1.323642, -3.906814, 0.9607843, 1, 0, 1,
-0.9630629, 0.8888806, -1.106449, 0.9568627, 1, 0, 1,
-0.9595586, -0.4340734, -1.960829, 0.9490196, 1, 0, 1,
-0.9537153, 0.142157, -1.454753, 0.945098, 1, 0, 1,
-0.9532611, -0.05256595, -2.117435, 0.9372549, 1, 0, 1,
-0.952473, -1.20583, -1.569501, 0.9333333, 1, 0, 1,
-0.9520577, -2.028241, -1.939047, 0.9254902, 1, 0, 1,
-0.9512582, 0.2416413, -2.760108, 0.9215686, 1, 0, 1,
-0.9484152, -0.0423643, -1.718655, 0.9137255, 1, 0, 1,
-0.9465116, -0.12214, -2.37168, 0.9098039, 1, 0, 1,
-0.9452314, -0.9480383, -3.079209, 0.9019608, 1, 0, 1,
-0.9417877, -0.0615349, -1.783077, 0.8941177, 1, 0, 1,
-0.9342539, 0.5214463, -2.635376, 0.8901961, 1, 0, 1,
-0.9333088, -0.1289894, -2.573552, 0.8823529, 1, 0, 1,
-0.9287338, -0.5108181, -4.194815, 0.8784314, 1, 0, 1,
-0.9194909, 2.127373, -2.60357, 0.8705882, 1, 0, 1,
-0.9189199, -1.997897, -3.111505, 0.8666667, 1, 0, 1,
-0.9166147, 2.297739, -1.507598, 0.8588235, 1, 0, 1,
-0.9164431, 0.8996612, -0.9743193, 0.854902, 1, 0, 1,
-0.9125018, 0.5325663, -1.808402, 0.8470588, 1, 0, 1,
-0.9106942, 1.09159, -1.244034, 0.8431373, 1, 0, 1,
-0.9096094, -0.4163973, -1.798437, 0.8352941, 1, 0, 1,
-0.9066719, -0.885527, -2.491156, 0.8313726, 1, 0, 1,
-0.8951266, 2.06566, -1.451646, 0.8235294, 1, 0, 1,
-0.8931467, 1.027742, -1.410641, 0.8196079, 1, 0, 1,
-0.8918192, -1.130213, -3.538975, 0.8117647, 1, 0, 1,
-0.8885683, -1.316488, -2.198911, 0.8078431, 1, 0, 1,
-0.887289, 0.3937548, -1.890507, 0.8, 1, 0, 1,
-0.8820021, 1.032873, -2.061434, 0.7921569, 1, 0, 1,
-0.8792117, 0.4623309, -2.452255, 0.7882353, 1, 0, 1,
-0.8785763, -0.8094548, -2.273902, 0.7803922, 1, 0, 1,
-0.8762378, 0.007493741, -1.826371, 0.7764706, 1, 0, 1,
-0.8723288, -1.653544, -4.495917, 0.7686275, 1, 0, 1,
-0.8717351, 0.3080456, -0.440031, 0.7647059, 1, 0, 1,
-0.8710166, -0.09166636, -2.009028, 0.7568628, 1, 0, 1,
-0.8649054, -1.60672, -3.432909, 0.7529412, 1, 0, 1,
-0.8617788, 2.118401, -0.6452458, 0.7450981, 1, 0, 1,
-0.8598866, 0.7184201, 0.5626186, 0.7411765, 1, 0, 1,
-0.8591175, 0.05230242, -3.510846, 0.7333333, 1, 0, 1,
-0.8570348, 1.777351, -0.9561436, 0.7294118, 1, 0, 1,
-0.8539721, 1.632749, -1.54984, 0.7215686, 1, 0, 1,
-0.8520444, -0.5717981, -1.588872, 0.7176471, 1, 0, 1,
-0.849093, -1.612386, -1.406328, 0.7098039, 1, 0, 1,
-0.8427589, 0.09903289, -2.72639, 0.7058824, 1, 0, 1,
-0.836006, 1.132731, -1.083329, 0.6980392, 1, 0, 1,
-0.8304551, 0.3386406, -1.236829, 0.6901961, 1, 0, 1,
-0.8265663, -0.2460964, -0.7655048, 0.6862745, 1, 0, 1,
-0.8260606, -1.051457, -4.285956, 0.6784314, 1, 0, 1,
-0.8249794, -0.3211104, -2.21717, 0.6745098, 1, 0, 1,
-0.8157815, -0.5592932, -1.113585, 0.6666667, 1, 0, 1,
-0.815617, 1.446135, 0.2947092, 0.6627451, 1, 0, 1,
-0.8132758, 0.02977502, -1.59942, 0.654902, 1, 0, 1,
-0.8131581, 0.8876454, 0.4827059, 0.6509804, 1, 0, 1,
-0.8112396, -0.003427976, 0.1824263, 0.6431373, 1, 0, 1,
-0.8043514, 0.0172325, -2.534778, 0.6392157, 1, 0, 1,
-0.8024802, 1.05484, -1.102758, 0.6313726, 1, 0, 1,
-0.8016611, -1.486317, -3.292681, 0.627451, 1, 0, 1,
-0.7952777, 0.08012267, -2.582602, 0.6196079, 1, 0, 1,
-0.7943625, 0.2946736, -1.731098, 0.6156863, 1, 0, 1,
-0.7927753, 1.512149, 0.2376344, 0.6078432, 1, 0, 1,
-0.7925724, -1.473983, -2.743513, 0.6039216, 1, 0, 1,
-0.7925236, -0.8920465, -2.034163, 0.5960785, 1, 0, 1,
-0.7859156, 1.268692, -2.184309, 0.5882353, 1, 0, 1,
-0.7853605, 0.2183548, -1.09055, 0.5843138, 1, 0, 1,
-0.7831141, -2.021689, -3.36289, 0.5764706, 1, 0, 1,
-0.781975, -1.677341, -2.393489, 0.572549, 1, 0, 1,
-0.7746693, -0.5312301, -2.546087, 0.5647059, 1, 0, 1,
-0.7745425, 2.48727, 0.8161168, 0.5607843, 1, 0, 1,
-0.7741061, -0.3740637, -0.9510901, 0.5529412, 1, 0, 1,
-0.7717116, -1.004516, -1.671781, 0.5490196, 1, 0, 1,
-0.7636883, -2.109148, -3.209179, 0.5411765, 1, 0, 1,
-0.7623429, -0.1209047, -1.347839, 0.5372549, 1, 0, 1,
-0.7621318, -1.238155, -4.07396, 0.5294118, 1, 0, 1,
-0.7587005, 1.518095, 1.004431, 0.5254902, 1, 0, 1,
-0.7582722, -0.3856753, -2.528698, 0.5176471, 1, 0, 1,
-0.7579194, -2.527921, -3.535253, 0.5137255, 1, 0, 1,
-0.7557768, -1.197195, -4.014041, 0.5058824, 1, 0, 1,
-0.7486574, 0.2015152, -2.29689, 0.5019608, 1, 0, 1,
-0.7480038, -1.265172, -1.90699, 0.4941176, 1, 0, 1,
-0.7417424, 0.1526577, -2.393792, 0.4862745, 1, 0, 1,
-0.7374154, 0.04253192, -1.125919, 0.4823529, 1, 0, 1,
-0.7320507, -0.8063501, -3.912601, 0.4745098, 1, 0, 1,
-0.7267239, -0.539109, -2.37827, 0.4705882, 1, 0, 1,
-0.7156814, 1.136904, -1.0199, 0.4627451, 1, 0, 1,
-0.7155342, -0.8516433, -2.665461, 0.4588235, 1, 0, 1,
-0.7146821, 0.233913, 0.02884706, 0.4509804, 1, 0, 1,
-0.6975412, 0.8451004, -0.139478, 0.4470588, 1, 0, 1,
-0.6971958, -1.048238, -1.988196, 0.4392157, 1, 0, 1,
-0.6954194, -0.8098781, -1.313047, 0.4352941, 1, 0, 1,
-0.6923674, -0.7185827, -2.424637, 0.427451, 1, 0, 1,
-0.6884698, 0.4861045, -1.513563, 0.4235294, 1, 0, 1,
-0.6828316, 0.7769772, -2.62159, 0.4156863, 1, 0, 1,
-0.6771588, -0.8016392, -2.70042, 0.4117647, 1, 0, 1,
-0.6745198, 0.1675283, 0.02453184, 0.4039216, 1, 0, 1,
-0.6707722, 0.5737844, -0.4875264, 0.3960784, 1, 0, 1,
-0.6680665, 0.7269328, -0.2565216, 0.3921569, 1, 0, 1,
-0.663646, 0.3934309, -0.9634567, 0.3843137, 1, 0, 1,
-0.6512291, 0.7298203, -1.723774, 0.3803922, 1, 0, 1,
-0.6456348, 1.625443, -1.277608, 0.372549, 1, 0, 1,
-0.6412132, 0.4717777, -1.290575, 0.3686275, 1, 0, 1,
-0.6405722, 0.8021942, -1.472955, 0.3607843, 1, 0, 1,
-0.6396608, -0.001073013, -1.771575, 0.3568628, 1, 0, 1,
-0.6347591, 2.319061, 0.6477062, 0.3490196, 1, 0, 1,
-0.6345512, -1.389853, -1.563191, 0.345098, 1, 0, 1,
-0.6337468, 0.4614027, -0.2486911, 0.3372549, 1, 0, 1,
-0.6301037, 1.507747, 2.292428, 0.3333333, 1, 0, 1,
-0.6293188, 0.1573341, -2.59752, 0.3254902, 1, 0, 1,
-0.6273693, 1.25995, -0.5793046, 0.3215686, 1, 0, 1,
-0.6267014, 0.3211532, -2.922638, 0.3137255, 1, 0, 1,
-0.6252685, 0.2691039, -2.102417, 0.3098039, 1, 0, 1,
-0.6233503, 0.5739418, -0.8241485, 0.3019608, 1, 0, 1,
-0.6216046, 0.5591709, -0.233126, 0.2941177, 1, 0, 1,
-0.6112519, -1.335028, -1.509109, 0.2901961, 1, 0, 1,
-0.610378, -0.7494379, -2.067088, 0.282353, 1, 0, 1,
-0.6094672, 1.096348, 0.03605434, 0.2784314, 1, 0, 1,
-0.6090513, -0.9069369, -3.582318, 0.2705882, 1, 0, 1,
-0.6038612, -2.006991, -3.662552, 0.2666667, 1, 0, 1,
-0.5990818, -0.2868986, -1.914594, 0.2588235, 1, 0, 1,
-0.596768, -0.2006003, -3.34772, 0.254902, 1, 0, 1,
-0.5961582, -0.5195283, -4.331736, 0.2470588, 1, 0, 1,
-0.5933756, 0.1297585, -1.934577, 0.2431373, 1, 0, 1,
-0.588994, -2.33258, -2.109868, 0.2352941, 1, 0, 1,
-0.5823191, -0.4041433, -2.334925, 0.2313726, 1, 0, 1,
-0.5783249, 0.01660158, -2.593675, 0.2235294, 1, 0, 1,
-0.5751256, -0.680571, -3.500627, 0.2196078, 1, 0, 1,
-0.5723521, -0.8312483, -2.732696, 0.2117647, 1, 0, 1,
-0.5643745, -0.0647098, -1.359483, 0.2078431, 1, 0, 1,
-0.5610983, 0.02141334, -1.053077, 0.2, 1, 0, 1,
-0.5606735, -0.1548605, 0.3693634, 0.1921569, 1, 0, 1,
-0.5552602, -0.8721247, -3.218252, 0.1882353, 1, 0, 1,
-0.5542782, -0.5589318, -2.854403, 0.1803922, 1, 0, 1,
-0.551762, 1.802995, -0.4872542, 0.1764706, 1, 0, 1,
-0.5492362, 0.6815211, -0.1302695, 0.1686275, 1, 0, 1,
-0.5482317, -1.704697, -3.698732, 0.1647059, 1, 0, 1,
-0.5476229, 0.2557091, -2.044525, 0.1568628, 1, 0, 1,
-0.5448839, -0.6357518, -3.450913, 0.1529412, 1, 0, 1,
-0.5443546, 0.4715258, -0.8136843, 0.145098, 1, 0, 1,
-0.5437329, 0.4375228, -1.574222, 0.1411765, 1, 0, 1,
-0.5428821, -0.5759611, -1.687135, 0.1333333, 1, 0, 1,
-0.5385004, 1.005388, -2.765182, 0.1294118, 1, 0, 1,
-0.5373763, -0.3452254, -2.790943, 0.1215686, 1, 0, 1,
-0.5329127, 0.5767137, -2.137055, 0.1176471, 1, 0, 1,
-0.5325822, 0.7733727, -1.68383, 0.1098039, 1, 0, 1,
-0.5288228, 1.519132, 0.953799, 0.1058824, 1, 0, 1,
-0.5248522, -0.7322544, -2.538391, 0.09803922, 1, 0, 1,
-0.5228228, -0.9433326, -3.113423, 0.09019608, 1, 0, 1,
-0.5181612, -0.4953319, -1.230524, 0.08627451, 1, 0, 1,
-0.5170348, -0.8993364, -3.571808, 0.07843138, 1, 0, 1,
-0.5156661, -0.3812013, -2.683176, 0.07450981, 1, 0, 1,
-0.5130499, -0.1992988, -1.955686, 0.06666667, 1, 0, 1,
-0.5123059, 1.049255, 0.6487347, 0.0627451, 1, 0, 1,
-0.5063769, 0.2291398, 0.4713352, 0.05490196, 1, 0, 1,
-0.5056719, -0.4839467, -1.633593, 0.05098039, 1, 0, 1,
-0.500419, -0.661503, -1.449711, 0.04313726, 1, 0, 1,
-0.4991006, 0.4239486, -0.1671249, 0.03921569, 1, 0, 1,
-0.4988571, 1.404409, -2.367379, 0.03137255, 1, 0, 1,
-0.4883039, -0.9595914, -2.050188, 0.02745098, 1, 0, 1,
-0.4864688, 0.2071398, -1.276592, 0.01960784, 1, 0, 1,
-0.4851733, -0.8151315, -1.898408, 0.01568628, 1, 0, 1,
-0.4848388, 0.01331884, -0.09002018, 0.007843138, 1, 0, 1,
-0.4808254, -0.1600597, -3.463814, 0.003921569, 1, 0, 1,
-0.479999, -1.437299, -3.03392, 0, 1, 0.003921569, 1,
-0.4764358, -0.6702152, -2.058316, 0, 1, 0.01176471, 1,
-0.4730149, 1.777416, -0.9644751, 0, 1, 0.01568628, 1,
-0.4724639, 0.6189156, -1.071788, 0, 1, 0.02352941, 1,
-0.4718617, 2.547445, 0.3054541, 0, 1, 0.02745098, 1,
-0.4620389, -1.529018, -2.497641, 0, 1, 0.03529412, 1,
-0.4608131, -1.326488, -3.68035, 0, 1, 0.03921569, 1,
-0.4596911, 0.3499507, -1.021094, 0, 1, 0.04705882, 1,
-0.4574996, -0.7484477, -2.661674, 0, 1, 0.05098039, 1,
-0.4570991, 0.7423021, -0.02139043, 0, 1, 0.05882353, 1,
-0.4553247, 0.2295852, 1.572003, 0, 1, 0.0627451, 1,
-0.4542922, 0.295857, -1.395061, 0, 1, 0.07058824, 1,
-0.4542806, 0.7043425, -0.317417, 0, 1, 0.07450981, 1,
-0.4522075, -1.3082, -2.41593, 0, 1, 0.08235294, 1,
-0.4494054, -0.3828643, -3.518031, 0, 1, 0.08627451, 1,
-0.4471881, -1.640337, -2.64963, 0, 1, 0.09411765, 1,
-0.4383923, 0.3514279, -0.1165628, 0, 1, 0.1019608, 1,
-0.4375731, -0.6252146, -3.221492, 0, 1, 0.1058824, 1,
-0.4343016, -0.0882062, -1.808777, 0, 1, 0.1137255, 1,
-0.4306616, -1.506094, -2.78099, 0, 1, 0.1176471, 1,
-0.4305238, -0.03823507, -1.646597, 0, 1, 0.1254902, 1,
-0.424922, 1.319052, -0.8953562, 0, 1, 0.1294118, 1,
-0.4175977, -1.72728, -2.573822, 0, 1, 0.1372549, 1,
-0.415624, -0.6085258, -3.269224, 0, 1, 0.1411765, 1,
-0.4152277, 0.0017876, -0.478546, 0, 1, 0.1490196, 1,
-0.411864, -0.9275441, -0.7069861, 0, 1, 0.1529412, 1,
-0.4116303, 0.5337759, -1.174826, 0, 1, 0.1607843, 1,
-0.4106053, -0.03182519, -1.85942, 0, 1, 0.1647059, 1,
-0.4101813, 1.804188, -0.5502951, 0, 1, 0.172549, 1,
-0.4087877, 1.307134, -0.7137905, 0, 1, 0.1764706, 1,
-0.4083954, 1.995364, 0.90578, 0, 1, 0.1843137, 1,
-0.4047185, -1.208252, -3.633385, 0, 1, 0.1882353, 1,
-0.4012622, -1.337745, -3.778592, 0, 1, 0.1960784, 1,
-0.4004119, -1.633059, -3.610896, 0, 1, 0.2039216, 1,
-0.3959269, -0.06567552, -2.859923, 0, 1, 0.2078431, 1,
-0.3947723, 2.263019, -0.3325493, 0, 1, 0.2156863, 1,
-0.3894813, -0.4299805, -3.160365, 0, 1, 0.2196078, 1,
-0.3854778, 0.3291263, -1.097831, 0, 1, 0.227451, 1,
-0.3852848, 0.2463705, -0.994969, 0, 1, 0.2313726, 1,
-0.3797329, 1.120301, 0.6152353, 0, 1, 0.2392157, 1,
-0.3758764, -0.31958, -0.916782, 0, 1, 0.2431373, 1,
-0.3729689, 0.5089161, -0.5780588, 0, 1, 0.2509804, 1,
-0.3701744, -0.4798352, -1.690898, 0, 1, 0.254902, 1,
-0.3694387, -0.9224216, -2.314899, 0, 1, 0.2627451, 1,
-0.3653424, 1.334402, -0.6885837, 0, 1, 0.2666667, 1,
-0.3650876, -0.3888638, -1.697746, 0, 1, 0.2745098, 1,
-0.3626233, 1.539359, 0.186892, 0, 1, 0.2784314, 1,
-0.357322, -1.461848, -2.269089, 0, 1, 0.2862745, 1,
-0.3557706, -0.7631543, -2.657109, 0, 1, 0.2901961, 1,
-0.3524297, -1.219316, -3.838039, 0, 1, 0.2980392, 1,
-0.3457547, 0.004425613, 0.1967838, 0, 1, 0.3058824, 1,
-0.3438797, -0.4947396, -3.279923, 0, 1, 0.3098039, 1,
-0.343674, 1.233014, -1.483845, 0, 1, 0.3176471, 1,
-0.3394093, 0.6084679, 0.1737327, 0, 1, 0.3215686, 1,
-0.3392547, -1.993768, -4.669376, 0, 1, 0.3294118, 1,
-0.3387062, 0.5357869, 1.168296, 0, 1, 0.3333333, 1,
-0.3351569, 0.6699012, 0.2200836, 0, 1, 0.3411765, 1,
-0.3330321, -1.08708, -2.212677, 0, 1, 0.345098, 1,
-0.3327073, 1.646399, 0.08053932, 0, 1, 0.3529412, 1,
-0.3307801, 0.09899363, -1.146386, 0, 1, 0.3568628, 1,
-0.3290851, 1.720052, -0.9531935, 0, 1, 0.3647059, 1,
-0.3256339, 1.137152, 0.4395751, 0, 1, 0.3686275, 1,
-0.3241298, 1.027646, -0.5569195, 0, 1, 0.3764706, 1,
-0.324124, 0.542985, -0.9972467, 0, 1, 0.3803922, 1,
-0.3228146, 1.72157, -1.122228, 0, 1, 0.3882353, 1,
-0.3180033, 1.205437, -0.4659143, 0, 1, 0.3921569, 1,
-0.3170122, -0.2467171, -0.1299593, 0, 1, 0.4, 1,
-0.3127434, -0.7442375, -2.325775, 0, 1, 0.4078431, 1,
-0.3058443, -0.4635372, -3.593182, 0, 1, 0.4117647, 1,
-0.3048429, 0.1182748, -0.4351603, 0, 1, 0.4196078, 1,
-0.2976113, 0.9180591, -2.286702, 0, 1, 0.4235294, 1,
-0.2897139, -0.6116523, -3.380138, 0, 1, 0.4313726, 1,
-0.2887099, 1.376716, 0.2174629, 0, 1, 0.4352941, 1,
-0.2841792, -0.5116345, -3.138322, 0, 1, 0.4431373, 1,
-0.2826564, 1.008696, -0.0813519, 0, 1, 0.4470588, 1,
-0.2790048, -0.04655672, -1.930645, 0, 1, 0.454902, 1,
-0.2781851, -1.540027, -4.017045, 0, 1, 0.4588235, 1,
-0.2773549, 0.6570561, -0.9583694, 0, 1, 0.4666667, 1,
-0.2725291, 0.3262518, -1.981899, 0, 1, 0.4705882, 1,
-0.2699381, -0.9317341, -3.034428, 0, 1, 0.4784314, 1,
-0.2674157, -0.5512968, -3.363358, 0, 1, 0.4823529, 1,
-0.2646898, 0.3399647, -1.02334, 0, 1, 0.4901961, 1,
-0.2594264, 0.4072744, 0.9553568, 0, 1, 0.4941176, 1,
-0.2580658, 0.676745, 1.058939, 0, 1, 0.5019608, 1,
-0.2548605, -0.07166806, -2.600465, 0, 1, 0.509804, 1,
-0.246687, 0.8876665, -0.506866, 0, 1, 0.5137255, 1,
-0.2454551, 1.05829, -0.366844, 0, 1, 0.5215687, 1,
-0.2407065, -0.4570666, -3.881857, 0, 1, 0.5254902, 1,
-0.2348929, -0.5015715, -3.750298, 0, 1, 0.5333334, 1,
-0.2335719, 0.8556666, 0.08367395, 0, 1, 0.5372549, 1,
-0.2184924, 0.5249693, 0.6331074, 0, 1, 0.5450981, 1,
-0.2178056, -0.5152342, -1.621584, 0, 1, 0.5490196, 1,
-0.2143582, -0.2444769, -2.76149, 0, 1, 0.5568628, 1,
-0.2130855, 2.463236, -0.6112719, 0, 1, 0.5607843, 1,
-0.2105769, 0.1284288, 0.1286716, 0, 1, 0.5686275, 1,
-0.2091099, 0.4890187, -0.9990994, 0, 1, 0.572549, 1,
-0.207561, -0.6800353, -2.463619, 0, 1, 0.5803922, 1,
-0.2073772, 0.5182688, 0.2621968, 0, 1, 0.5843138, 1,
-0.2073214, 1.017062, -1.297216, 0, 1, 0.5921569, 1,
-0.2023769, 1.20792, 0.05468299, 0, 1, 0.5960785, 1,
-0.1999866, -0.8566236, -1.187695, 0, 1, 0.6039216, 1,
-0.1998484, -1.836957, -3.846562, 0, 1, 0.6117647, 1,
-0.1947041, -1.552565, -4.318624, 0, 1, 0.6156863, 1,
-0.1944287, -0.7147664, -2.73279, 0, 1, 0.6235294, 1,
-0.1929558, -0.3587621, -3.783734, 0, 1, 0.627451, 1,
-0.1917161, -1.671181, -3.781474, 0, 1, 0.6352941, 1,
-0.189476, -1.191736, -4.562877, 0, 1, 0.6392157, 1,
-0.189253, -1.035519, -6.461616, 0, 1, 0.6470588, 1,
-0.1882233, 0.5579359, 1.780091, 0, 1, 0.6509804, 1,
-0.1865287, 0.4892161, 1.284704, 0, 1, 0.6588235, 1,
-0.1854642, -0.8291208, -2.612777, 0, 1, 0.6627451, 1,
-0.1852514, 1.740424, 0.614688, 0, 1, 0.6705883, 1,
-0.181035, -0.08212892, -1.984398, 0, 1, 0.6745098, 1,
-0.1788269, 1.023557, 0.3524882, 0, 1, 0.682353, 1,
-0.1769165, -1.96721, -3.753386, 0, 1, 0.6862745, 1,
-0.176349, 1.133149, 0.4542137, 0, 1, 0.6941177, 1,
-0.175977, 1.086873, -0.8307421, 0, 1, 0.7019608, 1,
-0.1740219, 0.1155165, -1.415287, 0, 1, 0.7058824, 1,
-0.1734359, 1.138644, 0.7209535, 0, 1, 0.7137255, 1,
-0.1721307, 0.9583467, -0.4246713, 0, 1, 0.7176471, 1,
-0.1689129, -0.2841418, -3.600194, 0, 1, 0.7254902, 1,
-0.1660677, -0.3320287, -1.048571, 0, 1, 0.7294118, 1,
-0.1616285, 1.230589, -1.952702, 0, 1, 0.7372549, 1,
-0.1583187, 0.9538022, 0.2518451, 0, 1, 0.7411765, 1,
-0.1550607, 1.080136, -1.392862, 0, 1, 0.7490196, 1,
-0.1507023, -0.04229392, -3.054322, 0, 1, 0.7529412, 1,
-0.1465678, 0.5754246, -1.32978, 0, 1, 0.7607843, 1,
-0.1459757, -1.303441, -4.125592, 0, 1, 0.7647059, 1,
-0.1452521, -2.067208, -0.5838066, 0, 1, 0.772549, 1,
-0.1432061, -1.582833, -3.442173, 0, 1, 0.7764706, 1,
-0.1365683, -0.4402278, -3.674431, 0, 1, 0.7843137, 1,
-0.136563, 0.668996, 0.5360361, 0, 1, 0.7882353, 1,
-0.1311067, -0.9937323, -2.593898, 0, 1, 0.7960784, 1,
-0.1296519, -1.560925, -3.353166, 0, 1, 0.8039216, 1,
-0.1226999, 1.440129, 1.244921, 0, 1, 0.8078431, 1,
-0.1223831, -0.4359286, -3.889817, 0, 1, 0.8156863, 1,
-0.1194825, -0.8204015, -2.574188, 0, 1, 0.8196079, 1,
-0.1178455, -0.6222498, -3.536887, 0, 1, 0.827451, 1,
-0.1128592, 0.3002103, 0.1726277, 0, 1, 0.8313726, 1,
-0.1078173, -0.2953949, -2.826626, 0, 1, 0.8392157, 1,
-0.1070944, 0.03611844, -1.489907, 0, 1, 0.8431373, 1,
-0.1045207, 0.09586823, 0.958733, 0, 1, 0.8509804, 1,
-0.1024767, -0.7464134, -2.907949, 0, 1, 0.854902, 1,
-0.10071, -0.1167584, -1.913321, 0, 1, 0.8627451, 1,
-0.09706599, -1.491634, -4.490129, 0, 1, 0.8666667, 1,
-0.09601298, -0.5146052, -2.8232, 0, 1, 0.8745098, 1,
-0.0949888, -0.9914595, -3.10114, 0, 1, 0.8784314, 1,
-0.09329942, -0.4941859, -2.937526, 0, 1, 0.8862745, 1,
-0.08715476, -1.111733, -2.067269, 0, 1, 0.8901961, 1,
-0.085991, -1.04, -3.590389, 0, 1, 0.8980392, 1,
-0.08298544, -0.5208785, -1.33636, 0, 1, 0.9058824, 1,
-0.07893437, -0.8245722, -2.359313, 0, 1, 0.9098039, 1,
-0.07802314, -0.8410382, -3.09306, 0, 1, 0.9176471, 1,
-0.07445154, -1.825136, -2.692898, 0, 1, 0.9215686, 1,
-0.07345816, -3.313525, -2.185779, 0, 1, 0.9294118, 1,
-0.07171661, 0.6298861, -0.4351594, 0, 1, 0.9333333, 1,
-0.07061486, -0.7828724, -0.5253642, 0, 1, 0.9411765, 1,
-0.06501802, 1.144925, -0.2474334, 0, 1, 0.945098, 1,
-0.06347419, -0.9912567, -2.158515, 0, 1, 0.9529412, 1,
-0.06203622, -0.3974342, -6.746324, 0, 1, 0.9568627, 1,
-0.06131225, -1.192659, -2.918151, 0, 1, 0.9647059, 1,
-0.06047038, 0.9299874, -0.2354132, 0, 1, 0.9686275, 1,
-0.05469708, 0.1394799, -1.986313, 0, 1, 0.9764706, 1,
-0.05411458, -0.2118699, -2.689658, 0, 1, 0.9803922, 1,
-0.05162312, 0.9114726, -0.427662, 0, 1, 0.9882353, 1,
-0.05151542, 0.7013915, 0.05796838, 0, 1, 0.9921569, 1,
-0.0510217, 0.4923564, -0.2439551, 0, 1, 1, 1,
-0.05057053, 0.003960319, -3.371501, 0, 0.9921569, 1, 1,
-0.05042889, -1.11515, -0.8449754, 0, 0.9882353, 1, 1,
-0.04760098, -1.490027, -4.890706, 0, 0.9803922, 1, 1,
-0.04507137, 0.5585335, 0.1025906, 0, 0.9764706, 1, 1,
-0.04293632, 1.548985, 0.9583258, 0, 0.9686275, 1, 1,
-0.04225704, -2.68564, -2.930035, 0, 0.9647059, 1, 1,
-0.03948228, 0.7705075, -0.2330527, 0, 0.9568627, 1, 1,
-0.036617, -1.800373, -2.435111, 0, 0.9529412, 1, 1,
-0.03455472, 0.8168246, -0.8611579, 0, 0.945098, 1, 1,
-0.03031348, 0.8419865, 0.8349816, 0, 0.9411765, 1, 1,
-0.02798971, -0.2460391, -3.942245, 0, 0.9333333, 1, 1,
-0.02623114, 0.936528, 0.1482524, 0, 0.9294118, 1, 1,
-0.02578815, 0.5162311, 0.9007774, 0, 0.9215686, 1, 1,
-0.02396315, 1.649276, -1.336453, 0, 0.9176471, 1, 1,
-0.02171766, 2.666106, -1.501346, 0, 0.9098039, 1, 1,
-0.01424435, 0.6161432, -0.1111561, 0, 0.9058824, 1, 1,
-0.01346111, -2.015933, -2.8386, 0, 0.8980392, 1, 1,
-0.008534519, -0.5842821, -4.496571, 0, 0.8901961, 1, 1,
-0.003620516, -0.4999469, -2.896085, 0, 0.8862745, 1, 1,
-0.003492796, -1.203226, -3.243231, 0, 0.8784314, 1, 1,
-0.001408128, 0.485074, -1.33294, 0, 0.8745098, 1, 1,
0.003039195, 0.1845349, 0.8897501, 0, 0.8666667, 1, 1,
0.004822723, -1.032554, 2.076601, 0, 0.8627451, 1, 1,
0.005591681, -0.4636029, 1.990984, 0, 0.854902, 1, 1,
0.008562039, 1.182416, -0.3494014, 0, 0.8509804, 1, 1,
0.01151387, 1.313723, 0.4167054, 0, 0.8431373, 1, 1,
0.01425698, -1.018543, 4.54941, 0, 0.8392157, 1, 1,
0.01703153, -0.9565259, 2.866897, 0, 0.8313726, 1, 1,
0.0184163, 0.2864512, 0.4330064, 0, 0.827451, 1, 1,
0.01862982, 0.4738477, 1.090953, 0, 0.8196079, 1, 1,
0.01904605, -0.6850428, 2.93748, 0, 0.8156863, 1, 1,
0.02039263, -0.3678661, 1.635936, 0, 0.8078431, 1, 1,
0.02361423, -0.3592965, 2.552409, 0, 0.8039216, 1, 1,
0.023985, -0.9258537, 1.627339, 0, 0.7960784, 1, 1,
0.02854812, 0.1549816, -1.077871, 0, 0.7882353, 1, 1,
0.03077017, -0.8176031, 1.704625, 0, 0.7843137, 1, 1,
0.03201289, 0.05432819, -1.226961, 0, 0.7764706, 1, 1,
0.03975856, 0.1237551, 0.2322921, 0, 0.772549, 1, 1,
0.04189926, 0.46457, -1.973792, 0, 0.7647059, 1, 1,
0.0438243, -1.529999, 4.541771, 0, 0.7607843, 1, 1,
0.04390963, 0.2126085, 0.25612, 0, 0.7529412, 1, 1,
0.05311652, 1.395722, -0.45409, 0, 0.7490196, 1, 1,
0.05676468, 1.49111, 1.799039, 0, 0.7411765, 1, 1,
0.05779557, 0.01279887, 0.9034752, 0, 0.7372549, 1, 1,
0.0599203, 1.419138, -1.543207, 0, 0.7294118, 1, 1,
0.06226732, 1.44504, 0.5750344, 0, 0.7254902, 1, 1,
0.06602363, 0.9138433, 1.571911, 0, 0.7176471, 1, 1,
0.07383814, 0.1310946, 0.3901714, 0, 0.7137255, 1, 1,
0.07747883, 0.08223937, 2.88302, 0, 0.7058824, 1, 1,
0.07926652, -0.849333, 4.005437, 0, 0.6980392, 1, 1,
0.08477376, 0.4182801, -0.3734871, 0, 0.6941177, 1, 1,
0.08595438, 0.259188, -0.7963127, 0, 0.6862745, 1, 1,
0.08736695, -0.9079189, 3.592732, 0, 0.682353, 1, 1,
0.09364318, 0.04542878, 0.0082388, 0, 0.6745098, 1, 1,
0.09370001, 0.8282713, -0.08914623, 0, 0.6705883, 1, 1,
0.09476597, 0.08612488, 0.8533518, 0, 0.6627451, 1, 1,
0.09905722, 0.6947921, 2.119331, 0, 0.6588235, 1, 1,
0.09959593, 0.9460934, -0.7680532, 0, 0.6509804, 1, 1,
0.09995721, 0.4160211, -0.2152507, 0, 0.6470588, 1, 1,
0.1008473, -0.09695505, 1.126784, 0, 0.6392157, 1, 1,
0.1040487, 2.458565, 0.483967, 0, 0.6352941, 1, 1,
0.119701, -1.855351, 3.047369, 0, 0.627451, 1, 1,
0.1219715, -0.02889639, 1.414003, 0, 0.6235294, 1, 1,
0.1237763, -0.4632176, 1.591238, 0, 0.6156863, 1, 1,
0.1360762, 0.3650698, 0.3732875, 0, 0.6117647, 1, 1,
0.138578, -0.4268321, 2.55922, 0, 0.6039216, 1, 1,
0.1413857, 1.318216, 1.222644, 0, 0.5960785, 1, 1,
0.1430354, -0.02588902, 3.055041, 0, 0.5921569, 1, 1,
0.1443937, -0.3020649, 2.437127, 0, 0.5843138, 1, 1,
0.1445618, -0.7406741, 5.953206, 0, 0.5803922, 1, 1,
0.1447635, -0.6748143, 3.978016, 0, 0.572549, 1, 1,
0.1457487, -0.7772501, 4.7343, 0, 0.5686275, 1, 1,
0.155897, 1.016775, -0.1393275, 0, 0.5607843, 1, 1,
0.1563816, -1.50634, 4.129473, 0, 0.5568628, 1, 1,
0.1578275, 2.764364, -0.9513476, 0, 0.5490196, 1, 1,
0.1595035, 0.9014078, 1.071602, 0, 0.5450981, 1, 1,
0.1612335, -0.4500425, 3.226467, 0, 0.5372549, 1, 1,
0.1628842, -0.1952602, 0.7189246, 0, 0.5333334, 1, 1,
0.1660095, 0.2636474, -0.6009927, 0, 0.5254902, 1, 1,
0.1671466, 0.2258511, 1.653214, 0, 0.5215687, 1, 1,
0.169286, 0.05715118, 0.3567076, 0, 0.5137255, 1, 1,
0.1694463, 1.566888, -1.119376, 0, 0.509804, 1, 1,
0.1714915, -0.7331604, 0.9535783, 0, 0.5019608, 1, 1,
0.1741157, -0.6809831, 2.225836, 0, 0.4941176, 1, 1,
0.1752531, -1.738052, 2.639393, 0, 0.4901961, 1, 1,
0.1756431, 0.6464537, 2.03365, 0, 0.4823529, 1, 1,
0.1809437, 1.002728, 0.7298981, 0, 0.4784314, 1, 1,
0.1839643, 0.2669432, 0.5148667, 0, 0.4705882, 1, 1,
0.1859482, 2.008939, 0.5592966, 0, 0.4666667, 1, 1,
0.1983868, 0.2074059, 1.353636, 0, 0.4588235, 1, 1,
0.1991808, -1.859449, 3.465267, 0, 0.454902, 1, 1,
0.2026093, 0.7693326, -1.319039, 0, 0.4470588, 1, 1,
0.2038014, -1.607693, 1.734569, 0, 0.4431373, 1, 1,
0.2058968, 0.9517322, 0.02172537, 0, 0.4352941, 1, 1,
0.2060602, -0.9773253, 2.87935, 0, 0.4313726, 1, 1,
0.2074371, -1.345881, 4.616334, 0, 0.4235294, 1, 1,
0.2077031, 1.288415, -0.627281, 0, 0.4196078, 1, 1,
0.2089368, -0.3789543, 3.276699, 0, 0.4117647, 1, 1,
0.2140013, -0.2595191, 3.378675, 0, 0.4078431, 1, 1,
0.2194133, -2.317423, 4.003418, 0, 0.4, 1, 1,
0.2205624, 1.641896, 0.8722506, 0, 0.3921569, 1, 1,
0.2212086, -0.1152596, 2.276867, 0, 0.3882353, 1, 1,
0.2223774, 0.6216803, -0.244786, 0, 0.3803922, 1, 1,
0.2225558, 1.595424, -0.7203034, 0, 0.3764706, 1, 1,
0.2237785, 0.1947067, 0.9159912, 0, 0.3686275, 1, 1,
0.225886, 1.513971, -0.7265252, 0, 0.3647059, 1, 1,
0.2271291, 0.1216023, 0.5735227, 0, 0.3568628, 1, 1,
0.2304958, 0.2184011, 1.049687, 0, 0.3529412, 1, 1,
0.231225, -1.476526, 2.372704, 0, 0.345098, 1, 1,
0.2339446, 0.9981253, 0.09999398, 0, 0.3411765, 1, 1,
0.2346189, 1.613272, -0.01807372, 0, 0.3333333, 1, 1,
0.2384194, -0.8656587, 3.972375, 0, 0.3294118, 1, 1,
0.2409348, 1.7203, 0.6159161, 0, 0.3215686, 1, 1,
0.2411491, -0.9026185, 2.845725, 0, 0.3176471, 1, 1,
0.2482293, 0.1005497, 1.438325, 0, 0.3098039, 1, 1,
0.2489878, 0.3102678, 1.911262, 0, 0.3058824, 1, 1,
0.2513168, -0.2283068, 2.870325, 0, 0.2980392, 1, 1,
0.2521002, 0.08528498, 1.364321, 0, 0.2901961, 1, 1,
0.2551414, 0.8018876, 0.6392993, 0, 0.2862745, 1, 1,
0.2609922, 0.5369418, -1.125805, 0, 0.2784314, 1, 1,
0.2637318, -1.173546, 3.750431, 0, 0.2745098, 1, 1,
0.2681719, 1.522899, -0.02419237, 0, 0.2666667, 1, 1,
0.2685409, 0.02627932, 3.289392, 0, 0.2627451, 1, 1,
0.2774482, -0.2234033, 4.546498, 0, 0.254902, 1, 1,
0.2788346, -0.9574499, 2.378024, 0, 0.2509804, 1, 1,
0.2792116, -1.603182, 2.039676, 0, 0.2431373, 1, 1,
0.2806491, -1.092408, 3.980832, 0, 0.2392157, 1, 1,
0.2820106, 0.1368762, 2.177351, 0, 0.2313726, 1, 1,
0.2835452, 0.872429, 1.609392, 0, 0.227451, 1, 1,
0.2859329, -0.1520016, 2.297176, 0, 0.2196078, 1, 1,
0.2860013, 1.585754, 0.3444679, 0, 0.2156863, 1, 1,
0.2919988, -0.2765341, 3.451301, 0, 0.2078431, 1, 1,
0.3015092, -1.735439, 4.031417, 0, 0.2039216, 1, 1,
0.3050162, 1.831749, 2.28715, 0, 0.1960784, 1, 1,
0.3060375, 0.8935232, 1.008269, 0, 0.1882353, 1, 1,
0.3085238, 0.5815209, 1.206654, 0, 0.1843137, 1, 1,
0.3096532, -0.2114087, 2.268068, 0, 0.1764706, 1, 1,
0.3099775, -0.02928815, 1.709671, 0, 0.172549, 1, 1,
0.3125863, -1.441565, 3.104048, 0, 0.1647059, 1, 1,
0.3144242, 2.472391, -0.6673003, 0, 0.1607843, 1, 1,
0.3145041, -0.9977521, 4.212416, 0, 0.1529412, 1, 1,
0.3172345, 0.3247439, 1.709855, 0, 0.1490196, 1, 1,
0.3193654, -1.116928, 2.634105, 0, 0.1411765, 1, 1,
0.3241457, 1.04783, -0.2315457, 0, 0.1372549, 1, 1,
0.3419545, -1.329063, 2.32489, 0, 0.1294118, 1, 1,
0.3494083, 0.07111164, 3.158037, 0, 0.1254902, 1, 1,
0.3507594, 1.017659, -0.840649, 0, 0.1176471, 1, 1,
0.353607, -0.09917444, 3.602032, 0, 0.1137255, 1, 1,
0.3544489, -1.336894, 5.827071, 0, 0.1058824, 1, 1,
0.356475, -0.3958679, 5.49102, 0, 0.09803922, 1, 1,
0.363901, 1.794777, 0.9069722, 0, 0.09411765, 1, 1,
0.365079, 0.9523267, -1.242932, 0, 0.08627451, 1, 1,
0.3662339, 0.03216162, 0.6329315, 0, 0.08235294, 1, 1,
0.3674499, -1.625511, 1.653286, 0, 0.07450981, 1, 1,
0.3701707, 1.580741, 0.4424879, 0, 0.07058824, 1, 1,
0.3720597, -0.9626253, 4.965543, 0, 0.0627451, 1, 1,
0.3756059, -1.773948, 4.571713, 0, 0.05882353, 1, 1,
0.3766277, 0.2098251, 1.583062, 0, 0.05098039, 1, 1,
0.3768599, 0.6389428, -1.740919, 0, 0.04705882, 1, 1,
0.3782013, -0.7437513, 1.324521, 0, 0.03921569, 1, 1,
0.3811439, 1.90563, 0.3100604, 0, 0.03529412, 1, 1,
0.383006, -0.5744234, 2.389757, 0, 0.02745098, 1, 1,
0.3848314, 0.06138489, 0.6743891, 0, 0.02352941, 1, 1,
0.3871942, -0.8333757, 3.024226, 0, 0.01568628, 1, 1,
0.396217, -0.2967781, 3.716102, 0, 0.01176471, 1, 1,
0.3974159, -0.6761496, 3.392986, 0, 0.003921569, 1, 1,
0.4016468, 2.151264, 1.996016, 0.003921569, 0, 1, 1,
0.4033575, -1.555679, 2.971173, 0.007843138, 0, 1, 1,
0.4047601, -0.1245624, 2.635339, 0.01568628, 0, 1, 1,
0.4074827, -0.8886194, 2.143839, 0.01960784, 0, 1, 1,
0.4083451, 0.7483476, -1.152025, 0.02745098, 0, 1, 1,
0.4108303, -0.3753715, 1.041694, 0.03137255, 0, 1, 1,
0.4201336, -0.7452404, 3.896234, 0.03921569, 0, 1, 1,
0.4209938, 3.186401, -0.4445012, 0.04313726, 0, 1, 1,
0.4260825, -1.507434, 3.725777, 0.05098039, 0, 1, 1,
0.431664, 0.8828272, 1.364087, 0.05490196, 0, 1, 1,
0.4318685, -0.1183471, 2.454025, 0.0627451, 0, 1, 1,
0.4323724, -1.469256, 2.602636, 0.06666667, 0, 1, 1,
0.4334136, -0.8013442, 2.54788, 0.07450981, 0, 1, 1,
0.4340488, 0.5310245, 2.98499, 0.07843138, 0, 1, 1,
0.4366001, -1.582657, 2.243219, 0.08627451, 0, 1, 1,
0.4367075, 0.1401794, 0.8714203, 0.09019608, 0, 1, 1,
0.4384778, -0.5363798, 1.345948, 0.09803922, 0, 1, 1,
0.4433845, 0.5784463, 0.1831056, 0.1058824, 0, 1, 1,
0.4439046, 0.1003736, 3.457753, 0.1098039, 0, 1, 1,
0.4457335, -0.02806127, 3.199926, 0.1176471, 0, 1, 1,
0.4477643, 1.952522, 0.1219116, 0.1215686, 0, 1, 1,
0.4568774, -0.4790336, 3.06114, 0.1294118, 0, 1, 1,
0.45811, 0.1190958, 1.621199, 0.1333333, 0, 1, 1,
0.4603267, -0.3235568, 2.268315, 0.1411765, 0, 1, 1,
0.464297, 0.2610267, 2.045751, 0.145098, 0, 1, 1,
0.4647314, 1.149913, 0.6384371, 0.1529412, 0, 1, 1,
0.4652102, 1.189275, 0.4163303, 0.1568628, 0, 1, 1,
0.4686113, 1.213411, 1.090569, 0.1647059, 0, 1, 1,
0.469424, -1.207395, 2.306268, 0.1686275, 0, 1, 1,
0.4710118, 0.7111652, 2.215259, 0.1764706, 0, 1, 1,
0.473285, -1.489778, 3.451175, 0.1803922, 0, 1, 1,
0.4775214, -1.528538, 1.184227, 0.1882353, 0, 1, 1,
0.4828697, -0.6068568, 2.574163, 0.1921569, 0, 1, 1,
0.4922292, 0.05584201, 1.509646, 0.2, 0, 1, 1,
0.4927758, 1.616331, 0.4238444, 0.2078431, 0, 1, 1,
0.4928978, -0.3919885, 3.253531, 0.2117647, 0, 1, 1,
0.5049982, -1.126943, 2.557847, 0.2196078, 0, 1, 1,
0.5110301, 2.789468, -0.4099093, 0.2235294, 0, 1, 1,
0.5166604, -0.9683556, 0.7758648, 0.2313726, 0, 1, 1,
0.521562, 1.96076, 0.6283131, 0.2352941, 0, 1, 1,
0.5234727, 0.5606306, 0.8449472, 0.2431373, 0, 1, 1,
0.5247489, 0.3326833, 1.746865, 0.2470588, 0, 1, 1,
0.5254605, -0.01355895, 1.221694, 0.254902, 0, 1, 1,
0.5291825, 0.7947964, 1.155259, 0.2588235, 0, 1, 1,
0.5335165, 1.710893, -0.8638197, 0.2666667, 0, 1, 1,
0.5404518, 1.420942, -0.380426, 0.2705882, 0, 1, 1,
0.5430757, 0.5724361, 1.235778, 0.2784314, 0, 1, 1,
0.5449077, -0.4286193, 1.304677, 0.282353, 0, 1, 1,
0.5510771, 0.6167282, 0.2162492, 0.2901961, 0, 1, 1,
0.5521168, 0.3904625, 0.866299, 0.2941177, 0, 1, 1,
0.5532154, 0.3222459, 1.388633, 0.3019608, 0, 1, 1,
0.5564403, -0.9221621, 2.648272, 0.3098039, 0, 1, 1,
0.5565383, 0.7147319, 1.40147, 0.3137255, 0, 1, 1,
0.5665185, -2.120726, 4.355048, 0.3215686, 0, 1, 1,
0.5713655, 1.006797, 1.904137, 0.3254902, 0, 1, 1,
0.5749173, -2.007292, 1.404362, 0.3333333, 0, 1, 1,
0.5749657, -0.6025749, 1.379812, 0.3372549, 0, 1, 1,
0.5779698, 1.027877, 0.9613279, 0.345098, 0, 1, 1,
0.5788484, 0.6699345, -0.02340489, 0.3490196, 0, 1, 1,
0.5792093, 0.1270625, -0.1883092, 0.3568628, 0, 1, 1,
0.5876752, -0.3986405, 2.888794, 0.3607843, 0, 1, 1,
0.590831, -1.432745, 2.581203, 0.3686275, 0, 1, 1,
0.5908819, 0.1295327, 2.441535, 0.372549, 0, 1, 1,
0.5914375, -0.8749226, 3.939925, 0.3803922, 0, 1, 1,
0.5920557, -0.1641426, 2.283015, 0.3843137, 0, 1, 1,
0.5969662, 1.243349, 1.873205, 0.3921569, 0, 1, 1,
0.5989856, -0.1589611, 0.2884029, 0.3960784, 0, 1, 1,
0.5993385, 0.6053955, -0.3988171, 0.4039216, 0, 1, 1,
0.6035883, -1.762793, 1.41667, 0.4117647, 0, 1, 1,
0.604216, -1.046922, 2.71549, 0.4156863, 0, 1, 1,
0.6071976, -0.5858676, 2.510012, 0.4235294, 0, 1, 1,
0.6094614, -1.274523, 1.324967, 0.427451, 0, 1, 1,
0.6099143, 1.764024, 1.0005, 0.4352941, 0, 1, 1,
0.6109633, -1.5932, 2.72453, 0.4392157, 0, 1, 1,
0.6163464, -0.268454, 1.593071, 0.4470588, 0, 1, 1,
0.6176031, 1.672731, -0.6677353, 0.4509804, 0, 1, 1,
0.6209588, -0.09556562, 1.604032, 0.4588235, 0, 1, 1,
0.6257516, 0.5141789, 1.110746, 0.4627451, 0, 1, 1,
0.6263247, -0.6047394, 0.7522449, 0.4705882, 0, 1, 1,
0.6271023, 0.002015699, 1.370829, 0.4745098, 0, 1, 1,
0.6304725, -2.148129, 3.483019, 0.4823529, 0, 1, 1,
0.633103, 0.9535906, 1.792054, 0.4862745, 0, 1, 1,
0.6410396, -0.1536149, 0.9860062, 0.4941176, 0, 1, 1,
0.6512009, -0.3514242, 2.525832, 0.5019608, 0, 1, 1,
0.6570304, -0.1803264, 2.367244, 0.5058824, 0, 1, 1,
0.6590476, -0.2465525, 0.5396944, 0.5137255, 0, 1, 1,
0.6598674, 1.504579, -1.01747, 0.5176471, 0, 1, 1,
0.6688371, -0.9199819, 3.660885, 0.5254902, 0, 1, 1,
0.6722693, 0.08228257, 0.4828714, 0.5294118, 0, 1, 1,
0.6735837, -0.07213096, 0.7057587, 0.5372549, 0, 1, 1,
0.6800643, 0.1579924, 0.6985, 0.5411765, 0, 1, 1,
0.6809531, 0.1724733, -0.3939408, 0.5490196, 0, 1, 1,
0.682371, -0.4389548, 2.466642, 0.5529412, 0, 1, 1,
0.6881747, -1.051077, 2.134823, 0.5607843, 0, 1, 1,
0.6885429, -0.5415314, 1.018874, 0.5647059, 0, 1, 1,
0.6915554, 0.7240061, 0.121667, 0.572549, 0, 1, 1,
0.7010015, -1.588112, 0.5068004, 0.5764706, 0, 1, 1,
0.7057743, -0.7492595, 2.387043, 0.5843138, 0, 1, 1,
0.705908, 0.7897733, 1.055655, 0.5882353, 0, 1, 1,
0.7076399, 0.5076358, 1.129627, 0.5960785, 0, 1, 1,
0.7129894, 0.1273722, 2.242128, 0.6039216, 0, 1, 1,
0.7136232, 0.02353786, 1.72957, 0.6078432, 0, 1, 1,
0.71433, -1.534622, 4.050989, 0.6156863, 0, 1, 1,
0.7221971, 0.1117555, -0.8813938, 0.6196079, 0, 1, 1,
0.7248294, 0.08117017, 1.866849, 0.627451, 0, 1, 1,
0.7281435, -0.673126, 3.250569, 0.6313726, 0, 1, 1,
0.7310369, -1.783343, 3.383073, 0.6392157, 0, 1, 1,
0.7326566, -0.3550643, 1.823063, 0.6431373, 0, 1, 1,
0.733727, -0.4649177, 0.7052656, 0.6509804, 0, 1, 1,
0.7345444, -0.4671107, 4.287354, 0.654902, 0, 1, 1,
0.7349502, 1.032246, -1.433312, 0.6627451, 0, 1, 1,
0.7351378, 0.1254743, 0.6378778, 0.6666667, 0, 1, 1,
0.7481684, 1.479408, 2.214161, 0.6745098, 0, 1, 1,
0.7488665, 1.055629, 0.8015351, 0.6784314, 0, 1, 1,
0.7492108, 0.5642092, 2.079861, 0.6862745, 0, 1, 1,
0.7555029, 1.372777, -0.03398456, 0.6901961, 0, 1, 1,
0.7559476, 0.4438337, 2.710501, 0.6980392, 0, 1, 1,
0.7594404, -1.139802, 2.102158, 0.7058824, 0, 1, 1,
0.76164, -0.5240504, 3.976852, 0.7098039, 0, 1, 1,
0.7620556, -0.1190195, 1.24417, 0.7176471, 0, 1, 1,
0.7637494, 1.334746, 0.5272123, 0.7215686, 0, 1, 1,
0.76518, -0.07183013, 0.9632831, 0.7294118, 0, 1, 1,
0.7653813, -1.176268, 3.038482, 0.7333333, 0, 1, 1,
0.7655015, 0.9048674, 1.478007, 0.7411765, 0, 1, 1,
0.7737105, 0.06926323, -1.498542, 0.7450981, 0, 1, 1,
0.7780924, 0.4923287, 0.786674, 0.7529412, 0, 1, 1,
0.7784865, -0.6948415, 0.825296, 0.7568628, 0, 1, 1,
0.7788002, -0.8290452, 1.436436, 0.7647059, 0, 1, 1,
0.7798704, 0.02255402, 1.155636, 0.7686275, 0, 1, 1,
0.7805163, 0.01703255, 2.652398, 0.7764706, 0, 1, 1,
0.7819483, 0.1086171, 2.849091, 0.7803922, 0, 1, 1,
0.8018711, -0.9472856, 1.426567, 0.7882353, 0, 1, 1,
0.8024989, 2.094343, 1.408841, 0.7921569, 0, 1, 1,
0.8126855, -0.4140546, 0.5512072, 0.8, 0, 1, 1,
0.8127319, 0.2937083, 1.888148, 0.8078431, 0, 1, 1,
0.8160211, -1.24759, 3.224122, 0.8117647, 0, 1, 1,
0.8170671, -0.6057365, 2.611753, 0.8196079, 0, 1, 1,
0.8241647, 0.9971504, 0.6060277, 0.8235294, 0, 1, 1,
0.826324, 1.117698, 1.780655, 0.8313726, 0, 1, 1,
0.8308867, -0.5732177, 3.488465, 0.8352941, 0, 1, 1,
0.8320414, 1.169578, 1.568879, 0.8431373, 0, 1, 1,
0.8324746, -0.3828242, 2.776517, 0.8470588, 0, 1, 1,
0.8373957, 0.7853181, 1.532786, 0.854902, 0, 1, 1,
0.8453806, -0.9983096, 1.870835, 0.8588235, 0, 1, 1,
0.8527948, 0.2067447, -0.8791973, 0.8666667, 0, 1, 1,
0.8533059, -0.9993232, 3.250342, 0.8705882, 0, 1, 1,
0.8589494, 1.964005, 0.1914985, 0.8784314, 0, 1, 1,
0.8633868, 1.126184, 1.863519, 0.8823529, 0, 1, 1,
0.8649325, 0.1880694, -0.3067091, 0.8901961, 0, 1, 1,
0.8669007, 0.957477, 2.727577, 0.8941177, 0, 1, 1,
0.8689685, -0.1436629, 0.6711905, 0.9019608, 0, 1, 1,
0.8758938, -0.0211902, 1.617446, 0.9098039, 0, 1, 1,
0.8817802, -0.2850684, 0.8569048, 0.9137255, 0, 1, 1,
0.8834634, -0.8191999, 3.060758, 0.9215686, 0, 1, 1,
0.8844641, -0.1447582, -0.09964683, 0.9254902, 0, 1, 1,
0.8848941, -0.7681382, 1.386424, 0.9333333, 0, 1, 1,
0.8958065, 0.1885736, 1.863273, 0.9372549, 0, 1, 1,
0.9066858, 0.02797176, 1.157892, 0.945098, 0, 1, 1,
0.90975, 0.4792524, 0.3737106, 0.9490196, 0, 1, 1,
0.9099938, -0.3913212, 1.475244, 0.9568627, 0, 1, 1,
0.9118832, 1.679969, 0.6357799, 0.9607843, 0, 1, 1,
0.9142624, 0.6101365, -0.7887385, 0.9686275, 0, 1, 1,
0.9143624, 0.4229074, 0.0918223, 0.972549, 0, 1, 1,
0.9150528, 0.3179964, 1.707522, 0.9803922, 0, 1, 1,
0.9165861, 0.1554216, 1.082696, 0.9843137, 0, 1, 1,
0.9169012, -0.00814395, -0.1479377, 0.9921569, 0, 1, 1,
0.9417384, 0.187206, 0.5233008, 0.9960784, 0, 1, 1,
0.9462255, -0.361285, 3.174117, 1, 0, 0.9960784, 1,
0.9465565, -1.009792, 1.717855, 1, 0, 0.9882353, 1,
0.9492134, -1.971099, 3.378973, 1, 0, 0.9843137, 1,
0.953977, -1.083915, 2.766016, 1, 0, 0.9764706, 1,
0.9544721, -0.4577469, 3.048651, 1, 0, 0.972549, 1,
0.9544936, 0.2554064, 0.4881309, 1, 0, 0.9647059, 1,
0.9557387, -0.2095445, 3.309311, 1, 0, 0.9607843, 1,
0.9770792, -0.7641785, 1.070193, 1, 0, 0.9529412, 1,
0.9818921, 0.2276902, -0.2188085, 1, 0, 0.9490196, 1,
0.9826372, -0.8298289, 3.251659, 1, 0, 0.9411765, 1,
0.9843996, -1.664603, 2.761413, 1, 0, 0.9372549, 1,
0.9979525, 1.119725, 1.26469, 1, 0, 0.9294118, 1,
1.000347, 0.2197351, 1.662121, 1, 0, 0.9254902, 1,
1.002171, -0.1990016, 0.9721677, 1, 0, 0.9176471, 1,
1.002326, -0.6832036, 2.968018, 1, 0, 0.9137255, 1,
1.008786, 0.02242721, 0.6403263, 1, 0, 0.9058824, 1,
1.010001, -1.774702, 2.656578, 1, 0, 0.9019608, 1,
1.013041, -1.836641, 2.538306, 1, 0, 0.8941177, 1,
1.014772, 0.4213991, 1.136374, 1, 0, 0.8862745, 1,
1.016679, 0.1530352, 1.416394, 1, 0, 0.8823529, 1,
1.022249, 0.9942973, 1.022735, 1, 0, 0.8745098, 1,
1.024367, -1.114886, 2.807977, 1, 0, 0.8705882, 1,
1.024675, 0.5534564, 1.506446, 1, 0, 0.8627451, 1,
1.025681, -0.5582807, 2.144343, 1, 0, 0.8588235, 1,
1.033542, 0.6642246, 1.839851, 1, 0, 0.8509804, 1,
1.043167, 0.5540296, 0.7039174, 1, 0, 0.8470588, 1,
1.047235, -1.378481, 2.870641, 1, 0, 0.8392157, 1,
1.053577, 0.00625292, 1.802293, 1, 0, 0.8352941, 1,
1.05592, -1.134989, 0.1613963, 1, 0, 0.827451, 1,
1.059197, -1.124694, 1.881639, 1, 0, 0.8235294, 1,
1.06541, -0.08525036, 0.3920911, 1, 0, 0.8156863, 1,
1.067642, -1.593678, 0.4024122, 1, 0, 0.8117647, 1,
1.069897, -0.1822751, 0.9435243, 1, 0, 0.8039216, 1,
1.073798, 0.2784263, 1.69475, 1, 0, 0.7960784, 1,
1.074549, 0.03165934, 2.05321, 1, 0, 0.7921569, 1,
1.076046, 1.290179, 1.611089, 1, 0, 0.7843137, 1,
1.085432, -0.6933547, 0.9262455, 1, 0, 0.7803922, 1,
1.094149, -1.569861, 0.3826644, 1, 0, 0.772549, 1,
1.094494, 0.8321799, 1.056729, 1, 0, 0.7686275, 1,
1.095472, 0.07521595, 0.8348114, 1, 0, 0.7607843, 1,
1.106575, -0.365676, 2.319908, 1, 0, 0.7568628, 1,
1.107234, -0.7503951, 0.2277097, 1, 0, 0.7490196, 1,
1.107963, -1.979357, 2.564193, 1, 0, 0.7450981, 1,
1.112811, 0.1694347, 1.230801, 1, 0, 0.7372549, 1,
1.121457, -0.372725, 1.894689, 1, 0, 0.7333333, 1,
1.127459, 0.3883548, 1.187949, 1, 0, 0.7254902, 1,
1.127492, -1.258569, 4.077129, 1, 0, 0.7215686, 1,
1.138358, 1.02151, 0.4987249, 1, 0, 0.7137255, 1,
1.144446, -1.289723, 1.155226, 1, 0, 0.7098039, 1,
1.157752, -1.165913, 2.601158, 1, 0, 0.7019608, 1,
1.158217, 2.523068, 1.067932, 1, 0, 0.6941177, 1,
1.167675, 1.391619, 1.006455, 1, 0, 0.6901961, 1,
1.169516, -0.041102, 2.27959, 1, 0, 0.682353, 1,
1.180025, -0.6914935, 2.823827, 1, 0, 0.6784314, 1,
1.183196, 0.4715129, -1.989065, 1, 0, 0.6705883, 1,
1.184447, -0.7365113, 2.510332, 1, 0, 0.6666667, 1,
1.191426, -0.1042376, 1.456755, 1, 0, 0.6588235, 1,
1.206303, 1.447116, 1.988152, 1, 0, 0.654902, 1,
1.218327, 1.632427, 1.190614, 1, 0, 0.6470588, 1,
1.218482, 0.1838777, 0.1833736, 1, 0, 0.6431373, 1,
1.223909, -1.796748, 1.730105, 1, 0, 0.6352941, 1,
1.228417, -0.33749, 1.102917, 1, 0, 0.6313726, 1,
1.229944, -0.831706, 2.237856, 1, 0, 0.6235294, 1,
1.237355, -1.175263, 2.306283, 1, 0, 0.6196079, 1,
1.269968, 1.521245, -0.2236861, 1, 0, 0.6117647, 1,
1.270305, 1.654419, 0.6503363, 1, 0, 0.6078432, 1,
1.271538, -0.0868568, 2.008646, 1, 0, 0.6, 1,
1.274115, 0.4370659, 0.4980433, 1, 0, 0.5921569, 1,
1.277268, 0.4228487, 1.234659, 1, 0, 0.5882353, 1,
1.281663, -0.09617212, 1.475275, 1, 0, 0.5803922, 1,
1.28769, -2.204282, 1.071523, 1, 0, 0.5764706, 1,
1.293044, -0.8266033, 2.455173, 1, 0, 0.5686275, 1,
1.298411, 0.4765099, 0.2263433, 1, 0, 0.5647059, 1,
1.324633, 1.141813, 1.862241, 1, 0, 0.5568628, 1,
1.327383, 1.519226, 1.742403, 1, 0, 0.5529412, 1,
1.331506, 0.3606935, 3.420714, 1, 0, 0.5450981, 1,
1.3433, 1.367969, 0.03796919, 1, 0, 0.5411765, 1,
1.350232, 0.03803548, 1.719553, 1, 0, 0.5333334, 1,
1.354208, -1.199802, 2.348597, 1, 0, 0.5294118, 1,
1.362579, 0.654512, 2.201142, 1, 0, 0.5215687, 1,
1.381566, 0.670593, -0.3313824, 1, 0, 0.5176471, 1,
1.389765, 0.2698793, 1.375277, 1, 0, 0.509804, 1,
1.39018, -1.706214, 3.139941, 1, 0, 0.5058824, 1,
1.391902, 1.09849, 0.7335286, 1, 0, 0.4980392, 1,
1.392755, -1.042818, 3.769689, 1, 0, 0.4901961, 1,
1.400223, -0.1739289, 1.473688, 1, 0, 0.4862745, 1,
1.404881, -1.168902, 1.883713, 1, 0, 0.4784314, 1,
1.411778, 0.4745214, 2.102084, 1, 0, 0.4745098, 1,
1.418958, 0.4670552, 1.838906, 1, 0, 0.4666667, 1,
1.432605, -0.06211655, 3.340251, 1, 0, 0.4627451, 1,
1.435507, 0.704117, 1.246171, 1, 0, 0.454902, 1,
1.435517, -0.845242, 2.594167, 1, 0, 0.4509804, 1,
1.454, -0.7493127, -0.0002945525, 1, 0, 0.4431373, 1,
1.455912, -0.2322317, 0.4597663, 1, 0, 0.4392157, 1,
1.457406, -0.9203826, 2.52344, 1, 0, 0.4313726, 1,
1.462419, -1.724444, 2.38668, 1, 0, 0.427451, 1,
1.463573, 1.48414, 1.382708, 1, 0, 0.4196078, 1,
1.473187, 0.1024202, 1.295281, 1, 0, 0.4156863, 1,
1.476952, 0.00950932, 1.813976, 1, 0, 0.4078431, 1,
1.478954, -0.4242339, 2.400477, 1, 0, 0.4039216, 1,
1.497645, 1.823909, 0.7681639, 1, 0, 0.3960784, 1,
1.498373, -0.1858453, 1.630361, 1, 0, 0.3882353, 1,
1.501212, 0.8197031, 2.35886, 1, 0, 0.3843137, 1,
1.528502, 0.3032165, 1.714643, 1, 0, 0.3764706, 1,
1.530181, -0.008408731, 2.591609, 1, 0, 0.372549, 1,
1.55669, -0.652006, 1.853148, 1, 0, 0.3647059, 1,
1.58325, 0.2005745, 2.076618, 1, 0, 0.3607843, 1,
1.603327, 0.8886127, 0.5014428, 1, 0, 0.3529412, 1,
1.604835, 0.2636473, 0.8686242, 1, 0, 0.3490196, 1,
1.608399, 0.571825, 0.9563202, 1, 0, 0.3411765, 1,
1.614638, 1.115843, 1.054907, 1, 0, 0.3372549, 1,
1.616246, 0.7159241, 1.724953, 1, 0, 0.3294118, 1,
1.623301, 0.8308401, -1.203982, 1, 0, 0.3254902, 1,
1.626367, 0.2831645, 0.84496, 1, 0, 0.3176471, 1,
1.630824, 0.18483, 0.9399558, 1, 0, 0.3137255, 1,
1.640529, 0.3993499, 2.138393, 1, 0, 0.3058824, 1,
1.642641, -1.079212, 2.463176, 1, 0, 0.2980392, 1,
1.644524, 1.106537, 1.249708, 1, 0, 0.2941177, 1,
1.657036, 0.1361231, -0.9565822, 1, 0, 0.2862745, 1,
1.659421, 0.4367813, 0.77877, 1, 0, 0.282353, 1,
1.659619, -0.07572179, 4.662717, 1, 0, 0.2745098, 1,
1.663526, -0.7760401, 1.568212, 1, 0, 0.2705882, 1,
1.669702, 0.4255511, 2.522877, 1, 0, 0.2627451, 1,
1.695807, -1.248035, 3.231103, 1, 0, 0.2588235, 1,
1.697486, 1.474577, 1.43619, 1, 0, 0.2509804, 1,
1.702836, -0.3393102, 2.266584, 1, 0, 0.2470588, 1,
1.706322, 0.9869981, 0.6579922, 1, 0, 0.2392157, 1,
1.707951, -0.06420437, 1.690145, 1, 0, 0.2352941, 1,
1.70882, -1.013429, 2.013031, 1, 0, 0.227451, 1,
1.709208, -1.036081, 1.973633, 1, 0, 0.2235294, 1,
1.778572, 0.7966735, 1.616348, 1, 0, 0.2156863, 1,
1.787174, -0.3015069, 2.863941, 1, 0, 0.2117647, 1,
1.793094, -0.04304416, 1.20755, 1, 0, 0.2039216, 1,
1.803835, 0.6332189, 1.005615, 1, 0, 0.1960784, 1,
1.816149, -0.138149, 2.331732, 1, 0, 0.1921569, 1,
1.826729, -1.210078, 2.413914, 1, 0, 0.1843137, 1,
1.832006, -0.02735221, 1.93318, 1, 0, 0.1803922, 1,
1.85067, 1.911452, 2.590858, 1, 0, 0.172549, 1,
1.855437, 0.6316774, -0.2130221, 1, 0, 0.1686275, 1,
1.855923, 1.182924, 1.902491, 1, 0, 0.1607843, 1,
1.856056, -1.349892, 2.246766, 1, 0, 0.1568628, 1,
1.861107, -0.3786479, 0.3436442, 1, 0, 0.1490196, 1,
1.863956, -0.766017, 2.366327, 1, 0, 0.145098, 1,
1.886581, 0.2871912, 1.462547, 1, 0, 0.1372549, 1,
1.888938, -0.1813664, 0.946893, 1, 0, 0.1333333, 1,
1.921261, 0.6614373, 3.367788, 1, 0, 0.1254902, 1,
1.943012, -0.4226042, 0.8710819, 1, 0, 0.1215686, 1,
2.038222, -0.4384348, 3.258018, 1, 0, 0.1137255, 1,
2.056468, -0.2861811, 1.49205, 1, 0, 0.1098039, 1,
2.096563, -0.8832798, 1.558992, 1, 0, 0.1019608, 1,
2.125187, 1.663262, 1.948027, 1, 0, 0.09411765, 1,
2.182676, 1.086476, 0.7111565, 1, 0, 0.09019608, 1,
2.241247, 0.8597957, -2.081845, 1, 0, 0.08235294, 1,
2.243565, 0.0243285, 1.443938, 1, 0, 0.07843138, 1,
2.281997, 1.644919, 1.875935, 1, 0, 0.07058824, 1,
2.307962, 0.2688614, -0.1188366, 1, 0, 0.06666667, 1,
2.313806, 1.429701, 0.8929557, 1, 0, 0.05882353, 1,
2.318957, 0.1183279, 0.9603923, 1, 0, 0.05490196, 1,
2.360253, 1.960468, -0.3426777, 1, 0, 0.04705882, 1,
2.492483, 1.027165, 1.386532, 1, 0, 0.04313726, 1,
2.554646, -1.698967, 2.876227, 1, 0, 0.03529412, 1,
2.5825, 0.242011, 1.602866, 1, 0, 0.03137255, 1,
2.751313, -0.2405148, 1.087551, 1, 0, 0.02352941, 1,
2.888545, 0.3901586, 1.47647, 1, 0, 0.01960784, 1,
3.01943, 2.646408, 0.3292399, 1, 0, 0.01176471, 1,
3.055288, 0.2791802, 0.06585065, 1, 0, 0.007843138, 1
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
-0.04634953, -4.463027, -8.898894, 0, -0.5, 0.5, 0.5,
-0.04634953, -4.463027, -8.898894, 1, -0.5, 0.5, 0.5,
-0.04634953, -4.463027, -8.898894, 1, 1.5, 0.5, 0.5,
-0.04634953, -4.463027, -8.898894, 0, 1.5, 0.5, 0.5
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
-4.199442, 0.07733476, -8.898894, 0, -0.5, 0.5, 0.5,
-4.199442, 0.07733476, -8.898894, 1, -0.5, 0.5, 0.5,
-4.199442, 0.07733476, -8.898894, 1, 1.5, 0.5, 0.5,
-4.199442, 0.07733476, -8.898894, 0, 1.5, 0.5, 0.5
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
-4.199442, -4.463027, -0.396559, 0, -0.5, 0.5, 0.5,
-4.199442, -4.463027, -0.396559, 1, -0.5, 0.5, 0.5,
-4.199442, -4.463027, -0.396559, 1, 1.5, 0.5, 0.5,
-4.199442, -4.463027, -0.396559, 0, 1.5, 0.5, 0.5
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
-3, -3.415251, -6.936817,
3, -3.415251, -6.936817,
-3, -3.415251, -6.936817,
-3, -3.58988, -7.26383,
-2, -3.415251, -6.936817,
-2, -3.58988, -7.26383,
-1, -3.415251, -6.936817,
-1, -3.58988, -7.26383,
0, -3.415251, -6.936817,
0, -3.58988, -7.26383,
1, -3.415251, -6.936817,
1, -3.58988, -7.26383,
2, -3.415251, -6.936817,
2, -3.58988, -7.26383,
3, -3.415251, -6.936817,
3, -3.58988, -7.26383
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
-3, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
-3, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
-3, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
-3, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
-2, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
-2, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
-2, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
-2, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
-1, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
-1, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
-1, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
-1, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
0, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
0, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
0, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
0, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
1, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
1, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
1, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
1, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
2, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
2, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
2, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
2, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5,
3, -3.939139, -7.917856, 0, -0.5, 0.5, 0.5,
3, -3.939139, -7.917856, 1, -0.5, 0.5, 0.5,
3, -3.939139, -7.917856, 1, 1.5, 0.5, 0.5,
3, -3.939139, -7.917856, 0, 1.5, 0.5, 0.5
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
-3.241036, -3, -6.936817,
-3.241036, 3, -6.936817,
-3.241036, -3, -6.936817,
-3.400771, -3, -7.26383,
-3.241036, -2, -6.936817,
-3.400771, -2, -7.26383,
-3.241036, -1, -6.936817,
-3.400771, -1, -7.26383,
-3.241036, 0, -6.936817,
-3.400771, 0, -7.26383,
-3.241036, 1, -6.936817,
-3.400771, 1, -7.26383,
-3.241036, 2, -6.936817,
-3.400771, 2, -7.26383,
-3.241036, 3, -6.936817,
-3.400771, 3, -7.26383
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
-3.720239, -3, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, -3, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, -3, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, -3, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, -2, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, -2, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, -2, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, -2, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, -1, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, -1, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, -1, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, -1, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, 0, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, 0, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, 0, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, 0, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, 1, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, 1, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, 1, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, 1, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, 2, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, 2, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, 2, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, 2, -7.917856, 0, 1.5, 0.5, 0.5,
-3.720239, 3, -7.917856, 0, -0.5, 0.5, 0.5,
-3.720239, 3, -7.917856, 1, -0.5, 0.5, 0.5,
-3.720239, 3, -7.917856, 1, 1.5, 0.5, 0.5,
-3.720239, 3, -7.917856, 0, 1.5, 0.5, 0.5
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
-3.241036, -3.415251, -6,
-3.241036, -3.415251, 4,
-3.241036, -3.415251, -6,
-3.400771, -3.58988, -6,
-3.241036, -3.415251, -4,
-3.400771, -3.58988, -4,
-3.241036, -3.415251, -2,
-3.400771, -3.58988, -2,
-3.241036, -3.415251, 0,
-3.400771, -3.58988, 0,
-3.241036, -3.415251, 2,
-3.400771, -3.58988, 2,
-3.241036, -3.415251, 4,
-3.400771, -3.58988, 4
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
"-6",
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
-3.720239, -3.939139, -6, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -6, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -6, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, -6, 0, 1.5, 0.5, 0.5,
-3.720239, -3.939139, -4, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -4, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -4, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, -4, 0, 1.5, 0.5, 0.5,
-3.720239, -3.939139, -2, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -2, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, -2, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, -2, 0, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 0, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 0, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 0, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 0, 0, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 2, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 2, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 2, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 2, 0, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 4, 0, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 4, 1, -0.5, 0.5, 0.5,
-3.720239, -3.939139, 4, 1, 1.5, 0.5, 0.5,
-3.720239, -3.939139, 4, 0, 1.5, 0.5, 0.5
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
-3.241036, -3.415251, -6.936817,
-3.241036, 3.569921, -6.936817,
-3.241036, -3.415251, 6.143699,
-3.241036, 3.569921, 6.143699,
-3.241036, -3.415251, -6.936817,
-3.241036, -3.415251, 6.143699,
-3.241036, 3.569921, -6.936817,
-3.241036, 3.569921, 6.143699,
-3.241036, -3.415251, -6.936817,
3.148337, -3.415251, -6.936817,
-3.241036, -3.415251, 6.143699,
3.148337, -3.415251, 6.143699,
-3.241036, 3.569921, -6.936817,
3.148337, 3.569921, -6.936817,
-3.241036, 3.569921, 6.143699,
3.148337, 3.569921, 6.143699,
3.148337, -3.415251, -6.936817,
3.148337, 3.569921, -6.936817,
3.148337, -3.415251, 6.143699,
3.148337, 3.569921, 6.143699,
3.148337, -3.415251, -6.936817,
3.148337, -3.415251, 6.143699,
3.148337, 3.569921, -6.936817,
3.148337, 3.569921, 6.143699
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
var radius = 8.622036;
var distance = 38.36041;
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
mvMatrix.translate( 0.04634953, -0.07733476, 0.396559 );
mvMatrix.scale( 1.459034, 1.334586, 0.712687 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.36041);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
6-amino-2-naphthalen<-read.table("6-amino-2-naphthalen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-6-amino-2-naphthalen$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
y<-6-amino-2-naphthalen$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
```

```r
z<-6-amino-2-naphthalen$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino' not found
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
-3.147987, -1.738242, -2.551334, 0, 0, 1, 1, 1,
-3.121878, -0.1200097, -1.17448, 1, 0, 0, 1, 1,
-2.980948, 0.765967, -1.369894, 1, 0, 0, 1, 1,
-2.845105, 0.308339, -1.796111, 1, 0, 0, 1, 1,
-2.822413, -0.5091899, -3.710196, 1, 0, 0, 1, 1,
-2.821268, 1.365006, -1.953317, 1, 0, 0, 1, 1,
-2.713786, 0.2309336, -2.46075, 0, 0, 0, 1, 1,
-2.516512, -1.122451, -1.517256, 0, 0, 0, 1, 1,
-2.502786, -0.211714, -1.745914, 0, 0, 0, 1, 1,
-2.423117, 0.1311647, -0.7789423, 0, 0, 0, 1, 1,
-2.417586, -0.08945156, -2.560985, 0, 0, 0, 1, 1,
-2.399477, -0.4058362, -3.110685, 0, 0, 0, 1, 1,
-2.335444, 0.6206794, -0.1564675, 0, 0, 0, 1, 1,
-2.312168, 0.276548, -2.204392, 1, 1, 1, 1, 1,
-2.306309, -1.258025, -2.064499, 1, 1, 1, 1, 1,
-2.281613, -0.1322728, -2.314598, 1, 1, 1, 1, 1,
-2.249244, -1.149732, -3.159752, 1, 1, 1, 1, 1,
-2.22539, 1.365174, -1.229308, 1, 1, 1, 1, 1,
-2.211449, 0.1532225, -1.190105, 1, 1, 1, 1, 1,
-2.19987, 0.9971707, -1.022466, 1, 1, 1, 1, 1,
-2.199759, 0.3075024, -0.8873808, 1, 1, 1, 1, 1,
-2.188807, 2.513351, -0.8587376, 1, 1, 1, 1, 1,
-2.175697, 0.6502234, -0.4196733, 1, 1, 1, 1, 1,
-2.16045, -1.742603, -2.293825, 1, 1, 1, 1, 1,
-2.159877, -0.8930755, -0.685651, 1, 1, 1, 1, 1,
-2.118584, 1.056328, -1.081198, 1, 1, 1, 1, 1,
-2.115331, 1.263007, -2.592123, 1, 1, 1, 1, 1,
-2.113826, -0.7285432, -2.484057, 1, 1, 1, 1, 1,
-2.109152, 0.3676707, -0.72746, 0, 0, 1, 1, 1,
-2.064197, -0.7146981, -1.208734, 1, 0, 0, 1, 1,
-1.980013, -0.4619808, -2.065059, 1, 0, 0, 1, 1,
-1.971698, 1.095768, -1.759565, 1, 0, 0, 1, 1,
-1.9502, -0.4022055, -2.718432, 1, 0, 0, 1, 1,
-1.94795, 0.7472488, -0.2251239, 1, 0, 0, 1, 1,
-1.942092, -0.1970022, -2.179989, 0, 0, 0, 1, 1,
-1.926682, 0.7079489, -1.661093, 0, 0, 0, 1, 1,
-1.915261, -0.1744348, -0.6232975, 0, 0, 0, 1, 1,
-1.853626, -0.504963, -2.097887, 0, 0, 0, 1, 1,
-1.823827, -0.6084635, -1.66021, 0, 0, 0, 1, 1,
-1.818212, 0.3367556, -0.5629859, 0, 0, 0, 1, 1,
-1.812527, -0.7013473, -1.501218, 0, 0, 0, 1, 1,
-1.810894, -0.6917888, -1.334101, 1, 1, 1, 1, 1,
-1.784949, -0.7583361, -1.876607, 1, 1, 1, 1, 1,
-1.75634, -0.519655, -3.254475, 1, 1, 1, 1, 1,
-1.752009, -0.5839111, 0.7485681, 1, 1, 1, 1, 1,
-1.742247, -0.799709, -1.820189, 1, 1, 1, 1, 1,
-1.738828, -1.360357, -3.313431, 1, 1, 1, 1, 1,
-1.733928, 0.3753679, -0.4649531, 1, 1, 1, 1, 1,
-1.726834, 0.14998, -1.019049, 1, 1, 1, 1, 1,
-1.686114, 2.121032, -0.9994922, 1, 1, 1, 1, 1,
-1.680443, 0.9055226, -0.0604024, 1, 1, 1, 1, 1,
-1.677177, -0.4100925, -1.336597, 1, 1, 1, 1, 1,
-1.667884, 1.184465, -2.150082, 1, 1, 1, 1, 1,
-1.667854, -0.5016155, -2.863354, 1, 1, 1, 1, 1,
-1.66519, 0.7952296, -3.317566, 1, 1, 1, 1, 1,
-1.649997, 0.3295433, -1.917782, 1, 1, 1, 1, 1,
-1.642267, -0.01891562, -1.904803, 0, 0, 1, 1, 1,
-1.641068, 0.7108659, 0.7478008, 1, 0, 0, 1, 1,
-1.63479, 0.1988498, -1.989594, 1, 0, 0, 1, 1,
-1.623051, 0.5940963, -1.903605, 1, 0, 0, 1, 1,
-1.611452, 0.7287737, -0.4926901, 1, 0, 0, 1, 1,
-1.579901, -1.398586, -2.720495, 1, 0, 0, 1, 1,
-1.579247, -0.03717942, -0.4478308, 0, 0, 0, 1, 1,
-1.563974, 0.8727652, -1.792563, 0, 0, 0, 1, 1,
-1.554904, -1.469253, -2.767643, 0, 0, 0, 1, 1,
-1.547426, 0.5801432, 0.6765029, 0, 0, 0, 1, 1,
-1.533896, -0.5346394, 0.7838963, 0, 0, 0, 1, 1,
-1.512769, -1.439162, -2.605014, 0, 0, 0, 1, 1,
-1.509611, 2.456321, 0.9254615, 0, 0, 0, 1, 1,
-1.508829, 2.372934, -2.230502, 1, 1, 1, 1, 1,
-1.507447, -0.2548948, -3.286082, 1, 1, 1, 1, 1,
-1.50593, -1.477947, -3.211091, 1, 1, 1, 1, 1,
-1.493659, -1.211915, -2.1128, 1, 1, 1, 1, 1,
-1.482728, -0.6280639, -1.768993, 1, 1, 1, 1, 1,
-1.482249, 1.149402, -1.207167, 1, 1, 1, 1, 1,
-1.482167, 1.192476, -3.052931, 1, 1, 1, 1, 1,
-1.480257, 0.2607352, -2.080631, 1, 1, 1, 1, 1,
-1.477122, 1.941228, -0.8136605, 1, 1, 1, 1, 1,
-1.468794, -0.2829761, -1.91321, 1, 1, 1, 1, 1,
-1.466027, -0.003263528, -2.406875, 1, 1, 1, 1, 1,
-1.463585, -0.08825166, -1.061701, 1, 1, 1, 1, 1,
-1.45779, 1.781123, -1.967865, 1, 1, 1, 1, 1,
-1.443032, 0.1675541, -3.334645, 1, 1, 1, 1, 1,
-1.440344, 0.4246754, -1.422839, 1, 1, 1, 1, 1,
-1.43652, -0.9722911, -0.5920753, 0, 0, 1, 1, 1,
-1.423882, 0.7049481, -0.3904046, 1, 0, 0, 1, 1,
-1.414115, 2.925973, -1.063027, 1, 0, 0, 1, 1,
-1.401825, -0.1547042, -1.439784, 1, 0, 0, 1, 1,
-1.401248, 3.468195, 1.828036, 1, 0, 0, 1, 1,
-1.385613, -0.5340633, -1.157329, 1, 0, 0, 1, 1,
-1.383624, -0.7077681, -2.643503, 0, 0, 0, 1, 1,
-1.379619, 0.2852163, -3.201811, 0, 0, 0, 1, 1,
-1.375963, 0.4332672, -1.254704, 0, 0, 0, 1, 1,
-1.351765, -0.3365504, -3.364072, 0, 0, 0, 1, 1,
-1.345993, 0.4963595, -1.794371, 0, 0, 0, 1, 1,
-1.343916, 0.9289364, -1.568778, 0, 0, 0, 1, 1,
-1.343674, -0.5747433, -2.029506, 0, 0, 0, 1, 1,
-1.342931, 1.279491, 0.8935491, 1, 1, 1, 1, 1,
-1.334902, 0.06015749, -1.154346, 1, 1, 1, 1, 1,
-1.325917, -0.1043879, -0.1557062, 1, 1, 1, 1, 1,
-1.320766, -1.115106, -2.671144, 1, 1, 1, 1, 1,
-1.318824, -1.097291, 0.6208183, 1, 1, 1, 1, 1,
-1.307031, -1.09079, -1.200492, 1, 1, 1, 1, 1,
-1.306628, -0.3837319, -2.454434, 1, 1, 1, 1, 1,
-1.305472, -0.7104394, -2.591044, 1, 1, 1, 1, 1,
-1.30519, 2.507016, 0.210629, 1, 1, 1, 1, 1,
-1.295682, -1.372812, -1.454886, 1, 1, 1, 1, 1,
-1.283108, 0.5858883, -1.941328, 1, 1, 1, 1, 1,
-1.282907, -0.6705211, -2.770438, 1, 1, 1, 1, 1,
-1.280044, -0.08976543, -1.135521, 1, 1, 1, 1, 1,
-1.273107, -0.3856301, -1.169526, 1, 1, 1, 1, 1,
-1.271326, -0.107849, -1.589626, 1, 1, 1, 1, 1,
-1.27011, -1.381389, -1.511255, 0, 0, 1, 1, 1,
-1.264468, -0.8060706, -3.688859, 1, 0, 0, 1, 1,
-1.254379, 0.1680524, -0.3382517, 1, 0, 0, 1, 1,
-1.253613, -0.3581308, -2.246588, 1, 0, 0, 1, 1,
-1.252523, -0.03573145, -0.6416888, 1, 0, 0, 1, 1,
-1.234599, -0.8664175, -2.350804, 1, 0, 0, 1, 1,
-1.227624, -1.128552, -2.183026, 0, 0, 0, 1, 1,
-1.225126, 0.533855, -0.55558, 0, 0, 0, 1, 1,
-1.220729, -0.7590508, -0.3784952, 0, 0, 0, 1, 1,
-1.218338, 0.349575, -0.02190114, 0, 0, 0, 1, 1,
-1.203119, 0.1060806, -1.219976, 0, 0, 0, 1, 1,
-1.198569, -0.07261956, -0.1985991, 0, 0, 0, 1, 1,
-1.197939, -0.8920457, -0.7351403, 0, 0, 0, 1, 1,
-1.193637, 0.1063181, -2.043219, 1, 1, 1, 1, 1,
-1.19221, -1.810914, -2.605611, 1, 1, 1, 1, 1,
-1.176659, -0.3738382, -0.8490771, 1, 1, 1, 1, 1,
-1.175453, -0.8198413, -3.301986, 1, 1, 1, 1, 1,
-1.175075, -0.3044658, -2.027415, 1, 1, 1, 1, 1,
-1.172122, -1.95258, -1.348436, 1, 1, 1, 1, 1,
-1.166964, -0.4781096, -1.547143, 1, 1, 1, 1, 1,
-1.160828, 0.6476939, -2.530099, 1, 1, 1, 1, 1,
-1.152827, 1.624548, -0.3393108, 1, 1, 1, 1, 1,
-1.151519, 0.6764511, 0.7897821, 1, 1, 1, 1, 1,
-1.135129, -0.7146273, -1.708592, 1, 1, 1, 1, 1,
-1.13372, 0.9783469, 0.649708, 1, 1, 1, 1, 1,
-1.126738, -0.6437423, -0.9352449, 1, 1, 1, 1, 1,
-1.125479, 0.09200502, -1.946856, 1, 1, 1, 1, 1,
-1.125386, 0.1834018, -0.7146944, 1, 1, 1, 1, 1,
-1.120737, 1.67693, 0.5766523, 0, 0, 1, 1, 1,
-1.11407, -1.405459, -2.465228, 1, 0, 0, 1, 1,
-1.112957, -0.2527072, -0.8718721, 1, 0, 0, 1, 1,
-1.104915, -0.4828603, -1.647789, 1, 0, 0, 1, 1,
-1.095959, 0.2364218, -2.942342, 1, 0, 0, 1, 1,
-1.094756, -3.285474, -3.201182, 1, 0, 0, 1, 1,
-1.086618, -0.2589058, -1.247196, 0, 0, 0, 1, 1,
-1.082118, -0.8649064, -2.479687, 0, 0, 0, 1, 1,
-1.070914, -0.008327571, -1.298139, 0, 0, 0, 1, 1,
-1.050059, 0.1417746, -1.184835, 0, 0, 0, 1, 1,
-1.040775, -1.016971, 0.1163253, 0, 0, 0, 1, 1,
-1.039949, -0.06447718, -3.307504, 0, 0, 0, 1, 1,
-1.038318, 0.03181706, -0.9402613, 0, 0, 0, 1, 1,
-1.028541, -1.74299, -3.950802, 1, 1, 1, 1, 1,
-1.022218, -1.370518, -1.435207, 1, 1, 1, 1, 1,
-1.021418, 0.06026571, -3.310019, 1, 1, 1, 1, 1,
-1.020705, 1.687466, 0.04511201, 1, 1, 1, 1, 1,
-1.014612, -1.707587, -3.014728, 1, 1, 1, 1, 1,
-1.013681, -0.1874167, -1.768382, 1, 1, 1, 1, 1,
-1.013328, 0.3379552, -2.593247, 1, 1, 1, 1, 1,
-1.012896, -0.461334, -1.042479, 1, 1, 1, 1, 1,
-1.008828, -0.4512436, -2.624892, 1, 1, 1, 1, 1,
-1.008135, 1.291479, -1.085951, 1, 1, 1, 1, 1,
-1.002211, -0.5675421, -0.9082221, 1, 1, 1, 1, 1,
-1.00022, -0.8941682, -3.458074, 1, 1, 1, 1, 1,
-0.9910899, -0.1976446, -2.597621, 1, 1, 1, 1, 1,
-0.9865948, 1.021404, 0.924111, 1, 1, 1, 1, 1,
-0.9722134, 0.2504417, -2.325786, 1, 1, 1, 1, 1,
-0.972033, -1.886712, -3.14048, 0, 0, 1, 1, 1,
-0.9701892, -1.682865, -3.888144, 1, 0, 0, 1, 1,
-0.9693371, 2.681622, 0.116269, 1, 0, 0, 1, 1,
-0.969196, 0.7025942, -1.893233, 1, 0, 0, 1, 1,
-0.9688184, -0.6678061, -2.158689, 1, 0, 0, 1, 1,
-0.9675063, -1.323642, -3.906814, 1, 0, 0, 1, 1,
-0.9630629, 0.8888806, -1.106449, 0, 0, 0, 1, 1,
-0.9595586, -0.4340734, -1.960829, 0, 0, 0, 1, 1,
-0.9537153, 0.142157, -1.454753, 0, 0, 0, 1, 1,
-0.9532611, -0.05256595, -2.117435, 0, 0, 0, 1, 1,
-0.952473, -1.20583, -1.569501, 0, 0, 0, 1, 1,
-0.9520577, -2.028241, -1.939047, 0, 0, 0, 1, 1,
-0.9512582, 0.2416413, -2.760108, 0, 0, 0, 1, 1,
-0.9484152, -0.0423643, -1.718655, 1, 1, 1, 1, 1,
-0.9465116, -0.12214, -2.37168, 1, 1, 1, 1, 1,
-0.9452314, -0.9480383, -3.079209, 1, 1, 1, 1, 1,
-0.9417877, -0.0615349, -1.783077, 1, 1, 1, 1, 1,
-0.9342539, 0.5214463, -2.635376, 1, 1, 1, 1, 1,
-0.9333088, -0.1289894, -2.573552, 1, 1, 1, 1, 1,
-0.9287338, -0.5108181, -4.194815, 1, 1, 1, 1, 1,
-0.9194909, 2.127373, -2.60357, 1, 1, 1, 1, 1,
-0.9189199, -1.997897, -3.111505, 1, 1, 1, 1, 1,
-0.9166147, 2.297739, -1.507598, 1, 1, 1, 1, 1,
-0.9164431, 0.8996612, -0.9743193, 1, 1, 1, 1, 1,
-0.9125018, 0.5325663, -1.808402, 1, 1, 1, 1, 1,
-0.9106942, 1.09159, -1.244034, 1, 1, 1, 1, 1,
-0.9096094, -0.4163973, -1.798437, 1, 1, 1, 1, 1,
-0.9066719, -0.885527, -2.491156, 1, 1, 1, 1, 1,
-0.8951266, 2.06566, -1.451646, 0, 0, 1, 1, 1,
-0.8931467, 1.027742, -1.410641, 1, 0, 0, 1, 1,
-0.8918192, -1.130213, -3.538975, 1, 0, 0, 1, 1,
-0.8885683, -1.316488, -2.198911, 1, 0, 0, 1, 1,
-0.887289, 0.3937548, -1.890507, 1, 0, 0, 1, 1,
-0.8820021, 1.032873, -2.061434, 1, 0, 0, 1, 1,
-0.8792117, 0.4623309, -2.452255, 0, 0, 0, 1, 1,
-0.8785763, -0.8094548, -2.273902, 0, 0, 0, 1, 1,
-0.8762378, 0.007493741, -1.826371, 0, 0, 0, 1, 1,
-0.8723288, -1.653544, -4.495917, 0, 0, 0, 1, 1,
-0.8717351, 0.3080456, -0.440031, 0, 0, 0, 1, 1,
-0.8710166, -0.09166636, -2.009028, 0, 0, 0, 1, 1,
-0.8649054, -1.60672, -3.432909, 0, 0, 0, 1, 1,
-0.8617788, 2.118401, -0.6452458, 1, 1, 1, 1, 1,
-0.8598866, 0.7184201, 0.5626186, 1, 1, 1, 1, 1,
-0.8591175, 0.05230242, -3.510846, 1, 1, 1, 1, 1,
-0.8570348, 1.777351, -0.9561436, 1, 1, 1, 1, 1,
-0.8539721, 1.632749, -1.54984, 1, 1, 1, 1, 1,
-0.8520444, -0.5717981, -1.588872, 1, 1, 1, 1, 1,
-0.849093, -1.612386, -1.406328, 1, 1, 1, 1, 1,
-0.8427589, 0.09903289, -2.72639, 1, 1, 1, 1, 1,
-0.836006, 1.132731, -1.083329, 1, 1, 1, 1, 1,
-0.8304551, 0.3386406, -1.236829, 1, 1, 1, 1, 1,
-0.8265663, -0.2460964, -0.7655048, 1, 1, 1, 1, 1,
-0.8260606, -1.051457, -4.285956, 1, 1, 1, 1, 1,
-0.8249794, -0.3211104, -2.21717, 1, 1, 1, 1, 1,
-0.8157815, -0.5592932, -1.113585, 1, 1, 1, 1, 1,
-0.815617, 1.446135, 0.2947092, 1, 1, 1, 1, 1,
-0.8132758, 0.02977502, -1.59942, 0, 0, 1, 1, 1,
-0.8131581, 0.8876454, 0.4827059, 1, 0, 0, 1, 1,
-0.8112396, -0.003427976, 0.1824263, 1, 0, 0, 1, 1,
-0.8043514, 0.0172325, -2.534778, 1, 0, 0, 1, 1,
-0.8024802, 1.05484, -1.102758, 1, 0, 0, 1, 1,
-0.8016611, -1.486317, -3.292681, 1, 0, 0, 1, 1,
-0.7952777, 0.08012267, -2.582602, 0, 0, 0, 1, 1,
-0.7943625, 0.2946736, -1.731098, 0, 0, 0, 1, 1,
-0.7927753, 1.512149, 0.2376344, 0, 0, 0, 1, 1,
-0.7925724, -1.473983, -2.743513, 0, 0, 0, 1, 1,
-0.7925236, -0.8920465, -2.034163, 0, 0, 0, 1, 1,
-0.7859156, 1.268692, -2.184309, 0, 0, 0, 1, 1,
-0.7853605, 0.2183548, -1.09055, 0, 0, 0, 1, 1,
-0.7831141, -2.021689, -3.36289, 1, 1, 1, 1, 1,
-0.781975, -1.677341, -2.393489, 1, 1, 1, 1, 1,
-0.7746693, -0.5312301, -2.546087, 1, 1, 1, 1, 1,
-0.7745425, 2.48727, 0.8161168, 1, 1, 1, 1, 1,
-0.7741061, -0.3740637, -0.9510901, 1, 1, 1, 1, 1,
-0.7717116, -1.004516, -1.671781, 1, 1, 1, 1, 1,
-0.7636883, -2.109148, -3.209179, 1, 1, 1, 1, 1,
-0.7623429, -0.1209047, -1.347839, 1, 1, 1, 1, 1,
-0.7621318, -1.238155, -4.07396, 1, 1, 1, 1, 1,
-0.7587005, 1.518095, 1.004431, 1, 1, 1, 1, 1,
-0.7582722, -0.3856753, -2.528698, 1, 1, 1, 1, 1,
-0.7579194, -2.527921, -3.535253, 1, 1, 1, 1, 1,
-0.7557768, -1.197195, -4.014041, 1, 1, 1, 1, 1,
-0.7486574, 0.2015152, -2.29689, 1, 1, 1, 1, 1,
-0.7480038, -1.265172, -1.90699, 1, 1, 1, 1, 1,
-0.7417424, 0.1526577, -2.393792, 0, 0, 1, 1, 1,
-0.7374154, 0.04253192, -1.125919, 1, 0, 0, 1, 1,
-0.7320507, -0.8063501, -3.912601, 1, 0, 0, 1, 1,
-0.7267239, -0.539109, -2.37827, 1, 0, 0, 1, 1,
-0.7156814, 1.136904, -1.0199, 1, 0, 0, 1, 1,
-0.7155342, -0.8516433, -2.665461, 1, 0, 0, 1, 1,
-0.7146821, 0.233913, 0.02884706, 0, 0, 0, 1, 1,
-0.6975412, 0.8451004, -0.139478, 0, 0, 0, 1, 1,
-0.6971958, -1.048238, -1.988196, 0, 0, 0, 1, 1,
-0.6954194, -0.8098781, -1.313047, 0, 0, 0, 1, 1,
-0.6923674, -0.7185827, -2.424637, 0, 0, 0, 1, 1,
-0.6884698, 0.4861045, -1.513563, 0, 0, 0, 1, 1,
-0.6828316, 0.7769772, -2.62159, 0, 0, 0, 1, 1,
-0.6771588, -0.8016392, -2.70042, 1, 1, 1, 1, 1,
-0.6745198, 0.1675283, 0.02453184, 1, 1, 1, 1, 1,
-0.6707722, 0.5737844, -0.4875264, 1, 1, 1, 1, 1,
-0.6680665, 0.7269328, -0.2565216, 1, 1, 1, 1, 1,
-0.663646, 0.3934309, -0.9634567, 1, 1, 1, 1, 1,
-0.6512291, 0.7298203, -1.723774, 1, 1, 1, 1, 1,
-0.6456348, 1.625443, -1.277608, 1, 1, 1, 1, 1,
-0.6412132, 0.4717777, -1.290575, 1, 1, 1, 1, 1,
-0.6405722, 0.8021942, -1.472955, 1, 1, 1, 1, 1,
-0.6396608, -0.001073013, -1.771575, 1, 1, 1, 1, 1,
-0.6347591, 2.319061, 0.6477062, 1, 1, 1, 1, 1,
-0.6345512, -1.389853, -1.563191, 1, 1, 1, 1, 1,
-0.6337468, 0.4614027, -0.2486911, 1, 1, 1, 1, 1,
-0.6301037, 1.507747, 2.292428, 1, 1, 1, 1, 1,
-0.6293188, 0.1573341, -2.59752, 1, 1, 1, 1, 1,
-0.6273693, 1.25995, -0.5793046, 0, 0, 1, 1, 1,
-0.6267014, 0.3211532, -2.922638, 1, 0, 0, 1, 1,
-0.6252685, 0.2691039, -2.102417, 1, 0, 0, 1, 1,
-0.6233503, 0.5739418, -0.8241485, 1, 0, 0, 1, 1,
-0.6216046, 0.5591709, -0.233126, 1, 0, 0, 1, 1,
-0.6112519, -1.335028, -1.509109, 1, 0, 0, 1, 1,
-0.610378, -0.7494379, -2.067088, 0, 0, 0, 1, 1,
-0.6094672, 1.096348, 0.03605434, 0, 0, 0, 1, 1,
-0.6090513, -0.9069369, -3.582318, 0, 0, 0, 1, 1,
-0.6038612, -2.006991, -3.662552, 0, 0, 0, 1, 1,
-0.5990818, -0.2868986, -1.914594, 0, 0, 0, 1, 1,
-0.596768, -0.2006003, -3.34772, 0, 0, 0, 1, 1,
-0.5961582, -0.5195283, -4.331736, 0, 0, 0, 1, 1,
-0.5933756, 0.1297585, -1.934577, 1, 1, 1, 1, 1,
-0.588994, -2.33258, -2.109868, 1, 1, 1, 1, 1,
-0.5823191, -0.4041433, -2.334925, 1, 1, 1, 1, 1,
-0.5783249, 0.01660158, -2.593675, 1, 1, 1, 1, 1,
-0.5751256, -0.680571, -3.500627, 1, 1, 1, 1, 1,
-0.5723521, -0.8312483, -2.732696, 1, 1, 1, 1, 1,
-0.5643745, -0.0647098, -1.359483, 1, 1, 1, 1, 1,
-0.5610983, 0.02141334, -1.053077, 1, 1, 1, 1, 1,
-0.5606735, -0.1548605, 0.3693634, 1, 1, 1, 1, 1,
-0.5552602, -0.8721247, -3.218252, 1, 1, 1, 1, 1,
-0.5542782, -0.5589318, -2.854403, 1, 1, 1, 1, 1,
-0.551762, 1.802995, -0.4872542, 1, 1, 1, 1, 1,
-0.5492362, 0.6815211, -0.1302695, 1, 1, 1, 1, 1,
-0.5482317, -1.704697, -3.698732, 1, 1, 1, 1, 1,
-0.5476229, 0.2557091, -2.044525, 1, 1, 1, 1, 1,
-0.5448839, -0.6357518, -3.450913, 0, 0, 1, 1, 1,
-0.5443546, 0.4715258, -0.8136843, 1, 0, 0, 1, 1,
-0.5437329, 0.4375228, -1.574222, 1, 0, 0, 1, 1,
-0.5428821, -0.5759611, -1.687135, 1, 0, 0, 1, 1,
-0.5385004, 1.005388, -2.765182, 1, 0, 0, 1, 1,
-0.5373763, -0.3452254, -2.790943, 1, 0, 0, 1, 1,
-0.5329127, 0.5767137, -2.137055, 0, 0, 0, 1, 1,
-0.5325822, 0.7733727, -1.68383, 0, 0, 0, 1, 1,
-0.5288228, 1.519132, 0.953799, 0, 0, 0, 1, 1,
-0.5248522, -0.7322544, -2.538391, 0, 0, 0, 1, 1,
-0.5228228, -0.9433326, -3.113423, 0, 0, 0, 1, 1,
-0.5181612, -0.4953319, -1.230524, 0, 0, 0, 1, 1,
-0.5170348, -0.8993364, -3.571808, 0, 0, 0, 1, 1,
-0.5156661, -0.3812013, -2.683176, 1, 1, 1, 1, 1,
-0.5130499, -0.1992988, -1.955686, 1, 1, 1, 1, 1,
-0.5123059, 1.049255, 0.6487347, 1, 1, 1, 1, 1,
-0.5063769, 0.2291398, 0.4713352, 1, 1, 1, 1, 1,
-0.5056719, -0.4839467, -1.633593, 1, 1, 1, 1, 1,
-0.500419, -0.661503, -1.449711, 1, 1, 1, 1, 1,
-0.4991006, 0.4239486, -0.1671249, 1, 1, 1, 1, 1,
-0.4988571, 1.404409, -2.367379, 1, 1, 1, 1, 1,
-0.4883039, -0.9595914, -2.050188, 1, 1, 1, 1, 1,
-0.4864688, 0.2071398, -1.276592, 1, 1, 1, 1, 1,
-0.4851733, -0.8151315, -1.898408, 1, 1, 1, 1, 1,
-0.4848388, 0.01331884, -0.09002018, 1, 1, 1, 1, 1,
-0.4808254, -0.1600597, -3.463814, 1, 1, 1, 1, 1,
-0.479999, -1.437299, -3.03392, 1, 1, 1, 1, 1,
-0.4764358, -0.6702152, -2.058316, 1, 1, 1, 1, 1,
-0.4730149, 1.777416, -0.9644751, 0, 0, 1, 1, 1,
-0.4724639, 0.6189156, -1.071788, 1, 0, 0, 1, 1,
-0.4718617, 2.547445, 0.3054541, 1, 0, 0, 1, 1,
-0.4620389, -1.529018, -2.497641, 1, 0, 0, 1, 1,
-0.4608131, -1.326488, -3.68035, 1, 0, 0, 1, 1,
-0.4596911, 0.3499507, -1.021094, 1, 0, 0, 1, 1,
-0.4574996, -0.7484477, -2.661674, 0, 0, 0, 1, 1,
-0.4570991, 0.7423021, -0.02139043, 0, 0, 0, 1, 1,
-0.4553247, 0.2295852, 1.572003, 0, 0, 0, 1, 1,
-0.4542922, 0.295857, -1.395061, 0, 0, 0, 1, 1,
-0.4542806, 0.7043425, -0.317417, 0, 0, 0, 1, 1,
-0.4522075, -1.3082, -2.41593, 0, 0, 0, 1, 1,
-0.4494054, -0.3828643, -3.518031, 0, 0, 0, 1, 1,
-0.4471881, -1.640337, -2.64963, 1, 1, 1, 1, 1,
-0.4383923, 0.3514279, -0.1165628, 1, 1, 1, 1, 1,
-0.4375731, -0.6252146, -3.221492, 1, 1, 1, 1, 1,
-0.4343016, -0.0882062, -1.808777, 1, 1, 1, 1, 1,
-0.4306616, -1.506094, -2.78099, 1, 1, 1, 1, 1,
-0.4305238, -0.03823507, -1.646597, 1, 1, 1, 1, 1,
-0.424922, 1.319052, -0.8953562, 1, 1, 1, 1, 1,
-0.4175977, -1.72728, -2.573822, 1, 1, 1, 1, 1,
-0.415624, -0.6085258, -3.269224, 1, 1, 1, 1, 1,
-0.4152277, 0.0017876, -0.478546, 1, 1, 1, 1, 1,
-0.411864, -0.9275441, -0.7069861, 1, 1, 1, 1, 1,
-0.4116303, 0.5337759, -1.174826, 1, 1, 1, 1, 1,
-0.4106053, -0.03182519, -1.85942, 1, 1, 1, 1, 1,
-0.4101813, 1.804188, -0.5502951, 1, 1, 1, 1, 1,
-0.4087877, 1.307134, -0.7137905, 1, 1, 1, 1, 1,
-0.4083954, 1.995364, 0.90578, 0, 0, 1, 1, 1,
-0.4047185, -1.208252, -3.633385, 1, 0, 0, 1, 1,
-0.4012622, -1.337745, -3.778592, 1, 0, 0, 1, 1,
-0.4004119, -1.633059, -3.610896, 1, 0, 0, 1, 1,
-0.3959269, -0.06567552, -2.859923, 1, 0, 0, 1, 1,
-0.3947723, 2.263019, -0.3325493, 1, 0, 0, 1, 1,
-0.3894813, -0.4299805, -3.160365, 0, 0, 0, 1, 1,
-0.3854778, 0.3291263, -1.097831, 0, 0, 0, 1, 1,
-0.3852848, 0.2463705, -0.994969, 0, 0, 0, 1, 1,
-0.3797329, 1.120301, 0.6152353, 0, 0, 0, 1, 1,
-0.3758764, -0.31958, -0.916782, 0, 0, 0, 1, 1,
-0.3729689, 0.5089161, -0.5780588, 0, 0, 0, 1, 1,
-0.3701744, -0.4798352, -1.690898, 0, 0, 0, 1, 1,
-0.3694387, -0.9224216, -2.314899, 1, 1, 1, 1, 1,
-0.3653424, 1.334402, -0.6885837, 1, 1, 1, 1, 1,
-0.3650876, -0.3888638, -1.697746, 1, 1, 1, 1, 1,
-0.3626233, 1.539359, 0.186892, 1, 1, 1, 1, 1,
-0.357322, -1.461848, -2.269089, 1, 1, 1, 1, 1,
-0.3557706, -0.7631543, -2.657109, 1, 1, 1, 1, 1,
-0.3524297, -1.219316, -3.838039, 1, 1, 1, 1, 1,
-0.3457547, 0.004425613, 0.1967838, 1, 1, 1, 1, 1,
-0.3438797, -0.4947396, -3.279923, 1, 1, 1, 1, 1,
-0.343674, 1.233014, -1.483845, 1, 1, 1, 1, 1,
-0.3394093, 0.6084679, 0.1737327, 1, 1, 1, 1, 1,
-0.3392547, -1.993768, -4.669376, 1, 1, 1, 1, 1,
-0.3387062, 0.5357869, 1.168296, 1, 1, 1, 1, 1,
-0.3351569, 0.6699012, 0.2200836, 1, 1, 1, 1, 1,
-0.3330321, -1.08708, -2.212677, 1, 1, 1, 1, 1,
-0.3327073, 1.646399, 0.08053932, 0, 0, 1, 1, 1,
-0.3307801, 0.09899363, -1.146386, 1, 0, 0, 1, 1,
-0.3290851, 1.720052, -0.9531935, 1, 0, 0, 1, 1,
-0.3256339, 1.137152, 0.4395751, 1, 0, 0, 1, 1,
-0.3241298, 1.027646, -0.5569195, 1, 0, 0, 1, 1,
-0.324124, 0.542985, -0.9972467, 1, 0, 0, 1, 1,
-0.3228146, 1.72157, -1.122228, 0, 0, 0, 1, 1,
-0.3180033, 1.205437, -0.4659143, 0, 0, 0, 1, 1,
-0.3170122, -0.2467171, -0.1299593, 0, 0, 0, 1, 1,
-0.3127434, -0.7442375, -2.325775, 0, 0, 0, 1, 1,
-0.3058443, -0.4635372, -3.593182, 0, 0, 0, 1, 1,
-0.3048429, 0.1182748, -0.4351603, 0, 0, 0, 1, 1,
-0.2976113, 0.9180591, -2.286702, 0, 0, 0, 1, 1,
-0.2897139, -0.6116523, -3.380138, 1, 1, 1, 1, 1,
-0.2887099, 1.376716, 0.2174629, 1, 1, 1, 1, 1,
-0.2841792, -0.5116345, -3.138322, 1, 1, 1, 1, 1,
-0.2826564, 1.008696, -0.0813519, 1, 1, 1, 1, 1,
-0.2790048, -0.04655672, -1.930645, 1, 1, 1, 1, 1,
-0.2781851, -1.540027, -4.017045, 1, 1, 1, 1, 1,
-0.2773549, 0.6570561, -0.9583694, 1, 1, 1, 1, 1,
-0.2725291, 0.3262518, -1.981899, 1, 1, 1, 1, 1,
-0.2699381, -0.9317341, -3.034428, 1, 1, 1, 1, 1,
-0.2674157, -0.5512968, -3.363358, 1, 1, 1, 1, 1,
-0.2646898, 0.3399647, -1.02334, 1, 1, 1, 1, 1,
-0.2594264, 0.4072744, 0.9553568, 1, 1, 1, 1, 1,
-0.2580658, 0.676745, 1.058939, 1, 1, 1, 1, 1,
-0.2548605, -0.07166806, -2.600465, 1, 1, 1, 1, 1,
-0.246687, 0.8876665, -0.506866, 1, 1, 1, 1, 1,
-0.2454551, 1.05829, -0.366844, 0, 0, 1, 1, 1,
-0.2407065, -0.4570666, -3.881857, 1, 0, 0, 1, 1,
-0.2348929, -0.5015715, -3.750298, 1, 0, 0, 1, 1,
-0.2335719, 0.8556666, 0.08367395, 1, 0, 0, 1, 1,
-0.2184924, 0.5249693, 0.6331074, 1, 0, 0, 1, 1,
-0.2178056, -0.5152342, -1.621584, 1, 0, 0, 1, 1,
-0.2143582, -0.2444769, -2.76149, 0, 0, 0, 1, 1,
-0.2130855, 2.463236, -0.6112719, 0, 0, 0, 1, 1,
-0.2105769, 0.1284288, 0.1286716, 0, 0, 0, 1, 1,
-0.2091099, 0.4890187, -0.9990994, 0, 0, 0, 1, 1,
-0.207561, -0.6800353, -2.463619, 0, 0, 0, 1, 1,
-0.2073772, 0.5182688, 0.2621968, 0, 0, 0, 1, 1,
-0.2073214, 1.017062, -1.297216, 0, 0, 0, 1, 1,
-0.2023769, 1.20792, 0.05468299, 1, 1, 1, 1, 1,
-0.1999866, -0.8566236, -1.187695, 1, 1, 1, 1, 1,
-0.1998484, -1.836957, -3.846562, 1, 1, 1, 1, 1,
-0.1947041, -1.552565, -4.318624, 1, 1, 1, 1, 1,
-0.1944287, -0.7147664, -2.73279, 1, 1, 1, 1, 1,
-0.1929558, -0.3587621, -3.783734, 1, 1, 1, 1, 1,
-0.1917161, -1.671181, -3.781474, 1, 1, 1, 1, 1,
-0.189476, -1.191736, -4.562877, 1, 1, 1, 1, 1,
-0.189253, -1.035519, -6.461616, 1, 1, 1, 1, 1,
-0.1882233, 0.5579359, 1.780091, 1, 1, 1, 1, 1,
-0.1865287, 0.4892161, 1.284704, 1, 1, 1, 1, 1,
-0.1854642, -0.8291208, -2.612777, 1, 1, 1, 1, 1,
-0.1852514, 1.740424, 0.614688, 1, 1, 1, 1, 1,
-0.181035, -0.08212892, -1.984398, 1, 1, 1, 1, 1,
-0.1788269, 1.023557, 0.3524882, 1, 1, 1, 1, 1,
-0.1769165, -1.96721, -3.753386, 0, 0, 1, 1, 1,
-0.176349, 1.133149, 0.4542137, 1, 0, 0, 1, 1,
-0.175977, 1.086873, -0.8307421, 1, 0, 0, 1, 1,
-0.1740219, 0.1155165, -1.415287, 1, 0, 0, 1, 1,
-0.1734359, 1.138644, 0.7209535, 1, 0, 0, 1, 1,
-0.1721307, 0.9583467, -0.4246713, 1, 0, 0, 1, 1,
-0.1689129, -0.2841418, -3.600194, 0, 0, 0, 1, 1,
-0.1660677, -0.3320287, -1.048571, 0, 0, 0, 1, 1,
-0.1616285, 1.230589, -1.952702, 0, 0, 0, 1, 1,
-0.1583187, 0.9538022, 0.2518451, 0, 0, 0, 1, 1,
-0.1550607, 1.080136, -1.392862, 0, 0, 0, 1, 1,
-0.1507023, -0.04229392, -3.054322, 0, 0, 0, 1, 1,
-0.1465678, 0.5754246, -1.32978, 0, 0, 0, 1, 1,
-0.1459757, -1.303441, -4.125592, 1, 1, 1, 1, 1,
-0.1452521, -2.067208, -0.5838066, 1, 1, 1, 1, 1,
-0.1432061, -1.582833, -3.442173, 1, 1, 1, 1, 1,
-0.1365683, -0.4402278, -3.674431, 1, 1, 1, 1, 1,
-0.136563, 0.668996, 0.5360361, 1, 1, 1, 1, 1,
-0.1311067, -0.9937323, -2.593898, 1, 1, 1, 1, 1,
-0.1296519, -1.560925, -3.353166, 1, 1, 1, 1, 1,
-0.1226999, 1.440129, 1.244921, 1, 1, 1, 1, 1,
-0.1223831, -0.4359286, -3.889817, 1, 1, 1, 1, 1,
-0.1194825, -0.8204015, -2.574188, 1, 1, 1, 1, 1,
-0.1178455, -0.6222498, -3.536887, 1, 1, 1, 1, 1,
-0.1128592, 0.3002103, 0.1726277, 1, 1, 1, 1, 1,
-0.1078173, -0.2953949, -2.826626, 1, 1, 1, 1, 1,
-0.1070944, 0.03611844, -1.489907, 1, 1, 1, 1, 1,
-0.1045207, 0.09586823, 0.958733, 1, 1, 1, 1, 1,
-0.1024767, -0.7464134, -2.907949, 0, 0, 1, 1, 1,
-0.10071, -0.1167584, -1.913321, 1, 0, 0, 1, 1,
-0.09706599, -1.491634, -4.490129, 1, 0, 0, 1, 1,
-0.09601298, -0.5146052, -2.8232, 1, 0, 0, 1, 1,
-0.0949888, -0.9914595, -3.10114, 1, 0, 0, 1, 1,
-0.09329942, -0.4941859, -2.937526, 1, 0, 0, 1, 1,
-0.08715476, -1.111733, -2.067269, 0, 0, 0, 1, 1,
-0.085991, -1.04, -3.590389, 0, 0, 0, 1, 1,
-0.08298544, -0.5208785, -1.33636, 0, 0, 0, 1, 1,
-0.07893437, -0.8245722, -2.359313, 0, 0, 0, 1, 1,
-0.07802314, -0.8410382, -3.09306, 0, 0, 0, 1, 1,
-0.07445154, -1.825136, -2.692898, 0, 0, 0, 1, 1,
-0.07345816, -3.313525, -2.185779, 0, 0, 0, 1, 1,
-0.07171661, 0.6298861, -0.4351594, 1, 1, 1, 1, 1,
-0.07061486, -0.7828724, -0.5253642, 1, 1, 1, 1, 1,
-0.06501802, 1.144925, -0.2474334, 1, 1, 1, 1, 1,
-0.06347419, -0.9912567, -2.158515, 1, 1, 1, 1, 1,
-0.06203622, -0.3974342, -6.746324, 1, 1, 1, 1, 1,
-0.06131225, -1.192659, -2.918151, 1, 1, 1, 1, 1,
-0.06047038, 0.9299874, -0.2354132, 1, 1, 1, 1, 1,
-0.05469708, 0.1394799, -1.986313, 1, 1, 1, 1, 1,
-0.05411458, -0.2118699, -2.689658, 1, 1, 1, 1, 1,
-0.05162312, 0.9114726, -0.427662, 1, 1, 1, 1, 1,
-0.05151542, 0.7013915, 0.05796838, 1, 1, 1, 1, 1,
-0.0510217, 0.4923564, -0.2439551, 1, 1, 1, 1, 1,
-0.05057053, 0.003960319, -3.371501, 1, 1, 1, 1, 1,
-0.05042889, -1.11515, -0.8449754, 1, 1, 1, 1, 1,
-0.04760098, -1.490027, -4.890706, 1, 1, 1, 1, 1,
-0.04507137, 0.5585335, 0.1025906, 0, 0, 1, 1, 1,
-0.04293632, 1.548985, 0.9583258, 1, 0, 0, 1, 1,
-0.04225704, -2.68564, -2.930035, 1, 0, 0, 1, 1,
-0.03948228, 0.7705075, -0.2330527, 1, 0, 0, 1, 1,
-0.036617, -1.800373, -2.435111, 1, 0, 0, 1, 1,
-0.03455472, 0.8168246, -0.8611579, 1, 0, 0, 1, 1,
-0.03031348, 0.8419865, 0.8349816, 0, 0, 0, 1, 1,
-0.02798971, -0.2460391, -3.942245, 0, 0, 0, 1, 1,
-0.02623114, 0.936528, 0.1482524, 0, 0, 0, 1, 1,
-0.02578815, 0.5162311, 0.9007774, 0, 0, 0, 1, 1,
-0.02396315, 1.649276, -1.336453, 0, 0, 0, 1, 1,
-0.02171766, 2.666106, -1.501346, 0, 0, 0, 1, 1,
-0.01424435, 0.6161432, -0.1111561, 0, 0, 0, 1, 1,
-0.01346111, -2.015933, -2.8386, 1, 1, 1, 1, 1,
-0.008534519, -0.5842821, -4.496571, 1, 1, 1, 1, 1,
-0.003620516, -0.4999469, -2.896085, 1, 1, 1, 1, 1,
-0.003492796, -1.203226, -3.243231, 1, 1, 1, 1, 1,
-0.001408128, 0.485074, -1.33294, 1, 1, 1, 1, 1,
0.003039195, 0.1845349, 0.8897501, 1, 1, 1, 1, 1,
0.004822723, -1.032554, 2.076601, 1, 1, 1, 1, 1,
0.005591681, -0.4636029, 1.990984, 1, 1, 1, 1, 1,
0.008562039, 1.182416, -0.3494014, 1, 1, 1, 1, 1,
0.01151387, 1.313723, 0.4167054, 1, 1, 1, 1, 1,
0.01425698, -1.018543, 4.54941, 1, 1, 1, 1, 1,
0.01703153, -0.9565259, 2.866897, 1, 1, 1, 1, 1,
0.0184163, 0.2864512, 0.4330064, 1, 1, 1, 1, 1,
0.01862982, 0.4738477, 1.090953, 1, 1, 1, 1, 1,
0.01904605, -0.6850428, 2.93748, 1, 1, 1, 1, 1,
0.02039263, -0.3678661, 1.635936, 0, 0, 1, 1, 1,
0.02361423, -0.3592965, 2.552409, 1, 0, 0, 1, 1,
0.023985, -0.9258537, 1.627339, 1, 0, 0, 1, 1,
0.02854812, 0.1549816, -1.077871, 1, 0, 0, 1, 1,
0.03077017, -0.8176031, 1.704625, 1, 0, 0, 1, 1,
0.03201289, 0.05432819, -1.226961, 1, 0, 0, 1, 1,
0.03975856, 0.1237551, 0.2322921, 0, 0, 0, 1, 1,
0.04189926, 0.46457, -1.973792, 0, 0, 0, 1, 1,
0.0438243, -1.529999, 4.541771, 0, 0, 0, 1, 1,
0.04390963, 0.2126085, 0.25612, 0, 0, 0, 1, 1,
0.05311652, 1.395722, -0.45409, 0, 0, 0, 1, 1,
0.05676468, 1.49111, 1.799039, 0, 0, 0, 1, 1,
0.05779557, 0.01279887, 0.9034752, 0, 0, 0, 1, 1,
0.0599203, 1.419138, -1.543207, 1, 1, 1, 1, 1,
0.06226732, 1.44504, 0.5750344, 1, 1, 1, 1, 1,
0.06602363, 0.9138433, 1.571911, 1, 1, 1, 1, 1,
0.07383814, 0.1310946, 0.3901714, 1, 1, 1, 1, 1,
0.07747883, 0.08223937, 2.88302, 1, 1, 1, 1, 1,
0.07926652, -0.849333, 4.005437, 1, 1, 1, 1, 1,
0.08477376, 0.4182801, -0.3734871, 1, 1, 1, 1, 1,
0.08595438, 0.259188, -0.7963127, 1, 1, 1, 1, 1,
0.08736695, -0.9079189, 3.592732, 1, 1, 1, 1, 1,
0.09364318, 0.04542878, 0.0082388, 1, 1, 1, 1, 1,
0.09370001, 0.8282713, -0.08914623, 1, 1, 1, 1, 1,
0.09476597, 0.08612488, 0.8533518, 1, 1, 1, 1, 1,
0.09905722, 0.6947921, 2.119331, 1, 1, 1, 1, 1,
0.09959593, 0.9460934, -0.7680532, 1, 1, 1, 1, 1,
0.09995721, 0.4160211, -0.2152507, 1, 1, 1, 1, 1,
0.1008473, -0.09695505, 1.126784, 0, 0, 1, 1, 1,
0.1040487, 2.458565, 0.483967, 1, 0, 0, 1, 1,
0.119701, -1.855351, 3.047369, 1, 0, 0, 1, 1,
0.1219715, -0.02889639, 1.414003, 1, 0, 0, 1, 1,
0.1237763, -0.4632176, 1.591238, 1, 0, 0, 1, 1,
0.1360762, 0.3650698, 0.3732875, 1, 0, 0, 1, 1,
0.138578, -0.4268321, 2.55922, 0, 0, 0, 1, 1,
0.1413857, 1.318216, 1.222644, 0, 0, 0, 1, 1,
0.1430354, -0.02588902, 3.055041, 0, 0, 0, 1, 1,
0.1443937, -0.3020649, 2.437127, 0, 0, 0, 1, 1,
0.1445618, -0.7406741, 5.953206, 0, 0, 0, 1, 1,
0.1447635, -0.6748143, 3.978016, 0, 0, 0, 1, 1,
0.1457487, -0.7772501, 4.7343, 0, 0, 0, 1, 1,
0.155897, 1.016775, -0.1393275, 1, 1, 1, 1, 1,
0.1563816, -1.50634, 4.129473, 1, 1, 1, 1, 1,
0.1578275, 2.764364, -0.9513476, 1, 1, 1, 1, 1,
0.1595035, 0.9014078, 1.071602, 1, 1, 1, 1, 1,
0.1612335, -0.4500425, 3.226467, 1, 1, 1, 1, 1,
0.1628842, -0.1952602, 0.7189246, 1, 1, 1, 1, 1,
0.1660095, 0.2636474, -0.6009927, 1, 1, 1, 1, 1,
0.1671466, 0.2258511, 1.653214, 1, 1, 1, 1, 1,
0.169286, 0.05715118, 0.3567076, 1, 1, 1, 1, 1,
0.1694463, 1.566888, -1.119376, 1, 1, 1, 1, 1,
0.1714915, -0.7331604, 0.9535783, 1, 1, 1, 1, 1,
0.1741157, -0.6809831, 2.225836, 1, 1, 1, 1, 1,
0.1752531, -1.738052, 2.639393, 1, 1, 1, 1, 1,
0.1756431, 0.6464537, 2.03365, 1, 1, 1, 1, 1,
0.1809437, 1.002728, 0.7298981, 1, 1, 1, 1, 1,
0.1839643, 0.2669432, 0.5148667, 0, 0, 1, 1, 1,
0.1859482, 2.008939, 0.5592966, 1, 0, 0, 1, 1,
0.1983868, 0.2074059, 1.353636, 1, 0, 0, 1, 1,
0.1991808, -1.859449, 3.465267, 1, 0, 0, 1, 1,
0.2026093, 0.7693326, -1.319039, 1, 0, 0, 1, 1,
0.2038014, -1.607693, 1.734569, 1, 0, 0, 1, 1,
0.2058968, 0.9517322, 0.02172537, 0, 0, 0, 1, 1,
0.2060602, -0.9773253, 2.87935, 0, 0, 0, 1, 1,
0.2074371, -1.345881, 4.616334, 0, 0, 0, 1, 1,
0.2077031, 1.288415, -0.627281, 0, 0, 0, 1, 1,
0.2089368, -0.3789543, 3.276699, 0, 0, 0, 1, 1,
0.2140013, -0.2595191, 3.378675, 0, 0, 0, 1, 1,
0.2194133, -2.317423, 4.003418, 0, 0, 0, 1, 1,
0.2205624, 1.641896, 0.8722506, 1, 1, 1, 1, 1,
0.2212086, -0.1152596, 2.276867, 1, 1, 1, 1, 1,
0.2223774, 0.6216803, -0.244786, 1, 1, 1, 1, 1,
0.2225558, 1.595424, -0.7203034, 1, 1, 1, 1, 1,
0.2237785, 0.1947067, 0.9159912, 1, 1, 1, 1, 1,
0.225886, 1.513971, -0.7265252, 1, 1, 1, 1, 1,
0.2271291, 0.1216023, 0.5735227, 1, 1, 1, 1, 1,
0.2304958, 0.2184011, 1.049687, 1, 1, 1, 1, 1,
0.231225, -1.476526, 2.372704, 1, 1, 1, 1, 1,
0.2339446, 0.9981253, 0.09999398, 1, 1, 1, 1, 1,
0.2346189, 1.613272, -0.01807372, 1, 1, 1, 1, 1,
0.2384194, -0.8656587, 3.972375, 1, 1, 1, 1, 1,
0.2409348, 1.7203, 0.6159161, 1, 1, 1, 1, 1,
0.2411491, -0.9026185, 2.845725, 1, 1, 1, 1, 1,
0.2482293, 0.1005497, 1.438325, 1, 1, 1, 1, 1,
0.2489878, 0.3102678, 1.911262, 0, 0, 1, 1, 1,
0.2513168, -0.2283068, 2.870325, 1, 0, 0, 1, 1,
0.2521002, 0.08528498, 1.364321, 1, 0, 0, 1, 1,
0.2551414, 0.8018876, 0.6392993, 1, 0, 0, 1, 1,
0.2609922, 0.5369418, -1.125805, 1, 0, 0, 1, 1,
0.2637318, -1.173546, 3.750431, 1, 0, 0, 1, 1,
0.2681719, 1.522899, -0.02419237, 0, 0, 0, 1, 1,
0.2685409, 0.02627932, 3.289392, 0, 0, 0, 1, 1,
0.2774482, -0.2234033, 4.546498, 0, 0, 0, 1, 1,
0.2788346, -0.9574499, 2.378024, 0, 0, 0, 1, 1,
0.2792116, -1.603182, 2.039676, 0, 0, 0, 1, 1,
0.2806491, -1.092408, 3.980832, 0, 0, 0, 1, 1,
0.2820106, 0.1368762, 2.177351, 0, 0, 0, 1, 1,
0.2835452, 0.872429, 1.609392, 1, 1, 1, 1, 1,
0.2859329, -0.1520016, 2.297176, 1, 1, 1, 1, 1,
0.2860013, 1.585754, 0.3444679, 1, 1, 1, 1, 1,
0.2919988, -0.2765341, 3.451301, 1, 1, 1, 1, 1,
0.3015092, -1.735439, 4.031417, 1, 1, 1, 1, 1,
0.3050162, 1.831749, 2.28715, 1, 1, 1, 1, 1,
0.3060375, 0.8935232, 1.008269, 1, 1, 1, 1, 1,
0.3085238, 0.5815209, 1.206654, 1, 1, 1, 1, 1,
0.3096532, -0.2114087, 2.268068, 1, 1, 1, 1, 1,
0.3099775, -0.02928815, 1.709671, 1, 1, 1, 1, 1,
0.3125863, -1.441565, 3.104048, 1, 1, 1, 1, 1,
0.3144242, 2.472391, -0.6673003, 1, 1, 1, 1, 1,
0.3145041, -0.9977521, 4.212416, 1, 1, 1, 1, 1,
0.3172345, 0.3247439, 1.709855, 1, 1, 1, 1, 1,
0.3193654, -1.116928, 2.634105, 1, 1, 1, 1, 1,
0.3241457, 1.04783, -0.2315457, 0, 0, 1, 1, 1,
0.3419545, -1.329063, 2.32489, 1, 0, 0, 1, 1,
0.3494083, 0.07111164, 3.158037, 1, 0, 0, 1, 1,
0.3507594, 1.017659, -0.840649, 1, 0, 0, 1, 1,
0.353607, -0.09917444, 3.602032, 1, 0, 0, 1, 1,
0.3544489, -1.336894, 5.827071, 1, 0, 0, 1, 1,
0.356475, -0.3958679, 5.49102, 0, 0, 0, 1, 1,
0.363901, 1.794777, 0.9069722, 0, 0, 0, 1, 1,
0.365079, 0.9523267, -1.242932, 0, 0, 0, 1, 1,
0.3662339, 0.03216162, 0.6329315, 0, 0, 0, 1, 1,
0.3674499, -1.625511, 1.653286, 0, 0, 0, 1, 1,
0.3701707, 1.580741, 0.4424879, 0, 0, 0, 1, 1,
0.3720597, -0.9626253, 4.965543, 0, 0, 0, 1, 1,
0.3756059, -1.773948, 4.571713, 1, 1, 1, 1, 1,
0.3766277, 0.2098251, 1.583062, 1, 1, 1, 1, 1,
0.3768599, 0.6389428, -1.740919, 1, 1, 1, 1, 1,
0.3782013, -0.7437513, 1.324521, 1, 1, 1, 1, 1,
0.3811439, 1.90563, 0.3100604, 1, 1, 1, 1, 1,
0.383006, -0.5744234, 2.389757, 1, 1, 1, 1, 1,
0.3848314, 0.06138489, 0.6743891, 1, 1, 1, 1, 1,
0.3871942, -0.8333757, 3.024226, 1, 1, 1, 1, 1,
0.396217, -0.2967781, 3.716102, 1, 1, 1, 1, 1,
0.3974159, -0.6761496, 3.392986, 1, 1, 1, 1, 1,
0.4016468, 2.151264, 1.996016, 1, 1, 1, 1, 1,
0.4033575, -1.555679, 2.971173, 1, 1, 1, 1, 1,
0.4047601, -0.1245624, 2.635339, 1, 1, 1, 1, 1,
0.4074827, -0.8886194, 2.143839, 1, 1, 1, 1, 1,
0.4083451, 0.7483476, -1.152025, 1, 1, 1, 1, 1,
0.4108303, -0.3753715, 1.041694, 0, 0, 1, 1, 1,
0.4201336, -0.7452404, 3.896234, 1, 0, 0, 1, 1,
0.4209938, 3.186401, -0.4445012, 1, 0, 0, 1, 1,
0.4260825, -1.507434, 3.725777, 1, 0, 0, 1, 1,
0.431664, 0.8828272, 1.364087, 1, 0, 0, 1, 1,
0.4318685, -0.1183471, 2.454025, 1, 0, 0, 1, 1,
0.4323724, -1.469256, 2.602636, 0, 0, 0, 1, 1,
0.4334136, -0.8013442, 2.54788, 0, 0, 0, 1, 1,
0.4340488, 0.5310245, 2.98499, 0, 0, 0, 1, 1,
0.4366001, -1.582657, 2.243219, 0, 0, 0, 1, 1,
0.4367075, 0.1401794, 0.8714203, 0, 0, 0, 1, 1,
0.4384778, -0.5363798, 1.345948, 0, 0, 0, 1, 1,
0.4433845, 0.5784463, 0.1831056, 0, 0, 0, 1, 1,
0.4439046, 0.1003736, 3.457753, 1, 1, 1, 1, 1,
0.4457335, -0.02806127, 3.199926, 1, 1, 1, 1, 1,
0.4477643, 1.952522, 0.1219116, 1, 1, 1, 1, 1,
0.4568774, -0.4790336, 3.06114, 1, 1, 1, 1, 1,
0.45811, 0.1190958, 1.621199, 1, 1, 1, 1, 1,
0.4603267, -0.3235568, 2.268315, 1, 1, 1, 1, 1,
0.464297, 0.2610267, 2.045751, 1, 1, 1, 1, 1,
0.4647314, 1.149913, 0.6384371, 1, 1, 1, 1, 1,
0.4652102, 1.189275, 0.4163303, 1, 1, 1, 1, 1,
0.4686113, 1.213411, 1.090569, 1, 1, 1, 1, 1,
0.469424, -1.207395, 2.306268, 1, 1, 1, 1, 1,
0.4710118, 0.7111652, 2.215259, 1, 1, 1, 1, 1,
0.473285, -1.489778, 3.451175, 1, 1, 1, 1, 1,
0.4775214, -1.528538, 1.184227, 1, 1, 1, 1, 1,
0.4828697, -0.6068568, 2.574163, 1, 1, 1, 1, 1,
0.4922292, 0.05584201, 1.509646, 0, 0, 1, 1, 1,
0.4927758, 1.616331, 0.4238444, 1, 0, 0, 1, 1,
0.4928978, -0.3919885, 3.253531, 1, 0, 0, 1, 1,
0.5049982, -1.126943, 2.557847, 1, 0, 0, 1, 1,
0.5110301, 2.789468, -0.4099093, 1, 0, 0, 1, 1,
0.5166604, -0.9683556, 0.7758648, 1, 0, 0, 1, 1,
0.521562, 1.96076, 0.6283131, 0, 0, 0, 1, 1,
0.5234727, 0.5606306, 0.8449472, 0, 0, 0, 1, 1,
0.5247489, 0.3326833, 1.746865, 0, 0, 0, 1, 1,
0.5254605, -0.01355895, 1.221694, 0, 0, 0, 1, 1,
0.5291825, 0.7947964, 1.155259, 0, 0, 0, 1, 1,
0.5335165, 1.710893, -0.8638197, 0, 0, 0, 1, 1,
0.5404518, 1.420942, -0.380426, 0, 0, 0, 1, 1,
0.5430757, 0.5724361, 1.235778, 1, 1, 1, 1, 1,
0.5449077, -0.4286193, 1.304677, 1, 1, 1, 1, 1,
0.5510771, 0.6167282, 0.2162492, 1, 1, 1, 1, 1,
0.5521168, 0.3904625, 0.866299, 1, 1, 1, 1, 1,
0.5532154, 0.3222459, 1.388633, 1, 1, 1, 1, 1,
0.5564403, -0.9221621, 2.648272, 1, 1, 1, 1, 1,
0.5565383, 0.7147319, 1.40147, 1, 1, 1, 1, 1,
0.5665185, -2.120726, 4.355048, 1, 1, 1, 1, 1,
0.5713655, 1.006797, 1.904137, 1, 1, 1, 1, 1,
0.5749173, -2.007292, 1.404362, 1, 1, 1, 1, 1,
0.5749657, -0.6025749, 1.379812, 1, 1, 1, 1, 1,
0.5779698, 1.027877, 0.9613279, 1, 1, 1, 1, 1,
0.5788484, 0.6699345, -0.02340489, 1, 1, 1, 1, 1,
0.5792093, 0.1270625, -0.1883092, 1, 1, 1, 1, 1,
0.5876752, -0.3986405, 2.888794, 1, 1, 1, 1, 1,
0.590831, -1.432745, 2.581203, 0, 0, 1, 1, 1,
0.5908819, 0.1295327, 2.441535, 1, 0, 0, 1, 1,
0.5914375, -0.8749226, 3.939925, 1, 0, 0, 1, 1,
0.5920557, -0.1641426, 2.283015, 1, 0, 0, 1, 1,
0.5969662, 1.243349, 1.873205, 1, 0, 0, 1, 1,
0.5989856, -0.1589611, 0.2884029, 1, 0, 0, 1, 1,
0.5993385, 0.6053955, -0.3988171, 0, 0, 0, 1, 1,
0.6035883, -1.762793, 1.41667, 0, 0, 0, 1, 1,
0.604216, -1.046922, 2.71549, 0, 0, 0, 1, 1,
0.6071976, -0.5858676, 2.510012, 0, 0, 0, 1, 1,
0.6094614, -1.274523, 1.324967, 0, 0, 0, 1, 1,
0.6099143, 1.764024, 1.0005, 0, 0, 0, 1, 1,
0.6109633, -1.5932, 2.72453, 0, 0, 0, 1, 1,
0.6163464, -0.268454, 1.593071, 1, 1, 1, 1, 1,
0.6176031, 1.672731, -0.6677353, 1, 1, 1, 1, 1,
0.6209588, -0.09556562, 1.604032, 1, 1, 1, 1, 1,
0.6257516, 0.5141789, 1.110746, 1, 1, 1, 1, 1,
0.6263247, -0.6047394, 0.7522449, 1, 1, 1, 1, 1,
0.6271023, 0.002015699, 1.370829, 1, 1, 1, 1, 1,
0.6304725, -2.148129, 3.483019, 1, 1, 1, 1, 1,
0.633103, 0.9535906, 1.792054, 1, 1, 1, 1, 1,
0.6410396, -0.1536149, 0.9860062, 1, 1, 1, 1, 1,
0.6512009, -0.3514242, 2.525832, 1, 1, 1, 1, 1,
0.6570304, -0.1803264, 2.367244, 1, 1, 1, 1, 1,
0.6590476, -0.2465525, 0.5396944, 1, 1, 1, 1, 1,
0.6598674, 1.504579, -1.01747, 1, 1, 1, 1, 1,
0.6688371, -0.9199819, 3.660885, 1, 1, 1, 1, 1,
0.6722693, 0.08228257, 0.4828714, 1, 1, 1, 1, 1,
0.6735837, -0.07213096, 0.7057587, 0, 0, 1, 1, 1,
0.6800643, 0.1579924, 0.6985, 1, 0, 0, 1, 1,
0.6809531, 0.1724733, -0.3939408, 1, 0, 0, 1, 1,
0.682371, -0.4389548, 2.466642, 1, 0, 0, 1, 1,
0.6881747, -1.051077, 2.134823, 1, 0, 0, 1, 1,
0.6885429, -0.5415314, 1.018874, 1, 0, 0, 1, 1,
0.6915554, 0.7240061, 0.121667, 0, 0, 0, 1, 1,
0.7010015, -1.588112, 0.5068004, 0, 0, 0, 1, 1,
0.7057743, -0.7492595, 2.387043, 0, 0, 0, 1, 1,
0.705908, 0.7897733, 1.055655, 0, 0, 0, 1, 1,
0.7076399, 0.5076358, 1.129627, 0, 0, 0, 1, 1,
0.7129894, 0.1273722, 2.242128, 0, 0, 0, 1, 1,
0.7136232, 0.02353786, 1.72957, 0, 0, 0, 1, 1,
0.71433, -1.534622, 4.050989, 1, 1, 1, 1, 1,
0.7221971, 0.1117555, -0.8813938, 1, 1, 1, 1, 1,
0.7248294, 0.08117017, 1.866849, 1, 1, 1, 1, 1,
0.7281435, -0.673126, 3.250569, 1, 1, 1, 1, 1,
0.7310369, -1.783343, 3.383073, 1, 1, 1, 1, 1,
0.7326566, -0.3550643, 1.823063, 1, 1, 1, 1, 1,
0.733727, -0.4649177, 0.7052656, 1, 1, 1, 1, 1,
0.7345444, -0.4671107, 4.287354, 1, 1, 1, 1, 1,
0.7349502, 1.032246, -1.433312, 1, 1, 1, 1, 1,
0.7351378, 0.1254743, 0.6378778, 1, 1, 1, 1, 1,
0.7481684, 1.479408, 2.214161, 1, 1, 1, 1, 1,
0.7488665, 1.055629, 0.8015351, 1, 1, 1, 1, 1,
0.7492108, 0.5642092, 2.079861, 1, 1, 1, 1, 1,
0.7555029, 1.372777, -0.03398456, 1, 1, 1, 1, 1,
0.7559476, 0.4438337, 2.710501, 1, 1, 1, 1, 1,
0.7594404, -1.139802, 2.102158, 0, 0, 1, 1, 1,
0.76164, -0.5240504, 3.976852, 1, 0, 0, 1, 1,
0.7620556, -0.1190195, 1.24417, 1, 0, 0, 1, 1,
0.7637494, 1.334746, 0.5272123, 1, 0, 0, 1, 1,
0.76518, -0.07183013, 0.9632831, 1, 0, 0, 1, 1,
0.7653813, -1.176268, 3.038482, 1, 0, 0, 1, 1,
0.7655015, 0.9048674, 1.478007, 0, 0, 0, 1, 1,
0.7737105, 0.06926323, -1.498542, 0, 0, 0, 1, 1,
0.7780924, 0.4923287, 0.786674, 0, 0, 0, 1, 1,
0.7784865, -0.6948415, 0.825296, 0, 0, 0, 1, 1,
0.7788002, -0.8290452, 1.436436, 0, 0, 0, 1, 1,
0.7798704, 0.02255402, 1.155636, 0, 0, 0, 1, 1,
0.7805163, 0.01703255, 2.652398, 0, 0, 0, 1, 1,
0.7819483, 0.1086171, 2.849091, 1, 1, 1, 1, 1,
0.8018711, -0.9472856, 1.426567, 1, 1, 1, 1, 1,
0.8024989, 2.094343, 1.408841, 1, 1, 1, 1, 1,
0.8126855, -0.4140546, 0.5512072, 1, 1, 1, 1, 1,
0.8127319, 0.2937083, 1.888148, 1, 1, 1, 1, 1,
0.8160211, -1.24759, 3.224122, 1, 1, 1, 1, 1,
0.8170671, -0.6057365, 2.611753, 1, 1, 1, 1, 1,
0.8241647, 0.9971504, 0.6060277, 1, 1, 1, 1, 1,
0.826324, 1.117698, 1.780655, 1, 1, 1, 1, 1,
0.8308867, -0.5732177, 3.488465, 1, 1, 1, 1, 1,
0.8320414, 1.169578, 1.568879, 1, 1, 1, 1, 1,
0.8324746, -0.3828242, 2.776517, 1, 1, 1, 1, 1,
0.8373957, 0.7853181, 1.532786, 1, 1, 1, 1, 1,
0.8453806, -0.9983096, 1.870835, 1, 1, 1, 1, 1,
0.8527948, 0.2067447, -0.8791973, 1, 1, 1, 1, 1,
0.8533059, -0.9993232, 3.250342, 0, 0, 1, 1, 1,
0.8589494, 1.964005, 0.1914985, 1, 0, 0, 1, 1,
0.8633868, 1.126184, 1.863519, 1, 0, 0, 1, 1,
0.8649325, 0.1880694, -0.3067091, 1, 0, 0, 1, 1,
0.8669007, 0.957477, 2.727577, 1, 0, 0, 1, 1,
0.8689685, -0.1436629, 0.6711905, 1, 0, 0, 1, 1,
0.8758938, -0.0211902, 1.617446, 0, 0, 0, 1, 1,
0.8817802, -0.2850684, 0.8569048, 0, 0, 0, 1, 1,
0.8834634, -0.8191999, 3.060758, 0, 0, 0, 1, 1,
0.8844641, -0.1447582, -0.09964683, 0, 0, 0, 1, 1,
0.8848941, -0.7681382, 1.386424, 0, 0, 0, 1, 1,
0.8958065, 0.1885736, 1.863273, 0, 0, 0, 1, 1,
0.9066858, 0.02797176, 1.157892, 0, 0, 0, 1, 1,
0.90975, 0.4792524, 0.3737106, 1, 1, 1, 1, 1,
0.9099938, -0.3913212, 1.475244, 1, 1, 1, 1, 1,
0.9118832, 1.679969, 0.6357799, 1, 1, 1, 1, 1,
0.9142624, 0.6101365, -0.7887385, 1, 1, 1, 1, 1,
0.9143624, 0.4229074, 0.0918223, 1, 1, 1, 1, 1,
0.9150528, 0.3179964, 1.707522, 1, 1, 1, 1, 1,
0.9165861, 0.1554216, 1.082696, 1, 1, 1, 1, 1,
0.9169012, -0.00814395, -0.1479377, 1, 1, 1, 1, 1,
0.9417384, 0.187206, 0.5233008, 1, 1, 1, 1, 1,
0.9462255, -0.361285, 3.174117, 1, 1, 1, 1, 1,
0.9465565, -1.009792, 1.717855, 1, 1, 1, 1, 1,
0.9492134, -1.971099, 3.378973, 1, 1, 1, 1, 1,
0.953977, -1.083915, 2.766016, 1, 1, 1, 1, 1,
0.9544721, -0.4577469, 3.048651, 1, 1, 1, 1, 1,
0.9544936, 0.2554064, 0.4881309, 1, 1, 1, 1, 1,
0.9557387, -0.2095445, 3.309311, 0, 0, 1, 1, 1,
0.9770792, -0.7641785, 1.070193, 1, 0, 0, 1, 1,
0.9818921, 0.2276902, -0.2188085, 1, 0, 0, 1, 1,
0.9826372, -0.8298289, 3.251659, 1, 0, 0, 1, 1,
0.9843996, -1.664603, 2.761413, 1, 0, 0, 1, 1,
0.9979525, 1.119725, 1.26469, 1, 0, 0, 1, 1,
1.000347, 0.2197351, 1.662121, 0, 0, 0, 1, 1,
1.002171, -0.1990016, 0.9721677, 0, 0, 0, 1, 1,
1.002326, -0.6832036, 2.968018, 0, 0, 0, 1, 1,
1.008786, 0.02242721, 0.6403263, 0, 0, 0, 1, 1,
1.010001, -1.774702, 2.656578, 0, 0, 0, 1, 1,
1.013041, -1.836641, 2.538306, 0, 0, 0, 1, 1,
1.014772, 0.4213991, 1.136374, 0, 0, 0, 1, 1,
1.016679, 0.1530352, 1.416394, 1, 1, 1, 1, 1,
1.022249, 0.9942973, 1.022735, 1, 1, 1, 1, 1,
1.024367, -1.114886, 2.807977, 1, 1, 1, 1, 1,
1.024675, 0.5534564, 1.506446, 1, 1, 1, 1, 1,
1.025681, -0.5582807, 2.144343, 1, 1, 1, 1, 1,
1.033542, 0.6642246, 1.839851, 1, 1, 1, 1, 1,
1.043167, 0.5540296, 0.7039174, 1, 1, 1, 1, 1,
1.047235, -1.378481, 2.870641, 1, 1, 1, 1, 1,
1.053577, 0.00625292, 1.802293, 1, 1, 1, 1, 1,
1.05592, -1.134989, 0.1613963, 1, 1, 1, 1, 1,
1.059197, -1.124694, 1.881639, 1, 1, 1, 1, 1,
1.06541, -0.08525036, 0.3920911, 1, 1, 1, 1, 1,
1.067642, -1.593678, 0.4024122, 1, 1, 1, 1, 1,
1.069897, -0.1822751, 0.9435243, 1, 1, 1, 1, 1,
1.073798, 0.2784263, 1.69475, 1, 1, 1, 1, 1,
1.074549, 0.03165934, 2.05321, 0, 0, 1, 1, 1,
1.076046, 1.290179, 1.611089, 1, 0, 0, 1, 1,
1.085432, -0.6933547, 0.9262455, 1, 0, 0, 1, 1,
1.094149, -1.569861, 0.3826644, 1, 0, 0, 1, 1,
1.094494, 0.8321799, 1.056729, 1, 0, 0, 1, 1,
1.095472, 0.07521595, 0.8348114, 1, 0, 0, 1, 1,
1.106575, -0.365676, 2.319908, 0, 0, 0, 1, 1,
1.107234, -0.7503951, 0.2277097, 0, 0, 0, 1, 1,
1.107963, -1.979357, 2.564193, 0, 0, 0, 1, 1,
1.112811, 0.1694347, 1.230801, 0, 0, 0, 1, 1,
1.121457, -0.372725, 1.894689, 0, 0, 0, 1, 1,
1.127459, 0.3883548, 1.187949, 0, 0, 0, 1, 1,
1.127492, -1.258569, 4.077129, 0, 0, 0, 1, 1,
1.138358, 1.02151, 0.4987249, 1, 1, 1, 1, 1,
1.144446, -1.289723, 1.155226, 1, 1, 1, 1, 1,
1.157752, -1.165913, 2.601158, 1, 1, 1, 1, 1,
1.158217, 2.523068, 1.067932, 1, 1, 1, 1, 1,
1.167675, 1.391619, 1.006455, 1, 1, 1, 1, 1,
1.169516, -0.041102, 2.27959, 1, 1, 1, 1, 1,
1.180025, -0.6914935, 2.823827, 1, 1, 1, 1, 1,
1.183196, 0.4715129, -1.989065, 1, 1, 1, 1, 1,
1.184447, -0.7365113, 2.510332, 1, 1, 1, 1, 1,
1.191426, -0.1042376, 1.456755, 1, 1, 1, 1, 1,
1.206303, 1.447116, 1.988152, 1, 1, 1, 1, 1,
1.218327, 1.632427, 1.190614, 1, 1, 1, 1, 1,
1.218482, 0.1838777, 0.1833736, 1, 1, 1, 1, 1,
1.223909, -1.796748, 1.730105, 1, 1, 1, 1, 1,
1.228417, -0.33749, 1.102917, 1, 1, 1, 1, 1,
1.229944, -0.831706, 2.237856, 0, 0, 1, 1, 1,
1.237355, -1.175263, 2.306283, 1, 0, 0, 1, 1,
1.269968, 1.521245, -0.2236861, 1, 0, 0, 1, 1,
1.270305, 1.654419, 0.6503363, 1, 0, 0, 1, 1,
1.271538, -0.0868568, 2.008646, 1, 0, 0, 1, 1,
1.274115, 0.4370659, 0.4980433, 1, 0, 0, 1, 1,
1.277268, 0.4228487, 1.234659, 0, 0, 0, 1, 1,
1.281663, -0.09617212, 1.475275, 0, 0, 0, 1, 1,
1.28769, -2.204282, 1.071523, 0, 0, 0, 1, 1,
1.293044, -0.8266033, 2.455173, 0, 0, 0, 1, 1,
1.298411, 0.4765099, 0.2263433, 0, 0, 0, 1, 1,
1.324633, 1.141813, 1.862241, 0, 0, 0, 1, 1,
1.327383, 1.519226, 1.742403, 0, 0, 0, 1, 1,
1.331506, 0.3606935, 3.420714, 1, 1, 1, 1, 1,
1.3433, 1.367969, 0.03796919, 1, 1, 1, 1, 1,
1.350232, 0.03803548, 1.719553, 1, 1, 1, 1, 1,
1.354208, -1.199802, 2.348597, 1, 1, 1, 1, 1,
1.362579, 0.654512, 2.201142, 1, 1, 1, 1, 1,
1.381566, 0.670593, -0.3313824, 1, 1, 1, 1, 1,
1.389765, 0.2698793, 1.375277, 1, 1, 1, 1, 1,
1.39018, -1.706214, 3.139941, 1, 1, 1, 1, 1,
1.391902, 1.09849, 0.7335286, 1, 1, 1, 1, 1,
1.392755, -1.042818, 3.769689, 1, 1, 1, 1, 1,
1.400223, -0.1739289, 1.473688, 1, 1, 1, 1, 1,
1.404881, -1.168902, 1.883713, 1, 1, 1, 1, 1,
1.411778, 0.4745214, 2.102084, 1, 1, 1, 1, 1,
1.418958, 0.4670552, 1.838906, 1, 1, 1, 1, 1,
1.432605, -0.06211655, 3.340251, 1, 1, 1, 1, 1,
1.435507, 0.704117, 1.246171, 0, 0, 1, 1, 1,
1.435517, -0.845242, 2.594167, 1, 0, 0, 1, 1,
1.454, -0.7493127, -0.0002945525, 1, 0, 0, 1, 1,
1.455912, -0.2322317, 0.4597663, 1, 0, 0, 1, 1,
1.457406, -0.9203826, 2.52344, 1, 0, 0, 1, 1,
1.462419, -1.724444, 2.38668, 1, 0, 0, 1, 1,
1.463573, 1.48414, 1.382708, 0, 0, 0, 1, 1,
1.473187, 0.1024202, 1.295281, 0, 0, 0, 1, 1,
1.476952, 0.00950932, 1.813976, 0, 0, 0, 1, 1,
1.478954, -0.4242339, 2.400477, 0, 0, 0, 1, 1,
1.497645, 1.823909, 0.7681639, 0, 0, 0, 1, 1,
1.498373, -0.1858453, 1.630361, 0, 0, 0, 1, 1,
1.501212, 0.8197031, 2.35886, 0, 0, 0, 1, 1,
1.528502, 0.3032165, 1.714643, 1, 1, 1, 1, 1,
1.530181, -0.008408731, 2.591609, 1, 1, 1, 1, 1,
1.55669, -0.652006, 1.853148, 1, 1, 1, 1, 1,
1.58325, 0.2005745, 2.076618, 1, 1, 1, 1, 1,
1.603327, 0.8886127, 0.5014428, 1, 1, 1, 1, 1,
1.604835, 0.2636473, 0.8686242, 1, 1, 1, 1, 1,
1.608399, 0.571825, 0.9563202, 1, 1, 1, 1, 1,
1.614638, 1.115843, 1.054907, 1, 1, 1, 1, 1,
1.616246, 0.7159241, 1.724953, 1, 1, 1, 1, 1,
1.623301, 0.8308401, -1.203982, 1, 1, 1, 1, 1,
1.626367, 0.2831645, 0.84496, 1, 1, 1, 1, 1,
1.630824, 0.18483, 0.9399558, 1, 1, 1, 1, 1,
1.640529, 0.3993499, 2.138393, 1, 1, 1, 1, 1,
1.642641, -1.079212, 2.463176, 1, 1, 1, 1, 1,
1.644524, 1.106537, 1.249708, 1, 1, 1, 1, 1,
1.657036, 0.1361231, -0.9565822, 0, 0, 1, 1, 1,
1.659421, 0.4367813, 0.77877, 1, 0, 0, 1, 1,
1.659619, -0.07572179, 4.662717, 1, 0, 0, 1, 1,
1.663526, -0.7760401, 1.568212, 1, 0, 0, 1, 1,
1.669702, 0.4255511, 2.522877, 1, 0, 0, 1, 1,
1.695807, -1.248035, 3.231103, 1, 0, 0, 1, 1,
1.697486, 1.474577, 1.43619, 0, 0, 0, 1, 1,
1.702836, -0.3393102, 2.266584, 0, 0, 0, 1, 1,
1.706322, 0.9869981, 0.6579922, 0, 0, 0, 1, 1,
1.707951, -0.06420437, 1.690145, 0, 0, 0, 1, 1,
1.70882, -1.013429, 2.013031, 0, 0, 0, 1, 1,
1.709208, -1.036081, 1.973633, 0, 0, 0, 1, 1,
1.778572, 0.7966735, 1.616348, 0, 0, 0, 1, 1,
1.787174, -0.3015069, 2.863941, 1, 1, 1, 1, 1,
1.793094, -0.04304416, 1.20755, 1, 1, 1, 1, 1,
1.803835, 0.6332189, 1.005615, 1, 1, 1, 1, 1,
1.816149, -0.138149, 2.331732, 1, 1, 1, 1, 1,
1.826729, -1.210078, 2.413914, 1, 1, 1, 1, 1,
1.832006, -0.02735221, 1.93318, 1, 1, 1, 1, 1,
1.85067, 1.911452, 2.590858, 1, 1, 1, 1, 1,
1.855437, 0.6316774, -0.2130221, 1, 1, 1, 1, 1,
1.855923, 1.182924, 1.902491, 1, 1, 1, 1, 1,
1.856056, -1.349892, 2.246766, 1, 1, 1, 1, 1,
1.861107, -0.3786479, 0.3436442, 1, 1, 1, 1, 1,
1.863956, -0.766017, 2.366327, 1, 1, 1, 1, 1,
1.886581, 0.2871912, 1.462547, 1, 1, 1, 1, 1,
1.888938, -0.1813664, 0.946893, 1, 1, 1, 1, 1,
1.921261, 0.6614373, 3.367788, 1, 1, 1, 1, 1,
1.943012, -0.4226042, 0.8710819, 0, 0, 1, 1, 1,
2.038222, -0.4384348, 3.258018, 1, 0, 0, 1, 1,
2.056468, -0.2861811, 1.49205, 1, 0, 0, 1, 1,
2.096563, -0.8832798, 1.558992, 1, 0, 0, 1, 1,
2.125187, 1.663262, 1.948027, 1, 0, 0, 1, 1,
2.182676, 1.086476, 0.7111565, 1, 0, 0, 1, 1,
2.241247, 0.8597957, -2.081845, 0, 0, 0, 1, 1,
2.243565, 0.0243285, 1.443938, 0, 0, 0, 1, 1,
2.281997, 1.644919, 1.875935, 0, 0, 0, 1, 1,
2.307962, 0.2688614, -0.1188366, 0, 0, 0, 1, 1,
2.313806, 1.429701, 0.8929557, 0, 0, 0, 1, 1,
2.318957, 0.1183279, 0.9603923, 0, 0, 0, 1, 1,
2.360253, 1.960468, -0.3426777, 0, 0, 0, 1, 1,
2.492483, 1.027165, 1.386532, 1, 1, 1, 1, 1,
2.554646, -1.698967, 2.876227, 1, 1, 1, 1, 1,
2.5825, 0.242011, 1.602866, 1, 1, 1, 1, 1,
2.751313, -0.2405148, 1.087551, 1, 1, 1, 1, 1,
2.888545, 0.3901586, 1.47647, 1, 1, 1, 1, 1,
3.01943, 2.646408, 0.3292399, 1, 1, 1, 1, 1,
3.055288, 0.2791802, 0.06585065, 1, 1, 1, 1, 1
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
var radius = 10.44259;
var distance = 36.67917;
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
mvMatrix.translate( 0.04634953, -0.07733488, 0.396559 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.67917);
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
