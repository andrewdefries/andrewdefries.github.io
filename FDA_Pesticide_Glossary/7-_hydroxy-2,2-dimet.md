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
-3.096975, 1.209513, -1.48987, 1, 0, 0, 1,
-3.038371, -0.9168754, -0.3773247, 1, 0.007843138, 0, 1,
-2.791539, 0.4791647, -3.083424, 1, 0.01176471, 0, 1,
-2.789225, 1.02601, 0.255931, 1, 0.01960784, 0, 1,
-2.557556, -0.5093531, -3.112488, 1, 0.02352941, 0, 1,
-2.508881, -0.3703877, -2.15617, 1, 0.03137255, 0, 1,
-2.455668, 0.4486445, -2.623177, 1, 0.03529412, 0, 1,
-2.438813, 0.7864432, -0.7330331, 1, 0.04313726, 0, 1,
-2.434513, -0.06623743, -0.2660127, 1, 0.04705882, 0, 1,
-2.416652, -0.2782212, 1.590537, 1, 0.05490196, 0, 1,
-2.408325, 0.6610716, -1.372972, 1, 0.05882353, 0, 1,
-2.385081, 1.386296, -2.885534, 1, 0.06666667, 0, 1,
-2.334405, -0.4507123, -0.1453332, 1, 0.07058824, 0, 1,
-2.3143, 1.539319, 0.7499241, 1, 0.07843138, 0, 1,
-2.307008, -0.3794135, -2.099313, 1, 0.08235294, 0, 1,
-2.305986, -1.654527, -2.305519, 1, 0.09019608, 0, 1,
-2.297433, -0.3145649, -1.325548, 1, 0.09411765, 0, 1,
-2.296382, 0.1590945, -1.611859, 1, 0.1019608, 0, 1,
-2.290931, 0.2252464, 0.4021161, 1, 0.1098039, 0, 1,
-2.257427, 0.3740329, 1.340641, 1, 0.1137255, 0, 1,
-2.256298, 0.7487401, 0.08831223, 1, 0.1215686, 0, 1,
-2.223407, -0.0497509, -2.884199, 1, 0.1254902, 0, 1,
-2.202718, 2.306352, -0.8133708, 1, 0.1333333, 0, 1,
-2.165547, 1.234226, 0.4660325, 1, 0.1372549, 0, 1,
-2.115214, -1.114082, -3.981717, 1, 0.145098, 0, 1,
-2.101748, 0.7272586, -0.8569393, 1, 0.1490196, 0, 1,
-2.080205, -0.5576235, -1.136391, 1, 0.1568628, 0, 1,
-2.068338, 0.2926904, -1.003429, 1, 0.1607843, 0, 1,
-2.058562, 1.815341, -3.200531, 1, 0.1686275, 0, 1,
-2.055384, 1.738621, -0.08120166, 1, 0.172549, 0, 1,
-1.997327, -1.011992, -2.558967, 1, 0.1803922, 0, 1,
-1.944498, 0.04454874, -0.6827619, 1, 0.1843137, 0, 1,
-1.911729, -0.8553097, -2.845485, 1, 0.1921569, 0, 1,
-1.908069, -1.047666, -1.72587, 1, 0.1960784, 0, 1,
-1.870633, -0.4126799, -2.054125, 1, 0.2039216, 0, 1,
-1.868243, -1.224238, -3.012254, 1, 0.2117647, 0, 1,
-1.86516, -0.182508, 0.2588744, 1, 0.2156863, 0, 1,
-1.865031, -0.4315906, -2.647554, 1, 0.2235294, 0, 1,
-1.85404, -2.54787, -1.852098, 1, 0.227451, 0, 1,
-1.843585, -0.06650443, -1.105108, 1, 0.2352941, 0, 1,
-1.829879, 0.4135585, -1.435995, 1, 0.2392157, 0, 1,
-1.790915, 0.2831062, -1.416983, 1, 0.2470588, 0, 1,
-1.783138, 0.6410626, -2.909787, 1, 0.2509804, 0, 1,
-1.778615, 0.06966423, -1.198705, 1, 0.2588235, 0, 1,
-1.770256, 1.126255, 0.7495699, 1, 0.2627451, 0, 1,
-1.765681, -0.9897436, -0.9447463, 1, 0.2705882, 0, 1,
-1.746753, 0.6109002, 0.8333068, 1, 0.2745098, 0, 1,
-1.734799, 0.8560235, -0.04895617, 1, 0.282353, 0, 1,
-1.72606, -0.09244332, -2.317031, 1, 0.2862745, 0, 1,
-1.725137, 0.04503244, -0.657791, 1, 0.2941177, 0, 1,
-1.722981, 0.2223093, -1.325819, 1, 0.3019608, 0, 1,
-1.7193, 0.2839328, -0.4369722, 1, 0.3058824, 0, 1,
-1.709004, 0.3455848, -1.514039, 1, 0.3137255, 0, 1,
-1.707389, 0.6907192, -1.879059, 1, 0.3176471, 0, 1,
-1.69719, -0.3111922, -4.455346, 1, 0.3254902, 0, 1,
-1.676837, 0.3339569, -1.710178, 1, 0.3294118, 0, 1,
-1.674262, -0.1811318, -0.6682392, 1, 0.3372549, 0, 1,
-1.629532, 2.024318, 0.6736853, 1, 0.3411765, 0, 1,
-1.608661, 0.5459921, -1.453238, 1, 0.3490196, 0, 1,
-1.58548, -1.521066, -3.044836, 1, 0.3529412, 0, 1,
-1.577307, -0.7083347, -1.889771, 1, 0.3607843, 0, 1,
-1.575654, 1.164249, -0.775084, 1, 0.3647059, 0, 1,
-1.575448, 2.498612, 0.7777524, 1, 0.372549, 0, 1,
-1.561348, -0.6968735, -2.679185, 1, 0.3764706, 0, 1,
-1.55784, -0.3479276, -1.945162, 1, 0.3843137, 0, 1,
-1.556897, -1.269034, -2.871275, 1, 0.3882353, 0, 1,
-1.550026, 0.7074486, 0.5942942, 1, 0.3960784, 0, 1,
-1.54538, -1.418767, -2.128373, 1, 0.4039216, 0, 1,
-1.530655, 1.80024, -0.6647698, 1, 0.4078431, 0, 1,
-1.530522, -0.3381224, 0.004252387, 1, 0.4156863, 0, 1,
-1.528776, 1.158006, -0.1545257, 1, 0.4196078, 0, 1,
-1.524512, 1.054404, -1.338739, 1, 0.427451, 0, 1,
-1.501035, -1.322429, -1.526814, 1, 0.4313726, 0, 1,
-1.487553, -0.6276442, -2.990878, 1, 0.4392157, 0, 1,
-1.476987, 0.3188155, -0.3627458, 1, 0.4431373, 0, 1,
-1.463533, -0.6869863, -1.422314, 1, 0.4509804, 0, 1,
-1.455175, 1.481318, -1.970741, 1, 0.454902, 0, 1,
-1.449929, 0.391634, -0.9672118, 1, 0.4627451, 0, 1,
-1.449553, 0.8630581, -0.2292403, 1, 0.4666667, 0, 1,
-1.446935, -0.2112993, -1.766834, 1, 0.4745098, 0, 1,
-1.438119, 0.9851653, -0.2130582, 1, 0.4784314, 0, 1,
-1.437549, 0.3201293, -1.501606, 1, 0.4862745, 0, 1,
-1.428364, -1.350191, -2.22505, 1, 0.4901961, 0, 1,
-1.414444, 0.4258918, 0.4654872, 1, 0.4980392, 0, 1,
-1.39402, -0.398941, -1.143025, 1, 0.5058824, 0, 1,
-1.391304, 0.3548701, -0.2615279, 1, 0.509804, 0, 1,
-1.390951, -0.5094889, -0.7785916, 1, 0.5176471, 0, 1,
-1.386279, 0.04570026, -2.333041, 1, 0.5215687, 0, 1,
-1.377675, -0.9659348, -1.95187, 1, 0.5294118, 0, 1,
-1.356075, -0.280722, -1.887784, 1, 0.5333334, 0, 1,
-1.343727, -0.1524292, -1.814287, 1, 0.5411765, 0, 1,
-1.342256, -0.2315628, -0.7158986, 1, 0.5450981, 0, 1,
-1.327943, -0.1054932, -1.794513, 1, 0.5529412, 0, 1,
-1.322327, -0.3308296, -1.544512, 1, 0.5568628, 0, 1,
-1.317069, 0.4690644, -0.3991957, 1, 0.5647059, 0, 1,
-1.315525, 1.390749, -0.7288544, 1, 0.5686275, 0, 1,
-1.311166, -0.606059, -0.4528224, 1, 0.5764706, 0, 1,
-1.310057, -0.02086593, -2.319851, 1, 0.5803922, 0, 1,
-1.297216, 1.268219, -0.9613569, 1, 0.5882353, 0, 1,
-1.290888, -0.4858248, -1.07286, 1, 0.5921569, 0, 1,
-1.288338, -1.348125, -1.966167, 1, 0.6, 0, 1,
-1.287881, -0.1602582, -0.8383465, 1, 0.6078432, 0, 1,
-1.286892, 0.05885138, -2.118252, 1, 0.6117647, 0, 1,
-1.280021, 0.3053486, -0.4755827, 1, 0.6196079, 0, 1,
-1.276994, -0.3991089, -1.93023, 1, 0.6235294, 0, 1,
-1.268974, 1.2475, -0.7264772, 1, 0.6313726, 0, 1,
-1.253078, -0.5612255, -0.8192673, 1, 0.6352941, 0, 1,
-1.241635, 0.2931334, -1.318883, 1, 0.6431373, 0, 1,
-1.241576, 0.1332057, -2.195607, 1, 0.6470588, 0, 1,
-1.230838, 1.623219, -0.3489609, 1, 0.654902, 0, 1,
-1.21157, -0.1354606, -2.957223, 1, 0.6588235, 0, 1,
-1.20718, 0.3724571, 0.3227444, 1, 0.6666667, 0, 1,
-1.206113, 0.0689192, -2.475677, 1, 0.6705883, 0, 1,
-1.20315, 0.08976685, -1.24648, 1, 0.6784314, 0, 1,
-1.201693, -0.135105, -0.7636869, 1, 0.682353, 0, 1,
-1.200356, -0.1601229, -3.554942, 1, 0.6901961, 0, 1,
-1.186574, -1.43337, -1.637786, 1, 0.6941177, 0, 1,
-1.185925, -1.379928, -1.77356, 1, 0.7019608, 0, 1,
-1.184245, 0.03602907, -1.247872, 1, 0.7098039, 0, 1,
-1.180175, 0.5731938, -2.429597, 1, 0.7137255, 0, 1,
-1.177804, -1.564587, -1.463465, 1, 0.7215686, 0, 1,
-1.174224, -0.2565905, -1.473848, 1, 0.7254902, 0, 1,
-1.174207, -0.1475177, -3.216856, 1, 0.7333333, 0, 1,
-1.169666, -0.3850653, -2.742475, 1, 0.7372549, 0, 1,
-1.169031, -0.09577685, -1.410589, 1, 0.7450981, 0, 1,
-1.164991, 1.269972, -0.02823745, 1, 0.7490196, 0, 1,
-1.163253, 0.5779986, -0.445935, 1, 0.7568628, 0, 1,
-1.148024, 0.6542825, -0.6787995, 1, 0.7607843, 0, 1,
-1.147124, 0.7112083, 0.3287824, 1, 0.7686275, 0, 1,
-1.14413, 1.113894, -0.02211485, 1, 0.772549, 0, 1,
-1.138156, 0.4399603, -2.419755, 1, 0.7803922, 0, 1,
-1.137042, 0.06597438, -1.095343, 1, 0.7843137, 0, 1,
-1.136839, 0.5374032, 0.3690702, 1, 0.7921569, 0, 1,
-1.134801, 0.1577853, -1.769347, 1, 0.7960784, 0, 1,
-1.128374, 1.083094, 0.003755074, 1, 0.8039216, 0, 1,
-1.128248, -0.7821354, -2.662622, 1, 0.8117647, 0, 1,
-1.119623, 0.2097017, -1.782707, 1, 0.8156863, 0, 1,
-1.107487, 0.9495006, -0.8841372, 1, 0.8235294, 0, 1,
-1.105973, -0.8193291, -2.736732, 1, 0.827451, 0, 1,
-1.101361, 0.1237874, -1.940507, 1, 0.8352941, 0, 1,
-1.099938, -0.7988418, -1.848802, 1, 0.8392157, 0, 1,
-1.095143, -0.7956867, 0.0006849095, 1, 0.8470588, 0, 1,
-1.094363, -0.6238941, -2.452173, 1, 0.8509804, 0, 1,
-1.094204, -0.1615138, -0.8647812, 1, 0.8588235, 0, 1,
-1.08403, -0.577331, -0.4875134, 1, 0.8627451, 0, 1,
-1.083171, 0.5136273, -1.763542, 1, 0.8705882, 0, 1,
-1.080766, 0.8499774, -2.793721, 1, 0.8745098, 0, 1,
-1.079054, -0.4411125, -1.096158, 1, 0.8823529, 0, 1,
-1.077602, -0.9506585, -2.895269, 1, 0.8862745, 0, 1,
-1.071612, 0.1241672, -2.718538, 1, 0.8941177, 0, 1,
-1.061929, -0.1059473, -2.344577, 1, 0.8980392, 0, 1,
-1.059933, -0.02886959, -1.634047, 1, 0.9058824, 0, 1,
-1.058226, -0.01051049, -1.537826, 1, 0.9137255, 0, 1,
-1.048779, 0.06204068, -1.815364, 1, 0.9176471, 0, 1,
-1.044697, -0.984277, -1.659067, 1, 0.9254902, 0, 1,
-1.040103, 0.545368, -0.8026387, 1, 0.9294118, 0, 1,
-1.038704, 1.012882, -0.3257127, 1, 0.9372549, 0, 1,
-1.032303, -0.03526236, -1.003207, 1, 0.9411765, 0, 1,
-1.031514, 0.7476481, 0.413482, 1, 0.9490196, 0, 1,
-1.026527, 0.4599922, -1.329576, 1, 0.9529412, 0, 1,
-1.023815, -0.3910641, -2.444848, 1, 0.9607843, 0, 1,
-1.020504, 0.5018015, -2.02307, 1, 0.9647059, 0, 1,
-1.017355, 1.39897, -0.6079944, 1, 0.972549, 0, 1,
-1.015091, 2.426621, -1.982967, 1, 0.9764706, 0, 1,
-1.010079, -0.248741, -0.5588654, 1, 0.9843137, 0, 1,
-1.00938, 0.4593063, -2.056914, 1, 0.9882353, 0, 1,
-1.005755, -0.3433455, -1.785457, 1, 0.9960784, 0, 1,
-1.001513, 0.01356242, -1.949225, 0.9960784, 1, 0, 1,
-1.001029, -0.4108286, -4.299532, 0.9921569, 1, 0, 1,
-1.000595, 0.7007768, -1.387693, 0.9843137, 1, 0, 1,
-0.9997728, -0.2174475, -0.9095856, 0.9803922, 1, 0, 1,
-0.9982388, -0.9400744, -0.5680116, 0.972549, 1, 0, 1,
-0.9891332, -1.44418, -2.60811, 0.9686275, 1, 0, 1,
-0.9738436, 0.8031923, -0.7212126, 0.9607843, 1, 0, 1,
-0.9723391, 0.7487727, -0.8158472, 0.9568627, 1, 0, 1,
-0.9623052, 1.096468, -1.565686, 0.9490196, 1, 0, 1,
-0.953884, 0.6905777, -1.847588, 0.945098, 1, 0, 1,
-0.9501557, 0.3740126, -0.6066281, 0.9372549, 1, 0, 1,
-0.9405688, -0.8960329, -2.249098, 0.9333333, 1, 0, 1,
-0.9402045, -0.2847252, -2.675822, 0.9254902, 1, 0, 1,
-0.9243807, -0.4006363, -2.413082, 0.9215686, 1, 0, 1,
-0.9105167, -1.736871, -0.5792809, 0.9137255, 1, 0, 1,
-0.9061055, -0.4402365, -1.583294, 0.9098039, 1, 0, 1,
-0.8987032, -0.300589, -3.304041, 0.9019608, 1, 0, 1,
-0.883094, -1.44559, -1.336155, 0.8941177, 1, 0, 1,
-0.8818811, 0.8833777, -1.234602, 0.8901961, 1, 0, 1,
-0.8805077, -0.1505739, -1.874767, 0.8823529, 1, 0, 1,
-0.8729921, 0.5660944, -2.124205, 0.8784314, 1, 0, 1,
-0.8722696, -0.4420807, -2.00632, 0.8705882, 1, 0, 1,
-0.8712881, -0.2565505, -1.295317, 0.8666667, 1, 0, 1,
-0.8682829, -0.04991083, -1.54139, 0.8588235, 1, 0, 1,
-0.8644518, -1.195765, -2.079751, 0.854902, 1, 0, 1,
-0.8638604, -1.210091, -1.198064, 0.8470588, 1, 0, 1,
-0.8635792, -0.2856199, -1.110655, 0.8431373, 1, 0, 1,
-0.8538564, 0.4994768, -0.9412242, 0.8352941, 1, 0, 1,
-0.8526417, 0.4916806, -1.446231, 0.8313726, 1, 0, 1,
-0.8511328, 0.08814678, 0.04577252, 0.8235294, 1, 0, 1,
-0.8475338, -1.109726, -1.786873, 0.8196079, 1, 0, 1,
-0.8472837, -0.7704152, -2.421209, 0.8117647, 1, 0, 1,
-0.845779, 1.479312, -0.3655891, 0.8078431, 1, 0, 1,
-0.8448913, 1.271312, -0.0004749745, 0.8, 1, 0, 1,
-0.8442578, 0.2723633, -1.237748, 0.7921569, 1, 0, 1,
-0.8423885, -0.3406628, -1.885058, 0.7882353, 1, 0, 1,
-0.834664, -0.5158122, -1.071363, 0.7803922, 1, 0, 1,
-0.8337303, 1.478069, 0.309957, 0.7764706, 1, 0, 1,
-0.8337073, 0.05834671, -0.6855921, 0.7686275, 1, 0, 1,
-0.8289056, -1.608386, -2.30585, 0.7647059, 1, 0, 1,
-0.8261313, -0.9001737, -2.936622, 0.7568628, 1, 0, 1,
-0.8196698, 0.3191295, -2.103483, 0.7529412, 1, 0, 1,
-0.8177829, -0.1654039, -0.587958, 0.7450981, 1, 0, 1,
-0.8152225, 0.4298693, -1.635759, 0.7411765, 1, 0, 1,
-0.8039165, -1.522984, -2.105789, 0.7333333, 1, 0, 1,
-0.8004082, -0.2983072, -1.15217, 0.7294118, 1, 0, 1,
-0.796477, 0.304622, -0.6674067, 0.7215686, 1, 0, 1,
-0.7956865, 1.703776, 0.304757, 0.7176471, 1, 0, 1,
-0.7932069, 0.973878, -0.07696562, 0.7098039, 1, 0, 1,
-0.7931526, 1.806297, 0.3470618, 0.7058824, 1, 0, 1,
-0.7816964, -0.3801232, -3.112358, 0.6980392, 1, 0, 1,
-0.7812615, -1.846286, -2.606487, 0.6901961, 1, 0, 1,
-0.7809724, -1.625794, -4.488245, 0.6862745, 1, 0, 1,
-0.7763249, 0.4008864, 0.531213, 0.6784314, 1, 0, 1,
-0.7747043, -0.3306468, -1.033706, 0.6745098, 1, 0, 1,
-0.7718647, 1.169367, -0.2606666, 0.6666667, 1, 0, 1,
-0.7716631, 0.3953372, -0.7479376, 0.6627451, 1, 0, 1,
-0.7612998, 0.8775692, -0.4400775, 0.654902, 1, 0, 1,
-0.7603732, -0.6598431, -1.077804, 0.6509804, 1, 0, 1,
-0.7523363, -1.111001, -2.938215, 0.6431373, 1, 0, 1,
-0.7507755, 0.4408803, -2.197793, 0.6392157, 1, 0, 1,
-0.750379, -1.209968, -3.591348, 0.6313726, 1, 0, 1,
-0.7468807, -0.6012939, -1.599232, 0.627451, 1, 0, 1,
-0.743297, -0.01480485, -2.320866, 0.6196079, 1, 0, 1,
-0.7408063, -0.3500562, -4.136986, 0.6156863, 1, 0, 1,
-0.7376879, -0.05634397, -0.3723598, 0.6078432, 1, 0, 1,
-0.7321135, 0.1110648, -0.6988847, 0.6039216, 1, 0, 1,
-0.7318214, 0.9426714, 0.1879881, 0.5960785, 1, 0, 1,
-0.7312594, 0.7822918, -0.2689382, 0.5882353, 1, 0, 1,
-0.7287902, 0.8410583, -1.524289, 0.5843138, 1, 0, 1,
-0.7279643, 0.2016729, -1.756059, 0.5764706, 1, 0, 1,
-0.7233158, 0.04092606, -0.3392546, 0.572549, 1, 0, 1,
-0.7212843, -0.5669824, -2.221326, 0.5647059, 1, 0, 1,
-0.7168927, 0.4075813, -1.540347, 0.5607843, 1, 0, 1,
-0.716881, -1.15584, -3.357147, 0.5529412, 1, 0, 1,
-0.7167844, -0.4354057, -1.699297, 0.5490196, 1, 0, 1,
-0.7134849, 0.3306071, -0.4270999, 0.5411765, 1, 0, 1,
-0.7102335, -0.2382646, -0.6355153, 0.5372549, 1, 0, 1,
-0.709057, 0.4519008, -0.8474804, 0.5294118, 1, 0, 1,
-0.7079054, -0.7954182, -1.957368, 0.5254902, 1, 0, 1,
-0.707453, 0.4417914, -1.931562, 0.5176471, 1, 0, 1,
-0.7038993, -0.4905491, -0.6985807, 0.5137255, 1, 0, 1,
-0.7011472, -0.2935745, -1.961587, 0.5058824, 1, 0, 1,
-0.7010393, -0.1732936, -0.948681, 0.5019608, 1, 0, 1,
-0.6985012, -1.077966, -4.785772, 0.4941176, 1, 0, 1,
-0.6984568, -0.2609409, -0.7972701, 0.4862745, 1, 0, 1,
-0.6979906, -1.743435, -3.145232, 0.4823529, 1, 0, 1,
-0.6920197, 0.1273453, -1.038436, 0.4745098, 1, 0, 1,
-0.6886302, -0.6500011, -2.883692, 0.4705882, 1, 0, 1,
-0.6865218, -0.2982262, -2.515783, 0.4627451, 1, 0, 1,
-0.6835312, 0.9972835, 0.04709486, 0.4588235, 1, 0, 1,
-0.678435, -0.4733143, -2.314434, 0.4509804, 1, 0, 1,
-0.6738312, 1.712685, -0.7064439, 0.4470588, 1, 0, 1,
-0.6685893, 1.44689, -0.5361979, 0.4392157, 1, 0, 1,
-0.6643571, -1.051482, -2.600131, 0.4352941, 1, 0, 1,
-0.662651, 0.6102743, -1.92239, 0.427451, 1, 0, 1,
-0.6618013, -0.9276012, -2.573062, 0.4235294, 1, 0, 1,
-0.6565884, -0.5007849, -1.67801, 0.4156863, 1, 0, 1,
-0.6562146, -1.404814, -2.66029, 0.4117647, 1, 0, 1,
-0.6521428, 0.5540727, -1.266031, 0.4039216, 1, 0, 1,
-0.6472952, -2.746959, -3.419702, 0.3960784, 1, 0, 1,
-0.6451787, 0.7684467, -1.633822, 0.3921569, 1, 0, 1,
-0.6440764, -0.3305131, -2.880744, 0.3843137, 1, 0, 1,
-0.6414348, 0.1789843, -1.662111, 0.3803922, 1, 0, 1,
-0.6412404, -1.269222, -2.557324, 0.372549, 1, 0, 1,
-0.6409488, 0.09908784, -1.425946, 0.3686275, 1, 0, 1,
-0.6402271, 1.575364, 0.9980457, 0.3607843, 1, 0, 1,
-0.6386658, 1.099727, -0.9854516, 0.3568628, 1, 0, 1,
-0.6346715, 0.3860079, -0.6818465, 0.3490196, 1, 0, 1,
-0.6345468, -0.03654824, -2.676826, 0.345098, 1, 0, 1,
-0.6343061, 1.543404, -0.8840152, 0.3372549, 1, 0, 1,
-0.6322953, 0.5165462, -1.281417, 0.3333333, 1, 0, 1,
-0.6320845, 0.2093016, -2.499195, 0.3254902, 1, 0, 1,
-0.6249352, 0.4239167, -0.06393079, 0.3215686, 1, 0, 1,
-0.6230829, 0.08441085, -2.885044, 0.3137255, 1, 0, 1,
-0.6208113, -0.1829461, -1.888209, 0.3098039, 1, 0, 1,
-0.62032, -0.5763049, -2.384807, 0.3019608, 1, 0, 1,
-0.6187652, 0.08410779, 1.372845, 0.2941177, 1, 0, 1,
-0.6127573, -1.146566, -3.45752, 0.2901961, 1, 0, 1,
-0.6054907, 1.286934, 0.3799577, 0.282353, 1, 0, 1,
-0.6012222, -0.2894666, -2.919114, 0.2784314, 1, 0, 1,
-0.5975829, -0.956246, -3.575368, 0.2705882, 1, 0, 1,
-0.5951266, 0.5907534, -1.243042, 0.2666667, 1, 0, 1,
-0.5918331, -0.4359794, 0.7715119, 0.2588235, 1, 0, 1,
-0.5910962, 1.315179, -0.7848998, 0.254902, 1, 0, 1,
-0.5899888, 0.1184415, -2.435337, 0.2470588, 1, 0, 1,
-0.5872825, 0.2011174, 0.1774708, 0.2431373, 1, 0, 1,
-0.5854933, -0.02670155, -2.839459, 0.2352941, 1, 0, 1,
-0.5854501, 0.4813347, -1.302822, 0.2313726, 1, 0, 1,
-0.584513, -1.49921, -0.9814771, 0.2235294, 1, 0, 1,
-0.5781412, -0.6567681, -2.701489, 0.2196078, 1, 0, 1,
-0.5775065, -0.2638583, -1.075477, 0.2117647, 1, 0, 1,
-0.5767785, -0.9449354, -2.440387, 0.2078431, 1, 0, 1,
-0.5720122, 0.05106493, -0.650224, 0.2, 1, 0, 1,
-0.5681494, -0.3214532, -2.828428, 0.1921569, 1, 0, 1,
-0.5672562, 1.73609, -1.341195, 0.1882353, 1, 0, 1,
-0.5581561, 2.048786, -0.2758827, 0.1803922, 1, 0, 1,
-0.5546353, 1.343388, -1.036409, 0.1764706, 1, 0, 1,
-0.5502031, 0.5714589, -1.103002, 0.1686275, 1, 0, 1,
-0.5434271, -0.0253704, -2.527758, 0.1647059, 1, 0, 1,
-0.5365356, 0.6687005, 0.1732834, 0.1568628, 1, 0, 1,
-0.5310146, 0.4762283, -1.111795, 0.1529412, 1, 0, 1,
-0.5290569, -0.5540558, -1.512868, 0.145098, 1, 0, 1,
-0.5226172, -0.4031374, -4.815795, 0.1411765, 1, 0, 1,
-0.5211382, 0.07849576, -1.721438, 0.1333333, 1, 0, 1,
-0.5208229, 1.560491, 1.867913, 0.1294118, 1, 0, 1,
-0.5198478, -2.126402, -3.300007, 0.1215686, 1, 0, 1,
-0.5177433, -0.2126326, -2.539668, 0.1176471, 1, 0, 1,
-0.517517, -0.2055586, -1.244617, 0.1098039, 1, 0, 1,
-0.516031, 1.012548, 0.3415041, 0.1058824, 1, 0, 1,
-0.5140859, -0.3347565, -2.625986, 0.09803922, 1, 0, 1,
-0.5123724, -0.6406727, -2.775314, 0.09019608, 1, 0, 1,
-0.5099815, 0.5188882, 1.046198, 0.08627451, 1, 0, 1,
-0.5071142, 0.8278832, -0.4536626, 0.07843138, 1, 0, 1,
-0.5039067, -0.3920574, -2.034871, 0.07450981, 1, 0, 1,
-0.5030559, -0.06900663, -1.704671, 0.06666667, 1, 0, 1,
-0.5024828, 1.497993, -0.3110954, 0.0627451, 1, 0, 1,
-0.4978583, 0.8801135, 0.07996315, 0.05490196, 1, 0, 1,
-0.4975076, 0.1954624, -2.183177, 0.05098039, 1, 0, 1,
-0.4966402, -0.1482535, -2.346958, 0.04313726, 1, 0, 1,
-0.4946682, 0.2525728, -1.610115, 0.03921569, 1, 0, 1,
-0.4923298, -0.1072808, -2.102171, 0.03137255, 1, 0, 1,
-0.4844371, 0.7576449, 0.6201405, 0.02745098, 1, 0, 1,
-0.4836408, 0.2062635, -1.683705, 0.01960784, 1, 0, 1,
-0.4806055, 0.7255968, -1.140844, 0.01568628, 1, 0, 1,
-0.4747313, -0.3996896, -2.939995, 0.007843138, 1, 0, 1,
-0.4723134, -1.221821, -2.550182, 0.003921569, 1, 0, 1,
-0.4661406, 0.9538512, -0.7687929, 0, 1, 0.003921569, 1,
-0.4549099, 1.247398, 0.3319328, 0, 1, 0.01176471, 1,
-0.4537457, 0.07726831, -2.190662, 0, 1, 0.01568628, 1,
-0.4537447, -0.6053118, -1.645199, 0, 1, 0.02352941, 1,
-0.451347, -0.2206417, -1.359654, 0, 1, 0.02745098, 1,
-0.4508958, -0.4219478, -4.015855, 0, 1, 0.03529412, 1,
-0.4497427, 0.215583, -0.3684609, 0, 1, 0.03921569, 1,
-0.4487757, -0.9962767, -3.083781, 0, 1, 0.04705882, 1,
-0.4483891, -0.7614015, -1.792267, 0, 1, 0.05098039, 1,
-0.4451344, 2.395706, 0.233242, 0, 1, 0.05882353, 1,
-0.4415458, -0.8309519, -0.9425536, 0, 1, 0.0627451, 1,
-0.4352074, -0.7715715, -4.257782, 0, 1, 0.07058824, 1,
-0.431799, -1.122394, -1.951573, 0, 1, 0.07450981, 1,
-0.4274797, -1.491228, -3.641932, 0, 1, 0.08235294, 1,
-0.4270316, 1.023167, -0.2615344, 0, 1, 0.08627451, 1,
-0.4265512, 0.436913, -1.26424, 0, 1, 0.09411765, 1,
-0.4214916, 1.675639, 0.2085893, 0, 1, 0.1019608, 1,
-0.420897, -1.261886, -5.020055, 0, 1, 0.1058824, 1,
-0.4169991, -1.215459, -1.518301, 0, 1, 0.1137255, 1,
-0.413881, -0.2466951, -1.143926, 0, 1, 0.1176471, 1,
-0.4094802, -0.1142992, -1.983784, 0, 1, 0.1254902, 1,
-0.4076802, -1.488541, -2.90069, 0, 1, 0.1294118, 1,
-0.4049692, 0.2345586, -0.6143004, 0, 1, 0.1372549, 1,
-0.403959, 1.158942, -1.598464, 0, 1, 0.1411765, 1,
-0.3987169, 0.9121606, 1.090321, 0, 1, 0.1490196, 1,
-0.3972674, -0.3623685, -2.955381, 0, 1, 0.1529412, 1,
-0.3969203, -0.4353261, -1.127568, 0, 1, 0.1607843, 1,
-0.3967959, -1.020579, -3.241732, 0, 1, 0.1647059, 1,
-0.394013, -1.653524, -3.997638, 0, 1, 0.172549, 1,
-0.3885691, -0.4210959, -2.326941, 0, 1, 0.1764706, 1,
-0.3867274, 1.462993, -2.336431, 0, 1, 0.1843137, 1,
-0.38517, 0.1558192, -3.897216, 0, 1, 0.1882353, 1,
-0.3823725, 0.7614611, -0.7770873, 0, 1, 0.1960784, 1,
-0.3786255, 0.1582283, -0.1074891, 0, 1, 0.2039216, 1,
-0.3773663, -0.1661287, -3.524889, 0, 1, 0.2078431, 1,
-0.3766358, 1.149934, -1.348605, 0, 1, 0.2156863, 1,
-0.3739223, 0.1896052, -1.689899, 0, 1, 0.2196078, 1,
-0.3719867, -0.2873947, -4.648185, 0, 1, 0.227451, 1,
-0.3625031, -1.352147, -3.335065, 0, 1, 0.2313726, 1,
-0.3510207, -1.862466, -2.680299, 0, 1, 0.2392157, 1,
-0.3509542, 1.050449, 0.9185626, 0, 1, 0.2431373, 1,
-0.349755, 0.5532615, 0.7977042, 0, 1, 0.2509804, 1,
-0.3462639, -1.373524, -3.806522, 0, 1, 0.254902, 1,
-0.3461096, -0.5313611, -2.386322, 0, 1, 0.2627451, 1,
-0.3437726, -0.489911, -2.73211, 0, 1, 0.2666667, 1,
-0.3378454, 1.795073, -0.1862288, 0, 1, 0.2745098, 1,
-0.3374205, 0.8113959, -0.6565939, 0, 1, 0.2784314, 1,
-0.3371849, 0.512944, -0.6401857, 0, 1, 0.2862745, 1,
-0.3362044, 0.3402678, -0.06779829, 0, 1, 0.2901961, 1,
-0.3358561, -0.7026054, -3.600404, 0, 1, 0.2980392, 1,
-0.3350808, 0.879059, -0.3381748, 0, 1, 0.3058824, 1,
-0.3318695, 1.029492, -1.013615, 0, 1, 0.3098039, 1,
-0.328795, -1.065306, -2.182727, 0, 1, 0.3176471, 1,
-0.3253675, 0.05660325, -1.740683, 0, 1, 0.3215686, 1,
-0.3230321, -0.705785, -1.14563, 0, 1, 0.3294118, 1,
-0.3137103, -0.242927, -2.909549, 0, 1, 0.3333333, 1,
-0.3112191, 0.3033499, -1.118741, 0, 1, 0.3411765, 1,
-0.3082915, 0.9101563, 1.875702, 0, 1, 0.345098, 1,
-0.3038383, -0.7606516, -3.756597, 0, 1, 0.3529412, 1,
-0.3022604, 0.5378669, -0.1157097, 0, 1, 0.3568628, 1,
-0.2824576, 0.882723, 0.3042507, 0, 1, 0.3647059, 1,
-0.2797979, -0.8768301, -4.556295, 0, 1, 0.3686275, 1,
-0.2795443, -0.6896017, -4.538482, 0, 1, 0.3764706, 1,
-0.2789225, -0.465268, -3.307859, 0, 1, 0.3803922, 1,
-0.2786879, 1.591484, -0.4522197, 0, 1, 0.3882353, 1,
-0.2758386, -0.6514698, -1.308376, 0, 1, 0.3921569, 1,
-0.2749781, -1.782631, -2.187331, 0, 1, 0.4, 1,
-0.2735163, -0.7610559, -4.427549, 0, 1, 0.4078431, 1,
-0.2684965, -2.357247, -2.016529, 0, 1, 0.4117647, 1,
-0.2677288, -0.0562619, -1.460621, 0, 1, 0.4196078, 1,
-0.2604838, 1.524099, 0.5503671, 0, 1, 0.4235294, 1,
-0.2470991, 0.9571369, 0.01730902, 0, 1, 0.4313726, 1,
-0.2405705, 0.187463, 0.3476446, 0, 1, 0.4352941, 1,
-0.2379831, 1.124495, -0.6430269, 0, 1, 0.4431373, 1,
-0.2377327, -0.4759481, -2.826336, 0, 1, 0.4470588, 1,
-0.2363792, 0.2947688, -1.242772, 0, 1, 0.454902, 1,
-0.2363556, 0.4088255, -1.365048, 0, 1, 0.4588235, 1,
-0.2305465, -2.848794, -3.30141, 0, 1, 0.4666667, 1,
-0.2275048, 0.3757797, 0.7536069, 0, 1, 0.4705882, 1,
-0.2257506, -0.07056713, -1.646185, 0, 1, 0.4784314, 1,
-0.2246584, 0.04507611, -2.149468, 0, 1, 0.4823529, 1,
-0.2223904, -0.6565379, -3.651041, 0, 1, 0.4901961, 1,
-0.221108, -0.7590726, -1.606398, 0, 1, 0.4941176, 1,
-0.2196045, -0.1967228, -2.635549, 0, 1, 0.5019608, 1,
-0.2170289, -0.6726394, -1.266501, 0, 1, 0.509804, 1,
-0.2165239, -0.2736939, -1.99342, 0, 1, 0.5137255, 1,
-0.2115961, -0.07238149, -1.4313, 0, 1, 0.5215687, 1,
-0.2095164, 1.124256, 0.8219858, 0, 1, 0.5254902, 1,
-0.2058439, -0.4325569, -1.172904, 0, 1, 0.5333334, 1,
-0.1972907, -1.320816, -1.703045, 0, 1, 0.5372549, 1,
-0.1867025, 0.7476528, 1.102215, 0, 1, 0.5450981, 1,
-0.1862537, -0.3996552, -2.633511, 0, 1, 0.5490196, 1,
-0.1809195, 0.709238, -2.470774, 0, 1, 0.5568628, 1,
-0.1767544, 0.1143722, -0.7256526, 0, 1, 0.5607843, 1,
-0.1740093, -1.270592, -3.739847, 0, 1, 0.5686275, 1,
-0.1724514, 0.3362348, -0.9637417, 0, 1, 0.572549, 1,
-0.1714862, 2.032943, 0.5876693, 0, 1, 0.5803922, 1,
-0.1679638, 0.07973366, 0.49182, 0, 1, 0.5843138, 1,
-0.1678011, 0.07357256, 0.08741225, 0, 1, 0.5921569, 1,
-0.1667815, -0.9023468, -3.239568, 0, 1, 0.5960785, 1,
-0.1659814, -0.3925684, -1.920006, 0, 1, 0.6039216, 1,
-0.164511, -0.02689678, -2.844159, 0, 1, 0.6117647, 1,
-0.1606628, -0.2273194, -2.025947, 0, 1, 0.6156863, 1,
-0.1588687, -1.80837, -3.032539, 0, 1, 0.6235294, 1,
-0.1558808, -0.4692922, -2.245476, 0, 1, 0.627451, 1,
-0.1549763, 0.3520226, -1.015753, 0, 1, 0.6352941, 1,
-0.1480643, -0.09322871, -3.005661, 0, 1, 0.6392157, 1,
-0.147652, 0.7688614, 0.1216505, 0, 1, 0.6470588, 1,
-0.1455181, 1.41477, -1.689982, 0, 1, 0.6509804, 1,
-0.139687, 0.8157271, -1.618384, 0, 1, 0.6588235, 1,
-0.1382386, 1.774454, 0.4187748, 0, 1, 0.6627451, 1,
-0.1301407, 0.3101915, 0.674016, 0, 1, 0.6705883, 1,
-0.1249377, 1.452718, 0.96722, 0, 1, 0.6745098, 1,
-0.1243829, -0.1377878, -2.754025, 0, 1, 0.682353, 1,
-0.1182822, 0.2902579, -1.691814, 0, 1, 0.6862745, 1,
-0.1173573, 0.03414949, -1.128524, 0, 1, 0.6941177, 1,
-0.1154978, -2.817463, -2.66003, 0, 1, 0.7019608, 1,
-0.1149334, -1.088857, -4.157233, 0, 1, 0.7058824, 1,
-0.1094487, 0.3776553, -0.1218764, 0, 1, 0.7137255, 1,
-0.1091083, 0.3287959, -2.077592, 0, 1, 0.7176471, 1,
-0.1077362, -1.14048, -3.856025, 0, 1, 0.7254902, 1,
-0.1070624, -0.2475778, -3.434985, 0, 1, 0.7294118, 1,
-0.1052581, 0.6466589, -0.2671609, 0, 1, 0.7372549, 1,
-0.1038103, 0.4334922, -0.277063, 0, 1, 0.7411765, 1,
-0.1031763, 0.3166768, 1.66041, 0, 1, 0.7490196, 1,
-0.1000479, -1.148627, -2.505107, 0, 1, 0.7529412, 1,
-0.09983428, 0.3659152, -0.2082729, 0, 1, 0.7607843, 1,
-0.09965894, 1.028133, -2.067274, 0, 1, 0.7647059, 1,
-0.09943284, -1.701486, -2.72153, 0, 1, 0.772549, 1,
-0.09887343, -1.61136, -3.257862, 0, 1, 0.7764706, 1,
-0.09566045, 0.2372639, 0.03853666, 0, 1, 0.7843137, 1,
-0.08715468, -2.422529, -3.101563, 0, 1, 0.7882353, 1,
-0.08314968, 0.4092546, 0.1358494, 0, 1, 0.7960784, 1,
-0.08209363, 1.117069, 0.5475613, 0, 1, 0.8039216, 1,
-0.08001636, 0.06460221, -0.1773971, 0, 1, 0.8078431, 1,
-0.079722, -1.856272, -3.667782, 0, 1, 0.8156863, 1,
-0.07951096, -0.4148884, -3.064282, 0, 1, 0.8196079, 1,
-0.07874771, -0.7560403, -3.761796, 0, 1, 0.827451, 1,
-0.07403941, 0.0271536, -3.384906, 0, 1, 0.8313726, 1,
-0.07243323, -0.7984824, -1.526768, 0, 1, 0.8392157, 1,
-0.07238793, -1.070081, -4.286315, 0, 1, 0.8431373, 1,
-0.07140932, -0.130172, -3.600765, 0, 1, 0.8509804, 1,
-0.06572268, 0.9942515, 0.4692839, 0, 1, 0.854902, 1,
-0.06566185, -0.6031877, -3.536949, 0, 1, 0.8627451, 1,
-0.06496421, -0.6407444, -3.508808, 0, 1, 0.8666667, 1,
-0.06461546, -1.122562, -3.250662, 0, 1, 0.8745098, 1,
-0.06287127, 0.3395062, -0.7771612, 0, 1, 0.8784314, 1,
-0.05317039, 0.9510005, -0.1410717, 0, 1, 0.8862745, 1,
-0.04775228, 0.437989, -1.289301, 0, 1, 0.8901961, 1,
-0.04418006, 0.1880578, 0.4450432, 0, 1, 0.8980392, 1,
-0.04386817, 0.6728269, -0.5312131, 0, 1, 0.9058824, 1,
-0.03708843, 1.362498, -0.6640555, 0, 1, 0.9098039, 1,
-0.03676295, 0.6662402, -2.062796, 0, 1, 0.9176471, 1,
-0.03660071, -0.5793219, -3.043782, 0, 1, 0.9215686, 1,
-0.0313651, -0.9764097, -3.694632, 0, 1, 0.9294118, 1,
-0.0294836, 1.653326, -0.9895296, 0, 1, 0.9333333, 1,
-0.02816332, -0.02747176, -2.82025, 0, 1, 0.9411765, 1,
-0.02698733, -1.29886, -4.809322, 0, 1, 0.945098, 1,
-0.02579255, 1.876589, 1.996641, 0, 1, 0.9529412, 1,
-0.02490366, 0.1428011, 0.08932761, 0, 1, 0.9568627, 1,
-0.01772538, 0.1345286, -0.005708574, 0, 1, 0.9647059, 1,
-0.01487824, 0.669113, -0.7550012, 0, 1, 0.9686275, 1,
-0.01393277, -0.5162148, -2.374026, 0, 1, 0.9764706, 1,
-0.01304075, -0.6246206, -3.227472, 0, 1, 0.9803922, 1,
-0.008368358, -0.7566341, -3.754782, 0, 1, 0.9882353, 1,
-0.002750027, 0.3676129, 0.9087223, 0, 1, 0.9921569, 1,
-0.002484868, 0.02074773, -0.02625808, 0, 1, 1, 1,
-0.0008983074, -0.2229622, -2.794208, 0, 0.9921569, 1, 1,
-0.0001329406, 0.0861496, -0.9557274, 0, 0.9882353, 1, 1,
0.0007735078, -1.557137, 2.016571, 0, 0.9803922, 1, 1,
0.004607168, 2.568105, 1.235276, 0, 0.9764706, 1, 1,
0.005718685, -0.4222419, 3.83786, 0, 0.9686275, 1, 1,
0.005856028, 1.004027, -0.4281491, 0, 0.9647059, 1, 1,
0.00597865, 0.03838737, 0.2333272, 0, 0.9568627, 1, 1,
0.008351628, 1.520377, -0.4225341, 0, 0.9529412, 1, 1,
0.01061885, 2.216126, -0.2156917, 0, 0.945098, 1, 1,
0.01641537, 0.8606057, -0.3199127, 0, 0.9411765, 1, 1,
0.01810794, -0.6244489, 1.807391, 0, 0.9333333, 1, 1,
0.02038983, 0.8417459, -0.4721031, 0, 0.9294118, 1, 1,
0.02659783, 0.7861549, -0.6993459, 0, 0.9215686, 1, 1,
0.02699106, -0.6296176, 0.9754421, 0, 0.9176471, 1, 1,
0.02817244, -1.136783, 2.52951, 0, 0.9098039, 1, 1,
0.03520185, 0.6173081, -1.513099, 0, 0.9058824, 1, 1,
0.03880361, 1.074198, -0.1993764, 0, 0.8980392, 1, 1,
0.03922477, -0.01321488, 0.8391572, 0, 0.8901961, 1, 1,
0.03969537, -1.31418, 2.578299, 0, 0.8862745, 1, 1,
0.0428149, -0.4517526, 3.094003, 0, 0.8784314, 1, 1,
0.04622166, -0.1505093, 2.962479, 0, 0.8745098, 1, 1,
0.04785536, 1.117535, 0.9322723, 0, 0.8666667, 1, 1,
0.04818476, -0.9554148, 2.770825, 0, 0.8627451, 1, 1,
0.04828413, -0.04045119, 0.7297596, 0, 0.854902, 1, 1,
0.04831066, 0.8352713, -0.3692217, 0, 0.8509804, 1, 1,
0.04899146, -1.586613, 4.14916, 0, 0.8431373, 1, 1,
0.0525741, -0.4690624, 3.14998, 0, 0.8392157, 1, 1,
0.05372047, -0.4533556, 3.031525, 0, 0.8313726, 1, 1,
0.05437229, 1.506944, -0.5583119, 0, 0.827451, 1, 1,
0.05859939, 1.850335, 0.7039976, 0, 0.8196079, 1, 1,
0.05936899, -0.3311484, 4.306242, 0, 0.8156863, 1, 1,
0.06618299, -0.2366177, 3.048659, 0, 0.8078431, 1, 1,
0.06675378, -0.862719, 4.559942, 0, 0.8039216, 1, 1,
0.0702054, 1.530908, 0.2578813, 0, 0.7960784, 1, 1,
0.07090168, 1.179439, 0.3316493, 0, 0.7882353, 1, 1,
0.07294144, -1.238522, 2.974103, 0, 0.7843137, 1, 1,
0.076497, -0.266052, 3.17257, 0, 0.7764706, 1, 1,
0.07801826, -0.6177352, 2.203762, 0, 0.772549, 1, 1,
0.07805097, -0.1414812, 1.244743, 0, 0.7647059, 1, 1,
0.07870351, -0.9876095, 1.848071, 0, 0.7607843, 1, 1,
0.07910685, -0.1488362, 2.867593, 0, 0.7529412, 1, 1,
0.08824652, 0.8882584, 0.2955616, 0, 0.7490196, 1, 1,
0.09509006, 0.2968932, -0.1531981, 0, 0.7411765, 1, 1,
0.09670497, -0.9474149, 1.711727, 0, 0.7372549, 1, 1,
0.09749331, 2.217622, 1.721785, 0, 0.7294118, 1, 1,
0.09813438, 1.604374, -0.7641631, 0, 0.7254902, 1, 1,
0.1002893, -0.740258, 1.793703, 0, 0.7176471, 1, 1,
0.1026405, -1.02022, 1.402454, 0, 0.7137255, 1, 1,
0.1046519, 1.272365, -1.369898, 0, 0.7058824, 1, 1,
0.1060012, 1.797063, -0.7401034, 0, 0.6980392, 1, 1,
0.1076527, -0.4157268, 2.338265, 0, 0.6941177, 1, 1,
0.1085221, 0.6282446, 1.126743, 0, 0.6862745, 1, 1,
0.1088014, -0.1533502, 3.331891, 0, 0.682353, 1, 1,
0.1158107, 0.5679414, 1.90154, 0, 0.6745098, 1, 1,
0.1167105, 0.6349254, 0.3678014, 0, 0.6705883, 1, 1,
0.1196237, -0.2886733, 1.980353, 0, 0.6627451, 1, 1,
0.121705, 1.123212, -1.799408, 0, 0.6588235, 1, 1,
0.1275335, -1.052795, 3.787801, 0, 0.6509804, 1, 1,
0.1275636, -0.2553019, 0.7123225, 0, 0.6470588, 1, 1,
0.1284451, -1.117843, 3.551211, 0, 0.6392157, 1, 1,
0.1374804, 0.5496526, 1.575891, 0, 0.6352941, 1, 1,
0.1375242, 1.364218, -1.14175, 0, 0.627451, 1, 1,
0.1395021, 0.8876827, 0.6135694, 0, 0.6235294, 1, 1,
0.1407781, -0.2029861, 2.311625, 0, 0.6156863, 1, 1,
0.1426785, 0.9257969, 0.5850962, 0, 0.6117647, 1, 1,
0.1428855, -0.01467444, 2.299628, 0, 0.6039216, 1, 1,
0.1441221, 0.7420091, -0.3547029, 0, 0.5960785, 1, 1,
0.1490503, -1.623176, 3.554823, 0, 0.5921569, 1, 1,
0.1510024, -0.5162694, 3.053991, 0, 0.5843138, 1, 1,
0.1562629, -1.651239, 2.235388, 0, 0.5803922, 1, 1,
0.1581152, -0.1819833, 3.400271, 0, 0.572549, 1, 1,
0.1620523, 0.2056131, 0.8763573, 0, 0.5686275, 1, 1,
0.1627493, -1.016508, 3.410599, 0, 0.5607843, 1, 1,
0.165629, -0.02886922, 1.230623, 0, 0.5568628, 1, 1,
0.1688094, -2.065982, 1.87068, 0, 0.5490196, 1, 1,
0.1715543, 0.1179015, 1.838458, 0, 0.5450981, 1, 1,
0.1723529, -1.552165, 1.253612, 0, 0.5372549, 1, 1,
0.1726957, 0.4879933, 1.176055, 0, 0.5333334, 1, 1,
0.177585, 1.348722, -1.282955, 0, 0.5254902, 1, 1,
0.177764, 0.1689816, 0.08828443, 0, 0.5215687, 1, 1,
0.1802908, 0.2833772, -0.9563494, 0, 0.5137255, 1, 1,
0.1809762, -0.1518199, 2.840059, 0, 0.509804, 1, 1,
0.1815285, -1.052461, 4.074772, 0, 0.5019608, 1, 1,
0.1815571, 0.009002523, 1.891066, 0, 0.4941176, 1, 1,
0.1816419, 1.032434, 0.6855739, 0, 0.4901961, 1, 1,
0.1818749, -0.4470173, 3.48057, 0, 0.4823529, 1, 1,
0.183773, 0.1897239, 2.293234, 0, 0.4784314, 1, 1,
0.1838988, -1.607091, 2.879014, 0, 0.4705882, 1, 1,
0.185399, -0.5778475, 1.773949, 0, 0.4666667, 1, 1,
0.1886616, -0.0738299, 3.182317, 0, 0.4588235, 1, 1,
0.190099, 0.5265452, -1.084216, 0, 0.454902, 1, 1,
0.1928303, 0.2304685, 0.3081713, 0, 0.4470588, 1, 1,
0.1941563, 0.4633358, 1.025807, 0, 0.4431373, 1, 1,
0.1943923, -0.480134, 0.9480645, 0, 0.4352941, 1, 1,
0.1973785, 0.312553, 2.534585, 0, 0.4313726, 1, 1,
0.2017698, -3.066065, 1.773738, 0, 0.4235294, 1, 1,
0.2080112, -0.4815533, 3.105475, 0, 0.4196078, 1, 1,
0.2093391, 1.182238, -1.227621, 0, 0.4117647, 1, 1,
0.2101216, -0.47163, 2.033758, 0, 0.4078431, 1, 1,
0.2106621, 0.2993993, -1.078929, 0, 0.4, 1, 1,
0.218835, 0.2026462, 0.6484557, 0, 0.3921569, 1, 1,
0.2226834, -0.4189354, 2.333072, 0, 0.3882353, 1, 1,
0.223784, -3.0841, 2.746215, 0, 0.3803922, 1, 1,
0.2268709, 0.1648988, -0.02894483, 0, 0.3764706, 1, 1,
0.2275407, 0.8634816, 1.440816, 0, 0.3686275, 1, 1,
0.2277054, -1.506539, 3.536445, 0, 0.3647059, 1, 1,
0.2282018, 0.2474331, 0.9862416, 0, 0.3568628, 1, 1,
0.2298435, 1.648643, 0.1718897, 0, 0.3529412, 1, 1,
0.2319528, -0.3870633, 1.956792, 0, 0.345098, 1, 1,
0.2394601, 0.8734896, 1.084326, 0, 0.3411765, 1, 1,
0.2421035, 0.00214753, 1.789515, 0, 0.3333333, 1, 1,
0.2443714, -0.4311844, 2.212352, 0, 0.3294118, 1, 1,
0.2445757, -1.049804, 0.4015814, 0, 0.3215686, 1, 1,
0.246902, -1.221259, 3.507599, 0, 0.3176471, 1, 1,
0.2481284, -0.6801077, 3.163287, 0, 0.3098039, 1, 1,
0.2516366, -0.03903335, 1.742848, 0, 0.3058824, 1, 1,
0.2590155, -0.8998747, 4.47808, 0, 0.2980392, 1, 1,
0.2597073, -0.7134559, 3.736624, 0, 0.2901961, 1, 1,
0.2662273, 1.818843, -1.622607, 0, 0.2862745, 1, 1,
0.2666815, 1.270271, 1.036222, 0, 0.2784314, 1, 1,
0.2674011, 0.5757083, 0.3198889, 0, 0.2745098, 1, 1,
0.2727976, -2.124429, 0.9467859, 0, 0.2666667, 1, 1,
0.2737466, -1.491517, 1.893312, 0, 0.2627451, 1, 1,
0.2740437, -0.4782783, 3.225776, 0, 0.254902, 1, 1,
0.2741998, 1.004513, 0.3849706, 0, 0.2509804, 1, 1,
0.2751318, -0.403345, 2.203585, 0, 0.2431373, 1, 1,
0.2757762, -0.541814, 2.640992, 0, 0.2392157, 1, 1,
0.2834561, 0.04722844, 0.1666295, 0, 0.2313726, 1, 1,
0.2873887, -0.020896, 1.685018, 0, 0.227451, 1, 1,
0.2962446, 1.303514, 1.482128, 0, 0.2196078, 1, 1,
0.2996334, 0.1761999, 1.198269, 0, 0.2156863, 1, 1,
0.3043655, 0.2003754, 1.637203, 0, 0.2078431, 1, 1,
0.3056767, -0.3223821, 2.725583, 0, 0.2039216, 1, 1,
0.3072627, -0.8993541, 2.371144, 0, 0.1960784, 1, 1,
0.3074647, 0.03429412, 2.408488, 0, 0.1882353, 1, 1,
0.3091831, 1.295508, -0.1697261, 0, 0.1843137, 1, 1,
0.3177073, -0.3213308, 1.828215, 0, 0.1764706, 1, 1,
0.3191708, 0.2470731, 0.7584231, 0, 0.172549, 1, 1,
0.3205884, 1.387492, 1.80191, 0, 0.1647059, 1, 1,
0.3208633, -0.1491638, 1.809398, 0, 0.1607843, 1, 1,
0.3211582, 1.720281, -0.198264, 0, 0.1529412, 1, 1,
0.3224309, -1.822635, 5.356134, 0, 0.1490196, 1, 1,
0.3237971, -0.09419313, 0.4671709, 0, 0.1411765, 1, 1,
0.3245872, 0.9763975, 0.3839759, 0, 0.1372549, 1, 1,
0.3245873, -0.5024475, 2.718481, 0, 0.1294118, 1, 1,
0.3284008, 0.2601112, 1.211075, 0, 0.1254902, 1, 1,
0.3284057, -0.2548692, 1.637561, 0, 0.1176471, 1, 1,
0.3305576, -0.8441905, 2.015383, 0, 0.1137255, 1, 1,
0.3365871, -2.250185, 2.039704, 0, 0.1058824, 1, 1,
0.3377086, -0.183957, 3.01957, 0, 0.09803922, 1, 1,
0.3453119, 0.3739997, -0.2663652, 0, 0.09411765, 1, 1,
0.346276, 1.453628, 0.1789866, 0, 0.08627451, 1, 1,
0.3484028, 0.003575061, 2.822013, 0, 0.08235294, 1, 1,
0.3498185, -0.5011767, 3.384656, 0, 0.07450981, 1, 1,
0.3515785, -0.305096, 2.827193, 0, 0.07058824, 1, 1,
0.3565094, -1.230245, 3.516702, 0, 0.0627451, 1, 1,
0.3585545, -1.917681, 2.726781, 0, 0.05882353, 1, 1,
0.3736621, -0.7305406, 1.995345, 0, 0.05098039, 1, 1,
0.3743864, 0.871213, 0.2550213, 0, 0.04705882, 1, 1,
0.3804007, -0.849574, 0.6620556, 0, 0.03921569, 1, 1,
0.3817057, -0.2081917, 1.442485, 0, 0.03529412, 1, 1,
0.384076, 1.396624, 0.3688024, 0, 0.02745098, 1, 1,
0.3845265, -1.639768, 3.825798, 0, 0.02352941, 1, 1,
0.386767, 0.0377265, -0.4394286, 0, 0.01568628, 1, 1,
0.3902818, -0.3072761, 2.37403, 0, 0.01176471, 1, 1,
0.3919071, 0.9516062, 1.463303, 0, 0.003921569, 1, 1,
0.3925644, 1.489934, 1.96114, 0.003921569, 0, 1, 1,
0.3928368, 1.229533, -0.03889165, 0.007843138, 0, 1, 1,
0.393048, -0.700922, 1.992837, 0.01568628, 0, 1, 1,
0.3964874, -1.195531, 2.205369, 0.01960784, 0, 1, 1,
0.3989482, 0.2504164, 0.4975721, 0.02745098, 0, 1, 1,
0.4029807, 1.138768, 0.7961984, 0.03137255, 0, 1, 1,
0.4046886, -0.1796288, 0.6688207, 0.03921569, 0, 1, 1,
0.4091398, 0.7070053, -0.3166401, 0.04313726, 0, 1, 1,
0.4176008, 0.3152483, 0.8961547, 0.05098039, 0, 1, 1,
0.4196917, -0.7675714, 2.297331, 0.05490196, 0, 1, 1,
0.4211053, 1.666425, 1.147505, 0.0627451, 0, 1, 1,
0.4219528, 1.228014, 3.480282, 0.06666667, 0, 1, 1,
0.4240928, 1.285292, -0.9200664, 0.07450981, 0, 1, 1,
0.424187, 1.03619, -0.379192, 0.07843138, 0, 1, 1,
0.4253736, 0.2818401, 1.611036, 0.08627451, 0, 1, 1,
0.4259019, -0.04631585, 0.7792824, 0.09019608, 0, 1, 1,
0.4263809, -1.311388, 3.879384, 0.09803922, 0, 1, 1,
0.4274414, -1.152783, 2.879491, 0.1058824, 0, 1, 1,
0.4290102, 1.708643, 0.1096651, 0.1098039, 0, 1, 1,
0.433822, -2.852707, 0.8099548, 0.1176471, 0, 1, 1,
0.4405567, 0.234832, 1.881006, 0.1215686, 0, 1, 1,
0.4425862, -0.2687501, -0.2457063, 0.1294118, 0, 1, 1,
0.4434885, -0.6095455, 3.824395, 0.1333333, 0, 1, 1,
0.443869, 0.1884472, 0.6153193, 0.1411765, 0, 1, 1,
0.4449076, 0.02119906, 1.668814, 0.145098, 0, 1, 1,
0.4482066, 0.469626, 0.5249253, 0.1529412, 0, 1, 1,
0.4485541, 1.219663, 0.764497, 0.1568628, 0, 1, 1,
0.4487887, 0.1246414, 1.657565, 0.1647059, 0, 1, 1,
0.4615766, 1.113584, 0.9481274, 0.1686275, 0, 1, 1,
0.4631603, -2.550871, 1.709625, 0.1764706, 0, 1, 1,
0.4659318, 0.08666239, 2.592415, 0.1803922, 0, 1, 1,
0.4672941, 0.3472353, -0.8096047, 0.1882353, 0, 1, 1,
0.4744529, 0.2550102, 2.000401, 0.1921569, 0, 1, 1,
0.4762834, 0.2822551, 1.929373, 0.2, 0, 1, 1,
0.4790207, -2.692605, 1.379976, 0.2078431, 0, 1, 1,
0.4830554, 1.416909, -1.063487, 0.2117647, 0, 1, 1,
0.4883195, -1.042348, 2.97976, 0.2196078, 0, 1, 1,
0.4911444, -0.4212803, 3.410988, 0.2235294, 0, 1, 1,
0.4920286, -1.316218, 4.147439, 0.2313726, 0, 1, 1,
0.4934458, -0.7363039, 1.043477, 0.2352941, 0, 1, 1,
0.4941994, -1.668418, 3.140518, 0.2431373, 0, 1, 1,
0.502629, -0.2512588, 2.654414, 0.2470588, 0, 1, 1,
0.5038652, 1.0173, -0.4170703, 0.254902, 0, 1, 1,
0.5064766, 0.8675845, 2.351351, 0.2588235, 0, 1, 1,
0.5105681, -0.4984346, 1.675378, 0.2666667, 0, 1, 1,
0.514277, 0.5108775, -0.963811, 0.2705882, 0, 1, 1,
0.5194017, -1.242992, 1.213611, 0.2784314, 0, 1, 1,
0.5219716, -0.186414, 2.251915, 0.282353, 0, 1, 1,
0.5246997, -0.7111763, 2.79337, 0.2901961, 0, 1, 1,
0.5251324, -0.9685119, 2.771284, 0.2941177, 0, 1, 1,
0.5261998, -0.7017256, 0.6508173, 0.3019608, 0, 1, 1,
0.5265263, -1.324241, 1.868033, 0.3098039, 0, 1, 1,
0.5267485, 0.5041724, 1.561675, 0.3137255, 0, 1, 1,
0.5285599, -0.3474821, 2.319058, 0.3215686, 0, 1, 1,
0.5318606, -0.3938605, 3.585768, 0.3254902, 0, 1, 1,
0.5367827, 0.205567, 1.506881, 0.3333333, 0, 1, 1,
0.5381989, 1.157407, -1.361749, 0.3372549, 0, 1, 1,
0.5387895, 0.5171874, 1.064805, 0.345098, 0, 1, 1,
0.5408847, 2.47436, 1.425362, 0.3490196, 0, 1, 1,
0.5462312, -1.508136, 1.816406, 0.3568628, 0, 1, 1,
0.5483379, 1.069673, 2.94023, 0.3607843, 0, 1, 1,
0.5488783, -0.6270984, 2.405257, 0.3686275, 0, 1, 1,
0.54912, 0.3140506, -0.2610381, 0.372549, 0, 1, 1,
0.5509199, 1.047898, 1.490145, 0.3803922, 0, 1, 1,
0.5510029, -0.1307937, 2.376785, 0.3843137, 0, 1, 1,
0.5528412, -0.3005644, 2.339281, 0.3921569, 0, 1, 1,
0.5531062, -0.04494923, 2.288087, 0.3960784, 0, 1, 1,
0.5554845, -1.293716, 2.912449, 0.4039216, 0, 1, 1,
0.562577, 0.3331542, 0.9565328, 0.4117647, 0, 1, 1,
0.5641086, 0.1420623, 1.031022, 0.4156863, 0, 1, 1,
0.5649277, -1.959697, 2.84762, 0.4235294, 0, 1, 1,
0.573329, -0.2934417, 1.898919, 0.427451, 0, 1, 1,
0.5765524, -0.4913634, 1.605711, 0.4352941, 0, 1, 1,
0.5766476, 0.4707321, 1.218836, 0.4392157, 0, 1, 1,
0.5800367, 1.318873, 2.005134, 0.4470588, 0, 1, 1,
0.5804862, -0.2224369, 2.739783, 0.4509804, 0, 1, 1,
0.581857, -1.228627, 4.521073, 0.4588235, 0, 1, 1,
0.5820645, 1.31006, 0.5607446, 0.4627451, 0, 1, 1,
0.5832496, 1.019894, 1.437624, 0.4705882, 0, 1, 1,
0.5832871, -0.3835324, 1.40523, 0.4745098, 0, 1, 1,
0.5838597, 0.5602046, -0.05586725, 0.4823529, 0, 1, 1,
0.5991506, -0.8482462, 3.822595, 0.4862745, 0, 1, 1,
0.6004999, 0.6353056, 0.2328201, 0.4941176, 0, 1, 1,
0.60124, 0.6835086, 1.567932, 0.5019608, 0, 1, 1,
0.6046131, 0.6485819, 0.2536225, 0.5058824, 0, 1, 1,
0.61016, -0.3344642, 1.424255, 0.5137255, 0, 1, 1,
0.6118543, -0.5783232, 1.464293, 0.5176471, 0, 1, 1,
0.6129146, -0.2336173, 4.822517, 0.5254902, 0, 1, 1,
0.6219593, -2.189395, 3.159171, 0.5294118, 0, 1, 1,
0.6246824, -1.318842, 2.34883, 0.5372549, 0, 1, 1,
0.6267241, 0.09156796, 2.541036, 0.5411765, 0, 1, 1,
0.6417531, 0.1925809, 2.342197, 0.5490196, 0, 1, 1,
0.6478747, -1.106875, 3.14755, 0.5529412, 0, 1, 1,
0.6502242, -0.3138, 2.515116, 0.5607843, 0, 1, 1,
0.6642004, 1.077025, 2.148948, 0.5647059, 0, 1, 1,
0.6722611, -0.39464, 2.701346, 0.572549, 0, 1, 1,
0.673098, -0.878661, 1.092661, 0.5764706, 0, 1, 1,
0.6731507, 1.300135, -0.5796446, 0.5843138, 0, 1, 1,
0.6741589, 0.7019127, 0.3011081, 0.5882353, 0, 1, 1,
0.6829336, 1.69255, 2.120052, 0.5960785, 0, 1, 1,
0.6856639, -0.00733768, 2.158357, 0.6039216, 0, 1, 1,
0.6862695, -0.2725365, 1.927047, 0.6078432, 0, 1, 1,
0.6871921, 1.659557, -0.1735205, 0.6156863, 0, 1, 1,
0.6929088, 1.399294, 0.9721221, 0.6196079, 0, 1, 1,
0.6943017, -0.3438654, 2.525925, 0.627451, 0, 1, 1,
0.6964024, 0.6123661, -0.8177451, 0.6313726, 0, 1, 1,
0.696872, -0.2457771, 0.8259518, 0.6392157, 0, 1, 1,
0.6975831, 0.3537312, 0.5751275, 0.6431373, 0, 1, 1,
0.6990791, 0.2305027, 2.315997, 0.6509804, 0, 1, 1,
0.6999256, -0.3621656, 0.8566757, 0.654902, 0, 1, 1,
0.6999798, -1.799946, 2.70735, 0.6627451, 0, 1, 1,
0.7023915, 1.589481, 1.243594, 0.6666667, 0, 1, 1,
0.707446, 0.2229894, 1.484154, 0.6745098, 0, 1, 1,
0.7137433, -1.143365, 4.237117, 0.6784314, 0, 1, 1,
0.7171943, -1.025435, 5.48877, 0.6862745, 0, 1, 1,
0.7175861, 0.1008205, 2.513135, 0.6901961, 0, 1, 1,
0.7250664, -1.151285, 2.095469, 0.6980392, 0, 1, 1,
0.7251366, 1.079036, -1.774185, 0.7058824, 0, 1, 1,
0.7350118, 1.314395, 2.201335, 0.7098039, 0, 1, 1,
0.7387936, -0.1175959, 0.7443878, 0.7176471, 0, 1, 1,
0.7401561, -0.4989846, 3.724643, 0.7215686, 0, 1, 1,
0.7444474, 0.01827264, 1.69927, 0.7294118, 0, 1, 1,
0.7553639, 0.01177856, 0.5048448, 0.7333333, 0, 1, 1,
0.7595314, -1.325671, 3.822239, 0.7411765, 0, 1, 1,
0.7715694, 1.982937, 2.463547, 0.7450981, 0, 1, 1,
0.7718691, 1.25621, -1.15427, 0.7529412, 0, 1, 1,
0.7855446, 0.5950689, 1.252312, 0.7568628, 0, 1, 1,
0.787258, 0.9907085, 0.08327942, 0.7647059, 0, 1, 1,
0.7881874, -0.2058358, 1.008523, 0.7686275, 0, 1, 1,
0.7891968, -1.412007, 2.446331, 0.7764706, 0, 1, 1,
0.794205, 0.09232953, 0.8480597, 0.7803922, 0, 1, 1,
0.8035705, 0.9084982, 0.2882341, 0.7882353, 0, 1, 1,
0.8058755, -1.432012, 2.548995, 0.7921569, 0, 1, 1,
0.8089419, -1.740999, 1.704506, 0.8, 0, 1, 1,
0.8120889, 0.1761515, 0.7360293, 0.8078431, 0, 1, 1,
0.814406, 1.400075, 0.1215189, 0.8117647, 0, 1, 1,
0.8150576, -0.3509147, 1.398141, 0.8196079, 0, 1, 1,
0.8203458, 0.1814638, 3.279709, 0.8235294, 0, 1, 1,
0.8236884, 0.853244, 1.568811, 0.8313726, 0, 1, 1,
0.8248701, 1.290106, 0.4133707, 0.8352941, 0, 1, 1,
0.8305578, 1.978211, 1.141774, 0.8431373, 0, 1, 1,
0.8317081, 0.135264, 2.201004, 0.8470588, 0, 1, 1,
0.8366453, -0.450949, 2.099767, 0.854902, 0, 1, 1,
0.8396438, 1.094212, -0.5066041, 0.8588235, 0, 1, 1,
0.8471894, -0.1408776, 2.990423, 0.8666667, 0, 1, 1,
0.851478, -0.8889369, 0.4065364, 0.8705882, 0, 1, 1,
0.852809, 0.08293149, 1.052682, 0.8784314, 0, 1, 1,
0.8571865, 0.8282808, 0.9348332, 0.8823529, 0, 1, 1,
0.857353, -0.04208027, 0.6045858, 0.8901961, 0, 1, 1,
0.8637521, -0.03141259, 0.1808791, 0.8941177, 0, 1, 1,
0.8786897, -1.120974, 2.532144, 0.9019608, 0, 1, 1,
0.8790009, 0.2515382, 1.829757, 0.9098039, 0, 1, 1,
0.8816513, -0.06710131, 1.718079, 0.9137255, 0, 1, 1,
0.8990393, -1.381235, 1.613364, 0.9215686, 0, 1, 1,
0.9011336, 0.1206926, 2.408263, 0.9254902, 0, 1, 1,
0.9048007, -0.148353, 2.819916, 0.9333333, 0, 1, 1,
0.9076239, 2.197312, -0.02066881, 0.9372549, 0, 1, 1,
0.9127306, -0.06670266, 1.414229, 0.945098, 0, 1, 1,
0.9159404, -0.8949674, 1.311837, 0.9490196, 0, 1, 1,
0.9164467, -2.011547, -0.02884371, 0.9568627, 0, 1, 1,
0.9191241, -0.01639809, 1.817511, 0.9607843, 0, 1, 1,
0.9234066, -1.18717, 2.257647, 0.9686275, 0, 1, 1,
0.9299847, -1.42698, 2.957963, 0.972549, 0, 1, 1,
0.9403992, 0.8379162, 1.182401, 0.9803922, 0, 1, 1,
0.9426996, -0.3063029, 2.258239, 0.9843137, 0, 1, 1,
0.9545924, -0.5385959, 3.11434, 0.9921569, 0, 1, 1,
0.965086, -1.095419, 1.50197, 0.9960784, 0, 1, 1,
0.9666775, 0.5458531, 2.547307, 1, 0, 0.9960784, 1,
0.966736, -1.526519, 1.316728, 1, 0, 0.9882353, 1,
0.9784741, -0.2270589, 2.857246, 1, 0, 0.9843137, 1,
0.9918072, -0.4844323, 0.1269257, 1, 0, 0.9764706, 1,
0.9949929, -0.5414445, 1.360872, 1, 0, 0.972549, 1,
1.006382, -0.5216916, 1.0215, 1, 0, 0.9647059, 1,
1.017205, -1.031421, 1.650008, 1, 0, 0.9607843, 1,
1.017633, 0.06366853, 1.345219, 1, 0, 0.9529412, 1,
1.027177, -2.419435, 1.451782, 1, 0, 0.9490196, 1,
1.036922, 0.8932475, 0.3243132, 1, 0, 0.9411765, 1,
1.041119, -0.8325415, 1.479069, 1, 0, 0.9372549, 1,
1.046541, -0.2372331, 2.425555, 1, 0, 0.9294118, 1,
1.047845, -0.942763, 2.410415, 1, 0, 0.9254902, 1,
1.050075, -1.491124, 2.010479, 1, 0, 0.9176471, 1,
1.055907, -1.269141, 1.555726, 1, 0, 0.9137255, 1,
1.058088, -0.3364344, 0.6620609, 1, 0, 0.9058824, 1,
1.063419, -1.274403, 2.3316, 1, 0, 0.9019608, 1,
1.06528, -0.5120036, 3.145161, 1, 0, 0.8941177, 1,
1.06704, -0.2361941, 0.7724411, 1, 0, 0.8862745, 1,
1.072357, -0.02549923, 1.62378, 1, 0, 0.8823529, 1,
1.084769, -2.445405, 2.362623, 1, 0, 0.8745098, 1,
1.092909, 1.703152, -1.209774, 1, 0, 0.8705882, 1,
1.094555, 1.119733, 0.4570468, 1, 0, 0.8627451, 1,
1.098432, 0.2190613, 0.5672152, 1, 0, 0.8588235, 1,
1.10143, 2.094952, 1.710538, 1, 0, 0.8509804, 1,
1.107079, 0.5232615, 1.30894, 1, 0, 0.8470588, 1,
1.109712, 0.6505162, 1.125716, 1, 0, 0.8392157, 1,
1.116536, 1.23713, 0.7311857, 1, 0, 0.8352941, 1,
1.117893, -1.040579, 2.597771, 1, 0, 0.827451, 1,
1.120031, -0.7676443, 2.480035, 1, 0, 0.8235294, 1,
1.124842, -0.9374675, 2.767694, 1, 0, 0.8156863, 1,
1.127219, -0.2381824, 1.821084, 1, 0, 0.8117647, 1,
1.130806, 0.9015573, 1.31876, 1, 0, 0.8039216, 1,
1.133595, -0.4747218, 2.041386, 1, 0, 0.7960784, 1,
1.139911, -0.9589984, 1.644355, 1, 0, 0.7921569, 1,
1.147087, -2.098738, 3.038096, 1, 0, 0.7843137, 1,
1.155157, 1.684016, 0.4491809, 1, 0, 0.7803922, 1,
1.159949, -0.604965, 1.703511, 1, 0, 0.772549, 1,
1.172917, 0.2457029, 2.098053, 1, 0, 0.7686275, 1,
1.180592, 1.589824, -0.1751953, 1, 0, 0.7607843, 1,
1.180929, -1.555811, 2.586291, 1, 0, 0.7568628, 1,
1.185546, -2.566322, 1.171828, 1, 0, 0.7490196, 1,
1.19027, -0.3947246, 2.417617, 1, 0, 0.7450981, 1,
1.190677, -1.253697, 2.453514, 1, 0, 0.7372549, 1,
1.197504, 2.037944, 0.2332348, 1, 0, 0.7333333, 1,
1.199876, 0.4975556, 0.3309265, 1, 0, 0.7254902, 1,
1.203917, 0.9990133, -0.8463607, 1, 0, 0.7215686, 1,
1.207311, 1.80744, -1.534171, 1, 0, 0.7137255, 1,
1.207392, 0.1961961, 2.375509, 1, 0, 0.7098039, 1,
1.209388, -0.06957371, 0.58007, 1, 0, 0.7019608, 1,
1.212958, 0.08588987, 1.835383, 1, 0, 0.6941177, 1,
1.214706, 0.9588811, -0.365962, 1, 0, 0.6901961, 1,
1.220916, 1.823363, -1.283136, 1, 0, 0.682353, 1,
1.223989, -0.06288844, 0.8886561, 1, 0, 0.6784314, 1,
1.238916, 2.142467, -0.352823, 1, 0, 0.6705883, 1,
1.240631, 0.3236415, 0.4526467, 1, 0, 0.6666667, 1,
1.243534, 0.9716224, -0.09017425, 1, 0, 0.6588235, 1,
1.246449, 0.7130837, 0.2215613, 1, 0, 0.654902, 1,
1.254512, -1.422204, 5.894801, 1, 0, 0.6470588, 1,
1.259026, -0.8036354, 2.015374, 1, 0, 0.6431373, 1,
1.268429, -0.591256, 0.7363408, 1, 0, 0.6352941, 1,
1.270515, 0.2691768, 0.8137572, 1, 0, 0.6313726, 1,
1.272185, -0.3312412, 3.100514, 1, 0, 0.6235294, 1,
1.277319, 0.4879263, 0.2438966, 1, 0, 0.6196079, 1,
1.280906, 0.677893, 0.4695858, 1, 0, 0.6117647, 1,
1.287108, 1.692144, -0.1067413, 1, 0, 0.6078432, 1,
1.295993, -0.1673806, 1.531397, 1, 0, 0.6, 1,
1.30095, 0.5041922, 2.323686, 1, 0, 0.5921569, 1,
1.309995, 0.6101649, -0.06838424, 1, 0, 0.5882353, 1,
1.310071, 0.2685967, 1.237978, 1, 0, 0.5803922, 1,
1.318728, 0.8582061, 0.9322619, 1, 0, 0.5764706, 1,
1.321304, -1.161229, 2.898082, 1, 0, 0.5686275, 1,
1.321865, 0.8822477, -2.013114, 1, 0, 0.5647059, 1,
1.328642, 0.2222565, -0.2375258, 1, 0, 0.5568628, 1,
1.332967, -0.7824873, 1.564453, 1, 0, 0.5529412, 1,
1.352306, -0.8335653, 2.586408, 1, 0, 0.5450981, 1,
1.353437, 0.3183422, 3.003179, 1, 0, 0.5411765, 1,
1.355631, 0.5792422, 0.9270964, 1, 0, 0.5333334, 1,
1.36014, -0.2794188, 2.648496, 1, 0, 0.5294118, 1,
1.360954, -0.1374644, 0.09992947, 1, 0, 0.5215687, 1,
1.364875, -1.317517, 3.693566, 1, 0, 0.5176471, 1,
1.365847, -0.9476209, 1.285899, 1, 0, 0.509804, 1,
1.368277, 1.285071, 0.9869027, 1, 0, 0.5058824, 1,
1.36926, -1.179016, 3.328498, 1, 0, 0.4980392, 1,
1.374712, -0.5104949, 3.089089, 1, 0, 0.4901961, 1,
1.375327, -0.7037264, 2.249964, 1, 0, 0.4862745, 1,
1.431628, 0.5224733, 1.901906, 1, 0, 0.4784314, 1,
1.434275, -0.6336377, 1.845901, 1, 0, 0.4745098, 1,
1.448938, -0.6697689, 2.509701, 1, 0, 0.4666667, 1,
1.452491, 1.038739, 0.8651113, 1, 0, 0.4627451, 1,
1.459394, -1.254271, 2.185403, 1, 0, 0.454902, 1,
1.473453, 1.00512, 1.451946, 1, 0, 0.4509804, 1,
1.473958, -0.5310261, 2.480656, 1, 0, 0.4431373, 1,
1.476281, -2.213377, 2.03145, 1, 0, 0.4392157, 1,
1.491519, -1.080599, 1.411862, 1, 0, 0.4313726, 1,
1.492189, 1.548568, 2.51426, 1, 0, 0.427451, 1,
1.506413, -0.4132014, 2.419827, 1, 0, 0.4196078, 1,
1.513444, -1.044553, 2.108045, 1, 0, 0.4156863, 1,
1.515047, 0.9826807, 1.183388, 1, 0, 0.4078431, 1,
1.521984, 0.4298787, 1.098686, 1, 0, 0.4039216, 1,
1.523329, 0.8200613, 0.7031524, 1, 0, 0.3960784, 1,
1.534619, 0.4558023, 2.388546, 1, 0, 0.3882353, 1,
1.536029, 0.2898731, 0.08128379, 1, 0, 0.3843137, 1,
1.542325, -1.472952, -0.2346862, 1, 0, 0.3764706, 1,
1.545807, 1.322909, 0.3903327, 1, 0, 0.372549, 1,
1.58649, 0.3088047, 1.713006, 1, 0, 0.3647059, 1,
1.59043, -0.6281276, 2.881329, 1, 0, 0.3607843, 1,
1.594835, 0.2555633, 1.379438, 1, 0, 0.3529412, 1,
1.608131, -0.4639553, 2.708713, 1, 0, 0.3490196, 1,
1.612228, -0.2457658, 0.1726836, 1, 0, 0.3411765, 1,
1.6243, -0.6367407, 2.013819, 1, 0, 0.3372549, 1,
1.626483, 1.202682, -0.009666484, 1, 0, 0.3294118, 1,
1.628355, 0.7767, 3.320824, 1, 0, 0.3254902, 1,
1.630772, 0.7104548, 1.566001, 1, 0, 0.3176471, 1,
1.639805, 1.862961, 1.089508, 1, 0, 0.3137255, 1,
1.651254, -1.23294, 1.770171, 1, 0, 0.3058824, 1,
1.679605, 1.218711, 2.589358, 1, 0, 0.2980392, 1,
1.683739, -1.391757, 3.36765, 1, 0, 0.2941177, 1,
1.687548, -0.08861043, 1.363087, 1, 0, 0.2862745, 1,
1.69056, 0.5106913, -0.7497898, 1, 0, 0.282353, 1,
1.696041, 0.1256762, 2.183271, 1, 0, 0.2745098, 1,
1.698484, -0.8315002, -0.1392749, 1, 0, 0.2705882, 1,
1.701086, 0.2516319, 1.950831, 1, 0, 0.2627451, 1,
1.70148, 0.5995559, 2.303037, 1, 0, 0.2588235, 1,
1.703795, 0.442483, 1.900484, 1, 0, 0.2509804, 1,
1.70466, -0.4262278, 0.8783945, 1, 0, 0.2470588, 1,
1.707313, -1.305485, 1.68727, 1, 0, 0.2392157, 1,
1.743721, -0.4085248, 1.553612, 1, 0, 0.2352941, 1,
1.769694, -1.542924, 2.709952, 1, 0, 0.227451, 1,
1.771601, 0.3973739, 1.128178, 1, 0, 0.2235294, 1,
1.776338, 0.9738582, 2.212625, 1, 0, 0.2156863, 1,
1.793039, 0.812557, 2.910268, 1, 0, 0.2117647, 1,
1.809744, 0.1386702, 1.47883, 1, 0, 0.2039216, 1,
1.820463, -0.2079683, 4.438427, 1, 0, 0.1960784, 1,
1.858932, 1.687076, 1.40123, 1, 0, 0.1921569, 1,
1.928517, -0.5332136, 2.138303, 1, 0, 0.1843137, 1,
1.968458, -1.891745, 2.076414, 1, 0, 0.1803922, 1,
2.005091, 1.091897, 2.209481, 1, 0, 0.172549, 1,
2.008766, 0.5414548, 0.8555279, 1, 0, 0.1686275, 1,
2.019602, 1.407669, 0.4460309, 1, 0, 0.1607843, 1,
2.053851, 0.6985451, 3.068752, 1, 0, 0.1568628, 1,
2.058039, -1.504684, 1.469636, 1, 0, 0.1490196, 1,
2.069722, -2.243944, 2.797415, 1, 0, 0.145098, 1,
2.090723, 1.128287, 0.6788373, 1, 0, 0.1372549, 1,
2.09494, 1.620398, 0.1183619, 1, 0, 0.1333333, 1,
2.105597, -0.07398824, 1.490564, 1, 0, 0.1254902, 1,
2.107664, -1.467865, 2.686272, 1, 0, 0.1215686, 1,
2.113861, 0.6812183, 0.8489082, 1, 0, 0.1137255, 1,
2.136619, 0.4933137, 2.863643, 1, 0, 0.1098039, 1,
2.144441, 0.2499372, 0.658881, 1, 0, 0.1019608, 1,
2.15938, -2.562103, 1.79343, 1, 0, 0.09411765, 1,
2.168387, 0.6423829, 0.722056, 1, 0, 0.09019608, 1,
2.227628, 0.4587384, -0.5349498, 1, 0, 0.08235294, 1,
2.233939, -0.3057705, 1.3713, 1, 0, 0.07843138, 1,
2.235209, -0.4721987, 0.6469952, 1, 0, 0.07058824, 1,
2.258417, 0.5101732, 0.1493399, 1, 0, 0.06666667, 1,
2.274249, -0.7035117, 3.126379, 1, 0, 0.05882353, 1,
2.286214, -0.8869972, 4.010166, 1, 0, 0.05490196, 1,
2.339066, -0.8538091, -0.1196961, 1, 0, 0.04705882, 1,
2.390002, -0.01007334, 0.305635, 1, 0, 0.04313726, 1,
2.397843, -0.2360355, 1.308604, 1, 0, 0.03529412, 1,
2.414382, -0.04916835, 2.393333, 1, 0, 0.03137255, 1,
2.585685, -0.9334089, 1.875784, 1, 0, 0.02352941, 1,
2.711462, -0.7724504, 0.8832437, 1, 0, 0.01960784, 1,
2.737453, -0.4540965, 1.799191, 1, 0, 0.01176471, 1,
2.976326, -0.1936523, 1.961947, 1, 0, 0.007843138, 1
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
-0.06032443, -4.04215, -6.870123, 0, -0.5, 0.5, 0.5,
-0.06032443, -4.04215, -6.870123, 1, -0.5, 0.5, 0.5,
-0.06032443, -4.04215, -6.870123, 1, 1.5, 0.5, 0.5,
-0.06032443, -4.04215, -6.870123, 0, 1.5, 0.5, 0.5
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
-4.1264, -0.2579976, -6.870123, 0, -0.5, 0.5, 0.5,
-4.1264, -0.2579976, -6.870123, 1, -0.5, 0.5, 0.5,
-4.1264, -0.2579976, -6.870123, 1, 1.5, 0.5, 0.5,
-4.1264, -0.2579976, -6.870123, 0, 1.5, 0.5, 0.5
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
-4.1264, -4.04215, 0.4373727, 0, -0.5, 0.5, 0.5,
-4.1264, -4.04215, 0.4373727, 1, -0.5, 0.5, 0.5,
-4.1264, -4.04215, 0.4373727, 1, 1.5, 0.5, 0.5,
-4.1264, -4.04215, 0.4373727, 0, 1.5, 0.5, 0.5
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
-3, -3.168884, -5.183778,
2, -3.168884, -5.183778,
-3, -3.168884, -5.183778,
-3, -3.314428, -5.464836,
-2, -3.168884, -5.183778,
-2, -3.314428, -5.464836,
-1, -3.168884, -5.183778,
-1, -3.314428, -5.464836,
0, -3.168884, -5.183778,
0, -3.314428, -5.464836,
1, -3.168884, -5.183778,
1, -3.314428, -5.464836,
2, -3.168884, -5.183778,
2, -3.314428, -5.464836
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
-3, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
-3, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
-3, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
-3, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5,
-2, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
-2, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
-2, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
-2, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5,
-1, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
-1, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
-1, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
-1, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5,
0, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
0, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
0, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
0, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5,
1, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
1, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
1, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
1, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5,
2, -3.605516, -6.026951, 0, -0.5, 0.5, 0.5,
2, -3.605516, -6.026951, 1, -0.5, 0.5, 0.5,
2, -3.605516, -6.026951, 1, 1.5, 0.5, 0.5,
2, -3.605516, -6.026951, 0, 1.5, 0.5, 0.5
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
-3.188075, -3, -5.183778,
-3.188075, 2, -5.183778,
-3.188075, -3, -5.183778,
-3.344462, -3, -5.464836,
-3.188075, -2, -5.183778,
-3.344462, -2, -5.464836,
-3.188075, -1, -5.183778,
-3.344462, -1, -5.464836,
-3.188075, 0, -5.183778,
-3.344462, 0, -5.464836,
-3.188075, 1, -5.183778,
-3.344462, 1, -5.464836,
-3.188075, 2, -5.183778,
-3.344462, 2, -5.464836
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
-3.657238, -3, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, -3, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, -3, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, -3, -6.026951, 0, 1.5, 0.5, 0.5,
-3.657238, -2, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, -2, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, -2, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, -2, -6.026951, 0, 1.5, 0.5, 0.5,
-3.657238, -1, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, -1, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, -1, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, -1, -6.026951, 0, 1.5, 0.5, 0.5,
-3.657238, 0, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, 0, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, 0, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, 0, -6.026951, 0, 1.5, 0.5, 0.5,
-3.657238, 1, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, 1, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, 1, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, 1, -6.026951, 0, 1.5, 0.5, 0.5,
-3.657238, 2, -6.026951, 0, -0.5, 0.5, 0.5,
-3.657238, 2, -6.026951, 1, -0.5, 0.5, 0.5,
-3.657238, 2, -6.026951, 1, 1.5, 0.5, 0.5,
-3.657238, 2, -6.026951, 0, 1.5, 0.5, 0.5
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
-3.188075, -3.168884, -4,
-3.188075, -3.168884, 4,
-3.188075, -3.168884, -4,
-3.344462, -3.314428, -4,
-3.188075, -3.168884, -2,
-3.344462, -3.314428, -2,
-3.188075, -3.168884, 0,
-3.344462, -3.314428, 0,
-3.188075, -3.168884, 2,
-3.344462, -3.314428, 2,
-3.188075, -3.168884, 4,
-3.344462, -3.314428, 4
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
-3.657238, -3.605516, -4, 0, -0.5, 0.5, 0.5,
-3.657238, -3.605516, -4, 1, -0.5, 0.5, 0.5,
-3.657238, -3.605516, -4, 1, 1.5, 0.5, 0.5,
-3.657238, -3.605516, -4, 0, 1.5, 0.5, 0.5,
-3.657238, -3.605516, -2, 0, -0.5, 0.5, 0.5,
-3.657238, -3.605516, -2, 1, -0.5, 0.5, 0.5,
-3.657238, -3.605516, -2, 1, 1.5, 0.5, 0.5,
-3.657238, -3.605516, -2, 0, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 0, 0, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 0, 1, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 0, 1, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 0, 0, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 2, 0, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 2, 1, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 2, 1, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 2, 0, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 4, 0, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 4, 1, -0.5, 0.5, 0.5,
-3.657238, -3.605516, 4, 1, 1.5, 0.5, 0.5,
-3.657238, -3.605516, 4, 0, 1.5, 0.5, 0.5
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
-3.188075, -3.168884, -5.183778,
-3.188075, 2.652888, -5.183778,
-3.188075, -3.168884, 6.058524,
-3.188075, 2.652888, 6.058524,
-3.188075, -3.168884, -5.183778,
-3.188075, -3.168884, 6.058524,
-3.188075, 2.652888, -5.183778,
-3.188075, 2.652888, 6.058524,
-3.188075, -3.168884, -5.183778,
3.067426, -3.168884, -5.183778,
-3.188075, -3.168884, 6.058524,
3.067426, -3.168884, 6.058524,
-3.188075, 2.652888, -5.183778,
3.067426, 2.652888, -5.183778,
-3.188075, 2.652888, 6.058524,
3.067426, 2.652888, 6.058524,
3.067426, -3.168884, -5.183778,
3.067426, 2.652888, -5.183778,
3.067426, -3.168884, 6.058524,
3.067426, 2.652888, 6.058524,
3.067426, -3.168884, -5.183778,
3.067426, -3.168884, 6.058524,
3.067426, 2.652888, -5.183778,
3.067426, 2.652888, 6.058524
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
var radius = 7.540548;
var distance = 33.54875;
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
mvMatrix.translate( 0.06032443, 0.2579976, -0.4373727 );
mvMatrix.scale( 1.303331, 1.400431, 0.7252064 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54875);
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


