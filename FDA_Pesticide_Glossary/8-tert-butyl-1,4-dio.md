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
-3.328614, 0.2964026, -1.450015, 1, 0, 0, 1,
-2.653153, 0.4549279, -2.295985, 1, 0.007843138, 0, 1,
-2.639489, -1.472587, -3.197042, 1, 0.01176471, 0, 1,
-2.600706, -0.2945049, -0.4981259, 1, 0.01960784, 0, 1,
-2.520649, -0.4236108, -2.591233, 1, 0.02352941, 0, 1,
-2.500324, 0.0322462, -0.7693482, 1, 0.03137255, 0, 1,
-2.45055, -0.4790296, -1.511254, 1, 0.03529412, 0, 1,
-2.421772, -0.4361113, -0.700911, 1, 0.04313726, 0, 1,
-2.39076, -0.8833511, -3.610836, 1, 0.04705882, 0, 1,
-2.383693, 0.0998335, -2.163827, 1, 0.05490196, 0, 1,
-2.367103, -0.2722406, -0.1509166, 1, 0.05882353, 0, 1,
-2.356069, -1.509552, -1.744085, 1, 0.06666667, 0, 1,
-2.281061, -1.411484, -1.992095, 1, 0.07058824, 0, 1,
-2.248315, 1.314686, 0.8290141, 1, 0.07843138, 0, 1,
-2.169062, 1.645898, -1.598197, 1, 0.08235294, 0, 1,
-2.147825, 1.425706, -0.09347846, 1, 0.09019608, 0, 1,
-2.10437, -0.3210007, -1.099902, 1, 0.09411765, 0, 1,
-2.10111, 1.256237, -0.6448969, 1, 0.1019608, 0, 1,
-2.092197, 0.9717612, -3.415185, 1, 0.1098039, 0, 1,
-2.064791, 0.4301623, -3.404528, 1, 0.1137255, 0, 1,
-2.0637, 0.3838002, -2.399578, 1, 0.1215686, 0, 1,
-2.062955, -2.177295, -2.887349, 1, 0.1254902, 0, 1,
-2.006192, -0.5633333, -2.009082, 1, 0.1333333, 0, 1,
-1.987661, 1.696418, -0.4607711, 1, 0.1372549, 0, 1,
-1.962665, -1.052525, -3.355158, 1, 0.145098, 0, 1,
-1.961173, -0.4798576, -0.942694, 1, 0.1490196, 0, 1,
-1.935863, 0.3208804, -0.8512807, 1, 0.1568628, 0, 1,
-1.876919, 0.1060202, -1.969117, 1, 0.1607843, 0, 1,
-1.857917, -0.2473024, -1.263335, 1, 0.1686275, 0, 1,
-1.843092, 0.2700359, -0.5282695, 1, 0.172549, 0, 1,
-1.841288, -1.369552, -2.43977, 1, 0.1803922, 0, 1,
-1.820314, 0.1313416, -1.019779, 1, 0.1843137, 0, 1,
-1.800686, 0.1522914, -1.470421, 1, 0.1921569, 0, 1,
-1.786713, 0.9953614, 0.1025481, 1, 0.1960784, 0, 1,
-1.76464, 1.780538, 1.341321, 1, 0.2039216, 0, 1,
-1.757084, -0.7975888, -2.792447, 1, 0.2117647, 0, 1,
-1.733333, 0.883936, -0.8348314, 1, 0.2156863, 0, 1,
-1.729108, -0.5080081, -2.614857, 1, 0.2235294, 0, 1,
-1.721666, -1.650004, -3.427228, 1, 0.227451, 0, 1,
-1.696138, -1.042218, -5.750895, 1, 0.2352941, 0, 1,
-1.669068, 1.361993, -2.05869, 1, 0.2392157, 0, 1,
-1.658535, -0.1991448, -1.00891, 1, 0.2470588, 0, 1,
-1.650699, 0.06018935, -2.139614, 1, 0.2509804, 0, 1,
-1.650669, 0.2361158, -1.910962, 1, 0.2588235, 0, 1,
-1.63497, -0.3113225, -0.4418287, 1, 0.2627451, 0, 1,
-1.634184, 0.9485753, -0.3306638, 1, 0.2705882, 0, 1,
-1.629466, -0.2469925, -1.465718, 1, 0.2745098, 0, 1,
-1.627638, -0.5048307, -0.589632, 1, 0.282353, 0, 1,
-1.627092, -0.6175126, -0.9512228, 1, 0.2862745, 0, 1,
-1.617798, 0.7177504, -1.15353, 1, 0.2941177, 0, 1,
-1.607892, 0.1483411, -1.63219, 1, 0.3019608, 0, 1,
-1.604609, 1.058405, 1.047025, 1, 0.3058824, 0, 1,
-1.602862, -0.8500691, -2.593967, 1, 0.3137255, 0, 1,
-1.600179, -0.3453164, -3.348799, 1, 0.3176471, 0, 1,
-1.600156, -1.620606, -3.292678, 1, 0.3254902, 0, 1,
-1.5997, 0.3667908, 0.2929374, 1, 0.3294118, 0, 1,
-1.596524, -0.4138456, -2.036329, 1, 0.3372549, 0, 1,
-1.594859, -0.5557876, -1.571244, 1, 0.3411765, 0, 1,
-1.592468, 0.2026879, -0.5066362, 1, 0.3490196, 0, 1,
-1.572797, 0.6073328, 0.07829533, 1, 0.3529412, 0, 1,
-1.550822, -0.8684397, -1.475013, 1, 0.3607843, 0, 1,
-1.534813, 0.2894638, -2.157471, 1, 0.3647059, 0, 1,
-1.527973, 0.7876974, -0.7599743, 1, 0.372549, 0, 1,
-1.517301, -1.047912, -2.746679, 1, 0.3764706, 0, 1,
-1.511768, -1.347664, -3.346422, 1, 0.3843137, 0, 1,
-1.503759, 0.5591464, -0.9066771, 1, 0.3882353, 0, 1,
-1.503016, -1.117603, -1.255885, 1, 0.3960784, 0, 1,
-1.495937, 1.206806, -2.470994, 1, 0.4039216, 0, 1,
-1.481431, -0.2807378, -1.479989, 1, 0.4078431, 0, 1,
-1.478252, 0.5393333, -2.610061, 1, 0.4156863, 0, 1,
-1.455859, 1.972595, 1.09223, 1, 0.4196078, 0, 1,
-1.437773, 0.2909222, -1.301664, 1, 0.427451, 0, 1,
-1.42937, -0.1124896, 1.142049, 1, 0.4313726, 0, 1,
-1.427383, 0.2198375, -0.9794657, 1, 0.4392157, 0, 1,
-1.415696, -0.5764415, -1.127593, 1, 0.4431373, 0, 1,
-1.398551, 1.19312, -0.9599368, 1, 0.4509804, 0, 1,
-1.389078, -0.7412791, -3.262593, 1, 0.454902, 0, 1,
-1.388723, -0.6271965, -2.086149, 1, 0.4627451, 0, 1,
-1.385332, 0.8832179, -1.8277, 1, 0.4666667, 0, 1,
-1.38224, 0.01819352, -1.31514, 1, 0.4745098, 0, 1,
-1.381212, -0.005946679, -1.528279, 1, 0.4784314, 0, 1,
-1.376118, -0.2468429, -1.04596, 1, 0.4862745, 0, 1,
-1.371682, 0.7675541, -1.047098, 1, 0.4901961, 0, 1,
-1.359016, 0.600871, -0.4825987, 1, 0.4980392, 0, 1,
-1.358326, 0.2174356, -1.600645, 1, 0.5058824, 0, 1,
-1.346947, -3.160262, -4.005615, 1, 0.509804, 0, 1,
-1.337393, 0.8530819, -0.7728615, 1, 0.5176471, 0, 1,
-1.329453, 0.882903, -0.731203, 1, 0.5215687, 0, 1,
-1.32418, 0.1071173, -1.836473, 1, 0.5294118, 0, 1,
-1.314176, 0.2741888, -1.884621, 1, 0.5333334, 0, 1,
-1.307968, -0.5025932, -2.209741, 1, 0.5411765, 0, 1,
-1.300959, -0.740262, -1.749053, 1, 0.5450981, 0, 1,
-1.299415, -0.03331494, 0.2819692, 1, 0.5529412, 0, 1,
-1.297211, 1.098826, -0.9301952, 1, 0.5568628, 0, 1,
-1.278196, -0.5387101, -2.588011, 1, 0.5647059, 0, 1,
-1.275101, 0.7509966, -0.7243016, 1, 0.5686275, 0, 1,
-1.27128, -0.3111299, -2.338266, 1, 0.5764706, 0, 1,
-1.268695, 0.7259538, -2.22937, 1, 0.5803922, 0, 1,
-1.267278, 0.4894217, -1.467743, 1, 0.5882353, 0, 1,
-1.264692, 1.371991, -2.655665, 1, 0.5921569, 0, 1,
-1.26176, 0.4854473, -1.998802, 1, 0.6, 0, 1,
-1.257228, 0.3249695, -0.4308722, 1, 0.6078432, 0, 1,
-1.254606, -0.7399714, -1.954696, 1, 0.6117647, 0, 1,
-1.251104, -0.6040747, -1.832242, 1, 0.6196079, 0, 1,
-1.250831, -0.9924061, -0.6444743, 1, 0.6235294, 0, 1,
-1.24085, 1.046395, -2.046717, 1, 0.6313726, 0, 1,
-1.236466, -0.1887972, -1.704196, 1, 0.6352941, 0, 1,
-1.235296, 1.157861, -1.379658, 1, 0.6431373, 0, 1,
-1.228124, 1.025589, -1.77965, 1, 0.6470588, 0, 1,
-1.205822, -0.08047761, -1.350589, 1, 0.654902, 0, 1,
-1.201691, 1.560893, -0.2361379, 1, 0.6588235, 0, 1,
-1.20037, -0.3008877, 0.2018587, 1, 0.6666667, 0, 1,
-1.195092, -1.097635, -2.239579, 1, 0.6705883, 0, 1,
-1.189889, -0.1276433, -0.6297683, 1, 0.6784314, 0, 1,
-1.178868, -0.07128636, -0.6421325, 1, 0.682353, 0, 1,
-1.177134, 0.6868013, -0.6854034, 1, 0.6901961, 0, 1,
-1.174854, -0.9077243, -1.915795, 1, 0.6941177, 0, 1,
-1.164176, 0.7962856, -0.7087149, 1, 0.7019608, 0, 1,
-1.155829, 0.0202759, -0.1758972, 1, 0.7098039, 0, 1,
-1.148066, -1.331367, -2.678936, 1, 0.7137255, 0, 1,
-1.144649, -1.969843, -2.568752, 1, 0.7215686, 0, 1,
-1.135006, 1.447354, 0.2564081, 1, 0.7254902, 0, 1,
-1.117014, -0.1073242, -3.148718, 1, 0.7333333, 0, 1,
-1.106557, -0.3565065, -0.6919993, 1, 0.7372549, 0, 1,
-1.101866, 0.6390632, -1.038687, 1, 0.7450981, 0, 1,
-1.101462, 1.014532, -1.14785, 1, 0.7490196, 0, 1,
-1.088657, 1.227468, -1.381504, 1, 0.7568628, 0, 1,
-1.087461, 1.082448, -0.7040924, 1, 0.7607843, 0, 1,
-1.086875, -0.9233377, -1.397265, 1, 0.7686275, 0, 1,
-1.083863, -0.2615888, -2.980274, 1, 0.772549, 0, 1,
-1.08134, 0.5223669, -0.01132925, 1, 0.7803922, 0, 1,
-1.076044, 0.7277138, -0.1467177, 1, 0.7843137, 0, 1,
-1.065926, -0.4763645, -0.8309299, 1, 0.7921569, 0, 1,
-1.049821, -2.329321, -0.6589743, 1, 0.7960784, 0, 1,
-1.049003, 0.03907505, -2.726972, 1, 0.8039216, 0, 1,
-1.045784, 0.1794527, -1.799213, 1, 0.8117647, 0, 1,
-1.045187, -1.062818, -2.338823, 1, 0.8156863, 0, 1,
-1.040376, -1.219127, -2.115808, 1, 0.8235294, 0, 1,
-1.029896, -0.002934308, -2.135623, 1, 0.827451, 0, 1,
-1.024519, -0.1466713, 0.5142875, 1, 0.8352941, 0, 1,
-1.021936, 1.128731, -1.251953, 1, 0.8392157, 0, 1,
-1.018044, 1.025898, 0.2452229, 1, 0.8470588, 0, 1,
-1.014149, -0.2719686, -3.248092, 1, 0.8509804, 0, 1,
-1.01185, 1.093882, -1.575296, 1, 0.8588235, 0, 1,
-1.003644, 0.3441196, -2.138571, 1, 0.8627451, 0, 1,
-1.000852, -0.933652, -2.612088, 1, 0.8705882, 0, 1,
-1.000257, 0.2915631, -0.3712278, 1, 0.8745098, 0, 1,
-0.9953028, -3.312436, -3.342366, 1, 0.8823529, 0, 1,
-0.9952427, -0.3243555, -1.49668, 1, 0.8862745, 0, 1,
-0.9936749, 0.8375751, -0.8930596, 1, 0.8941177, 0, 1,
-0.9933821, -0.9617352, -1.739019, 1, 0.8980392, 0, 1,
-0.9872857, -0.1690464, -2.214413, 1, 0.9058824, 0, 1,
-0.9841794, -0.9932206, -3.037994, 1, 0.9137255, 0, 1,
-0.9831887, 0.3323531, -2.951952, 1, 0.9176471, 0, 1,
-0.9752513, 1.140931, -1.52909, 1, 0.9254902, 0, 1,
-0.967724, 0.8277039, -1.486319, 1, 0.9294118, 0, 1,
-0.9648203, 1.677605, -1.156936, 1, 0.9372549, 0, 1,
-0.9640077, -0.7728209, -3.111822, 1, 0.9411765, 0, 1,
-0.9621052, -0.4616895, -1.933477, 1, 0.9490196, 0, 1,
-0.9521039, 0.3597702, 0.2532019, 1, 0.9529412, 0, 1,
-0.9491298, -1.738512, -3.590497, 1, 0.9607843, 0, 1,
-0.9484555, 0.6225793, -1.110799, 1, 0.9647059, 0, 1,
-0.9463833, 1.782845, -0.155245, 1, 0.972549, 0, 1,
-0.9369057, 0.5424432, 0.4031984, 1, 0.9764706, 0, 1,
-0.9352183, 0.5730031, -0.7939244, 1, 0.9843137, 0, 1,
-0.9348158, -1.323577, -2.820522, 1, 0.9882353, 0, 1,
-0.9343098, 0.8602989, -0.05939528, 1, 0.9960784, 0, 1,
-0.9265945, -0.4158204, -1.106557, 0.9960784, 1, 0, 1,
-0.924355, -0.3742063, -1.377276, 0.9921569, 1, 0, 1,
-0.9235455, 0.179586, -2.90045, 0.9843137, 1, 0, 1,
-0.9223393, 1.935055, 0.2650288, 0.9803922, 1, 0, 1,
-0.9206051, 3.025479, 1.089192, 0.972549, 1, 0, 1,
-0.9198264, -0.4032544, -2.272384, 0.9686275, 1, 0, 1,
-0.919607, 1.001456, -0.979721, 0.9607843, 1, 0, 1,
-0.9176889, 2.69242, -1.835825, 0.9568627, 1, 0, 1,
-0.915761, -1.24387, -2.117142, 0.9490196, 1, 0, 1,
-0.9140407, 0.3764739, -0.4784622, 0.945098, 1, 0, 1,
-0.9118948, 1.047023, 0.1441505, 0.9372549, 1, 0, 1,
-0.9101301, -0.1291846, -2.895805, 0.9333333, 1, 0, 1,
-0.8977788, 1.110122, -0.7211163, 0.9254902, 1, 0, 1,
-0.8958948, -0.4491904, -2.232666, 0.9215686, 1, 0, 1,
-0.8930539, 0.4889046, -0.430332, 0.9137255, 1, 0, 1,
-0.8918762, 0.4774271, -0.2706334, 0.9098039, 1, 0, 1,
-0.8918263, 0.6046634, -0.8003868, 0.9019608, 1, 0, 1,
-0.8911662, 0.2423718, -2.370064, 0.8941177, 1, 0, 1,
-0.8638738, -2.054819, -2.817695, 0.8901961, 1, 0, 1,
-0.8638362, 0.9692305, -2.249731, 0.8823529, 1, 0, 1,
-0.8625613, 1.46396, 0.1366664, 0.8784314, 1, 0, 1,
-0.8623782, 0.892522, -0.03824639, 0.8705882, 1, 0, 1,
-0.8606604, -0.3393189, -2.874129, 0.8666667, 1, 0, 1,
-0.8575748, -0.2486943, -3.728398, 0.8588235, 1, 0, 1,
-0.8506046, -0.5165876, -3.033143, 0.854902, 1, 0, 1,
-0.8503546, 0.05006449, -4.112381, 0.8470588, 1, 0, 1,
-0.8487579, 0.7157506, -1.064494, 0.8431373, 1, 0, 1,
-0.8460061, 0.4342242, -0.9749544, 0.8352941, 1, 0, 1,
-0.8454736, 1.221277, 0.05979183, 0.8313726, 1, 0, 1,
-0.834741, -0.3158954, -1.615473, 0.8235294, 1, 0, 1,
-0.8331813, -0.7739807, -3.499306, 0.8196079, 1, 0, 1,
-0.832777, 0.5254653, -1.824928, 0.8117647, 1, 0, 1,
-0.829482, 0.01780248, -1.741794, 0.8078431, 1, 0, 1,
-0.8230771, 0.4011504, -0.005956074, 0.8, 1, 0, 1,
-0.8201573, -0.7086157, -1.52891, 0.7921569, 1, 0, 1,
-0.8156621, 0.8115858, -0.5372872, 0.7882353, 1, 0, 1,
-0.8148033, -0.9956907, -2.384342, 0.7803922, 1, 0, 1,
-0.8144572, 0.4767209, -0.3356127, 0.7764706, 1, 0, 1,
-0.8112512, -0.2765165, -0.8662009, 0.7686275, 1, 0, 1,
-0.8057324, 2.060491, 0.7263317, 0.7647059, 1, 0, 1,
-0.8055097, -2.208525, -1.462572, 0.7568628, 1, 0, 1,
-0.8053944, -0.02644046, -0.4572171, 0.7529412, 1, 0, 1,
-0.8037546, 0.2722821, -1.074272, 0.7450981, 1, 0, 1,
-0.8035394, -1.625412, -2.83215, 0.7411765, 1, 0, 1,
-0.8027797, -0.6716015, -0.9107966, 0.7333333, 1, 0, 1,
-0.8013681, 0.08061987, -1.445574, 0.7294118, 1, 0, 1,
-0.7943566, 1.225034, -0.8563697, 0.7215686, 1, 0, 1,
-0.7850868, -0.120947, -1.221798, 0.7176471, 1, 0, 1,
-0.7833093, 0.5764614, -0.03390076, 0.7098039, 1, 0, 1,
-0.7829157, 0.5745148, 0.4108215, 0.7058824, 1, 0, 1,
-0.7823008, 0.863869, -0.4574207, 0.6980392, 1, 0, 1,
-0.780184, -2.51273, -2.567869, 0.6901961, 1, 0, 1,
-0.7799175, 0.1661874, -0.7806805, 0.6862745, 1, 0, 1,
-0.7761206, 1.346475, -0.5397577, 0.6784314, 1, 0, 1,
-0.7755492, -0.6754507, -2.354575, 0.6745098, 1, 0, 1,
-0.7672589, 0.5737026, -1.314382, 0.6666667, 1, 0, 1,
-0.7655118, 1.365296, 0.4502276, 0.6627451, 1, 0, 1,
-0.7637283, 1.081461, -1.272915, 0.654902, 1, 0, 1,
-0.7629633, 0.8463085, -0.9776549, 0.6509804, 1, 0, 1,
-0.7606131, -1.258363, -2.325308, 0.6431373, 1, 0, 1,
-0.7573538, 0.2623248, -1.198665, 0.6392157, 1, 0, 1,
-0.7561042, 0.6269094, -1.198801, 0.6313726, 1, 0, 1,
-0.7551493, -1.381351, -0.5792394, 0.627451, 1, 0, 1,
-0.7515296, 0.1949039, -0.9859241, 0.6196079, 1, 0, 1,
-0.7479178, -0.01951613, -2.166639, 0.6156863, 1, 0, 1,
-0.7292168, 0.6932173, 0.09401102, 0.6078432, 1, 0, 1,
-0.7271541, 0.5964779, -2.12619, 0.6039216, 1, 0, 1,
-0.7267168, -0.297644, -0.5713027, 0.5960785, 1, 0, 1,
-0.7214321, 0.4430785, 0.3712494, 0.5882353, 1, 0, 1,
-0.7181821, 1.132207, -0.26866, 0.5843138, 1, 0, 1,
-0.7142606, 0.8333983, -0.4201534, 0.5764706, 1, 0, 1,
-0.6977382, 0.7238174, -0.7759813, 0.572549, 1, 0, 1,
-0.6897481, -0.4723082, -1.479387, 0.5647059, 1, 0, 1,
-0.6873183, -0.5810528, -2.166072, 0.5607843, 1, 0, 1,
-0.6861498, -0.05445042, -2.047664, 0.5529412, 1, 0, 1,
-0.6854409, 1.540898, -0.9313174, 0.5490196, 1, 0, 1,
-0.6851525, 1.002355, -1.628166, 0.5411765, 1, 0, 1,
-0.6778455, 0.9886315, -0.7627116, 0.5372549, 1, 0, 1,
-0.6766247, -1.051162, -1.328762, 0.5294118, 1, 0, 1,
-0.6753913, 1.492259, 0.6171422, 0.5254902, 1, 0, 1,
-0.671902, -0.2504022, -2.505525, 0.5176471, 1, 0, 1,
-0.6679005, -2.019091, -3.514361, 0.5137255, 1, 0, 1,
-0.6640911, 0.5952263, -0.01787654, 0.5058824, 1, 0, 1,
-0.6639655, -0.4421245, -0.7321928, 0.5019608, 1, 0, 1,
-0.6569435, -1.022033, -3.076584, 0.4941176, 1, 0, 1,
-0.6539136, -0.4922866, -3.497046, 0.4862745, 1, 0, 1,
-0.6497477, 0.3500278, -0.03169864, 0.4823529, 1, 0, 1,
-0.6421285, 1.637849, -0.1679686, 0.4745098, 1, 0, 1,
-0.6406175, -2.208631, -2.940481, 0.4705882, 1, 0, 1,
-0.6392539, -1.095624, -3.081554, 0.4627451, 1, 0, 1,
-0.6375597, 1.223816, -1.198925, 0.4588235, 1, 0, 1,
-0.6347049, -1.003049, -2.392252, 0.4509804, 1, 0, 1,
-0.6295792, 0.564817, -1.499961, 0.4470588, 1, 0, 1,
-0.623087, 0.2416888, 0.1108213, 0.4392157, 1, 0, 1,
-0.6226623, 1.909738, -0.03574578, 0.4352941, 1, 0, 1,
-0.6188195, -0.503141, -2.840469, 0.427451, 1, 0, 1,
-0.6140378, -0.3005724, -0.7506611, 0.4235294, 1, 0, 1,
-0.6110516, 0.5708101, -0.01407667, 0.4156863, 1, 0, 1,
-0.6094773, 1.07552, 0.7372675, 0.4117647, 1, 0, 1,
-0.6068894, -0.03770255, -1.411892, 0.4039216, 1, 0, 1,
-0.6057714, 1.135257, -1.080634, 0.3960784, 1, 0, 1,
-0.6016212, 0.1134685, -0.4626512, 0.3921569, 1, 0, 1,
-0.5969335, 0.6241063, -2.212611, 0.3843137, 1, 0, 1,
-0.5967852, -0.747061, -2.704895, 0.3803922, 1, 0, 1,
-0.5954626, 0.3500636, -0.9238532, 0.372549, 1, 0, 1,
-0.5917771, 0.6282762, 1.415358, 0.3686275, 1, 0, 1,
-0.5867965, -1.073776, -2.479414, 0.3607843, 1, 0, 1,
-0.5797784, -1.301152, -2.072677, 0.3568628, 1, 0, 1,
-0.5703409, -0.4106354, -2.022024, 0.3490196, 1, 0, 1,
-0.5664619, 0.2251041, -0.5361185, 0.345098, 1, 0, 1,
-0.5635325, 0.5613605, -0.1114253, 0.3372549, 1, 0, 1,
-0.5537795, 1.036526, 1.443136, 0.3333333, 1, 0, 1,
-0.5512534, -0.352676, -3.949567, 0.3254902, 1, 0, 1,
-0.5510063, 1.119838, -0.3890948, 0.3215686, 1, 0, 1,
-0.5492402, -0.3861552, -0.9938005, 0.3137255, 1, 0, 1,
-0.5475118, 0.4884596, -2.150231, 0.3098039, 1, 0, 1,
-0.5470051, 0.9240106, -0.8158714, 0.3019608, 1, 0, 1,
-0.5347392, 0.712692, 0.7260545, 0.2941177, 1, 0, 1,
-0.5335152, 1.9632, -0.9443336, 0.2901961, 1, 0, 1,
-0.5246313, 0.4431921, -0.5531572, 0.282353, 1, 0, 1,
-0.5173587, 1.372205, 0.3163691, 0.2784314, 1, 0, 1,
-0.5101656, -1.240129, -3.067534, 0.2705882, 1, 0, 1,
-0.5063145, 0.8480882, -1.64761, 0.2666667, 1, 0, 1,
-0.5025263, 1.388495, 0.4200678, 0.2588235, 1, 0, 1,
-0.4979824, 0.1202532, -1.124307, 0.254902, 1, 0, 1,
-0.4972475, -0.622572, -1.250806, 0.2470588, 1, 0, 1,
-0.4966491, -0.8268628, -2.976396, 0.2431373, 1, 0, 1,
-0.4947562, -0.5478343, -1.712331, 0.2352941, 1, 0, 1,
-0.4944423, -2.165838, -4.424038, 0.2313726, 1, 0, 1,
-0.4942108, 0.5964351, 0.3761105, 0.2235294, 1, 0, 1,
-0.4910419, 1.288889, 0.4671975, 0.2196078, 1, 0, 1,
-0.4884031, 0.2433416, -0.9987719, 0.2117647, 1, 0, 1,
-0.476842, -1.013052, -2.677117, 0.2078431, 1, 0, 1,
-0.4767713, -0.7702104, -2.438936, 0.2, 1, 0, 1,
-0.470503, -0.02306705, -2.777984, 0.1921569, 1, 0, 1,
-0.4694799, -1.375413, -2.748806, 0.1882353, 1, 0, 1,
-0.4686387, 0.1079476, -1.630492, 0.1803922, 1, 0, 1,
-0.4628465, 0.3541759, -0.3061411, 0.1764706, 1, 0, 1,
-0.462436, 1.551349, 0.7492408, 0.1686275, 1, 0, 1,
-0.4623528, 0.5368488, -0.2900229, 0.1647059, 1, 0, 1,
-0.4591084, 0.3219601, -0.805277, 0.1568628, 1, 0, 1,
-0.4589873, 0.06436905, -1.011582, 0.1529412, 1, 0, 1,
-0.4550849, 0.2839122, -0.6146461, 0.145098, 1, 0, 1,
-0.4532138, -1.231113, -3.398245, 0.1411765, 1, 0, 1,
-0.451764, -0.884256, -1.722056, 0.1333333, 1, 0, 1,
-0.4507384, -0.6144198, -1.955618, 0.1294118, 1, 0, 1,
-0.4498591, -0.66982, -3.514996, 0.1215686, 1, 0, 1,
-0.4497975, -1.336984, -3.014917, 0.1176471, 1, 0, 1,
-0.4469809, 0.2055879, -1.212558, 0.1098039, 1, 0, 1,
-0.4461609, -0.8315763, -4.722848, 0.1058824, 1, 0, 1,
-0.4440556, 1.350935, -1.949191, 0.09803922, 1, 0, 1,
-0.4438503, 0.9881365, 1.772485, 0.09019608, 1, 0, 1,
-0.4419962, 0.3557025, -0.9669863, 0.08627451, 1, 0, 1,
-0.4389379, -1.194429, -5.017892, 0.07843138, 1, 0, 1,
-0.4377598, 0.3415862, -2.327734, 0.07450981, 1, 0, 1,
-0.436015, -0.681994, -3.824565, 0.06666667, 1, 0, 1,
-0.4347921, 0.2996739, -1.331054, 0.0627451, 1, 0, 1,
-0.4329646, 1.026411, -1.051054, 0.05490196, 1, 0, 1,
-0.4328208, 2.547015, -1.229947, 0.05098039, 1, 0, 1,
-0.429223, -0.1143218, -0.2557524, 0.04313726, 1, 0, 1,
-0.4277628, -0.1975411, -2.627755, 0.03921569, 1, 0, 1,
-0.417914, 0.5251592, 0.7276227, 0.03137255, 1, 0, 1,
-0.4155395, 1.230088, -0.2600322, 0.02745098, 1, 0, 1,
-0.4123368, -1.597013, -2.258583, 0.01960784, 1, 0, 1,
-0.4067386, -0.04413806, -2.071134, 0.01568628, 1, 0, 1,
-0.4032921, -0.01051798, -1.563292, 0.007843138, 1, 0, 1,
-0.4009177, 0.3507219, -0.1474996, 0.003921569, 1, 0, 1,
-0.4000126, -0.1967746, -1.596282, 0, 1, 0.003921569, 1,
-0.3976722, 0.03977142, -1.674518, 0, 1, 0.01176471, 1,
-0.3922735, 0.17997, -1.452, 0, 1, 0.01568628, 1,
-0.3910063, -0.6614, -1.848945, 0, 1, 0.02352941, 1,
-0.3876868, -2.107631, -2.581982, 0, 1, 0.02745098, 1,
-0.3829609, 0.4899721, -1.76396, 0, 1, 0.03529412, 1,
-0.3803155, 0.47672, -1.200648, 0, 1, 0.03921569, 1,
-0.3781427, 0.8297232, -1.226626, 0, 1, 0.04705882, 1,
-0.3753539, 1.245826, 0.7557329, 0, 1, 0.05098039, 1,
-0.3729616, -0.03699667, -2.433066, 0, 1, 0.05882353, 1,
-0.3669261, -0.4225994, -0.8022882, 0, 1, 0.0627451, 1,
-0.3652268, -0.5696139, -0.3556754, 0, 1, 0.07058824, 1,
-0.3626539, 0.2302675, -2.100834, 0, 1, 0.07450981, 1,
-0.3615991, -0.1715975, -3.191138, 0, 1, 0.08235294, 1,
-0.3605185, -0.3719423, -1.446514, 0, 1, 0.08627451, 1,
-0.3547781, 0.4275271, -0.04792207, 0, 1, 0.09411765, 1,
-0.3531415, 0.1246024, -1.963325, 0, 1, 0.1019608, 1,
-0.3527074, 0.7931505, -1.282097, 0, 1, 0.1058824, 1,
-0.3508661, -1.439354, -2.502065, 0, 1, 0.1137255, 1,
-0.3429747, -1.720503, -1.567754, 0, 1, 0.1176471, 1,
-0.3425043, -1.287545, -2.00597, 0, 1, 0.1254902, 1,
-0.334007, -2.65664, -2.372704, 0, 1, 0.1294118, 1,
-0.3338048, -0.1353511, -1.64065, 0, 1, 0.1372549, 1,
-0.3324099, -0.1839315, -2.172663, 0, 1, 0.1411765, 1,
-0.3304413, 0.9088382, 0.1087084, 0, 1, 0.1490196, 1,
-0.3261223, 0.4998193, -1.171579, 0, 1, 0.1529412, 1,
-0.3260315, -0.1925563, -2.454838, 0, 1, 0.1607843, 1,
-0.3226135, 0.01291619, -1.513614, 0, 1, 0.1647059, 1,
-0.3222637, -0.8653485, -5.199587, 0, 1, 0.172549, 1,
-0.3182342, 0.2104422, 0.7007849, 0, 1, 0.1764706, 1,
-0.3170205, -0.7423226, -3.260343, 0, 1, 0.1843137, 1,
-0.3164282, 0.8078817, 0.789909, 0, 1, 0.1882353, 1,
-0.3162317, -0.3324696, -2.113584, 0, 1, 0.1960784, 1,
-0.3139587, 0.003532022, -1.895592, 0, 1, 0.2039216, 1,
-0.3134073, 1.826744, 1.350157, 0, 1, 0.2078431, 1,
-0.3118189, 0.2051703, -1.721102, 0, 1, 0.2156863, 1,
-0.3079449, -0.6797994, -0.5260944, 0, 1, 0.2196078, 1,
-0.3073382, -0.8886825, -1.554277, 0, 1, 0.227451, 1,
-0.3030322, 1.431176, 1.148443, 0, 1, 0.2313726, 1,
-0.3001998, 0.6467821, 0.09728861, 0, 1, 0.2392157, 1,
-0.298891, 0.1993046, 0.008853422, 0, 1, 0.2431373, 1,
-0.2872767, -1.232042, -2.694061, 0, 1, 0.2509804, 1,
-0.2844012, -1.124798, -1.663237, 0, 1, 0.254902, 1,
-0.282993, 0.1121076, -0.4929549, 0, 1, 0.2627451, 1,
-0.2804194, 0.7467952, -0.153705, 0, 1, 0.2666667, 1,
-0.2781169, -0.6847442, -2.740647, 0, 1, 0.2745098, 1,
-0.2735974, 0.2132054, -2.770762, 0, 1, 0.2784314, 1,
-0.2709242, 3.04585, 0.02297239, 0, 1, 0.2862745, 1,
-0.2706196, -0.6661646, -3.550467, 0, 1, 0.2901961, 1,
-0.2667018, 1.306129, -1.016706, 0, 1, 0.2980392, 1,
-0.266539, 0.2883031, -3.230694, 0, 1, 0.3058824, 1,
-0.262272, 0.874794, 0.05580657, 0, 1, 0.3098039, 1,
-0.2618081, -0.1813819, -3.256014, 0, 1, 0.3176471, 1,
-0.2604091, -0.1634449, -2.972292, 0, 1, 0.3215686, 1,
-0.2574449, 2.094721, 2.636018, 0, 1, 0.3294118, 1,
-0.2568029, -0.07150229, -1.306473, 0, 1, 0.3333333, 1,
-0.2548006, -1.582672, -2.899081, 0, 1, 0.3411765, 1,
-0.2524171, -2.867763, -2.89042, 0, 1, 0.345098, 1,
-0.2496835, -1.218752, -2.646171, 0, 1, 0.3529412, 1,
-0.2461165, 0.3664603, 0.8564554, 0, 1, 0.3568628, 1,
-0.2406975, -1.06733, -1.60544, 0, 1, 0.3647059, 1,
-0.2377123, -0.76601, -1.555135, 0, 1, 0.3686275, 1,
-0.2366649, 0.4060633, 0.2491553, 0, 1, 0.3764706, 1,
-0.2327396, -1.257553, -3.534097, 0, 1, 0.3803922, 1,
-0.2311505, 0.05224969, -1.965982, 0, 1, 0.3882353, 1,
-0.230189, -0.09313054, -3.161637, 0, 1, 0.3921569, 1,
-0.2291619, 2.391883, -0.5451016, 0, 1, 0.4, 1,
-0.2256112, -0.8665909, -4.091285, 0, 1, 0.4078431, 1,
-0.2230505, -0.5383597, 0.8693492, 0, 1, 0.4117647, 1,
-0.2211462, -0.1381915, -1.353378, 0, 1, 0.4196078, 1,
-0.2167333, 0.1968844, 1.478404, 0, 1, 0.4235294, 1,
-0.2141722, 1.142532, -0.7723008, 0, 1, 0.4313726, 1,
-0.2129743, 1.024925, -0.04626939, 0, 1, 0.4352941, 1,
-0.2123607, -0.5305565, -1.830089, 0, 1, 0.4431373, 1,
-0.2076695, 0.1053503, -1.260159, 0, 1, 0.4470588, 1,
-0.206242, -0.6669919, -1.592354, 0, 1, 0.454902, 1,
-0.1979193, 1.578437, -1.057907, 0, 1, 0.4588235, 1,
-0.1968192, 1.91402, 0.3950302, 0, 1, 0.4666667, 1,
-0.1955962, 0.4448964, -0.4550301, 0, 1, 0.4705882, 1,
-0.1953729, 0.8103278, -0.08923034, 0, 1, 0.4784314, 1,
-0.1947316, -1.43671, -3.478291, 0, 1, 0.4823529, 1,
-0.1836472, 0.2680258, -0.6926866, 0, 1, 0.4901961, 1,
-0.182946, -1.501813, -2.54416, 0, 1, 0.4941176, 1,
-0.1819914, 0.3891706, -0.2605028, 0, 1, 0.5019608, 1,
-0.1803586, 0.5887353, -0.2609373, 0, 1, 0.509804, 1,
-0.1750209, 0.7119309, 0.5350849, 0, 1, 0.5137255, 1,
-0.1694885, 0.101533, -0.8035455, 0, 1, 0.5215687, 1,
-0.1688312, 0.5985292, -1.345715, 0, 1, 0.5254902, 1,
-0.1621139, -0.7304671, -3.419626, 0, 1, 0.5333334, 1,
-0.1561745, -0.15256, -3.599226, 0, 1, 0.5372549, 1,
-0.1520771, 0.2350753, -1.455178, 0, 1, 0.5450981, 1,
-0.1510566, 0.6364509, -0.1125161, 0, 1, 0.5490196, 1,
-0.1480934, -1.620083, -3.022911, 0, 1, 0.5568628, 1,
-0.1475949, -0.3569371, -2.43933, 0, 1, 0.5607843, 1,
-0.1414224, -2.173304, -1.75974, 0, 1, 0.5686275, 1,
-0.1384785, -1.693795, -2.538707, 0, 1, 0.572549, 1,
-0.1361518, -1.544384, -4.475983, 0, 1, 0.5803922, 1,
-0.1346345, 1.104348, -0.1249402, 0, 1, 0.5843138, 1,
-0.1339633, 1.033318, 0.7060322, 0, 1, 0.5921569, 1,
-0.1310408, 0.276584, -1.349613, 0, 1, 0.5960785, 1,
-0.1230124, 1.569097, -0.8948687, 0, 1, 0.6039216, 1,
-0.113778, 0.895748, -1.266363, 0, 1, 0.6117647, 1,
-0.1125611, -1.315, -4.052732, 0, 1, 0.6156863, 1,
-0.1067725, -0.4403794, -2.255054, 0, 1, 0.6235294, 1,
-0.09828555, 0.4783913, 1.046034, 0, 1, 0.627451, 1,
-0.09241705, -0.643119, -3.673419, 0, 1, 0.6352941, 1,
-0.09142314, 1.493468, -0.2370569, 0, 1, 0.6392157, 1,
-0.08675499, 0.5856291, -1.302342, 0, 1, 0.6470588, 1,
-0.08665723, -0.7267901, -3.915667, 0, 1, 0.6509804, 1,
-0.08643413, 0.593546, 0.1446127, 0, 1, 0.6588235, 1,
-0.0822911, 0.7666319, 0.6995139, 0, 1, 0.6627451, 1,
-0.08208243, -1.740897, -3.790808, 0, 1, 0.6705883, 1,
-0.07965473, -0.2127198, -1.99365, 0, 1, 0.6745098, 1,
-0.07869136, 0.8639936, -0.03977377, 0, 1, 0.682353, 1,
-0.0740658, -0.904255, -3.859539, 0, 1, 0.6862745, 1,
-0.07307135, -1.349209, -1.748388, 0, 1, 0.6941177, 1,
-0.07278309, -0.6078324, -2.535985, 0, 1, 0.7019608, 1,
-0.06968845, 0.246319, 1.341909, 0, 1, 0.7058824, 1,
-0.06802336, -0.4273626, -1.388028, 0, 1, 0.7137255, 1,
-0.06636311, -0.5333331, -3.318047, 0, 1, 0.7176471, 1,
-0.05717707, -0.04111457, -3.461315, 0, 1, 0.7254902, 1,
-0.0561115, 1.278536, -1.556871, 0, 1, 0.7294118, 1,
-0.05539574, 0.1987836, -0.7639256, 0, 1, 0.7372549, 1,
-0.05050511, 0.6397384, -0.8969772, 0, 1, 0.7411765, 1,
-0.04542836, 0.8951463, -2.37207, 0, 1, 0.7490196, 1,
-0.0454025, -1.356197, -2.636256, 0, 1, 0.7529412, 1,
-0.04494752, -0.9230872, -2.257469, 0, 1, 0.7607843, 1,
-0.04477536, 0.5701718, -0.2778712, 0, 1, 0.7647059, 1,
-0.04472874, 0.7718043, -1.009094, 0, 1, 0.772549, 1,
-0.04207332, 0.2346773, 1.744786, 0, 1, 0.7764706, 1,
-0.04090184, 1.070253, -0.3955747, 0, 1, 0.7843137, 1,
-0.03822445, -1.071327, -4.174126, 0, 1, 0.7882353, 1,
-0.03787887, 0.2541823, -0.5421131, 0, 1, 0.7960784, 1,
-0.03738061, 0.7782198, 1.293743, 0, 1, 0.8039216, 1,
-0.03717285, 1.043781, -1.380273, 0, 1, 0.8078431, 1,
-0.03333158, -0.6350201, -2.189092, 0, 1, 0.8156863, 1,
-0.03322255, -0.8369247, -2.086687, 0, 1, 0.8196079, 1,
-0.03059429, 0.6817238, -0.7397538, 0, 1, 0.827451, 1,
-0.01640802, 0.4660017, 0.4139592, 0, 1, 0.8313726, 1,
-0.0161445, -0.51553, -3.451504, 0, 1, 0.8392157, 1,
-0.01566069, -0.2325318, -0.535733, 0, 1, 0.8431373, 1,
-0.01295327, -0.2438745, -2.374758, 0, 1, 0.8509804, 1,
-0.01232463, -0.02523551, -1.18831, 0, 1, 0.854902, 1,
-0.01068738, -1.461177, -3.543104, 0, 1, 0.8627451, 1,
-0.003261792, -0.5499396, -2.845268, 0, 1, 0.8666667, 1,
0.002700077, -1.245266, 5.227973, 0, 1, 0.8745098, 1,
0.006931596, 1.492583, 0.6651028, 0, 1, 0.8784314, 1,
0.01172678, 0.08535335, 0.3531185, 0, 1, 0.8862745, 1,
0.01347518, 0.8137328, -0.9773199, 0, 1, 0.8901961, 1,
0.01410853, 1.114906, 0.5588449, 0, 1, 0.8980392, 1,
0.01476208, 0.3616609, -1.460911, 0, 1, 0.9058824, 1,
0.01950278, -0.9100332, 4.303629, 0, 1, 0.9098039, 1,
0.02292681, -0.3959165, 2.229109, 0, 1, 0.9176471, 1,
0.02450862, -1.724977, 3.661156, 0, 1, 0.9215686, 1,
0.02555846, 0.2723915, -0.1338866, 0, 1, 0.9294118, 1,
0.03660875, -0.2641822, 1.480333, 0, 1, 0.9333333, 1,
0.03735456, -0.8381246, 5.107106, 0, 1, 0.9411765, 1,
0.0495806, -0.09943826, 3.78311, 0, 1, 0.945098, 1,
0.05175861, -0.5860863, 2.366946, 0, 1, 0.9529412, 1,
0.05188688, 0.6980854, -0.1477242, 0, 1, 0.9568627, 1,
0.05532844, 0.7811665, -0.3066759, 0, 1, 0.9647059, 1,
0.05894354, -0.2277192, 2.720571, 0, 1, 0.9686275, 1,
0.05908349, -1.028777, 2.799224, 0, 1, 0.9764706, 1,
0.06013967, 1.168728, 1.866188, 0, 1, 0.9803922, 1,
0.06350248, -2.209607, 2.33141, 0, 1, 0.9882353, 1,
0.06800815, -0.3164897, 2.217458, 0, 1, 0.9921569, 1,
0.06805929, 0.3810767, 0.9913023, 0, 1, 1, 1,
0.06854609, -0.5987903, 3.735737, 0, 0.9921569, 1, 1,
0.06919581, -1.560951, 2.391314, 0, 0.9882353, 1, 1,
0.06979069, 0.08151524, 0.05588787, 0, 0.9803922, 1, 1,
0.07576704, -1.687489, 4.376153, 0, 0.9764706, 1, 1,
0.07590175, 0.6499892, 1.352874, 0, 0.9686275, 1, 1,
0.08893464, 0.6578567, 0.3462872, 0, 0.9647059, 1, 1,
0.09080704, 0.05686043, 2.288365, 0, 0.9568627, 1, 1,
0.09226205, -0.1438733, 3.569791, 0, 0.9529412, 1, 1,
0.09546725, 0.6316475, -0.6468363, 0, 0.945098, 1, 1,
0.09602187, -0.3403384, 1.541296, 0, 0.9411765, 1, 1,
0.09655727, 0.9893131, -3.36816, 0, 0.9333333, 1, 1,
0.09731247, -1.186895, 5.170712, 0, 0.9294118, 1, 1,
0.09758288, -2.65068, 2.038976, 0, 0.9215686, 1, 1,
0.1005589, -0.6760385, 2.300616, 0, 0.9176471, 1, 1,
0.1010048, -0.8974233, 2.532593, 0, 0.9098039, 1, 1,
0.1019282, -0.2632717, 2.112633, 0, 0.9058824, 1, 1,
0.1111376, -0.6985347, 3.219364, 0, 0.8980392, 1, 1,
0.1121102, 0.6612539, 1.52225, 0, 0.8901961, 1, 1,
0.1141579, -0.8891824, 3.27958, 0, 0.8862745, 1, 1,
0.1146569, -0.1648212, 3.10925, 0, 0.8784314, 1, 1,
0.1168, -0.9959568, 2.017961, 0, 0.8745098, 1, 1,
0.1209555, 0.771877, -1.330049, 0, 0.8666667, 1, 1,
0.1230787, -1.517249, 3.397021, 0, 0.8627451, 1, 1,
0.1266517, -1.237694, 1.141047, 0, 0.854902, 1, 1,
0.1281569, -0.7378319, 1.67349, 0, 0.8509804, 1, 1,
0.1325003, -0.08021418, 0.924224, 0, 0.8431373, 1, 1,
0.1343721, 0.7331892, -0.4520105, 0, 0.8392157, 1, 1,
0.1394173, -0.5233955, 2.239481, 0, 0.8313726, 1, 1,
0.1403673, 0.6109833, -0.927038, 0, 0.827451, 1, 1,
0.1406082, 0.1815074, 1.006565, 0, 0.8196079, 1, 1,
0.1547966, 1.391107, -0.2400884, 0, 0.8156863, 1, 1,
0.1561224, 0.6127625, 2.644048, 0, 0.8078431, 1, 1,
0.1584556, -0.4715762, 1.530919, 0, 0.8039216, 1, 1,
0.1593165, -0.04066188, -0.2740428, 0, 0.7960784, 1, 1,
0.1597766, -1.41441, 2.101017, 0, 0.7882353, 1, 1,
0.1600477, -1.298092, 3.983285, 0, 0.7843137, 1, 1,
0.1606734, 1.908308, 1.045388, 0, 0.7764706, 1, 1,
0.1621575, 0.3061488, 1.627676, 0, 0.772549, 1, 1,
0.1631728, -0.274534, 4.061162, 0, 0.7647059, 1, 1,
0.165943, -0.5463551, 2.302641, 0, 0.7607843, 1, 1,
0.1673941, 0.8374383, 0.7563562, 0, 0.7529412, 1, 1,
0.16943, -0.5730768, 2.459778, 0, 0.7490196, 1, 1,
0.1710505, 0.3638646, 1.354532, 0, 0.7411765, 1, 1,
0.1714469, 0.7204105, -0.1938198, 0, 0.7372549, 1, 1,
0.1732145, -0.2378286, 2.310432, 0, 0.7294118, 1, 1,
0.1739615, -1.940535, 2.699829, 0, 0.7254902, 1, 1,
0.1763736, -1.161165, 2.32066, 0, 0.7176471, 1, 1,
0.1776379, 0.7406667, -0.2106821, 0, 0.7137255, 1, 1,
0.1807105, -0.2541442, 1.821115, 0, 0.7058824, 1, 1,
0.1867315, -0.6464911, 1.653644, 0, 0.6980392, 1, 1,
0.187402, 0.4941946, 0.7910775, 0, 0.6941177, 1, 1,
0.1882339, -0.07538658, 3.237749, 0, 0.6862745, 1, 1,
0.1903086, 0.7791031, -0.8130313, 0, 0.682353, 1, 1,
0.1916499, 0.05173045, 1.735727, 0, 0.6745098, 1, 1,
0.1942489, 0.02249938, 1.140254, 0, 0.6705883, 1, 1,
0.2002904, -0.5090787, 5.377744, 0, 0.6627451, 1, 1,
0.2060508, -0.3177331, 2.182106, 0, 0.6588235, 1, 1,
0.2066432, 0.8663273, 1.478694, 0, 0.6509804, 1, 1,
0.2113682, -1.205092, 4.0974, 0, 0.6470588, 1, 1,
0.2117074, 0.1140786, 1.283535, 0, 0.6392157, 1, 1,
0.2118007, -0.1998633, 1.883983, 0, 0.6352941, 1, 1,
0.2162134, -1.177842, 2.621766, 0, 0.627451, 1, 1,
0.2174661, -0.295554, 0.7355113, 0, 0.6235294, 1, 1,
0.2192049, -0.1081468, 1.774149, 0, 0.6156863, 1, 1,
0.2264926, 0.3673571, -0.4528849, 0, 0.6117647, 1, 1,
0.227029, -0.5549572, 2.493302, 0, 0.6039216, 1, 1,
0.2304182, 0.1378909, -0.4532007, 0, 0.5960785, 1, 1,
0.2344348, 0.3171337, 1.886917, 0, 0.5921569, 1, 1,
0.2383271, -1.069771, 2.548969, 0, 0.5843138, 1, 1,
0.2389003, -1.045988, 2.386502, 0, 0.5803922, 1, 1,
0.239223, 0.6610507, 0.7129068, 0, 0.572549, 1, 1,
0.240216, -0.1147618, -0.2006388, 0, 0.5686275, 1, 1,
0.2404385, -0.178042, 4.520932, 0, 0.5607843, 1, 1,
0.2406752, 0.5782638, 0.7173231, 0, 0.5568628, 1, 1,
0.2406935, -0.1443474, 3.285126, 0, 0.5490196, 1, 1,
0.2499186, -0.1646685, 2.111052, 0, 0.5450981, 1, 1,
0.2525326, 0.3533615, 0.5358686, 0, 0.5372549, 1, 1,
0.2526534, -0.5343041, 2.196577, 0, 0.5333334, 1, 1,
0.2561166, -0.4873411, 0.2990284, 0, 0.5254902, 1, 1,
0.2587646, 1.781355, 0.5460537, 0, 0.5215687, 1, 1,
0.2590961, -1.69303, 1.908636, 0, 0.5137255, 1, 1,
0.2595972, -0.745672, 3.791962, 0, 0.509804, 1, 1,
0.2616416, 0.9610706, 1.845092, 0, 0.5019608, 1, 1,
0.2618683, -0.9156037, 3.419906, 0, 0.4941176, 1, 1,
0.2621233, -0.2531224, 3.573093, 0, 0.4901961, 1, 1,
0.2632797, 0.7558498, 1.280612, 0, 0.4823529, 1, 1,
0.2655682, -0.01467407, 2.662768, 0, 0.4784314, 1, 1,
0.2670205, 0.6982788, 2.096596, 0, 0.4705882, 1, 1,
0.2697165, 2.399283, 0.078498, 0, 0.4666667, 1, 1,
0.2710589, 0.713206, 1.968784, 0, 0.4588235, 1, 1,
0.2747609, 0.8892084, 0.57328, 0, 0.454902, 1, 1,
0.2753186, -0.1850964, 3.206917, 0, 0.4470588, 1, 1,
0.2758107, -2.589608, 3.283065, 0, 0.4431373, 1, 1,
0.2762496, 0.746992, 2.372418, 0, 0.4352941, 1, 1,
0.2815607, -1.05535, 3.629011, 0, 0.4313726, 1, 1,
0.2825657, -1.511212, 4.195394, 0, 0.4235294, 1, 1,
0.2862502, 0.6904357, -0.7072279, 0, 0.4196078, 1, 1,
0.2862936, 0.5487915, 2.130435, 0, 0.4117647, 1, 1,
0.2912041, -0.5708693, -0.1126396, 0, 0.4078431, 1, 1,
0.292371, 1.07167, 0.08458912, 0, 0.4, 1, 1,
0.2933339, 0.3139447, 0.3977866, 0, 0.3921569, 1, 1,
0.3007824, -0.2480776, 2.481824, 0, 0.3882353, 1, 1,
0.3024571, -0.4193178, 2.720966, 0, 0.3803922, 1, 1,
0.3034099, -0.9953048, 3.660044, 0, 0.3764706, 1, 1,
0.3041143, 0.7497942, 0.4435289, 0, 0.3686275, 1, 1,
0.3074307, 0.279714, 1.633742, 0, 0.3647059, 1, 1,
0.3151436, -0.2009565, 3.489369, 0, 0.3568628, 1, 1,
0.3156504, 1.143343, 0.9615228, 0, 0.3529412, 1, 1,
0.3178497, -0.6133288, 1.558424, 0, 0.345098, 1, 1,
0.318311, -0.5671411, 2.369471, 0, 0.3411765, 1, 1,
0.3197064, -1.000102, 2.119661, 0, 0.3333333, 1, 1,
0.322102, 0.2460635, 1.513953, 0, 0.3294118, 1, 1,
0.3225615, 0.7864071, -0.1033963, 0, 0.3215686, 1, 1,
0.322878, 0.5741288, 1.445938, 0, 0.3176471, 1, 1,
0.3232355, -0.1773677, 1.464038, 0, 0.3098039, 1, 1,
0.3264107, -0.02410257, 1.405105, 0, 0.3058824, 1, 1,
0.3315691, 1.577943, -0.4565798, 0, 0.2980392, 1, 1,
0.3346518, 0.4576005, -0.1785497, 0, 0.2901961, 1, 1,
0.3373941, 0.09140496, 0.2078419, 0, 0.2862745, 1, 1,
0.3394352, -2.35276, 3.250032, 0, 0.2784314, 1, 1,
0.3440994, 1.7922, 0.1471076, 0, 0.2745098, 1, 1,
0.344935, 0.1832237, -0.6081048, 0, 0.2666667, 1, 1,
0.34703, 0.842352, 0.8677031, 0, 0.2627451, 1, 1,
0.3472163, -0.007240135, 1.96723, 0, 0.254902, 1, 1,
0.3474272, 0.9675874, -0.5185442, 0, 0.2509804, 1, 1,
0.3477472, 1.058487, 1.35349, 0, 0.2431373, 1, 1,
0.3489987, -0.304362, 1.411672, 0, 0.2392157, 1, 1,
0.3507609, -0.45863, 2.556595, 0, 0.2313726, 1, 1,
0.3516778, -0.6671121, 3.873398, 0, 0.227451, 1, 1,
0.3519304, 0.7890224, -1.25586, 0, 0.2196078, 1, 1,
0.3537197, 0.1589049, 0.214948, 0, 0.2156863, 1, 1,
0.3571453, -1.390807, 2.37122, 0, 0.2078431, 1, 1,
0.3632083, 0.2404664, 1.587583, 0, 0.2039216, 1, 1,
0.364183, -0.2600284, 1.640109, 0, 0.1960784, 1, 1,
0.36951, -1.728053, 2.696091, 0, 0.1882353, 1, 1,
0.3724655, -2.258792, 3.994978, 0, 0.1843137, 1, 1,
0.3747215, -0.8406097, 4.558344, 0, 0.1764706, 1, 1,
0.3799296, -2.545615, 3.226104, 0, 0.172549, 1, 1,
0.385418, -0.5651596, 1.778728, 0, 0.1647059, 1, 1,
0.388272, -0.2159291, 3.71376, 0, 0.1607843, 1, 1,
0.3955994, 0.0556535, 2.474491, 0, 0.1529412, 1, 1,
0.3972201, -0.2188801, 1.661451, 0, 0.1490196, 1, 1,
0.3981974, -1.801703, 2.570708, 0, 0.1411765, 1, 1,
0.4018058, -0.5667173, 3.793754, 0, 0.1372549, 1, 1,
0.4031354, -0.7251762, 1.87241, 0, 0.1294118, 1, 1,
0.4033967, -0.7679066, 4.237275, 0, 0.1254902, 1, 1,
0.4068899, 0.3125085, 1.404286, 0, 0.1176471, 1, 1,
0.4082706, -1.929384, 2.80574, 0, 0.1137255, 1, 1,
0.4102102, 2.141521, 2.804091, 0, 0.1058824, 1, 1,
0.4118843, 0.6164137, 0.766642, 0, 0.09803922, 1, 1,
0.4125659, 0.2907366, 0.4627606, 0, 0.09411765, 1, 1,
0.4131748, 0.7092246, -0.1021113, 0, 0.08627451, 1, 1,
0.4135532, 0.41225, 1.860675, 0, 0.08235294, 1, 1,
0.4153956, -0.0931979, 3.125931, 0, 0.07450981, 1, 1,
0.4166242, -0.710324, 2.744056, 0, 0.07058824, 1, 1,
0.4175017, 0.9891912, 2.26294, 0, 0.0627451, 1, 1,
0.4243442, -0.4885054, 3.069788, 0, 0.05882353, 1, 1,
0.4285117, -0.4379426, 1.698741, 0, 0.05098039, 1, 1,
0.4335444, -0.004368861, 0.8768427, 0, 0.04705882, 1, 1,
0.442537, -0.7740636, 5.197072, 0, 0.03921569, 1, 1,
0.4439482, 0.07694105, 0.8984604, 0, 0.03529412, 1, 1,
0.4496816, -0.6921328, 3.606249, 0, 0.02745098, 1, 1,
0.451432, 0.6780131, 0.4136348, 0, 0.02352941, 1, 1,
0.454209, 0.4601296, 1.568661, 0, 0.01568628, 1, 1,
0.4574689, -1.562461, 3.551722, 0, 0.01176471, 1, 1,
0.4628829, 0.0337825, 1.471763, 0, 0.003921569, 1, 1,
0.4639808, 1.366167, 0.7286769, 0.003921569, 0, 1, 1,
0.4660884, -0.5771995, 2.033804, 0.007843138, 0, 1, 1,
0.4724807, 0.4457583, 1.146178, 0.01568628, 0, 1, 1,
0.4776345, 0.7861606, -0.2894795, 0.01960784, 0, 1, 1,
0.477778, 1.320122, -1.736377, 0.02745098, 0, 1, 1,
0.4802884, -0.7059488, 2.790696, 0.03137255, 0, 1, 1,
0.4833631, -0.2586443, 2.85045, 0.03921569, 0, 1, 1,
0.4841036, -0.02170789, 1.635627, 0.04313726, 0, 1, 1,
0.4852027, 1.239985, 1.173711, 0.05098039, 0, 1, 1,
0.4905388, -1.333927, 3.620294, 0.05490196, 0, 1, 1,
0.4936954, 0.6304246, 0.106164, 0.0627451, 0, 1, 1,
0.4939924, -0.4393385, 2.201079, 0.06666667, 0, 1, 1,
0.4986222, 0.1386883, 1.023464, 0.07450981, 0, 1, 1,
0.5066808, -0.2791197, 1.098539, 0.07843138, 0, 1, 1,
0.5117356, -1.705973, 1.9597, 0.08627451, 0, 1, 1,
0.5159763, -0.2625462, 2.514326, 0.09019608, 0, 1, 1,
0.5161562, -0.5528411, 1.05628, 0.09803922, 0, 1, 1,
0.5177327, 1.646317, -0.1748435, 0.1058824, 0, 1, 1,
0.5245448, -1.8362, 2.041681, 0.1098039, 0, 1, 1,
0.5249031, 0.6768908, 2.511508, 0.1176471, 0, 1, 1,
0.5272773, -1.038592, 5.071903, 0.1215686, 0, 1, 1,
0.5315372, -1.724308, 1.939107, 0.1294118, 0, 1, 1,
0.5390652, 0.1536838, 0.02842954, 0.1333333, 0, 1, 1,
0.5444499, 0.8091567, 0.7556285, 0.1411765, 0, 1, 1,
0.5471197, 0.3753989, -0.5759051, 0.145098, 0, 1, 1,
0.5507397, 0.8686449, -1.766962, 0.1529412, 0, 1, 1,
0.5588219, -0.6185888, 2.279603, 0.1568628, 0, 1, 1,
0.5618868, 0.5090091, 1.181375, 0.1647059, 0, 1, 1,
0.5620344, -1.240618, 2.081025, 0.1686275, 0, 1, 1,
0.56869, -0.1520578, 3.858866, 0.1764706, 0, 1, 1,
0.569301, -0.09754746, 3.558276, 0.1803922, 0, 1, 1,
0.5734146, 0.982327, 0.8504358, 0.1882353, 0, 1, 1,
0.5764988, -0.515801, 2.746105, 0.1921569, 0, 1, 1,
0.577516, 0.9155829, 1.324018, 0.2, 0, 1, 1,
0.5777725, 0.7268927, 0.9766159, 0.2078431, 0, 1, 1,
0.5800714, 0.4019809, 2.013523, 0.2117647, 0, 1, 1,
0.5826105, 1.03887, 2.172328, 0.2196078, 0, 1, 1,
0.5830618, -0.1082766, 3.162127, 0.2235294, 0, 1, 1,
0.5836758, -0.3219443, 1.082877, 0.2313726, 0, 1, 1,
0.5843567, 0.006548475, 0.4041454, 0.2352941, 0, 1, 1,
0.5954481, 0.04483103, 1.868758, 0.2431373, 0, 1, 1,
0.5968445, 0.777945, 1.981429, 0.2470588, 0, 1, 1,
0.5980588, -0.8051221, 2.552158, 0.254902, 0, 1, 1,
0.5982196, -0.9339287, 1.585313, 0.2588235, 0, 1, 1,
0.5989965, -0.1924359, 1.91479, 0.2666667, 0, 1, 1,
0.5993735, 0.6244339, -0.2699851, 0.2705882, 0, 1, 1,
0.6029823, -0.3745413, 1.258931, 0.2784314, 0, 1, 1,
0.6055908, -0.8753785, 1.381446, 0.282353, 0, 1, 1,
0.6098294, 2.122309, 0.8323837, 0.2901961, 0, 1, 1,
0.619969, -0.4712442, 1.184361, 0.2941177, 0, 1, 1,
0.6212828, -0.4752423, 1.419554, 0.3019608, 0, 1, 1,
0.6263006, -0.2004084, 3.78489, 0.3098039, 0, 1, 1,
0.628812, 0.897175, 0.4481891, 0.3137255, 0, 1, 1,
0.6316973, 0.5278563, 0.4669373, 0.3215686, 0, 1, 1,
0.6337046, -0.4479438, 1.603735, 0.3254902, 0, 1, 1,
0.6406971, 1.060881, 0.7193322, 0.3333333, 0, 1, 1,
0.640808, 0.918938, 0.1121673, 0.3372549, 0, 1, 1,
0.6436607, 1.185439, 0.6852335, 0.345098, 0, 1, 1,
0.650614, -0.6423195, 3.584066, 0.3490196, 0, 1, 1,
0.6552672, 0.1830761, 2.104639, 0.3568628, 0, 1, 1,
0.6607331, -1.594317, 2.769122, 0.3607843, 0, 1, 1,
0.6628313, 0.05425558, 0.7550294, 0.3686275, 0, 1, 1,
0.668867, -0.2596819, 2.323798, 0.372549, 0, 1, 1,
0.6712015, -0.8014932, 2.31259, 0.3803922, 0, 1, 1,
0.6751079, 0.3588265, 0.7016805, 0.3843137, 0, 1, 1,
0.676994, -0.5286036, 2.319867, 0.3921569, 0, 1, 1,
0.6774225, -0.197221, 2.377984, 0.3960784, 0, 1, 1,
0.6782138, 0.3283736, 2.016767, 0.4039216, 0, 1, 1,
0.6800976, 0.0791842, 0.7853598, 0.4117647, 0, 1, 1,
0.6845052, 0.004360277, 0.7331874, 0.4156863, 0, 1, 1,
0.6845576, -0.7426077, 1.245121, 0.4235294, 0, 1, 1,
0.6863468, -0.7726392, 0.4387275, 0.427451, 0, 1, 1,
0.6896572, -0.590897, 2.539248, 0.4352941, 0, 1, 1,
0.6918969, -0.4302302, 2.589457, 0.4392157, 0, 1, 1,
0.6934972, 1.52923, -0.8065788, 0.4470588, 0, 1, 1,
0.6946721, -2.828748, 2.779401, 0.4509804, 0, 1, 1,
0.6993703, 0.833425, 0.3880982, 0.4588235, 0, 1, 1,
0.7094957, -0.2711573, 1.772604, 0.4627451, 0, 1, 1,
0.7099122, -1.176898, 1.498919, 0.4705882, 0, 1, 1,
0.711907, 0.2186154, 1.394524, 0.4745098, 0, 1, 1,
0.7127391, -0.9933534, 4.415601, 0.4823529, 0, 1, 1,
0.7127585, 0.6035205, 3.326548, 0.4862745, 0, 1, 1,
0.7162867, 0.7933396, 1.456555, 0.4941176, 0, 1, 1,
0.7172279, -0.390481, 2.417588, 0.5019608, 0, 1, 1,
0.7182123, -0.411207, 2.889993, 0.5058824, 0, 1, 1,
0.7200783, -0.5373012, 1.146226, 0.5137255, 0, 1, 1,
0.725133, 0.7156714, -0.3794824, 0.5176471, 0, 1, 1,
0.732827, 0.8040292, -0.2615395, 0.5254902, 0, 1, 1,
0.733886, 1.111169, 0.7987133, 0.5294118, 0, 1, 1,
0.7384424, 0.4220642, 0.6371282, 0.5372549, 0, 1, 1,
0.744509, -1.12362, 1.406693, 0.5411765, 0, 1, 1,
0.7473428, 0.6271266, 0.8006995, 0.5490196, 0, 1, 1,
0.7475369, -0.5842776, 3.132694, 0.5529412, 0, 1, 1,
0.7534919, 1.186047, 0.6362256, 0.5607843, 0, 1, 1,
0.7539524, -1.515658, 4.089809, 0.5647059, 0, 1, 1,
0.7540486, 0.1219675, 0.1472549, 0.572549, 0, 1, 1,
0.7549421, 1.437348, -0.1512267, 0.5764706, 0, 1, 1,
0.7616837, 1.109014, 0.6686332, 0.5843138, 0, 1, 1,
0.7625716, 0.3891161, 0.5680068, 0.5882353, 0, 1, 1,
0.7627311, 0.1650025, -0.1705429, 0.5960785, 0, 1, 1,
0.7633041, 2.637908, 0.8469719, 0.6039216, 0, 1, 1,
0.7678629, -0.2756462, 2.917273, 0.6078432, 0, 1, 1,
0.7688325, -0.2401784, 1.116163, 0.6156863, 0, 1, 1,
0.7699472, 0.2438219, 1.785269, 0.6196079, 0, 1, 1,
0.7756686, -1.214671, 2.884771, 0.627451, 0, 1, 1,
0.7796582, -0.9158952, 3.020672, 0.6313726, 0, 1, 1,
0.7798879, -0.01241352, 3.503755, 0.6392157, 0, 1, 1,
0.7842962, 0.5408686, -0.5569679, 0.6431373, 0, 1, 1,
0.7864175, 0.6671652, -0.3540805, 0.6509804, 0, 1, 1,
0.7894013, -0.5920069, 2.727551, 0.654902, 0, 1, 1,
0.7913016, -0.4556217, 0.1217848, 0.6627451, 0, 1, 1,
0.791321, 1.819556, 0.02768348, 0.6666667, 0, 1, 1,
0.7925392, -0.2592974, 1.949062, 0.6745098, 0, 1, 1,
0.795303, 1.250147, 0.7905766, 0.6784314, 0, 1, 1,
0.8004941, 0.4461747, 0.271311, 0.6862745, 0, 1, 1,
0.8011837, -0.5632601, 0.2882707, 0.6901961, 0, 1, 1,
0.8028468, -0.05247515, 2.099147, 0.6980392, 0, 1, 1,
0.8048119, -0.1902293, 0.508873, 0.7058824, 0, 1, 1,
0.8055205, -0.978393, 1.999874, 0.7098039, 0, 1, 1,
0.8223253, -1.124978, 3.004728, 0.7176471, 0, 1, 1,
0.8228161, -1.241199, 3.991584, 0.7215686, 0, 1, 1,
0.8288757, -0.1283609, 1.355804, 0.7294118, 0, 1, 1,
0.8323397, -0.6184468, 3.096851, 0.7333333, 0, 1, 1,
0.8354943, 0.02916861, 2.501498, 0.7411765, 0, 1, 1,
0.8496819, -1.205868, 1.382286, 0.7450981, 0, 1, 1,
0.8508111, -0.02390153, 0.5102566, 0.7529412, 0, 1, 1,
0.8530177, 0.5776587, 2.303418, 0.7568628, 0, 1, 1,
0.8538857, 1.620167, 0.3909667, 0.7647059, 0, 1, 1,
0.8570746, -0.2076004, 2.834733, 0.7686275, 0, 1, 1,
0.8584659, 0.9809251, 1.561951, 0.7764706, 0, 1, 1,
0.8591722, 0.6451585, 1.331748, 0.7803922, 0, 1, 1,
0.8598669, -0.1706136, 2.066366, 0.7882353, 0, 1, 1,
0.8637313, 0.8978797, 1.545507, 0.7921569, 0, 1, 1,
0.8721321, 0.8340569, 0.2174613, 0.8, 0, 1, 1,
0.8729252, 0.8482851, 1.37327, 0.8078431, 0, 1, 1,
0.876492, 0.1839191, 1.232884, 0.8117647, 0, 1, 1,
0.8770749, 1.033257, -0.0129452, 0.8196079, 0, 1, 1,
0.8781322, 0.8834315, -0.4144885, 0.8235294, 0, 1, 1,
0.8790719, 0.6841353, 0.8487368, 0.8313726, 0, 1, 1,
0.8857874, -1.295012, 2.681938, 0.8352941, 0, 1, 1,
0.8883497, -0.2262092, 0.3214931, 0.8431373, 0, 1, 1,
0.8905217, -1.078795, 2.534034, 0.8470588, 0, 1, 1,
0.8915506, 0.5463639, 1.073321, 0.854902, 0, 1, 1,
0.8929422, -0.1192759, 0.3811403, 0.8588235, 0, 1, 1,
0.8944677, -2.456472, 1.857852, 0.8666667, 0, 1, 1,
0.8957028, 0.573895, 1.296372, 0.8705882, 0, 1, 1,
0.8972584, 1.034904, 0.1931658, 0.8784314, 0, 1, 1,
0.8992165, 0.3194524, 1.72209, 0.8823529, 0, 1, 1,
0.9020579, 0.3154294, 0.4945125, 0.8901961, 0, 1, 1,
0.9029053, 0.312725, 0.1410887, 0.8941177, 0, 1, 1,
0.9040756, -1.097379, 0.8366101, 0.9019608, 0, 1, 1,
0.9094642, 0.2145758, 2.663588, 0.9098039, 0, 1, 1,
0.9154527, 1.020237, 0.7330155, 0.9137255, 0, 1, 1,
0.9154764, 0.1864802, 1.695994, 0.9215686, 0, 1, 1,
0.9185111, 0.9256058, 1.916624, 0.9254902, 0, 1, 1,
0.9185577, -0.3167934, 1.891581, 0.9333333, 0, 1, 1,
0.9191268, -1.413173, 2.983006, 0.9372549, 0, 1, 1,
0.9206257, -1.247955, 0.5404588, 0.945098, 0, 1, 1,
0.9331561, -1.005026, 3.970873, 0.9490196, 0, 1, 1,
0.9360756, -0.1516747, -0.4649455, 0.9568627, 0, 1, 1,
0.9383506, -0.947121, 2.030971, 0.9607843, 0, 1, 1,
0.9390227, 1.083675, 1.960726, 0.9686275, 0, 1, 1,
0.9407949, 1.046009, 2.07117, 0.972549, 0, 1, 1,
0.9451072, 0.1213639, 0.2831348, 0.9803922, 0, 1, 1,
0.9462661, -0.4666368, 0.5189461, 0.9843137, 0, 1, 1,
0.9472722, 1.095863, 0.8819252, 0.9921569, 0, 1, 1,
0.950689, -0.5524667, 3.12388, 0.9960784, 0, 1, 1,
0.9520393, -0.8566112, 1.686747, 1, 0, 0.9960784, 1,
0.9542332, -0.5080116, 2.347449, 1, 0, 0.9882353, 1,
0.9641528, -0.194869, 2.395704, 1, 0, 0.9843137, 1,
0.9702821, 0.6286843, 2.651152, 1, 0, 0.9764706, 1,
0.971679, -0.240334, 0.4125222, 1, 0, 0.972549, 1,
0.9795719, -0.407093, 2.489666, 1, 0, 0.9647059, 1,
0.9842702, 1.350971, -0.07212132, 1, 0, 0.9607843, 1,
0.9855741, 0.09449954, -0.01223483, 1, 0, 0.9529412, 1,
0.98743, 0.02342051, 0.3676381, 1, 0, 0.9490196, 1,
0.9890199, 2.18925, 1.583783, 1, 0, 0.9411765, 1,
0.9957054, 2.249136, 1.488608, 1, 0, 0.9372549, 1,
1.010445, -0.276159, 0.5042232, 1, 0, 0.9294118, 1,
1.012189, -2.11056, 3.463782, 1, 0, 0.9254902, 1,
1.023342, -0.303039, 1.928563, 1, 0, 0.9176471, 1,
1.030476, 0.4853538, 1.741627, 1, 0, 0.9137255, 1,
1.032487, 0.6627803, 0.5208993, 1, 0, 0.9058824, 1,
1.037438, 0.7316341, -0.1753478, 1, 0, 0.9019608, 1,
1.039135, 0.3133571, 0.7799993, 1, 0, 0.8941177, 1,
1.040884, -1.583133, 2.040813, 1, 0, 0.8862745, 1,
1.053961, -0.1006672, 3.861403, 1, 0, 0.8823529, 1,
1.054579, -0.8447576, 3.633826, 1, 0, 0.8745098, 1,
1.064541, 1.70357, 2.122058, 1, 0, 0.8705882, 1,
1.06993, 0.2812003, 1.511133, 1, 0, 0.8627451, 1,
1.070723, 0.1392709, 2.235762, 1, 0, 0.8588235, 1,
1.073854, -0.4294674, 1.288615, 1, 0, 0.8509804, 1,
1.077957, -0.7093076, 2.138411, 1, 0, 0.8470588, 1,
1.083764, 0.8950664, 0.4093632, 1, 0, 0.8392157, 1,
1.087286, -1.278082, 2.195461, 1, 0, 0.8352941, 1,
1.095301, 0.3563598, 1.042705, 1, 0, 0.827451, 1,
1.10521, -0.3553846, 2.410649, 1, 0, 0.8235294, 1,
1.10672, 0.5674559, 0.2143752, 1, 0, 0.8156863, 1,
1.10936, 1.660986, 0.6753655, 1, 0, 0.8117647, 1,
1.11256, -0.6499503, 3.554545, 1, 0, 0.8039216, 1,
1.129661, 0.3269047, 2.368117, 1, 0, 0.7960784, 1,
1.130527, -0.05457283, 1.318633, 1, 0, 0.7921569, 1,
1.130881, -1.452682, 4.436028, 1, 0, 0.7843137, 1,
1.135396, 0.5576721, -0.06921978, 1, 0, 0.7803922, 1,
1.139788, 0.728344, 1.154087, 1, 0, 0.772549, 1,
1.14191, 0.5529954, 2.230141, 1, 0, 0.7686275, 1,
1.149239, -0.1756557, 0.7873327, 1, 0, 0.7607843, 1,
1.150644, 0.1531781, 0.5520357, 1, 0, 0.7568628, 1,
1.152446, -1.302914, 2.993801, 1, 0, 0.7490196, 1,
1.156963, 1.179031, -0.4217623, 1, 0, 0.7450981, 1,
1.158746, -1.13385, 1.927612, 1, 0, 0.7372549, 1,
1.161286, -0.8398775, 1.810289, 1, 0, 0.7333333, 1,
1.162017, -2.661594, 2.554095, 1, 0, 0.7254902, 1,
1.165302, -1.65611, 0.8842909, 1, 0, 0.7215686, 1,
1.168651, 0.6405494, 0.1748901, 1, 0, 0.7137255, 1,
1.17362, 1.242007, -0.1371197, 1, 0, 0.7098039, 1,
1.180245, -0.5228978, 1.402099, 1, 0, 0.7019608, 1,
1.185267, -0.4183562, 2.934258, 1, 0, 0.6941177, 1,
1.186655, 0.06393547, 0.8699445, 1, 0, 0.6901961, 1,
1.187107, -0.3736158, 1.809822, 1, 0, 0.682353, 1,
1.193236, 0.5680743, 1.025956, 1, 0, 0.6784314, 1,
1.200373, -0.614684, 2.00593, 1, 0, 0.6705883, 1,
1.202255, -2.085296, 3.007876, 1, 0, 0.6666667, 1,
1.222577, -0.8774759, 2.672396, 1, 0, 0.6588235, 1,
1.229198, 1.492215, 2.823689, 1, 0, 0.654902, 1,
1.2324, 1.02204, 1.998117, 1, 0, 0.6470588, 1,
1.243468, -1.823551, 1.552147, 1, 0, 0.6431373, 1,
1.245612, -1.050328, 2.355699, 1, 0, 0.6352941, 1,
1.247573, 0.2835526, 1.343773, 1, 0, 0.6313726, 1,
1.260487, -0.07955591, 2.699918, 1, 0, 0.6235294, 1,
1.271384, -0.05272546, 1.592996, 1, 0, 0.6196079, 1,
1.276554, -1.356442, 2.22978, 1, 0, 0.6117647, 1,
1.278663, 0.5668495, 0.9601454, 1, 0, 0.6078432, 1,
1.278901, 1.161933, 0.0896318, 1, 0, 0.6, 1,
1.279058, -0.7192543, 1.521851, 1, 0, 0.5921569, 1,
1.279139, 0.06970412, 3.680625, 1, 0, 0.5882353, 1,
1.285827, 2.236601, 0.8253824, 1, 0, 0.5803922, 1,
1.286162, -0.4525627, 3.372987, 1, 0, 0.5764706, 1,
1.296671, 0.4575049, -0.3410412, 1, 0, 0.5686275, 1,
1.308026, -1.283805, 1.590334, 1, 0, 0.5647059, 1,
1.314056, -0.5235198, 2.232101, 1, 0, 0.5568628, 1,
1.314673, 0.3040097, 1.29299, 1, 0, 0.5529412, 1,
1.321235, 0.7377859, 2.086312, 1, 0, 0.5450981, 1,
1.334568, 0.796131, 0.2713951, 1, 0, 0.5411765, 1,
1.335082, 1.755412, 0.3373176, 1, 0, 0.5333334, 1,
1.363962, 1.423844, 1.285511, 1, 0, 0.5294118, 1,
1.364064, -0.4086266, 2.564479, 1, 0, 0.5215687, 1,
1.371809, -1.055669, 0.05945578, 1, 0, 0.5176471, 1,
1.372326, 0.1839783, 1.459761, 1, 0, 0.509804, 1,
1.374248, -1.158664, 2.740678, 1, 0, 0.5058824, 1,
1.378178, -0.8737509, 3.018148, 1, 0, 0.4980392, 1,
1.382938, -0.009226086, 2.370568, 1, 0, 0.4901961, 1,
1.388592, 0.8788297, 0.837472, 1, 0, 0.4862745, 1,
1.401289, 0.1744276, 0.7705141, 1, 0, 0.4784314, 1,
1.402748, 0.3751955, 0.5531808, 1, 0, 0.4745098, 1,
1.403005, -1.962001, 3.213613, 1, 0, 0.4666667, 1,
1.410607, -2.169751, 3.755581, 1, 0, 0.4627451, 1,
1.419261, -0.2067974, 0.3047616, 1, 0, 0.454902, 1,
1.426538, -0.3488398, 0.8452222, 1, 0, 0.4509804, 1,
1.430207, -0.1163418, 2.34556, 1, 0, 0.4431373, 1,
1.462749, 1.193961, -0.3756239, 1, 0, 0.4392157, 1,
1.464184, -0.2929931, 1.908501, 1, 0, 0.4313726, 1,
1.467099, 1.238804, 1.371926, 1, 0, 0.427451, 1,
1.484552, -0.08983443, 2.05553, 1, 0, 0.4196078, 1,
1.489181, 0.8375256, -0.3209006, 1, 0, 0.4156863, 1,
1.489253, -0.9290011, 2.587191, 1, 0, 0.4078431, 1,
1.492619, 1.79423, -0.6465255, 1, 0, 0.4039216, 1,
1.49378, 0.1361096, 0.6014476, 1, 0, 0.3960784, 1,
1.495624, -0.2620639, 1.904203, 1, 0, 0.3882353, 1,
1.496349, 1.5, -0.04503368, 1, 0, 0.3843137, 1,
1.500049, 1.25911, 0.7546237, 1, 0, 0.3764706, 1,
1.513346, 1.284748, 1.201937, 1, 0, 0.372549, 1,
1.515763, 1.009091, 1.46316, 1, 0, 0.3647059, 1,
1.52607, 0.8341158, 0.8611727, 1, 0, 0.3607843, 1,
1.535759, 1.553684, 0.6816442, 1, 0, 0.3529412, 1,
1.544312, -0.148047, 1.791439, 1, 0, 0.3490196, 1,
1.544382, -0.6297731, 0.8312848, 1, 0, 0.3411765, 1,
1.54824, -1.293387, 0.6551264, 1, 0, 0.3372549, 1,
1.549467, -0.725028, 4.960007, 1, 0, 0.3294118, 1,
1.550494, 0.6190659, 0.8951874, 1, 0, 0.3254902, 1,
1.560541, -0.1406311, 1.574287, 1, 0, 0.3176471, 1,
1.564843, 0.01633591, 0.02099825, 1, 0, 0.3137255, 1,
1.567992, 0.2927724, 2.794167, 1, 0, 0.3058824, 1,
1.568903, -0.9088379, 0.595082, 1, 0, 0.2980392, 1,
1.580725, -0.4213007, 1.287503, 1, 0, 0.2941177, 1,
1.585923, -1.587008, 3.622803, 1, 0, 0.2862745, 1,
1.589552, 0.002236379, 1.757316, 1, 0, 0.282353, 1,
1.591328, 0.2117605, -0.2888161, 1, 0, 0.2745098, 1,
1.593091, -0.1807272, 2.302742, 1, 0, 0.2705882, 1,
1.60098, -0.4077315, 1.965945, 1, 0, 0.2627451, 1,
1.616013, 1.104018, -0.1753641, 1, 0, 0.2588235, 1,
1.626011, -2.518575, 2.704282, 1, 0, 0.2509804, 1,
1.637411, 0.4685051, 1.575577, 1, 0, 0.2470588, 1,
1.652723, -1.575439, 3.153935, 1, 0, 0.2392157, 1,
1.667208, -1.129559, 1.501861, 1, 0, 0.2352941, 1,
1.676052, 0.8856707, 0.8718464, 1, 0, 0.227451, 1,
1.719263, -1.920314, 2.678128, 1, 0, 0.2235294, 1,
1.743415, 1.6582, 0.7527981, 1, 0, 0.2156863, 1,
1.755225, -0.1750219, 2.206999, 1, 0, 0.2117647, 1,
1.765877, -0.4153189, 2.705661, 1, 0, 0.2039216, 1,
1.782813, 0.9567272, 1.688198, 1, 0, 0.1960784, 1,
1.796179, 0.7471236, 2.359517, 1, 0, 0.1921569, 1,
1.810828, 0.6774051, 1.63107, 1, 0, 0.1843137, 1,
1.827904, 1.037535, 1.717507, 1, 0, 0.1803922, 1,
1.83675, 0.5059616, -0.2515989, 1, 0, 0.172549, 1,
1.841923, -1.395034, 3.892111, 1, 0, 0.1686275, 1,
1.843163, 1.461938, 2.141376, 1, 0, 0.1607843, 1,
1.905029, 0.3835553, 0.9991618, 1, 0, 0.1568628, 1,
1.906391, 1.423978, 2.311758, 1, 0, 0.1490196, 1,
1.913383, 0.2713864, 0.070827, 1, 0, 0.145098, 1,
1.926086, -0.3579759, 2.90855, 1, 0, 0.1372549, 1,
1.93003, 0.3539113, -0.4590566, 1, 0, 0.1333333, 1,
1.955308, -0.480215, 1.310311, 1, 0, 0.1254902, 1,
1.976939, 1.732567, 0.6524814, 1, 0, 0.1215686, 1,
2.001999, 0.347662, 1.306763, 1, 0, 0.1137255, 1,
2.05723, 0.07038198, 2.036494, 1, 0, 0.1098039, 1,
2.070779, 0.2704388, 1.429222, 1, 0, 0.1019608, 1,
2.088041, 0.1407469, 2.638747, 1, 0, 0.09411765, 1,
2.128054, 0.6734715, -0.8955876, 1, 0, 0.09019608, 1,
2.170764, -0.8720655, 2.874609, 1, 0, 0.08235294, 1,
2.190535, 0.611228, -0.09134253, 1, 0, 0.07843138, 1,
2.208745, -0.3350747, 1.392883, 1, 0, 0.07058824, 1,
2.254123, -0.3744469, 2.141808, 1, 0, 0.06666667, 1,
2.299492, -0.7507862, 2.548508, 1, 0, 0.05882353, 1,
2.331937, 0.6677125, 1.382222, 1, 0, 0.05490196, 1,
2.338804, 0.739481, 1.165879, 1, 0, 0.04705882, 1,
2.421112, 1.321939, 0.9617933, 1, 0, 0.04313726, 1,
2.446769, 0.8370661, 0.1064092, 1, 0, 0.03529412, 1,
2.463652, -0.576544, 0.1905452, 1, 0, 0.03137255, 1,
2.695982, -0.4408913, 2.602361, 1, 0, 0.02352941, 1,
2.749075, 0.2687994, 2.078639, 1, 0, 0.01960784, 1,
2.860149, -1.52961, 2.11572, 1, 0, 0.01176471, 1,
3.815972, -0.5847739, 2.555291, 1, 0, 0.007843138, 1
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
0.243679, -4.390166, -7.637199, 0, -0.5, 0.5, 0.5,
0.243679, -4.390166, -7.637199, 1, -0.5, 0.5, 0.5,
0.243679, -4.390166, -7.637199, 1, 1.5, 0.5, 0.5,
0.243679, -4.390166, -7.637199, 0, 1.5, 0.5, 0.5
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
-4.539621, -0.133293, -7.637199, 0, -0.5, 0.5, 0.5,
-4.539621, -0.133293, -7.637199, 1, -0.5, 0.5, 0.5,
-4.539621, -0.133293, -7.637199, 1, 1.5, 0.5, 0.5,
-4.539621, -0.133293, -7.637199, 0, 1.5, 0.5, 0.5
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
-4.539621, -4.390166, -0.1865752, 0, -0.5, 0.5, 0.5,
-4.539621, -4.390166, -0.1865752, 1, -0.5, 0.5, 0.5,
-4.539621, -4.390166, -0.1865752, 1, 1.5, 0.5, 0.5,
-4.539621, -4.390166, -0.1865752, 0, 1.5, 0.5, 0.5
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
-2, -3.407811, -5.917824,
2, -3.407811, -5.917824,
-2, -3.407811, -5.917824,
-2, -3.571537, -6.204387,
0, -3.407811, -5.917824,
0, -3.571537, -6.204387,
2, -3.407811, -5.917824,
2, -3.571537, -6.204387
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
-2, -3.898988, -6.777512, 0, -0.5, 0.5, 0.5,
-2, -3.898988, -6.777512, 1, -0.5, 0.5, 0.5,
-2, -3.898988, -6.777512, 1, 1.5, 0.5, 0.5,
-2, -3.898988, -6.777512, 0, 1.5, 0.5, 0.5,
0, -3.898988, -6.777512, 0, -0.5, 0.5, 0.5,
0, -3.898988, -6.777512, 1, -0.5, 0.5, 0.5,
0, -3.898988, -6.777512, 1, 1.5, 0.5, 0.5,
0, -3.898988, -6.777512, 0, 1.5, 0.5, 0.5,
2, -3.898988, -6.777512, 0, -0.5, 0.5, 0.5,
2, -3.898988, -6.777512, 1, -0.5, 0.5, 0.5,
2, -3.898988, -6.777512, 1, 1.5, 0.5, 0.5,
2, -3.898988, -6.777512, 0, 1.5, 0.5, 0.5
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
-3.435783, -3, -5.917824,
-3.435783, 3, -5.917824,
-3.435783, -3, -5.917824,
-3.619756, -3, -6.204387,
-3.435783, -2, -5.917824,
-3.619756, -2, -6.204387,
-3.435783, -1, -5.917824,
-3.619756, -1, -6.204387,
-3.435783, 0, -5.917824,
-3.619756, 0, -6.204387,
-3.435783, 1, -5.917824,
-3.619756, 1, -6.204387,
-3.435783, 2, -5.917824,
-3.619756, 2, -6.204387,
-3.435783, 3, -5.917824,
-3.619756, 3, -6.204387
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
-3.987702, -3, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, -3, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, -3, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, -3, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, -2, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, -2, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, -2, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, -2, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, -1, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, -1, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, -1, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, -1, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, 0, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, 0, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, 0, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, 0, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, 1, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, 1, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, 1, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, 1, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, 2, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, 2, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, 2, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, 2, -6.777512, 0, 1.5, 0.5, 0.5,
-3.987702, 3, -6.777512, 0, -0.5, 0.5, 0.5,
-3.987702, 3, -6.777512, 1, -0.5, 0.5, 0.5,
-3.987702, 3, -6.777512, 1, 1.5, 0.5, 0.5,
-3.987702, 3, -6.777512, 0, 1.5, 0.5, 0.5
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
-3.435783, -3.407811, -4,
-3.435783, -3.407811, 4,
-3.435783, -3.407811, -4,
-3.619756, -3.571537, -4,
-3.435783, -3.407811, -2,
-3.619756, -3.571537, -2,
-3.435783, -3.407811, 0,
-3.619756, -3.571537, 0,
-3.435783, -3.407811, 2,
-3.619756, -3.571537, 2,
-3.435783, -3.407811, 4,
-3.619756, -3.571537, 4
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
-3.987702, -3.898988, -4, 0, -0.5, 0.5, 0.5,
-3.987702, -3.898988, -4, 1, -0.5, 0.5, 0.5,
-3.987702, -3.898988, -4, 1, 1.5, 0.5, 0.5,
-3.987702, -3.898988, -4, 0, 1.5, 0.5, 0.5,
-3.987702, -3.898988, -2, 0, -0.5, 0.5, 0.5,
-3.987702, -3.898988, -2, 1, -0.5, 0.5, 0.5,
-3.987702, -3.898988, -2, 1, 1.5, 0.5, 0.5,
-3.987702, -3.898988, -2, 0, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 0, 0, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 0, 1, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 0, 1, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 0, 0, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 2, 0, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 2, 1, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 2, 1, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 2, 0, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 4, 0, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 4, 1, -0.5, 0.5, 0.5,
-3.987702, -3.898988, 4, 1, 1.5, 0.5, 0.5,
-3.987702, -3.898988, 4, 0, 1.5, 0.5, 0.5
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
-3.435783, -3.407811, -5.917824,
-3.435783, 3.141225, -5.917824,
-3.435783, -3.407811, 5.544674,
-3.435783, 3.141225, 5.544674,
-3.435783, -3.407811, -5.917824,
-3.435783, -3.407811, 5.544674,
-3.435783, 3.141225, -5.917824,
-3.435783, 3.141225, 5.544674,
-3.435783, -3.407811, -5.917824,
3.923141, -3.407811, -5.917824,
-3.435783, -3.407811, 5.544674,
3.923141, -3.407811, 5.544674,
-3.435783, 3.141225, -5.917824,
3.923141, 3.141225, -5.917824,
-3.435783, 3.141225, 5.544674,
3.923141, 3.141225, 5.544674,
3.923141, -3.407811, -5.917824,
3.923141, 3.141225, -5.917824,
3.923141, -3.407811, 5.544674,
3.923141, 3.141225, 5.544674,
3.923141, -3.407811, -5.917824,
3.923141, -3.407811, 5.544674,
3.923141, 3.141225, -5.917824,
3.923141, 3.141225, 5.544674
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
var radius = 8.070573;
var distance = 35.90689;
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
mvMatrix.translate( -0.243679, 0.133293, 0.1865752 );
mvMatrix.scale( 1.18578, 1.33242, 0.7612705 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90689);
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

