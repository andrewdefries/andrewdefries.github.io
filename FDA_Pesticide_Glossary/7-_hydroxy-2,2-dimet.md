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
-2.724864, -1.214098, -1.295906, 1, 0, 0, 1,
-2.66384, -0.1606379, -1.808527, 1, 0.007843138, 0, 1,
-2.406451, -1.080152, -1.480605, 1, 0.01176471, 0, 1,
-2.393198, -0.2952376, -2.333875, 1, 0.01960784, 0, 1,
-2.352779, 0.0184155, -1.217683, 1, 0.02352941, 0, 1,
-2.344665, -2.229795, -2.287087, 1, 0.03137255, 0, 1,
-2.299779, 1.287986, -1.405857, 1, 0.03529412, 0, 1,
-2.287655, -1.00437, -2.640682, 1, 0.04313726, 0, 1,
-2.266536, -0.7128302, -1.388086, 1, 0.04705882, 0, 1,
-2.249434, -0.3092621, -3.138871, 1, 0.05490196, 0, 1,
-2.218698, 0.2763662, -2.160989, 1, 0.05882353, 0, 1,
-2.178402, 0.5042437, -0.8105404, 1, 0.06666667, 0, 1,
-2.152674, 0.598996, -1.070257, 1, 0.07058824, 0, 1,
-2.138833, 0.690084, -2.2856, 1, 0.07843138, 0, 1,
-2.103917, -0.4195257, -3.082311, 1, 0.08235294, 0, 1,
-2.090732, 0.5493928, -1.626438, 1, 0.09019608, 0, 1,
-2.088151, -2.542223, -1.877741, 1, 0.09411765, 0, 1,
-2.083313, -0.5245292, -1.443043, 1, 0.1019608, 0, 1,
-2.074406, 1.390819, -0.3588003, 1, 0.1098039, 0, 1,
-2.039007, -1.731066, -2.365425, 1, 0.1137255, 0, 1,
-2.012769, -0.1986204, -3.049029, 1, 0.1215686, 0, 1,
-1.998948, 0.5256733, -1.582249, 1, 0.1254902, 0, 1,
-1.915645, 0.493599, -1.117592, 1, 0.1333333, 0, 1,
-1.913832, 0.4663145, 0.3795245, 1, 0.1372549, 0, 1,
-1.880115, -3.699544, -2.023688, 1, 0.145098, 0, 1,
-1.879185, -0.2703887, -0.8310459, 1, 0.1490196, 0, 1,
-1.878363, 0.8896216, -1.244598, 1, 0.1568628, 0, 1,
-1.831861, -0.3505114, -3.483343, 1, 0.1607843, 0, 1,
-1.811937, 0.168021, -1.310059, 1, 0.1686275, 0, 1,
-1.802534, 0.1520913, -1.992319, 1, 0.172549, 0, 1,
-1.797889, -1.496973, -2.419375, 1, 0.1803922, 0, 1,
-1.764897, -1.273866, -2.354842, 1, 0.1843137, 0, 1,
-1.764639, -1.818472, -4.063212, 1, 0.1921569, 0, 1,
-1.742252, -0.4549869, -2.893657, 1, 0.1960784, 0, 1,
-1.735487, -1.301735, -3.038382, 1, 0.2039216, 0, 1,
-1.721207, -0.003321446, -2.626712, 1, 0.2117647, 0, 1,
-1.712243, 0.4788387, -1.11864, 1, 0.2156863, 0, 1,
-1.705991, 0.6826832, -0.4930414, 1, 0.2235294, 0, 1,
-1.697884, -1.547495, -2.750172, 1, 0.227451, 0, 1,
-1.611821, 0.8045585, -2.456959, 1, 0.2352941, 0, 1,
-1.599306, -0.4340303, -1.173255, 1, 0.2392157, 0, 1,
-1.595447, -1.936371, -0.7924906, 1, 0.2470588, 0, 1,
-1.592337, -0.0112713, -2.898466, 1, 0.2509804, 0, 1,
-1.578752, -0.1999348, -2.30372, 1, 0.2588235, 0, 1,
-1.577345, -0.333686, -0.1656091, 1, 0.2627451, 0, 1,
-1.573683, 0.04383447, -0.3744903, 1, 0.2705882, 0, 1,
-1.568832, -1.034286, -1.549801, 1, 0.2745098, 0, 1,
-1.567178, -0.1007453, -3.358484, 1, 0.282353, 0, 1,
-1.565589, 1.316328, -0.9617625, 1, 0.2862745, 0, 1,
-1.56508, 0.8971582, -1.92697, 1, 0.2941177, 0, 1,
-1.563877, 1.083889, -1.340843, 1, 0.3019608, 0, 1,
-1.562119, -2.282656, -2.770882, 1, 0.3058824, 0, 1,
-1.561136, 0.419424, -1.845128, 1, 0.3137255, 0, 1,
-1.549302, -0.8788459, -1.008067, 1, 0.3176471, 0, 1,
-1.543679, -0.5621287, -3.068862, 1, 0.3254902, 0, 1,
-1.535342, 1.426008, 1.133846, 1, 0.3294118, 0, 1,
-1.526479, -0.2861337, -0.4845147, 1, 0.3372549, 0, 1,
-1.524763, -1.187449, -2.137473, 1, 0.3411765, 0, 1,
-1.517903, -0.6330656, -1.31118, 1, 0.3490196, 0, 1,
-1.514896, -0.6556705, -1.244179, 1, 0.3529412, 0, 1,
-1.496696, -0.8668749, -1.789176, 1, 0.3607843, 0, 1,
-1.491503, 0.7122533, -0.7255632, 1, 0.3647059, 0, 1,
-1.484206, -2.198909, -3.061989, 1, 0.372549, 0, 1,
-1.483989, -0.709134, -0.8223088, 1, 0.3764706, 0, 1,
-1.477075, -1.095638, -1.829429, 1, 0.3843137, 0, 1,
-1.474814, 0.2966862, -2.680071, 1, 0.3882353, 0, 1,
-1.470596, -0.1733013, -1.364039, 1, 0.3960784, 0, 1,
-1.460366, 0.4020073, -3.21795, 1, 0.4039216, 0, 1,
-1.458948, 0.9449319, 0.4693988, 1, 0.4078431, 0, 1,
-1.457588, 0.7223009, -2.115749, 1, 0.4156863, 0, 1,
-1.454844, 0.1840443, -1.055431, 1, 0.4196078, 0, 1,
-1.450848, -0.2983276, 0.03111196, 1, 0.427451, 0, 1,
-1.445663, 0.8315215, -0.2039746, 1, 0.4313726, 0, 1,
-1.445627, 0.2733791, 0.3238624, 1, 0.4392157, 0, 1,
-1.443902, 0.7896128, -0.4492713, 1, 0.4431373, 0, 1,
-1.428753, 1.776113, -1.611591, 1, 0.4509804, 0, 1,
-1.407383, 0.1818993, -0.9148172, 1, 0.454902, 0, 1,
-1.396391, 1.747463, -0.8162329, 1, 0.4627451, 0, 1,
-1.395483, 1.010277, -1.498859, 1, 0.4666667, 0, 1,
-1.376582, -0.05617074, -1.963708, 1, 0.4745098, 0, 1,
-1.370834, -0.5469931, -2.486137, 1, 0.4784314, 0, 1,
-1.355211, 2.658872, -1.476642, 1, 0.4862745, 0, 1,
-1.354054, -1.086881, -2.431571, 1, 0.4901961, 0, 1,
-1.350726, -0.2731808, -2.887417, 1, 0.4980392, 0, 1,
-1.34447, 0.3277975, -1.118326, 1, 0.5058824, 0, 1,
-1.337713, -0.625598, -4.420229, 1, 0.509804, 0, 1,
-1.30611, -0.1416472, -3.037803, 1, 0.5176471, 0, 1,
-1.303278, 0.9036241, -1.248482, 1, 0.5215687, 0, 1,
-1.297931, -0.4924643, -1.607293, 1, 0.5294118, 0, 1,
-1.296691, -0.03091136, -0.7109092, 1, 0.5333334, 0, 1,
-1.296032, -0.4734562, -1.561104, 1, 0.5411765, 0, 1,
-1.275152, -0.54798, -1.794071, 1, 0.5450981, 0, 1,
-1.273294, -0.6719723, -4.206441, 1, 0.5529412, 0, 1,
-1.27247, -0.2776695, -1.088805, 1, 0.5568628, 0, 1,
-1.268056, -0.2303714, -1.303218, 1, 0.5647059, 0, 1,
-1.262172, 0.9680519, -2.890336, 1, 0.5686275, 0, 1,
-1.254873, 0.2058944, -0.1533745, 1, 0.5764706, 0, 1,
-1.252523, 0.131323, -1.924988, 1, 0.5803922, 0, 1,
-1.251947, 0.4278182, -2.464247, 1, 0.5882353, 0, 1,
-1.251361, 0.965822, -1.855832, 1, 0.5921569, 0, 1,
-1.250937, -0.05626353, -1.062963, 1, 0.6, 0, 1,
-1.236321, 0.9310321, -0.6323239, 1, 0.6078432, 0, 1,
-1.218052, 0.3988509, -3.097808, 1, 0.6117647, 0, 1,
-1.218049, 0.6308587, 0.06697217, 1, 0.6196079, 0, 1,
-1.215397, -1.131424, -2.533012, 1, 0.6235294, 0, 1,
-1.214882, 0.827041, -0.5149012, 1, 0.6313726, 0, 1,
-1.207097, 1.453774, 0.7370365, 1, 0.6352941, 0, 1,
-1.206587, 1.090657, -0.1096026, 1, 0.6431373, 0, 1,
-1.200699, 1.124224, 1.16472, 1, 0.6470588, 0, 1,
-1.195567, 0.1946109, -1.298226, 1, 0.654902, 0, 1,
-1.19172, 2.022425, -0.08418714, 1, 0.6588235, 0, 1,
-1.186902, 0.7849138, -0.8616338, 1, 0.6666667, 0, 1,
-1.181975, -0.1784194, -1.150418, 1, 0.6705883, 0, 1,
-1.174013, -1.924338, -4.57306, 1, 0.6784314, 0, 1,
-1.170361, -1.932828, -3.633838, 1, 0.682353, 0, 1,
-1.164216, 0.4435724, -0.3404808, 1, 0.6901961, 0, 1,
-1.154258, 0.1909398, -1.67851, 1, 0.6941177, 0, 1,
-1.13658, 0.5547657, -0.7343588, 1, 0.7019608, 0, 1,
-1.135305, -0.1626071, -2.164835, 1, 0.7098039, 0, 1,
-1.130154, -1.425961, -3.642723, 1, 0.7137255, 0, 1,
-1.109952, -0.2571205, -0.7860795, 1, 0.7215686, 0, 1,
-1.104704, -0.9185116, -2.691281, 1, 0.7254902, 0, 1,
-1.100201, 0.6675299, -1.646929, 1, 0.7333333, 0, 1,
-1.097586, 0.1413353, -1.441113, 1, 0.7372549, 0, 1,
-1.080436, 0.5835886, -0.1544381, 1, 0.7450981, 0, 1,
-1.078088, 1.01267, -2.037915, 1, 0.7490196, 0, 1,
-1.072191, 1.368424, -1.396184, 1, 0.7568628, 0, 1,
-1.070888, -0.0517963, -2.050669, 1, 0.7607843, 0, 1,
-1.061551, 0.01474816, -1.779635, 1, 0.7686275, 0, 1,
-1.05766, -0.188885, -2.313168, 1, 0.772549, 0, 1,
-1.052039, -1.092577, -3.206083, 1, 0.7803922, 0, 1,
-1.049083, 1.369081, -0.3203201, 1, 0.7843137, 0, 1,
-1.047384, 1.189623, -2.165301, 1, 0.7921569, 0, 1,
-1.041485, -1.434549, -2.241953, 1, 0.7960784, 0, 1,
-1.037774, 1.071904, 0.7524359, 1, 0.8039216, 0, 1,
-1.037, -0.9833935, -3.200532, 1, 0.8117647, 0, 1,
-1.036259, -0.174307, -2.213542, 1, 0.8156863, 0, 1,
-1.03406, 0.05743551, -1.703085, 1, 0.8235294, 0, 1,
-1.029665, -1.307295, -1.422719, 1, 0.827451, 0, 1,
-1.022107, 0.7250655, -0.3272984, 1, 0.8352941, 0, 1,
-1.021929, -1.058822, -4.377916, 1, 0.8392157, 0, 1,
-1.021875, 1.774815, -0.8890392, 1, 0.8470588, 0, 1,
-1.016887, 0.6458525, 0.4050293, 1, 0.8509804, 0, 1,
-1.016594, 0.1309268, -2.078451, 1, 0.8588235, 0, 1,
-1.015449, 1.423296, -0.9082931, 1, 0.8627451, 0, 1,
-1.014035, 0.1721983, -1.123799, 1, 0.8705882, 0, 1,
-1.012961, -1.633284, -2.850918, 1, 0.8745098, 0, 1,
-1.012648, 0.02056841, -3.987465, 1, 0.8823529, 0, 1,
-1.004534, -1.141262, -2.320286, 1, 0.8862745, 0, 1,
-1.003513, -1.053757, -2.293578, 1, 0.8941177, 0, 1,
-1.000057, -0.7391251, -2.343091, 1, 0.8980392, 0, 1,
-0.9968587, -0.3105407, -1.112936, 1, 0.9058824, 0, 1,
-0.9943983, -0.8030342, -1.553388, 1, 0.9137255, 0, 1,
-0.9934999, -1.029145, -2.035522, 1, 0.9176471, 0, 1,
-0.9854423, 0.3777355, -0.8813369, 1, 0.9254902, 0, 1,
-0.9829421, 0.9788278, 0.4466057, 1, 0.9294118, 0, 1,
-0.9663308, -0.6000372, -1.835411, 1, 0.9372549, 0, 1,
-0.9634658, -0.3649876, -0.6840042, 1, 0.9411765, 0, 1,
-0.963407, 0.245368, -0.189614, 1, 0.9490196, 0, 1,
-0.962833, 0.01016198, 0.003705524, 1, 0.9529412, 0, 1,
-0.9625682, -0.5506886, -2.063569, 1, 0.9607843, 0, 1,
-0.9521154, -0.9257652, -1.371222, 1, 0.9647059, 0, 1,
-0.9494195, 0.5949388, -0.6039974, 1, 0.972549, 0, 1,
-0.9393455, 0.0764768, -1.096555, 1, 0.9764706, 0, 1,
-0.9358252, -1.632669, -1.039682, 1, 0.9843137, 0, 1,
-0.9296678, -0.4181774, -0.4781478, 1, 0.9882353, 0, 1,
-0.928728, 0.0126713, -0.362546, 1, 0.9960784, 0, 1,
-0.9257087, 0.8782436, -0.276612, 0.9960784, 1, 0, 1,
-0.9234607, -0.9529222, -1.699542, 0.9921569, 1, 0, 1,
-0.9184971, -0.4562754, -1.276239, 0.9843137, 1, 0, 1,
-0.9117963, -0.4996777, -1.640472, 0.9803922, 1, 0, 1,
-0.9110596, 0.4190027, -0.1887869, 0.972549, 1, 0, 1,
-0.9085947, -0.7747374, -4.295372, 0.9686275, 1, 0, 1,
-0.9051923, 0.3562469, -0.7713294, 0.9607843, 1, 0, 1,
-0.9021221, -0.9703853, -2.729726, 0.9568627, 1, 0, 1,
-0.901431, 0.1615282, -0.1425767, 0.9490196, 1, 0, 1,
-0.9013214, 1.594247, -0.169386, 0.945098, 1, 0, 1,
-0.8944677, -1.193181, -2.871974, 0.9372549, 1, 0, 1,
-0.8935312, 0.4545025, -0.3611754, 0.9333333, 1, 0, 1,
-0.8846549, 0.1314116, -1.672093, 0.9254902, 1, 0, 1,
-0.8812673, 1.130738, -0.5208401, 0.9215686, 1, 0, 1,
-0.8802225, -0.3909214, -1.727221, 0.9137255, 1, 0, 1,
-0.8779956, -1.005835, 0.1104886, 0.9098039, 1, 0, 1,
-0.8765501, 1.13797, 0.846411, 0.9019608, 1, 0, 1,
-0.8657261, 0.3010536, -1.752789, 0.8941177, 1, 0, 1,
-0.8644968, -1.489019, -1.984955, 0.8901961, 1, 0, 1,
-0.8640374, 1.060766, 0.8196977, 0.8823529, 1, 0, 1,
-0.8519782, 0.02109608, -1.387502, 0.8784314, 1, 0, 1,
-0.8510417, -1.807119, -2.325385, 0.8705882, 1, 0, 1,
-0.8506317, 2.504769, -1.390589, 0.8666667, 1, 0, 1,
-0.8503858, -0.9850112, -2.277408, 0.8588235, 1, 0, 1,
-0.8499069, 0.9634583, -0.6356192, 0.854902, 1, 0, 1,
-0.8451515, 1.217473, -1.212546, 0.8470588, 1, 0, 1,
-0.8402008, 2.439256, -1.661506, 0.8431373, 1, 0, 1,
-0.8387792, 0.8353167, -1.050623, 0.8352941, 1, 0, 1,
-0.8372968, -0.08180515, -0.7370806, 0.8313726, 1, 0, 1,
-0.8310385, 1.480676, -0.1933034, 0.8235294, 1, 0, 1,
-0.830692, -0.1778591, -3.773324, 0.8196079, 1, 0, 1,
-0.829437, -0.4219642, -0.8218353, 0.8117647, 1, 0, 1,
-0.8262407, 0.04711363, -3.28273, 0.8078431, 1, 0, 1,
-0.8198356, 0.7614766, -1.253404, 0.8, 1, 0, 1,
-0.8190556, 0.06011568, -1.962015, 0.7921569, 1, 0, 1,
-0.8149163, 0.881035, 0.1149527, 0.7882353, 1, 0, 1,
-0.8129772, -0.8547512, -1.134931, 0.7803922, 1, 0, 1,
-0.8080526, -1.184935, -1.873309, 0.7764706, 1, 0, 1,
-0.8063207, 0.9230973, -0.4172645, 0.7686275, 1, 0, 1,
-0.7980893, 1.676082, -2.522479, 0.7647059, 1, 0, 1,
-0.797534, 0.389015, -0.6494808, 0.7568628, 1, 0, 1,
-0.7936376, -2.045584, -3.259627, 0.7529412, 1, 0, 1,
-0.7803603, -1.121393, -1.17442, 0.7450981, 1, 0, 1,
-0.7770104, 1.3603, 0.4934675, 0.7411765, 1, 0, 1,
-0.7748588, 1.428682, 0.05451069, 0.7333333, 1, 0, 1,
-0.7674835, 0.4151544, -1.351098, 0.7294118, 1, 0, 1,
-0.7626559, -0.2067394, -1.00559, 0.7215686, 1, 0, 1,
-0.7579065, -1.359556, -1.808486, 0.7176471, 1, 0, 1,
-0.7574763, 1.701955, -0.682337, 0.7098039, 1, 0, 1,
-0.7501792, 1.389582, -2.699283, 0.7058824, 1, 0, 1,
-0.7499734, 0.5649167, -2.268249, 0.6980392, 1, 0, 1,
-0.7470602, -1.883431, -1.976014, 0.6901961, 1, 0, 1,
-0.7465699, -1.851257, -4.301937, 0.6862745, 1, 0, 1,
-0.7404715, -0.257293, -2.174471, 0.6784314, 1, 0, 1,
-0.7389042, 0.5311066, -0.8336536, 0.6745098, 1, 0, 1,
-0.7380641, 0.1274437, -0.5242152, 0.6666667, 1, 0, 1,
-0.7371855, -0.7502497, -3.326945, 0.6627451, 1, 0, 1,
-0.7366507, 0.9986508, -0.6423887, 0.654902, 1, 0, 1,
-0.7362273, 1.912174, 1.498294, 0.6509804, 1, 0, 1,
-0.7350239, -0.3299733, -2.381656, 0.6431373, 1, 0, 1,
-0.7315643, 0.679948, -1.747862, 0.6392157, 1, 0, 1,
-0.7291815, -0.5390298, -1.141333, 0.6313726, 1, 0, 1,
-0.727079, 0.999366, 1.349586, 0.627451, 1, 0, 1,
-0.7258233, 1.61329, -1.310302, 0.6196079, 1, 0, 1,
-0.7235688, -1.319624, -1.626285, 0.6156863, 1, 0, 1,
-0.7190846, 0.6797309, -2.747571, 0.6078432, 1, 0, 1,
-0.7159351, 0.7129415, -0.7996386, 0.6039216, 1, 0, 1,
-0.7142028, 1.471325, -1.251456, 0.5960785, 1, 0, 1,
-0.7112153, 1.115631, 0.6939337, 0.5882353, 1, 0, 1,
-0.7101981, -1.759012, -0.7581774, 0.5843138, 1, 0, 1,
-0.7034516, -0.5616229, -2.464403, 0.5764706, 1, 0, 1,
-0.7025208, -1.600763, -0.5819321, 0.572549, 1, 0, 1,
-0.6965976, -2.404893, -2.398427, 0.5647059, 1, 0, 1,
-0.6811407, -0.5991104, -3.359293, 0.5607843, 1, 0, 1,
-0.6738248, -0.24194, -2.561549, 0.5529412, 1, 0, 1,
-0.6703247, -0.7128459, -1.728907, 0.5490196, 1, 0, 1,
-0.6685174, 1.439774, -0.1292197, 0.5411765, 1, 0, 1,
-0.6602058, -1.7299, -4.061757, 0.5372549, 1, 0, 1,
-0.6580577, -0.112525, -1.118787, 0.5294118, 1, 0, 1,
-0.6517335, -0.203875, -2.503098, 0.5254902, 1, 0, 1,
-0.6497451, -0.09205372, -1.595705, 0.5176471, 1, 0, 1,
-0.6453419, -0.6053179, -2.69355, 0.5137255, 1, 0, 1,
-0.6444098, -1.002093, -2.798085, 0.5058824, 1, 0, 1,
-0.6422037, -1.138959, -2.750101, 0.5019608, 1, 0, 1,
-0.641686, -0.3749448, -0.9569618, 0.4941176, 1, 0, 1,
-0.6399422, 0.0877229, -2.343609, 0.4862745, 1, 0, 1,
-0.6375407, 0.941626, 0.2355657, 0.4823529, 1, 0, 1,
-0.6360978, -0.818532, -4.602019, 0.4745098, 1, 0, 1,
-0.6340487, 0.9556553, 1.900475, 0.4705882, 1, 0, 1,
-0.6314761, -0.2108807, -0.3156719, 0.4627451, 1, 0, 1,
-0.6275997, -0.6025373, -1.079712, 0.4588235, 1, 0, 1,
-0.6256136, 0.2811729, -2.07648, 0.4509804, 1, 0, 1,
-0.6223942, 0.3703853, -1.170921, 0.4470588, 1, 0, 1,
-0.622331, -0.1691831, -2.91524, 0.4392157, 1, 0, 1,
-0.6165918, -1.495218, -2.310324, 0.4352941, 1, 0, 1,
-0.6157692, -2.044037, -4.583744, 0.427451, 1, 0, 1,
-0.6143, 1.748821, -3.251712, 0.4235294, 1, 0, 1,
-0.6138018, 0.6033936, -2.648657, 0.4156863, 1, 0, 1,
-0.6134632, -0.7147592, -2.727097, 0.4117647, 1, 0, 1,
-0.6120034, 2.180479, 0.4332454, 0.4039216, 1, 0, 1,
-0.6106814, -0.6022731, -2.489635, 0.3960784, 1, 0, 1,
-0.6042495, -0.377942, -2.409767, 0.3921569, 1, 0, 1,
-0.6030392, -0.5468032, -0.9517656, 0.3843137, 1, 0, 1,
-0.5937272, -1.467629, -2.783329, 0.3803922, 1, 0, 1,
-0.5880455, -0.2821774, -2.509176, 0.372549, 1, 0, 1,
-0.5853738, -0.09554037, -1.914805, 0.3686275, 1, 0, 1,
-0.5839077, -1.310014, -2.892964, 0.3607843, 1, 0, 1,
-0.5827412, -0.2320725, -1.412811, 0.3568628, 1, 0, 1,
-0.5803462, 0.06817845, -1.846825, 0.3490196, 1, 0, 1,
-0.579591, 0.01576917, -3.010476, 0.345098, 1, 0, 1,
-0.5724829, -0.1340051, -3.106451, 0.3372549, 1, 0, 1,
-0.5703014, 1.965347, 1.575259, 0.3333333, 1, 0, 1,
-0.5680133, -0.4144765, -1.704904, 0.3254902, 1, 0, 1,
-0.5560651, -0.3354423, -1.066125, 0.3215686, 1, 0, 1,
-0.5541961, 0.5242267, -1.202249, 0.3137255, 1, 0, 1,
-0.554063, 1.014736, -0.7910553, 0.3098039, 1, 0, 1,
-0.5506298, -0.9541974, -2.519042, 0.3019608, 1, 0, 1,
-0.5448436, -1.471203, -2.081244, 0.2941177, 1, 0, 1,
-0.5444916, 1.457443, -1.465117, 0.2901961, 1, 0, 1,
-0.5432089, -0.05966921, -3.430128, 0.282353, 1, 0, 1,
-0.5398742, 1.136064, -0.5042087, 0.2784314, 1, 0, 1,
-0.5393434, 1.316311, -0.2064406, 0.2705882, 1, 0, 1,
-0.5370097, -0.4692319, -1.976016, 0.2666667, 1, 0, 1,
-0.5336847, 1.022074, -0.4525099, 0.2588235, 1, 0, 1,
-0.5322126, 1.581266, -0.625984, 0.254902, 1, 0, 1,
-0.5302297, 0.4002854, -1.405463, 0.2470588, 1, 0, 1,
-0.5175725, 0.767047, -0.07880755, 0.2431373, 1, 0, 1,
-0.5144532, 0.1226131, -1.452189, 0.2352941, 1, 0, 1,
-0.5116129, 0.8709073, 0.4585726, 0.2313726, 1, 0, 1,
-0.5085731, -0.48338, -1.957842, 0.2235294, 1, 0, 1,
-0.5075014, 0.2970644, -0.9515377, 0.2196078, 1, 0, 1,
-0.5052017, 0.06402157, -2.963372, 0.2117647, 1, 0, 1,
-0.5050921, -1.051484, -3.636086, 0.2078431, 1, 0, 1,
-0.5028607, 0.2300372, 0.1389169, 0.2, 1, 0, 1,
-0.4999907, 0.7469345, 0.1152131, 0.1921569, 1, 0, 1,
-0.49771, -1.268892, -2.932535, 0.1882353, 1, 0, 1,
-0.495306, -1.042898, -2.73187, 0.1803922, 1, 0, 1,
-0.4948952, 0.7606739, -1.885548, 0.1764706, 1, 0, 1,
-0.4945485, 0.6566344, -2.011408, 0.1686275, 1, 0, 1,
-0.4935993, -0.1651542, -2.361619, 0.1647059, 1, 0, 1,
-0.4927311, -0.6567658, -3.348979, 0.1568628, 1, 0, 1,
-0.4907753, 0.1479413, -2.341747, 0.1529412, 1, 0, 1,
-0.4898551, -0.2773691, -1.982602, 0.145098, 1, 0, 1,
-0.4876551, -1.745148, -2.996611, 0.1411765, 1, 0, 1,
-0.4869071, -1.17227, -2.886692, 0.1333333, 1, 0, 1,
-0.4849947, -0.1995935, -2.814297, 0.1294118, 1, 0, 1,
-0.484297, 1.21231, 0.3349407, 0.1215686, 1, 0, 1,
-0.4780135, -1.07939, -2.857683, 0.1176471, 1, 0, 1,
-0.4718162, -0.1283591, -3.021084, 0.1098039, 1, 0, 1,
-0.4707974, 1.88594, 0.9849132, 0.1058824, 1, 0, 1,
-0.4658549, -0.6586694, -2.72902, 0.09803922, 1, 0, 1,
-0.4652335, -0.905644, -3.111516, 0.09019608, 1, 0, 1,
-0.4635855, -1.774204, -2.035333, 0.08627451, 1, 0, 1,
-0.4631371, -0.6103938, -2.778663, 0.07843138, 1, 0, 1,
-0.4623594, 0.08328975, -1.83436, 0.07450981, 1, 0, 1,
-0.4620591, -0.4284188, -3.007106, 0.06666667, 1, 0, 1,
-0.4603694, 0.2755386, -1.630992, 0.0627451, 1, 0, 1,
-0.4528533, 0.611157, -1.265422, 0.05490196, 1, 0, 1,
-0.4525454, 0.9834496, -1.850887, 0.05098039, 1, 0, 1,
-0.450173, -1.23365, -2.74172, 0.04313726, 1, 0, 1,
-0.4489863, -0.6253532, -1.263041, 0.03921569, 1, 0, 1,
-0.4478433, 1.127172, -0.670393, 0.03137255, 1, 0, 1,
-0.4455565, 2.613662, 0.497255, 0.02745098, 1, 0, 1,
-0.4432302, -0.3871757, -2.580738, 0.01960784, 1, 0, 1,
-0.4403696, -1.313917, -4.415747, 0.01568628, 1, 0, 1,
-0.426523, -0.3665669, -4.353976, 0.007843138, 1, 0, 1,
-0.4240611, -0.001308057, -1.838015, 0.003921569, 1, 0, 1,
-0.4232984, 0.2861648, -1.372036, 0, 1, 0.003921569, 1,
-0.4217699, 0.2134167, -2.416424, 0, 1, 0.01176471, 1,
-0.4153009, -0.1317141, -2.252278, 0, 1, 0.01568628, 1,
-0.4108726, -1.839585, -2.32234, 0, 1, 0.02352941, 1,
-0.4067987, 0.2306749, -0.6647384, 0, 1, 0.02745098, 1,
-0.404567, 0.204425, -2.368088, 0, 1, 0.03529412, 1,
-0.4021011, -0.7113197, -4.433389, 0, 1, 0.03921569, 1,
-0.4009133, -0.9357402, -1.206742, 0, 1, 0.04705882, 1,
-0.3994331, 0.4558403, -0.8470606, 0, 1, 0.05098039, 1,
-0.3970876, -0.7309994, -2.773331, 0, 1, 0.05882353, 1,
-0.3952209, -0.08977062, -3.630689, 0, 1, 0.0627451, 1,
-0.3948012, 0.8555323, 0.3846847, 0, 1, 0.07058824, 1,
-0.3941967, 1.120741, 0.5143912, 0, 1, 0.07450981, 1,
-0.3876111, -0.3825599, -2.77847, 0, 1, 0.08235294, 1,
-0.3831986, 1.357532, -0.3408299, 0, 1, 0.08627451, 1,
-0.3821725, -2.194998, -1.557943, 0, 1, 0.09411765, 1,
-0.3791445, 0.4360265, -0.2993989, 0, 1, 0.1019608, 1,
-0.3759165, -0.1731308, -1.162653, 0, 1, 0.1058824, 1,
-0.3741176, 0.2952691, 0.2066754, 0, 1, 0.1137255, 1,
-0.3715701, 0.429932, 0.8515311, 0, 1, 0.1176471, 1,
-0.3711355, -1.074102, -2.843477, 0, 1, 0.1254902, 1,
-0.3695785, -1.151755, -4.650218, 0, 1, 0.1294118, 1,
-0.3668386, 1.61247, -1.501814, 0, 1, 0.1372549, 1,
-0.3664756, 0.3907386, -2.367723, 0, 1, 0.1411765, 1,
-0.3618284, -0.5114693, -3.754923, 0, 1, 0.1490196, 1,
-0.360533, -1.766337, -2.982812, 0, 1, 0.1529412, 1,
-0.3517677, 0.6872765, 0.7856077, 0, 1, 0.1607843, 1,
-0.3515365, 0.8648332, 0.3492768, 0, 1, 0.1647059, 1,
-0.3401523, -0.6426448, -1.299053, 0, 1, 0.172549, 1,
-0.3374006, 0.3727109, -0.7273727, 0, 1, 0.1764706, 1,
-0.3285468, 0.1538048, -0.4705676, 0, 1, 0.1843137, 1,
-0.3253324, 0.4660797, 0.7033151, 0, 1, 0.1882353, 1,
-0.324132, 0.4696899, -0.9571329, 0, 1, 0.1960784, 1,
-0.3226512, 0.4919787, -1.059501, 0, 1, 0.2039216, 1,
-0.3222297, 0.5971527, -1.754376, 0, 1, 0.2078431, 1,
-0.3211486, 0.6520214, 0.1969669, 0, 1, 0.2156863, 1,
-0.3127249, 0.4059781, -0.2537297, 0, 1, 0.2196078, 1,
-0.3120559, -0.2013158, -3.447973, 0, 1, 0.227451, 1,
-0.3097186, -0.3071643, -1.033931, 0, 1, 0.2313726, 1,
-0.3092337, 0.1687066, 0.4709763, 0, 1, 0.2392157, 1,
-0.3091865, 0.7554432, -1.722033, 0, 1, 0.2431373, 1,
-0.3048949, -0.4974092, -2.882307, 0, 1, 0.2509804, 1,
-0.3039959, -0.05767172, -2.690105, 0, 1, 0.254902, 1,
-0.29963, 0.005293265, -1.466855, 0, 1, 0.2627451, 1,
-0.2954342, -1.147407, -2.442819, 0, 1, 0.2666667, 1,
-0.2912335, -0.7595803, -3.393652, 0, 1, 0.2745098, 1,
-0.2810944, 0.2485174, 0.559269, 0, 1, 0.2784314, 1,
-0.2794017, -1.021805, -2.296365, 0, 1, 0.2862745, 1,
-0.2775738, 1.084165, -0.02673298, 0, 1, 0.2901961, 1,
-0.2775104, -0.6402385, -2.503027, 0, 1, 0.2980392, 1,
-0.2754295, -0.1283145, -0.2033481, 0, 1, 0.3058824, 1,
-0.2744871, -0.7846296, -3.81795, 0, 1, 0.3098039, 1,
-0.2671102, -1.49967, -3.965616, 0, 1, 0.3176471, 1,
-0.2623175, 0.1692216, -0.4928701, 0, 1, 0.3215686, 1,
-0.2606499, -0.5925722, -2.844243, 0, 1, 0.3294118, 1,
-0.2573936, 0.04082996, 1.285741, 0, 1, 0.3333333, 1,
-0.257389, 0.001213274, -1.810043, 0, 1, 0.3411765, 1,
-0.2569256, -2.21966, -2.434656, 0, 1, 0.345098, 1,
-0.2569235, -0.7606428, -1.024514, 0, 1, 0.3529412, 1,
-0.2563666, 0.008659923, -2.141443, 0, 1, 0.3568628, 1,
-0.251565, -1.577054, -3.656003, 0, 1, 0.3647059, 1,
-0.2493235, -0.2643396, -4.508436, 0, 1, 0.3686275, 1,
-0.2480042, 0.01571336, -1.007741, 0, 1, 0.3764706, 1,
-0.2457892, -0.5136974, -4.812388, 0, 1, 0.3803922, 1,
-0.2425937, 2.171667, 0.00966289, 0, 1, 0.3882353, 1,
-0.2383993, -1.342239, -1.887949, 0, 1, 0.3921569, 1,
-0.2365883, -0.5599825, -2.948256, 0, 1, 0.4, 1,
-0.2355506, -0.07970311, -2.808792, 0, 1, 0.4078431, 1,
-0.2353533, 0.5615261, -1.893712, 0, 1, 0.4117647, 1,
-0.2300413, -0.1552813, -3.735395, 0, 1, 0.4196078, 1,
-0.2299411, -0.7908619, -3.547723, 0, 1, 0.4235294, 1,
-0.2259468, -0.3896991, -3.860641, 0, 1, 0.4313726, 1,
-0.2195448, -0.2981484, -1.873239, 0, 1, 0.4352941, 1,
-0.2156078, -0.8347119, -2.798055, 0, 1, 0.4431373, 1,
-0.2145, 1.665964, -1.084936, 0, 1, 0.4470588, 1,
-0.2136082, -0.2840566, -2.160844, 0, 1, 0.454902, 1,
-0.2117591, -0.3791328, -2.237203, 0, 1, 0.4588235, 1,
-0.2080238, -0.001740674, 0.2292662, 0, 1, 0.4666667, 1,
-0.2077108, 0.7727128, -1.305044, 0, 1, 0.4705882, 1,
-0.2042309, -0.6855284, -3.787586, 0, 1, 0.4784314, 1,
-0.2038514, -0.4672509, -1.848478, 0, 1, 0.4823529, 1,
-0.2002584, 0.9629205, 0.07802656, 0, 1, 0.4901961, 1,
-0.1973604, -0.9791189, -4.374277, 0, 1, 0.4941176, 1,
-0.1943675, 0.495563, 0.5824784, 0, 1, 0.5019608, 1,
-0.1909699, -0.6920018, -2.416106, 0, 1, 0.509804, 1,
-0.1867665, -0.4885656, -1.754441, 0, 1, 0.5137255, 1,
-0.1850719, -0.1541683, -2.690788, 0, 1, 0.5215687, 1,
-0.180279, -0.6371609, -3.986671, 0, 1, 0.5254902, 1,
-0.179488, -0.4485756, -2.034954, 0, 1, 0.5333334, 1,
-0.1777217, 0.5000469, 0.03062982, 0, 1, 0.5372549, 1,
-0.1715292, 0.1730591, 0.8167288, 0, 1, 0.5450981, 1,
-0.1711786, 0.3669769, 0.4456413, 0, 1, 0.5490196, 1,
-0.1635098, -0.9076735, -3.779052, 0, 1, 0.5568628, 1,
-0.1633691, 0.941337, 0.361545, 0, 1, 0.5607843, 1,
-0.1578418, 1.248748, -1.218336, 0, 1, 0.5686275, 1,
-0.1557845, 0.2360124, 0.1742089, 0, 1, 0.572549, 1,
-0.1549954, 0.6865431, -0.7773252, 0, 1, 0.5803922, 1,
-0.1546135, 0.02785179, -0.7459365, 0, 1, 0.5843138, 1,
-0.151558, 0.1767156, -1.660357, 0, 1, 0.5921569, 1,
-0.1502797, 0.690658, -0.2079221, 0, 1, 0.5960785, 1,
-0.14894, 1.562531, -0.3443121, 0, 1, 0.6039216, 1,
-0.1484741, -0.05657554, -2.083928, 0, 1, 0.6117647, 1,
-0.1461458, 2.907595, 0.1366081, 0, 1, 0.6156863, 1,
-0.1415933, 0.4789822, -1.817631, 0, 1, 0.6235294, 1,
-0.1371809, -0.752533, -1.07334, 0, 1, 0.627451, 1,
-0.1322262, 0.7693683, 0.2137324, 0, 1, 0.6352941, 1,
-0.1308986, 0.259392, -0.5338656, 0, 1, 0.6392157, 1,
-0.1307803, 0.7458085, 0.2000916, 0, 1, 0.6470588, 1,
-0.1256237, 0.8904145, 0.5695304, 0, 1, 0.6509804, 1,
-0.1248398, -0.9747803, -2.014563, 0, 1, 0.6588235, 1,
-0.1234402, 1.012954, 1.427862, 0, 1, 0.6627451, 1,
-0.1221829, 1.053833, 0.23276, 0, 1, 0.6705883, 1,
-0.121797, -0.446355, -2.280326, 0, 1, 0.6745098, 1,
-0.1184833, -1.241139, -4.112591, 0, 1, 0.682353, 1,
-0.1182734, -0.3671493, -1.421859, 0, 1, 0.6862745, 1,
-0.1154817, 0.763869, 0.6958061, 0, 1, 0.6941177, 1,
-0.1139623, -0.8720047, -2.57989, 0, 1, 0.7019608, 1,
-0.1130668, 0.5358031, 1.925821, 0, 1, 0.7058824, 1,
-0.1120469, 0.9259025, -0.789762, 0, 1, 0.7137255, 1,
-0.1104457, -0.4245092, -4.116905, 0, 1, 0.7176471, 1,
-0.1092653, 1.42099, -1.567407, 0, 1, 0.7254902, 1,
-0.1078082, 2.235131, 0.4127706, 0, 1, 0.7294118, 1,
-0.1026607, -0.2412661, -2.743347, 0, 1, 0.7372549, 1,
-0.1010363, 0.01550699, -0.5790249, 0, 1, 0.7411765, 1,
-0.09800664, -1.627638, -4.056842, 0, 1, 0.7490196, 1,
-0.0965775, 0.249953, -0.05639542, 0, 1, 0.7529412, 1,
-0.09458525, -1.349741, -4.09311, 0, 1, 0.7607843, 1,
-0.08568865, 0.2923231, -2.29749, 0, 1, 0.7647059, 1,
-0.08432832, -0.759297, -4.549966, 0, 1, 0.772549, 1,
-0.08362983, 0.0260401, -1.782262, 0, 1, 0.7764706, 1,
-0.07159996, 1.344322, 0.1750844, 0, 1, 0.7843137, 1,
-0.06970032, 2.241528, -1.002498, 0, 1, 0.7882353, 1,
-0.06938548, -0.7244735, -2.603055, 0, 1, 0.7960784, 1,
-0.06589069, -0.3647403, -4.673296, 0, 1, 0.8039216, 1,
-0.06266502, -1.646197, -5.229923, 0, 1, 0.8078431, 1,
-0.06150414, -1.240721, -3.867082, 0, 1, 0.8156863, 1,
-0.06076495, -0.5439759, -3.255872, 0, 1, 0.8196079, 1,
-0.05816817, -0.3861839, -1.74674, 0, 1, 0.827451, 1,
-0.05458479, -2.630071, -1.323401, 0, 1, 0.8313726, 1,
-0.05370571, 0.6080911, -1.640568, 0, 1, 0.8392157, 1,
-0.04952456, 0.721774, 0.7848461, 0, 1, 0.8431373, 1,
-0.04708562, 0.9254257, -0.7276381, 0, 1, 0.8509804, 1,
-0.04407119, -0.003164334, -2.827975, 0, 1, 0.854902, 1,
-0.04344791, 1.380652, -0.2026732, 0, 1, 0.8627451, 1,
-0.04210194, 0.9140863, 0.09999272, 0, 1, 0.8666667, 1,
-0.04193974, 0.3027901, -0.6513193, 0, 1, 0.8745098, 1,
-0.0417444, 1.98843, 1.170949, 0, 1, 0.8784314, 1,
-0.04111166, 0.612729, 0.1467545, 0, 1, 0.8862745, 1,
-0.03997706, -0.06039777, -4.04265, 0, 1, 0.8901961, 1,
-0.03952582, -0.1323503, -2.713296, 0, 1, 0.8980392, 1,
-0.03515165, -1.276788, -2.976927, 0, 1, 0.9058824, 1,
-0.03514609, -0.8533713, -4.664793, 0, 1, 0.9098039, 1,
-0.03264609, -0.8665532, -1.921435, 0, 1, 0.9176471, 1,
-0.03169746, 0.2344147, -0.9831006, 0, 1, 0.9215686, 1,
-0.03132675, 1.193289, 0.9570547, 0, 1, 0.9294118, 1,
-0.02990759, 1.946199, 0.4449086, 0, 1, 0.9333333, 1,
-0.02893445, -1.453893, -5.364134, 0, 1, 0.9411765, 1,
-0.02885629, -0.006852164, 0.4617429, 0, 1, 0.945098, 1,
-0.02064992, 0.1629779, -0.9754681, 0, 1, 0.9529412, 1,
-0.02024886, 0.9375514, 0.264376, 0, 1, 0.9568627, 1,
-0.0186143, -0.6649763, -2.4026, 0, 1, 0.9647059, 1,
-0.01493966, -0.3269147, -4.282815, 0, 1, 0.9686275, 1,
-0.01326353, 0.09111825, -0.0413231, 0, 1, 0.9764706, 1,
-0.01208317, -1.045789, -5.056499, 0, 1, 0.9803922, 1,
-0.007936529, -1.338449, -4.763448, 0, 1, 0.9882353, 1,
-0.006636454, -1.057782, -1.32062, 0, 1, 0.9921569, 1,
-0.006273177, -0.6702702, -4.511494, 0, 1, 1, 1,
-0.005228126, -0.6315783, -3.162849, 0, 0.9921569, 1, 1,
-0.003874089, 0.5900216, -0.2603295, 0, 0.9882353, 1, 1,
-0.0001515066, 0.4844496, 0.5978334, 0, 0.9803922, 1, 1,
0.0001027893, -0.03951699, 4.698365, 0, 0.9764706, 1, 1,
0.001391233, 1.239889, 0.07217754, 0, 0.9686275, 1, 1,
0.002822764, -0.6425371, 3.735553, 0, 0.9647059, 1, 1,
0.003939497, -1.517048, 4.344265, 0, 0.9568627, 1, 1,
0.004444041, -0.3867444, 2.716019, 0, 0.9529412, 1, 1,
0.006012812, -0.3816502, 2.572771, 0, 0.945098, 1, 1,
0.008068477, -1.899032, 4.914867, 0, 0.9411765, 1, 1,
0.01126595, -0.6344737, 2.820349, 0, 0.9333333, 1, 1,
0.01357032, 0.4515368, -1.570707, 0, 0.9294118, 1, 1,
0.01569038, -0.2260506, 2.813873, 0, 0.9215686, 1, 1,
0.02145813, 0.5097693, 0.1943175, 0, 0.9176471, 1, 1,
0.02234827, 0.4535957, 0.2587277, 0, 0.9098039, 1, 1,
0.02565558, -0.4723155, 2.363809, 0, 0.9058824, 1, 1,
0.03228142, 1.101832, 2.039401, 0, 0.8980392, 1, 1,
0.03266307, 1.600937, 0.5133302, 0, 0.8901961, 1, 1,
0.03415194, -1.414136, 3.062543, 0, 0.8862745, 1, 1,
0.03524231, -0.07132626, 0.1222264, 0, 0.8784314, 1, 1,
0.036864, -1.029957, 3.421896, 0, 0.8745098, 1, 1,
0.03719584, -0.5299737, 3.832918, 0, 0.8666667, 1, 1,
0.03821136, 0.6254802, -0.01607705, 0, 0.8627451, 1, 1,
0.04252992, -0.7246683, 2.748966, 0, 0.854902, 1, 1,
0.05019078, -0.7946642, 4.151208, 0, 0.8509804, 1, 1,
0.05063801, 0.4846161, 0.8212505, 0, 0.8431373, 1, 1,
0.06280646, -1.194274, 1.64868, 0, 0.8392157, 1, 1,
0.06640488, -0.8586537, 3.006104, 0, 0.8313726, 1, 1,
0.07867655, 0.2501446, 1.486365, 0, 0.827451, 1, 1,
0.08126877, 0.1611906, 1.121133, 0, 0.8196079, 1, 1,
0.08480035, 0.8343073, 1.878986, 0, 0.8156863, 1, 1,
0.08819804, -0.3289747, 2.922797, 0, 0.8078431, 1, 1,
0.09472187, 1.094785, 0.8046353, 0, 0.8039216, 1, 1,
0.0960454, 0.5030556, 0.640923, 0, 0.7960784, 1, 1,
0.09855212, -1.765695, 2.147624, 0, 0.7882353, 1, 1,
0.1000456, 1.199321, 0.1922235, 0, 0.7843137, 1, 1,
0.1017836, -0.6470907, 3.450935, 0, 0.7764706, 1, 1,
0.1025057, 0.06475871, -0.03977003, 0, 0.772549, 1, 1,
0.1035255, 0.5751139, 1.395336, 0, 0.7647059, 1, 1,
0.1042554, -2.321558, 3.699708, 0, 0.7607843, 1, 1,
0.1072208, -0.2832069, 1.0545, 0, 0.7529412, 1, 1,
0.1077484, -2.052376, 3.237924, 0, 0.7490196, 1, 1,
0.1085508, 0.558493, 0.1204916, 0, 0.7411765, 1, 1,
0.1096956, 1.032718, -1.056243, 0, 0.7372549, 1, 1,
0.1102864, 0.7719894, 1.206193, 0, 0.7294118, 1, 1,
0.1139241, 2.416974, 2.273533, 0, 0.7254902, 1, 1,
0.1145944, 1.830698, 1.301983, 0, 0.7176471, 1, 1,
0.1157127, -0.1895972, 2.7999, 0, 0.7137255, 1, 1,
0.1172459, -1.299576, 2.86764, 0, 0.7058824, 1, 1,
0.1199807, 0.3379115, 0.6619061, 0, 0.6980392, 1, 1,
0.1250469, 0.5885191, 0.5834383, 0, 0.6941177, 1, 1,
0.1268899, 0.8122004, -0.3956311, 0, 0.6862745, 1, 1,
0.1301557, -0.2034596, 1.825436, 0, 0.682353, 1, 1,
0.1307663, -1.571082, 2.957095, 0, 0.6745098, 1, 1,
0.1338153, -0.7481468, 3.063421, 0, 0.6705883, 1, 1,
0.1341916, 1.494748, 0.2798129, 0, 0.6627451, 1, 1,
0.1365187, 0.4460014, -0.7880042, 0, 0.6588235, 1, 1,
0.140057, -1.130774, 2.170243, 0, 0.6509804, 1, 1,
0.1415979, -0.1376206, 2.578044, 0, 0.6470588, 1, 1,
0.1429727, 1.274906, 0.3624896, 0, 0.6392157, 1, 1,
0.1478309, -0.5016351, 2.820919, 0, 0.6352941, 1, 1,
0.1491076, -0.6972925, 2.05987, 0, 0.627451, 1, 1,
0.1499026, -0.205582, 1.382045, 0, 0.6235294, 1, 1,
0.1525919, 0.1772676, -0.515906, 0, 0.6156863, 1, 1,
0.1560899, 0.1316453, 0.5630633, 0, 0.6117647, 1, 1,
0.1606561, -0.3923205, 0.8389208, 0, 0.6039216, 1, 1,
0.1632185, 1.866485, -1.108008, 0, 0.5960785, 1, 1,
0.1641789, 0.6447337, 0.6661581, 0, 0.5921569, 1, 1,
0.1654672, -0.06636618, 2.835904, 0, 0.5843138, 1, 1,
0.1658496, 0.0465233, 1.917617, 0, 0.5803922, 1, 1,
0.1672557, 0.9103265, 0.6504625, 0, 0.572549, 1, 1,
0.1694032, 0.1509154, -0.156224, 0, 0.5686275, 1, 1,
0.1701901, -0.6819518, 3.107503, 0, 0.5607843, 1, 1,
0.1708011, 1.56308, -0.08067919, 0, 0.5568628, 1, 1,
0.1829067, 0.1290821, 0.132733, 0, 0.5490196, 1, 1,
0.1844766, 0.7482798, 0.4413082, 0, 0.5450981, 1, 1,
0.1882069, 0.6232008, -0.7694871, 0, 0.5372549, 1, 1,
0.1899668, 0.4609372, -1.574651, 0, 0.5333334, 1, 1,
0.1910579, -0.5402218, 4.023155, 0, 0.5254902, 1, 1,
0.1933503, -0.6901752, 2.861965, 0, 0.5215687, 1, 1,
0.1944308, -0.5432739, 3.4713, 0, 0.5137255, 1, 1,
0.195582, -0.962397, 2.766323, 0, 0.509804, 1, 1,
0.1960441, 1.834783, 0.3667002, 0, 0.5019608, 1, 1,
0.1969065, -1.086424, 3.653164, 0, 0.4941176, 1, 1,
0.2004537, 1.523217, -0.1239452, 0, 0.4901961, 1, 1,
0.2069825, -0.3796306, 3.021522, 0, 0.4823529, 1, 1,
0.2085124, -1.70748, 2.880855, 0, 0.4784314, 1, 1,
0.2129978, -0.7349498, 2.650968, 0, 0.4705882, 1, 1,
0.2218895, 0.9181236, -0.4348246, 0, 0.4666667, 1, 1,
0.2227843, 0.7178577, -0.2885114, 0, 0.4588235, 1, 1,
0.2248422, -0.5494434, 2.467584, 0, 0.454902, 1, 1,
0.2285939, -0.9337311, 3.255798, 0, 0.4470588, 1, 1,
0.2287275, -1.203468, 4.114452, 0, 0.4431373, 1, 1,
0.2302365, -0.1084531, 2.437914, 0, 0.4352941, 1, 1,
0.2341587, 0.5781494, 0.8394687, 0, 0.4313726, 1, 1,
0.2388947, 0.46624, 1.943247, 0, 0.4235294, 1, 1,
0.2428655, -1.33771, 2.578623, 0, 0.4196078, 1, 1,
0.2524931, 0.5354745, -1.136888, 0, 0.4117647, 1, 1,
0.2544673, -1.922544, 3.273885, 0, 0.4078431, 1, 1,
0.2566542, -0.6969829, 2.860769, 0, 0.4, 1, 1,
0.2614459, -0.6700504, 2.978953, 0, 0.3921569, 1, 1,
0.2614814, -0.310601, 1.003715, 0, 0.3882353, 1, 1,
0.2665761, -1.048199, 3.037252, 0, 0.3803922, 1, 1,
0.2667526, 0.4191117, 0.4904913, 0, 0.3764706, 1, 1,
0.2668076, 0.7982561, 0.9851211, 0, 0.3686275, 1, 1,
0.2787569, -0.9701179, 3.1217, 0, 0.3647059, 1, 1,
0.2803134, 0.2416138, 0.838127, 0, 0.3568628, 1, 1,
0.2805196, -1.004943, 2.387601, 0, 0.3529412, 1, 1,
0.2818762, 1.236772, -0.9246127, 0, 0.345098, 1, 1,
0.2867376, 0.1979806, 0.4920028, 0, 0.3411765, 1, 1,
0.2927969, 1.765715, 1.083243, 0, 0.3333333, 1, 1,
0.2932227, -0.4046805, 4.354546, 0, 0.3294118, 1, 1,
0.2938853, -1.559594, 3.684757, 0, 0.3215686, 1, 1,
0.2967928, 1.061397, 1.087454, 0, 0.3176471, 1, 1,
0.2976711, -0.5385068, 3.631107, 0, 0.3098039, 1, 1,
0.2982661, 1.414634, 0.7592109, 0, 0.3058824, 1, 1,
0.3008547, 1.125664, 0.9688628, 0, 0.2980392, 1, 1,
0.3011669, -0.3688521, 3.673585, 0, 0.2901961, 1, 1,
0.302519, -0.3213547, 0.6006573, 0, 0.2862745, 1, 1,
0.3049661, -0.1462142, 1.910454, 0, 0.2784314, 1, 1,
0.3053254, -0.9916211, 2.99324, 0, 0.2745098, 1, 1,
0.3062012, 0.09089873, -0.01467401, 0, 0.2666667, 1, 1,
0.306311, -0.476726, 1.554158, 0, 0.2627451, 1, 1,
0.3077846, -2.249925, 3.286175, 0, 0.254902, 1, 1,
0.3091634, 0.2011977, 0.8308115, 0, 0.2509804, 1, 1,
0.3093049, -0.2110464, 1.374335, 0, 0.2431373, 1, 1,
0.3110183, -0.5824059, 2.968851, 0, 0.2392157, 1, 1,
0.3110558, 0.4280101, 1.179185, 0, 0.2313726, 1, 1,
0.3120184, -0.9433505, 3.62906, 0, 0.227451, 1, 1,
0.3161499, -0.9609525, 1.334083, 0, 0.2196078, 1, 1,
0.3173971, 0.5484744, 0.293954, 0, 0.2156863, 1, 1,
0.3188422, 0.4256195, 3.084443, 0, 0.2078431, 1, 1,
0.3202653, -0.2283544, 0.02646559, 0, 0.2039216, 1, 1,
0.3226963, 1.43721, 0.9021118, 0, 0.1960784, 1, 1,
0.3229076, 0.2011491, 1.738767, 0, 0.1882353, 1, 1,
0.3239296, -0.3613853, 2.200373, 0, 0.1843137, 1, 1,
0.3261283, -0.2920382, 2.199337, 0, 0.1764706, 1, 1,
0.3303254, -0.4039565, 1.87562, 0, 0.172549, 1, 1,
0.3305645, 0.3299776, -0.08724815, 0, 0.1647059, 1, 1,
0.3357582, -1.793031, 3.530644, 0, 0.1607843, 1, 1,
0.3389212, -1.696747, 3.410825, 0, 0.1529412, 1, 1,
0.3396863, 0.01271582, 1.487797, 0, 0.1490196, 1, 1,
0.346412, 0.3104799, 0.223765, 0, 0.1411765, 1, 1,
0.3570275, -0.5096341, 1.047315, 0, 0.1372549, 1, 1,
0.3649534, -0.2253836, 0.3332896, 0, 0.1294118, 1, 1,
0.3690993, 1.028659, -0.003689217, 0, 0.1254902, 1, 1,
0.3696779, 1.840508, 0.4390834, 0, 0.1176471, 1, 1,
0.3768112, -1.843372, 2.861418, 0, 0.1137255, 1, 1,
0.3776103, 0.4167115, 1.418664, 0, 0.1058824, 1, 1,
0.3792242, -0.05787551, 2.277341, 0, 0.09803922, 1, 1,
0.3794749, -0.7162206, 3.288965, 0, 0.09411765, 1, 1,
0.3902557, -0.933708, 2.637578, 0, 0.08627451, 1, 1,
0.3956386, -1.793177, 2.192755, 0, 0.08235294, 1, 1,
0.3957154, 2.051968, 1.054142, 0, 0.07450981, 1, 1,
0.3958203, 0.5990524, 0.3901687, 0, 0.07058824, 1, 1,
0.3969264, -1.638319, 2.89637, 0, 0.0627451, 1, 1,
0.4004174, -1.06066, 3.882949, 0, 0.05882353, 1, 1,
0.4022081, 3.060272, -0.1181755, 0, 0.05098039, 1, 1,
0.4037497, -0.7892653, 1.699988, 0, 0.04705882, 1, 1,
0.4054427, -0.2571701, 2.422488, 0, 0.03921569, 1, 1,
0.4058075, -0.2962259, 0.2740698, 0, 0.03529412, 1, 1,
0.4099532, -0.1558768, 2.276806, 0, 0.02745098, 1, 1,
0.4129852, -0.3559111, 1.06726, 0, 0.02352941, 1, 1,
0.413005, -1.316014, 2.351836, 0, 0.01568628, 1, 1,
0.4133999, -0.4321322, 2.619296, 0, 0.01176471, 1, 1,
0.4169566, -1.202664, 1.996984, 0, 0.003921569, 1, 1,
0.4194331, 0.07245268, 3.3372, 0.003921569, 0, 1, 1,
0.4199037, 1.580086, 0.07027022, 0.007843138, 0, 1, 1,
0.4216112, -0.3575301, 1.615336, 0.01568628, 0, 1, 1,
0.421672, -0.1500313, 0.7638915, 0.01960784, 0, 1, 1,
0.424769, -0.3463198, 3.164599, 0.02745098, 0, 1, 1,
0.4285718, 2.830521, 0.8263543, 0.03137255, 0, 1, 1,
0.430274, 0.1250957, 1.860287, 0.03921569, 0, 1, 1,
0.436548, 0.4141089, -0.1172375, 0.04313726, 0, 1, 1,
0.4370016, 1.591803, 0.5915116, 0.05098039, 0, 1, 1,
0.44108, 0.86573, 1.827468, 0.05490196, 0, 1, 1,
0.4423153, -0.9644666, 1.910498, 0.0627451, 0, 1, 1,
0.4424399, -0.2569544, 2.74553, 0.06666667, 0, 1, 1,
0.4454211, -0.2025765, 1.195879, 0.07450981, 0, 1, 1,
0.4519157, -0.5478559, 3.951948, 0.07843138, 0, 1, 1,
0.453453, -0.05176466, 1.583661, 0.08627451, 0, 1, 1,
0.4551431, 1.287385, 0.8977735, 0.09019608, 0, 1, 1,
0.4610353, 0.3960369, 0.8690028, 0.09803922, 0, 1, 1,
0.4615539, 1.821671, 2.300815, 0.1058824, 0, 1, 1,
0.4622973, -0.004332646, 1.148492, 0.1098039, 0, 1, 1,
0.4691521, -1.628639, 3.67214, 0.1176471, 0, 1, 1,
0.4708129, -1.303525, 0.4128965, 0.1215686, 0, 1, 1,
0.4743478, 0.897237, -0.6328827, 0.1294118, 0, 1, 1,
0.4809316, 0.7472653, 0.8686575, 0.1333333, 0, 1, 1,
0.4843483, -2.3368, 2.106348, 0.1411765, 0, 1, 1,
0.4860766, -0.1910563, 1.1167, 0.145098, 0, 1, 1,
0.4881342, -0.3150521, 1.763713, 0.1529412, 0, 1, 1,
0.4951801, 0.9124954, 1.437006, 0.1568628, 0, 1, 1,
0.5013007, -1.513858, 0.8631229, 0.1647059, 0, 1, 1,
0.5013111, 0.7819628, -0.4536306, 0.1686275, 0, 1, 1,
0.5053933, 0.0282464, 1.367398, 0.1764706, 0, 1, 1,
0.5072138, 0.2747938, 1.528294, 0.1803922, 0, 1, 1,
0.5136315, -0.6630897, 1.244621, 0.1882353, 0, 1, 1,
0.5137515, 0.6070971, 0.1966727, 0.1921569, 0, 1, 1,
0.5151993, -1.010777, 2.679355, 0.2, 0, 1, 1,
0.5165524, 1.117537, 0.5660927, 0.2078431, 0, 1, 1,
0.5189342, -2.049316, 6.338706, 0.2117647, 0, 1, 1,
0.5206701, 1.122624, 1.120671, 0.2196078, 0, 1, 1,
0.5348347, 0.02423551, 0.9622681, 0.2235294, 0, 1, 1,
0.5378474, 0.2495106, 3.517095, 0.2313726, 0, 1, 1,
0.5522125, -1.570397, 2.896196, 0.2352941, 0, 1, 1,
0.5582551, -2.192028, 2.234802, 0.2431373, 0, 1, 1,
0.5728273, 0.06506015, 2.363936, 0.2470588, 0, 1, 1,
0.5767856, -2.146003, 2.13606, 0.254902, 0, 1, 1,
0.5794966, -0.1122298, 2.142302, 0.2588235, 0, 1, 1,
0.5820825, -0.6006622, 2.150071, 0.2666667, 0, 1, 1,
0.5828009, -3.078863, 2.526934, 0.2705882, 0, 1, 1,
0.5842069, 0.5622221, 0.240458, 0.2784314, 0, 1, 1,
0.5847436, 0.4510453, 2.81309, 0.282353, 0, 1, 1,
0.5855615, -0.04602378, -0.2590566, 0.2901961, 0, 1, 1,
0.5954832, 1.76839, -1.663195, 0.2941177, 0, 1, 1,
0.5977495, 0.5713823, 1.876407, 0.3019608, 0, 1, 1,
0.6006259, -1.422127, 1.391751, 0.3098039, 0, 1, 1,
0.6044819, 0.4081499, 0.9927194, 0.3137255, 0, 1, 1,
0.6050659, 0.949392, 1.695887, 0.3215686, 0, 1, 1,
0.6080008, 1.164605, -0.1865754, 0.3254902, 0, 1, 1,
0.6080256, 0.5212076, 1.475363, 0.3333333, 0, 1, 1,
0.6114379, -0.8630104, 1.600822, 0.3372549, 0, 1, 1,
0.6123053, -0.7853747, 2.773472, 0.345098, 0, 1, 1,
0.612551, -0.5837886, 2.257885, 0.3490196, 0, 1, 1,
0.6183541, -0.825674, 2.790168, 0.3568628, 0, 1, 1,
0.6219053, 0.8951811, 1.281579, 0.3607843, 0, 1, 1,
0.6324686, 0.3395432, 0.556152, 0.3686275, 0, 1, 1,
0.6377532, -1.648913, 2.614911, 0.372549, 0, 1, 1,
0.6428412, -2.265918, 1.728572, 0.3803922, 0, 1, 1,
0.6492968, 0.3090215, 1.32222, 0.3843137, 0, 1, 1,
0.6503536, 0.2944806, 1.193609, 0.3921569, 0, 1, 1,
0.6522999, -0.3989501, 1.301316, 0.3960784, 0, 1, 1,
0.6547176, 0.1038074, 0.9903644, 0.4039216, 0, 1, 1,
0.6563956, 0.01298886, 2.65114, 0.4117647, 0, 1, 1,
0.6573814, 0.406073, -0.1033485, 0.4156863, 0, 1, 1,
0.6599753, -0.5669785, 2.023237, 0.4235294, 0, 1, 1,
0.6638449, 1.783548, 1.053404, 0.427451, 0, 1, 1,
0.6646862, 0.6933196, 1.661082, 0.4352941, 0, 1, 1,
0.6722507, 1.76544, 0.3999814, 0.4392157, 0, 1, 1,
0.6790771, -0.5218973, 1.28081, 0.4470588, 0, 1, 1,
0.6791102, 0.3752251, 0.7725226, 0.4509804, 0, 1, 1,
0.6864744, 0.2417084, 1.478013, 0.4588235, 0, 1, 1,
0.6865631, -0.4659752, 0.3311571, 0.4627451, 0, 1, 1,
0.6866282, 0.4959804, -0.9055004, 0.4705882, 0, 1, 1,
0.6886252, 0.03185293, -0.4474178, 0.4745098, 0, 1, 1,
0.6934248, -1.931762, 2.896285, 0.4823529, 0, 1, 1,
0.6956595, -1.210397, 2.948883, 0.4862745, 0, 1, 1,
0.6994338, 1.818595, -1.390099, 0.4941176, 0, 1, 1,
0.7075955, 0.8957811, 1.922146, 0.5019608, 0, 1, 1,
0.708344, -1.090521, 3.195767, 0.5058824, 0, 1, 1,
0.7162808, -1.398076, 2.039642, 0.5137255, 0, 1, 1,
0.7184953, -1.078517, 1.939399, 0.5176471, 0, 1, 1,
0.7225385, -0.9179568, 4.212421, 0.5254902, 0, 1, 1,
0.7257321, -0.3553278, 2.598747, 0.5294118, 0, 1, 1,
0.7279284, 0.7206666, 0.8389372, 0.5372549, 0, 1, 1,
0.7288704, -0.2246715, 1.516223, 0.5411765, 0, 1, 1,
0.7295966, -0.2583379, 1.27361, 0.5490196, 0, 1, 1,
0.7297459, -1.111706, 1.872311, 0.5529412, 0, 1, 1,
0.7311118, -1.525974, 1.370258, 0.5607843, 0, 1, 1,
0.7325008, -1.034757, 1.896119, 0.5647059, 0, 1, 1,
0.7330191, 0.9444772, 0.9186224, 0.572549, 0, 1, 1,
0.7389385, 1.039352, -0.9533108, 0.5764706, 0, 1, 1,
0.742269, 0.122374, 2.042386, 0.5843138, 0, 1, 1,
0.7500886, 2.265165, 0.8152425, 0.5882353, 0, 1, 1,
0.7537622, -0.5015655, 1.340068, 0.5960785, 0, 1, 1,
0.7605524, 0.3891123, 1.674647, 0.6039216, 0, 1, 1,
0.7696452, -0.4797161, 1.908276, 0.6078432, 0, 1, 1,
0.7698379, 0.3878335, 2.220969, 0.6156863, 0, 1, 1,
0.7723336, -0.1449822, 3.018736, 0.6196079, 0, 1, 1,
0.7772382, -0.4259587, 2.20384, 0.627451, 0, 1, 1,
0.786087, 0.5204578, 1.553904, 0.6313726, 0, 1, 1,
0.7921247, -0.8943995, 1.704149, 0.6392157, 0, 1, 1,
0.7981161, -0.07320301, 2.96864, 0.6431373, 0, 1, 1,
0.8128346, 0.2687505, 1.754408, 0.6509804, 0, 1, 1,
0.8175126, -1.162526, 3.11289, 0.654902, 0, 1, 1,
0.8262525, -1.252245, 2.801265, 0.6627451, 0, 1, 1,
0.8271623, 0.2128974, 1.956525, 0.6666667, 0, 1, 1,
0.8272408, 0.9873622, 0.3632019, 0.6745098, 0, 1, 1,
0.8292947, 0.1002509, -0.409197, 0.6784314, 0, 1, 1,
0.8305218, 0.005004251, 2.241017, 0.6862745, 0, 1, 1,
0.8312839, -0.8151682, 1.203027, 0.6901961, 0, 1, 1,
0.8349358, -1.417259, 4.335888, 0.6980392, 0, 1, 1,
0.8427173, -1.11655, 2.646187, 0.7058824, 0, 1, 1,
0.8445656, -0.8938345, 2.509571, 0.7098039, 0, 1, 1,
0.8453571, -1.10867, 2.675493, 0.7176471, 0, 1, 1,
0.846481, 0.5545239, 0.5944452, 0.7215686, 0, 1, 1,
0.8475268, 0.6392627, 2.021469, 0.7294118, 0, 1, 1,
0.858022, 0.3336241, 2.487323, 0.7333333, 0, 1, 1,
0.8671929, 1.590668, 0.311525, 0.7411765, 0, 1, 1,
0.8747447, -1.20048, 2.65024, 0.7450981, 0, 1, 1,
0.8856024, -0.05495419, 0.2066984, 0.7529412, 0, 1, 1,
0.8946584, 0.09587181, 1.214384, 0.7568628, 0, 1, 1,
0.8977504, -1.058779, 3.15545, 0.7647059, 0, 1, 1,
0.8982882, 0.1835575, 2.641969, 0.7686275, 0, 1, 1,
0.8987566, -0.3162305, 0.8660318, 0.7764706, 0, 1, 1,
0.9037604, 1.081534, 1.96745, 0.7803922, 0, 1, 1,
0.9118003, 1.336217, 0.9169598, 0.7882353, 0, 1, 1,
0.9205375, 0.2355599, 1.173368, 0.7921569, 0, 1, 1,
0.9205844, -1.640477, 1.700549, 0.8, 0, 1, 1,
0.9222251, -0.8992732, 1.281204, 0.8078431, 0, 1, 1,
0.9241012, -0.9277301, 1.591734, 0.8117647, 0, 1, 1,
0.9246669, -0.7746552, 2.805368, 0.8196079, 0, 1, 1,
0.926042, -0.07698792, 1.943194, 0.8235294, 0, 1, 1,
0.9346418, -0.2764318, 1.099524, 0.8313726, 0, 1, 1,
0.942089, -0.01536769, 2.453728, 0.8352941, 0, 1, 1,
0.9549068, 0.2456628, 1.922442, 0.8431373, 0, 1, 1,
0.9581222, 0.8172341, -0.2937232, 0.8470588, 0, 1, 1,
0.9623169, -0.833158, 2.068874, 0.854902, 0, 1, 1,
0.9683509, -0.7690679, 1.307492, 0.8588235, 0, 1, 1,
0.9688199, 1.953442, 1.471564, 0.8666667, 0, 1, 1,
0.9698991, 1.533798, 0.185863, 0.8705882, 0, 1, 1,
0.974371, 0.6500911, 1.248192, 0.8784314, 0, 1, 1,
0.9757723, 0.8509701, 0.4738263, 0.8823529, 0, 1, 1,
0.9783722, -0.2225419, 3.460741, 0.8901961, 0, 1, 1,
0.981746, 1.026403, 0.5785877, 0.8941177, 0, 1, 1,
0.9854387, -0.6043711, 1.965176, 0.9019608, 0, 1, 1,
0.9928516, 0.03752014, 1.051944, 0.9098039, 0, 1, 1,
0.9928797, -0.7731141, 0.7503513, 0.9137255, 0, 1, 1,
0.9967916, 0.4341761, 1.173489, 0.9215686, 0, 1, 1,
0.9982221, -0.5164703, 2.779587, 0.9254902, 0, 1, 1,
0.9988696, 0.3811371, 0.2066035, 0.9333333, 0, 1, 1,
1.001721, -0.4598953, 3.877462, 0.9372549, 0, 1, 1,
1.003605, -0.272327, 1.160164, 0.945098, 0, 1, 1,
1.004736, -0.7929521, 1.984935, 0.9490196, 0, 1, 1,
1.005404, -1.773814, 2.338577, 0.9568627, 0, 1, 1,
1.012476, -0.4357357, 1.627042, 0.9607843, 0, 1, 1,
1.023737, 0.8003471, 0.4457332, 0.9686275, 0, 1, 1,
1.030406, -0.1032447, 2.000093, 0.972549, 0, 1, 1,
1.031853, -0.6404159, 0.9719666, 0.9803922, 0, 1, 1,
1.03967, -1.27399, 3.133521, 0.9843137, 0, 1, 1,
1.042792, -0.572029, 3.901862, 0.9921569, 0, 1, 1,
1.044191, 0.9429246, 0.7261049, 0.9960784, 0, 1, 1,
1.044724, -0.2995827, 2.087313, 1, 0, 0.9960784, 1,
1.048822, 0.4324256, 1.418414, 1, 0, 0.9882353, 1,
1.049873, -0.1197527, 1.819728, 1, 0, 0.9843137, 1,
1.05049, -0.6969855, 1.605971, 1, 0, 0.9764706, 1,
1.053784, -1.985945, 2.601626, 1, 0, 0.972549, 1,
1.064726, 0.1745152, -0.5651215, 1, 0, 0.9647059, 1,
1.070827, -1.9998, 0.7816581, 1, 0, 0.9607843, 1,
1.075414, -0.8867926, 1.788517, 1, 0, 0.9529412, 1,
1.078703, 1.078568, 0.2034752, 1, 0, 0.9490196, 1,
1.079993, -0.9322594, 2.381753, 1, 0, 0.9411765, 1,
1.081253, -0.6239522, 1.898249, 1, 0, 0.9372549, 1,
1.083412, 2.09824, -0.4813607, 1, 0, 0.9294118, 1,
1.084553, -0.06942758, 0.7035303, 1, 0, 0.9254902, 1,
1.084741, -0.03501851, 1.768976, 1, 0, 0.9176471, 1,
1.088431, 0.3252873, 2.219812, 1, 0, 0.9137255, 1,
1.089934, 0.3902189, 1.535744, 1, 0, 0.9058824, 1,
1.09223, 0.7018408, 0.1452959, 1, 0, 0.9019608, 1,
1.094263, -1.644011, 2.690995, 1, 0, 0.8941177, 1,
1.100456, 0.5263906, 0.7771704, 1, 0, 0.8862745, 1,
1.103578, -1.299603, 1.686618, 1, 0, 0.8823529, 1,
1.109812, 0.6671494, 0.3293345, 1, 0, 0.8745098, 1,
1.112289, 0.1340235, 0.2415604, 1, 0, 0.8705882, 1,
1.116008, 0.3053813, 2.458833, 1, 0, 0.8627451, 1,
1.120054, -0.008501412, -0.4942759, 1, 0, 0.8588235, 1,
1.121331, 0.3832705, 0.4728402, 1, 0, 0.8509804, 1,
1.121792, 0.6096855, 0.7541103, 1, 0, 0.8470588, 1,
1.124329, 1.007941, -0.08961262, 1, 0, 0.8392157, 1,
1.126497, 0.373684, 1.275893, 1, 0, 0.8352941, 1,
1.133764, 1.114689, 0.4377612, 1, 0, 0.827451, 1,
1.135846, 0.9775851, 1.92025, 1, 0, 0.8235294, 1,
1.140112, 1.150485, 0.8530704, 1, 0, 0.8156863, 1,
1.144489, -1.287898, 1.784427, 1, 0, 0.8117647, 1,
1.149269, -0.1637815, 2.495886, 1, 0, 0.8039216, 1,
1.149442, 0.9381261, 0.08960537, 1, 0, 0.7960784, 1,
1.153016, 0.6701432, -0.2707359, 1, 0, 0.7921569, 1,
1.155247, 1.198168, 0.4415399, 1, 0, 0.7843137, 1,
1.156291, 1.731667, 0.8241919, 1, 0, 0.7803922, 1,
1.159617, -0.1274722, 3.170903, 1, 0, 0.772549, 1,
1.16024, 0.845384, 0.8633971, 1, 0, 0.7686275, 1,
1.161521, -0.8193823, 3.477573, 1, 0, 0.7607843, 1,
1.173799, -1.305909, 2.885484, 1, 0, 0.7568628, 1,
1.176049, 0.7706386, 0.2252423, 1, 0, 0.7490196, 1,
1.18196, 0.3604489, 2.854825, 1, 0, 0.7450981, 1,
1.186823, 0.2131909, 1.995027, 1, 0, 0.7372549, 1,
1.189593, -0.8609513, 1.347477, 1, 0, 0.7333333, 1,
1.204594, 0.2105534, 2.0537, 1, 0, 0.7254902, 1,
1.210572, -0.4975263, 0.4819957, 1, 0, 0.7215686, 1,
1.225446, -0.1384687, 2.078543, 1, 0, 0.7137255, 1,
1.22609, 0.2414522, 1.162266, 1, 0, 0.7098039, 1,
1.236407, 0.5532033, 1.805299, 1, 0, 0.7019608, 1,
1.239697, -0.9120351, 4.021526, 1, 0, 0.6941177, 1,
1.244208, -1.479883, 2.377802, 1, 0, 0.6901961, 1,
1.244788, 0.6368708, 2.705001, 1, 0, 0.682353, 1,
1.25053, 0.659452, -0.1242987, 1, 0, 0.6784314, 1,
1.2559, -0.2651558, -0.2197129, 1, 0, 0.6705883, 1,
1.262705, 1.813887, 0.8885598, 1, 0, 0.6666667, 1,
1.263816, 0.6173729, 2.620278, 1, 0, 0.6588235, 1,
1.267959, -0.6691431, -0.008915219, 1, 0, 0.654902, 1,
1.268569, -0.1995642, 2.482749, 1, 0, 0.6470588, 1,
1.271885, 0.2285097, -0.2033492, 1, 0, 0.6431373, 1,
1.272829, -0.6341568, 2.436636, 1, 0, 0.6352941, 1,
1.28123, 0.9969371, 2.006577, 1, 0, 0.6313726, 1,
1.283026, -0.2709526, 3.054144, 1, 0, 0.6235294, 1,
1.285548, 0.8092011, 3.029194, 1, 0, 0.6196079, 1,
1.289205, -1.352838, 3.936606, 1, 0, 0.6117647, 1,
1.295823, 0.7501757, 0.7965131, 1, 0, 0.6078432, 1,
1.303396, 1.012661, 1.410152, 1, 0, 0.6, 1,
1.307699, 0.774615, 1.746511, 1, 0, 0.5921569, 1,
1.329887, -0.9554862, 2.127256, 1, 0, 0.5882353, 1,
1.332995, -0.9580155, 2.784132, 1, 0, 0.5803922, 1,
1.342808, -0.7935321, 3.596126, 1, 0, 0.5764706, 1,
1.35659, -1.359492, 2.131422, 1, 0, 0.5686275, 1,
1.357242, -0.4602934, 0.8684949, 1, 0, 0.5647059, 1,
1.362961, 1.352523, 1.288518, 1, 0, 0.5568628, 1,
1.368424, -1.198662, 2.572931, 1, 0, 0.5529412, 1,
1.368607, -0.545724, 3.627239, 1, 0, 0.5450981, 1,
1.382261, 0.1739213, 0.548377, 1, 0, 0.5411765, 1,
1.386706, 0.5365383, -0.06144964, 1, 0, 0.5333334, 1,
1.393464, -1.082427, 2.380402, 1, 0, 0.5294118, 1,
1.400992, -0.9859824, 2.116136, 1, 0, 0.5215687, 1,
1.409778, -1.235241, 3.125727, 1, 0, 0.5176471, 1,
1.411691, 1.358669, -0.4310329, 1, 0, 0.509804, 1,
1.436906, -1.224854, 1.379431, 1, 0, 0.5058824, 1,
1.444086, -0.2425485, 1.769548, 1, 0, 0.4980392, 1,
1.445508, -1.02223, 1.025655, 1, 0, 0.4901961, 1,
1.448181, -0.01222071, 1.327847, 1, 0, 0.4862745, 1,
1.455011, 0.475632, 1.618131, 1, 0, 0.4784314, 1,
1.462515, -2.029008, 2.3598, 1, 0, 0.4745098, 1,
1.464029, -1.170324, 1.846147, 1, 0, 0.4666667, 1,
1.466965, 1.160456, 1.692719, 1, 0, 0.4627451, 1,
1.482605, -0.009795041, 2.374997, 1, 0, 0.454902, 1,
1.499226, 0.01501011, 0.2268774, 1, 0, 0.4509804, 1,
1.537425, 0.7522217, 1.658598, 1, 0, 0.4431373, 1,
1.538409, 0.7837324, 0.425874, 1, 0, 0.4392157, 1,
1.539605, -0.5373627, 1.827579, 1, 0, 0.4313726, 1,
1.539611, 0.9091189, 0.02644008, 1, 0, 0.427451, 1,
1.549644, -0.2853387, 2.226219, 1, 0, 0.4196078, 1,
1.551504, -0.2167934, 1.110495, 1, 0, 0.4156863, 1,
1.555194, 0.6084645, 1.674335, 1, 0, 0.4078431, 1,
1.56527, -1.012999, 2.958971, 1, 0, 0.4039216, 1,
1.566044, 0.8671165, -0.120908, 1, 0, 0.3960784, 1,
1.572358, -0.06568389, 0.8109335, 1, 0, 0.3882353, 1,
1.574822, -1.462358, 2.478898, 1, 0, 0.3843137, 1,
1.584321, 1.24982, 1.38258, 1, 0, 0.3764706, 1,
1.592953, -1.009466, 1.905329, 1, 0, 0.372549, 1,
1.608178, -0.3740922, 4.195883, 1, 0, 0.3647059, 1,
1.609767, -0.3205159, 1.740286, 1, 0, 0.3607843, 1,
1.634189, 2.021846, -0.7354981, 1, 0, 0.3529412, 1,
1.635338, 0.06484862, 2.069713, 1, 0, 0.3490196, 1,
1.64178, 1.918286, 1.369443, 1, 0, 0.3411765, 1,
1.652815, -0.320927, 2.761284, 1, 0, 0.3372549, 1,
1.677424, -1.504444, 2.597525, 1, 0, 0.3294118, 1,
1.677451, -0.8661533, 2.029515, 1, 0, 0.3254902, 1,
1.678147, 0.9275159, -1.396242, 1, 0, 0.3176471, 1,
1.685771, 0.6042635, 1.268712, 1, 0, 0.3137255, 1,
1.689595, 0.966259, 0.7926005, 1, 0, 0.3058824, 1,
1.691254, 0.3187491, 0.37553, 1, 0, 0.2980392, 1,
1.70401, -0.06230856, 0.0798689, 1, 0, 0.2941177, 1,
1.730053, -0.08060214, 2.952857, 1, 0, 0.2862745, 1,
1.739501, 0.8325688, 0.766959, 1, 0, 0.282353, 1,
1.744968, -0.2670582, 3.366293, 1, 0, 0.2745098, 1,
1.772158, 0.1436819, 1.48038, 1, 0, 0.2705882, 1,
1.774119, 0.8432774, 0.8682718, 1, 0, 0.2627451, 1,
1.782737, 0.6746954, 2.068342, 1, 0, 0.2588235, 1,
1.785581, -0.7090006, 0.2749497, 1, 0, 0.2509804, 1,
1.785628, -0.4328014, 3.062689, 1, 0, 0.2470588, 1,
1.793136, 0.2016389, 2.969852, 1, 0, 0.2392157, 1,
1.810655, -0.4273058, 3.380389, 1, 0, 0.2352941, 1,
1.824442, 1.234433, 1.333198, 1, 0, 0.227451, 1,
1.8286, -0.2019735, 1.015061, 1, 0, 0.2235294, 1,
1.868434, 0.314389, 0.7444736, 1, 0, 0.2156863, 1,
1.878949, -1.138077, 1.211502, 1, 0, 0.2117647, 1,
1.880182, 0.4589711, 0.8448333, 1, 0, 0.2039216, 1,
1.88036, 0.309087, 0.8931215, 1, 0, 0.1960784, 1,
1.894313, 0.6805632, 0.8863951, 1, 0, 0.1921569, 1,
1.925446, 1.151731, 0.001097517, 1, 0, 0.1843137, 1,
1.934301, -0.1063324, 1.908176, 1, 0, 0.1803922, 1,
1.951305, 1.753027, 0.8194388, 1, 0, 0.172549, 1,
1.974957, 2.069106, 0.2009862, 1, 0, 0.1686275, 1,
2.00444, 0.009268529, 0.5480739, 1, 0, 0.1607843, 1,
2.019037, -0.6439127, 0.8210548, 1, 0, 0.1568628, 1,
2.024405, 1.48671, 2.362131, 1, 0, 0.1490196, 1,
2.026374, 0.7821667, 1.462673, 1, 0, 0.145098, 1,
2.045953, 0.5735613, 0.4642467, 1, 0, 0.1372549, 1,
2.065397, 0.01728862, 2.700428, 1, 0, 0.1333333, 1,
2.094179, 0.3904544, -1.345566, 1, 0, 0.1254902, 1,
2.102395, 0.8385322, 0.8903518, 1, 0, 0.1215686, 1,
2.10458, 0.5796558, 2.118903, 1, 0, 0.1137255, 1,
2.110312, -0.502723, 2.066959, 1, 0, 0.1098039, 1,
2.138463, 0.01563542, 1.772414, 1, 0, 0.1019608, 1,
2.14496, 1.8125, 0.03327286, 1, 0, 0.09411765, 1,
2.153676, -1.451397, 3.326087, 1, 0, 0.09019608, 1,
2.189599, -0.09297711, 1.305282, 1, 0, 0.08235294, 1,
2.266041, 0.4596887, 2.916868, 1, 0, 0.07843138, 1,
2.291621, 1.223396, -1.564445, 1, 0, 0.07058824, 1,
2.321793, -1.491454, 3.409118, 1, 0, 0.06666667, 1,
2.360759, -1.791503, 4.077806, 1, 0, 0.05882353, 1,
2.361637, 1.66553, 1.366634, 1, 0, 0.05490196, 1,
2.368757, 1.163551, 1.666623, 1, 0, 0.04705882, 1,
2.497488, -0.0338436, 2.795665, 1, 0, 0.04313726, 1,
2.587297, -0.8974606, 0.6366033, 1, 0, 0.03529412, 1,
2.643679, 0.6737923, 1.440592, 1, 0, 0.03137255, 1,
2.734677, -1.427384, 2.272249, 1, 0, 0.02352941, 1,
3.012811, 1.999834, 2.100193, 1, 0, 0.01960784, 1,
3.107671, -0.7459983, 2.461886, 1, 0, 0.01176471, 1,
3.110255, -0.4286772, 1.241938, 1, 0, 0.007843138, 1
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
0.1926955, -4.845333, -7.347765, 0, -0.5, 0.5, 0.5,
0.1926955, -4.845333, -7.347765, 1, -0.5, 0.5, 0.5,
0.1926955, -4.845333, -7.347765, 1, 1.5, 0.5, 0.5,
0.1926955, -4.845333, -7.347765, 0, 1.5, 0.5, 0.5
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
-3.713917, -0.3196365, -7.347765, 0, -0.5, 0.5, 0.5,
-3.713917, -0.3196365, -7.347765, 1, -0.5, 0.5, 0.5,
-3.713917, -0.3196365, -7.347765, 1, 1.5, 0.5, 0.5,
-3.713917, -0.3196365, -7.347765, 0, 1.5, 0.5, 0.5
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
-3.713917, -4.845333, 0.4872856, 0, -0.5, 0.5, 0.5,
-3.713917, -4.845333, 0.4872856, 1, -0.5, 0.5, 0.5,
-3.713917, -4.845333, 0.4872856, 1, 1.5, 0.5, 0.5,
-3.713917, -4.845333, 0.4872856, 0, 1.5, 0.5, 0.5
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
-2, -3.800942, -5.539677,
3, -3.800942, -5.539677,
-2, -3.800942, -5.539677,
-2, -3.975007, -5.841025,
-1, -3.800942, -5.539677,
-1, -3.975007, -5.841025,
0, -3.800942, -5.539677,
0, -3.975007, -5.841025,
1, -3.800942, -5.539677,
1, -3.975007, -5.841025,
2, -3.800942, -5.539677,
2, -3.975007, -5.841025,
3, -3.800942, -5.539677,
3, -3.975007, -5.841025
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
-2, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
-2, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
-2, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
-2, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5,
-1, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
-1, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
-1, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
-1, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5,
0, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
0, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
0, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
0, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5,
1, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
1, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
1, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
1, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5,
2, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
2, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
2, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
2, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5,
3, -4.323137, -6.443721, 0, -0.5, 0.5, 0.5,
3, -4.323137, -6.443721, 1, -0.5, 0.5, 0.5,
3, -4.323137, -6.443721, 1, 1.5, 0.5, 0.5,
3, -4.323137, -6.443721, 0, 1.5, 0.5, 0.5
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
-2.812391, -3, -5.539677,
-2.812391, 3, -5.539677,
-2.812391, -3, -5.539677,
-2.962646, -3, -5.841025,
-2.812391, -2, -5.539677,
-2.962646, -2, -5.841025,
-2.812391, -1, -5.539677,
-2.962646, -1, -5.841025,
-2.812391, 0, -5.539677,
-2.962646, 0, -5.841025,
-2.812391, 1, -5.539677,
-2.962646, 1, -5.841025,
-2.812391, 2, -5.539677,
-2.962646, 2, -5.841025,
-2.812391, 3, -5.539677,
-2.962646, 3, -5.841025
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
-3.263154, -3, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, -3, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, -3, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, -3, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, -2, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, -2, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, -2, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, -2, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, -1, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, -1, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, -1, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, -1, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, 0, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, 0, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, 0, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, 0, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, 1, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, 1, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, 1, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, 1, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, 2, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, 2, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, 2, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, 2, -6.443721, 0, 1.5, 0.5, 0.5,
-3.263154, 3, -6.443721, 0, -0.5, 0.5, 0.5,
-3.263154, 3, -6.443721, 1, -0.5, 0.5, 0.5,
-3.263154, 3, -6.443721, 1, 1.5, 0.5, 0.5,
-3.263154, 3, -6.443721, 0, 1.5, 0.5, 0.5
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
-2.812391, -3.800942, -4,
-2.812391, -3.800942, 6,
-2.812391, -3.800942, -4,
-2.962646, -3.975007, -4,
-2.812391, -3.800942, -2,
-2.962646, -3.975007, -2,
-2.812391, -3.800942, 0,
-2.962646, -3.975007, 0,
-2.812391, -3.800942, 2,
-2.962646, -3.975007, 2,
-2.812391, -3.800942, 4,
-2.962646, -3.975007, 4,
-2.812391, -3.800942, 6,
-2.962646, -3.975007, 6
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
"4",
"6"
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
-3.263154, -4.323137, -4, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, -4, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, -4, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, -4, 0, 1.5, 0.5, 0.5,
-3.263154, -4.323137, -2, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, -2, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, -2, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, -2, 0, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 0, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 0, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 0, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 0, 0, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 2, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 2, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 2, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 2, 0, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 4, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 4, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 4, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 4, 0, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 6, 0, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 6, 1, -0.5, 0.5, 0.5,
-3.263154, -4.323137, 6, 1, 1.5, 0.5, 0.5,
-3.263154, -4.323137, 6, 0, 1.5, 0.5, 0.5
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
-2.812391, -3.800942, -5.539677,
-2.812391, 3.161669, -5.539677,
-2.812391, -3.800942, 6.514248,
-2.812391, 3.161669, 6.514248,
-2.812391, -3.800942, -5.539677,
-2.812391, -3.800942, 6.514248,
-2.812391, 3.161669, -5.539677,
-2.812391, 3.161669, 6.514248,
-2.812391, -3.800942, -5.539677,
3.197782, -3.800942, -5.539677,
-2.812391, -3.800942, 6.514248,
3.197782, -3.800942, 6.514248,
-2.812391, 3.161669, -5.539677,
3.197782, 3.161669, -5.539677,
-2.812391, 3.161669, 6.514248,
3.197782, 3.161669, 6.514248,
3.197782, -3.800942, -5.539677,
3.197782, 3.161669, -5.539677,
3.197782, -3.800942, 6.514248,
3.197782, 3.161669, 6.514248,
3.197782, -3.800942, -5.539677,
3.197782, -3.800942, 6.514248,
3.197782, 3.161669, -5.539677,
3.197782, 3.161669, 6.514248
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
var radius = 8.096407;
var distance = 36.02183;
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
mvMatrix.translate( -0.1926955, 0.3196365, -0.4872856 );
mvMatrix.scale( 1.456529, 1.257286, 0.726236 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.02183);
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


