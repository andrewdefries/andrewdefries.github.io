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
-3.387922, -0.8723338, -0.6767606, 1, 0, 0, 1,
-3.36309, -1.578298, -2.505667, 1, 0.007843138, 0, 1,
-3.311475, 0.8531587, -0.8404288, 1, 0.01176471, 0, 1,
-3.15878, 1.857123, -2.606929, 1, 0.01960784, 0, 1,
-2.906519, 0.1301335, -1.967022, 1, 0.02352941, 0, 1,
-2.782547, 0.7129449, 0.1430663, 1, 0.03137255, 0, 1,
-2.762727, 0.4426062, 0.2117154, 1, 0.03529412, 0, 1,
-2.618385, -0.07613166, -2.03463, 1, 0.04313726, 0, 1,
-2.600178, 0.2094865, -2.399022, 1, 0.04705882, 0, 1,
-2.357118, -0.131637, -2.416321, 1, 0.05490196, 0, 1,
-2.249779, 0.4934801, 0.06298737, 1, 0.05882353, 0, 1,
-2.245421, 0.450391, -3.25894, 1, 0.06666667, 0, 1,
-2.206505, 0.0158101, -0.6001391, 1, 0.07058824, 0, 1,
-2.166022, -0.8190924, -1.312761, 1, 0.07843138, 0, 1,
-2.133538, -1.242163, -2.939102, 1, 0.08235294, 0, 1,
-2.110288, 0.1979836, -0.8802991, 1, 0.09019608, 0, 1,
-2.109854, 0.3637675, -2.755021, 1, 0.09411765, 0, 1,
-2.094792, 0.9491938, -1.728174, 1, 0.1019608, 0, 1,
-2.039666, 1.980726, -2.144129, 1, 0.1098039, 0, 1,
-2.005132, -0.6806741, -1.091762, 1, 0.1137255, 0, 1,
-1.997698, -1.052602, -3.716384, 1, 0.1215686, 0, 1,
-1.98928, 0.5368201, 0.3277349, 1, 0.1254902, 0, 1,
-1.977826, -0.3523152, -2.7485, 1, 0.1333333, 0, 1,
-1.957209, -0.3805611, -1.768453, 1, 0.1372549, 0, 1,
-1.948565, 0.9829249, -3.014306, 1, 0.145098, 0, 1,
-1.925399, 0.8831912, -1.242182, 1, 0.1490196, 0, 1,
-1.892828, 1.687838, -2.05864, 1, 0.1568628, 0, 1,
-1.887618, -2.134007, -3.265101, 1, 0.1607843, 0, 1,
-1.885838, 1.284183, -0.5451753, 1, 0.1686275, 0, 1,
-1.873263, 1.095574, -0.8817073, 1, 0.172549, 0, 1,
-1.872389, -0.3338997, -0.9230632, 1, 0.1803922, 0, 1,
-1.871582, 1.173301, -2.601909, 1, 0.1843137, 0, 1,
-1.86211, 1.487508, -3.057229, 1, 0.1921569, 0, 1,
-1.854004, 1.124233, -2.353441, 1, 0.1960784, 0, 1,
-1.843317, -0.02014036, -1.412844, 1, 0.2039216, 0, 1,
-1.841105, 1.041714, -2.080616, 1, 0.2117647, 0, 1,
-1.839251, -0.8986267, -2.502526, 1, 0.2156863, 0, 1,
-1.831737, 0.4064475, -0.1546842, 1, 0.2235294, 0, 1,
-1.824166, 0.3450188, -1.907035, 1, 0.227451, 0, 1,
-1.761733, 0.1757652, -1.74575, 1, 0.2352941, 0, 1,
-1.760379, 0.5549539, -1.796273, 1, 0.2392157, 0, 1,
-1.755896, -0.5419018, -2.443092, 1, 0.2470588, 0, 1,
-1.722763, 0.3157885, -1.955228, 1, 0.2509804, 0, 1,
-1.693547, 0.9852211, -1.561252, 1, 0.2588235, 0, 1,
-1.677081, 0.5802646, -3.135837, 1, 0.2627451, 0, 1,
-1.674371, 1.132904, -0.03882395, 1, 0.2705882, 0, 1,
-1.666468, -0.3986993, -2.227436, 1, 0.2745098, 0, 1,
-1.660537, -0.19144, -2.582925, 1, 0.282353, 0, 1,
-1.654183, 0.6587047, -2.087088, 1, 0.2862745, 0, 1,
-1.652924, -0.1476876, -2.329118, 1, 0.2941177, 0, 1,
-1.642059, -0.6952618, -1.228207, 1, 0.3019608, 0, 1,
-1.63698, 0.871436, -1.987541, 1, 0.3058824, 0, 1,
-1.632124, -0.3232957, -0.814888, 1, 0.3137255, 0, 1,
-1.631221, 0.2205795, -0.04747623, 1, 0.3176471, 0, 1,
-1.625518, 0.849898, -1.121714, 1, 0.3254902, 0, 1,
-1.625253, 0.5424899, -1.103148, 1, 0.3294118, 0, 1,
-1.617557, -0.5653669, -0.7905793, 1, 0.3372549, 0, 1,
-1.615193, -1.09878, -3.050686, 1, 0.3411765, 0, 1,
-1.614548, 0.4102072, -1.718224, 1, 0.3490196, 0, 1,
-1.603449, 0.5505083, -0.4129027, 1, 0.3529412, 0, 1,
-1.599516, -0.3016801, -2.256735, 1, 0.3607843, 0, 1,
-1.55988, -0.6122374, -2.178725, 1, 0.3647059, 0, 1,
-1.558384, 1.192065, -1.657476, 1, 0.372549, 0, 1,
-1.533864, 0.4385834, 0.369929, 1, 0.3764706, 0, 1,
-1.514198, -0.5697698, -1.171239, 1, 0.3843137, 0, 1,
-1.512031, -0.5872384, 0.2651454, 1, 0.3882353, 0, 1,
-1.50447, -0.6157251, -1.152291, 1, 0.3960784, 0, 1,
-1.500677, -2.527361, -2.751647, 1, 0.4039216, 0, 1,
-1.498549, 0.0642533, -1.089928, 1, 0.4078431, 0, 1,
-1.496573, -0.03919322, -2.183335, 1, 0.4156863, 0, 1,
-1.492494, 1.183318, 1.076961, 1, 0.4196078, 0, 1,
-1.492331, 0.3062962, -1.077411, 1, 0.427451, 0, 1,
-1.488128, -1.49084, -1.93696, 1, 0.4313726, 0, 1,
-1.465167, 1.555022, 0.3796849, 1, 0.4392157, 0, 1,
-1.462436, -0.034245, -1.606978, 1, 0.4431373, 0, 1,
-1.461277, 2.525222, 0.07390147, 1, 0.4509804, 0, 1,
-1.45375, 0.23228, -2.482872, 1, 0.454902, 0, 1,
-1.440492, 1.615533, -1.349568, 1, 0.4627451, 0, 1,
-1.436231, 1.314583, -1.801105, 1, 0.4666667, 0, 1,
-1.43308, -1.284035, -0.3979524, 1, 0.4745098, 0, 1,
-1.420166, -1.491372, -0.4608661, 1, 0.4784314, 0, 1,
-1.417356, -0.007934803, -0.8132759, 1, 0.4862745, 0, 1,
-1.416998, 0.3429797, -2.076448, 1, 0.4901961, 0, 1,
-1.416479, 0.2019969, -0.5947129, 1, 0.4980392, 0, 1,
-1.414229, -1.200665, -2.653023, 1, 0.5058824, 0, 1,
-1.413088, -1.514313, -3.743716, 1, 0.509804, 0, 1,
-1.409347, -1.221854, -1.470415, 1, 0.5176471, 0, 1,
-1.408466, -0.2387898, -2.715817, 1, 0.5215687, 0, 1,
-1.407589, 0.945158, 0.3795889, 1, 0.5294118, 0, 1,
-1.404812, -1.885383, -2.427921, 1, 0.5333334, 0, 1,
-1.39704, -0.5570116, -1.467829, 1, 0.5411765, 0, 1,
-1.396187, -0.297031, -2.419242, 1, 0.5450981, 0, 1,
-1.395885, -0.6306495, -1.591639, 1, 0.5529412, 0, 1,
-1.394384, -0.07379914, -1.265923, 1, 0.5568628, 0, 1,
-1.3888, 0.3310192, -1.995212, 1, 0.5647059, 0, 1,
-1.387427, 0.09984065, -0.5670466, 1, 0.5686275, 0, 1,
-1.38646, 0.03809734, -0.8339542, 1, 0.5764706, 0, 1,
-1.385335, 1.111504, 0.6244295, 1, 0.5803922, 0, 1,
-1.383349, 0.07283138, -1.488967, 1, 0.5882353, 0, 1,
-1.379539, -1.144458, -2.611578, 1, 0.5921569, 0, 1,
-1.371843, 0.04111887, -1.202478, 1, 0.6, 0, 1,
-1.369958, 1.23756, -1.848574, 1, 0.6078432, 0, 1,
-1.358335, 0.4651592, 0.03752691, 1, 0.6117647, 0, 1,
-1.352576, 0.2835898, -0.3244321, 1, 0.6196079, 0, 1,
-1.348758, 1.049626, -1.343337, 1, 0.6235294, 0, 1,
-1.343025, 0.7046964, 0.5367537, 1, 0.6313726, 0, 1,
-1.335967, -1.157048, -2.352314, 1, 0.6352941, 0, 1,
-1.329562, 1.147808, -0.2491357, 1, 0.6431373, 0, 1,
-1.327969, 0.2370379, -2.032194, 1, 0.6470588, 0, 1,
-1.325304, 0.03919127, -2.429315, 1, 0.654902, 0, 1,
-1.321533, -0.4618514, -2.165135, 1, 0.6588235, 0, 1,
-1.313996, -0.7994021, -3.145664, 1, 0.6666667, 0, 1,
-1.310035, 0.3938771, -1.742354, 1, 0.6705883, 0, 1,
-1.307433, -0.6195026, -2.225688, 1, 0.6784314, 0, 1,
-1.305471, -0.0290171, -1.954641, 1, 0.682353, 0, 1,
-1.292375, 0.652151, -0.9659172, 1, 0.6901961, 0, 1,
-1.282257, 0.3969213, -2.026361, 1, 0.6941177, 0, 1,
-1.26876, 1.344998, -1.38409, 1, 0.7019608, 0, 1,
-1.261332, 1.42368, -0.2478083, 1, 0.7098039, 0, 1,
-1.260309, -0.1386286, -2.443347, 1, 0.7137255, 0, 1,
-1.256895, -1.372965, -2.661088, 1, 0.7215686, 0, 1,
-1.251664, 0.4936628, -2.479029, 1, 0.7254902, 0, 1,
-1.235236, 1.672661, -1.209434, 1, 0.7333333, 0, 1,
-1.222913, -0.2101102, -2.31169, 1, 0.7372549, 0, 1,
-1.221488, 1.338324, -1.277583, 1, 0.7450981, 0, 1,
-1.216807, 2.26861, -2.825471, 1, 0.7490196, 0, 1,
-1.214399, -1.269071, -3.545597, 1, 0.7568628, 0, 1,
-1.195989, 2.353003, 0.4909518, 1, 0.7607843, 0, 1,
-1.185807, -0.0817298, -2.295282, 1, 0.7686275, 0, 1,
-1.185031, -1.151994, -1.391363, 1, 0.772549, 0, 1,
-1.180557, -1.407339, -3.661119, 1, 0.7803922, 0, 1,
-1.179589, 0.4524323, -0.4030882, 1, 0.7843137, 0, 1,
-1.178866, -0.2592403, -1.448691, 1, 0.7921569, 0, 1,
-1.165153, -0.1303314, -0.5206077, 1, 0.7960784, 0, 1,
-1.131425, 2.053105, -1.403442, 1, 0.8039216, 0, 1,
-1.130188, 1.649804, -0.5758788, 1, 0.8117647, 0, 1,
-1.129123, 0.5499399, -0.5371759, 1, 0.8156863, 0, 1,
-1.129082, -0.8287014, -2.383686, 1, 0.8235294, 0, 1,
-1.125796, 1.862041, -2.123739, 1, 0.827451, 0, 1,
-1.122571, -1.290379, -2.503572, 1, 0.8352941, 0, 1,
-1.106669, -0.3859997, -2.06475, 1, 0.8392157, 0, 1,
-1.104701, 1.091889, -1.10909, 1, 0.8470588, 0, 1,
-1.09415, 0.2253238, -1.297971, 1, 0.8509804, 0, 1,
-1.093436, -0.9728466, -1.898692, 1, 0.8588235, 0, 1,
-1.085328, 1.124479, 0.7471526, 1, 0.8627451, 0, 1,
-1.083736, -1.490843, -2.821868, 1, 0.8705882, 0, 1,
-1.081854, 0.3318449, -0.7810664, 1, 0.8745098, 0, 1,
-1.077473, 1.131959, -0.8552499, 1, 0.8823529, 0, 1,
-1.06966, -0.4017693, -3.011294, 1, 0.8862745, 0, 1,
-1.068073, -0.8138276, -2.300374, 1, 0.8941177, 0, 1,
-1.065984, 0.342616, -1.291445, 1, 0.8980392, 0, 1,
-1.054981, 0.4594712, -2.091335, 1, 0.9058824, 0, 1,
-1.050456, -0.1430145, -2.026349, 1, 0.9137255, 0, 1,
-1.044083, 1.31973, -1.3398, 1, 0.9176471, 0, 1,
-1.043434, -0.01687413, -1.18159, 1, 0.9254902, 0, 1,
-1.040356, -0.8981192, -1.634817, 1, 0.9294118, 0, 1,
-1.033496, -0.2339429, -2.443081, 1, 0.9372549, 0, 1,
-1.030867, -1.32821, -1.116813, 1, 0.9411765, 0, 1,
-1.027631, 0.4095313, -1.525602, 1, 0.9490196, 0, 1,
-1.02687, 2.902201, -0.4605567, 1, 0.9529412, 0, 1,
-1.025942, -0.23347, -1.914544, 1, 0.9607843, 0, 1,
-1.02479, -0.04246839, -0.6906731, 1, 0.9647059, 0, 1,
-1.023017, 0.5915422, -3.427773, 1, 0.972549, 0, 1,
-1.008888, -0.09759716, -3.533374, 1, 0.9764706, 0, 1,
-1.004945, -0.6328761, -2.991421, 1, 0.9843137, 0, 1,
-1.002875, 0.8610094, -1.234156, 1, 0.9882353, 0, 1,
-0.9952404, 0.9774131, -0.7994907, 1, 0.9960784, 0, 1,
-0.992464, 0.6268584, -1.276035, 0.9960784, 1, 0, 1,
-0.976372, 1.561036, -0.4609478, 0.9921569, 1, 0, 1,
-0.9659669, 0.02446332, -0.2030378, 0.9843137, 1, 0, 1,
-0.9637732, -0.08956002, -2.990617, 0.9803922, 1, 0, 1,
-0.9629176, -0.3771451, -1.227231, 0.972549, 1, 0, 1,
-0.9589052, 0.9649366, -1.861308, 0.9686275, 1, 0, 1,
-0.9546586, 1.459504, -0.491778, 0.9607843, 1, 0, 1,
-0.9526534, 1.082338, -2.548001, 0.9568627, 1, 0, 1,
-0.9513172, 0.6435131, -1.52931, 0.9490196, 1, 0, 1,
-0.9459467, -0.8295163, -3.395149, 0.945098, 1, 0, 1,
-0.938821, -0.2110914, -2.655107, 0.9372549, 1, 0, 1,
-0.9359889, 0.9425552, -0.8142921, 0.9333333, 1, 0, 1,
-0.9358223, 0.0762086, 0.07669952, 0.9254902, 1, 0, 1,
-0.9353023, 1.516264, -0.1832576, 0.9215686, 1, 0, 1,
-0.9342407, -0.6786157, -0.4108374, 0.9137255, 1, 0, 1,
-0.9330293, 0.7523965, -0.1038464, 0.9098039, 1, 0, 1,
-0.931572, 0.9942941, -1.406096, 0.9019608, 1, 0, 1,
-0.9291999, -0.9283085, -2.86575, 0.8941177, 1, 0, 1,
-0.9286141, 0.2088494, -2.48328, 0.8901961, 1, 0, 1,
-0.9206365, 1.208899, -2.409262, 0.8823529, 1, 0, 1,
-0.9118108, -0.5108005, -3.470113, 0.8784314, 1, 0, 1,
-0.9103079, 0.7858431, -2.121387, 0.8705882, 1, 0, 1,
-0.9095495, -0.1089585, -1.62616, 0.8666667, 1, 0, 1,
-0.9053337, -1.163258, -1.763533, 0.8588235, 1, 0, 1,
-0.8993191, -0.320325, -1.436768, 0.854902, 1, 0, 1,
-0.8974741, 0.670864, -1.303515, 0.8470588, 1, 0, 1,
-0.8973474, -0.1166025, -2.157449, 0.8431373, 1, 0, 1,
-0.8958916, -0.2336499, -1.513415, 0.8352941, 1, 0, 1,
-0.889243, 0.7342076, -0.9485105, 0.8313726, 1, 0, 1,
-0.8870162, 0.4869811, -1.489974, 0.8235294, 1, 0, 1,
-0.8858887, 0.5754052, 0.8570328, 0.8196079, 1, 0, 1,
-0.8843164, -0.1451738, -2.921644, 0.8117647, 1, 0, 1,
-0.8782721, -0.578762, -2.753155, 0.8078431, 1, 0, 1,
-0.8755841, 1.100945, -0.9083934, 0.8, 1, 0, 1,
-0.8711098, -0.5646709, -3.322515, 0.7921569, 1, 0, 1,
-0.8663549, -0.1754239, -0.9872621, 0.7882353, 1, 0, 1,
-0.861503, -1.686509, -3.057125, 0.7803922, 1, 0, 1,
-0.8535498, -0.4929804, -1.558912, 0.7764706, 1, 0, 1,
-0.8518746, 0.8279809, -0.7988969, 0.7686275, 1, 0, 1,
-0.8518293, -0.1307281, -2.777249, 0.7647059, 1, 0, 1,
-0.8433872, 0.9622979, -1.41777, 0.7568628, 1, 0, 1,
-0.8432962, -0.3702163, -1.616877, 0.7529412, 1, 0, 1,
-0.8368036, -0.3589512, -1.501066, 0.7450981, 1, 0, 1,
-0.8164776, -1.063566, -2.581248, 0.7411765, 1, 0, 1,
-0.8111678, -1.083554, -2.662468, 0.7333333, 1, 0, 1,
-0.8105873, 1.025978, 0.1706562, 0.7294118, 1, 0, 1,
-0.8043082, -0.2822512, -0.8400804, 0.7215686, 1, 0, 1,
-0.8030438, 0.6761931, -0.5502324, 0.7176471, 1, 0, 1,
-0.7985951, 0.3304604, -1.075634, 0.7098039, 1, 0, 1,
-0.7981877, 1.157959, -2.397278, 0.7058824, 1, 0, 1,
-0.7961875, 0.2909302, -1.92933, 0.6980392, 1, 0, 1,
-0.7943701, -0.2130657, -2.352095, 0.6901961, 1, 0, 1,
-0.7897397, 1.345333, -0.7520717, 0.6862745, 1, 0, 1,
-0.769707, 0.5170184, 0.02971226, 0.6784314, 1, 0, 1,
-0.7680227, 0.811803, 0.8045286, 0.6745098, 1, 0, 1,
-0.7621958, 0.5682402, -1.465861, 0.6666667, 1, 0, 1,
-0.7617348, -0.2825471, -4.479273, 0.6627451, 1, 0, 1,
-0.7552565, -0.9762693, -1.889301, 0.654902, 1, 0, 1,
-0.7541979, -0.7896031, -2.787265, 0.6509804, 1, 0, 1,
-0.7462175, 0.7816887, -0.5940894, 0.6431373, 1, 0, 1,
-0.7417277, -1.09237, -1.214505, 0.6392157, 1, 0, 1,
-0.7416511, -0.3615065, -3.540535, 0.6313726, 1, 0, 1,
-0.7367463, -1.289979, -3.319431, 0.627451, 1, 0, 1,
-0.730504, -1.002773, -3.198508, 0.6196079, 1, 0, 1,
-0.728681, -0.3472282, -0.8020983, 0.6156863, 1, 0, 1,
-0.7262393, 0.9532744, -1.345192, 0.6078432, 1, 0, 1,
-0.7248558, -1.798503, -2.41843, 0.6039216, 1, 0, 1,
-0.7230186, -1.770153, -2.990997, 0.5960785, 1, 0, 1,
-0.7186044, -0.4826058, -1.628031, 0.5882353, 1, 0, 1,
-0.7138366, -1.420816, -2.133693, 0.5843138, 1, 0, 1,
-0.7124359, -1.853315, -1.291864, 0.5764706, 1, 0, 1,
-0.7055224, 0.746577, 0.6612239, 0.572549, 1, 0, 1,
-0.7019354, 0.219832, -2.217697, 0.5647059, 1, 0, 1,
-0.6950936, 0.4032621, 0.61802, 0.5607843, 1, 0, 1,
-0.691502, 0.7061361, 1.188062, 0.5529412, 1, 0, 1,
-0.6914278, -1.090734, -2.63496, 0.5490196, 1, 0, 1,
-0.6913466, -0.01383849, -1.24019, 0.5411765, 1, 0, 1,
-0.6912963, 1.264133, -0.8117225, 0.5372549, 1, 0, 1,
-0.6891336, 1.430914, -0.3869765, 0.5294118, 1, 0, 1,
-0.6890953, 0.9480875, -2.558414, 0.5254902, 1, 0, 1,
-0.6800714, -1.311701, -3.658584, 0.5176471, 1, 0, 1,
-0.6800224, -0.9090788, -2.872566, 0.5137255, 1, 0, 1,
-0.678983, 0.02972294, -1.725827, 0.5058824, 1, 0, 1,
-0.6737607, 0.3593582, 0.01453552, 0.5019608, 1, 0, 1,
-0.6734207, -1.514255, -3.167767, 0.4941176, 1, 0, 1,
-0.6718996, 0.06901876, -0.1582673, 0.4862745, 1, 0, 1,
-0.6686668, -0.7978088, -2.410032, 0.4823529, 1, 0, 1,
-0.667964, 0.9559608, -1.710323, 0.4745098, 1, 0, 1,
-0.6671147, 0.4633702, -0.7790013, 0.4705882, 1, 0, 1,
-0.6630504, -1.054943, -1.011313, 0.4627451, 1, 0, 1,
-0.6612547, -0.7079138, 0.1552693, 0.4588235, 1, 0, 1,
-0.6600041, -0.0700621, -1.090607, 0.4509804, 1, 0, 1,
-0.6589504, -0.2372744, -2.041378, 0.4470588, 1, 0, 1,
-0.6582929, -0.6869159, -2.597679, 0.4392157, 1, 0, 1,
-0.65802, -0.8374633, -1.782207, 0.4352941, 1, 0, 1,
-0.6563128, -0.08953739, -3.290345, 0.427451, 1, 0, 1,
-0.6527857, -0.5338798, -3.40895, 0.4235294, 1, 0, 1,
-0.6503658, -1.521688, -2.504809, 0.4156863, 1, 0, 1,
-0.6373908, -2.136052, -4.059402, 0.4117647, 1, 0, 1,
-0.6342543, 0.8920794, -1.21428, 0.4039216, 1, 0, 1,
-0.6339344, 1.556497, -1.366543, 0.3960784, 1, 0, 1,
-0.6326068, -0.1271282, -2.415393, 0.3921569, 1, 0, 1,
-0.6321797, 0.680552, -1.115499, 0.3843137, 1, 0, 1,
-0.6288201, -0.5600356, -3.158205, 0.3803922, 1, 0, 1,
-0.6277372, -0.9253584, -1.484034, 0.372549, 1, 0, 1,
-0.6221393, 0.2913082, -1.235581, 0.3686275, 1, 0, 1,
-0.6201542, -0.03773423, -1.021092, 0.3607843, 1, 0, 1,
-0.6180353, -0.3608822, -1.492251, 0.3568628, 1, 0, 1,
-0.6160941, -1.527858, -2.467139, 0.3490196, 1, 0, 1,
-0.608367, 0.9501895, 0.4886807, 0.345098, 1, 0, 1,
-0.6059543, -0.01910774, -2.675115, 0.3372549, 1, 0, 1,
-0.5999304, 0.3641567, -2.640207, 0.3333333, 1, 0, 1,
-0.5973958, 0.9107995, 0.8003759, 0.3254902, 1, 0, 1,
-0.5935766, -0.4183247, -2.906889, 0.3215686, 1, 0, 1,
-0.5928265, -0.8307927, -3.262377, 0.3137255, 1, 0, 1,
-0.5923348, -1.594652, -3.477287, 0.3098039, 1, 0, 1,
-0.5921252, -0.1125587, -3.821727, 0.3019608, 1, 0, 1,
-0.5889066, 1.017934, -1.840633, 0.2941177, 1, 0, 1,
-0.587086, -0.8652402, -1.316449, 0.2901961, 1, 0, 1,
-0.585427, 0.8325424, -1.95568, 0.282353, 1, 0, 1,
-0.5819271, 0.8931018, -1.094831, 0.2784314, 1, 0, 1,
-0.5789475, -0.8472576, -2.771202, 0.2705882, 1, 0, 1,
-0.5751023, 0.2594305, -1.200305, 0.2666667, 1, 0, 1,
-0.5747725, -0.1323442, -2.30996, 0.2588235, 1, 0, 1,
-0.5737475, 2.34007, -0.8469535, 0.254902, 1, 0, 1,
-0.5682279, 2.386382, -1.016949, 0.2470588, 1, 0, 1,
-0.5626763, -1.246154, 0.9850885, 0.2431373, 1, 0, 1,
-0.5502833, 0.2019911, -2.13361, 0.2352941, 1, 0, 1,
-0.5479009, -0.3302627, -3.095446, 0.2313726, 1, 0, 1,
-0.5451571, -0.1175751, -1.235415, 0.2235294, 1, 0, 1,
-0.5421542, -0.08957665, -0.8788369, 0.2196078, 1, 0, 1,
-0.5388397, 0.5089458, -0.8049806, 0.2117647, 1, 0, 1,
-0.5386098, -0.6873288, -3.777135, 0.2078431, 1, 0, 1,
-0.5325384, 0.05064646, -1.893855, 0.2, 1, 0, 1,
-0.5305761, 0.2953796, -3.021264, 0.1921569, 1, 0, 1,
-0.530378, 0.580053, -1.246766, 0.1882353, 1, 0, 1,
-0.5232642, 1.339007, -1.794918, 0.1803922, 1, 0, 1,
-0.5230442, -0.09234461, -1.246254, 0.1764706, 1, 0, 1,
-0.5203514, 0.1011788, -0.6508299, 0.1686275, 1, 0, 1,
-0.5183989, 1.993594, -0.458114, 0.1647059, 1, 0, 1,
-0.5169905, -0.3883012, -3.012131, 0.1568628, 1, 0, 1,
-0.5156495, 1.192703, -1.933072, 0.1529412, 1, 0, 1,
-0.5136356, -0.4451561, -3.213051, 0.145098, 1, 0, 1,
-0.5119084, -2.034943, -3.198855, 0.1411765, 1, 0, 1,
-0.5044294, 1.723659, 0.007074348, 0.1333333, 1, 0, 1,
-0.49911, 0.8296714, -0.4141039, 0.1294118, 1, 0, 1,
-0.497402, -0.4838417, -2.903544, 0.1215686, 1, 0, 1,
-0.4948449, -0.4018584, -2.380842, 0.1176471, 1, 0, 1,
-0.4857422, 0.7157593, -1.864935, 0.1098039, 1, 0, 1,
-0.4842596, 0.5959317, -0.2162804, 0.1058824, 1, 0, 1,
-0.4788271, 1.254544, 1.001245, 0.09803922, 1, 0, 1,
-0.477534, 1.254513, -0.9826316, 0.09019608, 1, 0, 1,
-0.4691739, 0.9256266, -0.1605228, 0.08627451, 1, 0, 1,
-0.4687387, 0.01712267, 0.31275, 0.07843138, 1, 0, 1,
-0.4682713, -1.680623, -2.617875, 0.07450981, 1, 0, 1,
-0.4655441, -1.193232, -2.279376, 0.06666667, 1, 0, 1,
-0.4609753, 0.6455147, -0.2983267, 0.0627451, 1, 0, 1,
-0.4607597, -1.778566, -4.18623, 0.05490196, 1, 0, 1,
-0.4480635, -1.680437, -1.568766, 0.05098039, 1, 0, 1,
-0.4479557, -0.1820023, -1.336386, 0.04313726, 1, 0, 1,
-0.4462993, 0.007296524, -1.161913, 0.03921569, 1, 0, 1,
-0.4432207, -0.6849784, -3.301892, 0.03137255, 1, 0, 1,
-0.4337703, 0.6736804, -2.850413, 0.02745098, 1, 0, 1,
-0.4313189, 0.6080709, 0.2764868, 0.01960784, 1, 0, 1,
-0.430338, -1.827939, -1.00073, 0.01568628, 1, 0, 1,
-0.4289918, 1.735562, -1.428438, 0.007843138, 1, 0, 1,
-0.4263681, -1.194849, -4.482855, 0.003921569, 1, 0, 1,
-0.4241213, 1.074065, -0.1591959, 0, 1, 0.003921569, 1,
-0.4231978, -0.5079109, -0.5175958, 0, 1, 0.01176471, 1,
-0.420653, 0.9815351, -0.8945641, 0, 1, 0.01568628, 1,
-0.4199206, 1.643007, 0.3746425, 0, 1, 0.02352941, 1,
-0.419466, -1.047153, -4.483024, 0, 1, 0.02745098, 1,
-0.4192005, -0.5626107, -3.340284, 0, 1, 0.03529412, 1,
-0.4168214, -1.367732, -4.117366, 0, 1, 0.03921569, 1,
-0.4166859, 0.1982828, -0.1170962, 0, 1, 0.04705882, 1,
-0.4084628, -0.4994119, -1.719001, 0, 1, 0.05098039, 1,
-0.4041971, -0.290893, -2.686991, 0, 1, 0.05882353, 1,
-0.4019456, -0.2014191, -1.919779, 0, 1, 0.0627451, 1,
-0.3994305, 0.8495006, -1.465261, 0, 1, 0.07058824, 1,
-0.3975494, -1.799357, -4.235398, 0, 1, 0.07450981, 1,
-0.3949177, 0.3188883, -0.4039835, 0, 1, 0.08235294, 1,
-0.388441, -0.2583747, -1.845541, 0, 1, 0.08627451, 1,
-0.386531, 1.172662, 0.4163419, 0, 1, 0.09411765, 1,
-0.3863111, 0.2379604, 0.3876165, 0, 1, 0.1019608, 1,
-0.3862098, 0.8999268, -1.727386, 0, 1, 0.1058824, 1,
-0.381619, -0.3932629, -3.331834, 0, 1, 0.1137255, 1,
-0.375538, -0.9291881, -1.250493, 0, 1, 0.1176471, 1,
-0.3724414, -0.241809, -1.336261, 0, 1, 0.1254902, 1,
-0.3698415, 2.01681, -1.36998, 0, 1, 0.1294118, 1,
-0.3682114, 1.106994, 0.192112, 0, 1, 0.1372549, 1,
-0.362941, 1.595371, 0.0228704, 0, 1, 0.1411765, 1,
-0.3627174, -0.2603223, -2.814581, 0, 1, 0.1490196, 1,
-0.3607138, 1.036451, 1.665433, 0, 1, 0.1529412, 1,
-0.3591982, 0.7498253, 1.031067, 0, 1, 0.1607843, 1,
-0.3532076, -1.362038, -4.303338, 0, 1, 0.1647059, 1,
-0.351738, -0.438309, -1.365535, 0, 1, 0.172549, 1,
-0.3488063, -0.4626405, -4.14945, 0, 1, 0.1764706, 1,
-0.344877, -0.3091362, -1.953569, 0, 1, 0.1843137, 1,
-0.3432887, 1.193501, -0.03123016, 0, 1, 0.1882353, 1,
-0.3431849, 0.7647312, 0.866729, 0, 1, 0.1960784, 1,
-0.3428534, -0.04562616, -0.489935, 0, 1, 0.2039216, 1,
-0.3424583, 0.2130585, 0.5923982, 0, 1, 0.2078431, 1,
-0.3422863, -0.4704409, -3.158647, 0, 1, 0.2156863, 1,
-0.3377716, 0.1517994, -2.266971, 0, 1, 0.2196078, 1,
-0.329996, 0.5389802, -0.1881767, 0, 1, 0.227451, 1,
-0.3251814, 1.100612, 1.79802, 0, 1, 0.2313726, 1,
-0.3246661, 1.2329, -0.8061844, 0, 1, 0.2392157, 1,
-0.3230816, -1.332465, -4.415809, 0, 1, 0.2431373, 1,
-0.3226037, -0.2053081, -2.797654, 0, 1, 0.2509804, 1,
-0.3222016, 0.01971683, -1.873507, 0, 1, 0.254902, 1,
-0.3205099, -1.962482, -2.459268, 0, 1, 0.2627451, 1,
-0.3202766, -0.95167, -4.454638, 0, 1, 0.2666667, 1,
-0.3196339, 1.170172, -0.2126255, 0, 1, 0.2745098, 1,
-0.3140492, -0.4578781, -2.078795, 0, 1, 0.2784314, 1,
-0.3127813, 0.2816337, -3.184321, 0, 1, 0.2862745, 1,
-0.309196, 0.2914847, -0.5178596, 0, 1, 0.2901961, 1,
-0.3084927, -0.9736035, -3.091921, 0, 1, 0.2980392, 1,
-0.3075246, -0.6020924, -1.912737, 0, 1, 0.3058824, 1,
-0.3033847, -0.5209959, -1.918008, 0, 1, 0.3098039, 1,
-0.2981429, 0.9929276, -0.3677682, 0, 1, 0.3176471, 1,
-0.2966662, -0.9832864, -2.55215, 0, 1, 0.3215686, 1,
-0.2908249, -0.4708954, -2.851741, 0, 1, 0.3294118, 1,
-0.2868654, 0.5917414, -1.224491, 0, 1, 0.3333333, 1,
-0.2850892, -0.2235627, -1.609306, 0, 1, 0.3411765, 1,
-0.2841994, -0.2665211, -2.608411, 0, 1, 0.345098, 1,
-0.2831801, 1.412103, -0.1009268, 0, 1, 0.3529412, 1,
-0.2819782, 0.8571135, 0.1316187, 0, 1, 0.3568628, 1,
-0.2816114, -0.2130042, -2.694499, 0, 1, 0.3647059, 1,
-0.2803335, -0.4063578, -3.628612, 0, 1, 0.3686275, 1,
-0.2762662, -0.2414548, -3.464284, 0, 1, 0.3764706, 1,
-0.275661, -0.6856852, -2.675116, 0, 1, 0.3803922, 1,
-0.2753261, 0.1930713, -2.308145, 0, 1, 0.3882353, 1,
-0.2713735, 1.727871, 1.301916, 0, 1, 0.3921569, 1,
-0.2708989, 1.453121, -2.408813, 0, 1, 0.4, 1,
-0.2704217, 0.8924804, -1.081987, 0, 1, 0.4078431, 1,
-0.2573329, 1.783564, -0.9090576, 0, 1, 0.4117647, 1,
-0.2565339, -0.3849865, -2.129608, 0, 1, 0.4196078, 1,
-0.2561226, -0.4206619, -4.722785, 0, 1, 0.4235294, 1,
-0.2509836, -1.054356, -2.402682, 0, 1, 0.4313726, 1,
-0.2508857, -1.456555, -1.988615, 0, 1, 0.4352941, 1,
-0.2486494, -0.1335885, -1.691672, 0, 1, 0.4431373, 1,
-0.2464973, -0.9461074, -3.095452, 0, 1, 0.4470588, 1,
-0.2454214, -0.2043, -0.4044212, 0, 1, 0.454902, 1,
-0.244392, 0.3459328, -0.5702307, 0, 1, 0.4588235, 1,
-0.241891, 1.502311, 1.084042, 0, 1, 0.4666667, 1,
-0.2404079, 0.1520508, 0.03744768, 0, 1, 0.4705882, 1,
-0.2373604, -1.232373, -3.246428, 0, 1, 0.4784314, 1,
-0.2337157, -0.5274809, -2.276525, 0, 1, 0.4823529, 1,
-0.2334315, -1.725857, -1.826478, 0, 1, 0.4901961, 1,
-0.2330114, -1.551083, -2.839041, 0, 1, 0.4941176, 1,
-0.2326412, -0.2626785, -3.2184, 0, 1, 0.5019608, 1,
-0.224187, -1.231566, -3.009382, 0, 1, 0.509804, 1,
-0.2238171, -1.184739, -3.880367, 0, 1, 0.5137255, 1,
-0.2237336, 0.6627992, -1.295154, 0, 1, 0.5215687, 1,
-0.2221146, 2.132928, 1.651251, 0, 1, 0.5254902, 1,
-0.2210027, -0.1230703, -1.24147, 0, 1, 0.5333334, 1,
-0.2170483, -1.570857, -3.594758, 0, 1, 0.5372549, 1,
-0.2123626, -0.1528385, -1.802598, 0, 1, 0.5450981, 1,
-0.2040662, 1.397374, -0.1303303, 0, 1, 0.5490196, 1,
-0.2025647, -0.7315744, -2.018615, 0, 1, 0.5568628, 1,
-0.2009934, -0.6307863, -2.087223, 0, 1, 0.5607843, 1,
-0.1998578, 0.631892, -0.9423299, 0, 1, 0.5686275, 1,
-0.1931762, -0.3820426, -1.805812, 0, 1, 0.572549, 1,
-0.190007, 0.9930592, -0.449449, 0, 1, 0.5803922, 1,
-0.189246, -1.373549, -3.590179, 0, 1, 0.5843138, 1,
-0.1865661, -1.622278, -2.545022, 0, 1, 0.5921569, 1,
-0.1821756, 0.9267076, -0.3350008, 0, 1, 0.5960785, 1,
-0.1812477, 0.6948512, 0.594296, 0, 1, 0.6039216, 1,
-0.1806194, 0.4686499, 0.3054609, 0, 1, 0.6117647, 1,
-0.1802016, 1.019779, 0.01034495, 0, 1, 0.6156863, 1,
-0.1784854, -0.02031283, -0.3368369, 0, 1, 0.6235294, 1,
-0.1767911, 0.201352, -1.061467, 0, 1, 0.627451, 1,
-0.1761786, 0.5343186, -1.312238, 0, 1, 0.6352941, 1,
-0.1683988, 0.1659484, -0.7140518, 0, 1, 0.6392157, 1,
-0.166116, -1.756274, -4.025161, 0, 1, 0.6470588, 1,
-0.1591039, -1.906704, -1.032759, 0, 1, 0.6509804, 1,
-0.1553122, 2.41398, -0.4435864, 0, 1, 0.6588235, 1,
-0.1538552, 1.815245, 0.8138586, 0, 1, 0.6627451, 1,
-0.1536152, -1.289696, -1.412867, 0, 1, 0.6705883, 1,
-0.1523109, -0.8538052, -1.454184, 0, 1, 0.6745098, 1,
-0.1491904, 0.2739578, -0.9659662, 0, 1, 0.682353, 1,
-0.147728, -0.4203549, -2.567063, 0, 1, 0.6862745, 1,
-0.1445538, -0.2091135, -2.486928, 0, 1, 0.6941177, 1,
-0.1372354, 0.05762835, 0.3794032, 0, 1, 0.7019608, 1,
-0.134531, -0.5142553, -2.673139, 0, 1, 0.7058824, 1,
-0.1332823, 0.03428542, -0.9666006, 0, 1, 0.7137255, 1,
-0.1279023, 1.271976, 1.424998, 0, 1, 0.7176471, 1,
-0.1273385, 0.5029761, 1.598167, 0, 1, 0.7254902, 1,
-0.126179, -0.6944968, -0.9956543, 0, 1, 0.7294118, 1,
-0.1238048, -0.8109211, -1.828465, 0, 1, 0.7372549, 1,
-0.1155482, 0.5220001, 0.4279658, 0, 1, 0.7411765, 1,
-0.1093785, 0.04231409, -1.281444, 0, 1, 0.7490196, 1,
-0.1086511, 0.7306685, 2.010682, 0, 1, 0.7529412, 1,
-0.1042162, 0.5114669, -0.00182674, 0, 1, 0.7607843, 1,
-0.1017004, 0.6577675, -1.775431, 0, 1, 0.7647059, 1,
-0.1009867, 0.7246212, 0.7597408, 0, 1, 0.772549, 1,
-0.1002967, -0.371779, -1.419954, 0, 1, 0.7764706, 1,
-0.1002582, -0.02500686, -3.329131, 0, 1, 0.7843137, 1,
-0.09401673, 1.516973, 0.5628085, 0, 1, 0.7882353, 1,
-0.09131086, 0.9497768, -1.073598, 0, 1, 0.7960784, 1,
-0.08928186, -0.6265195, -2.337788, 0, 1, 0.8039216, 1,
-0.08703008, -1.159016, -2.750358, 0, 1, 0.8078431, 1,
-0.08518407, -0.2210746, -1.665993, 0, 1, 0.8156863, 1,
-0.08404149, -1.327287, -3.063509, 0, 1, 0.8196079, 1,
-0.07940111, -0.9484148, -3.736938, 0, 1, 0.827451, 1,
-0.07847241, -1.037808, -4.293997, 0, 1, 0.8313726, 1,
-0.07484607, -0.5523892, -5.661107, 0, 1, 0.8392157, 1,
-0.07410787, -0.6210047, -2.983515, 0, 1, 0.8431373, 1,
-0.0721082, -0.3663116, -3.486723, 0, 1, 0.8509804, 1,
-0.07138547, 1.035236, 0.2969043, 0, 1, 0.854902, 1,
-0.06912632, 0.5439899, 0.7047957, 0, 1, 0.8627451, 1,
-0.06835569, 1.07182, 0.3777702, 0, 1, 0.8666667, 1,
-0.06654906, -1.072598, -3.13227, 0, 1, 0.8745098, 1,
-0.05676273, -1.664345, -3.700193, 0, 1, 0.8784314, 1,
-0.0530948, -0.03667055, -2.911751, 0, 1, 0.8862745, 1,
-0.05079371, 1.908064, 0.405857, 0, 1, 0.8901961, 1,
-0.04416502, 0.3461685, 0.7093723, 0, 1, 0.8980392, 1,
-0.04413425, 1.213603, -0.6358035, 0, 1, 0.9058824, 1,
-0.04361239, -0.06859155, -3.456946, 0, 1, 0.9098039, 1,
-0.03608546, -0.1160321, -1.436726, 0, 1, 0.9176471, 1,
-0.03467693, -0.4726197, -2.42618, 0, 1, 0.9215686, 1,
-0.03220297, 2.771174, 0.7445233, 0, 1, 0.9294118, 1,
-0.03110407, 0.04698434, -0.8292769, 0, 1, 0.9333333, 1,
-0.02733573, 0.06350444, 0.2615166, 0, 1, 0.9411765, 1,
-0.02689533, 0.6196009, 2.07645, 0, 1, 0.945098, 1,
-0.02427818, -1.312799, -3.181966, 0, 1, 0.9529412, 1,
-0.02374999, 1.192561, 0.4115046, 0, 1, 0.9568627, 1,
-0.01448358, -0.1755788, -2.924368, 0, 1, 0.9647059, 1,
-0.01187484, 1.135947, 0.3717772, 0, 1, 0.9686275, 1,
-0.01005462, -0.3166591, -2.758615, 0, 1, 0.9764706, 1,
-0.007144583, 1.88959, 0.2295679, 0, 1, 0.9803922, 1,
-0.003242733, 1.713739, 1.017587, 0, 1, 0.9882353, 1,
0.003022178, -0.7556851, 2.436774, 0, 1, 0.9921569, 1,
0.004305906, -0.3976951, 2.661547, 0, 1, 1, 1,
0.004601351, 1.408988, -0.2492145, 0, 0.9921569, 1, 1,
0.00990591, -0.3276011, 3.818662, 0, 0.9882353, 1, 1,
0.01078673, -0.1363721, 3.388762, 0, 0.9803922, 1, 1,
0.01144581, -0.09895556, 1.847991, 0, 0.9764706, 1, 1,
0.0131672, 0.2676228, -0.9796649, 0, 0.9686275, 1, 1,
0.01641644, -0.5995416, 2.806288, 0, 0.9647059, 1, 1,
0.01711212, -0.8206723, 2.039915, 0, 0.9568627, 1, 1,
0.01895232, -0.802546, 2.961177, 0, 0.9529412, 1, 1,
0.02023848, 1.547137, 0.05989287, 0, 0.945098, 1, 1,
0.02348635, -1.800478, 3.053011, 0, 0.9411765, 1, 1,
0.02374232, 0.6232142, 0.5579167, 0, 0.9333333, 1, 1,
0.02468592, -0.3452958, 2.565799, 0, 0.9294118, 1, 1,
0.02696363, 0.01138499, 1.80214, 0, 0.9215686, 1, 1,
0.0359675, -0.01653184, 2.570591, 0, 0.9176471, 1, 1,
0.03846736, 0.1054063, 0.3219064, 0, 0.9098039, 1, 1,
0.04073902, 1.792523, 1.151172, 0, 0.9058824, 1, 1,
0.04442525, 1.032311, -0.71132, 0, 0.8980392, 1, 1,
0.04921554, 0.7447255, 0.3652692, 0, 0.8901961, 1, 1,
0.05123389, -0.012565, 1.684163, 0, 0.8862745, 1, 1,
0.05448473, 1.701901, 0.08277361, 0, 0.8784314, 1, 1,
0.05621509, -0.6734396, 1.724067, 0, 0.8745098, 1, 1,
0.05629413, 0.441996, 1.823181, 0, 0.8666667, 1, 1,
0.06277824, 0.6755869, 0.118062, 0, 0.8627451, 1, 1,
0.07093631, -2.322472, 6.148775, 0, 0.854902, 1, 1,
0.07203037, -0.6058723, 2.807781, 0, 0.8509804, 1, 1,
0.07294837, 0.6082345, 1.004681, 0, 0.8431373, 1, 1,
0.07594145, -2.058923, 3.166063, 0, 0.8392157, 1, 1,
0.07744676, -0.7921802, 1.948087, 0, 0.8313726, 1, 1,
0.08249223, -0.8558635, 4.672052, 0, 0.827451, 1, 1,
0.08276945, -0.2420213, 5.355867, 0, 0.8196079, 1, 1,
0.087023, -0.04787143, 1.85114, 0, 0.8156863, 1, 1,
0.08794674, -0.3017453, 2.273524, 0, 0.8078431, 1, 1,
0.09070659, -2.0626, 2.642211, 0, 0.8039216, 1, 1,
0.0947194, -0.7316927, 3.130031, 0, 0.7960784, 1, 1,
0.09754856, -0.7240785, 2.576513, 0, 0.7882353, 1, 1,
0.1001126, 0.5362467, 0.1143768, 0, 0.7843137, 1, 1,
0.1026896, 0.1146496, 0.004265059, 0, 0.7764706, 1, 1,
0.1042161, -0.839559, 3.420272, 0, 0.772549, 1, 1,
0.1050791, -0.3839374, 4.887431, 0, 0.7647059, 1, 1,
0.1051437, -0.5273734, 3.355308, 0, 0.7607843, 1, 1,
0.1056941, -1.789601, 2.008607, 0, 0.7529412, 1, 1,
0.1065636, 0.8177894, 1.011028, 0, 0.7490196, 1, 1,
0.1068001, -1.425232, 4.9662, 0, 0.7411765, 1, 1,
0.1073327, 0.3544746, 0.9845988, 0, 0.7372549, 1, 1,
0.1076064, 2.441491, 0.764053, 0, 0.7294118, 1, 1,
0.1097651, 0.8832445, 1.018938, 0, 0.7254902, 1, 1,
0.1167307, -1.289871, 3.272633, 0, 0.7176471, 1, 1,
0.1169907, -1.405075, 3.081604, 0, 0.7137255, 1, 1,
0.1205417, 0.1491001, -1.171316, 0, 0.7058824, 1, 1,
0.1219821, -0.6413913, 2.822259, 0, 0.6980392, 1, 1,
0.125795, 1.380641, -0.1632017, 0, 0.6941177, 1, 1,
0.1278756, 1.027561, 0.03544946, 0, 0.6862745, 1, 1,
0.1285945, -0.923858, 3.722565, 0, 0.682353, 1, 1,
0.1296184, -0.8945959, 3.333714, 0, 0.6745098, 1, 1,
0.135101, 0.8198997, -2.308638, 0, 0.6705883, 1, 1,
0.13952, -1.050057, 3.020282, 0, 0.6627451, 1, 1,
0.1414385, -0.6776611, 4.131006, 0, 0.6588235, 1, 1,
0.1420476, -0.9029322, 2.452579, 0, 0.6509804, 1, 1,
0.1454728, -0.6779927, 3.052692, 0, 0.6470588, 1, 1,
0.1491772, 1.031816, -1.116711, 0, 0.6392157, 1, 1,
0.1503216, -1.003965, 4.186262, 0, 0.6352941, 1, 1,
0.151964, -0.4909124, 3.10436, 0, 0.627451, 1, 1,
0.1526154, 1.819153, 1.244148, 0, 0.6235294, 1, 1,
0.1643115, 1.716601, -0.9098741, 0, 0.6156863, 1, 1,
0.1645967, -0.8191329, 4.608306, 0, 0.6117647, 1, 1,
0.1647512, -0.700596, 0.7877707, 0, 0.6039216, 1, 1,
0.1669829, -2.052669, 2.094774, 0, 0.5960785, 1, 1,
0.1691079, 0.5547122, 0.7611647, 0, 0.5921569, 1, 1,
0.1693259, -0.4953172, 2.106167, 0, 0.5843138, 1, 1,
0.1712909, -0.3632739, 1.553867, 0, 0.5803922, 1, 1,
0.1776286, 1.607576, 0.5441163, 0, 0.572549, 1, 1,
0.1809734, 0.2060304, -0.8920816, 0, 0.5686275, 1, 1,
0.1849014, 0.1267588, -0.4893677, 0, 0.5607843, 1, 1,
0.1893622, -0.8401772, 3.851192, 0, 0.5568628, 1, 1,
0.1937401, 0.5842531, -0.3934871, 0, 0.5490196, 1, 1,
0.1939861, 0.06562645, -1.288921, 0, 0.5450981, 1, 1,
0.1974289, -0.9636694, 2.647708, 0, 0.5372549, 1, 1,
0.2023824, -0.5108075, 2.769386, 0, 0.5333334, 1, 1,
0.2027453, -0.07937881, 2.626318, 0, 0.5254902, 1, 1,
0.2053957, -0.994063, 3.724601, 0, 0.5215687, 1, 1,
0.2058552, 0.7694982, -0.3983101, 0, 0.5137255, 1, 1,
0.2082965, 0.7730043, -0.1404082, 0, 0.509804, 1, 1,
0.2085236, 0.02349157, 1.722436, 0, 0.5019608, 1, 1,
0.2116735, 1.367574, 1.599897, 0, 0.4941176, 1, 1,
0.2138339, -0.2518984, 1.565466, 0, 0.4901961, 1, 1,
0.2183009, -0.5851009, -0.1871708, 0, 0.4823529, 1, 1,
0.221088, -0.3071851, 3.590848, 0, 0.4784314, 1, 1,
0.2215993, 0.8632178, 0.3754658, 0, 0.4705882, 1, 1,
0.2259669, -0.6028894, 3.052112, 0, 0.4666667, 1, 1,
0.228843, -0.2785309, 2.804896, 0, 0.4588235, 1, 1,
0.2322734, 1.359222, -0.02696982, 0, 0.454902, 1, 1,
0.2355752, -1.721841, 2.005342, 0, 0.4470588, 1, 1,
0.2376771, 0.4970655, 1.905993, 0, 0.4431373, 1, 1,
0.2406154, 0.6375235, -0.07907502, 0, 0.4352941, 1, 1,
0.2438252, 0.7340226, 0.5408878, 0, 0.4313726, 1, 1,
0.2490817, 0.4793904, -0.01819664, 0, 0.4235294, 1, 1,
0.249243, 0.7402962, 0.1906134, 0, 0.4196078, 1, 1,
0.2561271, -1.067615, 3.051901, 0, 0.4117647, 1, 1,
0.2569899, -1.627428, 3.36703, 0, 0.4078431, 1, 1,
0.2631763, -1.016346, 2.131722, 0, 0.4, 1, 1,
0.26891, 0.7662469, 1.511951, 0, 0.3921569, 1, 1,
0.2694388, -0.163932, 2.503608, 0, 0.3882353, 1, 1,
0.2758949, -1.122555, 3.389105, 0, 0.3803922, 1, 1,
0.2820002, 0.1091478, 1.058309, 0, 0.3764706, 1, 1,
0.2839341, 0.5822062, -0.53732, 0, 0.3686275, 1, 1,
0.2864729, 0.4104428, 0.3555282, 0, 0.3647059, 1, 1,
0.2879619, 0.6100896, -0.36215, 0, 0.3568628, 1, 1,
0.291391, 1.669762, 0.8103775, 0, 0.3529412, 1, 1,
0.2915473, 0.04971555, 2.612515, 0, 0.345098, 1, 1,
0.2921129, 1.508087, -0.1629871, 0, 0.3411765, 1, 1,
0.2928685, -1.544325, 3.859968, 0, 0.3333333, 1, 1,
0.2931357, 0.316284, 1.672983, 0, 0.3294118, 1, 1,
0.2940576, -0.7981923, 3.139042, 0, 0.3215686, 1, 1,
0.3031776, -0.272819, 0.8055786, 0, 0.3176471, 1, 1,
0.3056813, 0.8670196, 2.278969, 0, 0.3098039, 1, 1,
0.3080869, -0.4506786, 1.923405, 0, 0.3058824, 1, 1,
0.3083153, 0.1368223, 1.128348, 0, 0.2980392, 1, 1,
0.3209242, -1.456869, 2.748093, 0, 0.2901961, 1, 1,
0.3241126, 0.1746458, 2.075187, 0, 0.2862745, 1, 1,
0.3250538, -1.33058, 1.779871, 0, 0.2784314, 1, 1,
0.3255277, 0.386553, 0.7873396, 0, 0.2745098, 1, 1,
0.3350598, 0.6785357, 0.877097, 0, 0.2666667, 1, 1,
0.3393686, -0.9340919, 3.908251, 0, 0.2627451, 1, 1,
0.3456576, -0.3345042, 2.843921, 0, 0.254902, 1, 1,
0.3490378, 0.4320288, 1.148566, 0, 0.2509804, 1, 1,
0.3493738, -0.02823862, 1.664923, 0, 0.2431373, 1, 1,
0.355102, -0.4027307, 1.298548, 0, 0.2392157, 1, 1,
0.359223, 0.1045131, -0.3523835, 0, 0.2313726, 1, 1,
0.3613591, -0.5562515, 1.709087, 0, 0.227451, 1, 1,
0.3624631, -1.309567, 2.362082, 0, 0.2196078, 1, 1,
0.3663782, 0.5680113, 1.055058, 0, 0.2156863, 1, 1,
0.3668422, 0.4114309, 1.671658, 0, 0.2078431, 1, 1,
0.3738112, 1.698415, 0.920185, 0, 0.2039216, 1, 1,
0.3774398, 1.492686, 0.2287297, 0, 0.1960784, 1, 1,
0.3782825, -0.2369518, 2.516803, 0, 0.1882353, 1, 1,
0.3790475, 0.249321, 0.9494956, 0, 0.1843137, 1, 1,
0.3805098, -0.1455647, 0.570564, 0, 0.1764706, 1, 1,
0.3818232, -1.397475, 0.4977256, 0, 0.172549, 1, 1,
0.3829948, 1.425261, 0.4161001, 0, 0.1647059, 1, 1,
0.3843542, -0.22806, 1.218387, 0, 0.1607843, 1, 1,
0.3868169, -1.025574, 3.376689, 0, 0.1529412, 1, 1,
0.388442, -0.8773127, 2.914297, 0, 0.1490196, 1, 1,
0.39043, -0.07102615, 2.106302, 0, 0.1411765, 1, 1,
0.3932145, -0.04782337, 2.122787, 0, 0.1372549, 1, 1,
0.3989057, -1.737118, 5.167151, 0, 0.1294118, 1, 1,
0.4009389, 0.3658937, 1.945845, 0, 0.1254902, 1, 1,
0.4032827, -0.8221745, 1.613668, 0, 0.1176471, 1, 1,
0.4044225, -1.343001, 4.252061, 0, 0.1137255, 1, 1,
0.4073286, -0.9666182, 2.25719, 0, 0.1058824, 1, 1,
0.4126767, 0.5344599, 0.9484514, 0, 0.09803922, 1, 1,
0.4136665, -0.3645127, 1.666777, 0, 0.09411765, 1, 1,
0.4142683, 0.2039288, 0.7692689, 0, 0.08627451, 1, 1,
0.4158813, 1.662565, 1.10294, 0, 0.08235294, 1, 1,
0.4204833, 1.906061, 0.6565738, 0, 0.07450981, 1, 1,
0.4221545, 0.9364534, 1.974092, 0, 0.07058824, 1, 1,
0.4243469, 1.123002, -0.2819601, 0, 0.0627451, 1, 1,
0.4265372, -1.410976, 1.864718, 0, 0.05882353, 1, 1,
0.4340846, 1.579229, 0.1839294, 0, 0.05098039, 1, 1,
0.4363724, 1.052745, -2.034383, 0, 0.04705882, 1, 1,
0.4403515, -0.06732969, 2.435706, 0, 0.03921569, 1, 1,
0.4464933, 1.357423, 0.1466628, 0, 0.03529412, 1, 1,
0.4468837, 1.216803, -0.4068449, 0, 0.02745098, 1, 1,
0.4530609, 0.7763841, 0.6162203, 0, 0.02352941, 1, 1,
0.4552705, -0.4848123, 2.704811, 0, 0.01568628, 1, 1,
0.4556614, 1.468815, -2.352889, 0, 0.01176471, 1, 1,
0.457538, -0.03670213, 0.86402, 0, 0.003921569, 1, 1,
0.4580618, -1.842615, 3.506682, 0.003921569, 0, 1, 1,
0.458287, -0.080675, 0.371857, 0.007843138, 0, 1, 1,
0.4588185, -0.02179481, 2.547159, 0.01568628, 0, 1, 1,
0.4614879, 0.4899162, 0.3336717, 0.01960784, 0, 1, 1,
0.4632635, 0.6169327, -1.372921, 0.02745098, 0, 1, 1,
0.4645773, -1.342303, 5.010855, 0.03137255, 0, 1, 1,
0.4673932, -0.4149925, 3.037061, 0.03921569, 0, 1, 1,
0.4679213, -0.7966361, 2.184798, 0.04313726, 0, 1, 1,
0.4723848, -0.07245607, 0.7064745, 0.05098039, 0, 1, 1,
0.4757608, 0.275539, 2.265695, 0.05490196, 0, 1, 1,
0.4853091, 0.7407104, 0.9993631, 0.0627451, 0, 1, 1,
0.4870782, 0.8346296, 0.837666, 0.06666667, 0, 1, 1,
0.4877543, 0.5269955, -1.104953, 0.07450981, 0, 1, 1,
0.4935183, 1.197664, -0.8596956, 0.07843138, 0, 1, 1,
0.495809, 0.6736593, 0.6287687, 0.08627451, 0, 1, 1,
0.4982621, -0.9767811, 3.099708, 0.09019608, 0, 1, 1,
0.5027184, -1.185517, 1.921548, 0.09803922, 0, 1, 1,
0.5040295, -0.1253604, 0.7842325, 0.1058824, 0, 1, 1,
0.5056372, 1.151257, 2.294709, 0.1098039, 0, 1, 1,
0.5156006, 0.4528284, 0.8278204, 0.1176471, 0, 1, 1,
0.5186954, 0.1471056, 0.6467055, 0.1215686, 0, 1, 1,
0.5193073, -0.3297769, 2.427716, 0.1294118, 0, 1, 1,
0.5225291, 0.968324, 0.2501212, 0.1333333, 0, 1, 1,
0.5247651, 1.452582, 1.087058, 0.1411765, 0, 1, 1,
0.5298662, -1.806218, 2.228007, 0.145098, 0, 1, 1,
0.5315129, -0.06229926, 1.490915, 0.1529412, 0, 1, 1,
0.5326196, 0.006270816, 1.25478, 0.1568628, 0, 1, 1,
0.5350273, -0.8158939, 3.357918, 0.1647059, 0, 1, 1,
0.5384473, -0.0219847, 1.680346, 0.1686275, 0, 1, 1,
0.5394134, -0.8448232, 3.78374, 0.1764706, 0, 1, 1,
0.5421239, -0.7601481, 1.511961, 0.1803922, 0, 1, 1,
0.5421588, -1.040544, 2.578072, 0.1882353, 0, 1, 1,
0.5469925, -1.519729, 2.241652, 0.1921569, 0, 1, 1,
0.5490538, 1.084183, -0.2415043, 0.2, 0, 1, 1,
0.5561344, -0.9142911, 3.264151, 0.2078431, 0, 1, 1,
0.5580277, 2.225415, 1.127441, 0.2117647, 0, 1, 1,
0.558883, -0.5514955, 3.080008, 0.2196078, 0, 1, 1,
0.5596947, -0.02278474, 2.825196, 0.2235294, 0, 1, 1,
0.5610614, 0.6254086, 2.614349, 0.2313726, 0, 1, 1,
0.5697429, 0.9455962, -2.287812, 0.2352941, 0, 1, 1,
0.5728062, 0.4683241, -0.2354428, 0.2431373, 0, 1, 1,
0.5742475, -1.082576, 2.377162, 0.2470588, 0, 1, 1,
0.5743949, 1.228801, 0.1294745, 0.254902, 0, 1, 1,
0.5747802, 1.669839, -0.08346077, 0.2588235, 0, 1, 1,
0.5773239, 1.446086, 0.3506052, 0.2666667, 0, 1, 1,
0.5844252, -1.123081, 2.323363, 0.2705882, 0, 1, 1,
0.5868565, 0.9432111, 0.165431, 0.2784314, 0, 1, 1,
0.5876266, -0.04904675, 1.296312, 0.282353, 0, 1, 1,
0.589911, 1.637273, 0.6027887, 0.2901961, 0, 1, 1,
0.5930864, -1.617433, 3.740574, 0.2941177, 0, 1, 1,
0.5976491, 0.3451, 0.001983503, 0.3019608, 0, 1, 1,
0.6023737, 0.3839369, 2.333153, 0.3098039, 0, 1, 1,
0.6040608, -0.4640693, 2.068183, 0.3137255, 0, 1, 1,
0.6061906, -0.9941385, 1.656897, 0.3215686, 0, 1, 1,
0.6065708, -0.4992192, 2.099428, 0.3254902, 0, 1, 1,
0.6077138, 0.1870731, 1.95542, 0.3333333, 0, 1, 1,
0.6089204, -0.4374759, 1.850867, 0.3372549, 0, 1, 1,
0.6105952, -1.115508, 1.451459, 0.345098, 0, 1, 1,
0.6144612, -0.2040337, 1.05211, 0.3490196, 0, 1, 1,
0.6152706, 1.273038, 1.084491, 0.3568628, 0, 1, 1,
0.6157343, -1.442767, 3.7955, 0.3607843, 0, 1, 1,
0.6180786, 0.5022589, 0.5842972, 0.3686275, 0, 1, 1,
0.6204582, -1.3002, -0.4060153, 0.372549, 0, 1, 1,
0.6216088, -0.2681037, 3.575814, 0.3803922, 0, 1, 1,
0.6227356, -0.8507575, 0.667783, 0.3843137, 0, 1, 1,
0.625464, 1.431486, 0.1305449, 0.3921569, 0, 1, 1,
0.6255809, 0.5796812, 0.4870807, 0.3960784, 0, 1, 1,
0.6261914, 0.6423823, 1.044167, 0.4039216, 0, 1, 1,
0.6271832, 0.2292178, 0.7431923, 0.4117647, 0, 1, 1,
0.6302751, 1.414257, -1.240674, 0.4156863, 0, 1, 1,
0.6336641, -2.419992, 2.579506, 0.4235294, 0, 1, 1,
0.6340499, -0.6482266, 3.369204, 0.427451, 0, 1, 1,
0.6350639, 0.503152, -0.3499838, 0.4352941, 0, 1, 1,
0.6362858, 0.7039586, 0.1437216, 0.4392157, 0, 1, 1,
0.638766, 1.353519, 0.4904845, 0.4470588, 0, 1, 1,
0.6406306, -1.035566, 2.93759, 0.4509804, 0, 1, 1,
0.6412342, 1.015622, 0.04420757, 0.4588235, 0, 1, 1,
0.6421807, -1.242335, 2.520803, 0.4627451, 0, 1, 1,
0.6476007, 0.6032774, 1.398976, 0.4705882, 0, 1, 1,
0.6480454, 0.9213393, 0.8817688, 0.4745098, 0, 1, 1,
0.6526982, 0.2604839, 1.260004, 0.4823529, 0, 1, 1,
0.6541342, -2.860146, 3.578977, 0.4862745, 0, 1, 1,
0.6585006, 0.2673994, -0.4721849, 0.4941176, 0, 1, 1,
0.6599388, -0.7541202, 3.047767, 0.5019608, 0, 1, 1,
0.6616411, 0.9282173, 0.6670772, 0.5058824, 0, 1, 1,
0.6660488, -0.3661344, 1.951828, 0.5137255, 0, 1, 1,
0.6705915, -1.182928, 2.286052, 0.5176471, 0, 1, 1,
0.6742483, -0.5371888, 3.92496, 0.5254902, 0, 1, 1,
0.6800444, 0.4447237, 0.6729372, 0.5294118, 0, 1, 1,
0.6823586, -0.3742878, 1.53162, 0.5372549, 0, 1, 1,
0.6825995, 0.7971259, 0.3560525, 0.5411765, 0, 1, 1,
0.6878591, 1.98112, 0.7832222, 0.5490196, 0, 1, 1,
0.6928452, 2.250607, -0.2442962, 0.5529412, 0, 1, 1,
0.6937037, -2.585265, 4.011755, 0.5607843, 0, 1, 1,
0.6969773, 1.435478, 0.9888322, 0.5647059, 0, 1, 1,
0.6975613, -0.9932415, 1.689589, 0.572549, 0, 1, 1,
0.6986372, 1.920456, -0.1322255, 0.5764706, 0, 1, 1,
0.7095367, -1.771199, 0.126525, 0.5843138, 0, 1, 1,
0.7100208, 0.5784885, 1.261207, 0.5882353, 0, 1, 1,
0.727927, -0.3258812, 2.277274, 0.5960785, 0, 1, 1,
0.7289755, -0.6398279, 3.662809, 0.6039216, 0, 1, 1,
0.7292329, -1.813504, 3.110739, 0.6078432, 0, 1, 1,
0.7400631, 0.7663782, 1.326391, 0.6156863, 0, 1, 1,
0.7438217, 1.931345, 1.099155, 0.6196079, 0, 1, 1,
0.7509754, 0.04232002, 0.3681764, 0.627451, 0, 1, 1,
0.7534024, 0.4364414, 1.580288, 0.6313726, 0, 1, 1,
0.7562893, 1.659899, 1.270816, 0.6392157, 0, 1, 1,
0.7600777, -0.7079929, 2.438873, 0.6431373, 0, 1, 1,
0.7647679, -0.6807866, 3.070684, 0.6509804, 0, 1, 1,
0.7667049, -2.385723, 3.843727, 0.654902, 0, 1, 1,
0.7714257, -0.5964966, 3.423929, 0.6627451, 0, 1, 1,
0.7725235, 0.5841215, 1.143023, 0.6666667, 0, 1, 1,
0.7782253, -0.3271544, 3.500387, 0.6745098, 0, 1, 1,
0.7798145, 0.03881744, 2.236516, 0.6784314, 0, 1, 1,
0.7814399, 1.034952, 0.4540326, 0.6862745, 0, 1, 1,
0.7892005, 0.5556148, 1.603863, 0.6901961, 0, 1, 1,
0.7897843, 1.401267, 1.517192, 0.6980392, 0, 1, 1,
0.7926695, 0.6851451, -1.372474, 0.7058824, 0, 1, 1,
0.7962378, -0.4324199, 0.9250138, 0.7098039, 0, 1, 1,
0.7997153, 0.04231631, 2.929046, 0.7176471, 0, 1, 1,
0.8013567, -0.4679326, 3.502085, 0.7215686, 0, 1, 1,
0.801603, -1.440618, 3.632879, 0.7294118, 0, 1, 1,
0.8034477, -1.189016, 3.037832, 0.7333333, 0, 1, 1,
0.8127721, 0.2739129, 0.8568416, 0.7411765, 0, 1, 1,
0.8304535, -0.5392389, 2.363654, 0.7450981, 0, 1, 1,
0.8311157, 1.280297, 0.5057495, 0.7529412, 0, 1, 1,
0.8390952, -1.244076, 1.043967, 0.7568628, 0, 1, 1,
0.8392593, -1.138008, 2.208872, 0.7647059, 0, 1, 1,
0.8402273, -2.440364, 3.567815, 0.7686275, 0, 1, 1,
0.8406084, -0.03927385, 1.417829, 0.7764706, 0, 1, 1,
0.8454167, -0.3854956, 3.022901, 0.7803922, 0, 1, 1,
0.8465142, -0.6293312, 2.917323, 0.7882353, 0, 1, 1,
0.8479437, 0.01548168, 2.864976, 0.7921569, 0, 1, 1,
0.8512555, 0.467952, 0.314552, 0.8, 0, 1, 1,
0.8568794, -0.3721653, 1.571698, 0.8078431, 0, 1, 1,
0.8576339, 0.1713821, 0.9456638, 0.8117647, 0, 1, 1,
0.8577033, 0.5209321, 1.297024, 0.8196079, 0, 1, 1,
0.8578912, -1.488097, 2.034417, 0.8235294, 0, 1, 1,
0.8653041, 0.49382, 0.2953532, 0.8313726, 0, 1, 1,
0.8657667, -2.352396, 3.66691, 0.8352941, 0, 1, 1,
0.8710964, -1.131969, 2.214238, 0.8431373, 0, 1, 1,
0.8731245, 0.2401457, 0.9966727, 0.8470588, 0, 1, 1,
0.874953, 0.8831456, 0.8000268, 0.854902, 0, 1, 1,
0.8765522, -0.7813188, 2.465615, 0.8588235, 0, 1, 1,
0.8787, -0.644311, 2.590714, 0.8666667, 0, 1, 1,
0.8789133, 1.030869, 0.9834524, 0.8705882, 0, 1, 1,
0.8819251, 0.2541017, 2.274545, 0.8784314, 0, 1, 1,
0.8887708, 1.127074, 1.054907, 0.8823529, 0, 1, 1,
0.8889278, 0.427973, 0.9708372, 0.8901961, 0, 1, 1,
0.8909299, 0.8931476, 0.771215, 0.8941177, 0, 1, 1,
0.9032973, 0.3898389, 0.4173562, 0.9019608, 0, 1, 1,
0.9129563, -1.632717, 2.232287, 0.9098039, 0, 1, 1,
0.9130505, -0.001567798, 2.39371, 0.9137255, 0, 1, 1,
0.9145527, -0.03566681, 1.128496, 0.9215686, 0, 1, 1,
0.915925, -0.4753672, 3.108235, 0.9254902, 0, 1, 1,
0.9169188, 1.29143, 0.2463424, 0.9333333, 0, 1, 1,
0.9216542, -0.002122329, 1.106132, 0.9372549, 0, 1, 1,
0.9239461, -2.986645, 1.812848, 0.945098, 0, 1, 1,
0.926484, -0.6006346, 1.755201, 0.9490196, 0, 1, 1,
0.9268516, -1.47802, 4.639368, 0.9568627, 0, 1, 1,
0.9369922, 0.8535053, 0.3204717, 0.9607843, 0, 1, 1,
0.9458458, 1.7441, 0.01816183, 0.9686275, 0, 1, 1,
0.9485848, -0.7494555, 2.921771, 0.972549, 0, 1, 1,
0.9489473, -0.22186, 2.910196, 0.9803922, 0, 1, 1,
0.9514162, 0.2477126, 2.208544, 0.9843137, 0, 1, 1,
0.9552719, 0.5952427, 1.03687, 0.9921569, 0, 1, 1,
0.958278, -0.7391658, 1.510865, 0.9960784, 0, 1, 1,
0.9586039, 0.8524929, 0.6506979, 1, 0, 0.9960784, 1,
0.9755919, -1.252566, 1.646441, 1, 0, 0.9882353, 1,
0.9761673, -0.4434639, 2.290251, 1, 0, 0.9843137, 1,
0.978196, -1.306066, 4.662245, 1, 0, 0.9764706, 1,
0.9795048, 1.097344, 1.607895, 1, 0, 0.972549, 1,
0.9822763, 1.177683, -0.7039877, 1, 0, 0.9647059, 1,
0.9914707, -0.5938173, 3.840553, 1, 0, 0.9607843, 1,
1.001617, -1.238751, 3.791169, 1, 0, 0.9529412, 1,
1.003985, 0.1742703, 1.537426, 1, 0, 0.9490196, 1,
1.010458, -1.349538, 2.564392, 1, 0, 0.9411765, 1,
1.018636, 0.4119275, -0.7152381, 1, 0, 0.9372549, 1,
1.022184, 1.081774, 0.8429016, 1, 0, 0.9294118, 1,
1.032371, 1.466219, 1.635749, 1, 0, 0.9254902, 1,
1.040911, 0.382789, 0.5478286, 1, 0, 0.9176471, 1,
1.041128, 1.130346, 0.5572871, 1, 0, 0.9137255, 1,
1.043899, -1.640588, 3.276891, 1, 0, 0.9058824, 1,
1.059495, -0.2229201, 2.590029, 1, 0, 0.9019608, 1,
1.060657, 1.642446, 1.250181, 1, 0, 0.8941177, 1,
1.062007, 1.669655, 0.1004946, 1, 0, 0.8862745, 1,
1.063211, -1.277919, 1.340815, 1, 0, 0.8823529, 1,
1.066126, 0.1009138, 1.020751, 1, 0, 0.8745098, 1,
1.070924, 0.3743185, 1.677873, 1, 0, 0.8705882, 1,
1.076993, -0.008656032, 1.906423, 1, 0, 0.8627451, 1,
1.077989, -0.5562264, 1.873198, 1, 0, 0.8588235, 1,
1.080061, 0.2035615, 3.288431, 1, 0, 0.8509804, 1,
1.090003, -0.386979, 1.718631, 1, 0, 0.8470588, 1,
1.095122, 0.04713647, -0.3228427, 1, 0, 0.8392157, 1,
1.100802, 0.7334239, 3.80908, 1, 0, 0.8352941, 1,
1.120953, -3.019711, 2.271138, 1, 0, 0.827451, 1,
1.127971, -1.527862, 2.622533, 1, 0, 0.8235294, 1,
1.130653, -1.475349, 3.805037, 1, 0, 0.8156863, 1,
1.136371, 1.770463, -0.1526133, 1, 0, 0.8117647, 1,
1.148888, -0.3239263, 1.241002, 1, 0, 0.8039216, 1,
1.1602, 0.3254671, 0.8328209, 1, 0, 0.7960784, 1,
1.165256, 1.134791, -0.1477286, 1, 0, 0.7921569, 1,
1.174345, -1.356199, 2.291467, 1, 0, 0.7843137, 1,
1.183183, -2.044333, 2.118544, 1, 0, 0.7803922, 1,
1.184948, -1.069158, 4.677569, 1, 0, 0.772549, 1,
1.185623, 1.127142, 0.789756, 1, 0, 0.7686275, 1,
1.193153, -1.300508, 1.457942, 1, 0, 0.7607843, 1,
1.194896, 0.5290265, 1.22947, 1, 0, 0.7568628, 1,
1.199296, -1.425885, 1.784542, 1, 0, 0.7490196, 1,
1.201324, 1.541107, 1.146732, 1, 0, 0.7450981, 1,
1.202869, -0.8641223, 1.319738, 1, 0, 0.7372549, 1,
1.203166, -0.3232366, 1.099487, 1, 0, 0.7333333, 1,
1.204443, 0.1255181, 1.499063, 1, 0, 0.7254902, 1,
1.210999, -2.560595, 3.353234, 1, 0, 0.7215686, 1,
1.214051, -0.1451669, 1.860442, 1, 0, 0.7137255, 1,
1.214372, -1.091978, -0.03904904, 1, 0, 0.7098039, 1,
1.223184, -0.4367824, 0.8415143, 1, 0, 0.7019608, 1,
1.223935, -1.054167, 2.676027, 1, 0, 0.6941177, 1,
1.228986, -2.611657, -0.1046298, 1, 0, 0.6901961, 1,
1.229164, -0.8948931, 4.125303, 1, 0, 0.682353, 1,
1.233872, 1.736993, 0.001655459, 1, 0, 0.6784314, 1,
1.237425, -0.3822198, 0.5081663, 1, 0, 0.6705883, 1,
1.238373, -0.05603591, 1.900005, 1, 0, 0.6666667, 1,
1.241646, -1.918092, 2.056481, 1, 0, 0.6588235, 1,
1.245925, 0.2123396, 1.803102, 1, 0, 0.654902, 1,
1.248053, 0.6995479, 2.619951, 1, 0, 0.6470588, 1,
1.261323, -0.195615, 2.19689, 1, 0, 0.6431373, 1,
1.274001, 2.469121, 0.3248669, 1, 0, 0.6352941, 1,
1.274277, 0.7072713, -0.1106156, 1, 0, 0.6313726, 1,
1.285861, -0.09011937, -1.224865, 1, 0, 0.6235294, 1,
1.296806, -1.173857, 1.269237, 1, 0, 0.6196079, 1,
1.297118, 0.4301774, 0.7425799, 1, 0, 0.6117647, 1,
1.297491, -2.629164, 3.129206, 1, 0, 0.6078432, 1,
1.309509, -0.7098216, 0.7056714, 1, 0, 0.6, 1,
1.323729, 0.3484545, 2.328892, 1, 0, 0.5921569, 1,
1.327931, 0.5604773, 0.6600876, 1, 0, 0.5882353, 1,
1.33066, 0.5756512, 1.017392, 1, 0, 0.5803922, 1,
1.335821, -1.418179, 0.3777515, 1, 0, 0.5764706, 1,
1.337389, 0.5569279, 2.275899, 1, 0, 0.5686275, 1,
1.339226, -1.010491, 1.235254, 1, 0, 0.5647059, 1,
1.347601, -1.096353, 0.1750049, 1, 0, 0.5568628, 1,
1.353311, 0.5639882, 0.2247917, 1, 0, 0.5529412, 1,
1.354515, -1.718532, 1.979175, 1, 0, 0.5450981, 1,
1.378069, 0.2935804, 1.835011, 1, 0, 0.5411765, 1,
1.38499, 1.353328, 0.07739496, 1, 0, 0.5333334, 1,
1.390329, -0.4002089, 2.453653, 1, 0, 0.5294118, 1,
1.391634, 0.878884, 2.048391, 1, 0, 0.5215687, 1,
1.403502, 1.195478, 1.006616, 1, 0, 0.5176471, 1,
1.404748, -0.3360254, 2.660869, 1, 0, 0.509804, 1,
1.408647, -0.3516182, 2.201775, 1, 0, 0.5058824, 1,
1.422039, -1.190717, 2.715167, 1, 0, 0.4980392, 1,
1.425405, 0.009817628, -0.04630985, 1, 0, 0.4901961, 1,
1.433171, -0.241858, 2.738153, 1, 0, 0.4862745, 1,
1.45599, -1.214156, 1.875348, 1, 0, 0.4784314, 1,
1.459298, -1.36504, 1.154134, 1, 0, 0.4745098, 1,
1.461216, -0.1759601, 1.214707, 1, 0, 0.4666667, 1,
1.461564, 0.5878782, -0.2942392, 1, 0, 0.4627451, 1,
1.474794, -0.7553263, 1.080219, 1, 0, 0.454902, 1,
1.474964, 1.526602, 0.8710147, 1, 0, 0.4509804, 1,
1.477029, -0.5074779, 1.372812, 1, 0, 0.4431373, 1,
1.4792, 0.4501165, 1.862295, 1, 0, 0.4392157, 1,
1.480715, 0.6734427, 2.29028, 1, 0, 0.4313726, 1,
1.48884, 1.624115, 0.09097003, 1, 0, 0.427451, 1,
1.525433, 1.014501, 0.2139769, 1, 0, 0.4196078, 1,
1.532833, 0.5042146, 1.179933, 1, 0, 0.4156863, 1,
1.55488, -0.7389489, 1.394281, 1, 0, 0.4078431, 1,
1.55626, 1.935681, -3.426551, 1, 0, 0.4039216, 1,
1.55911, -0.6002674, 0.7620183, 1, 0, 0.3960784, 1,
1.574898, -0.4954041, 1.203619, 1, 0, 0.3882353, 1,
1.576931, -0.7213184, 2.03911, 1, 0, 0.3843137, 1,
1.585305, 0.3791615, 0.8283259, 1, 0, 0.3764706, 1,
1.593641, -0.3649294, 1.024633, 1, 0, 0.372549, 1,
1.608905, -0.6290552, 0.9166121, 1, 0, 0.3647059, 1,
1.631231, -0.2626887, 1.244618, 1, 0, 0.3607843, 1,
1.640941, -1.181682, 2.059957, 1, 0, 0.3529412, 1,
1.641271, -1.166995, 3.714645, 1, 0, 0.3490196, 1,
1.65614, -0.2945801, 0.9571291, 1, 0, 0.3411765, 1,
1.656835, 0.8864781, 1.365617, 1, 0, 0.3372549, 1,
1.659598, 0.3333007, -0.05701543, 1, 0, 0.3294118, 1,
1.66219, -0.03266854, 3.412663, 1, 0, 0.3254902, 1,
1.664462, -0.7991429, 2.38078, 1, 0, 0.3176471, 1,
1.668912, 0.6430446, 0.9462713, 1, 0, 0.3137255, 1,
1.676685, 1.804565, 0.7843757, 1, 0, 0.3058824, 1,
1.678541, 0.9183393, 1.903486, 1, 0, 0.2980392, 1,
1.682341, -1.254283, 2.092307, 1, 0, 0.2941177, 1,
1.692126, 1.284716, 0.8117467, 1, 0, 0.2862745, 1,
1.692832, 0.3211521, 2.666482, 1, 0, 0.282353, 1,
1.694119, -0.09216858, 2.528711, 1, 0, 0.2745098, 1,
1.705898, 2.617888, -0.9990152, 1, 0, 0.2705882, 1,
1.721269, 0.2427497, -1.293809, 1, 0, 0.2627451, 1,
1.721565, 0.2244078, 0.7145959, 1, 0, 0.2588235, 1,
1.726924, -0.4946707, 2.959693, 1, 0, 0.2509804, 1,
1.731962, -0.6502106, 1.689532, 1, 0, 0.2470588, 1,
1.734001, -1.212752, 2.29475, 1, 0, 0.2392157, 1,
1.751409, -0.5912869, 3.342992, 1, 0, 0.2352941, 1,
1.75955, -0.445429, 1.731317, 1, 0, 0.227451, 1,
1.764396, 0.5167097, 0.6862513, 1, 0, 0.2235294, 1,
1.766555, -0.892488, 1.525381, 1, 0, 0.2156863, 1,
1.782419, 0.184921, 0.9036343, 1, 0, 0.2117647, 1,
1.805168, 0.1730285, 1.854818, 1, 0, 0.2039216, 1,
1.815605, -2.969836, 2.914002, 1, 0, 0.1960784, 1,
1.837845, 2.069289, 1.084575, 1, 0, 0.1921569, 1,
1.857531, 0.3993814, 1.187689, 1, 0, 0.1843137, 1,
1.859494, 0.07901272, 1.058055, 1, 0, 0.1803922, 1,
1.860687, -2.698374, 3.594566, 1, 0, 0.172549, 1,
1.865888, 1.061108, 1.779976, 1, 0, 0.1686275, 1,
1.871158, 0.4715179, 1.873969, 1, 0, 0.1607843, 1,
1.877059, 0.725982, -0.390562, 1, 0, 0.1568628, 1,
1.882195, -1.090142, 3.370518, 1, 0, 0.1490196, 1,
1.885435, 0.006791217, 2.544771, 1, 0, 0.145098, 1,
1.889464, -0.4335146, 2.208412, 1, 0, 0.1372549, 1,
1.901245, -0.1617571, 2.662571, 1, 0, 0.1333333, 1,
1.961435, -1.010227, -0.1028573, 1, 0, 0.1254902, 1,
1.97492, -0.2986081, 1.445981, 1, 0, 0.1215686, 1,
1.980596, -0.8982366, 2.723286, 1, 0, 0.1137255, 1,
1.980717, 0.3295989, 0.274067, 1, 0, 0.1098039, 1,
2.054233, -0.8733619, 1.353674, 1, 0, 0.1019608, 1,
2.069166, -1.04762, 2.651329, 1, 0, 0.09411765, 1,
2.071031, -0.4467673, 1.737877, 1, 0, 0.09019608, 1,
2.072249, -1.982905, 1.393437, 1, 0, 0.08235294, 1,
2.115834, 0.5860131, 2.738551, 1, 0, 0.07843138, 1,
2.233064, -1.124401, 4.312871, 1, 0, 0.07058824, 1,
2.258383, -0.1538719, 1.281265, 1, 0, 0.06666667, 1,
2.331382, -0.1805395, 2.012679, 1, 0, 0.05882353, 1,
2.349653, 0.08460647, 1.665704, 1, 0, 0.05490196, 1,
2.435915, 1.599194, 0.3652445, 1, 0, 0.04705882, 1,
2.51901, 0.3379135, 2.60492, 1, 0, 0.04313726, 1,
2.644245, -0.1323343, 2.177686, 1, 0, 0.03529412, 1,
2.645701, 0.08121322, 2.769646, 1, 0, 0.03137255, 1,
2.653299, 1.835867, 2.283993, 1, 0, 0.02352941, 1,
2.701141, 0.3456646, 0.1996331, 1, 0, 0.01960784, 1,
3.04373, 1.349854, 0.9131574, 1, 0, 0.01176471, 1,
3.572714, -0.5691853, 2.439043, 1, 0, 0.007843138, 1
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
0.09239614, -4.023475, -7.662882, 0, -0.5, 0.5, 0.5,
0.09239614, -4.023475, -7.662882, 1, -0.5, 0.5, 0.5,
0.09239614, -4.023475, -7.662882, 1, 1.5, 0.5, 0.5,
0.09239614, -4.023475, -7.662882, 0, 1.5, 0.5, 0.5
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
-4.56775, -0.05875468, -7.662882, 0, -0.5, 0.5, 0.5,
-4.56775, -0.05875468, -7.662882, 1, -0.5, 0.5, 0.5,
-4.56775, -0.05875468, -7.662882, 1, 1.5, 0.5, 0.5,
-4.56775, -0.05875468, -7.662882, 0, 1.5, 0.5, 0.5
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
-4.56775, -4.023475, 0.243834, 0, -0.5, 0.5, 0.5,
-4.56775, -4.023475, 0.243834, 1, -0.5, 0.5, 0.5,
-4.56775, -4.023475, 0.243834, 1, 1.5, 0.5, 0.5,
-4.56775, -4.023475, 0.243834, 0, 1.5, 0.5, 0.5
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
-3, -3.108539, -5.838255,
3, -3.108539, -5.838255,
-3, -3.108539, -5.838255,
-3, -3.261029, -6.14236,
-2, -3.108539, -5.838255,
-2, -3.261029, -6.14236,
-1, -3.108539, -5.838255,
-1, -3.261029, -6.14236,
0, -3.108539, -5.838255,
0, -3.261029, -6.14236,
1, -3.108539, -5.838255,
1, -3.261029, -6.14236,
2, -3.108539, -5.838255,
2, -3.261029, -6.14236,
3, -3.108539, -5.838255,
3, -3.261029, -6.14236
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
-3, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
-3, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
-3, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
-3, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
-2, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
-2, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
-2, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
-2, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
-1, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
-1, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
-1, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
-1, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
0, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
0, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
0, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
0, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
1, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
1, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
1, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
1, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
2, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
2, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
2, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
2, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5,
3, -3.566007, -6.750569, 0, -0.5, 0.5, 0.5,
3, -3.566007, -6.750569, 1, -0.5, 0.5, 0.5,
3, -3.566007, -6.750569, 1, 1.5, 0.5, 0.5,
3, -3.566007, -6.750569, 0, 1.5, 0.5, 0.5
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
-3.492331, -3, -5.838255,
-3.492331, 2, -5.838255,
-3.492331, -3, -5.838255,
-3.671568, -3, -6.14236,
-3.492331, -2, -5.838255,
-3.671568, -2, -6.14236,
-3.492331, -1, -5.838255,
-3.671568, -1, -6.14236,
-3.492331, 0, -5.838255,
-3.671568, 0, -6.14236,
-3.492331, 1, -5.838255,
-3.671568, 1, -6.14236,
-3.492331, 2, -5.838255,
-3.671568, 2, -6.14236
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
-4.03004, -3, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, -3, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, -3, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, -3, -6.750569, 0, 1.5, 0.5, 0.5,
-4.03004, -2, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, -2, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, -2, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, -2, -6.750569, 0, 1.5, 0.5, 0.5,
-4.03004, -1, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, -1, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, -1, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, -1, -6.750569, 0, 1.5, 0.5, 0.5,
-4.03004, 0, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, 0, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, 0, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, 0, -6.750569, 0, 1.5, 0.5, 0.5,
-4.03004, 1, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, 1, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, 1, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, 1, -6.750569, 0, 1.5, 0.5, 0.5,
-4.03004, 2, -6.750569, 0, -0.5, 0.5, 0.5,
-4.03004, 2, -6.750569, 1, -0.5, 0.5, 0.5,
-4.03004, 2, -6.750569, 1, 1.5, 0.5, 0.5,
-4.03004, 2, -6.750569, 0, 1.5, 0.5, 0.5
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
-3.492331, -3.108539, -4,
-3.492331, -3.108539, 6,
-3.492331, -3.108539, -4,
-3.671568, -3.261029, -4,
-3.492331, -3.108539, -2,
-3.671568, -3.261029, -2,
-3.492331, -3.108539, 0,
-3.671568, -3.261029, 0,
-3.492331, -3.108539, 2,
-3.671568, -3.261029, 2,
-3.492331, -3.108539, 4,
-3.671568, -3.261029, 4,
-3.492331, -3.108539, 6,
-3.671568, -3.261029, 6
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
-4.03004, -3.566007, -4, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, -4, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, -4, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, -4, 0, 1.5, 0.5, 0.5,
-4.03004, -3.566007, -2, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, -2, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, -2, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, -2, 0, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 0, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 0, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 0, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 0, 0, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 2, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 2, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 2, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 2, 0, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 4, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 4, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 4, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 4, 0, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 6, 0, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 6, 1, -0.5, 0.5, 0.5,
-4.03004, -3.566007, 6, 1, 1.5, 0.5, 0.5,
-4.03004, -3.566007, 6, 0, 1.5, 0.5, 0.5
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
-3.492331, -3.108539, -5.838255,
-3.492331, 2.99103, -5.838255,
-3.492331, -3.108539, 6.325923,
-3.492331, 2.99103, 6.325923,
-3.492331, -3.108539, -5.838255,
-3.492331, -3.108539, 6.325923,
-3.492331, 2.99103, -5.838255,
-3.492331, 2.99103, 6.325923,
-3.492331, -3.108539, -5.838255,
3.677124, -3.108539, -5.838255,
-3.492331, -3.108539, 6.325923,
3.677124, -3.108539, 6.325923,
-3.492331, 2.99103, -5.838255,
3.677124, 2.99103, -5.838255,
-3.492331, 2.99103, 6.325923,
3.677124, 2.99103, 6.325923,
3.677124, -3.108539, -5.838255,
3.677124, 2.99103, -5.838255,
3.677124, -3.108539, 6.325923,
3.677124, 2.99103, 6.325923,
3.677124, -3.108539, -5.838255,
3.677124, -3.108539, 6.325923,
3.677124, 2.99103, -5.838255,
3.677124, 2.99103, 6.325923
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
var radius = 8.213119;
var distance = 36.5411;
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
mvMatrix.translate( -0.09239614, 0.05875468, -0.243834 );
mvMatrix.scale( 1.238614, 1.455871, 0.7300275 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.5411);
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
7-bromo-5-chloro-8-q<-read.table("7-bromo-5-chloro-8-q.xyz", skip=1)
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
-3.387922, -0.8723338, -0.6767606, 0, 0, 1, 1, 1,
-3.36309, -1.578298, -2.505667, 1, 0, 0, 1, 1,
-3.311475, 0.8531587, -0.8404288, 1, 0, 0, 1, 1,
-3.15878, 1.857123, -2.606929, 1, 0, 0, 1, 1,
-2.906519, 0.1301335, -1.967022, 1, 0, 0, 1, 1,
-2.782547, 0.7129449, 0.1430663, 1, 0, 0, 1, 1,
-2.762727, 0.4426062, 0.2117154, 0, 0, 0, 1, 1,
-2.618385, -0.07613166, -2.03463, 0, 0, 0, 1, 1,
-2.600178, 0.2094865, -2.399022, 0, 0, 0, 1, 1,
-2.357118, -0.131637, -2.416321, 0, 0, 0, 1, 1,
-2.249779, 0.4934801, 0.06298737, 0, 0, 0, 1, 1,
-2.245421, 0.450391, -3.25894, 0, 0, 0, 1, 1,
-2.206505, 0.0158101, -0.6001391, 0, 0, 0, 1, 1,
-2.166022, -0.8190924, -1.312761, 1, 1, 1, 1, 1,
-2.133538, -1.242163, -2.939102, 1, 1, 1, 1, 1,
-2.110288, 0.1979836, -0.8802991, 1, 1, 1, 1, 1,
-2.109854, 0.3637675, -2.755021, 1, 1, 1, 1, 1,
-2.094792, 0.9491938, -1.728174, 1, 1, 1, 1, 1,
-2.039666, 1.980726, -2.144129, 1, 1, 1, 1, 1,
-2.005132, -0.6806741, -1.091762, 1, 1, 1, 1, 1,
-1.997698, -1.052602, -3.716384, 1, 1, 1, 1, 1,
-1.98928, 0.5368201, 0.3277349, 1, 1, 1, 1, 1,
-1.977826, -0.3523152, -2.7485, 1, 1, 1, 1, 1,
-1.957209, -0.3805611, -1.768453, 1, 1, 1, 1, 1,
-1.948565, 0.9829249, -3.014306, 1, 1, 1, 1, 1,
-1.925399, 0.8831912, -1.242182, 1, 1, 1, 1, 1,
-1.892828, 1.687838, -2.05864, 1, 1, 1, 1, 1,
-1.887618, -2.134007, -3.265101, 1, 1, 1, 1, 1,
-1.885838, 1.284183, -0.5451753, 0, 0, 1, 1, 1,
-1.873263, 1.095574, -0.8817073, 1, 0, 0, 1, 1,
-1.872389, -0.3338997, -0.9230632, 1, 0, 0, 1, 1,
-1.871582, 1.173301, -2.601909, 1, 0, 0, 1, 1,
-1.86211, 1.487508, -3.057229, 1, 0, 0, 1, 1,
-1.854004, 1.124233, -2.353441, 1, 0, 0, 1, 1,
-1.843317, -0.02014036, -1.412844, 0, 0, 0, 1, 1,
-1.841105, 1.041714, -2.080616, 0, 0, 0, 1, 1,
-1.839251, -0.8986267, -2.502526, 0, 0, 0, 1, 1,
-1.831737, 0.4064475, -0.1546842, 0, 0, 0, 1, 1,
-1.824166, 0.3450188, -1.907035, 0, 0, 0, 1, 1,
-1.761733, 0.1757652, -1.74575, 0, 0, 0, 1, 1,
-1.760379, 0.5549539, -1.796273, 0, 0, 0, 1, 1,
-1.755896, -0.5419018, -2.443092, 1, 1, 1, 1, 1,
-1.722763, 0.3157885, -1.955228, 1, 1, 1, 1, 1,
-1.693547, 0.9852211, -1.561252, 1, 1, 1, 1, 1,
-1.677081, 0.5802646, -3.135837, 1, 1, 1, 1, 1,
-1.674371, 1.132904, -0.03882395, 1, 1, 1, 1, 1,
-1.666468, -0.3986993, -2.227436, 1, 1, 1, 1, 1,
-1.660537, -0.19144, -2.582925, 1, 1, 1, 1, 1,
-1.654183, 0.6587047, -2.087088, 1, 1, 1, 1, 1,
-1.652924, -0.1476876, -2.329118, 1, 1, 1, 1, 1,
-1.642059, -0.6952618, -1.228207, 1, 1, 1, 1, 1,
-1.63698, 0.871436, -1.987541, 1, 1, 1, 1, 1,
-1.632124, -0.3232957, -0.814888, 1, 1, 1, 1, 1,
-1.631221, 0.2205795, -0.04747623, 1, 1, 1, 1, 1,
-1.625518, 0.849898, -1.121714, 1, 1, 1, 1, 1,
-1.625253, 0.5424899, -1.103148, 1, 1, 1, 1, 1,
-1.617557, -0.5653669, -0.7905793, 0, 0, 1, 1, 1,
-1.615193, -1.09878, -3.050686, 1, 0, 0, 1, 1,
-1.614548, 0.4102072, -1.718224, 1, 0, 0, 1, 1,
-1.603449, 0.5505083, -0.4129027, 1, 0, 0, 1, 1,
-1.599516, -0.3016801, -2.256735, 1, 0, 0, 1, 1,
-1.55988, -0.6122374, -2.178725, 1, 0, 0, 1, 1,
-1.558384, 1.192065, -1.657476, 0, 0, 0, 1, 1,
-1.533864, 0.4385834, 0.369929, 0, 0, 0, 1, 1,
-1.514198, -0.5697698, -1.171239, 0, 0, 0, 1, 1,
-1.512031, -0.5872384, 0.2651454, 0, 0, 0, 1, 1,
-1.50447, -0.6157251, -1.152291, 0, 0, 0, 1, 1,
-1.500677, -2.527361, -2.751647, 0, 0, 0, 1, 1,
-1.498549, 0.0642533, -1.089928, 0, 0, 0, 1, 1,
-1.496573, -0.03919322, -2.183335, 1, 1, 1, 1, 1,
-1.492494, 1.183318, 1.076961, 1, 1, 1, 1, 1,
-1.492331, 0.3062962, -1.077411, 1, 1, 1, 1, 1,
-1.488128, -1.49084, -1.93696, 1, 1, 1, 1, 1,
-1.465167, 1.555022, 0.3796849, 1, 1, 1, 1, 1,
-1.462436, -0.034245, -1.606978, 1, 1, 1, 1, 1,
-1.461277, 2.525222, 0.07390147, 1, 1, 1, 1, 1,
-1.45375, 0.23228, -2.482872, 1, 1, 1, 1, 1,
-1.440492, 1.615533, -1.349568, 1, 1, 1, 1, 1,
-1.436231, 1.314583, -1.801105, 1, 1, 1, 1, 1,
-1.43308, -1.284035, -0.3979524, 1, 1, 1, 1, 1,
-1.420166, -1.491372, -0.4608661, 1, 1, 1, 1, 1,
-1.417356, -0.007934803, -0.8132759, 1, 1, 1, 1, 1,
-1.416998, 0.3429797, -2.076448, 1, 1, 1, 1, 1,
-1.416479, 0.2019969, -0.5947129, 1, 1, 1, 1, 1,
-1.414229, -1.200665, -2.653023, 0, 0, 1, 1, 1,
-1.413088, -1.514313, -3.743716, 1, 0, 0, 1, 1,
-1.409347, -1.221854, -1.470415, 1, 0, 0, 1, 1,
-1.408466, -0.2387898, -2.715817, 1, 0, 0, 1, 1,
-1.407589, 0.945158, 0.3795889, 1, 0, 0, 1, 1,
-1.404812, -1.885383, -2.427921, 1, 0, 0, 1, 1,
-1.39704, -0.5570116, -1.467829, 0, 0, 0, 1, 1,
-1.396187, -0.297031, -2.419242, 0, 0, 0, 1, 1,
-1.395885, -0.6306495, -1.591639, 0, 0, 0, 1, 1,
-1.394384, -0.07379914, -1.265923, 0, 0, 0, 1, 1,
-1.3888, 0.3310192, -1.995212, 0, 0, 0, 1, 1,
-1.387427, 0.09984065, -0.5670466, 0, 0, 0, 1, 1,
-1.38646, 0.03809734, -0.8339542, 0, 0, 0, 1, 1,
-1.385335, 1.111504, 0.6244295, 1, 1, 1, 1, 1,
-1.383349, 0.07283138, -1.488967, 1, 1, 1, 1, 1,
-1.379539, -1.144458, -2.611578, 1, 1, 1, 1, 1,
-1.371843, 0.04111887, -1.202478, 1, 1, 1, 1, 1,
-1.369958, 1.23756, -1.848574, 1, 1, 1, 1, 1,
-1.358335, 0.4651592, 0.03752691, 1, 1, 1, 1, 1,
-1.352576, 0.2835898, -0.3244321, 1, 1, 1, 1, 1,
-1.348758, 1.049626, -1.343337, 1, 1, 1, 1, 1,
-1.343025, 0.7046964, 0.5367537, 1, 1, 1, 1, 1,
-1.335967, -1.157048, -2.352314, 1, 1, 1, 1, 1,
-1.329562, 1.147808, -0.2491357, 1, 1, 1, 1, 1,
-1.327969, 0.2370379, -2.032194, 1, 1, 1, 1, 1,
-1.325304, 0.03919127, -2.429315, 1, 1, 1, 1, 1,
-1.321533, -0.4618514, -2.165135, 1, 1, 1, 1, 1,
-1.313996, -0.7994021, -3.145664, 1, 1, 1, 1, 1,
-1.310035, 0.3938771, -1.742354, 0, 0, 1, 1, 1,
-1.307433, -0.6195026, -2.225688, 1, 0, 0, 1, 1,
-1.305471, -0.0290171, -1.954641, 1, 0, 0, 1, 1,
-1.292375, 0.652151, -0.9659172, 1, 0, 0, 1, 1,
-1.282257, 0.3969213, -2.026361, 1, 0, 0, 1, 1,
-1.26876, 1.344998, -1.38409, 1, 0, 0, 1, 1,
-1.261332, 1.42368, -0.2478083, 0, 0, 0, 1, 1,
-1.260309, -0.1386286, -2.443347, 0, 0, 0, 1, 1,
-1.256895, -1.372965, -2.661088, 0, 0, 0, 1, 1,
-1.251664, 0.4936628, -2.479029, 0, 0, 0, 1, 1,
-1.235236, 1.672661, -1.209434, 0, 0, 0, 1, 1,
-1.222913, -0.2101102, -2.31169, 0, 0, 0, 1, 1,
-1.221488, 1.338324, -1.277583, 0, 0, 0, 1, 1,
-1.216807, 2.26861, -2.825471, 1, 1, 1, 1, 1,
-1.214399, -1.269071, -3.545597, 1, 1, 1, 1, 1,
-1.195989, 2.353003, 0.4909518, 1, 1, 1, 1, 1,
-1.185807, -0.0817298, -2.295282, 1, 1, 1, 1, 1,
-1.185031, -1.151994, -1.391363, 1, 1, 1, 1, 1,
-1.180557, -1.407339, -3.661119, 1, 1, 1, 1, 1,
-1.179589, 0.4524323, -0.4030882, 1, 1, 1, 1, 1,
-1.178866, -0.2592403, -1.448691, 1, 1, 1, 1, 1,
-1.165153, -0.1303314, -0.5206077, 1, 1, 1, 1, 1,
-1.131425, 2.053105, -1.403442, 1, 1, 1, 1, 1,
-1.130188, 1.649804, -0.5758788, 1, 1, 1, 1, 1,
-1.129123, 0.5499399, -0.5371759, 1, 1, 1, 1, 1,
-1.129082, -0.8287014, -2.383686, 1, 1, 1, 1, 1,
-1.125796, 1.862041, -2.123739, 1, 1, 1, 1, 1,
-1.122571, -1.290379, -2.503572, 1, 1, 1, 1, 1,
-1.106669, -0.3859997, -2.06475, 0, 0, 1, 1, 1,
-1.104701, 1.091889, -1.10909, 1, 0, 0, 1, 1,
-1.09415, 0.2253238, -1.297971, 1, 0, 0, 1, 1,
-1.093436, -0.9728466, -1.898692, 1, 0, 0, 1, 1,
-1.085328, 1.124479, 0.7471526, 1, 0, 0, 1, 1,
-1.083736, -1.490843, -2.821868, 1, 0, 0, 1, 1,
-1.081854, 0.3318449, -0.7810664, 0, 0, 0, 1, 1,
-1.077473, 1.131959, -0.8552499, 0, 0, 0, 1, 1,
-1.06966, -0.4017693, -3.011294, 0, 0, 0, 1, 1,
-1.068073, -0.8138276, -2.300374, 0, 0, 0, 1, 1,
-1.065984, 0.342616, -1.291445, 0, 0, 0, 1, 1,
-1.054981, 0.4594712, -2.091335, 0, 0, 0, 1, 1,
-1.050456, -0.1430145, -2.026349, 0, 0, 0, 1, 1,
-1.044083, 1.31973, -1.3398, 1, 1, 1, 1, 1,
-1.043434, -0.01687413, -1.18159, 1, 1, 1, 1, 1,
-1.040356, -0.8981192, -1.634817, 1, 1, 1, 1, 1,
-1.033496, -0.2339429, -2.443081, 1, 1, 1, 1, 1,
-1.030867, -1.32821, -1.116813, 1, 1, 1, 1, 1,
-1.027631, 0.4095313, -1.525602, 1, 1, 1, 1, 1,
-1.02687, 2.902201, -0.4605567, 1, 1, 1, 1, 1,
-1.025942, -0.23347, -1.914544, 1, 1, 1, 1, 1,
-1.02479, -0.04246839, -0.6906731, 1, 1, 1, 1, 1,
-1.023017, 0.5915422, -3.427773, 1, 1, 1, 1, 1,
-1.008888, -0.09759716, -3.533374, 1, 1, 1, 1, 1,
-1.004945, -0.6328761, -2.991421, 1, 1, 1, 1, 1,
-1.002875, 0.8610094, -1.234156, 1, 1, 1, 1, 1,
-0.9952404, 0.9774131, -0.7994907, 1, 1, 1, 1, 1,
-0.992464, 0.6268584, -1.276035, 1, 1, 1, 1, 1,
-0.976372, 1.561036, -0.4609478, 0, 0, 1, 1, 1,
-0.9659669, 0.02446332, -0.2030378, 1, 0, 0, 1, 1,
-0.9637732, -0.08956002, -2.990617, 1, 0, 0, 1, 1,
-0.9629176, -0.3771451, -1.227231, 1, 0, 0, 1, 1,
-0.9589052, 0.9649366, -1.861308, 1, 0, 0, 1, 1,
-0.9546586, 1.459504, -0.491778, 1, 0, 0, 1, 1,
-0.9526534, 1.082338, -2.548001, 0, 0, 0, 1, 1,
-0.9513172, 0.6435131, -1.52931, 0, 0, 0, 1, 1,
-0.9459467, -0.8295163, -3.395149, 0, 0, 0, 1, 1,
-0.938821, -0.2110914, -2.655107, 0, 0, 0, 1, 1,
-0.9359889, 0.9425552, -0.8142921, 0, 0, 0, 1, 1,
-0.9358223, 0.0762086, 0.07669952, 0, 0, 0, 1, 1,
-0.9353023, 1.516264, -0.1832576, 0, 0, 0, 1, 1,
-0.9342407, -0.6786157, -0.4108374, 1, 1, 1, 1, 1,
-0.9330293, 0.7523965, -0.1038464, 1, 1, 1, 1, 1,
-0.931572, 0.9942941, -1.406096, 1, 1, 1, 1, 1,
-0.9291999, -0.9283085, -2.86575, 1, 1, 1, 1, 1,
-0.9286141, 0.2088494, -2.48328, 1, 1, 1, 1, 1,
-0.9206365, 1.208899, -2.409262, 1, 1, 1, 1, 1,
-0.9118108, -0.5108005, -3.470113, 1, 1, 1, 1, 1,
-0.9103079, 0.7858431, -2.121387, 1, 1, 1, 1, 1,
-0.9095495, -0.1089585, -1.62616, 1, 1, 1, 1, 1,
-0.9053337, -1.163258, -1.763533, 1, 1, 1, 1, 1,
-0.8993191, -0.320325, -1.436768, 1, 1, 1, 1, 1,
-0.8974741, 0.670864, -1.303515, 1, 1, 1, 1, 1,
-0.8973474, -0.1166025, -2.157449, 1, 1, 1, 1, 1,
-0.8958916, -0.2336499, -1.513415, 1, 1, 1, 1, 1,
-0.889243, 0.7342076, -0.9485105, 1, 1, 1, 1, 1,
-0.8870162, 0.4869811, -1.489974, 0, 0, 1, 1, 1,
-0.8858887, 0.5754052, 0.8570328, 1, 0, 0, 1, 1,
-0.8843164, -0.1451738, -2.921644, 1, 0, 0, 1, 1,
-0.8782721, -0.578762, -2.753155, 1, 0, 0, 1, 1,
-0.8755841, 1.100945, -0.9083934, 1, 0, 0, 1, 1,
-0.8711098, -0.5646709, -3.322515, 1, 0, 0, 1, 1,
-0.8663549, -0.1754239, -0.9872621, 0, 0, 0, 1, 1,
-0.861503, -1.686509, -3.057125, 0, 0, 0, 1, 1,
-0.8535498, -0.4929804, -1.558912, 0, 0, 0, 1, 1,
-0.8518746, 0.8279809, -0.7988969, 0, 0, 0, 1, 1,
-0.8518293, -0.1307281, -2.777249, 0, 0, 0, 1, 1,
-0.8433872, 0.9622979, -1.41777, 0, 0, 0, 1, 1,
-0.8432962, -0.3702163, -1.616877, 0, 0, 0, 1, 1,
-0.8368036, -0.3589512, -1.501066, 1, 1, 1, 1, 1,
-0.8164776, -1.063566, -2.581248, 1, 1, 1, 1, 1,
-0.8111678, -1.083554, -2.662468, 1, 1, 1, 1, 1,
-0.8105873, 1.025978, 0.1706562, 1, 1, 1, 1, 1,
-0.8043082, -0.2822512, -0.8400804, 1, 1, 1, 1, 1,
-0.8030438, 0.6761931, -0.5502324, 1, 1, 1, 1, 1,
-0.7985951, 0.3304604, -1.075634, 1, 1, 1, 1, 1,
-0.7981877, 1.157959, -2.397278, 1, 1, 1, 1, 1,
-0.7961875, 0.2909302, -1.92933, 1, 1, 1, 1, 1,
-0.7943701, -0.2130657, -2.352095, 1, 1, 1, 1, 1,
-0.7897397, 1.345333, -0.7520717, 1, 1, 1, 1, 1,
-0.769707, 0.5170184, 0.02971226, 1, 1, 1, 1, 1,
-0.7680227, 0.811803, 0.8045286, 1, 1, 1, 1, 1,
-0.7621958, 0.5682402, -1.465861, 1, 1, 1, 1, 1,
-0.7617348, -0.2825471, -4.479273, 1, 1, 1, 1, 1,
-0.7552565, -0.9762693, -1.889301, 0, 0, 1, 1, 1,
-0.7541979, -0.7896031, -2.787265, 1, 0, 0, 1, 1,
-0.7462175, 0.7816887, -0.5940894, 1, 0, 0, 1, 1,
-0.7417277, -1.09237, -1.214505, 1, 0, 0, 1, 1,
-0.7416511, -0.3615065, -3.540535, 1, 0, 0, 1, 1,
-0.7367463, -1.289979, -3.319431, 1, 0, 0, 1, 1,
-0.730504, -1.002773, -3.198508, 0, 0, 0, 1, 1,
-0.728681, -0.3472282, -0.8020983, 0, 0, 0, 1, 1,
-0.7262393, 0.9532744, -1.345192, 0, 0, 0, 1, 1,
-0.7248558, -1.798503, -2.41843, 0, 0, 0, 1, 1,
-0.7230186, -1.770153, -2.990997, 0, 0, 0, 1, 1,
-0.7186044, -0.4826058, -1.628031, 0, 0, 0, 1, 1,
-0.7138366, -1.420816, -2.133693, 0, 0, 0, 1, 1,
-0.7124359, -1.853315, -1.291864, 1, 1, 1, 1, 1,
-0.7055224, 0.746577, 0.6612239, 1, 1, 1, 1, 1,
-0.7019354, 0.219832, -2.217697, 1, 1, 1, 1, 1,
-0.6950936, 0.4032621, 0.61802, 1, 1, 1, 1, 1,
-0.691502, 0.7061361, 1.188062, 1, 1, 1, 1, 1,
-0.6914278, -1.090734, -2.63496, 1, 1, 1, 1, 1,
-0.6913466, -0.01383849, -1.24019, 1, 1, 1, 1, 1,
-0.6912963, 1.264133, -0.8117225, 1, 1, 1, 1, 1,
-0.6891336, 1.430914, -0.3869765, 1, 1, 1, 1, 1,
-0.6890953, 0.9480875, -2.558414, 1, 1, 1, 1, 1,
-0.6800714, -1.311701, -3.658584, 1, 1, 1, 1, 1,
-0.6800224, -0.9090788, -2.872566, 1, 1, 1, 1, 1,
-0.678983, 0.02972294, -1.725827, 1, 1, 1, 1, 1,
-0.6737607, 0.3593582, 0.01453552, 1, 1, 1, 1, 1,
-0.6734207, -1.514255, -3.167767, 1, 1, 1, 1, 1,
-0.6718996, 0.06901876, -0.1582673, 0, 0, 1, 1, 1,
-0.6686668, -0.7978088, -2.410032, 1, 0, 0, 1, 1,
-0.667964, 0.9559608, -1.710323, 1, 0, 0, 1, 1,
-0.6671147, 0.4633702, -0.7790013, 1, 0, 0, 1, 1,
-0.6630504, -1.054943, -1.011313, 1, 0, 0, 1, 1,
-0.6612547, -0.7079138, 0.1552693, 1, 0, 0, 1, 1,
-0.6600041, -0.0700621, -1.090607, 0, 0, 0, 1, 1,
-0.6589504, -0.2372744, -2.041378, 0, 0, 0, 1, 1,
-0.6582929, -0.6869159, -2.597679, 0, 0, 0, 1, 1,
-0.65802, -0.8374633, -1.782207, 0, 0, 0, 1, 1,
-0.6563128, -0.08953739, -3.290345, 0, 0, 0, 1, 1,
-0.6527857, -0.5338798, -3.40895, 0, 0, 0, 1, 1,
-0.6503658, -1.521688, -2.504809, 0, 0, 0, 1, 1,
-0.6373908, -2.136052, -4.059402, 1, 1, 1, 1, 1,
-0.6342543, 0.8920794, -1.21428, 1, 1, 1, 1, 1,
-0.6339344, 1.556497, -1.366543, 1, 1, 1, 1, 1,
-0.6326068, -0.1271282, -2.415393, 1, 1, 1, 1, 1,
-0.6321797, 0.680552, -1.115499, 1, 1, 1, 1, 1,
-0.6288201, -0.5600356, -3.158205, 1, 1, 1, 1, 1,
-0.6277372, -0.9253584, -1.484034, 1, 1, 1, 1, 1,
-0.6221393, 0.2913082, -1.235581, 1, 1, 1, 1, 1,
-0.6201542, -0.03773423, -1.021092, 1, 1, 1, 1, 1,
-0.6180353, -0.3608822, -1.492251, 1, 1, 1, 1, 1,
-0.6160941, -1.527858, -2.467139, 1, 1, 1, 1, 1,
-0.608367, 0.9501895, 0.4886807, 1, 1, 1, 1, 1,
-0.6059543, -0.01910774, -2.675115, 1, 1, 1, 1, 1,
-0.5999304, 0.3641567, -2.640207, 1, 1, 1, 1, 1,
-0.5973958, 0.9107995, 0.8003759, 1, 1, 1, 1, 1,
-0.5935766, -0.4183247, -2.906889, 0, 0, 1, 1, 1,
-0.5928265, -0.8307927, -3.262377, 1, 0, 0, 1, 1,
-0.5923348, -1.594652, -3.477287, 1, 0, 0, 1, 1,
-0.5921252, -0.1125587, -3.821727, 1, 0, 0, 1, 1,
-0.5889066, 1.017934, -1.840633, 1, 0, 0, 1, 1,
-0.587086, -0.8652402, -1.316449, 1, 0, 0, 1, 1,
-0.585427, 0.8325424, -1.95568, 0, 0, 0, 1, 1,
-0.5819271, 0.8931018, -1.094831, 0, 0, 0, 1, 1,
-0.5789475, -0.8472576, -2.771202, 0, 0, 0, 1, 1,
-0.5751023, 0.2594305, -1.200305, 0, 0, 0, 1, 1,
-0.5747725, -0.1323442, -2.30996, 0, 0, 0, 1, 1,
-0.5737475, 2.34007, -0.8469535, 0, 0, 0, 1, 1,
-0.5682279, 2.386382, -1.016949, 0, 0, 0, 1, 1,
-0.5626763, -1.246154, 0.9850885, 1, 1, 1, 1, 1,
-0.5502833, 0.2019911, -2.13361, 1, 1, 1, 1, 1,
-0.5479009, -0.3302627, -3.095446, 1, 1, 1, 1, 1,
-0.5451571, -0.1175751, -1.235415, 1, 1, 1, 1, 1,
-0.5421542, -0.08957665, -0.8788369, 1, 1, 1, 1, 1,
-0.5388397, 0.5089458, -0.8049806, 1, 1, 1, 1, 1,
-0.5386098, -0.6873288, -3.777135, 1, 1, 1, 1, 1,
-0.5325384, 0.05064646, -1.893855, 1, 1, 1, 1, 1,
-0.5305761, 0.2953796, -3.021264, 1, 1, 1, 1, 1,
-0.530378, 0.580053, -1.246766, 1, 1, 1, 1, 1,
-0.5232642, 1.339007, -1.794918, 1, 1, 1, 1, 1,
-0.5230442, -0.09234461, -1.246254, 1, 1, 1, 1, 1,
-0.5203514, 0.1011788, -0.6508299, 1, 1, 1, 1, 1,
-0.5183989, 1.993594, -0.458114, 1, 1, 1, 1, 1,
-0.5169905, -0.3883012, -3.012131, 1, 1, 1, 1, 1,
-0.5156495, 1.192703, -1.933072, 0, 0, 1, 1, 1,
-0.5136356, -0.4451561, -3.213051, 1, 0, 0, 1, 1,
-0.5119084, -2.034943, -3.198855, 1, 0, 0, 1, 1,
-0.5044294, 1.723659, 0.007074348, 1, 0, 0, 1, 1,
-0.49911, 0.8296714, -0.4141039, 1, 0, 0, 1, 1,
-0.497402, -0.4838417, -2.903544, 1, 0, 0, 1, 1,
-0.4948449, -0.4018584, -2.380842, 0, 0, 0, 1, 1,
-0.4857422, 0.7157593, -1.864935, 0, 0, 0, 1, 1,
-0.4842596, 0.5959317, -0.2162804, 0, 0, 0, 1, 1,
-0.4788271, 1.254544, 1.001245, 0, 0, 0, 1, 1,
-0.477534, 1.254513, -0.9826316, 0, 0, 0, 1, 1,
-0.4691739, 0.9256266, -0.1605228, 0, 0, 0, 1, 1,
-0.4687387, 0.01712267, 0.31275, 0, 0, 0, 1, 1,
-0.4682713, -1.680623, -2.617875, 1, 1, 1, 1, 1,
-0.4655441, -1.193232, -2.279376, 1, 1, 1, 1, 1,
-0.4609753, 0.6455147, -0.2983267, 1, 1, 1, 1, 1,
-0.4607597, -1.778566, -4.18623, 1, 1, 1, 1, 1,
-0.4480635, -1.680437, -1.568766, 1, 1, 1, 1, 1,
-0.4479557, -0.1820023, -1.336386, 1, 1, 1, 1, 1,
-0.4462993, 0.007296524, -1.161913, 1, 1, 1, 1, 1,
-0.4432207, -0.6849784, -3.301892, 1, 1, 1, 1, 1,
-0.4337703, 0.6736804, -2.850413, 1, 1, 1, 1, 1,
-0.4313189, 0.6080709, 0.2764868, 1, 1, 1, 1, 1,
-0.430338, -1.827939, -1.00073, 1, 1, 1, 1, 1,
-0.4289918, 1.735562, -1.428438, 1, 1, 1, 1, 1,
-0.4263681, -1.194849, -4.482855, 1, 1, 1, 1, 1,
-0.4241213, 1.074065, -0.1591959, 1, 1, 1, 1, 1,
-0.4231978, -0.5079109, -0.5175958, 1, 1, 1, 1, 1,
-0.420653, 0.9815351, -0.8945641, 0, 0, 1, 1, 1,
-0.4199206, 1.643007, 0.3746425, 1, 0, 0, 1, 1,
-0.419466, -1.047153, -4.483024, 1, 0, 0, 1, 1,
-0.4192005, -0.5626107, -3.340284, 1, 0, 0, 1, 1,
-0.4168214, -1.367732, -4.117366, 1, 0, 0, 1, 1,
-0.4166859, 0.1982828, -0.1170962, 1, 0, 0, 1, 1,
-0.4084628, -0.4994119, -1.719001, 0, 0, 0, 1, 1,
-0.4041971, -0.290893, -2.686991, 0, 0, 0, 1, 1,
-0.4019456, -0.2014191, -1.919779, 0, 0, 0, 1, 1,
-0.3994305, 0.8495006, -1.465261, 0, 0, 0, 1, 1,
-0.3975494, -1.799357, -4.235398, 0, 0, 0, 1, 1,
-0.3949177, 0.3188883, -0.4039835, 0, 0, 0, 1, 1,
-0.388441, -0.2583747, -1.845541, 0, 0, 0, 1, 1,
-0.386531, 1.172662, 0.4163419, 1, 1, 1, 1, 1,
-0.3863111, 0.2379604, 0.3876165, 1, 1, 1, 1, 1,
-0.3862098, 0.8999268, -1.727386, 1, 1, 1, 1, 1,
-0.381619, -0.3932629, -3.331834, 1, 1, 1, 1, 1,
-0.375538, -0.9291881, -1.250493, 1, 1, 1, 1, 1,
-0.3724414, -0.241809, -1.336261, 1, 1, 1, 1, 1,
-0.3698415, 2.01681, -1.36998, 1, 1, 1, 1, 1,
-0.3682114, 1.106994, 0.192112, 1, 1, 1, 1, 1,
-0.362941, 1.595371, 0.0228704, 1, 1, 1, 1, 1,
-0.3627174, -0.2603223, -2.814581, 1, 1, 1, 1, 1,
-0.3607138, 1.036451, 1.665433, 1, 1, 1, 1, 1,
-0.3591982, 0.7498253, 1.031067, 1, 1, 1, 1, 1,
-0.3532076, -1.362038, -4.303338, 1, 1, 1, 1, 1,
-0.351738, -0.438309, -1.365535, 1, 1, 1, 1, 1,
-0.3488063, -0.4626405, -4.14945, 1, 1, 1, 1, 1,
-0.344877, -0.3091362, -1.953569, 0, 0, 1, 1, 1,
-0.3432887, 1.193501, -0.03123016, 1, 0, 0, 1, 1,
-0.3431849, 0.7647312, 0.866729, 1, 0, 0, 1, 1,
-0.3428534, -0.04562616, -0.489935, 1, 0, 0, 1, 1,
-0.3424583, 0.2130585, 0.5923982, 1, 0, 0, 1, 1,
-0.3422863, -0.4704409, -3.158647, 1, 0, 0, 1, 1,
-0.3377716, 0.1517994, -2.266971, 0, 0, 0, 1, 1,
-0.329996, 0.5389802, -0.1881767, 0, 0, 0, 1, 1,
-0.3251814, 1.100612, 1.79802, 0, 0, 0, 1, 1,
-0.3246661, 1.2329, -0.8061844, 0, 0, 0, 1, 1,
-0.3230816, -1.332465, -4.415809, 0, 0, 0, 1, 1,
-0.3226037, -0.2053081, -2.797654, 0, 0, 0, 1, 1,
-0.3222016, 0.01971683, -1.873507, 0, 0, 0, 1, 1,
-0.3205099, -1.962482, -2.459268, 1, 1, 1, 1, 1,
-0.3202766, -0.95167, -4.454638, 1, 1, 1, 1, 1,
-0.3196339, 1.170172, -0.2126255, 1, 1, 1, 1, 1,
-0.3140492, -0.4578781, -2.078795, 1, 1, 1, 1, 1,
-0.3127813, 0.2816337, -3.184321, 1, 1, 1, 1, 1,
-0.309196, 0.2914847, -0.5178596, 1, 1, 1, 1, 1,
-0.3084927, -0.9736035, -3.091921, 1, 1, 1, 1, 1,
-0.3075246, -0.6020924, -1.912737, 1, 1, 1, 1, 1,
-0.3033847, -0.5209959, -1.918008, 1, 1, 1, 1, 1,
-0.2981429, 0.9929276, -0.3677682, 1, 1, 1, 1, 1,
-0.2966662, -0.9832864, -2.55215, 1, 1, 1, 1, 1,
-0.2908249, -0.4708954, -2.851741, 1, 1, 1, 1, 1,
-0.2868654, 0.5917414, -1.224491, 1, 1, 1, 1, 1,
-0.2850892, -0.2235627, -1.609306, 1, 1, 1, 1, 1,
-0.2841994, -0.2665211, -2.608411, 1, 1, 1, 1, 1,
-0.2831801, 1.412103, -0.1009268, 0, 0, 1, 1, 1,
-0.2819782, 0.8571135, 0.1316187, 1, 0, 0, 1, 1,
-0.2816114, -0.2130042, -2.694499, 1, 0, 0, 1, 1,
-0.2803335, -0.4063578, -3.628612, 1, 0, 0, 1, 1,
-0.2762662, -0.2414548, -3.464284, 1, 0, 0, 1, 1,
-0.275661, -0.6856852, -2.675116, 1, 0, 0, 1, 1,
-0.2753261, 0.1930713, -2.308145, 0, 0, 0, 1, 1,
-0.2713735, 1.727871, 1.301916, 0, 0, 0, 1, 1,
-0.2708989, 1.453121, -2.408813, 0, 0, 0, 1, 1,
-0.2704217, 0.8924804, -1.081987, 0, 0, 0, 1, 1,
-0.2573329, 1.783564, -0.9090576, 0, 0, 0, 1, 1,
-0.2565339, -0.3849865, -2.129608, 0, 0, 0, 1, 1,
-0.2561226, -0.4206619, -4.722785, 0, 0, 0, 1, 1,
-0.2509836, -1.054356, -2.402682, 1, 1, 1, 1, 1,
-0.2508857, -1.456555, -1.988615, 1, 1, 1, 1, 1,
-0.2486494, -0.1335885, -1.691672, 1, 1, 1, 1, 1,
-0.2464973, -0.9461074, -3.095452, 1, 1, 1, 1, 1,
-0.2454214, -0.2043, -0.4044212, 1, 1, 1, 1, 1,
-0.244392, 0.3459328, -0.5702307, 1, 1, 1, 1, 1,
-0.241891, 1.502311, 1.084042, 1, 1, 1, 1, 1,
-0.2404079, 0.1520508, 0.03744768, 1, 1, 1, 1, 1,
-0.2373604, -1.232373, -3.246428, 1, 1, 1, 1, 1,
-0.2337157, -0.5274809, -2.276525, 1, 1, 1, 1, 1,
-0.2334315, -1.725857, -1.826478, 1, 1, 1, 1, 1,
-0.2330114, -1.551083, -2.839041, 1, 1, 1, 1, 1,
-0.2326412, -0.2626785, -3.2184, 1, 1, 1, 1, 1,
-0.224187, -1.231566, -3.009382, 1, 1, 1, 1, 1,
-0.2238171, -1.184739, -3.880367, 1, 1, 1, 1, 1,
-0.2237336, 0.6627992, -1.295154, 0, 0, 1, 1, 1,
-0.2221146, 2.132928, 1.651251, 1, 0, 0, 1, 1,
-0.2210027, -0.1230703, -1.24147, 1, 0, 0, 1, 1,
-0.2170483, -1.570857, -3.594758, 1, 0, 0, 1, 1,
-0.2123626, -0.1528385, -1.802598, 1, 0, 0, 1, 1,
-0.2040662, 1.397374, -0.1303303, 1, 0, 0, 1, 1,
-0.2025647, -0.7315744, -2.018615, 0, 0, 0, 1, 1,
-0.2009934, -0.6307863, -2.087223, 0, 0, 0, 1, 1,
-0.1998578, 0.631892, -0.9423299, 0, 0, 0, 1, 1,
-0.1931762, -0.3820426, -1.805812, 0, 0, 0, 1, 1,
-0.190007, 0.9930592, -0.449449, 0, 0, 0, 1, 1,
-0.189246, -1.373549, -3.590179, 0, 0, 0, 1, 1,
-0.1865661, -1.622278, -2.545022, 0, 0, 0, 1, 1,
-0.1821756, 0.9267076, -0.3350008, 1, 1, 1, 1, 1,
-0.1812477, 0.6948512, 0.594296, 1, 1, 1, 1, 1,
-0.1806194, 0.4686499, 0.3054609, 1, 1, 1, 1, 1,
-0.1802016, 1.019779, 0.01034495, 1, 1, 1, 1, 1,
-0.1784854, -0.02031283, -0.3368369, 1, 1, 1, 1, 1,
-0.1767911, 0.201352, -1.061467, 1, 1, 1, 1, 1,
-0.1761786, 0.5343186, -1.312238, 1, 1, 1, 1, 1,
-0.1683988, 0.1659484, -0.7140518, 1, 1, 1, 1, 1,
-0.166116, -1.756274, -4.025161, 1, 1, 1, 1, 1,
-0.1591039, -1.906704, -1.032759, 1, 1, 1, 1, 1,
-0.1553122, 2.41398, -0.4435864, 1, 1, 1, 1, 1,
-0.1538552, 1.815245, 0.8138586, 1, 1, 1, 1, 1,
-0.1536152, -1.289696, -1.412867, 1, 1, 1, 1, 1,
-0.1523109, -0.8538052, -1.454184, 1, 1, 1, 1, 1,
-0.1491904, 0.2739578, -0.9659662, 1, 1, 1, 1, 1,
-0.147728, -0.4203549, -2.567063, 0, 0, 1, 1, 1,
-0.1445538, -0.2091135, -2.486928, 1, 0, 0, 1, 1,
-0.1372354, 0.05762835, 0.3794032, 1, 0, 0, 1, 1,
-0.134531, -0.5142553, -2.673139, 1, 0, 0, 1, 1,
-0.1332823, 0.03428542, -0.9666006, 1, 0, 0, 1, 1,
-0.1279023, 1.271976, 1.424998, 1, 0, 0, 1, 1,
-0.1273385, 0.5029761, 1.598167, 0, 0, 0, 1, 1,
-0.126179, -0.6944968, -0.9956543, 0, 0, 0, 1, 1,
-0.1238048, -0.8109211, -1.828465, 0, 0, 0, 1, 1,
-0.1155482, 0.5220001, 0.4279658, 0, 0, 0, 1, 1,
-0.1093785, 0.04231409, -1.281444, 0, 0, 0, 1, 1,
-0.1086511, 0.7306685, 2.010682, 0, 0, 0, 1, 1,
-0.1042162, 0.5114669, -0.00182674, 0, 0, 0, 1, 1,
-0.1017004, 0.6577675, -1.775431, 1, 1, 1, 1, 1,
-0.1009867, 0.7246212, 0.7597408, 1, 1, 1, 1, 1,
-0.1002967, -0.371779, -1.419954, 1, 1, 1, 1, 1,
-0.1002582, -0.02500686, -3.329131, 1, 1, 1, 1, 1,
-0.09401673, 1.516973, 0.5628085, 1, 1, 1, 1, 1,
-0.09131086, 0.9497768, -1.073598, 1, 1, 1, 1, 1,
-0.08928186, -0.6265195, -2.337788, 1, 1, 1, 1, 1,
-0.08703008, -1.159016, -2.750358, 1, 1, 1, 1, 1,
-0.08518407, -0.2210746, -1.665993, 1, 1, 1, 1, 1,
-0.08404149, -1.327287, -3.063509, 1, 1, 1, 1, 1,
-0.07940111, -0.9484148, -3.736938, 1, 1, 1, 1, 1,
-0.07847241, -1.037808, -4.293997, 1, 1, 1, 1, 1,
-0.07484607, -0.5523892, -5.661107, 1, 1, 1, 1, 1,
-0.07410787, -0.6210047, -2.983515, 1, 1, 1, 1, 1,
-0.0721082, -0.3663116, -3.486723, 1, 1, 1, 1, 1,
-0.07138547, 1.035236, 0.2969043, 0, 0, 1, 1, 1,
-0.06912632, 0.5439899, 0.7047957, 1, 0, 0, 1, 1,
-0.06835569, 1.07182, 0.3777702, 1, 0, 0, 1, 1,
-0.06654906, -1.072598, -3.13227, 1, 0, 0, 1, 1,
-0.05676273, -1.664345, -3.700193, 1, 0, 0, 1, 1,
-0.0530948, -0.03667055, -2.911751, 1, 0, 0, 1, 1,
-0.05079371, 1.908064, 0.405857, 0, 0, 0, 1, 1,
-0.04416502, 0.3461685, 0.7093723, 0, 0, 0, 1, 1,
-0.04413425, 1.213603, -0.6358035, 0, 0, 0, 1, 1,
-0.04361239, -0.06859155, -3.456946, 0, 0, 0, 1, 1,
-0.03608546, -0.1160321, -1.436726, 0, 0, 0, 1, 1,
-0.03467693, -0.4726197, -2.42618, 0, 0, 0, 1, 1,
-0.03220297, 2.771174, 0.7445233, 0, 0, 0, 1, 1,
-0.03110407, 0.04698434, -0.8292769, 1, 1, 1, 1, 1,
-0.02733573, 0.06350444, 0.2615166, 1, 1, 1, 1, 1,
-0.02689533, 0.6196009, 2.07645, 1, 1, 1, 1, 1,
-0.02427818, -1.312799, -3.181966, 1, 1, 1, 1, 1,
-0.02374999, 1.192561, 0.4115046, 1, 1, 1, 1, 1,
-0.01448358, -0.1755788, -2.924368, 1, 1, 1, 1, 1,
-0.01187484, 1.135947, 0.3717772, 1, 1, 1, 1, 1,
-0.01005462, -0.3166591, -2.758615, 1, 1, 1, 1, 1,
-0.007144583, 1.88959, 0.2295679, 1, 1, 1, 1, 1,
-0.003242733, 1.713739, 1.017587, 1, 1, 1, 1, 1,
0.003022178, -0.7556851, 2.436774, 1, 1, 1, 1, 1,
0.004305906, -0.3976951, 2.661547, 1, 1, 1, 1, 1,
0.004601351, 1.408988, -0.2492145, 1, 1, 1, 1, 1,
0.00990591, -0.3276011, 3.818662, 1, 1, 1, 1, 1,
0.01078673, -0.1363721, 3.388762, 1, 1, 1, 1, 1,
0.01144581, -0.09895556, 1.847991, 0, 0, 1, 1, 1,
0.0131672, 0.2676228, -0.9796649, 1, 0, 0, 1, 1,
0.01641644, -0.5995416, 2.806288, 1, 0, 0, 1, 1,
0.01711212, -0.8206723, 2.039915, 1, 0, 0, 1, 1,
0.01895232, -0.802546, 2.961177, 1, 0, 0, 1, 1,
0.02023848, 1.547137, 0.05989287, 1, 0, 0, 1, 1,
0.02348635, -1.800478, 3.053011, 0, 0, 0, 1, 1,
0.02374232, 0.6232142, 0.5579167, 0, 0, 0, 1, 1,
0.02468592, -0.3452958, 2.565799, 0, 0, 0, 1, 1,
0.02696363, 0.01138499, 1.80214, 0, 0, 0, 1, 1,
0.0359675, -0.01653184, 2.570591, 0, 0, 0, 1, 1,
0.03846736, 0.1054063, 0.3219064, 0, 0, 0, 1, 1,
0.04073902, 1.792523, 1.151172, 0, 0, 0, 1, 1,
0.04442525, 1.032311, -0.71132, 1, 1, 1, 1, 1,
0.04921554, 0.7447255, 0.3652692, 1, 1, 1, 1, 1,
0.05123389, -0.012565, 1.684163, 1, 1, 1, 1, 1,
0.05448473, 1.701901, 0.08277361, 1, 1, 1, 1, 1,
0.05621509, -0.6734396, 1.724067, 1, 1, 1, 1, 1,
0.05629413, 0.441996, 1.823181, 1, 1, 1, 1, 1,
0.06277824, 0.6755869, 0.118062, 1, 1, 1, 1, 1,
0.07093631, -2.322472, 6.148775, 1, 1, 1, 1, 1,
0.07203037, -0.6058723, 2.807781, 1, 1, 1, 1, 1,
0.07294837, 0.6082345, 1.004681, 1, 1, 1, 1, 1,
0.07594145, -2.058923, 3.166063, 1, 1, 1, 1, 1,
0.07744676, -0.7921802, 1.948087, 1, 1, 1, 1, 1,
0.08249223, -0.8558635, 4.672052, 1, 1, 1, 1, 1,
0.08276945, -0.2420213, 5.355867, 1, 1, 1, 1, 1,
0.087023, -0.04787143, 1.85114, 1, 1, 1, 1, 1,
0.08794674, -0.3017453, 2.273524, 0, 0, 1, 1, 1,
0.09070659, -2.0626, 2.642211, 1, 0, 0, 1, 1,
0.0947194, -0.7316927, 3.130031, 1, 0, 0, 1, 1,
0.09754856, -0.7240785, 2.576513, 1, 0, 0, 1, 1,
0.1001126, 0.5362467, 0.1143768, 1, 0, 0, 1, 1,
0.1026896, 0.1146496, 0.004265059, 1, 0, 0, 1, 1,
0.1042161, -0.839559, 3.420272, 0, 0, 0, 1, 1,
0.1050791, -0.3839374, 4.887431, 0, 0, 0, 1, 1,
0.1051437, -0.5273734, 3.355308, 0, 0, 0, 1, 1,
0.1056941, -1.789601, 2.008607, 0, 0, 0, 1, 1,
0.1065636, 0.8177894, 1.011028, 0, 0, 0, 1, 1,
0.1068001, -1.425232, 4.9662, 0, 0, 0, 1, 1,
0.1073327, 0.3544746, 0.9845988, 0, 0, 0, 1, 1,
0.1076064, 2.441491, 0.764053, 1, 1, 1, 1, 1,
0.1097651, 0.8832445, 1.018938, 1, 1, 1, 1, 1,
0.1167307, -1.289871, 3.272633, 1, 1, 1, 1, 1,
0.1169907, -1.405075, 3.081604, 1, 1, 1, 1, 1,
0.1205417, 0.1491001, -1.171316, 1, 1, 1, 1, 1,
0.1219821, -0.6413913, 2.822259, 1, 1, 1, 1, 1,
0.125795, 1.380641, -0.1632017, 1, 1, 1, 1, 1,
0.1278756, 1.027561, 0.03544946, 1, 1, 1, 1, 1,
0.1285945, -0.923858, 3.722565, 1, 1, 1, 1, 1,
0.1296184, -0.8945959, 3.333714, 1, 1, 1, 1, 1,
0.135101, 0.8198997, -2.308638, 1, 1, 1, 1, 1,
0.13952, -1.050057, 3.020282, 1, 1, 1, 1, 1,
0.1414385, -0.6776611, 4.131006, 1, 1, 1, 1, 1,
0.1420476, -0.9029322, 2.452579, 1, 1, 1, 1, 1,
0.1454728, -0.6779927, 3.052692, 1, 1, 1, 1, 1,
0.1491772, 1.031816, -1.116711, 0, 0, 1, 1, 1,
0.1503216, -1.003965, 4.186262, 1, 0, 0, 1, 1,
0.151964, -0.4909124, 3.10436, 1, 0, 0, 1, 1,
0.1526154, 1.819153, 1.244148, 1, 0, 0, 1, 1,
0.1643115, 1.716601, -0.9098741, 1, 0, 0, 1, 1,
0.1645967, -0.8191329, 4.608306, 1, 0, 0, 1, 1,
0.1647512, -0.700596, 0.7877707, 0, 0, 0, 1, 1,
0.1669829, -2.052669, 2.094774, 0, 0, 0, 1, 1,
0.1691079, 0.5547122, 0.7611647, 0, 0, 0, 1, 1,
0.1693259, -0.4953172, 2.106167, 0, 0, 0, 1, 1,
0.1712909, -0.3632739, 1.553867, 0, 0, 0, 1, 1,
0.1776286, 1.607576, 0.5441163, 0, 0, 0, 1, 1,
0.1809734, 0.2060304, -0.8920816, 0, 0, 0, 1, 1,
0.1849014, 0.1267588, -0.4893677, 1, 1, 1, 1, 1,
0.1893622, -0.8401772, 3.851192, 1, 1, 1, 1, 1,
0.1937401, 0.5842531, -0.3934871, 1, 1, 1, 1, 1,
0.1939861, 0.06562645, -1.288921, 1, 1, 1, 1, 1,
0.1974289, -0.9636694, 2.647708, 1, 1, 1, 1, 1,
0.2023824, -0.5108075, 2.769386, 1, 1, 1, 1, 1,
0.2027453, -0.07937881, 2.626318, 1, 1, 1, 1, 1,
0.2053957, -0.994063, 3.724601, 1, 1, 1, 1, 1,
0.2058552, 0.7694982, -0.3983101, 1, 1, 1, 1, 1,
0.2082965, 0.7730043, -0.1404082, 1, 1, 1, 1, 1,
0.2085236, 0.02349157, 1.722436, 1, 1, 1, 1, 1,
0.2116735, 1.367574, 1.599897, 1, 1, 1, 1, 1,
0.2138339, -0.2518984, 1.565466, 1, 1, 1, 1, 1,
0.2183009, -0.5851009, -0.1871708, 1, 1, 1, 1, 1,
0.221088, -0.3071851, 3.590848, 1, 1, 1, 1, 1,
0.2215993, 0.8632178, 0.3754658, 0, 0, 1, 1, 1,
0.2259669, -0.6028894, 3.052112, 1, 0, 0, 1, 1,
0.228843, -0.2785309, 2.804896, 1, 0, 0, 1, 1,
0.2322734, 1.359222, -0.02696982, 1, 0, 0, 1, 1,
0.2355752, -1.721841, 2.005342, 1, 0, 0, 1, 1,
0.2376771, 0.4970655, 1.905993, 1, 0, 0, 1, 1,
0.2406154, 0.6375235, -0.07907502, 0, 0, 0, 1, 1,
0.2438252, 0.7340226, 0.5408878, 0, 0, 0, 1, 1,
0.2490817, 0.4793904, -0.01819664, 0, 0, 0, 1, 1,
0.249243, 0.7402962, 0.1906134, 0, 0, 0, 1, 1,
0.2561271, -1.067615, 3.051901, 0, 0, 0, 1, 1,
0.2569899, -1.627428, 3.36703, 0, 0, 0, 1, 1,
0.2631763, -1.016346, 2.131722, 0, 0, 0, 1, 1,
0.26891, 0.7662469, 1.511951, 1, 1, 1, 1, 1,
0.2694388, -0.163932, 2.503608, 1, 1, 1, 1, 1,
0.2758949, -1.122555, 3.389105, 1, 1, 1, 1, 1,
0.2820002, 0.1091478, 1.058309, 1, 1, 1, 1, 1,
0.2839341, 0.5822062, -0.53732, 1, 1, 1, 1, 1,
0.2864729, 0.4104428, 0.3555282, 1, 1, 1, 1, 1,
0.2879619, 0.6100896, -0.36215, 1, 1, 1, 1, 1,
0.291391, 1.669762, 0.8103775, 1, 1, 1, 1, 1,
0.2915473, 0.04971555, 2.612515, 1, 1, 1, 1, 1,
0.2921129, 1.508087, -0.1629871, 1, 1, 1, 1, 1,
0.2928685, -1.544325, 3.859968, 1, 1, 1, 1, 1,
0.2931357, 0.316284, 1.672983, 1, 1, 1, 1, 1,
0.2940576, -0.7981923, 3.139042, 1, 1, 1, 1, 1,
0.3031776, -0.272819, 0.8055786, 1, 1, 1, 1, 1,
0.3056813, 0.8670196, 2.278969, 1, 1, 1, 1, 1,
0.3080869, -0.4506786, 1.923405, 0, 0, 1, 1, 1,
0.3083153, 0.1368223, 1.128348, 1, 0, 0, 1, 1,
0.3209242, -1.456869, 2.748093, 1, 0, 0, 1, 1,
0.3241126, 0.1746458, 2.075187, 1, 0, 0, 1, 1,
0.3250538, -1.33058, 1.779871, 1, 0, 0, 1, 1,
0.3255277, 0.386553, 0.7873396, 1, 0, 0, 1, 1,
0.3350598, 0.6785357, 0.877097, 0, 0, 0, 1, 1,
0.3393686, -0.9340919, 3.908251, 0, 0, 0, 1, 1,
0.3456576, -0.3345042, 2.843921, 0, 0, 0, 1, 1,
0.3490378, 0.4320288, 1.148566, 0, 0, 0, 1, 1,
0.3493738, -0.02823862, 1.664923, 0, 0, 0, 1, 1,
0.355102, -0.4027307, 1.298548, 0, 0, 0, 1, 1,
0.359223, 0.1045131, -0.3523835, 0, 0, 0, 1, 1,
0.3613591, -0.5562515, 1.709087, 1, 1, 1, 1, 1,
0.3624631, -1.309567, 2.362082, 1, 1, 1, 1, 1,
0.3663782, 0.5680113, 1.055058, 1, 1, 1, 1, 1,
0.3668422, 0.4114309, 1.671658, 1, 1, 1, 1, 1,
0.3738112, 1.698415, 0.920185, 1, 1, 1, 1, 1,
0.3774398, 1.492686, 0.2287297, 1, 1, 1, 1, 1,
0.3782825, -0.2369518, 2.516803, 1, 1, 1, 1, 1,
0.3790475, 0.249321, 0.9494956, 1, 1, 1, 1, 1,
0.3805098, -0.1455647, 0.570564, 1, 1, 1, 1, 1,
0.3818232, -1.397475, 0.4977256, 1, 1, 1, 1, 1,
0.3829948, 1.425261, 0.4161001, 1, 1, 1, 1, 1,
0.3843542, -0.22806, 1.218387, 1, 1, 1, 1, 1,
0.3868169, -1.025574, 3.376689, 1, 1, 1, 1, 1,
0.388442, -0.8773127, 2.914297, 1, 1, 1, 1, 1,
0.39043, -0.07102615, 2.106302, 1, 1, 1, 1, 1,
0.3932145, -0.04782337, 2.122787, 0, 0, 1, 1, 1,
0.3989057, -1.737118, 5.167151, 1, 0, 0, 1, 1,
0.4009389, 0.3658937, 1.945845, 1, 0, 0, 1, 1,
0.4032827, -0.8221745, 1.613668, 1, 0, 0, 1, 1,
0.4044225, -1.343001, 4.252061, 1, 0, 0, 1, 1,
0.4073286, -0.9666182, 2.25719, 1, 0, 0, 1, 1,
0.4126767, 0.5344599, 0.9484514, 0, 0, 0, 1, 1,
0.4136665, -0.3645127, 1.666777, 0, 0, 0, 1, 1,
0.4142683, 0.2039288, 0.7692689, 0, 0, 0, 1, 1,
0.4158813, 1.662565, 1.10294, 0, 0, 0, 1, 1,
0.4204833, 1.906061, 0.6565738, 0, 0, 0, 1, 1,
0.4221545, 0.9364534, 1.974092, 0, 0, 0, 1, 1,
0.4243469, 1.123002, -0.2819601, 0, 0, 0, 1, 1,
0.4265372, -1.410976, 1.864718, 1, 1, 1, 1, 1,
0.4340846, 1.579229, 0.1839294, 1, 1, 1, 1, 1,
0.4363724, 1.052745, -2.034383, 1, 1, 1, 1, 1,
0.4403515, -0.06732969, 2.435706, 1, 1, 1, 1, 1,
0.4464933, 1.357423, 0.1466628, 1, 1, 1, 1, 1,
0.4468837, 1.216803, -0.4068449, 1, 1, 1, 1, 1,
0.4530609, 0.7763841, 0.6162203, 1, 1, 1, 1, 1,
0.4552705, -0.4848123, 2.704811, 1, 1, 1, 1, 1,
0.4556614, 1.468815, -2.352889, 1, 1, 1, 1, 1,
0.457538, -0.03670213, 0.86402, 1, 1, 1, 1, 1,
0.4580618, -1.842615, 3.506682, 1, 1, 1, 1, 1,
0.458287, -0.080675, 0.371857, 1, 1, 1, 1, 1,
0.4588185, -0.02179481, 2.547159, 1, 1, 1, 1, 1,
0.4614879, 0.4899162, 0.3336717, 1, 1, 1, 1, 1,
0.4632635, 0.6169327, -1.372921, 1, 1, 1, 1, 1,
0.4645773, -1.342303, 5.010855, 0, 0, 1, 1, 1,
0.4673932, -0.4149925, 3.037061, 1, 0, 0, 1, 1,
0.4679213, -0.7966361, 2.184798, 1, 0, 0, 1, 1,
0.4723848, -0.07245607, 0.7064745, 1, 0, 0, 1, 1,
0.4757608, 0.275539, 2.265695, 1, 0, 0, 1, 1,
0.4853091, 0.7407104, 0.9993631, 1, 0, 0, 1, 1,
0.4870782, 0.8346296, 0.837666, 0, 0, 0, 1, 1,
0.4877543, 0.5269955, -1.104953, 0, 0, 0, 1, 1,
0.4935183, 1.197664, -0.8596956, 0, 0, 0, 1, 1,
0.495809, 0.6736593, 0.6287687, 0, 0, 0, 1, 1,
0.4982621, -0.9767811, 3.099708, 0, 0, 0, 1, 1,
0.5027184, -1.185517, 1.921548, 0, 0, 0, 1, 1,
0.5040295, -0.1253604, 0.7842325, 0, 0, 0, 1, 1,
0.5056372, 1.151257, 2.294709, 1, 1, 1, 1, 1,
0.5156006, 0.4528284, 0.8278204, 1, 1, 1, 1, 1,
0.5186954, 0.1471056, 0.6467055, 1, 1, 1, 1, 1,
0.5193073, -0.3297769, 2.427716, 1, 1, 1, 1, 1,
0.5225291, 0.968324, 0.2501212, 1, 1, 1, 1, 1,
0.5247651, 1.452582, 1.087058, 1, 1, 1, 1, 1,
0.5298662, -1.806218, 2.228007, 1, 1, 1, 1, 1,
0.5315129, -0.06229926, 1.490915, 1, 1, 1, 1, 1,
0.5326196, 0.006270816, 1.25478, 1, 1, 1, 1, 1,
0.5350273, -0.8158939, 3.357918, 1, 1, 1, 1, 1,
0.5384473, -0.0219847, 1.680346, 1, 1, 1, 1, 1,
0.5394134, -0.8448232, 3.78374, 1, 1, 1, 1, 1,
0.5421239, -0.7601481, 1.511961, 1, 1, 1, 1, 1,
0.5421588, -1.040544, 2.578072, 1, 1, 1, 1, 1,
0.5469925, -1.519729, 2.241652, 1, 1, 1, 1, 1,
0.5490538, 1.084183, -0.2415043, 0, 0, 1, 1, 1,
0.5561344, -0.9142911, 3.264151, 1, 0, 0, 1, 1,
0.5580277, 2.225415, 1.127441, 1, 0, 0, 1, 1,
0.558883, -0.5514955, 3.080008, 1, 0, 0, 1, 1,
0.5596947, -0.02278474, 2.825196, 1, 0, 0, 1, 1,
0.5610614, 0.6254086, 2.614349, 1, 0, 0, 1, 1,
0.5697429, 0.9455962, -2.287812, 0, 0, 0, 1, 1,
0.5728062, 0.4683241, -0.2354428, 0, 0, 0, 1, 1,
0.5742475, -1.082576, 2.377162, 0, 0, 0, 1, 1,
0.5743949, 1.228801, 0.1294745, 0, 0, 0, 1, 1,
0.5747802, 1.669839, -0.08346077, 0, 0, 0, 1, 1,
0.5773239, 1.446086, 0.3506052, 0, 0, 0, 1, 1,
0.5844252, -1.123081, 2.323363, 0, 0, 0, 1, 1,
0.5868565, 0.9432111, 0.165431, 1, 1, 1, 1, 1,
0.5876266, -0.04904675, 1.296312, 1, 1, 1, 1, 1,
0.589911, 1.637273, 0.6027887, 1, 1, 1, 1, 1,
0.5930864, -1.617433, 3.740574, 1, 1, 1, 1, 1,
0.5976491, 0.3451, 0.001983503, 1, 1, 1, 1, 1,
0.6023737, 0.3839369, 2.333153, 1, 1, 1, 1, 1,
0.6040608, -0.4640693, 2.068183, 1, 1, 1, 1, 1,
0.6061906, -0.9941385, 1.656897, 1, 1, 1, 1, 1,
0.6065708, -0.4992192, 2.099428, 1, 1, 1, 1, 1,
0.6077138, 0.1870731, 1.95542, 1, 1, 1, 1, 1,
0.6089204, -0.4374759, 1.850867, 1, 1, 1, 1, 1,
0.6105952, -1.115508, 1.451459, 1, 1, 1, 1, 1,
0.6144612, -0.2040337, 1.05211, 1, 1, 1, 1, 1,
0.6152706, 1.273038, 1.084491, 1, 1, 1, 1, 1,
0.6157343, -1.442767, 3.7955, 1, 1, 1, 1, 1,
0.6180786, 0.5022589, 0.5842972, 0, 0, 1, 1, 1,
0.6204582, -1.3002, -0.4060153, 1, 0, 0, 1, 1,
0.6216088, -0.2681037, 3.575814, 1, 0, 0, 1, 1,
0.6227356, -0.8507575, 0.667783, 1, 0, 0, 1, 1,
0.625464, 1.431486, 0.1305449, 1, 0, 0, 1, 1,
0.6255809, 0.5796812, 0.4870807, 1, 0, 0, 1, 1,
0.6261914, 0.6423823, 1.044167, 0, 0, 0, 1, 1,
0.6271832, 0.2292178, 0.7431923, 0, 0, 0, 1, 1,
0.6302751, 1.414257, -1.240674, 0, 0, 0, 1, 1,
0.6336641, -2.419992, 2.579506, 0, 0, 0, 1, 1,
0.6340499, -0.6482266, 3.369204, 0, 0, 0, 1, 1,
0.6350639, 0.503152, -0.3499838, 0, 0, 0, 1, 1,
0.6362858, 0.7039586, 0.1437216, 0, 0, 0, 1, 1,
0.638766, 1.353519, 0.4904845, 1, 1, 1, 1, 1,
0.6406306, -1.035566, 2.93759, 1, 1, 1, 1, 1,
0.6412342, 1.015622, 0.04420757, 1, 1, 1, 1, 1,
0.6421807, -1.242335, 2.520803, 1, 1, 1, 1, 1,
0.6476007, 0.6032774, 1.398976, 1, 1, 1, 1, 1,
0.6480454, 0.9213393, 0.8817688, 1, 1, 1, 1, 1,
0.6526982, 0.2604839, 1.260004, 1, 1, 1, 1, 1,
0.6541342, -2.860146, 3.578977, 1, 1, 1, 1, 1,
0.6585006, 0.2673994, -0.4721849, 1, 1, 1, 1, 1,
0.6599388, -0.7541202, 3.047767, 1, 1, 1, 1, 1,
0.6616411, 0.9282173, 0.6670772, 1, 1, 1, 1, 1,
0.6660488, -0.3661344, 1.951828, 1, 1, 1, 1, 1,
0.6705915, -1.182928, 2.286052, 1, 1, 1, 1, 1,
0.6742483, -0.5371888, 3.92496, 1, 1, 1, 1, 1,
0.6800444, 0.4447237, 0.6729372, 1, 1, 1, 1, 1,
0.6823586, -0.3742878, 1.53162, 0, 0, 1, 1, 1,
0.6825995, 0.7971259, 0.3560525, 1, 0, 0, 1, 1,
0.6878591, 1.98112, 0.7832222, 1, 0, 0, 1, 1,
0.6928452, 2.250607, -0.2442962, 1, 0, 0, 1, 1,
0.6937037, -2.585265, 4.011755, 1, 0, 0, 1, 1,
0.6969773, 1.435478, 0.9888322, 1, 0, 0, 1, 1,
0.6975613, -0.9932415, 1.689589, 0, 0, 0, 1, 1,
0.6986372, 1.920456, -0.1322255, 0, 0, 0, 1, 1,
0.7095367, -1.771199, 0.126525, 0, 0, 0, 1, 1,
0.7100208, 0.5784885, 1.261207, 0, 0, 0, 1, 1,
0.727927, -0.3258812, 2.277274, 0, 0, 0, 1, 1,
0.7289755, -0.6398279, 3.662809, 0, 0, 0, 1, 1,
0.7292329, -1.813504, 3.110739, 0, 0, 0, 1, 1,
0.7400631, 0.7663782, 1.326391, 1, 1, 1, 1, 1,
0.7438217, 1.931345, 1.099155, 1, 1, 1, 1, 1,
0.7509754, 0.04232002, 0.3681764, 1, 1, 1, 1, 1,
0.7534024, 0.4364414, 1.580288, 1, 1, 1, 1, 1,
0.7562893, 1.659899, 1.270816, 1, 1, 1, 1, 1,
0.7600777, -0.7079929, 2.438873, 1, 1, 1, 1, 1,
0.7647679, -0.6807866, 3.070684, 1, 1, 1, 1, 1,
0.7667049, -2.385723, 3.843727, 1, 1, 1, 1, 1,
0.7714257, -0.5964966, 3.423929, 1, 1, 1, 1, 1,
0.7725235, 0.5841215, 1.143023, 1, 1, 1, 1, 1,
0.7782253, -0.3271544, 3.500387, 1, 1, 1, 1, 1,
0.7798145, 0.03881744, 2.236516, 1, 1, 1, 1, 1,
0.7814399, 1.034952, 0.4540326, 1, 1, 1, 1, 1,
0.7892005, 0.5556148, 1.603863, 1, 1, 1, 1, 1,
0.7897843, 1.401267, 1.517192, 1, 1, 1, 1, 1,
0.7926695, 0.6851451, -1.372474, 0, 0, 1, 1, 1,
0.7962378, -0.4324199, 0.9250138, 1, 0, 0, 1, 1,
0.7997153, 0.04231631, 2.929046, 1, 0, 0, 1, 1,
0.8013567, -0.4679326, 3.502085, 1, 0, 0, 1, 1,
0.801603, -1.440618, 3.632879, 1, 0, 0, 1, 1,
0.8034477, -1.189016, 3.037832, 1, 0, 0, 1, 1,
0.8127721, 0.2739129, 0.8568416, 0, 0, 0, 1, 1,
0.8304535, -0.5392389, 2.363654, 0, 0, 0, 1, 1,
0.8311157, 1.280297, 0.5057495, 0, 0, 0, 1, 1,
0.8390952, -1.244076, 1.043967, 0, 0, 0, 1, 1,
0.8392593, -1.138008, 2.208872, 0, 0, 0, 1, 1,
0.8402273, -2.440364, 3.567815, 0, 0, 0, 1, 1,
0.8406084, -0.03927385, 1.417829, 0, 0, 0, 1, 1,
0.8454167, -0.3854956, 3.022901, 1, 1, 1, 1, 1,
0.8465142, -0.6293312, 2.917323, 1, 1, 1, 1, 1,
0.8479437, 0.01548168, 2.864976, 1, 1, 1, 1, 1,
0.8512555, 0.467952, 0.314552, 1, 1, 1, 1, 1,
0.8568794, -0.3721653, 1.571698, 1, 1, 1, 1, 1,
0.8576339, 0.1713821, 0.9456638, 1, 1, 1, 1, 1,
0.8577033, 0.5209321, 1.297024, 1, 1, 1, 1, 1,
0.8578912, -1.488097, 2.034417, 1, 1, 1, 1, 1,
0.8653041, 0.49382, 0.2953532, 1, 1, 1, 1, 1,
0.8657667, -2.352396, 3.66691, 1, 1, 1, 1, 1,
0.8710964, -1.131969, 2.214238, 1, 1, 1, 1, 1,
0.8731245, 0.2401457, 0.9966727, 1, 1, 1, 1, 1,
0.874953, 0.8831456, 0.8000268, 1, 1, 1, 1, 1,
0.8765522, -0.7813188, 2.465615, 1, 1, 1, 1, 1,
0.8787, -0.644311, 2.590714, 1, 1, 1, 1, 1,
0.8789133, 1.030869, 0.9834524, 0, 0, 1, 1, 1,
0.8819251, 0.2541017, 2.274545, 1, 0, 0, 1, 1,
0.8887708, 1.127074, 1.054907, 1, 0, 0, 1, 1,
0.8889278, 0.427973, 0.9708372, 1, 0, 0, 1, 1,
0.8909299, 0.8931476, 0.771215, 1, 0, 0, 1, 1,
0.9032973, 0.3898389, 0.4173562, 1, 0, 0, 1, 1,
0.9129563, -1.632717, 2.232287, 0, 0, 0, 1, 1,
0.9130505, -0.001567798, 2.39371, 0, 0, 0, 1, 1,
0.9145527, -0.03566681, 1.128496, 0, 0, 0, 1, 1,
0.915925, -0.4753672, 3.108235, 0, 0, 0, 1, 1,
0.9169188, 1.29143, 0.2463424, 0, 0, 0, 1, 1,
0.9216542, -0.002122329, 1.106132, 0, 0, 0, 1, 1,
0.9239461, -2.986645, 1.812848, 0, 0, 0, 1, 1,
0.926484, -0.6006346, 1.755201, 1, 1, 1, 1, 1,
0.9268516, -1.47802, 4.639368, 1, 1, 1, 1, 1,
0.9369922, 0.8535053, 0.3204717, 1, 1, 1, 1, 1,
0.9458458, 1.7441, 0.01816183, 1, 1, 1, 1, 1,
0.9485848, -0.7494555, 2.921771, 1, 1, 1, 1, 1,
0.9489473, -0.22186, 2.910196, 1, 1, 1, 1, 1,
0.9514162, 0.2477126, 2.208544, 1, 1, 1, 1, 1,
0.9552719, 0.5952427, 1.03687, 1, 1, 1, 1, 1,
0.958278, -0.7391658, 1.510865, 1, 1, 1, 1, 1,
0.9586039, 0.8524929, 0.6506979, 1, 1, 1, 1, 1,
0.9755919, -1.252566, 1.646441, 1, 1, 1, 1, 1,
0.9761673, -0.4434639, 2.290251, 1, 1, 1, 1, 1,
0.978196, -1.306066, 4.662245, 1, 1, 1, 1, 1,
0.9795048, 1.097344, 1.607895, 1, 1, 1, 1, 1,
0.9822763, 1.177683, -0.7039877, 1, 1, 1, 1, 1,
0.9914707, -0.5938173, 3.840553, 0, 0, 1, 1, 1,
1.001617, -1.238751, 3.791169, 1, 0, 0, 1, 1,
1.003985, 0.1742703, 1.537426, 1, 0, 0, 1, 1,
1.010458, -1.349538, 2.564392, 1, 0, 0, 1, 1,
1.018636, 0.4119275, -0.7152381, 1, 0, 0, 1, 1,
1.022184, 1.081774, 0.8429016, 1, 0, 0, 1, 1,
1.032371, 1.466219, 1.635749, 0, 0, 0, 1, 1,
1.040911, 0.382789, 0.5478286, 0, 0, 0, 1, 1,
1.041128, 1.130346, 0.5572871, 0, 0, 0, 1, 1,
1.043899, -1.640588, 3.276891, 0, 0, 0, 1, 1,
1.059495, -0.2229201, 2.590029, 0, 0, 0, 1, 1,
1.060657, 1.642446, 1.250181, 0, 0, 0, 1, 1,
1.062007, 1.669655, 0.1004946, 0, 0, 0, 1, 1,
1.063211, -1.277919, 1.340815, 1, 1, 1, 1, 1,
1.066126, 0.1009138, 1.020751, 1, 1, 1, 1, 1,
1.070924, 0.3743185, 1.677873, 1, 1, 1, 1, 1,
1.076993, -0.008656032, 1.906423, 1, 1, 1, 1, 1,
1.077989, -0.5562264, 1.873198, 1, 1, 1, 1, 1,
1.080061, 0.2035615, 3.288431, 1, 1, 1, 1, 1,
1.090003, -0.386979, 1.718631, 1, 1, 1, 1, 1,
1.095122, 0.04713647, -0.3228427, 1, 1, 1, 1, 1,
1.100802, 0.7334239, 3.80908, 1, 1, 1, 1, 1,
1.120953, -3.019711, 2.271138, 1, 1, 1, 1, 1,
1.127971, -1.527862, 2.622533, 1, 1, 1, 1, 1,
1.130653, -1.475349, 3.805037, 1, 1, 1, 1, 1,
1.136371, 1.770463, -0.1526133, 1, 1, 1, 1, 1,
1.148888, -0.3239263, 1.241002, 1, 1, 1, 1, 1,
1.1602, 0.3254671, 0.8328209, 1, 1, 1, 1, 1,
1.165256, 1.134791, -0.1477286, 0, 0, 1, 1, 1,
1.174345, -1.356199, 2.291467, 1, 0, 0, 1, 1,
1.183183, -2.044333, 2.118544, 1, 0, 0, 1, 1,
1.184948, -1.069158, 4.677569, 1, 0, 0, 1, 1,
1.185623, 1.127142, 0.789756, 1, 0, 0, 1, 1,
1.193153, -1.300508, 1.457942, 1, 0, 0, 1, 1,
1.194896, 0.5290265, 1.22947, 0, 0, 0, 1, 1,
1.199296, -1.425885, 1.784542, 0, 0, 0, 1, 1,
1.201324, 1.541107, 1.146732, 0, 0, 0, 1, 1,
1.202869, -0.8641223, 1.319738, 0, 0, 0, 1, 1,
1.203166, -0.3232366, 1.099487, 0, 0, 0, 1, 1,
1.204443, 0.1255181, 1.499063, 0, 0, 0, 1, 1,
1.210999, -2.560595, 3.353234, 0, 0, 0, 1, 1,
1.214051, -0.1451669, 1.860442, 1, 1, 1, 1, 1,
1.214372, -1.091978, -0.03904904, 1, 1, 1, 1, 1,
1.223184, -0.4367824, 0.8415143, 1, 1, 1, 1, 1,
1.223935, -1.054167, 2.676027, 1, 1, 1, 1, 1,
1.228986, -2.611657, -0.1046298, 1, 1, 1, 1, 1,
1.229164, -0.8948931, 4.125303, 1, 1, 1, 1, 1,
1.233872, 1.736993, 0.001655459, 1, 1, 1, 1, 1,
1.237425, -0.3822198, 0.5081663, 1, 1, 1, 1, 1,
1.238373, -0.05603591, 1.900005, 1, 1, 1, 1, 1,
1.241646, -1.918092, 2.056481, 1, 1, 1, 1, 1,
1.245925, 0.2123396, 1.803102, 1, 1, 1, 1, 1,
1.248053, 0.6995479, 2.619951, 1, 1, 1, 1, 1,
1.261323, -0.195615, 2.19689, 1, 1, 1, 1, 1,
1.274001, 2.469121, 0.3248669, 1, 1, 1, 1, 1,
1.274277, 0.7072713, -0.1106156, 1, 1, 1, 1, 1,
1.285861, -0.09011937, -1.224865, 0, 0, 1, 1, 1,
1.296806, -1.173857, 1.269237, 1, 0, 0, 1, 1,
1.297118, 0.4301774, 0.7425799, 1, 0, 0, 1, 1,
1.297491, -2.629164, 3.129206, 1, 0, 0, 1, 1,
1.309509, -0.7098216, 0.7056714, 1, 0, 0, 1, 1,
1.323729, 0.3484545, 2.328892, 1, 0, 0, 1, 1,
1.327931, 0.5604773, 0.6600876, 0, 0, 0, 1, 1,
1.33066, 0.5756512, 1.017392, 0, 0, 0, 1, 1,
1.335821, -1.418179, 0.3777515, 0, 0, 0, 1, 1,
1.337389, 0.5569279, 2.275899, 0, 0, 0, 1, 1,
1.339226, -1.010491, 1.235254, 0, 0, 0, 1, 1,
1.347601, -1.096353, 0.1750049, 0, 0, 0, 1, 1,
1.353311, 0.5639882, 0.2247917, 0, 0, 0, 1, 1,
1.354515, -1.718532, 1.979175, 1, 1, 1, 1, 1,
1.378069, 0.2935804, 1.835011, 1, 1, 1, 1, 1,
1.38499, 1.353328, 0.07739496, 1, 1, 1, 1, 1,
1.390329, -0.4002089, 2.453653, 1, 1, 1, 1, 1,
1.391634, 0.878884, 2.048391, 1, 1, 1, 1, 1,
1.403502, 1.195478, 1.006616, 1, 1, 1, 1, 1,
1.404748, -0.3360254, 2.660869, 1, 1, 1, 1, 1,
1.408647, -0.3516182, 2.201775, 1, 1, 1, 1, 1,
1.422039, -1.190717, 2.715167, 1, 1, 1, 1, 1,
1.425405, 0.009817628, -0.04630985, 1, 1, 1, 1, 1,
1.433171, -0.241858, 2.738153, 1, 1, 1, 1, 1,
1.45599, -1.214156, 1.875348, 1, 1, 1, 1, 1,
1.459298, -1.36504, 1.154134, 1, 1, 1, 1, 1,
1.461216, -0.1759601, 1.214707, 1, 1, 1, 1, 1,
1.461564, 0.5878782, -0.2942392, 1, 1, 1, 1, 1,
1.474794, -0.7553263, 1.080219, 0, 0, 1, 1, 1,
1.474964, 1.526602, 0.8710147, 1, 0, 0, 1, 1,
1.477029, -0.5074779, 1.372812, 1, 0, 0, 1, 1,
1.4792, 0.4501165, 1.862295, 1, 0, 0, 1, 1,
1.480715, 0.6734427, 2.29028, 1, 0, 0, 1, 1,
1.48884, 1.624115, 0.09097003, 1, 0, 0, 1, 1,
1.525433, 1.014501, 0.2139769, 0, 0, 0, 1, 1,
1.532833, 0.5042146, 1.179933, 0, 0, 0, 1, 1,
1.55488, -0.7389489, 1.394281, 0, 0, 0, 1, 1,
1.55626, 1.935681, -3.426551, 0, 0, 0, 1, 1,
1.55911, -0.6002674, 0.7620183, 0, 0, 0, 1, 1,
1.574898, -0.4954041, 1.203619, 0, 0, 0, 1, 1,
1.576931, -0.7213184, 2.03911, 0, 0, 0, 1, 1,
1.585305, 0.3791615, 0.8283259, 1, 1, 1, 1, 1,
1.593641, -0.3649294, 1.024633, 1, 1, 1, 1, 1,
1.608905, -0.6290552, 0.9166121, 1, 1, 1, 1, 1,
1.631231, -0.2626887, 1.244618, 1, 1, 1, 1, 1,
1.640941, -1.181682, 2.059957, 1, 1, 1, 1, 1,
1.641271, -1.166995, 3.714645, 1, 1, 1, 1, 1,
1.65614, -0.2945801, 0.9571291, 1, 1, 1, 1, 1,
1.656835, 0.8864781, 1.365617, 1, 1, 1, 1, 1,
1.659598, 0.3333007, -0.05701543, 1, 1, 1, 1, 1,
1.66219, -0.03266854, 3.412663, 1, 1, 1, 1, 1,
1.664462, -0.7991429, 2.38078, 1, 1, 1, 1, 1,
1.668912, 0.6430446, 0.9462713, 1, 1, 1, 1, 1,
1.676685, 1.804565, 0.7843757, 1, 1, 1, 1, 1,
1.678541, 0.9183393, 1.903486, 1, 1, 1, 1, 1,
1.682341, -1.254283, 2.092307, 1, 1, 1, 1, 1,
1.692126, 1.284716, 0.8117467, 0, 0, 1, 1, 1,
1.692832, 0.3211521, 2.666482, 1, 0, 0, 1, 1,
1.694119, -0.09216858, 2.528711, 1, 0, 0, 1, 1,
1.705898, 2.617888, -0.9990152, 1, 0, 0, 1, 1,
1.721269, 0.2427497, -1.293809, 1, 0, 0, 1, 1,
1.721565, 0.2244078, 0.7145959, 1, 0, 0, 1, 1,
1.726924, -0.4946707, 2.959693, 0, 0, 0, 1, 1,
1.731962, -0.6502106, 1.689532, 0, 0, 0, 1, 1,
1.734001, -1.212752, 2.29475, 0, 0, 0, 1, 1,
1.751409, -0.5912869, 3.342992, 0, 0, 0, 1, 1,
1.75955, -0.445429, 1.731317, 0, 0, 0, 1, 1,
1.764396, 0.5167097, 0.6862513, 0, 0, 0, 1, 1,
1.766555, -0.892488, 1.525381, 0, 0, 0, 1, 1,
1.782419, 0.184921, 0.9036343, 1, 1, 1, 1, 1,
1.805168, 0.1730285, 1.854818, 1, 1, 1, 1, 1,
1.815605, -2.969836, 2.914002, 1, 1, 1, 1, 1,
1.837845, 2.069289, 1.084575, 1, 1, 1, 1, 1,
1.857531, 0.3993814, 1.187689, 1, 1, 1, 1, 1,
1.859494, 0.07901272, 1.058055, 1, 1, 1, 1, 1,
1.860687, -2.698374, 3.594566, 1, 1, 1, 1, 1,
1.865888, 1.061108, 1.779976, 1, 1, 1, 1, 1,
1.871158, 0.4715179, 1.873969, 1, 1, 1, 1, 1,
1.877059, 0.725982, -0.390562, 1, 1, 1, 1, 1,
1.882195, -1.090142, 3.370518, 1, 1, 1, 1, 1,
1.885435, 0.006791217, 2.544771, 1, 1, 1, 1, 1,
1.889464, -0.4335146, 2.208412, 1, 1, 1, 1, 1,
1.901245, -0.1617571, 2.662571, 1, 1, 1, 1, 1,
1.961435, -1.010227, -0.1028573, 1, 1, 1, 1, 1,
1.97492, -0.2986081, 1.445981, 0, 0, 1, 1, 1,
1.980596, -0.8982366, 2.723286, 1, 0, 0, 1, 1,
1.980717, 0.3295989, 0.274067, 1, 0, 0, 1, 1,
2.054233, -0.8733619, 1.353674, 1, 0, 0, 1, 1,
2.069166, -1.04762, 2.651329, 1, 0, 0, 1, 1,
2.071031, -0.4467673, 1.737877, 1, 0, 0, 1, 1,
2.072249, -1.982905, 1.393437, 0, 0, 0, 1, 1,
2.115834, 0.5860131, 2.738551, 0, 0, 0, 1, 1,
2.233064, -1.124401, 4.312871, 0, 0, 0, 1, 1,
2.258383, -0.1538719, 1.281265, 0, 0, 0, 1, 1,
2.331382, -0.1805395, 2.012679, 0, 0, 0, 1, 1,
2.349653, 0.08460647, 1.665704, 0, 0, 0, 1, 1,
2.435915, 1.599194, 0.3652445, 0, 0, 0, 1, 1,
2.51901, 0.3379135, 2.60492, 1, 1, 1, 1, 1,
2.644245, -0.1323343, 2.177686, 1, 1, 1, 1, 1,
2.645701, 0.08121322, 2.769646, 1, 1, 1, 1, 1,
2.653299, 1.835867, 2.283993, 1, 1, 1, 1, 1,
2.701141, 0.3456646, 0.1996331, 1, 1, 1, 1, 1,
3.04373, 1.349854, 0.9131574, 1, 1, 1, 1, 1,
3.572714, -0.5691853, 2.439043, 1, 1, 1, 1, 1
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
var radius = 10.04804;
var distance = 35.29332;
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
mvMatrix.translate( -0.09239602, 0.05875468, -0.243834 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29332);
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
