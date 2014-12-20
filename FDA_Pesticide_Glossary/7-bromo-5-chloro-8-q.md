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
-3.746211, 0.4790073, -2.722048, 1, 0, 0, 1,
-2.895399, 1.354693, -3.38978, 1, 0.007843138, 0, 1,
-2.811332, 1.229407, -0.497064, 1, 0.01176471, 0, 1,
-2.577888, 0.9145719, -1.35296, 1, 0.01960784, 0, 1,
-2.493357, 0.5789729, -2.812156, 1, 0.02352941, 0, 1,
-2.458477, -0.7121472, -2.354184, 1, 0.03137255, 0, 1,
-2.327724, -1.143091, -0.422996, 1, 0.03529412, 0, 1,
-2.307901, 0.606114, -1.169184, 1, 0.04313726, 0, 1,
-2.307256, 0.5333929, -1.267369, 1, 0.04705882, 0, 1,
-2.304949, -0.03922853, 0.6111032, 1, 0.05490196, 0, 1,
-2.227868, 2.115599, -0.5346811, 1, 0.05882353, 0, 1,
-2.127763, -0.4364031, -2.887089, 1, 0.06666667, 0, 1,
-2.101529, -0.07102108, -3.139503, 1, 0.07058824, 0, 1,
-2.072805, -0.03533687, -0.9642063, 1, 0.07843138, 0, 1,
-2.0618, 0.8656747, -0.4246653, 1, 0.08235294, 0, 1,
-2.058139, 0.5061705, -1.557446, 1, 0.09019608, 0, 1,
-2.046604, -0.382753, -2.275905, 1, 0.09411765, 0, 1,
-2.03234, 0.6587713, -1.253442, 1, 0.1019608, 0, 1,
-1.985964, 0.1621295, -1.330951, 1, 0.1098039, 0, 1,
-1.955378, 0.7097762, -0.6741756, 1, 0.1137255, 0, 1,
-1.852424, -0.03858837, -1.576567, 1, 0.1215686, 0, 1,
-1.850068, -0.1882076, -2.298893, 1, 0.1254902, 0, 1,
-1.842896, 0.983126, 0.04998955, 1, 0.1333333, 0, 1,
-1.828938, -1.652279, -2.604646, 1, 0.1372549, 0, 1,
-1.804662, -1.398165, -2.597, 1, 0.145098, 0, 1,
-1.802386, 0.3613986, -0.7256656, 1, 0.1490196, 0, 1,
-1.758476, 0.9813148, -0.5229009, 1, 0.1568628, 0, 1,
-1.748009, 1.759726, -0.9007523, 1, 0.1607843, 0, 1,
-1.744029, 0.84174, -1.115379, 1, 0.1686275, 0, 1,
-1.733228, 1.562569, -0.4449953, 1, 0.172549, 0, 1,
-1.697347, 0.8523818, -2.419942, 1, 0.1803922, 0, 1,
-1.691746, 0.4676732, -2.049362, 1, 0.1843137, 0, 1,
-1.686137, 1.632305, -1.128929, 1, 0.1921569, 0, 1,
-1.68305, -1.218396, -3.669577, 1, 0.1960784, 0, 1,
-1.683009, 0.575718, 0.3725489, 1, 0.2039216, 0, 1,
-1.659684, -0.1674079, -1.558515, 1, 0.2117647, 0, 1,
-1.640525, -0.8981683, -0.6391429, 1, 0.2156863, 0, 1,
-1.630468, 1.419588, -1.739375, 1, 0.2235294, 0, 1,
-1.623252, -0.05121932, -3.482459, 1, 0.227451, 0, 1,
-1.613954, -0.5244683, -1.769791, 1, 0.2352941, 0, 1,
-1.609755, 1.507358, -1.72342, 1, 0.2392157, 0, 1,
-1.607803, -0.4336301, -1.865711, 1, 0.2470588, 0, 1,
-1.589127, -1.38043, -2.776223, 1, 0.2509804, 0, 1,
-1.582195, 1.94631, -1.091285, 1, 0.2588235, 0, 1,
-1.572002, 0.8476323, -1.711968, 1, 0.2627451, 0, 1,
-1.566651, -0.09321844, -1.689869, 1, 0.2705882, 0, 1,
-1.563085, -0.02443214, -2.051539, 1, 0.2745098, 0, 1,
-1.562437, 0.7380078, -2.747, 1, 0.282353, 0, 1,
-1.558739, -0.7286739, -2.980586, 1, 0.2862745, 0, 1,
-1.550195, 0.7861046, -1.316841, 1, 0.2941177, 0, 1,
-1.54082, 0.06529759, -1.327217, 1, 0.3019608, 0, 1,
-1.535404, -0.5759441, -1.267774, 1, 0.3058824, 0, 1,
-1.528454, 0.7490728, -3.79074, 1, 0.3137255, 0, 1,
-1.515224, 0.07541276, -2.001514, 1, 0.3176471, 0, 1,
-1.514781, 1.513123, 1.099144, 1, 0.3254902, 0, 1,
-1.510038, 2.412695, -0.8290799, 1, 0.3294118, 0, 1,
-1.508271, 0.08816029, -2.017109, 1, 0.3372549, 0, 1,
-1.505121, 1.126116, -0.5446806, 1, 0.3411765, 0, 1,
-1.504492, 0.7245253, -2.128447, 1, 0.3490196, 0, 1,
-1.492396, -1.311346, -4.000399, 1, 0.3529412, 0, 1,
-1.488442, 1.274973, -0.6134097, 1, 0.3607843, 0, 1,
-1.483653, 1.655561, -0.6769354, 1, 0.3647059, 0, 1,
-1.480631, 0.7427231, -1.845016, 1, 0.372549, 0, 1,
-1.476972, -1.526852, -2.173042, 1, 0.3764706, 0, 1,
-1.45837, 0.7558573, -1.404696, 1, 0.3843137, 0, 1,
-1.456363, 0.5723628, 0.3533968, 1, 0.3882353, 0, 1,
-1.45105, 0.8911296, -0.6932728, 1, 0.3960784, 0, 1,
-1.44892, -0.2119605, -3.373962, 1, 0.4039216, 0, 1,
-1.443434, -1.253719, -2.594778, 1, 0.4078431, 0, 1,
-1.432298, -0.3125752, -2.280178, 1, 0.4156863, 0, 1,
-1.429961, -0.7732552, -2.199916, 1, 0.4196078, 0, 1,
-1.428414, 0.1481782, 0.3245288, 1, 0.427451, 0, 1,
-1.41579, 1.674774, -1.784079, 1, 0.4313726, 0, 1,
-1.412148, 0.9104951, -2.360965, 1, 0.4392157, 0, 1,
-1.399165, 0.2807203, -1.662662, 1, 0.4431373, 0, 1,
-1.396512, -1.036082, -0.962075, 1, 0.4509804, 0, 1,
-1.392784, 2.081288, -0.6342854, 1, 0.454902, 0, 1,
-1.392135, -1.977114, -1.684841, 1, 0.4627451, 0, 1,
-1.390171, -2.219826, -3.252887, 1, 0.4666667, 0, 1,
-1.3764, -0.03763809, -1.753718, 1, 0.4745098, 0, 1,
-1.370096, 0.5132446, 0.003417263, 1, 0.4784314, 0, 1,
-1.36853, -0.5582733, -1.060673, 1, 0.4862745, 0, 1,
-1.35999, 1.146493, -2.38728, 1, 0.4901961, 0, 1,
-1.359446, -0.07720533, -1.913515, 1, 0.4980392, 0, 1,
-1.356471, -0.5424272, -1.834409, 1, 0.5058824, 0, 1,
-1.349759, 1.058249, -0.6832737, 1, 0.509804, 0, 1,
-1.343344, -0.121106, -0.3294643, 1, 0.5176471, 0, 1,
-1.343306, -0.3182273, -1.743746, 1, 0.5215687, 0, 1,
-1.342019, -1.659549, -1.920956, 1, 0.5294118, 0, 1,
-1.341642, -0.1904985, -2.778678, 1, 0.5333334, 0, 1,
-1.328313, 0.2746754, -1.596618, 1, 0.5411765, 0, 1,
-1.322977, -1.12175, -3.401473, 1, 0.5450981, 0, 1,
-1.318997, 0.4978358, -2.283198, 1, 0.5529412, 0, 1,
-1.318508, 0.3688508, -1.85657, 1, 0.5568628, 0, 1,
-1.315617, 0.1828221, -1.307511, 1, 0.5647059, 0, 1,
-1.311752, 1.401293, -1.305373, 1, 0.5686275, 0, 1,
-1.311242, 0.3276449, -0.6874239, 1, 0.5764706, 0, 1,
-1.306868, 0.3564023, 0.8338658, 1, 0.5803922, 0, 1,
-1.299926, -0.5267565, -1.337347, 1, 0.5882353, 0, 1,
-1.288851, -1.515014, -3.294764, 1, 0.5921569, 0, 1,
-1.280548, 1.614934, -1.574013, 1, 0.6, 0, 1,
-1.268181, 0.3907651, -1.288926, 1, 0.6078432, 0, 1,
-1.2677, 0.8960421, -0.3595052, 1, 0.6117647, 0, 1,
-1.266059, -1.824215, -1.87464, 1, 0.6196079, 0, 1,
-1.245252, 0.2571103, -0.2931249, 1, 0.6235294, 0, 1,
-1.230678, 0.4513444, -0.6340356, 1, 0.6313726, 0, 1,
-1.215936, 0.5366223, -0.2714039, 1, 0.6352941, 0, 1,
-1.208875, 0.7409162, -0.6761848, 1, 0.6431373, 0, 1,
-1.198564, -1.660844, -2.177841, 1, 0.6470588, 0, 1,
-1.197092, 2.216098, 0.02333214, 1, 0.654902, 0, 1,
-1.192191, -0.3982755, -1.674367, 1, 0.6588235, 0, 1,
-1.188186, 0.5041104, -1.401444, 1, 0.6666667, 0, 1,
-1.187253, -1.236007, -1.965859, 1, 0.6705883, 0, 1,
-1.187251, -1.074468, -3.228374, 1, 0.6784314, 0, 1,
-1.179184, -0.7952841, -2.812552, 1, 0.682353, 0, 1,
-1.175276, 0.6118506, -1.582959, 1, 0.6901961, 0, 1,
-1.1722, -0.4649635, -1.550093, 1, 0.6941177, 0, 1,
-1.168898, 0.7717271, 0.2898315, 1, 0.7019608, 0, 1,
-1.165561, 0.9413955, -0.2687915, 1, 0.7098039, 0, 1,
-1.164682, 0.7599804, -1.699409, 1, 0.7137255, 0, 1,
-1.150424, -1.566473, -1.643321, 1, 0.7215686, 0, 1,
-1.144346, -0.04455742, -2.080327, 1, 0.7254902, 0, 1,
-1.141871, 0.2723306, -1.909381, 1, 0.7333333, 0, 1,
-1.135297, 0.008239413, -1.805766, 1, 0.7372549, 0, 1,
-1.132796, 0.5264989, -1.15058, 1, 0.7450981, 0, 1,
-1.13243, -0.007567696, -1.325697, 1, 0.7490196, 0, 1,
-1.130624, -0.1813936, -2.167401, 1, 0.7568628, 0, 1,
-1.121091, -2.103685, -2.31615, 1, 0.7607843, 0, 1,
-1.118426, 1.145705, -1.462041, 1, 0.7686275, 0, 1,
-1.11634, -0.2213241, -1.354036, 1, 0.772549, 0, 1,
-1.108736, -0.3431465, -2.55621, 1, 0.7803922, 0, 1,
-1.106034, 2.440927, 0.1149181, 1, 0.7843137, 0, 1,
-1.091696, -0.5934707, -1.337252, 1, 0.7921569, 0, 1,
-1.09093, -1.036721, -2.981188, 1, 0.7960784, 0, 1,
-1.089349, 1.615377, 0.4052184, 1, 0.8039216, 0, 1,
-1.085589, 0.8861471, -0.1066676, 1, 0.8117647, 0, 1,
-1.080252, -2.071485, -3.767595, 1, 0.8156863, 0, 1,
-1.079527, 0.2342931, -2.615132, 1, 0.8235294, 0, 1,
-1.074335, 0.7515798, -0.6518889, 1, 0.827451, 0, 1,
-1.069221, 0.7263818, -1.460617, 1, 0.8352941, 0, 1,
-1.068602, -0.9614472, -1.558979, 1, 0.8392157, 0, 1,
-1.064736, -1.500951, -2.20563, 1, 0.8470588, 0, 1,
-1.064193, -0.1006701, -1.102832, 1, 0.8509804, 0, 1,
-1.046307, 2.259447, 2.194581, 1, 0.8588235, 0, 1,
-1.042249, -1.347593, -1.784389, 1, 0.8627451, 0, 1,
-1.03971, -1.403512, -1.878768, 1, 0.8705882, 0, 1,
-1.039417, -0.4314516, -0.06166681, 1, 0.8745098, 0, 1,
-1.037401, -0.7436826, -2.017542, 1, 0.8823529, 0, 1,
-1.036416, -0.04458658, -1.311522, 1, 0.8862745, 0, 1,
-1.036252, 2.48341, 0.08525611, 1, 0.8941177, 0, 1,
-1.032145, -0.01496813, -0.5067943, 1, 0.8980392, 0, 1,
-1.029377, -1.24214, -2.852192, 1, 0.9058824, 0, 1,
-1.028298, -0.2374617, -0.6036417, 1, 0.9137255, 0, 1,
-1.027856, -0.002630004, -1.243542, 1, 0.9176471, 0, 1,
-1.02727, -1.6367, -3.04795, 1, 0.9254902, 0, 1,
-1.021945, -0.3812439, -1.118789, 1, 0.9294118, 0, 1,
-1.021488, -0.6760397, -0.5958229, 1, 0.9372549, 0, 1,
-1.008383, 0.909256, 1.477164, 1, 0.9411765, 0, 1,
-1.005383, 0.4225739, -0.4586022, 1, 0.9490196, 0, 1,
-1.001805, -0.6191826, -4.354686, 1, 0.9529412, 0, 1,
-1.001739, -0.7008309, -1.84432, 1, 0.9607843, 0, 1,
-0.9996479, -1.311363, -2.23372, 1, 0.9647059, 0, 1,
-0.9988808, -0.1199722, -0.3976943, 1, 0.972549, 0, 1,
-0.9957348, -1.22608, -2.254314, 1, 0.9764706, 0, 1,
-0.9898829, 0.9052053, -0.6357247, 1, 0.9843137, 0, 1,
-0.980827, 0.5205463, -2.170937, 1, 0.9882353, 0, 1,
-0.969918, -0.2978841, -2.642076, 1, 0.9960784, 0, 1,
-0.9610239, -0.729452, -2.596474, 0.9960784, 1, 0, 1,
-0.959474, -1.117398, -1.802792, 0.9921569, 1, 0, 1,
-0.959186, 0.02328021, -2.954467, 0.9843137, 1, 0, 1,
-0.9590587, 0.1843036, -1.472275, 0.9803922, 1, 0, 1,
-0.9495607, 0.3076381, -1.776858, 0.972549, 1, 0, 1,
-0.9476212, -0.9184875, -1.918882, 0.9686275, 1, 0, 1,
-0.9337525, 0.4880877, -0.01014756, 0.9607843, 1, 0, 1,
-0.9322279, 1.359957, 0.5654878, 0.9568627, 1, 0, 1,
-0.9320793, 0.2589033, -1.430266, 0.9490196, 1, 0, 1,
-0.931967, 1.070361, -1.417472, 0.945098, 1, 0, 1,
-0.9288746, 0.9489753, -3.04387, 0.9372549, 1, 0, 1,
-0.9288037, 0.4615326, -0.5681856, 0.9333333, 1, 0, 1,
-0.926716, 0.2967593, -1.688093, 0.9254902, 1, 0, 1,
-0.924403, -0.1097384, -2.278924, 0.9215686, 1, 0, 1,
-0.9196727, -2.059916, -3.65965, 0.9137255, 1, 0, 1,
-0.9155205, 1.343715, -0.5446822, 0.9098039, 1, 0, 1,
-0.9126008, -0.1273974, 0.2353217, 0.9019608, 1, 0, 1,
-0.9124361, -1.208446, -1.083319, 0.8941177, 1, 0, 1,
-0.9113969, -0.1368773, -0.5100518, 0.8901961, 1, 0, 1,
-0.9113123, 1.271451, -0.8158715, 0.8823529, 1, 0, 1,
-0.9084824, 0.2729562, -1.381847, 0.8784314, 1, 0, 1,
-0.902523, 0.3998757, -2.530801, 0.8705882, 1, 0, 1,
-0.8985515, -1.317984, -2.547047, 0.8666667, 1, 0, 1,
-0.8972709, -0.113889, -0.7748837, 0.8588235, 1, 0, 1,
-0.8950902, -1.445026, -3.110614, 0.854902, 1, 0, 1,
-0.8945525, -1.853511, -1.382955, 0.8470588, 1, 0, 1,
-0.8906805, 0.5229241, -2.703398, 0.8431373, 1, 0, 1,
-0.890485, -0.6634239, -1.181561, 0.8352941, 1, 0, 1,
-0.887245, 0.236468, -1.693002, 0.8313726, 1, 0, 1,
-0.886136, 1.186045, -0.07551626, 0.8235294, 1, 0, 1,
-0.871047, -0.5177701, -1.994823, 0.8196079, 1, 0, 1,
-0.8675444, -2.526561, -2.20911, 0.8117647, 1, 0, 1,
-0.8670743, -0.4857404, -1.663347, 0.8078431, 1, 0, 1,
-0.8668501, 1.88285, -1.577168, 0.8, 1, 0, 1,
-0.8605819, 0.5787188, -2.214825, 0.7921569, 1, 0, 1,
-0.858071, -0.487349, -1.722502, 0.7882353, 1, 0, 1,
-0.8512538, -1.639366, -2.7999, 0.7803922, 1, 0, 1,
-0.8443448, 0.3598633, -2.224559, 0.7764706, 1, 0, 1,
-0.8408945, -0.1736581, -0.5259297, 0.7686275, 1, 0, 1,
-0.8350942, 0.8770372, -1.546496, 0.7647059, 1, 0, 1,
-0.8345112, -1.333552, -2.578695, 0.7568628, 1, 0, 1,
-0.8312057, 0.5566678, -0.3521822, 0.7529412, 1, 0, 1,
-0.8296866, 0.6447878, -1.236675, 0.7450981, 1, 0, 1,
-0.8278751, 0.05376608, -1.398409, 0.7411765, 1, 0, 1,
-0.827428, -0.3099052, -1.793769, 0.7333333, 1, 0, 1,
-0.8249694, 1.136958, -0.2512671, 0.7294118, 1, 0, 1,
-0.8247722, -0.38912, -3.591205, 0.7215686, 1, 0, 1,
-0.823639, -1.036007, -2.134934, 0.7176471, 1, 0, 1,
-0.8174914, -0.4911182, -2.38901, 0.7098039, 1, 0, 1,
-0.8174874, 1.150442, -0.01990975, 0.7058824, 1, 0, 1,
-0.815929, -0.8297521, -1.036247, 0.6980392, 1, 0, 1,
-0.8152223, 0.2251542, -1.398802, 0.6901961, 1, 0, 1,
-0.8132806, -0.009238305, -2.464402, 0.6862745, 1, 0, 1,
-0.8104169, 0.5511162, -1.590822, 0.6784314, 1, 0, 1,
-0.8078954, 0.3198098, -1.620681, 0.6745098, 1, 0, 1,
-0.7955724, -0.3497935, -2.314957, 0.6666667, 1, 0, 1,
-0.7952325, -2.233091, -3.545463, 0.6627451, 1, 0, 1,
-0.7886412, 0.683896, -1.14446, 0.654902, 1, 0, 1,
-0.784255, -1.538263, -2.90306, 0.6509804, 1, 0, 1,
-0.7836475, 0.7164389, 0.1239314, 0.6431373, 1, 0, 1,
-0.7822989, 0.3566099, -1.901529, 0.6392157, 1, 0, 1,
-0.7812847, 1.127658, -0.8191386, 0.6313726, 1, 0, 1,
-0.7809498, 0.1956307, 0.2364323, 0.627451, 1, 0, 1,
-0.7800083, -0.2181967, -2.971112, 0.6196079, 1, 0, 1,
-0.7789091, 0.2897118, -0.9895599, 0.6156863, 1, 0, 1,
-0.7757652, 0.6016528, -0.5591918, 0.6078432, 1, 0, 1,
-0.77483, -1.286258, -2.443398, 0.6039216, 1, 0, 1,
-0.7724664, -1.231278, -2.66741, 0.5960785, 1, 0, 1,
-0.7650273, 1.142486, 0.2372952, 0.5882353, 1, 0, 1,
-0.7598936, -0.3615355, -1.074918, 0.5843138, 1, 0, 1,
-0.744584, -1.092292, -2.824209, 0.5764706, 1, 0, 1,
-0.7385365, 0.3252787, -1.601343, 0.572549, 1, 0, 1,
-0.7315218, -0.9641368, -3.272341, 0.5647059, 1, 0, 1,
-0.7204411, -0.1044293, -0.620039, 0.5607843, 1, 0, 1,
-0.7199265, 0.2119894, -1.690606, 0.5529412, 1, 0, 1,
-0.717257, -0.6613868, -2.541757, 0.5490196, 1, 0, 1,
-0.713693, -1.685133, -2.252543, 0.5411765, 1, 0, 1,
-0.7127358, -2.226974, -0.9197662, 0.5372549, 1, 0, 1,
-0.710968, -1.858802, -2.048459, 0.5294118, 1, 0, 1,
-0.7104592, 0.5238447, 0.5860598, 0.5254902, 1, 0, 1,
-0.7102784, -0.7315781, -1.869116, 0.5176471, 1, 0, 1,
-0.7099617, -0.193915, -1.113239, 0.5137255, 1, 0, 1,
-0.7076566, 3.084434, 0.9393057, 0.5058824, 1, 0, 1,
-0.7049814, 0.4097034, -1.065354, 0.5019608, 1, 0, 1,
-0.7007106, -1.030097, -3.15527, 0.4941176, 1, 0, 1,
-0.6998318, 0.2912148, -1.740772, 0.4862745, 1, 0, 1,
-0.6992336, -2.366617, -2.735655, 0.4823529, 1, 0, 1,
-0.6987171, -0.7680236, -2.799395, 0.4745098, 1, 0, 1,
-0.6983728, -0.2769133, -4.01074, 0.4705882, 1, 0, 1,
-0.6969247, -1.478017, -1.718493, 0.4627451, 1, 0, 1,
-0.6936288, 2.551627, 2.013767, 0.4588235, 1, 0, 1,
-0.6932909, 0.3706775, -0.7315155, 0.4509804, 1, 0, 1,
-0.6920276, 0.5194063, -2.26248, 0.4470588, 1, 0, 1,
-0.691542, 0.1186353, -1.663349, 0.4392157, 1, 0, 1,
-0.6884915, 0.541405, -0.3305917, 0.4352941, 1, 0, 1,
-0.6875181, -0.6412899, -2.898707, 0.427451, 1, 0, 1,
-0.6770079, -0.1484721, -3.951314, 0.4235294, 1, 0, 1,
-0.6685049, -0.3978697, -2.566864, 0.4156863, 1, 0, 1,
-0.6665904, 0.934302, 0.5261878, 0.4117647, 1, 0, 1,
-0.6661622, 1.055689, -0.6845609, 0.4039216, 1, 0, 1,
-0.665593, 0.07730169, -1.487689, 0.3960784, 1, 0, 1,
-0.6649342, 0.2136631, -1.40497, 0.3921569, 1, 0, 1,
-0.6643707, -0.7714033, -3.326063, 0.3843137, 1, 0, 1,
-0.6622888, -0.3402165, 0.09997074, 0.3803922, 1, 0, 1,
-0.6554334, 1.854267, 1.003145, 0.372549, 1, 0, 1,
-0.6490558, -0.009893845, -0.4485105, 0.3686275, 1, 0, 1,
-0.6488698, -0.9902058, -3.517445, 0.3607843, 1, 0, 1,
-0.6481956, 0.663393, -0.968869, 0.3568628, 1, 0, 1,
-0.642231, 1.889467, 0.229983, 0.3490196, 1, 0, 1,
-0.6420356, -0.3689717, -1.144228, 0.345098, 1, 0, 1,
-0.6341503, -0.5249843, -2.625396, 0.3372549, 1, 0, 1,
-0.6309802, 1.796222, -0.6096849, 0.3333333, 1, 0, 1,
-0.6225204, 1.852255, 0.1165161, 0.3254902, 1, 0, 1,
-0.6187364, -1.067083, -2.266124, 0.3215686, 1, 0, 1,
-0.6184871, 1.089067, 0.1095897, 0.3137255, 1, 0, 1,
-0.6138061, -0.7404724, -4.01253, 0.3098039, 1, 0, 1,
-0.6125786, -0.235557, -3.610244, 0.3019608, 1, 0, 1,
-0.6119229, -0.5776803, -3.47764, 0.2941177, 1, 0, 1,
-0.6109016, -0.8720263, -1.333117, 0.2901961, 1, 0, 1,
-0.6100482, 0.1461253, -1.977584, 0.282353, 1, 0, 1,
-0.6087707, -0.34213, -2.331879, 0.2784314, 1, 0, 1,
-0.6031509, -0.6314723, -3.712823, 0.2705882, 1, 0, 1,
-0.5975929, -0.04305837, -1.980915, 0.2666667, 1, 0, 1,
-0.5922659, -0.6461068, -2.386465, 0.2588235, 1, 0, 1,
-0.5922427, 0.4426861, -0.7333895, 0.254902, 1, 0, 1,
-0.5910943, -0.5559972, -1.372865, 0.2470588, 1, 0, 1,
-0.5907176, 1.262243, -0.8106738, 0.2431373, 1, 0, 1,
-0.5838214, 0.6660605, -0.7446194, 0.2352941, 1, 0, 1,
-0.5828088, 0.6512854, -0.5296628, 0.2313726, 1, 0, 1,
-0.5806337, -0.2679933, -1.968967, 0.2235294, 1, 0, 1,
-0.5789982, 1.100163, -1.486696, 0.2196078, 1, 0, 1,
-0.5783993, -0.5954279, -2.284889, 0.2117647, 1, 0, 1,
-0.5747331, -0.0232826, -1.472734, 0.2078431, 1, 0, 1,
-0.5717729, -0.3176886, -2.688883, 0.2, 1, 0, 1,
-0.5711927, -0.5018026, -1.768344, 0.1921569, 1, 0, 1,
-0.5684341, -0.5615324, -1.957183, 0.1882353, 1, 0, 1,
-0.565651, -0.2440003, 0.2910668, 0.1803922, 1, 0, 1,
-0.5642579, 0.7514377, 0.08637925, 0.1764706, 1, 0, 1,
-0.5609036, 1.952788, -0.6257262, 0.1686275, 1, 0, 1,
-0.5600331, 1.002405, 0.3738379, 0.1647059, 1, 0, 1,
-0.5563413, -0.01455505, -3.309002, 0.1568628, 1, 0, 1,
-0.5557179, 0.1808235, 0.0794441, 0.1529412, 1, 0, 1,
-0.5510665, 0.8156854, -1.874197, 0.145098, 1, 0, 1,
-0.5507048, -0.5058017, -2.56302, 0.1411765, 1, 0, 1,
-0.547115, -0.4267364, -1.440522, 0.1333333, 1, 0, 1,
-0.5452527, 3.081677, -0.2578537, 0.1294118, 1, 0, 1,
-0.5441694, -1.374001, -2.826535, 0.1215686, 1, 0, 1,
-0.5410194, -0.1309233, -2.302776, 0.1176471, 1, 0, 1,
-0.5405338, -1.592316, -0.7700091, 0.1098039, 1, 0, 1,
-0.5381523, 0.1425837, -1.009862, 0.1058824, 1, 0, 1,
-0.5354807, 1.663164, -1.38597, 0.09803922, 1, 0, 1,
-0.5197741, 0.4621463, -2.115528, 0.09019608, 1, 0, 1,
-0.5175991, -0.2900026, -2.856543, 0.08627451, 1, 0, 1,
-0.5110118, -2.116408, -3.184633, 0.07843138, 1, 0, 1,
-0.5107416, -0.1648839, -1.267652, 0.07450981, 1, 0, 1,
-0.5089557, -0.8138897, -3.739878, 0.06666667, 1, 0, 1,
-0.5068162, -0.3351582, -2.004881, 0.0627451, 1, 0, 1,
-0.5051202, 2.45126, -1.159649, 0.05490196, 1, 0, 1,
-0.4941565, 0.7391765, -3.11907, 0.05098039, 1, 0, 1,
-0.4931225, 1.107881, -1.825963, 0.04313726, 1, 0, 1,
-0.4926039, -0.6576629, -1.880727, 0.03921569, 1, 0, 1,
-0.4847352, 0.5246764, -1.192627, 0.03137255, 1, 0, 1,
-0.4829734, 0.2426693, -1.002949, 0.02745098, 1, 0, 1,
-0.4774642, 1.350026, -1.413126, 0.01960784, 1, 0, 1,
-0.4757867, 0.8157233, 0.6116549, 0.01568628, 1, 0, 1,
-0.4756363, 0.9314654, 0.716529, 0.007843138, 1, 0, 1,
-0.4740157, 0.8967351, -2.048169, 0.003921569, 1, 0, 1,
-0.4734001, 1.346211, -1.459135, 0, 1, 0.003921569, 1,
-0.4714069, -1.191925, -3.474003, 0, 1, 0.01176471, 1,
-0.470525, -1.957414, -2.570939, 0, 1, 0.01568628, 1,
-0.4684137, -2.219889, -3.10918, 0, 1, 0.02352941, 1,
-0.4674296, -1.48531, -3.167158, 0, 1, 0.02745098, 1,
-0.4672259, -0.3437383, -3.769608, 0, 1, 0.03529412, 1,
-0.4667535, 0.2926016, -0.9, 0, 1, 0.03921569, 1,
-0.460503, -0.4427973, -2.720912, 0, 1, 0.04705882, 1,
-0.4513034, -0.04058684, -0.4552158, 0, 1, 0.05098039, 1,
-0.4464726, 0.04677636, -0.9772151, 0, 1, 0.05882353, 1,
-0.4437259, -0.440919, -3.274083, 0, 1, 0.0627451, 1,
-0.4431277, 1.853927, -0.8265847, 0, 1, 0.07058824, 1,
-0.4383129, 1.121145, -0.4872841, 0, 1, 0.07450981, 1,
-0.4304202, -0.5762635, -2.932408, 0, 1, 0.08235294, 1,
-0.4285687, -0.2773009, -1.508559, 0, 1, 0.08627451, 1,
-0.427794, -1.123268, -2.085754, 0, 1, 0.09411765, 1,
-0.4263674, 0.07907885, -1.325389, 0, 1, 0.1019608, 1,
-0.4225913, -0.4540653, -2.098803, 0, 1, 0.1058824, 1,
-0.4166138, 0.2171281, -1.637164, 0, 1, 0.1137255, 1,
-0.4081336, -0.3719261, -1.781372, 0, 1, 0.1176471, 1,
-0.4056916, 0.2061932, -0.2636617, 0, 1, 0.1254902, 1,
-0.4016209, -1.520435, -3.937444, 0, 1, 0.1294118, 1,
-0.401546, -0.7718856, -3.334453, 0, 1, 0.1372549, 1,
-0.4005525, -0.4705594, -4.128676, 0, 1, 0.1411765, 1,
-0.3992726, -0.1020962, -0.7158327, 0, 1, 0.1490196, 1,
-0.3877551, -0.2009746, -0.09534729, 0, 1, 0.1529412, 1,
-0.382916, -1.500038, -1.329396, 0, 1, 0.1607843, 1,
-0.3817886, 0.853221, -0.922939, 0, 1, 0.1647059, 1,
-0.3788296, -0.2070162, -2.770641, 0, 1, 0.172549, 1,
-0.3735814, 1.351606, 0.1960513, 0, 1, 0.1764706, 1,
-0.373378, -1.686669, -2.575599, 0, 1, 0.1843137, 1,
-0.3641503, 0.6034214, 0.8985272, 0, 1, 0.1882353, 1,
-0.3602559, 0.3445196, -1.792056, 0, 1, 0.1960784, 1,
-0.359406, 1.560521, 0.0699885, 0, 1, 0.2039216, 1,
-0.3572667, -0.2659895, -2.245531, 0, 1, 0.2078431, 1,
-0.3565623, 1.760856, -0.3247112, 0, 1, 0.2156863, 1,
-0.343312, 0.7036117, -0.2940004, 0, 1, 0.2196078, 1,
-0.3417259, 0.5561795, 0.5823531, 0, 1, 0.227451, 1,
-0.3299183, 0.6209534, 1.177114, 0, 1, 0.2313726, 1,
-0.329692, -0.3540561, -4.732289, 0, 1, 0.2392157, 1,
-0.3259296, -1.812901, -2.6311, 0, 1, 0.2431373, 1,
-0.325063, 0.6218372, -1.958563, 0, 1, 0.2509804, 1,
-0.3189752, 1.801669, 1.43958, 0, 1, 0.254902, 1,
-0.3127169, -0.7084986, -1.755456, 0, 1, 0.2627451, 1,
-0.3048701, -0.06371596, -2.188418, 0, 1, 0.2666667, 1,
-0.2966069, 1.253933, -0.02889617, 0, 1, 0.2745098, 1,
-0.2935666, -0.8621928, -2.645585, 0, 1, 0.2784314, 1,
-0.2899173, -1.23505, -3.337585, 0, 1, 0.2862745, 1,
-0.2844059, 0.7191824, -0.9964854, 0, 1, 0.2901961, 1,
-0.2809873, -0.3456146, -3.749698, 0, 1, 0.2980392, 1,
-0.2718478, 0.6648602, 0.6815972, 0, 1, 0.3058824, 1,
-0.2717266, -0.8404262, -2.622044, 0, 1, 0.3098039, 1,
-0.2708365, 0.750322, -0.07210768, 0, 1, 0.3176471, 1,
-0.2664953, -0.1024078, -1.281429, 0, 1, 0.3215686, 1,
-0.2600592, -0.9757866, -1.348567, 0, 1, 0.3294118, 1,
-0.2594166, 0.6446685, -1.045532, 0, 1, 0.3333333, 1,
-0.2560468, 1.271091, -0.5463525, 0, 1, 0.3411765, 1,
-0.2545465, 0.1247259, -0.9003064, 0, 1, 0.345098, 1,
-0.250901, 1.000164, -0.2953069, 0, 1, 0.3529412, 1,
-0.2500413, 0.4857267, 1.639991, 0, 1, 0.3568628, 1,
-0.2493996, -0.07538445, -1.951106, 0, 1, 0.3647059, 1,
-0.2492671, 0.7208384, -1.219525, 0, 1, 0.3686275, 1,
-0.2489998, 0.6189643, -1.157604, 0, 1, 0.3764706, 1,
-0.2478133, -0.2933534, -2.410127, 0, 1, 0.3803922, 1,
-0.2460068, -1.069656, -2.544003, 0, 1, 0.3882353, 1,
-0.2377718, -0.2056126, -2.424114, 0, 1, 0.3921569, 1,
-0.2354529, -1.194603, -1.205945, 0, 1, 0.4, 1,
-0.2328833, 0.3511135, -0.2836368, 0, 1, 0.4078431, 1,
-0.2286425, 1.18946, 0.3915153, 0, 1, 0.4117647, 1,
-0.2244051, 0.2844775, -2.491378, 0, 1, 0.4196078, 1,
-0.2203588, 1.399344, 0.5000302, 0, 1, 0.4235294, 1,
-0.2178027, -0.7695736, -1.857332, 0, 1, 0.4313726, 1,
-0.2161135, 0.481447, 0.3445264, 0, 1, 0.4352941, 1,
-0.2147193, -2.355965, -3.536305, 0, 1, 0.4431373, 1,
-0.2130935, -0.5653861, -2.602229, 0, 1, 0.4470588, 1,
-0.2122575, -0.2703041, -1.827515, 0, 1, 0.454902, 1,
-0.2069087, -1.772249, -3.334296, 0, 1, 0.4588235, 1,
-0.2049293, -0.3259325, -2.484244, 0, 1, 0.4666667, 1,
-0.1997385, 0.8011063, 0.1958918, 0, 1, 0.4705882, 1,
-0.1974831, 0.7241821, 0.3430822, 0, 1, 0.4784314, 1,
-0.1971838, 1.932194, -0.5642245, 0, 1, 0.4823529, 1,
-0.1969576, -0.4367147, -1.551655, 0, 1, 0.4901961, 1,
-0.1938511, -0.2991664, -2.214318, 0, 1, 0.4941176, 1,
-0.1936158, -0.5452284, -2.852088, 0, 1, 0.5019608, 1,
-0.1933765, 1.76388, -1.143218, 0, 1, 0.509804, 1,
-0.1859077, -0.3475353, -2.465588, 0, 1, 0.5137255, 1,
-0.1844039, -0.4132777, -3.75104, 0, 1, 0.5215687, 1,
-0.1806215, -0.6943644, -1.017547, 0, 1, 0.5254902, 1,
-0.1765888, 0.2481887, -0.5358761, 0, 1, 0.5333334, 1,
-0.175302, 0.4840117, 0.0670443, 0, 1, 0.5372549, 1,
-0.1698759, -0.3161968, -1.793267, 0, 1, 0.5450981, 1,
-0.1678983, 0.3072831, -1.423964, 0, 1, 0.5490196, 1,
-0.166843, -1.28275, -2.409365, 0, 1, 0.5568628, 1,
-0.1616743, 1.075595, 0.6088838, 0, 1, 0.5607843, 1,
-0.1611452, -0.9131194, -3.439141, 0, 1, 0.5686275, 1,
-0.1589261, 0.4448948, -1.321197, 0, 1, 0.572549, 1,
-0.1573666, -0.1249493, -2.331468, 0, 1, 0.5803922, 1,
-0.1539361, 0.6084056, 1.414631, 0, 1, 0.5843138, 1,
-0.1534136, 1.325187, -0.3877388, 0, 1, 0.5921569, 1,
-0.1519842, 0.8862497, -0.6275685, 0, 1, 0.5960785, 1,
-0.1473096, -0.3170547, -1.847183, 0, 1, 0.6039216, 1,
-0.1449823, -1.137833, -3.233663, 0, 1, 0.6117647, 1,
-0.1425561, -1.801892, -3.304461, 0, 1, 0.6156863, 1,
-0.1411234, -0.6464413, -3.126223, 0, 1, 0.6235294, 1,
-0.1397635, -0.6308739, -3.895899, 0, 1, 0.627451, 1,
-0.1395891, 0.07238283, -1.701234, 0, 1, 0.6352941, 1,
-0.1355316, 0.9879127, -0.4994491, 0, 1, 0.6392157, 1,
-0.1337078, 1.162004, -0.1270039, 0, 1, 0.6470588, 1,
-0.1313312, 0.6777427, 0.4416941, 0, 1, 0.6509804, 1,
-0.1228156, 0.1489134, 1.332368, 0, 1, 0.6588235, 1,
-0.1201481, 1.51164, 0.3639217, 0, 1, 0.6627451, 1,
-0.1197135, 0.7704963, 0.1447152, 0, 1, 0.6705883, 1,
-0.1190801, -0.04726212, -1.318606, 0, 1, 0.6745098, 1,
-0.1150207, 2.638544, -1.007922, 0, 1, 0.682353, 1,
-0.113997, 0.245369, -0.5341059, 0, 1, 0.6862745, 1,
-0.110665, -0.1167523, -2.716805, 0, 1, 0.6941177, 1,
-0.1087678, 1.537634, -0.1379719, 0, 1, 0.7019608, 1,
-0.108342, -0.259978, -3.648504, 0, 1, 0.7058824, 1,
-0.1068704, 0.132334, -0.9576895, 0, 1, 0.7137255, 1,
-0.1068166, 1.15585, -0.1938753, 0, 1, 0.7176471, 1,
-0.1052643, 0.7873709, -0.3742152, 0, 1, 0.7254902, 1,
-0.1022335, 0.07352084, -1.532727, 0, 1, 0.7294118, 1,
-0.101281, 0.9405479, 0.4228705, 0, 1, 0.7372549, 1,
-0.1007978, -0.8351253, -1.772085, 0, 1, 0.7411765, 1,
-0.09566201, 0.677128, -0.2944263, 0, 1, 0.7490196, 1,
-0.09362186, 0.9234043, -1.714361, 0, 1, 0.7529412, 1,
-0.09157623, -1.094586, -4.452182, 0, 1, 0.7607843, 1,
-0.09074838, 0.3528055, -0.1954514, 0, 1, 0.7647059, 1,
-0.08998074, -1.661494, -2.346213, 0, 1, 0.772549, 1,
-0.08653013, 2.285936, -0.8022064, 0, 1, 0.7764706, 1,
-0.08537786, -0.2658766, -2.274901, 0, 1, 0.7843137, 1,
-0.07899465, -0.3353444, -3.022937, 0, 1, 0.7882353, 1,
-0.07353206, 0.6047811, -0.2609071, 0, 1, 0.7960784, 1,
-0.07246578, 0.4496431, -0.7520298, 0, 1, 0.8039216, 1,
-0.06994661, 0.0273457, -0.4017733, 0, 1, 0.8078431, 1,
-0.06979837, -0.07382031, -2.438667, 0, 1, 0.8156863, 1,
-0.06924424, 1.97794, -0.08301982, 0, 1, 0.8196079, 1,
-0.06789922, 1.208141, -0.5673182, 0, 1, 0.827451, 1,
-0.05652951, -0.6294256, -4.749954, 0, 1, 0.8313726, 1,
-0.05219338, 0.1123243, -1.691166, 0, 1, 0.8392157, 1,
-0.05114834, -1.369402, -1.840474, 0, 1, 0.8431373, 1,
-0.0502343, -0.6129104, -2.297273, 0, 1, 0.8509804, 1,
-0.0493945, 0.507991, -1.061643, 0, 1, 0.854902, 1,
-0.04788906, 0.2904945, -2.09449, 0, 1, 0.8627451, 1,
-0.04557411, -0.05736024, -3.023498, 0, 1, 0.8666667, 1,
-0.04544326, -2.423588, -2.679856, 0, 1, 0.8745098, 1,
-0.04529021, -0.3841751, -3.347075, 0, 1, 0.8784314, 1,
-0.03729391, 0.494513, -0.3130279, 0, 1, 0.8862745, 1,
-0.02629029, 2.107562, 0.4770248, 0, 1, 0.8901961, 1,
-0.02090241, -0.9336277, -4.965669, 0, 1, 0.8980392, 1,
-0.01804848, 0.2371142, 1.569356, 0, 1, 0.9058824, 1,
-0.01784894, 0.5385339, -1.150259, 0, 1, 0.9098039, 1,
-0.016641, 1.138734, 0.5339829, 0, 1, 0.9176471, 1,
-0.01335221, -0.4306521, -3.364538, 0, 1, 0.9215686, 1,
-0.006576577, -0.09443467, -5.142403, 0, 1, 0.9294118, 1,
-0.005841804, 0.5788264, -0.1088974, 0, 1, 0.9333333, 1,
-0.004070926, 0.1869233, -2.735695, 0, 1, 0.9411765, 1,
-0.003232687, 1.834654, -0.1945351, 0, 1, 0.945098, 1,
-0.002173577, -0.04134732, -1.992597, 0, 1, 0.9529412, 1,
-0.0004240855, 0.301313, 0.579197, 0, 1, 0.9568627, 1,
0.006504308, 0.4663787, -1.035481, 0, 1, 0.9647059, 1,
0.007268534, -1.373426, 2.659276, 0, 1, 0.9686275, 1,
0.007731405, 0.5164273, 0.9970255, 0, 1, 0.9764706, 1,
0.01536696, 0.358046, 0.1939421, 0, 1, 0.9803922, 1,
0.01811159, -0.1448673, 1.496928, 0, 1, 0.9882353, 1,
0.02142179, 1.082661, -0.8240198, 0, 1, 0.9921569, 1,
0.02228433, -1.642775, 3.471695, 0, 1, 1, 1,
0.02549651, -0.5793642, 3.792986, 0, 0.9921569, 1, 1,
0.02857383, 0.6023703, -0.7818961, 0, 0.9882353, 1, 1,
0.03409645, -0.00187977, 1.159303, 0, 0.9803922, 1, 1,
0.03693417, 0.415573, 1.39143, 0, 0.9764706, 1, 1,
0.0396588, 0.8974409, -0.9321893, 0, 0.9686275, 1, 1,
0.04417213, 0.02256849, 2.680343, 0, 0.9647059, 1, 1,
0.04467526, 0.631382, -0.5058523, 0, 0.9568627, 1, 1,
0.04598876, -0.2638983, 3.234755, 0, 0.9529412, 1, 1,
0.04602175, 1.69159, 1.383905, 0, 0.945098, 1, 1,
0.0491582, -0.4229495, 3.960319, 0, 0.9411765, 1, 1,
0.05157204, -0.3350612, 4.600809, 0, 0.9333333, 1, 1,
0.05195487, 0.5738507, -0.8830272, 0, 0.9294118, 1, 1,
0.05231452, 0.3898788, 0.486139, 0, 0.9215686, 1, 1,
0.05537405, -0.1030694, 1.794322, 0, 0.9176471, 1, 1,
0.05703077, -0.3408425, 3.991671, 0, 0.9098039, 1, 1,
0.05748772, 1.267078, -0.8466446, 0, 0.9058824, 1, 1,
0.05790109, -0.1461623, 1.885854, 0, 0.8980392, 1, 1,
0.06016487, -0.8398706, 1.259416, 0, 0.8901961, 1, 1,
0.06046736, 1.661052, 0.7303249, 0, 0.8862745, 1, 1,
0.06636835, -2.227022, 2.328858, 0, 0.8784314, 1, 1,
0.07302631, 1.124527, 2.120824, 0, 0.8745098, 1, 1,
0.07419675, 0.8337355, 1.604675, 0, 0.8666667, 1, 1,
0.07594495, 0.4950726, -0.3789302, 0, 0.8627451, 1, 1,
0.08503724, -0.8904635, 2.742447, 0, 0.854902, 1, 1,
0.08910829, -0.3735754, 4.215142, 0, 0.8509804, 1, 1,
0.08912084, -0.04936296, 1.673702, 0, 0.8431373, 1, 1,
0.08987752, -1.605618, 2.634541, 0, 0.8392157, 1, 1,
0.09121024, -0.03236984, 1.525811, 0, 0.8313726, 1, 1,
0.09379888, 1.218739, 0.5186753, 0, 0.827451, 1, 1,
0.09724741, -0.6319644, 3.450897, 0, 0.8196079, 1, 1,
0.1000537, 1.295365, 0.02387933, 0, 0.8156863, 1, 1,
0.1046598, 1.169392, 1.309477, 0, 0.8078431, 1, 1,
0.1058667, 0.2473435, 1.4758, 0, 0.8039216, 1, 1,
0.1145635, -0.0619185, 1.191036, 0, 0.7960784, 1, 1,
0.1205122, -0.5971385, 3.888812, 0, 0.7882353, 1, 1,
0.1212369, 0.3311312, 2.131496, 0, 0.7843137, 1, 1,
0.1235293, -1.575992, 2.951566, 0, 0.7764706, 1, 1,
0.1265331, -0.767692, 4.491761, 0, 0.772549, 1, 1,
0.1321468, -0.9796516, 3.702978, 0, 0.7647059, 1, 1,
0.1351522, 0.1721557, 1.612198, 0, 0.7607843, 1, 1,
0.1361673, 1.975428, 0.1092417, 0, 0.7529412, 1, 1,
0.1382275, 0.5895948, -2.301119, 0, 0.7490196, 1, 1,
0.1396747, -0.535291, 4.457654, 0, 0.7411765, 1, 1,
0.1409858, -1.643837, 3.245566, 0, 0.7372549, 1, 1,
0.1410348, 1.082474, 0.8504732, 0, 0.7294118, 1, 1,
0.1478661, -0.4717549, 2.690097, 0, 0.7254902, 1, 1,
0.1485865, 0.160233, 0.4439734, 0, 0.7176471, 1, 1,
0.1494932, -0.6648971, 3.54148, 0, 0.7137255, 1, 1,
0.1505371, -0.07303397, -0.01260607, 0, 0.7058824, 1, 1,
0.1544928, -1.281586, 2.985263, 0, 0.6980392, 1, 1,
0.1546331, 0.5423542, 2.3634, 0, 0.6941177, 1, 1,
0.1563908, 1.204974, -1.532629, 0, 0.6862745, 1, 1,
0.1569348, -0.05113061, 0.96462, 0, 0.682353, 1, 1,
0.1586818, 0.5251738, 0.9526135, 0, 0.6745098, 1, 1,
0.1603061, -0.005535735, 0.258053, 0, 0.6705883, 1, 1,
0.1605241, -0.4467674, 1.751413, 0, 0.6627451, 1, 1,
0.1641179, 0.4353984, 0.07959912, 0, 0.6588235, 1, 1,
0.168703, -0.4300342, 1.997852, 0, 0.6509804, 1, 1,
0.1698133, -0.268323, 2.268701, 0, 0.6470588, 1, 1,
0.1749972, 1.816266, 1.031441, 0, 0.6392157, 1, 1,
0.1762796, -0.8061247, 4.021729, 0, 0.6352941, 1, 1,
0.1777498, -0.2281628, 3.980131, 0, 0.627451, 1, 1,
0.1784002, 0.4245625, 0.02627001, 0, 0.6235294, 1, 1,
0.1811627, 0.1431823, 2.375984, 0, 0.6156863, 1, 1,
0.1897711, -1.3557, 4.938941, 0, 0.6117647, 1, 1,
0.1914833, 0.5104588, -0.09606994, 0, 0.6039216, 1, 1,
0.1938089, -0.820062, 2.965008, 0, 0.5960785, 1, 1,
0.1957126, 0.3907061, -0.1128688, 0, 0.5921569, 1, 1,
0.1958531, 1.032918, 1.214442, 0, 0.5843138, 1, 1,
0.2045306, 0.9450404, -0.3533182, 0, 0.5803922, 1, 1,
0.207811, -1.625355, 3.054497, 0, 0.572549, 1, 1,
0.2096083, 0.8003443, -0.2610307, 0, 0.5686275, 1, 1,
0.2104027, 0.3509382, 0.9244226, 0, 0.5607843, 1, 1,
0.2123658, 1.859472, 0.2581483, 0, 0.5568628, 1, 1,
0.2164254, 0.1679694, 1.511727, 0, 0.5490196, 1, 1,
0.2175562, -0.3409913, 2.332819, 0, 0.5450981, 1, 1,
0.2214524, -1.759672, 4.240387, 0, 0.5372549, 1, 1,
0.2273276, -1.363142, 2.142486, 0, 0.5333334, 1, 1,
0.2279565, 0.05006691, 0.262531, 0, 0.5254902, 1, 1,
0.2299159, -0.01191309, 2.265503, 0, 0.5215687, 1, 1,
0.2302181, 0.2562769, 1.119972, 0, 0.5137255, 1, 1,
0.2315159, 0.4747872, -0.03096422, 0, 0.509804, 1, 1,
0.238354, 0.8447727, 0.1917578, 0, 0.5019608, 1, 1,
0.2419502, 0.1197039, 1.48713, 0, 0.4941176, 1, 1,
0.2465298, -0.3791662, 3.071927, 0, 0.4901961, 1, 1,
0.246631, -0.1637243, 0.4644875, 0, 0.4823529, 1, 1,
0.2561082, -0.4301724, 1.547919, 0, 0.4784314, 1, 1,
0.2611544, -0.3591501, 2.412184, 0, 0.4705882, 1, 1,
0.2637418, -0.2410877, 1.6705, 0, 0.4666667, 1, 1,
0.2640607, -1.215001, 2.611781, 0, 0.4588235, 1, 1,
0.2643399, -1.335825, 3.770972, 0, 0.454902, 1, 1,
0.2680644, -1.429614, 1.806953, 0, 0.4470588, 1, 1,
0.2686492, 0.08915459, 1.668089, 0, 0.4431373, 1, 1,
0.2715987, 1.903549, -0.1877813, 0, 0.4352941, 1, 1,
0.2758472, -0.2427907, 2.518904, 0, 0.4313726, 1, 1,
0.2759441, -0.4546268, 2.595721, 0, 0.4235294, 1, 1,
0.2785353, 2.695591, 0.1491806, 0, 0.4196078, 1, 1,
0.2819041, 1.740935, -0.05092349, 0, 0.4117647, 1, 1,
0.2819803, -0.6164496, 2.755394, 0, 0.4078431, 1, 1,
0.2826091, -0.9937754, 1.5248, 0, 0.4, 1, 1,
0.285008, 0.3054229, 1.344189, 0, 0.3921569, 1, 1,
0.2855524, -0.8558356, 3.497325, 0, 0.3882353, 1, 1,
0.2876155, 0.2292649, 1.649411, 0, 0.3803922, 1, 1,
0.2930444, 0.7857005, 1.043022, 0, 0.3764706, 1, 1,
0.2955753, -0.5966562, 3.553969, 0, 0.3686275, 1, 1,
0.295756, 1.242806, -0.6593754, 0, 0.3647059, 1, 1,
0.301993, 0.02867635, -0.1168019, 0, 0.3568628, 1, 1,
0.3028004, 0.8947172, -0.1989835, 0, 0.3529412, 1, 1,
0.3032767, -0.9002302, 2.948809, 0, 0.345098, 1, 1,
0.3069946, -0.9193332, 3.816369, 0, 0.3411765, 1, 1,
0.310137, 1.57912, -0.4307384, 0, 0.3333333, 1, 1,
0.3106297, 1.357176, -0.1242118, 0, 0.3294118, 1, 1,
0.3119432, -0.2611447, 3.935914, 0, 0.3215686, 1, 1,
0.316626, 0.4222388, 0.5420238, 0, 0.3176471, 1, 1,
0.317188, -0.4381561, 2.069951, 0, 0.3098039, 1, 1,
0.3225668, 2.003316, -0.7155191, 0, 0.3058824, 1, 1,
0.3265755, -0.1155484, 1.869869, 0, 0.2980392, 1, 1,
0.3267201, -0.4232494, 2.782691, 0, 0.2901961, 1, 1,
0.330995, -0.3096411, 4.466158, 0, 0.2862745, 1, 1,
0.3311085, 2.620456, -0.6552173, 0, 0.2784314, 1, 1,
0.3425682, 0.8972789, 1.166208, 0, 0.2745098, 1, 1,
0.3427279, -0.9873737, 2.926113, 0, 0.2666667, 1, 1,
0.3428534, -0.31319, 2.167811, 0, 0.2627451, 1, 1,
0.346999, 0.1299403, 0.2892787, 0, 0.254902, 1, 1,
0.3498497, 0.01266238, 2.803117, 0, 0.2509804, 1, 1,
0.3500248, 0.8789232, 0.5151018, 0, 0.2431373, 1, 1,
0.3583333, 0.01444867, 2.331628, 0, 0.2392157, 1, 1,
0.3591278, -2.290069, 3.417703, 0, 0.2313726, 1, 1,
0.3591787, 0.79649, -0.1551559, 0, 0.227451, 1, 1,
0.3623725, -0.7170101, 3.585314, 0, 0.2196078, 1, 1,
0.3641103, 0.09757101, 0.6792341, 0, 0.2156863, 1, 1,
0.3644635, 0.4323398, 1.163669, 0, 0.2078431, 1, 1,
0.3660738, -0.3885765, 2.165682, 0, 0.2039216, 1, 1,
0.3706308, 2.055655, 0.7033366, 0, 0.1960784, 1, 1,
0.3749404, -0.5544097, 1.706148, 0, 0.1882353, 1, 1,
0.3770019, -0.1469886, 0.5066025, 0, 0.1843137, 1, 1,
0.3792053, -1.599454, 0.8622424, 0, 0.1764706, 1, 1,
0.3828847, 0.4203455, -0.04861497, 0, 0.172549, 1, 1,
0.3835029, -0.8685733, 2.128808, 0, 0.1647059, 1, 1,
0.3836149, 0.5200145, 2.019812, 0, 0.1607843, 1, 1,
0.3846306, 1.327488, -0.4935707, 0, 0.1529412, 1, 1,
0.3851108, 0.02467767, 1.225483, 0, 0.1490196, 1, 1,
0.3852319, 0.6401825, -0.1706877, 0, 0.1411765, 1, 1,
0.3876027, 0.308504, 1.287693, 0, 0.1372549, 1, 1,
0.3938628, -0.5210972, 2.838891, 0, 0.1294118, 1, 1,
0.3941101, -0.08553335, 4.561084, 0, 0.1254902, 1, 1,
0.3972878, 0.4723236, 1.561548, 0, 0.1176471, 1, 1,
0.3983755, -0.466453, 3.917152, 0, 0.1137255, 1, 1,
0.3985613, 0.4368227, 0.553566, 0, 0.1058824, 1, 1,
0.3992596, 0.4630558, 0.3104477, 0, 0.09803922, 1, 1,
0.3998636, -0.1595062, 1.270007, 0, 0.09411765, 1, 1,
0.4054196, 0.845471, 0.2065939, 0, 0.08627451, 1, 1,
0.4158243, 0.8730007, -2.960336, 0, 0.08235294, 1, 1,
0.4181387, 0.109845, 2.073967, 0, 0.07450981, 1, 1,
0.4225317, 1.499963, 1.428452, 0, 0.07058824, 1, 1,
0.4240736, 1.729091, 1.11998, 0, 0.0627451, 1, 1,
0.425218, 0.2254864, 1.765413, 0, 0.05882353, 1, 1,
0.4290106, 0.4220573, 0.9346878, 0, 0.05098039, 1, 1,
0.4292183, 1.000256, 2.02667, 0, 0.04705882, 1, 1,
0.4307833, 0.2866317, 2.486078, 0, 0.03921569, 1, 1,
0.4353732, 0.8553385, -0.9629974, 0, 0.03529412, 1, 1,
0.4391404, 0.2929673, 2.311071, 0, 0.02745098, 1, 1,
0.4397004, 0.2198761, 1.405765, 0, 0.02352941, 1, 1,
0.4409477, 0.2174667, 0.01522193, 0, 0.01568628, 1, 1,
0.4410402, -0.5940326, 2.896399, 0, 0.01176471, 1, 1,
0.4419326, -1.360842, 4.085482, 0, 0.003921569, 1, 1,
0.4422616, -0.2237954, 2.338011, 0.003921569, 0, 1, 1,
0.4431661, 0.5538681, 1.566949, 0.007843138, 0, 1, 1,
0.4448428, -0.2601518, 4.10324, 0.01568628, 0, 1, 1,
0.4477372, 0.3821965, 0.3642996, 0.01960784, 0, 1, 1,
0.44939, 0.821577, 1.214785, 0.02745098, 0, 1, 1,
0.4498636, 0.04916225, 0.5762617, 0.03137255, 0, 1, 1,
0.4524913, 2.477353, -1.203139, 0.03921569, 0, 1, 1,
0.4573207, 0.8713741, 0.3871284, 0.04313726, 0, 1, 1,
0.4599694, 0.5793239, 0.8348457, 0.05098039, 0, 1, 1,
0.4612378, 0.4968714, -1.107131, 0.05490196, 0, 1, 1,
0.4614379, -1.167767, 2.366977, 0.0627451, 0, 1, 1,
0.4714999, -0.9286453, 2.682559, 0.06666667, 0, 1, 1,
0.4717838, 0.7027669, 0.3128057, 0.07450981, 0, 1, 1,
0.4746398, -1.068452, 2.259349, 0.07843138, 0, 1, 1,
0.4767626, 0.8809582, 1.734887, 0.08627451, 0, 1, 1,
0.47852, -2.16438, 2.88041, 0.09019608, 0, 1, 1,
0.4899856, 0.2124412, 2.731577, 0.09803922, 0, 1, 1,
0.4908063, 0.5987002, -0.1542196, 0.1058824, 0, 1, 1,
0.4914726, -0.8260977, 3.433362, 0.1098039, 0, 1, 1,
0.4918082, 1.742841, 0.7204163, 0.1176471, 0, 1, 1,
0.4990917, -0.6664901, 2.971565, 0.1215686, 0, 1, 1,
0.5008676, 0.3557362, 0.6797229, 0.1294118, 0, 1, 1,
0.5046033, 0.2036307, 1.091525, 0.1333333, 0, 1, 1,
0.5060442, -0.3632092, 1.902868, 0.1411765, 0, 1, 1,
0.5062574, 2.062516, 2.732662, 0.145098, 0, 1, 1,
0.5068234, 0.3708612, 2.520387, 0.1529412, 0, 1, 1,
0.5118142, -0.9640943, 3.134418, 0.1568628, 0, 1, 1,
0.5149063, 0.8220931, 0.1914838, 0.1647059, 0, 1, 1,
0.5236918, -0.6398941, 3.242236, 0.1686275, 0, 1, 1,
0.524057, 1.77528, 0.3046359, 0.1764706, 0, 1, 1,
0.5245095, 0.3935487, -0.8150038, 0.1803922, 0, 1, 1,
0.5299187, 0.3552929, 0.8965539, 0.1882353, 0, 1, 1,
0.5377579, -0.6604506, 2.240007, 0.1921569, 0, 1, 1,
0.5406586, -0.5863128, 2.347898, 0.2, 0, 1, 1,
0.5414495, -1.376739, 0.7288151, 0.2078431, 0, 1, 1,
0.54498, -0.1764409, 2.71767, 0.2117647, 0, 1, 1,
0.5592112, 0.145874, 2.955413, 0.2196078, 0, 1, 1,
0.5634238, 0.3792543, 0.02269834, 0.2235294, 0, 1, 1,
0.5731598, -1.357906, 3.402563, 0.2313726, 0, 1, 1,
0.5760655, 1.735719, 0.2861415, 0.2352941, 0, 1, 1,
0.5762647, -0.8816005, 1.451854, 0.2431373, 0, 1, 1,
0.576326, -1.525028, 3.114038, 0.2470588, 0, 1, 1,
0.5829166, -0.4433343, 2.390867, 0.254902, 0, 1, 1,
0.5829349, -1.339274, 4.377501, 0.2588235, 0, 1, 1,
0.5838684, -0.7098184, 0.3948328, 0.2666667, 0, 1, 1,
0.5896631, -2.204858, 3.774378, 0.2705882, 0, 1, 1,
0.5945735, 0.1564107, -0.3775465, 0.2784314, 0, 1, 1,
0.5979952, -0.282362, 2.290435, 0.282353, 0, 1, 1,
0.5997141, -1.036307, 2.191437, 0.2901961, 0, 1, 1,
0.6004989, 2.40801, -0.4065355, 0.2941177, 0, 1, 1,
0.6015876, 0.1630835, 0.05511452, 0.3019608, 0, 1, 1,
0.6051478, 0.956655, 2.429989, 0.3098039, 0, 1, 1,
0.6088293, -1.160656, 2.269907, 0.3137255, 0, 1, 1,
0.6100341, -0.6337203, 2.145152, 0.3215686, 0, 1, 1,
0.6113847, 0.3213615, -0.3021024, 0.3254902, 0, 1, 1,
0.6114555, 0.8004923, 0.8199385, 0.3333333, 0, 1, 1,
0.6148912, 0.1226079, 1.800844, 0.3372549, 0, 1, 1,
0.6173923, 0.2777156, 0.5628842, 0.345098, 0, 1, 1,
0.6208191, -1.192725, 3.309811, 0.3490196, 0, 1, 1,
0.6224731, -1.102425, 2.697293, 0.3568628, 0, 1, 1,
0.625548, -0.2584916, 1.940047, 0.3607843, 0, 1, 1,
0.630514, 1.533696, 0.976859, 0.3686275, 0, 1, 1,
0.6307042, -1.706341, 2.25182, 0.372549, 0, 1, 1,
0.6307551, 1.214191, 0.7256683, 0.3803922, 0, 1, 1,
0.63372, -1.51537, 3.445534, 0.3843137, 0, 1, 1,
0.6340389, -0.6857145, 3.230009, 0.3921569, 0, 1, 1,
0.6362501, 0.1698975, -0.3321129, 0.3960784, 0, 1, 1,
0.6363568, 0.5245025, 1.075571, 0.4039216, 0, 1, 1,
0.6375275, -0.9710134, 1.545884, 0.4117647, 0, 1, 1,
0.6381552, -1.07163, 4.926081, 0.4156863, 0, 1, 1,
0.6384701, 0.1440596, 1.668539, 0.4235294, 0, 1, 1,
0.6393892, -1.019454, 2.591218, 0.427451, 0, 1, 1,
0.6394676, 0.01725567, -0.0504149, 0.4352941, 0, 1, 1,
0.6494069, 0.6972302, 1.331002, 0.4392157, 0, 1, 1,
0.653584, 0.7319468, -0.387476, 0.4470588, 0, 1, 1,
0.6564312, -0.8316278, 1.957408, 0.4509804, 0, 1, 1,
0.6621053, 0.3912885, 2.130739, 0.4588235, 0, 1, 1,
0.6671227, 0.829028, 0.5544713, 0.4627451, 0, 1, 1,
0.6713055, 0.07787066, 0.1932039, 0.4705882, 0, 1, 1,
0.6753213, -0.6028226, 2.384953, 0.4745098, 0, 1, 1,
0.6754707, 0.5519667, 0.7234204, 0.4823529, 0, 1, 1,
0.6777605, 1.852884, 1.556829, 0.4862745, 0, 1, 1,
0.6779473, -0.4768252, 1.153057, 0.4941176, 0, 1, 1,
0.6784354, 1.515985, 0.6350987, 0.5019608, 0, 1, 1,
0.6788129, -0.9674008, 2.802584, 0.5058824, 0, 1, 1,
0.679133, 0.4134367, 1.884287, 0.5137255, 0, 1, 1,
0.6797557, -0.793995, 4.432159, 0.5176471, 0, 1, 1,
0.6892306, -0.7323927, 2.561817, 0.5254902, 0, 1, 1,
0.6892826, 0.8758869, -0.8821406, 0.5294118, 0, 1, 1,
0.7007122, -0.791205, 1.211528, 0.5372549, 0, 1, 1,
0.7014123, -1.114231, 2.606401, 0.5411765, 0, 1, 1,
0.7051527, 1.081099, 1.487102, 0.5490196, 0, 1, 1,
0.7058984, 0.3727508, 2.33228, 0.5529412, 0, 1, 1,
0.7060193, 1.102716, 0.4476859, 0.5607843, 0, 1, 1,
0.709313, 0.4738395, 1.987365, 0.5647059, 0, 1, 1,
0.7116662, 1.080303, 0.1749234, 0.572549, 0, 1, 1,
0.7130867, -0.8457348, 3.030235, 0.5764706, 0, 1, 1,
0.7229722, -0.7689094, 2.46217, 0.5843138, 0, 1, 1,
0.7357955, 0.563678, 0.7878298, 0.5882353, 0, 1, 1,
0.7359005, -0.1090862, 1.608153, 0.5960785, 0, 1, 1,
0.7399363, -1.51563, 1.354459, 0.6039216, 0, 1, 1,
0.7407552, -0.8685482, 2.726055, 0.6078432, 0, 1, 1,
0.742395, 0.9423053, -0.8082131, 0.6156863, 0, 1, 1,
0.7428833, -0.6279378, 1.576299, 0.6196079, 0, 1, 1,
0.7440921, -1.82263, 3.912763, 0.627451, 0, 1, 1,
0.7454423, -0.7024839, 1.562925, 0.6313726, 0, 1, 1,
0.7526419, 0.4444133, 1.601741, 0.6392157, 0, 1, 1,
0.7546658, -0.123711, 0.993296, 0.6431373, 0, 1, 1,
0.7564654, -0.123939, 2.14115, 0.6509804, 0, 1, 1,
0.7624815, 0.3957381, 1.152528, 0.654902, 0, 1, 1,
0.7651482, 0.1612838, 1.854219, 0.6627451, 0, 1, 1,
0.7667502, -0.449002, 2.164031, 0.6666667, 0, 1, 1,
0.7686212, 0.510524, 3.618403, 0.6745098, 0, 1, 1,
0.7717867, -1.190827, 3.402867, 0.6784314, 0, 1, 1,
0.7764932, 0.2993831, 0.9152702, 0.6862745, 0, 1, 1,
0.7778012, 0.4413462, -0.1861151, 0.6901961, 0, 1, 1,
0.7786217, 1.225075, 2.127522, 0.6980392, 0, 1, 1,
0.7869946, -1.130785, 2.628405, 0.7058824, 0, 1, 1,
0.7938384, 1.035123, 0.4977758, 0.7098039, 0, 1, 1,
0.7968052, 1.903694, 0.4985248, 0.7176471, 0, 1, 1,
0.7974688, -0.03726256, 2.683966, 0.7215686, 0, 1, 1,
0.8033029, 0.6849714, 1.035932, 0.7294118, 0, 1, 1,
0.8083726, 0.6123801, 1.367312, 0.7333333, 0, 1, 1,
0.8086114, -0.820744, 2.648313, 0.7411765, 0, 1, 1,
0.8225181, 0.9106292, 0.7470046, 0.7450981, 0, 1, 1,
0.8243709, 0.03927558, 1.727831, 0.7529412, 0, 1, 1,
0.8264826, 0.1252287, 0.6472942, 0.7568628, 0, 1, 1,
0.833275, -0.460743, 2.4206, 0.7647059, 0, 1, 1,
0.8335618, -1.17824, 2.249656, 0.7686275, 0, 1, 1,
0.8352967, -0.1024947, 0.7920123, 0.7764706, 0, 1, 1,
0.8420757, 1.573009, 1.072661, 0.7803922, 0, 1, 1,
0.8461545, -1.124251, 4.314046, 0.7882353, 0, 1, 1,
0.8518541, 1.324476, 0.1830936, 0.7921569, 0, 1, 1,
0.8565211, -0.4223982, 2.639764, 0.8, 0, 1, 1,
0.8580229, 1.773853, 0.553629, 0.8078431, 0, 1, 1,
0.8591365, -0.689453, 0.8854383, 0.8117647, 0, 1, 1,
0.8606099, -0.1216446, 0.8605492, 0.8196079, 0, 1, 1,
0.860938, -0.5776357, 2.881689, 0.8235294, 0, 1, 1,
0.8614949, -0.65705, 3.26538, 0.8313726, 0, 1, 1,
0.8623562, 1.792738, 0.73907, 0.8352941, 0, 1, 1,
0.8628443, 2.063916, -0.9003965, 0.8431373, 0, 1, 1,
0.8670335, -0.8529872, 1.089494, 0.8470588, 0, 1, 1,
0.8676504, -0.6011012, 2.564871, 0.854902, 0, 1, 1,
0.8751618, 1.15406, 0.203343, 0.8588235, 0, 1, 1,
0.8791443, -0.4725308, 2.064896, 0.8666667, 0, 1, 1,
0.8803033, 0.7052568, 1.703853, 0.8705882, 0, 1, 1,
0.8826317, 0.1465591, 2.455072, 0.8784314, 0, 1, 1,
0.8886967, -0.2468779, 2.540393, 0.8823529, 0, 1, 1,
0.8910272, -0.9939915, 3.221743, 0.8901961, 0, 1, 1,
0.8957531, 2.003967, -1.052713, 0.8941177, 0, 1, 1,
0.8971432, 0.08208512, 2.446538, 0.9019608, 0, 1, 1,
0.8975298, -0.6961142, 2.059379, 0.9098039, 0, 1, 1,
0.8977701, 1.136987, 1.331353, 0.9137255, 0, 1, 1,
0.8981125, 0.9804991, 0.7760397, 0.9215686, 0, 1, 1,
0.9037915, -0.5114992, 1.444468, 0.9254902, 0, 1, 1,
0.9076892, 0.7133574, 1.884405, 0.9333333, 0, 1, 1,
0.9081163, -0.2046005, 3.003865, 0.9372549, 0, 1, 1,
0.9096932, -0.7468064, 4.071608, 0.945098, 0, 1, 1,
0.9196329, -0.1697973, 1.600701, 0.9490196, 0, 1, 1,
0.922226, -2.055689, 1.93907, 0.9568627, 0, 1, 1,
0.9245859, -0.2060678, 2.206652, 0.9607843, 0, 1, 1,
0.9248853, -0.06442309, 1.554133, 0.9686275, 0, 1, 1,
0.9364932, -1.142391, 2.338001, 0.972549, 0, 1, 1,
0.9510666, 0.6385518, 0.1241862, 0.9803922, 0, 1, 1,
0.953491, 0.4768083, 3.215858, 0.9843137, 0, 1, 1,
0.9549198, 0.1622976, 2.140308, 0.9921569, 0, 1, 1,
0.9589504, -1.826701, 3.224692, 0.9960784, 0, 1, 1,
0.9627095, 0.6567314, 1.466729, 1, 0, 0.9960784, 1,
0.9652541, -0.7043583, 2.606666, 1, 0, 0.9882353, 1,
0.9716399, -0.3974335, 4.001932, 1, 0, 0.9843137, 1,
0.9862329, 0.7191684, 0.177471, 1, 0, 0.9764706, 1,
0.9874139, 1.047894, 2.269894, 1, 0, 0.972549, 1,
0.9904044, 0.5268775, 1.770424, 1, 0, 0.9647059, 1,
1.0178, -0.8288248, 4.253978, 1, 0, 0.9607843, 1,
1.019422, 1.425498, -0.03247803, 1, 0, 0.9529412, 1,
1.02187, -0.169498, 2.720809, 1, 0, 0.9490196, 1,
1.025222, -0.2353565, 2.133054, 1, 0, 0.9411765, 1,
1.044423, -0.2213308, 2.880507, 1, 0, 0.9372549, 1,
1.046794, -1.34337, 3.300418, 1, 0, 0.9294118, 1,
1.047536, -1.621881, 1.109328, 1, 0, 0.9254902, 1,
1.048304, 0.06722424, 1.785777, 1, 0, 0.9176471, 1,
1.061312, 0.9671268, 0.6492106, 1, 0, 0.9137255, 1,
1.08663, -0.5939295, 2.555454, 1, 0, 0.9058824, 1,
1.087907, -0.176679, 1.133689, 1, 0, 0.9019608, 1,
1.088884, -0.1214385, 1.809152, 1, 0, 0.8941177, 1,
1.094714, -0.6449754, 2.770092, 1, 0, 0.8862745, 1,
1.096725, 1.011487, 0.02369076, 1, 0, 0.8823529, 1,
1.105007, 1.92144, 1.213934, 1, 0, 0.8745098, 1,
1.116103, 0.2484387, 2.409266, 1, 0, 0.8705882, 1,
1.117393, 0.2871614, 0.3439012, 1, 0, 0.8627451, 1,
1.117425, -0.4244597, 1.874233, 1, 0, 0.8588235, 1,
1.126186, 0.552143, 0.4888236, 1, 0, 0.8509804, 1,
1.129483, -0.9865492, 0.9668952, 1, 0, 0.8470588, 1,
1.132389, -1.114964, 3.306888, 1, 0, 0.8392157, 1,
1.146593, -0.03114804, 2.519256, 1, 0, 0.8352941, 1,
1.152575, -0.2482299, 1.420442, 1, 0, 0.827451, 1,
1.153559, 0.5792151, 1.250982, 1, 0, 0.8235294, 1,
1.168791, 1.22146, 0.9465955, 1, 0, 0.8156863, 1,
1.170206, 0.1846612, 1.123719, 1, 0, 0.8117647, 1,
1.17025, -0.08521397, 2.044809, 1, 0, 0.8039216, 1,
1.179228, -0.1237778, 0.3565362, 1, 0, 0.7960784, 1,
1.186867, 0.03381164, 2.405982, 1, 0, 0.7921569, 1,
1.189517, 0.5742324, -0.08287144, 1, 0, 0.7843137, 1,
1.190355, -0.6481484, 1.002467, 1, 0, 0.7803922, 1,
1.196644, 1.338013, -1.563148, 1, 0, 0.772549, 1,
1.197855, -1.894236, 4.721893, 1, 0, 0.7686275, 1,
1.2082, -0.1729181, 1.931383, 1, 0, 0.7607843, 1,
1.216144, -0.7828039, 2.002432, 1, 0, 0.7568628, 1,
1.216446, -1.335112, 2.465907, 1, 0, 0.7490196, 1,
1.219595, 0.1861673, -1.462656, 1, 0, 0.7450981, 1,
1.223533, -0.7267023, 2.815956, 1, 0, 0.7372549, 1,
1.231064, 1.147969, 0.5323268, 1, 0, 0.7333333, 1,
1.235948, 0.6243972, 1.119409, 1, 0, 0.7254902, 1,
1.239991, -0.7889225, 0.8529126, 1, 0, 0.7215686, 1,
1.246778, -0.853878, 2.212546, 1, 0, 0.7137255, 1,
1.250044, 1.322964, 1.694417, 1, 0, 0.7098039, 1,
1.252892, 1.172923, 0.04534998, 1, 0, 0.7019608, 1,
1.255216, 0.8177076, 0.1013202, 1, 0, 0.6941177, 1,
1.25537, -1.811011, 2.336546, 1, 0, 0.6901961, 1,
1.257855, -1.722047, 4.500261, 1, 0, 0.682353, 1,
1.258397, -0.1619432, 0.9992389, 1, 0, 0.6784314, 1,
1.276789, 0.1501643, 0.166359, 1, 0, 0.6705883, 1,
1.281506, -1.040709, 1.932252, 1, 0, 0.6666667, 1,
1.282864, -1.440674, 2.880795, 1, 0, 0.6588235, 1,
1.283014, -0.6811754, 3.929256, 1, 0, 0.654902, 1,
1.290002, 1.639215, 0.2626733, 1, 0, 0.6470588, 1,
1.291082, 1.655244, 0.3671055, 1, 0, 0.6431373, 1,
1.292833, -1.330541, 2.087385, 1, 0, 0.6352941, 1,
1.300113, 0.531778, 1.051175, 1, 0, 0.6313726, 1,
1.309309, 0.4355007, 2.365729, 1, 0, 0.6235294, 1,
1.321558, -0.8631025, 2.118116, 1, 0, 0.6196079, 1,
1.323005, -0.09092239, 2.187174, 1, 0, 0.6117647, 1,
1.329274, -2.004448, 1.869662, 1, 0, 0.6078432, 1,
1.337143, -0.3075812, 0.5991548, 1, 0, 0.6, 1,
1.343689, -0.4165225, 1.6296, 1, 0, 0.5921569, 1,
1.358016, 0.3960355, 0.8700398, 1, 0, 0.5882353, 1,
1.359092, -1.337954, 0.4047368, 1, 0, 0.5803922, 1,
1.359245, 0.5533431, 2.486686, 1, 0, 0.5764706, 1,
1.360349, -1.797246, 2.177394, 1, 0, 0.5686275, 1,
1.361172, -0.02804031, 0.8407788, 1, 0, 0.5647059, 1,
1.36304, 0.6888547, 0.03206354, 1, 0, 0.5568628, 1,
1.370266, -0.9989134, 1.885322, 1, 0, 0.5529412, 1,
1.375147, -0.395903, 1.995296, 1, 0, 0.5450981, 1,
1.381125, -0.3092491, 1.454292, 1, 0, 0.5411765, 1,
1.388735, -0.19672, 2.172697, 1, 0, 0.5333334, 1,
1.391843, -0.888023, 2.855966, 1, 0, 0.5294118, 1,
1.399283, 0.5687844, 1.449937, 1, 0, 0.5215687, 1,
1.408529, -0.8639042, 2.43192, 1, 0, 0.5176471, 1,
1.409666, -0.5726641, 3.176523, 1, 0, 0.509804, 1,
1.411232, 0.5743131, 0.02530844, 1, 0, 0.5058824, 1,
1.415462, 0.7018656, -0.4926301, 1, 0, 0.4980392, 1,
1.426207, 1.027269, -0.7671705, 1, 0, 0.4901961, 1,
1.427532, 1.130263, -0.1998211, 1, 0, 0.4862745, 1,
1.429329, 0.7817903, 0.5077581, 1, 0, 0.4784314, 1,
1.430728, -0.8310294, 3.017987, 1, 0, 0.4745098, 1,
1.43359, -2.483466, 1.931864, 1, 0, 0.4666667, 1,
1.450353, -0.09194781, 2.666664, 1, 0, 0.4627451, 1,
1.457449, 1.207865, 2.28598, 1, 0, 0.454902, 1,
1.472448, -1.682366, 2.878522, 1, 0, 0.4509804, 1,
1.493216, 1.047912, 1.726065, 1, 0, 0.4431373, 1,
1.50697, -0.3933691, 1.884873, 1, 0, 0.4392157, 1,
1.513641, -0.2635555, 1.571104, 1, 0, 0.4313726, 1,
1.52775, 1.614932, -0.1541894, 1, 0, 0.427451, 1,
1.529604, -0.3596987, 3.392088, 1, 0, 0.4196078, 1,
1.537417, 0.2958707, 2.718548, 1, 0, 0.4156863, 1,
1.547566, -0.8936456, 0.4463369, 1, 0, 0.4078431, 1,
1.561724, -0.6995783, 4.440682, 1, 0, 0.4039216, 1,
1.564433, -0.4409141, 0.9362543, 1, 0, 0.3960784, 1,
1.56635, 0.3348916, -0.2828989, 1, 0, 0.3882353, 1,
1.573067, -0.5143251, 3.38405, 1, 0, 0.3843137, 1,
1.574249, -0.08166631, 2.399459, 1, 0, 0.3764706, 1,
1.57647, 1.019099, 1.071534, 1, 0, 0.372549, 1,
1.578529, -0.2599179, 1.114703, 1, 0, 0.3647059, 1,
1.580102, -0.6965636, 2.344752, 1, 0, 0.3607843, 1,
1.587947, 0.9657338, 1.264108, 1, 0, 0.3529412, 1,
1.599045, -0.4617494, 2.810277, 1, 0, 0.3490196, 1,
1.601762, 0.669277, 1.300717, 1, 0, 0.3411765, 1,
1.606094, 1.367803, 0.1481818, 1, 0, 0.3372549, 1,
1.643389, 0.6642845, 2.953228, 1, 0, 0.3294118, 1,
1.648448, -0.2698789, 2.193273, 1, 0, 0.3254902, 1,
1.651925, -0.4339247, 1.361592, 1, 0, 0.3176471, 1,
1.654881, -0.9471589, 1.681728, 1, 0, 0.3137255, 1,
1.663026, 0.1766611, 3.032713, 1, 0, 0.3058824, 1,
1.66947, -0.9394879, 2.631374, 1, 0, 0.2980392, 1,
1.673732, 0.1863842, -0.5739475, 1, 0, 0.2941177, 1,
1.677069, -0.6540661, 2.28723, 1, 0, 0.2862745, 1,
1.683324, 0.1924073, -0.775071, 1, 0, 0.282353, 1,
1.693483, -0.5777678, 1.310587, 1, 0, 0.2745098, 1,
1.697143, 0.5890906, 1.958543, 1, 0, 0.2705882, 1,
1.708848, -1.151848, 1.240546, 1, 0, 0.2627451, 1,
1.714647, -0.7266374, 1.639544, 1, 0, 0.2588235, 1,
1.748116, 0.1019413, 1.449137, 1, 0, 0.2509804, 1,
1.754158, 0.02091136, 3.178887, 1, 0, 0.2470588, 1,
1.754587, 1.140166, 2.397587, 1, 0, 0.2392157, 1,
1.755282, -0.2045861, 1.569708, 1, 0, 0.2352941, 1,
1.780168, -0.5076987, 2.011574, 1, 0, 0.227451, 1,
1.788387, -1.075502, 2.334991, 1, 0, 0.2235294, 1,
1.802866, 0.7430712, -0.6106569, 1, 0, 0.2156863, 1,
1.812979, -1.245104, -0.3286835, 1, 0, 0.2117647, 1,
1.814419, 0.152105, 1.595275, 1, 0, 0.2039216, 1,
1.821679, 0.6400477, 0.5407293, 1, 0, 0.1960784, 1,
1.849546, 1.20996, 0.6157595, 1, 0, 0.1921569, 1,
1.8498, -0.6358414, 2.356082, 1, 0, 0.1843137, 1,
1.880729, -0.4250848, 2.675495, 1, 0, 0.1803922, 1,
1.92864, -0.61258, 1.031018, 1, 0, 0.172549, 1,
1.94327, 0.2799429, 1.832376, 1, 0, 0.1686275, 1,
1.945085, 0.221778, 2.475095, 1, 0, 0.1607843, 1,
1.961249, -0.7107415, 3.090044, 1, 0, 0.1568628, 1,
1.962276, 0.7371335, 1.13288, 1, 0, 0.1490196, 1,
1.976591, 0.3177255, 2.660703, 1, 0, 0.145098, 1,
1.979082, -2.815084, 1.9676, 1, 0, 0.1372549, 1,
1.999825, 0.560322, -0.2409946, 1, 0, 0.1333333, 1,
2.003017, -1.292446, 1.704012, 1, 0, 0.1254902, 1,
2.040514, -0.7313292, 1.741982, 1, 0, 0.1215686, 1,
2.048441, 0.9044098, 1.558524, 1, 0, 0.1137255, 1,
2.074314, 0.5077005, 1.092836, 1, 0, 0.1098039, 1,
2.080208, -1.155456, 0.3008408, 1, 0, 0.1019608, 1,
2.099102, -0.357435, 2.082461, 1, 0, 0.09411765, 1,
2.102417, 0.5789132, 2.8325, 1, 0, 0.09019608, 1,
2.134362, -2.031966, 1.848643, 1, 0, 0.08235294, 1,
2.136446, 2.197637, 0.5000739, 1, 0, 0.07843138, 1,
2.208551, -1.69347, 2.153333, 1, 0, 0.07058824, 1,
2.222285, -2.878667, 1.43911, 1, 0, 0.06666667, 1,
2.238096, -0.7224664, 1.417974, 1, 0, 0.05882353, 1,
2.248047, -0.1512976, 2.186467, 1, 0, 0.05490196, 1,
2.29465, 1.100341, 0.9875514, 1, 0, 0.04705882, 1,
2.329883, 0.1661238, 2.716782, 1, 0, 0.04313726, 1,
2.337163, -0.4149143, 0.4822142, 1, 0, 0.03529412, 1,
2.38982, 0.6327655, 0.638154, 1, 0, 0.03137255, 1,
2.549914, 1.382055, 0.4378293, 1, 0, 0.02352941, 1,
2.595684, 1.118222, 0.6842118, 1, 0, 0.01960784, 1,
2.776303, -0.911471, -0.08380678, 1, 0, 0.01176471, 1,
3.130755, -3.424946, 1.413431, 1, 0, 0.007843138, 1
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
-0.3077277, -4.528286, -6.851191, 0, -0.5, 0.5, 0.5,
-0.3077277, -4.528286, -6.851191, 1, -0.5, 0.5, 0.5,
-0.3077277, -4.528286, -6.851191, 1, 1.5, 0.5, 0.5,
-0.3077277, -4.528286, -6.851191, 0, 1.5, 0.5, 0.5
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
-4.911856, -0.170256, -6.851191, 0, -0.5, 0.5, 0.5,
-4.911856, -0.170256, -6.851191, 1, -0.5, 0.5, 0.5,
-4.911856, -0.170256, -6.851191, 1, 1.5, 0.5, 0.5,
-4.911856, -0.170256, -6.851191, 0, 1.5, 0.5, 0.5
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
-4.911856, -4.528286, -0.1017308, 0, -0.5, 0.5, 0.5,
-4.911856, -4.528286, -0.1017308, 1, -0.5, 0.5, 0.5,
-4.911856, -4.528286, -0.1017308, 1, 1.5, 0.5, 0.5,
-4.911856, -4.528286, -0.1017308, 0, 1.5, 0.5, 0.5
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
-3, -3.522586, -5.293623,
3, -3.522586, -5.293623,
-3, -3.522586, -5.293623,
-3, -3.690203, -5.553217,
-2, -3.522586, -5.293623,
-2, -3.690203, -5.553217,
-1, -3.522586, -5.293623,
-1, -3.690203, -5.553217,
0, -3.522586, -5.293623,
0, -3.690203, -5.553217,
1, -3.522586, -5.293623,
1, -3.690203, -5.553217,
2, -3.522586, -5.293623,
2, -3.690203, -5.553217,
3, -3.522586, -5.293623,
3, -3.690203, -5.553217
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
-3, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
-3, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
-3, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
-3, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
-2, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
-2, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
-2, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
-2, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
-1, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
-1, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
-1, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
-1, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
0, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
0, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
0, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
0, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
1, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
1, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
1, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
1, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
2, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
2, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
2, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
2, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5,
3, -4.025436, -6.072407, 0, -0.5, 0.5, 0.5,
3, -4.025436, -6.072407, 1, -0.5, 0.5, 0.5,
3, -4.025436, -6.072407, 1, 1.5, 0.5, 0.5,
3, -4.025436, -6.072407, 0, 1.5, 0.5, 0.5
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
-3.849365, -3, -5.293623,
-3.849365, 3, -5.293623,
-3.849365, -3, -5.293623,
-4.026447, -3, -5.553217,
-3.849365, -2, -5.293623,
-4.026447, -2, -5.553217,
-3.849365, -1, -5.293623,
-4.026447, -1, -5.553217,
-3.849365, 0, -5.293623,
-4.026447, 0, -5.553217,
-3.849365, 1, -5.293623,
-4.026447, 1, -5.553217,
-3.849365, 2, -5.293623,
-4.026447, 2, -5.553217,
-3.849365, 3, -5.293623,
-4.026447, 3, -5.553217
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
-4.38061, -3, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, -3, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, -3, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, -3, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, -2, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, -2, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, -2, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, -2, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, -1, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, -1, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, -1, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, -1, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, 0, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, 0, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, 0, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, 0, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, 1, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, 1, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, 1, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, 1, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, 2, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, 2, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, 2, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, 2, -6.072407, 0, 1.5, 0.5, 0.5,
-4.38061, 3, -6.072407, 0, -0.5, 0.5, 0.5,
-4.38061, 3, -6.072407, 1, -0.5, 0.5, 0.5,
-4.38061, 3, -6.072407, 1, 1.5, 0.5, 0.5,
-4.38061, 3, -6.072407, 0, 1.5, 0.5, 0.5
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
-3.849365, -3.522586, -4,
-3.849365, -3.522586, 4,
-3.849365, -3.522586, -4,
-4.026447, -3.690203, -4,
-3.849365, -3.522586, -2,
-4.026447, -3.690203, -2,
-3.849365, -3.522586, 0,
-4.026447, -3.690203, 0,
-3.849365, -3.522586, 2,
-4.026447, -3.690203, 2,
-3.849365, -3.522586, 4,
-4.026447, -3.690203, 4
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
-4.38061, -4.025436, -4, 0, -0.5, 0.5, 0.5,
-4.38061, -4.025436, -4, 1, -0.5, 0.5, 0.5,
-4.38061, -4.025436, -4, 1, 1.5, 0.5, 0.5,
-4.38061, -4.025436, -4, 0, 1.5, 0.5, 0.5,
-4.38061, -4.025436, -2, 0, -0.5, 0.5, 0.5,
-4.38061, -4.025436, -2, 1, -0.5, 0.5, 0.5,
-4.38061, -4.025436, -2, 1, 1.5, 0.5, 0.5,
-4.38061, -4.025436, -2, 0, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 0, 0, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 0, 1, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 0, 1, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 0, 0, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 2, 0, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 2, 1, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 2, 1, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 2, 0, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 4, 0, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 4, 1, -0.5, 0.5, 0.5,
-4.38061, -4.025436, 4, 1, 1.5, 0.5, 0.5,
-4.38061, -4.025436, 4, 0, 1.5, 0.5, 0.5
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
-3.849365, -3.522586, -5.293623,
-3.849365, 3.182074, -5.293623,
-3.849365, -3.522586, 5.090161,
-3.849365, 3.182074, 5.090161,
-3.849365, -3.522586, -5.293623,
-3.849365, -3.522586, 5.090161,
-3.849365, 3.182074, -5.293623,
-3.849365, 3.182074, 5.090161,
-3.849365, -3.522586, -5.293623,
3.23391, -3.522586, -5.293623,
-3.849365, -3.522586, 5.090161,
3.23391, -3.522586, 5.090161,
-3.849365, 3.182074, -5.293623,
3.23391, 3.182074, -5.293623,
-3.849365, 3.182074, 5.090161,
3.23391, 3.182074, 5.090161,
3.23391, -3.522586, -5.293623,
3.23391, 3.182074, -5.293623,
3.23391, -3.522586, 5.090161,
3.23391, 3.182074, 5.090161,
3.23391, -3.522586, -5.293623,
3.23391, -3.522586, 5.090161,
3.23391, 3.182074, -5.293623,
3.23391, 3.182074, 5.090161
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
var radius = 7.607082;
var distance = 33.84476;
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
mvMatrix.translate( 0.3077277, 0.170256, 0.1017308 );
mvMatrix.scale( 1.161176, 1.226748, 0.7920933 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84476);
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
7-bromo-5-chloro-8-q<-read.table("7-bromo-5-chloro-8-q.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-7-bromo-5-chloro-8-q$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromo' not found
```

```r
y<-7-bromo-5-chloro-8-q$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromo' not found
```

```r
z<-7-bromo-5-chloro-8-q$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromo' not found
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
-3.746211, 0.4790073, -2.722048, 0, 0, 1, 1, 1,
-2.895399, 1.354693, -3.38978, 1, 0, 0, 1, 1,
-2.811332, 1.229407, -0.497064, 1, 0, 0, 1, 1,
-2.577888, 0.9145719, -1.35296, 1, 0, 0, 1, 1,
-2.493357, 0.5789729, -2.812156, 1, 0, 0, 1, 1,
-2.458477, -0.7121472, -2.354184, 1, 0, 0, 1, 1,
-2.327724, -1.143091, -0.422996, 0, 0, 0, 1, 1,
-2.307901, 0.606114, -1.169184, 0, 0, 0, 1, 1,
-2.307256, 0.5333929, -1.267369, 0, 0, 0, 1, 1,
-2.304949, -0.03922853, 0.6111032, 0, 0, 0, 1, 1,
-2.227868, 2.115599, -0.5346811, 0, 0, 0, 1, 1,
-2.127763, -0.4364031, -2.887089, 0, 0, 0, 1, 1,
-2.101529, -0.07102108, -3.139503, 0, 0, 0, 1, 1,
-2.072805, -0.03533687, -0.9642063, 1, 1, 1, 1, 1,
-2.0618, 0.8656747, -0.4246653, 1, 1, 1, 1, 1,
-2.058139, 0.5061705, -1.557446, 1, 1, 1, 1, 1,
-2.046604, -0.382753, -2.275905, 1, 1, 1, 1, 1,
-2.03234, 0.6587713, -1.253442, 1, 1, 1, 1, 1,
-1.985964, 0.1621295, -1.330951, 1, 1, 1, 1, 1,
-1.955378, 0.7097762, -0.6741756, 1, 1, 1, 1, 1,
-1.852424, -0.03858837, -1.576567, 1, 1, 1, 1, 1,
-1.850068, -0.1882076, -2.298893, 1, 1, 1, 1, 1,
-1.842896, 0.983126, 0.04998955, 1, 1, 1, 1, 1,
-1.828938, -1.652279, -2.604646, 1, 1, 1, 1, 1,
-1.804662, -1.398165, -2.597, 1, 1, 1, 1, 1,
-1.802386, 0.3613986, -0.7256656, 1, 1, 1, 1, 1,
-1.758476, 0.9813148, -0.5229009, 1, 1, 1, 1, 1,
-1.748009, 1.759726, -0.9007523, 1, 1, 1, 1, 1,
-1.744029, 0.84174, -1.115379, 0, 0, 1, 1, 1,
-1.733228, 1.562569, -0.4449953, 1, 0, 0, 1, 1,
-1.697347, 0.8523818, -2.419942, 1, 0, 0, 1, 1,
-1.691746, 0.4676732, -2.049362, 1, 0, 0, 1, 1,
-1.686137, 1.632305, -1.128929, 1, 0, 0, 1, 1,
-1.68305, -1.218396, -3.669577, 1, 0, 0, 1, 1,
-1.683009, 0.575718, 0.3725489, 0, 0, 0, 1, 1,
-1.659684, -0.1674079, -1.558515, 0, 0, 0, 1, 1,
-1.640525, -0.8981683, -0.6391429, 0, 0, 0, 1, 1,
-1.630468, 1.419588, -1.739375, 0, 0, 0, 1, 1,
-1.623252, -0.05121932, -3.482459, 0, 0, 0, 1, 1,
-1.613954, -0.5244683, -1.769791, 0, 0, 0, 1, 1,
-1.609755, 1.507358, -1.72342, 0, 0, 0, 1, 1,
-1.607803, -0.4336301, -1.865711, 1, 1, 1, 1, 1,
-1.589127, -1.38043, -2.776223, 1, 1, 1, 1, 1,
-1.582195, 1.94631, -1.091285, 1, 1, 1, 1, 1,
-1.572002, 0.8476323, -1.711968, 1, 1, 1, 1, 1,
-1.566651, -0.09321844, -1.689869, 1, 1, 1, 1, 1,
-1.563085, -0.02443214, -2.051539, 1, 1, 1, 1, 1,
-1.562437, 0.7380078, -2.747, 1, 1, 1, 1, 1,
-1.558739, -0.7286739, -2.980586, 1, 1, 1, 1, 1,
-1.550195, 0.7861046, -1.316841, 1, 1, 1, 1, 1,
-1.54082, 0.06529759, -1.327217, 1, 1, 1, 1, 1,
-1.535404, -0.5759441, -1.267774, 1, 1, 1, 1, 1,
-1.528454, 0.7490728, -3.79074, 1, 1, 1, 1, 1,
-1.515224, 0.07541276, -2.001514, 1, 1, 1, 1, 1,
-1.514781, 1.513123, 1.099144, 1, 1, 1, 1, 1,
-1.510038, 2.412695, -0.8290799, 1, 1, 1, 1, 1,
-1.508271, 0.08816029, -2.017109, 0, 0, 1, 1, 1,
-1.505121, 1.126116, -0.5446806, 1, 0, 0, 1, 1,
-1.504492, 0.7245253, -2.128447, 1, 0, 0, 1, 1,
-1.492396, -1.311346, -4.000399, 1, 0, 0, 1, 1,
-1.488442, 1.274973, -0.6134097, 1, 0, 0, 1, 1,
-1.483653, 1.655561, -0.6769354, 1, 0, 0, 1, 1,
-1.480631, 0.7427231, -1.845016, 0, 0, 0, 1, 1,
-1.476972, -1.526852, -2.173042, 0, 0, 0, 1, 1,
-1.45837, 0.7558573, -1.404696, 0, 0, 0, 1, 1,
-1.456363, 0.5723628, 0.3533968, 0, 0, 0, 1, 1,
-1.45105, 0.8911296, -0.6932728, 0, 0, 0, 1, 1,
-1.44892, -0.2119605, -3.373962, 0, 0, 0, 1, 1,
-1.443434, -1.253719, -2.594778, 0, 0, 0, 1, 1,
-1.432298, -0.3125752, -2.280178, 1, 1, 1, 1, 1,
-1.429961, -0.7732552, -2.199916, 1, 1, 1, 1, 1,
-1.428414, 0.1481782, 0.3245288, 1, 1, 1, 1, 1,
-1.41579, 1.674774, -1.784079, 1, 1, 1, 1, 1,
-1.412148, 0.9104951, -2.360965, 1, 1, 1, 1, 1,
-1.399165, 0.2807203, -1.662662, 1, 1, 1, 1, 1,
-1.396512, -1.036082, -0.962075, 1, 1, 1, 1, 1,
-1.392784, 2.081288, -0.6342854, 1, 1, 1, 1, 1,
-1.392135, -1.977114, -1.684841, 1, 1, 1, 1, 1,
-1.390171, -2.219826, -3.252887, 1, 1, 1, 1, 1,
-1.3764, -0.03763809, -1.753718, 1, 1, 1, 1, 1,
-1.370096, 0.5132446, 0.003417263, 1, 1, 1, 1, 1,
-1.36853, -0.5582733, -1.060673, 1, 1, 1, 1, 1,
-1.35999, 1.146493, -2.38728, 1, 1, 1, 1, 1,
-1.359446, -0.07720533, -1.913515, 1, 1, 1, 1, 1,
-1.356471, -0.5424272, -1.834409, 0, 0, 1, 1, 1,
-1.349759, 1.058249, -0.6832737, 1, 0, 0, 1, 1,
-1.343344, -0.121106, -0.3294643, 1, 0, 0, 1, 1,
-1.343306, -0.3182273, -1.743746, 1, 0, 0, 1, 1,
-1.342019, -1.659549, -1.920956, 1, 0, 0, 1, 1,
-1.341642, -0.1904985, -2.778678, 1, 0, 0, 1, 1,
-1.328313, 0.2746754, -1.596618, 0, 0, 0, 1, 1,
-1.322977, -1.12175, -3.401473, 0, 0, 0, 1, 1,
-1.318997, 0.4978358, -2.283198, 0, 0, 0, 1, 1,
-1.318508, 0.3688508, -1.85657, 0, 0, 0, 1, 1,
-1.315617, 0.1828221, -1.307511, 0, 0, 0, 1, 1,
-1.311752, 1.401293, -1.305373, 0, 0, 0, 1, 1,
-1.311242, 0.3276449, -0.6874239, 0, 0, 0, 1, 1,
-1.306868, 0.3564023, 0.8338658, 1, 1, 1, 1, 1,
-1.299926, -0.5267565, -1.337347, 1, 1, 1, 1, 1,
-1.288851, -1.515014, -3.294764, 1, 1, 1, 1, 1,
-1.280548, 1.614934, -1.574013, 1, 1, 1, 1, 1,
-1.268181, 0.3907651, -1.288926, 1, 1, 1, 1, 1,
-1.2677, 0.8960421, -0.3595052, 1, 1, 1, 1, 1,
-1.266059, -1.824215, -1.87464, 1, 1, 1, 1, 1,
-1.245252, 0.2571103, -0.2931249, 1, 1, 1, 1, 1,
-1.230678, 0.4513444, -0.6340356, 1, 1, 1, 1, 1,
-1.215936, 0.5366223, -0.2714039, 1, 1, 1, 1, 1,
-1.208875, 0.7409162, -0.6761848, 1, 1, 1, 1, 1,
-1.198564, -1.660844, -2.177841, 1, 1, 1, 1, 1,
-1.197092, 2.216098, 0.02333214, 1, 1, 1, 1, 1,
-1.192191, -0.3982755, -1.674367, 1, 1, 1, 1, 1,
-1.188186, 0.5041104, -1.401444, 1, 1, 1, 1, 1,
-1.187253, -1.236007, -1.965859, 0, 0, 1, 1, 1,
-1.187251, -1.074468, -3.228374, 1, 0, 0, 1, 1,
-1.179184, -0.7952841, -2.812552, 1, 0, 0, 1, 1,
-1.175276, 0.6118506, -1.582959, 1, 0, 0, 1, 1,
-1.1722, -0.4649635, -1.550093, 1, 0, 0, 1, 1,
-1.168898, 0.7717271, 0.2898315, 1, 0, 0, 1, 1,
-1.165561, 0.9413955, -0.2687915, 0, 0, 0, 1, 1,
-1.164682, 0.7599804, -1.699409, 0, 0, 0, 1, 1,
-1.150424, -1.566473, -1.643321, 0, 0, 0, 1, 1,
-1.144346, -0.04455742, -2.080327, 0, 0, 0, 1, 1,
-1.141871, 0.2723306, -1.909381, 0, 0, 0, 1, 1,
-1.135297, 0.008239413, -1.805766, 0, 0, 0, 1, 1,
-1.132796, 0.5264989, -1.15058, 0, 0, 0, 1, 1,
-1.13243, -0.007567696, -1.325697, 1, 1, 1, 1, 1,
-1.130624, -0.1813936, -2.167401, 1, 1, 1, 1, 1,
-1.121091, -2.103685, -2.31615, 1, 1, 1, 1, 1,
-1.118426, 1.145705, -1.462041, 1, 1, 1, 1, 1,
-1.11634, -0.2213241, -1.354036, 1, 1, 1, 1, 1,
-1.108736, -0.3431465, -2.55621, 1, 1, 1, 1, 1,
-1.106034, 2.440927, 0.1149181, 1, 1, 1, 1, 1,
-1.091696, -0.5934707, -1.337252, 1, 1, 1, 1, 1,
-1.09093, -1.036721, -2.981188, 1, 1, 1, 1, 1,
-1.089349, 1.615377, 0.4052184, 1, 1, 1, 1, 1,
-1.085589, 0.8861471, -0.1066676, 1, 1, 1, 1, 1,
-1.080252, -2.071485, -3.767595, 1, 1, 1, 1, 1,
-1.079527, 0.2342931, -2.615132, 1, 1, 1, 1, 1,
-1.074335, 0.7515798, -0.6518889, 1, 1, 1, 1, 1,
-1.069221, 0.7263818, -1.460617, 1, 1, 1, 1, 1,
-1.068602, -0.9614472, -1.558979, 0, 0, 1, 1, 1,
-1.064736, -1.500951, -2.20563, 1, 0, 0, 1, 1,
-1.064193, -0.1006701, -1.102832, 1, 0, 0, 1, 1,
-1.046307, 2.259447, 2.194581, 1, 0, 0, 1, 1,
-1.042249, -1.347593, -1.784389, 1, 0, 0, 1, 1,
-1.03971, -1.403512, -1.878768, 1, 0, 0, 1, 1,
-1.039417, -0.4314516, -0.06166681, 0, 0, 0, 1, 1,
-1.037401, -0.7436826, -2.017542, 0, 0, 0, 1, 1,
-1.036416, -0.04458658, -1.311522, 0, 0, 0, 1, 1,
-1.036252, 2.48341, 0.08525611, 0, 0, 0, 1, 1,
-1.032145, -0.01496813, -0.5067943, 0, 0, 0, 1, 1,
-1.029377, -1.24214, -2.852192, 0, 0, 0, 1, 1,
-1.028298, -0.2374617, -0.6036417, 0, 0, 0, 1, 1,
-1.027856, -0.002630004, -1.243542, 1, 1, 1, 1, 1,
-1.02727, -1.6367, -3.04795, 1, 1, 1, 1, 1,
-1.021945, -0.3812439, -1.118789, 1, 1, 1, 1, 1,
-1.021488, -0.6760397, -0.5958229, 1, 1, 1, 1, 1,
-1.008383, 0.909256, 1.477164, 1, 1, 1, 1, 1,
-1.005383, 0.4225739, -0.4586022, 1, 1, 1, 1, 1,
-1.001805, -0.6191826, -4.354686, 1, 1, 1, 1, 1,
-1.001739, -0.7008309, -1.84432, 1, 1, 1, 1, 1,
-0.9996479, -1.311363, -2.23372, 1, 1, 1, 1, 1,
-0.9988808, -0.1199722, -0.3976943, 1, 1, 1, 1, 1,
-0.9957348, -1.22608, -2.254314, 1, 1, 1, 1, 1,
-0.9898829, 0.9052053, -0.6357247, 1, 1, 1, 1, 1,
-0.980827, 0.5205463, -2.170937, 1, 1, 1, 1, 1,
-0.969918, -0.2978841, -2.642076, 1, 1, 1, 1, 1,
-0.9610239, -0.729452, -2.596474, 1, 1, 1, 1, 1,
-0.959474, -1.117398, -1.802792, 0, 0, 1, 1, 1,
-0.959186, 0.02328021, -2.954467, 1, 0, 0, 1, 1,
-0.9590587, 0.1843036, -1.472275, 1, 0, 0, 1, 1,
-0.9495607, 0.3076381, -1.776858, 1, 0, 0, 1, 1,
-0.9476212, -0.9184875, -1.918882, 1, 0, 0, 1, 1,
-0.9337525, 0.4880877, -0.01014756, 1, 0, 0, 1, 1,
-0.9322279, 1.359957, 0.5654878, 0, 0, 0, 1, 1,
-0.9320793, 0.2589033, -1.430266, 0, 0, 0, 1, 1,
-0.931967, 1.070361, -1.417472, 0, 0, 0, 1, 1,
-0.9288746, 0.9489753, -3.04387, 0, 0, 0, 1, 1,
-0.9288037, 0.4615326, -0.5681856, 0, 0, 0, 1, 1,
-0.926716, 0.2967593, -1.688093, 0, 0, 0, 1, 1,
-0.924403, -0.1097384, -2.278924, 0, 0, 0, 1, 1,
-0.9196727, -2.059916, -3.65965, 1, 1, 1, 1, 1,
-0.9155205, 1.343715, -0.5446822, 1, 1, 1, 1, 1,
-0.9126008, -0.1273974, 0.2353217, 1, 1, 1, 1, 1,
-0.9124361, -1.208446, -1.083319, 1, 1, 1, 1, 1,
-0.9113969, -0.1368773, -0.5100518, 1, 1, 1, 1, 1,
-0.9113123, 1.271451, -0.8158715, 1, 1, 1, 1, 1,
-0.9084824, 0.2729562, -1.381847, 1, 1, 1, 1, 1,
-0.902523, 0.3998757, -2.530801, 1, 1, 1, 1, 1,
-0.8985515, -1.317984, -2.547047, 1, 1, 1, 1, 1,
-0.8972709, -0.113889, -0.7748837, 1, 1, 1, 1, 1,
-0.8950902, -1.445026, -3.110614, 1, 1, 1, 1, 1,
-0.8945525, -1.853511, -1.382955, 1, 1, 1, 1, 1,
-0.8906805, 0.5229241, -2.703398, 1, 1, 1, 1, 1,
-0.890485, -0.6634239, -1.181561, 1, 1, 1, 1, 1,
-0.887245, 0.236468, -1.693002, 1, 1, 1, 1, 1,
-0.886136, 1.186045, -0.07551626, 0, 0, 1, 1, 1,
-0.871047, -0.5177701, -1.994823, 1, 0, 0, 1, 1,
-0.8675444, -2.526561, -2.20911, 1, 0, 0, 1, 1,
-0.8670743, -0.4857404, -1.663347, 1, 0, 0, 1, 1,
-0.8668501, 1.88285, -1.577168, 1, 0, 0, 1, 1,
-0.8605819, 0.5787188, -2.214825, 1, 0, 0, 1, 1,
-0.858071, -0.487349, -1.722502, 0, 0, 0, 1, 1,
-0.8512538, -1.639366, -2.7999, 0, 0, 0, 1, 1,
-0.8443448, 0.3598633, -2.224559, 0, 0, 0, 1, 1,
-0.8408945, -0.1736581, -0.5259297, 0, 0, 0, 1, 1,
-0.8350942, 0.8770372, -1.546496, 0, 0, 0, 1, 1,
-0.8345112, -1.333552, -2.578695, 0, 0, 0, 1, 1,
-0.8312057, 0.5566678, -0.3521822, 0, 0, 0, 1, 1,
-0.8296866, 0.6447878, -1.236675, 1, 1, 1, 1, 1,
-0.8278751, 0.05376608, -1.398409, 1, 1, 1, 1, 1,
-0.827428, -0.3099052, -1.793769, 1, 1, 1, 1, 1,
-0.8249694, 1.136958, -0.2512671, 1, 1, 1, 1, 1,
-0.8247722, -0.38912, -3.591205, 1, 1, 1, 1, 1,
-0.823639, -1.036007, -2.134934, 1, 1, 1, 1, 1,
-0.8174914, -0.4911182, -2.38901, 1, 1, 1, 1, 1,
-0.8174874, 1.150442, -0.01990975, 1, 1, 1, 1, 1,
-0.815929, -0.8297521, -1.036247, 1, 1, 1, 1, 1,
-0.8152223, 0.2251542, -1.398802, 1, 1, 1, 1, 1,
-0.8132806, -0.009238305, -2.464402, 1, 1, 1, 1, 1,
-0.8104169, 0.5511162, -1.590822, 1, 1, 1, 1, 1,
-0.8078954, 0.3198098, -1.620681, 1, 1, 1, 1, 1,
-0.7955724, -0.3497935, -2.314957, 1, 1, 1, 1, 1,
-0.7952325, -2.233091, -3.545463, 1, 1, 1, 1, 1,
-0.7886412, 0.683896, -1.14446, 0, 0, 1, 1, 1,
-0.784255, -1.538263, -2.90306, 1, 0, 0, 1, 1,
-0.7836475, 0.7164389, 0.1239314, 1, 0, 0, 1, 1,
-0.7822989, 0.3566099, -1.901529, 1, 0, 0, 1, 1,
-0.7812847, 1.127658, -0.8191386, 1, 0, 0, 1, 1,
-0.7809498, 0.1956307, 0.2364323, 1, 0, 0, 1, 1,
-0.7800083, -0.2181967, -2.971112, 0, 0, 0, 1, 1,
-0.7789091, 0.2897118, -0.9895599, 0, 0, 0, 1, 1,
-0.7757652, 0.6016528, -0.5591918, 0, 0, 0, 1, 1,
-0.77483, -1.286258, -2.443398, 0, 0, 0, 1, 1,
-0.7724664, -1.231278, -2.66741, 0, 0, 0, 1, 1,
-0.7650273, 1.142486, 0.2372952, 0, 0, 0, 1, 1,
-0.7598936, -0.3615355, -1.074918, 0, 0, 0, 1, 1,
-0.744584, -1.092292, -2.824209, 1, 1, 1, 1, 1,
-0.7385365, 0.3252787, -1.601343, 1, 1, 1, 1, 1,
-0.7315218, -0.9641368, -3.272341, 1, 1, 1, 1, 1,
-0.7204411, -0.1044293, -0.620039, 1, 1, 1, 1, 1,
-0.7199265, 0.2119894, -1.690606, 1, 1, 1, 1, 1,
-0.717257, -0.6613868, -2.541757, 1, 1, 1, 1, 1,
-0.713693, -1.685133, -2.252543, 1, 1, 1, 1, 1,
-0.7127358, -2.226974, -0.9197662, 1, 1, 1, 1, 1,
-0.710968, -1.858802, -2.048459, 1, 1, 1, 1, 1,
-0.7104592, 0.5238447, 0.5860598, 1, 1, 1, 1, 1,
-0.7102784, -0.7315781, -1.869116, 1, 1, 1, 1, 1,
-0.7099617, -0.193915, -1.113239, 1, 1, 1, 1, 1,
-0.7076566, 3.084434, 0.9393057, 1, 1, 1, 1, 1,
-0.7049814, 0.4097034, -1.065354, 1, 1, 1, 1, 1,
-0.7007106, -1.030097, -3.15527, 1, 1, 1, 1, 1,
-0.6998318, 0.2912148, -1.740772, 0, 0, 1, 1, 1,
-0.6992336, -2.366617, -2.735655, 1, 0, 0, 1, 1,
-0.6987171, -0.7680236, -2.799395, 1, 0, 0, 1, 1,
-0.6983728, -0.2769133, -4.01074, 1, 0, 0, 1, 1,
-0.6969247, -1.478017, -1.718493, 1, 0, 0, 1, 1,
-0.6936288, 2.551627, 2.013767, 1, 0, 0, 1, 1,
-0.6932909, 0.3706775, -0.7315155, 0, 0, 0, 1, 1,
-0.6920276, 0.5194063, -2.26248, 0, 0, 0, 1, 1,
-0.691542, 0.1186353, -1.663349, 0, 0, 0, 1, 1,
-0.6884915, 0.541405, -0.3305917, 0, 0, 0, 1, 1,
-0.6875181, -0.6412899, -2.898707, 0, 0, 0, 1, 1,
-0.6770079, -0.1484721, -3.951314, 0, 0, 0, 1, 1,
-0.6685049, -0.3978697, -2.566864, 0, 0, 0, 1, 1,
-0.6665904, 0.934302, 0.5261878, 1, 1, 1, 1, 1,
-0.6661622, 1.055689, -0.6845609, 1, 1, 1, 1, 1,
-0.665593, 0.07730169, -1.487689, 1, 1, 1, 1, 1,
-0.6649342, 0.2136631, -1.40497, 1, 1, 1, 1, 1,
-0.6643707, -0.7714033, -3.326063, 1, 1, 1, 1, 1,
-0.6622888, -0.3402165, 0.09997074, 1, 1, 1, 1, 1,
-0.6554334, 1.854267, 1.003145, 1, 1, 1, 1, 1,
-0.6490558, -0.009893845, -0.4485105, 1, 1, 1, 1, 1,
-0.6488698, -0.9902058, -3.517445, 1, 1, 1, 1, 1,
-0.6481956, 0.663393, -0.968869, 1, 1, 1, 1, 1,
-0.642231, 1.889467, 0.229983, 1, 1, 1, 1, 1,
-0.6420356, -0.3689717, -1.144228, 1, 1, 1, 1, 1,
-0.6341503, -0.5249843, -2.625396, 1, 1, 1, 1, 1,
-0.6309802, 1.796222, -0.6096849, 1, 1, 1, 1, 1,
-0.6225204, 1.852255, 0.1165161, 1, 1, 1, 1, 1,
-0.6187364, -1.067083, -2.266124, 0, 0, 1, 1, 1,
-0.6184871, 1.089067, 0.1095897, 1, 0, 0, 1, 1,
-0.6138061, -0.7404724, -4.01253, 1, 0, 0, 1, 1,
-0.6125786, -0.235557, -3.610244, 1, 0, 0, 1, 1,
-0.6119229, -0.5776803, -3.47764, 1, 0, 0, 1, 1,
-0.6109016, -0.8720263, -1.333117, 1, 0, 0, 1, 1,
-0.6100482, 0.1461253, -1.977584, 0, 0, 0, 1, 1,
-0.6087707, -0.34213, -2.331879, 0, 0, 0, 1, 1,
-0.6031509, -0.6314723, -3.712823, 0, 0, 0, 1, 1,
-0.5975929, -0.04305837, -1.980915, 0, 0, 0, 1, 1,
-0.5922659, -0.6461068, -2.386465, 0, 0, 0, 1, 1,
-0.5922427, 0.4426861, -0.7333895, 0, 0, 0, 1, 1,
-0.5910943, -0.5559972, -1.372865, 0, 0, 0, 1, 1,
-0.5907176, 1.262243, -0.8106738, 1, 1, 1, 1, 1,
-0.5838214, 0.6660605, -0.7446194, 1, 1, 1, 1, 1,
-0.5828088, 0.6512854, -0.5296628, 1, 1, 1, 1, 1,
-0.5806337, -0.2679933, -1.968967, 1, 1, 1, 1, 1,
-0.5789982, 1.100163, -1.486696, 1, 1, 1, 1, 1,
-0.5783993, -0.5954279, -2.284889, 1, 1, 1, 1, 1,
-0.5747331, -0.0232826, -1.472734, 1, 1, 1, 1, 1,
-0.5717729, -0.3176886, -2.688883, 1, 1, 1, 1, 1,
-0.5711927, -0.5018026, -1.768344, 1, 1, 1, 1, 1,
-0.5684341, -0.5615324, -1.957183, 1, 1, 1, 1, 1,
-0.565651, -0.2440003, 0.2910668, 1, 1, 1, 1, 1,
-0.5642579, 0.7514377, 0.08637925, 1, 1, 1, 1, 1,
-0.5609036, 1.952788, -0.6257262, 1, 1, 1, 1, 1,
-0.5600331, 1.002405, 0.3738379, 1, 1, 1, 1, 1,
-0.5563413, -0.01455505, -3.309002, 1, 1, 1, 1, 1,
-0.5557179, 0.1808235, 0.0794441, 0, 0, 1, 1, 1,
-0.5510665, 0.8156854, -1.874197, 1, 0, 0, 1, 1,
-0.5507048, -0.5058017, -2.56302, 1, 0, 0, 1, 1,
-0.547115, -0.4267364, -1.440522, 1, 0, 0, 1, 1,
-0.5452527, 3.081677, -0.2578537, 1, 0, 0, 1, 1,
-0.5441694, -1.374001, -2.826535, 1, 0, 0, 1, 1,
-0.5410194, -0.1309233, -2.302776, 0, 0, 0, 1, 1,
-0.5405338, -1.592316, -0.7700091, 0, 0, 0, 1, 1,
-0.5381523, 0.1425837, -1.009862, 0, 0, 0, 1, 1,
-0.5354807, 1.663164, -1.38597, 0, 0, 0, 1, 1,
-0.5197741, 0.4621463, -2.115528, 0, 0, 0, 1, 1,
-0.5175991, -0.2900026, -2.856543, 0, 0, 0, 1, 1,
-0.5110118, -2.116408, -3.184633, 0, 0, 0, 1, 1,
-0.5107416, -0.1648839, -1.267652, 1, 1, 1, 1, 1,
-0.5089557, -0.8138897, -3.739878, 1, 1, 1, 1, 1,
-0.5068162, -0.3351582, -2.004881, 1, 1, 1, 1, 1,
-0.5051202, 2.45126, -1.159649, 1, 1, 1, 1, 1,
-0.4941565, 0.7391765, -3.11907, 1, 1, 1, 1, 1,
-0.4931225, 1.107881, -1.825963, 1, 1, 1, 1, 1,
-0.4926039, -0.6576629, -1.880727, 1, 1, 1, 1, 1,
-0.4847352, 0.5246764, -1.192627, 1, 1, 1, 1, 1,
-0.4829734, 0.2426693, -1.002949, 1, 1, 1, 1, 1,
-0.4774642, 1.350026, -1.413126, 1, 1, 1, 1, 1,
-0.4757867, 0.8157233, 0.6116549, 1, 1, 1, 1, 1,
-0.4756363, 0.9314654, 0.716529, 1, 1, 1, 1, 1,
-0.4740157, 0.8967351, -2.048169, 1, 1, 1, 1, 1,
-0.4734001, 1.346211, -1.459135, 1, 1, 1, 1, 1,
-0.4714069, -1.191925, -3.474003, 1, 1, 1, 1, 1,
-0.470525, -1.957414, -2.570939, 0, 0, 1, 1, 1,
-0.4684137, -2.219889, -3.10918, 1, 0, 0, 1, 1,
-0.4674296, -1.48531, -3.167158, 1, 0, 0, 1, 1,
-0.4672259, -0.3437383, -3.769608, 1, 0, 0, 1, 1,
-0.4667535, 0.2926016, -0.9, 1, 0, 0, 1, 1,
-0.460503, -0.4427973, -2.720912, 1, 0, 0, 1, 1,
-0.4513034, -0.04058684, -0.4552158, 0, 0, 0, 1, 1,
-0.4464726, 0.04677636, -0.9772151, 0, 0, 0, 1, 1,
-0.4437259, -0.440919, -3.274083, 0, 0, 0, 1, 1,
-0.4431277, 1.853927, -0.8265847, 0, 0, 0, 1, 1,
-0.4383129, 1.121145, -0.4872841, 0, 0, 0, 1, 1,
-0.4304202, -0.5762635, -2.932408, 0, 0, 0, 1, 1,
-0.4285687, -0.2773009, -1.508559, 0, 0, 0, 1, 1,
-0.427794, -1.123268, -2.085754, 1, 1, 1, 1, 1,
-0.4263674, 0.07907885, -1.325389, 1, 1, 1, 1, 1,
-0.4225913, -0.4540653, -2.098803, 1, 1, 1, 1, 1,
-0.4166138, 0.2171281, -1.637164, 1, 1, 1, 1, 1,
-0.4081336, -0.3719261, -1.781372, 1, 1, 1, 1, 1,
-0.4056916, 0.2061932, -0.2636617, 1, 1, 1, 1, 1,
-0.4016209, -1.520435, -3.937444, 1, 1, 1, 1, 1,
-0.401546, -0.7718856, -3.334453, 1, 1, 1, 1, 1,
-0.4005525, -0.4705594, -4.128676, 1, 1, 1, 1, 1,
-0.3992726, -0.1020962, -0.7158327, 1, 1, 1, 1, 1,
-0.3877551, -0.2009746, -0.09534729, 1, 1, 1, 1, 1,
-0.382916, -1.500038, -1.329396, 1, 1, 1, 1, 1,
-0.3817886, 0.853221, -0.922939, 1, 1, 1, 1, 1,
-0.3788296, -0.2070162, -2.770641, 1, 1, 1, 1, 1,
-0.3735814, 1.351606, 0.1960513, 1, 1, 1, 1, 1,
-0.373378, -1.686669, -2.575599, 0, 0, 1, 1, 1,
-0.3641503, 0.6034214, 0.8985272, 1, 0, 0, 1, 1,
-0.3602559, 0.3445196, -1.792056, 1, 0, 0, 1, 1,
-0.359406, 1.560521, 0.0699885, 1, 0, 0, 1, 1,
-0.3572667, -0.2659895, -2.245531, 1, 0, 0, 1, 1,
-0.3565623, 1.760856, -0.3247112, 1, 0, 0, 1, 1,
-0.343312, 0.7036117, -0.2940004, 0, 0, 0, 1, 1,
-0.3417259, 0.5561795, 0.5823531, 0, 0, 0, 1, 1,
-0.3299183, 0.6209534, 1.177114, 0, 0, 0, 1, 1,
-0.329692, -0.3540561, -4.732289, 0, 0, 0, 1, 1,
-0.3259296, -1.812901, -2.6311, 0, 0, 0, 1, 1,
-0.325063, 0.6218372, -1.958563, 0, 0, 0, 1, 1,
-0.3189752, 1.801669, 1.43958, 0, 0, 0, 1, 1,
-0.3127169, -0.7084986, -1.755456, 1, 1, 1, 1, 1,
-0.3048701, -0.06371596, -2.188418, 1, 1, 1, 1, 1,
-0.2966069, 1.253933, -0.02889617, 1, 1, 1, 1, 1,
-0.2935666, -0.8621928, -2.645585, 1, 1, 1, 1, 1,
-0.2899173, -1.23505, -3.337585, 1, 1, 1, 1, 1,
-0.2844059, 0.7191824, -0.9964854, 1, 1, 1, 1, 1,
-0.2809873, -0.3456146, -3.749698, 1, 1, 1, 1, 1,
-0.2718478, 0.6648602, 0.6815972, 1, 1, 1, 1, 1,
-0.2717266, -0.8404262, -2.622044, 1, 1, 1, 1, 1,
-0.2708365, 0.750322, -0.07210768, 1, 1, 1, 1, 1,
-0.2664953, -0.1024078, -1.281429, 1, 1, 1, 1, 1,
-0.2600592, -0.9757866, -1.348567, 1, 1, 1, 1, 1,
-0.2594166, 0.6446685, -1.045532, 1, 1, 1, 1, 1,
-0.2560468, 1.271091, -0.5463525, 1, 1, 1, 1, 1,
-0.2545465, 0.1247259, -0.9003064, 1, 1, 1, 1, 1,
-0.250901, 1.000164, -0.2953069, 0, 0, 1, 1, 1,
-0.2500413, 0.4857267, 1.639991, 1, 0, 0, 1, 1,
-0.2493996, -0.07538445, -1.951106, 1, 0, 0, 1, 1,
-0.2492671, 0.7208384, -1.219525, 1, 0, 0, 1, 1,
-0.2489998, 0.6189643, -1.157604, 1, 0, 0, 1, 1,
-0.2478133, -0.2933534, -2.410127, 1, 0, 0, 1, 1,
-0.2460068, -1.069656, -2.544003, 0, 0, 0, 1, 1,
-0.2377718, -0.2056126, -2.424114, 0, 0, 0, 1, 1,
-0.2354529, -1.194603, -1.205945, 0, 0, 0, 1, 1,
-0.2328833, 0.3511135, -0.2836368, 0, 0, 0, 1, 1,
-0.2286425, 1.18946, 0.3915153, 0, 0, 0, 1, 1,
-0.2244051, 0.2844775, -2.491378, 0, 0, 0, 1, 1,
-0.2203588, 1.399344, 0.5000302, 0, 0, 0, 1, 1,
-0.2178027, -0.7695736, -1.857332, 1, 1, 1, 1, 1,
-0.2161135, 0.481447, 0.3445264, 1, 1, 1, 1, 1,
-0.2147193, -2.355965, -3.536305, 1, 1, 1, 1, 1,
-0.2130935, -0.5653861, -2.602229, 1, 1, 1, 1, 1,
-0.2122575, -0.2703041, -1.827515, 1, 1, 1, 1, 1,
-0.2069087, -1.772249, -3.334296, 1, 1, 1, 1, 1,
-0.2049293, -0.3259325, -2.484244, 1, 1, 1, 1, 1,
-0.1997385, 0.8011063, 0.1958918, 1, 1, 1, 1, 1,
-0.1974831, 0.7241821, 0.3430822, 1, 1, 1, 1, 1,
-0.1971838, 1.932194, -0.5642245, 1, 1, 1, 1, 1,
-0.1969576, -0.4367147, -1.551655, 1, 1, 1, 1, 1,
-0.1938511, -0.2991664, -2.214318, 1, 1, 1, 1, 1,
-0.1936158, -0.5452284, -2.852088, 1, 1, 1, 1, 1,
-0.1933765, 1.76388, -1.143218, 1, 1, 1, 1, 1,
-0.1859077, -0.3475353, -2.465588, 1, 1, 1, 1, 1,
-0.1844039, -0.4132777, -3.75104, 0, 0, 1, 1, 1,
-0.1806215, -0.6943644, -1.017547, 1, 0, 0, 1, 1,
-0.1765888, 0.2481887, -0.5358761, 1, 0, 0, 1, 1,
-0.175302, 0.4840117, 0.0670443, 1, 0, 0, 1, 1,
-0.1698759, -0.3161968, -1.793267, 1, 0, 0, 1, 1,
-0.1678983, 0.3072831, -1.423964, 1, 0, 0, 1, 1,
-0.166843, -1.28275, -2.409365, 0, 0, 0, 1, 1,
-0.1616743, 1.075595, 0.6088838, 0, 0, 0, 1, 1,
-0.1611452, -0.9131194, -3.439141, 0, 0, 0, 1, 1,
-0.1589261, 0.4448948, -1.321197, 0, 0, 0, 1, 1,
-0.1573666, -0.1249493, -2.331468, 0, 0, 0, 1, 1,
-0.1539361, 0.6084056, 1.414631, 0, 0, 0, 1, 1,
-0.1534136, 1.325187, -0.3877388, 0, 0, 0, 1, 1,
-0.1519842, 0.8862497, -0.6275685, 1, 1, 1, 1, 1,
-0.1473096, -0.3170547, -1.847183, 1, 1, 1, 1, 1,
-0.1449823, -1.137833, -3.233663, 1, 1, 1, 1, 1,
-0.1425561, -1.801892, -3.304461, 1, 1, 1, 1, 1,
-0.1411234, -0.6464413, -3.126223, 1, 1, 1, 1, 1,
-0.1397635, -0.6308739, -3.895899, 1, 1, 1, 1, 1,
-0.1395891, 0.07238283, -1.701234, 1, 1, 1, 1, 1,
-0.1355316, 0.9879127, -0.4994491, 1, 1, 1, 1, 1,
-0.1337078, 1.162004, -0.1270039, 1, 1, 1, 1, 1,
-0.1313312, 0.6777427, 0.4416941, 1, 1, 1, 1, 1,
-0.1228156, 0.1489134, 1.332368, 1, 1, 1, 1, 1,
-0.1201481, 1.51164, 0.3639217, 1, 1, 1, 1, 1,
-0.1197135, 0.7704963, 0.1447152, 1, 1, 1, 1, 1,
-0.1190801, -0.04726212, -1.318606, 1, 1, 1, 1, 1,
-0.1150207, 2.638544, -1.007922, 1, 1, 1, 1, 1,
-0.113997, 0.245369, -0.5341059, 0, 0, 1, 1, 1,
-0.110665, -0.1167523, -2.716805, 1, 0, 0, 1, 1,
-0.1087678, 1.537634, -0.1379719, 1, 0, 0, 1, 1,
-0.108342, -0.259978, -3.648504, 1, 0, 0, 1, 1,
-0.1068704, 0.132334, -0.9576895, 1, 0, 0, 1, 1,
-0.1068166, 1.15585, -0.1938753, 1, 0, 0, 1, 1,
-0.1052643, 0.7873709, -0.3742152, 0, 0, 0, 1, 1,
-0.1022335, 0.07352084, -1.532727, 0, 0, 0, 1, 1,
-0.101281, 0.9405479, 0.4228705, 0, 0, 0, 1, 1,
-0.1007978, -0.8351253, -1.772085, 0, 0, 0, 1, 1,
-0.09566201, 0.677128, -0.2944263, 0, 0, 0, 1, 1,
-0.09362186, 0.9234043, -1.714361, 0, 0, 0, 1, 1,
-0.09157623, -1.094586, -4.452182, 0, 0, 0, 1, 1,
-0.09074838, 0.3528055, -0.1954514, 1, 1, 1, 1, 1,
-0.08998074, -1.661494, -2.346213, 1, 1, 1, 1, 1,
-0.08653013, 2.285936, -0.8022064, 1, 1, 1, 1, 1,
-0.08537786, -0.2658766, -2.274901, 1, 1, 1, 1, 1,
-0.07899465, -0.3353444, -3.022937, 1, 1, 1, 1, 1,
-0.07353206, 0.6047811, -0.2609071, 1, 1, 1, 1, 1,
-0.07246578, 0.4496431, -0.7520298, 1, 1, 1, 1, 1,
-0.06994661, 0.0273457, -0.4017733, 1, 1, 1, 1, 1,
-0.06979837, -0.07382031, -2.438667, 1, 1, 1, 1, 1,
-0.06924424, 1.97794, -0.08301982, 1, 1, 1, 1, 1,
-0.06789922, 1.208141, -0.5673182, 1, 1, 1, 1, 1,
-0.05652951, -0.6294256, -4.749954, 1, 1, 1, 1, 1,
-0.05219338, 0.1123243, -1.691166, 1, 1, 1, 1, 1,
-0.05114834, -1.369402, -1.840474, 1, 1, 1, 1, 1,
-0.0502343, -0.6129104, -2.297273, 1, 1, 1, 1, 1,
-0.0493945, 0.507991, -1.061643, 0, 0, 1, 1, 1,
-0.04788906, 0.2904945, -2.09449, 1, 0, 0, 1, 1,
-0.04557411, -0.05736024, -3.023498, 1, 0, 0, 1, 1,
-0.04544326, -2.423588, -2.679856, 1, 0, 0, 1, 1,
-0.04529021, -0.3841751, -3.347075, 1, 0, 0, 1, 1,
-0.03729391, 0.494513, -0.3130279, 1, 0, 0, 1, 1,
-0.02629029, 2.107562, 0.4770248, 0, 0, 0, 1, 1,
-0.02090241, -0.9336277, -4.965669, 0, 0, 0, 1, 1,
-0.01804848, 0.2371142, 1.569356, 0, 0, 0, 1, 1,
-0.01784894, 0.5385339, -1.150259, 0, 0, 0, 1, 1,
-0.016641, 1.138734, 0.5339829, 0, 0, 0, 1, 1,
-0.01335221, -0.4306521, -3.364538, 0, 0, 0, 1, 1,
-0.006576577, -0.09443467, -5.142403, 0, 0, 0, 1, 1,
-0.005841804, 0.5788264, -0.1088974, 1, 1, 1, 1, 1,
-0.004070926, 0.1869233, -2.735695, 1, 1, 1, 1, 1,
-0.003232687, 1.834654, -0.1945351, 1, 1, 1, 1, 1,
-0.002173577, -0.04134732, -1.992597, 1, 1, 1, 1, 1,
-0.0004240855, 0.301313, 0.579197, 1, 1, 1, 1, 1,
0.006504308, 0.4663787, -1.035481, 1, 1, 1, 1, 1,
0.007268534, -1.373426, 2.659276, 1, 1, 1, 1, 1,
0.007731405, 0.5164273, 0.9970255, 1, 1, 1, 1, 1,
0.01536696, 0.358046, 0.1939421, 1, 1, 1, 1, 1,
0.01811159, -0.1448673, 1.496928, 1, 1, 1, 1, 1,
0.02142179, 1.082661, -0.8240198, 1, 1, 1, 1, 1,
0.02228433, -1.642775, 3.471695, 1, 1, 1, 1, 1,
0.02549651, -0.5793642, 3.792986, 1, 1, 1, 1, 1,
0.02857383, 0.6023703, -0.7818961, 1, 1, 1, 1, 1,
0.03409645, -0.00187977, 1.159303, 1, 1, 1, 1, 1,
0.03693417, 0.415573, 1.39143, 0, 0, 1, 1, 1,
0.0396588, 0.8974409, -0.9321893, 1, 0, 0, 1, 1,
0.04417213, 0.02256849, 2.680343, 1, 0, 0, 1, 1,
0.04467526, 0.631382, -0.5058523, 1, 0, 0, 1, 1,
0.04598876, -0.2638983, 3.234755, 1, 0, 0, 1, 1,
0.04602175, 1.69159, 1.383905, 1, 0, 0, 1, 1,
0.0491582, -0.4229495, 3.960319, 0, 0, 0, 1, 1,
0.05157204, -0.3350612, 4.600809, 0, 0, 0, 1, 1,
0.05195487, 0.5738507, -0.8830272, 0, 0, 0, 1, 1,
0.05231452, 0.3898788, 0.486139, 0, 0, 0, 1, 1,
0.05537405, -0.1030694, 1.794322, 0, 0, 0, 1, 1,
0.05703077, -0.3408425, 3.991671, 0, 0, 0, 1, 1,
0.05748772, 1.267078, -0.8466446, 0, 0, 0, 1, 1,
0.05790109, -0.1461623, 1.885854, 1, 1, 1, 1, 1,
0.06016487, -0.8398706, 1.259416, 1, 1, 1, 1, 1,
0.06046736, 1.661052, 0.7303249, 1, 1, 1, 1, 1,
0.06636835, -2.227022, 2.328858, 1, 1, 1, 1, 1,
0.07302631, 1.124527, 2.120824, 1, 1, 1, 1, 1,
0.07419675, 0.8337355, 1.604675, 1, 1, 1, 1, 1,
0.07594495, 0.4950726, -0.3789302, 1, 1, 1, 1, 1,
0.08503724, -0.8904635, 2.742447, 1, 1, 1, 1, 1,
0.08910829, -0.3735754, 4.215142, 1, 1, 1, 1, 1,
0.08912084, -0.04936296, 1.673702, 1, 1, 1, 1, 1,
0.08987752, -1.605618, 2.634541, 1, 1, 1, 1, 1,
0.09121024, -0.03236984, 1.525811, 1, 1, 1, 1, 1,
0.09379888, 1.218739, 0.5186753, 1, 1, 1, 1, 1,
0.09724741, -0.6319644, 3.450897, 1, 1, 1, 1, 1,
0.1000537, 1.295365, 0.02387933, 1, 1, 1, 1, 1,
0.1046598, 1.169392, 1.309477, 0, 0, 1, 1, 1,
0.1058667, 0.2473435, 1.4758, 1, 0, 0, 1, 1,
0.1145635, -0.0619185, 1.191036, 1, 0, 0, 1, 1,
0.1205122, -0.5971385, 3.888812, 1, 0, 0, 1, 1,
0.1212369, 0.3311312, 2.131496, 1, 0, 0, 1, 1,
0.1235293, -1.575992, 2.951566, 1, 0, 0, 1, 1,
0.1265331, -0.767692, 4.491761, 0, 0, 0, 1, 1,
0.1321468, -0.9796516, 3.702978, 0, 0, 0, 1, 1,
0.1351522, 0.1721557, 1.612198, 0, 0, 0, 1, 1,
0.1361673, 1.975428, 0.1092417, 0, 0, 0, 1, 1,
0.1382275, 0.5895948, -2.301119, 0, 0, 0, 1, 1,
0.1396747, -0.535291, 4.457654, 0, 0, 0, 1, 1,
0.1409858, -1.643837, 3.245566, 0, 0, 0, 1, 1,
0.1410348, 1.082474, 0.8504732, 1, 1, 1, 1, 1,
0.1478661, -0.4717549, 2.690097, 1, 1, 1, 1, 1,
0.1485865, 0.160233, 0.4439734, 1, 1, 1, 1, 1,
0.1494932, -0.6648971, 3.54148, 1, 1, 1, 1, 1,
0.1505371, -0.07303397, -0.01260607, 1, 1, 1, 1, 1,
0.1544928, -1.281586, 2.985263, 1, 1, 1, 1, 1,
0.1546331, 0.5423542, 2.3634, 1, 1, 1, 1, 1,
0.1563908, 1.204974, -1.532629, 1, 1, 1, 1, 1,
0.1569348, -0.05113061, 0.96462, 1, 1, 1, 1, 1,
0.1586818, 0.5251738, 0.9526135, 1, 1, 1, 1, 1,
0.1603061, -0.005535735, 0.258053, 1, 1, 1, 1, 1,
0.1605241, -0.4467674, 1.751413, 1, 1, 1, 1, 1,
0.1641179, 0.4353984, 0.07959912, 1, 1, 1, 1, 1,
0.168703, -0.4300342, 1.997852, 1, 1, 1, 1, 1,
0.1698133, -0.268323, 2.268701, 1, 1, 1, 1, 1,
0.1749972, 1.816266, 1.031441, 0, 0, 1, 1, 1,
0.1762796, -0.8061247, 4.021729, 1, 0, 0, 1, 1,
0.1777498, -0.2281628, 3.980131, 1, 0, 0, 1, 1,
0.1784002, 0.4245625, 0.02627001, 1, 0, 0, 1, 1,
0.1811627, 0.1431823, 2.375984, 1, 0, 0, 1, 1,
0.1897711, -1.3557, 4.938941, 1, 0, 0, 1, 1,
0.1914833, 0.5104588, -0.09606994, 0, 0, 0, 1, 1,
0.1938089, -0.820062, 2.965008, 0, 0, 0, 1, 1,
0.1957126, 0.3907061, -0.1128688, 0, 0, 0, 1, 1,
0.1958531, 1.032918, 1.214442, 0, 0, 0, 1, 1,
0.2045306, 0.9450404, -0.3533182, 0, 0, 0, 1, 1,
0.207811, -1.625355, 3.054497, 0, 0, 0, 1, 1,
0.2096083, 0.8003443, -0.2610307, 0, 0, 0, 1, 1,
0.2104027, 0.3509382, 0.9244226, 1, 1, 1, 1, 1,
0.2123658, 1.859472, 0.2581483, 1, 1, 1, 1, 1,
0.2164254, 0.1679694, 1.511727, 1, 1, 1, 1, 1,
0.2175562, -0.3409913, 2.332819, 1, 1, 1, 1, 1,
0.2214524, -1.759672, 4.240387, 1, 1, 1, 1, 1,
0.2273276, -1.363142, 2.142486, 1, 1, 1, 1, 1,
0.2279565, 0.05006691, 0.262531, 1, 1, 1, 1, 1,
0.2299159, -0.01191309, 2.265503, 1, 1, 1, 1, 1,
0.2302181, 0.2562769, 1.119972, 1, 1, 1, 1, 1,
0.2315159, 0.4747872, -0.03096422, 1, 1, 1, 1, 1,
0.238354, 0.8447727, 0.1917578, 1, 1, 1, 1, 1,
0.2419502, 0.1197039, 1.48713, 1, 1, 1, 1, 1,
0.2465298, -0.3791662, 3.071927, 1, 1, 1, 1, 1,
0.246631, -0.1637243, 0.4644875, 1, 1, 1, 1, 1,
0.2561082, -0.4301724, 1.547919, 1, 1, 1, 1, 1,
0.2611544, -0.3591501, 2.412184, 0, 0, 1, 1, 1,
0.2637418, -0.2410877, 1.6705, 1, 0, 0, 1, 1,
0.2640607, -1.215001, 2.611781, 1, 0, 0, 1, 1,
0.2643399, -1.335825, 3.770972, 1, 0, 0, 1, 1,
0.2680644, -1.429614, 1.806953, 1, 0, 0, 1, 1,
0.2686492, 0.08915459, 1.668089, 1, 0, 0, 1, 1,
0.2715987, 1.903549, -0.1877813, 0, 0, 0, 1, 1,
0.2758472, -0.2427907, 2.518904, 0, 0, 0, 1, 1,
0.2759441, -0.4546268, 2.595721, 0, 0, 0, 1, 1,
0.2785353, 2.695591, 0.1491806, 0, 0, 0, 1, 1,
0.2819041, 1.740935, -0.05092349, 0, 0, 0, 1, 1,
0.2819803, -0.6164496, 2.755394, 0, 0, 0, 1, 1,
0.2826091, -0.9937754, 1.5248, 0, 0, 0, 1, 1,
0.285008, 0.3054229, 1.344189, 1, 1, 1, 1, 1,
0.2855524, -0.8558356, 3.497325, 1, 1, 1, 1, 1,
0.2876155, 0.2292649, 1.649411, 1, 1, 1, 1, 1,
0.2930444, 0.7857005, 1.043022, 1, 1, 1, 1, 1,
0.2955753, -0.5966562, 3.553969, 1, 1, 1, 1, 1,
0.295756, 1.242806, -0.6593754, 1, 1, 1, 1, 1,
0.301993, 0.02867635, -0.1168019, 1, 1, 1, 1, 1,
0.3028004, 0.8947172, -0.1989835, 1, 1, 1, 1, 1,
0.3032767, -0.9002302, 2.948809, 1, 1, 1, 1, 1,
0.3069946, -0.9193332, 3.816369, 1, 1, 1, 1, 1,
0.310137, 1.57912, -0.4307384, 1, 1, 1, 1, 1,
0.3106297, 1.357176, -0.1242118, 1, 1, 1, 1, 1,
0.3119432, -0.2611447, 3.935914, 1, 1, 1, 1, 1,
0.316626, 0.4222388, 0.5420238, 1, 1, 1, 1, 1,
0.317188, -0.4381561, 2.069951, 1, 1, 1, 1, 1,
0.3225668, 2.003316, -0.7155191, 0, 0, 1, 1, 1,
0.3265755, -0.1155484, 1.869869, 1, 0, 0, 1, 1,
0.3267201, -0.4232494, 2.782691, 1, 0, 0, 1, 1,
0.330995, -0.3096411, 4.466158, 1, 0, 0, 1, 1,
0.3311085, 2.620456, -0.6552173, 1, 0, 0, 1, 1,
0.3425682, 0.8972789, 1.166208, 1, 0, 0, 1, 1,
0.3427279, -0.9873737, 2.926113, 0, 0, 0, 1, 1,
0.3428534, -0.31319, 2.167811, 0, 0, 0, 1, 1,
0.346999, 0.1299403, 0.2892787, 0, 0, 0, 1, 1,
0.3498497, 0.01266238, 2.803117, 0, 0, 0, 1, 1,
0.3500248, 0.8789232, 0.5151018, 0, 0, 0, 1, 1,
0.3583333, 0.01444867, 2.331628, 0, 0, 0, 1, 1,
0.3591278, -2.290069, 3.417703, 0, 0, 0, 1, 1,
0.3591787, 0.79649, -0.1551559, 1, 1, 1, 1, 1,
0.3623725, -0.7170101, 3.585314, 1, 1, 1, 1, 1,
0.3641103, 0.09757101, 0.6792341, 1, 1, 1, 1, 1,
0.3644635, 0.4323398, 1.163669, 1, 1, 1, 1, 1,
0.3660738, -0.3885765, 2.165682, 1, 1, 1, 1, 1,
0.3706308, 2.055655, 0.7033366, 1, 1, 1, 1, 1,
0.3749404, -0.5544097, 1.706148, 1, 1, 1, 1, 1,
0.3770019, -0.1469886, 0.5066025, 1, 1, 1, 1, 1,
0.3792053, -1.599454, 0.8622424, 1, 1, 1, 1, 1,
0.3828847, 0.4203455, -0.04861497, 1, 1, 1, 1, 1,
0.3835029, -0.8685733, 2.128808, 1, 1, 1, 1, 1,
0.3836149, 0.5200145, 2.019812, 1, 1, 1, 1, 1,
0.3846306, 1.327488, -0.4935707, 1, 1, 1, 1, 1,
0.3851108, 0.02467767, 1.225483, 1, 1, 1, 1, 1,
0.3852319, 0.6401825, -0.1706877, 1, 1, 1, 1, 1,
0.3876027, 0.308504, 1.287693, 0, 0, 1, 1, 1,
0.3938628, -0.5210972, 2.838891, 1, 0, 0, 1, 1,
0.3941101, -0.08553335, 4.561084, 1, 0, 0, 1, 1,
0.3972878, 0.4723236, 1.561548, 1, 0, 0, 1, 1,
0.3983755, -0.466453, 3.917152, 1, 0, 0, 1, 1,
0.3985613, 0.4368227, 0.553566, 1, 0, 0, 1, 1,
0.3992596, 0.4630558, 0.3104477, 0, 0, 0, 1, 1,
0.3998636, -0.1595062, 1.270007, 0, 0, 0, 1, 1,
0.4054196, 0.845471, 0.2065939, 0, 0, 0, 1, 1,
0.4158243, 0.8730007, -2.960336, 0, 0, 0, 1, 1,
0.4181387, 0.109845, 2.073967, 0, 0, 0, 1, 1,
0.4225317, 1.499963, 1.428452, 0, 0, 0, 1, 1,
0.4240736, 1.729091, 1.11998, 0, 0, 0, 1, 1,
0.425218, 0.2254864, 1.765413, 1, 1, 1, 1, 1,
0.4290106, 0.4220573, 0.9346878, 1, 1, 1, 1, 1,
0.4292183, 1.000256, 2.02667, 1, 1, 1, 1, 1,
0.4307833, 0.2866317, 2.486078, 1, 1, 1, 1, 1,
0.4353732, 0.8553385, -0.9629974, 1, 1, 1, 1, 1,
0.4391404, 0.2929673, 2.311071, 1, 1, 1, 1, 1,
0.4397004, 0.2198761, 1.405765, 1, 1, 1, 1, 1,
0.4409477, 0.2174667, 0.01522193, 1, 1, 1, 1, 1,
0.4410402, -0.5940326, 2.896399, 1, 1, 1, 1, 1,
0.4419326, -1.360842, 4.085482, 1, 1, 1, 1, 1,
0.4422616, -0.2237954, 2.338011, 1, 1, 1, 1, 1,
0.4431661, 0.5538681, 1.566949, 1, 1, 1, 1, 1,
0.4448428, -0.2601518, 4.10324, 1, 1, 1, 1, 1,
0.4477372, 0.3821965, 0.3642996, 1, 1, 1, 1, 1,
0.44939, 0.821577, 1.214785, 1, 1, 1, 1, 1,
0.4498636, 0.04916225, 0.5762617, 0, 0, 1, 1, 1,
0.4524913, 2.477353, -1.203139, 1, 0, 0, 1, 1,
0.4573207, 0.8713741, 0.3871284, 1, 0, 0, 1, 1,
0.4599694, 0.5793239, 0.8348457, 1, 0, 0, 1, 1,
0.4612378, 0.4968714, -1.107131, 1, 0, 0, 1, 1,
0.4614379, -1.167767, 2.366977, 1, 0, 0, 1, 1,
0.4714999, -0.9286453, 2.682559, 0, 0, 0, 1, 1,
0.4717838, 0.7027669, 0.3128057, 0, 0, 0, 1, 1,
0.4746398, -1.068452, 2.259349, 0, 0, 0, 1, 1,
0.4767626, 0.8809582, 1.734887, 0, 0, 0, 1, 1,
0.47852, -2.16438, 2.88041, 0, 0, 0, 1, 1,
0.4899856, 0.2124412, 2.731577, 0, 0, 0, 1, 1,
0.4908063, 0.5987002, -0.1542196, 0, 0, 0, 1, 1,
0.4914726, -0.8260977, 3.433362, 1, 1, 1, 1, 1,
0.4918082, 1.742841, 0.7204163, 1, 1, 1, 1, 1,
0.4990917, -0.6664901, 2.971565, 1, 1, 1, 1, 1,
0.5008676, 0.3557362, 0.6797229, 1, 1, 1, 1, 1,
0.5046033, 0.2036307, 1.091525, 1, 1, 1, 1, 1,
0.5060442, -0.3632092, 1.902868, 1, 1, 1, 1, 1,
0.5062574, 2.062516, 2.732662, 1, 1, 1, 1, 1,
0.5068234, 0.3708612, 2.520387, 1, 1, 1, 1, 1,
0.5118142, -0.9640943, 3.134418, 1, 1, 1, 1, 1,
0.5149063, 0.8220931, 0.1914838, 1, 1, 1, 1, 1,
0.5236918, -0.6398941, 3.242236, 1, 1, 1, 1, 1,
0.524057, 1.77528, 0.3046359, 1, 1, 1, 1, 1,
0.5245095, 0.3935487, -0.8150038, 1, 1, 1, 1, 1,
0.5299187, 0.3552929, 0.8965539, 1, 1, 1, 1, 1,
0.5377579, -0.6604506, 2.240007, 1, 1, 1, 1, 1,
0.5406586, -0.5863128, 2.347898, 0, 0, 1, 1, 1,
0.5414495, -1.376739, 0.7288151, 1, 0, 0, 1, 1,
0.54498, -0.1764409, 2.71767, 1, 0, 0, 1, 1,
0.5592112, 0.145874, 2.955413, 1, 0, 0, 1, 1,
0.5634238, 0.3792543, 0.02269834, 1, 0, 0, 1, 1,
0.5731598, -1.357906, 3.402563, 1, 0, 0, 1, 1,
0.5760655, 1.735719, 0.2861415, 0, 0, 0, 1, 1,
0.5762647, -0.8816005, 1.451854, 0, 0, 0, 1, 1,
0.576326, -1.525028, 3.114038, 0, 0, 0, 1, 1,
0.5829166, -0.4433343, 2.390867, 0, 0, 0, 1, 1,
0.5829349, -1.339274, 4.377501, 0, 0, 0, 1, 1,
0.5838684, -0.7098184, 0.3948328, 0, 0, 0, 1, 1,
0.5896631, -2.204858, 3.774378, 0, 0, 0, 1, 1,
0.5945735, 0.1564107, -0.3775465, 1, 1, 1, 1, 1,
0.5979952, -0.282362, 2.290435, 1, 1, 1, 1, 1,
0.5997141, -1.036307, 2.191437, 1, 1, 1, 1, 1,
0.6004989, 2.40801, -0.4065355, 1, 1, 1, 1, 1,
0.6015876, 0.1630835, 0.05511452, 1, 1, 1, 1, 1,
0.6051478, 0.956655, 2.429989, 1, 1, 1, 1, 1,
0.6088293, -1.160656, 2.269907, 1, 1, 1, 1, 1,
0.6100341, -0.6337203, 2.145152, 1, 1, 1, 1, 1,
0.6113847, 0.3213615, -0.3021024, 1, 1, 1, 1, 1,
0.6114555, 0.8004923, 0.8199385, 1, 1, 1, 1, 1,
0.6148912, 0.1226079, 1.800844, 1, 1, 1, 1, 1,
0.6173923, 0.2777156, 0.5628842, 1, 1, 1, 1, 1,
0.6208191, -1.192725, 3.309811, 1, 1, 1, 1, 1,
0.6224731, -1.102425, 2.697293, 1, 1, 1, 1, 1,
0.625548, -0.2584916, 1.940047, 1, 1, 1, 1, 1,
0.630514, 1.533696, 0.976859, 0, 0, 1, 1, 1,
0.6307042, -1.706341, 2.25182, 1, 0, 0, 1, 1,
0.6307551, 1.214191, 0.7256683, 1, 0, 0, 1, 1,
0.63372, -1.51537, 3.445534, 1, 0, 0, 1, 1,
0.6340389, -0.6857145, 3.230009, 1, 0, 0, 1, 1,
0.6362501, 0.1698975, -0.3321129, 1, 0, 0, 1, 1,
0.6363568, 0.5245025, 1.075571, 0, 0, 0, 1, 1,
0.6375275, -0.9710134, 1.545884, 0, 0, 0, 1, 1,
0.6381552, -1.07163, 4.926081, 0, 0, 0, 1, 1,
0.6384701, 0.1440596, 1.668539, 0, 0, 0, 1, 1,
0.6393892, -1.019454, 2.591218, 0, 0, 0, 1, 1,
0.6394676, 0.01725567, -0.0504149, 0, 0, 0, 1, 1,
0.6494069, 0.6972302, 1.331002, 0, 0, 0, 1, 1,
0.653584, 0.7319468, -0.387476, 1, 1, 1, 1, 1,
0.6564312, -0.8316278, 1.957408, 1, 1, 1, 1, 1,
0.6621053, 0.3912885, 2.130739, 1, 1, 1, 1, 1,
0.6671227, 0.829028, 0.5544713, 1, 1, 1, 1, 1,
0.6713055, 0.07787066, 0.1932039, 1, 1, 1, 1, 1,
0.6753213, -0.6028226, 2.384953, 1, 1, 1, 1, 1,
0.6754707, 0.5519667, 0.7234204, 1, 1, 1, 1, 1,
0.6777605, 1.852884, 1.556829, 1, 1, 1, 1, 1,
0.6779473, -0.4768252, 1.153057, 1, 1, 1, 1, 1,
0.6784354, 1.515985, 0.6350987, 1, 1, 1, 1, 1,
0.6788129, -0.9674008, 2.802584, 1, 1, 1, 1, 1,
0.679133, 0.4134367, 1.884287, 1, 1, 1, 1, 1,
0.6797557, -0.793995, 4.432159, 1, 1, 1, 1, 1,
0.6892306, -0.7323927, 2.561817, 1, 1, 1, 1, 1,
0.6892826, 0.8758869, -0.8821406, 1, 1, 1, 1, 1,
0.7007122, -0.791205, 1.211528, 0, 0, 1, 1, 1,
0.7014123, -1.114231, 2.606401, 1, 0, 0, 1, 1,
0.7051527, 1.081099, 1.487102, 1, 0, 0, 1, 1,
0.7058984, 0.3727508, 2.33228, 1, 0, 0, 1, 1,
0.7060193, 1.102716, 0.4476859, 1, 0, 0, 1, 1,
0.709313, 0.4738395, 1.987365, 1, 0, 0, 1, 1,
0.7116662, 1.080303, 0.1749234, 0, 0, 0, 1, 1,
0.7130867, -0.8457348, 3.030235, 0, 0, 0, 1, 1,
0.7229722, -0.7689094, 2.46217, 0, 0, 0, 1, 1,
0.7357955, 0.563678, 0.7878298, 0, 0, 0, 1, 1,
0.7359005, -0.1090862, 1.608153, 0, 0, 0, 1, 1,
0.7399363, -1.51563, 1.354459, 0, 0, 0, 1, 1,
0.7407552, -0.8685482, 2.726055, 0, 0, 0, 1, 1,
0.742395, 0.9423053, -0.8082131, 1, 1, 1, 1, 1,
0.7428833, -0.6279378, 1.576299, 1, 1, 1, 1, 1,
0.7440921, -1.82263, 3.912763, 1, 1, 1, 1, 1,
0.7454423, -0.7024839, 1.562925, 1, 1, 1, 1, 1,
0.7526419, 0.4444133, 1.601741, 1, 1, 1, 1, 1,
0.7546658, -0.123711, 0.993296, 1, 1, 1, 1, 1,
0.7564654, -0.123939, 2.14115, 1, 1, 1, 1, 1,
0.7624815, 0.3957381, 1.152528, 1, 1, 1, 1, 1,
0.7651482, 0.1612838, 1.854219, 1, 1, 1, 1, 1,
0.7667502, -0.449002, 2.164031, 1, 1, 1, 1, 1,
0.7686212, 0.510524, 3.618403, 1, 1, 1, 1, 1,
0.7717867, -1.190827, 3.402867, 1, 1, 1, 1, 1,
0.7764932, 0.2993831, 0.9152702, 1, 1, 1, 1, 1,
0.7778012, 0.4413462, -0.1861151, 1, 1, 1, 1, 1,
0.7786217, 1.225075, 2.127522, 1, 1, 1, 1, 1,
0.7869946, -1.130785, 2.628405, 0, 0, 1, 1, 1,
0.7938384, 1.035123, 0.4977758, 1, 0, 0, 1, 1,
0.7968052, 1.903694, 0.4985248, 1, 0, 0, 1, 1,
0.7974688, -0.03726256, 2.683966, 1, 0, 0, 1, 1,
0.8033029, 0.6849714, 1.035932, 1, 0, 0, 1, 1,
0.8083726, 0.6123801, 1.367312, 1, 0, 0, 1, 1,
0.8086114, -0.820744, 2.648313, 0, 0, 0, 1, 1,
0.8225181, 0.9106292, 0.7470046, 0, 0, 0, 1, 1,
0.8243709, 0.03927558, 1.727831, 0, 0, 0, 1, 1,
0.8264826, 0.1252287, 0.6472942, 0, 0, 0, 1, 1,
0.833275, -0.460743, 2.4206, 0, 0, 0, 1, 1,
0.8335618, -1.17824, 2.249656, 0, 0, 0, 1, 1,
0.8352967, -0.1024947, 0.7920123, 0, 0, 0, 1, 1,
0.8420757, 1.573009, 1.072661, 1, 1, 1, 1, 1,
0.8461545, -1.124251, 4.314046, 1, 1, 1, 1, 1,
0.8518541, 1.324476, 0.1830936, 1, 1, 1, 1, 1,
0.8565211, -0.4223982, 2.639764, 1, 1, 1, 1, 1,
0.8580229, 1.773853, 0.553629, 1, 1, 1, 1, 1,
0.8591365, -0.689453, 0.8854383, 1, 1, 1, 1, 1,
0.8606099, -0.1216446, 0.8605492, 1, 1, 1, 1, 1,
0.860938, -0.5776357, 2.881689, 1, 1, 1, 1, 1,
0.8614949, -0.65705, 3.26538, 1, 1, 1, 1, 1,
0.8623562, 1.792738, 0.73907, 1, 1, 1, 1, 1,
0.8628443, 2.063916, -0.9003965, 1, 1, 1, 1, 1,
0.8670335, -0.8529872, 1.089494, 1, 1, 1, 1, 1,
0.8676504, -0.6011012, 2.564871, 1, 1, 1, 1, 1,
0.8751618, 1.15406, 0.203343, 1, 1, 1, 1, 1,
0.8791443, -0.4725308, 2.064896, 1, 1, 1, 1, 1,
0.8803033, 0.7052568, 1.703853, 0, 0, 1, 1, 1,
0.8826317, 0.1465591, 2.455072, 1, 0, 0, 1, 1,
0.8886967, -0.2468779, 2.540393, 1, 0, 0, 1, 1,
0.8910272, -0.9939915, 3.221743, 1, 0, 0, 1, 1,
0.8957531, 2.003967, -1.052713, 1, 0, 0, 1, 1,
0.8971432, 0.08208512, 2.446538, 1, 0, 0, 1, 1,
0.8975298, -0.6961142, 2.059379, 0, 0, 0, 1, 1,
0.8977701, 1.136987, 1.331353, 0, 0, 0, 1, 1,
0.8981125, 0.9804991, 0.7760397, 0, 0, 0, 1, 1,
0.9037915, -0.5114992, 1.444468, 0, 0, 0, 1, 1,
0.9076892, 0.7133574, 1.884405, 0, 0, 0, 1, 1,
0.9081163, -0.2046005, 3.003865, 0, 0, 0, 1, 1,
0.9096932, -0.7468064, 4.071608, 0, 0, 0, 1, 1,
0.9196329, -0.1697973, 1.600701, 1, 1, 1, 1, 1,
0.922226, -2.055689, 1.93907, 1, 1, 1, 1, 1,
0.9245859, -0.2060678, 2.206652, 1, 1, 1, 1, 1,
0.9248853, -0.06442309, 1.554133, 1, 1, 1, 1, 1,
0.9364932, -1.142391, 2.338001, 1, 1, 1, 1, 1,
0.9510666, 0.6385518, 0.1241862, 1, 1, 1, 1, 1,
0.953491, 0.4768083, 3.215858, 1, 1, 1, 1, 1,
0.9549198, 0.1622976, 2.140308, 1, 1, 1, 1, 1,
0.9589504, -1.826701, 3.224692, 1, 1, 1, 1, 1,
0.9627095, 0.6567314, 1.466729, 1, 1, 1, 1, 1,
0.9652541, -0.7043583, 2.606666, 1, 1, 1, 1, 1,
0.9716399, -0.3974335, 4.001932, 1, 1, 1, 1, 1,
0.9862329, 0.7191684, 0.177471, 1, 1, 1, 1, 1,
0.9874139, 1.047894, 2.269894, 1, 1, 1, 1, 1,
0.9904044, 0.5268775, 1.770424, 1, 1, 1, 1, 1,
1.0178, -0.8288248, 4.253978, 0, 0, 1, 1, 1,
1.019422, 1.425498, -0.03247803, 1, 0, 0, 1, 1,
1.02187, -0.169498, 2.720809, 1, 0, 0, 1, 1,
1.025222, -0.2353565, 2.133054, 1, 0, 0, 1, 1,
1.044423, -0.2213308, 2.880507, 1, 0, 0, 1, 1,
1.046794, -1.34337, 3.300418, 1, 0, 0, 1, 1,
1.047536, -1.621881, 1.109328, 0, 0, 0, 1, 1,
1.048304, 0.06722424, 1.785777, 0, 0, 0, 1, 1,
1.061312, 0.9671268, 0.6492106, 0, 0, 0, 1, 1,
1.08663, -0.5939295, 2.555454, 0, 0, 0, 1, 1,
1.087907, -0.176679, 1.133689, 0, 0, 0, 1, 1,
1.088884, -0.1214385, 1.809152, 0, 0, 0, 1, 1,
1.094714, -0.6449754, 2.770092, 0, 0, 0, 1, 1,
1.096725, 1.011487, 0.02369076, 1, 1, 1, 1, 1,
1.105007, 1.92144, 1.213934, 1, 1, 1, 1, 1,
1.116103, 0.2484387, 2.409266, 1, 1, 1, 1, 1,
1.117393, 0.2871614, 0.3439012, 1, 1, 1, 1, 1,
1.117425, -0.4244597, 1.874233, 1, 1, 1, 1, 1,
1.126186, 0.552143, 0.4888236, 1, 1, 1, 1, 1,
1.129483, -0.9865492, 0.9668952, 1, 1, 1, 1, 1,
1.132389, -1.114964, 3.306888, 1, 1, 1, 1, 1,
1.146593, -0.03114804, 2.519256, 1, 1, 1, 1, 1,
1.152575, -0.2482299, 1.420442, 1, 1, 1, 1, 1,
1.153559, 0.5792151, 1.250982, 1, 1, 1, 1, 1,
1.168791, 1.22146, 0.9465955, 1, 1, 1, 1, 1,
1.170206, 0.1846612, 1.123719, 1, 1, 1, 1, 1,
1.17025, -0.08521397, 2.044809, 1, 1, 1, 1, 1,
1.179228, -0.1237778, 0.3565362, 1, 1, 1, 1, 1,
1.186867, 0.03381164, 2.405982, 0, 0, 1, 1, 1,
1.189517, 0.5742324, -0.08287144, 1, 0, 0, 1, 1,
1.190355, -0.6481484, 1.002467, 1, 0, 0, 1, 1,
1.196644, 1.338013, -1.563148, 1, 0, 0, 1, 1,
1.197855, -1.894236, 4.721893, 1, 0, 0, 1, 1,
1.2082, -0.1729181, 1.931383, 1, 0, 0, 1, 1,
1.216144, -0.7828039, 2.002432, 0, 0, 0, 1, 1,
1.216446, -1.335112, 2.465907, 0, 0, 0, 1, 1,
1.219595, 0.1861673, -1.462656, 0, 0, 0, 1, 1,
1.223533, -0.7267023, 2.815956, 0, 0, 0, 1, 1,
1.231064, 1.147969, 0.5323268, 0, 0, 0, 1, 1,
1.235948, 0.6243972, 1.119409, 0, 0, 0, 1, 1,
1.239991, -0.7889225, 0.8529126, 0, 0, 0, 1, 1,
1.246778, -0.853878, 2.212546, 1, 1, 1, 1, 1,
1.250044, 1.322964, 1.694417, 1, 1, 1, 1, 1,
1.252892, 1.172923, 0.04534998, 1, 1, 1, 1, 1,
1.255216, 0.8177076, 0.1013202, 1, 1, 1, 1, 1,
1.25537, -1.811011, 2.336546, 1, 1, 1, 1, 1,
1.257855, -1.722047, 4.500261, 1, 1, 1, 1, 1,
1.258397, -0.1619432, 0.9992389, 1, 1, 1, 1, 1,
1.276789, 0.1501643, 0.166359, 1, 1, 1, 1, 1,
1.281506, -1.040709, 1.932252, 1, 1, 1, 1, 1,
1.282864, -1.440674, 2.880795, 1, 1, 1, 1, 1,
1.283014, -0.6811754, 3.929256, 1, 1, 1, 1, 1,
1.290002, 1.639215, 0.2626733, 1, 1, 1, 1, 1,
1.291082, 1.655244, 0.3671055, 1, 1, 1, 1, 1,
1.292833, -1.330541, 2.087385, 1, 1, 1, 1, 1,
1.300113, 0.531778, 1.051175, 1, 1, 1, 1, 1,
1.309309, 0.4355007, 2.365729, 0, 0, 1, 1, 1,
1.321558, -0.8631025, 2.118116, 1, 0, 0, 1, 1,
1.323005, -0.09092239, 2.187174, 1, 0, 0, 1, 1,
1.329274, -2.004448, 1.869662, 1, 0, 0, 1, 1,
1.337143, -0.3075812, 0.5991548, 1, 0, 0, 1, 1,
1.343689, -0.4165225, 1.6296, 1, 0, 0, 1, 1,
1.358016, 0.3960355, 0.8700398, 0, 0, 0, 1, 1,
1.359092, -1.337954, 0.4047368, 0, 0, 0, 1, 1,
1.359245, 0.5533431, 2.486686, 0, 0, 0, 1, 1,
1.360349, -1.797246, 2.177394, 0, 0, 0, 1, 1,
1.361172, -0.02804031, 0.8407788, 0, 0, 0, 1, 1,
1.36304, 0.6888547, 0.03206354, 0, 0, 0, 1, 1,
1.370266, -0.9989134, 1.885322, 0, 0, 0, 1, 1,
1.375147, -0.395903, 1.995296, 1, 1, 1, 1, 1,
1.381125, -0.3092491, 1.454292, 1, 1, 1, 1, 1,
1.388735, -0.19672, 2.172697, 1, 1, 1, 1, 1,
1.391843, -0.888023, 2.855966, 1, 1, 1, 1, 1,
1.399283, 0.5687844, 1.449937, 1, 1, 1, 1, 1,
1.408529, -0.8639042, 2.43192, 1, 1, 1, 1, 1,
1.409666, -0.5726641, 3.176523, 1, 1, 1, 1, 1,
1.411232, 0.5743131, 0.02530844, 1, 1, 1, 1, 1,
1.415462, 0.7018656, -0.4926301, 1, 1, 1, 1, 1,
1.426207, 1.027269, -0.7671705, 1, 1, 1, 1, 1,
1.427532, 1.130263, -0.1998211, 1, 1, 1, 1, 1,
1.429329, 0.7817903, 0.5077581, 1, 1, 1, 1, 1,
1.430728, -0.8310294, 3.017987, 1, 1, 1, 1, 1,
1.43359, -2.483466, 1.931864, 1, 1, 1, 1, 1,
1.450353, -0.09194781, 2.666664, 1, 1, 1, 1, 1,
1.457449, 1.207865, 2.28598, 0, 0, 1, 1, 1,
1.472448, -1.682366, 2.878522, 1, 0, 0, 1, 1,
1.493216, 1.047912, 1.726065, 1, 0, 0, 1, 1,
1.50697, -0.3933691, 1.884873, 1, 0, 0, 1, 1,
1.513641, -0.2635555, 1.571104, 1, 0, 0, 1, 1,
1.52775, 1.614932, -0.1541894, 1, 0, 0, 1, 1,
1.529604, -0.3596987, 3.392088, 0, 0, 0, 1, 1,
1.537417, 0.2958707, 2.718548, 0, 0, 0, 1, 1,
1.547566, -0.8936456, 0.4463369, 0, 0, 0, 1, 1,
1.561724, -0.6995783, 4.440682, 0, 0, 0, 1, 1,
1.564433, -0.4409141, 0.9362543, 0, 0, 0, 1, 1,
1.56635, 0.3348916, -0.2828989, 0, 0, 0, 1, 1,
1.573067, -0.5143251, 3.38405, 0, 0, 0, 1, 1,
1.574249, -0.08166631, 2.399459, 1, 1, 1, 1, 1,
1.57647, 1.019099, 1.071534, 1, 1, 1, 1, 1,
1.578529, -0.2599179, 1.114703, 1, 1, 1, 1, 1,
1.580102, -0.6965636, 2.344752, 1, 1, 1, 1, 1,
1.587947, 0.9657338, 1.264108, 1, 1, 1, 1, 1,
1.599045, -0.4617494, 2.810277, 1, 1, 1, 1, 1,
1.601762, 0.669277, 1.300717, 1, 1, 1, 1, 1,
1.606094, 1.367803, 0.1481818, 1, 1, 1, 1, 1,
1.643389, 0.6642845, 2.953228, 1, 1, 1, 1, 1,
1.648448, -0.2698789, 2.193273, 1, 1, 1, 1, 1,
1.651925, -0.4339247, 1.361592, 1, 1, 1, 1, 1,
1.654881, -0.9471589, 1.681728, 1, 1, 1, 1, 1,
1.663026, 0.1766611, 3.032713, 1, 1, 1, 1, 1,
1.66947, -0.9394879, 2.631374, 1, 1, 1, 1, 1,
1.673732, 0.1863842, -0.5739475, 1, 1, 1, 1, 1,
1.677069, -0.6540661, 2.28723, 0, 0, 1, 1, 1,
1.683324, 0.1924073, -0.775071, 1, 0, 0, 1, 1,
1.693483, -0.5777678, 1.310587, 1, 0, 0, 1, 1,
1.697143, 0.5890906, 1.958543, 1, 0, 0, 1, 1,
1.708848, -1.151848, 1.240546, 1, 0, 0, 1, 1,
1.714647, -0.7266374, 1.639544, 1, 0, 0, 1, 1,
1.748116, 0.1019413, 1.449137, 0, 0, 0, 1, 1,
1.754158, 0.02091136, 3.178887, 0, 0, 0, 1, 1,
1.754587, 1.140166, 2.397587, 0, 0, 0, 1, 1,
1.755282, -0.2045861, 1.569708, 0, 0, 0, 1, 1,
1.780168, -0.5076987, 2.011574, 0, 0, 0, 1, 1,
1.788387, -1.075502, 2.334991, 0, 0, 0, 1, 1,
1.802866, 0.7430712, -0.6106569, 0, 0, 0, 1, 1,
1.812979, -1.245104, -0.3286835, 1, 1, 1, 1, 1,
1.814419, 0.152105, 1.595275, 1, 1, 1, 1, 1,
1.821679, 0.6400477, 0.5407293, 1, 1, 1, 1, 1,
1.849546, 1.20996, 0.6157595, 1, 1, 1, 1, 1,
1.8498, -0.6358414, 2.356082, 1, 1, 1, 1, 1,
1.880729, -0.4250848, 2.675495, 1, 1, 1, 1, 1,
1.92864, -0.61258, 1.031018, 1, 1, 1, 1, 1,
1.94327, 0.2799429, 1.832376, 1, 1, 1, 1, 1,
1.945085, 0.221778, 2.475095, 1, 1, 1, 1, 1,
1.961249, -0.7107415, 3.090044, 1, 1, 1, 1, 1,
1.962276, 0.7371335, 1.13288, 1, 1, 1, 1, 1,
1.976591, 0.3177255, 2.660703, 1, 1, 1, 1, 1,
1.979082, -2.815084, 1.9676, 1, 1, 1, 1, 1,
1.999825, 0.560322, -0.2409946, 1, 1, 1, 1, 1,
2.003017, -1.292446, 1.704012, 1, 1, 1, 1, 1,
2.040514, -0.7313292, 1.741982, 0, 0, 1, 1, 1,
2.048441, 0.9044098, 1.558524, 1, 0, 0, 1, 1,
2.074314, 0.5077005, 1.092836, 1, 0, 0, 1, 1,
2.080208, -1.155456, 0.3008408, 1, 0, 0, 1, 1,
2.099102, -0.357435, 2.082461, 1, 0, 0, 1, 1,
2.102417, 0.5789132, 2.8325, 1, 0, 0, 1, 1,
2.134362, -2.031966, 1.848643, 0, 0, 0, 1, 1,
2.136446, 2.197637, 0.5000739, 0, 0, 0, 1, 1,
2.208551, -1.69347, 2.153333, 0, 0, 0, 1, 1,
2.222285, -2.878667, 1.43911, 0, 0, 0, 1, 1,
2.238096, -0.7224664, 1.417974, 0, 0, 0, 1, 1,
2.248047, -0.1512976, 2.186467, 0, 0, 0, 1, 1,
2.29465, 1.100341, 0.9875514, 0, 0, 0, 1, 1,
2.329883, 0.1661238, 2.716782, 1, 1, 1, 1, 1,
2.337163, -0.4149143, 0.4822142, 1, 1, 1, 1, 1,
2.38982, 0.6327655, 0.638154, 1, 1, 1, 1, 1,
2.549914, 1.382055, 0.4378293, 1, 1, 1, 1, 1,
2.595684, 1.118222, 0.6842118, 1, 1, 1, 1, 1,
2.776303, -0.911471, -0.08380678, 1, 1, 1, 1, 1,
3.130755, -3.424946, 1.413431, 1, 1, 1, 1, 1
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
var radius = 9.481224;
var distance = 33.30239;
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
mvMatrix.translate( 0.3077276, 0.1702561, 0.1017308 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30239);
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
