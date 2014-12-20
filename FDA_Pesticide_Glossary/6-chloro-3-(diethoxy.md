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
-3.829434, 0.192739, -1.254342, 1, 0, 0, 1,
-3.396271, -1.132627, -1.735242, 1, 0.007843138, 0, 1,
-3.210127, -0.7657278, -1.933749, 1, 0.01176471, 0, 1,
-3.173901, 1.630756, -1.611985, 1, 0.01960784, 0, 1,
-3.016783, -0.8217751, -0.9487209, 1, 0.02352941, 0, 1,
-2.604714, -0.3457723, -1.006479, 1, 0.03137255, 0, 1,
-2.471954, 0.4297452, -1.653594, 1, 0.03529412, 0, 1,
-2.449091, -0.1079481, -0.3229761, 1, 0.04313726, 0, 1,
-2.325228, 1.014567, -1.454281, 1, 0.04705882, 0, 1,
-2.316023, 1.015042, -1.768017, 1, 0.05490196, 0, 1,
-2.26536, 3.375089, -0.4326038, 1, 0.05882353, 0, 1,
-2.262467, 0.325681, -0.1041577, 1, 0.06666667, 0, 1,
-2.215004, 0.1045392, -2.403935, 1, 0.07058824, 0, 1,
-2.174648, 2.425669, 0.9069749, 1, 0.07843138, 0, 1,
-2.155973, 0.7520933, 1.090718, 1, 0.08235294, 0, 1,
-2.142963, -0.8004359, -2.063178, 1, 0.09019608, 0, 1,
-2.092711, -0.5061026, -0.4444209, 1, 0.09411765, 0, 1,
-2.024132, -0.07305805, -1.469921, 1, 0.1019608, 0, 1,
-1.93031, 0.3316142, -1.09177, 1, 0.1098039, 0, 1,
-1.923611, -1.197117, -1.732832, 1, 0.1137255, 0, 1,
-1.899626, -0.6568959, -1.595075, 1, 0.1215686, 0, 1,
-1.899342, 0.2921859, -1.065053, 1, 0.1254902, 0, 1,
-1.887579, -1.536455, -1.737607, 1, 0.1333333, 0, 1,
-1.87857, 0.6422326, -2.046784, 1, 0.1372549, 0, 1,
-1.857783, 0.6476554, -1.5652, 1, 0.145098, 0, 1,
-1.841022, 0.03772312, -2.46367, 1, 0.1490196, 0, 1,
-1.831378, -0.1136689, -2.352319, 1, 0.1568628, 0, 1,
-1.82745, -1.562577, -1.883996, 1, 0.1607843, 0, 1,
-1.821335, -0.8921286, -0.6451203, 1, 0.1686275, 0, 1,
-1.80797, -0.9641553, -2.657823, 1, 0.172549, 0, 1,
-1.798736, 1.093316, -0.4679484, 1, 0.1803922, 0, 1,
-1.791225, 0.4883355, -3.049619, 1, 0.1843137, 0, 1,
-1.785999, 0.6912708, -0.5657963, 1, 0.1921569, 0, 1,
-1.783, -0.5787407, 1.337068, 1, 0.1960784, 0, 1,
-1.780324, 0.2327542, -0.4765691, 1, 0.2039216, 0, 1,
-1.76947, 0.5030296, -1.796842, 1, 0.2117647, 0, 1,
-1.738243, -1.978089, -2.940949, 1, 0.2156863, 0, 1,
-1.732665, 0.496457, 0.08579867, 1, 0.2235294, 0, 1,
-1.72854, -0.01085873, -2.269332, 1, 0.227451, 0, 1,
-1.71854, 1.710464, -2.355558, 1, 0.2352941, 0, 1,
-1.717704, 0.7375003, -1.982644, 1, 0.2392157, 0, 1,
-1.717229, 0.3576199, -1.339569, 1, 0.2470588, 0, 1,
-1.703017, -0.8431189, -2.359504, 1, 0.2509804, 0, 1,
-1.692844, -2.828102, -2.232334, 1, 0.2588235, 0, 1,
-1.681816, -0.894102, -2.277962, 1, 0.2627451, 0, 1,
-1.675676, 0.02342201, -2.558677, 1, 0.2705882, 0, 1,
-1.650035, -2.31928, -2.290591, 1, 0.2745098, 0, 1,
-1.646511, -0.009152501, -2.168106, 1, 0.282353, 0, 1,
-1.616479, 1.568866, -1.793581, 1, 0.2862745, 0, 1,
-1.599707, -0.4431587, -0.1712225, 1, 0.2941177, 0, 1,
-1.593799, 1.003327, 0.1179262, 1, 0.3019608, 0, 1,
-1.587124, 1.780843, -1.187538, 1, 0.3058824, 0, 1,
-1.583906, -1.767719, -2.818267, 1, 0.3137255, 0, 1,
-1.551923, -2.301033, -1.616947, 1, 0.3176471, 0, 1,
-1.543412, 1.368583, -0.891616, 1, 0.3254902, 0, 1,
-1.51941, 2.124413, -1.563961, 1, 0.3294118, 0, 1,
-1.513873, -0.5927723, -0.7770035, 1, 0.3372549, 0, 1,
-1.50651, 0.9759237, -1.424113, 1, 0.3411765, 0, 1,
-1.490358, 0.2835974, -2.00414, 1, 0.3490196, 0, 1,
-1.45795, 2.59428, -0.2858936, 1, 0.3529412, 0, 1,
-1.456176, 0.1802577, -2.17485, 1, 0.3607843, 0, 1,
-1.43627, -0.4426551, -1.879913, 1, 0.3647059, 0, 1,
-1.433649, -1.098493, -0.4488507, 1, 0.372549, 0, 1,
-1.427507, 0.8678188, 0.1142, 1, 0.3764706, 0, 1,
-1.427022, -0.7125459, -2.572641, 1, 0.3843137, 0, 1,
-1.423162, -0.05186423, -1.567926, 1, 0.3882353, 0, 1,
-1.416468, -1.75566, -3.253513, 1, 0.3960784, 0, 1,
-1.408821, 0.2677816, -1.740825, 1, 0.4039216, 0, 1,
-1.406012, 0.6209359, -0.1586714, 1, 0.4078431, 0, 1,
-1.403266, 0.8556677, -1.326839, 1, 0.4156863, 0, 1,
-1.396146, -1.731338, -1.691838, 1, 0.4196078, 0, 1,
-1.383251, -0.2302877, -2.202226, 1, 0.427451, 0, 1,
-1.381831, 0.1196277, -1.018986, 1, 0.4313726, 0, 1,
-1.378522, -0.8977396, -1.191319, 1, 0.4392157, 0, 1,
-1.376824, 1.311462, -0.4212222, 1, 0.4431373, 0, 1,
-1.370721, 0.3843444, -1.250087, 1, 0.4509804, 0, 1,
-1.369543, -2.237163, -2.455793, 1, 0.454902, 0, 1,
-1.364757, -0.5508314, -2.214257, 1, 0.4627451, 0, 1,
-1.351192, -1.430881, -2.125655, 1, 0.4666667, 0, 1,
-1.321177, -1.310129, -2.202528, 1, 0.4745098, 0, 1,
-1.318902, -1.345592, -1.989169, 1, 0.4784314, 0, 1,
-1.304886, 0.1440801, -0.9508876, 1, 0.4862745, 0, 1,
-1.298392, 0.7628449, -0.6419867, 1, 0.4901961, 0, 1,
-1.292258, -0.6384492, -2.341918, 1, 0.4980392, 0, 1,
-1.288824, -0.6860583, -3.194974, 1, 0.5058824, 0, 1,
-1.284499, -0.6577294, -2.701296, 1, 0.509804, 0, 1,
-1.280936, -0.2587307, -0.5711474, 1, 0.5176471, 0, 1,
-1.278901, -0.1255358, -3.684523, 1, 0.5215687, 0, 1,
-1.276205, 0.3331623, -1.093736, 1, 0.5294118, 0, 1,
-1.267856, -1.870448, -4.373633, 1, 0.5333334, 0, 1,
-1.265212, -0.03138398, -0.6307408, 1, 0.5411765, 0, 1,
-1.256405, -0.8150875, -3.130709, 1, 0.5450981, 0, 1,
-1.25628, 1.215837, -0.6185506, 1, 0.5529412, 0, 1,
-1.246754, 0.4969821, -3.383916, 1, 0.5568628, 0, 1,
-1.240293, 1.827638, -1.636925, 1, 0.5647059, 0, 1,
-1.237962, -0.6329963, -3.290952, 1, 0.5686275, 0, 1,
-1.231915, -0.7867404, -2.122131, 1, 0.5764706, 0, 1,
-1.22853, 0.5649609, -0.5816087, 1, 0.5803922, 0, 1,
-1.223378, -1.123603, -2.811214, 1, 0.5882353, 0, 1,
-1.221673, 0.5928956, -0.4951007, 1, 0.5921569, 0, 1,
-1.212861, 0.1717632, -1.58773, 1, 0.6, 0, 1,
-1.211728, -0.9342046, -1.356711, 1, 0.6078432, 0, 1,
-1.210818, 0.7241457, 0.0328044, 1, 0.6117647, 0, 1,
-1.203443, -0.9584394, -3.188609, 1, 0.6196079, 0, 1,
-1.198378, -0.3803834, -2.04666, 1, 0.6235294, 0, 1,
-1.182862, -0.1133245, 0.3136641, 1, 0.6313726, 0, 1,
-1.181705, -0.5256238, -3.974742, 1, 0.6352941, 0, 1,
-1.181368, -1.281892, -2.384114, 1, 0.6431373, 0, 1,
-1.178403, 0.1076308, -0.4679352, 1, 0.6470588, 0, 1,
-1.174901, 1.178242, 0.3858249, 1, 0.654902, 0, 1,
-1.167595, 0.1473685, -0.7048046, 1, 0.6588235, 0, 1,
-1.166902, -0.3411054, -1.892759, 1, 0.6666667, 0, 1,
-1.166835, -0.2407438, -0.8321254, 1, 0.6705883, 0, 1,
-1.165753, 1.023937, -0.9767482, 1, 0.6784314, 0, 1,
-1.161922, -0.1389337, -1.708618, 1, 0.682353, 0, 1,
-1.155811, 0.8161304, -1.538267, 1, 0.6901961, 0, 1,
-1.153368, -0.472432, -0.2370804, 1, 0.6941177, 0, 1,
-1.147959, -0.3923943, -0.6261659, 1, 0.7019608, 0, 1,
-1.136274, -0.8427317, -1.108041, 1, 0.7098039, 0, 1,
-1.121748, 0.358497, -1.362854, 1, 0.7137255, 0, 1,
-1.118718, -0.1779323, -1.759285, 1, 0.7215686, 0, 1,
-1.100528, 0.7311766, -0.3731249, 1, 0.7254902, 0, 1,
-1.097437, -0.06594533, -0.7295048, 1, 0.7333333, 0, 1,
-1.09668, 0.9511206, -2.05566, 1, 0.7372549, 0, 1,
-1.094411, 0.04110937, -0.9819806, 1, 0.7450981, 0, 1,
-1.093575, -0.1390606, -0.7309307, 1, 0.7490196, 0, 1,
-1.090046, 2.102765, -1.454291, 1, 0.7568628, 0, 1,
-1.080003, -0.6909321, -2.360477, 1, 0.7607843, 0, 1,
-1.069703, 0.9312683, -0.841817, 1, 0.7686275, 0, 1,
-1.068977, -0.07421418, -0.638232, 1, 0.772549, 0, 1,
-1.068232, -0.615778, -2.005462, 1, 0.7803922, 0, 1,
-1.06702, -0.4719984, -2.294772, 1, 0.7843137, 0, 1,
-1.057638, 1.323719, -0.8935529, 1, 0.7921569, 0, 1,
-1.055321, -0.6699139, -4.350612, 1, 0.7960784, 0, 1,
-1.050812, 1.338809, -0.9787101, 1, 0.8039216, 0, 1,
-1.048227, -1.02486, -2.885662, 1, 0.8117647, 0, 1,
-1.041038, -0.4028283, -0.9296406, 1, 0.8156863, 0, 1,
-1.038906, -0.08644316, -1.227943, 1, 0.8235294, 0, 1,
-1.031892, -2.134274, -2.761873, 1, 0.827451, 0, 1,
-1.027559, -0.6812204, -3.024655, 1, 0.8352941, 0, 1,
-1.020525, -0.5301028, -1.58158, 1, 0.8392157, 0, 1,
-1.020482, 0.1958264, -2.940035, 1, 0.8470588, 0, 1,
-1.013617, 0.1710357, -1.113529, 1, 0.8509804, 0, 1,
-1.002128, -0.4521388, -3.425779, 1, 0.8588235, 0, 1,
-0.994963, 0.9608959, -3.09907, 1, 0.8627451, 0, 1,
-0.9883111, -0.9780362, -1.054879, 1, 0.8705882, 0, 1,
-0.9865232, -0.5959749, -1.319991, 1, 0.8745098, 0, 1,
-0.9840039, -0.7062496, -3.535582, 1, 0.8823529, 0, 1,
-0.9806364, -0.2996628, 0.4558098, 1, 0.8862745, 0, 1,
-0.9761035, 1.09761, -0.1397486, 1, 0.8941177, 0, 1,
-0.9676655, 0.3461415, 0.7792417, 1, 0.8980392, 0, 1,
-0.9661803, 2.333826, -0.9187973, 1, 0.9058824, 0, 1,
-0.9639161, 1.049118, -0.4399566, 1, 0.9137255, 0, 1,
-0.9570723, 0.9435918, -0.4436882, 1, 0.9176471, 0, 1,
-0.9563683, -1.870388, -2.985306, 1, 0.9254902, 0, 1,
-0.9523282, -0.2196579, -0.7359882, 1, 0.9294118, 0, 1,
-0.9460082, -0.04683741, -2.351804, 1, 0.9372549, 0, 1,
-0.9434086, -0.4428418, -2.024953, 1, 0.9411765, 0, 1,
-0.9353867, -1.192149, -2.710871, 1, 0.9490196, 0, 1,
-0.931224, 0.4687222, -1.217043, 1, 0.9529412, 0, 1,
-0.929416, -0.4900921, -1.893565, 1, 0.9607843, 0, 1,
-0.9264849, -0.1520914, 0.2142226, 1, 0.9647059, 0, 1,
-0.9247352, -0.0356004, -2.251797, 1, 0.972549, 0, 1,
-0.9195994, -0.110818, -4.027531, 1, 0.9764706, 0, 1,
-0.9133423, 0.1810597, -4.198476, 1, 0.9843137, 0, 1,
-0.9117166, -0.04700936, 0.7115751, 1, 0.9882353, 0, 1,
-0.9106653, 1.800435, -0.7044832, 1, 0.9960784, 0, 1,
-0.9094259, 1.800154, 0.1233357, 0.9960784, 1, 0, 1,
-0.9004598, -2.057295, -2.999283, 0.9921569, 1, 0, 1,
-0.8968518, -1.440139, -3.796572, 0.9843137, 1, 0, 1,
-0.89317, -0.8126011, -1.951295, 0.9803922, 1, 0, 1,
-0.8876262, 2.345332, -0.635182, 0.972549, 1, 0, 1,
-0.8856484, 0.1014243, -1.328098, 0.9686275, 1, 0, 1,
-0.8698283, -1.212157, -3.279634, 0.9607843, 1, 0, 1,
-0.8679522, -0.3882522, -2.067506, 0.9568627, 1, 0, 1,
-0.8620845, -1.238663, -1.906335, 0.9490196, 1, 0, 1,
-0.8612683, -0.6893769, -2.394157, 0.945098, 1, 0, 1,
-0.8569221, 1.012408, 0.0247256, 0.9372549, 1, 0, 1,
-0.840648, -1.587169, -3.716818, 0.9333333, 1, 0, 1,
-0.8367521, -1.049974, -2.779287, 0.9254902, 1, 0, 1,
-0.835338, -0.4499438, -2.419715, 0.9215686, 1, 0, 1,
-0.8348212, -1.825073, -0.9642559, 0.9137255, 1, 0, 1,
-0.8336591, 0.4586782, -0.4607897, 0.9098039, 1, 0, 1,
-0.8298029, 0.8600864, -1.849785, 0.9019608, 1, 0, 1,
-0.8260731, 0.0154477, -1.892721, 0.8941177, 1, 0, 1,
-0.8208557, 0.04954441, -3.06551, 0.8901961, 1, 0, 1,
-0.8199485, 0.5346894, -2.888643, 0.8823529, 1, 0, 1,
-0.8164713, -0.4295112, -2.067273, 0.8784314, 1, 0, 1,
-0.8132555, -0.7998924, -3.334653, 0.8705882, 1, 0, 1,
-0.8130722, -0.2273654, -4.373135, 0.8666667, 1, 0, 1,
-0.8128828, 1.458967, -0.2352847, 0.8588235, 1, 0, 1,
-0.8120925, 0.5849749, -0.724749, 0.854902, 1, 0, 1,
-0.8067251, -1.746992, -2.312107, 0.8470588, 1, 0, 1,
-0.8058888, -0.3782346, -2.167624, 0.8431373, 1, 0, 1,
-0.805648, 0.4991969, -1.575306, 0.8352941, 1, 0, 1,
-0.8047153, -0.3470377, -3.271329, 0.8313726, 1, 0, 1,
-0.8047115, 0.744365, -0.4052213, 0.8235294, 1, 0, 1,
-0.8046465, 0.1537761, -0.0790614, 0.8196079, 1, 0, 1,
-0.8025321, 0.550808, -1.821182, 0.8117647, 1, 0, 1,
-0.8009948, 0.4673517, -2.547022, 0.8078431, 1, 0, 1,
-0.7992687, 1.234928, -2.930017, 0.8, 1, 0, 1,
-0.7984865, 0.6747765, 1.646722, 0.7921569, 1, 0, 1,
-0.7982712, 0.4502836, -1.200462, 0.7882353, 1, 0, 1,
-0.7954459, 0.2662045, -2.953705, 0.7803922, 1, 0, 1,
-0.787315, -0.4895949, -2.498669, 0.7764706, 1, 0, 1,
-0.7783049, 0.4965302, -0.3696776, 0.7686275, 1, 0, 1,
-0.7762072, 1.297135, -0.3425125, 0.7647059, 1, 0, 1,
-0.7743395, 0.3795748, -0.1350423, 0.7568628, 1, 0, 1,
-0.7669372, -0.5990961, -1.284589, 0.7529412, 1, 0, 1,
-0.7662587, -0.08137614, -2.138316, 0.7450981, 1, 0, 1,
-0.7594706, 0.528561, -0.414257, 0.7411765, 1, 0, 1,
-0.7574019, -0.01909047, -2.075703, 0.7333333, 1, 0, 1,
-0.7559291, 0.2082359, -1.865473, 0.7294118, 1, 0, 1,
-0.7489761, -0.08415283, -2.741657, 0.7215686, 1, 0, 1,
-0.745542, 1.041142, -1.266596, 0.7176471, 1, 0, 1,
-0.7409486, 1.932386, -1.649368, 0.7098039, 1, 0, 1,
-0.7403904, -1.810682, -1.222517, 0.7058824, 1, 0, 1,
-0.7398086, 0.02139739, -1.53317, 0.6980392, 1, 0, 1,
-0.7386793, 1.010668, -0.43031, 0.6901961, 1, 0, 1,
-0.7366177, -0.7790751, -3.537467, 0.6862745, 1, 0, 1,
-0.7347308, 1.060448, -1.569203, 0.6784314, 1, 0, 1,
-0.732051, 1.581572, 0.2793508, 0.6745098, 1, 0, 1,
-0.7312211, -1.002602, -4.241719, 0.6666667, 1, 0, 1,
-0.7253073, -0.76674, -2.317945, 0.6627451, 1, 0, 1,
-0.7251731, 0.01456378, -1.454143, 0.654902, 1, 0, 1,
-0.7228478, -0.2224675, -1.200831, 0.6509804, 1, 0, 1,
-0.7208708, -1.938064, -3.073832, 0.6431373, 1, 0, 1,
-0.70694, -0.9021943, -1.941888, 0.6392157, 1, 0, 1,
-0.7067128, 0.3175183, -0.9305679, 0.6313726, 1, 0, 1,
-0.6993259, -1.146652, -1.241195, 0.627451, 1, 0, 1,
-0.6963009, 1.824046, -0.7153215, 0.6196079, 1, 0, 1,
-0.6907656, -0.2664893, -1.291964, 0.6156863, 1, 0, 1,
-0.6896181, -1.027824, -3.679267, 0.6078432, 1, 0, 1,
-0.6845925, 1.722243, -1.10613, 0.6039216, 1, 0, 1,
-0.6821797, 0.918532, 0.69476, 0.5960785, 1, 0, 1,
-0.6771119, -1.187843, -1.716785, 0.5882353, 1, 0, 1,
-0.6690146, 0.6947836, -1.33053, 0.5843138, 1, 0, 1,
-0.66892, 0.6042697, -1.026794, 0.5764706, 1, 0, 1,
-0.664912, 2.13118, 0.01712169, 0.572549, 1, 0, 1,
-0.6613652, -0.5805113, -4.057725, 0.5647059, 1, 0, 1,
-0.6580048, 0.9310886, -1.142088, 0.5607843, 1, 0, 1,
-0.6548631, -1.277907, -3.153192, 0.5529412, 1, 0, 1,
-0.6544203, 1.456669, 0.1342217, 0.5490196, 1, 0, 1,
-0.6462278, -2.277478, -2.778821, 0.5411765, 1, 0, 1,
-0.6429791, -0.7910452, -2.569923, 0.5372549, 1, 0, 1,
-0.6355509, 0.9829624, -1.05855, 0.5294118, 1, 0, 1,
-0.6321082, 0.01235757, -1.537779, 0.5254902, 1, 0, 1,
-0.6304584, 0.8108891, -0.3457533, 0.5176471, 1, 0, 1,
-0.6304563, -0.2085139, -2.28874, 0.5137255, 1, 0, 1,
-0.626655, 1.430069, 0.4934722, 0.5058824, 1, 0, 1,
-0.6259747, -0.7785048, -3.219618, 0.5019608, 1, 0, 1,
-0.625383, -0.3567984, -0.2549246, 0.4941176, 1, 0, 1,
-0.6233576, 1.855742, -0.6499385, 0.4862745, 1, 0, 1,
-0.6211286, -1.216054, -2.7934, 0.4823529, 1, 0, 1,
-0.6195803, 0.7098162, 0.7907515, 0.4745098, 1, 0, 1,
-0.6183209, 1.418897, -1.781093, 0.4705882, 1, 0, 1,
-0.6160473, 0.8700445, -0.2791297, 0.4627451, 1, 0, 1,
-0.6102509, 1.426594, -0.6301047, 0.4588235, 1, 0, 1,
-0.6083688, -0.2434626, -2.626176, 0.4509804, 1, 0, 1,
-0.6026549, 0.312726, -0.112123, 0.4470588, 1, 0, 1,
-0.5961371, -0.2322263, -1.394665, 0.4392157, 1, 0, 1,
-0.5952843, -0.5571701, -1.888458, 0.4352941, 1, 0, 1,
-0.5948254, 0.8404296, 0.1791503, 0.427451, 1, 0, 1,
-0.5883219, -1.905999, -2.926806, 0.4235294, 1, 0, 1,
-0.5859062, -0.8339711, -1.113342, 0.4156863, 1, 0, 1,
-0.5835207, -1.144456, -2.684625, 0.4117647, 1, 0, 1,
-0.5830461, -1.930683, -2.903821, 0.4039216, 1, 0, 1,
-0.5734994, -0.05231265, -0.2597986, 0.3960784, 1, 0, 1,
-0.5683582, 0.7487531, -1.088048, 0.3921569, 1, 0, 1,
-0.5655552, -0.2670273, -1.805908, 0.3843137, 1, 0, 1,
-0.5603266, 2.869925, -1.106371, 0.3803922, 1, 0, 1,
-0.5599854, -0.717105, -3.260623, 0.372549, 1, 0, 1,
-0.5562823, -0.07457902, -2.449788, 0.3686275, 1, 0, 1,
-0.5541729, -0.1169356, -0.8135566, 0.3607843, 1, 0, 1,
-0.5539532, 0.1060946, -1.551746, 0.3568628, 1, 0, 1,
-0.5538318, -0.0009984329, -2.075764, 0.3490196, 1, 0, 1,
-0.5534912, -0.7541452, -3.677315, 0.345098, 1, 0, 1,
-0.5533805, -0.992432, -2.989506, 0.3372549, 1, 0, 1,
-0.5510297, -1.175527, -3.086417, 0.3333333, 1, 0, 1,
-0.5476375, -1.092903, -2.156593, 0.3254902, 1, 0, 1,
-0.5454073, 2.608872, -1.903832, 0.3215686, 1, 0, 1,
-0.5430204, 0.6760181, -0.3391562, 0.3137255, 1, 0, 1,
-0.5419056, 0.4707302, -0.7512217, 0.3098039, 1, 0, 1,
-0.5388696, -0.7360346, -2.652763, 0.3019608, 1, 0, 1,
-0.5300101, 0.1568555, -3.515935, 0.2941177, 1, 0, 1,
-0.5287939, 0.9912381, -1.08527, 0.2901961, 1, 0, 1,
-0.526316, 0.1649012, -2.002715, 0.282353, 1, 0, 1,
-0.5246849, 0.4691281, -2.005049, 0.2784314, 1, 0, 1,
-0.5240712, 0.8495692, 0.438621, 0.2705882, 1, 0, 1,
-0.5240532, 0.4768818, -0.6303686, 0.2666667, 1, 0, 1,
-0.5236163, 1.137249, -0.1682302, 0.2588235, 1, 0, 1,
-0.521952, -1.306144, -1.714585, 0.254902, 1, 0, 1,
-0.5217323, -0.7697093, -1.993731, 0.2470588, 1, 0, 1,
-0.5164585, -2.619004, -2.965631, 0.2431373, 1, 0, 1,
-0.5155365, -0.5526438, -1.804306, 0.2352941, 1, 0, 1,
-0.5146537, 0.7492736, -0.5998418, 0.2313726, 1, 0, 1,
-0.513956, 0.2091945, 0.1057443, 0.2235294, 1, 0, 1,
-0.513413, 1.314596, -1.191664, 0.2196078, 1, 0, 1,
-0.5117441, 0.3723227, 0.03950711, 0.2117647, 1, 0, 1,
-0.5110074, 1.132902, -0.83288, 0.2078431, 1, 0, 1,
-0.5017998, 1.017084, -1.389004, 0.2, 1, 0, 1,
-0.5001475, 0.6800318, 0.8123245, 0.1921569, 1, 0, 1,
-0.4978082, -2.300677, -3.515118, 0.1882353, 1, 0, 1,
-0.4973103, -0.8391428, -1.55995, 0.1803922, 1, 0, 1,
-0.4973054, 0.7672335, 0.3828293, 0.1764706, 1, 0, 1,
-0.4959211, 1.428319, 0.06133466, 0.1686275, 1, 0, 1,
-0.4930699, 0.4196331, -1.123398, 0.1647059, 1, 0, 1,
-0.4924391, -0.2084353, -2.524554, 0.1568628, 1, 0, 1,
-0.4918646, -0.5897058, -3.909821, 0.1529412, 1, 0, 1,
-0.4907056, -1.822306, -3.09736, 0.145098, 1, 0, 1,
-0.4899385, 0.3699403, -1.111596, 0.1411765, 1, 0, 1,
-0.4828325, 1.13414, 1.450227, 0.1333333, 1, 0, 1,
-0.4823567, -1.290756, -3.203753, 0.1294118, 1, 0, 1,
-0.4803448, 1.272788, 0.4961241, 0.1215686, 1, 0, 1,
-0.4788496, 1.718711, 0.1474642, 0.1176471, 1, 0, 1,
-0.4749548, 0.676352, -3.350473, 0.1098039, 1, 0, 1,
-0.474521, -1.851626, -2.198854, 0.1058824, 1, 0, 1,
-0.4651541, 1.765501, -0.6036839, 0.09803922, 1, 0, 1,
-0.4620112, 2.169634, 0.2648758, 0.09019608, 1, 0, 1,
-0.4612392, -0.275831, -1.507562, 0.08627451, 1, 0, 1,
-0.4527543, 0.740101, -0.4128936, 0.07843138, 1, 0, 1,
-0.4497786, -0.9848634, -3.2617, 0.07450981, 1, 0, 1,
-0.4483418, 0.6226971, -1.381956, 0.06666667, 1, 0, 1,
-0.4479799, -0.6435895, -2.663435, 0.0627451, 1, 0, 1,
-0.447719, 0.9271088, 0.7626224, 0.05490196, 1, 0, 1,
-0.4441969, 0.2958196, 1.088695, 0.05098039, 1, 0, 1,
-0.4430065, -1.635588, -1.447266, 0.04313726, 1, 0, 1,
-0.4404517, 0.2513024, -1.970898, 0.03921569, 1, 0, 1,
-0.4340952, 0.1042285, -0.8951119, 0.03137255, 1, 0, 1,
-0.432098, -1.449979, -4.082724, 0.02745098, 1, 0, 1,
-0.4305076, 1.334967, -0.7173059, 0.01960784, 1, 0, 1,
-0.4297354, 1.271436, -0.08957218, 0.01568628, 1, 0, 1,
-0.4294688, 0.7386569, -1.457319, 0.007843138, 1, 0, 1,
-0.4258145, -0.05320126, -1.021465, 0.003921569, 1, 0, 1,
-0.4216804, 1.402815, 0.5911011, 0, 1, 0.003921569, 1,
-0.4203528, -0.5728405, -3.261186, 0, 1, 0.01176471, 1,
-0.416745, 1.455655, -0.262568, 0, 1, 0.01568628, 1,
-0.4125212, -0.6442832, -3.560969, 0, 1, 0.02352941, 1,
-0.4122925, 1.617045, 0.2982729, 0, 1, 0.02745098, 1,
-0.4116344, -0.8843343, -2.720029, 0, 1, 0.03529412, 1,
-0.4112291, -0.4673523, -3.738094, 0, 1, 0.03921569, 1,
-0.4091185, 0.3438329, 0.3346549, 0, 1, 0.04705882, 1,
-0.4069846, -0.5985749, -3.760861, 0, 1, 0.05098039, 1,
-0.4023684, 0.3374402, -0.9239116, 0, 1, 0.05882353, 1,
-0.3939184, -0.5100718, -3.399669, 0, 1, 0.0627451, 1,
-0.3930151, 1.134133, -1.430356, 0, 1, 0.07058824, 1,
-0.392868, 0.2956671, -0.6906869, 0, 1, 0.07450981, 1,
-0.3914516, 0.7806071, 1.077446, 0, 1, 0.08235294, 1,
-0.3905114, 1.540487, -0.3678212, 0, 1, 0.08627451, 1,
-0.3884023, -0.4829506, -0.9592822, 0, 1, 0.09411765, 1,
-0.3856066, -0.7880388, -2.340949, 0, 1, 0.1019608, 1,
-0.3791489, 0.6247423, -2.00879, 0, 1, 0.1058824, 1,
-0.377546, 0.08358801, -3.039459, 0, 1, 0.1137255, 1,
-0.3700585, 0.1008318, -1.320426, 0, 1, 0.1176471, 1,
-0.3661486, -0.2833795, -3.213999, 0, 1, 0.1254902, 1,
-0.3640951, 1.407937, -0.1286104, 0, 1, 0.1294118, 1,
-0.3639244, -0.2634748, -3.658434, 0, 1, 0.1372549, 1,
-0.3628235, -0.9488196, -2.821388, 0, 1, 0.1411765, 1,
-0.3627404, -0.465686, -2.428026, 0, 1, 0.1490196, 1,
-0.3599304, -0.9520296, -1.684287, 0, 1, 0.1529412, 1,
-0.3587378, 1.219135, -1.766742, 0, 1, 0.1607843, 1,
-0.3553355, 0.2547783, 0.4321697, 0, 1, 0.1647059, 1,
-0.3544447, -0.4759397, -1.189356, 0, 1, 0.172549, 1,
-0.3541926, -0.6919128, -1.891327, 0, 1, 0.1764706, 1,
-0.3508188, -0.8222048, -5.257131, 0, 1, 0.1843137, 1,
-0.3505135, -0.3279326, -0.9857659, 0, 1, 0.1882353, 1,
-0.3495764, 0.05648221, -0.9910148, 0, 1, 0.1960784, 1,
-0.3436758, 0.308977, -0.2602503, 0, 1, 0.2039216, 1,
-0.3432278, -0.05022268, -1.766075, 0, 1, 0.2078431, 1,
-0.3353179, -1.002574, -2.180619, 0, 1, 0.2156863, 1,
-0.3335636, -2.073165, -2.052725, 0, 1, 0.2196078, 1,
-0.3315033, -1.169169, -5.069085, 0, 1, 0.227451, 1,
-0.32258, 0.2128797, -0.3766508, 0, 1, 0.2313726, 1,
-0.3223065, 0.4585107, -1.46869, 0, 1, 0.2392157, 1,
-0.3213557, 0.1479708, -0.3558287, 0, 1, 0.2431373, 1,
-0.3206482, -1.259611, -3.194506, 0, 1, 0.2509804, 1,
-0.318205, 1.344635, -0.3963885, 0, 1, 0.254902, 1,
-0.3145425, 0.8169217, -2.716885, 0, 1, 0.2627451, 1,
-0.3104417, -1.131141, -2.773943, 0, 1, 0.2666667, 1,
-0.309153, 0.9770073, 1.295206, 0, 1, 0.2745098, 1,
-0.3089383, -0.5339199, -2.460917, 0, 1, 0.2784314, 1,
-0.3080304, -0.7323711, -3.526739, 0, 1, 0.2862745, 1,
-0.3068372, -0.2852352, -1.4259, 0, 1, 0.2901961, 1,
-0.3068307, -0.4807764, -3.305294, 0, 1, 0.2980392, 1,
-0.3047529, -0.2352042, -2.564656, 0, 1, 0.3058824, 1,
-0.3029092, 0.856554, 0.07423089, 0, 1, 0.3098039, 1,
-0.2984158, -0.7157958, -4.278152, 0, 1, 0.3176471, 1,
-0.2961051, 1.931878, 0.5246363, 0, 1, 0.3215686, 1,
-0.2959386, 2.133978, -0.2681166, 0, 1, 0.3294118, 1,
-0.2943603, 0.6789142, 0.2323816, 0, 1, 0.3333333, 1,
-0.2907501, -1.057389, -0.7262622, 0, 1, 0.3411765, 1,
-0.2858305, -0.1718637, -2.957333, 0, 1, 0.345098, 1,
-0.281844, 0.3482812, -1.505812, 0, 1, 0.3529412, 1,
-0.2787289, 2.244122, 0.289191, 0, 1, 0.3568628, 1,
-0.2786755, 0.05075911, -1.237663, 0, 1, 0.3647059, 1,
-0.2786671, 0.00109923, -2.65112, 0, 1, 0.3686275, 1,
-0.275002, 0.6353031, -0.1425204, 0, 1, 0.3764706, 1,
-0.2695457, 0.2554967, -1.126853, 0, 1, 0.3803922, 1,
-0.2683193, 1.081386, 0.4914165, 0, 1, 0.3882353, 1,
-0.2655667, 1.497721, 1.696043, 0, 1, 0.3921569, 1,
-0.2616703, -0.6051615, -2.411908, 0, 1, 0.4, 1,
-0.2597646, -0.1807242, -2.300933, 0, 1, 0.4078431, 1,
-0.2557451, -0.7289928, -2.694742, 0, 1, 0.4117647, 1,
-0.2494915, -0.5832733, -3.981696, 0, 1, 0.4196078, 1,
-0.2452282, 0.9114932, 0.8649994, 0, 1, 0.4235294, 1,
-0.244412, 0.3083923, 0.7919793, 0, 1, 0.4313726, 1,
-0.242799, -0.1854943, -1.720702, 0, 1, 0.4352941, 1,
-0.2373954, 0.8341904, -1.137247, 0, 1, 0.4431373, 1,
-0.2360936, -0.4477778, -1.858802, 0, 1, 0.4470588, 1,
-0.2335065, 1.658999, -0.2223359, 0, 1, 0.454902, 1,
-0.2334653, 0.3941549, -1.261301, 0, 1, 0.4588235, 1,
-0.2324087, 0.6322416, 0.4258537, 0, 1, 0.4666667, 1,
-0.2293465, -0.6287888, -2.039818, 0, 1, 0.4705882, 1,
-0.2226067, 1.611004, -1.377032, 0, 1, 0.4784314, 1,
-0.2225665, -1.589218, -1.66712, 0, 1, 0.4823529, 1,
-0.2200661, -0.9196816, -2.277293, 0, 1, 0.4901961, 1,
-0.2188366, -1.403317, -1.800144, 0, 1, 0.4941176, 1,
-0.2172547, -1.258292, -2.156292, 0, 1, 0.5019608, 1,
-0.2170399, -0.7059596, -2.71297, 0, 1, 0.509804, 1,
-0.2119492, -1.014801, -3.603792, 0, 1, 0.5137255, 1,
-0.2114896, 0.3696783, 0.5801092, 0, 1, 0.5215687, 1,
-0.2081676, -0.6705207, -1.418992, 0, 1, 0.5254902, 1,
-0.2076375, 0.1680003, -0.3618989, 0, 1, 0.5333334, 1,
-0.2068686, 2.185592, 0.9934064, 0, 1, 0.5372549, 1,
-0.2065968, -0.6623663, -2.588438, 0, 1, 0.5450981, 1,
-0.2046545, 0.2328214, 1.288549, 0, 1, 0.5490196, 1,
-0.2042445, 0.4079801, -1.570497, 0, 1, 0.5568628, 1,
-0.2042084, -1.635171, -1.465896, 0, 1, 0.5607843, 1,
-0.1983222, -1.66844, -4.522614, 0, 1, 0.5686275, 1,
-0.1930171, 1.389579, -0.462402, 0, 1, 0.572549, 1,
-0.1905168, 1.107622, 0.8639433, 0, 1, 0.5803922, 1,
-0.1902179, -0.395813, -1.675052, 0, 1, 0.5843138, 1,
-0.1894747, 0.2160875, -1.554111, 0, 1, 0.5921569, 1,
-0.1883634, 0.8074148, 0.2547722, 0, 1, 0.5960785, 1,
-0.1832935, 0.1648288, -2.368634, 0, 1, 0.6039216, 1,
-0.17739, 1.172006, 0.8733202, 0, 1, 0.6117647, 1,
-0.1701776, 0.2814077, 0.8497742, 0, 1, 0.6156863, 1,
-0.168357, -0.8385228, -3.975469, 0, 1, 0.6235294, 1,
-0.1677201, -1.65865, -3.707401, 0, 1, 0.627451, 1,
-0.1668514, 0.2750163, -1.556004, 0, 1, 0.6352941, 1,
-0.158834, 0.5210572, 1.080842, 0, 1, 0.6392157, 1,
-0.1587901, 0.1237273, -0.1405373, 0, 1, 0.6470588, 1,
-0.1563753, 0.1626777, -0.7717009, 0, 1, 0.6509804, 1,
-0.1554751, -0.02084065, -1.102882, 0, 1, 0.6588235, 1,
-0.1552791, -0.559329, -5.003585, 0, 1, 0.6627451, 1,
-0.1548219, 1.585502, -0.02053457, 0, 1, 0.6705883, 1,
-0.1541447, 0.1703002, -1.722443, 0, 1, 0.6745098, 1,
-0.1514414, -1.285332, -0.5816855, 0, 1, 0.682353, 1,
-0.1512357, -1.223079, -3.840151, 0, 1, 0.6862745, 1,
-0.1465778, 0.860692, 0.9579725, 0, 1, 0.6941177, 1,
-0.1462467, 0.1269558, -0.207089, 0, 1, 0.7019608, 1,
-0.1428442, 0.5543709, -0.904637, 0, 1, 0.7058824, 1,
-0.1392882, 0.2775661, -0.2125444, 0, 1, 0.7137255, 1,
-0.1368196, 0.3743128, 1.011429, 0, 1, 0.7176471, 1,
-0.1342196, 0.3044044, -0.3734139, 0, 1, 0.7254902, 1,
-0.1313563, -0.4247083, -1.941852, 0, 1, 0.7294118, 1,
-0.1308391, -0.4857104, -2.239038, 0, 1, 0.7372549, 1,
-0.1297031, 1.618926, -1.433738, 0, 1, 0.7411765, 1,
-0.1267736, 1.019187, 0.3324052, 0, 1, 0.7490196, 1,
-0.1258338, 0.2683007, 0.9263831, 0, 1, 0.7529412, 1,
-0.1188469, -1.350878, -4.020827, 0, 1, 0.7607843, 1,
-0.1187155, 0.9852054, -0.8086902, 0, 1, 0.7647059, 1,
-0.1179507, -2.104923, -5.784512, 0, 1, 0.772549, 1,
-0.117313, -0.5133771, -3.278137, 0, 1, 0.7764706, 1,
-0.1135969, -0.6333236, -2.948885, 0, 1, 0.7843137, 1,
-0.1128079, 0.2535596, -2.200704, 0, 1, 0.7882353, 1,
-0.1118137, 0.6317731, 0.1884445, 0, 1, 0.7960784, 1,
-0.1116902, 0.1613524, -1.821172, 0, 1, 0.8039216, 1,
-0.1111559, -0.7908693, -2.223854, 0, 1, 0.8078431, 1,
-0.1090693, 0.167244, -1.567998, 0, 1, 0.8156863, 1,
-0.1078233, 0.7098346, 1.147181, 0, 1, 0.8196079, 1,
-0.1053254, 1.100369, 0.2128562, 0, 1, 0.827451, 1,
-0.1038678, 0.9030904, -1.675696, 0, 1, 0.8313726, 1,
-0.09768935, 0.1141667, -0.08119229, 0, 1, 0.8392157, 1,
-0.09493376, 0.05274617, 0.4754866, 0, 1, 0.8431373, 1,
-0.09449939, -0.3905419, -2.506923, 0, 1, 0.8509804, 1,
-0.09438766, -0.6385729, -2.854728, 0, 1, 0.854902, 1,
-0.09387846, -0.7227823, -2.47622, 0, 1, 0.8627451, 1,
-0.09354554, 1.223339, -0.1284908, 0, 1, 0.8666667, 1,
-0.08938222, -0.9923726, -5.24891, 0, 1, 0.8745098, 1,
-0.08716477, 0.1063103, -2.319797, 0, 1, 0.8784314, 1,
-0.08546381, 0.6158322, -0.6361999, 0, 1, 0.8862745, 1,
-0.08172577, -0.447787, -4.018189, 0, 1, 0.8901961, 1,
-0.08164727, -1.685059, -3.085614, 0, 1, 0.8980392, 1,
-0.07812873, 0.384201, -0.6924347, 0, 1, 0.9058824, 1,
-0.07297298, -0.1473035, -2.189827, 0, 1, 0.9098039, 1,
-0.07201608, 0.02895002, -0.4693396, 0, 1, 0.9176471, 1,
-0.07185622, 0.3530245, 0.01817904, 0, 1, 0.9215686, 1,
-0.06957207, -0.08922286, -3.157088, 0, 1, 0.9294118, 1,
-0.06886334, -0.3772807, -4.458364, 0, 1, 0.9333333, 1,
-0.06784843, 0.4854904, 0.4699545, 0, 1, 0.9411765, 1,
-0.06722002, 1.129821, 1.380309, 0, 1, 0.945098, 1,
-0.06283613, -0.08696823, -3.402843, 0, 1, 0.9529412, 1,
-0.0612722, 0.02772609, -0.7518383, 0, 1, 0.9568627, 1,
-0.05830061, 1.252916, -1.291322, 0, 1, 0.9647059, 1,
-0.05599177, 1.18135, 0.1743731, 0, 1, 0.9686275, 1,
-0.0554894, -0.4736845, -2.767125, 0, 1, 0.9764706, 1,
-0.04567657, 1.940269, 0.4742974, 0, 1, 0.9803922, 1,
-0.0403607, 0.9718848, 0.9708067, 0, 1, 0.9882353, 1,
-0.03842398, -0.5352429, -1.449377, 0, 1, 0.9921569, 1,
-0.03738084, 0.4340992, 0.447444, 0, 1, 1, 1,
-0.03725227, 0.8633649, 1.703366, 0, 0.9921569, 1, 1,
-0.03633319, -0.4238323, -2.101962, 0, 0.9882353, 1, 1,
-0.03399041, -0.7253244, -3.690535, 0, 0.9803922, 1, 1,
-0.03142669, -2.071844, -4.264185, 0, 0.9764706, 1, 1,
-0.0314065, -1.160305, -3.999485, 0, 0.9686275, 1, 1,
-0.0299744, 1.477579, -1.44728, 0, 0.9647059, 1, 1,
-0.02877996, 0.5640877, -0.6005272, 0, 0.9568627, 1, 1,
-0.02772747, 2.029686, -0.7257605, 0, 0.9529412, 1, 1,
-0.02591507, -0.5540104, -4.242445, 0, 0.945098, 1, 1,
-0.01815539, 2.485171, -0.7314786, 0, 0.9411765, 1, 1,
-0.01750276, -0.8376979, -3.394855, 0, 0.9333333, 1, 1,
-0.01517795, 0.2416211, -0.9209071, 0, 0.9294118, 1, 1,
-0.01502585, 0.01047375, 0.05657857, 0, 0.9215686, 1, 1,
-0.01487668, 1.782344, 0.5002946, 0, 0.9176471, 1, 1,
-0.01270355, 1.24993, -1.46473, 0, 0.9098039, 1, 1,
-0.01233705, 0.559816, -1.22377, 0, 0.9058824, 1, 1,
-0.006533335, 1.662327, -0.5853776, 0, 0.8980392, 1, 1,
-0.00577521, 0.7905285, 0.07619998, 0, 0.8901961, 1, 1,
-0.005588437, -0.7869014, -2.980477, 0, 0.8862745, 1, 1,
-0.005095304, -0.3788999, -2.115626, 0, 0.8784314, 1, 1,
-0.004763073, 0.5774927, -0.1072838, 0, 0.8745098, 1, 1,
-0.003507465, -0.7331435, -2.516007, 0, 0.8666667, 1, 1,
0.001836599, -0.5868979, 2.264096, 0, 0.8627451, 1, 1,
0.001941325, -0.4555017, 3.017395, 0, 0.854902, 1, 1,
0.006275328, 0.5330844, -0.9586793, 0, 0.8509804, 1, 1,
0.008761472, -0.5901031, 1.520778, 0, 0.8431373, 1, 1,
0.0101989, 0.6822991, -0.01291892, 0, 0.8392157, 1, 1,
0.0164334, 1.201719, -0.9190372, 0, 0.8313726, 1, 1,
0.02307921, -1.534549, 3.255186, 0, 0.827451, 1, 1,
0.02312652, 1.033655, 1.862715, 0, 0.8196079, 1, 1,
0.02824336, 0.8438362, 1.062654, 0, 0.8156863, 1, 1,
0.02858672, 1.458852, 0.2962514, 0, 0.8078431, 1, 1,
0.0346742, -0.9534482, 3.27483, 0, 0.8039216, 1, 1,
0.03573843, -1.81304, 3.374859, 0, 0.7960784, 1, 1,
0.03646889, -0.5136997, 2.281306, 0, 0.7882353, 1, 1,
0.04704332, 0.1424527, -0.1199935, 0, 0.7843137, 1, 1,
0.04806808, 1.272468, -0.0348166, 0, 0.7764706, 1, 1,
0.05075935, 0.2897049, -1.32528, 0, 0.772549, 1, 1,
0.05397729, -0.06548621, 2.085709, 0, 0.7647059, 1, 1,
0.05412454, -0.6769259, 4.077685, 0, 0.7607843, 1, 1,
0.06029752, 0.9362837, -0.2591113, 0, 0.7529412, 1, 1,
0.07260358, -0.2416113, 2.585303, 0, 0.7490196, 1, 1,
0.07296194, 0.2360389, -0.8205717, 0, 0.7411765, 1, 1,
0.07602818, 0.1509533, 1.164191, 0, 0.7372549, 1, 1,
0.07686382, -0.3960799, 3.819041, 0, 0.7294118, 1, 1,
0.07726283, -1.854851, 2.235104, 0, 0.7254902, 1, 1,
0.07781606, 0.4595519, 0.26516, 0, 0.7176471, 1, 1,
0.08052523, -0.4582897, 3.162982, 0, 0.7137255, 1, 1,
0.08318307, 0.2051533, 2.267776, 0, 0.7058824, 1, 1,
0.08803781, 1.545202, -0.04651073, 0, 0.6980392, 1, 1,
0.09253852, 0.8028881, -1.466721, 0, 0.6941177, 1, 1,
0.09553778, 0.1064358, -0.4004794, 0, 0.6862745, 1, 1,
0.09663407, 0.04093439, -0.6264079, 0, 0.682353, 1, 1,
0.1011689, -0.3588291, 2.696488, 0, 0.6745098, 1, 1,
0.1014727, 1.137283, -0.1542097, 0, 0.6705883, 1, 1,
0.1024662, -0.2733138, 1.341136, 0, 0.6627451, 1, 1,
0.1065063, -0.1111523, 3.524307, 0, 0.6588235, 1, 1,
0.1147841, 0.7637556, 0.5451353, 0, 0.6509804, 1, 1,
0.115403, 0.6980591, 1.481181, 0, 0.6470588, 1, 1,
0.1248607, 1.723888, -0.4118399, 0, 0.6392157, 1, 1,
0.1290212, -1.734753, 2.185162, 0, 0.6352941, 1, 1,
0.12923, 0.9715226, 0.2170402, 0, 0.627451, 1, 1,
0.1299895, -0.3323407, 2.474822, 0, 0.6235294, 1, 1,
0.1303836, -0.6131545, 3.465755, 0, 0.6156863, 1, 1,
0.1314715, 1.019095, 0.9517283, 0, 0.6117647, 1, 1,
0.1337596, -0.7946289, 4.007791, 0, 0.6039216, 1, 1,
0.1358812, -1.160778, 3.830571, 0, 0.5960785, 1, 1,
0.141069, -0.7139715, 4.276322, 0, 0.5921569, 1, 1,
0.1493543, 0.0610529, 1.786677, 0, 0.5843138, 1, 1,
0.152803, -3.032585, 2.695348, 0, 0.5803922, 1, 1,
0.1552566, 1.953773, 1.0243, 0, 0.572549, 1, 1,
0.1555673, 0.7650679, -0.1866712, 0, 0.5686275, 1, 1,
0.1597581, -1.18589, 3.189674, 0, 0.5607843, 1, 1,
0.1598671, 1.607327, -0.983798, 0, 0.5568628, 1, 1,
0.1599474, -1.422249, 2.926083, 0, 0.5490196, 1, 1,
0.1603902, 1.184733, 0.3448202, 0, 0.5450981, 1, 1,
0.1632569, 2.293614, -1.241019, 0, 0.5372549, 1, 1,
0.1633097, -1.01427, 2.91012, 0, 0.5333334, 1, 1,
0.1635322, 0.8990334, 0.8721595, 0, 0.5254902, 1, 1,
0.1672312, -1.531598, 1.834011, 0, 0.5215687, 1, 1,
0.1939224, -1.359305, 3.081484, 0, 0.5137255, 1, 1,
0.2119668, -0.3012712, 1.983118, 0, 0.509804, 1, 1,
0.2121316, 1.046672, -1.398692, 0, 0.5019608, 1, 1,
0.2153399, -0.7328279, 0.2680749, 0, 0.4941176, 1, 1,
0.2166433, 0.2804312, 2.212664, 0, 0.4901961, 1, 1,
0.2169153, 1.220554, -0.6261755, 0, 0.4823529, 1, 1,
0.223462, 0.7875488, 1.521869, 0, 0.4784314, 1, 1,
0.2242517, -0.973186, 4.795856, 0, 0.4705882, 1, 1,
0.2334656, 1.415477, 0.4934387, 0, 0.4666667, 1, 1,
0.239556, 0.1104512, 1.024804, 0, 0.4588235, 1, 1,
0.2441532, -0.6311028, 2.657527, 0, 0.454902, 1, 1,
0.2444679, 0.3834856, -0.12732, 0, 0.4470588, 1, 1,
0.2446321, 1.723436, 0.1669106, 0, 0.4431373, 1, 1,
0.2468326, -2.69293, 2.283281, 0, 0.4352941, 1, 1,
0.2505223, -0.6898568, 2.058539, 0, 0.4313726, 1, 1,
0.2518759, 0.7256798, -0.06633776, 0, 0.4235294, 1, 1,
0.25554, 1.653363, -1.272165, 0, 0.4196078, 1, 1,
0.2570553, -0.5804951, 3.785602, 0, 0.4117647, 1, 1,
0.2625054, -0.8994343, 2.865025, 0, 0.4078431, 1, 1,
0.2694382, 0.7000915, -0.3254587, 0, 0.4, 1, 1,
0.272649, 0.4683657, 2.469714, 0, 0.3921569, 1, 1,
0.281312, -0.4327941, 1.804385, 0, 0.3882353, 1, 1,
0.28268, 0.2313389, 1.056695, 0, 0.3803922, 1, 1,
0.282734, -3.397114, 2.122098, 0, 0.3764706, 1, 1,
0.2925531, -0.8534313, 2.473402, 0, 0.3686275, 1, 1,
0.2940131, 0.9122102, -0.3933864, 0, 0.3647059, 1, 1,
0.2948152, 0.6384593, -0.7066053, 0, 0.3568628, 1, 1,
0.2972831, -0.3434542, -0.03306318, 0, 0.3529412, 1, 1,
0.3012999, -0.4197125, 2.308153, 0, 0.345098, 1, 1,
0.3014901, 0.4357134, -0.1920203, 0, 0.3411765, 1, 1,
0.3074855, 1.04979, 2.05086, 0, 0.3333333, 1, 1,
0.308534, 1.398656, -0.1514334, 0, 0.3294118, 1, 1,
0.3142713, 0.6875326, -2.047873, 0, 0.3215686, 1, 1,
0.3181364, -0.6441106, 3.999091, 0, 0.3176471, 1, 1,
0.31973, 1.74681, 1.059137, 0, 0.3098039, 1, 1,
0.3203146, 0.2764839, 2.741319, 0, 0.3058824, 1, 1,
0.3230082, -1.621776, 2.309289, 0, 0.2980392, 1, 1,
0.3235555, -1.218643, 1.385839, 0, 0.2901961, 1, 1,
0.3237466, -0.506093, 3.092904, 0, 0.2862745, 1, 1,
0.3370177, 0.07512217, 1.662658, 0, 0.2784314, 1, 1,
0.3399144, 1.758099, -0.1826062, 0, 0.2745098, 1, 1,
0.3407861, -0.05784406, 2.252435, 0, 0.2666667, 1, 1,
0.3408202, -1.221972, 3.178671, 0, 0.2627451, 1, 1,
0.3488023, -0.4479895, 1.74417, 0, 0.254902, 1, 1,
0.3492651, -0.8258347, 2.535872, 0, 0.2509804, 1, 1,
0.349494, 0.7497827, 0.996543, 0, 0.2431373, 1, 1,
0.3504776, 2.561891, 1.011752, 0, 0.2392157, 1, 1,
0.3515948, 0.8906583, -0.8362244, 0, 0.2313726, 1, 1,
0.3554882, 1.384744, -0.4344106, 0, 0.227451, 1, 1,
0.3574557, -0.5957062, 1.79061, 0, 0.2196078, 1, 1,
0.3618062, -0.462679, 1.585212, 0, 0.2156863, 1, 1,
0.3632719, 0.4998151, 1.093953, 0, 0.2078431, 1, 1,
0.3639841, -0.04180362, 1.905437, 0, 0.2039216, 1, 1,
0.3644311, -1.483438, 1.779744, 0, 0.1960784, 1, 1,
0.368014, -2.192051, 3.773479, 0, 0.1882353, 1, 1,
0.3697282, -0.8142307, 3.170811, 0, 0.1843137, 1, 1,
0.3705334, 0.8445644, 0.7197947, 0, 0.1764706, 1, 1,
0.3792762, -0.0675105, 2.079999, 0, 0.172549, 1, 1,
0.3793195, 1.735281, 2.572798, 0, 0.1647059, 1, 1,
0.3853326, 0.04110207, 2.222838, 0, 0.1607843, 1, 1,
0.3892132, -0.2143077, -0.09123182, 0, 0.1529412, 1, 1,
0.3912617, 1.536291, 1.581607, 0, 0.1490196, 1, 1,
0.3921136, -0.6007972, 0.9017276, 0, 0.1411765, 1, 1,
0.3927892, 0.8002772, 1.241214, 0, 0.1372549, 1, 1,
0.393063, 1.417181, 0.8327295, 0, 0.1294118, 1, 1,
0.3946111, 1.046537, 1.121453, 0, 0.1254902, 1, 1,
0.3948404, 1.13438, -0.9340969, 0, 0.1176471, 1, 1,
0.3966406, 0.4592777, -0.5719925, 0, 0.1137255, 1, 1,
0.3970702, 0.4382105, 0.9880457, 0, 0.1058824, 1, 1,
0.3987072, 1.56051, 0.2432284, 0, 0.09803922, 1, 1,
0.4022349, -2.012852, 2.511137, 0, 0.09411765, 1, 1,
0.4050981, -0.1610507, 0.9037184, 0, 0.08627451, 1, 1,
0.4057702, 0.8121428, -0.7974586, 0, 0.08235294, 1, 1,
0.4158672, 0.6763795, -1.041758, 0, 0.07450981, 1, 1,
0.4299301, -0.8634446, 2.75074, 0, 0.07058824, 1, 1,
0.437505, -0.08987927, 2.614561, 0, 0.0627451, 1, 1,
0.4382053, 1.177314, 0.780579, 0, 0.05882353, 1, 1,
0.4417192, -0.4158453, 4.343179, 0, 0.05098039, 1, 1,
0.4431759, -0.01594695, 1.742006, 0, 0.04705882, 1, 1,
0.4441778, -0.1871001, 0.2997231, 0, 0.03921569, 1, 1,
0.4447061, 1.475038, 0.9500589, 0, 0.03529412, 1, 1,
0.445423, 2.076494, 0.7324955, 0, 0.02745098, 1, 1,
0.4466494, -0.05142935, 3.520568, 0, 0.02352941, 1, 1,
0.4471789, 0.1499436, 1.850525, 0, 0.01568628, 1, 1,
0.448364, 1.53661, 0.9712854, 0, 0.01176471, 1, 1,
0.4509585, 0.911092, 1.234455, 0, 0.003921569, 1, 1,
0.4516127, 0.5998835, -1.43914, 0.003921569, 0, 1, 1,
0.4543254, 1.842765, 1.274557, 0.007843138, 0, 1, 1,
0.4580814, 0.1262053, 0.1864727, 0.01568628, 0, 1, 1,
0.4673841, 0.2169458, 0.7001345, 0.01960784, 0, 1, 1,
0.4730912, -0.692269, 3.135221, 0.02745098, 0, 1, 1,
0.473617, -0.7024615, 3.373011, 0.03137255, 0, 1, 1,
0.4784774, 0.3411086, 2.919618, 0.03921569, 0, 1, 1,
0.4833678, 0.4594743, 2.032273, 0.04313726, 0, 1, 1,
0.4845487, 1.57523, -0.2846743, 0.05098039, 0, 1, 1,
0.4880105, -1.131706, 1.95152, 0.05490196, 0, 1, 1,
0.4884483, 1.155279, 1.913083, 0.0627451, 0, 1, 1,
0.4886664, -0.6724771, 3.892153, 0.06666667, 0, 1, 1,
0.4891303, 1.09054, -1.597887, 0.07450981, 0, 1, 1,
0.4905929, -0.9690722, 1.704778, 0.07843138, 0, 1, 1,
0.4952482, -1.011788, 2.614043, 0.08627451, 0, 1, 1,
0.4957412, -0.3547913, 2.322402, 0.09019608, 0, 1, 1,
0.5008682, 1.393682, -0.4965133, 0.09803922, 0, 1, 1,
0.501687, -1.052766, 3.544849, 0.1058824, 0, 1, 1,
0.5026325, -1.017861, 3.987406, 0.1098039, 0, 1, 1,
0.5115215, 1.01604, -0.06484485, 0.1176471, 0, 1, 1,
0.513453, 1.829253, -0.0345327, 0.1215686, 0, 1, 1,
0.513837, -1.572547, 3.002982, 0.1294118, 0, 1, 1,
0.5163597, 0.6213873, 1.587132, 0.1333333, 0, 1, 1,
0.5165733, -0.6411064, 1.459997, 0.1411765, 0, 1, 1,
0.5197456, -0.0006920536, 1.818826, 0.145098, 0, 1, 1,
0.5221164, 1.663038, -0.651365, 0.1529412, 0, 1, 1,
0.5344426, -0.2224693, 1.737215, 0.1568628, 0, 1, 1,
0.5437132, -1.358437, 1.577375, 0.1647059, 0, 1, 1,
0.5444169, -0.328205, 0.9874396, 0.1686275, 0, 1, 1,
0.5456525, -1.073752, 2.015739, 0.1764706, 0, 1, 1,
0.5469586, 0.9227633, -0.4503442, 0.1803922, 0, 1, 1,
0.5516471, -0.313471, 0.9990811, 0.1882353, 0, 1, 1,
0.5558171, 0.7632037, 0.3987537, 0.1921569, 0, 1, 1,
0.558181, 0.4807554, 1.520064, 0.2, 0, 1, 1,
0.5606044, 0.2669838, 0.4043039, 0.2078431, 0, 1, 1,
0.5618354, -1.546634, 3.687724, 0.2117647, 0, 1, 1,
0.5668293, -0.7349535, 2.054586, 0.2196078, 0, 1, 1,
0.5693549, 0.02410229, 2.090617, 0.2235294, 0, 1, 1,
0.5695322, -0.8864926, 2.776863, 0.2313726, 0, 1, 1,
0.5699447, -0.8653671, 3.852258, 0.2352941, 0, 1, 1,
0.581865, 0.4509542, 2.197284, 0.2431373, 0, 1, 1,
0.5833983, 0.8884727, 2.940604, 0.2470588, 0, 1, 1,
0.5890874, -1.604902, 2.05613, 0.254902, 0, 1, 1,
0.5901108, -0.1063788, 0.1724522, 0.2588235, 0, 1, 1,
0.5902762, -0.03284005, 1.20983, 0.2666667, 0, 1, 1,
0.6016772, -0.6558334, 1.60472, 0.2705882, 0, 1, 1,
0.6035185, -0.5338376, 2.731084, 0.2784314, 0, 1, 1,
0.6045734, -0.4803436, 2.260169, 0.282353, 0, 1, 1,
0.6070943, 0.4701726, 1.761341, 0.2901961, 0, 1, 1,
0.6083457, 0.1179467, 1.724855, 0.2941177, 0, 1, 1,
0.6090173, -3.104738, 1.709141, 0.3019608, 0, 1, 1,
0.6096687, 0.4864073, 0.6470591, 0.3098039, 0, 1, 1,
0.6107664, 0.03894373, 1.501867, 0.3137255, 0, 1, 1,
0.6115436, 0.830446, 2.237164, 0.3215686, 0, 1, 1,
0.6115651, -0.1988424, 1.598323, 0.3254902, 0, 1, 1,
0.6191663, 0.2058446, -0.1937595, 0.3333333, 0, 1, 1,
0.6315954, 0.1905028, 0.6398135, 0.3372549, 0, 1, 1,
0.6324512, -0.5411749, 3.004052, 0.345098, 0, 1, 1,
0.6340415, -0.04012888, 0.8423104, 0.3490196, 0, 1, 1,
0.644821, 0.2218328, 3.180009, 0.3568628, 0, 1, 1,
0.6481591, -0.8201672, 2.330442, 0.3607843, 0, 1, 1,
0.6488498, -1.680841, 3.235197, 0.3686275, 0, 1, 1,
0.6502306, 0.6972807, 1.334308, 0.372549, 0, 1, 1,
0.6512873, 0.3573413, 1.63767, 0.3803922, 0, 1, 1,
0.651714, 0.6404298, 0.6692084, 0.3843137, 0, 1, 1,
0.6606054, 1.415748, 1.941309, 0.3921569, 0, 1, 1,
0.6625929, 0.1806578, 1.589881, 0.3960784, 0, 1, 1,
0.6653161, -0.5632308, 3.327269, 0.4039216, 0, 1, 1,
0.6669638, -0.1056301, 1.302021, 0.4117647, 0, 1, 1,
0.6692345, -1.221711, 2.929828, 0.4156863, 0, 1, 1,
0.6841233, -2.112209, 2.753265, 0.4235294, 0, 1, 1,
0.6846433, 0.0785849, 0.9636961, 0.427451, 0, 1, 1,
0.6858638, -0.8435761, 3.122939, 0.4352941, 0, 1, 1,
0.6866696, -2.419713, 3.464478, 0.4392157, 0, 1, 1,
0.688407, -0.5820194, 2.492801, 0.4470588, 0, 1, 1,
0.6988679, 0.9649547, 0.1654123, 0.4509804, 0, 1, 1,
0.7005804, 0.6227181, 1.839192, 0.4588235, 0, 1, 1,
0.705094, -0.05324341, 0.5730022, 0.4627451, 0, 1, 1,
0.7055637, 0.6698685, 2.49626, 0.4705882, 0, 1, 1,
0.7132996, -0.01087445, 2.40469, 0.4745098, 0, 1, 1,
0.7270676, -0.8368804, 2.281712, 0.4823529, 0, 1, 1,
0.7292998, -0.5058337, 1.987154, 0.4862745, 0, 1, 1,
0.7304555, -1.338778, 1.755266, 0.4941176, 0, 1, 1,
0.7310698, 0.951315, 0.2980298, 0.5019608, 0, 1, 1,
0.7317272, 0.208775, 0.6114986, 0.5058824, 0, 1, 1,
0.7322798, -1.889656, 4.181923, 0.5137255, 0, 1, 1,
0.7471493, -0.5351604, 4.221165, 0.5176471, 0, 1, 1,
0.7482278, 0.6464471, 0.642202, 0.5254902, 0, 1, 1,
0.750569, 0.758347, 0.4967529, 0.5294118, 0, 1, 1,
0.7508202, -0.6052104, 1.835047, 0.5372549, 0, 1, 1,
0.7524155, 1.730201, 0.6859915, 0.5411765, 0, 1, 1,
0.7534274, 0.9559829, -0.7538884, 0.5490196, 0, 1, 1,
0.7566036, -0.09911452, 0.3254363, 0.5529412, 0, 1, 1,
0.7644715, 0.4442241, 1.138304, 0.5607843, 0, 1, 1,
0.7646007, 1.651991, -1.367897, 0.5647059, 0, 1, 1,
0.7666645, -0.2327379, 2.608824, 0.572549, 0, 1, 1,
0.7673993, 1.718604, 0.7986771, 0.5764706, 0, 1, 1,
0.7676232, 0.3113958, 1.343994, 0.5843138, 0, 1, 1,
0.7712486, 0.6913391, 0.1701633, 0.5882353, 0, 1, 1,
0.7725378, 1.949758, -0.5614995, 0.5960785, 0, 1, 1,
0.7733155, 0.8859808, 1.409826, 0.6039216, 0, 1, 1,
0.7744312, -0.3755642, 1.547506, 0.6078432, 0, 1, 1,
0.7764372, -1.040597, 2.80604, 0.6156863, 0, 1, 1,
0.7765764, 0.09607513, 3.116696, 0.6196079, 0, 1, 1,
0.7819926, 1.097662, -0.507323, 0.627451, 0, 1, 1,
0.78306, 0.1262542, 1.043337, 0.6313726, 0, 1, 1,
0.7845808, 0.01036375, 2.332022, 0.6392157, 0, 1, 1,
0.7862327, -1.478166, 1.912551, 0.6431373, 0, 1, 1,
0.7886681, -1.579962, 3.585807, 0.6509804, 0, 1, 1,
0.7929222, -0.8370289, 0.8255447, 0.654902, 0, 1, 1,
0.7945426, 0.05210383, 1.659998, 0.6627451, 0, 1, 1,
0.8096572, -1.573706, 2.522789, 0.6666667, 0, 1, 1,
0.8118565, 0.3791687, 3.239624, 0.6745098, 0, 1, 1,
0.8131709, -1.696372, 1.463616, 0.6784314, 0, 1, 1,
0.8225401, 0.05636627, 1.022963, 0.6862745, 0, 1, 1,
0.8307289, 0.90267, 1.359769, 0.6901961, 0, 1, 1,
0.8317969, -0.7958459, 2.941182, 0.6980392, 0, 1, 1,
0.8330145, -0.8731037, 1.851579, 0.7058824, 0, 1, 1,
0.8331053, -0.3083669, 0.9838324, 0.7098039, 0, 1, 1,
0.8339765, 0.004860466, 0.8979539, 0.7176471, 0, 1, 1,
0.8370044, 1.177088, 0.6117604, 0.7215686, 0, 1, 1,
0.8390235, 2.194944, 0.02565724, 0.7294118, 0, 1, 1,
0.8391895, 0.04821058, -1.139808, 0.7333333, 0, 1, 1,
0.8392538, 1.652526, -1.349753, 0.7411765, 0, 1, 1,
0.8432595, -0.772912, 2.751285, 0.7450981, 0, 1, 1,
0.8433952, -0.1501653, 1.454041, 0.7529412, 0, 1, 1,
0.8478373, -0.1491515, 5.252499, 0.7568628, 0, 1, 1,
0.8528236, 1.34488, 0.498713, 0.7647059, 0, 1, 1,
0.8549464, -0.4122396, 1.443852, 0.7686275, 0, 1, 1,
0.8608029, 1.937598, 0.4819724, 0.7764706, 0, 1, 1,
0.8625874, 0.1772769, 0.6657358, 0.7803922, 0, 1, 1,
0.8642944, 1.932891, 0.8768616, 0.7882353, 0, 1, 1,
0.8742332, -0.2002623, 1.571997, 0.7921569, 0, 1, 1,
0.8803183, 0.114606, 2.324918, 0.8, 0, 1, 1,
0.8808079, -1.004525, 1.532162, 0.8078431, 0, 1, 1,
0.8862601, -2.732125, 3.625767, 0.8117647, 0, 1, 1,
0.8886528, -0.9981152, 1.962237, 0.8196079, 0, 1, 1,
0.8899795, -0.7380957, 3.335593, 0.8235294, 0, 1, 1,
0.8944286, 0.6050647, 1.438217, 0.8313726, 0, 1, 1,
0.8963301, -0.4370827, 1.565483, 0.8352941, 0, 1, 1,
0.9000192, -0.177096, 3.780483, 0.8431373, 0, 1, 1,
0.9005332, 0.2352947, 2.254541, 0.8470588, 0, 1, 1,
0.9022101, 1.454005, 0.6382308, 0.854902, 0, 1, 1,
0.904506, -0.2350182, 1.680716, 0.8588235, 0, 1, 1,
0.9053264, -0.001009546, 2.436779, 0.8666667, 0, 1, 1,
0.9079141, -2.123794, 2.136958, 0.8705882, 0, 1, 1,
0.9090367, -0.1251715, 1.518337, 0.8784314, 0, 1, 1,
0.9121411, -0.1635054, 1.664655, 0.8823529, 0, 1, 1,
0.9132995, -1.086546, 2.681669, 0.8901961, 0, 1, 1,
0.9136901, -0.0253768, 0.5844967, 0.8941177, 0, 1, 1,
0.9218122, -1.533623, 2.486598, 0.9019608, 0, 1, 1,
0.9274455, -0.4196441, 2.196995, 0.9098039, 0, 1, 1,
0.932785, -0.5246024, 1.544269, 0.9137255, 0, 1, 1,
0.9427452, -1.309455, 0.6179783, 0.9215686, 0, 1, 1,
0.9447248, 0.4386996, 1.966958, 0.9254902, 0, 1, 1,
0.9484639, -0.4608763, 2.663919, 0.9333333, 0, 1, 1,
0.950796, 0.2024437, 1.403293, 0.9372549, 0, 1, 1,
0.9555174, -2.002595, 3.02842, 0.945098, 0, 1, 1,
0.9566938, -0.07987643, 1.232474, 0.9490196, 0, 1, 1,
0.9571918, 0.9671671, 1.950328, 0.9568627, 0, 1, 1,
0.9628078, -0.5755655, 1.905173, 0.9607843, 0, 1, 1,
0.9671853, -0.656018, 2.346207, 0.9686275, 0, 1, 1,
0.9680253, 0.02021785, 0.2754518, 0.972549, 0, 1, 1,
0.9739765, 2.096091, 0.03839001, 0.9803922, 0, 1, 1,
0.9747499, 0.9917175, 1.879216, 0.9843137, 0, 1, 1,
0.9850459, -1.98318, 1.6948, 0.9921569, 0, 1, 1,
0.988849, -0.4257668, 2.306589, 0.9960784, 0, 1, 1,
0.9904644, 0.6465748, -1.075902, 1, 0, 0.9960784, 1,
0.9915938, 0.6240954, -0.1736315, 1, 0, 0.9882353, 1,
0.9918737, 0.828397, 1.584118, 1, 0, 0.9843137, 1,
0.9957775, 0.2599451, 1.28337, 1, 0, 0.9764706, 1,
1.007336, 0.5086816, 1.736861, 1, 0, 0.972549, 1,
1.01149, -0.8748106, 2.97052, 1, 0, 0.9647059, 1,
1.014318, -0.6224377, 1.440552, 1, 0, 0.9607843, 1,
1.019015, 0.3535192, 2.351887, 1, 0, 0.9529412, 1,
1.019246, -0.9714207, 2.026729, 1, 0, 0.9490196, 1,
1.025225, -0.4035916, 2.674749, 1, 0, 0.9411765, 1,
1.02936, -1.139999, 1.974129, 1, 0, 0.9372549, 1,
1.02948, 0.2392868, 0.976164, 1, 0, 0.9294118, 1,
1.031381, -0.6361789, 1.104847, 1, 0, 0.9254902, 1,
1.044194, -0.6782697, 2.284419, 1, 0, 0.9176471, 1,
1.044843, -0.2153994, 1.062326, 1, 0, 0.9137255, 1,
1.048995, -0.8542978, 2.284076, 1, 0, 0.9058824, 1,
1.049998, -0.06425098, 1.724324, 1, 0, 0.9019608, 1,
1.050243, -0.172963, 2.397271, 1, 0, 0.8941177, 1,
1.054355, 0.8425228, 1.273999, 1, 0, 0.8862745, 1,
1.054775, 0.1409696, 2.260018, 1, 0, 0.8823529, 1,
1.05497, -0.8116109, 3.328601, 1, 0, 0.8745098, 1,
1.073201, 0.9020397, -0.4521349, 1, 0, 0.8705882, 1,
1.074929, -1.37295, 0.7863729, 1, 0, 0.8627451, 1,
1.075697, 0.6400045, 1.306509, 1, 0, 0.8588235, 1,
1.075855, -1.976563, 1.665147, 1, 0, 0.8509804, 1,
1.078476, 1.234853, 0.8182001, 1, 0, 0.8470588, 1,
1.078842, -1.782418, 3.065215, 1, 0, 0.8392157, 1,
1.080259, -1.183146, 2.403216, 1, 0, 0.8352941, 1,
1.082916, 0.9417799, 0.5605329, 1, 0, 0.827451, 1,
1.086528, 1.58145, 0.4610001, 1, 0, 0.8235294, 1,
1.105145, -1.425555, 3.305753, 1, 0, 0.8156863, 1,
1.105747, -0.7112769, 0.8729931, 1, 0, 0.8117647, 1,
1.1121, -0.5624553, 1.876112, 1, 0, 0.8039216, 1,
1.112636, -0.3331291, 1.871895, 1, 0, 0.7960784, 1,
1.11304, -1.336024, 2.752424, 1, 0, 0.7921569, 1,
1.115244, 1.381974, 1.144177, 1, 0, 0.7843137, 1,
1.121918, -0.8366057, 2.649845, 1, 0, 0.7803922, 1,
1.126877, -2.216931, 0.9041551, 1, 0, 0.772549, 1,
1.128172, 0.8222296, 0.09365045, 1, 0, 0.7686275, 1,
1.130328, -0.6897088, 2.50932, 1, 0, 0.7607843, 1,
1.132657, -0.8714218, 2.429028, 1, 0, 0.7568628, 1,
1.141462, 0.1173601, 2.231984, 1, 0, 0.7490196, 1,
1.149622, 0.05780827, 1.072736, 1, 0, 0.7450981, 1,
1.154768, 0.1071958, 1.863633, 1, 0, 0.7372549, 1,
1.159598, -0.5418549, 1.621997, 1, 0, 0.7333333, 1,
1.159775, -0.3119685, -0.8704554, 1, 0, 0.7254902, 1,
1.170675, -1.299257, 1.011001, 1, 0, 0.7215686, 1,
1.174818, 0.283259, 2.085417, 1, 0, 0.7137255, 1,
1.189546, 1.167848, 1.200408, 1, 0, 0.7098039, 1,
1.192059, 0.6698317, 0.6876025, 1, 0, 0.7019608, 1,
1.197753, 0.01350477, 1.407885, 1, 0, 0.6941177, 1,
1.203223, -0.276632, 1.979632, 1, 0, 0.6901961, 1,
1.204953, 0.5280903, 2.270537, 1, 0, 0.682353, 1,
1.215981, 0.6722358, -0.002221853, 1, 0, 0.6784314, 1,
1.222108, -0.701493, 1.83664, 1, 0, 0.6705883, 1,
1.22788, 1.163937, 0.8001367, 1, 0, 0.6666667, 1,
1.228443, -1.411263, 1.846942, 1, 0, 0.6588235, 1,
1.231157, -0.822741, 1.799771, 1, 0, 0.654902, 1,
1.236383, -0.7649252, 1.861546, 1, 0, 0.6470588, 1,
1.250429, -0.5443389, 0.3115073, 1, 0, 0.6431373, 1,
1.250642, -1.592336, 0.8851613, 1, 0, 0.6352941, 1,
1.256152, -0.9105533, 0.9246718, 1, 0, 0.6313726, 1,
1.256195, -0.2410926, 0.4202653, 1, 0, 0.6235294, 1,
1.258344, 1.846251, -0.09213361, 1, 0, 0.6196079, 1,
1.258569, 2.049014, 0.4331821, 1, 0, 0.6117647, 1,
1.258709, 0.1993553, 1.179817, 1, 0, 0.6078432, 1,
1.27506, -0.3504856, 1.352033, 1, 0, 0.6, 1,
1.278719, -2.519681, 3.064415, 1, 0, 0.5921569, 1,
1.279867, -0.8254048, 2.373902, 1, 0, 0.5882353, 1,
1.307668, 1.381076, 2.223276, 1, 0, 0.5803922, 1,
1.312895, -0.5802968, 2.655343, 1, 0, 0.5764706, 1,
1.313633, 0.9936787, -0.2316817, 1, 0, 0.5686275, 1,
1.314803, 1.82207, 0.9981556, 1, 0, 0.5647059, 1,
1.322646, -0.006736115, 2.429981, 1, 0, 0.5568628, 1,
1.324204, -1.320071, 1.382528, 1, 0, 0.5529412, 1,
1.327074, -2.155982, 3.139075, 1, 0, 0.5450981, 1,
1.328185, 0.2655353, 2.628503, 1, 0, 0.5411765, 1,
1.330604, -1.196732, 2.549511, 1, 0, 0.5333334, 1,
1.340369, 0.3924859, 1.101127, 1, 0, 0.5294118, 1,
1.350023, 1.506015, 2.726528, 1, 0, 0.5215687, 1,
1.350508, 0.2520497, -0.3263278, 1, 0, 0.5176471, 1,
1.35548, 0.3969016, 2.060248, 1, 0, 0.509804, 1,
1.376788, -1.90548, 3.473161, 1, 0, 0.5058824, 1,
1.378476, 0.5528589, 1.436404, 1, 0, 0.4980392, 1,
1.38209, 1.363438, 0.335082, 1, 0, 0.4901961, 1,
1.382926, -0.4338589, 1.972345, 1, 0, 0.4862745, 1,
1.384594, 1.621464, 1.310013, 1, 0, 0.4784314, 1,
1.386789, 1.881303, 1.568408, 1, 0, 0.4745098, 1,
1.39665, 0.7026456, -0.6237411, 1, 0, 0.4666667, 1,
1.398405, 0.829372, -0.6962041, 1, 0, 0.4627451, 1,
1.401206, 0.5493543, 1.19291, 1, 0, 0.454902, 1,
1.409645, 0.300206, -0.1045451, 1, 0, 0.4509804, 1,
1.4269, -0.9263036, 1.527766, 1, 0, 0.4431373, 1,
1.432137, -0.8753724, 1.843429, 1, 0, 0.4392157, 1,
1.437696, -1.743792, 2.024347, 1, 0, 0.4313726, 1,
1.442196, -0.1169325, 0.2751922, 1, 0, 0.427451, 1,
1.44227, -0.183781, 2.537775, 1, 0, 0.4196078, 1,
1.444019, 0.1903337, 1.740111, 1, 0, 0.4156863, 1,
1.455527, 0.369851, 1.261133, 1, 0, 0.4078431, 1,
1.461969, -0.6879231, 2.215067, 1, 0, 0.4039216, 1,
1.462087, -1.164478, 4.049905, 1, 0, 0.3960784, 1,
1.464236, -2.915785, 2.422053, 1, 0, 0.3882353, 1,
1.471422, -1.232628, 0.6537912, 1, 0, 0.3843137, 1,
1.471883, -0.0997407, 0.9501504, 1, 0, 0.3764706, 1,
1.477067, -0.06334619, 1.733889, 1, 0, 0.372549, 1,
1.477116, 0.4788629, 1.81699, 1, 0, 0.3647059, 1,
1.492638, -1.166337, 2.744685, 1, 0, 0.3607843, 1,
1.497828, 1.446741, -1.417257, 1, 0, 0.3529412, 1,
1.499837, 0.8999485, 1.43249, 1, 0, 0.3490196, 1,
1.504435, 0.04224415, 0.8923355, 1, 0, 0.3411765, 1,
1.516885, 0.8671717, 2.371134, 1, 0, 0.3372549, 1,
1.520688, 0.6870621, 0.9151422, 1, 0, 0.3294118, 1,
1.545181, -0.5627441, 2.963974, 1, 0, 0.3254902, 1,
1.547443, 1.858436, -0.9408808, 1, 0, 0.3176471, 1,
1.552803, 0.4501619, 3.080441, 1, 0, 0.3137255, 1,
1.555004, -1.053741, 1.781316, 1, 0, 0.3058824, 1,
1.579426, 0.3686351, 2.54729, 1, 0, 0.2980392, 1,
1.589945, -0.7362357, 2.362304, 1, 0, 0.2941177, 1,
1.590232, 0.6959152, -0.01499447, 1, 0, 0.2862745, 1,
1.592527, -0.6712742, 1.956544, 1, 0, 0.282353, 1,
1.604219, 1.143289, -0.410791, 1, 0, 0.2745098, 1,
1.611913, -0.50539, 3.794318, 1, 0, 0.2705882, 1,
1.624693, 0.8217418, 1.202836, 1, 0, 0.2627451, 1,
1.632841, -1.322464, 2.629491, 1, 0, 0.2588235, 1,
1.644137, -2.969651, 3.16511, 1, 0, 0.2509804, 1,
1.659755, -0.1147334, 3.339249, 1, 0, 0.2470588, 1,
1.683384, -0.6624937, 1.641132, 1, 0, 0.2392157, 1,
1.695306, -0.3839841, 1.087475, 1, 0, 0.2352941, 1,
1.707309, -2.517921, 1.762004, 1, 0, 0.227451, 1,
1.711207, -0.5792441, 2.826177, 1, 0, 0.2235294, 1,
1.713712, -0.1005153, 1.279931, 1, 0, 0.2156863, 1,
1.726037, 1.073258, 1.077577, 1, 0, 0.2117647, 1,
1.740906, 1.050404, 0.2937743, 1, 0, 0.2039216, 1,
1.74636, -0.9718018, 3.242822, 1, 0, 0.1960784, 1,
1.750095, -1.157665, 2.601857, 1, 0, 0.1921569, 1,
1.757158, 1.332735, -1.131763, 1, 0, 0.1843137, 1,
1.803131, 0.4288805, 2.568017, 1, 0, 0.1803922, 1,
1.81638, 1.060463, 0.2515637, 1, 0, 0.172549, 1,
1.82961, 1.217735, 1.187054, 1, 0, 0.1686275, 1,
1.864544, 0.1850735, 0.7860862, 1, 0, 0.1607843, 1,
1.86712, -0.5855818, 1.97718, 1, 0, 0.1568628, 1,
1.872486, -0.1125335, 2.414833, 1, 0, 0.1490196, 1,
1.897683, 1.031402, 1.895598, 1, 0, 0.145098, 1,
1.898958, 1.516282, 1.601243, 1, 0, 0.1372549, 1,
1.904236, -0.07098714, 1.96964, 1, 0, 0.1333333, 1,
1.924627, -1.279964, 2.710048, 1, 0, 0.1254902, 1,
1.940055, 1.176484, 1.653754, 1, 0, 0.1215686, 1,
1.971968, 1.200389, -0.04611093, 1, 0, 0.1137255, 1,
2.010015, 0.2022893, 1.593971, 1, 0, 0.1098039, 1,
2.060677, -1.058556, 2.065279, 1, 0, 0.1019608, 1,
2.076526, 0.7509824, 2.304445, 1, 0, 0.09411765, 1,
2.107025, -0.9328206, 0.4291764, 1, 0, 0.09019608, 1,
2.155341, 0.02193709, 2.472998, 1, 0, 0.08235294, 1,
2.181154, 1.374889, 1.206011, 1, 0, 0.07843138, 1,
2.245808, -0.3291347, 2.621855, 1, 0, 0.07058824, 1,
2.289738, -0.477603, 0.5403108, 1, 0, 0.06666667, 1,
2.333824, -0.3957283, 0.9499857, 1, 0, 0.05882353, 1,
2.334474, -0.4800808, 1.946517, 1, 0, 0.05490196, 1,
2.411171, 1.682995, 0.2960058, 1, 0, 0.04705882, 1,
2.489396, 1.615298, 0.5870428, 1, 0, 0.04313726, 1,
2.607345, -0.5289332, 2.374807, 1, 0, 0.03529412, 1,
2.62863, -0.5342315, 1.088262, 1, 0, 0.03137255, 1,
2.703024, 0.7462127, 0.5097694, 1, 0, 0.02352941, 1,
2.755889, 0.4347833, 1.894035, 1, 0, 0.01960784, 1,
3.362027, 0.5261365, 1.916348, 1, 0, 0.01176471, 1,
3.536995, -0.4864002, 2.323963, 1, 0, 0.007843138, 1
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
-0.1462191, -4.545002, -7.655285, 0, -0.5, 0.5, 0.5,
-0.1462191, -4.545002, -7.655285, 1, -0.5, 0.5, 0.5,
-0.1462191, -4.545002, -7.655285, 1, 1.5, 0.5, 0.5,
-0.1462191, -4.545002, -7.655285, 0, 1.5, 0.5, 0.5
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
-5.078043, -0.01101243, -7.655285, 0, -0.5, 0.5, 0.5,
-5.078043, -0.01101243, -7.655285, 1, -0.5, 0.5, 0.5,
-5.078043, -0.01101243, -7.655285, 1, 1.5, 0.5, 0.5,
-5.078043, -0.01101243, -7.655285, 0, 1.5, 0.5, 0.5
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
-5.078043, -4.545002, -0.2660065, 0, -0.5, 0.5, 0.5,
-5.078043, -4.545002, -0.2660065, 1, -0.5, 0.5, 0.5,
-5.078043, -4.545002, -0.2660065, 1, 1.5, 0.5, 0.5,
-5.078043, -4.545002, -0.2660065, 0, 1.5, 0.5, 0.5
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
-2, -3.498697, -5.950067,
2, -3.498697, -5.950067,
-2, -3.498697, -5.950067,
-2, -3.673081, -6.23427,
0, -3.498697, -5.950067,
0, -3.673081, -6.23427,
2, -3.498697, -5.950067,
2, -3.673081, -6.23427
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
"0",
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
-2, -4.021849, -6.802676, 0, -0.5, 0.5, 0.5,
-2, -4.021849, -6.802676, 1, -0.5, 0.5, 0.5,
-2, -4.021849, -6.802676, 1, 1.5, 0.5, 0.5,
-2, -4.021849, -6.802676, 0, 1.5, 0.5, 0.5,
0, -4.021849, -6.802676, 0, -0.5, 0.5, 0.5,
0, -4.021849, -6.802676, 1, -0.5, 0.5, 0.5,
0, -4.021849, -6.802676, 1, 1.5, 0.5, 0.5,
0, -4.021849, -6.802676, 0, 1.5, 0.5, 0.5,
2, -4.021849, -6.802676, 0, -0.5, 0.5, 0.5,
2, -4.021849, -6.802676, 1, -0.5, 0.5, 0.5,
2, -4.021849, -6.802676, 1, 1.5, 0.5, 0.5,
2, -4.021849, -6.802676, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.93993, -3, -5.950067,
-3.93993, 3, -5.950067,
-3.93993, -3, -5.950067,
-4.129616, -3, -6.23427,
-3.93993, -2, -5.950067,
-4.129616, -2, -6.23427,
-3.93993, -1, -5.950067,
-4.129616, -1, -6.23427,
-3.93993, 0, -5.950067,
-4.129616, 0, -6.23427,
-3.93993, 1, -5.950067,
-4.129616, 1, -6.23427,
-3.93993, 2, -5.950067,
-4.129616, 2, -6.23427,
-3.93993, 3, -5.950067,
-4.129616, 3, -6.23427
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
-4.508987, -3, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, -3, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, -3, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, -3, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, -2, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, -2, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, -2, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, -2, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, -1, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, -1, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, -1, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, -1, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, 0, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, 0, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, 0, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, 0, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, 1, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, 1, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, 1, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, 1, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, 2, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, 2, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, 2, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, 2, -6.802676, 0, 1.5, 0.5, 0.5,
-4.508987, 3, -6.802676, 0, -0.5, 0.5, 0.5,
-4.508987, 3, -6.802676, 1, -0.5, 0.5, 0.5,
-4.508987, 3, -6.802676, 1, 1.5, 0.5, 0.5,
-4.508987, 3, -6.802676, 0, 1.5, 0.5, 0.5
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
-3.93993, -3.498697, -4,
-3.93993, -3.498697, 4,
-3.93993, -3.498697, -4,
-4.129616, -3.673081, -4,
-3.93993, -3.498697, -2,
-4.129616, -3.673081, -2,
-3.93993, -3.498697, 0,
-4.129616, -3.673081, 0,
-3.93993, -3.498697, 2,
-4.129616, -3.673081, 2,
-3.93993, -3.498697, 4,
-4.129616, -3.673081, 4
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
-4.508987, -4.021849, -4, 0, -0.5, 0.5, 0.5,
-4.508987, -4.021849, -4, 1, -0.5, 0.5, 0.5,
-4.508987, -4.021849, -4, 1, 1.5, 0.5, 0.5,
-4.508987, -4.021849, -4, 0, 1.5, 0.5, 0.5,
-4.508987, -4.021849, -2, 0, -0.5, 0.5, 0.5,
-4.508987, -4.021849, -2, 1, -0.5, 0.5, 0.5,
-4.508987, -4.021849, -2, 1, 1.5, 0.5, 0.5,
-4.508987, -4.021849, -2, 0, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 0, 0, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 0, 1, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 0, 1, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 0, 0, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 2, 0, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 2, 1, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 2, 1, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 2, 0, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 4, 0, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 4, 1, -0.5, 0.5, 0.5,
-4.508987, -4.021849, 4, 1, 1.5, 0.5, 0.5,
-4.508987, -4.021849, 4, 0, 1.5, 0.5, 0.5
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
-3.93993, -3.498697, -5.950067,
-3.93993, 3.476672, -5.950067,
-3.93993, -3.498697, 5.418054,
-3.93993, 3.476672, 5.418054,
-3.93993, -3.498697, -5.950067,
-3.93993, -3.498697, 5.418054,
-3.93993, 3.476672, -5.950067,
-3.93993, 3.476672, 5.418054,
-3.93993, -3.498697, -5.950067,
3.647492, -3.498697, -5.950067,
-3.93993, -3.498697, 5.418054,
3.647492, -3.498697, 5.418054,
-3.93993, 3.476672, -5.950067,
3.647492, 3.476672, -5.950067,
-3.93993, 3.476672, 5.418054,
3.647492, 3.476672, 5.418054,
3.647492, -3.498697, -5.950067,
3.647492, 3.476672, -5.950067,
3.647492, -3.498697, 5.418054,
3.647492, 3.476672, 5.418054,
3.647492, -3.498697, -5.950067,
3.647492, -3.498697, 5.418054,
3.647492, 3.476672, -5.950067,
3.647492, 3.476672, 5.418054
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
var radius = 8.193756;
var distance = 36.45495;
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
mvMatrix.translate( 0.1462191, 0.01101243, 0.2660065 );
mvMatrix.scale( 1.167623, 1.270076, 0.7793064 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.45495);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


