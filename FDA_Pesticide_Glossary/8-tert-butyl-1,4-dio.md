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
-3.262606, -1.259998, -0.7797449, 1, 0, 0, 1,
-2.752247, -0.2705661, -1.60949, 1, 0.007843138, 0, 1,
-2.666858, 0.3302538, -2.898385, 1, 0.01176471, 0, 1,
-2.604169, 0.2131814, 0.4113363, 1, 0.01960784, 0, 1,
-2.603286, -1.042168, -3.045638, 1, 0.02352941, 0, 1,
-2.538687, -0.5591615, -2.100967, 1, 0.03137255, 0, 1,
-2.50632, 0.05578139, -1.450929, 1, 0.03529412, 0, 1,
-2.497123, -0.9742451, -1.324947, 1, 0.04313726, 0, 1,
-2.371035, -0.1944207, -1.747808, 1, 0.04705882, 0, 1,
-2.337148, 0.6566646, -1.225226, 1, 0.05490196, 0, 1,
-2.33283, -1.175583, -2.856127, 1, 0.05882353, 0, 1,
-2.286615, 0.8174142, 0.07522549, 1, 0.06666667, 0, 1,
-2.283916, 0.9899395, -0.1809179, 1, 0.07058824, 0, 1,
-2.221987, -0.6889172, -1.014049, 1, 0.07843138, 0, 1,
-2.180943, -1.563541, -1.55779, 1, 0.08235294, 0, 1,
-2.141854, -0.9756399, -2.025903, 1, 0.09019608, 0, 1,
-2.072777, -0.5930285, -1.074831, 1, 0.09411765, 0, 1,
-2.067012, -0.9880107, -2.26617, 1, 0.1019608, 0, 1,
-2.012189, 1.096577, -0.7848657, 1, 0.1098039, 0, 1,
-2.007924, 0.5953184, -0.5612381, 1, 0.1137255, 0, 1,
-1.986491, -0.1536181, -3.159664, 1, 0.1215686, 0, 1,
-1.984085, -0.6150858, -1.129974, 1, 0.1254902, 0, 1,
-1.972993, 0.5229053, -0.8360659, 1, 0.1333333, 0, 1,
-1.929317, -0.4151704, -2.944801, 1, 0.1372549, 0, 1,
-1.919642, -2.047087, -2.039657, 1, 0.145098, 0, 1,
-1.912052, 0.5587281, -1.154951, 1, 0.1490196, 0, 1,
-1.866906, 0.3862683, -1.973053, 1, 0.1568628, 0, 1,
-1.850598, -1.083114, -0.9995823, 1, 0.1607843, 0, 1,
-1.848902, -0.7956316, -2.70367, 1, 0.1686275, 0, 1,
-1.812568, 1.335537, -0.03966966, 1, 0.172549, 0, 1,
-1.807956, -0.2730958, -0.8288798, 1, 0.1803922, 0, 1,
-1.806814, -0.1750808, -0.7622112, 1, 0.1843137, 0, 1,
-1.805025, -0.4759277, -2.380066, 1, 0.1921569, 0, 1,
-1.804247, -0.6306735, -2.046562, 1, 0.1960784, 0, 1,
-1.803165, 0.486938, -3.989339, 1, 0.2039216, 0, 1,
-1.791753, -1.035377, -0.9669476, 1, 0.2117647, 0, 1,
-1.784327, 1.256617, -0.01898021, 1, 0.2156863, 0, 1,
-1.764895, 1.480697, -1.809812, 1, 0.2235294, 0, 1,
-1.761351, 0.4884457, -1.587103, 1, 0.227451, 0, 1,
-1.722506, -0.1704178, -0.8194272, 1, 0.2352941, 0, 1,
-1.713803, -0.9223939, -2.327303, 1, 0.2392157, 0, 1,
-1.702413, -1.248191, -3.325123, 1, 0.2470588, 0, 1,
-1.693965, 0.08724441, -0.6842577, 1, 0.2509804, 0, 1,
-1.68182, -0.934636, -0.8549545, 1, 0.2588235, 0, 1,
-1.675407, 0.4181363, -1.632725, 1, 0.2627451, 0, 1,
-1.67149, 1.020665, 0.7835084, 1, 0.2705882, 0, 1,
-1.667437, -0.3267054, -1.941881, 1, 0.2745098, 0, 1,
-1.667185, -0.3389629, -1.951365, 1, 0.282353, 0, 1,
-1.643336, -0.6722191, -0.6252478, 1, 0.2862745, 0, 1,
-1.61957, -0.3897559, -1.310257, 1, 0.2941177, 0, 1,
-1.614163, 1.732385, -2.617315, 1, 0.3019608, 0, 1,
-1.594482, 0.09409476, -2.441709, 1, 0.3058824, 0, 1,
-1.557822, 0.3484669, -1.996671, 1, 0.3137255, 0, 1,
-1.544716, 0.9103733, -1.774532, 1, 0.3176471, 0, 1,
-1.542082, -1.207091, -4.299047, 1, 0.3254902, 0, 1,
-1.522768, 0.4979885, -1.117653, 1, 0.3294118, 0, 1,
-1.519302, -0.4724381, -1.95896, 1, 0.3372549, 0, 1,
-1.51608, -1.372133, -3.523964, 1, 0.3411765, 0, 1,
-1.505469, -0.2186611, -1.67844, 1, 0.3490196, 0, 1,
-1.504982, 0.7279943, -1.863019, 1, 0.3529412, 0, 1,
-1.500678, -0.4329666, -2.797342, 1, 0.3607843, 0, 1,
-1.458842, 0.1736634, -3.455166, 1, 0.3647059, 0, 1,
-1.454538, -1.422748, -2.443845, 1, 0.372549, 0, 1,
-1.454409, 0.4587204, -1.714143, 1, 0.3764706, 0, 1,
-1.449401, 1.22576, -0.4596744, 1, 0.3843137, 0, 1,
-1.443972, 0.1931517, -1.063178, 1, 0.3882353, 0, 1,
-1.441066, -2.373615, -3.282356, 1, 0.3960784, 0, 1,
-1.440048, -1.899083, -3.045496, 1, 0.4039216, 0, 1,
-1.434725, -0.8020898, -2.141436, 1, 0.4078431, 0, 1,
-1.432872, 0.3414677, -0.9268914, 1, 0.4156863, 0, 1,
-1.370785, -1.00577, -1.445323, 1, 0.4196078, 0, 1,
-1.364532, -0.09408816, -0.8554959, 1, 0.427451, 0, 1,
-1.361053, -0.6846067, -1.988927, 1, 0.4313726, 0, 1,
-1.347135, -0.7520886, -1.711418, 1, 0.4392157, 0, 1,
-1.333028, 0.2707785, -1.250926, 1, 0.4431373, 0, 1,
-1.330947, -0.3671814, -0.2200159, 1, 0.4509804, 0, 1,
-1.32977, -1.037467, -1.086249, 1, 0.454902, 0, 1,
-1.313375, -1.244629, -2.802617, 1, 0.4627451, 0, 1,
-1.309271, 0.3712795, -1.079377, 1, 0.4666667, 0, 1,
-1.30552, -1.402268, -1.203781, 1, 0.4745098, 0, 1,
-1.291126, -0.1202282, -1.788334, 1, 0.4784314, 0, 1,
-1.289142, -1.090416, -2.04357, 1, 0.4862745, 0, 1,
-1.281547, -0.04477534, -0.619885, 1, 0.4901961, 0, 1,
-1.277054, -0.1258955, -2.432828, 1, 0.4980392, 0, 1,
-1.276428, 0.8030222, -0.9517539, 1, 0.5058824, 0, 1,
-1.274356, 0.09998075, -0.7482746, 1, 0.509804, 0, 1,
-1.261649, 1.158819, -2.10131, 1, 0.5176471, 0, 1,
-1.255449, 1.586305, 0.2144988, 1, 0.5215687, 0, 1,
-1.251555, -1.11086, -2.980598, 1, 0.5294118, 0, 1,
-1.24302, -1.292348, 0.4799106, 1, 0.5333334, 0, 1,
-1.24079, 0.8244695, -1.793867, 1, 0.5411765, 0, 1,
-1.238613, 0.9861937, -1.68779, 1, 0.5450981, 0, 1,
-1.238506, -0.934245, -2.75439, 1, 0.5529412, 0, 1,
-1.237288, -0.522603, -1.298513, 1, 0.5568628, 0, 1,
-1.235432, 0.4608701, -3.578158, 1, 0.5647059, 0, 1,
-1.234704, 0.3003986, -0.3897922, 1, 0.5686275, 0, 1,
-1.228566, -0.6061383, -2.594355, 1, 0.5764706, 0, 1,
-1.228454, -0.06751887, -1.441, 1, 0.5803922, 0, 1,
-1.224636, -0.3575923, -3.424576, 1, 0.5882353, 0, 1,
-1.220635, 0.4289114, -1.768444, 1, 0.5921569, 0, 1,
-1.220043, 2.330274, 0.4337497, 1, 0.6, 0, 1,
-1.216408, 0.1664986, -1.318118, 1, 0.6078432, 0, 1,
-1.206713, -1.206121, -2.061331, 1, 0.6117647, 0, 1,
-1.201155, 0.07563043, -1.79951, 1, 0.6196079, 0, 1,
-1.197399, 1.509025, -2.366828, 1, 0.6235294, 0, 1,
-1.197049, -0.6600555, -5.133476, 1, 0.6313726, 0, 1,
-1.187854, -0.6814768, -3.413417, 1, 0.6352941, 0, 1,
-1.184814, 0.01318773, -2.147333, 1, 0.6431373, 0, 1,
-1.18302, -0.4620992, -1.749166, 1, 0.6470588, 0, 1,
-1.180905, -0.2119436, -2.129411, 1, 0.654902, 0, 1,
-1.174178, -0.1464708, -2.184001, 1, 0.6588235, 0, 1,
-1.1665, -0.1038924, -0.2844157, 1, 0.6666667, 0, 1,
-1.164042, -0.6646203, -1.437622, 1, 0.6705883, 0, 1,
-1.161442, -0.2332619, 0.5050021, 1, 0.6784314, 0, 1,
-1.155823, -0.9122437, -3.049731, 1, 0.682353, 0, 1,
-1.154836, -0.2660781, 0.4396737, 1, 0.6901961, 0, 1,
-1.153625, -0.711641, -2.100441, 1, 0.6941177, 0, 1,
-1.145161, -1.94707, -2.28875, 1, 0.7019608, 0, 1,
-1.143991, 1.848099, -2.252076, 1, 0.7098039, 0, 1,
-1.138946, -0.779206, -2.346046, 1, 0.7137255, 0, 1,
-1.136093, 0.4313486, -0.4683171, 1, 0.7215686, 0, 1,
-1.129179, 0.9400828, -2.456806, 1, 0.7254902, 0, 1,
-1.127631, 0.6428916, -0.6871662, 1, 0.7333333, 0, 1,
-1.12362, 0.6600341, -1.961192, 1, 0.7372549, 0, 1,
-1.110197, 0.8947068, -1.24524, 1, 0.7450981, 0, 1,
-1.108165, -0.4513145, -1.531527, 1, 0.7490196, 0, 1,
-1.103469, 1.593485, -0.1063226, 1, 0.7568628, 0, 1,
-1.103181, -0.6776246, -4.599134, 1, 0.7607843, 0, 1,
-1.098392, -0.651126, -0.4893241, 1, 0.7686275, 0, 1,
-1.098375, -1.910978, -4.625389, 1, 0.772549, 0, 1,
-1.080872, 0.09026185, -1.684146, 1, 0.7803922, 0, 1,
-1.072381, 0.06377214, -1.063941, 1, 0.7843137, 0, 1,
-1.063505, 0.574499, -0.724672, 1, 0.7921569, 0, 1,
-1.052058, 0.6390272, -0.7240409, 1, 0.7960784, 0, 1,
-1.050996, 0.2337116, -1.039857, 1, 0.8039216, 0, 1,
-1.043786, 0.1792393, -3.004538, 1, 0.8117647, 0, 1,
-1.042907, 0.8843321, -1.369696, 1, 0.8156863, 0, 1,
-1.040676, -2.221911, -2.864316, 1, 0.8235294, 0, 1,
-1.037979, -0.552704, -2.907904, 1, 0.827451, 0, 1,
-1.036983, 0.8558365, -1.491741, 1, 0.8352941, 0, 1,
-1.031208, -1.405646, -2.554217, 1, 0.8392157, 0, 1,
-1.029928, 0.4971527, -2.058957, 1, 0.8470588, 0, 1,
-1.02701, -0.100503, -2.534194, 1, 0.8509804, 0, 1,
-1.023386, -0.09016299, -0.6189407, 1, 0.8588235, 0, 1,
-1.020564, -1.721982, -1.599777, 1, 0.8627451, 0, 1,
-1.00906, 1.772893, -0.6859701, 1, 0.8705882, 0, 1,
-1.008924, 0.8552362, -2.468866, 1, 0.8745098, 0, 1,
-1.007494, -2.110633, -2.733285, 1, 0.8823529, 0, 1,
-1.006098, -0.1563739, 0.2069378, 1, 0.8862745, 0, 1,
-1.000082, -1.147017, -2.046015, 1, 0.8941177, 0, 1,
-0.9996893, -2.301699, -3.67794, 1, 0.8980392, 0, 1,
-0.9984047, 0.1647672, -1.272672, 1, 0.9058824, 0, 1,
-0.9979172, 0.8255406, -1.876728, 1, 0.9137255, 0, 1,
-0.9930376, 1.795822, -0.6104681, 1, 0.9176471, 0, 1,
-0.9921833, -1.579837, -2.62129, 1, 0.9254902, 0, 1,
-0.9903207, -0.6541656, -1.907049, 1, 0.9294118, 0, 1,
-0.989692, 2.393693, -0.01376854, 1, 0.9372549, 0, 1,
-0.9775106, -2.004606, -2.913014, 1, 0.9411765, 0, 1,
-0.9757268, -0.7385105, -1.568817, 1, 0.9490196, 0, 1,
-0.9756716, 1.244746, -1.068898, 1, 0.9529412, 0, 1,
-0.9756656, 0.3618354, -1.527478, 1, 0.9607843, 0, 1,
-0.9736731, 1.177173, 0.1555181, 1, 0.9647059, 0, 1,
-0.9734002, -0.4352481, -0.8055065, 1, 0.972549, 0, 1,
-0.9696611, -0.4493838, -3.212989, 1, 0.9764706, 0, 1,
-0.9691895, -0.3746873, -1.58993, 1, 0.9843137, 0, 1,
-0.9689384, -0.8304335, -0.0006482549, 1, 0.9882353, 0, 1,
-0.9632712, 3.003606, -0.02248595, 1, 0.9960784, 0, 1,
-0.9528157, 0.2899001, -1.220163, 0.9960784, 1, 0, 1,
-0.9494311, -0.9055362, -2.226665, 0.9921569, 1, 0, 1,
-0.9430923, 0.7934278, -0.3440143, 0.9843137, 1, 0, 1,
-0.9348357, -1.476564, -3.345947, 0.9803922, 1, 0, 1,
-0.9333519, -0.6611585, -1.547818, 0.972549, 1, 0, 1,
-0.9325897, -0.04214118, 0.06635788, 0.9686275, 1, 0, 1,
-0.9310678, 1.424605, -1.101146, 0.9607843, 1, 0, 1,
-0.9231086, 0.1964427, -1.170615, 0.9568627, 1, 0, 1,
-0.9220433, 1.153703, 0.655982, 0.9490196, 1, 0, 1,
-0.9180123, 0.8350136, -0.7072587, 0.945098, 1, 0, 1,
-0.9179221, -0.2257153, -2.399721, 0.9372549, 1, 0, 1,
-0.9108338, -0.7442819, -1.983055, 0.9333333, 1, 0, 1,
-0.9091799, 0.5641885, -1.226215, 0.9254902, 1, 0, 1,
-0.9064639, -0.07499658, -2.755339, 0.9215686, 1, 0, 1,
-0.9020463, -0.4694349, -1.849694, 0.9137255, 1, 0, 1,
-0.8968351, -1.212323, -3.094466, 0.9098039, 1, 0, 1,
-0.8887228, -0.4891142, -2.920928, 0.9019608, 1, 0, 1,
-0.8833536, -0.1330494, -2.644417, 0.8941177, 1, 0, 1,
-0.8764026, -0.6607382, -3.199458, 0.8901961, 1, 0, 1,
-0.8761138, -0.8981704, -4.529602, 0.8823529, 1, 0, 1,
-0.8723193, -1.227874, -4.084969, 0.8784314, 1, 0, 1,
-0.871219, -1.889254, -4.151828, 0.8705882, 1, 0, 1,
-0.8692876, -0.840061, -2.07269, 0.8666667, 1, 0, 1,
-0.8684103, -0.1715611, -1.072717, 0.8588235, 1, 0, 1,
-0.8673479, -2.002852, -1.542544, 0.854902, 1, 0, 1,
-0.8666052, -1.196116, -2.117423, 0.8470588, 1, 0, 1,
-0.8594965, 0.3343221, -1.815226, 0.8431373, 1, 0, 1,
-0.8588921, 0.2908666, -0.2871219, 0.8352941, 1, 0, 1,
-0.8572958, 0.7321934, 1.697774, 0.8313726, 1, 0, 1,
-0.8563626, 0.8913738, -0.1779538, 0.8235294, 1, 0, 1,
-0.8547008, 0.4744007, 0.8269053, 0.8196079, 1, 0, 1,
-0.845189, 0.4453218, 0.2012951, 0.8117647, 1, 0, 1,
-0.8368145, -0.3147721, -1.451948, 0.8078431, 1, 0, 1,
-0.8366439, 0.6090119, -1.028764, 0.8, 1, 0, 1,
-0.834533, -0.5927334, 0.2204482, 0.7921569, 1, 0, 1,
-0.8315227, -1.424183, -3.800371, 0.7882353, 1, 0, 1,
-0.83127, 1.861266, 0.1538276, 0.7803922, 1, 0, 1,
-0.8267102, 0.7506252, 0.3002365, 0.7764706, 1, 0, 1,
-0.8238277, 0.2251548, -1.377751, 0.7686275, 1, 0, 1,
-0.816947, 0.9708384, -1.845518, 0.7647059, 1, 0, 1,
-0.8160802, 1.133626, 1.810078, 0.7568628, 1, 0, 1,
-0.8157581, 0.4283659, -2.932582, 0.7529412, 1, 0, 1,
-0.8135462, 0.4779572, -1.579684, 0.7450981, 1, 0, 1,
-0.8117021, -0.5588872, -1.759257, 0.7411765, 1, 0, 1,
-0.8067931, -0.7686185, -2.077805, 0.7333333, 1, 0, 1,
-0.8058953, 1.562296, -1.839278, 0.7294118, 1, 0, 1,
-0.8044499, 0.6491603, -1.725074, 0.7215686, 1, 0, 1,
-0.8037761, -0.9413925, -2.159523, 0.7176471, 1, 0, 1,
-0.795746, 0.1404662, -0.6989851, 0.7098039, 1, 0, 1,
-0.7933337, 2.124244, -2.057361, 0.7058824, 1, 0, 1,
-0.7928543, 0.8851131, -1.002752, 0.6980392, 1, 0, 1,
-0.7868931, 0.4350269, -1.573095, 0.6901961, 1, 0, 1,
-0.7862699, 1.994665, -0.804165, 0.6862745, 1, 0, 1,
-0.7856194, -1.218778, -3.838805, 0.6784314, 1, 0, 1,
-0.7849375, 0.1331433, -1.717917, 0.6745098, 1, 0, 1,
-0.7752632, 0.8265802, -0.6206522, 0.6666667, 1, 0, 1,
-0.7741742, -0.4831924, -1.756681, 0.6627451, 1, 0, 1,
-0.7686658, 1.439064, -1.16245, 0.654902, 1, 0, 1,
-0.7659987, 0.4216128, -1.269217, 0.6509804, 1, 0, 1,
-0.7640401, 1.993023, 1.73435, 0.6431373, 1, 0, 1,
-0.7611645, -1.207891, -3.147776, 0.6392157, 1, 0, 1,
-0.7582528, -0.5208046, -2.464832, 0.6313726, 1, 0, 1,
-0.7490948, 1.180568, -3.086886, 0.627451, 1, 0, 1,
-0.7422456, 0.5396762, -0.6322765, 0.6196079, 1, 0, 1,
-0.7415142, 0.9547647, -0.5460012, 0.6156863, 1, 0, 1,
-0.737559, 1.010963, -1.99948, 0.6078432, 1, 0, 1,
-0.7335882, -0.5776486, -2.503296, 0.6039216, 1, 0, 1,
-0.7321053, 0.6945252, -2.094721, 0.5960785, 1, 0, 1,
-0.7265689, -0.5499632, -1.530531, 0.5882353, 1, 0, 1,
-0.7259247, 1.08762, -1.783517, 0.5843138, 1, 0, 1,
-0.7235736, -2.003676, -3.473033, 0.5764706, 1, 0, 1,
-0.7209671, 0.3164956, -1.995606, 0.572549, 1, 0, 1,
-0.7181156, 1.106774, 0.8248714, 0.5647059, 1, 0, 1,
-0.7167512, 0.2737888, -1.819166, 0.5607843, 1, 0, 1,
-0.7164578, 0.3303846, -1.227478, 0.5529412, 1, 0, 1,
-0.7150148, 0.1494153, -0.8520597, 0.5490196, 1, 0, 1,
-0.7122212, -0.008633347, -0.2292695, 0.5411765, 1, 0, 1,
-0.7103669, 1.001833, -0.4866411, 0.5372549, 1, 0, 1,
-0.7092134, -1.474132, -2.858706, 0.5294118, 1, 0, 1,
-0.7063488, 2.344386, -0.9742532, 0.5254902, 1, 0, 1,
-0.7044335, 0.3546772, -0.6512308, 0.5176471, 1, 0, 1,
-0.6987984, 0.8150174, 0.5913657, 0.5137255, 1, 0, 1,
-0.6966441, 0.5058361, -1.374689, 0.5058824, 1, 0, 1,
-0.6959438, 0.9423541, -0.3028646, 0.5019608, 1, 0, 1,
-0.6898607, -0.06972189, -2.513238, 0.4941176, 1, 0, 1,
-0.6891454, 1.434419, -1.52234, 0.4862745, 1, 0, 1,
-0.6870911, -0.6216599, -4.378671, 0.4823529, 1, 0, 1,
-0.6850448, 1.403585, -0.6205729, 0.4745098, 1, 0, 1,
-0.6838248, 0.1404237, -1.827025, 0.4705882, 1, 0, 1,
-0.6832386, -1.46573, -3.296659, 0.4627451, 1, 0, 1,
-0.6788774, 0.1851834, -0.03417701, 0.4588235, 1, 0, 1,
-0.6772915, -2.008134, -2.893146, 0.4509804, 1, 0, 1,
-0.6738443, -1.136137, -2.59646, 0.4470588, 1, 0, 1,
-0.6695251, -1.446584, -2.333283, 0.4392157, 1, 0, 1,
-0.6654473, -0.7652505, -1.546735, 0.4352941, 1, 0, 1,
-0.6599492, -0.1356169, -1.511486, 0.427451, 1, 0, 1,
-0.6596563, -1.260064, -2.955621, 0.4235294, 1, 0, 1,
-0.6577706, -0.2687735, -1.383144, 0.4156863, 1, 0, 1,
-0.6530058, 0.149731, -1.45648, 0.4117647, 1, 0, 1,
-0.652806, 0.5182885, -0.6799324, 0.4039216, 1, 0, 1,
-0.652578, -1.274249, -3.546682, 0.3960784, 1, 0, 1,
-0.6499265, 0.303042, 0.5686187, 0.3921569, 1, 0, 1,
-0.6482079, -0.3555537, -2.989902, 0.3843137, 1, 0, 1,
-0.6456944, -1.637964, -3.837924, 0.3803922, 1, 0, 1,
-0.6441346, -0.5308024, -2.401421, 0.372549, 1, 0, 1,
-0.632604, -0.1773175, -2.013398, 0.3686275, 1, 0, 1,
-0.6309797, 1.032126, -0.7656346, 0.3607843, 1, 0, 1,
-0.6269208, 0.5421726, 0.1550002, 0.3568628, 1, 0, 1,
-0.6231217, -0.6796296, -2.583397, 0.3490196, 1, 0, 1,
-0.6186992, -0.2403961, -2.570237, 0.345098, 1, 0, 1,
-0.6180832, -0.4986099, -3.974841, 0.3372549, 1, 0, 1,
-0.6173701, 0.4026746, -0.7723354, 0.3333333, 1, 0, 1,
-0.6159976, -0.3127728, -1.900781, 0.3254902, 1, 0, 1,
-0.6139987, -0.7339729, -1.396368, 0.3215686, 1, 0, 1,
-0.6125029, -0.516469, -3.456762, 0.3137255, 1, 0, 1,
-0.6121628, 0.2892942, -1.035302, 0.3098039, 1, 0, 1,
-0.6058241, 2.393215, 0.03820891, 0.3019608, 1, 0, 1,
-0.6054929, -0.817262, -2.705749, 0.2941177, 1, 0, 1,
-0.5973446, 0.8329977, -2.608091, 0.2901961, 1, 0, 1,
-0.5951838, -0.811716, -3.245163, 0.282353, 1, 0, 1,
-0.590067, 0.8928562, -0.8111544, 0.2784314, 1, 0, 1,
-0.589729, -1.380093, -1.629953, 0.2705882, 1, 0, 1,
-0.5896816, 1.077287, 0.1137724, 0.2666667, 1, 0, 1,
-0.5856675, -0.3888298, -2.27869, 0.2588235, 1, 0, 1,
-0.5831987, -1.045847, -1.990831, 0.254902, 1, 0, 1,
-0.5758008, 0.0822989, -0.6271482, 0.2470588, 1, 0, 1,
-0.5731061, -0.6405813, 0.129904, 0.2431373, 1, 0, 1,
-0.5699589, -0.03555189, -0.1853376, 0.2352941, 1, 0, 1,
-0.5680426, -0.503253, -2.276393, 0.2313726, 1, 0, 1,
-0.5650944, 0.4770695, -1.001242, 0.2235294, 1, 0, 1,
-0.5638514, -0.7788515, -2.246685, 0.2196078, 1, 0, 1,
-0.5569729, -1.268206, -2.126293, 0.2117647, 1, 0, 1,
-0.5566652, 1.624159, 0.6656032, 0.2078431, 1, 0, 1,
-0.5554312, 0.3533224, 0.2171303, 0.2, 1, 0, 1,
-0.5552298, -0.3031452, -1.152622, 0.1921569, 1, 0, 1,
-0.5507027, -1.615403, -2.698943, 0.1882353, 1, 0, 1,
-0.5497541, 0.9096845, -0.1449205, 0.1803922, 1, 0, 1,
-0.5497276, 0.1659164, -2.808922, 0.1764706, 1, 0, 1,
-0.5477857, -1.04651, -3.398368, 0.1686275, 1, 0, 1,
-0.5470966, -0.1138962, -2.046509, 0.1647059, 1, 0, 1,
-0.5465187, -0.44069, -2.915246, 0.1568628, 1, 0, 1,
-0.5457998, 1.877724, 1.829194, 0.1529412, 1, 0, 1,
-0.5389834, -0.1594125, -1.634015, 0.145098, 1, 0, 1,
-0.5379187, -1.48129, -1.290462, 0.1411765, 1, 0, 1,
-0.5360363, 0.180796, -1.49194, 0.1333333, 1, 0, 1,
-0.5358683, 0.3349844, -1.445168, 0.1294118, 1, 0, 1,
-0.5351033, -0.5219523, -1.445308, 0.1215686, 1, 0, 1,
-0.5333309, 2.281488, -0.3075905, 0.1176471, 1, 0, 1,
-0.5328459, 0.09455997, -3.025934, 0.1098039, 1, 0, 1,
-0.5322179, -0.3501058, -1.027854, 0.1058824, 1, 0, 1,
-0.5272816, 0.380567, -0.5305787, 0.09803922, 1, 0, 1,
-0.5259117, -0.7912959, -2.232471, 0.09019608, 1, 0, 1,
-0.5198113, 1.601535, 1.175213, 0.08627451, 1, 0, 1,
-0.5170548, -0.4967716, -2.751072, 0.07843138, 1, 0, 1,
-0.5154887, 2.255472, 0.002889449, 0.07450981, 1, 0, 1,
-0.5095287, 0.1934878, -0.2360463, 0.06666667, 1, 0, 1,
-0.5084979, -0.4454672, -2.91389, 0.0627451, 1, 0, 1,
-0.503321, -1.903998, -3.670769, 0.05490196, 1, 0, 1,
-0.5005863, -0.8130304, -2.946986, 0.05098039, 1, 0, 1,
-0.4994791, 0.8289912, 0.03223964, 0.04313726, 1, 0, 1,
-0.4956665, -1.651467, -3.092288, 0.03921569, 1, 0, 1,
-0.4905488, -0.06686896, -2.427577, 0.03137255, 1, 0, 1,
-0.4879769, 0.1874021, -1.791875, 0.02745098, 1, 0, 1,
-0.4834899, 1.637589, 0.3590084, 0.01960784, 1, 0, 1,
-0.4829868, 1.982674, -1.112428, 0.01568628, 1, 0, 1,
-0.4825467, 0.2898853, -1.414928, 0.007843138, 1, 0, 1,
-0.4763725, -0.03152537, -1.051765, 0.003921569, 1, 0, 1,
-0.4761393, -0.8516635, -3.107719, 0, 1, 0.003921569, 1,
-0.4733377, 0.4676729, -1.46515, 0, 1, 0.01176471, 1,
-0.4621028, 0.5206963, -1.090693, 0, 1, 0.01568628, 1,
-0.4614541, -0.01217292, -1.698863, 0, 1, 0.02352941, 1,
-0.4611634, 0.9834395, -0.3436057, 0, 1, 0.02745098, 1,
-0.4609637, -0.3738169, -1.839254, 0, 1, 0.03529412, 1,
-0.4592442, -0.5496475, -1.445616, 0, 1, 0.03921569, 1,
-0.45848, 1.564703, 0.3469352, 0, 1, 0.04705882, 1,
-0.4539933, -0.5894994, -4.391108, 0, 1, 0.05098039, 1,
-0.4519733, -0.6635936, -2.59023, 0, 1, 0.05882353, 1,
-0.4485737, -0.7243655, -1.310333, 0, 1, 0.0627451, 1,
-0.4476774, 0.1282542, -1.580759, 0, 1, 0.07058824, 1,
-0.4371539, -1.422491, -3.017454, 0, 1, 0.07450981, 1,
-0.425435, -0.3116359, -0.382219, 0, 1, 0.08235294, 1,
-0.423894, -2.152049, -2.487462, 0, 1, 0.08627451, 1,
-0.4215658, 0.740867, -0.8685817, 0, 1, 0.09411765, 1,
-0.4136282, 1.626533, -1.913468, 0, 1, 0.1019608, 1,
-0.4038385, -1.068782, -3.786504, 0, 1, 0.1058824, 1,
-0.3956383, -0.4137255, -1.909985, 0, 1, 0.1137255, 1,
-0.394124, 0.2994305, -0.3473939, 0, 1, 0.1176471, 1,
-0.3897885, 0.009557054, -0.799808, 0, 1, 0.1254902, 1,
-0.3879673, 1.334859, -0.4216951, 0, 1, 0.1294118, 1,
-0.3846188, 0.1200229, -0.9172022, 0, 1, 0.1372549, 1,
-0.3758505, 0.06106903, -1.103108, 0, 1, 0.1411765, 1,
-0.3718612, 0.3826779, -0.5888301, 0, 1, 0.1490196, 1,
-0.3697684, -0.1915852, -1.887466, 0, 1, 0.1529412, 1,
-0.3674388, -0.7352367, -3.238164, 0, 1, 0.1607843, 1,
-0.364179, -0.2279934, -1.857759, 0, 1, 0.1647059, 1,
-0.3557303, -0.1357709, -3.017236, 0, 1, 0.172549, 1,
-0.3509975, -0.07289197, -1.801623, 0, 1, 0.1764706, 1,
-0.3469526, 1.063553, 0.14917, 0, 1, 0.1843137, 1,
-0.3440419, -0.4530435, -4.103424, 0, 1, 0.1882353, 1,
-0.3409322, 0.4766112, -1.147509, 0, 1, 0.1960784, 1,
-0.3401236, -0.2448304, -2.448472, 0, 1, 0.2039216, 1,
-0.3368107, 1.090589, 0.5658636, 0, 1, 0.2078431, 1,
-0.3302988, 0.9853917, -2.428632, 0, 1, 0.2156863, 1,
-0.3289247, -0.9239847, -2.170444, 0, 1, 0.2196078, 1,
-0.3106801, -0.1082285, -3.027988, 0, 1, 0.227451, 1,
-0.3072932, -0.6481181, -3.447512, 0, 1, 0.2313726, 1,
-0.3069766, -1.135767, -2.609899, 0, 1, 0.2392157, 1,
-0.2960524, 1.296358, -0.5556761, 0, 1, 0.2431373, 1,
-0.2934318, 0.9260709, -0.4010369, 0, 1, 0.2509804, 1,
-0.2928218, 1.936521, 0.5499294, 0, 1, 0.254902, 1,
-0.291606, -0.5023612, -0.5034439, 0, 1, 0.2627451, 1,
-0.2907444, -0.3438143, -3.440706, 0, 1, 0.2666667, 1,
-0.2905198, -1.160293, -3.265707, 0, 1, 0.2745098, 1,
-0.2901623, -0.05845611, -0.593942, 0, 1, 0.2784314, 1,
-0.290154, -0.03553003, -2.253354, 0, 1, 0.2862745, 1,
-0.2871735, 0.4751763, -0.1535569, 0, 1, 0.2901961, 1,
-0.2841268, 1.106262, -1.832873, 0, 1, 0.2980392, 1,
-0.2797959, -0.1197275, -0.5318226, 0, 1, 0.3058824, 1,
-0.2753395, 1.274137, -0.9992694, 0, 1, 0.3098039, 1,
-0.2728024, -0.8917825, -2.217368, 0, 1, 0.3176471, 1,
-0.2723051, 1.287416, -0.2024323, 0, 1, 0.3215686, 1,
-0.2688273, -1.23167, -1.741329, 0, 1, 0.3294118, 1,
-0.2677014, 0.1028431, -0.07548748, 0, 1, 0.3333333, 1,
-0.2618066, 1.197027, -0.1956711, 0, 1, 0.3411765, 1,
-0.2573799, 0.9130077, 0.3059525, 0, 1, 0.345098, 1,
-0.2563168, 1.385191, -1.007383, 0, 1, 0.3529412, 1,
-0.2519439, -2.080736, -1.229088, 0, 1, 0.3568628, 1,
-0.2508588, -0.6335664, -2.478907, 0, 1, 0.3647059, 1,
-0.2396635, 0.8302798, 0.2496745, 0, 1, 0.3686275, 1,
-0.2390972, 0.2013828, -0.06478453, 0, 1, 0.3764706, 1,
-0.2385728, 1.864028, -1.145705, 0, 1, 0.3803922, 1,
-0.2379515, -0.1762971, -2.464161, 0, 1, 0.3882353, 1,
-0.2322694, 0.1918136, -1.008546, 0, 1, 0.3921569, 1,
-0.2271184, 0.5438159, -1.694261, 0, 1, 0.4, 1,
-0.2270562, -0.8717433, -2.4778, 0, 1, 0.4078431, 1,
-0.2269863, -0.648005, -2.085232, 0, 1, 0.4117647, 1,
-0.2260682, 0.936352, -1.270455, 0, 1, 0.4196078, 1,
-0.2259996, -0.2314576, -4.244812, 0, 1, 0.4235294, 1,
-0.2230284, 0.859284, 0.05459837, 0, 1, 0.4313726, 1,
-0.2198386, 0.273872, -0.1592345, 0, 1, 0.4352941, 1,
-0.2183643, 0.287746, -1.497455, 0, 1, 0.4431373, 1,
-0.2172122, 0.4994633, -2.138653, 0, 1, 0.4470588, 1,
-0.2168825, 0.3971143, -1.985216, 0, 1, 0.454902, 1,
-0.2158681, 0.4266494, -1.416487, 0, 1, 0.4588235, 1,
-0.2144055, 0.3431948, 1.74866, 0, 1, 0.4666667, 1,
-0.2139511, 1.04795, -0.797222, 0, 1, 0.4705882, 1,
-0.2116959, 0.5417792, -0.4264338, 0, 1, 0.4784314, 1,
-0.2104764, -1.21872, -3.569697, 0, 1, 0.4823529, 1,
-0.2081309, -2.1912, -1.308293, 0, 1, 0.4901961, 1,
-0.2016406, -0.8994912, -2.020143, 0, 1, 0.4941176, 1,
-0.1995602, -0.9541314, -2.050151, 0, 1, 0.5019608, 1,
-0.1995236, -0.1321404, -1.631056, 0, 1, 0.509804, 1,
-0.1994099, 1.355426, 0.06334072, 0, 1, 0.5137255, 1,
-0.1992222, 0.1145611, -0.261236, 0, 1, 0.5215687, 1,
-0.1982583, 1.419675, 0.1554948, 0, 1, 0.5254902, 1,
-0.1956343, -1.163355, -3.241888, 0, 1, 0.5333334, 1,
-0.1929005, -0.5421697, 0.1070972, 0, 1, 0.5372549, 1,
-0.1922211, 1.316665, -0.5880084, 0, 1, 0.5450981, 1,
-0.1847433, 1.598117, -1.725383, 0, 1, 0.5490196, 1,
-0.1804892, -0.9485505, -4.288181, 0, 1, 0.5568628, 1,
-0.1801614, -0.7973453, -3.892148, 0, 1, 0.5607843, 1,
-0.1775899, 0.665498, 0.4348538, 0, 1, 0.5686275, 1,
-0.1733894, -0.0757484, -1.662617, 0, 1, 0.572549, 1,
-0.1731876, 0.1408058, -0.8683881, 0, 1, 0.5803922, 1,
-0.1715961, 0.6760744, -0.008712683, 0, 1, 0.5843138, 1,
-0.1693681, -1.236886, -2.554549, 0, 1, 0.5921569, 1,
-0.1670957, -0.7613866, -2.676028, 0, 1, 0.5960785, 1,
-0.1640529, 0.7587595, 0.2278497, 0, 1, 0.6039216, 1,
-0.1617155, 0.8076417, -2.362485, 0, 1, 0.6117647, 1,
-0.1527746, 1.90382, -0.7147663, 0, 1, 0.6156863, 1,
-0.1436522, 0.3271019, -2.049182, 0, 1, 0.6235294, 1,
-0.1411897, 0.713263, -1.593932, 0, 1, 0.627451, 1,
-0.1404835, 0.3772875, -0.5718191, 0, 1, 0.6352941, 1,
-0.1404077, 1.066707, 0.01435612, 0, 1, 0.6392157, 1,
-0.1395009, 1.363265, -0.02183708, 0, 1, 0.6470588, 1,
-0.1363981, -0.541527, -3.200802, 0, 1, 0.6509804, 1,
-0.1348726, -0.3258282, -2.291798, 0, 1, 0.6588235, 1,
-0.1343779, -0.5083785, -3.190546, 0, 1, 0.6627451, 1,
-0.1336113, -0.6656484, -5.468515, 0, 1, 0.6705883, 1,
-0.1240896, -0.5232811, -3.197741, 0, 1, 0.6745098, 1,
-0.1239249, -0.8054133, -1.37245, 0, 1, 0.682353, 1,
-0.1235377, 0.6097382, -1.343548, 0, 1, 0.6862745, 1,
-0.1211123, 0.5402223, -0.1281357, 0, 1, 0.6941177, 1,
-0.1190424, 0.2286774, 0.01643629, 0, 1, 0.7019608, 1,
-0.117487, 0.2796113, -0.6214002, 0, 1, 0.7058824, 1,
-0.1154622, 0.3393074, -0.3508381, 0, 1, 0.7137255, 1,
-0.1135739, -0.2530523, -3.808786, 0, 1, 0.7176471, 1,
-0.1121623, 0.009338962, -0.9233685, 0, 1, 0.7254902, 1,
-0.1002844, -2.087367, -2.815744, 0, 1, 0.7294118, 1,
-0.09791382, -0.2111451, -2.654763, 0, 1, 0.7372549, 1,
-0.09653254, -1.878678, -2.688228, 0, 1, 0.7411765, 1,
-0.09349964, 0.07825778, -1.42796, 0, 1, 0.7490196, 1,
-0.09050966, -1.062029, -3.985049, 0, 1, 0.7529412, 1,
-0.08560984, 0.1585676, 0.1231541, 0, 1, 0.7607843, 1,
-0.08522896, -0.980982, -1.258432, 0, 1, 0.7647059, 1,
-0.08406731, -1.148403, -1.739429, 0, 1, 0.772549, 1,
-0.08382995, 0.6931981, 0.4454599, 0, 1, 0.7764706, 1,
-0.08128669, 0.4208799, 1.279607, 0, 1, 0.7843137, 1,
-0.07969886, -0.6280949, -4.796211, 0, 1, 0.7882353, 1,
-0.07953062, -0.2095202, -2.920006, 0, 1, 0.7960784, 1,
-0.07765933, 0.5142316, 1.510484, 0, 1, 0.8039216, 1,
-0.07587382, 1.148349, 0.9973761, 0, 1, 0.8078431, 1,
-0.07403909, 1.632751, 0.5012667, 0, 1, 0.8156863, 1,
-0.0720567, 0.5492151, 1.808715, 0, 1, 0.8196079, 1,
-0.06821845, -0.4233919, -2.63471, 0, 1, 0.827451, 1,
-0.06316575, -0.6290833, -2.93786, 0, 1, 0.8313726, 1,
-0.06180118, 0.1780783, -1.07433, 0, 1, 0.8392157, 1,
-0.061189, -0.3027689, -3.410074, 0, 1, 0.8431373, 1,
-0.06110599, 0.9086634, 1.120524, 0, 1, 0.8509804, 1,
-0.05764895, 1.426908, 0.6495568, 0, 1, 0.854902, 1,
-0.0548529, 0.3325373, -0.005070592, 0, 1, 0.8627451, 1,
-0.05197501, 1.293376, -0.08924296, 0, 1, 0.8666667, 1,
-0.05137891, -0.1929698, -3.035193, 0, 1, 0.8745098, 1,
-0.0505879, 1.825057, -0.5033145, 0, 1, 0.8784314, 1,
-0.05057871, -0.7424213, -3.713128, 0, 1, 0.8862745, 1,
-0.04934771, 1.124746, 0.2762146, 0, 1, 0.8901961, 1,
-0.04661248, -0.6472183, -4.228099, 0, 1, 0.8980392, 1,
-0.04644848, 0.7920902, -0.7157982, 0, 1, 0.9058824, 1,
-0.04569345, 0.796109, -0.9748829, 0, 1, 0.9098039, 1,
-0.04543839, 0.4913731, 0.5664696, 0, 1, 0.9176471, 1,
-0.04272932, 0.5546005, -0.4963888, 0, 1, 0.9215686, 1,
-0.0416837, 0.6852381, 1.215136, 0, 1, 0.9294118, 1,
-0.03361898, -0.06108268, -3.329387, 0, 1, 0.9333333, 1,
-0.03018909, -1.022417, -3.642902, 0, 1, 0.9411765, 1,
-0.02967848, -0.4606626, -3.269321, 0, 1, 0.945098, 1,
-0.02467973, 0.06004504, 0.3361211, 0, 1, 0.9529412, 1,
-0.02072143, 0.3781219, -0.4736961, 0, 1, 0.9568627, 1,
-0.01982467, -0.5648302, -4.620961, 0, 1, 0.9647059, 1,
-0.0178999, 0.4322569, -0.01436382, 0, 1, 0.9686275, 1,
-0.01544283, 0.4969607, -0.2437785, 0, 1, 0.9764706, 1,
-0.01124467, 2.066566, -0.6990099, 0, 1, 0.9803922, 1,
-0.008105805, 0.6882526, -0.6912923, 0, 1, 0.9882353, 1,
-0.006714828, -1.325817, -2.03125, 0, 1, 0.9921569, 1,
-0.006699627, 0.7641479, 0.4333612, 0, 1, 1, 1,
-0.005333358, 0.2868296, -1.533046, 0, 0.9921569, 1, 1,
-0.003169702, 0.3873897, 0.4581094, 0, 0.9882353, 1, 1,
0.001300561, 1.446369, 0.966709, 0, 0.9803922, 1, 1,
0.003653792, -0.08295523, 1.473534, 0, 0.9764706, 1, 1,
0.008603139, 1.056496, -0.4354282, 0, 0.9686275, 1, 1,
0.01263996, -1.040513, 3.237035, 0, 0.9647059, 1, 1,
0.01395477, 1.363759, 0.9102834, 0, 0.9568627, 1, 1,
0.01492088, -0.434943, 3.976086, 0, 0.9529412, 1, 1,
0.02048154, -1.517893, 1.72398, 0, 0.945098, 1, 1,
0.02165295, -0.03039001, 3.421538, 0, 0.9411765, 1, 1,
0.02324327, -0.1904193, 3.572493, 0, 0.9333333, 1, 1,
0.02438148, -0.2477527, 3.171726, 0, 0.9294118, 1, 1,
0.02468668, 1.392319, 0.2136311, 0, 0.9215686, 1, 1,
0.02705121, -0.1821411, 2.97681, 0, 0.9176471, 1, 1,
0.02826104, -0.1710218, 2.412122, 0, 0.9098039, 1, 1,
0.03025593, -0.9057554, 3.103201, 0, 0.9058824, 1, 1,
0.03391102, 0.3481581, -0.2968398, 0, 0.8980392, 1, 1,
0.0346933, -0.4748778, 1.388545, 0, 0.8901961, 1, 1,
0.03482221, 0.05313237, 1.063591, 0, 0.8862745, 1, 1,
0.03694254, 1.088259, -0.6236127, 0, 0.8784314, 1, 1,
0.03711877, -0.02107374, 0.8990651, 0, 0.8745098, 1, 1,
0.03723309, 1.25506, -0.7721109, 0, 0.8666667, 1, 1,
0.04033629, 0.3311547, -0.9984502, 0, 0.8627451, 1, 1,
0.04434508, -1.060079, 1.861387, 0, 0.854902, 1, 1,
0.04537259, -0.5842429, 2.572489, 0, 0.8509804, 1, 1,
0.04937048, -0.9787378, 3.633824, 0, 0.8431373, 1, 1,
0.05179869, -1.071634, 4.947713, 0, 0.8392157, 1, 1,
0.0543998, -0.2259644, 2.017802, 0, 0.8313726, 1, 1,
0.06036172, -1.108003, 2.435398, 0, 0.827451, 1, 1,
0.06101728, -0.4238814, 2.556692, 0, 0.8196079, 1, 1,
0.06439371, 1.518734, 1.48142, 0, 0.8156863, 1, 1,
0.07355713, 0.5818982, 0.0215104, 0, 0.8078431, 1, 1,
0.07461592, 0.4984028, -0.3307478, 0, 0.8039216, 1, 1,
0.07544817, 0.5427698, -0.9081854, 0, 0.7960784, 1, 1,
0.07565694, -0.7061431, 5.769938, 0, 0.7882353, 1, 1,
0.07792334, -0.7282548, 3.440158, 0, 0.7843137, 1, 1,
0.08092457, -1.636581, 1.280904, 0, 0.7764706, 1, 1,
0.08527441, -0.8985631, 3.857584, 0, 0.772549, 1, 1,
0.08731434, 0.9428177, 0.02032875, 0, 0.7647059, 1, 1,
0.08734027, -0.3090058, 3.898385, 0, 0.7607843, 1, 1,
0.08772902, 0.385181, 0.3519171, 0, 0.7529412, 1, 1,
0.08790853, -1.743707, 1.805762, 0, 0.7490196, 1, 1,
0.09217186, -0.481243, 1.072967, 0, 0.7411765, 1, 1,
0.09258752, 0.6746548, -0.8064393, 0, 0.7372549, 1, 1,
0.09603854, -0.7778019, 3.278347, 0, 0.7294118, 1, 1,
0.09644325, 0.8570709, 0.5070172, 0, 0.7254902, 1, 1,
0.09863397, -0.3121089, 1.801679, 0, 0.7176471, 1, 1,
0.1003199, -1.105899, 3.032036, 0, 0.7137255, 1, 1,
0.1023147, 0.4142909, 0.8951809, 0, 0.7058824, 1, 1,
0.1053014, 0.1201116, 1.211063, 0, 0.6980392, 1, 1,
0.1058763, 1.428538, 0.3433419, 0, 0.6941177, 1, 1,
0.1062799, 0.2626604, -1.091893, 0, 0.6862745, 1, 1,
0.1079356, -0.6747948, 4.43164, 0, 0.682353, 1, 1,
0.1159306, 0.2838862, 0.4258311, 0, 0.6745098, 1, 1,
0.1180349, 1.568887, 0.4464971, 0, 0.6705883, 1, 1,
0.120325, -2.064593, 3.225581, 0, 0.6627451, 1, 1,
0.1262527, 0.1346145, 2.529551, 0, 0.6588235, 1, 1,
0.127555, 0.638336, 0.4066517, 0, 0.6509804, 1, 1,
0.1306471, -0.560477, 3.497348, 0, 0.6470588, 1, 1,
0.1332703, 0.2949546, -1.080068, 0, 0.6392157, 1, 1,
0.134678, -1.955174, 2.211445, 0, 0.6352941, 1, 1,
0.1381833, -0.1739378, 2.958833, 0, 0.627451, 1, 1,
0.1424798, 0.4044327, 1.280382, 0, 0.6235294, 1, 1,
0.1435892, -0.8934518, 1.618228, 0, 0.6156863, 1, 1,
0.1485035, -1.148842, 4.08779, 0, 0.6117647, 1, 1,
0.1536647, -0.4530609, 3.269893, 0, 0.6039216, 1, 1,
0.1551495, -0.03190754, 4.782315, 0, 0.5960785, 1, 1,
0.1552738, -0.1297161, 1.964601, 0, 0.5921569, 1, 1,
0.1634315, 1.010745, 0.4383902, 0, 0.5843138, 1, 1,
0.1673485, 1.069022, -0.009058383, 0, 0.5803922, 1, 1,
0.1694379, 0.1431328, 0.7591395, 0, 0.572549, 1, 1,
0.1718987, -0.7542406, 3.085924, 0, 0.5686275, 1, 1,
0.1722692, 0.5216447, 0.4952614, 0, 0.5607843, 1, 1,
0.1764988, -0.6253148, 3.787186, 0, 0.5568628, 1, 1,
0.1767969, 0.4207711, 0.6671708, 0, 0.5490196, 1, 1,
0.1838543, 1.444607, 1.275912, 0, 0.5450981, 1, 1,
0.1871041, -0.8688557, 4.114306, 0, 0.5372549, 1, 1,
0.2037005, -0.01645368, 1.188793, 0, 0.5333334, 1, 1,
0.2077215, -1.155015, 1.894977, 0, 0.5254902, 1, 1,
0.2103808, 0.927876, -0.02430401, 0, 0.5215687, 1, 1,
0.2125499, 0.9908689, -0.04241484, 0, 0.5137255, 1, 1,
0.2158139, 0.4158181, 0.5089984, 0, 0.509804, 1, 1,
0.217966, 0.3480936, -0.2231355, 0, 0.5019608, 1, 1,
0.2192021, -0.6705179, 0.538468, 0, 0.4941176, 1, 1,
0.2254888, 0.05978092, 0.07651392, 0, 0.4901961, 1, 1,
0.2254898, -1.102854, 3.657901, 0, 0.4823529, 1, 1,
0.2267872, -0.8789005, 3.92862, 0, 0.4784314, 1, 1,
0.2303664, -0.06329852, 1.228395, 0, 0.4705882, 1, 1,
0.2306381, -0.614476, 2.44041, 0, 0.4666667, 1, 1,
0.2320484, 0.6594473, -0.4470279, 0, 0.4588235, 1, 1,
0.2324223, -0.4031799, 0.6145836, 0, 0.454902, 1, 1,
0.2325962, -0.6112598, 2.262758, 0, 0.4470588, 1, 1,
0.2360387, 0.7039958, 0.9690577, 0, 0.4431373, 1, 1,
0.2396984, 1.327664, 1.686751, 0, 0.4352941, 1, 1,
0.2435602, 1.021174, -0.6785095, 0, 0.4313726, 1, 1,
0.2448947, -0.8524402, 2.627738, 0, 0.4235294, 1, 1,
0.2470862, 0.08464298, 0.1108083, 0, 0.4196078, 1, 1,
0.2480423, 1.085673, 0.9635719, 0, 0.4117647, 1, 1,
0.2539694, 0.03395852, 1.818063, 0, 0.4078431, 1, 1,
0.2554572, -1.649604, 2.889279, 0, 0.4, 1, 1,
0.2560172, 0.1517844, -0.6614817, 0, 0.3921569, 1, 1,
0.2562537, -1.42145, 3.62505, 0, 0.3882353, 1, 1,
0.2565666, -0.9184273, 1.557275, 0, 0.3803922, 1, 1,
0.2675768, 0.8353494, 4.138714, 0, 0.3764706, 1, 1,
0.2797683, 0.3773489, 2.311591, 0, 0.3686275, 1, 1,
0.2818238, -0.1489163, 3.006857, 0, 0.3647059, 1, 1,
0.2843872, -1.33411, 1.799044, 0, 0.3568628, 1, 1,
0.2895784, -0.5138379, 2.289958, 0, 0.3529412, 1, 1,
0.2899867, 0.05256607, 1.235958, 0, 0.345098, 1, 1,
0.2908773, 1.939663, 1.049398, 0, 0.3411765, 1, 1,
0.2928853, 0.857943, 0.4554048, 0, 0.3333333, 1, 1,
0.2941003, 1.272713, -0.7046192, 0, 0.3294118, 1, 1,
0.2966616, 1.314893, -0.5545177, 0, 0.3215686, 1, 1,
0.2983623, 0.3371398, 0.5690729, 0, 0.3176471, 1, 1,
0.3001093, 1.263493, 1.225522, 0, 0.3098039, 1, 1,
0.3060015, 0.5243447, 0.9016659, 0, 0.3058824, 1, 1,
0.3063199, 0.3046434, 1.843684, 0, 0.2980392, 1, 1,
0.3167233, -1.141039, 3.831565, 0, 0.2901961, 1, 1,
0.3170103, 0.3471571, 1.808548, 0, 0.2862745, 1, 1,
0.321552, -0.9623623, 1.62775, 0, 0.2784314, 1, 1,
0.3262282, 0.4998538, 1.096159, 0, 0.2745098, 1, 1,
0.3281175, -0.3707615, 3.681989, 0, 0.2666667, 1, 1,
0.3282849, 1.057597, 0.5001006, 0, 0.2627451, 1, 1,
0.329744, -0.05424865, 1.870268, 0, 0.254902, 1, 1,
0.332072, 0.145008, -0.1368947, 0, 0.2509804, 1, 1,
0.3335057, -1.790798, 4.106656, 0, 0.2431373, 1, 1,
0.33483, -1.099984, 0.6779064, 0, 0.2392157, 1, 1,
0.3436308, 1.553787, -0.3362584, 0, 0.2313726, 1, 1,
0.3436686, -0.6888801, 2.406212, 0, 0.227451, 1, 1,
0.3461888, -0.4074657, 2.784907, 0, 0.2196078, 1, 1,
0.3502046, 0.3640212, 1.398145, 0, 0.2156863, 1, 1,
0.3510573, -0.2786256, 3.169081, 0, 0.2078431, 1, 1,
0.3517182, 0.2850235, 2.838524, 0, 0.2039216, 1, 1,
0.3520987, -0.7315224, 3.242448, 0, 0.1960784, 1, 1,
0.3526843, 0.1109787, 1.963824, 0, 0.1882353, 1, 1,
0.3576952, -0.261748, 3.361414, 0, 0.1843137, 1, 1,
0.3615802, 0.02416376, 0.3804152, 0, 0.1764706, 1, 1,
0.3659748, 0.9430277, -1.21981, 0, 0.172549, 1, 1,
0.3673299, 0.4183866, 0.8445683, 0, 0.1647059, 1, 1,
0.3726714, 1.642625, -0.469202, 0, 0.1607843, 1, 1,
0.3760349, -1.271692, 2.676476, 0, 0.1529412, 1, 1,
0.3786651, 0.6028945, 0.7187963, 0, 0.1490196, 1, 1,
0.3797722, -1.108287, 2.828143, 0, 0.1411765, 1, 1,
0.3859961, -1.39206, 2.529069, 0, 0.1372549, 1, 1,
0.3894316, 0.1362822, 0.999101, 0, 0.1294118, 1, 1,
0.3968679, -1.292335, 2.633106, 0, 0.1254902, 1, 1,
0.3978383, -0.2270631, 4.045493, 0, 0.1176471, 1, 1,
0.3992656, 1.169139, 0.1807206, 0, 0.1137255, 1, 1,
0.4003517, -0.2079132, 0.6452609, 0, 0.1058824, 1, 1,
0.4007813, -0.7371024, 2.998448, 0, 0.09803922, 1, 1,
0.4076261, -0.7704095, 2.63284, 0, 0.09411765, 1, 1,
0.4086374, 2.064161, 0.9361776, 0, 0.08627451, 1, 1,
0.4102747, -0.02838881, 2.379211, 0, 0.08235294, 1, 1,
0.4156805, -1.496515, 2.932291, 0, 0.07450981, 1, 1,
0.4198725, 1.450275, -2.040505, 0, 0.07058824, 1, 1,
0.4203243, 2.251717, 1.432816, 0, 0.0627451, 1, 1,
0.4216321, -0.3716753, 1.475272, 0, 0.05882353, 1, 1,
0.4237812, -0.7869655, 1.870397, 0, 0.05098039, 1, 1,
0.4238105, -1.153075, 2.945706, 0, 0.04705882, 1, 1,
0.4238803, 0.8912814, 1.735102, 0, 0.03921569, 1, 1,
0.4299361, -0.6879737, 2.414921, 0, 0.03529412, 1, 1,
0.4346272, 0.575791, 0.5302987, 0, 0.02745098, 1, 1,
0.4408469, 0.8904149, 0.5122378, 0, 0.02352941, 1, 1,
0.4484061, 0.1167962, 0.01105711, 0, 0.01568628, 1, 1,
0.4495697, 0.7952777, 2.231061, 0, 0.01176471, 1, 1,
0.4527778, -0.8085865, 4.160211, 0, 0.003921569, 1, 1,
0.4583706, -0.2455247, 1.692926, 0.003921569, 0, 1, 1,
0.458538, 0.557345, 1.817252, 0.007843138, 0, 1, 1,
0.4589136, 1.507771, -0.6289424, 0.01568628, 0, 1, 1,
0.4627617, -0.9680126, 4.028254, 0.01960784, 0, 1, 1,
0.4665263, -0.2174398, 2.346611, 0.02745098, 0, 1, 1,
0.4723364, 0.2341788, 1.016542, 0.03137255, 0, 1, 1,
0.4750361, 0.5550681, -0.3183566, 0.03921569, 0, 1, 1,
0.475336, -1.473879, 3.894316, 0.04313726, 0, 1, 1,
0.480044, -0.291877, 1.872097, 0.05098039, 0, 1, 1,
0.4805448, 0.4736981, -0.1352976, 0.05490196, 0, 1, 1,
0.4815627, 0.3473883, -0.7555194, 0.0627451, 0, 1, 1,
0.485778, -1.622723, 3.198263, 0.06666667, 0, 1, 1,
0.4893504, -0.9656171, 2.842633, 0.07450981, 0, 1, 1,
0.4901884, -0.4501342, 0.2158365, 0.07843138, 0, 1, 1,
0.4921049, 0.3464363, 1.365061, 0.08627451, 0, 1, 1,
0.4921803, -2.211933, 5.003315, 0.09019608, 0, 1, 1,
0.4923081, 0.2645971, 0.1848151, 0.09803922, 0, 1, 1,
0.5000301, -0.2320955, 3.130363, 0.1058824, 0, 1, 1,
0.5008184, 0.8939764, -0.2497366, 0.1098039, 0, 1, 1,
0.5039456, -0.03772781, 0.927077, 0.1176471, 0, 1, 1,
0.5118016, 0.7464091, 0.04519527, 0.1215686, 0, 1, 1,
0.5166544, 0.01343697, 2.030326, 0.1294118, 0, 1, 1,
0.5189123, -0.7820925, 0.7084276, 0.1333333, 0, 1, 1,
0.5212245, 0.6760893, -0.1268604, 0.1411765, 0, 1, 1,
0.5249653, -0.3704537, 2.438525, 0.145098, 0, 1, 1,
0.5252646, -0.8565409, 2.861948, 0.1529412, 0, 1, 1,
0.5362725, -0.8405156, 2.282219, 0.1568628, 0, 1, 1,
0.5390142, -1.216457, 6.023239, 0.1647059, 0, 1, 1,
0.5416018, -0.6439236, 2.651413, 0.1686275, 0, 1, 1,
0.5423636, -1.20096, 2.36402, 0.1764706, 0, 1, 1,
0.5431426, -1.332393, 4.193721, 0.1803922, 0, 1, 1,
0.5483578, -1.362426, 3.41395, 0.1882353, 0, 1, 1,
0.5485067, 0.2224912, 1.337458, 0.1921569, 0, 1, 1,
0.5505933, -0.6877282, 3.433616, 0.2, 0, 1, 1,
0.5511813, -1.294728, 3.140452, 0.2078431, 0, 1, 1,
0.551945, 0.7401159, 0.6698238, 0.2117647, 0, 1, 1,
0.5537201, 0.7447904, 0.7251419, 0.2196078, 0, 1, 1,
0.5581964, -1.303668, 3.443518, 0.2235294, 0, 1, 1,
0.561671, -0.4631473, 1.942124, 0.2313726, 0, 1, 1,
0.5623611, -0.7138412, 3.462544, 0.2352941, 0, 1, 1,
0.5678718, 1.791718, 0.01842974, 0.2431373, 0, 1, 1,
0.5712561, 1.087733, 1.525224, 0.2470588, 0, 1, 1,
0.5842509, 0.9476877, -0.5355043, 0.254902, 0, 1, 1,
0.5908461, -0.3591528, 1.959135, 0.2588235, 0, 1, 1,
0.5912924, 0.2396171, 1.074962, 0.2666667, 0, 1, 1,
0.594232, -0.7072566, 2.202122, 0.2705882, 0, 1, 1,
0.5969139, 0.7399355, 0.4747274, 0.2784314, 0, 1, 1,
0.5983423, 0.9252599, 0.3446103, 0.282353, 0, 1, 1,
0.6051973, 0.5478627, 1.201086, 0.2901961, 0, 1, 1,
0.6139305, 0.0582817, 3.404054, 0.2941177, 0, 1, 1,
0.6141201, -0.7073323, 2.748198, 0.3019608, 0, 1, 1,
0.6200343, 0.5428944, 0.8523666, 0.3098039, 0, 1, 1,
0.6215979, 1.758081, -0.5000287, 0.3137255, 0, 1, 1,
0.634648, -0.0004366509, 1.060095, 0.3215686, 0, 1, 1,
0.6382337, 0.5830638, 1.168952, 0.3254902, 0, 1, 1,
0.6388662, 0.1946144, -0.4536792, 0.3333333, 0, 1, 1,
0.6390614, -1.658302, 2.591015, 0.3372549, 0, 1, 1,
0.6411862, 0.4331309, 1.555066, 0.345098, 0, 1, 1,
0.6429144, -1.188583, 2.222387, 0.3490196, 0, 1, 1,
0.644258, -1.486809, 0.6753843, 0.3568628, 0, 1, 1,
0.6442728, -1.237723, 2.486504, 0.3607843, 0, 1, 1,
0.6449253, -1.704884, 1.931045, 0.3686275, 0, 1, 1,
0.6450047, -0.2810375, 1.100182, 0.372549, 0, 1, 1,
0.6467315, 0.3349327, 0.9136329, 0.3803922, 0, 1, 1,
0.648577, -0.6591086, 1.745868, 0.3843137, 0, 1, 1,
0.6515151, -0.2644905, 3.832261, 0.3921569, 0, 1, 1,
0.6548896, -1.035354, 1.947293, 0.3960784, 0, 1, 1,
0.6590408, -0.705788, 0.8717863, 0.4039216, 0, 1, 1,
0.6594431, -1.291559, 0.9650291, 0.4117647, 0, 1, 1,
0.6607094, 0.3835464, 0.1630992, 0.4156863, 0, 1, 1,
0.6608723, 0.01640747, 3.189356, 0.4235294, 0, 1, 1,
0.6769922, 0.8265961, 3.392001, 0.427451, 0, 1, 1,
0.6792869, 1.644318, -0.275367, 0.4352941, 0, 1, 1,
0.6832136, 2.447842, -0.7523454, 0.4392157, 0, 1, 1,
0.6889031, -0.4945933, 0.5600478, 0.4470588, 0, 1, 1,
0.690465, -0.4091731, 3.9034, 0.4509804, 0, 1, 1,
0.6911346, -1.159648, 3.295781, 0.4588235, 0, 1, 1,
0.6943119, 0.6102825, 3.436271, 0.4627451, 0, 1, 1,
0.7026893, -0.4835697, 2.312124, 0.4705882, 0, 1, 1,
0.7033222, 1.925224, 0.936074, 0.4745098, 0, 1, 1,
0.7037287, -0.6500326, 2.399436, 0.4823529, 0, 1, 1,
0.7099854, -0.4516744, 1.038379, 0.4862745, 0, 1, 1,
0.7123886, 0.8706052, 1.646307, 0.4941176, 0, 1, 1,
0.7127982, 0.5813311, 1.557483, 0.5019608, 0, 1, 1,
0.7194363, -0.05193189, 2.389602, 0.5058824, 0, 1, 1,
0.726411, -0.03724407, 1.273425, 0.5137255, 0, 1, 1,
0.7271066, -0.3380743, 2.640681, 0.5176471, 0, 1, 1,
0.7274233, -2.110433, 4.196832, 0.5254902, 0, 1, 1,
0.7294076, 1.4558, 0.6197803, 0.5294118, 0, 1, 1,
0.7297941, 1.802576, 1.736109, 0.5372549, 0, 1, 1,
0.7350841, 1.193526, 1.827997, 0.5411765, 0, 1, 1,
0.7371671, -0.468694, 2.394965, 0.5490196, 0, 1, 1,
0.7410901, 0.07630517, 2.837646, 0.5529412, 0, 1, 1,
0.7540782, 2.632329, 0.7561653, 0.5607843, 0, 1, 1,
0.7543017, -1.05893, 1.43516, 0.5647059, 0, 1, 1,
0.7558251, -0.05919853, 4.441257, 0.572549, 0, 1, 1,
0.7615338, 0.3723834, 2.47255, 0.5764706, 0, 1, 1,
0.7649113, -0.04551549, 1.695098, 0.5843138, 0, 1, 1,
0.7656533, 1.441946, 0.013398, 0.5882353, 0, 1, 1,
0.7714905, 0.4721318, 3.326629, 0.5960785, 0, 1, 1,
0.7721962, -0.2111016, 0.879085, 0.6039216, 0, 1, 1,
0.7745458, 2.287671, 1.133957, 0.6078432, 0, 1, 1,
0.7826082, 0.6492026, 0.1961448, 0.6156863, 0, 1, 1,
0.7927757, -0.4733483, 2.325518, 0.6196079, 0, 1, 1,
0.797042, -0.9009442, 3.211223, 0.627451, 0, 1, 1,
0.8145557, -0.2896215, 1.969676, 0.6313726, 0, 1, 1,
0.8233971, -0.8237311, 2.483616, 0.6392157, 0, 1, 1,
0.8251194, 2.229915, 1.388346, 0.6431373, 0, 1, 1,
0.8278941, 0.0273522, 0.7115427, 0.6509804, 0, 1, 1,
0.8297284, -0.767078, 2.945161, 0.654902, 0, 1, 1,
0.8375902, -1.416232, 2.035461, 0.6627451, 0, 1, 1,
0.8499116, -2.135404, 3.188095, 0.6666667, 0, 1, 1,
0.8513485, -0.4392156, 2.518051, 0.6745098, 0, 1, 1,
0.8549374, 0.9473352, -0.6603279, 0.6784314, 0, 1, 1,
0.8597299, -1.981201, 2.891628, 0.6862745, 0, 1, 1,
0.8746284, -1.150462, 0.7860851, 0.6901961, 0, 1, 1,
0.8785993, -0.01150903, 0.7681013, 0.6980392, 0, 1, 1,
0.8813832, -1.670927, 3.510548, 0.7058824, 0, 1, 1,
0.8863089, 0.8853821, 1.935302, 0.7098039, 0, 1, 1,
0.8891194, -0.3411215, 2.717929, 0.7176471, 0, 1, 1,
0.8914747, -2.692229, 3.227996, 0.7215686, 0, 1, 1,
0.9022392, 0.560904, 2.11726, 0.7294118, 0, 1, 1,
0.9049486, -0.7081231, 3.648557, 0.7333333, 0, 1, 1,
0.9054013, -0.3501575, 3.249903, 0.7411765, 0, 1, 1,
0.9057958, 2.772853, 0.7398607, 0.7450981, 0, 1, 1,
0.910141, -1.655233, 3.209084, 0.7529412, 0, 1, 1,
0.9119393, 0.7491329, 1.359891, 0.7568628, 0, 1, 1,
0.913577, 0.7823, 1.17216, 0.7647059, 0, 1, 1,
0.9139503, 0.4240793, 1.188066, 0.7686275, 0, 1, 1,
0.916259, 0.3841574, 2.952671, 0.7764706, 0, 1, 1,
0.9205976, 0.3035801, 2.579267, 0.7803922, 0, 1, 1,
0.9239535, -0.3362515, 2.211676, 0.7882353, 0, 1, 1,
0.9290957, 1.306883, 0.2322551, 0.7921569, 0, 1, 1,
0.9307343, -0.7946108, 3.887921, 0.8, 0, 1, 1,
0.9325772, -0.06150925, 2.940927, 0.8078431, 0, 1, 1,
0.9398329, 0.885417, 0.8972856, 0.8117647, 0, 1, 1,
0.9440781, -0.5582919, 3.257552, 0.8196079, 0, 1, 1,
0.9441787, -0.7585049, 1.748971, 0.8235294, 0, 1, 1,
0.9454989, 1.564507, 0.6136094, 0.8313726, 0, 1, 1,
0.946739, 0.2305515, 1.068069, 0.8352941, 0, 1, 1,
0.9492081, 1.14437, 1.147653, 0.8431373, 0, 1, 1,
0.9555746, 0.5090933, -0.7442771, 0.8470588, 0, 1, 1,
0.9570116, 1.643273, 0.7701491, 0.854902, 0, 1, 1,
0.9693302, 1.826973, 0.9033542, 0.8588235, 0, 1, 1,
0.9749375, -0.5165139, 2.460467, 0.8666667, 0, 1, 1,
0.9790558, -0.6726614, -0.1799154, 0.8705882, 0, 1, 1,
0.9854797, 0.5028058, -0.9989418, 0.8784314, 0, 1, 1,
0.996445, -1.711472, 3.128626, 0.8823529, 0, 1, 1,
0.9992895, 0.07426545, 0.15725, 0.8901961, 0, 1, 1,
1.003088, 1.596817, 1.299877, 0.8941177, 0, 1, 1,
1.017816, -0.2744348, 0.5681671, 0.9019608, 0, 1, 1,
1.020309, 0.9980416, 2.597461, 0.9098039, 0, 1, 1,
1.020326, 0.1261839, 1.024073, 0.9137255, 0, 1, 1,
1.021121, 0.185258, 2.940028, 0.9215686, 0, 1, 1,
1.024016, 0.4804161, 1.500457, 0.9254902, 0, 1, 1,
1.026756, -0.116387, 2.256108, 0.9333333, 0, 1, 1,
1.031841, 0.8479579, 1.383199, 0.9372549, 0, 1, 1,
1.03572, 0.4632289, 2.359762, 0.945098, 0, 1, 1,
1.045645, -0.5325767, 2.577308, 0.9490196, 0, 1, 1,
1.047078, 0.1760511, 0.632764, 0.9568627, 0, 1, 1,
1.051722, -1.02071, 2.961431, 0.9607843, 0, 1, 1,
1.057586, 1.417603, 0.9992734, 0.9686275, 0, 1, 1,
1.062771, 1.037803, 1.558696, 0.972549, 0, 1, 1,
1.070406, 0.8619213, 1.767181, 0.9803922, 0, 1, 1,
1.072584, -0.3377583, 2.815396, 0.9843137, 0, 1, 1,
1.08454, -0.4348501, 0.7223046, 0.9921569, 0, 1, 1,
1.088918, 0.002258396, 0.435509, 0.9960784, 0, 1, 1,
1.089709, 0.1777775, 1.425721, 1, 0, 0.9960784, 1,
1.091782, -1.596009, 2.919385, 1, 0, 0.9882353, 1,
1.092008, -0.5435882, 0.3778453, 1, 0, 0.9843137, 1,
1.092373, 0.4532013, 0.5248639, 1, 0, 0.9764706, 1,
1.09286, 0.251848, -1.248351, 1, 0, 0.972549, 1,
1.09433, -0.853994, 2.462025, 1, 0, 0.9647059, 1,
1.094643, -0.2854176, 1.620866, 1, 0, 0.9607843, 1,
1.097746, 1.151638, 1.000447, 1, 0, 0.9529412, 1,
1.09807, 1.14273, 0.3681981, 1, 0, 0.9490196, 1,
1.106374, -0.3887489, 3.264297, 1, 0, 0.9411765, 1,
1.106753, -0.3649015, 2.505682, 1, 0, 0.9372549, 1,
1.108332, -2.668678, 2.761729, 1, 0, 0.9294118, 1,
1.10876, -0.3463709, 0.4454244, 1, 0, 0.9254902, 1,
1.110436, 0.5159866, 0.3616451, 1, 0, 0.9176471, 1,
1.111621, -0.008090616, -2.094565, 1, 0, 0.9137255, 1,
1.113394, -0.8450856, 1.176404, 1, 0, 0.9058824, 1,
1.113574, -0.4985361, 1.294572, 1, 0, 0.9019608, 1,
1.113755, -0.3409959, 2.680522, 1, 0, 0.8941177, 1,
1.12062, -0.9116169, 1.028376, 1, 0, 0.8862745, 1,
1.121047, 1.441483, 2.51921, 1, 0, 0.8823529, 1,
1.128594, -0.7433401, 2.754812, 1, 0, 0.8745098, 1,
1.132653, -0.2370229, 2.339355, 1, 0, 0.8705882, 1,
1.134322, -1.038923, 2.695087, 1, 0, 0.8627451, 1,
1.14102, -0.2634425, 2.290673, 1, 0, 0.8588235, 1,
1.144889, 1.226046, 1.907599, 1, 0, 0.8509804, 1,
1.146061, 2.94983, 0.5786583, 1, 0, 0.8470588, 1,
1.147306, 0.5266285, 1.551488, 1, 0, 0.8392157, 1,
1.148294, -2.177287, 1.861441, 1, 0, 0.8352941, 1,
1.150729, 0.8328778, 1.418269, 1, 0, 0.827451, 1,
1.15473, 0.8860365, 0.9331079, 1, 0, 0.8235294, 1,
1.158541, -1.465774, 1.195399, 1, 0, 0.8156863, 1,
1.181729, 0.1251628, 2.490227, 1, 0, 0.8117647, 1,
1.183512, -1.119102, 0.6303189, 1, 0, 0.8039216, 1,
1.184174, 0.2713268, 1.204213, 1, 0, 0.7960784, 1,
1.190181, 0.233068, 3.046553, 1, 0, 0.7921569, 1,
1.191004, 1.165145, 0.09016317, 1, 0, 0.7843137, 1,
1.202387, 0.0872618, -0.4214975, 1, 0, 0.7803922, 1,
1.208448, -1.102046, 1.046952, 1, 0, 0.772549, 1,
1.210087, 0.1455988, 1.515192, 1, 0, 0.7686275, 1,
1.210579, 0.7503513, -0.3160995, 1, 0, 0.7607843, 1,
1.21119, -0.1660136, 2.731205, 1, 0, 0.7568628, 1,
1.211402, 2.698793, 0.2867177, 1, 0, 0.7490196, 1,
1.218982, 0.6488324, 1.992828, 1, 0, 0.7450981, 1,
1.224694, 1.204429, 1.201169, 1, 0, 0.7372549, 1,
1.233252, 1.417159, 1.97283, 1, 0, 0.7333333, 1,
1.244826, 1.139526, 0.1584739, 1, 0, 0.7254902, 1,
1.248649, 2.94887, 0.6221384, 1, 0, 0.7215686, 1,
1.251234, -0.4737379, 2.375662, 1, 0, 0.7137255, 1,
1.268432, -0.6827955, 0.3371356, 1, 0, 0.7098039, 1,
1.284951, 0.2303299, 3.52954, 1, 0, 0.7019608, 1,
1.286443, -1.889802, 2.746062, 1, 0, 0.6941177, 1,
1.291656, 0.7508913, 0.9002442, 1, 0, 0.6901961, 1,
1.292046, 0.05785988, 1.479483, 1, 0, 0.682353, 1,
1.297428, -0.04008251, 0.7611598, 1, 0, 0.6784314, 1,
1.311549, 1.864375, 0.0594616, 1, 0, 0.6705883, 1,
1.314734, -0.67498, 2.340492, 1, 0, 0.6666667, 1,
1.319854, -0.5148649, 3.471188, 1, 0, 0.6588235, 1,
1.319895, 0.1043571, 2.259333, 1, 0, 0.654902, 1,
1.319996, -0.1007385, 1.385882, 1, 0, 0.6470588, 1,
1.337269, 1.522486, 0.9744673, 1, 0, 0.6431373, 1,
1.339862, -0.4098342, 1.148508, 1, 0, 0.6352941, 1,
1.349855, 1.487317, -0.404889, 1, 0, 0.6313726, 1,
1.356287, -1.408815, 3.188679, 1, 0, 0.6235294, 1,
1.358863, -0.5394497, 0.8476682, 1, 0, 0.6196079, 1,
1.360341, -1.095289, 3.566754, 1, 0, 0.6117647, 1,
1.367952, -1.200291, 3.309074, 1, 0, 0.6078432, 1,
1.391296, 1.377874, 2.609311, 1, 0, 0.6, 1,
1.39497, -1.326389, 1.836003, 1, 0, 0.5921569, 1,
1.397861, -1.006891, 2.747655, 1, 0, 0.5882353, 1,
1.400279, -0.6407735, 1.043488, 1, 0, 0.5803922, 1,
1.414667, 0.2900446, 0.3584068, 1, 0, 0.5764706, 1,
1.416127, 0.6730435, 1.823319, 1, 0, 0.5686275, 1,
1.419671, 0.1386801, 2.314302, 1, 0, 0.5647059, 1,
1.427765, -0.5426418, 2.473433, 1, 0, 0.5568628, 1,
1.443647, -0.5382611, 2.016191, 1, 0, 0.5529412, 1,
1.452219, -0.09028501, 1.601385, 1, 0, 0.5450981, 1,
1.454375, 0.01386058, 1.125541, 1, 0, 0.5411765, 1,
1.454603, 0.06979759, 1.65677, 1, 0, 0.5333334, 1,
1.489503, -1.091317, 2.404724, 1, 0, 0.5294118, 1,
1.491103, -0.5984254, 1.554346, 1, 0, 0.5215687, 1,
1.493468, 1.019368, 3.582302, 1, 0, 0.5176471, 1,
1.513217, -0.3427795, 2.081434, 1, 0, 0.509804, 1,
1.519148, -0.5878491, 2.655016, 1, 0, 0.5058824, 1,
1.526294, -1.599973, 1.026357, 1, 0, 0.4980392, 1,
1.532207, 0.05942446, 2.969221, 1, 0, 0.4901961, 1,
1.535412, 1.138658, 1.076258, 1, 0, 0.4862745, 1,
1.542255, 0.9124321, 0.2839865, 1, 0, 0.4784314, 1,
1.546682, 1.832531, 0.3393056, 1, 0, 0.4745098, 1,
1.550494, -1.293882, 1.983358, 1, 0, 0.4666667, 1,
1.551835, -1.424091, 2.796377, 1, 0, 0.4627451, 1,
1.554842, 0.363467, 2.19612, 1, 0, 0.454902, 1,
1.581853, 0.3575464, 1.051532, 1, 0, 0.4509804, 1,
1.595178, 1.28499, 1.50895, 1, 0, 0.4431373, 1,
1.597171, -2.301186, 2.074698, 1, 0, 0.4392157, 1,
1.618089, -0.8793756, 3.669504, 1, 0, 0.4313726, 1,
1.61922, -0.1837631, 1.50007, 1, 0, 0.427451, 1,
1.623314, -1.184089, 2.634592, 1, 0, 0.4196078, 1,
1.62578, 1.321985, 0.1992939, 1, 0, 0.4156863, 1,
1.626685, -0.4124754, 2.488745, 1, 0, 0.4078431, 1,
1.627431, -1.290709, 1.313954, 1, 0, 0.4039216, 1,
1.643792, -0.0686722, 1.708785, 1, 0, 0.3960784, 1,
1.647175, -2.067719, 1.307398, 1, 0, 0.3882353, 1,
1.647526, 0.941326, 1.069388, 1, 0, 0.3843137, 1,
1.650365, 0.1378808, 0.5468727, 1, 0, 0.3764706, 1,
1.655904, -1.498736, 3.352109, 1, 0, 0.372549, 1,
1.664694, -1.329108, 3.799911, 1, 0, 0.3647059, 1,
1.665894, 1.75609, 1.165097, 1, 0, 0.3607843, 1,
1.670821, -0.7089759, -0.7807091, 1, 0, 0.3529412, 1,
1.677886, 0.6612852, 1.114106, 1, 0, 0.3490196, 1,
1.683265, 1.690533, 0.1225828, 1, 0, 0.3411765, 1,
1.683365, -0.04406095, 0.1205093, 1, 0, 0.3372549, 1,
1.684809, -0.9636444, 1.021316, 1, 0, 0.3294118, 1,
1.686395, -0.0652903, 2.360621, 1, 0, 0.3254902, 1,
1.689162, -1.094298, 2.615267, 1, 0, 0.3176471, 1,
1.701759, 0.8033361, 2.045222, 1, 0, 0.3137255, 1,
1.715033, 1.856087, 0.9426714, 1, 0, 0.3058824, 1,
1.722133, 0.8214646, 2.056759, 1, 0, 0.2980392, 1,
1.730058, -0.08575813, 2.549931, 1, 0, 0.2941177, 1,
1.736668, -0.02288006, 2.717759, 1, 0, 0.2862745, 1,
1.743286, 0.09119514, 1.90286, 1, 0, 0.282353, 1,
1.744566, 0.4040433, 1.977126, 1, 0, 0.2745098, 1,
1.748664, -1.258411, 1.783385, 1, 0, 0.2705882, 1,
1.759959, -0.8803507, 2.429718, 1, 0, 0.2627451, 1,
1.768467, 0.05690549, 0.8226179, 1, 0, 0.2588235, 1,
1.77666, 1.010658, 2.39527, 1, 0, 0.2509804, 1,
1.778964, -1.382021, 2.638506, 1, 0, 0.2470588, 1,
1.783504, -0.6138919, 0.6829463, 1, 0, 0.2392157, 1,
1.786875, -0.06389122, 0.5501419, 1, 0, 0.2352941, 1,
1.797732, 0.2625301, 0.8894183, 1, 0, 0.227451, 1,
1.825735, 2.775839, 1.586767, 1, 0, 0.2235294, 1,
1.826734, -1.48153, 0.2874244, 1, 0, 0.2156863, 1,
1.831828, -0.4489308, 0.8649345, 1, 0, 0.2117647, 1,
1.834506, 0.2784538, 0.7855912, 1, 0, 0.2039216, 1,
1.882585, -0.1171802, 2.255591, 1, 0, 0.1960784, 1,
1.885221, -0.07135838, 1.864059, 1, 0, 0.1921569, 1,
1.886271, -1.257977, 2.112649, 1, 0, 0.1843137, 1,
1.898125, 0.9438416, -0.3954048, 1, 0, 0.1803922, 1,
1.903082, -1.206329, 2.516041, 1, 0, 0.172549, 1,
1.910273, -0.8274984, 2.05582, 1, 0, 0.1686275, 1,
1.923756, -0.8971072, 0.665614, 1, 0, 0.1607843, 1,
1.937744, -1.152349, 2.344558, 1, 0, 0.1568628, 1,
1.977223, 0.9628554, 0.7198566, 1, 0, 0.1490196, 1,
1.978116, -0.3773766, 1.818777, 1, 0, 0.145098, 1,
1.987105, -1.546803, 3.185144, 1, 0, 0.1372549, 1,
2.015731, 0.6598709, 1.96545, 1, 0, 0.1333333, 1,
2.016726, -1.293151, 3.068066, 1, 0, 0.1254902, 1,
2.048233, -0.1851544, 1.826285, 1, 0, 0.1215686, 1,
2.051569, 1.740886, -0.1607679, 1, 0, 0.1137255, 1,
2.063808, -1.190074, 2.45128, 1, 0, 0.1098039, 1,
2.095645, -0.8423747, 1.32383, 1, 0, 0.1019608, 1,
2.117487, -0.3641834, 2.305107, 1, 0, 0.09411765, 1,
2.135172, -3.548379, 3.438273, 1, 0, 0.09019608, 1,
2.161921, 1.450084, -1.313864, 1, 0, 0.08235294, 1,
2.255666, -0.5544543, 0.3832998, 1, 0, 0.07843138, 1,
2.411906, -0.4468082, 3.173773, 1, 0, 0.07058824, 1,
2.44649, -0.8769282, 0.1216501, 1, 0, 0.06666667, 1,
2.462359, -0.1055032, 0.06815907, 1, 0, 0.05882353, 1,
2.466747, 0.8510258, 1.794161, 1, 0, 0.05490196, 1,
2.542034, 0.0971861, 0.4962314, 1, 0, 0.04705882, 1,
2.564615, 0.1476346, 0.8918709, 1, 0, 0.04313726, 1,
2.574605, -2.257441, 1.084582, 1, 0, 0.03529412, 1,
2.577062, -0.1477034, 1.101978, 1, 0, 0.03137255, 1,
2.65576, -0.9438484, 1.643049, 1, 0, 0.02352941, 1,
3.072509, -0.06451058, 0.5836614, 1, 0, 0.01960784, 1,
3.180972, 0.2586722, 0.7450895, 1, 0, 0.01176471, 1,
3.282927, 0.02104822, 1.738679, 1, 0, 0.007843138, 1
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
0.01016057, -4.658941, -7.416368, 0, -0.5, 0.5, 0.5,
0.01016057, -4.658941, -7.416368, 1, -0.5, 0.5, 0.5,
0.01016057, -4.658941, -7.416368, 1, 1.5, 0.5, 0.5,
0.01016057, -4.658941, -7.416368, 0, 1.5, 0.5, 0.5
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
-4.372074, -0.2723869, -7.416368, 0, -0.5, 0.5, 0.5,
-4.372074, -0.2723869, -7.416368, 1, -0.5, 0.5, 0.5,
-4.372074, -0.2723869, -7.416368, 1, 1.5, 0.5, 0.5,
-4.372074, -0.2723869, -7.416368, 0, 1.5, 0.5, 0.5
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
-4.372074, -4.658941, 0.2773616, 0, -0.5, 0.5, 0.5,
-4.372074, -4.658941, 0.2773616, 1, -0.5, 0.5, 0.5,
-4.372074, -4.658941, 0.2773616, 1, 1.5, 0.5, 0.5,
-4.372074, -4.658941, 0.2773616, 0, 1.5, 0.5, 0.5
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
-3, -3.646659, -5.640892,
3, -3.646659, -5.640892,
-3, -3.646659, -5.640892,
-3, -3.815373, -5.936804,
-2, -3.646659, -5.640892,
-2, -3.815373, -5.936804,
-1, -3.646659, -5.640892,
-1, -3.815373, -5.936804,
0, -3.646659, -5.640892,
0, -3.815373, -5.936804,
1, -3.646659, -5.640892,
1, -3.815373, -5.936804,
2, -3.646659, -5.640892,
2, -3.815373, -5.936804,
3, -3.646659, -5.640892,
3, -3.815373, -5.936804
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
-3, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
-3, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
-3, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
-3, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
-2, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
-2, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
-2, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
-2, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
-1, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
-1, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
-1, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
-1, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
0, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
0, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
0, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
0, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
1, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
1, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
1, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
1, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
2, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
2, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
2, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
2, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5,
3, -4.1528, -6.52863, 0, -0.5, 0.5, 0.5,
3, -4.1528, -6.52863, 1, -0.5, 0.5, 0.5,
3, -4.1528, -6.52863, 1, 1.5, 0.5, 0.5,
3, -4.1528, -6.52863, 0, 1.5, 0.5, 0.5
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
-3.360789, -3, -5.640892,
-3.360789, 3, -5.640892,
-3.360789, -3, -5.640892,
-3.529337, -3, -5.936804,
-3.360789, -2, -5.640892,
-3.529337, -2, -5.936804,
-3.360789, -1, -5.640892,
-3.529337, -1, -5.936804,
-3.360789, 0, -5.640892,
-3.529337, 0, -5.936804,
-3.360789, 1, -5.640892,
-3.529337, 1, -5.936804,
-3.360789, 2, -5.640892,
-3.529337, 2, -5.936804,
-3.360789, 3, -5.640892,
-3.529337, 3, -5.936804
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
-3.866432, -3, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, -3, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, -3, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, -3, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, -2, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, -2, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, -2, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, -2, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, -1, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, -1, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, -1, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, -1, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, 0, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, 0, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, 0, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, 0, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, 1, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, 1, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, 1, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, 1, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, 2, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, 2, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, 2, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, 2, -6.52863, 0, 1.5, 0.5, 0.5,
-3.866432, 3, -6.52863, 0, -0.5, 0.5, 0.5,
-3.866432, 3, -6.52863, 1, -0.5, 0.5, 0.5,
-3.866432, 3, -6.52863, 1, 1.5, 0.5, 0.5,
-3.866432, 3, -6.52863, 0, 1.5, 0.5, 0.5
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
-3.360789, -3.646659, -4,
-3.360789, -3.646659, 6,
-3.360789, -3.646659, -4,
-3.529337, -3.815373, -4,
-3.360789, -3.646659, -2,
-3.529337, -3.815373, -2,
-3.360789, -3.646659, 0,
-3.529337, -3.815373, 0,
-3.360789, -3.646659, 2,
-3.529337, -3.815373, 2,
-3.360789, -3.646659, 4,
-3.529337, -3.815373, 4,
-3.360789, -3.646659, 6,
-3.529337, -3.815373, 6
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
-3.866432, -4.1528, -4, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, -4, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, -4, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, -4, 0, 1.5, 0.5, 0.5,
-3.866432, -4.1528, -2, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, -2, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, -2, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, -2, 0, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 0, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 0, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 0, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 0, 0, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 2, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 2, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 2, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 2, 0, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 4, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 4, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 4, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 4, 0, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 6, 0, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 6, 1, -0.5, 0.5, 0.5,
-3.866432, -4.1528, 6, 1, 1.5, 0.5, 0.5,
-3.866432, -4.1528, 6, 0, 1.5, 0.5, 0.5
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
-3.360789, -3.646659, -5.640892,
-3.360789, 3.101885, -5.640892,
-3.360789, -3.646659, 6.195615,
-3.360789, 3.101885, 6.195615,
-3.360789, -3.646659, -5.640892,
-3.360789, -3.646659, 6.195615,
-3.360789, 3.101885, -5.640892,
-3.360789, 3.101885, 6.195615,
-3.360789, -3.646659, -5.640892,
3.38111, -3.646659, -5.640892,
-3.360789, -3.646659, 6.195615,
3.38111, -3.646659, 6.195615,
-3.360789, 3.101885, -5.640892,
3.38111, 3.101885, -5.640892,
-3.360789, 3.101885, 6.195615,
3.38111, 3.101885, 6.195615,
3.38111, -3.646659, -5.640892,
3.38111, 3.101885, -5.640892,
3.38111, -3.646659, 6.195615,
3.38111, 3.101885, 6.195615,
3.38111, -3.646659, -5.640892,
3.38111, -3.646659, 6.195615,
3.38111, 3.101885, -5.640892,
3.38111, 3.101885, 6.195615
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
var radius = 8.11754;
var distance = 36.11586;
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
mvMatrix.translate( -0.01016057, 0.2723869, -0.2773616 );
mvMatrix.scale( 1.301835, 1.300554, 0.7415062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.11586);
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


