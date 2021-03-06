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
-2.58922, 1.509034, -0.02962556, 1, 0, 0, 1,
-2.541768, 1.807065, -1.459942, 1, 0.007843138, 0, 1,
-2.53659, 1.084034, -3.264622, 1, 0.01176471, 0, 1,
-2.50996, 1.240206, -2.517316, 1, 0.01960784, 0, 1,
-2.491803, -0.07301205, -1.765865, 1, 0.02352941, 0, 1,
-2.464943, 0.9316193, -0.7057049, 1, 0.03137255, 0, 1,
-2.461146, -1.019834, -1.025783, 1, 0.03529412, 0, 1,
-2.449963, -1.359789, -1.38791, 1, 0.04313726, 0, 1,
-2.415597, -0.5259253, -1.462116, 1, 0.04705882, 0, 1,
-2.402845, -0.2041418, -2.288467, 1, 0.05490196, 0, 1,
-2.370817, -0.3146267, -2.253725, 1, 0.05882353, 0, 1,
-2.317798, -0.09697825, -2.004565, 1, 0.06666667, 0, 1,
-2.305128, 1.890824, 1.74803, 1, 0.07058824, 0, 1,
-2.255285, -0.4846784, -2.347211, 1, 0.07843138, 0, 1,
-2.249557, 0.4356739, -2.089742, 1, 0.08235294, 0, 1,
-2.233295, 0.8192943, -1.274917, 1, 0.09019608, 0, 1,
-2.232987, -0.7660505, -2.787194, 1, 0.09411765, 0, 1,
-2.230956, 0.8178055, -1.416971, 1, 0.1019608, 0, 1,
-2.203569, 0.8498091, 0.4091862, 1, 0.1098039, 0, 1,
-2.163761, -0.2323242, -2.071848, 1, 0.1137255, 0, 1,
-2.114374, 1.18694, -2.064944, 1, 0.1215686, 0, 1,
-2.097359, -0.7401322, -1.678892, 1, 0.1254902, 0, 1,
-2.095985, 0.9860981, -0.7196999, 1, 0.1333333, 0, 1,
-2.090666, 2.237346, -0.6260015, 1, 0.1372549, 0, 1,
-2.049964, 0.5285325, -0.1853302, 1, 0.145098, 0, 1,
-2.033432, -1.345825, -1.273523, 1, 0.1490196, 0, 1,
-2.030143, -1.34432, -1.477079, 1, 0.1568628, 0, 1,
-1.963265, -0.9831514, -4.12183, 1, 0.1607843, 0, 1,
-1.930845, -1.092591, -2.65923, 1, 0.1686275, 0, 1,
-1.929044, -0.2700705, -1.538996, 1, 0.172549, 0, 1,
-1.908749, 0.165049, -1.453043, 1, 0.1803922, 0, 1,
-1.899933, -0.7975202, -1.843579, 1, 0.1843137, 0, 1,
-1.897333, -0.1821435, -2.222047, 1, 0.1921569, 0, 1,
-1.881551, -1.891345, -2.249147, 1, 0.1960784, 0, 1,
-1.871816, -1.307144, -1.656081, 1, 0.2039216, 0, 1,
-1.866116, -0.9864315, -3.091969, 1, 0.2117647, 0, 1,
-1.857139, 0.3722898, -1.900142, 1, 0.2156863, 0, 1,
-1.837613, 1.556745, 0.6561101, 1, 0.2235294, 0, 1,
-1.829939, -0.5806732, -2.208125, 1, 0.227451, 0, 1,
-1.821033, 1.092503, -2.178069, 1, 0.2352941, 0, 1,
-1.809899, -0.5971511, -1.885491, 1, 0.2392157, 0, 1,
-1.805774, -1.278845, -0.1419936, 1, 0.2470588, 0, 1,
-1.801697, 0.3970788, -0.8078186, 1, 0.2509804, 0, 1,
-1.7996, -0.3934296, 1.303978, 1, 0.2588235, 0, 1,
-1.76125, 0.8239686, -1.155081, 1, 0.2627451, 0, 1,
-1.761022, 0.8477259, -0.6837254, 1, 0.2705882, 0, 1,
-1.731241, -0.7868253, -1.880741, 1, 0.2745098, 0, 1,
-1.724186, -1.980511, -3.312599, 1, 0.282353, 0, 1,
-1.702002, -0.2819779, -0.354728, 1, 0.2862745, 0, 1,
-1.659854, 0.3804272, -0.4581911, 1, 0.2941177, 0, 1,
-1.617105, -0.1510001, -1.339893, 1, 0.3019608, 0, 1,
-1.613009, 0.395622, -1.890513, 1, 0.3058824, 0, 1,
-1.606161, 0.6672182, -2.438438, 1, 0.3137255, 0, 1,
-1.602777, -0.1497467, -2.161534, 1, 0.3176471, 0, 1,
-1.599007, -1.153131, -2.397192, 1, 0.3254902, 0, 1,
-1.589141, 0.9663165, -0.2223725, 1, 0.3294118, 0, 1,
-1.575591, -1.073778, -3.576312, 1, 0.3372549, 0, 1,
-1.573864, -0.7396492, -2.352679, 1, 0.3411765, 0, 1,
-1.560484, 0.08069911, -0.6425629, 1, 0.3490196, 0, 1,
-1.545931, -0.5684056, -1.305681, 1, 0.3529412, 0, 1,
-1.545684, 0.1254745, -1.047036, 1, 0.3607843, 0, 1,
-1.543306, 0.7627883, -0.3877905, 1, 0.3647059, 0, 1,
-1.537042, -1.627119, -2.035895, 1, 0.372549, 0, 1,
-1.507694, -0.1776233, -0.7987705, 1, 0.3764706, 0, 1,
-1.492092, -0.426849, -1.997738, 1, 0.3843137, 0, 1,
-1.486212, 0.1250209, 0.3514639, 1, 0.3882353, 0, 1,
-1.470407, -0.6943282, -4.351718, 1, 0.3960784, 0, 1,
-1.467131, 0.23328, -3.72218, 1, 0.4039216, 0, 1,
-1.456441, 0.08914313, -0.5394881, 1, 0.4078431, 0, 1,
-1.453443, 1.646614, 0.3215128, 1, 0.4156863, 0, 1,
-1.450539, -0.3926851, -1.792668, 1, 0.4196078, 0, 1,
-1.443432, 0.9682183, -0.9344659, 1, 0.427451, 0, 1,
-1.435747, 0.8152951, -1.251089, 1, 0.4313726, 0, 1,
-1.432823, -1.097964, -3.890378, 1, 0.4392157, 0, 1,
-1.413467, 0.3853048, -1.350578, 1, 0.4431373, 0, 1,
-1.413193, -1.480475, -2.771567, 1, 0.4509804, 0, 1,
-1.395901, -0.1629679, -2.69747, 1, 0.454902, 0, 1,
-1.387248, 1.495256, -0.2977991, 1, 0.4627451, 0, 1,
-1.385449, -0.9465432, -2.828864, 1, 0.4666667, 0, 1,
-1.380855, -1.332034, -0.9461833, 1, 0.4745098, 0, 1,
-1.37969, 1.718059, -1.744173, 1, 0.4784314, 0, 1,
-1.3379, 0.4021631, -0.353094, 1, 0.4862745, 0, 1,
-1.336976, -0.6083265, -1.458744, 1, 0.4901961, 0, 1,
-1.329481, 0.05428467, -1.803387, 1, 0.4980392, 0, 1,
-1.327496, 0.3953556, 1.224318, 1, 0.5058824, 0, 1,
-1.323172, -0.7243814, -3.343615, 1, 0.509804, 0, 1,
-1.321943, 0.3796828, -1.491284, 1, 0.5176471, 0, 1,
-1.317551, 0.5790519, -0.08539479, 1, 0.5215687, 0, 1,
-1.315311, -2.213283, -0.5476261, 1, 0.5294118, 0, 1,
-1.312343, 0.06217087, -1.985493, 1, 0.5333334, 0, 1,
-1.301401, 1.372902, -0.099849, 1, 0.5411765, 0, 1,
-1.29612, 0.4587717, -1.767868, 1, 0.5450981, 0, 1,
-1.293783, 0.3415748, -4.587805, 1, 0.5529412, 0, 1,
-1.290227, 0.4497322, 1.186858, 1, 0.5568628, 0, 1,
-1.289252, -1.236139, -2.806786, 1, 0.5647059, 0, 1,
-1.28604, -0.4102297, -1.740952, 1, 0.5686275, 0, 1,
-1.273979, 0.05228941, -1.369252, 1, 0.5764706, 0, 1,
-1.273436, -0.6876802, -2.5739, 1, 0.5803922, 0, 1,
-1.266417, -0.8840844, -2.089577, 1, 0.5882353, 0, 1,
-1.26028, -0.2498999, -1.41478, 1, 0.5921569, 0, 1,
-1.246478, -0.3109272, -2.33527, 1, 0.6, 0, 1,
-1.246215, -1.775432, -2.509504, 1, 0.6078432, 0, 1,
-1.243757, -2.861074, -2.902249, 1, 0.6117647, 0, 1,
-1.243264, -0.1442174, -1.776754, 1, 0.6196079, 0, 1,
-1.235478, 0.1322632, -1.544853, 1, 0.6235294, 0, 1,
-1.235048, -0.5042579, -1.681259, 1, 0.6313726, 0, 1,
-1.23217, 0.05819599, -0.2751333, 1, 0.6352941, 0, 1,
-1.230167, 0.8001837, -0.4014629, 1, 0.6431373, 0, 1,
-1.222624, 0.9858226, -0.7060211, 1, 0.6470588, 0, 1,
-1.218909, 0.06261799, -3.383425, 1, 0.654902, 0, 1,
-1.217549, 0.1687748, -2.391057, 1, 0.6588235, 0, 1,
-1.217319, 0.1475943, -1.824125, 1, 0.6666667, 0, 1,
-1.204745, -0.1665217, -0.7556969, 1, 0.6705883, 0, 1,
-1.203277, -0.9949955, -3.202202, 1, 0.6784314, 0, 1,
-1.197423, 0.870839, -0.8246488, 1, 0.682353, 0, 1,
-1.19278, -0.8864418, -1.469507, 1, 0.6901961, 0, 1,
-1.188683, 1.726263, -0.8206183, 1, 0.6941177, 0, 1,
-1.185214, -0.05245366, -1.581306, 1, 0.7019608, 0, 1,
-1.177604, 1.652213, -0.5051407, 1, 0.7098039, 0, 1,
-1.170542, -0.8537469, -2.88623, 1, 0.7137255, 0, 1,
-1.162161, 0.2270331, -1.639856, 1, 0.7215686, 0, 1,
-1.15754, 0.2780771, -2.750093, 1, 0.7254902, 0, 1,
-1.149131, -0.1943345, -1.024149, 1, 0.7333333, 0, 1,
-1.148751, 0.7417042, 0.9691578, 1, 0.7372549, 0, 1,
-1.146029, -0.3597611, -1.456228, 1, 0.7450981, 0, 1,
-1.136895, 0.5104976, -1.619278, 1, 0.7490196, 0, 1,
-1.129666, 1.735451, -0.3994775, 1, 0.7568628, 0, 1,
-1.124273, 0.0961803, -1.904648, 1, 0.7607843, 0, 1,
-1.12054, -0.008212316, -0.4983355, 1, 0.7686275, 0, 1,
-1.111376, 0.5182244, -2.898174, 1, 0.772549, 0, 1,
-1.100906, 1.153282, -1.136341, 1, 0.7803922, 0, 1,
-1.098978, 1.275041, -1.354204, 1, 0.7843137, 0, 1,
-1.088313, 0.3863227, -2.016762, 1, 0.7921569, 0, 1,
-1.086629, 0.442383, -2.712943, 1, 0.7960784, 0, 1,
-1.07964, -0.6189498, -1.769554, 1, 0.8039216, 0, 1,
-1.06797, 0.4595777, -1.574646, 1, 0.8117647, 0, 1,
-1.057526, 1.916769, -1.909022, 1, 0.8156863, 0, 1,
-1.04559, -1.480541, -3.18624, 1, 0.8235294, 0, 1,
-1.043543, 1.119129, -1.435896, 1, 0.827451, 0, 1,
-1.031725, -0.1665345, -0.5568265, 1, 0.8352941, 0, 1,
-1.024708, 0.1264663, -2.418152, 1, 0.8392157, 0, 1,
-1.0236, -1.432322, -4.01392, 1, 0.8470588, 0, 1,
-1.021309, -0.04836636, -2.89638, 1, 0.8509804, 0, 1,
-1.018701, -1.419942, -3.797008, 1, 0.8588235, 0, 1,
-1.0167, 0.1457797, -1.351664, 1, 0.8627451, 0, 1,
-1.014285, 0.9799774, -2.010634, 1, 0.8705882, 0, 1,
-1.011419, -0.5610998, -3.813449, 1, 0.8745098, 0, 1,
-1.009263, -0.07507084, -1.217467, 1, 0.8823529, 0, 1,
-1.007841, -1.836674, -2.511677, 1, 0.8862745, 0, 1,
-1.004182, 0.02205673, -0.03990675, 1, 0.8941177, 0, 1,
-0.9999744, 0.2650596, -0.5690265, 1, 0.8980392, 0, 1,
-0.9848208, -1.730152, -2.239647, 1, 0.9058824, 0, 1,
-0.9831273, -0.2640084, -1.302562, 1, 0.9137255, 0, 1,
-0.9808998, -0.9319373, -2.094728, 1, 0.9176471, 0, 1,
-0.9759226, -1.955197, -3.61939, 1, 0.9254902, 0, 1,
-0.9711864, 0.3760942, -0.372279, 1, 0.9294118, 0, 1,
-0.9644091, 1.33289, 1.183881, 1, 0.9372549, 0, 1,
-0.9631204, -0.5469899, -1.603437, 1, 0.9411765, 0, 1,
-0.9602605, 0.7028892, 0.9563168, 1, 0.9490196, 0, 1,
-0.9593589, 1.537334, 2.589898, 1, 0.9529412, 0, 1,
-0.9540388, 0.8035088, -0.9282752, 1, 0.9607843, 0, 1,
-0.9499354, -0.1055852, -2.276386, 1, 0.9647059, 0, 1,
-0.9459886, -0.1572507, -1.533563, 1, 0.972549, 0, 1,
-0.9357653, 0.5872129, -1.979576, 1, 0.9764706, 0, 1,
-0.9347761, 0.2888899, -2.660536, 1, 0.9843137, 0, 1,
-0.9314858, 0.00611688, -0.5047123, 1, 0.9882353, 0, 1,
-0.9297251, -0.5042502, -1.94594, 1, 0.9960784, 0, 1,
-0.9259907, 0.2646345, -2.730282, 0.9960784, 1, 0, 1,
-0.9259004, -0.3073119, -1.353879, 0.9921569, 1, 0, 1,
-0.9225199, 0.002819162, -3.885505, 0.9843137, 1, 0, 1,
-0.9224601, 2.20801, 1.337062, 0.9803922, 1, 0, 1,
-0.919127, -1.852111, -2.518517, 0.972549, 1, 0, 1,
-0.9167302, -1.709446, -1.388197, 0.9686275, 1, 0, 1,
-0.9159642, -0.308937, -1.978244, 0.9607843, 1, 0, 1,
-0.915213, -1.059922, -2.228878, 0.9568627, 1, 0, 1,
-0.9140895, 0.06294235, -2.380298, 0.9490196, 1, 0, 1,
-0.9108874, -0.9182819, -1.88206, 0.945098, 1, 0, 1,
-0.9108427, 1.887226, -1.348312, 0.9372549, 1, 0, 1,
-0.9017451, 0.2071877, -0.1612565, 0.9333333, 1, 0, 1,
-0.9000808, -1.481679, -1.194769, 0.9254902, 1, 0, 1,
-0.8961543, 1.176333, -0.6222367, 0.9215686, 1, 0, 1,
-0.8928162, -1.538476, -2.240861, 0.9137255, 1, 0, 1,
-0.8893293, -1.708726, -1.472149, 0.9098039, 1, 0, 1,
-0.8820353, 1.789953, 0.1551782, 0.9019608, 1, 0, 1,
-0.8794287, -0.7410677, -0.4969068, 0.8941177, 1, 0, 1,
-0.8785738, 1.694624, -0.3415731, 0.8901961, 1, 0, 1,
-0.8757631, 0.7912335, 0.6546726, 0.8823529, 1, 0, 1,
-0.8711904, -0.7554443, -2.845185, 0.8784314, 1, 0, 1,
-0.8677832, 0.9946533, -1.818538, 0.8705882, 1, 0, 1,
-0.8653725, 0.2454747, -2.128312, 0.8666667, 1, 0, 1,
-0.856912, 1.705379, -2.73993, 0.8588235, 1, 0, 1,
-0.8564166, 0.343102, -0.426403, 0.854902, 1, 0, 1,
-0.8554196, 0.4023961, -0.296434, 0.8470588, 1, 0, 1,
-0.8532231, -1.029339, -2.213539, 0.8431373, 1, 0, 1,
-0.8503237, -0.9712436, -2.979916, 0.8352941, 1, 0, 1,
-0.8486031, -0.3838592, -1.017035, 0.8313726, 1, 0, 1,
-0.8434392, 0.9241505, -1.652735, 0.8235294, 1, 0, 1,
-0.8385989, -0.592393, -2.453564, 0.8196079, 1, 0, 1,
-0.8367589, -1.303709, -0.7101817, 0.8117647, 1, 0, 1,
-0.8347327, 0.9732068, -1.530549, 0.8078431, 1, 0, 1,
-0.8337033, -0.5508571, -3.06769, 0.8, 1, 0, 1,
-0.8304838, -0.2329304, -0.3254029, 0.7921569, 1, 0, 1,
-0.8243517, 0.4100126, -0.8728824, 0.7882353, 1, 0, 1,
-0.8241796, -1.260008, -1.709946, 0.7803922, 1, 0, 1,
-0.8184056, 1.29957, -0.160963, 0.7764706, 1, 0, 1,
-0.8158996, -0.1264215, -1.038237, 0.7686275, 1, 0, 1,
-0.8136023, 1.332493, -1.056118, 0.7647059, 1, 0, 1,
-0.8028923, -0.6182409, -3.056453, 0.7568628, 1, 0, 1,
-0.7954614, -1.59297, -0.9831901, 0.7529412, 1, 0, 1,
-0.7930452, 1.591648, -0.3204297, 0.7450981, 1, 0, 1,
-0.7863041, -0.2550014, -2.145088, 0.7411765, 1, 0, 1,
-0.7846655, 0.9165227, -0.7944833, 0.7333333, 1, 0, 1,
-0.7828062, -0.01578848, -1.731308, 0.7294118, 1, 0, 1,
-0.7813495, 1.838194, 1.193423, 0.7215686, 1, 0, 1,
-0.7794588, 0.8971453, -0.4283124, 0.7176471, 1, 0, 1,
-0.7793007, -0.7345848, -2.254557, 0.7098039, 1, 0, 1,
-0.7769414, -1.087031, -4.235816, 0.7058824, 1, 0, 1,
-0.7744095, 0.4947968, 0.1959202, 0.6980392, 1, 0, 1,
-0.7734677, -0.4426023, -2.20401, 0.6901961, 1, 0, 1,
-0.768961, 1.956244, -0.260579, 0.6862745, 1, 0, 1,
-0.7640643, 2.148026, -0.1817006, 0.6784314, 1, 0, 1,
-0.7617806, -0.8940885, -2.137922, 0.6745098, 1, 0, 1,
-0.7572825, 0.8133773, -1.582848, 0.6666667, 1, 0, 1,
-0.7559422, 0.05432175, -1.84792, 0.6627451, 1, 0, 1,
-0.7546854, 0.7472707, -1.392464, 0.654902, 1, 0, 1,
-0.7517242, -1.021096, -1.068534, 0.6509804, 1, 0, 1,
-0.7487555, 0.6836908, -0.3881068, 0.6431373, 1, 0, 1,
-0.7483698, -0.265452, -1.901735, 0.6392157, 1, 0, 1,
-0.7478669, -0.4362748, -1.064285, 0.6313726, 1, 0, 1,
-0.7419177, 1.125933, -1.492683, 0.627451, 1, 0, 1,
-0.7383986, 0.4281781, -1.158873, 0.6196079, 1, 0, 1,
-0.7381235, 1.570744, -1.655616, 0.6156863, 1, 0, 1,
-0.7369943, 0.396564, -1.498728, 0.6078432, 1, 0, 1,
-0.7355449, 0.1833239, -0.9137815, 0.6039216, 1, 0, 1,
-0.7241482, -1.027327, -2.507354, 0.5960785, 1, 0, 1,
-0.7239611, 0.008606531, 0.4931396, 0.5882353, 1, 0, 1,
-0.7190499, 0.2045258, -2.330605, 0.5843138, 1, 0, 1,
-0.7057365, -0.7077004, -0.8809612, 0.5764706, 1, 0, 1,
-0.6950829, -0.9295425, -0.7874898, 0.572549, 1, 0, 1,
-0.6937273, -0.4718201, -2.400147, 0.5647059, 1, 0, 1,
-0.6926458, -0.2858666, -1.879832, 0.5607843, 1, 0, 1,
-0.6905441, 1.591472, 0.02975663, 0.5529412, 1, 0, 1,
-0.6886813, 1.617233, -0.2486166, 0.5490196, 1, 0, 1,
-0.682022, -1.49551, -4.387028, 0.5411765, 1, 0, 1,
-0.6804724, 0.6410833, -0.09206009, 0.5372549, 1, 0, 1,
-0.6769872, -0.6967502, -1.503569, 0.5294118, 1, 0, 1,
-0.6715086, -0.3932843, -1.570122, 0.5254902, 1, 0, 1,
-0.6660618, -0.1578191, -2.871293, 0.5176471, 1, 0, 1,
-0.661978, 0.7718408, -1.526369, 0.5137255, 1, 0, 1,
-0.6603723, -0.03384981, -2.206278, 0.5058824, 1, 0, 1,
-0.6503863, -0.4137785, -3.188378, 0.5019608, 1, 0, 1,
-0.6493794, 1.114423, 0.1951228, 0.4941176, 1, 0, 1,
-0.6492392, 0.3159983, -3.217612, 0.4862745, 1, 0, 1,
-0.6488121, -0.7812617, -3.039828, 0.4823529, 1, 0, 1,
-0.6428444, -0.6415458, -1.411342, 0.4745098, 1, 0, 1,
-0.6390449, 1.039943, 0.5592812, 0.4705882, 1, 0, 1,
-0.6375239, 0.3245717, -1.459023, 0.4627451, 1, 0, 1,
-0.6365735, -1.184504, -1.435311, 0.4588235, 1, 0, 1,
-0.6343915, -1.254786, -3.726541, 0.4509804, 1, 0, 1,
-0.6343822, 0.274191, -1.305748, 0.4470588, 1, 0, 1,
-0.6231064, -1.053449, -1.239581, 0.4392157, 1, 0, 1,
-0.6228184, -2.135941, -3.311371, 0.4352941, 1, 0, 1,
-0.6087214, 0.9334916, -1.916093, 0.427451, 1, 0, 1,
-0.6069389, 0.2829262, -0.1865959, 0.4235294, 1, 0, 1,
-0.6044465, -0.4974318, -2.714337, 0.4156863, 1, 0, 1,
-0.603605, -1.203217, -2.550143, 0.4117647, 1, 0, 1,
-0.5960898, 0.9487304, -0.6059858, 0.4039216, 1, 0, 1,
-0.5934286, 2.044758, -1.013893, 0.3960784, 1, 0, 1,
-0.5923091, -0.1865585, -1.91155, 0.3921569, 1, 0, 1,
-0.5879186, 2.425264, 0.8534359, 0.3843137, 1, 0, 1,
-0.5805064, 0.746599, 0.3037702, 0.3803922, 1, 0, 1,
-0.5786629, -1.42671, -6.006128, 0.372549, 1, 0, 1,
-0.5783741, 1.460246, 0.4069021, 0.3686275, 1, 0, 1,
-0.574101, -0.7361469, -1.671261, 0.3607843, 1, 0, 1,
-0.5712935, 0.1202202, -3.112613, 0.3568628, 1, 0, 1,
-0.5692312, -1.73784, -3.397041, 0.3490196, 1, 0, 1,
-0.5663028, 0.7683926, -1.512931, 0.345098, 1, 0, 1,
-0.5662898, 0.6674185, -1.029266, 0.3372549, 1, 0, 1,
-0.5593948, 0.1353714, -2.212038, 0.3333333, 1, 0, 1,
-0.5569598, 0.5351121, -0.2090846, 0.3254902, 1, 0, 1,
-0.5520175, -0.3557148, -1.467881, 0.3215686, 1, 0, 1,
-0.5514157, 1.132163, -1.157996, 0.3137255, 1, 0, 1,
-0.5500078, 0.04749473, -2.364344, 0.3098039, 1, 0, 1,
-0.5469736, 3.139736, -0.8153472, 0.3019608, 1, 0, 1,
-0.5411188, -0.9840865, -2.437677, 0.2941177, 1, 0, 1,
-0.5401005, -0.8466315, -1.652314, 0.2901961, 1, 0, 1,
-0.5391354, 0.3035207, -1.933573, 0.282353, 1, 0, 1,
-0.5347243, 0.02470997, -1.804688, 0.2784314, 1, 0, 1,
-0.5331469, 1.380687, -1.233597, 0.2705882, 1, 0, 1,
-0.5324606, -0.3293743, -2.493856, 0.2666667, 1, 0, 1,
-0.5259249, 0.476431, -1.253486, 0.2588235, 1, 0, 1,
-0.5257672, 0.5952368, -1.556048, 0.254902, 1, 0, 1,
-0.523492, -0.7475467, -2.677748, 0.2470588, 1, 0, 1,
-0.5230114, 0.1926511, -2.360766, 0.2431373, 1, 0, 1,
-0.5225743, 2.040587, -0.8681034, 0.2352941, 1, 0, 1,
-0.5215046, 0.2888793, -0.3629943, 0.2313726, 1, 0, 1,
-0.5179778, 1.384368, 0.8750247, 0.2235294, 1, 0, 1,
-0.5140741, 0.7808254, -2.898839, 0.2196078, 1, 0, 1,
-0.513865, -0.2160699, -2.349044, 0.2117647, 1, 0, 1,
-0.5105686, 0.512723, -0.6633148, 0.2078431, 1, 0, 1,
-0.5035928, 0.1494753, -2.159705, 0.2, 1, 0, 1,
-0.5035663, 1.140933, -0.3395926, 0.1921569, 1, 0, 1,
-0.5035307, -0.5076912, -2.360194, 0.1882353, 1, 0, 1,
-0.4992974, 0.1711715, -0.6311299, 0.1803922, 1, 0, 1,
-0.4989218, -0.4094354, -2.263839, 0.1764706, 1, 0, 1,
-0.487509, 1.621343, -0.6972841, 0.1686275, 1, 0, 1,
-0.4875035, -1.196705, -2.67619, 0.1647059, 1, 0, 1,
-0.4867021, 0.3618278, -0.742235, 0.1568628, 1, 0, 1,
-0.4802713, -1.486177, -2.691367, 0.1529412, 1, 0, 1,
-0.4799048, 1.525948, 0.3062527, 0.145098, 1, 0, 1,
-0.473665, 0.9548484, -1.634756, 0.1411765, 1, 0, 1,
-0.4720826, 0.5527316, 0.04876249, 0.1333333, 1, 0, 1,
-0.4710887, -0.5424514, -3.050391, 0.1294118, 1, 0, 1,
-0.4710381, -0.4681414, -1.599247, 0.1215686, 1, 0, 1,
-0.4648542, -0.4049643, -2.399636, 0.1176471, 1, 0, 1,
-0.4631954, 1.169371, -1.129776, 0.1098039, 1, 0, 1,
-0.4620834, 1.167287, 0.902557, 0.1058824, 1, 0, 1,
-0.4612055, -0.4094065, -1.799948, 0.09803922, 1, 0, 1,
-0.4545329, 1.276058, -1.759515, 0.09019608, 1, 0, 1,
-0.4544804, 0.02262772, 0.07575707, 0.08627451, 1, 0, 1,
-0.4519292, 1.347229, 1.058168, 0.07843138, 1, 0, 1,
-0.4457031, 1.738698, -0.6052307, 0.07450981, 1, 0, 1,
-0.4437831, -0.8396183, -2.316351, 0.06666667, 1, 0, 1,
-0.4414402, -0.185405, -1.228238, 0.0627451, 1, 0, 1,
-0.4373287, -2.350406, -4.544683, 0.05490196, 1, 0, 1,
-0.4258636, 1.246935, 0.8178655, 0.05098039, 1, 0, 1,
-0.4214475, 0.2420622, -2.822982, 0.04313726, 1, 0, 1,
-0.4177915, 2.473149, 0.8668826, 0.03921569, 1, 0, 1,
-0.4174688, 0.034208, -0.4470865, 0.03137255, 1, 0, 1,
-0.4132674, -0.1417416, 0.2866142, 0.02745098, 1, 0, 1,
-0.4104305, 0.9407237, -0.410759, 0.01960784, 1, 0, 1,
-0.4101969, 1.387326, -0.615136, 0.01568628, 1, 0, 1,
-0.407762, -0.2132748, -2.935401, 0.007843138, 1, 0, 1,
-0.4075458, -0.02026847, -1.064668, 0.003921569, 1, 0, 1,
-0.3990952, -0.3752813, -2.267456, 0, 1, 0.003921569, 1,
-0.3981935, -1.038542, -4.376004, 0, 1, 0.01176471, 1,
-0.3903485, -1.329219, -2.975548, 0, 1, 0.01568628, 1,
-0.389207, 0.1453269, -0.4684189, 0, 1, 0.02352941, 1,
-0.3866813, 0.605391, -0.3931289, 0, 1, 0.02745098, 1,
-0.3817552, 1.15667, -1.074752, 0, 1, 0.03529412, 1,
-0.3808864, -0.2311411, -1.531343, 0, 1, 0.03921569, 1,
-0.3792055, -1.983161, -3.798209, 0, 1, 0.04705882, 1,
-0.3768634, 0.03046899, -0.7870467, 0, 1, 0.05098039, 1,
-0.3764872, 1.482026, -0.04324129, 0, 1, 0.05882353, 1,
-0.3763502, 0.0756615, -0.2406686, 0, 1, 0.0627451, 1,
-0.3746009, 0.05458007, -1.838294, 0, 1, 0.07058824, 1,
-0.3668405, 1.569067, 1.858061, 0, 1, 0.07450981, 1,
-0.3663689, 0.1428535, -2.307349, 0, 1, 0.08235294, 1,
-0.3659641, 0.2268689, -1.263237, 0, 1, 0.08627451, 1,
-0.3650861, -1.724379, -2.533561, 0, 1, 0.09411765, 1,
-0.3649049, -0.5469255, -2.578114, 0, 1, 0.1019608, 1,
-0.3617059, 0.869406, -0.4309362, 0, 1, 0.1058824, 1,
-0.3601907, 0.2759635, -0.3240923, 0, 1, 0.1137255, 1,
-0.3527393, -0.6672837, -2.639929, 0, 1, 0.1176471, 1,
-0.352068, 1.840337, 0.3065969, 0, 1, 0.1254902, 1,
-0.3499699, -1.550022, -2.148939, 0, 1, 0.1294118, 1,
-0.3437037, -0.8722515, -2.829558, 0, 1, 0.1372549, 1,
-0.3430197, -0.6189892, -2.427743, 0, 1, 0.1411765, 1,
-0.3415345, -1.574446, -2.744153, 0, 1, 0.1490196, 1,
-0.3410973, -0.1339607, -1.818654, 0, 1, 0.1529412, 1,
-0.3410956, 1.025747, 0.04248833, 0, 1, 0.1607843, 1,
-0.3405175, -2.833738, -3.657662, 0, 1, 0.1647059, 1,
-0.3375552, 0.7316446, -1.287715, 0, 1, 0.172549, 1,
-0.3375028, 1.538872, 0.3863598, 0, 1, 0.1764706, 1,
-0.3308356, 0.7618887, 1.701673, 0, 1, 0.1843137, 1,
-0.3285822, 0.3922229, -1.402688, 0, 1, 0.1882353, 1,
-0.3255456, -1.236283, -2.972515, 0, 1, 0.1960784, 1,
-0.3190471, -0.4672448, -2.247967, 0, 1, 0.2039216, 1,
-0.317327, -1.604459, -2.246152, 0, 1, 0.2078431, 1,
-0.3156164, 0.3690796, -2.392351, 0, 1, 0.2156863, 1,
-0.315569, 0.001918359, -1.029328, 0, 1, 0.2196078, 1,
-0.3114203, 0.8043346, -0.912609, 0, 1, 0.227451, 1,
-0.3083033, -0.5446966, -0.3418866, 0, 1, 0.2313726, 1,
-0.3067064, 0.276705, -0.6533077, 0, 1, 0.2392157, 1,
-0.3041841, 0.6387256, -1.59559, 0, 1, 0.2431373, 1,
-0.3036318, 2.007221, -1.63452, 0, 1, 0.2509804, 1,
-0.3033363, -0.2027572, -0.6731657, 0, 1, 0.254902, 1,
-0.2993084, -1.075664, -1.276334, 0, 1, 0.2627451, 1,
-0.2924401, 0.429224, -1.463659, 0, 1, 0.2666667, 1,
-0.2915798, -0.4501204, -3.955941, 0, 1, 0.2745098, 1,
-0.2911251, -2.780066, -0.4732365, 0, 1, 0.2784314, 1,
-0.2876374, 0.2757539, 0.7492809, 0, 1, 0.2862745, 1,
-0.2872969, 2.147707, 0.3407627, 0, 1, 0.2901961, 1,
-0.2832023, -1.090232, -3.382933, 0, 1, 0.2980392, 1,
-0.2813719, 0.9156324, 0.6575361, 0, 1, 0.3058824, 1,
-0.279964, -0.147355, -1.690446, 0, 1, 0.3098039, 1,
-0.2744116, -2.363173, -2.229512, 0, 1, 0.3176471, 1,
-0.2742875, 0.4426939, -0.0838823, 0, 1, 0.3215686, 1,
-0.2741177, -0.3274844, -1.58989, 0, 1, 0.3294118, 1,
-0.270455, -0.9187303, -3.34939, 0, 1, 0.3333333, 1,
-0.2698835, -1.078449, -4.242577, 0, 1, 0.3411765, 1,
-0.2690228, -1.521577, -2.531117, 0, 1, 0.345098, 1,
-0.2659785, 1.365699, 1.106928, 0, 1, 0.3529412, 1,
-0.2599651, 1.101416, 0.3109003, 0, 1, 0.3568628, 1,
-0.2587996, 0.04147325, -0.7295582, 0, 1, 0.3647059, 1,
-0.2580289, 0.2663762, 0.6788573, 0, 1, 0.3686275, 1,
-0.2546972, 1.550635, 0.9092826, 0, 1, 0.3764706, 1,
-0.251216, -0.2630295, -2.264559, 0, 1, 0.3803922, 1,
-0.2467524, 0.8440123, 0.2195518, 0, 1, 0.3882353, 1,
-0.2425337, -0.589, -2.851648, 0, 1, 0.3921569, 1,
-0.2413361, -1.429967, -2.72833, 0, 1, 0.4, 1,
-0.2405037, -0.4741859, -2.201237, 0, 1, 0.4078431, 1,
-0.2273248, -0.7161528, -4.029788, 0, 1, 0.4117647, 1,
-0.2241775, 0.3291419, 0.0191359, 0, 1, 0.4196078, 1,
-0.2107013, 0.5663929, -0.2507794, 0, 1, 0.4235294, 1,
-0.2105922, -0.0313094, -1.909806, 0, 1, 0.4313726, 1,
-0.2101613, -0.5851272, -0.09638748, 0, 1, 0.4352941, 1,
-0.2081017, -1.283893, -3.101647, 0, 1, 0.4431373, 1,
-0.2072123, 0.3800591, -0.5941683, 0, 1, 0.4470588, 1,
-0.2040415, -1.28132, -3.497022, 0, 1, 0.454902, 1,
-0.2022062, -0.9029342, -3.261594, 0, 1, 0.4588235, 1,
-0.2007961, -0.06996467, 1.296982, 0, 1, 0.4666667, 1,
-0.1933184, 0.05747876, -2.049306, 0, 1, 0.4705882, 1,
-0.1914471, -0.7953393, -3.687464, 0, 1, 0.4784314, 1,
-0.1901057, 1.979078, -0.2523489, 0, 1, 0.4823529, 1,
-0.1890399, -1.581862, -3.574263, 0, 1, 0.4901961, 1,
-0.1861404, 0.06650062, -1.228721, 0, 1, 0.4941176, 1,
-0.1834708, -1.133072, -2.000646, 0, 1, 0.5019608, 1,
-0.1776502, 1.388956, 0.437531, 0, 1, 0.509804, 1,
-0.1752768, -1.10408, -4.210107, 0, 1, 0.5137255, 1,
-0.1684351, -0.69855, -1.382506, 0, 1, 0.5215687, 1,
-0.1642526, -0.2752166, -2.822498, 0, 1, 0.5254902, 1,
-0.1640922, -0.1282268, -1.003341, 0, 1, 0.5333334, 1,
-0.1602065, -0.1359673, -3.209361, 0, 1, 0.5372549, 1,
-0.1593609, 1.112984, 1.280107, 0, 1, 0.5450981, 1,
-0.1590228, 0.4311215, -1.72172, 0, 1, 0.5490196, 1,
-0.1582272, -0.3587543, -0.8579941, 0, 1, 0.5568628, 1,
-0.1571764, -0.7381647, -3.755421, 0, 1, 0.5607843, 1,
-0.1556372, -1.260214, -3.121209, 0, 1, 0.5686275, 1,
-0.1477637, 0.1797538, -0.310032, 0, 1, 0.572549, 1,
-0.1448217, 0.4947175, 1.335733, 0, 1, 0.5803922, 1,
-0.1407306, 0.3918161, 0.6454315, 0, 1, 0.5843138, 1,
-0.1375752, -0.2887433, -2.47457, 0, 1, 0.5921569, 1,
-0.135621, -1.432104, -2.300865, 0, 1, 0.5960785, 1,
-0.134676, -0.2571149, -2.380929, 0, 1, 0.6039216, 1,
-0.1333276, -1.180573, -2.529505, 0, 1, 0.6117647, 1,
-0.1323068, 0.118689, -1.581736, 0, 1, 0.6156863, 1,
-0.1303948, -0.1656617, -3.116028, 0, 1, 0.6235294, 1,
-0.1245572, 1.384724, -1.780655, 0, 1, 0.627451, 1,
-0.1230742, -1.958456, -3.640415, 0, 1, 0.6352941, 1,
-0.1230698, -0.5274158, -2.439862, 0, 1, 0.6392157, 1,
-0.1209829, 0.166669, -1.103116, 0, 1, 0.6470588, 1,
-0.1209819, -1.616997, -2.007423, 0, 1, 0.6509804, 1,
-0.1190123, 0.7130484, -0.5143423, 0, 1, 0.6588235, 1,
-0.11765, -1.686469, -2.721196, 0, 1, 0.6627451, 1,
-0.1151175, -0.4901581, -4.450693, 0, 1, 0.6705883, 1,
-0.1097457, -1.686365, -1.934705, 0, 1, 0.6745098, 1,
-0.1075509, -0.2270604, -2.372927, 0, 1, 0.682353, 1,
-0.1067265, 0.2390613, -1.74473, 0, 1, 0.6862745, 1,
-0.1056743, -0.1886725, -3.427747, 0, 1, 0.6941177, 1,
-0.1035279, -1.74847, -2.466207, 0, 1, 0.7019608, 1,
-0.09779695, -0.6430219, -3.713016, 0, 1, 0.7058824, 1,
-0.09570829, -0.415619, -4.672759, 0, 1, 0.7137255, 1,
-0.09452962, 1.011297, 0.5100536, 0, 1, 0.7176471, 1,
-0.09396194, -0.5711086, -3.142718, 0, 1, 0.7254902, 1,
-0.09330246, 0.02667921, -0.9627209, 0, 1, 0.7294118, 1,
-0.09226477, 0.4865556, 0.9687958, 0, 1, 0.7372549, 1,
-0.08861514, 0.4910941, -0.08685774, 0, 1, 0.7411765, 1,
-0.08851846, 1.476816, -0.7857583, 0, 1, 0.7490196, 1,
-0.08742452, -0.1502071, -2.084206, 0, 1, 0.7529412, 1,
-0.08699039, 0.1943696, 0.02220479, 0, 1, 0.7607843, 1,
-0.08608244, 0.9823366, 1.534405, 0, 1, 0.7647059, 1,
-0.08180168, -0.1002935, -2.35623, 0, 1, 0.772549, 1,
-0.07402999, 0.0262145, -0.7430331, 0, 1, 0.7764706, 1,
-0.0725143, 0.8434078, -0.8869114, 0, 1, 0.7843137, 1,
-0.07176984, 0.6628635, -0.5949755, 0, 1, 0.7882353, 1,
-0.06725492, 0.9721187, -2.156001, 0, 1, 0.7960784, 1,
-0.06652187, -0.9674731, -1.724043, 0, 1, 0.8039216, 1,
-0.06530681, -0.5588148, -2.181978, 0, 1, 0.8078431, 1,
-0.0652497, 0.5326753, 0.3366515, 0, 1, 0.8156863, 1,
-0.06435383, -0.2040406, -1.213745, 0, 1, 0.8196079, 1,
-0.06053519, -2.080513, -3.987408, 0, 1, 0.827451, 1,
-0.06011765, -1.742208, -1.894889, 0, 1, 0.8313726, 1,
-0.05971383, -1.035431, -1.481393, 0, 1, 0.8392157, 1,
-0.05540029, 0.4614201, 0.8183858, 0, 1, 0.8431373, 1,
-0.05492684, -0.6746054, -1.859707, 0, 1, 0.8509804, 1,
-0.05389544, -0.8749662, -3.791479, 0, 1, 0.854902, 1,
-0.0517559, 1.426555, -0.3614247, 0, 1, 0.8627451, 1,
-0.04922501, 0.06083849, 0.4537377, 0, 1, 0.8666667, 1,
-0.04599898, -0.3525285, -4.00834, 0, 1, 0.8745098, 1,
-0.042073, 0.1728017, -0.890653, 0, 1, 0.8784314, 1,
-0.04114765, 0.4073453, -1.400037, 0, 1, 0.8862745, 1,
-0.04016486, 1.96057, 1.544272, 0, 1, 0.8901961, 1,
-0.03977344, 0.8303477, -1.127617, 0, 1, 0.8980392, 1,
-0.03830591, 0.02560679, 0.2489924, 0, 1, 0.9058824, 1,
-0.03625657, -1.390691, -2.956766, 0, 1, 0.9098039, 1,
-0.03554444, 1.040263, -0.01918789, 0, 1, 0.9176471, 1,
-0.0352696, 0.2895435, -0.7291175, 0, 1, 0.9215686, 1,
-0.03240685, -0.9897802, -2.599277, 0, 1, 0.9294118, 1,
-0.02844675, 1.080095, -0.2025019, 0, 1, 0.9333333, 1,
-0.02684806, -0.3454964, -3.109261, 0, 1, 0.9411765, 1,
-0.02512317, 0.02340031, 0.9105201, 0, 1, 0.945098, 1,
-0.02351532, -0.911905, -2.352272, 0, 1, 0.9529412, 1,
-0.01692701, -1.108067, -2.317936, 0, 1, 0.9568627, 1,
-0.01613979, -0.3883024, -4.118249, 0, 1, 0.9647059, 1,
-0.01477411, 0.5072355, 2.217963, 0, 1, 0.9686275, 1,
-0.01151432, -0.004843384, -1.391479, 0, 1, 0.9764706, 1,
-0.01069539, 0.8798535, -1.405597, 0, 1, 0.9803922, 1,
-0.003598197, -1.832623, -2.487531, 0, 1, 0.9882353, 1,
0.002487107, 0.00935153, 0.1954824, 0, 1, 0.9921569, 1,
0.002820778, -1.03842, 2.182119, 0, 1, 1, 1,
0.003005554, -0.4150985, 2.832278, 0, 0.9921569, 1, 1,
0.003622144, -0.01026914, 3.562727, 0, 0.9882353, 1, 1,
0.003883282, -0.7415149, 1.716933, 0, 0.9803922, 1, 1,
0.006659605, 1.149364, 0.9926234, 0, 0.9764706, 1, 1,
0.008978892, 1.678294, -0.9318265, 0, 0.9686275, 1, 1,
0.01186249, -0.9818152, 2.432698, 0, 0.9647059, 1, 1,
0.01441049, 0.1434735, -0.7447926, 0, 0.9568627, 1, 1,
0.01720143, 0.8460815, -1.218032, 0, 0.9529412, 1, 1,
0.0184721, 0.02821583, 0.7019632, 0, 0.945098, 1, 1,
0.01853896, -0.05502491, 4.029727, 0, 0.9411765, 1, 1,
0.02438996, 0.688467, 0.100635, 0, 0.9333333, 1, 1,
0.02555851, 0.5832866, -0.1097406, 0, 0.9294118, 1, 1,
0.02856621, -1.902504, 3.227671, 0, 0.9215686, 1, 1,
0.02992444, -0.6130977, 4.674628, 0, 0.9176471, 1, 1,
0.03183346, 0.6751201, 0.4814749, 0, 0.9098039, 1, 1,
0.03342893, -0.2164363, 3.224546, 0, 0.9058824, 1, 1,
0.03545088, 1.661397, 0.5465081, 0, 0.8980392, 1, 1,
0.03556097, -0.3010419, 3.135818, 0, 0.8901961, 1, 1,
0.04023029, 1.743557, 0.2627323, 0, 0.8862745, 1, 1,
0.04573048, -0.3627912, 2.100243, 0, 0.8784314, 1, 1,
0.05064085, 0.2770118, -1.876312, 0, 0.8745098, 1, 1,
0.0517741, 0.2988212, 0.4270989, 0, 0.8666667, 1, 1,
0.05183791, -0.7945872, 1.091015, 0, 0.8627451, 1, 1,
0.05512438, 0.05513212, 1.328943, 0, 0.854902, 1, 1,
0.05554471, -0.2709218, 2.63289, 0, 0.8509804, 1, 1,
0.0567331, -1.648711, 4.113259, 0, 0.8431373, 1, 1,
0.05725606, 1.665392, 1.78684, 0, 0.8392157, 1, 1,
0.05811914, 1.285561, -0.3786746, 0, 0.8313726, 1, 1,
0.06014689, 0.3568385, 0.04264363, 0, 0.827451, 1, 1,
0.0610399, 0.634689, 0.01399782, 0, 0.8196079, 1, 1,
0.06489852, 3.711506, -0.4487232, 0, 0.8156863, 1, 1,
0.06697816, 0.1722002, -2.484361, 0, 0.8078431, 1, 1,
0.07016475, 1.115876, 0.6470084, 0, 0.8039216, 1, 1,
0.07059115, -1.435308, 2.433565, 0, 0.7960784, 1, 1,
0.07449587, -0.3069587, 2.463639, 0, 0.7882353, 1, 1,
0.07484926, 2.067526, -0.1943479, 0, 0.7843137, 1, 1,
0.07832288, 1.152258, 1.452455, 0, 0.7764706, 1, 1,
0.07900863, -1.217575, 4.228183, 0, 0.772549, 1, 1,
0.0807016, 1.09682, -1.249681, 0, 0.7647059, 1, 1,
0.08205281, 0.1683423, -0.7347449, 0, 0.7607843, 1, 1,
0.08685315, -1.503769, 3.757078, 0, 0.7529412, 1, 1,
0.08700203, 0.9279624, -0.02471079, 0, 0.7490196, 1, 1,
0.09058947, -1.528905, 2.799382, 0, 0.7411765, 1, 1,
0.09243486, -0.746343, 2.212838, 0, 0.7372549, 1, 1,
0.09592934, -1.809346, 2.143696, 0, 0.7294118, 1, 1,
0.09672303, 1.286228, 0.07440301, 0, 0.7254902, 1, 1,
0.09686194, 0.6805806, 0.540237, 0, 0.7176471, 1, 1,
0.1006985, 0.1947183, 1.614813, 0, 0.7137255, 1, 1,
0.1036552, -0.4085192, 3.677962, 0, 0.7058824, 1, 1,
0.1042041, -1.369892, 3.59513, 0, 0.6980392, 1, 1,
0.1057956, -0.5952803, 3.369158, 0, 0.6941177, 1, 1,
0.1058738, 1.567519, -2.057237, 0, 0.6862745, 1, 1,
0.1066386, -1.618289, 2.410458, 0, 0.682353, 1, 1,
0.1074519, 0.644752, -1.667592, 0, 0.6745098, 1, 1,
0.1127697, 0.4796689, -0.5651396, 0, 0.6705883, 1, 1,
0.1135932, 0.1539039, 1.158042, 0, 0.6627451, 1, 1,
0.1158781, -0.04525124, 2.756905, 0, 0.6588235, 1, 1,
0.1180847, -0.8621362, 1.285941, 0, 0.6509804, 1, 1,
0.1181318, 3.998231, 0.5528804, 0, 0.6470588, 1, 1,
0.1181941, -0.5791518, 3.091927, 0, 0.6392157, 1, 1,
0.1244084, -0.07483936, 3.781996, 0, 0.6352941, 1, 1,
0.1248321, -1.2911, 4.173378, 0, 0.627451, 1, 1,
0.1260335, 0.05310673, 1.727871, 0, 0.6235294, 1, 1,
0.1289281, -0.3377268, 3.145503, 0, 0.6156863, 1, 1,
0.1306566, -0.8740006, 4.453282, 0, 0.6117647, 1, 1,
0.1328218, 0.7534339, -1.402248, 0, 0.6039216, 1, 1,
0.1424665, 1.138506, -0.1952859, 0, 0.5960785, 1, 1,
0.1483716, -0.8210835, 1.116232, 0, 0.5921569, 1, 1,
0.1487681, -0.4948384, 2.417006, 0, 0.5843138, 1, 1,
0.1493735, -0.1231246, 0.5706185, 0, 0.5803922, 1, 1,
0.1502866, -1.543851, 2.217875, 0, 0.572549, 1, 1,
0.1516117, -0.5825531, 3.355566, 0, 0.5686275, 1, 1,
0.1540986, 0.1033393, 0.8545669, 0, 0.5607843, 1, 1,
0.157569, 0.4833359, -1.215373, 0, 0.5568628, 1, 1,
0.15783, 0.4184305, -1.250543, 0, 0.5490196, 1, 1,
0.1578701, -0.5802887, -0.4784247, 0, 0.5450981, 1, 1,
0.1578958, 0.5243846, -0.4366091, 0, 0.5372549, 1, 1,
0.1598714, 2.211356, 1.486269, 0, 0.5333334, 1, 1,
0.1610419, 0.7782854, 0.2095111, 0, 0.5254902, 1, 1,
0.1610469, 1.581654, -1.334925, 0, 0.5215687, 1, 1,
0.1619084, 0.3877658, -0.01913295, 0, 0.5137255, 1, 1,
0.1630398, -0.5873252, 1.913362, 0, 0.509804, 1, 1,
0.1699785, -0.9047173, 1.797798, 0, 0.5019608, 1, 1,
0.1740064, 0.9142336, 0.1912316, 0, 0.4941176, 1, 1,
0.1746148, 0.3515474, 0.7127346, 0, 0.4901961, 1, 1,
0.1823433, 0.2251894, 2.124206, 0, 0.4823529, 1, 1,
0.1826749, 0.562961, -0.8471417, 0, 0.4784314, 1, 1,
0.1839106, -2.442493, 3.460696, 0, 0.4705882, 1, 1,
0.1844209, -1.458981, 4.64612, 0, 0.4666667, 1, 1,
0.1865855, 2.213475, -1.589184, 0, 0.4588235, 1, 1,
0.1886454, 1.052856, 0.4257466, 0, 0.454902, 1, 1,
0.1907449, -1.096339, 3.24986, 0, 0.4470588, 1, 1,
0.2028846, -1.619121, 4.798397, 0, 0.4431373, 1, 1,
0.2091563, 0.9259769, -0.6482446, 0, 0.4352941, 1, 1,
0.2104984, -0.1859136, 2.093086, 0, 0.4313726, 1, 1,
0.2116086, 0.1745625, 0.9715388, 0, 0.4235294, 1, 1,
0.2120402, -1.534821, 4.282194, 0, 0.4196078, 1, 1,
0.218569, 0.352309, 1.491388, 0, 0.4117647, 1, 1,
0.2207108, -0.04970933, 1.124519, 0, 0.4078431, 1, 1,
0.2234851, 0.307474, -0.1018686, 0, 0.4, 1, 1,
0.2279772, 1.032964, -0.7243618, 0, 0.3921569, 1, 1,
0.2283515, 1.675883, -0.2810711, 0, 0.3882353, 1, 1,
0.2287138, 0.4101739, -1.616375, 0, 0.3803922, 1, 1,
0.2298226, 0.8101657, 1.891557, 0, 0.3764706, 1, 1,
0.2315079, -0.5595837, 2.360328, 0, 0.3686275, 1, 1,
0.2327113, 0.6642264, 0.2049384, 0, 0.3647059, 1, 1,
0.2342332, 2.192137, -0.135777, 0, 0.3568628, 1, 1,
0.2353172, -1.587723, 4.524796, 0, 0.3529412, 1, 1,
0.2359377, -1.052295, 1.436406, 0, 0.345098, 1, 1,
0.2378775, 0.1014402, 1.405726, 0, 0.3411765, 1, 1,
0.2444023, -1.790166, 2.162707, 0, 0.3333333, 1, 1,
0.250344, -2.188284, 3.64024, 0, 0.3294118, 1, 1,
0.2507455, 1.415506, 0.8316032, 0, 0.3215686, 1, 1,
0.2511449, 0.9903927, -0.08183481, 0, 0.3176471, 1, 1,
0.2537247, -0.5824, 2.099064, 0, 0.3098039, 1, 1,
0.2537699, 0.06733542, 1.021883, 0, 0.3058824, 1, 1,
0.2542836, -0.7497149, 3.047274, 0, 0.2980392, 1, 1,
0.2571982, 1.450911, 0.1549683, 0, 0.2901961, 1, 1,
0.258432, -1.186589, 2.681138, 0, 0.2862745, 1, 1,
0.2606907, -0.2496049, 3.654782, 0, 0.2784314, 1, 1,
0.2629409, 0.2643197, 2.46414, 0, 0.2745098, 1, 1,
0.2722725, 0.2896826, 2.037435, 0, 0.2666667, 1, 1,
0.274925, -0.4375103, 2.33991, 0, 0.2627451, 1, 1,
0.2749509, 1.898562, -1.40453, 0, 0.254902, 1, 1,
0.2758423, -0.7893287, 3.743736, 0, 0.2509804, 1, 1,
0.2762577, 0.06211863, 2.222513, 0, 0.2431373, 1, 1,
0.2777482, 1.481538, 0.853148, 0, 0.2392157, 1, 1,
0.2791857, -0.195752, 2.593799, 0, 0.2313726, 1, 1,
0.2805881, -2.148015, 3.098863, 0, 0.227451, 1, 1,
0.2899476, 0.8164214, -1.2021, 0, 0.2196078, 1, 1,
0.3019567, 1.975245, 0.1625994, 0, 0.2156863, 1, 1,
0.3036627, 0.9700349, 1.539583, 0, 0.2078431, 1, 1,
0.3091719, -0.8916895, 2.348057, 0, 0.2039216, 1, 1,
0.3174383, -1.65497, 2.047407, 0, 0.1960784, 1, 1,
0.3294236, 0.1707473, 3.073439, 0, 0.1882353, 1, 1,
0.3301622, 1.025424, 0.5490173, 0, 0.1843137, 1, 1,
0.3334475, -0.1406641, 0.02510579, 0, 0.1764706, 1, 1,
0.3343166, -1.517636, 2.437238, 0, 0.172549, 1, 1,
0.3363325, -0.298898, 2.339441, 0, 0.1647059, 1, 1,
0.336446, -0.3661822, 1.758972, 0, 0.1607843, 1, 1,
0.3372573, -0.5954379, 2.790318, 0, 0.1529412, 1, 1,
0.3379384, 0.8866742, 0.4349322, 0, 0.1490196, 1, 1,
0.3401131, 0.3850039, -0.4588931, 0, 0.1411765, 1, 1,
0.3445646, -0.614561, 1.426068, 0, 0.1372549, 1, 1,
0.3463061, 1.64196, -0.4959722, 0, 0.1294118, 1, 1,
0.3469389, -1.229804, 2.368144, 0, 0.1254902, 1, 1,
0.3499305, 0.9360405, 2.514458, 0, 0.1176471, 1, 1,
0.3514553, -0.1618323, 2.079885, 0, 0.1137255, 1, 1,
0.3523972, 1.363705, -0.1283419, 0, 0.1058824, 1, 1,
0.3548946, 1.794849, 0.8023421, 0, 0.09803922, 1, 1,
0.3556864, 0.6012475, 0.5161875, 0, 0.09411765, 1, 1,
0.3592253, -1.041982, 2.476374, 0, 0.08627451, 1, 1,
0.3630477, 0.2983608, 1.257494, 0, 0.08235294, 1, 1,
0.3655742, 0.07617742, 1.510602, 0, 0.07450981, 1, 1,
0.3729499, -1.725824, 3.399662, 0, 0.07058824, 1, 1,
0.3762734, -0.1833951, 0.9871586, 0, 0.0627451, 1, 1,
0.3777345, -0.8215334, 4.366879, 0, 0.05882353, 1, 1,
0.3819407, 1.073336, -0.4365282, 0, 0.05098039, 1, 1,
0.3844495, -0.09229371, 1.341087, 0, 0.04705882, 1, 1,
0.3876278, -0.8115737, 1.493724, 0, 0.03921569, 1, 1,
0.3886774, 0.6542461, 0.7077791, 0, 0.03529412, 1, 1,
0.3890405, -1.499421, 2.059675, 0, 0.02745098, 1, 1,
0.3897682, -0.7277747, 3.875135, 0, 0.02352941, 1, 1,
0.3901847, 1.797233, 1.057408, 0, 0.01568628, 1, 1,
0.3954592, 1.22669, 0.672374, 0, 0.01176471, 1, 1,
0.3960586, 1.312225, 1.314719, 0, 0.003921569, 1, 1,
0.396673, -0.9749535, 0.4612833, 0.003921569, 0, 1, 1,
0.3976954, 1.660996, 0.5113149, 0.007843138, 0, 1, 1,
0.4003187, 0.8176549, 0.4933783, 0.01568628, 0, 1, 1,
0.4016279, -0.8677076, 1.309559, 0.01960784, 0, 1, 1,
0.4085503, -1.099924, 1.70909, 0.02745098, 0, 1, 1,
0.4114613, 1.893787, 0.3091944, 0.03137255, 0, 1, 1,
0.4115066, 0.1377679, 1.94258, 0.03921569, 0, 1, 1,
0.4119781, -0.2173134, 2.387267, 0.04313726, 0, 1, 1,
0.4177103, -1.440566, 2.213706, 0.05098039, 0, 1, 1,
0.418709, -0.2052837, 2.095163, 0.05490196, 0, 1, 1,
0.4201162, -0.860596, 3.910136, 0.0627451, 0, 1, 1,
0.4204271, -0.3570836, 2.432961, 0.06666667, 0, 1, 1,
0.4207884, 0.8474011, 1.83208, 0.07450981, 0, 1, 1,
0.4315195, 0.4811521, -0.669459, 0.07843138, 0, 1, 1,
0.4318816, 0.549665, 0.4568545, 0.08627451, 0, 1, 1,
0.4350908, 2.193589, -0.4546387, 0.09019608, 0, 1, 1,
0.4352768, -0.5093032, 1.647231, 0.09803922, 0, 1, 1,
0.4409493, -0.6187072, 2.518624, 0.1058824, 0, 1, 1,
0.4421265, -1.150435, 3.649189, 0.1098039, 0, 1, 1,
0.4449673, 0.3191411, 1.298176, 0.1176471, 0, 1, 1,
0.4466687, 0.5789094, 0.9688045, 0.1215686, 0, 1, 1,
0.4494472, 1.518402, -0.4628541, 0.1294118, 0, 1, 1,
0.4574774, 0.6231787, 0.5327839, 0.1333333, 0, 1, 1,
0.4616804, -0.3502214, 2.373364, 0.1411765, 0, 1, 1,
0.463218, -1.229567, 2.418019, 0.145098, 0, 1, 1,
0.46755, -0.1113671, 0.5168169, 0.1529412, 0, 1, 1,
0.4701359, -0.809433, 2.946574, 0.1568628, 0, 1, 1,
0.4707021, 0.3377889, 2.670306, 0.1647059, 0, 1, 1,
0.4750344, -0.9346769, 2.822001, 0.1686275, 0, 1, 1,
0.4795123, 0.09127609, -0.358763, 0.1764706, 0, 1, 1,
0.4845508, -1.142698, 3.117945, 0.1803922, 0, 1, 1,
0.4847039, 0.3776616, 1.532604, 0.1882353, 0, 1, 1,
0.485734, -0.2309691, 1.170002, 0.1921569, 0, 1, 1,
0.4915167, -0.5002306, 3.326257, 0.2, 0, 1, 1,
0.4918114, 1.026251, -0.4042833, 0.2078431, 0, 1, 1,
0.4934377, -1.830705, 1.042361, 0.2117647, 0, 1, 1,
0.4962928, -0.2383753, 1.605714, 0.2196078, 0, 1, 1,
0.4963101, 0.7515559, 0.5902482, 0.2235294, 0, 1, 1,
0.49819, -0.7835878, 1.451337, 0.2313726, 0, 1, 1,
0.5070845, 0.6681178, 0.6817653, 0.2352941, 0, 1, 1,
0.514341, 1.2551, 0.009057857, 0.2431373, 0, 1, 1,
0.5144193, 1.367594, -0.7072584, 0.2470588, 0, 1, 1,
0.515679, 0.006959257, 0.9993688, 0.254902, 0, 1, 1,
0.5171918, 1.683766, 0.5787669, 0.2588235, 0, 1, 1,
0.5200767, 0.5429158, 1.186742, 0.2666667, 0, 1, 1,
0.5202022, 0.398731, 0.7453352, 0.2705882, 0, 1, 1,
0.5220832, 0.009206587, 1.78105, 0.2784314, 0, 1, 1,
0.5226334, 0.1761216, 0.7849715, 0.282353, 0, 1, 1,
0.5242785, -0.8563166, 2.086679, 0.2901961, 0, 1, 1,
0.5259838, 0.0004624024, 1.560137, 0.2941177, 0, 1, 1,
0.5275002, 1.636296, 0.3664466, 0.3019608, 0, 1, 1,
0.5338495, -0.4625652, 2.505267, 0.3098039, 0, 1, 1,
0.5386221, -0.254386, 3.618745, 0.3137255, 0, 1, 1,
0.5412278, 0.5811022, 1.989124, 0.3215686, 0, 1, 1,
0.5424672, 0.2614747, 1.522239, 0.3254902, 0, 1, 1,
0.5458513, -0.402889, 2.40328, 0.3333333, 0, 1, 1,
0.5487895, 1.028399, 0.3686056, 0.3372549, 0, 1, 1,
0.5514121, -0.5297664, -0.4052213, 0.345098, 0, 1, 1,
0.5516396, 0.07882071, 1.215336, 0.3490196, 0, 1, 1,
0.5534009, 1.329416, 0.03245934, 0.3568628, 0, 1, 1,
0.5561759, 0.2235063, 1.181951, 0.3607843, 0, 1, 1,
0.5562423, -1.335559, 1.633465, 0.3686275, 0, 1, 1,
0.5563627, -0.6256476, 1.91518, 0.372549, 0, 1, 1,
0.562667, -1.05387, 0.906484, 0.3803922, 0, 1, 1,
0.5627069, -0.7789987, 1.506594, 0.3843137, 0, 1, 1,
0.5660285, 1.397969, 0.7760981, 0.3921569, 0, 1, 1,
0.5696107, 0.3314971, -0.3617371, 0.3960784, 0, 1, 1,
0.5766429, -1.323793, 3.562128, 0.4039216, 0, 1, 1,
0.5814699, -0.1829907, 0.1527785, 0.4117647, 0, 1, 1,
0.5816869, -0.02767948, 1.483122, 0.4156863, 0, 1, 1,
0.585619, 3.123277, -0.526471, 0.4235294, 0, 1, 1,
0.5978082, 1.569158, 1.902185, 0.427451, 0, 1, 1,
0.5995161, 0.6624269, -0.2869601, 0.4352941, 0, 1, 1,
0.6189068, -0.8121083, 3.892644, 0.4392157, 0, 1, 1,
0.6195899, -0.6136118, 3.66024, 0.4470588, 0, 1, 1,
0.6198099, -0.6770459, 1.565252, 0.4509804, 0, 1, 1,
0.6272543, -0.372056, 3.139756, 0.4588235, 0, 1, 1,
0.6274585, 1.377965, -1.291248, 0.4627451, 0, 1, 1,
0.628575, 0.01003412, 1.578847, 0.4705882, 0, 1, 1,
0.6292279, -0.7919587, 3.092116, 0.4745098, 0, 1, 1,
0.6366605, 0.5778494, 0.4952163, 0.4823529, 0, 1, 1,
0.6371135, -1.409968, 5.035308, 0.4862745, 0, 1, 1,
0.6372871, 0.09372805, 0.944741, 0.4941176, 0, 1, 1,
0.6376771, 1.000226, 1.032866, 0.5019608, 0, 1, 1,
0.639528, 0.7690469, 0.3371801, 0.5058824, 0, 1, 1,
0.6424337, 0.450858, 0.5354902, 0.5137255, 0, 1, 1,
0.6424728, -2.15473, 2.02489, 0.5176471, 0, 1, 1,
0.6484695, -1.254713, 4.440626, 0.5254902, 0, 1, 1,
0.6532421, -0.2457996, 1.047851, 0.5294118, 0, 1, 1,
0.6576362, -0.4129604, 0.6985188, 0.5372549, 0, 1, 1,
0.665413, 0.06636912, 1.081503, 0.5411765, 0, 1, 1,
0.6663705, -0.2370474, 2.146564, 0.5490196, 0, 1, 1,
0.6687025, 0.7814658, 1.43257, 0.5529412, 0, 1, 1,
0.6715627, 0.4292322, 1.030335, 0.5607843, 0, 1, 1,
0.6722918, -1.5903, 3.219511, 0.5647059, 0, 1, 1,
0.674259, -0.2353465, 3.42486, 0.572549, 0, 1, 1,
0.6775894, -1.311681, 1.431689, 0.5764706, 0, 1, 1,
0.6851293, 0.6024672, 1.919977, 0.5843138, 0, 1, 1,
0.6908653, 0.9137791, 0.627244, 0.5882353, 0, 1, 1,
0.6917679, 0.2159974, 1.607766, 0.5960785, 0, 1, 1,
0.6941512, -0.5517306, 1.433357, 0.6039216, 0, 1, 1,
0.6954198, 0.6470867, 0.3920422, 0.6078432, 0, 1, 1,
0.7002305, 0.8909373, -0.09493234, 0.6156863, 0, 1, 1,
0.7033917, -0.3968452, 1.516442, 0.6196079, 0, 1, 1,
0.7053064, -0.3275818, 0.9320397, 0.627451, 0, 1, 1,
0.7141911, -0.1992476, 1.762869, 0.6313726, 0, 1, 1,
0.7144741, 0.5589282, 2.551722, 0.6392157, 0, 1, 1,
0.7280131, 0.7726392, -0.1868217, 0.6431373, 0, 1, 1,
0.7347449, -0.9105916, 4.036777, 0.6509804, 0, 1, 1,
0.7384057, -1.191285, 2.520998, 0.654902, 0, 1, 1,
0.7407936, -0.4592221, 1.040921, 0.6627451, 0, 1, 1,
0.7416825, -1.301599, 3.144751, 0.6666667, 0, 1, 1,
0.7445925, 0.1301086, 2.473643, 0.6745098, 0, 1, 1,
0.7458539, 0.4397906, 1.086371, 0.6784314, 0, 1, 1,
0.7460437, 1.043911, 0.4093613, 0.6862745, 0, 1, 1,
0.748835, -0.7589609, 2.731806, 0.6901961, 0, 1, 1,
0.751719, -0.5205579, 2.871895, 0.6980392, 0, 1, 1,
0.7588981, -0.5566288, 2.969768, 0.7058824, 0, 1, 1,
0.759864, -0.5933766, 0.6145144, 0.7098039, 0, 1, 1,
0.7631416, -0.003239442, 1.434056, 0.7176471, 0, 1, 1,
0.7654073, 1.095545, 0.9130493, 0.7215686, 0, 1, 1,
0.7672195, 0.8389745, 0.401522, 0.7294118, 0, 1, 1,
0.771608, 0.2207233, 1.895581, 0.7333333, 0, 1, 1,
0.7717112, 1.554696, -0.6780288, 0.7411765, 0, 1, 1,
0.7767945, 0.3055186, 0.5784916, 0.7450981, 0, 1, 1,
0.7939728, -0.2914175, 2.410486, 0.7529412, 0, 1, 1,
0.7949005, 0.5054902, 0.4557768, 0.7568628, 0, 1, 1,
0.7970487, -2.60351, 2.272814, 0.7647059, 0, 1, 1,
0.8040264, -0.5857421, 1.146817, 0.7686275, 0, 1, 1,
0.8048823, 1.582811, 0.701977, 0.7764706, 0, 1, 1,
0.8079253, 0.9260504, 1.002069, 0.7803922, 0, 1, 1,
0.8097653, 1.579934, 0.4370351, 0.7882353, 0, 1, 1,
0.8133507, 0.9490951, -0.5930107, 0.7921569, 0, 1, 1,
0.8159491, 1.484354, 1.019583, 0.8, 0, 1, 1,
0.8171763, 0.8411478, 0.4912434, 0.8078431, 0, 1, 1,
0.8225543, -1.106839, 3.739971, 0.8117647, 0, 1, 1,
0.826392, 0.962198, -1.177028, 0.8196079, 0, 1, 1,
0.833285, -0.2475361, 1.406472, 0.8235294, 0, 1, 1,
0.8372546, -0.7814173, 2.127319, 0.8313726, 0, 1, 1,
0.8415954, -0.1635654, 2.091234, 0.8352941, 0, 1, 1,
0.8440177, -1.43365, 2.281392, 0.8431373, 0, 1, 1,
0.8477296, 1.127358, 1.14858, 0.8470588, 0, 1, 1,
0.8528787, 0.3225999, 1.911919, 0.854902, 0, 1, 1,
0.8585797, 0.1937191, 0.3227836, 0.8588235, 0, 1, 1,
0.8620555, 0.1607494, 1.38617, 0.8666667, 0, 1, 1,
0.8663239, -0.6635768, 1.624433, 0.8705882, 0, 1, 1,
0.8696746, -0.2512952, 1.032128, 0.8784314, 0, 1, 1,
0.871407, -0.1422765, 2.781124, 0.8823529, 0, 1, 1,
0.872692, -0.9036754, 1.209665, 0.8901961, 0, 1, 1,
0.8730964, -1.435966, 3.843937, 0.8941177, 0, 1, 1,
0.8734882, 1.046455, -0.178914, 0.9019608, 0, 1, 1,
0.8842977, -0.5590277, 1.999525, 0.9098039, 0, 1, 1,
0.8855272, -0.272326, 2.422915, 0.9137255, 0, 1, 1,
0.8896747, 1.323055, -1.416525, 0.9215686, 0, 1, 1,
0.8902909, 0.9493309, 0.9449128, 0.9254902, 0, 1, 1,
0.8923113, -0.4907902, 0.5649115, 0.9333333, 0, 1, 1,
0.8929884, 0.4054134, 1.667838, 0.9372549, 0, 1, 1,
0.8937148, -0.0799999, 0.6255784, 0.945098, 0, 1, 1,
0.8988005, 1.892648, 0.2136692, 0.9490196, 0, 1, 1,
0.8997507, -0.7162563, 3.723617, 0.9568627, 0, 1, 1,
0.9014354, -1.131052, 3.607054, 0.9607843, 0, 1, 1,
0.9080459, -0.8010561, 2.429406, 0.9686275, 0, 1, 1,
0.9162277, -0.9801209, 1.411873, 0.972549, 0, 1, 1,
0.9175328, -0.7008744, 2.264484, 0.9803922, 0, 1, 1,
0.9181253, -1.129363, 1.374149, 0.9843137, 0, 1, 1,
0.9205474, 0.8210208, 0.8509474, 0.9921569, 0, 1, 1,
0.9210695, -1.593019, 2.65752, 0.9960784, 0, 1, 1,
0.9241713, -2.949554, 2.886741, 1, 0, 0.9960784, 1,
0.929016, 0.7716357, 0.9401883, 1, 0, 0.9882353, 1,
0.9446014, 1.836631, 2.624002, 1, 0, 0.9843137, 1,
0.9461952, 1.730137, 1.914623, 1, 0, 0.9764706, 1,
0.9462086, 0.9298813, 0.1780395, 1, 0, 0.972549, 1,
0.9467964, 0.7447615, 0.6680117, 1, 0, 0.9647059, 1,
0.9498328, 0.9526433, 1.215203, 1, 0, 0.9607843, 1,
0.9599921, 0.2113543, 1.069221, 1, 0, 0.9529412, 1,
0.9626473, -0.6485569, 2.680793, 1, 0, 0.9490196, 1,
0.9678835, 0.1175594, 1.856316, 1, 0, 0.9411765, 1,
0.9685652, 0.2635164, 0.4417916, 1, 0, 0.9372549, 1,
0.9707213, -0.09673836, 1.820724, 1, 0, 0.9294118, 1,
0.9729526, 0.4383548, 0.625194, 1, 0, 0.9254902, 1,
0.9741825, -0.2916196, 1.265235, 1, 0, 0.9176471, 1,
0.974267, 0.4431116, -0.2454749, 1, 0, 0.9137255, 1,
0.9775019, -0.359936, 1.483152, 1, 0, 0.9058824, 1,
0.9795136, -0.8652506, 2.250903, 1, 0, 0.9019608, 1,
0.9806769, 0.2351709, 2.160954, 1, 0, 0.8941177, 1,
0.9815215, 1.06658, 1.159041, 1, 0, 0.8862745, 1,
0.9861685, -0.2656708, 1.796871, 1, 0, 0.8823529, 1,
0.9867028, 0.144483, 2.276309, 1, 0, 0.8745098, 1,
0.99569, -0.5800487, 2.340093, 1, 0, 0.8705882, 1,
0.9960029, 0.4623766, 2.003026, 1, 0, 0.8627451, 1,
0.9967829, -0.3651168, 1.385101, 1, 0, 0.8588235, 1,
1.004662, 0.360737, 1.847322, 1, 0, 0.8509804, 1,
1.005857, -1.103691, 1.747786, 1, 0, 0.8470588, 1,
1.033936, 0.4143949, 2.540714, 1, 0, 0.8392157, 1,
1.035393, 1.420608, 0.4696761, 1, 0, 0.8352941, 1,
1.038749, -0.5867934, 4.071444, 1, 0, 0.827451, 1,
1.03949, 1.898957, 1.794592, 1, 0, 0.8235294, 1,
1.049086, -0.6175965, 2.236993, 1, 0, 0.8156863, 1,
1.058532, 1.659792, 2.808808, 1, 0, 0.8117647, 1,
1.065612, -1.831075, 3.540565, 1, 0, 0.8039216, 1,
1.077642, 0.2021526, 0.2398076, 1, 0, 0.7960784, 1,
1.103127, 0.09928277, 0.7021222, 1, 0, 0.7921569, 1,
1.104107, 2.058923, -0.7678136, 1, 0, 0.7843137, 1,
1.110244, -1.310572, 2.469063, 1, 0, 0.7803922, 1,
1.113333, -0.8501488, 3.129975, 1, 0, 0.772549, 1,
1.121484, -1.417387, 0.9523095, 1, 0, 0.7686275, 1,
1.132706, 0.9255291, 1.174974, 1, 0, 0.7607843, 1,
1.141285, 0.9728336, 1.929418, 1, 0, 0.7568628, 1,
1.153062, -0.9234905, 1.775819, 1, 0, 0.7490196, 1,
1.155975, -0.8951679, 2.312605, 1, 0, 0.7450981, 1,
1.157509, -0.6492695, 2.562988, 1, 0, 0.7372549, 1,
1.159635, -1.635991, 2.26849, 1, 0, 0.7333333, 1,
1.159878, -1.383621, 2.287189, 1, 0, 0.7254902, 1,
1.160865, -0.2193374, 0.8249522, 1, 0, 0.7215686, 1,
1.161394, -0.3145316, 1.87091, 1, 0, 0.7137255, 1,
1.164848, 0.7902846, 3.074298, 1, 0, 0.7098039, 1,
1.166475, -1.255026, 2.916547, 1, 0, 0.7019608, 1,
1.189835, -1.90233, 2.177517, 1, 0, 0.6941177, 1,
1.190515, 0.5081514, 0.08093939, 1, 0, 0.6901961, 1,
1.192933, -0.3818623, 2.075556, 1, 0, 0.682353, 1,
1.199518, -1.495032, 1.610892, 1, 0, 0.6784314, 1,
1.200051, 0.004993567, 2.185982, 1, 0, 0.6705883, 1,
1.205983, -0.06476607, 1.745049, 1, 0, 0.6666667, 1,
1.214305, 0.3818926, 0.09681442, 1, 0, 0.6588235, 1,
1.216902, 0.3971892, 1.444807, 1, 0, 0.654902, 1,
1.224627, -1.07657, 1.365591, 1, 0, 0.6470588, 1,
1.226672, 0.4977475, 0.3927576, 1, 0, 0.6431373, 1,
1.244094, -0.2972496, 2.668716, 1, 0, 0.6352941, 1,
1.251109, -1.214487, 2.30405, 1, 0, 0.6313726, 1,
1.251406, 0.153834, 0.4081837, 1, 0, 0.6235294, 1,
1.255458, -0.07048661, 2.962861, 1, 0, 0.6196079, 1,
1.255846, -0.3886479, 0.1069509, 1, 0, 0.6117647, 1,
1.256379, -0.8101049, 1.34523, 1, 0, 0.6078432, 1,
1.260716, -0.4759101, 2.543906, 1, 0, 0.6, 1,
1.274015, 0.09875125, 0.5708616, 1, 0, 0.5921569, 1,
1.274483, -0.4563481, 3.182065, 1, 0, 0.5882353, 1,
1.277918, 0.9072631, 0.06944203, 1, 0, 0.5803922, 1,
1.279199, 0.1795684, 3.441151, 1, 0, 0.5764706, 1,
1.285716, -0.7065609, 3.329951, 1, 0, 0.5686275, 1,
1.289266, 1.48109, 0.2275926, 1, 0, 0.5647059, 1,
1.291351, -0.3616354, 0.5238357, 1, 0, 0.5568628, 1,
1.300281, 0.5132665, 0.9893538, 1, 0, 0.5529412, 1,
1.307131, 0.5812832, 2.349497, 1, 0, 0.5450981, 1,
1.315215, 1.219492, -0.8452244, 1, 0, 0.5411765, 1,
1.322018, -0.1810903, 0.2682102, 1, 0, 0.5333334, 1,
1.331574, -1.222703, 2.760783, 1, 0, 0.5294118, 1,
1.332528, -0.3084675, 2.682215, 1, 0, 0.5215687, 1,
1.334779, 2.140088, -1.460523, 1, 0, 0.5176471, 1,
1.336613, 0.00922359, 2.937822, 1, 0, 0.509804, 1,
1.342172, 0.6893929, -0.05212173, 1, 0, 0.5058824, 1,
1.345358, 0.5300723, 0.6976994, 1, 0, 0.4980392, 1,
1.345517, -0.6252136, 1.498861, 1, 0, 0.4901961, 1,
1.35738, -0.1154875, 1.612921, 1, 0, 0.4862745, 1,
1.3633, 0.3629596, 0.6149265, 1, 0, 0.4784314, 1,
1.374975, -0.4736556, 2.356149, 1, 0, 0.4745098, 1,
1.377662, -0.3278574, 2.518427, 1, 0, 0.4666667, 1,
1.377968, 1.210903, 0.4469916, 1, 0, 0.4627451, 1,
1.380072, -1.714065, 2.448451, 1, 0, 0.454902, 1,
1.381806, 1.448447, 1.468943, 1, 0, 0.4509804, 1,
1.38773, -0.6343383, 1.224753, 1, 0, 0.4431373, 1,
1.387779, -0.08301604, 3.163663, 1, 0, 0.4392157, 1,
1.393957, 0.4729623, -0.1860449, 1, 0, 0.4313726, 1,
1.410517, -1.286731, 1.746831, 1, 0, 0.427451, 1,
1.420351, -0.01446678, 0.931331, 1, 0, 0.4196078, 1,
1.423449, 1.178705, 0.7786709, 1, 0, 0.4156863, 1,
1.440118, 1.589446, 1.244304, 1, 0, 0.4078431, 1,
1.443374, -0.5918674, 3.614816, 1, 0, 0.4039216, 1,
1.454188, -0.3936312, 2.198232, 1, 0, 0.3960784, 1,
1.497319, -0.2955485, 3.611919, 1, 0, 0.3882353, 1,
1.508298, -0.09322739, 0.4017058, 1, 0, 0.3843137, 1,
1.524266, 0.854005, 1.331275, 1, 0, 0.3764706, 1,
1.535725, -0.02081467, 2.098687, 1, 0, 0.372549, 1,
1.548748, -0.1994015, 1.310042, 1, 0, 0.3647059, 1,
1.550623, -2.240254, 2.387853, 1, 0, 0.3607843, 1,
1.551548, 0.5686776, 0.1332082, 1, 0, 0.3529412, 1,
1.557147, 1.994225, 0.1183662, 1, 0, 0.3490196, 1,
1.562492, -0.2499883, 0.568504, 1, 0, 0.3411765, 1,
1.571206, 1.341195, -0.5506223, 1, 0, 0.3372549, 1,
1.584767, -0.7515153, 2.357185, 1, 0, 0.3294118, 1,
1.593985, -0.6412665, 3.363522, 1, 0, 0.3254902, 1,
1.601214, 0.927266, 0.7744041, 1, 0, 0.3176471, 1,
1.605942, 0.4283265, 2.810993, 1, 0, 0.3137255, 1,
1.621702, 0.08850397, 0.2842861, 1, 0, 0.3058824, 1,
1.622108, 0.733688, 1.274152, 1, 0, 0.2980392, 1,
1.630526, 1.594367, -0.7253343, 1, 0, 0.2941177, 1,
1.63647, 0.3308812, 0.7070273, 1, 0, 0.2862745, 1,
1.661289, -1.19696, 3.77533, 1, 0, 0.282353, 1,
1.673012, 3.005979, 0.006757636, 1, 0, 0.2745098, 1,
1.691302, -1.089536, 2.208449, 1, 0, 0.2705882, 1,
1.696955, 0.1142756, 1.695709, 1, 0, 0.2627451, 1,
1.721501, -0.4969674, 0.641495, 1, 0, 0.2588235, 1,
1.724125, 1.026501, 1.715793, 1, 0, 0.2509804, 1,
1.724609, -0.01391144, 0.6729559, 1, 0, 0.2470588, 1,
1.737566, 0.6336589, 2.469151, 1, 0, 0.2392157, 1,
1.741956, 1.033434, 0.4712421, 1, 0, 0.2352941, 1,
1.745469, -0.3463416, 1.131548, 1, 0, 0.227451, 1,
1.74667, -1.597035, 2.490438, 1, 0, 0.2235294, 1,
1.773499, -0.2257628, 1.146377, 1, 0, 0.2156863, 1,
1.778511, 0.7598911, 0.5038189, 1, 0, 0.2117647, 1,
1.782469, 2.063143, -1.167694, 1, 0, 0.2039216, 1,
1.795515, -0.6127557, 1.751706, 1, 0, 0.1960784, 1,
1.800915, 1.746542, 0.09229229, 1, 0, 0.1921569, 1,
1.80783, 0.7438298, 1.620804, 1, 0, 0.1843137, 1,
1.831436, 1.866775, -0.70688, 1, 0, 0.1803922, 1,
1.851122, -0.2038767, 0.8412871, 1, 0, 0.172549, 1,
1.863788, -0.1774829, 0.01849793, 1, 0, 0.1686275, 1,
1.869785, 0.3402582, 0.9281334, 1, 0, 0.1607843, 1,
1.903388, 0.3811779, 0.9845294, 1, 0, 0.1568628, 1,
1.914934, -0.9153494, 1.605244, 1, 0, 0.1490196, 1,
1.92455, -0.08977107, 2.459985, 1, 0, 0.145098, 1,
1.933224, 1.311568, 0.4318593, 1, 0, 0.1372549, 1,
1.939279, -1.72618, 1.280951, 1, 0, 0.1333333, 1,
1.950257, 1.126245, 0.5824346, 1, 0, 0.1254902, 1,
1.974662, -0.4927516, 1.135752, 1, 0, 0.1215686, 1,
1.986282, -0.439595, 2.497422, 1, 0, 0.1137255, 1,
2.026505, -0.894186, 1.850239, 1, 0, 0.1098039, 1,
2.033654, 1.242028, 1.073142, 1, 0, 0.1019608, 1,
2.054204, -0.2466671, 2.42867, 1, 0, 0.09411765, 1,
2.088013, 0.5796093, 2.666666, 1, 0, 0.09019608, 1,
2.10759, -1.818935, 2.762184, 1, 0, 0.08235294, 1,
2.119624, 2.075999, 1.096577, 1, 0, 0.07843138, 1,
2.128839, -0.6438168, 1.596288, 1, 0, 0.07058824, 1,
2.151705, -0.1391956, 0.7359661, 1, 0, 0.06666667, 1,
2.160417, -1.901113, 2.074823, 1, 0, 0.05882353, 1,
2.237661, -0.08851186, 0.4653145, 1, 0, 0.05490196, 1,
2.292412, 0.9357079, 1.867071, 1, 0, 0.04705882, 1,
2.303777, 0.8689898, 0.986819, 1, 0, 0.04313726, 1,
2.32222, -0.9680496, 3.205737, 1, 0, 0.03529412, 1,
2.347196, -1.015098, 1.795358, 1, 0, 0.03137255, 1,
2.554132, -0.5157143, 1.854828, 1, 0, 0.02352941, 1,
2.681255, -1.101754, 3.463714, 1, 0, 0.01960784, 1,
2.748032, 0.245627, 1.673527, 1, 0, 0.01176471, 1,
3.267202, 1.362948, 2.64793, 1, 0, 0.007843138, 1
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
0.338991, -4.127203, -7.877652, 0, -0.5, 0.5, 0.5,
0.338991, -4.127203, -7.877652, 1, -0.5, 0.5, 0.5,
0.338991, -4.127203, -7.877652, 1, 1.5, 0.5, 0.5,
0.338991, -4.127203, -7.877652, 0, 1.5, 0.5, 0.5
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
-3.581883, 0.5243386, -7.877652, 0, -0.5, 0.5, 0.5,
-3.581883, 0.5243386, -7.877652, 1, -0.5, 0.5, 0.5,
-3.581883, 0.5243386, -7.877652, 1, 1.5, 0.5, 0.5,
-3.581883, 0.5243386, -7.877652, 0, 1.5, 0.5, 0.5
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
-3.581883, -4.127203, -0.48541, 0, -0.5, 0.5, 0.5,
-3.581883, -4.127203, -0.48541, 1, -0.5, 0.5, 0.5,
-3.581883, -4.127203, -0.48541, 1, 1.5, 0.5, 0.5,
-3.581883, -4.127203, -0.48541, 0, 1.5, 0.5, 0.5
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
-2, -3.053771, -6.17175,
3, -3.053771, -6.17175,
-2, -3.053771, -6.17175,
-2, -3.232676, -6.456067,
-1, -3.053771, -6.17175,
-1, -3.232676, -6.456067,
0, -3.053771, -6.17175,
0, -3.232676, -6.456067,
1, -3.053771, -6.17175,
1, -3.232676, -6.456067,
2, -3.053771, -6.17175,
2, -3.232676, -6.456067,
3, -3.053771, -6.17175,
3, -3.232676, -6.456067
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
-2, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
-2, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
-2, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
-2, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5,
-1, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
-1, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
-1, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
-1, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5,
0, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
0, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
0, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
0, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5,
1, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
1, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
1, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
1, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5,
2, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
2, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
2, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
2, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5,
3, -3.590487, -7.024701, 0, -0.5, 0.5, 0.5,
3, -3.590487, -7.024701, 1, -0.5, 0.5, 0.5,
3, -3.590487, -7.024701, 1, 1.5, 0.5, 0.5,
3, -3.590487, -7.024701, 0, 1.5, 0.5, 0.5
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
-2.677066, -2, -6.17175,
-2.677066, 3, -6.17175,
-2.677066, -2, -6.17175,
-2.827869, -2, -6.456067,
-2.677066, -1, -6.17175,
-2.827869, -1, -6.456067,
-2.677066, 0, -6.17175,
-2.827869, 0, -6.456067,
-2.677066, 1, -6.17175,
-2.827869, 1, -6.456067,
-2.677066, 2, -6.17175,
-2.827869, 2, -6.456067,
-2.677066, 3, -6.17175,
-2.827869, 3, -6.456067
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
-3.129474, -2, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, -2, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, -2, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, -2, -7.024701, 0, 1.5, 0.5, 0.5,
-3.129474, -1, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, -1, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, -1, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, -1, -7.024701, 0, 1.5, 0.5, 0.5,
-3.129474, 0, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, 0, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, 0, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, 0, -7.024701, 0, 1.5, 0.5, 0.5,
-3.129474, 1, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, 1, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, 1, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, 1, -7.024701, 0, 1.5, 0.5, 0.5,
-3.129474, 2, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, 2, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, 2, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, 2, -7.024701, 0, 1.5, 0.5, 0.5,
-3.129474, 3, -7.024701, 0, -0.5, 0.5, 0.5,
-3.129474, 3, -7.024701, 1, -0.5, 0.5, 0.5,
-3.129474, 3, -7.024701, 1, 1.5, 0.5, 0.5,
-3.129474, 3, -7.024701, 0, 1.5, 0.5, 0.5
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
-2.677066, -3.053771, -6,
-2.677066, -3.053771, 4,
-2.677066, -3.053771, -6,
-2.827869, -3.232676, -6,
-2.677066, -3.053771, -4,
-2.827869, -3.232676, -4,
-2.677066, -3.053771, -2,
-2.827869, -3.232676, -2,
-2.677066, -3.053771, 0,
-2.827869, -3.232676, 0,
-2.677066, -3.053771, 2,
-2.827869, -3.232676, 2,
-2.677066, -3.053771, 4,
-2.827869, -3.232676, 4
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
-3.129474, -3.590487, -6, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -6, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -6, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, -6, 0, 1.5, 0.5, 0.5,
-3.129474, -3.590487, -4, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -4, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -4, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, -4, 0, 1.5, 0.5, 0.5,
-3.129474, -3.590487, -2, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -2, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, -2, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, -2, 0, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 0, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 0, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 0, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 0, 0, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 2, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 2, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 2, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 2, 0, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 4, 0, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 4, 1, -0.5, 0.5, 0.5,
-3.129474, -3.590487, 4, 1, 1.5, 0.5, 0.5,
-3.129474, -3.590487, 4, 0, 1.5, 0.5, 0.5
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
-2.677066, -3.053771, -6.17175,
-2.677066, 4.102448, -6.17175,
-2.677066, -3.053771, 5.20093,
-2.677066, 4.102448, 5.20093,
-2.677066, -3.053771, -6.17175,
-2.677066, -3.053771, 5.20093,
-2.677066, 4.102448, -6.17175,
-2.677066, 4.102448, 5.20093,
-2.677066, -3.053771, -6.17175,
3.355048, -3.053771, -6.17175,
-2.677066, -3.053771, 5.20093,
3.355048, -3.053771, 5.20093,
-2.677066, 4.102448, -6.17175,
3.355048, 4.102448, -6.17175,
-2.677066, 4.102448, 5.20093,
3.355048, 4.102448, 5.20093,
3.355048, -3.053771, -6.17175,
3.355048, 4.102448, -6.17175,
3.355048, -3.053771, 5.20093,
3.355048, 4.102448, 5.20093,
3.355048, -3.053771, -6.17175,
3.355048, -3.053771, 5.20093,
3.355048, 4.102448, -6.17175,
3.355048, 4.102448, 5.20093
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
var radius = 7.86486;
var distance = 34.99165;
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
mvMatrix.translate( -0.338991, -0.5243386, 0.48541 );
mvMatrix.scale( 1.409728, 1.188287, 0.7477253 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99165);
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


