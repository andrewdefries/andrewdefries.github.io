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
-3.234895, 0.7061908, -2.050446, 1, 0, 0, 1,
-3.056192, -0.00110791, -2.340946, 1, 0.007843138, 0, 1,
-2.744949, -0.5244761, -2.061013, 1, 0.01176471, 0, 1,
-2.641897, -1.832262, -2.612781, 1, 0.01960784, 0, 1,
-2.609613, -0.5969861, -0.04360702, 1, 0.02352941, 0, 1,
-2.507792, -2.729963, -3.85509, 1, 0.03137255, 0, 1,
-2.419245, -0.3784618, -1.189662, 1, 0.03529412, 0, 1,
-2.391897, 0.8681917, -0.8798535, 1, 0.04313726, 0, 1,
-2.373884, -0.04907316, -2.494035, 1, 0.04705882, 0, 1,
-2.334995, -0.4215882, -0.3793761, 1, 0.05490196, 0, 1,
-2.329673, 0.9482893, 0.511972, 1, 0.05882353, 0, 1,
-2.284682, 1.117408, -0.02095366, 1, 0.06666667, 0, 1,
-2.277984, -1.443202, -2.811566, 1, 0.07058824, 0, 1,
-2.274855, -0.6004505, -1.760461, 1, 0.07843138, 0, 1,
-2.262533, -1.946856, -2.488956, 1, 0.08235294, 0, 1,
-2.259503, 0.03863794, -0.5433067, 1, 0.09019608, 0, 1,
-2.259295, -0.3962764, -2.839842, 1, 0.09411765, 0, 1,
-2.255816, -0.3570928, -3.124181, 1, 0.1019608, 0, 1,
-2.189838, -0.7939685, -1.809057, 1, 0.1098039, 0, 1,
-2.167734, -0.5752648, -1.938328, 1, 0.1137255, 0, 1,
-2.133065, -1.41952, -1.675506, 1, 0.1215686, 0, 1,
-2.098626, -0.4488794, -2.679948, 1, 0.1254902, 0, 1,
-2.09559, 0.05421432, -0.5170211, 1, 0.1333333, 0, 1,
-2.087461, -0.2662828, -0.5924388, 1, 0.1372549, 0, 1,
-2.053063, -0.9088368, -1.793065, 1, 0.145098, 0, 1,
-2.005922, -0.8732615, -3.366596, 1, 0.1490196, 0, 1,
-1.999125, 0.8106416, -1.382509, 1, 0.1568628, 0, 1,
-1.959952, -1.319975, -1.518962, 1, 0.1607843, 0, 1,
-1.954557, -0.4859799, -2.968974, 1, 0.1686275, 0, 1,
-1.945819, -0.5521521, -2.286855, 1, 0.172549, 0, 1,
-1.931772, -0.6584105, -2.712559, 1, 0.1803922, 0, 1,
-1.907841, -0.329616, -4.103469, 1, 0.1843137, 0, 1,
-1.890184, -0.5185035, -1.609615, 1, 0.1921569, 0, 1,
-1.881634, -1.523105, -2.192069, 1, 0.1960784, 0, 1,
-1.880003, -1.159486, -3.2546, 1, 0.2039216, 0, 1,
-1.857969, 0.7747372, -3.577842, 1, 0.2117647, 0, 1,
-1.844586, 1.890865, -0.4413048, 1, 0.2156863, 0, 1,
-1.834451, 0.2032738, -2.2941, 1, 0.2235294, 0, 1,
-1.81268, 2.023691, -2.219582, 1, 0.227451, 0, 1,
-1.785415, 0.8577613, -1.192199, 1, 0.2352941, 0, 1,
-1.77179, 0.3727283, -1.620189, 1, 0.2392157, 0, 1,
-1.755853, 0.1124676, -2.383837, 1, 0.2470588, 0, 1,
-1.735017, 0.6027547, -0.7960712, 1, 0.2509804, 0, 1,
-1.726513, -0.8389113, -1.293413, 1, 0.2588235, 0, 1,
-1.717524, -0.0747611, -0.6771368, 1, 0.2627451, 0, 1,
-1.704214, 0.1064923, -2.927576, 1, 0.2705882, 0, 1,
-1.701207, -0.3968875, -1.938254, 1, 0.2745098, 0, 1,
-1.698022, 0.5587258, -0.9066595, 1, 0.282353, 0, 1,
-1.691084, -0.3438173, -2.572324, 1, 0.2862745, 0, 1,
-1.679679, -0.01808505, -1.900691, 1, 0.2941177, 0, 1,
-1.675126, 0.0005086942, -1.772313, 1, 0.3019608, 0, 1,
-1.664196, -0.5341524, -2.043666, 1, 0.3058824, 0, 1,
-1.661756, 0.959666, -2.427261, 1, 0.3137255, 0, 1,
-1.655167, 0.6903487, -0.09148176, 1, 0.3176471, 0, 1,
-1.642377, -0.9292935, -1.712221, 1, 0.3254902, 0, 1,
-1.62834, -0.6285768, -3.713261, 1, 0.3294118, 0, 1,
-1.620234, 1.80536, -2.752365, 1, 0.3372549, 0, 1,
-1.605365, 0.7084094, -0.1354867, 1, 0.3411765, 0, 1,
-1.596823, 0.6461419, -0.3002388, 1, 0.3490196, 0, 1,
-1.585432, -0.02767687, -1.733695, 1, 0.3529412, 0, 1,
-1.584189, 0.2365981, -1.571755, 1, 0.3607843, 0, 1,
-1.576246, 1.138822, 1.130985, 1, 0.3647059, 0, 1,
-1.570076, -1.327618, -1.73376, 1, 0.372549, 0, 1,
-1.561901, -1.150948, -3.692238, 1, 0.3764706, 0, 1,
-1.550933, -1.607688, -3.112295, 1, 0.3843137, 0, 1,
-1.533659, -1.322801, -2.348233, 1, 0.3882353, 0, 1,
-1.53061, -0.09551654, -1.864262, 1, 0.3960784, 0, 1,
-1.512356, 0.1965191, -0.9034398, 1, 0.4039216, 0, 1,
-1.497649, -0.2344991, -0.5189864, 1, 0.4078431, 0, 1,
-1.494393, -0.6848265, -1.741862, 1, 0.4156863, 0, 1,
-1.488085, 0.8419297, -1.62345, 1, 0.4196078, 0, 1,
-1.482432, 1.508053, -0.9236028, 1, 0.427451, 0, 1,
-1.472048, 0.01988508, 0.07632467, 1, 0.4313726, 0, 1,
-1.450163, 1.188417, 0.04722359, 1, 0.4392157, 0, 1,
-1.447373, -0.2543498, -2.005778, 1, 0.4431373, 0, 1,
-1.442932, -0.07334963, -2.460994, 1, 0.4509804, 0, 1,
-1.442321, -0.08341295, -0.6348925, 1, 0.454902, 0, 1,
-1.431581, -0.5413917, -3.205487, 1, 0.4627451, 0, 1,
-1.431545, 0.1399071, -0.1301281, 1, 0.4666667, 0, 1,
-1.421336, 1.301324, -2.040545, 1, 0.4745098, 0, 1,
-1.419364, 0.4891897, -1.523791, 1, 0.4784314, 0, 1,
-1.419348, 0.2722875, -2.218665, 1, 0.4862745, 0, 1,
-1.413855, -0.06534622, -2.519374, 1, 0.4901961, 0, 1,
-1.405507, -1.032848, -2.900169, 1, 0.4980392, 0, 1,
-1.39539, 2.34078, 0.1226648, 1, 0.5058824, 0, 1,
-1.383314, -0.5080538, -3.006432, 1, 0.509804, 0, 1,
-1.369028, 2.435984, -1.193926, 1, 0.5176471, 0, 1,
-1.364609, -0.3299885, -3.15174, 1, 0.5215687, 0, 1,
-1.360061, -0.7163188, -2.559517, 1, 0.5294118, 0, 1,
-1.359651, 0.8659372, -2.216734, 1, 0.5333334, 0, 1,
-1.347859, 0.2758798, -1.415342, 1, 0.5411765, 0, 1,
-1.335665, -0.4579892, -3.147506, 1, 0.5450981, 0, 1,
-1.318861, -0.9038491, -1.547658, 1, 0.5529412, 0, 1,
-1.312771, -1.125481, -3.95974, 1, 0.5568628, 0, 1,
-1.301517, -0.3262868, -1.23368, 1, 0.5647059, 0, 1,
-1.299741, 0.965244, -0.4835841, 1, 0.5686275, 0, 1,
-1.292685, -0.3086184, 0.09822123, 1, 0.5764706, 0, 1,
-1.290635, 1.131899, -1.394925, 1, 0.5803922, 0, 1,
-1.278579, 1.474602, -1.974508, 1, 0.5882353, 0, 1,
-1.276332, 1.75541, -1.005631, 1, 0.5921569, 0, 1,
-1.269371, -0.8575886, -2.04317, 1, 0.6, 0, 1,
-1.264382, -0.6018355, -2.79839, 1, 0.6078432, 0, 1,
-1.258205, -0.3180015, -2.236937, 1, 0.6117647, 0, 1,
-1.256823, 0.8904009, -1.478791, 1, 0.6196079, 0, 1,
-1.255785, 1.217323, -0.6911976, 1, 0.6235294, 0, 1,
-1.242862, -0.4464339, -1.248839, 1, 0.6313726, 0, 1,
-1.23965, 0.9923252, -1.028379, 1, 0.6352941, 0, 1,
-1.231699, -0.4007631, -1.827428, 1, 0.6431373, 0, 1,
-1.229232, -2.945314, -2.860147, 1, 0.6470588, 0, 1,
-1.225852, -0.2712732, -1.703537, 1, 0.654902, 0, 1,
-1.21948, -0.1273637, -2.141442, 1, 0.6588235, 0, 1,
-1.218258, 1.67799, -1.965804, 1, 0.6666667, 0, 1,
-1.212755, -1.037183, -2.767097, 1, 0.6705883, 0, 1,
-1.210681, -0.6167972, -3.083411, 1, 0.6784314, 0, 1,
-1.207423, -0.5772895, -1.440465, 1, 0.682353, 0, 1,
-1.205452, 0.5324847, -1.558319, 1, 0.6901961, 0, 1,
-1.201799, 0.2662379, -1.877902, 1, 0.6941177, 0, 1,
-1.197848, 1.392393, -0.8648276, 1, 0.7019608, 0, 1,
-1.196511, -0.3889037, -1.004394, 1, 0.7098039, 0, 1,
-1.194852, 0.7520185, -2.1032, 1, 0.7137255, 0, 1,
-1.182176, 0.6212823, -0.7918897, 1, 0.7215686, 0, 1,
-1.176171, -1.572137, -1.450322, 1, 0.7254902, 0, 1,
-1.173407, 0.7211007, 0.967963, 1, 0.7333333, 0, 1,
-1.172763, 0.05461923, -1.571581, 1, 0.7372549, 0, 1,
-1.166483, 0.1794624, -0.3699874, 1, 0.7450981, 0, 1,
-1.157599, -0.7257273, -2.513231, 1, 0.7490196, 0, 1,
-1.15544, 0.5460284, -2.815114, 1, 0.7568628, 0, 1,
-1.1487, 0.06153471, -1.338817, 1, 0.7607843, 0, 1,
-1.147416, 1.454245, -0.3535506, 1, 0.7686275, 0, 1,
-1.140261, 0.3004065, -2.396829, 1, 0.772549, 0, 1,
-1.138262, -0.1905964, -0.184208, 1, 0.7803922, 0, 1,
-1.137425, -0.06413679, -2.983818, 1, 0.7843137, 0, 1,
-1.134519, 0.5603817, 0.3746967, 1, 0.7921569, 0, 1,
-1.130822, 0.3846652, -1.59403, 1, 0.7960784, 0, 1,
-1.105216, -1.873621, -2.325131, 1, 0.8039216, 0, 1,
-1.097289, -0.7834186, -2.71393, 1, 0.8117647, 0, 1,
-1.088861, -0.731738, -1.902624, 1, 0.8156863, 0, 1,
-1.076593, 0.2273213, -0.373602, 1, 0.8235294, 0, 1,
-1.073906, -1.574636, -3.851, 1, 0.827451, 0, 1,
-1.063795, -0.8543726, -2.446059, 1, 0.8352941, 0, 1,
-1.056594, -0.9291524, -2.736176, 1, 0.8392157, 0, 1,
-1.053611, 0.02709471, 0.8920625, 1, 0.8470588, 0, 1,
-1.050731, -0.04716871, -0.06545031, 1, 0.8509804, 0, 1,
-1.047519, 0.4933872, -1.305901, 1, 0.8588235, 0, 1,
-1.046454, 0.5168352, -1.22055, 1, 0.8627451, 0, 1,
-1.046106, -0.3332182, -3.789755, 1, 0.8705882, 0, 1,
-1.044525, 0.8589699, -2.984285, 1, 0.8745098, 0, 1,
-1.03991, -1.146236, -2.817925, 1, 0.8823529, 0, 1,
-1.037992, 0.7059203, -1.669811, 1, 0.8862745, 0, 1,
-1.036538, 0.7586826, 0.7561259, 1, 0.8941177, 0, 1,
-1.035914, 0.05455397, 0.3768457, 1, 0.8980392, 0, 1,
-1.028435, 1.989333, -1.240442, 1, 0.9058824, 0, 1,
-1.024293, -1.339531, -3.65014, 1, 0.9137255, 0, 1,
-1.021509, 0.7284802, -1.578542, 1, 0.9176471, 0, 1,
-1.01911, 1.407504, -0.6750161, 1, 0.9254902, 0, 1,
-1.014847, 1.396963, -1.680861, 1, 0.9294118, 0, 1,
-1.007659, 1.030934, 1.506429, 1, 0.9372549, 0, 1,
-1.004124, -3.723909, -3.334842, 1, 0.9411765, 0, 1,
-1.000464, -0.2847566, -1.083424, 1, 0.9490196, 0, 1,
-0.9945112, 0.02169446, -1.060842, 1, 0.9529412, 0, 1,
-0.990547, -0.04395374, -1.664878, 1, 0.9607843, 0, 1,
-0.9888486, 0.4413611, -2.266126, 1, 0.9647059, 0, 1,
-0.9878057, -1.354167, -3.05775, 1, 0.972549, 0, 1,
-0.9851376, -0.8984365, -0.5097924, 1, 0.9764706, 0, 1,
-0.9843295, 1.121829, -0.1556518, 1, 0.9843137, 0, 1,
-0.9823071, -0.6098076, -1.99254, 1, 0.9882353, 0, 1,
-0.9713588, 1.70083, -0.8117496, 1, 0.9960784, 0, 1,
-0.9566149, -0.09532206, 0.2389475, 0.9960784, 1, 0, 1,
-0.9506713, -0.5009956, -0.3581328, 0.9921569, 1, 0, 1,
-0.9436219, 0.4216811, -1.042578, 0.9843137, 1, 0, 1,
-0.9397117, -0.3716822, -2.410843, 0.9803922, 1, 0, 1,
-0.9359534, 0.03209062, 0.07810358, 0.972549, 1, 0, 1,
-0.9312066, 0.3842792, -3.21514, 0.9686275, 1, 0, 1,
-0.9244406, 0.7179837, 1.237942, 0.9607843, 1, 0, 1,
-0.9234329, 0.9230974, -0.7025248, 0.9568627, 1, 0, 1,
-0.9226553, 0.8632847, -1.491842, 0.9490196, 1, 0, 1,
-0.9204546, 0.3158067, -0.2516679, 0.945098, 1, 0, 1,
-0.9147938, 0.4459382, -1.740042, 0.9372549, 1, 0, 1,
-0.9117926, 0.8965663, 0.5167425, 0.9333333, 1, 0, 1,
-0.901723, 1.576274, -2.410689, 0.9254902, 1, 0, 1,
-0.8995024, 0.3226034, -1.740123, 0.9215686, 1, 0, 1,
-0.8955518, -0.05457021, -2.739661, 0.9137255, 1, 0, 1,
-0.8953557, -0.04544001, -2.270986, 0.9098039, 1, 0, 1,
-0.8892084, -0.3832626, -3.124779, 0.9019608, 1, 0, 1,
-0.8890305, 0.4999081, -2.687329, 0.8941177, 1, 0, 1,
-0.8889132, -0.5417082, -2.036237, 0.8901961, 1, 0, 1,
-0.8850877, 1.431588, -1.667386, 0.8823529, 1, 0, 1,
-0.8815219, 0.09647062, -1.411987, 0.8784314, 1, 0, 1,
-0.8794904, -1.972972, -1.852899, 0.8705882, 1, 0, 1,
-0.8773969, 1.224097, -0.7877544, 0.8666667, 1, 0, 1,
-0.8771813, 0.4823332, -2.41837, 0.8588235, 1, 0, 1,
-0.8738853, 1.266774, -0.861303, 0.854902, 1, 0, 1,
-0.8674118, 1.090105, -0.8323551, 0.8470588, 1, 0, 1,
-0.8667552, -0.9033325, -2.859717, 0.8431373, 1, 0, 1,
-0.8625527, 1.34605, 0.6415996, 0.8352941, 1, 0, 1,
-0.8581471, 1.122525, -0.06316529, 0.8313726, 1, 0, 1,
-0.8539791, -0.4812926, -2.260312, 0.8235294, 1, 0, 1,
-0.8501263, -0.6245395, -4.365585, 0.8196079, 1, 0, 1,
-0.8495269, -0.682216, -2.215188, 0.8117647, 1, 0, 1,
-0.8453147, 1.803336, -0.1100519, 0.8078431, 1, 0, 1,
-0.8441759, 0.6695525, -0.03899747, 0.8, 1, 0, 1,
-0.8320494, -1.674999, -3.945113, 0.7921569, 1, 0, 1,
-0.8291147, -0.07571301, -1.913988, 0.7882353, 1, 0, 1,
-0.8282763, -2.337004, -3.736271, 0.7803922, 1, 0, 1,
-0.8244032, -0.02491456, -2.185476, 0.7764706, 1, 0, 1,
-0.8211682, -2.338192, -1.811736, 0.7686275, 1, 0, 1,
-0.8130216, -0.01556437, -2.075357, 0.7647059, 1, 0, 1,
-0.8103389, -0.3205375, -1.103709, 0.7568628, 1, 0, 1,
-0.8078627, -0.0639244, -1.340094, 0.7529412, 1, 0, 1,
-0.8009409, 1.213628, -0.8531774, 0.7450981, 1, 0, 1,
-0.800541, -0.3441189, -0.7627746, 0.7411765, 1, 0, 1,
-0.7991564, 1.375166, -2.129679, 0.7333333, 1, 0, 1,
-0.7950006, -1.647245, -3.179379, 0.7294118, 1, 0, 1,
-0.7913107, 1.000975, 0.5186694, 0.7215686, 1, 0, 1,
-0.7893916, 0.3596727, -2.252836, 0.7176471, 1, 0, 1,
-0.787464, 0.06588147, -1.66907, 0.7098039, 1, 0, 1,
-0.7858709, -0.8938156, -3.002801, 0.7058824, 1, 0, 1,
-0.7855703, -0.8454953, -0.7737347, 0.6980392, 1, 0, 1,
-0.7852692, -0.8135669, -3.309337, 0.6901961, 1, 0, 1,
-0.7805964, -0.3483608, -2.63925, 0.6862745, 1, 0, 1,
-0.7791773, 1.741859, -1.024326, 0.6784314, 1, 0, 1,
-0.7781668, 0.9802241, 0.0195901, 0.6745098, 1, 0, 1,
-0.7772883, -0.2943947, -1.788967, 0.6666667, 1, 0, 1,
-0.7753845, 0.2999608, -2.518333, 0.6627451, 1, 0, 1,
-0.7736915, -0.07659567, -1.36524, 0.654902, 1, 0, 1,
-0.7722605, 0.8971455, -0.5355828, 0.6509804, 1, 0, 1,
-0.7657506, 0.273516, -2.332887, 0.6431373, 1, 0, 1,
-0.7598695, 0.6634879, -0.967248, 0.6392157, 1, 0, 1,
-0.7591586, -0.8740702, -0.8408857, 0.6313726, 1, 0, 1,
-0.7582351, -0.754601, -2.46754, 0.627451, 1, 0, 1,
-0.7548843, 0.8260628, -0.9639686, 0.6196079, 1, 0, 1,
-0.7513101, -1.238887, -2.808962, 0.6156863, 1, 0, 1,
-0.7451853, 0.2004394, 0.2976125, 0.6078432, 1, 0, 1,
-0.7438707, 0.8914249, -1.856337, 0.6039216, 1, 0, 1,
-0.7356324, 0.6326554, 0.9602781, 0.5960785, 1, 0, 1,
-0.7292311, -0.1262371, -2.669984, 0.5882353, 1, 0, 1,
-0.7289248, -1.223615, -1.97641, 0.5843138, 1, 0, 1,
-0.727118, 1.549853, 0.006918032, 0.5764706, 1, 0, 1,
-0.7257017, 0.2446529, -3.064091, 0.572549, 1, 0, 1,
-0.7184857, 1.222636, -1.398404, 0.5647059, 1, 0, 1,
-0.7177032, 0.6784241, -1.396284, 0.5607843, 1, 0, 1,
-0.7175896, 0.08981159, -2.62898, 0.5529412, 1, 0, 1,
-0.716718, 0.4249388, -1.308096, 0.5490196, 1, 0, 1,
-0.7139325, -0.1595991, -1.20836, 0.5411765, 1, 0, 1,
-0.7129243, 0.349359, -1.76372, 0.5372549, 1, 0, 1,
-0.7120842, 0.09743772, -1.931066, 0.5294118, 1, 0, 1,
-0.7047575, -0.2716152, -1.655083, 0.5254902, 1, 0, 1,
-0.7036694, 1.010885, -0.003555184, 0.5176471, 1, 0, 1,
-0.7035204, 0.8866576, -1.368619, 0.5137255, 1, 0, 1,
-0.6970079, -0.3661891, -1.591026, 0.5058824, 1, 0, 1,
-0.6969454, 2.015939, 0.5776234, 0.5019608, 1, 0, 1,
-0.6930867, -0.4188482, -3.452721, 0.4941176, 1, 0, 1,
-0.6914757, 0.9717913, 0.08926342, 0.4862745, 1, 0, 1,
-0.6909532, 0.8588639, 0.8662478, 0.4823529, 1, 0, 1,
-0.6871197, -0.4390896, -2.972915, 0.4745098, 1, 0, 1,
-0.6868005, 1.522862, -0.3135611, 0.4705882, 1, 0, 1,
-0.6851402, -0.5810967, -3.634406, 0.4627451, 1, 0, 1,
-0.684576, 1.821517, -0.7407584, 0.4588235, 1, 0, 1,
-0.6833559, -0.04938978, -2.120322, 0.4509804, 1, 0, 1,
-0.6810155, -0.6248709, -0.6921971, 0.4470588, 1, 0, 1,
-0.6808189, 1.233614, 0.6676938, 0.4392157, 1, 0, 1,
-0.6801267, -0.007543204, -1.990018, 0.4352941, 1, 0, 1,
-0.6769051, -1.019655, -2.265376, 0.427451, 1, 0, 1,
-0.6753168, -0.3729456, -2.197131, 0.4235294, 1, 0, 1,
-0.6727533, -2.341225, -2.833107, 0.4156863, 1, 0, 1,
-0.6716767, -0.0945121, 0.3978789, 0.4117647, 1, 0, 1,
-0.6688187, 0.1257249, -3.142359, 0.4039216, 1, 0, 1,
-0.6684787, 2.433956, -2.024638, 0.3960784, 1, 0, 1,
-0.6658671, 0.9046764, 0.07261042, 0.3921569, 1, 0, 1,
-0.6639163, -0.1144628, -0.2278409, 0.3843137, 1, 0, 1,
-0.6623606, -0.3066323, -2.404126, 0.3803922, 1, 0, 1,
-0.6619883, 0.3882281, -2.406058, 0.372549, 1, 0, 1,
-0.6612481, 0.9675707, -1.026615, 0.3686275, 1, 0, 1,
-0.6575504, -0.8758782, -3.56363, 0.3607843, 1, 0, 1,
-0.6545972, -1.848729, -3.056451, 0.3568628, 1, 0, 1,
-0.6516429, -0.621138, -2.062808, 0.3490196, 1, 0, 1,
-0.6493324, 1.139974, 0.2047192, 0.345098, 1, 0, 1,
-0.6451541, 1.979177, 0.9559914, 0.3372549, 1, 0, 1,
-0.642894, 2.389459, 0.4671316, 0.3333333, 1, 0, 1,
-0.6361018, -1.175606, -3.575914, 0.3254902, 1, 0, 1,
-0.6357342, -1.263342, -1.5954, 0.3215686, 1, 0, 1,
-0.6255566, -0.05425766, -1.90749, 0.3137255, 1, 0, 1,
-0.6183619, -1.913202, -3.033964, 0.3098039, 1, 0, 1,
-0.6154668, -0.4189148, -2.682762, 0.3019608, 1, 0, 1,
-0.6123373, -2.81283, -0.04172699, 0.2941177, 1, 0, 1,
-0.6041038, 0.3359397, -0.6522541, 0.2901961, 1, 0, 1,
-0.5992116, 0.7669005, -0.9220446, 0.282353, 1, 0, 1,
-0.5972775, -0.5603034, -3.704145, 0.2784314, 1, 0, 1,
-0.5923315, 0.4097515, -2.437765, 0.2705882, 1, 0, 1,
-0.5917738, 0.8148254, -0.3007996, 0.2666667, 1, 0, 1,
-0.5916638, -1.00422, -2.163386, 0.2588235, 1, 0, 1,
-0.5840198, 1.826036, -0.7830776, 0.254902, 1, 0, 1,
-0.5791048, -0.6129355, -1.102546, 0.2470588, 1, 0, 1,
-0.5776887, -0.0749274, -1.637771, 0.2431373, 1, 0, 1,
-0.5753684, 0.2320129, -2.704586, 0.2352941, 1, 0, 1,
-0.5658675, 0.04110236, -0.3120169, 0.2313726, 1, 0, 1,
-0.5593339, -0.5146217, -1.784321, 0.2235294, 1, 0, 1,
-0.5576598, 0.5310693, 0.5129047, 0.2196078, 1, 0, 1,
-0.5536143, -0.1744975, 0.2677632, 0.2117647, 1, 0, 1,
-0.5503293, 0.2546215, -0.2400928, 0.2078431, 1, 0, 1,
-0.5495268, 0.8338017, -0.3924378, 0.2, 1, 0, 1,
-0.5472038, -0.2509175, -1.274588, 0.1921569, 1, 0, 1,
-0.5465731, -0.9952575, -2.707597, 0.1882353, 1, 0, 1,
-0.5432302, 1.259616, 0.6040687, 0.1803922, 1, 0, 1,
-0.5421989, -1.437327, -3.219231, 0.1764706, 1, 0, 1,
-0.5402141, 0.9075961, 0.9686365, 0.1686275, 1, 0, 1,
-0.5342032, -0.1654672, -1.943287, 0.1647059, 1, 0, 1,
-0.5310149, -0.4470864, -1.551007, 0.1568628, 1, 0, 1,
-0.5299012, -0.2078817, -2.70218, 0.1529412, 1, 0, 1,
-0.5206769, 1.153491, -1.010209, 0.145098, 1, 0, 1,
-0.5150912, -0.8267974, -2.363775, 0.1411765, 1, 0, 1,
-0.5090441, 1.320081, -0.7521012, 0.1333333, 1, 0, 1,
-0.5074137, 1.855615, -1.685477, 0.1294118, 1, 0, 1,
-0.5070383, -0.5491688, -1.117821, 0.1215686, 1, 0, 1,
-0.5024716, -0.07715785, -2.877196, 0.1176471, 1, 0, 1,
-0.5001783, 2.167742, -0.02468703, 0.1098039, 1, 0, 1,
-0.4985891, -2.096818, -4.085726, 0.1058824, 1, 0, 1,
-0.4903148, -0.5738049, -3.824666, 0.09803922, 1, 0, 1,
-0.4851967, 0.7366835, -2.618629, 0.09019608, 1, 0, 1,
-0.4833696, 1.665887, -0.6542978, 0.08627451, 1, 0, 1,
-0.472453, -0.2510623, -1.838701, 0.07843138, 1, 0, 1,
-0.4683827, 0.3616171, -0.2581253, 0.07450981, 1, 0, 1,
-0.4670868, 0.9132689, 0.5253165, 0.06666667, 1, 0, 1,
-0.4622771, -0.323341, -2.462482, 0.0627451, 1, 0, 1,
-0.460434, -0.9050007, -3.695199, 0.05490196, 1, 0, 1,
-0.4585497, 1.782437, 0.9978573, 0.05098039, 1, 0, 1,
-0.4445034, -1.690137, -1.247418, 0.04313726, 1, 0, 1,
-0.4437645, 1.056064, -0.3485942, 0.03921569, 1, 0, 1,
-0.4406299, -0.174601, -2.683839, 0.03137255, 1, 0, 1,
-0.4380422, -1.333945, -4.93842, 0.02745098, 1, 0, 1,
-0.4370427, 0.6851331, -1.083433, 0.01960784, 1, 0, 1,
-0.4322333, 0.4826855, -0.6976876, 0.01568628, 1, 0, 1,
-0.4304681, -0.3372106, -1.66413, 0.007843138, 1, 0, 1,
-0.4288375, -1.143043, -3.0683, 0.003921569, 1, 0, 1,
-0.4263037, -1.329882, -3.473037, 0, 1, 0.003921569, 1,
-0.4262426, 2.418963, 0.7294672, 0, 1, 0.01176471, 1,
-0.4259581, 0.1271513, -0.8154714, 0, 1, 0.01568628, 1,
-0.420889, -0.8438031, -1.976478, 0, 1, 0.02352941, 1,
-0.4167496, 0.5525275, -0.4426834, 0, 1, 0.02745098, 1,
-0.4158455, 1.468205, 1.078578, 0, 1, 0.03529412, 1,
-0.4156902, -1.823457, -3.991906, 0, 1, 0.03921569, 1,
-0.4122102, -0.009130571, -0.6722476, 0, 1, 0.04705882, 1,
-0.4116011, -0.5909929, -3.373776, 0, 1, 0.05098039, 1,
-0.4099122, -0.5946518, -3.165047, 0, 1, 0.05882353, 1,
-0.4065773, 0.1812181, -0.7318861, 0, 1, 0.0627451, 1,
-0.4042698, 0.7084244, -1.840804, 0, 1, 0.07058824, 1,
-0.4034959, 0.759813, -3.36817, 0, 1, 0.07450981, 1,
-0.402812, -1.330081, -1.987323, 0, 1, 0.08235294, 1,
-0.401317, -1.279416, -2.73373, 0, 1, 0.08627451, 1,
-0.3948902, -0.03189119, -2.500402, 0, 1, 0.09411765, 1,
-0.39247, -0.7262473, -1.941613, 0, 1, 0.1019608, 1,
-0.3915381, 0.6528252, -1.671342, 0, 1, 0.1058824, 1,
-0.3863816, -0.6944627, -3.146452, 0, 1, 0.1137255, 1,
-0.3859482, -0.04586942, -0.8368757, 0, 1, 0.1176471, 1,
-0.3840834, 0.8749998, 0.5800361, 0, 1, 0.1254902, 1,
-0.3694436, -1.720463, -4.052253, 0, 1, 0.1294118, 1,
-0.3671502, 1.796064, -0.5594278, 0, 1, 0.1372549, 1,
-0.365602, -2.074349, -3.969332, 0, 1, 0.1411765, 1,
-0.3632551, -2.226874, -4.055968, 0, 1, 0.1490196, 1,
-0.3592467, 2.056257, -0.2549819, 0, 1, 0.1529412, 1,
-0.3525669, -1.798949, -3.181568, 0, 1, 0.1607843, 1,
-0.3522238, -1.165647, -2.743829, 0, 1, 0.1647059, 1,
-0.3520486, -0.3428743, -2.053928, 0, 1, 0.172549, 1,
-0.3491957, -0.346071, -0.9117234, 0, 1, 0.1764706, 1,
-0.3482369, 0.5133765, -0.3964159, 0, 1, 0.1843137, 1,
-0.3447053, 0.2136545, -0.129703, 0, 1, 0.1882353, 1,
-0.3437714, -0.8716097, -2.5691, 0, 1, 0.1960784, 1,
-0.3432806, -0.04282759, -1.641316, 0, 1, 0.2039216, 1,
-0.3425013, 0.4752713, 0.4726799, 0, 1, 0.2078431, 1,
-0.34207, -0.8961763, -1.554076, 0, 1, 0.2156863, 1,
-0.3390999, 0.527947, -1.354574, 0, 1, 0.2196078, 1,
-0.3368814, -1.295989, -2.716127, 0, 1, 0.227451, 1,
-0.3354995, -0.2478224, -3.72044, 0, 1, 0.2313726, 1,
-0.3262125, -1.940434, -3.822583, 0, 1, 0.2392157, 1,
-0.3236917, -0.5678319, -2.938914, 0, 1, 0.2431373, 1,
-0.322799, -1.176231, -2.445738, 0, 1, 0.2509804, 1,
-0.3220683, -1.261786, -2.923288, 0, 1, 0.254902, 1,
-0.3213618, -1.028356, -3.424491, 0, 1, 0.2627451, 1,
-0.3187589, -0.9108373, -2.352169, 0, 1, 0.2666667, 1,
-0.3177258, 0.1352598, -1.864058, 0, 1, 0.2745098, 1,
-0.3167636, -0.1105669, -1.262722, 0, 1, 0.2784314, 1,
-0.3155862, 0.2500093, -0.4335029, 0, 1, 0.2862745, 1,
-0.3146553, 2.536847, 0.3963556, 0, 1, 0.2901961, 1,
-0.3138842, -0.4392614, -2.804623, 0, 1, 0.2980392, 1,
-0.3127744, 0.5118093, 0.4053506, 0, 1, 0.3058824, 1,
-0.3100164, -0.01961769, -1.299397, 0, 1, 0.3098039, 1,
-0.3068683, -0.2520068, -3.654832, 0, 1, 0.3176471, 1,
-0.3066073, 1.801888, -0.7964911, 0, 1, 0.3215686, 1,
-0.3060606, 0.5388234, 0.3797041, 0, 1, 0.3294118, 1,
-0.3060033, 0.8807611, 0.0210365, 0, 1, 0.3333333, 1,
-0.3038281, -1.59276, -2.660269, 0, 1, 0.3411765, 1,
-0.3031493, 0.3703942, -1.066213, 0, 1, 0.345098, 1,
-0.301802, 0.8625581, -0.9283661, 0, 1, 0.3529412, 1,
-0.3017676, 0.6229011, -0.1185708, 0, 1, 0.3568628, 1,
-0.3002088, -0.9614821, -3.186966, 0, 1, 0.3647059, 1,
-0.2998463, -0.2154286, -2.556288, 0, 1, 0.3686275, 1,
-0.2996163, 0.6917917, -1.79869, 0, 1, 0.3764706, 1,
-0.2991938, -0.596779, -2.443163, 0, 1, 0.3803922, 1,
-0.2936979, -0.3649798, -2.493164, 0, 1, 0.3882353, 1,
-0.2922307, 0.8831059, -2.503265, 0, 1, 0.3921569, 1,
-0.2882948, 1.452311, -0.3654193, 0, 1, 0.4, 1,
-0.2868364, -1.48188, -4.25782, 0, 1, 0.4078431, 1,
-0.2841935, 1.339959, 0.3469454, 0, 1, 0.4117647, 1,
-0.2830851, -0.9217705, -4.036344, 0, 1, 0.4196078, 1,
-0.2811593, 0.505084, -0.6590064, 0, 1, 0.4235294, 1,
-0.2763935, 0.8849734, 1.152122, 0, 1, 0.4313726, 1,
-0.2721805, -0.474889, -2.32631, 0, 1, 0.4352941, 1,
-0.267215, -0.1543757, -0.6975703, 0, 1, 0.4431373, 1,
-0.2624303, -0.2857018, -3.066965, 0, 1, 0.4470588, 1,
-0.2584076, -0.2374804, -1.618879, 0, 1, 0.454902, 1,
-0.2577843, -1.4203, -4.718535, 0, 1, 0.4588235, 1,
-0.2571535, -0.8646252, -3.361873, 0, 1, 0.4666667, 1,
-0.2568215, -1.384436, -0.1648191, 0, 1, 0.4705882, 1,
-0.2448747, -0.9984928, -1.28906, 0, 1, 0.4784314, 1,
-0.2448705, 0.1451535, -0.6616397, 0, 1, 0.4823529, 1,
-0.2394479, 0.6428791, -0.3615182, 0, 1, 0.4901961, 1,
-0.2367969, 0.329293, 0.1587993, 0, 1, 0.4941176, 1,
-0.2320822, 0.04087871, -3.479833, 0, 1, 0.5019608, 1,
-0.2308524, 1.435093, -1.167355, 0, 1, 0.509804, 1,
-0.2264886, -0.2872084, -2.725642, 0, 1, 0.5137255, 1,
-0.2220974, 0.6782383, 0.04407636, 0, 1, 0.5215687, 1,
-0.2214202, -0.6202155, -1.290349, 0, 1, 0.5254902, 1,
-0.2197347, 2.104183, -2.136001, 0, 1, 0.5333334, 1,
-0.2173191, 0.9665351, -0.06586137, 0, 1, 0.5372549, 1,
-0.2158714, -2.290965, -3.581559, 0, 1, 0.5450981, 1,
-0.2107338, 0.3929195, 0.3223294, 0, 1, 0.5490196, 1,
-0.2091468, 0.6907173, -0.8553337, 0, 1, 0.5568628, 1,
-0.2054241, -1.019802, -3.353443, 0, 1, 0.5607843, 1,
-0.2053831, 0.4333738, 0.0246037, 0, 1, 0.5686275, 1,
-0.202681, -0.03233868, 0.6543389, 0, 1, 0.572549, 1,
-0.2022371, 0.1630522, 0.08009759, 0, 1, 0.5803922, 1,
-0.200818, 0.2643026, -0.01371411, 0, 1, 0.5843138, 1,
-0.1988986, 2.259808, -1.662758, 0, 1, 0.5921569, 1,
-0.1986991, 1.216103, 0.4696313, 0, 1, 0.5960785, 1,
-0.1984043, 0.8995704, 0.8286155, 0, 1, 0.6039216, 1,
-0.1952429, -0.01247646, -2.784348, 0, 1, 0.6117647, 1,
-0.1940952, -0.161741, -1.774941, 0, 1, 0.6156863, 1,
-0.193355, 1.269296, 0.7748923, 0, 1, 0.6235294, 1,
-0.1847072, 0.6041004, -0.8684013, 0, 1, 0.627451, 1,
-0.1832999, -0.4459472, -2.654974, 0, 1, 0.6352941, 1,
-0.1797681, -0.06360204, -1.539878, 0, 1, 0.6392157, 1,
-0.1761855, 0.1228562, -1.625326, 0, 1, 0.6470588, 1,
-0.1758308, -1.198028, -3.272963, 0, 1, 0.6509804, 1,
-0.1684164, -0.2311689, -0.7791185, 0, 1, 0.6588235, 1,
-0.1652065, 1.091022, 1.826635, 0, 1, 0.6627451, 1,
-0.157806, -1.112263, -3.618605, 0, 1, 0.6705883, 1,
-0.1577053, -1.945547, -1.876985, 0, 1, 0.6745098, 1,
-0.1541194, -1.437547, -5.614461, 0, 1, 0.682353, 1,
-0.1467283, -0.03440088, -2.619243, 0, 1, 0.6862745, 1,
-0.1444909, -0.5865021, -3.48024, 0, 1, 0.6941177, 1,
-0.1427979, -1.179657, -1.683743, 0, 1, 0.7019608, 1,
-0.1413872, 1.366096, -0.6990049, 0, 1, 0.7058824, 1,
-0.1413287, -0.008097298, -1.937376, 0, 1, 0.7137255, 1,
-0.141005, -2.093578, -2.435579, 0, 1, 0.7176471, 1,
-0.139438, 0.4048173, -0.4432561, 0, 1, 0.7254902, 1,
-0.1317271, -0.06254628, -2.215847, 0, 1, 0.7294118, 1,
-0.1262754, 1.523314, -0.2786747, 0, 1, 0.7372549, 1,
-0.1254635, -0.6232439, -1.727613, 0, 1, 0.7411765, 1,
-0.1254438, 0.5466347, -0.278324, 0, 1, 0.7490196, 1,
-0.1253972, 0.4902086, -1.229851, 0, 1, 0.7529412, 1,
-0.1180981, 0.891974, -0.6193335, 0, 1, 0.7607843, 1,
-0.117711, -0.4896189, -3.305554, 0, 1, 0.7647059, 1,
-0.1160761, 1.570747, -2.407774, 0, 1, 0.772549, 1,
-0.1106264, -0.7420614, -2.587339, 0, 1, 0.7764706, 1,
-0.1103657, 1.618177, -0.6716862, 0, 1, 0.7843137, 1,
-0.1103617, 1.385636, -0.9576407, 0, 1, 0.7882353, 1,
-0.1094053, 0.8887457, -1.143859, 0, 1, 0.7960784, 1,
-0.1068622, 1.085934, -0.8684959, 0, 1, 0.8039216, 1,
-0.1037077, -0.4036774, -4.906646, 0, 1, 0.8078431, 1,
-0.1013857, 0.8131682, -1.757466, 0, 1, 0.8156863, 1,
-0.09679076, -0.4284976, -3.457998, 0, 1, 0.8196079, 1,
-0.08666523, 0.9666063, -1.678165, 0, 1, 0.827451, 1,
-0.08588785, -0.9149888, -3.407542, 0, 1, 0.8313726, 1,
-0.08560305, 0.2560166, -0.7479987, 0, 1, 0.8392157, 1,
-0.08530555, -0.7983071, -2.804149, 0, 1, 0.8431373, 1,
-0.08400489, 1.131718, -0.9989799, 0, 1, 0.8509804, 1,
-0.08100618, 0.1278971, -2.152389, 0, 1, 0.854902, 1,
-0.07882293, 0.02262966, -2.901302, 0, 1, 0.8627451, 1,
-0.07406727, -0.4716751, -2.523755, 0, 1, 0.8666667, 1,
-0.06929924, 1.353054, -0.4663886, 0, 1, 0.8745098, 1,
-0.06354757, 0.5948673, 1.313393, 0, 1, 0.8784314, 1,
-0.06066823, 1.643752, 0.6316481, 0, 1, 0.8862745, 1,
-0.05826177, 0.5919313, -0.1766477, 0, 1, 0.8901961, 1,
-0.05642824, -1.420542, -1.945506, 0, 1, 0.8980392, 1,
-0.05600999, 0.9319425, -0.4893455, 0, 1, 0.9058824, 1,
-0.05454987, -0.1481665, -2.873336, 0, 1, 0.9098039, 1,
-0.05361578, 0.3138823, 0.2186828, 0, 1, 0.9176471, 1,
-0.05305016, -1.018343, -3.902732, 0, 1, 0.9215686, 1,
-0.05295087, 0.02468894, -1.534739, 0, 1, 0.9294118, 1,
-0.05263163, -1.333184, -3.691785, 0, 1, 0.9333333, 1,
-0.05119313, 0.1393428, -0.8660726, 0, 1, 0.9411765, 1,
-0.05094333, 1.308131, -0.5471259, 0, 1, 0.945098, 1,
-0.04698768, 1.217213, 0.8704686, 0, 1, 0.9529412, 1,
-0.04522288, 0.7343127, -2.214446, 0, 1, 0.9568627, 1,
-0.03831998, 0.3245538, 0.7464942, 0, 1, 0.9647059, 1,
-0.03760491, 0.1556278, -0.4230193, 0, 1, 0.9686275, 1,
-0.03099578, 0.6188689, -0.3582737, 0, 1, 0.9764706, 1,
-0.03012772, -1.827927, -3.334747, 0, 1, 0.9803922, 1,
-0.02934813, -0.2212691, -3.854399, 0, 1, 0.9882353, 1,
-0.02868013, -1.534857, -4.331334, 0, 1, 0.9921569, 1,
-0.02857222, -0.7153763, -2.960579, 0, 1, 1, 1,
-0.02752729, 0.2685914, 2.491828, 0, 0.9921569, 1, 1,
-0.02647988, -0.3102621, -2.43033, 0, 0.9882353, 1, 1,
-0.02572214, 0.752807, -0.8869226, 0, 0.9803922, 1, 1,
-0.02429372, 0.8004033, 1.850795, 0, 0.9764706, 1, 1,
-0.02327136, -0.008007905, -0.6369448, 0, 0.9686275, 1, 1,
-0.02243615, 0.246169, -1.191028, 0, 0.9647059, 1, 1,
-0.02239677, 0.2884648, -0.333766, 0, 0.9568627, 1, 1,
-0.02100161, -0.4841878, -2.930501, 0, 0.9529412, 1, 1,
-0.02000467, 0.1111024, 0.2921746, 0, 0.945098, 1, 1,
-0.009904856, 0.2611061, 0.7534877, 0, 0.9411765, 1, 1,
-0.007713644, -0.4929519, -2.715728, 0, 0.9333333, 1, 1,
-0.004828476, 0.5884139, 0.5418815, 0, 0.9294118, 1, 1,
-0.0007022735, 0.5005391, -0.9310086, 0, 0.9215686, 1, 1,
0.0008578774, -1.394785, 1.499457, 0, 0.9176471, 1, 1,
0.00355396, -0.1906191, 3.03468, 0, 0.9098039, 1, 1,
0.006777924, -1.317499, 2.120283, 0, 0.9058824, 1, 1,
0.01197746, 0.06085252, 0.6264342, 0, 0.8980392, 1, 1,
0.0123986, 0.8569409, 0.01849344, 0, 0.8901961, 1, 1,
0.01348718, -0.7968232, 4.007174, 0, 0.8862745, 1, 1,
0.01351545, -0.7279384, 1.444404, 0, 0.8784314, 1, 1,
0.01942486, -0.5814761, 3.362573, 0, 0.8745098, 1, 1,
0.02154896, -0.4634145, 3.672036, 0, 0.8666667, 1, 1,
0.02264258, 0.05795207, 1.552906, 0, 0.8627451, 1, 1,
0.02421637, -0.1397783, 2.614719, 0, 0.854902, 1, 1,
0.02536791, -0.5203974, 1.640603, 0, 0.8509804, 1, 1,
0.02669358, -0.5117871, 3.02567, 0, 0.8431373, 1, 1,
0.02705797, -0.7903637, 2.554563, 0, 0.8392157, 1, 1,
0.02824818, -1.446846, 2.246323, 0, 0.8313726, 1, 1,
0.03260954, 0.6304296, -0.4153755, 0, 0.827451, 1, 1,
0.03448334, -0.454805, 2.830988, 0, 0.8196079, 1, 1,
0.03955543, 1.0813, 0.4438985, 0, 0.8156863, 1, 1,
0.04786354, -1.281015, 4.027512, 0, 0.8078431, 1, 1,
0.04828541, -0.7631446, 3.349304, 0, 0.8039216, 1, 1,
0.04943169, -0.4041985, 3.264194, 0, 0.7960784, 1, 1,
0.05181615, -0.4213175, 3.838683, 0, 0.7882353, 1, 1,
0.05490026, 0.02175055, 0.3727895, 0, 0.7843137, 1, 1,
0.0571507, 0.4479277, 2.187979, 0, 0.7764706, 1, 1,
0.05778581, -0.6315641, 2.807117, 0, 0.772549, 1, 1,
0.06293091, -0.2491905, 2.487313, 0, 0.7647059, 1, 1,
0.0636633, 1.447659, -0.5630558, 0, 0.7607843, 1, 1,
0.06898858, 0.9066727, -1.140824, 0, 0.7529412, 1, 1,
0.07118366, -0.944441, 2.656242, 0, 0.7490196, 1, 1,
0.07443815, 0.2559539, 1.03371, 0, 0.7411765, 1, 1,
0.081968, -1.293384, 4.530084, 0, 0.7372549, 1, 1,
0.08291268, -0.721852, 2.389923, 0, 0.7294118, 1, 1,
0.08334241, 0.3693961, 0.115502, 0, 0.7254902, 1, 1,
0.0850758, 1.139047, 0.5565878, 0, 0.7176471, 1, 1,
0.08843587, 0.04194999, 3.1871, 0, 0.7137255, 1, 1,
0.09692341, 0.06320806, 1.054209, 0, 0.7058824, 1, 1,
0.09759079, -0.04968974, 1.691821, 0, 0.6980392, 1, 1,
0.09993521, -0.08589542, 2.341987, 0, 0.6941177, 1, 1,
0.09996288, -1.583993, 3.738503, 0, 0.6862745, 1, 1,
0.1019294, -1.119208, 2.505138, 0, 0.682353, 1, 1,
0.1027174, -0.4707612, 1.554509, 0, 0.6745098, 1, 1,
0.1122046, -1.842603, 4.07782, 0, 0.6705883, 1, 1,
0.1159775, -0.0962192, 2.384137, 0, 0.6627451, 1, 1,
0.1177477, 1.910867, 0.5589063, 0, 0.6588235, 1, 1,
0.1190216, 0.1799701, 1.630759, 0, 0.6509804, 1, 1,
0.1203235, -0.6228009, 1.618247, 0, 0.6470588, 1, 1,
0.1232519, 0.2743104, 0.4360046, 0, 0.6392157, 1, 1,
0.1243382, 0.6104521, 1.438142, 0, 0.6352941, 1, 1,
0.1324719, -1.932212, 2.665167, 0, 0.627451, 1, 1,
0.1330072, 0.5152511, 1.232973, 0, 0.6235294, 1, 1,
0.1350757, -0.3433998, 1.836322, 0, 0.6156863, 1, 1,
0.1367894, 0.7686664, -1.335548, 0, 0.6117647, 1, 1,
0.1383806, 1.495874, 0.4367389, 0, 0.6039216, 1, 1,
0.1489469, 0.2610942, 0.675953, 0, 0.5960785, 1, 1,
0.1496045, 0.3127775, 1.22664, 0, 0.5921569, 1, 1,
0.1539824, -0.9192873, 2.012076, 0, 0.5843138, 1, 1,
0.1569231, 3.315131, -1.039705, 0, 0.5803922, 1, 1,
0.1606118, -0.05560966, 0.3496819, 0, 0.572549, 1, 1,
0.1634385, -1.362074, 2.56627, 0, 0.5686275, 1, 1,
0.1635748, 0.4131259, 1.767255, 0, 0.5607843, 1, 1,
0.164171, -2.59103, 3.204775, 0, 0.5568628, 1, 1,
0.1650605, -0.3136234, 1.828224, 0, 0.5490196, 1, 1,
0.1663537, 0.2175075, 0.6318639, 0, 0.5450981, 1, 1,
0.1669744, -0.4811366, 2.745562, 0, 0.5372549, 1, 1,
0.1685181, 0.5425748, -0.02547613, 0, 0.5333334, 1, 1,
0.1743012, -1.17448, 2.151496, 0, 0.5254902, 1, 1,
0.1753808, 0.1590974, 2.287125, 0, 0.5215687, 1, 1,
0.1759896, 0.7225344, 1.213197, 0, 0.5137255, 1, 1,
0.1771812, -0.109921, 1.73653, 0, 0.509804, 1, 1,
0.1796723, -0.4271403, 2.020604, 0, 0.5019608, 1, 1,
0.1800517, -1.199417, 2.464521, 0, 0.4941176, 1, 1,
0.1840317, 1.311909, -1.312229, 0, 0.4901961, 1, 1,
0.1859863, 0.2698646, 1.757444, 0, 0.4823529, 1, 1,
0.1870982, 1.080202, -0.9672819, 0, 0.4784314, 1, 1,
0.1897845, 0.1064644, 2.319225, 0, 0.4705882, 1, 1,
0.1942951, 1.009599, -0.3250729, 0, 0.4666667, 1, 1,
0.1947117, -0.9245085, 3.977363, 0, 0.4588235, 1, 1,
0.1972316, -0.9784359, 2.689539, 0, 0.454902, 1, 1,
0.1976216, -1.581288, 3.633594, 0, 0.4470588, 1, 1,
0.1994236, -0.3541398, 2.630553, 0, 0.4431373, 1, 1,
0.2090609, -0.2159739, 1.933359, 0, 0.4352941, 1, 1,
0.2098256, -1.664582, 3.424267, 0, 0.4313726, 1, 1,
0.2111292, -0.919852, 4.1376, 0, 0.4235294, 1, 1,
0.2116856, 0.3084319, 0.3710093, 0, 0.4196078, 1, 1,
0.2133217, 1.665198, 0.1664344, 0, 0.4117647, 1, 1,
0.213531, -0.07873999, 1.709259, 0, 0.4078431, 1, 1,
0.235576, 0.9929208, -0.9950426, 0, 0.4, 1, 1,
0.2383832, -0.703899, 1.895382, 0, 0.3921569, 1, 1,
0.2385298, -0.552249, 3.228404, 0, 0.3882353, 1, 1,
0.2470081, 1.326051, 0.1202901, 0, 0.3803922, 1, 1,
0.2473036, -0.6117699, 3.272061, 0, 0.3764706, 1, 1,
0.2514624, -0.9370831, 2.898689, 0, 0.3686275, 1, 1,
0.2520082, -1.575322, 1.797393, 0, 0.3647059, 1, 1,
0.2527461, -0.494999, 2.850175, 0, 0.3568628, 1, 1,
0.2536713, -0.5775099, 3.287517, 0, 0.3529412, 1, 1,
0.2544823, -0.1056383, 1.411154, 0, 0.345098, 1, 1,
0.255845, 0.7828089, -0.8086557, 0, 0.3411765, 1, 1,
0.2594313, 1.132376, 0.175242, 0, 0.3333333, 1, 1,
0.2637359, -0.2074024, 2.813719, 0, 0.3294118, 1, 1,
0.2641989, -1.185458, 4.034042, 0, 0.3215686, 1, 1,
0.2650733, -1.241341, 3.299167, 0, 0.3176471, 1, 1,
0.2673554, 0.9282807, 0.6766575, 0, 0.3098039, 1, 1,
0.2675349, 0.9335783, 0.1752818, 0, 0.3058824, 1, 1,
0.2722848, 2.084517, 0.5276728, 0, 0.2980392, 1, 1,
0.280958, 1.076177, -1.41144, 0, 0.2901961, 1, 1,
0.2857121, 0.4133955, 1.950976, 0, 0.2862745, 1, 1,
0.292503, 0.1688662, 0.7363419, 0, 0.2784314, 1, 1,
0.2928309, -2.368658, 2.751284, 0, 0.2745098, 1, 1,
0.2929852, 0.4482571, 2.077315, 0, 0.2666667, 1, 1,
0.2975016, 1.293076, -0.01089475, 0, 0.2627451, 1, 1,
0.2984767, 0.9095778, -0.5485315, 0, 0.254902, 1, 1,
0.3040206, -0.3650499, 3.077098, 0, 0.2509804, 1, 1,
0.3066859, -1.444902, 4.583544, 0, 0.2431373, 1, 1,
0.3145057, 0.7547003, -0.04192591, 0, 0.2392157, 1, 1,
0.3152686, -0.8786681, 4.353265, 0, 0.2313726, 1, 1,
0.3159492, 1.511964, 0.7341599, 0, 0.227451, 1, 1,
0.3200736, -0.2504098, 1.855051, 0, 0.2196078, 1, 1,
0.3212482, -0.07779276, 2.91038, 0, 0.2156863, 1, 1,
0.321502, 1.251126, -0.843776, 0, 0.2078431, 1, 1,
0.323689, -1.017821, 1.677922, 0, 0.2039216, 1, 1,
0.326122, 0.7779996, 0.7532755, 0, 0.1960784, 1, 1,
0.339348, -0.2612208, 1.683625, 0, 0.1882353, 1, 1,
0.3402362, 1.111663, 0.6943033, 0, 0.1843137, 1, 1,
0.3433781, -0.3201755, 2.793857, 0, 0.1764706, 1, 1,
0.344658, 0.6562909, 0.296626, 0, 0.172549, 1, 1,
0.3466752, 0.3799399, -0.5402381, 0, 0.1647059, 1, 1,
0.3497609, 1.156218, -1.34436, 0, 0.1607843, 1, 1,
0.3534341, -0.5735772, 4.424896, 0, 0.1529412, 1, 1,
0.3588724, -0.6117204, 4.400421, 0, 0.1490196, 1, 1,
0.3600348, 0.5548053, 1.65102, 0, 0.1411765, 1, 1,
0.3611954, -0.1066224, 1.71233, 0, 0.1372549, 1, 1,
0.3650084, -0.649278, 2.063378, 0, 0.1294118, 1, 1,
0.3659927, -0.1040801, 3.182114, 0, 0.1254902, 1, 1,
0.3690401, -0.594166, 1.976293, 0, 0.1176471, 1, 1,
0.3704351, 3.197634, -0.6122814, 0, 0.1137255, 1, 1,
0.3776805, 0.6334083, 2.762595, 0, 0.1058824, 1, 1,
0.3821745, -0.5046508, 1.89309, 0, 0.09803922, 1, 1,
0.3866473, -0.6906061, 2.540764, 0, 0.09411765, 1, 1,
0.3910438, -0.1680374, 3.55776, 0, 0.08627451, 1, 1,
0.3924813, 0.5137312, 1.411174, 0, 0.08235294, 1, 1,
0.4017394, 0.3850733, 0.3785268, 0, 0.07450981, 1, 1,
0.4142817, 0.8626071, -0.07710166, 0, 0.07058824, 1, 1,
0.4156234, 0.4166722, 0.476565, 0, 0.0627451, 1, 1,
0.4165191, -1.415777, 3.186579, 0, 0.05882353, 1, 1,
0.4172213, -0.1143841, 3.120749, 0, 0.05098039, 1, 1,
0.419413, 0.04236703, -0.5344926, 0, 0.04705882, 1, 1,
0.4201198, -1.168651, 3.889614, 0, 0.03921569, 1, 1,
0.4234148, 0.6887725, 0.3507074, 0, 0.03529412, 1, 1,
0.4239643, -0.01037571, 0.09533242, 0, 0.02745098, 1, 1,
0.4281088, 0.2520565, 0.4682467, 0, 0.02352941, 1, 1,
0.4315534, -0.4357418, 2.251417, 0, 0.01568628, 1, 1,
0.4338935, 1.32053, 0.8216666, 0, 0.01176471, 1, 1,
0.434709, -1.473735, 1.119122, 0, 0.003921569, 1, 1,
0.4365498, -0.6419193, 1.988187, 0.003921569, 0, 1, 1,
0.4393536, 1.989606, -1.665062, 0.007843138, 0, 1, 1,
0.4408495, -0.7949606, 2.834362, 0.01568628, 0, 1, 1,
0.443451, 0.5910522, 2.594478, 0.01960784, 0, 1, 1,
0.4442933, 1.0524, 0.280299, 0.02745098, 0, 1, 1,
0.4465042, 1.81438, 1.80018, 0.03137255, 0, 1, 1,
0.450077, -0.1105714, 1.400196, 0.03921569, 0, 1, 1,
0.4613306, 1.182199, 1.109297, 0.04313726, 0, 1, 1,
0.4648878, -0.5988341, 4.387254, 0.05098039, 0, 1, 1,
0.4694993, 1.540592, 0.2127277, 0.05490196, 0, 1, 1,
0.4705578, 0.1795383, 1.504486, 0.0627451, 0, 1, 1,
0.4709651, 0.07017679, 1.460096, 0.06666667, 0, 1, 1,
0.4712309, -1.209867, 4.549472, 0.07450981, 0, 1, 1,
0.4724356, 0.4903978, 0.8029928, 0.07843138, 0, 1, 1,
0.4725846, -0.2105563, 2.333208, 0.08627451, 0, 1, 1,
0.4761373, 0.1780032, 3.492125, 0.09019608, 0, 1, 1,
0.4784177, -0.4108734, 2.679601, 0.09803922, 0, 1, 1,
0.4799069, -0.2291981, 1.98231, 0.1058824, 0, 1, 1,
0.4810956, -1.419604, 1.783242, 0.1098039, 0, 1, 1,
0.4911458, 0.2072045, 2.028647, 0.1176471, 0, 1, 1,
0.492422, -2.225216, 2.52938, 0.1215686, 0, 1, 1,
0.4958762, 0.261735, 0.2510248, 0.1294118, 0, 1, 1,
0.4989717, -0.07018487, 1.590036, 0.1333333, 0, 1, 1,
0.5009092, 1.336123, -1.092583, 0.1411765, 0, 1, 1,
0.5027102, -0.01154235, 2.905884, 0.145098, 0, 1, 1,
0.5052775, 0.1910771, 1.259359, 0.1529412, 0, 1, 1,
0.5068296, 0.2791291, 0.9032685, 0.1568628, 0, 1, 1,
0.5075451, 1.636472, -1.261399, 0.1647059, 0, 1, 1,
0.5078839, 1.308418, 1.354685, 0.1686275, 0, 1, 1,
0.5107352, 0.3478029, -0.1107478, 0.1764706, 0, 1, 1,
0.513512, -0.343884, 1.492714, 0.1803922, 0, 1, 1,
0.5186577, -1.725862, 3.929681, 0.1882353, 0, 1, 1,
0.521798, 0.4822872, 1.22273, 0.1921569, 0, 1, 1,
0.5291198, 0.7519484, 0.3043846, 0.2, 0, 1, 1,
0.5341492, 0.5864786, 0.5270519, 0.2078431, 0, 1, 1,
0.534187, -0.7522843, 3.255243, 0.2117647, 0, 1, 1,
0.5420302, -1.575352, 0.9205303, 0.2196078, 0, 1, 1,
0.5436323, -0.238262, 1.754501, 0.2235294, 0, 1, 1,
0.5459788, 0.453438, 1.389498, 0.2313726, 0, 1, 1,
0.5483, -0.7354377, 1.722605, 0.2352941, 0, 1, 1,
0.5503055, 0.3835787, 1.254017, 0.2431373, 0, 1, 1,
0.5522977, 1.038853, 0.249102, 0.2470588, 0, 1, 1,
0.5558296, -0.662388, 1.86525, 0.254902, 0, 1, 1,
0.5570766, 0.7406183, 0.8616256, 0.2588235, 0, 1, 1,
0.5573725, 0.496567, 2.295565, 0.2666667, 0, 1, 1,
0.5586553, -0.6424875, 2.343011, 0.2705882, 0, 1, 1,
0.5632129, -0.2117054, 1.724946, 0.2784314, 0, 1, 1,
0.5668575, -0.4898839, 2.9756, 0.282353, 0, 1, 1,
0.5692662, -0.4778485, 1.002358, 0.2901961, 0, 1, 1,
0.5698345, 0.6082542, 0.4530682, 0.2941177, 0, 1, 1,
0.5714341, 0.4145054, 1.542834, 0.3019608, 0, 1, 1,
0.5732013, -0.5627496, 2.16753, 0.3098039, 0, 1, 1,
0.5750426, 0.01900376, 1.302804, 0.3137255, 0, 1, 1,
0.5829048, 0.7136679, 0.09439357, 0.3215686, 0, 1, 1,
0.5866431, -0.2444787, 2.482109, 0.3254902, 0, 1, 1,
0.5868931, -1.802911, 3.221248, 0.3333333, 0, 1, 1,
0.6013678, -0.4608886, 2.388637, 0.3372549, 0, 1, 1,
0.6086345, -0.3574336, 2.911846, 0.345098, 0, 1, 1,
0.6149209, 1.120583, -0.8594416, 0.3490196, 0, 1, 1,
0.6162962, -0.2025767, 2.290752, 0.3568628, 0, 1, 1,
0.6176228, 1.372708, 1.434352, 0.3607843, 0, 1, 1,
0.6184444, -0.819519, 2.241712, 0.3686275, 0, 1, 1,
0.6204884, -2.338378, 2.067488, 0.372549, 0, 1, 1,
0.620666, -0.630955, 2.622782, 0.3803922, 0, 1, 1,
0.6248816, -0.8309495, 3.086149, 0.3843137, 0, 1, 1,
0.6327205, -1.209853, 3.477362, 0.3921569, 0, 1, 1,
0.6331, -0.5055329, 2.250344, 0.3960784, 0, 1, 1,
0.6331567, 1.377644, 1.248398, 0.4039216, 0, 1, 1,
0.6340543, -0.705157, 2.242955, 0.4117647, 0, 1, 1,
0.6348138, 0.8164907, 2.403792, 0.4156863, 0, 1, 1,
0.6366134, 0.8863789, 1.515704, 0.4235294, 0, 1, 1,
0.6366957, 1.15154, 1.66529, 0.427451, 0, 1, 1,
0.6414664, 1.839129, -0.8334127, 0.4352941, 0, 1, 1,
0.6427506, 0.8706051, -1.006508, 0.4392157, 0, 1, 1,
0.648542, -1.056615, 4.677588, 0.4470588, 0, 1, 1,
0.650751, 0.8552006, 0.3276487, 0.4509804, 0, 1, 1,
0.655562, -1.018139, 3.592193, 0.4588235, 0, 1, 1,
0.6576032, 0.05231098, 1.62896, 0.4627451, 0, 1, 1,
0.6598818, -0.4411138, 2.184303, 0.4705882, 0, 1, 1,
0.6610627, -2.305275, 3.609652, 0.4745098, 0, 1, 1,
0.6661678, -1.077221, 2.476102, 0.4823529, 0, 1, 1,
0.6669764, 0.3663467, 0.9301921, 0.4862745, 0, 1, 1,
0.6679719, -0.3711176, 0.3383761, 0.4941176, 0, 1, 1,
0.672205, -0.5227523, 2.441485, 0.5019608, 0, 1, 1,
0.6801251, 1.726027, 1.129055, 0.5058824, 0, 1, 1,
0.691155, 0.3753759, 0.09504589, 0.5137255, 0, 1, 1,
0.691447, 0.7790852, 1.607823, 0.5176471, 0, 1, 1,
0.6918125, 1.066602, 1.590289, 0.5254902, 0, 1, 1,
0.6928203, 1.124896, 1.274485, 0.5294118, 0, 1, 1,
0.6963794, -3.132597, 2.981286, 0.5372549, 0, 1, 1,
0.6964445, -1.834684, 1.881717, 0.5411765, 0, 1, 1,
0.7003434, -1.084107, 4.662558, 0.5490196, 0, 1, 1,
0.7027159, -0.1991425, 1.974727, 0.5529412, 0, 1, 1,
0.7038342, 0.7675474, -0.5677295, 0.5607843, 0, 1, 1,
0.7048921, -0.06977864, 1.8397, 0.5647059, 0, 1, 1,
0.70731, 0.5334464, 2.879354, 0.572549, 0, 1, 1,
0.7101614, -1.369053, 3.299659, 0.5764706, 0, 1, 1,
0.7133765, -1.493255, 3.665254, 0.5843138, 0, 1, 1,
0.7203187, 0.8206747, 0.5459062, 0.5882353, 0, 1, 1,
0.7216425, 0.06086981, 1.102018, 0.5960785, 0, 1, 1,
0.7218224, -1.596412, 1.937448, 0.6039216, 0, 1, 1,
0.7332447, -0.243622, -0.3192676, 0.6078432, 0, 1, 1,
0.7358152, 2.267552, -0.4188631, 0.6156863, 0, 1, 1,
0.7364081, 0.4466046, 0.7688641, 0.6196079, 0, 1, 1,
0.7396505, 1.121808, 1.58041, 0.627451, 0, 1, 1,
0.7409369, 1.461295, 0.09754436, 0.6313726, 0, 1, 1,
0.7523296, -0.9339285, -0.005274596, 0.6392157, 0, 1, 1,
0.7523468, -1.083216, 1.664342, 0.6431373, 0, 1, 1,
0.7595391, 0.6228191, -1.775254, 0.6509804, 0, 1, 1,
0.765858, -1.621329, 2.843826, 0.654902, 0, 1, 1,
0.7730042, 2.163181, 0.3489506, 0.6627451, 0, 1, 1,
0.7730835, 0.1613222, 1.773664, 0.6666667, 0, 1, 1,
0.778177, 1.113024, -1.248962, 0.6745098, 0, 1, 1,
0.7812385, -0.586174, 1.747476, 0.6784314, 0, 1, 1,
0.7813325, 0.7287319, 0.4819342, 0.6862745, 0, 1, 1,
0.7818957, -0.5366629, 2.416723, 0.6901961, 0, 1, 1,
0.7861376, -0.8233121, 2.078904, 0.6980392, 0, 1, 1,
0.7909968, -0.6913843, 1.577983, 0.7058824, 0, 1, 1,
0.7962576, 0.8078095, 1.250066, 0.7098039, 0, 1, 1,
0.796552, -0.5106477, 2.218973, 0.7176471, 0, 1, 1,
0.797909, 1.044069, -1.631183, 0.7215686, 0, 1, 1,
0.8013672, 0.4895809, 1.512118, 0.7294118, 0, 1, 1,
0.8017251, -0.4962265, 3.034576, 0.7333333, 0, 1, 1,
0.8070122, 1.937969, -1.871683, 0.7411765, 0, 1, 1,
0.8080691, 0.2299612, 2.341976, 0.7450981, 0, 1, 1,
0.810132, -0.7609982, 1.325865, 0.7529412, 0, 1, 1,
0.8243006, 2.337715, 2.15937, 0.7568628, 0, 1, 1,
0.8255363, 0.1971929, 1.426319, 0.7647059, 0, 1, 1,
0.8256441, -1.890428, 3.658567, 0.7686275, 0, 1, 1,
0.8266467, -0.3973006, 2.273515, 0.7764706, 0, 1, 1,
0.828227, 0.7292788, 1.305149, 0.7803922, 0, 1, 1,
0.8302883, 0.9449729, 0.5174418, 0.7882353, 0, 1, 1,
0.8303174, 0.3685647, 1.073646, 0.7921569, 0, 1, 1,
0.8317663, 1.401222, 0.6095086, 0.8, 0, 1, 1,
0.8382165, -0.4346864, 1.701712, 0.8078431, 0, 1, 1,
0.8447376, -0.6650054, 3.102069, 0.8117647, 0, 1, 1,
0.8580008, -0.6806478, 3.792053, 0.8196079, 0, 1, 1,
0.8599879, -0.1572559, 0.4496551, 0.8235294, 0, 1, 1,
0.8627878, -0.853561, 2.903157, 0.8313726, 0, 1, 1,
0.8656482, 1.454447, -1.383507, 0.8352941, 0, 1, 1,
0.8668276, -0.1843452, 3.408367, 0.8431373, 0, 1, 1,
0.8671401, 0.0798125, 2.457309, 0.8470588, 0, 1, 1,
0.8741784, -0.2630402, 2.979045, 0.854902, 0, 1, 1,
0.8814018, 0.06657105, 1.860482, 0.8588235, 0, 1, 1,
0.8883996, 0.42338, 2.357079, 0.8666667, 0, 1, 1,
0.8912216, -0.2950967, 1.607298, 0.8705882, 0, 1, 1,
0.8959157, 0.2626017, 2.950321, 0.8784314, 0, 1, 1,
0.897891, 0.4355137, 1.132038, 0.8823529, 0, 1, 1,
0.9000567, -0.4622235, 2.297725, 0.8901961, 0, 1, 1,
0.9018351, -0.2164597, 1.988893, 0.8941177, 0, 1, 1,
0.9028575, -0.4348361, 1.955553, 0.9019608, 0, 1, 1,
0.9030102, 1.454128, 1.090111, 0.9098039, 0, 1, 1,
0.9042856, 1.73409, 1.774087, 0.9137255, 0, 1, 1,
0.9147934, -0.4621059, 2.658637, 0.9215686, 0, 1, 1,
0.916719, 0.2181805, 1.815778, 0.9254902, 0, 1, 1,
0.9252823, -2.463879, 2.831609, 0.9333333, 0, 1, 1,
0.926955, -1.546182, 3.354394, 0.9372549, 0, 1, 1,
0.9308237, -0.6430189, 1.81153, 0.945098, 0, 1, 1,
0.9340519, 0.7570062, 0.9171393, 0.9490196, 0, 1, 1,
0.938733, -0.05946972, 1.837018, 0.9568627, 0, 1, 1,
0.93943, 1.506406, 1.815027, 0.9607843, 0, 1, 1,
0.9539143, -1.394907, 1.92391, 0.9686275, 0, 1, 1,
0.9577208, -1.973586, 2.02605, 0.972549, 0, 1, 1,
0.9673025, -0.5578168, 2.006879, 0.9803922, 0, 1, 1,
0.9680255, -0.734586, 2.212887, 0.9843137, 0, 1, 1,
0.9729804, -0.1677525, 2.10734, 0.9921569, 0, 1, 1,
0.9743083, -0.4167115, 1.653551, 0.9960784, 0, 1, 1,
0.9771364, -1.539742, 3.280011, 1, 0, 0.9960784, 1,
0.9811524, -2.505354, 3.709025, 1, 0, 0.9882353, 1,
0.9827582, -0.1695181, 1.942677, 1, 0, 0.9843137, 1,
0.9848952, 2.089226, -0.9301181, 1, 0, 0.9764706, 1,
0.9969128, -1.060808, 1.658945, 1, 0, 0.972549, 1,
0.9979337, 0.4130999, 2.372494, 1, 0, 0.9647059, 1,
1.001912, -1.506112, 1.556287, 1, 0, 0.9607843, 1,
1.004393, -0.8954418, 2.209764, 1, 0, 0.9529412, 1,
1.005177, 1.534896, 0.5266685, 1, 0, 0.9490196, 1,
1.00861, -0.3288299, 2.01679, 1, 0, 0.9411765, 1,
1.017025, 0.8080575, -0.7332113, 1, 0, 0.9372549, 1,
1.017134, 0.6419196, 1.037467, 1, 0, 0.9294118, 1,
1.03324, -0.4188717, 4.311221, 1, 0, 0.9254902, 1,
1.033803, -0.6658325, 1.403364, 1, 0, 0.9176471, 1,
1.036929, -0.4957762, 2.559381, 1, 0, 0.9137255, 1,
1.037338, -0.09222238, 1.542928, 1, 0, 0.9058824, 1,
1.037819, -0.8054035, 0.320707, 1, 0, 0.9019608, 1,
1.043934, 0.5589429, 0.3765841, 1, 0, 0.8941177, 1,
1.048676, -0.3855858, 0.6862693, 1, 0, 0.8862745, 1,
1.049453, -0.1774952, 1.288385, 1, 0, 0.8823529, 1,
1.058635, 0.328408, 1.600049, 1, 0, 0.8745098, 1,
1.05994, -0.653797, 1.543988, 1, 0, 0.8705882, 1,
1.069087, 0.03861268, 1.986003, 1, 0, 0.8627451, 1,
1.069668, -1.212494, 3.809063, 1, 0, 0.8588235, 1,
1.071745, -0.851666, 1.265908, 1, 0, 0.8509804, 1,
1.07315, 0.6303731, 1.042152, 1, 0, 0.8470588, 1,
1.079459, -0.5132636, 1.819191, 1, 0, 0.8392157, 1,
1.095223, -0.8891276, 2.930996, 1, 0, 0.8352941, 1,
1.099641, -1.81067, 3.04169, 1, 0, 0.827451, 1,
1.102867, 0.159221, -0.1313929, 1, 0, 0.8235294, 1,
1.104479, -1.331464, 4.40385, 1, 0, 0.8156863, 1,
1.106657, -0.159968, 1.358109, 1, 0, 0.8117647, 1,
1.109612, -0.9758806, 3.743453, 1, 0, 0.8039216, 1,
1.120862, -0.001190023, 0.9309634, 1, 0, 0.7960784, 1,
1.122184, 0.9509454, -0.0973498, 1, 0, 0.7921569, 1,
1.124128, -0.6110338, 2.91568, 1, 0, 0.7843137, 1,
1.124771, 1.051175, 1.081591, 1, 0, 0.7803922, 1,
1.133854, 1.564038, -1.601106, 1, 0, 0.772549, 1,
1.136877, 1.790076, 1.406072, 1, 0, 0.7686275, 1,
1.13963, -0.550149, 3.972271, 1, 0, 0.7607843, 1,
1.141176, 0.04489855, 1.23984, 1, 0, 0.7568628, 1,
1.142092, 0.3264742, -0.8194606, 1, 0, 0.7490196, 1,
1.150226, 0.3851503, 0.3698802, 1, 0, 0.7450981, 1,
1.158563, 0.2544537, 0.9884968, 1, 0, 0.7372549, 1,
1.159078, 0.751092, 2.719344, 1, 0, 0.7333333, 1,
1.159258, 0.9502698, -1.662068, 1, 0, 0.7254902, 1,
1.164136, -0.1989481, 1.009052, 1, 0, 0.7215686, 1,
1.168325, 0.09481239, 1.403441, 1, 0, 0.7137255, 1,
1.17735, -1.530591, 2.654578, 1, 0, 0.7098039, 1,
1.181299, 3.11676, -0.3751241, 1, 0, 0.7019608, 1,
1.188296, 0.9824015, 1.611678, 1, 0, 0.6941177, 1,
1.202611, -0.04924955, 2.772748, 1, 0, 0.6901961, 1,
1.204445, 0.8450264, 0.7496496, 1, 0, 0.682353, 1,
1.21323, 0.4837888, 2.911901, 1, 0, 0.6784314, 1,
1.21563, 0.7693029, -0.645609, 1, 0, 0.6705883, 1,
1.217066, 1.961465, 0.9425108, 1, 0, 0.6666667, 1,
1.217365, -0.5372995, 2.791514, 1, 0, 0.6588235, 1,
1.219407, -0.54562, 0.417675, 1, 0, 0.654902, 1,
1.231336, 1.302798, 0.4233226, 1, 0, 0.6470588, 1,
1.235978, -1.167623, 1.980345, 1, 0, 0.6431373, 1,
1.245371, 2.119628, 0.7548212, 1, 0, 0.6352941, 1,
1.246024, -0.3286899, 1.940271, 1, 0, 0.6313726, 1,
1.25207, 0.5918374, 2.197469, 1, 0, 0.6235294, 1,
1.259993, -0.5789427, 4.196864, 1, 0, 0.6196079, 1,
1.271906, 0.1428692, 1.045495, 1, 0, 0.6117647, 1,
1.279372, -0.1953986, 2.640864, 1, 0, 0.6078432, 1,
1.280713, 1.27076, 1.49132, 1, 0, 0.6, 1,
1.280777, -0.3340911, 0.2887441, 1, 0, 0.5921569, 1,
1.281106, -0.5818198, 0.7462429, 1, 0, 0.5882353, 1,
1.290765, -1.088925, 0.5681225, 1, 0, 0.5803922, 1,
1.3061, 0.9247159, 3.23116, 1, 0, 0.5764706, 1,
1.306805, -0.4599345, 2.068807, 1, 0, 0.5686275, 1,
1.315996, 0.1532248, 1.406871, 1, 0, 0.5647059, 1,
1.317427, 0.8650658, 1.346237, 1, 0, 0.5568628, 1,
1.318997, 2.542155, -0.2515796, 1, 0, 0.5529412, 1,
1.32247, -0.73248, 2.946556, 1, 0, 0.5450981, 1,
1.333031, 1.290934, -0.04830789, 1, 0, 0.5411765, 1,
1.333724, -0.7378038, 1.511757, 1, 0, 0.5333334, 1,
1.337919, 0.7075816, 1.049463, 1, 0, 0.5294118, 1,
1.346738, 1.161969, 1.757322, 1, 0, 0.5215687, 1,
1.351289, 0.6156015, 0.5669954, 1, 0, 0.5176471, 1,
1.355239, -1.760534, 1.008902, 1, 0, 0.509804, 1,
1.36159, -0.995156, 0.3624636, 1, 0, 0.5058824, 1,
1.364357, -1.005448, 1.445088, 1, 0, 0.4980392, 1,
1.366877, 1.002392, 1.123092, 1, 0, 0.4901961, 1,
1.370797, -0.8014418, 1.567688, 1, 0, 0.4862745, 1,
1.379649, 0.8629501, 0.1159084, 1, 0, 0.4784314, 1,
1.383508, 0.2147722, 0.5444757, 1, 0, 0.4745098, 1,
1.387568, -0.7643998, 1.037593, 1, 0, 0.4666667, 1,
1.396341, 0.5484912, 1.58952, 1, 0, 0.4627451, 1,
1.403327, 1.000051, 0.8344585, 1, 0, 0.454902, 1,
1.40692, -0.7457401, 3.70537, 1, 0, 0.4509804, 1,
1.411594, 0.02597616, 1.070446, 1, 0, 0.4431373, 1,
1.417906, -1.564093, 1.68558, 1, 0, 0.4392157, 1,
1.427776, -0.03382089, 2.230999, 1, 0, 0.4313726, 1,
1.450276, -1.3462, 0.3646025, 1, 0, 0.427451, 1,
1.45229, 0.9861418, 1.323227, 1, 0, 0.4196078, 1,
1.460271, -1.67347, 2.697889, 1, 0, 0.4156863, 1,
1.466364, 0.5752203, 2.28203, 1, 0, 0.4078431, 1,
1.469982, 3.072306, -1.072402, 1, 0, 0.4039216, 1,
1.487074, -0.4667821, 1.932027, 1, 0, 0.3960784, 1,
1.495193, -0.2473048, 2.013065, 1, 0, 0.3882353, 1,
1.511623, 0.9351201, 1.624192, 1, 0, 0.3843137, 1,
1.521286, 1.452322, 1.191806, 1, 0, 0.3764706, 1,
1.531069, 1.066504, 0.362296, 1, 0, 0.372549, 1,
1.536652, -0.7139516, 3.69868, 1, 0, 0.3647059, 1,
1.538446, 0.7385482, 0.5379421, 1, 0, 0.3607843, 1,
1.549398, -1.654971, 2.459207, 1, 0, 0.3529412, 1,
1.555304, 0.6051789, 0.5178602, 1, 0, 0.3490196, 1,
1.573784, 0.1106129, 1.015853, 1, 0, 0.3411765, 1,
1.579445, -0.6453922, 2.148672, 1, 0, 0.3372549, 1,
1.582867, 2.556008, 1.477799, 1, 0, 0.3294118, 1,
1.597297, -0.1983422, 1.301667, 1, 0, 0.3254902, 1,
1.600791, -0.9014212, 2.760863, 1, 0, 0.3176471, 1,
1.602309, 0.3688955, 3.48243, 1, 0, 0.3137255, 1,
1.608875, 0.6042504, 1.59611, 1, 0, 0.3058824, 1,
1.612046, 0.04539594, 2.600292, 1, 0, 0.2980392, 1,
1.623082, -0.1762045, 2.086043, 1, 0, 0.2941177, 1,
1.623898, -1.039903, 2.542782, 1, 0, 0.2862745, 1,
1.640137, 0.7795824, -0.5194584, 1, 0, 0.282353, 1,
1.643457, 0.3864811, 1.520768, 1, 0, 0.2745098, 1,
1.653795, 1.074645, 1.342492, 1, 0, 0.2705882, 1,
1.679531, -0.1613673, 2.263631, 1, 0, 0.2627451, 1,
1.686177, 0.02307963, -0.01514816, 1, 0, 0.2588235, 1,
1.686373, 1.326422, 1.571773, 1, 0, 0.2509804, 1,
1.697222, 0.2262083, 0.06260804, 1, 0, 0.2470588, 1,
1.708426, 0.4811241, 3.616791, 1, 0, 0.2392157, 1,
1.709934, -1.654912, 2.797236, 1, 0, 0.2352941, 1,
1.720732, 0.6571977, 1.437967, 1, 0, 0.227451, 1,
1.722824, 0.4381657, -0.4949342, 1, 0, 0.2235294, 1,
1.727275, 1.956396, -0.4004668, 1, 0, 0.2156863, 1,
1.729477, 0.3968091, 0.6114641, 1, 0, 0.2117647, 1,
1.733623, 1.127251, -0.8851451, 1, 0, 0.2039216, 1,
1.739055, -0.112681, 1.669557, 1, 0, 0.1960784, 1,
1.746087, 0.9870812, 1.643203, 1, 0, 0.1921569, 1,
1.747337, -0.4910717, 1.386437, 1, 0, 0.1843137, 1,
1.762721, -1.008881, 1.642431, 1, 0, 0.1803922, 1,
1.783139, -1.116119, 1.041294, 1, 0, 0.172549, 1,
1.795809, 0.481313, 1.548146, 1, 0, 0.1686275, 1,
1.820742, 0.3216477, 0.2397055, 1, 0, 0.1607843, 1,
1.872527, 0.2755449, 2.064186, 1, 0, 0.1568628, 1,
1.876248, 2.049515, 1.67911, 1, 0, 0.1490196, 1,
1.92091, -1.348112, 1.71197, 1, 0, 0.145098, 1,
1.921876, 0.2787461, 1.552621, 1, 0, 0.1372549, 1,
1.92418, -0.8308468, 2.139235, 1, 0, 0.1333333, 1,
1.944588, -0.1864018, 0.8770463, 1, 0, 0.1254902, 1,
1.950426, 2.093905, 1.310914, 1, 0, 0.1215686, 1,
1.970682, 0.4235564, 1.309914, 1, 0, 0.1137255, 1,
1.986451, -0.1839248, 1.992447, 1, 0, 0.1098039, 1,
2.021041, 0.07347892, 1.527855, 1, 0, 0.1019608, 1,
2.066645, 0.4173077, 2.914498, 1, 0, 0.09411765, 1,
2.070543, 1.003567, 2.151884, 1, 0, 0.09019608, 1,
2.078938, 1.684, 1.348266, 1, 0, 0.08235294, 1,
2.083368, -0.6152941, -0.4413459, 1, 0, 0.07843138, 1,
2.083774, -0.5726577, 2.095959, 1, 0, 0.07058824, 1,
2.122975, -0.3274626, 1.909109, 1, 0, 0.06666667, 1,
2.132602, 0.5021829, 1.254905, 1, 0, 0.05882353, 1,
2.139411, 0.008992359, 2.009393, 1, 0, 0.05490196, 1,
2.188594, -1.240485, 2.829011, 1, 0, 0.04705882, 1,
2.19769, 0.008894335, 0.9469331, 1, 0, 0.04313726, 1,
2.332363, -0.7001998, 2.844894, 1, 0, 0.03529412, 1,
2.364633, -1.55627, 1.195145, 1, 0, 0.03137255, 1,
2.396271, 1.899065, 0.5619311, 1, 0, 0.02352941, 1,
2.520844, -0.04136214, 2.870217, 1, 0, 0.01960784, 1,
2.541799, 0.3554329, 1.35684, 1, 0, 0.01176471, 1,
2.959882, 0.5209227, 1.050455, 1, 0, 0.007843138, 1
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
-0.1375065, -4.917027, -7.358963, 0, -0.5, 0.5, 0.5,
-0.1375065, -4.917027, -7.358963, 1, -0.5, 0.5, 0.5,
-0.1375065, -4.917027, -7.358963, 1, 1.5, 0.5, 0.5,
-0.1375065, -4.917027, -7.358963, 0, 1.5, 0.5, 0.5
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
-4.28491, -0.2043891, -7.358963, 0, -0.5, 0.5, 0.5,
-4.28491, -0.2043891, -7.358963, 1, -0.5, 0.5, 0.5,
-4.28491, -0.2043891, -7.358963, 1, 1.5, 0.5, 0.5,
-4.28491, -0.2043891, -7.358963, 0, 1.5, 0.5, 0.5
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
-4.28491, -4.917027, -0.4684362, 0, -0.5, 0.5, 0.5,
-4.28491, -4.917027, -0.4684362, 1, -0.5, 0.5, 0.5,
-4.28491, -4.917027, -0.4684362, 1, 1.5, 0.5, 0.5,
-4.28491, -4.917027, -0.4684362, 0, 1.5, 0.5, 0.5
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
-3, -3.829495, -5.768842,
2, -3.829495, -5.768842,
-3, -3.829495, -5.768842,
-3, -4.01075, -6.033862,
-2, -3.829495, -5.768842,
-2, -4.01075, -6.033862,
-1, -3.829495, -5.768842,
-1, -4.01075, -6.033862,
0, -3.829495, -5.768842,
0, -4.01075, -6.033862,
1, -3.829495, -5.768842,
1, -4.01075, -6.033862,
2, -3.829495, -5.768842,
2, -4.01075, -6.033862
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
-3, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
-3, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
-3, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
-3, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5,
-2, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
-2, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
-2, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
-2, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5,
-1, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
-1, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
-1, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
-1, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5,
0, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
0, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
0, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
0, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5,
1, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
1, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
1, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
1, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5,
2, -4.37326, -6.563902, 0, -0.5, 0.5, 0.5,
2, -4.37326, -6.563902, 1, -0.5, 0.5, 0.5,
2, -4.37326, -6.563902, 1, 1.5, 0.5, 0.5,
2, -4.37326, -6.563902, 0, 1.5, 0.5, 0.5
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
-3.327817, -2, -5.768842,
-3.327817, 2, -5.768842,
-3.327817, -2, -5.768842,
-3.487332, -2, -6.033862,
-3.327817, 0, -5.768842,
-3.487332, 0, -6.033862,
-3.327817, 2, -5.768842,
-3.487332, 2, -6.033862
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
"0",
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
-3.806363, -2, -6.563902, 0, -0.5, 0.5, 0.5,
-3.806363, -2, -6.563902, 1, -0.5, 0.5, 0.5,
-3.806363, -2, -6.563902, 1, 1.5, 0.5, 0.5,
-3.806363, -2, -6.563902, 0, 1.5, 0.5, 0.5,
-3.806363, 0, -6.563902, 0, -0.5, 0.5, 0.5,
-3.806363, 0, -6.563902, 1, -0.5, 0.5, 0.5,
-3.806363, 0, -6.563902, 1, 1.5, 0.5, 0.5,
-3.806363, 0, -6.563902, 0, 1.5, 0.5, 0.5,
-3.806363, 2, -6.563902, 0, -0.5, 0.5, 0.5,
-3.806363, 2, -6.563902, 1, -0.5, 0.5, 0.5,
-3.806363, 2, -6.563902, 1, 1.5, 0.5, 0.5,
-3.806363, 2, -6.563902, 0, 1.5, 0.5, 0.5
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
-3.327817, -3.829495, -4,
-3.327817, -3.829495, 4,
-3.327817, -3.829495, -4,
-3.487332, -4.01075, -4,
-3.327817, -3.829495, -2,
-3.487332, -4.01075, -2,
-3.327817, -3.829495, 0,
-3.487332, -4.01075, 0,
-3.327817, -3.829495, 2,
-3.487332, -4.01075, 2,
-3.327817, -3.829495, 4,
-3.487332, -4.01075, 4
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
-3.806363, -4.37326, -4, 0, -0.5, 0.5, 0.5,
-3.806363, -4.37326, -4, 1, -0.5, 0.5, 0.5,
-3.806363, -4.37326, -4, 1, 1.5, 0.5, 0.5,
-3.806363, -4.37326, -4, 0, 1.5, 0.5, 0.5,
-3.806363, -4.37326, -2, 0, -0.5, 0.5, 0.5,
-3.806363, -4.37326, -2, 1, -0.5, 0.5, 0.5,
-3.806363, -4.37326, -2, 1, 1.5, 0.5, 0.5,
-3.806363, -4.37326, -2, 0, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 0, 0, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 0, 1, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 0, 1, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 0, 0, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 2, 0, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 2, 1, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 2, 1, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 2, 0, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 4, 0, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 4, 1, -0.5, 0.5, 0.5,
-3.806363, -4.37326, 4, 1, 1.5, 0.5, 0.5,
-3.806363, -4.37326, 4, 0, 1.5, 0.5, 0.5
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
-3.327817, -3.829495, -5.768842,
-3.327817, 3.420717, -5.768842,
-3.327817, -3.829495, 4.831969,
-3.327817, 3.420717, 4.831969,
-3.327817, -3.829495, -5.768842,
-3.327817, -3.829495, 4.831969,
-3.327817, 3.420717, -5.768842,
-3.327817, 3.420717, 4.831969,
-3.327817, -3.829495, -5.768842,
3.052804, -3.829495, -5.768842,
-3.327817, -3.829495, 4.831969,
3.052804, -3.829495, 4.831969,
-3.327817, 3.420717, -5.768842,
3.052804, 3.420717, -5.768842,
-3.327817, 3.420717, 4.831969,
3.052804, 3.420717, 4.831969,
3.052804, -3.829495, -5.768842,
3.052804, 3.420717, -5.768842,
3.052804, -3.829495, 4.831969,
3.052804, 3.420717, 4.831969,
3.052804, -3.829495, -5.768842,
3.052804, -3.829495, 4.831969,
3.052804, 3.420717, -5.768842,
3.052804, 3.420717, 4.831969
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
var radius = 7.657644;
var distance = 34.06973;
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
mvMatrix.translate( 0.1375065, 0.2043891, 0.4684362 );
mvMatrix.scale( 1.297616, 1.14198, 0.7810341 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06973);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ALLY<-read.table("ALLY.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ALLY$V2
```

```
## Error in eval(expr, envir, enclos): object 'ALLY' not found
```

```r
y<-ALLY$V3
```

```
## Error in eval(expr, envir, enclos): object 'ALLY' not found
```

```r
z<-ALLY$V4
```

```
## Error in eval(expr, envir, enclos): object 'ALLY' not found
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
-3.234895, 0.7061908, -2.050446, 0, 0, 1, 1, 1,
-3.056192, -0.00110791, -2.340946, 1, 0, 0, 1, 1,
-2.744949, -0.5244761, -2.061013, 1, 0, 0, 1, 1,
-2.641897, -1.832262, -2.612781, 1, 0, 0, 1, 1,
-2.609613, -0.5969861, -0.04360702, 1, 0, 0, 1, 1,
-2.507792, -2.729963, -3.85509, 1, 0, 0, 1, 1,
-2.419245, -0.3784618, -1.189662, 0, 0, 0, 1, 1,
-2.391897, 0.8681917, -0.8798535, 0, 0, 0, 1, 1,
-2.373884, -0.04907316, -2.494035, 0, 0, 0, 1, 1,
-2.334995, -0.4215882, -0.3793761, 0, 0, 0, 1, 1,
-2.329673, 0.9482893, 0.511972, 0, 0, 0, 1, 1,
-2.284682, 1.117408, -0.02095366, 0, 0, 0, 1, 1,
-2.277984, -1.443202, -2.811566, 0, 0, 0, 1, 1,
-2.274855, -0.6004505, -1.760461, 1, 1, 1, 1, 1,
-2.262533, -1.946856, -2.488956, 1, 1, 1, 1, 1,
-2.259503, 0.03863794, -0.5433067, 1, 1, 1, 1, 1,
-2.259295, -0.3962764, -2.839842, 1, 1, 1, 1, 1,
-2.255816, -0.3570928, -3.124181, 1, 1, 1, 1, 1,
-2.189838, -0.7939685, -1.809057, 1, 1, 1, 1, 1,
-2.167734, -0.5752648, -1.938328, 1, 1, 1, 1, 1,
-2.133065, -1.41952, -1.675506, 1, 1, 1, 1, 1,
-2.098626, -0.4488794, -2.679948, 1, 1, 1, 1, 1,
-2.09559, 0.05421432, -0.5170211, 1, 1, 1, 1, 1,
-2.087461, -0.2662828, -0.5924388, 1, 1, 1, 1, 1,
-2.053063, -0.9088368, -1.793065, 1, 1, 1, 1, 1,
-2.005922, -0.8732615, -3.366596, 1, 1, 1, 1, 1,
-1.999125, 0.8106416, -1.382509, 1, 1, 1, 1, 1,
-1.959952, -1.319975, -1.518962, 1, 1, 1, 1, 1,
-1.954557, -0.4859799, -2.968974, 0, 0, 1, 1, 1,
-1.945819, -0.5521521, -2.286855, 1, 0, 0, 1, 1,
-1.931772, -0.6584105, -2.712559, 1, 0, 0, 1, 1,
-1.907841, -0.329616, -4.103469, 1, 0, 0, 1, 1,
-1.890184, -0.5185035, -1.609615, 1, 0, 0, 1, 1,
-1.881634, -1.523105, -2.192069, 1, 0, 0, 1, 1,
-1.880003, -1.159486, -3.2546, 0, 0, 0, 1, 1,
-1.857969, 0.7747372, -3.577842, 0, 0, 0, 1, 1,
-1.844586, 1.890865, -0.4413048, 0, 0, 0, 1, 1,
-1.834451, 0.2032738, -2.2941, 0, 0, 0, 1, 1,
-1.81268, 2.023691, -2.219582, 0, 0, 0, 1, 1,
-1.785415, 0.8577613, -1.192199, 0, 0, 0, 1, 1,
-1.77179, 0.3727283, -1.620189, 0, 0, 0, 1, 1,
-1.755853, 0.1124676, -2.383837, 1, 1, 1, 1, 1,
-1.735017, 0.6027547, -0.7960712, 1, 1, 1, 1, 1,
-1.726513, -0.8389113, -1.293413, 1, 1, 1, 1, 1,
-1.717524, -0.0747611, -0.6771368, 1, 1, 1, 1, 1,
-1.704214, 0.1064923, -2.927576, 1, 1, 1, 1, 1,
-1.701207, -0.3968875, -1.938254, 1, 1, 1, 1, 1,
-1.698022, 0.5587258, -0.9066595, 1, 1, 1, 1, 1,
-1.691084, -0.3438173, -2.572324, 1, 1, 1, 1, 1,
-1.679679, -0.01808505, -1.900691, 1, 1, 1, 1, 1,
-1.675126, 0.0005086942, -1.772313, 1, 1, 1, 1, 1,
-1.664196, -0.5341524, -2.043666, 1, 1, 1, 1, 1,
-1.661756, 0.959666, -2.427261, 1, 1, 1, 1, 1,
-1.655167, 0.6903487, -0.09148176, 1, 1, 1, 1, 1,
-1.642377, -0.9292935, -1.712221, 1, 1, 1, 1, 1,
-1.62834, -0.6285768, -3.713261, 1, 1, 1, 1, 1,
-1.620234, 1.80536, -2.752365, 0, 0, 1, 1, 1,
-1.605365, 0.7084094, -0.1354867, 1, 0, 0, 1, 1,
-1.596823, 0.6461419, -0.3002388, 1, 0, 0, 1, 1,
-1.585432, -0.02767687, -1.733695, 1, 0, 0, 1, 1,
-1.584189, 0.2365981, -1.571755, 1, 0, 0, 1, 1,
-1.576246, 1.138822, 1.130985, 1, 0, 0, 1, 1,
-1.570076, -1.327618, -1.73376, 0, 0, 0, 1, 1,
-1.561901, -1.150948, -3.692238, 0, 0, 0, 1, 1,
-1.550933, -1.607688, -3.112295, 0, 0, 0, 1, 1,
-1.533659, -1.322801, -2.348233, 0, 0, 0, 1, 1,
-1.53061, -0.09551654, -1.864262, 0, 0, 0, 1, 1,
-1.512356, 0.1965191, -0.9034398, 0, 0, 0, 1, 1,
-1.497649, -0.2344991, -0.5189864, 0, 0, 0, 1, 1,
-1.494393, -0.6848265, -1.741862, 1, 1, 1, 1, 1,
-1.488085, 0.8419297, -1.62345, 1, 1, 1, 1, 1,
-1.482432, 1.508053, -0.9236028, 1, 1, 1, 1, 1,
-1.472048, 0.01988508, 0.07632467, 1, 1, 1, 1, 1,
-1.450163, 1.188417, 0.04722359, 1, 1, 1, 1, 1,
-1.447373, -0.2543498, -2.005778, 1, 1, 1, 1, 1,
-1.442932, -0.07334963, -2.460994, 1, 1, 1, 1, 1,
-1.442321, -0.08341295, -0.6348925, 1, 1, 1, 1, 1,
-1.431581, -0.5413917, -3.205487, 1, 1, 1, 1, 1,
-1.431545, 0.1399071, -0.1301281, 1, 1, 1, 1, 1,
-1.421336, 1.301324, -2.040545, 1, 1, 1, 1, 1,
-1.419364, 0.4891897, -1.523791, 1, 1, 1, 1, 1,
-1.419348, 0.2722875, -2.218665, 1, 1, 1, 1, 1,
-1.413855, -0.06534622, -2.519374, 1, 1, 1, 1, 1,
-1.405507, -1.032848, -2.900169, 1, 1, 1, 1, 1,
-1.39539, 2.34078, 0.1226648, 0, 0, 1, 1, 1,
-1.383314, -0.5080538, -3.006432, 1, 0, 0, 1, 1,
-1.369028, 2.435984, -1.193926, 1, 0, 0, 1, 1,
-1.364609, -0.3299885, -3.15174, 1, 0, 0, 1, 1,
-1.360061, -0.7163188, -2.559517, 1, 0, 0, 1, 1,
-1.359651, 0.8659372, -2.216734, 1, 0, 0, 1, 1,
-1.347859, 0.2758798, -1.415342, 0, 0, 0, 1, 1,
-1.335665, -0.4579892, -3.147506, 0, 0, 0, 1, 1,
-1.318861, -0.9038491, -1.547658, 0, 0, 0, 1, 1,
-1.312771, -1.125481, -3.95974, 0, 0, 0, 1, 1,
-1.301517, -0.3262868, -1.23368, 0, 0, 0, 1, 1,
-1.299741, 0.965244, -0.4835841, 0, 0, 0, 1, 1,
-1.292685, -0.3086184, 0.09822123, 0, 0, 0, 1, 1,
-1.290635, 1.131899, -1.394925, 1, 1, 1, 1, 1,
-1.278579, 1.474602, -1.974508, 1, 1, 1, 1, 1,
-1.276332, 1.75541, -1.005631, 1, 1, 1, 1, 1,
-1.269371, -0.8575886, -2.04317, 1, 1, 1, 1, 1,
-1.264382, -0.6018355, -2.79839, 1, 1, 1, 1, 1,
-1.258205, -0.3180015, -2.236937, 1, 1, 1, 1, 1,
-1.256823, 0.8904009, -1.478791, 1, 1, 1, 1, 1,
-1.255785, 1.217323, -0.6911976, 1, 1, 1, 1, 1,
-1.242862, -0.4464339, -1.248839, 1, 1, 1, 1, 1,
-1.23965, 0.9923252, -1.028379, 1, 1, 1, 1, 1,
-1.231699, -0.4007631, -1.827428, 1, 1, 1, 1, 1,
-1.229232, -2.945314, -2.860147, 1, 1, 1, 1, 1,
-1.225852, -0.2712732, -1.703537, 1, 1, 1, 1, 1,
-1.21948, -0.1273637, -2.141442, 1, 1, 1, 1, 1,
-1.218258, 1.67799, -1.965804, 1, 1, 1, 1, 1,
-1.212755, -1.037183, -2.767097, 0, 0, 1, 1, 1,
-1.210681, -0.6167972, -3.083411, 1, 0, 0, 1, 1,
-1.207423, -0.5772895, -1.440465, 1, 0, 0, 1, 1,
-1.205452, 0.5324847, -1.558319, 1, 0, 0, 1, 1,
-1.201799, 0.2662379, -1.877902, 1, 0, 0, 1, 1,
-1.197848, 1.392393, -0.8648276, 1, 0, 0, 1, 1,
-1.196511, -0.3889037, -1.004394, 0, 0, 0, 1, 1,
-1.194852, 0.7520185, -2.1032, 0, 0, 0, 1, 1,
-1.182176, 0.6212823, -0.7918897, 0, 0, 0, 1, 1,
-1.176171, -1.572137, -1.450322, 0, 0, 0, 1, 1,
-1.173407, 0.7211007, 0.967963, 0, 0, 0, 1, 1,
-1.172763, 0.05461923, -1.571581, 0, 0, 0, 1, 1,
-1.166483, 0.1794624, -0.3699874, 0, 0, 0, 1, 1,
-1.157599, -0.7257273, -2.513231, 1, 1, 1, 1, 1,
-1.15544, 0.5460284, -2.815114, 1, 1, 1, 1, 1,
-1.1487, 0.06153471, -1.338817, 1, 1, 1, 1, 1,
-1.147416, 1.454245, -0.3535506, 1, 1, 1, 1, 1,
-1.140261, 0.3004065, -2.396829, 1, 1, 1, 1, 1,
-1.138262, -0.1905964, -0.184208, 1, 1, 1, 1, 1,
-1.137425, -0.06413679, -2.983818, 1, 1, 1, 1, 1,
-1.134519, 0.5603817, 0.3746967, 1, 1, 1, 1, 1,
-1.130822, 0.3846652, -1.59403, 1, 1, 1, 1, 1,
-1.105216, -1.873621, -2.325131, 1, 1, 1, 1, 1,
-1.097289, -0.7834186, -2.71393, 1, 1, 1, 1, 1,
-1.088861, -0.731738, -1.902624, 1, 1, 1, 1, 1,
-1.076593, 0.2273213, -0.373602, 1, 1, 1, 1, 1,
-1.073906, -1.574636, -3.851, 1, 1, 1, 1, 1,
-1.063795, -0.8543726, -2.446059, 1, 1, 1, 1, 1,
-1.056594, -0.9291524, -2.736176, 0, 0, 1, 1, 1,
-1.053611, 0.02709471, 0.8920625, 1, 0, 0, 1, 1,
-1.050731, -0.04716871, -0.06545031, 1, 0, 0, 1, 1,
-1.047519, 0.4933872, -1.305901, 1, 0, 0, 1, 1,
-1.046454, 0.5168352, -1.22055, 1, 0, 0, 1, 1,
-1.046106, -0.3332182, -3.789755, 1, 0, 0, 1, 1,
-1.044525, 0.8589699, -2.984285, 0, 0, 0, 1, 1,
-1.03991, -1.146236, -2.817925, 0, 0, 0, 1, 1,
-1.037992, 0.7059203, -1.669811, 0, 0, 0, 1, 1,
-1.036538, 0.7586826, 0.7561259, 0, 0, 0, 1, 1,
-1.035914, 0.05455397, 0.3768457, 0, 0, 0, 1, 1,
-1.028435, 1.989333, -1.240442, 0, 0, 0, 1, 1,
-1.024293, -1.339531, -3.65014, 0, 0, 0, 1, 1,
-1.021509, 0.7284802, -1.578542, 1, 1, 1, 1, 1,
-1.01911, 1.407504, -0.6750161, 1, 1, 1, 1, 1,
-1.014847, 1.396963, -1.680861, 1, 1, 1, 1, 1,
-1.007659, 1.030934, 1.506429, 1, 1, 1, 1, 1,
-1.004124, -3.723909, -3.334842, 1, 1, 1, 1, 1,
-1.000464, -0.2847566, -1.083424, 1, 1, 1, 1, 1,
-0.9945112, 0.02169446, -1.060842, 1, 1, 1, 1, 1,
-0.990547, -0.04395374, -1.664878, 1, 1, 1, 1, 1,
-0.9888486, 0.4413611, -2.266126, 1, 1, 1, 1, 1,
-0.9878057, -1.354167, -3.05775, 1, 1, 1, 1, 1,
-0.9851376, -0.8984365, -0.5097924, 1, 1, 1, 1, 1,
-0.9843295, 1.121829, -0.1556518, 1, 1, 1, 1, 1,
-0.9823071, -0.6098076, -1.99254, 1, 1, 1, 1, 1,
-0.9713588, 1.70083, -0.8117496, 1, 1, 1, 1, 1,
-0.9566149, -0.09532206, 0.2389475, 1, 1, 1, 1, 1,
-0.9506713, -0.5009956, -0.3581328, 0, 0, 1, 1, 1,
-0.9436219, 0.4216811, -1.042578, 1, 0, 0, 1, 1,
-0.9397117, -0.3716822, -2.410843, 1, 0, 0, 1, 1,
-0.9359534, 0.03209062, 0.07810358, 1, 0, 0, 1, 1,
-0.9312066, 0.3842792, -3.21514, 1, 0, 0, 1, 1,
-0.9244406, 0.7179837, 1.237942, 1, 0, 0, 1, 1,
-0.9234329, 0.9230974, -0.7025248, 0, 0, 0, 1, 1,
-0.9226553, 0.8632847, -1.491842, 0, 0, 0, 1, 1,
-0.9204546, 0.3158067, -0.2516679, 0, 0, 0, 1, 1,
-0.9147938, 0.4459382, -1.740042, 0, 0, 0, 1, 1,
-0.9117926, 0.8965663, 0.5167425, 0, 0, 0, 1, 1,
-0.901723, 1.576274, -2.410689, 0, 0, 0, 1, 1,
-0.8995024, 0.3226034, -1.740123, 0, 0, 0, 1, 1,
-0.8955518, -0.05457021, -2.739661, 1, 1, 1, 1, 1,
-0.8953557, -0.04544001, -2.270986, 1, 1, 1, 1, 1,
-0.8892084, -0.3832626, -3.124779, 1, 1, 1, 1, 1,
-0.8890305, 0.4999081, -2.687329, 1, 1, 1, 1, 1,
-0.8889132, -0.5417082, -2.036237, 1, 1, 1, 1, 1,
-0.8850877, 1.431588, -1.667386, 1, 1, 1, 1, 1,
-0.8815219, 0.09647062, -1.411987, 1, 1, 1, 1, 1,
-0.8794904, -1.972972, -1.852899, 1, 1, 1, 1, 1,
-0.8773969, 1.224097, -0.7877544, 1, 1, 1, 1, 1,
-0.8771813, 0.4823332, -2.41837, 1, 1, 1, 1, 1,
-0.8738853, 1.266774, -0.861303, 1, 1, 1, 1, 1,
-0.8674118, 1.090105, -0.8323551, 1, 1, 1, 1, 1,
-0.8667552, -0.9033325, -2.859717, 1, 1, 1, 1, 1,
-0.8625527, 1.34605, 0.6415996, 1, 1, 1, 1, 1,
-0.8581471, 1.122525, -0.06316529, 1, 1, 1, 1, 1,
-0.8539791, -0.4812926, -2.260312, 0, 0, 1, 1, 1,
-0.8501263, -0.6245395, -4.365585, 1, 0, 0, 1, 1,
-0.8495269, -0.682216, -2.215188, 1, 0, 0, 1, 1,
-0.8453147, 1.803336, -0.1100519, 1, 0, 0, 1, 1,
-0.8441759, 0.6695525, -0.03899747, 1, 0, 0, 1, 1,
-0.8320494, -1.674999, -3.945113, 1, 0, 0, 1, 1,
-0.8291147, -0.07571301, -1.913988, 0, 0, 0, 1, 1,
-0.8282763, -2.337004, -3.736271, 0, 0, 0, 1, 1,
-0.8244032, -0.02491456, -2.185476, 0, 0, 0, 1, 1,
-0.8211682, -2.338192, -1.811736, 0, 0, 0, 1, 1,
-0.8130216, -0.01556437, -2.075357, 0, 0, 0, 1, 1,
-0.8103389, -0.3205375, -1.103709, 0, 0, 0, 1, 1,
-0.8078627, -0.0639244, -1.340094, 0, 0, 0, 1, 1,
-0.8009409, 1.213628, -0.8531774, 1, 1, 1, 1, 1,
-0.800541, -0.3441189, -0.7627746, 1, 1, 1, 1, 1,
-0.7991564, 1.375166, -2.129679, 1, 1, 1, 1, 1,
-0.7950006, -1.647245, -3.179379, 1, 1, 1, 1, 1,
-0.7913107, 1.000975, 0.5186694, 1, 1, 1, 1, 1,
-0.7893916, 0.3596727, -2.252836, 1, 1, 1, 1, 1,
-0.787464, 0.06588147, -1.66907, 1, 1, 1, 1, 1,
-0.7858709, -0.8938156, -3.002801, 1, 1, 1, 1, 1,
-0.7855703, -0.8454953, -0.7737347, 1, 1, 1, 1, 1,
-0.7852692, -0.8135669, -3.309337, 1, 1, 1, 1, 1,
-0.7805964, -0.3483608, -2.63925, 1, 1, 1, 1, 1,
-0.7791773, 1.741859, -1.024326, 1, 1, 1, 1, 1,
-0.7781668, 0.9802241, 0.0195901, 1, 1, 1, 1, 1,
-0.7772883, -0.2943947, -1.788967, 1, 1, 1, 1, 1,
-0.7753845, 0.2999608, -2.518333, 1, 1, 1, 1, 1,
-0.7736915, -0.07659567, -1.36524, 0, 0, 1, 1, 1,
-0.7722605, 0.8971455, -0.5355828, 1, 0, 0, 1, 1,
-0.7657506, 0.273516, -2.332887, 1, 0, 0, 1, 1,
-0.7598695, 0.6634879, -0.967248, 1, 0, 0, 1, 1,
-0.7591586, -0.8740702, -0.8408857, 1, 0, 0, 1, 1,
-0.7582351, -0.754601, -2.46754, 1, 0, 0, 1, 1,
-0.7548843, 0.8260628, -0.9639686, 0, 0, 0, 1, 1,
-0.7513101, -1.238887, -2.808962, 0, 0, 0, 1, 1,
-0.7451853, 0.2004394, 0.2976125, 0, 0, 0, 1, 1,
-0.7438707, 0.8914249, -1.856337, 0, 0, 0, 1, 1,
-0.7356324, 0.6326554, 0.9602781, 0, 0, 0, 1, 1,
-0.7292311, -0.1262371, -2.669984, 0, 0, 0, 1, 1,
-0.7289248, -1.223615, -1.97641, 0, 0, 0, 1, 1,
-0.727118, 1.549853, 0.006918032, 1, 1, 1, 1, 1,
-0.7257017, 0.2446529, -3.064091, 1, 1, 1, 1, 1,
-0.7184857, 1.222636, -1.398404, 1, 1, 1, 1, 1,
-0.7177032, 0.6784241, -1.396284, 1, 1, 1, 1, 1,
-0.7175896, 0.08981159, -2.62898, 1, 1, 1, 1, 1,
-0.716718, 0.4249388, -1.308096, 1, 1, 1, 1, 1,
-0.7139325, -0.1595991, -1.20836, 1, 1, 1, 1, 1,
-0.7129243, 0.349359, -1.76372, 1, 1, 1, 1, 1,
-0.7120842, 0.09743772, -1.931066, 1, 1, 1, 1, 1,
-0.7047575, -0.2716152, -1.655083, 1, 1, 1, 1, 1,
-0.7036694, 1.010885, -0.003555184, 1, 1, 1, 1, 1,
-0.7035204, 0.8866576, -1.368619, 1, 1, 1, 1, 1,
-0.6970079, -0.3661891, -1.591026, 1, 1, 1, 1, 1,
-0.6969454, 2.015939, 0.5776234, 1, 1, 1, 1, 1,
-0.6930867, -0.4188482, -3.452721, 1, 1, 1, 1, 1,
-0.6914757, 0.9717913, 0.08926342, 0, 0, 1, 1, 1,
-0.6909532, 0.8588639, 0.8662478, 1, 0, 0, 1, 1,
-0.6871197, -0.4390896, -2.972915, 1, 0, 0, 1, 1,
-0.6868005, 1.522862, -0.3135611, 1, 0, 0, 1, 1,
-0.6851402, -0.5810967, -3.634406, 1, 0, 0, 1, 1,
-0.684576, 1.821517, -0.7407584, 1, 0, 0, 1, 1,
-0.6833559, -0.04938978, -2.120322, 0, 0, 0, 1, 1,
-0.6810155, -0.6248709, -0.6921971, 0, 0, 0, 1, 1,
-0.6808189, 1.233614, 0.6676938, 0, 0, 0, 1, 1,
-0.6801267, -0.007543204, -1.990018, 0, 0, 0, 1, 1,
-0.6769051, -1.019655, -2.265376, 0, 0, 0, 1, 1,
-0.6753168, -0.3729456, -2.197131, 0, 0, 0, 1, 1,
-0.6727533, -2.341225, -2.833107, 0, 0, 0, 1, 1,
-0.6716767, -0.0945121, 0.3978789, 1, 1, 1, 1, 1,
-0.6688187, 0.1257249, -3.142359, 1, 1, 1, 1, 1,
-0.6684787, 2.433956, -2.024638, 1, 1, 1, 1, 1,
-0.6658671, 0.9046764, 0.07261042, 1, 1, 1, 1, 1,
-0.6639163, -0.1144628, -0.2278409, 1, 1, 1, 1, 1,
-0.6623606, -0.3066323, -2.404126, 1, 1, 1, 1, 1,
-0.6619883, 0.3882281, -2.406058, 1, 1, 1, 1, 1,
-0.6612481, 0.9675707, -1.026615, 1, 1, 1, 1, 1,
-0.6575504, -0.8758782, -3.56363, 1, 1, 1, 1, 1,
-0.6545972, -1.848729, -3.056451, 1, 1, 1, 1, 1,
-0.6516429, -0.621138, -2.062808, 1, 1, 1, 1, 1,
-0.6493324, 1.139974, 0.2047192, 1, 1, 1, 1, 1,
-0.6451541, 1.979177, 0.9559914, 1, 1, 1, 1, 1,
-0.642894, 2.389459, 0.4671316, 1, 1, 1, 1, 1,
-0.6361018, -1.175606, -3.575914, 1, 1, 1, 1, 1,
-0.6357342, -1.263342, -1.5954, 0, 0, 1, 1, 1,
-0.6255566, -0.05425766, -1.90749, 1, 0, 0, 1, 1,
-0.6183619, -1.913202, -3.033964, 1, 0, 0, 1, 1,
-0.6154668, -0.4189148, -2.682762, 1, 0, 0, 1, 1,
-0.6123373, -2.81283, -0.04172699, 1, 0, 0, 1, 1,
-0.6041038, 0.3359397, -0.6522541, 1, 0, 0, 1, 1,
-0.5992116, 0.7669005, -0.9220446, 0, 0, 0, 1, 1,
-0.5972775, -0.5603034, -3.704145, 0, 0, 0, 1, 1,
-0.5923315, 0.4097515, -2.437765, 0, 0, 0, 1, 1,
-0.5917738, 0.8148254, -0.3007996, 0, 0, 0, 1, 1,
-0.5916638, -1.00422, -2.163386, 0, 0, 0, 1, 1,
-0.5840198, 1.826036, -0.7830776, 0, 0, 0, 1, 1,
-0.5791048, -0.6129355, -1.102546, 0, 0, 0, 1, 1,
-0.5776887, -0.0749274, -1.637771, 1, 1, 1, 1, 1,
-0.5753684, 0.2320129, -2.704586, 1, 1, 1, 1, 1,
-0.5658675, 0.04110236, -0.3120169, 1, 1, 1, 1, 1,
-0.5593339, -0.5146217, -1.784321, 1, 1, 1, 1, 1,
-0.5576598, 0.5310693, 0.5129047, 1, 1, 1, 1, 1,
-0.5536143, -0.1744975, 0.2677632, 1, 1, 1, 1, 1,
-0.5503293, 0.2546215, -0.2400928, 1, 1, 1, 1, 1,
-0.5495268, 0.8338017, -0.3924378, 1, 1, 1, 1, 1,
-0.5472038, -0.2509175, -1.274588, 1, 1, 1, 1, 1,
-0.5465731, -0.9952575, -2.707597, 1, 1, 1, 1, 1,
-0.5432302, 1.259616, 0.6040687, 1, 1, 1, 1, 1,
-0.5421989, -1.437327, -3.219231, 1, 1, 1, 1, 1,
-0.5402141, 0.9075961, 0.9686365, 1, 1, 1, 1, 1,
-0.5342032, -0.1654672, -1.943287, 1, 1, 1, 1, 1,
-0.5310149, -0.4470864, -1.551007, 1, 1, 1, 1, 1,
-0.5299012, -0.2078817, -2.70218, 0, 0, 1, 1, 1,
-0.5206769, 1.153491, -1.010209, 1, 0, 0, 1, 1,
-0.5150912, -0.8267974, -2.363775, 1, 0, 0, 1, 1,
-0.5090441, 1.320081, -0.7521012, 1, 0, 0, 1, 1,
-0.5074137, 1.855615, -1.685477, 1, 0, 0, 1, 1,
-0.5070383, -0.5491688, -1.117821, 1, 0, 0, 1, 1,
-0.5024716, -0.07715785, -2.877196, 0, 0, 0, 1, 1,
-0.5001783, 2.167742, -0.02468703, 0, 0, 0, 1, 1,
-0.4985891, -2.096818, -4.085726, 0, 0, 0, 1, 1,
-0.4903148, -0.5738049, -3.824666, 0, 0, 0, 1, 1,
-0.4851967, 0.7366835, -2.618629, 0, 0, 0, 1, 1,
-0.4833696, 1.665887, -0.6542978, 0, 0, 0, 1, 1,
-0.472453, -0.2510623, -1.838701, 0, 0, 0, 1, 1,
-0.4683827, 0.3616171, -0.2581253, 1, 1, 1, 1, 1,
-0.4670868, 0.9132689, 0.5253165, 1, 1, 1, 1, 1,
-0.4622771, -0.323341, -2.462482, 1, 1, 1, 1, 1,
-0.460434, -0.9050007, -3.695199, 1, 1, 1, 1, 1,
-0.4585497, 1.782437, 0.9978573, 1, 1, 1, 1, 1,
-0.4445034, -1.690137, -1.247418, 1, 1, 1, 1, 1,
-0.4437645, 1.056064, -0.3485942, 1, 1, 1, 1, 1,
-0.4406299, -0.174601, -2.683839, 1, 1, 1, 1, 1,
-0.4380422, -1.333945, -4.93842, 1, 1, 1, 1, 1,
-0.4370427, 0.6851331, -1.083433, 1, 1, 1, 1, 1,
-0.4322333, 0.4826855, -0.6976876, 1, 1, 1, 1, 1,
-0.4304681, -0.3372106, -1.66413, 1, 1, 1, 1, 1,
-0.4288375, -1.143043, -3.0683, 1, 1, 1, 1, 1,
-0.4263037, -1.329882, -3.473037, 1, 1, 1, 1, 1,
-0.4262426, 2.418963, 0.7294672, 1, 1, 1, 1, 1,
-0.4259581, 0.1271513, -0.8154714, 0, 0, 1, 1, 1,
-0.420889, -0.8438031, -1.976478, 1, 0, 0, 1, 1,
-0.4167496, 0.5525275, -0.4426834, 1, 0, 0, 1, 1,
-0.4158455, 1.468205, 1.078578, 1, 0, 0, 1, 1,
-0.4156902, -1.823457, -3.991906, 1, 0, 0, 1, 1,
-0.4122102, -0.009130571, -0.6722476, 1, 0, 0, 1, 1,
-0.4116011, -0.5909929, -3.373776, 0, 0, 0, 1, 1,
-0.4099122, -0.5946518, -3.165047, 0, 0, 0, 1, 1,
-0.4065773, 0.1812181, -0.7318861, 0, 0, 0, 1, 1,
-0.4042698, 0.7084244, -1.840804, 0, 0, 0, 1, 1,
-0.4034959, 0.759813, -3.36817, 0, 0, 0, 1, 1,
-0.402812, -1.330081, -1.987323, 0, 0, 0, 1, 1,
-0.401317, -1.279416, -2.73373, 0, 0, 0, 1, 1,
-0.3948902, -0.03189119, -2.500402, 1, 1, 1, 1, 1,
-0.39247, -0.7262473, -1.941613, 1, 1, 1, 1, 1,
-0.3915381, 0.6528252, -1.671342, 1, 1, 1, 1, 1,
-0.3863816, -0.6944627, -3.146452, 1, 1, 1, 1, 1,
-0.3859482, -0.04586942, -0.8368757, 1, 1, 1, 1, 1,
-0.3840834, 0.8749998, 0.5800361, 1, 1, 1, 1, 1,
-0.3694436, -1.720463, -4.052253, 1, 1, 1, 1, 1,
-0.3671502, 1.796064, -0.5594278, 1, 1, 1, 1, 1,
-0.365602, -2.074349, -3.969332, 1, 1, 1, 1, 1,
-0.3632551, -2.226874, -4.055968, 1, 1, 1, 1, 1,
-0.3592467, 2.056257, -0.2549819, 1, 1, 1, 1, 1,
-0.3525669, -1.798949, -3.181568, 1, 1, 1, 1, 1,
-0.3522238, -1.165647, -2.743829, 1, 1, 1, 1, 1,
-0.3520486, -0.3428743, -2.053928, 1, 1, 1, 1, 1,
-0.3491957, -0.346071, -0.9117234, 1, 1, 1, 1, 1,
-0.3482369, 0.5133765, -0.3964159, 0, 0, 1, 1, 1,
-0.3447053, 0.2136545, -0.129703, 1, 0, 0, 1, 1,
-0.3437714, -0.8716097, -2.5691, 1, 0, 0, 1, 1,
-0.3432806, -0.04282759, -1.641316, 1, 0, 0, 1, 1,
-0.3425013, 0.4752713, 0.4726799, 1, 0, 0, 1, 1,
-0.34207, -0.8961763, -1.554076, 1, 0, 0, 1, 1,
-0.3390999, 0.527947, -1.354574, 0, 0, 0, 1, 1,
-0.3368814, -1.295989, -2.716127, 0, 0, 0, 1, 1,
-0.3354995, -0.2478224, -3.72044, 0, 0, 0, 1, 1,
-0.3262125, -1.940434, -3.822583, 0, 0, 0, 1, 1,
-0.3236917, -0.5678319, -2.938914, 0, 0, 0, 1, 1,
-0.322799, -1.176231, -2.445738, 0, 0, 0, 1, 1,
-0.3220683, -1.261786, -2.923288, 0, 0, 0, 1, 1,
-0.3213618, -1.028356, -3.424491, 1, 1, 1, 1, 1,
-0.3187589, -0.9108373, -2.352169, 1, 1, 1, 1, 1,
-0.3177258, 0.1352598, -1.864058, 1, 1, 1, 1, 1,
-0.3167636, -0.1105669, -1.262722, 1, 1, 1, 1, 1,
-0.3155862, 0.2500093, -0.4335029, 1, 1, 1, 1, 1,
-0.3146553, 2.536847, 0.3963556, 1, 1, 1, 1, 1,
-0.3138842, -0.4392614, -2.804623, 1, 1, 1, 1, 1,
-0.3127744, 0.5118093, 0.4053506, 1, 1, 1, 1, 1,
-0.3100164, -0.01961769, -1.299397, 1, 1, 1, 1, 1,
-0.3068683, -0.2520068, -3.654832, 1, 1, 1, 1, 1,
-0.3066073, 1.801888, -0.7964911, 1, 1, 1, 1, 1,
-0.3060606, 0.5388234, 0.3797041, 1, 1, 1, 1, 1,
-0.3060033, 0.8807611, 0.0210365, 1, 1, 1, 1, 1,
-0.3038281, -1.59276, -2.660269, 1, 1, 1, 1, 1,
-0.3031493, 0.3703942, -1.066213, 1, 1, 1, 1, 1,
-0.301802, 0.8625581, -0.9283661, 0, 0, 1, 1, 1,
-0.3017676, 0.6229011, -0.1185708, 1, 0, 0, 1, 1,
-0.3002088, -0.9614821, -3.186966, 1, 0, 0, 1, 1,
-0.2998463, -0.2154286, -2.556288, 1, 0, 0, 1, 1,
-0.2996163, 0.6917917, -1.79869, 1, 0, 0, 1, 1,
-0.2991938, -0.596779, -2.443163, 1, 0, 0, 1, 1,
-0.2936979, -0.3649798, -2.493164, 0, 0, 0, 1, 1,
-0.2922307, 0.8831059, -2.503265, 0, 0, 0, 1, 1,
-0.2882948, 1.452311, -0.3654193, 0, 0, 0, 1, 1,
-0.2868364, -1.48188, -4.25782, 0, 0, 0, 1, 1,
-0.2841935, 1.339959, 0.3469454, 0, 0, 0, 1, 1,
-0.2830851, -0.9217705, -4.036344, 0, 0, 0, 1, 1,
-0.2811593, 0.505084, -0.6590064, 0, 0, 0, 1, 1,
-0.2763935, 0.8849734, 1.152122, 1, 1, 1, 1, 1,
-0.2721805, -0.474889, -2.32631, 1, 1, 1, 1, 1,
-0.267215, -0.1543757, -0.6975703, 1, 1, 1, 1, 1,
-0.2624303, -0.2857018, -3.066965, 1, 1, 1, 1, 1,
-0.2584076, -0.2374804, -1.618879, 1, 1, 1, 1, 1,
-0.2577843, -1.4203, -4.718535, 1, 1, 1, 1, 1,
-0.2571535, -0.8646252, -3.361873, 1, 1, 1, 1, 1,
-0.2568215, -1.384436, -0.1648191, 1, 1, 1, 1, 1,
-0.2448747, -0.9984928, -1.28906, 1, 1, 1, 1, 1,
-0.2448705, 0.1451535, -0.6616397, 1, 1, 1, 1, 1,
-0.2394479, 0.6428791, -0.3615182, 1, 1, 1, 1, 1,
-0.2367969, 0.329293, 0.1587993, 1, 1, 1, 1, 1,
-0.2320822, 0.04087871, -3.479833, 1, 1, 1, 1, 1,
-0.2308524, 1.435093, -1.167355, 1, 1, 1, 1, 1,
-0.2264886, -0.2872084, -2.725642, 1, 1, 1, 1, 1,
-0.2220974, 0.6782383, 0.04407636, 0, 0, 1, 1, 1,
-0.2214202, -0.6202155, -1.290349, 1, 0, 0, 1, 1,
-0.2197347, 2.104183, -2.136001, 1, 0, 0, 1, 1,
-0.2173191, 0.9665351, -0.06586137, 1, 0, 0, 1, 1,
-0.2158714, -2.290965, -3.581559, 1, 0, 0, 1, 1,
-0.2107338, 0.3929195, 0.3223294, 1, 0, 0, 1, 1,
-0.2091468, 0.6907173, -0.8553337, 0, 0, 0, 1, 1,
-0.2054241, -1.019802, -3.353443, 0, 0, 0, 1, 1,
-0.2053831, 0.4333738, 0.0246037, 0, 0, 0, 1, 1,
-0.202681, -0.03233868, 0.6543389, 0, 0, 0, 1, 1,
-0.2022371, 0.1630522, 0.08009759, 0, 0, 0, 1, 1,
-0.200818, 0.2643026, -0.01371411, 0, 0, 0, 1, 1,
-0.1988986, 2.259808, -1.662758, 0, 0, 0, 1, 1,
-0.1986991, 1.216103, 0.4696313, 1, 1, 1, 1, 1,
-0.1984043, 0.8995704, 0.8286155, 1, 1, 1, 1, 1,
-0.1952429, -0.01247646, -2.784348, 1, 1, 1, 1, 1,
-0.1940952, -0.161741, -1.774941, 1, 1, 1, 1, 1,
-0.193355, 1.269296, 0.7748923, 1, 1, 1, 1, 1,
-0.1847072, 0.6041004, -0.8684013, 1, 1, 1, 1, 1,
-0.1832999, -0.4459472, -2.654974, 1, 1, 1, 1, 1,
-0.1797681, -0.06360204, -1.539878, 1, 1, 1, 1, 1,
-0.1761855, 0.1228562, -1.625326, 1, 1, 1, 1, 1,
-0.1758308, -1.198028, -3.272963, 1, 1, 1, 1, 1,
-0.1684164, -0.2311689, -0.7791185, 1, 1, 1, 1, 1,
-0.1652065, 1.091022, 1.826635, 1, 1, 1, 1, 1,
-0.157806, -1.112263, -3.618605, 1, 1, 1, 1, 1,
-0.1577053, -1.945547, -1.876985, 1, 1, 1, 1, 1,
-0.1541194, -1.437547, -5.614461, 1, 1, 1, 1, 1,
-0.1467283, -0.03440088, -2.619243, 0, 0, 1, 1, 1,
-0.1444909, -0.5865021, -3.48024, 1, 0, 0, 1, 1,
-0.1427979, -1.179657, -1.683743, 1, 0, 0, 1, 1,
-0.1413872, 1.366096, -0.6990049, 1, 0, 0, 1, 1,
-0.1413287, -0.008097298, -1.937376, 1, 0, 0, 1, 1,
-0.141005, -2.093578, -2.435579, 1, 0, 0, 1, 1,
-0.139438, 0.4048173, -0.4432561, 0, 0, 0, 1, 1,
-0.1317271, -0.06254628, -2.215847, 0, 0, 0, 1, 1,
-0.1262754, 1.523314, -0.2786747, 0, 0, 0, 1, 1,
-0.1254635, -0.6232439, -1.727613, 0, 0, 0, 1, 1,
-0.1254438, 0.5466347, -0.278324, 0, 0, 0, 1, 1,
-0.1253972, 0.4902086, -1.229851, 0, 0, 0, 1, 1,
-0.1180981, 0.891974, -0.6193335, 0, 0, 0, 1, 1,
-0.117711, -0.4896189, -3.305554, 1, 1, 1, 1, 1,
-0.1160761, 1.570747, -2.407774, 1, 1, 1, 1, 1,
-0.1106264, -0.7420614, -2.587339, 1, 1, 1, 1, 1,
-0.1103657, 1.618177, -0.6716862, 1, 1, 1, 1, 1,
-0.1103617, 1.385636, -0.9576407, 1, 1, 1, 1, 1,
-0.1094053, 0.8887457, -1.143859, 1, 1, 1, 1, 1,
-0.1068622, 1.085934, -0.8684959, 1, 1, 1, 1, 1,
-0.1037077, -0.4036774, -4.906646, 1, 1, 1, 1, 1,
-0.1013857, 0.8131682, -1.757466, 1, 1, 1, 1, 1,
-0.09679076, -0.4284976, -3.457998, 1, 1, 1, 1, 1,
-0.08666523, 0.9666063, -1.678165, 1, 1, 1, 1, 1,
-0.08588785, -0.9149888, -3.407542, 1, 1, 1, 1, 1,
-0.08560305, 0.2560166, -0.7479987, 1, 1, 1, 1, 1,
-0.08530555, -0.7983071, -2.804149, 1, 1, 1, 1, 1,
-0.08400489, 1.131718, -0.9989799, 1, 1, 1, 1, 1,
-0.08100618, 0.1278971, -2.152389, 0, 0, 1, 1, 1,
-0.07882293, 0.02262966, -2.901302, 1, 0, 0, 1, 1,
-0.07406727, -0.4716751, -2.523755, 1, 0, 0, 1, 1,
-0.06929924, 1.353054, -0.4663886, 1, 0, 0, 1, 1,
-0.06354757, 0.5948673, 1.313393, 1, 0, 0, 1, 1,
-0.06066823, 1.643752, 0.6316481, 1, 0, 0, 1, 1,
-0.05826177, 0.5919313, -0.1766477, 0, 0, 0, 1, 1,
-0.05642824, -1.420542, -1.945506, 0, 0, 0, 1, 1,
-0.05600999, 0.9319425, -0.4893455, 0, 0, 0, 1, 1,
-0.05454987, -0.1481665, -2.873336, 0, 0, 0, 1, 1,
-0.05361578, 0.3138823, 0.2186828, 0, 0, 0, 1, 1,
-0.05305016, -1.018343, -3.902732, 0, 0, 0, 1, 1,
-0.05295087, 0.02468894, -1.534739, 0, 0, 0, 1, 1,
-0.05263163, -1.333184, -3.691785, 1, 1, 1, 1, 1,
-0.05119313, 0.1393428, -0.8660726, 1, 1, 1, 1, 1,
-0.05094333, 1.308131, -0.5471259, 1, 1, 1, 1, 1,
-0.04698768, 1.217213, 0.8704686, 1, 1, 1, 1, 1,
-0.04522288, 0.7343127, -2.214446, 1, 1, 1, 1, 1,
-0.03831998, 0.3245538, 0.7464942, 1, 1, 1, 1, 1,
-0.03760491, 0.1556278, -0.4230193, 1, 1, 1, 1, 1,
-0.03099578, 0.6188689, -0.3582737, 1, 1, 1, 1, 1,
-0.03012772, -1.827927, -3.334747, 1, 1, 1, 1, 1,
-0.02934813, -0.2212691, -3.854399, 1, 1, 1, 1, 1,
-0.02868013, -1.534857, -4.331334, 1, 1, 1, 1, 1,
-0.02857222, -0.7153763, -2.960579, 1, 1, 1, 1, 1,
-0.02752729, 0.2685914, 2.491828, 1, 1, 1, 1, 1,
-0.02647988, -0.3102621, -2.43033, 1, 1, 1, 1, 1,
-0.02572214, 0.752807, -0.8869226, 1, 1, 1, 1, 1,
-0.02429372, 0.8004033, 1.850795, 0, 0, 1, 1, 1,
-0.02327136, -0.008007905, -0.6369448, 1, 0, 0, 1, 1,
-0.02243615, 0.246169, -1.191028, 1, 0, 0, 1, 1,
-0.02239677, 0.2884648, -0.333766, 1, 0, 0, 1, 1,
-0.02100161, -0.4841878, -2.930501, 1, 0, 0, 1, 1,
-0.02000467, 0.1111024, 0.2921746, 1, 0, 0, 1, 1,
-0.009904856, 0.2611061, 0.7534877, 0, 0, 0, 1, 1,
-0.007713644, -0.4929519, -2.715728, 0, 0, 0, 1, 1,
-0.004828476, 0.5884139, 0.5418815, 0, 0, 0, 1, 1,
-0.0007022735, 0.5005391, -0.9310086, 0, 0, 0, 1, 1,
0.0008578774, -1.394785, 1.499457, 0, 0, 0, 1, 1,
0.00355396, -0.1906191, 3.03468, 0, 0, 0, 1, 1,
0.006777924, -1.317499, 2.120283, 0, 0, 0, 1, 1,
0.01197746, 0.06085252, 0.6264342, 1, 1, 1, 1, 1,
0.0123986, 0.8569409, 0.01849344, 1, 1, 1, 1, 1,
0.01348718, -0.7968232, 4.007174, 1, 1, 1, 1, 1,
0.01351545, -0.7279384, 1.444404, 1, 1, 1, 1, 1,
0.01942486, -0.5814761, 3.362573, 1, 1, 1, 1, 1,
0.02154896, -0.4634145, 3.672036, 1, 1, 1, 1, 1,
0.02264258, 0.05795207, 1.552906, 1, 1, 1, 1, 1,
0.02421637, -0.1397783, 2.614719, 1, 1, 1, 1, 1,
0.02536791, -0.5203974, 1.640603, 1, 1, 1, 1, 1,
0.02669358, -0.5117871, 3.02567, 1, 1, 1, 1, 1,
0.02705797, -0.7903637, 2.554563, 1, 1, 1, 1, 1,
0.02824818, -1.446846, 2.246323, 1, 1, 1, 1, 1,
0.03260954, 0.6304296, -0.4153755, 1, 1, 1, 1, 1,
0.03448334, -0.454805, 2.830988, 1, 1, 1, 1, 1,
0.03955543, 1.0813, 0.4438985, 1, 1, 1, 1, 1,
0.04786354, -1.281015, 4.027512, 0, 0, 1, 1, 1,
0.04828541, -0.7631446, 3.349304, 1, 0, 0, 1, 1,
0.04943169, -0.4041985, 3.264194, 1, 0, 0, 1, 1,
0.05181615, -0.4213175, 3.838683, 1, 0, 0, 1, 1,
0.05490026, 0.02175055, 0.3727895, 1, 0, 0, 1, 1,
0.0571507, 0.4479277, 2.187979, 1, 0, 0, 1, 1,
0.05778581, -0.6315641, 2.807117, 0, 0, 0, 1, 1,
0.06293091, -0.2491905, 2.487313, 0, 0, 0, 1, 1,
0.0636633, 1.447659, -0.5630558, 0, 0, 0, 1, 1,
0.06898858, 0.9066727, -1.140824, 0, 0, 0, 1, 1,
0.07118366, -0.944441, 2.656242, 0, 0, 0, 1, 1,
0.07443815, 0.2559539, 1.03371, 0, 0, 0, 1, 1,
0.081968, -1.293384, 4.530084, 0, 0, 0, 1, 1,
0.08291268, -0.721852, 2.389923, 1, 1, 1, 1, 1,
0.08334241, 0.3693961, 0.115502, 1, 1, 1, 1, 1,
0.0850758, 1.139047, 0.5565878, 1, 1, 1, 1, 1,
0.08843587, 0.04194999, 3.1871, 1, 1, 1, 1, 1,
0.09692341, 0.06320806, 1.054209, 1, 1, 1, 1, 1,
0.09759079, -0.04968974, 1.691821, 1, 1, 1, 1, 1,
0.09993521, -0.08589542, 2.341987, 1, 1, 1, 1, 1,
0.09996288, -1.583993, 3.738503, 1, 1, 1, 1, 1,
0.1019294, -1.119208, 2.505138, 1, 1, 1, 1, 1,
0.1027174, -0.4707612, 1.554509, 1, 1, 1, 1, 1,
0.1122046, -1.842603, 4.07782, 1, 1, 1, 1, 1,
0.1159775, -0.0962192, 2.384137, 1, 1, 1, 1, 1,
0.1177477, 1.910867, 0.5589063, 1, 1, 1, 1, 1,
0.1190216, 0.1799701, 1.630759, 1, 1, 1, 1, 1,
0.1203235, -0.6228009, 1.618247, 1, 1, 1, 1, 1,
0.1232519, 0.2743104, 0.4360046, 0, 0, 1, 1, 1,
0.1243382, 0.6104521, 1.438142, 1, 0, 0, 1, 1,
0.1324719, -1.932212, 2.665167, 1, 0, 0, 1, 1,
0.1330072, 0.5152511, 1.232973, 1, 0, 0, 1, 1,
0.1350757, -0.3433998, 1.836322, 1, 0, 0, 1, 1,
0.1367894, 0.7686664, -1.335548, 1, 0, 0, 1, 1,
0.1383806, 1.495874, 0.4367389, 0, 0, 0, 1, 1,
0.1489469, 0.2610942, 0.675953, 0, 0, 0, 1, 1,
0.1496045, 0.3127775, 1.22664, 0, 0, 0, 1, 1,
0.1539824, -0.9192873, 2.012076, 0, 0, 0, 1, 1,
0.1569231, 3.315131, -1.039705, 0, 0, 0, 1, 1,
0.1606118, -0.05560966, 0.3496819, 0, 0, 0, 1, 1,
0.1634385, -1.362074, 2.56627, 0, 0, 0, 1, 1,
0.1635748, 0.4131259, 1.767255, 1, 1, 1, 1, 1,
0.164171, -2.59103, 3.204775, 1, 1, 1, 1, 1,
0.1650605, -0.3136234, 1.828224, 1, 1, 1, 1, 1,
0.1663537, 0.2175075, 0.6318639, 1, 1, 1, 1, 1,
0.1669744, -0.4811366, 2.745562, 1, 1, 1, 1, 1,
0.1685181, 0.5425748, -0.02547613, 1, 1, 1, 1, 1,
0.1743012, -1.17448, 2.151496, 1, 1, 1, 1, 1,
0.1753808, 0.1590974, 2.287125, 1, 1, 1, 1, 1,
0.1759896, 0.7225344, 1.213197, 1, 1, 1, 1, 1,
0.1771812, -0.109921, 1.73653, 1, 1, 1, 1, 1,
0.1796723, -0.4271403, 2.020604, 1, 1, 1, 1, 1,
0.1800517, -1.199417, 2.464521, 1, 1, 1, 1, 1,
0.1840317, 1.311909, -1.312229, 1, 1, 1, 1, 1,
0.1859863, 0.2698646, 1.757444, 1, 1, 1, 1, 1,
0.1870982, 1.080202, -0.9672819, 1, 1, 1, 1, 1,
0.1897845, 0.1064644, 2.319225, 0, 0, 1, 1, 1,
0.1942951, 1.009599, -0.3250729, 1, 0, 0, 1, 1,
0.1947117, -0.9245085, 3.977363, 1, 0, 0, 1, 1,
0.1972316, -0.9784359, 2.689539, 1, 0, 0, 1, 1,
0.1976216, -1.581288, 3.633594, 1, 0, 0, 1, 1,
0.1994236, -0.3541398, 2.630553, 1, 0, 0, 1, 1,
0.2090609, -0.2159739, 1.933359, 0, 0, 0, 1, 1,
0.2098256, -1.664582, 3.424267, 0, 0, 0, 1, 1,
0.2111292, -0.919852, 4.1376, 0, 0, 0, 1, 1,
0.2116856, 0.3084319, 0.3710093, 0, 0, 0, 1, 1,
0.2133217, 1.665198, 0.1664344, 0, 0, 0, 1, 1,
0.213531, -0.07873999, 1.709259, 0, 0, 0, 1, 1,
0.235576, 0.9929208, -0.9950426, 0, 0, 0, 1, 1,
0.2383832, -0.703899, 1.895382, 1, 1, 1, 1, 1,
0.2385298, -0.552249, 3.228404, 1, 1, 1, 1, 1,
0.2470081, 1.326051, 0.1202901, 1, 1, 1, 1, 1,
0.2473036, -0.6117699, 3.272061, 1, 1, 1, 1, 1,
0.2514624, -0.9370831, 2.898689, 1, 1, 1, 1, 1,
0.2520082, -1.575322, 1.797393, 1, 1, 1, 1, 1,
0.2527461, -0.494999, 2.850175, 1, 1, 1, 1, 1,
0.2536713, -0.5775099, 3.287517, 1, 1, 1, 1, 1,
0.2544823, -0.1056383, 1.411154, 1, 1, 1, 1, 1,
0.255845, 0.7828089, -0.8086557, 1, 1, 1, 1, 1,
0.2594313, 1.132376, 0.175242, 1, 1, 1, 1, 1,
0.2637359, -0.2074024, 2.813719, 1, 1, 1, 1, 1,
0.2641989, -1.185458, 4.034042, 1, 1, 1, 1, 1,
0.2650733, -1.241341, 3.299167, 1, 1, 1, 1, 1,
0.2673554, 0.9282807, 0.6766575, 1, 1, 1, 1, 1,
0.2675349, 0.9335783, 0.1752818, 0, 0, 1, 1, 1,
0.2722848, 2.084517, 0.5276728, 1, 0, 0, 1, 1,
0.280958, 1.076177, -1.41144, 1, 0, 0, 1, 1,
0.2857121, 0.4133955, 1.950976, 1, 0, 0, 1, 1,
0.292503, 0.1688662, 0.7363419, 1, 0, 0, 1, 1,
0.2928309, -2.368658, 2.751284, 1, 0, 0, 1, 1,
0.2929852, 0.4482571, 2.077315, 0, 0, 0, 1, 1,
0.2975016, 1.293076, -0.01089475, 0, 0, 0, 1, 1,
0.2984767, 0.9095778, -0.5485315, 0, 0, 0, 1, 1,
0.3040206, -0.3650499, 3.077098, 0, 0, 0, 1, 1,
0.3066859, -1.444902, 4.583544, 0, 0, 0, 1, 1,
0.3145057, 0.7547003, -0.04192591, 0, 0, 0, 1, 1,
0.3152686, -0.8786681, 4.353265, 0, 0, 0, 1, 1,
0.3159492, 1.511964, 0.7341599, 1, 1, 1, 1, 1,
0.3200736, -0.2504098, 1.855051, 1, 1, 1, 1, 1,
0.3212482, -0.07779276, 2.91038, 1, 1, 1, 1, 1,
0.321502, 1.251126, -0.843776, 1, 1, 1, 1, 1,
0.323689, -1.017821, 1.677922, 1, 1, 1, 1, 1,
0.326122, 0.7779996, 0.7532755, 1, 1, 1, 1, 1,
0.339348, -0.2612208, 1.683625, 1, 1, 1, 1, 1,
0.3402362, 1.111663, 0.6943033, 1, 1, 1, 1, 1,
0.3433781, -0.3201755, 2.793857, 1, 1, 1, 1, 1,
0.344658, 0.6562909, 0.296626, 1, 1, 1, 1, 1,
0.3466752, 0.3799399, -0.5402381, 1, 1, 1, 1, 1,
0.3497609, 1.156218, -1.34436, 1, 1, 1, 1, 1,
0.3534341, -0.5735772, 4.424896, 1, 1, 1, 1, 1,
0.3588724, -0.6117204, 4.400421, 1, 1, 1, 1, 1,
0.3600348, 0.5548053, 1.65102, 1, 1, 1, 1, 1,
0.3611954, -0.1066224, 1.71233, 0, 0, 1, 1, 1,
0.3650084, -0.649278, 2.063378, 1, 0, 0, 1, 1,
0.3659927, -0.1040801, 3.182114, 1, 0, 0, 1, 1,
0.3690401, -0.594166, 1.976293, 1, 0, 0, 1, 1,
0.3704351, 3.197634, -0.6122814, 1, 0, 0, 1, 1,
0.3776805, 0.6334083, 2.762595, 1, 0, 0, 1, 1,
0.3821745, -0.5046508, 1.89309, 0, 0, 0, 1, 1,
0.3866473, -0.6906061, 2.540764, 0, 0, 0, 1, 1,
0.3910438, -0.1680374, 3.55776, 0, 0, 0, 1, 1,
0.3924813, 0.5137312, 1.411174, 0, 0, 0, 1, 1,
0.4017394, 0.3850733, 0.3785268, 0, 0, 0, 1, 1,
0.4142817, 0.8626071, -0.07710166, 0, 0, 0, 1, 1,
0.4156234, 0.4166722, 0.476565, 0, 0, 0, 1, 1,
0.4165191, -1.415777, 3.186579, 1, 1, 1, 1, 1,
0.4172213, -0.1143841, 3.120749, 1, 1, 1, 1, 1,
0.419413, 0.04236703, -0.5344926, 1, 1, 1, 1, 1,
0.4201198, -1.168651, 3.889614, 1, 1, 1, 1, 1,
0.4234148, 0.6887725, 0.3507074, 1, 1, 1, 1, 1,
0.4239643, -0.01037571, 0.09533242, 1, 1, 1, 1, 1,
0.4281088, 0.2520565, 0.4682467, 1, 1, 1, 1, 1,
0.4315534, -0.4357418, 2.251417, 1, 1, 1, 1, 1,
0.4338935, 1.32053, 0.8216666, 1, 1, 1, 1, 1,
0.434709, -1.473735, 1.119122, 1, 1, 1, 1, 1,
0.4365498, -0.6419193, 1.988187, 1, 1, 1, 1, 1,
0.4393536, 1.989606, -1.665062, 1, 1, 1, 1, 1,
0.4408495, -0.7949606, 2.834362, 1, 1, 1, 1, 1,
0.443451, 0.5910522, 2.594478, 1, 1, 1, 1, 1,
0.4442933, 1.0524, 0.280299, 1, 1, 1, 1, 1,
0.4465042, 1.81438, 1.80018, 0, 0, 1, 1, 1,
0.450077, -0.1105714, 1.400196, 1, 0, 0, 1, 1,
0.4613306, 1.182199, 1.109297, 1, 0, 0, 1, 1,
0.4648878, -0.5988341, 4.387254, 1, 0, 0, 1, 1,
0.4694993, 1.540592, 0.2127277, 1, 0, 0, 1, 1,
0.4705578, 0.1795383, 1.504486, 1, 0, 0, 1, 1,
0.4709651, 0.07017679, 1.460096, 0, 0, 0, 1, 1,
0.4712309, -1.209867, 4.549472, 0, 0, 0, 1, 1,
0.4724356, 0.4903978, 0.8029928, 0, 0, 0, 1, 1,
0.4725846, -0.2105563, 2.333208, 0, 0, 0, 1, 1,
0.4761373, 0.1780032, 3.492125, 0, 0, 0, 1, 1,
0.4784177, -0.4108734, 2.679601, 0, 0, 0, 1, 1,
0.4799069, -0.2291981, 1.98231, 0, 0, 0, 1, 1,
0.4810956, -1.419604, 1.783242, 1, 1, 1, 1, 1,
0.4911458, 0.2072045, 2.028647, 1, 1, 1, 1, 1,
0.492422, -2.225216, 2.52938, 1, 1, 1, 1, 1,
0.4958762, 0.261735, 0.2510248, 1, 1, 1, 1, 1,
0.4989717, -0.07018487, 1.590036, 1, 1, 1, 1, 1,
0.5009092, 1.336123, -1.092583, 1, 1, 1, 1, 1,
0.5027102, -0.01154235, 2.905884, 1, 1, 1, 1, 1,
0.5052775, 0.1910771, 1.259359, 1, 1, 1, 1, 1,
0.5068296, 0.2791291, 0.9032685, 1, 1, 1, 1, 1,
0.5075451, 1.636472, -1.261399, 1, 1, 1, 1, 1,
0.5078839, 1.308418, 1.354685, 1, 1, 1, 1, 1,
0.5107352, 0.3478029, -0.1107478, 1, 1, 1, 1, 1,
0.513512, -0.343884, 1.492714, 1, 1, 1, 1, 1,
0.5186577, -1.725862, 3.929681, 1, 1, 1, 1, 1,
0.521798, 0.4822872, 1.22273, 1, 1, 1, 1, 1,
0.5291198, 0.7519484, 0.3043846, 0, 0, 1, 1, 1,
0.5341492, 0.5864786, 0.5270519, 1, 0, 0, 1, 1,
0.534187, -0.7522843, 3.255243, 1, 0, 0, 1, 1,
0.5420302, -1.575352, 0.9205303, 1, 0, 0, 1, 1,
0.5436323, -0.238262, 1.754501, 1, 0, 0, 1, 1,
0.5459788, 0.453438, 1.389498, 1, 0, 0, 1, 1,
0.5483, -0.7354377, 1.722605, 0, 0, 0, 1, 1,
0.5503055, 0.3835787, 1.254017, 0, 0, 0, 1, 1,
0.5522977, 1.038853, 0.249102, 0, 0, 0, 1, 1,
0.5558296, -0.662388, 1.86525, 0, 0, 0, 1, 1,
0.5570766, 0.7406183, 0.8616256, 0, 0, 0, 1, 1,
0.5573725, 0.496567, 2.295565, 0, 0, 0, 1, 1,
0.5586553, -0.6424875, 2.343011, 0, 0, 0, 1, 1,
0.5632129, -0.2117054, 1.724946, 1, 1, 1, 1, 1,
0.5668575, -0.4898839, 2.9756, 1, 1, 1, 1, 1,
0.5692662, -0.4778485, 1.002358, 1, 1, 1, 1, 1,
0.5698345, 0.6082542, 0.4530682, 1, 1, 1, 1, 1,
0.5714341, 0.4145054, 1.542834, 1, 1, 1, 1, 1,
0.5732013, -0.5627496, 2.16753, 1, 1, 1, 1, 1,
0.5750426, 0.01900376, 1.302804, 1, 1, 1, 1, 1,
0.5829048, 0.7136679, 0.09439357, 1, 1, 1, 1, 1,
0.5866431, -0.2444787, 2.482109, 1, 1, 1, 1, 1,
0.5868931, -1.802911, 3.221248, 1, 1, 1, 1, 1,
0.6013678, -0.4608886, 2.388637, 1, 1, 1, 1, 1,
0.6086345, -0.3574336, 2.911846, 1, 1, 1, 1, 1,
0.6149209, 1.120583, -0.8594416, 1, 1, 1, 1, 1,
0.6162962, -0.2025767, 2.290752, 1, 1, 1, 1, 1,
0.6176228, 1.372708, 1.434352, 1, 1, 1, 1, 1,
0.6184444, -0.819519, 2.241712, 0, 0, 1, 1, 1,
0.6204884, -2.338378, 2.067488, 1, 0, 0, 1, 1,
0.620666, -0.630955, 2.622782, 1, 0, 0, 1, 1,
0.6248816, -0.8309495, 3.086149, 1, 0, 0, 1, 1,
0.6327205, -1.209853, 3.477362, 1, 0, 0, 1, 1,
0.6331, -0.5055329, 2.250344, 1, 0, 0, 1, 1,
0.6331567, 1.377644, 1.248398, 0, 0, 0, 1, 1,
0.6340543, -0.705157, 2.242955, 0, 0, 0, 1, 1,
0.6348138, 0.8164907, 2.403792, 0, 0, 0, 1, 1,
0.6366134, 0.8863789, 1.515704, 0, 0, 0, 1, 1,
0.6366957, 1.15154, 1.66529, 0, 0, 0, 1, 1,
0.6414664, 1.839129, -0.8334127, 0, 0, 0, 1, 1,
0.6427506, 0.8706051, -1.006508, 0, 0, 0, 1, 1,
0.648542, -1.056615, 4.677588, 1, 1, 1, 1, 1,
0.650751, 0.8552006, 0.3276487, 1, 1, 1, 1, 1,
0.655562, -1.018139, 3.592193, 1, 1, 1, 1, 1,
0.6576032, 0.05231098, 1.62896, 1, 1, 1, 1, 1,
0.6598818, -0.4411138, 2.184303, 1, 1, 1, 1, 1,
0.6610627, -2.305275, 3.609652, 1, 1, 1, 1, 1,
0.6661678, -1.077221, 2.476102, 1, 1, 1, 1, 1,
0.6669764, 0.3663467, 0.9301921, 1, 1, 1, 1, 1,
0.6679719, -0.3711176, 0.3383761, 1, 1, 1, 1, 1,
0.672205, -0.5227523, 2.441485, 1, 1, 1, 1, 1,
0.6801251, 1.726027, 1.129055, 1, 1, 1, 1, 1,
0.691155, 0.3753759, 0.09504589, 1, 1, 1, 1, 1,
0.691447, 0.7790852, 1.607823, 1, 1, 1, 1, 1,
0.6918125, 1.066602, 1.590289, 1, 1, 1, 1, 1,
0.6928203, 1.124896, 1.274485, 1, 1, 1, 1, 1,
0.6963794, -3.132597, 2.981286, 0, 0, 1, 1, 1,
0.6964445, -1.834684, 1.881717, 1, 0, 0, 1, 1,
0.7003434, -1.084107, 4.662558, 1, 0, 0, 1, 1,
0.7027159, -0.1991425, 1.974727, 1, 0, 0, 1, 1,
0.7038342, 0.7675474, -0.5677295, 1, 0, 0, 1, 1,
0.7048921, -0.06977864, 1.8397, 1, 0, 0, 1, 1,
0.70731, 0.5334464, 2.879354, 0, 0, 0, 1, 1,
0.7101614, -1.369053, 3.299659, 0, 0, 0, 1, 1,
0.7133765, -1.493255, 3.665254, 0, 0, 0, 1, 1,
0.7203187, 0.8206747, 0.5459062, 0, 0, 0, 1, 1,
0.7216425, 0.06086981, 1.102018, 0, 0, 0, 1, 1,
0.7218224, -1.596412, 1.937448, 0, 0, 0, 1, 1,
0.7332447, -0.243622, -0.3192676, 0, 0, 0, 1, 1,
0.7358152, 2.267552, -0.4188631, 1, 1, 1, 1, 1,
0.7364081, 0.4466046, 0.7688641, 1, 1, 1, 1, 1,
0.7396505, 1.121808, 1.58041, 1, 1, 1, 1, 1,
0.7409369, 1.461295, 0.09754436, 1, 1, 1, 1, 1,
0.7523296, -0.9339285, -0.005274596, 1, 1, 1, 1, 1,
0.7523468, -1.083216, 1.664342, 1, 1, 1, 1, 1,
0.7595391, 0.6228191, -1.775254, 1, 1, 1, 1, 1,
0.765858, -1.621329, 2.843826, 1, 1, 1, 1, 1,
0.7730042, 2.163181, 0.3489506, 1, 1, 1, 1, 1,
0.7730835, 0.1613222, 1.773664, 1, 1, 1, 1, 1,
0.778177, 1.113024, -1.248962, 1, 1, 1, 1, 1,
0.7812385, -0.586174, 1.747476, 1, 1, 1, 1, 1,
0.7813325, 0.7287319, 0.4819342, 1, 1, 1, 1, 1,
0.7818957, -0.5366629, 2.416723, 1, 1, 1, 1, 1,
0.7861376, -0.8233121, 2.078904, 1, 1, 1, 1, 1,
0.7909968, -0.6913843, 1.577983, 0, 0, 1, 1, 1,
0.7962576, 0.8078095, 1.250066, 1, 0, 0, 1, 1,
0.796552, -0.5106477, 2.218973, 1, 0, 0, 1, 1,
0.797909, 1.044069, -1.631183, 1, 0, 0, 1, 1,
0.8013672, 0.4895809, 1.512118, 1, 0, 0, 1, 1,
0.8017251, -0.4962265, 3.034576, 1, 0, 0, 1, 1,
0.8070122, 1.937969, -1.871683, 0, 0, 0, 1, 1,
0.8080691, 0.2299612, 2.341976, 0, 0, 0, 1, 1,
0.810132, -0.7609982, 1.325865, 0, 0, 0, 1, 1,
0.8243006, 2.337715, 2.15937, 0, 0, 0, 1, 1,
0.8255363, 0.1971929, 1.426319, 0, 0, 0, 1, 1,
0.8256441, -1.890428, 3.658567, 0, 0, 0, 1, 1,
0.8266467, -0.3973006, 2.273515, 0, 0, 0, 1, 1,
0.828227, 0.7292788, 1.305149, 1, 1, 1, 1, 1,
0.8302883, 0.9449729, 0.5174418, 1, 1, 1, 1, 1,
0.8303174, 0.3685647, 1.073646, 1, 1, 1, 1, 1,
0.8317663, 1.401222, 0.6095086, 1, 1, 1, 1, 1,
0.8382165, -0.4346864, 1.701712, 1, 1, 1, 1, 1,
0.8447376, -0.6650054, 3.102069, 1, 1, 1, 1, 1,
0.8580008, -0.6806478, 3.792053, 1, 1, 1, 1, 1,
0.8599879, -0.1572559, 0.4496551, 1, 1, 1, 1, 1,
0.8627878, -0.853561, 2.903157, 1, 1, 1, 1, 1,
0.8656482, 1.454447, -1.383507, 1, 1, 1, 1, 1,
0.8668276, -0.1843452, 3.408367, 1, 1, 1, 1, 1,
0.8671401, 0.0798125, 2.457309, 1, 1, 1, 1, 1,
0.8741784, -0.2630402, 2.979045, 1, 1, 1, 1, 1,
0.8814018, 0.06657105, 1.860482, 1, 1, 1, 1, 1,
0.8883996, 0.42338, 2.357079, 1, 1, 1, 1, 1,
0.8912216, -0.2950967, 1.607298, 0, 0, 1, 1, 1,
0.8959157, 0.2626017, 2.950321, 1, 0, 0, 1, 1,
0.897891, 0.4355137, 1.132038, 1, 0, 0, 1, 1,
0.9000567, -0.4622235, 2.297725, 1, 0, 0, 1, 1,
0.9018351, -0.2164597, 1.988893, 1, 0, 0, 1, 1,
0.9028575, -0.4348361, 1.955553, 1, 0, 0, 1, 1,
0.9030102, 1.454128, 1.090111, 0, 0, 0, 1, 1,
0.9042856, 1.73409, 1.774087, 0, 0, 0, 1, 1,
0.9147934, -0.4621059, 2.658637, 0, 0, 0, 1, 1,
0.916719, 0.2181805, 1.815778, 0, 0, 0, 1, 1,
0.9252823, -2.463879, 2.831609, 0, 0, 0, 1, 1,
0.926955, -1.546182, 3.354394, 0, 0, 0, 1, 1,
0.9308237, -0.6430189, 1.81153, 0, 0, 0, 1, 1,
0.9340519, 0.7570062, 0.9171393, 1, 1, 1, 1, 1,
0.938733, -0.05946972, 1.837018, 1, 1, 1, 1, 1,
0.93943, 1.506406, 1.815027, 1, 1, 1, 1, 1,
0.9539143, -1.394907, 1.92391, 1, 1, 1, 1, 1,
0.9577208, -1.973586, 2.02605, 1, 1, 1, 1, 1,
0.9673025, -0.5578168, 2.006879, 1, 1, 1, 1, 1,
0.9680255, -0.734586, 2.212887, 1, 1, 1, 1, 1,
0.9729804, -0.1677525, 2.10734, 1, 1, 1, 1, 1,
0.9743083, -0.4167115, 1.653551, 1, 1, 1, 1, 1,
0.9771364, -1.539742, 3.280011, 1, 1, 1, 1, 1,
0.9811524, -2.505354, 3.709025, 1, 1, 1, 1, 1,
0.9827582, -0.1695181, 1.942677, 1, 1, 1, 1, 1,
0.9848952, 2.089226, -0.9301181, 1, 1, 1, 1, 1,
0.9969128, -1.060808, 1.658945, 1, 1, 1, 1, 1,
0.9979337, 0.4130999, 2.372494, 1, 1, 1, 1, 1,
1.001912, -1.506112, 1.556287, 0, 0, 1, 1, 1,
1.004393, -0.8954418, 2.209764, 1, 0, 0, 1, 1,
1.005177, 1.534896, 0.5266685, 1, 0, 0, 1, 1,
1.00861, -0.3288299, 2.01679, 1, 0, 0, 1, 1,
1.017025, 0.8080575, -0.7332113, 1, 0, 0, 1, 1,
1.017134, 0.6419196, 1.037467, 1, 0, 0, 1, 1,
1.03324, -0.4188717, 4.311221, 0, 0, 0, 1, 1,
1.033803, -0.6658325, 1.403364, 0, 0, 0, 1, 1,
1.036929, -0.4957762, 2.559381, 0, 0, 0, 1, 1,
1.037338, -0.09222238, 1.542928, 0, 0, 0, 1, 1,
1.037819, -0.8054035, 0.320707, 0, 0, 0, 1, 1,
1.043934, 0.5589429, 0.3765841, 0, 0, 0, 1, 1,
1.048676, -0.3855858, 0.6862693, 0, 0, 0, 1, 1,
1.049453, -0.1774952, 1.288385, 1, 1, 1, 1, 1,
1.058635, 0.328408, 1.600049, 1, 1, 1, 1, 1,
1.05994, -0.653797, 1.543988, 1, 1, 1, 1, 1,
1.069087, 0.03861268, 1.986003, 1, 1, 1, 1, 1,
1.069668, -1.212494, 3.809063, 1, 1, 1, 1, 1,
1.071745, -0.851666, 1.265908, 1, 1, 1, 1, 1,
1.07315, 0.6303731, 1.042152, 1, 1, 1, 1, 1,
1.079459, -0.5132636, 1.819191, 1, 1, 1, 1, 1,
1.095223, -0.8891276, 2.930996, 1, 1, 1, 1, 1,
1.099641, -1.81067, 3.04169, 1, 1, 1, 1, 1,
1.102867, 0.159221, -0.1313929, 1, 1, 1, 1, 1,
1.104479, -1.331464, 4.40385, 1, 1, 1, 1, 1,
1.106657, -0.159968, 1.358109, 1, 1, 1, 1, 1,
1.109612, -0.9758806, 3.743453, 1, 1, 1, 1, 1,
1.120862, -0.001190023, 0.9309634, 1, 1, 1, 1, 1,
1.122184, 0.9509454, -0.0973498, 0, 0, 1, 1, 1,
1.124128, -0.6110338, 2.91568, 1, 0, 0, 1, 1,
1.124771, 1.051175, 1.081591, 1, 0, 0, 1, 1,
1.133854, 1.564038, -1.601106, 1, 0, 0, 1, 1,
1.136877, 1.790076, 1.406072, 1, 0, 0, 1, 1,
1.13963, -0.550149, 3.972271, 1, 0, 0, 1, 1,
1.141176, 0.04489855, 1.23984, 0, 0, 0, 1, 1,
1.142092, 0.3264742, -0.8194606, 0, 0, 0, 1, 1,
1.150226, 0.3851503, 0.3698802, 0, 0, 0, 1, 1,
1.158563, 0.2544537, 0.9884968, 0, 0, 0, 1, 1,
1.159078, 0.751092, 2.719344, 0, 0, 0, 1, 1,
1.159258, 0.9502698, -1.662068, 0, 0, 0, 1, 1,
1.164136, -0.1989481, 1.009052, 0, 0, 0, 1, 1,
1.168325, 0.09481239, 1.403441, 1, 1, 1, 1, 1,
1.17735, -1.530591, 2.654578, 1, 1, 1, 1, 1,
1.181299, 3.11676, -0.3751241, 1, 1, 1, 1, 1,
1.188296, 0.9824015, 1.611678, 1, 1, 1, 1, 1,
1.202611, -0.04924955, 2.772748, 1, 1, 1, 1, 1,
1.204445, 0.8450264, 0.7496496, 1, 1, 1, 1, 1,
1.21323, 0.4837888, 2.911901, 1, 1, 1, 1, 1,
1.21563, 0.7693029, -0.645609, 1, 1, 1, 1, 1,
1.217066, 1.961465, 0.9425108, 1, 1, 1, 1, 1,
1.217365, -0.5372995, 2.791514, 1, 1, 1, 1, 1,
1.219407, -0.54562, 0.417675, 1, 1, 1, 1, 1,
1.231336, 1.302798, 0.4233226, 1, 1, 1, 1, 1,
1.235978, -1.167623, 1.980345, 1, 1, 1, 1, 1,
1.245371, 2.119628, 0.7548212, 1, 1, 1, 1, 1,
1.246024, -0.3286899, 1.940271, 1, 1, 1, 1, 1,
1.25207, 0.5918374, 2.197469, 0, 0, 1, 1, 1,
1.259993, -0.5789427, 4.196864, 1, 0, 0, 1, 1,
1.271906, 0.1428692, 1.045495, 1, 0, 0, 1, 1,
1.279372, -0.1953986, 2.640864, 1, 0, 0, 1, 1,
1.280713, 1.27076, 1.49132, 1, 0, 0, 1, 1,
1.280777, -0.3340911, 0.2887441, 1, 0, 0, 1, 1,
1.281106, -0.5818198, 0.7462429, 0, 0, 0, 1, 1,
1.290765, -1.088925, 0.5681225, 0, 0, 0, 1, 1,
1.3061, 0.9247159, 3.23116, 0, 0, 0, 1, 1,
1.306805, -0.4599345, 2.068807, 0, 0, 0, 1, 1,
1.315996, 0.1532248, 1.406871, 0, 0, 0, 1, 1,
1.317427, 0.8650658, 1.346237, 0, 0, 0, 1, 1,
1.318997, 2.542155, -0.2515796, 0, 0, 0, 1, 1,
1.32247, -0.73248, 2.946556, 1, 1, 1, 1, 1,
1.333031, 1.290934, -0.04830789, 1, 1, 1, 1, 1,
1.333724, -0.7378038, 1.511757, 1, 1, 1, 1, 1,
1.337919, 0.7075816, 1.049463, 1, 1, 1, 1, 1,
1.346738, 1.161969, 1.757322, 1, 1, 1, 1, 1,
1.351289, 0.6156015, 0.5669954, 1, 1, 1, 1, 1,
1.355239, -1.760534, 1.008902, 1, 1, 1, 1, 1,
1.36159, -0.995156, 0.3624636, 1, 1, 1, 1, 1,
1.364357, -1.005448, 1.445088, 1, 1, 1, 1, 1,
1.366877, 1.002392, 1.123092, 1, 1, 1, 1, 1,
1.370797, -0.8014418, 1.567688, 1, 1, 1, 1, 1,
1.379649, 0.8629501, 0.1159084, 1, 1, 1, 1, 1,
1.383508, 0.2147722, 0.5444757, 1, 1, 1, 1, 1,
1.387568, -0.7643998, 1.037593, 1, 1, 1, 1, 1,
1.396341, 0.5484912, 1.58952, 1, 1, 1, 1, 1,
1.403327, 1.000051, 0.8344585, 0, 0, 1, 1, 1,
1.40692, -0.7457401, 3.70537, 1, 0, 0, 1, 1,
1.411594, 0.02597616, 1.070446, 1, 0, 0, 1, 1,
1.417906, -1.564093, 1.68558, 1, 0, 0, 1, 1,
1.427776, -0.03382089, 2.230999, 1, 0, 0, 1, 1,
1.450276, -1.3462, 0.3646025, 1, 0, 0, 1, 1,
1.45229, 0.9861418, 1.323227, 0, 0, 0, 1, 1,
1.460271, -1.67347, 2.697889, 0, 0, 0, 1, 1,
1.466364, 0.5752203, 2.28203, 0, 0, 0, 1, 1,
1.469982, 3.072306, -1.072402, 0, 0, 0, 1, 1,
1.487074, -0.4667821, 1.932027, 0, 0, 0, 1, 1,
1.495193, -0.2473048, 2.013065, 0, 0, 0, 1, 1,
1.511623, 0.9351201, 1.624192, 0, 0, 0, 1, 1,
1.521286, 1.452322, 1.191806, 1, 1, 1, 1, 1,
1.531069, 1.066504, 0.362296, 1, 1, 1, 1, 1,
1.536652, -0.7139516, 3.69868, 1, 1, 1, 1, 1,
1.538446, 0.7385482, 0.5379421, 1, 1, 1, 1, 1,
1.549398, -1.654971, 2.459207, 1, 1, 1, 1, 1,
1.555304, 0.6051789, 0.5178602, 1, 1, 1, 1, 1,
1.573784, 0.1106129, 1.015853, 1, 1, 1, 1, 1,
1.579445, -0.6453922, 2.148672, 1, 1, 1, 1, 1,
1.582867, 2.556008, 1.477799, 1, 1, 1, 1, 1,
1.597297, -0.1983422, 1.301667, 1, 1, 1, 1, 1,
1.600791, -0.9014212, 2.760863, 1, 1, 1, 1, 1,
1.602309, 0.3688955, 3.48243, 1, 1, 1, 1, 1,
1.608875, 0.6042504, 1.59611, 1, 1, 1, 1, 1,
1.612046, 0.04539594, 2.600292, 1, 1, 1, 1, 1,
1.623082, -0.1762045, 2.086043, 1, 1, 1, 1, 1,
1.623898, -1.039903, 2.542782, 0, 0, 1, 1, 1,
1.640137, 0.7795824, -0.5194584, 1, 0, 0, 1, 1,
1.643457, 0.3864811, 1.520768, 1, 0, 0, 1, 1,
1.653795, 1.074645, 1.342492, 1, 0, 0, 1, 1,
1.679531, -0.1613673, 2.263631, 1, 0, 0, 1, 1,
1.686177, 0.02307963, -0.01514816, 1, 0, 0, 1, 1,
1.686373, 1.326422, 1.571773, 0, 0, 0, 1, 1,
1.697222, 0.2262083, 0.06260804, 0, 0, 0, 1, 1,
1.708426, 0.4811241, 3.616791, 0, 0, 0, 1, 1,
1.709934, -1.654912, 2.797236, 0, 0, 0, 1, 1,
1.720732, 0.6571977, 1.437967, 0, 0, 0, 1, 1,
1.722824, 0.4381657, -0.4949342, 0, 0, 0, 1, 1,
1.727275, 1.956396, -0.4004668, 0, 0, 0, 1, 1,
1.729477, 0.3968091, 0.6114641, 1, 1, 1, 1, 1,
1.733623, 1.127251, -0.8851451, 1, 1, 1, 1, 1,
1.739055, -0.112681, 1.669557, 1, 1, 1, 1, 1,
1.746087, 0.9870812, 1.643203, 1, 1, 1, 1, 1,
1.747337, -0.4910717, 1.386437, 1, 1, 1, 1, 1,
1.762721, -1.008881, 1.642431, 1, 1, 1, 1, 1,
1.783139, -1.116119, 1.041294, 1, 1, 1, 1, 1,
1.795809, 0.481313, 1.548146, 1, 1, 1, 1, 1,
1.820742, 0.3216477, 0.2397055, 1, 1, 1, 1, 1,
1.872527, 0.2755449, 2.064186, 1, 1, 1, 1, 1,
1.876248, 2.049515, 1.67911, 1, 1, 1, 1, 1,
1.92091, -1.348112, 1.71197, 1, 1, 1, 1, 1,
1.921876, 0.2787461, 1.552621, 1, 1, 1, 1, 1,
1.92418, -0.8308468, 2.139235, 1, 1, 1, 1, 1,
1.944588, -0.1864018, 0.8770463, 1, 1, 1, 1, 1,
1.950426, 2.093905, 1.310914, 0, 0, 1, 1, 1,
1.970682, 0.4235564, 1.309914, 1, 0, 0, 1, 1,
1.986451, -0.1839248, 1.992447, 1, 0, 0, 1, 1,
2.021041, 0.07347892, 1.527855, 1, 0, 0, 1, 1,
2.066645, 0.4173077, 2.914498, 1, 0, 0, 1, 1,
2.070543, 1.003567, 2.151884, 1, 0, 0, 1, 1,
2.078938, 1.684, 1.348266, 0, 0, 0, 1, 1,
2.083368, -0.6152941, -0.4413459, 0, 0, 0, 1, 1,
2.083774, -0.5726577, 2.095959, 0, 0, 0, 1, 1,
2.122975, -0.3274626, 1.909109, 0, 0, 0, 1, 1,
2.132602, 0.5021829, 1.254905, 0, 0, 0, 1, 1,
2.139411, 0.008992359, 2.009393, 0, 0, 0, 1, 1,
2.188594, -1.240485, 2.829011, 0, 0, 0, 1, 1,
2.19769, 0.008894335, 0.9469331, 1, 1, 1, 1, 1,
2.332363, -0.7001998, 2.844894, 1, 1, 1, 1, 1,
2.364633, -1.55627, 1.195145, 1, 1, 1, 1, 1,
2.396271, 1.899065, 0.5619311, 1, 1, 1, 1, 1,
2.520844, -0.04136214, 2.870217, 1, 1, 1, 1, 1,
2.541799, 0.3554329, 1.35684, 1, 1, 1, 1, 1,
2.959882, 0.5209227, 1.050455, 1, 1, 1, 1, 1
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
var radius = 9.525535;
var distance = 33.45804;
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
mvMatrix.translate( 0.1375064, 0.2043891, 0.4684362 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45804);
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
