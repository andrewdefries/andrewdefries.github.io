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
-3.118137, 1.935086, -2.759296, 1, 0, 0, 1,
-2.933179, -0.2739814, -3.153049, 1, 0.007843138, 0, 1,
-2.80661, 0.4430248, -0.8760768, 1, 0.01176471, 0, 1,
-2.779274, 1.200886, -0.7833952, 1, 0.01960784, 0, 1,
-2.670424, 1.144247, -0.9611127, 1, 0.02352941, 0, 1,
-2.532775, -0.927471, -1.907052, 1, 0.03137255, 0, 1,
-2.509303, -0.6717304, -1.588992, 1, 0.03529412, 0, 1,
-2.384586, 1.092556, 1.351681, 1, 0.04313726, 0, 1,
-2.377193, 0.2932244, -0.7663451, 1, 0.04705882, 0, 1,
-2.354106, 0.503347, -2.075512, 1, 0.05490196, 0, 1,
-2.341135, 0.4052338, -0.197511, 1, 0.05882353, 0, 1,
-2.314507, 0.5247871, -0.7008476, 1, 0.06666667, 0, 1,
-2.299848, -1.509391, -2.561093, 1, 0.07058824, 0, 1,
-2.280145, 0.9154344, 0.2796982, 1, 0.07843138, 0, 1,
-2.277177, -0.7127979, -1.44037, 1, 0.08235294, 0, 1,
-2.256643, -0.07468786, -1.814101, 1, 0.09019608, 0, 1,
-2.223202, -0.6198012, -2.343939, 1, 0.09411765, 0, 1,
-2.218099, 0.568195, -1.700987, 1, 0.1019608, 0, 1,
-2.211896, 0.1801132, -1.185903, 1, 0.1098039, 0, 1,
-2.203842, 0.3095127, -2.55899, 1, 0.1137255, 0, 1,
-2.111857, 0.4262219, -0.1202869, 1, 0.1215686, 0, 1,
-2.082418, 0.8948059, -0.9878048, 1, 0.1254902, 0, 1,
-2.045871, -1.228266, -2.633427, 1, 0.1333333, 0, 1,
-2.022388, 0.3754614, -2.290862, 1, 0.1372549, 0, 1,
-2.013384, 0.2000641, -0.8968316, 1, 0.145098, 0, 1,
-2.009795, 0.6209528, -0.5527257, 1, 0.1490196, 0, 1,
-1.990296, 0.1961559, -1.600555, 1, 0.1568628, 0, 1,
-1.980217, 0.650978, 1.938406, 1, 0.1607843, 0, 1,
-1.949053, -0.2596593, -1.4817, 1, 0.1686275, 0, 1,
-1.943887, 0.4104834, -2.311147, 1, 0.172549, 0, 1,
-1.939467, -0.6155155, -3.75787, 1, 0.1803922, 0, 1,
-1.920213, -0.5272682, -1.60258, 1, 0.1843137, 0, 1,
-1.860853, 1.492106, -1.587538, 1, 0.1921569, 0, 1,
-1.850237, -2.017468, -4.75692, 1, 0.1960784, 0, 1,
-1.847723, 1.684545, -2.720649, 1, 0.2039216, 0, 1,
-1.807038, -0.1162785, -1.518799, 1, 0.2117647, 0, 1,
-1.768308, 0.05621327, -2.1636, 1, 0.2156863, 0, 1,
-1.760856, 1.405946, -2.351586, 1, 0.2235294, 0, 1,
-1.758844, 2.223858, -0.3145921, 1, 0.227451, 0, 1,
-1.742765, 0.3079033, -2.866353, 1, 0.2352941, 0, 1,
-1.734369, 1.735834, 0.7835804, 1, 0.2392157, 0, 1,
-1.731049, -0.531478, -2.719182, 1, 0.2470588, 0, 1,
-1.724629, 0.5972753, -2.038331, 1, 0.2509804, 0, 1,
-1.688332, -1.482015, -3.081416, 1, 0.2588235, 0, 1,
-1.687707, -0.5243898, -0.9128379, 1, 0.2627451, 0, 1,
-1.664134, 1.59534, 0.6614112, 1, 0.2705882, 0, 1,
-1.663401, 0.1756702, -0.9867774, 1, 0.2745098, 0, 1,
-1.643676, 0.8470469, -1.529619, 1, 0.282353, 0, 1,
-1.642393, 0.6060936, -1.548865, 1, 0.2862745, 0, 1,
-1.63116, -0.9683005, -0.4751978, 1, 0.2941177, 0, 1,
-1.630698, 1.478528, -2.247384, 1, 0.3019608, 0, 1,
-1.626824, -0.6319493, -1.735804, 1, 0.3058824, 0, 1,
-1.626652, -0.6680898, -3.938059, 1, 0.3137255, 0, 1,
-1.616988, 0.7703424, 0.6444357, 1, 0.3176471, 0, 1,
-1.607221, -1.489153, -2.421394, 1, 0.3254902, 0, 1,
-1.605509, 1.845639, -2.504514, 1, 0.3294118, 0, 1,
-1.574955, -0.4624951, -0.7532174, 1, 0.3372549, 0, 1,
-1.566321, 0.167393, -2.312333, 1, 0.3411765, 0, 1,
-1.566015, -1.002986, -1.437357, 1, 0.3490196, 0, 1,
-1.564927, 1.014816, -2.086927, 1, 0.3529412, 0, 1,
-1.555341, 0.8791463, -0.4183672, 1, 0.3607843, 0, 1,
-1.554396, -0.3567995, -1.914635, 1, 0.3647059, 0, 1,
-1.546311, -0.8607879, -2.460968, 1, 0.372549, 0, 1,
-1.533214, 0.8109665, -1.375787, 1, 0.3764706, 0, 1,
-1.526039, 0.7978762, -0.8599504, 1, 0.3843137, 0, 1,
-1.525479, -1.166273, -1.917406, 1, 0.3882353, 0, 1,
-1.515195, -0.9038098, -0.5628522, 1, 0.3960784, 0, 1,
-1.511754, -0.8261679, -3.129685, 1, 0.4039216, 0, 1,
-1.507722, -0.3933773, -1.341065, 1, 0.4078431, 0, 1,
-1.49191, -1.761676, -2.227437, 1, 0.4156863, 0, 1,
-1.487181, 0.3999527, -0.3014715, 1, 0.4196078, 0, 1,
-1.484367, -0.5021981, -1.787615, 1, 0.427451, 0, 1,
-1.470658, -0.4769236, -0.3476648, 1, 0.4313726, 0, 1,
-1.46691, -1.00763, -2.623532, 1, 0.4392157, 0, 1,
-1.455939, 0.1141324, -1.01652, 1, 0.4431373, 0, 1,
-1.448972, 1.259186, -1.788268, 1, 0.4509804, 0, 1,
-1.440218, -0.5739014, -2.770052, 1, 0.454902, 0, 1,
-1.431198, -0.0199765, -1.554585, 1, 0.4627451, 0, 1,
-1.425924, -0.1180645, -2.132434, 1, 0.4666667, 0, 1,
-1.406384, 0.4420631, -2.143701, 1, 0.4745098, 0, 1,
-1.404911, -1.725662, -3.398335, 1, 0.4784314, 0, 1,
-1.393296, 1.741033, -1.666449, 1, 0.4862745, 0, 1,
-1.387724, 0.4388192, -0.949106, 1, 0.4901961, 0, 1,
-1.384394, -0.482838, -0.3582652, 1, 0.4980392, 0, 1,
-1.381315, 0.6448002, 1.618067, 1, 0.5058824, 0, 1,
-1.372204, -0.102434, -1.289297, 1, 0.509804, 0, 1,
-1.370241, -0.3793181, -0.401202, 1, 0.5176471, 0, 1,
-1.361368, -0.461863, -2.719311, 1, 0.5215687, 0, 1,
-1.35021, 0.09328299, -2.133111, 1, 0.5294118, 0, 1,
-1.346606, 0.1328796, -2.052464, 1, 0.5333334, 0, 1,
-1.346444, 1.217744, -0.02940985, 1, 0.5411765, 0, 1,
-1.342909, -0.8819556, -2.266861, 1, 0.5450981, 0, 1,
-1.341396, -0.3512373, -2.787002, 1, 0.5529412, 0, 1,
-1.339579, -0.09232064, -1.99081, 1, 0.5568628, 0, 1,
-1.337778, -0.8367876, -4.296762, 1, 0.5647059, 0, 1,
-1.336721, -0.7239757, -1.160221, 1, 0.5686275, 0, 1,
-1.326126, -0.6185967, -2.107941, 1, 0.5764706, 0, 1,
-1.32522, -0.9424539, 0.6252524, 1, 0.5803922, 0, 1,
-1.323044, -0.1829946, -2.423407, 1, 0.5882353, 0, 1,
-1.322161, -0.8426459, -2.195832, 1, 0.5921569, 0, 1,
-1.311803, 0.08417758, -1.013862, 1, 0.6, 0, 1,
-1.311172, 0.887149, -0.5638908, 1, 0.6078432, 0, 1,
-1.310191, 0.8694935, -0.5503009, 1, 0.6117647, 0, 1,
-1.292773, -0.007859846, -1.300957, 1, 0.6196079, 0, 1,
-1.290565, 0.555087, -2.60019, 1, 0.6235294, 0, 1,
-1.287504, 2.217734, -0.1046163, 1, 0.6313726, 0, 1,
-1.284754, 0.4927917, -1.764403, 1, 0.6352941, 0, 1,
-1.283756, 0.07574169, 0.5025806, 1, 0.6431373, 0, 1,
-1.276183, -1.988459, -2.236291, 1, 0.6470588, 0, 1,
-1.254397, -0.433042, -2.706992, 1, 0.654902, 0, 1,
-1.23919, 0.3170464, 0.325406, 1, 0.6588235, 0, 1,
-1.237331, 0.03824589, -2.260461, 1, 0.6666667, 0, 1,
-1.233945, 0.4481133, -0.4240903, 1, 0.6705883, 0, 1,
-1.224699, -1.85105, -2.071331, 1, 0.6784314, 0, 1,
-1.211766, -0.7131218, -2.544284, 1, 0.682353, 0, 1,
-1.205044, -0.1077708, -3.374034, 1, 0.6901961, 0, 1,
-1.2027, -1.156476, -2.197414, 1, 0.6941177, 0, 1,
-1.202505, -2.502445, -3.652636, 1, 0.7019608, 0, 1,
-1.202473, -0.1195901, -1.766198, 1, 0.7098039, 0, 1,
-1.201937, 1.378819, -1.750306, 1, 0.7137255, 0, 1,
-1.200035, 1.180118, 0.05729654, 1, 0.7215686, 0, 1,
-1.199844, -1.325576, -2.8759, 1, 0.7254902, 0, 1,
-1.199163, -1.311258, -3.428766, 1, 0.7333333, 0, 1,
-1.195083, -1.42893, -0.6772598, 1, 0.7372549, 0, 1,
-1.194134, -0.6225279, -1.218978, 1, 0.7450981, 0, 1,
-1.188469, -1.993292, -2.900014, 1, 0.7490196, 0, 1,
-1.186127, -0.3162158, -0.8646266, 1, 0.7568628, 0, 1,
-1.180461, -0.02061185, -3.777829, 1, 0.7607843, 0, 1,
-1.180287, -1.488937, -3.478141, 1, 0.7686275, 0, 1,
-1.17718, -0.1079386, -1.680033, 1, 0.772549, 0, 1,
-1.173302, 0.9439762, -0.9099106, 1, 0.7803922, 0, 1,
-1.17235, -0.2583534, -3.620414, 1, 0.7843137, 0, 1,
-1.171656, 0.1012254, -2.168996, 1, 0.7921569, 0, 1,
-1.16833, -0.3560719, -1.140793, 1, 0.7960784, 0, 1,
-1.167886, 0.3599011, -0.7048964, 1, 0.8039216, 0, 1,
-1.163511, -1.813326, -4.035223, 1, 0.8117647, 0, 1,
-1.158614, -0.6445386, -1.60388, 1, 0.8156863, 0, 1,
-1.157092, -0.4692288, -4.320014, 1, 0.8235294, 0, 1,
-1.14685, 1.130874, -0.5773161, 1, 0.827451, 0, 1,
-1.140882, 0.1438945, -2.73764, 1, 0.8352941, 0, 1,
-1.139399, 0.8122157, -1.989709, 1, 0.8392157, 0, 1,
-1.135408, -0.6368408, -0.9265234, 1, 0.8470588, 0, 1,
-1.130792, 1.081179, -0.6546813, 1, 0.8509804, 0, 1,
-1.130495, -0.3659097, -0.7899461, 1, 0.8588235, 0, 1,
-1.125453, -0.6565965, -3.60886, 1, 0.8627451, 0, 1,
-1.123467, -0.5623572, 0.2227898, 1, 0.8705882, 0, 1,
-1.122455, -0.7521386, -4.025303, 1, 0.8745098, 0, 1,
-1.107531, -0.1138059, -2.657689, 1, 0.8823529, 0, 1,
-1.105703, -0.5454264, -1.502746, 1, 0.8862745, 0, 1,
-1.095481, 1.18882, -0.7932277, 1, 0.8941177, 0, 1,
-1.089672, -0.4508159, -0.9248433, 1, 0.8980392, 0, 1,
-1.08748, -0.715762, -2.998388, 1, 0.9058824, 0, 1,
-1.077125, -2.963507, -0.8505684, 1, 0.9137255, 0, 1,
-1.076534, -1.201321, -2.744991, 1, 0.9176471, 0, 1,
-1.072274, -0.5667177, -0.258211, 1, 0.9254902, 0, 1,
-1.068277, -0.4038813, -2.030576, 1, 0.9294118, 0, 1,
-1.063105, -0.1867256, -0.8647042, 1, 0.9372549, 0, 1,
-1.062633, 1.029594, -0.3641981, 1, 0.9411765, 0, 1,
-1.051088, 0.9665633, -0.2065629, 1, 0.9490196, 0, 1,
-1.043665, -0.8682126, -2.178718, 1, 0.9529412, 0, 1,
-1.041039, 0.1209361, -1.372303, 1, 0.9607843, 0, 1,
-1.027753, 0.9677591, 0.2135536, 1, 0.9647059, 0, 1,
-1.019537, 0.1103307, -1.300532, 1, 0.972549, 0, 1,
-1.01876, 1.014417, -0.5924384, 1, 0.9764706, 0, 1,
-1.018553, 0.8897519, -1.256523, 1, 0.9843137, 0, 1,
-1.01061, -0.01070291, -2.097554, 1, 0.9882353, 0, 1,
-1.009064, -0.7520521, -2.450733, 1, 0.9960784, 0, 1,
-1.006811, -0.5238223, -2.016374, 0.9960784, 1, 0, 1,
-1.003129, 1.384629, 0.159689, 0.9921569, 1, 0, 1,
-1.002064, -1.389156, -3.096741, 0.9843137, 1, 0, 1,
-0.9943527, 1.467812, 0.1570528, 0.9803922, 1, 0, 1,
-0.9884037, 0.159571, -2.800087, 0.972549, 1, 0, 1,
-0.9883181, 0.2062966, -1.000311, 0.9686275, 1, 0, 1,
-0.9864203, 1.011611, -0.2724099, 0.9607843, 1, 0, 1,
-0.9861588, -1.735528, -4.776713, 0.9568627, 1, 0, 1,
-0.9826199, -1.630742, -2.128693, 0.9490196, 1, 0, 1,
-0.9817263, 0.3042258, -1.756496, 0.945098, 1, 0, 1,
-0.9799964, 0.3568482, -1.416889, 0.9372549, 1, 0, 1,
-0.9799168, -0.6886424, -1.617999, 0.9333333, 1, 0, 1,
-0.9798172, 0.1394801, -1.844317, 0.9254902, 1, 0, 1,
-0.9782454, -0.02964824, -1.681661, 0.9215686, 1, 0, 1,
-0.9756817, -0.5493826, -1.665859, 0.9137255, 1, 0, 1,
-0.9690943, 0.7202364, -0.876182, 0.9098039, 1, 0, 1,
-0.9614598, -0.2630587, -0.1347864, 0.9019608, 1, 0, 1,
-0.9549826, -1.801866, -2.876286, 0.8941177, 1, 0, 1,
-0.9378859, 0.5831764, -1.115113, 0.8901961, 1, 0, 1,
-0.9370267, 0.1811586, -1.137727, 0.8823529, 1, 0, 1,
-0.9351557, -0.6339502, -3.676988, 0.8784314, 1, 0, 1,
-0.9341734, -0.7403615, -1.634744, 0.8705882, 1, 0, 1,
-0.9226357, -0.4172199, -2.595251, 0.8666667, 1, 0, 1,
-0.9222187, -0.2006458, -1.436154, 0.8588235, 1, 0, 1,
-0.916079, 0.8914326, -0.7672785, 0.854902, 1, 0, 1,
-0.9157518, -0.6167577, -0.7213561, 0.8470588, 1, 0, 1,
-0.9145103, 2.156147, -0.888584, 0.8431373, 1, 0, 1,
-0.9099745, 0.1367901, -2.324301, 0.8352941, 1, 0, 1,
-0.902831, -0.5372083, -0.5533195, 0.8313726, 1, 0, 1,
-0.8944256, -0.5905793, -2.397389, 0.8235294, 1, 0, 1,
-0.8933164, -0.8000399, -1.643869, 0.8196079, 1, 0, 1,
-0.8882468, -0.4681143, -2.381927, 0.8117647, 1, 0, 1,
-0.8872006, 1.583406, -0.5050566, 0.8078431, 1, 0, 1,
-0.8869237, 0.2183106, -1.346023, 0.8, 1, 0, 1,
-0.8855635, 0.8708802, -1.621604, 0.7921569, 1, 0, 1,
-0.8840097, 0.9049324, -1.473981, 0.7882353, 1, 0, 1,
-0.8761303, -0.3297815, -1.939995, 0.7803922, 1, 0, 1,
-0.8679558, -0.8144925, -1.872564, 0.7764706, 1, 0, 1,
-0.8664047, 1.23704, 0.07831155, 0.7686275, 1, 0, 1,
-0.8592265, 0.444504, -1.473194, 0.7647059, 1, 0, 1,
-0.8459935, -0.1905259, -2.304713, 0.7568628, 1, 0, 1,
-0.8402867, -0.3976724, -0.6674482, 0.7529412, 1, 0, 1,
-0.8400137, 0.1290699, -0.511713, 0.7450981, 1, 0, 1,
-0.8308741, 0.3820545, -1.673926, 0.7411765, 1, 0, 1,
-0.829977, -1.272036, -1.204808, 0.7333333, 1, 0, 1,
-0.8275543, -1.222212, -2.347089, 0.7294118, 1, 0, 1,
-0.8245831, 1.411117, 1.049766, 0.7215686, 1, 0, 1,
-0.8243226, -0.3108084, -1.681492, 0.7176471, 1, 0, 1,
-0.8231853, 0.4183992, 1.116857, 0.7098039, 1, 0, 1,
-0.8207973, -0.3329724, -0.5985494, 0.7058824, 1, 0, 1,
-0.8192877, -0.8352133, -2.984843, 0.6980392, 1, 0, 1,
-0.8185089, 0.183522, -2.013153, 0.6901961, 1, 0, 1,
-0.8105484, 0.438936, -3.236915, 0.6862745, 1, 0, 1,
-0.8089157, -0.1043565, -3.539782, 0.6784314, 1, 0, 1,
-0.8000702, -1.751543, -1.278622, 0.6745098, 1, 0, 1,
-0.7998168, 0.02329329, -2.007884, 0.6666667, 1, 0, 1,
-0.7970438, 0.9663656, -0.3561646, 0.6627451, 1, 0, 1,
-0.7934394, 0.3257786, -0.8885453, 0.654902, 1, 0, 1,
-0.7918586, 0.4372875, -2.673709, 0.6509804, 1, 0, 1,
-0.788026, 0.01885069, -1.500221, 0.6431373, 1, 0, 1,
-0.785339, 1.003601, -1.681535, 0.6392157, 1, 0, 1,
-0.7790483, -0.5353421, -1.145603, 0.6313726, 1, 0, 1,
-0.7740645, 1.012129, -2.176372, 0.627451, 1, 0, 1,
-0.7676212, 0.9275227, -0.7695604, 0.6196079, 1, 0, 1,
-0.7651037, 1.816489, -0.3401065, 0.6156863, 1, 0, 1,
-0.7650841, -0.1958649, -3.335458, 0.6078432, 1, 0, 1,
-0.7638628, -0.4551033, -1.848104, 0.6039216, 1, 0, 1,
-0.7625828, 0.04431936, -0.3201094, 0.5960785, 1, 0, 1,
-0.7614806, -1.285555, -1.844143, 0.5882353, 1, 0, 1,
-0.7529999, -0.7691241, -0.6279574, 0.5843138, 1, 0, 1,
-0.7517746, 1.359095, 0.9031203, 0.5764706, 1, 0, 1,
-0.7504175, 0.5025493, 0.7839494, 0.572549, 1, 0, 1,
-0.7491386, -0.1647276, -0.01992611, 0.5647059, 1, 0, 1,
-0.7467989, -0.693411, -1.972911, 0.5607843, 1, 0, 1,
-0.7466958, -0.7831329, -2.136602, 0.5529412, 1, 0, 1,
-0.7415975, 1.143668, -0.9765746, 0.5490196, 1, 0, 1,
-0.7381593, -0.3721325, -1.280783, 0.5411765, 1, 0, 1,
-0.7247404, -0.4630411, -1.290795, 0.5372549, 1, 0, 1,
-0.7232726, -2.234016, -2.271598, 0.5294118, 1, 0, 1,
-0.7223086, 0.1118133, -0.3781687, 0.5254902, 1, 0, 1,
-0.7191616, 0.1553932, -1.82787, 0.5176471, 1, 0, 1,
-0.71714, 1.640513, -0.8808888, 0.5137255, 1, 0, 1,
-0.7091987, -0.6216083, -0.6637091, 0.5058824, 1, 0, 1,
-0.7079062, -0.9213681, -2.052275, 0.5019608, 1, 0, 1,
-0.7017192, -0.03095658, -2.767693, 0.4941176, 1, 0, 1,
-0.6942425, 0.4382587, 0.1253824, 0.4862745, 1, 0, 1,
-0.6936011, 0.2922025, -0.7096833, 0.4823529, 1, 0, 1,
-0.6935079, 0.6302717, -2.283178, 0.4745098, 1, 0, 1,
-0.6849436, -0.6056912, -0.5049761, 0.4705882, 1, 0, 1,
-0.6836846, 0.6945521, -1.912083, 0.4627451, 1, 0, 1,
-0.6835764, -0.8069629, -2.275369, 0.4588235, 1, 0, 1,
-0.683214, -0.6495038, -4.782818, 0.4509804, 1, 0, 1,
-0.6831669, -0.4868129, -1.895028, 0.4470588, 1, 0, 1,
-0.6831584, -0.8089923, -2.214331, 0.4392157, 1, 0, 1,
-0.6812062, 0.4851973, -0.3865985, 0.4352941, 1, 0, 1,
-0.6745827, -0.484132, -2.779484, 0.427451, 1, 0, 1,
-0.6741847, 0.4048601, -1.224563, 0.4235294, 1, 0, 1,
-0.6691817, 0.5114428, -0.8608932, 0.4156863, 1, 0, 1,
-0.6690584, 0.5786094, -1.15771, 0.4117647, 1, 0, 1,
-0.6665966, -0.1289874, -2.905332, 0.4039216, 1, 0, 1,
-0.6647934, 1.776569, -1.696574, 0.3960784, 1, 0, 1,
-0.6636147, -0.737042, -1.561718, 0.3921569, 1, 0, 1,
-0.6586347, -0.6120217, -0.9415863, 0.3843137, 1, 0, 1,
-0.6567582, -1.818543, -2.191275, 0.3803922, 1, 0, 1,
-0.6551764, 0.2116185, -1.962262, 0.372549, 1, 0, 1,
-0.6546006, -0.06752355, -1.455718, 0.3686275, 1, 0, 1,
-0.654376, 0.8012525, -0.1667906, 0.3607843, 1, 0, 1,
-0.6523962, 1.224419, -1.847271, 0.3568628, 1, 0, 1,
-0.6482336, -0.7357826, -2.797199, 0.3490196, 1, 0, 1,
-0.6478778, 0.2090426, -1.437574, 0.345098, 1, 0, 1,
-0.644891, -0.3652272, -1.439846, 0.3372549, 1, 0, 1,
-0.6378861, 0.3239231, -1.411315, 0.3333333, 1, 0, 1,
-0.6345113, 0.3049024, -1.831175, 0.3254902, 1, 0, 1,
-0.6300316, -0.513703, -2.574017, 0.3215686, 1, 0, 1,
-0.6293948, -0.2741332, -1.221577, 0.3137255, 1, 0, 1,
-0.6273085, -0.5601658, -3.040125, 0.3098039, 1, 0, 1,
-0.6228835, 1.388333, -0.7187238, 0.3019608, 1, 0, 1,
-0.6212026, -1.091584, -2.017013, 0.2941177, 1, 0, 1,
-0.6193677, 1.879275, 1.300221, 0.2901961, 1, 0, 1,
-0.6193395, -1.01592, -1.77816, 0.282353, 1, 0, 1,
-0.6192864, 0.5893381, -1.62695, 0.2784314, 1, 0, 1,
-0.6119753, -0.9897068, -2.965354, 0.2705882, 1, 0, 1,
-0.6112416, 0.2462416, -1.089161, 0.2666667, 1, 0, 1,
-0.6111413, -0.9195855, -2.280277, 0.2588235, 1, 0, 1,
-0.607801, 0.9998829, -0.6252887, 0.254902, 1, 0, 1,
-0.6066745, -0.4933923, -2.194274, 0.2470588, 1, 0, 1,
-0.6004166, -1.602039, -4.592534, 0.2431373, 1, 0, 1,
-0.5999976, 0.268988, -2.005754, 0.2352941, 1, 0, 1,
-0.5974901, 0.5859051, -0.4462258, 0.2313726, 1, 0, 1,
-0.5950376, 1.877062, -0.4716638, 0.2235294, 1, 0, 1,
-0.5934076, 0.4815474, -1.814679, 0.2196078, 1, 0, 1,
-0.5920404, 0.9063907, 0.0002198663, 0.2117647, 1, 0, 1,
-0.5914351, 0.9594461, -0.5056474, 0.2078431, 1, 0, 1,
-0.5891217, -2.808493, -4.023025, 0.2, 1, 0, 1,
-0.5798354, -1.211884, -3.547421, 0.1921569, 1, 0, 1,
-0.5784919, -0.9617497, -3.436786, 0.1882353, 1, 0, 1,
-0.5724512, -0.5183181, -1.792929, 0.1803922, 1, 0, 1,
-0.5705748, -0.6141936, -2.126288, 0.1764706, 1, 0, 1,
-0.5661422, 1.12254, -2.534914, 0.1686275, 1, 0, 1,
-0.5655158, 0.8762213, -1.913227, 0.1647059, 1, 0, 1,
-0.5632478, -0.7769251, -1.507735, 0.1568628, 1, 0, 1,
-0.5615584, 1.016857, -1.501849, 0.1529412, 1, 0, 1,
-0.544965, 0.04331996, -1.517471, 0.145098, 1, 0, 1,
-0.5303376, 0.395993, -1.791262, 0.1411765, 1, 0, 1,
-0.5296443, 0.4403705, -0.2091875, 0.1333333, 1, 0, 1,
-0.5258278, 0.6143671, -1.904098, 0.1294118, 1, 0, 1,
-0.5198191, 0.631735, -1.152508, 0.1215686, 1, 0, 1,
-0.5143816, -1.117541, -3.148359, 0.1176471, 1, 0, 1,
-0.5130555, 0.2481339, -3.079509, 0.1098039, 1, 0, 1,
-0.5061565, 0.3735268, 0.7100503, 0.1058824, 1, 0, 1,
-0.5046571, 0.8565739, 1.005739, 0.09803922, 1, 0, 1,
-0.5013111, -0.1325751, -3.0203, 0.09019608, 1, 0, 1,
-0.5007545, -0.3087551, -3.503804, 0.08627451, 1, 0, 1,
-0.5005822, 0.5136005, -0.287242, 0.07843138, 1, 0, 1,
-0.496144, 0.6733686, 0.5985433, 0.07450981, 1, 0, 1,
-0.4869355, 0.2105336, -1.45153, 0.06666667, 1, 0, 1,
-0.4862325, -1.045364, -4.193746, 0.0627451, 1, 0, 1,
-0.4815759, -0.7294981, -3.323211, 0.05490196, 1, 0, 1,
-0.4800726, -1.171555, -2.983625, 0.05098039, 1, 0, 1,
-0.4799739, -0.1897293, -1.368405, 0.04313726, 1, 0, 1,
-0.4728865, 0.03409894, -0.7723277, 0.03921569, 1, 0, 1,
-0.4697424, -0.5850758, -1.20331, 0.03137255, 1, 0, 1,
-0.4663979, 0.9082901, -1.744282, 0.02745098, 1, 0, 1,
-0.4649002, -1.326865, -3.522193, 0.01960784, 1, 0, 1,
-0.4612104, -1.545966, -3.568017, 0.01568628, 1, 0, 1,
-0.4524504, 0.8266733, -2.769473e-05, 0.007843138, 1, 0, 1,
-0.449362, -0.2128131, -1.486645, 0.003921569, 1, 0, 1,
-0.4487043, 0.3218391, 0.05862427, 0, 1, 0.003921569, 1,
-0.4408867, -0.6115098, -4.95094, 0, 1, 0.01176471, 1,
-0.440749, 0.8631476, -0.06337755, 0, 1, 0.01568628, 1,
-0.4325418, 1.86601, 0.006982511, 0, 1, 0.02352941, 1,
-0.4239582, -1.494625, -2.025734, 0, 1, 0.02745098, 1,
-0.4234939, -0.3405232, -3.580104, 0, 1, 0.03529412, 1,
-0.4149128, 1.021549, 1.526134, 0, 1, 0.03921569, 1,
-0.4142422, 1.682427, 0.2069035, 0, 1, 0.04705882, 1,
-0.4120695, -0.1780562, -3.209011, 0, 1, 0.05098039, 1,
-0.4120352, -2.126215, -1.588188, 0, 1, 0.05882353, 1,
-0.4094599, 0.1323553, -0.1495783, 0, 1, 0.0627451, 1,
-0.4066986, -0.1340805, -1.49798, 0, 1, 0.07058824, 1,
-0.4058391, -0.2081681, -0.4406165, 0, 1, 0.07450981, 1,
-0.4057379, -1.466258, -2.377692, 0, 1, 0.08235294, 1,
-0.4046049, 0.4403135, -1.354421, 0, 1, 0.08627451, 1,
-0.4043472, -0.5979356, -2.663168, 0, 1, 0.09411765, 1,
-0.4009645, -0.9494089, -3.928932, 0, 1, 0.1019608, 1,
-0.3973578, 0.01452348, -1.423062, 0, 1, 0.1058824, 1,
-0.3972516, -0.7096167, -2.391112, 0, 1, 0.1137255, 1,
-0.396839, -0.1832668, -1.983031, 0, 1, 0.1176471, 1,
-0.3862623, 0.2906272, -1.558169, 0, 1, 0.1254902, 1,
-0.3837625, 0.2060446, -0.8844759, 0, 1, 0.1294118, 1,
-0.3779585, -0.900994, -2.070692, 0, 1, 0.1372549, 1,
-0.3762345, -0.700602, -2.854925, 0, 1, 0.1411765, 1,
-0.3736439, -0.7310903, -2.631604, 0, 1, 0.1490196, 1,
-0.3723074, 0.2894154, -2.086547, 0, 1, 0.1529412, 1,
-0.3697665, -0.07188505, -1.56003, 0, 1, 0.1607843, 1,
-0.3638903, 0.1195075, -0.5097423, 0, 1, 0.1647059, 1,
-0.3628031, -0.9311154, -3.485205, 0, 1, 0.172549, 1,
-0.3589889, 0.8190199, -0.3953291, 0, 1, 0.1764706, 1,
-0.3580302, 0.8198078, -2.524226, 0, 1, 0.1843137, 1,
-0.3553234, -0.4555382, -2.042198, 0, 1, 0.1882353, 1,
-0.3546672, -0.09228865, -0.6996748, 0, 1, 0.1960784, 1,
-0.3534426, 2.086711, -1.313099, 0, 1, 0.2039216, 1,
-0.3516422, 0.3263663, -0.4723984, 0, 1, 0.2078431, 1,
-0.3498119, -2.804577, -2.166752, 0, 1, 0.2156863, 1,
-0.3470259, 1.086037, -0.2157997, 0, 1, 0.2196078, 1,
-0.3447804, -1.113791, -2.709614, 0, 1, 0.227451, 1,
-0.3421941, 1.463137, -0.6855316, 0, 1, 0.2313726, 1,
-0.3404457, 0.5951145, -1.035654, 0, 1, 0.2392157, 1,
-0.3404447, 0.9989472, -0.5776709, 0, 1, 0.2431373, 1,
-0.3391075, 0.5426615, -0.1222418, 0, 1, 0.2509804, 1,
-0.3384753, 0.1467383, -0.7444424, 0, 1, 0.254902, 1,
-0.3315038, -0.2906863, -3.724623, 0, 1, 0.2627451, 1,
-0.3226939, 0.4634066, -0.822493, 0, 1, 0.2666667, 1,
-0.3223672, -0.8475451, -3.352397, 0, 1, 0.2745098, 1,
-0.3218801, 0.2744736, 0.1439293, 0, 1, 0.2784314, 1,
-0.3192654, -0.8357349, -1.67518, 0, 1, 0.2862745, 1,
-0.3183212, -0.8154922, -2.930534, 0, 1, 0.2901961, 1,
-0.315848, -0.6869483, -3.383807, 0, 1, 0.2980392, 1,
-0.3147305, -0.4062673, -3.247735, 0, 1, 0.3058824, 1,
-0.3144496, 2.608901, -0.08657496, 0, 1, 0.3098039, 1,
-0.3132263, -0.4129803, -1.971743, 0, 1, 0.3176471, 1,
-0.3127522, 0.1184321, -2.581863, 0, 1, 0.3215686, 1,
-0.3106639, -0.7539858, -2.961914, 0, 1, 0.3294118, 1,
-0.3051007, 0.3283165, -1.861736, 0, 1, 0.3333333, 1,
-0.3021663, 0.314613, -0.01104006, 0, 1, 0.3411765, 1,
-0.3006027, -1.102689, -3.774215, 0, 1, 0.345098, 1,
-0.2996921, 0.5489579, -0.6703871, 0, 1, 0.3529412, 1,
-0.2978036, 0.1776386, -1.000807, 0, 1, 0.3568628, 1,
-0.2974904, -0.2406478, -1.27346, 0, 1, 0.3647059, 1,
-0.2940073, -0.2349917, -2.697957, 0, 1, 0.3686275, 1,
-0.2907503, 0.2855109, -0.8931983, 0, 1, 0.3764706, 1,
-0.2888307, 0.4762168, -0.6485299, 0, 1, 0.3803922, 1,
-0.2877128, -1.233022, -2.992756, 0, 1, 0.3882353, 1,
-0.2869259, -0.2988189, -2.402468, 0, 1, 0.3921569, 1,
-0.2868325, -0.46782, -1.964946, 0, 1, 0.4, 1,
-0.2840529, 1.841265, -1.281178, 0, 1, 0.4078431, 1,
-0.2823349, 0.6521938, -0.1228489, 0, 1, 0.4117647, 1,
-0.2821408, 1.691978, -2.628278, 0, 1, 0.4196078, 1,
-0.2768958, -0.0293645, -0.3084016, 0, 1, 0.4235294, 1,
-0.2760013, 0.02999049, -2.656213, 0, 1, 0.4313726, 1,
-0.2703722, -0.4027682, -3.221002, 0, 1, 0.4352941, 1,
-0.2667577, 0.4913483, -0.4760864, 0, 1, 0.4431373, 1,
-0.2601738, -1.066787, -2.587293, 0, 1, 0.4470588, 1,
-0.25966, -0.3865407, -4.282637, 0, 1, 0.454902, 1,
-0.2595887, 0.3363483, -1.972203, 0, 1, 0.4588235, 1,
-0.2583129, -1.175313, -3.501324, 0, 1, 0.4666667, 1,
-0.2545905, -2.646696, -1.767641, 0, 1, 0.4705882, 1,
-0.2488665, 0.4250232, -0.1803668, 0, 1, 0.4784314, 1,
-0.2488394, 0.9771757, -1.713983, 0, 1, 0.4823529, 1,
-0.2457588, 0.999301, -1.637331, 0, 1, 0.4901961, 1,
-0.2434547, 2.347609, 0.05762084, 0, 1, 0.4941176, 1,
-0.2402523, -0.06625734, -2.457303, 0, 1, 0.5019608, 1,
-0.2401204, 0.8853708, -0.06880072, 0, 1, 0.509804, 1,
-0.2386613, -0.6350806, -2.419939, 0, 1, 0.5137255, 1,
-0.2385014, 0.7597798, -0.05792345, 0, 1, 0.5215687, 1,
-0.2382422, -1.045813, -4.22789, 0, 1, 0.5254902, 1,
-0.2366666, 0.4905391, 0.009714194, 0, 1, 0.5333334, 1,
-0.2350885, -1.266993, -2.704799, 0, 1, 0.5372549, 1,
-0.2347806, -2.002573, -2.784788, 0, 1, 0.5450981, 1,
-0.2305787, 0.4814748, -1.039894, 0, 1, 0.5490196, 1,
-0.2273835, -0.09383299, -2.510272, 0, 1, 0.5568628, 1,
-0.2126289, 0.7057207, -0.4187299, 0, 1, 0.5607843, 1,
-0.2105479, 1.010514, -1.099777, 0, 1, 0.5686275, 1,
-0.209386, -1.171981, -4.321634, 0, 1, 0.572549, 1,
-0.208636, 1.039417, 0.7988937, 0, 1, 0.5803922, 1,
-0.2083755, 0.3692487, 0.3784607, 0, 1, 0.5843138, 1,
-0.2081478, 1.668676, 1.354821, 0, 1, 0.5921569, 1,
-0.2072632, -0.5718461, -1.713256, 0, 1, 0.5960785, 1,
-0.2044122, 0.7512159, -2.046597, 0, 1, 0.6039216, 1,
-0.2029355, -0.3275802, -1.182681, 0, 1, 0.6117647, 1,
-0.2026329, -0.1140511, -2.0764, 0, 1, 0.6156863, 1,
-0.196029, -1.176136, -3.401891, 0, 1, 0.6235294, 1,
-0.1952064, 0.07286107, 1.067162, 0, 1, 0.627451, 1,
-0.1948341, 0.01892676, -1.830218, 0, 1, 0.6352941, 1,
-0.1919596, 0.1393036, -1.432661, 0, 1, 0.6392157, 1,
-0.1888318, 0.03717711, -1.427822, 0, 1, 0.6470588, 1,
-0.1836593, 0.4240146, -0.7185152, 0, 1, 0.6509804, 1,
-0.1726882, -1.117087, -3.122386, 0, 1, 0.6588235, 1,
-0.169615, 0.8903525, -2.271436, 0, 1, 0.6627451, 1,
-0.1675716, 0.03742243, -1.741755, 0, 1, 0.6705883, 1,
-0.1651233, 0.1096732, -1.679067, 0, 1, 0.6745098, 1,
-0.1641047, 1.297806, 0.4352218, 0, 1, 0.682353, 1,
-0.1593215, 1.469951, 0.9059432, 0, 1, 0.6862745, 1,
-0.1511318, 1.345518, -0.832769, 0, 1, 0.6941177, 1,
-0.1497186, -0.8936384, -1.122177, 0, 1, 0.7019608, 1,
-0.1456335, 0.7785643, -0.2494318, 0, 1, 0.7058824, 1,
-0.1342947, 1.107518, 0.6452458, 0, 1, 0.7137255, 1,
-0.1330627, -0.2604339, -4.878886, 0, 1, 0.7176471, 1,
-0.1291754, -0.1626442, -3.217037, 0, 1, 0.7254902, 1,
-0.1266323, 0.3901157, -1.1743, 0, 1, 0.7294118, 1,
-0.126628, -0.2572528, -2.667953, 0, 1, 0.7372549, 1,
-0.1261138, -0.8505122, -3.08453, 0, 1, 0.7411765, 1,
-0.1243194, -0.6304512, -3.69793, 0, 1, 0.7490196, 1,
-0.1204414, -0.7774411, -2.520481, 0, 1, 0.7529412, 1,
-0.1195931, 2.059248, 1.553882, 0, 1, 0.7607843, 1,
-0.1175761, 0.7829362, -0.7191608, 0, 1, 0.7647059, 1,
-0.1168977, -0.6369656, -3.814227, 0, 1, 0.772549, 1,
-0.1146184, -0.7196315, -2.186234, 0, 1, 0.7764706, 1,
-0.1128815, -0.3173195, -2.427123, 0, 1, 0.7843137, 1,
-0.1091701, -0.5243365, -2.168862, 0, 1, 0.7882353, 1,
-0.1053073, 0.1509992, -1.408782, 0, 1, 0.7960784, 1,
-0.1042469, 1.158375, 1.389357, 0, 1, 0.8039216, 1,
-0.1025562, 2.437419, 0.1961911, 0, 1, 0.8078431, 1,
-0.1014528, 0.21443, 1.118486, 0, 1, 0.8156863, 1,
-0.09385342, -1.404727, -1.543467, 0, 1, 0.8196079, 1,
-0.09309575, -0.21317, -1.241291, 0, 1, 0.827451, 1,
-0.0921938, -0.411254, -5.915604, 0, 1, 0.8313726, 1,
-0.09179867, -0.5608195, -2.80625, 0, 1, 0.8392157, 1,
-0.09056862, -0.2438084, -2.900828, 0, 1, 0.8431373, 1,
-0.08737594, -0.8381602, -3.148261, 0, 1, 0.8509804, 1,
-0.08360232, -0.7772441, -0.3561255, 0, 1, 0.854902, 1,
-0.0795479, -0.6702659, -3.18543, 0, 1, 0.8627451, 1,
-0.07812419, -0.001563871, -3.395058, 0, 1, 0.8666667, 1,
-0.07799772, 0.1708373, -0.9062036, 0, 1, 0.8745098, 1,
-0.07711498, 1.115303, 0.04773297, 0, 1, 0.8784314, 1,
-0.07668152, 0.3040844, -0.4449689, 0, 1, 0.8862745, 1,
-0.07465694, 0.7876784, -0.8059911, 0, 1, 0.8901961, 1,
-0.07282484, -2.232751, -3.300693, 0, 1, 0.8980392, 1,
-0.07002277, -0.8681446, -1.892542, 0, 1, 0.9058824, 1,
-0.0689696, 0.9617855, -0.0313973, 0, 1, 0.9098039, 1,
-0.06851783, -1.008845, -1.967647, 0, 1, 0.9176471, 1,
-0.06820462, 1.034941, -0.8669202, 0, 1, 0.9215686, 1,
-0.06706656, -0.4845104, -2.555716, 0, 1, 0.9294118, 1,
-0.06610671, -0.296398, -5.167459, 0, 1, 0.9333333, 1,
-0.0634554, -1.336577, -0.5087221, 0, 1, 0.9411765, 1,
-0.06062943, 0.07782885, 0.999822, 0, 1, 0.945098, 1,
-0.05952368, 1.504945, 1.232436, 0, 1, 0.9529412, 1,
-0.05882294, -1.141829, -1.963991, 0, 1, 0.9568627, 1,
-0.05574711, 1.077037, -1.348773, 0, 1, 0.9647059, 1,
-0.05304893, 0.04291618, 0.5298966, 0, 1, 0.9686275, 1,
-0.05015542, -0.461385, -2.544953, 0, 1, 0.9764706, 1,
-0.04802691, 0.2068341, 0.3451546, 0, 1, 0.9803922, 1,
-0.03815223, 0.2626254, -2.385777, 0, 1, 0.9882353, 1,
-0.03357346, -1.494923, -3.240921, 0, 1, 0.9921569, 1,
-0.03292719, -0.8846833, -2.04262, 0, 1, 1, 1,
-0.03014631, -1.799071, -2.738618, 0, 0.9921569, 1, 1,
-0.02992195, 1.015208, 0.1118153, 0, 0.9882353, 1, 1,
-0.02767546, -1.807296, -2.371456, 0, 0.9803922, 1, 1,
-0.02600384, -2.077121, -3.431435, 0, 0.9764706, 1, 1,
-0.02559186, 1.012673, -0.4658045, 0, 0.9686275, 1, 1,
-0.02153367, 1.055915, -0.3323905, 0, 0.9647059, 1, 1,
-0.02018174, 0.8375715, 0.01695646, 0, 0.9568627, 1, 1,
-0.0186839, -0.2623275, -2.508086, 0, 0.9529412, 1, 1,
-0.01494966, 0.09544765, -0.5262938, 0, 0.945098, 1, 1,
-0.01160395, -1.075208, -4.487899, 0, 0.9411765, 1, 1,
-0.008040109, -0.7210634, -4.912479, 0, 0.9333333, 1, 1,
-0.005547515, -0.04369392, -3.019353, 0, 0.9294118, 1, 1,
-0.001113457, -0.557641, -2.031355, 0, 0.9215686, 1, 1,
-0.0007102744, 0.9591436, -0.7495618, 0, 0.9176471, 1, 1,
0.001347653, -0.4928449, 3.115193, 0, 0.9098039, 1, 1,
0.001410472, -0.7378359, 3.375687, 0, 0.9058824, 1, 1,
0.003924323, -0.8976216, 3.166365, 0, 0.8980392, 1, 1,
0.006827449, 0.2108309, 0.1575872, 0, 0.8901961, 1, 1,
0.006863534, -0.4251387, 3.135578, 0, 0.8862745, 1, 1,
0.01318299, 0.4317966, 0.6060897, 0, 0.8784314, 1, 1,
0.01733249, -1.421556, 3.626006, 0, 0.8745098, 1, 1,
0.0219558, 0.2216529, -1.42021, 0, 0.8666667, 1, 1,
0.02265379, -0.2072973, 3.122788, 0, 0.8627451, 1, 1,
0.02969036, -1.770125, 2.850824, 0, 0.854902, 1, 1,
0.03247815, 0.4745108, 0.09366314, 0, 0.8509804, 1, 1,
0.03286565, 0.4482848, -0.1807435, 0, 0.8431373, 1, 1,
0.03722125, 0.2670243, 1.608232, 0, 0.8392157, 1, 1,
0.03756074, 1.217293, 1.923818, 0, 0.8313726, 1, 1,
0.03879998, -0.001315868, 2.815295, 0, 0.827451, 1, 1,
0.04302232, 1.78648, -1.249177, 0, 0.8196079, 1, 1,
0.04587305, 1.82121, -0.4974807, 0, 0.8156863, 1, 1,
0.04750733, -0.2888852, 3.440369, 0, 0.8078431, 1, 1,
0.05425993, -0.0444341, 2.545596, 0, 0.8039216, 1, 1,
0.05542395, 1.076612, 1.241206, 0, 0.7960784, 1, 1,
0.05665272, -0.9210245, 4.141808, 0, 0.7882353, 1, 1,
0.05719195, -1.637211, 3.247626, 0, 0.7843137, 1, 1,
0.05732213, 0.1491512, 1.687488, 0, 0.7764706, 1, 1,
0.05784141, 0.5466086, 1.242802, 0, 0.772549, 1, 1,
0.05991852, 0.8350465, -1.489919, 0, 0.7647059, 1, 1,
0.06488486, -0.3036801, 4.302256, 0, 0.7607843, 1, 1,
0.06501132, -1.192185, 3.812265, 0, 0.7529412, 1, 1,
0.06766274, 1.077377, -1.367229, 0, 0.7490196, 1, 1,
0.06829361, 0.9162769, 1.012057, 0, 0.7411765, 1, 1,
0.07104465, 1.128803, 0.2886544, 0, 0.7372549, 1, 1,
0.07660977, -1.985694, 1.762727, 0, 0.7294118, 1, 1,
0.07782945, 1.182305, 0.2787631, 0, 0.7254902, 1, 1,
0.07919349, -1.536768, 2.59843, 0, 0.7176471, 1, 1,
0.08199783, -0.6117162, 3.427169, 0, 0.7137255, 1, 1,
0.08251183, -0.1106103, 1.604599, 0, 0.7058824, 1, 1,
0.08260294, 0.7695592, 2.757715, 0, 0.6980392, 1, 1,
0.08520743, 1.357988, 0.3869477, 0, 0.6941177, 1, 1,
0.08618983, -0.8387722, 2.623689, 0, 0.6862745, 1, 1,
0.08736797, 0.5486355, 0.7672728, 0, 0.682353, 1, 1,
0.09461042, -2.518732, 5.105175, 0, 0.6745098, 1, 1,
0.09590212, 1.74182, -2.314878, 0, 0.6705883, 1, 1,
0.1010662, -0.9128518, 2.889965, 0, 0.6627451, 1, 1,
0.1053696, 1.922139, -0.5923541, 0, 0.6588235, 1, 1,
0.1054703, 0.5708786, 0.4816618, 0, 0.6509804, 1, 1,
0.1098346, 1.406673, 0.8448337, 0, 0.6470588, 1, 1,
0.1121282, -1.906713, 2.598045, 0, 0.6392157, 1, 1,
0.1134195, 1.864002, -2.104946, 0, 0.6352941, 1, 1,
0.1139085, -1.286538, 3.57477, 0, 0.627451, 1, 1,
0.114526, -0.2459219, 3.716021, 0, 0.6235294, 1, 1,
0.1154081, 0.2613078, 3.418779, 0, 0.6156863, 1, 1,
0.1183277, -0.2638765, 3.620989, 0, 0.6117647, 1, 1,
0.1200601, 0.2545577, -0.7402135, 0, 0.6039216, 1, 1,
0.1221582, -0.4493342, 2.750234, 0, 0.5960785, 1, 1,
0.1222865, -0.003980421, 1.804596, 0, 0.5921569, 1, 1,
0.1226104, 0.07138202, 0.6180508, 0, 0.5843138, 1, 1,
0.1231683, 0.1214958, 0.8950001, 0, 0.5803922, 1, 1,
0.1237804, 1.660469, 1.836977, 0, 0.572549, 1, 1,
0.1239825, -1.049074, 3.465184, 0, 0.5686275, 1, 1,
0.1247935, -0.9947115, 2.705462, 0, 0.5607843, 1, 1,
0.13569, 0.5397256, -0.1560404, 0, 0.5568628, 1, 1,
0.1370797, -0.2436715, 2.369016, 0, 0.5490196, 1, 1,
0.1383891, -0.4614706, 3.785229, 0, 0.5450981, 1, 1,
0.1429255, 0.6176276, 2.041575, 0, 0.5372549, 1, 1,
0.1447055, 0.1513006, 0.6744667, 0, 0.5333334, 1, 1,
0.1538873, -0.1281534, 1.715898, 0, 0.5254902, 1, 1,
0.1563024, 0.8798908, 0.4782952, 0, 0.5215687, 1, 1,
0.1568365, -0.4440824, 4.202292, 0, 0.5137255, 1, 1,
0.1568895, -1.027143, 3.746841, 0, 0.509804, 1, 1,
0.1590919, 0.2172391, 0.4220482, 0, 0.5019608, 1, 1,
0.1650673, 0.005447263, 0.7576098, 0, 0.4941176, 1, 1,
0.1660521, 0.6698842, -1.358837, 0, 0.4901961, 1, 1,
0.1661491, -0.1824041, 4.019354, 0, 0.4823529, 1, 1,
0.1664048, -1.203342, 1.981686, 0, 0.4784314, 1, 1,
0.1674016, -0.2953246, 1.917329, 0, 0.4705882, 1, 1,
0.1729926, -0.7232876, 4.047176, 0, 0.4666667, 1, 1,
0.1763884, -0.2296005, 2.813771, 0, 0.4588235, 1, 1,
0.1773804, 1.920624, 0.0216566, 0, 0.454902, 1, 1,
0.1774509, 1.147325, -0.9864161, 0, 0.4470588, 1, 1,
0.1801836, 0.7813705, 1.173638, 0, 0.4431373, 1, 1,
0.1814171, 0.4129923, 0.7613521, 0, 0.4352941, 1, 1,
0.1842137, -0.7596105, 3.563102, 0, 0.4313726, 1, 1,
0.1844475, 0.3042735, 0.3297509, 0, 0.4235294, 1, 1,
0.1865012, -0.2127907, 2.422908, 0, 0.4196078, 1, 1,
0.1868124, 0.1172953, 0.6191011, 0, 0.4117647, 1, 1,
0.1941868, 1.466704, -1.004815, 0, 0.4078431, 1, 1,
0.1979063, 1.612851, 0.9113253, 0, 0.4, 1, 1,
0.1989222, -1.290874, 2.415784, 0, 0.3921569, 1, 1,
0.1995251, -1.041185, 0.9030639, 0, 0.3882353, 1, 1,
0.2010726, -1.126408, 1.645358, 0, 0.3803922, 1, 1,
0.2023166, -0.1821969, 2.408412, 0, 0.3764706, 1, 1,
0.2042336, 0.8093758, -1.585421, 0, 0.3686275, 1, 1,
0.2056962, -0.9522142, 2.759381, 0, 0.3647059, 1, 1,
0.2060204, 0.8921139, 1.328356, 0, 0.3568628, 1, 1,
0.2071981, 0.6702789, 0.9852415, 0, 0.3529412, 1, 1,
0.2088743, -1.382579, 4.186027, 0, 0.345098, 1, 1,
0.2120144, -0.9494461, 1.074328, 0, 0.3411765, 1, 1,
0.2120378, -0.3161152, 3.761402, 0, 0.3333333, 1, 1,
0.21227, -1.762626, 2.052094, 0, 0.3294118, 1, 1,
0.2132421, -0.1601817, 2.03995, 0, 0.3215686, 1, 1,
0.2159122, 1.333925, 0.4924724, 0, 0.3176471, 1, 1,
0.2193019, 1.423656, -2.088742, 0, 0.3098039, 1, 1,
0.2253943, -1.535793, 4.61184, 0, 0.3058824, 1, 1,
0.2256342, -2.082478, 4.06037, 0, 0.2980392, 1, 1,
0.2300796, 0.2763691, 0.1478542, 0, 0.2901961, 1, 1,
0.2308444, -0.1063656, 1.838501, 0, 0.2862745, 1, 1,
0.2315335, 0.0106317, 0.9298278, 0, 0.2784314, 1, 1,
0.2324669, 0.8615979, -0.9191393, 0, 0.2745098, 1, 1,
0.2351699, -0.3275933, 2.627223, 0, 0.2666667, 1, 1,
0.2376219, 1.068108, 0.6055152, 0, 0.2627451, 1, 1,
0.238497, 0.4606068, 0.6524215, 0, 0.254902, 1, 1,
0.2388421, 0.08003581, 1.675701, 0, 0.2509804, 1, 1,
0.2390247, -2.524344, 1.921849, 0, 0.2431373, 1, 1,
0.2435782, 0.6838626, -0.3041496, 0, 0.2392157, 1, 1,
0.246003, -0.5887664, 2.111366, 0, 0.2313726, 1, 1,
0.2509388, -1.389878, 3.524235, 0, 0.227451, 1, 1,
0.2519693, -0.04683397, 2.165117, 0, 0.2196078, 1, 1,
0.2528386, -0.721202, 3.464982, 0, 0.2156863, 1, 1,
0.2561833, 0.1977631, 2.529858, 0, 0.2078431, 1, 1,
0.2563534, -1.887603, 1.619253, 0, 0.2039216, 1, 1,
0.2567183, -0.5423361, 4.141865, 0, 0.1960784, 1, 1,
0.2570899, -0.997744, 1.952709, 0, 0.1882353, 1, 1,
0.2583741, -0.6244828, 0.9177395, 0, 0.1843137, 1, 1,
0.2613147, 2.040795, -0.376926, 0, 0.1764706, 1, 1,
0.2676291, -0.5569062, 3.473129, 0, 0.172549, 1, 1,
0.269895, -1.995212, 2.888788, 0, 0.1647059, 1, 1,
0.2719822, -0.124593, 2.233357, 0, 0.1607843, 1, 1,
0.2738965, -0.9328601, 1.487545, 0, 0.1529412, 1, 1,
0.2751692, -0.3583107, 3.851815, 0, 0.1490196, 1, 1,
0.2791356, 0.867658, -0.6554295, 0, 0.1411765, 1, 1,
0.2811559, -1.384017, 2.07334, 0, 0.1372549, 1, 1,
0.2951674, 0.1828483, 0.1795018, 0, 0.1294118, 1, 1,
0.3009022, 0.3116053, 1.643552, 0, 0.1254902, 1, 1,
0.3019768, 0.4008205, 2.705886, 0, 0.1176471, 1, 1,
0.3039004, 1.197406, 0.3054935, 0, 0.1137255, 1, 1,
0.3106845, -0.5594215, 1.259303, 0, 0.1058824, 1, 1,
0.3131792, -1.61989, 2.318208, 0, 0.09803922, 1, 1,
0.3170837, 0.1042719, 0.5842656, 0, 0.09411765, 1, 1,
0.3205781, 0.6026386, 0.4252715, 0, 0.08627451, 1, 1,
0.3290163, 1.175596, 0.3558843, 0, 0.08235294, 1, 1,
0.3332792, 0.4328786, 0.5695991, 0, 0.07450981, 1, 1,
0.3397669, -0.1911139, 0.8125941, 0, 0.07058824, 1, 1,
0.3450698, 0.4893772, 2.174092, 0, 0.0627451, 1, 1,
0.3468132, -0.8725898, 1.592387, 0, 0.05882353, 1, 1,
0.348628, -0.2761875, 2.331792, 0, 0.05098039, 1, 1,
0.3494643, -1.743538, 5.215077, 0, 0.04705882, 1, 1,
0.3504417, -0.2941321, 3.821422, 0, 0.03921569, 1, 1,
0.3523656, 0.683883, 0.3725654, 0, 0.03529412, 1, 1,
0.3523756, -0.7597102, 3.219747, 0, 0.02745098, 1, 1,
0.3525052, 0.5614293, 1.06529, 0, 0.02352941, 1, 1,
0.355351, 0.4615963, 0.006610147, 0, 0.01568628, 1, 1,
0.3592449, 0.364812, 0.8178679, 0, 0.01176471, 1, 1,
0.3604613, -0.4829478, 1.622056, 0, 0.003921569, 1, 1,
0.3612332, 0.00809025, 3.143878, 0.003921569, 0, 1, 1,
0.3633441, -0.7517214, 3.176939, 0.007843138, 0, 1, 1,
0.3684505, 0.4142609, -0.3221084, 0.01568628, 0, 1, 1,
0.3710195, -0.5536371, 3.342804, 0.01960784, 0, 1, 1,
0.3717462, 0.5668128, -0.9879192, 0.02745098, 0, 1, 1,
0.3717742, 1.42641, -0.4284829, 0.03137255, 0, 1, 1,
0.3819909, -2.105159, 4.101218, 0.03921569, 0, 1, 1,
0.382905, 0.4145203, 2.175698, 0.04313726, 0, 1, 1,
0.3840673, 0.7630042, -0.2938357, 0.05098039, 0, 1, 1,
0.3841429, 1.668911, -1.033424, 0.05490196, 0, 1, 1,
0.384405, 1.261338, -0.3491935, 0.0627451, 0, 1, 1,
0.38919, 1.279505, 0.9607159, 0.06666667, 0, 1, 1,
0.3893696, 0.3718072, 0.1971301, 0.07450981, 0, 1, 1,
0.390326, -1.127834, 5.122325, 0.07843138, 0, 1, 1,
0.3927928, 0.1329163, 1.316414, 0.08627451, 0, 1, 1,
0.3964607, -0.9595553, 3.51817, 0.09019608, 0, 1, 1,
0.397129, 1.535231, 0.1546577, 0.09803922, 0, 1, 1,
0.3992396, 0.8020593, 0.397517, 0.1058824, 0, 1, 1,
0.399329, 0.7387835, 1.441805, 0.1098039, 0, 1, 1,
0.4005181, 0.7573265, 1.909981, 0.1176471, 0, 1, 1,
0.4059026, 0.1172098, 0.683144, 0.1215686, 0, 1, 1,
0.4108302, -2.152959, 3.107245, 0.1294118, 0, 1, 1,
0.4121224, -0.539247, 2.057376, 0.1333333, 0, 1, 1,
0.4191858, 0.3216908, 1.36179, 0.1411765, 0, 1, 1,
0.4230957, 0.01624602, 1.337358, 0.145098, 0, 1, 1,
0.4245754, 2.325161, -0.7541517, 0.1529412, 0, 1, 1,
0.4256458, 0.4130611, 0.1486908, 0.1568628, 0, 1, 1,
0.4269736, -1.490168, 2.746243, 0.1647059, 0, 1, 1,
0.4322242, -0.8774511, 2.457325, 0.1686275, 0, 1, 1,
0.434833, 1.903337, 2.839146, 0.1764706, 0, 1, 1,
0.437247, 1.373133, -0.530518, 0.1803922, 0, 1, 1,
0.4376552, -1.117288, 4.292792, 0.1882353, 0, 1, 1,
0.4382859, -0.2851846, 3.452458, 0.1921569, 0, 1, 1,
0.4427575, -0.02427673, 1.245804, 0.2, 0, 1, 1,
0.4437187, 0.1649387, 1.475606, 0.2078431, 0, 1, 1,
0.4466626, 0.2325121, 0.6268701, 0.2117647, 0, 1, 1,
0.4472652, -1.095689, 2.490369, 0.2196078, 0, 1, 1,
0.4473975, -0.2686793, 3.7741, 0.2235294, 0, 1, 1,
0.4582101, 1.402312, 0.9446851, 0.2313726, 0, 1, 1,
0.4629547, 0.6943105, 2.199104, 0.2352941, 0, 1, 1,
0.4661033, 0.4794273, -0.6199854, 0.2431373, 0, 1, 1,
0.468115, -1.685491, 1.934822, 0.2470588, 0, 1, 1,
0.468215, 0.2315235, 1.35698, 0.254902, 0, 1, 1,
0.4698837, 0.4445591, 1.017753, 0.2588235, 0, 1, 1,
0.4741512, 1.261367, -1.104384, 0.2666667, 0, 1, 1,
0.4750772, -0.378381, 3.504908, 0.2705882, 0, 1, 1,
0.4823336, -0.154864, 1.925906, 0.2784314, 0, 1, 1,
0.4872828, 0.6319132, 0.05261844, 0.282353, 0, 1, 1,
0.4880514, -2.310797, 3.223847, 0.2901961, 0, 1, 1,
0.4959549, 0.5884931, 0.700137, 0.2941177, 0, 1, 1,
0.5053052, 0.2034494, 0.7482264, 0.3019608, 0, 1, 1,
0.5077829, -0.4892464, 1.396347, 0.3098039, 0, 1, 1,
0.508345, 0.2435458, -0.3450462, 0.3137255, 0, 1, 1,
0.5107491, 0.4883011, 0.6563076, 0.3215686, 0, 1, 1,
0.5118781, 0.09000854, 0.8232388, 0.3254902, 0, 1, 1,
0.5150055, -0.946013, 2.342191, 0.3333333, 0, 1, 1,
0.5151923, -0.6115596, 1.52004, 0.3372549, 0, 1, 1,
0.521137, -0.9326258, 2.098168, 0.345098, 0, 1, 1,
0.5237456, 0.530314, 0.6899021, 0.3490196, 0, 1, 1,
0.5247089, -0.4878393, 3.183974, 0.3568628, 0, 1, 1,
0.5255032, 0.1350593, 1.008385, 0.3607843, 0, 1, 1,
0.5281701, 2.420519, 0.816778, 0.3686275, 0, 1, 1,
0.5307544, -1.203788, 2.378251, 0.372549, 0, 1, 1,
0.5353506, 1.250283, 0.2598034, 0.3803922, 0, 1, 1,
0.5374649, -1.067216, 2.807463, 0.3843137, 0, 1, 1,
0.5376766, -1.470336, 3.270641, 0.3921569, 0, 1, 1,
0.5434771, 0.9579489, 0.5463707, 0.3960784, 0, 1, 1,
0.5505638, -1.067133, 3.054641, 0.4039216, 0, 1, 1,
0.5510395, -1.305911, 2.001343, 0.4117647, 0, 1, 1,
0.5524184, 0.640635, 0.4491256, 0.4156863, 0, 1, 1,
0.5533063, -0.4214519, 1.248144, 0.4235294, 0, 1, 1,
0.5546586, -0.4221175, 1.291453, 0.427451, 0, 1, 1,
0.5616115, 1.324114, 0.07419199, 0.4352941, 0, 1, 1,
0.5649844, 2.15037, -0.3178437, 0.4392157, 0, 1, 1,
0.5687121, -0.9103073, 4.416808, 0.4470588, 0, 1, 1,
0.5698273, 0.196279, 1.898313, 0.4509804, 0, 1, 1,
0.5730733, -1.109641, 1.767942, 0.4588235, 0, 1, 1,
0.5750123, 0.2845727, 1.352547, 0.4627451, 0, 1, 1,
0.5758098, -3.112358, 2.032577, 0.4705882, 0, 1, 1,
0.5849913, 0.2448222, 0.4908743, 0.4745098, 0, 1, 1,
0.5903981, 0.2077204, 0.5131233, 0.4823529, 0, 1, 1,
0.5913529, 1.908779, -1.220267, 0.4862745, 0, 1, 1,
0.59139, 1.792673, -0.1284014, 0.4941176, 0, 1, 1,
0.5919732, -2.729177, 1.611057, 0.5019608, 0, 1, 1,
0.5940516, 0.8320291, -0.2536411, 0.5058824, 0, 1, 1,
0.6002922, -1.98215, 3.915536, 0.5137255, 0, 1, 1,
0.6018794, 0.3100483, -0.3292522, 0.5176471, 0, 1, 1,
0.6048654, -0.3897767, 1.548327, 0.5254902, 0, 1, 1,
0.6056572, -0.1471358, 0.7162197, 0.5294118, 0, 1, 1,
0.6057105, -0.2797796, 1.882015, 0.5372549, 0, 1, 1,
0.6078778, 1.170882, -0.8269544, 0.5411765, 0, 1, 1,
0.6099691, 0.6973974, 0.7730044, 0.5490196, 0, 1, 1,
0.6140784, -0.7490208, 0.9154252, 0.5529412, 0, 1, 1,
0.6146835, 0.2022979, 0.7998959, 0.5607843, 0, 1, 1,
0.6157279, -2.080056, 3.613976, 0.5647059, 0, 1, 1,
0.6183886, -0.2349737, 2.387828, 0.572549, 0, 1, 1,
0.6198995, 1.60426, 0.4258918, 0.5764706, 0, 1, 1,
0.6221873, -0.2641434, 2.185236, 0.5843138, 0, 1, 1,
0.6223853, 0.558986, 0.4046495, 0.5882353, 0, 1, 1,
0.6239876, 0.9096903, -0.555894, 0.5960785, 0, 1, 1,
0.6325759, -2.322213, 3.425249, 0.6039216, 0, 1, 1,
0.6337459, -1.013984, 3.46737, 0.6078432, 0, 1, 1,
0.638099, 0.9711431, -0.1576232, 0.6156863, 0, 1, 1,
0.6388861, -1.992026, 3.260732, 0.6196079, 0, 1, 1,
0.6400439, -1.419488, 2.957503, 0.627451, 0, 1, 1,
0.6530684, -0.03525658, 1.520095, 0.6313726, 0, 1, 1,
0.6563027, 1.116651, -0.2789294, 0.6392157, 0, 1, 1,
0.6570356, 1.170192, 1.552722, 0.6431373, 0, 1, 1,
0.6588252, 1.294532, -0.9388938, 0.6509804, 0, 1, 1,
0.6594353, 2.757003, -0.9711573, 0.654902, 0, 1, 1,
0.664853, 0.3717546, 1.44683, 0.6627451, 0, 1, 1,
0.6709895, -0.4227901, 2.821203, 0.6666667, 0, 1, 1,
0.6715727, 1.232364, -0.088835, 0.6745098, 0, 1, 1,
0.6730629, 0.3516558, 1.286172, 0.6784314, 0, 1, 1,
0.6798618, 1.319588, 2.896996, 0.6862745, 0, 1, 1,
0.6811309, 0.4488029, 0.005935388, 0.6901961, 0, 1, 1,
0.6835575, 2.329202, -0.6799092, 0.6980392, 0, 1, 1,
0.6899244, 1.086685, 0.8653952, 0.7058824, 0, 1, 1,
0.6929358, -0.1961694, 0.5173272, 0.7098039, 0, 1, 1,
0.6959205, 0.6275832, 1.903272, 0.7176471, 0, 1, 1,
0.7083061, 1.349097, 0.478918, 0.7215686, 0, 1, 1,
0.7174613, -0.4554717, 1.776086, 0.7294118, 0, 1, 1,
0.7182236, -0.5057381, 2.868602, 0.7333333, 0, 1, 1,
0.7315378, 0.4857833, 0.254498, 0.7411765, 0, 1, 1,
0.7329093, -2.413247, 3.737487, 0.7450981, 0, 1, 1,
0.7384899, 1.266337, -0.799193, 0.7529412, 0, 1, 1,
0.7398795, -2.405667, 2.943937, 0.7568628, 0, 1, 1,
0.7432315, -0.9975742, 2.124861, 0.7647059, 0, 1, 1,
0.7442236, -0.1573009, 3.349927, 0.7686275, 0, 1, 1,
0.747564, 0.9418958, 0.1584637, 0.7764706, 0, 1, 1,
0.7523, -0.5023094, 4.38811, 0.7803922, 0, 1, 1,
0.7552021, 2.226183, 0.09743152, 0.7882353, 0, 1, 1,
0.762589, -1.151317, 3.015343, 0.7921569, 0, 1, 1,
0.7632259, 0.791551, 0.7106097, 0.8, 0, 1, 1,
0.7731532, -0.9556414, 3.348995, 0.8078431, 0, 1, 1,
0.7785668, -0.1252834, 1.850919, 0.8117647, 0, 1, 1,
0.7804756, -0.2787395, 0.7505469, 0.8196079, 0, 1, 1,
0.7824564, 0.5531013, -0.7121559, 0.8235294, 0, 1, 1,
0.7826191, 0.306034, 1.433861, 0.8313726, 0, 1, 1,
0.7850689, 0.4233689, 1.437331, 0.8352941, 0, 1, 1,
0.7851164, -2.206406, 3.619542, 0.8431373, 0, 1, 1,
0.7905506, 0.2393441, 0.5444897, 0.8470588, 0, 1, 1,
0.790986, 0.8434053, -0.8945068, 0.854902, 0, 1, 1,
0.7910826, 0.4785627, 1.865597, 0.8588235, 0, 1, 1,
0.7922651, 0.2374349, 1.533102, 0.8666667, 0, 1, 1,
0.7945102, 1.343598, 0.3013366, 0.8705882, 0, 1, 1,
0.8031612, -0.4672943, 2.457587, 0.8784314, 0, 1, 1,
0.8080575, 0.07464863, 0.4222786, 0.8823529, 0, 1, 1,
0.812618, 0.2683426, 1.406241, 0.8901961, 0, 1, 1,
0.8165241, 0.4068534, 0.7456785, 0.8941177, 0, 1, 1,
0.8188451, 0.6789625, 2.320033, 0.9019608, 0, 1, 1,
0.8220934, -0.3215498, 1.500473, 0.9098039, 0, 1, 1,
0.8629042, -1.131004, 3.445593, 0.9137255, 0, 1, 1,
0.8665624, -0.5997236, 3.387855, 0.9215686, 0, 1, 1,
0.8667499, 0.4952851, 1.759262, 0.9254902, 0, 1, 1,
0.8753337, 1.344443, 1.423634, 0.9333333, 0, 1, 1,
0.8762516, -0.04096634, -0.3551867, 0.9372549, 0, 1, 1,
0.8832842, -1.125013, 3.446231, 0.945098, 0, 1, 1,
0.8835243, -2.03199, 1.202548, 0.9490196, 0, 1, 1,
0.8849119, -1.037723, 3.256715, 0.9568627, 0, 1, 1,
0.8912893, -2.60656, 2.748785, 0.9607843, 0, 1, 1,
0.8956221, -0.7929862, 2.402734, 0.9686275, 0, 1, 1,
0.8970898, -0.1196668, 1.01767, 0.972549, 0, 1, 1,
0.8984715, 1.520239, -1.899034, 0.9803922, 0, 1, 1,
0.8993323, 0.4972879, 2.114709, 0.9843137, 0, 1, 1,
0.9011265, -1.476007, 3.774298, 0.9921569, 0, 1, 1,
0.9015679, -0.03606573, 3.243388, 0.9960784, 0, 1, 1,
0.9075048, 1.30051, 0.1811771, 1, 0, 0.9960784, 1,
0.9096828, 0.8452722, 0.4937973, 1, 0, 0.9882353, 1,
0.9156242, -1.140477, 1.364425, 1, 0, 0.9843137, 1,
0.9221882, -0.08483302, -0.08007677, 1, 0, 0.9764706, 1,
0.9252513, 1.451945, 0.445894, 1, 0, 0.972549, 1,
0.9260763, -1.077034, 2.955376, 1, 0, 0.9647059, 1,
0.9283356, -0.01326751, 1.978341, 1, 0, 0.9607843, 1,
0.9324223, 0.7818226, 0.966051, 1, 0, 0.9529412, 1,
0.9377528, 0.2650308, 2.224262, 1, 0, 0.9490196, 1,
0.9502532, -1.645089, 1.869054, 1, 0, 0.9411765, 1,
0.955478, 0.02016384, 1.241519, 1, 0, 0.9372549, 1,
0.9565515, -0.3186588, 1.872433, 1, 0, 0.9294118, 1,
0.967582, 0.8269055, 1.389375, 1, 0, 0.9254902, 1,
0.9759489, 1.611876, 1.234697, 1, 0, 0.9176471, 1,
0.9767, -0.5530181, 0.5687575, 1, 0, 0.9137255, 1,
0.9797219, 0.01659223, -0.6415619, 1, 0, 0.9058824, 1,
0.9801868, 0.1962678, 1.273456, 1, 0, 0.9019608, 1,
0.9807352, -0.309878, 0.9477915, 1, 0, 0.8941177, 1,
0.984254, -0.4469322, -1.169061, 1, 0, 0.8862745, 1,
0.9864263, 1.022328, -0.2819071, 1, 0, 0.8823529, 1,
0.9905574, -0.1206045, 1.602335, 1, 0, 0.8745098, 1,
0.9924217, -0.6553944, 4.195562, 1, 0, 0.8705882, 1,
0.9960276, -0.06685828, 3.761086, 1, 0, 0.8627451, 1,
0.9963323, -0.2237032, 0.8268954, 1, 0, 0.8588235, 1,
1.002312, -0.6046143, 3.476538, 1, 0, 0.8509804, 1,
1.021487, -2.206096, 2.067815, 1, 0, 0.8470588, 1,
1.025363, 0.7695082, 0.6974228, 1, 0, 0.8392157, 1,
1.026824, 0.9120049, 0.7096629, 1, 0, 0.8352941, 1,
1.027279, -0.6200839, 0.1009251, 1, 0, 0.827451, 1,
1.032108, 0.6295986, 1.263075, 1, 0, 0.8235294, 1,
1.033641, -0.3636424, 1.641596, 1, 0, 0.8156863, 1,
1.053966, 0.5630503, -0.895168, 1, 0, 0.8117647, 1,
1.05776, 1.130652, -0.3640774, 1, 0, 0.8039216, 1,
1.06072, 0.107663, 1.144829, 1, 0, 0.7960784, 1,
1.062416, -0.2551035, 1.662538, 1, 0, 0.7921569, 1,
1.073294, 0.9500038, 0.7436171, 1, 0, 0.7843137, 1,
1.074975, 1.322388, 0.5885708, 1, 0, 0.7803922, 1,
1.079766, 0.5629855, 1.644416, 1, 0, 0.772549, 1,
1.084152, -0.8327367, 1.490613, 1, 0, 0.7686275, 1,
1.099816, 0.00825202, 2.463087, 1, 0, 0.7607843, 1,
1.103297, -0.7591516, 2.696048, 1, 0, 0.7568628, 1,
1.105977, 0.1404583, 2.326024, 1, 0, 0.7490196, 1,
1.106323, -1.805943, 1.71867, 1, 0, 0.7450981, 1,
1.110358, 0.02063061, 1.435272, 1, 0, 0.7372549, 1,
1.112256, -0.4228064, 3.830418, 1, 0, 0.7333333, 1,
1.127181, -1.159662, 3.990416, 1, 0, 0.7254902, 1,
1.13039, 1.198536, -1.540944, 1, 0, 0.7215686, 1,
1.133936, -0.5200111, 1.773536, 1, 0, 0.7137255, 1,
1.13613, -1.651716, 1.978262, 1, 0, 0.7098039, 1,
1.145727, 1.617469, 0.881092, 1, 0, 0.7019608, 1,
1.150607, -1.005678, 2.947744, 1, 0, 0.6941177, 1,
1.154392, -0.6136817, 3.00175, 1, 0, 0.6901961, 1,
1.171674, -0.7042052, 1.868685, 1, 0, 0.682353, 1,
1.172941, -1.277623, 2.615591, 1, 0, 0.6784314, 1,
1.176216, 1.277984, 1.009911, 1, 0, 0.6705883, 1,
1.183791, 0.5139443, 1.030748, 1, 0, 0.6666667, 1,
1.191946, 0.8180805, 1.778829, 1, 0, 0.6588235, 1,
1.195798, -0.03824912, 0.5055308, 1, 0, 0.654902, 1,
1.201056, 0.7484451, -0.3388887, 1, 0, 0.6470588, 1,
1.206993, 0.3308579, 0.9607366, 1, 0, 0.6431373, 1,
1.20732, 1.460835, -0.2543062, 1, 0, 0.6352941, 1,
1.209963, -0.02347186, -0.2416005, 1, 0, 0.6313726, 1,
1.214781, 0.7095816, 2.139935, 1, 0, 0.6235294, 1,
1.230615, 0.0141894, 3.019925, 1, 0, 0.6196079, 1,
1.24433, -0.1429786, 1.020453, 1, 0, 0.6117647, 1,
1.248401, 1.454877, -0.102477, 1, 0, 0.6078432, 1,
1.248886, 1.108554, 0.2809514, 1, 0, 0.6, 1,
1.250265, 0.09032919, 1.209474, 1, 0, 0.5921569, 1,
1.250916, -0.4214275, 2.054043, 1, 0, 0.5882353, 1,
1.262588, 0.6203881, 1.672313, 1, 0, 0.5803922, 1,
1.272465, 0.1486076, 1.85768, 1, 0, 0.5764706, 1,
1.278115, 0.7523559, 1.474036, 1, 0, 0.5686275, 1,
1.280829, -0.02259985, 2.391546, 1, 0, 0.5647059, 1,
1.292531, -1.044935, 2.874188, 1, 0, 0.5568628, 1,
1.295322, -0.8723844, 2.680464, 1, 0, 0.5529412, 1,
1.304634, -0.6406418, 1.979105, 1, 0, 0.5450981, 1,
1.308697, 1.350861, 0.2776326, 1, 0, 0.5411765, 1,
1.331259, 0.9866661, 1.399843, 1, 0, 0.5333334, 1,
1.338058, -0.2042132, 1.66028, 1, 0, 0.5294118, 1,
1.345612, -1.348851, 3.202724, 1, 0, 0.5215687, 1,
1.35228, 0.1090417, 1.128972, 1, 0, 0.5176471, 1,
1.361268, -0.1612894, 2.330341, 1, 0, 0.509804, 1,
1.372631, 0.07391557, 1.606585, 1, 0, 0.5058824, 1,
1.396837, -1.513084, 3.23671, 1, 0, 0.4980392, 1,
1.406939, 0.6756292, 1.886308, 1, 0, 0.4901961, 1,
1.407853, 0.2061948, -0.2475715, 1, 0, 0.4862745, 1,
1.408101, -0.02941236, -0.9216695, 1, 0, 0.4784314, 1,
1.413503, 3.054179, 0.2403675, 1, 0, 0.4745098, 1,
1.421247, -1.079687, 3.63647, 1, 0, 0.4666667, 1,
1.425187, 2.326436, 1.794778, 1, 0, 0.4627451, 1,
1.425395, -0.2376925, 2.670733, 1, 0, 0.454902, 1,
1.436701, 1.218781, 1.265167, 1, 0, 0.4509804, 1,
1.443419, -1.099631, 2.348598, 1, 0, 0.4431373, 1,
1.445362, 0.7082515, 0.4660565, 1, 0, 0.4392157, 1,
1.445898, 0.7119989, 1.588204, 1, 0, 0.4313726, 1,
1.457044, -1.974887, -0.287406, 1, 0, 0.427451, 1,
1.464198, -0.9209966, 3.294697, 1, 0, 0.4196078, 1,
1.477883, 0.04818569, 0.7737321, 1, 0, 0.4156863, 1,
1.481551, 0.8291823, 1.607466, 1, 0, 0.4078431, 1,
1.486467, -1.256758, 2.252356, 1, 0, 0.4039216, 1,
1.505492, 0.2975317, 0.8253672, 1, 0, 0.3960784, 1,
1.510126, -0.8683217, 2.598655, 1, 0, 0.3882353, 1,
1.51801, 0.4796244, 2.233458, 1, 0, 0.3843137, 1,
1.533311, 0.4793322, 2.910084, 1, 0, 0.3764706, 1,
1.535551, 1.906502, 2.027066, 1, 0, 0.372549, 1,
1.536792, 0.4679953, 1.571695, 1, 0, 0.3647059, 1,
1.537011, -0.7781478, 1.703155, 1, 0, 0.3607843, 1,
1.547612, 0.3311302, 1.170445, 1, 0, 0.3529412, 1,
1.554708, -0.3610645, 2.016264, 1, 0, 0.3490196, 1,
1.558938, 0.5917176, 2.243279, 1, 0, 0.3411765, 1,
1.564316, 0.2934909, 1.631198, 1, 0, 0.3372549, 1,
1.582672, 0.5074478, 1.657172, 1, 0, 0.3294118, 1,
1.583151, -1.081407, 2.143785, 1, 0, 0.3254902, 1,
1.591802, 0.1918395, 2.123455, 1, 0, 0.3176471, 1,
1.638376, 1.058276, 1.276578, 1, 0, 0.3137255, 1,
1.643323, 0.06058935, 3.185564, 1, 0, 0.3058824, 1,
1.652523, 0.2004198, 1.919864, 1, 0, 0.2980392, 1,
1.678812, -1.266043, 3.288433, 1, 0, 0.2941177, 1,
1.694004, -0.8836338, 2.013054, 1, 0, 0.2862745, 1,
1.6993, 0.5790693, 2.782402, 1, 0, 0.282353, 1,
1.70058, 0.3350167, 0.05686555, 1, 0, 0.2745098, 1,
1.707596, -0.2652608, 2.932935, 1, 0, 0.2705882, 1,
1.70885, 1.210417, -0.3415249, 1, 0, 0.2627451, 1,
1.741205, 1.011713, -1.068792, 1, 0, 0.2588235, 1,
1.759325, 0.5571643, 1.037927, 1, 0, 0.2509804, 1,
1.793139, 0.9485999, 0.1062509, 1, 0, 0.2470588, 1,
1.799344, -1.036186, 2.228615, 1, 0, 0.2392157, 1,
1.801553, -0.006922235, 1.28447, 1, 0, 0.2352941, 1,
1.80949, -0.3046926, 2.577805, 1, 0, 0.227451, 1,
1.884805, 1.175326, 0.7537954, 1, 0, 0.2235294, 1,
1.896161, -1.387293, 1.522827, 1, 0, 0.2156863, 1,
1.896952, 0.9235345, 1.045118, 1, 0, 0.2117647, 1,
1.899454, -0.6161346, 2.123432, 1, 0, 0.2039216, 1,
1.922801, -1.331804, 2.692522, 1, 0, 0.1960784, 1,
1.928328, -0.00414756, 0.07086156, 1, 0, 0.1921569, 1,
1.944399, 0.1253506, 2.149764, 1, 0, 0.1843137, 1,
1.976338, 0.5132156, 2.805573, 1, 0, 0.1803922, 1,
1.978255, 0.2026724, -0.2793732, 1, 0, 0.172549, 1,
1.987224, 0.4966695, 1.102985, 1, 0, 0.1686275, 1,
2.009088, -1.298287, 2.131273, 1, 0, 0.1607843, 1,
2.01928, 0.1416143, 2.506154, 1, 0, 0.1568628, 1,
2.047521, 0.1346564, 1.023287, 1, 0, 0.1490196, 1,
2.06032, -0.841677, 2.930576, 1, 0, 0.145098, 1,
2.069301, -0.7195795, 1.450507, 1, 0, 0.1372549, 1,
2.084618, -0.2808726, 3.054422, 1, 0, 0.1333333, 1,
2.116415, 0.3620017, 1.36892, 1, 0, 0.1254902, 1,
2.147509, -0.09412938, -0.1464531, 1, 0, 0.1215686, 1,
2.170039, 0.3321386, 2.859556, 1, 0, 0.1137255, 1,
2.193622, 0.1986129, 0.4462011, 1, 0, 0.1098039, 1,
2.226373, 0.7592222, -0.2354625, 1, 0, 0.1019608, 1,
2.258507, -1.237159, 1.15171, 1, 0, 0.09411765, 1,
2.26686, -1.296328, 3.085259, 1, 0, 0.09019608, 1,
2.303073, -2.372267, 2.649565, 1, 0, 0.08235294, 1,
2.338273, 0.2648876, 1.717625, 1, 0, 0.07843138, 1,
2.361719, 0.3799071, 0.9511973, 1, 0, 0.07058824, 1,
2.385521, -0.03288542, 1.58987, 1, 0, 0.06666667, 1,
2.392246, 0.6749856, 0.7247432, 1, 0, 0.05882353, 1,
2.43207, 0.341054, 1.785679, 1, 0, 0.05490196, 1,
2.467311, 2.367472, 0.3778054, 1, 0, 0.04705882, 1,
2.498924, 0.2075978, 1.616043, 1, 0, 0.04313726, 1,
2.52848, 1.875961, 1.651231, 1, 0, 0.03529412, 1,
2.536941, 0.1032089, 0.1934048, 1, 0, 0.03137255, 1,
2.661638, 1.493737, -0.5662362, 1, 0, 0.02352941, 1,
2.751414, -0.5579516, 1.133163, 1, 0, 0.01960784, 1,
2.781086, 1.271834, 2.763057, 1, 0, 0.01176471, 1,
3.244606, -0.7301048, 2.104136, 1, 0, 0.007843138, 1
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
0.06323469, -4.157586, -7.802255, 0, -0.5, 0.5, 0.5,
0.06323469, -4.157586, -7.802255, 1, -0.5, 0.5, 0.5,
0.06323469, -4.157586, -7.802255, 1, 1.5, 0.5, 0.5,
0.06323469, -4.157586, -7.802255, 0, 1.5, 0.5, 0.5
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
-4.196622, -0.02908945, -7.802255, 0, -0.5, 0.5, 0.5,
-4.196622, -0.02908945, -7.802255, 1, -0.5, 0.5, 0.5,
-4.196622, -0.02908945, -7.802255, 1, 1.5, 0.5, 0.5,
-4.196622, -0.02908945, -7.802255, 0, 1.5, 0.5, 0.5
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
-4.196622, -4.157586, -0.3502636, 0, -0.5, 0.5, 0.5,
-4.196622, -4.157586, -0.3502636, 1, -0.5, 0.5, 0.5,
-4.196622, -4.157586, -0.3502636, 1, 1.5, 0.5, 0.5,
-4.196622, -4.157586, -0.3502636, 0, 1.5, 0.5, 0.5
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
-3, -3.204856, -6.082564,
3, -3.204856, -6.082564,
-3, -3.204856, -6.082564,
-3, -3.363645, -6.369179,
-2, -3.204856, -6.082564,
-2, -3.363645, -6.369179,
-1, -3.204856, -6.082564,
-1, -3.363645, -6.369179,
0, -3.204856, -6.082564,
0, -3.363645, -6.369179,
1, -3.204856, -6.082564,
1, -3.363645, -6.369179,
2, -3.204856, -6.082564,
2, -3.363645, -6.369179,
3, -3.204856, -6.082564,
3, -3.363645, -6.369179
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
-3, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
-3, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
-3, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
-3, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
-2, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
-2, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
-2, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
-2, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
-1, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
-1, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
-1, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
-1, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
0, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
0, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
0, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
0, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
1, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
1, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
1, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
1, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
2, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
2, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
2, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
2, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5,
3, -3.681221, -6.94241, 0, -0.5, 0.5, 0.5,
3, -3.681221, -6.94241, 1, -0.5, 0.5, 0.5,
3, -3.681221, -6.94241, 1, 1.5, 0.5, 0.5,
3, -3.681221, -6.94241, 0, 1.5, 0.5, 0.5
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
-3.213578, -3, -6.082564,
-3.213578, 3, -6.082564,
-3.213578, -3, -6.082564,
-3.377419, -3, -6.369179,
-3.213578, -2, -6.082564,
-3.377419, -2, -6.369179,
-3.213578, -1, -6.082564,
-3.377419, -1, -6.369179,
-3.213578, 0, -6.082564,
-3.377419, 0, -6.369179,
-3.213578, 1, -6.082564,
-3.377419, 1, -6.369179,
-3.213578, 2, -6.082564,
-3.377419, 2, -6.369179,
-3.213578, 3, -6.082564,
-3.377419, 3, -6.369179
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
-3.7051, -3, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, -3, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, -3, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, -3, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, -2, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, -2, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, -2, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, -2, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, -1, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, -1, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, -1, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, -1, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, 0, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, 0, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, 0, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, 0, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, 1, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, 1, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, 1, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, 1, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, 2, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, 2, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, 2, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, 2, -6.94241, 0, 1.5, 0.5, 0.5,
-3.7051, 3, -6.94241, 0, -0.5, 0.5, 0.5,
-3.7051, 3, -6.94241, 1, -0.5, 0.5, 0.5,
-3.7051, 3, -6.94241, 1, 1.5, 0.5, 0.5,
-3.7051, 3, -6.94241, 0, 1.5, 0.5, 0.5
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
-3.213578, -3.204856, -4,
-3.213578, -3.204856, 4,
-3.213578, -3.204856, -4,
-3.377419, -3.363645, -4,
-3.213578, -3.204856, -2,
-3.377419, -3.363645, -2,
-3.213578, -3.204856, 0,
-3.377419, -3.363645, 0,
-3.213578, -3.204856, 2,
-3.377419, -3.363645, 2,
-3.213578, -3.204856, 4,
-3.377419, -3.363645, 4
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
-3.7051, -3.681221, -4, 0, -0.5, 0.5, 0.5,
-3.7051, -3.681221, -4, 1, -0.5, 0.5, 0.5,
-3.7051, -3.681221, -4, 1, 1.5, 0.5, 0.5,
-3.7051, -3.681221, -4, 0, 1.5, 0.5, 0.5,
-3.7051, -3.681221, -2, 0, -0.5, 0.5, 0.5,
-3.7051, -3.681221, -2, 1, -0.5, 0.5, 0.5,
-3.7051, -3.681221, -2, 1, 1.5, 0.5, 0.5,
-3.7051, -3.681221, -2, 0, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 0, 0, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 0, 1, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 0, 1, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 0, 0, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 2, 0, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 2, 1, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 2, 1, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 2, 0, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 4, 0, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 4, 1, -0.5, 0.5, 0.5,
-3.7051, -3.681221, 4, 1, 1.5, 0.5, 0.5,
-3.7051, -3.681221, 4, 0, 1.5, 0.5, 0.5
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
-3.213578, -3.204856, -6.082564,
-3.213578, 3.146677, -6.082564,
-3.213578, -3.204856, 5.382037,
-3.213578, 3.146677, 5.382037,
-3.213578, -3.204856, -6.082564,
-3.213578, -3.204856, 5.382037,
-3.213578, 3.146677, -6.082564,
-3.213578, 3.146677, 5.382037,
-3.213578, -3.204856, -6.082564,
3.340048, -3.204856, -6.082564,
-3.213578, -3.204856, 5.382037,
3.340048, -3.204856, 5.382037,
-3.213578, 3.146677, -6.082564,
3.340048, 3.146677, -6.082564,
-3.213578, 3.146677, 5.382037,
3.340048, 3.146677, 5.382037,
3.340048, -3.204856, -6.082564,
3.340048, 3.146677, -6.082564,
3.340048, -3.204856, 5.382037,
3.340048, 3.146677, 5.382037,
3.340048, -3.204856, -6.082564,
3.340048, -3.204856, 5.382037,
3.340048, 3.146677, -6.082564,
3.340048, 3.146677, 5.382037
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
var radius = 7.824758;
var distance = 34.81323;
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
mvMatrix.translate( -0.06323469, 0.02908945, 0.3502636 );
mvMatrix.scale( 1.290931, 1.332006, 0.7379481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.81323);
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
7-(2-chlorophenyl)-4<-read.table("7-(2-chlorophenyl)-4.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-7-(2-chlorophenyl)-4$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
```

```r
y<-7-(2-chlorophenyl)-4$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
```

```r
z<-7-(2-chlorophenyl)-4$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorophenyl' not found
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
-3.118137, 1.935086, -2.759296, 0, 0, 1, 1, 1,
-2.933179, -0.2739814, -3.153049, 1, 0, 0, 1, 1,
-2.80661, 0.4430248, -0.8760768, 1, 0, 0, 1, 1,
-2.779274, 1.200886, -0.7833952, 1, 0, 0, 1, 1,
-2.670424, 1.144247, -0.9611127, 1, 0, 0, 1, 1,
-2.532775, -0.927471, -1.907052, 1, 0, 0, 1, 1,
-2.509303, -0.6717304, -1.588992, 0, 0, 0, 1, 1,
-2.384586, 1.092556, 1.351681, 0, 0, 0, 1, 1,
-2.377193, 0.2932244, -0.7663451, 0, 0, 0, 1, 1,
-2.354106, 0.503347, -2.075512, 0, 0, 0, 1, 1,
-2.341135, 0.4052338, -0.197511, 0, 0, 0, 1, 1,
-2.314507, 0.5247871, -0.7008476, 0, 0, 0, 1, 1,
-2.299848, -1.509391, -2.561093, 0, 0, 0, 1, 1,
-2.280145, 0.9154344, 0.2796982, 1, 1, 1, 1, 1,
-2.277177, -0.7127979, -1.44037, 1, 1, 1, 1, 1,
-2.256643, -0.07468786, -1.814101, 1, 1, 1, 1, 1,
-2.223202, -0.6198012, -2.343939, 1, 1, 1, 1, 1,
-2.218099, 0.568195, -1.700987, 1, 1, 1, 1, 1,
-2.211896, 0.1801132, -1.185903, 1, 1, 1, 1, 1,
-2.203842, 0.3095127, -2.55899, 1, 1, 1, 1, 1,
-2.111857, 0.4262219, -0.1202869, 1, 1, 1, 1, 1,
-2.082418, 0.8948059, -0.9878048, 1, 1, 1, 1, 1,
-2.045871, -1.228266, -2.633427, 1, 1, 1, 1, 1,
-2.022388, 0.3754614, -2.290862, 1, 1, 1, 1, 1,
-2.013384, 0.2000641, -0.8968316, 1, 1, 1, 1, 1,
-2.009795, 0.6209528, -0.5527257, 1, 1, 1, 1, 1,
-1.990296, 0.1961559, -1.600555, 1, 1, 1, 1, 1,
-1.980217, 0.650978, 1.938406, 1, 1, 1, 1, 1,
-1.949053, -0.2596593, -1.4817, 0, 0, 1, 1, 1,
-1.943887, 0.4104834, -2.311147, 1, 0, 0, 1, 1,
-1.939467, -0.6155155, -3.75787, 1, 0, 0, 1, 1,
-1.920213, -0.5272682, -1.60258, 1, 0, 0, 1, 1,
-1.860853, 1.492106, -1.587538, 1, 0, 0, 1, 1,
-1.850237, -2.017468, -4.75692, 1, 0, 0, 1, 1,
-1.847723, 1.684545, -2.720649, 0, 0, 0, 1, 1,
-1.807038, -0.1162785, -1.518799, 0, 0, 0, 1, 1,
-1.768308, 0.05621327, -2.1636, 0, 0, 0, 1, 1,
-1.760856, 1.405946, -2.351586, 0, 0, 0, 1, 1,
-1.758844, 2.223858, -0.3145921, 0, 0, 0, 1, 1,
-1.742765, 0.3079033, -2.866353, 0, 0, 0, 1, 1,
-1.734369, 1.735834, 0.7835804, 0, 0, 0, 1, 1,
-1.731049, -0.531478, -2.719182, 1, 1, 1, 1, 1,
-1.724629, 0.5972753, -2.038331, 1, 1, 1, 1, 1,
-1.688332, -1.482015, -3.081416, 1, 1, 1, 1, 1,
-1.687707, -0.5243898, -0.9128379, 1, 1, 1, 1, 1,
-1.664134, 1.59534, 0.6614112, 1, 1, 1, 1, 1,
-1.663401, 0.1756702, -0.9867774, 1, 1, 1, 1, 1,
-1.643676, 0.8470469, -1.529619, 1, 1, 1, 1, 1,
-1.642393, 0.6060936, -1.548865, 1, 1, 1, 1, 1,
-1.63116, -0.9683005, -0.4751978, 1, 1, 1, 1, 1,
-1.630698, 1.478528, -2.247384, 1, 1, 1, 1, 1,
-1.626824, -0.6319493, -1.735804, 1, 1, 1, 1, 1,
-1.626652, -0.6680898, -3.938059, 1, 1, 1, 1, 1,
-1.616988, 0.7703424, 0.6444357, 1, 1, 1, 1, 1,
-1.607221, -1.489153, -2.421394, 1, 1, 1, 1, 1,
-1.605509, 1.845639, -2.504514, 1, 1, 1, 1, 1,
-1.574955, -0.4624951, -0.7532174, 0, 0, 1, 1, 1,
-1.566321, 0.167393, -2.312333, 1, 0, 0, 1, 1,
-1.566015, -1.002986, -1.437357, 1, 0, 0, 1, 1,
-1.564927, 1.014816, -2.086927, 1, 0, 0, 1, 1,
-1.555341, 0.8791463, -0.4183672, 1, 0, 0, 1, 1,
-1.554396, -0.3567995, -1.914635, 1, 0, 0, 1, 1,
-1.546311, -0.8607879, -2.460968, 0, 0, 0, 1, 1,
-1.533214, 0.8109665, -1.375787, 0, 0, 0, 1, 1,
-1.526039, 0.7978762, -0.8599504, 0, 0, 0, 1, 1,
-1.525479, -1.166273, -1.917406, 0, 0, 0, 1, 1,
-1.515195, -0.9038098, -0.5628522, 0, 0, 0, 1, 1,
-1.511754, -0.8261679, -3.129685, 0, 0, 0, 1, 1,
-1.507722, -0.3933773, -1.341065, 0, 0, 0, 1, 1,
-1.49191, -1.761676, -2.227437, 1, 1, 1, 1, 1,
-1.487181, 0.3999527, -0.3014715, 1, 1, 1, 1, 1,
-1.484367, -0.5021981, -1.787615, 1, 1, 1, 1, 1,
-1.470658, -0.4769236, -0.3476648, 1, 1, 1, 1, 1,
-1.46691, -1.00763, -2.623532, 1, 1, 1, 1, 1,
-1.455939, 0.1141324, -1.01652, 1, 1, 1, 1, 1,
-1.448972, 1.259186, -1.788268, 1, 1, 1, 1, 1,
-1.440218, -0.5739014, -2.770052, 1, 1, 1, 1, 1,
-1.431198, -0.0199765, -1.554585, 1, 1, 1, 1, 1,
-1.425924, -0.1180645, -2.132434, 1, 1, 1, 1, 1,
-1.406384, 0.4420631, -2.143701, 1, 1, 1, 1, 1,
-1.404911, -1.725662, -3.398335, 1, 1, 1, 1, 1,
-1.393296, 1.741033, -1.666449, 1, 1, 1, 1, 1,
-1.387724, 0.4388192, -0.949106, 1, 1, 1, 1, 1,
-1.384394, -0.482838, -0.3582652, 1, 1, 1, 1, 1,
-1.381315, 0.6448002, 1.618067, 0, 0, 1, 1, 1,
-1.372204, -0.102434, -1.289297, 1, 0, 0, 1, 1,
-1.370241, -0.3793181, -0.401202, 1, 0, 0, 1, 1,
-1.361368, -0.461863, -2.719311, 1, 0, 0, 1, 1,
-1.35021, 0.09328299, -2.133111, 1, 0, 0, 1, 1,
-1.346606, 0.1328796, -2.052464, 1, 0, 0, 1, 1,
-1.346444, 1.217744, -0.02940985, 0, 0, 0, 1, 1,
-1.342909, -0.8819556, -2.266861, 0, 0, 0, 1, 1,
-1.341396, -0.3512373, -2.787002, 0, 0, 0, 1, 1,
-1.339579, -0.09232064, -1.99081, 0, 0, 0, 1, 1,
-1.337778, -0.8367876, -4.296762, 0, 0, 0, 1, 1,
-1.336721, -0.7239757, -1.160221, 0, 0, 0, 1, 1,
-1.326126, -0.6185967, -2.107941, 0, 0, 0, 1, 1,
-1.32522, -0.9424539, 0.6252524, 1, 1, 1, 1, 1,
-1.323044, -0.1829946, -2.423407, 1, 1, 1, 1, 1,
-1.322161, -0.8426459, -2.195832, 1, 1, 1, 1, 1,
-1.311803, 0.08417758, -1.013862, 1, 1, 1, 1, 1,
-1.311172, 0.887149, -0.5638908, 1, 1, 1, 1, 1,
-1.310191, 0.8694935, -0.5503009, 1, 1, 1, 1, 1,
-1.292773, -0.007859846, -1.300957, 1, 1, 1, 1, 1,
-1.290565, 0.555087, -2.60019, 1, 1, 1, 1, 1,
-1.287504, 2.217734, -0.1046163, 1, 1, 1, 1, 1,
-1.284754, 0.4927917, -1.764403, 1, 1, 1, 1, 1,
-1.283756, 0.07574169, 0.5025806, 1, 1, 1, 1, 1,
-1.276183, -1.988459, -2.236291, 1, 1, 1, 1, 1,
-1.254397, -0.433042, -2.706992, 1, 1, 1, 1, 1,
-1.23919, 0.3170464, 0.325406, 1, 1, 1, 1, 1,
-1.237331, 0.03824589, -2.260461, 1, 1, 1, 1, 1,
-1.233945, 0.4481133, -0.4240903, 0, 0, 1, 1, 1,
-1.224699, -1.85105, -2.071331, 1, 0, 0, 1, 1,
-1.211766, -0.7131218, -2.544284, 1, 0, 0, 1, 1,
-1.205044, -0.1077708, -3.374034, 1, 0, 0, 1, 1,
-1.2027, -1.156476, -2.197414, 1, 0, 0, 1, 1,
-1.202505, -2.502445, -3.652636, 1, 0, 0, 1, 1,
-1.202473, -0.1195901, -1.766198, 0, 0, 0, 1, 1,
-1.201937, 1.378819, -1.750306, 0, 0, 0, 1, 1,
-1.200035, 1.180118, 0.05729654, 0, 0, 0, 1, 1,
-1.199844, -1.325576, -2.8759, 0, 0, 0, 1, 1,
-1.199163, -1.311258, -3.428766, 0, 0, 0, 1, 1,
-1.195083, -1.42893, -0.6772598, 0, 0, 0, 1, 1,
-1.194134, -0.6225279, -1.218978, 0, 0, 0, 1, 1,
-1.188469, -1.993292, -2.900014, 1, 1, 1, 1, 1,
-1.186127, -0.3162158, -0.8646266, 1, 1, 1, 1, 1,
-1.180461, -0.02061185, -3.777829, 1, 1, 1, 1, 1,
-1.180287, -1.488937, -3.478141, 1, 1, 1, 1, 1,
-1.17718, -0.1079386, -1.680033, 1, 1, 1, 1, 1,
-1.173302, 0.9439762, -0.9099106, 1, 1, 1, 1, 1,
-1.17235, -0.2583534, -3.620414, 1, 1, 1, 1, 1,
-1.171656, 0.1012254, -2.168996, 1, 1, 1, 1, 1,
-1.16833, -0.3560719, -1.140793, 1, 1, 1, 1, 1,
-1.167886, 0.3599011, -0.7048964, 1, 1, 1, 1, 1,
-1.163511, -1.813326, -4.035223, 1, 1, 1, 1, 1,
-1.158614, -0.6445386, -1.60388, 1, 1, 1, 1, 1,
-1.157092, -0.4692288, -4.320014, 1, 1, 1, 1, 1,
-1.14685, 1.130874, -0.5773161, 1, 1, 1, 1, 1,
-1.140882, 0.1438945, -2.73764, 1, 1, 1, 1, 1,
-1.139399, 0.8122157, -1.989709, 0, 0, 1, 1, 1,
-1.135408, -0.6368408, -0.9265234, 1, 0, 0, 1, 1,
-1.130792, 1.081179, -0.6546813, 1, 0, 0, 1, 1,
-1.130495, -0.3659097, -0.7899461, 1, 0, 0, 1, 1,
-1.125453, -0.6565965, -3.60886, 1, 0, 0, 1, 1,
-1.123467, -0.5623572, 0.2227898, 1, 0, 0, 1, 1,
-1.122455, -0.7521386, -4.025303, 0, 0, 0, 1, 1,
-1.107531, -0.1138059, -2.657689, 0, 0, 0, 1, 1,
-1.105703, -0.5454264, -1.502746, 0, 0, 0, 1, 1,
-1.095481, 1.18882, -0.7932277, 0, 0, 0, 1, 1,
-1.089672, -0.4508159, -0.9248433, 0, 0, 0, 1, 1,
-1.08748, -0.715762, -2.998388, 0, 0, 0, 1, 1,
-1.077125, -2.963507, -0.8505684, 0, 0, 0, 1, 1,
-1.076534, -1.201321, -2.744991, 1, 1, 1, 1, 1,
-1.072274, -0.5667177, -0.258211, 1, 1, 1, 1, 1,
-1.068277, -0.4038813, -2.030576, 1, 1, 1, 1, 1,
-1.063105, -0.1867256, -0.8647042, 1, 1, 1, 1, 1,
-1.062633, 1.029594, -0.3641981, 1, 1, 1, 1, 1,
-1.051088, 0.9665633, -0.2065629, 1, 1, 1, 1, 1,
-1.043665, -0.8682126, -2.178718, 1, 1, 1, 1, 1,
-1.041039, 0.1209361, -1.372303, 1, 1, 1, 1, 1,
-1.027753, 0.9677591, 0.2135536, 1, 1, 1, 1, 1,
-1.019537, 0.1103307, -1.300532, 1, 1, 1, 1, 1,
-1.01876, 1.014417, -0.5924384, 1, 1, 1, 1, 1,
-1.018553, 0.8897519, -1.256523, 1, 1, 1, 1, 1,
-1.01061, -0.01070291, -2.097554, 1, 1, 1, 1, 1,
-1.009064, -0.7520521, -2.450733, 1, 1, 1, 1, 1,
-1.006811, -0.5238223, -2.016374, 1, 1, 1, 1, 1,
-1.003129, 1.384629, 0.159689, 0, 0, 1, 1, 1,
-1.002064, -1.389156, -3.096741, 1, 0, 0, 1, 1,
-0.9943527, 1.467812, 0.1570528, 1, 0, 0, 1, 1,
-0.9884037, 0.159571, -2.800087, 1, 0, 0, 1, 1,
-0.9883181, 0.2062966, -1.000311, 1, 0, 0, 1, 1,
-0.9864203, 1.011611, -0.2724099, 1, 0, 0, 1, 1,
-0.9861588, -1.735528, -4.776713, 0, 0, 0, 1, 1,
-0.9826199, -1.630742, -2.128693, 0, 0, 0, 1, 1,
-0.9817263, 0.3042258, -1.756496, 0, 0, 0, 1, 1,
-0.9799964, 0.3568482, -1.416889, 0, 0, 0, 1, 1,
-0.9799168, -0.6886424, -1.617999, 0, 0, 0, 1, 1,
-0.9798172, 0.1394801, -1.844317, 0, 0, 0, 1, 1,
-0.9782454, -0.02964824, -1.681661, 0, 0, 0, 1, 1,
-0.9756817, -0.5493826, -1.665859, 1, 1, 1, 1, 1,
-0.9690943, 0.7202364, -0.876182, 1, 1, 1, 1, 1,
-0.9614598, -0.2630587, -0.1347864, 1, 1, 1, 1, 1,
-0.9549826, -1.801866, -2.876286, 1, 1, 1, 1, 1,
-0.9378859, 0.5831764, -1.115113, 1, 1, 1, 1, 1,
-0.9370267, 0.1811586, -1.137727, 1, 1, 1, 1, 1,
-0.9351557, -0.6339502, -3.676988, 1, 1, 1, 1, 1,
-0.9341734, -0.7403615, -1.634744, 1, 1, 1, 1, 1,
-0.9226357, -0.4172199, -2.595251, 1, 1, 1, 1, 1,
-0.9222187, -0.2006458, -1.436154, 1, 1, 1, 1, 1,
-0.916079, 0.8914326, -0.7672785, 1, 1, 1, 1, 1,
-0.9157518, -0.6167577, -0.7213561, 1, 1, 1, 1, 1,
-0.9145103, 2.156147, -0.888584, 1, 1, 1, 1, 1,
-0.9099745, 0.1367901, -2.324301, 1, 1, 1, 1, 1,
-0.902831, -0.5372083, -0.5533195, 1, 1, 1, 1, 1,
-0.8944256, -0.5905793, -2.397389, 0, 0, 1, 1, 1,
-0.8933164, -0.8000399, -1.643869, 1, 0, 0, 1, 1,
-0.8882468, -0.4681143, -2.381927, 1, 0, 0, 1, 1,
-0.8872006, 1.583406, -0.5050566, 1, 0, 0, 1, 1,
-0.8869237, 0.2183106, -1.346023, 1, 0, 0, 1, 1,
-0.8855635, 0.8708802, -1.621604, 1, 0, 0, 1, 1,
-0.8840097, 0.9049324, -1.473981, 0, 0, 0, 1, 1,
-0.8761303, -0.3297815, -1.939995, 0, 0, 0, 1, 1,
-0.8679558, -0.8144925, -1.872564, 0, 0, 0, 1, 1,
-0.8664047, 1.23704, 0.07831155, 0, 0, 0, 1, 1,
-0.8592265, 0.444504, -1.473194, 0, 0, 0, 1, 1,
-0.8459935, -0.1905259, -2.304713, 0, 0, 0, 1, 1,
-0.8402867, -0.3976724, -0.6674482, 0, 0, 0, 1, 1,
-0.8400137, 0.1290699, -0.511713, 1, 1, 1, 1, 1,
-0.8308741, 0.3820545, -1.673926, 1, 1, 1, 1, 1,
-0.829977, -1.272036, -1.204808, 1, 1, 1, 1, 1,
-0.8275543, -1.222212, -2.347089, 1, 1, 1, 1, 1,
-0.8245831, 1.411117, 1.049766, 1, 1, 1, 1, 1,
-0.8243226, -0.3108084, -1.681492, 1, 1, 1, 1, 1,
-0.8231853, 0.4183992, 1.116857, 1, 1, 1, 1, 1,
-0.8207973, -0.3329724, -0.5985494, 1, 1, 1, 1, 1,
-0.8192877, -0.8352133, -2.984843, 1, 1, 1, 1, 1,
-0.8185089, 0.183522, -2.013153, 1, 1, 1, 1, 1,
-0.8105484, 0.438936, -3.236915, 1, 1, 1, 1, 1,
-0.8089157, -0.1043565, -3.539782, 1, 1, 1, 1, 1,
-0.8000702, -1.751543, -1.278622, 1, 1, 1, 1, 1,
-0.7998168, 0.02329329, -2.007884, 1, 1, 1, 1, 1,
-0.7970438, 0.9663656, -0.3561646, 1, 1, 1, 1, 1,
-0.7934394, 0.3257786, -0.8885453, 0, 0, 1, 1, 1,
-0.7918586, 0.4372875, -2.673709, 1, 0, 0, 1, 1,
-0.788026, 0.01885069, -1.500221, 1, 0, 0, 1, 1,
-0.785339, 1.003601, -1.681535, 1, 0, 0, 1, 1,
-0.7790483, -0.5353421, -1.145603, 1, 0, 0, 1, 1,
-0.7740645, 1.012129, -2.176372, 1, 0, 0, 1, 1,
-0.7676212, 0.9275227, -0.7695604, 0, 0, 0, 1, 1,
-0.7651037, 1.816489, -0.3401065, 0, 0, 0, 1, 1,
-0.7650841, -0.1958649, -3.335458, 0, 0, 0, 1, 1,
-0.7638628, -0.4551033, -1.848104, 0, 0, 0, 1, 1,
-0.7625828, 0.04431936, -0.3201094, 0, 0, 0, 1, 1,
-0.7614806, -1.285555, -1.844143, 0, 0, 0, 1, 1,
-0.7529999, -0.7691241, -0.6279574, 0, 0, 0, 1, 1,
-0.7517746, 1.359095, 0.9031203, 1, 1, 1, 1, 1,
-0.7504175, 0.5025493, 0.7839494, 1, 1, 1, 1, 1,
-0.7491386, -0.1647276, -0.01992611, 1, 1, 1, 1, 1,
-0.7467989, -0.693411, -1.972911, 1, 1, 1, 1, 1,
-0.7466958, -0.7831329, -2.136602, 1, 1, 1, 1, 1,
-0.7415975, 1.143668, -0.9765746, 1, 1, 1, 1, 1,
-0.7381593, -0.3721325, -1.280783, 1, 1, 1, 1, 1,
-0.7247404, -0.4630411, -1.290795, 1, 1, 1, 1, 1,
-0.7232726, -2.234016, -2.271598, 1, 1, 1, 1, 1,
-0.7223086, 0.1118133, -0.3781687, 1, 1, 1, 1, 1,
-0.7191616, 0.1553932, -1.82787, 1, 1, 1, 1, 1,
-0.71714, 1.640513, -0.8808888, 1, 1, 1, 1, 1,
-0.7091987, -0.6216083, -0.6637091, 1, 1, 1, 1, 1,
-0.7079062, -0.9213681, -2.052275, 1, 1, 1, 1, 1,
-0.7017192, -0.03095658, -2.767693, 1, 1, 1, 1, 1,
-0.6942425, 0.4382587, 0.1253824, 0, 0, 1, 1, 1,
-0.6936011, 0.2922025, -0.7096833, 1, 0, 0, 1, 1,
-0.6935079, 0.6302717, -2.283178, 1, 0, 0, 1, 1,
-0.6849436, -0.6056912, -0.5049761, 1, 0, 0, 1, 1,
-0.6836846, 0.6945521, -1.912083, 1, 0, 0, 1, 1,
-0.6835764, -0.8069629, -2.275369, 1, 0, 0, 1, 1,
-0.683214, -0.6495038, -4.782818, 0, 0, 0, 1, 1,
-0.6831669, -0.4868129, -1.895028, 0, 0, 0, 1, 1,
-0.6831584, -0.8089923, -2.214331, 0, 0, 0, 1, 1,
-0.6812062, 0.4851973, -0.3865985, 0, 0, 0, 1, 1,
-0.6745827, -0.484132, -2.779484, 0, 0, 0, 1, 1,
-0.6741847, 0.4048601, -1.224563, 0, 0, 0, 1, 1,
-0.6691817, 0.5114428, -0.8608932, 0, 0, 0, 1, 1,
-0.6690584, 0.5786094, -1.15771, 1, 1, 1, 1, 1,
-0.6665966, -0.1289874, -2.905332, 1, 1, 1, 1, 1,
-0.6647934, 1.776569, -1.696574, 1, 1, 1, 1, 1,
-0.6636147, -0.737042, -1.561718, 1, 1, 1, 1, 1,
-0.6586347, -0.6120217, -0.9415863, 1, 1, 1, 1, 1,
-0.6567582, -1.818543, -2.191275, 1, 1, 1, 1, 1,
-0.6551764, 0.2116185, -1.962262, 1, 1, 1, 1, 1,
-0.6546006, -0.06752355, -1.455718, 1, 1, 1, 1, 1,
-0.654376, 0.8012525, -0.1667906, 1, 1, 1, 1, 1,
-0.6523962, 1.224419, -1.847271, 1, 1, 1, 1, 1,
-0.6482336, -0.7357826, -2.797199, 1, 1, 1, 1, 1,
-0.6478778, 0.2090426, -1.437574, 1, 1, 1, 1, 1,
-0.644891, -0.3652272, -1.439846, 1, 1, 1, 1, 1,
-0.6378861, 0.3239231, -1.411315, 1, 1, 1, 1, 1,
-0.6345113, 0.3049024, -1.831175, 1, 1, 1, 1, 1,
-0.6300316, -0.513703, -2.574017, 0, 0, 1, 1, 1,
-0.6293948, -0.2741332, -1.221577, 1, 0, 0, 1, 1,
-0.6273085, -0.5601658, -3.040125, 1, 0, 0, 1, 1,
-0.6228835, 1.388333, -0.7187238, 1, 0, 0, 1, 1,
-0.6212026, -1.091584, -2.017013, 1, 0, 0, 1, 1,
-0.6193677, 1.879275, 1.300221, 1, 0, 0, 1, 1,
-0.6193395, -1.01592, -1.77816, 0, 0, 0, 1, 1,
-0.6192864, 0.5893381, -1.62695, 0, 0, 0, 1, 1,
-0.6119753, -0.9897068, -2.965354, 0, 0, 0, 1, 1,
-0.6112416, 0.2462416, -1.089161, 0, 0, 0, 1, 1,
-0.6111413, -0.9195855, -2.280277, 0, 0, 0, 1, 1,
-0.607801, 0.9998829, -0.6252887, 0, 0, 0, 1, 1,
-0.6066745, -0.4933923, -2.194274, 0, 0, 0, 1, 1,
-0.6004166, -1.602039, -4.592534, 1, 1, 1, 1, 1,
-0.5999976, 0.268988, -2.005754, 1, 1, 1, 1, 1,
-0.5974901, 0.5859051, -0.4462258, 1, 1, 1, 1, 1,
-0.5950376, 1.877062, -0.4716638, 1, 1, 1, 1, 1,
-0.5934076, 0.4815474, -1.814679, 1, 1, 1, 1, 1,
-0.5920404, 0.9063907, 0.0002198663, 1, 1, 1, 1, 1,
-0.5914351, 0.9594461, -0.5056474, 1, 1, 1, 1, 1,
-0.5891217, -2.808493, -4.023025, 1, 1, 1, 1, 1,
-0.5798354, -1.211884, -3.547421, 1, 1, 1, 1, 1,
-0.5784919, -0.9617497, -3.436786, 1, 1, 1, 1, 1,
-0.5724512, -0.5183181, -1.792929, 1, 1, 1, 1, 1,
-0.5705748, -0.6141936, -2.126288, 1, 1, 1, 1, 1,
-0.5661422, 1.12254, -2.534914, 1, 1, 1, 1, 1,
-0.5655158, 0.8762213, -1.913227, 1, 1, 1, 1, 1,
-0.5632478, -0.7769251, -1.507735, 1, 1, 1, 1, 1,
-0.5615584, 1.016857, -1.501849, 0, 0, 1, 1, 1,
-0.544965, 0.04331996, -1.517471, 1, 0, 0, 1, 1,
-0.5303376, 0.395993, -1.791262, 1, 0, 0, 1, 1,
-0.5296443, 0.4403705, -0.2091875, 1, 0, 0, 1, 1,
-0.5258278, 0.6143671, -1.904098, 1, 0, 0, 1, 1,
-0.5198191, 0.631735, -1.152508, 1, 0, 0, 1, 1,
-0.5143816, -1.117541, -3.148359, 0, 0, 0, 1, 1,
-0.5130555, 0.2481339, -3.079509, 0, 0, 0, 1, 1,
-0.5061565, 0.3735268, 0.7100503, 0, 0, 0, 1, 1,
-0.5046571, 0.8565739, 1.005739, 0, 0, 0, 1, 1,
-0.5013111, -0.1325751, -3.0203, 0, 0, 0, 1, 1,
-0.5007545, -0.3087551, -3.503804, 0, 0, 0, 1, 1,
-0.5005822, 0.5136005, -0.287242, 0, 0, 0, 1, 1,
-0.496144, 0.6733686, 0.5985433, 1, 1, 1, 1, 1,
-0.4869355, 0.2105336, -1.45153, 1, 1, 1, 1, 1,
-0.4862325, -1.045364, -4.193746, 1, 1, 1, 1, 1,
-0.4815759, -0.7294981, -3.323211, 1, 1, 1, 1, 1,
-0.4800726, -1.171555, -2.983625, 1, 1, 1, 1, 1,
-0.4799739, -0.1897293, -1.368405, 1, 1, 1, 1, 1,
-0.4728865, 0.03409894, -0.7723277, 1, 1, 1, 1, 1,
-0.4697424, -0.5850758, -1.20331, 1, 1, 1, 1, 1,
-0.4663979, 0.9082901, -1.744282, 1, 1, 1, 1, 1,
-0.4649002, -1.326865, -3.522193, 1, 1, 1, 1, 1,
-0.4612104, -1.545966, -3.568017, 1, 1, 1, 1, 1,
-0.4524504, 0.8266733, -2.769473e-05, 1, 1, 1, 1, 1,
-0.449362, -0.2128131, -1.486645, 1, 1, 1, 1, 1,
-0.4487043, 0.3218391, 0.05862427, 1, 1, 1, 1, 1,
-0.4408867, -0.6115098, -4.95094, 1, 1, 1, 1, 1,
-0.440749, 0.8631476, -0.06337755, 0, 0, 1, 1, 1,
-0.4325418, 1.86601, 0.006982511, 1, 0, 0, 1, 1,
-0.4239582, -1.494625, -2.025734, 1, 0, 0, 1, 1,
-0.4234939, -0.3405232, -3.580104, 1, 0, 0, 1, 1,
-0.4149128, 1.021549, 1.526134, 1, 0, 0, 1, 1,
-0.4142422, 1.682427, 0.2069035, 1, 0, 0, 1, 1,
-0.4120695, -0.1780562, -3.209011, 0, 0, 0, 1, 1,
-0.4120352, -2.126215, -1.588188, 0, 0, 0, 1, 1,
-0.4094599, 0.1323553, -0.1495783, 0, 0, 0, 1, 1,
-0.4066986, -0.1340805, -1.49798, 0, 0, 0, 1, 1,
-0.4058391, -0.2081681, -0.4406165, 0, 0, 0, 1, 1,
-0.4057379, -1.466258, -2.377692, 0, 0, 0, 1, 1,
-0.4046049, 0.4403135, -1.354421, 0, 0, 0, 1, 1,
-0.4043472, -0.5979356, -2.663168, 1, 1, 1, 1, 1,
-0.4009645, -0.9494089, -3.928932, 1, 1, 1, 1, 1,
-0.3973578, 0.01452348, -1.423062, 1, 1, 1, 1, 1,
-0.3972516, -0.7096167, -2.391112, 1, 1, 1, 1, 1,
-0.396839, -0.1832668, -1.983031, 1, 1, 1, 1, 1,
-0.3862623, 0.2906272, -1.558169, 1, 1, 1, 1, 1,
-0.3837625, 0.2060446, -0.8844759, 1, 1, 1, 1, 1,
-0.3779585, -0.900994, -2.070692, 1, 1, 1, 1, 1,
-0.3762345, -0.700602, -2.854925, 1, 1, 1, 1, 1,
-0.3736439, -0.7310903, -2.631604, 1, 1, 1, 1, 1,
-0.3723074, 0.2894154, -2.086547, 1, 1, 1, 1, 1,
-0.3697665, -0.07188505, -1.56003, 1, 1, 1, 1, 1,
-0.3638903, 0.1195075, -0.5097423, 1, 1, 1, 1, 1,
-0.3628031, -0.9311154, -3.485205, 1, 1, 1, 1, 1,
-0.3589889, 0.8190199, -0.3953291, 1, 1, 1, 1, 1,
-0.3580302, 0.8198078, -2.524226, 0, 0, 1, 1, 1,
-0.3553234, -0.4555382, -2.042198, 1, 0, 0, 1, 1,
-0.3546672, -0.09228865, -0.6996748, 1, 0, 0, 1, 1,
-0.3534426, 2.086711, -1.313099, 1, 0, 0, 1, 1,
-0.3516422, 0.3263663, -0.4723984, 1, 0, 0, 1, 1,
-0.3498119, -2.804577, -2.166752, 1, 0, 0, 1, 1,
-0.3470259, 1.086037, -0.2157997, 0, 0, 0, 1, 1,
-0.3447804, -1.113791, -2.709614, 0, 0, 0, 1, 1,
-0.3421941, 1.463137, -0.6855316, 0, 0, 0, 1, 1,
-0.3404457, 0.5951145, -1.035654, 0, 0, 0, 1, 1,
-0.3404447, 0.9989472, -0.5776709, 0, 0, 0, 1, 1,
-0.3391075, 0.5426615, -0.1222418, 0, 0, 0, 1, 1,
-0.3384753, 0.1467383, -0.7444424, 0, 0, 0, 1, 1,
-0.3315038, -0.2906863, -3.724623, 1, 1, 1, 1, 1,
-0.3226939, 0.4634066, -0.822493, 1, 1, 1, 1, 1,
-0.3223672, -0.8475451, -3.352397, 1, 1, 1, 1, 1,
-0.3218801, 0.2744736, 0.1439293, 1, 1, 1, 1, 1,
-0.3192654, -0.8357349, -1.67518, 1, 1, 1, 1, 1,
-0.3183212, -0.8154922, -2.930534, 1, 1, 1, 1, 1,
-0.315848, -0.6869483, -3.383807, 1, 1, 1, 1, 1,
-0.3147305, -0.4062673, -3.247735, 1, 1, 1, 1, 1,
-0.3144496, 2.608901, -0.08657496, 1, 1, 1, 1, 1,
-0.3132263, -0.4129803, -1.971743, 1, 1, 1, 1, 1,
-0.3127522, 0.1184321, -2.581863, 1, 1, 1, 1, 1,
-0.3106639, -0.7539858, -2.961914, 1, 1, 1, 1, 1,
-0.3051007, 0.3283165, -1.861736, 1, 1, 1, 1, 1,
-0.3021663, 0.314613, -0.01104006, 1, 1, 1, 1, 1,
-0.3006027, -1.102689, -3.774215, 1, 1, 1, 1, 1,
-0.2996921, 0.5489579, -0.6703871, 0, 0, 1, 1, 1,
-0.2978036, 0.1776386, -1.000807, 1, 0, 0, 1, 1,
-0.2974904, -0.2406478, -1.27346, 1, 0, 0, 1, 1,
-0.2940073, -0.2349917, -2.697957, 1, 0, 0, 1, 1,
-0.2907503, 0.2855109, -0.8931983, 1, 0, 0, 1, 1,
-0.2888307, 0.4762168, -0.6485299, 1, 0, 0, 1, 1,
-0.2877128, -1.233022, -2.992756, 0, 0, 0, 1, 1,
-0.2869259, -0.2988189, -2.402468, 0, 0, 0, 1, 1,
-0.2868325, -0.46782, -1.964946, 0, 0, 0, 1, 1,
-0.2840529, 1.841265, -1.281178, 0, 0, 0, 1, 1,
-0.2823349, 0.6521938, -0.1228489, 0, 0, 0, 1, 1,
-0.2821408, 1.691978, -2.628278, 0, 0, 0, 1, 1,
-0.2768958, -0.0293645, -0.3084016, 0, 0, 0, 1, 1,
-0.2760013, 0.02999049, -2.656213, 1, 1, 1, 1, 1,
-0.2703722, -0.4027682, -3.221002, 1, 1, 1, 1, 1,
-0.2667577, 0.4913483, -0.4760864, 1, 1, 1, 1, 1,
-0.2601738, -1.066787, -2.587293, 1, 1, 1, 1, 1,
-0.25966, -0.3865407, -4.282637, 1, 1, 1, 1, 1,
-0.2595887, 0.3363483, -1.972203, 1, 1, 1, 1, 1,
-0.2583129, -1.175313, -3.501324, 1, 1, 1, 1, 1,
-0.2545905, -2.646696, -1.767641, 1, 1, 1, 1, 1,
-0.2488665, 0.4250232, -0.1803668, 1, 1, 1, 1, 1,
-0.2488394, 0.9771757, -1.713983, 1, 1, 1, 1, 1,
-0.2457588, 0.999301, -1.637331, 1, 1, 1, 1, 1,
-0.2434547, 2.347609, 0.05762084, 1, 1, 1, 1, 1,
-0.2402523, -0.06625734, -2.457303, 1, 1, 1, 1, 1,
-0.2401204, 0.8853708, -0.06880072, 1, 1, 1, 1, 1,
-0.2386613, -0.6350806, -2.419939, 1, 1, 1, 1, 1,
-0.2385014, 0.7597798, -0.05792345, 0, 0, 1, 1, 1,
-0.2382422, -1.045813, -4.22789, 1, 0, 0, 1, 1,
-0.2366666, 0.4905391, 0.009714194, 1, 0, 0, 1, 1,
-0.2350885, -1.266993, -2.704799, 1, 0, 0, 1, 1,
-0.2347806, -2.002573, -2.784788, 1, 0, 0, 1, 1,
-0.2305787, 0.4814748, -1.039894, 1, 0, 0, 1, 1,
-0.2273835, -0.09383299, -2.510272, 0, 0, 0, 1, 1,
-0.2126289, 0.7057207, -0.4187299, 0, 0, 0, 1, 1,
-0.2105479, 1.010514, -1.099777, 0, 0, 0, 1, 1,
-0.209386, -1.171981, -4.321634, 0, 0, 0, 1, 1,
-0.208636, 1.039417, 0.7988937, 0, 0, 0, 1, 1,
-0.2083755, 0.3692487, 0.3784607, 0, 0, 0, 1, 1,
-0.2081478, 1.668676, 1.354821, 0, 0, 0, 1, 1,
-0.2072632, -0.5718461, -1.713256, 1, 1, 1, 1, 1,
-0.2044122, 0.7512159, -2.046597, 1, 1, 1, 1, 1,
-0.2029355, -0.3275802, -1.182681, 1, 1, 1, 1, 1,
-0.2026329, -0.1140511, -2.0764, 1, 1, 1, 1, 1,
-0.196029, -1.176136, -3.401891, 1, 1, 1, 1, 1,
-0.1952064, 0.07286107, 1.067162, 1, 1, 1, 1, 1,
-0.1948341, 0.01892676, -1.830218, 1, 1, 1, 1, 1,
-0.1919596, 0.1393036, -1.432661, 1, 1, 1, 1, 1,
-0.1888318, 0.03717711, -1.427822, 1, 1, 1, 1, 1,
-0.1836593, 0.4240146, -0.7185152, 1, 1, 1, 1, 1,
-0.1726882, -1.117087, -3.122386, 1, 1, 1, 1, 1,
-0.169615, 0.8903525, -2.271436, 1, 1, 1, 1, 1,
-0.1675716, 0.03742243, -1.741755, 1, 1, 1, 1, 1,
-0.1651233, 0.1096732, -1.679067, 1, 1, 1, 1, 1,
-0.1641047, 1.297806, 0.4352218, 1, 1, 1, 1, 1,
-0.1593215, 1.469951, 0.9059432, 0, 0, 1, 1, 1,
-0.1511318, 1.345518, -0.832769, 1, 0, 0, 1, 1,
-0.1497186, -0.8936384, -1.122177, 1, 0, 0, 1, 1,
-0.1456335, 0.7785643, -0.2494318, 1, 0, 0, 1, 1,
-0.1342947, 1.107518, 0.6452458, 1, 0, 0, 1, 1,
-0.1330627, -0.2604339, -4.878886, 1, 0, 0, 1, 1,
-0.1291754, -0.1626442, -3.217037, 0, 0, 0, 1, 1,
-0.1266323, 0.3901157, -1.1743, 0, 0, 0, 1, 1,
-0.126628, -0.2572528, -2.667953, 0, 0, 0, 1, 1,
-0.1261138, -0.8505122, -3.08453, 0, 0, 0, 1, 1,
-0.1243194, -0.6304512, -3.69793, 0, 0, 0, 1, 1,
-0.1204414, -0.7774411, -2.520481, 0, 0, 0, 1, 1,
-0.1195931, 2.059248, 1.553882, 0, 0, 0, 1, 1,
-0.1175761, 0.7829362, -0.7191608, 1, 1, 1, 1, 1,
-0.1168977, -0.6369656, -3.814227, 1, 1, 1, 1, 1,
-0.1146184, -0.7196315, -2.186234, 1, 1, 1, 1, 1,
-0.1128815, -0.3173195, -2.427123, 1, 1, 1, 1, 1,
-0.1091701, -0.5243365, -2.168862, 1, 1, 1, 1, 1,
-0.1053073, 0.1509992, -1.408782, 1, 1, 1, 1, 1,
-0.1042469, 1.158375, 1.389357, 1, 1, 1, 1, 1,
-0.1025562, 2.437419, 0.1961911, 1, 1, 1, 1, 1,
-0.1014528, 0.21443, 1.118486, 1, 1, 1, 1, 1,
-0.09385342, -1.404727, -1.543467, 1, 1, 1, 1, 1,
-0.09309575, -0.21317, -1.241291, 1, 1, 1, 1, 1,
-0.0921938, -0.411254, -5.915604, 1, 1, 1, 1, 1,
-0.09179867, -0.5608195, -2.80625, 1, 1, 1, 1, 1,
-0.09056862, -0.2438084, -2.900828, 1, 1, 1, 1, 1,
-0.08737594, -0.8381602, -3.148261, 1, 1, 1, 1, 1,
-0.08360232, -0.7772441, -0.3561255, 0, 0, 1, 1, 1,
-0.0795479, -0.6702659, -3.18543, 1, 0, 0, 1, 1,
-0.07812419, -0.001563871, -3.395058, 1, 0, 0, 1, 1,
-0.07799772, 0.1708373, -0.9062036, 1, 0, 0, 1, 1,
-0.07711498, 1.115303, 0.04773297, 1, 0, 0, 1, 1,
-0.07668152, 0.3040844, -0.4449689, 1, 0, 0, 1, 1,
-0.07465694, 0.7876784, -0.8059911, 0, 0, 0, 1, 1,
-0.07282484, -2.232751, -3.300693, 0, 0, 0, 1, 1,
-0.07002277, -0.8681446, -1.892542, 0, 0, 0, 1, 1,
-0.0689696, 0.9617855, -0.0313973, 0, 0, 0, 1, 1,
-0.06851783, -1.008845, -1.967647, 0, 0, 0, 1, 1,
-0.06820462, 1.034941, -0.8669202, 0, 0, 0, 1, 1,
-0.06706656, -0.4845104, -2.555716, 0, 0, 0, 1, 1,
-0.06610671, -0.296398, -5.167459, 1, 1, 1, 1, 1,
-0.0634554, -1.336577, -0.5087221, 1, 1, 1, 1, 1,
-0.06062943, 0.07782885, 0.999822, 1, 1, 1, 1, 1,
-0.05952368, 1.504945, 1.232436, 1, 1, 1, 1, 1,
-0.05882294, -1.141829, -1.963991, 1, 1, 1, 1, 1,
-0.05574711, 1.077037, -1.348773, 1, 1, 1, 1, 1,
-0.05304893, 0.04291618, 0.5298966, 1, 1, 1, 1, 1,
-0.05015542, -0.461385, -2.544953, 1, 1, 1, 1, 1,
-0.04802691, 0.2068341, 0.3451546, 1, 1, 1, 1, 1,
-0.03815223, 0.2626254, -2.385777, 1, 1, 1, 1, 1,
-0.03357346, -1.494923, -3.240921, 1, 1, 1, 1, 1,
-0.03292719, -0.8846833, -2.04262, 1, 1, 1, 1, 1,
-0.03014631, -1.799071, -2.738618, 1, 1, 1, 1, 1,
-0.02992195, 1.015208, 0.1118153, 1, 1, 1, 1, 1,
-0.02767546, -1.807296, -2.371456, 1, 1, 1, 1, 1,
-0.02600384, -2.077121, -3.431435, 0, 0, 1, 1, 1,
-0.02559186, 1.012673, -0.4658045, 1, 0, 0, 1, 1,
-0.02153367, 1.055915, -0.3323905, 1, 0, 0, 1, 1,
-0.02018174, 0.8375715, 0.01695646, 1, 0, 0, 1, 1,
-0.0186839, -0.2623275, -2.508086, 1, 0, 0, 1, 1,
-0.01494966, 0.09544765, -0.5262938, 1, 0, 0, 1, 1,
-0.01160395, -1.075208, -4.487899, 0, 0, 0, 1, 1,
-0.008040109, -0.7210634, -4.912479, 0, 0, 0, 1, 1,
-0.005547515, -0.04369392, -3.019353, 0, 0, 0, 1, 1,
-0.001113457, -0.557641, -2.031355, 0, 0, 0, 1, 1,
-0.0007102744, 0.9591436, -0.7495618, 0, 0, 0, 1, 1,
0.001347653, -0.4928449, 3.115193, 0, 0, 0, 1, 1,
0.001410472, -0.7378359, 3.375687, 0, 0, 0, 1, 1,
0.003924323, -0.8976216, 3.166365, 1, 1, 1, 1, 1,
0.006827449, 0.2108309, 0.1575872, 1, 1, 1, 1, 1,
0.006863534, -0.4251387, 3.135578, 1, 1, 1, 1, 1,
0.01318299, 0.4317966, 0.6060897, 1, 1, 1, 1, 1,
0.01733249, -1.421556, 3.626006, 1, 1, 1, 1, 1,
0.0219558, 0.2216529, -1.42021, 1, 1, 1, 1, 1,
0.02265379, -0.2072973, 3.122788, 1, 1, 1, 1, 1,
0.02969036, -1.770125, 2.850824, 1, 1, 1, 1, 1,
0.03247815, 0.4745108, 0.09366314, 1, 1, 1, 1, 1,
0.03286565, 0.4482848, -0.1807435, 1, 1, 1, 1, 1,
0.03722125, 0.2670243, 1.608232, 1, 1, 1, 1, 1,
0.03756074, 1.217293, 1.923818, 1, 1, 1, 1, 1,
0.03879998, -0.001315868, 2.815295, 1, 1, 1, 1, 1,
0.04302232, 1.78648, -1.249177, 1, 1, 1, 1, 1,
0.04587305, 1.82121, -0.4974807, 1, 1, 1, 1, 1,
0.04750733, -0.2888852, 3.440369, 0, 0, 1, 1, 1,
0.05425993, -0.0444341, 2.545596, 1, 0, 0, 1, 1,
0.05542395, 1.076612, 1.241206, 1, 0, 0, 1, 1,
0.05665272, -0.9210245, 4.141808, 1, 0, 0, 1, 1,
0.05719195, -1.637211, 3.247626, 1, 0, 0, 1, 1,
0.05732213, 0.1491512, 1.687488, 1, 0, 0, 1, 1,
0.05784141, 0.5466086, 1.242802, 0, 0, 0, 1, 1,
0.05991852, 0.8350465, -1.489919, 0, 0, 0, 1, 1,
0.06488486, -0.3036801, 4.302256, 0, 0, 0, 1, 1,
0.06501132, -1.192185, 3.812265, 0, 0, 0, 1, 1,
0.06766274, 1.077377, -1.367229, 0, 0, 0, 1, 1,
0.06829361, 0.9162769, 1.012057, 0, 0, 0, 1, 1,
0.07104465, 1.128803, 0.2886544, 0, 0, 0, 1, 1,
0.07660977, -1.985694, 1.762727, 1, 1, 1, 1, 1,
0.07782945, 1.182305, 0.2787631, 1, 1, 1, 1, 1,
0.07919349, -1.536768, 2.59843, 1, 1, 1, 1, 1,
0.08199783, -0.6117162, 3.427169, 1, 1, 1, 1, 1,
0.08251183, -0.1106103, 1.604599, 1, 1, 1, 1, 1,
0.08260294, 0.7695592, 2.757715, 1, 1, 1, 1, 1,
0.08520743, 1.357988, 0.3869477, 1, 1, 1, 1, 1,
0.08618983, -0.8387722, 2.623689, 1, 1, 1, 1, 1,
0.08736797, 0.5486355, 0.7672728, 1, 1, 1, 1, 1,
0.09461042, -2.518732, 5.105175, 1, 1, 1, 1, 1,
0.09590212, 1.74182, -2.314878, 1, 1, 1, 1, 1,
0.1010662, -0.9128518, 2.889965, 1, 1, 1, 1, 1,
0.1053696, 1.922139, -0.5923541, 1, 1, 1, 1, 1,
0.1054703, 0.5708786, 0.4816618, 1, 1, 1, 1, 1,
0.1098346, 1.406673, 0.8448337, 1, 1, 1, 1, 1,
0.1121282, -1.906713, 2.598045, 0, 0, 1, 1, 1,
0.1134195, 1.864002, -2.104946, 1, 0, 0, 1, 1,
0.1139085, -1.286538, 3.57477, 1, 0, 0, 1, 1,
0.114526, -0.2459219, 3.716021, 1, 0, 0, 1, 1,
0.1154081, 0.2613078, 3.418779, 1, 0, 0, 1, 1,
0.1183277, -0.2638765, 3.620989, 1, 0, 0, 1, 1,
0.1200601, 0.2545577, -0.7402135, 0, 0, 0, 1, 1,
0.1221582, -0.4493342, 2.750234, 0, 0, 0, 1, 1,
0.1222865, -0.003980421, 1.804596, 0, 0, 0, 1, 1,
0.1226104, 0.07138202, 0.6180508, 0, 0, 0, 1, 1,
0.1231683, 0.1214958, 0.8950001, 0, 0, 0, 1, 1,
0.1237804, 1.660469, 1.836977, 0, 0, 0, 1, 1,
0.1239825, -1.049074, 3.465184, 0, 0, 0, 1, 1,
0.1247935, -0.9947115, 2.705462, 1, 1, 1, 1, 1,
0.13569, 0.5397256, -0.1560404, 1, 1, 1, 1, 1,
0.1370797, -0.2436715, 2.369016, 1, 1, 1, 1, 1,
0.1383891, -0.4614706, 3.785229, 1, 1, 1, 1, 1,
0.1429255, 0.6176276, 2.041575, 1, 1, 1, 1, 1,
0.1447055, 0.1513006, 0.6744667, 1, 1, 1, 1, 1,
0.1538873, -0.1281534, 1.715898, 1, 1, 1, 1, 1,
0.1563024, 0.8798908, 0.4782952, 1, 1, 1, 1, 1,
0.1568365, -0.4440824, 4.202292, 1, 1, 1, 1, 1,
0.1568895, -1.027143, 3.746841, 1, 1, 1, 1, 1,
0.1590919, 0.2172391, 0.4220482, 1, 1, 1, 1, 1,
0.1650673, 0.005447263, 0.7576098, 1, 1, 1, 1, 1,
0.1660521, 0.6698842, -1.358837, 1, 1, 1, 1, 1,
0.1661491, -0.1824041, 4.019354, 1, 1, 1, 1, 1,
0.1664048, -1.203342, 1.981686, 1, 1, 1, 1, 1,
0.1674016, -0.2953246, 1.917329, 0, 0, 1, 1, 1,
0.1729926, -0.7232876, 4.047176, 1, 0, 0, 1, 1,
0.1763884, -0.2296005, 2.813771, 1, 0, 0, 1, 1,
0.1773804, 1.920624, 0.0216566, 1, 0, 0, 1, 1,
0.1774509, 1.147325, -0.9864161, 1, 0, 0, 1, 1,
0.1801836, 0.7813705, 1.173638, 1, 0, 0, 1, 1,
0.1814171, 0.4129923, 0.7613521, 0, 0, 0, 1, 1,
0.1842137, -0.7596105, 3.563102, 0, 0, 0, 1, 1,
0.1844475, 0.3042735, 0.3297509, 0, 0, 0, 1, 1,
0.1865012, -0.2127907, 2.422908, 0, 0, 0, 1, 1,
0.1868124, 0.1172953, 0.6191011, 0, 0, 0, 1, 1,
0.1941868, 1.466704, -1.004815, 0, 0, 0, 1, 1,
0.1979063, 1.612851, 0.9113253, 0, 0, 0, 1, 1,
0.1989222, -1.290874, 2.415784, 1, 1, 1, 1, 1,
0.1995251, -1.041185, 0.9030639, 1, 1, 1, 1, 1,
0.2010726, -1.126408, 1.645358, 1, 1, 1, 1, 1,
0.2023166, -0.1821969, 2.408412, 1, 1, 1, 1, 1,
0.2042336, 0.8093758, -1.585421, 1, 1, 1, 1, 1,
0.2056962, -0.9522142, 2.759381, 1, 1, 1, 1, 1,
0.2060204, 0.8921139, 1.328356, 1, 1, 1, 1, 1,
0.2071981, 0.6702789, 0.9852415, 1, 1, 1, 1, 1,
0.2088743, -1.382579, 4.186027, 1, 1, 1, 1, 1,
0.2120144, -0.9494461, 1.074328, 1, 1, 1, 1, 1,
0.2120378, -0.3161152, 3.761402, 1, 1, 1, 1, 1,
0.21227, -1.762626, 2.052094, 1, 1, 1, 1, 1,
0.2132421, -0.1601817, 2.03995, 1, 1, 1, 1, 1,
0.2159122, 1.333925, 0.4924724, 1, 1, 1, 1, 1,
0.2193019, 1.423656, -2.088742, 1, 1, 1, 1, 1,
0.2253943, -1.535793, 4.61184, 0, 0, 1, 1, 1,
0.2256342, -2.082478, 4.06037, 1, 0, 0, 1, 1,
0.2300796, 0.2763691, 0.1478542, 1, 0, 0, 1, 1,
0.2308444, -0.1063656, 1.838501, 1, 0, 0, 1, 1,
0.2315335, 0.0106317, 0.9298278, 1, 0, 0, 1, 1,
0.2324669, 0.8615979, -0.9191393, 1, 0, 0, 1, 1,
0.2351699, -0.3275933, 2.627223, 0, 0, 0, 1, 1,
0.2376219, 1.068108, 0.6055152, 0, 0, 0, 1, 1,
0.238497, 0.4606068, 0.6524215, 0, 0, 0, 1, 1,
0.2388421, 0.08003581, 1.675701, 0, 0, 0, 1, 1,
0.2390247, -2.524344, 1.921849, 0, 0, 0, 1, 1,
0.2435782, 0.6838626, -0.3041496, 0, 0, 0, 1, 1,
0.246003, -0.5887664, 2.111366, 0, 0, 0, 1, 1,
0.2509388, -1.389878, 3.524235, 1, 1, 1, 1, 1,
0.2519693, -0.04683397, 2.165117, 1, 1, 1, 1, 1,
0.2528386, -0.721202, 3.464982, 1, 1, 1, 1, 1,
0.2561833, 0.1977631, 2.529858, 1, 1, 1, 1, 1,
0.2563534, -1.887603, 1.619253, 1, 1, 1, 1, 1,
0.2567183, -0.5423361, 4.141865, 1, 1, 1, 1, 1,
0.2570899, -0.997744, 1.952709, 1, 1, 1, 1, 1,
0.2583741, -0.6244828, 0.9177395, 1, 1, 1, 1, 1,
0.2613147, 2.040795, -0.376926, 1, 1, 1, 1, 1,
0.2676291, -0.5569062, 3.473129, 1, 1, 1, 1, 1,
0.269895, -1.995212, 2.888788, 1, 1, 1, 1, 1,
0.2719822, -0.124593, 2.233357, 1, 1, 1, 1, 1,
0.2738965, -0.9328601, 1.487545, 1, 1, 1, 1, 1,
0.2751692, -0.3583107, 3.851815, 1, 1, 1, 1, 1,
0.2791356, 0.867658, -0.6554295, 1, 1, 1, 1, 1,
0.2811559, -1.384017, 2.07334, 0, 0, 1, 1, 1,
0.2951674, 0.1828483, 0.1795018, 1, 0, 0, 1, 1,
0.3009022, 0.3116053, 1.643552, 1, 0, 0, 1, 1,
0.3019768, 0.4008205, 2.705886, 1, 0, 0, 1, 1,
0.3039004, 1.197406, 0.3054935, 1, 0, 0, 1, 1,
0.3106845, -0.5594215, 1.259303, 1, 0, 0, 1, 1,
0.3131792, -1.61989, 2.318208, 0, 0, 0, 1, 1,
0.3170837, 0.1042719, 0.5842656, 0, 0, 0, 1, 1,
0.3205781, 0.6026386, 0.4252715, 0, 0, 0, 1, 1,
0.3290163, 1.175596, 0.3558843, 0, 0, 0, 1, 1,
0.3332792, 0.4328786, 0.5695991, 0, 0, 0, 1, 1,
0.3397669, -0.1911139, 0.8125941, 0, 0, 0, 1, 1,
0.3450698, 0.4893772, 2.174092, 0, 0, 0, 1, 1,
0.3468132, -0.8725898, 1.592387, 1, 1, 1, 1, 1,
0.348628, -0.2761875, 2.331792, 1, 1, 1, 1, 1,
0.3494643, -1.743538, 5.215077, 1, 1, 1, 1, 1,
0.3504417, -0.2941321, 3.821422, 1, 1, 1, 1, 1,
0.3523656, 0.683883, 0.3725654, 1, 1, 1, 1, 1,
0.3523756, -0.7597102, 3.219747, 1, 1, 1, 1, 1,
0.3525052, 0.5614293, 1.06529, 1, 1, 1, 1, 1,
0.355351, 0.4615963, 0.006610147, 1, 1, 1, 1, 1,
0.3592449, 0.364812, 0.8178679, 1, 1, 1, 1, 1,
0.3604613, -0.4829478, 1.622056, 1, 1, 1, 1, 1,
0.3612332, 0.00809025, 3.143878, 1, 1, 1, 1, 1,
0.3633441, -0.7517214, 3.176939, 1, 1, 1, 1, 1,
0.3684505, 0.4142609, -0.3221084, 1, 1, 1, 1, 1,
0.3710195, -0.5536371, 3.342804, 1, 1, 1, 1, 1,
0.3717462, 0.5668128, -0.9879192, 1, 1, 1, 1, 1,
0.3717742, 1.42641, -0.4284829, 0, 0, 1, 1, 1,
0.3819909, -2.105159, 4.101218, 1, 0, 0, 1, 1,
0.382905, 0.4145203, 2.175698, 1, 0, 0, 1, 1,
0.3840673, 0.7630042, -0.2938357, 1, 0, 0, 1, 1,
0.3841429, 1.668911, -1.033424, 1, 0, 0, 1, 1,
0.384405, 1.261338, -0.3491935, 1, 0, 0, 1, 1,
0.38919, 1.279505, 0.9607159, 0, 0, 0, 1, 1,
0.3893696, 0.3718072, 0.1971301, 0, 0, 0, 1, 1,
0.390326, -1.127834, 5.122325, 0, 0, 0, 1, 1,
0.3927928, 0.1329163, 1.316414, 0, 0, 0, 1, 1,
0.3964607, -0.9595553, 3.51817, 0, 0, 0, 1, 1,
0.397129, 1.535231, 0.1546577, 0, 0, 0, 1, 1,
0.3992396, 0.8020593, 0.397517, 0, 0, 0, 1, 1,
0.399329, 0.7387835, 1.441805, 1, 1, 1, 1, 1,
0.4005181, 0.7573265, 1.909981, 1, 1, 1, 1, 1,
0.4059026, 0.1172098, 0.683144, 1, 1, 1, 1, 1,
0.4108302, -2.152959, 3.107245, 1, 1, 1, 1, 1,
0.4121224, -0.539247, 2.057376, 1, 1, 1, 1, 1,
0.4191858, 0.3216908, 1.36179, 1, 1, 1, 1, 1,
0.4230957, 0.01624602, 1.337358, 1, 1, 1, 1, 1,
0.4245754, 2.325161, -0.7541517, 1, 1, 1, 1, 1,
0.4256458, 0.4130611, 0.1486908, 1, 1, 1, 1, 1,
0.4269736, -1.490168, 2.746243, 1, 1, 1, 1, 1,
0.4322242, -0.8774511, 2.457325, 1, 1, 1, 1, 1,
0.434833, 1.903337, 2.839146, 1, 1, 1, 1, 1,
0.437247, 1.373133, -0.530518, 1, 1, 1, 1, 1,
0.4376552, -1.117288, 4.292792, 1, 1, 1, 1, 1,
0.4382859, -0.2851846, 3.452458, 1, 1, 1, 1, 1,
0.4427575, -0.02427673, 1.245804, 0, 0, 1, 1, 1,
0.4437187, 0.1649387, 1.475606, 1, 0, 0, 1, 1,
0.4466626, 0.2325121, 0.6268701, 1, 0, 0, 1, 1,
0.4472652, -1.095689, 2.490369, 1, 0, 0, 1, 1,
0.4473975, -0.2686793, 3.7741, 1, 0, 0, 1, 1,
0.4582101, 1.402312, 0.9446851, 1, 0, 0, 1, 1,
0.4629547, 0.6943105, 2.199104, 0, 0, 0, 1, 1,
0.4661033, 0.4794273, -0.6199854, 0, 0, 0, 1, 1,
0.468115, -1.685491, 1.934822, 0, 0, 0, 1, 1,
0.468215, 0.2315235, 1.35698, 0, 0, 0, 1, 1,
0.4698837, 0.4445591, 1.017753, 0, 0, 0, 1, 1,
0.4741512, 1.261367, -1.104384, 0, 0, 0, 1, 1,
0.4750772, -0.378381, 3.504908, 0, 0, 0, 1, 1,
0.4823336, -0.154864, 1.925906, 1, 1, 1, 1, 1,
0.4872828, 0.6319132, 0.05261844, 1, 1, 1, 1, 1,
0.4880514, -2.310797, 3.223847, 1, 1, 1, 1, 1,
0.4959549, 0.5884931, 0.700137, 1, 1, 1, 1, 1,
0.5053052, 0.2034494, 0.7482264, 1, 1, 1, 1, 1,
0.5077829, -0.4892464, 1.396347, 1, 1, 1, 1, 1,
0.508345, 0.2435458, -0.3450462, 1, 1, 1, 1, 1,
0.5107491, 0.4883011, 0.6563076, 1, 1, 1, 1, 1,
0.5118781, 0.09000854, 0.8232388, 1, 1, 1, 1, 1,
0.5150055, -0.946013, 2.342191, 1, 1, 1, 1, 1,
0.5151923, -0.6115596, 1.52004, 1, 1, 1, 1, 1,
0.521137, -0.9326258, 2.098168, 1, 1, 1, 1, 1,
0.5237456, 0.530314, 0.6899021, 1, 1, 1, 1, 1,
0.5247089, -0.4878393, 3.183974, 1, 1, 1, 1, 1,
0.5255032, 0.1350593, 1.008385, 1, 1, 1, 1, 1,
0.5281701, 2.420519, 0.816778, 0, 0, 1, 1, 1,
0.5307544, -1.203788, 2.378251, 1, 0, 0, 1, 1,
0.5353506, 1.250283, 0.2598034, 1, 0, 0, 1, 1,
0.5374649, -1.067216, 2.807463, 1, 0, 0, 1, 1,
0.5376766, -1.470336, 3.270641, 1, 0, 0, 1, 1,
0.5434771, 0.9579489, 0.5463707, 1, 0, 0, 1, 1,
0.5505638, -1.067133, 3.054641, 0, 0, 0, 1, 1,
0.5510395, -1.305911, 2.001343, 0, 0, 0, 1, 1,
0.5524184, 0.640635, 0.4491256, 0, 0, 0, 1, 1,
0.5533063, -0.4214519, 1.248144, 0, 0, 0, 1, 1,
0.5546586, -0.4221175, 1.291453, 0, 0, 0, 1, 1,
0.5616115, 1.324114, 0.07419199, 0, 0, 0, 1, 1,
0.5649844, 2.15037, -0.3178437, 0, 0, 0, 1, 1,
0.5687121, -0.9103073, 4.416808, 1, 1, 1, 1, 1,
0.5698273, 0.196279, 1.898313, 1, 1, 1, 1, 1,
0.5730733, -1.109641, 1.767942, 1, 1, 1, 1, 1,
0.5750123, 0.2845727, 1.352547, 1, 1, 1, 1, 1,
0.5758098, -3.112358, 2.032577, 1, 1, 1, 1, 1,
0.5849913, 0.2448222, 0.4908743, 1, 1, 1, 1, 1,
0.5903981, 0.2077204, 0.5131233, 1, 1, 1, 1, 1,
0.5913529, 1.908779, -1.220267, 1, 1, 1, 1, 1,
0.59139, 1.792673, -0.1284014, 1, 1, 1, 1, 1,
0.5919732, -2.729177, 1.611057, 1, 1, 1, 1, 1,
0.5940516, 0.8320291, -0.2536411, 1, 1, 1, 1, 1,
0.6002922, -1.98215, 3.915536, 1, 1, 1, 1, 1,
0.6018794, 0.3100483, -0.3292522, 1, 1, 1, 1, 1,
0.6048654, -0.3897767, 1.548327, 1, 1, 1, 1, 1,
0.6056572, -0.1471358, 0.7162197, 1, 1, 1, 1, 1,
0.6057105, -0.2797796, 1.882015, 0, 0, 1, 1, 1,
0.6078778, 1.170882, -0.8269544, 1, 0, 0, 1, 1,
0.6099691, 0.6973974, 0.7730044, 1, 0, 0, 1, 1,
0.6140784, -0.7490208, 0.9154252, 1, 0, 0, 1, 1,
0.6146835, 0.2022979, 0.7998959, 1, 0, 0, 1, 1,
0.6157279, -2.080056, 3.613976, 1, 0, 0, 1, 1,
0.6183886, -0.2349737, 2.387828, 0, 0, 0, 1, 1,
0.6198995, 1.60426, 0.4258918, 0, 0, 0, 1, 1,
0.6221873, -0.2641434, 2.185236, 0, 0, 0, 1, 1,
0.6223853, 0.558986, 0.4046495, 0, 0, 0, 1, 1,
0.6239876, 0.9096903, -0.555894, 0, 0, 0, 1, 1,
0.6325759, -2.322213, 3.425249, 0, 0, 0, 1, 1,
0.6337459, -1.013984, 3.46737, 0, 0, 0, 1, 1,
0.638099, 0.9711431, -0.1576232, 1, 1, 1, 1, 1,
0.6388861, -1.992026, 3.260732, 1, 1, 1, 1, 1,
0.6400439, -1.419488, 2.957503, 1, 1, 1, 1, 1,
0.6530684, -0.03525658, 1.520095, 1, 1, 1, 1, 1,
0.6563027, 1.116651, -0.2789294, 1, 1, 1, 1, 1,
0.6570356, 1.170192, 1.552722, 1, 1, 1, 1, 1,
0.6588252, 1.294532, -0.9388938, 1, 1, 1, 1, 1,
0.6594353, 2.757003, -0.9711573, 1, 1, 1, 1, 1,
0.664853, 0.3717546, 1.44683, 1, 1, 1, 1, 1,
0.6709895, -0.4227901, 2.821203, 1, 1, 1, 1, 1,
0.6715727, 1.232364, -0.088835, 1, 1, 1, 1, 1,
0.6730629, 0.3516558, 1.286172, 1, 1, 1, 1, 1,
0.6798618, 1.319588, 2.896996, 1, 1, 1, 1, 1,
0.6811309, 0.4488029, 0.005935388, 1, 1, 1, 1, 1,
0.6835575, 2.329202, -0.6799092, 1, 1, 1, 1, 1,
0.6899244, 1.086685, 0.8653952, 0, 0, 1, 1, 1,
0.6929358, -0.1961694, 0.5173272, 1, 0, 0, 1, 1,
0.6959205, 0.6275832, 1.903272, 1, 0, 0, 1, 1,
0.7083061, 1.349097, 0.478918, 1, 0, 0, 1, 1,
0.7174613, -0.4554717, 1.776086, 1, 0, 0, 1, 1,
0.7182236, -0.5057381, 2.868602, 1, 0, 0, 1, 1,
0.7315378, 0.4857833, 0.254498, 0, 0, 0, 1, 1,
0.7329093, -2.413247, 3.737487, 0, 0, 0, 1, 1,
0.7384899, 1.266337, -0.799193, 0, 0, 0, 1, 1,
0.7398795, -2.405667, 2.943937, 0, 0, 0, 1, 1,
0.7432315, -0.9975742, 2.124861, 0, 0, 0, 1, 1,
0.7442236, -0.1573009, 3.349927, 0, 0, 0, 1, 1,
0.747564, 0.9418958, 0.1584637, 0, 0, 0, 1, 1,
0.7523, -0.5023094, 4.38811, 1, 1, 1, 1, 1,
0.7552021, 2.226183, 0.09743152, 1, 1, 1, 1, 1,
0.762589, -1.151317, 3.015343, 1, 1, 1, 1, 1,
0.7632259, 0.791551, 0.7106097, 1, 1, 1, 1, 1,
0.7731532, -0.9556414, 3.348995, 1, 1, 1, 1, 1,
0.7785668, -0.1252834, 1.850919, 1, 1, 1, 1, 1,
0.7804756, -0.2787395, 0.7505469, 1, 1, 1, 1, 1,
0.7824564, 0.5531013, -0.7121559, 1, 1, 1, 1, 1,
0.7826191, 0.306034, 1.433861, 1, 1, 1, 1, 1,
0.7850689, 0.4233689, 1.437331, 1, 1, 1, 1, 1,
0.7851164, -2.206406, 3.619542, 1, 1, 1, 1, 1,
0.7905506, 0.2393441, 0.5444897, 1, 1, 1, 1, 1,
0.790986, 0.8434053, -0.8945068, 1, 1, 1, 1, 1,
0.7910826, 0.4785627, 1.865597, 1, 1, 1, 1, 1,
0.7922651, 0.2374349, 1.533102, 1, 1, 1, 1, 1,
0.7945102, 1.343598, 0.3013366, 0, 0, 1, 1, 1,
0.8031612, -0.4672943, 2.457587, 1, 0, 0, 1, 1,
0.8080575, 0.07464863, 0.4222786, 1, 0, 0, 1, 1,
0.812618, 0.2683426, 1.406241, 1, 0, 0, 1, 1,
0.8165241, 0.4068534, 0.7456785, 1, 0, 0, 1, 1,
0.8188451, 0.6789625, 2.320033, 1, 0, 0, 1, 1,
0.8220934, -0.3215498, 1.500473, 0, 0, 0, 1, 1,
0.8629042, -1.131004, 3.445593, 0, 0, 0, 1, 1,
0.8665624, -0.5997236, 3.387855, 0, 0, 0, 1, 1,
0.8667499, 0.4952851, 1.759262, 0, 0, 0, 1, 1,
0.8753337, 1.344443, 1.423634, 0, 0, 0, 1, 1,
0.8762516, -0.04096634, -0.3551867, 0, 0, 0, 1, 1,
0.8832842, -1.125013, 3.446231, 0, 0, 0, 1, 1,
0.8835243, -2.03199, 1.202548, 1, 1, 1, 1, 1,
0.8849119, -1.037723, 3.256715, 1, 1, 1, 1, 1,
0.8912893, -2.60656, 2.748785, 1, 1, 1, 1, 1,
0.8956221, -0.7929862, 2.402734, 1, 1, 1, 1, 1,
0.8970898, -0.1196668, 1.01767, 1, 1, 1, 1, 1,
0.8984715, 1.520239, -1.899034, 1, 1, 1, 1, 1,
0.8993323, 0.4972879, 2.114709, 1, 1, 1, 1, 1,
0.9011265, -1.476007, 3.774298, 1, 1, 1, 1, 1,
0.9015679, -0.03606573, 3.243388, 1, 1, 1, 1, 1,
0.9075048, 1.30051, 0.1811771, 1, 1, 1, 1, 1,
0.9096828, 0.8452722, 0.4937973, 1, 1, 1, 1, 1,
0.9156242, -1.140477, 1.364425, 1, 1, 1, 1, 1,
0.9221882, -0.08483302, -0.08007677, 1, 1, 1, 1, 1,
0.9252513, 1.451945, 0.445894, 1, 1, 1, 1, 1,
0.9260763, -1.077034, 2.955376, 1, 1, 1, 1, 1,
0.9283356, -0.01326751, 1.978341, 0, 0, 1, 1, 1,
0.9324223, 0.7818226, 0.966051, 1, 0, 0, 1, 1,
0.9377528, 0.2650308, 2.224262, 1, 0, 0, 1, 1,
0.9502532, -1.645089, 1.869054, 1, 0, 0, 1, 1,
0.955478, 0.02016384, 1.241519, 1, 0, 0, 1, 1,
0.9565515, -0.3186588, 1.872433, 1, 0, 0, 1, 1,
0.967582, 0.8269055, 1.389375, 0, 0, 0, 1, 1,
0.9759489, 1.611876, 1.234697, 0, 0, 0, 1, 1,
0.9767, -0.5530181, 0.5687575, 0, 0, 0, 1, 1,
0.9797219, 0.01659223, -0.6415619, 0, 0, 0, 1, 1,
0.9801868, 0.1962678, 1.273456, 0, 0, 0, 1, 1,
0.9807352, -0.309878, 0.9477915, 0, 0, 0, 1, 1,
0.984254, -0.4469322, -1.169061, 0, 0, 0, 1, 1,
0.9864263, 1.022328, -0.2819071, 1, 1, 1, 1, 1,
0.9905574, -0.1206045, 1.602335, 1, 1, 1, 1, 1,
0.9924217, -0.6553944, 4.195562, 1, 1, 1, 1, 1,
0.9960276, -0.06685828, 3.761086, 1, 1, 1, 1, 1,
0.9963323, -0.2237032, 0.8268954, 1, 1, 1, 1, 1,
1.002312, -0.6046143, 3.476538, 1, 1, 1, 1, 1,
1.021487, -2.206096, 2.067815, 1, 1, 1, 1, 1,
1.025363, 0.7695082, 0.6974228, 1, 1, 1, 1, 1,
1.026824, 0.9120049, 0.7096629, 1, 1, 1, 1, 1,
1.027279, -0.6200839, 0.1009251, 1, 1, 1, 1, 1,
1.032108, 0.6295986, 1.263075, 1, 1, 1, 1, 1,
1.033641, -0.3636424, 1.641596, 1, 1, 1, 1, 1,
1.053966, 0.5630503, -0.895168, 1, 1, 1, 1, 1,
1.05776, 1.130652, -0.3640774, 1, 1, 1, 1, 1,
1.06072, 0.107663, 1.144829, 1, 1, 1, 1, 1,
1.062416, -0.2551035, 1.662538, 0, 0, 1, 1, 1,
1.073294, 0.9500038, 0.7436171, 1, 0, 0, 1, 1,
1.074975, 1.322388, 0.5885708, 1, 0, 0, 1, 1,
1.079766, 0.5629855, 1.644416, 1, 0, 0, 1, 1,
1.084152, -0.8327367, 1.490613, 1, 0, 0, 1, 1,
1.099816, 0.00825202, 2.463087, 1, 0, 0, 1, 1,
1.103297, -0.7591516, 2.696048, 0, 0, 0, 1, 1,
1.105977, 0.1404583, 2.326024, 0, 0, 0, 1, 1,
1.106323, -1.805943, 1.71867, 0, 0, 0, 1, 1,
1.110358, 0.02063061, 1.435272, 0, 0, 0, 1, 1,
1.112256, -0.4228064, 3.830418, 0, 0, 0, 1, 1,
1.127181, -1.159662, 3.990416, 0, 0, 0, 1, 1,
1.13039, 1.198536, -1.540944, 0, 0, 0, 1, 1,
1.133936, -0.5200111, 1.773536, 1, 1, 1, 1, 1,
1.13613, -1.651716, 1.978262, 1, 1, 1, 1, 1,
1.145727, 1.617469, 0.881092, 1, 1, 1, 1, 1,
1.150607, -1.005678, 2.947744, 1, 1, 1, 1, 1,
1.154392, -0.6136817, 3.00175, 1, 1, 1, 1, 1,
1.171674, -0.7042052, 1.868685, 1, 1, 1, 1, 1,
1.172941, -1.277623, 2.615591, 1, 1, 1, 1, 1,
1.176216, 1.277984, 1.009911, 1, 1, 1, 1, 1,
1.183791, 0.5139443, 1.030748, 1, 1, 1, 1, 1,
1.191946, 0.8180805, 1.778829, 1, 1, 1, 1, 1,
1.195798, -0.03824912, 0.5055308, 1, 1, 1, 1, 1,
1.201056, 0.7484451, -0.3388887, 1, 1, 1, 1, 1,
1.206993, 0.3308579, 0.9607366, 1, 1, 1, 1, 1,
1.20732, 1.460835, -0.2543062, 1, 1, 1, 1, 1,
1.209963, -0.02347186, -0.2416005, 1, 1, 1, 1, 1,
1.214781, 0.7095816, 2.139935, 0, 0, 1, 1, 1,
1.230615, 0.0141894, 3.019925, 1, 0, 0, 1, 1,
1.24433, -0.1429786, 1.020453, 1, 0, 0, 1, 1,
1.248401, 1.454877, -0.102477, 1, 0, 0, 1, 1,
1.248886, 1.108554, 0.2809514, 1, 0, 0, 1, 1,
1.250265, 0.09032919, 1.209474, 1, 0, 0, 1, 1,
1.250916, -0.4214275, 2.054043, 0, 0, 0, 1, 1,
1.262588, 0.6203881, 1.672313, 0, 0, 0, 1, 1,
1.272465, 0.1486076, 1.85768, 0, 0, 0, 1, 1,
1.278115, 0.7523559, 1.474036, 0, 0, 0, 1, 1,
1.280829, -0.02259985, 2.391546, 0, 0, 0, 1, 1,
1.292531, -1.044935, 2.874188, 0, 0, 0, 1, 1,
1.295322, -0.8723844, 2.680464, 0, 0, 0, 1, 1,
1.304634, -0.6406418, 1.979105, 1, 1, 1, 1, 1,
1.308697, 1.350861, 0.2776326, 1, 1, 1, 1, 1,
1.331259, 0.9866661, 1.399843, 1, 1, 1, 1, 1,
1.338058, -0.2042132, 1.66028, 1, 1, 1, 1, 1,
1.345612, -1.348851, 3.202724, 1, 1, 1, 1, 1,
1.35228, 0.1090417, 1.128972, 1, 1, 1, 1, 1,
1.361268, -0.1612894, 2.330341, 1, 1, 1, 1, 1,
1.372631, 0.07391557, 1.606585, 1, 1, 1, 1, 1,
1.396837, -1.513084, 3.23671, 1, 1, 1, 1, 1,
1.406939, 0.6756292, 1.886308, 1, 1, 1, 1, 1,
1.407853, 0.2061948, -0.2475715, 1, 1, 1, 1, 1,
1.408101, -0.02941236, -0.9216695, 1, 1, 1, 1, 1,
1.413503, 3.054179, 0.2403675, 1, 1, 1, 1, 1,
1.421247, -1.079687, 3.63647, 1, 1, 1, 1, 1,
1.425187, 2.326436, 1.794778, 1, 1, 1, 1, 1,
1.425395, -0.2376925, 2.670733, 0, 0, 1, 1, 1,
1.436701, 1.218781, 1.265167, 1, 0, 0, 1, 1,
1.443419, -1.099631, 2.348598, 1, 0, 0, 1, 1,
1.445362, 0.7082515, 0.4660565, 1, 0, 0, 1, 1,
1.445898, 0.7119989, 1.588204, 1, 0, 0, 1, 1,
1.457044, -1.974887, -0.287406, 1, 0, 0, 1, 1,
1.464198, -0.9209966, 3.294697, 0, 0, 0, 1, 1,
1.477883, 0.04818569, 0.7737321, 0, 0, 0, 1, 1,
1.481551, 0.8291823, 1.607466, 0, 0, 0, 1, 1,
1.486467, -1.256758, 2.252356, 0, 0, 0, 1, 1,
1.505492, 0.2975317, 0.8253672, 0, 0, 0, 1, 1,
1.510126, -0.8683217, 2.598655, 0, 0, 0, 1, 1,
1.51801, 0.4796244, 2.233458, 0, 0, 0, 1, 1,
1.533311, 0.4793322, 2.910084, 1, 1, 1, 1, 1,
1.535551, 1.906502, 2.027066, 1, 1, 1, 1, 1,
1.536792, 0.4679953, 1.571695, 1, 1, 1, 1, 1,
1.537011, -0.7781478, 1.703155, 1, 1, 1, 1, 1,
1.547612, 0.3311302, 1.170445, 1, 1, 1, 1, 1,
1.554708, -0.3610645, 2.016264, 1, 1, 1, 1, 1,
1.558938, 0.5917176, 2.243279, 1, 1, 1, 1, 1,
1.564316, 0.2934909, 1.631198, 1, 1, 1, 1, 1,
1.582672, 0.5074478, 1.657172, 1, 1, 1, 1, 1,
1.583151, -1.081407, 2.143785, 1, 1, 1, 1, 1,
1.591802, 0.1918395, 2.123455, 1, 1, 1, 1, 1,
1.638376, 1.058276, 1.276578, 1, 1, 1, 1, 1,
1.643323, 0.06058935, 3.185564, 1, 1, 1, 1, 1,
1.652523, 0.2004198, 1.919864, 1, 1, 1, 1, 1,
1.678812, -1.266043, 3.288433, 1, 1, 1, 1, 1,
1.694004, -0.8836338, 2.013054, 0, 0, 1, 1, 1,
1.6993, 0.5790693, 2.782402, 1, 0, 0, 1, 1,
1.70058, 0.3350167, 0.05686555, 1, 0, 0, 1, 1,
1.707596, -0.2652608, 2.932935, 1, 0, 0, 1, 1,
1.70885, 1.210417, -0.3415249, 1, 0, 0, 1, 1,
1.741205, 1.011713, -1.068792, 1, 0, 0, 1, 1,
1.759325, 0.5571643, 1.037927, 0, 0, 0, 1, 1,
1.793139, 0.9485999, 0.1062509, 0, 0, 0, 1, 1,
1.799344, -1.036186, 2.228615, 0, 0, 0, 1, 1,
1.801553, -0.006922235, 1.28447, 0, 0, 0, 1, 1,
1.80949, -0.3046926, 2.577805, 0, 0, 0, 1, 1,
1.884805, 1.175326, 0.7537954, 0, 0, 0, 1, 1,
1.896161, -1.387293, 1.522827, 0, 0, 0, 1, 1,
1.896952, 0.9235345, 1.045118, 1, 1, 1, 1, 1,
1.899454, -0.6161346, 2.123432, 1, 1, 1, 1, 1,
1.922801, -1.331804, 2.692522, 1, 1, 1, 1, 1,
1.928328, -0.00414756, 0.07086156, 1, 1, 1, 1, 1,
1.944399, 0.1253506, 2.149764, 1, 1, 1, 1, 1,
1.976338, 0.5132156, 2.805573, 1, 1, 1, 1, 1,
1.978255, 0.2026724, -0.2793732, 1, 1, 1, 1, 1,
1.987224, 0.4966695, 1.102985, 1, 1, 1, 1, 1,
2.009088, -1.298287, 2.131273, 1, 1, 1, 1, 1,
2.01928, 0.1416143, 2.506154, 1, 1, 1, 1, 1,
2.047521, 0.1346564, 1.023287, 1, 1, 1, 1, 1,
2.06032, -0.841677, 2.930576, 1, 1, 1, 1, 1,
2.069301, -0.7195795, 1.450507, 1, 1, 1, 1, 1,
2.084618, -0.2808726, 3.054422, 1, 1, 1, 1, 1,
2.116415, 0.3620017, 1.36892, 1, 1, 1, 1, 1,
2.147509, -0.09412938, -0.1464531, 0, 0, 1, 1, 1,
2.170039, 0.3321386, 2.859556, 1, 0, 0, 1, 1,
2.193622, 0.1986129, 0.4462011, 1, 0, 0, 1, 1,
2.226373, 0.7592222, -0.2354625, 1, 0, 0, 1, 1,
2.258507, -1.237159, 1.15171, 1, 0, 0, 1, 1,
2.26686, -1.296328, 3.085259, 1, 0, 0, 1, 1,
2.303073, -2.372267, 2.649565, 0, 0, 0, 1, 1,
2.338273, 0.2648876, 1.717625, 0, 0, 0, 1, 1,
2.361719, 0.3799071, 0.9511973, 0, 0, 0, 1, 1,
2.385521, -0.03288542, 1.58987, 0, 0, 0, 1, 1,
2.392246, 0.6749856, 0.7247432, 0, 0, 0, 1, 1,
2.43207, 0.341054, 1.785679, 0, 0, 0, 1, 1,
2.467311, 2.367472, 0.3778054, 0, 0, 0, 1, 1,
2.498924, 0.2075978, 1.616043, 1, 1, 1, 1, 1,
2.52848, 1.875961, 1.651231, 1, 1, 1, 1, 1,
2.536941, 0.1032089, 0.1934048, 1, 1, 1, 1, 1,
2.661638, 1.493737, -0.5662362, 1, 1, 1, 1, 1,
2.751414, -0.5579516, 1.133163, 1, 1, 1, 1, 1,
2.781086, 1.271834, 2.763057, 1, 1, 1, 1, 1,
3.244606, -0.7301048, 2.104136, 1, 1, 1, 1, 1
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
var radius = 9.668784;
var distance = 33.96119;
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
mvMatrix.translate( -0.06323457, 0.02908945, 0.3502636 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96119);
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
